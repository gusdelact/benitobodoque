unit Wwqbe;
{
//
// Components : TwwQBE - Query by Example
//
// Copyright (c) 1995, 1998 by Woll2Woll Software
//
// 6/8/95 - New property BlankAsZero
// 6/14/95 - Add method SetParam
// 11/06/1997 - Changed From database.locale to the dataset's locale.
//              May be able to optimize and just use string length.
//              To handle international character support while filtering.
// 11/17/1998 - Workaround Delphi 4 change in implementaion in SetData on BCD fields
// 12/28/98 - Don't replace original after calling AnsiToNative
// 4/13/99 - SetData may raise exception if data is unassigned
}
interface

{$i wwIfDef.pas}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, DB, DBTables, dialogs, wwfilter, wwStr,
  wwSystem, wwTable, wwtypes,

{$IFDEF WIN32}
bde
{$ELSE}
dbiprocs, dbiTypes, dbierrs
{$ENDIF}
;

type
  TwwQBE = class;
  TwwQBEFilterEvent = Procedure(Qbe: TwwQBE; var Accept: boolean) of object;
  TwwQBE = class(TDBDataSet)
  private
     FLookupFields: TStrings;
     FLookupLinks: TStrings;
     FControlType: TStrings;
     FPictureMasks: TStrings;
     FQBE: TStrings;            { support Paradox style QBE }
     FAnswerTable: String;
     FAuxiliaryTables: Boolean;
     FBlankAsZero: boolean;
     FParamValues: TStrings;
     FParams: TStringList;
     bSkipCreateHandle, bUpdateQuery: boolean;
     TempHandle: HDBICur;

     FOnInvalidValue: TwwInvalidValueEvent;
     FOnFilterOptions: TwwOnFilterOptions;
     FOnFilterEscape: TDataSetNotifyEvent;
     FOnFilter: TwwQBEFilterEvent;
     FFilterBuffer: Pointer;
     FFilterFieldBuffer: PChar;
     hFilterFunction: hDBIFilter;
     FFilterParam: TParam;
     CallCount: integer;

     procedure SetOnFilter(val: TwwQBEFilterEvent);
     procedure SetQBE(QBE: TStrings);
     function GetLookupFields: TStrings;
     procedure SetLookupFields(sel : TStrings);
     function GetLookupLinks: TStrings;
     procedure SetLookupLinks(sel : TStrings);
     function getControlType: TStrings;
     procedure SetControlType(sel : TStrings);
     function GetPictureMasks: TStrings;
     procedure SetPictureMasks(sel : TStrings);
     Procedure SetOnFilterOptions(val: TwwOnFilterOptions);

  protected
     procedure DoOnCalcFields; override;
     function CreateHandle: HDBICur; override;
   {$ifdef wwDelphi3Up}
     procedure OpenCursor(InfoQuery: Boolean); override;
   {$else}
     procedure OpenCursor; override;
   {$endif}
     procedure DoAfterOpen; override;
     Function PerformQuery(var AdbiHandle: HDBICur): DBIResult; virtual;

     {$ifdef wwDelphi3Up}
     procedure DataEvent(Event: TDataEvent; Info: Longint); override;
     function GetNextRecords: Integer; override;
     Procedure ResetMouseCursor;
     {$endif}


  public
    LookupTables: TList;       { List of lookup tables }
    inFilterEvent: boolean;    {Woll2Woll Internal use only}

    {$ifdef wwDelphi3Up}
    ProcessingOnFilter: boolean;
    function IsSequenced: Boolean; override;
    {$endif}

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    Function IsValidField(fieldName : string): boolean;
    procedure RemoveObsoleteLinks;
    Procedure FreeLookupTables;
    Function SaveAnswerTable(tableName: string): boolean;
    Function wwFilterField(AFieldName: string): TParam;

    Procedure SetParam(paramName: string; paramValue: string);
    Procedure ClearParams;
    Function GetParam(paramName: string): string;

  published
    property ControlType : TStrings read getControlType write setControltype;
    property LookupFields : TStrings read getLookupFields write setLookupFields;
    property LookupLinks : TStrings read getLookupLinks write setLookupLinks;
    property QBE: TStrings read FQBE write SetQBE;
    property AnswerTable: String read FAnswerTable write FAnswerTable;
    property AuxiliaryTables: Boolean read FAuxiliaryTables write FAuxiliaryTables;
    property BlankAsZero: Boolean read FBlankAsZero write FBlankAsZero;
    property PictureMasks: TStrings read GetPictureMasks write SetPictureMasks;
    {$ifdef win32}
    property UpdateObject;
    {$endif}
    property OnFilter: TwwQBEFilterEvent read FOnFilter write SetOnFilter;
    property OnFilterEscape: TDataSetNotifyEvent read FOnFilterEscape write FOnFilterEscape;
    property OnFilterOptions: TwwOnFilterOptions read FOnFilterOptions write SetOnFilterOptions
       default [ofoEnabled, ofoShowHourGlass];
    property OnInvalidValue: TwwInvalidValueEvent read FOnInvalidValue write FOnInvalidValue;

  end;

