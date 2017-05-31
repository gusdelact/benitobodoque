(************************************************************************************)
(* Developed by: Especialistas en Servicios Empresariales y Laborales, S.C.         *)
(* Author:       Alejandro González.                                                *)
(* Creation:     Febrero de 2013                                                    *)
(************************************************************************************)

unit uMetComFramework;

interface
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, StdCtrls, ComCtrls, Dialogs, ExtCtrls,
     VirtualTrees, DB, DBTables, Forms, DBClient, DBCtrls, DBGrids, InterFor, IntFrm, InterFun, Math,
     QStrings, DBCheckBoxList, DBDateTimePicker, ShDocVW, CheckLst, Buttons, IntFind, Mask;

const
  MargenIzquierdoPanel = 5;
  MargenDerechoPanel   = 5;
  MargenSuperiorPanel  = 15;
  MargenInferiorPanel  = 5;

type
  EModeloExcepcion   = Exception;
  ECampoObligatorio  = Exception;
  EValidacionUsuario = Exception;

  TModelo                    = class;
  TBloques                   = class;
  TBloque                    = class;
  TVariable                  = class;
  TColumna                   = class;
  TColumnas                  = class;
  TAppModelo                 = class;
  TAppModeloBloque           = class;
  TAppModeloBloques          = class;
  TAppModeloDefColumna       = class;
  TAppModeloDefColumnas      = class;
  TAppModeloDataSetColumna   = class;
  TAppModeloDataSetColumnas  = class;
  TAppModeloDataSetBloque    = class;
  TAppModeloDataSet          = class;
  TAppModeloValidaBloque     = class;
  TAppModeloValidaColumna    = class;

  PBloqueData = ^RBloqueData;
  RBloqueData = record
    Bloque: TBloque;
  end;

  PColumnaData = ^RColumnaData;
  RColumnaData = record
    Columna: TColumna;
  end;

  TEstadoModelo      = (emVacio, emConsulta, emInsertado, emEditado);
  TSituacionModelo   = (smActivo, smInactivo);
  TSituacionBloque   = (sbActivo, sbInactivo);
  TSituacionVariable = (svActivo, svInactivo);
  TSituacionColumna  = (scActivo, scInactivo);
  TVarTipoDato       = (vtdNumber, vtdVarchar, vtdDate, vtdDateTime);
  TTipoCapturaOpMult = (tcomNinguno, tcomRadioButton, tcomComboBox, tcomComboBoxCheck);
  TValorRetOpMult    = (vromSeleccionados, vromConteo);
  TMetodoCaptura     = (mcCaptura, mcCalculado, mcSoloConsulta, mcURL);
  TBotonAppModelo    = (bamNuevo, bamModificar, bamActivar, bamAceptar, bamCancelar, bamConsultar);
  TBotonesAppModelo  = set of TBotonAppModelo;

  TValidacionModeloEvent = procedure (AppModelo: TAppModelo; Bloque: TAppModeloBloque; Columna: TAppModeloDefColumna; var InfoValida: boolean; var MsgError: string) of object;
  TCalcularCamposEvent = procedure (AppModelo: TAppModelo; AppDataSet: TAppModeloDataSet) of object;
  TActualizaBotonesEvent = procedure (Sender: TObject; BotonesActivos: TBotonesAppModelo) of object;
  TAntesAceptarEvent = procedure (Sender: TObject; var InfoValida: boolean) of object;
  TDespuesFindit = procedure (AppModelo: TAppModelo; Bloque: TAppModeloBloque; Columna: TAppModeloDefColumna; Findit: TInterFindit; var DevolverCampo: integer) of object;

  TBitBtnField = class (TBitBtn)
  private
    Columna: TAppModeloDefColumna;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TDBValidationEdit = class (TDBEdit)
  public
    procedure ValidateEdit; override;
  end;

  TVariables = class;
  TVariable = class (TComponent)
  private
    FVariables:               TVariables;
    FID_Variable:             integer;
    FNombre:                  string;
    FDescripcion:             string;
    FTipoDato:                TVarTipoDato;
    FLongitud:                integer;
    FPrecision:               integer;
    FFormato:                 string;
    FValorDefault:            string;
    FFuncionBusqueda:         string;
    FListaFijaOpciones:       string;
    FTipoCapturaOpMultiple:   TTipoCapturaOpMult;
    FValorRetOpMultiple:      TValorRetOpMult;
    FValorDefaultColInactiva: string;
    FMetodoCaptura:           TMetodoCaptura;
    FURL:                     string;
    FSituacion:               TSituacionVariable;
    FCargando:                boolean;
    FCambiado:                boolean;
    FOnDespuesCambio:         TNotifyEvent;

    procedure SetDescripcion (Value: string);
    procedure SetTipoDato (Value: TVarTipoDato);
    procedure SetLongitud (Value: integer);
    procedure SetPrecision (Value: integer);
    procedure SetFormato (Value: string);
    procedure SetValorDefault (Value: string);
    procedure SetFuncionBusqueda (Value: string);
    procedure SetListaFijaOpciones (Value: string);
    procedure SetTipoCapturaOpMultiple (Value: TTipoCapturaOpMult);
    procedure SetValorRetOpMultiple (Value: TValorRetOpMult);
    procedure SetValorDefaultColInactiva (Value: string);
    procedure SetMetodoCaptura (Value: TMetodoCaptura);
    procedure SetURL (Value: string);
    procedure SetSituacion (Value: TSituacionVariable);
    procedure InicializaVariable;
    procedure Carga_Desde_Query (Query: TQuery; var Error: integer; var MsgError: string);
  protected
    procedure Cambio; virtual;
    procedure Guardar_En_DB (DB: TDatabase; var Error: integer; var MsgError: string);
    procedure Cargar_De_DB (DB: TDatabase; NombreVar: string; var Error: integer; var MsgError: string);
  public
    constructor Create (AOwner: TComponent; NombreVar: string); reintroduce; overload;
    destructor Destroy; override;
    property Cargando: boolean read FCargando;
    property Cambiado: boolean read FCambiado write FCambiado;
  published
    property ID_Variable: integer read FID_Variable;
    property Nombre: string read FNombre write FNombre;
    property Descripcion: string read FDescripcion write SetDescripcion;
    property TipoDato: TVarTipoDato read FTipoDato write SetTipoDato;
    property Longitud: integer read FLongitud write SetLongitud;
    property Precision: integer read FPrecision write SetPrecision;
    property Formato: string read FFormato write SetFormato;
    property ValorDefault: string read FValorDefault write SetValorDefault;
    property FuncionBusqueda: string read FFuncionBusqueda write SetFuncionBusqueda;
    property ListaFijaOpciones: string read FListaFijaOpciones write SetListaFijaOpciones;
    property TipoCapturaOpMultiple: TTipoCapturaOpMult read FTipoCapturaOpMultiple write SetTipoCapturaOpMultiple;
    property ValorRetOpMultiple: TValorRetOpMult read FValorRetOpMultiple write SetValorRetOpMultiple;
    property ValorDefaultColInactiva: string read FValorDefaultColInactiva write SetValorDefaultColInactiva;
    property MetodoCaptura: TMetodoCaptura read FMetodoCaptura write SetMetodoCaptura;
    property URL: string read FURL write SetURL;
    property Situacion: TSituacionVariable read FSituacion write SetSituacion;

    property OnDespuesCambio: TNotifyEvent read FOnDespuesCambio write FOnDespuesCambio;
  end;

  TVariables = class (TComponent)
  private
    FCargando:        boolean;
    FCambiado:        boolean;
    FModelo:          TModelo;
    FOnDespuesCambio: TNotifyEvent;
    FOnDespuesCargar: TNotifyEvent;
    List:             TList;
    function GetItem (Index: integer): TVariable;
    procedure SetItem (Index: integer; Value: TVariable);
    procedure SetModelo (Value: TModelo);
    procedure Inicializa;
  protected
    procedure Cambio; virtual;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;
    procedure Guardar_En_DB (DB: TDatabase; var Error: integer; var MsgError: string);
    procedure Cargar_De_DB (DB: TDatabase; var Error: integer; var MsgError: string);
    procedure EnviaAStringList (Strings: TStrings);
    function ObtenVariable (Nombre: string): TVariable; overload;
    function ObtenVariable (IDVariable: integer): TVariable; overload;
    property Items[Index: Integer]: TVariable read GetItem write SetItem; default;
    property Cargando: boolean read FCargando;
    property Cambiado: boolean read FCambiado write FCambiado;
    property Modelo: TModelo read FModelo write SetModelo;
  published
    property OnDespuesCambio: TNotifyEvent read FOnDespuesCambio write FOnDespuesCambio;
    property OnDespuesCargar: TNotifyEvent read FOnDespuesCargar write FOnDespuesCargar;
  end;

  TColumna = class (TCollectionItem)
  private
    FModelo:            TModelo;
    FBloque:            TBloque;
    FColumnas:          TColumnas;
    FCambiado:          boolean;
    FIDVariable:        integer;
    FEsObligatorio:     boolean;
    FEsCampoLlave:      boolean;
    FEsVisible:         boolean;
    FSituacion:         TSituacionColumna;
    FDefinicion:        TVariable;
    FSePuedeEliminar:   boolean;
    FNodo_Arbol:        PVirtualNode;
    FNombreCampoFisico: string;
    FNombreCampoLogico: string;
    FAppDefColumna:     TAppModeloDefColumna;
    procedure ObtenNombreCampo;
    procedure ActualizaDefinicion;
    procedure InicializaColumna;
    procedure SetIDVariable (Value: integer);
    procedure SetEsObligatorio (Value: boolean);
    procedure SetEsCampoLlave (Value: boolean);
    procedure SetEsVisible (Value: boolean);
    procedure SetSituacion (Value: TSituacionColumna);

    function GetNombre: string;
    function GetDescripcion: string;
    function GetTipoDato: TVarTipoDato;
    function GetLongitud: integer;
    function GetPrecision: integer;
    function GetFormato: string;
    function GetValorDefault: string;
    function GetFuncionBusqueda: string;
    function GetListaFijaOpciones: string;
    function GetTipoCapturaOpMultiple: TTipoCapturaOpMult;
    function GetValorRetOpMultiple: TValorRetOpMult;
    function GetValorDefaultColInactiva: string;
    function GetMetodoCaptura: TMetodoCaptura;
    function GetURL: string;
  protected
    procedure Cambio; virtual;
    procedure Mueve_Info (Columna: TColumna; Nodo_Referencia: PVirtualNode);
  public
    constructor Create (Collection: TCollection); override;
    destructor Destroy; override;
    function PuedeSalvar: boolean;
    property Modelo: TModelo read FModelo write FModelo;
    property Bloque: TBloque read FBloque write FBloque;
    property Columnas: TColumnas read FColumnas write FColumnas;
    property Cambiado: boolean read FCambiado write FCambiado;
    property IDVariable: integer read FIDVariable write SetIDVariable;
    property EsObligatorio: boolean read FEsObligatorio write SetEsObligatorio;
    property EsCampoLlave: boolean read FEsCampoLlave write SetEsCampoLlave;
    property EsVisible: boolean read FEsVisible write SetEsVisible;
    property Situacion: TSituacionColumna read FSituacion write SetSituacion;
    property Definicion: TVariable read FDefinicion;
    property SePuedeEliminar: boolean read FSePuedeEliminar;
    property Nodo_Arbol: PVirtualNode read FNodo_Arbol write FNodo_Arbol;
    property NombreCampoFisico: string read FNombreCampoFisico;
    property NombreCampoLogico: string read FNombreCampoLogico;
    property AppDefColumna: TAppModeloDefColumna read FAppDefColumna write FAppDefColumna;

    property Nombre: string read GetNombre;
    property Descripcion: string read GetDescripcion;
    property TipoDato: TVarTipoDato read GetTipoDato;
    property Longitud: integer read GetLongitud;
    property Precision: integer read GetPrecision;
    property Formato: string read GetFormato;
    property ValorDefault: string read GetValorDefault;
    property FuncionBusqueda: string read GetFuncionBusqueda;
    property ListaFijaOpciones: string read GetListaFijaOpciones;
    property TipoCapturaOpMultiple: TTipoCapturaOpMult read GetTipoCapturaOpMultiple;
    property ValorRetOpMultiple: TValorRetOpMult read GetValorRetOpMultiple;
    property ValorDefaultColInactiva: string read GetValorDefaultColInactiva;
    property MetodoCaptura: TMetodoCaptura read GetMetodoCaptura;
    property URL: string read GetURL;
  end;

  TColumnas = class (TCollection)
  private
    FModelo: TModelo;
    FBloque: TBloque;
    function GetItem(Index: Integer): TColumna;
    procedure SetItem(Index: Integer; Value: TColumna);
  protected
    function Mover_A_Posicion (Columna: TColumna; Posicion: integer): boolean;
  public
    destructor Destroy; override;
    function Agregar (IDVariable: integer): TColumna;
    function Eliminar (Columna: TColumna): boolean;
    function ObtenColumna (Nombre: string): TColumna; overload;
    function ObtenColumna (IDVariable: integer): TColumna; overload;
    function Subir_Posicion (Columna: TColumna): boolean;
    function Bajar_Posicion (Columna: TColumna): boolean;
    property Items[Index: Integer]: TColumna read GetItem write SetItem; default;
    property Modelo: TModelo read FModelo write FModelo;
    property Bloque: TBloque read FBloque write FBloque;
  end;

  TBloque = class (TCollectionItem)
  private
    FAppBloque:         TAppModeloBloque;
    FBloque_Padre:      TBloque;
    FBloques:           TBloques;
    FModelo:            TModelo;
    FHijos:             TBloques;
    FColumnas:          TColumnas;
    FNodo_Arbol:        PVirtualNode;
    FID_Bloque:         integer;
    FNivel:             integer;
    FNombre:            string;
    FDescripcion:       string;
    FEsGrupoRepeticion: boolean;
    FSituacion:         TSituacionBloque;
    FSePuedeEliminar:   boolean;
    FCambiado:          boolean;
    FBorrando:          boolean;
    procedure SetID_Bloque (Value: integer);
    procedure SetNombre (Value: string);
    procedure SetDescripcion (Value: string);
    procedure SetEsGrupoRepeticion (Value: boolean);
    procedure SetSituacion (Value: TSituacionBloque);
    procedure SetCambiado (Value: boolean);
  protected
    procedure Mueve_Info (Bloque: TBloque; Nodo_Referencia: PVirtualNode);
    procedure Cambio; virtual;
    property AppBloque: TAppModeloBloque read FAppBloque write FAppBloque;
  public
    constructor Create (Collection: TCollection); override;
    destructor Destroy; override;
    function PuedeSalvar: boolean;
    function BloqueVisible: boolean;
    procedure CargaColumnasEnArbol;
    property Bloque_Padre: TBloque read FBloque_Padre;
    property Bloques: TBloques read FBloques write FBloques;
    property Modelo: TModelo read FModelo write FModelo;
    property Hijos: TBloques read FHijos write FHijos;
    property Columnas: TColumnas read FColumnas write FColumnas;
    property Nodo_Arbol: PVirtualNode read FNodo_Arbol write FNodo_Arbol;
    property Nivel: integer read FNivel;
    property ID_Bloque: integer read FID_Bloque write SetID_Bloque;
    property Nombre: string read FNombre write SetNombre;
    property Descripcion: string read FDescripcion write SetDescripcion;
    property EsGrupoRepeticion: boolean read FEsGrupoRepeticion write SetEsGrupoRepeticion;
    property Situacion: TSituacionBloque read FSituacion write SetSituacion;
    property SePuedeEliminar: boolean read FSePuedeEliminar;
    property Cambiado: boolean read FCambiado write SetCambiado;
    property Borrando: boolean read FBorrando;
  end;

  TBloques = class (TCollection)
  private
    FModelo: TModelo;
    FBloque: TBloque;
    function GetItem(Index: Integer): TBloque;
    procedure SetItem(Index: Integer; Value: TBloque);
  public
    destructor Destroy; override;
    property Items[Index: Integer]: TBloque read GetItem write SetItem; default;
    property Modelo: TModelo read FModelo write FModelo;
    property Bloque: TBloque read FBloque write FBloque;
  end;

  TModelo = class (TComponent)
  private
    FAppModelo:                 TAppModelo;
    FID_Modelo:                 integer;
    FNombre:                    string;
    FDescripcion:               string;
    FSituacion:                 TSituacionModelo;
    FFechaEmpresa:              TDate;
    FCve_Usuario:               string;
    FBloques:                   TBloques;
    FVariables:                 TVariables;
    FArbol:                     TVirtualStringTree;
    FArbolColumnas:             TVirtualStringTree;
    FCargando:                  boolean;
    FCambiado:                  boolean;
    FInterforma:                TInterforma;
    FBloque_Siguiente:          integer;
    FDatabase:                  TDatabase;
    FOnDespuesCambio:           TNotifyEvent;
    FOnDespuesCargarEstructura: TNotifyEvent;

    procedure FreeArbolNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure FreeArbolColumnasNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure SetNombre (Value: string);
    procedure SetDescripcion (Value: string);
    procedure SetSituacion (Value: TSituacionModelo);
    procedure SetArbol (Value: TVirtualStringTree);
    procedure SetArbolColumnas (Value: TVirtualStringTree);
    procedure SetCambiado (Value: boolean);
    procedure SetInterforma (Value: TInterforma);
    procedure SetDatabase (Value: TDatabase);
    procedure SetFechaEmpresa (Value: TDate);
    procedure SetCve_Usuario (Value: string);
    function GetDatabase: TDatabase;
    function GetFechaEmpresa: TDate;
    function GetCve_Usuario: string;
    procedure InicializaArbol;
    procedure InicializaArbolColumnas;
    procedure DesasignaArbol;
    procedure DesasignaArbolColumnas;
    procedure DesasignaVariables;
    function Obten_Siguiente_ID_Bloque: integer;
    procedure Inicializa;
    procedure AjustaDatabaseInteforma;
  protected
    procedure Notification(AComponent : TComponent; Operation : TOperation); override;
    procedure Cambio; virtual;
    function Mover_A_Posicion (Bloque: TBloque; Posicion: integer): boolean;
    property Variables: TVariables read FVariables write FVariables;
    property AppModelo: TAppModelo read FAppModelo write FAppModelo;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LimpiaModelo;
    procedure GeneraArbol (Tree: TTreeView);
    procedure ActivarEdicion;
    procedure ActualizaVariables;
    procedure Guardar_Estructura_En_DB (var Error: integer; var MsgError: string);
    procedure Cargar_Estructura_De_DB (Nombre_Modelo: string; var Error: integer; var MsgError: string);
    procedure Cargar_Variables_De_DB (var Error: integer; var MsgError: string);
    procedure EnviaVariablesAStringList (Strings: TStrings);
    function Agregar (Nodo_Referencia: TBloque; Nombre: string): TBloque;
    function Agregar_Hijo (Padre: TBloque; Nombre: string): TBloque;
    function Eliminar (Bloque: TBloque): boolean;
    function Subir_Posicion (Bloque: TBloque): boolean;
    function Bajar_Posicion (Bloque: TBloque): boolean;
    function Ruta (Bloque: TBloque; Delim: string): string;
    function EsNuevo: boolean;
    function PuedeSalvar: boolean;
    function Estado: TEstadoModelo;
    function NombreBloqueValido (NombreBloque: string): boolean;
    function ObtenBloque (NombreBloque: string): TBloque; overload;
    function ObtenBloque (IDBloque: integer): TBloque; overload;
    function ObtenVariable (Nombre: string): TVariable; overload;
    function ObtenVariable (IDVariable: integer): TVariable; overload;
    property Bloques: TBloques read FBloques write FBloques;
    property Situacion: TSituacionModelo read FSituacion write SetSituacion;

    property Cargando: boolean read FCargando;
    property Cambiado: boolean read FCambiado write SetCambiado;
  published
    property ID_Modelo: integer read FID_Modelo write FID_Modelo;
    property Nombre: string read FNombre write SetNombre;
    property Descripcion: string read FDescripcion write SetDescripcion;
    property FechaEmpresa: TDate read GetFechaEmpresa write SetFechaEmpresa;
    property Cve_Usuario: string read GetCve_Usuario write SetCve_Usuario;
    property Arbol: TVirtualStringTree read FArbol write SetArbol;
    property ArbolColumnas: TVirtualStringTree read FArbolColumnas write SetArbolColumnas;
    property Interforma: TInterforma read FInterforma write SetInterforma;
    property Database: TDatabase read GetDatabase write SetDatabase;

    property OnDespuesCambio: TNotifyEvent read FOnDespuesCambio write FOnDespuesCambio;
    property OnDespuesCargarEstructura: TNotifyEvent read FOnDespuesCargarEstructura write FOnDespuesCargarEstructura;
  end;

  TAppModeloDefColumna  = class (TCollectionItem)
  private
    FDefColumnas:    TAppModeloDefColumnas;
    FAppModelo:      TAppModelo;
    FAppBloque:      TAppModeloBloque;
    FColumna:        TColumna;
    FEtiqueta:       TLabel;
    FControl:        TControl;
    FBtnFindit:      TBitBtnField;
    FDataSetColumna: TAppModeloDataSetColumna;
    FFieldDef:       TFieldDef;
    FField:          TField;

    function GetVariableID: integer;
    function GetNombre: string;
    function GetDescripcion: string;
    function GetTipoDato: TVarTipoDato;
    function GetLongitud: integer;
    function GetPrecision: integer;
    function GetFormato: string;
    function GetValorDefault: string;
    function GetFuncionBusqueda: string;
    function GetListaFijaOpciones: string;
    function GetTipoCapturaOpMultiple: TTipoCapturaOpMult;
    function GetValorRetOpMultiple: TValorRetOpMult;
    function GetValorDefaultColInactiva: string;
    function GetMetodoCaptura: TMetodoCaptura;
    function GetURL: string;
    function GetEsObligatorio: boolean;
    function GetEsCampoLlave: boolean;
    function GetEsVisible: boolean;

    procedure SetAsString (Value: string);
    procedure SetAsInteger (Value: integer);
    procedure SetAsFloat (Value: double);
    procedure SetAsDate (Value: TDate);
    procedure SetAsDateTime (Value: TDateTime);
    function GetAsString: string;
    function GetAsInteger: integer;
    function GetAsFloat: double;
    function GetAsDate: TDate;
    function GetAsDateTime: TDateTime;
  protected
    property Etiqueta: TLabel read FEtiqueta write FEtiqueta;
    property Control: TControl read FControl write FControl;
    property FieldDef: TFieldDef read FFieldDef write FFieldDef;
    property Field: TField read FField write FField;
  public
    constructor Create (Collection: TCollection); override;
    destructor Destroy; override;
    procedure SetFocus;
    property DefColumnas: TAppModeloDefColumnas read FDefColumnas write FDefColumnas;
    property AppBloque: TAppModeloBloque read FAppBloque write FAppBloque;
    property Columna: TColumna read FColumna write FColumna;
    property AppModelo: TAppModelo read FAppModelo write FAppModelo;
    property DataSetColumna: TAppModeloDataSetColumna read FDataSetColumna write FDataSetColumna;

    property VariableID: integer read GetVariableID;
    property Nombre: string read GetNombre;
    property Descripcion: string read GetDescripcion;
    property TipoDato: TVarTipoDato read GetTipoDato;
    property Longitud: integer read GetLongitud;
    property Precision: integer read GetPrecision;
    property Formato: string read GetFormato;
    property ValorDefault: string read GetValorDefault;
    property FuncionBusqueda: string read GetFuncionBusqueda;
    property ListaFijaOpciones: string read GetListaFijaOpciones;
    property TipoCapturaOpMultiple: TTipoCapturaOpMult read GetTipoCapturaOpMultiple;
    property ValorRetOpMultiple: TValorRetOpMult read GetValorRetOpMultiple;
    property ValorDefaultColInactiva: string read GetValorDefaultColInactiva;
    property MetodoCaptura: TMetodoCaptura read GetMetodoCaptura;
    property URL: string read GetURL;
    property EsObligatorio: boolean read GetEsObligatorio;
    property EsCampoLlave: boolean read GetEsCampoLlave;
    property EsVisible: boolean read GetEsVisible;

    property AsString: string read GetAsString write SetAsString;
    property AsInteger: integer read GetAsInteger write SetAsInteger;
    property AsFloat: double read GetAsFloat write SetAsFloat;
    property AsDate: TDate read GetAsDate write SetAsDate;
    property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
  end;

  TAppModeloDefColumnas = class (TCollection)
  private
    FAppModelo: TAppModelo;
    FAppBloque: TAppModeloBloque;
    function GetItem (Index: integer): TAppModeloDefColumna;
    procedure SetItem (Index: integer; Value: TAppModeloDefColumna);
  public
    destructor Destroy; override;
    function Agregar (Columna: TColumna): TAppModeloDefColumna;
    property Items[Index: Integer]: TAppModeloDefColumna read GetItem write SetItem; default;
    property AppModelo: TAppModelo read FAppModelo write FAppModelo;
    property AppBloque: TAppModeloBloque read FAppBloque write FAppBloque;
  end;


  TAppModeloBloque  = class (TCollectionItem)
  private
    FModelo:          TModelo;
    FAppModelo:       TAppModelo;
    FBloques:         TAppModeloBloques;
    FBloque:          TBloque;
    FPanel:           TGroupBox;
    FNavegador:       TDBNavigator;
    FNavEdicion:      TDBNavigator;
    FBloque_Padre:    TAppModeloBloque;
    FDefColumnas:     TAppModeloDefColumnas;
    FLocalAppDataSet: TAppModeloDataSet;
    FAppDataSet:      TAppModeloDataSet;
    FDataSetBloque:   TAppModeloDataSetBloque;
    procedure DestruyeControles;
    procedure GeneraColumnas;
    procedure GeneraControles;
    procedure GeneraControlesColumna (Columna: TAppModeloDefColumna);
    procedure MejorDistribucionDBRadioGroup (Columna: TColumna; Control: TDBRadioGroup;     MaxWidth: integer);
    procedure MejorDistribucionDBEdit       (Columna: TColumna; Control: TDBEdit;           MaxWidth: integer);
    procedure MejorDistribucionDBMemo       (Columna: TColumna; Control: TDBMemo;           MaxWidth: integer);
    procedure MejorDistribucionDBComboBox   (Columna: TColumna; Control: TDBComboBox;       MaxWidth: integer);
    procedure MejorDistribucionDBCheckList  (Columna: TColumna; Control: TDBCheckList;      MaxWidth: integer);
    procedure MejorDistribucionWebBrowser   (Columna: TColumna; Control: TWebBrowser;       MaxWidth: integer);
    procedure ReordenaControles;
    procedure DespliegaBloques;
    procedure ActualizaDataSet;
    procedure AplicaEstatusControles;
    procedure AplicaEstatusControl (Control: TControl; SoloLectura: boolean);
    function GetBloqueID: integer;
    function GetNivel: integer;
    function GetNombre: string;
    function GetDescripcion: string;
    function GetEsGrupoRepeticion: boolean;
    procedure BtnFinditClick (Sender: TObject);
    procedure HintsNavegador (Nav: TDBNavigator);
    procedure AntesBtnNav (Sender: TObject; Button: TNavigateBtn);
    procedure DespuesBtnNav (Sender: TObject; Button: TNavigateBtn);
  protected
    function ObtenCampo (Nombre: string): TField;
    function VerificaColumnasCargaQuery (Query: TQuery): boolean;
    property Navegador: TDBNavigator read FNavegador write FNavegador;
    property NavEdicion: TDBNavigator read FNavEdicion write FNavEdicion;
    property LocalAppDataSet: TAppModeloDataSet read FLocalAppDataSet write FLocalAppDataSet;
    property AppDataSet: TAppModeloDataSet read FAppDataSet write FAppDataSet;
    property DataSetBloque: TAppModeloDataSetBloque read FDataSetBloque write FDataSetBloque;
  public
    constructor Create (Collection: TCollection); override;
    destructor Destroy; override;
    function ObtenColumna (Nombre: string): TAppModeloDefColumna;
    function PrimerHijo: TAppModeloBloque;
    function UltimoHijo: TAppModeloBloque;
    function HermanoAnterior: TAppModeloBloque;
    function HermanoSiguiente: TAppModeloBloque;
    function PuedeGenerarDesdeQuery: boolean;
    function PoblarDesdeQuery (Query: TQuery): boolean;
    function AgregarDesdeQuery (Query: TQuery): boolean;
    property Modelo: TModelo read FModelo write FModelo;
    property AppModelo: TAppModelo read FAppModelo write FAppModelo;
    property Bloques: TAppModeloBloques read FBloques write FBloques;
    property Bloque_Padre: TAppModeloBloque read FBloque_Padre write FBloque_Padre;
    property Bloque: TBloque read FBloque write FBloque;
    property Panel: TGroupBox read FPanel write FPanel;
    property DefColumnas: TAppModeloDefColumnas read FDefColumnas write FDefColumnas;
    property BloqueID: integer read GetBloqueID;
    property Nivel: integer read GetNivel;
    property Nombre: string read GetNombre;
    property Descripcion: string read GetDescripcion;
    property EsGrupoRepeticion: boolean read GetEsGrupoRepeticion;
  end;

  TAppModeloBloques = class (TCollection)
  private
    FAppModelo: TAppModelo;
    FModelo:    TModelo;
    function GetItem (Index: integer): TAppModeloBloque;
    procedure SetItem (Index: integer; Value: TAppModeloBloque);
  public
    destructor Destroy; override;
    procedure Clear;
    property Items[Index: Integer]: TAppModeloBloque read GetItem write SetItem; default;
    property AppModelo: TAppModelo read FAppModelo write FAppModelo;
    property Modelo: TModelo read FModelo write FModelo;
  end;

  TAppModeloDataSetColumna  = class (TCollectionItem)
  private
    FColumnas:   TAppModeloDataSetColumnas;
    FAppDataSet: TAppModeloDataSet;
    FAppModelo:  TAppModelo;
    FModelo:     TModelo;
    FDefColumna: TAppModeloDefColumna;
  public
    constructor Create (Collection: TCollection); override;
    destructor Destroy; override;
    property Columnas: TAppModeloDataSetColumnas read FColumnas write FColumnas;
    property AppDataSet: TAppModeloDataSet read FAppDataSet write FAppDataSet;
    property AppModelo: TAppModelo read FAppModelo write FAppModelo;
    property Modelo: TModelo read FModelo write FModelo;
    property DefColumna: TAppModeloDefColumna read FDefColumna write FDefColumna;
  end;

  TAppModeloDataSetColumnas = class (TCollection)
  private
    FAppDataSet: TAppModeloDataSet;
    FAppModelo:  TAppModelo;
    FModelo:     TModelo;
    procedure Inicializa (DataSet: TAppModeloDataSet);
    function GetItem (Index: integer): TAppModeloDataSetColumna;
    procedure SetItem (Index: integer; Value: TAppModeloDataSetColumna);
  public
    destructor Destroy; override;
    property Items[Index: Integer]: TAppModeloDataSetColumna read GetItem write SetItem; default;
    property AppDataSet: TAppModeloDataSet read FAppDataSet write FAppDataSet;
    property AppModelo: TAppModelo read FAppModelo write FAppModelo;
    property Modelo: TModelo read FModelo write FModelo;
  end;

  TAppModeloDataSetBloque = class (TCollectionItem)
  private
    FBloque:  TAppModeloBloque;
    FDataSet: TAppModeloDataSet;
  public
    constructor Create (Collection: TCollection); override;
    destructor Destroy; override;
    property Bloque: TAppModeloBloque read FBloque write FBloque;
    property DataSet: TAppModeloDataSet read FDataSet write FDataSet;
  end;

  TAppModeloDataSet = class (TCollection)
  private
    FAppModelo:    TAppModelo;
    FAppBloque:    TAppModeloBloque;
    FData:         TClientDataSet;
    FDataSource:   TDataSource;
    FBloques:      TList;
    FColumnas:     TAppModeloDataSetColumnas;
    FCargando:     boolean;
    FCambiado:     boolean;
    FActual:       TBookmark;
    FIndexFields:  string;
    UltimoControl: TControl;
    procedure Inicializa (Modelo: TAppModelo);
    function NuevoData: TClientDataSet;
    procedure BCDGetText (Sender: TField; var Text: String; DisplayText: Boolean);
    function GetFieldControl (Field: TField): TControl;
    function GetItem (Index: integer): TAppModeloDataSetBloque;
    procedure SetItem (Index: integer; Value: TAppModeloDataSetBloque);
    procedure ValidateBeforePost (DataSet: TDataSet);
    procedure AfterOpen (DataSet: TDataSet);
    procedure AfterClose (DataSet: TDataSet);
    procedure FieldChange (Sender: TField);
    procedure BCDFieldValidate (Sender: TField);
    procedure ValidaIndice (DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure AfterInsert (DataSet: TDataSet);
    procedure GeneraValoresDefault;
  protected
    procedure Cambio; virtual;
    procedure RegeneraIndice;
    procedure GeneraColumnaString   (Columna: TColumna);
    procedure GeneraColumnaDate     (Columna: TColumna);
    procedure GeneraColumnaDateTime (Columna: TColumna);
    procedure GeneraColumnaNumber   (Columna: TColumna);
    function AgregarColumna (Columna: TColumna): TAppModeloDataSetColumna;
    function AgregarBloque (Bloque: TAppModeloBloque): TAppModeloDataSetBloque;
    function ObtenDataSetBloque (Bloque: TAppModeloBloque): TAppModeloDataSetBloque;
    function PuedeSalvar: boolean;
    function PuedeAceptar: boolean;
    function EsVacio: boolean;
    property Data: TClientDataSet read FData write FData;
    property DataSource: TDataSource read FDataSource write FDataSource;
    property Actual: TBookmark read FActual write FActual;
  protected
    property AppBloque: TAppModeloBloque read FAppBloque write FAppBloque;
  public
    destructor Destroy; override;
    procedure Clear;
    function ObtenBloque (Nombre: string): TAppModeloBloque;
    property Items[Index: Integer]: TAppModeloDataSetBloque read GetItem write SetItem; default;
    property AppModelo: TAppModelo read FAppModelo write FAppModelo;
    property Columnas: TAppModeloDataSetColumnas read FColumnas write FColumnas;
    property Cambiado: boolean read FCambiado write FCambiado;
    property Cargando: boolean read FCargando;
  end;

  TAppModelo = class (TScrollBox)
  private
    FModelo:          TModelo;
    FBloques:         TAppModeloBloques;
    FCargando:        boolean;
    FCambiado:        boolean;
    FAppDataSet:      TAppModeloDataSet;
    FGrid:            TDBGrid;
    FNavegador:       TDBNavigator;
    FIDPersona:       integer;
    FPeriodo:         TDate;
    FIDPersonaPrev:   integer;
    FPeriodoPrev:     TDate;
    FInterforma:      TInterforma;
    FInterframe:      TInterframe;
    FPuedeNuevo:      boolean;
    FPuedeModificar:  boolean;
    FPuedeConsultar:  boolean;
    FPuedeDesactivar: boolean;
    FFechaEmpresa:    TDate;
    FDataSets:        TList;
    FDataBase:        TDataBase;
    FEstado:          TEstadoModelo;
    FEstadoPrev:      TEstadoModelo;
    FCve_Usuario:     string;
    FDummy:           TPanel;
    FBmpFindit:       TBitmap;

    FInterformaBtnNuevo:         TButton;
    FInterformaBtnModificar:     TButton;
    FInterformaBtnCambiarEstado: TButton;
    FInterformaBtnAceptar:       TButton;
    FInterformaBtnCancelar:      TButton;
    FInterformaBtnBuscar:        TButton;
    FBtnNuevo:                   TButton;
    FBtnModificar:               TButton;
    FBtnCambiarEstado:           TButton;
    FBtnAceptar:                 TButton;
    FBtnCancelar:                TButton;
    FBtnBuscar:                  TButton;
    FBotonesActivos:             TBotonesAppModelo;

    FOnActualizaBotones: TActualizaBotonesEvent;
    FOnDespuesCambio:    TNotifyEvent;
    FOnValidacion:       TValidacionModeloEvent;
    FOnCalcularCampos:   TCalcularCamposEvent;
    FOnDespuesFindit:    TDespuesFindit;

    FOnAntesNuevo:           TNotifyEvent;
    FOnAntesModificar:       TNotifyEvent;
    FOnAntesCambiarEstado:   TNotifyEvent;
    FOnAntesAceptar:         TAntesAceptarEvent;
    FOnAntesCancelar:        TNotifyEvent;
    FOnAntesConsultar:       TNotifyEvent;
    FOnDespuesNuevo:         TNotifyEvent;
    FOnDespuesModificar:     TNotifyEvent;
    FOnDespuesCambiarEstado: TNotifyEvent;
    FOnDespuesAceptar:       TNotifyEvent;
    FOnDespuesCancelar:      TNotifyEvent;
    FOnDespuesConsultar:     TNotifyEvent;
    FOnBtnAceptar:           TNotifyEvent;
    FOnBtnBuscar:            TNotifyEvent;

    procedure SetModelo (Value: TModelo);
    procedure SetEstado (Value: TEstadoModelo);
    procedure SetInterforma (Value: TInterforma);
    procedure SetInterframe (Value: TInterframe);
    procedure SetCve_Usuario (Value: string);
    procedure SetPuedeNuevo (Value: boolean);
    procedure SetPuedeModificar (Value: boolean);
    procedure SetPuedeConsultar (Value: boolean);
    procedure SetPuedeDesactivar (Value: boolean);
    procedure SetFechaEmpresa (Value: TDate);
    procedure SetDatabase (Value: TDatabase);
    procedure SetIDPersona (Value: integer);
    procedure SetPeriodo (Value: TDate);
    procedure SetBtnNuevo (Value: TButton);
    procedure SetBtnModificar (Value: TButton);
    procedure SetBtnCancelar (Value: TButton);
    procedure SetBotonesActivos (Value: TBotonesAppModelo);
    procedure SetBmpFindit (Value: TBitmap);
    procedure LanzaEventoBotonesActivos;
    function GetInterframe: TInterframe;
    function GetCve_Usuario: string;
    function GetPuedeNuevo: boolean;
    function GetPuedeModificar: boolean;
    function GetPuedeConsultar: boolean;
    function GetPuedeDesactivar: boolean;
    function GetFechaEmpresa: TDate;
    function GetDatabase: TDatabase;
    function GetModeloNombre: string;
    function GetModeloID: integer;
    function GetModeloDescripcion: string;
    function GetForm: TForm;
    procedure BtnNuevoClick (Sender: TObject);
    procedure BtnModificarClick (Sender: TObject);
    procedure BtnCancelarClick (Sender: TObject);
    procedure BtnInterformaAceptar (Sender: TObject);
    procedure BtnInterformaBuscar (Sender: TObject);
    procedure AsignaDataSetControl (Control: TControl; DataSource: TDataSource; FieldName: string; ShowHint: boolean; Hint: string);
    procedure DesasignaModelo;
    procedure AsignaModelo;
    procedure CierraYLimpiaDataSets;
    procedure RecargaDataSets;
    procedure RegeneraDataSets;
    procedure RegeneraBloques;
    procedure ReordenaBloques;
    procedure DespliegaBloques;
    procedure ExtraeBloqueColumna (ColName: string; var BloqueID, VariableID: integer);
    procedure DeshabilitaControlesDataSets (GeneraBookmarks: boolean = True);
    procedure HabilitaControlesDataSets;
    procedure LimpiaDataSets;
    procedure AplicaEstatusControlesPorBloque;
    procedure AplicaEstatusDataSets;
    procedure AplicaEstatus;
    procedure ReposicionaBotonesInterformas;
    function DeterminaBotonesActivos: TBotonesAppModelo;
    procedure AjustaDatabaseInteforma;
    procedure CreaBotonesInterforma;
    procedure DestruyeBotonesInterforma;
    procedure ObtenBloqueVariableColumna (Campo: string; var Bloque: TAppModeloBloque; var Variable: TVariable;
                                          var Columna: TAppModeloDefColumna);
    procedure FocusToControl (Control: TControl);
    procedure RegeneraPantalla;
    procedure DBEditIntegerKeyPress(Sender: TObject; var Key: Char);
  protected
    procedure Cambio; virtual;
    procedure ActualizaBotones; virtual;
    procedure Notification(AComponent : TComponent; Operation : TOperation); override;
    procedure EliminaBloque (Bloque: TAppModeloBloque);
    function PrimerHijo: TAppModeloBloque;
    function UltimoHijo: TAppModeloBloque;
    function AgregaBloque (Bloque: TBloque; Padre: TAppModeloBloque): TAppModeloBloque;
    function ObtenBloque (Bloque_ID: integer): TAppModeloBloque; overload;
    function ObtenCampoPorBloqueColumna (Bloque, Columna: string): TField;
    function PuedeSalvar: boolean;
    property AppDataSet: TAppModeloDataSet read FAppDataSet write FAppDataSet;
    property EstadoInterno: TEstadoModelo read FEstado write SetEstado;
    property IDPersonaPrev: integer read FIDPersonaPrev write FIDPersonaPrev;
    property PeriodoPrev: TDate read FPeriodoPrev write FPeriodoPrev;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Resize; override;
    procedure Nuevo;
    procedure Consultar (peIDPersona: integer; pePeriodo: TDate; var Encontrado: boolean);
    procedure Modificar;
    procedure Activar;
    procedure Desactivar;
    procedure Aceptar (var Error: integer; var MsgError: string);
    procedure Cancelar;
    procedure OcultarBotonesInterformas; virtual;
    procedure DesplegarBotonesInterformas; virtual;
    function ObtenBloque (Nombre: string): TAppModeloBloque; overload;
    property Bloques: TAppModeloBloques read FBloques write FBloques;
    property IDPersona: integer read FIDPersona write SetIDPersona;
    property Periodo: TDate read FPeriodo write SetPeriodo;
    property Cargando: boolean read FCargando;
    property Cambiado: boolean read FCambiado write FCambiado;
    property Grid: TDBGrid read FGrid write FGrid;
    property Navegador: TDBNavigator read FNavegador write FNavegador;
    property Estado: TEstadoModelo read FEstado;
    property ModeloNombre: string read GetModeloNombre;
    property ModeloID: integer read GetModeloID;
    property ModeloDescripcion: string read GetModeloDescripcion;
    property Form: TForm read GetForm;
    property Interframe: TInterframe read GetInterframe write SetInterframe;
    property BotonesActivos: TBotonesAppModelo read FBotonesActivos write SetBotonesActivos;
  published
    property DataBase: TDataBase read GetDataBase write SetDataBase;
    property FechaEmpresa: TDate read GetFechaEmpresa write SetFechaEmpresa;
    property Modelo: TModelo read FModelo write SetModelo;
    property Interforma: TInterforma read FInterforma write SetInterforma;
    property Cve_Usuario: string read GetCve_Usuario write SetCve_Usuario;
    property PuedeNuevo: boolean read GetPuedeNuevo write SetPuedeNuevo;
    property PuedeModificar: boolean read GetPuedeModificar write SetPuedeModificar;
    property PuedeConsultar: boolean read GetPuedeConsultar write SetPuedeConsultar;
    property PuedeDesactivar: boolean read GetPuedeDesactivar write SetPuedeDesactivar;
    property BmpFindit: TBitmap read FBmpFindit write SetBmpFindit;
    property BtnNuevo: TButton read FBtnNuevo write SetBtnNuevo;
    property BtnModificar: TButton read FBtnModificar write SetBtnModificar;
    property BtnCambiarEstado: TButton read FBtnCambiarEstado write FBtnCambiarEstado;
    property BtnAceptar: TButton read FBtnAceptar write FBtnAceptar;
    property BtnCancelar: TButton read FBtnCancelar write SetBtnCancelar;
    property BtnBuscar: TButton read FBtnBuscar write FBtnBuscar;
    property OnDespuesCambio: TNotifyEvent read FOnDespuesCambio write FOnDespuesCambio;
    property OnActualizaBotones: TActualizaBotonesEvent read FOnActualizaBotones write FOnActualizaBotones;
    property OnAntesNuevo: TNotifyEvent read FOnAntesNuevo write FOnAntesNuevo;
    property OnAntesModificar: TNotifyEvent read FOnAntesModificar write FOnAntesModificar;
    property OnAntesCambiarEstado: TNotifyEvent read FOnAntesCambiarEstado write FOnAntesCambiarEstado;
    property OnAntesAceptar: TAntesAceptarEvent read FOnAntesAceptar write FOnAntesAceptar;
    property OnAntesCancelar: TNotifyEvent read FOnAntesCancelar write FOnAntesCancelar;
    property OnAntesConsultar: TNotifyEvent read FOnAntesConsultar write FOnAntesConsultar;
    property OnDespuesNuevo: TNotifyEvent read FOnDespuesNuevo write FOnDespuesNuevo;
    property OnDespuesModificar: TNotifyEvent read FOnDespuesModificar write FOnDespuesModificar;
    property OnDespuesCambiarEstado: TNotifyEvent read FOnDespuesCambiarEstado write FOnDespuesCambiarEstado;
    property OnDespuesAceptar: TNotifyEvent read FOnDespuesAceptar write FOnDespuesAceptar;
    property OnDespuesCancelar: TNotifyEvent read FOnDespuesCancelar write FOnDespuesCancelar;
    property OnDespuesConsultar: TNotifyEvent read FOnDespuesConsultar write FOnDespuesConsultar;
    property OnDespuesFindit: TDespuesFindit read FOnDespuesFindit write FOnDespuesFindit;
    property OnBtnAceptar: TNotifyEvent read FOnBtnAceptar write FOnBtnAceptar;
    property OnBtnBuscar: TNotifyEvent read FOnBtnBuscar write FOnBtnBuscar;
    property OnValidacion: TValidacionModeloEvent read FOnValidacion write FOnValidacion;
    property OnCalcularCampos: TCalcularCamposEvent read FOnCalcularCampos write FOnCalcularCampos;
  end;

  TAppModeloIntrfrm = class (TAppModelo)
  protected
    property BtnNuevo;
    property BtnModificar;
    property BtnCambiarEstado;
    property BtnAceptar;
    property BtnCancelar;
    property BtnBuscar;
  end;

  TAppModeloGeneral = class (TAppModelo)
  protected
    procedure OcultarBotonesInterformas; override;
    procedure DesplegarBotonesInterformas; override;
    property Interframe;
    property Interforma;
    property OnBtnAceptar;
    property OnBtnBuscar;
  end;

  TAppModeloValidaBloque = class (TComponent)
  private
    FModelo:       TAppModelo;
    FBloque:       TAppModeloBloque;
    FNombreBloque: string;
    procedure SetModelo (Value: TAppModelo);
    procedure SetNombreBloque (Value: string);
    procedure DesasignaModelo; virtual;
    procedure AsignaModelo; virtual;
    procedure ResuelveBloque; virtual;
  protected
    procedure Notification(AComponent : TComponent; Operation : TOperation); override;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Actualiza; virtual;
    property Bloque: TAppModeloBloque read FBloque write FBloque;
  published
    property Modelo: TAppModelo read FModelo write SetModelo;
    property NombreBloque: string read FNombreBloque write SetNombreBloque;
  end;

  TAppModeloValidaColumna = class (TAppModeloValidaBloque)
  private
    FNombreColumna: string;
    FColumna:       TAppModeloDefColumna;
    procedure SetNombreColumna (Value: string);
    procedure DesasignaModelo; override;
    procedure ResuelveBloque; override;
    procedure ResuelveColumna;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Actualiza; override;
    property Columna: TAppModeloDefColumna read FColumna write FColumna;
  published
    property NombreColumna: string read FNombreColumna write SetNombreColumna;
  end;

function BooleanToStr (b: boolean): string;
function StrToBoolean (s: string): boolean;
procedure Register;


implementation

const
  coEsquema = 'SISTEMAS';
  coPaquete = 'PKGCRADMINCOMERCIAL';

procedure Register;
begin
  RegisterComponents('MD-R04', [TModelo, TAppModelo{, TAppModeloGeneral, TAppModeloIntrfrm}]);
//  RegisterComponents('ESEL', [TAppModeloValidaBloque, TAppModeloValidaColumna]);
end;

function BooleanToStr (b: boolean): string;
begin
  if b then result := 'V' else result := 'F';
end;

function StrToBoolean (s: string): boolean;
begin
  result := s = 'V';
end;

procedure ExtraeItemsValores (S: string; Items, Valores: TStrings);
var
  A: TArrayString;
  i: integer;
begin
  Items.Clear;
  Valores.Clear;
  A := Split (S, '|');

  for i := 0 to Length (A) - 1 do
    if Odd (i) then
      Items.Add (A [i])
    else
      Valores.Add (A [i]);
end;

procedure ExtraeItems (S: string; Items: TStrings);
var
  A: TArrayString;
  i: integer;
begin
  A := Split (S, '|');
  Items.Clear;

  for i := 0 to Length (A) - 1 do
    Items.Add (A [i]);
end;

{TBitBtnField}
constructor TBitBtnField.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);

  Columna := nil;
