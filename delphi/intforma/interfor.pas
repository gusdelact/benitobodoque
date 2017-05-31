unit InterFor;
//-------------------------------------------------------------
// Sistema         :   InterForma
// Date            :   Julio de 1997
// Fecha de Inicio :   Julio de 1997
// Función forma   :   Control de Interforma
// Desarrollo por  :   Víctor Martínez Castro
// Comentarios     :   Forma Estandar
// Modificacion    :   15 Julio 1997. 1:05 pm inicio
//                     Ampliar Capacidades de Interforma.
//                     Mostrar Algunos Controles.
// Actualizado al  :   14 Septiembre
// ------------------------------------------------------------
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Wwdbedit, Wwdbigrd, Wwdbgrid, DB, DBTables, Wwdatsrc,StdCtrls, wwTable,wwQuery,
  wwStorep,Wwdotdot, wwdblook, Wwkeycb, Wwlocate, Buttons, UnSubGen,
  InterFun,InterApl, IntFind, IntSFor, Mask, InterEdit, ExtCtrls;


Const kmsgSinRegistros='No existe un Registro para realizar la operación.';
Const kmsgModificarRegistro='Imposible Modificar el Registro Actual.';
Const kmsgEliminarRegistro='Imposible Eliminar el Registro Actual.';
Const kmsgPreguntaEliminar='¿Desea Eliminar el Registro Actual?';
Const kmsgCrearRegistro='Imposible Crear el Registro Actual.';
Const kmsgAceptarRegistro='Imposible Aceptar los cambios del Registro Actual.';
Const kmsgCancelarRegistro='Imposible Cancelar los cambios del Registro Actual.';


Type TFormaEstilo = (feAutomatico,feHorizontal,feVertical);
Type TAccion= (acNuevo, acModificar, acEliminar, acBuscar, acConsultar, acAyuda, acSalir, acCancelar, acAceptar);
Type TFormaTipo = (ftGrid,ftConsulta,ftCaptura,ftMulti,ftModifica, ftImprimir);

Type
  TOnBotonEvent = Procedure (Sender : TObject) of Object;
  TOnCompEvent= Procedure (Sender : TObject; Var Realizado:Boolean) of Object;
  TOnCompCanEdit= Procedure (Sender : TObject; CanEdit:Boolean) of Object;
  TOnNuevoEvent= Procedure (Sender : TObject; IsNewData:Boolean; Var Realizado:Boolean) of Object;
  TOnAccionEvent= Procedure (Sender : TObject; Accion:TAccion) of Object;

type
  TInterForma = class(TComponent)
  private
    { Private declarations }

    FIsCancel:Boolean;
    FPanel:TWinControl;
    FGroupBox:TGroupBox;

    FOnExitEvent:TOnBotonEvent;

    FValidExitOK:Boolean;

    FOnAntesNuevo:TOnCompEvent;
    FOnNuevo:TOnCompEvent;
    FOnDespuesNuevo:TOnBotonEvent;
    FOnErrorNuevo:TOnBotonEvent;
    FBtnNuevo:TBitBtn;
    FShowBtnNuevo:Boolean;
    FOnBtnNuevoClick:TOnBotonEvent;
    FOnDespuesShow:TOnBotonEvent;

    FOnAntesModificar:TOnCompEvent;
    FOnModificar:TOnCompEvent;
    FOnDespuesModificar:TOnBotonEvent;
    FOnErrorModificar:TOnBotonEvent;
    FBtnModificar:TBitBtn;
    FShowBtnModificar:Boolean;
    FOnBtnModificarClick:TOnBotonEvent;

    FOnAntesEliminar:TOnCompEvent;
    FOnEliminar:TOnCompEvent;
    FOnDespuesEliminar:TOnBotonEvent;
    FOnErrorEliminar:TOnBotonEvent;
    FBtnEliminar:TBitBtn;
    FShowBtnEliminar:Boolean;
    FOnBtnEliminarClick:TOnBotonEvent;

    FOnAccion:TOnAccionEvent;

    FOnAceptar:TOnCompEvent;
    FOnDespuesAceptar:TOnBotonEvent;
    FOnErrorAceptar:TOnBotonEvent;
    FOnAntesAceptar:TOnNuevoEvent;
    FBtnAceptar:TBitBtn;
    FShowBtnAceptar:Boolean;
    FOnBtnAceptarClick:TOnBotonEvent;

    FOnCancelar:TOnCompEvent;
    FOnDespuesCancelar:TOnBotonEvent;
    FOnErrorCancelar:TOnBotonEvent;
    FBtnCancelar:TBitBtn;
    FShowBtnCancelar:Boolean;
    FOnBtnCancelarClick:TOnBotonEvent;


    FOnAyuda:TOnBotonEvent;
    FBtnAyuda:TBitBtn;
    FShowBtnAyuda:Boolean;
    FOnBtnAyudaClick:TOnBotonEvent;

    FOnBuscar:TOnBotonEvent;
    FBtnBuscar:TBitBtn;
    FShowBtnBuscar:Boolean;
    FOnBtnBuscarClick:TOnBotonEvent;

    FOnSalir:TOnBotonEvent;
    FBtnSalir:TBitBtn;
    FShowBtnSalir:Boolean;
    FOnBtnSalirClick:TOnBotonEvent;


    FOnImprimir:TOnBotonEvent;
    FBtnImprimir:TBitBtn;
    FShowBtnImprimir:Boolean;
    FOnBtnImprimirClick:TOnBotonEvent;

    FOnPreview:TOnBotonEvent;
    FBtnPreview:TBitBtn;
    FShowBtnPreview:Boolean;
    FOnBtnPreviewClick:TOnBotonEvent;





    FMsgSinRegistros:string;
    FmsgModificarRegistro:String;
    FmsgEliminarRegistro:String;
    FmsgCrearRegistro:String;
    FmsgAceptarRegistro:String;
    FmsgCancelarRegistro:String;
    FMsgPreguntaEliminar:String;

    FGroupCaption:String;
    FFormaTipo:TFormaTipo;
    FFormaEstilo:TFormaEstilo;


    FMsgAccion:String;
    FGrid:TwwDBGrid;

    FHideButtons:Boolean;

    FOnCanEdit:TOnCompCanEdit;
    FShowError:Boolean;

    FFun:TInterFun;
    FCanCloseForm:Boolean;
    FCentrarForma:Boolean;

    FInterFrame:TBaseInterFrame;

  protected
    { Protected declarations }
   FCanEdit  :Boolean;
   FIsNewData:Boolean;
   FIsMain:Boolean;
   Forma:TForm;
   FDataSet:TwwDataSource;
   FGridDataSet:TwwDataSource;
   FVersion:Integer;
   FShowGrid:Boolean;
   FShowNavigator:Boolean;
   procedure Notification( AComponent : TComponent; Operation : TOperation ); override;
   Procedure SetCanEdit(B:Boolean);
   Procedure SetIsNewData(B:Boolean);

   Function GetCanEdit:Boolean;
   Function GetIsNewData:Boolean;

   Procedure SetBtnNuevo(B:TBitBtn);
   Procedure SetShowBtnNuevo(B:Boolean);

   Procedure SetBtnModificar(B:TBitBtn);
   Procedure SetShowBtnModificar(B:Boolean);

   Procedure SetBtnEliminar(B:TBitBtn);
   Procedure SetShowBtnEliminar(B:Boolean);

   Procedure SetBtnAceptar(B:TBitBtn);
   Procedure SetShowBtnAceptar(B:Boolean);

   Procedure SetBtnCancelar(B:TBitBtn);
   Procedure SetShowBtnCancelar(B:Boolean);

   Procedure SetBtnBuscar(B:TBitBtn);
   Procedure SetShowBtnBuscar(B:Boolean);

   Procedure SetBtnImprimir(B:TBitBtn);
   Procedure SetShowBtnImprimir(B:Boolean);

   Procedure SetBtnPreview(B:TBitBtn);
   Procedure SetShowBtnPreview(B:Boolean);

   Procedure SetBtnAyuda(B:TBitBtn);
   Procedure SetShowBtnAyuda(B:Boolean);

   Procedure SetBtnSalir(B:TBitBtn);
   Procedure SetShowBtnSalir(B:Boolean);

   Procedure SetFormaTipo(F:TFormaTipo);

   Function IsDataSet:Boolean;
   Function IsInterFrame:Boolean;
   Function IsNone:Boolean;

   Procedure FAyuda;
   Procedure FBuscar;
   Procedure FSalir;

   Function GetIsCancel:Boolean;

  public
    { Public declarations }
    F:TfoInterForma;
    ModalResult:Integer;
    TT:TwwLocateDialog;

    MsgPanel:TPanel;

    LocalMemo:TMemo;
    LocalFin:TWinControl;
    LocalNivel:Integer;
    LocalFocu:TWinControl;

    ShowErrorMessage:Boolean;
    ValidaExitConsulta:Boolean;

    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    Function  Nuevo:Boolean;
    Procedure ErrorNuevo;
    Procedure DespuesNuevo;
    Procedure HaceNuevo(Var Realizado:Boolean);
    procedure PreparaNuevo;
    procedure TerminaNuevo(Realizado:Boolean);
    Procedure FHaceNuevo(Var Realizado:Boolean);
    Procedure BtnNuevoClick (Sender : TObject);
    Procedure AntesNuevo(Var Realizado:Boolean);

    function  Modificar:Boolean;
    Procedure ErrorModificar;
    PRocedure DespuesModificar;
    Procedure HaceModificar(Var Realizado:Boolean);
    procedure PreparaModificar;  // nuevos.
    procedure TerminaModificar(Realizado:Boolean);
    Procedure FHaceModificar(Var Realizado:Boolean);
    Procedure BtnModificarClick (Sender : TObject);
    Procedure AntesModificar(Var Realizado:Boolean);

    Procedure Eliminar;
    Procedure ErrorEliminar;
    PRocedure DespuesEliminar;
    Procedure HaceEliminar(Var Realizado:Boolean);
    procedure PreparaEliminar;  // nuevos.
    procedure TerminaEliminar(Realizado:Boolean);
    Procedure FHaceEliminar(Var Realizado:Boolean);
    Procedure BtnEliminarClick (Sender : TObject);
    Procedure AntesEliminar(Var Realizado:Boolean);


    Procedure Aceptar;
    Procedure ErrorAceptar;
    Procedure AntesAceptar(IsNewData:Boolean; Var Realizado:Boolean);
    Procedure DespuesAceptar;
    Procedure HaceAceptar(Var Realizado:Boolean);
    procedure PreparaAceptar;  // nuevos.
    procedure TerminaAceptar(Realizado:Boolean);
    Procedure FHaceAceptar(Var Realizado:Boolean);
    Procedure BtnAceptarClick (Sender : TObject);

    Procedure Cancelar;
    Procedure ErrorCancelar;
    Procedure DespuesCancelar;
    Procedure HaceCancelar(Var Realizado:Boolean);
    procedure PreparaCancelar;  // nuevos.
    procedure TerminaCancelar(Realizado:Boolean);
    Procedure FHaceCancelar(Var Realizado:Boolean);
    Procedure BtnCancelarClick (Sender : TObject);

    Procedure  Ayuda;
    Procedure  BtnAyudaClick(Sender : TObject);

    Procedure  Buscar;
    Procedure  BtnBuscarClick (Sender : TObject);


    Procedure  Imprimir;
    Procedure  BtnImprimirClick (Sender : TObject);


    Procedure  Preview;
    Procedure  BtnPreviewClick (Sender : TObject);

    Procedure  Salir;
    Procedure  BtnSalirClick (Sender : TObject);

    Procedure  Accion(Accion:TAccion);
    PRocedure  SetDataSet(T:TwwDataSource);

    Function DameGridDataSet:TwwDataSource;

    Procedure Cierra;
    Procedure InitShow;

    Procedure SetVersion(V:Integer);

    Function CanClose(Var Can:Boolean):Boolean;
    Procedure SetMsgAccion(S:String);

    Function Ocultos:Integer;
    Procedure SetGroupBox(T:TGroupBox);

    Procedure DoCanEdit(CanEdit:Boolean);

    Procedure KeyPress(Sender:TObject; Var Key:char);

    Property CanCloseForm:Boolean Read FCanCloseForm Write FCanCloseForm;

    Procedure VerificaMacro;
    Procedure DespuesShow;
    Procedure EventoBtnExit(Sender:TObject);
    Procedure ShowMsgPanel(Msg:String);
        //Procedure FOnNuevo;
  published
    { Published declarations }
    Property GridDataSet:TwwDataSource  read DameGridDataSet Write FGridDataSet default nil;
    Property DataSet:TwwDataSource  read FDataSet Write SetDataSet default nil;

