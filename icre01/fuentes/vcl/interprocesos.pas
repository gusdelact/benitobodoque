{
I N T E R P R O C E S O S
}
//FECHA DE MODIFICACION  : 22/03/2001
//AUTOR                  : MANUEL ROMERO IBARRA
//MODIFICACION           : SE IMPLEMENTO MODIFICACION EN LINEA


//MODIFICO               : SERGIO EDUARDO LOPEZ LOPEZ
//FECHA                  : 14-05-2002
//OBSERVACIONES          : Se agrego el método DESCUBREARBOL que debe ser llamado
//                         antes de ejecutar el metodo ActivaProcesos en arboles
//                         demasidado grandes.

//                         Agrego la propiedad FOpera para asiganar un fecha distinta
//                         a la que tiene el Apli. Y Tambien  la función ObtFechaOperacion
//                         que retorna la fecha del apli o el valor de la propiedad

unit InterProcesos;

interface

uses
  Windows,  Messages, SysUtils, Classes,  Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ComCtrls, VirtualTrees, ImgList, Buttons, DB,
  UnSQL2,   InterApl, Dialogs, Grids, DbTables, //IntProcEdit,
  FileCtrl, ShellAPI, Mask;

type
  TGeneraProceso  = Procedure(Sender          : Tobject;
                              PPCveProceso    : String;
                              PPNumSecuencia  : Integer;
                              PPCveProcesoRel : String;
                              PPCveFuncion    : String;
                              PPDigitaliza    : Boolean;
                              var PPComenta   : String;
                              var PPTodoOk    : Boolean) of Object;
  TDespuesProceso = Procedure(Sender : Tobject) of Object;

  TTipoErrorProc  = ( teNoError, teNoCritico, teCritico ); 

  // node data record for the general features treeview
  PNodeData = ^TNodeData;
  TNodeData = record
    CveProc       : String;
    Situacion     : String;
    FHIni         : String;
    FHFin         : String;
    Level         : Integer;
    DesProc       : String;
    CveFuncion    : String;
    BEjecMultiple : String;
    BObligatorio  : String;
    BProcCritico  : String;
    BDigitaliza   : String;
    UsuarioResp   : String;
    Comentario    : String;
    NoColEdit     : Integer;
    Ramas         : Integer;
    IndexActual   : Integer;
    Changed       : Boolean;
    NodeCheck     : Boolean;
  end;

  TInterProcesos = class(TCustomPanel)
//  TInterProcesos = class(TCustomControl)
//  TInterProcesos = class(TWinControl)
//  TInterProcesos = class(TGraphicControl)
  private
    { Private declarations }
    //VARIABLES
    VLIdexNuevo        : Integer;
    SG                 : TStringGrid;
    FApli              : TInterApli;
    //EVENTOS PROPIOS
    FGeneraProceso         : TGeneraProceso;
    FDespuesProceso        : TDespuesProceso;
    //PROPIEDADES
    FPresentaCveFuncion    : Boolean;
    FPresentaBEjecMultiple : Boolean;
    FPresentaBObligatorio  : Boolean;
    FPresentaBProcCritico  : Boolean;
    FPresentaBDigitaliza   : Boolean;
    FPresentaUsuarioResp   : Boolean;
    //PROPIEDAD DE FECHA DE OPERACION  --SRG
    fFOpera                : TDateTime;
    fTipoError             : TTipoErrorProc;
    //EVENTOS TREE
    procedure ViSrTrGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure ViSrTrGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: Integer; TextType: TVSTTextType; var Text: WideString);
    procedure ViSrTrInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure ViSrTrGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: Integer;
      var Index: Integer);
    procedure ViSrTrInitChildren(Sender: TBaseVirtualTree;
      Node: PVirtualNode; var ChildCount: Cardinal);
    procedure ViSrTrGetDrawInfo(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: Integer; TextType: TVSTTextType;
      var DrawInfo: TDrawInfo);
    procedure ViSrTrChecking(Sender: TBaseVirtualTree; Node: PVirtualNode;
      var NewState: TCheckState; var Allowed: Boolean);
    procedure ViSrTrEditing(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: Integer; var Allowed: Boolean);
    procedure ViSrTrChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure ViSrTrCreateEditors(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: Integer;
      out EditLink: IVTEditLink);
    //SET PARA PROPIEDADES
    procedure Notification( AComponent : TComponent; Operation : TOperation); override;
    procedure SetPresentaCveFuncion(PPBoolean  : Boolean);
    procedure SetPresentaBEjecMultiple(PPBoolean  : Boolean);
    procedure SetPresentaBObligatorio(PPBoolean  : Boolean);
    procedure SetPresentaBProcCritico(PPBoolean  : Boolean);
    procedure SetPresentaBDigitaliza(PPBoolean  : Boolean);
    procedure SetPresentaUsuarioResp(PPBoolean  : Boolean);
    //FUNCIONES
    Function CreaArbolGrid          : Boolean;   //CREA STRINGGRID PARA ALMACENAR CAMPOR DEL QUERY
    Function DestroyArbolGrid       : Boolean;   //DESTRUYE EL STRINGGRID
    Function GeneraArbolSQL         : Boolean;   //GENERA ARBOL SQL Y LLENA GRID
    Function ObtenIndex(                         //DATOS DEL SIGUIENTE NODO
             PPIndex    : Integer;
         var PPLevel    : Integer;
         var PPNoChild  : Integer;
         var PPProcRel  : String;
         var PPProceso  : String;
         var PPIndexSig : Integer;
         var PPBUltimoN : Boolean)  : Boolean;
    Function ValidaChechked(
             PPIndex : Integer)     : Boolean;   //INDICA SI SE PERMITE EL CHEQUET
    Function ValidaUnChechked(
             PPIndex : Integer)     : Boolean;   //INDICA SI SE PERMITE EL UNCHEQUET
    Function ObtenSitChechk(
             PPIndex   : Integer;
             PPBUltNiv : Boolean)   : Boolean;   //INDICA LA SITUACION DEL CHEQUET
    Procedure PintaTree(
              PPBCarga : Boolean);              //PINTA EL ARBOL
    Function ValidaNodoEdit(
             PPColumn : Integer) : Boolean;     //Determina que nodo se puede editar
    Function DameNumColEdit(
             PPColumn : Integer) : Integer;     //Indica de las columnas editables que numero es
    //FUNCIONES UPDATE
    Function UpdateSitIni(
             PPIDEmpresa      : Integer;
             PPCveAplicacion  : String;
             PPCveProceso     : String;
             PPNumSecuencia   : Integer;
             PPCveProcesoRel  : String;
             PPFHInicioEvento : TDateTime)  : Boolean;   //ACTUALIZA SITUACION INICIAL
    Function UpdateSitFin(
             PPIDEmpresa      : Integer;
             PPCveAplicacion  : String;
             PPCveProceso     : String;
             PPNumSecuencia   : Integer;
             PPCveProcesoRel  : String;
             PPFHFinEvento    : TDateTime;
             PPComenta        : String;
             PPNewSitRel      : String)  : Boolean;   //ACTUALIZA SITUACION FINAL
  protected
    { Protected declarations }
    ViSrTr    : TVirtualStringTree;
    PanelInf  : TPanel;
    PanelCont : TPanel;
    pbProceso : TProgressBar;
  private
    function ObtFechaOperacion : TDateTime;
  public
    { Public declarations }
    Proceso     : String;
    IDEmpresa   : Integer;
    Admin       : Boolean;
    MuestraConf : Boolean;
    Interm      : TMemo;
    Constructor Create(AOwner:TComponent); override;  //CREA INTERPROCESOS
    Destructor  Destroy; override;                    //DESTRUYE INTERPROCESOS
    procedure   ArmaTree;                             //DIBUJA ARBOL EN FORMATO RUN
    Function    ActivaProcesos         : Boolean;     //OBTIENE Y DISPARA PROCESOS.
    Procedure   RepintaTree;                          //REPINTA ARBOL
    Procedure   DescubreArbol;                        //DESCUBRE EL ARBOL
  published
    { Published declarations }
    property Align;
    property Apli :  TInterApli read FApli write FApli;    //Propiedad que permite obtener el usuario y la empresa
    property PresentaCveFuncion: Boolean read FPresentaCveFuncion write SetPresentaCveFuncion default True;
    property PresentaBEjecMultiple: Boolean read FPresentaBEjecMultiple write SetPresentaBEjecMultiple default True;
    property PresentaBObligatorio: Boolean read FPresentaBObligatorio write SetPresentaBObligatorio default True;
    property PresentaBProcCritico: Boolean read FPresentaBProcCritico write SetPresentaBProcCritico default True;
    property PresentaBDigitaliza: Boolean read FPresentaBDigitaliza write SetPresentaBDigitaliza default True;
    property PresentaUsuarioResp: Boolean read FPresentaUsuarioResp write SetPresentaUsuarioResp default True;
    property OnGeneraProceso : TGeneraProceso read FGeneraProceso write FGeneraProceso;
    property OnDespuesProceso : TDespuesProceso read FDespuesProceso write FDespuesProceso;
    //PROPIEDAD FECHA DE OPERACION  ----SRG
    property FOpera : TDateTime read FFOpera write FFOpera;//Asigna una fecha de operacion distinta al Apli
    property TipoError : TTipoErrorProc read fTipoError; // Tipo de error. Critico o No critico    
  end;

