unit InterMemo;
//-------------------------------------------------------------
// Sistema         :   MacvMemo
// Date            :   Noviembre de 1997
// Fecha de Inicio :   Noviembre de 1997
// Función forma   :   MacvMemo
// Desarrollo por  :   Víctor Martínez Castro MACV.
// Comentarios     :
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------



interface

uses   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Quickrpt, QrCtrls;


type
  TQRMacvMemo = class(TQRPrintable)
  private
    FOnPrepare:TNotifyEvent;
    FLineas   :TStrings;
    FParametro:TStrings;
    LinNum:Integer;
    StrLinNum:String;
    procedure SetLineas(Value : TStrings);
    Procedure SetParametro(Value:TStrings);
  public
    constructor Create(AOwner : TComponent); override;
    Destructor Destroy; override;
    procedure Paint; override;
    procedure Print(OfsX, OfsY : integer); override;
    Procedure InicializaParser;
    Function  DameCaracter:String;
    Function ChecaCaracter:String;
    Function  DamePalabra:String;
    Procedure JustificaTexto(eCanvas:TCanvas; X1,Y1,X2,Y2:LongInt);
    Function Checa(S:String):String;
    Procedure CambioStrings(Sender:TObject);
    Procedure CambioParametro(Sender:TObject);
    Procedure SetParam(Numero:Integer; Valor:String);
  published
    Property Textos:TStrings Read FLineas Write SetLineas;
    Property Parametro:TStrings Read FParametro Write SetParametro;
    Property OnPrepare:TNotifyEvent Read FOnPrepare Write FOnPrepare;
//   property Alignment;
    property AlignToBand;
    property Color;
    property Font;
    property ParentFont;
  end;
  TQRInterMemo = Class(TQRMacvMemo)
  end;

procedure Register;

implementation

{$R *.DCR}

procedure TQRMacvMemo.SetLineas(Value : TStrings);
begin FLineas.Assign(Value);
end;

procedure TQRMacvMemo.SetParametro(Value : TStrings);
begin FParametro.Assign(Value);
end;


Procedure TQRMacvMemo.SetParam(Numero:Integer; Valor:String);
var i:Integer;
begin if Numero<0 then exit;
      if (FParametro.Count-1)<Numero then
      begin for i:=FParametro.Count to Numero do
            FParametro.Add('');
      end;
      FParametro[Numero]:=Valor;
end;

constructor TQRMacvMemo.Create(AOwner : TComponent);
begin inherited Create(AOwner);
      FLineas:=TStringList.Create;
      FLineas.Clear;
      TStringList(FLineas).OnChange:=CambioStrings;
      FLineas.Add('Texto');
      TStringList(FParametro):=TStringList.Create;
      FParametro.Clear;
      TStringList(FParametro).OnChange:=CambioParametro;
end;

Procedure TQRMacvMemo.CambioStrings(Sender:TObject);
begin Invalidate;
end;

Procedure TQRMacvMemo.CambioParametro(Sender:TObject);
begin Invalidate;
end;


Destructor TQRMacvMemo.Destroy;
begin if FLineas<>nil then FLineas.Free;  FLineas:=nil;
      if FParametro<>nil then FParametro.Free; FParametro:=nil;
      Inherited;
end;


procedure TQRMacvMemo.Paint;
begin Inherited Paint;
      JustificaTexto(Canvas,0,0,Width,Height);
end;

Procedure TQRMacvMemo.InicializaParser;
begin LinNum:=-1; StrLinNum:='';
end;


Function TQRMacvMemo.Checa(S:String):String;
var Lin,Err,Max,i:Integer;
    eS:String;
    Salida:String;

