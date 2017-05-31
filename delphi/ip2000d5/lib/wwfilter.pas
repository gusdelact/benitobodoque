unit wwfilter;
{
//
// Parse filter expression and convert to BDE data structure
//
// Copyright (c) 1995, 1998 by Woll2Woll Software
//
// 6/17/95 - Fixed bug in filtering DateTime fields
// 6/21/95 - Support international characters >vk_scroll, AnsiToNative
// 1/13/99 - Support Auto-increment fields
}

interface
uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, StdCtrls,
  Forms, {DsgnIntf, }dialogs, dbtables, db, wwstacks, wwstr,

{$IFDEF WIN32}
bde
{$ELSE}
dbiprocs, dbiTypes, dbierrs
{$ENDIF}
;


Function wwSetFilter(a_line: string; table: TTable;
    var fh: hDBIFilter; InOpen: boolean): boolean;
Function wwAddFilter(a_line: string; table: TTable; var fh: hDBIFilter): boolean;
Procedure wwRemoveFilter(table: TDBDataSet; var fh: hDBIFilter);
Function wwSetFilterFunction(func: Pointer; table: TDBDataSet; var fh: hDBIFilter): boolean;

implementation


const
{$ifdef win32}
   TFilterNodeClassSize = 14;
   TFilterHeaderClassSize = 10;
{$else}
   TFilterNodeClassSize = 10;
   TFilterHeaderClassSize = 10;
{$endif}

type

{$ifdef win32}
TFilterNodeClass = record
   filterNodeType: integer;
   operation: integer;
   data1: word;
   data2: word;
   data3: word;
end;
{$else}
TFilterNodeClass = record
   filterNodeType: word;
   operation: word;
   data1: word;
   data2: word;
   data3: word;
end;
{$endif}

TFilterHeaderClass = record
   iVersion: word;
   iTotalSize: word;
   iNodes: word;
   iNodeStart: word;
   iLiteralStart: word;
end;

PTFilterNodeClass = ^TFilterNodeClass;
PTfilterHeaderClass = ^TFilterHeaderClass;


type PByte = ^Byte;
     TParseState = (None, ExpectingLogical);
     SmallString = string[64];  { Use small string to minimize stack use }
     WordArray = Array [0..1000] of word;
var
   enginePtr, filterHeaderPtr, filterBufferPtr, literalsPtr: PByte;
   engineSize: integer;  { size allocated for engine data structor }

   traverseStr: string;
   curBinaryNodeCount: integer;
   literalOffset: integer;
   fieldCount: integer;
   dbTable: TDBDataSet;
   parseState: TParseState;

procedure MakeEnginePtr;
begin
    engineSize:= TFilterHeaderClassSize + (curBinaryNodeCount * TFilterNodeClassSize) + 1000;

    enginePtr:= AllocMem(engineSize);

    filterHeaderPtr:= enginePtr;

    filterBufferPtr:= enginePtr;
    inc(filterBufferPtr, TFilterHeaderClassSize + (curBinaryNodeCount * TFilterNodeClassSize));

    literalsPtr:= enginePtr;
    inc(literalsPtr, TFilterHeaderClassSize + curBinaryNodeCount * TFilterNodeClassSize);

end;

procedure FreeEnginePtr;
begin
    FreeMem(enginePtr, engineSize);
end;

Function isRelOp(token : string): boolean;
begin
   result:=
	((token='<') or
	(token='<>') or
	(token='<=') or
	(token='>=') or
	(token='=') or
	(token='>'));
end;

type
   TNodeType = (Relational, Logical, Arithmetic, Variable);
   TDataType = (dtUnknown, dtString, dtFloat, dtDateTime, dtDate, dtTime,
                dtBoolean, dtInteger, dtBCD, dtSmallInt);

TNode = Class;
{PTNode = ^TNode;}

TNode = Class
  private
    nodeType: TNodeType;
    dataType: TDataType;
    bcdSize: integer;
    nodeOperator: string;
    nodeOffset: integer;   { Set when traverse is called}
    child1: TNode;
    child2: TNode;

  public
    constructor create(a_NodeType: TNodeType;
         a_nodeOperator: string; a_child1: TNode; a_child2: TNode;
         a_dataType: TDataType);
    destructor destroy; override;
    Function nodeCount: integer;
    Procedure traverse;
    procedure addBinaryNode(a_operation: CanOp);
    procedure addFieldNode(fieldName: string);
    procedure addConstantBCDNode(constantValue: string;
              ADataType: TDataType; bcdSize: integer);
    procedure addConstantFloatNode(constantValue: string);
    procedure addConstantStringNode(constantValue: string);
    procedure addConstantDateTimeNode(constantValue: string);
    procedure addConstantDateNode(constantValue: string);
    procedure addConstantTimeNode(constantValue: string);
    procedure addConstantSmallIntNode(constantValue: string);
    procedure addConstantIntegerNode(constantValue: string);
    procedure addConstantBooleanNode(constantValue: string);