//    Property Forma:TForm  read FForma Write FForma;
    Procedure ShowModal;
    Procedure Show;

    Property IsMain:Boolean Read FIsMain  Write FIsMain;

    Property OnNuevo: TOnCompEvent read FOnNuevo write FOnNuevo;
    Property OnDespuesNuevo: TOnBotonEvent read FOnDespuesNuevo write FOnDespuesNuevo;
    Property OnErrorNuevo: TOnBotonEvent read FOnErrorNuevo write FOnErrorNuevo;

    Property OnModificar: TOnCompEvent read FOnModificar write FOnModificar;
    Property OnDespuesModificar: TOnBotonEvent read FOnDespuesModificar write FOnDespuesModificar;
    Property OnErrorModificar: TOnBotonEvent read FOnErrorModificar write FOnErrorModificar;

    Property OnEliminar: TOnCompEvent read FOnEliminar write FOnEliminar;
    Property OnDespuesEliminar: TOnBotonEvent read FOnDespuesEliminar write FOnDespuesEliminar;
    Property OnErrorEliminar: TOnBotonEvent read FOnErrorEliminar write FOnErrorEliminar;

    Property OnCancelar: TOnCompEvent read FOnCancelar write FOnCancelar;
    Property OnDespuesCancelar: TOnBotonEvent read FOnDespuesCancelar write FOnDespuesCancelar;
    Property OnErrorCancelar: TOnBotonEvent read FOnErrorCancelar write FOnErrorCancelar;

    Property OnAccion:TOnAccionEvent Read FOnAccion Write FOnAccion;

    Property OnCanEdit:TOnCompCanEdit Read FOnCanEdit Write FOnCanEdit;

    Property OnAceptar: TOnCompEvent read FOnAceptar write FOnAceptar;
    Property OnDespuesAceptar: TOnBotonEvent read FOnDespuesAceptar write FOnDespuesAceptar;
    Property OnErrorAceptar: TOnBotonEvent read FOnErrorAceptar write FOnErrorAceptar;

    Property OnAntesAceptar: TOnNuevoEvent read FOnAntesAceptar write FOnAntesAceptar;
    Property OnAntesNuevo:TOnCompEvent read FOnAntesNuevo write FOnAntesNuevo;
    Property OnAntesEliminar:TOnCompEvent Read FOnAntesEliminar Write FOnAntesEliminar;
    Property OnAntesModificar:TOnCompEvent read FOnAntesModificar write FOnAntesModificar;

    Property OnBuscar:TOnBotonEvent read FOnBuscar write FOnBuscar;
    Property OnAyuda:TOnBotonEvent read FOnAyuda write FOnAyuda;

    Property OnImprimir:TOnBotonEvent read FOnImprimir write FOnImprimir;
    Property OnPreview:TOnBotonEvent read FOnPreview write FOnPreview;

    Property OnSalir:TOnBotonEvent read FOnSalir write FOnSalir;

    Property msgSinRegistros:String read FMsgSinRegistros Write FmsgSinRegistros;
    Property msgModificarRegistro:String read FMsgModificarRegistro Write FmsgModificarRegistro;
    Property msgEliminarRegistro:String read FmsgEliminarRegistro Write FmsgEliminarRegistro;
    Property msgCrearRegistro:String read FmsgCrearRegistro Write FmsgCrearRegistro;
    Property msgAceptarRegistro:String read FmsgAceptarRegistro Write FmsgAceptarRegistro;
    Property msgCancelarRegistro:String read FmsgCancelarRegistro Write FmsgCancelarRegistro;
    Property msgPreguntaEliminar:String Read FmsgPreguntaEliminar Write FMsgPreguntaEliminar;

    Property GroupCaption :String read FGroupCaption Write FGroupCaption;
    Property FormaTipo:TFormaTipo read FFormaTipo write SetFormaTipo default ftGrid;
    Property FormaEstilo:TFormaEstilo read FFormaEstilo Write FFormaEstilo default feAutomatico;

    Property CanEdit:Boolean Read FCanEdit Write SetCanEdit;
    Property IsNewData:Boolean Read FIsNewData Write SetIsNewData;

    Property Panel:TWinControl Read FPanel Write FPanel;
    Property MsgAccion:String Read FMsgAccion Write SetMsgAccion;

    Property BtnNuevo:TBitBtn Read FBtnNuevo Write SetBtnNuevo;
    Property OnBtnNuevoClick:TOnBotonEvent Read FOnBtnNuevoClick Write FOnBtnNuevoClick;
    Property ShowBtnNuevo:Boolean Read FShowBtnNuevo Write SetShowBtnNuevo Default True;

    Property BtnModificar:TBitBtn Read FBtnModificar Write SetBtnModificar;
    Property OnBtnModificarClick:TOnBotonEvent Read FOnBtnModificarClick Write FOnBtnModificarClick;
    Property ShowBtnModificar:Boolean Read FShowBtnModificar Write SetShowBtnModificar Default True;


    Property BtnAceptar:TBitBtn Read FBtnAceptar Write SetBtnAceptar;
    Property OnBtnAceptar:TOnBotonEvent Read FOnBtnAceptarClick Write FOnBtnAceptarClick;
    Property ShowBtnAceptar:Boolean Read FShowBtnAceptar Write SetShowBtnAceptar Default True;

    Property BtnCancelar:TBitBtn Read FBtnCancelar Write SetBtnCancelar;
    Property OnBtnCancelar:TOnBotonEvent Read FOnBtnCancelarClick Write FOnBtnCancelarClick;
    Property ShowBtnCancelar:Boolean Read FShowBtnCancelar Write SetShowBtnCancelar Default True;

    Property BtnEliminar:TBitBtn Read FBtneliminar Write SetBtnEliminar;
    Property OnBtnEliminar:TOnBotonEvent Read FOnBtnEliminarClick Write FOnBtneliminarClick;
    Property ShowBtnEliminar:Boolean Read FShowBtnEliminar Write SetShowBtnEliminar Default True;
    Property Version:Integer Read FVersion Write SetVersion;

    Property  Grid:TwwDBGrid Read FGrid Write FGrid;
    Property  HideButtons:Boolean Read FHideButtons Write FHideButtons;
    Property  GroupBox:TGroupBox Read FGroupBox Write SetGroupBox;

    Property BtnPreview:TBitBtn Read FBtnPreview Write SetBtnPreview;
    Property OnBtnPreviewClick:TOnBotonEvent Read FOnBtnPreviewClick Write FOnBtnPreviewClick;
    Property ShowBtnPreview:Boolean Read FShowBtnPreview Write SetShowBtnPreview Default True;

    Property BtnImprimir:TBitBtn Read FBtnImprimir Write SetBtnImprimir;
    Property OnBtnImprimirClick:TOnBotonEvent Read FOnBtnImprimirClick Write FOnBtnImprimirClick;
    Property ShowBtnImprimir:Boolean Read FShowBtnImprimir Write SetShowBtnImprimir Default True;

    Property BtnBuscar:TBitBtn Read FBtnBuscar Write SetBtnBuscar;
    Property OnBtnBuscarClick:TOnBotonEvent Read FOnBtnBuscarClick Write FOnBtnBuscarClick;
    Property ShowBtnBuscar:Boolean Read FShowBtnBuscar Write SetShowBtnBuscar Default True;

    Property BtnAyuda:TBitBtn Read FBtnAyuda Write SetBtnAyuda;
    Property OnBtnAyudaClick:TOnBotonEvent Read FOnBtnAyudaClick Write FOnBtnAyudaClick;
    Property ShowBtnAyuda:Boolean Read FShowBtnAyuda Write SetShowBtnAyuda Default True;


    Property BtnSalir:TBitBtn Read FBtnSalir Write SetBtnSalir;
    Property OnBtnSalirClick:TOnBotonEvent Read FOnBtnSalirClick Write FOnBtnSalirClick;
    Property ShowBtnSalir:Boolean Read FShowBtnSalir Write SetShowBtnSalir Default True;

    Property ShowGrid:Boolean Read FShowGrid Write FShowGrid Default True;
    Property ShowNavigator:Boolean Read FShowNavigator Write FShowNavigator Default True;
    Property ShowError:Boolean Read FShowError Write FShowError Default True;
    Property Funcion:TInterFun Read FFun Write FFun;
    Property CentrarForma:Boolean Read FCentrarForma Write FCentrarForma Default True;
    Property InterFrame:TBaseInterFrame Read FInterFrame Write FInterFrame;
    Property IsCancel:Boolean Read GetIsCancel Write FIsCancel;
    Property OnDespuesShow:TOnBotonEvent Read FOnDespuesShow Write FOnDespuesShow;
    Property OnExitEvent:TOnBotonEvent Read FOnExitEvent Write FOnExitEvent;
    Function PreValidaExit(eControl:TWinControl):Boolean;
    Function ValidaExit(eControl:TWinControl; CanExit:Boolean; Msg:String; NotFoundNextTab:Boolean):Boolean;
    Procedure NextTab(eControl:TWinControl);
    Function ChecaTab:Boolean;
    Procedure MandaFoco(MM:String; eControl:TControl);
    Procedure Esc(S:String; Control:TWinControl);
    Procedure MsValida(Var Message:TMessage); 
  end;

Procedure EjecutaMacro(Par:String; Forma:TForm);

procedure Register;

implementation
{$R *.DCR}

Uses UnGene;

procedure Register;
begin RegisterComponents('Inter', [TInterForma]);
end;

Procedure EjecutaMacro(Par:String; Forma:TForm);
var i,j:Integer;
    Nom,Tok:String;
    Ter:Boolean;

Function SinComas(S:String):String;
var AuxS:string;
    I:Integer;
    N:Integer;
    R:Boolean;
begin AuxS:=''; //N:=0;
      R:=False;
      i:=1;
      While (i<=Length(S)) do
      begin if S[i]=#39
                 then begin if R
                            then begin AuxS:=AuxS+#39;
                                       R:=True;
                                 end
                            else begin //R:=True;
                                       //AuxS:=AuxS+#39;
                                       //Inc(N)
                                       R:=False;
                                 end;
                            R:=True;
                      end
                 else begin AuxS:=AuxS+S[i];
                            R:=False;
                      end;
            Inc(i);
      end;
      SinComas:=AuxS;
end;

Function DameToken(Var S:String; Var Termino:Boolean):String;
var i:Integer;
    SS:String;
begin SS:='';
      i:=1;
      While (i<=Length(S))  do
      begin if (S[i]='.') or (S[i]='=')
            then begin if SS<>''
                       then begin DameToken:=SS;
                                  S:=Copy(S,Length(SS)+2,Length(S));
                                  Exit;
                            end;
                 end
            else if S[i]=#39
            then begin SS:=SS+S[i];
                       Inc(i);
                       While (i<=Length(S)) do
                       begin if S[i]=#39
                             then begin Inc(i);
                                        if (i<=Length(S))
                                        then SS:=SS+#39
                                        else begin DameToken:=SS;
                                                   S:=Copy(S,Length(SS)+2,Length(S));
                                                   Exit;
                                             end;
                                  end
                             else SS:=SS+S[i];
                             Inc(i);
                       end;
                 end
            else SS:=SS+S[i];
            Inc(i);
      end;
      if SS<>''
         then DameToken:=SS
         else DameToken:='';
      Termino:=True;
end;


Procedure Trata(Obj:Tcomponent; Var Par:String);
Var nUMERO,Prop,Campo:String;
    Fin:Boolean;
    Key:Array[0..20] of String;
    KeyCount:Integer;
    i:Integer;
    Hijo:TBaseInterFrame;