type

  TPropertyEditLink = class(TInterfacedObject, IVTEditLink)
  private
    FEdit: TWinControl;
    FTree: TBaseVirtualTree;
    FNode: PVirtualNode;
    FColumn: Integer;
    FOldEditProc: TWndMethod;
    FStopping: Boolean;
  protected
    procedure DoEndEdit; virtual;
    procedure EditWindowProc(var Message: TMessage);
    procedure EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  public
    destructor Destroy; override;
    function BeginEdit: Boolean; stdcall;
    procedure CancelEdit; stdcall;
    function CanStop: Boolean; stdcall;
    procedure EndEdit; stdcall;
    function GetBounds: TRect; stdcall;
    function PrepareEdit(Tree: TBaseVirtualTree; Node: PVirtualNode; Column: Integer): Boolean; stdcall;
    procedure SetBounds(R: TRect); stdcall;
  end;

procedure Register;

implementation



procedure   TInterProcesos.ArmaTree;
var   NewCol,ColIni,ColIndex :Integer;
begin
     //ASIGNA EMPRESA
     if IDEmpresa = 0 then
         IDEmpresa := apli.IdEmpresa
     else
         apli.IdEmpresa := IDEmpresa;
     //end if
     //CREA COMPONENTES
     ViSrTr.Anchors := [akLeft,akTop];
     ViSrTr.BevelKind := bkFlat;
     ViSrTr.BevelOuter := bvRaised;
     ViSrTr.BorderStyle := bsNone;
     ViSrTr.CheckImageKind := ckDarkTick;
//   ViSrTr.DragMode := dmAutomatic;
     ViSrTr.DragMode := dmManual;
     ViSrTr.GridLineColor := clHighlight;
     ViSrTr.Header.Options :=[hoColumnResize,hoDrag,hoHotTrack,hoShowHint,hoShowImages,hoVisible];
//     ViSrTr.HintAnimation := hatSlide;
     ViSrTr.HintAnimation := hatNone;
     ViSrTr.HintMode := hmTooltip;
     ViSrTr.HotCursor := crHandPoint;
     ViSrTr.options :=[voAcceptOLEDrop,voAnimatedToggle,voAutoDropExpand,
                       voAutoScroll,voAutoSpanColumns,voAutoTristateTracking,
                       voCheckSupport,voCustomizeItems,voEditable,voExtendedFocus,
                       voInitOnSave,voMultiSelect,voShowButtons,voShowRoot,
                       voShowTreeLines,voShowVertGridLines,voToggleOnDblClick];
     ViSrTr.RootNodeCount := 1;
     ViSrTr.ShowHint := True;

     NewCol := 0;
    //AGREGA COLUMNA (A)
     ViSrTr.Header.Columns.Add;
     ViSrTr.Header.Columns[NewCol].Hint := 'Columna Principal';
     ViSrTr.Header.Columns[NewCol].ImageIndex := 10;
     ViSrTr.Header.Columns[NewCol].Layout := blGlyphLeft;
     ViSrTr.Header.Columns[NewCol].MaxWidth := 10000;
     ViSrTr.Header.Columns[NewCol].MinWidth := 10;
//     ViSrTr.Header.Columns[NewCol].Options :=  [coAllowClick ,coEnabled,coMovable,coParentBidiMode,coResizable,coShowDropMark,coVisible];
     ViSrTr.Header.Columns[NewCol].Options :=  [coEnabled,coParentBidiMode,coResizable,coVisible];
     ViSrTr.Header.Columns[NewCol].Position := 1;
     ViSrTr.Header.Columns[NewCol].Spacing := 20;
     ViSrTr.Header.Columns[NewCol].Style := vsText;
     ViSrTr.Header.Columns[NewCol].Text := 'Arbol de Procesos';
     ViSrTr.Header.Columns[NewCol].Width := 300;
     NewCol := 1;
     //AGREGA COLUMNA (B)
     ViSrTr.Header.Columns.Add;
     ViSrTr.Header.Columns[NewCol].Hint := 'Imagenes de columna';
     ViSrTr.Header.Columns[NewCol].ImageIndex := -1;
     ViSrTr.Header.Columns[NewCol].Layout := blGlyphRight;
     ViSrTr.Header.Columns[NewCol].MaxWidth := 22;
     ViSrTr.Header.Columns[NewCol].MinWidth := 10;
     ViSrTr.Header.Columns[NewCol].Options :=  [coEnabled,coParentBidiMode,coVisible];
     ViSrTr.Header.Columns[NewCol].Position := 0;
     ViSrTr.Header.Columns[NewCol].Spacing := 0;
     ViSrTr.Header.Columns[NewCol].Style := vsText;
     ViSrTr.Header.Columns[NewCol].Text := '';
     ViSrTr.Header.Columns[NewCol].Width := 22;
     NewCol := 2;
     //AGREGA COLUMNA (C)
     ViSrTr.Header.Columns.Add;
     ViSrTr.Header.Columns[NewCol].Hint := 'Situación del proceso';
     ViSrTr.Header.Columns[NewCol].ImageIndex := 7;
     ViSrTr.Header.Columns[NewCol].Layout := blGlyphRight;
     ViSrTr.Header.Columns[NewCol].MaxWidth := 10000;
     ViSrTr.Header.Columns[NewCol].MinWidth := 10;
//     ViSrTr.Header.Columns[NewCol].Options :=  [coAllowClick ,coEnabled,coMovable,coParentBidiMode,coResizable,coShowDropMark,coVisible];
     ViSrTr.Header.Columns[NewCol].Options :=  [coEnabled,coParentBidiMode,coResizable,coVisible];
     ViSrTr.Header.Columns[NewCol].Position := 2;
     ViSrTr.Header.Columns[NewCol].Spacing := 10;
     ViSrTr.Header.Columns[NewCol].Style := vsText;
     ViSrTr.Header.Columns[NewCol].Text := 'Situación';
     ViSrTr.Header.Columns[NewCol].Width := 75;
     NewCol := 3;
     //AGREGA COLUMNA (D)
     ViSrTr.Header.Columns.Add;
     ViSrTr.Header.Columns[NewCol].Hint := 'Fecha y Hora Inicial del proceso';
     ViSrTr.Header.Columns[NewCol].ImageIndex := 5;
     ViSrTr.Header.Columns[NewCol].Layout := blGlyphRight;
     ViSrTr.Header.Columns[NewCol].MaxWidth := 10000;
     ViSrTr.Header.Columns[NewCol].MinWidth := 10;
//     ViSrTr.Header.Columns[NewCol].Options :=  [coAllowClick ,coEnabled,coMovable,coParentBidiMode,coResizable,coShowDropMark,coVisible];
     ViSrTr.Header.Columns[NewCol].Options :=  [coEnabled,coParentBidiMode,coResizable,coVisible];
     ViSrTr.Header.Columns[NewCol].Position := 3;
     ViSrTr.Header.Columns[NewCol].Spacing := 10;
     ViSrTr.Header.Columns[NewCol].Style := vsText;
     ViSrTr.Header.Columns[NewCol].Text := 'Fec/Hor INI';
     ViSrTr.Header.Columns[NewCol].Width := 95;
     NewCol := 4;
     //AGREGA COLUMNA (E)
     ViSrTr.Header.Columns.Add;
     ViSrTr.Header.Columns[NewCol].Hint := 'Fecha y Hora final del proceso';
     ViSrTr.Header.Columns[NewCol].ImageIndex := 5;
     ViSrTr.Header.Columns[NewCol].Layout := blGlyphRight;
     ViSrTr.Header.Columns[NewCol].MaxWidth := 10000;
     ViSrTr.Header.Columns[NewCol].MinWidth := 10;