end;

constructor TNode.create(a_NodeType: TNodeType;
         a_nodeOperator: string; a_child1: TNode; a_child2: TNode;
         a_dataType: TDataType);
begin
   nodeType:= a_nodeType;
   dataType:= dtUnknown;
   nodeOperator:= a_nodeOperator;
   child1:= a_child1;
   child2:= a_child2;
   bcdSize:= 0;
end;

destructor TNode.destroy;
begin
   child1.free;
   child2.free;
end;

Function TNode.NodeCount: integer;
var count: integer;
begin
   count:= 1;
   if (child1<>Nil) then count:= count + child1.nodeCount;
   if (child2<>Nil) then count:= count + child2.nodeCount;
   result:= count;
end;

Procedure TNode.addFieldNode(fieldName: string);
var
   fieldNameStr: PChar;
begin
   fieldNameStr:= StrAlloc(256);
   StrPCopy(fieldNameStr, fieldName);

   Dec(curBinaryNodeCount,1);
   Inc(fieldCount, 1);

   Dec(FilterBufferPtr, TFilterNodeClassSize);
   PTFilterNodeClass(FilterBufferPtr)^.data1 := fieldCount;
   PTFilterNodeClass(FilterBufferPtr)^.data2 := literalOffset;
{$ifdef win32}
   PTFilterNodeClass(FilterBufferPtr)^.filterNodeType := Integer(nodeField);
   PTFilterNodeClass(FilterBufferPtr)^.operation := Integer(canField2);
{$else}
   PTFilterNodeClass(FilterBufferPtr)^.filterNodeType := Word(nodeField);
   PTFilterNodeClass(FilterBufferPtr)^.operation := Word(canField2);
{$endif}
   nodeOffset := curBinaryNodeCount*TFilterNodeClassSize;

   AnsiToNative((DBTable as TTable).Database.Locale,
          FieldName, PChar(literalsPtr), 255 {MaxLen}); { Convert to locale }

   inc(literalsPtr, length(fieldName)+1);
   inc(literalOffset, length(fieldName)+1);

   strDispose(fieldNameStr);
end;

procedure TNode.addConstantStringNode(constantValue: string);
var
   constantValueStr: PChar;
begin
   constantValueStr:= StrAlloc(256);
   StrPCopy(constantValueStr, constantValue);

   Dec(curBinaryNodeCount);
   Dec(FilterBufferPtr, TFilterNodeClassSize);

{$ifdef win32}
   PTFilterNodeClass(FilterBufferPtr)^.filterNodeType := Integer(nodeConst);
   PTFilterNodeClass(FilterBufferPtr)^.operation := Integer(canConst2);
   PTFilterNodeClass(FilterBufferPtr)^.data1 := fldZString;
   PTFilterNodeClass(FilterBufferPtr)^.data2 := length(constantValue)+1;
   PTFilterNodeClass(FilterBufferPtr)^.data3 := literalOffset;
{$else}
   PTFilterNodeClass(FilterBufferPtr)^.filterNodeType := Word(nodeConst);
   PTFilterNodeClass(FilterBufferPtr)^.operation := Word(canConst2);
   PTFilterNodeClass(FilterBufferPtr)^.data1 := Word(fldZString);
   PTFilterNodeClass(FilterBufferPtr)^.data2 := length(constantValue)+1;
   PTFilterNodeClass(FilterBufferPtr)^.data3 := literalOffset;
{$endif}

   nodeOffset := curBinaryNodeCount*TFilterNodeClassSize;

   AnsiToNative((DBTable as TTable).Database.Locale,
          ConstantValue, PChar(literalsPtr), 255 {MaxLen}); { Convert to locale }
   inc(literalsPtr, length(constantValue)+1);
   inc(literalOffset, length(constantValue)+1);

   strDispose(ConstantValueStr);
end;

procedure TNode.addConstantFloatNode(constantValue: string);
var f: Double;
begin
   dec(curBinaryNodeCount);

   Dec(FilterBufferPtr, TFilterNodeClassSize);
   PTFilterNodeClass(FilterBufferPtr)^.filterNodeType := Word(nodeConst);
   PTFilterNodeClass(FilterBufferPtr)^.operation := Word(canConst2);
   PTFilterNodeClass(FilterBufferPtr)^.data1 := Word(fldFloat);
   PTFilterNodeClass(FilterBufferPtr)^.data2 := 8;
   PTFilterNodeClass(FilterBufferPtr)^.data3 := literalOffset;

   nodeOffset := curBinaryNodeCount*TFilterNodeClassSize;

   f := strToFloat(constantValue);
   move(f, literalsPtr^, 8);
   inc(literalsPtr, 8);
   inc(literalOffset, 8);

end;

