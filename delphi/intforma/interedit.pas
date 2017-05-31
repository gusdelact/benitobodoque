unit InterEdit;
//-------------------------------------------------------------
// Sistema         :   InterEdit
// Date            :   Noviembre de 1997
// Fecha de Inicio :   Noviembre de 1997
// Función forma   :   Control de Edit´s
// Desarrollo por  :   Víctor Martínez Castro MACV.
// Comentarios     :
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

Const   WM_Send_Foco=WM_USER+1;


type
  TTipoReader=(trContrato,trDinero,trEntero,trTexto);
  TInterEdit= class(TCustomMemo)
  private
    { Private declarations }
    FOnPresiono:TKeyPressEvent;
    FOnEntra:TNotifyEvent;
    FOnSalir:TNotifyEvent;
    FOnCambio:TNotifyEvent;
    FOnCambioPrefijo:TNotifyEvent;
    FTexto:String;
    FTipoReader:TTipoReader;
    FPrefijo:String;
    FContrato:LongInt;
    FDisplayMask:String;
    FMaxLength:Integer;
    FUseRetype    : Boolean;
    FUseDisplay   : Boolean;
    FRecaptura    : Boolean;
    FRetypeLabel  : TLabel;
    FColorPos     : TColor;
    FColorNeg     : TColor;
    FPositiveOnly : Boolean;
    FUseSep: Boolean;
  protected
    { Protected declarations }
    procedure Notification( AComponent : TComponent; Operation : TOperation );
    Procedure SetTexto(S:String);
    Function  GetTexto:String;
    Procedure PintaLabel;
  public
    { Public declarations }
    Forma           : TForm;
    FormaLabel1     : TLabel;
    FormaLabel2     : TLabel;
    FormaEdit       : TEdit;
    FContratoValido : Boolean;
    FCheckContrato  : String;
    ContratoExiste  : Boolean;
    Recaptura:Boolean;
    CambioTexto     : Boolean;
    Constructor Create(AOwner:TComponent); override;
    Destructor Destroy; override;
    Procedure SetTipoReader(Rd:TTipoReader);
    Procedure SetContrato(L:LongInt);
    Procedure SetPrefijo(E:String);
    Procedure SetCheckContrato(C:String);
    Procedure InternalEnter(Sender:TObject);
    Procedure InternalSalir(Sender:TObject);
    Procedure InternalCambio(Sender:TObject);
    PRocedure InternalKeyPress(Sender: TObject; var Key: Char);
    Function  SinFormato(Caso:Integer; Tx:String):String;
    Function  ConFormato(Tx:String):String;
    Procedure ActualizaTexto;
  published
    { Published declarations }

//    Property ReCaptura:Boolean read FRecaptura Write FRecaptura;
    Property Text:String  Read GetTexto Write SetTexto;
    Property Prefijo:String read FPrefijo Write SetPrefijo;
    Property Contrato:LongInt Read FContrato Write SetContrato;
    Property TipoReader:TTipoReader Read FTipoReader Write SetTipoReader;
    Property OnEnter:TNotifyEvent Read FOnEntra Write FOnEntra;
    Property OnExit :TNotifyEvent Read FOnSalir Write FOnSalir;
    Property OnChange:TNotifyEvent Read FOnCambio Write FOnCambio;
    Property OnKeyPress:TKeyPressEvent Read FOnPresiono Write FOnPresiono;
    Property OnCambioPrefijo:TNotifyEvent Read FOnCambioPrefijo Write FOnCambioPrefijo;
    Property DisplayMask:String Read FDisplayMask Write FDisplayMask;
    Property MaxLength:Integer Read FMaxLength Write FMaxLength;
    Property Color;
    Property Font;
    Property TabOrder;
    Property TabStop;
    Property Enabled;
    Property ReadOnly;
    Property OnKeyDown;
    Property CharCase;
    Property Visible;
    Property PopupMenu;
    Property UseReType :Boolean Read FUseRetype Write FUseReType;
    Property UseSep    :Boolean Read FUseSep    Write FUseSep;
    Property UseDisplay:Boolean Read FUseDisplay Write FUseDisplay;
    Property PositiveOnly:Boolean Read FPositiveOnly Write FPositiveOnly;
    Property RetypeLabel:TLabel Read FRetypeLabel Write FRetypeLabel;

    Property ColorPos  :TColor Read FColorPos  Write FColorPos;
    Property ColorNeg  :TColor Read FColorNeg  Write FColorNeg;

    Procedure EnviaFoco(Var Msg:TMessage); Message WM_SEND_FOCO;
  end;



  TWRCEdit = class(TForm)
    PnDos: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel4: TPanel;
    Panel2: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
     FormaEdit1:TInterEdit;
     FormaEdit2:TInterEdit;
     Procedure CMDialogKey(Var Msg:TCMDialogKey); MESSAGE cm_dialogkey;
     Procedure CambioTexto(Sender:TObject);
  end;