//     ViSrTr.Header.Columns[NewCol].Options :=  [coAllowClick ,coEnabled,coMovable,coParentBidiMode,coResizable,coShowDropMark,coVisible];
     ViSrTr.Header.Columns[NewCol].Options :=  [coEnabled,coParentBidiMode,coResizable,coVisible];
     ViSrTr.Header.Columns[NewCol].Position := 4;
     ViSrTr.Header.Columns[NewCol].Spacing := 10;
     ViSrTr.Header.Columns[NewCol].Style := vsText;
     ViSrTr.Header.Columns[NewCol].Text := 'Fec/Hor FIN';
     ViSrTr.Header.Columns[NewCol].Width := 95;
     //CONFIGURABLES
     ColIni := ViSrTr.Header.Columns.Count-1;
     if FPresentaCveFuncion then
     begin
          ViSrTr.Header.Columns.Add;
          NewCol := ViSrTr.Header.Columns.Count-1;
          ViSrTr.Header.Columns[NewCol].Hint := 'Funcion a Ejecutar';
          ViSrTr.Header.Columns[NewCol].Text := 'Funcion';
          ViSrTr.Header.Columns[NewCol].Width := 75;
     end;
     if FPresentaBEjecMultiple then
     begin
          ViSrTr.Header.Columns.Add;
          NewCol := ViSrTr.Header.Columns.Count-1;
          ViSrTr.Header.Columns[NewCol].Hint := 'Ejecucion Muliple';
          ViSrTr.Header.Columns[NewCol].Text := 'Ejec Multiple';
          ViSrTr.Header.Columns[NewCol].Width := 75;
     end;
     if FPresentaBObligatorio then
     begin
          ViSrTr.Header.Columns.Add;
          NewCol := ViSrTr.Header.Columns.Count-1;
          ViSrTr.Header.Columns[NewCol].Hint := 'Proceso Obligatorio';
          ViSrTr.Header.Columns[NewCol].Text := 'Obligatorio';
          ViSrTr.Header.Columns[NewCol].Width := 75;
     end;
     if FPresentaBProcCritico then
     begin
          ViSrTr.Header.Columns.Add;
          NewCol := ViSrTr.Header.Columns.Count-1;
          ViSrTr.Header.Columns[NewCol].Hint := 'Proceso Crítico';
          ViSrTr.Header.Columns[NewCol].Text := 'Proc Crítico';
          ViSrTr.Header.Columns[NewCol].Width := 75;
     end;
     if FPresentaBDigitaliza then
     begin
          ViSrTr.Header.Columns.Add;
          NewCol := ViSrTr.Header.Columns.Count-1;
          ViSrTr.Header.Columns[NewCol].Hint := 'Reporte Digitalizado';
          ViSrTr.Header.Columns[NewCol].Text := 'Digitaliza';
          ViSrTr.Header.Columns[NewCol].Width := 75;
     end;
     if FPresentaUsuarioResp then
     begin
          ViSrTr.Header.Columns.Add;
          NewCol := ViSrTr.Header.Columns.Count-1;
          ViSrTr.Header.Columns[NewCol].Hint := 'Usuario Responsable';
          ViSrTr.Header.Columns[NewCol].Text := 'Responsable';
          ViSrTr.Header.Columns[NewCol].Width := 95;
     end;
     for ColIndex := ColIni to ViSrTr.Header.Columns.Count-1 do
     begin
          ViSrTr.Header.Columns[NewCol].Options :=  [coEnabled,coParentBidiMode,coResizable,coVisible];
          ViSrTr.Header.Columns[NewCol].Layout := blGlyphRight;
          ViSrTr.Header.Columns[NewCol].MaxWidth := 10000;
          ViSrTr.Header.Columns[NewCol].MinWidth := 10;
          ViSrTr.Header.Columns[NewCol].Spacing := 20;
          ViSrTr.Header.Columns[NewCol].ImageIndex := 5;
          ViSrTr.Header.Columns[NewCol].Style := vsText;
     end;
     PintaTree(True);
end;