procedure TNode.addConstantBCDNode(constantValue: string;
          ADataType: TDataType; bcdSize: integer);
var f: Double;
    bcd: FmtBCD;
    bcdPhySize: integer;
begin
   dec(curBinaryNodeCount);

   Dec(FilterBufferPtr, TFilterNodeClassSize);
   bcdPhySize:= sizeOf(bcd);
   PTFilterNodeClass(FilterBufferPtr)^.filterNodeType := Word(nodeConst);
   PTFilterNodeClass(FilterBufferPtr)^.operation := Word(canConst2);
   PTFilterNodeClass(FilterBufferPtr)^.data1 := Word(fldBCD);
   PTFilterNodeClass(FilterBufferPtr)^.data2 := bcdPhySize;
   PTFilterNodeClass(FilterBufferPtr)^.data3 := literalOffset;

   nodeOffset := curBinaryNodeCount*TFilterNodeClassSize;

   f := strToFloat(constantValue);
   dbiBCDFromFloat(f, 32, bcdSize, bcd);
   move(bcd, literalsPtr^, bcdPhySize);
   inc(literalsPtr, bcdPhySize);
   inc(literalOffset, bcdPhySize);

end;

procedure TNode.addConstantIntegerNode(constantValue: string);
var n: longint;
begin
   dec(curBinaryNodeCount);

   Dec(FilterBufferPtr, TFilterNodeClassSize);
   PTFilterNodeClass(FilterBufferPtr)^.filterNodeType := Word(nodeConst);
   PTFilterNodeClass(FilterBufferPtr)^.operation := Word(canConst2);
   PTFilterNodeClass(FilterBufferPtr)^.data1 := Word(fldInt32);
   PTFilterNodeClass(FilterBufferPtr)^.data2 := 4;
   PTFilterNodeClass(FilterBufferPtr)^.data3 := literalOffset;

   nodeOffset := curBinaryNodeCount*TFilterNodeClassSize;

   n := strToInt(constantValue);
   move(n, literalsPtr^, 4);
   inc(literalsPtr, 4);
   inc(literalOffset, 4);

end;

procedure TNode.addConstantSmallIntNode(constantValue: string);
var n: longint;
begin
   dec(curBinaryNodeCount);

   Dec(FilterBufferPtr, TFilterNodeClassSize);
   PTFilterNodeClass(FilterBufferPtr)^.filterNodeType := Word(nodeConst);
   PTFilterNodeClass(FilterBufferPtr)^.operation := Word(canConst2);
   PTFilterNodeClass(FilterBufferPtr)^.data1 := Word(fldInt16);
   PTFilterNodeClass(FilterBufferPtr)^.data2 := 2;
   PTFilterNodeClass(FilterBufferPtr)^.data3 := literalOffset;

   nodeOffset := curBinaryNodeCount*TFilterNodeClassSize;

   n := strToInt(constantValue);
   move(n, literalsPtr^, 2);
   inc(literalsPtr, 2);
   inc(literalOffset, 2);

end;

procedure TNode.addConstantDateTimeNode(constantValue: string);
var f: Double;
    DateTime: TDateTime;
begin
   dec(curBinaryNodeCount);

   Dec(FilterBufferPtr, TFilterNodeClassSize);
   PTFilterNodeClass(FilterBufferPtr)^.filterNodeType := Word(nodeConst);
   PTFilterNodeClass(FilterBufferPtr)^.operation := Word(canConst2);
   PTFilterNodeClass(FilterBufferPtr)^.data1 := Word(fldTimeStamp);
   PTFilterNodeClass(FilterBufferPtr)^.data2 := 8;
   PTFilterNodeClass(FilterBufferPtr)^.data3 := literalOffset;

   nodeOffset := curBinaryNodeCount*TFilterNodeClassSize;

   {$ifdef win32}
   if pos(' ', constantValue)>0 then begin
      DateTime:= StrToDateTime(constantValue);
      f := TimeStampToMSecs(DateTimeToTimeStamp(DateTime));
   end
   else begin
      DateTime:= StrToDate(constantValue);
      f := TimeStampToMSecs(DateTimeToTimeStamp(DateTime));
   end;
   {$else}
   if pos(' ', constantValue)>0 then f := strToDateTime(constantValue) * MSecsPerDay
   else f := strToDate(constantValue) * MSecsPerDay;
   {$endif}

   move(f, literalsPtr^, 8);
   inc(literalsPtr, 8);
   inc(literalOffset, 8);

end;

