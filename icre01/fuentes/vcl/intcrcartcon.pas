// Sistema         : Clase de CRCARTCON
// Fecha de Inicio : 04/06/2012
// Función forma   : Clase de CRCARTCON
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
unit IntCrCartCon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntCrQrCartCon, ComObj;

  const ALTO_COL = 19;
        ALTO_DOBLE = 23;

type
  TCrCartCon = class;

  TWCrCartCon = class(TForm)
    InterForma1: TInterForma;
    dpFecha: TDateTimePicker;
    btBusca: TBitBtn;
    bbImprimir: TBitBtn;
    rgFactorMoneda: TRadioGroup;
    QDatos: TQuery;
    QDatosTIpo_Consumo: TStringField;
    QDatosSaldo: TFloatField;
    QDatosPorcentaje: TFloatField;
    Label1: TLabel;
    QDatos2: TQuery;
    QDatos2Tipo_Consumo: TStringField;
    QDatos2Saldo: TFloatField;
    QDatos2Porcentaje: TFloatField;
    sgConsumo: TSGCtrl;
    GroupBox1: TGroupBox;
    cbEstados: TCheckBox;
    cbMunicipios: TCheckBox;
    cbOrgDesc: TCheckBox;
    cbPrivado: TCheckBox;
    cbFederal: TCheckBox;
    sbExportarDetalles: TSpeedButton;
    SaveXLS: TSaveDialog;
    QDetalles: TQuery;
    QLeyendaEntidades: TQuery;
    cbCartasCredito: TCheckBox;
    cbInteresesAnticipados: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure btBuscaClick(Sender: TObject);
    procedure sgConsumoCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure bbImprimirClick(Sender: TObject);
    procedure sbExportarDetallesClick(Sender: TObject);
    procedure ExportarDetalles (FileName: string);
  private
    { Private declarations }
     flTotalImp_Real: double;
     flTotalPct_Real: double;
     procedure GeneraConsulta;
     function ConstruyeTipoEntidad: string;
  public
    { Public declarations }
    Objeto : TCrCartCon;
  end;

  TCrCartCon= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
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

constructor TCrCartCon.Create( AOwner : TComponent );
begin
  Inherited;
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'InTCrCartCon.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrCartCon.Destroy;
begin inherited;
end;


function TCrCartCon.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCartCon;
begin
   W:=TWCrCartCon.Create(Self);
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


(***********************************************FORMA CRCARTCON********************)
(*                                                                              *)
(*  FORMA DE CRCARTCON                                                            *)
(*                                                                              *)
(***********************************************FORMA CRCARTCON********************)

procedure TWCrCartCon.FormShow(Sender: TObject);
begin
  dpFecha.Date := Objeto.Apli.DameFechaEmpresa;
  GeneraConsulta;
end;

procedure TWCrCartCon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TWCrCartCon.ConstruyeTipoEntidad: string;
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


procedure TWCrCartCon.GeneraConsulta;
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


  sgConsumo.AddQry(QDatos, // Query
        True, // Iniciar Grid, Limpiar Lineas Anteriores.
        True, // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
        -1,   // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
        ALTO_COL,  // Alto del Header, -1 es el Default 32 Columnas
        ALTO_DOBLE,// Alto del las Lineas, 1 es el Default 32
        True); // ShowTitle

end;

procedure TWCrCartCon.btBuscaClick(Sender: TObject);
begin
  GeneraConsulta;
end;

procedure TWCrCartCon.sgConsumoCalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
begin
    if RowCaso = rcRowBegin then
  begin
    sgConsumo.SetActualHeight (ALTO_COL);
    if DataSet.FieldByName ('Tipo_Consumo').AsString = 'Total' then
       sgConsumo.SetActualAsHeader;
    end;
end;

procedure TWCrCartCon.bbImprimirClick(Sender: TObject);
var
  Factor: double;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;
  RepCarteraPorConsumo (dpFecha.Date - 1, ConstruyeTipoEntidad, cbCartasCredito.Checked, cbInteresesAnticipados.Checked, QDatos, Factor, Objeto.Apli, True);
end;

procedure TWCrCartCon.sbExportarDetallesClick(Sender: TObject);
var
  XLApp: Variant;
begin
  sbExportarDetalles.Refresh;
  if SaveXLS.Execute then
  begin
    Cursor := crHourGlass;
    try
      ExportarDetalles (SaveXLS.FileName);
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

procedure TWCrCartCon.ExportarDetalles (FileName: string);
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


var
  XLApp, XLSheet: Variant;
  Range: Variant;
  Row, RowIni, CurrTipo: integer;
  Factor: double;
