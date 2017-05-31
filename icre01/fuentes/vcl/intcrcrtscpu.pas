// Sistema         : Clase de CRCRTSCPUB
// Fecha de Inicio : 09/04/2012
// Función forma   : Clase de CRCRTSCPUB
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrCrtScPu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntCrQrCrtScPu, IntSGCtrl,
  Grids, wwDataInspector, ShellAPI, ComObj;

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
  TCrCrtScPu= class;

  TWCrCrtScPub=Class(TForm)
    InterForma1             : TInterForma;
    lbFecha: TLabel;
    dpFecha: TDateTimePicker;
    SGCtrl1: TSGCtrl;
    rgSector: TRadioGroup;
    rgFactorMoneda: TRadioGroup;
    QDatos: TQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    StringField2: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    QSecPublico: TQuery;
    QSecPrivado: TQuery;
    btBusca: TBitBtn;
    sbExportar: TSpeedButton;
    QDatosG1: TFloatField;
    QDatosCumplimiento: TStringField;
    QDatosSector: TFloatField;
    SaveXLS: TSaveDialog;
    QSecPublicoDetalle: TQuery;
    QSecPrivadoDetalle: TQuery;
    sbExportarDetalle: TSpeedButton;
    QDatosDetalle: TQuery;
    cbCartasCredito: TCheckBox;
    cbInteresesAnticipados: TCheckBox;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InterForma1BtnAyudaClick(Sender: TObject);
    procedure btBuscaClick(Sender: TObject);
    procedure SGCtrl1CalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure sbExportarClick(Sender: TObject);
    procedure sbExportarDetalleClick(Sender: TObject);
    private
    { Private declarations }
      procedure ExportarXLS (FileName: string);
      procedure ExportarXLSDetalle (FileName: string);
    public
    { Public declarations }
    Objeto : TCrCrtScPu;
  end;

  TCrCrtScPu = class(TInterFrame)
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
{$R *.DFM}


constructor TCrCrtScPu.Create( AOwner : TComponent );
begin Inherited;
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrcrtscpu.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCrtScPu.Destroy;
begin inherited;
end;


function TCrCrtScPu.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCrtScPub;
begin
   W:=TWCrCrtScPub.Create(Self);
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


Function TCrCrtScPu.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrcrtsc.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrCrtScPu.Reporte:Boolean;
begin //Execute_Reporte();
  result := True;
end;


(***********************************************FORMA CRCRTSCPUB********************)
(*                                                                              *)
(*  FORMA DE CRCRTSCPUB                                                            *)
(*                                                                              *)
(***********************************************FORMA CRCRTSCPUB********************)

procedure TWCrCrtScPub.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrCrtScPub.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCrtScPub.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrcrtscpub.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrCrtScPub.FormShow(Sender: TObject);
begin
  InterForma1.btnAyuda.Caption := '&Imprimir';
  dpFecha.Date                 := Objeto.Apli.DameFechaEmpresa;
  btBuscaClick(btBusca);
end;

procedure TWCrCrtScPub.InterForma1BtnAyudaClick(Sender: TObject);
var
  Factor: double;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  RepCartSectorPublico (dpFecha.Date, rgSector.ItemIndex = 0, Factor, cbCartasCredito.Checked, cbInteresesAnticipados.Checked, QDatos, Objeto.Apli, True);
end;

function BoolToStr (b: boolean): string;
begin
  if b then
    result := 'V'
  else
    result := 'F';
end;

procedure TWCrCrtScPub.btBuscaClick(Sender: TObject);
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
  QDatos.DatabaseName := Objeto.Apli.DataBaseName;
  QDatos.SessionName  := Objeto.Apli.SessionName;

  if rgSector.ItemIndex = 0 then
    QDatos.SQL.Assign (QSecPublico.SQL)
  else
    QDatos.SQL.Assign (QSecPrivado.SQL);

  QDatos.ParamByName ('peFecha').AsDateTime     := dpFecha.Date - 1;
  QDatos.ParamByName ('peFactor').AsFloat       := Factor;
  QDatos.ParamByName ('peCartas_Cred').AsString := BoolToStr (cbCartasCredito.Checked);
  QDatos.ParamByName ('peInt_Cob_Ant').AsString := BoolToStr (cbInteresesAnticipados.Checked);
  QDatos.Open;

  SGCtrl1.AddQry (QDatos, True, True, -1, Alto_Col, Alto_Doble, True);
end;

procedure TWCrCrtScPub.SGCtrl1CalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
begin
  if RowCaso = rcRowBegin then
  begin
    SGCtrl1.SetActualHeight(ALTO_COL);
    if DataSet.FieldByName('G1').AsInteger = 1 then
      SGCtrl1.ToHeader (CurrRow);
  end;
end;