end;

destructor TBitBtnField.Destroy;
begin
  Columna := nil;

  inherited Destroy;
end;

{TDBValidationEdit}
procedure TDBValidationEdit.ValidateEdit;
var
  StrI, StrF, S: string;
  P: integer;
  L: Integer;
  D: Double;
begin
  inherited ValidateEdit;

  if (csDesigning in ComponentState) or not Assigned (Field) or (Field.DataType <> ftBCD) then exit;

  S    := Text;
  StrI := '';
  StrF := '';
  P    := Pos (DecimalSeparator, S);
  if P = 0 then
    StrI := S
  else
  begin
    StrI := Copy (Text, 1, P - 1);
    Delete (S, 1, P);
    StrF := S;
  end;

  while (Length (StrI) > 0) and (StrI [1] = '0') do
    Delete (StrI, 1, 1);

  L := 14;
  if (L > Tag) and (Tag > 0) then
    L := Tag;

  if Length (StrI) > L then
  begin
    SetFocus;
    raise EDBEditError.CreateFmt ('El valor [%s] excede de %d posiciones enteras. Modifique el valor o pulse [Esc] para cancelar el cambio.', [Text, L]);
  end;

  Val (Text, D, P);
  if P <> 0 then
  begin
    SetFocus;
    raise EDBEditError.CreateFmt ('El valor [%s] no es un flotante válido.', [Text, L]);
  end;
end;


{TVariable}
constructor TVariable.Create (AOwner: TComponent; NombreVar: string);
begin
  InicializaVariable;
  FNombre := Q_UpperCase (Q_TrimChar (NombreVar));
  if AOwner is TVariables then
    FVariables := TVariables (AOwner);

  inherited Create (AOwner);
end;

destructor TVariable.Destroy;
begin
  FVariables := nil;

  inherited Destroy;
end;


procedure TVariable.InicializaVariable;
begin
  FVariables               := nil;
  FNombre                  := '';
  FID_Variable             := 0;
  FDescripcion             := '';
  FTipoDato                := vtdNumber;
  FLongitud                := 0;
  FPrecision               := 0;
  FFormato                 := '';
  FValorDefault            := '';
  FFuncionBusqueda         := '';
  FListaFijaOpciones       := '';
  FTipoCapturaOpMultiple   := tcomNinguno;
  FValorRetOpMultiple      := vromSeleccionados;
  FValorDefaultColInactiva := '';
  FMetodoCaptura           :=  mcCaptura;
  FURL                     := '';
  FSituacion               := svActivo;
  FCargando                := False;
  FCambiado                := False;
end;

procedure TVariable.Carga_Desde_Query (Query: TQuery; var Error: integer; var MsgError: string);
begin
  Error    := 0;
  MsgError := '';

  if not Assigned (Query) or not Query.Active or Query.Eof then
  begin
    Error    := 1;
    MsgError := 'No se pudo obtener información de la variable desde la consulta. Favor de contactar al departamento de sistemas.';
    exit;
  end;

  InicializaVariable;
  FCargando := True;
  try
    FNombre                  := Query.FieldByName ('Nombre'              ).AsString;
    FID_Variable             := Query.FieldByName ('ID_Variable'         ).AsInteger;
    FDescripcion             := Query.FieldByName ('Descripcion'         ).AsString;
    FLongitud                := Query.FieldByName ('Longitud'            ).AsInteger;
    FPrecision               := Query.FieldByName ('Precision'           ).AsInteger;
    FFormato                 := Query.FieldByName ('Formato'             ).AsString;
    FValorDefault            := Query.FieldByName ('Val_Default'         ).AsString;
    FFuncionBusqueda         := Query.FieldByName ('Func_Busqueda'       ).AsString;
    FListaFijaOpciones       := Query.FieldByName ('Lista_Fija_Opc'      ).AsString;
    FValorDefaultColInactiva := Query.FieldByName ('Val_Default_Col_Inac').AsString;
    FURL                     := Query.FieldByName ('URL'                 ).AsString;

    if      Query.FieldByName ('Tipo_Dato').AsString = 'NUMBER'   then
      FTipoDato := vtdNumber
    else if Query.FieldByName ('Tipo_Dato').AsString = 'VARCHAR2' then
      FTipoDato := vtdVarchar
    else if Query.FieldByName ('Tipo_Dato').AsString = 'DATE' then
      FTipoDato := vtdDate
    else if Query.FieldByName ('Tipo_Dato').AsString = 'DATETIME' then
      FTipoDato := vtdDateTime;

    if      Query.FieldByName ('Tipo_Cap_Op_Multiple').AsString = 'RADIOBUTTONS'  then
      FTipoCapturaOpMultiple := tcomRadioButton
    else if Query.FieldByName ('Tipo_Cap_Op_Multiple').AsString = 'COMBOBOX'      then
      FTipoCapturaOpMultiple := tcomComboBox
    else if Query.FieldByName ('Tipo_Cap_Op_Multiple').AsString = 'COMBOBOXCHECK' then
      FTipoCapturaOpMultiple := tcomComboBoxCheck;

    if      Query.FieldByName ('Val_Ret_Op_Multiple').AsString = 'VALORES' then
      FValorRetOpMultiple := vromSeleccionados
    else if Query.FieldByName ('Val_Ret_Op_Multiple').AsString = 'CONTEO'  then
      FValorRetOpMultiple := vromConteo;

    if      Query.FieldByName ('Forma_Ingreso').AsString = 'CAPTURA'      then
      FMetodoCaptura := mcCaptura
    else if Query.FieldByName ('Forma_Ingreso').AsString = 'CALCULADO'    then
      FMetodoCaptura := mcCalculado
    else if Query.FieldByName ('Forma_Ingreso').AsString = 'SOLOCONSULTA' then
      FMetodoCaptura := mcSoloConsulta
    else if Query.FieldByName ('Forma_Ingreso').AsString = 'URL'          then
      FMetodoCaptura := mcURL;

    if      Query.FieldByName ('Sit_Variable').AsString = 'AC' then
      FSituacion := svActivo
    else if Query.FieldByName ('Sit_Variable').AsString = 'IN' then
      FSituacion := svInactivo;
  finally
    FCargando := False;
    FCambiado := False;
  end;
end;



procedure TVariable.Cambio;
begin
  if not FCargando then
  begin
    FCambiado := True;
    if Assigned (FOnDespuesCambio) then
      FOnDespuesCambio (Self);
  end;

  if Assigned (FVariables) then
    FVariables.Cambio;
end;

procedure TVariable.SetDescripcion (Value: string);
begin
  Value := Q_TrimChar (Value);
  if FDescripcion <> Value then
  begin
    FDescripcion := Value;
    Cambio;
  end;
end;

procedure TVariable.SetTipoDato (Value: TVarTipoDato);
begin
  if FTipoDato <> Value then
  begin
    FTipoDato := Value;
    Cambio;
  end;
end;

procedure TVariable.SetLongitud (Value: integer);
begin
  if FLongitud <> Value then
  begin
    FLongitud := Value;
    Cambio;
  end;
end;

procedure TVariable.SetPrecision (Value: integer);
begin
  if FPrecision<> Value then
  begin
    FPrecision := Value;
    Cambio;
  end;
end;

procedure TVariable.SetFormato (Value: string);
begin
  if FFormato <> Value then
  begin
    FFormato := Value;
    Cambio;
  end;
end;

procedure TVariable.SetValorDefault (Value: string);
begin
  Value := Q_TrimChar (Value);
  if FValorDefault <> Value then
  begin
    FValorDefault := Value;
    Cambio;
  end;
end;

procedure TVariable.SetFuncionBusqueda (Value: string);
begin
  Value := Q_TrimChar (Value);
  if FFuncionBusqueda <> Value then
  begin
    FFuncionBusqueda := Value;
    Cambio;
  end;
end;

procedure TVariable.SetListaFijaOpciones (Value: string);
begin
  Value := Q_TrimChar (Value);
  if FListaFijaOpciones <> Value then
  begin
    FListaFijaOpciones := Value;
    Cambio;
  end;
end;

procedure TVariable.SetTipoCapturaOpMultiple (Value: TTipoCapturaOpMult);
begin
  if FTipoCapturaOpMultiple <> Value then
  begin
    FTipoCapturaOpMultiple := Value;
    Cambio;
  end;
end;

procedure TVariable.SetValorRetOpMultiple (Value: TValorRetOpMult);
begin
  if FValorRetOpMultiple <> Value then
  begin
    FValorRetOpMultiple := Value;
    Cambio;
  end;
end;

procedure TVariable.SetValorDefaultColInactiva (Value: string);
begin
  Value := Q_TrimChar (Value);
  if FValorDefaultColInactiva <> Value then
  begin
    FValorDefaultColInactiva := Value;
    Cambio;
  end;
end;

procedure TVariable.SetMetodoCaptura (Value: TMetodoCaptura);
begin
  if FMetodoCaptura <> Value then
  begin
    FMetodoCaptura := Value;
    Cambio;
  end;
end;

procedure TVariable.SetURL (Value: string);
begin
  Value := Q_TrimChar (Value);
  if FURL <> Value then
  begin
    FURL := Value;
    Cambio;
  end;
end;

procedure TVariable.SetSituacion (Value: TSituacionVariable);
begin
  if FSituacion <> Value then
  begin
    FSituacion := Value;
    Cambio;
  end;
end;

procedure TVariable.Guardar_En_DB (DB: TDatabase; var Error: integer; var MsgError: string);
begin
end;

procedure TVariable.Cargar_De_DB (DB: TDatabase; NombreVar: string; var Error: integer; var MsgError: string);
begin
end;


{TVariables}
constructor TVariables.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);

  Inicializa;
  List := TList.Create;
end;

destructor TVariables.Destroy;
begin
  FModelo := nil;
  Clear;
  FreeAndNil (List);

  inherited Destroy;
end;

procedure TVariables.Inicializa;
begin
  FCargando        := False;
  FCambiado        := False;
  FModelo          := nil;
  FOnDespuesCambio := nil;
end;


function TVariables.GetItem (Index: integer): TVariable;
begin
  result := TVariable (List [Index]);
end;

procedure TVariables.SetItem (Index: integer; Value: TVariable);
begin
  List [Index] := Value;
end;

procedure TVariables.SetModelo (Value: TModelo);
begin
  if FModelo <> Value then
    FModelo := Value;
end;

procedure TVariables.Clear;
var
  Variable: TVariable;
  Index: integer;
begin
  while List.Count > 0 do
  begin
    Index        := List.Count - 1;
    Variable     := List [Index];
    List [Index] := nil;
    List.Delete (Index);
    FreeAndNil (Variable);
  end;
end;

procedure TVariables.Cambio;
begin
  if not FCargando then
  begin
    FCambiado := True;
    if Assigned (FOnDespuesCambio) then
      FOnDespuesCambio (Self);
  end;
end;

procedure TVariables.Guardar_En_DB (DB: TDatabase; var Error: integer; var MsgError: string);
begin
end;

procedure TVariables.Cargar_De_DB (DB: TDatabase; var Error: integer; var MsgError: string);
var
  Query:    TQuery;
  Variable: TVariable;
begin
  Query     := TQuery.Create (DB);
  FCargando := True;
  Error     := 0;
  MsgError  := '';

  try
    Clear;

    Query.DatabaseName := DB.DatabaseName;
    Query.SessionName  := DB.SessionName;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add ('Select *');
    Query.SQL.Add ('  From CR_Met_Variable');
    Query.SQL.Add (' Order By Nombre');
    Query.Open;

    while not Query.Eof do
    begin
      Variable := TVariable.Create (Self, Query.FieldByName ('Nombre').AsString);
      Variable.Carga_Desde_Query (Query, Error, MsgError);

      if Error <> 0 then
      begin
        MsgError := Format ('Error al cargar la variable [%s]: ', [Query.FieldByName ('Nombre').AsString]) + MsgError;
        exit;
      end;
      List.Add (Variable);

      Query.Next;
    end;
    FCambiado := False;
    if Assigned (FOnDespuesCargar) then
      FOnDespuesCargar (Self);
  finally
    FCargando := False;
    Query.Free;
  end;
end;

function TVariables.ObtenVariable (Nombre: string): TVariable;
var
  i: integer;
  Variable: TVariable;