var
  WRCEdit: TWRCEdit;


Function ChecaContrato(Var C:String; Var Prefijo:String):Boolean;

procedure Register;

implementation
Uses UnGene,UnSubGen, InterFor;

{$R *.DFM}
{$R *.DCR}

procedure Register;
begin RegisterComponents('Inter', [TInterEdit]);
end;



Procedure TInterEdit.SetTipoReader(Rd:TTipoReader);
begin FTipoReader:=rd;
      if (FTipoReader=trContrato) or (FTipoReader=trTexto)
         then begin Alignment:=taLeftJustify;
                    FMaxLength:=10;
              end
      else
      if FTipoReader=trDinero
         then begin Alignment:=taRightJustify;
                    FMaxLength:=12;
              end
      else
      if FTipoReader=trEntero
         then begin Alignment:=taRightJustify;
                    FMaxLength:=6;
              end;

end;

Procedure TInterEdit.SetPrefijo(E:String);
begin if E<>FPrefijo
      then begin FPrefijo:=E;
                 if Assigned(OnCambioPrefijo) then OnCambioPrefijo(Self);
           end;
end;

Procedure TInterEdit.SetContrato(L:LongInt);
begin if L=-1
      then Text:=''
      else Text:=IntToStr(L);
end;

Function TInterEdit.SinFormato(Caso:Integer; Tx:String):String;
var i:Integer;
    Salida,S:String;

begin S:=Tx;
      SinFormato:='';
      Salida:='';
      For i:=1 to Length(S) do
      begin Case S[I] of
            ',':;
            '.':Salida:=Salida+S[i];
            '-':Salida:=Salida+S[i];
            '+':Salida:=Salida+S[i];
            '0'..'9':Salida:=Salida+S[i];
            end;
      end;
      Case Caso of
      10:if Salida='' then Salida:='0';
      end;
      SinFormato:=Salida;
      (*
      Case Caso of
      0:Edit1.SelStart:=0;
      1:Edit1.SelStart:=Length(Salida);
      end;
      Edit1.SelLength:=Length(Salida);
      *)
end;

Function TInterEdit.ConFormato(Tx:String):String;
var i,Cuenta:Integer;
    Salida:String;
    Estado:Integer;
    Last:String;
begin ConFormato:='';
      Cuenta:=0;
      Salida:='';
      Estado:=0;
      Last:='';
      if DisplayMask<>'' then begin Tx:=FormatFloat(DisplayMask,StrToFloat(SinFormato(10,Tx)));
                              end;
      if Pos('.',Tx)>0 then Estado:=1;
      for i:=Length(Tx) downto 1 do
      begin Case Tx[i] of
            '.':begin Estado:=0;
                      Salida:=Tx[i]+Salida;
                      Last:=Tx[i];
                end;
            '0'..'9':begin if (Estado=1)
                           then Salida:=Tx[i]+Salida
                           else begin Inc(Cuenta);
                                      if Cuenta>3
                                      then begin if (Not UseSep)
                                                 then Salida:=Tx[i]+Salida
                                                 else Salida:=Tx[i]+','+Salida;
                                                 Last:=',';
                                                 Cuenta:=1;
                                           end
                                      else begin Salida:=Tx[i]+Salida;
                                                 Last:=Tx[i];
                                           end;
                                end;
                      end;
               ',':begin if ((FTipoReader=trEntero) or (FTipoReader=trDinero))
                         then begin if (Last=',')
                                    then begin Cuenta:=0;
                                         end
                                    else begin Salida:=Tx[i]+Salida;
                                               Last:=',';
                                               Cuenta:=0;
                                         end;
                              end
                         else Salida:=Tx[i]+Salida;
                    end;
            else begin Salida:=Tx[i]+Salida;
                       Last:=Tx[i];
                 end;
            end;
      end;
      ConFormato:=Salida;
