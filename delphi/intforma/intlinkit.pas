unit IntLinkit;
//-------------------------------------------------------------
// Sistema         :   InterLinkIt
// Date            :   Octubre de 1997
// Fecha de Inicio :   Octubre de 1997
// Función forma   :   Todos!!!
// Desarrollo por  :   Víctor Martínez Castro
// Comentarios     :
// Actualizado al  :   23 Noviembre
// ------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,IntFind,extCtrls,Mask, UnSubGen, InterEdit; //,IntWFind;

Const vgAirLinkColor:TColor=clInfoBk; //$00AAF0F0;

//type
//  TTipoReader=(trContrato,trDinero,trEntero);

Type
    TOnCaptureShow= Procedure (Sender : TObject; Var Show:Boolean) of Object;

Type  TInterLinkit= class;
  TWAirLink = class(TForm)
    Label1 : TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    LinkIt : TInterLinkit;
    Procedure CMDialogKey(Var Msg:TCMDialogKey); MESSAGE cm_dialogkey;
  end;
  TInterLinkit= class(Tcomponent)
  private
    { Private declarations }
    FBuffer:String;
    FSalidaTimer:Boolean;
    FTerminaTimer:Boolean;
    FValidChar:String;
    FTipoReader:TTipoReader;
    FCharCase: TEditCharCase;
    FCambio:Integer;
    FControl:TControl;
    FOnKeyPress:TKeyPressEvent;
    FOnEjecuta:TNotifyEvent;
    FOnCapture:TOnCaptureShow;
    Procedure SetCambio(B:Integer);
    Procedure SetControl(C:TControl);
    Procedure SetTipoReader(R:TTipoReader);
  protected
    { Protected declarations }
    procedure Notification( AComponent : TComponent; Operation : TOperation ); override;
    Function GetBuffer:String;
  public
    { Public declarations }
      Forma:TWAirLink;
      ShowBuffer:String;
      CambioCount:Integer;
      Timer:TTimer;
      Into:Boolean;
      FPanel:TPanel;
      Constructor Create(AOwner:TComponent); override;
      Destructor  Destroy; virtual;
      procedure   KeyPress(Sender: TObject; var Key: Char);
      PRocedure   OnTimer(Sender:TObject);
      Procedure   Ejecuta;
      Property    Cambio:Integer read FCambio Write SetCambio;
      Property    Buffer:String read GetBuffer Write FBuffer;
  published
    { Published declarations }
    Property Control:TControl Read FControl Write SetControl;
    Property OnKeyPress:TKeyPressEvent Read FOnKeyPRess Write FOnKeyPress;
    Property OnEjecuta:TNotifyEvent read FOnEjecuta Write FOnEjecuta;
    Property TipoReader:TTipoReader Read FTipoReader Write SetTipoReader;
    property CharCase: TEditCharCase read FCharCase Write FCharCase;
    Property OnCapture:TOnCaptureShow Read FOnCapture Write FOnCapture;
  end;


procedure Register;

implementation

{$R *.DFM}
{$R *.DCR}

procedure Register;
begin
  RegisterComponents('Inter', [TInterLinkit]);
end;

procedure TWAirLink.FormCreate(Sender: TObject);
begin Color:=clInfoBk;
      Linkit:=nil;
end;

Procedure TWAirLink.CMDialogKey(Var Msg:TCMDialogKey);
begin if Msg.CharCode<>VK_TAB
      then Inherited
      else begin if Linkit<>nil then Linkit.CambioCount:=10;
                 Inherited;
           end;
end;


procedure TInterLinkit.Notification( AComponent : TComponent; Operation : TOperation );
begin if (AComponent=FControl) and (Operation=opRemove) then FControl:=nil;
end;

Procedure TInterLinkit.SetTipoReader(R:TTipoReader);
begin FTipoReader:=R;
      Case FTipoReader of
      trContrato :FValidChar:='01234567890-';
      trDinero   :FValidChar:='01234567890.-+';
      trEntero   :FValidChar:='01234567890-+';
      trTexto    :FValidChar:='';
      end;
end;

Constructor TInterLinkit.Create(AOwner:TComponent);
begin Inherited Create(AOwner);
      FBuffer:='';
      ShowBuffer:='';
      Into:=False;
      CambioCount:=0;
      Forma:=nil;
      Cambio:=4;
      Timer:=TTimer.Create(Self);
      Timer.Enabled:=False;
      Timer.OnTimer:=OnTimer;
      Timer.Interval:=100;
      FControl:=nil;
      FValidChar:='';
      TipoReader:=TrTexto;
      FOnCapture:=nil;
      FSalidaTimer:=True;
      FTerminaTimer:=False;
      FPanel:=TPanel.Create(Self);
