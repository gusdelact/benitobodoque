unit IntSFor;
//-------------------------------------------------------------
// Sistema         :   InterForma
// Date            :   Julio de 1997
// Fecha de Inicio :   Julio de 1997
// Función forma   :   Forma Creada Internamente
// Desarrollo por  :   Víctor Martínez Castro
// Comentarios     :   Forma Estandar
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------
interface

uses windows, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, DBCtrls,
  ExtCtrls, Classes, Controls,Messages, Forms, wwdatsrc, UnSubGen;


Const WM_DespuesShow=WM_USER+1;
      WM_DESPUES_DESPUES_SHOW=WM_USER+2;
      WM_MSVALIDA=WM_USER+3;

Type TEstado=(esGrid,esCaptura,esConsulta,esMulti,esModifica,esImprimir);

type
  TfoInterforma = class(TForm)
    gbApli: TGroupBox;
    btNuevo: TBitBtn;
    btModificar: TBitBtn;
    btEliminar: TBitBtn;
    btAceptar: TBitBtn;
    btCancelar: TBitBtn;
    btCerrar: TBitBtn;
    btAyuda: TBitBtn;
    dbNav: TDBNavigator;
    btBuscar: TBitBtn;
    Panel1: TPanel;
    gApli: TwwDBGrid;
    btImprimir: TBitBtn;
    btPreview: TBitBtn;
    pMensaje: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    FCanEdit:Boolean;
    RefForm:TForm;
    RefOrigen:twwDataSource;
    GridRefOrigen:twwDataSource;
    AntesLeft,AntesTop:LongInt;
    Procedure SetEdit(Modo:Boolean);
    Procedure DespuesShow(Var Message:TMessage); message WM_DespuesShow;
    Procedure DespuesDespuesShow(Var Message:TMessage); message WM_Despues_DESPUES_Show;
  public
    //TT:TwwLocateDialog;
    Accion  :String;
    Resultado:LongInt;
    SelMode:Boolean;
    gTextCap:String;
    Padre:TComponent;
    InitEdit:Boolean;
    Estado:TEstado;
    IsNewData:Boolean;

    Procedure Buscar;
    Procedure Ayuda;

    property CanEdit:Boolean Read FCanEdit Write SetEdit Default False;

    Procedure CMDialogKey(Var Msg:TCMDialogKey); MESSAGE cm_dialogkey;
    Procedure MsValida(Var Message:TMessage); Message WM_MSVALIDA;

  end;



Procedure ExecutafoInterForma(FormReference:TForm; dsOrigen:twwDataSource;
                              dsGridOrigen:twwDataSource; Comp:TComponent;
                              Modal:Boolean);

implementation

uses InterFor;

{$R *.DFM}

Procedure ExecutafoInterForma(FormReference:TForm; dsOrigen:twwDataSource;
                               dsGridOrigen:twwDataSource; Comp:TComponent;
                               Modal:Boolean);
Const D8:Integer=4;
Var HLX, HLY, HRX, HRY :Integer;
    VLX, VLY, VRX, VRY :Integer;


    AuxTop, AuxLeft, lTop,lLeft:Integer;
    Caso:TFormaTipo;
    Estilo:TFormaEstilo;
    ResAlto:Integer;
    foInterForma:TfoInterforma;
    CapDist:Integer;
    FormHeight:Integer;
    PanAlto:Integer;
    HPos:Boolean;
    ExX,ExY, FxX, FxY, BxX, BxY:Integer;
    AuxEstilo:TFormaEstilo;
    FontY:Integer;

Procedure AddObj(Obj:TWinControl; Show:Boolean; JustLeft:Boolean; Posiciona:Boolean; TipoVH:Boolean);
Const cWX=80;
      cWY=25;

var VAdX1,VAdX2,VAdY1,VAdY2, VmX, VMy,
    HAdX1,HAdX2,HAdY1,HAdY2, HmX, HMy,
    FX, FY:Integer;
