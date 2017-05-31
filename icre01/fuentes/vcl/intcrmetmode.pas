// Sistema         : Clase de CR_MET_MODELO
// Fecha de Inicio : 06/02/2013
// Función forma   : Clase de CR_MET_MODELO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrMetMode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, uMetComFramework, Grids,
  Aligrid, VirtualTrees, ImgList, ActnList, QStrings, IntCrMetModeVistaPrevia,
  IntCrMetVari;

const
  ICO_Error   = 0;
  ICO_OK      = 1;
  ICO_Edicion = 9;

type
  TCrMetMode= class;

  TWCrMetModelo = class (TForm)
    InterForma1: TInterForma;
    GBModelo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EModelo_ID: TEdit;
    EModelo_Descripcion: TEdit;
    GBBloques: TGroupBox;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    EBloque_ID: TEdit;
    EBloque_Descripcion: TEdit;
    CBBloque_Grupo_Repeticion: TCheckBox;
    EBloque_Nombre: TEdit;
    GroupBox4: TGroupBox;
    btnAgregarBloque: TBitBtn;
    btnAgregarSubBloque: TBitBtn;
    btnEliminarBloque: TBitBtn;
    btnSubirBloque: TBitBtn;
    btnBajarBloque: TBitBtn;
    btnModeloNuevo: TButton;
    btnModeloModificar: TButton;
    btnModeloGuardar: TButton;
    btnCancelar: TButton;
    btnModeloBuscar: TButton;
    Label9: TLabel;
    EModelo_Nombre: TEdit;
    RGModelo_Situacion: TRadioGroup;
    Arbol: TVirtualStringTree;
    TreeView1: TTreeView;
    V: TActionList;
    ImageList1: TImageList;
    actBloqueAgregar: TAction;
    actBloqueAgregarSubBloque: TAction;
    actBloqueEliminar: TAction;
    actBloqueSubir: TAction;
    actBloqueBajar: TAction;
    actModeloGuardar: TAction;
    actModeloNuevo: TAction;
    actModeloCancelar: TAction;
    actModeloModificar: TAction;
    actModeloBuscar: TAction;
    actColumnaVariables: TAction;
    actColumnaAgregar: TAction;
    actColumnaEliminar: TAction;
    actColumnaSubir: TAction;
    actColumnaBajar: TAction;
    btnColumnaVariables: TBitBtn;
    btnColumnaAgregar: TBitBtn;
    btnColumnaEliminar: TBitBtn;
    btnColumnaSubir: TBitBtn;
    btnColumnaBajar: TBitBtn;
    Columnas: TVirtualStringTree;
    Label6: TLabel;
    Label10: TLabel;
    EColumnaVariableID: TEdit;
    EColumnaVariableNombre: TEdit;
    EColumnaVariableDescripcion: TEdit;
    Label11: TLabel;
    RGColumnaSituacion: TRadioGroup;
    CBColumnaObligatorio: TCheckBox;
    CBColumnaCampoLlave: TCheckBox;
    CBColumnaVisible: TCheckBox;
    CBModeloCambiado: TCheckBox;
    btnVistaPrevia: TBitBtn;
    actModeloVistaPrevia: TAction;
    RGBloque_Situacion: TRadioGroup;
    Modelo: TModelo;
    btnImportarModelo: TBitBtn;
    btnExportarModelo: TBitBtn;
    actModeloImportar: TAction;
    actModeloExportar: TAction;
    SaveDlgModelo: TSaveDialog;
    OpenDlgModelo: TOpenDialog;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ArbolGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: Integer; TextType: TVSTTextType; var Text: WideString);
    procedure ArbolChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure EModelo_NombreChange(Sender: TObject);
    procedure EModelo_DescripcionChange(Sender: TObject);
    procedure RGModelo_SituacionClick(Sender: TObject);
    procedure actBloqueAgregarExecute(Sender: TObject);
    procedure actBloqueAgregarSubBloqueExecute(Sender: TObject);
    procedure actBloqueEliminarExecute(Sender: TObject);
    procedure actBloqueSubirExecute(Sender: TObject);
    procedure actBloqueBajarExecute(Sender: TObject);
    procedure actModeloGuardarUpdate(Sender: TObject);
    procedure actModeloGuardarExecute(Sender: TObject);
    procedure actModeloNuevoExecute(Sender: TObject);
    procedure actModeloCancelarExecute(Sender: TObject);
    procedure actModeloModificarExecute(Sender: TObject);
    procedure actModeloBuscarExecute(Sender: TObject);
    procedure EBloque_DescripcionChange(Sender: TObject);
    procedure CBBloque_Grupo_RepeticionClick(Sender: TObject);
    procedure ArbolGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: Integer;
      var Index: Integer);
    procedure actColumnaVariablesExecute(Sender: TObject);
    procedure actColumnaAgregarExecute(Sender: TObject);
    procedure actColumnaEliminarExecute(Sender: TObject);
    procedure actColumnaSubirExecute(Sender: TObject);
    procedure actColumnaBajarExecute(Sender: TObject);
    procedure ColumnasGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: Integer; TextType: TVSTTextType; var Text: WideString);
    procedure ColumnasGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: Integer;
      var Index: Integer);
    procedure ColumnasChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure RGColumnaSituacionClick(Sender: TObject);
    procedure CBColumnaObligatorioClick(Sender: TObject);
    procedure CBColumnaCampoLlaveClick(Sender: TObject);
    procedure CBColumnaVisibleClick(Sender: TObject);
    procedure actModeloVistaPreviaExecute(Sender: TObject);
    procedure EModelo_NombreExit(Sender: TObject);
    procedure RGBloque_SituacionClick(Sender: TObject);
    procedure ModeloDespuesCambio(Sender: TObject);
    procedure ColumnasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ArbolKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure ArbolMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actModeloImportarExecute(Sender: TObject);
    procedure actModeloExportarExecute(Sender: TObject);
  private
    { Private declarations }
    CargandoModelo: boolean;
    CargandoBloque: boolean;
    CargandoColumna: boolean;
    VistaPrevia: TTModeloVistaPrevia;
    procedure ModeloNuevo;
    function IdentificadorValido (Nombre: string): boolean;
    procedure LimpiaModelo;
    procedure LimpiaBloque;
    procedure LimpiaColumna;
    procedure CargaColumnas;
    procedure DespliegaModelo;
    procedure AplicaEstatusControl (Control: TControl; Habilitado: boolean);
    procedure ActualizaEstatusAcciones;
    procedure DespliegaErrorDB (Msg: string);
    function BloqueActual: TBloque;
    function ColumnaActual: TColumna;
    function ObtenNombreNuevoBloque: string;
    procedure SalvarModeloAStream (Stream: TStream);
    procedure CargarModeloDesdeStream (Stream: TStream);
    procedure SalvarModeloAArchivo (NombreArchivo: string);
    procedure CargarModeloDesdeArchivo (NombreArchivo: string);
  public
    { Public declarations }
    Objeto : TCrMetMode;
  end;

  TCrMetMode = class(TInterFrame)
  private
  protected
  //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    { Public declarations }
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;

  TAccionImportar = (aiImportarVerificarVariables, aiVerificarModelo, aiImportacionModelo, aiRenombraVariables);
  RecSinonimo = record
    NombreVariable: string;
    Sinonimo:       string;
  end;

  TModeloStream = class (TModelo)
  private
    VarUsadas:                  TList;
    BloquesUsados:              TList;
    FIncluirVariablesInactivas: boolean;
    FIncluirBloquesInactivos:   boolean;
    FVariablesLocales:          boolean;
    Sinonimos:                  array of RecSinonimo;
    AltaVariables:              TStringList;
    FFechaEmpresa:              TDate;
    procedure Extrae_Variables_Usadas;
    procedure Limpiar_Variables_Usadas;
    procedure Extrae_Bloques_Usados;
    procedure Limpiar_Bloques_Usados;
    function Salvar_Var_A_Stream (Stream: TStream; V: TVariable): boolean;
    function Cargar_Var_Desde_Stream (Stream: TStream; V: TVariable): boolean;
    function Salvar_Bloque_A_Stream (Stream: TStream; B: TBloque): boolean;
    function Cargar_Bloque_Desde_Stream (Stream: TStream; Accion: TAccionImportar): boolean;
    function Verifica_Variables: boolean;
    function Verifica_Modelo: boolean;
    function Existe_El_Modelo_En_DB (NombreModelo: string): boolean;
    function IdentificadorValido (Nombre: string): boolean;
    function Obten_Posicion_Sinonimo (Variable: string): integer;
    function Obten_Sinonimo (Variable: string): string;
    procedure Limpiar_Sinonimos;
    procedure Agregar_Sinonimo (Variable, Sinonimo: string);
    function Variables_Iguales (V1, V2: TVariable): boolean;
    procedure Salvar_Variable_A_DB (V: TVariable; var Error: integer; var MsgError: string);
    function Buscar_Variables_Usadas (NombreVariable: string): TVariable;
    procedure Reasigna_Variables_Modelo (Error: integer; MsgError: string);
    procedure Exportar_Variables_A_DB (var Error: integer; var MsgError: string);
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    function Salvar_A_Stream (Stream: TStream): boolean;
    function Cargar_Desde_Stream (Stream: TStream; Accion: TAccionImportar): boolean;
    procedure Exportar_A_DB (Stream: TStream; var Error: integer; var MsgError: string);
    property IncluirVariablesInactivas: boolean read FIncluirVariablesInactivas write FIncluirVariablesInactivas;
    property IncluirBloquesInactivos:   boolean read FIncluirBloquesInactivos   write FIncluirBloquesInactivos;
    property FechaEmpresa: TDate read FFechaEmpresa write FFechaEmpresa;
  end;

implementation

uses IntDmMain, IntMain;
//Uses RepMon;

{$R *.DFM}

type
  TCharBuffer = array [0..(16 * 1024) - 1] of char;

const
  strIDModelosDinamicos = '[DYNMOD1.0]';

{Stream Routines}
procedure WriteStringToStream (Stream: TStream; S: string);
var
  n: integer;
begin
  n := Length (S);
  Stream.Write (n, SizeOf (n));
  Stream.Write (PChar (S)^, Length (S));
end;

procedure ReadStringFromStream (Stream: TStream; var S: String);
var
  Buffer: TCharBuffer;
  n: integer;
begin
  Stream.Read(n, SizeOf (n));
  FillChar (Buffer, SizeOf (Buffer), 0);
  Stream.Read(Buffer, n);
  S := string (Buffer);
end;

procedure WriteWordToStream (Stream: TStream; W: word);
begin
  Stream.Write(W, SizeOf (W));
end;

procedure ReadWordToStream (Stream: TStream; var W: Word);
begin
  Stream.Read(W, SizeOf (W));
end;

procedure WriteDWordToStream (Stream: TStream; W: DWord);
begin
  Stream.Write(W, SizeOf (W));
end;

procedure ReadDWordFromStream (Stream: TStream; var W: DWord);
begin
  Stream.Write(W, SizeOf (W));
end;

procedure WriteIntToStream (Stream: TStream; I: integer);
begin
  Stream.Write(I, SizeOf (I));
end;

procedure ReadIntFromStream (Stream: TStream; var I: integer);
begin
  Stream.Read(I, SizeOf (I));
end;

procedure WriteLongintToStream (Stream: TStream; L: Longint);
begin
  Stream.Write(L, SizeOf (L));
end;

procedure ReadLongintFromStream (Stream: TStream; var L: Longint);
begin
  Stream.Read(L, SizeOf (L));
end;

procedure WriteDateToStream (Stream: TStream; D: TDateTime);
var
  s: string;
begin
  S := FormatDateTime('yyyymmdd', D);
  WriteStringToStream(Stream, S);
end;

procedure ReadDateTimeFromStream (Stream: TStream; var D: TDateTime);
var
  S: string;
  WYear, WMonth, WDay: Word;
begin
  ReadStringFromStream(Stream, S);
  WYear  := StrToInt (Copy (S,  1, 4));
  WMonth := StrToInt (Copy (S,  5, 2));
  WDay   := StrToInt (Copy (S,  7, 2));
  D := EncodeDate (WYear, WMonth, WDay);
end;

procedure WriteStringListToStream (Stream: TStream; L: TStringList);
var
  i: integer;
