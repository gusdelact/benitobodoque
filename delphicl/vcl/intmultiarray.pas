unit IntMultiArray;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;




Type TMultiArray=Class(TPersistent)
                 Private
                  FLista:TList;
                  FKeySeek:Integer;
                  FSeekPos:Integer;
                  FKeyCol :Integer;
                  FKeyStr :String;
                  Function GetCell(Index:Integer):TStringList;
                  Procedure SetCell(Index:Integer; Value:TStringList);
                  Function GetCount:Integer;
                 Public
                  IsError:Boolean;
                  Constructor Create; Virtual;
                  Destructor Destroy; override;
                  Procedure  Clear;
                  Function Add(Const Datos:Array of Const):Integer;
                  Function AddList(Lista:TStringList):Integer;
                  Function FindKeyCol(Value:String; NumCol:Integer):Integer;
                  Function FindFirst(Value:String; NumCol:Integer):Integer;
                  Function FindNext:Integer;
                  Function OpenFilter(Value:String; NumCol:Integer):TMultiArray;
                  Function Tx(NumCol:Integer):String;

                  Procedure First;
                  Procedure Next;
                  Function  EOF:Boolean;


                  Property Items[Index:Integer]:TStringList Read GetCell Write SetCell;
                  Property Count:Integer Read GetCount;
                 Published
                 end;


implementation	


Constructor TMultiArray.Create;
begin Inherited;
      FLista:=TList.Create; FLista.Clear;
      FKeySeek:=0;
      IsError:=False;
end;

Destructor TMultiArray.Destroy;
begin Clear;
      if FLista<>nil then FLista.Free; FLista:=nil;
      Inherited;
end;

Function TMultiArray.GetCount:Integer;
begin GetCount:=FLista.Count;
end;

Procedure TMultiArray.Clear;
var i:Integer;
    T:TStringList;
    Obj:TObject;
begin For i:=0 to FLista.Count-1 do
      begin Obj:=FLista[I];
            if (Obj<>nil) and (Obj Is TStringList)
            then begin TStringList(FLista[I]).Free;
                 end;
      end;
      FLista.Clear;
end;


Function TMultiArray.Tx(NumCol:Integer):String;
var T:TStringList;
begin Result:=''; IsError:=True;
      if FKeySeek=-1 then begin exit; end;
      if (FKeySeek<0) or (FKeySeek>(FLista.Count-1))
      then Exit
      else begin T:=FLista[FKeySeek];
                 if (T<>nil)
                 then begin if ((T.Count-1)>=NumCol)
                            then begin Result:=T[NumCol];
                                       IsError:=False;
                                       Exit;
                                 end;
                      end;
           end;
end;


Function TMultiArray.Add(Const Datos:Array of Const):Integer;
var S:String;
    i:Integer;
    Lista:TStringList;
begin Result:=-1;
  Lista:=TStringList.Create; Lista.Clear;
  Try
      for i:=0 to High(Datos) do
      begin S:='';
            with Datos[I] do
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
           Lista.Add(S);
       end; {For}
       Result:=AddList(Lista);
   Finally Lista.Free;
   end;
end;


Function TMultiArray.FindFirst(Value:String; NumCol:Integer):Integer;
var i:Integer;
    T:TStringList;
begin FKeySeek:=0;
      FKeyCol:=NumCol;
      FKeyStr:=Value;
      for i:=FKeySeek to FLista.Count-1 do
      begin T:=FLista[I];
            if (T.Count-1>=NumCol)
            then if (T[NumCol]=FKeyStr)
                 then begin Result:=I;
                            FKeySeek:=I;
                            Exit;
                      end;
      end;
      FKeySeek:=FLista.Count-1;
      Result:=-1;
end;


Function TMultiArray.FindNext:Integer;
var i:Integer;
    T:TStringList;
begin for i:=FKeySeek+1 to FLista.Count-1 do
      begin T:=FLista[I];
            if (T.Count-1>=FKeyCol)
            then if (T[FKeyCol]=FKeyStr)
                 then begin Result:=I;
                            FKeySeek:=I;
                            Exit;
                      end;

      end;
      FKeySeek:=FLista.Count-1;
      Result:=-1;
end;




Function TMultiArray.FindKeyCol(Value:String; NumCol:Integer):Integer;
var i:Integer;
    T:TStringList;
begin for i:=0 to FLista.Count-1 do
      begin T:=FLista[I];
            if (T.Count-1>=NumCol)
            then if (T[NumCol]=Value)
                 then begin Result:=I;
                            Exit;
                      end;

      end;
      Result:=-1;
end;


Function TMultiArray.AddList(Lista:TStringList):Integer;
var AuxLista:TStringList;
    I:Integer;
begin Result:=-1;
      AuxLista:=TStringList.Create;
      AuxLista.Text:=Lista.Text;
      I:=FLista.Add(AuxLista);
      Result:=I;
end;


Function TMultiArray.GetCell(Index:Integer):TStringList;
begin if (Index<0) or (Index>(FLista.Count-1))
      then ShowMessage('Error el Registro '+IntToStr(Index)+' NO existe')
      else Result:=FLista[Index];
end;


Procedure TMultiArray.SetCell(Index:Integer; Value:TStringList);
var AuxLista:TStringList;
begin if (Index<0) or (Index>(FLista.Count-1))
      then ShowMessage('Error el Registro '+IntToStr(Index)+' NO existe')
      else begin TStringList(FLista[Index]).Text:=Value.Text;
           end;
end;


Function TMultiArray.OpenFilter(Value:String; NumCol:Integer):TMultiArray;
var i:Integer;
    T:TStringList;
    Arr:TMultiArray;
begin Arr:=TMultiArray.Create;
      for i:=0 to FLista.Count-1 do
      begin T:=FLista[I];
            if ((T.Count-1)>=NumCol)
            then if (T[NumCol]=Value)
                 then begin Arr.AddList(T);
                      end;

      end;
      Result:=Arr;
end;


Procedure TMultiArray.First;
begin FKeySeek:=0;
end;

Procedure TMultiArray.Next;
begin Inc(FSeekPos);
end;

Function TMultiArray.EOF:Boolean;
begin EOF:=(FSeekPos>(FLista.Count-1));
end;





end.
