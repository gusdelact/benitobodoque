{
//
// Components : TwwDBDateTimePicker
//
// Copyright (c) 1998 by Woll2Woll Software
// 7/29/98 pw Modified to allow Deletion of Time for CFormat Date Time fields
// 7/29/98 pw Added a check to clear the date if user hits delete on a date token.
//
// 8/14/98 Fixes for range-checking reported runtime errors
// 8/24/98 - Support Delphi 4 ActionLists
// 8/24/98 - Remove check for uppercase as it prevents Alt- F4 from closing form
// 8/24/98 - Ignore Alt key sequences
// 8/24/98 - Respect DataSource AutoEdit Flag
// 8/26/98 - Support initialization of date after clearing with time not cleared
// 8/31/98 - Fix bug where leading zero months are not allowed.
// 8/31/98 - Fix mouse cursor bug when clicking on TComboBox
// 9/10/98 - Handled min/max date bugs and added beeps on invalid values.  PYW
//           Made some changes to handle Range Checking.
// 9/10/98 - Check Owner<>Nil in CMFontChanged
// 9/10/98 - Check for clearing of max date when mindate <> 0
// 9/29/98 - Fix bug when entering month and daysthismonth is not checked
// 10/6/98 - Support bidemode
// 10/22/98 - Handled Editing bug when dataset cancels or inserts.
// 10/29/98 - Drop-down would close in grid when encountering pageup, pagedown, vk_left
//            when using dgAlwaysShowEditor
// 10/29/98 - Text should be blank if datasource is not enabled
// 11/4/98 -  Reset modified in when entering unbound combo
// 11/5/98 -  Check if text is still blank
// 11/15/98 - Calling closeup immediately would cause problems from hook
// 11/15/98 - Add finally block in case of exception for method CloseUp
// 11/29/98 - Add check to handle 00 for month and days.
// 11/29/98 - Make sure Ctl3d is set to True to handle case when parent form's ctl3d is set to False.
// 12/1/98 - If this is a time only field then don't dropdown
// 12/1/98 - Turned off RangeChecking Compiler Switch because of operations on words.
// 12/2/98 - Added call to isDateTimeSeparator to correctly determine if a date or
//           time separator character was pressed.  TimeSeparator autoadvance case was
//           not working properly.
// 12/6/98 - Allow displayformat of days before month such as dd/mm/yyyy to allow
//           entering more days than current month.  By allowing, the month is changed
//           to be a month matching day range.
// 12/7/98 - Allow 3 to go to inplaceedit on months < 30
// 12/14/98 - Need to use the assign method when setting the font.
// 12/15/98 - Immediately update DateTime value after entering 1 or 2
//            digit year in KeyDown method.
// 12/16/98 - ShowCaret if null data (Code added to DataChange event and escape
//            processing).
// 12/17/98 - Don't auto fill time if digit encountered
// 12/17/98 - Prevent OnValidate from firing twice when datetimepicker is
//            in grid, and an exception occurs.
// 12/18/98 - Don't auto-fill minutes and seconds when entering hours.
// 1/8/98 - Added check to disable deleting while in digit edit mode.
// 1/8/98 - Handle Wrapping of day to max day of current month.
// 1/12/99 - Don't allow FDateTime to be beyond range
// 1/19/99 - Update FDateTime whenver in InPlaceEdit mode
// 1/21/99 - Fix bug introduced in 4.02F where leading zero generates exception
// 1/25/99 - Prevent grid's OnKeyDown from firing twice when encounter tab or cr
// 2/3/99  PYW   Use AnsiPos instead of Pos.  Otherwise, won't find 'M' correctly
// 3/3/99 - Day before month format did not allow entry if month format string was in
//          uppercase
// 3/8/99 - Allow Febrary 29th smooth data entry.  Previously required year be entered
//          before day if it was February 29th.
// 3/27/99 - If developer indirectly causes control to exit upon dropping down,
//           then FCalendar is nil.  Exit control in this case as it doesn't have
//           the focus
// 6/25/99 - Reset position on delete.  PYW
// 6/29/99 - Select all when closing up
// 7/31/99 - RSW - Fix bug where 00 cannot be entered into year if MinDate is greater than 1900
}
unit wwdbdatetimepicker;
interface

{$i wwIfDef.pas}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask,wwmonthcalendar, commctrl, comctrls,db,
  dbtables,dbCtrls,buttons,wwintl, wwsystem, wwcommon, grids, wwtypes,
  wwframe;

type
  TwwDTCalAlignment = (wwdtaLeft, wwdtaRight, wwdtaCenter);
  TwwDTEditDataType = (wwDTEdtDateTime, wwDTEdtDate, wwDTEdtTime);
  TwwDTOption = (wwDTOAutoAdvance);
  TwwDTOptions = set of TwwDTOption;
  TwwDTInterval = class(TPersistent)
  private
     FMinutesInterval: integer;
     FRoundMinutes: boolean;
  public
    constructor Create;
  published
     property MinutesInterval: integer read FMinutesInterval write FMinutesInterval default 1;
     property RoundMinutes: boolean read FRoundMinutes write FRoundMinutes;
  end;

  TwwDBDateTimePicker = class;

  TwwPopupCalendar = class(TwwMonthCalendar)
  private
    FCombo: TwwDBDateTimePicker;
  protected
    procedure CreateWnd; override;
    procedure CreateParams(var Params: TCreateParams); override;
//    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure Change; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure GetFocus; override;
  public
    constructor Create(AOwner: TComponent); Override;
  end;

//  TwwDTMonthOption = mdoDayState..mdoMultiSelect;
//  TwwDTMonthOptions = set of TwwDTMonthOption;

  TwwCalendarOptions = class(TPersistent)
  private
     FAlignment: TwwDTCalAlignment;
     FColors:TwwDateTimeColors;
     FFont:TFont;
     FWidth:Integer;
     FHeight:Integer;
     FOptions: TwwMonthOptions;
     FPopupYearOptions:TwwPopupYearOptions;
     FFirstDayOfWeek: TwwCalDayOfWeek;
     procedure SetPopupYearOptions(Value: TwwPopupYearOptions);
     function GetHeight: Integer;
     procedure SetHeight(Value: Integer);
     function GetWidth: Integer;
     procedure SetWidth(Value: Integer);
     function GetFont: TFont;
     procedure SetFont(Value: TFont);
     procedure SetAlignment(Value: TwwDTCalAlignment);
     procedure SetColors(Value: TwwDateTimeColors);
     procedure SetFirstDayOfWeek(Value: TwwCalDayOfWeek);
  protected
     procedure SetOptions(Value: TwwMonthOptions);
  public
     constructor Create(AOwner: TComponent);
     destructor Destroy; override;
     property Width: Integer read GetWidth write SetWidth;
     property Height: Integer read GetHeight write SetHeight;
  published
     property Alignment: TwwDTCalAlignment read FAlignment write SetAlignment Default wwdtaLeft;
     property Colors: TwwDateTimeColors read FColors write SetColors;
     property Font: TFont read GetFont write SetFont;
     property Options : TwwMonthOptions read FOptions write SetOptions default [mdoDayState];
     property PopupYearOptions : TwwPopupYearOptions read FPopupYearOptions write SetPopupYearOptions;
     property FirstDayOfWeek: TwwCalDayOfWeek read FFirstDayOfWeek write SetFirstDayOfWeek
        default wwdowLocaleDefault;
  end;

  TwwDBCustomDateTimePicker = class(TCustomEdit)
  private
    { Private declarations }
    FAlignment: TAlignment;

    FCalendar: TwwPopupCalendar;
    FCalendarOptions : TwwCalendarOptions;
    FOnCalcBoldDay: TCalcBoldDayEvent;

    FDateFormat:TDTDateFormat;
    FMaxDate: TDate;
    FMinDate: TDate;

    FInCloseUp: Boolean;
    FOnCloseUp: TNotifyEvent;
    FOnDropDown: TNotifyEvent;
    FOldDateTime : TDateTime;
    FDateTime : TDateTime;

    FDataLink: TFieldDataLink;

    FButton: TSpeedButton;
    FBtnControl:TWincontrol;
    FCanvas: TControlCanvas;
    FFocused: Boolean;
    FPos:Integer;
    FUnboundDataType:TwwDTEditDataType;
    FDisplayFormat: string;
    FInDigitEdit: Boolean;
    FIsCleared: Boolean;
    FTextMargin:Integer;
    FInfoPower: boolean;
    FEpoch:Integer;
    FOptions: TwwDTOptions;

    SkipDrawSetFocus: boolean;
    DateTimeBeforeDropDown: TDateTime;
    SkipEscapeReset: boolean;  { When closing up do not restore original value, but pre-dropped value }
    FShowButton:Boolean;
    FFrame: TwwEditFrame;
    FButtonEffects: TwwButtonEffects;
    FInterval: TwwDTInterval;
    FButtonStyle: TwwComboButtonStyle;
    FButtonGlyph: TBitmap;
    FButtonWidth: integer;

//    FFlatButton: boolean;
//    FFlatButtonTransparent: boolean;
//    FTransparent: boolean;
//    FCreateTransparent: boolean;

//    procedure SetTransparent(val: boolean);
    skipUpdate: boolean;
    FMouseInButtonControl: boolean;
    function GetDate: TDate;
    function GetTime: TTime;
    procedure SetDate(Value: TDate);
    procedure SetTime(Value: TTime);
    procedure SetDateTime(Value: TDateTime);
    function GetField: TField;
    function GetDataField: string;
    procedure SetDataField(const Value: string);
    function GetDataSource: TDataSource;
    procedure SetDataSource(Value: TDataSource);
    procedure SetUnboundDataType(const Value: TwwDTEditDataType);

    procedure DataChange(Sender: TObject);
    procedure UpdateData(Sender: TObject);
    {$ifndef wwDelphi4Up}
    procedure WndProc(var Message: TMessage); override;
    {$endif}
    procedure SetMaxDate(Value: TDate);
    procedure SetMinDate(Value: TDate);
    procedure SetDateFormat(Value: TDTDateFormat);
    procedure SetEpoch(Value: Integer);

    Procedure UpdateButtonPosition;
    procedure CMCancelMode(var Message: TCMCancelMode); message CM_CancelMode;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    procedure CNKeyDown(var Message: TWMKeyDown); message CN_KEYDOWN; {handle tab}
    procedure WMCut(var Message: TMessage); message WM_CUT;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure WMKillFocus(var Message: TMessage); message WM_KillFocus;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBkgnd;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
//    procedure NonEditMouseDown(var Message: TWMLButtonDown);
    procedure SetFocused(Value: Boolean);

              {DateTime Format TokenHandling Routines}
    function  GetDatetimeToken(datetime1:TDateTime;index:integer;
              var pos,len:integer;var s:string):string;
    procedure GetCompleteToken(val:char;formatstr:string;
              var s:string;var pos:integer);
    function  GetFormatStr:string;
    function  isDateField:boolean;
    function  IsDateOnlyField:boolean;
    function  isTimeOnlyField:boolean;
    function  isDateTimeField:boolean;
    function  isAMPM(str:string):boolean;
    procedure InDigitEditUpdateRecord;
    function IscFormat:boolean;
    function TimeShowing:boolean;
    function GetMaxVisibleToken:Integer;
    function isvalid2year(newnum:integer):boolean;
    procedure ReEncodeDateTime(y,m,d,h,n,sec,msec:word);
    Function GetValidMaxDate:TDate;
    Function GetValidMinDate:TDate;
    function GetReadOnly: Boolean;
    procedure SetReadOnly(Value: Boolean);
    procedure SetDisplayFormat(value: string);
    procedure SetButtonGlyph(Value: TBitmap);
    procedure SetButtonStyle(val: TwwComboButtonStyle);
    Procedure SetButtonWidth(val: integer);
    function GetButtonWidth: integer;

  protected
      { Protected declarations }
//    procedure AdjustHeight;
    procedure GlyphChanged(Sender: TObject); virtual;
    function IsCustom: Boolean; virtual;
    Procedure DrawButton(Canvas: TCanvas; R: TRect; State: TButtonState;
       ControlState: TControlState; var DefaultPaint: boolean); virtual;
    procedure Loaded; override;
    procedure CloseUp(Accept: Boolean); virtual;
    Function IsDroppedDown: boolean; virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Change; override; { RSW}

    procedure EnableEdit; dynamic;
    procedure HandleDropDownKeys(var Key: Word; Shift: TShiftState);
    procedure Notification(AComponent: TComponent;
        Operation: TOperation); override;
    procedure BtnClick(sender:tobject);
    procedure BtnMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    function EditCanModify: Boolean; virtual;
    Procedure SetModified(val: boolean);
    procedure SetShowButton(sel: boolean); virtual;
    Function GetClientEditRect: TRect; virtual;
    procedure SetEditRect; virtual;
    procedure WMSize(var msg:twmsize); message wm_size;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    Function Editable: boolean; virtual;
    Procedure ShowText(ACanvas: TCanvas;
          ARect: TRect; indentLeft, indentTop: integer; AText: string);
    Function GetIconIndent: integer; dynamic;
    Function GetIconLeft: integer; dynamic;
    procedure HighlightToken(mDateTime:TDateTime);
    procedure CreateParams(var Params: TCreateParams); override;
    Procedure DoExit; override;
    procedure Reset;
    Function CanEdit:boolean;
    function GetEffectiveDisplayFormat(ExpandNativeFormat: boolean): string;
    procedure GetFirstLastDayOfWeek(var first:integer;var last:integer);
    function GetMaxTokens(formatstr:string):integer;
    Function GetDateTimeStoredText(ADateTime:TDateTime):string;
    Function GetDateTimeDisplayText(ADateTime:TDateTime):string;
    function DateTokenInString(formatStr:string):boolean;
    function TimeTokenInString(formatStr:string):boolean;
    Function LoadComboGlyph: HBitmap; virtual;
//    procedure GetEditRectForFrame(var Loc: TRect); virtual;
    procedure DrawFrame(Canvas: TCanvas); virtual;
    function Is3DBorder: boolean;
    procedure CreateWnd; override;
    {$ifdef wwDelphi4Up}
    procedure WndProc(var Message: TMessage); override;
    {$endif}
    procedure InvalidateTransparentButton;
  public
    { Public declarations }
    Patch: Variant;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    {$ifdef wwdelphi4up}
    function ExecuteAction(Action: TBasicAction): Boolean; override; { 8/24/98 }
    function UpdateAction(Action: TBasicAction): Boolean; override; {8/24/98}
    {$endif}
    procedure Invalidate; override;  {NEW PW}
    procedure DropDown; virtual;
    procedure UpdateRecord;
    procedure RefreshText;
    procedure ClearDateTime;
    function isTransparentEffective: boolean;

    property Calendar: TwwPopupCalendar read FCalendar;
    property DroppedDown: boolean read IsDroppedDown;
    property Field: TField read GetField;
    property Frame: TwwEditFrame read FFrame write FFrame;
    property ShowButton: boolean read FShowButton write SetShowButton;// default True;
    property Button: TSpeedButton read FButton;
    property DateTime: TDateTime read FDateTime write SetDateTime;
    property Options: TwwDTOptions read FOptions write FOptions default [wwDTOAutoAdvance];
    property Interval: TwwDTInterval read FInterval write FInterval;

    property CalendarAttributes: TwwCalendarOptions read FCalendarOptions write FCalendarOptions;
    property DataField: string read GetDataField write SetDataField;
    property DateFormat: TDTDateFormat read FDateFormat write SetDateFormat default dfShort;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property Date: TDate read GetDate write SetDate;
    property Epoch: Integer read FEpoch write SetEpoch;
    property Time: TTime read GetTime write SetTime;
    property MaxDate: TDate read FMaxDate write SetMaxDate;
    property MinDate: TDate read FMinDate write SetMinDate;
    property UnboundDataType: TwwDTEditDataType read FUnboundDataType write SetUnboundDataType default wwDTEdtDateTime;
    property DisplayFormat: string read FDisplayFormat write SetDisplayFormat;
    property OnCalcBoldDay: TCalcBoldDayEvent read FOnCalcBoldDay write FOnCalcBoldDay;
    property OnCloseUp: TNotifyEvent read FOnCloseUp write FOnCloseUp;
    property OnDropDown: TNotifyEvent read FOnDropDown write FOnDropDown;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property InfoPower: Boolean read FInfoPower;
    property ButtonStyle: TwwComboButtonStyle read FButtonStyle write SetButtonStyle;
    property ButtonEffects: TwwButtonEffects read FButtonEffects write FButtonEffects;
    property ButtonGlyph: TBitmap read FButtonGlyph write SetButtonGlyph stored IsCustom;
    property ButtonWidth: integer read GetButtonWidth write SetButtonWidth default 0;

//    property ButtonFlat : boolean read GetFlatButton write SetFlatButton default False;
//    property ButtonTransparent: boolean read FFlatButtonTransparent write SetFlatButtonTransparent default False;
    
//    property Transparent: boolean read FTransparent write SetTransparent;

    property AutoSize;
    property BorderStyle;
    property Color;
    property Enabled;
    property Font;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property Visible;
 end;

 TwwDBDateTimePicker = class(TwwDBCustomDateTimePicker)
 published
    {$ifdef wwDelphi4Up}
    property Anchors;
    property BiDiMode;  { 2/18/99 - Case sensitive name for Builder 4 }
    {$endif}
    property AutoSize;
    property BorderStyle;
    property CalendarAttributes;
    property Color;
    {$ifdef wwDelphi4Up}
    property Constraints;
    {$endif}
    property ButtonStyle default cbsDownArrow;
    property DataField;
    property DateFormat;
    property DataSource;
    property Date;
    property Epoch;
    property ButtonEffects;
//    property ButtonTransparent;
//    property ButtonFlat;
    property Frame;
    property ButtonWidth;
    property ButtonGlyph;
    property Time;
    property DragMode;
    property DragCursor;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property MaxDate;
    property MinDate;
    property Interval;
    {$ifdef wwDelphi4Up}
    property ParentBiDiMode;  { 2/18/99 - Case sensitive name for Builder 4 }
    {$endif}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property ShowButton;
    property TabOrder;
//    property Transparent;
    property UnboundDataType;
    property DisplayFormat;
    property Visible;
    property OnCalcBoldDay;
    property OnClick;
    property OnCloseUp;
    property OnChange;
    property OnDropDown;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnStartDrag;
    property InfoPower;
 end;


TwwDateComboButton = class(TSpeedButton)
  protected
    procedure Paint; override;
  end;

//procedure Register;

implementation

uses comstrs,typinfo;

// 12/1/98 - Turned off RangeChecking Compiler Switch because of operations on words.
{$Q-}

{.$R *.RES}
type TwwDBGridOption = (dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator,
     dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect,
     dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit,
     dgWordWrap, dgPerfectRowFit, dgMultiSelect);

type TwwDBGridOptions = set of TwwDBGridOption;

     TCheatGridCast = class(TCustomGrid);


  TwwComboButtonEffects = class(TwwButtonEffects)
     protected
        procedure Refresh; override;
  end;

  Procedure TwwComboButtonEffects.Refresh;
  begin
      (Button as TSpeedButton).Glyph.Handle:=
        TwwDBCustomDateTimePicker(Control).LoadComboGlyph;
  end;

constructor TwwDTInterval.Create;
begin
   FMinutesInterval:= 1;
end;

{$ifdef wwDelphi3up}
var wwHook: HHOOK;