procedure TNode.addConstantDateNode(constantValue: string);
var
{$ifdef win32}
    TimeStamp: TTimeStamp;
    DateTime: TDateTime;
{$else}
    f: Longint;
{$endif}
begin
   dec(curBinaryNodeCount);

   Dec(FilterBufferPtr, TFilterNodeClassSize);
   PTFilterNodeClass(FilterBufferPtr)^.filterNodeType := Word(nodeConst);
   PTFilterNodeClass(FilterBufferPtr)^.operation := Word(canConst2);
   PTFilterNodeClass(FilterBufferPtr)^.data1 := Word(fldDate);
   PTFilterNodeClass(FilterBufferPtr)^.data2 := 4;
   PTFilterNodeClass(FilterBufferPtr)^.data3 := literalOffset;

   nodeOffset := curBinaryNodeCount*TFilterNodeClassSize;

   {$ifdef win32}
   DateTime := Trunc(strToDate(constantValue));
   TimeStamp:= DateTimeToTimeStamp(DateTime);
   move(TimeStamp.Date, literalsPtr^,4);
   {$else}
   f := Trunc(strToDate(constantValue));
   move(f, literalsPtr^,4);
   {$endif}

   inc(literalsPtr, 4);
   inc(literalOffset, 4);

end;

procedure TNode.addConstantTimeNode(constantValue: string);
var
{$ifdef win32}
    TimeStamp: TTimeStamp;
    DateTime: TDateTime;
{$else}
    f: Longint;
{$endif}
begin
   dec(curBinaryNodeCount);

   Dec(FilterBufferPtr, TFilterNodeClassSize);
   PTFilterNodeClass(FilterBufferPtr)^.filterNodeType := Word(nodeConst);
   PTFilterNodeClass(FilterBufferPtr)^.operation := Word(canConst2);
   PTFilterNodeClass(FilterBufferPtr)^.data1 := Word(fldTime);
   PTFilterNodeClass(FilterBufferPtr)^.data2 := 4;
   PTFilterNodeClass(FilterBufferPtr)^.data3 := literalOffset;

   nodeOffset := curBinaryNodeCount*TFilterNodeClassSize;

   {$ifdef win32}
   DateTime := strToTime(constantValue);
   TimeStamp:= DateTimeToTimeStamp(DateTime);
   move(TimeStamp.Time, literalsPtr^,4);
   {$else}
   f := Round(Frac(strToTime(constantValue)) * MSecsPerDay);
   move(f, literalsPtr^,4);
   {$endif}

   inc(literalsPtr, 4);
   inc(literalOffset, 4);

end;

procedure TNode.addConstantBooleanNode(constantValue: string);
var f: WordBool;
begin
   dec(curBinaryNodeCount);

   Dec(FilterBufferPtr, TFilterNodeClassSize);
   PTFilterNodeClass(FilterBufferPtr)^.filterNodeType := Word(nodeConst);
   PTFilterNodeClass(FilterBufferPtr)^.operation := Word(canConst2);
   PTFilterNodeClass(FilterBufferPtr)^.data1 := Word(fldBool);
   PTFilterNodeClass(FilterBufferPtr)^.data2 := 2;
   PTFilterNodeClass(FilterBufferPtr)^.data3 := literalOffset;

   nodeOffset := curBinaryNodeCount*TFilterNodeClassSize;

   f := constantValue[1] in ['t', 'T'];

   move(f, literalsPtr^,2);
   inc(literalsPtr, 2);
   inc(literalOffset, 2);

end;

procedure TNode.addBinaryNode(a_operation: CanOp);
begin
   dec(curBinaryNodeCount);

   Dec(FilterBufferPtr, TFilterNodeClassSize);
   if (child1<>Nil) then PTFilterNodeClass(filterBufferPtr)^.data1 := child1.nodeOffset;
   if (child2<>Nil) then PTFilterNodeClass(FilterBufferPtr)^.data2 := child2.nodeOffset;

{$ifdef win32}
   PTFilterNodeClass(FilterBufferPtr)^.filterNodeType := Integer(nodeBinary);
   PTFilterNodeClass(FilterBufferPtr)^.operation := Integer(a_operation);
{$else}
   PTFilterNodeClass(FilterBufferPtr)^.filterNodeType := Word(nodeBinary);
   PTFilterNodeClass(FilterBufferPtr)^.operation := Word(a_operation);
{$endif}

   nodeOffset := curBinaryNodeCount*TFilterNodeClassSize;
end;

var
   line: string;

procedure TNode.traverse;

   { remove trailing blanks }
   procedure stripTrailing(var name: string);
   begin
      while (length(Name)>0) and (Name[length(name)]=' ') do
         delete(Name, length(Name), 1);
   end;

