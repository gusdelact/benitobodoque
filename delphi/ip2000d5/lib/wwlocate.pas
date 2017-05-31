unit Wwlocate;
{
//
// Component : TwwLocateDialog
//
// Non-indexed searching
//
// Copyright (c) 1995, 1996, 1997, 1998 by Woll2Woll Software
//
// 11/06/1997 - Changed UpperCase to AnsiUpperCase and OEMTOANSI to Dataset.Translate
//              to handle international character support.
//
// 11/10/97 - Do not call dbiGetNextRecord for memo field
// 12/12/97 - Changed MemoMatch to use String instead of BlobStream technique.
// 1/7/98 - Ensure non-null value when comparing floating field value from table
//
// 4/20/98 - Test eof after calling dataset.Next
//}

interface

{$i wwIfDef.pas}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, db, ExtCtrls,
  dbtables, dbctrls, {Wwdbcomb, }wwstr, wwDialog;

type

  TwwLocateMatchType = (mtExactMatch,  mtPartialMatchStart, mtPartialMatchAny);
  TwwFieldSortType = (fsSortByFieldNo, fsSortByFieldName);
  TwwDefaultButtonType = (dbFindFirst, dbFindNext);
  TwwFieldSelection = (fsAllFields, fsVisibleFields);
  TwwLocateDlg = class;
  TwwOnInitLocateDlgEvent = procedure(Dialog : TwwLocateDlg) of object;

  TwwLocateDlg = class(TForm)
    SearchTypeGroup: TGroupBox;
    FieldsGroup: TGroupBox;
    CaseSensitiveCheckBox: TCheckBox;
    ExactMatchBtn: TRadioButton;
    PartialMatchStartBtn: TRadioButton;
    PartialMatchAnyBtn: TRadioButton;
    Panel1: TPanel;
    FieldValueGroup: TGroupBox;
    SearchValue: TEdit;
    FirstButton: TButton;
    NextButton: TButton;
    FieldNameComboBox: TComboBox;
    procedure FindFirst(Sender: TObject);
    procedure FindNextBtnClick(Sender: TObject);
    procedure BitBtn1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FieldNameComboBoxChange(Sender: TObject);
    procedure FieldNameComboBoxEnter(Sender: TObject);
    procedure FieldNameComboBoxExit(Sender: TObject);
    procedure FieldNameComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);

  private
    Function GetFieldNameFromTitle(fieldTitle: string): string;
    procedure ApplyIntl;

  public
    DataSet: TDataSet;
    CancelBtn: TButton;
    DlgComponent: TComponent;
    Function FindMatch(FromBeginning: boolean): boolean;
    constructor Create(AOwner: TComponent); override;
  end;

TwwLocateDialog = class(TwwCustomDialog)
  private
     FCaption: String;
     FDataField: String;
     FDataLink: TDataLink;
     FFieldValue: string;
     FMatchType: TwwLocatematchType;
     FCaseSensitive: boolean;
     FSortFields: TwwFieldSortType;
     FDefaultButton: TwwDefaultButtonType;
     FFieldSelection: TwwFieldSelection;
     FShowMessages: boolean;
     FOnInitDialog: TwwOnInitLocateDlgEvent;

     procedure SetDataSource(value : TDataSource);
     Function GetDataSource: TDataSource;

  protected
     procedure DoInitDialog; virtual;  { called by locate dialog form }
  public
     Form: TwwLocateDlg;  {Used by TwwLocateDlg }
     Patch: Variant;

     function GetPrimaryDataSet: TDataSet; override;

     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;

     function Execute: boolean; override;  { shows dialog }
     function FindPrior: boolean;
     function FindNext: boolean;
     function FindFirst: boolean;
     property FieldValue: string read FFieldValue write FFieldValue;

  published
     property Caption: string read FCaption write FCaption;
     property DataSource: TDataSource read GetDataSource write SetDataSource;
     property SearchField: String read FDataField write FDataField;
     property MatchType: TwwLocateMatchType read FMatchType write FMatchType;
     property CaseSensitive: boolean read FCaseSensitive write FCaseSensitive;
     property SortFields: TwwFieldSortType read FSortFields write FSortFields;
     property DefaultButton: TwwDefaultButtonType read FDefaultButton write FDefaultButton;
     property FieldSelection: TwwFieldSelection read FFieldSelection write FFieldSelection;
     property ShowMessages: boolean read FShowMessages write FShowMessages;
     property OnInitDialog: TwwOnInitLocateDlgEvent read FOnInitDialog write FOnInitDialog;
 end;