procedure Register;

implementation

uses
   wwcommon, dbconsts;

function filterQBEFunction(
      ulClientData  : Longint;
      pRecBuf       : Pointer;
      iPhyRecNum    : Longint
 ): Integer; export;
{$IFDEF WIN32}
 stdcall;  {stdcall added for win95}
{$ENDIF}
var filteredTable: TwwQBE;
    TempResult: boolean;
begin
   result:= 1;

   filteredTable:= TwwQBE(ulClientData);
   if (csDestroying in filteredTable.ComponentState) then begin
      exit;
   end;

   with filteredTable do begin
      if Assigned(FOnFilter) then begin
         if (inFilterEvent or (not (ofoEnabled in OnFilterOptions))) then begin
            result:= 1;
            exit;
         end;

         inFilterEvent:= True;
         FFilterBuffer:= pRecBuf;
         TempResult:= True;
         OnFilter(filteredTable, tempResult);
         if TempResult then result:= 1 else result:= 0;
         inFilterEvent:= False;

         {$ifdef wwDelphi3Up}
         if ofoShowHourGlass in OnFilterOptions then
           if (not ProcessingOnFilter) and (Result=0) then
           begin
              if Screen.cursor<>crHourglass then
              begin
                 Screen.cursor:= crHourGlass;
              end;
              ProcessingOnFilter:= True;
           end;
         {$endif}

         { 10/24/96 - Yield so background tasks can run }
         if ofoCancelOnEscape in OnFilterOptions then
         begin
            inc(CallCount);
            if CallCount>=32000 then CallCount:= 0;
            if (CallCount mod 100)=0 then
               if wwProcessEscapeFilterEvent(filteredTable) then
               begin
                  OnFilterOptions:= OnFilterOptions - [ofoenabled];
                  if Assigned(FOnFilterEscape) then OnFilterEscape(filteredTable);
               end
         end;


      end
   end