begin
  result := nil;
  Nombre := Q_UpperCase (Q_TrimChar (Nombre));
  for i := 0 to List.Count - 1 do
  begin
    Variable := TVariable (List [i]);
    if Variable.Nombre = Nombre then
    begin
      result := Variable;
      exit;
    end;
  end;
end;

function TVariables.ObtenVariable (IDVariable: integer): TVariable;
var
  i: integer;
  Variable: TVariable;
begin
  result := nil;
  for i := 0 to List.Count - 1 do
  begin
    Variable := TVariable (List [i]);
    if Variable.ID_Variable = IDVariable then
    begin
      result := Variable;
      exit;
    end;
  end;
end;

procedure TVariables.EnviaAStringList (Strings: TStrings);
var
  i: integer;
  Variable: TVariable;
begin
  Strings.Clear;

  for i := 0 to List.Count - 1 do
  begin
    Variable := TVariable (List [i]);
    Strings.AddObject (Variable.Nombre, Variable);
  end;
end;

{TColumna}
constructor TColumna.Create (Collection: TCollection);
begin
  inherited Create (Collection);

  InicializaColumna;
  FColumnas := TColumnas (Collection);
  FBloque   := FColumnas.FBloque;
  FModelo   := FColumnas.FModelo;
end;

destructor TColumna.Destroy;
var
  Data: PColumnaData;
begin
  if Assigned (AppDefColumna) then
  begin
    AppDefColumna.DefColumnas.Delete (AppDefColumna.Index);
    AppDefColumna := nil;
  end;

  if not Bloque.Borrando and not Modelo.Cargando and Assigned (Modelo.ArbolColumnas) and Assigned (FNodo_Arbol) then
  begin
    Data := Modelo.ArbolColumnas.GetNodeData (FNodo_Arbol);
    if Assigned (Data) then
      Data^.Columna := nil;
    Modelo.ArbolColumnas.DeleteNode (FNodo_Arbol);
  end;

  FNodo_Arbol := nil;
  FColumnas   := nil;
  FBloque     := nil;
  FModelo     := nil;

  inherited Destroy;
end;

function TColumna.PuedeSalvar: boolean;
begin
  result := (FIDVariable <> 0) and Assigned (FDefinicion);
end;

procedure TColumna.InicializaColumna;
begin
  FCambiado          := False;
  FIDVariable        := 0;
  FEsObligatorio     := False;
  FEsCampoLlave      := False;
  FEsVisible         := True;
  FDefinicion        := nil;
  FSePuedeEliminar   := True;
  FSituacion         := scActivo;
  FNodo_Arbol        := nil;
  FNombreCampoFisico := '';
  FNombreCampoLogico := '';
  FAppDefColumna     := nil;
end;

procedure TColumna.ObtenNombreCampo;
begin
  FNombreCampoFisico := Format ('B%d.V%d', [Bloque.ID_Bloque, Definicion.ID_Variable]);
  FNombreCampoLogico := Format ('%s.%s',   [Bloque.Nombre,    Definicion.Nombre]);
end;

procedure TColumna.ActualizaDefinicion;
begin
  FDefinicion := nil;
  if not Assigned (Modelo) or not Assigned (Modelo.Variables) then exit;

  FDefinicion := Modelo.Variables.ObtenVariable (FIDVariable);
  ObtenNombreCampo;
end;

procedure TColumna.SetIDVariable (Value: integer);
begin
  if FIDVariable <> Value then
  begin
    if SePuedeEliminar then
      FIDVariable := Value;

    ActualizaDefinicion;

    if SePuedeEliminar then
      Cambio;
  end;
end;

procedure TColumna.SetEsObligatorio (Value: boolean);
begin
  if FEsObligatorio <> Value then
  begin
    FEsObligatorio := Value;
    Cambio;
  end;
end;

procedure TColumna.SetEsCampoLlave (Value: boolean);
begin
  if FEsCampoLlave <> Value then
  begin
    FEsCampoLlave := Value;
    Cambio;
  end;
end;

procedure TColumna.SetEsVisible (Value: boolean);
begin
  if FEsVisible <> Value then
  begin
    FEsVisible := Value;

    if Assigned (Modelo.AppModelo) and not Modelo.Cargando then
      Modelo.AppModelo.ReordenaBloques;

    Cambio;
  end;
end;

procedure TColumna.SetSituacion (Value: TSituacionColumna);
begin
  if FSituacion <> Value then
  begin
    FSituacion := Value;

    if Assigned (Modelo.AppModelo) and not Modelo.Cargando then
      Modelo.AppModelo.RegeneraDataSets;

    Cambio;
  end;
end;

function TColumna.GetNombre: string;
begin
  result := '';

  if Assigned (Definicion) then
    result := Definicion.Nombre;
end;

function TColumna.GetDescripcion: string;
begin
  result := '';

  if Assigned (Definicion) then
    result := Definicion.Descripcion;
end;

function TColumna.GetTipoDato: TVarTipoDato;
begin
  result := vtdNumber;

  if Assigned (Definicion) then
    result := Definicion.TipoDato;
end;

function TColumna.GetLongitud: integer;
begin
  result := 0;

  if Assigned (Definicion) then
    result := Definicion.Longitud;
end;

function TColumna.GetPrecision: integer;
begin
  result := 0;

  if Assigned (Definicion) then
    result := Definicion.Precision;
end;

function TColumna.GetFormato: string;
begin
  result := '';

  if Assigned (Definicion) then
    result := Definicion.Formato;
end;

function TColumna.GetValorDefault: string;
begin
  result := '';

  if Assigned (Definicion) then
    result := Definicion.ValorDefault;
end;

function TColumna.GetFuncionBusqueda: string;
begin
  result := '';

  if Assigned (Definicion) then
    result := Definicion.FuncionBusqueda;
end;

function TColumna.GetListaFijaOpciones: string;
begin
  result := '';

  if Assigned (Definicion) then
    result := Definicion.ListaFijaOpciones;
end;

function TColumna.GetTipoCapturaOpMultiple: TTipoCapturaOpMult;
begin
  result := tcomRadioButton;

  if Assigned (Definicion) then
    result := Definicion.TipoCapturaOpMultiple;
end;

function TColumna.GetValorRetOpMultiple: TValorRetOpMult;
begin
  result := vromSeleccionados;

  if Assigned (Definicion) then
    result := Definicion.ValorRetOpMultiple;
end;

function TColumna.GetValorDefaultColInactiva: string;
begin
  result := '';

  if Assigned (Definicion) then
    result := Definicion.ValorDefaultColInactiva;
end;

function TColumna.GetMetodoCaptura: TMetodoCaptura;
begin
  result := mcCaptura;

  if Assigned (Definicion) then
    result := Definicion.MetodoCaptura;
end;

function TColumna.GetURL: string;
begin
  result := '';

  if Assigned (Definicion) then
    result := Definicion.URL;
end;


procedure TColumna.Cambio;
begin
  if Assigned (Bloque) and Assigned (Modelo) and not Modelo.Cargando then
  begin
    FCambiado := True;
    Bloque.Cambio;
  end;
end;

procedure TColumna.Mueve_Info (Columna: TColumna; Nodo_Referencia: PVirtualNode);
var
  Data: PColumnaData;
  Selected: boolean;
  Destino: PVirtualNode;
begin
  Columna.FCambiado          := Cambiado;
  Columna.FIDVariable        := IDVariable;
  Columna.FEsObligatorio     := EsObligatorio;
  Columna.FEsCampoLlave      := EsCampoLlave;
  Columna.FEsVisible         := EsVisible;
  Columna.FSituacion         := Situacion;
  Columna.FDefinicion        := Definicion;
  Columna.FSePuedeEliminar   := SePuedeEliminar;
  Columna.FNombreCampoFisico := NombreCampoFisico;
  Columna.FNombreCampoLogico := NombreCampoLogico;
  Columna.FAppDefColumna     := AppDefColumna;
  FAppDefColumna             := nil;
  if Assigned (Columna.AppDefColumna) then
    Columna.AppDefColumna.FColumna := Columna;

  if Assigned (Modelo.Arbol) and Assigned (Nodo_Referencia) and Assigned (FNodo_Arbol) then
  begin
    Selected := Modelo.ArbolColumnas.Selected [FNodo_Arbol];
    if Columna.Index = (Columna.Columnas.Count - 1) then
      Destino := Modelo.ArbolColumnas.InsertNode (Nodo_Referencia, amInsertAfter)
    else
      Destino := Modelo.ArbolColumnas.InsertNode (Nodo_Referencia, amInsertBefore);

    Data                                    := Modelo.ArbolColumnas.GetNodeData (Destino);
    Data^.Columna                           := Columna;
    Columna.FNodo_Arbol                     := Destino;
    Modelo.ArbolColumnas.Selected [Destino] := Selected;
    Modelo.ArbolColumnas.DeleteNode (FNodo_Arbol);
  end;
end;


{TColumnas}
destructor TColumnas.Destroy;
begin
  FBloque := nil;
  FModelo := nil;

  inherited Destroy;
end;

function TColumnas.Agregar (IDVariable: integer): TColumna;
var
  Data: PColumnaData;
begin
  if Assigned (ObtenColumna (IDVariable)) then
    raise EModeloExcepcion.CreateFmt ('El ID de Variable [%d] ya se encuentra dentro del bloque y no puede repetirse', [IDVariable]);

  result            := TColumna (Add);
  result.IDVariable := IDVariable;

  if not Modelo.Cargando and Assigned (Modelo.ArbolColumnas) then
  begin
    result.FNodo_Arbol := Modelo.ArbolColumnas.AddChild (nil);
    Data               := Modelo.ArbolColumnas.GetNodeData (result.FNodo_Arbol);
    Data^.Columna      := result;
  end;

  if Assigned (Modelo.AppModelo) and not Modelo.Cargando then
  begin
    result.Bloque.AppBloque.DefColumnas.Agregar (result);
    result.Bloque.AppBloque.GeneraControles;
    Modelo.AppModelo.RegeneraDataSets;
  end;

  result.Cambio;
end;

function TColumnas.Eliminar (Columna: TColumna): boolean;
var
  Data: PColumnaData;
begin
  result := False;
  if not Assigned (Columna) then exit;

  if not Columna.SePuedeEliminar then
  begin
    if Assigned (Columna.Definicion) then
      raise EModeloExcepcion.CreateFmt ('No se puede eliminar la columna [%s] porque tiene información asociada', [Columna.Definicion.Descripcion])
    else
      raise EModeloExcepcion.CreateFmt ('No se puede eliminar la columna con ID de Variable [%d] porque tiene información asociada', [Columna.IDVariable])
  end;

  if Assigned (Modelo.ArbolColumnas) and Assigned (Columna.Nodo_Arbol) then
  begin
    Data          := Modelo.ArbolColumnas.GetNodeData (Columna.Nodo_Arbol);
    Data^.Columna := nil;
    Modelo.ArbolColumnas.DeleteNode (Columna.Nodo_Arbol);
    Columna.FNodo_Arbol := nil;
  end;

  Columna.Columnas.Delete (Columna.Index);

  if Assigned (Modelo.AppModelo) then
    Modelo.AppModelo.RegeneraDataSets;

  result := True;
  Bloque.Cambio;
end;

function TColumnas.ObtenColumna (Nombre: string): TColumna;
var
  i: integer;
  Columna: TColumna;
begin
  result := nil;
  Nombre := Q_UpperCase (Q_TrimChar (Nombre));

  for i := 0 to Count - 1 do
  begin
    Columna := Items [i];

    if Assigned (Columna.Definicion) and (Columna.Definicion.Nombre = Nombre) then
    begin
      result := Columna;
      exit;
    end;
  end;
end;

function TColumnas.ObtenColumna (IDVariable: integer): TColumna;
var
  i: integer;
begin
  result := nil;

  for i := 0 to Count - 1 do
    if Items [i].IDVariable = IDVariable then
    begin
      result := Items [i];
      exit;
    end;
end;

function TColumnas.Mover_A_Posicion (Columna: TColumna; Posicion: integer): boolean;
var
  NvaColumna, Columna_Referencia: TColumna;
  Nodo_Referencia: PVirtualNode;
begin
  result := False;
  if not Assigned (Columna) or (Columna.Columnas.Count < 2) or (Columna.Index = Posicion) or (Posicion < 0) or
     (Posicion > Count) then exit;

  if Posicion = Count then
  begin
    Columna_Referencia := Items [Posicion - 1];
    Nodo_Referencia    := Columna_Referencia.Nodo_Arbol;
    NvaColumna         := TColumna (Add);
  end
  else
  begin
    Columna_Referencia := Items [Posicion];
    Nodo_Referencia    := Columna_Referencia.Nodo_Arbol;
    NvaColumna         := TColumna (Insert (Posicion));
  end;

  Columna.Mueve_Info (NvaColumna, Nodo_Referencia);
  Delete (Columna.Index);
  result := True;
  Columna_Referencia.Cambio;
  NvaColumna.Cambio;
end;

function TColumnas.Subir_Posicion (Columna: TColumna): boolean;
begin
  result := False;
  if not Assigned (Columna) then exit;

  result := Mover_A_Posicion (Columna, Columna.Index - 1);
end;

function TColumnas.Bajar_Posicion (Columna: TColumna): boolean;
begin
  result := False;
  if not Assigned (Columna) then exit;

  result := Mover_A_Posicion (Columna, Columna.Index + 2)
end;


function TColumnas.GetItem(Index: Integer): TColumna;
begin
  Result := TColumna (inherited GetItem(Index));
end;

procedure TColumnas.SetItem(Index: Integer; Value: TColumna);
begin
  inherited SetItem(Index, Value);
end;

{TBloque}
constructor TBloque.Create (Collection: TCollection);
begin
  inherited Create (Collection);
  FBloques           := TBloques (Collection);
  FModelo            := FBloques.Modelo;
  FNivel             := 0;
  FBloque_Padre      := FBloques.FBloque;
  FNodo_Arbol        := nil;
  FHijos             := TBloques.Create (TBloque);
  FHijos.FModelo     := Modelo;
  FHijos.FBloque     := Self;
  FColumnas          := TColumnas.Create (TColumna);
  FColumnas.FModelo  := Modelo;
  FColumnas.FBloque  := Self;
  FAppBloque         := nil;

  FID_Bloque         := 0;
  FNombre            := '';
  FDescripcion       := '';
  FEsGrupoRepeticion := False;
  FSituacion         := sbActivo;
  FSePuedeEliminar   := True;
  FCambiado          := False;
  FBorrando          := False;

  //En esta versión no se permite que los grupos de repetición tengan subbloques
  if Assigned (FBloque_Padre) then
    FBloque_Padre.EsGrupoRepeticion := False;

  if not Modelo.Cargando then
    FID_Bloque := Modelo.Obten_Siguiente_ID_Bloque;
end;

destructor TBloque.Destroy;
var
  Data: PBloqueData;
begin
  FBorrando := True;
  if Assigned (FColumnas) then
  begin
    FColumnas.Clear;
    FreeAndNil (FColumnas);
  end;

  if Assigned (FAppBloque) then
  begin
    FAppBloque.Bloques.Delete (FAppBloque.Index);
    FAppBloque         := nil;
  end;

  {Si el nodo del árbol aún está asociado, elimina la asociación}
  if Assigned (Modelo) and Assigned (Modelo.Arbol) and Assigned (FNodo_Arbol) then
  begin
    Data := Modelo.Arbol.GetNodeData (FNodo_Arbol);

    if Assigned (Data) then
      Data^.Bloque := nil;

    FNodo_Arbol      := nil;
  end;

  if Assigned (FHijos) then
  begin
    FHijos.Clear;
    FreeAndNil (FHijos);
  end;

  FBloque_Padre := nil;
  FBloques      := nil;
  FModelo       := nil;
  FAppBloque    := nil;

  inherited Destroy;
end;

procedure TBloque.SetID_Bloque (Value: integer);
begin
  if FID_Bloque <> Value then
  begin
    FID_Bloque := Value;
    Cambio;
  end;
end;

procedure TBloque.SetNombre (Value: string);
begin
  Value := Q_UpperCase (Q_TrimChar (Value));
  if FNombre <> Value then
  begin
    FNombre := Value;
    Cambio;
  end;
end;

procedure TBloque.SetDescripcion (Value: string);
begin
  Value := Q_TrimChar (Value);
  if FDescripcion <> Value then
  begin
    FDescripcion := Value;
    Cambio;
  end;
end;

procedure TBloque.SetEsGrupoRepeticion (Value: boolean);
begin
  if FEsGrupoRepeticion <> Value then
  begin
    FEsGrupoRepeticion := Value;

    if Assigned (AppBloque) then
      AppBloque.AppModelo.RegeneraDataSets;

    if Assigned (Modelo.AppModelo) then
      Modelo.AppModelo.RecargaDataSets;
    Cambio;
  end;
end;

procedure TBloque.SetSituacion (Value: TSituacionBloque);
begin
  if FSituacion <> Value then
  begin
    FSituacion := Value;

    if Assigned (AppBloque) then
      AppBloque.AppModelo.RegeneraDataSets;

    Cambio;
  end;
end;

procedure TBloque.SetCambiado (Value: boolean);
var
  i: integer;
begin
  if FCambiado <> Value then
  begin
    FCambiado := Value;

    if not FCambiado then
    begin
      for i := 0 to Columnas.Count - 1 do
        Columnas [i].Cambiado := False;

      for i := 0 to Hijos.Count - 1 do
        Hijos [i].Cambiado := False;
    end
    else if Assigned (Bloque_Padre) then
    begin
      Bloque_Padre.Cambiado := True;
    end;
  end;
end;


procedure TBloque.Cambio;
begin
  if not Modelo.Cargando then
  begin
    FCambiado := True;

    if Assigned (Bloque_Padre) then
      Bloque_Padre.Cambio;
    Modelo.Cambio;
  end;
end;


procedure TBloque.Mueve_Info (Bloque: TBloque; Nodo_Referencia: PVirtualNode);
var
  i: integer;
  Data: PBloqueData;
  Selected, Expanded: boolean;
  Destino: PVirtualNode;
begin
  Bloque.FID_Bloque   := FID_Bloque;
  Bloque.FNombre      := FNombre;
  Bloque.FDescripcion := FDescripcion;
  Bloque.FNivel       := FNivel;
  Bloque.FAppBloque   := FAppBloque;
  FAppBloque          := nil;
  if Assigned (Bloque.FAppBloque) then
    Bloque.FAppBloque.FBloque := Bloque;

  if Assigned (Modelo.Arbol) and Assigned (Nodo_Referencia) and Assigned (FNodo_Arbol) then
  begin
    Selected := Modelo.Arbol.Selected [FNodo_Arbol];

    if Bloque.Index = (Bloque.Bloques.Count - 1) then
      Destino := Modelo.Arbol.InsertNode (Nodo_Referencia, amInsertAfter)
    else
      Destino := Modelo.Arbol.InsertNode (Nodo_Referencia, amInsertBefore);

    Data                            := Modelo.Arbol.GetNodeData (Destino);
    Data^.Bloque                    := Bloque;
    Bloque.FNodo_Arbol              := Destino;
    Modelo.Arbol.Selected [Destino] := Selected;
    Expanded                        := vsExpanded in FNodo_Arbol.States;

    for i := 0 to FHijos.Count - 1 do
      if Assigned (FHijos [i].FNodo_Arbol) then
        Modelo.Arbol.MoveTo (FHijos [i].FNodo_Arbol, Destino, amAddChildLast, False);

    Modelo.Arbol.Expanded [Destino] := Expanded;

    Modelo.Arbol.DeleteNode (FNodo_Arbol);
  end;
  FNodo_Arbol := nil;

  for i := 0 to FHijos.Count - 1 do
    FHijos.Items [i].FBloque_Padre := Bloque;

  Bloque.FHijos.Clear;
  FreeAndNil (Bloque.FHijos);
  Bloque.FHijos := FHijos;
  FHijos        := nil;

  for i := 0 to FColumnas.Count - 1 do
    FColumnas.Items [i].FBloque := Bloque;

  Bloque.FColumnas.Clear;
  FreeAndNil (Bloque.FColumnas);
  Bloque.Columnas := FColumnas;
  FColumnas       := nil;
end;

function TBloque.PuedeSalvar: boolean;
var
  i: integer;
begin
  result := (FNombre <> '')
            {and (FDescripcion <> '')}                // La descripción ya no es obligatoria
            and ((Columnas.Count + Hijos.Count) > 0); // Si tiene al menos una columna o un sub bloque.
  if not result then exit;

  for i := 0 to Columnas.Count - 1 do
  begin
    result := result and Columnas [i].PuedeSalvar;

    if not result then exit;
  end;

  for i := 0 to Hijos.Count - 1 do
  begin
    result := result and Hijos [i].PuedeSalvar;

    if not result then exit;
  end;
end;

function TBloque.BloqueVisible: boolean;
var
  Padre: TBloque;
begin
  result := Situacion = sbActivo;

  if not result then exit;

  Padre := Bloque_Padre;
  while Assigned (Padre) do
  begin
    result := Padre.Situacion = sbActivo;
    if not result then exit;

    Padre := Padre.Bloque_Padre;
  end;
end;


procedure TBloque.CargaColumnasEnArbol;
var
  i: integer;
  Columna: TColumna;
  Data: PColumnaData;
begin
  if not Assigned (Modelo.ArbolColumnas) then exit;

  Modelo.ArbolColumnas.Clear;
  for i := 0 to Columnas.Count - 1 do
  begin
    Columna             := Columnas [i];
    Columna.FNodo_Arbol := Modelo.ArbolColumnas.AddChild (nil);
    Data                := Modelo.ArbolColumnas.GetNodeData (Columna.FNodo_Arbol);
    Data^.Columna       := Columna;
  end;
end;



{TBloques}
destructor TBloques.Destroy;
begin
  Clear;
  FModelo := nil;
  FBloque := nil;
  inherited Destroy;
end;

function TBloques.GetItem(Index: Integer): TBloque;
begin
  Result := TBloque (inherited GetItem(Index));
end;

procedure TBloques.SetItem(Index: Integer; Value: TBloque);
begin
  inherited SetItem(Index, Value);
end;

{TModelo}
constructor TModelo.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  Inicializa;
  FArbol             := nil;
  FArbolColumnas     := nil;
  FBloques           := TBloques.Create (TBloque);
  FBloques.FModelo   := Self;
  FBloques.FBloque   := nil;
  FVariables         := TVariables.Create (Self);
  FVariables.FModelo := Self;
  FAppModelo         := nil;
  FInterforma        := nil;
  FDatabase          := nil;
end;

destructor TModelo.Destroy;
begin
  Arbol         := nil;
  ArbolColumnas := nil;
  FInterforma   := nil;
  FDatabase     := nil;

  if Assigned (AppModelo) then
  begin
    AppModelo.Modelo := nil;
    FAppModelo       := nil;
  end;

  FBloques.Clear;
  FreeAndNil (FBloques);

  FVariables.FModelo := nil;
  FVariables.Clear;
  FreeAndNil (FVariables);

  inherited Destroy;
end;

procedure TModelo.Inicializa;
begin
  FCargando         := False;
  FCambiado         := False;
  FSituacion        := smActivo;
  FBloque_Siguiente := 0;
  FID_Modelo        := 0;
  FNombre           := '';
  FDescripcion      := '';
  FFechaEmpresa     := Trunc (Now);
  FCve_Usuario      := '';
end;

procedure TModelo.AjustaDatabaseInteforma;
begin
  if Assigned (FInterforma)               and Assigned (FInterforma.Funcion) and
     Assigned (FInterforma.Funcion.Owner) and (FInterforma.Funcion.Owner is TInterFrame) then
      FInterforma.Funcion.Apli := TInterFrame (FInterforma.Funcion.Owner).Apli;
end;

procedure TModelo.LimpiaModelo;
begin
  try
    FCargando := True;
    if Assigned (AppModelo) then
      AppModelo.Bloques.Clear;

    Inicializa;
    FCargando := True;
    if Assigned (Arbol) then
    begin
      Arbol.BeginUpdate;
      Arbol.Clear;
    end;

    if Assigned (ArbolColumnas) then
    begin
      ArbolColumnas.BeginUpdate;
      ArbolColumnas.Clear;
    end;

    FBloques.Clear;

  finally
    if Assigned (Arbol) then
      Arbol.EndUpdate;

    if Assigned (ArbolColumnas) then
      ArbolColumnas.EndUpdate;

    FCargando := False;
  end;
end;

procedure TModelo.Cambio;
begin
  if not FCargando then
  begin
    FCambiado := True;
    if Assigned (FOnDespuesCambio) then
      FOnDespuesCambio (Self);

    if Assigned (AppModelo) then
      AppModelo.ReordenaBloques;
  end;
end;

procedure TModelo.FreeArbolNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PBloqueData;
begin
  Data := (Sender as TBaseVirtualTree).GetNodeData (Node);

  if Assigned (Data) then
  begin
    if Assigned (Data^.Bloque) then
      Data^.Bloque.FNodo_Arbol := nil;

    Data^.Bloque := nil;
  end;
end;

procedure TModelo.FreeArbolColumnasNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PColumnaData;
begin
  Data := (Sender as TBaseVirtualTree).GetNodeData (Node);

  if Assigned (Data) then
  begin
    if Assigned (Data^.Columna) then
      Data^.Columna.FNodo_Arbol := nil;

    Data^.Columna := nil;
  end;
end;

procedure TModelo.SetArbol (Value: TVirtualStringTree);
begin
  if FArbol <> Value then
  begin
    if Assigned (FArbol) then
      DesasignaArbol;

    FArbol := Value;
    InicializaArbol;
  end;
end;

procedure TModelo.SetArbolColumnas (Value: TVirtualStringTree);
begin
  if FArbolColumnas <> Value then
  begin
    if Assigned (FArbolColumnas) then
      DesasignaArbolColumnas;

    FArbolColumnas := Value;
    InicializaArbolColumnas;
  end;
end;

procedure TModelo.SetCambiado (Value: boolean);
var
  i: integer;
begin
  if FCambiado <> Value then
  begin
    FCambiado := Value;

    if not FCambiado then
      for i := 0 to Bloques.Count - 1 do
        Bloques [i].Cambiado := False;
  end;
end;

procedure TModelo.SetInterforma (Value: TInterforma);
begin
  if FInterforma <> Value then
  begin
    FInterforma := Value;
    if Assigned (FInterforma) and Assigned (FInterforma.Funcion) then
    begin
      AjustaDatabaseInteforma;
      if Assigned (FInterforma.Funcion.Apli) then
      begin
        FCve_Usuario     := FInterforma.Funcion.Apli.Usuario;
        FDataBase        := FInterforma.Funcion.Apli.DataBase;
        FFechaEmpresa    := FInterforma.Funcion.Apli.DameFechaEmpresa;
      end;
    end;
  end;
end;

procedure TModelo.SetDatabase (Value: TDatabase);
begin
  if not Assigned (FInterforma) and (FDatabase <> Value) then
    FDatabase := Value;
end;

procedure TModelo.SetFechaEmpresa (Value: TDate);
begin
  Value := Trunc (Value);
  if not Assigned (FInterforma) and (FFechaEmpresa <> Value) then
    FFechaEmpresa := Value;
end;

procedure TModelo.SetCve_Usuario (Value: string);
begin
  if not Assigned (FInterforma) and (FCve_Usuario <> Value) then
    FCve_Usuario := Value;
end;

function TModelo.GetDatabase: TDatabase;
begin
  if Assigned (FInterforma) then
  begin
    if Assigned (FInterforma.Funcion) and Assigned (FInterforma.Funcion.Apli) then
      result := FInterforma.Funcion.Apli.Database
    else
      result := nil;
  end
  else
    result := FDatabase;
end;

function TModelo.GetFechaEmpresa: TDate;
begin
  if Assigned (FInterforma) then
  begin
    if Assigned (FInterforma.Funcion) and Assigned (FInterforma.Funcion.Apli) then
      result := FInterforma.Funcion.Apli.DameFechaEmpresa
    else
      result := FFechaEmpresa
  end
  else
    result := FFechaEmpresa;
end;

function TModelo.GetCve_Usuario: string;
begin
  if Assigned (FInterforma) then
  begin
    if Assigned (FInterforma.Funcion) and Assigned (FInterforma.Funcion.Apli) then
      result := FInterforma.Funcion.Apli.Usuario
    else
      result := ''
  end
  else
    result := FCve_Usuario;
end;

procedure TModelo.SetNombre (Value: string);
begin
  Value := Q_UpperCase (Q_TrimChar (Value));
  if FNombre <> Value then
  begin
    FNombre := Value;
    Cambio;
  end;
end;

procedure TModelo.SetDescripcion (Value: string);
begin
  Value := Q_TrimChar (Value);
  if FDescripcion <> Value then
  begin
    FDescripcion := Value;
    Cambio;
  end;
end;

procedure TModelo.SetSituacion (Value: TSituacionModelo);
begin
  if FSituacion <> Value then
  begin
    FSituacion := Value;
    Cambio;
  end;
end;

procedure TModelo.InicializaArbol;
  procedure PreOrder (Bloque: TBloque);
  var
    i: integer;
    Data: PBloqueData;
  begin
    if Assigned (Bloque.FBloque_Padre) then
      Bloque.FNodo_Arbol := FArbol.AddChild (Bloque.FBloque_Padre.FNodo_Arbol)
    else
      Bloque.FNodo_Arbol := FArbol.AddChild (nil);
    Data         := FArbol.GetNodeData (Bloque.FNodo_Arbol);
    Data^.Bloque := Bloque;

    for i := 0 to Bloque.FHijos.Count - 1 do
      PreOrder (Bloque.FHijos [i]);

    FArbol.Expanded [Bloque.FNodo_Arbol] := True;    
  end;

var
  i: integer;
begin
  if not Assigned (FArbol) then exit;

  FArbol.NodeDataSize := SizeOf (RBloqueData);
  FArbol.OnFreeNode   := FreeArbolNode;

  for i := 0 to FBloques.Count - 1 do
    PreOrder (FBloques [i]);
end;

procedure TModelo.InicializaArbolColumnas;
begin
  if not Assigned (FArbolColumnas) then exit;

  FArbolColumnas.NodeDataSize := SizeOf (RColumnaData);
  FArbolColumnas.OnFreeNode   := FreeArbolColumnasNode;
end;


procedure TModelo.DesasignaArbol;
begin
  if not Assigned (FArbol) then exit;

  FArbol.Clear;
  FArbol.OnFreeNode := nil;
end;

procedure TModelo.DesasignaArbolColumnas;
begin
  if not Assigned (FArbolColumnas) then exit;

  FArbolColumnas.Clear;
  FArbolColumnas.OnFreeNode := nil;
end;