Function wwFindMatch(FromBeginning: boolean;
	       DataSet: TDataSet;
	       searchField: string;
	       searchValue: string;
	       matchType: TwwLocateMatchType;
	       caseSens: boolean): boolean;

var
  wwLocateDlg: TwwLocateDlg;

implementation

uses wwCommon, wwSystem, wwintl, wwtable,
(*
{$ifdef DELPHI3_CS}
wwclient,
{$endif}
*)

{$ifdef win32}
comctrls, bde;
{$else}
dbiprocs, dbierrs, dbitypes;
{$endif}

{$R *.DFM}

Function Match(val1: string; val2: string;
	       matchType: TwwLocateMatchType;
	       caseSens: boolean): boolean;
var matchPos: integer;
begin
   if not caseSens then val1:= AnsiUppercase(val1); {11/06/1997 - Changed to AnsiUppercase}

   if MatchType = mtExactMatch then begin
      if length(val1)<>length(val2) then result:= False
      else begin
	 if length(val1)=0 then result:= True
	 else begin
	    matchPos:= Pos(val2, val1);
	    result:= (matchPos=1);
	 end
      end
   end else if matchType = mtPartialMatchStart then
   begin
      matchPos:= Pos(val2, val1);
      result:= (matchPos=1);
   end
   else if MatchType = mtPartialMatchAny then
   begin
      matchPos:= Pos(val2, val1);
      result:= (matchPos<>0);
   end
   else result:= False;

end;

{ 12/12/97 - Changed MemoMatch to use String instead of BlobStream technique.}
{$ifdef wwDelphi3Up}
Function MemoMatch(field : TField;
	       memoBuffer: PChar; val1 :Pchar;
	       matchType: TwwLocateMatchType;
	       caseSens: boolean;
               RichEditControl: TRichEdit): boolean;
var matchPos: Integer;
    s: string;
begin
{   result:= False;}

   if RichEditControl<>Nil then
   begin
      RichEditControl.PlainText:= False;
      RichEditControl.Lines.Assign(Field);
      RichEditControl.PlainText:= True;
      s:= RichEditControl.Text;
   end
   else s:= field.asstring;

   if not caseSens then s := AnsiUpperCase(s);

   if MatchType = mtExactMatch then begin
      {$WARNINGS OFF}
      if strlen(val1)<>length(s) then result:= False
      {$WARNINGS ON}
      else begin
         matchPos:= AnsiPos(StrPas(val1),s);
         result:= (matchPos=1);
      end
   end
   else if matchType = mtPartialMatchStart then begin
       matchPos:= AnsiPos(StrPas(val1),s);
       result:= (matchPos=1);
   end
   else if MatchType = mtPartialMatchAny then begin
       matchPos:= AnsiPos(StrPas(val1),s);
       result:= (matchPos<>0);
   end
   else result:= False;
end;

{$else}
Function MemoMatch(field : TField;
	       memoBuffer: PChar; val1 :Pchar;
	       matchType: TwwLocateMatchType;
	       caseSens: boolean): boolean;
var matchPtr: PChar;
    numread: integer;
    blobStream: TBlobStream;
