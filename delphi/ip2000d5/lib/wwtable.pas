unit wwtable;
{
//
// Components : TwwTable
//
// Copyright (c) 1995, 1996, 1997, 1998 by Woll2Woll Software
//
// 11/06/1997 - Changed From database.locale to the dataset's locale.
//              May be able to optimize and just use string length.
//              To handle international character support while filtering.
// 3/5/98 - Call UpdateIndexes if indexdefs.count=0 or if its is still
//          initialized to indexdef component name.
//
// 11/7/98 - Don't load masks in design mode if active is false.  This can
//           end up re-opening the table when the form is closed.
// 11/17/1998 - Workaround Delphi 4 change in implementaion in SetData on BCD fields
// 4/13/99 - SetData may raise exception if data is unassigned
}
interface

{$i wwIfDef}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, DB, DBTables, dialogs, wwfilter, wwStr, wwSystem, wwLocate, wwtypes,
{$IFDEF WIN32}
bde
{$ELSE}
dbiprocs, dbiTypes, dbierrs
{$ENDIF}
;

{$IFDEF VER110}
{$ObjExportAll On}
{$ENDIF}

type
  PtrBoolean = ^Boolean;
  TwwTableDisplayType = TStrings;

  TwwTable = class;
  TwwTableFilterEvent = Procedure(table: TwwTable; var accept: boolean) of object;
  

  TwwTable = class(TTable)
  private
     FFilter : TStrings;
     FQuery: TStrings;
     FPictureMasks: TStrings;
     FLookupFields: TwwTableDisplayType;
     FLookupLinks: TwwTableDisplayType;
     FControlType: TwwTableDisplayType;
     FUsePictureMask: boolean;

     FSyncSQLByRange: boolean;
     FNarrowSearch: boolean;
     FOnInvalidValue: TwwInvalidValueEvent;
     FOnFilterOptions: TwwOnFilterOptions;
     FOnFilterEscape: TDataSetNotifyEvent;
     FOnFilter: TwwTableFilterEvent;
     FFilterBuffer: Pointer;
     FFilterFieldBuffer: PChar;
     hFilter, hFilterFunction: hDBIFilter;
     FFilterParam: TParam;
     FIsSequencable: boolean;
     FNarrowSearchUpperChar: word;