procedure TModelo.ActualizaVariables;
  procedure PreOrder (Bloque: TBloque);
  var
    i: integer;
  begin
    // Primero actualiza las referencias a las variables apuntadas
    for i := 0 to Bloque.Columnas.Count - 1 do
      Bloque.Columnas [i].ActualizaDefinicion;

    // Despues realiza el recorrido a los bloques hijos
    for i := 0 to Bloque.Hijos.Count - 1 do
      PreOrder (Bloque.Hijos [i]);
  end;

var
  i: integer;
begin
  for i := 0 to FBloques.Count - 1 do
    PreOrder (FBloques [i]);
end;

procedure TModelo.DesasignaVariables;
  procedure PreOrder (Bloque: TBloque);
  var
    i: integer;
  begin
    // Primero elimina las referencias a las variables apuntadas
    for i := 0 to Bloque.Columnas.Count - 1 do
      Bloque.Columnas [i].FDefinicion := nil;

    // Despues realiza el recorrido a los bloques hijos
    for i := 0 to Bloque.Hijos.Count - 1 do
      PreOrder (Bloque.Hijos [i]);
  end;

var
  i: integer;
begin
  for i := 0 to FBloques.Count - 1 do
    PreOrder (FBloques [i]);
end;

function TModelo.Obten_Siguiente_ID_Bloque: integer;
begin
  Inc (FBloque_Siguiente);
  result := FBloque_Siguiente;
end;

procedure TModelo.Notification(AComponent : TComponent; Operation : TOperation);
begin
  inherited Notification (AComponent, Operation);

  if Operation <> opRemove then exit;

  if AComponent = FArbol then
    FArbol := nil
  else if AComponent = FArbolColumnas then
    FArbolColumnas := nil
  else if AComponent = FAppModelo then
    FAppModelo := nil
  else if AComponent = FInterforma then
    FInterforma := nil
  else if AComponent = FDatabase then
    FDatabase := nil;
end;

function TModelo.Agregar (Nodo_Referencia: TBloque; Nombre: string): TBloque;
var
  Data: PBloqueData;
begin
  if Assigned (ObtenBloque (Nombre)) then
    raise EModeloExcepcion.CreateFmt ('El bloque [%s] ya existe dentro del modelo y no puede repetirse', [Nombre]);

  if Assigned (Nodo_Referencia) then
  begin
    result               := TBloque (Nodo_Referencia.Bloques.Add);
    result.FBloque_Padre := Nodo_Referencia.FBloque_Padre;
    result.FNivel        := Nodo_Referencia.FNivel;
  end
  else
  begin
    result        := TBloque (Bloques.Add);
    result.FNivel := 1;
  end;
  result.FNombre := Q_UpperCase (Q_TrimChar (Nombre));

  if Assigned (Arbol) then
  begin
    if not Assigned (Nodo_Referencia) then
      result.FNodo_Arbol := Arbol.AddChild (nil)
    else
    begin
      Data := Arbol.GetNodeData (Nodo_Referencia.Nodo_Arbol);
      if not Assigned (Data) or not Assigned (Data^.Bloque) or not Assigned (Data^.Bloque.Bloque_Padre) then
        result.FNodo_Arbol := Arbol.AddChild (nil)
      else
      begin
        result.FNodo_Arbol                                    := Arbol.AddChild (Data^.Bloque.Bloque_Padre.Nodo_Arbol);
        Arbol.Expanded [Data^.Bloque.Bloque_Padre.Nodo_Arbol] := True;
      end;
    end;

    Data         := Arbol.GetNodeData (result.FNodo_Arbol);
    Data^.Bloque := result;
  end;

  if not Cargando and Assigned (AppModelo) then
  begin
    if Assigned (result.Bloque_Padre) and Assigned (result.Bloque_Padre.AppBloque) then
      AppModelo.AgregaBloque (result, result.Bloque_Padre.AppBloque)
    else
      AppModelo.AgregaBloque (result, nil)
  end;

  result.Cambio;
end;

function TModelo.Agregar_Hijo (Padre: TBloque; Nombre: string): TBloque;
var
  Data: PBloqueData;
begin
  if Assigned (ObtenBloque (Nombre)) then
    raise EModeloExcepcion.CreateFmt ('El bloque [%s] ya existe dentro del modelo y no puede repetirse', [Nombre]);

  if Assigned (Padre) then
  begin
    result               := TBloque (Padre.Hijos.Add);
    result.FBloque_Padre := Padre;
    result.FNivel        := Padre.Nivel + 1;
  end
  else
  begin
    result        := TBloque (Bloques.Add);
    result.FNivel := 1;
  end;
  result.FNombre := Q_UpperCase (Q_TrimChar (Nombre));

  if Assigned (Arbol) then
  begin
    if not Assigned (Padre) then
      result.FNodo_Arbol := Arbol.AddChild (nil)
    else
    begin
      Data := Arbol.GetNodeData (Padre.Nodo_Arbol);
      if not Assigned (Data) or not Assigned (Data^.Bloque) or not Assigned (Data^.Bloque.Nodo_Arbol) then
        result.FNodo_Arbol := Arbol.AddChild (nil)
      else
      begin
        result.FNodo_Arbol                       := Arbol.AddChild (Data^.Bloque.Nodo_Arbol);
        Arbol.Expanded [Data^.Bloque.Nodo_Arbol] := True;
      end;
    end;
    Data         := Arbol.GetNodeData (result.FNodo_Arbol);
    Data^.Bloque := result;
  end;

  if not Cargando and Assigned (AppModelo) then
  begin
    if Assigned (result.Bloque_Padre) and Assigned (result.Bloque_Padre.AppBloque) then
      AppModelo.AgregaBloque (result, result.Bloque_Padre.AppBloque)
    else
      AppModelo.AgregaBloque (result, nil)
  end;
  
  result.Cambio;
end;

procedure TModelo.GeneraArbol (Tree: TTreeView);
var
  i: integer;

  procedure PreOrder (Bloque: TBloque; Padre: TTreeNode);
  var
    Nodo: TTreeNode;
    i: integer;
  begin
    if Bloque.Bloque_Padre = nil then
      Nodo := Tree.Items.Add (nil, Bloque.Nombre)
    else
      Nodo := Tree.Items.AddChild (Padre, Bloque.Nombre);

    if Assigned (Arbol) then
      Nodo.Data := Bloque.Nodo_Arbol;

    if Assigned (Bloque.Hijos) then
      for i := 0 to Bloque.Hijos.Count - 1 do
        PreOrder (Bloque.Hijos [i], Nodo);
  end;
begin
  if Tree = nil then exit;

  Tree.Items.BeginUpdate;
  try
    Tree.Items.Clear;

    for i := 0 to Bloques.Count - 1 do
      PreOrder (Bloques [i], nil);

    for i := 0 to Tree.Items.Count - 1 do
      Tree.Items [i].Expand (True);
  finally
    Tree.Items.EndUpdate;
  end;
end;

function TModelo.Eliminar (Bloque: TBloque): boolean;
  procedure PreOrder (Bloque: TBloque);
  var
    i: integer;
    Data: PBloqueData;
  begin
    for i := Bloque.Hijos.Count - 1 downto 0 do
      PreOrder (Bloque.Hijos [i]);

    if Assigned (Arbol) and Assigned (Bloque.Nodo_Arbol) then
    begin
      Data         := Arbol.GetNodeData (Bloque.Nodo_Arbol);
      Data^.Bloque := nil;
      Arbol.DeleteNode (Bloque.Nodo_Arbol);
      Bloque.Nodo_Arbol := nil;
      Bloque.Bloques.Delete (Bloque.Index);
    end
    else
    begin
      Bloque.Nodo_Arbol := nil;
      Bloque.Bloques.Delete (Bloque.Index);
    end;
  end;

var
  Padre: TBloque;

begin
  result := False;
  if not Assigned (Bloque) or not Assigned (Bloque) then exit;

  if not Bloque.SePuedeEliminar then
    raise EModeloExcepcion.Create (Format ('No es posible eliminar el bloque [%s] porque tiene información asociada', [FNombre]));

  Padre := Bloque.Bloque_Padre;
  if Assigned (Arbol) and Assigned (Padre) and Assigned (Padre.Nodo_Arbol) then
    Arbol.Selected [Padre.Nodo_Arbol] := True;

  if Assigned (AppModelo) and Assigned (Bloque.AppBloque) then
    AppModelo.EliminaBloque (Bloque.AppBloque);

  PreOrder (Bloque);

  if Assigned (Arbol) and Assigned (Padre) and Assigned (Padre.Nodo_Arbol) then
  begin
    Arbol.Selected [Padre.Nodo_Arbol] := True;
    Arbol.RepaintNode (Padre.Nodo_Arbol);
  end;

  result := True;

  if Assigned (AppModelo) then
    AppModelo.RegeneraDataSets;

  if Assigned (Padre) then
    Padre.Cambio
  else
    Cambio;
end;

function TModelo.Mover_A_Posicion (Bloque: TBloque; Posicion: integer): boolean;
var
  NvoBloque, Bloque_Referencia: TBloque;
  Nodo_Referencia: PVirtualNode;
begin
  result := False;
  if not Assigned (Bloque) or (Bloque.Bloques.Count < 2) or (Bloque.Index = Posicion) or (Posicion < 0) or
     (Posicion > Bloque.Bloques.Count) then exit;

  if Posicion = Bloque.Bloques.Count then
  begin
    Bloque_Referencia := Bloque.Bloques.Items [Posicion - 1];
    Nodo_Referencia   := Bloque_Referencia.Nodo_Arbol;
    NvoBloque         := TBloque (Bloque.Bloques.Add);
  end
  else
  begin
    Bloque_Referencia := Bloque.Bloques [Posicion];
    Nodo_Referencia   := Bloque_Referencia.Nodo_Arbol;
    NvoBloque         := TBloque (Bloque.Bloques.Insert (Posicion));
  end;

  Bloque.Mueve_Info (NvoBloque, Nodo_Referencia);
  Dec (FBloque_Siguiente);
  Bloque.Bloques.Delete (Bloque.Index);
  result := True;
  Bloque_Referencia.Cambio;
  NvoBloque.Cambio;
end;

function TModelo.Subir_Posicion (Bloque: TBloque): boolean;
begin
  result := False;
  if not Assigned (Bloque) then exit;

  result := Mover_A_Posicion (Bloque, Bloque.Index - 1);
end;

function TModelo.Bajar_Posicion (Bloque: TBloque): boolean;
begin
  result := False;
  if not Assigned (Bloque) then exit;

  result := Mover_A_Posicion (Bloque, Bloque.Index + 2);
end;

function TModelo.Ruta (Bloque: TBloque; Delim: string): string;
begin
  result := '';

  if Bloque = nil then exit;

  repeat
    result := Delim + Bloque.Nombre + result;
    Bloque := Bloque.Bloque_Padre;
  until Bloque = nil;
end;

function TModelo.EsNuevo: boolean;
begin
  result := FID_Modelo = 0;
end;

function TModelo.Estado: TEstadoModelo;
begin
  if EsNuevo then
  begin
    if Cambiado then
      result := emInsertado
    else
      result := emVacio;
  end
  else
  begin
    if Cambiado then
      result := emEditado
    else
      result := emConsulta;
  end;
end;

function TModelo.NombreBloqueValido (NombreBloque: string): boolean;
begin
  result := Q_UpperCase (Q_TrimChar (NombreBloque)) = NombreBloque;
end;

function TModelo.ObtenBloque (IDBloque: integer): TBloque;
  procedure PreOrder (Bloque: TBloque; var resultado: TBloque);
  var
    i: integer;
  begin
    if Assigned (resultado) then exit;

    if Bloque.ID_Bloque = IDBloque then
    begin
      resultado := Bloque;
      exit;
    end;

    for i := 0 to Bloque.Hijos.Count - 1 do
    begin
      PreOrder (Bloque.Hijos [i], resultado);
      if Assigned (resultado) then exit;
    end;
  end;

var
  i: integer;
begin
  result := nil;
  if Bloques.Count = 0 then exit;

  for i := 0 to Bloques.Count - 1 do
    PreOrder (Bloques [i], result);
end;

function TModelo.ObtenBloque (NombreBloque: string): TBloque;
  procedure PreOrder (Bloque: TBloque; var resultado: TBloque);
  var
    i: integer;
  begin
    if Assigned (resultado) then exit;

    if Bloque.Nombre = NombreBloque then
    begin
      resultado := Bloque;
      exit;
    end;

    for i := 0 to Bloque.Hijos.Count - 1 do
    begin
      PreOrder (Bloque.Hijos [i], resultado);
      if Assigned (resultado) then exit;
    end;
  end;

var
  i: integer;
begin
  result := nil;
  if Bloques.Count = 0 then exit;

  NombreBloque := Q_UpperCase (Q_TrimChar (NombreBloque));
  for i := 0 to Bloques.Count - 1 do
    PreOrder (Bloques [i], result);
end;

function TModelo.ObtenVariable (Nombre: string): TVariable;
begin
  result := Variables.ObtenVariable (Nombre);
end;

function TModelo.ObtenVariable (IDVariable: integer): TVariable;
begin
  result := Variables.ObtenVariable (IDVariable);
end;


procedure TModelo.ActivarEdicion;
begin
  Cambio;
end;

procedure TModelo.Guardar_Estructura_En_DB (var Error: integer; var MsgError: string);
var
  Proc: TStoredProc;
  i: integer;

  procedure SalvaColumnas (Bloque: TBloque);
  var
    i: integer;
    Columna: TColumna;
  begin
    for i := 0 to Bloque.Columnas.Count - 1 do
    begin
      Columna := Bloque.Columnas [i];

      Proc.Close;
      Proc.StoredProcName := coEsquema + '.' + coPaquete + '.STPNVAVARBLOQ';

      Proc.Params.Clear;
      Proc.Params.CreateParam (ftFloat,  'peID_Nodo',          ptInput);
      Proc.Params.CreateParam (ftFloat,  'peID_Variable',      ptInput);
      Proc.Params.CreateParam (ftFloat,  'peOrden_Aparicion',  ptInput);
      Proc.Params.CreateParam (ftString, 'peB_Obligatoriedad', ptInput);
      Proc.Params.CreateParam (ftString, 'peB_Campo_Llave',    ptInput);
      Proc.Params.CreateParam (ftString, 'peB_Visible',        ptInput);
      Proc.Params.CreateParam (ftString, 'peSit_Var_Bloque',   ptInput);

      Proc.ParamByName ('peID_Nodo'         ).AsInteger := Bloque.ID_Bloque;
      Proc.ParamByName ('peID_Variable'     ).AsInteger := Columna.IDVariable;
      Proc.ParamByName ('peOrden_Aparicion' ).AsInteger := Columna.Index;
      Proc.ParamByName ('peB_Obligatoriedad').AsString  := BooleanToStr (Columna.EsObligatorio);
      Proc.ParamByName ('peB_Campo_Llave'   ).AsString  := BooleanToStr (Columna.EsCampoLlave);
      Proc.ParamByName ('peB_Visible'       ).AsString  := BooleanToStr (Columna.EsVisible);

      case Columna.Situacion of
        scActivo:   Proc.ParamByName ('peSit_Var_Bloque').AsString := 'AC';
        scInactivo: Proc.ParamByName ('peSit_Var_Bloque').AsString := 'IN';
      end;
      Proc.ExecProc;
    end;
  end;

  procedure PreOrder (Bloque: TBloque);
  var
    i: integer;
  begin
    Proc.Close;
    Proc.StoredProcName := coEsquema + '.' + coPaquete + '.STPNVOBLOQDEF';

    Proc.Params.Clear;
    Proc.Params.CreateParam (ftFloat,  'peID_Nodo',              ptInput);
    Proc.Params.CreateParam (ftString, 'peNombre',               ptInput);
    Proc.Params.CreateParam (ftString, 'peDescripcion',          ptInput);
    Proc.Params.CreateParam (ftFloat,  'peOrden_Aparicion',      ptInput);
    Proc.Params.CreateParam (ftFloat,  'peID_Nodo_Padre',        ptInput);
    Proc.Params.CreateParam (ftString, 'peB_Gpo_Rep',            ptInput);
    Proc.Params.CreateParam (ftString, 'peSit_Bloque',           ptInput);

    Proc.ParamByName ('peID_Nodo'        ).AsInteger := Bloque.ID_Bloque;
    Proc.ParamByName ('peNombre'         ).AsString  := Bloque.Nombre;
    Proc.ParamByName ('peDescripcion'    ).AsString  := Bloque.Descripcion;
    Proc.ParamByName ('peOrden_Aparicion').AsInteger := Bloque.Index;
    Proc.ParamByName ('peB_Gpo_Rep'      ).AsString  := BooleanToStr (Bloque.EsGrupoRepeticion);

    case Bloque.Situacion of
      sbActivo:   Proc.ParamByName ('peSit_Bloque').AsString := 'AC';
      sbInactivo: Proc.ParamByName ('peSit_Bloque').AsString := 'IN';
    end;

    if Assigned (Bloque.Bloque_Padre) then
      Proc.ParamByName ('peID_Nodo_Padre').AsInteger := Bloque.Bloque_Padre.ID_Bloque;

    Proc.ExecProc;

    SalvaColumnas (Bloque);

    for i := 0 to Bloque.Hijos.Count - 1 do
      PreOrder (Bloque.Hijos [i]);
  end;

begin
  AjustaDatabaseInteforma;

  if not Assigned (Database) then
    raise EModeloExcepcion.Create ('No hay una base de datos asignada');

  Error     := 0;
  MsgError  := '';
  Proc      := TStoredProc.Create (Database);

  try
    //Establece los parámetros del Stored Procedure
    Proc.DatabaseName := Database.DatabaseName;
    Proc.SessionName  := Database.SessionName;

    //Limpia las listas de bloques y variables por bloque
    Proc.Close;
    Proc.StoredProcName := coEsquema + '.' + coPaquete + '.STPCLRMODELDEF';
    Proc.Params.Clear;
    Proc.Params.CreateParam (ftFloat, 'peDummy', ptInput);
    Proc.ExecProc;

    //Envía la información de los bloques en un recorrido del árbol
    for i := 0 to Bloques.Count - 1 do
      PreOrder (Bloques [i]);

    //Realiza el alta o modificación del modelo en base de datos;
    Proc.Close;
    Proc.StoredProcName := coEsquema + '.' + coPaquete + '.STP_ALTA_MODELO';

    Proc.Params.Clear;
    Proc.Params.CreateParam (ftFloat,  'peID_Modelo',       ptInputOutput);
    Proc.Params.CreateParam (ftString, 'peNombre',          ptInput);
    Proc.Params.CreateParam (ftString, 'peDescripcion',     ptInput);
    Proc.Params.CreateParam (ftFloat,  'peBloque_Sig',      ptInput);
    Proc.Params.CreateParam (ftDate,   'peF_Vigente_Desde', ptInput);
    Proc.Params.CreateParam (ftString, 'peSit_Modelo',      ptInput);
    Proc.Params.CreateParam (ftString, 'peCve_Usu_Alta',    ptInput);
    Proc.Params.CreateParam (ftFloat,  'psError',           ptOutput);
    Proc.Params.CreateParam (ftString, 'psMsgError',        ptOutput);

    Proc.ParamByName ('peID_Modelo'      ).AsInteger := FID_Modelo;
    Proc.ParamByName ('peNombre'         ).AsString  := FNombre;
    Proc.ParamByName ('peDescripcion'    ).AsString  := FDescripcion;
    Proc.ParamByName ('peBloque_Sig'     ).AsInteger := FBloque_Siguiente;
    Proc.ParamByName ('peF_Vigente_Desde').AsDate    := FechaEmpresa;
    Proc.ParamByName ('peCve_Usu_Alta'   ).AsString  := Cve_Usuario;

    case FSituacion of
      smActivo:   Proc.ParamByName ('peSit_Modelo').AsString  := 'AC';
      smInactivo: Proc.ParamByName ('peSit_Modelo').AsString  := 'IN';
    end;
    Proc.ExecProc;

    if Proc.ParamByName ('psError').AsInteger = 0 then
    begin
      FID_Modelo := Proc.ParamByName ('peID_Modelo').AsInteger;
      Cambiado   := False;
    end
    else
    begin
      Error    := Proc.ParamByName ('psError'   ).AsInteger;
      MsgError := Proc.ParamByName ('psMsgError').AsString;
    end;

    if Assigned (AppModelo) then
      AppModelo.ActualizaBotones;
  finally
    Proc.Free;
  end;
end;

procedure TModelo.Cargar_Estructura_De_DB (Nombre_Modelo: string; var Error: integer; var MsgError: string);
var
  Query: TQuery;
  Bloque, Padre: TBloque;
  Columna: TColumna;
  TotalBloques: integer;
  TmpArbol, TmpColumnas: TVirtualStringTree;
begin
  AjustaDatabaseInteforma;

  if not Assigned (Database) then
    raise EModeloExcepcion.Create ('No hay una base de datos asignada');

  //Respalda los árboles de bloques y columnas
  TmpArbol    := Arbol;
  TmpColumnas := ArbolColumnas;

  Error    := 0;
  MsgError := '';

  Cargar_Variables_De_DB (Error, MsgError);
  if Error <> 0 then exit;

  Query         := TQuery.Create (Database);
  Nombre_Modelo := Q_UpperCase (Q_TrimChar (Nombre_Modelo));

  try
    //Desasigna los árboles de bloques y columnas
    Arbol         := nil;
    ArbolColumnas := nil;

    Query.DatabaseName := Database.DatabaseName;
    Query.SessionName  := Database.SessionName;

    //Verifica si existe el modelo
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add ('Select ID_Modelo, Nombre, Descripcion, Sit_Modelo, Bloque_Sig');
    Query.SQL.Add ('  From CR_Met_Modelo');
    Query.SQL.Add (' Where Nombre = :Nombre');
    Query.ParamByName ('Nombre').AsString := Nombre_Modelo;
    Query.Open;

    if Query.Eof then
    begin
      Error    := 1;
      MsgError := Format ('El modelo [%s] no está registrado', [Nombre_Modelo]);
      exit;
    end;

    //Carga la información del encabezado del modelo
    LimpiaModelo;
    FCargando    := True;
    FID_Modelo   := Query.FieldByName ('ID_Modelo'  ).AsInteger;
    FNombre      := Query.FieldByName ('Nombre'     ).AsString;
    FDescripcion := Query.FieldByName ('Descripcion').AsString;
    TotalBloques := Query.FieldByName ('Bloque_Sig' ).AsInteger;

    if      Query.FieldByName ('Sit_Modelo').AsString = 'AC' then
      FSituacion := smActivo
    else if Query.FieldByName ('Sit_Modelo').AsString = 'IN' then
      FSituacion := smInactivo;

    //Carga la información de los bloques
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add ('Select T.ID_Nodo, T.Nombre, T.Descripcion, T.ID_Nodo_Padre, T.B_Gpo_Rep, T.Sit_Bloque, Count (V.ID_Persona) No_Usos');
    Query.SQL.Add ('  From (');
    Query.SQL.Add ('         Select ID_Modelo, ID_Nodo, Nombre, Descripcion, ID_Nodo_Padre, B_Gpo_Rep, Sit_Bloque, RowNum Renglon');
    Query.SQL.Add ('           From CR_Met_Bloque');
    Query.SQL.Add ('          Where ID_Modelo = :Modelo');
    Query.SQL.Add ('        Connect By ID_Nodo_Padre = Prior ID_Nodo And ID_Modelo = Prior ID_Modelo');
    Query.SQL.Add ('          Start With ID_Nodo_Padre Is Null And ID_Modelo = :Modelo');
    Query.SQL.Add ('          Order Siblings By Orden_Aparicion');
    Query.SQL.Add ('       ) T');
    Query.SQL.Add ('  Left Outer Join CR_Met_Valor_Var V On T.ID_Modelo = V.ID_Modelo And');
    Query.SQL.Add ('                                        T.ID_Nodo   = V.ID_Nodo');
    Query.SQL.Add (' Group By T.ID_Nodo, T.Nombre, T.Descripcion, T.ID_Nodo_Padre, T.B_Gpo_Rep, T.Sit_Bloque, T.Renglon');
    Query.SQL.Add (' Order By T.Renglon');
    Query.ParamByName ('Modelo').AsInteger := FID_Modelo;
    Query.Open;

    if not Query.Eof then
    begin
      while not Query.Eof do
      begin
        Padre := ObtenBloque (Query.FieldByName ('ID_Nodo_Padre').AsInteger);

        if Assigned (Padre) then
          Bloque := Agregar_Hijo (Padre, Query.FieldByName ('Nombre').AsString)
        else
          Bloque := Agregar      (nil,   Query.FieldByName ('Nombre').AsString);

        Bloque.Cambiado           := False;
        Bloque.FID_Bloque         := Query.FieldByName ('ID_Nodo'          ).AsInteger;
        Bloque.FDescripcion       := Query.FieldByName ('Descripcion'      ).AsString;

        Bloque.FEsGrupoRepeticion := StrToBoolean (Query.FieldByName ('B_Gpo_Rep').AsString);

        //El bloque se puede eliminar si no ha estado salvado en base de datos y no ha sido utilizado para calificar a ninguna persona,
        //de lo contrario solo se puede desactivar
        Bloque.FSePuedeEliminar   := Query.FieldByName ('No_Usos').AsInteger = 0;

        if Query.FieldByName ('Sit_Bloque').AsString = 'AC' then
          Bloque.FSituacion := sbActivo
        else
          Bloque.FSituacion := sbInactivo;

        Query.Next;
      end;

      if Assigned (Arbol) then
        Arbol.Selected [Bloques [0].Nodo_Arbol] := True;
    end;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add ('Select C.ID_Nodo, C.Orden_Aparicion, C.ID_Variable, C.B_Obligatoriedad, C.B_Campo_Llave, C.B_Visible, C.Sit_Var_Bloque,');
    Query.SQL.Add ('       Count (V.ID_Persona) Uso');
    Query.SQL.Add ('  From            CR_Met_Var_Bloque C');
    Query.SQL.Add ('  Left Outer Join CR_Met_Valor_Var  V On C.ID_Modelo   = V.ID_Modelo   And');
    Query.SQL.Add ('                                         C.ID_Nodo     = V.ID_Nodo     And');
    Query.SQL.Add ('                                         C.ID_Variable = V.ID_Variable');
    Query.SQL.Add (' Where C.ID_Modelo = :Modelo');
    Query.SQL.Add (' Group By C.ID_Nodo, C.Orden_Aparicion, C.ID_Variable, C.B_Obligatoriedad, C.B_Campo_Llave, C.B_Visible, C.Sit_Var_Bloque');
    Query.SQL.Add (' Order By C.ID_Nodo, C.Orden_Aparicion');
    Query.ParamByName ('Modelo').AsInteger := FID_Modelo;
    Query.Open;

    if not Query.Eof then
    begin
      while not Query.Eof do
      begin
        Bloque := ObtenBloque (Query.FieldByName ('ID_Nodo').AsInteger);
        if Assigned (Bloque) then
        begin
          Columna                  := Bloque.Columnas.Agregar (Query.FieldByName ('ID_Variable').AsInteger);
          Columna.EsObligatorio    := StrToBoolean (Query.FieldByName ('B_Obligatoriedad').AsString);
          Columna.EsCampoLlave     := StrToBoolean (Query.FieldByName ('B_Campo_Llave'   ).AsString);
          Columna.EsVisible        := StrToBoolean (Query.FieldByName ('B_Visible'       ).AsString);
          Columna.FSePuedeEliminar := Query.FieldByName ('Uso').AsInteger = 0;

          if      Query.FieldByName ('Sit_Var_Bloque').AsString = 'AC' then
            Columna.Situacion := scActivo
          else if Query.FieldByName ('Sit_Var_Bloque').AsString = 'IN' then
            Columna.Situacion := scInactivo;
          Columna.Cambiado := False;
        end;

        Query.Next;
      end;
    end;

    FBloque_Siguiente := TotalBloques;
    FCargando         := False;

    //Verifica si tiene un AppModelo conectado
    if Assigned (AppModelo) then
    begin
      AppModelo.FEstado := emVacio;
      AppModelo.RegeneraBloques;
      AppModelo.AplicaEstatus;
      AppModelo.ActualizaBotones;
      if AppModelo.Parent is TForm then
        (AppModelo.Parent as TForm).Caption := Descripcion;
    end;

    //Lanza el evento OnDespuesCargarEstructura
    if Assigned (FOnDespuesCargarEstructura) then
      FOnDespuesCargarEstructura (Self);
  finally
    Query.Free;
    FCargando := False;
    Cambiado  := False;

    //Reasigna los árboles de bloques y columnas
    Arbol         := TmpArbol;
    ArbolColumnas := TmpColumnas;
  end;
end;

procedure TModelo.Cargar_Variables_De_DB (var Error: integer; var MsgError: string);
begin
  AjustaDatabaseInteforma;

  if not Assigned (Database) then
    raise EModeloExcepcion.Create ('No hay una base de datos asignada');

  DesasignaVariables;
  FVariables.Cargar_De_DB (Database, Error, MsgError);
  ActualizaVariables;
end;

procedure TModelo.EnviaVariablesAStringList (Strings: TStrings);
begin
  Variables.EnviaAStringList (Strings);
end;

function TModelo.PuedeSalvar: boolean;
var
  i: integer;
begin
  result := (Q_TrimChar (FNombre) <> '') and (Q_TrimChar (FDescripcion) <> '') and (Bloques.Count > 0);
  if not result then exit;

  for i := 0 to Bloques.Count - 1 do
  begin
    result := result and Bloques [i].PuedeSalvar;

    if not result then exit;
  end;
end;

constructor TAppModeloDefColumna.Create (Collection: TCollection);
begin
  inherited Create (Collection);

  FDefColumnas    := TAppModeloDefColumnas (Collection);
  FAppModelo      := FDefColumnas.AppModelo;
  FAppBloque      := FDefColumnas.FAppBloque;
  FColumna        := nil;
  FEtiqueta       := nil;
  FControl        := nil;
  FBtnFindit      := nil;
  FDataSetColumna := nil;
  FFieldDef       := nil;
  FField          := nil;
end;

destructor TAppModeloDefColumna.Destroy;
begin
  FFieldDef := nil;
  FField    := nil;
  if Assigned (FDataSetColumna) then
  begin
    FDataSetColumna.FDefColumna := nil;
    FDataSetColumna             := nil;
  end;

  if Assigned (FBtnFindit) then
    FreeAndNil (FBtnFindit);

  if Assigned (FControl) then
    FreeAndNil (FControl);

  if Assigned (FEtiqueta) then
    FreeAndNil (FEtiqueta);

  if Assigned (FColumna) then
  begin
    FColumna.FAppDefColumna := nil;
    FColumna                := nil;
  end;

  FAppBloque := nil;
  FAppModelo := nil;

  inherited Destroy;