begin
   result:= False;
   blobStream:= Nil;
   try
      blobStream:= TBlobStream.create(TBlobField(field), bmRead);
      if blobStream=Nil then begin
	 MessageDlg('Fail to create blob', mtinformation, [mbok], 0);
	 exit;
      end;

      numread:= blobStream.read(memobuffer^, 32767);
      memobuffer[numread]:= #0; { null-terminate }

      if numread = 0 then strcopy(memobuffer, '');

      if not caseSens then
        StrUpper(memobuffer);

      if MatchType = mtExactMatch then begin
	 if strlen(val1)<>numread then result:= False
	else begin
	    matchPtr:= strPos(memobuffer, val1);
	    if matchPtr<>Nil then
	       result:= (matchPtr=memoBuffer);
	 end
      end else if matchType = mtPartialMatchStart then
      begin
	 matchPtr:= strPos(memobuffer, val1);
	 if matchPtr<>Nil then
	    result:= (matchPtr=memoBuffer);
      end
      else if MatchType = mtPartialMatchAny then
      begin
	 matchPtr:= strPos(memobuffer, val1);
	 result:= (matchPtr<>Nil);
      end
      else result:= False;
   finally
       blobStream.free;
   end;
end;

{$endif}

Function ValueAsString(field : TField; buffer: PChar) : string;
type
   WordPtr =^Word;
   IntegerPtr = ^Integer;
   LongPtr =^LongInt;
   FloatPtr = ^Double;

   TDateTimeRec = record
     case TFieldType of
       ftDate: (Date: Longint);
       ftTime: (Time: Longint);
       ftDateTime: (DateTime: TDateTime);
   end;
   DateTimePtr = ^TDateTimeRec;

var
   DateTimeData: TDateTimeRec;
   floatValue: Double;

{$ifdef win32}
    TimeStamp: TTimeStamp;
{$endif}

{$ifndef wwDelphi3Up}
    Len:Integer;
{$endif}

begin
   result:= '';

   case field.DataType of
      ftString:
	 begin
	    if (field is TStringField) then
	       if TStringField(field).transliterate then
               begin
                  { 11/06/1997 - Added international character support.}
                  {$ifdef wwDelphi3Up}
                     Field.DataSet.Translate(Buffer,Buffer,False);
                  {$else}
                  Len := Strlen(Buffer);
                  NativeToAnsiBuf(Field.Dataset.Locale,Buffer,Buffer,Len);
                  {$endif}
               end;
	    result:= strPas(buffer);
	 end;

      ftSmallInt, ftWord: result:= inttostr(WordPtr(buffer)^);

      ftInteger: result:= inttostr(LongPtr(buffer)^);

      {$ifdef win32}
      ftAutoInc: result:= inttostr(LongPtr(buffer)^);  { 12/2/96 - Support autoincrement field }
      {$endif}

      ftFloat, ftBCD, ftCurrency:
	 begin
	    floatValue:= FloatPtr(buffer)^;
	    result:= floattostr(floatValue);
	 end;

      ftBoolean: begin
		     if buffer[0]<>char(0) then result:= 'True'
		     else result:= 'False';
		 end;

      ftDateTime:  begin
	    DateTimeData:= DateTimePtr(buffer)^;
	    {$ifdef win32}
            result := DateToStr(TimeStampToDateTime(MSecsToTimeStamp(FloatPtr(Buffer)^))); {12/10/96 }
	    {$else}
	    result:= DateToStr(DateTimeData.DateTime/MSecsPerDay);
	    {$endif}
	 end;

      ftDate :  begin
	    DateTimeData:= DateTimePtr(buffer)^;
	    {$ifdef win32}
	    TimeStamp.Time:= 0;
	    TimeStamp.Date:= DateTimeData.Date;
	    result:= DateToStr(TimeStampToDateTime(TimeStamp));
	    {$else}
	    result:= DateToStr(DateTimeData.Date);
	    {$endif}
	 end;

      ftTime :  begin
	    DateTimeData:= DateTimePtr(buffer)^;
	    result:= TimeToStr(DateTimeData.Time/MSecsPerDay);
	 end;

      else;
   end
end;


Function wwFindMatch(FromBeginning: boolean;
	       DataSet: TDataSet;
	       searchField: string;
	       searchValue: string;
	       matchType: TwwLocateMatchType;
	       caseSens: boolean): boolean;