begin VAdX1:=D8; VAdX2:=0; VAdY1:=0; VAdY2:=0; VMx:=1; VMy:=0;
      HAdX1:=0; HAdX2:=0;  HAdY1:=D8; HAdY2:=0; HMx:=0; HMy:=1;

      Obj.Visible:=Show;

      if Not Show then begin Obj.Visible:=False; VMX:=0; VMY:=0;
                                                 HMX:=0; HMY:=0;
                       end;

      if JustLeft
      then begin if TipoVH
                 then begin FX:=HLX+(HAdX2*HMX);
                            FY:=HLY+(HAdY2*HMY);
                      end
                 else begin FX:=VLX+(VAdX2*VMX);
                            FY:=VLY+(VAdY2*VMY);
                      end;
                 HLX:=HLX+(HAdX2+cWX+HAdX1)*HMX;
                 HLY:=HLY+(HAdY2+cWY+HAdY1)*HMY;

                 VLX:=VLX+(VAdX2+cWX+VAdX1)*VMX;
                 VLY:=VLY+(VAdY2+cWY+VAdY1)*VMY;
           end
      else begin if TipoVH
                 then begin FX:=HRX+(HAdX1*HMX);
                            FY:=HRY+(HAdY1*HMY);
                      end
                 else begin FX:=VRX+(VAdX1*VMX);
                            FY:=VRY+(VAdY1*VMY);
                      end;
                 HRX:=HRX+(HAdX1+cWX+HAdX2)*HMX;
                 HRY:=HRY+(HAdY1+cWY+HAdY2)*HMY;

                 VRX:=VRX+(VAdX1+cWX+VAdX2)*VMX;
                 VRY:=VRY+(VAdY1+cWY+VAdY2)*VMY;
           end;

      if Posiciona
      then begin  Obj.Left:=FX;
                  Obj.Top:=FY;
                  Obj.Width:=80;
                  Obj.BringToFront;
           end;
end;