{     QueryFileName: string;}
     QueryType: String;

     FOnDestroy: TNotifyEvent;

     dependentPtrs: TList;
     rangeFilter: hDBIFilter;
     isOpen: boolean;

     PdxMasks: TStrings;
     InitPdxMasks: boolean;
     CallCount: integer;

     function getLookupFields: TStrings;
     procedure setLookupFields(sel : TStrings);
     function getPictureMasks: TStrings;
     procedure setPictureMasks(sel : TStrings);

     function getLookupLinks: TStrings;
     procedure setLookupLinks(sel : TStrings);
     function getControlType: TStrings;
     procedure setControlType(sel : TStrings);
     procedure setFilterArray(sel: TStrings);
     Function getFilter: TStrings;
     procedure SetOnFilter(val: TwwTableFilterEvent);
     Function GetFilterCount: Longint;
     Procedure SetQuery(sel: TStrings);
     Function isSequencableTable: boolean;
     procedure SetTableName(const Value: TFileName);
     function GetTableName: TFileName;
     procedure DoInitPdxMasks;
     Function FindFieldsToIndex(AIndexFields: string;
         CaseSensitive, exactFieldMatch: boolean;
         var newIndexName: string): boolean;
     Procedure SetOnFilterOptions(val: TwwOnFilterOptions);

  protected
     procedure PrepareCursor; override;
     {$ifdef wwDelphi3Up}
     procedure OpenCursor(InfoQuery: Boolean); override;
     {$else}
     procedure OpenCursor; override;
     {$endif}
     procedure CloseCursor; override;
     Function CreateHandle:  HDBICur; override;
     Function PerformQuery(var AdbiHandle: HDBICur): DBIResult;
     procedure DoBeforePost; override; { For picture support }
     procedure InitFieldDefs; override;
     procedure DoOnCalcFields; override;  { Also promote to public }
     Function GetIndexFieldName: string;
     Procedure SetIndexFieldName(val: string);
{$ifdef wwDelphi3Up}
     procedure DataEvent(Event: TDataEvent; Info: Longint); override;
     function GetNextRecords: Integer; override;
     Procedure ResetMouseCursor;
{$endif}

  public
    UpToDate: boolean;         {Woll2Woll Internal only used if its a calculated field lookup link table }
    UpToDateRes: boolean;      {Woll2Woll Internal only used if its a calculated field lookup link table }
    CalcLookupLinks: String;   {Woll2Woll Internal only used if its a calculated field lookup link table }
    wwInternalPtr: Pointer;    {Woll2Woll Internal use only}
    inFilterEvent: boolean;    {Woll2Woll Internal use only}
    InLookupLink: boolean;     {Woll2Woll Internal use only}
    InFindRecordCount: integer; {Woll2Woll Internal use only}
    IgnoreMasterLink: boolean;  {Woll2Woll Internal use only}
    lookupTables: TList;       { List of lookup tables }

    {$ifdef wwDelphi3Up}
    ProcessingOnFilter: boolean;
    function IsSequenced: Boolean; override;
    {$endif}

    property IsSequencable : boolean read FisSequencable;
    property FilterCount: Longint read GetFilterCount;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    Procedure RefreshLinks;

    Function IsValidField(fieldName : string): boolean;
    procedure RemoveObsoleteLinks;

    Function SetToIndexContainingFields(selected: TStrings): boolean;
    Function SetToIndexContainingField(selected: string): boolean;
    procedure SyncSQLTable(lookupTable: TwwTable);
    Procedure FreeLookupTables;
    Function wwFindNearest(key: string; FieldNo: integer): boolean;
    function wwFindKey(const KeyValues: array of Const): Boolean;
    function wwFindRecord(
       KeyValue: string;
       LookupField: string;
       MatchType: TwwLocateMatchType;
       CaseSensitive: boolean): boolean;

    procedure wwChangeIndex(a_indexItem: TIndexDef);
    procedure wwChangeIndexName(a_indexName: string);
    procedure AddDependentTablePtr(a_value: PtrBoolean);
    procedure RemoveDependentTablePtr(a_value: PtrBoolean);
    procedure wwSetRangeStart(const startValues: Array of Const);

    Function Pack(var statusMsg: string): boolean;

    Function setFilter(sel: string): boolean;
    Function FilterString: string;
    Function IsParadoxTable: boolean;
    Function IsDBaseTable: boolean;
    Function FilterActivate: boolean;
    Function wwFilterField(AFieldName: string): TParam;
    Function IndexToFields(aIndexName: string): string; { Convert index name to index fields}
    Function FieldsToIndex(aIndexFields: string): string;
    Function FieldstoIndexWithCase(aIndexFields: string; caseSensitive: boolean): string;
    Function GetDBPicture(curFieldName: string): string;
    Procedure UpdateIndexes;
    procedure FastCancelRange;
    procedure ClearCurrentRangeBuffers; { Call this before changing indexes on a detail table }
    function SetLookupField(Field: TField): boolean;
    {$ifdef wwDelphi3Up}
    function isCaseInsensitiveIndex: boolean;
    {$endif}
    procedure LoadPdxMasks;  { 4/18/98 - Provide way to reload masks }

    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy; {Woll2Woll Internal use only}
    property IndexFieldName: string read GetIndexFieldName write SetIndexFieldName;

  published
    property LookupFields : TStrings read getLookupFields write setLookupFields stored True;
    property LookupLinks : TStrings read getLookupLinks write setLookupLinks stored True;
    property ControlType : TStrings read getControlType write setControltype stored True;
    property PictureMasks: TStrings read GetPictureMasks write SetPictureMasks;

    property wwFilter : TStrings read getFilter write setFilterArray;
    property SyncSQLByRange: boolean read FSyncSQLByRange write FSyncSQLByRange;
    property NarrowSearch: boolean read FNarrowSearch write FNarrowSearch;
    property NarrowSearchUpperChar: word read FNarrowSearchUpperChar write FNarrowSearchUpperChar default 255;

    property Query: TStrings read FQuery write SetQuery;
    property TableName read GetTableName write SetTableName;
    property ValidateWithMask: boolean read FUsePictureMask write FUsePictureMask;
    property OnInvalidValue: TwwInvalidValueEvent read FOnInvalidValue write FOnInvalidValue;

    property OnFilter: TwwTableFilterEvent read FOnFilter write SetOnFilter;
    property OnFilterEscape: TDataSetNotifyEvent read FOnFilterEscape write FOnFilterEscape;
    property OnFilterOptions: TwwOnFilterOptions read FOnFilterOptions write SetOnFilterOptions
       default [ofoEnabled, ofoShowHourGlass];
  end;

  { Memo stream to support retrieving of records even during insert mode }
  {$ifndef wwDelphi3Up}
  TwwMemoStream = class(TStream)
  private
    FField: TBlobField;
    FDataSet: TDataSet;
    FRecord: PChar;
    FBuffer: PChar;
    FFieldNo: Integer;
    FOpened: Boolean;
    FPosition: Longint;
    function GetBlobSize: Longint;
    procedure CreateCommon(Field: TBlobField; InFilter: boolean);
  public
    constructor Create(Field: TBlobField);
    constructor CreateInFilter(Field: TBlobField; dummy: integer);
    destructor Destroy; override;
    function Read(var Buffer; Count: Longint): Longint; override;
    function Seek(Offset: Longint; Origin: Word): Longint; override;
    {$ifdef win32}
    function Write(const Buffer; Count: Longint): Longint; override;
    {$endif}
  end;
  {$endif}

procedure Register;

implementation

  uses wwcommon, dbconsts, wwdatsrc, wwpict, wwintl;

  const UNKNOWN = '?';

    constructor TwwTable.create(AOwner: TComponent);
//    var TempParams: TParams;
    begin
      inherited Create(AOwner);

      FLookupFields:= TStringList.create;  { Must be a TStringList type }
      FLookupLinks:= TStringList.create;
      FControlType:= TStringList.create;
      FFilter:= TStringList.create;
      FQuery:= TStringList.create;
      FPictureMasks:= TStringList.create;
      lookupTables:= TList.create;       { List of lookup tables }
      dependentPtrs:= TList.create;
      CalcLookupLinks:= '';
      FSyncSQLByRange:= False;
      FNarrowSearch:= False;