begin Prop:=Trim(UpperCase(DameToken(Par,Fin)));
   if Obj is TEdit
      then begin if Prop='TEXT' then
                 begin TEdit(Obj).Text:=SinComas(Par);
                       Exit;
                 end;
                 if Prop='SETFOCUS' then
                 begin TEdit(Obj).SetFocus;
                       Exit;
                 end;
           end;
   if Obj is TMaskEdit
      then begin if Prop='TEXT' then
                 begin TMaskEdit(Obj).Text:=SinComas(Par);
                       Exit;
                 end;
                 if Prop='SETFOCUS' then
                 begin TMaskEdit(Obj).SetFocus;
                       Exit;
                 end;
           end;
   if Obj is TInterEdit
      then begin if Prop='TEXT' then
                 begin TInterEdit(Obj).Text:=SinComas(Par);
                       Exit;
                 end;
                 if Prop='SETFOCUS' then
                 begin TInterEdit(Obj).SetFocus;
                       Exit;
                 end;
           end;
   if Obj is TCheckBox
      then begin if Prop='CHECK' then
                 begin Prop:=Trim(UpperCase((Par)));
                       if (Prop='TRUE') or (Prop='T') or (Prop='V')
                          then TCheckBox(Obj).Checked:=True;
                       if (Prop='FLASE') or (Prop='F') // or (Prop='F')
                          then TCheckBox(Obj).Checked:=False;
                       Exit;
                 end;
                 if Prop='SETFOCUS' then
                 begin TCheckBox(Obj).SetFocus;
                       Exit;
                 end;
           end;
   if Obj is TMemo
      then begin if Prop='TEXT' then
                 begin TMemo(Obj).Text:=SinComas(Par);
                       Exit;
                 end;
                 if Prop='SETFOCUS' then
                 begin TMemo(Obj).SetFocus;
                       Exit;
                 end;
           end;
   if Obj is TButton
      then begin if Prop='CLICK' then
                 begin TButton(Obj).Click;
                       Exit;
                 end;
                 if Prop='SETFOCUS' then
                 begin TButton(Obj).SetFocus;
                       Exit;
                 end;
           end;
   if Obj is TComboBox
      then begin if Prop='ITEMINDEX' then
                 begin TComboBox(Obj).ItemIndex:=StrToInt(Par);
                       Exit;
                 end;
                 if Prop='FIND' then
                 begin TComboBox(Obj).ItemIndex:=TComboBox(Obj).Items.IndexOf(SinComas(Par));
                       Exit;
                 end;
                 if Prop='SETFOCUS' then
                 begin TComboBox(Obj).SetFocus;
                       Exit;
                 end;
           end;
   if Obj is TListBox
      then begin if Prop='ITEMINDEX' then
                 begin TListBox(Obj).ItemIndex:=StrToInt(Par);
                       Exit;
                 end;
                 if Prop='FIND' then
                 begin TListBox(Obj).ItemIndex:=TListBox(Obj).Items.IndexOf(SinComas(Par));
                       Exit;
                 end;
                 if Prop='SETFOCUS' then
                 begin TListBox(Obj).SetFocus;
                       Exit;
                 end;
           end;
   if Obj is TRadioGroup
      then begin if Prop='ITEMINDEX' then
                 begin TRadioGroup(Obj).ItemIndex:=StrToInt(Par);
                       Exit;
                 end;
                 if Prop='FIND' then
                 begin TRadioGroup(Obj).ItemIndex:=TRadioGroup(Obj).Items.IndexOf(SinComas(Par));
                       Exit;
                 end;
                 if Prop='SETFOCUS' then
                 begin TRadioGroup(Obj).SetFocus;
                       Exit;
                 end;
           end;
   if Obj is TSpeedButton
      then begin if Prop='CLICK' then
                 begin TSpeedButton(Obj).Click;
                       Exit;
                 end;
                 if Prop='SETFOCUS' then
                 begin //TSpeedButton(Obj).SetFocus;
                       ShowMessage('No se Puede Ejecutar SetFocus a ['+TSpeedButton(Obj).Name+']');
                       Exit;
                 end;
           end;
   if Obj is TBaseInterFrame
      then begin (*
                 if Prop='CAMPO' then
                 begin CAMPO:=Trim(UpperCase(DameToken(Par,Fin)));
                       TInterFrame(Obj).FieldByName(Campo).AsString:=SinComas(Par);
                       Exit;
                 end;
                 *)
                 if Prop='BUSCA' then
                 begin TBaseInterFrame(Obj).Busca;
                       Exit;
                 end;
                 if Prop='APPEND' then
                 begin TBaseInterFrame(Obj).Append;
                       Exit;
                 end;
                 if Prop='EDIT' then
                 begin TBaseInterFrame(Obj).Edit;
                       Exit;
                 end;
                 if Prop='POST' then
                 begin TBaseInterFrame(Obj).Post;
                       Exit;
                 end;
                 if Prop='CANCEL' then
                 begin TBaseInterFrame(Obj).Cancel;
                       Exit;
                 end;
                 if Prop='DELETE' then
                 begin TBaseInterFrame(Obj).Cancel;
                       Exit;
                 end;
                 if Prop='FINDKEY' then
                 begin Fin:=False;
                       KeyCount:=0;
                       While Not Fin do
                       begin CAMPO:=Trim(UpperCase(DameToken(Par,Fin)));
                             if (Campo<>'') then
                                begin Key[KeyCount]:=SinComas(Par);
                                      Inc(KeyCount);
                                end;
                       end;
                       if KeyCount<=0 then exit;
                       TBaseInterFrame(Obj).FindKey([key[0],Key[1],Key[2],Key[3],Key[4],Key[5],Key[6],Key[7],Key[8],Key[9],Key[10],Key[11]]);
                       Exit;
                 end;
                 if Prop='CHILD' then
                 begin Fin:=False;
                       Numero:=Trim(UpperCase(DameToken(Par,Fin)));
                       Hijo:=TBaseInterFrame(Obj).GetChildMaster(StrToInt(Numero));
                       KeyCount:=0;
                       While Not Fin do
                       begin CAMPO:=Trim(UpperCase(DameToken(Par,Fin)));
                             if (Campo<>'') then
                                begin Key[KeyCount]:=SinComas(Par);
                                      Inc(KeyCount);
                                end;
                       end;
                       if KeyCount<=0 then exit;
                       Hijo.FindKey([key[0],Key[1],Key[2],Key[3],Key[4],Key[5],Key[6],Key[7],Key[8],Key[9],Key[10],Key[11]]);
                       Exit;
                 end;
           end;
   if Obj is TInterForma
      then begin if Prop='BUSCA' then
                 begin TInterForma(Obj).Buscar;
                       Exit;
                 end;
                 if (Prop='APPEND')or(Prop='NUEVO') then
                 begin TInterForma(Obj).Nuevo;
                       Exit;
                 end;
                 if (Prop='EDIT')or(Prop='MODIFICAR') then
                 begin TInterForma(Obj).Modificar;
                       Exit;
                 end;
                 if (Prop='POST')or(Prop='ACEPTAR') then
                 begin TInterForma(Obj).Aceptar;
                       Exit;
                 end;
                 if (Prop='CANCEL')or(Prop='CANCELAR') then
                 begin TInterForma(Obj).Cancelar;
                       Exit;
                 end;
                 if (Prop='DELETE')or(Prop='ELIMINAR') then
                 begin TInterForma(Obj).Eliminar;
                       Exit;
                 end;
                 if (Prop='EXIT')or(Prop='SALIR') then
                 begin TInterForma(Obj).Salir;
                       Exit;
                 end;
                 if Prop='FINDKEY' then
                 begin Fin:=False;
                       KeyCount:=0;
                       While Not Fin do
                       begin CAMPO:=Trim(UpperCase(DameToken(Par,Fin)));
                             if (Campo<>'') then
                                begin Key[KeyCount]:=SinComas(Par);
                                      Inc(KeyCount);
                                end;
                       end;
                       if KeyCount<=0 then exit;
                       IF TInterForma(Obj).InterFrame<>nil
                       then TInterForma(Obj).InterFrame.FindKey([key[0],Key[1],Key[2],Key[3],Key[4],Key[5],Key[6],Key[7],Key[8],Key[9],Key[10],Key[11]]);
                       Exit;
                 end;
                 if Prop='CHILD' then
                 begin Fin:=False;
                       Hijo:=nil;
                       Numero:=Trim(UpperCase(DameToken(Par,Fin)));
                       IF TInterForma(Obj).InterFrame<>nil
                       then Hijo:=TInterForma(Obj).InterFrame.GetChildMaster(StrToInt(Numero));
                       KeyCount:=0;
                       While Not Fin do
                       begin CAMPO:=Trim(UpperCase(DameToken(Par,Fin)));
                             if (Campo<>'') then
                                begin Key[KeyCount]:=SinComas(Par);
                                      Inc(KeyCount);
                                end;
                       end;
                       if (KeyCount<=0)or(Hijo=nil) then exit;
                       Hijo.FindKey([key[0],Key[1],Key[2],Key[3],Key[4],Key[5],Key[6],Key[7],Key[8],Key[9],Key[10],Key[11]]);
                       Exit;
                 end;

                 if Prop='CHILDCAMPO' then
                 begin Fin:=False;
                       Hijo:=nil;
                       Numero:=Trim(UpperCase(DameToken(Par,Fin)));
                       IF TInterForma(Obj).InterFrame<>nil
                       then Hijo:=TInterForma(Obj).InterFrame.GetChildMaster(StrToInt(Numero));
                       Campo:=Trim(UpperCase(DameToken(Par,Fin)));

                       KeyCount:=0;
                       While Not Fin do
                       begin CAMPO:=Trim(UpperCase(DameToken(Par,Fin)));
                             if (Campo<>'') then
                                begin Key[KeyCount]:=SinComas(Par);
                                      Inc(KeyCount);
                                end;
                       end;
                       if (KeyCount<=0)or(Hijo=nil) then exit;
                       Hijo.FindKey([key[0],Key[1],Key[2],Key[3],Key[4],Key[5],Key[6],Key[7],Key[8],Key[9],Key[10],Key[11]]);
                       Exit;
                 end;
           end;
end;

begin Nom:=DameToken(Par,Ter);
      if Nom<>''
      then begin Nom:=Trim(UpperCase(Nom));
           end;
      (*
      For i:=0 to Forma.ControlCount-1 do
      begin if UpperCase(Forma.Controls[i].Name)=Nom
               then Trata(Forma.Controls[i],Par);
      end;
      *)

      For i:=0 to Forma.ComponentCount-1 do
      begin if UpperCase(Forma.Components[i].Name)=Nom
               then Trata(Forma.Components[i],Par);
      end;

end;

Procedure TInterForma.EventoBtnExit(Sender:TObject);
begin if (F<>nil)
      then begin if ( (F.btNuevo<>nil)     and (F.btNuevo.Focused) )
                 or ( (F.btModificar<>nil) and (F.btModificar.Focused) )
                 or ( (F.btAceptar<>nil)   and (F.btAceptar.Focused) )
                 or ( (F.btCancelar<>nil)  and (F.btCancelar.Focused) )
                 or ( (F.btCerrar<>nil)    and (F.btCerrar.Focused) )
                 or ( (F.btAyuda<>nil)     and (F.btAyuda.Focused) )
                 or ( (F.btImprimir<>nil)  and (F.btImprimir.Focused) )
                 or ( (F.btPreview<>nil)   and (F.btPreview.Focused) )
                 then
                 else if Assigned(OnExitEvent) then FOnExitEvent(Sender);
          end;
end;

Procedure TInterForma.DespuesShow;
begin if Assigned(OnDespuesShow) then FOnDespuesShow(Self);
end;

Procedure TInterForma.VerificaMacro;
var Path:String;
    i,j:Integer;
    T:TStringList;
begin For i:=4 to ParamCount do
      begin if Pos('MACRO@',ParamStr(i))=1
            then begin Path:=Copy(PAramStr(i),7,Length(PAramStr(i)));
                       T:=TStringList.Create;
                       Try T.Clear;
                           T.LoadFromFile(Path);
                           For j:=0 to T.Count-1 do
                           begin EjecutaMacro(T.Strings[j],Forma);
                           end;
                       Finally T.Free;
                       end;
                 end;
      end;
end;


Function TInterForma.GetIsCancel:Boolean;
begin GetIsCancel:=False;
      if (F<>nil)and( F.BtCancelar<>nil)
      then GetIsCancel:=F.btCancelar.Focused;
end;

Procedure TInterForma.ShowMsgPanel(Msg:String);
begin if MsgPanel<>nil then
      begin if Pos('C@',Msg)=1
            then begin  Exit;
                 end;
            if Trim(Msg)=''
            then begin MsgPanel.Color:=clbtnFace;
                       MsgPanel.Font.Color:=clWindowText;
                       MsgPanel.Caption:='';
                       Exit;
                 end;
            if Pos('E@',Msg)=1
            then begin MsgPanel.Caption:=Copy(Msg,3,Length(Msg));
                       MsgPanel.Font.Color:=clWhite;
                       MsgPanel.Color:=clRed;
                       exit;
                 end;
            if Pos('M@',Msg)=1
            then begin MsgPanel.Caption:=Copy(Msg,3,Length(Msg));
                       MsgPanel.Font.Color:=clWhite;
                       MsgPanel.Color:=clRed;
                       exit;
                 end;
            if Pos('T@',Msg)=1
            then begin MsgPanel.Caption:=Copy(Msg,3,Length(Msg));
                       MsgPanel.Font.Color:=clWindowText;
                       MsgPanel.Color:=clBtnFace;
                       exit;
                 end;
            MsgPanel.Caption:=Msg;
            MsgPanel.Font.Color:=clWhite;
            MsgPanel.Color:=clRed;

      end;
end;

Procedure TInterForma.Esc(S:String; Control:TWinControl);
var M:String;
begin S:=Copy('1   2   3   4   5   6   7   8',1,LocalNivel*4)+S;
      M:='nil';
      if Control<>nil then M:=Control.Name+' '+Control.ClassName;
      if (LocalMemo<>nil) then LocalMemo.Lines.Add(S+' '+M);
end;

Procedure TInterForma.MandaFoco(MM:String; eControl:TControl);
var RG:TRadioGroup;
begin if F=nil then exit;
      if eControl is TWinControl
      then begin if eControl is TRadioGroup
                 then begin RG:=TRadioGroup(eControl);
                            Esc('MandaFoco RG ['+MM+']',TWinControl(eControl));
                            if RG.ItemIndex<>-1
                            then F.FocusControl(TWinControl(RG.Components[RG.ItemIndex]))
                            else if RG.ComponentCount>1
                                 then F.FocusControl(TWinControl(RG.Components[0]))
                                 else F.FocusControl(TWinControl(eControl));
                     end
                 else begin F.FocusControl(TWinControl(eControl));
                            Esc('MandaFoco ['+MM+']',TWinControl(eControl));
                      end;
                 Exit;
           end;
      Esc('No Pudo Mandar Foco '+eControl.Name+' '+EControl.ClassName,nil);
      //else eControl.F.FocusControl(eControl);
end;


Procedure TInterForma.MsValida(Var Message:TMessage);
var Actual:TWinControl;
begin if Message.LParam<>0
      then begin Actual:=TWinControl(Message.LParam);
                 NextTab(TWinControl(Message.LParam));
           end
      else begin if (Screen.ActiveControl.Parent<>nil)
                and  (Screen.ActiveControl.Parent is TRadioGroup )
                then begin if Screen.ActiveControl.Parent=LocalFocu
                           then EXIT;
                     end
                else  //Screen.ActiveControl.=LocalFocu
                      if StrToInt(Copy(IntToStr(Screen.ActiveControl.HelpContext),1,3))
                         =StrToInt(Copy(IntToStr(LocalFocu.HelpContext),1,3))
                     then EXIT;
                 Actual:=Screen.ActiveControl;
                 NextTab(Screen.ActiveControl);
           end;