var FindText, TableFieldValue: string;
    fieldNo: integer;
    MatchFound: boolean;
    cfindText, recBuffer, buffer, memobuffer: PChar;
    isBlank: Bool;
    Bookmark: TBookmark;
    fldtype: TFieldType;
    curfield: TField;
    currentValue: string;
    stopOnMismatch: boolean;
    firstIndexField: TField;
    IndexFieldCount: integer;
    TempRichEdit: TRichEdit;

  Function IndexCaseSensitive(Tbl: TDataSet): boolean;
  var i: integer;
  begin
     result:= False;
     if Tbl is TTable then with Tbl as TTable do begin
        for i:= 0 to IndexDefs.count-1 do begin      {11/06/1997-Changed to AnsiUpperCase}
           if (AnsiUppercase(IndexDefs.Items[i].Name)=AnsiUppercase(IndexName)) then begin
    	      result:= not (ixCaseInsensitive in IndexDefs.Items[i].Options);
              break;
           end
        end
     end
  end;

   { Make sure indexed field is in field map}
   Function ValidIndexField: boolean;
   var parts: TStrings;
       i: integer;
   begin
      result:= False;
      parts:= TStringList.create;

      with (DataSet as TTable) do for i:= 0 to IndexDefs.count-1 do begin
	 with IndexDefs do begin
	     if (AnsiUppercase(IndexName)=AnsiUppercase(Items[i].name)) then {Changed to AnsiUpperCase}
	     begin
		strBreakApart(Items[i].fields, ';', parts);
		if parts.count<=0 then continue;
		result:= FindField(parts[0])<>Nil;
		break;
	     end
	 end
      end;

      parts.Free;
   end;

   procedure ApplyMatch;
   begin
      dataset.updatecursorpos;  {4/14/97}
      dataset.resync([rmExact,rmCenter]); { Always call resync }
      MatchFound := True;
   end;

   Function FloatingType(field: TField): boolean;
   begin
      result:= field.DataType in [ftFloat, ftBCD, ftCurrency];
   end;

   Function GetNextFieldValue(Forward: boolean; var FieldValue: string): boolean;
   begin
      FieldValue:= '';

      if wwisNonBDEField(curField) then begin
	 Result:= not DataSet.eof;
	 if Result then begin
	    Dataset.Next;
	    FieldValue:= curField.asString;
	 end
      end
      else begin
	 result:= dbiGetNextRecord((Dataset as TDBDataSet).handle, dbiNoLock, buffer, nil)=0;
	 if result then begin
	    dbiGetField((DataSet as TDBDataSet).handle, FieldNo+1, buffer, recBuffer, isBlank);
            if isBlank then FieldValue:= ''  { 4/29/97 - Delphi 1 bug with null fields requires this }
            else FieldValue:= ValueAsString(curField, recBuffer); {5/24/95}
	 end
      end
   end;