begin LH('Iniciando la Forma Espere...');

      CursorEspera;
      Application.CreateForm(TfoInterForma,TInterForma(Comp).F);

      foInterForma:=TInterForma(Comp).F;
      foInterForma.Font.Name:='MS SANS SERIF';
      foInterForma.Font.Style:=[];
      foInterForma.Font.Size:=8;
      foInterForma.Padre:=Comp;
      foInterForma.KeyPreview:=True;
      foInterForma.OnKeyPress:=TInterForma(foInterForma.Padre).KeyPress;
      CapDist:=foInterForma.Height-foInterForma.ClientHeight;
      FontY:=foInterForma.Canvas.TextHeight('Tg');

      FormReference.KeyPreview:=True;
      FormReference.OnKeyPress:=TInterForma(foInterForma.Padre).KeyPress;

      Caso:=TInterForma(foInterForma.Padre).FormaTipo;

      if Caso=ftGrid then foInterForma.Estado:=esGrid;
      if Caso=ftConsulta then foInterForma.Estado:=esConsulta;
      if Caso=ftCaptura then foInterForma.Estado:=esCaptura;
      if Caso=ftModifica then foInterForma.Estado:=esModifica;
      if Caso=ftImprimir then foInterForma.Estado:=esImprimir;

      Estilo:=TInterForma(foInterForma.Padre).FormaEstilo;

      foInterForma.RefOrigen:=dsOrigen;
      foInterForma.GridRefOrigen:=dsGridOrigen;

      foInterForma.gApli.DataSource:=dsGridOrigen;
      foInterForma.dbNav.DataSource:=dsGridOrigen;

      //AsignaBotones
      TInterForma(foInterForma.Padre).BtnNuevo:=foInterforma.btNuevo;
      TInterForma(foInterForma.Padre).BtnModificar:=foInterforma.btModificar;
      TInterForma(foInterForma.Padre).BtnEliminar:=foInterforma.btEliminar;
      TInterForma(foInterForma.Padre).BtnAceptar:=foInterforma.btAceptar;
      TInterForma(foInterForma.Padre).BtnCancelar:=foInterforma.btCancelar;
      TInterForma(foInterForma.Padre).BtnBuscar:=foInterforma.btBuscar;
      TInterForma(foInterForma.Padre).BtnAyuda:=foInterforma.btAyuda;
      TInterForma(foInterForma.Padre).BtnSalir:=foInterforma.btCerrar;
      TInterForma(foInterForma.Padre).BtnImprimir:=foInterforma.btImprimir;
      TInterForma(foInterForma.Padre).BtnPreview:=foInterforma.btPreview;

      if (Caso=ftCaptura)or(Caso=ftModifica)
         then foInterForma.InitEdit:=True else foInterForma.InitEdit:=False;

      foInterForma.dbNav.Visible:=TInterForma(foInterForma.Padre).ShowNavigator;

      if (Not TInterForma(foInterForma.Padre).ShowGrid) or (Caso<>ftGrid)
         then begin foInterForma.gApli.Visible:=False;
                    //foInterForma.dbNav.Visible:=TInterForma(foInterForma.Padre).ShowNavigator;
                    FxX:=D8+D8;
                    FxY:=FontY; //FontY;
                    //FxY:=(D8*2)+FontY;
              end
         else begin foInterForma.gApli.Visible:=True;
                    foInterForma.dbNav.Visible:=True;
                    foInterForma.gApli.Left:=D8*2;
                    foInterForma.gApli.Top:=FontY+D8;
                    FxX:=D8+D8;
                    FxY:=113+(D8*2)+D8+FontY;
              end;

      foInterForma.pMensaje.Visible:=TInterForma(foInterForma.Padre).ShowErrorMessage;

      if TInterForma(foInterForma.Padre).ShowErrorMessage
         then begin if TInterForma(foInterForma.Padre).MsgPanel=nil
                       then TInterForma(foInterForma.Padre).MsgPanel:=foInterForma.pMensaje;
              end;

      //Centra la Forma en la Ventana.
      if Not TInterForma(foInterForma.Padre).CentrarForma
         then begin foInterForma.Top :=FormReference.Top-FxY;
                    foInterForma.Left:=FormReference.Left-(D8*2);
              end;
      lLeft:=FormReference.Left;
      lTop:=FormReference.Top;
      //PLANCHA LA FORMA EN LA INTERFORMA.
      FormReference.BorderStyle:=bsDialog;
      FormReference.BorderStyle:=bsNone;
      FormReference.Parent:=foInterForma.Panel1;
      FormReference.Left:=0;
      FormReference.Top:=0;

      foInterForma.gTextCap:=FormReference.Caption;

      if ParamStr(1)<>'P'
      then foInterForma.Caption:='[DESARROLLO] '+FormReference.Caption;
      foInterForma.gbApli.Caption:=TInterForma(Comp).GroupCaption;

      HLX:=0; HLY:=0; HRX:=0; HRY:=0;
      VLX:=0; VLY:=0; VRX:=0; VRY:=0;

      BxX:=0; BxY:=0;

      AddObj(foInterForma.btNuevo     ,TInterForma(Comp).ShowBtnNuevo      , False, False, False);
      AddObj(foInterForma.btModificar ,TInterForma(Comp).ShowBtnModificar  , False, False, False);
      AddObj(foInterForma.btEliminar  ,TInterForma(Comp).ShowBtnEliminar   , False, False, False);
      AddObj(foInterForma.btAceptar   ,TInterForma(Comp).ShowBtnAceptar    , False, False, False);
      AddObj(foInterForma.btCancelar  ,TInterForma(Comp).ShowBtnCancelar   , False, False, False);
      AddObj(foInterForma.btPreview   ,TInterForma(Comp).ShowBtnPreview    , False, False, False);
      AddObj(foInterForma.btImprimir  ,TInterForma(Comp).ShowBtnImprimir   , False, False, False);
      AddObj(foInterForma.btBuscar    ,TInterForma(Comp).ShowBtnBuscar     , True , False, False);
      AddObj(foInterForma.btAyuda     ,TInterForma(Comp).ShowBtnAyuda      , True , False, False);
      AddObj(foInterForma.btCerrar    ,TInterForma(Comp).ShowBtnSalir      , True , False, False);

      AuxEstilo:=Estilo;

      if Estilo=feAutomatico then
         begin AuxEstilo:=feHorizontal;
               //if FormReference.ClientWidth<600
               if ((VRX+VLX))>(FormReference.ClientWidth)
               then begin if HLY+HRY>(FormReference.Height-CapDist)+ExY
                          then AuxEstilo:=feHorizontal
                          else AuxEstilo:=feVertical;
                    end
               else AuxEstilo:=feHorizontal;
         end;
      ExX:=FxX; ExY:=FxY;
      if AuxEstilo=feHorizontal
           then begin HPos:=False;

                      if TInterForma(foInterForma.Padre).ShowErrorMessage
                      then BxY:=D8+D8+D8+25+D8+25+D8
                      else BxY:=D8+D8+D8+25+D8;

                      ExX:=ExX+D8*5;
                      ExY:=ExY+D8+BxY;

                      if ((VRX+VLX)+ExX)>(FormReference.ClientWidth+ExX)
                         then foInterForma.ClientWidth:=((VRX+VLX)+ExX)
                         else foInterForma.ClientWidth:=(FormReference.ClientWidth+ExX);

                      foInterForma.ClientHeight:=((FormReference.Height-CapDist)+ExY);
                      //if foInterForma.ClientWidth<(VRX+VLX) then foInterForma.ClientWidth:=(VRX+VLX);
                      VRY:=foInterForma.ClientHeight-25-D8;
                      VRX:=0;

                      VLY:=foInterForma.ClientHeight-25-D8;
                      VLX:=foInterForma.ClientWidth-VLX;
                      //VRX:=0; VRY:=0; VLX:=0; VLY:=0;
                end
      else if AuxEstilo=feVertical
           then begin HPos:=True;


                      if TInterForma(foInterForma.Padre).ShowErrorMessage
                      then BxY:=D8+D8+D8+25
                      else BxY:=D8+D8+D8; //D8+25+D8;

                      BxX:=D8+D8+80+D8;

                      ExX:=ExX+D8*5+BxX;
                      ExY:=ExY+D8+BxY;

                      foInterForma.ClientWidth:=((FormReference.ClientWidth)+ExX);

                      if ((HLY+HRY))>((FormReference.Height-CapDist)+ExY)
                         then foInterForma.ClientHeight:=((HLY+HRY))
                         else foInterForma.ClientHeight:=((FormReference.Height-CapDist)+ExY);

                      HLX:=foInterForma.ClientWidth-BxX;
                      HLY:=foInterForma.ClientHeight-HLY;

                      HRY:=0;
                      HRX:=HLX;
                end;

      AddObj(foInterForma.btNuevo     ,TInterForma(Comp).ShowBtnNuevo      , False, True , HPos );
      AddObj(foInterForma.btModificar ,TInterForma(Comp).ShowBtnModificar  , False, True , HPos );
      AddObj(foInterForma.btEliminar  ,TInterForma(Comp).ShowBtnEliminar   , False, True , HPos );
      AddObj(foInterForma.btAceptar   ,TInterForma(Comp).ShowBtnAceptar    , False, True , HPos );
      AddObj(foInterForma.btCancelar  ,TInterForma(Comp).ShowBtnCancelar   , False, True , HPos );
      AddObj(foInterForma.btPreview   ,TInterForma(Comp).ShowBtnPreview    , False, True , HPos );
      AddObj(foInterForma.btImprimir  ,TInterForma(Comp).ShowBtnImprimir   , False, True , HPos );
      AddObj(foInterForma.btBuscar    ,TInterForma(Comp).ShowBtnBuscar     , True , True , HPos );
      AddObj(foInterForma.btAyuda     ,TInterForma(Comp).ShowBtnAyuda      , True , True , HPos );
      AddObj(foInterForma.btCerrar    ,TInterForma(Comp).ShowBtnSalir      , True , True , HPos );

      foInterForma.gbApli.SetBounds(D8,D8,foInterForma.ClientWidth-(D8*2)-BxX
                                         ,foInterForma.ClientHeight-BxY+D8);

      foInterForma.Panel1.Left:=FxX;
      foInterForma.Panel1.Top :=FxY;
      foInterForma.Panel1.Width :=FormReference.ClientWidth;
      foInterForma.Panel1.Height:=FormReference.ClientHeight-CapDist;

      foInterForma.gApli.Width:=foInterForma.ClientWidth-(D8*6)-BxX;

      if (Not TInterForma(foInterForma.Padre).ShowGrid) or (Caso<>ftGrid)
      then foInterForma.dbNav.Top :=0
      else foInterForma.dbNav.Top :=FxY-(D8*2);
      foInterForma.dbNav.Left:=foInterForma.ClientWidth-foInterForma.dbNav.Width-(D8*4)-BxX;

      foInterForma.pMensaje.Top:=foInterForma.ClientHeight-BxY+D8+D8;
      foInterForma.pMensaje.Left:=D8;
      foInterForma.pMensaje.Width:=foInterForma.ClientWidth-(D8*2)-BxX;

      if TInterForma(foInterForma.Padre).CentrarForma
         then begin foInterForma.Position:=poScreenCenter;
                    //:=(Screen.Width-foInterForma.Width) div 2;
                    //foInterForma.Top:=(Screen.Height-foInterForma.Height) div 2;
              end;
      FormReference.Show;

      foInterForma.RefForm:=FormReference;

      foInterForma.AntesLeft:=lLeft;
      foInterForma.AntesTop:=lTop;

      TInterforma(Comp).InitShow;
      if Not Modal
         then foInterForma.Show
         else begin TInterforma(Comp).ModalResult:=foInterForma.ShowModal;
                    foInterForma.Free;
              end;