//      NextTab(Screen.ActiveControl);
      Application.ProcessMessages;
      IF (Actual=Screen.ActiveControl)
         or ( StrToInt(Copy(IntToStr(Actual.HelpContext),1,3))
                         =StrToInt(Copy(IntToStr(Screen.ActiveControl.HelpContext),1,3)) )
      THEN begin EXIT;
           end
      ELSE begin PostMessage(F.Handle,WM_MSVALIDA,0,0);
           end;
end;

Function TInterForma.ValidaExit(eControl:TWinControl; CanExit:Boolean; Msg:String; NotFoundNextTab:Boolean):Boolean;
var i,j:Integer;
    Lista:TStringList;
    Num,NAct,NSig:Integer;
    Focu:TWinControl;
    Radio:TRadioGroup;
    Combo:TComboBox;
    Check:TCheckBox;
    RealN:Integer;
    LastN:Integer;
    RealMax:Integer;
    Panel:TPanel;
    Objs:TList;

    NextCto:TWinControl;

    Form:TCustomForm;

Function HIn(W:TComponent):Integer;
begin if W Is TWinControl
      then HIn:=StrToInt(Copy(IntToStr(TWinControl(W).HelpContext),1,3))
      else HIn:=0;
end;


begin ValidaExit:=False;
      if LocalNivel=0 then BEGIN LocalFin:=nil;
                                 if (LocalMemo<>nil) then LocalMemo.Lines.cLEAR;
                           END;
      LocalNivel:=LocalNivel+1;
      Try
      (*
      if LocalFin<>nil then begin Esc('Sale 1 Local Fin:',LocalFin);
                                  Exit;
                            end;
      *)

      Esc('Entra ValidaExit',eControl);
      ValidaExit:=False;
      FValidExitOK:=False;
      if Msg='' then ShowMsgPanel(Msg);
      if (Not CanEdit) and ( Not ValidaExitConsulta )
                          then begin ValidaExit:=True;
                                     ShowMsgPanel('');
                                     Esc('Salio 1 ValidaExit',eControl);
                                     Exit;
                               end;
      if (F.btNuevo.Focused)
      or (F.btModificar.Focused)
//      or (InterForma1.F.btAceptar.Focused)
      or (F.btCancelar.Focused)
      or (F.btCerrar.Focused)
      or (F.btAyuda.Focused)
      then begin ValidaExit:=True;
                 ShowMsgPanel('');
                 //FValidExitOK:=True;
                 Esc('Salio 2 ValidaExit',eControl);
                 Exit;
           end;

      ValidaExit:=False;
      Lista:=TStringList.Create;
      Try
      for i:=0 to Forma.ComponentCount-1 do
      begin if Forma.Components[i] is TWinControl
              then BEGIN IF (IsEnabled(Forma.Components[i])) and (IsFocusControl(Forma.Components[i]))
                         then begin Lista.AddObject(IntToStr(TWinControl(Forma.Components[i]).HelpContext),Forma.Components[i]);
                              end;
                   END;
      end;
      Lista.Sort;
      Num:=StrToInt(Copy(IntToStr(eControl.HelpContext),1,3));
      Focu:=nil;
      for i:=0 to Forma.ComponentCount-1 do
      begin if Forma.Components[i] is TWinControl
            then begin if TWinControl(Forma.Components[i]).Focused
                       then begin Focu:=TWinControl(Forma.Components[i]);
                            end;
                 end;
            if Forma.Components[i] is TRadioGroup
                 then begin Radio:=TRadioGroup(Forma.Components[i]);
                            for j:=0 to Radio.ComponentCount-1 do
                            begin if Radio.Components[j] is TWinControl
                                  then begin if TWinControl(Radio.Components[j]).Focused
                                             then begin Focu:=TWinControl(Forma.Components[i]);
                                                  end;
                                       end;
                            end;
                      end;
            if Forma.Components[i] is TComboBox
                 then begin Combo:=TComboBox(Forma.Components[i]);
                            for j:=0 to Combo.ComponentCount-1 do
                            begin if Combo.Components[j] is TWinControl
                                  then begin if TWinControl(Combo.Components[j]).Focused
                                             then begin Focu:=TWinControl(Forma.Components[i]);
                                                  end;
                                       end;
                            end;
                      end;
            if Forma.Components[i] is TCheckBox
                 then begin Check:=TCheckBox(Forma.Components[i]);
                            for j:=0 to Check.ComponentCount-1 do
                            begin if Check.Components[j] is TWinControl
                                  then begin if TWinControl(Check.Components[j]).Focused
                                             then begin Focu:=TWinControl(Forma.Components[i]);
                                                  end;
                                       end;
                            end;
                      end;
            if Forma.Components[i] is TPanel
                 then begin Panel:=TPanel(Forma.Components[i]);
                            for j:=0 to Panel.ComponentCount-1 do
                            begin if Panel.Components[j] is TWinControl
                                  then begin if TWinControl(Panel.Components[j]).Focused
                                             then begin Focu:=TWinControl(Forma.Components[i]);
                                                  end;
                                       end;
                            end;
                      end;


      end;
//      if Focu=nil then Focu:=FControlActual;
      if (LocalNivel=1) and (Focu<>nil) and (LocalFocu=nil)
         then begin //LocalFocu:=Focu;
                    Esc('LocalFocu:',Focu);
              end;
      (*
      if (LocalNivel>1) and (LocalFocu<>nil)
         then begin Focu:=LocalFocu;
                    Esc('Sub-LocalFocu:',LocalFocu);
              end;
         *)

      Esc('Focussed:',Focu);

      NAct:=-1;
      NSig:=10000;
      RealN:=0;
      LastN:=-1;
      RealMax:=-1;
      For i:=0 to Lista.Count-1 do
      begin if StrToInt(Copy(IntToStr(TWinControl(Lista.Objects[i]).HelpContext),1,3))<>RealN
            then begin RealN:=StrToInt(Copy(IntToStr(TWinControl(Lista.Objects[i]).HelpContext),1,3));
                       Inc(LastN);
                 end;
            if Lista.Objects[i]=Focu then NSig:=LastN; //i;
            if Lista.Objects[i]=eControl then NAct:=LastN;//i;
      end;

      if (Num=RealN) and (F.btAceptar.Focused)
         then begin if (CanExit=True )
                    then begin FValidExitOK:=True;
                               ValidaExit:=True;
                               ShowMsgPanel('');
                               Esc('Salio 3 ValidaExit',eControl);
                               Exit;
                         end;
              end;
      if (NSig=NAct)
      then begin //LocalFin:=eControl;
                 ValidaExit:=False;
                 FValidExitOK:=False;


                 if Not CanExit
                 then Esc('Sale 2 Local Fin:',LocalFin)
                 else begin (*
                            Esc('Salio SigTab 1 ',eControl);
                            Form := GetParentForm(eControl);
                            Form.Perform(WM_NEXTDLGCTL, 0, 0);
                            Application.ProcessMessages;
                            *)
                            //NextTab(eControl);
                            Application.ProcessMessages;
                      end;
                 Exit;
           end
      else
      if (NSig<=NAct)
      THEN begin if NSig=-1 then
                 begin //eControl.SetFocus;
                       MandaFoco('Nsig<NAct',eControl); //
                       MessageBeep(0);
                       ShowMsgPanel(Msg);
                       Esc('Salio 4 ValidaExit',eControl);
                       Exit;
                 end;
                 if CanExit=False then begin //LocalFin:=eControl;
                                       end;
                 if Focu<>nil
                 then MandaFoco('Nsig<NAct',Focu);
                 ValidaExit:=True;
                 FValidExitOK:=True;
                 ShowMsgPanel('');
                 Esc('Salio 4.1 ValidaExit',eControl);
                 Exit;
  //               FControlActual:=Focu;
           end
      ELSE IF (NSig<=NAct+1)
      then begin if (CanExit=False)
                 then begin //FValidExitOK:=False;
                            //eControl.SetFocus;
                            MandaFoco('Nsig<NAct+1 (CanExit=False)',eControl); //
                            MessageBeep(0);
                            ShowMsgPanel(Msg);
                            Esc('Salio 5 ValidaExit',eControl);
                            Exit;
                      end;

                 ValidaExit:=True;
                 ShowMsgPanel('');
                 //LocalFin:=eControl;
                 Esc('Salio 5.1 ValidaExit Local Fin',eControl);
                 Exit;

                 //FValidExitOK:=True;
  //               FControlActual:=Focu;
           end
      else begin
                  if NSig=10000
                     then begin if (CanExit=False)
                                then begin //FValidExitOK:=False;
                                           //eControl.SetFocus;
                                           MandaFoco('Nsig=10000 (CanExit=False)',eControl); //
                                           MessageBeep(0);
                                           ShowMsgPanel(Msg);
                                           Esc('Salio 6 ValidaExit',eControl);
                                           Exit;
                                     end;
                                if NotFoundNextTab
                                then begin ShowMsgPanel(Msg);
                                           NextTab(eControl);
                                           Esc('Salio 7 ValidaExit',eControl);
                                           exit;
                                     end
                                else begin eControl.SetFocus;
                                           //FValidExitOK:=True;
                                           MessageBeep(0);
                                           ValidaExit:=True;
                                           ShowMsgPanel(Msg);
                                           Esc('Salio 8 ValidaExit',eControl);
                                           Exit;
                                     end;
                          end;
               if (CanExit=False)
                  then begin //FValidExitOK:=False;
                             //eControl.SetFocus;
                             //LocalFin:=eControl;
                             MandaFoco('ERR-RARO Nsig=-1 (CanExit=False)',eControl); //
                             ShowMsgPanel(Msg);
                             ValidaExit:=False;
                             Esc('Salio 9 ValidaExit',eControl);
                             Application.ProcessMessages;
                             Exit;
                        end;
                  //ShowMsgPanel(Msg);
                  NextCto:=eControl;
                  ValidaExit:=False;

                  Objs:=TList.Create;
                  //Objs.Add(NextCto);
                  Esc('For i: ',eControl);

                  Application.ProcessMessages;
                  LocalFocu:=Focu;
                  PostMessage(F.Handle,WM_MSVALIDA,0,LongInt(NextCto));
                  //NextTab(NextCto);
                  Exit;

                  Try
                  Repeat
                  //For i:=0 to (NSig-NAct)+1 do
                  //begin
                        if (NextCto<>nil) and (LocalFin=nil) and ((NextCto<>LocalFocu))  Then //(and (Focu<>NextCto) then
                        begin Application.ProcessMessages;
                              NextTab(NextCto);
                              //Application.ProcessMessages;
                              if (Objs.IndexOf(NextCto)=-1) and (Screen.ActiveControl<>nil)
                              //if (Forma.ActiveControl<>nil) and (Forma.ActiveControl<>NextCto)
                              then begin Objs.Add(NextCto); //Screen.ActiveControl);
                                         NextCto:=Screen.ActiveControl;
                                         //Esc('Snd:',NextCto);
                                         (*
                                         if (Screen.ActiveControl<>NextCto) and (HIn(Screen.ActiveControl)>Hin(NextCto))
                                         then NextCto:=Screen.ActiveControl
                                         else begin if (HIn(Screen.ActiveControl)>Hin(NextCto))
                                                    then begin MandaFoco('Sig-1)', eControl); //
                                                         end;
                                                    if (HIn(Screen.ActiveControl)=Hin(NextCto))
                                                    then begin MandaFoco('Sig-2)', eControl); //
                                                         end;
                                                    NextCto:=nil;
                                              end;
                                         *)
                                   end
                              else begin //LocalFin:=NextCto;
                                         NextCto:=nil;
                                   end;
                        end
                        else NextCto:=nil;
                  //end
                  Until (NextCto=nil) or (LocalFin<>nil);
                  //if (NextCto=nil) and (Focu<>nil)  then  MandaFoco('Envia', Focu);
                  Esc('Salio 10 ValidaExit',eControl);
                  Exit;

                  Finally Objs.Free;
                  end;

                (*
                 eControl.SetFocus;
                 //FValidExitOK:=True;
                 MessageBeep(0);
                 ShowMsgPanel(Msg);
                 ValidaExit:=True;
                *)
           end;

      if (CanExit=False)
         then begin //FValidExitOK:=False;
                    MandaFoco('Salio 11.1',eControl);
                    //Focu);
                    //eControl.SetFocus;
                    MessageBeep(0);
                    ShowMsgPanel(Msg);
                    Esc('Salio 11 ValidaExit',eControl);
                    Exit;
           end;

      Finally Lista.Free;
      end;
      Esc('Salio 12 ValidaExit',eControl);

      Finally LocalNivel:=LocalNivel-1;
              if LocalNivel<=0
              then begin LocalNivel:=0;
                         LocalFin:=nil;
                   end;
      end;
end;


Function TInterForma.PreValidaExit(eControl:TWinControl):Boolean;
var i,j:Integer;
    Lista:TStringList;
    Num,NAct,NSig:Integer;
    Focu:TWinControl;
    Radio:TRadioGroup;
    Combo:TComboBox;
    Check:TCheckBox;
    RealN:Integer;
    LastN:Integer;
    RealMax:Integer;
    Panel:TPanel;
    Objs:TList;

    NextCto:TWinControl;

    Form:TCustomForm;