procedure TInterProcesos.Notification( AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification( AComponent, Operation );
     if ( Operation = opRemove ) and ( AComponent = FApli) then
         FApli:= nil;
     //end if
end;

procedure TInterProcesos.SetPresentaCveFuncion(PPBoolean  : Boolean);
begin
     FPresentaCveFuncion := PPBoolean;
end;

procedure TInterProcesos.SetPresentaBEjecMultiple(PPBoolean  : Boolean);
begin
     FPresentaBEjecMultiple := PPBoolean;
end;

procedure TInterProcesos.SetPresentaBObligatorio(PPBoolean  : Boolean);
begin
     FPresentaBObligatorio := PPBoolean;
end;

procedure TInterProcesos.SetPresentaBProcCritico(PPBoolean  : Boolean);
begin
     FPresentaBProcCritico := PPBoolean;
end;

procedure TInterProcesos.SetPresentaBDigitaliza(PPBoolean  : Boolean);
begin
     FPresentaBDigitaliza := PPBoolean;
end;

procedure TInterProcesos.SetPresentaUsuarioResp(PPBoolean  : Boolean);
begin
     FPresentaUsuarioResp := PPBoolean;
end;

Constructor TInterProcesos.Create(AOwner:TComponent);
begin
     inherited;
     SetBounds(0,0,250,250);

     Apli:=Nil;

     IDEmpresa := 0;


     FOpera := 0; //Utiliza por default la fecha del apli  SRG

     PanelCont := TPanel.Create(Self);
     PanelCont.Parent := Self;
     PanelCont.Align := alClient;
     PanelCont.SetBounds(0,0,250,250);

     PanelInf := TPanel.Create(Self);
     PanelInf.Parent := PanelCont;
     PanelInf.Align := AlBottom;
     PanelInf.SetBounds(0,170,250,60);

     ViSrTr := TVirtualStringTree.Create(Self);
     ViSrTr.Parent := PanelCont;
     ViSrTr.Align := AlClient;
     ViSrTr.SetBounds(0,0,250,190);

     Interm    := TMemo.Create(Self);
     Interm.Parent := PanelInf;
     Interm.SetBounds(0,8,250,52);
     Interm.Align := AlClient;
     Interm.Color := clInfoBk;

     pbProceso := TProgressBar.Create(Self);
     pbProceso.Parent := PanelInf;
     pbProceso.SetBounds(0,0,250,8);
     pbProceso.Align := AlTop;

     ViSrTr.OnGetNodeDataSize := ViSrTrGetNodeDataSize;
     ViSrTr.OnGetText := ViSrTrGetText;
     ViSrTr.OnInitNode := ViSrTrInitNode;
     ViSrTr.OnGetImageIndex := ViSrTrGetImageIndex;
     ViSrTr.OnInitChildren := ViSrTrInitChildren;
     ViSrTr.OnGetDrawInfo := ViSrTrGetDrawInfo;
     ViSrTr.OnChecking := ViSrTrChecking;
     ViSrTr.OnEditing := ViSrTrEditing;
     ViSrTr.OnChange := ViSrTrChange;
     ViSrTr.OnCreateEditor := ViSrTrCreateEditors;

     FPresentaCveFuncion := True;
     FPresentaBEjecMultiple := True;
     FPresentaBObligatorio := True;
     FPresentaBProcCritico := True;
     FPresentaBDigitaliza := True;
     FPresentaUsuarioResp := True;

     //ASIGNA ADMIPROD
     Admin := False;
     MuestraConf := True;
end;

Destructor  TInterProcesos.Destroy;
begin
     DestroyArbolGrid;
     if pbProceso <> nil then
        pbProceso.Free;
     //end if
     if Interm <> nil then
        Interm.Free;
     //end if
     if ViSrTr <> nil then
        ViSrTr.Free;
     //end if
     if PanelInf <> nil then
        PanelInf.Free;
     //end if
     if PanelCont <> nil then
        PanelCont.Free;
     //end if
     inherited;
end;

function TInterProcesos.ObtFechaOperacion: TDateTime;
begin
 if FOpera <> 0 then
    result := FOpera
 else
    result := Apli.DameFechaEmpresa;
end;


Function TInterProcesos.ValidaChechked(PPIndex : Integer) : Boolean;
var  VLContinua  : Boolean;
begin
     //(VALIDA MISMO DIA Y MULTIPORCESO) O (FECHA ANTERIOR)
     ValidaChechked := False;
     VLContinua := False;
     if ((SG.cells[8,PPIndex] = 'V') or
         (StrToDateTime(SG.cells[15,PPIndex]) < ObtFechaOperacion )) then
//         (StrToDateTime(SG.cells[15,PPIndex]) < FApli.DameFechaEmpresa)) then
          VLContinua := True
     else
         ShowMessage('Proceso NO Aplicable al día de hoy');
     //end if;
     ValidaChechked := VLContinua;
end;

Function TInterProcesos.ValidaUnChechked(PPIndex : Integer) : Boolean;
var  VLContinua  : Boolean;
begin
     //VALIDA OBLIGATORIO
     ValidaUnChechked := False;
     VLContinua := False;
     if ((SG.cells[9,PPIndex] = 'F') or
         (FormatDateTime('ddmmyyyy',StrToDateTime(SG.cells[15,PPIndex])) = FormatDateTime('ddmmyyyy', ObtFechaOperacion))) then
         //(FormatDateTime('ddmmyyyy',StrToDateTime(SG.cells[15,PPIndex])) = FormatDateTime('ddmmyyyy',FApli.DameFechaEmpresa))) then

          VLContinua := True
     else
         ShowMessage('Proceso OBLIGATORIO');
     //end if
     ValidaUnChechked := VLContinua;
end;

Function TInterProcesos.ObtenSitChechk(PPIndex   : Integer; PPBUltNiv : Boolean)   : Boolean;
var  VLChechk : Boolean;
begin
     ObtenSitChechk := False;
     VLChechk := False;
     //SOLO EN ULTIMO NIVEL
     if PPBUltNiv then
     begin
          //EJECUCION MULTIPLE OR DIA ANTERIOR  OR PRESENTA ERROR
          if ((SG.cells[8,PPIndex] = 'V') or
              (StrToDateTime(SG.cells[15,PPIndex]) < ObtFechaOperacion) or
              //(StrToDateTime(SG.cells[15,PPIndex]) < FApli.DameFechaEmpresa) or
              (SG.cells[5,PPIndex] = 'ER')) then
               VLChechk := True
          //end if;
     end;
     ObtenSitChechk := VLChechk;
end;

Procedure TInterProcesos.PintaTree(PPBCarga : Boolean);
begin
     ViSrTr.RootNodeCount := 1;
     ViSrTr.NodeDataSize := SizeOf(TNodeData);
     if PPBCarga then
        CreaArbolGrid;
     //end if;
     GeneraArbolSQL;
end;

Procedure TInterProcesos.DescubreArbol;
var
 i   :  integer;
 tmp :  integer;
begin
 if Assigned( ViSrTr.RootNode ) and Assigned( ViSrTr.RootNode.FirstChild ) then
 begin
  tmp := ViSrTr.OffsetY;
  for i := 0  to ViSrTr.TotalCount - 1 do
  begin
   ViSrTr.OffsetY := -1 * ViSrTr.RootNode.FirstChild.NodeHeight * i;
   Application.ProcessMessages;
  end;
  ViSrTr.OffsetY := tmp;
  Application.ProcessMessages;
 end;
 {
 if Assigned( ViSrTr.RootNode ) and Assigned( ViSrTr.RootNode.FirstChild ) then
 begin
  ViSrTr.OffsetY := -1 * ViSrTr.RootNode.FirstChild.NodeHeight * ( ViSrTr.TotalCount - 1 );
  Application.ProcessMessages;
 end;
 }

end;

Function TInterProcesos.ValidaNodoEdit(PPColumn : Integer) : Boolean;
var VLSalida : Boolean;
begin
     ValidaNodoEdit := False;
     VLSalida := False;
     if  ViSrTr.Header.Columns[PPColumn].Hint = 'Ejecucion Muliple' then
        VLSalida := True
     else if ViSrTr.Header.Columns[PPColumn].Hint = 'Proceso Obligatorio' then
        VLSalida := True
     else if ViSrTr.Header.Columns[PPColumn].Hint = 'Proceso Crítico' then
        VLSalida := True
     else if ViSrTr.Header.Columns[PPColumn].Hint = 'Reporte Digitalizado' then
        VLSalida := True;
     //end if;
     ValidaNodoEdit := VLSalida;
end;

Function TInterProcesos.DameNumColEdit(PPColumn : Integer) : Integer;
var    VLNoColEdit : Integer;
begin
     DameNumColEdit := 0;
     VLNoColEdit := 0;
     if  ViSrTr.Header.Columns[PPColumn].Hint = 'Ejecucion Muliple' then
        VLNoColEdit := 1
     else if ViSrTr.Header.Columns[PPColumn].Hint = 'Proceso Obligatorio' then
        VLNoColEdit := 2
     else if ViSrTr.Header.Columns[PPColumn].Hint = 'Proceso Crítico' then
        VLNoColEdit := 3
     else if ViSrTr.Header.Columns[PPColumn].Hint = 'Reporte Digitalizado' then
        VLNoColEdit := 4;
     //end if;
     DameNumColEdit := VLNoColEdit;
end;

Function TInterProcesos.UpdateSitIni(PPIDEmpresa     : Integer; PPCveAplicacion  : String;
                                     PPCveProceso    : String;  PPNumSecuencia   : Integer;
                                     PPCveProcesoRel : String;  PPFHInicioEvento : TDateTime)
                                     : Boolean;
var  VlContinua : Boolean;
     STPUpdate  : TStoredProc;
begin
     UpdateSitIni := False;
     VlContinua := False;

     STPUpdate:=TStoredProc.Create(Nil);
     try
          STPUpdate.DatabaseName := Apli.DataBaseName;
          STPUpdate.SessionName := Apli.SessionName;
          STPUpdate.StoredProcName:='PKGINTERPROCESOS.STPACTUALIZAINI';

          //LOLS  10/09/2003   MIGRACION ORACLE 8I
          STPUpdate.Params.Clear;
          STPUpdate.Params.CreateParam( ftFloat,   'PEIDEMPRESA',      ptInput);
          STPUpdate.Params.CreateParam( ftString,  'PECVEAPLICACION',  ptInput);
          STPUpdate.Params.CreateParam( ftString,  'PECVEPROCESO',     ptInput);
          STPUpdate.Params.CreateParam( ftFloat,   'PENUMSECUENCIA',   ptInput);
          STPUpdate.Params.CreateParam( ftString,  'PECVEPROCESOREL',  ptInput);
          STPUpdate.Params.CreateParam( ftDateTime,'PEFHINICIOEVENTO', ptInput);
          //ENDS_LOLS  10/09/2003   MIGRACION ORACLE 8I

          STPUpdate.Prepare;
          STPUpdate.ParamByName('PEIDEmpresa').AsInteger := PPIDEmpresa;
          STPUpdate.ParamByName('PECveAplicacion').AsString := PPCveAplicacion;
          STPUpdate.ParamByName('PECveProceso').AsString := PPCveProceso;
          STPUpdate.ParamByName('PENumSecuencia').AsInteger := PPNumSecuencia;
          STPUpdate.ParamByName('PECveProcesoRel').AsString := PPCveProcesoRel;
          STPUpdate.ParamByName('PEFHInicioEvento').AsDateTime := PPFHInicioEvento;
          STPUpdate.ExecProc;
          VlContinua := True;
     finally
            STPUpdate.UnPrepare;
            STPUpdate.Free;
     end;

     UpdateSitIni := VlContinua;
end;

Function TInterProcesos.UpdateSitFin(PPIDEmpresa : Integer; PPCveAplicacion : String;
                                     PPCveProceso : String;     PPNumSecuencia  : Integer;
                                     PPCveProcesoRel : String;  PPFHFinEvento : TDateTime;
                                     PPComenta : String;        PPNewSitRel     : String)  : Boolean;
var  VlContinua : Boolean;
     STPUpdate  : TStoredProc;
begin
     UpdateSitFin := False;
     VlContinua := False;

     STPUpdate:=TStoredProc.Create(Nil);
     try
          STPUpdate.DatabaseName := Apli.DataBaseName;
          STPUpdate.SessionName := Apli.SessionName;
          STPUpdate.StoredProcName:='PKGINTERPROCESOS.STPACTUALIZAFIN';

          //LOLS  10/09/2003   MIGRACION ORACLE 8I
          STPUpdate.Params.Clear;
          STPUpdate.Params.CreateParam( ftFloat,    'PEIDEMPRESA',    ptInput );
          STPUpdate.Params.CreateParam( ftString,   'PECVEAPLICACION',ptInput );
          STPUpdate.Params.CreateParam( ftString,   'PECVEPROCESO',   ptInput );
          STPUpdate.Params.CreateParam( ftFloat,    'PENUMSECUENCIA', ptInput );
          STPUpdate.Params.CreateParam( ftString,   'PECVEPROCESOREL',ptInput );
          STPUpdate.Params.CreateParam( ftDateTime, 'PEFHFINEVENTO',  ptInput );
          STPUpdate.Params.CreateParam( ftString,   'PECOMENTA',      ptInput );
          STPUpdate.Params.CreateParam( ftString,   'PENEWSITREL',    ptInput );
          //ENDS_LOLS  10/09/2003   MIGRACION ORACLE 8I

          STPUpdate.Prepare;
          STPUpdate.ParamByName('PEIDEmpresa').AsInteger := PPIDEmpresa;
          STPUpdate.ParamByName('PECveAplicacion').AsString := PPCveAplicacion;
          STPUpdate.ParamByName('PECveProceso').AsString := PPCveProceso;
          STPUpdate.ParamByName('PENumSecuencia').AsInteger := PPNumSecuencia;
          STPUpdate.ParamByName('PECveProcesoRel').AsString := PPCveProcesoRel;
          STPUpdate.ParamByName('PEFHFinEvento').AsDateTime := PPFHFinEvento;
          STPUpdate.ParamByName('PEComenta').AsString := COPY(PPComenta,1,200);
          STPUpdate.ParamByName('PENewSitRel').AsString := PPNewSitRel;

          STPUpdate.ExecProc;
          VlContinua := True;
     finally
            STPUpdate.UnPrepare;
            STPUpdate.Free;
     end;

     UpdateSitFin := VlContinua;
end;

Function TInterProcesos.ActivaProcesos : Boolean;
var VLIndex    : Integer;
    VLContinua : Boolean;
    VLExito    : Boolean;
    VLContProc : Boolean;
    VLErrorExc : Boolean;
    VLSalida   : Boolean;
    VLSitProc  : String;
    VLComenta  : String;
    VLFHInicio : TDateTime;
    VLFHFin    : TDateTime;
begin
     ActivaProcesos := False;
     VLContinua := False;
     VLContProc := True;
     VLErrorExc := False;
     VLSalida   := True;
     VLExito    := True;
     try
        pbProceso.Max := 0;
        pbProceso.Position := 0;
        //CUENTA PROCESO
        for VlIndex := 1 to SG.RowCount do
        begin
             if (SG.cells[16,VlIndex] = 'V') then
                pbProceso.Max := pbProceso.Max + 1;
             //enb if
        end;
        //BARRE GRID
        VlIndex := 1;
        While ((VLContProc) and (VLSalida)) do
        begin
             fTipoError := teNoError;
             if (SG.cells[16,VlIndex] = 'V') then
             begin
                  Interm.Lines.Add('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ');
                  Interm.Lines.Add('INICIA PROCESO (' + TimeToStr(TIME) + '): ' + SG.cells[6,VlIndex] + ' <<' + SG.cells[3,VlIndex] + '>>');
                  VLFHInicio := ObtFechaOperacion;
                  //VLFHInicio := FApli.DameFechaEmpresa;
                  VLSitProc := 'EP';
                  UpdateSitIni(IDEmpresa,Apli.Apli,SG.cells[2,VlIndex],StrToInt(SG.cells[4,VlIndex]),
                               SG.cells[3,VlIndex],VLFHInicio);
                  try
                     //INVOCA EVENTO
                     if assigned(FGeneraProceso) then
                     begin
                          Interm.Lines.Add('Generando Proceso');
                          FGeneraProceso(Self,SG.cells[2,VlIndex],StrToInt(SG.cells[4,VlIndex]),SG.cells[3,VlIndex],SG.cells[7,VlIndex],(SG.cells[11,VlIndex]= 'V'),VLComenta,VLContProc);
                     end
                     else
                         VLContProc := False;
                     //end if
                  except
                        VLContProc := False;
                        VLErrorExc := True;
                        VLComenta := 'Error por Excepcion';
                  end;
                  if VLContProc then
                     VLSitProc := 'PR'
                  else
                  begin
                       VLSitProc := 'ER';
                       if VLErrorExc then
                       begin
                            Interm.Lines.Add('ERROR INESPERADO.  AVISE A SISTEMAS!!!!');
                            if MuestraConf then
                               ShowMessage('ERROR INESPERADO.  AVISE A SISTEMAS!!!!');
                            ///end if
                       end
                       else
                       begin
                            Interm.Lines.Add('Error Inesperado en proceso: <<' + SG.cells[6,VlIndex] + '>> Solución Propuesta: <<' + SG.cells[17,VlIndex] + '>>');
                            if MuestraConf then
                                ShowMessage('Error Inesperado en proceso: <<' + SG.cells[6,VlIndex] + '>> Solución Propuesta: <<' + SG.cells[17,VlIndex] + '>>');
                            //end if
                       end;
                  end;
                  Interm.Lines.Add('Comentario: ' + VLComenta);
                  Interm.Lines.Add('Proceso Terminado (' + TimeToStr(TIME) + '). Resultado: ' + VLSitProc);
                  pbProceso.Position := pbProceso.Position + 1;
                  VLFHFin    := ObtFechaOperacion;
                  //VLFHFin    := FApli.DameFechaEmpresa;
                  UpdateSitFin(IDEmpresa,Apli.Apli,SG.cells[2,VlIndex],StrToInt(SG.cells[4,VlIndex]),
                            SG.cells[3,VlIndex],VLFHFin,VLComenta,VLSitProc);
                  //NO CRITICO
                  if Not(VLContProc) then
                  begin
                       if ((SG.cells[10,VlIndex] = 'V') or (VLErrorExc)) then
                       begin
                            Interm.Lines.Add('Proceso CRITICO  NO CONTINUA!!!!');
                            if MuestraConf then
                               ShowMessage('Proceso CRITICO.  No es posible continuar!!!!');
                            //end if
                            VLExito := False;
                            fTipoError := teCritico;
                       end
                       else
                       begin
                            Interm.Lines.Add('Proceso no CRITICO. Continua');
                            VLContProc := True;
                            fTipoError := teNoCritico;
                       end;
                  end;
             end;
             if assigned(FDespuesProceso) then
                FDespuesProceso(Self);
             //end if
             //CONTADOR DE SALIDA
             VlIndex := VlIndex + 1;
             if (VlIndex > SG.RowCount) then
                 VLSalida := False;
             //end if
        end;
        VLContinua := True;
     Except
     end;
     Interm.Lines.Add('TERMINA INTERPROCESOS');
     if VLExito then
     begin
          Interm.Lines.Add('Procesos concluidos. ');
//          Interm.Lines.Add('Procesos concluidos.  Gracias por usar InterPROCESOS!!!');
          if MuestraConf then
             ShowMessage('Procesos concluidos.  ');
//             ShowMessage('Procesos concluidos.  Gracias por usar InterPROCESOS!!!');
          //end if;
     end;
     RepintaTree;

     ActivaProcesos := VLContinua;
end;

Procedure TInterProcesos.RepintaTree;
begin
     ViSrTr.Clear;
     PintaTree(False);
end;

Function TInterProcesos.ObtenIndex(PPIndex : Integer;     var PPLevel    : Integer;
                           var PPNoChild   : Integer; var PPProcRel  : String;
                           var PPProceso   : String;  var PPIndexSig : Integer;
                           var PPBUltimoN  : Boolean)     : Boolean;
var  VLProcRel   : String;
     VLContinuar : Boolean;
     VlIndex     : Integer;
begin
     ObtenIndex := False;
     VLContinuar :=  (SG.cells[13,PPIndex] = 'F');
     if VLContinuar then
     begin
          //DATOS BASICO
          SG.cells[13,PPIndex] := 'V';
          PPLevel := StrToInt(SG.cells[1,PPIndex]);
          PPProceso := SG.cells[2,PPIndex];
          PPProcRel := SG.cells[3,PPIndex];
          //INICIA
          PPNoChild := 0;
          PPIndexSig := 0;
          PPBUltimoN := TRUE;
          //RAMAS
          for VlIndex := 2 to SG.RowCount do
          begin
               if ((SG.cells[2,VlIndex] = PPProcRel) and (SG.cells[1,VlIndex] = IntToStr(PPLevel + 1))) then
                  PPNoChild := PPNoChild + 1;
               //end if;
          end;
          //INDEX SIG
          for VlIndex := 1 to SG.RowCount do
          begin
               if StrToInt(SG.cells[4,VlIndex]) = (StrToInt(SG.cells[4,PPIndex]) + 1) then
                  PPIndexSig := VlIndex;
               //end if;
          end;
          //ULTIMO NIVEL
          for VlIndex := 0 to SG.RowCount do
          begin

               if ((SG.cells[2,VlIndex] = SG.cells[3,PPIndex]) and (VlIndex <> PPIndex)) then
                    PPBUltimoN := False;
               //end if;
          end;
     end;
     ObtenIndex := VLContinuar;
end;

Function TInterProcesos.CreaArbolGrid  : Boolean;
begin
     SG := TStringGrid.Create(self);
     SG.ColCount := 18;   //Numero de campos retornados por el Query.
end;

Function TInterProcesos.DestroyArbolGrid : Boolean;
begin
     if SG <> nil then
        SG.free;
     //end if;
end;

Function TInterProcesos.GeneraArbolSQL : Boolean;
var  QArbol       : TQuery;
     VLContinua   : Boolean;
     VLCadenaSQL  : String;
     VLCountQuery : Integer;
begin
     VLContinua := False;
     GeneraArbolSQL := False;
     SG.RowCount := 0;

     VLCadenaSQL := ' SELECT INTERLEVEL.*, ' +
                    '        BP.DESC_PROCESO, ' +
                    '        BP.CVE_FUNCION, ' +
                    '        BP.B_EJEC_MULTIPLE, ' +
                    '        BP.B_OBLIGATORIO, ' +
                    '        BP.B_PROC_CRITICO, ' +
                    '        BP.B_DIGITALIZA, ' +
                    '        BP.TX_SOLUCION, ' +
                    '        BP.CVE_USUAR_RESP ' +
                    ' FROM BIT_PROCESO BP, ' +
                    '      (SELECT DISTINCT LEVEL, BRP.CVE_PROCESO,   BRP.CVE_PROCESO_REL, BRP.NUM_SECUENCIA, BRP.SIT_EVENTO, ' +
                    '       BRP.FH_INICIO_EVENTO,  BRP.FH_FIN_EVENTO, BRP.TX_COMENTARIO, BRP.ID_EMPRESA ' +
                    '       FROM BIT_REL_PROCESO BRP ' +
                    '       START WITH BRP.CVE_PROCESO_REL = ' + #39 + Proceso + #39 +
                    '       CONNECT BY (BRP.CVE_PROCESO     =  PRIOR BRP.CVE_PROCESO_REL) ' +
                    '       AND        (BRP.CVE_PROCESO_REL <> BRP.CVE_PROCESO) ' +
                    '       AND        (BRP.SITUACION       =  ' + #39 + 'AC' + #39 + ') ' +
                    '       AND        (BRP.CVE_APLICACION  =  ' + #39 + Apli.Apli + #39 + ') ' +
                    '       AND        (BRP.ID_EMPRESA      =  ' + IntToStr(IDEmpresa) + ')) INTERLEVEL ' +
                    ' WHERE (INTERLEVEL.ID_EMPRESA = ' + IntToStr(IDEmpresa) + ')' +
                    ' AND   (BP.CVE_PROCESO = INTERLEVEL.CVE_PROCESO_REL) ' +
                    ' AND   (BP.SITUACION = ' + #39 + 'AC' + #39 + ')' +
                    ' ORDER BY INTERLEVEL.NUM_SECUENCIA';


     QArbol := GetSqlQuery(VLCadenaSQL,FApli.DatabaseName,FApli.SessionName,True);
     try
        //SI EL RESULTADO FUE ALGO RELIZA:
        if QArbol <> nil then
        begin
             VLCountQuery := 0;
             QArbol.First;
             while Not(QArbol.Eof) do
             begin
                  VLCountQuery := VLCountQuery + 1;
                  SG.cells[1,VLCountQuery]  := QArbol.FieldByName('LEVEL').AsString;
                  SG.cells[2,VLCountQuery]  := QArbol.FieldByName('CVE_PROCESO').AsString;
                  SG.cells[3,VLCountQuery]  := QArbol.FieldByName('CVE_PROCESO_REL').AsString;
                  SG.cells[4,VLCountQuery]  := QArbol.FieldByName('NUM_SECUENCIA').AsString;
                  SG.cells[6,VLCountQuery]  := QArbol.FieldByName('DESC_PROCESO').AsString;
                  SG.cells[7,VLCountQuery]  := QArbol.FieldByName('CVE_FUNCION').AsString;
                  SG.cells[8,VLCountQuery]  := QArbol.FieldByName('B_EJEC_MULTIPLE').AsString;
                  SG.cells[9,VLCountQuery]  := QArbol.FieldByName('B_OBLIGATORIO').AsString;
                  SG.cells[10,VLCountQuery] := QArbol.FieldByName('B_PROC_CRITICO').AsString;
                  SG.cells[11,VLCountQuery] := QArbol.FieldByName('B_DIGITALIZA').AsString;
                  SG.cells[12,VLCountQuery] := QArbol.FieldByName('CVE_USUAR_RESP').AsString;
                  SG.cells[13,VLCountQuery] := 'F';  //INDICA QUE NO FUE CONSIDERADO
                  SG.cells[16,VLCountQuery] := 'F';  //INDICA QUE SE TIENE QUE PROCESAR
                  SG.cells[17,VLCountQuery] := QArbol.FieldByName('TX_SOLUCION').AsString;
                  SG.cells[18,VLCountQuery] := QArbol.FieldByName('TX_COMENTARIO').AsString;
                  if ((QArbol.FieldByName('FH_FIN_EVENTO').AsDateTime < ObtFechaOperacion) and
                  //if ((QArbol.FieldByName('FH_FIN_EVENTO').AsDateTime < FApli.DameFechaEmpresa) and
                      (QArbol.FieldByName('SIT_EVENTO').AsString = 'PR')) then
                      SG.cells[5,VLCountQuery]  := 'NP'
                  else
                      SG.cells[5,VLCountQuery]  := QArbol.FieldByName('SIT_EVENTO').AsString;
                  //end if
                  SG.cells[14,VLCountQuery] := QArbol.FieldByName('FH_INICIO_EVENTO').AsString;
                  SG.cells[15,VLCountQuery] := QArbol.FieldByName('FH_FIN_EVENTO').AsString;
                  QArbol.Next;
             end;
             SG.RowCount := VLCountQuery;
        end
        else
        begin
             ShowMessage('NO HAY REGISTROS');
             ViSrTr.Clear;
        end;
     finally
            if QArbol <> nil then
                QArbol.Free;
            //end if
     end;
     GeneraArbolSQL := VLContinua;
end;

procedure TInterProcesos.ViSrTrGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
     NodeDataSize := SizeOf(TNodeData);
end;

procedure TInterProcesos.ViSrTrInitChildren(Sender: TBaseVirtualTree;
          Node: PVirtualNode; var ChildCount: Cardinal);
var
   Data: PNodeData;
begin
     Data := Sender.GetNodeData(Node);
     ChildCount := Data.Ramas
end;

procedure TInterProcesos.ViSrTrInitNode(Sender: TBaseVirtualTree; ParentNode,
          Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
  Data       : PNodeData;
  DataParent : PNodeData;
  VLLevel    : Integer;
  VLNoChild  : Integer;
  VLProcRel  : String;
  VLProceso  : String;
  VLIndexSig : Integer;
  VLBUltimoN : Boolean;
begin
//   ROIM
//   INDICA SI EL DATO LO EXPANDE
//   INDICA EL TEXTO DEL RENGLON
//   INDICA EL TIPO DE COMPONENTE AUXILIAR  (TIPO DE CB OR BTN)

     Data := Sender.GetNodeData(Node);
     with Data^ do
     begin
          if (VLIdexNuevo = 0) then
              VLIdexNuevo := 1;
          //end if
          ObtenIndex(VLIdexNuevo, VLLevel, VLNoChild, VLProcRel, VLProceso, VLIndexSig, VLBUltimoN);
          Ramas := VLNoChild;
          if Not(VLBUltimoN) then   //Si es la ultima rama, expande
                 Include(InitialStates, ivsHasChildren);
          //end if;
          Node.CheckType := TCheckType(2); //CB RELACIONAL (2)
          Include(InitialStates, ivsExpanded);
          //LLENA CURSOR DEL ARBOL
          Level := Sender.GetNodeLevel(Node);
          CveProc   := SG.Cells[3,VLIdexNuevo];
          DesProc := SG.cells[6,VLIdexNuevo];
          CveFuncion := SG.cells[7,VLIdexNuevo];
          BEjecMultiple := SG.cells[8,VLIdexNuevo];
          //MARCA PROCESO POR DEFAULT
          if ObtenSitChechk(VLIdexNuevo,VLBUltimoN) then
          begin
               Node.CheckState := csChecked;
               NodeCheck := True;
               SG.cells[16,VLIdexNuevo] := 'V'
          end
          else
              NodeCheck := False;
          //end if;
          BObligatorio := SG.cells[9,VLIdexNuevo];
          BProcCritico := SG.cells[10,VLIdexNuevo];
          BDigitaliza := SG.cells[11,VLIdexNuevo];
          UsuarioResp := SG.cells[12,VLIdexNuevo];
          Situacion := SG.cells[5,VLIdexNuevo];
          FHIni     := SG.cells[14,VLIdexNuevo];
          FHFin     := SG.cells[15,VLIdexNuevo];
          Comentario := SG.cells[18,VLIdexNuevo];
          //Siguiente Index
          Changed := False;
          IndexActual  := VLIdexNuevo;
          VLIdexNuevo := VLIndexSig;
          NoColEdit := 0;
     end;
end;

procedure TInterProcesos.ViSrTrGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
          Kind: TVTImageKind; Column: Integer;  var Index: Integer);
var
  Data: PNodeData;
begin
     if Kind in [ikNormal, ikSelected] then
     begin
          Data := Sender.GetNodeData(Node);
          case Column of
            -1, // general case
             0: // main column
                if Data.Ramas = 0 then
                   Index := 14
                else if Data.Ramas > 0 then
                   Index := 9;
                //end if;
             1: // image only column
                if Sender.FocusedNode = Node then
                   Index := 6;
                //end if;
          end;
     end;
end;

procedure TInterProcesos.ViSrTrGetDrawInfo(Sender: TBaseVirtualTree;  Node: PVirtualNode;
          Column: Integer; TextType: TVSTTextType;  var DrawInfo: TDrawInfo);
var
  Data      : PNodeData;
  STPUpdate : TStoredProc;
  VLNewSit  : String;
begin
     try
        Data := Sender.GetNodeData(Node);
     except
         Exit;
     end;
     case Column of
       -1: ;//La columna uno no tiene texto
        1: ;// image column (there is no text)
        0: // main column
           case TextType of
              ttNormal:
                   if Data.Ramas = 0 then
                   begin
                        DrawInfo.Font.Color := clBlack;
                        DrawInfo.Font.Style := [];
                   end
                   else
                   begin
                        DrawInfo.Font.Color := clBlue;
                        DrawInfo.Font.Style := [fsBold];
                   end;
              ttStatic:
                   begin
                        DrawInfo.Font.Color := clBlue;
                        DrawInfo.Font.Style := [];
                   end;
           end;
        2:
          if TextType = ttNormal then
          begin
               if Data.Situacion = 'NP' then
               begin
                    DrawInfo.Font.Color := clGreen;
                    DrawInfo.Font.Style := [fsBold];
               end
               else if Data.Situacion = 'EP' then
               begin
                    DrawInfo.Font.Color := clBlack;
                    DrawInfo.Font.Style := [fsBold];
               end
               else if Data.Situacion = 'PR' then
               begin
                    DrawInfo.Font.Color := clBlue;
                    DrawInfo.Font.Style := [fsBold];
               end
               else if Data.Situacion = 'ER' then
               begin
                    DrawInfo.Font.Color := clRed;
                    DrawInfo.Font.Style := [fsBold];
               end;
          end;
        else
        begin
             if Data.Changed then
             begin
                  STPUpdate:=TStoredProc.Create(Nil);
                  try
                     STPUpdate.DatabaseName := Apli.DataBaseName;
                     STPUpdate.SessionName := Apli.SessionName;
                     case Data.NoColEdit of
                     1://Ejecucion Muliple
                        begin
                             SG.cells[8,Data.IndexActual]  := Data.BEjecMultiple;
                             VLNewSit := Data.BEjecMultiple;
                             STPUpdate.StoredProcName:='PKGINTERPROCESOS.STPUPDATEEJECMULTIPLE';

                             //LOLS  10/09/2003   MIGRACION ORACLE 8I
                             STPUpdate.Params.Clear;
                             STPUpdate.Params.CreateParam( ftString, 'PECVEPROCESO',    ptInput );
                             STPUpdate.Params.CreateParam( ftString, 'PEBEJECMULTIPLE', ptInput );
                             //ENDS_LOLS  10/09/2003   MIGRACION ORACLE 8I

                             STPUpdate.Prepare;
                             STPUpdate.ParamByName('PECveProceso').AsString := Data.CveProc;
                             STPUpdate.ParamByName('PEBEjecMultiple').AsString := VLNewSit;
                             STPUpdate.ExecProc;
                        end;
                     2://Proceso Obligatorio
                        begin
                             SG.cells[9,Data.IndexActual]  := Data.BObligatorio;
                             VLNewSit := Data.BObligatorio;
                             STPUpdate.StoredProcName:='PKGINTERPROCESOS.STPUPDATEOBLIGATORIO';

                             //LOLS  10/09/2003   MIGRACION ORACLE 8I
                             STPUpdate.Params.Clear;
                             STPUpdate.Params.CreateParam( ftString, 'PECVEPROCESO',   ptInput );
                             STPUpdate.Params.CreateParam( ftString, 'PEBOBLIGATORIO', ptInput );
                             //ENDS_LOLS  10/09/2003   MIGRACION ORACLE 8I

                             STPUpdate.Prepare;
                             STPUpdate.ParamByName('PECveProceso').AsString := Data.CveProc;
                             STPUpdate.ParamByName('PEBObligatorio').AsString := VLNewSit;
                             STPUpdate.ExecProc;
                        end;
                     3://Proceso Crítico
                        begin
                             SG.cells[10,Data.IndexActual] := Data.BProcCritico;
                             VLNewSit := Data.BProcCritico;
                             STPUpdate.StoredProcName:='PKGINTERPROCESOS.STPUPDATEPROCCRITICO';

                             //LOLS  10/09/2003   MIGRACION ORACLE 8I
                             STPUpdate.Params.Clear;
                             STPUpdate.Params.CreateParam( ftString, 'PECVEPROCESO',   ptInput );
                             STPUpdate.Params.CreateParam( ftString, 'PEBPROCCRITICO', ptInput );
                             //ENDS_LOLS  10/09/2003   MIGRACION ORACLE 8I

                             STPUpdate.Prepare;
                             STPUpdate.ParamByName('PECveProceso').AsString := Data.CveProc;
                             STPUpdate.ParamByName('PEBProcCritico').AsString := VLNewSit;
                             STPUpdate.ExecProc;
                        end;
                     4://Reporte Digitalizado
                        begin
                             SG.cells[11,Data.IndexActual] := Data.BDigitaliza;
                             VLNewSit := Data.BDigitaliza;
                             STPUpdate.StoredProcName:='PKGINTERPROCESOS.STPUPDATEDIGITALIZA';

                             //LOLS  10/09/2003   MIGRACION ORACLE 8I
                             STPUpdate.Params.Clear;
                             STPUpdate.Params.CreateParam( ftString, 'PECVEPROCESO',  ptInput );
                             STPUpdate.Params.CreateParam( ftString, 'PEBDIGITALIZA', ptInput );
                             //ENDS_LOLS  10/09/2003   MIGRACION ORACLE 8I

                             STPUpdate.Prepare;
                             STPUpdate.ParamByName('PECveProceso').AsString := Data.CveProc;
                             STPUpdate.ParamByName('PEBDigitaliza').AsString := VLNewSit;
                             STPUpdate.ExecProc;
                        end;
                     end;
                  finally
                         STPUpdate.UnPrepare;
                         STPUpdate.Free;
                  end;
                  Data.Changed := False;
             end;
        end;
     end;
end;

procedure TInterProcesos.ViSrTrGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
          Column: Integer; TextType: TVSTTextType; var Text: WideString);