begin
  WriteIntToStream(Stream, L.Count);
  for i := 0 to L.Count - 1 do
    WriteStringToStream(Stream, l.Strings [i]);
end;

procedure ReadStringListFromStream (Stream: TStream; L: TStringList);
var
  i, n: integer;
  s: string;
begin
  ReadIntFromStream(Stream, n);
  L.Clear;
  for i := 0 to n - 1 do
  begin
    ReadStringFromStream(Stream, s);
    L.Add(s);
  end;
end;

{TModeloStream}
constructor TModeloStream.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  FIncluirVariablesInactivas := False;
  FIncluirBloquesInactivos   := False;
  FVariablesLocales          := False;
  FFechaEmpresa              := 0;

  VarUsadas     := TList.Create;
  BloquesUsados := TList.Create;
  AltaVariables := TStringList.Create;

  SetLength (Sinonimos, 0);
end;

destructor TModeloStream.Destroy;
begin
  Limpiar_Sinonimos;
  AltaVariables.Free;
  Finalize (Sinonimos);

  Limpiar_Variables_Usadas;
  VarUsadas.Free;

  Limpiar_Bloques_Usados;
  BloquesUsados.Free;

  inherited Destroy;
end;

procedure TModeloStream.Limpiar_Variables_Usadas;
var
  i: integer;
  v: TVariable;
begin
  for i := 0 to VarUsadas.Count - 1 do
  begin
    if FVariablesLocales then
    begin
      v := TVariable (VarUsadas [i]);
      v.Free;
    end;

    VarUsadas [i] := nil;
  end;
  VarUsadas.Clear;
end;

procedure TModeloStream.Extrae_Variables_Usadas;
var
  i: integer;

  procedure Postfijo (Bloque: TBloque);
  var
    i: integer;
    v: TVariable;
  begin
    if not Assigned (Bloque) or (not IncluirBloquesInactivos and (Bloque.Situacion = sbInactivo)) then exit;

    for i := 0 to Bloque.Hijos.Count - 1 do
      Postfijo (Bloque.Hijos [i]);

    for i := 0 to Bloque.Columnas.Count - 1 do
    begin
      v := Bloque.Columnas [i].Definicion;
      if (VarUsadas.IndexOf (v) = -1) and (IncluirVariablesInactivas or (V.Situacion = svActivo)) then
        VarUsadas.Add (v);
    end;
  end;

begin
  Limpiar_Variables_Usadas;
  for i := 0 to Bloques.Count - 1 do
    Postfijo (Bloques [i]);
  FVariablesLocales := False;
end;

procedure TModeloStream.Extrae_Bloques_Usados;
var
  i: integer;

  procedure Prefijo (Bloque: TBloque);
  var
    i: integer;
  begin
    if not Assigned (Bloque) or (not FIncluirBloquesInactivos and (Bloque.Situacion = sbInactivo)) then exit;

    BloquesUsados.Add (Bloque);

    for i := 0 to Bloque.Hijos.Count - 1 do
      Prefijo (Bloque.Hijos [i]);
  end;

begin
  Limpiar_Bloques_Usados;
  for i := 0 to Bloques.Count - 1 do
    Prefijo (Bloques [i]);
end;

procedure TModeloStream.Limpiar_Bloques_Usados;
var
  i: integer;
begin
  for i := 0 to BloquesUsados.Count - 1 do
    BloquesUsados [i] := nil;

  BloquesUsados.Clear;
end;

function TModeloStream.Salvar_A_Stream (Stream: TStream): boolean;
var
  PosTablaAcceso, PosVariables, PosModelo, PosBloques, PosFinal,
  PosTablaVar, PosInicioVars, PosTablaBloques, PosInicioBloques, Inicio, Fin,
  EmptyLong: Longint;
  i: integer;
begin
  result    := False;
  EmptyLong := 0;

  Extrae_Variables_Usadas;
  Extrae_Bloques_Usados;

  (*+++++++++ Identificador del tipo de archivo +++++++++*)
  WriteStringToStream (Stream, strIDModelosDinamicos);

  (*+++++++++ Tabla de Acceso +++++++++*)
  //Marcador de la posición inical de la Tabla de Acceso
  PosTablaAcceso := Stream.Position;

  //Escribe la dirección vacía de
  //  1) Información de Variables                                              (PosVariables)
  //  2) Inicio de la tabla de direcciones de variables                        (PosTablaVar)
  //  3) Inicio de la posición inicial de la información de las variables      (PosInicioVars)
  //  4) Información del Modelo                                                (PosModelo)
  //  5) Información de Bloques                                                (PosBloques)
  //  6) Información de la tabla de direcciones de bloques                     (PosTablaBloques)
  //  7) Inicio de la posición inicial de la información de los bloques        (PosInicioBloques)
  for i := 1 to 7 do
    WriteLongintToStream (Stream, EmptyLong);

  (*+++++++++ Información de Variables +++++++++*)
  //Marcador de la posición inicial de la Información de Variables
  PosVariables := Stream.Position;

  //Salva el número de variables
  WriteIntToStream (Stream, VarUsadas.Count);

  //Marcador de la posición inicial de la tabla de direcciones de variables
  PosTablaVar := Stream.Position;

  //Salva la tabla de dirección de variables vacía
  for i := 0 to VarUsadas.Count - 1 do
    WriteLongintToStream (Stream, EmptyLong);

  //Marcador de la posición inicial de la información de las variables
  PosInicioVars := Stream.Position;

  //Salva la información de cada variable, y regresa a ajustar la tabla de direcciones
  for i := 0 to VarUsadas.Count - 1 do
  begin
    //Salva la información de la variable
    Inicio := Stream.Position;
    Salvar_Var_A_Stream (Stream, TVariable (VarUsadas [i]));
    Fin    := Stream.Position;

    //Regresa a la tabla de direcciones y salva la posición
    Stream.Position := PosTablaVar + (i * SizeOf (EmptyLong));
    WriteLongintToStream (Stream, Inicio);

    //Regresa a la posición en la que se quedó
    Stream.Position := Fin;
  end;

  (*+++++++++ Información del Modelo +++++++++*)
  //Obtiene la posición del inicio de Información del Modelo
  PosModelo := Stream.Position;

  //Salva la información del Modelo
  WriteStringToStream (Stream, Nombre);
  WriteStringToStream (Stream, Descripcion);
  WriteIntToStream (Stream, Ord (Situacion));

  (*+++++++++ Información de los Bloques +++++++++*)
  //Obtiene la posición inicial de la Información de Bloques
  PosBloques := Stream.Position;

  //Salva el número de Bloques
  WriteIntToStream (Stream, BloquesUsados.Count);

  //Marcador de la posición inicial de la tabla de direcciones de bloques
  PosTablaBloques := Stream.Position;

  //Salva la tabla de dirección de bloques vacía
  for i := 0 to BloquesUsados.Count - 1 do
    WriteLongintToStream (Stream, EmptyLong);

  //Marcador de la posición inicial de la Información de Bloques
  PosInicioBloques := Stream.Position;

  //Salva la información de cada bloque, y regresa a ajustar la tabla de direcciones
  for i := 0 to BloquesUsados.Count - 1 do
  begin
    //Salva la información del bloque
    Inicio := Stream.Position;
    Salvar_Bloque_A_Stream (Stream, TBloque (BloquesUsados [i]));
    Fin    := Stream.Position;

    //Regresa a la tabla de direcciones y salva la posición
    Stream.Position := PosTablaBloques + (i * SizeOf (EmptyLong));
    WriteLongintToStream (Stream, Inicio);

    //Regresa a la posición en la que se quedó
    Stream.Position := Fin;
  end;

  (*+++++++++ Completa la Tabla de Acceso y regresa a la posición final +++++++++*)
  //Obtiene la posición final
  PosFinal := Stream.Position;

  //Se mueve al inicio de la Tabla de Acceso
  Stream.Position := PosTablaAcceso;

  //Escribe la información en la tabla para:
  //  1) Información de Variables                                              (PosVariables)
  //  2) Inicio de la tabla de direcciones de variables                        (PosTablaVar)
  //  3) Inicio de la posición inicial de la información de las variables      (PosInicioVars)
  //  4) Información del Modelo                                                (PosModelo)
  //  5) Información de Bloques                                                (PosBloques)
  //  6) Información de la tabla de direcciones de bloques                     (PosTablaBloques)
  //  7) Inicio de la posición inicial de la información de los bloques        (PosInicioBloques)
  WriteLongintToStream (Stream, PosVariables);
  WriteLongintToStream (Stream, PosTablaVar);
  WriteLongintToStream (Stream, PosInicioVars);
  WriteLongintToStream (Stream, PosModelo);
  WriteLongintToStream (Stream, PosBloques);
  WriteLongintToStream (Stream, PosTablaBloques);
  WriteLongintToStream (Stream, PosInicioBloques);

  //Regresa a la posición final
  Stream.Position := PosFinal;

  //Termina con éxito
  result := True;
end;

(*
   Nota: Debido a las restricciones de no modificar el componente, a la carga del Modelo Dinámico
         desde el Stream se le tuvo que agregar la funcionalidad de la validación interactiva
         de las variables y del modelo dinámico, por lo que esta rutina tendrá que ser invocada
         3 veces:

             1. Verificación de variables que coincidan en nombre, pero que el resto de su definición
                no corresponda, o se renombran o se cancela la operación. Las variables nuevas
                simplemente se dan de alta en base de datos.
                [aiImportarVerificarVariables]

             2. Verificación del nombre del Modelo Dinámico, si ya existe o bien se renombra, o bien
                se cancela la operación.
                [aiVerificarModelo]

             3. Pasadas las verificaciones anteriores, se realiza la carga del Modelo Dinámico.
                Posterior a su ejecución se invoca el salvado del modelo en base de datos.
                [aiImportacionModelo]
*)
function TModeloStream.Cargar_Desde_Stream (Stream: TStream; Accion: TAccionImportar): boolean;
var
  s: string;
  PosVariables, PosModelo, PosBloques,
  PosTablaVar, PosInicioVars, PosTablaBloques, PosInicioBloques: Longint;
  i, int, NumVariables, NumBloques: integer;

  DirVars, DirBloques: array of Longint;
  V: TVariable;