Function HIn(W:TComponent):Integer;
begin if W Is TWinControl
      then HIn:=StrToInt(Copy(IntToStr(TWinControl(W).HelpContext),1,3))
      else HIn:=0;
end;


begin PreValidaExit:=False;
      Try
      if (F.btNuevo.Focused)
      or (F.btModificar.Focused)
//      or (InterForma1.F.btAceptar.Focused)
      or (F.btCancelar.Focused)
      or (F.btCerrar.Focused)
      or (F.btAyuda.Focused)
      then begin Exit;
           end;
      Lista:=TStringList.Create;
      Try
      for i:=0 to Forma.ComponentCount-1 do
      begin if Forma.Components[i] is TWinControl
              then BEGIN IF (IsEnabled(Forma.Components[i])) and (IsFocusControl(Forma.Components[i]))
                         then Lista.AddObject(IntToStr(TWinControl(Forma.Components[i]).HelpContext),Forma.Components[i]);
                   END;
      end;
      Lista.Sort;
      Num:=StrToInt(Copy(IntToStr(eControl.HelpContext),1,3));
      Focu:=nil;
      for i:=0 to Forma.ComponentCount-1 do
      begin if Forma.Components[i] is TWinControl
            then begin if TWinControl(Forma.Components[i]).Focused
                       then begin Focu:=TWinControl(Forma.Components[i]);
                            end;
                 end;
            if Forma.Components[i] is TRadioGroup
                 then begin Radio:=TRadioGroup(Forma.Components[i]);
                            for j:=0 to Radio.ComponentCount-1 do
                            begin if Radio.Components[j] is TWinControl
                                  then begin if TWinControl(Radio.Components[j]).Focused
                                             then begin Focu:=TWinControl(Forma.Components[i]);
                                                  end;
                                       end;
                            end;
                      end;
            if Forma.Components[i] is TComboBox
                 then begin Combo:=TComboBox(Forma.Components[i]);
                            for j:=0 to Combo.ComponentCount-1 do
                            begin if Combo.Components[j] is TWinControl
                                  then begin if TWinControl(Combo.Components[j]).Focused
                                             then begin Focu:=TWinControl(Forma.Components[i]);
                                                  end;
                                       end;
                            end;
                      end;
            if Forma.Components[i] is TCheckBox
                 then begin Check:=TCheckBox(Forma.Components[i]);
                            for j:=0 to Check.ComponentCount-1 do
                            begin if Check.Components[j] is TWinControl
                                  then begin if TWinControl(Check.Components[j]).Focused
                                             then begin Focu:=TWinControl(Forma.Components[i]);
                                                  end;
                                       end;
                            end;
                      end;
            if Forma.Components[i] is TPanel
                 then begin Panel:=TPanel(Forma.Components[i]);
                            for j:=0 to Panel.ComponentCount-1 do
                            begin if Panel.Components[j] is TWinControl
                                  then begin if TWinControl(Panel.Components[j]).Focused
                                             then begin Focu:=TWinControl(Forma.Components[i]);
                                                  end;
                                       end;
                            end;
                      end;


      end;
      NAct:=-1;
      NSig:=10000;
      RealN:=0;
      LastN:=-1;
      RealMax:=-1;
      For i:=0 to Lista.Count-1 do
      begin if StrToInt(Copy(IntToStr(TWinControl(Lista.Objects[i]).HelpContext),1,3))<>RealN
            then begin RealN:=StrToInt(Copy(IntToStr(TWinControl(Lista.Objects[i]).HelpContext),1,3));
                       Inc(LastN);
                 end;
            if Lista.Objects[i]=Focu then NSig:=LastN; //i;
            if Lista.Objects[i]=eControl then NAct:=LastN;//i;
      end;
      if (NSig<=NAct)
      THEN begin if NSig=-1 then
                 begin Exit;
                 end;
                 if Focu<>nil
                 then begin MandaFoco('Nsig<NAct',Focu);
                            PreValidaExit:=True;
                            Esc('Salio 4.1 ValidaExit',eControl);
                            Exit;
                       end;
           end;
      Finally Lista.Free;
      end;

      Finally
      end;
end;



Procedure TInterForma.NextTab(eControl:TWinControl);
var i,j:Integer;
    Lista:TStringList;
    Num,NAct,NSig:Integer;
    Focu:TWinControl;
    Radio:TRadioGroup;
    Form:TCustomForm;
begin CursorEspera;
      Try
      if eControl=nil
      then begin if (screen.ActiveControl<>nil) and (eControl is TWinControl)
                 then begin eControl:=screen.ActiveControl;
                      end
                 else Exit;
           end;

      if (eControl.Parent<>nil) and
         (eControl.Parent is TRadioGroup)
         then begin eControl:=eControl.Parent;
              end;
      Lista:=TStringList.Create;
      Try
      for i:=0 to Forma.ComponentCount-1 do
      begin if Forma.Components[i] is TWinControl
              then BEGIN if Forma.Components[i] IS TRadioGroup
                         then begin IF IsEnabled(Forma.Components[i])
                                    then Lista.AddObject(IntToStr(TWinControl(Forma.Components[i]).HelpContext),Forma.Components[i]);
                              end
                         else
                         IF (IsEnabled(Forma.Components[i]) and (TWinControl(Forma.Components[i]).TabStop))
                         //IF (TWinControl(Forma.Components[i]).Enabled) and (TWinControl(Forma.Components[i]).Visible)
                         then Lista.AddObject(IntToStr(TWinControl(Forma.Components[i]).HelpContext),Forma.Components[i]);
                   END;
      end;
      Lista.Sort;
      Num:=StrToInt(Copy(IntToStr(eControl.HelpContext),1,3));
      NAct:=-1;
      NSig:=-1;
      Focu:=nil;
      For i:=0 to Lista.Count-1 do
      begin if (StrToInt(Copy(IntToStr(TWinControl(Lista.Objects[i]).HelpContext),1,3))>Num)
            and (Focu=nil) then Focu:=TWinControl(Lista.Objects[i]);
      end;
      Finally Lista.Free;
      end;
      if Focu<>nil then begin //Application.ProcessMessages;
                              //Application.ProcessMessages;
                              //Form := GetParentForm(eControl);
                              MandaFoco('PreSending Focus to',Focu);
                              Application.ProcessMessages;
                              (*
                              Focu.SetFocus;
                              Focu.Perform(WM_SETFOCUS, 0, 0);
                              Application.ProcessMessages;
                              *)
                              (*
                              While (Screen.ActiveControl<>Focu) do
                              begin Form := GetParentForm(eControl);
                                    Form.Perform(WM_NEXTDLGCTL, 0, 0);
                                    Application.ProcessMessages;
                              end;
                              *)
                              //Form := GetParentForm(Focu);
                              //Form.SetFocusedControl(Focu); //eControl);
                              //Form.Perform(WM_NEXTDLGCTL, 0, 0);
                              Application.ProcessMessages;
                              if Focu=LocalFocu then LocalFin:=Focu;
                              //Application.ProcessMessages;

                              Esc('Sending Focus to:',Screen.ActiveControl);


                              (*
                              Application.ProcessMessages;
                              F.FocusControl(Focu);
                              Application.ProcessMessages;
                              *)
                              //Forma.ActiveControl:=Focu;

                              //ActiveControl:=nil;
                              //Focu.SetFocus;

                              //F.ActiveControl:=Focu;
                              //Application.ProcessMessages;
                              //Focu.SetFocus;
                        end;
      Finally CursorNormal;
      end;
end;



procedure TInterForma.Notification( AComponent : TComponent; Operation : TOperation);
begin
  inherited Notification( AComponent, Operation );
  { If FDataset gets removed, clear the reference to avoid GPF! }
  if ( Operation = opRemove ) and ( AComponent = FDataset ) then
     FDataset := nil;
  if ( Operation = opRemove ) and ( AComponent = FInterFrame) then
     FInterFrame:= nil;
  if ( Operation = opRemove ) and ( AComponent = FPanel  ) then
     FPanel:= nil;
  if ( Operation = opRemove ) and ( AComponent = FGrid ) then
     FGrid:= nil;
  if ( Operation = opRemove ) and ( AComponent = FGroupBox ) then
     FGroupBox:= nil;

  if ( Operation = opRemove ) and ( AComponent = FBtnNuevo ) then
     FBtnNuevo:= nil;
  if ( Operation = opRemove ) and ( AComponent = FBtnModificar) then
     FBtnModificar:= nil;
  if ( Operation = opRemove ) and ( AComponent = FBtnEliminar) then
     FBtnEliminar:= nil;
  if ( Operation = opRemove ) and ( AComponent = FBtnAceptar ) then
     FBtnAceptar:= nil;
  if ( Operation = opRemove ) and ( AComponent = FBtnCancelar ) then
     FBtnCancelar:= nil;
  if ( Operation = opRemove ) and ( AComponent = FBtnSalir ) then
     FBtnSalir:= nil;
  if ( Operation = opRemove ) and ( AComponent = FBtnBuscar) then
     FBtnBuscar:= nil;
  if ( Operation = opRemove ) and ( AComponent = FBtnAyuda) then
     FBtnAyuda:= nil;

  if ( Operation = opRemove ) and ( AComponent = FBtnImprimir) then
     FBtnImprimir:= nil;

  if ( Operation = opRemove ) and ( AComponent = FBtnPreview) then
     FBtnPreview:= nil;

  if ( Operation = opRemove ) and ( AComponent = FFun) then
     FFun:= nil;
end;

Function TInterForma.ChecaTab:Boolean;
begin //MEssageBeep(0);
      ChecaTab:=True;
end;

Procedure TInterForma.KeyPress(Sender:TObject; Var Key:Char);
var s:string;
    C:TControl;
    Tabla:String;
    Campo:String;
    Llave:String;
    SQL:String;
    Dat:TDataSet;
    DB:String;
begin //if Key=#09 then  //MessageBeep(0);
      Exit;
      //Temporalmente Fuera
      S:='';
      if Not ((Key in ['0'..'9','A'..'Z','a'..'z']) and (Not CanEdit)) then exit;
      if (F<>nil) then
         begin if (F.ActiveControl<>nil) and (F.ActiveControl is TControl)
                  then C:=F.ActiveControl;
         end
         else  if (F=nil) and (Sender<>nil) and( Sender is TControl)
               then C:=TControl(Sender)
               else Exit;
      if CanEdit=False
         then begin if C is TwwDBEdit then
                    begin if (FDataSet<>nil)and(FDataSet.DataSet<>nil)  then
                             begin if (FDataSet.DataSet is TwwTable)
                                   then begin Tabla:=TwwTable(FDataSet.DataSet).TableName;
                                              Llave:=TwwTable(FDataSet.DataSet).IndexFieldNames;
                                        end;
                             end
                          else Exit;
                          Campo:=TwwDBEdit(C).DataField+S;
                          DB:='';
                          Dat:=FDataSet.DataSet;
                          if Dat is TTable then DB:=TTable(DAT).DataBaseName;
                          if Dat is TwwTable then DB:=TwwTable(DAT).DataBaseName;
                          if Dat is TQuery then DB:=TQuery(DAT).DataBaseName;
                          if Dat is TwwQuery then DB:=TwwQuery(DAT).DataBaseName;
                          if Dat is TStoredProc then DB:=TStoredProc(DAT).DataBaseName;
                          if Dat is TwwStoredProc then DB:=TwwStoredProc(DAT).DataBaseName;
                          if DB='' then exit;
                          //MacvFindIt(Key,CanEdit,Dat,C,Llave,Campo,Tabla,DB);
                    end;
              end;
end;

Procedure TInterForma.SetVersion(V:Integer);
begin
end;

Procedure TInterforma.SetFormaTipo(F:TFormaTipo);
begin FFormaTipo:=F;
      ShowBtnSalir:=True;
      if F=ftMulti then
         begin ShowBtnNuevo:=True;
               ShowBtnModificar:=True;
               ShowBtnEliminar:=True;
               ShowBtnAceptar:=True;
               ShowBtnCancelar:=True;
               ShowBtnBuscar:=True;
               ShowBtnAyuda:=True;
               ShowBtnPreview:=False;
               ShowBtnImprimir:=False;
         end;
      if F=ftGrid then
         begin ShowBtnNuevo:=True;
               ShowBtnModificar:=True;
               ShowBtnEliminar:=True;
               ShowBtnAceptar:=True;
               ShowBtnCancelar:=True;
               ShowBtnBuscar:=True;
               ShowBtnAyuda:=True;
               ShowBtnPreview:=False;
               ShowBtnImprimir:=False;
         end;
      if F=ftConsulta then
         begin ShowBtnNuevo:=False;
               ShowBtnModificar:=False;
               ShowBtnEliminar:=False;
               ShowBtnAceptar:=False;
               ShowBtnCancelar:=False;
               ShowBtnBuscar:=False;
               ShowBtnAyuda:=True;
               ShowBtnPreview:=False;
               ShowBtnImprimir:=False;
               ShowBtnSalir:=True;
         end;
      if F=ftCaptura then
         begin ShowBtnNuevo:=False;
               ShowBtnModificar:=False;
               ShowBtnEliminar:=False;
               ShowBtnAceptar:=True;
               ShowBtnCancelar:=True;
               ShowBtnBuscar:=False;
               ShowBtnAyuda:=False;
               ShowBtnPreview:=False;
               ShowBtnImprimir:=False;
               ShowBtnSalir:=False;
         end;
      if F=ftModifica then
         begin ShowBtnNuevo:=False;
               ShowBtnModificar:=False;
               ShowBtnEliminar:=False;
               ShowBtnAceptar:=True;
               ShowBtnCancelar:=True;
               ShowBtnBuscar:=False;
               ShowBtnAyuda:=False;
               ShowBtnPreview:=False;
               ShowBtnImprimir:=False;
               ShowBtnSalir:=False;
         end;
      if F=ftImprimir then
         begin ShowBtnNuevo:=False;
               ShowBtnModificar:=False;
               ShowBtnEliminar:=False;
               ShowBtnAceptar:=False;
               ShowBtnCancelar:=False;
               ShowBtnBuscar:=False;
               ShowBtnAyuda:=True;
               ShowBtnPreview:=True;
               ShowBtnImprimir:=True;
               ShowBtnSalir:=True;
         end;