begin
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

    QDetalles.Close;
    QDetalles.DatabaseName                            := Objeto.Apli.DataBaseName;
    QDetalles.SessionName                             := Objeto.Apli.SessionName;
    QDetalles.ParamByName ('peFecha').AsDate          := dpFecha.Date - 1;
    QDetalles.ParamByName ('peFactor').AsFloat        := Factor;
    QDetalles.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
    QDetalles.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
    QDetalles.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
    QDetalles.Open;

    QLeyendaEntidades.Close;
    QLeyendaEntidades.DatabaseName                            := Objeto.Apli.DataBaseName;
    QLeyendaEntidades.SessionName                             := Objeto.Apli.SessionName;
    QLeyendaEntidades.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
    QLeyendaEntidades.Open;

    {Inicia la generación de la tabla}
    XLSheet      := XLApp.Workbooks[1].WorkSheets[1];
    XLSheet.Name := 'Tabla';

    {Encabezado del reporte}
    XLSheet.Cells [1, 1].Formula             := Caption;  // Título del reporte
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['A1:I1'].Merge;

    XLSheet.Cells [2, 1].Formula             := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['A2:I2'].Merge;

    XLSheet.Cells [3, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [3, 2].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['B3'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Range ['B3:I3'].Merge;

    if cbCartasCredito.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 4].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 4].Formula := 'No incluye intereses cobrados por anticipado';
    XLSheet.Range ['A4:C4'].Merge;
    XLSheet.Range ['D4:I4'].Merge;
    XLSheet.Range ['D4'].HorizontalAlignment := xlHAlignRight;

    {Encabezado de las columnas}
    XLSheet.Cells [5, 1].Formula := 'Tipo Consumo';
    XLSheet.Cells [5, 2].Formula := 'Tipo Entidad';
    XLSheet.Cells [5, 3].Formula := 'Nombre Acreditado';
    XLSheet.Cells [5, 4].Formula := 'Id Acreditado';
    XLSheet.Cells [5, 5].Formula := 'Id Contrato';
    XLSheet.Cells [5, 6].Formula := 'Id Crédito';
    XLSheet.Cells [5, 7].Formula := 'Tipo Crédito';
    XLSheet.Cells [5, 8].Formula := 'Saldo';
    XLSheet.Cells [5, 9].Formula := 'Porcentaje';

    XLSheet.Range ['A1:I5'].Font.Bold                                                := True;
    XLSheet.Range ['A5:I5'].HorizontalAlignment                                      := xlHAlignCenter;
    XLSheet.Range['H5:H' + IntToStr (QDetalles.RecordCount + 5)].Style               := 'Currency';
    XLSheet.Range['I5:I' + IntToStr (QDetalles.RecordCount + 5)].Style               := 'Percent';
    XLSheet.Range['I5:I' + IntToStr (QDetalles.RecordCount + 5)].NumberFormat        := '0.00%';
    XLSheet.Range['I5:I' + IntToStr (QDetalles.RecordCount + 5)].HorizontalAlignment := xlHAlignCenter;

    Range                     := XLSheet.Range ['A5:I5'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row      := 6;
    RowIni   := Row;
    CurrTipo := -1;
    QDetalles.First;

    while not QDetalles.Eof do
    begin
      XLSheet.Cells [Row, 1].Formula := QDetalles.FieldByName ('Tipo_Consumo_Tit').AsString;
      XLSheet.Cells [Row, 2].Formula := QDetalles.FieldByName ('Tipo_Entidad')    .AsString;
      XLSheet.Cells [Row, 3].Formula := QDetalles.FieldByName ('Nom_Acred_Reg')   .AsString;
      XLSheet.Cells [Row, 4].Formula := QDetalles.FieldByName ('Id_Acreditado')   .AsFloat;
      XLSheet.Cells [Row, 5].Value   := QDetalles.FieldByName ('Id_Contrato')     .AsFloat;
      XLSheet.Cells [Row, 6].Value   := QDetalles.FieldByName ('Id_Credito')      .AsFloat;
      XLSheet.Cells [Row, 7].Value   := QDetalles.FieldByName ('Tipo_Credito')    .AsString;
      XLSheet.Cells [Row, 8].Value   := QDetalles.FieldByName ('Saldo')           .AsFloat;
      XLSheet.Cells [Row, 9].Value   := QDetalles.FieldByName ('Porcentaje')      .AsFloat;
      QDetalles.Next;
      Inc (Row);
    end;

    XLSheet.Columns ['A:G'].ColumnWidth := 20;
    XLSheet.Columns ['C'].ColumnWidth   := 35;
    XLSheet.Range ['A6'].Select;
    XLApp.ActiveWindow.FreezePanes := True;

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

end.