begin
   if (child1<>Nil) then child1.traverse;
   if (child2<>Nil) then child2.traverse;
   traverseStr := traverseStr + ' ' + nodeOperator;

   if (nodeType=Logical) then begin
      if (uppercase(nodeOperator)='AND') then addBinaryNode(canAND)
      else if (uppercase(nodeOperator)='OR') then addBinaryNode(canOR)
   end
   else if (nodeType=Relational) then begin
      if (nodeOperator='<') then addBinaryNode(canLT)
      else if (nodeOperator='>') then addBinaryNode(canGT)
      else if (nodeOperator='<=') then addBinaryNode(canLE)
      else if (nodeOperator='>=') then addBinaryNode(canGE)
      else if (nodeOperator='=') then addBinaryNode(canEQ)
      else if (nodeOperator='<>') then addBinaryNode(canNE)
   end
   else if (nodeType=Arithmetic) then begin
      if (nodeOperator='+') then addBinaryNode(canADD)
      else if (nodeOperator='-') then addBinaryNode(canMINUS)
      else if (nodeOperator='*') then addBinaryNode(canMUL)
      else if (nodeOperator='/') then addBinaryNode(canDIV)
   end
   else if (nodeType=Variable) then begin
      case dataType of
         dtSmallInt:  addConstantSmallIntNode(nodeOperator);

         dtInteger:  addConstantIntegerNode(nodeOperator);

         dtFloat : addConstantFloatNode(nodeOperator);

         dtBCD:    addConstantBCDNode(nodeOperator, dtBCD, bcdSize);

         dtString:
            if (nodeOperator[1]='"') then
               addConstantStringNode( copy(nodeOperator, 2, length(nodeOperator)-2))
            else begin
               stripTrailing(nodeOperator);
               addConstantStringNode(nodeOperator);
            end;

         dtDateTime:
            if (nodeOperator[1]='"') then
               addConstantDateTimeNode( copy(nodeOperator, 2, length(nodeOperator)-2))
            else begin
               stripTrailing(nodeOperator);
               addConstantDateTimeNode(nodeOperator);
            end;

         dtDate:
            if (nodeOperator[1]='"') then
               addConstantDateNode( copy(nodeOperator, 2, length(nodeOperator)-2))
            else begin
               stripTrailing(nodeOperator);
               addConstantDateNode(nodeOperator);
            end;

         dtTime:
            if (nodeOperator[1]='"') then
               addConstantTimeNode( copy(nodeOperator, 2, length(nodeOperator)-2))
            else begin
               stripTrailing(nodeOperator);
               addConstantTimeNode(nodeOperator);
            end;

         dtBoolean:
            if (nodeOperator[1]='"') then
               addConstantBooleanNode( copy(nodeOperator, 2, length(nodeOperator)-2))
            else begin
               stripTrailing(nodeOperator);
               addConstantBooleanNode(nodeOperator);
            end;

         else addFieldNode(nodeOperator);
      end
   end
end;

var
   stack: TStackStr;
   stackNodes: TStackPtr;


{ build from two nodes in treeStack }
Function GetEngineDatatype(field : TField): TDataType;
begin
   case field.DataType of
      ftString:                             Result:= dtString;
      ftSmallInt, ftWord:                   Result:= dtSmallInt;
      ftAutoInc, ftInteger:                 Result:= dtInteger; { Support auto-increment field }
      ftFloat, ftCurrency:                  Result:= dtFloat;
      ftBCD:                                Result:= dtBCD;
      ftBoolean:                            Result:= dtBoolean;
      ftDateTime :                          Result:= dtDateTime;
      ftDate :                              Result:= dtDate;
      ftTime :                              Result:= dtTime;
      else result:= dtUnknown;
   end
end;

Function DataSetIsValidField(dataset : TDBDataSet; fieldName : string): boolean;
var i: integer;
begin
   with dataset do begin
      result:= False;
      for i:= 0 to fieldCount-1 do begin
         if (uppercase(fieldName) = uppercase(fields[i].fieldName)) then begin
            result:= true;
            break;
         end;
      end
   end
end;

Function BuildNode(nodeType: TNodeType;  nodeOperator: string): boolean;
var child1, child2: TNode;
    node: TNode;
    dbField: TField;
    dataType: TDataType;
begin
  result:= False;

  child1 := Nil;
  child2 := Nil;
  dataType:= dtUnknown;

  if (nodeType<>Variable) then
  begin
     if (stackNodes.count<2) then exit;
     child2 := stackNodes.Pop;
     child1 := stackNodes.Pop;
     if (child1.nodeType=Variable) then begin
        if DataSetIsValidField(dbTable, child1.nodeOperator) then begin
           dbField:= dbTable.fieldByName(child1.nodeOperator);
           child2.dataType:= GetEngineDataType(dbField);
           if dbField is TBCDField then begin
              child2.bcdSize:= TBCDField(dbField).size;
           end
        end
        else begin
           MessageDlg(child1.nodeOperator + #13 + 'Field not found in Table. ',
                 mtWarning, [mbok], 0);
           exit;
        end
     end
  end;

  node := TNode.create(nodeType, nodeOperator, child1, child2, dataType);
  stackNodes.Push(node);
  result:= True;
end;

