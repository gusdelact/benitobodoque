// Sistema         : Clase de NINGUNO
// Fecha de Inicio : 04/04/2012
// Función forma   : Clase de NINGUNO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Julio's Cesar Ruiz Castro
// Comentarios     :
Unit IntCrAcreMax;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, IntSGCtrl,
Ungene, ShellAPI, ComObj, IntQrAcreMax;

const ALTO_COL = 16;
const ALTO_DOBLE = 20;

Type
 TCrAcreMax= class; 

  TWCrAcreMax=Class(TForm)
    InterForma1             : TInterForma;
    sgMayores: TSGCtrl;
    Panel1: TPanel;
    edtExceptuado: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    rgFactorMoneda: TRadioGroup;
    GroupBox1: TGroupBox;
    cbEstados: TCheckBox;
    cbMunicipios: TCheckBox;
    cbOrgDesc: TCheckBox;
    cbPrivado: TCheckBox;
    cbFederal: TCheckBox;
    QAcreditados: TQuery;
    QAcreditadosDesc_Grupo: TStringField;
    QAcreditadosDesc_Concepto: TStringField;
    QAcreditadosImporte: TFloatField;
    QAcreditadosCumplimiento: TStringField;
    dpFecha: TDateTimePicker;
    QAcreditadosGrupo: TFloatField;
    btBusca: TBitBtn;
    sbExportarDetalle: TSpeedButton;
    SaveXLS: TSaveDialog;
    QDetalles: TQuery;
    QLeyendaEntidades: TQuery;
    cbCartasCredito: TCheckBox;
    cbInteresesAnticipados: TCheckBox;

    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1BtnAyudaClick(Sender: TObject);
    procedure Recalcular(Sender: TObject);
    procedure sbExportarDetalleClick(Sender: TObject);
    private
      function ConstruyeTipoEntidad: string;
      procedure generaDatos();
      procedure ExportarXLSDetalle (FileName: string);
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrAcreMax;
   end;

   TCrAcreMax= class(TInterFrame)
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


constructor TCrAcreMax.Create( AOwner : TComponent ); 
begin Inherited; 
//
end;

Destructor TCrAcreMax.Destroy;
begin inherited;
end;


function TCrAcreMax.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAcreMax;
begin
   W:=TWCrAcreMax.Create(Self);
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


