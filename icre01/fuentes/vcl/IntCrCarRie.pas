// Sistema         : Clase de CR_CARGA_RIESGO
// Fecha de Inicio : 13/10/2015
// Función forma   : Clase de CR_CARGA_RIESGO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrCarRie;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid, ActnList, Math, ComObj,
  ImgList, AppEvnts, DBGrids;

const
  ColorError = $00A6AEFE;

  ICO_Nueva     = 0;
  ICO_Actualiza = 1;
  ICO_Error     = 2;

  coNumColumnas = 33;

  colInfoNueva                     =  0; colStrInfoNueva                     = 'Nueva';
  colFConsulta                     =  1; colStrFConsulta                     = 'Fecha de Consulta';
  colIDCredito                     =  2; colStrIDCredito                     = 'Número de Crédito';
  colMitigante                     =  3; colStrMitigante                     = 'Mitigante';
  colGpoRiesgo                     =  4; colStrGpoRiesgo                     = 'Grupo de Riesgo';
  colFactorConvRiesgoCred          =  5; colStrFactorConvRiesgoCred          = 'Factor de Conversión a Riesgo de Crédito';
  colExpAjustadaMitigantes         =  6; colStrExpAjustadaMitigantes         = 'Exposición Ajustada por Mitigantes';
  colExpNetaReservas               =  7; colStrExpNetaReservas               = 'Exposición Neta de Reservas';
  colTablaAdeudo                   =  8; colStrTablaAdeudo                   = 'Tabla del Adeudo';
  colGradoRiesgoMetEst             =  9; colStrGradoRiesgoMetEst             = 'Grado de Riesgo Método Estándar';
  colEscalaCalificacion            = 10; colStrEscalaCalificacion            = 'Escala de Calificación';
  colAgenciaCalificadora           = 11; colStrAgenciaCalificadora           = 'Agencia Calificadora';
  colCalificacion                  = 12; colStrCalificacion                  = 'Calificación';
  colPonderadorRiesgo              = 13; colStrPonderadorRiesgo              = 'Ponderador de Riesgo';
  colReqCapCredDispMetEst          = 14; colStrReqCapCredDispMetEst          = 'Requerimiento de Capital por Crédito o Disposición Método Estándar';
  colEnfoqueBasicoAvanzado         = 15; colStrEnfoqueBasicoAvanzado         = 'Enfoque Básico o Avanzado';
  colProbabilidadIncump            = 16; colStrProbabilidadIncump            = 'Probabilidad de Incumplimiento';
  colSeveridadPerdida              = 17; colStrSeveridadPerdida              = 'Severidad de la Pérdida';
  colExposicionIncump              = 18; colStrExposicionIncump              = 'Exposición de Incumplimiento';
  colVencimiento                   = 19; colStrVencimiento                   = 'Vencimiento';
  colCorrelacion                   = 20; colStrCorrelacion                   = 'Correlación';
  colPonderadorRiesgoCapRiesgoCred = 21; colStrPonderadorRiesgoCapRiesgoCred = 'Ponderador del Requerimiento de Capital por Riesgo de Crédito';
  colReqCapCredDispMetInt          = 22; colStrReqCapCredDispMetInt          = 'Requerimiento de Capital por Crédito o Disposición Metodología Interna';
  colImpCapitalBasico              = 23; colStrImpCapitalBasico              = 'Importe de Capital Básico';
  colImpCapitalBasico1             = 24; colStrImpCapitalBasico1             = 'Importe de Capital Básico 1';
  colImpCapitalBasico2             = 25; colStrImpCapitalBasico2             = 'Importe de Capital Básico 2';
  colPctLimiteMaximo               = 26; colStrPctLimiteMaximo               = 'Límite Máximo (%)';
  colCveOrigenOpOtrosActivos       = 27; colStrCveOrigenOpOtrosActivos       = 'Origen de las operaciones clasificadas como otros activos';
  colImpDatoImporteOperacion       = 28; colStrImpDatoImporteOperacion       = 'Dato Importe de la Operación';
  colCveRazonOpConsumeCapital      = 29; colStrCveRazonOpConsumeCapital      = 'Razón por la cual la Operación consume o no consume Capital';
  colImpOperacionCalcICAP          = 30; colStrImpOperacionCalcICAP          = 'Monto de la Operación que se incluye para el Cálculo del ICAP';
  colImpConsumoCapitalBasico       = 31; colStrImpConsumoCapitalBasico       = 'Monto de Consumo de Capital Básico';
  colPctConsumoCapitalBasico       = 32; colStrPctConsumoCapitalBasico       = '% de Consumo de Capital Básico';

  Meses: array [1..12] of string = ('ENERO', 'FEBRERO', 'MARZO',      'ABRIL',   'MAYO',      'JUNIO',
                                    'JULIO', 'AGOSTO',  'SEPTIEMBRE', 'OCTUBRE', 'NOVIEMBRE', 'DICIEMBRE');
type
  RecInfoAcred = record
    ID_Acreditado, ID_Credito: LongInt;
    CarteraR04, ReservaR04, ReservaNetaColG: Extended;
  end;
  ArrInfoAcred = array of RecInfoAcred;

Type
  TCrCarRie= class;

  TWCrCargaRiesgo=Class(TForm)
    InterForma1             : TInterForma;
    labArchivoExcel: TLabel;
    edArchivoExcel: TEdit;
    sagDatos: TStringAlignGrid;
    OpenDlgArchivoExcel: TOpenDialog;
    btCargaExcel: TBitBtn;
    ActionList1: TActionList;
    actAbrirArchivo: TAction;
    ProgressBar: TProgressBar;
    ImgCheck: TImage;
    LabCheck: TLabel;
    ImgReload: TImage;
    LabReload: TLabel;
    ImageList: TImageList;
    Image1: TImage;
    Label1: TLabel;
    actAplicarCambios: TAction;
    Consola: TMemo;
    ApplicationEvents1: TApplicationEvents;
    btnAplicarCambios: TBitBtn;
    QRiesgos: TQuery;
    labFecha: TLabel;
    DSRiesgos: TDataSource;
    DBGRiesgos: TDBGrid;
    Label2: TLabel;
    cbAnio: TComboBox;
    cbMes: TComboBox;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    cbIncluirCreditosConError: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure actAbrirArchivoExecute(Sender: TObject);
    procedure sagDatosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure actAplicarCambiosExecute(Sender: TObject);
    procedure cbAnioClick(Sender: TObject);
  private
    { Private declarations }
    NoRegistranR04:  ArrInfoAcred;
    DifSumaReservas: ArrInfoAcred;
    procedure IniciaArrInfoAcred (var Arr: ArrInfoAcred);
    procedure LimpiaArrInfoAcred (var Arr: ArrInfoAcred);
    procedure AgregaArrInfoAcred (var Arr: ArrInfoAcred);
    function BuscarCreditoArrInfoAcred (Arr: ArrInfoAcred; ID_Credito: LongInt): integer;
    procedure LimpiaGrid;
    procedure AbrirXLS (FileName: string);
    procedure Log (S: string);
    function ResumenRenglon (r: integer): string;
    function ObtenFecha: TDateTime;
    function ObtenFechaAnioMes: string;
  public
    { Public declarations }
    Objeto : TCrCarRie;
  end;

  TCrCarRie= class(TInterFrame)
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
uses IntMain;