procedure TWCrCrtScPub.ExportarXLS (FileName: string);
var
  XLApp, XLSheet, Range: Variant;
  Row: integer;
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
    XLSheet.Cells [1, 1].Formula := Format ('%s (Sector %s)', [Caption, rgSector.Items [rgSector.ItemIndex]]);
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
    XLSheet.Cells [5, 1].Formula := 'Sector';
    XLSheet.Cells [4, 2].Formula := 'Máximo';
    XLSheet.Cells [5, 2].Formula := '%';
    XLSheet.Cells [5, 3].Formula := 'Subsector';
    XLSheet.Cells [4, 4].Formula := 'Máximo';
    XLSheet.Cells [5, 4].Formula := '%';

    XLSheet.Cells [4, 5].Formula := 'Real';
    XLSheet.Cells [5, 5].Formula := '$';
    XLSheet.Cells [5, 6].Formula := '%';
    XLSheet.Cells [5, 7].Formula := 'Cumplimiento';

    XLSheet.Range ['E4:F4'].Merge;
    XLSheet.Range ['A1:G5'].Font.Bold           := True;
    XLSheet.Range ['A4:G5'].HorizontalAlignment := xlHAlignCenter;

    Range                     := XLSheet.Range ['A4:G5'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row := 6;
    QDatos.First;
    while not QDatos.Eof do
    begin
      if not QDatos.FieldByName ('Pct_Max_Sector').IsNull then
      begin
        XLSheet.Cells [Row, 2].Value := QDatos.FieldByName ('Pct_Max_Sector').AsFloat / 100;

        XLSheet.Range [Format ('B%d', [Row])].Style               := 'Percent';
        XLSheet.Range [Format ('B%d', [Row])].NumberFormat        := '0.00%';
        XLSheet.Range [Format ('B%d', [Row])].HorizontalAlignment := xlHAlignCenter;
      end;

      if not QDatos.FieldByName ('Pct_Maximo').IsNull then
      begin
        XLSheet.Cells [Row, 4].Value := QDatos.FieldByName ('Pct_Maximo').AsFloat / 100;

        XLSheet.Range [Format ('D%d', [Row])].Style               := 'Percent';
        XLSheet.Range [Format ('D%d', [Row])].NumberFormat        := '0.00%';
        XLSheet.Range [Format ('D%d', [Row])].HorizontalAlignment := xlHAlignCenter;
      end;

      XLSheet.Cells [Row, 5].Value := QDatos.FieldByName ('Imp_Real')  .AsFloat;
      XLSheet.Cells [Row, 6].Value := QDatos.FieldByName ('Pct_Real')  .AsFloat / 100;

      XLSheet.Range [Format ('E%d', [Row])].Style               := 'Currency';

      XLSheet.Range [Format ('F%d', [Row])].Style               := 'Percent';
      XLSheet.Range [Format ('F%d', [Row])].NumberFormat        := '0.00%';
      XLSheet.Range [Format ('F%d', [Row])].HorizontalAlignment := xlHAlignCenter;

      XLSheet.Range [Format ('G%d', [Row])].HorizontalAlignment := xlHAlignCenter;

      if QDatos.FieldByName ('G1').AsFloat = 1 then
      begin
        if QDatos.FieldByName ('Sector').IsNull then
          Range := XLSheet.Range [Format ('E%d:F%d', [Row, Row])]
        else
        begin
          XLSheet.Cells [Row, 3].Formula             := 'Total';
          XLSheet.Cells [Row, 3].HorizontalAlignment := xlHAlignRight;
          Range                                      := XLSheet.Range [Format ('C%d:G%d', [Row, Row])];
        end;

        Range.Interior.ThemeColor := xlThemeColorLight1;
        Range.Font.Bold           := True;
        Range.Font.ThemeColor     := xlThemeColorDark1;

        Inc (Row);
      end
      else
      begin
        XLSheet.Cells [Row, 1].Font.Bold := True;
        XLSheet.Cells [Row, 1].Formula   := QDatos.FieldByName ('Desc_Sector').AsString;
        XLSheet.Cells [Row, 3].Formula   := QDatos.FieldByName ('Desc_Subsector').AsString;
        XLSheet.Cells [Row, 7].Formula   := QDatos.FieldByName ('Cumplimiento').AsString;
      end;

      QDatos.Next;
      Inc (Row);
    end;


    XLSheet.Columns ['A'].AutoFit;
    XLSheet.Columns ['C'].AutoFit;
    XLSheet.Columns ['B'].ColumnWidth := 10;
    XLSheet.Columns ['D'].ColumnWidth := 10;
    XLSheet.Columns ['F'].ColumnWidth := 25;
    XLSheet.Columns ['F'].ColumnWidth := 10;
    XLSheet.Columns ['G'].ColumnWidth := 15;
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


procedure TWCrCrtScPub.sbExportarClick(Sender: TObject);
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

procedure TWCrCrtScPub.ExportarXLSDetalle (FileName: string);
var
  Factor: double;
  XLApp, XLSheet, Range: Variant;
  Row: integer;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  QDatosDetalle.Close;
  QDatosDetalle.DatabaseName := Objeto.Apli.DataBaseName;
  QDatosDetalle.SessionName  := Objeto.Apli.SessionName;

  if rgSector.ItemIndex = 0 then
    QDatosDetalle.SQL.Assign (QSecPublicoDetalle.SQL)
  else
    QDatosDetalle.SQL.Assign (QSecPrivadoDetalle.SQL);

  QDatosDetalle.ParamByName ('peFecha').AsDateTime     := dpFecha.Date - 1;
  QDatosDetalle.ParamByName ('peFactor').AsFloat       := Factor;
  QDatosDetalle.ParamByName ('peCartas_Cred').AsString := BoolToStr (cbCartasCredito.Checked);
  QDatosDetalle.ParamByName ('peInt_Cob_Ant').AsString := BoolToStr (cbInteresesAnticipados.Checked);
  QDatosDetalle.Open;

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
    XLSheet.Cells [1, 1].Formula := Format ('%s (Sector %s)', [Caption, rgSector.Items [rgSector.ItemIndex]]);
    XLSheet.Range ['A1:K1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [2, 2].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['B2:K2'].Merge;
    XLSheet.Range ['B2'].HorizontalAlignment := xlHAlignRight;

    if cbCartasCredito.Checked then
      XLSheet.Cells [3, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [3, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [3, 5].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [3, 5].Formula := 'No incluye intereses cobrados por anticipado';

    XLSheet.Range ['A3:D3'].Merge;
    XLSheet.Range ['E3:K3'].Merge;
    XLSheet.Range ['E3'].HorizontalAlignment := xlHAlignRight;

    {Encabezado de las columnas}
    XLSheet.Cells [4,  1].Formula := 'Sector';              //Desc_Sector
    XLSheet.Cells [4,  2].Formula := '% Máximo Sector';     //Pct_Max_Sector
    XLSheet.Cells [4,  3].Formula := 'SubSector';           //Desc_Subsector
    XLSheet.Cells [4,  4].Formula := '% Máximo Subsector';  //Pct_Max_Subsector
    XLSheet.Cells [4,  5].Formula := 'Acreditado';          //Nom_Acred_Reg
    XLSheet.Cells [4,  6].Formula := 'ID Acreditado';       //ID_Acreditado
    XLSheet.Cells [4,  7].Formula := 'ID Contrato';         //ID_Contrato
    XLSheet.Cells [4,  8].Formula := 'ID Crédito';          //ID_Credito
    XLSheet.Cells [4,  9].Formula := 'Tipo Crédito';        //Tipo_Credito
    XLSheet.Cells [4, 10].Formula := 'Imp. Real';           //Imp_Real
    XLSheet.Cells [4, 11].Formula := '% Real';              //Pct_Real

    XLSheet.Range ['A1:K4'].Font.Bold           := True;
    XLSheet.Range ['A4:K4'].HorizontalAlignment := xlHAlignCenter;

    Range                     := XLSheet.Range ['A4:K4'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row := 5;
    while not QDatosDetalle.Eof do
    begin
      XLSheet.Cells [Row,  1].Value := QDatosDetalle.FieldByName ('Desc_Sector').AsString;
      XLSheet.Cells [Row,  2].Value := QDatosDetalle.FieldByName ('Pct_Max_Sector').AsFloat    / 100;
      XLSheet.Cells [Row,  3].Value := QDatosDetalle.FieldByName ('Desc_Subsector').AsString;
      XLSheet.Cells [Row,  4].Value := QDatosDetalle.FieldByName ('Pct_Max_Subsector').AsFloat / 100;
      XLSheet.Cells [Row,  5].Value := QDatosDetalle.FieldByName ('Nom_Acred_Reg').AsString;
      XLSheet.Cells [Row,  6].Value := QDatosDetalle.FieldByName ('ID_Acreditado').AsFloat;
      XLSheet.Cells [Row,  7].Value := QDatosDetalle.FieldByName ('ID_Contrato').AsFloat;
      XLSheet.Cells [Row,  8].Value := QDatosDetalle.FieldByName ('ID_Credito').AsFloat;
      XLSheet.Cells [Row,  9].Value := QDatosDetalle.FieldByName ('Tipo_Credito').AsString;
      XLSheet.Cells [Row, 10].Value := QDatosDetalle.FieldByName ('Imp_Real').AsFloat;
      XLSheet.Cells [Row, 11].Value := QDatosDetalle.FieldByName ('Pct_Real').AsFloat;

      QDatosDetalle.Next;
      Inc (Row);
    end;
    XLSheet.Columns ['A'].AutoFit;
    XLSheet.Columns ['B:K'].ColumnWidth := 13;
    XLSheet.Columns ['C'].ColumnWidth   := 20;
    XLSheet.Columns ['E'].ColumnWidth   := 20;
    XLSheet.Columns ['J'].ColumnWidth   := 20;
    XLSheet.Range [Format ('J4:J%d', [Row - 1])].Style               := 'Currency';
    XLSheet.Range [Format ('B4:B%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('B4:B%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('B4:B%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('D4:D%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('D4:D%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('D4:D%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('K4:K%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('K4:K%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('K4:K%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;
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


procedure TWCrCrtScPub.sbExportarDetalleClick(Sender: TObject);
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

end.