begin
  result := False;

  //Inicializa el modelo y las variables requeridas para la importación
  LimpiaModelo;
  Limpiar_Variables_Usadas;
  FVariablesLocales := True;

  (*+++++++++ Identificador del tipo de archivo +++++++++*)
  ReadStringFromStream (Stream, s);
  if s <> strIDModelosDinamicos then
    raise EModeloExcepcion.Create ('El archivo no contiene la información de un Modelo Dinámico.');

  (*+++++++++ Tabla de Acceso +++++++++*)
  //Obtiene la información para:
  //  1) Información de Variables                                              (PosVariables)
  //  2) Inicio de la tabla de direcciones de variables                        (PosTablaVar)
  //  3) Inicio de la posición inicial de la información de las variables      (PosInicioVars)
  //  4) Información del Modelo                                                (PosModelo)
  //  5) Información de Bloques                                                (PosBloques)
  //  6) Información de la tabla de direcciones de bloques                     (PosTablaBloques)
  //  7) Inicio de la posición inicial de la información de los bloques        (PosInicioBloques)
  ReadLongintFromStream (Stream, PosVariables);
  ReadLongintFromStream (Stream, PosTablaVar);
  ReadLongintFromStream (Stream, PosInicioVars);
  ReadLongintFromStream (Stream, PosModelo);
  ReadLongintFromStream (Stream, PosBloques);
  ReadLongintFromStream (Stream, PosTablaBloques);
  ReadLongintFromStream (Stream, PosInicioBloques);

  (*+++++++++ Información de Variables +++++++++*)
  //Se posiciona al inicio de la información de variables
  Stream.Position := PosVariables;

  //Obtiene el número de variables
  ReadIntFromStream (Stream, NumVariables);

  //Se posiciona al inicio de la tabla de direcciones de variables
  Stream.Position := PosTablaVar;

  //Lee la tabla de dirección de variables
  SetLength (DirVars, NumVariables);
  for i := 0 to NumVariables - 1 do
    ReadLongintFromStream (Stream, DirVars [i]);

  //Lee la información de las variables
  for i := 0 to NumVariables - 1 do
  begin
    //Se posiciona en la ubicación específica de la variable
    Stream.Position := DirVars [i];

    //Obtiene la información de la variable
    V               := TVariable.Create (nil, '');
    Cargar_Var_Desde_Stream (Stream, V);

    VarUsadas.Add (V);
  end;

  //Se encarga de:
  //    1) Verificar que las variables ya existentes sean iguales
  //    2) Si ha diferencia en las variables, se pueden renombrar o cancelar el proceso
  //    3) Dar de alta las variables faltantes.
  if Accion = aiImportarVerificarVariables then
  begin
    result := Verifica_Variables;
    exit;
  end;

  (*+++++++++ Información del Modelo +++++++++*)
  //Se posiciona al inicio de Información del Modelo
  Stream.Position := PosModelo;

  //Salva la información del Modelo
  ReadStringFromStream (Stream, s);               Nombre      := s;
  ReadStringFromStream (Stream, s);               Descripcion := s;
  ReadIntFromStream (Stream, int);                Situacion   := TSituacionModelo (int);

  if Accion = aiVerificarModelo then
  begin
    result := Verifica_Modelo;
    exit;
  end;

  (*+++++++++ Información de los Bloques +++++++++*)
  //Se posiciona al inicio de la Información de Bloques
  Stream.Position := PosBloques;

  //Obtiene el número de Bloques
  ReadIntFromStream (Stream, NumBloques);

  //Se posiciona al inicio de la tabla de direcciones de bloques
  Stream.Position := PosTablaBloques;

  //Lee la tabla de dirección de bloques
  SetLength (DirBloques, NumBloques);
  for i := 0 to NumBloques - 1 do
    ReadLongintFromStream (Stream, DirBloques [i]);

  //Lee la información de los bloques
  for i := 0 to NumBloques - 1 do
  begin
    //Se posiciona en la ubicación específica del bloque
    Stream.Position := DirBloques [i];

    //Obtiene la información del bloque
    Cargar_Bloque_Desde_Stream (Stream, Accion);
  end;

  result := True;
end;

function TModeloStream.Buscar_Variables_Usadas (NombreVariable: string): TVariable;
var
  i: integer;
  V: TVariable;
begin
  result := nil;

  for i := 0 to VarUsadas.Count - 1 do
  begin
    V := TVariable (VarUsadas [i]);

    if V.Nombre = NombreVariable then
    begin
      result := V;
      exit;
    end;
  end;
end;

procedure TModeloStream.Reasigna_Variables_Modelo (Error: integer; MsgError: string);
var
  i: integer;

  procedure Prefijo (Bloque: TBloque);
  var
    i, ps: integer;
    Col: TColumna;
    V: TVariable;
  begin
    if not Assigned (Bloque) or (not FIncluirBloquesInactivos and (Bloque.Situacion = sbInactivo)) then exit;

    //Recorre todas las columnas del bloque en búsqueda de columnas que utilizan las variables con sinónimos
    for i := 0 to Bloque.Columnas.Count - 1 do
    begin
      Col := Bloque.Columnas [i];
      if FIncluirVariablesInactivas or (Col.Situacion = scActivo) then
      begin
        //Determina si tiene un sinónimo
        ps := Obten_Posicion_Sinonimo (Col.Definicion.Nombre);

        //Tiene sinónimo?
        if ps <> -1 then
        begin
          //Busca la variable por su sinónimo entre las variables en base de datos, dado que previamente fueron salvadas
          V := ObtenVariable (Sinonimos [ps].Sinonimo);

          if Assigned (V) then
            //Si la encuentra, la reasigna
            Col.IDVariable := V.ID_Variable;
        end;
      end;
    end;

    //Recorre a los bloques hijos para reasignar el siguiente nivel
    for i := 0 to Bloque.Hijos.Count - 1 do
      Prefijo (Bloque.Hijos [i]);
  end;
begin
  for i := 0 to Bloques.Count - 1 do
    Prefijo (Bloques [i]);
end;

procedure TModeloStream.Exportar_Variables_A_DB (var Error: integer; var MsgError: string);
var
  i: integer;
  V: TVariable;
begin
  //Damos de alta primero las variables que no existen, que se encuentran en la lista Altas
  for i := 0 to AltaVariables.Count - 1 do
  begin
    V := Buscar_Variables_Usadas (AltaVariables [i]);

    if Assigned (V) then
    begin
      Salvar_Variable_A_DB (V, Error, MsgError);

      if Error <> 0 then exit;
    end
    else
    begin
      Error    := 1;
      MsgError := Format ('Error al intentar exportar la variable [%s]', [AltaVariables [i]]);
    end;
  end;

  //Damos de alta después las variables que requirieron sinónimos
  for i := 0 to Length (Sinonimos) - 1 do
  begin
    //Obtiene la variable por el nombre original
    V := Buscar_Variables_Usadas (Sinonimos [i].NombreVariable);

    if Assigned (V) then
    begin
      //Se renombran las variables
      V.Nombre := Sinonimos [i].Sinonimo;
      Salvar_Variable_A_DB (V, Error, MsgError);

      if Error <> 0 then exit;
    end
    else
    begin
      Error    := 2;
      MsgError := Format ('Error al intentar exportar la variable [%s]', [AltaVariables [i]]);
    end;
  end;
end;


procedure TModeloStream.Exportar_A_DB (Stream: TStream; var Error: integer; var MsgError: string);
var
  i: integer;
  V: TVariable;
  NombreModelo, Usuario: string;
begin
  //Salvamos el nombre del modelo y el usuario
  NombreModelo := Nombre;
  Usuario      := Cve_Usuario;

  //Restauramos la posición inicial del stream
  Stream.Position := 0;

  //Reasignamos las variables que hayan cambiado de nombre, para que apunten a las de los sinónimos
  if Cargar_Desde_Stream (Stream, aiRenombraVariables) then
  begin
    //Restauramos el nombre del modelo y la clave del usuario
    Nombre      := NombreModelo;
    Cve_Usuario := Usuario;

    //Finalmente salvamos el modelo en cuestión
    Guardar_Estructura_En_DB (Error, MsgError);
  end;
end;

function TModeloStream.Verifica_Variables: boolean;
var
  i, PosSin, Error: integer;
  Nva, Orig: TVariable;
  NuevoNombre, s, MsgError: string;
  Cancelar, Existe, Valido, RequiereAlta: boolean;
begin
  result := False;

  try
    Limpiar_Sinonimos;

    //Para cada variable usada:
    for i := 0 to VarUsadas.Count - 1 do
    begin
      //Obtiene la variable a revisar
      Nva         := TVariable (VarUsadas [i]);
      NuevoNombre := Nva.Nombre;

      //Verifica si ya existe en las variables en Base de Datos.
      Orig         := ObtenVariable (NuevoNombre);
      RequiereAlta := not Assigned (Orig);

      //Verifica si la variable ya existe
      if Assigned (Orig) then
      begin
        //Existe

        // Verifica si es igual.
        if not Variables_Iguales (Nva, Orig) then
        begin
          // Es Diferente?  Pregunta si se quiere renombrar o cancelar
          case MessageDlg (Format ('La variable [%s] ya existe y difiere de la definición que se está importando. ¿Deseas renombrarla? Pulsa <OK> para renombrarla, o <CANCEL> para cancelar la operación.', [NuevoNombre]),
                           mtConfirmation, [mbOk, mbCancel], 0) of
            // Cancelar? Termina el proceso y devuelve falso
            mrCancel: Cancelar := True;
            mrOK: begin
              repeat
                // Renombra hasta que tenga un identificador válido que no esté dado de alta como variable, ni entre los sinónimos previamente aceptados o que cancele.
                s      := NuevoNombre;
                Valido := False;
                if InputQuery (Format ('Cambiar el nombre para la Variable [%s]', [NuevoNombre]), 'Nuevo nombre', s) then
                begin
                  s           := UpperCase (s);
                  Valido      := (Length (s) <= 50) and (s <> '') and IdentificadorValido (s);
                end;

                if Valido then
                begin
                  // Renombrado con éxito?  Verifica que no exista entre las variables en Base de Datos ni entre los sinónimos
                  Orig   := ObtenVariable (s);
                  PosSin := Obten_Posicion_Sinonimo (s);

                  if Assigned (Orig) then
                  begin
                    //El nombre de variable ya existe en base de datos
                    Cancelar := MessageDlg (Format ('El nombre de variable [%s]) ya existe en base de datos, favor de intentar nuevamente. Pulsa <OK> para volverlo a capturar, o <CANCEL> para cancelar la operación.', [s]),
                                            mtConfirmation, [mbOk, mbCancel], 0) = mrCancel;
                  end
                  else if PosSin <> -1 then
                  begin
                    //El nombre de variable ya existe entre los sinónimos
                    Cancelar := MessageDlg (Format ('El nombre de variable [%s]) ya existe entre las variables renombradas, favor de intentar nuevamente. Pulsa <OK> para volverlo a capturar, o <CANCEL> para cancelar la operación.', [s]),
                                            mtConfirmation, [mbOk, mbCancel], 0) = mrCancel;
                  end
                  else
                  begin
                    //Se genera el sinónimo
                    NuevoNombre  := s;
                    RequiereAlta := True;
                  end;
                end
                else
                  // Cancelar? Termina el proceso y devuelve falso
                  Cancelar := MessageDlg (Format ('El nombre de identificador [%s]) no es válido, favor de intentar nuevamente. Pulsa <OK> para volverlo a capturar, o <CANCEL> para cancelar la operación.', [s]),
                                          mtConfirmation, [mbOk, mbCancel], 0) = mrCancel;

              until Valido or Cancelar;
            end;
          end;
        end;
      end;

      if RequiereAlta and not Cancelar then
      begin
        if Nva.Nombre = NuevoNombre then
          AltaVariables.Add (NuevoNombre)
        else
          Agregar_Sinonimo (Nva.Nombre, NuevoNombre);
      end;
    end;
  finally
    result := not Cancelar;
  end;
end;

function TModeloStream.Existe_El_Modelo_En_DB (NombreModelo: string): boolean;
var
  Query: TQuery;
begin
  result := False;
  Query := TQuery.Create (Self);
  try
    Query.DatabaseName := Database.DatabaseName;
    Query.SessionName  := Database.SessionName;
    Query.SQL.Add ('Select Count (Distinct (Nombre)) Total');
    Query.SQL.Add ('  From CR_Met_Modelo');
    Query.SQL.Add (' Where Nombre = :Nombre');
    Query.ParamByName ('Nombre').AsString := NombreModelo;
    Query.Open;

    result := Query.FieldByName ('Total').AsInteger = 1;
  finally
    Query.Free;
  end;
end;

function TModeloStream.IdentificadorValido (Nombre: string): boolean;
var
  Query: TQuery;
begin
  Query := TQuery.Create (Self);

  try
    Query.DatabaseName := Database.DatabaseName;
    Query.SessionName  := Database.SessionName;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add ('Select PkgCrAdminComercial.Fnc_Nombre_Valido (:Nombre) Valido From Dual');
    Query.ParamByName ('Nombre').AsString := Nombre;
    Query.Open;

    result := Query.Active and not Query.Eof and StrToBoolean (Query.FieldByName ('Valido').AsString);
  finally
    Query.Free;
  end;
end;

function TModeloStream.Obten_Posicion_Sinonimo (Variable: string): integer;
var
  i: integer;
begin
  result   := -1;
  Variable := UpperCase (Variable);

  for i := 0 to Length (Sinonimos) - 1 do
    if Variable = Sinonimos [i].NombreVariable then
    begin
      result := i;
      exit;
    end;
end;

function TModeloStream.Obten_Sinonimo (Variable: string): string;
var
  p: integer;
begin
  result := Variable;
  p      := Obten_Posicion_Sinonimo (Variable);

  if p <> -1 then
    result := Sinonimos [p].Sinonimo;
end;

procedure TModeloStream.Limpiar_Sinonimos;
begin
  SetLength (Sinonimos, 0);
  AltaVariables.Clear;
end;

procedure TModeloStream.Agregar_Sinonimo (Variable, Sinonimo: string);
var
  p, l: integer;