end;

function TAppModeloDefColumna.GetVariableID: integer;
begin
  result := 0;

  if Assigned (Columna) then
    result := Columna.IDVariable;
end;

function TAppModeloDefColumna.GetNombre: string;
begin
  result := '';

  if Assigned (Columna) then
    result := Columna.Nombre;
end;

function TAppModeloDefColumna.GetDescripcion: string;
begin
  result := '';

  if Assigned (Columna) then
    result := Columna.Descripcion;
end;

function TAppModeloDefColumna.GetTipoDato: TVarTipoDato;
begin
  result := vtdNumber;

  if Assigned (Columna) then
    result := Columna.TipoDato;
end;

function TAppModeloDefColumna.GetLongitud: integer;
begin
  result := 0;

  if Assigned (Columna) then
    result := Columna.Longitud;
end;

function TAppModeloDefColumna.GetPrecision: integer;
begin
  result := 0;

  if Assigned (Columna) then
    result := Columna.Precision;
end;

function TAppModeloDefColumna.GetFormato: string;
begin
  result := '';

  if Assigned (Columna) then
    result := Columna.Formato;
end;

function TAppModeloDefColumna.GetValorDefault: string;
begin
  result := '';

  if Assigned (Columna) then
    result := Columna.ValorDefault;
end;

function TAppModeloDefColumna.GetFuncionBusqueda: string;
begin
  result := '';

  if Assigned (Columna) then
    result := Columna.FuncionBusqueda;
end;

function TAppModeloDefColumna.GetListaFijaOpciones: string;
begin
  result := '';

  if Assigned (Columna) then
    result := Columna.ListaFijaOpciones;
end;

function TAppModeloDefColumna.GetTipoCapturaOpMultiple: TTipoCapturaOpMult;
begin
  result := tcomRadioButton;

  if Assigned (Columna) then
    result := Columna.TipoCapturaOpMultiple;
end;

function TAppModeloDefColumna.GetValorRetOpMultiple: TValorRetOpMult;
begin
  result := vromSeleccionados;

  if Assigned (Columna) then
    result := Columna.ValorRetOpMultiple;
end;

function TAppModeloDefColumna.GetValorDefaultColInactiva: string;
begin
  result := '';

  if Assigned (Columna) then
    result := Columna.ValorDefaultColInactiva;
end;

function TAppModeloDefColumna.GetMetodoCaptura: TMetodoCaptura;
begin
  result := mcCaptura;

  if Assigned (Columna) then
    result := Columna.MetodoCaptura;
end;

function TAppModeloDefColumna.GetURL: string;
begin
  result := '';

  if Assigned (Columna) then
    result := Columna.URL;
end;

function TAppModeloDefColumna.GetEsObligatorio: boolean;
begin
  result := False;

  if Assigned (Columna) then
    result := Columna.EsObligatorio;
end;

function TAppModeloDefColumna.GetEsCampoLlave: boolean;
begin
  result := False;

  if Assigned (Columna) then
    result := Columna.EsCampoLlave;
end;

function TAppModeloDefColumna.GetEsVisible: boolean;
begin
  result := False;

  if Assigned (Columna) then
    result := Columna.EsVisible;
end;

procedure TAppModeloDefColumna.SetAsString (Value: string);
begin
  if not (AppModelo.Estado in [emInsertado, emEditado]) then
    raise EModeloExcepcion.Create ('Solo se puede modificar un campo cuando se está creando o modificando la información.');

  if not (AppBloque.AppDataSet.Data.State in [dsInsert, dsEdit]) then
    raise EModeloExcepcion.Create ('No se encuentra insertando o modificando la información.');

  if Assigned (Field) and (Field.AsString <> Value) then
    Field.AsString := Value;
end;

procedure TAppModeloDefColumna.SetAsInteger (Value: integer);
begin
  if not (AppModelo.Estado in [emInsertado, emEditado]) then
    raise EModeloExcepcion.Create ('Solo se puede modificar un campo cuando se está creando o modificando la información.');

  if not (AppBloque.AppDataSet.Data.State in [dsInsert, dsEdit]) then
    raise EModeloExcepcion.Create ('No se encuentra insertando o modificando la información.');

  if Assigned (Field) and (Field.AsInteger <> Value) then
    Field.AsInteger := Value;
end;

procedure TAppModeloDefColumna.SetAsFloat (Value: double);
begin
  if not (AppModelo.Estado in [emInsertado, emEditado]) then
    raise EModeloExcepcion.Create ('Solo se puede modificar un campo cuando se está creando o modificando la información.');

  if not (AppBloque.AppDataSet.Data.State in [dsInsert, dsEdit]) then
    raise EModeloExcepcion.Create ('No se encuentra insertando o modificando la información.');

  if Assigned (Field) and (Field.AsFloat <> Value) then
    Field.AsFloat := Value;
end;

procedure TAppModeloDefColumna.SetAsDate (Value: TDate);
begin
  if not (AppModelo.Estado in [emInsertado, emEditado]) then
    raise EModeloExcepcion.Create ('Solo se puede modificar un campo cuando se está creando o modificando la información.');

  if not (AppBloque.AppDataSet.Data.State in [dsInsert, dsEdit]) then
    raise EModeloExcepcion.Create ('No se encuentra insertando o modificando la información.');

  if Assigned (Field) and (Field.AsDateTime <> Value) then
    Field.AsDateTime := Value;
end;

procedure TAppModeloDefColumna.SetAsDateTime (Value: TDateTime);
begin
  if not (AppModelo.Estado in [emInsertado, emEditado]) then
    raise EModeloExcepcion.Create ('Solo se puede modificar un campo cuando se está creando o modificando la información.');

  if not (AppBloque.AppDataSet.Data.State in [dsInsert, dsEdit]) then
    raise EModeloExcepcion.Create ('No se encuentra insertando o modificando la información.');

  if Assigned (Field) and (Field.AsDateTime <> Value) then
    Field.AsDateTime := Value;
end;

function TAppModeloDefColumna.GetAsString: string;
begin
  result := '';

  if Assigned (Field) then
    result := Field.AsString;
end;

function TAppModeloDefColumna.GetAsInteger: integer;
begin
  result := 0;

  if Assigned (Field) then
    result := Field.AsInteger;
end;

function TAppModeloDefColumna.GetAsFloat: double;
begin
  result := 0;

  if Assigned (Field) then
    result := Field.AsFloat;
end;

function TAppModeloDefColumna.GetAsDate: TDate;
begin
  result := 0;

  if Assigned (Field) then
    result := Trunc (Field.AsDateTime);
end;

function TAppModeloDefColumna.GetAsDateTime: TDateTime;
begin
  result := 0;

  if Assigned (Field) then
    result := Field.AsDateTime;
end;

procedure TAppModeloDefColumna.SetFocus;
begin
  if not Assigned (Control) or not Assigned (AppModelo.Form) or not AppModelo.Form.Visible then exit;

  if Control is TDBEdit then
    (Control as TDBEdit).SetFocus
  else if Control is TDBDateTimePicker then
    (Control as TDBDateTimePicker).SetFocus
  else if Control is TDBMemo then
    (Control as TDBMemo).SetFocus
  else if Control is TDBRadioGroup then
    (Control as TDBRadioGroup).SetFocus
  else if Control is TDBComboBox then
    (Control as TDBComboBox).SetFocus
  else if Control is TDBCheckList then
    (Control as TDBCheckList).SetFocus
  else if Control is TWebBrowser then
    (Control as TWebBrowser).SetFocus;
end;


{TAppModeloDefColumnas}
destructor TAppModeloDefColumnas.Destroy;
begin
  Clear;

  FAppModelo := nil;
  FAppBloque := nil;
  inherited Destroy;
end;

function TAppModeloDefColumnas.GetItem (Index: integer): TAppModeloDefColumna;
begin
  Result := TAppModeloDefColumna (inherited GetItem(Index));
end;

procedure TAppModeloDefColumnas.SetItem (Index: integer; Value: TAppModeloDefColumna);
begin
  inherited SetItem(Index, Value);
end;

function TAppModeloDefColumnas.Agregar (Columna: TColumna): TAppModeloDefColumna;
begin
  result                 := TAppModeloDefColumna (Add);
  result.FColumna        := Columna;
  Columna.FAppDefColumna := result;
end;


{TAppModeloBloque}
constructor TAppModeloBloque.Create (Collection: TCollection);
begin
  inherited Create (Collection);

  FBloques                    := TAppModeloBloques (Collection);
  FAppModelo                  := FBloques.AppModelo;
  FModelo                     := FAppModelo.Modelo;
  FBloque                     := nil;
  FBloque_Padre               := nil;
  FPanel                      := TGroupBox.Create (AppModelo);
  FPanel.Visible              := False;
  FDefColumnas                := TAppModeloDefColumnas.Create (TAppModeloDefColumna);
  FDefColumnas.FAppModelo     := FAppModelo;
  FDefColumnas.FAppBloque     := Self;
  FAppDataSet                 := nil;
  FNavegador                  := nil;
  FDataSetBloque              := nil;
  FLocalAppDataSet            := TAppModeloDataSet.Create (TAppModeloDataSetBloque);
  FLocalAppDataSet.Inicializa (AppModelo);
  FLocalAppDataSet.FAppBloque := Self;
  FNavegador                  := TDBNavigator.Create (AppModelo);
  FNavegador.DataSource       := LocalAppDataSet.DataSource;
  FNavegador.VisibleButtons   := [nbFirst, nbPrior, nbNext, nbLast];
  FNavegador.BeforeAction     := AntesBtnNav;
  FNavegador.OnClick          := DespuesBtnNav;
  FNavEdicion                 := TDBNavigator.Create (AppModelo);
  FNavEdicion.DataSource      := LocalAppDataSet.DataSource;
  FNavEdicion.VisibleButtons  := [nbInsert, nbEdit, nbDelete, nbPost, nbCancel];

  HintsNavegador (FNavegador);
  HintsNavegador (FNavEdicion);
end;

destructor TAppModeloBloque.Destroy;
var
  DSBloque: TAppModeloDataSetBloque;
begin
  if Assigned (AppDataSet) and Assigned (FDataSetBloque) then
  begin
    DSBloque := AppDataSet.ObtenDataSetBloque (Self);
    AppDataSet.Delete (DSBloque.Index);
    FDataSetBloque := nil;
  end;

  DestruyeControles;
  FLocalAppDataSet.Clear;
  FreeAndNil (FLocalAppDataSet);

  if Assigned (FBloque) then
    FBloque.FAppBloque := nil;

  FBloque       := nil;
  FModelo       := nil;
  FAppModelo    := nil;
  FBloques      := nil;
  FBloque_Padre := nil;
  FNavegador    := nil;
  FAppDataSet   := nil;

  inherited Destroy;
end;

function TAppModeloBloque.GetBloqueID: integer;
begin
  result := 0;

  if Assigned (Bloque) then
    result := Bloque.ID_Bloque;
end;

function TAppModeloBloque.GetNivel: integer;
begin
  result := 0;

  if Assigned (Bloque) then
    result := Bloque.Nivel;
end;

function TAppModeloBloque.GetNombre: string;
begin
  result := '';

  if Assigned (Bloque) then
    result := Bloque.Nombre;
end;

function TAppModeloBloque.GetDescripcion: string;
begin
  result := '';

  if Assigned (Bloque) then
    result := Bloque.Descripcion;
end;

function TAppModeloBloque.GetEsGrupoRepeticion: boolean;
begin
  result := False;

  if Assigned (Bloque) then
    result := Bloque.EsGrupoRepeticion;
end;

function TAppModeloBloque.PrimerHijo: TAppModeloBloque;
begin
  result := nil;

  if Assigned (Bloque) and (Bloque.Hijos.Count > 0) then
    result := Bloque.Hijos [0].AppBloque;
end;

function TAppModeloBloque.UltimoHijo: TAppModeloBloque;
begin
  result := nil;

  if Assigned (Bloque) and (Bloque.Hijos.Count > 0) then
    result := Bloque.Hijos [Bloque.Hijos.Count - 1].AppBloque;
end;

function TAppModeloBloque.HermanoAnterior: TAppModeloBloque;
begin
  result := nil;

  if Assigned (Bloque) and (Bloque.Index > 0) then
    result := Bloque.Bloques [Bloque.Index - 1].AppBloque;
end;

function TAppModeloBloque.HermanoSiguiente: TAppModeloBloque;
begin
  result := nil;

  if Assigned (Bloque) and (Bloque.Index <= (Bloque.Bloques.Count - 2)) then
    result := Bloque.Bloques [Bloque.Index + 1].AppBloque;
end;

function TAppModeloBloque.PuedeGenerarDesdeQuery: boolean;
begin
  result := (FAppModelo.Estado in [emInsertado, emEditado]) and (FLocalAppDataSet.Data.State = dsBrowse);
end;

function TAppModeloBloque.PoblarDesdeQuery (Query: TQuery): boolean;
begin
  result := False;

  if not PuedeGenerarDesdeQuery then exit;

  FLocalAppDataSet.Data.DisableControls;
  try
    if FLocalAppDataSet.Data.State in [dsInsert, dsEdit] then
      FLocalAppDataSet.Data.Cancel;

    FLocalAppDataSet.Data.First;
    while FLocalAppDataSet.Data.RecordCount > 0 do
      FLocalAppDataSet.Data.Delete;

    result := AgregarDesdeQuery (Query);

  finally
    FLocalAppDataSet.Data.EnableControls;
  end;
end;

function TAppModeloBloque.VerificaColumnasCargaQuery (Query: TQuery): boolean;
var
  i: integer;
  Columna: TAppModeloDefColumna;
begin
  result := False;

  if not Assigned (Query) or not Query.Active then exit;

  for i := 0 to Query.FieldCount - 1 do
  begin
    Columna := ObtenColumna (Q_UpperCase (Query.FieldList [i].FieldName));

    if Assigned (Columna) then
    begin
      result := True;
      exit;
    end;
  end;
end;


function TAppModeloBloque.AgregarDesdeQuery (Query: TQuery): boolean;
var
  i: integer;
  Columna: TAppModeloDefColumna;
begin
  result := False;

  if not PuedeGenerarDesdeQuery or not VerificaColumnasCargaQuery (Query) then exit;

  FLocalAppDataSet.Data.DisableControls;
  try
    if FLocalAppDataSet.Data.State in [dsInsert, dsEdit] then
    begin
      if FLocalAppDataSet.EsVacio then
        FLocalAppDataSet.Data.Cancel
      else
        FLocalAppDataSet.Data.Post;
    end;

    Query.First;
    while not Query.Eof do
    begin
      FLocalAppDataSet.Data.Insert;
      for i := 0 to Query.FieldCount - 1 do
      begin
        Columna := ObtenColumna (Q_UpperCase (Query.FieldList [i].FieldName));
        if Assigned (Columna) then
          Columna.AsString := Query.Fields [i].AsString;
      end;
      FLocalAppDataSet.Data.Post;

      Query.Next;
    end;

    result := True;
  finally
    FLocalAppDataSet.Data.EnableControls;
  end;
end;


procedure TAppModeloBloque.GeneraColumnas;
var
  i: integer;
begin
  DefColumnas.Clear;

  if not Assigned (Bloque) or not Assigned (Bloque.Modelo) or Bloque.Modelo.Cargando then exit;
  for i := 0 to Bloque.Columnas.Count - 1 do
    DefColumnas.Agregar (Bloque.Columnas [i]);
end;

procedure TAppModeloBloque.GeneraControlesColumna (Columna: TAppModeloDefColumna);
begin
  if not Assigned (Modelo) or Modelo.Cargando then exit;

  if not Assigned (Columna.Etiqueta) then
  begin
    Columna.FEtiqueta := TLabel.Create (AppModelo);

    if Assigned (Columna.Columna) and Assigned (Columna.Columna.Definicion) then
      Columna.FEtiqueta.Caption := Columna.Columna.Definicion.Descripcion
    else
      Columna.FEtiqueta.Caption := '';
  end;

  if not Assigned (Columna.Control) then
  begin
    case Columna.Columna.Definicion.TipoDato of
      vtdDate,
      vtdDateTime:
      begin
        Columna.FControl                              := TDBDateTimePicker.Create (AppModelo);
        TDBDateTimePicker (Columna.FControl).DateTime := 0;
      end;
      vtdNumber: begin
        Columna.FControl := TDBValidationEdit.Create (AppModelo);

        if Columna.Longitud > 0 then
        begin
          TDBEdit (Columna.FControl).Tag := Columna.Longitud;
          if Columna.Precision = 0 then
          begin
            TDBEdit (Columna.FControl).MaxLength  := Columna.Longitud;
            TDBEdit (Columna.FControl).OnKeyPress := AppModelo.DBEditIntegerKeyPress;
          end
          else
            TDBEdit (Columna.FControl).MaxLength := Columna.Longitud + Columna.Precision + 1;
        end;
      end;
      vtdVarchar: begin
        if Columna.Columna.Definicion.MetodoCaptura = mcURL then
        begin
          Columna.FControl := TWebBrowser.Create (AppModelo);
          TWebBrowser (Columna.FControl).Navigate (Columna.Columna.Definicion.URL);
        end
        else
          case Columna.Columna.Definicion.TipoCapturaOpMultiple of
            tcomNinguno: begin
              if Columna.Columna.Definicion.Longitud <= 100 then
                Columna.FControl := TDBEdit.Create (AppModelo)
              else
              begin
                Columna.FControl                      := TDBMemo.Create (AppModelo);
                TDBMemo (Columna.FControl).ScrollBars := StdCtrls.ssBoth;
              end;
            end;
            tcomComboBox: begin
              Columna.FControl                     := TDBComboBox.Create (AppModelo);
              TDBComboBox (Columna.FControl).Style := csDropDownList;
            end;
            tcomRadioButton:   Columna.FControl := TDBRadioGroup.Create (AppModelo);
            tcomComboBoxCheck: Columna.FControl := TDBCheckList. Create (AppModelo);
          end;
      end;
    end;
  end;

  //Si no fue generado por ninguna condición anterior, se genera como DBEdit
  if not Assigned (Columna.Control) then
    Columna.FControl := TDBEdit.Create (AppModelo);

  if Assigned (AppModelo.Interframe) and (Columna.MetodoCaptura = mcCaptura) and (Columna.FuncionBusqueda <> '') and
     not Assigned (Columna.FBtnFindit) and (Columna.Control is TDBEdit) then
  begin
    Columna.FBtnFindit         := TBitBtnField.Create (AppModelo);
    Columna.FBtnFindit.Width   := 22;
    Columna.FBtnFindit.Height  := 20;
    Columna.FBtnFindit.Columna := Columna;
    Columna.FBtnFindit.OnClick := BtnFinditClick;
  end;
end;

procedure TAppModeloBloque.BtnFinditClick (Sender: TObject);
var
  Btn: TBitBtnField;
  Findit: TInterFindit;
  DevolverCampo: integer;
begin
  Btn := TBitBtnField (Sender);

  Findit := AppModelo.Interframe.CreaBuscador (Btn.Columna.FuncionBusqueda, 'F');
  try
    if Findit.Execute then
    begin
      DevolverCampo := 0;
      if Assigned (AppModelo.FOnDespuesFindit) then
        AppModelo.FOnDespuesFindit (AppModelo, Self, Btn.Columna, Findit, DevolverCampo);

      if not (Btn.Columna.Field.DataSet.State in [dsEdit, dsInsert]) then
        Btn.Columna.Field.DataSet.Edit;

      Btn.Columna.Field.AsString := Findit.DameCampo (DevolverCampo);
      TDBEdit (Btn.Columna.Control).SetFocus;
    end;
  finally
    Findit.Free;
  end;
end;

procedure TAppModeloBloque.HintsNavegador (Nav: TDBNavigator);
begin
  Nav.ShowHint := True;
  Nav.Hints.Clear;
  Nav.Hints.Add ('Primer registro');
  Nav.Hints.Add ('Registro anterior');
  Nav.Hints.Add ('Registro siguiente');
  Nav.Hints.Add ('Último registro');
  Nav.Hints.Add ('Nuevo');
  Nav.Hints.Add ('Borrar');
  Nav.Hints.Add ('Modificar');
  Nav.Hints.Add ('Aceptar');
  Nav.Hints.Add ('Cancelar');
  Nav.Hints.Add ('Actualizar información');
end;

procedure TAppModeloBloque.AntesBtnNav (Sender: TObject; Button: TNavigateBtn);
var
  Nav: TDBNavigator;
begin
  if not (Sender is TDBNavigator) then exit;

  Nav := TDBNavigator (Sender);
  if not Assigned (Nav.DataSource) or not Assigned (Nav.DataSource.DataSet) then exit;

  TClientDataSet (Nav.DataSource.DataSet).ReadOnly := False;
end;

procedure TAppModeloBloque.DespuesBtnNav (Sender: TObject; Button: TNavigateBtn);
var
  Nav: TDBNavigator;
begin
  if not (Sender is TDBNavigator) then exit;

  Nav := TDBNavigator (Sender);
  if not Assigned (Nav.DataSource) or not Assigned (Nav.DataSource.DataSet) then exit;

  TClientDataSet (Nav.DataSource.DataSet).ReadOnly := not (AppModelo.Estado in [emInsertado, emEditado]);
end;

procedure TAppModeloBloque.GeneraControles;
var
  i: integer;
begin
  for i := 0 to DefColumnas.Count - 1 do
    GeneraControlesColumna (DefColumnas [i]);

  if Bloque.EsGrupoRepeticion then
    FNavegador.Parent := Panel
  else
    FNavegador.Parent := nil;
end;

procedure TAppModeloBloque.ActualizaDataSet;
begin
  if Assigned (FBloque_Padre) then
  begin
    if Bloque.EsGrupoRepeticion then
    begin
      FAppDataSet := FLocalAppDataSet;
      AppDataSet.AgregarBloque (Self);
    end
    else
      FBloque_Padre.AppDataSet.AgregarBloque (Self);
  end
  else
    AppModelo.AppDataSet.AgregarBloque (Self);
end;

procedure TAppModeloBloque.AplicaEstatusControles;
var
  i: integer;
begin
  AplicaEstatusControl (FNavEdicion, not (AppModelo.Estado in [emInsertado, emEditado]));
  for i := 0 to DefColumnas.Count - 1 do
  begin
    AplicaEstatusControl (DefColumnas [i].Control,    not (DefColumnas [i].Columna.Definicion.MetodoCaptura in [mcCaptura]));
    AplicaEstatusControl (DefColumnas [i].FBtnFindit, not (DefColumnas [i].Columna.Definicion.MetodoCaptura in [mcCaptura]) or not (AppModelo.Estado in [emInsertado, emEditado]));
  end;
end;

procedure TAppModeloBloque.AplicaEstatusControl (Control: TControl; SoloLectura: boolean);
var
  DBEdit: TDBEdit;
  DBDate: TDBDateTimePicker;
  DBMemo: TDBMemo;
  DBRadioGroup: TDBRadioGroup;
  DBComboBox: TDBComboBox;
  DBCheckList: TDBCheckList;
begin
  if not Assigned (Control) then exit;

  if Control is TDBEdit then
  begin
    DBEdit          := TDBEdit (Control);
    DBEdit.ReadOnly := SoloLectura or (Assigned (DBEdit.DataSource) and Assigned (DBEdit.DataSource.DataSet) and TClientDataSet (DBEdit.DataSource.DataSet).ReadOnly);

    if DBEdit.ReadOnly then
      DBEdit.Color := clBtnFace
    else
      DBEdit.Color := clWindow;
  end
  else if Control is TDBDateTimePicker then
  begin
    DBDate         := TDBDateTimePicker (Control);
    DBDate.Enabled := not (SoloLectura or (Assigned (DBDate.DataSource) and Assigned (DBDate.DataSource.DataSet) and TClientDataSet (DBDate.DataSource.DataSet).ReadOnly));

    if not DBDate.Enabled then
      DBDate.Color := clBtnFace
    else
      DBDate.Color := clWindow;
  end
  else if Control is TDBMemo then
  begin
    DBMemo          := TDBMemo (Control);
    DBMemo.ReadOnly := SoloLectura or (Assigned (DBMemo.DataSource) and Assigned (DBMemo.DataSource.DataSet) and TClientDataSet (DBMemo.DataSource.DataSet).ReadOnly);

    if DBMemo.ReadOnly then
      DBMemo.Color := clBtnFace
    else
      DBMemo.Color := clWindow;
  end
  else if Control is TDBRadioGroup then
  begin
    DBRadioGroup          := TDBRadioGroup (Control);
    DBRadioGroup.ReadOnly := SoloLectura or (Assigned (DBRadioGroup.DataSource) and Assigned (DBRadioGroup.DataSource.DataSet) and TClientDataSet (DBRadioGroup.DataSource.DataSet).ReadOnly);
  end
  else if Control is TDBComboBox then
  begin
    DBComboBox          := TDBComboBox (Control);
    DBComboBox.ReadOnly := SoloLectura or (Assigned (DBComboBox.DataSource) and Assigned (DBComboBox.DataSource.DataSet) and TClientDataSet (DBComboBox.DataSource.DataSet).ReadOnly);

    if DBComboBox.ReadOnly then
      DBComboBox.Color := clBtnFace
    else
      DBComboBox.Color := clWindow;
  end
  else if Control is TDBCheckList then
  begin
    DBCheckList          := TDBCheckList (Control);
    DBCheckList.ReadOnly := SoloLectura or (Assigned (DBCheckList.DataSource) and Assigned (DBCheckList.DataSource.DataSet) and TClientDataSet (DBCheckList.DataSource.DataSet).ReadOnly);

    if DBCheckList.ReadOnly then
      DBCheckList.Color := clBtnFace
    else
      DBCheckList.Color := clWindow;
  end
  else if Control is TBitBtn then
    TBitBtn (Control).Enabled := not SoloLectura
  else if Control is TDBNavigator then
    TDBNavigator (Control).Enabled := not SoloLectura;
  Control.Refresh;
end;

function TAppModeloBloque.ObtenColumna (Nombre: string): TAppModeloDefColumna;
var
  i: integer;
  AppColumna: TAppModeloDefColumna;
begin
  result := nil;

  if not Assigned (AppDataSet) then exit;

  for i := 0 to DefColumnas.Count - 1 do
  begin
    AppColumna := DefColumnas [i];

    if Assigned (AppColumna.Columna) and Assigned (AppColumna.Columna.Definicion) and (AppColumna.Columna.Definicion.Nombre = Nombre) then
    begin
      result := AppColumna;
      exit;
    end;
  end;
end;

function TAppModeloBloque.ObtenCampo (Nombre: string): TField;
var
  ColSel: TAppModeloDefColumna;
begin
  result := nil;

  if not Assigned (AppDataSet) then exit;

  ColSel := ObtenColumna (Nombre);
  if Assigned (ColSel) then
    result := AppDataSet.Data.FindField (Format ('B%d.V%d', [Bloque.ID_Bloque, ColSel.Columna.Definicion.ID_Variable]));
end;

procedure TAppModeloBloque.MejorDistribucionDBRadioGroup (Columna: TColumna; Control: TDBRadioGroup; MaxWidth: integer);
var
  i, MaxW, CurrW, W, H, MaxCol, Rows: integer;
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  try
    Bmp.Width  := 100;
    Bmp.Height := 100;
    Bmp.Canvas.Font.Assign (Control.Font);
    H := Bmp.Canvas.TextHeight ('H');
    W := Bmp.Canvas.TextWidth  ('W');

    //Determina el ancho del item más largo
    MaxW := 0;
    for i := 0 to Control.Items.Count - 1 do
    begin
      CurrW := Bmp.Canvas.TextWidth (Control.Items [i]);
      if CurrW > MaxW then
        MaxW := CurrW;
    end;

    //Al item más largo le suma lo que sería del radio button y el espacio intermedio.
    MaxW := MaxW + 16 + W;

    //Determina cuantas columnas máximo puede utilizar
    MaxCol := (MaxWidth - W) div (MaxW + W);

    //Dependiendo del número de columnas establece el número de columnas para el control y las dimensiones
    if MaxCol = 0 then
    begin
      if (MaxW + (2 * W)) <= MaxWidth then
        Control.Width := MaxW + (2 * W)
      else
        Control.Width := MaxWidth;
      Control.Columns := 1;
      Control.Height  := Round ((Control.Items.Count + 1) * H * 1.5);
    end
    else
    begin
      Rows          := Ceil (Control.Items.Count / MaxCol);
      if Control.Items.Count < MaxCol then
        MaxCol := Control.Items.Count;

      if ((MaxW * MaxCol) + (2 * W)) <= MaxWidth then
        Control.Width := (MaxW * MaxCol) + (2 * W)
      else
        Control.Width := MaxWidth;
      Control.Height  := Round ((Rows + 1) * H * 1.5);
      Control.Columns := MaxCol;
    end;
  finally
    Bmp.Free;
  end;
end;

procedure TAppModeloBloque.MejorDistribucionDBEdit (Columna: TColumna; Control: TDBEdit; MaxWidth: integer);
var
  MaxW: integer;
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  try
    Bmp.Width  := 100;
    Bmp.Height := 100;
    Bmp.Canvas.Font.Assign (Control.Font);
    MaxW := Bmp.Canvas.TextWidth ('W') * Columna.Definicion.Longitud;

    if MaxW < 120 then
      Control.Width := 120
    else if MaxW > MaxWidth then
      Control.Width := MaxWidth
    else
      Control.Width := MaxW;
  finally
    Bmp.Free;
  end;
end;

procedure TAppModeloBloque.MejorDistribucionDBMemo (Columna: TColumna; Control: TDBMemo; MaxWidth: integer);
begin
  Control.Width := MaxWidth;
end;

procedure TAppModeloBloque.MejorDistribucionDBComboBox (Columna: TColumna; Control: TDBComboBox; MaxWidth: integer);
var
  i, MaxW, CurrW: integer;
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  try
    Bmp.Width  := 100;
    Bmp.Height := 100;
    Bmp.Canvas.Font.Assign (Control.Font);

    //Determina el ancho del item más largo
    MaxW := 0;
    for i := 0 to Control.Items.Count - 1 do
    begin
      CurrW := Bmp.Canvas.TextWidth (Control.Items [i]);
      if CurrW > MaxW then
        MaxW := CurrW;
    end;

    MaxW := MaxW + Bmp.Canvas.TextWidth ('H') * 2;

    if MaxW < 120 then
      Control.Width := 120
    else if MaxW > MaxWidth then
      Control.Width := MaxWidth
    else
      Control.Width := MaxW;
  finally
    Bmp.Free;
  end;
end;