begin
   Result:= False;
   DataSet.checkBrowseMode;

   curField:= DataSet.findField(searchField);
   if curField=Nil then begin
      MessageDlg('Field ' + searchField + ' not found.', mtWarning, [mbok], 0);
      exit;
   end;

   FieldNo:= curField.FieldNo - 1;

   if wwMemAvail(32767) then begin
      MessageDlg('Out of memory', mtWarning, [mbok], 0);
      exit;
   end;

   DataSet.updateCursorPos;

   if not caseSens then FindText:= AnsiUppercase(SearchValue) {11/06/1997 - Changed to AnsiUpperCase}
   else FindText:= SearchValue;

   stopOnMismatch:= False;


   if (dataSet is TTable)
      and (curField.dataType<>ftMemo) and (not wwIsTableQuery(DataSet)) then
   begin
      (dataset as TTable).IndexDefs.update;
      IndexFieldCount:= (dataSet as TTable).indexFieldCount;
      if IndexFieldCount>0 then FirstIndexField:= (dataSet as TTable).indexfields[0]
      else FirstIndexField:= nil;

      if not caseSens then currentValue:= AnsiUppercase(curField.asString) {11/06/1997- Changed to AnsiUpperCase}
      else currentValue:= curField.asString;;

      if (indexFieldCount>0) and (matchType=mtExactMatch) and
	 validIndexField and
	 (Uppercase(curField.fieldName) = Uppercase(FirstIndexField.fieldName)) and
	 ((currentValue<>FindText) or FromBeginning) and (curField.dataType<>ftBoolean) then
      begin
	 if (curField.DataType <> ftString) or {case sensitive matches index }
	    (IndexCaseSensitive(dataSet) = caseSens) then
	 begin
            if (dataSet is TTable) then
               result:= (dataSet as TTable).findKey([FindText]);
	    exit;
	 end
      end;

      { Partial match start using index}
      if (indexFieldCount>0) and (matchType=mtPartialMatchStart) and
	 validIndexField and
	 (Uppercase(curField.fieldName) = Uppercase(FirstIndexField.fieldName)) and
	 (curField.dataType=ftString) then
      begin
	 if (IndexCaseSensitive(dataSet) = caseSens) then
	 begin
	    stopOnMismatch:= True;

	    if ((not Match(FirstIndexField.asString, FindText, matchType, caseSens)) or
		fromBeginning) then
	    begin

	       if not FromBeginning then begin
		 if not caseSens then begin
		    if (FindText<Ansiuppercase(FirstIndexField.asString)) then exit;  {Not found} {11/07/1997 - Changed to AnsiUpperCase}
		 end
		 else begin
		    if (FindText<FirstIndexField.asString) then exit;  {Not found}
		 end
	       end;

               if (dataSet is TTable) then
                  (dataSet as TTAble).findNearest([FindText]);
	       result:= Match(FirstIndexField.asString, FindText, matchType, caseSens);
	       exit;
	    end
	 end
      end
   end;

   buffer:= Nil;
   recBuffer:= Nil;
   cfindText:= Nil;
   memoBuffer:= Nil;
   bookmark:= nil;
   tempRichEdit:= nil;

   try
      fldType:= curField.DataType;

      GetMem(buffer, 32767);
      GetMem(recBuffer, 256);
      Bookmark:= Dataset.GetBookmark;
      if FromBeginning then begin
	 DataSet.First; { do before allocating blob }
	 DataSet.updateCursorPos;
      end;

      if fldType = ftMemo then begin
	 GetMem(memoBuffer, 32767);
	 GetMem(cFindText, 256);
	 strpcopy(cfindText, FindText);
	 if not caseSens then
      {$ifdef wwDelphi3Up}
           AnsiStrUpper(cfindText); {11/06/1997 - Changed to AnsiStrUpper}
      {$else}
           StrUpper(cfindText);
      {$endif}
         if wwIsRichEditField(curField, True) then begin
            tempRichEdit:= TRichEdit.create(Screen.ActiveForm);
            tempRichEdit.visible:= False;
            tempRichEdit.parent:= Screen.ActiveForm;
         end
      end;

      Screen.cursor:= crHourGlass;

      if FromBeginning then begin
	 if fldType <> ftMemo then begin
	    if (matchType = mtExactMatch) and FloatingType(curField) and (FindText<>'') then begin
	       if wwStrToFloat(FindText) and (curField.asFloat=StrToFloat(FindText)) then
	       begin
		  ApplyMatch;
		  exit;
	       end
	    end
	    else if Match(curField.asString, FindText, matchType, caseSens) then
	    begin
	       ApplyMatch;
	       exit;
	    end
	 end
	 else begin
	    if MemoMatch(curField, memoBuffer, CFindText, matchType, caseSens, TempRichEdit) then
	    begin
	       ApplyMatch;
               exit;
            end
	 end;
	 DataSet.updateCursorPos;

      end;

      MatchFound:= False;
      if fldType <> ftMemo then begin
	 if wwisNonBDEField(curField) then Dataset.DisableControls;

	 while GetNextFieldValue(True, TableFieldValue) do
	 begin
	    if (matchType = mtExactMatch) and FloatingType(curField) and (FindText<>'') then begin
	       if wwStrToFloat(FindText) and (TableFieldValue<>'') and {1/7/98 - Ensure non-null value }
                 (StrToFloat(TableFieldValue)=StrToFloat(FindText)) then
	       begin
		  ApplyMatch;
		  exit;
	       end
	    end
	    else if Match(TableFieldValue, FindText, matchType, caseSens) then
	    begin
	       ApplyMatch;
	       break;
	    end
	    else if StopOnMismatch then break;
	 end
      end
      else begin
	 Dataset.DisableControls;
         while True do
         begin
            { 11/10/97 - Do not call dbiGetNextRecord for memo field }
            if DataSet.eof then break;
            DataSet.Next;
            if DataSet.eof then break;  { 4/20/98 - Test eof after calling Next }

            if MemoMatch(curField, memoBuffer, CFindText, matchType, caseSens, TempRichEdit) then
	    begin
               ApplyMatch;
               break;
            end
	 end;
	 Dataset.EnableControls;
      end;

   finally
      if wwisNonBDEField(curField) then Dataset.EnableControls;

      FreeMem(recBuffer, 256);
      FreeMem(buffer, 32767);
      if curField.dataType = ftMemo then begin
	 FreeMem(cFindText, 256);
	 FreeMem(memoBuffer, 32767);
      end;
      Screen.cursor:= crDefault;
      if (not MatchFound) then dataSet.gotoBookmark(bookmark);
      dataSet.FreeBookmark(bookmark);
      tempRichEdit.Free;

      result:= MatchFound;
   end;
