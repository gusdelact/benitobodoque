unit Wwquery;
{
//
// Components : TwwQuery
//
// Copyright (c) 1995, 1998 by Woll2Woll Software
//
// 11/06/1997 - Changed From database.locale to the dataset's locale.
//              May be able to optimize and just use string length.
//              To handle international character support while filtering.
// 11/17/1998 - Workaround Delphi 4 change in implementaion in SetData on BCD fields
//
// 4/13/99 - SetData may raise exception if data is unassigned
}

interface

{$i wwIfDef}

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
  TwwQuery = class;
  TwwQueryFilterEvent = Procedure(query: TwwQuery; var Accept: boolean) of object;
  TwwQuery = class(TQuery)
  private
     FLookupFields: TStrings;
     FLookupLinks: TStrings;
     FControlType: TStrings;
     FPictureMasks: TStrings;
     FAnswerTable: String;
     FUsePictureMask: boolean;

     FOnInvalidValue: TwwInvalidValueEvent;
     FOnFilterOptions: TwwOnFilterOptions;
     FOnFilterEscape: TDataSetNotifyEvent;
     FOnFilter: TwwQueryFilterEvent;
     FFilterBuffer: Pointer;
     FFilterFieldBuffer: PChar;
     hFilterFunction: hDBIFilter;
     FFilterParam: TParam;
     CallCount: integer;

     procedure SetOnFilter(val: TwwQueryFilterEvent);

     function GetLookupFields: TStrings;
     procedure SetLookupFields(sel : TStrings);
     function GetLookupLinks: TStrings;
     procedure SetLookupLinks(sel : TStrings);
     function GetControlType: TStrings;
     procedure SetControlType(sel : TStrings);
     function GetPictureMasks: TStrings;
     procedure SetPictureMasks(sel : TStrings);
     Procedure SetOnFilterOptions(val: TwwOnFilterOptions);

  protected
     procedure DoOnCalcFields; override;
     {$ifdef wwDelphi3Up}
     procedure OpenCursor(InfoQuery: Boolean); override;
     {$else}
     procedure OpenCursor; override;
     {$endif}
     procedure DoAfterOpen; override;
     procedure DoBeforePost; override; { For picture support }

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
    property AnswerTable: String read FAnswerTable write FAnswerTable;
    Function wwFilterField(AFieldName: string): TParam;
    function SetLookupField(Field: TField): boolean;
    function isValidIndexField(FieldName: string; caseSensitive: boolean): boolean;

  published
    property ControlType : TStrings read getControlType write setControltype;
    property LookupFields : TStrings read getLookupFields write setLookupFields;
    property LookupLinks : TStrings read getLookupLinks write setLookupLinks;
    property PictureMasks: TStrings read GetPictureMasks write SetPictureMasks;
    property ValidateWithMask: boolean read FUsePictureMask write FUsePictureMask;
    property OnFilter: TwwQueryFilterEvent read FOnFilter write SetOnFilter;
    property OnFilterEscape: TDataSetNotifyEvent read FOnFilterEscape write FOnFilterEscape;
    property OnFilterOptions: TwwOnFilterOptions read FOnFilterOptions write SetOnFilterOptions
       default [ofoEnabled, ofoShowHourGlass];
    property OnInvalidValue: TwwInvalidValueEvent read FOnInvalidValue write FOnInvalidValue;
  end;

procedure Register;

implementation


   uses wwcommon, dbconsts;

function filterQueryFunction(
      ulClientData  : Longint;
      pRecBuf       : Pointer;
      iPhyRecNum    : Longint
 ): Integer; export;
{$IFDEF WIN32}
 stdcall;  {stdcall added for win95}
{$ENDIF}
var filteredTable: TwwQuery;
    tempResult: boolean;