end;

Procedure TInterforma.SetDataSet(T:TwwDataSource);
begin FDataSet:=T;
      if TT<>Nil then TT.DataSource:=T;
end;

Function TInterForma.IsDataSet:Boolean;
begin if (DataSet=Nil)
      then IsDataSet:=False
      else IsDataSet:=True;
end;

Function TInterForma.IsInterFrame:Boolean;
begin if (InterFrame=nil)
      then IsInterFrame:=False
      else IsInterFrame:=True;
end;


Function TInterForma.IsNone:Boolean;
begin IsNone:=True;
end;



Function TInterForma.Ocultos:Integer;
begin if HideButtons then Ocultos:=64 else Ocultos:=0;
end;

Function TInterForma.CanClose(Var Can:Boolean):Boolean;
begin Can:=(Not CanEdit) and (Can);
      CanClose:=Can;
//      if FFormaTipo in [ftGrid,ftCaptura]
//         then begin CanClose:=(Not CanEdit) and (Can);
//              end;
//      CanClose:=Can;
end;


Procedure TInterForma.Cierra;
begin if F<>Nil then
         begin F.ModalResult:=mrCancel;
               F.Close;
         end;
end;

Procedure TInterForma.SetGroupBox(T:TGroupBox);
begin FGroupBox:=T;
      if T.Caption<>'' then FGroupCaption:=T.Caption;
end;


Procedure TInterforma.SetMsgAccion(S:String);
begin FMsgAccion:=S;
      if F<>Nil then F.Accion:=MsgAccion;
      if GroupBox<>Nil then
         if FMsgAccion=''
            then GroupBox.Caption:=FGroupCaption
            else GroupBox.Caption:=FGroupCaption+' ['+FMsgAccion+']';
end;


Procedure TInterForma.SetCanEdit(B:Boolean);

Function SF(B:Boolean; Valor:Boolean):Boolean;
begin if Not B then SF:=False else SF:=Valor;
end;

Procedure HaceTrue;
begin if FPanel<>Nil then begin if IsEnabled(FPanel)
                                then begin FPanel.SetFocus;
                                     end
                                else Exit;
                          end;
      if FBtnAceptar<>Nil
         then BEGIN CambiaComp(FBtnAceptar,16,FCanEdit,IsNewData,nil);
                    FBtnAceptar.Visible:=SF(FShowBtnAceptar,FBtnAceptar.Visible);
                    if IsEnabled(FBtnAceptar)
                       then begin FBtnAceptar.SetFocus; exit; end;
              END;
      if FBtnCancelar<>Nil
         then BEGIN CambiaComp(FBtnCancelar,16,FCanEdit,IsNewData,nil);
                    FBtnCancelar.Visible:=SF(FShowBtnCancelar,FBtnCancelar.Visible);
                    if IsEnabled(FBtnCancelar)
                       then begin FBtnCancelar.SetFocus; exit; end;
              END;
      if FPanel<>Nil then FPanel.SetFocus;
end;

Procedure HaceFalse;
begin if FPanel<>Nil then begin if IsEnabled(FPanel)
                                then begin FPanel.SetFocus;
                                     end
                                else Exit;
                          end;

      if FBtnModificar<>Nil
         then BEGIN CambiaComp(FBtnModificar,16,FCanEdit,IsNewData,nil);
                    FBtnModificar.Visible:=SF(FShowBtnModificar,FBtnModificar.Visible);
                    if FFun<>Nil then FBtnModificar.Enabled:=SF(FFun.Modificar,FBtnModificar.Enabled);
                    if IsEnabled(FBtnModificar)
                       then begin FBtnModificar.SetFocus; exit; end;
              END;
      if FBtnNuevo<>Nil
         then BEGIN CambiaComp(FBtnNuevo,16,FCanEdit,IsNewData,nil);
                    FBtnNuevo.Visible:=SF(FShowBtnNuevo,FBtnNuevo.Visible);
                    if FFun<>Nil then FBtnNuevo.Enabled:=SF(FFun.Nuevo,FBtnNuevo.Enabled);
                    if IsEnabled(FBtnNuevo)
                       then begin FBtnNuevo.SetFocus; exit; end;
              END;
      if FBtnEliminar<>Nil
         then BEGIN CambiaComp(FBtnEliminar,16,FCanEdit,IsNewData,nil);
                    FBtnEliminar.Visible:=SF(FShowBtnEliminar,FBtnEliminar.Visible);
                    if FFun<>Nil then FBtnEliminar.Enabled:=SF(FFun.Eliminar,FBtnEliminar.Enabled);
                    if IsEnabled(FBtnEliminar)
                       then begin FBtnEliminar.SetFocus; exit; end;
              END;

     if FPanel<>Nil then begin if (FPanel.Enabled) and (FPanel.Visible)
                                 then FPanel.SetFocus;
                         end;
end;



begin FCanEdit:=B;
      if B=False then MsgAccion:='';
      Case FCanEdit of
      True :HaceTrue;
      False:HaceFalse;
      end;
      ShowMsgPanel('');

      if F<>Nil then F.CanEdit:=B;

      if FPanel<>Nil then
         begin Cambia(Forma,FPanel,16,FCanEdit,IsNewData,nil); //gApli);
         end;
     if F<>Nil then
        begin //F.gApli.Enabled:=Not B;
              if (F.Visible) and (Not FCanEdit) and (F.gApli.Visible)
                then begin if (IsMain) and IsEnabled(F.gApli) then F.gApli.SetFocus;
                     end
        end
     else begin //if Grid<>Nil then Grid.Enabled:=Not B;
                if Grid<>nil then CambiaComp(Grid,16,FCanEdit,IsNewData,nil);
                if (Grid<>Nil) and (Forma.Visible) and (Not FCanEdit) and (Grid.Visible)
                then begin if (IsMain) and (IsEnabled(Grid)) then Grid.SetFocus;
                     end
          end;
     if FBtnNuevo<>Nil
        then BEGIN CambiaComp(FBtnNuevo,16,FCanEdit,IsNewData,nil);
                   FBtnNuevo.Visible:=SF(FShowBtnNuevo,FBtnNuevo.Visible);
                   if FFun<>Nil then FBtnNuevo.Enabled:=SF(FFun.Nuevo,FBtnNuevo.Enabled);
             END;
     if FBtnModificar<>Nil
        then BEGIN CambiaComp(FBtnModificar,16,FCanEdit,IsNewData,nil);
                   FBtnModificar.Visible:=SF(FShowBtnModificar,FBtnModificar.Visible);
                   if FFun<>Nil then FBtnModificar.Enabled:=SF(FFun.Modificar,FBtnModificar.Enabled);
             END;
     if FBtnEliminar<>Nil
        then BEGIN CambiaComp(FBtnEliminar,16,FCanEdit,IsNewData,nil);
                   FBtnEliminar.Visible:=SF(FShowBtnEliminar,FBtnEliminar.Visible);
                   if FFun<>Nil then FBtnEliminar.Enabled:=SF(FFun.Eliminar,FBtnEliminar.Enabled);
             END;
     if FBtnAceptar<>Nil
        then BEGIN CambiaComp(FBtnAceptar,16,FCanEdit,IsNewData,nil);
                   FBtnAceptar.Visible:=SF(FShowBtnAceptar,FBtnAceptar.Visible);
             END;
     if FBtnCancelar<>Nil
        then BEGIN CambiaComp(FBtnCancelar,16,FCanEdit,IsNewData,nil);
                   FBtnCancelar.Visible:=SF(FShowBtnCancelar,FBtnCancelar.Visible);
             END;
     if FBtnImprimir<>Nil
        then BEGIN CambiaComp(FBtnImprimir,16,FCanEdit,IsNewData,nil);
                   FBtnImprimir.Visible:=SF(FShowBtnImprimir,FBtnImprimir.Visible);
             END;
     if FBtnPreview<>Nil
        then BEGIN CambiaComp(FBtnPreview,16,FCanEdit,IsNewData,nil);
                   FBtnPreview.Visible:=SF(FShowBtnPreview,FBtnPreview.Visible);
             END;
     if FBtnBuscar<>Nil
        then BEGIN CambiaComp(FBtnBuscar,16,FCanEdit,IsNewData,nil);
                   FBtnBuscar.Visible:=SF(FShowBtnBuscar,FBtnBuscar.Visible);
             END;
     if FBtnSalir<>Nil
        then BEGIN CambiaComp(FBtnSalir,16,FCanEdit,IsNewData,nil);
                   FBtnSalir.Visible:=SF(FShowBtnSalir,FBtnSalir.Visible);
             END;
     DoCanEdit(FCanEdit);
end;

Procedure TInterForma.SetIsNewData(B:Boolean);
begin if F<>Nil then F.IsNewData:=B;
      FIsNewData:=B;
end;

Function TInterForma.GetCanEdit:Boolean;
begin GetCanEdit:=FCanEdit;
      //if F<>Nil then GetCanEdit:=F.CanEdit else GetCanEdit:=False;
end;

Function TInterForma.GetIsNewData:Boolean;
begin GetIsNewData:=FIsNewData;
end;

Function TInterForma.DameGridDataSet:TwwDataSource;
begin if FGridDataSet=nil
      then DameGridDataSet:=FDataSet
      else DameGridDataSet:=FGridDataSet;
end;

constructor TInterForma.Create( AOwner : TComponent );
begin
  inherited Create( AOwner );
  if Owner is TForm then begin Forma:=TForm(AOwner); end;
  TT:=TwwLocateDialog.Create(Self);
  IsMain:=True;
  ShowGrid:=True;
  ShowNavigator:=False;
  FHideButtons:=False;
  FVersion:=20;
  FDataSet:=nil;
  FInterFrame:=nil;
  msgSinRegistros:=KmsgSinRegistros;
  msgModificarRegistro:=kmsgModificarRegistro;
  msgEliminarRegistro:=kmsgEliminarRegistro;
  msgCrearRegistro:=kmsgCrearRegistro;
  msgAceptarRegistro:=kmsgAceptarRegistro;
  msgCancelarRegistro:=kmsgCancelarRegistro;
  msgPreguntaEliminar:=kmsgPreguntaEliminar;
  FBtnNuevo:=Nil;     FShowBtnNuevo:=True;
  FBtnModificar:=Nil; FShowBtnModificar:=True;
  FBtnEliminar:=Nil;  FShowBtnEliminar:=True;
  FBtnAceptar:=Nil;   FShowBtnAceptar:=True;
  FBtnCancelar:=Nil;  FShowBtnCancelar:=True;
  FBtnBuscar:=Nil;    FShowBtnBuscar:=True;
  FBtnImprimir:=Nil;  FShowBtnImprimir:=False;
  FBtnPreview:=Nil;   FShowBtnPreview:=False;

  FBtnAyuda:=Nil;     FShowBtnAyuda:=True;
  FBtnSalir:=Nil;     FShowBtnSalir:=True;
  FFun:=Nil;
  CanCloseForm:=True;
  F:=Nil;
  FCentrarForma:=True;
  FIsCancel:=False;
  FValidExitOK:=True;
  ShowErrorMessage:=False; //False;
  LocalFin:=nil;
  LocalNivel:=0;
  ValidaExitConsulta:=False;
end;


destructor TInterForma.Destroy;
begin
  TT.Free;
  inherited Destroy;
end;


Procedure  TInterforma.InitShow;
begin // Inicialización Modo Interno.
      CanEdit:=CanEdit;
end;

Procedure TInterForma.ShowModal;
begin if FFun<>Nil then
         begin if FFun.TieneAcceso then ExecutafoInterForma(Forma,FDataSet,GridDataSet,Self,True)
         end
      else  ExecutafoInterForma(Forma,FDataSet,GridDataSet,Self,True);
end;

Procedure TInterForma.Show;
begin if F<>Nil
      then begin if FFun<>Nil
                 then begin if FFun.TieneAcceso then F.Show;
                      end
                 else F.show;
           end
      else begin if FFun<>Nil then
                    begin if FFun.TieneAcceso then ExecutafoInterForma(Forma,FDataSet,GridDataSet,Self,False);
                    end
                 else ExecutafoInterForma(Forma,FDataSet,GridDataSet,Self,False);
           end;
      //F:=Nil;
end;
//---------------------------------------------------Accion --------------

Procedure TInterForma.Accion(Accion:TAccion);
begin if Assigned(FOnAccion) then FOnAccion(Self,Accion);
end;


Procedure TInterForma.DoCanEdit(CanEdit:Boolean);
begin if Assigned(FOnCanEdit) then FOnCanEdit(Self,CanEdit);
end;