end;





Destructor TInterEdit.Destroy;
begin if Forma<>nil
      then begin FormaLabel1.Free; FormaLabel1:=nil;
                 FormaLabel2.Free; FormaLabel2:=nil;
                 Forma.Free; Forma:=nil;
           end;
      Inherited;
end;


Constructor TInterEdit.Create(AOwner:TComponent);
begin Inherited;
      UseSep:=True;
      WantReturns:=False;
      Inherited OnEnter:=InternalEnter;
      Inherited OnExit:=InternalSalir;
      Inherited OnKeyPress:=InternalKeyPress;
      Inherited OnChange:=InternalCambio;
      FContrato:=-1;
      FPrefijo:='1';
      FTipoReader:=trContrato;
      FTexto:=Inherited Text;
      FMaxLength:=12;
      Forma     :=nil;
      FormaLabel1 :=nil;
      FormaLabel2 :=nil;
      ReCaptura   :=True;
      CambioTexto :=False;
      RetypeLabel :=nil;
      FUseReType  :=False;
      FUseDisplay :=False;

      FPositiveOnly := False;

      FColorPos   :=clBtnText;
      FColorNeg   :=clRed;
end;

Procedure TInterEdit.EnviaFoco(Var Msg:TMessage);
begin Forma.Show;
      PintaLabel;
      SetFocus;
      Application.ProcessMessages;
      if (Enabled)and(Not ReadOnly)  then
      begin Inherited Text:=SinFormato(0,Text);
            SelStart:=0;
            SelLength:=Length(Inherited Text);
            CambioTexto:=False;
      end;
      if Assigned(OnEnter) then OnEnter(Self);
end;

Procedure TInterEdit.PintaLabel;
var Dato,DatoEnt,DatoFrac:Extended;
    Anchote,Err:Integer;
    S1,S2:String;

Procedure SeparaTexto(S:String; Var T1,T2:String);
var Edo,i,Err:Integer;
begin Edo:=0;
      T1:=''; T2:='';
      for i:=Length(S) downto 1 do
      begin Case Edo of
            0:T2:=S[i]+T2;
            1:T1:=S[i]+T1;
            end;
            if S[i]='.' then Edo:=1;
      end;
      if T1='' then begin T1:=T2; T2:=''; end;
end;

begin if Not ((FTipoReader=trDinero) or (FTipoReader=trEntero)) then Exit;
      Try Val(SinFormato(1,ConFormato(Text)),Dato,Err);
      Except
      end;
      if (Dato<0) or (Err<>0) or (Trim(Text)='')
      then begin Font.Color:=ColorNeg;
           end
      else begin Font.Color:=ColorPos;
           end;
      if (FormaLabel1<>nil) and (FormaLabel2<>nil)
      then begin Try
                 Val(SinFormato(1,ConFormato(Text)),Dato,Err);
                 Except FormaLabel1.Caption:='';
                        FormaLabel2.Caption:='';
                        Exit;
                 end;
                 if (Trim(Text)='') or (Error<>0)
                    then begin FormaLabel1.Caption:='';
                               FormaLabel2.Caption:='';
                         end
                    else begin SeparaTexto(ConFormato(Text),S1,S2);
                               DatoFrac:=Frac(Dato);
                               DatoEnt:=Dato-DatoFrac;
                               FormaLabel1.Caption:=S1;
                               FormaLabel2.Caption:=S2;
                               if Dato<0
                               then begin FormaLabel1.Font.Color:=ColorNeg;
                                          FormaLabel2.Font.Color:=ColorNeg;

                                          FormaLabel1.Refresh;
                                          FormaLabel2.Refresh;
                                    end
                               else begin FormaLabel1.Font.Color:=ColorPos;
                                          FormaLabel2.Font.Color:=ColorPos;

                                          FormaLabel1.Refresh;
                                          FormaLabel2.Refresh;
                                    end;
                               Anchote:=FormaLabel2.Canvas.TextWidth(FormaLabel2.Caption)+(FormaLabel2.Canvas.TextWidth(' ') div 3);
                               FormaLabel1.SetBounds(4,2,(Width-8)-Anchote,18);
                               FormaLabel2.SetBounds(4+(Width-8)-Anchote,2,Anchote,18);
                         end;
           end;
