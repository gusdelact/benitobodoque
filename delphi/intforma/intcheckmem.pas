unit IntCheckMem;
interface
uses  Forms, DBtables,SysUtils,DB, Classes, Controls, StdCtrls, Graphics, Messages, dialogs;



Const vgCheckMemList   : TList = nil;
      vgCheckMemName   : TStringList = nil;
      vgCheckMemData   : TStringList = nil;
      vgUseCheckMem    : Boolean = False;

Type TCheckMemQuery=Class(TQuery)
         Constructor CreateMio(AOwner:TComponent; SQL:String); Virtual;
         Destructor  Destroy; override;
      end;

Type TCheckMemStoredProc=Class(TStoredProc)
         Constructor CreateMio(AOwner:TComponent; StpName:String); Virtual;
         Destructor  Destroy; override;
      end;


Procedure MemCheckStart;
Procedure MemCheckDestroy;
Procedure MemCheckReset;
Procedure MemCheckShow;
Procedure MemCheckAdd(eObject:TObject; ObjName:String; Data:String);
Procedure MemCheckRemove(eObject:TObject);



implementation


Constructor TCheckMemQuery.CreateMio(AOwner:TComponent; SQL:String);
begin Inherited Create(AOwner);
      MemCheckAdd(Self,'Query',SQL);
end;


Destructor  TCheckMemQuery.Destroy;
begin MemCheckRemove(Self);
      Inherited;
end;


Constructor TCheckMemStoredProc.CreateMio(AOwner:TComponent; StpName:String);
begin Inherited Create(AOwner);
      MemCheckAdd(Self,'StoredProc',StpName);
end;


Destructor  TCheckMemStoredProc.Destroy;
begin MemCheckRemove(Self);
      Inherited;
end;


Procedure MemCheckStart;
begin MemCheckReset;
      vgUseCheckMem:=True;
end;

Procedure MemCheckDestroy;
begin if vgCheckMemList<>nil then vgCheckMemList.Free;
      if vgCheckMemName<>nil then vgCheckMemName.Free;
      if vgCheckMemData<>nil then vgCheckMemData.Free;
end;

Procedure MemCheckReset;
begin if vgCheckMemList=nil then vgCheckMemList:=TList.Create;
      if vgCheckMemName=nil then vgCheckMemName:=TStringList.Create;
      if vgCheckMemData=nil then vgCheckMemData:=TStringList.Create;
      vgCheckMemList.Clear;
      vgCheckMemName.Clear;
      vgCheckMemData.Clear;
end;

Function SinEnter(S:String):String;
var Ss:String;
    i:Integer;
begin SS:='';
      for i:=1 to Length(S) do
      begin if S[i]=#13 then SS:=SS+'<#13>'
            else if S[i]=#10 then SS:=SS+'<#10>'
            else SS:=SS+S[i];
      end;
      Result:=SS;
end;
Procedure MemCheckShow;
var Forma:TForm;
    Memo1:TMemo;
    Memo2:TMemo;
    i:Integer;
begin Forma:=TForm.Create(nil);
      Try Forma.SetBounds(10,10,300,300);

          Memo1:=TMemo.Create(Forma);
          Memo1.Parent:=Forma;
          Memo1.SetBounds(10,10,300,200);
          Memo1.Align:=alTop;
          Memo1.WordWrap:=False;
          Memo1.Lines.Clear;

          For i:=0 to vgCheckMemName.Count-1 do
          begin Memo1.Lines.Add(IntToStr(i)+':'+vgCheckMemName.Strings[i]);
          end;


          Memo2:=TMemo.Create(Forma);
          Memo2.Align:=alClient;
          Memo2.Parent:=Forma;
          Memo2.WordWrap:=False;

          For i:=0 to vgCheckMemData.Count-1 do
          begin Memo2.Lines.Add(IntToStr(i)+':'+'['+Copy(SinEnter(vgCheckMemData.Strings[i]),1,240)+']');
          end;

          //Memo2.SetBounds(10,10,300,200);
          Forma.Caption:='Resultado de Scaneo de Memoria';
          Forma.ShowModal;
      Finally Forma.Free;
      end;
end;

Procedure MemCheckAdd(eObject:TObject; ObjName:String; Data:String);
begin if vgCheckMemList.IndexOf(eObject)<>-1
      then begin vgCheckMemList.Add(eObject);
                 vgCheckMemName.Add('Error Doble Asignado '+SinEnter(ObjName));
                 vgCheckMemData.Add(SinEnter(Data));
           end
      else begin vgCheckMemList.Add(eObject);
                 if eObject is TObject
                 then vgCheckMemName.Add(ObjName+'['+eObject.ClassName+']')
                 else vgCheckMemName.Add(SinEnter(ObjName)+'[Sin Tipo]');
                 vgCheckMemData.Add(SinEnter(Data));
           end;
end;

Procedure MemCheckRemove(eObject:TObject);
var Id:Integer;
begin Id:=vgCheckMemList.IndexOf(eObject);
      if Id<>-1
      then begin vgCheckMemList.Delete(Id);
                 vgCheckMemName.Delete(Id);
                 vgCheckMemData.Delete(Id);
           end
      else begin ShowMessage('No Existe Objeto');
           end;
end;


end.