//------------------------------------------------NUEVO------------------------

procedure TInterforma.PreparaNuevo;
begin if F<>Nil then
      begin if IsEnabled(F.btNuevo) then F.btNuevo.SetFocus;
      end;
      IsNewData:=True;
      MsgAccion:='Nuevo';
end;

procedure TInterforma.TerminaNuevo(Realizado:Boolean);
begin if Realizado
         then CanEdit:=True
         else begin CanEdit:=False; IsNewData:=False; end;
end;


Procedure TInterForma.BtnNuevoClick (Sender : TObject);
begin if Assigned(FOnBtnNuevoClick)
      then FOnBtnNuevoClick(Sender)
      else Nuevo;
end;

Procedure TInterForma.SetBtnNuevo(B:TBitBtn);
begin FBtnNuevo:=B;
      if B=Nil then exit;
      if Not Assigned(B.OnClick) then B.OnClick:=BtnNuevoClick;
      if Not Assigned(B.OnExit) then B.OnExit:=EventoBtnExit;
      B.Caption:='&Nuevo';
      B.Tag:=17+Ocultos;
      CargaImg(B,tsbAlta);
      CambiaComp(B,16,FCanEdit,IsNewData,nil);
end;

Procedure TInterForma.SetShowBtnNuevo(B:Boolean);
begin if FBtnNuevo<>Nil  then FBtnNuevo.Visible:=B;
      FShowBtnNuevo:=B;
end;


Function TInterForma.Nuevo:Boolean;
Var Realizado:Boolean;
    OK       :Boolean;
begin Nuevo:=False;
      FShowError:=True;
      Try
      if (FFun<>Nil)and(Not FFun.ValidaFrame)
      then begin if (Not FFun.ChecaAcceso(False))and(FFun.Nuevo)
                 then Raise EInterForma.Create('No Tiene Derechos para Crear un nuevo Registro.'+FFun.GetMsgError);
           end;
      Realizado:=True;
      Try
      PreparaNuevo;
      Try     Realizado:=False; OK:=True;
              AntesNuevo(OK);
              if OK then begin Realizado:=True; HaceNuevo(Realizado); end;
      Finally
              TerminaNuevo(Realizado);
              Accion(acNuevo);
      end;
      Finally
      Nuevo:=Realizado;
      if Realizado then begin Nuevo:=True;
                              DespuesNuevo
                        end
                   else ErrorNuevo;
      end;
      Finally
      end;
end;

Procedure TInterforma.AntesNuevo(Var Realizado:Boolean);
begin if Assigned(FOnAntesNuevo) then FOnAntesNuevo(self,Realizado);
end;

Procedure TInterforma.FHaceNuevo(Var Realizado:Boolean);
begin Realizado:=False;
      if IsDataSet then FDataSet.DataSet.Append
      else if IsInterFrame then InterFrame.Append
      else if IsNone then begin{No hace Nada} end
      else Exit;
      Realizado:=True;
end;

Procedure TInterForma.HaceNuevo(Var Realizado:Boolean);
begin if Assigned(FOnNuevo)
         then FOnNuevo(self,Realizado)
         else begin FHaceNuevo(Realizado);
              end;
end;

Procedure TInterForma.DespuesNuevo;
begin if Assigned(FOnDespuesNuevo) then FOnDespuesNuevo(self);
end;

Procedure TInterForma.ErrorNuevo;
begin if Assigned(FOnErrorNuevo) then FOnErrorNuevo(self);
      if FormaTipo=ftCaptura
         then begin PostMessage(F.Handle,WM_CLOSE,0,0);
                    F.ModalResult:=mrCancel;
              end
         else if FShowError then InterMsg(tmMal,'',0,msgCrearRegistro);

end;
//------------------------------------------------MODIFICAR--------------------


Function TInterForma.Modificar:Boolean;
Var Realizado:Boolean;
    OK       :Boolean;
begin Modificar:=False;
      FShowError:=True;
      Try
      if (FFun<>Nil)and(Not FFun.ValidaFrame)
      then begin if (Not FFun.ChecaAcceso(False))and(FFun.Nuevo)
                 then Raise EInterForma.Create('No Tiene Derechos para Modificar el Registro Actual.'+FFun.GetMsgError);
           end;
      Realizado:=True;
      Try
      PreparaModificar;
      Try     Realizado:=False; OK:=True;
              AntesModificar(OK);
              if OK then begin Realizado:=True; HaceModificar(Realizado); end;
      Finally
              TerminaModificar(Realizado);
              Accion(acNuevo);
      end;
      Finally
      Modificar:=Realizado;
      if Realizado then begin Modificar:=True;
                              DespuesModificar;
                        end
                   else ErrorModificar;
      end;
      Finally
      end;
end;

Procedure TInterforma.AntesModificar(Var Realizado:Boolean);
begin if Assigned(FOnAntesModificar) then FOnAntesModificar(self,Realizado);
end;

Procedure TInterforma.FHaceModificar(Var Realizado:Boolean);
begin Realizado:=False;
      if IsDataSet then
         begin if (FDataSet.dataset.BOF)and(FDataSet.dataset.EOF) then
               begin Raise EInterForma.Create(msgSinRegistros); //MessageDlg(msgSinRegistros,mtError,[mbOK],0);
                     Exit;
               end;
               FDataSet.dataset.Edit;
          end
      else if IsInterFrame then
         begin if (FInterFrame.Active=False) then
               begin Raise EInterForma.Create(msgSinRegistros); //MessageDlg(msgSinRegistros,mtError,[mbOK],0);
                     Exit;
               end;
               FInterFrame.Edit;
          end
      else if IsNone then
         begin //NADA...
          end
      else Exit;
      Realizado:=True;
end;

procedure TInterforma.TerminaModificar(Realizado:Boolean);
begin if Realizado
      then CanEdit:=True
      else begin CanEdit:=False; IsNewData:=False; end;
end;


procedure TInterforma.PreparaModificar;
begin if F<>Nil then
      begin if IsEnabled(F.btModificar) then F.btModificar.SetFocus;
      end;
      IsNewData:=False;
      MsgAccion:='Modificar';
end;


Procedure TInterForma.BtnModificarClick (Sender : TObject);
begin if Assigned(FOnBtnModificarClick)
      then FOnBtnModificarClick(Sender)
      else Modificar;
end;

Procedure TInterForma.SetBtnModificar(B:TBitBtn);
begin FBtnModificar:=B;
      if B=Nil then exit;
      if Not Assigned(B.OnClick) then B.OnClick:=BtnModificarClick;
      if Not Assigned(B.OnExit) then B.OnExit:=EventoBtnExit;
      B.Caption:='&Modificar';
      if FIsMain then B.Tag:=21+Ocultos else B.Tag:=17+Ocultos;
      CargaImg(B,tsbModifica);
      CambiaComp(B,16,FCanEdit,IsNewData,nil);
end;

Procedure TInterForma.SetShowBtnModificar(B:Boolean);
begin if FBtnModificar<>Nil  then FBtnModificar.Visible:=B;
      FShowBtnModificar:=B;
end;

(*
function TInterForma.Modificar:Boolean;
Var Realizado:Boolean;
    ExError:Boolean;
begin Modificar:=False;
      Realizado:=True;
      FShowError:=True;
      ExError:=True;
      Try
      if (FFun<>Nil)and(Not FFun.ValidaFrame)
      then begin if (Not FFun.ChecaAcceso(False))and(FFun.Modificar)
                 then Raise EInterForma.Create('No Tiene Derechos para Modificar el Registro.'+FFun.GetMsgError);
           end;
      Try
              PreparaModificar;
      Try     HaceModificar(Realizado);
      Finally
              TerminaModificar(Realizado);
              Accion(acModificar);
      end;
      ExError:=False;
      Finally
      if ExError then ShowError:=False;
      if Realizado then begin Modificar:=True;
                              DespuesModificar
                        end
                   else ErrorModificar;
      end;
      Finally
      end;
end;
*)


Procedure TInterForma.HaceModificar(Var Realizado:Boolean);
begin if Assigned(FOnModificar)
         then FOnModificar(self,Realizado)
         else begin FHaceModificar(Realizado);
              end;
end;

Procedure TInterForma.DespuesModificar;
begin if Assigned(FOnDespuesModificar)
         then FOnDespuesModificar(self);
end;

Procedure TInterForma.ErrorModificar;
begin if Assigned(FOnErrorModificar) then FOnErrorModificar(self);
      if FormaTipo=ftModifica
         then begin PostMessage(F.Handle,WM_CLOSE,0,0);
                    F.ModalResult:=mrCancel;
              end
         else if FShowError then InterMsg(tmMal,'',0,msgModificarRegistro);
         //else if FShowError then InterMsg(tmMal,'',0,msgModificarRegistro);
           //MessageDlg(msgModificarRegistro,mtError,[mbOK],0);
end;

//------------------------------------------------ELIMINAR---------------------

Procedure TInterforma.FHaceEliminar(Var Realizado:Boolean);
begin Realizado:=False;
      if IsDataSet then
         begin if (FDataSet.dataset.BOF)and(FDataSet.dataset.EOF) then
               begin Raise EInterForma.Create(msgSinRegistros);
                     Exit;
               end;
               if InterMsg(tmPregunta,'',0,KmsgPreguntaEliminar)=mrYes
                  //MessageDlg(KmsgPreguntaEliminar,mtInformation,[mbYes,mbNo],0)=mrYes
                  then FDataSet.dataset.Delete;
         end
      else if IsInterFrame then
         begin if (Not FInterFrame.Active) then
               begin Raise EInterForma.Create(msgSinRegistros); 
                     Exit;
               end;
               FInterFrame.Delete;
         end
      else if IsNone then
         begin
         end
      else Exit;
      Realizado:=True;
end;

procedure TInterforma.TerminaEliminar(Realizado:Boolean);
begin if Realizado
      then begin CanEdit:=False; IsNewData:=False; end
      else begin CanEdit:=False; IsNewData:=False; end;
end;


procedure TInterforma.PreparaEliminar;
begin if F<>Nil then
      begin if IsEnabled(F.btEliminar) then F.btEliminar.SetFocus;
      end;
      IsNewData:=False;
      MsgAccion:='Eliminar';
end;


Procedure TInterForma.BtnEliminarClick (Sender : TObject);
begin if Assigned(FOnBtnEliminarClick)
      then FOnBtnEliminarClick(Sender)
      else Eliminar;
end;

Procedure TInterForma.SetBtnEliminar(B:TBitBtn);
begin FBtnEliminar:=B;
      if B=Nil then exit;
      if Not Assigned(B.OnClick) then B.OnClick:=BtnEliminarClick;
      if Not Assigned(B.OnExit) then B.OnExit:=EventoBtnExit;
      B.Caption:='&Eliminar';
      B.Tag:=17+Ocultos;
      CargaImg(B,tsbBorra);
      CambiaComp(B,16,FCanEdit,IsNewData,nil);
end;

Procedure TInterForma.SetShowBtnEliminar(B:Boolean);
begin if FBtnEliminar<>Nil  then FBtnEliminar.Visible:=B;
      FShowBtnEliminar:=B;
end;


Procedure TInterforma.AntesEliminar(Var Realizado:Boolean);
begin if Assigned(FOnAntesEliminar) then FOnAntesEliminar(self,Realizado);
end;


procedure TInterForma.Eliminar;
Var OK,Realizado,ExError:Boolean;

begin Try
      if (FFun<>Nil)and(Not FFun.ValidaFrame)
      then begin if (Not FFun.ChecaAcceso(False))and(FFun.Eliminar)
                 then Raise EInterForma.Create('No Tiene Derechos para Eliminar el Registro.'+FFun.GetMsgError);
           end;
      Realizado:=True;
      FShowError:=True;
      ExError:=True;
      Try
      PreparaEliminar;
      Try     Realizado:=False; OK:=True;
              AntesEliminar(OK);
              if OK then begin Realizado:=True; HaceEliminar(Realizado); end;
      Finally
              TerminaEliminar(Realizado);
              Accion(acEliminar);
      end;
      ExError:=False;
      Finally
      if ExError then FShowError:=False;
      if Realizado then DespuesEliminar
                   else ErrorEliminar;
      end;
      Finally
      end;
end;


Procedure TInterForma.HaceEliminar(Var Realizado:Boolean);
begin if Assigned(FOnEliminar)
         then FOnEliminar(self,Realizado)
         else begin FHaceEliminar(Realizado);
              end;
end;

Procedure TInterForma.DespuesEliminar;
begin if Assigned(FOnDespuesEliminar) then FOnDespuesEliminar(self);
end;

Procedure TInterForma.ErrorEliminar;
begin if Assigned(FOnErrorEliminar)
         then FOnErrorEliminar(self)
         else if FShowError then InterMsg(tmMal,'',0,msgEliminarRegistro);
               //MessageDlg(msgEliminarRegistro,mtError,[mbOK],0);
end;


//------------------------------------------------CANCELAR---------------------
Procedure TInterforma.FHaceCancelar(Var Realizado:Boolean);
begin Realizado:=False;
      if IsDataSet then FDataSet.dataset.Cancel
      else if IsInterFrame then FInterFrame.Cancel
      else if IsNone then begin {nada} end
      else Exit;
      Realizado:=True;
end;

