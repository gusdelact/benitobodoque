unit Wwcommon;
{$T-}  { Disable Typed@ Operator}
{
//
// Components : Common routines
//
// Copyright (c) 1995, 1996, 1997, 1998 by Woll2Woll Software
//
//  7/24/97 - Linked field filter did not work when using multiple lookuptables
//
//  8/14/97 - Optimized logic to speed painting of grid
//            in wwDataSet_GetControl method
//
// 10/16/97 - Skip descending test if using IndexFieldNames
//
// 11/14/97 - Have wwSetLookupField work for virtual datasets
//
// 2/24/98 - Subtrack length(key) when padding NarrowSearchUpperChar
//
// 3/02/98 - Don't specify extension when opening picture-mask table
//
// 3/31/98 - Determine if this is a single line edit control based on passed in rectangle
//
// 9/13/98 - Changed handle to HDC in wwIsSingleLineEdit
// 9/16/98 - WordBool is 2 bytes
// 11/7/98 - Add support for filtering on lookupfields in clientdatasets
//           from the filterdialog.
}
interface

uses classes, db, sysutils, dialogs, wwstr, dbTables, forms, controls,
     wintypes, winprocs, graphics, buttons, wwtypes, wwlocate, wwstorep,
     stdctrls, comctrls,

{$i wwIfDef.pas}

{$IFDEF WIN32}
bde, registry
{$ELSE}
dbiprocs, dbiTypes, dbierrs
{$ENDIF}
;

const
   WW_DB_COMBO = 'Combo';
   WW_DB_LOOKUP_COMBO = 'LookupCombo';  { Backward compatibility with Infopower 1.2}
   WW_DB_EDIT = 'CustomEdit';
   WW_DB_RICHEDIT = 'RichEdit';


type
{$ifdef win32}
  wwSmallString = string;
{$else}
  wwSmallString = string[64];
{$endif}

function wwIsDesigning(control: TControl): boolean;
Function wwGetPictureControl(Control: TComponent; DataSet: TDataSet = nil): TComponent;
Function wwGetPictureMasks(DataSet: TComponent): TStrings;
Function wwGetControlType(dataSet: TComponent): TStrings;
Function wwGetValidateWithMask(dataSet: TDataSet): boolean;
Function wwGetControlTypeControl(Control: TComponent; DataSet: TDataSet = nil): TComponent;
Function wwGetControlInfoInDataSet(component: TComponent): boolean;
Function wwGetPictureMaskFromDataSet(Component: TComponent): boolean;
Function wwGetLookupFields(dataSet: TDataSet): TStrings;
Function wwGetLookupLinks(dataSet: TDataSet): TStrings;
Function wwGetDatabaseName(dataSet: TDataSet): String;
Function wwGetConnectionString(dataSet: TDataSet): String;
Function wwGetTableName(dataSet: TDataSet): String;
Function wwDataSetIsValidField(dataset : TComponent; fieldName : string): boolean;
Procedure wwDataSetUpdateFieldProperties(dataSet: TDataSet; selected: TStrings);
Procedure wwDataSetUpdateSelected(dataSet: TDataSet; selected: TStrings);
Function wwDataSet(dataSet : TDataSet): boolean;
Procedure wwDebug(s: string);
Function wwSetLookupField(dataSet: TDataSet; linkedField: TField): boolean;
procedure wwDataSetDoOnCalcFields(dataSet: TDataSet;
          FLookupFields, FLookupLinks: TStrings;
          lookupTables: TList);
procedure wwDataSetRemoveObsolete(dataSet: TComponent;
          FLookupFields, FLookupLinks, FControlType: TStrings);
Function wwTableFindNearest(dataSet: TDataSet; key: string; FieldNo: integer): boolean;
procedure wwTableChangeIndex(dataSet: TDataSet; a_indexItem: TIndexDef);
Function wwDataSetGetLinks(dataSet: TDataSet; lookupFieldName: string): string;
Function wwDataSetGetDisplayField(dataSet: TDataSet; lookupFieldName: string): string;
Function wwDataSetSyncLookupTable(dataSet: TDataSet; AlookupTable: TDataSet;
                  lookupFieldName: string; var fromField: string): boolean;
Function wwDataSetRemoveObsoleteControls(parentForm: TCustomForm; dataSet: TComponent): boolean;

procedure wwDataSet_SetControl(dataSet: TComponent;
          AFieldName: string; AComponentType: string; AParameters: string);
function wwFieldIsValidValue(fld: TField; key: string): boolean;
Function wwIsValidValue(FldType: TFieldType; key: string):boolean;
Function wwFieldIsValidLocateValue(fld: TField; key: string):boolean;
Function wwGetAlias(aliasName: string): string;
Function wwSaveAnswerTable(ADataSet: TDBDataSet; AHandle: HDbiCur; tableName: string): boolean;
Function wwInPaintCopyState(ControlState: TControlState): boolean;
Function wwDataSetLookupDisplayField(
   curField: TField; var LookupValue: string; var DisplayField: TField): boolean;
procedure wwPlayKeystroke(Handle: HWND; VKChar: word; VKShift: Word);
procedure wwDataSet_GetControl(dataSet: TComponent; AFieldName: string;
                      var AControlType: string; var AParameters: string);
function wwGetQueryText(tempQBE: TStrings; Sql: boolean): PChar;
Function wwMemAvail(memSize: integer): boolean;
Procedure wwPictureByField(DataSet: TComponent; FieldName: string; FromTable: boolean;
    var Mask: string; var AutoFill, UsePictureMask: boolean);
procedure wwSetPictureMask(dataSet: TComponent; AFieldName: string;
    AMask: string;
    AutoFill: boolean;
    UsePictureMask: boolean;
    SetMask: boolean;
    SetAutoFill: boolean;
    SetUsePictureMask: boolean);
Function wwGetFieldNameFromTitle(DataSet: TDataSet; fieldTitle: string): string;
Function wwGetListIndex(list: TStrings; itemName: string): integer;
Function wwGetOwnerForm(component: TComponent):TCustomForm;
procedure wwClearAltChar;
Function isWWEditControl(pname: string): boolean;
procedure wwDataModuleChanged(temp: TComponent);
Function wwDoLookupTable(ALookupTable : TTable;  DataSet: TDataset; links: TStrings) : boolean;
{$ifdef win32}
Procedure wwDrawGlyph(
    Bitmap: TBitmap;
    Canvas: TCanvas; R: TRect;
    State: TButtonState;
    Enabled: Boolean;
    Transparent: boolean;
    FlatButtonTransparent: boolean;
    ControlState: TControlState);
    
Procedure wwDrawEllipsis(Canvas: TCanvas; R: TRect;
    State: TButtonState;
    Enabled: Boolean;
    Transparent: boolean;
    FlatButtonTransparent: boolean;
    ControlState: TControlState);
Procedure wwDrawDropDownArrow(Canvas: TCanvas; R: TRect;
    State: TButtonState;
    Enabled: Boolean;
    ControlState: TControlState);
{$endif}
Function wwHasIndex(ADataSet: TDataSet): boolean;
Function wwIsTableQuery(ADataSet: TDataSet): boolean;
Function wwPdxPictureMask(ADataSet: TDataSet; AFieldName: string): string;
procedure wwFixMouseDown;
procedure wwValidatePictureFields(ADataSet: TDataSet;
     FOnInvalidValue: TwwInvalidValueEvent);
function wwDataSetFindRecord(
   DataSet: TDataSet;
   KeyValue: string;
   LookupField: string;
   MatchType: TwwLocateMatchType;
   caseSensitive: boolean): boolean;
//Procedure wwOpenPictureDB(wwtable: TTable);
Function wwValidFilterableFieldType(ADataType: TFieldType): boolean;
procedure wwALinkHelp(Handle: HWND; ALink: string);
procedure wwHelp(Handle: HWND; HelpTopic: PChar);
Function wwIsValidChar(key: word): boolean;
Function wwGetOnInvalidValue(DataSet: TDataSet): TwwInvalidValueEvent;

procedure wwDataSet_SetLookupLink(dataSet: TDataSet;
   FldName, DatabaseName, TableName, DisplayFld, IndexFieldNames, Links: string;
   useExtension: Char);
Function wwFindSelected(selected: TStrings;
   FieldName: string; var index: integer): boolean;
Function wwAdjustPixels(PixelSize,PixelsPerInch : integer): integer;
Function wwProcessEscapeFilterEvent(dataset: TDataset): boolean;
Procedure wwSetOnFilterEnabled(dataset: TDataset; val: boolean);
Function wwGetOnFilterOptions(dataset: TDataset): TwwOnFilterOptions;
Function wwmin(x,y: integer): integer;  {4/10/97}
Function wwmax(x,y: integer): integer;  {4/10/97}
Function wwDataSet_GetFilterLookupField(dataSet: TDataSet; curfield: TField; AMethod: TMethod): TField;
Procedure wwConvertFieldToParam(OtherField:TField;var AFilterParam:TParam;AFilterFieldBuffer: PChar);
Function wwisNonBDEField(thisField: TField): boolean;
Function wwisNonPhysicalField(thisField: TField): boolean;
Function wwSetControlDataSource(ctrl: TWinControl; ds: TDataSource): boolean;
Function wwSetControlDataField(ctrl: TWinControl; df: string): boolean;
Function wwGetControlDataField(ctrl: TWinControl): string;
Function wwGetControlDataSource(ctrl: TComponent): TDataSource;
Function wwGetControlMasterSource(ctrl: TComponent): TDataSource;
Function wwSetDatabaseName(ctrl: TDataset; df: string): boolean;
Function wwSetConnectionString(ctrl: TDataset; df: string): boolean;
Function wwGetSessionName(dataSet: TDataSet): String;
function wwDataSetCompareBookmarks(DataSet: TDataSet; Bookmark1, Bookmark2: TBookmark): CmpBkmkRslt;
function wwIsClass(ClassType: TClass; const Name: string): Boolean;
function wwGetWorkingRect:TRect;
Function wwApplyPictureMask(Control: TCustomEdit; PictureMask: string; AutoFill: boolean; var Key: Char): boolean;
Function wwValidPictureValue(Control: TCustomEdit; PictureMask: string): boolean;
Function wwGetSQLWord(s: string; var APos: integer): string;
Function wwSetSQLProp(ctrl: TDataset; sql: TStrings): boolean;
Function wwSetParamsProp(ctrl: TDataset; Params: TParams): boolean;
Function wwGetParamsProp(ctrl: TDataset): TParams;
Function wwSetRequestLive(ctrl: TDataset; val: boolean): boolean;
Function wwGetParamCheck(ctrl: TDataset): boolean;
Function wwSetReadOnly(ctrl: TWinControl; val: boolean): boolean;
Function wwSetBorder(ctrl: TControl; val: boolean): boolean;
Function wwSetParamCheck(ctrl: TDataset; val: boolean): boolean;
Function wwGetIBDatabase(dataSet: TDataSet): TComponent;
Function wwSetIBDatabase(Dataset: TDataSet; db: TComponent): boolean;

{ 9/13/98 - Changed handle to HDC }
Function wwIsSingleLineEdit(AHandle:HDC; Rect: TRect; Flags:Integer): boolean;
{Procedure wwCopyDatasetProp(dataset1, dataset2: TDataset);}

Function wwGetControlPictureMask(ctrl: TCustomEdit): String;
Procedure wwSetControlPictureMask(ctrl: TCustomEdit; PictureMask: string);
Function wwGetControlAutoFill(ctrl: TCustomEdit): boolean;
Procedure wwSetControlAutoFill(ctrl: TCustomEdit; AutoFill: boolean);

function wwCallbackMemoRead(DataSet: TBDEDataSet;
                   FFilterBuffer: Pointer;
                   var Buffer;
                   curField: TField;
                   Count: Longint): Longint;

procedure RichEditTextToPlainText(
      Owner: TWinControl;
      MemoBuffer: PChar;
      var numRead: Cardinal;
      var RichEditControl: TRichEdit;
      var MemoryStream: TMemoryStream);
function wwIsRichEditField(Field: TField; ExamineData: boolean): boolean;

//procedure wwGetInterface(AObject: TObject; IID: TGUID; out Obj);
procedure wwDrawFocusRect(ACanvas: TCanvas; ARect: TRect);
{$ifdef wwDelphi4Up}
function UpdatedVCL4Version: boolean;
{$endif}
function wwIsCustomEditCell(
        Component: TComponent;
        ownerForm: TComponent;
        curField: TField;
        var customEdit: TCustomEdit) : boolean;
function IsInGrid(dtp:TWinControl):boolean;

function IsInwwObjectView(control: TWinControl):boolean;
function IsInwwObjectViewPaint(control: TWinControl):boolean;
procedure wwDottedLine(Canvas: TCanvas; p1, p2: TPoint);
procedure wwSetTableIndex(DataSet: TDataSet; FieldName: string);
Procedure wwWriteTextLinesT(ACanvas: TCanvas;
    const ARect: TRect; DX, DY: Integer; S: PChar; Alignment: TAlignment;
    WriteOptions: TwwWriteTextOptions);
function wwRectWidth(Rect: TRect): Integer;
function wwRectHeight(Rect: TRect): Integer;
procedure wwDisableParentClipping(Parent: TWinControl);
function wwSetDatabaseCursorType(DataSet: TDataSet; val: integer): boolean;
//procedure wwAdjustHeight(Control: TWinControl);

implementation

uses wwTable, wwQuery, wwQBE, wwsystem, Messages, wwpict, wwintl, typinfo,
     wwdbedit;

var inLookupCalcLink : boolean;   {Internal Use Only}

{ 5/12/97 - Use generic way to retrieve propery }
Function wwGetOnInvalidValue(DataSet: TDataSet): TwwInvalidValueEvent;
var PropInfo: PPropInfo;
    method: TMethod;
begin
   Result:= Nil;
   PropInfo:= Typinfo.GetPropInfo(DataSet.ClassInfo,'OnInvalidValue');
   if PropInfo<>Nil then begin
      method:= GetMethodProp(DataSet, PropInfo);
      if method.code<>Nil then
         result:= TwwInvalidValueEvent(method);
   end
end;

Function wwGetPictureControl(Control: TComponent; DataSet: TDataSet = nil): TComponent;
var ds: TDataSource;
begin
   if dataset=nil then
   begin
     ds:= wwGetControlDataSource(Control);
     if ds<>nil then dataset:= ds.dataset
     else dataset:= nil;
   end;

   if wwGetPictureMaskFromDataSet(Control) and (wwGetPictureMasks(Dataset)<>nil) then
      Result:= Dataset
   else Result:= Control;
end;

Function wwGetControlTypeControl(Control: TComponent; DataSet: TDataSet = nil): TComponent;
var ds: TDataSource;
begin
   if dataset=nil then
   begin
     ds:= wwGetControlDataSource(Control);
     if ds<>nil then dataset:= ds.dataset
     else dataset:= nil;
   end;

   if wwGetControlInfoInDataSet(Control) and (wwGetControlType(Dataset)<>nil) then
      Result:= Dataset
   else Result:= Control;
end;