var
  Data: PNodeData;
begin
  //EVITA QUE ENTRE A LA COLUMNA INICIAL
  if ((Column = 1)  or (Column = -1))then
     exit;
  //end if
  try
     Data := Sender.GetNodeData(Node);
  except
     Exit;
  end;
  Text := '';
  case Column of
   -1 : ;//La columna uno no tiene texto
    1 : ;//La columna uno no tiene texto
    0 : //
      if TextType = ttNormal then
        Text := UpperCase(Data.DesProc) + '  <' + Data.CveProc + '>';
      //end if
    2 :
      if TextType = ttNormal then
      begin
           if Data.Ramas = 0 then
           begin
                if (Data.Situacion = 'NP') then
                   Text := 'Sin Procesar'
                else if Data.Situacion = 'EP' then
                   Text := 'En Proceso'
                else if Data.Situacion = 'PR' then
                   Text := 'Procesado'
                else if Data.Situacion = 'ER' then
                   Text := 'ERROR  : ' + Data.Comentario;
                //end if
           end;
      end;
    3 :
      if ((TextType = ttNormal) and (Data.Ramas = 0)) then
         Text := Data.FHIni;
      //end if;
    4 :
      if ((TextType = ttNormal) and (Data.Ramas = 0)) then
         Text := Data.FHFin;
      //end if;
    else
    begin
    end;
  end;

  if ViSrTr.Header.Columns[Column].Hint = 'Funcion a Ejecutar' then
  begin
      if ((TextType = ttNormal) and (Data.Ramas = 0)) then
          Text := Data.CveFuncion;
       //end if
  end
  else if  ViSrTr.Header.Columns[Column].Hint = 'Ejecucion Muliple' then
  begin
      if ((TextType = ttNormal) and (Data.Ramas = 0)) then
          if Data.BEjecMultiple = 'V' then Text := 'SI' else Text := 'NO';
       //end if
  end
  else if ViSrTr.Header.Columns[Column].Hint = 'Proceso Obligatorio' then
  begin
      if ((TextType = ttNormal) and (Data.Ramas = 0)) then
          if Data.BObligatorio = 'V' then Text := 'SI' else Text := 'NO';
       //end if
  end
  else if ViSrTr.Header.Columns[Column].Hint = 'Proceso Crítico' then
  begin
      if ((TextType = ttNormal) and (Data.Ramas = 0)) then
          if Data.BProcCritico = 'V' then Text := 'SI' else Text := 'NO';
       //end if
  end
  else if ViSrTr.Header.Columns[Column].Hint = 'Reporte Digitalizado' then
  begin
      if ((TextType = ttNormal) and (Data.Ramas = 0)) then
          if Data.BDigitaliza = 'V' then Text := 'SI' else Text := 'NO';
       //end if
  end
  else if ViSrTr.Header.Columns[Column].Hint = 'Usuario Responsable' then
  begin
      if ((TextType = ttNormal) and (Data.Ramas = 0)) then
          Text := Data.UsuarioResp;
       //end if
  end;