procedure TInterforma.TerminaCancelar(Realizado:Boolean);
begin if Realizado
      then begin CanEdit:=False; IsNewData:=False;
                 if FormaTipo=ftModifica then
                    begin if F<>Nil then begin F.ModalResult:=mrCancel; F.Close; exit; end;
                    end;
                 if FormaTipo=ftCaptura then
                    begin if F<>Nil then begin F.ModalResult:=mrCancel; F.Close; exit; end;
                    end;
           end
      else begin CanEdit:=False; IsNewData:=False;
                 if FormaTipo=ftModifica then
                    begin if F<>Nil then begin F.ModalResult:=mrCancel; F.Close; exit; end;
                    end;
                 if FormaTipo=ftCaptura then
                    begin if F<>Nil then begin F.ModalResult:=mrCancel; F.Close; exit; end;
                    end;
           end;
end;


procedure TInterforma.PreparaCancelar;
begin if F<>Nil then
      begin if IsEnabled(F.btCancelar) then F.btCancelar.SetFocus;
      end;
end;


Procedure TInterForma.BtnCancelarClick (Sender : TObject);
begin if Assigned(FOnBtnCancelarClick)
      then FOnBtnCancelarClick(Sender)
      else Cancelar;
end;

Procedure TInterForma.SetBtnCancelar(B:TBitBtn);
begin FBtnCancelar:=B;
      if B=Nil then exit;
      if Not Assigned(B.OnClick) then B.OnClick:=BtnCancelarClick;
      if Not Assigned(B.OnExit) then B.OnExit:=EventoBtnExit;
      B.Caption:='&Cancelar';
      B.Tag:=26+Ocultos;
      CargaImg(B,tsbCancela);
      CambiaComp(B,16,FCanEdit,IsNewData,nil);
end;

Procedure TInterForma.SetShowBtnCancelar(B:Boolean);
begin if FBtnCancelar<>Nil  then FBtnCancelar.Visible:=B;
      FShowBtnCancelar:=B;
end;

procedure TInterForma.Cancelar;
Var Realizado:Boolean;
begin FIsCancel:=True;
      Try
      Realizado:=True;
      FShowError:=True;
      Try
      PreparaCancelar;
      Try     HaceCancelar(Realizado);
      Finally
              TerminaCancelar(Realizado);
              Accion(acCancelar);
      end;
      Finally
      if Realizado then DespuesCancelar
                   else ErrorCancelar;
      end;
      Finally FIsCancel:=False;
      end;
end;

Procedure TInterForma.HaceCancelar(Var Realizado:Boolean);
begin if Assigned(FOnCancelar)
         then FOnCancelar(self,Realizado)
         else begin FHaceCancelar(Realizado);
              end;
end;

Procedure TInterForma.DespuesCancelar;
begin if Assigned(FOnDespuesCancelar) then FOnDespuesCancelar(self);
end;

Procedure TInterForma.ErrorCancelar;
begin if Assigned(FOnErrorCancelar) then FOnErrorCancelar(self)
         else if FShowError then InterMsg(tmMal,'',0,msgCancelarRegistro);
              //MessageDlg(msgCancelarRegistro,mtError,[mbOK],0);
end;

//------------------------------------------------ACEPTAR---------------------

Procedure TInterforma.FHaceAceptar(Var Realizado:Boolean);
begin Realizado:=False;
      if IsDataSet then FDataSet.dataset.Post
      else if IsInterFrame then FInterFrame.Post
      else if IsNone then begin {exit} end
      else Exit;
      Realizado:=True;
end;

procedure TInterforma.TerminaAceptar(Realizado:Boolean);
begin if Realizado
      then begin CanEdit:=False;
                 if FormaTipo=ftCaptura then
                    begin if F<>Nil then
                          begin F.ModalResult:=mrOK; F.Close; exit;
                          end;
                    end;
                 if FormaTipo=ftModifica then
                    begin if F<>Nil then
                          begin F.ModalResult:=mrOK; F.Close; exit;
                          end;
                    end;
           end;
end;


procedure TInterforma.PreparaAceptar;
begin if F<>Nil then
      begin if IsEnabled(F.btAceptar)  then F.btAceptar.SetFocus;
      end;
end;


Procedure TInterForma.BtnAceptarClick (Sender : TObject);
begin if Assigned(FOnBtnAceptarClick)
      then FOnBtnAceptarClick(Sender)
      else Aceptar;
end;

Procedure TInterForma.SetBtnAceptar(B:TBitBtn);
begin FBtnAceptar:=B;
      if B=Nil then exit;
      if Not Assigned(B.OnClick) then B.OnClick:=BtnAceptarClick;
      if Not Assigned(B.OnExit) then B.OnExit:=EventoBtnExit;
      B.Caption:='&Aceptar';
      B.Tag:=22+Ocultos;
      CargaImg(B,tsbAcepta);
      CambiaComp(B,16,FCanEdit,IsNewData,nil);
end;

Procedure TInterForma.SetShowBtnAceptar(B:Boolean);
begin if FBtnAceptar<>Nil  then FBtnAceptar.Visible:=B;
      FShowBtnAceptar:=B;
end;


procedure TInterForma.Aceptar;
Var Realizado:Boolean;
    OK:Boolean;
    ExError:Boolean;
begin Try
      if (FFun<>Nil)and(Not FFun.ValidaFrame)
      then begin if (Not FFun.ChecaAcceso(False)) and ( ((FFun.Nuevo)and(IsNewData)) or ((FFun.Modificar)and(Not IsNewData)) )
                 then Raise EInterForma.Create('No Tiene Derechos para Realizar esta Operación. Cancele.'+FFun.GetMsgError);
           end;
      Realizado:=True;
      FShowError:=True;
      ExError:=True;
      Try
      PreparaAceptar;

      if FValidExitOK=False then Exit;

      Try     Realizado:=False; OK:=True;
              AntesAceptar(IsNewData,OK);
              if OK then begin Realizado:=True; HaceAceptar(Realizado); end;
      Finally
              TerminaAceptar(Realizado);
              Accion(acAceptar);
      end;
      ExError:=False;
      Finally
      if FValidExitOK<>False
      then begin if ExError then ShowError:=False;
                 if Realizado then DespuesAceptar
                     else ErrorAceptar;
            end;
      end;
      Finally;
      end;
end;


Procedure TInterForma.HaceAceptar(Var Realizado:Boolean);
begin if Assigned(FOnAceptar)
         then FOnAceptar(self,Realizado)
         else begin FHaceAceptar(Realizado);
              end;
end;

Procedure TInterForma.DespuesAceptar;
begin if Assigned(FOnDespuesAceptar) then FOnDespuesAceptar(self);
end;

Procedure TInterForma.ErrorAceptar;
begin if Assigned(FOnErrorAceptar)
      then FOnErrorAceptar(self)
      else if FShowError then InterMsg(tmMal,'',0,msgAceptarRegistro);
            //MessageDlg(msgAceptarRegistro,mtError,[mbOK],0);
end;

Procedure TInterForma.AntesAceptar(IsNewData:Boolean; Var Realizado:Boolean);
begin if Assigned(FOnAntesAceptar) then FOnAntesAceptar(Self,IsNewData, Realizado);
end;


//------------------------------------------------AYUDA---------------------

Procedure TInterForma.FAyuda;
begin if IsInterFrame then FInterFrame.Help
      else if IsNone then begin {exit} end;
end;

Procedure TInterForma.Ayuda;
begin if Assigned(FOnAyuda) then FOnAyuda(self) else FAyuda;
end;

Procedure TInterForma.BtnAyudaClick (Sender : TObject);
begin if Assigned(FOnBtnAyudaClick)
      then FOnBtnAyudaClick(Sender)
      else Ayuda;
end;

Procedure TInterForma.SetBtnAyuda(B:TBitBtn);
begin FBtnAyuda:=B;
      if B=Nil then exit;
      if Not Assigned(B.OnClick) then B.OnClick:=BtnAyudaClick;
      if Not Assigned(B.OnExit) then B.OnExit:=EventoBtnExit;
      B.Caption:='&Ayuda';
      B.Tag:=0;
      CargaImg(B,tsbAyuda);
      CambiaComp(B,16,FCanEdit,IsNewData,nil);
end;

Procedure TInterForma.SetShowBtnAyuda(B:Boolean);
begin if FBtnAyuda<>Nil  then FBtnAyuda.Visible:=B;
      FShowBtnAyuda:=B;
end;


//------------------------------------------------IMPRIMIr---------------------


Procedure TInterForma.Imprimir;
begin if Assigned(FOnImprimir) then FOnImprimir(self);
end;

Procedure TInterForma.BtnImprimirClick (Sender : TObject);
begin if Assigned(FOnBtnImprimirClick)
      then FOnBtnImprimirClick(Sender)
      else Imprimir;
end;

Procedure TInterForma.SetBtnImprimir(B:TBitBtn);
begin FBtnImprimir:=B;
      if B=Nil then exit;
      if Not Assigned(B.OnClick) then B.OnClick:=BtnImprimirClick;
      if Not Assigned(B.OnExit) then B.OnExit:=EventoBtnExit;
      B.Caption:='&Imprimir';
      B.Tag:=17;
      CargaImg(B,tsbImprime);
      CambiaComp(B,16,FCanEdit,IsNewData,nil);
end;

Procedure TInterForma.SetShowBtnImprimir(B:Boolean);
begin if FBtnImprimir<>Nil  then FBtnImprimir.Visible:=B;
      FShowBtnImprimir:=B;
end;



//------------------------------------------------Imprimir---------------------



Procedure TInterForma.Preview;
begin if Assigned(FOnPreview) then FOnPreview(self);
end;

Procedure TInterForma.BtnPreviewClick (Sender : TObject);
begin if Assigned(FOnBtnPreviewClick)
      then FOnBtnPreviewClick(Sender)
      else Preview;
end;

Procedure TInterForma.SetBtnPreview(B:TBitBtn);
begin FBtnPreview:=B;
      if B=Nil then exit;
      if Not Assigned(B.OnClick) then B.OnClick:=BtnPreviewClick;
      if Not Assigned(B.OnExit) then B.OnExit:=EventoBtnExit;
      B.Caption:='&Ver...';
      B.Tag:=21;
      CargaImg(B,tsbPreview);
      CambiaComp(B,16,FCanEdit,IsNewData,nil);
end;

Procedure TInterForma.SetShowBtnPreview(B:Boolean);
begin if FBtnPreview<>Nil  then FBtnPreview.Visible:=B;
      FShowBtnPreview:=B;
end;




//------------------------------------------------BUSCAR---------------------
Procedure TInterForma.FBuscar;
begin if IsDataSet then
      begin if (F<>Nil)and(F.gApli<>Nil) then
            begin TT.SearchField:=DameCampoGrid(F.gApli);
                  TT.Execute;
            end
            else if Grid<>Nil then
                 begin TT.SearchField:=DameCampoGrid(Grid);
                       TT.Execute;
                 end
            else begin TT.Execute;
                 end;
      end
      else if IsInterFrame then
           begin FInterFrame.Busca;
           end
      else if IsNone then
           begin
           end;
end;


Procedure TInterForma.Buscar;
begin if Assigned(FOnBuscar) then FOnBuscar(self) else FBuscar;
end;

Procedure TInterForma.BtnBuscarClick (Sender : TObject);
begin if Assigned(FOnBtnBuscarClick)
      then FOnBtnBuscarClick(Sender)
      else Buscar;
end;

Procedure TInterForma.SetBtnBuscar(B:TBitBtn);
begin FBtnBuscar:=B;
      if B=Nil then exit;
      if Not Assigned(B.OnClick) then B.OnClick:=BtnBuscarClick;
      if Not Assigned(B.OnExit) then B.OnExit:=EventoBtnExit;
      B.Caption:='&Buscar';
      B.Tag:=17;
      CargaImg(B,tsbBuscaAprox);
      CambiaComp(B,16,FCanEdit,IsNewData,nil);
end;

Procedure TInterForma.SetShowBtnBuscar(B:Boolean);
begin if FBtnBuscar<>Nil  then FBtnBuscar.Visible:=B;
      FShowBtnBuscar:=B;
end;



//------------------------------------------------BUSCAR---------------------
Procedure TInterForma.FSalir                                                 ;
begin if F<>Nil then
      begin F.ModalResult:=mrCancel; //Cierra la Ventana.
            F.Close;
      end
      ELSE if Forma Is TForm then
           begin Forma.ModalResult:=mrCancel;
                 Forma.Close;
           end;
end;


Procedure TInterForma.Salir;
begin if Assigned(FOnSalir) then FOnSalir(self) else FSalir;
end;

Procedure TInterForma.BtnSalirClick (Sender : TObject);
begin if Assigned(FOnBtnSalirClick)
      then FOnBtnSalirClick(Sender)
      else Salir;
end;

Procedure TInterForma.SetBtnSalir(B:TBitBtn);
begin FBtnSalir:=B;
      if B=Nil then exit;
      if Not Assigned(B.OnClick) then B.OnClick:=BtnSalirClick;
      if Not Assigned(B.OnExit) then B.OnExit:=EventoBtnExit;
      B.Caption:='&Salir';
      B.Tag:=25;
      CargaImg(B,tsbSalir);
      CambiaComp(B,16,FCanEdit,IsNewData,nil);
end;

Procedure TInterForma.SetShowBtnSalir(B:Boolean);
begin if FBtnSalir<>Nil  then FBtnSalir.Visible:=B;
      FShowBtnSalir:=B;
end;







end.