Function ParseR: boolean; Forward;
Function ParseL: boolean; Forward;
Function ParseE: boolean; Forward;
Function ParseP: boolean; Forward;
Function ParseT: boolean; Forward;

Function Reduce(count: integer; token: string): Boolean;
var i: integer;
begin
   result:= False;
   for i:= 0 to count-1 do begin
      if (stack.count=0) then exit;
      stack.Pop;
   end;
   stack.Push(token);
   result:= True;
end;

Function Shift(token: string): boolean;
begin
   if (pos(token, line)=1) then begin
      Delete(line, 1, length(token));
      stack.Push(token);
      result:= True;
   end
   else result:= False;
end;

Function RelOp(var relOp: string): boolean;
begin
   result:= False;
   relOp:= '';
   if (length(line)>0) and (line[1] in ['<','>','=']) then begin
      result:= True;
      if (length(line)>1) and (line[2] in ['<','>','=']) then begin
         relOp:= copy(line, 1, 2);
      end
      else begin
         relOp:= copy(line, 1, 1);
      end
   end
end;

Function ArithOp(var arithOp: string): boolean;
begin
   result:= False;
   arithOp:= '';
   exit;  { Arithmetic operators do not work in current BDE }
   if (length(line)>0) and (line[1] in ['+','-','*','/']) then begin
      arithOp:= copy(line, 1, 1);
      result:= True;
   end
end;

Function OtherOp(var otherOp: string): boolean;
begin
   result:= False;
   otherOp:= '';
   if (length(line)>0) and (line[1] in ['(',')']) then begin
      OtherOp:= copy(line, 1, 1);
      result:= True;
   end
end;