procedure TAppModeloBloque.MejorDistribucionDBCheckList (Columna: TColumna; Control: TDBCheckList; MaxWidth: integer);
var
  i, MaxW, CurrW: integer;
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  try
    Bmp.Width  := 100;
    Bmp.Height := 100;
    Bmp.Canvas.Font.Assign (Control.Font);

    //Determina el ancho del item más largo
    MaxW := 0;
    for i := 0 to Control.Items.Count - 1 do
    begin
      CurrW := Bmp.Canvas.TextWidth (Control.Items [i]);
      if CurrW > MaxW then
        MaxW := CurrW;
    end;

    MaxW := MaxW + Bmp.Canvas.TextWidth ('H') * 4;

    if MaxW < 120 then
      Control.Width := 120
    else if MaxW > MaxWidth then
      Control.Width := MaxWidth
    else
      Control.Width := MaxW;
  finally
    Bmp.Free;
  end;
end;

procedure TAppModeloBloque.MejorDistribucionWebBrowser (Columna: TColumna; Control: TWebBrowser; MaxWidth: integer);
begin
  Control.Width := MaxWidth;
end;

procedure TAppModeloBloque.ReordenaControles;
var
  i, PrevTop, PrevHeight: integer;
  Hijo: TBloque;
  Columna: TColumna;
  Orden: integer;
  DBRadio: TDBRadioGroup;
  DBCombo: TDBComboBox;
  DBCheckList: TDBCheckList;
  DBMemo: TDBMemo;
  DBEdit: TDBEdit;
  Browser: TWebBrowser;
  ControlesVisibles: boolean;
begin
  if not Assigned (Panel) then exit;
  Panel.ShowHint := True;
  Panel.Hint     := Bloque.Descripcion;

  if not Bloque.BloqueVisible then
  begin
    Panel.Visible := False;
    exit;
  end;

  ControlesVisibles := False;
  Panel.Visible     := True;
  Panel.Left        := MargenIzquierdoPanel;
  if Panel.Parent = AppModelo then
    Panel.Width := AppModelo.ClientWidth -(MargenIzquierdoPanel + MargenDerechoPanel)
  else
    Panel.Width := (Panel.Parent as TGroupBox).ClientWidth - (MargenIzquierdoPanel + MargenDerechoPanel);

  if Bloque.Descripcion = '' then
    Panel.Caption := ''
  else
    Panel.Caption := ' ' + Bloque.Descripcion + ' ';

  PrevTop    := 0;
  PrevHeight := 0;
  Orden      := 0;

  for i := 0 to Bloque.Columnas.Count - 1 do
  begin
    Columna := Bloque.Columnas [i];
    if not Assigned (Columna.AppDefColumna) then break;

    with Columna.AppDefColumna do
      if not Columna.EsVisible or (Columna.Situacion = scInactivo) then
      begin
        Etiqueta.Parent := nil;
        Control.Parent  := nil;

        if Assigned (FBtnFindit) then
          FBtnFindit.Parent := nil;
      end
      else
      begin
        ControlesVisibles := True;
        Etiqueta.Parent   := Panel;
        Etiqueta.Left     := MargenIzquierdoPanel;
        Etiqueta.Top      := PrevTop + PrevHeight + MargenSuperiorPanel;
        PrevTop           := Etiqueta.Top;
        PrevHeight        := Etiqueta.Height;

        Control.Parent  := Panel;
        if (Columna.FuncionBusqueda <> '') and Assigned (FBtnFindit) then
        begin
          FBtnFindit.Parent := Panel;
          FBtnFindit.Left   := MargenIzquierdoPanel;
          FBtnFindit.Top    := PrevTop + PrevHeight + MargenInferiorPanel;
          Control.Left      := FBtnFindit.Left + FBtnFindit.Width + MargenIzquierdoPanel;

          if AppModelo.BmpFindit.Empty then
            FBtnFindit.Glyph.FreeImage
          else
          begin
            if (AppModelo.BmpFindit.Width div 2) = AppModelo.BmpFindit.Height then
              FBtnFindit.NumGlyphs := 2
            else
              FBtnFindit.NumGlyphs := 1;

            FBtnFindit.Glyph.Assign (AppModelo.BmpFindit);
          end;
        end
        else
          Control.Left := MargenIzquierdoPanel;

        Control.Top := PrevTop + PrevHeight + MargenInferiorPanel;
        PrevTop     := Control.Top;
        PrevHeight  := Control.Height;

        if (Control is TDBRadioGroup) then
        begin
          DBRadio := TDBRadioGroup (Control);
          if DBRadio.Items.Count = 0 then
            ExtraeItemsValores (Columna.Definicion.ListaFijaOpciones, DBRadio.Items, DBRadio.Values);
          MejorDistribucionDBRadioGroup (Columna, DBRadio, Panel.ClientWidth - (DBRadio.Left + MargenDerechoPanel));
        end
        else if (Control is TDBCheckList) then
        begin
          DBCheckList := TDBCheckList (Control);
          if DBCheckList.Items.Count = 0 then
            ExtraeItemsValores (Columna.Definicion.ListaFijaOpciones, DBCheckList.Items, DBCheckList.Values);
          MejorDistribucionDBCheckList (Columna, DBCheckList, Panel.ClientWidth - (DBCheckList.Left + MargenDerechoPanel));
        end
        else if (Control is TDBComboBox) then
        begin
          DBCombo := TDBComboBox (Control);
          if DBCombo.Items.Count = 0 then
            ExtraeItems (Columna.Definicion.ListaFijaOpciones, DBCombo.Items);
          MejorDistribucionDBComboBox (Columna, DBCombo, Panel.ClientWidth - (DBCombo.Left + MargenDerechoPanel));
        end
        else if (Control is TDBMemo) then
        begin
          DBMemo := TDBMemo (Control);
          MejorDistribucionDBMemo (Columna, DBMemo, Panel.ClientWidth - (DBMemo.Left + MargenDerechoPanel));
        end
        else if (Control is TDBEdit) then
        begin
          DBEdit := TDBEdit (Control);
          MejorDistribucionDBEdit (Columna, DBEdit, Panel.ClientWidth - (DBEdit.Left + MargenDerechoPanel));
        end
        else if (Control is TWebBrowser) then
        begin
          Browser := TWebBrowser (Control);
          MejorDistribucionWebBrowser (Columna, Browser, Panel.ClientWidth - (Browser.Left + MargenDerechoPanel));
        end;


        if Control is TWinControl then
        begin
          TWinControl (Control).TabOrder := Orden;
          Etiqueta.FocusControl          := TWinControl (Control);
        end;

        Inc (Orden);
      end;
  end;

  for i := 0 to Bloque.Hijos.Count - 1 do
  begin
    Hijo := Bloque.Hijos [i];

    if Hijo.BloqueVisible then
    begin
      Hijo.AppBloque.ReordenaControles;
      Hijo.AppBloque.Panel.Top      := PrevTop + PrevHeight + MargenSuperiorPanel;
      Hijo.AppBloque.Panel.TabOrder := Orden;
      PrevTop                       := Hijo.AppBloque.Panel.Top;
      PrevHeight                    := Hijo.AppBloque.Panel.Height;
      Inc (Orden);
    end;
  end;

  if Bloque.EsGrupoRepeticion then
  begin
    if not ControlesVisibles then
      PrevTop := PrevTop + MargenSuperiorPanel;

    Navegador.Parent  := Panel;
    Navegador.Left    := MargenIzquierdoPanel;
    Navegador.Top     := PrevTop + PrevHeight + MargenInferiorPanel;
    PrevTop           := Navegador.Top;
    PrevHeight        := Navegador.Height;
    NavEdicion.Parent := Panel;
    NavEdicion.Left   := Navegador.Left + Navegador.Width + (MargenIzquierdoPanel * 2);
    NavEdicion.Top    := Navegador.Top;
  end
  else
  begin
    Navegador.Parent  := nil;
    NavEdicion.Parent := nil;
  end;

  if ((Bloque.Hijos.Count + Bloque.Columnas.Count) > 0) and (PrevHeight > 0)  then
    Panel.Height := PrevTop + PrevHeight + MargenInferiorPanel;
end;

procedure TAppModeloBloque.DespliegaBloques;
var
  i: integer;
  Hijo: TBloque;
begin
  for i := 0 to Bloque.Hijos.Count - 1 do
  begin
    Hijo := Bloque.Hijos [i];
    Hijo.AppBloque.Panel.Visible := Hijo.BloqueVisible;
  end;

  Panel.Visible := Bloque.BloqueVisible;
end;


procedure TAppModeloBloque.DestruyeControles;
begin
  FDefColumnas.Clear;
  FreeAndNil (FDefColumnas);

  if Assigned (FNavegador) then
    FreeAndNil (FNavegador);

  if Assigned (FNavEdicion) then
    FreeAndNil (FNavEdicion);

  if Assigned (FPanel) then
    FreeAndNil (FPanel);
end;


{TAppModeloBloques}
destructor TAppModeloBloques.Destroy;
begin
  Clear;

  FAppModelo := nil;
  FModelo    := nil;
  inherited Destroy;
end;

procedure TAppModeloBloques.Clear;
var
  Hijo, Siguiente: TAppModeloBloque;
begin
  AppModelo.FCargando := True;
  try
    Hijo := AppModelo.PrimerHijo;
    while Assigned (Hijo) do
    begin
      Siguiente := Hijo.HermanoSiguiente;
      AppModelo.EliminaBloque (Hijo);
      Hijo := Siguiente;
    end;
  finally
    AppModelo.FCargando := False;
  end;
end;


function TAppModeloBloques.GetItem (Index: integer): TAppModeloBloque;
begin
  Result := TAppModeloBloque (inherited GetItem(Index));
end;

procedure TAppModeloBloques.SetItem (Index: integer; Value: TAppModeloBloque);
begin
  inherited SetItem(Index, Value);
end;

{TAppModeloDataSetColumna}
constructor TAppModeloDataSetColumna.Create (Collection: TCollection);
begin
  inherited Create (Collection);

  FColumnas   := TAppModeloDataSetColumnas (Collection);
  FAppDataSet := Columnas.AppDataSet;
  FAppModelo  := Columnas.AppModelo;
  FModelo     := Columnas.Modelo;
  FDefColumna := nil;
end;

destructor TAppModeloDataSetColumna.Destroy;
begin
  if Assigned (FDefColumna) then
  begin
    FDefColumna.FDataSetColumna := nil;
    FDefColumna                 := nil;
  end;

  FModelo     := nil;
  FAppModelo  := nil;
  FAppDataSet := nil;
  FColumnas   := nil;

  inherited Destroy;
end;

{TAppModeloDataSetColumnas}
destructor TAppModeloDataSetColumnas.Destroy;
begin
  FAppDataSet := nil;
  FAppModelo  := nil;
  FModelo     := nil;

  inherited Destroy;
end;

procedure TAppModeloDataSetColumnas.Inicializa (DataSet: TAppModeloDataSet);
begin
  FAppDataSet := DataSet;
  FAppModelo  := DataSet.AppModelo;
  FModelo     := DataSet.AppModelo.Modelo;
end;

function TAppModeloDataSetColumnas.GetItem (Index: integer): TAppModeloDataSetColumna;
begin
  Result := TAppModeloDataSetColumna (inherited GetItem(Index));
end;

procedure TAppModeloDataSetColumnas.SetItem (Index: integer; Value: TAppModeloDataSetColumna);
begin
  inherited SetItem(Index, Value);
end;

{TAppModeloDataSetBloque}
constructor TAppModeloDataSetBloque.Create (Collection: TCollection);
begin
  inherited Create (Collection);

  FDataSet := TAppModeloDataSet (Collection);
  FBloque  := nil;
end;

destructor TAppModeloDataSetBloque.Destroy;
begin
  if Assigned (Bloque) then
    Bloque.FDataSetBloque := nil;

  FBloque  := nil;
  FDataSet := nil;

  inherited Destroy;
end;

{TAppModeloDataSet}
destructor TAppModeloDataSet.Destroy;
begin
  Clear;
  FreeAndNil (FBloques);
  FreeAndNil (FColumnas);
  FreeAndNil (FDataSource);
  if Assigned (FData) then
    FreeAndNil (FData);

  FAppModelo := nil;
  FAppBloque := nil;

  inherited Destroy;
end;

procedure TAppModeloDataSet.Cambio;
begin
  AppModelo.Cambio;
end;

procedure TAppModeloDataSet.RegeneraIndice;
var
  Idx: TIndexDef;
begin
  Data.IndexDefs.Clear;
  if FIndexFields = '' then
    Data.IndexName := ''
  else
  begin
    Idx             := Data.IndexDefs.AddIndexDef;
    Idx.Fields      := FIndexFields;
    Idx.Options     := [ixPrimary, ixUnique];
    Idx.Name        := 'Primary_Key';
    Idx.DisplayName := 'Primary_Key';
    Data.IndexName  := 'Primary_Key';
  end;
end;

procedure TAppModeloDataSet.Clear;
begin
  FData.DisableControls;
  FreeAndNil (FData);
  FColumnas.Clear;

  while Count > 0 do
    Delete (0);

  FIndexFields        := '';
  FData               := NuevoData;
  FDataSource.DataSet := FData;
  FBloques.Clear;
end;

function TAppModeloDataSet.ObtenBloque (Nombre: string): TAppModeloBloque;
var
  Bloque: TAppModeloBloque;
  BloqueDS: TAppModeloDataSetBloque;
begin
  Bloque   := AppModelo.ObtenBloque (Nombre);
  BloqueDS := ObtenDataSetBloque (Bloque);

  if Assigned (BloqueDS) then
    result := Bloque
  else
    result := nil;
end;


procedure TAppModeloDataSet.Inicializa (Modelo: TAppModelo);
begin
  FAppModelo          := Modelo;
  FData               := NuevoData;
  FDataSource         := TDataSource.Create (Modelo);
  FDataSource.DataSet := FData;
  FBloques            := TList.Create;
  FColumnas           := TAppModeloDataSetColumnas.Create (TAppModeloDataSetColumna);
  FColumnas.Inicializa (Self);
  FActual             := nil;
  UltimoControl       := nil;
  FIndexFields        := '';
  FAppBloque          := nil;
end;

function TAppModeloDataSet.NuevoData: TClientDataSet;
begin
  result             := TClientDataSet.Create (AppModelo);
  result.BeforePost  := ValidateBeforePost;
  result.AfterOpen   := AfterOpen;
  result.AfterClose  := AfterClose;
  result.OnPostError := ValidaIndice;
  result.AfterInsert := AfterInsert;
end;

function TAppModeloDataSet.GetItem (Index: integer): TAppModeloDataSetBloque;
begin
  Result := TAppModeloDataSetBloque (inherited GetItem(Index));
end;

procedure TAppModeloDataSet.SetItem (Index: integer; Value: TAppModeloDataSetBloque);
begin
  inherited SetItem(Index, Value);
end;

procedure TAppModeloDataSet.ValidateBeforePost(DataSet: TDataSet);
var
  i: integer;
  Field: TField;
  Bloque: TAppModeloBloque;
  Variable: TVariable;
  Columna: TAppModeloDefColumna;
  InfoValida: boolean;
  MsgError: string;
begin
  UltimoControl := nil;

  //If not validate then Abort
  if AppModelo.Cargando then exit;

  for i := 0 to Data.Fields.Count - 1 do
  begin
    Field := Data.Fields [i];

    //Obtiene la columna
    AppModelo.ObtenBloqueVariableColumna (Field.FieldName, Bloque, Variable, Columna);

    if not Assigned (Bloque) or not Assigned (Variable) or not Assigned (Columna) then break;

    //Verifica que si es obligatorio tenga dato
    if Columna.Columna.EsObligatorio and (Field.AsString = '') then
    begin
      UltimoControl := Columna.Control;
      try
        AppModelo.FocusToControl (UltimoControl);
      except
      end;
      raise ECampoObligatorio.CreateFmt ('La columna [%s] es obligatoria.', [Variable.Descripcion]);
    end;

    //Verifica que si tiene alguna validación, la cumpla
    if Assigned (AppModelo.FOnValidacion) then
    begin
      InfoValida := True;
      MsgError   := '';

      AppModelo.FOnValidacion (AppModelo, Bloque, Columna, InfoValida, MsgError);
      if not InfoValida then
      begin
        UltimoControl := Columna.Control;
        try
          AppModelo.FocusToControl (UltimoControl);
        except
        end;
        raise EValidacionUsuario.CreateFmt ('La columna [%s] no cumple la validación: %s.', [Variable.Descripcion, MsgError]);
      end;
    end;
  end;
end;

procedure TAppModeloDataSet.AfterOpen (DataSet: TDataSet);
var
  i: integer;
  Bloque: TAppModeloBloque;
  Columna: TAppModeloDefColumna;
  Variable: TVariable;
  Field: TField;
begin
  for i := 0 to Data.FieldDefs.Count - 1 do
  begin
    Field          := Data.FieldByName (Data.FieldDefs [i].Name);
    Field.OnChange := FieldChange;
    AppModelo.ObtenBloqueVariableColumna (Data.FieldDefs [i].Name,  Bloque, Variable, Columna);

    if Assigned (Columna) then
      Columna.FField := Field;
  end;
end;

procedure TAppModeloDataSet.AfterClose (DataSet: TDataSet);
var
  b, c: integer;
  Bloque: TAppModeloBloque;
begin
  for b := 0 to FBloques.Count - 1 do
  begin
    Bloque := TAppModeloBloque (FBloques [b]);

    for c := 0 to Bloque.DefColumnas.Count - 1 do
      Bloque.DefColumnas [c].FField := nil;
  end;
end;

procedure TAppModeloDataSet.FieldChange (Sender: TField);
begin
  if not AppModelo.Cargando and (AppModelo.Estado in [emInsertado, emEditado]) and Assigned (AppModelo.FOnCalcularCampos) then
    AppModelo.FOnCalcularCampos (AppModelo, Self);
end;

procedure TAppModeloDataSet.BCDFieldValidate (Sender: TField);
begin
end;

procedure TAppModeloDataSet.ValidaIndice (DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if (E.ClassName = 'EDBClient') and (Pos ('Key violation', E.Message) > 0) then
  begin
    Action := daAbort;

    if Assigned (FAppBloque) then
      MessageDlg (Format ('Se ha violado la llave del bloque [%s], favor de verificar los datos.', [FAppBloque.Nombre]), mtError, [mbOk], 0)
    else
      MessageDlg ('Se ha violado la llave, favor de verificar los datos.', mtError, [mbOk], 0);
  end;
end;

procedure TAppModeloDataSet.AfterInsert (DataSet: TDataSet);
begin
  GeneraValoresDefault;
end;

procedure TAppModeloDataSet.GeneraValoresDefault;
var
  i: integer;
  Columna: TAppModeloDataSetColumna;
begin
  if AppModelo.Cargando or not (AppModelo.Estado in [emInsertado, emEditado]) then exit;

  for i := 0 to FColumnas.Count - 1 do
  begin
    Columna := FColumnas [i];

    if Columna.DefColumna.ValorDefault <> '' then
      Columna.DefColumna.AsString := Columna.DefColumna.ValorDefault;
  end;
end;

function TAppModeloDataSet.AgregarBloque (Bloque: TAppModeloBloque): TAppModeloDataSetBloque;
begin
  result                := TAppModeloDataSetBloque (Add);
  result.FBloque        := Bloque;
  Bloque.FDataSetBloque := result;
  Bloque.FAppDataSet    := Self;
end;

procedure TAppModeloDataSet.GeneraColumnaString (Columna: TColumna);
var
  FieldDef: TFieldDef;
  S: TStringField;
begin
  FieldDef                       := Data.FieldDefs.AddFieldDef;
  Columna.AppDefColumna.FieldDef := FieldDef;
  FieldDef.Name                  := Columna.NombreCampoFisico;
  FieldDef.Required              := False;
  FieldDef.DataType              := ftString;
  FieldDef.Size                  := Columna.Definicion.Longitud;

  S                              := TStringField.Create (Data);
  S.FieldName                    := Columna.NombreCampoFisico;
  S.DataSet                      := Data;
  S.Size                         := Columna.Definicion.Longitud;
end;

procedure TAppModeloDataSet.GeneraColumnaDate (Columna: TColumna);
var
  FieldDef: TFieldDef;
  D: TDateField;
begin
  FieldDef                       := Data.FieldDefs.AddFieldDef;
  Columna.AppDefColumna.FieldDef := FieldDef;
  FieldDef.Name                  := Columna.NombreCampoFisico;
  FieldDef.Required              := False;
  FieldDef.DataType              := ftDate;

  D                              := TDateField.Create (Data);
  D.FieldName                    := Columna.NombreCampoFisico;
  D.DataSet                      := Data;
end;

procedure TAppModeloDataSet.GeneraColumnaDateTime (Columna: TColumna);
var
  FieldDef: TFieldDef;
  D: TDateTimeField;
begin
  FieldDef                       := Data.FieldDefs.AddFieldDef;
  Columna.AppDefColumna.FieldDef := FieldDef;
  FieldDef.Name                  := Columna.NombreCampoFisico;
  FieldDef.Required              := False;
  FieldDef.DataType              := ftDateTime;

  D                              := TDateTimeField.Create (Data);
  D.FieldName                    := Columna.NombreCampoFisico;
  D.DataSet                      := Data;
end;

procedure TAppModeloDataSet.GeneraColumnaNumber (Columna: TColumna);
var
  FieldDef: TFieldDef;
  BCD: TBCDField;
begin
  FieldDef                       := Data.FieldDefs.AddFieldDef;
  Columna.AppDefColumna.FieldDef := FieldDef;
  FieldDef.Name                  := Columna.NombreCampoFisico;
  FieldDef.Required              := False;
  FieldDef.DataType              := ftBCD;

  BCD                            := TBCDField.Create (Data);
  BCD.FieldName                  := Columna.NombreCampoFisico;
  BCD.DataSet                    := Data;
  BCD.DisplayFormat              := Columna.Definicion.Formato;
  BCD.EditFormat                 := Columna.Definicion.Formato;
  BCD.OnGetText                  := BCDGetText;

  if Columna.Definicion.Longitud > 0 then
    BCD.Precision := Columna.Definicion.Precision;
end;

procedure TAppModeloDataSet.BCDGetText (Sender: TField; var Text: String; DisplayText: Boolean);
var
  Control: TControl;
  S: string;
  P: integer;
begin
  Control := GetFieldControl (Sender);

  if Assigned (Control) and TDBEdit (Control).Focused then
  begin
    S := Sender.AsString;
    P := Pos (DecimalSeparator, S);

    if (P > 0) and ((Sender as TBCDField).Precision > 0) and ((Length (S) - P) > (Sender as TBCDField).Precision) then
      S := Copy (S, 1, P + (Sender as TBCDField).Precision);

    Text := S;
  end
  else if not Sender.IsNull then
    Text := FormatFloat (TBCDField(Sender).DisplayFormat, Sender.AsFloat);
end;

function TAppModeloDataSet.GetFieldControl (Field: TField): TControl;
var
  Bloque: TAppModeloBloque;
  Variable: TVariable;
  Columna: TAppModeloDefColumna;
begin
  result := nil;

  AppModelo.ObtenBloqueVariableColumna (Field.FieldName, Bloque, Variable, Columna);
  if Assigned (Columna) then
    result := Columna.Control;
end;

function TAppModeloDataSet.AgregarColumna (Columna: TColumna): TAppModeloDataSetColumna;
begin
  result := nil;
  if not Assigned (Columna) or not Assigned (Columna.Definicion) or not Assigned (Columna.AppDefColumna) then exit;

  result                                := TAppModeloDataSetColumna (Columnas.Add);
  result.FDefColumna                    := Columna.AppDefColumna;
  Columna.AppDefColumna.FDataSetColumna := result;
  case Columna.Definicion.TipoDato of
    vtdVarchar:  GeneraColumnaString   (Columna);
    vtdDate:     GeneraColumnaDate     (Columna);
    vtdDateTime: GeneraColumnaDateTime (Columna);
    vtdNumber:   GeneraColumnaNumber   (Columna);
  end;

  if Columna.EsCampoLlave then
  begin
    FIndexFields := FIndexFields + ';' + Columna.NombreCampoFisico;

    if FIndexFields [1] = ';' then
      System.Delete (FIndexFields, 1, 1);
  end;
end;


function TAppModeloDataSet.ObtenDataSetBloque (Bloque: TAppModeloBloque): TAppModeloDataSetBloque;
var
  i: integer;
  DataSetBloque: TAppModeloDataSetBloque;
begin
  result := nil;

  for i := 0 to Count - 1 do
  begin
    DataSetBloque := TAppModeloDataSetBloque (Items [i]);
    if DataSetBloque.Bloque = Bloque then
    begin
      result := DataSetBloque;
      exit;
    end;
  end;
end;

function TAppModeloDataSet.PuedeSalvar: boolean;
begin
  result := True;
end;

function TAppModeloDataSet.PuedeAceptar: boolean;
begin
  result := True;
end;


function TAppModeloDataSet.EsVacio: boolean;
var
  i: integer;
begin
  result := True;

  if not Data.Active or (Data.RecordCount = 0) then exit;

  for i := 0 to Data.Fields.Count - 1 do
    if Data.Fields [i].AsString <> '' then
    begin
      result := False;
      exit;
    end;
end;

{TAppModelo}
constructor TAppModelo.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);

  FIDPersona                  := 0;
  FPeriodo                    := Trunc (Now);
  FIDPersonaPrev              := 0;
  FPeriodoPrev                := Trunc (Now);
  FFechaEmpresa               := Trunc (Now);
  FCve_Usuario                := '';
  FModelo                     := nil;
  FBloques                    := TAppModeloBloques.Create (TAppModeloBloque);
  FBloques.FAppModelo         := Self;
  FBloques.FModelo            := nil;
  FCargando                   := False;
  FAppDataSet                 := TAppModeloDataSet.Create (TAppModeloDataSetBloque);
  FAppDataSet.Inicializa (Self);
  FDummy                      := TPanel.Create (Self);
  FDummy.Caption              := '';
  FDummy.BevelOuter           := bvNone;
  FDummy.Height               := 20;
  FDummy.Parent               := Self;
  FGrid                       := TDBGrid.Create (Self);
  FGrid.DataSource            := AppDataSet.DataSource;
  FNavegador                  := TDBNavigator.Create (Self);
  FNavegador.DataSource       := AppDataSet.DataSource;
  FInterforma                 := nil;
  FInterframe                 := nil;
  FDataSets                   := TList.Create;
  FPuedeNuevo                 := True;
  FPuedeConsultar             := True;
  FPuedeModificar             := True;
  FPuedeDesactivar            := True;
  FDataBase                   := nil;
  FEstado                     := emVacio;
  FEstadoPrev                 := emVacio;
  FBmpFindit                  := TBitmap.Create;
  FBtnNuevo                   := nil;
  FBtnModificar               := nil;
  FBtnCambiarEstado           := nil;
  FBtnAceptar                 := nil;
  FBtnCancelar                := nil;
  FBtnBuscar                  := nil;
  FInterformaBtnNuevo         := nil;
  FInterformaBtnModificar     := nil;
  FInterformaBtnCambiarEstado := nil;
  FInterformaBtnAceptar       := nil;
  FInterformaBtnCancelar      := nil;
  FOnActualizaBotones         := nil;
  FOnDespuesCambio            := nil;
  FOnAntesNuevo               := nil;
  FOnAntesModificar           := nil;
  FOnAntesCambiarEstado       := nil;
  FOnAntesAceptar             := nil;
  FOnAntesCancelar            := nil;
  FOnAntesConsultar           := nil;
  FOnDespuesNuevo             := nil;
  FOnDespuesModificar         := nil;
  FOnDespuesCambiarEstado     := nil;
  FOnDespuesAceptar           := nil;
  FOnDespuesCancelar          := nil;
  FOnDespuesConsultar         := nil;
  FOnDespuesFindit            := nil;
  FOnBtnAceptar               := nil;
  FOnBtnBuscar                := nil;
  FOnValidacion               := nil;
end;

destructor TAppModelo.Destroy;
begin
  if Assigned (FBtnNuevo)     then FBtnNuevo    .OnClick := nil;
  if Assigned (FBtnModificar) then FBtnModificar.OnClick := nil;
  if Assigned (FBtnCancelar)  then FBtnCancelar .OnClick := nil;
  DestruyeBotonesInterforma;

  FBtnNuevo         := nil;
  FBtnModificar     := nil;
  FBtnCambiarEstado := nil;
  FBtnAceptar       := nil;
  FBtnCancelar      := nil;
  FBtnBuscar        := nil;
  FInterframe       := nil;
  FInterforma       := nil;
  FDataBase         := nil;
  FreeAndNil (FBmpFindit);
  FreeAndNil (FDummy);
  FreeAndNil (FDataSets);
  FreeAndNil (FGrid);
  FreeAndNil (FNavegador);
  DesasignaModelo;
  FAppDataSet.Clear;
  FreeAndNil (FBloques);
  FreeAndNil (FAppDataSet);

  inherited Destroy;
end;

procedure TAppModelo.Cambio;
begin
  if not FCargando then
  begin
    FCambiado := True;
    ActualizaBotones;

    if Assigned (FOnDespuesCambio) then
      FOnDespuesCambio (Self);
  end;
end;

procedure TAppModelo.ActualizaBotones;
begin
  BotonesActivos := DeterminaBotonesActivos;
  ReposicionaBotonesInterformas;
end;

procedure TAppModelo.SetModelo (Value: TModelo);
begin
  if FModelo <> Value then
  begin
    if Assigned (FModelo) then
      DesasignaModelo;

    FModelo := Value;
    if Assigned (FModelo) then
      AsignaModelo;
  end;
end;

procedure TAppModelo.SetInterforma (Value: TInterforma);
begin
  if FInterforma <> Value then
  begin
    if Assigned (Interforma) then
      DestruyeBotonesInterforma;

    FInterforma := Value;
    if Assigned (Interforma) then
      CreaBotonesInterforma;

    if Assigned (FInterforma) and Assigned (FInterforma.Funcion) then
    begin
      FPuedeNuevo      := FInterforma.Funcion.Nuevo;
      FPuedeModificar  := FInterforma.Funcion.Modificar;
      FPuedeConsultar  := FInterforma.Funcion.Consultar;
      FPuedeDesactivar := FInterforma.Funcion.Eliminar;
      FInterframe      := TInterframe (FInterforma.Interframe);

      AjustaDatabaseInteforma;
      if Assigned (FInterforma.Funcion.Apli) then
      begin
        FCve_Usuario  := FInterforma.Funcion.Apli.Usuario;
        FDataBase     := FInterforma.Funcion.Apli.DataBase;
        FFechaEmpresa := FInterforma.Funcion.Apli.DameFechaEmpresa;
      end;
    end;
  end;