//      {$ifdef wwDelphi4Up}
//      TempParams := TParams.Create(self);
//      {$else}
//      TempParams := nil;
//      {$endif}
      FFilterParam:= TParam.create(nil, ptUnknown);

      wwInternalPtr:= Nil;
      PdxMasks:= TStringlist.create;

      rangeFilter:= Nil;
      FUsePictureMask:= True;
      InitPdxMasks:= True;
      NarrowSearchUpperChar:= 255;
      FOnFilterOptions:= [ofoEnabled, ofoShowHourGlass];
    end;

    destructor TwwTable.Destroy;
    var i: integer;
        valPtr: PtrBoolean;
    begin
      FreeLookupTables;

      FLookupFields.Free;
      FLookupLinks.Free;
      FControlType.Free;
      FFilter.Free;
      FQuery.Free;
      FQuery:= Nil;
      FPictureMasks.Free;
      FPictureMasks:= Nil;
      PdxMasks.Free;

      lookupTables.free;
      lookupTables:= Nil;

      for i:= 0 to dependentPtrs.count-1 do
      begin
         valPtr:= DependentPtrs.items[i];
         valPtr^:= True;
      end;

      dependentPtrs.Free;
      dependentPtrs:=Nil;

      if FFilterFieldBuffer<>Nil then
         FreeMem(FFilterFieldBuffer, wwFilterMemoSize);
      FFilterParam.Free;
      if Assigned(FOnDestroy) then FOnDestroy(self);
      inherited Destroy;
    end;

    Function TwwTable.isDBaseTable: boolean;
    begin
      Result := (TableType = ttDBase) or
        (CompareText(ExtractFileExt(TableName), '.DBF') = 0);
    end;

Function TwwTable.GetFilterCount: Longint;
var count: Longint;
    FilterCountProc  : Function (hcursor: hDBICur; var iRecCount: Longint): DBIResult;
    hIdapi: THandle;
begin
   if (TableType > ttASCII) then result:= RecordCount { 3rd party engine }
   else begin
      {$ifdef win32}
      result:= RecordCount;
      exit;
      {$endif}
      hIdapi := GetModuleHandle('IDAPI01');
      @FilterCountProc:=GetProcAddress(hIdapi, 'dbiGetExactRecordCount');
      FilterCountProc(Handle, count);
      result:= count;
   end
end;

function filterFunction(
      ulClientData  : Longint;
      pRecBuf       : Pointer;
      iPhyRecNum    : Longint
 ): Integer; export;
{$IFDEF WIN32}
 stdcall;  {stdcall added for win95}
{$ENDIF}
var filteredTable: TwwTable;
    TempResult: boolean;
begin
   filteredTable:= TwwTable(ulClientData);
   if (csDestroying in filteredTable.ComponentState) then begin
      result:= 1;
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
         OnFilter(filteredTable, TempResult);
         if TempResult then result:= 1 else result:= 0;
         inFilterEvent:= False;;

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
      else result:= 1
   end