Function wwGetPictureMasks(DataSet: TComponent): TStrings;
var PropInfo: PPropInfo;
begin
   Result:= Nil;
   if DataSet=nil then exit;

   PropInfo:= Typinfo.GetPropInfo(DataSet.ClassInfo,'PictureMasks');
   if PropInfo<>Nil then
      result:= TStrings(GetOrdProp(DataSet, PropInfo));
end;

Function wwGetControlType(DataSet: TComponent): TStrings;
var PropInfo: PPropInfo;
begin
   Result:= Nil;
   if DataSet=nil then exit;
   PropInfo:= Typinfo.GetPropInfo(DataSet.ClassInfo,'ControlType'); { Delphi 5}
   if PropInfo<>Nil then
      result:= TStrings(GetOrdProp(DataSet, PropInfo));
end;

Function wwSetDatabaseCursorType(DataSet: TDataSet; val: integer): boolean;
var PropInfo: PPropInfo;
begin
   Result:= False;
   PropInfo:= Typinfo.GetPropINfo(DataSet.ClassInfo,'CursorType');
   if (PropInfo<>Nil) then begin
      SetOrdProp(DataSet, PropInfo, ord(val));
      result:= True;
   end
end;

Function wwGetValidateWithMask(dataSet: TDataSet): boolean;
var PropInfo: PPropInfo;
begin
   Result:= False;
   PropInfo:= Typinfo.GetPropInfo(DataSet.ClassInfo,'ValidateWithMask');
   if PropInfo<>Nil then
      result:= Boolean(GetOrdProp(DataSet, PropInfo));
end;

Function wwGetControlInfoInDataSet(component: TComponent): boolean;
var PropInfo: PPropInfo;
begin
   Result:= True;
   PropInfo:= Typinfo.GetPropInfo(component.ClassInfo,'ControlInfoInDataSet');
   if PropInfo<>Nil then
      result:= Boolean(GetOrdProp(component, PropInfo));
end;

Function wwGetPictureMaskFromDataSet(component: TComponent): boolean;
var PropInfo: PPropInfo;
begin
   Result:= True;
   PropInfo:= Typinfo.GetPropInfo(component.ClassInfo,'PictureMaskFromDataSet');
   if PropInfo<>Nil then
      result:= Boolean(GetOrdProp(component, PropInfo));
end;

Function wwGetLookupFields(dataSet: TDataSet): TStrings;
var PropInfo: PPropInfo;
begin
   Result:= Nil;
   PropInfo:= Typinfo.GetPropInfo(DataSet.ClassInfo,'LookupFields');
   if PropInfo<>Nil then
      result:= TStrings(GetOrdProp(DataSet, PropInfo));
end;

Function wwGetLookupLinks(dataSet: TDataSet): TStrings;
var PropInfo: PPropInfo;
begin
   Result:= Nil;
   PropInfo:= Typinfo.GetPropInfo(DataSet.ClassInfo,'LookupLinks');
   if PropInfo<>Nil then
      result:= TStrings(GetOrdProp(DataSet, PropInfo));
end;

Function wwGetLookupTables(dataSet: TDataSet): TList;
{var PropInfo: PPropInfo;}
begin
   if dataSet is TwwTable then result:= TwwTable(dataSet).LookupTables
   else if dataSet is TwwQuery then result:= TwwQuery(dataSet).LookupTables
   else if dataSet is TwwQBE then result:= TwwQBE(dataSet).LookupTables
   else if dataSet is TwwStoredProc then result:= TwwStoredProc(dataSet).LookupTables
   else result:= nil
end;

Function wwGetFilterFieldValue(method: TMethod;AFieldName:string): TParam;
begin
   result:= TwwFilterFieldMethod(Method)(AFieldName);
end;

Function wwDataSetGetLinks(dataSet: TDataSet; lookupFieldName: string): string;
var parts: TStrings;
    i: integer;
    FLookupFields, FLookupLinks: TStrings;
begin
   result:= '';
   if wwGetLookupLinks(dataSet)=Nil then exit;

   parts:= TStringList.create;
   FLookupFields:= wwGetLookupFields(dataSet);
   FLookupLinks:= wwGetLookupLinks(dataSet);

   try
      for i:= 0 to FLookupfields.count-1 do begin
         strBreakApart(FLookupFields.Strings[i], ';', parts);
         if (parts[0]= lookupfieldName) then begin
            result:= FlookupLinks.strings[i];
            break;
         end
      end;
      parts.free;
   except
      parts.free;
   end
end;

Function wwDataSetGetDisplayField(dataSet: TDataSet; lookupFieldName: string): string;
var parts: TStrings;
    i: integer;
    FLookupFields: TStrings;
begin
   result:= '';
   if wwGetLookupFields(dataSet)=Nil then exit;

   parts:= TStringList.create;
   FLookupFields:= wwGetLookupFields(dataSet);

   try
      for i:= 0 to FLookupfields.count-1 do begin
         strBreakApart(FLookupFields.Strings[i], ';', parts);
         if (parts[0]= lookupfieldName) then begin
            result:= parts[3];
            break;
         end
      end;
   finally
      parts.free;
   end
end;

Function wwGetDatabaseName(dataSet: TDataSet): String;
var PropInfo: PPropInfo;
begin
   Result:= '';
   PropInfo:= Typinfo.GetPropInfo(DataSet.ClassInfo, 'DatabaseName');
   if PropInfo<>Nil then
      result:= GetStrProp(DataSet, PropInfo);
end;

Function wwGetConnectionString(dataSet: TDataSet): String;
var PropInfo: PPropInfo;
begin
   Result:= '';
   PropInfo:= Typinfo.GetPropInfo(DataSet.ClassInfo, 'ConnectionString');
   if PropInfo<>Nil then
      result:= GetStrProp(DataSet, PropInfo);
end;

Function wwGetIBDatabase(dataSet: TDataSet): TComponent;
var PropInfo: PPropInfo;
begin
   Result:= Nil;
   PropInfo:= Typinfo.GetPropInfo(dataset.ClassInfo,'DataBase');
   if PropInfo<>Nil then begin
      result:= TComponent(GetOrdProp(dataset, PropInfo));
   end
end;

Function wwSetIBDatabase(Dataset: TDataSet; db: TComponent): boolean;
var PropInfo: PPropInfo;
begin
   result:= False;
   PropInfo:= Typinfo.GetPropInfo(DataSet.ClassInfo,'Database');
   if (PropInfo <> nil) and (PropInfo^.Proptype^.Kind = tkClass) then
   begin
       SetOrdProp(Dataset,PropInfo,LongInt(db));
       result:= True;
   end;
end;

Function wwGetTableName(dataSet: TDataSet): String;
var PropInfo: PPropInfo;
begin
   Result:= '';
   PropInfo:= Typinfo.GetPropInfo(DataSet.ClassInfo, 'TableName');
   if PropInfo<>Nil then
      result:= GetStrProp(DataSet, PropInfo);
//   if dataSet is TwwTable then result:= TwwTable(dataSet).tableName
//   else result:= '?';
end;

Function wwDataSetIsValidField(dataset : TComponent; fieldName : string): boolean;
var i: integer;
begin
   result:= False;
   if not (dataset is TDataset) then exit;
   if dataSet=Nil then exit;

   with TDataSet(dataset) do begin
      for i:= 0 to fieldCount-1 do begin
         if (uppercase(fieldName) = uppercase(fields[i].fieldName)) then begin
            result:= true;
            break;
         end;
      end
   end
end;


procedure wwDataSetUpdateFieldProperties(dataSet: TDataSet; selected: TStrings);
var i: integer;
    parts: TStrings;