end;

procedure TAppModelo.SetBotonesActivos (Value: TBotonesAppModelo);
begin
  if FBotonesActivos <> Value then
  begin
    FBotonesActivos := Value;
    LanzaEventoBotonesActivos;
  end;
end;

procedure TAppModelo.SetBmpFindit (Value: TBitmap);
begin
  if not FBmpFindit.Empty then FBmpFindit.FreeImage;

  if Assigned (Value) and not Value.Empty then
    FBmpFindit.Assign (Value);
end;

procedure TAppModelo.LanzaEventoBotonesActivos;
begin
  if Assigned (BtnNuevo)          then BtnNuevo         .Enabled := bamNuevo     in BotonesActivos;
  if Assigned (BtnModificar)      then BtnModificar     .Enabled := bamModificar in BotonesActivos;
  if Assigned (FBtnCambiarEstado) then FBtnCambiarEstado.Enabled := bamActivar   in BotonesActivos;
  if Assigned (BtnAceptar)        then BtnAceptar       .Enabled := bamAceptar   in BotonesActivos;
  if Assigned (BtnCancelar)       then BtnCancelar      .Enabled := bamCancelar  in BotonesActivos;
  if Assigned (BtnBuscar)         then BtnBuscar        .Enabled := bamConsultar in BotonesActivos;

  if Assigned (FInterformaBtnNuevo)         then FInterformaBtnNuevo        .Enabled := bamNuevo     in BotonesActivos;
  if Assigned (FInterformaBtnModificar)     then FInterformaBtnModificar    .Enabled := bamModificar in BotonesActivos;
  if Assigned (FInterformaBtnCambiarEstado) then FInterformaBtnCambiarEstado.Enabled := bamActivar   in BotonesActivos;
  if Assigned (FInterformaBtnAceptar)       then FInterformaBtnAceptar      .Enabled := bamAceptar   in BotonesActivos;
  if Assigned (FInterformaBtnCancelar)      then FInterformaBtnCancelar     .Enabled := bamCancelar  in BotonesActivos;
  if Assigned (FInterformaBtnBuscar)        then FInterformaBtnBuscar       .Enabled := bamConsultar in BotonesActivos;

  if Assigned (FOnActualizaBotones) then
    FOnActualizaBotones (Self, FBotonesActivos);
end;

procedure TAppModelo.SetEstado (Value: TEstadoModelo);
begin
  if FEstado <> Value then
  begin
    FEstadoPrev := FEstado;
    FEstado     := Value;

    if Estado = emInsertado then
    begin
      FIDPersona := 0;
      FPeriodo   := Trunc (Now);
    end;

    AplicaEstatus;
  end;
end;

procedure TAppModelo.SetIDPersona (Value: integer);
begin
  if (Estado = emInsertado) and (FIDPersona <> Value) then
    FIDPersona := Value;
end;

procedure TAppModelo.SetPeriodo (Value: TDate);
begin
  Value := Trunc (Value);
  if (Estado = emInsertado) and (FPeriodo <> Value) then
    FPeriodo := Value;
end;

procedure TAppModelo.SetBtnNuevo (Value: TButton);
begin
  if FBtnNuevo <> Value then
  begin
    if Assigned (FBtnNuevo) then
      FBtnNuevo.OnClick := nil;

    FBtnNuevo         := Value;
    FBtnNuevo.OnClick := BtnNuevoClick;
  end;
end;

procedure TAppModelo.SetBtnModificar (Value: TButton);
begin
  if FBtnModificar <> Value then
  begin
    if Assigned (FBtnModificar) then
      FBtnModificar.OnClick := nil;

    FBtnModificar         := Value;
    FBtnModificar.OnClick := BtnModificarClick;
  end;
end;

procedure TAppModelo.SetBtnCancelar (Value: TButton);
begin
  if FBtnCancelar <> Value then
  begin
    if Assigned (FBtnCancelar) then
      FBtnCancelar.OnClick := nil;

    FBtnCancelar         := Value;
    FBtnCancelar.OnClick := BtnCancelarClick;
  end;
end;

procedure TAppModelo.SetDatabase (Value: TDatabase);
begin
  if not Assigned (FInterforma) and (FDatabase <> Value) then
    FDatabase := Value;
end;

procedure TAppModelo.SetCve_Usuario (Value: string);
begin
  if not Assigned (FInterforma) and (FCve_Usuario <> Value) then
    FCve_Usuario := Value;
end;

procedure TAppModelo.SetInterframe (Value: TInterframe);
begin
  if not Assigned (FInterforma) and (FInterframe <> Value) then
    FInterframe := Value;
end;


procedure TAppModelo.SetPuedeNuevo (Value: boolean);
begin
  if not Assigned (FInterforma) and (FPuedeNuevo <> Value) then
    FPuedeNuevo := Value;
end;

procedure TAppModelo.SetPuedeModificar (Value: boolean);
begin
  if not Assigned (FInterforma) and (FPuedeModificar <> Value) then
    FPuedeModificar := Value;
end;

procedure TAppModelo.SetPuedeConsultar (Value: boolean);
begin
  if not Assigned (FInterforma) and (FPuedeConsultar <> Value) then
    FPuedeConsultar := Value;
end;

procedure TAppModelo.SetPuedeDesactivar (Value: boolean);
begin
  if not Assigned (FInterforma) and (FPuedeDesactivar <> Value) then
    FPuedeDesactivar := Value;
end;

procedure TAppModelo.SetFechaEmpresa (Value: TDate);
begin
  Value := Trunc (Value);
  if not Assigned (FInterforma) and (FFechaEmpresa <> Value) then
    FFechaEmpresa := Value;
end;


function TAppModelo.GetDatabase: TDatabase;
begin
  if Assigned (FInterforma) then
  begin
    if Assigned (FInterforma.Funcion) and Assigned (FInterforma.Funcion.Apli) then
      result := FInterforma.Funcion.Apli.Database
    else
      result := nil;
  end
  else
    result := FDatabase;
end;

function TAppModelo.GetCve_Usuario: string;
begin
  if Assigned (FInterforma) then
  begin
    if Assigned (FInterforma.Funcion) and Assigned (FInterforma.Funcion.Apli) then
      result := FInterforma.Funcion.Apli.Usuario
    else
      result := ''
  end
  else
    result := FCve_Usuario;
end;

function TAppModelo.GetInterframe: TInterframe;
begin
  if Assigned (FInterforma) and Assigned (FInterforma.Interframe) then
    result := TInterframe (FInterforma.Interframe)
  else
    result := FInterframe;
end;


function TAppModelo.GetPuedeNuevo: boolean;
begin
  if Assigned (FInterforma) and Assigned (FInterforma.Funcion) then
    result := FInterforma.Funcion.Nuevo
  else
    result := FPuedeNuevo;
end;

function TAppModelo.GetPuedeModificar: boolean;
begin
  if Assigned (FInterforma) and Assigned (FInterforma.Funcion) then
    result := FInterforma.Funcion.Modificar
  else
    result := FPuedeModificar;
end;

function TAppModelo.GetPuedeConsultar: boolean;
begin
  if Assigned (FInterforma) and Assigned (FInterforma.Funcion) then
    result := FInterforma.Funcion.Consultar
  else
    result := FPuedeConsultar;
end;

function TAppModelo.GetPuedeDesactivar: boolean;
begin
  if Assigned (FInterforma) and Assigned (FInterforma.Funcion) then
    result := FInterforma.Funcion.Eliminar
  else
    result := FPuedeDesactivar;
end;

function TAppModelo.GetFechaEmpresa: TDate;
begin
  if Assigned (FInterforma) then
  begin
    if Assigned (FInterforma.Funcion) and Assigned (FInterforma.Funcion.Apli) then
      result := FInterforma.Funcion.Apli.DameFechaEmpresa
    else
      result := FFechaEmpresa
  end
  else
    result := FFechaEmpresa;
end;

function TAppModelo.GetModeloNombre: string;
begin
  result := '';
  if Assigned (Modelo) then
    result := Modelo.Nombre;
end;

function TAppModelo.GetModeloID: integer;
begin
  result := 0;
  if Assigned (Modelo) then
    result := Modelo.ID_Modelo;
end;

function TAppModelo.GetModeloDescripcion: string;
begin
  result := '';
  if Assigned (Modelo) then
    result := Modelo.Descripcion;
end;

function TAppModelo.GetForm: TForm;
var
  Padre: TControl;
begin
  result := nil;
  Padre  := Parent;

  while Assigned (Padre) and not (Padre is TForm) do
    Padre := Padre.Parent;

  if Assigned (Padre) and (Padre is TForm) then
    result := TForm (Padre);
end;

procedure TAppModelo.DesasignaModelo;
begin
  if Assigned (FBloques) then
  begin
    FBloques.Clear;
    FBloques.FModelo := nil;
  end;

  if Assigned (FModelo) then
    FModelo.FAppModelo := nil;

  FModelo := nil;
end;

procedure TAppModelo.AsignaModelo;
begin
  FModelo.FAppModelo := Self;
  FBloques.FModelo   := Modelo;
  FEstado            := emVacio;
  RegeneraBloques;
  AplicaEstatus;
  LanzaEventoBotonesActivos;
end;

procedure TAppModelo.Notification(AComponent : TComponent; Operation : TOperation);
begin
  inherited Notification (AComponent, Operation);

  if Operation <> opRemove then exit;

  if (AComponent = FModelo) or (AComponent = Parent) then
  begin
    FModelo := nil;
    DesasignaModelo;
  end
  else if AComponent = FInterforma then
    FInterforma                 := nil
  else if AComponent = FInterframe then
    FInterframe                 := nil
  else if AComponent = FInterformaBtnNuevo then
    FInterformaBtnNuevo         := nil
  else if AComponent = FInterformaBtnModificar then
    FInterformaBtnModificar     := nil
  else if AComponent = FInterformaBtnCambiarEstado then
    FInterformaBtnCambiarEstado := nil
  else if AComponent = FInterformaBtnAceptar then
    FInterformaBtnAceptar       := nil
  else if AComponent = FInterformaBtnCancelar then
    FInterformaBtnCancelar      := nil
  else if AComponent = FInterformaBtnBuscar then
    FInterformaBtnBuscar        := nil
  else if AComponent = FDataBase then
    FDataBase                   := nil
  else if AComponent = FBtnNuevo then
    FBtnNuevo                   := nil
  else if AComponent = FBtnModificar then
    FBtnModificar               := nil
  else if AComponent = FBtnCambiarEstado then
    FBtnCambiarEstado           := nil
  else if AComponent = FBtnAceptar then
    FBtnAceptar                 := nil
  else if AComponent = FBtnCancelar then
    FBtnCancelar                := nil
  else if AComponent = FBtnBuscar then
    FBtnBuscar                  := nil
end;

function TAppModelo.AgregaBloque (Bloque: TBloque; Padre: TAppModeloBloque): TAppModeloBloque;
begin
  result               := TAppModeloBloque (Bloques.Add);
  result.FBloque       := Bloque;
  result.FBloque_Padre := Padre;
  Bloque.FAppBloque    := result;

  if Assigned (Padre) then
  begin
    result.Panel.Parent := Padre.Panel;
    result.Panel.Left   := MargenIzquierdoPanel;
    result.Panel.Width  := Width - (MargenIzquierdoPanel + MargenDerechoPanel);
  end
  else
  begin
    result.Panel.Parent := Self;
    result.Panel.Left   := 0;
    result.Panel.Width  := Width;//ClientWidth;
  end;

  result.ActualizaDataSet;
  result.GeneraColumnas;
  result.GeneraControles;
end;

procedure TAppModelo.RegeneraBloques;
  procedure PreOrder (Bloque: TBloque; Padre: TAppModeloBloque);
  var
    i: integer;
    AppBloque: TAppModeloBloque;
  begin
    AppBloque := AgregaBloque (Bloque, Padre);

    for i := 0 to Bloque.Hijos.Count - 1 do
      PreOrder (Bloque.Hijos [i], AppBloque);
  end;

var
  i: integer;
begin
  FBloques.Clear;
  if not Assigned (Modelo) then exit;

  FCargando := True;
  try
    for i := 0 to Modelo.Bloques.Count - 1 do
      PreOrder (Modelo.Bloques [i], nil);
  finally
    FCargando := False;
  end;

  RegeneraDataSets;
  ReordenaBloques;
end;

procedure TAppModelo.CierraYLimpiaDataSets;
var
  b, c: integer;
  Bloque: TAppModeloBloque;
begin
  FDataSets.Clear;
  AppDataSet.Clear;

  for b := 0 to Bloques.Count - 1 do
  begin
    Bloque := Bloques [b];
    Bloque.LocalAppDataSet.Clear;

    for c := 0 to Bloque.DefColumnas.Count - 1 do
    begin
      Bloque.DefColumnas [c].FieldDef := nil;
      AsignaDataSetControl (Bloque.DefColumnas [c].Control, nil, '', False, '');
    end;
  end;
end;

procedure TAppModelo.RecargaDataSets;
begin
end;

procedure TAppModelo.BtnNuevoClick (Sender: TObject);
begin
  Nuevo;
end;

procedure TAppModelo.BtnModificarClick (Sender: TObject);
begin
  Modificar;
end;

procedure TAppModelo.BtnCancelarClick (Sender: TObject);
begin
  Cancelar;
end;

procedure TAppModelo.BtnInterformaAceptar (Sender: TObject);
begin
  if Assigned (FOnBtnAceptar) then
    FOnBtnAceptar (Sender);
end;

procedure TAppModelo.BtnInterformaBuscar (Sender: TObject);
begin
  if Assigned (FOnBtnBuscar) then
    FOnBtnBuscar (Sender);
end;

procedure TAppModelo.AsignaDataSetControl (Control: TControl; DataSource: TDataSource; FieldName: string; ShowHint: boolean; Hint: string);
begin
  if      Control is TDBEdit then
  begin
    TDBEdit (Control).DataSource := DataSource;
    TDBEdit (Control).DataField  := FieldName;
  end
  else if Control is TDBDateTimePicker then
  begin
    TDBDateTimePicker (Control).DataSource := DataSource;
    TDBDateTimePicker (Control).DataField  := FieldName;
  end
  else if Control is TDBMemo then
  begin
    TDBMemo (Control).DataSource := DataSource;
    TDBMemo (Control).DataField  := FieldName;
  end
  else if Control is TDBRadioGroup then
  begin
    TDBRadioGroup (Control).DataSource := DataSource;
    TDBRadioGroup (Control).DataField  := FieldName;
  end
  else if Control is TDBComboBox then
  begin
    TDBComboBox (Control).DataSource := DataSource;
    TDBComboBox (Control).DataField  := FieldName;
  end
  else if Control is TDBCheckList then
  begin
    TDBCheckList (Control).DataSource := DataSource;
    TDBCheckList (Control).DataField  := FieldName;
  end;
end;


procedure TAppModelo.RegeneraDataSets;
var
  b, c, i: integer;
  Bloque: TAppModeloBloque;
  DefColumna: TAppModeloDefColumna;
  Columna: TColumna;
  DS: TAppModeloDataSet;
begin
  if Modelo.Cargando then exit;

  CierraYLimpiaDataSets;

  if not Assigned (Modelo) then exit;

  for b := 0 to Bloques.Count - 1 do
  begin
    Bloque := Bloques [b];
    Bloque.ActualizaDataSet;
    if Bloque.AppDataSet.FBloques.IndexOf (Bloque) = -1 then
      Bloque.AppDataSet.FBloques.Add (Bloque);

    for c := 0 to Bloque.DefColumnas.Count - 1 do
    begin
      DefColumna := Bloque.DefColumnas [c];
      Columna    := DefColumna.Columna;

      if Assigned (Columna)            and (Columna.Situacion            = scActivo) and
         Assigned (Columna.Definicion) and (Columna.Definicion.Situacion = svActivo) then
      begin
        if Bloque.Bloque.BloqueVisible and Assigned (Bloque.AppDataSet) then
        begin
          Bloque.AppDataSet.AgregarColumna (Columna);
          AsignaDataSetControl (DefColumna.Control, Bloque.AppDataSet.DataSource, Columna.NombreCampoFisico, True, Columna.NombreCampoFisico);
        end
      end;
    end;
  end;

  FDataSets.Add (AppDataSet);
  for b := 0 to Bloques.Count - 1 do
  begin
    Bloque := Bloques [b];

    if Assigned (Bloque.AppDataSet) and not Bloque.AppDataSet.Data.Active and
      (Bloque.AppDataSet.Data.FieldDefs.Count > 0)                        and
      (FDataSets.IndexOf (Bloque.AppDataSet) = -1) then
      FDataSets.Add (Bloque.AppDataSet);
  end;

  for i := 0 to FDataSets.Count - 1 do
  begin
    DS := TAppModeloDataSet (FDataSets [i]);
    DS.Data.EnableControls;
    DS.RegeneraIndice;
  end;
end;

function TAppModelo.ObtenCampoPorBloqueColumna (Bloque, Columna: string): TField;
var
  AppBloque: TAppModeloBloque;
begin
  result := nil;

  AppBloque := ObtenBloque (Bloque);
  if not Assigned (AppBloque) or not Assigned (AppBloque.AppDataSet) then exit;

  result := AppBloque.ObtenCampo (Columna);
end;

function TAppModelo.PuedeSalvar: boolean;
var
  i: integer;
  DS: TAppModeloDataSet;
begin
  result := True;

  for i := 0 to FDataSets.Count - 1 do
  begin
    DS := TAppModeloDataSet (FDataSets [i]);

    if not DS.PuedeAceptar then
    begin
      result := False;
      exit;
    end;
  end;
end;

procedure TAppModelo.ReordenaBloques;
var
  i, PrevTop, PrevHeight, Orden: integer;
  Bloque: TBloque;
begin
  if Cargando or not Assigned (Modelo) or (Modelo.Bloques.Count = 0) then exit;

  VertScrollBar.Position := 0;
  PrevTop                := -1;
  PrevHeight             := 0;
  Orden                  := 0;

  if Grid.Parent = Self then
  begin
    Grid.Left   := MargenIzquierdoPanel;
    Grid.Top    := PrevTop + MargenSuperiorPanel;
    Grid.Width  := ClientWidth - (MargenIzquierdoPanel + MargenDerechoPanel);
    Grid.Parent := Self;
    PrevTop     := Grid.Top;
    PrevHeight  := Grid.Height;
  end;

  if Navegador.Parent = Self then
  begin
    Navegador.Left   := MargenIzquierdoPanel;
    Navegador.Top    := PrevTop + PrevHeight + MargenSuperiorPanel;
    Navegador.Parent := Self;
    PrevTop          := Navegador.Top;
    PrevHeight       := Navegador.Height;
  end;

  for i := 0 to Modelo.Bloques.Count - 1 do
  begin
    Bloque := Modelo.Bloques [i];

    Bloque.AppBloque.ReordenaControles;
    if Bloque.BloqueVisible then
    begin
      Bloque.AppBloque.Panel.Top      := PrevTop + PrevHeight + 1;
      Bloque.AppBloque.Panel.TabOrder := Orden;
      PrevTop                         := Bloque.AppBloque.Panel.Top;
      PrevHeight                      := Bloque.AppBloque.Panel.Height;
      Inc (Orden);
    end
  end;

  FDummy.Top := PrevTop + PrevHeight + 1;

  AplicaEstatus;
  DespliegaBloques;
end;

procedure TAppModelo.DespliegaBloques;
var
  i: integer;
  Bloque: TBloque;
begin
  for i := 0 to Modelo.Bloques.Count - 1 do
  begin
    Bloque := Modelo.Bloques [i];

    Bloque.AppBloque.DespliegaBloques;
    Bloque.AppBloque.Panel.Visible := Bloque.BloqueVisible;
  end;
end;


procedure TAppModelo.Resize;
begin
  inherited;

  ReordenaBloques;
  Invalidate;
end;

procedure TAppModelo.EliminaBloque (Bloque: TAppModeloBloque);
  procedure PostOrder (Bloque: TAppModeloBloque);
  var
    Hijo, Siguiente: TAppModeloBloque;
  begin
    if not Assigned (Bloque) then exit;

    Hijo := Bloque.PrimerHijo;
    while Assigned (Hijo) do
    begin
      Siguiente := Hijo.HermanoSiguiente;
      PostOrder (Hijo);

      Hijo := Siguiente;
    end;

    Bloque.Panel.SendToBack;
    Bloque.Panel.Visible := False;
    Application.ProcessMessages;
    Bloques.Delete (Bloque.Index);
    Application.ProcessMessages;
  end;

begin
  PostOrder (Bloque);
end;



function TAppModelo.PrimerHijo: TAppModeloBloque;
begin
  result := nil;

  if Assigned (Modelo) and (Modelo.Bloques.Count > 0) then
    result := Modelo.Bloques [0].AppBloque;
end;

function TAppModelo.UltimoHijo: TAppModeloBloque;
begin
  result := nil;

  if Assigned (Modelo) and (Modelo.Bloques.Count > 0) then
    result := Modelo.Bloques [Modelo.Bloques.Count - 1].AppBloque;
end;

function TAppModelo.ObtenBloque (Nombre: string): TAppModeloBloque;
var
  Bloque: TBloque;
begin
  result := nil;

  if Assigned (Modelo) then
  begin
    Bloque := Modelo.ObtenBloque (Nombre);
    if Assigned (Bloque) then
      result := Bloque.AppBloque;
  end;
end;

function TAppModelo.ObtenBloque (Bloque_ID: integer): TAppModeloBloque;
var
  Bloque: TBloque;
begin
  result := nil;

  if Assigned (Modelo) then
  begin
    Bloque := Modelo.ObtenBloque (Bloque_ID);
    if Assigned (Bloque) then
      result := Bloque.AppBloque;
  end;
end;

procedure TAppModelo.Nuevo;
begin
  if not (Estado in [emVacio, emConsulta]) or not Assigned (Modelo) or not PuedeNuevo then exit;

  if Assigned (FOnAntesNuevo) then
    FOnAntesNuevo (Self);

  LimpiaDataSets;
  EstadoInterno := emInsertado;

  if Assigned (FOnDespuesNuevo) then
    FOnDespuesNuevo (Self);
end;

procedure CaptureWinCtrlImage(AWinControl: TWinControl; AImg: TGraphic);
var
  vBmp: Graphics.TBitmap;
  vControlDC: HDC;
begin
  // if the TWinControl has not been initialized, raise error
  if not AWinControl.HandleAllocated then
    raise Exception.Create('The control''s window handle has not been allocated');

  // Get Device Context of the TWinControl
  vControlDC := GetWindowDC(AWinControl.Handle);
  try

    // create our temporary TBitmap
    vBmp := Graphics.TBitmap.Create;
    try
      vBmp.PixelFormat := pf24bit;

      // adjust the temporary TBitmap dimension to match
      // the TWinControl's
      vBmp.Height := AWinControl.Height;
      vBmp.Width  := AWinControl.Width;

      // draw the content of the TWinControl to the temporary bitmap
      BitBlt(vBmp.Canvas.Handle, 0, 0, vBmp.Width, vBmp.Height, vControlDC, 0, 0, SRCCOPY);

      // copy the image in the temporary bitmap to the given graphic instance
      AImg.Assign(vBmp);
    finally
      vBmp.Free;
    end;

  finally
    // release the Device Context
    ReleaseDC(AWinControl.Handle, vControlDC);
  end;
end;

procedure TAppModelo.DBEditIntegerKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = DecimalSeparator then
    Key := #0;
end;

procedure TAppModelo.RegeneraPantalla;
var
  TmpModelo: TModelo;
  VertPos: integer;
  Img: TImage;
  Bmp, Bmp2: TBitmap;
begin
  VertPos          := VertScrollBar.Position;
  TmpModelo        := Modelo;
  Bmp              := TBitmap.Create;
  Bmp2             := TBitmap.Create;
  Bmp2.PixelFormat := pf24bit;
  Img              := TImage.Create (Self);
  Img.Visible      := False;
  Img.Autosize     := True;
  Img.Parent       := Parent;
  Img.Top          := Top;
  Img.Left         := Left;

  try
    CaptureWinCtrlImage (Parent, Bmp);
    Bmp.Canvas.CopyRect (Rect (0, 0, Width, Height), Bmp2.Canvas, Rect (Left, Top, Left + Width, Top + Height));
  except
  end;

  if not Bmp2.Empty then
  begin
    SendToBack;
    Img.BringToFront;
    Img.Picture.Assign (Bmp2);
    Img.Visible := True;
    Application.ProcessMessages;
  end;

  Visible                := False;
  Modelo                 := nil;
  Application.ProcessMessages;
  Modelo                 := TmpModelo;
  Application.ProcessMessages;
  Img.SendToBack;
  Application.ProcessMessages;
  VertScrollBar.Position := VertPos;
  Visible                := True;
  BringToFront;
  Img.Free;
  Bmp2.Free;
  Bmp.Free;
  Application.ProcessMessages;
end;


procedure TAppModelo.Consultar  (peIDPersona: integer; pePeriodo: TDate; var Encontrado: boolean);
var
  RepActual: integer;
  Query: TQuery;
  Bloque: TAppModeloBloque;
  Variable: TVariable;
  Columna: TAppModeloDefColumna;
  DS: TAppModeloDataSet;
  Campo: TField;
  i: integer;
begin
  if not (Estado in [emVacio, emConsulta]) or not PuedeConsultar then exit;

  if Assigned (FOnAntesConsultar) then
    FOnAntesConsultar (Self);

  FIDPersona := peIDPersona;
  FPeriodo   := Trunc (pePeriodo);
  Encontrado := True;

  AjustaDatabaseInteforma;

  if (IDPersona = 0) then
    raise EModeloExcepcion.Create ('El ID de Persona no debe ser = 0');

  if not Assigned (Modelo) then
    raise EModeloExcepcion.Create ('No hay un Modelo asignado');

  if not Assigned (DataBase) then
    raise EModeloExcepcion.Create ('No hay una base de datos asignada');

  //Si el foco de la aplicación está en alguno de los campos, lo quita y lo establece
  //dentro del scroll box para que no afecte el refresh durante la carga.
  if Assigned (Form) And Form.Visible then
    SetFocus;

  Query              := TQuery.Create (Self);
  Query.DatabaseName := Database.DatabaseName;
  Query.SessionName  := Database.SessionName;
  Query.SQL.Clear;
  Query.SQL.Add ('Select VV.No_Rep_Nodo_Padre, VV.ID_Nodo, VV.ID_Variable, VV.No_Repeticion, VV.Valor_Numerico, VV.Valor_Fecha, VV.Valor_Cadena');
  Query.SQL.Add ('  From CR_Met_Valor_Var  VV');
  Query.SQL.Add ('  Join CR_Met_Variable   DV On VV.ID_Variable    = DV.ID_Variable And');
  Query.SQL.Add ('                               DV.Sit_Variable   = ''AC''');
  Query.SQL.Add ('  Join CR_Met_Bloque     B  On VV.ID_Modelo      = B.ID_Modelo    And');
  Query.SQL.Add ('                               VV.ID_Nodo        = B.ID_Nodo      And');
  Query.SQL.Add ('                               B.Sit_Bloque      = ''AC''');
  Query.SQL.Add ('  Join CR_Met_Var_Bloque VB On VV.ID_Modelo      = VB.ID_Modelo   And');
  Query.SQL.Add ('                               VV.ID_Nodo        = VB.ID_Nodo     And');
  Query.SQL.Add ('                               VV.ID_Variable    = VB.ID_Variable And');
  Query.SQL.Add ('                               VB.Sit_Var_Bloque = ''AC''');
  Query.SQL.Add (' Where VV.Sit_Valor_Var = ''AC''');
  Query.SQL.Add ('   And VV.ID_Modelo  = :Modelo');
  Query.SQL.Add ('   And VV.ID_Persona = :Persona');
  Query.SQL.Add ('   And VV.Periodo    = :Periodo');
  Query.SQL.Add (' Order By VV.No_Rep_Nodo_Padre Asc Nulls First, VV.ID_Nodo, VV.No_Repeticion, VV.ID_Variable');
  Query.ParamByName ('Modelo' ).AsInteger  := Modelo.ID_Modelo;
  Query.ParamByName ('Persona').AsInteger  := IDPersona;
  Query.ParamByName ('Periodo').AsDateTime := Periodo;
  Query.Open;

  if Query.Eof then
    Encontrado := False
  else
  begin
    FCargando := True;
    RegeneraPantalla;
    FCargando := True;

    DeshabilitaControlesDataSets (False);
    LimpiaDataSets;
    try
      FEstado := emInsertado;
      AplicaEstatusDataSets;

      RepActual    := -1;
      DS           := nil;
      while not Query.Eof do
      begin
        ObtenBloqueVariableColumna (Format ('B%d.V%d', [Query.FieldByName ('ID_Nodo'    ).AsInteger,
                                                        Query.FieldByName ('ID_Variable').AsInteger]),
                                    Bloque, Variable, Columna);

        if not Assigned (Bloque) then
          raise EModeloExcepcion.CreateFmt ('El bloque [%d] no se encuentra en el modelo', [Query.FieldByName ('ID_Nodo').AsInteger]);

        if not Assigned (Variable) then
          raise EModeloExcepcion.CreateFmt ('La variable [%d] no se encuentra registrada', [Query.FieldByName ('ID_Nodo').AsInteger]);

        if not Assigned (Columna) then
          raise EModeloExcepcion.CreateFmt ('La columna [%s] no se encuentra registrada en el bloque [%s]', [Variable.Nombre, Bloque.Bloque.Nombre]);

        //Esta condición debe permitir que se agregue un nuevo registro cuando se trate de otro dataset
        if (DS <> Bloque.AppDataSet) or (RepActual <> Query.FieldByName ('No_Repeticion').AsInteger) then
        begin
          DS := Bloque.AppDataSet;
          DS.Data.Append;
        end;
        RepActual := Query.FieldByName ('No_Repeticion').AsInteger;

        //Solo se obtiene la información de los bloques activos
        if Bloque.Bloque.BloqueVisible then
        begin
          Campo := Bloque.ObtenCampo (Variable.Nombre);
          if not Assigned (Campo) then
            raise EModeloExcepcion.CreateFmt ('La columna [%s] no se encuentra registrada en el bloque [%s]', [Variable.Nombre, Bloque.Bloque.Nombre]);

          case Variable.TipoDato of
            vtdNumber:   if not Query.FieldByName ('Valor_Numerico').IsNull then Campo.AsFloat    := Query.FieldByName ('Valor_Numerico').AsFloat;
            vtdVarchar:  if not Query.FieldByName ('Valor_Cadena'  ).IsNull then Campo.AsString   := Query.FieldByName ('Valor_Cadena'  ).AsString;
            vtdDate,
            vtdDateTime: if not Query.FieldByName ('Valor_Fecha'   ).IsNull then Campo.AsDateTime := Query.FieldByName ('Valor_Fecha'   ).AsDateTime;
          end;
        end;

        Query.Next;
      end;

      for i := 0 to FDataSets.Count - 1 do
      begin
        DS := TAppModeloDataSet (FDataSets [i]);
        if DS.Data.Active and (DS.Data.RecordCount > 0) then
          DS.Data.First;
      end;
    finally
      Query.Free;
      EstadoInterno := emConsulta;
      HabilitaControlesDataSets;
      FCargando := False;
      FCambiado := False;

      if not Encontrado then
      begin
        FIDPersona    := 0;
        FPeriodo      := Trunc (Now);
        EstadoInterno := emVacio;
      end
      else
      begin
        FIDPersonaPrev := FIDPersona;
        FPeriodoPrev   := FPeriodo;
        if Assigned (FOnDespuesConsultar) then
          FOnDespuesConsultar (Self);
      end;
      Invalidate;
    end;
  end;