begin
  Variable := UpperCase (Variable);
  Sinonimo := UpperCase (Sinonimo);

  if Obten_Posicion_Sinonimo (Variable) <> -1 then exit;

  l := Length (Sinonimos);
  SetLength (Sinonimos, l + 1);
  Sinonimos [l].NombreVariable := Variable;
  Sinonimos [l].Sinonimo       := Sinonimo;
end;

function TModeloStream.Variables_Iguales (V1, V2: TVariable): boolean;
begin
  result :=  Assigned (V1) and Assigned (V2)                          and
            (V1.Nombre                  = V2.Nombre)                  and
            (V1.Descripcion             = V2.Descripcion)             and
            (V1.Longitud                = V2.Longitud)                and
            (V1.Precision               = V2.Precision)               and
            (V1.Formato                 = V2.Formato)                 and
            (V1.ValorDefault            = V2.ValorDefault)            and
            (V1.FuncionBusqueda         = V2.FuncionBusqueda)         and
            (V1.ListaFijaOpciones       = V2.ListaFijaOpciones)       and
            (V1.ValorDefaultColInactiva = V2.ValorDefaultColInactiva) and
            (V1.URL                     = V2.URL)                     and
            (V1.TipoDato                = V2.TipoDato)                and
            (V1.TipoCapturaOpMultiple   = V2.TipoCapturaOpMultiple)   and
            (V1.ValorRetOpMultiple      = V2.ValorRetOpMultiple)      and
            (V1.MetodoCaptura           = V2.MetodoCaptura)           and
            (V1.Situacion               = V2.Situacion);
end;

procedure TModeloStream.Salvar_Variable_A_DB (V: TVariable; var Error: integer; var MsgError: string);
var
  SP: TStoredProc;
begin
  Error    := 0;
  MsgError := '';
  SP       := TStoredProc.Create (Self);

  try
    SP.DatabaseName   := Database.DatabaseName;
    SP.SessionName    := Database.SessionName;
    SP.StoredProcName := 'SISTEMAS.PKGCRADMINCOMERCIAL.STP_ALTA_VARIABLE';
    SP.Params.Clear;
    SP.Params.CreateParam (ftFloat,    'PEID_VARIABLE',          ptInputOutput);
    SP.Params.CreateParam (ftString,   'PENOMBRE',               ptInput);
    SP.Params.CreateParam (ftString,   'PEDESCRIPCION',          ptInput);
    SP.Params.CreateParam (ftString,   'PETIPO_DATO',            ptInput);
    SP.Params.CreateParam (ftFloat,    'PELONGITUD',             ptInput);
    SP.Params.CreateParam (ftFloat,    'PEPRECISION',            ptInput);
    SP.Params.CreateParam (ftString,   'PEFORMATO',              ptInput);
    SP.Params.CreateParam (ftString,   'PEVAL_DEFAULT',          ptInput);
    SP.Params.CreateParam (ftString,   'PEFUNC_BUSQUEDA',        ptInput);
    SP.Params.CreateParam (ftString,   'PELISTA_FIJA_OPC',       ptInput);
    SP.Params.CreateParam (ftString,   'PETIPO_CAP_OP_MULTIPLE', ptInput);
    SP.Params.CreateParam (ftString,   'PEVAL_RET_OP_MULTIPLE',  ptInput);
    SP.Params.CreateParam (ftString,   'PEVAL_DEFAULT_COL_INAC', ptInput);
    SP.Params.CreateParam (ftString,   'PEFORMA_INGRESO',        ptInput);
    SP.Params.CreateParam (ftString,   'PEURL',                  ptInput);
    SP.Params.CreateParam (ftDate,     'PEF_VIGENTE_DESDE',      ptInput);
    SP.Params.CreateParam (ftString,   'PESIT_VARIABLE',         ptInput);
    SP.Params.CreateParam (ftString,   'PECVE_USU_ALTA',         ptInput);
    SP.Params.CreateParam (ftDateTime, 'PEFH_ALTA',              ptInput);
    SP.Params.CreateParam (ftFloat,    'PSERROR',                ptOutput);
    SP.Params.CreateParam (ftString,   'PSMSGERROR',             ptOutput);
    SP.Prepare;
    SP.ParamByName ('PEID_VARIABLE'         ).AsInteger := 0;
    SP.ParamByName ('PENOMBRE'              ).AsString  := V.Nombre;
    SP.ParamByName ('PEDESCRIPCION'         ).AsString  := V.Descripcion;
    SP.ParamByName ('PEFORMATO'             ).AsString  := V.Formato;
    SP.ParamByName ('PEVAL_DEFAULT'         ).AsString  := V.ValorDefault;
    SP.ParamByName ('PEFUNC_BUSQUEDA'       ).AsString  := V.FuncionBusqueda;
    SP.ParamByName ('PELISTA_FIJA_OPC'      ).AsString  := V.ListaFijaOpciones;
    SP.ParamByName ('PEVAL_DEFAULT_COL_INAC').AsString  := V.ValorDefaultColInactiva;
    SP.ParamByName ('PEURL'                 ).AsString  := V.URL;
    SP.ParamByName ('PEF_VIGENTE_DESDE'     ).AsDate    := FechaEmpresa;
    SP.ParamByName ('PECVE_USU_ALTA'        ).AsString  := Cve_Usuario;
    SP.ParamByName ('PEFH_ALTA'             ).AsDate    := Now;

    if V.Longitud > 0 then
      SP.ParamByName ('PELONGITUD').AsInteger := V.Longitud
    else
      SP.ParamByName ('PELONGITUD').Clear;

    if V.Precision > 0 then
      SP.ParamByName ('PEPRECISION').AsInteger := V.Precision
    else
      SP.ParamByName ('PEPRECISION').Clear;

    case V.TipoDato of
      vtdNumber:   SP.ParamByName ('PETIPO_DATO').AsString := 'NUMBER';
      vtdVarchar:  SP.ParamByName ('PETIPO_DATO').AsString := 'VARCHAR2';
      vtdDate:     SP.ParamByName ('PETIPO_DATO').AsString := 'DATE';
      vtdDateTime: SP.ParamByName ('PETIPO_DATO').AsString := 'DATETIME';
    end;

    case V.TipoCapturaOpMultiple of
      tcomRadioButton:   SP.ParamByName ('PETIPO_CAP_OP_MULTIPLE').AsString := 'RADIOBUTTONS';
      tcomComboBox:      SP.ParamByName ('PETIPO_CAP_OP_MULTIPLE').AsString := 'COMBOBOX';
      tcomComboBoxCheck: SP.ParamByName ('PETIPO_CAP_OP_MULTIPLE').AsString := 'COMBOBOXCHECK';
    end;

    case V.ValorRetOpMultiple of
      vromSeleccionados: SP.ParamByName ('PEVAL_RET_OP_MULTIPLE').AsString := 'VALORES';
      vromConteo:        SP.ParamByName ('PEVAL_RET_OP_MULTIPLE').AsString := 'CONTEO';
    end;

    case V.MetodoCaptura of
      mcCaptura:      SP.ParamByName ('PEFORMA_INGRESO').AsString := 'CAPTURA';
      mcCalculado:    SP.ParamByName ('PEFORMA_INGRESO').AsString := 'CALCULADO';
      mcSoloConsulta: SP.ParamByName ('PEFORMA_INGRESO').AsString := 'SOLOCONSULTA';
      mcURL:          SP.ParamByName ('PEFORMA_INGRESO').AsString := 'URL';
    end;

    case V.Situacion of
      svActivo:   SP.ParamByName ('PESIT_VARIABLE').AsString := 'AC';
      svInactivo: SP.ParamByName ('PESIT_VARIABLE').AsString := 'IN';
    end;

    SP.ExecProc;
    Error    := SP.ParamByName ('PSERROR'   ).AsInteger;
    MsgError := SP.ParamByName ('PSMSGERROR').AsString;
  finally
    SP.Free;
  end;
end;

function TModeloStream.Verifica_Modelo: boolean;
var
  Cancelar, Existe, Valido: boolean;
  NuevoNombre, s: string;
begin
  Cancelar := False;
  Existe   := False;
  result   := False;
  try
    NuevoNombre := Nombre;
    repeat
      Existe   := Existe_El_Modelo_En_DB (NuevoNombre);
      Cancelar := False;

      if Existe then
        case MessageDlg (Format ('El Modelo Dinámico [%s] ya existe. ¿Deseas renombrarlo? Pulsa <OK> para renombrarlo, o <CANCEL> para cancelar la operación.', [NuevoNombre]),
                         mtConfirmation, [mbOk, mbCancel], 0) of
          mrCancel: Cancelar := True;
          mrOK: begin
            repeat
              s      := NuevoNombre;
              Valido := False;
              if InputQuery (Format ('Cambiar el nombre para el Modelo Dinámico [%s]', [NuevoNombre]), 'Nuevo nombre', s) then
              begin
                s           := UpperCase (s);
                Valido      := (Length (s) <= 100) and (s <> '') and IdentificadorValido (s);
              end;

              if Valido then
                NuevoNombre := s
              else
                Cancelar := MessageDlg (Format ('El nombre de identificador [%s]) no es válido, favor de intentar nuevamente. Pulsa <OK> para volverlo a capturar, o <CANCEL> para cancelar la operación.', [s]),
                                        mtConfirmation, [mbOk, mbCancel], 0) = mrCancel;
            until Valido or Cancelar;
          end;
        end;
    until not Existe or Cancelar;
  finally
    if not Existe and not Cancelar then
    begin
      Nombre := NuevoNombre;
      result := True;
    end;
  end;
end;

function TModeloStream.Salvar_Var_A_Stream (Stream: TStream; V: TVariable): boolean;
begin
  result := False;

  if not Assigned (V) then exit;

  WriteStringToStream (Stream, V.Nombre);
  WriteStringToStream (Stream, V.Descripcion);
  WriteIntToStream    (Stream, V.Longitud);
  WriteIntToStream    (Stream, V.Precision);
  WriteStringToStream (Stream, V.Formato);
  WriteStringToStream (Stream, V.ValorDefault);
  WriteStringToStream (Stream, V.FuncionBusqueda);
  WriteStringToStream (Stream, V.ListaFijaOpciones);
  WriteStringToStream (Stream, V.ValorDefaultColInactiva);
  WriteStringToStream (Stream, V.URL);
  WriteIntToStream    (Stream, Ord (V.TipoDato));
  WriteIntToStream    (Stream, Ord (V.TipoCapturaOpMultiple));
  WriteIntToStream    (Stream, Ord (V.ValorRetOpMultiple));
  WriteIntToStream    (Stream, Ord (V.MetodoCaptura));
  WriteIntToStream    (Stream, Ord (V.Situacion));

  result := True;
end;

function TModeloStream.Cargar_Var_Desde_Stream (Stream: TStream; V: TVariable): boolean;
var
  s: string;
  int: integer;
begin
  result := False;

  if not Assigned (V) then exit;

  ReadStringFromStream (Stream, s);     V.Nombre                  := s;
  ReadStringFromStream (Stream, s);     V.Descripcion             := s;
  ReadIntFromStream    (Stream, int);   V.Longitud                := int;
  ReadIntFromStream    (Stream, int);   V.Precision               := int;
  ReadStringFromStream (Stream, s);     V.Formato                 := s;
  ReadStringFromStream (Stream, s);     V.ValorDefault            := s;
  ReadStringFromStream (Stream, s);     V.FuncionBusqueda         := s;
  ReadStringFromStream (Stream, s);     V.ListaFijaOpciones       := s;
  ReadStringFromStream (Stream, s);     V.ValorDefaultColInactiva := s;
  ReadStringFromStream (Stream, s);     V.URL                     := s;
  ReadIntFromStream    (Stream, int);   V.TipoDato                := TVarTipoDato       (int);
  ReadIntFromStream    (Stream, int);   V.TipoCapturaOpMultiple   := TTipoCapturaOpMult (int);
  ReadIntFromStream    (Stream, int);   V.ValorRetOpMultiple      := TValorRetOpMult    (int);
  ReadIntFromStream    (Stream, int);   V.MetodoCaptura           := TMetodoCaptura     (int);
  ReadIntFromStream    (Stream, int);   V.Situacion               := TSituacionVariable (int);

  V.Cambiado := False;
  result     := True;
end;

