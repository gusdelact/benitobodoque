unit IntFrm;

//-------------------------------------------------------------
// Versión         :   Final 11 Enero 2000                                       
// Sistema         :   InterFrame
// Date            :   Noviembre de 1997
// Fecha de Inicio :   Noviembre de 1997
// Función forma   :   Control de Clase
// Desarrollo por  :   Víctor Martínez Castro
// Comentarios     :
// Modificacion    :
// Actualizado al  :   25 de Agosto
//                     25 de Enero Para Soportar LongData Type.
// ------------------------------------------------------------

interface

{$R-}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dbTables, db,
  stdCtrls, Mask, IntFind, unSQL2, InterFun, Menus, dbCtrls, InterApl, Bde,
  extCtrls, UnSubGen, InterFor, InterEdit, IntLinkit, IntCheckMem;

Const vgChecaSeguOnCreate:Boolean=False;
Const vgUseParadox       :Boolean=False;
Const vgUseAccess        :Boolean=False;
Const kPerfilSecu        :Integer=101;
Const tsNinguno = 0;   // Corresponden al los estados en que aplica el parametro
      tsConsulta = 1;  // cuando se definen los campos del Store Procedure
      tsModifica = 2;
      tsElimina = 4;
      tsNuevo = 8;
      tsBusca = 16;
      tsProc1 = 32;
      tsProc2 = 64;
      tsProc3 = 128;
      tsProc4 = 256;
      tsProc5 = 512;
      fbNinguno = 0;

(*******************************************************************INTERCAMPO****)
(*                                                                               *)
(*    INTERCAMPO                                                                 *)
(*                                                                               *)
(*******************************************************************INTERCAMPO****)

Type
   EInterFrame=Class(Exception)
     Public
       Constructor Create(const Msg:string); virtual;
   end;

//=(ftGrid,ftConsulta,ftCaptura,ftMulti,ftModifica, ftImprimir);
// Forwared declaration, se define para poder utilizar el tipo de TInterFrame
// antes de ser declarado
  TInterFrame=Class;
// Estados del Frame
  TModo = (moEdit,moAppend,moPost,moCancel,moDelete,moBrowse,moInActive);
  TMuestraCatalogoEvent=Procedure(Sender:TObject; Var MuestraCatalogo:Boolean ) of Object;
  TValidateRequieredEvent=Procedure(Sender:TObject; Var Correcto:Boolean ) of Object;
  TOnChildChangeEvent=Procedure(Sender:TObject; Child:TInterFrame) of Object;
  TOnChecaAccesoEvent=Procedure(Sender:TObject; Interfun:TInterFun; Muestra:Boolean; Var Resultado:Boolean) of Object;

  TFrameList=Class(TPersistent)
                Private
                 FFrame:TList;
                 FNombre:TStringList;
                 FApli   :TInterApli;
                 FMsg    :TMemo;
                 FActive  :Boolean;
                 FPadre    :TFrameList;
                 Function    GetActive:Boolean;
                 Procedure   SetActive(B:Boolean);
                Public
                Constructor Create;
                Destructor  Destroy; override;
                Procedure   AddMsg(S:String);
                Procedure   Add(Nom:String; Fre:TObject);
                Function    GetCampo(Nombre:String; Campo:String):String;
                Function    GetFrame(Nombre:String):TInterFrame;
                Function    GetQuery(Nombre:String):TQuery;
                Property    Apli:TInterApli Read FApli Write FApli;
                Property    Msg:TMemo Read FMsg Write FMsg;
                Property    Nombre:TStringList Read FNombre Write FNombre;
                Property    Frame :TList Read FFrame Write FFrame;
                Function    GetAssign:TFrameList;
                Procedure   Clear;
                Property    Active:Boolean Read GetActive Write SetActive;
                Property    Padre:TFrameList Read FPadre Write FPadre;
               end;

  TInterCampo= class(TComponent)
  private
    FTipo:TFieldType;      // Tipo de dato
    FCaption:String;       // Nombre del Campo.
    FNombre:String;        // Nombre del campo
    FParametro:String;      // Nombre del Parametro Relacionado Con el Campo
    FValorActual:Variant;  // Valor para State=0
    FValorNuevo:Variant;   // Valor para Sate=1
                           // Nuevo        State = 1
                           // Modificar    State = 1
                           // Eliminar     State = 0
                           // Consulta     State = 0
    FState:Integer;        // Estado para ValorActual y ValorNuevo
    FControlState:Integer; // Estado para Controles
    FControl   :TControl;     // Componente visual al que esta ligado el campo ControlState=0
    FControl2  :TControl;  // Componente visual al que esta ligado el campo ControlState=1
    FOnChange:TNotifyEvent;// Evento de cambio
    Padre:TInterFrame;     // Referencia al padre del objeto
    Fsize:Integer;         // Longitud del campo, si es = a 0 no aplica
    FReadFromQuery:Boolean; // Determina si se utiliza Query para el campo
    FMasterField:String; // Campo de Master Source
    FComboDatos:TStringList;
    FComboLista:TStringList;
    FUseCombo:Boolean;
    FIsNull:Boolean;
    Controles:TList;
    LinkControles:TList;
    FIsRequiered:Boolean;
    FOnValidateRequieredEvent:TValidateRequieredEvent;
    FNoClear:Boolean;
    FNoNull:Boolean;
    FNoCompare:Boolean;
    FNoSave:Boolean;
    FIsLongData:Boolean;
    FTipoReader:TTipoReader;
  protected
// Notifica del cambio de n componente (Creación , destrucción)
    procedure Notification( AComponent : TComponent; Operation : TOperation); override;
// Genera el evento de OnChange
    Procedure Cambio(Sender:TObject; Draw:Boolean);
    Procedure SetUseCombo(Usa:Boolean);
    Procedure SetIsNull(B:Boolean);
    Function  GetIsNull:Boolean;
  public
    StpEntrada:LongInt;  // Estados en que entra el campo al Store Procedure
    StpSalida:LongInt;   // Estados en que sale el campo del Store Procedure
    IsOraTime:Boolean;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    Procedure SetAsString(S:String);  // Asignación en base al tipo de dato
    Procedure SetAsInteger(I:LongInt);
    Procedure SetAsFloat(F:Double);
    Procedure SetAsBoolean(B:Boolean);
    Procedure SetAsDateTime(D:TDateTime);
    Function GetAsString:String;     // Obtención del dato en base al tipo
    Function GetAsCombo:String;     // Obtención del dato en base al tipo
    Function GetAsInteger:LongInt;
    Function GetAsFloat:Double;
    Function GetAsBoolean:Boolean;
    Function GetAsDateTime:TDateTime;
    Function GetAsSQL:String;
    Procedure SetControl(T:TControl); // Asigna el control Dependiendo de ControlState
    Function  GetControl:TControl;    // Obtiene el Control Dependiendo de ControlState
    Function GetState:Integer;        // Obtiene el estado
    Procedure SetState(I:Integer);    // Asigna el estado
    Function  GetControlState:Integer;        // Obtiene el estado del Control
    Procedure SetControlState(I:Integer);    // Asigna el estado del Control
    Procedure DrawControl;            // Asigna el valor del campo (dependiendo del State) al control
    Procedure FieldsClear;            // Limpia valor de campo
    Procedure FieldsSend;             // Copia valor de ValorActual a ValorNuevo
    Procedure FieldsReceive;          // Copia valor de ValorNuevo a ValorActual
    Procedure GetFromControl;         // Asigna el valor del control al campo (dependiendo del State)
    Function IsParentOK:Boolean;      // Determina si el Padre existe y está activo
    Procedure ComboChange;
    Function  ValidateRequiered:Boolean;
    Procedure LoadComboDatos(SQL:String; DefaultValue:Integer);
  published
    Property Tipo:TFieldType read FTipo Write FTipo;  // Tipo del dato
    Property Nombre:String read FNombre Write FNombre;  // Nombre del campo
    Property Parametro:String read FParametro Write FParametro;  // Nombre del campo
    Property State:Integer read GetState; // Write SetState;  // Estado actual del campo
    Property Control:TControl Read GetControl Write SetControl; // Control asignado
    Property AsString:String Read GetAsString    Write SetAsString ; // Casting en base al tipo de dato
    Property AsCombo:String Read GetAsCombo; // Casting en base al tipo de dato
    Property AsInteger:LongInt  Read GetAsInteger    Write SetAsInteger ;
    Property AsFloat:Double  Read GetAsFloat    Write SetAsFloat ;
    Property AsBoolean:Boolean  Read GetAsBoolean    Write SetAsBoolean ;
    Property AsDateTime:TDateTime  Read GetAsDateTime    Write SetAsDateTime ;
    Property AsSQL:String Read GetAsSQL;
    Property OnChange:TNotifyEvent Read FOnChange Write FOnChange; // Evento de cambio
    Property OnValidateRequiered:TValidateRequieredEvent Read FOnValidateRequieredEvent Write FOnValidateRequieredEvent; // Evento de cambio
    property Size:Integer Read fSize write fSize; // Longitud del campo
    Property ReadFromQuery:Boolean Read FReadFromQuery Write FReadFromQuery; // Determina si se utiliza Query para el campo
    Property ControlState:Integer Read GetControlState Write SetControlState; // Determina que Serie de Controles debe de  Usar
    Property MasterField:String Read FMasterField Write FMasterField; // Campo de Master Source
    Property ComboDatos:TStringList Read FComboDatos Write FComboDatos;
    Property ComboLista:TStringList Read FComboLista Write FComboLista;
    Property UseCombo:Boolean Read FUseCombo Write SetUseCombo;
    Property IsNull:Boolean Read GetIsNull Write SetIsNull;
    Property IsRequiered:Boolean Read FIsRequiered Write FIsRequiered default false;
    Property Caption:String Read FCaption Write FCaption;
    Property NoClear:Boolean Read FNoClear Write FNoClear;
    Property NoNull:Boolean Read FNoNull Write FNoNull;
    Property NoCompare:Boolean Read FNoCompare Write FNoCompare;
    Property NoSave:Boolean Read FNoSave Write FNoSave;
    Property IsLongData:Boolean Read FIsLongData Write FIsLongData;
    PRoperty TipoReader:TTipoReader Read FTipoReader Write FTipoReader;
 end;