end;

constructor TwwLocateDlg.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   CancelBtn:= TButton(wwCreateCommonButton(Self, bkCancel));
   CancelBtn.TabOrder := 5;
   CancelBtn.Width:= (screen.pixelsperinch * 72) div 96;
   CancelBtn.visible:= True;
   CancelBtn.Top:= NextButton.Top;
   CancelBtn.Left:= FieldsGroup.Left + FieldsGroup.Width - CancelBtn.Width - 1;
   CancelBtn.Height:= (screen.pixelsperinch * 27) div 96;
end;

Function TwwLocateDlg.GetFieldNameFromTitle(fieldTitle: string): string;
var i: integer;
begin
   result:= '';

   with DataSet do begin
      { Give priority to non-calculated fields of the same name, if they exist }
      for i:= 0 to fieldCount-1 do begin
	 if wwisNonPhysicalField(fields[i]) then continue;
	 if strReplaceChar(fields[i].displayLabel,'~',' ')=strReplaceChar(fieldTitle,'~',' ') then begin
	    result:= fields[i].FieldName;
	    exit;
	 end
      end;

      for i:= 0 to fieldCount-1 do begin
	 if not wwisNonPhysicalField(fields[i]) then continue;
	 if strReplaceChar(fields[i].displayLabel,'~', ' ')=strReplaceChar(fieldTitle,'~', ' ') then begin
	    result:= fields[i].FieldName;
	    exit;
	 end
      end
   end;
end;

Function TwwLocateDlg.FindMatch(FromBeginning: boolean): boolean;
var
   MatchType: TwwLocateMatchType;
   curFieldName: string;
begin
   result:= false;
   if ExactMatchBtn.Checked then
      MatchType:= mtExactmatch
   else if PartialMatchStartBtn.Checked then
      MatchType:= mtPartialMatchStart
   else MatchType:= mtPartialMatchAny;

   curFieldName:= getfieldNameFromTitle(FieldNameComboBox.text);
   if curFieldName='' then exit;

   result:= wwFindMatch(FromBeginning, DataSet, curFieldName,
	searchValue.text, matchType, CaseSensitiveCheckbox.State<> cbUnchecked);
end;

procedure TwwLocateDlg.FindFirst(Sender: TObject);
begin
   if not FindMatch(True) then begin
      MessageDlg(wwInternational.UserMessages.LocateNoMatches,
	 mtInformation, [mbok], 0);
   end
   else ModalResult:= mrOK;