function TModeloStream.Salvar_Bloque_A_Stream (Stream: TStream; B: TBloque): boolean;
var
  ID_Padre: integer;
  PosTablaAcceso, PosBloque, PosColumnas, PosTablaColumnas, PosInicioColumnas,
  Inicio, Fin, PosFinal, EmptyLong: Longint;
  i, NumColumnas: integer;
  Col: TColumna;

  function IncluirColumna (Columna: TColumna): boolean;
  begin
    result := Assigned (Columna) and Assigned (Columna.Definicion) and
             (FIncluirVariablesInactivas or ((Columna.Situacion = scActivo) and (Columna.Definicion.Situacion = svActivo)));
  end;

begin
  result := False;

  if not Assigned (B) then exit;

  EmptyLong := 0;

  (*+++++++++ Tabla de Acceso +++++++++*)
  //Marcador de la posición inical de la Tabla de Acceso
  PosTablaAcceso := Stream.Position;

  //Escribe la dirección vacía de
  //  1) Información del Bloque                                              (PosBloque)
  //  2) Información de Columnas                                             (PosColumnas)
  //  3) Inicio de la tabla de direcciones de columnas                       (PosTablaColumnas)
  //  4) Inicio de la posición inicial de la información de las columnas     (PosInicioColumnas)
  for i := 1 to 4 do
    WriteLongintToStream (Stream, EmptyLong);

  (*+++++++++ Información del Bloque +++++++++*)
  //Marcador de la posición inical de la Información del Bloque
  PosBloque := Stream.Position;

  //Información del padre
  ID_Padre := -1;
  if Assigned (B.Bloque_Padre) then
    ID_Padre := B.Bloque_Padre.ID_Bloque;

  //Información general del bloque
  WriteIntToStream    (Stream, ID_Padre);
  WriteStringToStream (Stream, B.Nombre);
  WriteIntToStream    (Stream, B.ID_Bloque);
  WriteStringToStream (Stream, B.Descripcion);
  WriteIntToStream    (Stream, Ord (B.EsGrupoRepeticion));
  WriteIntToStream    (Stream, Ord (B.Situacion));

  (*+++++++++ Información de las Columnas +++++++++*)
  //Marcador de la posición inical de la Información de las Columnas
  PosColumnas := Stream.Position;

  //Determina el número de columnas a incluir
  NumColumnas := 0;
  for i := 0 to B.Columnas.Count - 1 do
    Inc (NumColumnas, Ord (IncluirColumna (B.Columnas [i])));

  //Salva el número de columnas
  WriteIntToStream (Stream, NumColumnas);

  //Marcador de la posición inical de la tabla de direcciones
  PosTablaColumnas := Stream.Position;

  //Salva la tabla de dirección de columnas vacía
  for i := 0 to NumColumnas - 1 do
    WriteLongintToStream (Stream, EmptyLong);

  //Marcador de la posición inicial de la información de las columnas
  PosInicioColumnas := Stream.Position;

  //Salva la información de cada columna, y regresa a ajustar la tabla de direcciones
  for i := 0 to B.Columnas.Count - 1 do
  begin
    //Obtiene la columna
    Col := B.Columnas [i];

    //Si cumple con los criterios, salva la columna
    if IncluirColumna (Col) then
    begin
      //Salva la información de la columna
      Inicio := Stream.Position;
      WriteStringToStream (Stream, Col.Definicion.Nombre);
      WriteIntToStream    (Stream, Ord (Col.EsObligatorio));
      WriteIntToStream    (Stream, Ord (Col.EsCampoLlave));
      WriteIntToStream    (Stream, Ord (Col.EsVisible));
      WriteIntToStream    (Stream, Ord (Col.Situacion));
      Fin    := Stream.Position;

      //Regresa a la tabla de direcciones y salva la posición
      Stream.Position := PosTablaColumnas + (i * SizeOf (EmptyLong));
      WriteLongintToStream (Stream, Inicio);

      //Regresa a la posición en la que se quedó
      Stream.Position := Fin;
    end;
  end;

  (*+++++++++ Completa la Tabla de Acceso y regresa a la posición final +++++++++*)
  //Obtiene la posición final
  PosFinal := Stream.Position;

  //Se mueve al inicio de la Tabla de Acceso
  Stream.Position := PosTablaAcceso;

  //Escribe la información en la tabla para:
  //  1) Información del Bloque                                              (PosBloque)
  //  2) Información de Columnas                                             (PosColumnas)
  //  3) Inicio de la tabla de direcciones de columnas                       (PosTablaColumnas)
  //  4) Inicio de la posición inicial de la información de las columnas     (PosInicioColumnas)
  WriteLongintToStream (Stream, PosBloque);
  WriteLongintToStream (Stream, PosColumnas);
  WriteLongintToStream (Stream, PosTablaColumnas);
  WriteLongintToStream (Stream, PosInicioColumnas);

  //Regresa a la posición final
  Stream.Position := PosFinal;

  //Termina con éxito
  result := True;
end;

function TModeloStream.Cargar_Bloque_Desde_Stream (Stream: TStream; Accion: TAccionImportar): boolean;
var
  Bloque, Padre: TBloque;
  i, int, NumColumnas: integer;
  s: string;
  PosBloque, PosColumnas, PosTablaColumnas, PosInicioColumnas: Longint;
  DirColumnas: array of Longint;
  Col: TColumna;
  V: TVariable;
begin
  result := False;

  (*+++++++++ Tabla de Acceso +++++++++*)
  //Obtiene la información para:
  //  1) Información del Bloque                                              (PosBloque)
  //  2) Información de Columnas                                             (PosColumnas)
  //  3) Inicio de la tabla de direcciones de columnas                       (PosTablaColumnas)
  //  4) Inicio de la posición inicial de la información de las columnas     (PosInicioColumnas)
  ReadIntFromStream (Stream, PosBloque);
  ReadIntFromStream (Stream, PosColumnas);
  ReadIntFromStream (Stream, PosTablaColumnas);
  ReadIntFromStream (Stream, PosInicioColumnas);

  (*+++++++++ Información del Bloque +++++++++*)
  //Se posiciona al inicio de la Información del Bloque
  Stream.Position := PosBloque;

  //Información del padre
  ReadIntFromStream (Stream, int);
  Padre := ObtenBloque (int);

  //Lee el nombre del bloque
  ReadStringFromStream (Stream, s);

  //Genera el bloque en raíz o como hijo de algún otro bloque
  if Assigned (Padre) then
    Bloque := Agregar_Hijo (Padre, s)
  else
    Bloque := Agregar      (nil,   s);

  //Información general del bloque
  ReadIntFromStream    (Stream, int);     Bloque.ID_Bloque         := int;
  ReadStringFromStream (Stream, s);       Bloque.Descripcion       := s;
  ReadIntFromStream    (Stream, int);     Bloque.EsGrupoRepeticion := Boolean          (int);
  ReadIntFromStream    (Stream, int);     Bloque.Situacion         := TSituacionBloque (int);

  (*+++++++++ Información de las Columnas +++++++++*)
  //Se posiciona al inicio de la Información de las Columnas
  Stream.Position := PosColumnas;

  //Lee el número de Columnas
  ReadIntFromStream (Stream, NumColumnas);

  //Lee la tabla de dirección de columnas
  SetLength (DirColumnas, NumColumnas);
  for i := 0 to NumColumnas - 1 do
    ReadLongintFromStream (Stream, DirColumnas [i]);

  //Lee la información de las columnas
  for i := 0 to NumColumnas - 1 do
  begin
    //Se posiciona en la ubicación específica de la columna
    Stream.Position := DirColumnas [i];

    //Obtiene la variable por su nombre
    ReadStringFromStream (Stream, s);
    if Accion = aiRenombraVariables then
      V := ObtenVariable (Obten_Sinonimo (s))
    else
      V := ObtenVariable (s);

    if not Assigned (V) then
      raise EModeloExcepcion.CreateFmt ('La variable [%s] no está correctamente definida, favor de contactar al área de TI', [s]);

    Col := Bloque.Columnas.Agregar (V.ID_Variable);

    //Obtiene el resto de la información de la columna
    ReadIntFromStream (Stream, int);        Col.EsObligatorio := Boolean (int);
    ReadIntFromStream (Stream, int);        Col.EsCampoLlave  := Boolean (int);
    ReadIntFromStream (Stream, int);        Col.EsVisible     := Boolean (int);
    ReadIntFromStream (Stream, int);        Col.Situacion     := TSituacionColumna (int);
  end;

  result := True;
end;

{TCrMetMode}
constructor TCrMetMode.Create( AOwner : TComponent );
begin
  Inherited;

//  TableName := 'CR_MET_MODELO';
  UseQuery := True;
  HelpFile := 'IntCrMetMode.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrMetMode.Destroy;
begin
  inherited;
end;

function TCrMetMode.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W: TWCrMetModelo;
begin
   W := TWCrMetModelo.Create (Self);
   try
      W.Objeto                    := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := ftConsulta;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


function TCrMetMode.InternalBusca:Boolean;
var
  T: TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador ('ICrMeMo.it', 'F');
  try
//    if Active then
//      T.Param(0,ID_MODELO.AsString);
//
//    if T.Execute then
//      InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;

(***********************************************FORMA CR_MET_MODELO********************)
(*                                                                              *)
(*  FORMA DE CR_MET_MODELO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_MET_MODELO********************)

procedure TWCrMetModelo.FormCreate(Sender: TObject);
begin
  {Inicializa variables de estado}
  CargandoModelo  := False;
  CargandoBloque  := False;
  CargandoColumna := False;

  {Inicializa vista previa}
  VistaPrevia                  := TTModeloVistaPrevia.Create (Self);
  VistaPrevia.AppModelo.Modelo := Modelo;
  VistaPrevia.MetMode          := Self;
end;

procedure TWCrMetModelo.FormShow(Sender: TObject);
begin
  if Objeto.Apli.MainForm is TwPrincipal then
    with Objeto.Apli.MainForm as TwPrincipal do
    begin
      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
    end;

  {Inicializa vista previa}
  VistaPrevia.AppModelo.Interframe   := Objeto;
  VistaPrevia.AppModelo.Database     := Objeto.Apli.Database;
  VistaPrevia.AppModelo.Cve_Usuario  := Objeto.Apli.Usuario;
  VistaPrevia.AppModelo.FechaEmpresa := Objeto.Apli.DameFechaEmpresa;

  DespliegaModelo;
end;

procedure TWCrMetModelo.FormDestroy(Sender: TObject);
begin
  VistaPrevia.Close;
  FreeAndNil (VistaPrevia);
end;

procedure TWCrMetModelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrMetModelo.actModeloGuardarUpdate(Sender: TObject);
begin
  ActualizaEstatusAcciones;
end;

procedure TWCrMetModelo.AplicaEstatusControl (Control: TControl; Habilitado: boolean);
var
  Edit:  TEdit;
  Memo:  TMemo;
begin
  if Control is TEdit then
  begin
    Edit          := (Control as TEdit);
    Edit.ReadOnly := not Habilitado;
    Edit.TabStop  := Habilitado;

    if Habilitado then
      Edit.Color := clWindow
    else
      Edit.Color := clBtnFace;
  end
  else if Control is TMemo then
  begin
    Memo          := (Control as TMemo);
    Memo.ReadOnly := not Habilitado;
    Memo.TabStop  := Habilitado;

    if Habilitado then
      Memo.Color := clWindow
    else
      Memo.Color := clBtnFace;
  end
  else if (Control is TRadioGroup) or (Control is TCheckBox) then
    Control.Enabled := Habilitado
end;

procedure TWCrMetModelo.ActualizaEstatusAcciones;
var
  EstadoModelo:      TEstadoModelo;
  NodoSeleccionado:  PVirtualNode;
  ColSeleccionada:   PVirtualNode;
  PuedeSalvar:       boolean;
  Data:              PBloqueData;
  ColData:           PColumnaData;
  Bloque:            TBloque;
  Columna:           TColumna;
  EditandoAppModelo: boolean;