begin i:=1;
      S:=TrimRight(S);
      if S<>'' then S:=S+' ';
      Salida:='';
      Max:=Length(S);
      While (i<=Max) do
      begin if (S[i]='@') and ((i+1)<Max) and (S[i+1]='@')
            then begin Inc(i,2);
                       eS:='';
                       While (i<=Max) and (S[i]<>'@') do
                       begin eS:=eS+S[i];
                             Inc(i);
                       end;
                       Val(eS,Lin,Err);
                       if (Err=0)and(es<>'') then
                       begin if Lin<=FParametro.Count-1
                             then Salida:=Salida+FParametro[Lin]
                             else Salida:=Salida+'<<ERROR PARAMETRO '+ IntToStr(Lin)+ ' NO EXISTE';
                       end;
                 end
            else Salida:=Salida+S[i];
            Inc(i);
      end;
      if Salida='' then Salida:=#13;
      Checa:=Salida;
end;

Function TQRMacvMemo.ChecaCaracter:String;
var AuxLinNum:Integer;
    AuxStrLinNum:String;
begin AuxLinNum:=LinNum;
      AuxStrLinNum:=StrLinNum;
      if AuxStrLinNum='' then
      begin Inc(AuxLinNum);
            if  (AuxLinNum+1)>FLineas.Count then
            begin ChecaCaracter:=#30;
                  Exit;
            end;
            AuxStrLinNum:=Checa(FLineas[AuxLinNum]);
            if AuxStrLinNum='' then begin ChecaCaracter:=#13; exit; end;
      end;
      ChecaCaracter:=Copy(AuxStrLinNum,1,1);
end;


Function TQRMacvMemo.DameCaracter:String;
begin if StrLinNum='' then
      begin Inc(LinNum);
            if (LinNum+1)>FLineas.Count then
            begin DameCaracter:=#30;
                  Exit;
            end;
            StrLinNum:=Checa(FLineas[LinNum]);
            if StrLinNum='' then begin DameCaracter:=#13; exit; end;
      end;
      DameCaracter:=Copy(StrLinNum,1,1);
      StrLinNum:=Copy(StrLinNum,2,Length(StrLinNum));
end;

Function TQRMacvMemo.DamePalabra:String;
var Ch:String;
    Salir:Boolean;
    Palabra:String;
    CasiSalir:Boolean;
begin Palabra:='';
      Salir:=False;
      CasiSalir:=False;
      Repeat Ch:=ChecaCaracter;
             if CH=#30 then
                begin if Palabra='' then Palabra:=DameCaracter;
                      Salir:=True;
                end
             else
             if CH=#13 then
                begin if Palabra='' then Palabra:=DameCaracter;
                      Salir:=True;
                end
             else begin if (Ch<>' ') and (CasiSalir)
                        then begin Salir:=True;
                             end
                        else
                        begin Palabra:=Palabra+DameCaracter;
                              if CH=' ' then CasiSalir:=True;
                        end;
                  end;
      Until (Salir);
      DamePalabra:=Palabra;
end;


Procedure TQRMacvMemo.JustificaTexto(eCanvas:TCanvas; X1,Y1,X2,Y2:LongInt);
Var
  Palabra:String;
  X,Y:Integer;
  APal:Array[0..1000] of String;
  MaxPal:Integer;
  IncRenglon:Integer;

Procedure ImprimeNormal;
var i:Integer;
    s:string;