end;


Procedure TInterEdit.InternalEnter(Sender:TObject);
var P:TPoint;
begin if //(False) and
          (Forma=nil) and (Enabled) and (Not ReadOnly)
          and ((FTipoReader=trDinero) or (FTipoReader=trEntero) )
          and (FUseDisplay)
      then begin Forma:=TForm.Create(Self);
                 Forma.AutoScroll:=False;
                 FormaLabel1:=TLabel.Create(Self);
                 FormaLabel1.Parent:=Forma;

                 FormaLabel2:=TLabel.Create(Self);
                 FormaLabel2.Parent:=Forma;

                 Forma.BorderIcons:=[];
                 Forma.BorderStyle:=bsNone;
                 //  BorderStyle:=[]; //biSystemMenu,biMinimize,biMaximize,biHelp];
                 if Parent<>nil
                 then P:=Parent.ClientToScreen(Point(Left,Top))
                 else begin p.x:=Left;
                            p.y:=Top;
                      end;
                 p.x:=P.X;
                 p.y:=P.y+2;

                 FormaLabel2.Alignment:=taRightJustify;
                 FormaLabel2.SetBounds(4,2,Width-8,16);
                 FormaLabel2.Font.Color:=clGray;

                 FormaLabel1.Alignment:=taRightJustify;
                 FormaLabel1.SetBounds(4,2,Width-8,16);
                 FormaLabel1.Font.Color:=clInfoText;

                 Forma.Color:=clInfoBk;
                 Forma.FormStyle:=fsStayOnTop;
                 Forma.SetBounds(p.x,p.y+Height,Width,16);
                 Application.ProcessMessages;
                 SetFocus;
                 Application.ProcessMessages;
                 PostMessage(Handle,WM_Send_Foco,0,0);
                 Exit;
           end;
      if (Enabled)and(Not ReadOnly)  then
      begin if ((FTipoReader=trDinero) or (FTipoReader=trEntero) )
            then Inherited Text:=SinFormato(0,Text)
            else Inherited Text:=Text;
            SelStart:=0;
            SelLength:=Length(Inherited Text);
            CambioTexto:=False;
      end
      else begin if FTipoReader=trContrato then SetCheckContrato(Inherited Text)
                 else if FTipoReader=trDinero then Inherited Text:=ConFormato(Inherited Text)
                 else if FTipoReader=trEntero then Inherited Text:=Inherited Text
                 else if FTipoReader=trTexto then inherited Text:=ConFormato(Inherited Text);
           end;
      if Assigned(OnEnter) then OnEnter(Self);
end;


Procedure TInterEdit.InternalCambio(Sender:TObject);
begin PintaLabel;
      if Assigned(FOnCambio) then FOnCambio(Sender);
      CambioTexto:=True;
end;

Procedure TInterEdit.InternalSalir(Sender:TObject);
var Forma1:TWRCEdit;
    P:TPoint;
    Anchote:Integer;
    Modificado:Boolean;

Function EstaCancelando(Objeto:TObject):Boolean;
var i:Integer;
    ITF:TInterForma;
    FRM:TForm;