end;

Destructor  TInterLinkit.Destroy;
begin if Timer<>nil then Timer.Free; Timer:=nil;
      if FPanel<>nil then FPanel.Free; FPanel:=nil;
      Inherited Destroy;
end;

Function TInterLinkit.GetBuffer:String;
var C,Pre:String;
begin GetBuffer:=FBuffer;
      if (TipoReader=TrContrato) and (FControl<>nil)
         then begin if FControl is TInterEdit then Pre:=TInterEdit(FControl).Prefijo
                                              else Pre:='1';
                    C:=FBuffer;
                    ChecaContrato(C,Pre);
                    if C<>'' then begin FBuffer:=C;
                                        if FControl is TInterEdit
                                        then TInterEdit(FControl).Prefijo:=Pre;
                                  end;
                    GetBuffer:=FBuffer;
              end;
end;

Procedure TInterLinkit.SetControl(C:TControl);
begin FControl:=C;
      if C<>nil
      then begin if C is TEdit
                    then begin TEdit(C).OnKeyPress:=KeyPress;
                               CharCase:=TEdit(C).CharCase;
                               (*
                               FPanel.SetBounds(TEdit(C).Left,TEdit(C).Top,100,100); //0,0,4,//TEdit(C).Left-6,TEdit(C).Top
                                              //,4,
                                              //TEdit(C).Height);
                               FPanel.Parent:=TEdit(C).Parent;
                               FPanel.BringToFront;
                               *)
                               if TEdit(C).Tag=-1
                               then TEdit(C).Tag:=512 or 1024
                               else TEdit(C).Tag:=TEdit(C).Tag Or 512;
                         end
               else if C is TMaskEdit
                    then begin TMaskEdit(C).OnKeyPress:=KeyPress;
                               CharCase:=TMaskEdit(C).CharCase;
                               FPanel.SetBounds(TMaskEdit(C).Left-6,TMaskEdit(C).Top
                                              ,4,TMaskEdit(C).Height);
                               FPanel.Parent:=TMaskEdit(C).Parent;
                         end
               else if C is TInterEdit
                    then begin TInterEdit(C).OnKeyPress:=KeyPress;
                               if TInterEdit(C).Tag=-1
                                  then TInterEdit(C).Tag:=512 or 1024
                                  else TInterEdit(C).Tag:=TInterEdit(C).Tag Or 512;
                               (*
                               FPanel.SetBounds(TInterEdit(C).Left-6,TInterEdit(C).Top,100,100);
                                //0,0,4,//TEdit(C).Left-6,TEdit(C).Top
                               FPanel.Parent:=TInterEdit(C).Parent;
                               FPanel.BringToFront;
                               FPanel.Invalidate;
                               FPanel.Caption:='HOLA';
                               FPanel.Parent.Invalidate;
                               FPanel.Parent.Parent.Invalidate;
                               //CharCase:=TInterEdit(C).CharCase;
                               *)
                         end
               else begin FPanel.Parent:=nil;
                          FControl:=nil;
                    end;
          end;
end;

procedure TInterLinkit.SetCambio(B:Integer);
var P:TPoint;
begin FCambio:=B;
      if (B=0) and (Control<>nil)
      then begin if Forma=nil
                 then begin Application.CreateForm(TWAirLink,Forma);
                            Forma.Linkit:=Self;
                            Forma.OnKeyPress:=KeyPress;
                      end;
                 Forma.OnKeyPress:=KeyPress;
                 if Control.Parent<>nil
                 then P:=Control.Parent.ClientToScreen(Point(Control.Left,Control.Top))
                 else begin p.x:=Control.Left;
                            p.y:=Control.Top;
                      end;
                 p.x:=P.X+2;
                 p.y:=P.y+2;
                 //p:=Edit1.ScreenToClient(Point(P.x,P.y));
                 if (Forma.Left<>p.x) or
                    (Forma.Top<>p.y) or
                    (Forma.Width<>Control.Width-4) or
                    (Forma.Height<>Control.Height-4)
                 then begin
                 Forma.Left:=p.x;
                 Forma.Top:=p.y;
                 Forma.Width:=Control.Width-4;
                 Forma.Height:=Control.Height-4;
                 end;
                 (*
                 if Form3.Visible
                 then Form3.BringToFront
                 else
                 *)
                 Forma.Show;
                 //Form3.Edit1.SetFocus;
                 Forma.Refresh;
                 Application.ProcessMessages;
                 Forma.SetFocus;
                 Forma.Label1.Caption:=ShowBuffer;
                 Application.ProcessMessages;
                 FTerminaTimer:=False;
                 Timer.Enabled:=True;
           end
      else
      if B=8
      then begin if Forma<>nil then Forma.Hide;
                 FTerminaTimer:=True;
                 While Timer.Enabled do
                 begin Application.ProcessMessages;
                 end;
                 //Timer.Enabled:=False;
           end
      else if B=1
      then begin FTerminaTimer:=True;
                 While Timer.Enabled do
                 begin Application.ProcessMessages;
                 end;
                 Forma.Hide;
                 FBuffer:='';
                 ShowBuffer:='';
                 CambioCount:=0;
                 if Forma<>nil
                 then begin Forma.Free;
                            Forma:=nil;
                      end;
           end
      else begin
           end;