end;

procedure TInterProcesos.ViSrTrChecking(Sender: TBaseVirtualTree;
  Node: PVirtualNode; var NewState: TCheckState; var Allowed: Boolean);
var
   Data: PNodeData;
begin
     Data := Sender.GetNodeData(Node);
     if Data.Ramas = 0 then
     begin
          if NewState = csChecked then
          begin
               if ValidaChechked(Data.IndexActual) then
                    SG.cells[16,Data.IndexActual] := 'V'
               else
                    NewState := csUnchecked;
               //end if
          end
          else if NewState = csUnchecked then
          begin
               if ValidaUnChechked(Data.IndexActual) then
                  SG.cells[16,Data.IndexActual] := 'F'
               else
                    NewState := cschecked;
               //end if
          end;
     end;
end;

procedure TInterProcesos.ViSrTrEditing(Sender: TBaseVirtualTree; Node: PVirtualNode;
       Column: Integer; var Allowed: Boolean);
var
  Data: PNodeData;
begin
     with Sender do
     begin
          Data := GetNodeData(Node);
          if ((Node.Parent <> RootNode) and (ValidaNodoEdit(Sender.FocusedColumn)) and (Admin)) then
          begin
               Data.NoColEdit := DameNumColEdit(Sender.FocusedColumn);
               Data.NodeCheck := Node.CheckState = csChecked;
               Allowed := True;
          end
          else
          begin
               Allowed := False;
               Data.Changed := False;
          end;
     end;