Function isVarName(var varName: string): boolean;
var i: integer;
begin
   result:= False;
   varName:= '';
   i:= 1;  { Add support for '-' in name : 5/22/97}
   if (length(line)>0) and (line[i] in ['-','`','$','_','/','+','*','!','@','#','A'..'Z','a'..'z',
                       char(vk_scroll+1)..#255]) then
   begin
      i:= i + 1;
      while (i<=length(line)) and
            (line[i] in ['0'..'9','-','_',' ','`','$','/','+','*','`','!','@','#','A'..'Z','a'..'z',
                        char(vk_scroll+1)..#255]) do i:= i + 1;
      VarName:= copy(line, 1, i-1);

      result:= True;
   end
end;

Function isConstantIntegerName(var varName: string): boolean;
var i: integer;
begin
   result:= False;
   varName:= '';
   if length(line)=0 then exit;

   i:= 1;
   if (line[i] ='-') then i:= i + 1;

   if (line[i] in ['0'..'9']) then begin
      while (i<=length(line)) and (line[i] in ['0'..'9']) do i:= i + 1;
      VarName:= copy(line, 1, i-1);
      result:= True;
   end
end;

Function isConstantFloatName(var varName: string): boolean;
var i: integer;
begin
   result:= False;
   varName:= '';
   if length(line)=0 then exit;

   i:= 1;
   if (line[i] ='-') then i:= i + 1;

   if (line[i] in ['0'..'9']) then begin
      while (i<=length(line)) and (line[i] in ['0'..'9']) do i:= i + 1;
      if  (line[i]=DecimalSeparator) then i:= i + 1;
      while (i<=length(line)) and (line[i] in ['0'..'9']) do i:= i + 1;
      VarName:= copy(line, 1, i-1);
      result:= True;
   end
end;

Function isLiteralName(var varName: string): boolean;
var i: integer;
begin
   result:= False;
   varName:= '';
   if length(line)=0 then exit;

   i:= 1;
   if line[i]='"' then begin
      i:= i + 1;
      while ((i<=length(line)) and (line[i]<>'"')) do i:= i + 1;
      if line[i]='"' then begin
         VarName:= copy(line, 1, i);
         result:= True;
      end
   end
end;


Function Next: string;
var
   match: string;
   upperLine: string;
   tempResult: string;

   procedure stripLeading(var s: string);
   var i: integer;
   begin
      i:= 1;
      while (i<=length(s)) and (s[i] in [#9, #32]) do i:= i+1;
      if (i>1) then delete(s, 1, i-1);
   end;

   { remove trailing blanks }
   procedure stripTrailing(var name: string);
   begin
      while (length(Name)>0) and (Name[length(name)]=' ') do
         delete(Name, length(Name), 1);
   end;


begin
        result:= '';
        if length(line)=0 then exit;
        stripLeading(line);
        upperLine:= uppercase(line);

	if (OtherOp(match)) then tempResult:= match
	else if (RelOp(match)) then tempResult:= match
	else if (ArithOp(match)) then tempResult:= match
	else if (ParseState = expectingLogical) and (pos('AND', upperLine)=1) then
           tempResult:= copy(line, 1, 3)
	else if (ParseState = expectingLogical) and (pos('OR', upperLine)=1) then
           tempResult:= copy(line, 1, 2)
	else if (isVarName(match)) then tempResult:= match
	else if (isConstantFloatName(match)) then tempResult:= match
	else if (isConstantIntegerName(match)) then tempResult:= match
	else if (isLiteralName(match)) then tempResult:= match
	else begin
{		cout << "Unknown next " << line;}
           tempResult:= '';
	end;

        stripTrailing(tempResult);
        result:= tempResult;

end;

Function ParseP: boolean;
var operand : SmallString;
begin
   result:= False;

   if (Next='(') then begin
      if (not Shift('(')) then exit;
      if (not ParseL) then exit;
      if (not Shift(')')) then exit;
      if (not Reduce(3, 'P')) then exit;
      result:= True;
   end
   else begin
      operand:= Next;
      if (not shift(operand)) then exit;
      if (not Reduce(1, 'P')) then exit;
      result:= BuildNode(Variable, operand);
   end
end;

Function ParseL: boolean;
var logOperator: SmallString;
begin
   result:= False;
   if (not ParseR) then exit;
   if (not Reduce(1, 'L')) then exit;

   parseState:= expectingLogical;
   logOperator:= Next;
   parseState:= None;

   while ((uppercase(logOperator)='AND') or (uppercase(logOperator)='OR') ) do
   begin
      if (not Shift(logOperator)) then exit;
      if (not ParseR) then exit;
{      if (not ParseL) then exit;}
      if (not Reduce(3, 'L')) then exit;
      if (not BuildNode(Logical, logOperator)) then exit;
      parseState:= expectingLogical;
      logOperator:=Next;
      parseState:= None;
   end;
   result:= True;
end;

Function ParseR: boolean;
var relOperator: SmallString;
begin
   result:= False;

   if (not ParseE) then exit;
   if (not Reduce(1, 'R')) then exit;

   relOperator:=Next;

   if (isRelOp(relOperator)) then
   begin
      if (not Shift(Next)) then exit;
      if (not ParseE) then exit;
      if (not Reduce(3, 'R')) then exit;
      if (not BuildNode(Relational, relOperator)) then exit;
      relOperator:=Next;
   end;
   result:= True;
end;


Function ParseE: boolean;
var arithOperator: SmallString;
begin
   result:= False;
   if (not ParseT) then exit;
   if (not Reduce(1, 'E')) then exit;

   arithOperator:=Next;

   while ((arithOperator='+') or (arithOperator='-') ) do
   begin
       if (not Shift(Next)) then exit;
       if (not ParseT) then exit;
       if (not Reduce(3, 'E')) then exit;
       if (not BuildNode(Arithmetic, arithOperator)) then exit;
       arithOperator:=Next;
   end;
   result:= True;
end;


function ParseT: boolean;
var arithOperator: SmallString;
begin
   result:= False;
   if (not ParseP) then exit;
   if (not Reduce(1, 'T')) then exit;

   arithOperator:=Next;

   while ((arithOperator='*') or (arithOperator='/') ) do
   begin
      if (not Shift(Next)) then exit;
      if (not ParseT) then exit;
      if (not Reduce(3, 'T')) then exit;
      if (not BuildNode(Arithmetic, arithOperator)) then exit;
      arithOperator:=Next;
   end;
   result:= True;
end;

Function doFilter(a_line: string;
                  a_fieldNames: string;
                  a_fieldType: string): Pointer;
var
   topNode: TNode;
   numNodes: integer;
begin
   result:= Nil;
   stack:= Nil;
   stackNodes:= Nil;
   try
      stack:= TStackStr.create;
      stackNodes:= TStackPtr.create;

      line := a_line;
      if (not ParseL) then exit;

      topNode := stackNodes.Pop;

      { Reset counters}
      traverseStr := '';
      numNodes := topNode.nodeCount;

      curBinaryNodeCount := numNodes;
      literalOffset := 0;
      fieldCount := 0;

      MakeEnginePtr;
      topNode.traverse;

      PTFilterHeaderClass(filterHeaderPtr)^.iVersion := 1;
      PTFilterHeaderClass(filterHeaderPtr)^.iTotalSize :=
                TFilterHeaderClassSize + numNodes*TFilterNodeClassSize + literalOffset;
      PTFilterHeaderClass(filterHeaderPtr)^.iNodes := numNodes;
      PTFilterHeaderClass(filterHeaderPtr)^.iNodeStart := TFilterHeaderClassSize;
      PTFilterHeaderClass(filterHeaderPtr)^.iLiteralStart :=
                TFilterHeaderClassSize + numNodes*TFilterNodeClassSize;

      topNode.free;;
      result:= filterHeaderPtr;

   finally
      stack.free;
      stackNodes.free;
   end
end;

Function wwSetFilter(a_line: string; table: TTable;
    var fh: hDBIFilter; InOpen: boolean): boolean;
var
   s: pCanExpr;
   dbResult :DBIResult;

   {Added for Rocket compatibility }
   fpSxQuery  : Function ( cpExpression : PChar) : Longint;
   fpSxSelect : Function ( iWorkArea : Word) : Word;
   hRocket    : THandle;
   iWA : word;
   cExpr : array [0..256] of Char;

begin
   result:= False;

   if (not Table.Active) and (not InOpen) then begin  { Don't apply filters if active is false }
      result:= True;
      fh:= Nil;
      exit;
   end;

   {Added for Rocket compatibility }
   if (Table.TableType > ttASCII) then begin

      if a_line='' then begin  { Drop filter}
         result:= True;
         if table.active then begin
            dbiDropFilter(Table.handle, Nil);
            table.refresh;
         end;
         exit;
      end;

      FillChar(cExpr, sizeof(cExpr), 0);
      {$ifdef win32}
      hRocket := GetModuleHandle('SDE32');
      if hRocket=0 then hRocket := GetModuleHandle('SDE3032');
      if hRocket=0 then hRocket := GetModuleHandle('SDE2532');
      {$else}
      hRocket := GetModuleHandle('SDE16');
      if hRocket=0 then hRocket := GetModuleHandle('SDE3016');
      if hRocket=0 then hRocket := GetModuleHandle('SDE2016');
      if hRocket=0 then hRocket := GetModuleHandle('ROCKET');
      {$endif}
      @fpSxSelect:=GetProcAddress(hRocket, 'SX_SELECT');

      {Select the workarea associated with this table}
      iWA := fpSxSelect(word(Table.Handle));

      @fpSxQuery:=GetProcAddress(hRocket, 'SX_QUERY');

      StrPCopy(cExpr, a_line);
      fpSxQuery(cExpr);

      if (iWA <> word(Table.Handle)) then
         fpSxSelect(word(Table.Handle));

      if table.active then table.refresh;

      Result := TRUE;
      exit;
   end;

   if (a_line='') then begin
      result:= True;
      wwRemoveFilter(Table, fh);
      if table.active then table.refresh;
      exit;
   end;

   dbTable:= table;

   s:= doFilter(a_line, '', '');
   if s=Nil then begin
      fh:= Nil;
      exit;
   end;

   wwRemoveFilter(Table, fh);

   dbResult :=
      DbiAddFilter(Table.handle, LongInt(0), 1, False,
      s, Nil, fh);

   FreeEnginePtr;

   if (dbResult=0) then begin
      dbiActivateFilter(Table.handle, fh);
      if table.active then table.refresh;
      result:= True;
   end
   else fh:= Nil
end;

Procedure wwRemoveFilter(table: TDBDataSet; var fh: hDBIFilter);
begin
   if fh=Nil then exit;
   dbiDeactivateFilter(Table.handle, fh);
   DbiDropFilter(Table.handle, fh);
   fh:=Nil;
end;

Function wwAddFilter(a_line: string; table: TTable;
    var fh: hDBIFilter): boolean;
var
   s: pCanExpr;
   dbResult :DBIResult;
begin
   result:= False;

   dbTable:= table;

   s:= doFilter(a_line, '', '');
   if s=Nil then exit;

   dbResult :=
      DbiAddFilter(Table.handle, LongInt(0), 1, False,
      s, Nil, fh);

   FreeEnginePtr;

   if (dbResult=0) then begin
      dbiActivateFilter(Table.handle, fh);
      Table.disableControls;
      Table.first;
      Table.enableControls;
      if table.active then table.refresh;
      result:= True;
   end
end;

{ Filter by callback function }
Function wwSetFilterFunction(func: Pointer; table: TDBDataSet;
      var fh: hDBIFilter): boolean;
var
   dbResult :DBIResult;
   szErrMsg: DBIMSG;
begin
   result:= False;

   wwRemoveFilter(Table, fh);

   if func=Nil then begin
      if table.active then begin
         { 4/25/97 - Don't call refresh if no indexes }
         if (table is TTable) and ((table as TTable).indexFieldCount>0) then table.refresh
         else begin
            table.updateCursorPos;
            table.resync([]);
         end
      end;
      result:= True;
      exit;
   end;
   if Table.Handle=Nil then exit;

   dbResult :=
      DbiAddFilter(Table.handle, LongInt(table), 1, False,
      Nil, pfGenFilter(func), fh);

   dbiGetErrorString(dbResult, szErrMsg);

   if (dbResult=0) then begin
      dbiActivateFilter(Table.handle, fh);
      if table.active then
      begin
         { 4/25/97 - Don't call refresh if no indexes }
         if (table is TTable) and ((table as TTable).indexFieldCount>0) then table.refresh
         else begin
            table.updateCursorPos;
            table.resync([]);
         end
      end;
      result:= True;
   end
   else fh:= Nil {Fail to set filter}
end;

end.