end;


Procedure TfoInterforma.CMDialogKey(Var Msg:TCMDialogKey);
begin //if Msg.CharCode<>VK_TAB then Inherited else if TInterForma(Padre).ChecaTab then
      Inherited;
end;

Procedure TfoInterforma.MsValida(Var Message:TMessage);
begin TInterForma(Padre).MsValida(Message);
end;

Procedure TfoInterforma.DespuesShow(Var Message:TMessage);
var OK:Boolean;
begin OK:=False;
      if Estado=esCaptura
         then TInterForma(Padre).PreparaNuevo
         else TInterForma(Padre).PreparaModificar;
      Try
      if Estado=esCaptura
         then OK:=TInterForma(Padre).Nuevo
         else OK:=TInterForma(Padre).Modificar;
      Finally
       if Not ok then begin ModalResult:=mrCancel;  Close; end;
      end;
end;

Procedure TfoInterforma.DespuesDespuesShow(Var Message:TMessage);

Procedure RefreshPanel(Component:TComponent);
var I:Integer;
begin if Component is TPanel then TPanel(Component).Invalidate;
      if Component is TSpeedButton
         then begin
                   TSpeedButton(Component).Invalidate;
              end;
      For i:=0 to Component.ComponentCount-1 do
      begin RefreshPanel(Component.Components[I]);
      end;