end;

procedure TInterProcesos.ViSrTrChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
     with Sender do
     begin
          if ((Assigned(Node)) and (Node.Parent <> RootNode)) then
          begin
               EditNode(Node, Sender.FocusedColumn);
          end;
     end;
end;

procedure TInterProcesos.ViSrTrCreateEditors(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: Integer;
      out EditLink: IVTEditLink);
begin
     EditLink := TPropertyEditLink.Create;
end;

procedure Register;
begin
     RegisterComponents('Inter', [TInterProcesos]);
end;

//----------------- TPropertyEditLink ---------------------

destructor TPropertyEditLink.Destroy;
begin
     if FEdit <> Nil then
        FEdit.Free;
     //end if
     inherited;
end;

procedure TPropertyEditLink.DoEndEdit;
begin
     EndEdit;
end;

procedure TPropertyEditLink.EditWindowProc(var Message: TMessage);
begin
     case Message.Msg of
     WM_KILLFOCUS:
        if FEdit is TDateTimePicker then
         begin
              if not TDateTimePicker(FEdit).DroppedDown then
                 DoEndEdit;
              //end if
         end
         else
            DoEndEdit;
         //end if
     else
        FOldEditProc(Message);
     end;
end;

procedure TPropertyEditLink.EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
   CanAdvance    : Boolean;
   VLFocNodeAnt  : PVirtualNode;