begin
  //Obtiene el valor de las variables utilizadas para determinar los estados
  Bloque            := nil;
  Columna           := nil;
  EstadoModelo      := Modelo.Estado;
  PuedeSalvar       := Modelo.PuedeSalvar and (Modelo.Nombre <> '');
  NodoSeleccionado  := Arbol.GetFirstSelected;
  ColSeleccionada   := Columnas.GetFirstSelected;
  EditandoAppModelo := Assigned (VistaPrevia) and Assigned (VistaPrevia.AppModelo) and (VistaPrevia.AppModelo.Estado in [emEditado, emInsertado]);

  if Assigned (NodoSeleccionado) then
  begin
    Data    := Arbol.GetNodeData (NodoSeleccionado);
    Bloque  := Data^.Bloque;
  end;

  if Assigned (ColSeleccionada) then
  begin
    ColData := Columnas.GetNodeData (ColSeleccionada);
    Columna := ColData^.Columna;
  end;

  //En este procedimiento se centralizan todas las actualizaciones de estatus de las acciones, aunque sea invocado en el evento para
  //la actualización de ModeloGuardar
  actModeloNuevo    .Enabled :=  InterForma1.Funcion.Nuevo     and (EstadoModelo in [emVacio, emConsulta]) and not EditandoAppModelo;
  actModeloBuscar   .Enabled :=  InterForma1.Funcion.Consultar and (EstadoModelo in [emVacio, emConsulta]) and not EditandoAppModelo;
  actModeloImportar .Enabled :=  InterForma1.Funcion.Nuevo     and (EstadoModelo in [emVacio, emConsulta]) and not EditandoAppModelo;
  actModeloModificar.Enabled :=  InterForma1.Funcion.Modificar and (EstadoModelo = emConsulta)             and not EditandoAppModelo;
  actModeloExportar .Enabled :=                                    (EstadoModelo = emConsulta)             and not EditandoAppModelo;
  actModeloGuardar  .Enabled := (EstadoModelo in [emInsertado, emEditado]) and PuedeSalvar;
  actModeloCancelar .Enabled := (EstadoModelo in [emInsertado, emEditado]);

  AplicaEstatusControl (EModelo_Nombre,      EstadoModelo in [emInsertado]);
  AplicaEstatusControl (EModelo_Descripcion, EstadoModelo in [emInsertado, emEditado]);
  AplicaEstatusControl (RGModelo_Situacion,  EstadoModelo in [emInsertado, emEditado]);

  //Realiza la activación de acciones y controles del bloque acuerdo con el estatus del modelo
  actBloqueAgregar         .Enabled :=  EstadoModelo in [emInsertado, emEditado];                                 //En esta versión no se permiten que los bloques con grupos de repetición tengan sub bloques
  actBloqueAgregarSubBloque.Enabled := (EstadoModelo in [emInsertado, emEditado]) and Assigned (NodoSeleccionado) and Assigned (Bloque) and not Bloque.EsGrupoRepeticion;
  actBloqueEliminar        .Enabled := (EstadoModelo in [emInsertado, emEditado]) and Assigned (NodoSeleccionado) and Assigned (Bloque) and Bloque.SePuedeEliminar;
  actBloqueSubir           .Enabled := (EstadoModelo in [emInsertado, emEditado]) and Assigned (NodoSeleccionado);
  actBloqueBajar           .Enabled := (EstadoModelo in [emInsertado, emEditado]) and Assigned (NodoSeleccionado);

  AplicaEstatusControl (EBloque_Descripcion,       (EstadoModelo in [emInsertado, emEditado]) and Assigned (NodoSeleccionado));
  AplicaEstatusControl (RGBloque_Situacion,        (EstadoModelo in [emInsertado, emEditado]) and Assigned (NodoSeleccionado));
  AplicaEstatusControl (CBBloque_Grupo_Repeticion, (EstadoModelo in [emInsertado, emEditado]) and Assigned (NodoSeleccionado));

  //Realiza la activación de acciones y controles de las columnas de acuerdo con el estatus del modelo
  actColumnaVariables.Enabled := not EditandoAppModelo;
  actColumnaAgregar  .Enabled := (EstadoModelo in [emInsertado, emEditado]) and Assigned (NodoSeleccionado) and Assigned (Bloque);
  actColumnaEliminar .Enabled := (EstadoModelo in [emInsertado, emEditado]) and Assigned (NodoSeleccionado) and Assigned (Bloque) and Assigned (Columna) and Columna.SePuedeEliminar;
  actColumnaSubir    .Enabled := (EstadoModelo in [emInsertado, emEditado]) and Assigned (NodoSeleccionado) and Assigned (Bloque) and Assigned (Columna);
  actColumnaBajar    .Enabled := (EstadoModelo in [emInsertado, emEditado]) and Assigned (NodoSeleccionado) and Assigned (Bloque) and Assigned (Columna);

  AplicaEstatusControl (RGColumnaSituacion,   (EstadoModelo in [emInsertado, emEditado]) and Assigned (NodoSeleccionado) and Assigned (Bloque) and Assigned (Columna));
  AplicaEstatusControl (CBColumnaObligatorio, (EstadoModelo in [emInsertado, emEditado]) and Assigned (NodoSeleccionado) and Assigned (Bloque) and Assigned (Columna));
  AplicaEstatusControl (CBColumnaCampoLlave,  (EstadoModelo in [emInsertado, emEditado]) and Assigned (NodoSeleccionado) and Assigned (Bloque) and Assigned (Columna));
  AplicaEstatusControl (CBColumnaVisible,     (EstadoModelo in [emInsertado, emEditado]) and Assigned (NodoSeleccionado) and Assigned (Bloque) and Assigned (Columna));

  try
    if Assigned (VistaPrevia) and Assigned (VistaPrevia.btnFechas) and Assigned (VistaPrevia.EPersona) then
      VistaPrevia.btnFechas.Enabled := PuedeSalvar and (Modelo.ID_Modelo <> 0) and (VistaPrevia.EPersona.Text <> '');
  except
  end;
end;

procedure TWCrMetModelo.ArbolGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: Integer; TextType: TVSTTextType;
  var Text: WideString);
var
  Data: PBloqueData;
begin
  Data := (Sender as TBaseVirtualTree).GetNodeData (Node);

  if Assigned (Data) and Assigned (Data^.Bloque) then
    Text := Data^.Bloque.Nombre;
end;

procedure TWCrMetModelo.ArbolChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PBloqueData;
begin
  CargandoBloque := True;
  try
    Data := (Sender as TBaseVirtualTree).GetNodeData (Node);
    if not Assigned (Data) or not Assigned (Data^.Bloque) then exit;

    LimpiaBloque;
    Columnas.Clear;
    LimpiaColumna;
    with Data^ do
    begin
      EBloque_ID.Text                   := IntToStr (Bloque.ID_Bloque);
      EBloque_Nombre.Text               := Bloque.Nombre;
      EBloque_Descripcion.Text          := Bloque.Descripcion;
      RGBloque_Situacion.ItemIndex      := Ord (Bloque.Situacion);
      CBBloque_Grupo_Repeticion.Checked := Bloque.EsGrupoRepeticion;
      CargaColumnas;
    end;
  finally
    CargandoBloque := False;
    Modelo.GeneraArbol (TreeView1);
  end;
end;

procedure TWCrMetModelo.LimpiaModelo;
begin
  EModelo_ID.Text              := '';
  EModelo_Nombre.Text          := '';
  EModelo_Descripcion.Text     := '';
  RGModelo_Situacion.ItemIndex := -1;
end;

procedure TWCrMetModelo.LimpiaBloque;
begin
  EBloque_ID.Text                   := '';
  EBloque_Nombre.Text               := '';
  EBloque_Descripcion.Text          := '';
  CBBloque_Grupo_Repeticion.Checked := False;
end;

procedure TWCrMetModelo.LimpiaColumna;
begin
  EColumnaVariableID         .Text := '';
  EColumnaVariableNombre     .Text := '';
  EColumnaVariableDescripcion.Text := '';
  RGColumnaSituacion.ItemIndex     := -1;
  CBColumnaObligatorio.Checked     := False;
  CBColumnaCampoLlave .Checked     := False;
  CBColumnaVisible    .Checked     := False;
end;

procedure TWCrMetModelo.CargaColumnas;
var
  Bloque: TBloque;
  Nodo: PVirtualNode;
begin
  Columnas.Clear;
  Bloque := BloqueActual;

  if not Assigned (Bloque) then exit;

  Bloque.CargaColumnasEnArbol;
  Nodo                     := Columnas.GetFirstChild (nil);
  Columnas.Selected [Nodo] := True;
end;

procedure TWCrMetModelo.DespliegaModelo;
var
  PrimerNodo: PVirtualNode;
begin
  CargandoModelo := True;
  CargandoBloque := True;

  try
    LimpiaModelo;
    LimpiaBloque;
    Columnas.Clear;
    LimpiaColumna;
    if Modelo.ID_Modelo <> 0 then
      EModelo_ID.Text := IntToStr (Modelo.ID_Modelo);

    EModelo_Nombre.Text          := Modelo.Nombre;
    EModelo_Descripcion.Text     := Modelo.Descripcion;
    RGModelo_Situacion.ItemIndex := Ord (Modelo.Situacion);
    CBModeloCambiado.Checked     := Modelo.Cambiado;

    Arbol.ClearSelection;
    PrimerNodo := Arbol.GetFirstChild (nil);
    if Assigned (PrimerNodo) then
      Arbol.Selected [PrimerNodo] := True;
  finally
    CargandoModelo := False;
    CargandoBloque := False;
  end;
end;

function TWCrMetModelo.BloqueActual: TBloque;
var
  Data: PBloqueData;
  Seleccion: PVirtualNode;
begin
  result    := nil;
  Seleccion := Arbol.GetFirstSelected;
  Data      := Arbol.GetNodeData (Seleccion);
  if Assigned (Data) then
    result := Data^.Bloque;
end;

function TWCrMetModelo.ColumnaActual: TColumna;
var
  Data: PColumnaData;
  Seleccion: PVirtualNode;
begin
  result    := nil;
  Seleccion := Columnas.GetFirstSelected;
  Data      := Columnas.GetNodeData (Seleccion);
  if Assigned (Data) then
    result := Data^.Columna;
end;

procedure TWCrMetModelo.EModelo_NombreChange(Sender: TObject);
begin
  if not CargandoModelo then
    Modelo.Nombre := EModelo_Nombre.Text;
end;

procedure TWCrMetModelo.EModelo_DescripcionChange(Sender: TObject);
begin
  if not CargandoModelo then
    Modelo.Descripcion := EModelo_Descripcion.Text;
end;

procedure TWCrMetModelo.RGModelo_SituacionClick(Sender: TObject);
begin
  if not CargandoModelo then
    Modelo.Situacion := TSituacionModelo (RGModelo_Situacion.ItemIndex);
end;

procedure TWCrMetModelo.EBloque_DescripcionChange(Sender: TObject);
var
  Bloque: TBloque;
begin
  if CargandoBloque then exit;

  Bloque := BloqueActual;
  if not Assigned (Bloque) then exit;

  Bloque.Descripcion := EBloque_Descripcion.Text;
end;

procedure TWCrMetModelo.RGBloque_SituacionClick(Sender: TObject);
var
  Bloque: TBloque;
begin
  if CargandoBloque then exit;

  Bloque := BloqueActual;
  if not Assigned (Bloque) then exit;

  Bloque.Situacion := TSituacionBloque (RGBloque_Situacion.ItemIndex);
end;

procedure TWCrMetModelo.CBBloque_Grupo_RepeticionClick(Sender: TObject);
var
  Bloque: TBloque;
begin
  if CargandoBloque then exit;

  Bloque := BloqueActual;
  if not Assigned (Bloque) then exit;

  Bloque.EsGrupoRepeticion := CBBloque_Grupo_Repeticion.Checked;
end;

function TWCrMetModelo.ObtenNombreNuevoBloque: string;
var
  Nombre: string;