begin S:='';
      for i:=0 to MaxPal do
      begin S:=S+APal[i];
      end;
      eCanvas.TextOut(X1,Y,S);
      Inc(Y,IncRenglon);
      X:=X1;
      if (Palabra<>#13)and(Palabra<>#30) then
      begin MaxPal:=0; APal[MaxPal]:=Palabra;
      end
      else MaxPal:=-1;
end;

Procedure ImprimeSeparado;
var I:Integer;
    Falta:LongInt;
    s:string;
    Xn:LongInt;
    Separa:Real;
    XReal:Real;
begin S:='';
      X:=X1;
      if MaxPal>0 then
      begin //eCanvas.Rectangle(X-2,Y-2,X+Canvas.TextWidth(APal[0])+2,Y+IncRenglon-1+2);
            eCanvas.TextOut(X,Y,APal[0]);
            X:=X+eCanvas.TextWidth(APal[0])+2;
      end;
      Xn:=X; //X2;
      if MaxPal>=1 then
      begin eCanvas.TextOut(X2-eCanvas.TextWidth(APal[MaxPal]),Y,APal[MaxPal]);
            Xn:=X2-eCanvas.TextWidth(APal[MaxPal]);
      end;

      if MaxPal>1 then
      begin for i:=1 to MaxPal-1 do
            begin X:=X+eCanvas.TextWidth(APal[i])+2;
            end;
            Falta:=(Xn-X);
            if Falta<=0 then Separa:=0 else
            if MaxPal<=1 then Separa:=0 else Separa:=Falta/MaxPal;
            XReal:=Xn;
            for i:=MaxPal-1 downto 1 do
            begin XReal:=XReal-(eCanvas.TextWidth(APal[i])+2+Separa);
                  //eCanvas.Rectangle(Xn,Y,Xn+Canvas.TextWidth(APal[i]),Y+IncRenglon-1);
                  eCanvas.TextOut(Trunc(XReal),Y,APal[i]);
            end;
            Xn:=Trunc(XReal);
      end;
      Inc(Y,IncRenglon);
      FillChar(APal,Sizeof(Apal),0);
      X:=X1;
      if (Palabra<>#13)and(Palabra<>#30) then
      begin MaxPal:=0; APal[MaxPal]:=Palabra;
            X:=X+eCanvas.TextWidth(Palabra);
      end
      else MaxPal:=-1;
end;


begin eCanvas.Font.Assign(Font);
      SetTextAlign(eCanvas.Handle, TA_Left + TA_Top + TA_NoUpdateCP);
      eCanvas.Brush.Style := bsSolid;
      eCanvas.Brush.Color := Color;
      if eCanvas.Font.Size <> round(Font.Size * Zoom / 100)
      then eCanvas.Font.Size := round(Font.Size * Zoom / 100);
//      eCanvas.Rectangle(X1,Y1,X2,Y2);

      if Assigned(FOnPrepare) then FOnPrepare(Self);
      IncRenglon:=Round(eCanvas.TextHeight('M')*1.1);

      InicializaParser;
(*      X1:=X1+Round(Canvas.TextWidth('j')*0.5);
      Y1:=Y1+Round(Canvas.TextHeight('j')*0.1);
      X2:=X2-Round(Canvas.TextWidth('j')*0.5);
      Y2:=Y2-Round(Canvas.TextHeight('j')*0.1);
      Canvas.Rectangle(X1,Y1,X2,Y2);
*)

      X:=X1; Y:=Y1;
      FillChar(APal,Sizeof(Apal),0);
      MaxPal:=-1;
      Repeat Palabra:=DamePalabra;
             if Palabra=#13 then
             begin ImprimeNormal;
             end
             else
             if Palabra=#30 then
             begin ImprimeNormal;
             end
             else begin X:=X+eCanvas.TextWidth(Palabra)+2;
                        if X>=X2
                        then begin ImprimeSeparado;
                             end
                        else begin Inc(MaxPal);
                                   APal[MaxPal]:=Palabra;
                             end;
                end;
      Until (Palabra=#30);
end;




procedure TQRMacvMemo.Print(OfsX, OfsY : integer);
var
  CalcLeft,
  CalcTop,
  CalcRight,
  CalcBottom : Longint;
begin
//  ParentReport.QRPrinter.Alignment:=Alignment;
//  ParentReport.QRPrinter.Alignment:=Alignment;
  with ParentReport.QRPrinter do
  begin
    CalcLeft := XPos(OfsX + Size.Left);
    CalcTop := YPos(OfsY + Size.Top);
    CalcRight := XPos(OfsX + Size.Left + Size.Width);
    CalcBottom := YPos(OfsY + Size.Top + Size.Height);
    Alignment := taLeftJustify;
    JustificaTexto(ParentReport.QRPrinter.Canvas, CalcLeft, CalcTop, Calcright, CalcBottom);
  end;
end;

procedure Register;
begin //RegisterComponents('QReport', [TQRMacvMemo]);
      RegisterComponents('Inter', [TQRInterMemo]);
end;


end.