Function TCrAcreMax.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('INinguno.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrAcreMax.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TWCrAcreMax.FormShow(Sender: TObject);
begin
  InterForma1.BtnAyuda.Caption := '&Imprimir';
  dpFecha.Date                 := Objeto.Apli.DameFechaEmpresa;
  generaDatos;
end;

procedure TWCrAcreMax.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWCrAcreMax.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrAcreMax.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrAcreMax.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrAcreMax.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;

function TWCrAcreMax.ConstruyeTipoEntidad: string;
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

function BoolToStr (b: boolean): string;
begin
  if b then
    result := 'V'
  else
    result := 'F';
end;


procedure TWCrAcreMax.generaDatos;
var
  Factor: double;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  QAcreditados.Close;
  QAcreditados.DatabaseName                            := Objeto.Apli.DataBaseName;
  QAcreditados.SessionName                             := Objeto.Apli.SessionName;
  QAcreditados.ParamByName ('peFecha').AsDate          := dpFecha.Date - 1;
  QAcreditados.ParamByName ('peFactor').AsFloat        := Factor;
  QAcreditados.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QAcreditados.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
  QAcreditados.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
  QAcreditados.Open;

  QLeyendaEntidades.Close;
  QLeyendaEntidades.DatabaseName                            := Objeto.Apli.DataBaseName;
  QLeyendaEntidades.SessionName                             := Objeto.Apli.SessionName;
  QLeyendaEntidades.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QLeyendaEntidades.Open;

  sgMayores.BeginGrid;

  sgMayores.Titulo1 := 'Cosulta de Acreditados Mayores';
  sgMayores.EndCaption;

  if QAcreditados.RecordCount > 0 then
    sgMayores.AddQry(QAcreditados, // Query
                     True,         // Iniciar Grid, Limpiar Lineas Anteriores.
                     True,         // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
                     -1,           // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
                     ALTO_COL,     // Alto del Header, -1 es el Default 32 Columnas
                     ALTO_DOBLE,   // Alto del las Lineas, 1 es el Default 32
                     True)         // ShowTitle
  else
    sgMayores.AddTitle('NO EXISTEN DATOS', TcCenter);

  sgMayores.ShowTab := true;
  sgMayores.ShowBtnFirst := true;
  sgMayores.ShowBtnLast := true;
  sgMayores.ShowBtnPriorNext := true;
  sgMayores.EndGrid;
end;

procedure TWCrAcreMax.InterForma1BtnAyudaClick(Sender: TObject);
var
  Factor: double;
begin
  Factor        := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  QrAcreMax.genRPTAcreditadoMaximo(dpFecha.Date - 1,
                                   Factor,
                                   ConstruyeTipoEntidad,
                                   cbCartasCredito.Checked,
                                   cbInteresesAnticipados.Checked,
                                   QAcreditados,
                                   Objeto.Apli,
                                   True);
end;

procedure TWCrAcreMax.Recalcular(Sender: TObject);
begin
  generaDatos;
end;

procedure TWCrAcreMax.sbExportarDetalleClick(Sender: TObject);
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

procedure TWCrAcreMax.ExportarXLSDetalle (FileName: string);
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
    XLSheet.Range ['A1:H1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['A2:H2'].Merge;
    XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [3, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [3, 2].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['B3:H3'].Merge;
    XLSheet.Range ['B3'].HorizontalAlignment := xlHAlignRight;

    if cbCartasCredito.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 5].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 5].Formula := 'No incluye intereses cobrados por anticipado';

    XLSheet.Range ['A4:D4'].Merge;
    XLSheet.Range ['E4:H4'].Merge;
    XLSheet.Range ['E4'].HorizontalAlignment := xlHAlignRight;

    {Encabezado de las columnas}
    XLSheet.Cells [5,  1].Formula := 'Tipo Entidad';
    XLSheet.Cells [5,  2].Formula := 'ID Acreditado';
    XLSheet.Cells [5,  3].Formula := 'Nombre Acred';
    XLSheet.Cells [5,  4].Formula := 'ID Aval Gob';
    XLSheet.Cells [5,  5].Formula := 'Imp. Acreditado';
    XLSheet.Cells [5,  6].Formula := 'Imp. Aval';
    XLSheet.Cells [5,  7].Formula := 'Imp. Total';
    XLSheet.Cells [5,  8].Formula := 'Posición';

    XLSheet.Range ['A1:H5'].Font.Bold           := True;
    XLSheet.Range ['A5:H5'].HorizontalAlignment := xlHAlignCenter;

    Range                     := XLSheet.Range ['A5:H5'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row := 6;
    while not QDetalles.Eof do
    begin
      XLSheet.Cells [Row,  1].Value := QDetalles.FieldByName ('Tipo_Entidad').AsString;
      XLSheet.Cells [Row,  2].Value := QDetalles.FieldByName ('ID_Acreditado').AsFloat;
      XLSheet.Cells [Row,  3].Value := QDetalles.FieldByName ('Nom_Acred_Reg').AsString;
      XLSheet.Cells [Row,  5].Value := QDetalles.FieldByName ('Importe_Acred').AsFloat;
      XLSheet.Cells [Row,  6].Value := QDetalles.FieldByName ('Importe_Aval').AsFloat;
      XLSheet.Cells [Row,  7].Value := QDetalles.FieldByName ('Importe_Total').AsFloat;
      XLSheet.Cells [Row,  8].Value := QDetalles.FieldByName ('Renglon').AsFloat;
      if not QDetalles.FieldByName ('ID_Aval_Gob').IsNull then
        XLSheet.Cells [Row,  4].Value := QDetalles.FieldByName ('ID_Aval_Gob').AsFloat;

      QDetalles.Next;
      Inc (Row);
    end;

    XLSheet.Range [Format ('E5:G%d', [Row - 1])].Style := 'Currency';
    XLSheet.Columns ['E:G'].ColumnWidth                := 20;
    XLSheet.Columns ['A'].AutoFit;
    XLSheet.Columns ['C'].AutoFit;
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
