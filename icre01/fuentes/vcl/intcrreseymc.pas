// Sistema         : Clase de CRRESEYMCALIF
// Fecha de Inicio : 24/07/2012
// Función forma   : Clase de CRRESEYMCALIF
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrResEyMC;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, ComObj, IntQrResEyMC;

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

type
  TCrResEyMC = class;

  TWCrResEyMCalif = class(TForm)
    InterForma1: TInterForma;
    Panel1: TPanel;
    Label1: TLabel;
    sbExportar: TSpeedButton;
    dpFecha: TDateTimePicker;
    btBusca: TBitBtn;
    SGReservas: TSGCtrl;
    SaveXLS: TSaveDialog;
    QReservasCalif: TQuery;
    QReservasCalifGrupo: TStringField;
    QReservasCalifLab_Calific: TStringField;
    QReservasCalifG1: TFloatField;
    QReservasCalifPct_4TYAnt_Estatal: TFloatField;
    QReservasCalifPct_4TYAnt_Municipal: TFloatField;
    QReservasCalifPct_4TYAnt_Org_Desc: TFloatField;
    QReservasCalifPct_4TYAnt_Calific: TFloatField;
    QReservasCalifPct_Act_Estatal: TFloatField;
    QReservasCalifPct_Act_Municipal: TFloatField;
    QReservasCalifPct_Act_Org_Desc: TFloatField;
    QReservasCalifPct_Act_Calific: TFloatField;
    QReservasCalifPct_4TYAct_Estatal: TFloatField;
    QReservasCalifPct_4TYAct_Municipal: TFloatField;
    QReservasCalifPct_4TYAct_Org_Desc: TFloatField;
    QReservasCalifPct_4TYAct_Calific: TFloatField;
    sbExportarDetalle: TSpeedButton;
    QDetalle: TQuery;
    cbCartasCredito: TCheckBox;
    cbInteresesAnticipados: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure btBuscaClick(Sender: TObject);
    procedure SGReservasCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure InterForma1BtnAyudaClick(Sender: TObject);
    procedure sbExportarDetalleClick(Sender: TObject);
  private
    { Private declarations }
    procedure GeneraConsulta;
    procedure AdjustColWidth (Sender: TObject);
    procedure ExportarXLS (FileName: string);
    procedure ExportarXLSDetalle (FileName: string);
  public
    { Public declarations }
    Objeto : TCrResEyMC;
  end;

  TCrResEyMC= class(TInterFrame)
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


constructor TCrResEyMC.Create( AOwner : TComponent );
begin
  Inherited;
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntCrreseymc.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrResEyMC.Destroy;
begin
  inherited;
end;


function TCrResEyMC.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W: TWCrResEyMCalif;
begin
   W := TWCrResEyMCalif.Create(Self);
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


Function TCrResEyMC.InternalBusca: boolean;
var
  T: TInterFindit;
begin
  InternalBusca := False;
  T             := CreaBuscador('ICrresey.it','');
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

function TCrResEyMC.Reporte:Boolean;
begin //Execute_Reporte();
end;

function BoolToStr (b: boolean): string;
begin
  if b then
    result := 'V'
  else
    result := 'F';
end;
(***********************************************FORMA CRRESEYMCALIF********************)
(*                                                                              *)
(*  FORMA DE CRRESEYMCALIF                                                            *)
(*                                                                              *)
(***********************************************FORMA CRRESEYMCALIF********************)

procedure TWCrResEyMCalif.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrResEyMCalif.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrResEyMCalif.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrResEyMCalif.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;

procedure TWCrResEyMCalif.FormShow(Sender: TObject);
begin
  InterForma1.btnAyuda.Caption := '&Imprimir';
  dpFecha.Date                 := Objeto.Apli.DameFechaEmpresa;
  GeneraConsulta;
end;

procedure TWCrResEyMCalif.btBuscaClick(Sender: TObject);
begin
  GeneraConsulta;
end;