begin
   result:= 1;

   filteredTable:= TwwQuery(ulClientData);
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
         tempResult:= True;
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


    constructor TwwQuery.create(AOwner: TComponent);
    begin
      inherited Create(AOwner);
      FControlType:= TStringList.create;
      FLookupFields:= TStringList.create;  { Must be a TStringList type }
      FLookupLinks:= TStringList.create;
      FPictureMasks:= TStringList.create;
      lookupTables:= TList.create;       { List of lookup tables }
      FAnswerTable:= '';

      FFilterParam:= TParam.create(nil, ptUnknown);
      FUsePictureMask:= True;
      FOnFilterOptions:= [ofoEnabled, ofoShowHourGlass];
    end;

    destructor TwwQuery.Destroy;
    begin
      FLookupFields.Free;
      FLookupLinks.Free;
      FControlType.Free;
      FPictureMasks.Free;
      FPictureMasks:= Nil;
      LookupTables.free;

      if FFilterFieldBuffer<>Nil then
         FreeMem(FFilterFieldBuffer, wwFilterMemoSize);
      FFilterParam.Free;

      inherited Destroy;
    end;

    procedure TwwQuery.DoAfterOpen;
    begin
       inherited DoAfterOpen;  { 9/5/96 }
       if assigned(FOnFilter)then begin
          wwSetFilterFunction(@filterQueryFunction, self, hFilterFunction);
       end
    end;

   {$ifdef wwDelphi3Up}
    procedure TwwQuery.OpenCursor(InfoQuery: Boolean);
   {$else}
    procedure TwwQuery.OpenCursor;
   {$endif}
    begin
       {$ifdef wwDelphi3Up}
       inherited OpenCursor(InfoQuery);
       {$else}
       inherited OpenCursor;
       {$endif}
       wwSaveAnswerTable(self, Handle, FAnswerTable);
    end;

    function TwwQuery.GetControltype: TStrings;
    begin
         Result:= FControlType;
    end;

    procedure TwwQuery.SetControlType(sel : TStrings);
    begin
       FControlType.assign(sel);
    end;

    function TwwQuery.GetLookupFields: TStrings;
    begin
       Result:= FLookupFields;
    end;

    procedure TwwQuery.SetLookupFields(sel : TStrings);
    begin
         FLookupFields.assign(sel);
    end;

    function TwwQuery.GetPictureMasks: TStrings;
    begin
       Result:= FPictureMasks
    end;

    procedure TwwQuery.SetPictureMasks(sel : TStrings);
    begin
         FPictureMasks.assign(sel);
    end;

    function TwwQuery.GetLookupLinks: TStrings;
    begin
         Result:= FLookupLinks;
    end;

    procedure TwwQuery.SetLookupLinks(sel : TStrings);
    begin
         FLookupLinks.assign(sel);
    end;

    Procedure TwwQuery.FreeLookupTables;
    var i: integer;
    begin
       for i:= lookupTables.count-1 downto 0 do
       begin
          TwwTable(lookupTables.items[i]).free;
          lookupTables.delete(i);
       end;
    end;

    { Removes obsolete links and control types }
    procedure TwwQuery.RemoveObsoleteLinks;
    begin
       wwDataSetRemoveObsolete(self, FLookupFields, FLookupLinks, FControlType);
    end;

    procedure TwwQuery.DoOnCalcFields;
    begin
       removeObsoleteLinks;
       wwDataSetDoOnCalcFields(self, FLookupFields, FLookupLinks, lookupTables);
       inherited DoOnCalcFields;
    end;

  Function TwwQuery.isValidField(fieldName : string): boolean;
  begin
      result:= wwDataSetIsValidField(self, fieldname);
  end;

  Function TwwQuery.SaveAnswerTable(tableName: string): boolean;
  begin
     result:= wwSaveAnswerTable(self, Handle, tableName);
  end;

  procedure TwwQuery.SetOnFilter(val: TwwQueryFilterEvent);
  begin
     FOnFilter:= val;
     if @val=Nil then wwSetFilterFunction(Nil, self, hFilterFunction)
     else begin
        if not active then exit;
        wwSetFilterFunction(@filterQueryFunction, self, hFilterFunction);
        if hFilterFunction=nil then
           MessageDlg('Local filtering is not supported' +
              ' on a Live-Query which contains a Where clause in the SQL string. ' +
              'To perform a local filter on this query, you will need to set its RequestLive property' +
              ' to False.',  mtWarning, [mbok], 0);
     end

  end;


Function TwwQuery.wwFilterField(AFieldName: string): TParam;
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
      method.code:= @TwwQuery.wwFilterField;
      OtherField := wwDataSet_GetFilterLookupField(Self, curfield, method);

      if OtherField <> nil then begin
        FFilterParam.DataType:= OtherField.DataType;
        wwConvertFieldToParam(OtherField,FFilterParam,FFilterFieldBuffer);
      end;

   end;

   result:= FFilterParam;
end;

procedure TwwQuery.DoBeforePost;
begin
  inherited DoBeforePost;
  if FUsePictureMask then
     wwValidatePictureFields(self, FOnInvalidValue);
end;

Procedure TwwQuery.SetOnFilterOptions(val: TwwOnFilterOptions);
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

function TwwQuery.SetLookupField(Field: TField): boolean;
begin
   result:= wwSetLookupField(self, Field)
end;

{$ifdef wwDelphi3Up}
procedure TwwQuery.ResetMouseCursor;
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

function TwwQuery.IsSequenced: Boolean;
begin
  result:= inherited isSequenced;
  if result then begin
     if Assigned(FOnFilter) then result:= False;
  end
end;

function TwwQuery.GetNextRecords: Integer;
begin
   result:= inherited GetNextRecords;
   ResetMouseCursor;
end;

procedure TwwQuery.DataEvent(Event: TDataEvent; Info: Longint);
begin
   inherited DataEvent(Event, Info);
   ResetMouseCursor;
end;

{$endif}

function TwwQuery.isValidIndexField(FieldName: string; caseSensitive: boolean): boolean;
{$ifdef wwDelphi3Up}
var Fields: TList;
{$endif}
begin
   {$ifndef wwDelphi3Up}
   result:= False;
   {$else}
   Fields := TList.Create;
   try
      result:= false;
      GetFieldList(Fields, FieldName);
      result:= MapsToIndex(Fields, not caseSensitive);
   finally
      Fields.Free;
   end;
   {$endif}
end;

procedure Register;
begin
{  RegisterComponents('InfoPower', [TwwTable]);}
end;

end.