{$R *.DFM}
function LeftTrim (s: string): string;
begin
  while (Length (s) > 0) and (s [1] = ' ') do
    Delete (s, 1, 1);

  result := s;
end;

function RightTrim (s: string): string;
begin
  while (Length (s) > 0) and (s [Length (s)] = ' ') do
    Delete (s, Length (s), 1);

  result := s;
end;

function Trim (s: string): string;
begin
  result := LeftTrim (RightTrim (s));
end;

function TryStrToInt (S: string; var n: integer): boolean;
var
  e: integer;
begin
  s      := Trim (s);
  result := s <> '';
  if not result then exit;

  Val (s, n, e);

  result := e = 0;
end;

function TryStrToFloat (S: string; var d: double): boolean;
var
  e: integer;
begin
  s      := Trim (s);
  result := s <> '';
  if not result then exit;

  Val (s, d, e);

  result := e = 0;
end;

function InRange (v, li, ls: integer): boolean;
begin
  result := (v >= li) and (v <= ls);
end;

function IsValidDate(const S: string): boolean;
var
  y, m, d: Integer;
const
  DAYS_OF_MONTH: array[1..12] of integer = (31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
  result := false;
  if length(S) <> 10 then Exit;

  if (S[3] <> '/') or (S[6] <> '/') then Exit;

  if not TryStrToInt(Copy(S, 7, 4), y) then Exit;
  if not TryStrToInt(Copy(S, 4, 2), m) then Exit;
  if not InRange(m, 1, 12) then Exit;
  if not TryStrToInt(Copy(S, 1, 2), d) then Exit;
  if not InRange(d, 1, DAYS_OF_MONTH[m]) then Exit;
  if (not IsLeapYear(y)) and (m = 2) and (d = 29) then Exit;
  result := true;
end;

function StringToDate (s: string): TDateTime;
var
  Day, Month, Year: word;
begin
  Day    := StrToInt (Copy (s, 1, 2));
  Month  := StrToInt (Copy (s, 4, 2));
  Year   := StrToInt (Copy (s, 7, 5));
  result := EncodeDate (Year, Month, Day);
end;

constructor TCrCarRie.Create( AOwner : TComponent );
begin
  Inherited;
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntCrCarRie.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrCarRie.Destroy;
begin
  inherited;
end;


function TCrCarRie.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W :TWCrCargaRiesgo;
begin
   W := TWCrCargaRiesgo.Create(Self);
   try
     W.Objeto:= Self;
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


Function TCrCarRie.InternalBusca:Boolean;
Var
  T:TInterFindit;
begin
  InternalBusca := False;
   T := CreaBuscador('ICrCaRi.it','');
   Try
     if Active then begin end;
     if T.Execute then InternalBusca := FindKey([]);
   finally
     T.Free;
   end;
end;

function TCrCarRie.Reporte:Boolean;
begin //Execute_Reporte();
  result := False;
end;


(***********************************************FORMA CR_CARGA_RIESGO********************)
(*                                                                              *)
(*  FORMA DE CR_CARGA_RIESGO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CARGA_RIESGO********************)

procedure TWCrCargaRiesgo.FormShow(Sender: TObject);
var
  i: integer;
  y, m, d: Word;
begin
  if Objeto.Apli.MainForm is TwPrincipal then
    with Objeto.Apli.MainForm as TwPrincipal do
    begin
      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
    end;

  DecodeDate (Objeto.Apli.DameFechaEmpresa, y, m, d);
  cbAnio.Clear;
  for i := y - 30 to y + 30 do
  begin
    cbAnio.Items.Add (IntToStr (i));
    if i = y then
      cbAnio.ItemIndex := cbAnio.Items.Count - 1;
  end;
//  cbAnio.Text := IntToStr (y);

  cbMes.Items.Clear;
  for i := Low (Meses) to High (Meses) do
    cbMes.Items.Add (Meses [i]);
//  cbMes.Text := Meses [m];
  cbMes.ItemIndex := m - 1;

  actAplicarCambios.Enabled := False;
  QRiesgos.DatabaseName     := Objeto.Apli.DataBaseName;
  QRiesgos.SessionName      := Objeto.Apli.SessionName;
  DBGRiesgos.Top            := sagDatos.Top;
  IniciaArrInfoAcred (NoRegistranR04);
  IniciaArrInfoAcred (DifSumaReservas);
  LimpiaGrid;
end;

procedure TWCrCargaRiesgo.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWCrCargaRiesgo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrCargaRiesgo.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCargaRiesgo.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCargaRiesgo.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;

procedure TWCrCargaRiesgo.sagDatosDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  Bmp: TBitmap;
  Index: integer;
begin
  with (Sender As TStringAlignGrid) Do
  begin
    //Iconos par ver de que tipo es la transaccion
    if (ACol = 0) and (ARow > 0) then
    begin
      Index := -1;
      if not TryStrToInt (Cells [0, ARow], Index) and not InRange (Index, ICO_Nueva, ICO_Error) then exit;

      Bmp := TBitmap.Create;
      if Assigned(Bmp) then
      begin
        ImageList.GetBitmap (Index, Bmp);
        Canvas.FillRect(Classes.Rect (Rect.Left - 2, Rect.Top - 2, Rect.Right + 2, Rect.Bottom + 2));
        Bmp.Transparent := True;
        Canvas.Draw (Rect.Left + ((Rect.Right - Rect.Left - Bmp.Width) div 2), Rect.Top, Bmp);
        Canvas.Brush.Color := Color;
        Bmp.FreeImage;
        Bmp.Free;
      end;
    end;
  end;
end;

procedure TWCrCargaRiesgo.IniciaArrInfoAcred (var Arr: ArrInfoAcred);
begin
  SetLength (Arr, 0);
end;

procedure TWCrCargaRiesgo.LimpiaArrInfoAcred (var Arr: ArrInfoAcred);
var
  i: integer;
begin
  for i := 0 to Length (Arr) - 1 do
  begin
    Arr [i].ID_Acreditado   := 0;
    Arr [i].ID_Credito      := 0;
    Arr [i].CarteraR04      := 0;
    Arr [i].ReservaR04      := 0;
    Arr [i].ReservaNetaColG := 0;
  end;
  SetLength (Arr, 0);
end;

procedure TWCrCargaRiesgo.AgregaArrInfoAcred (var Arr: ArrInfoAcred);
begin
  SetLength (Arr, Length (Arr) + 1);

  Arr [Length (Arr) - 1].ID_Acreditado   := 0;
  Arr [Length (Arr) - 1].ID_Credito      := 0;
  Arr [Length (Arr) - 1].CarteraR04      := 0;
  Arr [Length (Arr) - 1].ReservaR04      := 0;
  Arr [Length (Arr) - 1].ReservaNetaColG := 0;
end;

function TWCrCargaRiesgo.BuscarCreditoArrInfoAcred (Arr: ArrInfoAcred; ID_Credito: LongInt): integer;
var
  i: integer;
begin
  result := -1;

  for i := 0 to Length (Arr) - 1 do
    if Arr [i].ID_Credito = ID_Credito then
    begin
      result := i;
      exit;
    end;
end;

procedure TWCrCargaRiesgo.LimpiaGrid;
var
  c, r: integer;
begin
  sagDatos.RowCount := Math.Max (sagDatos.RowCount, 2);
  sagDatos.ColCount := Math.Max (sagDatos.ColCount, coNumColumnas);
  for r := 0 to sagDatos.RowCount - 1 do
  begin
    sagDatos.ColorRow [r] := clWindow;
    for c := 0 to sagDatos.ColCount - 1 do
      sagDatos.Cells [c, r] := '';
  end;

  sagDatos.RowCount      := 2;
  sagDatos.ColCount      := coNumColumnas;
  sagDatos.ShowCellHints := True;

  sagDatos.Cells [colInfoNueva,                     0] := colStrInfoNueva;
  sagDatos.Cells [colFConsulta,                     0] := colStrFConsulta;
  sagDatos.Cells [colIDCredito,                     0] := colStrIDCredito;
  sagDatos.Cells [colMitigante,                     0] := colStrMitigante;
  sagDatos.Cells [colGpoRiesgo,                     0] := colStrGpoRiesgo;
  sagDatos.Cells [colFactorConvRiesgoCred,          0] := colStrFactorConvRiesgoCred;
  sagDatos.Cells [colExpAjustadaMitigantes,         0] := colStrExpAjustadaMitigantes;
  sagDatos.Cells [colExpNetaReservas,               0] := colStrExpNetaReservas;
  sagDatos.Cells [colTablaAdeudo,                   0] := colStrTablaAdeudo;
  sagDatos.Cells [colGradoRiesgoMetEst,             0] := colStrGradoRiesgoMetEst;
  sagDatos.Cells [colEscalaCalificacion,            0] := colStrEscalaCalificacion;
  sagDatos.Cells [colAgenciaCalificadora,           0] := colStrAgenciaCalificadora;
  sagDatos.Cells [colCalificacion,                  0] := colStrCalificacion;
  sagDatos.Cells [colPonderadorRiesgo,              0] := colStrPonderadorRiesgo;
  sagDatos.Cells [colReqCapCredDispMetEst,          0] := colStrReqCapCredDispMetEst;
  sagDatos.Cells [colEnfoqueBasicoAvanzado,         0] := colStrEnfoqueBasicoAvanzado;
  sagDatos.Cells [colProbabilidadIncump,            0] := colStrProbabilidadIncump;
  sagDatos.Cells [colSeveridadPerdida,              0] := colStrSeveridadPerdida;
  sagDatos.Cells [colExposicionIncump,              0] := colStrExposicionIncump;
  sagDatos.Cells [colVencimiento,                   0] := colStrVencimiento;
  sagDatos.Cells [colCorrelacion,                   0] := colStrCorrelacion;
  sagDatos.Cells [colPonderadorRiesgoCapRiesgoCred, 0] := colStrPonderadorRiesgoCapRiesgoCred;
  sagDatos.Cells [colReqCapCredDispMetInt,          0] := colStrReqCapCredDispMetInt;
  sagDatos.Cells [colImpCapitalBasico,              0] := colStrImpCapitalBasico;
  sagDatos.Cells [colImpCapitalBasico1,             0] := colStrImpCapitalBasico1;
  sagDatos.Cells [colImpCapitalBasico2,             0] := colStrImpCapitalBasico2;
  sagDatos.Cells [colPctLimiteMaximo,               0] := colStrPctLimiteMaximo;
  sagDatos.Cells [colCveOrigenOpOtrosActivos,       0] := colStrCveOrigenOpOtrosActivos;
  sagDatos.Cells [colImpDatoImporteOperacion,       0] := colStrImpDatoImporteOperacion;
  sagDatos.Cells [colCveRazonOpConsumeCapital,      0] := colStrCveRazonOpConsumeCapital;
  sagDatos.Cells [colImpOperacionCalcICAP,          0] := colStrImpOperacionCalcICAP;
  sagDatos.Cells [colImpConsumoCapitalBasico,       0] := colStrImpConsumoCapitalBasico;
  sagDatos.Cells [colPctConsumoCapitalBasico,       0] := colStrPctConsumoCapitalBasico;

  for c := 0 to sagDatos.ColCount - 1 do
    sagDatos.HintCell [c, 0] := sagDatos.Cells [c, 0];
end;

procedure TWCrCargaRiesgo.AbrirXLS (FileName: string);
type
  RecAcreditados = record
    IDAcreditado: integer;
    Registrado: boolean;
  end;
  ArrAcreditados = array of RecAcreditados;
var
  XLApp, Range, Sheet: Variant;
  r, Rows, Cols, i, n: integer;
  d: Double;
  TieneValor, DoubleValido: boolean;
  QExiste, QAcreditRel, QAcreditRequeridos, QReservas: TQuery;
  Acreditados: ArrAcreditados;
  Fecha: TDateTime;
begin
  edArchivoExcel.Text       := FileName;
  actAplicarCambios.Enabled := False;
  Fecha                     := ObtenFecha;
  Log ('**************************************************');
  Log (Format ('Inicia el proceso de carga del archivo [%s]', [FileName]));

  //Crea un objeto de Excel y abre el archivo
  XLApp := CreateOleObject('Excel.Application');

  //Crea la consulta para verificar el estado de cada crédito
  QExiste            := TQuery.Create (Self);

  //Crea la consulta para verificar si el acreditado debe corresponder con la lista de los que reportan en el R24
  QAcreditRel        := TQuery.Create (Self);

  //Crea la consulta de los acreditados que deben estar reportados en el R24
  QAcreditRequeridos := TQuery.Create (Self);

  //Crea la consulta que valida que la suma neta de reservas (Columna G) sea igual a la suma del saldo de la cartera menos la suma de las reservas en el R04C
  QReservas          := TQuery.Create (Self);
  try
    //Configura el query de validación
    QExiste.Close;
    QExiste.DatabaseName := Objeto.Apli.DataBaseName;
    QExiste.SessionName  := Objeto.Apli.SessionName;
    QExiste.SQL.Clear;
    QExiste.SQL.Add ('Select Count (1) Existe');
    QExiste.SQL.Add ('  From CR_Reg_Riesgo');
    QExiste.SQL.Add (' Where ID_Credito = :ID_Credito');
    QExiste.SQL.Add ('   And F_Consulta = :F_Consulta');
    QExiste.SQL.Add ('   And RowNum     = 1');

    //Configura el query de verificación de R24
    QAcreditRel.Close;
    QAcreditRel.DatabaseName := Objeto.Apli.DataBaseName;
    QAcreditRel.SessionName  := Objeto.Apli.SessionName;
    QAcreditRel.SQL.Clear;
    QAcreditRel.SQL.Add ('Select Ac.ID_Acreditado, Ac.B_Acreditado_Rel');
    QAcreditRel.SQL.Add ('  From CR_Credito    C');
    QAcreditRel.SQL.Add ('  Join Contrato      Cto On     C.ID_Contrato  = Cto.ID_Contrato');
    QAcreditRel.SQL.Add ('                            And C.Fol_Contrato = 1');
    QAcreditRel.SQL.Add ('  Join CR_Acreditado Ac  On     Cto.ID_Titular = Ac.ID_Acreditado');
    QAcreditRel.SQL.Add (' Where C.ID_Credito = :ID_Credito');

    //Configura el query para validar que la suma neta de reservas (Columna G) sea igual a la suma del saldo de la cartera menos la suma de las reservas en el R04C
    QReservas.Close;
    QReservas.DatabaseName := Objeto.Apli.DataBaseName;
    QReservas.SessionName  := Objeto.Apli.SessionName;
    QReservas.SQL.Clear;
    QReservas.SQL.Add ('Select Nvl (Imp_Cubierto, 0) Cartera, Nvl (Imp_Reserva_Cub, 0) Reservas, Nvl (Imp_Cubierto, 0) - Nvl (Imp_Reserva_Cub, 0) Cartera_Menos_Reservas');
    QReservas.SQL.Add ('  From CR_SICC_Califica');
    QReservas.SQL.Add (' Where Vigente    = 1');
    QReservas.SQL.Add ('   And Anio_Mes   = :AnioMes');
    QReservas.SQL.Add ('   And ID_Credito = :IDCredito');

    //Genera la lista de los acreditados que deben estar reportados
    QAcreditRequeridos.Close;
    QAcreditRequeridos.DatabaseName := Objeto.Apli.DataBaseName;
    QAcreditRequeridos.SessionName  := Objeto.Apli.SessionName;
    QAcreditRequeridos.SQL.Clear;
    QAcreditRequeridos.SQL.Add ('Select Distinct Ac.ID_Acreditado');
    QAcreditRequeridos.SQL.Add ('  From CR_Acreditado Ac');
    QAcreditRequeridos.SQL.Add ('  Join Contrato      Cto On     Ac.ID_Acreditado = Cto.ID_Titular');
    QAcreditRequeridos.SQL.Add ('                            And Cto.Sit_Contrato = ''AC''');
    QAcreditRequeridos.SQL.Add ('  Join CR_Credito    C   On     Cto.ID_Contrato  = C.ID_Contrato');
    QAcreditRequeridos.SQL.Add ('                            And C.Fol_Contrato   = 1');
    QAcreditRequeridos.SQL.Add ('                            And C.Sit_Credito    = ''AC''');
    QAcreditRequeridos.SQL.Add (' Where Ac.B_Acreditado_Rel = ''V''');
    QAcreditRequeridos.SQL.Add ('   And Ac.Sit_Acreditado   = ''AC''');
    QAcreditRequeridos.SQL.Add (' Order By Ac.ID_Acreditado');
    QAcreditRequeridos.Open;
    QAcreditRequeridos.Last;
    SetLength (Acreditados, QAcreditRequeridos.RecordCount);

    QAcreditRequeridos.First;
    i := 0;
    while not QAcreditRequeridos.Eof do
    begin
      Acreditados [i].IDAcreditado := QAcreditRequeridos.FieldByName ('ID_Acreditado').AsInteger;
      Acreditados [i].Registrado   := False;

      QAcreditRequeridos.Next;
      Inc (i);
    end;

    //Abre el archivo
    XLApp.WorkBooks.Open(FileName);

    //Determina el número total de registros que vienen en el archivo Excel
    Range                     := XLApp.WorkBooks[1].Worksheets[1].UsedRange;
    Sheet                     := XLApp.WorkBooks[1].Worksheets[1];
    Rows                      := Range.Rows.Count;
    Cols                      := Range.Columns.Count;
    DBGRiesgos.Visible        := False;
    ProgressBar.Position      := 0;
    ProgressBar.Visible       := True;

    //Determina el tamaño del Grid que se presenta
    sagDatos.RowCount := Rows;
    sagDatos.ColCount := Cols + 1;

    //Limpia los arreglos con los errores actuales
    LimpiaArrInfoAcred (NoRegistranR04);
    LimpiaArrInfoAcred (DifSumaReservas);

   //Recorre el archivo en excel para insertar los datos en el Grid
   for r := 2 to Rows do
   begin
     sagDatos.ColorRow [r - 1] := clWindow;

     sagDatos.Cells [colInfoNueva,                     r - 1] := '';
     sagDatos.Cells [colFConsulta,                     r - 1] := FormatDateTime ('dd/mm/yyyy', Fecha); // Sheet.Cells [r, colFConsulta];
     sagDatos.Cells [colIDCredito,                     r - 1] := Sheet.Cells [r, colIDCredito];
     sagDatos.Cells [colMitigante,                     r - 1] := Sheet.Cells [r, colMitigante];
     sagDatos.Cells [colGpoRiesgo,                     r - 1] := Sheet.Cells [r, colGpoRiesgo];
     sagDatos.Cells [colFactorConvRiesgoCred,          r - 1] := Sheet.Cells [r, colFactorConvRiesgoCred];
     sagDatos.Cells [colExpAjustadaMitigantes,         r - 1] := Sheet.Cells [r, colExpAjustadaMitigantes];
     sagDatos.Cells [colExpNetaReservas,               r - 1] := Sheet.Cells [r, colExpNetaReservas];
     sagDatos.Cells [colTablaAdeudo,                   r - 1] := Sheet.Cells [r, colTablaAdeudo];
     sagDatos.Cells [colGradoRiesgoMetEst,             r - 1] := Sheet.Cells [r, colGradoRiesgoMetEst];
     sagDatos.Cells [colEscalaCalificacion,            r - 1] := Sheet.Cells [r, colEscalaCalificacion];
     sagDatos.Cells [colAgenciaCalificadora,           r - 1] := Sheet.Cells [r, colAgenciaCalificadora];
     sagDatos.Cells [colCalificacion,                  r - 1] := Sheet.Cells [r, colCalificacion];
     sagDatos.Cells [colPonderadorRiesgo,              r - 1] := Sheet.Cells [r, colPonderadorRiesgo];
     sagDatos.Cells [colReqCapCredDispMetEst,          r - 1] := Sheet.Cells [r, colReqCapCredDispMetEst];
     sagDatos.Cells [colEnfoqueBasicoAvanzado,         r - 1] := Sheet.Cells [r, colEnfoqueBasicoAvanzado];
     sagDatos.Cells [colProbabilidadIncump,            r - 1] := Sheet.Cells [r, colProbabilidadIncump];
     sagDatos.Cells [colSeveridadPerdida,              r - 1] := Sheet.Cells [r, colSeveridadPerdida];
     sagDatos.Cells [colExposicionIncump,              r - 1] := Sheet.Cells [r, colExposicionIncump];
     sagDatos.Cells [colVencimiento,                   r - 1] := Sheet.Cells [r, colVencimiento];
     sagDatos.Cells [colCorrelacion,                   r - 1] := Sheet.Cells [r, colCorrelacion];
     sagDatos.Cells [colPonderadorRiesgoCapRiesgoCred, r - 1] := Sheet.Cells [r, colPonderadorRiesgoCapRiesgoCred];
     sagDatos.Cells [colReqCapCredDispMetInt,          r - 1] := Sheet.Cells [r, colReqCapCredDispMetInt];
     sagDatos.Cells [colImpCapitalBasico,              r - 1] := Sheet.Cells [r, colImpCapitalBasico];
     sagDatos.Cells [colImpCapitalBasico1,             r - 1] := Sheet.Cells [r, colImpCapitalBasico1];
     sagDatos.Cells [colImpCapitalBasico2,             r - 1] := Sheet.Cells [r, colImpCapitalBasico2];
     sagDatos.Cells [colPctLimiteMaximo,               r - 1] := Sheet.Cells [r, colPctLimiteMaximo];
     sagDatos.Cells [colCveOrigenOpOtrosActivos,       r - 1] := Sheet.Cells [r, colCveOrigenOpOtrosActivos];
     sagDatos.Cells [colImpDatoImporteOperacion,       r - 1] := Sheet.Cells [r, colImpDatoImporteOperacion];
     sagDatos.Cells [colCveRazonOpConsumeCapital,      r - 1] := Sheet.Cells [r, colCveRazonOpConsumeCapital];
     sagDatos.Cells [colImpOperacionCalcICAP,          r - 1] := Sheet.Cells [r, colImpOperacionCalcICAP];
     sagDatos.Cells [colImpConsumoCapitalBasico,       r - 1] := Sheet.Cells [r, colImpConsumoCapitalBasico];
     sagDatos.Cells [colPctConsumoCapitalBasico,       r - 1] := Sheet.Cells [r, colPctConsumoCapitalBasico];

     if not IsValidDate (sagDatos.Cells [colFConsulta, r - 1]) then
       sagDatos.ColorCell [colFConsulta, r - 1] := clInactiveCaption
     else
     begin
       try
         QExiste.Close;
         QExiste.ParamByName ('ID_Credito').AsString := sagDatos.Cells [colIDCredito, r - 1];
         QExiste.ParamByName ('F_Consulta').AsDate   := StringToDate (sagDatos.Cells [colFConsulta, r - 1]);
         QExiste.Open;

         if QExiste.FieldByName ('Existe').AsInteger > 0 then
         begin
           SagDatos.ColorCell [colIDCredito, r - 1] := clInactiveCaption;
           SagDatos.Cells     [colInfoNueva, r - 1] := IntToStr (ICO_Actualiza);
         end
         else
           SagDatos.Cells     [colInfoNueva, r - 1] := IntToStr (ICO_Nueva);
       except
         SagDatos.Cells     [colInfoNueva, r - 1] := IntToStr (ICO_Error);
         Log ('Error en ' + ResumenRenglon (r - 1));
       end;

       //Determina si debe verificarse en la lista de acreditados que reportan en R24
       TieneValor := False;
       for i := colImpCapitalBasico to colPctConsumoCapitalBasico do
         TieneValor := TieneValor or (sagDatos.Cells [i, r - 1] <> '');

       //Determina el ID de Acreditado para el crédito, y si el acreditado debe reportar la información al R24
       try
         QAcreditRel.Close;
         QAcreditRel.ParamByName ('ID_Credito').AsString := sagDatos.Cells [colIDCredito, r - 1];
         QAcreditRel.Open;

         if QAcreditRel.Eof then
         begin
//           sagDatos.ColorRow [r - 1] := ColorError;
//           Log (Format ('No se encontró la información del acreditado para el crédito [%s]', [sagDatos.Cells [colIDCredito, r - 1]]));
         end
         else
         begin
           if TieneValor Then
           begin
             //Marca el acreditado como ya registrado
             for i := 0 to Length (Acreditados) - 1 do
               if Acreditados [i].IDAcreditado = QAcreditRel.FieldByName ('ID_Acreditado').AsInteger then
               begin
                 Acreditados [i].Registrado := True;
                 break;
               end;

             if QAcreditRel.FieldByName ('B_Acreditado_Rel').AsString = 'F' then
             begin
               sagDatos.ColorRow [r - 1] := ColorError;
               AgregaArrInfoAcred (NoRegistranR04);
               NoRegistranR04 [Length (NoRegistranR04) - 1].ID_Acreditado := QAcreditRel.FieldByName ('ID_Acreditado').AsInteger;
               NoRegistranR04 [Length (NoRegistranR04) - 1].ID_Credito    := StrToInt (sagDatos.Cells [colIDCredito, r - 1]);
             end
             else
             begin
               QReservas.Close;
               QReservas.ParamByName ('AnioMes').AsString    := ObtenFechaAnioMes;
               QReservas.ParamByName ('IDCredito').AsInteger := QAcreditRel.FieldByName ('ID_Acreditado').AsInteger;
               QReservas.Open;

               DoubleValido := TryStrToFloat (sagDatos.Cells [colExpNetaReservas, r - 1], d);

               if  //Hay reservas y no se encontró la cartera menos las reservas
                   (DoubleValido and QReservas.Eof) or
                   //Sí se encontraron las reservas y la cartera menos las reservas, pero son diferentes
                   (DoubleValido and not QReservas.Eof and (QReservas.FieldByName ('Cartera_Menos_Reservas').AsFloat <> d)) then
               begin
                 sagDatos.ColorRow [r - 1] := ColorError;
                 AgregaArrInfoAcred (DifSumaReservas);
                 DifSumaReservas [Length (DifSumaReservas) - 1].ID_Acreditado   := QAcreditRel.FieldByName ('ID_Acreditado').AsInteger;
                 DifSumaReservas [Length (DifSumaReservas) - 1].ID_Credito      := StrToInt (sagDatos.Cells [colIDCredito, r - 1]);
                 DifSumaReservas [Length (DifSumaReservas) - 1].CarteraR04      := QReservas.FieldByName ('Cartera').AsFloat;
                 DifSumaReservas [Length (DifSumaReservas) - 1].ReservaR04      := QReservas.FieldByName ('Reservas').AsFloat;
                 DifSumaReservas [Length (DifSumaReservas) - 1].ReservaNetaColG := d;
               end;
             end;
           end
         end;
       except
         SagDatos.Cells     [colInfoNueva, r - 1] := IntToStr (ICO_Error);
         Log ('Error en ' + ResumenRenglon (r - 1));
       end;
     end;

     ProgressBar.Position := Math.Ceil (r / Rows * 100);
     Application.ProcessMessages;
   end;
   sagDatos.Row := 1;
  finally
    XLApp.Quit;
    QExiste.Free;
    QAcreditRel.Free;
    QAcreditRequeridos.Free;
    QReservas.Free;

    //Desasignar las variables del Archivo Excel
    XLApp := Unassigned;
    Range := Unassigned;
    Sheet := Unassigned;

    ProgressBar.Visible       := False;
    actAplicarCambios.Enabled := True;

    //Despliega los acreditados que no deben registrar información de R24
    if Length (NoRegistranR04) > 0 then
    begin
      Log (Format ('------ Se encontraron %d acreditado(s) que no deben registrar información de R24-------', [Length (NoRegistranR04)]));
      Consola.Lines.Add ('');
      Consola.Lines.Add ('ID_Acreditado' + #9 +
                         'ID_Credito');

      for i := 0 to Length (NoRegistranR04) - 1 do
        Consola.Lines.Add (IntToStr (NoRegistranR04 [i].ID_Acreditado) + #9 +
                           IntToStr (NoRegistranR04 [i].ID_Credito));

      Consola.Lines.Add ('');
    end;

    //Despliega los acreditados en los que la suma neta de reservas (Columna G) no es igual a la suma del saldo de la cartera menos la suma de las reservas en el R04C
    if Length (DifSumaReservas) > 0 then
    begin
      Log (Format ('------ Se encontraron %d acreditado(s) en los que la suma neta de reservas (Columna G) no es igual a la suma del saldo de la cartera menos la suma de las reservas en el R04C-------', [Length (DifSumaReservas)]));
      Consola.Lines.Add ('');
      Consola.Lines.Add ('ID_Acreditado' + #9 +
                         'ID_Credito'    + #9 +
                         'Cartera R04'   + #9 +
                         'Reservas R04'  + #9 +
                         'Reserva Neta Columna G');

      for i := 0 to Length (DifSumaReservas) - 1 do
        Consola.Lines.Add (IntToStr   (DifSumaReservas [i].ID_Acreditado) + #9 +
                           IntToStr   (DifSumaReservas [i].ID_Credito)    + #9 +
                           FloatToStr (DifSumaReservas [i].CarteraR04)    + #9 +
                           FloatToStr (DifSumaReservas [i].ReservaR04)    + #9 +
                           FloatToStr (DifSumaReservas [i].ReservaNetaColG));

      Consola.Lines.Add ('');
    end;

    //Determina cuantos acreditados requeridos en el R24 no tuvieron información registrada
    n := 0;
    for i := 0 to Length (Acreditados) - 1 do
      Inc (n, Ord (not Acreditados [i].Registrado));

    //Si hubo acreditados requeridos en el R24 que no tuvieron información registrada, se despliega su información
    if n > 0 then
    begin
      Log (Format ('------ Se encontraron %d acreditado(s) sin información registrada que deben reportar en el R24-------', [n]));
      Consola.Lines.Add ('');
      Consola.Lines.Add ('ID_Acreditado');

      for i := 0 to Length (Acreditados) - 1 do
        if not Acreditados [i].Registrado then
          Consola.Lines.Add (IntToStr (Acreditados [i].IDAcreditado));

      Consola.Lines.Add ('');
    end;

    Log (Format ('Termina el proceso de carga del archivo [%s]', [FileName]));
    Log ('**************************************************');
    MessageDlg (Format ('Proceso de carga del archivo [%s] concluido.', [FileName]), mtInformation, [mbOk], 0);
  end;
end;

procedure TWCrCargaRiesgo.actAbrirArchivoExecute(Sender: TObject);
begin
  if OpenDlgArchivoExcel.Execute then
  begin
    Cursor := crHourGlass;
    try
      AbrirXLS (OpenDlgArchivoExcel.FileName);
      Cursor := crDefault;
    finally
      Cursor := crDefault;
    end;
  end;
end;

procedure TWCrCargaRiesgo.Log (S: string);
begin
  Consola.Lines.Add (FormatDateTime ('yyyy/mm/dd hh:nn:ss:zzz', Now) + ' ' + s);
end;

function TWCrCargaRiesgo.ResumenRenglon (r: integer): string;
begin
  result := '';
  if not InRange (r, 1, sagDatos.RowCount - 1) then exit;

  result := Format ('ID Crédito: [%s]; Fecha Consulta: [%s]', [sagDatos.Cells [colIDCredito, r], sagDatos.Cells [colFConsulta, r]]);
end;

procedure TWCrCargaRiesgo.actAplicarCambiosExecute(Sender: TObject);
var
  SP: TStoredProc;
  r: integer;
  HayError, ProcesoOK, OtrasExcepciones: boolean;

  function GuardaRegistro (r: integer): boolean;
  var
    HayError: boolean;
    doub: double;
    Int, i: integer;
  begin
    result := False;

    //Limpia los parámetros previamente para que no arrastre valores de renglones anteriores.
    for i := 0 to SP.ParamCount - 1 do
      if SP.Params [i].ParamType in [ptInput, ptInputOutput] then
        SP.Params [i].Clear;

    HayError := not TryStrToInt (sagDatos.Cells [colIDCredito, r], Int);
    if HayError then exit;
    SP.ParamByName ('PEID_CREDITO').AsFloat := Int;

    HayError := not IsValidDate (sagDatos.Cells [colFConsulta, r]);
    if HayError then exit;
    SP.ParamByName('PEF_CONSULTA').AsDate := StringToDate (sagDatos.Cells [colFConsulta, r]);

    if Trim (sagDatos.Cells [colMitigante, r]) <> '' then
    begin
      HayError := not TryStrToInt (sagDatos.Cells [colMitigante, r], Int);
      if HayError then exit;
      SP.ParamByName ('PECVE_MITIGANTE').AsFloat := Int;
    end;

    if Trim (sagDatos.Cells [colGpoRiesgo, r]) <> '' then
    begin
      HayError := not TryStrToInt (sagDatos.Cells [colGpoRiesgo, r], Int);
      if HayError then exit;
      SP.ParamByName ('PECVE_GPO_RIESGO').AsFloat := Int;
    end;

    if Trim (sagDatos.Cells [colFactorConvRiesgoCred, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colFactorConvRiesgoCred,  r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEPCT_FACTOR_CONVERSION_RIESGO').AsFloat := Doub;
    end;

    if Trim (sagDatos.Cells [colExpAjustadaMitigantes, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colExpAjustadaMitigantes, r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEIMP_EXPOSIC_AJUST_MITIGANTE').AsFloat := Doub;
    end;

    if Trim (sagDatos.Cells [colExpNetaReservas, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colExpNetaReservas,       r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEIMP_EXPOSIC_NETA_RESERVA').AsFloat := Doub;
    end;

    if Trim (sagDatos.Cells [colTablaAdeudo, r]) <> '' then
    begin
      HayError := not TryStrToInt (sagDatos.Cells [colTablaAdeudo,        r], Int);
      if HayError then exit;
      SP.ParamByName ('PECVE_TABLA_ADEUDO').AsFloat := Int;
    end;

    if Trim (sagDatos.Cells [colGradoRiesgoMetEst, r]) <> '' then
    begin
      HayError := not TryStrToInt (sagDatos.Cells [colGradoRiesgoMetEst,  r], Int);
      if HayError then exit;
      SP.ParamByName ('PECVE_GRADO_RIESGO_MET_EST').AsFloat := Int;
    end;

    if Trim (sagDatos.Cells [colEscalaCalificacion, r]) <> '' then
    begin
      HayError := not TryStrToInt (sagDatos.Cells [colEscalaCalificacion, r], Int);
      if HayError then exit;
      SP.ParamByName ('PECVE_ESCALA_CALIFICACION').AsFloat := Int;
    end;

    SP.ParamByName ('PECVE_AGENCIA_CALIFICADORA').AsString := sagDatos.Cells [colAgenciaCalificadora, r];

    if Trim (sagDatos.Cells [colCalificacion, r]) <> '' then
    begin
      HayError := not TryStrToInt (sagDatos.Cells [colCalificacion, r], Int);
      if HayError then exit;
      SP.ParamByName ('PECALIFICACION').AsFloat := Int;
    end;

    if Trim (sagDatos.Cells [colPonderadorRiesgo, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colPonderadorRiesgo, r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEPCT_PONDERADOR_RIESGO').AsFloat := Doub;
    end;

    if Trim (sagDatos.Cells [colReqCapCredDispMetEst, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colReqCapCredDispMetEst, r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEIMP_REQ_CAP_CRED_DISPMETEST').AsFloat := Doub;
    end;

    if Trim (sagDatos.Cells [colEnfoqueBasicoAvanzado, r]) <> '' then
    begin
      HayError := not TryStrToInt (sagDatos.Cells [colEnfoqueBasicoAvanzado, r], Int);
      if HayError then exit;
      SP.ParamByName ('PECVE_ENFOQUE_BASICO_AVANZADO').AsFloat := Int;
    end;

    if Trim (sagDatos.Cells [colProbabilidadIncump, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colProbabilidadIncump, r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEPCT_PROB_INCUMPLIMIENTO').AsFloat := Doub;
    end;

    if Trim (sagDatos.Cells [colSeveridadPerdida, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colSeveridadPerdida,   r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEPCT_SEVERIDAD_PERDIDA').AsFloat := Doub;
    end;

    if Trim (sagDatos.Cells [colExposicionIncump, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colExposicionIncump,   r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEIMP_EXPOSIC_INCUMPLIMIENTO').AsFloat := Doub;
    end;

    if Trim (sagDatos.Cells [colVencimiento, r]) <> '' then
    begin
      HayError := not TryStrToInt (sagDatos.Cells [colVencimiento, r], Int);
      if HayError then exit;
      SP.ParamByName ('PENUM_MESES_VENCIMIENTO').AsFloat := Int;
    end;

    if Trim (sagDatos.Cells [colCorrelacion, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colCorrelacion,                   r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEPCT_CORRELACION').AsFloat := Doub;
    end;

    if Trim (sagDatos.Cells [colPonderadorRiesgoCapRiesgoCred, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colPonderadorRiesgoCapRiesgoCred, r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEPCT_POND_REQ_CAP_RIESGO_CRED').AsFloat := Doub;
    end;

    if Trim (sagDatos.Cells [colReqCapCredDispMetInt, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colReqCapCredDispMetInt,          r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEIMP_REQ_CAP_CRED_DISPMETINT').AsFloat := Doub;
    end;

    if Trim (sagDatos.Cells [colImpCapitalBasico, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colImpCapitalBasico,              r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEIMP_CAPITAL_BASICO').AsFloat := Doub;
    end;

    if Trim (sagDatos.Cells [colImpCapitalBasico1, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colImpCapitalBasico1,             r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEIMP_CAPITAL_BASICO_1').AsFloat := Doub;
    end;

    if Trim (sagDatos.Cells [colImpCapitalBasico2, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colImpCapitalBasico2,             r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEIMP_CAPITAL_BASICO_2').AsFloat := Doub;
    end;

    if Trim (sagDatos.Cells [colPctLimiteMaximo, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colPctLimiteMaximo,               r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEPCT_LIMITE_MAXIMO').AsFloat := Doub;
    end;

    SP.ParamByName ('PECVE_ORIGEN_OP_OTROS_ACTIVOS' ).AsString := sagDatos.Cells [colCveOrigenOpOtrosActivos,  r];

    if Trim (sagDatos.Cells [colImpDatoImporteOperacion, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colImpDatoImporteOperacion,       r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEIMP_DATO_IMPORTE_OPERACION').AsFloat := Doub;
    end;

    SP.ParamByName ('PECVE_RAZON_OP_CONSUME_CAPITAL').AsString := sagDatos.Cells [colCveRazonOpConsumeCapital, r];

    if Trim (sagDatos.Cells [colImpOperacionCalcICAP, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colImpOperacionCalcICAP,          r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEIMP_OPERACION_CALC_ICAP').AsFloat := Doub;
    end;

    if Trim (sagDatos.Cells [colImpConsumoCapitalBasico, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colImpConsumoCapitalBasico,       r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEIMP_CONSUMO_CAPITAL_BASICO').AsFloat := Doub;
    end;

    if Trim (sagDatos.Cells [colPctConsumoCapitalBasico, r]) <> '' then
    begin
      HayError := not TryStrToFloat (sagDatos.Cells [colPctConsumoCapitalBasico,       r], Doub);
      if HayError then exit;
      SP.ParamByName ('PEPCT_CONSUMO_CAPITAL_BASICO').AsFloat := Doub;
    end;

    SP.ParamByName ('PECVE_USU_REGISTRO').AsString := Objeto.Apli.Usuario;
    try
      SP.ExecProc;

      if SP.ParamByName ('PSERROR').AsInteger = 0 then
        result := True
      else
      begin
        Log (Format ('Error en %s, con el mensaje de error: [%s]', [ResumenRenglon (r), SP.ParamByName ('PSMSGERROR').AsString]));
        sagDatos.Cells [colInfoNueva, r] := IntToStr (ICO_Error);
      end
    except
      on E: Exception do
      begin
        Log (Format ('Error en %s, con la excepción: [%s]', [ResumenRenglon (r), E.Message]));
        sagDatos.Cells [colInfoNueva, r] := IntToStr (ICO_Error);
      end;
    end;
  end;

var
  ID_Credito: Longint;

begin
  Log ('**************************************************');
  Log ('Inicia el proceso de salvado en base de datos');

  SP               := TStoredProc.Create (Self);
  ProcesoOk        := True;
  OtrasExcepciones := False;
  try
    try
      //Primero se elimina la información de todos los créditso para esa fecha. Si está dentro del mes actual, se aplica Delete, pero si es información de un mes
      //anterior se incrementa el ID_Reg_Vigente
      SP.DatabaseName   := Objeto.Apli.DataBaseName;
      SP.SessionName    := Objeto.Apli.SessionName;
      SP.StoredProcName := 'PKGCRCONSOLIDADO1.STP_BAJA_CR_REG_RIESGO';
      SP.Params.Clear;
      SP.Params.CreateParam (ftDate,   'PEF_CONSULTA', ptInput);
      SP.Params.CreateParam (ftFloat,  'PSERROR',      ptOutput);
      SP.Params.CreateParam (ftString, 'PSMSGERROR',   ptOutput);
      SP.Prepare;
      SP.ParamByName('PEF_CONSULTA').AsDate := ObtenFecha;
      SP.ExecProc;

      ProcesoOK := SP.ParamByName ('PSERROR').AsInteger = 0;
      if not ProcesoOK then exit;

      //Si es nuevo, lo da de alta. Si ya existe, lo actualiza y genera una nueva versión.
      SP.Close;
      SP.StoredProcName := 'PKGCRCONSOLIDADO1.STP_INS_CR_REG_RIESGO';
      SP.Params.Clear;
      SP.Params.CreateParam (ftFloat,  'PEID_CREDITO',                   ptInput);
      SP.Params.CreateParam (ftDate,   'PEF_CONSULTA',                   ptInput);
      SP.Params.CreateParam (ftFloat,  'PECVE_MITIGANTE',                ptInput);
      SP.Params.CreateParam (ftFloat,  'PECVE_GPO_RIESGO',               ptInput);
      SP.Params.CreateParam (ftFloat,  'PEPCT_FACTOR_CONVERSION_RIESGO', ptInput);
      SP.Params.CreateParam (ftFloat,  'PEIMP_EXPOSIC_AJUST_MITIGANTE',  ptInput);
      SP.Params.CreateParam (ftFloat,  'PEIMP_EXPOSIC_NETA_RESERVA',     ptInput);
      SP.Params.CreateParam (ftFloat,  'PECVE_TABLA_ADEUDO',             ptInput);
      SP.Params.CreateParam (ftFloat,  'PECVE_GRADO_RIESGO_MET_EST',     ptInput);
      SP.Params.CreateParam (ftFloat,  'PECVE_ESCALA_CALIFICACION',      ptInput);
      SP.Params.CreateParam (ftString, 'PECVE_AGENCIA_CALIFICADORA',     ptInput);
      SP.Params.CreateParam (ftFloat,  'PECALIFICACION',                 ptInput);
      SP.Params.CreateParam (ftFloat,  'PEPCT_PONDERADOR_RIESGO',        ptInput);
      SP.Params.CreateParam (ftFloat,  'PEIMP_REQ_CAP_CRED_DISPMETEST',  ptInput);
      SP.Params.CreateParam (ftFloat,  'PECVE_ENFOQUE_BASICO_AVANZADO',  ptInput);
      SP.Params.CreateParam (ftFloat,  'PEPCT_PROB_INCUMPLIMIENTO',      ptInput);
      SP.Params.CreateParam (ftFloat,  'PEPCT_SEVERIDAD_PERDIDA',        ptInput);
      SP.Params.CreateParam (ftFloat,  'PEIMP_EXPOSIC_INCUMPLIMIENTO',   ptInput);
      SP.Params.CreateParam (ftFloat,  'PENUM_MESES_VENCIMIENTO',        ptInput);
      SP.Params.CreateParam (ftFloat,  'PEPCT_CORRELACION',              ptInput);
      SP.Params.CreateParam (ftFloat,  'PEPCT_POND_REQ_CAP_RIESGO_CRED', ptInput);
      SP.Params.CreateParam (ftFloat,  'PEIMP_REQ_CAP_CRED_DISPMETINT',  ptInput);
      SP.Params.CreateParam (ftFloat,  'PEIMP_CAPITAL_BASICO',           ptInput);
      SP.Params.CreateParam (ftFloat,  'PEIMP_CAPITAL_BASICO_1',         ptInput);
      SP.Params.CreateParam (ftFloat,  'PEIMP_CAPITAL_BASICO_2',         ptInput);
      SP.Params.CreateParam (ftFloat,  'PEPCT_LIMITE_MAXIMO',            ptInput);
      SP.Params.CreateParam (ftString, 'PECVE_ORIGEN_OP_OTROS_ACTIVOS',  ptInput);
      SP.Params.CreateParam (ftFloat,  'PEIMP_DATO_IMPORTE_OPERACION',   ptInput);
      SP.Params.CreateParam (ftString, 'PECVE_RAZON_OP_CONSUME_CAPITAL', ptInput);
      SP.Params.CreateParam (ftFloat,  'PEIMP_OPERACION_CALC_ICAP',      ptInput);
      SP.Params.CreateParam (ftFloat,  'PEIMP_CONSUMO_CAPITAL_BASICO',   ptInput);
      SP.Params.CreateParam (ftFloat,  'PEPCT_CONSUMO_CAPITAL_BASICO',   ptInput);
      SP.Params.CreateParam (ftString, 'PECVE_USU_REGISTRO',             ptInput);
      SP.Params.CreateParam (ftFloat,  'PSERROR',                        ptOutput);
      SP.Params.CreateParam (ftString, 'PSMSGERROR',                     ptOutput);
      ProgressBar.Position      := 0;
      ProgressBar.Visible       := True;
      actAplicarCambios.Enabled := False;
      DBGRiesgos.Visible        := False;

      for r := 1 to sagDatos.RowCount - 1 do
      begin
        SP.Prepare;
        HayError := False;

        ID_Credito := StrToInt64 (sagDatos.Cells [colIDCredito, r]);
           //O permite que se registren los créditos con error
        if cbIncluirCreditosConError.Checked or
           //O no debe estar registrado en ninguna de las listas de error
           ((BuscarCreditoArrInfoAcred (NoRegistranR04, ID_Credito) = -1) and (BuscarCreditoArrInfoAcred (DifSumaReservas, ID_Credito) = -1))
        then
        begin
          try
            HayError             := not GuardaRegistro (r);
            ProgressBar.Position := Math.Ceil (r / (sagDatos.RowCount - 1) * 100);
            Application.ProcessMessages;
          finally
            if HayError then
            begin
              Log ('Error en ' + ResumenRenglon (r));
              sagDatos.Cells [colInfoNueva, r] := IntToStr (ICO_Error);
            end;
          end;
        end;
      end;
    except
      on E: Exception do
      begin
        OtrasExcepciones := True;
        Log (Format ('Error en el proceso de salvado en base de datos, con el mensaje de error: [%s]', [E.Message]));
        Log ('**************************************************');
        MessageDlg ('Hubo un problema en el proceso de salvado en base de datos', mtError, [mbOk], 0);
      end;
    end;
  finally
    ProgressBar.Visible       := False;
    actAplicarCambios.Enabled := ProcesoOK;
    DBGRiesgos.Visible        := ProcesoOK;

    if not OtrasExcepciones then
    begin
      if ProcesoOK then
      begin
        cbAnioClick (cbAnio);
        Log ('Termina el proceso de salvado en base de datos');
        Log ('**************************************************');
        MessageDlg ('Proceso de salvado en base de datos concluido.', mtInformation, [mbOk], 0);
      end
      else
      begin
        Log (Format ('Error en el borrado de los datos, con el mensaje de error: [%s]', [SP.ParamByName ('PSMSGERROR').AsString]));
        Log ('**************************************************');
        MessageDlg ('Hubo un problema en el borrado de los datos.', mtError, [mbOk], 0);
      end;
    end;
    SP.Free;
  end;
end;

function TWCrCargaRiesgo.ObtenFecha: TDateTime;
var
  Query: TQuery;
begin
  Query  := TQuery.Create (Self);
  try
    try
      Query.DatabaseName := Objeto.Apli.DataBaseName;
      Query.SessionName  := Objeto.Apli.SessionName;
      Query.SQL.Clear;
      Query.SQL.Add ('Select Last_Day (To_Date (''01/'' || LPad (:Mes, 2, ''0'') || ''/'' || :Anio, ''dd/mm/yyyy'')) Fecha From Dual');
      Query.ParamByName ('Anio').AsInteger := StrToInt (cbAnio.Items [cbAnio.ItemIndex]);
      Query.ParamByName ('Mes' ).AsInteger := cbMes.ItemIndex + 1;
      Query.Open;

      result := Query.FieldByName ('Fecha').AsDateTime;
    except
      result := Objeto.Apli.DameFechaEmpresa;
    end;
  finally
    Query.Free;
  end;
end;

function TWCrCargaRiesgo.ObtenFechaAnioMes: string;
var
  Mes: string;
begin
  Mes := IntToStr (cbMes.ItemIndex + 1);
  if Length (Mes) = 1 then
    Mes := '0' + Mes;

  result := cbAnio.Items [cbAnio.ItemIndex] + Mes;
end;

procedure TWCrCargaRiesgo.cbAnioClick(Sender: TObject);
begin
  if (cbAnio.ItemIndex = -1) or (cbMes.ItemIndex = -1) or (QRiesgos.DatabaseName = '') or (QRiesgos.SessionName = '') then exit;

  QRiesgos.Close;
  QRiesgos.ParamByName ('F_Consulta').AsDate := ObtenFecha;
  QRiesgos.Open;
end;

end.