(*******************************************************************INTERFRAME****)
(*                                                                               *)
(*    INTERFRAME                                                                 *)
(*                                                                               *)
(*******************************************************************INTERFRAME****)

  TOnMenuEjecuta=Procedure(Sender:TObject; Tag:Integer) of Object;
  TOnMenuOpciones=Function(Sender:TObject; Posicion:Integer; Var Titulo:String; Var Enabled,Visible:Boolean):Boolean of Object;
  TOnProcesoEvent=Procedure(Sender:TObject; Modo:TModo; Proceso:Integer; Frame:TInterFrame) of Object;

  TInterFrame = class(TBaseInterFrame)
  private
    FTInLocaliza :Boolean;
    FState:Integer; // Estado del Frame (State = 0 o 1)
    FControlState:Integer; // Estado del Control (ControlState = 0 o 1)
    FDataBaseName:String; // El nombre del DataBase
    FSessionName:String;  // La Sesión
    FSeguDataBaseName:String; // El nombre del DataBase
    FSeguSessionName:String;  // La Sesión
    FModo:TModo; // Modo del Frame moXXXXX
    FExModo:Integer;
    FPopMenu:TPopupMenu; //PopUpMenu
    FOnMenuEjecuta:TOnMenuEjecuta;
    FOnMenuOpciones:TOnMenuOpciones;
    FShowMenuCatalogo:Boolean; //Muestra Opcion en Menu PopUp
    FShowMenuReporte:Boolean; //Muestra Opcion en Menu PopUp
    FShowMenuClear:Boolean; //Muestra Opcion en Menu PopUp
    FHelpFile:String; // Nombre del archivo de ayuda de la calse
    FShowErrorLocaliza:Boolean; // Genera un Error cuando no localiza el Registro.
    FBuscaWhereString:String;  // Where String Agregado al Find It del Evento Busca;
    FClearIfNotFound:Boolean; //Bandera para Limpiar el Objeto si no Tiene Datos.
    FFilterBy: Integer; //Variable que indica el filtro para los datos del objeto.
    FApli:TInterApli;  // Variable de Aplicacion General
    FMasterSource:TInterFrame;
    FListMasterSource:TList;
    FStpName:String; // Nombre del STP utilizado en LOCALIZA para Store PRocedures
    FStpMoName:String; // Nombre del STP utilizado en LOCALIZA para Store PRocedures
    FStpAlName:String; // Nombre del STP utilizado en LOCALIZA para Store PRocedures
    FStpBaName:String; // Nombre del STP utilizado en LOCALIZA para Store PRocedures
    FFilterString:String;
    FDebug:Boolean;
    FMasterSourceEditControl:TControl;
    FMasterSourceEnabled:Boolean;
    FMasterSourceReadOnly:Boolean;
    FOnDespuesBusca:TNotifyEvent;
    FOnAfterLocaliza:TNotifyEvent;
    FOnBeforeCatalogo:TMuestraCatalogoEvent;
    FOnAfterCatalogo:TNotifyEvent;
    FOnProceso:TOnProcesoEvent;
    FShowAll:Boolean;
    FInternalDataBase:TDataBase;
    FDummi:TQuery;
    FFrameParam:TInterFrame;
    FAutoRefresh:Boolean;
    FOnChecaAcceso:TOnChecaAccesoEvent;
  protected
    UseQuery:Boolean;  // Determina si el frame usa Query
    FTransList:TList;  // Lista de objetos InterCampos
    FUseTrans:Boolean; //
    FQuery:TQuery;     // Query de default
    FTable:TTable;     // Para uso futuro
    FTableName:String; // Para uso futuro
    FSQL:String;       // Para uso futuro
    FAskDelete: Boolean;  // Bandera para confirmar delete
    FInterFun:TInterFun;    // Componente de Funcion para Seguridades;
    FCvePerfil:LongInt;     // Determina el Perfil de Acceso para Seguridades;
    OldActive:Boolean;      // Bandera del Estado Anterior antes de un Append o Edit.
    FInternalDataSource:TDataSource; // Aplicaciones futuras
    FQueryRequestLive:Boolean;
    FLinkReadOnly:Boolean;
    Procedure SetActive(B:Boolean); override;// Asigna el estado Activo
    Function GetActive:Boolean;     override;// Obtiene el estado Activo
    procedure Notification( AComponent : TComponent; Operation : TOperation); override;
    Procedure SetCvePerfil(I:Integer); Virtual;// Asigna el Perfil y Verifica Acceso para el Perfil;
    Procedure SetApli(eApli:TInterApli);
    Procedure SetMasterSource(Frm:TInterFrame);
    Procedure AddMasterSource(Frm:TInterFrame);
    Procedure RemoveMasterSource(Frm:TInterFrame);
    Procedure SetTableName(TabNam:String);
    Procedure SetFrameParam(Param:TInterFrame);
    Function  GetNotificador:TInterNotificador; override;
  public
    FFields:TList;     // Lista de objetos InterCampos
    FIsNewData:Boolean;
    FTransModo:TModo;
    FTransAutoAppend:Boolean;
    FKeyFields:TStringList; // Lista de nombres de llave
    FPrefijo:String;
    FStpRespuesta:String;
    IsCorp:Boolean;
    IsCheckSecu:Boolean;
    FastVal:String;
    FastField:String;
    FastWait:Boolean;
    FastAutoSelect:Boolean;
    NotFoundInactive:Boolean;
    UseLink:Boolean; // Usa Links Automaticos
    MacroCase:Integer;
    HTMLBody:String;
    Procedure  SetCampo(NombreCampo:String; Valor:String); override;
    Function   GetCampo(NombreCampo:String):String; override;
    Function   GetApApli:TObject; Override;
    Function   GetLastDateTime:TDateTime; override;
    Function FieldByName(NombreCampo:String):TInterCampo; // Obtener el campo en base al nombre
    Function GetFields(Index:Integer):TInterCampo; // Obtiene el campo n de la lista (FFields)
    Procedure SetFields(Index:Integer; Dato:TInterCampo); // Asigna el campo n de la lista (FFields)
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    Function StpPrepara(StpNombre:String; TipoStp:LongInt):TStoredProc; // Crea y asigna los parámetros del Store Procedure
    Function StpEjecuta(Stp:TStoredProc; TipoStp:LongInt):Boolean; // Ejecuta y obtiene parámetros del Store Procedure Siempre Destruye STP
    Function InternalStpEjecuta(Stp:TStoredProc; TipoStp:LongInt; Destruye:Boolean):Boolean; // Ejecuta y obtiene parámetros del Store Procedure Determina si Destruye o no el STP
    Function InternalEdit:Boolean; virtual; // Proceso interno de Edit
    Function InternalPost:Boolean; virtual; // Proceso interno de Post
    Function InternalCancel:Boolean; virtual; // Proceso interno de Cancel
    Function InternalDelete:Boolean; virtual; // Proceso interno de Delete
    Function InternalAppend:Boolean; virtual; // Proceso interno de Append
    function InternalConsulta:Boolean; virtual; // Consulta el registro actual del objeto
    Function InternalBusca:Boolean; virtual; // Buscar un Registro del Objeto.
    function InternalRefresh:Boolean; virtual; // Utiliza Localiza para Encontrar el Registro Actual
    function InternalCatalogo:Boolean; Virtual; // Proceso Interno de Catálogo.
    function InternalLocaliza:Boolean; Virtual; // Proceso Interno de Localización
    function ValidaLocaliza:Boolean; Virtual; // Proceso de Validación STP de Localización
    Procedure GetParams(Origen:TInterFrame);
    Procedure InsertQuery; virtual;
    Function  InternalInsertQuery:String; virtual;
    Procedure UpdateQuery; virtual;
    Function  InternalUpdateQuery:String; virtual;
    Procedure DeleteQuery; virtual;
    Function  InternalDeleteQuery:String; virtual;
    Function  SetWhere(Const Llave:Array of Const):String; // Genera una sentencia en base a la llave, para el Query
    procedure Edit; override; // Evento de Edit, prepara el frame y ejecuta el InternalEdit
    procedure Post; override; // Evento de Post, prepara el frame y ejecuta el InternalPost
    procedure Cancel; override; // Evento de Cancel, prepara el frame y ejecuta el InternalCancel
    procedure Append; override; // Evento de Append, prepara el frame y ejecuta el InternalAppend
    procedure Delete; override; // Evento de Delete, prepara el frame y ejecuta el InternalDelete
    procedure OldEdit; virtual; // Evento de Edit, prepara el frame y ejecuta el InternalEdit
    procedure OldPost; virtual; // Evento de Post, prepara el frame y ejecuta el InternalPost
    procedure OldCancel; virtual; // Evento de Cancel, prepara el frame y ejecuta el InternalCancel
    procedure OldAppend; virtual; // Evento de Append, prepara el frame y ejecuta el InternalAppend
    procedure OldDelete; virtual; // Evento de Delete, prepara el frame y ejecuta el InternalDelete
    procedure Refresh;virtual; // Evento de Refresh
    function Nuevo:Boolean; virtual; // Crea un registro
    function Modifica:Boolean; virtual; // Modifica el registro actual del objeto
    function Elimina:Boolean; virtual; // Elimina el registro actual del objeto
    function Busca:Boolean; override; // Busca un registro del objeto
    function Help:Boolean; override; // Ayuda
    function IniciaLocaliza:Boolean; virtual; // Inicia Proceso de Localizacion
    function Localiza:Boolean; virtual; // Localiza un registro del objeto
    function Consulta:Boolean; virtual; // Consulta el registro actual del objeto
    function Catalogo:Boolean; override; // Muestra Ventana como Catálogo
    procedure FieldsClear; // Limpia los campos en base al State
    Procedure FieldsSend; // Copia todos los campos de ValorActual a ValorNuevo
    Procedure FieldsReceive; // Copia todos los campos de ValorNuevo a ValorActual
    Procedure GetFromControl; // Asigna los valores de los controles a los campos (dependiendo del State)
    Procedure DrawControl;
    Property  FDataSource:TDataSource Read FInternalDataSource; // Para uso futuro
    Function CreaCampo(eNombreCampo:string; eTipo:TFieldType; eStpEntrada,eStpSalida:LongInt;
                       eReadFromQuery:Boolean):TInterCampo; // Agrega un nuevo InterCampo al Frame en base a los parámetros
    Function CreaBuscador(eFileName:String; eTiposDatosDefault:String):TInterFindIt; // Crea y asigna parámetros al buscador
    Function CreaQuery(SQL:String; RequestLive:Boolean):TQuery; // Crea y asigna parámetros al Query
    {------------------------------------------------}
    Function ValidaAccesoEsp(pTipoAcc:String; pMensaje:Boolean; pBitacora:Boolean):Boolean;
    {------------------------------------------------}
    procedure OnPopup(Sender: TObject);
    Procedure OnMenuClick(Sender: TObject);
    Function  MenuOpciones(Posicion:Integer; Var Titulo:String; Var Enabled,Visible:Boolean):Boolean; Virtual;
    Procedure MenuEjecuta(Tag:Integer); Virtual;
    Procedure InternalMenuEjecuta(Tag:Integer);
    Function  InternalMenuOpciones(Posicion:Integer; Var Titulo:String; Var Enabled,Visible:Boolean):Boolean;
    Procedure MuestraMain;
    Function  CreateQueryEmpty:TQuery; Virtual; // Function que Crea un Query Sin Datos o Datos Nulos para despues hacer un Insert!!!
    function  LocalizaVacio:TQuery; Virtual; // Para CreaQueryEmpty;
    Function  Reporte:Boolean; Virtual;
    Property  State:Integer Read FState Write FState; // Estado para ValorActual y ValorNuevo
    Property  ControlState:Integer Read FControlState Write FControlState; // Estado para ValorActual y ValorNuevo
    Property  Modo:TModo Read FModo Write FModo; // Modo del Frame moXXXXX
    Property  CvePerfil:LongInt Read FCvePerfil Write SetCvePerfil; // Determina el Perfil de Acceso para Seguridades;
    Property  PopMenu:TPopupMenu  read FPopMenu Write FPopMenu; // Menu PopUp Asignable a los Controles
    Procedure SetDataBaseName(S:String); Virtual;
    Procedure SetSessionName(S:String); Virtual;

    Procedure SetSeguDataBaseName(S:String); Virtual; //DataBaseName para Seguridades
    Procedure SetSeguSessionName(S:String); Virtual;  //SessioName para Seguridades
    Function  ShowWindow(FormaTipo:TFormaTipo):Integer; Virtual; //Presenta Forma de Catálogo.
    Function  FindKey(Const Llave:Array of Const):Boolean; virtual; //override;
    Function  FindKeyNear(Const Llave:Array of Const; Const CamposLlave:Array of Const):Boolean; virtual;
    Procedure SetFilterBy(Filter:Integer); Virtual;
    Procedure LocalizaChange;
    Procedure LocalizaInactiva;
    Procedure LocalizaCurrent; virtual; // Se Ejecuta cuando se Mueve el Registro.
    Procedure LocalizaCambioHijo(Hijo:TInterFrame);
    Procedure DataBaseChange; Virtual;
    Function  ValidaStp:Boolean; Virtual;
    Function  DameUsuario:String; Virtual;
    Function  DameUsuarioID:LongInt; Virtual;
    Function  DameEmpresa:String; Virtual;
    Procedure LimpiarRegistro; Virtual;
    Procedure CheckRequiered; Virtual;
    Property Active:Boolean Read GetActive Write SetActive; // Estado activo de
    Property Fields[Index:Integer]:TInterCampo read GetFields Write SetFields; // Lista de campos
    Property DataBaseName:String Read FDataBaseName Write SetDataBaseName; // Nombre de la Base de Datos
    Property SessionName:String Read FSessionName Write SetSessionName; // Nombre de la Sesión
    Property SeguDataBaseName:String Read FSeguDataBaseName Write SetSeguDataBaseName; // Nombre de la Base de Datos
    Property SeguSessionName:String Read FSeguSessionName Write SetSeguSessionName; // Nombre de la Sesión
    Property TableName:String Read FTableName Write SetTableName; // Para uso futuro
    Property SQL:String Read FSQL Write FSQL; // Para uso futuro
    Property AskDelete:Boolean Read FAskDelete Write FAskDelete; // Bandera para confirmar delete
    Property ShowErrorLocaliza:Boolean Read FShowErrorLocaliza Write FShowErrorLocaliza; // Bandera para Generar un Error cuando no localiza el Registro.
    Property ClearIfNotFound:Boolean Read FClearIfNotFound Write FClearIfNotFound; // Bandera para Limpiar el Objeto si no Tiene Datos.
    Property ShowMenuCatalogo:Boolean Read FShowMenuCatalogo Write FShowMenuCatalogo; //Muestra la Opcion en el Menu PopUp
    Property ShowMenuReporte:Boolean Read FShowMenuReporte Write FShowMenuReporte; //Muestra la Opcion en el Menu PopUp
    Property ShowMenuClear:Boolean Read FShowMenuClear Write FShowMenuClear; //Muestra la Opcion en el Menu PopUp
    Property HelpFile:String read FHelpFile Write FHelpFile; // Nombre del archivo para ayuda
    Property OnMenuEjecuta:TOnMenuEjecuta read FOnMenuEjecuta Write FOnMenuEjecuta; // Determina como que ejecuta cada Opcion del Menu PopUp
    Property OnMenuOpciones:TOnMenuOpciones Read FOnMenuOpciones Write FOnMenuOpciones; // Determina que Opciones Aparecen en el Menu PopUp ADICIONALES
    Property BuscaWhereString:String Read FBuscaWhereString Write FBuscaWhereString;  // Where String Agregado al Find It del Evento Busca;
    property FilterBy: Integer Read FFilterBy write SetFilterBy; //Variable que indica el filtro para los datos del objeto.
    Property MasterSource:TInterFrame Read FMasterSource Write SetMasterSource;
    Property MasterSourceEditControl:TControl Read FMasterSourceEditControl Write FMasterSourceEditControl;
    Property MasterSourceEnabled:Boolean Read FMasterSourceEnabled Write FMasterSourceEnabled;
    Property MasterSourceReadOnly:Boolean Read FMasterSourceReadOnly Write FMasterSourceReadOnly;
    Property StpName:String Read FStpName Write FStpName; // Nombre del STP utilizado en LOCALIZA para Store PRocedures
    Property StpMoName:String Read FStpMoName Write FStpMoName; // Nombre del STP utilizado en LOCALIZA para Store PRocedures
    Property StpAlName:String Read FStpAlName Write FStpAlName; // Nombre del STP utilizado en LOCALIZA para Store PRocedures
    Property StpBaName:String Read FStpBaName Write FStpBaName; // Nombre del STP utilizado en LOCALIZA para Store PRocedures
    Property FilterString:String Read FFilterString Write FFilterString;
    Property Debug:Boolean Read FDebug Write FDebug;
    Property ShowAll:Boolean Read FShowAll Write FShowAll;
    Procedure SaveDebugInfo(Evento:String);
    Procedure RefreshAccess;
    Property QueryRequestLive:Boolean read FQueryRequestLive Write FQueryRequestLive default True;
    Property FrameParam:TInterFrame Read FFrameParam Write SetFrameParam;
    Property AutoRefresh:Boolean Read FAutoRefresh Write FAutoRefresh;

    Function  TransSave(Final:Boolean):Boolean; virtual;
    Procedure TransRollBack; virtual;
    Procedure TransCommit;   virtual;
    Procedure TransBegin;    virtual;
    Procedure TransAppend;   virtual;
    Procedure TransEdit;     virtual;
    Procedure TransDelete;   virtual;
    Procedure TransPost;     virtual;
    Procedure TransCancel;   virtual;
    Procedure FieldsCopy(Origen:TInterFrame); virtual;
    Function  FieldExists(NombreCampo:String):Boolean;

    Procedure EvHijoFind(Hijo:TInterFrame); Virtual;
    Procedure EvPrevHijoFind(Hijo:TInterFrame); Virtual;
    Function  GetQuery(SQL:String; ShowError:Boolean):TQuery;
    Procedure AsignaControl(FieldName:String; Control:TControl);
  published
    Property Apli:TInterApli Read FApli Write SetApli;
    Property OnDespuesBusca:TNotifyEvent Read FOnDespuesBusca Write FOnDespuesBusca;
    Property OnAfterLocaliza:TNotifyEvent Read FOnAfterLocaliza Write FOnAfterLocaliza;
    Property OnAfterCatalgo:TNotifyEvent Read FOnAfterCatalogo Write FOnAfterCatalogo;
    Property OnBeforeCatalogo:TMuestraCatalogoEvent Read FOnBeforeCatalogo Write FOnBeforeCatalogo;
    Property OnProceso:TOnProcesoEvent Read FOnProceso Write FOnProceso;
    Procedure LinkitCapture(Sender:TObject; Var Show:Boolean); virtual;
    Procedure OnLinkitExecute(Sender:TObject); Virtual;
    Function  LinkitExecute(Sender:TObject):Boolean; Virtual;
    Property  LinkReadOnly:Boolean Read FLinkReadOnly Write FLinkReadOnly;
    Procedure LinkitCaptureChild(Sender:TObject; Var Show:Boolean);
    Function  LinkFindKey(Key:String):Boolean; Virtual;
    Procedure InternalFindKey(Objeto:TInterFrame; Var Ejecuta:Boolean); Virtual;
    Function  CheckBusca:Boolean;
    Procedure PrintReporte(Preview:Boolean; TodosLosRegistros:Boolean); Virtual;
    Function  GetChildByControl(Control:TControl):TInterFrame;
    Function  ChecaAcceso(Muestra:Boolean):Boolean;
    Property  OnChecaAcceso:TOnChecaAccesoEvent Read FOnChecaAcceso Write FOnChecaAcceso;
end;

Procedure Register;

Procedure StartInterFrameDebug;

Function CreateFromDll(ClassName:String; Apli:TInterApli):TInterFrame;

Procedure ShowCat(T:TInterFrame; Apli:TInterApli);

Procedure ShowCatParam(T:TInterFrame; Apli:TInterApli; FrameParam:TInterFrame);

Procedure ShowCatParamFilter(T:TInterFrame; Apli:TInterApli; FrameParam:TInterFrame; Filter:Integer);

Procedure DrawFrame(Frame:TinterFrame; Campo:String; Control:TControl);

implementation

Procedure DrawFrame(Frame:TinterFrame; Campo:String; Control:TControl);
begin if Frame=nil then Exit;
      if Control=nil then Exit;
      if Control is TLabel then TLabel(Control).Caption:=Frame.FieldByName(CAMPO).AsString;
      if Control is TPanel then TPanel(Control).Caption:=Frame.FieldByName(CAMPO).AsString;
      if Control is TEdit  then TEdit(Control).Text:=Frame.FieldByName(CAMPO).AsString;
      if Control is TInterEdit  then TInterEdit(Control).Text:=Frame.FieldByName(CAMPO).AsString;
end;

Function MacvStrToDateTime(S:String):String;
var D:TDateTime;
begin D:=StrToDateTime(S);
      if FormatDateTime('HH:MM:SS',D)='00:00:00'
      then MacvStrToDateTime:=FormatDateTime(ToFecha,D)
      else MacvStrToDateTime:=FormatDateTime(ToFechaHora,D);
end;

Procedure ShowCat(T:TInterFrame; Apli:TInterApli);
begin Try T.Apli:=Apli;
          T.Catalogo;
      Finally
      if T<>nil then T.Free;
      end;
end;

Procedure ShowCatParam(T:TInterFrame; Apli:TInterApli; FrameParam:TInterFrame);
begin Try T.Apli:=Apli;
          T.FrameParam:=FrameParam;
          T.Catalogo;
      Finally
      if T<>nil then T.Free;
      end;
end;

Procedure ShowCatParamFilter(T:TInterFrame; Apli:TInterApli; FrameParam:TInterFrame; Filter:Integer);
begin Try T.Apli:=Apli;
          T.FilterBy:=Filter;
          T.FrameParam:=FrameParam;
          T.Catalogo;
      Finally
      if T<>nil then T.Free;
      end;
end;

Constructor TFrameList.Create;
begin FFrame :=TList.Create;
      FFrame.Clear;
      FNombre:=TStringList.Create;
      FNombre.Clear;
      Apli:=nil;
      Msg:=nil;
      Padre:=nil;
      FActive:=True;
end;

Function  TFrameList.GetActive:Boolean;
begin Result:=FActive;
end;

Procedure TFrameList.SetActive(B:Boolean);
begin FActive:=B;
end;

Destructor  TFrameList.Destroy;
begin if FFrame<>nil then FFrame.Free; FFrame:=nil;
      if FNombre<>nil then FNombre.Free; FNombre:=nil;
end;

Procedure TFrameList.AddMsg(S:String);
begin  if Msg<>nil
       then begin if Msg.Lines.Count>50 then if Msg<>nil then Msg.Lines.Delete(0);
                  if Msg<>nil then Msg.Lines.Add(S);
            end;
end;

Procedure TFrameList.Clear;
begin FNombre.Clear;
      FFrame.Clear;
end;

Function TFrameList.GetAssign:TFrameList;
var i:Integer;
    R:TFrameList;
begin Result:=nil;
      R:=TFrameList.Create;
      R.Apli:=Apli;
      R.Msg:=Msg;
      for i:=0 to FNombre.Count-1 do
      begin R.Add(FNombre.Strings[i],FFrame[i]);
      end;
      Result:=R;
end;

Procedure TFrameList.Add(Nom:String; Fre:TObject);
begin  FFrame.Add(Fre); FNombre.Add(Nom);
end;

Function  TFrameList.GetCampo(Nombre:String; Campo:String):String;
var i,j:Integer;
    F:TInterFrame;
    Obj:TObject;
    Ds:TDataSet;
begin Result:='';
      for i:=0 to FNombre.Count-1 do
      begin if Trim(UpperCase(FNombre[i]))=Trim(UpperCase(Nombre))
            then begin Obj:=FFrame[i];
                       if Obj is TInterFrame
                       then begin F:=TInterFrame(FFrame[i]);
                                  Result:=F.GetCampo(Campo);
                                  Exit;
                            end
                       else
                       if Obj is TDataSet
                       then begin Ds:=TDataSet(FFrame[i]);
                                 J:=Ds.FieldDefs.IndexOf(Campo);
                                 if J>=0 then Result:=Ds.FieldByName(Campo).AsString;
                                 Exit;
                            end;
                 end;
      end;
end;

Function  TFrameList.GetFrame(Nombre:String):TInterFrame;
var i:Integer;
    Obj:TObject;
    Ds :TDataSet;
begin Result:=nil;
      for i:=0 to FNombre.Count-1 do
      begin if Trim(UpperCase(FNombre[i]))=Trim(UpperCase(Nombre))
            then begin Obj:=FFrame[i];
                       if Obj is TInterFrame
                       then begin Result:=TInterFrame(FFrame[i]);
                                  Exit;
                            end;
                 end;
      end;
end;


Function  TFrameList.GetQuery(Nombre:String):TQuery;
var i,j:Integer;
    Obj:TObject;
    Ds :TDataSet;
begin Result:=nil;
      for i:=0 to FNombre.Count-1 do
      begin if Trim(UpperCase(FNombre[i]))=Trim(UpperCase(Nombre))
            then begin Obj:=FFrame[i];
                       if Obj is TQuery
                       then begin Result:=TQuery(FFrame[i]);
                                  Exit;
                            end;
                 end;
      end;
end;