end;

begin //RefreshPanel(Self);
      //RefreshPanel(RefForm);
      //RefForm.Invalidate;
      //RefForm.Update;
      //RefForm.Repaint;
      //Application.ProcessMessages;
      TInterForma(Padre).VerificaMacro;
      TInterForma(Padre).DespuesShow;
end;



Procedure TfoInterforma.SetEdit(Modo:Boolean);
begin if Modo=False then Accion:='';
      if Accion<>'' then Caption:=gTextCap+' ['+Accion+']' else Caption:=gTextCap;
      FCanEdit:=Modo;
      //Cambia(Self,Self,16,FCanEdit,IsNewData,gApli);
      Cambia(Refform,Refform,16,FCanEdit,IsNewData,gApli);
      gApli.Enabled:=Not Modo;
      dbNav.Enabled:=Not Modo;
      if (Visible) and (Not FCanEdit) and (IsEnabled(gApli))
         then begin gApli.SetFocus;
              end;
end;


//*************************************************
// Inicialización General de la Forma.
//*************************************************

procedure TfoInterforma.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action:=caFree;
      if RefForm<>Nil then
         begin TInterForma(Padre).BtnNuevo:=Nil;
               TInterForma(Padre).BtnModificar:=Nil;
               TInterForma(Padre).BtnEliminar:=Nil;
               TInterForma(Padre).BtnAceptar:=Nil;
               TInterForma(Padre).BtnCancelar:=Nil;
               TInterForma(Padre).BtnBuscar:=Nil;
               TInterForma(Padre).BtnAyuda:=Nil;
               TInterForma(Padre).BtnSalir:=Nil;
               TInterForma(Padre).BtnPreview:=Nil;
               TInterForma(Padre).BtnImprimir:=Nil;

               RefForm.Left:=AntesLeft;
               RefForm.Top:=AntesTop;
               RefForm.Hide;
               RefForm.Parent:=Nil;
               if Padre<>Nil then TInterForma(Padre).F:=Nil;
         end;
end;

procedure TfoInterforma.FormCreate(Sender: TObject);
begin gTextCap:=Caption;
      //
end;

procedure TfoInterforma.FormDestroy(Sender: TObject);
begin //TT.Free;
      //MessageBeep(0);
end;

procedure TfoInterforma.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin //if Estado<>esCaptura then
      CanClose:=(Not CanEdit) and (TInterForma(Padre).CanCloseForm);
end;

Procedure TfoInterforma.Buscar;
begin //TT.SearchField:=DameCampoGrid(gApli);
      //TT.Execute;
end;

Procedure TfoInterforma.Ayuda;
begin
end;



//*************************************************


procedure TfoInterforma.FormShow(Sender: TObject);
begin LH('');
      CanEdit:=InitEdit;
      CursorNormal;
      if InitEdit then PostMessage(Handle,WM_DespuesShow,0,0);
      PostMessage(Handle,WM_DESPUES_DESPUES_SHOW,0,0);
end;




end.