begin
  //Recibe el nombre por caja de diálogo
  result := '';
  Nombre := '';
  if not InputQuery ('Nuevo bloque', 'Ingrese nombre de nuevo bloque', Nombre) then exit;

  //Revisa que el nombre sea válido
  Nombre := Q_UpperCase (Q_TrimChar (Nombre));
  if not Modelo.NombreBloqueValido (Nombre) then
  begin
    MessageDlg (Format ('El nombre de bloque [%s] no es válido, no puede ser vacío.', [Nombre]), mtError, [mbOk], 0);
    exit;
  end;

  //Revisa que el nombre del bloque sea único dentro del modelo
  if Assigned (Modelo.ObtenBloque (Nombre)) then
  begin
    MessageDlg (Format ('El nombre de bloque [%s] ya existe en el modelo, es necesario elegir otro nombre.', [Nombre]), mtError, [mbOk], 0);
    exit;
  end;

  if not IdentificadorValido (Nombre) then
  begin
    MessageDlg (Format ('El nombre de modelo [%s] no es válido. Solo puede contener letras sin acentos, dígitos y guión bajo.', [Nombre]),
                mtError, [mbOk], 0);
    exit;
  end;

  result := Nombre;
end;


procedure TWCrMetModelo.actBloqueAgregarExecute(Sender: TObject);
var
  Bloque, NvoBloque: TBloque;
  Data: PBloqueData;
  Selected: PVirtualNode;
  Nombre: string;
begin
  Nombre := ObtenNombreNuevoBloque;
  if Nombre = '' then exit;

  Bloque   := nil;
  Selected := Arbol.GetFirstSelected;

  if Assigned (Selected) then
  begin
    Data   := Arbol.GetNodeData (Selected);
    Bloque := Data^.Bloque;
  end;

  NvoBloque                             := Modelo.Agregar (Bloque, Nombre);
  NvoBloque.Descripcion                 := Nombre;
  Arbol.Selected [NvoBloque.Nodo_Arbol] := True;
  EBloque_Descripcion.SetFocus;
end;

procedure TWCrMetModelo.actBloqueAgregarSubBloqueExecute(Sender: TObject);
var
  Bloque, NvoBloque: TBloque;
  Data: PBloqueData;
  Selected: PVirtualNode;
  Nombre: string;
begin
  Nombre := ObtenNombreNuevoBloque;
  if Nombre = '' then exit;

  Bloque   := nil;
  Selected := Arbol.GetFirstSelected;

  if Assigned (Selected) then
  begin
    Data   := Arbol.GetNodeData (Selected);
    Bloque := Data^.Bloque;
  end;

  NvoBloque                             := Modelo.Agregar_Hijo (Bloque, Nombre);
  NvoBloque.Descripcion                 := Nombre;
  Arbol.Selected [NvoBloque.Nodo_Arbol] := True;
  EBloque_Descripcion.SetFocus;
end;

procedure TWCrMetModelo.actBloqueEliminarExecute(Sender: TObject);
var
  Bloque: TBloque;
  Data: PBloqueData;
  Selected: PVirtualNode;
begin
  Selected := Arbol.GetFirstSelected;
  if not Assigned (Selected) then exit;

  Data   := Arbol.GetNodeData (Selected);
  Bloque := Data^.Bloque;

  if MessageDlg (Format ('Esta operación eliminará el bloque [%s] y todos los niveles debajo de él. ¿Desea continuar con la eliminación?', [Bloque.Nombre]), mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  
  Modelo.Eliminar (Bloque);
  if Modelo.Bloques.Count = 0 then
  begin
    Columnas.Clear;
    Arbol.Clear;
    LimpiaColumna;
    LimpiaBloque;
  end
  else
    ArbolChange (Arbol, nil);
end;

procedure TWCrMetModelo.actBloqueSubirExecute(Sender: TObject);
var
  Bloque: TBloque;
  Data: PBloqueData;
  Selected: PVirtualNode;
begin
  Selected := Arbol.GetFirstSelected;
  if not Assigned (Selected) then exit;

  Data   := Arbol.GetNodeData (Selected);
  Bloque := Data^.Bloque;
  Modelo.Subir_Posicion (Bloque);
  CargaColumnas;
end;

procedure TWCrMetModelo.actBloqueBajarExecute(Sender: TObject);
var
  Bloque: TBloque;
  Data: PBloqueData;
  Selected: PVirtualNode;
begin
  Selected := Arbol.GetFirstSelected;
  if not Assigned (Selected) then exit;

  Data   := Arbol.GetNodeData (Selected);
  Bloque := Data^.Bloque;
  Modelo.Bajar_Posicion (Bloque);
  CargaColumnas;
end;

procedure TWCrMetModelo.actModeloGuardarExecute(Sender: TObject);
var
  Error: integer;
  MsgError: string;
begin
  Modelo.Guardar_Estructura_En_DB (Error, MsgError);

  if Error = 0 then
  begin
//    Modelo.LimpiaModelo;
    DespliegaModelo;

    MessageDlg (Format ('Modelo [%s] salvado exitosamente!', [Modelo.Nombre]), mtInformation, [mbOk], 0);
  end
  else
    DespliegaErrorDB (MsgError);
end;

procedure TWCrMetModelo.ModeloNuevo;
var
  Error: integer;
  MsgError: string;
begin
  Modelo.Cargar_Variables_De_DB (Error, MsgError);

  if Error <> 0 then
    DespliegaErrorDB (MsgError)
  else
  begin
    Modelo.LimpiaModelo;
    DespliegaModelo;
    Modelo.ActivarEdicion;
    EModelo_Nombre.SetFocus;
  end;
end;


procedure TWCrMetModelo.actModeloNuevoExecute(Sender: TObject);
begin
  ModeloNuevo;
end;

procedure TWCrMetModelo.actModeloCancelarExecute(Sender: TObject);
var
  Error: integer;
  MsgError: string;
begin
  if Modelo.EsNuevo then
  begin
    Modelo.LimpiaModelo;
    DespliegaModelo;
  end
  else
  begin
    Modelo.Cargar_Estructura_De_DB (Modelo.Nombre, Error, MsgError);

    if Error = 0 then
      DespliegaModelo
    else
      DespliegaErrorDB (MsgError);
  end;
end;

procedure TWCrMetModelo.actModeloModificarExecute(Sender: TObject);
begin
  Modelo.ActivarEdicion;
  EModelo_Descripcion.SetFocus;
end;

procedure TWCrMetModelo.actModeloBuscarExecute(Sender: TObject);
var
  T: TInterFindit;
  Error: integer;
  MsgError: string;
begin
  T := Objeto.CreaBuscador ('ICrMeMo.it', 'F');
  try
    if (Modelo.Estado = emConsulta) and (Modelo.ID_Modelo <> 0) then
      T.Param (0, IntToStr (Modelo.ID_Modelo));

    if T.Execute then
    begin
      Modelo.Cargar_Estructura_De_DB (T.DameCampo(1), Error, MsgError);

      if Error = 0 then
        DespliegaModelo
      else
        DespliegaErrorDB (MsgError);
    end;
  finally
    T.Free;
  end;
end;

procedure TWCrMetModelo.actModeloImportarExecute(Sender: TObject);
begin
  if Objeto.ValidaAccesoEsp('TCRMETMODE_IMPRT', True, True) and OpenDlgModelo.Execute then
  begin
    try
      CargarModeloDesdeArchivo (OpenDlgModelo.FileName);
    except
    end;
  end;
end;

procedure TWCrMetModelo.actModeloExportarExecute(Sender: TObject);
begin
  if Objeto.ValidaAccesoEsp('TCRMETMODE_EXPRT', True, True) then
  begin
    if SaveDlgModelo.FileName = '' then
      SaveDlgModelo.FileName := Modelo.Nombre + '.dyn';

    if SaveDlgModelo.Execute then
    begin
      try
        SalvarModeloAArchivo (SaveDlgModelo.FileName);
        MessageDlg (Format ('¡Modelo Dinámico [%s] exportado exitosamente!', [Modelo.Nombre]), mtInformation, [mbOK], 0);
      except
      end;
    end;
  end;
end;

procedure TWCrMetModelo.DespliegaErrorDB (Msg: string);
begin
  MessageDlg (Msg, mtError, [mbOk], 0);
end;


procedure TWCrMetModelo.ArbolGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: Integer;
  var Index: Integer);
var
  Data: PBloqueData;
begin
  if not (Kind in [ikNormal, ikSelected, ikState]) then exit;

  Data := (Sender as TBaseVirtualTree).GetNodeData (Node);
  if not Assigned (Data) or not Assigned (Data^.Bloque) then exit;

  if Kind in [ikNormal, ikSelected] then
    Index := Ord (Data^.Bloque.PuedeSalvar)
  else if (Kind = ikState) and Data^.Bloque.Cambiado then
    Index := ICO_Edicion;
end;

procedure TWCrMetModelo.actColumnaVariablesExecute(Sender: TObject);
var
  Error: integer;
  MsgError: string;
  CrMetVari: TCrMetVari;
  Consultando: boolean;
  Persona: integer;
  Fecha: TDate;
begin
  Consultando := VistaPrevia.AppModelo.Estado = emConsulta;
  Persona     := VistaPrevia.AppModelo.IDPersona;
  Fecha       := VistaPrevia.AppModelo.Periodo;
  CrMetVari   := TCrMetVari.Create (Self);
  try
    CrMetVari.Apli     := dmMain.apMain;
    CrMetVari.ParamCre := wPrincipal.ParamCre;
    CrMetVari.Catalogo;
  finally
    CrMetVari.Free;
    VistaPrevia.AppModelo.Modelo := nil;

    Modelo.Cargar_Variables_De_DB (Error, MsgError);

    Columnas.Refresh;
    if Error <> 0 then
      DespliegaErrorDB ('Error al cargar las variables: ' + MsgError);

    VistaPrevia.AppModelo.Modelo := Modelo;
    if Consultando then
      VistaPrevia.AppModelo.Consultar (Persona, Fecha, Consultando);
  end;
end;

procedure TWCrMetModelo.actColumnaAgregarExecute(Sender: TObject);
var
  Bloque: TBloque;
  Columna: TColumna;
  s, Nombre: string;
  IDVar, e: integer;
  T: TInterFindit;
begin
  Bloque := BloqueActual;
  if not Assigned (Bloque) then exit;

  s      := '';
  Nombre := '';
  T := Objeto.CreaBuscador ('ICrMeVa.it', 'F');
  try
    if T.Execute then
    begin
      s      := T.DameCampo (0);
      Nombre := T.DameCampo (1);

      Val (s, IDVar, e);
      if e <> 0 then
      begin
        MessageDlg (Format ('El ID de Variable [%s] no es válido', [s]), mtError, [mbOk], 0);
        exit;
      end;

      if Assigned (Bloque.Columnas.ObtenColumna (IDVar)) then
      begin
        MessageDlg (Format ('La Variable [%s] ya se encuentra dentro del bloque y no puede repetirse', [Nombre]), mtError, [mbOk], 0);
        exit;
      end;

      if not Assigned (Modelo.ObtenVariable (Nombre)) then
      begin
        MessageDlg (Format ('La Variable [%s] no está registrada, favor de rectificarlo', [Nombre]), mtError, [mbOk], 0);
        exit;
      end;

      Columna := Bloque.Columnas.Agregar (IDVar);
      Columnas.ClearSelection;
      Columnas.Selected [Columna.Nodo_Arbol] := True;
      Columnas.RepaintNode (Columna.Nodo_Arbol);
      Columnas.SetFocus;
    end;
  finally
    T.Free;
  end;
end;

procedure TWCrMetModelo.actColumnaEliminarExecute(Sender: TObject);
var
  Columna: TColumna;
  Data: PColumnaData;
  Selected: PVirtualNode;
  Bloque: TBloque;