Constructor EInterFrame.Create(Const Msg:String);
begin Inherited Create(#30+Msg);
end;

Function CreateFromDll(ClassName:String; Apli:TInterApli):TInterFrame;
Type TFn=Procedure (DataBaseName,SessionName,SeguDataBaseName,SeguSessionName:String; CvePerfil:Integer);

Var  Fn:TFn;
var  Hnd:THandle;
     FileName:String;
     p:Pointer;

begin CreateFromDll:=nil;
      FileName:='C:\'+ClassName+'.DLL';
      Hnd:=LoadLibrary(pchar(FileName));
      if Hnd<32 then begin ShowMessage('Imposible Inicializar el DLL '+FileName); exit; end;
      Try @Fn:=GetProcAddress(Hnd,'CREATECLASS');
          if @Fn<>nil then Fn(Apli.DataBaseName,Apli.SessionName,Apli.SeguDataBaseName,Apli.SeguSessionName, Apli.ClasePerfil);
      Finally FreeLibrary(Hnd);
      end;
end;

(*******************************************************************INTERFRAME****)
(*                                                                               *)
(*    INTERFRAME                                                                 *)
(*                                                                               *)
(*******************************************************************INTERFRAME****)

// Registro de componentes
procedure Register;
begin
end;

Function  TInterFrame.ChecaAcceso(Muestra:Boolean):Boolean;
var Resultado:Boolean;
begin if Assigned(OnChecaAcceso)
      then begin FOnChecaAcceso(Self,FInterFun,Muestra,Resultado);
                 Result:=Resultado
           end
      else begin Result:=FInterFun.ChecaAcceso(Muestra);
           end;
end;

Function TInterFrame.ValidaAccesoEsp( pTipoAcc:String; pMensaje:Boolean; pBitacora:Boolean):Boolean;
begin
    Result := FInterFun.ValidaAccesoEsp( Apli, pTipoAcc, pMensaje, pBitacora );
end;


Function TInterFrame.GetQuery(SQL:String; ShowError:Boolean):TQuery;
begin Result:=GetSqlQuery(SQL,DataBaseName,SessionName,ShowError);
end;

Procedure TInterFrame.SetFrameParam(Param:TInterFrame);
var i:Integer;
    OldParam:TInterFrame;
    NewParam:TInterFrame;
begin OldParam:=FrameParam;
      NewParam:=Param;
      FFrameParam:=Param;
      for i:=0 to FListMasterSource.Count-1 do
      begin if TInterFrame(FListMasterSource.Items[i]).FrameParam=OldParam
            then TInterFrame(FListMasterSource.Items[i]).FrameParam:=NewParam;
      end;
end;

Procedure TInterFrame.LinkitCapture(Sender:TObject; Var Show:Boolean);
var i:Integer;
begin Show:=False;
      if FLinkReadOnly=True then Exit;
      if MasterSource=nil
         then begin if (Modo=moEdit) or (Modo=moAppend)
                    then begin if Sender is TInterLinkit
                               then begin Show:=(GetChildByControl(TInterLinkit(Sender).Control)<>nil);
                                    end
                               else Show:=False;
                         end
                    else Show:=True;
              end
         else begin if ((MasterSource.Modo=moEdit) or (MasterSource.Modo=moAppend) )
                    then begin if (MasterSource.MasterSourceEditControl<>nil)
                               then begin Show:=(MasterSource.MasterSourceEditControl.Enabled);
                                    end
                               else Show:=True;
                        end;
              end;
end;

Procedure TInterFrame.LinkitCaptureChild(Sender:TObject; Var Show:Boolean);
begin Show:=False;
      if FLinkReadOnly=True then Exit;
      if MasterSource=nil
         then begin if (Modo=moEdit) or (Modo=moAppend)
                    then Show:=True;
              end
         else begin if (MasterSource.Modo=moEdit) or (MasterSource.Modo=moAppend)
                    then Show:=True;
              end;
end;

Function  TInterFrame.GetChildByControl(Control:TControl):TInterFrame;
var i,j,k:Integer;
    Campo:TInterCampo;
    Hijo:TInterFrame;
    StrCampo:String;
begin Result:=nil;
      if Control=nil then exit;
      For i:=0 to FFields.Count-1 do
      begin Campo:=TInterCampo(FFields[i]);
            if Campo.Control=Control
            then begin StrCampo:=Campo.Nombre;
                       for k:=0 to FListMasterSource.Count-1 do
                       begin Hijo:=TInterFrame(FListMasterSource.Items[k]);
                             For j:=0 to Hijo.FFields.Count-1 do
                                if (Hijo.Fields[j].MasterField<>'') and (Hijo.Fields[j].MasterField=StrCampo) and (Hijo.FKeyFields.Count=1)
                                 then begin Result:=hijo;
                                            Exit;
                                      end;
                       end;
                 end;
      end;
      Result:=nil;
end;

Function TInterFrame.CheckBusca:Boolean;
var Ejecuta:Boolean;
begin Result:=False;
      Ejecuta:=True;
      if MasterSource<>nil
      then MasterSource.InternalFindKey(Self,Ejecuta)
      else InternalFindKey(Self,Ejecuta);
      Result:=Ejecuta;
end;

Procedure TInterFrame.InternalFindKey(Objeto:TInterFrame; Var Ejecuta:Boolean);
begin
end;


Function TInterFrame.LinkFindKey(Key:String):Boolean;
var OldFilter:String;
begin Result:=False;
      if Key='' then Exit;
      OldFilter:=FFilterString;
      Try if BuscaWhereString <>''
          then begin AddSQL(FFilterString,BuscaWhereString);
               end;
          if CheckBusca then Result:=FindKey([Key]);
      Finally FFilterString:=OldFilter;
      end;
end;

Procedure TInterFrame.OnLinkitExecute(Sender:TObject);
begin LinkitExecute(Sender);
end;

Function TInterFrame.LinkitExecute(Sender:TObject):Boolean;
Var OldState:Boolean;
    Campo:String; ChildFrame:TInterFrame;
begin Result:=False;
      OldState:=NotFoundInactive;
      NotFoundInactive:=False;
      if (Modo=moAppend) or (Modo=moEdit)
      then begin ChildFrame:=GetChildByControl(TInterLinkit(Sender).Control);
                 if ChildFrame<>nil
                 then Result:=ChildFrame.LinkFindKey(TInterLinkit(Sender).Buffer);
           end
      else Result:=LinkFindKey(TInterLinkit(Sender).Buffer);
      NotFoundInactive:=OldState;
end;

Procedure TInterFrame.EvHijoFind(Hijo:TInterFrame);
begin
end;

Procedure TInterFrame.EvPrevHijoFind(Hijo:TInterFrame);
begin
end;

Procedure TInterFrame.MuestraMain;
begin
end;

Procedure  TInterFrame.SetCampo(NombreCampo:String; Valor:String);
begin FieldByName(NombreCampo).AsString:=Valor;
end;

Function   TInterFrame.GetCampo(NombreCampo:String):String;
begin Result:=FieldByName(NombreCampo).AsString;
end;

Function   TInterFrame.GetApApli:TObject;
begin Result:=Apli;
end;

Function  TInterFrame.GetLastDateTime:TDateTime;
begin if Apli=nil
      then Result:=0
      else Result:=Apli.LastFechaHora;
end;


Function TInterFrame.DameUsuario:String;
begin
   if (Apli<>nil)and(Apli.Active) and (Trim(Apli.Usuario)<>'')
      then begin DameUsuario:=Apli.Usuario;
           end
      else DameUsuario:=ObtenUsuario;
end;

Function TInterFrame.DameUsuarioID:LongInt;
begin if (Apli<>nil)and(Apli.Active) and (Trim(Apli.Usuario)<>'')
      then begin DameUsuarioID:=Apli.UsuarioID;
           end
      else begin DameUsuarioID:=-1; //ObtenUsuario;

           end;
end;

Function TInterFrame.DameEmpresa:String;
begin if (Apli<>nil)and(Apli.Active)
      then begin DameEmpresa:=IntToStr(Apli.IdEmpresa);
           end
      else DameEmpresa:='1';
end;

// Notificacion de creación y destrucción de componentes
procedure TInterFrame.Notification( AComponent : TComponent; Operation : TOperation);
begin inherited Notification( AComponent, Operation );
      if (Operation=opRemove) and (AComponent=FApli) then Fapli:=nil;
      if (Operation=opRemove) and (AComponent=FMasterSourceEditControl)
         then FMasterSourceEditControl:=nil;
end;

// Obtiene el campo en base al nombre
// Recorre la lista de campos FFields
Function TInterFrame.FieldByName(NombreCampo:String):TInterCampo;
var i:Integer;
begin FieldByName := Nil;
      NombreCampo:=NombreCampo;
      for i:=0 to FFields.Count-1  do
      begin if TInterCampo(FFields.Items[i]).Nombre=NombreCampo
               then begin FieldByName:=TInterCampo(FFields.Items[i]);
                          Exit;
                    end;
      end;
      Raise EInterFrame.Create('['+ClassName+'] Campo No Existe '+NombreCampo);
end;

Function TInterFrame.FieldExists(NombreCampo:String):Boolean;
var i:Integer;
begin FieldExists:=False;
      NombreCampo:=NombreCampo;
      for i:=0 to FFields.Count-1  do
      begin if TInterCampo(FFields.Items[i]).Nombre=NombreCampo
               then begin FieldExists:=True;
                          Exit;
                    end;
      end;
      FieldExists:=True;
end;

// Crea el objeto InterFrame
constructor TInterFrame.Create( AOwner : TComponent );
begin inherited Create(AOwner);
      IsCheckSecu:=True;
      FFields:=TList.Create;
      FFields.Clear;
      FKeyFields:=TStringList.Create;
      FKeyFields.Clear;
      FListMasterSource:=TList.Create;
      FListMasterSource.Clear;
      fModo := moInActive;
      FQuery:=Nil;
      FTable:=Nil;
      FTableName:='';
      FSQL:='';
      FBuscaWhereString:='';
      FHelpFile:='IntFrame.hlp';
      FInternalDataSource:=TDataSource.Create(Self);
      FAskDelete := True;
      FInterFun:=TInterFun.Create(Self);
      FInterFun.ValidaFrame:=True;
      PopMenu:=TPopupMenu.Create(Self);
      PopMenu.OnPopUp:=OnPopUp;
      FShowMenuCatalogo:=True;
      FShowMenuReporte:=False;
      FShowMenuClear:=False;
      FShowErrorLocaliza:=True;
      FClearIfNotFound:=False;
      FFilterBy := 0;
      FControlState:=0;
      FSeguDataBaseName:='';
      FSeguSessionName:='';
      FDataBaseName:='';
      FSessionName:='';
      FApli:=nil;
      FStpName:='';
      FFilterString:='';
      FDebug:=False;
      FPrefijo:='P_';
      FShowAll:=False;
      FExModo:=0;
      MasterSourceEditControl:=nil;
      MasterSourceEnabled:=True;
      FMasterSourceReadOnly:=False;
      OnDespuesBusca:=nil;
      FStpRespuesta:='CODRESP';
      IsCorp:=False;
      QueryRequestLive:=False; //True;
      FTransList:=TList.Create;
      FUseTrans:=False;
      FTransAutoAppend:=True;
      FIsNewData:=False;
      FDummi:=nil;

      FastWait:=True;

      FLinkReadOnly:=False;
      UseLink:=False;

      FrameParam:=nil;

      FAutoRefresh:=True;

      FTInLocaliza:=False;
      FNotificador:=nil;
      MacroCase:=0;
      HTMLBody:='';

      if vgUseCheckMem then MemCheckAdd(Self,TableName,TableName);
end;

Function TInterFrame.GetNotificador:TInterNotificador;
begin if FNotificador=nil then FNotificador:=TInterNotificador.Create;
      Result:=FNotificador;
end;

// Destruye el objeto InterFrame
destructor TInterFrame.Destroy;
begin if vgUseCheckMem then MemCheckRemove(Self);

      if FNotificador<>nil then FNotificador.Free;
      if FDummi<>nil then FDummi.Free; FDummi:=nil;
      MasterSource:=nil;
      if FTransList<>nil then FTransList.Free;
      if FInterFun<>nil then FInterFun.Free;
      if FInternalDataSource<>nil then FInternalDataSource.Free;
      if FKeyFields <> nil then FKeyFields.Free;
      if FFields <> nil then FFields.Free;
      if FQuery <> nil then fQuery.Free;
      inherited;
end;


Procedure TInterFrame.AsignaControl(FieldName:String; Control:TControl);
begin FieldByName(FieldName).Control:=Control;
end;



Procedure TInterFrame.SetFilterBy(Filter:Integer);
begin FFilterBy:=Filter;
end;

Procedure TInterFrame.SetTableName(TabNam:String);
begin FTableName:=TabNam;
      StpName  :='STPCO'+TabNam;
      StpMoName:='STPMO'+TabNam;
      StpALName:='STPAL'+TabNam;
      StpBAName:='STPBA'+TabNam;
end;


Procedure TInterFrame.SetMasterSource(Frm:TInterFrame);
begin if MasterSource<>nil then MasterSource.RemoveMasterSource(Self);
      if Frm<>nil then Frm.AddMasterSource(Self);
      FMasterSource:=Frm;
end;

Procedure TInterFrame.AddMasterSource(Frm:TInterFrame);
begin FListMasterSource.Add(Frm);
end;

Procedure TInterFrame.RemoveMasterSource(Frm:TInterFrame);
var I:Integer;
begin I:=FListMasterSource.IndexOf(Frm);
      if (I>=0) then FListMasterSource.Delete(I);
end;


Procedure TInterFrame.SetApli(eApli:TInterApli);
begin if eApli=nil
         then Fapli:=nil
         else begin FApli:=eApli;
                    if (DataBaseName='')
                     then begin if IsCorp then
                                begin DataBaseName:=eApli.SeguDataBaseName;
                                      SessionName :=eApli.SeguSessionName;
                                end
                                else
                                begin DataBaseName:=eApli.DataBaseName;
                                      SessionName :=eApli.SessionName;
                                end;
                                SeguDataBaseName:=eApli.SeguDataBaseName;
                                SeguSessionName :=eApli.SeguSessionName;
                          end;
                     if eApli.Active=False
                     then CvePerfil:=kPerfilSecu
                     else CvePerfil:=FApli.ClasePerfil;
              end;
end;

Procedure TInterFrame.SetDataBaseName(S:String);
begin FDataBaseName:=S;
      SeguDataBaseName:=S;
end;

Procedure TInterFrame.SetSessionName(S:String);
begin FSessionName:=S;
      SeguSessionName:=S;
end;

Procedure TInterFrame.SetSeguDataBaseName(S:String);
begin FSeguDataBaseName:=S;
end;

Procedure TInterFrame.SetSeguSessionName(S:String);
begin FSeguSessionName:=S;
end;

Procedure TInterFrame.DataBaseChange;
var i:Integer;
begin for i:=0 to FListMasterSource.Count-1 do
      begin if TInterFrame(FListMasterSource.Items[i]).IsCorp
            then begin TInterFrame(FListMasterSource.Items[i]).DataBaseName:=SeguDataBaseName;
                       TInterFrame(FListMasterSource.Items[i]).SessionName:=SeguSessionName;
                       TInterFrame(FListMasterSource.Items[i]).SeguDataBaseName:=SeguDataBaseName;
                       TInterFrame(FListMasterSource.Items[i]).SeguSessionName:=SeguSessionName;
                       TInterFrame(FListMasterSource.Items[i]).FApli:=FApli;
                       TInterFrame(FListMasterSource.Items[i]).CvePerfil:=CvePerfil;
                 end
            else begin TInterFrame(FListMasterSource.Items[i]).DataBaseName:=DataBaseName;
                       TInterFrame(FListMasterSource.Items[i]).SessionName:=SessionName;
                       TInterFrame(FListMasterSource.Items[i]).SeguDataBaseName:=SeguDataBaseName;
                       TInterFrame(FListMasterSource.Items[i]).SeguSessionName:=SeguSessionName;
                       TInterFrame(FListMasterSource.Items[i]).FApli:=FApli;
                       TInterFrame(FListMasterSource.Items[i]).CvePerfil:=CvePerfil;
                 end;

          end;
end;

Procedure TInterFrame.RefreshAccess;
begin
  FInterFun.Funcion:='CLASE_'+ClassName;
  FInterFun.InternalConnect('CLASE',FCvePerfil,SeguDataBaseName,SeguSessionName);
  FInterFun.IsCheckSecu:=IsCheckSecu;
  if Not ChecaAcceso(False) then
    Raise EInterFrame.Create('['+ClassName+'] '+FInterFun.GetMsgError);
end;

Procedure TInterFrame.SetCvePerfil(I:Integer); // Asigna el Perfil y Verifica Acceso para el Perfil;
begin FCvePerfil:=I;
      DataBaseChange;
      if vgChecaSeguOnCreate then RefreshAccess;
end;


Procedure TInterFrame.GetParams(Origen:TInterFrame);
begin if Origen.Apli=nil
      then begin DataBaseName:=Origen.DataBaseName;
                 SessionName:=Origen.SessionName;
                 SeguDataBaseName:=Origen.SeguDataBaseName;
                 SeguSessionName:=Origen.SeguSessionName;              
                 CvePerfil:=Origen.CvePerfil;
           end
      else begin DataBaseName:=Origen.DataBaseName;
                 SessionName:=Origen.SessionName;
                 SeguDataBaseName:=Origen.SeguDataBaseName;
                 SeguSessionName:=Origen.SeguSessionName;
                 FApli:=Origen.Apli;
                 if Origen.Apli.Active=False
                 then CvePerfil:=kPerfilSecu
                 else CvePerfil:=Origen.Apli.ClasePerfil;
           end;
end;

Procedure TInterFrame.OnMenuClick(Sender: TObject);
begin if Sender is TMenuItem then InternalMenuEjecuta(TMenuItem(Sender).Tag);
end;

Procedure TInterFrame.LimpiarRegistro;
begin Active:=False;
end;


Function  TInterFrame.MenuOpciones(Posicion:Integer; Var Titulo:String; Var Enabled,Visible:Boolean):Boolean;
begin Case Posicion of
      0:begin Titulo:='Catálogo';  Result:=True;  Enabled:=(FInterFun.Catalogo) and (FInterFun.Consultar) and ( Not FInterFun.Bloqueado); Visible:=ShowMenuCatalogo; end;
      1:begin Titulo:='Reporte';   Result:=True;  Enabled:=(FInterFun.Consultar)and( Not FInterFun.Bloqueado); Visible:=ShowMenuReporte;  end;
      2:begin Titulo:='Limpiar Registro';   Result:=True;  Enabled:=(FInterFun.Consultar) and ( Not FInterFun.Bloqueado);  Visible:=ShowMenuClear;  end;
      else Result:=False;
      end;
end;

Procedure TInterFrame.InternalMenuEjecuta(Tag:Integer);
begin IF Assigned(FOnMenuEjecuta) then FOnMenuEjecuta(Self,Tag) else  MenuEjecuta(Tag);
end;

Function TInterFrame.InternalMenuOpciones(Posicion:Integer; Var Titulo:String; Var Enabled,Visible:Boolean):Boolean;
begin IF Assigned(FOnMenuOpciones) then  InternalMenuOpciones:=FOnMenuOpciones(Self,Posicion,Titulo,Enabled,Visible)
                                   else  InternalMenuOpciones:=MenuOpciones(Posicion,Titulo,Enabled,Visible);
end;

function TInterFrame.ValidaLocaliza:Boolean;
begin ValidaLocaliza:=True;
end;

Procedure TInterFrame.MenuEjecuta(Tag:Integer);
begin Case Tag of
      {0:Busca; 2:Consulta; 3:Nuevo; 4:Modifica; 5:Elimina;}
           0:Catalogo;
           1:Reporte;
           2:LimpiarRegistro;
      end;
end;


Procedure TInterFrame.OnPopUp(Sender: TObject);
Var Menu:TMenuItem;
    Titulo:string;
    Posicion:Integer;
    Visible,Continuar,Enabled:Boolean;
begin if (Apli<>nil)and(Apli.Active=True) then CvePerfil:=Apli.ClasePerfil else CvePerfil:=CvePerfil;
      While (PopMenu.Items.Count)>=1 do
      begin PopMenu.Items.Delete(0);
      end;
      Posicion:=0;
      Enabled:=True; Visible:=True; Titulo:='Sin Asignar';
      Continuar:=InternalMenuOpciones(Posicion,Titulo,Enabled,Visible);
      While Continuar do
      begin if Visible
            then begin Menu:=TMenuItem.Create(Self);
                       Menu.Caption := Titulo;
                       Menu.Enabled:=Enabled;
                       Menu.OnClick:=OnMenuClick;
                       Menu.Tag:=Posicion;
                       PopMenu.Items.Add(Menu);
            end;
            Inc(Posicion);
            Enabled:=True; Visible:=True; Titulo:='Sin Asignar';
            Continuar:=InternalMenuOpciones(Posicion,Titulo,Enabled,visible);
      end;
end;

// Crea y asigna los parámetros del buscador
Function TInterFrame.CreaBuscador(eFileName:String; eTiposDatosDefault:String):TInterFindIt;
var T:TInterFindIt;
begin CreaBuscador:=Nil;
      T:=TinterFindIt.Create(Self);
      T.DataBaseName:=DataBaseName;
      T.SessionName:=SessionName;
      T.SeguDataBaseName:=SeguDataBaseName;
      T.SeguSessionName:=SeguSessionName;
      T.FileName:=UpperCase(eFileName);
      T.FastVal:=FastVal;
      T.FastField:=FastField;
      T.TiposDatosDefault:=eTiposDatosDefault;
      T.WhereString:=FBuscaWhereString;
      T.ShowAll:=ShowAll;
      T.FastWait:=FastWait;
      T.FastAutoSelect:=FastAutoSelect;
      CreaBuscador:=T;
end;

// Crea campo para el Store Procedure en base a los parámetros
Function TInterFrame.CreaCampo(eNombreCampo:string; eTipo:TFieldType;
                                eStpEntrada,eStpSalida:LongInt;
                                eReadFromQuery:Boolean):TInterCampo;
var T:TInterCampo;
begin CreaCampo:=Nil;
      T:=TInterCampo.Create(Self);
      T.Nombre:=eNombreCampo;
      T.Parametro:=FPrefijo+eNOmbreCampo;
      T.Tipo:=eTipo;
      FFields.Add(T);
      T.StpEntrada:=eStpEntrada;
      T.StpSalida :=eStpSalida;
      T.ReadFromQuery:=eReadFromQuery;
      CreaCampo:=T;
end;

(*
Function CreaCampoEx(eNombreCampo:string; eTipo:TFieldType; eStpEntrada,eStpSalida:LongInt;
                       eReadFromQuery:Boolean; eSize:Integer; eCaption, eParametro:String):TInterCampo; // Agrega un nuevo InterCampo al Frame en base a los parámetros
var T:TInterCampo;
begin CreaCampoEx:=Nil;
      T:=TInterCampo.Create(Self);
      T.Nombre:=eNombreCampo;
      if eParametro=''
      then T.Parametro:=FPrefijo+eNOmbreCampo
      else T.Parametro:=eParametro;
      if eCaption<>'' then T.Caption:=eCaption;
      T.Tipo:=eTipo;
      FFields.Add(T);
      T.StpEntrada:=eStpEntrada;
      T.StpSalida :=eStpSalida;
      T.ReadFromQuery:=eReadFromQuery;
      if eSize<>0 then T.Size:=eSize;
      CreaCampo:=T;

end;
*)



// Crea el Query
Function TInterFrame.CreaQuery(SQL:String; RequestLive:Boolean):TQuery;
VAR Q:TQuery;
begin CreaQuery:=Nil;
      if vgUseCheckMem
      then Q:=TCheckMemQuery.CreateMio(nil,SQL)
      else Q:=TQuery.Create(nil);
      //Q:=TQuery.Create(Self);
      Q.Close;
      Q.DataBaseName:=DataBaseName;
      Q.SessionName:=SessionName;
      Q.RequestLive:=RequestLive;
      Q.SQL.Clear;
      Q.SQL.Add(SQL);
      Q.Open;
      CreaQuery:=Q;
end;

Function TInterFrame.GetActive:Boolean;
begin GetActive:=FActive;
end;

Procedure TInterFrame.SetActive(B:Boolean);
var Edo:Integer;
begin FActive:=B;
      if (FActive=False) then
      begin if (UseQuery) then
            begin if FQuery<>nil then FQuery.Free;
                  FQuery:=nil;
            end;
            Edo:=State;
            State:=0;
            FieldsClear;
            State:=1;
            FieldsClear;
            State:=Edo;
            Modo:=moInactive; // CAMBIO NUEVO
            DrawControl;
            LocalizaInactiva;
            LocalizaCurrent;
            Notificador.ExecutaNotifica(WM_INTER_FRAME_CHANGE,Self);
      end;
end;


// Arma la llave en base a una lista de parámetros [llave1,llave2,....]
Function TInterFrame.SetWhere(Const Llave:Array of Const):String;
Const VL:Array[0..1] of String=('False','True');
var i:Integer;
    S:String;
    SQL:String;
begin S:='';
      SQL:='';
      for i:=0 to FKeyFields.Count -1 do
      begin S:='';
      with Llave[I] do
      case VType of
       vtInteger:begin S:=FKeyFields.Strings[i]+'='+IntToStr(VInteger);
                       //FieldByName(FKeyFields.Strings[i]).AsInteger:=VInteger;
                 end;
       vtBoolean:begin S:=FKeyFields.Strings[i]+'='+#39+Vl[Byte(VBoolean)]+#39;
                 end;
       vtChar   :begin S:=FKeyFields.Strings[i]+'='+#39+VChar+#39;
                 end;
      vtExtended:begin S:=FKeyFields.Strings[i]+'='+#39+FloatToStr(VExtended^)+#39;
                 end;
       vtString :begin S:=FKeyFields.Strings[i]+'='+#39+VString^+#39;
                 end;
       vtPChar  :begin S:=FKeyFields.Strings[i]+'='+#39+VPChar+#39;
                 end;
    vtAnsiString:begin S:=FKeyFields.Strings[i]+'='+#39+string(VAnsiString)+#39;
                 end;
       vtObject :;//     Result := Result + VObject.ClassName;
       vtClass  :; //     Result := Result + VClass.ClassName;
      vtCurrency:begin S:=FKeyFields.Strings[i]+'='+#39+CurrToStr(VCurrency^)+#39;
                 end;

      vtVariant:begin S:=FKeyFields.Strings[i]+'='+#39+string(VVariant^)+#39;
                 end;
     end;
     if S<>'' then S:='('+S+')';
     AddSQL(SQL,S);
     end; {For}
     SetWhere:=SQL;
end;


Function TInterFrame.FindKey(Const Llave:Array of Const):Boolean;
var I:Integer;
    T:TInterCampo;
    vlS:String;
    vlD:TDateTime;
begin FindKey:=False;
      IniciaLocaliza;
      Try
      for i:=0 to FKeyFields.Count -1 do
      begin T:=FieldByName(FKeyFields.Strings[i]);
            with Llave[I] do
            case VType of
            vtInteger:begin T.AsInteger:=VInteger;
                      end;
           vtBoolean:begin  T.AsBoolean:=VBoolean;
                     end;
           vtChar   :begin  T.AsString:=VChar;
                     end;
          vtExtended:begin T.AsFloat:=VExtended^;
                     end;
           vtString :begin T.AsString:=VString^;
                     end;
           vtPChar  :begin T.AsString:=VPChar;
                     end;
        vtAnsiString:begin if T.FTipo=ftDate then
                           begin vlS:=string(VAnsiString);
                                 vlD:=StrToDate(vlS);
                                 T.AsDateTime:=vlD;
                           end
                           else T.AsString:=string(VAnsiString);
                     end;
           vtObject :;//     Result := Result + VObject.ClassName;
           vtClass  :; //     Result := Result + VClass.ClassName;
          vtCurrency:begin T.AsFloat:=VCurrency^;
                     end;
           vtVariant:begin T.AsString:=string(VVariant^);
                     end;
           end;
     end; {For}
     FindKey:=Localiza;
     DrawControl;
     Finally Try
                Notificador.ExecutaNotifica(WM_INTER_FRAME_CHANGE,Self);
             Finally if Assigned(FOnAfterLocaliza) then FOnAfterLocaliza(Self);
             end;
     end;
end;



Function TInterFrame.FindKeyNear(Const Llave:Array of Const; Const CamposLlave:Array of Const):Boolean;
var K:TStringList;
    S:String;
    i:Integer;
begin K:=TStringList.Create;
      Try
      K.Text:=FKeyFields.TexT;
      FKeyFields.Clear;
      for i:=0 to High(CamposLlave) do
      begin S:='';
            with CamposLlave[I] do
            case VType of
            vtInteger:begin S:=IntToStr(VInteger);
                      end;
           vtBoolean:begin
                     end;
           vtChar   :begin  S:=(VChar);
                     end;
          vtExtended:begin
                     end;
           vtString :begin S:=VString^;
                     end;
           vtPChar  :begin S:=VPChar;
                     end;
        vtAnsiString:begin S:=string(VAnsiString);
                     end;
           vtObject :;//     Result := Result + VObject.ClassName;
           vtClass  :; //     Result := Result + VClass.ClassName;
          vtCurrency:begin
                     end;
           vtVariant:begin S:=string(VVariant^);
                     end;
           end;
           FKeyFields.Add(S);
     end; {For}
        Result:=FindKey(Llave);
      Finally
      FKeyFields.Text:=K.Text;
      K.Free;
      end;
end;



// Obtiene el InterCampo n de la lista FFields
Function TInterFrame.GetFields(Index:Integer):TInterCampo;
begin GetFields:=Nil;
      if (Index<0)or(Index>FFields.count) then exit;
      GetFields:=FFields.Items[Index];
end;

// Asigna el campo n de la lista FFields
Procedure TInterFrame.SetFields(Index:Integer; Dato:TInterCampo);
begin if (Index<0)or(Index>FFields.count) then exit;
      FFields.Items[Index]:=Dato;
end;

function LLena(S:String; Long:Integer):String;
Const Vacio='                                                                    ';
begin LLena:=Copy(S+Vacio,1,Long);
end;

// Crea y prepara el Store Procedure
// Envía los parámetros en base a los tipos (tsXXXXX)
Function TInterFrame.StpPrepara(StpNombre:String; TipoStp:LongInt):TStoredProc;
Var Stp:TStoredProc;
    Tpt:TParamType;
    i:Integer;
    SList:TStringList;
    SS:String;
    SS1:string;
    SS2:string;

begin Try
      if FDebug then
      begin SList:=TStringList.Create;
            if FileExists(ExtractFilePath(Application.ExeName)+'INTDEBUG.TXT')
            then SList.LoadFromFile(ExtractFilePath(Application.ExeName)+'INTDEBUG.TXT');
            Case TipoStp of
            tsNinguno  : SS:='tsNinguno';
            tsConsulta : SS:='tsConsulta';
            tsModifica : SS:='tsModifica';
            tsElimina  : SS:='tsElimina';
            tsNuevo    : SS:='tsNuevo';
            tsBusca    : SS:='tsBusca';
            tsProc1    : SS:='tsProc1';
            tsProc2    : SS:='tsProc2';
            tsProc3    : SS:='tsProc3';
            tsProc4    : SS:='tsProc4';
            tsProc5    : SS:='tsProc5';
            end;
            SList.Add(' Preparando '+StpNombre+'  Modo:'+SS);
            SList.Add('---------------------------------------------');
      end;

      StpPrepara:=nil;

      if vgUseCheckMem
      then Stp:=TCheckMemStoredProc.CreateMio(nil,StpNombre)
      else Stp:=TStoredProc.Create(Nil);
      Stp.DataBaseName:=DataBaseName;
      Stp.SessionName:=SessionName;
      Stp.StoredProcName:=StpNombre;
      For i:=0 to FFields.Count-1 do
      begin if ((TipoStp and Fields[i].StpEntrada)=TipoStp)  or
               ((TipoStp and Fields[i].StpSalida)=TipoStp)
      then begin
            if ((TipoStp and Fields[i].StpEntrada)=TipoStp)  and
               ((TipoStp and Fields[i].StpSalida)=TipoStp)
                then // Entrada y Salida
                begin Tpt:=ptInputOutput;
                end
             else if (TipoStp and Fields[i].StpEntrada)=TipoStp then
                     begin Tpt:=ptInput;
                     end
                   else if (TipoStp and Fields[i].StpSalida)=TipoStp  then
                            begin Tpt:=ptOutput;
                            end
                        else
                           begin Tpt:=ptUnknown;
                           end;
                 {if}
             Stp.Params.CreateParam(Fields[i].Tipo,Fields[i].Parametro, Tpt);
             if FDebug then
             begin Case Fields[i].Tipo of
                   ftString   : SS:='ftString   ';
                   ftInteger  : SS:='ftInteger  ';
                   ftFloat    : SS:='ftFloat    ';
                   ftDate     : SS:='ftDate     ';
                   ftDateTime : SS:='ftDateTime ';
                   ftBoolean  : SS:='ftBoolean  ';
                   end;
                   if Tpt=ptOutput      then SS1:='ptOutput      ';
                   if Tpt=ptInput       then SS1:='ptInput       ';
                   if Tpt=ptInputOutput then SS1:='ptInputOutPut ';

                   if (Tpt=ptInputOutput)or(Tpt=ptInput) then
                   begin if Fields[i].IsNull
                            then SS2:='[NULL]'
                            else SS2:='['+Fields[i].AsString+']';
                   end
                   else SS2:='';
                   SList.Add(LLena(IntToStr(i),4)+Llena(Fields[i].Parametro,25)+' Tipo '+SS+ ' '+SS1+ ' '+SS2);
             end;

             if (Tpt=ptInputOutput)or(Tpt=ptInput) then
             begin
              if Fields[i].IsNull then Stp.ParamByName(Fields[i].Parametro).Clear
              else Case Fields[i].Tipo of
                   ftString   : Stp.ParamByName(Fields[i].Parametro).AsString:=Fields[i].AsString;
                   ftInteger  : Stp.ParamByName(Fields[i].Parametro).AsInteger:=Fields[i].AsInteger;
                   ftFloat    :Stp.ParamByName(Fields[i].Parametro).AsFloat:=Fields[i].AsFloat;
            ftDate,ftDateTime :
                      Begin If Fields[i].AsDateTime = 0 Then
                              Stp.ParamByName(Fields[i].Parametro).Clear
                           else
                              Stp.ParamByName(Fields[i].Parametro).AsDateTime:=Fields[i].AsDateTime;
                      End;
                   ftBoolean  : Stp.ParamByName(Fields[i].Parametro).AsBoolean:=Fields[i].AsBoolean;
                   end;
             end;
      end; // SOLO LOS QUE ENVIA
      end; {For}
      StpPrepara:=Stp;

      Finally  if FDebug then
               begin SList.Add('');
                     if SList<>nil then SList.SaveToFile(ExtractFilePath(Application.ExeName)+'INTDEBUG.TXT');
                     if SList<>nil then SList.Free;
               end;
      end;
end;

// Ejecuta el Store Procdure
// Regresa los valores

Function TInterFrame.StpEjecuta(Stp:TStoredProc; TipoStp:LongInt):Boolean;
begin InternalStpEjecuta(Stp,TipoStp,True);
end;

Function TInterFrame.InternalStpEjecuta(Stp:TStoredProc; TipoStp:LongInt; Destruye:Boolean):Boolean;
Var Tpt:TParamType;
    i:Integer;
begin InternalStpEjecuta:=False;
      Try
      Try
      Stp.ExecProc;
      For i:=0 to FFields.Count-1 do
      begin if ((TipoStp and Fields[i].StpEntrada)=TipoStp)  and
               ((TipoStp and Fields[i].StpSalida)=TipoStp)
                  then // Entrada y Salida
                  begin Tpt:=ptOutput; //SALE
                  end
            else if (TipoStp and Fields[i].StpEntrada)=TipoStp then
                  begin Tpt:=ptInput;
                  end
            else if (TipoStp and Fields[i].StpSalida)=TipoStp  then
                  begin Tpt:=ptOutput;  //SALE
                  end
            else
                begin Tpt:=ptUnknown;
                end;
                 {if}
            if Tpt=ptOutput then
            begin If Stp.ParamByName(Fields[i].Parametro).IsNull then Fields[i].IsNull:=True
                  else
                  Case Fields[i].Tipo of
                  ftString:Fields[i].AsString:=TrimRight(Stp.ParamByName(Fields[i].Parametro).AsString);
                  ftInteger:Fields[i].AsInteger:=Stp.ParamByName(Fields[i].Parametro).AsInteger;
                  ftFloat  : Fields[i].AsFloat:=Stp.ParamByName(Fields[i].Parametro).AsFloat;
                  ftDateTime,ftDate:
                     Begin If Stp.ParamByName(Fields[i].Parametro).IsNull then
                              Fields[i].AsDateTime:=0
                           else Fields[i].AsDateTime:=Stp.ParamByName(Fields[i].Parametro).AsDateTime;
                     End;
                  ftBoolean:Fields[i].AsBoolean:=Stp.ParamByName(Fields[i].Parametro).AsBoolean;
                  end;
            end;
      end; {For}
      InternalStpEjecuta:=True;
      Except
//           if Stp<>nil then Stp.UnPrepare;
           if Destruye then begin Stp.Free; Stp:=nil; end;
           RAISE;
         //NADA
      end;
      Finally //if Stp<>nil then Stp.UnPrepare;
              if (Destruye)and(Stp<>nil) then begin Stp.Free; Stp:=nil; end;
      end;
end;

Procedure TInterFrame.GetFromControl;
Var i:Integer;
begin For i:=0 to FFields.Count-1 do
      begin Fields[i].GetFromControl
      end; {For}
end;

Procedure TInterFrame.DrawControl;
Var i:Integer;
begin For i:=0 to FFields.Count-1 do
      begin Fields[i].DrawControl;
      end; {For}
end;

Procedure TInterFrame.CheckRequiered;
Var i:Integer;
    Campo:TInterCampo;
begin GetFromControl;
      For i:=0 to FFields.Count-1 do
      begin Campo:=Fields[i];
            if (Campo.IsRequiered)  and (Not Campo.ValidateRequiered)
            then Raise EInterFrame.Create('['+ClassName+'] '+'Se Requiere Información para el Campo '+Campo.Nombre+'.')
      end;
end;

Procedure TInterFrame.FieldsCopy(Origen:TInterFrame);
Var i:Integer;
begin For i:=0 to Origen.FFields.Count-1 do
      begin FieldByName(Origen.Fields[i].Nombre).AsString:=Origen.Fields[i].AsString;
      end; {For}
end;

Procedure TInterFrame.FieldsClear;
Var i:Integer;
begin For i:=0 to FFields.Count-1 do
      begin Fields[i].FieldsClear
      end; {For}
end;

procedure TInterFrame.FieldsSend;
Var i:Integer;
begin For i:=0 to FFields.Count-1 do
      begin Fields[i].FieldsSend
      end; {For}
end;

procedure TInterFrame.FieldsReceive;
Var i:Integer;
begin For i:=0 to FFields.Count-1 do
      begin Fields[i].FieldsReceive
      end; {For}
end;


Procedure TInterFrame.SaveDebugInfo(Evento:String);
var i:Integer;
    SList:TStringList;
    SS:String;
    SS1:string;
    SS2:string;
begin if FDebug then
      begin SList:=TStringList.Create;
            Try
            if FileExists(ExtractFilePath(Application.ExeName)+'INTDEBUG.TXT')
            then SList.LoadFromFile(ExtractFilePath(Application.ExeName)+'INTDEBUG.TXT');
            if UseQuery then SS:='Query '+Evento else SS:='STP '+Evento;
            if modo = moAppend then SS:=SS+' Append';
            if modo = moEdit then   SS:=SS+' Edit  ';
            SList.Add(' Preparando '+SS);
            SList.Add('---------------------------------------------');
            for i:=0 to FFields.Count-1 do
            begin Case Fields[i].Tipo of
                   ftString   : SS:='ftString   ';
                   ftInteger  : SS:='ftInteger  ';
                   ftFloat    : SS:='ftFloat    ';
                   ftDate     : SS:='ftDate     ';
                   ftDateTime : SS:='ftDateTime ';
                   ftBoolean  : SS:='ftBoolean  ';
                  end;
                  if Fields[i].ReadFromQuery
                     then SS1:=' Campo Query ' else SS1:=' Campo Stp   ';
                  SS2:='['+Fields[i].AsString+']';
                  SList.Add(LLena(IntToStr(i),4)+Llena(Fields[i].Nombre,25)+' Tipo '+SS+ ' '+SS1+ ' '+SS2);
            end;
            Finally SList.Add('');
                    if SList<>nil then SList.SaveToFile(ExtractFilePath(Application.ExeName)+'INTDEBUG.TXT');
                    if SList<>nil then SList.Free;
            end;
      end;
end;

Function SinQuote(S:String):String;
var AuxS:string;
    I:Integer;
begin AuxS:='';
      i:=1;
      While (i<=Length(S)) do
      begin //if S[i]=#10 then {No Hace Nada} else
            if S[i]=#39
                 then AuxS:=AuxS+#39+#39
                 else AuxS:=AuxS+S[i];
            Inc(i);
      end;
      SinQuote:=AuxS;
end;

Function SinEnter(S:String):String;
var AuxS:string;
    I:Integer;
begin AuxS:='';
      i:=1;
      While (i<=Length(S)) do
      begin if S[i]=#10 then {No Hace Nada}
            else AuxS:=AuxS+S[i];
            Inc(i);
      end;
      SinEnter:=AuxS;
end;

Function SinChar(S:String):String;
var AuxS:string;
    I:Integer;
begin AuxS:='';
      i:=1;
      While (i<=Length(S)) do
      begin if S[i]=#10
            then AuxS:=AuxS+#39+'||CHR(10)||'+#39
            else if S[i]=#13
                 then AuxS:=AuxS+#39+'||CHR(13)||'+#39
            else AuxS:=AuxS+S[i];
            Inc(i);
      end;
      SinChar:=AuxS;
end;

Function  RunSQLRows(SQL:String; DataBaseName:String; SessionName:string; ShowError:Boolean):Integer;
Var TT:TQuery;
begin
   Result:=-1;
    Try
      TT:=TQuery.Create(nil);
      Try
      TT.DataBaseName:=DataBaseName;
      TT.SessionName:=SessionName;
      TT.SQL.Clear;
      TT.SQL.Add(SQL);
      TT.ExecSQL;
      Result:=TT.RowsAffected;
      Finally TT.Free;
      end;
    Except
       if ShowError then Raise;
    end;
end;

Function TInterFrame.InternalInsertQuery:String;
var i:Integer;
    T:TInterCampo;
    Campos,Values,SQL:String;
    AuxQ:TQuery;
    SP1,SP2,AuxName:String;
    sSize:Integer;
begin Result:='';
      Campos:='';
      Values:='';   SP1:=''; SP2:='';
      if FQuery<>nil then AuxQ:=FQuery else begin AuxQ:=CreateQueryEmpty; end;
      For i:=0 to FFields.Count-1 do
      begin T:=TInterCampo(FFields.Items[i]);
            if (T.ReadFromQuery) and (Not T.FNoSave) then
            begin AuxName:=T.Nombre;
                  Campos:=Campos+SP1+AuxName;
                  if T.IsNull
                  then Values:= Values+SP2+' NULL '
                  else if T.FTipo=ftString
                       then begin if T.FIsLongData
                                  then sSize:=T.Size
                                  else begin sSize:=AuxQ.FieldByName(AuxName).Size;
                                             if (sSize=0)and(T.Size<>0) then sSize:=T.Size;
                                       end;
                                  Values:= Values+SP2+#39+Copy(SinChar(SinEnter(SinQuote(T.AsString))),1,sSize)+#39;
                            end
                       else Values:= Values+SP2+T.AsSQL;
                  SP1:=' , ';
                  SP2:=' , ';
            end;
      end;
      if Campos='' then Exit;
      SQL:='INSERT INTO '+TableName+ '( ' +Campos+ ') VALUES ( ' +Values+ ' )';
      Result:=SQL;
end;




Procedure TInterFrame.InsertQuery;
var i:Integer;
    T:TInterCampo;
    Campos,Values,SQL:String;
    AuxQ:TQuery;
    SP1,SP2,AuxName:String;
    sSize:Integer;
begin Campos:='';
      Values:='';   SP1:=''; SP2:='';
      if FQuery<>nil then AuxQ:=FQuery else begin AuxQ:=CreateQueryEmpty; end;
      For i:=0 to FFields.Count-1 do
      begin T:=TInterCampo(FFields.Items[i]);
            if (T.ReadFromQuery) and (Not T.FNoSave) then
            begin AuxName:=T.Nombre;
                  Campos:=Campos+SP1+AuxName;
                  if T.IsNull
                  then Values:= Values+SP2+' NULL '
                  else if T.FTipo=ftString
                       then begin if T.FIsLongData
                                  then sSize:=T.Size
                                  else begin sSize:=AuxQ.FieldByName(AuxName).Size;
                                             if (sSize=0)and(T.Size<>0) then sSize:=T.Size;
                                       end;
                                  Values:= Values+SP2+#39+Copy(SinChar(SinEnter(SinQuote(T.AsString))),1,sSize)+#39;
                            end
                       else Values:= Values+SP2+T.AsSQL;
                  SP1:=' , ';
                  SP2:=' , ';
            end;
      end;
      if Campos='' then Exit;
      SQL:='INSERT INTO '+TableName+ '( ' +Campos+ ') VALUES ( ' +Values+ ' )';
      if RunSQLRows(SQL,DataBaseName,SessionName,True)<=0
      then Raise EInterFrame.Create('Imposible Crear el Registro Nuevo. Verifique Información y Vuelva a Intentar ');

end;


Function  TInterFrame.InternalUpdateQuery:String;
var i:Integer;
    T:TInterCampo;
    Campos,Values, SQL:String;
    OldState:Integer;
    AuxQ:TQuery;
    AuxName:String;
    SP1,SP2:String;
    SSize:Integer;
    Dato1,Dato2:String;
begin Result:='';
      OldState:=State;
      if FQuery<>nil then AuxQ:=FQuery else begin AuxQ:=CreateQueryEmpty; end;
      Try
      Campos:='';
      Values:=''; SP1:=''; SP2:='';
      For i:=0 to FFields.Count-1 do
      begin T:=TInterCampo(FFields.Items[i]);
            if (T.ReadFromQuery) then
            begin AuxName:=T.Nombre;
                  State:=OldState;
                  if (Not T.FNoSave) then
                  begin Dato1:=T.AsSQL;
                        State:=0;
                        Dato2:=T.AsSQL;
                        State:=OldState;
                  if Dato1<>Dato2
                  then begin
                  		  if Trim(Campos)='' then SP1:=' ';
                          if T.IsNull
                          then Campos:= Campos+SP1+AuxName+'= NULL '
                          else if T.FTipo=ftString
                          then begin if T.FIsLongData
                                     then sSize:=T.Size
                                     else begin sSize:=AuxQ.FieldByName(AuxName).Size;
                                                if (sSize=0)and(T.Size<>0) then sSize:=T.Size;
                                          end;
                                     Campos:= Campos+SP1+AuxName+'='+#39+Copy(SinChar(SinEnter(SinQuote(T.AsString))),1,sSize)+#39
                               end
                          else Campos:= Campos+SP1+AuxName+'='+T.AsSQL;
                       end;
                  end;
                  State:=0;
                  if (Not T.FNoCompare)
                  then begin
                  if (T.IsNull) or ((T.FTipo = ftString) and (TrimRight(T.asString) = ''))
                  then begin if (T.fTipo=ftString) //and (T.Size<>0)
                             then Values:= Values+SP2+'RTRIM('+AuxName+') IS NULL '
                             else Values:= Values+SP2+AuxName+' IS NULL '
                       end
                  else begin if T.FTipo=ftDate then
                             begin if vgUseAccess
                                   then Values:= Values+SP2+'CVDATE('+AuxNAme+')=CVDATE('+#39+FormatDateTime(ToFecha,T.AsDateTime)+#39+')'
                                   else Values:= Values+SP2+'TO_CHAR('+AuxNAme+',''DD/MM/YYYY'')='+#39+FormatDateTime(ToFecha,T.AsDateTime)+#39;
                             end
                             else
                             if T.FTipo=ftDateTime then
                             begin if vgUseAccess
                                   then Values:= Values+SP2+'CVDATE('+AuxNAme+')=CVDATE('+#39+FormatDateTime(ToFechaHora,T.AsDateTime)+#39+')'
                                   else Values:= Values+SP2+'TO_CHAR('+AuxNAme+',''DD/MM/YYYY HH24:MI:SS'')='+#39+FormatDateTime(ToFechaHora,T.AsDateTime)+#39
                             end else Values:= Values+SP2+AuxName+'='+SinChar(T.AsSQL);
                             //Values:= Values+SP2+AuxName+'='+T.AsSQL;
                        end;
                  end;
                  State:=OldState;
                  SP1:=' , ';
                  SP2:=' AND ';
            end;
      end;
      if Campos='' then Exit;
      SQL:='UPDATE '+TableName+ ' SET ' +Campos+ ' WHERE '+Values;
      Result:=SQL;
      Finally State:=OldState;
      end;
end;


Procedure TInterFrame.UpdateQuery;
var SQL:String;
    OldState:Integer;
begin OldState:=State;
      Try
      SQL:=InternalUpdateQuery;
      if SQL='' then exit;
      if RunSQLRows(SQL,DataBaseName,SessionName,True)<=0
      then Raise EInterFrame.Create('Imposible Realizar la Actualización del Registro. El Registro fue modificado por otro Usuario. Cancele la Operación');
      Finally State:=OldState;
      end;
end;


Function TInterFrame.InternalDeleteQuery:String;
var i:Integer;
    T:TInterCampo;
    SP1,Values, SQL:String;
    OldState:Integer;
    AuxQ:TQuery;
begin Result:='';
      OldState:=State;
      if FQuery<>nil then AuxQ:=FQuery else begin AuxQ:=CreateQueryEmpty; end;
      Try
      Values:=''; SP1:='';
      For i:=0 to FFields.Count-1 do
      begin T:=TInterCampo(FFields.Items[i]);
            if (T.ReadFromQuery) and (Not T.FNoCompare) then
            begin State:=OldState;
                  //Campos:= Campos+','+T.Nombre+'='+T.AsSQL;
                  State:=0;
                  if (T.IsNull) or ((T.FTipo = ftString) and (TrimRight(T.asString) = ''))
                  then begin if (T.FTipo=ftString) //and (T.Size<>0)
                             then Values:= Values+SP1+'RTRIM('+T.Nombre+') IS NULL '
                             else Values:= Values+SP1+T.Nombre+' IS NULL '
                       end
                  else begin //Values:= Values+SP1+T.Nombre+'='+T.AsSQL;
                             if T.FTipo=ftDate then
                             begin if vgUseAccess
                                   then Values:= Values+SP1+'CVDATE('+T.Nombre+')=CVDATE('+#39+FormatDateTime(ToFecha,T.AsDateTime)+#39+')'
                                   else Values:= Values+SP1+'TO_CHAR('+T.Nombre+',''DD/MM/YYYY'')='+#39+FormatDateTime(ToFecha,T.AsDateTime)+#39
                             end
                             else if T.FTipo=ftDateTime then
                             begin if vgUseAccess
                                   then Values:= Values+SP1+'CVDATE('+T.Nombre+')=CVDATE('+#39+FormatDateTime(ToFechaHora,T.AsDateTime)+#39+')'
                                   else Values:= Values+SP1+'TO_CHAR('+T.Nombre+',''DD/MM/YYYY HH24:MI:SS'')='+#39+FormatDateTime(ToFechaHora,T.AsDateTime)+#39
                             end
                             else Values:= Values+SP1+T.Nombre+'='+SinChar(T.AsSQL);
                       end;
                  (*
                  if T.IsNull
                  then Values:= Values+SP2+AuxName+' IS NULL '
                  else begin if T.FTipo=ftDate then
                             begin Values:= Values+SP2+'TO_CHAR('+AuxNAme+',''DD/MM/YYYY'')='+#39+FormatDateTime(ToFecha,T.AsDateTime)+#39
                             end else Values:= Values+SP2+AuxName+'='+T.AsSQL;
                             //Values:= Values+SP2+AuxName+'='+T.AsSQL;
                        end;
                   *)
                  State:=OldState;
                  SP1:=' AND ';
            end;
      end;
      if Values='' then Exit;
      SQL:='DELETE FROM '+TableName+ ' WHERE '+Values;
      Result:=SQL;
      Finally State:=OldState;
      end;
end;

Procedure TInterFrame.DeleteQuery;
var SQL:String;
    OldState:Integer;
begin OldState:=State;
      Try
      SQL:=InternalDeleteQuery;
      if SQL='' then exit;
      if RunSQLRows(SQL,DataBaseName,SessionName,True)<=0
      then begin Active:=False;
                 Raise EInterFrame.Create('Imposible Eliminar el Registro. El Registro fue Eliminado por otro Usuario.');
           end;
      Finally State:=OldState;
      end;
end;

function TInterFrame.InternalPost:Boolean;
Var P:TStoredProc;
begin Result := False;
      if (UseQuery) then
      begin SaveDebugInfo('Post');
            if FIsNewData then
               begin InsertQuery; // ALMACENA QUERY;
                     Result:=True;
               end
            else
                begin UpdateQuery; // ALMACENA QUERY;
                      Result:=True;
                end;
            (*
            else
            if (FQuery<>nil)
            then begin FQuery.Post;
                       Result := True;
                 end
            else raise EInterFrame.Create('['+ClassName+'] No Existe un Query, Imposible Guardar los Cambios al Registro');
            *)
      end
      else begin  if modo = moAppend then
                  begin P := StpPrepara(StpALName,tsNuevo);
                        StpEjecuta(P,tsNuevo);
                        if ValidaStp then
                        begin Result:=True;
                              Active := True;
                        end
                        else raise EInvalidOperation.Create('Ocurrio un Error '); //+CodigoRespuesta.AsString);
                  end;
                  if modo = moEdit then
                  begin P := StpPrepara(StpMoName,tsModifica);
                        StpEjecuta(P,tsModifica);
                        if ValidaStp then
                        begin Result:=True;
                        end
                        else raise EInvalidOperation.Create('Ocurrio un Error '); //+CodigoRespuesta.AsString);
                  end;
            end; {end-if}
end;

function TInterFrame.InternalCancel:Boolean;
begin Result := False;
      if (UseQuery) and (FQuery<>nil)
         then begin FQuery.Cancel;
                    Result := True;
              end
         else Result:=True;
                {MessageDlg('Entra a InternalCancel',mtInformation,[mbOk], 0);}
end;

function TInterFrame.InternalRefresh:Boolean;
begin IniciaLocaliza;
      FieldsSend;
      InternalRefresh:=Localiza;
end;

function TInterFrame.ValidaStp:Boolean;
begin ValidaStp:=(FieldByName(FStpRespuesta).AsInteger=0);
end;

function TInterFrame.InternalEdit:Boolean;
begin Result := False;
      (*
      if (UseQuery) and (FQuery<>nil)
         then begin FQuery.Edit;
                    Result := True;
              end
         else
      *)
      Result:=True;
end;

Function TInterFrame.InternalDelete:Boolean;
var P : TStoredProc;
begin Result := False;
      if (UseQuery)
         then begin if (FQuery<>nil)
                    then begin DeleteQuery;
                               //FQuery.Delete;
                               Result := True;
                         end
                    else raise EInterFrame.Create('['+ClassName+'] No Existe un Query, Imposible Eliminar el Registro');
              end
         else begin P := StpPrepara(StpBaName,tsElimina);
                    StpEjecuta(P,tsElimina);
                    if ValidaStp
                    then begin Active := False;
                               Result:=True;
                         end
                    else raise EInterFrame.Create('['+ClassName+'] Imposible Eliminar el Registro');
               end;
end;


Function TInterFrame.CreateQueryEmpty:TQuery;
var s:string;
    Q:TQuery;
begin if FDummi<>nil
      then begin CreateQueryEmpty:=FDummi;
                 exit;
           end;
      S:='SELECT * FROM '+TableName+' WHERE 1=2';
      Q := CreaQuery(S,False); //QueryRequestLive);
      FDummi:=Q;
      CreateQueryEmpty:=Q;
end;


Function TInterFrame.InternalAppend:Boolean;
begin Result := False;
      (*
      if (UseQuery) and (FQuery<>nil)
         then begin FQuery.Insert;
                    Result := True;
              end
         else
      *)
      Result:=True;
      //LocalizaInactiva;  // AGUAS
end;

Function  TInterFrame.ShowWindow(FormaTipo:TFormaTipo):Integer;
begin ShowWindow:=mrCancel;
end;

function TInterFrame.InternalConsulta:Boolean;
begin ChecaAcceso(False);
      InternalConsulta := False;
      ShowWindow(ftConsulta);
      InternalConsulta := True;
end;

function TInterFrame.InternalCatalogo:Boolean; // Proceso Interno de Catálogo.
begin InternalCatalogo := False;
      ShowWindow(ftGrid);
      InternalCatalogo := True;
end;

Function TInterFrame.InternalBusca:Boolean;
begin Result := False;
      Raise EInterFrame.Create('['+ClassName+'] No existe una consulta para el objeto '+ ClassName);
end;

function TInterFrame.InternalLocaliza:Boolean;
begin Result:=True;                               
end;

procedure TInterFrame.Refresh;
begin

  if Active=False then raise EInterFrame.Create('['+ClassName+'] No existe un Registro Activo');
    InternalRefresh;
end;

Procedure TInterFrame.TransAppend;
var i:Integer;
    T:TInterFrame;
begin TransBegin;
      Try for i:=0 to FTransList.Count-1 do
          begin if TInterFrame(FTransList[i])=Self
                then OldAppend
                else TInterFrame(FTransList[i]).Append
          end;
      Except TransRollBack;
             Raise EInterFrame.Create('['+ClassName+'] Imposible Crear un Nuevo Registro');
      end;
end;

Procedure TInterFrame.TransEdit;
var i:Integer;
begin TransBegin;
      Try for i:=0 to FTransList.Count-1 do
          begin if TInterFrame(FTransList[i]).Active=False
                then begin if TInterFrame(FTransList[i]).FTransAutoAppend
                           then begin if TInterFrame(FTransList[i])=Self
                                      then OldAppend
                                      else TInterFrame(FTransList[i]).Append;
                                end
                           else begin if TInterFrame(FTransList[i])=Self
                                      then OldEdit
                                      else TInterFrame(FTransList[i]).Edit;
                                     //TInterFrame(FTransList[i]).Edit; // TRUENA POR QUE NO EXISTE EL REGISTRO.
                                end;

                     end
                else begin if TInterFrame(FTransList[i])=Self
                           then OldEdit
                           else TInterFrame(FTransList[i]).Edit;
                     end;  //TInterFrame(FTransList[i]).Edit;

          end;
      Except TransRollBack;
             Raise EInterFrame.Create('['+ClassName+'] Imposible Modificar el Registro Actual');
      end;
end;

Procedure TInterFrame.TransDelete;
var i:Integer;
begin if Active=False then raise EInterFrame.Create('['+ClassName+'] No existe un Registro Activo que pueda ser Eliminado ['+ClassName+']');
      if (FInterFun.Bloqueado) or (Not FInterFun.Eliminar) then raise EInterFrame.Create('['+ClassName+'] '+FinterFun.GetMsgError);
      if (fAskDelete) and (MessageDlg ('¿Desea eliminar el registro actual?',mtInformation, [mbYes, mbNo],0) = mrNo)
      then exit;
      TransBegin;
      Try for i:=0 to FTransList.Count-1 do
          begin if TInterFrame(FTransList[i])=Self
                then OldDelete
                else TInterFrame(FTransList[i]).Delete;
          end;
      Except TransRollBack;
             Raise EInterFrame.Create('['+ClassName+'] Imposible Eliminar el Registro Actual');
      end;
      Try
      TransCommit;
      Except Raise EInterFrame.Create('['+ClassName+'] Imposible Eliminar el Registro Actual');
      end;

end;


Procedure TInterFrame.TransPost;
var i:Integer;
begin Try for i:=0 to FTransList.Count-1 do
          begin TInterFrame(FTransList[i]).TransSave(False);
          end;
      Except for i:=0 to FTransList.Count-1 do
             begin if TInterFrame(FTransList[i]).FTransModo=moBrowse
                      then begin if TInterFrame(FTransList[i])=Self
                                 then OldEdit
                                 else TInterFrame(FTransList[i]).Edit
                           end;
             end;
             Raise EInterFrame.Create('['+ClassName+'] Imposible Guardar los Cambios');
      end;
      Try
      TransCommit;
      Except Raise EInterFrame.Create('['+ClassName+'] Imposible Guardar los Cambios');
      end;
      for i:=0 to FTransList.Count-1 do
      begin TInterFrame(FTransList[i]).TransSave(True);
      end;
end;

Procedure TInterFrame.TransCancel;
var i:Integer;
begin Try
          for i:=0 to FTransList.Count-1 do
          begin if TInterFrame(FTransList[i])=Self
                then OldCancel
                else TInterFrame(FTransList[i]).Cancel;
          end;
      Finally TransRollBack;
      {MessageDlg('Entra a TransCancel',mtInformation,[mbOk], 0);}
      end;
end;


procedure TInterFrame.Edit;
begin if FUseTrans
      then TransEdit
      else OldEdit;
end;

procedure TInterFrame.OldEdit;
begin
  if Active=False then
     raise EInterFrame.Create('['+ClassName+'] No existe un Registro Activo que pueda ser Modificado ['+ClassName+']');
  ChecaAcceso(False);
  //FQueryRequestLive:=True;
  if(FInterFun.Bloqueado)or(Not FInterFun.Modificar)then
     raise EInterFrame.Create('['+ClassName+'] No Tiene Derechos para Modificar el Registro.'+#13+#10+FinterFun.GetMsgError);
  if Modo<>moBrowse then
     raise EInterFrame.Create('['+ClassName+'] Debe Cancelar o Aceptar los Cambios, antes de Editar este Registro ');
  if AutoRefresh then
     Refresh;
  OldActive:=Active;
  FIsNewData:=False;
  if InternalEdit then begin
     Modo := moEdit;
     State := 1;
     FieldsSend;
     DrawControl;
     FTransModo:=moEdit;
  end;
end;

procedure TInterFrame.Post;
begin if FUseTrans
      then TransPost
      else OldPost;
end;

procedure TInterFrame.OldPost;
var OldModo:TModo;
begin if Active=False then raise EInterFrame.Create('['+ClassName+'] No existe un Registro Activo que pueda ser Aceptado ['+ClassName+']');
      ChecaAcceso(False);
      Case Modo of
      moEdit  :if (FInterFun.Bloqueado) or (Not FInterFun.Modificar) then raise EInterFrame.Create('['+ClassName+'] '+FinterFun.GetMsgError);
      moAppend:if (FInterFun.Bloqueado) or (Not FInterFun.Nuevo) then raise EInterFrame.Create('['+ClassName+'] '+FinterFun.GetMsgError);
      end;
      //GetFromControl; Ya no lo Requiere esta dentro de CheckRequiered;
      CheckRequiered;
      if InternalPost then
      begin OldModo:=Modo;
            Modo := moBrowse;
            if (AutoRefresh) and (Not Localiza) then Raise EInterFrame.Create('Error Imposible Terminar Cambios');
            State := 0;
            if OldModo=moAppend then LocalizaChange;
            FieldsReceive;
            DrawControl;
            LocalizaCurrent;
            if Assigned(FOnProceso) then OnProceso(Self,OldModo,0,Self);
            if Assigned(FOnDespuesBusca) then OnDespuesBusca(Self);
      end;
end;


Procedure TInterFrame.TransBegin;
begin if FInternalDataBase<>nil then raise EInterFrame.Create('['+ClassName+'] Imposible Iniciar otra Transacción dentro de una ya Existente. ['+ClassName+']');
      Case Modo of
      moEdit:begin if Active=False then raise EInterFrame.Create('['+ClassName+'] No existe un Registro Activo que pueda ser Aceptado ['+ClassName+']');
             end;
      end;
      if (Apli=nil) then raise EInterFrame.Create('['+ClassName+'] No Existe una Base de Datos para Iniciar la Transacción.');
      if IsCorp
         then begin if Apli.SeguDataBase=nil then raise EInterFrame.Create('['+ClassName+'] No Existe una Base de Datos de Seguridades para Iniciar la Transacción.');
                    FInternalDataBase:=Apli.SeguDataBase;
              end
         else begin if Apli.DataBase=nil then raise EInterFrame.Create('['+ClassName+'] No Existe una Base de Datos para Iniciar la Transacción.');
                    FInternalDataBase:=Apli.DataBase;
              end;
      FInternalDataBase.TransIsolation:=tiDirtyRead;
      FInternalDataBase.StartTransaction;
end;

Procedure TInterFrame.TransCommit;
begin FInternalDataBase.Commit;
      FInternalDataBase:=nil;
end;

Procedure TInterFrame.TransRollBack;
begin FInternalDataBase.RollBack;
      FInternalDataBase:=nil;
end;

Function TInterFrame.TransSave(Final:Boolean):Boolean;
var OldModo:TModo;
begin TransSave:=False;
      ChecaAcceso(False);
      Case Modo of
      moEdit  :if (FInterFun.Bloqueado) or (Not FInterFun.Modificar) then raise EInterFrame.Create('['+ClassName+'] '+FinterFun.GetMsgError);
      moAppend:if (FInterFun.Bloqueado) or (Not FInterFun.Nuevo) then raise EInterFrame.Create('['+ClassName+'] '+FinterFun.GetMsgError);
      end;
      if Not Final
         then begin //GetFromControl; Ya no lo Requiere esta dentro de CheckRequiered;
                    CheckRequiered;
                    InternalPost;
                    State := 0;
                    FieldsReceive;
                    DrawControl;
                    modo:=moBrowse; //LocalizaCurrent;
                    FTransModo:=moBrowse;
              end;
      if Final then
      begin OldModo:=Modo;
            Modo := moBrowse;
            //if OldModo=moAppend then
            LocalizaChange;
            State := 0;
            FieldsReceive;
            DrawControl;
            LocalizaCurrent;
            if Assigned(FOnProceso) then OnProceso(Self,OldModo,0,Self);
            if Assigned(FOnDespuesBusca) then OnDespuesBusca(Self);
      end;
      TransSave:=True;
end;

procedure TInterFrame.Cancel;
begin if FUseTrans
      then TransCancel
      else OldCancel;
      {MessageDlg('Entra a TInterFrameCancel',mtInformation,[mbOk], 0);}
end;

procedure TInterFrame.OldCancel;
begin
   if Active=False then raise EInterFrame.Create('['+ClassName+'] No existe un Registro Activo que pueda ser Cancelado ['+ClassName+']');
   if InternalCancel then
      begin Modo := moBrowse;
            State := 0;
            Active:=OldActive;
            if Active=True
               then begin //FQueryRequestLive:=False;
                          Refresh;
                    end
               else FieldsClear;
            DrawControl;
      {MessageDlg('Entra a InterframeOldCAncel',mtInformation,[mbOk], 0);}
      end;
end;


procedure TInterFrame.Append;
begin
 if FUseTrans then
    TransAppend
 else
    OldAppend;
end;

Procedure TInterFrame.OldAppend;
var T:TQuery;
    OldState:Integer;
begin
   if Not((Modo=moBrowse)or(Modo=moInactive)) then
      raise EInterFrame.Create('['+ClassName+'] Debe Cancelar o Aceptar los Cambios, antes de Crear un Nuevo Registro ['+ClassName+']');
   ChecaAcceso(False);
   if (FInterFun.Bloqueado) or (Not FInterFun.Nuevo) then
      raise EInterFrame.Create('['+ClassName+'] No Tiene derechos para Crear Registros.'+#13+#10+FinterFun.GetMsgError);
   OldActive:=Active;
   if (UseQuery) then   // ERROR MARCOS01
   begin FIsNewData:=True;
         (*
         if (FQuery=nil)
         then begin T:=CreateQueryEmpty;
                    if T=nil then Raise EInterFrame.Create('['+ClassName+'] No Existe un Query. Imposible Crear nuevo Registro del objeto '+ ClassName);
                    //if FQuery<>nil then FQuery.Free;
                    ///FQuery:=T;
                    IsNewData:=True;
              end
         else begin //FQueryRequestLive:=True;
                    //Refresh;
                    if State<>2
                    then begin OldState:=State;
                               State:=2;
                               FieldsSend;
                               State:=OldState;
                         end;
              end;
         *)
   end;
   if InternalAppend then
      begin Modo := moAppend;
            FTransModo:=moAppend;
            State := 1;
            FExModo:=1;
            Try
            FieldsClear;
            LocalizaInactiva;
            Finally FExModo:=0;
            end;
            Active:=True;
            DrawControl;
            LocalizaCurrent;
      end;
end;

procedure TInterFrame.Delete;
begin if FUseTrans
      then TransDelete
      else OldDelete;
end;

procedure TInterFrame.OldDelete;
begin
   if Active=False then raise EInterFrame.Create('['+ClassName+'] No existe un Registro Activo que pueda ser Eliminado ['+ClassName+']');
   if (FInterFun.Bloqueado) or (Not FInterFun.Eliminar) then raise EInterFrame.Create('['+ClassName+'] No Tiene Derechos para Eliminar Registros.'+#13+#10+FinterFun.GetMsgError);
      if (fAskDelete) and
      (MessageDlg ('¿Desea eliminar el registro actual?',mtInformation, [mbYes, mbNo],0) = mrNo)
   then exit;
   //FQueryRequestLive:=True;
   //Refresh;
   if InternalDelete then
      begin
         Modo := moInactive;
         State := 0;
         FieldsClear;
         DrawControl;
         Active := False;
      end;
end;

function TInterFrame.Nuevo:Boolean;
begin Nuevo := False;
      Nuevo := (ShowWindow(ftCaptura) = mrOK);
end;

function TInterFrame.Modifica:Boolean;
begin Modifica := False;
      Modifica := (ShowWindow(ftModifica)=mrOK);
end;

function TInterFrame.Elimina:Boolean;
begin Elimina := False;
      Delete;
      Elimina := True;
end;

function TInterFrame.Busca:Boolean;
begin Busca:=False;
      if Not CheckBusca then Exit;
      if (FInterFun.Bloqueado) or (Not FInterFun.Consultar) then raise EInterFrame.Create('['+ClassName+'] '+FinterFun.GetMsgError);
      if InternalBusca then
         begin Busca:=True;
               DrawControl;
               if Assigned(OnDespuesBusca) then OnDespuesBusca(Self);
         end;
      FastVal:='';
      FastField:='';
      FastWait:=True;
end;

Procedure TInterFrame.LocalizaInactiva;
var I,j:Integer;
    T:TInterFrame;
    F:TInterCampo;
    LLaveMal:Boolean;
begin For i:=0 to FListMasterSource.Count-1 do
      begin T:=FListMasterSource.Items[i];
            if FUseTrans
            then begin if FTransList.IndexOf(T)=-1
                       then begin T.Active:=False;
                                  T.DrawControl;
                            end;
                 end
            else begin if FExModo=1
                       then begin LlaveMal:=False;
                                  for j:=0 to T.FKeyFields.Count-1 do
                                  begin if Not LlaveMal then
                                        begin F:=T.FieldByName(T.FKeyFields[j]);
                                              if (F.MasterField='') or (Not FieldExists(F.MasterField))
                                              then LlaveMal:=True
                                              else if (FieldByName(F.MasterField).FNoClear=False)
                                                   or (FieldByName(F.MasterField).IsNull)
                                              then LlaveMal:=True;
                                        end;
                                  end;
                                  if LlaveMal then T.Active:=False;
                                  T.DrawControl;
                            end
                       else begin T.Active:=False;
                                  T.DrawControl;
                            end;
                 end;
      end;
end;


Procedure TInterFrame.LocalizaCambioHijo(Hijo:TInterFrame);
var I,J:Integer;
begin For i:=0 to FListMasterSource.Count-1 do
      begin if FListMasterSource.Items[i]=Hijo then
            begin Try Hijo.IniciaLocaliza;
                      For j:=0 to Hijo.FFields.Count-1 do
                      begin if Hijo.Fields[j].MasterField<>'' then
                            begin Hijo.Fields[j].AsString:=FieldByName(Hijo.Fields[j].MasterField).AsString;
                            end;
                      end;
                      Hijo.Localiza;
                      Hijo.DrawControl;
                   Except // SE COME CUALQUIER ERROR
                   end;
             end;
      end;
end;{Procedure}

Procedure TInterFrame.LocalizaChange;
var
   I,J:Integer;
   T:TInterFrame;
   Campo:TInterCampo;
   MasterCampo:TInterCampo;
begin
  Try
    For i:=0 to FListMasterSource.Count-1 do begin
        T:=FListMasterSource.Items[i];
        if MasterSourceEnabled then begin
           Try
             T.IniciaLocaliza;
             For j:=0 to T.FFields.Count-1 do begin
                 if T.Fields[j].MasterField<>'' then begin
                    T.Fields[j].AsString:=FieldByName(T.Fields[j].MasterField).AsString;
                 end;
             end;
             T.Localiza;
             T.DrawControl;
           Except // SE COME CUALQUIER ERROR
           end;
        end;
    end;
    if MasterSource<>nil then begin
       if (( ( (MasterSource.Modo=moEdit) or (MasterSource.Modo=moAppend)) and (MasterSourceEnabled)) and (MasterSourceReadOnly=False)) then begin
           if ((FMasterSourceEditControl=nil) or ((FMasterSourceEditControl<>nil) and (FMasterSourceEditControl.Enabled))) then begin
              Try
                Try
                  For j:=0 to FFields.Count-1 do begin
                      Campo:=Fields[j];
                      if Campo.MasterField<>'' then begin
                         MasterCampo:=MasterSource.FieldByName(Campo.MasterField);
                         MasterCampo.AsString:=Campo.AsString;
                         MasterCampo.DrawControl;
                         Campo.DrawControl;
                      end;
                  end;
                Except // SE COME CUALQUIER ERROR
                end;
              Finally
                MasterSource.EvHijoFind(Self);
              end;
           end;
       end;
    end;
    Finally
      LocalizaCurrent;
    end;
end;{Procedure}

Procedure TInterFrame.LocalizaCurrent;
begin
end; {Procedure}

function TInterFrame.Localiza:Boolean;
Const
    VL:Array[0..1] of String=('False','True');
var
    I:Integer;
    S,SQL:String;
    T:TinterCampo;
    Q:TQuery;
    P:TStoredProc;
    LLaveNula:Boolean;
begin
  Try
    Localiza:=False;
    if MasterSource<>nil then
       MasterSource.EvPrevHijoFind(Self);
    if State=0 then
       raise EInterFrame.Create('['+ClassName+'] Imposible Iniciar un Proceso de Localización en '+ClassName);
    Try
      Try
        SQL:='';
        LlaveNula:=True;
        for I:=0 to FKeyFields.Count -1 do begin
            S:='';
            T:=FieldByName(FKeyFields.Strings[i]);
            LlaveNula:=(LlaveNula and (Trim(T.AsString)=''));
            Case T.Tipo of
              ftString  :S:=FKeyFields.Strings[i]+'='+#39+T.AsString+#39;
              ftInteger :S:=FKeyFields.Strings[i]+'='+T.AsString;
              ftFloat   :S:=FKeyFields.Strings[i]+'='+T.AsString;
              ftDateTime:S:=FKeyFields.Strings[i]+'='+T.AsSQL; // #39+FormatDateTime(ToFechaHora,T.AsDateTime)+#39;
              ftDate    :S:=FKeyFields.Strings[i]+'='+T.AsSQL; //#39+FormatDateTime(ToFecha,T.AsDateTime)+#39;
              ftBoolean :S:=FKeyFields.Strings[i]+'='+#39+Vl[Byte(T.AsBoolean)]+#39;
            end;
            if S<>'' then
               S:='('+S+')';
            AddSQL(SQL,S);
        end;
        AddSQL(SQL,FilterString);
        if LLaveNula then begin
           Active:=False;
           DrawControl;
           Application.ProcessMessages;
           Exit;
        end;
        if Not UseQuery then begin
           if Trim(StpName)<>'' then begin
            P := StpPrepara(StpName,tsConsulta);
            StpEjecuta(P,tsConsulta);
           end;
           if (ValidaLocaliza) then begin
              FieldsReceive; // CHECAR!!!
              Active:=True;
              Modo := moBrowse;
              State:=0;
              Localiza:=InternalLocaliza;
           end
           else begin
              if NotFoundInactive then
                 Active:=False
              else begin
                 Modo := moBrowse;
                 State:=0;
                 Refresh;
              end;
           end;
        end
        else begin
           S:='SELECT * FROM '+TableName;
           if SQL<>'' then                                 
              S:=S+' WHERE '+SQL;
           Q := CreaQuery(S,False);
           if (Q<>nil) and (Not Q.IsEmpty) then begin
              if FQuery<>nil then
                 FQuery.Free; FQuery:=nil;
              FQuery:=Q;
              Active:=True;
              Modo := moBrowse;
              State:=0;
              Localiza:=InternalLocaliza;
           end
           else begin
              if Q<>nil then
                 Q.Free;
              Q:=nil;
              if NotFoundInactive then
                 Active:=False
              else begin
                 Modo := moBrowse;
                 State:=0;
                 if FTInLocaliza=True then begin
                    Active:=False;
                 end
                 else begin
                    FTInLocaliza:=True;
                    Try
                      Refresh;
                    Finally
                      FTInLocaliza:=False;
                    end;
                 end;
              end;
           end;
        end;
      Except
      // SE COME LOS ERRORES
      end;
    Finally
      State:=0;
    end;
  Finally
    LocalizaChange;
  end;
end;

function TInterFrame.LocalizaVacio:TQuery;
Const
   VL:Array[0..1] of String=('False','True');
var
   I:Integer;
   S,SQL:String;
   T:TinterCampo;
   Q:TQuery;
begin
  LocalizaVacio:=nil;
  IniciaLocaliza;
  if State=0 then
     raise EInterFrame.Create('['+ClassName+'] Imposible Iniciar un Proceso de Localización en '+ClassName);
  Try
    Try
      SQL:='';
      for I:=0 to FKeyFields.Count -1 do begin
          S:='';
          T:=FieldByName(FKeyFields.Strings[i]);
          Case T.Tipo of
            ftString  :S:=FKeyFields.Strings[i]+'='+#39+#39;
            ftInteger :S:=FKeyFields.Strings[i]+'=-1';
            ftFloat   :S:=FKeyFields.Strings[i]+'=-1';
            ftDateTime:S:=FKeyFields.Strings[i]+'='+#39+#39;
            ftDate    :S:=FKeyFields.Strings[i]+'='+#39+#39;
            ftBoolean :S:=FKeyFields.Strings[i]+'=NULL';
          end;
          if S<>'' then
             S:='('+S+')';
          AddSQL(SQL,S);
      end;
  if Not UseQuery then begin
     Raise EInterFrame.Create('['+ClassName+'] EL tipo de Frame no Puede Crear un Query Vacio '+ClassName);
  end
  else
     begin  State:=0;
            S:='SELECT * FROM '+TableName;
            if SQL<>'' then S:=S+' WHERE '+SQL;
            Q := CreaQuery(S,True); //QueryRequestLive);
            if (Q<>nil)
            then begin LocalizaVacio:=Q;
                       Active:=True;
                       Modo := moBrowse;
                       //Localiza:=InternalLocaliza;
                 end;
            //else begin if Q<>nil then Q.Free; Q:=nil;
            //     end;
      end;
     Except
     // SE COME LOS ERRORES
     end;
     Finally State:=0;
     end;
end;

function TInterFrame.IniciaLocaliza:Boolean;
begin
  if State<>0 then
     raise EInterFrame.Create('['+ClassName+'] Imposible Iniciar un Proceso de Localización en '+ClassName);
  State:=2;
  IniciaLocaliza:=True;
end;

function TInterFrame.Consulta:Boolean;
begin
   Consulta:=False;
   if Active=False then raise EInterFrame.Create('['+ClassName+'] No existe un Registro Activo que pueda ser consultado');
   Refresh;
   if (FInterFun.Bloqueado) or (Not FInterFun.Consultar) then raise EInterFrame.Create('['+ClassName+'] '+FinterFun.GetMsgError);
   Consulta := InternalConsulta;
end;

function TInterFrame.Catalogo:Boolean;
var
   MuestraCatalogo:Boolean;
   OldCvePerfil:LongInt;
   NewCvePerfil:LongInt;
begin
  Catalogo:=False;
  OldCvePerfil:=CvePerfil; NewCvePerfil:=OldCvePerfil;
  if(Apli<>nil)and(Apli.Active=True)then
     NewCvePerfil:=Apli.ClasePerfil;
  if OldCvePerfil<>NewCvePerfil then
     CvePerfil:=NewCvePerfil // Reinicializa los Objetos
  else
     RefreshAccess; // Reinicializa solo este Objeto.
  if (FInterFun.Bloqueado) or (Not FInterFun.Consultar) or (Not FInterFun.Catalogo) then
     raise EInterFrame.Create('['+ClassName+'] '+FinterFun.GetMsgError);
  MuestraCatalogo := True;
  if Assigned(FOnBeforeCatalogo) then
     FOnBeforeCatalogo(Self,MuestraCatalogo);
  if MuestraCatalogo=False then
     Exit;
  Try
    ControlState:=1;
    Try
      Result := InternalCatalogo;
    Finally
      ControlState:=0;
      DrawControl;
      if MasterSource<>nil then
         MasterSource.LocalizaCambioHijo(Self);
    end;
  Finally
    if Assigned(FOnAfterCatalogo) then
       FOnAfterCatalogo(Self);
  end;
end;

Function LocalizaArchivo(Var FileName:String):Boolean;
Const cgPublic='public\';
      cgFindit='Helps\';
var F:String;
    Ruta:String;
begin LocalizaArchivo:=False;
      if FileExists(FileName) then LocalizaArchivo:=True;
      {$IFNDEF  KMAINDIR}  Ruta:= ExtractFilePath(Application.ExeName); {$ENDIF}
      {$IFDEF  KMAINDIR}   Ruta:= KMAINDIR; {$ENDIF}
      F:=Ruta+FileName;
      if FileExists(F) then begin FileName:=F; LocalizaArchivo:=True; exit; end;
      F:=Ruta+cgFindit+FileName;
      if FileExists(F) then begin FileName:=F; LocalizaArchivo:=True; exit; end;
      F:=ExtractFilePath(ExtractFileDir(Ruta))+cgPublic+cgFindit+FileName;
      if FileExists(F) then begin FileName:=F; LocalizaArchivo:=True; exit; end;
      F:=ExtractFilePath(ExtractFileDir(ExtractFilePath(ExtractFileDir(Ruta))))+cgPublic+cgFindit+FileName;
      if FileExists(F) then begin FileName:=F; LocalizaArchivo:=True; exit; end;
end;


function TInterFrame.Help:Boolean;
var s : String;
begin
   S:=HelpFile;
   LocalizaArchivo(S);
   winhelp(application.Handle,PChar(S),help_Finder,0);
end;

function TInterFrame.Reporte:Boolean;
begin Reporte:=False; //Seleccionar
      //Seleccionar(Self,'Imprimir Perfiles','CVE_PERFIL','TX_DESC_PERFIL','',
      // 'Clave','Descricion','',nil,nil,nil);
end;

Procedure TInterFrame.PrintReporte(Preview:Boolean; TodosLosRegistros:Boolean); //Override;
begin Reporte;    //Execute
end;

(*******************************************************************INTERCAMPO****)
(*                                                                               *)
(*    INTERCAMPO                                                                 *)
(*                                                                               *)
(*******************************************************************INTERCAMPO****)

procedure TInterCampo.Notification( AComponent : TComponent; Operation : TOperation);
begin inherited;
    { If FDataset gets removed, clear the reference to avoid GPF! }
   if ( Operation = opRemove ) and ( AComponent = FControl )  then begin FControl:= nil; end;
   if ( Operation = opRemove ) and ( AComponent = FControl2 ) then begin FControl2:= nil; end;
end;

Function TInterCampo.ValidateRequiered:Boolean;
var Correcto:Boolean;
    IControl:TControl;
begin ValidateRequiered:=False;
      Correcto:=( Not ((AsString='')or(IsNull)));
      if Assigned(OnValidateRequiered)
      then begin OnValidateRequiered(Self,Correcto);
                 ValidateRequiered:=Correcto;
           end
      else begin ValidateRequiered:=Correcto;
           end;
      IControl:=Control;
      if (Not Correcto) and  (IControl<>nil)
      then begin if IControl is TWinControl
                 then begin Try
                            if IsEnabled(IControl)
                            then TWinControl(IControl).SetFocus;
                            Except if Caption=''
                                   then Raise EInterFrame.Create('['+ClassName+'] Se Requiere Información para el Campo '+Nombre+'.')
                                   else Raise EInterFrame.Create('['+ClassName+'] Se Requiere Información para el Campo '+Caption+'.');
                            end;
                       end;
                 if Caption=''
                 then Raise EInterFrame.Create('['+ClassName+'] Se Requiere Información para el Campo '+Nombre+'.')
                 else Raise EInterFrame.Create('['+ClassName+'] Se Requiere Información para el Campo '+Caption+'.');
            end;
end;

Procedure TInterCampo.SetIsNull(B:Boolean);
begin FIsNull:=B;
      if (State<>2)and(State<>1) and (IsParentOK) and (Padre.UseQuery)
      then begin if B then Padre.FQuery.FieldByName(Nombre).Clear;
           end
      else if State=0 then FValorActual:=null
      else if (State in [1,2])  then FValorNuevo:=null;
end;

Function TInterCampo.GetIsNull:Boolean;
begin if (IsParentOK) and (Padre.UseQuery) and (State<>2) and (State<>1)
      then GetIsNull:=Padre.FQuery.FieldByName(Nombre).IsNull
      else
      begin  if State=0
             then begin GetIsNull:=(FValorActual=null); end
             else begin if (State in [1,2])  then  GetIsNull:=(FValorNuevo=null); end;

      end;
end;

Function TInterCampo.IsParentOK:Boolean;
begin IsParentOK:=(Padre<>nil) and (ReadFromQuery) and (Padre.FQuery<>nil);
end;

Procedure TInterCampo.Cambio(Sender:TObject; Draw:Boolean);
begin if Draw then DrawControl;
      if Assigned(OnChange) then OnChange(Sender);
end;

Procedure TInterCampo.ComboChange;
var i:Integer;
begin if (Control<>nil) and (Control is TComboBox)
      then With TComboBox(Control) do
           begin if UseCombo then
                 begin I:=FComboLista.IndexOf(TrimRight(Text));
                       if (Padre.Modo=moEdit) and (Padre.Modo=moAppend) then
                       begin if I=-1
                             then AsString:=''
                             else AsString:=FComboDatos.Strings[i];
                       end;
                 end else AsString:=Text;
           end
      else
      if (Control<>nil) and (Control is TRadioGroup)
      then With TRadioGroup(Control) do
           begin if UseCombo then
                 begin I:=FComboLista.IndexOf(IntToStr(ItemIndex));
                       if (Padre.Modo=moEdit) and (Padre.Modo=moAppend)
                       then begin if I=-1
                                  then AsString:=''
                                  else AsString:=FComboDatos.Strings[i];
                            end;
                 end else AsString:=IntToStr(ItemIndex);
           end
end;

constructor TInterCampo.Create( AOwner : TComponent );
begin inherited Create(AOwner);
      FCaption:='';
      FControl:=nil;
      FControl2:=nil;
      FState:=0;
      FTipo:=ftString;
      FValorActual:=NULL;
      FValorNuevo:=NULL;
      StpSalida:=0;
      StpEntrada:=0;
      Padre:=TInterFrame(AOwner);
      FSize := 0;
      ReadFromQuery:=False;
      FComboDatos:=nil;
      FComboLista:=nil;
      FUseCombo:=False;
      FMasterField:='';
      FIsNull:=True;
      Controles:=TList.Create;
      Controles.Clear;

      LinkControles:=TList.Create;
      LinkControles.Clear;

      FTipoReader:=TrTexto;

      FIsRequiered:=False;
      FNoClear:=False;
      FNoCompare:=False;
      FNoSave:=False;
      FIsLongData:=False;
      FNoNull:=False;
end;


Procedure TInterCampo.LoadComboDatos(SQL:String; DefaultValue:Integer);
var Q1:TQuery;
    T:TControl;
    i:Integer;
begin Q1:=GetSqlQuery(SQL,Padre.DataBaseName,Padre.SessionName,True);
      Try
         UseCombo:=True;
         ComboDatos.Clear;
         ComboLista.Clear;
         if Q1<>nil then
         While Not (Q1.EOF) do
         begin ComboDatos.Add(Q1.Fields[0].AsString);
               ComboLista.Add(Q1.Fields[1].AsString);
               Q1.Next;
         end;
         T:=Control;
         if (T is TComboBox)and(FUseCombo) then
         begin TComboBox(T).Items.Clear;
               For i:=0 to FComboLista.Count-1 do
               begin if (I=DefaultValue)then TComboBox(T).ItemIndex:=I;
                     TComboBox(T).Items.Add(TrimRight(FComboLista.Strings[i]));
               end;
               if (DefaultValue=-1) then if TComboBox(T).Items.Count>0 then TComboBox(T).ItemIndex:=-1;
         end;
         DrawControl;
      Finally if Q1<>nil then Q1.Free;
      end;
end;

destructor TInterCampo.Destroy;
begin if LinkControles<>nil then LinkControles.Free;

      if Controles<>nil then Controles.Free;
      if FComboDatos<>nil then FComboDatos.Free;
      if FComboLista<>nil then FComboLista.Free;
      inherited;
end;

Function TInterCampo.GetState:Integer;
begin GetState:=Padre.State;
end;

Procedure TInterCampo.SetUseCombo(Usa:Boolean);
begin fUseCombo:=Usa;
      if Usa=True then
      begin if FComboDatos<>nil then FComboDatos.Free;
            if FComboLista<>nil then FComboLista.Free;
            FComboDatos:=TStringList.Create; FComboDatos.Clear;
            FComboLista:=TStringList.Create; FComboLista.Clear;
      end
      else
      begin if FComboDatos<>nil then FComboDatos.Free;
            if FComboLista<>nil then FComboLista.Free;
      end;
end;

Procedure TInterCampo.SetState(I:Integer);
begin FState:=I;
end;

Function TInterCampo.GetControlState:Integer;
begin GetControlState:=Padre.ControlState;
end;

Procedure TInterCampo.SetControlState(I:Integer);
begin FControlState:=I;
end;


Procedure TInterCampo.FieldsClear;
begin if (IsParentOK) and (Padre.UseQuery) and (padre.modo <> moInactive)
      then begin if Padre.FQuery.State in [dsInsert, dsEdit]
                 then begin if State<>2 then
                            begin if (FNoClear) and (Padre.FExModo=1)
                                  then Padre.FQuery.FieldByName(Nombre).Value:=FValorNuevo
                                  else Padre.FQuery.FieldByName(Nombre).Clear;
                                  Exit;
                            end;
                      end;
           end;
      if FNoClear then begin DrawControl; exit; end;
      if State=0 then FValorActual:=null
 else if (State in [1,2])  then FValorNuevo:=null;
    DrawControl;
end;

Procedure TInterCampo.FieldsSend;
begin if (IsParentOK) and (Padre.UseQuery)
      then begin if Padre.FQuery.FieldByName(Nombre).IsNull
      				then FValorNuevo:=NULL
                  else FValorNuevo:=Padre.FQuery.FieldByName(Nombre).AsString;
      		     Exit;
           end;
      FValorNuevo:=FValorActual;
end;

Procedure TInterCampo.FieldsReceive;
begin if (IsParentOK) and (Padre.UseQuery)
      then begin Exit; end;
      FValorActual:=FValorNuevo;
end;

Procedure TInterCampo.SetControl(T:TControl);
var i,j:Integer;
    Link:TInterLinkIt;
    Hijo:TInterFrame;
begin if T=nil then
      begin if Controles.Count<=0 then
               begin ShowMessage('Imposible Desasignar el Control '+Nombre);
               end
          else begin if LinkControles.Count>=1 then
                     begin if LinkControles[LinkControles.Count-1]<>nil
                           then begin TInterLinkit(LinkControles[LinkControles.Count-1]).Free;
                                end;
                           LinkControles.Delete(LinkControles.Count-1);
                     end;
                     Controles.Delete(Controles.Count-1);
               end;
      end
 else begin if (FMasterField<>'')  then
            begin T.Hint:='Click derecho para Mostrar Catálogo';
                  T.ShowHint:=True;
                  if T is TEdit then
                  begin //if (TEdit(T).PopupMenu=nil)and(Padre<>nil)
                        //then TEdit(T).PopUpMenu:=Padre.PopMenu;
                  end;
            end;
            I:=Controles.IndexOf(T);
            if I=-1 then begin Controles.Add(T);
                               Link:=nil;

                        If (Padre<>nil) and (Padre.UseLink) then
                        begin  if ( (T is TEdit) or (T is TInterEdit) or (T Is TMaskEdit) ) and (Padre<>nil)
                               then begin if (Padre.FKeyFields.IndexOf(FNombre)>=0) and (Padre.FKeyFields.Count=1)
                                          then begin Link:=TInterLinkIt.Create(Self);
                                                     LinK.Control:=T;
                                                     LinK.OnEjecuta:=Padre.OnLinkitExecute;
                                                     LinK.OnCapture:=Padre.LinkitCapture;
                                                     Link.TipoReader:=Padre.FieldByName(Padre.FKeyFields.Strings[0]).TipoReader;
                                          end
                                          else begin For i:=0 to Padre.FListMasterSource.Count-1 do
                                                     begin Hijo:=TInterFrame(Padre.FListMasterSource.Items[i]);
                                                           Try For j:=0 to Hijo.FFields.Count-1 do
                                                               begin if (Hijo.Fields[j].MasterField<>'') and (Hijo.Fields[j].MasterField=FNombre) and (Hijo.FKeyFields.Count=1)
                                                                     then  begin Link:=TInterLinkIt.Create(Self);
                                                                                 LinK.Control:=T;
                                                                                 Link.TipoReader:=TInterCampo(Hijo.FFields[j]).TipoReader;
                                                                                 LinK.OnEjecuta:=Hijo.OnLinkitExecute;
                                                                                 LinK.OnCapture:=Hijo.LinkitCaptureChild;
                                                                           end;
                                                               end;
                                                           Except // SE COME CUALQUIER ERROR
                                                           end;
                                                     end;
                                               end;
                                    end;
                               LinkControles.Add(Link);
                               if Link<>nil
                               then begin if T.Hint=''
                                          then begin if Caption<>''
                                                     then T.Hint:='Teclee... '+FCaption
                                                     else T.Hint:='Teclee... '+FNombre;
                                                     T.ShowHint:=True;
                                               end;
                                    end;
                        end;

                         end;
      end;
      if (T is TComboBox)and(FUseCombo) then
      begin TComboBox(T).Items.Clear;
            For i:=0 to FComboLista.Count-1 do
            begin TComboBox(T).Items.Add(TrimRight(FComboLista.Strings[i]));
            end;
      end;
      DrawControl;
end;

Function TInterCampo.GetControl:TControl;
begin if Controles.Count<=0 then
         begin GetControl:=nil;
         end
      else
         begin GetControl:=Controles[Controles.Count-1];
         end;
(*   if ControlState=0
         then GetControl:=FControl
         else GetControl:=FControl2;
*)
end;

Procedure TInterCampo.SetAsString(S:String);
begin if Size <> 0 then s:=copy(s,1,size);
      if (IsParentOK) and (Padre.UseQuery)
      then begin if (State<>2)and(State<>1) then
                 begin if S='' then Padre.FQuery.FieldByName(Nombre).Clear
                               else Padre.FQuery.FieldByName(Nombre).AsString:=S;
                        Cambio(Self,True);
                       Exit;
                 end;
           end;

      if State=0 then
        Begin
             If ((FTipo = ftDateTime)or(FTipo = ftDate)) and ((S = '')or(Trim(S)='/  /')) then FValorActual:= NULL else
                Begin If ((FTipo = ftDateTime)or(FTipo = ftDate))
                      Then begin if (FTipo = ftDate)
                                 then S:=FormatDateTime(ToFecha,StrToDateTime(S))
                                 else S:=MacvStrToDateTime(S);
                                 FValorActual:=S; //FormatDateTime(ToFechaHora,StrToDateTime(S))
                           end
                      else begin if S='' then IsNull:=True
                                         else FValorActual:=S;
                           end;
                End;
        End

      else if State in [1,2] then
          Begin
               If ((FTipo = ftDateTime)or(FTipo = ftDate)) and ((S = '')or(Trim(S)='/  /')) then FValorNuevo:= NULL else
                  Begin If ((FTipo = ftDateTime)or(FTipo = ftDate))
                        Then begin if (FTipo = ftDate)
                                   then S:=FormatDateTime(ToFecha,StrToDateTime(S))
                                   else S:=MacvStrToDateTime(S);
                                   FValorNuevo:=S;
                             end
                        else begin if S='' then IsNull:=True
                                           else FValorNuevo:=S;
                             end;
                  End;
          End;

     Cambio(Self,True);
end;

Procedure TInterCampo.SetAsInteger(I:LongInt);
begin if (IsParentOK) and (Padre.UseQuery)
      then begin if (State<>2)and(State<>1) then
                 begin Padre.FQuery.FieldByName(Nombre).AsInteger:=I;
                       Cambio(Self,True);
                       Exit;
                 end;
           end;
      if State=0 then FValorActual:=I
 else if State in [1,2] then FValorNuevo:=I;
      Cambio(Self,True);
end;

Procedure TInterCampo.SetAsFloat(F:Double);
begin if (IsParentOK) and (Padre.UseQuery)
      then begin if (State<>2)and(State<>1) then
                 begin Padre.FQuery.FieldByName(Nombre).AsFloat:=F;
                       Cambio(Self,True);
                       Exit;
                 end;
           end;
      if State=0 then FValorActual:=F
 else if State in [1,2] then FValorNuevo:=F;
      Cambio(Self,True);
end;

Procedure TInterCampo.SetAsBoolean(B:Boolean);
begin if (IsParentOK) and (Padre.UseQuery)
      then begin if (State<>2)and(State<>1) then
                 begin Padre.FQuery.FieldByName(Nombre).AsBoolean:=B;
                       Cambio(Self,True);
                       Exit;
                 end;
           end;
      if State=0 then FValorActual:=B
 else if State in [1,2] then FValorNuevo:=B;
      Cambio(Self,True);
end;

Procedure TInterCampo.SetAsDateTime(D:TDateTime);
begin if (IsParentOK) and (Padre.UseQuery)
      then begin if (State<>2)and(State<>1) then
                 begin Padre.FQuery.FieldByName(Nombre).AsDateTime:=D;
                       Cambio(Self,True);
                       Exit;
                 end;
           end;
      if State=0 then begin if (FTipo = ftDate)
                            then FValorActual:=FormatDateTime(ToFecha,D)
                            else FValorActual:=FormatDateTime(ToFechaHora,D)
                      end
 else if State in [1,2] then
                  begin  if (FTipo = ftDate)
                            then FValorNuevo:=FormatDateTime(ToFecha,D)
                            else FValorNuevo:=FormatDateTime(ToFechaHora,D);

                  end;
      Cambio(Self,True);
end;

Function TInterCampo.GetAsString:String;
var vls:String;
begin
   if (IsParentOK) and (Padre.UseQuery)
      then begin if (State<>2) and (State<>1)  then
      			  begin if Padre.FQuery=nil
                 		  then Result:=''
                 		  else begin if FNoNull
                                             then begin if Padre.FQuery.FieldByName(Nombre).IsNull
                                                        then Result:=' '
                                                        else begin if Padre.FQuery.FieldByName(Nombre).AsString=''
                                                                   then Result:=' '
                                                                   else Result:=Padre.FQuery.FieldByName(Nombre).AsString;
                                                             end;
                                                  end
                                              else Result:=Padre.FQuery.FieldByName(Nombre).AsString;
                                       end;
                                Exit;
                          end;
           end;
      if State=0 then
         begin if FValorActual=NULL then
                   Result:=''
               else begin If ((FTipo = ftDateTime)or(FTipo = ftDate)) Then
                               Begin if (VarType(FValorActual) and  VarDate)=VarDate
                                     then  If FValorActual= 0 then Result:=''
                                     else begin //Vls:=FValorNuevo;
                                                Result:=VarToStr(FValorActual);
                                          end
                                     else if (VarType(FValorActual) and  VarString)=VarString
                                     then Result:=FValorActual
                                     else Result:=VarToStr(FValorActual);
                               end
                            else Result:=FValorActual;

//                          If ((FTipo = ftDateTime)or(FTipo = ftDate)) Then
//                             Begin If FValorActual = 0 then Result:='' else Result:=FValorActual;
//                             end
//                         else Result:=FValorActual;
                     end;
         end
      else if State in [1,2] then
         begin if FValorNuevo=NULL then
                   Result:=''
               else begin If ((FTipo = ftDateTime)or(FTipo = ftDate)) Then
                               Begin if (VarType(FValorNuevo ) and  VarDate)=VarDate
                                     then  If FValorNuevo = 0 then Result:=''
                                     else begin //Vls:=FValorNuevo;
                                                Result:=VarToStr(FValorNuevo);
                                          end
                                     else if (VarType(FValorNuevo ) and  VarString)=VarString
                                     then Result:=FValorNuevo
                                     else Result:=VarToStr(FValorNuevo);
                               end
                            else begin vls:=FValorNuevo;
                                       if (vls='') and (FNoNull)
                                          then Result:=' '
                                          else Result:=FValorNuevo;
                                 end;
                     end;
         end;
end;

Function TInterCampo.GetAsSQL:String;
Const VL:Array[0..1] of String=('False','True');
var S:String;
var fmt: fmtdate;
begin Case Tipo of
      ftString  :S:=#39+SinQuote(AsString)+#39;
      ftInteger :S:=AsString;
      ftFloat   :S:=AsString;
      ftDateTime:begin if vgUseAccess
                       then S:='CVDATE('+#39+FormatDateTime(ToFechaHora,AsDateTime)+#39+')'
                       else if vgUseParadox
                            then S:=#39+FormatDateTime(ToFechaHora,AsDateTime)+#39
                            else S:='TO_DATE('+#39+FormatDateTime(ToFechaHora,AsDateTime)+#39+','+#39+'DD/MM/YYYY HH24:MI:SS'+#39+')';
                 end;
      ftDate    :begin
                if vgUseParadox
                       then begin //fmt.szDateSeparator[0]:='/';
                                  //fmt.szDateSeparator[1]:=#0;
                                  //fmt.iDateMode:=1;
                                  //fmt.bFourDigitYear:=True;
                                  //fmt.bYearBiased   :=False;
                                  //fmt.bMonthLeadingZero :=True;
                                  //fmt.bDayLeadingZero   :=True;
                                  //check(dbiSetDateFormat(fmt));
                            end;
                       if vgUseAccess
                       then S:='CVDATE('+#39+FormatDateTime(ToFecha,AsDateTime)+#39+')'
                       else if vgUseParadox
                       then S:=#39+FormatDateTime(ToFecha,AsDateTime)+#39
                       else S:='TO_DATE('+#39+FormatDateTime(ToFecha,AsDateTime)+#39+','+#39+'DD/MM/YYYY'+#39+')';
                 end;
      ftBoolean :S:=#39+Vl[Byte(AsBoolean)]+#39;
      end;
      GetAsSql:=S;
end;



Function TInterCampo.GetAsCombo:String;
var i:Integer;
    S:String;
begin S:=AsString;
      if Not FUseCombo
      then begin GetAsCombo:=S;
           end
      else begin I:=FComboDatos.IndexOf(TrimRight(S));
                 if I=-1 then GetAsCombo:=S else GetAsCombo:=FComboLista[i];
           end;
end;



Function TInterCampo.GetAsInteger:LongInt;
Var S:String;
Function AsI(S:String):LongInt;
var R:Real;
begin R:=StrToDateTime(S);
      AsI:=Trunc(R);
end;

begin if (IsParentOK) and (Padre.UseQuery)
      then begin if (State<>2) and (State<>1) then
      			  begin if Padre.FQuery=nil
                 		  then Result:=0
                 		  else Result:=Padre.FQuery.FieldByName(Nombre).AsInteger;
                 		  Exit;
                 end;
           end;
      if State=0 then begin if FValorActual=NULL then Result:=0
                            else begin If ((FTipo = ftDateTime)or(FTipo = ftDate))
                                       then begin S:=FValorActual;
                                                  Result:=AsI(S);
                                            end
                                       else begin Result:=FValorActual
                                            end;
                                end;
                      end
else if State in [1,2] then begin if FValorNuevo=NULL then Result:=0
                                  else begin If ((FTipo = ftDateTime)or(FTipo = ftDate))
                                             then begin S:=FValorNuevo;
                                                        Result:=AsI(S);
                                                  end
                                             else begin Result:=FValorNuevo
                                                  end;
                                       end;
                            end;
end;

Function TInterCampo.GetAsFloat:Double;
Var S:String;
Function AsF(S:String):Real;
var R:Real;
begin Result:=StrToDateTime(S);
end;

begin if (IsParentOK) and (Padre.UseQuery) then
			begin if (State<>2) and (State<>1) then
      			  begin if Padre.FQuery=nil
                 		  then Result:=0
                 		  else Result:=Padre.FQuery.FieldByName(Nombre).AsFloat;
                 		  Exit;
                 end;
         end;
      if State=0 then begin if FValorActual=NULL then Result:=0
                            else begin If ((FTipo = ftDateTime)or(FTipo = ftDate))
                                       then begin S:=FValorActual;
                                                  Result:=AsF(S);
                                            end
                                       else begin Result:=FValorActual
                                            end;
                                end;
                      end
else if State in [1,2] then begin if FValorNuevo=NULL then Result:=0
                                  else begin If ((FTipo = ftDateTime)or(FTipo = ftDate))
                                             then begin S:=FValorNuevo;
                                                        Result:=AsF(S);
                                                  end
                                             else begin Result:=FValorNuevo
                                                  end;
                                       end;
                            end;
end;

Function TInterCampo.GetAsBoolean:Boolean;
begin if (IsParentOK) and (Padre.UseQuery)
      then begin if (State<>2) and (State<>1) then
      			  begin if Padre.FQuery=nil
                 		  then Result:=False
                 		  else Result:=Padre.FQuery.FieldByName(Nombre).AsBoolean;
                 		  Exit;
                 end;
           end;
       if State=0 then begin if FValorActual=NULL then Result:=False else Result:=FValorActual end
  else if State in [1,2] then begin if FValorNuevo=NULL then Result:=False else Result:=FValorNuevo; end;
end;

Function TInterCampo.GetAsDateTime:TDateTime;
var vlS:String;
begin if (IsParentOK) and (Padre.UseQuery)
      then begin if (State<>2) and (State<>1) then
      			  begin if Padre.FQuery=nil
                 	     then Result:=0
                 		  else Result:=Padre.FQuery.FieldByName(Nombre).AsDateTime;
                 		  Exit;
                 end;
           end;
        if State=0 then begin if FValorActual=NULL then Result:=0
                              else begin vlS:=FValorActual;
                                         Result:=StrToDateTime(vlS); //FValorActual
                                         if Trim(vls)='0'
                                         then BEGIN FValorActual:=NULL;
                                                    Result:=0;
                                              END
                                         ELSE Result:=StrToDateTime(vlS); //FValorNuevo;
                                   end;
                       end
  else if State in [1,2] then begin if FValorNuevo=NULL then Result:=0
                else begin vlS:=FValorNuevo;
                           if Trim(vls)='0'
                           then BEGIN FValorNuevo:=NULL;
                                      Result:=0;
                                END
                           ELSE Result:=StrToDateTime(vlS); //FValorNuevo;
                     end;
                end;
end;
(*
Procedure TInterCampo.SaveToBitmap;
var BMP:TBitmap;
begin Bmp:=
end;

Procedure TInterCampo.GetFromBitmap;
var BMP:TBitmap;
begin Bmp:=
end;
*)

Function GetAsTime(S:String):String;
var i:Integer;
    AuxS:String;
begin AuxS:='';
      for i:=1 to Length(S) do
      begin if S[i] in ['0'..'9']
               then AuxS:=AuxS+S[i];
      end;
      GetAsTime:=AuxS;
end;


Function ShowAsTime(S:String):String;
begin S:='000000'+S;
      S:=Copy(S,Length(S)-5,6);
      ShowAsTime:=Copy(S,1,2)+':'+Copy(S,3,2)+':'+Copy(S,5,2);
end;

Procedure TInterCampo.DrawControl;
Var i:Integer;
    IControl:TControl;

function Veri(S:String):String;
begin if IsOraTime then
      begin Veri:=ShowAsTime(S);
      end
      else Veri:=S;
end;

begin IControl:=Control;
      if IControl<>nil then
      begin if IControl Is TEdit then
              With TEdit(IControl) do
              begin Text:=Veri(AsString);
              end
      else if IControl Is TInterEdit then
              With TInterEdit(IControl) do
              begin  Text:=Veri(AsString);
              end
       else if IControl Is TLabel then
              With TLabel(IControl) do
              begin Caption:=Veri(AsString);
              end
       else if IControl Is TPanel then
              With TPanel(IControl) do
              begin Caption:=Veri(AsString);
              end
       else if IControl Is TCheckBox then
              With TCheckBox (IControl) do
              begin if Trim(AsString)='V'
                    then Checked:=True
                    else Checked:=False;
              end
       else if IControl Is TMaskEdit then
              With TMaskEdit(IControl) do
              begin Text:=Veri(AsString);
              end
       else if IControl Is TComboBox then
              With TComboBox(IControl) do
              begin if UseCombo then
                    begin I:=FComboDatos.IndexOf(TrimRight(AsString));
                          if I=-1
                          then ItemIndex:=-1
                          else ItemIndex:=I;
                          //Text:=FComboLista.Strings[i];
                    end
                    else
                    if TComboBox(IControl).Style=csDropDownList
                    then begin TComboBox(IControl).ItemIndex:=TComboBox(IControl).Items.IndexOf(TrimRight(AsString));
                               if Assigned(TComboBox(IControl).OnChange) then
                               TComboBox(IControl).OnChange(nil);
                         end
                    else Text:=AsString;
              end
       else if IControl Is TRadioGroup then
              With TRadioGroup(IControl) do
              begin if UseCombo then
                    begin I:=FComboDatos.IndexOf(TrimRight(AsString));
                          if I=-1
                          then ItemIndex:=-1
                          else ItemIndex:=StrToInt(FComboLista.Strings[i]);
                          //Text:=FComboLista.Strings[i];
                    end;
              end
       else if IControl Is TDBImage then
              With TDBImage(IControl) do
              begin DataField:=Nombre;
                    if (IsParentOK) and (Padre.UseQuery)
                       then DataSource:=Padre.FInternalDataSource;
              end
        (*
       else if IControl Is TImageWindow then
              With TImageWindow(IControl) do
              begin DataField:=Nombre;
                    if (IsParentOK) and (Padre.UseQuery)
                       then Begin DataSource:=Padre.FInternalDataSource;
                                  DataField := 'FOTO_PERSONA';
                                  if Padre.FInternalDataSource.Dataset <> nil then
                                     Padre.FInternalDataSource.Dataset.First;

                            End;
              end
         *)
       else if IControl Is TMemo then
              With TMemo(IControl) do
              begin  TMemo(IControl).Lines.SetText(PChar(Veri(AsString)));
              end;
      end;{TIControl}
      Cambio(Self,False);
end;

Procedure TInterCampo.GetFromControl;
var i:Integer;
    IControl:TControl;

function Veri(S:String):String;
begin if IsOraTime then
      begin Veri:=GetAsTime(S);
      end
      else Veri:=S;
end;

begin IControl:=Control;
      if IControl<>nil then
      begin if IControl Is TEdit then
              With TEdit(IControl) do
              begin  AsString:=Veri(Text);
              end
        else if IControl Is TInterEdit then
              With TInterEdit(IControl) do
              begin  AsString:=Veri(Text);
              end
       else if IControl Is TLabel then
              With TLabel(IControl) do
              begin //AsString:=Caption;
              end
       else if IControl Is TPanel then
              With TPanel(IControl) do
              begin //AsString:=Caption;
              end
       else if IControl Is TCheckBox then
              With TCheckBox (IControl) do
              begin if Checked then AsString:='V' else AsString:='F';
              end
       else if IControl Is TMaskEdit then
              With TMaskEdit(IControl) do
              begin AsString:=Veri(Text);
              end
       else if IControl Is TComboBox then
              With TComboBox(IControl) do
              begin if UseCombo then
                    begin I:=FComboLista.IndexOf(TrimRight(Text));
                          if I=-1
                          then AsString:=''
                          else AsString:=TrimRight(FComboDatos.Strings[i]);
                    end
                    else AsString:=Text;
              end
       else if IControl Is TRadioGroup then
              With TRadioGroup(IControl) do
              begin if UseCombo then
                    begin I:=FComboLista.IndexOf(IntToStr(ItemIndex));
                          if I=-1
                          then AsString:=''
                          else AsString:=FComboDatos.Strings[i];
                    end
                    else AsString:=IntToStr(ItemIndex);
              end
       else if IControl Is TDBImage then
              With TDBImage(IControl) do
              begin  //DataField:=Nombre;
                     //DataSource:=FInternalDataSource;
              end
       else if IControl Is TMemo then
              With TMemo(IControl) do
              begin  AsString:=Veri(TMemo(IControl).Text); //Lines.GetText;
              end;
       end;{TIControl}
end;

Procedure StartInterFrameDebug;
begin
if FileExists(ExtractFilePath(Application.ExeName)+'INTDEBUG.TXT')
          then DeleteFile(ExtractFilePath(Application.ExeName)+'INTDEBUG.TXT');
end;

begin
end.