function wwHookProc(nCode: Integer; wParam: Integer; lParam: Integer): LResult; stdcall;
var r1, r2: TRect;
begin
  result := CallNextHookEx(wwHook, nCode, wParam, lParam);
  with PMouseHookStruct(lParam)^ do
  begin
    if (wParam = WM_LBUTTONDOWN) or (wParam = WM_NCLBUTTONDOWN) then
    begin
      if (Screen.ActiveControl <> nil) and (Screen.ActiveControl is TwwDBCustomDateTimePicker) then
        with (Screen.ActiveControl as TwwDBCustomDateTimePicker) do
      begin
        { Auto-closeup if clicked outside of drop-down area }
        if isDroppedDown and (not FCalendar.IsPopupYearMonthShowing) then begin
           GetWindowRect(FCalendar.Handle, r1);
           GetWindowRect(Handle, r2);
           if (not PtInRect(r1, pt)) and (not PtInRect(r2, pt)) then
             { 11/15/98 - Calling closeup immediately would cause problems
              if user's OnCloseUp aborted }
             PostMessage(Handle, CM_CANCELMODE, 0, 0);
//           CloseUp(True);
        end
      end;
    end;
  end;
end;
{$endif}

Function max(x,y: integer): integer;
begin
  if x>y then result:= x else result:= y;
end;

function DaysThisMonth(Month,Year:integer): Integer;
const
  DaysPerMonth: array[1..12] of Integer =
    (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);	    { usual numbers of days }
begin
  Result := DaysPerMonth[Month];                        { normally, just return number }
  if (Month = 2) and IsLeapYear(Year) then Inc(Result); { plus 1 in leap February }
end;

Function LessThanOrEqual(date1,date2:TDateTime):boolean;
begin
   result := Trunc(Date1) <= Trunc(Date2);
end;

function getcurmillenium:integer;
var curdate:TDate;
    curm,curd,cury:word;
begin
    curdate := Now;
    DecodeDate(curdate,cury,curm,curd);
    result := cury div 100;
end;

function IncMonth(const Date: TDateTime; NumberOfMonths: Integer): TDateTime;
var
  DayTable: PDayTable;
  Year, Month, Day: Word;
  Sign: Integer;
begin
  if NumberOfMonths >= 0 then Sign := 1 else Sign := -1;
  DecodeDate(Date, Year, Month, Day);
  Year := Year + (NumberOfMonths div 12);
  NumberOfMonths := NumberOfMonths mod 12;
  Inc(Month, NumberOfMonths);
  if Word(Month-1) > 11 then    // if Month <= 0, word(Month-1) > 11)
  begin
    Inc(Year, Sign);
    Inc(Month, -12 * Sign);
  end;
  DayTable := @MonthDays[IsLeapYear(Year)];
  if Day > DayTable^[Month] then Day := DayTable^[Month];
  if (Year > 9999) then begin
     DecodeDate(Date, Year, Month, Day);
  end;
  Result := EncodeDate(Year, Month, Day) + Frac(Date);
end;

function Get4DigitFrom2DigitYear(temp2year,m,d,FEpoch:Integer):Integer;
//var i:integer;
begin
  if temp2year >= (FEpoch mod 100) then
     result := ((FEpoch div 100)*100 + temp2Year)
  else
     result := (((FEpoch div 100)+1)*100 + temp2Year);
end;

Function ReplaceStrWithStr(str: string; removestr: string;replaceStr: string): string;
  var i: integer;
  begin
     Result := '';
     i:=1;
     while i<=length(str) do begin
        if (strlcomp(PChar(Copy(str,i,length(removestr))), PChar(removestr),
            length(removestr))<>0) then
        begin
           Result := Result + str[i];
           i:=i+1;
        end
        else begin
          Result:= Result + replaceStr;
          i:=i+length(removeStr);
        end;
     end;
  end;

{ Return true if class is derived from 'Name' }
{ This code is more code efficient than InheritsFrom or 'Is'
  as it does not require that the compiler link in the class }
function wwIsClass(ClassType: TClass; const Name: string): Boolean;
begin
  Result := True;
  while ClassType <> nil do
  begin
    if uppercase(ClassType.ClassName)=uppercase(Name) then Exit;
    ClassType := ClassType.ClassParent;
  end;
  Result := False;
end;

Function ParentGridFocused(dtp:TwwDBCustomDateTimePicker): boolean;
begin
   result:= False;
   if (dtp.fDataLink.Field <> nil) then begin
     if wwIsClass(dtp.Parent.classType, 'TwwDBGrid') then
        if dtp.parent.Focused then result:= True
   end;
end;

Function wwGetGridOptions(dtp:TwwDBCustomDateTimePicker): TwwDBGridOptions;
var PropInfo: PPropInfo;
    opt : TwwDBGridOptions;
begin
     Result:= [];

     if wwIsClass(dtp.Parent.classType, 'TwwDBGrid') then
     begin
        PropInfo:= Typinfo.GetPropInfo(dtp.Parent.ClassInfo,'Options');
        if PropInfo<>Nil then PChar(@opt)^:= Char(GetOrdProp(dtp.Parent, PropInfo));
        result:= opt;
     end
end;

{************************************* TwwPopupCalendar **************************************}
constructor TwwPopupCalendar.Create(AOwner: TComponent);
begin
   FCombo := TwwDBDateTimePicker(AOwner); // 9/27/98 - Avoid runtime error if subclassing from TwwDBCustomDateTimePIcker
   inherited Create(AOwner);
   ControlStyle := ControlStyle + [csReplicatable];
end;

procedure TwwPopupCalendar.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or WS_BORDER;
    ExStyle := WS_EX_TOOLWINDOW;
    WindowClass.Style := CS_SAVEBITS;
  end;
end;

procedure TwwPopupCalendar.CreateWnd;
begin
  inherited CreateWnd;
//  Windows.SetParent(Handle, 0);
 { Trick of Setting parent to 0 causes resource leak so use desktop window instead }
  Windows.SetParent(Handle, GetDesktopWindow);
  CallWindowProc(DefWndProc, Handle, wm_SetFocus, 0, 0);
end;

{procedure TwwPopupCalendar.WMLButtonDown(var Message: TWMLButtonDown);
begin
  inherited;
  if not PtinRect(ClientRect,Point(Message.xpos,Message.ypos)) then
     FCombo.Closeup(True);
end;
}
procedure TwwPopupCalendar.WMLButtonUp(var Message: TWMLButtonUp);
var Info: TMCHitTestInfo;
    closeflag:Boolean;
    Index:Integer;
begin
  inherited;

  FillChar(Info, SizeOf(TMCHitTestInfo), 0);
  Info.Pt.X := Message.Pos.X;
  Info.Pt.Y := Message.Pos.Y;
  Info.cbsize := sizeof(TMCHitTestInfo);

  closeflag := False;
  Index := MonthCal_HitTest(WindowHandle,Info);
  if Index >= 0 then begin
    if ((Info.uHit AND MCHT_CALENDAR)<>0) then closeflag := True;
    if ((Info.uHit AND MCHT_CALENDARDAY)=MCHT_CALENDARDAY) then closeflag := False;
    if CloseFlag then begin
       FCombo.CloseUp(True);
    end;
  end;
end;

procedure TwwPopupCalendar.GetFocus;
begin
end;

procedure TwwPopupCalendar.Change;
begin
  inherited Change;
  if FCombo.CanEdit then begin
     FCombo.EnableEdit;
     FCombo.SetModified(True);
     FCombo.Date := Date;
  end;
end;

procedure TwwPopupCalendar.KeyDown(var Key: Word; Shift: TShiftState);
begin
//  FCombo.EnableEdit; { Ask Paul }
  inherited KeyDown(Key, Shift);
end;

{************************************ TwwDBDateTimePicker *************************************}

procedure TwwDBCustomDateTimePicker.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style :=(Params.Style and not (ES_AUTOVSCROLL or ES_WANTRETURN) or
                   WS_CLIPCHILDREN);  {!!!}
  if (BorderStyle = bsNone) then Params.Style:= Params.Style or ES_MULTILINE;
  {$ifdef wwdelphi4up}
  if UseRightToLeftAlignment and ShowButton and (not isTimeOnlyField) then
    Params.Style:= Params.Style or ES_MULTILINE;
  {$endif}
  if IsTransparentEffective and Frame.CreateTransparent then
  begin
     Params.ExStyle := Params.ExStyle or WS_EX_TRANSPARENT;
  end;

end;

procedure TwwDBCustomDateTimePicker.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    wm_KeyDown, wm_SysKeyDown, wm_Char:
      with TWMKey(Message) do
      begin
        if (isDroppedDown and
           (Message.Msg=wm_KeyDown)) then begin  { Update Date when dropped down }

           HandleDropDownKeys(CharCode, KeyDataToShiftState(KeyData));
           if (CharCode <> 0) then
           begin
             with TMessage(Message) do
                SendMessage(FCalendar.Handle, Msg, WParam, LParam);

             if CanEdit then begin
                EnableEdit;
                SetModified(True);
                if FCalendar<>Nil then Date := FCalendar.Date; { 9/1/98 - Check for nil}
             end
           end;
        end;
      end
  end;

  inherited WndProc(Message);
end;

procedure TwwDBCustomDateTimePicker.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

procedure TwwDBCustomDateTimePicker.CMCancelMode(var Message: TCMCancelMode);
begin
  { RSW - allow clicking on control to close-up pop-up calendar }
  if {(Message.Sender <> Self) and }
     (Message.Sender <> FCalendar)
  and (Message.Sender <> Button) then
      CloseUp(True)
  else begin
     if FinDigitEdit then begin
        InDigitEditUpdateRecord;
     end;
  end;
end;

procedure TwwDBCustomDateTimePicker.WMKillFocus(var Message: TMessage);
begin
  inherited;
  CloseUp(True);
end;

procedure TwwDBCustomDateTimePicker.WMCut(var Message: TMessage);
begin
  EnableEdit;
  inherited;
  if (CanEdit) then begin
    DateTime := 0.0;
    Text := '';
    Update;
    ShowCaret(Handle);
    FPos := 1;
    FIsCleared := True;
    SetModified(True);
  end;
end;

procedure TwwDBCustomDateTimePicker.WMPaste(var Message: TMessage);
var prevText: string;
    val: TDateTime;
begin
  PrevText:= Text;

  if not CanEdit then begin
     exit;
  end;

  FDataLink.Edit;
  {!!!!!Only allow paste over entire text }
  selstart := 0;
  sellength := length(Text);

  inherited;
  try
     if isTimeOnlyField then begin
        val:= wwStrToTimeVal(Text);
        if val<>0 then DateTime:= Val;
     end
     else begin
        val := wwStrToDateTimeVal(Text);  // Try to convert to a date
        if Trunc(val)=0 then val := wwStrToDateVal(Text);  // Try to convert to a date
        if Trunc(val)<>0 then DateTime:= Val;
     end
  except
     Text := PrevText;
  end;
  RefreshText;
  HighlightToken(DateTime);
  SetModified(True);
end;

function TwwDBCustomDateTimePicker.GetEffectiveDisplayFormat(ExpandNativeFormat: boolean): string;
var formatstr:string;
begin
  formatstr := FDisplayFormat;

  // If this is a bound field and we don't know the format string yet, then...
  if (formatStr='') and (FDatalink.Field <> nil) and (TDateTimeField(FDatalink.Field).DisplayFormat <> '') then
     formatstr :=TDateTimeField(FDatalink.Field).DisplayFormat;

  if ExpandNativeFormat and (formatstr = '') then begin
     if ((FDatalink.Field <> nil) and (TDateTimeField(FDatalink.Field).DataType = ftTime)) or
        ((FDatalink.Field = nil) and (FUnboundDataType = wwDTEdtTime)) then begin
        if DateFormat = dfShort then
           formatstr := shorttimeformat
        else formatstr := longtimeformat;
     end
     else if ((FDatalink.Field <> nil) and (TDateTimeField(FDatalink.Field).DataType = ftDate)) or
             ((FDatalink.Field = nil) and (FUnboundDataType = wwDTEdtDate)) then begin
        if DateFormat = dfShort then
           formatstr := shortdateformat
        else formatstr := longdateformat;
     end
     else begin
        if DateFormat = dfShort then
           formatstr := 'c'
        else formatstr := longdateformat+' '+longtimeformat;
     end;
  end;
  result := formatstr;
end;

{Get the current date/time format string for the wwdbdatetimepicker}
function TwwDBCustomDateTimePicker.GetFormatStr:String;
var formatstr:string;
begin
  formatstr := GetEffectiveDisplayFormat(True);
  formatstr := ReplaceStrWithStr(formatstr,'c',shortdateformat+' '+longtimeformat);
  formatstr := ReplaceStrWithStr(formatstr,'dddddd',longdateformat);
  formatstr := ReplaceStrWithStr(formatstr,'ddddd',shortdateformat);
  formatstr := ReplaceStrWithStr(formatstr,'tt',longtimeformat);
  formatstr := ReplaceStrWithStr(formatstr,'t',shorttimeformat);
  Result := formatstr;
end;

{GetCompleteToken retrieves the rest of the token and returns the full token
 string and advances the position in the DateTime format string to the end of
 the token string}
procedure TwwDBCustomDateTimePicker.GetCompleteToken
   (val:char;formatstr:string;var s:string;var pos:integer);
var MinuteFlag:Boolean;
begin
  if AnsiUpperCase(String(val)) = 'A' then begin
  {Handle A/P DateTime DisplayFormat}
     if (length(formatstr)>=pos+2) and (formatstr[pos+1] = '/') and
        (AnsiUpperCase(String(formatstr[pos+2])) = 'P') then
        begin
          s:=copy(formatstr,pos,3);
          pos:=pos+1;
        end
  {Handle Am/Pm DateTime DisplayFormat}
     else if (length(formatstr)>=pos+4) and
        (AnsiUpperCase(String(formatstr[pos+1])) = 'M') and
        (formatstr[pos+2] = '/') and
        (AnsiUpperCase(String(formatstr[pos+3])) = 'P') and
        (AnsiUpperCase(String(formatstr[pos+4])) = 'M') then
        begin
          s:=copy(formatstr,pos,5);
          pos:=pos+3;
        end
  {Handle AmPm DateTime DisplayFormat}
     else if (length(formatstr)>=pos+3) and
        (AnsiUpperCase(String(formatstr[pos+1])) = 'M') and
        (AnsiUpperCase(String(formatstr[pos+2])) = 'P') and
        (AnsiUpperCase(String(formatstr[pos+3])) = 'M') then
        begin
          s:=copy(formatstr,pos,4);
          pos:=pos+3;
        end;
  end
  else begin
     s:=val;

     MinuteFlag:=False;

     if (Pos-length(TimeSeparator)-1 >= 0) then begin {9/10/98 - Handle range check errors}
           {Check to See if this is a minute token with m's instead of n's}
                 {9/10/98 - Also check for capital h token}
         if (formatstr[Pos-length(TimeSeparator)-1]='h') or
            (formatstr[Pos-length(TimeSeparator)-1]='H')
           then
            MinuteFlag := True;
     end;

     while (pos+1<=length(formatstr)) and
        (AnsiUpperCase(formatstr[pos+1])[1]=AnsiUpperCase(String(val))) do
     begin
        s:= s+val;
        pos:= pos+1;
     end;

     if MinuteFlag then
     begin              {Translate m's to n's (minutes)}
        if (s='mm') then s:='nn'
        else if (s='m') then s:='n';
     end;
  end;
end;

{Determine Datatype of Combos}
function  TwwDBCustomDateTimePicker.isDateField:boolean;
begin
   result:=((FDatalink.Field<>Nil) and (TDateTimeField(FDatalink.Field).DataType = ftDate))
      or ((FDatalink.Field=Nil) and (FUnboundDataType = wwDTEdtDate));
end;

function  TwwDBCustomDateTimePicker.isTimeOnlyField:boolean;
begin
   result := ((FDatalink.Field<>Nil) and (TDateTimeField(FDatalink.Field).DataType = ftTime))
   or ((FDatalink.Field=Nil) and(FUnboundDataType = wwDTEdtTime)) or
   // Check to see if this is a TDateTime field with a displayformat that does not show any date information.
   ((FDatalink.Field<>nil) and (TDateTimeField(FDatalink.Field).DataType=ftDateTime) and
    (not DateTokenInString(GetEffectiveDisplayFormat(True))));
end;

function  TwwDBCustomDateTimePicker.isDateOnlyField:boolean;
begin
   result:= False;
   if (FDatalink.Field<>Nil) and
      (TDateTimeField(FDatalink.Field).DataType = ftDate) then result:= True;

   if ((FDatalink.Field=Nil) and(FUnboundDataType = wwDTEdtTime)) then result:= True;

   // Check to see if this is a TDateTime field with a displayformat that
   // does not show any time information.
   if ((FDatalink.Field<>nil) and
      (TDateTimeField(FDatalink.Field).DataType=ftDateTime) and
      (not TimeTokenInString(GetEffectiveDisplayFormat(True)))) then result:= True;
end;

function TwwDBCustomDateTimePicker.isDateTimeField:boolean;
begin
   result:=((FDatalink.Field<>Nil) and (TDateTimeField(FDatalink.Field).DataType = ftDateTime))
      or ((FDatalink.Field=Nil) and (FUnboundDataType = wwDTEdtDateTime));
end;

{Get the Maximum allowable Tokens for this DateTimePicker based on the formatstr}
function TwwDBCustomDateTimePicker.GetMaxTokens(formatstr:string):integer;
var s:string;
    i,tokenct:integer;
begin
//   formatstr:=GetFormatStr;
   i:=1;
   tokenct:=0;
   while (i < length(formatstr)) do begin
      case AnsiUpperCase(formatstr[i])[1] of
        'D': begin
             GetCompleteToken('d',formatstr,s,i);
             if isDateTimeField or isDateField then
                tokenct:= tokenct+1;
             end;
        'M': begin
             GetCompleteToken('m',formatstr,s,i);
                 {If this is a TDateField, then don't count minutes as a token}
             if (s = 'mm') or (s = 'm') then begin
                if isDateTimeField or isDateField then
                   tokenct := tokenct+1;
             end
             else if (s='nn') or (s='n') then begin
                if isTimeOnlyField or isDateTimeField then
                   tokenct := tokenct+1;
             end
             else begin
                if isDateTimeField or isDateField then
                   tokenct := tokenct+1;
             end;
             end;
        'Y': begin
             if isDateTimeField or isDateField then
                tokenct:= tokenct+1;
             GetCompleteToken('y',formatstr,s,i);
             end;
        'H': begin
             if isTimeOnlyField or isDateTimeField then
                tokenct:= tokenct+1;
             GetCompleteToken('h',formatstr,s,i);
             end;
        'N': begin
             if isDateTimeField or isTimeOnlyField then
                tokenct:= tokenct+1;
             GetCompleteToken('n',formatstr,s,i);
             end;
        'S': begin
             if isDateTimeField or isTimeOnlyField then
                tokenct:= tokenct+1;
             GetCompleteToken('s',formatstr,s,i);
             end;
        'A': begin
             if isDateTimeField or isTimeOnlyField then
                tokenct:= tokenct+1;
             GetCompleteToken('a',formatstr,s,i);
             end;
         end;
         i:=i+1;
   end;
   result := tokenct;
end;

{This function parses the passed in Format string to determine if this
format string is an AM/PM or 24 hour Time Field}
function TwwDBCustomDateTimePicker.IsAMPM(str:string):boolean;
var i:integer;
begin
   for i:= 1 to length(str) do  {9/10/98 - Fix range check error and loop from 1 to length(str)}
   begin
      if (AnsiUpperCase(str[i])[1]='A') then begin
         result := True;
         exit;
      end;
   end;
   result := False;
end;

//Check to see if there is any datetokens in the passed format string.
function TwwDBCustomDateTimePicker.DateTokenInString(formatStr:string):boolean;
var i:integer;
    s:String;
begin
    Result := False;
    if formatstr = '' then begin
       result := True;
       exit;
    end;
    formatstr := ReplaceStrWithStr(formatstr,'c',shortdateformat+' '+longtimeformat);
    formatstr := ReplaceStrWithStr(formatstr,'dddddd',longdateformat);
    formatstr := ReplaceStrWithStr(formatstr,'ddddd',shortdateformat);
    formatstr := ReplaceStrWithStr(formatstr,'tt',longtimeformat);
    formatstr := ReplaceStrWithStr(formatstr,'t',shorttimeformat);
    i:=1;
    s:='';
    while (i < length(formatstr)) do begin
       case AnsiUpperCase(formatstr[i])[1] of
         'D':begin
               GetCompleteToken('d',formatstr,s,i);
               result := True;
             end;
         'M':begin
               GetCompleteToken('m',formatstr,s,i);
               if not((s = 'n') or (s='nn')) then
                  result := True;
             end;
         'Y':begin
               GetCompleteToken('y',formatstr,s,i);
               result := True;
             end;
         'H':GetCompleteToken('h',formatstr,s,i);
         'N':GetCompleteToken('n',formatstr,s,i);
         'S':GetCompleteToken('s',formatstr,s,i);
         'A':GetCompleteToken('a',formatstr,s,i);
       end;
       if Result then exit;
       i:=i+1;
    end;
end;

//Check to see if there is any datetokens in the passed format string.
function TwwDBCustomDateTimePicker.TimeTokenInString(formatStr:string):boolean;
begin
    Result := False;
    if formatstr = '' then begin
       result := True;
       exit;
    end;
    formatstr:= uppercase(formatstr);
    if pos('H', formatstr)>0 then result:= True;
    if pos('N', formatstr)>0 then result:= True;
    if pos('S', formatstr)>0 then result:= True;
    if pos('T', formatstr)>0 then result:= True;
    if pos('C', formatstr)>0 then result:= True;
end;

function TwwDBCustomDateTimePicker.GetDatetimeToken(datetime1:TDateTime;index:integer;
    var pos,len:integer;var S:string):string;

var i,tokenct:integer;
    totalstr,tempstr:string;
    Year, Month, Day:Word;
    Hour, Minute, Second, Msec:Word;
    formatstr,AMstring:string;
    AMPMflag:boolean;
begin
      tokenct := 0;
      len:=0;
      pos:=0;
      totalstr:='';

      DecodeDate(DateTime1, Year, Month, Day);
      DecodeTime(DateTime1, Hour, Minute, Second, Msec);

      formatstr := GetFormatStr;
      AMPMFlag := IsAMPM(formatstr);

      i:=1;
      while (i < length(formatstr)) do begin
        s:='';
        case AnsiUpperCase(formatstr[i])[1] of
        'D':begin
              if isDateTimeField or isDateField then
                 tokenct:= tokenct+1;
              GetCompleteToken('d',formatstr,s,i);

              if (s = 'ddddd') or (s= 'dddddd') then
                 tempstr := '';
              if s = 'dddd' then
                 tempstr:=longdaynames[DayOfWeek(DateTime1)]
              else if s = 'ddd' then
                 tempstr := Shortdaynames[DayOfWeek(DateTime1)]
              else if (s = 'dd') or (s = 'd') then begin
                 if (s='dd') and (length(IntToStr(Day))=1) then
                    tempstr := '0'+IntToStr(Day)
                 else tempstr := IntToStr(Day);
              end;

              len := length(tempstr);
              totalstr := totalstr+tempstr;

              if tokenct = index then break;
              pos:=pos+len;
             end;
        'M':begin
              GetCompleteToken('m',formatstr,s,i);

              if s = 'mmmm' then
                 tempstr := longmonthnames[Month]
              else if s = 'mmm' then
                 tempstr := Shortmonthnames[Month]
              else if (s = 'mm') or (s = 'm') then begin
                 if (s='mm') and (length(IntToStr(Month))=1) then
                    tempstr := '0'+IntToStr(Month)
                 else tempstr := IntToStr(Month);
              end
              else if (s='nn') or (s='n') then begin
                 if (s='nn') and (length(IntToStr(Minute))=1) then
                    tempstr := '0'+IntToStr(Minute)
                 else tempstr := IntToStr(Minute);
              end;

              len := length(tempstr);
              totalstr := totalstr+tempstr;

              if ((s='n') or (s='nn')) then begin
                 if isDateTimeField or isTimeOnlyField then begin
                    tokenct:= tokenct+1;
                    if tokenct = index then break;
                 end
                 else begin
                    s:='';
                 end;
              end
              else begin
                 if isDateTimeField or isDateField then
                    tokenct:= tokenct+1;
                 if tokenct = index then break;
              end;
              pos:=pos+len;
            end;
        'Y':begin
             if isDateTimeField or isDateField then
                tokenct:= tokenct+1;

              GetCompleteToken('y',formatstr,s,i);

              len := length(s);
              if (s = 'yy') then
                totalstr := totalstr+IntToStr(Year mod 100)
              else
                totalstr := totalstr+IntToStr(Year);

              if tokenct = index then break;
              pos:=pos+len;
            end;
        'H':begin  {Get complete token}
              GetCompleteToken('h',formatstr,s,i);
                      {If Hour = 0 then set Hour to 12}
              if Hour = 0 then Hour := 12;

              if (s='hh') and (length(IntToStr(Hour))=1) then
                      {Pad Single Digit Hours with a '0'}
                  tempstr := '0'+IntToStr(Hour)
              else begin
                  if AMPMFlag and (Hour >12) and (Hour < 22) then
                     tempstr := IntToStr(Hour-12)
                  else
                     tempstr := IntToStr(Hour);
              end;

                      {Check to See if this is a Single or Double Digit Hour}
              if (s='h') and ((Hour < 10) or
                             (AMPMFlag and (Hour > 12) and (Hour < 22))) then
                  len:=1
              else len:=2;

              totalstr := totalstr+tempstr;

              if isDateTimeField or isTimeOnlyField then begin
                 tokenct:= tokenct+1;
                 if tokenct = index then break;
              end
              else begin
                s:='';
              end;
              pos:=pos+len;
            end;
        'N':begin
              GetCompleteToken('n',formatstr,s,i);

              if (s='nn') and (length(IntToStr(Minute))=1) then
                tempstr := '0'+IntToStr(Minute)
              else tempstr := IntToStr(Minute);

              len := length(tempstr);
              totalstr := totalstr+tempstr;

              if isDateTimeField or isTimeOnlyField then begin
                tokenct:= tokenct+1;
                if tokenct = index then break;
              end
              else begin
                s:='';
              end;
              pos:=pos+len;
            end;
        'S':begin
              GetCompleteToken('s',formatstr,s,i);

              if (s='ss') and (length(IntToStr(Second))=1) then
                 tempstr := '0'+IntToStr(Second)
              else tempstr := IntToStr(Second);

              len := length(tempstr);
              totalstr := totalstr+tempstr;

              if isDateTimeField or isTimeOnlyField then begin
                 tokenct:= tokenct+1;
                 if tokenct = index then break;
              end
              else begin
                s:='';
              end;

              pos:=pos+len;
            end;
        '/':begin
              pos:=pos+1;
              totalstr := totalstr+'/';
            end;
        ':':begin
              pos:=pos+1;
              totalstr := totalstr+':';
            end;
        'A':begin
              if Hour = 0 then Hour := 12;
              GetCompleteToken('a',formatstr,s,i);

              AMString := '';
              if (length(s)=3) then  {Handle A/P DateTime DisplayFormat}
              begin
                if (hour < 12) then
                   AMstring := s[1]
                else AMstring := s[3];
              end
              else if (length(s) = 5) then {Handle Am/Pm DateTime DisplayFormat}
              begin
//                if (hour < 12) then
//                   AMString := formatstr[1]+formatstr[2]
//                else AMString := formatstr[4]+formatstr[5];
                if (hour < 12) then {!!!!}
                   AMString := s[1]+s[2]
                else AMString := s[4]+s[5];
              end
              else if (length(s) = 4) then {Handle AMPM DateTime DisplayFormat}
              begin
                if (Hour <= 12) then
                   AMString := TimeAMString
                else AMString := TimePMString;
              end;

              len := length(AMString);
              TotalStr := TotalStr + AMString;

              if isDateTimeField or isTimeOnlyField then begin
                 tokenct:= tokenct+1;
                 if tokenct = index then break;
              end
              else begin
                 s:='';
              end;

              pos:=pos+length(AMString);
           end;
        else begin
               pos:=pos+1;
               totalstr := totalstr+formatstr[i];
             end;
        end;
        i:=i+1;
      end;
      if tokenct <> index then totalstr := '';
      result := totalstr;
end;

{This Function determines if the Time Portion of a TDateTimeField is visible
 when it has the C format}
function TwwDBCustomDateTimePicker.TimeShowing:boolean;
var tempstr,token:string;
    i,startpos,tlength:integer;
begin
   Result := True;
   i:=getMaxTokens(GetFormatStr);
   tempstr := getdatetimetoken(Datetime,i,startpos,tlength,token);

   if IsCFormat and (Length(tempstr)>Length(text)) then
      Result := False;
end;

{C display format displays shortdateformat and longTimeformat on a DateTime field}
function TwwDBCustomDateTimePicker.IscFormat:boolean;
begin
  result := False;
  if (FDatalink.Field <> nil) then begin
     if ((IsDateTimeField and {(TDateTimeField(FDatalink.Field).DisplayFormat = '')) or}
         (GetEffectiveDisplayFormat(False)='')) or
         (TDateTimeField(FDatalink.Field).DisplayFormat = 'c')) then
        result := True;
  end
  else if IsDateTimeField and ((DisplayFormat = 'c') or ((DisplayFormat = '') and (DateFormat = dfShort))) then
     result := True;
end;

{This function gets the maximum number of visible tokens for the shortdateformat
 This only applies for a TDateTimeField and a 'c' displayformat}
function TwwDBCustomDateTimePicker.GetMaxVisibleToken:Integer;
var tempstr,token:string;
    i,startpos,tlength: integer;
begin
    if not isCFormat then begin
      result := GetMaxTokens(GetFormatStr);
      exit;
    end;

    i:=1;
    repeat
       tempstr := getdatetimetoken(datetime,i,startpos,tlength,token);

       if (Length(tempstr)>=Length(text)) then begin
          break;
       end;

       i:=i+1;
     until tempstr = '';

   result := i;
end;

{This routine updates the highlighted token}
procedure TwwDBCustomDateTimePicker.HighlightToken(mDateTime:TDateTime);
var startpos,tokenlength:integer;
    s,token:string;
begin
  if CanEdit then begin
     if not (DroppedDown) then begin
       s := getdatetimetoken(mDateTime,FPos,startpos,tokenlength,token);
       selstart:=startpos;
       sellength := tokenlength;
     end
     else begin
       selstart := 0;
       sellength := 0;
     end;
  end
  else begin
    SelectAll;
  end;
  ShowCaret(Handle);
  HideCaret(Handle);
end;

procedure TwwDBCustomDateTimePicker.WMLButtonDown(var Message: TWMLButtonDown);
var mDateTime : TDateTime;
    startpos,tlength,i:integer;
    tempstr,token:string;
//    y,m,d: word;
begin
  if Text = '' then begin
    inherited;
    exit;
  end;

  if (not FIsCleared) or (Text <> '') then begin
          {PW - The following few lines of code are necessary to handle the OnClick event
           and come from TControls WMLButtonDown procedure}
    SendCancelMode(Self);
    if csCaptureMouse in ControlStyle then MouseCapture := True;
    if csClickEvents in ControlStyle then Click;
    if not (csNoStdEvents in ControlStyle) then
       with Message do
          MouseDown(mbLeft, KeysToShiftState(Keys) + [], XPos, YPos);

    if not focused then Setfocus;  {!!!pw because inherited messes up selection}

    if (isDroppedDown) then
       mDateTime := FCalendar.Time
    else
       mDateTime := DateTime;

    if FinDigitEdit then InDigitEditUpdateRecord;
(*    if FinDigitEdit then begin { RSW - Base mouse on updated text }
       { If editing year, need to map to 4 digit year }
       tempstr := getdatetimetoken(mdatetime,fpos,startpos,tlength,token);
       if (AnsiUpperCase(token[1])[1]='Y') and (selStart-startPos<3) then
       begin
          DecodeDate(FDateTime, y, m, d);
          if selStart>startPos then
             y := Get4DigitFrom2DigitYear(
                strtoint(copy(Text, startpos+1, selStart-startPos)),
                m,d,FEpoch);
          FDateTime:= EncodeDate(y,m,d);
       end;

       RefreshText;
       FInDigitEdit:= False;
       HideCaret(Handle);
    end;
*)
    i:=1;
    Button.Glyph.canvas.font.assign(font);
    repeat
       tempstr := getdatetimetoken(mdatetime,i,startpos,tlength,token);

       { RSW - Click after all text }
       if startpos+tlength>=length(text) then
       begin
          FPos:=i;
          break;
       end;

       if Message.XPos < Button.Glyph.Canvas.TextWidth(tempstr) then
       begin
            FPos:=i;
            break;
       end;

       if IsCFormat and (Length(tempstr)>=Length(text)) then begin
          FPos:=i;
          break;
       end;

       i:=i+1;
     until tempstr = '';

    HighlightToken(mDateTime);
  end
  else begin
    ShowCaret(Handle);
    inherited;
  end;
{  else
    NonEditMouseDown (Message);}
end;

{Test to see if year is a valid 2 digit year.  Currently this function appends
 the current millenium for the centuries.}
function TwwDBCustomDateTimePicker.isvalid2year(newnum:integer):boolean;
var possibledate:TDateTime;
    test:integer;
begin
    result := False;
//    test := getcurmillenium;
    { 7/31/99 - RSW - Fix bug where 00 cannot be entered into year if MinDate is greater than 1900}
    if (newnum*10) >= (FEpoch mod 100) then
       test:= (FEpoch div 100)
    else
       test:= ((FEpoch div 100)+1);

    possibledate := EncodeDate(Test*100+(10*newnum)+9,12,31);
    if LessThanOrEqual(MinDate,PossibleDate) then
    begin
       result := True;
    end;
end;

Function TwwDBCustomDateTimePicker.GetValidMaxDate:TDate;
begin
   Result := MaxDate;
   if (Trunc(MaxDate) = 0) then
      Result := Trunc(EncodeDate(9999,12,31));
end;

Function TwwDBCustomDateTimePicker.GetValidMinDate:TDate;
begin
   Result := MinDate;
   if (Trunc(MinDate) = 0) then
      Result := Trunc(EncodeDate(1899,12,31));
end;

{Re - Encode the DateTime to the new values.}
procedure TwwDBCustomDateTimePicker.ReEncodeDateTime(y,m,d,h,n,sec,msec:word);
var maxday:integer;
    TempDateTime:TDateTime;
    amaxdate,amindate:TDate;
begin
// Set to maxday if current day exceeds the maximum number
// of days for this month
   maxday := DaysThisMonth(m,y);
   if d>maxday then d:=maxday;
   if isTimeOnlyField then begin
      Time := EncodeTime(h,n,sec,msec);
   end
   else begin
     if (Trunc(EncodeDate(y,m,d)) >= 0) then
        TempDateTime := Trunc(EncodeDate(y,m,d)) + Frac(EncodeTime(h,n,sec,msec))
     else
        TempDateTime := Trunc(EncodeDate(y,m,d)) - Frac(EncodeTime(h,n,sec,msec));

     amaxdate:=GetValidMaxDate;
     amindate:=GetValidMinDate;

     if (Trunc(TempDateTime) <= Trunc(aMaxDate)) and
        (Trunc(TempDateTime) >= Trunc(aMinDate)) then
        DateTime := TempDateTime
     else RefreshText;
   end;
end;

procedure TwwDBCustomDateTimePicker.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
       // PW - The following few lines of code are necessary to handle the OnClick event
       //      and come from TControls WMLButtonDown procedure
  SendCancelMode(Self);
  if csCaptureMouse in ControlStyle then MouseCapture := True;
  if csClickEvents in ControlStyle then DblClick;
  if not (csNoStdEvents in ControlStyle) then
     with Message do
        MouseDown(mbLeft, KeysToShiftState(Keys) + [ssDouble], XPos, YPos);

  SelStart:=0;
  SelLength := Length(Text);
end;

procedure TwwDBCustomDateTimePicker.WMSize;
begin
  inherited;
  UpdateButtonPosition;
end;

procedure TwwDBCustomDateTimePicker.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if (not Editable) or not IsInGrid(self) then begin
    if (FDatalink.Field<>nil) and (FDatalink.Field.IsNull) then exit;
    if (Text <> '') and (not FInDigitEdit) then HideCaret(Handle)
  end;
end;

procedure TwwDBCustomDateTimePicker.CMFontChanged(var Message: TMessage);
  procedure CalcTextMargin;
  var
    DC: HDC;
    SaveFont: HFont;
    I: Integer;
    SysMetrics, Metrics: TTextMetric;
  begin
    if NewStyleControls then
    begin
       FTextMargin := 1;
       exit;
    end;

    DC := GetDC(0);
    GetTextMetrics(DC, SysMetrics);
    SaveFont := SelectObject(DC, Font.Handle);
    GetTextMetrics(DC, Metrics);
    SelectObject(DC, SaveFont);
    ReleaseDC(0, DC);
    I := SysMetrics.tmHeight;
    if I > Metrics.tmHeight then I := Metrics.tmHeight;
    FTextMargin := I div 4;
  end;
begin
  inherited;
  CalcTextMargin;
  {This is needed only when changing font in the middle of editing }
  {RSW -9/10/98 - Check Owner<>Nil }
  if (Owner<>Nil) and (not (csLoading in Owner.ComponentState)) then SetEditRect;
end;

Function TwwDBCustomDateTimePicker.GetDateTimeDisplayText(ADateTime:TDateTime):string;
begin
   {10/29/98 - Make sure that control is cleared when datasource is disabled}
   if (FDatalink.Field=nil) and  ((datasource<>nil) or (datafield<>'')) then
   begin
      result:= '';
      exit;
   end;

   if (Trunc(ADateTime)=0) and not isTimeOnlyField then { RSW - Allow paint to display blank for datetime=0}
   begin
      result:= '';
      exit;
   end;
   if (GetEffectiveDisplayFormat(False)='') and
//   if ((FDatalink.Field = nil)or(TDateTimeField(FDatalink.Field).DisplayFormat = '')) and
      (DateFormat=dfLong) and (Frac(ADateTime)=0) then
      result := FormatDateTime(longdateformat,ADateTime)
   else
      result := FormatDateTime(GetEffectiveDisplayFormat(True),ADateTime);
end;

{Get value that is based on database value}
Function TwwDBCustomDateTimePicker.GetDateTimeStoredText(ADateTime:TDateTime):string;
begin
   {10/29/98 - Make sure that control is cleared when datasource is disabled}
   if (FDatalink.Field=nil) and  ((datasource<>nil) or (datafield<>'')) then
   begin
      result:= '';
      exit;
   end;

   if (FDatalink.Field <> nil) and (FDatalink.Field.isnull) and
      ((FCalendar=nil) or (not FCalendar.visible)) then begin
      result := '';
      exit;
   end
   else if (FDatalink.Field=nil) and (ADateTime=0.0) and (isDateTimeField or isTimeOnlyField or isDateField) then begin
       if FisCleared then begin
          result:='';
          exit;
       end;
   end;

   result := GetDateTimeDisplayText(ADateTime);
end;

Procedure TwwDBCustomDateTimePicker.DoExit;
begin
    inherited DoExit;
    FCalendar.Free;
    FCalendar := nil;
end;

procedure TwwDBCustomDateTimePicker.CMEnter(var Message: TCMEnter);
var exStyle, origStyle: longint;
begin
  SetEditRect;
  SetFocused(True);
  if IsInGrid(Self) then FPos := 1;

  if (FDatalink.Field<>nil) and FDatalink.Field.IsNull then { 12/18/98 - Clear text if null field }
     Text := ''
  else {if (DateTime <> 0.0) and (Text <> '') then }begin
    FOldDateTime := DateTime;
    Text:= GetDateTimeStoredText(DateTime);
    HighlightToken(DateTime);
  end;
  inherited DoEnter;
  if (DateTime <> 0.0) and (Text <> '') then begin
     Invalidate;
     if not SkipDrawSetFocus then SelectAll;  { Select all when focus set }
  end;
  if (FDataLink.Field=Nil) then modified:= False;  { 11/4/98 - Only clear if unbound (RSW)}
  if ButtonEffects.Flat then FButton.invalidate;

  if IsTransparentEffective then begin
     Frame.CreateTransparent:= False;
     OrigStyle:= Windows.GetWindowLong(handle, GWL_EXSTYLE);
     exStyle:= OrigStyle and not WS_EX_TRANSPARENT;
     Windows.SetWindowLong(handle, GWL_EXSTYLE, exStyle);
     invalidate;
  end;

  if Frame.enabled then invalidate; { See if this causes any flicker }

end;

procedure TwwDBCustomDateTimePicker.RefreshText;
begin
   if modified then
      Text := getdatetimedisplaytext(Datetime)
   else begin
      if (FDatalink.Field <> nil) or
        { 10/29/98 - Text should be blank if datasource is not enabled }
         ((DateTime <> 0.0) and (datafield='') and (datasource=nil)) then
         Text := GetDateTimeStoredText(Datetime)      //   ? Is there a better way?  PW
      else
        Text := '';
   end;
   invalidate;
end;

procedure TwwDBCustomDateTimePicker.Invalidate;
begin
   inherited invalidate;
   if (FButton<>nil) then FButton.Invalidate;
end;

procedure TwwDBCustomDateTimePicker.WMLButtonUp(var Message: TWMLButtonUp);
begin
  MouseCapture := False;
  inherited;
end;

procedure TwwDBCustomDateTimePicker.WMPaint(var Message: TWMPaint);
var
  PS: TPaintStruct;
  Width, Indent, Left: Integer;
  ARect: TRect;
  Focused: Boolean;
  DC: HDC;
  TempText: string;
  TempLeft, TempIndent: integer;
  WriteOptions: TwwWriteTextOptions;

  Function InPaintCopyState(ControlState: TControlState): boolean;
  begin
     result:= (csPaintCopy in ControlState);
  end;

  Function DrawFocusControl: boolean;
  begin
      result:= ((not Editable and Focused) or ParentGridFocused(self))
                and not InPaintCopyState(ControlState)
  end;

  procedure CanvasNeeded;
  begin
    if FCanvas = nil then
    begin
      FCanvas := TControlCanvas.Create;
      FCanvas.Control := Self;
    end;
  end;

begin

  Focused := GetFocus = Handle;

  if FBtnControl.visible then
  begin
     FButton.Invalidate;
     FButton.Update; { 9/2/98 }
  end;

  if isTimeOnlyField then   {Hide the Button for Time Controls.}begin
     FBtnControl.Visible := False;
//     SetEditRect;  //Removed because it causes problem with DataInspector in use of windows handle
  end
  else if {$ifdef wwdelphi4up} UseRightToLeftAlignment or {$endif}
     (FShowButton <> FBtnControl.Visible) then begin
     FBtnControl.Visible := FShowButton;
//     SetEditRect;
  end; //Makes sure that the button is displayed based on Showbutton property.  7/6/1998 pw

  if FFocused and
     (Editable and (not ParentGridFocused(self)) and not InPaintCopyState(ControlState)) then
  begin
     inherited;

     if Frame.IsFrameEffective then
     begin
       CanvasNeeded;
       FCanvas.Handle:= message.DC;
       DrawFrame(FCanvas);
       FCanvas.Handle:= 0;
     end;
     Exit;
  end;

  { if not editable with focus, need to do drawing to show proper focus }
  CanvasNeeded;

  DC := Message.DC;
  if DC = 0 then DC := BeginPaint(Handle, PS);
  FCanvas.Handle := DC;

  try
    Focused := GetFocus = Handle;
    FCanvas.Font := Font;

    with FCanvas do
    begin
      ARect := ClientRect;

      if (not enabled) and (color<>clInactiveCaption) then {11/11/97}
         font.color:= clInactiveCaption;

(*
      if isTimeOnlyField then   {Hide the Button for Time Controls.}begin
         FBtnControl.Visible := False;
         SetEditRect;  //Added to make sure that the editrectangle is updated.
      end
      else if FShowButton <> FBtnControl.Visible then begin
         FBtnControl.Visible := FShowButton;
         SetEditRect;
      end; //Makes sure that the button is displayed based on Showbutton property.  7/6/1998 pw
*)

      Brush.Color:= clWhite;

      Brush.Style := bsSolid;
      Brush.Color := Color;

      if (not IsTransparentEffective) and (not IsInwwObjectViewPaint(self)) then
         FillRect (ARect);
      ARect:= GetClientEditRect;

      { Win 95 TGridRecord}
      if InPaintCopyState(ControlState) and (FDataLink.Field<>nil) then begin
          TempText := GetDateTimeStoredText(FDataLink.Field.AsDateTime);
      end
      else begin
         if (FDataLink.Field = nil) or modified then
             TempText := GetDateTimeStoredText(DateTime)
         else begin
             if (FDatalink.Field<>nil) and (not FDatalink.Field.isNull) and (not modified) and (DateTime = 0.0) then
                TempText := GetDateTimeDisplayText(0.0)
             else TempText := GetDateTimeStoredText(FDataLink.Field.AsDateTime);
         end;
      end;

      if DrawFocusControl then begin
         Brush.Color := clHighlight;
         Font.Color := clHighlightText;
      end;

      Width := TextWidth(TempText);                {PW???}

      if IsInwwObjectView(self) then Indent:= 1
      else if ParentGridFocused(self) then begin
         if BorderStyle=bsNone then
            Indent:= 2
         else
           Indent:= 3;
      end
      else Indent:= 1;

      if IsInwwObjectView(self) then Left:= 3
      else if Frame.IsFrameEffective then
      begin
         Left:= 1;
         if (efLeftBorder in Frame.NonFocusBorders) then begin
            if Frame.NonFocusStyle=efsFrameBox then Left:= 2
            else Left:= 3;
         end;
         Indent:= 2;
         if (efTopBorder in Frame.NonFocusBorders) and
            (Frame.NonFocusStyle<>efsFrameBox) then
            Indent:= Indent + 1;
         Left:= Left + Frame.NonFocusTextOffsetX;
         Indent:= Indent + Frame.NonFocusTextOffsety;
      end
      else if isInGrid(self) then Left := Indent+1
      else Left:= Indent;

      if FAlignment = taRightJustify then
      begin
         if ShowButton then Left:= GetIconLeft - Width - Indent
         else Left := ARect.Right - Width - Indent;
         if Frame.IsFrameEffective then Left:= Left - Frame.NonFocusTextOffsetX;
      end
      else if FAlignment = taCenter then
      begin
         if not FShowButton then
            Left := (ARect.Left + ARect.Right - Width) div 2
         else
            Left := (ARect.Left + ARect.Right - Width-GetIconIndent) div 2;
      end;

      if InPaintCopyState(ControlState) then
      begin
         TempIndent:= Indent;
         TempLeft:= Left - 1;
      end
      else begin
         TempIndent:= Indent;
         TempLeft:= Left;
      end;

      WriteOptions:= [];
      if IsInwwObjectViewPaint(self) or IsTransparentEffective then
         WriteOptions:= WriteOptions + [wtoTransparent];
      if (not FFocused) and IsTransparentEffective and (Frame.NonFocusTransparentFontColor<>clNone) then
         FCanvas.Font.Color:= Frame.NonFocusTransparentFontColor;
      wwWriteTextLinesT(FCanvas, ARect, TempLeft, TempIndent,
             pchar(TempText), taLeftJustify, WriteOptions);
//             pchar(TempText), taRightJustify, WriteOptions);

      if DrawFocusControl then
      begin
        ARect := GetClientEditRect;

        if (BorderStyle <> bsNone) then
        begin
          ARect.Top:= ARect.Top + 1;
          ARect.Bottom:= ARect.Bottom - 1;
          ARect.Left:= ARect.Left + 1;
        end;

        DrawFocusRect (ARect);
      end
    end;

    if Frame.IsFrameEffective then
    begin
      DrawFrame(FCanvas);
    end;

  finally
    FCanvas.Handle := 0;
    if Message.DC = 0 then EndPaint(Handle, PS);
  end;

//  FButton.Invalidate;
//  FButton.Update; { 9/2/98 }


end;

Function TwwDBCustomDateTimePicker.GetClientEditRect: TRect;
begin
   result:= ClientRect;
end;

type
 TBtnWinControl = class(TWinControl)
 private
    EditControl: TwwDBCustomDateTimePicker;
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBkgnd;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  public
    constructor Create(AOwner: TComponent); override;
 end;

constructor TwwDBCustomDateTimePicker.Create(AOwner: TComponent);
var curdate:TDatetime;
    cury,curm,curd:Word;
begin
  inherited Create(AOwner);

  FButtonStyle:= cbsDownArrow;
  ControlStyle := ControlStyle + [csReplicatable];
  FCalendarOptions := TwwCalendarOptions.Create(Self);
  FInCloseUp:= False;
  FCalendar := Nil;

  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  if FDatalink.Field = nil then FIsCleared := True
  else FIsCleared := False;

  FBtnControl := TBtnWinControl.Create (Self);
  FBtnControl.ControlStyle := FBtnControl.ControlStyle + [csReplicatable];
  FBtnControl.Width:= max(GetSystemMetrics(SM_CXVSCROLL)+4, 17); {4/10/97}
  FBtnControl.Height := 17;
  FBtnControl.Visible := True;
  FBtnControl.Parent := Self;
  ShowButton := True;

  FButton:=TwwDateComboButton.create(self);
  FButton.ControlStyle := FButton.ControlStyle + [csReplicatable];
  FButton.SetBounds (0, 0, FBtnControl.Width, FBtnControl.Height);
  FButton.Width:= max(GetSystemMetrics(SM_CXVSCROLL), 15); {5/2/97 }
  FButton.Parent:= FBtnControl;
  FButton.OnClick:=BtnClick;
  FButton.OnMouseDown:= BtnMouseDown;
  FButton.OnMouseUp:= BtnMouseDown;
//  FButton.Flat:= true;

  FDateTime := 0.0;
  FPos:=1;

  curdate := Now;
  DecodeDate(curdate,cury,curm,curd);
  FEpoch := wwInternational.DefaultEpochYear;

  FOptions:= [wwDTOAutoAdvance];

  //11/29/98 - Make sure Ctl3d is set to True to handle case when parent form's ctl3d is set to False.
  ParentCtl3d := False;
  Ctl3d := True;

  FFrame:= TwwEditFrame.create(self);
  FButtonEffects:= TwwComboButtonEffects.create(self, FButton);
  FButton.Glyph.Handle:= LoadComboGlyph;  { Do after button effects is assigned }

  FInterval:= TwwDTInterval.create;

  FButtonGlyph := TBitmap.Create;
  FButtonGlyph.OnChange := GlyphChanged;


end;

destructor TwwDBCustomDateTimePicker.Destroy;
begin
//  FCalColors.Free;
//  FCalFont.Free;
  FInterval.Free;
  FFrame.Free;
  FButtonEffects.Free;

  FCalendarOptions.Free;
  FDataLink.Free;
  FDataLink := nil;
  FButton.Free;
  FButton := nil;
  FCanvas.Free;
  if FCalendar <> nil then begin
     FCalendar.Free;
     FCalendar := nil;
  end;

  {$ifdef wwDelphi3up}
  if wwHook<>0 then begin
     UnhookWindowsHookEx(wwHook);
     wwHook:= 0;
  end;
  {$endif}

  FButtonGlyph.Free;
  inherited Destroy;
end;

procedure TwwDBCustomDateTimePicker.CMExit(var Message: TCMExit);
begin
  if FinDigitEdit then InDigitEditUpdateRecord;

  if Modified then UpdateRecord;
  DoExit;
  SetFocused(False);
//  SetCursor(0); { Don't set cursor }
  if not Editable then Invalidate;
  if ButtonEffects.Flat then FButton.invalidate;

  if IsTransparentEffective then begin
     Frame.CreateTransparent:= True;
     RecreateWnd;
     SetEditRect;
  end;

  if Frame.enabled then invalidate; { See if this causes any flicker }

end;

procedure TwwDBCustomDateTimePicker.UpdateRecord;
var lastModified: boolean;
begin
  lastModified:= modified;
  try
    FDataLink.UpdateRecord;
  except
    HighlightToken(FDateTime);
    SetFocus;
    modified:= lastModified;
    raise;
  end;
end;

procedure TwwDBCustomDateTimePicker.DropDown;
var
  P: TPoint;
  X, Y: Integer;
  Rect:TRect;
  WinAttribute: HWnd;
  ButtonWidth: integer;
  alreadycreated:boolean;
  WorkAreaRect:TRect;
begin
  if isDroppedDown then exit;

  {10/29/98 - If datasource not enabled then exit }
  if (FDatalink.field=nil) and ((datasource<>nil) or (datafield<>'')) then exit;

  {12/1/98 - If this is a time only field then don't dropdown}
  if isTimeOnlyField then exit;

  if (not CanEdit) then
  begin
     HideCaret(Handle);
     inherited ReadOnly:= True;
     exit;
  end
  else inherited ReadOnly:= False;

  DateTimeBeforeDropDown:= FDateTime;
  
  if FinDigitEdit then InDigitEditUpdateRecord; { RSW - Need to save InDigitEdit changes }
  FinDigitEdit:= False; { RSW }
  HideCaret(Handle); { RSW }

  P := Parent.ClientToScreen(Point(Self.Left,Self.Top));
  Y := P.Y + Self.Height - 1;
  if (FCalendar= nil) then begin
     FCalendar:= TwwPopupCalendar.Create(Self);
     alreadycreated:= False;
  end
  else alreadycreated := True;

  with FCalendar do begin
    if not alreadycreated then begin
      Visible := False;
      Parent := self; //GetParentForm(self); //GetDesktopWindow;
    end;
    FCalendar.BorderStyle := bsSingle;
    FCalendar.CalColors.Assign(FCalendarOptions.Colors);
    FCalendar.OnCalcBoldDay := FOnCalcBoldDay;
    FCalendar.Options := FCalendarOptions.Options;
    FCalendar.MaxDate:=GetValidMaxDate;
    FCalendar.MinDate:=GetValidMinDate;
    FCalendar.Font := FCalendarOptions.Font;
    FCalendar.PopupYearOptions := FCalendarOptions.PopupYearOptions;
    FCalendar.FirstDayOfWeek := FCalendarOptions.FirstDayOfWeek;

    MonthCal_GetMinReqRect(Handle,Rect);

    if (Self.Text = '') or (FDateTime = 0.0) then begin
//       DateTime := Now;
       EnableEdit;
       SetModified(True);
       if self.text='' then self.DateTime := sysutils.date; { RSW - 11/5/98 - Check if text is still blank}
    end;

    Self.Text := GetDateTimeDisplayText(FDateTime);

    { 3/27/99 -  If developer indirectly causes control to exit upon dropping down,
      then FCalendar is nil.  This could happend for instance with code in the AfterInsert
      event of the dataset. Exit control in this case as it doesn't have the focus}
    if FCalendar=nil then exit;
    FCalendar.DateTime := Trunc(FDateTIme) + Frac(FDateTime);

    selstart := 0;
    sellength := 0;
//    HighlightToken(DateTime);

    if Assigned(FOnDropDown) then FOnDropDown(Self);
    self.ShowHint := False;
    if (FCalendarOptions.Height = 0) or (Rect.Bottom > FCalendarOptions.Height) then
       FCalendar.Height := Rect.Bottom
    else FCalendar.Height := FCalendarOptions.Height;

    if (FCalendarOptions.Width = 0) or (Rect.Right > FCalendarOptions.Width) then
       FCalendar.Width := Rect.Right
    else FCalendar.Width := FCalendarOptions.Width;

    SystemParametersInfo(SPI_GETWORKAREA,0,@WorkAreaRect,0);
    if Y + FCalendar.Height > WorkAreaRect.Bottom then
       if (P.Y-FCalendar.Height) > 0 then
          Y := P.Y - FCalendar.Height;
    if FCalendarOptions.Alignment = wwdtaLeft then begin
       X := P.X ;
       if P.X + FCalendar.Width >= Screen.Width then X := P.X + Self.Width - 1 - FCalendar.Width;
    end
    else if FCalendarOptions.Alignment = wwdtaRight then begin
       ButtonWidth := max(GetSystemMetrics(SM_CXVSCROLL), 15);
       X := P.X + Self.Width - ButtonWidth - FCalendar.Width - 1;
       if P.X + FCalendar.Width >= Screen.Width then X := P.X + Self.Width - 1 - FCalendar.Width;
    end
    else begin
       ButtonWidth := max(GetSystemMetrics(SM_CXVSCROLL), 15);
       X := P.X + Trunc((Self.Width - FCalendar.Width -ButtonWidth-1)/2);
       if P.X + FCalendar.Width >= Screen.Width then X := P.X + Self.Width - 1 - FCalendar.Width;
    end;

    if not (alreadyCreated) then begin { RSW - add 1 }
//       WinAttribute:= HWND_TOP;
       WinAttribute:= HWND_TOPMOST; { RSW 7/20/98}
       SetWindowPos(FCalendar.Handle, WinAttribute, X+1, Y, FCalendar.Width,FCalendar.Height,
          {  SWP_NOSIZE or} SWP_NOACTIVATE or SWP_SHOWWINDOW);
    end;

    Visible := True;
    if (alreadycreated) then begin
//       WinAttribute:= HWND_TOP;
       WinAttribute:= HWND_TOPMOST; { RSW 7/20/98}
       SetWindowPos(FCalendar.Handle, WinAttribute, X+1, Y, FCalendar.Width,FCalendar.Height,
        {  SWP_NOSIZE or} SWP_NOACTIVATE or SWP_SHOWWINDOW);
       FCalendar.BringToFront;
    end;
  end;
  {$ifdef wwDelphi3up}
  if wwHook=0 then
     wwHook := SetWindowsHookEx(WH_MOUSE, @wwHookProc, HINSTANCE, GetCurrentThreadID);
  {$endif}
//  SetCapture(FCalendar.Handle);
end;

procedure TwwDBCustomDateTimePicker.CloseUp(Accept: Boolean);
var
  DateValue: String;
  tempDate:TDate;
begin
  if FInCloseUp then exit;
  FInCloseUp := True;

  try
  if (FCalendar <> nil) and FCalendar.Visible then
  begin
    DateValue:= '';
    if GetCapture <> 0 then SendMessage(GetCapture, WM_CANCELMODE, 0, 0);

    if Accept then begin
       tempDate := FCalendar.Date;
       DateValue := GetDateTimeStoredText(FCalendar.Time);
    end
    else begin
       tempDate:= 0;
       DateValue:= '';
    end;

    SetWindowPos(FCalendar.Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or
      SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);
    FCalendar.Visible := False;

    if Accept then
    begin
      if (FDataLink.Field <> nil) and
         (DateValue<>GetDateTimeStoredText(FDataLink.Field.AsDateTime)) and
         EditCanModify then
      begin
         if DateValue<>'' then begin
            Date:=tempDate;
         end
         else Text := '';
         SetModified(True);
      end;
    end
    else
      DateTime:= DateTimeBeforeDropDown;

    if Assigned(FOnCloseUp) then FOnCloseUp(Self);
    self.ShowHint := True;
    ShowCaret(Handle);
    HideCaret(Handle);
    invalidate;
    HighlightToken(DateTime);
    SelectAll; { 6/29/99 - Select all when closing up }
 end;

  finally
    { 11/15/98 - Add finally block in case of exception }
    FInCloseUp := False;

    {$ifdef wwDelphi3up}
    if wwHook<>0 then
    begin
       UnhookWindowsHookEx(wwHook);
       wwHook:= 0;
    end;
    {$endif}
  end;
end;

procedure TwwDBCustomDateTimePicker.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then begin
    DataSource := nil;
  end;
end;

procedure TwwDBCustomDateTimePicker.DataChange(Sender: TObject);
begin
  if (FDataLink.Field<>Nil) then begin
    if FAlignment <> FDataLink.Field.Alignment then
    begin
      Text := '';  {forces update}
      FAlignment := FDataLink.Field.Alignment;
    end;

    if (FDatalink.Field.isNull) then begin
        DateTime := 0.0;
        Text := '';//GetDateTimeStoredText(FDataLink.Field.AsDateTime);
        ShowCaret(Handle); { 12/16/98 - RSW Show caret if null }
        //10/22/98 - Handled Editing bug when dataset cancels or inserts.
        if (datasource<>nil) and (datasource.state in [dsBrowse,dsInsert]) then
        begin
           FPos := 1;
           SelectAll;
        end;
    end
    else begin
       FDateTime := TDateTime(FDataLink.Field.Value);
       Text := GetDateTimeStoredText(FDateTime);

        //10/22/98 - Handled Editing bug when dataset cancels or inserts.
       if (datasource<>nil) and (datasource.state = dsBrowse) then
       begin
          FPos := 1;
          SelectAll;
       end;

       invalidate; { 8/1/98 -  RSW - Repaint based on new FDateTime (fixes bug when embedded in grid}
    end;

    if Text = '' then begin
       Text := GetDateTimeStoredText(FDataLink.Field.AsDateTime);//??????
       ShowCaret(Handle);  //Make sure cursor is visible for null dates
       update;
    end;
  end
  else FAlignment := taLeftJustify;

  if (FDatalink.field=nil) and ((Datasource <> nil) or (DataField <> '')) then
  begin
     refreshtext;
     if focused then ShowCaret(Handle);
  end;
end;

procedure TwwDBCustomDateTimePicker.UpdateData(Sender: TObject);
  Function isNonPhysicalField(thisField: TField): boolean;
  begin
     result:=  thisfield.calculated or thisfield.lookup;
  end;
begin
  if inherited ReadOnly then exit;

  if modified then begin
     if FDataLink.editing or isNonPhysicalField(FDataLink.Field) then begin
        if IsDateOnlyField then
        begin
           DateTime := FDateTime;
           FDateTime:= Trunc(FDateTime) + Frac(FDataLink.Field.asDateTime);
           if FDateTime=0.0 then FIsCleared:= True;
        end
        else if IsTimeOnlyField then
        begin
           FDateTime:= Trunc(FDataLink.Field.asDateTime) + Frac(FDateTime);
           if (FDateTime=0.0) and (Text='') then FDataLink.Field.Clear
           else //FIsCleared:= True; {!!!}
              FDataLink.Field.asDateTime := FDateTime;
           exit;
        end;

        if (FDateTime <> 0.0) then
           FDataLink.Field.asDateTime := FDateTime
        else if FIsCleared then begin
           FDatalink.Field.Clear;
        end;
     end;
  end
end;

procedure TwwDBCustomDateTimePicker.HandleDropDownKeys(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_UP, VK_DOWN:
      if ssAlt in Shift then
      begin
        if isDroppedDown then CloseUp(True)
        else DropDown;
        Key := 0;
      end;
    VK_RETURN, VK_ESCAPE:
      if isDroppedDown and not (ssAlt in Shift) then
      begin
        CloseUp(Key = VK_RETURN);
        SkipEscapeReset:= (key=vk_escape);
        Key := 0;
      end;
  end;
end;

procedure TwwDBCustomDateTimePicker.CNKeyDown(var Message: TWMKeyDown);
var shiftState: TShiftState;
begin
  { RSW - only closeup control instead of allowing form to close for modal dialog}
  if not (csDesigning in ComponentState) then
    with Message do
    begin
       if (FDataLink.Field<>Nil) and (FDataLink.Field.Required) and
          (charcode = VK_DELETE) then exit;
       if (charcode = VK_TAB) and IsDroppedDown then Closeup(True)
       else if isDroppedDown and
          ((charcode=vk_return) or (charcode=vk_escape)) then
       begin
          exit;
       end
    end;

  if not (csDesigning in ComponentState) then
  begin
    with Message do
    begin
       shiftState:= KeyDataToShiftState(KeyData);
{       if (WantReturns) and (charcode=vk_return) and  //Ctrl-Enter goes to grid
           not (ssCtrl in shiftState) then exit;}

       if (charcode = VK_TAB) or (charcode = VK_RETURN) then begin
          if parent is TCustomGrid then begin
            if (charcode <> VK_TAB) or (goTabs in TCheatGridCast(parent).Options) then {7/3/97}
            begin
               parent.setFocus;
               if parent.focused then { Bug fix - Abort in validation prevents focus change }
                 TCheatGridCast(parent).KeyDown(charcode, shiftState);
               exit;
            end
          end
       end

(*       if (charcode = VK_TAB) or (charcode = VK_RETURN) then begin
          if IsInGrid(self) then begin
            if (charcode <> VK_TAB) or(dgTabs in (wwGetGridOptions(self)))then
            begin
               parent.setFocus;
               if parent.focused then { Bug fix - Abort in validation prevents focus change }
                  SendMessage(Parent.handle,wm_keydown,charcode,0);
               exit;
            end
          end
       end
*)
    end
  end;

  inherited;
end;

procedure TwwDBCustomDateTimePicker.GetFirstLastDayOfWeek(var first:integer;var last:integer);
var TempA: array[0..1] of char;
begin
   if CalendarAttributes.FirstDayOfWeek = wwdowLocaleDefault then
   begin
      GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_IFIRSTDAYOFWEEK, TempA, SizeOf(TempA));
      First := Ord(TempA[0]) - Ord('0')+2;
      if First = 8 then First := 1;
   end
   else begin
      if CalendarAttributes.FirstDayOfWeek = wwdowSunday then
         First := 1
      else First := Ord(CalendarAttributes.FirstDayOfWeek)+2;
   end;

   if First-1 < 1 then  //Get last day of week
      Last := 7
   else Last := First-1;
end;

procedure TwwDBCustomDateTimePicker.KeyDown(var Key: Word; Shift: TShiftState);
type TSelection = record
    StartPos, EndPos: Integer;
  end;

var s,token,zeropad:string;
    startpos,len:integer;
    d,y,m:word;
    h,n,sec,msec:word;
//    tempm,tempd,tempy:word;
    mind,miny,minm:word;                     {Max or min day, year, month}
    md,my,mm:word;
    amaxdate,amindate,tempdate:TDateTime;
    maxday:word;
//    digit:word;
    newnumber:integer;
//    ts:TTimeStamp;
    temptime:TDateTime;
    datecode,FirstDay,LastDay:Integer;
    resetflag:boolean;
    PrevInDigitEdit: boolean;

  Function IsValidChar(key: word): boolean;
  begin
    result:= (key = VK_BACK) or (key=VK_SPACE) or (key=VK_DELETE) or (key=VK_RIGHT) or {9/10/98}
             ((key >= ord('0')) and (key<=VK_DIVIDE)) or
             (key>VK_SCROLL);
  end;

  Procedure IncDate(token:string;amount:integer;wrapdate:boolean);
  var NewDate:TDateTime;
      maxdays,tempd,tempy,tempm:word;
      firstdayflag,lastdayflag:integer;
      {wrapdate corresponds to wrapping within the given token
       so that the other date elements do not change}
  begin
   if AnsiPos(String('d'),token)=1 then begin
     {7/7/98 - Wrap Days of Week within current week when going up or down a single day.  pw}
     if (abs(amount) = 1) and ((token = 'ddd') or (token = 'dddd')) then begin
        GetFirstLastDayOfWeek(firstdayflag,lastdayflag);
        if Amount = 1 then begin //Going to the next day
           if DayOfWeek(Trunc(DateTime))=LastDayFlag then
           begin
              if LessThanOrEqual(aMinDate,Trunc(DateTime)-6) then
                 NewDate := Trunc(DateTime)-6
              else NewDate := aMinDate;
           end
           else begin
              if LessThanOrEqual(Trunc(DateTime)+1,aMaxDate) then
                 NewDate := Trunc(DateTime)+1
              else begin
                NewDate := aMaxDate;
              end;
           end;
        end //Going down a day (previous day)
        else begin
           if DayOfWeek(Trunc(DateTime))=FirstDayFlag then
           begin
              if LessThanOrEqual(Trunc(DateTime)+6,aMaxDate) then
                 NewDate := Trunc(DateTime)+6
              else NewDate := aMaxDate;
           end
           else begin
              if LessThanOrEqual(aMinDate,Trunc(DateTime)-1) then
                 NewDate := Trunc(DateTime)-1
              else NewDate := aMinDate;
           end;
        end;

        DecodeDate(NewDate,y,m,d);//Finished so set new year, month, day, and then exit.
        exit;
     end;

     NewDate := Trunc(DateTime);
     //If the new date will be less than the mindate then exit;
     if (NewDate < 0) and (LessThanOrEqual(Newdate+amount,Trunc(aMinDate)-1)) then exit;
     //If the new date will be greater than the max date then exit;
     if (NewDate > 0) and (not (LessThanOrEqual(NewDate+amount,Trunc(aMaxDate)))) then exit;
     NewDate:= NewDate+amount;

     DecodeDate(NewDate,tempy,tempm,tempd);

     if (amount > 0) then begin
        if LessThanOrEqual(NewDate,aMaxDate) or WrapDate then
        begin
            if not wrapdate then begin
               y:= tempy;
               m:= tempm;
               d:=tempd;
            end
            else begin
{               if not LessThanOrEqual(NewDate,aMaxDate) or
                  (tempm<>m) then
               begin
                  if (y=miny) and (m=minm) then
                    d:=mind
                  else begin
                    d:=1;
                  end;
               end
               else }
               if not LessThanOrEqual(NewDate,aMaxDate) then begin
                  DecodeDate(aMaxDate,y,m,d);
               end
               else d:=tempd
            end;
        end
     end
     else begin
        if LessThanOrEqual(aMinDate,NewDate) or wrapdate then
        begin
           if not wrapdate then begin
              y:= tempy;
              m:= tempm;
              d:=tempd;
           end
           else begin
{               if not LessThanOrEqual(aMinDate,NewDate) or
                  (tempm<>m) then
               begin
                  if (y=my) and (m=mm) then
                    d:=md
                  else d:= DaysThisMonth(m,y);
               end}
               //1/8/98 - Handle Wrapping of day to max day of current month.
               if d > (abs(amount) mod DaysThisMonth(m,y)) then
                   tempd := d-(abs(amount) mod DaysThisMonth(m,y))
               else
                   tempd := DaysThisMonth(m,y)-((abs(amount) mod DaysThisMonth(m,y))-d);

               NewDate := EncodeDate(y,m,tempd);

               if not LessThanOrEqual(aMinDate,NewDate) then
                  DecodeDate(aMinDate,y,m,d)
               else if not LessThanOrEqual(NewDate,aMaxDate) then
                  DecodeDate(aMaxDate,y,m,d)
               else d:=tempd
            end;
        end;
     end;
   end
   else if AnsiPos(String('m'),token)=1 then begin
     NewDate:= (Trunc(DateTime));
     DecodeDate(NewDate,tempy,tempm,tempd);
     try
        NewDate := IncMonth(NewDate,amount);
     except
        exit;
     end;
     DecodeDate(NewDate,tempy,tempm,tempd);

     if (amount > 0) then begin
        if LessThanOrEqual(NewDate,aMaxDate) or wrapdate then begin
            if not wrapdate then begin
               y:= tempy;
               d:= tempd;
               m := tempm;
            end
            else begin
               //Set To MaxDate if exceeds MaxDate.
               if not LessThanOrEqual(NewDate,aMaxDate) then
               begin
                 DecodeDate(aMaxDate,y,m,d);
               end
               else m:=tempm;
               // Remove wrapping when scrolling past maxdate
{               if not LessThanOrEqual(NewDate,aMaxDate) or
                  (tempy<>y) then
               begin
                  if y<>miny then
                    m:=1
                  else begin
                    m:=minm;
                    if (d<mind) and ((my<> miny) and (mm<>minm)) then m:=minm+1;
                  end;
               end
               else m:=tempm;}
            end;
        end
     end
     else begin
        if LessThanOrEqual(aMinDate,NewDate) or wrapdate then
        begin
          if not wrapdate then begin
             y:= tempy;
             d:= tempd;
             m:=tempm;
          end
          else begin
             {if not LessThanOrEqual(aMinDate,NewDate) or
                   (tempy<>y) then
             begin
                if y<>my then
                  m:=12
                else begin
                  m:=mm;
                  if (d>md) and ((my<> miny) and (mm<>minm)) then m:=mm-1;
                end;
             end
             else }
             if not LessThanOrEqual(aMinDate,NewDate) then begin
                DecodeDate(aMinDate,y,m,d);
             end
             else m:=tempm;
          end;
        end
     end;
   end
   else if AnsiPos(String('y'),token)=1 then begin
     NewDate:= (Trunc(DateTime));
     try
        NewDate := IncMonth(NewDate,12*amount);
     except
        exit;
     end;

     DecodeDate(NewDate,tempy,tempm,tempd);
     maxdays:=DaysThisMonth(tempm,tempy);

     if (amount > 0) then begin     {Adding to Year}
        if LessThanOrEqual(NewDate,aMaxDate) or wrapdate then begin
            if not wrapdate then begin
               d:=tempd;
               m:=tempm;
               y:= tempy;
            end
            else begin
               // 7/7/98 - Remove wrapping when scrolling past maxdate
{               if not LessThanOrEqual(NewDate,aMaxDate) then
               begin
                  y:=miny;
                  if (my<>miny) and
                     ((m<minm) or ((m=minm) and (d<mind))) then y:=miny+1;
               end
               else}
               if not LessThanOrEqual(NewDate,aMaxDate) then
               begin
                 DecodeDate(aMaxDate,y,m,d);
                 maxdays:=DaysThisMonth(m,y);
               end
               else y:=tempy;

               if d>maxdays then d:=maxdays;
            end
        end
     end
     else begin                {Subtracting from Year}
        if LessThanOrEqual(aMinDate,NewDate) or wrapdate then begin
            if not wrapdate then begin
               d:=tempd;
               m:=tempm;
               y:= tempy;
            end
            else
            begin
               // 7/7/98 - Remove wrapping when scrolling past mindate
{               if not LessThanOrEqual(aMinDate,NewDate) then
               begin
                  y:=my;
                  if (my<>miny) and
                     ((m>mm) or ((m=mm) and (d>md))) then y:=my-1;
               end
               else }
               if not LessThanOrEqual(aMinDate,NewDate) then begin
                 DecodeDate(aMinDate,y,m,d);
                 maxdays:=DaysThisMonth(m,y);
               end
               else y:=tempy;

               if d>maxdays then d:=maxdays;
            end;
        end
     end;
   end
  end;

  procedure GetNextMonth;
  var i:integer;
      tempm:word;
  begin
     if (token <> 'mmm') and (token <> 'mmmm') then begin
        exit;
     end;

     tempm:=m;
     for i:= tempm +1 to 12 do begin
       if ((token = 'mmm') and (AnsiPos(String(Char(Key)),ShortMonthNames[i])=1)) or
          ((token = 'mmmm') and (AnsiPos(String(Char(Key)),LongMonthNames[i])=1)) then
       begin
          incdate(token,i-tempm,False);
          break;
       end
     end;

     if (m=tempm) then begin
        for i:= 1 to tempm-1 do begin
          if ((token = 'mmm') and (AnsiPos(String(Char(Key)),ShortMonthNames[i])=1)) or
             ((token = 'mmmm') and (AnsiPos(String(Char(Key)),LongMonthNames[i])=1)) then
          begin
             incdate(token,i-tempm,False);
             if m <>tempm then break;
          end;
       end;
     end;
  end;

  // Used when toggling on Day names 'ddd' and 'dddd'
  procedure GetNextDay;
  var i:integer;
      tempd:word;
      FirstDayFlag,LastDayFlag:integer;
      TempDate:TDateTime;
      daycount:integer;
      numdaystofirst:integer;
  begin
     if (token <> 'ddd') and (token <> 'dddd') then begin
        exit;
     end;
     GetFirstLastDayOfWeek(firstdayflag,lastdayflag);
     tempd:=d;
     if DayOfWeek(DateTime) = 7 then i:= 1
     else i:= DayOfWeek(DateTime)+1;

     daycount:=1;
     while (i <> firstdayflag) do begin
       if ((token = 'ddd') and (AnsiPos(String(Char(Key)),ShortDayNames[i])=1)) or
          ((token = 'dddd') and (AnsiPos(String(Char(Key)),LongDayNames[i])=1)) then
       begin
          TempDate := Trunc(DateTime)+daycount;
          if LessThanOrEqual(TempDate,AMaxDate) then
          begin
             DecodeDate(TempDate,y,m,d);
          end; // Else don't change current date.
          break;
       end;
       if i=7 then i:=1
       else i:=i+1;
       daycount := daycount+1;
     end;

     if d=tempd then begin
       numdaystofirst:=0;
       i:= DayOfWeek(DateTime);
       while i<>FirstDayFlag do begin
          if i = 1 then i:=7
          else i:= i-1;
          numdaystofirst := numdaystofirst+1;
       end;
       i:= FirstDayFlag;
       daycount := 0;
       while (i <> DayOfWeek(DateTime)) do begin
          if ((token = 'ddd') and (AnsiPos(String(Char(Key)),ShortDayNames[i])=1)) or
             ((token = 'dddd') and (AnsiPos(String(Char(Key)),LongDayNames[i])=1)) then
          begin
             TempDate := Trunc(DateTime)-numDaysToFirst+daycount;
             if LessThanOrEqual(TempDate,AMaxDate) and
                LessThanOrEqual(AMinDate,TempDate) then
             begin
                DecodeDate(TempDate,y,m,d);
             end; // Else don't change current date.
             break;
          end;
          if i=7 then i:=1
          else i:= i+1;
          daycount := daycount+1;
       end;
     end;
  end;

  function IsLetter(Ch: Char): Boolean;
  begin
     { 8/24/98 - Remove check for uppercase as it prevents Alt- F4 from closing form}
     result:= ((ch>='A') and (ch<='Z'))
//                or ((ch>='a') and (ch<='z'));
  end;

  function IsIntlLetter(Ch:char):Boolean;
  begin
    result:= (IsLetter(Ch)) or (ord(ch)>128)
  end;

  function IsNumber(ch: Char): Boolean;
  begin
     result:= (ch>='0') and (ch<='9');
  end;


  Function GetNextAMPM:word;
  var newh:word;
  begin
    if (AnsiStrComp(PChar(AnsiUpperCase(token)),PChar(AnsiUpperCase('am/pm')))<>0) and
       (AnsiStrComp(PChar(AnsiUpperCase(token)),PChar(AnsiUpperCase('a/p')))<>0) and
       (AnsiStrComp(PChar(AnsiUpperCase(token)),PChar(AnsiUpperCase('ampm')))<>0) then
    begin
       result := h;
       exit;
    end;

    newh:=h;
    if (AnsiStrComp(PChar(AnsiUpperCase(token)),PChar(AnsiUpperCase('am/pm')))=0) or
       (AnsiStrComp(PChar(AnsiUpperCase(token)),PChar(AnsiUpperCase('a/p')))=0) then
    begin
      if (newh<12) and
         (AnsiPos(AnsiUpperCase(String('p')),AnsiUpperCase(Char(key))) = 1) then
         newh:=newh+12
      else if (newh>=12) and { !!!! - Changed from >12 }
         (AnsiPos(AnsiUpperCase(String('a')),AnsiUpperCase(Char(key))) = 1) then
         newh:=newh-12;
    end
    else
    begin
      if (AnsiUpperCase(TimePMString)[1]<>AnsiUpperCase(TimeAMString)[1]) then begin
        if (newh<12) and
           (AnsiPos(AnsiUpperCase(TimePMString)[1],AnsiUpperCase(Char(key)))=1) then
           newh:=newh+12
        else if (newh>=12) and
           (AnsiPos(AnsiUpperCase(TimeAMString)[1],AnsiUpperCase(Char(key)))=1) then
           newh:=newh-12;
      end
      else begin
           if newh>=12 then newh:=newh-12
           else newh:=newh+12;
      end;
    end;
    result := newh;
  end;

  function GetNewDateTimeValue(var flag:boolean):integer;
  var newnum,j:integer;
//      tempyear:integer;
      curselstart:integer;
      cursellength:integer;
      tempyeartext:string;
      oldy,oldm,oldd:word;

     function SingleDigitOnly : boolean;
     var b:boolean;
         str:string;
     begin
       b:=False;
       if token='' then begin { 8/14/98 }
          result:= False;
          exit;
       end;
       case AnsiUpperCase(token[1])[1] of
         'M': if (newnum>1) then b:=true;
         'D': if (newnum>3) {or ((newnum=3) and (DaysThisMonth(m,y)<30))} then b:=True;
              {12/7/98 - Allow 3 to go to inplaceedit on months < 30}
         'H': begin
                str := getformatstr;
                if isAMPM(str) then begin
                   if (newnum>1) then b:=True;
                end
                else begin
                   if (newnum>2) then b:=True;
                end;
              end;
         'N': if (newnum>5) then b:=True;
         'S': if (newnum>5) then b:=True;
       end;
       result := b;
     end;

     function ValidValue : boolean;
     var b:boolean;
         str:string;
         CheckDate:TDate;
         temp2Year:Integer;
         tempmonth,tempday:Word;
     begin
       b:=False;
       if token='' then begin { 8/14/98 }
          result:= False;
          exit;
       end;
       case AnsiUpperCase(token[1])[1] of
         'M': if (newnum > 0) and (newnum<=12) then //11/30/1998 - Add check to make sure month > 0
              begin //9/10/98-Added check to make sure that the month is valid for current date values

                 { 3/15/99 - Handle 2/29/LeapYear data entry }
                 str:= GetFormatStr;
                 if (d=29) and (newnum=2) and (not IsLeapYear(y)) and
                    (AnsiPos('M', AnsiUpperCase(str)) < AnsiPos('Y', AnsiUpperCase(str))) then // Day format first
                 begin
                    y:= ((y+4) div 4) * 4;
                    if not isLeapYear(y) then y:= y + 4;
                 end;

                tempmonth := newnum;
                if d>DaysThisMonth(newnum,y) then {9/29/98 }
                   d:= DaysThisMonth(newnum,y);
                CheckDate := EncodeDate(y,tempmonth,d);
                if LessThanOrEqual(aMinDate,CheckDate) and
                   LessThanOrEqual(CheckDate,aMaxDate) then
                   b:=True;
              end;

          { 12/6/98 RSW - Change logic so that month adjust to day if
            display format has day before month }
         'D': if (newnum > 0) and (newnum<=31) then
              begin
                 str:= GetFormatStr;
                 {2/3/1999 PYW - Use AnsiPos instead of Pos.  Otherwise, won't find 'M' correctly}
                 {3/3/99 - Make search case insensitive for 'M' }
                 if (AnsiPos('d', str) < AnsiPos('M', AnsiUpperCase(str))) and { Day format first }
                    (newnum>DaysThisMonth(m,y)) then
                 begin
                    m:= 1;
                    while (m<=12) and (newnum>DaysThisMonth(m,y)) do begin
                       inc(m);
                    end;
                 end;

                 { Handle 2/29/LeapYear data entry }
                 if (newnum=29) and (m=2) and (not IsLeapYear(y)) and
                    (AnsiPos('d', str) < AnsiPos('Y', AnsiUpperCase(str))) then // Day format first
                 begin
                    y:= ((y+4) div 4) * 4;
                    if not isLeapYear(y) then y:= y + 4;
                 end;

                 if (newnum<=DaysThisMonth(m,y)) then
                 begin
                    tempday := newnum;
                    CheckDate := EncodeDate(y,m,tempday);
                    if LessThanOrEqual(aMinDate,CheckDate) and
                      LessThanOrEqual(CheckDate,aMaxDate) then
                      b:=True;
                 end
              end;

         'Y': if (token = 'yy') then begin
                temp2Year := newnum;
                if wwDoEncodeDate( { 3/8/99}
                    Get4DigitFrom2DigitYear(temp2year,m,d,FEpoch), m,d, TempDate) then
                begin
                   CheckDate := EncodeDate(Get4DigitFrom2DigitYear(temp2year,m,d,FEpoch),m,d);
                {if temp2Year >= FEpoch then
                   CheckDate := EncodeDate((getcurmillenium*100)+newnum,m,d)
                else
                   CheckDate := EncodeDate(((getcurmillenium+1)*100)+newnum,m,d);}

                   if LessThanOrEqual(aMinDate,CheckDate) and
                      LessThanOrEqual(CheckDate,aMaxDate) then
                      b:=True;
                end
              end
              else if (token='yyyy') then begin
                if (newnum <> 0) and wwDoEncodeDate(newnum,m,d, TempDate) then { 3/8/99}
                begin
                   CheckDate:= EncodeDate(newnum,m,d);
                   if LessThanOrEqual(aMinDate,CheckDate) and
                     ((MaxDate = 0.0) or (LessThanOrEqual(CheckDate,aMaxDate))) then
                     b:=True;
                end;
              end;
         'H': begin
                str := getformatstr;
                if isAMPM(str) then begin
                   if (newnum <= 12) then b:= True;
                end
                else begin
                   if (newnum < 24) then b:= True;
                end;
              end;
         'N': if (newnum < 60) then b:= True;
         'S': if (newnum < 60) then b:= True;
       end;
       result := b;
     end;

  begin
  newnum:=-1;
  flag := false;

  if (token = 'dd') or (token = 'd') or
     (token = 'mm') or (token = 'm') or
     (token = 'hh') or (token = 'h') or
     (token = 'nn') or (token = 'n') or
     (token = 'ss') or (token = 's') or
     (token = 'yy') then begin
     if (selstart = startpos+1) then begin
         newnum := 10*(StrToInt(text[startpos+1]))+StrToInt(Char(Key));
         if ValidValue then
         begin           // 7/9/98 - pw - Modified to set text after setting new valid date.
            if (newnum = 0) and ((token = 'dd') or (token = 'd')) then begin
               newnum := d;
            end
            else if (newnum = 0) and ((token = 'mm') or (token = 'm')) then begin
               newnum := m;
            end;
            if token='yy' then
               newnum := Get4DigitFrom2DigitYear(newnum,m,d,FEpoch);
            case AnsiUpperCase(token[1])[1] of
              'M': m:= newnum;
              'D': d:= newnum;
              'Y': y:= newnum;
              'H': h:= newnum;
              'N': n:= newnum;
              'S': sec:= newnum;
            end;
            ReEncodeDateTime(y,m,d,h,n,sec,msec);
            RefreshText;
            HighlightToken(DateTime);
//            newnum := -1;
//            HighlightToken(DateTime);
  //          ShowCaret(Handle);
//            HideCaret(Handle);


            { RSW - Advancing to next part of date/time so update text }
//            Text:= GetDateTimeDisplayText(FDateTime);

{            selstart := startpos;
            sellength := 1;
            if (newnum = 0) and (token = 'h') then
            begin
               seltext := IntToStr(12)
            end
            else begin
               if (newnum = 0) and ((token = 'dd') or (token = 'd')) then begin
                  flag := True;
                  newnum := d;
                  if length(IntToStr(d)) = 1 then
                     seltext := '0'+IntToStr(d)
                  else seltext := IntToStr(d);
               end
               else if (newnum = 0) and ((token = 'mm') or (token = 'm')) then begin
                  flag := True;
                  newnum := m;
                  if length(IntToStr(m)) = 1 then
                     seltext := '0'+IntToStr(m)
                  else seltext := IntToStr(m);
               end
               else if (newnum = 0) and (token = 'yy') then seltext := '0'+IntToStr(newnum)
               else seltext := IntToStr(newnum);
            end;

            selstart := startpos;
            sellength := 2;
            ShowCaret(Handle);
            HideCaret(Handle);
            if token='yy' then
               newnum := Get4DigitFrom2DigitYear(newnum,m,d,FEpoch)}
         end
         else begin
           messageBeep(0);  //9/10/98 - Added beep on invalid value.
           newnum := -1;
         end;
     end
     else begin
         newnum := StrToInt(Char(Key));
         if (not SingleDigitOnly) then begin
             if (token = 'yy') then begin
                if not isvalid2year(newnum) then begin
                   result := -1;
                   exit;
                end;
             end;
             seltext := Char(Key);
             selstart := startpos+1;
             sellength := 0;
             ShowCaret(Handle);
             ShowCaret(Handle);
             FInDigitEdit := True;
         end
         else begin
             if (ValidValue) then begin //9/10/98 - Add check to see if this digit is valid
                if (length(token) = 2) then zeropad := '0';

                selstart:=startpos;
                sellength:=len;
                seltext := zeropad+Char(Key);
                selstart := startpos;

                if (length(token) = 2) then sellength := 2
                else sellength := 1;

                ShowCaret(Handle);
                HideCaret(Handle);
             end
             else begin //9/10/98 - Added beep on invalid value.
                messageBeep(0);
                newnum := -1;
             end;
         end;  {End if not SingledigitOnly}
     end;   {End Else}
   end  {End Selstart=startpos+1}
   else if (token='yyyy') then begin
      if (selstart = startpos+3) then begin
         newnum := 1000*(StrToInt(Text[startpos+1]))+
                   100*(StrToInt(Text[startpos+2])) +
                   10*(StrToInt(Text[startpos+3]))+
                   StrToInt(Char(Key));
         if ValidValue or (newnum = 0) then
         begin
            // 7/9/98 - pw - Modified to set text after setting new valid date.
            if newnum = 0 then begin
               // 7/9/98 - pw - Restore OldYear if only 0's are entered for year.
               DecodeDate(FoldDatetime,oldy,oldm,oldd);
               newnum := oldy;
            end;
            ReEncodeDateTime(y,m,d,h,n,sec,msec);
            RefreshText;
            HighlightToken(DateTime);
{            selstart := startpos;
            sellength := 3;
            seltext := IntToStr(newnum);
            selstart := startpos;
            sellength := 4;
            ShowCaret(Handle);
            HideCaret(Handle);}
         end
         else begin
           newnum := -1;
         end;
     end
     else begin
         newnum:=0;
         for j:= startpos to selstart-1 do
         begin
           newnum := 10*newnum+StrToInt(Text[j+1]);
         end;
         newnum:=10*newnum+StrToInt(Char(Key));
         if selstart = startpos then begin
            cursellength:=sellength;
            curselstart := selstart;
            selstart := startpos;
            sellength := cursellength;
         end
         else begin
//            cursellength:=sellength;
            curselstart:=selstart;
            selstart := startpos;
            sellength := curselstart-startpos;
         end;
         if (curselstart>startpos) and
            (length(IntToStr(newnum)) <= curselstart-startpos) then
         begin
            tempyeartext:='';
            for j:= startpos to curselstart-Length(IntToStr(NewNum)) do
              tempyeartext := tempyeartext+'0';
            if newnum = 0 then
               tempyeartext := tempyeartext + '0'
            else tempyeartext := tempyeartext + IntToStr(NewNum);
            seltext := tempyeartext;
            selstart := startpos+length(tempyeartext);
         end
         else begin
            seltext := IntToStr(Newnum);
            selstart := startpos+length(IntToStr(newnum));
         end;
         sellength := 0;
         ShowCaret(Handle);
         ShowCaret(Handle);
         FInDigitEdit := True;
     end;
   end;

   result := newnum;
end;

  procedure SendToParent;
  begin
    Parent.setFocus;
    if parent.focused then { 12/17/98 - Bug fix - Abort in validation prevents focus change }
       SendMessage(Parent.handle,wm_keydown,key,0);
    Key := 0;
  end;

  procedure ParentEvent;
  var
    GridKeyDown: TKeyEvent;
  begin
    { 1/25/99 - Prevent grid's OnKeyDown from firing twice when encounter tab or cr }
    if (Screen.ActiveControl<>self) and ((key=13) or (key=9)) then exit;

    GridKeyDown := TEdit(Parent).OnKeyDown;     //!!!!Should I do this
    if Assigned(GridKeyDown) then GridKeyDown(Parent, Key, Shift);
  end;

  function Ctrl: Boolean;
  begin
    Result := ssCtrl in Shift;
  end;

  function Alt: Boolean;
  begin
    Result := ssAlt in Shift;
  end;

  function Selection: TSelection;
  begin
    SendMessage(Handle, EM_GETSEL, Longint(@Result.StartPos), Longint(@Result.EndPos));
  end;

  function RightSide: Boolean;
  begin
    with Selection do
      Result := (EndPos = GetTextLen);
  end;

  function AllSelected: Boolean;
  begin
    with Selection do
      Result := (EndPos = GetTextLen) and (SelLength = Length(Text));
  end;

  function LeftSide: Boolean;
  begin
    with Selection do
      Result := (StartPos = 0);
  end;

  procedure Deselect;
  begin
    SendMessage(Handle, EM_SETSEL, -1, 0);
    selLength:= 0;  {7/8/97 - Forces text to move to the far left }
  end;

  { 10/29/98 - Don't close up drop-down calendar when encountering vk_left, vk_right } 
  function ForwardMovement: Boolean;
  begin
     Result := (dgAlwaysShowEditor in wwGetGridOptions(self)) and (not IsDroppedDown);
  end;

  //7/29/98 pyw Added a function to determine if the current token is on a
  //            time token string.
  function TokeninTimePortion:boolean;
  var atoken,previoustoken:string;
     apos,dummy1,dummy2:integer;
     dateflag:boolean;
  begin
    Result := False;
    dateflag := False;

    //Get the current token string for the current FPos
    apos:=FPos;
    getdatetimetoken(Datetime,apos,dummy1,dummy2,atoken);

    //If this is the first token and it is a date type token then you can exit
    if (FPos = 1) and ((AnsiUpperCase(atoken)[1]='D') or
                       (AnsiUpperCase(atoken)[1]='Y') or
                       (AnsiUpperCase(atoken)[1]='M')) then exit;

    //Get the previous token string for the current FPos
    apos:=FPos-1;
    getdatetimetoken(Datetime,apos,dummy1,dummy2,previoustoken);
    //Set the DateFlag if this is a Date Type Token.
    if (AnsiUpperCase(atoken)[1]='D') or
       (AnsiUpperCase(atoken)[1]='Y') or
       ((AnsiUpperCase(atoken)[1]='M') and (AnsiUpperCase(previoustoken)[1]<>'H')) then
       dateflag := True;

    // If this is a CFormat and the token is not a Date Type Token then
    // the current position must be in the time portion
    if IsCFormat and not dateflag then
       Result := True;
  end;

//12/2/98 - Added call to isDateTimeSeparator to correctly determine if a date or
//          time separator character was pressed.  TimeSeparator case was not working properly.
  function IsDateTimeSeparator:boolean;
  const SHIFT_SET = 256;  // If Hi order bit of VkKeyScan result is 1 (1 shl 8 => 256) then Shift is set for key
        SHIFTS: array[Boolean] of Integer = (0, SHIFT_SET);
  begin
    result := False;
    if (VkKeyScan(DateSeparator) = (SHIFTS[ssShift in Shift] or Key)) or
       (VkKeyScan(TimeSeparator) = (SHIFTS[ssShift in Shift] or Key)) then
       result := True;
  end;

begin  {Start of .KeyDown}
  { RSW }

  if GetKeyState(VK_MENU) < 0 then Include(Shift, ssAlt);
  HandleDropDownKeys(Key, Shift);

  if (IsInGrid(Self)) then begin
//  if (parent is TCustomGrid) then begin
     case Key of
       VK_ESCAPE: if not modified then SendToParent;
       VK_NEXT, VK_PRIOR: if (not IsDroppedDown) and (not Alt) then SendToParent;
       VK_LEFT: if ForwardMovement and (Ctrl or LeftSide) then SendToParent;
       VK_RIGHT: if ForwardMovement and (Ctrl or RightSide) then SendToParent;
       VK_UP,VK_DOWN: if (Ctrl or AllSelected) then SendToParent;
       VK_HOME: if ForwardMovement and (Ctrl or LeftSide and AllSelected) then SendToParent;
       VK_END: if ForwardMovement and (Ctrl or RightSide and AllSelected) then SendToParent;
       VK_INSERT: if not (ssShift in Shift) then SendToParent; {12/20/96 - Pass to grid only if insert only}
       VK_DELETE: if (Ctrl) then SendToParent;
       VK_F2:
         begin
           ParentEvent;
           if Key = VK_F2 then
           begin
             if Editable then Deselect;
             FPos:=1;      {When entering Edit Set to First Token}
             HighlightToken(DateTime);
             Exit;
           end;
         end;
       VK_Space:
     end;
     if (not CanEdit) and (Key in [VK_LEFT, VK_RIGHT, VK_HOME, VK_END]) then SendToParent;

     if Key <> 0 then
       ParentEvent;
  end;
  if (Key = 0) then exit;

  inherited KeyDown(Key, Shift);

//  if (Key=vk_delete) and (not AllSelected) then key :=0
//  else
  if (Key=vk_back) and (not AllSelected) then key:= vk_Left;

  { 10/29/98 - Don't process keystroke if datasource is not enabled }
  if (FDataLink.Field=nil) and ((datafield<>'') or (datasource<>nil)) then exit;

  if (FDataLink.Field<>Nil) and (FDataLink.Field.Required) then
  begin
     if (key=vk_back) or (key=vk_delete) then
     begin
        // 7/29/98- pw- Modified to allow Deletion of Time for CFormat Date Time fields.
        if not ((not AllSelected) and IscFormat and TimeShowing and TokeninTimePortion) then begin
            key:= 0; {Paul look at}
            exit;
        end;
     end
  end;

  // SelectAll if holding shift key and right key when on first token.
  if (FPos=1) and (ssShift in Shift) and (key = vk_right) then begin
     SelectAll;
     key:=0;
  end;

  if (not CanEdit){ and ((key <> vk_left) and (key <> vk_right)) }then
  begin
     inherited ReadOnly:= True;
     Key:=0;
  end
  else inherited ReadOnly:= False;

  if Key = 0 then exit;

  if (ssCtrl in Shift) then exit;
  if IsInGrid(Self) and (Key=VK_TAB) then exit; //Don't do anything with tab if in grid.

  zeropad := '';

  if (FCalendar = nil) or (not FCalendar.Visible)then
  begin
    if IsValidChar(key) and not (ssAlt in Shift) then  { 9/24/98- Don't init if alt key pressed }

    {8/26/98 - Support initialization of date after clearing with time not cleared}
    if (Text = '') and
       ((DateTime = 0.0) or
        (isDateOnlyField and (Trunc(DateTime)=0)) or
        (isTimeOnlyField and (Frac(DateTime)=0.0))) then
    begin
       EnableEdit;
       if IsTimeOnlyField then
       begin
          { 12/17/98 - Don't auto fill if digit encountered }
          if isnumber(Char(Key)) or ((key >=VK_NUMPAD0) and (key<=VK_NUMPAD9)) then
          begin
             Text := GetDateTimeDisplayText(0.0);
             FDateTime:= 0.0;
          end
          else begin
             Text := GetDateTimeDisplayText(sysutils.Time);
             FDateTime:= sysutils.Time;
          end
       end
       else begin
          {PYW -9/10/98- Initialize blank date to min or max when current date is out of range}
          if ((Trunc(FMinDate)=0) or (Trunc(sysutils.Date) >= FMinDate)) and
             (Trunc(FMaxDate)=0) or (Trunc(sysutils.Date) <= FMaxDate) then begin
             Text := GetDateTimeDisplayText(sysutils.Date); {RSW - Autofill date and time separately}
             FDateTime:= sysutils.Date;
          end
          else if (Trunc(sysutils.Date) > FMaxDate) then begin
             Text := GetDateTimeDisplayText(FMaxDate); {RSW - Autofill date and time separately}
             FDateTime := FMaxDate;
          end
          else begin
             Text := GetDateTimeDisplayText(FMinDate); {RSW - Autofill date and time separately}
             FDateTime := FMinDate;
          end;
       end;

       Setmodified(True);
       HighlightToken(DateTime);
       Fpos:=1;
    end
    else if (Text<>'') and (selText = Text) then { RSW - Don't allow all selection after keydown }
    begin
       Fpos:=1;
       HighlightToken(DateTime);
    end;

    if ssAlt in Shift then exit; { 8/24/98 - Ignore Alt key sequences }

{pw 6/26/98 - Changed Date/Time Seperators to AutoAdvance}
    Datecode := MapVirtualKey(Key, 2);

    { RSW - Support +/- and numeric keypad }
    case char(datecode) of
      '-': key:= vk_down;
     '+','=': key:= vk_up;
    end;

    if (key >=VK_NUMPAD0) and (key<=VK_NUMPAD9) then
       key:= ord('0') + KEY - VK_NUMPAD0;

//12/2/98 - Added call to isDateTimeSeparator to correctly determine if a date or
//          time separator character was pressed.  TimeSeparator case was not working properly.

    if (not (wwDTOAutoAdvance in Options) or Findigitedit) and
       isDateTimeSeparator then
      key := vk_Right;

    PrevInDigitEdit:= False; { Make compiler happy }

    if (Key=VK_DELETE) or (Key=VK_BACK) or
       (Key=VK_DOWN) or (Key=VK_UP) or
       (Key=VK_HOME) or (Key=VK_END) or
       isIntlLetter(Char(Key)) or isnumber(Char(Key)) then begin

       FIsCleared := False;
       if (ssShift in Shift) and ((Key=VK_END)or(Key=VK_HOME))then begin
         selstart:=0;
         sellength:=length(text);
         key:=0;
         exit;
       end;

       //1/8/98 - Added check to disable deleting while in digit edit mode.
       if (Key=vk_delete) and FInDigitEdit then begin
          key := 0;
          exit;
       end;

       if not (Key in [vk_delete, vk_back, vk_down, vk_up, vk_home, vk_end]) then begin
          PrevInDigitEdit:= FInDigitEdit;
          FInDigitEdit := False;
       end;

       { RSW }
       if (FDateTime=0.0) and (Key in [vk_home, vk_end, vk_up, vk_down]) then
          FDateTime:=sysutils.date;

       DecodeDate(DateTime,y,m,d);
       DecodeTime(DateTime,h,n,sec,msec);

       aMaxDate := GetValidMaxDate;
       DecodeDate(aMaxDate,my,mm,md);

       aMinDate := GetValidMinDate;
       DecodeDate(aMinDate,miny,minm,mind);

       s := getdatetimetoken(DateTime,FPos,startpos,len,token);

       EnableEdit;
    end;

    case key of
    VK_BACK,VK_DELETE:
       begin
          if not (FinDigitEdit) then begin
             if isTimeOnlyField and (FDatalink.Field <> nil) and (FDatalink.Field.Datatype = ftDateTime) then begin
                DateTime:=Trunc(DateTime);
                Text := '';
                Update;
                ShowCaret(Handle);
                FPos := 1;
                FIsCleared := True;
             end
             else if IsDateOnlyField then
             begin
                Date:= 0.0;
                ShowCaret(Handle);
                FPos := 1;    //6/25/99-PYW-Reset position on delete
             end
             //Clear DateTime unless Time is showing with a c DateTimeFormat.
             //Then just delete the time portion.   (7/7/98) pw
             //7/29/98 pyw Added a check to clear the date if user hits delete
             //            on a date token.
             else if not IscFormat or not(TimeShowing)
                or (not TokeninTimePortion) then begin
                DateTime := 0.0;
                Text := '';
                Update;
                ShowCaret(Handle);
                FPos := 1;
                FIsCleared := True;
             end
             else begin
                DateTime:=Trunc(DateTime);
                FPos:= GetMaxVisibleToken;
                HighlightToken(DateTime);
             end;
          end
          else
          begin
             if SelStart > StartPos then begin
               SelStart:=SelStart-1;
               SelLength:=1;
               SelText :='';
             end;
          end;
       end;
    VK_LEFT:
       begin
         InDigitEditUpdateRecord;
         if FPos > 1 then begin
            FPos := FPos-1;
            if GetMaxVisibleToken < FPos then
               FPos := GetMaxVisibleToken;
            HighlightToken(DateTime);
         end
         else begin
           FPos:=1;
           HighlightToken(DateTime);
         end;
       end;
    VK_RIGHT,VK_SPACE:
       begin
         if (FPos < GetMaxTokens(GetFormatStr)) then begin
            InDigitEditUpdateRecord;
            // 7/7/98 - Don't update time when Time has been cleared on CFormat
            if IscFormat and (FPos <= GetMaxVisibleToken) then
            begin
               s := getdatetimetoken(DateTime,FPos+1,startpos,len,token);
               if (Length(s)>Length(text)) then begin
                 EnableEdit;
                 if Trunc(DateTime)<>0 then begin
                     DecodeDate(DateTime,Y,m,d);
                     DecodeTime(Now,H,n,sec,msec);
                 end
                 else begin
                    DecodeDate(Now,Y,m,d);
                    h:=0;n:=0;sec:=0;msec:=0;
                 end;
                 ReEncodeDateTime(y,m,d,h,n,sec,msec);
                 maxday := DaysThisMonth(m,y);
                 if d>maxday then d:=maxday;

                 if (Trunc(EncodeDate(y,m,d)) >= 0) then
                    DateTime := Trunc(EncodeDate(y,m,d)) + Frac(EncodeTime(h,n,sec,msec))
                 else
                    DateTime := Trunc(EncodeDate(y,m,d)) - Frac(EncodeTime(h,n,sec,msec));
                 SetModified(True);
               end;
            end;
            FPos := FPos+1;
            // 7/7/98 - Make certain FPos is a visible token.
            if GetMaxVisibleToken < FPos then
               FPos := GetMaxVisibleToken;
            HighlightToken(DateTime);
         end
         else if FinDigitEdit and (FPos = GetMaxTokens(GetFormatStr)) then begin
            //Update if InDigitEdit when hitting an advance key on the last token.
            InDigitEditUpdateRecord;
            HighlightToken(DateTime);
         end;
       end;
    VK_UP:
       begin
          if FinDigitEdit then begin
             InDigitEditUpdateRecord; { RSW }
             DecodeDate(DateTime,y,m,d);
             DecodeTime(DateTime,h,n,sec,msec);
          end;

//          DecodeDate(DateTime,y,m,d);
//          DecodeTime(DateTime,h,n,sec,msec);

          if token<>'' then {8/14/98}
          case AnsiUpperCase(token[1])[1] of
           'D','M','Y': incdate(token,1,True);
           'H':begin
                 h:=h+1;
                 if h>23 then h:=0;
               end;
           'N':begin
                 n:= (n+Interval.MinutesInterval) mod 60; { RSW }
                 if Interval.RoundMinutes then
                    n := Interval.MinutesInterval * (n div Interval.MinutesInterval);
//                 if n>59 then n:=0;
               end;
           'S':begin
                 sec:=sec+1;
                 if sec>59 then sec:=0;
               end;
           'A':begin
                 if h>=12 then h:=h-12
                 else h:=h+12;
               end;
          end;
       end;
    VK_DOWN:
       begin
          if FinDigitEdit then begin
             InDigitEditUpdateRecord; { RSW }
             DecodeDate(DateTime,y,m,d);
             DecodeTime(DateTime,h,n,sec,msec);
          end;

          if token<>'' then {8/14/98}
          case AnsiUpperCase(token[1])[1] of
           'M','D','Y': incdate(token,-1,True);
           'H':begin
                 if h=0 then h:=23
                 else h:=h-1;
               end;
           'N':begin
                 if Interval.RoundMinutes then
                 begin
                    if (n mod Interval.MinutesInterval)=0 then
                       n:= (n+60-Interval.MinutesInterval) mod 60
                    else begin
                       n := Interval.MinutesInterval * (n div Interval.MinutesInterval)
                    end
                 end
                 else
                    n:= (n+60-Interval.MinutesInterval) mod 60;
{                 if n=0 then n:=59
                 else n:=n-1;}
               end;
           'S':begin
                 if sec=0 then sec:=59
                 else sec:=sec-1;
               end;
           'A':begin
                 if h<12 then h:=h+12
                 else h:=h-12;
               end;
          end;
       end;
    VK_HOME:
       begin
          if FinDigitEdit then begin
             InDigitEditUpdateRecord; { RSW }
             DecodeDate(DateTime,y,m,d);
             DecodeTime(DateTime,h,n,sec,msec);
          end;
          if token<>'' then {8/14/98}
          case AnsiUpperCase(token[1])[1] of
            'M': begin
                   if (y=miny) then begin
                     m:=minm;
                     if (d<mind) then m:=minm+1;
                   end
                   else m:=1;
                 end;
            'D': begin
                   if (token = 'ddd') or (token='dddd') then begin
                     TempDate:= DateTime;

                     //Changed to respect MonthCalendar's First Day of Week settings.
                     GetFirstLastDayOfWeek(firstday,lastday);
                     if DayOfWeek(TempDate) < (firstday+1) then begin
                        if LessThanOrEqual(aMinDate,(Trunc(TempDate)-(7+DayOfWeek(TempDate)-firstday-1))) then
                           TempDate := (Trunc(TempDate)-(7+DayOfWeek(TempDate)-firstday-1))
                        else TempDate := aMinDate;
                     end
                     else begin
                        if LessThanOrEqual(aMinDate,(Trunc(TempDate)-((DayOfWeek(TempDate)-firstday-1)))) then
                           TempDate := (Trunc(TempDate)-((DayOfWeek(TempDate)-firstday-1)))
                        else TempDate := aMinDate;
                     end;

                     if (Trunc(TempDate) >= 0) then
                       TempDate := Trunc(TempDate) + Frac(TempDate)
                     else
                       TempDate := Trunc(TempDate) - Frac(TempDate);

                     DecodeDate(TempDate,y,m,d);
                   end
                   else begin
                     if (y=miny) and (m=minm) then
                       d := mind
                     else d:=1;
                   end;
                 end;
            'Y': begin
                   y:=miny;
                   if (m<minm) or ((m=minm) and (d<mind)) then y:=miny+1;
                 end;
            'H': h:=0;
            'N': n:=0;
            'S': sec:=0;
            'A': if h>=12 then h:=h-12;
          end;
       end;
    VK_END:
       begin
          if FinDigitEdit then begin
             InDigitEditUpdateRecord; { RSW }
             DecodeDate(DateTime,y,m,d);
             DecodeTime(DateTime,h,n,sec,msec);
          end;

          if token<>'' then {8/14/98}
          case AnsiUpperCase(token[1])[1] of
          'M':begin
                if (y=my) then begin
                   m:=mm;
//                   if (d>md) then d := md;
                   if (d>md) then m:=m-1;
                end
                else m:=12;
              end;
          'D':begin
                if (token = 'ddd') or (token='dddd') then begin
                   {Home should go to Last Day of the Week}
                   TempDate:= DateTime;

                   GetFirstLastDayOfWeek(firstday,lastday);
                   if DayOfWeek(TempDate) <= lastday then begin
                      if LessThanOrEqual((Trunc(TempDate)+(lastday-DayOfWeek(TempDate))),aMaxDate) then
                         TempDate := (Trunc(TempDate)+(lastday-DayOfWeek(TempDate)))
                      else TempDate := aMaxDate;
                   end
                   else begin
                      if LessThanOrEqual((Trunc(TempDate)+(7-(DayOfWeek(TempDate)-lastday))),aMaxDate) then
                         TempDate := (Trunc(TempDate)+(7-(DayOfWeek(TempDate)-lastday)))
                      else TempDate := aMaxDate;
                   end;

                   if (Trunc(TempDate) >= 0) then
                     TempDate := Trunc(TempDate) + Frac(TempDate)
                   else
                     TempDate := Trunc(TempDate) - Frac(TempDate);
                   DecodeDate(TempDate,y,m,d);
                end
                else begin
                   maxday := DaysThisMonth(m,y);
                   if (y=my) and (m=mm) then
                      d := md
                   else d:=maxday;
                end;
              end;
          'Y':begin
                y:=my;
                if (m>mm) or
                   ((m=mm) and (d>md)) then y:=my-1;
{                if m>mm then m:=mm;
                if d>md then d:=md;}
              end;
          'H':h:=23;
          'N':n:=59;
          'S':sec:=59;
          'A':begin
                if h<12 then h:=h+12;
              end;
          end;
       end;
       VK_F2:
       begin
          HighlightToken(DateTime);
       end;
       else begin
          if IsIntlLetter(Char(key)) then
          begin
            s := getdatetimetoken(DateTime,FPos,startpos,len,token);
            if token='' then begin {8/14/98 }
               FInDigitEdit := PrevInDigitEdit;  { Invalid character so ignore }
               key:= 0;
            end
            else if (token = 'mmm') or (token = 'mmmm') then
               GetNextMonth
            else if (token = 'ddd') or (token = 'dddd') then
               GetNextDay
            else if AnsiUpperCase(token)[1] = AnsiUpperCase(String('a')) then
            begin
               h := GetNextAMPM;
            end
            else begin
               FInDigitEdit := PrevInDigitEdit;  { Invalid character so ignore }
               key:= 0;
            end
          end
          else if IsNumber(Char(key)) then
          begin
             newnumber := GetNewDateTimeValue(resetflag);
             if newnumber >=0 then begin
                if token<>'' then {8/14/98}
                case AnsiUpperCase(token[1])[1] of
                  'M': m:= newnumber;
                  'D': d:= newnumber;
                  'Y': y:= newnumber;
                  'H': h:= newnumber;
                  'N': n:= newnumber;
                  'S': sec:= newnumber;
                end;
                { RSW - Moved up so its not processed on illegal character }
                if (wwDTOAutoAdvance in Options) and (not resetflag) and
                   (not FInDigitEdit) and
                   (FPos <> GetMaxVisibleToken) then
                begin
                   ReEncodeDateTime(y,m,d,h,n,sec,msec);
                   FPos:=FPos+1;
                   HighlightToken(DateTime);
                end;

                { If inDigitEdit then value is never updated so update FDateTime now}
                if FInDigitEdit then begin
                   if isTimeOnlyField then FDateTime := EncodeTime(h,n,sec,msec)
                   else begin
//                      if (y=0) then begin
                      { 12/15/98 - RSW - When posting record, without exiting control, the
                        tfield value is not updated unless the FDateTime is updated now.
                        This code changed so that any 1 or 2 digit year will now immediately
                        update the FDateTime internal value  }
                      { 1/12/99 - Don't allow FDateTime to be beyond range }
                      { 1/19/99 - Update FDateTime whenver in InPlaceEdit mode }
                      if (y<=99) then
                         y:= Get4DigitFrom2DigitYear(y, m, d, FEpoch);

                      if (m>0) and (d>0){ 1/21/99 - Don't allow 0}
                         and wwDoEncodeDate(y,m,d, tempDate) then { 3/8/99 }
                      begin
                        TempDate:= Trunc(EncodeDate(y,m,d)) + Frac(EncodeTime(h,n,sec,msec));
                        if LessThanOrEqual(aMinDate,TempDate) and LessThanOrEqual(TempDate,aMaxDate) then
                           FDateTime := Trunc(EncodeDate(y,m,d)) + Frac(EncodeTime(h,n,sec,msec))
                      end
                   end;
                end;
             end
             else begin
                MessageBeep(0);
                FInDigitEdit := PrevInDigitEdit;  { Invalid character so ignore }
                key:= 0;
             end;

          end;
       end;
     end;

     if (Key = VK_DELETE) or (Key=VK_BACK) or
        (Key=VK_DOWN) or (Key=VK_UP) or
        (Key=VK_HOME) or (Key=VK_END) or
        isIntlLetter(Char(Key)) or
        (isnumber(Char(Key)) and (not FInDigitEdit)) then
     begin
        if (Key<> VK_DELETE) and (Key<>VK_BACK) then begin
           TempTime := DateTime;
           ReEncodeDateTime(y,m,d,h,n,sec,msec);
           if (isDateTimeField and isCformat) and (Frac(TempTime)<>0) and
              (h=0) and (n=0) and (sec=0) {and (msec=0)} then begin
              FPos:=GetMaxVisibleToken;
              HighlightToken(DateTime);
           end;
        end;

        SetModified(True);
     end;
  end; //Calendar = nil

  if (key = vk_left) or (key=vk_right) or (key=vk_up) or (key=vk_down) or
     (key = vk_home) or (key=vk_end) or
     (((key=vk_delete) or (key=vk_back)) and not FinDigitEdit) then
     key:=0;
end;

procedure TwwDBCustomDateTimePicker.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited KeyUp(Key, Shift);
end;

procedure TwwDBCustomDateTimePicker.Reset;
begin
  if FDataLink.Field<>Nil then begin
     FDataLink.Reset;
  end
  else
     DateTime := FOldDateTime;
  SetModified(False);
end;

Function TwwDBCustomDateTimePicker.CanEdit:boolean;
  Function isNonPhysicalField(thisField: TField): boolean;
  begin
     result:=  thisfield.calculated or thisfield.lookup;
  end;
begin
  Result := True;
  if ReadOnly then begin
     result:= False;
     exit;
  end;

  if (FDatalink.Field<>Nil) then begin
    if (FDataLink.Field.ReadOnly) or (not FDataLink.DataSet.CanModify) then begin
       Result := False;
    end
  end;

  { 8/24/98 - Respect DataSource AutoEdit Flag }
  if Result and (Datasource<>Nil) and (not Datasource.autoEdit) then begin
     if (not (DataSource.state in [dsEdit, dsInsert])) then result:= False;
  end;

{  if (inherited ReadOnly) and (DataSource<>Nil) and (not DataSource.autoEdit) then Result := False;
  if (DataSource=nil) then begin
     if not ReadOnly then ReadOnly:= False
     else Result := False;
  end
  else begin
     if (not ReadOnly) and (FDataLink.Field<>Nil) then
//        (isNonPhysicalField(FDataLink.Field)) then
     begin
        if (FDataLink.Field.ReadOnly) or (not FDataLink.DataSet.CanModify) then begin
            Result := False;
            exit;
        end;

        if (isNonPhysicalField(FDataLink.Field)) then
           FDataLink.DataSet.Edit;
//        if (inherited ReadOnly) then inherited ReadOnly:= False;
     end
  end}
end;

procedure TwwDBCustomDateTimePicker.KeyPress(var Key: Char);
var OrigKey: Char;
    ClearKey: boolean;
begin
  if (Key in [#32..#255]) or (ord(key)=vk_back) then begin
     if not CanEdit then exit;
  end;

  OrigKey:= Key;
  inherited KeyPress(Key);

  if (ord(key)=vk_space) and (Text='') then
  begin
     // 10/29/98 - If datasource is not enabled, then don't update the DateTime on space key
     if not ((FDatalink.Field=nil) and ((datasource<>nil) or (datafield<>''))) then
     begin
       EnableEdit;
       DateTime := Now;
       SetModified(True);
       HighlightToken(DateTime);
     end;
     Key:=#0;
     exit;
  end;

  ClearKey:= False;
  if (Key=#0) then SetModified(True) { 1/21/97 - Set modified to True }
  else if (Key=#0) and (OrigKey<>#0) then
  begin
     Key:= OrigKey;  {4/28/97 - Support Delphi edit mask }
     ClearKey:= True;
  end;

  if (Key in [#32..#255]) and (FDataLink.Field <> nil) and
      not FDataLink.Field.IsValidChar(Key) then
  begin
     MessageBeep(0);
     Key := #0;
  end;

  case Key of
    #9: if IsInGrid(self) then Key:= #0;   // If in a wwdbgrid then tab is handled by grid so do nothing
    #13: begin
         if IsInGrid(self) then begin
//            if IsInwwObjectView(self) then SetFocus; { 7/9/99 - ? Not sure what the purpose of calling set focus is as it does not work with entertotab for object view}
            Key:= #0  // If in a wwdbgrid then Return is handled by grid so do nothing
         end
         else begin //Else check if indigitedit to exit out of mode.
            if FinDigitEdit then begin
               InDigitEditUpdateRecord;
               HighlightToken(DateTime);
            end;
         end;
        end;
    #27:                                     // Handle Escape Key
      begin
        if SkipEscapeReset then begin
           SkipEscapeReset:= False;
           key:= #0;
           if (Text = '') then ShowCaret(Handle); { 12/16/98 - Show caret when restore back to blank }
           exit;
        end;

        Reset;
        Text := GetDateTimeStoredText(DateTime);
        HighlightToken(DateTime);
        FInDigitEdit := False;
        Key := #0;
        if (Text = '') then ShowCaret(Handle)
        else FIsCleared := False;
        if IsInGrid(self) and (not IsInwwObjectView(self)) then
           parent.SetFocus
        else SelectAll;
      end;
    '0'..'9':                                // If a digit then set to Edit mode
      begin
//        FDataLink.Edit;
//        SetModified(True);
//        if not CanEdit then key:=#0;
        key:=#0;
      end;
    ^H, ^V, ^X, #32..#47, #58..#255:
      begin
        key:=#0;
      end;
  end;

  if Key=#13 then Key:= #0; { RSW - Avoid Beep when closing dropdown :)}
  if ClearKey then Key:= #0;
end;

procedure TwwDBCustomDateTimePicker.Change;
begin
//  FDataLink.Edit;
//  inherited Changed;
  inherited;
  FDataLink.Modified;

{RSW - Supports assigning of text property to update FDateTime }
{If format does not match what DateToStr or DateTimeToStr then nothing
 happens }

//!!!!! Don't clear DateTime....     7/6/1998    PW?
   if Text = '' then begin
     if isTimeOnlyField then
     begin
        FDateTime := Trunc(FDateTime);
     end
     else begin
        FDateTime:= Frac(FDateTime);
     end;
   end;
{
        if Text<>'' then begin
           if UnboundDataType = wwDTEdtDate then
           begin
              if wwStrToDate(Text) then FDateTime := StrToDate(Text)
           end
           else if UnboundDataType = wwDTEdtDateTime then
           begin
              if wwStrToDateTime(Text) then
                 FDateTime := StrToDateTime(Text)
              else if wwStrToDate(Text) then
                 FDateTime := StrToDate(Text)
           end
        end
        else FDateTime:= 0.0;
}
end;

procedure TwwDBCustomDateTimePicker.InvalidateTransparentButton;
var r: TRect;
begin
   if ButtonEffects.Flat or ButtonEffects.Transparent then begin
     with FBtnControl do begin
         r:= Rect(parent.left + Left, parent.Top+top,
               parent.left + left+ Width, parent.top + Top + Height);
        { Calling with True causes flicker for any control that is invalidated.
          Test with False to see if any side effects  }
         InvalidateRect(parent.parent.handle, @r, False);
         parent.parent.Update;
      end
   end;
   FButton.invalidate;
end;


procedure TwwDBCustomDateTimePicker.BtnMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
begin
   exit; { Check if following code needed by exiting out and testing }

{   if FFlatButton or FFlatButtonTransparent then begin
     with FBtnControl do begin
         r:= Rect(parent.left + Left, parent.Top+top,
                 parent.left + left+ Width, parent.top + Top + Height);
         InvalidateRect(parent.parent.handle, @r, True);
         parent.parent.Update;
     end
   end;}
end;

procedure TwwDBCustomDateTimePicker.BtnClick;
begin
   InvalidateTransparentButton;

   if isDroppedDown then
      CloseUp(True)
   else begin
      SkipDrawSetFocus:= True;
      try
         if CanFocus then SetFocus;
         if Focused then begin
            DropDown;   { 5/28/97 - Only drop-down if focus was allowed }
         end
      finally
         SkipDrawSetFocus:= False;
      end
   end
end;

Function TwwDBCustomDateTimePicker.Editable: boolean;
begin
   result:= True;
end;

procedure TwwDBCustomDateTimePicker.EnableEdit;
begin
   FDataLink.Edit;
end;

function TwwDBCustomDateTimePicker.EditCanModify: Boolean;
  Function isNonPhysicalField(thisField: TField): boolean;
  begin
     result:=  thisfield.calculated or thisfield.lookup;
  end;
begin
  if FDataLink.Field<>Nil then
  begin
     { Must already be in edit-mode }
     Result := Fdatalink.dataset.state in [dsedit, dsInsert];

     {9/24/97 - Support edits of non physical fields }
     if (not Result) and
        (not ReadOnly) and
        (isNonPhysicalField(FDataLink.Field)) and
        (not FDataLink.Field.ReadOnly) and (FDataLink.DataSet.CanModify) then
           result:= True;
  end
  else Result:= True;
end;

Function TwwDBCustomDateTimePicker.isDroppedDown: boolean;
begin
  result:= (FCalendar <> nil) and FCalendar.Visible;
end;

{procedure TwwDateComboButton.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Flat then Invalidate;
end;

procedure TwwDateComboButton.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if Flat then Invalidate;
end;

}
procedure TBtnWinControl.WMEraseBkgnd(var Message: TWmEraseBkgnd);
var r: TRect;
    dtp: TwwDBCustomDateTimePicker;
begin
  dtp:= TwwDBCustomDateTimePicker(parent);
  if dtp.SkipUpdate then exit;

  if (IsInwwObjectViewPaint(parent) or
     dtp.isTransparentEffective)  then
  begin
     { Fixes paint problem when mouse is clicked in button and moved outside
       region, but it is not released }
     if (dtp.ButtonEffects.Flat or dtp.ButtonEffects.Transparent) and
        (csLButtonDown in dtp.FButton.ControlState) then
     begin
        r:= Rect(parent.left + Left , parent.Top+top,
                 parent.left + left + Width, parent.top + Top + Height);
        InvalidateRect(parent.parent.handle, @r, False);
        dtp.skipupdate:= true;
        parent.parent.update;
        dtp.skipupdate:= False;
     end;
     Message.result:= 1;
     exit;
  end
  else inherited;
end;

constructor TBtnWinControl.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   EditControl:= AOwner as TwwDBCustomDateTimePicker;
end;

procedure TBtnWinControl.CMMouseEnter(var Message: TMessage);
begin
  inherited;
{  if EditControl.FButton.Flat then
  begin
     EditControl.UpdateButtonPosition;
     Invalidate;
  end}
end;

procedure TBtnWinControl.CMMouseLeave(var Message: TMessage);
var r: TRect;
    offset: integer;
begin
  inherited;
  if not EditControl.ButtonEffects.Flat then exit;

  if EditControl.BorderStyle=bsSingle then offset:=2 else offset:= 0;
  if not EditControl.FFocused then begin
     if EditControl.IsTransparentEffective then begin
        r:= Rect(parent.left + Left + offset, parent.Top+top+offset,
                 parent.left + left + offset + Width, parent.top + offset + Top + Height);
        InvalidateRect(parent.parent.handle, @r, True);
        Invalidate;
     end;
     Invalidate;
  end
end;

Procedure TwwDBCustomDateTimePicker.DrawButton(Canvas: TCanvas; R: TRect; State: TButtonState;
       ControlState: TControlState; var DefaultPaint: boolean);
var Transparent: boolean;
begin
   if ButtonStyle=cbsCustom then exit;

   DefaultPaint:= False;
   Transparent:=  FButton.Flat and
      (not FMouseInButtonControl) and not (FFocused);
   if ButtonStyle=cbsDownArrow then
      wwDrawDropDownArrow(Canvas, R, State, Enabled, ControlState)
   else begin
      wwDrawEllipsis(Canvas, R, State, Enabled, Transparent,
         ButtonEffects.Transparent {and ButtonEffects.Flat},
         ControlState)
   end
end;

procedure TwwDateComboButton.Paint;
var R : TRect;
    DefaultPaint: boolean;

    Function InPaintCopyState(ControlState: TControlState): boolean;
    begin
       result:= (csPaintCopy in ControlState);
    end;
{    Procedure DrawDropDownArrow(Canvas: TCanvas; R: TRect;State: TButtonState;
       Enabled: Boolean; ControlState: TControlState);
    var Flags: Integer;
    begin
      DefaultPaint:= False;
      if not Enabled then
        Flags := DFCS_SCROLLCOMBOBOX or DFCS_INACTIVE
      else if (State=bsUp) or InPaintCopyState(ControlState) then
        Flags := DFCS_SCROLLCOMBOBOX
      else
        Flags := DFCS_SCROLLCOMBOBOX or DFCS_FLAT or DFCS_PUSHED;
      DrawFrameControl(Canvas.Handle, R, DFC_SCROLL, Flags);
    end;
}
begin
   { 7/2/99 }
   if twwdbCustomDateTimePicker(parent.parent).SkipUpdate then exit;

   if (csPaintCopy in ControlState) and
      not (csDesigning in ComponentState) and IsInGrid(parent.parent) then exit;

   SetRect(R, 0, 0, ClientWidth, ClientHeight);
   with TwwDBDateTimePicker(Parent.Parent) do
   begin
      DefaultPaint:= True;
      FMouseInButtonControl:= MouseInControl;

      if (FButton.Glyph.Handle=0) or MouseInControl or
         FFocused or wwisClass(Parent.classType, 'TwwDBGrid') then
         if not (ButtonEffects.Transparent and (ButtonStyle=cbsDownArrow)) then
            DrawButton(Canvas, R, FState, ControlState, DefaultPaint);

      if DefaultPaint then begin
         inherited Paint;
      end;

      { Draw edges if Default Paint }
      if MouseInControl or (not ButtonEffects.Flat) or //FButton.Flat) or
         FFocused or wwisClass(Parent.classType, 'TwwDBGrid') then
      begin
         if FState=bsDown then
            DrawEdge(Canvas.Handle, R, EDGE_SUNKEN, BF_RECT)
         else
            DrawEdge(Canvas.Handle, R, EDGE_RAISED, BF_RECT)
      end
   end
end;

type
 TCheatButton = class(TSpeedButton);

Procedure TwwDBCustomDateTimePicker.UpdateButtonPosition;
var offset: integer;
begin
  if Frame.IsFrameEffective then
  begin
     offset:= 2
  end
  else offset:= 0;
  if (not NewStyleControls) or (BorderStyle = bsNone) or (not Ctl3d) then
     FBtnControl.SetBounds (Width - FButton.Width - offset, offset, FButton.Width, ClientHeight-offset*2)
  else
     FBtnControl.SetBounds (Width - FButton.Width - 4, offset, FButton.Width, ClientHeight-offset);

{
  if (not NewStyleControls) or (BorderStyle = bsNone) or (not Ctl3d) then
     FBtnControl.SetBounds (Width - FButton.Width, 0, FButton.Width, ClientHeight)
  else
     FBtnControl.SetBounds (Width - FButton.Width - 4, 0, FButton.Width, ClientHeight);
}
  if BorderStyle = bsNone then begin
     FButton.Top:= -1; {Allows bitmap to be larger }
     FButton.Height := FBtnControl.Height+1;
  end
  else begin
     FButton.Top:= 0; {Allows bitmap to be larger }
     FButton.Height := FBtnControl.Height;
  end;
  SetEditRect;
end;

(*procedure TwwDBCustomDateTimePicker.NonEditMouseDown(var Message: TWMLButtonDown);
var
  CtrlState: TControlState;
begin
  //if not (Parent is TwwCustomDBGrid) then
  SetFocus;

  if isDroppedDown then CloseUp(True)
  else DropDown;

  if csClickEvents in ControlStyle then
  begin
    CtrlState := ControlState;
    Include(CtrlState, csClicked);
    ControlState := CtrlState;
  end;
  with Message do
    MouseDown(mbLeft, KeysToShiftState(Keys), XPos, YPos);
end;
*)
Procedure TwwDBCustomDateTimePicker.ShowText(ACanvas: TCanvas;
          ARect: TRect; indentLeft, indentTop: integer; AText: string);
begin
   ACanvas.TextRect(ARect, indentLeft, indentTop, AText);
end;

function TwwDBCustomDateTimePicker.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TwwDBCustomDateTimePicker.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TwwDBCustomDateTimePicker.GetField: TField;
begin
  Result := FDataLink.Field;
end;

Function TwwDBCustomDateTimePicker.GetIconIndent: integer;
begin
   result:= FBtnControl.Width;
end;

Function TwwDBCustomDateTimePicker.GetIconLeft: integer;
begin
   result:= FBtnControl.Left - 1;
end;

procedure TwwCalendarOptions.SetFont(Value: TFont);
begin
  if FFont <> Value then
  begin
    FFont.Assign(Value);  //12/14/1998 - Need to use the assign method when setting the font.
  end;
end;

procedure TwwDBCustomDateTimePicker.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
  if Value = '' then
     UnboundDataType := wwDTEdtDateTime;
end;

procedure TwwDBCustomDateTimePicker.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then begin
    Value.FreeNotification(Self);
  end
  else UnboundDataType := wwDTEdtDateTime;
end;

procedure TwwDBCustomDateTimePicker.SetEditRect;
var
  Loc: TRect;
begin
  Loc.Bottom :=ClientHeight+1; {+1 is workaround for windows paint bug}
  if ShowButton then Loc.Right := FBtnControl.Left - 1
  else Loc.Right:= ClientWidth - 2;

  if IsInwwObjectView(self) then begin
     Loc.Top := 1;
     Loc.Left := 1;
  end
  else if (BorderStyle = bsNone) and IsInGrid(self) then begin
     Loc.Top := 2;
     Loc.Left := 2;
  end
  else if (Frame.IsFrameEffective) then
  begin
     Frame.GetEditRectForFrame(Loc);
  end
  else if (BorderStyle = bsNone) then
  begin
     Loc.Top := 1;
     Loc.Left := 1;
  end
  else begin
     Loc.Top := 0;
     Loc.Left := 0;
  end;

  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@Loc));
end;


procedure TwwDBCustomDateTimePicker.SetFocused(Value: Boolean);
begin
  if FFocused <> Value then
  begin
    FFocused := Value;
    if (FAlignment <> taLeftJustify) then Invalidate;
    if FDataLink.Field<>Nil then begin
       FDataLink.Reset;
    end
  end;
end;

procedure TwwDBCustomDateTimePicker.SetMaxDate(Value: TDate);
begin
      {9/10/98 - Check for clearing of max date when mindate <> 0}
  if (Value <> 0.0) and (FMinDate<> 0.0) and (Value < FMinDate) then
    raise EDateTimeError.CreateFmt(SDateTimeMin, [DateToStr(FMinDate)]);
  if FMaxDate <> Value then FMaxDate := Value;
end;

procedure TwwDBCustomDateTimePicker.SetMinDate(Value: TDate);
begin
  if (FMaxDate<> 0.0) and  (Value > FMaxDate) then
    raise EDateTimeError.CreateFmt(SDateTimeMin, [DateToStr(FMaxDate)]);
  if FMinDate <> Value then FMinDate := Value;
end;

Procedure TwwDBCustomDateTimePicker.SetModified(val: boolean);
begin
  if val and (FDataLink.Field<>Nil) and (FDataLink.Field.ReadOnly) then exit;

  if val then FDatalink.modified;
  Modified:= val;
  if (Modified <> val) then
     Modified:= val;
end;

procedure TwwDBCustomDateTimePicker.SetShowButton(sel: boolean);
begin
   if (FShowButton <> sel) then
   begin
      FShowButton := sel;
      FBtnControl.visible:= sel;
      if HandleAllocated then begin
         SetEditRect;
         invalidate;
      end
   end;
end;

procedure TwwDBCustomDateTimePicker.SetUnboundDataType(const Value: TwwDTEditDataType);
begin
   if (FUnboundDataType <> Value) then begin
      FUnboundDataType := Value;
//      self.invalidate;
      RefreshText;
   end;
end;

procedure TwwDBCustomDateTimePicker.SetDisplayFormat(value: string);
begin
  if FDisplayFormat <> Value then
  begin
    FDisplayFormat := Value;
    RefreshText;
  end;
end;

procedure TwwDBCustomDateTimePicker.SetDateFormat(Value: TDTDateFormat);
begin
  if FDateFormat <> Value then
  begin
    FDateFormat := Value;
    RefreshText;
  end;
end;

procedure TwwDBCustomDateTimePicker.SetEpoch(Value: Integer);
begin
  if FEpoch <> Value then
  begin
    FEpoch := Value;
  end;
end;

procedure TwwDBCustomDateTimePicker.SetDate(Value: TDate);
begin
  if isTimeOnlyField then exit;

  if (FDatalink.Field = Nil) and (Value = 0.0) then begin
     FIsCleared := False;   //Allow the user to set Date to 12/30/1899
     SetDateTime(Value);
     exit;
  end;

  if Trunc(FDateTime) <> Trunc(Value) then
  begin
    Value := Trunc(Value) + Frac(FDateTime);
    if Value = 0.0 then
    begin
      SetDateTime(Value);
      Invalidate;
    end
    else begin
      try
        if (FMaxDate <> 0.0) and (Value > FMaxDate) then
          raise EDateTimeError.CreateFmt(SDateTimeMax, [DateToStr(FMaxDate)]);
        if (FMinDate <> 0.0) and (Value < FMinDate) then
          raise EDateTimeError.CreateFmt(SDateTimeMin, [DateToStr(FMinDate)]);
        SetDateTime(Value);
      except
        SetDateTime(FDateTime);
        raise;
      end;
    end;
  end;
end;

function TwwDBCustomDateTimePicker.GetDate: TDate;
begin
  if FinDigitEdit then InDigitEditUpdateRecord;
  if not isTimeOnlyField then
     Result := TDate(FDateTime)
  else Result := 0;
end;

function TwwDBCustomDateTimePicker.GetTime: TTime;
begin
  if FinDigitEdit then InDigitEditUpdateRecord;
  if not isDateField then
     Result := TTime(FDateTime)
  else Result := 0;
end;

procedure TwwDBCustomDateTimePicker.SetTime(Value: TTime);
begin
  if isDateField then exit;

  if (FDatalink.Field = Nil) and (Value = 0.0) then begin
     FIsCleared := False;   //Allow the user to set time to 12:00:00 AM
     SetDateTime(Value);
     exit;
  end;

  if Frac(FDateTime) <> Frac(Value) then
  begin
    Value := Trunc(FDateTime) + Frac(Value);
    if Value = 0.0 then
    begin
      SetDateTime(Value);
      Invalidate;
    end
    else
      SetDateTime(Value);
  end;
end;

procedure TwwDBCustomDateTimePicker.SetDateTime(Value: TDateTime);
//var tempdate:TDate;
var origModified: boolean;
begin
  OrigModified:= Modified;
  if (FDatalink.Field = Nil) and (Value = 0.0) then begin
     FIsCleared := False;   //Allow the user to set time to 12:00:00 AM
  end
  else if (FDateTime = Value) and (FDateTime <> 0.0) then exit;

  if (Value=0.0) then begin  {RSW}
     FDateTime:= 0.0;
     if (not isTimeOnlyField) and (Text<>'') then Text:= '';
     if not IsTimeOnlyField then exit;  {12/18/98 - Set Text by going on }
  end;

  try
    if (Value<>0.0) and (not ((Trunc(Value)=0) and isTimeOnlyField)) and
       ((FDatalink.Field = nil) or
       ((FDatalink.Field <> nil) and not(FDatalink.Field.isnull))) then begin
       if (FMaxDate <> 0.0) and (Trunc(Value) > FMaxDate) then
          raise EDateTimeError.CreateFmt(SDateTimeMax, [DateToStr(FMaxDate)]);
       if (FMinDate <> 0.0) and (Value < FMinDate) then
          raise EDateTimeError.CreateFmt(SDateTimeMin, [DateToStr(FMinDate)]);
    end;
    FDateTime := Value;
    if Text <> GetDateTimeDisplayText(FDateTime) then
       Text:= GetDateTimeDisplayText(FDateTime);
    HighlightToken(FDateTime);
    modified:= OrigModified;
  except
    FDateTime := Value;
    Text:= GetDateTimeDisplayText(FDateTime);
    HighlightToken(FDateTime);
    raise;
  end;
end;

procedure TwwDBCustomDateTimePicker.InDigitEditUpdateRecord;
var s,token:string;
    startpos,len {,j}:integer;
    d,y,m:word;
    h,n,sec,msec:word;
    digit:word;
//    maxday:word;
    zeropad:string;
begin
  if DroppedDown then exit; { RSW }
  if not FInDigitEdit then exit;
  FInDigitEdit := False; // 7/9/98 - Already inDigitedit so clear flag to prevent possible recursion.

  DecodeDate(DateTime,y,m,d);
  DecodeTime(DateTime,h,n,sec,msec);
  s := getdatetimetoken(DateTime,FPos,startpos,len,token);

  if (token = 'dd') or (token = 'd') or
     (token = 'mm') or (token = 'm') or
     (token = 'hh') or (token = 'h') or
     (token = 'nn') or (token = 'n') or
     (token = 'ss') or (token = 's') or
     (token = 'yy') or (token = 'yyyy') then begin

     zeropad := '';
     {Handle Partial Dates for 2-digit tokens.  4 digit year cannot have partial years}
     if (token <> 'yyyy') and (startpos<>selstart) then begin
        if (length(token) = 2) then zeropad := '0';
        digit:= StrToInt(text[startpos+1]);

        if token<>'' then {8/14/98}
        case AnsiUpperCase(token[1])[1] of
          'M': if digit <> 0 then m:=digit;
          'D': if digit <> 0 then d:=digit;
          'H': h:=digit;
          'N': n:=digit;
          'S': sec:=digit;
          'Y': begin
                 digit := Get4DigitFrom2DigitYear(digit,m,d,FEpoch);
                 y:=digit;
               end;
        end;
        ReEncodeDateTime(y,m,d,h,n,sec,msec);
        // 7/9/98 - pw - Setting Date Before Setting Text to make sure that Date is uptodate in the ONChange event.
//        HighlightToken(DateTime);
//        Text:= GetDateTimeDisplayText(FDateTime);  { RSW }

{        selstart := startpos;
        sellength := 1;
        if (digit = 0) then begin
           seltext := zeropad+'0'
        end
        else
           seltext := zeropad+IntToStr(digit);

        selstart := startpos;

        if (length(token) = 2) then sellength := 2
        else sellength := 1;}
    end
    else
    begin
       len := selstart-startpos;
//       Text:= GetDateTimeDisplayText(FDateTime);  { RSW }
       if len <= 3 then begin
        zeropad := '0';
        digit := (getcurmillenium*100);
        case len of
        3: digit := 100*(StrToInt(Text[startpos+1]))+
                    10*(StrToInt(Text[startpos+2]))+
                    StrToInt(text[startpos+3]);
        2: begin
            digit := Get4DigitFrom2DigitYear((10*(StrToInt(Text[startpos+1]))+StrToInt(text[startpos+2])),m,d,FEpoch);
           end;
        1: begin
            digit := Get4DigitFrom2DigitYear((StrToInt(text[startpos+1])),m,d,FEpoch);
           end;
        end;
        if (len<>3) or (digit <> 0) then begin
          if (len = 0) and ((token = 'yyyy') or (token = 'yy')) then
             digit := Get4DigitFrom2DigitYear(0,m,d,FEpoch)
          else if len=0 then begin
             if (token = 'dd') or (token = 'd') then
                digit := d
             else if (token = 'm') or (token = 'mm') then
                digit := m
             else if (token = 'h') or (token = 'hh') then
                digit := h
             else digit := 0;
          end;

          if token<>'' then {8/14/98}
          case AnsiUpperCase(token[1])[1] of
            'M': if digit <> 0 then m:=digit;
            'D': if digit <> 0 then d:=digit;
            'H': h:=digit;
            'N': n:=digit;
            'S': sec:=digit;
            'Y': y:=digit;
          end;

          ReEncodeDateTime(y,m,d,h,n,sec,msec);
  // 7/9/98 - pw - Setting Date Before Setting Text to make sure that Date is uptodate in the ONChange event.
  //               Now the RefreshText will update the text at the end.
  {        selstart := startpos;
          sellength := len;
          if Len=3 then seltext := zeropad+IntToStr(digit)
          else begin
             if (length(token)=2) and (length(inttostr(digit))=1) then seltext := zeropad+IntToStr(digit)
             else seltext := IntToStr(digit);
          end;
          selstart := startpos;}
        end;
      end;
    end;

//    Text:= GetDateTimeDisplayText(FDateTime);  { RSW }
//    invalidate;
    RefreshText;
    HighlightToken(DateTime);
    SetModified(True);
//    FInDigitEdit := False;  7/9/98 - Remove and put at beginning to avoid possible recursion.
  end;
end;

{************************************* TwwCalendarOptions **************************************}

destructor TwwCalendarOptions.Destroy;
begin
  FFont.Free;
  FColors.Free;
  FPopupYearOptions.Free;
  inherited destroy;
end;

constructor TwwCalendarOptions.Create(AOwner: TComponent);
begin
  inherited Create;//(AOwner);
  FColors := TwwDateTimeColors.Create(Aowner);
  FOptions:= [mdoDayState];
  FFont := TFont.Create;
  FWidth := 0;
  FHeight := 0;
  FPopupYearOptions := TwwPopupYearOptions.Create(AOwner);
  FFirstDayOfWeek := wwdowLocaleDefault;
end;

function TwwCalendarOptions.GetFont: TFont;
begin
  Result := FFont;
end;

function TwwCalendarOptions.GetWidth: Integer;
begin
  Result := FWidth;
end;

function TwwCalendarOptions.GetHeight: Integer;
begin
  Result := FHeight;
end;

procedure TwwCalendarOptions.SetAlignment(Value: TwwDTCalAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
  end;
end;

procedure TwwCalendarOptions.SetPopupYearOptions(Value: TwwPopupYearOptions);
begin
   if FPopupYearOptions<>Value then
      FPopupYearOptions.Assign(Value); { RSW }
//   if (FPopupYearOptions <> Value) then
//     FPopupYearOptions := Value;
end;

procedure TwwCalendarOptions.SetFirstDayOfWeek(Value: TwwCalDayOfWeek);
begin
  if (FFirstDayOfWeek <> Value) then
     FFirstDayOfWeek := Value;
end;

procedure TwwCalendarOptions.SetWidth(Value: Integer);
begin
  if FWidth <> Value then
     FWidth := Value;
end;

procedure TwwCalendarOptions.SetHeight(Value: Integer);
begin
  if FHeight <> Value then
     FHeight := Value;
end;

procedure TwwCalendarOptions.SetColors(Value: TwwDateTimeColors);
begin
  if FColors <> Value then FColors.Assign(Value);
end;

procedure TwwCalendarOptions.SetOptions(Value:TwwMonthOptions);
begin
  if FOptions <> Value then FOptions := Value;
end;

procedure TwwDBCustomDateTimePicker.Loaded;
begin
  FButton.Width:= max(GetSystemMetrics(SM_CXVSCROLL), 15);
  if (parent<>Nil) or (owner<>nil) then  { 11/17/97 - parent=nil causes runtime error }
     UpdateButtonPosition;
  inherited Loaded;
end;

{procedure Register;
begin
  RegisterComponents('First Class', [TwwDBDateTimePicker]);
end;}
function TwwDBCustomDateTimePicker.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TwwDBCustomDateTimePicker.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
  inherited ReadOnly := Value;
end;

procedure TwwDBCustomDateTimePicker.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  FButton.Enabled := Enabled;
end;

{$ifdef wwdelphi4up}
function TwwDBCustomDateTimePicker.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

function TwwDBCustomDateTimePicker.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;
{$endif}

procedure TwwDBCustomDateTimePicker.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  if IsInwwObjectViewPaint(self) or
    (IsTransparentEffective and (not FFocused)) then
  begin
     Message.result:= 1;
     exit;
  end
  else
     inherited;
end;

Function TwwDBCustomDateTimePicker.LoadComboGlyph: HBitmap;
begin
   result:= 0;
   if (FButtonStyle=cbsCustom) and (FButtonGlyph<>nil) then
   begin
      result:= FButtonGlyph.Handle;
   end
   else if ButtonEffects.Flat or ButtonEffects.Transparent then
   begin
      if (FButtonStyle = cbsDownArrow) then
         result:= LoadBitmap(HInstance, 'WWDROPDOWN')
   end
end;

{
procedure TwwDBCustomDateTimePicker.SetFlatButton(val: boolean);
begin
   if FFlatButton<>val then
   begin
      FFlatButton:= val;
      FButton.Flat:= FFlatButton or FFlatButtonTransparent;
      FButton.Glyph.Handle:= LoadComboGlyph;
      FButton.Invalidate;
   end;
end;

procedure TwwDBCustomDateTimePicker.SetFlatButtonTransparent(val: boolean);
begin
   if FFlatButtonTransparent<>val then
   begin
      FFlatButtonTransparent:= val;
      FButton.Flat:= FFlatButton or FFlatButtonTransparent;
      FButton.Glyph.Handle:= LoadComboGlyph;
      FButton.Invalidate;
   end;
end;

function TwwDBCustomDateTimePicker.GetFlatButton: boolean;
begin
   result:= FFlatButton;
//   result:= FButton.Flat;
end;
}
{procedure TwwDBCustomDateTimePicker.GetEditRectForFrame(var Loc: TRect);
begin
     if (Frame.FocusStyle = efsFrameBox) then
     begin
        Loc.Top := 2;
        Loc.Left := 2;
     end
     else if is3DBorder then
     begin
        Loc.Top := 3;
        if Frame.FocusStyle in [efsFrameSunken, efsFrameBump] then
           Loc.Left := 3
        else Loc.Left:= 2;
        Loc.Right:= Loc.Right -2
     end
     else begin
        Loc.Top:= 1;
        Loc.Left:= 1;
     end
end;
}

function TwwDBCustomDateTimePicker.Is3DBorder: boolean;
begin
//   result:=
//     Frame.FocusStyle in [efsFrameSunken, efsFrameRaised, efsFrameEtched, efsFrameBump]
   result:= true;
end;

procedure TwwDBCustomDateTimePicker.DrawFrame(Canvas: TCanvas);
begin
    wwDrawEdge(self, Frame, Canvas, FFocused);
end;

function TwwDBCustomDateTimePicker.isTransparentEffective: boolean;
begin
   result:= Frame.Transparent and Frame.IsFrameEffective
     and not wwIsDesigning(self)
end;

{procedure TwwDBCustomDateTimePicker.SetTransparent(val: boolean);
begin
   if val<>FTransparent then
   begin
     FCreateTransparent:= val;
     FTransparent:= val;
   end
end;
}
procedure TwwDBCustomDateTimePicker.CreateWnd;
begin
   inherited CreateWnd;
   if (BorderStyle=bsNone) and AutoSize and
     not (parent is TCustomGrid) then Frame.AdjustHeight;
   SetEditRect;

   if IsTransparentEffective then
   begin
     wwDisableParentClipping(Parent);
   end
end;

{procedure TwwDBCustomDateTimePicker.AdjustHeight;
var
  DC: HDC;
  SaveFont: HFont;
  I: Integer;
  SysMetrics, Metrics: TTextMetric;
begin
  DC := GetDC(0);
  GetTextMetrics(DC, SysMetrics);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  if NewStyleControls then
  begin
    if Ctl3D then I := 8 else I := 6;
    I := GetSystemMetrics(SM_CYBORDER) * I;
    if (BorderStyle=bsNone) and (Frame.FocusStyle=efsFrameBox) then I:= 6
    else if (BorderStyle=bsNone) and Is3DBorder then I:= 6
  end else
  begin
    I := SysMetrics.tmHeight;
    if I > Metrics.tmHeight then I := Metrics.tmHeight;
    I := I div 4 + GetSystemMetrics(SM_CYBORDER) * 4;
  end;
  Height := Metrics.tmHeight + I;
end;
}
procedure TwwDBCustomDateTimePicker.CMTextChanged(var Message: TMessage);
begin
  if IsTransparentEffective and not FFocused then
     Frame.RefreshTransparentText;

  inherited;
end;

procedure TwwDBCustomDateTimePicker.ClearDateTime;
begin
  EnableEdit;
  if (CanEdit) then begin
    DateTime := 0.0;
    FIsCleared := True;
    Text := '';
    Update;
    ShowCaret(Handle);
    FPos := 1;
    SetModified(True);
  end;
end;

procedure TwwDBCustomDateTimePicker.SetButtonStyle(val: TwwComboButtonStyle);
begin
   if val<>FButtonStyle then begin
      FButtonStyle:= val;
      FButton.Glyph.Handle:= LoadComboGlyph;
      FButton.Invalidate;
   end
end;

function TwwDBCustomDateTimePicker.IsCustom: Boolean;
begin
  Result := ButtonStyle = cbsCustom;
end;

procedure TwwDBCustomDateTimePicker.SetButtonGlyph(Value: TBitmap);
begin
  FButtonGlyph.Assign(Value);
  Invalidate;
end;

procedure TwwDBCustomDateTimePicker.GlyphChanged(Sender: TObject);
begin
   FButton.Glyph.Handle:= LoadComboGlyph;
   Invalidate;
end;

Procedure TwwDBCustomDateTimePicker.SetButtonWidth(val: integer);
begin
   if FButtonWidth<>val then
   begin
      FButtonWidth:= val;
      if val<>0 then Button.Width:= val
      else Button.Width:= wwmax(GetSystemMetrics(SM_CXVSCROLL), 15);
      UpdateButtonPosition;
   end
end;

function TwwDBCustomDateTimePicker.GetButtonWidth: integer;
begin
   result:= FButtonWidth;
end;



end.