end;

    constructor TwwQBE.Create(AOwner: TComponent);
    begin
      inherited Create(AOwner);
      FControlType:= TStringList.create;
      FLookupFields:= TStringList.create;  { Must be a TStringList type }
      FLookupLinks:= TStringList.create;
      FPictureMasks:= TStringList.create;
      FParams:= TStringList.create;
{      FParams.sorted:= True;}
      FParamValues:= TStringList.create;

      FAuxiliaryTables:= True;
      FBlankAsZero:= True;
      FAnswerTable:= '';

      lookupTables:= TList.create;       { List of lookup tables }
      FQBE := TStringList.Create;
      bSkipCreateHandle:= False;

      FFilterParam:= TParam.create(nil, ptUnknown);
      FOnFilterOptions:= [ofoEnabled, ofoShowHourGlass];
    end;

    destructor TwwQBE.Destroy;
    begin
      FLookupFields.Free;
      FLookupLinks.Free;
      FControlType.Free;
      FPictureMasks.Free;
      FPictureMasks:= Nil;
      LookupTables.free;
      FQBE.Free;
      FParams.Free;
      FParamValues.Free;

      if FFilterFieldBuffer<>Nil then
         FreeMem(FFilterFieldBuffer, wwFilterMemoSize);
      FFilterParam.Free;

      inherited Destroy;
    end;

   Procedure TwwQBE.ClearParams;
   begin
      FParamValues.clear;
      FParams.Clear;
   end;

   Function TwwQBE.GetParam(paramName: string): string;
   var idx: integer;
   begin
      Result:= '';
      idx:= FParams.indexOf(paramName);
      if idx>=0 then result:= FParamValues[idx];
   end;

   Procedure TwwQBE.SetParam(paramName: string; paramValue: string);
   var idx: integer;
   begin
      idx:= FParams.indexOf(paramName);
      if idx>=0 then
         FParamValues[idx]:= paramValue
      else begin
         FParams.add(paramName);
         FParamValues.add(paramValue);
      end
   end;

   procedure TwwQBE.SetQBE(QBE: TStrings);
   begin
     FQBE.Assign(QBE);
     if Active then begin
        Active:= False;
        Active:= True;
     end
   end;

    procedure TwwQBE.DoAfterOpen;
    begin
       inherited DoAfterOpen;
       if assigned(FOnFilter)then begin
          wwSetFilterFunction(@filterQBEFunction, self, hFilterFunction);
       end
    end;

   {Over-ride to support insert and update queries }
 {$ifdef wwDelphi3Up}
   procedure TwwQBE.OpenCursor(InfoQuery: Boolean);
 {$else}
    procedure TwwQBE.OpenCursor;
 {$endif}
   begin
      SetDBFlag(dbfOpened, True);
      TempHandle:= CreateHandle;
      if bUpdateQuery then exit;

      bSkipCreateHandle:= True;

    {$ifdef wwDelphi3Up}
      inherited OpenCursor(InfoQuery);
    {$else}
      inherited OpenCursor;
    {$endif}

      bSkipCreateHandle:= False;

   end;


    Function TwwQBE.PerformQuery(var AdbiHandle: HDBICur): DBIResult;
    const
        NativeStrLen=255;
    var hStmt: HDbiStmt;
        tempQBE: TStrings;
        QBEBuf: PChar;
        curpos, matchPos, i,j: integer;
        ParamLower, QBELower: string;
        NativeStr: PChar;
    begin
       AdbiHandle:= Nil;

       tempQBE:= TStringList.create;
       tempQBE.assign(FQBE);

       GetMem(NativeStr, NativeStrLen); { 4/25/97}

       for j:= 0 to FQBE.count-1 do begin
          QBELower:= lowercase(tempQBE[j]);
          if pos('~', QBELower)=0 then continue;

          for i:= FParams.count-1 downto 0 do begin { Scan backwards so line1 and line10 are handled}
             ParamLower:= lowercase(FParams[i]);

             {4/25/97 - Use AnsiToNative to support international characters }
             AnsiToNative(database.Locale, FParamValues[i], NativeStr, NativeStrLen);
             { 12/28/98 - Don't replace original }
//             FParamValues[i]:= strPas(NativeStr);

             repeat
                matchPos:= pos('~' + ParamLower, QBELower);
                if matchPos>0 then begin
                   tempQBE[j]:=
//                   copy(tempQBE[j], 1, matchPos-1) + FParamValues[i] +
                   copy(tempQBE[j], 1, matchPos-1) + strpas(NativeStr) + { 12/28/98 }
                   copy(tempQBE[j], matchPos + length(FParams[i]) + 1, 255);
                end;
                QBELower:= lowercase(tempQBE[j]);
             until matchPos=0;
          end;

          { Replace unassigned tilde variables with an empty string }
          matchPos:= pos('~', QBELower);
          while matchPos<>0 do begin
             curPos:= matchPos+1;
             while (curpos<=length(QBELower)) and
                   (QBELower[curpos] in ['a'..'z', '0'..'9', '_', '#']) do inc(curPos);
             tempQBE[j]:=
                copy(tempQBE[j], 1, matchPos-1) + ' ' +
                copy(tempQBE[j], curPos, 255);
             QBELower:= lowercase(tempQBE[j]);
             matchPos:= pos('~', QBELower);
          end;
       end;

       FreeMem(NativeStr, NativeStrLen);  { 4/25/97}

       QBEBuf:= wwGetQueryText(tempQBE, False);

       {$ifdef win32}
       Check(DbiQAlloc(DBHandle, qrylangQBE, hStmt));
       {$else}
       result:= DbiQPrepare(DBHandle, qryLangQBE, QBEBuf, hStmt);
       if result<>DBIERR_NONE then exit;
       {$endif}

       try
         if FAuxiliaryTables then
            Check(dbiSetProp(hDBIObj(hStmt), stmtAUXTBLS, 1))
         else
            Check(dbiSetProp(hDBIObj(hStmt), stmtAUXTBLS, 0));

         if FBlankAsZero then
            Check(dbiSetProp(hDBIObj(hStmt), stmtBLANKS, 1));

         {$ifdef win32}
         result:= DbiQPrepare(hStmt, QBEBuf);
         if result<>DBIERR_NONE then exit;
         {$endif}

         Screen.cursor:= crHourGlass;
         result:= dbiQExec(hStmt, @ADBIHandle);
         if result<>DBIERR_NONE then exit;

       finally
         Check(DbiQFree(hStmt));
         tempQBE.Free;
         strDispose(QBEBuf);
         Screen.cursor:= crDefault;
         hStmt:= nil;
       end;

    end;

   function TwwQBE.CreateHandle: HDBICur;
   Var p:HDbiCur;
       dbResult: DBIResult;
   Begin
      if bSkipCreateHandle then begin
         bSkipCreateHandle:= False;
         result:= TempHandle;
         exit;
      end;

      result:= nil;
      bUpdateQuery:= False;

      if (FQBE.count>0) and (length(FQBE[0])>0) then try
         while True do begin
            dbResult:= PerformQuery(p);

            if (dbResult=DBIERR_NOTSUFFTABLERIGHTS) or
               (dbResult=DBIERR_NOTSUFFFIELDRIGHTS) or
               (dbResult=DBIERR_NOTSUFFFAMILYRIGHTS) then
            begin
               if not session.GetPassword then begin
                  result:= Nil;
                  break;
               end
            end
            else  begin
               Check(dbResult);

               if p=Nil then begin {Update or Insert Query}
                  bUpdateQuery:= True;
                  Result:= Nil;
                  break;
               end;

               Result:=p;

               wwSaveAnswerTable(self, p, FAnswerTable);
               break;
            end
         end
      except
         Result:= nil;
      end
      else result:= inherited CreateHandle;
   End;

    Function TwwQBE.SaveAnswerTable(tableName: string): boolean;
    begin
       result:= wwSaveAnswerTable(self, Handle, tableName);
    end;

    function TwwQBE.GetControltype: TStrings;
    begin
         Result:= FControlType;
    end;

    procedure TwwQBE.SetControlType(sel : TStrings);
    begin
       FControlType.assign(sel);
    end;

    function TwwQBE.GetLookupFields: TStrings;
    begin
       Result:= FLookupFields;
    end;

    procedure TwwQBE.SetLookupFields(sel : TStrings);
    begin
         FLookupFields.assign(sel);
    end;

    function TwwQBE.GetPictureMasks: TStrings;
    begin
       Result:= FPictureMasks
    end;

    procedure TwwQBE.SetPictureMasks(sel : TStrings);
    begin
         FPictureMasks.assign(sel);
    end;

    function TwwQBE.GetLookupLinks: TStrings;
    begin
         Result:= FLookupLinks;
    end;

    procedure TwwQBE.SetLookupLinks(sel : TStrings);
    begin
         FLookupLinks.assign(sel);
    end;

    Procedure TwwQBE.FreeLookupTables;
    var i: integer;
    begin
       for i:= lookupTables.count-1 downto 0 do
       begin
          TwwTable(lookupTables.items[i]).free;
          lookupTables.delete(i);
       end;
    end;

    { Removes obsolete links and control types }
    procedure TwwQBE.RemoveObsoleteLinks;
    begin
        wwDataSetRemoveObsolete(self, FLookupFields, FLookupLinks, FControlType);
    end;

    procedure TwwQBE.DoOnCalcFields;
    begin
       removeObsoleteLinks;
       wwDataSetDoOnCalcFields(self, FLookupFields, FLookupLinks, lookupTables);
       inherited DoOnCalcFields;
    end;


  Function TwwQBE.IsValidField(fieldName : string): boolean;
  begin
      result:= wwDataSetIsValidField(self, fieldname);
  end;

  procedure TwwQBE.SetOnFilter(val: TwwQBEFilterEvent);
  begin
     FOnFilter:= val;
     if @val=Nil then wwSetFilterFunction(Nil, self, hFilterFunction)
     else begin
        if not active then exit;
        wwSetFilterFunction(@filterQBEFunction, self, hFilterFunction);
        if hFilterFunction=nil then
           MessageDlg('Local Filtering is not supported on this QBE.',
             mtWarning, [mbok], 0);
     end

  end;

Function TwwQBE.wwFilterField(AFieldName: string): TParam;
var curField: TField;
    isBlank: bool;
    OtherField: TField;
    method: TMethod;
    {$ifdef wwDelphi4Up}
    tempValue: Currency;
    {$endif}
begin
   curField:= findField(AFieldName);
   if curField=Nil then begin
      {$ifdef wwDelphi3Up}
      DatabaseErrorFmt(SFieldNotFound, [AFieldName, AFieldName]);
      {$else}
      DBErrorFmt(SFieldNotFound, [AFieldName]);
      {$endif}

      result:= FFilterParam;
      exit;
   end;

   if FFilterFieldBuffer=Nil then GetMem(FFilterFieldBuffer, wwFilterMemoSize); {11/3/97 }
   Integer(Pointer(FFilterFieldBuffer)^):= 0; { Clear field buffer } {10/15/96 - Workaround for 32 bit BDE bug}

   if (curfield is TMemoField) or (curfield.datatype=ftMemo) or
      (curfield.datatype = ftblob) then
   begin
     wwCallbackMemoRead(self, FFilterBuffer, FFilterFieldBuffer^, curField, wwFilterMemoSize);
     with FFilterParam do begin
        DataType:= ftString;  { 6/12/98 }
        SetData(FFilterFieldBuffer);
     end;
   end
   else if not wwisNonPhysicalField(curfield) then begin
      dbiGetField(handle, curField.FieldNo, FFilterBuffer, FFilterFieldBuffer, isBlank);

      with FFilterParam do begin
         DataType:= curField.DataType;
         if (DataType=ftString) and TStringField(curField).transliterate then
            { 11/06/1997 - Changed From database.locale to the dataset's locale.
                           May be able to optimize and just use string length. }
            NativeToAnsiBuf(Locale,FFilterFieldBuffer,FFilterFieldBuffer,255);
         {$ifdef win32}
         if (DataType=ftAutoInc) then DataType:=ftInteger;
         {$endif}

         {11/17/1998 - Workaround Delphi 4 change in implementaion in SetData on BCD fields}
         {$ifdef wwDelphi4Up}
         if Datatype=ftBCD then
         begin
           {$ifdef wwDelphi5Up}
           if BCDToCurr(PBCD(FFilterFieldBuffer)^, tempValue) then
           {$else}
           if BCDToCurr(Pointer(FFilterFieldBuffer), tempValue) then
           {$endif}
              FFilterParam.AsBCD := tempValue
           else FFilterParam.AsBCD := 0;
         end
         else
         {$endif}

         if isBlank then Clear { 4/13/99 - SetData may raise exception if data is unassigned }
         else SetData(FFilterFieldBuffer);
     end;
   end
   else begin  {This is a lookup or a calculated field so get Lookup field value}
      method.data:= self;
      method.code:= @TwwQBE.wwFilterField;
      OtherField := wwDataSet_GetFilterLookupField(Self, curfield, method);

      if OtherField <> nil then begin
        FFilterParam.DataType:= OtherField.DataType;
        wwConvertFieldToParam(OtherField,FFilterParam,FFilterFieldBuffer);
      end;

   end;

   result:= FFilterParam;
end;

Procedure TwwQBE.SetOnFilterOptions(val: TwwOnFilterOptions);
begin
   if (ofoEnabled in FOnFilterOptions) and
      not (ofoEnabled in val) then
   begin
      FOnFilterOptions:= val;
      if active and Assigned(FOnFilter) then begin
         UpdateCursorPos;
         resync([]);
      end
   end
   else FOnFilterOptions:= val;
end;

{$ifdef wwDelphi3Up}
procedure TwwQBE.ResetMouseCursor;
begin
   if (ofoShowHourGlass in OnFilterOptions) and ProcessingOnFilter then
   begin
      if Screen.cursor<>crArrow then
      begin
         Screen.cursor:= crArrow;
         ProcessingOnFilter:= False;
      end
   end
end;

function TwwQBE.IsSequenced: Boolean;
begin
  result:= inherited isSequenced;
  if result then begin
     if Assigned(FOnFilter) then result:= False;
  end
end;

function TwwQBE.GetNextRecords: Integer;
begin
   result:= inherited GetNextRecords;
   ResetMouseCursor;
end;

procedure TwwQBE.DataEvent(Event: TDataEvent; Info: Longint);
begin
   inherited DataEvent(Event, Info);
   ResetMouseCursor;
end;

{$endif}

procedure Register;
begin
{  RegisterComponents('InfoPower', [TwwTable]);}
end;

end.