end;


procedure TInterLinkit.KeyPress(Sender: TObject; var Key: Char);
var Show:Boolean;
begin if (Cambio=2)or(Cambio=8) then exit;
      if (Cambio=4)
         then begin Show:=True;
                    if Assigned(OnCapture) then FOnCapture(Self,Show);
                    if Not Show then exit;
              end;

      if Assigned(OnKeyPress) then FOnKeyPress(Sender,Key);
      if Key=#0 then exit;
      if Key=#13
      then begin (*
                 if Buffer<>'' then
                 begin CambioCount:=5;
                       Cambio:=0;
                       Application.ProcessMessages;
                       Exit;
                 end;
                 *)
           end
      else
      if Key=#27
      then begin FBuffer:='';
                 ShowBuffer:='';
                 CambioCount:=8;
                 Exit;
           end
      else
      if Key=#08
      then begin FBuffer:=Copy(FBuffer,1,Length(FBuffer)-1);
                 ShowBuffer:=Copy(ShowBuffer,1,Length(ShowBuffer)-1);
           end
      else begin if Key=#09
                 then begin FBuffer:=FBuffer+Key;
                            ShowBuffer:=ShowBuffer+'>'
                      end
                 else begin if FValidChar<>''
                            then begin if Pos(Key,FValidChar)<=0 then Exit;
                                 end;
                            Case CharCase of
                            ecLowerCase:begin ShowBuffer:=ShowBuffer+LowerCase(Key);
                                              FBuffer:=FBuffer+LowerCase(Key);
                                        end;
                            ecNormal   :begin ShowBuffer:=ShowBuffer+Key;
                                              FBuffer:=FBuffer+Key;
                                        end;
                            ecUpperCase:begin ShowBuffer:=ShowBuffer+UpperCase(Key);
                                              FBuffer:=FBuffer+UpperCase(Key);
                                        end;
                            end;
                      end;
           end;
      CambioCount:=0;
      Cambio:=0;
      Application.ProcessMessages;
end;

Procedure TInterLinkit.Ejecuta;
var Findit:TInterFindit;
begin if Into then exit;
      Into:=true;
      Try
      if Assigned(OnEjecuta) then FOnEjecuta(Self);
      (*
      if Not InterForma1.CanEdit then
      begin Findit:=TInterFindit.Create(Self);
            Findit.FastVal:=Buffer;
            Findit.FastField:='0';
            Findit.DataBaseName:='dbCorp';
            if IntWFind.FindItSQL
            then Findit.FileName:='IntCtto.it'
            else Findit.FileName:='o:\delphide\public\findit\IntCtto.it';
            Try if Findit.Execute then
            Finally //ShowMessage('Key:'+IntToStr(Ord(Key)));
                    Findit.Free;
            end;
      end;
      *)
      Finally Into:=False;
      end;
end;

procedure TInterLinkit.OnTimer(Sender: TObject);
begin FSalidaTimer:=True;
      Timer.Enabled:=False;
      Try
      if Cambio=0
      then begin Inc(CambioCount);
                 if (CambioCount>8)
                 then begin Try
                            if Buffer<>'' then
                            begin Cambio:=2;
                                  CursorEspera;
                                  Try
                                  Cambio:=8;
                                  Finally Try
                                          CursorNormal;
                                          Ejecuta;
                                          Finally Cambio:=1;
                                          end;
                                  end;
                            end
                            else Cambio:=1;
                            Finally FSalidaTimer:=False;
                                    Cambio:=4;
                            end;
                      end;
           end;
      Finally Timer.Enabled:=(FSalidaTimer) and (Not FTerminaTimer);
      end;
end;



procedure TWAirLink.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action:=caFree;
end;

end.