begin
  Selected := Columnas.GetFirstSelected;
  if not Assigned (Selected) then exit;

  Data    := Columnas.GetNodeData (Selected);
  Columna := Data^.Columna;

  if Assigned (Columna) then
  begin
    if Assigned (Columna.Definicion) then
    begin
      if MessageDlg (Format ('Esta operación eliminará la columna [%s]. ¿Desea continuar con la eliminación?', [Columna.Definicion.Descripcion]), mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit
    end
    else
    begin
      if MessageDlg (Format ('Esta operación eliminará la columna con ID de Variable [%d]. ¿Desea continuar con la eliminación?', [Columna.IDVariable]), mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit
    end;

    Bloque := Columna.Bloque;
    Columna.Columnas.Eliminar (Columna);

    if Bloque.Columnas.Count = 0 then
    begin
      Columnas.Clear;
      LimpiaColumna;
    end
    else
    begin
      ColumnasChange (Columnas, nil);
      Columnas.Refresh;
    end;
  end;
end;

procedure TWCrMetModelo.actColumnaSubirExecute(Sender: TObject);
var
  Columna: TColumna;
  Data: PColumnaData;
  Selected: PVirtualNode;
begin
  Selected := Columnas.GetFirstSelected;
  if not Assigned (Selected) then exit;

  Data    := Columnas.GetNodeData (Selected);
  Columna := Data^.Columna;
  Columna.Columnas.Subir_Posicion (Columna);
end;

procedure TWCrMetModelo.actColumnaBajarExecute(Sender: TObject);
var
  Columna: TColumna;
  Data: PColumnaData;
  Selected: PVirtualNode;
begin
  Selected := Columnas.GetFirstSelected;
  if not Assigned (Selected) then exit;

  Data    := Columnas.GetNodeData (Selected);
  Columna := Data^.Columna;
  Columna.Columnas.Bajar_Posicion (Columna);
end;

procedure TWCrMetModelo.ColumnasGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: Integer; TextType: TVSTTextType;
  var Text: WideString);
var
  Data: PColumnaData;
begin
  Data := (Sender as TBaseVirtualTree).GetNodeData (Node);
  if not Assigned (Data) or not Assigned (Data^.Columna) then exit;

  Text := '<Columna no reconocida>';
  if Assigned (Data^.Columna.Definicion) then
    Text := Data^.Columna.Definicion.Nombre;
end;

procedure TWCrMetModelo.ColumnasGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: Integer;
  var Index: Integer);
var
  Data: PColumnaData;
begin
  if not (Kind in [ikNormal, ikSelected, ikState]) then exit;

  Data := (Sender as TBaseVirtualTree).GetNodeData (Node);
  if not Assigned (Data) or not Assigned (Data^.Columna) then exit;

  if Kind in [ikNormal, ikSelected] then
    Index := Ord (Assigned (Data^.Columna.Definicion))
  else if (Kind = ikState) and Data^.Columna.Cambiado then
    Index := ICO_Edicion;
end;

procedure TWCrMetModelo.ColumnasChange(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: PColumnaData;
begin
  if not Assigned (Node) then exit;
  CargandoColumna := True;
  LimpiaColumna;
  try
    Data := (Sender as TBaseVirtualTree).GetNodeData (Node);
    if not Assigned (Data) or not Assigned (Data^.Columna) then exit;

    with Data^ do
    begin
      EColumnaVariableID.Text      := IntToStr (Columna.IDVariable);
      RGColumnaSituacion.ItemIndex := Ord (Columna.Situacion);
      CBColumnaObligatorio.Checked := Columna.EsObligatorio;
      CBColumnaCampoLlave .Checked := Columna.EsCampoLlave;
      CBColumnaVisible    .Checked := Columna.EsVisible;

      if Assigned (Columna.Definicion) then
      begin
        EColumnaVariableNombre     .Text := Columna.Definicion.Nombre;
        EColumnaVariableDescripcion.Text := Columna.Definicion.Descripcion;
      end;
    end;
  finally
    CargandoColumna := False;
  end;
end;

procedure TWCrMetModelo.RGColumnaSituacionClick(Sender: TObject);
var
  Columna: TColumna;
begin
  if CargandoColumna then exit;

  Columna := ColumnaActual;
  if not Assigned (Columna) then exit;

  Columna.Situacion := TSituacionColumna (RGColumnaSituacion.ItemIndex);
end;

procedure TWCrMetModelo.CBColumnaObligatorioClick(Sender: TObject);
var
  Columna: TColumna;
begin
  if CargandoColumna then exit;

  Columna := ColumnaActual;
  if not Assigned (Columna) then exit;

  Columna.EsObligatorio := CBColumnaObligatorio.Checked;
end;

procedure TWCrMetModelo.CBColumnaCampoLlaveClick(Sender: TObject);
var
  Columna: TColumna;
begin
  if CargandoColumna then exit;

  Columna := ColumnaActual;
  if not Assigned (Columna) then exit;

  Columna.EsCampoLlave := CBColumnaCampoLlave.Checked;
end;

procedure TWCrMetModelo.CBColumnaVisibleClick(Sender: TObject);
var
  Columna: TColumna;
begin
  if CargandoColumna then exit;

  Columna := ColumnaActual;
  if not Assigned (Columna) then exit;

  Columna.EsVisible := CBColumnaVisible.Checked;
end;

procedure TWCrMetModelo.actModeloVistaPreviaExecute(Sender: TObject);
begin
  VistaPrevia.Show;
end;

procedure TWCrMetModelo.EModelo_NombreExit(Sender: TObject);
begin
  if (Modelo.Estado = emInsertado) and (EModelo_Nombre.Text <> '') and not IdentificadorValido (EModelo_Nombre.Text) then
  begin
    MessageDlg (Format ('El nombre de modelo [%s] no es válido. Solo puede contener letras sin acentos, dígitos y guión bajo.', [EModelo_Nombre.Text]),
                mtError, [mbOk], 0);
    EModelo_Nombre.SetFocus;
  end;
end;

function TWCrMetModelo.IdentificadorValido (Nombre: string): boolean;
var
  Query: TQuery;
begin
  Query := TQuery.Create (Self);

  try
    Query.DatabaseName := Objeto.Apli.DataBase.DatabaseName;
    Query.SessionName  := Objeto.Apli.DataBase.SessionName;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add ('Select PkgCrAdminComercial.Fnc_Nombre_Valido (:Nombre) Valido From Dual');
    Query.ParamByName ('Nombre').AsString := Nombre;
    Query.Open;

    result := Query.Active and not Query.Eof and StrToBoolean (Query.FieldByName ('Valido').AsString);
  finally
    Query.Free;
  end;
end;


procedure TWCrMetModelo.ModeloDespuesCambio(Sender: TObject);
begin
  Arbol.Refresh;
  CBModeloCambiado.Checked := Modelo.Cambiado;
end;

procedure TWCrMetModelo.ColumnasKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Delete then
    actColumnaEliminar.Execute
  else if Key = VK_Insert then
    actColumnaAgregar.Execute;
end;

procedure TWCrMetModelo.ArbolKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Delete then
    actBloqueEliminar.Execute;
end;

procedure TWCrMetModelo.ArbolMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Node: PVirtualNode;
begin
  Node := (Sender as TVirtualStringTree).GetNodeAt (X, Y);
  if not Assigned (Node) then exit;

  (Sender as TVirtualStringTree).FocusedNode     := Node;
  (Sender as TVirtualStringTree).Selected [Node] := True;
end;

procedure TWCrMetModelo.SalvarModeloAStream (Stream: TStream);
var
  ModeloStream: TModeloStream;
  Error: integer;
  MsgError: string;
begin
  if Modelo.Nombre = '' then exit;

  ModeloStream := TModeloStream.Create (Self);
  try
    ModeloStream.Database := Objeto.Apli.Database;
    ModeloStream.Cargar_Estructura_De_DB (Modelo.Nombre, Error, MsgError);

    if Error <> 0 then
      DespliegaErrorDB (MsgError)
    else
      ModeloStream.Salvar_A_Stream (Stream);
  finally
    ModeloStream.Free;
  end;
end;

(*
   Nota: Debido a las restricciones de no modificar el componente, a la carga del Modelo Dinámico
         desde el Stream se le tuvo que agregar la funcionalidad de la validación interactiva
         de las variables y del modelo dinámico, por lo que esta rutina tendrá que ser invocada
         3 veces:

             1. Verificación de variables que coincidan en nombre, pero que el resto de su definición
                no corresponda, o se renombran o se cancela la operación. Las variables nuevas
                simplemente se dan de alta en base de datos.
                [aiImportarVerificarVariables]

             2. Verificación del nombre del Modelo Dinámico, si ya existe o bien se renombra, o bien
                se cancela la operación.
                [aiVerificarModelo]

             3. Pasadas las verificaciones anteriores, se realiza la carga del Modelo Dinámico.
                Posterior a su ejecución se invoca el salvado del modelo en base de datos.
                [aiImportacionModelo]
*)
procedure TWCrMetModelo.CargarModeloDesdeStream (Stream: TStream);
var
  MsgError, NuevoNombreModelo: string;
  Error: integer;
  ModeloStream: TModeloStream;
begin
  ModeloStream := TModeloStream.Create (Self);
  try
    ModeloStream.Database := Objeto.Apli.Database;
    ModeloStream.Cargar_Variables_De_DB (Error, MsgError);

    //Aplica 3 veces el proceso de cargar desde el stream:
    //1) Para verificar que todas las variables existan, dar de alta las que no, y resolver ambiguedades             [aiImportarVerificarVariables]
    //2) Para verificar que el modelo no exista, y en caso de que sí, obtener el nuevo nombre                        [aiVerificarModelo]
    //3) Una vez resueltos los dos puntos anteriores, se carga el stream y posteriormente se salva en base de datos  [aiImportacionModelo]

    if ModeloStream.Cargar_Desde_Stream (Stream, aiImportarVerificarVariables) then
    begin
      //Nuevamente se posiciona al inicio del stream
      Stream.Position := 0;

      if ModeloStream.Cargar_Desde_Stream (Stream, aiVerificarModelo) then
      begin
        //Nuevamente se posiciona al inicio del stream
        Stream.Position := 0;

        //Salva el nuevo nombre del modelo
        NuevoNombreModelo := ModeloStream.Nombre;

        //Exporta las variables nuevas o reemplazadas a base de datos
        ModeloStream.FechaEmpresa := Objeto.Apli.DameFechaEmpresa;
        ModeloStream.Cve_Usuario  := Objeto.Apli.Usuario;
        ModeloStream.Exportar_Variables_A_DB (Error, MsgError);
        if Error = 0 then
        begin
          //Carga nuevamente las variables
          ModeloStream.Cargar_Variables_De_DB (Error, MsgError);

          if Error = 0 then
          begin
            if ModeloStream.Cargar_Desde_Stream (Stream, aiImportacionModelo) then
            begin
              ModeloStream.Nombre       := NuevoNombreModelo;
              ModeloStream.FechaEmpresa := Objeto.Apli.DameFechaEmpresa;
              ModeloStream.Cve_Usuario  := Objeto.Apli.Usuario;
              ModeloStream.Exportar_A_DB (Stream, Error, MsgError);

              if Error = 0 then
              begin
                MessageDlg (Format ('¡Importación del Modelo Dinámico [%s] exitosa!', [NuevoNombreModelo]), mtInformation, [mbOK], 0);

                Modelo.Cargar_Estructura_De_DB (NuevoNombreModelo, Error, MsgError);

                if Error = 0 then
                  DespliegaModelo
                else
                  DespliegaErrorDB (MsgError);
              end
              else
                MessageDlg (Format ('Error al importar el Modelo Dinámico [%s] con el mensaje de error: (%s)', [NuevoNombreModelo, MsgError]), mtError, [mbOK], 0);
            end;
          end
          else
            MessageDlg (Format ('Error recargar nuevamente las variables desde base de datos con el mensaje de error [%s].', [MsgError]), mtError, [mbOK], 0);
        end
        else
          MessageDlg (Format ('Error al importar las variables del Modelo Dinámico [%s] con el mensaje de error: (%s)', [NuevoNombreModelo, MsgError]), mtError, [mbOK], 0);
      end;
    end
  finally
    ModeloStream.Free;
  end;
end;

procedure TWCrMetModelo.SalvarModeloAArchivo (NombreArchivo: string);
var
  Mem: TMemoryStream;
  Stream: TFileStream;
begin
  Mem := TMemoryStream.Create;
  try
    SalvarModeloAStream (Mem);
    try
      Stream       := TFileStream.Create (NombreArchivo, fmCreate);
      Mem.Position := 0;
      try
        Stream.CopyFrom (Mem, Mem.Size);
      except
      end;
    finally
      Stream.Free;
    end;
  finally
    Mem.Free;
  end;
end;

procedure TWCrMetModelo.CargarModeloDesdeArchivo (NombreArchivo: string);
var
  Stream: TFileStream;
begin
  Stream := TFileStream.Create (NombreArchivo, fmOpenRead);
  try
    Stream.Position := 0;
    CargarModeloDesdeStream (Stream);
  finally
    Stream.Free;
  end;
end;

end.