procedure TWCrResEyMCalif.AdjustColWidth (Sender: TObject);

  function CenterStr (s: string; ColChars: integer): string;
  var
    List: TStringList;
    MaxWidth, Dif: double;
    SpaceWidth, i, j, NewSpaces: integer;
  begin
    result    := '';
    List      := TStringList.Create;
    List.Text := s;

    SpaceWidth := SGReservas.SG.Canvas.TextWidth (' ');
    MaxWidth   := SGReservas.SG.Canvas.TextWidth ('M') * ColChars / 1.5;

    try
      for i := 0 to List.Count - 1 do
      begin
        Dif := MaxWidth - SGReservas.SG.Canvas.TextWidth (List [i]);

        if Dif > 0 then
        begin
          NewSpaces := Round (Dif / SpaceWidth);

          for j := 1 to NewSpaces div 2 do
            List [i] := ' ' + List [i];
        end;

      end;
    finally
      result := '';
      for i := 0 to List.Count - 1 do
      begin
        result := result + List [i];

        if i < (List.Count - 1) then
          result := result + #13#10;
      end;
      List.Free;
    end;
  end;

var
  Year, Month, Day: word;

begin
  DecodeDate (dpFecha.Date, Year, Month, Day);

  QReservasCalifPct_4TYAnt_Estatal.DisplayLabel   := CenterStr ('Gob Estatal'   + #13#10 + '4T' + IntToStr (Year - 1), QReservasCalifPct_4TYAnt_Estatal.DisplayWidth);
  QReservasCalifPct_4TYAnt_Municipal.DisplayLabel := CenterStr ('Gob Municipal' + #13#10 + '4T' + IntToStr (Year - 1), QReservasCalifPct_4TYAnt_Municipal.DisplayWidth);
  QReservasCalifPct_4TYAnt_Org_Desc.DisplayLabel  := CenterStr ('OD'            + #13#10 + '4T' + IntToStr (Year - 1), QReservasCalifPct_4TYAnt_Org_Desc.DisplayWidth);
  QReservasCalifPct_4TYAnt_Calific.DisplayLabel   := CenterStr ('Total'         + #13#10 + '4T' + IntToStr (Year - 1), QReservasCalifPct_4TYAnt_Calific.DisplayWidth);

  QReservasCalifPct_Act_Estatal.DisplayLabel      := CenterStr ('Gob Estatal'   + #13#10 + FormatDateTime ('dd/mm/yyyy', dpFecha.Date), QReservasCalifPct_Act_Estatal.DisplayWidth);
  QReservasCalifPct_Act_Municipal.DisplayLabel    := CenterStr ('Gob Municipal' + #13#10 + FormatDateTime ('dd/mm/yyyy', dpFecha.Date), QReservasCalifPct_Act_Municipal.DisplayWidth);
  QReservasCalifPct_Act_Org_Desc.DisplayLabel     := CenterStr ('OD'            + #13#10 + FormatDateTime ('dd/mm/yyyy', dpFecha.Date), QReservasCalifPct_Act_Org_Desc.DisplayWidth);
  QReservasCalifPct_Act_Calific.DisplayLabel      := CenterStr ('Total'         + #13#10 + FormatDateTime ('dd/mm/yyyy', dpFecha.Date), QReservasCalifPct_Act_Calific.DisplayWidth);

  QReservasCalifPct_4TYAct_Estatal.DisplayLabel   := CenterStr ('Gob Estatal'   + #13#10 + 'Presupuesto ' + IntToStr (Year), QReservasCalifPct_4TYAct_Estatal.DisplayWidth);
  QReservasCalifPct_4TYAct_Municipal.DisplayLabel := CenterStr ('Gob Municipal' + #13#10 + 'Presupuesto ' + IntToStr (Year), QReservasCalifPct_4TYAct_Municipal.DisplayWidth);
  QReservasCalifPct_4TYAct_Org_Desc.DisplayLabel  := CenterStr ('OD'            + #13#10 + 'Presupuesto ' + IntToStr (Year), QReservasCalifPct_4TYAct_Org_Desc.DisplayWidth);
  QReservasCalifPct_4TYAct_Calific.DisplayLabel   := CenterStr ('Total'         + #13#10 + 'Presupuesto ' + IntToStr (Year), QReservasCalifPct_4TYAct_Calific.DisplayWidth);

  QReservasCalifPct_4TYAnt_Estatal  .Alignment    := taCenter;
  QReservasCalifPct_4TYAnt_Municipal.Alignment    := taCenter;
  QReservasCalifPct_4TYAnt_Org_Desc .Alignment    := taCenter;
  QReservasCalifPct_4TYAnt_Calific  .Alignment    := taCenter;

  QReservasCalifPct_Act_Estatal     .Alignment    := taCenter;
  QReservasCalifPct_Act_Municipal   .Alignment    := taCenter;
  QReservasCalifPct_Act_Org_Desc    .Alignment    := taCenter;
  QReservasCalifPct_Act_Calific     .Alignment    := taCenter;

  QReservasCalifPct_4TYAct_Estatal  .Alignment    := taCenter;
  QReservasCalifPct_4TYAct_Municipal.Alignment    := taCenter;
  QReservasCalifPct_4TYAct_Org_Desc .Alignment    := taCenter;
  QReservasCalifPct_4TYAct_Calific  .Alignment    := taCenter;
end;

procedure TWCrResEyMCalif.GeneraConsulta;
begin
  QReservasCalif.Close;
  QReservasCalif.DatabaseName                            := Objeto.Apli.DataBaseName;
  QReservasCalif.SessionName                             := Objeto.Apli.SessionName;
  QReservasCalif.ParamByName ('peFecha').AsDate          := dpFecha.Date - 1;
  QReservasCalif.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
  QReservasCalif.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
  QReservasCalif.Open;
  AdjustColWidth (SGReservas);

  SGReservas.BeginGrid;

  SGReservas.Titulo1 := Caption;
  SGReservas.EndCaption;

  SGReservas.AddQry(QReservasCalif, // Query
        True, // Iniciar Grid, Limpiar Lineas Anteriores.
        True, // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
        -1,   // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
        -1,  // Alto del Header, -1 es el Default 32 Columnas
        -1,// Alto del las Lineas, 1 es el Default 32
        True); // ShowTitle

  SGReservas.ShowTab          := True;
  SGReservas.ShowBtnFirst     := True;
  SGReservas.ShowBtnLast      := True;
  SGReservas.ShowBtnPriorNext := True;
  SGReservas.EndGrid;
end;

procedure TWCrResEyMCalif.ExportarXLS (FileName: string);
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

{xlVerticalAlignment}
  xlDistributed = -4117;  

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
  xlPie               =     5;

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
  Row, LastRow, i, j, YIni, XIni, XFin: integer;
  Col: Char;
  Grupo, RangoDet, RangoSum: string;
  LimiteDet, LimiteSum: ListLimite;

  procedure BorderRange (RangeStr: string; ColorIndex: integer = 0);
  begin
    Range                                        := XLSheet.Range [RangeStr];

    Range.Borders [xlDiagonalDown].LineStyle     := xlNone;
    Range.Borders [xlDiagonalUp].LineStyle       := xlNone;

    Range.Borders [xlEdgeLeft].LineStyle         := xlContinuous;
    if ColorIndex = 0 then
      Range.Borders [xlEdgeLeft].ColorIndex      := ColorIndex
    else
      Range.Borders [xlEdgeLeft].ThemeColor      := ColorIndex;
    Range.Borders [xlEdgeLeft].TintAndShade      := 0;
    Range.Borders [xlEdgeLeft].Weight            := xlThin;

    Range.Borders [xlEdgeTop].LineStyle          := xlContinuous;
    if ColorIndex = 0 then
      Range.Borders [xlEdgeTop].ColorIndex       := ColorIndex
    else
      Range.Borders [xlEdgeTop].ThemeColor         := ColorIndex;
    Range.Borders [xlEdgeTop].TintAndShade       := 0;
    Range.Borders [xlEdgeTop].Weight             := xlThin;

    Range.Borders [xlEdgeBottom].LineStyle       := xlContinuous;
    if ColorIndex = 0 then
      Range.Borders [xlEdgeBottom].ColorIndex    := ColorIndex
    else
      Range.Borders [xlEdgeBottom].ThemeColor    := ColorIndex;
    Range.Borders [xlEdgeBottom].TintAndShade    := 0;
    Range.Borders [xlEdgeBottom].Weight          := xlThin;

    Range.Borders [xlEdgeRight].LineStyle        := xlContinuous;
    if ColorIndex = 0 then
      Range.Borders [xlEdgeRight].ColorIndex     := ColorIndex
    else
      Range.Borders [xlEdgeRight].ThemeColor     := ColorIndex;
    Range.Borders [xlEdgeRight].TintAndShade     := 0;
    Range.Borders [xlEdgeRight].Weight           := xlThin;

    Range.Borders [xlInsideVertical].LineStyle   := xlNone;
    Range.Borders [xlInsideHorizontal].LineStyle := xlNone;
  end;

  function Replace (s, sFrom, sTo: string): string;
  var
    p: integer;
  begin
    result := s;
    p      := Pos (sFrom, s);

    if p = 0 then
      exit;

    while p <> 0 do
    begin
      Delete (result, p, Length (sFrom));
      Insert (sTo, result, p);

      p := Pos (sFrom, result);
    end;
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
    XLSheet.Name := 'Tabla';

    {Encabezado del reporte}
    XLSheet.Cells [1, 1].Formula := Caption;  // Título del reporte
    XLSheet.Range ['A1:P1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Range ['B2:P2'].Merge;
    XLSheet.Range ['B2'].HorizontalAlignment := xlHAlignRight;

    if cbCartasCredito.Checked then
      XLSheet.Cells [3, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [3, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [3, 9].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [3, 9].Formula := 'No incluye intereses cobrados por anticipado';

    XLSheet.Range ['A3:H3'].Merge;
    XLSheet.Range ['I3:P3'].Merge;

    XLSheet.Cells [5,  1].Formula := 'Calificación';
    XLSheet.Cells [4,  3].Formula := FormatDateTime ('"al "dd" de "mmmm" del "yyyy', dpFecha.Date);
    XLSheet.Cells [5,  3].Formula := 'Gobierno Estatal';
    XLSheet.Cells [5,  4].Formula := 'Gobierno Municipal';
    XLSheet.Cells [5,  5].Formula := 'OD';
    XLSheet.Cells [5,  6].Formula := 'Total';
    XLSheet.Cells [4,  8].Formula := Format ('4T%d', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date)) - 1]);
    XLSheet.Cells [5,  8].Formula := 'Gobierno Estatal';
    XLSheet.Cells [5,  9].Formula := 'Gobierno Municipal';
    XLSheet.Cells [5, 10].Formula := 'OD';
    XLSheet.Cells [5, 11].Formula := 'Total';
    XLSheet.Cells [4, 13].Formula := 'Presupuesto ' + FormatDateTime ('yyyy', dpFecha.Date);
    XLSheet.Cells [5, 13].Formula := 'Gobierno Estatal';
    XLSheet.Cells [5, 14].Formula := 'Gobierno Municipal';
    XLSheet.Cells [5, 15].Formula := 'OD';
    XLSheet.Cells [5, 16].Formula := 'Total';

    XLSheet.Range ['C4:F4'].Merge;
    XLSheet.Range ['H4:K4'].Merge;
    XLSheet.Range ['M4:P4'].Merge;

    BorderRange ('C4:F4', 1);
    BorderRange ('H4:K4', 1);
    BorderRange ('M4:P4', 1);

    for Col := 'C' to 'P' do
      if not (Col in ['G', 'L']) then
        BorderRange (Format ('%s5:%s5', [Col, Col]), 1);

    Range                   := XLSheet.Range ['A5:P5'];
    Range.VerticalAlignment := xlDistributed;

    Range                     := XLSheet.Range ['C4:F5'];
    Range.HorizontalAlignment := xlHAlignCenter;
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Range                     := XLSheet.Range ['H4:K5'];
    Range.HorizontalAlignment := xlHAlignCenter;
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Range                     := XLSheet.Range ['M4:P5'];
    Range.HorizontalAlignment := xlHAlignCenter;
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    XLSheet.Range ['A1:P5'].Font.Bold := True;

    Row     := 7;
    LastRow := Row;
    Grupo   := '';
    QReservasCalif.First;

    SetLength (LimiteDet, 0);
    SetLength (LimiteSum, 0);

    while not QReservasCalif.Eof do
    begin
      XLSheet.Cells [Row,  1].Formula := QReservasCalif.FieldByName ('Lab_Calific').AsString;
      XLSheet.Cells [Row,  3].Value   := QReservasCalif.FieldByName ('Pct_Act_Estatal').AsFloat      / 100;
      XLSheet.Cells [Row,  4].Value   := QReservasCalif.FieldByName ('Pct_Act_Municipal').AsFloat    / 100;
      XLSheet.Cells [Row,  5].Value   := QReservasCalif.FieldByName ('Pct_Act_Org_Desc').AsFloat     / 100;
      XLSheet.Cells [Row,  6].Value   := QReservasCalif.FieldByName ('Pct_Act_Calific').AsFloat      / 100;
      XLSheet.Cells [Row,  8].Value   := QReservasCalif.FieldByName ('Pct_4TYAnt_Estatal').AsFloat   / 100;
      XLSheet.Cells [Row,  9].Value   := QReservasCalif.FieldByName ('Pct_4TYAnt_Municipal').AsFloat / 100;
      XLSheet.Cells [Row, 10].Value   := QReservasCalif.FieldByName ('Pct_4TYAnt_Org_Desc').AsFloat  / 100;
      XLSheet.Cells [Row, 11].Value   := QReservasCalif.FieldByName ('Pct_4TYAnt_Calific').AsFloat   / 100;
      XLSheet.Cells [Row, 13].Value   := QReservasCalif.FieldByName ('Pct_4TYAct_Estatal').AsFloat   / 100;
      XLSheet.Cells [Row, 14].Value   := QReservasCalif.FieldByName ('Pct_4TYAct_Municipal').AsFloat / 100;
      XLSheet.Cells [Row, 15].Value   := QReservasCalif.FieldByName ('Pct_4TYAct_Org_Desc').AsFloat  / 100;
      XLSheet.Cells [Row, 16].Value   := QReservasCalif.FieldByName ('Pct_4TYAct_Calific').AsFloat   / 100;
      LastRow := Row;

      if Grupo <> QReservasCalif.FieldByName ('Grupo').AsString then
      begin
        SetLength (LimiteDet, Length (LimiteDet) + 1);

        LimiteDet [Length (LimiteDet) - 1].Inicio := Row;
        LimiteDet [Length (LimiteDet) - 1].Fin    := Row;
      end;

      if (QReservasCalif.FieldByName ('G1').AsFloat = 0) or (QReservasCalif.FieldByName ('Lab_Calific').AsString = 'Exc') then
        LimiteDet [Length (LimiteDet) - 1].Fin    := Row;

      if QReservasCalif.FieldByName ('G1').AsFloat = 1 then
      begin
        XLSheet.Range [Format ('A%d:P%d', [Row, Row])].Font.Bold := True;

        SetLength (LimiteSum, Length (LimiteSum) + 1);
        LimiteSum [Length (LimiteSum) - 1].Inicio := Row;
        LimiteSum [Length (LimiteSum) - 1].Fin    := Row;

        if QReservasCalif.FieldByName ('Lab_Calific').AsString <> 'Exc' then
          XLSheet.Range [Format ('C%d:P%d', [Row - 1 , Row - 1])].Font.Underline := True;

        Inc (Row);
      end;

      Grupo := QReservasCalif.FieldByName ('Grupo').AsString;
      Inc (Row);
      QReservasCalif.Next;
    end;

    Range              := XLSheet.Range [Format ('A7:P%d', [LastRow])];
    Range.Style        := 'Percent';
    Range.NumberFormat := '0.00%';

    for Col := 'C' to 'P' do
      if not (Col in ['G', 'L']) then
        BorderRange (Format ('%s7:%s%d', [Col, Col, LastRow]));

    XLSheet.Columns ['A'].AutoFit;
    XLSheet.Columns ['C:P'].ColumnWidth := 10;
    XLSheet.Columns ['B'].ColumnWidth   := 1;
    XLSheet.Columns ['G'].ColumnWidth   := 1;
    XLSheet.Columns ['L'].ColumnWidth   := 1;
    XLSheet.Range ['C7:P22'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['A6'].Select;
    XLApp.ActiveWindow.FreezePanes := True;
    XLSheet.Range ['I3'].HorizontalAlignment := xlHAlignRight;

    {Determina los rangos de las gráficas}
    RangoDet := '=';
    for i := 0 to Length (LimiteDet) - 1 do
      for j := LimiteDet [i].Inicio to LimiteDet [i].Fin do
        RangoDet := RangoDet + Format ('Tabla!$%s$%d,', ['%s', j]);

    Delete (RangoDet, Length (RangoDet), 1);

    RangoSum := '=';
    for i := 0 to Length (LimiteSum) - 1 do
      for j := LimiteSum [i].Inicio to LimiteSum [i].Fin do
        RangoSum := RangoSum + Format ('Tabla!$%s$%d,', ['%s', j]);

    Delete (RangoSum, Length (RangoSum), 1);

    {Genera las gráficas}
    YIni := XLSheet.Cells [Row,  1].Top;
    XFin := XLSheet.Cells [Row, 17].Left;

    {Gráfica del Actual - Desglose}
    Chart                       := XLSheet.ChartObjects.Add (0, YIni, XFin div 3, 250);
    Chart.Chart.HasTitle        := True;
    Chart.Chart.ChartTitle.Text := FormatDateTime ('"al "dd" de "mmmm" del "yyyy" (Desglose)"', dpFecha.Date);

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Gobierno Estatal"';
    Serie.Values  := Replace (RangoDet, '%s', 'C');
    Serie.XValues := Replace (RangoDet, '%s', 'A');

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Gobierno Municipal"';
    Serie.Values  := Replace (RangoDet, '%s', 'D');
    Serie.XValues := Replace (RangoDet, '%s', 'A');

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="OD"';
    Serie.Values  := Replace (RangoDet, '%s', 'E');
    Serie.XValues := Replace (RangoDet, '%s', 'A');

    {Gráfica del 4TYAnt - Desglose}
    Chart                       := XLSheet.ChartObjects.Add ((XFin div 3) + 1, YIni, XFin div 3, 250);
    Chart.Chart.HasTitle        := True;
    Chart.Chart.ChartTitle.Text := Format ('4T%d (Desglose)', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date)) - 1]);

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Gobierno Estatal"';
    Serie.Values  := Replace (RangoDet, '%s', 'H');
    Serie.XValues := Replace (RangoDet, '%s', 'A');

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Gobierno Municipal"';
    Serie.Values  := Replace (RangoDet, '%s', 'I');
    Serie.XValues := Replace (RangoDet, '%s', 'A');

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="OD"';
    Serie.Values  := Replace (RangoDet, '%s', 'J');
    Serie.XValues := Replace (RangoDet, '%s', 'A');

    {Gráfica del 4TYAct - Desglose}
    Chart                       := XLSheet.ChartObjects.Add ((XFin div 3) * 2 + 2, YIni, XFin div 3, 250);
    Chart.Chart.HasTitle        := True;
    Chart.Chart.ChartTitle.Text := Format ('Presupuesto %s (Desglose)', [FormatDateTime ('yyyy', dpFecha.Date)]);

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Gobierno Estatal"';
    Serie.Values  := Replace (RangoDet, '%s', 'M');
    Serie.XValues := Replace (RangoDet, '%s', 'A');

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Gobierno Municipal"';
    Serie.Values  := Replace (RangoDet, '%s', 'N');
    Serie.XValues := Replace (RangoDet, '%s', 'A');

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="OD"';
    Serie.Values  := Replace (RangoDet, '%s', 'O');
    Serie.XValues := Replace (RangoDet, '%s', 'A');

    {Gráfica del Actual - Resumen}
    Chart                       := XLSheet.ChartObjects.Add (0, YIni + 255, XFin div 3, 250);
    Chart.Chart.ChartType       := xlPie;
    Chart.Chart.HasTitle        := True;
    Chart.Chart.ChartTitle.Text := FormatDateTime ('"al "dd" de "mmmm" del "yyyy" (Resumen)"', dpFecha.Date);

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Totales"';
    Serie.Values  := Replace (RangoSum, '%s', 'F');
    Serie.XValues := Replace (RangoSum, '%s', 'A');

    {Gráfica del 4TYAnt - Resumen}
    Chart                       := XLSheet.ChartObjects.Add ((XFin div 3) + 1, YIni + 255, XFin div 3, 250);
    Chart.Chart.ChartType       := xlPie;
    Chart.Chart.HasTitle        := True;
    Chart.Chart.ChartTitle.Text := Format ('4T%d (Resumen)', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date)) - 1]);

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Totales"';
    Serie.Values  := Replace (RangoSum, '%s', 'K');
    Serie.XValues := Replace (RangoSum, '%s', 'A');

    {Gráfica del 4TYAct - Resumen}
    Chart                       := XLSheet.ChartObjects.Add ((XFin div 3) * 2 + 2, YIni + 255, XFin div 3, 250);
    Chart.Chart.ChartType       := xlPie;
    Chart.Chart.HasTitle        := True;
    Chart.Chart.ChartTitle.Text := Format ('Presupuesto %s (Resumen)', [FormatDateTime ('yyyy', dpFecha.Date)]);

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Totales"';
    Serie.Values  := Replace (RangoSum, '%s', 'P');
    Serie.XValues := Replace (RangoSum, '%s', 'A');

  finally
    Cursor := crArrow;
    XLApp.Workbooks[1].SaveAs (FileName);
    XLApp.Quit;
    XLSheet  := Unassigned;
    Range    := Unassigned;
    XLApp    := Unassigned;
  end;
end;

procedure TWCrResEyMCalif.sbExportarClick(Sender: TObject);
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

procedure TWCrResEyMCalif.SGReservasCalcRow(Sendet: TObject;
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

procedure TWCrResEyMCalif.InterForma1BtnAyudaClick(Sender: TObject);
begin
  RepReservasEyMPorCalificacion (dpFecha.Date, cbCartasCredito.Checked, cbInteresesAnticipados.Checked, QReservasCalif, Objeto.Apli, True);
end;

procedure TWCrResEyMCalif.sbExportarDetalleClick(Sender: TObject);
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

procedure TWCrResEyMCalif.ExportarXLSDetalle (FileName: string);
var
  XLApp, XLSheet: Variant;
  Range, Chart, Serie: Variant;
  Row, RowIni, CurrTipo, XFin, YIni: integer;
begin
  QDetalle.Close;
  QDetalle.DatabaseName := Objeto.Apli.DataBaseName;
  QDetalle.SessionName  := Objeto.Apli.SessionName;
  QDetalle.ParamByName ('peFecha').AsDateTime := Trunc (dpFecha.Date - 1);
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
    XLSheet.Range ['A1:N1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Cells [2, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [2, 2].Formula := 'Información expresada en Pesos';
    XLSheet.Range ['B2:N2'].Merge;
    XLSheet.Range ['B2'].HorizontalAlignment := xlHAlignRight;

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

    {Encabezado de las columnas}
    XLSheet.Cells [4, 9].Formula := FormatDateTime ('"al "dd" de "mmmm" del "yyyy', dpFecha.Date);
    XLSheet.Range ['I4:J4'].Merge;
    XLSheet.Cells [4, 11].Formula := Format ('4T%d', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date)) - 1]);
    XLSheet.Range ['K4:L4'].Merge;
    XLSheet.Cells [4, 13].Formula := 'Presupuesto ' + FormatDateTime ('yyyy', dpFecha.Date);
    XLSheet.Range ['M4:N4'].Merge;

    XLSheet.Cells [5,  1].Formula := 'Grupo';
    XLSheet.Range ['A4:A5'].Merge;
    XLSheet.Cells [5,  2].Formula := 'Clave Calificación';
    XLSheet.Range ['B4:B5'].Merge;
    XLSheet.Cells [5,  3].Formula := 'Mercado Objetivo';
    XLSheet.Range ['C4:C5'].Merge;
    XLSheet.Cells [5,  4].Formula := 'ID Acreditado';
    XLSheet.Range ['D4:D5'].Merge;
    XLSheet.Cells [5,  5].Formula := 'Acreditado';
    XLSheet.Range ['E4:E5'].Merge;
    XLSheet.Cells [5,  6].Formula := 'ID Contrato';
    XLSheet.Range ['F4:F5'].Merge;
    XLSheet.Cells [5,  7].Formula := 'ID Crédito';
    XLSheet.Range ['G4:G5'].Merge;
    XLSheet.Cells [5,  8].Formula := 'Tipo Crédito';
    XLSheet.Range ['H4:H5'].Merge;
    XLSheet.Cells [5,  9].Formula := '$';
    XLSheet.Cells [5, 10].Formula := '%';
    XLSheet.Cells [5, 11].Formula := '$';
    XLSheet.Cells [5, 12].Formula := '%';
    XLSheet.Cells [5, 13].Formula := '$';
    XLSheet.Cells [5, 14].Formula := '%';

    XLSheet.Range ['A1:N5'].Font.Bold := True;
    XLSheet.Range ['A4:N5'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['H3'].HorizontalAlignment := xlHAlignRight;

    Range                     := XLSheet.Range ['A4:N5'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row := 6;
    while not QDetalle.Eof do
    begin
      XLSheet.Cells [Row,  1].Value := QDetalle.FieldByName ('Grupo').AsString;
      XLSheet.Cells [Row,  2].Value := QDetalle.FieldByName ('Cve_Calific').AsString;
      XLSheet.Cells [Row,  3].Value := QDetalle.FieldByName ('Desc_Mercado').AsString;
      XLSheet.Cells [Row,  4].Value := QDetalle.FieldByName ('ID_Acreditado').AsFloat;
      XLSheet.Cells [Row,  5].Value := QDetalle.FieldByName ('Nom_Acred_Reg').AsString;
      XLSheet.Cells [Row,  6].Value := QDetalle.FieldByName ('ID_Contrato').AsFloat;
      XLSheet.Cells [Row,  7].Value := QDetalle.FieldByName ('ID_Credito').AsFloat;
      XLSheet.Cells [Row,  8].Value := QDetalle.FieldByName ('Tipo_Credito').AsString;
      XLSheet.Cells [Row,  9].Value := QDetalle.FieldByName ('Imp_Act_Calific').AsFloat;
      XLSheet.Cells [Row, 10].Value := QDetalle.FieldByName ('Pct_Act_Calific').AsFloat;
      XLSheet.Cells [Row, 11].Value := QDetalle.FieldByName ('Imp_4TYAnt_Calific').AsFloat;
      XLSheet.Cells [Row, 12].Value := QDetalle.FieldByName ('Pct_4TYAnt_Calific').AsFloat;
      XLSheet.Cells [Row, 13].Value := QDetalle.FieldByName ('Imp_4TYAct_Calific').AsFloat;
      XLSheet.Cells [Row, 14].Value := QDetalle.FieldByName ('Pct_4TYAct_Calific').AsFloat;

      QDetalle.Next;
      Inc (Row);
    end;

    XLSheet.Columns ['B'].ColumnWidth := 17;
    XLSheet.Columns ['C'].ColumnWidth := 30;
    XLSheet.Columns ['D'].ColumnWidth := 13;
    XLSheet.Columns ['E'].ColumnWidth := 30;
    XLSheet.Columns ['F'].ColumnWidth := 13;
    XLSheet.Columns ['J'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Columns ['L'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Columns ['N'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Columns ['A'].AutoFit;
    XLSheet.Columns ['G:I'].AutoFit;
    XLSheet.Range [Format ('I6:I%d', [Row - 1])].Style        := 'Currency';
    XLSheet.Range [Format ('J6:J%d', [Row - 1])].Style        := 'Percent';
    XLSheet.Range [Format ('J6:J%d', [Row - 1])].NumberFormat := '0.00%';
    XLSheet.Range [Format ('K6:K%d', [Row - 1])].Style        := 'Currency';
    XLSheet.Range [Format ('L6:L%d', [Row - 1])].Style        := 'Percent';
    XLSheet.Range [Format ('L6:L%d', [Row - 1])].NumberFormat := '0.00%';
    XLSheet.Range [Format ('M6:M%d', [Row - 1])].Style        := 'Currency';
    XLSheet.Range [Format ('N6:N%d', [Row - 1])].Style        := 'Percent';
    XLSheet.Range [Format ('N6:N%d', [Row - 1])].NumberFormat := '0.00%';
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

end.