begin
   parts := TStringList.create;

   dataSet.disableControls; {5/27/95}

   for i:= 0 to dataSet.fieldCount-1 do begin
      dataSet.fields[i].visible:= False;
   end;
   if selected<>Nil then begin
      for i:= 0 to selected.count-1 do begin
         strBreakApart(selected[i], #9, parts);
         if wwDataSetIsValidfield(dataSet, parts[0]) then begin
            dataSet.fieldByName(parts[0]).displayWidth:= strtoint(parts[1]);
            dataSet.fieldByName(parts[0]).displayLabel:= parts[2];
            dataSet.fieldByName(parts[0]).index:= i;
            dataSet.fieldByName(parts[0]).visible:= True;
         end;
      end;
   end;

   dataSet.enableControls; {5/27/95}

   parts.Free;
end;

Function wwDataSet(dataSet : TDataSet): boolean;
begin
   if dataset=nil then result:= false
   else begin
     result:= True;
   end;

end;

Procedure wwDebug(s: string);
begin
   MessageDlg(s, mtinformation, [mbok], 0);
end;

{ Win95 for Bitmap support }
procedure GetLookupFields(curField: Tfield;
   var databasename, tableName, displayFieldName: string;
   var joins: string);
var found: boolean;
    i: integer;
    parts: TStrings;
    gridTable: TDataSet;
begin
      found:= false;
      gridTable:= curField.dataset;
      if gridTable=nil then exit;

      parts:= TStringList.create;

      with wwGetLookupFields(gridTable) do begin
         for i:= 0 to count-1 do begin
            strBreakApart(strings[i], ';', parts);
            if parts[0]=curField.fieldName then begin
               if parts.count<5 then continue;

               found:=True;
               databaseName:= parts[1];
               tableName:= parts[2];
               displayFieldName:= parts[3];

               joins:= wwGetLookupLinks(gridTable).Strings[i];
               break;
            end
         end
      end;

      if not found then begin
         databaseName:= wwGetDatabaseName(gridTable);
         tableName:= '';
         displayFieldName:= '';
         joins:= '';
      end;

      parts.free;

end;

{ Win95 for Bitmap support }
Function wwDataSetLookupDisplayField(
   curField: TField; var LookupValue: string; var DisplayField: TField): boolean;
var
    j, APos: integer;
    lookupTable: TwwTable;
    databasename, tableName, displayFieldName, joins: string;
    lookupTables: TList;
begin
    displayField:= curField;
    result:= False;
    if (curField=Nil) or (curField.dataSet=nil) then exit;
    if (wwGetLookupTables(curField.dataset)=nil) then exit;

    GetLookupFields(curField, databasename, tableName, displayFieldName, joins);
    LookupTables:= wwGetLookupTables(curField.dataset);

    for j:= 0 to LookupTables.count-1 do begin
       lookupTable:= TwwTable(lookupTables.items[j]);
       if (lookupTable.databaseName=databaseName) and
          (lookupTable.tableName=tableName) then
       begin
          if (lowercase(joins)=lowercase(lookupTable.CalcLookupLinks)) then
          begin
             DisplayField:= lookupTable.FieldByname(DisplayFieldName);
             APos:= 1;
             LookupValue:= curField.dataset.FieldByName(strGetToken(joins, ';', APos)).asString;
             result:= lookupTable.wwFindKey([lookupValue]);
             exit;
          end
       end
    end;

end;

Function wwDoLookupTable(ALookupTable : TTable;  DataSet: TDataset; links: TStrings) : boolean;
var res: boolean;
    lookupTable: TwwTable;
begin
   res:= False;
   lookupTable:= AlookupTable as TwwTable;
   with DataSet do begin
      if LookupTable.IndexFieldCount=0 then begin
         result:= LookupTable.wwFindRecord(FieldByName(links[0]).asString, links[1],
{                            FieldByName(links[1]).FieldName,}  { 1/17/96 - FieldByName ref. is incorrect}
                            mtExactMatch, False);
         exit;
      end;

      case (links.count) of
         2:  res:= lookupTable.wwFindKey(
                [FieldByName(links[0]).asString]);

         4:  res:= lookupTable.wwFindKey(
                      [FieldByName(links[0]).asString,
                       FieldByName(links[2]).asString] );

         6:  res:= lookupTable.wwFindKey(
                      [FieldByName(links[0]).asString,
                       FieldByName(links[2]).asString,
                       FieldByName(links[4]).asString] );

         8:  res:= lookupTable.wwFindKey(
                      [FieldByName(links[0]).asString,
                       FieldByName(links[2]).asString,
                       FieldByName(links[4]).asString,
                       FieldByName(links[6]).asString] );

        10:  res:= lookupTable.wwFindKey(
                      [FieldByName(links[0]).asString,
                       FieldByName(links[2]).asString,
                       FieldByName(links[4]).asString,
                       FieldByName(links[6]).asstring,
                       FieldByName(links[8]).asString] );

        12:  res:= lookupTable.wwFindKey(
                      [FieldByName(links[0]).asString,
                       FieldByName(links[2]).asString,
                       FieldByName(links[4]).asString,
                       FieldByName(links[6]).asstring,
                       FieldByName(links[8]).asstring,
                       FieldByName(links[10]).asString] );
         else;
      end;
   end;

   result:= res;
end;

Function wwisNonBDEField(thisField: TField): boolean;
begin
   {$ifdef win32}
   result:=  thisfield.calculated or thisfield.lookup;
   {$ifdef wwDelphi3Up}
   if (not result) and (thisField.dataset<>nil) then
      result:= not wwIsClass(thisField.dataset.classType, 'TBDEDataSet'); {9/20/97 - 3rd party engine}
   {$endif}
   {$else}
   result:=  thisfield.calculated;
   {$endif}
end;

Function wwisNonPhysicalField(thisField: TField): boolean;
begin
   {$ifdef win32}
   result:=  thisfield.calculated or thisfield.lookup;
   {$else}
   result:=  thisfield.calculated;
   {$endif}
end;

Procedure wwConvertFieldToParam(OtherField:TField;var AFilterParam:TParam;AFilterFieldBuffer: PChar);
var
   tempInt: integer;
   tempdouble: double;
   tempSmallInt: smallint;
  {$ifdef win32}
   tempTimeStamp: TTimeStamp;
  {$else}
   tempTime:LongInt;
   tempDate:LongInt;
   tempDateTime:double;
  {$endif}
   tempWordBool: WordBool;
  {tempBCD : fmtBCD;}
begin
   if OtherField=nil then { 11/7/98 - If nil (i.e. ClientDataSet), then return blank  }
   begin
      strPLCopy(AFilterFieldBuffer, '', 32767);
      AFilterParam.SetData(AFilterFieldBuffer);
      exit;
   end;

   case OtherField.DataType of
      ftString, ftMemo: { 11/3/97 - Treat ftMemo as ftString }
        begin
          strPLCopy(AFilterFieldBuffer, OtherField.asString, 32767);
          AFilterParam.SetData(AFilterFieldBuffer);
        end;
      ftSmallint,ftWord:
        begin
          tempSmallInt:= OtherField.asInteger;
          move(tempSmallInt, AFilterFieldBuffer^, 2);
          AFilterParam.SetData(AFilterFieldBuffer);
        end;
      ftInteger, ftAutoInc: { 8/7/99 }
        begin
          tempInt:= OtherField.asInteger;
          move(tempInt, AFilterFieldBuffer^, 4);
          AFilterParam.SetData(AFilterFieldBuffer);
        end;
      ftFloat,ftCurrency:
        begin
          tempDouble:= OtherField.asFloat;
          move(tempDouble, AFilterFieldBuffer^, 8);
          AFilterParam.SetData(AFilterFieldBuffer);
        end;
      ftBoolean:
        begin
          tempWordBool:= OtherField.asBoolean;
          move(tempWordBool, AFilterFieldBuffer^, 2); { 9/16/98 - WordBool is 2 bytes } 
          AFilterParam.SetData(AFilterFieldBuffer);
        end;
      ftTime:
        begin
         {$ifdef win32}
           tempTimeStamp:= DateTimeToTimeStamp(OtherField.asDateTime);
           move(tempTimeStamp.time, AFilterFieldBuffer^, 4);
           AFilterParam.SetData(AFilterFieldBuffer);
         {$else}
           tempTime := Round(Frac(OtherField.AsDateTime) * MSecsPerDay);
           move(tempTime, AFilterFieldBuffer^, 4);
           AFilterParam.SetData(AFilterFieldBuffer);
         {$endif}
        end;
      ftDate:
        begin
         {$ifdef win32}
           tempTimeStamp:= DateTimeToTimeStamp(OtherField.asDateTime);
           move(tempTimeStamp.date, AFilterFieldBuffer^, 4);
           AFilterParam.SetData(AFilterFieldBuffer);
         {$else}
           tempDate := Trunc(OtherField.AsDateTime);
           move(tempDate, AFilterFieldBuffer^, 4);
           AFilterParam.SetData(AFilterFieldBuffer);
         {$endif}
        end;
      ftDateTime:
        begin
         {$ifdef win32}
           tempDouble:= TimeStampToMSecs(DateTimeToTimeStamp(OtherField.asDateTime));
           move(tempDouble, AFilterFieldBuffer^, sizeof(double));
           AFilterParam.SetData(AFilterFieldBuffer);
         {$else}
           tempDateTime := OtherField.AsDateTime * MSecsPerDay;
           move(tempDateTime, AFilterFieldBuffer^, sizeof(double));
           AFilterParam.SetData(AFilterFieldBuffer);
         {$endif}
        end;
{     ftBCD:
        begin
           CurrToBCD((OtherField as TBCDField).asFloat,
                     pFMTBcd(AFilterFieldBuffer)^, 32, 4);
           AFilterParam.SetData(AFilterFieldBuffer);
        end;}
   end;
end;

Function ignoreExtension(parts: TStrings): boolean;
begin
   if parts.count>5 then begin
      result:= (parts[parts.count-1]='N');
   end
   else result:= False;
end;

Function getTablePrefix(tableName: string): string;
var APos: integer;
begin
   APos:= 1;
   result:= strGetToken(tableName, '.', APos);
end;

Function isSameTable(lookupTable: TwwTable; parts: TStrings): boolean;
begin
   if ignoreExtension(parts) then
   begin
      result:=
         (lookupTable.databaseName=parts[1]) and
         (lookupTable.tableName=GetTablePrefix(parts[2]));
   end
   else begin
      result:=
         (lookupTable.databaseName=parts[1]) and
         (lookupTable.tableName=parts[2]);
   end
end;

    Function SyncLookupTable(DataSet:TDataset;Alookuptable: TDataSet;links:TStrings;
       Method: TMethod): boolean;
    var res:boolean;
        lookupTable:TwwTable;
    begin
       res := False;
       if not (Alookuptable is TwwTable) then begin
         { Only 1 field lookups for non TwwTables }
         {$ifdef win32}
         if Method.data=nil then { 11/7/98 - ClientDataSet lookups pass method.data=nil}
            result:= ALookupTable.Locate(links[1],
                     DataSet.FieldByName(links[0]).asString, [])
         else
            result:= ALookupTable.Locate(links[1],
                    wwGetFilterFieldValue(method, links[0]).asString, []);
         {$else}
         result:= False;
         {$endif}
         exit;
       end;

       lookupTable := Alookuptable as TwwTable;
       case (links.count) of
         2: begin
            res := TwwTable(lookuptable).wwFindKey(
              [(wwGetFilterFieldValue(method, links[0])).asString]);
            end;
         4: begin
            res := TwwTable(lookuptable).wwFindKey(
                  [wwGetFilterFieldValue(Method,links[0]).asString,
                   wwGetFilterFieldValue(Method,links[2]).asString]);
            end;
         6: begin
            res := TwwTable(lookuptable).wwFindKey(
                      [wwGetFilterFieldValue(method,links[0]).asString,
                       wwGetFilterFieldValue(method,links[2]).asString,
                       wwGetFilterFieldValue(method,links[4]).asString] );
            end;
         8: begin
            res := TwwTable(lookuptable).wwFindKey(
                      [wwGetFilterFieldValue(method,links[0]).asString,
                       wwGetFilterFieldValue(method,links[2]).asString,
                       wwGetFilterFieldValue(method,links[4]).asString,
                       wwGetFilterFieldValue(method,links[6]).asString] );
            end;
        10: begin
            res := TwwTable(lookuptable).wwFindKey(
                      [wwGetFilterFieldValue(method,links[0]).asString,
                       wwGetFilterFieldValue(method,links[2]).asString,
                       wwGetFilterFieldValue(method,links[4]).asString,
                       wwGetFilterFieldValue(method,links[6]).asString,
                       wwGetFilterFieldValue(method,links[8]).asString] );
            end;
        12: begin
            res := TwwTable(lookuptable).wwFindKey(
                      [wwGetFilterFieldValue(method,links[0]).asString,
                       wwGetFilterFieldValue(method,links[2]).asString,
                       wwGetFilterFieldValue(method,links[4]).asString,
                       wwGetFilterFieldValue(method,links[6]).asString,
                       wwGetFilterFieldValue(method,links[8]).asString,
                       wwGetFilterFieldValue(method,links[10]).asString] );
            end;
         else;
      end;
      result := res;
    end;

Function wwDataSet_GetFilterLookupField(dataSet: TDataSet; curfield: TField; AMethod: TMethod): TField;
var OtherField : TField;
    links: TStrings;
    foundvalue: bool;
    foundtable: bool;
    lookuplinks:string;
    mylookuplinks:Tstrings;
    lookuptable:TwwTable;
    lookupfields:Tstrings;
    lookuptables:TList;

    parts: TStrings;
    i,j:integer;

    {$ifdef win32}
    fromLinks, toLinks, fromlink, tolink: string;
    fpos, tpos: integer;
    {$endif}

begin
   otherfield := nil;

   if (not curfield.calculated) then begin   {Check LookupField value}
     {$ifdef win32}
      links:= TStringlist.create;

      fromLinks:= curField.KeyFields;
      toLinks:= curField.LookupKeyFields;
      fpos:= 1; tpos:= 1;

      while True do begin
         fromLink:= strGetToken(fromlinks, ';', fpos);
         toLink:= strGetToken(tolinks, ';', tpos);

         if (fromLink='') or (toLink='') then break;

         links.add(fromLink );
         links.add(toLink);

      end;

      foundvalue := SyncLookupTable(Dataset,curfield.lookupdataset,links, AMethod);

      if foundvalue then
         otherfield := curfield.lookupdataset.fieldbyname(curfield.lookupresultfield);
      {$endif}
   end
   else begin   {Check Linked field value}

     if (inLookupCalcLink) or (wwGetLookupTables(curField.dataset)=nil) then begin
        result := nil;
        exit;
     end;

     links:= TStringlist.create;
     lookuplinks := wwDataSetGetLinks(Dataset,curfield.fieldname);
     strBreakApart(lookuplinks, ';', links);

     lookuptable := nil;
     foundTable := false;

     lookupfields := wwGetLookupFields(Dataset);
     lookuptables := wwGetLookupTables(Dataset);
     mylookuplinks := wwGetLookupLinks(Dataset);
     parts:= TStringList.create;

     for i:= 0 to lookupfields.count-1 do begin
        strbreakApart(lookupfields.Strings[i], ';', parts);
        if wwEqualStr(parts[0],curField.FieldName) then begin {7/24/97 - Check field }
           for j:= 0 to lookuptables.count-1 do begin
              lookupTable:= TwwTable(lookuptables.items[j]);
              if isSameTable(lookuptable, parts) then
              begin
                 foundtable:= (lowercase(mylookuplinks.strings[i])=
                               lowercase(lookupTable.CalcLookupLinks));
                 if foundtable then break;
              end
           end;
           if foundtable then break;
        end
     end;

     if foundtable then begin

        inLookupCalcLink := true;
        foundvalue := SyncLookupTable(Dataset,lookuptable,links, AMethod);
        inLookupCalcLink := false;

        if foundvalue then
           otherfield := lookuptable.fieldbyname(wwDataSetGetDisplayField(Dataset,curfield.fieldname));
     end;

     parts.free;

   end;

   links.free;

   result := otherfield;

end;


Function wwSetLookupField(dataSet: TDataSet; LinkedField: TField): boolean;
var links, parts: TStrings;
    i,j: integer;
    foundTable: Boolean;
    lookupTable: TwwTable;
    lookupFields, lookupLinks: TStrings;
    lookupTables: TList;

    Function getTablePrefix(tableName: string): string;
    var APos: integer;
    begin
       APos:= 1;
       result:= strGetToken(tableName, '.', APos);
    end;

    Function ignoreExtension(parts: TStrings): boolean;
    begin
       if parts.count>5 then begin
          result:= (parts[parts.count-1]='N');
       end
       else result:= False;
    end;

    Function isSameTable(lookupTable: TwwTable; parts: TStrings): boolean;
    begin
       if ignoreExtension(parts) then
       begin
          result:=
             (lookupTable.databaseName=parts[1]) and
             (lookupTable.tableName=GetTablePrefix(parts[2]));
       end
       else begin
          result:=
             (lookupTable.databaseName=parts[1]) and
             (lookupTable.tableName=parts[2]);
       end
    end;

    {$ifdef win32}
    Function PerformLookup: boolean;  { 11/14/97}
    begin
       with LinkedField do begin
         if LookupDataset is TTable then begin
            result:= (LookupDataSet as TTable).FindKey([dataSet.FieldByName(KeyFields).asString]);
         end
         else begin
            result:= LookupDataset.Locate(LookupKeyFields, dataSet.FieldByName(KeyFields).asString, [])
         end
       end
    end;
    {$endif}

begin
    result:= False;

    {$ifdef win32}
    with LinkedField do begin
       if Lookup then begin
          if PerformLookup then
          begin
             if LookupDataSet.FieldByName(LookupResultField).asString<>linkedField.asString then
             begin
                LookupDataSet.edit;
                LookupDataSet.FieldByName(LookupResultField).asString:= linkedField.asString;
                result:= True;
             end
          end;
          exit;
       end
    end;
    {$endif}

    if wwGetLookupFields(dataSet)=nil then exit;

    parts:= TStringList.create;
    links:= TStringList.create;
    lookupTable:= nil; { Make compiler happy}
    LookupLinks:= wwGetLookupLinks(dataSet);
    LookupFields:= wwGetLookupFields(dataSet);
    LookupTables:= wwGetLookupTables(dataset);

    try
     for i:= 0 to LookupFields.count-1 do begin
       strbreakApart(LookupFields.Strings[i], ';', parts);
       if not wwEqualStr(linkedField.fieldname, parts[0]) then continue;

       { Find corresponding table }
       foundTable:= false;
       for j:= 0 to LookupTables.count-1 do begin
          lookupTable:= TwwTable(lookupTables.items[j]);
          if isSameTable(lookupTable, parts) then
          begin
             foundTable:= (lowercase(LookupLinks.strings[i])=
                           lowercase(lookupTable.CalcLookupLinks));
             if foundTable then break;
          end
       end;
       if not foundTable then break;

       strBreakApart(LookupLinks[i], ';', links);

       with DataSet do begin
          if LookupTable.readOnly then begin
             LookupTAble.active:= False;
             LookupTable.readonly:=False;
             LookupTAble.active:= True;
          end;

          LookupTable.inLookupLink:= True; { Faster performance with inlookuplink }
          result:= wwDoLookupTable(lookupTable, DataSet, links);
          LookupTable.inLookupLink:= False;

          if result and (LookupTable.FieldByName(parts[3]).asString<>linkedField.asString) then
          begin
             LookupTable.edit;
             LookupTable.FieldByName(parts[3]).asString:= linkedField.asString;
{             LookupTable.post;} {7/4/97}
          end
       end;
     end

    finally
      parts.free;
      links.free;
    end;

end;

procedure wwDataSetDoOnCalcFields(dataSet: TDataSet;
          FLookupFields, FLookupLinks: TStrings;
          lookupTables: TList);
var links, parts: TStrings;
    i,j: integer;
    fieldName: wwSmallString;
    indexFields: string;
    foundTable: Boolean;
    lookupTable: TwwTable;
    res: boolean;

    Function getTablePrefix(tableName: string): string;
    var APos: integer;
    begin
       APos:= 1;
       result:= strGetToken(tableName, '.', APos);
    end;

    Function ignoreExtension(parts: TStrings): boolean;
    begin
       if parts.count>5 then begin
          result:= (parts[parts.count-1]='N');
       end
       else result:= False;
    end;

    Function isSameTable(lookupTable: TwwTable; parts: TStrings): boolean;
    begin
       if ignoreExtension(parts) then
       begin
          result:=
             (lookupTable.databaseName=parts[1]) and
             (lookupTable.tableName=GetTablePrefix(parts[2]));
       end
       else begin
          result:=
             (lookupTable.databaseName=parts[1]) and
             (lookupTable.tableName=parts[2]);
       end
    end;

begin
    parts:= TStringList.create;
    links:= TStringList.create;
    lookupTable:= nil; { Make compiler happy}

    { upToDate keeps track if lookuptable needs to do a findKey }
    for i:= 0 to LookupTables.count-1 do begin
        lookupTable:= TwwTable(lookupTables.items[i]);
        lookuptable.upToDate:= False;
    end;

    for i:= 0 to FLookupfields.count-1 do begin
       strbreakApart(FLookupFields.Strings[i], ';', parts);

       { Find corresponding table }
       foundTable:= false;
       for j:= 0 to LookupTables.count-1 do begin
          lookupTable:= TwwTable(lookupTables.items[j]);
          if isSameTable(lookupTable, parts) then
          begin
             foundTable:= (lowercase(FLookupLinks.strings[i])=
                           lowercase(lookupTable.CalcLookupLinks));
             if foundTable then break;
          end
       end;

       { Table not found so create it }
       if not foundTable then begin
          lookupTable:= TwwTable.create(dataSet);
          try { In case unable to open table }
             lookupTable.databaseName:= parts[1];
             if ignoreExtension(parts) then lookupTable.tableName:= getTablePrefix(parts[2])
             else lookupTable.tableName:= parts[2];

             if parts.count>5 then begin
                indexFields:= parts[5];
                for j:= 6 to parts.count-2 do indexFields:= indexFields + ';' + parts[j];
                lookupTable.indexName:= lookupTable.FieldsToIndex(indexFields);
             end
             else lookupTable.indexName:= parts[4];  { Set index name}

             lookupTable.readOnly:= True;  { Don't require write access }

             lookupTable.active:= True;
          except
             continue;  { Skip this lookup since table not found }
          end;
          lookupTables.add(lookupTable);
          lookupTable.upToDate:= False;
          lookupTable.CalcLookupLinks:= FLookupLinks.strings[i];
       end
       else if not lookupTable.active then
          lookupTable.active:= True;  { Force table to be active }

       fieldName:= parts[3];
       strBreakApart(FLookupLinks[i], ';', links);

       { Master Link field is gone, hide dependent field }
       for j:= 0 to ((links.count-1) div 2) do begin
           if not wwDataSetIsValidfield(dataSet, links[j*2]) then begin
              dataset.fieldByName(parts[0]).visible:= False;
              parts.free;
              links.free;
              exit;
           end
       end;

       res:= False;

       with DataSet do begin
          if not LookupTable.UpToDate then begin
             LookupTable.inLookupLink:= True; {12/4/96 }
             res:= wwDoLookupTable(lookupTable, DataSet, links);
             LookupTable.inLookupLink:= False; {12/4/96 }
             LookupTable.upToDateRes:= res;
          end;

          if (res or (LookupTable.upToDate and LookupTable.upToDateRes)) then
          begin
             {$ifdef win32}               { Support linked memo field display}
             if LookupTable.FieldByName(fieldName) is TBlobField then
                fieldbyName(parts[0]).text:= lookupTable.fieldByName(fieldName).asString
             else
             {$endif}
                fieldbyName(parts[0]).text:= lookupTable.fieldByName(fieldName).text
          end
          else fieldbyName(parts[0]).text:= '';
       end;
       LookupTable.upToDate:= True;

    end;
    parts.free;
    links.free;

 end;


    Function wwDataSetSyncLookupTable(dataSet: TDataSet; AlookupTable: TDataSet;
                  lookupFieldName: string; var fromField: string): boolean;
    var links, parts: TStrings;
        i,j, curpos: integer;
        lookupFields, controlType, lookupLinks: TStrings;
        lookupTable: TwwTable;
        tempTblName1, tempTblName2: wwSmallString;
        indexFields: string;
    begin
       parts:= TStringList.create;
       links:= TStringList.create;

       lookupFields:= wwGetLookupFields(dataSet);
       controlType:= wwGetControlType(dataset);
       lookupLinks:= wwGetLookupLinks(dataset);
       lookupTable:= ALookupTable as TwwTable;

       { Remove lookup fields that are no longer there }
       wwDataSetRemoveObsolete(dataSet, lookupfields, controlType, lookupLinks);
       result:= False;

       for i:= 0 to LookupFields.count-1 do begin
          strBreakApart(LookupFields.Strings[i], ';', parts);

          if (uppercase(parts[0])= uppercase(lookupfieldName)) then begin

             curpos:= 1;
             tempTblName1:= uppercase(strGetToken(lookupTable.tablename, '.', curpos));
             curpos:= 1;
             tempTblName2:= uppercase(strGetToken(parts[2], '.', curpos));
             if (tempTblName1=tempTblName2) then
             begin
                if parts.count>5 then begin
                   indexFields:= parts[5];
                   for j:= 6 to parts.count-2 do indexFields:= indexFields + ';' + parts[j];
                   lookupTable.ignoreMasterLink:= True;  { Just change index }
                   lookupTable.setToIndexContainingField(indexFields);  {2/10/97}
                   lookupTable.ignoreMasterLink:= False;
{                   lookupTable.indexName:= lookupTable.FieldsToIndex(indexFields);}
                end
                else if (lookupTable.indexName<>parts[4]) then   { Set index name}
                    lookuptable.indexName:=parts[4];
             end;

             strBreakApart(LookupLinks[i], ';', links);

             { Source Link field is gone, hide dependent field }
             for j:= 0 to ((links.count-1) div 2) do begin
                if not wwDataSetIsValidField(dataSet, links[j*2]) then begin
                   dataSet.fieldByName(parts[0]).visible:= False;
                   parts.free;
                   links.free;
                   exit;
                end
             end;

             with DataSet do
               result:= wwDoLookupTable(lookupTable, Dataset, links);

             fromField:= links[0];
             break;
          end
       end;
       parts.free;
       links.free;
    end;


Function wwDataSetRemoveObsoleteControls(parentForm: TCustomForm; dataSet: TComponent): boolean;
var i: integer;
    parts: TStrings;
    ControlType: TStrings;
begin
   result:= True;
   exit;
   if parentForm=nil then exit;
   if not (csDesigning in parentForm.ComponentState) then exit; { only remove in design mode}

   parts:= TStringList.create;
   ControlType:= wwGetControlType(dataSet);
   i:= 0;
   if ControlType<>nil then while (i<=ControlType.count-1) do begin{ Delphi 5}
      strbreakApart(ControlType.Strings[i], ';', parts);
      if (parts.count<2) then begin
         i:= i + 1;
         continue;
      end;
      if isWWEditControl(parts[1]) then
      begin
         if pos('.', parts[2])>0 then begin
            if (length(StrTrailing(parts[2],'.'))>0) and
               (Dataset.owner.FindComponent(strTrailing(parts[2],'.'))=Nil) then
            begin
               ControlType.delete(i);
            end
            else inc(i)
         end
         else begin
            if (parentForm.FindComponent(parts[2])=Nil) then
            begin
               ControlType.delete(i);
            end
            else inc(i);
         end;
      end
      else i:= i+1;
   end;

   parts.free;

end;

procedure wwDataSet_GetControl(dataSet: TComponent; AFieldName: string;
                      var AControlType: string; var AParameters: string);
var i: integer;
    ControlType: TStrings;
    APos: integer;
begin
   { 8/14/97 - Optimized logic to speed painting of grid }
   AControlType:= '';
   AParameters:= '';
   controlType:= wwGetControlType(dataset);
   if ControlType=nil then exit; { Delphi 5}
   for i:= 0 to ControlType.count-1 do begin
      APos:= 1;
      if strGetToken(controlType[i], ';', APos)<>AFieldName then continue;
      AControlType:= strGetToken(controlType[i], ';', APos);
      AParameters:= copy(controlType[i], APos, 255);
   end
end;

procedure wwDataSetRemoveObsolete(dataSet: TComponent; //DataSet;
          FLookupFields, FLookupLinks, FControlType: TStrings);
var i: integer;
    parts: Tstrings;
begin
   parts:= TStringList.create;
   i:= 0;
   if FLookupFields<>Nil then while (i<=FLookupfields.count-1) do begin
      strbreakApart(FLookupFields.Strings[i], ';', parts);
      if (not wwDataSetisValidField(dataSet, parts[0])) then begin
         FLookupFields.delete(i);
         FLookupLinks.delete(i);
      end
      else i:= i+1;
   end;

   i:= 0;
   if (FControlType<>nil) then { Delphi5}
     while (i<=FControlType.count-1) do begin
        strbreakApart(FControlType.Strings[i], ';', parts);
        if (not wwDataSetIsValidField(dataSet, parts[0])) then
        begin
           FControlType.delete(i);
        end
        else i:= i+1;
     end;

   parts.free;
end;

procedure wwDataSet_SetControl(dataSet: TComponent;
          AFieldName: string; AComponentType: string; AParameters: string);
var i: integer;
    parts: Tstrings;
    Found: boolean;
    ControlType: TStrings;
begin
   i:= 0;
   Found:= False;
   ControlType:= wwGetControlType(dataSet);
   parts:= TStringList.create;

   if ControlType<>nil then while (i<=ControlType.count-1) do begin { Delphi 5}
      strbreakApart(ControlType.Strings[i], ';', parts);
      if (lowercase(parts[0])=lowercase(AFieldName)) then begin
         if (lowercase(AComponentType)='field') or (lowercase(AComponentType)='') then
         begin
            ControlType.delete(i);  {Delete control}
            Found:= True;
            break;
         end
         else begin
            ControlType.Strings[i]:= parts[0] + ';' + AComponentType + ';' +
                 AParameters;
            Found:= True; {Update Control}
            break;
         end
      end;
      i:= i + 1;
   end;

   if (not found) and (ControlType<>nil) then begin { Delphi 5}
      ControlType.add(AFieldName + ';' + AComponentType + ';' + AParameters);
   end;

   parts.free;
end;

function wwFieldIsValidValue(fld: TField; key: string): boolean;
begin
   result:= wwIsValidValue(fld.dataType, key);
end;

Function wwFieldIsValidLocateValue(fld: TField; key: string):boolean;
begin
   result:= False;
   if Fld=Nil then exit;
   
   result:= wwFieldIsValidValue(fld, key);

   if (key='') and
   {$ifdef win32}
   (fld.datatype in [ftCurrency, ftFloat, ftBCD, ftInteger, ftSmallInt, ftWord,
                    ftAutoInc, ftTime, ftDate, ftDateTime]) then result:= False;
   {$else}
   (fld.datatype in [ftCurrency, ftFloat, ftBCD, ftInteger, ftSmallInt, ftWord,
                   ftTime, ftDate, ftDateTime]) then result:= False;
   {$endif}
end;

Function wwIsValidValue(FldType: TFieldType; key: string):boolean;
begin
   result:= False;
   case FldType of
     ftCurrency, ftFloat, ftBCD  : if not wwStrToFloat(key) then exit;
     ftinteger, ftSmallInt, ftWord : if not wwStrToInt(key) then exit;

     {$ifdef win32}
     ftAutoInc : if not wwStrToInt(key) then exit;
     {$endif}

     ftTime: if not wwStrToTime(key) then exit;  {3/6/97}
     ftDate : if not wwStrToDate(key) then exit;
     ftDateTime :
        if not wwStrToDateTime(key) then begin
           if not wwStrToDate(key) then exit;
        end;
     else;
   end;
   result:= True;
end;


Function wwTableFindNearest(dataSet: TDataSet; key: string; FieldNo: integer): boolean;
var table: TwwTable;
    useNarrowSearch: boolean;
    useTextSearch: boolean;
    UpperRangeString: string;
    i: integer;
    SkipLocate: boolean;
    {$ifdef wwDelphi3Up}
    LocateOptions: TLocateOptions;
    LocateValues: Variant;
    LocateFields: string;
    {$endif}

   Function IsValueType(AFieldType: TFieldType): boolean;
   begin
      result:=
          (AFieldType in [ ftSmallInt, ftInteger, ftWord, ftFloat, ftCurrency]);
      {$ifdef win32}
       if AFieldType=ftAutoInc then result:= True;
      {$endif}
   end;

begin
   result:= False;
   if not (dataset is TTable) then exit;

   { 5/25/95 - Use syncSQLByRange property }
   { 5/25/95 - Use syncSQLByRange property }
   {           Use NarrowSearch property   }
   if (dataset is TwwTable) then begin
      useNarrowSearch:= (dataset as TwwTable).NarrowSearch;
   end
   else begin
      MessageDlg('Incremental Search - TTable component not supported. Use TwwTable instead.', mtWarning, [mbok], 0);
      exit;
   end;
   table:= dataSet as TwwTable;


   if table.indexFieldCount=0 then begin
      MessageDlg('Table ' + dataset.name + ': Table index not found', mtWarning, [mbok], 0);
      exit;
   end;

   useTextSearch:= False;

   case table.indexFields[FieldNo].dataType of
         ftCurrency, ftFloat, ftBCD  : if not wwStrToFloat(key) then exit;
         ftinteger, ftSmallInt, ftWord : if not wwStrToInt(key) then exit;
         {$ifdef win32}
         ftAutoInc : if not wwStrToInt(key) then exit;
         {$endif}
         ftDate : if not wwStrToDate(key) then exit;
         ftTime: if not wwStrToTime(key) then exit;
         ftDateTime:
            if not wwStrToDateTime(key) then begin
               if not wwStrToDate(key) then exit;
            end;
         else useTextSearch:= True;
   end;

   with table do try

      if UseNarrowSearch then begin  { Search by narrowing down }
         Screen.cursor:= crHourGlass;
         DisableControls;
         if useTextSearch then begin
            if key='' then
              (table as TwwTable).FastCancelRange  { 12/4/96 - Faster cancel range }
            else begin
              { MSSQL does not work with char(255) }
              UpperRangeString:= key;
//              for i:= 0 to indexfields[0].size-1 do
              for i:= 0 to indexfields[0].size-1-length(key) do { 2/24/98 - Subtrack length(key) }
                 UpperRangeString:= UpperRangeString + char((table as TwwTable).NarrowSearchUpperChar);

              { 10/16/97 - Skip descending test if using IndexFieldNames }
              if ((IndexName<>'') or (IndexFieldNames='')) and
                 (ixDescending in IndexDefs.Items[IndexDefs.indexof(IndexName)].Options) then
                  table.SetRange([UpperRangeString], [key])
              else table.setRange([key],[UpperRangeString])
            end;
         end
         else begin
            if table is TwwTable then
               (table as TwwTable).wwSetRangeStart([key]);
         end;
         EnableControls;
         Screen.cursor:= crDefault;
      end
      { 11/6/96 - Don't use setRange if detail table }
      else if (not database.isSqlBased) or (not SyncSQLByRange) or (table.mastersource<>nil) then begin
         {$ifdef wwDelphi3Up}
         { 5/29/97 - Use 32 bit Locate function instead of FindNearest }
         if wwInternational.UseLocateMethodForSearch then
         begin
            if table.isCaseInsensitiveIndex then LocateOptions:= [loPartialKey,  loCaseInsensitive]
            else LocateOptions:= [loPartialKey];

            if (Key='') then Dataset.first { 6/9/97}
            else if FieldNo=0 then
                DataSet.Locate(indexFields[0].FieldName, Key, LocateOptions)
            else begin
               LocateValues:= VarArrayCreate([0, FieldNo], varVariant);
               LocateFields:= '';
               SkipLocate:= False; { 2/22/99}
               for i:= 0 to FieldNo do begin
                  LocateValues[i]:= indexfields[i].asString;
                  if (indexfields[i].isNull) then SkipLocate:= True; { 2/22/99 }
                  if LocateFields<>'' then LocateFields:= LocateFields + ';';
                  LocateFields:= LocateFields + indexFields[i].FieldName;
               end;
               LocateValues[FieldNo]:= Key;

               if not SkipLocate then  { 2/22/99 }
                  DataSet.Locate(LocateFields, LocateValues, LocateOptions);
            end
         end
         else begin
            case FieldNo of { 6/20/98 - Use AsString insted of Text }
                0: FindNearest([key]);
                1: FindNearest([indexFields[0].asString, key]);
                2: FindNearest([indexFields[0].asString, indexFields[1].asString, key]);
                3: FindNearest([indexFields[0].asString, indexFields[1].asString,
                           indexFields[2].asString, key]);
            end
         end;

         {$else}
         case FieldNo of
             0: FindNearest([key]);
             1: FindNearest([indexFields[0].asString, key]);
             2: FindNearest([indexFields[0].asString, indexFields[1].asString, key]);
             3: FindNearest([indexFields[0].asString, indexFields[1].asString,
                           indexFields[2].asString, key]);
         end
         {$endif}
      end
      else begin
         Screen.cursor:= crHourGlass;
         DisableControls;

         if table is TwwTable then begin
            if key='' then begin
               (table as TwwTable).FastCancelRange;  { 12/4/96 - Faster cancel range }
            end
            else begin
{              (table as TwwTable).wwSetRangeStart([key]);}
              case FieldNo of
                0: (table as TwwTable).wwSetRangeStart([key]);
                1: (table as TwwTable).wwSetRangeStart([indexFields[0].asString, key]);
                2: (table as TwwTable).wwSetRangeStart([indexFields[0].asString, indexFields[1].asString, key]);
                3: (table as TwwTable).wwSetRangeStart([indexFields[0].asString, indexFields[1].asString,
                                                     indexFields[2].asString, key]);
              end

            end
         end
         else begin
            setRangeStart;
            IndexFields[FieldNo].asString:= key;
            setRangeEnd;
            ApplyRange;
         end;

         EnableControls;
         Screen.cursor:= crDefault;
      end;

     {4/6/97}
      if (indexFields[FieldNo].DataType in [ftFloat, ftCurrency]) then
      begin
         if (key = '') then
            result := (indexFields[fieldNo].AsString = '')
         else result:=  StrToFloat(key)=TFloatField(indexFields[fieldNo]).asFloat
      end
      else if isValueType(indexFields[FieldNo].DataType) then
         result:=  key=indexFields[fieldNo].asString
      else result:= pos(lowercase(key),
                   lowercase(indexFields[fieldNo].asString))=1;
   finally
   end;
end;

procedure wwTableChangeIndex(dataSet: TDataSet; a_indexItem: TIndexDef);
var newIndexValues, parts: TStrings;
    j: integer;
    table: TTable;
    syncSQLByRange: boolean;
begin
   if not (dataset is TTable) then exit;
   table:= dataSet as TTable;

   if (table is TwwTable) then begin
      syncSQLByRange:= (table as TwwTable).syncSQLByRange;
   end
   else begin
      syncSQLByRange:= True;
   end;

   if (table.database.isSqlBased) and (syncSQLByRange) then begin
      if table.indexName = a_indexItem.Name then exit; { index already correct}

      Screen.cursor:= crHourGlass;

      parts:= Nil;
      newIndexValues:= Nil;
      with table do try
         parts:= TStringList.Create;
         newIndexValues:= TStringList.create;

         strBreakApart(a_IndexItem.fields, ';', parts);

         for j:= 0 to parts.count-1 do
            newIndexValues.add(fieldByName(Parts[j]).asString); { 6/20/98 - Changed from .text to .asString }

         disableControls;

 {12/7/96 - Following 2 lines not necessary and can be slow}
 {         dbiResetRange(handle);
         First; }
         active:= False;
         IndexName:=  a_indexItem.Name;
         active:= True;

         { Synchronize to previous position}
         setRangeStart;
         for j:= 0 to indexFieldCount-1 do
            IndexFields[j].asString:= newIndexValues[j];
         ApplyRange;

         enableControls;

      finally
         Screen.cursor:= crDefault;
         newIndexValues.free;
         parts.free;
      end

   end
   else begin
      table.IndexName:=  a_IndexItem.Name;
   end;
end;


Function wwGetAlias(aliasName: string): string;
var
    tempCString: array[0..255] of char;
    handle: hDBICur;
    cfg: CFGDesc;
    dbRes: DBIResult;
begin
   result:= '';
   dbRes:= DbiOpenCfgInfoList(Nil, dbiReadOnly, cfgPersistent,
           strpcopy(tempCString,'\Databases\' + aliasName + '\db info'), handle);
   if dbRes = DBIERR_OBJNOTFOUND then exit;

   while dbiGetNextRecord(handle, dbiNoLock, @cfg, nil)=0 do
   begin
      if (lowercase(strPas(cfg.szNodeName))='path') then
      begin
         result:=strPas(cfg.szValue);
         break;
      end
   end;
   DbiCloseCursor(handle);
end;

    Function wwSaveAnswerTable(ADataSet: TDBDataSet;
             AHandle: HDbiCur; tableName: string): boolean;
    var
       tableNameC: array [1..256] of char;
       dbRes: DBIRESULT;
       aliasName, restOfPath, aliasPath: string;
       endAliasPos: integer;
       tempCString: array[0..255] of char;
       differentDrive: boolean;

       function CopyAnswerTable: boolean;
       var aBatTblDesc : BATTblDesc;
           recMoveCount: longint;
           dbiErr: dbiResult;
{           bm: TBatchMove;}
{           tempTable: TTable;}
       begin
{          tempTable:= TTable.create(self);
          tempTable.TableName:= 'TempAnsw.db';

          bm:= TBatchMove.create(self);
          bm.Mode:= batCopy;
          bm.Source:= ADataSet;
          bm.Destination:= TempTable;
}

          Check(DbiSetToBegin(AHandle));
          with aBatTblDesc do begin
            hDB:=ADataSet.DBHandle;
            szUsername[0]:=#0;
            szPassword[0]:=#0;
            strpcopy(szTblName, tableName);
            strpcopy(szTblType, szParadox);
          end;

          try
             dbiErr:=dbiDeleteTable(ADataSet.DBHandle,aBatTblDesc.szTblName,aBatTblDesc.szTblType);
             if dbiErr<>DBIERR_NOSUCHTABLE then Check(dbiErr);
          except
          end;

          recMoveCount:=0;
          Check(DbiBatchMove(nil, AHandle, @aBatTblDesc, nil, batchCopy, 0, nil,
                            nil, nil, 0, nil, nil, nil, nil, nil, nil, TRUE, TRUE,
                            recMoveCount, TRUE));
          result:= True;
       end;

    begin
       result:= True;

       if tableName='' then begin
          result:= False;
          exit;
       end
       else if tableName[1]=':' then begin
         { convert alias to path }
         tableName:= copy(tableName, 2, length(tableName)-1);
         endAliasPos:= pos(':', tableName);
         aliasPath:= '';
         if endAliasPos>1 then begin
            aliasName:= copy(tableName, 1, endAliasPos-1);
            restOfPath:= copy(tableName, endAliasPos+1, length(tableName)+1-(endAliasPos+1));
            aliasPath := wwGetAlias(aliasName);
            if (aliasPath<>'') and (restOfPath<>'') and
               (aliasPath[length(aliasPath)]<>'\') and (restOfPath[1]<>'\') then
                tableName:= aliasPath + '\' + restOfPath
            else tableName:= aliasPath + restOfPath
         end;
         if aliasPath='' then begin
            MessageDlg('Invalid Alias in QBE', mtError, [mbok], 0);
            result:= False;
            exit;
         end
       end;

       try
          { Copy table when the temp file is on a different drive and have memo field}
          differentDrive := (length(tableName)>=2) and (tableName[2]=':') and
                (pos(lowercase(tableName[1]), lowercase(Session.privatedir))<>1);

          if differentDrive then
          begin
             CopyAnswerTable;
             Result:= True;
             exit;
          end;

          { Use make permanent since temp file is on same disk as answerTable }
          dbres:= dbiMakePermanent(AHandle, strpcopy(@tableNameC, tableName), True);
          if dbRes=DBIERR_NONE then begin
             dbRes:= dbiSaveChanges(AHandle);
             result:= dbRes=DBIERR_NONE;
          end
          else begin
             result:= False;
             dbiGetErrorString(dbres, @tempCstring);
             ShowMessage(strpas(tempcstring) +  '(' + tableName + ')');
          end
       except
          MessageDlg('Unable to create answer table ' + tableName, mtWarning, [mbok], 0);
       end;

    end;

Function wwInPaintCopyState(ControlState: TControlState): boolean;
begin
{$IFDEF WIN32}
   result:= (csPaintCopy in ControlState);
{$ELSE}
   result:= False;
{$ENDIF}
end;

procedure wwPlayKeystroke(Handle: HWND; VKChar: word; VKShift: Word);
var
  KeyState: TKeyboardState;
  NewKeyState: TKeyboardState;
{  i: integer;}
begin
   GetKeyboardState(KeyState);
{   for I := Low(NewKeyState) to High(NewKeyState) do
     NewKeyState[I] := 0;
}
   NewKeyState:= KeyState;
   NewKeyState [VKShift] := $81;
   NewKeyState [VKChar] := $81;
   SetKeyboardState(NewKeyState);
   PostMessage(Handle, WM_KEYDOWN, VKChar, 1);
   PostMessage(Handle, WM_KEYUP, VKChar, 1);
   SetKeyboardState(KeyState);
end;

procedure wwClearAltChar;
var KeyState: TKeyboardState;
begin
   GetKeyboardState(KeyState);
   KeyState [VK_Menu] := 0;
   SetKeyboardState(KeyState);
end;
{
Function wwGetUniqueFileName(Extension: string; var Filename: string): boolean;
var
    f: Double;
    startSeed, Seed: longint;
    Path: string;
    tempFileNameC: array[0..255] of char;
    SearchCount: integer;
begin
   GetTempFileName('C', '_WW', 1, tempFileNameC);
   path:= ExtractFilePath(strPas(tempFileNameC));
   f:= (Now - SysUtils.Date)*MSecsPerDay;
   seed:= Trunc(f) mod 10000;
   startSeed:= seed;
   repeat
      FileName:= Path + '_WW' + inttostr(seed) + '.' + Extension;
      seed:= (seed+1) mod 10000;
      if seed = startSeed then begin
         FileName:= '';
         result:= False;
         exit;
      end;
      inc(searchCount);
   until (not FileExists(FileName));
   result:= True;
end;
}
   function wwGetQueryText(tempQBE: TStrings; Sql: boolean): PChar;
   var
     I: Integer;
     StrEnd: PChar;
    {$ifndef win32}
     StrBuf: array[0..255] of Char;
    {$endif}
     BufLen: word;
     incr: integer;
   begin
     BufLen := 1;
     if SQL then incr:= 1 else incr:= 2;
     for I := 0 to tempQBE.Count - 1 do
       Inc(BufLen, Length(tempQBE.Strings[I]) + incr);
     Result := StrAlloc(BufLen);
     try
       StrEnd := Result;
       for I := 0 to tempQBE.Count - 1 do
       begin
         {$ifdef win32}
         StrEnd := StrECopy(StrEnd, PChar(tempQBE.Strings[I])); { Support >255 lines in 32 bit}
         {$else}
         StrPCopy(StrBuf, tempQBE.Strings[I]);
         StrEnd := StrECopy(StrEnd, StrBuf);
         {$endif}
         if i<tempQBE.Count-1 then
         begin
            if SQL then StrEnd := StrECopy(StrEnd, ' ')
            else StrEnd := StrECopy(StrEnd, #13#10);
         end
       end;
     except
       StrDispose(Result);
       raise;
     end;
   end;

Function wwMemAvail(memSize: integer): boolean;
begin
   {$ifdef win32}
   result:= False;
   {$else}
   result:=  (MaxAvail < memSize);
   {$endif}
end;

Procedure wwPictureByField(DataSet: TComponent; FieldName: string; FromTable: boolean;
    var Mask: string; var AutoFill, UsePictureMask: boolean);
var APos, i: integer;
    FPictureMasks: TStrings;
    TempMask: string;
begin
   Mask:= '';
   AutoFill:= True;
   UsePictureMask:= True;

   FPictureMasks:= wwGetPictureMasks(DataSet);
   if FPictureMasks=Nil then exit;

   for i:= 0 to FPictureMasks.count-1 do
   begin
      APos:= 1;
      if lowercase(FieldName)=lowercase(strGetToken(FPictureMasks[i], #9, APos)) then
      begin
         Mask:= strGetToken(FPictureMasks[i], #9, APos);
         Autofill:= strGetToken(FPictureMasks[i], #9, APos)='T';
         UsePictureMask:= strGetToken(FPictureMasks[i], #9, APos)='T';
         break;
      end
   end;

   { Use table mask and ignore component mask }
   if (DataSet is TwwTable) and fromTable then begin
      TempMask:= TwwTable(Dataset).GetDBPicture(FieldName);
      if (TempMask<>'') and (Mask<>'') then begin
         wwSetPictureMask(dataSet, FieldName,
            '', AutoFill, UsePictureMask, True, True, False);
         Mask:= TempMask;
         exit;
      end
      else if TempMask<>'' then Mask:= TempMask;
   end;
end;

procedure wwDataModuleChanged(temp: TComponent);
begin
   {$ifdef win32}
   while (temp<>Nil) and (temp.Owner<>Nil) and not (temp is TCustomForm) do temp:= temp.Owner;
   if (temp<>Nil) and (temp is TCustomForm) and ((temp as TCustomForm).Designer<>Nil) then
      (temp as TCustomForm).Designer.modified;
   {$endif}
end;

procedure wwSetPictureMask(dataSet: TComponent; AFieldName: string;
    AMask: string;
    AutoFill: boolean;
    UsePictureMask: boolean;
    SetMask: boolean;
    SetAutoFill: boolean;
    SetUsePictureMask: boolean);
var i: integer;
    Found: boolean;
    FPictureMasks: TStrings;
    APos: integer;
    Temp: string;

    Function BoolToString(val: boolean): string;
    begin
       if val then result:= 'T' else result:= 'F';
    end;

begin
   Found:= False;
   FPictureMasks:= wwGetPictureMasks(DataSet);
   if FPictureMasks=Nil then exit;

   { DBMask takes precedence }
   if DataSet is TwwTable then
   begin
     Temp:= wwPdxPictureMask(TDataSet(DataSet), AFieldName);
     if Temp<>'' then AMask:= Temp;
   end;

   i:= 0;
   while (i<=FPictureMasks.count-1) do begin
      APos:= 1;
      if lowercase(AFieldName)=lowercase(strGetToken(FPictureMasks[i], #9, APos)) then
      begin
         Temp:= strGetToken(FPictureMasks[i], #9, APos);
         if not SetMask then AMask:= Temp;
         Temp:= strGetToken(FPictureMasks[i], #9, APos);
         if not SetAutoFill then AutoFill:= Temp='T';
         Temp:= strGetToken(FPictureMasks[i], #9, APos);
         if not SetUsePictureMask then usePictureMask:= Temp='T';

         if AMask='' then FPictureMasks.delete(i)
         else begin
            FPictureMasks.Strings[i]:= AFieldName + #9 +
                  AMask + #9 + BoolToString(AutoFill) +
                  #9 + BoolToString(UsePictureMask);
         end;
         Found:= True;
         break;
      end
      else i:= i + 1;
   end;

   if (not found) and (AMask<>'') then
      FPictureMasks.add(AFieldName + #9 + AMask + #9 +
               BoolToString(AutoFill) +
               #9 + BoolToString(UsePictureMask));

end;

Function wwGetFieldNameFromTitle(DataSet: TDataSet; fieldTitle: string): string;
var i: integer;
begin
   result:= '';
   with DataSet do begin
      for i:= 0 to fieldCount-1 do begin
         if strReplaceChar(fields[i].displayLabel,'~',' ')=strReplaceChar(fieldTitle,'~',' ') then begin
            result:= fields[i].FieldName;
            exit;
         end
      end
   end;
end;

Function wwGetListIndex(list: TStrings; itemName: string): integer;
var i: integer;
begin
   result:= -1;
   for i:= 0 to list.count-1 do begin
      if wwEqualStr(list[i], itemName) then begin
         result:= i;
         break;
      end
   end;
end;

Function wwGetOwnerForm(component: TComponent):TCustomForm;
var temp: TComponent;
begin
   temp:= component;
   while (temp<>Nil) and (temp.Owner<>Nil) and not (temp is TCustomForm) do temp:= temp.Owner;
   result:= TCustomForm(temp);
end;

Function isWWEditControl(pname: string): boolean;
begin
   result:= wwEqualStr(pname, WW_DB_EDIT) or wwEqualStr(pname, WW_DB_LOOKUP_COMBO) or
            wwEqualStr(pname, WW_DB_COMBO) { or wwEqualStr(pname, WW_DB_RICHEDIT) };
end;

{$ifdef win32}
Procedure wwDrawGlyph(
    Bitmap: TBitmap;
    Canvas: TCanvas; R: TRect;
    State: TButtonState;
    Enabled: Boolean;
    Transparent: boolean;
    FlatButtonTransparent: boolean;
    ControlState: TControlState);
var Flags: Integer;
    DC: HDC;
//    w: integer;
//    LeftIndent, TopIndent: integer;
begin
   Flags:= 0;
   if (State=bsDown) and not (wwInPaintCopyState(ControlState)) then
     Flags := BF_FLAT;
   if not FlatButtonTransparent then Flags:= Flags or BF_MIDDLE;
   DC:= Canvas.Handle;
   if not Transparent then
      DrawEdge(DC, R, EDGE_RAISED, BF_RECT or Flags);
   Canvas.CopyRect(R, Bitmap.Canvas, R);
end;


Procedure wwDrawEllipsis(Canvas: TCanvas; R: TRect;
    State: TButtonState;
    Enabled: Boolean;
    Transparent: boolean;
    FlatButtonTransparent: boolean;
    ControlState: TControlState);
var Flags: Integer;
    DC: HDC;
    w: integer;
    LeftIndent, TopIndent: integer;
begin
   Flags:= 0;
   if (State=bsDown) and not (wwInPaintCopyState(ControlState)) then
     Flags := BF_FLAT;
   if not FlatButtonTransparent then Flags:= Flags or BF_MIDDLE;
   DC:= Canvas.Handle;
   if not Transparent then
      DrawEdge(DC, R, EDGE_RAISED, BF_RECT or Flags);

   LeftIndent:= ((R.Right - R.Left) shr 1) - 1 + Ord(State=bsDown);
   TopIndent:= ((R.Bottom+1-R.Top) shr 1) - 1 + Ord(State=bsDown);
   W := (R.Right+1 - R.Left) shr 3;
   if W = 0 then W := 1;
   PatBlt(DC, R.Left + LeftIndent, R.Top + TopIndent, W, W, BLACKNESS);
   PatBlt(DC, R.Left + LeftIndent - (W * 2), R.Top + TopIndent, W, W, BLACKNESS);
   PatBlt(DC, R.Left + LeftIndent + (W * 2), R.Top + TopIndent, W, W, BLACKNESS);
end;

Procedure wwDrawDropDownArrow(Canvas: TCanvas; R: TRect;
    State: TButtonState;
    Enabled: Boolean;
    ControlState: TControlState);
var Flags: Integer;
begin
  if not Enabled then
    Flags := DFCS_SCROLLCOMBOBOX or DFCS_INACTIVE
  else if (State=bsUp) or wwInPaintCopyState(ControlState) then
    Flags := DFCS_SCROLLCOMBOBOX
  else
    Flags := DFCS_SCROLLCOMBOBOX or DFCS_FLAT or DFCS_PUSHED;
//  Flags:= Flags or dfcs_flat;
  DrawFrameControl(Canvas.Handle, R, DFC_SCROLL, Flags);
end;

{$endif}

Function wwHasIndex(ADataSet: TDataSet): boolean;
begin
   result:= (ADataSet is TwwTable) and (TwwTable(ADataSet).indexFieldCount>0);
end;

Function wwIsTableQuery(ADataSet: TDataSet): boolean;
begin
   result:= (ADataset is TwwTable) and (TwwTable(ADataset).Query.Count>0)
end;

Function wwPdxPictureMask(ADataSet: TDataSet; AFieldName: string): string;
begin
   result:= '';
   if (ADataSet is TwwTable) then
   begin
     if ADataSet.FindField(AFieldName)=nil then exit;
     result:= TwwTable(ADataSet).GetDBPicture(AFieldName)
   end
end;

 { Calling a dialog in mouseDown event prevents mouseUp code from being executed}
 { The following code corrects this Windows anomaly.                            }
  procedure wwFixMouseDown;
  var i: integer;
      parentForm: TCustomForm;
      tempControl: TControl;
  begin
        parentForm:= Screen.ActiveForm;
        if parentForm=nil then exit;
        if (csLButtonDown in ParentForm.ControlState) then
        begin
           PostMessage(ParentForm.handle, WM_LBUTTONUP, 0, 0);
           exit;
        end;

        for i:= 0 to ParentForm.ControlCount-1 do begin
           tempControl:= ParentForm.Controls[i];
           if (csLButtonDown in tempControl.ControlState) and
              (tempControl is TWinControl) then begin
              PostMessage(TWinControl(tempControl).handle, WM_LBUTTONUP, 0, 0);
              break;
           end
        end
  end;

procedure wwValidatePictureFields(ADataSet: TDataSet;
     FOnInvalidValue: TwwInvalidValueEvent);
var
  I: Integer;
  tempPicture: string;
  tempAutoFill, tempUsePictureMask: boolean;

  function isValidPicture(PictureMask, s: string): boolean;
  var pict: TwwPictureValidator;
      res: TwwPicResult;
  begin
     if (s='') then
        result:= True
     else begin
        pict:= TwwPictureValidator.create(PictureMask, False);;
        res:= Pict.picture(s, False);
        result := res = prComplete;
        pict.Free;
     end;
  end;

begin
   { Component level validation }
   with ADataSet do begin
      for i:= 0 to FieldCount-1 do
      begin
         wwPictureByField(ADataSet, Fields[i].FieldName, True,
                    tempPicture, tempAutoFill, tempUsePictureMask);
         if tempPicture<>'' then begin
            if not isValidPicture(tempPicture, Fields[i].asString) then
{            if not isValidPicture(tempPicture, Fields[i].DisplayText) then}
            begin
               with Fields[i] do begin
                  if not ReadOnly then begin
                     FocusControl;
                     if Assigned(FOnInvalidValue) then
                        FOnInvalidValue(ADataSet, Fields[i]);
                     {$ifdef win32}
                     DatabaseError(wwInternational.UserMessages.PictureValidateError + DisplayName);
                     {$else}
                     DatabaseError(wwInternational.UserMessages.PictureValidateError + DisplayName^);
                     {$endif}
                  end
               end
            end
         end
      end
   end
end;

function wwDataSetFindRecord(
   DataSet: TDataSet;
   KeyValue: string;
   LookupField: string;
   MatchType: TwwLocateMatchType;
   caseSensitive: boolean): boolean;
var tempStr: string;

    { If already on this record then skip findkey }
    Function isAlreadyFound: boolean;
    begin
      if CaseSensitive then result:= tempStr=KeyValue
      else result:= lowercase(tempstr)=lowercase(KeyValue);
    end;

begin
   result:= True;
   tempStr:= DataSet.FieldByName(LookupField).asString;
   if isAlreadyFound then exit;
   result:=  wwFindMatch(True, DataSet, LookupField,
                       KeyValue, matchType, CaseSensitive);
end;


(*
Procedure wwOpenPictureDB(wwtable: TTable);
var
    {$ifdef win32}
    ipReg: TRegIniFile;
    {$else}
    len: integer;
    Directory: packed array[0..255] of char;
    {$endif}

begin
   try
      {$ifdef win32}
      ipreg := TRegIniFile.create('');
      wwtable.databaseName:= ipreg.ReadString('\Software\Woll2Woll\InfoPower', 'Masks Database Path', '');
      ipreg.free;
      {$else}
      len:= GetPrivateProfileString('Paths', 'PictureDB', '',
              Directory, 255, 'InfoPowr.ini');
      Directory[len]:= #0;
      wwtable.databaseName:= strpas(Directory);
      {$endif}

      try
         wwtable.tableName:= 'PICTURE'; {3/2/98 - Don't specify extension }
         wwtable.active:= True;
      except
         wwtable.tableName:= 'PICTURES.DBF';
         wwtable.indexName:= '';
         wwtable.active:= True;
      end

   except
      {$ifdef win32}
      ShowMessage('Unable to find picture mask database:'+#13 +
                  'Path: ' + wwtable.databaseName + #13 +
                  'Table: PICTURE' + #13 +
                  'See path specification defined in Windows Registry at' + #13 +
                  '  \Software\Woll2Woll\InfoPower\Masks Database Path');
      {$else}
      ShowMessage('Unable to find picture mask database:'+#13 +
                  'Path: ' + strPas(Directory) + #13 +
                  'Table: PICTURE' + #13 +
                  'See infopowr.ini for path specification.');
      {$endif}
   end;
end;
*)

Function wwValidFilterableFieldType(ADataType: TFieldType): boolean;
begin
   result:= not ((ADataType = ftBlob) or (ADataType=ftGraphic) or
                  (ADataType = ftVarBytes) or (ADataType=ftBytes));
end;

procedure wwALinkHelp(Handle: HWND; ALink: string);
var ALinkMacro: array[0..127] of char;
    HelpFile: string;
begin
  {$ifdef ver110}
  HelpFile := 'IP40C3.HLP';
  {$else}
    {$ifdef ver120}
    HelpFile := 'IP40D4.HLP';
    {$else}
      {$ifdef ver125}
      HelpFile := 'IP40C4.HLP';
      {$else}
      HelpFile := 'IP40D3.HLP';
      {$endif}
    {$endif}
  {$endif}
  StrCopy(ALinkMacro, PChar('AL("' + ALink + '", 1, "", "main")'));
//  WinHelp(Handle, PChar(HelpFile), HELP_FORCEFILE, 0);
  WinHelp(Handle, PChar(HelpFile), HELP_COMMAND, Integer(@ALinkMacro));
end;

procedure wwHelp(Handle: HWND; HelpTopic: PChar);
var
   context: array[0..127] of char;
begin
   strcopy(context, HelpTopic);
   {$ifdef ver110}
   WinHelp(Handle, 'IP40C3.HLP', HELP_KEY, longint(@context));
   {$else}
     {$ifdef ver120}
     WinHelp(Handle, 'IP40D4.HLP', HELP_KEY, longint(@context));
     {$else}
     WinHelp(Handle, 'IP40D3.HLP', HELP_KEY, longint(@context));
     {$endif}
   {$endif}
end;

Function wwIsValidChar(key: word): boolean;
begin
   result:= (key = VK_BACK) or (key=VK_SPACE) or (key=VK_DELETE) or
            ((key >= ord('0')) and (key<=VK_DIVIDE)) or
            (key>VK_SCROLL);
end;

{
Undocumented method to set links at runtime.   This method can safely be used
and will be supported in future versions of InfoPower

This routine will set the lookup links. The parameter description
follows...

dataSet: TDataSet         The Dataset containing the calculated field
FldName: string           The name of the calculated field to be linked
DatabaseName : string     The name of the Database
TableName:string          The Lookup Table Name (including .DB or whatever extension)
DisplayFld:string         The Lookup Field Name
IndexFieldNames:string    Index Field Names (i.e. CustomerNo;OrderNo)
Links: string             The join value in the following format
                          Join1MasterTable;Join1LinkTable;Join2MasterTable;Join2LinkTable;...'
                          For example Links := 'Customer No;Customer No'
useExtension: Char        'Y' or 'N': Whether or not to use extension in tablenamea


After calling this routine you need to call  TwwTable's refresh method.

Example:  The following is an example of calling this method.  The code will
create a link for an existing calculated field with the fieldname CompanyName.
It looks up the table infodemo:ip2cust.db and displays the company name field.

   wwDataSet_SetLookupLink(wwTable1,'CompanyName','InfoDemo','IP2CUST.DB',
        'Company Name','Customer No','Customer No;Customer No','Y');
   wwtable1.refresh;

}

procedure wwDataSet_SetLookupLink(dataSet: TDataSet;
   FldName, DatabaseName, TableName, DisplayFld, IndexFieldNames, Links: string;
   useExtension: Char);
var
   FLookupLinks, FLookupFields: TStrings;
   parts: Tstrings;
   i: integer;
begin
   parts:= TStringList.create;
   FLookupFields:= wwGetLookupFields(dataSet);
   FLookupLinks:= wwGetLookuplinks(dataSet);

   i:=0;
   while (i<=FLookupfields.count-1) do begin
      strbreakApart(FLookupFields.Strings[i], ';', parts);
      if lowercase(parts[0])=lowercase(FldName) then begin
         FLookupFields.delete(i);
         FLookupLinks.delete(i);
      end
      else i:= i+1;
   end;

   if not
     ((DatabaseName='') or (TableName='') or (DisplayFld='') or (IndexFieldNames='')) then
   begin
      FLookupFields.add(FldName + ';' + DatabaseName + ';' + TableName + ';' +
         DisplayFld + ';;' + IndexFieldNames + ';' + useExtension);

      FLookupLinks.add(Links);
   end;

   parts.Free;
end;

Procedure wwDataSetUpdateSelected(dataSet: TDataSet; selected: TStrings);
var i: integer;
begin
   selected.clear;
   with dataSet do begin
      for i:= 0 to fieldCount-1 do begin
         if (fields[i].visible) then
            Selected.add(fields[i].fieldName + #9 +
              inttostr(fields[i].displayWidth) + #9 +
              fields[i].displayLabel);
      end;
   end
end;

Function wwFindSelected(selected: TStrings;
   FieldName: string; var index: integer): boolean;
var i: integer;
    parts: TStringList;
begin
   parts := TStringList.create;
   result:= False;

   try
      if selected<>Nil then begin
         for i:= 0 to selected.count-1 do begin
            strBreakApart(selected[i], #9, parts);
            if uppercase(parts[0])=uppercase(FieldName) then begin
               index:= i;
               result:= True;
               exit;
            end;
         end
      end
   finally
      parts.Free;
   end;
end;

Function wwAdjustPixels(PixelSize,PixelsPerInch : integer): integer;
var temp: longint;
begin
   temp:= LongInt(PixelSize) * LongInt(PixelsPerInch);
   result := temp div 96;
end;

Procedure wwSetOnFilterEnabled(dataset: TDataset; val: boolean);
var PropInfo: PPropInfo;
    tempOptions: TwwOnFilterOptions;
    SetValue: Longint;
begin
   tempOptions:= wwGetOnFilterOptions(dataset);
   if val then tempOptions:= tempOptions + [ofoEnabled]
   else tempOptions:= tempOptions - [ofoEnabled];

   PropInfo:= Typinfo.GetPropInfo(DataSet.ClassInfo,'OnFilterOptions');
   if PropInfo<>Nil then begin
      SetValue:= LongInt(PChar(@tempOptions)^);
      SetOrdProp(dataset, PropInfo, SetValue);
   end;

{   if dataSet is TwwTable then TwwTable(dataSet).OnFilterOptions:= tempOptions{
{   else if dataSet is TwwQuery then TwwQuery(dataSet).OnFilterOptions:= tempOptions;
   else if dataSet is TwwQBE then TwwQBE(dataSet).OnFilterOptions:= tempOptions;
   else if dataSet is TwwStoredProc then TwwStoredProc(dataSet).OnFilterOptions:= tempOptions;
}
end;

Function wwGetOnFilterOptions(dataset: TDataset): TwwOnFilterOptions;
var PropInfo: PPropInfo;
    f: TwwOnFilterOptions;
begin
   Result:= [];

   PropInfo:= Typinfo.GetPropInfo(DataSet.ClassInfo,'OnFilterOptions');
   if PropInfo<>Nil then begin
      PChar(@F)^:= Char(GetOrdProp(dataset, PropInfo));
      result:= f;
   end
   else begin
      if DataSet.Filtered then Result:= [ofoEnabled];
   end;

{   if wwIsClass(dataset.classType, 'TwwClientDataSet') then
   begin
      if DataSet.Filtered then Result:= [ofoEnabled];
   end else begin
      PropInfo:= Typinfo.GetPropInfo(DataSet.ClassInfo,'OnFilterOptions');
      if PropInfo<>Nil then PChar(@F)^:= Char(GetOrdProp(dataset, PropInfo));
      result:= f;
   end
}   
end;

Function wwProcessEscapeFilterEvent(dataset: TDataset): boolean;
var msg: TMsg;
begin
   result:= false;
   if PeekMessage(msg, 0, WM_KEYFIRST, WM_KEYLAST, PM_REMOVE) then
   begin
      if (Msg.Message=WM_KEYDOWN) and (Msg.wparam=VK_ESCAPE) then
      begin
         wwSetOnFilterEnabled(dataset, False);
         result:= true;
      end
   end;
end;

{4/10/97 - Define wwmin, wwmax}
Function wwmax(x,y: integer): integer;
begin
  if x>y then result:= x else result:= y;
end;

Function wwmin(x,y: integer): integer;
begin
  if x<y then result:= x else result:= y;
end;


{Function wwGetControlDataSource(ctrl: TWinControl): TDataSource;
var PropInfo: PPropInfo;
begin
   Result:= Nil;
   if Ctrl.InheritsFrom(TCustomEdit) then
   begin
      PropInfo:= Typinfo.GetPropInfo(ctrl.ClassInfo,'DataSource');
      if PropInfo<>Nil then begin
         result:= TDataSource(GetOrdProp(ctrl, PropInfo));
      end
   end;
end;
}

function wwDataSetCompareBookmarks(DataSet: TDataSet; Bookmark1, Bookmark2: TBookmark): CmpBkmkRslt;
begin
   {$ifdef wwDelphi3Up}
   result:= (DataSet as TDataSet).CompareBookmarks(bookmark1, bookmark2);
   {$else}
   with (DataSet as TDBDataSet) do begin
     if Handle <> nil then
        Check(DbiCompareBookmarks(Handle, Bookmark1, Bookmark2, Result));
   end;
   {$endif}
end;

{ Return true if class is derived from 'Name' }
{ This code is more code efficient than InheritsFrom or 'Is'
  as it does not require that the compiler link in the class }
function wwIsClass(ClassType: TClass; const Name: string): Boolean;
begin
  Result := True;
  while ClassType <> nil do
  begin
{    if ClassType.ClassNameIs(Name) then Exit;}
    if wwEqualStr(ClassType.ClassName, Name) then Exit;
    ClassType := ClassType.ClassParent;
  end;
  Result := False;
end;

function wwGetWorkingRect:TRect;
begin
{$ifdef Win32}
   SystemParametersInfo(SPI_GETWORKAREA,0,Pointer(@Result),0);
{$else}
   Result.Left := 0;
   Result.Top := 0;
   Result.Right := Screen.Width;
   Result.Bottom := Screen.Height;
{$endif}
end;

Function wwApplyPictureMask(Control: TCustomEdit; PictureMask: string; AutoFill: boolean; var Key: Char): boolean;
var s: string;
    pict: TwwPictureValidator;
    res: TwwPicResult;
    padlength, OldSelStart, Oldlen, OldSelLen: integer;

   Function NewText: string;
   var curStr : string;
   begin
      with Control do begin
         curStr:= Text;
         result:= copy(curStr, 1, selStart+1-1) +
                  char(Key) + copy(curStr, selStart + 1 + length(SelText), 32767);
      end
   end;

begin
    result:= false;
    if not (Key in [#32..#254]) then exit;
    if Control.selStart<(length(Control.Text)-Control.selLength) then exit;

    pict:= TwwPictureValidator.create(PictureMask, AutoFill);
    s:= NewText;
    res:= Pict.picture(s, AutoFill);
    result:= True;

    oldSelStart:= Control.SelStart;
    oldLen:= length(Control.Text);
    oldSelLen:= Control.SelLength;

    case res of
       prError:
          with Control do begin
             if (selStart + length(selText) >= length(Text)) then
             begin
                MessageBeep(0);
             end
          end;

       prIncomplete: begin
            with Control do begin
               padLength := length(s) - length(text);
               text:= s;
               if (oldSelLen=oldLen) then selStart:= length(s)
               else if (oldSelLen>0) then selStart:= OldSelStart + 1
               else selStart:= OldSelStart + padLength;
               result:= True;
            end;
         end;

       prComplete: begin
           with Control do begin
               text:= s;
               if (oldSelLen=oldLen) then selStart:= length(s)
               else if (length(s)>oldlen) then
                  selStart:= oldSelStart + (length(s)-oldlen)
               else selStart:= oldSelStart + 1;
               selLength:= 0;
               result:= True;
           end
        end;

    end;

    Pict.Free;
    key:= #0;
end;

Function wwValidPictureValue(Control: TCustomEdit; PictureMask: string): boolean;
var pict: TwwPictureValidator;
    s: string;
begin
   s:= Control.text;
   if s='' then result:= True
   else if PictureMask='' then result:= True
   else begin
      pict:= TwwPictureValidator.create(PictureMask, False);
      result:= Pict.picture(s, False)=prComplete;
      pict.Free;
   end;
end;


Function wwSetControlDataSource(ctrl: TWinControl; ds: TDataSource): boolean;
var PropInfo: PPropInfo;
begin
   result:= False;
   if Ctrl.InheritsFrom(TWinControl) then
   begin
      PropInfo:= Typinfo.GetPropINfo(ctrl.ClassInfo,'DataSource');
      if (PropInfo <> nil) and (PropInfo^.Proptype^.Kind = tkClass) then
      begin
         SetOrdProp(Ctrl,PropInfo,LongInt(ds));
         result:= True;
      end
   end;
end;

Function wwSetControlDataField(ctrl: TWinControl; df: string): boolean;
var PropInfo: PPropInfo;
begin
   Result:= False;
   if Ctrl.InheritsFrom(TWinControl) then { 6/12/98 - Changed to TWinControl }
   begin
      PropInfo:= Typinfo.GetPropINfo(ctrl.ClassInfo,'DataField');
      {$IFDEF WIN32}
      if (PropInfo<>nil) and (PropInfo^.Proptype^.Kind = tklString) then begin
      {$ELSE}
      if (PropInfo<>nil) and (PropInfo^.PropType^.Kind = tkString) then begin
      {$ENDIF}
         SetStrProp(Ctrl,PropInfo,df);
         result:= True;
      end
   end;
end;

Function wwGetControlDataField(ctrl: TWinControl): string;
var PropInfo: PPropInfo;
begin
   Result:= '';
   if Ctrl.InheritsFrom(TWinControl) then
   begin
      PropInfo:= Typinfo.GetPropInfo(ctrl.ClassInfo,'DataField');
      if PropInfo<>Nil then
         result:= GetStrProp(ctrl, PropInfo);
   end;
end;

Function wwGetControlDataSource(ctrl: TComponent): TDataSource;
var PropInfo: PPropInfo;
begin
   Result:= Nil;
   PropInfo:= Typinfo.GetPropInfo(ctrl.ClassInfo,'DataSource');
   if PropInfo<>Nil then begin
      result:= TDataSource(GetOrdProp(ctrl, PropInfo));
   end
end;

Function wwGetControlMasterSource(ctrl: TComponent): TDataSource;
var PropInfo: PPropInfo;
begin
   Result:= Nil;
   PropInfo:= Typinfo.GetPropInfo(ctrl.ClassInfo,'MasterSource');
   if PropInfo<>Nil then begin
      result:= TDataSource(GetOrdProp(ctrl, PropInfo));
   end
end;


Function wwSetRequestLive(ctrl: TDataset; val: boolean): boolean;
var PropInfo: PPropInfo;
begin
   Result:= False;
   PropInfo:= Typinfo.GetPropINfo(ctrl.ClassInfo,'RequestLive');
   if (PropInfo<>Nil) then begin
      SetOrdProp(Ctrl, PropInfo, ord(val));
      result:= True;
   end
end;

Function wwSetReadOnly(ctrl: TWinControl; val: boolean): boolean;
var PropInfo: PPropInfo;
begin
   Result:= False;
   PropInfo:= Typinfo.GetPropInfo(ctrl.ClassInfo,'ReadOnly');
   if (PropInfo<>Nil) then begin
      SetOrdProp(Ctrl, PropInfo, ord(val));
      result:= True;
   end
end;

Function wwSetBorder(ctrl: TControl; val: boolean): boolean;
var PropInfo: PPropInfo;
    intval: integer;
begin
   Result:= False;
   PropInfo:= Typinfo.GetPropInfo(ctrl.ClassInfo, 'BorderStyle');
   if (PropInfo<>Nil) then begin
      if val then intval:= ord(bsSingle)
      else intval:= ord(bsNone);
      SetOrdProp(Ctrl, PropInfo, intval);
      result:= True;
   end
end;

Function wwSetParamCheck(ctrl: TDataset; val: boolean): boolean;
var PropInfo: PPropInfo;
begin
   Result:= False;
   PropInfo:= Typinfo.GetPropInfo(ctrl.ClassInfo,'ParamCheck');
   if (PropInfo<>Nil) then begin
      SetOrdProp(Ctrl, PropInfo, ord(val));
      result:= True;
   end
end;

Function wwGetParamCheck(ctrl: TDataset): boolean;
var PropInfo: PPropInfo;
begin
   Result:= False;
   PropInfo:= Typinfo.GetPropInfo(ctrl.ClassInfo,'ParamCheck');
   if PropInfo<>Nil then result:= Boolean(GetOrdProp(Ctrl, PropInfo));
end;

Function wwSetConnectionString(ctrl: TDataset; df: string): boolean;
var PropInfo: PPropInfo;
begin
   Result:= False;
   PropInfo:= Typinfo.GetPropINfo(ctrl.ClassInfo,'ConnectionString');
   if (PropInfo<>nil) {and (PropInfo^.Proptype^.Kind = tklString) }then begin
      SetStrProp(Ctrl,PropInfo,df);
      result:= True;
   end
end;

Function wwSetDatabaseName(ctrl: TDataset; df: string): boolean;
var PropInfo: PPropInfo;
begin
   Result:= False;
   PropInfo:= Typinfo.GetPropINfo(ctrl.ClassInfo,'DatabaseName');
   {$IFDEF WIN32}
   if (PropInfo<>nil) and (PropInfo^.Proptype^.Kind = tklString) then begin
   {$ELSE}
   if (PropInfo<>nil) and (PropInfo^.PropType^.Kind = tkString) then begin
   {$ENDIF}
      SetStrProp(Ctrl,PropInfo,df);
      result:= True;
   end
end;

Function wwGetSessionName(dataSet: TDataSet): String;
var PropInfo: PPropInfo;
begin
   Result:= '';
   PropInfo:= Typinfo.GetPropInfo(DataSet.ClassInfo, 'SessionName');
   if PropInfo<>Nil then
      result:= GetStrProp(DataSet, PropInfo);
end;

Function wwGetControlPictureMask(ctrl: TCustomEdit): String;
var PropInfo: PPropInfo;
begin
   Result:= '';
   PropInfo:= Typinfo.GetPropInfo(Ctrl.ClassInfo, 'PictureMask');
   if PropInfo<>Nil then result:= GetStrProp(Ctrl, PropInfo);
end;

Procedure wwSetControlPictureMask(ctrl: TCustomEdit; PictureMask: string);
var PropInfo: PPropInfo;
begin
   PropInfo:= Typinfo.GetPropINfo(ctrl.ClassInfo,'PictureMask');
   {$IFDEF WIN32}
   if (PropInfo<>nil) and (PropInfo^.Proptype^.Kind = tklString) then begin
   {$ELSE}
   if (PropInfo<>nil) and (PropInfo^.PropType^.Kind = tkString) then begin
   {$ENDIF}
      SetStrProp(Ctrl,PropInfo, PictureMask);
   end
end;

Function wwGetControlAutoFill(ctrl: TCustomEdit): boolean;
var PropInfo: PPropInfo;
begin
   Result:= False;
   PropInfo:= Typinfo.GetPropInfo(Ctrl.ClassInfo, 'PictureMaskAutoFill');
   if PropInfo<>Nil then result:= Boolean(GetOrdProp(Ctrl, PropInfo));
end;

Procedure wwSetControlAutoFill(ctrl: TCustomEdit; AutoFill: boolean);
var PropInfo: PPropInfo;
begin
   PropInfo:= Typinfo.GetPropInfo(ctrl.ClassInfo,'PictureMaskAutoFill');
   if PropInfo<>Nil then
   begin
      SetOrdProp(Ctrl, PropInfo, Ord(AutoFill));
   end;
end;


Function wwGetSQLWord(s: string; var APos: integer): string;
var i: integer;

   Function max(x,y: integer): integer;
   begin
     if x>y then result:= x
     else result:= y;
   end;

begin
   result:= '';
   if APos<=0 then exit;
   if APos>length(s) then exit;

   i:= APos;
   while (i<=length(s)) and ((s[i]=' ') or (s[i]=#9)) do inc(i); { skip leading whitespace}
   APos:= i; { Skip leading blanks/tabs }
   if i>length(s) then exit { 10/6/98 - Avoid range check error}
   else if s[i]='"' then begin
      inc(i);
      while (i<=length(s)) and (s[i]<>'"') do inc(i);
      if s[i]='"' then begin
         result:= copy(s, APos, i+1-APos);
         APos:= i+1;
      end
   end
   else if s[i]='''' then begin
      inc(i);
      while (i<=length(s)) and (s[i]<>'''') do inc(i);
      if s[i]='''' then begin
         result:= copy(s, APos, i+1-APos);
         APos:= i+1;
      end
   end
   else begin     {1/18/97 - Added $ to list of valid characters for current word}
      while (i<=length(s)) and (s[i] in ['A'..'Z','0'..'9','.','_','$']) do inc(i);
      result:= copy(s, APos, max(i-APos, 1));

      if length(result)>1 then APos:= i
      else APos:= i+1;
   end;
end;

Function wwSetSQLProp(ctrl: TDataset; sql: TStrings): boolean;
var PropInfo: PPropInfo;
    tempList: TStringList;
begin
   result:= False;
   tempList:= TStringlist.create;
   tempList.assign(sql);

   PropInfo:= Typinfo.GetPropInfo(ctrl.ClassInfo,'SQL');
   if (PropInfo <> nil) and (PropInfo^.Proptype^.Kind = tkClass) then
   begin
      SetOrdProp(Ctrl,PropInfo,LongInt(tempList));
      result:= True;
   end;
   tempList.Free;
end;


Function wwSetParamsProp(ctrl: TDataset; Params: TParams): boolean;
var PropInfo: PPropInfo;
begin
   result:= False;
   PropInfo:= Typinfo.GetPropInfo(ctrl.ClassInfo,'Params');
   if (PropInfo <> nil) and (PropInfo^.Proptype^.Kind = tkClass) then
   begin
      wwGetParamsProp(ctrl).Assign(Params);
      result:= True;
   end;
end;

Function wwGetParamsProp(ctrl: TDataset): TParams;
var PropInfo: PPropInfo;
begin
   result:= nil;
   PropInfo:= Typinfo.GetPropINfo(ctrl.ClassInfo,'Params');
   if (PropInfo <> nil) and (PropInfo^.Proptype^.Kind = tkClass) then
      result:= TParams(GetOrdProp(Ctrl,PropInfo));
end;

{3/31/98 - Determine if this is a single line edit control based on passed in rectangle}
{ 9/13/98 - Changed handle to HDC }
Function wwIsSingleLineEdit(AHandle:HDC; Rect: TRect; Flags:Integer): boolean;
var OrigEditHeight,SingleLineEditHeight:Integer;
    S:String;
begin
  Flags := Flags or DT_CALCRECT;

  OrigEditHeight := Rect.Bottom-Rect.Top;

  S:=' ';
  SingleLineEditHeight := DrawText(AHandle,PChar(S),strlen(PChar(S)),Rect,Flags)+
    3 + GetSystemMetrics(SM_CYBORDER) * 2;

  result := OrigEditHeight <= SingleLineEditHeight;
end;

 { 11/3/97 - Used by callback filtering routines }
 function wwCallbackMemoRead(DataSet: TBDEDataSet;
                   FFilterBuffer: Pointer;
                   var Buffer;
                   curField: TField;
                   Count: Longint): Longint;
 var
   Status: DBIResult;
   N: Longint;
   L: Longint;
   P: Pointer;
   FPosition : LongInt;
 begin
    Check(DbiOpenBlob(Dataset.Handle, FFilterBuffer, curField.FieldNo, dbiReadOnly));

    Result := 0;

    P := @Buffer;
    FPosition:= 0;

    while Count > 0 do
    begin
      if Count > wwFilterMemoSize then N:= wwFilterMemoSize
      else N:= Count;
      Status := DbiGetBlob(Dataset.Handle, PChar(FFilterBuffer), curField.FieldNo, FPosition,
        N, P, L);
      case Status of
        DBIERR_NONE, DBIERR_ENDOFBLOB:
          begin
            if (curField is TMemoField) and (curfield as TMemoField).Transliterate then
              NativeToAnsiBuf(Dataset.Locale, P, P, L);
//            Inc(FPosition, L);
            Inc(Result, L);
            break;
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
    PChar(P)[Result]:= #0;
    DbiFreeBlob(Dataset.Handle, FFilterBuffer, curField.FieldNo);
 end;

function wwIsRichEditField(Field: TField; ExamineData: boolean): boolean;
var i: integer;
    controlType: TStrings;
  BlobStream: TStream;
  Buffer: packed array[1..5] of char;
begin
   result:= False;
   if (Field = nil) then exit;
   if not (Field is TBlobField) then exit;

   controlType:= wwGetControlType(Field.Dataset);
   if ControlType<>nil then for i:= 0 to ControlType.count-1 do begin { Delphi 5}
      if pos(Field.FieldName + ';RichEdit', ControlType[i])=1 then
      begin
         result:= True;
         exit;
      end
   end;

   if not ExamineData then exit;

   BlobStream := Field.DataSet.CreateBlobStream(Field, bmRead);
   try
     Buffer:= '     ';
     BlobStream.Read(Buffer, 5);
     result:= Buffer = '{\rtf'
   finally
     BlobStream.Free;
   end;

end;


procedure RichEditTextToPlainText(
      Owner: TWinControl;
      MemoBuffer: PChar;
      var numRead: Cardinal;
      var RichEditControl: TRichEdit;
      var MemoryStream: TMemoryStream);
var tempRichEdit: TRichEdit;
begin
    if MemoryStream=Nil then memoryStream:= TMemoryStream.create
    else begin
       memoryStream.position:= 0;
       memoryStream.size:= 0;
       memoryStream.write(memoBuffer^, numRead);
    end;

    if RichEditControl=Nil then begin
       tempRichEdit:= TRichEdit.create(Owner);
       tempRichEdit.visible:= False;
       tempRichEdit.parent:= Owner;
    end
    else TempRichEdit:= RichEditControl;

    with TempRichEdit do begin
       (tempRichEdit as TRichEdit).plainText:= false;
       memoryStream.position:= 0;
       Lines.LoadFromStream(memoryStream);
    end;
    strcopy(MemoBuffer, PChar(tempRichEdit.text));
end;
{
procedure wwGetInterface(AObject: TObject; IID: TGUID; out Obj);
var
  InterfaceEntry: PInterfaceEntry;
begin
  InterfaceEntry := AObject.GetInterfaceEntry(IID);
  if InterfaceEntry <> nil then
    Pointer(Obj) := Pointer(Integer(AObject) + InterfaceEntry^.IOffset)
  else
    Pointer(Obj) := nil;
end;
}
procedure wwDrawFocusRect(ACanvas: TCanvas; ARect: TRect);
var OldBrushStyle: TBrushStyle;
    OldPenColor: TColor;
begin
  OldBrushStyle := ACanvas.Brush.Style;  // Added so DrawFocusRect wouldn't have funny colors in it.  Initializes the background. -ksw (7/8/98)
  OldPenColor := ACanvas.Pen.Color;
  ACanvas.Brush.Style := bsClear;
  ACanvas.Pen.Color := clHighlight;
  ACanvas.Rectangle(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom);
  SetTextColor(ACanvas.Handle, ColorToRGB(clHighlight));
  ACanvas.Brush.Style := OldBrushStyle;
  ACanvas.Pen.Color := OldPenColor;
  WinProcs.DrawFocusRect(ACanvas.Handle, ARect);
end;

{ 8/25/98 - Return true if vcldb40 is Delphi 4 Patch 2 or later }
{$ifdef wwDelphi4Up}
function UpdatedVCL4Version: boolean;
var dummy: DWORD;
    verInfoSize, verValueSize: DWORD;
    verInfo: Pointer;
    verValue: PVSFixedFileInfo;
    V3,V4: WORD;
begin
   verInfoSize:= GetFileVersionInfoSize('vcldb40.bpl', Dummy);
   if VerInfoSize = 0 then
   begin
      Dummy:= GetLastError;
      result:= True;
      exit;
   end;

   GetMem(VerInfo, VerInfoSize);
   GetFileVersionInfo('vcldb40.bpl', 0, VerInfoSize, VerInfo);
   VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
   with VerValue^ do begin
      V3:= dwFileVersionLS shr 16;
      V4:= dwFileVersionLS and $FFFF
   end;
   result:= (v3>=5) and (v4>=104);
   FreeMem(VerInfo, VerInfoSize);

end;
{$endif}

function wwIsCustomEditCell(
        Component: TComponent;
        ownerForm: TComponent;
        curField: TField;
        var customEdit: TCustomEdit) : boolean;
var i: integer;
    parts : TStrings;
    controlType: TStrings;
begin
   result:= False;
   if ownerForm=nil then exit;
   if curField=nil then exit;

   parts:= TStringList.create;

   controlType:= nil; { 6/22/99 - ADO datasets store in component, not dataset }
   if wwGetControlInfoInDataSet(Component) then
      controlType:= wwGetControlType(curfield.dataset);
   if controlType=nil then
      controlType:= wwGetControlType(Component);

   for i:= 0 to controlType.count-1 do begin
      strBreakapart(controlType[i], ';', parts);
      if parts.count<2 then continue;
      if not wwEqualStr(parts[0], curField.FieldName) then continue;
      if isWWEditControl(parts[1]) or (parts[1]='RichEdit') then begin
         component:= OwnerForm.FindComponent(parts[2]);
         if (component<>Nil) and (component is TCustomEdit) then
         begin
            customEdit:= TCustomEdit(component);
            if customEdit=Nil then break;
            result:= True;
         end;
         break;
      end
   end;

   parts.free;
end;

function IsInGrid(dtp:TWinControl):boolean;
begin
  result := False;
  if wwisClass(dtp.Parent.classType, 'TCustomGrid') then
     result := True;
end;

function IsInwwObjectViewPaint(control: TWinControl):boolean;
begin
  result := False;
  if wwisClass(control.Parent.classType, 'TwwDataInspector') then
     if csPaintCopy in control.ControlState then
        result := True;
end;

function IsInwwObjectView(control: TWinControl):boolean;
begin
  result := False;
  if wwisClass(control.Parent.classType, 'TwwDataInspector') then
     result := True;
end;

procedure wwDottedLine(Canvas: TCanvas; p1, p2: TPoint);
var i: integer;
    x, y: integer;
    tot: integer;
begin
  Canvas.Refresh;
  x := p1.x;
  y := p1.y;
  tot := wwMax(Abs(p2.y - p1.y), Abs(p2.x - p1.x));
  for i := 0 to tot do if i mod 2 = 0 then
  begin
    Canvas.Polyline([Point(x,y), Point(x+1,y+1)]);
    inc(x, (p2.x - p1.x) div wwMax(1, (tot div 2)));
    inc(y, (p2.y - p1.y) div wwMax(1, (tot div 2)));
  end;
end;

procedure wwSetTableIndex(
   DataSet: TDataSet; FieldName: string);
var indexDef: TIndexDef;
    Table: TTable;
begin
   Table:= DataSet as TTable;
   Table.IndexDefs.Update;
   indexDef:=
      Table.IndexDefs.GetIndexForFields(FieldName, False);
   if indexDef=nil then
      indexDef:=
         Table.IndexDefs.GetIndexForFields(FieldName, True);
   if indexdef<>nil then Table.IndexName:=  indexDef.Name;
end;

Procedure wwWriteTextLinesT(ACanvas: TCanvas;
    const ARect: TRect; DX, DY: Integer; S: PChar; Alignment: TAlignment;
    WriteOptions: TwwWriteTextOptions);
const
  AlignFlags : array [TAlignment] of Integer =
    ( DT_LEFT or DT_EXPANDTABS or DT_NOPREFIX,
      DT_RIGHT or DT_EXPANDTABS or DT_NOPREFIX,
      DT_CENTER or DT_EXPANDTABS or DT_NOPREFIX );
var
  B, R: TRect;
  Flags: integer;
  ADrawCanvas: TCanvas;
//  tempRect: TRect;
begin
    ADrawCanvas:= ACanvas;

    with ARect do { Use offscreen bitmap to eliminate flicker and }
    begin                     { brush origin tics in painting / scrolling.    }
      if Alignment=taRightJustify then
         R := Rect(DX, DY, Right - Left -2, Bottom - Top - 1) { 7/10/98 - Make width 1 less }
      else if Alignment=taLeftJustify then
         R := Rect(DX, DY, Right - Left, Bottom - Top - 1)
      else  {3/31/98 - If CenterJustify then allow DrawText to properly center text}
      begin
         if DX>3 then
            R := Rect(2, DY, Right - Left, Bottom - Top - 1)
         else
            R := Rect(0, DY, Right - Left, Bottom - Top - 1)
      end;
      R.Left:= R.Left + ARect.Left;
      R.Right:= R.Right + ARect.Left;
      R.Top:= R.Top + ARect.Top;
      R.Bottom:= R.Bottom + ARect.Top;
      B := Rect(0, 0, Right - Left, Bottom - Top);
    end;
    with ADrawCanvas do
    begin
      Font := ACanvas.Font;
      Font.Color := ACanvas.Font.Color;
      Brush := ACanvas.Brush;
      Brush.Style := bsSolid;

      if not (wtoTransparent in WriteOptions) then
      begin
         FillRect(ARect);
      end;

      SetBkMode(Handle, TRANSPARENT);
      Flags:= AlignFlags[Alignment];
      if wtoAmpersandToUnderline in WriteOptions then
         Flags:= Flags and (not  DT_NOPREFIX);

      if wtoWordWrap in WriteOptions then
         Flags := Flags or DT_WORDBREAK;

      {3/31/98 - Check to see if this is a single line edit control to
       determine if we should or should not have word breaks}
      if wwIsSingleLineEdit(Handle,R,Flags) or (wtoEllipsis in WriteOptions) then
          Flags := Flags and not DT_WORDBREAK;

      if wtoEllipsis in WriteOptions then
      begin
         Flags:= Flags or DT_END_ELLIPSIS;  { If text does not fit then put ellipsis at end }
         DrawText(Handle, S, StrLen(S), R, Flags);
      end
      else begin
         DrawText(Handle, S, StrLen(S), R, Flags);
      end
    end;
end;

function wwRectWidth(Rect: TRect): Integer;
begin
  result := Rect.Right - Rect.Left;
end;

function wwRectHeight(Rect: TRect): Integer;
begin
  result := Rect.Bottom - Rect.Top;
end;
{
procedure wwAdjustHeight(Control: TWinControl);
var
  DC: HDC;
  SaveFont: HFont;
  I: Integer;
  SysMetrics, Metrics: TTextMetric;
begin
  DC := GetDC(0);
  GetTextMetrics(DC, SysMetrics);
  SaveFont := SelectObject(DC, TEdit(Control).Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  if NewStyleControls then
  begin
    if TEdit(Control).Ctl3D then I := 8 else I := 6;
    I := GetSystemMetrics(SM_CYBORDER) * I;
    if TEdit(Control).BorderStyle=bsNone  then i:= 6;
  end else
  begin
    I := SysMetrics.tmHeight;
    if I > Metrics.tmHeight then I := Metrics.tmHeight;
    I := I div 4 + GetSystemMetrics(SM_CYBORDER) * 4;
  end;
  Control.Height := Metrics.tmHeight + I;
end;

}

{ Parent clipping is required in order to ensure that the background is painted in all cases }
{ For instance, flat transparent buttons do not paint in certain cases if clipchildren is true }
procedure wwDisableParentClipping(Parent: TWinControl);
begin
   SetWindowLong(Parent.Handle, GWL_STYLE,
    GetWindowLong(Parent.Handle, GWL_STYLE) and not WS_CLIPCHILDREN);
end;

function wwIsDesigning(control: TControl): boolean;
var form: TCustomForm;
begin
   form:= GetParentForm(control);
   if form<>nil then
      result:= (csDesigning in form.ComponentState)
   else
      result:=  (csDesigning in control.ComponentState)
end;

end.