begin if (Objeto is TForm)
      then begin FRM:=TForm(Objeto);
                 For i:=1 to FRM.ComponentCount-1 do
                 begin if FRM.Components[i] is TInterForma
                       then begin Result:=EstaCancelando(FRM.Components[i]);
                                  Exit;
                            end;
                 end;
                 Result:=False;
           end
 else if (Objeto is TInterForma)
      then begin ITF:=TInterForma(Objeto);
                 if ITF.BtnCancelar.Focused
                 then Result:=True
                 else Result:=False;

           end
      else if (Objeto is TControl)
           then begin if (TControl(Objeto).Parent<>nil)
                         then Result:=EstaCancelando(TControl(Objeto).Parent)
                         else Result:=False;
                end;
end;


begin if Forma<>nil
      then begin FormaLabel1.Free; FormaLabel1:=nil;
                 FormaLabel2.Free; FormaLabel2:=nil;
                 Forma.Free; Forma:=nil;
           end;
      if (FUseReType) and (ReCaptura) and (Enabled) and (Not ReadOnly) and (Not EstaCancelando(Self)) and (CambioTexto)
      then begin if Parent<>nil
                 then P:=Parent.ClientToScreen(Point(Left,Top))
                 else begin p.x:=Left;
                            p.y:=Top;
                      end;
                 p.x:=P.X+2;
                 p.y:=P.y+2;

                 Forma1:=TWRCEdit.Create(Self);
                 Try

                 if RetypeLabel<>nil
                 then Forma1.Caption:=RetypeLabel.Caption;

                 Forma1.FormaEdit1:=TInterEdit.Create(Self);
                 Forma1.FormaEdit1.UseDisplay:=UseDisplay;
                 Forma1.FormaEdit1.Parent:=Forma1.PnDos;
                 Forma1.FormaEdit1.DisplayMask:=DisplayMask;
                 Forma1.FormaEdit1.TipoReader:=TipoReader;
                 Forma1.FormaEdit1.MaxLength:=MaxLength;
                 Forma1.FormaEdit1.OnChange:=Forma1.CambioTexto;
                 Anchote:=Width;
                 if (Anchote<(Forma1.Width-8)) then Anchote:=Forma1.Width-8;
                 Forma1.FormaEdit1.SetBounds(1,1,Anchote,Height);
                 Forma1.SetBounds(P.x,p.y-32,Anchote+8,Height+Forma1.Height);
                 Forma1.FormaEdit2:=Self;
                 if Forma1.ShowModal=mrCancel
                    then begin SetFocus;
                               Application.ProcessMessages;
                               CambioTexto:=True;
                               Exit;
                         end;
                 Finally Forma1.Free;
                 end;
           end;
      if FTipoReader=trContrato
         then SetCheckContrato(Inherited Text)
      else
      if FTipoReader=trDinero
         then Inherited Text:=ConFormato(Inherited Text)
      else
      if FTipoReader=trEntero
         then Inherited Text:=ConFormato(Inherited Text)
      else
      if FTipoReader=trTexto
         then Inherited Text:=Inherited Text;
      if Assigned(OnExit) then OnExit(Self);
end;

PRocedure TInterEdit.InternalKeyPress(Sender: TObject; var Key: Char);
var B1:Boolean;
    C1:Char;

Function BuscaNotIn(C:Char; S:String; Inicio,Fin:Integer):Boolean;
var i,Caso:Integer;
begin Result:=False;
      for i:=1 to Length(S) do
      begin if (i>=Inicio+1) and (i<=Fin+1)
            then
            else begin if (S[i]=C) then Result:=True;
                 end;
      end;