end;

procedure TAppModelo.Modificar;
begin
  if not Assigned (Modelo) or not PuedeModificar or (Estado <> emConsulta) then exit;

  if Assigned (FOnAntesModificar) then
    FOnAntesModificar (Self);

  EstadoInterno := emEditado;

  if Assigned (FOnDespuesModificar) then
    FOnDespuesModificar (Self);
end;

procedure TAppModelo.Activar;
begin
  if not Assigned (Modelo) or not PuedeDesactivar then exit;

  if Assigned (FOnAntesCambiarEstado) then
    FOnAntesCambiarEstado (Self);

  //Acción de activar
  if Assigned (FOnDespuesCambiarEstado) then
    FOnDespuesCambiarEstado (Self);
end;

procedure TAppModelo.Desactivar;
begin
  if not Assigned (Modelo) or not PuedeDesactivar then exit;

  if Assigned (FOnAntesCambiarEstado) then
    FOnAntesCambiarEstado (Self);

  //Acción de desactivar

  if Assigned (FOnDespuesCambiarEstado) then
    FOnDespuesCambiarEstado (Self);
end;

procedure TAppModelo.ExtraeBloqueColumna (ColName: string; var BloqueID, VariableID: integer);
var
  Error: boolean;
  Punto, e: integer;
  s: string;
begin
  BloqueID   := -1;
  VariableID := -1;

  if (ColName = '') or (Copy (ColName, 1, 1) <> 'B') then exit;
  Delete (ColName, 1, 1);
  Punto := Pos ('.', ColName);

  if Punto = -1 then exit;

  s := Copy (ColName, 1, Punto - 1);
  Delete (ColName, 1, Punto);

  if (ColName = '') or (Copy (ColName, 1, 1) <> 'V') then exit;
  Delete (ColName, 1, 1);

  if (s = '') or (ColName = '') then exit;

  Val (s, BloqueID, e);
  Error := e <> 0;

  Val (ColName, VariableID, e);
  Error := Error or (e <> 0);

  if Error then
  begin
    BloqueID   := -1;
    VariableID := -1;
  end;
end;

procedure TAppModelo.AplicaEstatusControlesPorBloque;
var
  i: integer;
begin
  for i := 0 to Bloques.Count - 1 do
    Bloques [i].AplicaEstatusControles;
end;

procedure TAppModelo.AplicaEstatusDataSets;
var
  i: integer;
  Habilitado: boolean;
begin
  Habilitado := Assigned (Modelo) and (FEstado in [emInsertado, emEditado]);
  for i := 0 to FDataSets.Count - 1 do
    TAppModeloDataSet (FDataSets [i]).Data.ReadOnly := not Habilitado;
end;

procedure TAppModelo.AplicaEstatus;
begin
  AplicaEstatusDataSets;
  AplicaEstatusControlesPorBloque;
  ActualizaBotones;
end;

procedure TAppModelo.DeshabilitaControlesDataSets (GeneraBookmarks: boolean = True);
var
  i: integer;
  DS: TAppModeloDataSet;
begin
  for i := 0 to FDataSets.Count - 1 do
  begin
    DS := TAppModeloDataSet (FDataSets [i]);

    if GeneraBookmarks and DS.Data.Active and (DS.Data.RecordCount > 0) then
      DS.Actual := DS.Data.GetBookmark;

    DS.Data.DisableControls;
  end;
end;

procedure TAppModelo.HabilitaControlesDataSets;
var
  i: integer;
  DS: TAppModeloDataSet;
begin
  for i := 0 to FDataSets.Count - 1 do
  begin
    DS := TAppModeloDataSet (FDataSets [i]);
//    DS.Data.DisableControls;

    if DS.Data.Active and Assigned (DS.Actual) then
    begin
      try
        DS.Data.GotoBookmark (DS.Actual);
        DS.Data.FreeBookmark (DS.Actual);
      except
      end;
      DS.Actual := nil;
    end;

    try
      DS.Data.EnableControls;
    except
      DS.Data.EnableControls;
    end;
  end;
end;

function TAppModelo.DeterminaBotonesActivos: TBotonesAppModelo;
begin
  result := [];

  if not Assigned (Modelo) or (Modelo.Nombre = '') or (Modelo.Estado <> emConsulta) then exit;

  if PuedeNuevo and (Estado in [emVacio, emConsulta]) then
    result := result + [bamNuevo];

  if PuedeModificar and (Estado = emConsulta) then
    result := result + [bamModificar];

  if PuedeDesactivar and (Estado = emConsulta) then
    result := result + [bamActivar];

  if PuedeConsultar and (Estado in [emVacio, emConsulta]) then
    result := result + [bamConsultar];

  if (Estado in [emInsertado, emEditado]) then
  begin
    result := result + [bamCancelar];

    if PuedeSalvar then
      result := result + [bamAceptar];
  end;
end;

procedure TAppModelo.CreaBotonesInterforma;
begin
  DestruyeBotonesInterforma;

  if not Assigned (Interforma) then exit;

  FInterformaBtnNuevo                 := TButton.Create (Self);
  FInterformaBtnNuevo.Caption         := '&Nuevo';
  FInterformaBtnNuevo.OnClick         := BtnNuevoClick;
  FInterformaBtnModificar             := TButton.Create (Self);
  FInterformaBtnModificar.Caption     := '&Modificar';
  FInterformaBtnModificar.OnClick     := BtnModificarClick;
  FInterformaBtnCambiarEstado         := TButton.Create (Self);
  FInterformaBtnCambiarEstado.Caption := '&Desactivar';
  FInterformaBtnAceptar               := TButton.Create (Self);
  FInterformaBtnAceptar.Caption       := '&Aceptar';
  FInterformaBtnAceptar.OnClick       := BtnInterformaAceptar;
  FInterformaBtnCancelar              := TButton.Create (Self);
  FInterformaBtnCancelar.Caption      := '&Cancelar';
  FInterformaBtnCancelar.OnClick      := BtnCancelarClick;
  FInterformaBtnBuscar                := TButton.Create (Self);
  FInterformaBtnBuscar.Caption        := '&Buscar';
  FInterformaBtnBuscar.OnClick        := BtnInterformaBuscar;
end;

procedure TAppModelo.DestruyeBotonesInterforma;
begin
  if Assigned (FInterformaBtnNuevo)         then FreeAndNil (FInterformaBtnNuevo);
  if Assigned (FInterformaBtnModificar)     then FreeAndNil (FInterformaBtnModificar);
  if Assigned (FInterformaBtnCambiarEstado) then FreeAndNil (FInterformaBtnCambiarEstado);
  if Assigned (FInterformaBtnAceptar)       then FreeAndNil (FInterformaBtnAceptar);
  if Assigned (FInterformaBtnCancelar)      then FreeAndNil (FInterformaBtnCancelar);
  if Assigned (FInterformaBtnBuscar)        then FreeAndNil (FInterformaBtnBuscar);
end;

procedure TAppModelo.ReposicionaBotonesInterformas;
begin
  if Assigned (Interforma)             and Assigned (Interforma.BtnNuevo)   and Assigned (Interforma.BtnModificar) and
     Assigned (Interforma.BtnEliminar) and Assigned (Interforma.BtnAceptar) and Assigned (Interforma.BtnCancelar)  and
     Assigned (Interforma.BtnBuscar) then
  begin
    //Si los botones no están creados, los crea
    if not Assigned (FInterformaBtnNuevo)         or not Assigned (FInterformaBtnModificar) or
       not Assigned (FInterformaBtnCambiarEstado) or not Assigned (FInterformaBtnAceptar)   or
       not Assigned (FInterformaBtnCancelar)      or not Assigned (FInterformaBtnBuscar)    then
       CreaBotonesInterforma;

    //Primero toma el tab order
    FInterformaBtnNuevo        .Tag := Interforma.BtnNuevo    .TabOrder;
    FInterformaBtnModificar    .Tag := Interforma.BtnModificar.TabOrder;
    FInterformaBtnCambiarEstado.Tag := Interforma.BtnEliminar .TabOrder;
    FInterformaBtnAceptar      .Tag := Interforma.BtnAceptar  .TabOrder;
    FInterformaBtnCancelar     .Tag := Interforma.BtnCancelar .TabOrder;
    FInterformaBtnBuscar       .Tag := Interforma.BtnBuscar   .TabOrder;

    //Posiciona y dimensiona los botones propios
    FInterformaBtnNuevo        .Top := Interforma.BtnNuevo    .Top;
    FInterformaBtnModificar    .Top := Interforma.BtnModificar.Top;
    FInterformaBtnCambiarEstado.Top := Interforma.BtnEliminar .Top;
    FInterformaBtnAceptar      .Top := Interforma.BtnAceptar  .Top;
    FInterformaBtnCancelar     .Top := Interforma.BtnCancelar .Top;
    FInterformaBtnBuscar       .Top := Interforma.BtnBuscar   .Top;

    FInterformaBtnNuevo        .Left := Interforma.BtnNuevo    .Left;
    FInterformaBtnModificar    .Left := Interforma.BtnModificar.Left;
    FInterformaBtnCambiarEstado.Left := Interforma.BtnEliminar .Left;
    FInterformaBtnAceptar      .Left := Interforma.BtnAceptar  .Left;
    FInterformaBtnCancelar     .Left := Interforma.BtnCancelar .Left;
    FInterformaBtnBuscar       .Left := Interforma.BtnBuscar   .Left;

    FInterformaBtnNuevo        .Width := Interforma.BtnNuevo    .Width;
    FInterformaBtnModificar    .Width := Interforma.BtnModificar.Width;
    FInterformaBtnCambiarEstado.Width := Interforma.BtnEliminar .Width;
    FInterformaBtnAceptar      .Width := Interforma.BtnAceptar  .Width;
    FInterformaBtnCancelar     .Width := Interforma.BtnCancelar .Width;
    FInterformaBtnBuscar       .Width := Interforma.BtnBuscar   .Width;

    FInterformaBtnNuevo        .Height := Interforma.BtnNuevo    .Height;
    FInterformaBtnModificar    .Height := Interforma.BtnModificar.Height;
    FInterformaBtnCambiarEstado.Height := Interforma.BtnEliminar .Height;
    FInterformaBtnAceptar      .Height := Interforma.BtnAceptar  .Height;
    FInterformaBtnCancelar     .Height := Interforma.BtnCancelar .Height;
    FInterformaBtnBuscar       .Height := Interforma.BtnBuscar   .Height;

    FInterformaBtnNuevo        .TabOrder := FInterformaBtnNuevo        .Tag;
    FInterformaBtnModificar    .TabOrder := FInterformaBtnModificar    .Tag;
    FInterformaBtnCambiarEstado.TabOrder := FInterformaBtnCambiarEstado.Tag;
    FInterformaBtnAceptar      .TabOrder := FInterformaBtnAceptar      .Tag;
    FInterformaBtnCancelar     .TabOrder := FInterformaBtnCancelar     .Tag;
    FInterformaBtnBuscar       .TabOrder := FInterformaBtnBuscar       .Tag;

    //Muestra los botones propios
    FInterformaBtnNuevo        .Parent := Interforma.BtnNuevo    .Parent;
    FInterformaBtnModificar    .Parent := Interforma.BtnModificar.Parent;
    FInterformaBtnCambiarEstado.Parent := Interforma.BtnEliminar .Parent;
    FInterformaBtnAceptar      .Parent := Interforma.BtnAceptar  .Parent;
    FInterformaBtnCancelar     .Parent := Interforma.BtnCancelar .Parent;
    FInterformaBtnBuscar       .Parent := Interforma.BtnBuscar   .Parent;

    //Oculta los botones de la interforma
    Interforma.BtnNuevo    .Visible := False;
    Interforma.BtnModificar.Visible := False;
    Interforma.BtnEliminar .Visible := False;
    Interforma.BtnAceptar  .Visible := False;
    Interforma.BtnCancelar .Visible := False;
    Interforma.BtnBuscar   .Visible := False;

    //Oculta el botón de Cambio de estado y recorre los de aceptar y cancelar
    FInterformaBtnCambiarEstado.Visible := False;
    FInterformaBtnCancelar.Top          := Interforma.BtnEliminar.Top;
    FInterformaBtnCancelar.Left         := Interforma.BtnEliminar.Left;
    FInterformaBtnAceptar.Top           := Interforma.BtnAceptar.Top;
    FInterformaBtnAceptar.Left          := Interforma.BtnAceptar.Left;
  end
  else if Assigned (FInterformaBtnNuevo)         and not Assigned (FInterformaBtnModificar) and
          Assigned (FInterformaBtnCambiarEstado) and not Assigned (FInterformaBtnAceptar)   and
          Assigned (FInterformaBtnCancelar)      and not Assigned (FInterformaBtnBuscar)    then
  begin
    FInterformaBtnNuevo        .Parent := nil;
    FInterformaBtnModificar    .Parent := nil;
    FInterformaBtnCambiarEstado.Parent := nil;
    FInterformaBtnAceptar      .Parent := nil;
    FInterformaBtnCancelar     .Parent := nil;
    FInterformaBtnBuscar       .Parent := nil;
  end;
end;


procedure TAppModelo.AjustaDatabaseInteforma;
begin
  if Assigned (FInterforma)               and Assigned (FInterforma.Funcion) and
     Assigned (FInterforma.Funcion.Owner) and (FInterforma.Funcion.Owner is TInterFrame) then
      FInterforma.Funcion.Apli := TInterFrame (FInterforma.Funcion.Owner).Apli;
end;

procedure TAppModelo.ObtenBloqueVariableColumna (Campo: string; var Bloque: TAppModeloBloque; var Variable: TVariable;
                                                 var Columna: TAppModeloDefColumna);
var
  BloqueID, VariableID: integer;
begin
  Bloque   := nil;
  Variable := nil;
  Columna  := nil;
  ExtraeBloqueColumna (Campo, BloqueID, VariableID);

  Bloque := ObtenBloque (BloqueID);
  if not Assigned (Bloque) then exit;

  Variable := Modelo.ObtenVariable (VariableID);
  if not Assigned (Variable) then exit;

  Columna := Bloque.ObtenColumna (Variable.Nombre);
end;


procedure TAppModelo.LimpiaDataSets;
var
  i: integer;
  DS: TAppModeloDataSet;
begin
  for i := 0 to FDataSets.Count - 1 do
  begin
    DS := TAppModeloDataSet (FDataSets [i]);

    if Assigned (DS.Actual) then
    begin
      try
        DS.Data.FreeBookmark (DS.Actual);
      except
      end;
      DS.Actual := nil;
    end;

    DS.Data.Close;
    DS.RegeneraIndice;
    DS.Data.CreateDataSet;
    DS.Data.Open;
  end;
end;

procedure TAppModelo.FocusToControl (Control: TControl);
  function AbsolutePos (Control: TControl): integer;
  begin
    if Control.Parent = Self then
      result := VertScrollBar.Position + Control.Top
    else
      result := Control.Top + AbsolutePos (Control.Parent);
  end;

  procedure ScrollTo (Y: integer);
  begin
    if (Y < VertScrollBar.Position) or ((Y + 30) > (VertScrollBar.Position + ClientHeight)) then
    begin
      VertScrollBar.Position := Y - 30;
      Application.ProcessMessages;
    end;
  end;

begin
  if not Assigned (Control) then exit;

  ScrollTo (AbsolutePos (Control));

  if not Assigned (Form) or not Form.Visible then exit;

  if Control is TDBEdit then
    (Control as TDBEdit).SetFocus
  else if Control is TDBDateTimePicker then
    (Control as TDBDateTimePicker).SetFocus
  else if Control is TDBMemo then
    (Control as TDBMemo).SetFocus
  else if Control is TDBRadioGroup then
    (Control as TDBRadioGroup).SetFocus
  else if Control is TDBComboBox then
    (Control as TDBComboBox).SetFocus
  else if Control is TDBCheckList then
    (Control as TDBCheckList).SetFocus
  else if Control is TWebBrowser then
    (Control as TWebBrowser).SetFocus;
end;


procedure TAppModelo.Aceptar (var Error: integer; var MsgError: string);
var
  i, c: integer;
  DS: TAppModeloDataSet;
  Proc: TStoredProc;

  procedure SalvaColumna (DataSet: TDataSet; ColName: string; No_Rep_Padre: integer);
  var
    BloqueID, VariableID: integer;
    Bloque: TAppModeloBloque;
    Variable: TVariable;
    Columna: TAppModeloDefColumna;
    Campo: TField;
  begin
    Proc.Close;
    Proc.StoredProcName := coEsquema + '.' + coPaquete + '.STPNVOVALOR';

    Proc.Params.Clear;
    Proc.Params.CreateParam (ftFloat,    'peID_Nodo',           ptInput);
    Proc.Params.CreateParam (ftFloat,    'peID_Variable',       ptInput);
    Proc.Params.CreateParam (ftFloat,    'peNo_Repeticion',     ptInput);
    Proc.Params.CreateParam (ftFloat,    'peNo_Rep_Nodo_Padre', ptInput);
    Proc.Params.CreateParam (ftFloat,    'peValor_Numerico',    ptInput);
    Proc.Params.CreateParam (ftDateTime, 'peValor_Fecha',       ptInput);
    Proc.Params.CreateParam (ftString,   'peValor_Cadena',      ptInput);

    ExtraeBloqueColumna (ColName, BloqueID, VariableID);
    if (BloqueID = -1) or (VariableID = -1) then
      raise EModeloExcepcion.Create ('Bloque o variable no reconocida.');

    ObtenBloqueVariableColumna (ColName, Bloque, Variable, Columna);

    if not Assigned (Bloque) then
      raise EModeloExcepcion.CreateFmt ('Bloque [%d] no reconocido.', [BloqueID]);

    if not Assigned (Variable) then
      raise EModeloExcepcion.CreateFmt ('Variable [%d] no reconocida.', [VariableID]);

    if not Assigned (Columna) then
      raise EModeloExcepcion.CreateFmt ('Variable [%s] no encontrada en el bloque [%s].', [Variable.Nombre, Bloque.Bloque.Nombre]);

    Campo := Bloque.ObtenCampo (Variable.Nombre);
    if not Assigned (Campo) then
      raise EModeloExcepcion.CreateFmt ('Variable [%s] no encontrada en el bloque [%s].', [Variable.Nombre, Bloque.Bloque.Nombre]);

    Proc.ParamByName ('peID_Nodo'      ).AsInteger := BloqueID;
    Proc.ParamByName ('peID_Variable'  ).AsInteger := VariableID;
    Proc.ParamByName ('peNo_Repeticion').AsInteger := DataSet.RecNo;

    if No_Rep_Padre <> 0 then
      Proc.ParamByName ('peNo_Rep_Nodo_Padre').AsInteger := No_Rep_Padre;

    case Columna.Columna.Definicion.TipoDato of
      vtdNumber:   Proc.ParamByName ('peValor_Numerico').AsFloat    := Campo.AsFloat;
      vtdVarchar:  Proc.ParamByName ('peValor_Cadena'  ).AsString   := Campo.AsString;
      vtdDate,
      vtdDateTime: Proc.ParamByName ('peValor_Fecha'   ).AsDateTime := Campo.AsDateTime;
    end;

    Proc.ExecProc;
  end;

var
  InfoValida, CumpleValidaciones: boolean;

begin
  //Asume que no hay errores
  Error    := 0;
  MsgError := '';

  if not (Estado in [emInsertado, emEditado]) then exit;

  if not PuedeSalvar then exit;

  AjustaDatabaseInteforma;

  if (IDPersona = 0) then
    raise EModeloExcepcion.Create ('El ID de Persona no debe ser = 0');

  if not Assigned (Modelo) then
    raise EModeloExcepcion.Create ('No hay un Modelo asignado');

  if not Assigned (DataBase) then
    raise EModeloExcepcion.Create ('No hay una base de datos asignada');

  InfoValida         := True;
  CumpleValidaciones := True;
  if Assigned (FOnAntesAceptar) then
    try
      FOnAntesAceptar (Self, InfoValida);
    except

    end;

  if not InfoValida then
  begin
    Error    := -1;
    MsgError := 'Validaciones de usuario';
  end;

  Proc              := TStoredProc.Create (Self);
  Proc.DatabaseName := Database.DatabaseName;
  Proc.SessionName  := Database.SessionName;
//  FCargando         := True;

  try
    DeshabilitaControlesDataSets;

    //Limpia la tabla de valores
    Proc.Close;
    Proc.StoredProcName := coEsquema + '.' + coPaquete + '.STPCLRMODELVAL';

    Proc.Params.Clear;
    Proc.Params.CreateParam (ftFloat,  'peDummy', ptInput);
    Proc.ExecProc;

    //Envía los valores a la lista en memoria
    for i := 0 to FDataSets.Count - 1 do
    begin
      DS := TAppModeloDataSet (FDataSets [i]);

      if DS.Data.State in [dsEdit, dsInsert] then
        try
          DS.Data.Post;
        except
          on E: ECampoObligatorio do
          begin
            CumpleValidaciones := False;
            FocusToControl (DS.UltimoControl);
            MessageDlg (E.Message, mtError, [mbOk], 0);
            exit;
          end;
          on E: EValidacionUsuario do
          begin
            CumpleValidaciones := False;
            FocusToControl (DS.UltimoControl);
            MessageDlg (E.Message, mtError, [mbOk], 0);
            exit;
          end;
          on E: Exception do
          begin
            CumpleValidaciones := False;
            if Assigned (DS.UltimoControl) then
              FocusToControl (DS.UltimoControl);
            MessageDlg (E.Message, mtError, [mbOk], 0);
            exit;
          end
        end;

      if (DS.Data.State = dsBrowse) and (DS.Data.RecordCount > 0) then
      begin
        DS.Data.First;

        while not DS.Data.Eof do
        begin
          for c := 0 to DS.Data.Fields.Count - 1 do
            if not DS.Data.Fields [c].IsNull then
              SalvaColumna (DS.Data, DS.Data.Fields [c].FieldName, 0);

          DS.Data.Next;
        end;
      end;
    end;

    //Salva la información en la tabla
    Proc.Close;
    Proc.StoredProcName := coEsquema + '.' + coPaquete + '.STPALTAMODELOAPP';

    Proc.Params.Clear;
    Proc.Params.CreateParam (ftFloat,    'peID_Persona',        ptInput);
    Proc.Params.CreateParam (ftFloat,    'peID_Modelo',         ptInput);
    Proc.Params.CreateParam (ftDateTime, 'pePeriodo',           ptInput);
    Proc.Params.CreateParam (ftDateTime, 'peF_Vigente_Desde',   ptInput);
    Proc.Params.CreateParam (ftString,   'peCve_Usu_Alta',      ptInput);
    Proc.Params.CreateParam (ftFloat,    'psError',             ptOutput);
    Proc.Params.CreateParam (ftString,   'psMsgError',          ptOutput);

    Proc.ParamByName ('peID_Persona'     ).AsInteger  := IDPersona;
    Proc.ParamByName ('peID_Modelo'      ).AsInteger  := Modelo.ID_Modelo;
    Proc.ParamByName ('pePeriodo'        ).AsDateTime := Periodo;
    Proc.ParamByName ('peF_Vigente_Desde').AsDate     := FechaEmpresa;
    Proc.ParamByName ('peCve_Usu_Alta'   ).AsString   := Cve_Usuario;
    Proc.ExecProc;

    if Proc.ParamByName ('psError').AsInteger = 0 then
    begin
      Cambiado      := False;
      EstadoInterno := emConsulta;
      IDPersonaPrev := IDPersona;
      PeriodoPrev   := Periodo;
    end
    else
    begin
      Error    := Proc.ParamByName ('psError'   ).AsInteger;
      MsgError := Proc.ParamByName ('psMsgError').AsString;
    end;
  finally
    Proc.Free;
    HabilitaControlesDataSets;
//    FCargando := False;

    if not CumpleValidaciones then Abort;

    if Assigned (FOnDespuesAceptar) then
      FOnDespuesAceptar (Self);
  end;
end;

procedure TAppModelo.Cancelar;
var
  Encontrado: boolean;
begin
  case FEstado of
    emInsertado: begin
      if Assigned (FOnAntesCancelar) then
        FOnAntesCancelar (Self);

      if FEstadoPrev = emConsulta then
      begin
        FEstado     := emVacio;
        FEstadoPrev := emVacio;
        Consultar (IDPersonaPrev, PeriodoPrev, Encontrado);
      end
      else
      begin
        LimpiaDataSets;
        FIDPersona     := 0;
        FPeriodo       := Trunc (Now);
        FIDPersonaPrev := 0;
        FPeriodoPrev   := Trunc (Now);
        FEstadoPrev    := emVacio;
        EstadoInterno  := emVacio;
      end;

      if Assigned (FOnDespuesCancelar) then
        FOnDespuesCancelar (Self);
    end;
    emEditado: begin
      if Assigned (FOnAntesCancelar) then
        FOnAntesCancelar (Self);

      FEstado := emVacio;
      Consultar (IDPersona, Periodo, Encontrado);

      if Assigned (FOnDespuesCancelar) then
        FOnDespuesCancelar (Self);
    end;
  end;
end;

procedure TAppModelo.OcultarBotonesInterformas;
begin
  if Assigned (FInterformaBtnNuevo)         then FInterformaBtnNuevo        .Visible := False;
  if Assigned (FInterformaBtnModificar)     then FInterformaBtnModificar    .Visible := False;
  if Assigned (FInterformaBtnCambiarEstado) then FInterformaBtnCambiarEstado.Visible := False;
  if Assigned (FInterformaBtnAceptar)       then FInterformaBtnAceptar      .Visible := False;
  if Assigned (FInterformaBtnCancelar)      then FInterformaBtnCancelar     .Visible := False;
  if Assigned (FInterformaBtnBuscar)        then FInterformaBtnBuscar       .Visible := False;
end;

procedure TAppModelo.DesplegarBotonesInterformas;
begin
  if Assigned (FInterformaBtnNuevo)         then FInterformaBtnNuevo        .Visible := True;
  if Assigned (FInterformaBtnModificar)     then FInterformaBtnModificar    .Visible := True;
  if Assigned (FInterformaBtnCambiarEstado) then FInterformaBtnCambiarEstado.Visible := True;
  if Assigned (FInterformaBtnAceptar)       then FInterformaBtnAceptar      .Visible := True;
  if Assigned (FInterformaBtnCancelar)      then FInterformaBtnCancelar     .Visible := True;
  if Assigned (FInterformaBtnBuscar)        then FInterformaBtnBuscar       .Visible := True;
end;

{TAppModeloGeneral}
procedure TAppModeloGeneral.OcultarBotonesInterformas;
begin
  inherited;
end;

procedure TAppModeloGeneral.DesplegarBotonesInterformas;
begin
  inherited;
end;

{TAppModeloValidaBloque}
constructor TAppModeloValidaBloque.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);

  FModelo       := nil;
  FBloque       := nil;
  FNombreBloque := '';
end;

destructor TAppModeloValidaBloque.Destroy;
begin
  if Assigned (Modelo) then
    DesasignaModelo;

  FModelo := nil;
  FBloque := nil;

  inherited Destroy;
end;

procedure TAppModeloValidaBloque.Actualiza;
begin
  ResuelveBloque;
end;


procedure TAppModeloValidaBloque.SetModelo (Value: TAppModelo);
begin
  if FModelo <> Value then
  begin
    if Assigned (FModelo) then
      DesasignaModelo;

    FModelo := Value;
    AsignaModelo;
  end;
end;

procedure TAppModeloValidaBloque.SetNombreBloque (Value: string);
begin
  Value := Q_TrimChar (Q_UpperCase (Value));
  if FNombreBloque <> Value then
  begin
    FNombreBloque := Value;
    ResuelveBloque;
  end;
end;

procedure TAppModeloValidaBloque.Notification(AComponent : TComponent; Operation : TOperation);
begin
  inherited Notification (AComponent, Operation);

  if Operation <> opRemove then exit;

  if AComponent = FModelo then
    DesasignaModelo;
end;

procedure TAppModeloValidaBloque.DesasignaModelo;
begin
  FModelo := nil;
  FBloque := nil;
end;

procedure TAppModeloValidaBloque.AsignaModelo;
begin
  ResuelveBloque;
end;

procedure TAppModeloValidaBloque.ResuelveBloque;
begin
  if not Assigned (Modelo) or (FNombreBloque = '') then exit;

  FBloque := Modelo.ObtenBloque (FNombreBloque);
end;

{TAppModeloValidaColumna}
constructor TAppModeloValidaColumna.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);

  FNombreColumna := '';
  FColumna       := nil;
end;

destructor TAppModeloValidaColumna.Destroy;
begin
  FColumna := nil;

  inherited Destroy;
end;

procedure TAppModeloValidaColumna.Actualiza;
begin
  inherited Actualiza;
  ResuelveColumna;
end;

procedure TAppModeloValidaColumna.SetNombreColumna (Value: string);
begin
  Value := Q_TrimChar (Q_UpperCase (Value));
  if FNombreColumna <> Value then
  begin
    FNombreColumna := Value;
    ResuelveColumna;
  end;
end;

procedure TAppModeloValidaColumna.DesasignaModelo;
begin
  inherited DesasignaModelo;

  FColumna := nil;
end;

procedure TAppModeloValidaColumna.ResuelveBloque;
begin
  inherited ResuelveBloque;

  ResuelveColumna;
end;

procedure TAppModeloValidaColumna.ResuelveColumna;
begin
  if not Assigned (Bloque) or (FNombreColumna = '') then exit;

  FColumna := Bloque.ObtenColumna (FNombreColumna);
end;

end.