end;

    procedure TwwTable.SetOnFilter(val: TwwTableFilterEvent);
    begin
       FOnFilter:= val;
       if @val=Nil then wwSetFilterFunction(Nil, self, hFilterFunction)
       else wwSetFilterFunction(@filterFunction, self, hFilterFunction);
    end;

    Function TwwTable.IsParadoxTable: boolean;
    var temptableName: string;
    begin
       if TableType = ttDefault then begin
          tempTableName:= tablename;
          tempTableName:= lowercase(tempTablename);
          result := (pos('.db', tempTableName)>0) and
                       (tempTableName[length(tempTableName)]='b');
       end
       else begin
          result:= TableType = ttParadox;
       end;
    end;

    Function TwwTable.IsSequencableTable: boolean;
    begin
       result:= False;
       if Handle=Nil then exit;
       if isParadoxTable then begin
          result:= True;
          exit;
       end;
{       result:= (not isDBASETable) and (TableType <= ttASCII) and
                (dbiGetSeqNo(Handle, temp)=0);                    }
       result:= False;
    end;

    Function TwwTable.Pack(var statusMsg: string): boolean;
    var
       rslt: DBIResult;
       szErrMsg: DBIMSG;
       pTblDesc: pCRTblDesc;
       bExclusive: Boolean;
       bActive: Boolean;
       isParadox, isdBASE: boolean;
       tempTableName: string;
       props: CurProps;  { Preserve password }
    begin
       Result:= False;
       StatusMsg:= '';

       if TableType = ttDefault then begin
          tempTableName:= tablename;
          tempTableName:= lowercase(tempTablename);
          isParadox := (pos('.db', tempTableName)>0) and
                       (tempTableName[length(tempTableName)]='b');
          isDBASE:= pos('.dbf', temptableName)>0;
       end
       else begin
          isParadox:= TableType = ttParadox;
          isDBASE:= TableType = ttDBASE;
       end;

       if isParadox or isdBASE then begin
          bExclusive:= Exclusive;
          bActive:= Active;
          DisableControls;
          Close;
          Exclusive:= True;
       end
       else begin
          StatusMsg:= 'Invalid table type for packing.';
          exit;
       end;

       if isParadox then begin
          if wwMemAvail(Sizeof(CRTblDesc)) then begin
             StatusMsg:=  'Cannot pack table.  Insufficient memory. ';
          end
          else begin
             GetMem(pTblDesc, SizeOf(CRTblDesc));
             FillChar(pTblDesc^, SizeOf(CRTblDesc), 0);
             with pTblDesc^ do begin
                strPCopy(szTblName, Tablename);
                strPCopy(szTblType, szParadox);

                { Check if table is password protected }
                active:= True;
                check(dbiGetCursorProps(Handle, props));
                bProtected:= props.bProtected;
                active:= False;

                bPack:= True;
             end;
             Screen.cursor:= crHourGlass;

             SetDBFlag(dbfOpened, True);
             rslt:= dbiDoRestructure(DBHandle, 1, pTblDesc, nil, nil, nil, False);
             if rslt <> DBIERR_NONE then begin
                dbiGetErrorString(rslt, szErrMsg);
                statusMsg:= szErrMsg;
             end
             else result:= True;
             SetDBFlag(dbfOpened, False);
             FreeMem(pTblDesc, SizeOf(CRTblDesc) );

             Screen.cursor:= crDefault;

          end
       end
       else if isdBASE then begin
          Screen.cursor:= crHourGlass;
          Open;
          rslt:= dbiPackTable(DBHandle, Handle, nil, nil, True);
          Screen.cursor:= crDefault;

          if rslt <> DBIERR_NONE then begin
             dbiGetErrorString(rslt, szErrMsg);
             statusMsg:= szErrMsg;
          end
          else result:= True;

       end;

       Close;
       Exclusive:= bExclusive;
       Active:= bActive;
       EnableControls;

    end;

    procedure TwwTable.AddDependentTablePtr(a_value: PtrBoolean);
    begin
       if dependentPtrs<>Nil then
          dependentPtrs.add(a_value);
    end;

    procedure TwwTable.RemoveDependentTablePtr(a_value: PtrBoolean);
    begin
       if dependentPtrs<>Nil then
          dependentPtrs.remove(a_value);
    end;

    Procedure TwwTable.FreeLookupTables;
    var i: integer;
    begin
       if lookupTables= Nil then exit;

       for i:= lookupTables.count-1 downto 0 do
       begin
          TwwTable(lookupTables.items[i]).free;
          lookupTables.delete(i);
       end;
    end;

    procedure TwwTable.SetQuery(sel : TStrings);
    begin
       if Active then Active:= False;
       if sel.count>0 then
       begin
          TableName:= '';
          IndexFieldNames:= '';  { Clear fields not related to query }
          MasterSource:= Nil;
          MasterFields:= '';
       end;
       FQuery.assign(sel);
    end;

    function TwwTable.GetLookupFields: TStrings;
    begin
       Result:= FLookupFields;
    end;

    procedure TwwTable.SetLookupFields(sel : TStrings);
    begin
         FLookupFields.assign(sel);
    end;

    function TwwTable.GetPictureMasks: TStrings;
    begin
       Result:= FPictureMasks
    end;

    procedure TwwTable.SetPictureMasks(sel : TStrings);
    begin
         FPictureMasks.assign(sel);
    end;

    function TwwTable.GetControltype: TStrings;
    begin
         Result:= FControlType;
    end;

    procedure TwwTable.SetControlType(sel : TStrings);
    begin
       FControlType.assign(sel);
    end;

    function TwwTable.GetFilter: TStrings;
    begin
         Result:= FFilter;
    end;

    { Close related lookup tables when closing master }
    procedure TwwTable.CloseCursor;
    begin
       FreeLookupTables;
       inherited CloseCursor;
{       if QueryFileName<>'' then
       begin
          SysUtils.DeleteFile(QueryFileName);
          QueryFileName:= '';
          QueryType:= '';
       end;
}
       if (FQuery<>Nil) and (FQuery.count>0) then
       begin
          TableName:= '';
       end
    end;

     Function TwwTable.CreateHandle:  HDBICur;
     begin
        Result:= Nil;
        if (FQuery.count>0) then begin
           TableName:= '';
           IndexFieldNames:= '';  { Clear fields not related to query }
           MasterSource:= Nil;
           MasterFields:= '';
           Check(PerformQuery(result))
        end
        else result:= inherited CreateHandle;
     end;

   {$ifdef wwDelphi3Up}
    procedure TwwTable.OpenCursor(InfoQuery: Boolean);
   {$else}
    procedure TwwTable.OpenCursor;
   {$endif}
    var FirstLine: string;
        curpos: integer;
    begin

       if (FQuery.count>0) then
       begin

          FirstLine:= lowercase(FQuery.strings[0]);
          curpos:= 1;
          if strGetToken(FirstLine, ' ', curpos)='query' then
             QueryType:= 'QBE'
          else QueryType:= 'SQL';

       end;

      {$ifdef wwDelphi3Up}
       inherited OpenCursor(InfoQuery);
      {$else}
       inherited OpenCursor;
      {$endif}

       FisSequencable:= isSequencableTable;
    end;

    procedure TwwTable.PrepareCursor;
    begin
       inherited PrepareCursor;
{       if Assigned(FOnPrepareCursor) then FOnPrepareCursor(self);}

       isOpen:= True;
       if (FilterString<>'') or
           assigned(FOnFilter) then FilterActivate;
       isOpen:= False;

    end;


    Function TwwTable.FilterString: string;
    var filt: string;
        line: string;
        i: integer;
    begin
       filt:= '';
       for i:= 0 to FFilter.count-1 do begin
          line:= FFilter[i];
          strStripTrailing(line, [' ', #9]);
          if (length(line)>0) then begin
             if length(filt)>0 then filt:= filt + ' AND (' + line +')'
             else filt:= line;
          end
       end;
       result:= filt;
    end;

    Function TwwTable.FilterActivate: boolean;
    var filt: string;
    begin
       filt:= FilterString;
       result:= wwSetFilter(filt, self, hFilter, isOpen);

       if assigned(FOnFilter)then begin
          wwSetFilterFunction(@filterFunction, self, hFilterFunction);
       end
    end;

    Function TwwTable.SetFilter(sel: String): boolean;
    begin
       if not wwSetFilter(sel, self, hFilter, False) then begin
          MessageDlg('Fail to set filter', mtWarning, [mbok], 0);
          result:= False;
       end
       else begin
          FFilter.clear;
          FFilter.add(sel);
          result:= True;
       end
    end;

    procedure TwwTable.SetFilterArray(sel: TStrings);
    begin
       FFilter.assign(sel);

       if not active then exit;
       if not wwSetFilter(FilterString, self, hFilter, False) then begin
          MessageDlg('Fail to set filter', mtWarning, [mbok], 0);
       end
    end;

    function TwwTable.GetLookupLinks: TStrings;
    begin
         Result:= FLookupLinks;
    end;

    procedure TwwTable.SetLookupLinks(sel : TStrings);
    begin
         FLookupLinks.assign(sel);
    end;

    { Removes obsolete links and control types }
    procedure TwwTable.RemoveObsoleteLinks;
    begin
       wwDataSetRemoveObsolete(self, FLookupFields, FLookupLinks, FControlType);
    end;

    procedure TwwTable.DoOnCalcFields;
    begin
       removeObsoleteLinks;
       wwDataSetDoOnCalcFields(self, FLookupFields, FLookupLinks, lookupTables);
       inherited DoOnCalcFields;
    end;

procedure TwwTable.wwChangeIndexName(a_indexName: string);
var i: integer;
begin
   UpdateIndexes;

   for i:= 0 to IndexDefs.count-1 do begin
      with IndexDefs do begin
          if lowercase(Items[i].name) = lowercase(a_indexName) then begin
             wwChangeIndex(Items[i]);
             break;
          end
       end
   end;
end;

procedure TwwTable.wwChangeIndex(a_indexItem: TIndexDef);
begin
   wwTableChangeIndex(self, a_indexItem);
end;

Function TwwTable.SetToIndexContainingFields(selected: TStrings): boolean;
var curpos: integer;
    IndexFieldName: String;
begin
   result:= False;
   if selected.count<=0 then exit;

   curPos:= 1;
   IndexFieldName:= strGetToken(Selected[0], #9, curpos);

   result:= setToIndexContainingField(IndexFieldName);

end;

Function TwwTable.SetToIndexContainingField(selected: String): boolean;
var curpos: integer;
    found: boolean;
    tempIndexName: string;
    newIndexFields: string;

    { Get detail fields used to link to master table }
    function GetDetailLinkFields: string;
    var tempStr: string;
        count, curpos, i: integer;
    begin
       curpos:= 1;
       count:= 0;
       repeat
          if strGetToken(masterFields, ';', curpos)<>'' then count:= count + 1
          else break;
       until False;

       tempStr:= indexFields[0].FieldName;
       for i:= 1 to count-1 do tempStr:= tempStr + ';' + indexFields[i].FieldName;
       result:= tempstr;

    end;

    { Requested Index is different - Maybe unnecessary since BDE may already optimze this}
    Function DifferentIndex(tempIndexName: string): boolean;
    begin
       if (IndexFieldNames='') then
       begin
          result:= (Uppercase(IndexName)<>Uppercase(tempIndexName));
       end
       else begin
          result:= Uppercase(FieldsToIndex(IndexFieldNames))<>Uppercase(tempIndexName);
       end
    end;

begin
   result:= False;
   Found:= False;
   if selected='' then exit;
   if (FQuery.count>0) then exit; { Don't change indexes if query }

   UpdateIndexes;

   { 5/4/98 - Don't switch indexes if active index already works }
   if (MasterSource=Nil) and (indexFieldCount>0) and
      wwEqualStr(indexFields[0].FieldName, selected) then
   begin
      result:= True;
      exit;
   end;

   inc(inFindRecordCount);
   try
      if (MasterSource<>Nil) and (not ignoreMasterLink) then begin
         curpos:= 1;
         selected:= strGetToken(Selected, ';', curpos);
         newIndexFields:= GetDetailLinkFields + ';' + selected;
         tempIndexName:= FieldsToIndex(newIndexFields);
      end
      else tempIndexName:= FieldsToIndex(selected);

      if tempIndexName<>UNKNOWN then
      begin
         Found:= True;
         if DifferentIndex(tempIndexName) then
         begin
            if (MasterSource<>nil) then  { Forces detail range to be re-applied}
               ClearCurrentRangeBuffers;
            wwChangeIndexName(tempIndexName);
         end
      end
   finally
      dec(InFindRecordCount);
   end;

   result:= Found;

end;


  Function TwwTable.IsValidField(fieldName : string): boolean;
  begin
      result:= wwDataSetIsValidField(self, fieldname);
  end;


procedure TwwTable.SyncSQLTable(lookupTable: TwwTable);
var
   j: integer;
begin
   if (lookupTable=self) then exit;

   Screen.cursor:= crHourGlass;

   DisableControls;

  { Synchronize to lookupTable }
   setRangeStart;
   for j:= 0 to indexFieldCount-1 do
   begin
       IndexFields[j].asString:=
           lookupTable.fieldByName(indexFields[j].fieldname).text;
   end;
   setRangeEnd;
   ApplyRange;
   EnableControls;
   Screen.cursor:= crDefault;

end;

Function TwwTable.wwFindNearest(key: string; FieldNo: integer): boolean;
begin
   inc(inFindRecordCount);
   try
     result:= wwTableFindNearest(self, key, FieldNo);
   finally
     dec(inFindRecordCount);
   end;
end;

function TwwTable.wwFindRecord(
   KeyValue: string;
   LookupField: string;
   MatchType: TwwLocateMatchType;
   caseSensitive: boolean): boolean;
begin
   inc(inFindRecordCount);
   try
      result:= wwDataSetFindRecord(self, KeyValue, LookupField, MatchType, caseSensitive);
   finally
      dec(inFindRecordCount);
   end;
end;

function TwwTable.wwFindKey(const KeyValues: array of const): Boolean;

     Function GetTempStr(i: integer): string;
     var tempStr : string;
     begin
         result:= '';

         case KeyValues[i].vType of
           vtInteger: tempStr:= inttoStr(KeyValues[i].VInteger);
           vtBoolean: if (KeyValues[i].vBoolean) then tempStr:= 'True' else tempStr:= 'False';
           vtChar: tempStr:= KeyValues[i].VChar;
           vtExtended: tempStr:= FloatToStr(KeyValues[i].VExtended^);
           vtString: tempStr:= KeyValues[i].VString^;
           vtPChar: tempStr:= strPas(KeyValues[i].VPChar);
           {$ifdef win32}
           vtAnsiString: tempStr:= String(KeyValues[i].VAnsiString);
           {$endif}
         end;
         result:= tempStr;
     end;

    { If already on this record then skip findkey }
    Function isAlreadyFound: boolean;
    var i: integer;
        tempStr: string;
    begin
      result:= True;
      for I := 0 to High(KeyValues) do begin
         tempStr:= GetTempStr(i);
         if (lowercase(tempStr) <> lowercase(indexFields[i].asString)) then
         begin
            result:= False;
            break;
         end
      end
    end;

begin
   result:= False;

   if indexFieldCount=0 then exit;

   if (High(KeyValues)>=indexFieldCount) then begin
      MessageDlg('Table ' + name + ': FindKey has too many lookup values for index ' + indexName,
                        mtWarning, [mbok], 0);
      exit;
   end;

   inc(inFindRecordCount);
   try if (not database.isSqlBased) or (not SyncSQLByRange) then begin
       if indexFieldCount>0 then begin
          if NarrowSearch then CancelRange; {5/25/95}
          if not isAlreadyFound then result:= FindKey(KeyValues)
          else result:= True;
       end
       else begin
          { Perform sequential search }
          MessageDlg('Table ' + name + ': Table index not found', mtWarning, [mbok], 0);
       end
   end
   else begin
      if (not isAlreadyFound) or (BOF and EOF) or
         (GetKeyBuffer(kiRangeEnd)^.modified and (not inLookupLink)) then  { If blank result set then reset range }
      begin
         if GetTempStr(0)='' then
         begin
            { Don't allow Null range - Some SQL's (i.e. Oracle) do not support Null starting range}
            if inLookupLink then result:= False
            else CancelRange
         end
         else begin
            if inLookupLink then SetRange(KeyValues, KeyValues)  { 12/4/96 - Limit upper and lower range for lookup link }
            else wwSetRangeStart(KeyValues);
            First;
            result:= isAlreadyFound;
         end;
      end
      else result:= True;
   end
   finally
      dec(inFindRecordCount);
   end;

end;

procedure TwwTable.SetTableName(const Value: TFileName);
var tempValue: string;
begin
   inherited TableName:= Value;
   tempValue:= lowercase(Value);
   if (Value<>'') {and
      (pos('.qbe', tempValue)=0) and (pos('.sql', tempValue)=0) }then
      FQuery.Clear;
end;

function TwwTable.GetTableName: TFileName;
begin
   result:= inherited TableName;
end;

{$ifndef wwDelphi3Up}
procedure TwwMemoStream.CreateCommon(Field: TBlobField; InFilter: boolean);
begin
  FField := Field;
  FDataSet := Field.DataSet;
  FRecord := FDataSet.ActiveBuffer;
  FFieldNo := Field.FieldNo;

  FBuffer := AllocMem(FDataSet.RecordSize);
  FRecord := FBuffer;

  if not InFilter then
     with FDataSet do
        if (State in [dsBrowse, dsEdit, dsInsert]) then UpdateCursorPos;
  if DbiGetRecord(FDataSet.Handle, dbiNoLock, FBuffer, nil) <> 0 then Exit;

  Check(DbiOpenBlob(FDataSet.Handle, FRecord, FFieldNo, dbiReadOnly));
  FOpened := True;
end;

constructor TwwMemoStream.Create(Field: TBlobField);
begin
   CreateCommon(Field, False);
end;

constructor TwwMemoStream.CreateInFilter(Field: TBlobField; dummy: integer);
begin
   CreateCommon(Field, True);
end;

destructor TwwMemoStream.Destroy;
begin
  if FOpened then
  begin
     DbiFreeBlob(FDataSet.Handle, FRecord, FFieldNo);
  end;
  if FBuffer <> nil then FreeMem(FBuffer, FDataSet.RecordSize);
end;

function TwwMemoStream.Read(var Buffer; Count: Longint): Longint;
var
  Status: DBIResult;
  N: Word;
  L: Longint;
  P: Pointer;
begin
  Result := 0;
  if FOpened then
  begin
    P := @Buffer;
    while Count > 0 do
    begin
      if Count > $8000 then N := $8000
      else N := Count;

      Status := DbiGetBlob(FDataSet.Handle, FRecord, FFieldNo, FPosition,
        N, P, L);
      case Status of
        DBIERR_NONE, DBIERR_ENDOFBLOB:
          begin
            if (FField is TMemoField) and (FField as TMemoField).Transliterate then
              NativeToAnsiBuf(FDataSet.Locale, P, P, L);
            Inc(FPosition, L);
            Inc(Result, L);
          end;
        DBIERR_INVALIDBLOBOFFSET:
          {Nothing};
      else
        DbiError(Status);
      end;
      if Status <> DBIERR_NONE then Break;
      Dec(Count, N);
      Inc(LongInt(P), N);

    end;
  end;
end;

{$ifdef win32}
function TwwMemoStream.Write(const Buffer; Count: Longint): Longint;
begin
   result:= 0;
end;
{$endif}

function TwwMemoStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  case Origin of
    0: FPosition := Offset;
    1: Inc(FPosition, Offset);
    2: FPosition := GetBlobSize + Offset;
  end;
  Result := FPosition;
end;

function TwwMemoStream.GetBlobSize: Longint;
begin
  Result := 0;
  if FOpened then
    Check(DbiGetBlobSize(FDataSet.Handle, FRecord, FFieldNo, Result));
end;

{$endif}

procedure TwwTable.wwSetRangeStart(const startValues: Array of Const);
begin
   CheckBrowseMode;
   SetKeyFields(kiRangeStart, StartValues);
   SetRangeEnd;   { Clears ending range buffer }
   ApplyRange;
end;

Function TwwTable.wwFilterField(AFieldName: string): TParam;
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
   else begin

      method.data:= self;
      method.code:= @TwwTable.wwFilterField;
      OtherField := wwDataSet_GetFilterLookupField(Self, curfield, method);

{      OtherField := wwDataSet_GetFilterLookupField(Self,curfield);}

      if OtherField <> nil then begin
        FFilterParam.DataType:= OtherField.DataType;
        wwConvertFieldToParam(OtherField,FFilterParam,FFilterFieldBuffer);
      end;

   end;

   result:= FFilterParam;
end;

Function TwwTable.IndexToFields(aIndexName: string): string;
var i: integer;
begin
   UpdateIndexes;

   result:= '';
   for i:= 0 to IndexDefs.count-1 do begin
      with IndexDefs do begin
         { 9/5/96 - In case table contains index named PrimaryKey }
         if (aIndexName = Items[i].Name) or
            ((aIndexName = '') and (Items[i].Name='PrimaryKey')) then
         begin
             result:= Items[i].Fields;
             break;
         end
      end
   end
end;

function TwwTable.FindFieldsToIndex(AIndexFields: string;
         CaseSensitive, exactFieldMatch: boolean;
         var newIndexName: string): boolean;
var i: integer;
begin
   result:= false;
   for i:= 0 to IndexDefs.count-1 do begin
      with IndexDefs do begin
          if (pos(uppercase(aIndexFields), uppercase(Items[i].fields))=1)
              and ((ixCaseInsensitive in Items[i].Options)=not caseSensitive) then
          begin
             if exactFieldMatch then
                if length(aIndexFields)<>length(Items[i].fields) then continue;

             { Don't accept index names containing other index field names (i.e. field codedesc, field code)}
             if (length(items[i].fields)>length(aIndexFields)) and
                (items[i].fields[length(aIndexFields)+1]<>';') then continue;
             result:= True;
             NewIndexName:= Items[i].name;
             exit;
          end
       end
   end;
end;

{$ifdef wwDelphi3Up}
function TwwTable.isCaseInsensitiveIndex: boolean;
var Fields: TList;
begin
   Fields := TList.Create;
   try
      result:= false;
      GetFieldList(Fields, IndexFieldName);
      result:= MapsToIndex(Fields, True);
   finally
      Fields.Free;
   end;
end;
{$endif}

Function TwwTable.FieldstoIndexWithCase(aIndexFields: string; caseSensitive: boolean): string;
begin
   result:= UNKNOWN;
   UpdateIndexes;

   if FindFieldsToIndex(AIndexFields, caseSensitive, True, result) then exit;
   if FindFieldsToIndex(AIndexFields, caseSensitive, False, result) then exit;
end;

{ Call FieldsToIndexWithCase method instead }
Function TwwTable.FieldstoIndex(aIndexFields: string): string;
begin
   result:= UNKNOWN;
   UpdateIndexes;

   if FindFieldsToIndex(AIndexFields, False, True, result) then exit;
   if FindFieldsToIndex(AIndexFields, True, True, result) then exit;

   if FindFieldsToIndex(AIndexFields, False, False, result) then exit;
   if FindFieldsToIndex(AIndexFields, True, False, result) then exit;
end;

Function TwwTable.PerformQuery(var AdbiHandle: HDBICur): DBIResult;
var hStmt: HDbiStmt;
    tempQBE: TStrings;
    QBEBuf: PChar;
begin
   AdbiHandle:= Nil;

   tempQBE:= TStringList.create;
   tempQBE.assign(FQuery);

   QBEBuf:= wwGetQueryText(tempQBE, queryType<>'QBE');

   {$ifdef win32}
   if QueryType='QBE' then
      Check(DbiQAlloc(DBHandle, qrylangQBE, hStmt))
   else
      Check(DbiQAlloc(DBHandle, qrylangSQL, hStmt));
   {$else}
   if QueryType='QBE' then begin
      result:= DbiQPrepare(DBHandle, qryLangQBE, QBEBuf, hStmt);
      if result<>DBIERR_NONE then exit;
   end
   else begin
      result:= DbiQPrepare(DBHandle, qryLangSQL, QBEBuf, hStmt);
      if result<>DBIERR_NONE then exit;
   end;
   {$endif}

   try
      if QueryType='QBE' then begin
         Check(dbiSetProp(hDBIObj(hStmt), stmtAUXTBLS, 0));
         Check(dbiSetProp(hDBIObj(hStmt), stmtBLANKS, 1));
      end
      else begin
      end;

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


procedure TwwTable.DoBeforePost;
begin
  inherited DoBeforePost;
  if FUsePictureMask then
     wwValidatePictureFields(self, FOnInvalidValue);
end;

procedure TwwTable.LoadPdxMasks;
begin
   InitPdxMasks:= True;
   DoInitPdxMasks;
end;

Procedure TwwTable.DoInitPdxMasks;
var
  VCursor: HDBICur;
  STableName: array[0..DBIMAXTBLNAMELEN - 1] of Char;
  ValCheckDesc: VCHKDesc;
  isActive: boolean;
  i: integer;
begin
   if not InitPdxMasks then exit;
   if not isParadoxTable then exit;
   if (not active) and (csAncestor in ComponentState) then exit; { 10/22/98 }
   if (not active) and (csDesigning in ComponentState) then exit; { 11/7/98 }

   InitPdxMasks:= False;

   { Table needs to be active for picture masks to be properly loaded }
   isActive:= Active;
   if not isActive then
     {$ifdef wwDelphi3Up}
      OpenCursor(False);
     {$else}
      OpenCursor;
     {$endif}


   AnsiToNative(DBLocale, TableName, STableName, SizeOf(STableName) - 1);

   PdxMasks.clear;
   if (DbiOpenVChkList(DBHandle, sTableName, 'PARADOX', VCursor)=0) then begin
      while DbiGetNextRecord(VCursor, dbiNoLock, @ValCheckDesc, nil) = 0 do begin
         for i:= 0 to FieldCount-1 do
            if Fields[i].FieldNo=ValCheckDesc.iFldNum then
            begin
               PdxMasks.add(Fields[i].FieldName + #9 + StrPas(ValCheckDesc.szPict));
               break;
            end
      end;
      DbiCloseCursor(VCursor);
   end;

   if not isActive then CloseCursor;

end;

Function TwwTable.GetDBPicture(curFieldName: string): string;
var
   curPos, i: integer;
   FieldName: string;
begin
   result:= '';
   if not isParadoxTable then exit;

   DoInitPdxMasks;

   for i:= 0 to PdxMasks.count-1 do begin
      curPos:= 1;
      FieldName:= strGetToken(PdxMasks[i], #9, curpos);
      if (curFieldName = FieldName) then
      begin
         result:= strGetToken(PdxMasks[i], #9, curPos);
         break;
      end
   end;
end;

Procedure TwwTable.RefreshLinks;
var i: integer;
begin
    for i:= 0 to LookupTables.count-1 do
       if TwwTable(LookupTables[i]).active then
          TwwTable(LookupTables[i]).refresh;
end;

Procedure TwwTable.UpdateIndexes;
begin
   if (IndexDefs.count=0) or
      ((IndexDefs.count>=1) and (IndexDefs.Items[0].Name = Name + 'Index0')) then
      IndexDefs.update;
end;

procedure TwwTable.InitFieldDefs;
begin
   if (Query.Count=0) or (Handle<>nil) then inherited InitFieldDefs
   else begin
      if not Active then try
        {$ifdef wwDelphi3Up}
         OpenCursor(True);
        {$else}
         OpenCursor;
        {$endif}
      finally
         CloseCursor;
      end;
   end
end;

Procedure TwwTable.SetIndexFieldName(val: string);
begin
   SetToIndexContainingField(val);
end;

Function TwwTable.GetIndexFieldName: string;
var indexFlds: string;
    curpos: integer;
begin
   curpos:= 1;
   indexFlds:= indexFieldNames;
   if indexFlds='' then indexFlds:= IndexToFields(indexName);
   if indexFlds='' then result:= ''
   else result:= strGetToken(indexFlds, ';', curpos);
end;

procedure TwwTable.FastCancelRange;
var selected: TStringList;
begin
   if wwInternational.FastSQLCancelRange and database.isSQLBased then
   begin
     selected:= TStringList.create;
     wwDataSetUpdateSelected(self, selected);
     active:= False;
     active:= True;
     wwDataSetUpdateFieldProperties(self, selected);
     selected.free;
   end
   else CancelRange
end;


Procedure TwwTable.SetOnFilterOptions(val: TwwOnFilterOptions);
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

procedure TwwTable.ClearCurrentRangeBuffers;
begin
   SetKeyBuffer(kiCurRangeStart, True);
   SetKeyBuffer(kiCurRangeend, True);
end;

function TwwTable.SetLookupField(Field: TField): boolean;
begin
   result:= wwSetLookupField(self, Field)
end;

{$ifdef wwDelphi3Up}
procedure TwwTable.ResetMouseCursor;
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

function TwwTable.IsSequenced: Boolean;
begin
  result:= inherited isSequenced;
  if result then begin
     if Assigned(FOnFilter) then result:= False;
     if (FilterString<>'') then result:= False;
  end
end;

function TwwTable.GetNextRecords: Integer;
begin
   result:= inherited GetNextRecords;
   ResetMouseCursor;
end;

procedure TwwTable.DataEvent(Event: TDataEvent; Info: Longint);
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