end;

procedure TwwLocateDlg.FindNextBtnClick(Sender: TObject);
begin
   if not FindMatch(False) then begin
      MessageDlg(wwInternational.UserMessages.LocateNoMoreMatches,
	   mtInformation, [mbok], 0);
   end
   else ModalResult:= mrOK;
end;


procedure TwwLocateDlg.BitBtn1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key = VK_ESCAPE) then
      ModalResult := mrCancel;
end;

function TwwLocateDialog.Execute: boolean;
var
   field: TField;
   i: integer;
begin
   result:= True;
   with TwwLocateDlg.create(Application) do
   try
      if (DataSource=Nil) or (DataSource.dataSet=Nil) or
	 (not DataSource.dataSet.active) then begin
	 MessageDlg('DataSource does not reference an active DataSet', mtError, [mbok], 0);
	 exit;
      end;
      DlgComponent:= Self;
      field:= DataSource.DataSet.findField(SearchField);
      FieldNameComboBox.items.clear;
      if SortFields = fsSortByFieldNo then
	 FieldNameComboBox.sorted:= False;

      if DefaultButton = dbFindFirst then begin
	 FirstButton.Default:= True;
	 NextButton.Default:= False;
      end
      else begin
	 FirstButton.Default:= False;
	 NextButton.Default:= True;
      end;

      with DataSource.DataSet do begin
	 for i:= 0 to fieldCount-1 do begin
{            if not fields[i].calculated then begin}
	       if (fields[i].dataType = ftBlob) or (fields[i].dataType=ftGraphic) or
		  (fields[i].dataType = ftVarBytes) or (fields[i].dataType=ftBytes) then
		  continue;
	       if (FFieldSelection = fsAllFields) or (fields[i].visible) then
		  FieldNameComboBox.items.add(strReplaceChar(fields[i].DisplayLabel, '~',' '));
{            end}
	 end
      end;
      if field<>Nil then begin
	 SearchValue.Text:= fieldValue;
	 FieldNameCombobox.itemIndex:=
	    FieldNameComboBox.items.indexOf(strReplaceChar(Field.displayLabel, '~',' '));
      end
      else SearchValue.text:= '';

      DataSet:= dataSource.DataSet;
      caseSensitiveCheckBox.checked:= caseSensitive;
      case matchType of
	 mtExactMatch: ExactMatchBtn.checked:= True;
	 mtPartialMatchStart: PartialMatchStartBtn.checked:= True;
	 mtPartialMatchAny: PartialMatchAnyBtn.checked:= True;
      end;

      Caption:=  self.Caption;
      Result := ShowModal = IDOK;

      { Use user selections from dialog to update this component }
      if ExactMatchBtn.Checked then
	 MatchType:= mtExactmatch
      else if PartialMatchStartBtn.Checked then
	 MatchType:= mtPartialMatchStart
      else MatchType:= mtPartialMatchAny;
      caseSensitive:= caseSensitiveCheckBox.checked;
      fieldValue:= SearchValue.Text;
      SearchField:= getfieldNameFromTitle(FieldNameComboBox.text);

   finally
      Free;
   end

end;

constructor TwwLocateDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MatchType:= mtPartialMatchStart;
  caseSensitive:= False;
  SortFields:= fsSortByFieldName;
  Caption:=  'Locate Field Value';
  FDefaultButton:= dbFindNext;
  FFieldSelection:= fsAllFields;
  FDataLink:= TDataLink.create;
  FShowMessages:= True;

end;

destructor TwwLocatedialog.Destroy;
begin
  FDataLink.free;
  inherited destroy;
end;

procedure TwwLocateDialog.SetDataSource(value : TDataSource);
begin
   FDataLink.dataSource:= value;
end;

Function TwwLocateDialog.getDataSource: TDataSource;
begin
   Result:= FdataLink.dataSource;
end;

function TwwLocateDialog.FindPrior: boolean;
begin
   result:= False;
end;