begin
     case Key of
     VK_RETURN,
     VK_UP,
     VK_DOWN,
     VK_ESCAPE:
     begin
          CanAdvance := Shift = [];
          if FEdit is TComboBox then
             CanAdvance := CanAdvance and not TComboBox(FEdit).DroppedDown;
          //end if
          if CanAdvance then
          begin
               DoEndEdit;
               with FTree do
               begin
                    VLFocNodeAnt := FocusedNode;
                    if Key = VK_UP then
                    begin
                         FocusedNode := GetPreviousVisible(FocusedNode);
                         Selected[VLFocNodeAnt] := False;
                         Selected[FocusedNode] := True;
                    end
                    else if Key = VK_ESCAPE then
                         Selected[FocusedNode] := False
                    else
                    begin
                         FocusedNode := GetNextVisible(FocusedNode);
                         Selected[VLFocNodeAnt] := False;
                         Selected[FocusedNode] := True;
                    end;
               end;
               Key := 0;
          end;
     end;
     end;
end;

function TPropertyEditLink.BeginEdit: Boolean;
begin
     Result := not FStopping;
     if Result then
     begin
          FEdit.Show;
          FEdit.SetFocus;
          FOldEditProc := FEdit.WindowProc;
          FEdit.WindowProc := EditWindowProc;
     end;
end;

procedure TPropertyEditLink.CancelEdit;
begin
     if not FStopping then
     begin
          FStopping := True;
          FEdit.WindowProc := FOldEditProc;
          FEdit.Hide;
          FTree.CancelEditNode;
     end;
end;

function TPropertyEditLink.CanStop: Boolean;
begin
     Result := not FStopping;
end;

procedure TPropertyEditLink.EndEdit;
var
   Data: PNodeData;
   Buffer: array[0..1024] of Char;
   S: WideString;
begin
     if not FStopping then
     begin
          FStopping := True;
          FEdit.WindowProc := FOldEditProc;
          Data := FTree.GetNodeData(FNode);
          if FEdit is TComboBox then
             S := TComboBox(FEdit).Text
          else
          begin
               GetWindowText(FEdit.Handle, Buffer, 1024);
               S := Buffer;
          end;
          if S = 'SI' then
             S := 'V';
          //end if
          if S = 'NO' then
             S := 'F';
          //end if
          case Data.NoColEdit of
             1://Ejecucion Muliple
               if S <> Data.BEjecMultiple then
               begin
                    if ((S = 'F') and (Data.NodeCheck) and (Data.Situacion = 'PR')) then
                       ShowMessage('Debe primero eliminar la marca de ejecución de este proceso. ')
                    else
                       Data.BEjecMultiple := S; Data.Changed := True; FTree.InvalidateNode(FNode);
                    //end if
               end;
             2://Proceso Obligatorio
               if S <> Data.BObligatorio then
               begin
                    Data.BObligatorio := S; Data.Changed := True; FTree.InvalidateNode(FNode);
               end;
             3://Proceso Crítico
               if S <> Data.BProcCritico then
               begin
                    Data.BProcCritico := S; Data.Changed := True; FTree.InvalidateNode(FNode);
               end;
             4://Reporte Digitalizado
               if S <> Data.BDigitaliza then
               begin
                    Data.BDigitaliza := S; Data.Changed := True; FTree.InvalidateNode(FNode);
               end;
          end;
          FEdit.Hide;
          FTree.EndEditNode;
     end;
end;

function TPropertyEditLink.GetBounds: TRect;
begin
     Result := FEdit.BoundsRect;
end;

function TPropertyEditLink.PrepareEdit(Tree: TBaseVirtualTree; Node: PVirtualNode; Column: Integer): Boolean;
var
   Data: PNodeData;
begin
     Result := not FStopping;
     if Result then
     begin
          FTree := Tree as TCustomVirtualStringTree;
          FNode := Node;
          FColumn := Column;
          FEdit.Free;
          FEdit := nil;
          Data := FTree.GetNodeData(Node);
          begin
               FEdit := TComboBox.Create(nil);
               with FEdit as TComboBox do
               begin
                    Visible := False;
                    Parent := Tree;
                    case Data.NoColEdit of
                    1://Ejecucion Muliple
                      if Data.BEjecMultiple = 'V' then
                         begin Text := 'SI'; Items.Add(Text); Items.Add('NO'); end
                      else
                          begin Text := 'NO'; Items.Add(Text); Items.Add('SI'); end;
                      //end if
                    2://Proceso Obligatorio
                      if Data.BObligatorio = 'V' then
                         begin Text := 'SI'; Items.Add(Text); Items.Add('NO'); end
                      else
                          begin Text := 'NO'; Items.Add(Text); Items.Add('SI'); end;
                      //end if
                    3://Proceso Crítico
                      if Data.BProcCritico = 'V' then
                         begin Text := 'SI'; Items.Add(Text); Items.Add('NO'); end
                      else
                          begin Text := 'NO'; Items.Add(Text); Items.Add('SI'); end;
                      //end if
                    4://Reporte Digitalizado
                      if Data.BDigitaliza = 'V' then
                         begin Text := 'SI'; Items.Add(Text); Items.Add('NO'); end
                      else
                          begin Text := 'NO'; Items.Add(Text); Items.Add('SI'); end;
                      //end if
                    end;
                    OnKeyDown := EditKeyDown;
               end;
          end;
     end;
end;

procedure TPropertyEditLink.SetBounds(R: TRect);
begin
     Inc(R.Left, 6);
     FEdit.BoundsRect := R;
end;


end.