end;
begin //SetCheckContrato(Inherited Text);
      if FTipoReader=trContrato
         then begin if (Not (Key in ['0'..'9','-',#0..#08,#10..#30]))or((SelLength=0) and ((FMaxLength<>0) and (Length(Text)>FMaxLength)) and (Key in ['0'..'9','-']) )
                       then begin Key:=#0; MessageBeep(MsgOK); end
              end
      else
      if FTipoReader=trDinero
         then begin if FPositiveOnly then C1:='0' else C1:='-';
                    if (Not (Key in ['0'..'9',C1,'.',#0..#08,#10..#30])) or ((SelLength=0) and ((FMaxLength<>0) and (Length(Text)>FMaxLength)) and (Key in ['0'..'9','-','.']) )
                       or ( (Key='.')  and ( BuscaNotIn(Key,Inherited Text,SelStart,SelStart+SelLength)=True) )
                       then begin Key:=#0; MessageBeep(MsgOK); end;
              end
      else
      if FTipoReader=trEntero
         then begin if FPositiveOnly then C1:='0' else C1:='-';
                    if (Not (Key in ['0'..'9',C1,#0..#08,#10..#30])) or ((SelLength=0) and ((FMaxLength<>0) and (Length(Text)>FMaxLength)) and (Key in ['0'..'9','-'] ) )
                       then begin Key:=#0; MessageBeep(MsgOK); end;
              end
      else
      if FTipoReader=trTexto
         then begin if ( (FMaxLength<>0) and (Length(Text)>FMaxLength) )
                    then begin Key:=#0; MessageBeep(MsgOK);
                         end;
              end;
      if Assigned(OnKeyPress) then OnKeyPress(Self,Key);
      PintaLabel;
end;


Procedure TInterEdit.ActualizaTexto;
begin if FTipoReader=trContrato then SetCheckContrato(Inherited Text);
      if Focused
      then begin SelStart:=0;
                 SelLength:=Length(Inherited Text);
                 CambioTexto:=False;
           end;
end;

Procedure TInterEdit.SetTexto(S:String);
begin if FTipoReader=trContrato
      then begin FTexto:=S;
                 Inherited Text:=FTexto;
                 if S='' then FContrato:=-1;
           end
 else if FTipoReader=trDinero
      then begin FTexto:=SinFormato(0,S);
                 Inherited Text:=ConFormato(FTexto);
           end
 else if FTipoReader=trEntero
      then begin FTexto:=SinFormato(0,S);
                 Inherited Text:=ConFormato(FTexto);
           end
 else if FTipoReader=trTexto
      then begin FTexto:=S;
                 Inherited Text:=FTexto;
           end;
      //SelStart:=1;
      //SelLength:=Length(S);
end;

Function  TInterEdit.GetTexto:String;
begin if FTipoReader=trContrato
      then FTexto:=Inherited Text
      else if FTipoReader=trDinero
           then FTexto:=SinFormato(0,Inherited Text)
      else if FTipoReader=trEntero
           then FTexto:=SinFormato(0,Inherited Text)
      else if FTipoReader=trTexto
           then FTexto:=Inherited Text;
      GetTexto:=FTexto;
end;

procedure TInterEdit.Notification( AComponent : TComponent; Operation : TOperation );
begin inherited;
      if (AComponent=FRetypeLabel) and (Operation=opRemove) then FRetypeLabel:=nil;
end;

Procedure TInterEdit.SetCheckContrato(C:String);
var N,Inicio,Falta,Err:Integer;
    L1,L2,L3:String;
    L:LongInt;
begin Contrato:=-1;
      FContratoValido:=False;
      FCheckContrato:=C;
      //if Length(C)<10 then C:=ILeftZero(C,10);
      if C='' then exit;
      FContratoValido:=True;
      N:=Pos('-',C);
      if N>0
         then begin L1:=Copy(C,1,N-1);
                    Falta:=9-Length(L1);
                    L2:=ILeftZero(Copy(C,N+1,Length(C)),Falta);
                    Val(L1,L,Err);
                    if Err<>0 then begin FContratoValido:=False; Contrato:=-1; exit; end;
                    Val(L2,L,Err);
                    if Err<>0 then begin FContratoValido:=False; Contrato:=-1; exit; end;
                    L3:=L1+L2; //Copy(L2,Inicio,Falta);
                    Prefijo:=L1;
                    Contrato:=StrToInt(L3);
                    if ContratoExiste=False then FCheckContrato:=L3 else FCheckContrato:='';
              end
         else begin Val(C,L,Err);
                    if Err<>0 then begin FContratoValido:=False; exit; end;
                    if Length(C)>=9
                    then begin if Pos(Prefijo,C)=1
                               then Prefijo:=Prefijo
                               else Prefijo:=Copy(C,1,1);
                               Contrato:=StrToInt(C);
                               FCheckContrato:=C;
                               FCheckContrato:='';
                               if ContratoExiste=False
                                  then FCheckContrato:=L3
                                  else FCheckContrato:='';
                         end
                    else begin //L1:=Prefijo; L2:=IRigthZero(C,7);
                               L1:=Prefijo;
                               Falta:=9-Length(L1);
                               L2:=ILeftZero(Copy(C,N+1,Length(C)),Falta);
                               L3:=L1+L2;
                               Prefijo:=L1;
                               Val(L3,L,Err);
                               if Err<>0 then begin FContratoValido:=False; exit; end;
//                               Contrato:=StrToInt(L3);
                               Contrato:=StrToInt(L3);
                               if ContratoExiste=False
                                  then FCheckContrato:=L3
                                  else FCheckContrato:='';
                         end;
              end;
end;


Function ChecaContrato(Var C:String; Var Prefijo:String):Boolean;
var N,Inicio,Falta,Err:Integer;
    L1,L2,L3:String;
    L:LongInt;
begin Result:=False;
      if C='' then exit;
      N:=Pos('-',C);
      if N>0
         then begin L1:=Copy(C,1,N-1);
                    Falta:=9-Length(L1);
                    L2:=ILeftZero(Copy(C,N+1,Length(C)),Falta);
                    Val(L1,L,Err);
                    if Err<>0 then begin Result:=False; exit; end;
                    Val(L2,L,Err);
                    if Err<>0 then begin Result:=False; exit; end;
                    L3:=L1+L2; //Copy(L2,Inicio,Falta);
                    Prefijo:=L1;
                    C:=L3;
                    Exit;
              end
         else begin Val(C,L,Err);
                    if Err<>0 then begin C:=''; exit; end;
                    if Length(C)>=9
                    then begin if Pos(Prefijo,C)=1
                               then Prefijo:=Prefijo
                               else Prefijo:=Copy(C,1,1);
                               C:=C;
                               Exit;
                         end
                    else begin L1:=Prefijo;
                               Falta:=9-Length(L1);
                               L2:=ILeftZero(Copy(C,N+1,Length(C)),Falta);
                               L3:=L1+L2;
                               Prefijo:=L1;
                               Val(L3,L,Err);
                               if Err<>0 then begin C:=''; exit; end;
                               C:=L3;
                               Exit;
                         end;
              end;
         C:='';
end;








procedure TWRCEdit.Button1Click(Sender: TObject);
begin if FormaEdit1.Text=FormaEdit2.Text
      then ModalResult:=mrOK
      else begin MessageBeep(0);
                 Panel2.Caption:='No es Igual.';
                 Panel2.Font.Color:=clWhite;
                 Panel2.Color:=clRed;
           end;
end;

procedure TWRCEdit.Button2Click(Sender: TObject);
begin ModalResult:=mrCancel;
end;

Procedure TWRCEdit.CMDialogKey(Var Msg:TCMDialogKey);
begin if Msg.CharCode<>VK_TAB
         then Inherited
         else begin Button1Click(nil);
              end;
end;

procedure TWRCEdit.FormCreate(Sender: TObject);
begin FormaEdit1:=nil;
      FormaEdit2:=nil;
end;

procedure TWRCEdit.FormShow(Sender: TObject);
begin if FormaEdit1<>nil then FormaEdit1.SetFocus;
end;

Procedure TWRCEdit.CambioTexto(Sender:TObject);
begin  Panel2.Caption:='';
       Panel2.Color:=clBtnFace;
       Panel2.Font.Color:=clBtnText;
end;


end.

