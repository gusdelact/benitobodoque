unit wwStacks;
{
//
// Simple stack classes to support the parsing of table filters
//
// Copyright (c) 1995, 1998 by Woll2Woll Software
//
}

interface
   uses classes;
type
{   TNode = Class;
   PTNode = ^TNode;
}
   TStackStr = class
    private
      list: TStringList;
    public
      procedure push(s: string);
      function pop: string;
      constructor create;
      destructor destroy; override;
      function count: integer;
   end;

   TStackPtr = class
    private
      list: TList;
    public
      procedure push(s: Pointer);
      function pop: Pointer;
      constructor create;
      destructor destroy; override;
      function count: integer;
    end;

implementation

constructor TStackStr.create;
begin
   list:= TStringList.create;
   list.sorted:= False;
end;

destructor TStackStr.destroy;
begin
   list.free;
   list:= Nil;
end;

Function TStackStr.count: integer;
begin
   result:= list.count;
end;

procedure TStackStr.push(s: string);
begin
    list.add(s);
end;

function TStackStr.pop: string;
begin
   if list.count=0 then
      result:= ''
   else begin
      result:= list[list.count-1];
      list.delete(list.count-1);
   end
end;

constructor TStackPtr.create;
begin
   list:= TList.create;
end;

Function TStackPtr.count: integer;
begin
   result:= list.count;
end;

destructor TStackPtr.destroy;
begin
   list.free;
   list:= Nil;
end;

procedure TStackPtr.push(s: Pointer);
begin
    list.add(s);
end;

function TStackPtr.Pop: Pointer;
begin
   if list.count=0 then
      result:= Nil
   else begin
      result:= list[list.count-1];
      list.delete(list.count-1);
   end
end;

end.