function TwwLocateDialog.FindFirst: boolean;
begin
   result:= False;
   if (dataSource=Nil) or (datasource.dataset=Nil) or (not datasource.dataset.active) then
   begin
      MessageDlg('DataSource does not refer to an active table!', mtWarning, [mbok], 0);
      exit;
   end;
   if FieldValue='' then begin
      DefaultButton:= dbFindFirst;
      result:= execute;
   end
   else begin
      result:= wwFindMatch(True, DataSource.DataSet, SearchField, FieldValue,
	matchType, caseSensitive);
      if (not result) and FShowMessages then
	 MessageDlg(wwInternational.UserMessages.LocateNoMoreMatches,
	   mtInformation, [mbok], 0);
   end
end;

function TwwLocateDialog.FindNext: boolean;
begin
   result:= False;
   if (dataSource=Nil) or (datasource.dataset=Nil) or (not datasource.dataset.active) then
   begin
      MessageDlg('DataSource does not refer to an active table!', mtWarning, [mbok], 0);
      exit;
   end;
   if FieldValue='' then begin
      DefaultButton:= dbFindNext;
      result:= execute;
   end
   else begin
      result:= wwFindMatch(False, DataSource.DataSet, SearchField, FieldValue,
	 matchType, caseSensitive);
      if (not result) and FShowMessages then
	 MessageDlg(wwInternational.UserMessages.LocateNoMoreMatches,
	   mtInformation, [mbok], 0);
   end

end;

procedure TwwLocateDlg.FieldNameComboBoxChange(Sender: TObject);
begin
   SearchValue.Text:= '';
   if not FieldNameComboBox.DroppedDown then SearchValue.setFocus;
end;

procedure TwwLocateDlg.FieldNameComboBoxEnter(Sender: TObject);
begin
   NextButton.default:= False;
end;

procedure TwwLocateDlg.FieldNameComboBoxExit(Sender: TObject);
begin
   NextButton.default:= True;
end;

procedure TwwLocateDlg.FieldNameComboBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Key=VK_Return) and FieldNameComboBox.DroppedDown then
   begin
      FieldNameComboBox.DroppedDown := False;
      SearchValue.setFocus;
   end
end;

procedure TwwLocateDlg.FormShow(Sender: TObject);
var Dlg: TwwLocateDialog;
begin
   ApplyIntl;
   Dlg:= DlgComponent as TwwLocateDialog;
   Dlg.Form:= self;
   Dlg.DoInitDialog;
end;

Procedure TwwLocateDialog.DoInitDialog;
begin
  if Assigned(FOnInitDialog) then OnInitDialog(Form);
end;

procedure TwwLocateDlg.ApplyIntl;
begin
   Font.Style:= wwInternational.DialogFontStyle;
   with wwInternational.LocateDialog do begin
      FieldValueGroup.caption:= FieldValueLabel;
      SearchTypeGroup.caption:= SearchTypeLabel;
      CaseSensitiveCheckbox.caption:= CaseSensitiveLabel;
      ExactMatchBtn.caption:= MatchExactLabel;
      PartialMatchStartBtn.caption:= MatchStartLabel;
      PartialMatchAnyBtn.caption:= MatchAnyLabel;
      FieldsGroup.caption:= FieldsLabel;
      FirstButton.caption:= BtnFirst;
      NextButton.caption:= BtnNext;
      CancelBtn.caption:= BtnCancel;
      SearchValue.Hint:= FieldValueHint;
      CaseSensitiveCheckbox.Hint:= CaseSensitiveHint;
      ExactMatchBtn.Hint:= MatchExactHint;
      PartialMatchStartBtn.Hint:= MatchStartHint;
      PartialMatchAnyBtn.Hint:= MatchAnyHint;
      FirstButton.Hint:= BtnFirstHint;
      NextButton.Hint:= BtnNextHint;
      FieldNameComboBox.Hint:= FieldNameHint;
   end;
end;

function TwwLocateDialog.GetPrimaryDataSet: TDataSet;
begin
  result := nil;
  if DataSource <> nil then
    result := DataSource.DataSet;
end;

end.
