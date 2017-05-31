{
//
// Components : TwwDBMonthCalendar
//
// Copyright (c) 1998 by Woll2Woll Software
//
// 8/24/98 - Support Delphi 4 ActionLists
// 8/24/98 - Call Change method when using arrow keys to change date
// 8/25/98 - Return true if ComCtl supports mdoNoToday,
//           versions 4.7 or earlier did not
// 9/1/98  - Do not raise EncodeDate exception
// 9/10/98 - Check for clearing of max date when mindate <> 0
// 9/24/98 - Fix bug when user right-clicked to choose "Go to Today" on MouseDown method
// 10/29/98 - Fix bug when entering page-up in month calendar when previous month does
//            not have as many days.
// 1/9/98 - Make sure Handle is allocated before calling InvalidateRect
// 1/9/98 - Update Multiselection Start and End Dates - PYW
// 2/15/98 - Don't call change when no changes to date have occurred.
// 2/15/98 - Make sure calendar gets focus when mouse clicked on control.
// 2/15/98 - Fix bug when making a selection in a databound monthcalendar where changes
//           are reset when entering edit mode.
}

unit wwmonthcalendar;
interface

{$i wwIfDef.pas}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  comctrls, commctrl, db, dbctrls,menus, wwintl;

const MaxMonthForDayState = 14;

type
  TwwDateTimeColors = class(TPersistent)
  private
    Owner: TComponent;
    FBackColor: TColor;
    FTextColor: TColor;
    FTitleBackColor: TColor;
    FTitleTextColor: TColor;
    FMonthBackColor: TColor;
    FTrailingTextColor: TColor;
    procedure SetColor(Index: Integer; Value: TColor);
    procedure SetAllColors;

  public
    constructor Create(AOwner: TComponent);
    procedure Assign(Source: TPersistent); override;

  published
//    property BackColor: TColor index 0 read FBackColor write SetColor default clWindow;
    property TextColor: TColor index 1 read FTextColor write SetColor default clWindowText;
    property TitleBackColor: TColor index 2 read FTitleBackColor write SetColor default clActiveCaption;
    property TitleTextColor: TColor index 3 read FTitleTextColor write SetColor default clWhite;
    property MonthBackColor: TColor index 4 read FMonthBackColor write SetColor default clWhite;
    property TrailingTextColor: TColor index 5 read FTrailingTextColor
      write SetColor default clInactiveCaptionText;
  end;

  TwwPopupYearOptions =  class(TPersistent)
  private
     FYearsPerColumn:Integer;
     FNumberColumns:Integer;
     FStartYear:Integer;
     FShowEditYear: boolean;
     procedure SetStartYear(Value: Integer);
     procedure SetNumberColumns(Value: Integer);
     procedure SetYearsPerColumn(Value: Integer);
     procedure SetShowEdityear(Value: Boolean);
  public
     constructor Create(AOwner: TComponent);
     procedure Assign(Source: TPersistent); override;
  published
     property YearsPerColumn: Integer read FYearsPerColumn write SetYearsPerColumn default 10;
     property NumberColumns: Integer read FNumberColumns write SetNumberColumns default 2;
     property StartYear: Integer read FStartYear write SetStartYear default 1990;
     property ShowEditYear: Boolean read FShowEditYear write SetShowEditYear default False;
  end;

  TwwMonthOption = (mdoDayState, mdoWeekNumbers, mdoNoToday, mdoNoTodayCircle, mdoMultiSelect);
  TwwMonthOptions = set of TwwMonthOption;
  TCalcBoldDayEvent =
     procedure(Sender: TObject; ADate: TDate; Month, Day, Year: Integer; var Accept: Boolean) of object;
  TmcMouseMoveEvent =
     procedure(Sender: TObject; Shift: TShiftState; X, Y, Month, Day, Year: Integer) of object;
  TmcMouseUPDownEvent =
     procedure(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, Month, Day, Year: Integer) of object;

  TwwCalDayOfWeek = (wwdowMonday, wwdowTuesday, wwdowWednesday, wwdowThursday,
    wwdowFriday, wwdowSaturday, wwdowSunday, wwdowLocaleDefault);

  TwwMonthCalendar = class(TWinControl)
  private
    FBorder : TBorderStyle;
    FCalColors: TwwDateTimeColors;
    FDateTime: TDateTime;
    FStartDate: TDateTime;
    FEndDate: TDateTime;
    FMaxDate: TDate;
    FMinDate: TDate;
    FOnChange: TNotifyEvent;
    FOnCalcBoldDay: TCalcBoldDayEvent;
    FOptions: TwwMonthOptions;
    FMaxSelectCount:Integer;
    FSelChanged:Boolean;
    FOnMouseMove: TmcMouseMoveEvent;
    FOnMouseDown: TmcMouseUpDownEvent;
    FOnMouseUp: TmcMouseUpDownEvent;
    FYearPopupMenu: TPopupMenu;
    FYearPopupShowing : Boolean;
    FMonthPopupShowing : Boolean;
    FAfterYearPopup:Boolean;
    FAfterMonthPopup:Boolean;    
    FMonthPopupMenu: TPopupMenu;
    FPopupSystemTime: TSystemTime;
    FPrevPopupMonth:integer;
    FDummyList:TList;   // Dummy List for maintenance builds.

    FPopupYearOptions:TwwPopupYearOptions;
    FFirstDayOfWeek: TwwCalDayOfWeek;
    procedure AdjustHeight;
    function GetDate: TDate;
    function GetTime: TTime;
    function GetEndDate: TDate;
    function GetStartDate: TDate;
    function GetHeight: Integer;
    function GetWidth: Integer;
//    function GetMaxSelectCount: Integer;
    procedure SetCalColors(Value: TwwDateTimeColors);
    procedure SetDate(Value: TDate);
    procedure SetEndDate(Value: TDate);
    procedure SetStartDate(Value: TDate);
    procedure SetDateTime(Value: TDateTime);
    procedure SetBorder(Value: TBorderStyle);
    procedure SetHeight(Value: Integer);
    procedure SetWidth(Value: Integer);
    procedure SetMaxDate(Value: TDate);
    procedure SetMaxSelectCount(Value: Integer);
    procedure SetMinDate(Value: TDate);
    procedure SetRange(MinVal, MaxVal: TDateTime);
    procedure SetTime(Value: TTime);
    procedure SetPopupYearOptions(Value:TwwPopupYearOptions);
    procedure SetFirstDayOfWeek(Value: TwwCalDayOfWeek);
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
    procedure CNKeyDown(var Message: TWMKeyDown); message CN_KEYDOWN; {handle tab}
//    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CMShowingChanged(var Message: TMessage); message CM_SHOWINGCHANGED;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure SetOptions(val: TwwMonthOptions); virtual;
    procedure Change; dynamic;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure GetFocus; virtual;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState;X, Y: Integer); override;
    function SetSelRange(AStart,AEnd:TDate):Boolean;
    function SetMonthCalDateTime(Value:TDateTime):Boolean;
    procedure Loaded; override;
    procedure WndProc(var Message: TMessage); override;
    procedure wwPopupMenuClick(Sender: TObject);
    procedure wwMonthPopupMenuClick(Sender: TObject);
  public
    Patch: Variant;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function IsPopupYearMonthShowing: boolean;
    property EndDate: TDate read GetEndDate write SetEndDate;
    property StartDate: TDate read GetStartDate write SetStartDate;
    property DateTime : TDateTime read FDateTime write SetDateTime;
(*  {$ifdef wwdelphi4up}
    procedure RefreshBoldDays;
    {$endif}*)
  published
    property BorderStyle: TBorderStyle read FBorder write SetBorder default bsNone;
    property CalColors: TwwDateTimeColors read FCalColors write SetCalColors;
    property Date: TDate read GetDate write SetDate;
    property Time: TTime read GetTime write SetTime;
    property Color stored True default clWindow;
    property Options : TwwMonthOptions read FOptions write SetOptions default [mdoDayState];
    property PopupYearOptions:TwwPopupYearOptions read FPopupYearOptions write SetPopupYearOptions;
    property FirstDayOfWeek: TwwCalDayOfWeek read FFirstDayOfWeek write SetFirstDayOfWeek
      default wwdowLocaleDefault;
    property Height: Integer read GetHeight write SetHeight;
    property MaxSelectCount: Integer read FMaxSelectCount write SetMaxSelectCount default 31;
    property MaxDate: TDate read FMaxDate write SetMaxDate;
    property MinDate: TDate read FMinDate write SetMinDate;
    property ParentColor default False;
    property TabStop default True;
    property Width: Integer read GetWidth write SetWidth;
    property OnCalcBoldDay: TCalcBoldDayEvent read FOnCalcBoldDay write FOnCalcBoldDay;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnMouseDown: TmcMouseUpDownEvent read FOnMouseDown write FOnMouseDown;
    property OnMouseMove: TmcMouseMoveEvent read FOnMouseMove write FOnMouseMove;
    property OnMouseUp: TmcMouseUpDownEvent read FOnMouseUp write FOnMouseUp;
  end;

  TwwDBCustomMonthCalendar = class(TwwMonthCalendar)
  private
    FDataLink: TFieldDataLink;
    FPaintControl: TPaintControl;

    function GetField: TField;
    function GetDataField: string;
    procedure SetDataField(const Value: string);
    function GetReadOnly: Boolean;
    procedure SetReadOnly(Value: Boolean);
    procedure SetDataSource(Value: TDataSource);
    function GetDataSource: TDataSource;

    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure DataChange(Sender: TObject);
    procedure UpdateData(Sender: TObject);
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
  protected
    procedure Notification(AComponent: TComponent;
        Operation: TOperation); override;
    procedure KeyPress(var Key: Char); override;
    procedure Change; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    {$ifdef wwdelphi4up}
    function ExecuteAction(Action: TBasicAction): Boolean; override; { 8/24/98 }
    function UpdateAction(Action: TBasicAction): Boolean; override; {8/24/98}
    {$endif}
    property Field: TField read GetField;

  published
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
  end;

  TwwDBMonthCalendar = class(TwwDBCustomMonthCalendar)
  published
    {$ifdef wwDelphi4Up}
    property Anchors;
    {$endif}
    property Align;
    property BorderStyle;
    property CalColors;
    {$ifdef wwDelphi4Up}
    property Constraints;
    {$endif}
    property Date;
    property Time;
    property Color;
    property Options;
    property PopupYearOptions;
    property DragCursor;
    property DragMode;
    property Enabled;
    property FirstDayOfWeek;
    property Font;
    property Height;
    property ImeMode;
    property ImeName;
    property MaxSelectCount;
    property MaxDate;
    property MinDate;
    property ParentColor default False;
    property ParentFont;
    property ParentShowHint;
//    property PopupMenu;
    property ShowHint;
    property TabStop default True;
    property Visible;
    property Width;
    property OnCalcBoldDay;
    property OnClick;
    property OnChange;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;

    property DataField;
    property DataSource;
    property ReadOnly;

  end;


//procedure Register;

implementation

uses comstrs, consts, wwdbdatetimepicker;

const
  ColorIndex: array[0..5] of Integer = (MCSC_BACKGROUND, MCSC_TEXT,
    MCSC_TITLEBK, MCSC_TITLETEXT, MCSC_MONTHBK, MCSC_TRAILINGTEXT);

    function min(a,b:integer):Integer;
    begin
       if a<=b then result :=a else result :=b;
    end;

    function DaysThisMonth(Month,Year:integer): Integer;
    const
      DaysPerMonth: array[1..12] of Integer =
        (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);	    { usual numbers of days }
    begin
       Result := DaysPerMonth[Month];                        { normally, just return number }
       if (Month = 2) and IsLeapYear(Year) then Inc(Result); { plus 1 in leap February }
    end;


{ 8/25/98 - Return true if ComCtl supports mdoNoToday,
  versions 4.7 or earlier did not}
function UpdatedComCtlVersion: boolean;
var dummy: DWORD;
    verInfoSize, verValueSize: DWORD;
    verInfo: Pointer;
    verValue: PVSFixedFileInfo;
    V1,V2: WORD;
begin
   verInfoSize:= GetFileVersionInfoSize('comctl32.dll', Dummy);
   if VerInfoSize = 0 then
   begin
      Dummy:= GetLastError;
      result:= True;
      exit;
   end;

   GetMem(VerInfo, VerInfoSize);
   GetFileVersionInfo('comctl32.dll', 0, VerInfoSize, VerInfo);
   VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
   with VerValue^ do begin
      V1:= dwFileVersionMS shr 16;
      V2:= dwFileVersionMS and $FFFF;
   end;
   result:= (v1>=4) and (v2>70);
   FreeMem(VerInfo, VerInfoSize);

end;

constructor TwwPopupYearOptions.Create(AOwner: TComponent);
begin
  inherited Create;
  FYearsPerColumn:=10;
  FNumberColumns:= 2;
  FStartYear:= 1990;
end;

procedure TwwPopupYearOptions.SetYearsPerColumn(Value: Integer);
begin
  if Value <> FYearsPerColumn then
     FYearsPerColumn := Value;
end;

procedure TwwPopupYearOptions.SetShowEditYear(Value: boolean);
begin
  if Value <> FShowEditYear then
     FShowEditYear:= Value;
end;

procedure TwwPopupYearOptions.SetNumberColumns(Value: Integer);
begin
  if Value <> FNumberColumns then
     FNumberColumns := Value;
end;

procedure TwwPopupYearOptions.SetStartYear(Value: Integer);
begin
  if Value <> FStartYear then
     FStartYear := Value;
end;

constructor TwwDateTimeColors.Create(AOwner: TComponent);
begin
  Owner := AOwner;
  FBackColor := clWindow;
  FTextColor := clWindowText;
  FTitleBackColor := clActiveCaption;
  FTitleTextColor := clWhite;
  FMonthBackColor := clWhite;
  FTrailingTextColor := clInactiveCaptionText;
end;

procedure TwwPopupYearOptions.Assign(Source: TPersistent);
begin
  if Source is TwwPopupYearOptions then
  begin
     FYearsPerColumn:= TwwPopupYearOptions(Source).YearsPerColumn;
     FNumberColumns:= TwwPopupYearOptions(Source).NumberColumns;
     FStartYear:= TwwPopupYearOptions(Source).StartYear;
     FShowEdityear:= TwwPopupYearOptions(Source).ShowEditYear;
     Exit;
  end;
  inherited Assign(Source);
end;

procedure TwwDateTimeColors.Assign(Source: TPersistent);
var
  SourceName: string;
begin
  if Source = nil then SourceName := 'nil'
  else SourceName := Source.ClassName;
  if (Source = nil) or not (Source is TwwDateTimeColors) then
    raise EConvertError.CreateFmt(SAssignError, [SourceName, ClassName]);
//  FBackColor := TwwDateTimeColors(Source).BackColor;
  FTextColor := TwwDateTimeColors(Source).TextColor;
  FTitleBackColor := TwwDateTimeColors(Source).TitleBackColor;
  FTitleTextColor := TwwDateTimeColors(Source).TitleTextColor;
  FMonthBackColor := TwwDateTimeColors(Source).MonthBackColor;
  FTrailingTextColor := TwwDateTimeColors(Source).TrailingTextColor;
end;

procedure TwwDateTimeColors.SetColor(Index: Integer; Value: TColor);
begin
  if Owner is TwwMonthCalendar then
     MonthCal_SetColor(
        (Owner as TwwMonthCalendar).Handle, ColorIndex[Index], ColorToRGB(Value));
  case Index of
    0: FBackColor := Value;
    1: FTextColor := Value;
    2: FTitleBackColor := Value;
    3: FTitleTextColor := Value;
    4: FMonthBackColor := Value;
    5: FTrailingTextColor := Value;
  end;
end;


procedure TwwDateTimeColors.SetAllColors;
begin
  SetColor(0, FBackColor);
  SetColor(1, FTextColor);
  SetColor(2, FTitleBackColor);
  SetColor(3, FTitleTextColor);
  SetColor(4, FMonthBackColor);
  SetColor(5, FTrailingTextColor);
end;
type
 TCalendarPopupMenu = class(TPopupMenu)
   private
     PoppedUp: boolean;
   protected
     procedure Popup(X, Y: Integer); override;
   public
     function isPoppedUp: boolean;
 end;

 function TCalendarPopupMenu.isPoppedUp: boolean;
 begin
    result:= PoppedUp;
 end;

 procedure TCalendarPopupMenu.Popup(X, Y: Integer);
 begin
    PoppedUp:= True;
    inherited Popup(x,y);
//    Application.ProcessMessages;  {Allows processing of Mouse Messages to finish before clearing flag.}
    PoppedUp:= False;
 end;

constructor TwwMonthCalendar.Create(AOwner: TComponent);
var i:integer;
begin
  CheckCommonControl(ICC_DATE_CLASSES);
  FCalColors := TwwDateTimeColors.Create(Self);
  FPopupYearOptions:= TwwPopupYearOptions.create(Self);
  FDateTime := Now;
  inherited Create(AOwner);
  ControlStyle := [csOpaque, csClickEvents, csDoubleClicks, csFixedHeight];
  Color := clWindow;
  ParentColor := False;
  TabStop := True;
  Width := 155;
  FOptions:= [mdoDayState];
  FMaxSelectCount := 31;
  FMinDate := 0.0;
  FMaxDate := 0.0;
  FSelChanged := False;
  FDummyList := TList.Create;
  FFirstDayOfWeek := wwdowLocaleDefault;
  FMonthPopupMenu := TCalendarPopupMenu.Create(Self);
  {$ifdef wwDelphi5Up}
  FMonthPopupMenu.AutoHotKeys:= maManual;
  {$endif}
  FMonthPopupMenu.Alignment := paRight;
  for i:= 1 to 12 do begin
     FMonthPopupMenu.Items.Add(NewItem(LongMonthNames[i],0,False,True,nil,0,''));
     FMonthPopupMenu.Items[i-1].onClick := wwMonthPopupMenuClick;
  end;
  Patch:= VarArrayCreate([0, 0], varVariant);
  Patch[0]:= False; { 2/15/99 -  Internally used to skip data change event }

end;

destructor TwwMonthCalendar.Destroy;
begin
  if FCalColors.owner=self then FCalColors.Free;  { Paul, why check for owner? }
  FPopupYearOptions.Free;

  FDummyList.Free;
  FMonthPopupMenu.Free;
  inherited Destroy;
end;

procedure TwwMonthCalendar.MouseMove(Shift: TShiftState; X, Y: Integer);
var info:TMCHitTestInfo;
begin
   FillChar(info, SizeOf(TMCHitTestInfo), 0); { RSW }
   info.cbSize := sizeof(TMCHitTestInfo);
   info.pt := Point(X,Y);
   MonthCal_HitTest(Handle,info);
   if Assigned(FOnMouseMove) then begin
      if (info.st.wday=0) or (info.st.wday > 32) then
         FOnMouseMove(Self, Shift, X, Y, info.st.wMonth, info.st.wDay, info.st.wYear)
      else FOnMouseMove(Self, Shift, X, Y, info.st.wMonth, info.st.wDay, info.st.wYear);
   end;
end;

procedure TwwMonthCalendar.MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
var info:TMCHitTestInfo;
begin
   FillChar(info, SizeOf(TMCHitTestInfo), 0); { RSW }
   info.cbSize := sizeof(TMCHitTestInfo);
   info.pt := Point(X,Y);
   MonthCal_HitTest(Handle,Info);
   if Assigned(FOnMouseUp) then
   begin
      if (info.st.wday=0) or (info.st.wday > 32) then
         FOnMouseUp(Self, Button, Shift, X, Y, info.st.wMonth, 0, info.st.wYear)
      else FOnMouseUp(Self, Button, Shift, X, Y, info.st.wMonth, info.st.wDay, info.st.wYear);
   end;

   if (mdoMultiSelect in Options) then begin
     if FSelChanged then begin
       Change;
     end;
     FSelChanged := False;
   end;
end;

procedure TwwMonthCalendar.MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
var STA: packed array[1..2] of TSystemTime;
    var info:TMCHitTestInfo;
    curx,cury,i,numpopupyears:integer;
    APoint:TPoint;
    m,dy,yr:Word;
    months,yearoffset:integer;
begin
   // Added this code to fix bug when user right-clicked to choose "Go to Today"
   // on the month or year it would popup our popup menus incorrectly.  -ksw (9/24/98)
   if Button = mbRight then
   begin
     inherited;
     Exit;
   end;

   // 2/15/98 - PYW - Make sure calendar gets focus when mouse clicked on control.
   if not (Owner is TwwDBCustomDateTimePicker) then SetFocus;

   FillChar(info, SizeOf(TMCHitTestInfo), 0); { RSW }
   info.cbSize := sizeof(TMCHitTestInfo);
   info.pt := Point(X,Y);
   MonthCal_HitTest(Handle,Info);
   // if info.st.wday = 0 or > 32 then not a valid date.
   if Assigned(FOnMouseDown) then begin
      try
        if (info.st.wday=0) or (info.st.wday > 32) then
           FOnMouseDown(Self, Button, Shift, X, Y, info.st.wMonth, 0, info.st.wYear)
        else FOnMouseDown(Self, Button, Shift, X, Y, info.st.wMonth, info.st.wDay, info.st.wYear);
      except
         FAfterYearPopup := False;
         FAfterMonthPopup := False;
         exit;
      end;
   end;

   // Prevent Clicking on an Invalid Date (Min/Max Date Values) when clicking on actual Dates.
   if (info.st.wDay<>0) and (info.st.wDay < 32) then begin
      FAfterYearPopup := False;
      FAfterMonthPopup := False;

      if ((MaxDate<> 0.0) and
         (Trunc(MaxDate)<Trunc(EncodeDate(info.st.wyear,info.st.wmonth,info.st.wday)))) or
         (Trunc(MinDate)>Trunc(EncodeDate(info.st.wyear,info.st.wmonth,info.st.wday))) then
      begin
        if ((MaxDate<> 0.0) and
           (Trunc(MaxDate)<Trunc(EncodeDate(info.st.wyear,info.st.wmonth,info.st.wday)))) then
          DecodeDate(MaxDate,yr,m,dy)
        else
          DecodeDate(MinDate,yr,m,dy);
        Date:=EncodeDate(yr,m,dy);
        exit;
      end;
   end
   // Prevent Scrolling to an Invalid Date (Min/Max Date Values) when clicking on buttons.
   else if (info.uHit = MCHT_TITLEBTNNEXT) or (info.uHit = MCHT_TITLEBTNPREV) then
   begin
      FAfterYearPopup := False;
      FAfterMonthPopup := False;

      MonthCal_GetMonthRange(WindowHandle,GMR_VISIBLE,@STA[1]);
      months := MonthCal_GetMonthDelta(WindowHandle);
      DecodeDate(Date,yr,m,dy);
      if (info.uHit = MCHT_TITLEBTNPREV) then begin
         if STA[1].wMonth-Months > 0 then begin
           if Trunc(EncodeDate(STA[1].wYear,STA[1].wMonth-Months,min(dy,DaysThisMonth(STA[1].wMonth-(Months),STA[1].wYear))))<MinDate then
           begin
              Date:=Trunc(MinDate);
              MessageBeep(0); // 7/24/1998 - pw - Added Message Beep when setting to MinDate
           end
           else Date:=EncodeDate(STA[1].wYear,STA[1].wMonth-(Months),
              min(dy,DaysThisMonth(STA[1].wMonth-(Months),STA[1].wYear)));
         end
         else begin
           if Trunc(EncodeDate(STA[1].wYear-1,12+STA[1].wMonth-(Months),
               min(dy,DaysThisMonth(12+STA[1].wMonth-Months,STA[1].wYear-1))))<MinDate then
           begin
              Date:=Trunc(MinDate);
              MessageBeep(0);  // 7/24/1998 - pw - Added Message Beep when setting to MinDate
           end
           else Date:=EncodeDate(STA[1].wYear-1,12+STA[1].wMonth-Months,
               min(dy,DaysThisMonth(12+STA[1].wMonth-Months,STA[1].wYear)));
         end;
         Change;
      end
      else begin
         if STA[2].wMonth+(Months) <= 12 then begin
           if (MaxDate<>0.0) and (Trunc(EncodeDate(STA[2].wYear,STA[2].wMonth+(Months),min(dy,DaysThisMonth(STA[2].wMonth+(Months),STA[2].wYear))))>Trunc(MaxDate)) then
           begin
              Date:=Trunc(MaxDate);
              MessageBeep(0); // 7/24/1998 - pw - Added Message Beep when setting to MaxDate
           end
           else
              Date:=EncodeDate(STA[2].wYear,STA[2].wMonth+(Months),
                  min(dy,DaysThisMonth(STA[2].wMonth+(Months),STA[2].wYear)));
         end
         else begin
           if (MaxDate<>0.0) and (Trunc(EncodeDate(STA[2].wYear+1,STA[2].wMonth+(Months)-12,min(dy,DaysThisMonth(STA[2].wMonth+(Months)-12,STA[2].wYear+1))))>Trunc(MaxDate)) then
           begin
              Date:=Trunc(MaxDate);
              MessageBeep(0);  // 7/24/1998 - pw - Added Message Beep when setting to MaxDate
           end
           else Date:=EncodeDate(STA[2].wYear+1,STA[2].wMonth+Months-12,
                min(dy,DaysThisMonth(STA[2].wMonth+(Months)-12,STA[2].wYear+1)));
         end;
         Change;
      end;
      exit;
   end;

   curx:=x;
   cury:=y;
   //If TitleYear was clicked on then Get Positions and then popup the Year Menu.
   if info.uHit = MCHT_TITLEYEAR then begin
      FAfterMonthPopup := False;
      if (FYearPopupShowing or FAfterYearPopup) and (info.st.wMonth = FPrevPopupMonth) then begin
        FAfterYearPopup := False;
        exit;
      end;
      FPrevPopupMonth := info.st.wMonth;
      while Info.uhit = MCHT_TITLEYEAR do begin
         cury := cury+1;
         info.pt := Point(curx,cury);
         MonthCal_HitTest(Handle,Info);
      end;
      cury:=cury-1;

      info.pt := Point(curx,cury);
      MonthCal_HitTest(Handle,Info);

      while Info.uhit = MCHT_TITLEYEAR do begin
         curx := curx-1;
         info.pt := Point(curx,cury);
         MonthCal_HitTest(Handle,Info);
      end;
      curx:= curx+1;
      cury:=cury+1;

      if FYearPopupMenu = nil then
      begin
         FYearPopupMenu := TCalendarPopupMenu.Create(self);
         {$ifdef wwDelphi5Up}
         FYearPopupMenu.AutoHotKeys:= maManual;
         {$endif}
      end;

      NumPopupYears := FPopupYearOptions.YearsPerColumn * FPopupYearOptions.NumberColumns;

      while FYearPopupMenu.Items.count <> 0 do
         FYearPopupMenu.Items[0].Free;

      DecodeDate(Date,yr,m,dy);
      yearoffset :=0;
      if FPopupYearOptions.ShowEditYear {and (FPopupYearOptions.NumberColumns=1) }then begin      //!!! Add to wwintl....
         FYearPopupMenu.Items.Add(NewItem(wwInternational.MonthCalendar.PopupYearLabel,0,False,True,nil,0,''));
         FYearPopupMenu.Items[0].onClick := wwPopupMenuClick;
         FYearPopupMenu.Items.Add(NewItem('-',0,False,True,nil,0,''));
         yearoffset :=2;
      end;
      for i:= FPopupYearOptions.StartYear to FPopupYearOptions.StartYear+NumPopupYears-1 do
      begin
         FYearPopupMenu.Items.Add(NewItem(inttostr(i),0,False,True,nil,0,''));
         //Assign PopupMenu Item's OnClick event.
         FYearPopupMenu.Items[i-FPopupYearOptions.StartYear+yearoffset].onClick := wwPopupMenuClick;
         //Check Current Year
         FYearPopupMenu.Items[i-FPopupYearOptions.StartYear+yearoffset].Checked := (i = info.st.wyear);
         //Disable invalid years based on min and max dates.
         if (Trunc(MaxDate) <> 0) and
            (Trunc(MaxDate) < Trunc(EncodeDate(i,m,min(dy,DaysThisMonth(m,i))))) then
            FYearPopupMenu.Items[i-FPopupYearOptions.StartYear+yearoffset].Enabled := False;

         if Trunc(MinDate) > Trunc(EncodeDate(i,m,min(dy,DaysThisMonth(m,i)))) then
            FYearPopupMenu.Items[i-FPopupYearOptions.StartYear+yearoffset].Enabled := False;

         //Add bar breaks after certain number of years for each column.
         if ((((i-FPopupYearOptions.StartYear) mod FPopupYearOptions.YearsPerColumn) = 0) and
            (i <> FPopupYearOptions.StartYear)) or
            ((i= FPopupYearOptions.StartYear) and (FPopupYearOptions.ShowEditYear) and
             (FPopupYearOptions.YearsPerColumn<>1)) then
            FYearPopupMenu.Items[i-FPopupYearOptions.StartYear+yearoffset].break := mbbarbreak;
      end;

{      if FPopupYearOptions.ShowEditYear and (FPopupYearOptions.NumberColumns>1) then begin      //!!! Add to wwintl....
         FYearPopupMenu.Items.Add(NewItem(wwInternational.MonthCalendar.PopupYearLabel,0,False,True,nil,0,''));
         FYearPopupMenu.Items[FYearPopupMenu.Items.Count-1].onClick := wwPopupMenuClick;
         FYearPopupMenu.Items[FYearPopupMenu.Items.Count-1].break := mbbarbreak;
      end;}
      if (FPopupYearOptions.ShowEditYear) and (FPopupYearOptions.YearsPerColumn<>1) then
      begin
         curx := curx-GetParentForm(self).Canvas.TextWidth(wwInternational.MonthCalendar.PopupYearLabel);
         curx := curx - (screen.pixelsperinch * 45) div 96;  //Calculate Correct Popup Menu Width For Label
      end;

      APoint := ClientToScreen(Point(curx, cury+1));
      FPopupSystemTime := info.st;
      FAfterYearPopup := False;
      FYearPopupMenu.Popup(APoint.x, APoint.y);
      FAfterYearPopup := True;
   end
   //If TitleMonth was clicked on then Get Positions and then popup the Month Menu.
   else if info.uHit = MCHT_TITLEMONTH then begin
      FAfterYearPopup := False;
      if (FMonthPopupShowing or FAfterMonthPopup)and (FPrevPopupMonth = info.st.wMonth) then begin
        FAfterMonthPopup := False;
        FAfterYearPopup := False;
        exit;
      end;
      FPrevPopupMonth := info.st.wMonth;
      while Info.uhit = MCHT_TITLEMONTH do begin
         cury := cury+1;
         info.pt := Point(curx,cury);
         MonthCal_HitTest(Handle,Info);
      end;
      cury:=cury-1;
      info.pt := Point(curx,cury);
      MonthCal_HitTest(Handle,Info);
      while Info.uhit = MCHT_TITLEMONTH do begin
         curx := curx+1;
         info.pt := Point(curx,cury);
         MonthCal_HitTest(Handle,Info);
      end;
      curx:= curx-1;
      cury:=cury+1;

      DecodeDate(Date,yr,m,dy);

      for i:= 1 to 12 do begin
          FMonthPopupMenu.Items[i-1].Checked := (i = info.st.wmonth);
         //Disable invalid years based on min and max dates.
          FMonthPopupMenu.Items[i-1].Enabled := True;
          if (Trunc(MaxDate) <> 0) and
             (Trunc(MaxDate) < Trunc(EncodeDate(info.st.wYear,i,min(dy,DaysThisMonth(i,info.st.wYear))))) then
             FMonthPopupMenu.Items[i-1].Enabled := False;

          if Trunc(MinDate) > Trunc(EncodeDate(info.st.wYear,i,min(dy,DaysThisMonth(i,info.st.wYear)))) then
             FMonthPopupMenu.Items[i-1].Enabled := False;
      end;

      APoint := ClientToScreen(Point(curx, cury+1));
      FPopupSystemTime := info.st;
      FAfterMonthPopup := False;
      FMonthPopupMenu.Popup(APoint.x, APoint.y);
      FAfterMonthPopup := True;
   end
   else begin
      FAfterMonthPopup := False;
      FAfterYearPopup := False;
   end;
end;

procedure TwwMonthCalendar.wwPopupMenuClick(Sender: TObject);
var d,m,y:Word;
    md,mm,my:Word;
    mind,minm,miny:Word;
    minvalidyear,maxvalidyear:word;
    STA: packed array[1..2] of TSystemTime;
    inputyear:String;
    defaultyear: string;
    function LessThanDate(y1,m1,d1,y2,m2,d2:word):boolean;
    begin
       result :=False;
       if y1<y2 then result := True
       else if (y1=y2) then begin
         if m1<m2 then result :=True
         else if m1=m2 then
            if d1 < d2 then result :=True;
       end
    end;
begin
   FAfterMonthPopup := False;
   FAfterYearPopup := False;

// Get Starting and Ending months and number of months.
   MonthCal_GetMonthRange(WindowHandle,GMR_VISIBLE,@STA[1]);

   DecodeDate(Date,y,m,d);
   DecodeDate(MaxDate,my,mm,md);
   DecodeDate(MinDate,miny,minm,mind);

   if Trunc(MinDate)<>0 then begin
      if (LessThanDate(miny,m,d,miny,minm,mind)) then minvalidyear := miny+1
      else minvalidyear := miny;
   end
   else minvalidyear := 0;

   if (Trunc(MaxDate)<>0) then begin
      if (LessThanDate(my,mm,md,my,m,d)) then maxvalidyear := my-1
      else maxvalidyear := my;
   end
   else maxvalidyear := 0;

   // Accept only valid dates.  ????  PW
   if ((Sender as TMenuItem).Caption = wwInternational.MonthCalendar.PopupYearLabel) then
   begin
      defaultyear:= inttostr(FPopupSystemTime.wYear);
      if (StrToIntDef(defaultyear,-1)=-1) or ((MaxDate<>0)and (maxvalidyear=0)) or
         ((MinDate<>0)and(minvalidyear=0)) then begin
         defaultyear := defaultyear;
      end
      else if ((MaxDate <> 0) and LessThanDate(my,mm,md,StrToInt(DefaultYear),m,d)) then begin
         defaultyear:=inttostr(maxvalidyear);
      end
      else if (LessThanDate(StrToInt(DefaultYear),m,d,miny,minm,mind)) then begin
         defaultyear:=inttostr(minvalidyear);
      end;
//      inputyear := inputbox('Enter Valid Year','Enter New Year:',defaultyear);
      if (MinValidYear=0) then begin
         if MaxValidYear<>0 then
            inputyear := inputbox(wwInternational.MonthCalendar.EnterYearPrompt+' (<='+IntToStr(MaxValidYear)+')',
               'Enter New Year:',defaultyear)
         else
            inputyear := inputbox(wwInternational.MonthCalendar.EnterYearPrompt,' ',defaultyear)
      end
      else if (MaxValidYear=0) then begin
         if MinValidYear<>0 then
            inputyear := inputbox(wwInternational.MonthCalendar.EnterYearPrompt+' (>='+IntToStr(MinValidYear)+')',
               'Enter New Year:',defaultyear)
         else
            inputyear := inputbox(wwInternational.MonthCalendar.EnterYearPrompt,' ',defaultyear)
      end
      else
         inputyear := inputbox(wwInternational.MonthCalendar.EnterYearPrompt+' ('+IntToStr(MinValidYear)+'-'+IntToStr(MaxValidYear)+')',
               '',defaultyear);

      while (strToIntDef(inputyear,-1) = -1) or
         ((MaxDate <> 0) and (LessThanDate(my,mm,md,StrToInt(InputYear),m,d))) or
         (LessThanDate(StrToInt(InputYear),m,d,miny,minm,mind)) do
      begin
         if (StrToIntDef(inputyear,-1)=-1) or ((MaxDate<>0)and (maxvalidyear=0)) or
             ((MinDate<>0)and(minvalidyear=0)) then begin
            defaultyear := defaultyear;
         end
         else if ((MaxDate <> 0) and LessThanDate(my,mm,md,StrToInt(InputYear),m,d)) then begin
            defaultyear:=inttostr(maxvalidyear);
         end
         else if (LessThanDate(StrToInt(InputYear),m,d,miny,minm,mind)) then begin
            defaultyear:=inttostr(minvalidyear);
         end;
//         inputyear := inputbox('Edit Valid Year'+' ('+IntToStr(MinValidYear)+'-'+IntToStr(MaxValidYear)+')',
//               'Enter New Year:',defaultyear)
      if (MinValidYear=0) then begin
         if MaxValidYear<>0 then
            inputyear := inputbox(wwInternational.MonthCalendar.EnterYearPrompt+' (<='+IntToStr(MaxValidYear)+')',
               'Enter New Year:',defaultyear)
         else
            inputyear := inputbox(wwInternational.MonthCalendar.EnterYearPrompt,' ',defaultyear)
      end
      else if (MaxValidYear=0) then begin
         if MinValidYear<>0 then
            inputyear := inputbox(wwInternational.MonthCalendar.EnterYearPrompt+' (>='+IntToStr(MinValidYear)+')',
               'Enter New Year:',defaultyear)
         else
            inputyear := inputbox(wwInternational.MonthCalendar.EnterYearPrompt,' ',defaultyear)
      end
      else
         inputyear := inputbox(wwInternational.MonthCalendar.EnterYearPrompt+' ('+IntToStr(MinValidYear)+'-'+IntToStr(MaxValidYear)+')',
               'Enter New Year:',defaultyear);

      end;
   end
   else inputyear := (Sender as TMenuItem).Caption;

   //Valid Year so compute new date for calendar.
   if (FPopupSystemTime.wYear < StrToInt(inputyear)) then begin
      //Handle scrolling issues.
      SetMonthCalDateTime(EncodeDate(StrToInt(inputyear),sta[2].wmonth,1));
      Date := EncodeDate(StrToInt(inputyear),m,min(d,DaysThisMonth(m,StrToInt(inputyear))));
      Change;
   end
   else if (FPopupSystemTime.wYear > StrToInt(inputyear)) then begin
      SetMonthCalDateTime(EncodeDate(StrToInt(inputyear),sta[1].wmonth,1));
      Date := EncodeDate(StrToInt(inputyear),m,min(d,DaysThisMonth(m,StrToInt(inputyear))));
      Change;
   end;
end;

procedure TwwMonthCalendar.wwMonthPopupMenuClick(Sender: TObject);
var d,m,y:Word;
    i:Integer;
    endmonth,endyear,startmonth,startyear:Integer;
    STA: packed array[1..2] of TSystemTime;
begin
   FAfterMonthPopup := False;
   FAfterYearPopup := False;

   DecodeDate(Date,y,m,d);
// Get Starting and Ending months and number of months.
   MonthCal_GetMonthRange(WindowHandle,GMR_VISIBLE,@STA[1]);
   for i:= 1 to 12 do begin
     if (LongMonthNames[i]=(Sender as TMenuItem).Caption) then
        break;
   end;

   if (FPopupSystemTime.wMonth < i) then begin
      EndMonth := sta[2].wMonth+i-FPopupSystemTime.wMonth;
      if EndMonth > 12 then begin
         Endyear:= sta[2].wYear+1;
         EndMonth := EndMonth-12;
      end
      else EndYear:=sta[2].wYear;

      SetMonthCalDateTime(EncodeDate(EndYear,EndMonth,1));
      Date := EncodeDate(FPopupSystemTime.wYear,i,min(d,DaysThisMonth(i,FPopupSystemTime.wYear)));
      Change;
   end
   else if (FPopupSystemTime.wMonth > i) then begin
      StartMonth := sta[1].wMonth-(FPopupSystemTime.wMonth-i);
      if StartMonth < 1 then begin
         Startyear:= FPopupSystemTime.wYear-1;
         StartMonth := 12+StartMonth;
      end
      else StartYear:=FPopupSystemTime.wYear;

      SetMonthCalDateTime(EncodeDate(StartYear,StartMonth,1));
      Date := EncodeDate(FPopupSystemTime.wYear,i,min(d,DaysThisMonth(i,FPopupSystemTime.wYear)));
      Change;
   end;
end;

procedure TwwMonthCalendar.WndProc(var Message: TMessage);
var info:TMCHitTestInfo;
begin
  if (not (csdesigning in componentstate)) and visible then { RSW - add test for visible }
  case Message.Msg of
    WM_LBUTTONDBLCLK,
    WM_LBUTTONDOWN:
    begin
       FYearPopupShowing := ((FYearPopupMenu<>Nil) and (TCalendarPopupMenu(FYearPopupMenu).IsPoppedUp));
       FMonthPopupShowing := ((FMonthPopupMenu<>Nil) and (TCalendarPopupMenu(FMonthPopupMenu).IsPoppedUp));
       // The following code is used to hide ugly display of month calendar control
       // when one clicks on the year property.
       FillChar(info, SizeOf(TMCHitTestInfo), 0); { RSW }
       info.cbSize := sizeof(TMCHitTestInfo);
       info.pt := Point(TWMMouse(Message).xpos,TWMMouse(Message).ypos);

       MonthCal_HitTest(Handle,info);
       if (info.uHit = MCHT_TITLEYEAR) or (info.uHit = MCHT_TITLEMONTH) then begin
          MouseDown(mbleft,KeysToShiftState(TWMMouse(Message).Keys),TWMMouse(Message).xpos,TWMMouse(Message).ypos);
          Message.Result := 1;
          exit;
       end
       else if (info.uHit = MCHT_TITLEBTNNEXT) or (info.uHit = MCHT_TITLEBTNPREV) then
       begin
          MouseDown(mbleft,KeysToShiftState(TWMMouse(Message).Keys),TWMMouse(Message).xpos,TWMMouse(Message).ypos);
          Message.Result := 1;
          exit;
       end
       else
       begin
          if (info.st.wDay<>0) and (info.st.wDay < 32) then begin
             if ((MaxDate<> 0.0) and
                (Trunc(MaxDate)<Trunc(EncodeDate(info.st.wyear,info.st.wmonth,min(info.st.wday,DaysThisMonth(info.st.wmonth,info.st.wYear)))))) or
                (Trunc(MinDate)>Trunc(EncodeDate(info.st.wyear,info.st.wmonth,min(info.st.wday,DaysThisMonth(info.st.wmonth,info.st.wYear))))) then
             begin
                MouseDown(mbleft,KeysToShiftState(TWMMouse(Message).Keys),TWMMouse(Message).xpos,TWMMouse(Message).ypos);
                Message.Result:=1;
                exit;
             end;
          end;
       end;
    end;
    WM_LBUTTONUP,WM_MOUSEMOVE:
    begin
       FillChar(info, SizeOf(TMCHitTestInfo), 0); { RSW }
       info.cbSize := sizeof(TMCHitTestInfo);
       info.pt := Point(TWMMouse(Message).xpos,TWMMouse(Message).ypos);

       MonthCal_HitTest(Handle,info);
       if (info.st.wDay<>0) and (info.st.wDay < 32) then begin
          if ((MaxDate<> 0.0) and
             (Trunc(MaxDate)<Trunc(EncodeDate(info.st.wyear,info.st.wmonth,min(info.st.wday,DaysThisMonth(info.st.wmonth,info.st.wYear)))))) or
             (Trunc(MinDate)>Trunc(EncodeDate(info.st.wyear,info.st.wmonth,min(info.st.wday,DaysThisMonth(info.st.wmonth,info.st.wYear))))) then
          begin
             if Message.Msg = WM_LButtonUP then
                MouseUp(mbleft,KeysToShiftState(TWMMouse(Message).Keys),TWMMouse(Message).xpos,TWMMouse(Message).ypos)
             else if Message.Msg = WM_LButtonUP then
                MouseMove(KeysToShiftState(TWMMouse(Message).Keys),TWMMouse(Message).xpos,TWMMouse(Message).ypos);

             Message.Result:=1;
             exit;
          end;
       end
    end;
  end;
  inherited;
end;

procedure TwwMonthCalendar.SetFirstDayOfWeek(Value: TwwCalDayOfWeek);
var
  DOWFlag: Integer;
  A: array[0..1] of char;
begin
    if Value = wwdowLocaleDefault then
    begin
      GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_IFIRSTDAYOFWEEK, A, SizeOf(A));
      DOWFlag := Ord(A[0]) - Ord('0');
    end
    else
      DOWFlag := Ord(Value);
    if Handle <> 0 then
      MonthCal_SetFirstDayOfWeek(WindowHandle, DOWFlag);
  FFirstDayOfWeek := Value;
end;

procedure TwwMonthCalendar.SetOptions(val: TwwMonthOptions);
begin
   FOptions:= val;
   RecreateWnd;
end;

procedure TwwMonthCalendar.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  CreateSubClass(Params, MONTHCAL_CLASS);
  with Params do
  begin
    if mdoDayState in Options then Style:= Style or MCS_DAYSTATE;
    if mdoMultiSelect in Options then Style:= Style or MCS_MULTISELECT;
    if mdoWeekNumbers in Options then Style:= Style or MCS_WEEKNUMBERS;
    if mdoNoTodayCircle in Options then Style:= Style or $0008;
    if (mdoNoToday in Options) and UpdatedComCtlVersion then { 8/25/98 }
       Style:= Style or $0010;
    if FBorder=bsSingle then Style := Style or WS_Border;
    WindowClass.Style := WindowClass.Style and not (CS_HREDRAW or CS_VREDRAW) or
      CS_DBLCLKS;
  end;
end;

procedure TwwMonthCalendar.CreateWnd;
begin
  inherited CreateWnd;
  SetRange(FMinDate, FMaxDate);
  if mdoMultiSelect in Options then begin
     MonthCal_SetMaxSelCount(Handle,FMaxSelectCount);
     // 7/20/1998 - Only set Start and End Dates when if they are nonzero.
     //             Otherwise let the DateTime update the range.
     if (Trunc(FStartDate)<>0) and (Trunc(FEndDate)<>0)then
        SetSelRange(FStartDate, FEndDate)
     else SetDateTime(FDateTime);
  end
  else SetDateTime(FDateTime);
  FCalColors.SetAllColors;
  SetFirstDayOfWeek(FFirstDayOfWeek);
  AdjustHeight;
end;

procedure TwwMonthCalendar.CMColorChanged(var Message: TMessage);
begin
  inherited;
  if HandleAllocated then {1/9/98 - Make sure Handle is allocated before calling InvalidateRect}
     InvalidateRect(Handle, nil, True);
end;

procedure TwwMonthCalendar.CMFontChanged(var Message: TMessage);
begin
  inherited;
  AdjustHeight;
  if HandleAllocated then {1/9/98 - Make sure Handle is allocated before calling InvalidateRect}
     InvalidateRect(Handle, nil, True);
end;

(*{$ifdef wwdelphi4up}
type TMDSArray = array[0..MaxMonthForDayState-1] of TMonthDayState;
     PMDSArray = ^TMDSArray;

procedure TwwMonthCalendar.RefreshBoldDays;
var STA: packed array[1..2] of TSystemTime;
    MDSP: PMDSArray;
    MonthCount,i:Integer;
    curMonth,curDay,curYear:Integer;
    curDate:TDateTime;
    accept:Boolean;
    function BoldDay(ds:TMonthDayState;iDay:Integer):TMonthDayState;
    begin
      if (iDay > 0) and (iDay < 32) then
         ds := ds or (1 shl (iDay-1));
      result := ds;
    end;
begin
  MonthCount := MonthCal_GetMonthRange(Handle, GMR_DAYSTATE, @sta[1]);
  GetMem(MDSP, MonthCount * SizeOf(TMonthDayState));
  try
    for i:=0 to MonthCount-1 do begin
       //Can only display up to 14 monthdaystates so exit if larger than 14.
       if i >= MaxMonthForDayState then exit;

       //Get curmonth and curyear for this day state.
       curMonth := (sta[1].wMonth+i) mod 12;
       if curMonth =0 then curMonth := 12;
       curYear := sta[1].wYear+(((i+sta[1].wMonth)-1) div 12);

       MDSP[i] := TMONTHDAYSTATE(0); //Initialize to 0's
       //Loop through and update monthdaystates...
       for curDay:=1 to DaysThisMonth(curMonth,curYear) do begin
           accept := False;
           if Assigned(FOnCalcBoldDay) then begin
              curDate := EncodeDate(curYear,curMonth,curDay);
              FOnCalcBoldDay(self,curDate,curMonth,curDay,curYear,accept);
           end;
           if accept then MDSP[i]:=BOLDDAY(MDSP[i],curDay);
       end;
    end;
    Win32Check(BOOL(SendMessage(Handle, MCM_SETDAYSTATE, MonthCount, Longint(MDSP))));
  finally
    FreeMem(MDSP);
  end;
end;
{$endif}*)

procedure TwwMonthCalendar.CNNotify(var Message: TWMNotify);
var tempstart,tempend:TDateTime;
    imax,i:integer;
    st:TSystemTime;
    curMonth,curDay,curYear:Integer;
    DayStateArray: packed array[0..MaxMonthForDayState-1] of TMonthDayState;
    accept:Boolean;
    curDate:TDate;

  function IsBlankSysTime(ST: TSystemTime): Boolean;
  begin
    with ST do
      Result := (wYear = 0) and (wMonth = 0) and (wDayOfWeek = 0) and
        (wDay = 0) and (wHour = 0) and (wMinute = 0) and (wSecond = 0) and
        (wMilliseconds = 0);
  end;
  function BoldDay(ds:TMonthDayState;iDay:Integer):TMonthDayState;
  begin
     if (iDay > 0) and (iDay < 32) then
        ds := ds or (1 shl (iDay-1));
     result := ds;
  end;
begin
  with Message, Message.NMHdr^ do
  begin
    Result := 0;
    case code of
      MCM_HitTest:
      begin
//         Showmessage('hi');
      end;
      MCN_GETDAYSTATE:  {Allow user to change bold day settings in OnCalcBoldDay}
        begin
            if (csLoading in componentstate) then exit;

            imax := PNMDayState(NMHdr)^.cDayState;  {Number of MonthDayStates for monthcalendar}
            for i:=0 to iMax-1 do                   {i is the current MonthDayState}
              begin
                if i >= MaxMonthForDayState then exit;
                st:=PNMDayState(NMHdr)^.stStart;    {Starting Date for First Month Day State}

                curMonth := (st.wMonth+i) mod 12;
                if curMonth =0 then curMonth := 12;
                curYear := st.wYear+(((i+st.wMonth)-1) div 12);

                DayStateArray[i] := TMONTHDAYSTATE(0);
                for curDay:=1 to DaysThisMonth(curMonth,curYear) do begin
                   accept := False;
                   if Assigned(FOnCalcBoldDay) then begin
                      curDate := EncodeDate(curYear,curMonth,curDay);
                      FOnCalcBoldDay(Self,curDate,curMonth,curDay,curYear,accept);
                   end;
                   if accept then begin
                      DayStateArray[i]:=BOLDDAY(DayStateArray[i],curDay);
                   end;
                end;
              end;
          PNMDayState(NMHdr)^.prgDayState := @DayStateArray;
        end;
      MCN_SELCHANGE:
        begin
          Tempstart:=Startdate;     {Save Start and End Dates}
          Tempend:=EndDate;

          if Trunc(SystemTimeToDateTime(PNMSelChange(NMHdr)^.stSelStart)) >= Trunc(MinDate) then
             StartDate:= Trunc(SystemTimeToDateTime(PNMSelChange(NMHdr)^.stSelStart))
          else StartDate := MinDate;

          if (mdoMultiSelect in Options) then  {Update EndDate if MultiSelect}
          begin
             if (Trunc(SystemTimeToDateTime(PNMSelChange(NMHdr)^.stSelEnd)) >= Trunc(MinDate)) then
                EndDate := Trunc(SystemTimeToDateTime(PNMSelChange(NMHdr)^.stSelEnd))
             else EndDate := MinDate;
             if (Trunc(tempstart) <> Trunc(StartDate)) or
                (Trunc(tempend) <> Trunc(EndDate)) then
                FSelChanged := True;      {MultiSelection has Changed}
          end
          else EndDate:=StartDate;

          if (Trunc(StartDate)=Trunc(EndDate))then
          begin
             // 2/15/98 - PYW - Don't call change when no changes to date have occurred.
             if Trunc(StartDate)<>Trunc(Date) then
             begin
                SetDate(StartDate);
                Change;
             end;
          end;

                   //Don't Call OnChange event while dragging and multiselecting
//          if (mdoMultiSelect in Options) then begin
//             exit; // MouseUp handles OnChange event when Multiselect complete.
//          end
//          else begin
//             Change;
//          end;
        end;
    else
      inherited;
    end;
  end;
end;

procedure TwwMonthCalendar.AdjustHeight;
var
  DC: HDC;
  SaveFont: HFont;
  SysMetrics, Metrics: TTextMetric;
  Rect:TRect;
  Flag:Boolean;
begin
  Flag := MonthCal_GetMinReqRect(WindowHandle,Rect);

  DC := GetDC(0);
  try
    GetTextMetrics(DC, SysMetrics);
    SaveFont := SelectObject(DC, Font.Handle);
    GetTextMetrics(DC, Metrics);
    SelectObject(DC, SaveFont);
  finally
    ReleaseDC(0, DC);
  end;

  if Flag then begin
     if Rect.Bottom > Height then
        Height := Rect.bottom;
     if Rect.Right > Width then
        Width := Rect.right;
  end;
 // What does this code do?
 // else Height := Metrics.tmHeight + (GetSystemMetrics(SM_CYBORDER) * 8);
 //
end;

function TwwMonthCalendar.GetStartDate: TDate;
begin
  Result := FStartDate;
end;

function TwwMonthCalendar.GetEndDate: TDate;
begin
  Result := FEndDate;
end;

function TwwMonthCalendar.GetDate: TDate;
begin
  Result := TDate(FDateTime);
end;

function TwwMonthCalendar.GetTime: TTime;
begin
  Result := TTime(FDateTime);
end;

function TwwMonthCalendar.GetHeight: Integer;
begin
  Result := inherited Height;
end;

function TwwMonthCalendar.GetWidth: Integer;
begin
  Result := inherited Width;
end;

//function TwwMonthCalendar.GetMaxSelectCount;
//begin
//   Result := MonthCal_GetMaxSelCount(Handle);
//end;

procedure TwwMonthCalendar.SetCalColors(Value: TwwDateTimeColors);
begin
  if FCalColors <> Value then FCalColors.Assign(Value);
end;

procedure TwwMonthCalendar.SetDate(Value: TDate);
begin
  if Trunc(FDateTime) <> Trunc(Value) then
  begin
    Value := Trunc(Value) + Frac(FDateTime);
    if Value = 0.0 then
    begin
      Invalidate;
    end
    else begin
      try                    {Compare dates only, ignore time portion}
        if (FMaxDate <> 0.0) and (Trunc(Value) > FMaxDate) then
          raise EDateTimeError.CreateFmt(SDateTimeMax, [DateToStr(FMaxDate)]);
        if (FMinDate <> 0.0) and (Trunc(Value) < FMinDate) then
          raise EDateTimeError.CreateFmt(SDateTimeMin, [DateToStr(FMinDate)]);
        SetDateTime(Value);
      except
        SetDateTime(FDateTime);
        raise;
      end;
    end;
  end;
end;

// Sets the Selected Date in the DateTime Picker when MultiSelect
function TwwMonthCalendar.SetSelRange(AStart,AEnd:TDate):boolean;
var STA: packed array[1..2] of TSystemTime;
begin
   result := False;
   if not (mdoMultiSelect in Options) then exit;
   DateTimeToSystemTime(AStart, STA[1]);
   DateTimeToSystemTime(AEnd, STA[2]);
   STA[1].wDayOfWeek := DayOfWeek(AStart);
   STA[2].wDayOfWeek := DayOfWeek(AEnd);
   result := MonthCal_SetSelRange(handle,@STA[1]);

   //1/9/98 - pw - Update Multiselection Start and End Dates
   if Trunc(AStart) < Trunc(AEnd) then
   begin
      FStartDate := AStart;
      FEndDate := AEnd;
   end
   else begin
      FStartDate := AEnd;
      FEndDate := AStart;
   end;
end;

// Set the EndDate for a MonthCalendar with MultiSelect
procedure TwwMonthCalendar.SetEndDate(Value: TDate);
begin
    Value := Trunc(Value);
    if Value = 0.0 then
    begin
      Invalidate;
    end
    else begin
      try
        if (FMaxDate <> 0.0) and (Value > FMaxDate) then begin
          FEndDate := FMaxDate;
          raise EDateTimeError.CreateFmt(SDateTimeMax, [DateToStr(FMaxDate)]);
        end;
        if (FMinDate <> 0.0) and (Value < FMinDate) then begin
          FEndDate := FMinDate;
          raise EDateTimeError.CreateFmt(SDateTimeMin, [DateToStr(FMinDate)]);
        end;
        FEndDate := Value;
        if (FStartDate <> 0) and (FStartDate <> Value) then
           SetSelRange(FStartDate,FEndDate);
      except
        raise;
      end;
    end;
end;

// Set the StartDate for a MonthCalendar with MultiSelect
procedure TwwMonthCalendar.SetStartDate(Value: TDate);
begin
    Value := Trunc(Value);
    if Value = 0.0 then
    begin
      Invalidate;
    end
    else begin
      try
        if (FMaxDate <> 0.0) and (Value > FMaxDate) then
        begin
          FStartDate := MaxDate;
          raise EDateTimeError.CreateFmt(SDateTimeMax, [DateToStr(FMaxDate)]);
        end;
        if (FMinDate <> 0.0) and (Value < FMinDate) then
        begin
          FStartDate := MinDate;
          raise EDateTimeError.CreateFmt(SDateTimeMin, [DateToStr(FMinDate)]);
        end;
        FStartDate := Value;
        if (FEndDate <> 0) and (FEndDate <> Value) then
           SetSelRange(FStartDate,FEndDate);
      except
        raise;
      end;
    end;
end;

function TwwMonthCalendar.SetMonthCalDateTime(Value:TDateTime):Boolean;
var  ST: TSystemTime;
begin
  DateTimeToSystemTime(Value, ST);
  ST.wDayOfWeek := DayOfWeek(Value);

  if not (mdoMultiSelect in Options) then
     result :=MonthCal_SetCurSel(handle, ST)
  else
     result :=SetSelRange(Value,Value);
end;

procedure TwwMonthCalendar.SetDateTime(Value: TDateTime);
begin
  // Make sure that the monthcalendar is set to a valid date based on min/max settings.
  if (MaxDate <> 0.0) and (Trunc(Value)>MaxDate) then Value := MaxDate
  else if (MinDate <> 0.0) and (Trunc(Value)<MinDate) then Value := MinDate
  else if (MinDate = 0.0) and (Trunc(Value)<MinDate) then Value := EncodeDate(1899,12,31);

  // 7/20/98 - Make sure that when multiselect is on that StartDate and EndDates are updated
  //           when the DateTime Changes.
  if (mdoMultiSelect in Options) then begin
     FStartDate := Value;
     FEndDate := Value;
  end;

  if SetMonthCalDateTime(Value) then FDateTime := Value;
end;

procedure TwwMonthCalendar.SetMaxDate(Value: TDate);
begin            {9/10/98 - Check for clearing of max date when mindate <> 0}
  if (Value <> 0.0) and (FMinDate <> 0.0) and (Value < FMinDate) then
    raise EDateTimeError.CreateFmt(SDateTimeMin, [DateToStr(FMinDate)]);
  if FMaxDate <> Value then
  begin
    SetRange(FMinDate, Value);
    FMaxDate := Value;
  end;
end;

procedure TwwMonthCalendar.SetPopupYearOptions(Value: TwwPopupYearOptions);
begin
   if FPopupYearOptions<>Value then
      FPopupYearOptions.Assign(Value); { RSW }

//  if (FPopupYearOptions <> Value) then
//  begin
//    FPopupYearOptions := Value;
//  end;
end;

procedure TwwMonthCalendar.SetMaxSelectCount(Value: Integer);
begin
  if FMaxSelectCount <> Value then
  begin
    FMaxSelectCount := Value;
    MonthCal_SetMaxSelCount(Handle,Value);
  end;
end;

procedure TwwMonthCalendar.SetMinDate(Value: TDate);
begin
  if (FMaxDate <> 0) and (Value > FMaxDate) then
    raise EDateTimeError.CreateFmt(SDateTimeMin, [DateToStr(FMaxDate)]);
  if FMinDate <> Value then
  begin
    SetRange(Value, FMaxDate);
    FMinDate := Value;
  end;
end;

procedure TwwMonthCalendar.SetRange(MinVal, MaxVal: TDateTime);
var
  STA: packed array[1..2] of TSystemTime;
  Flags: DWORD;
begin
  Flags := 0;
  if Double(MinVal) <> 0.0 then
  begin
    Flags := Flags or GDTR_MIN;
    DateTimeToSystemTime(MinVal, STA[1]);
    STA[1].wDayOfWeek := DayOfWeek(MinVal);
  end;
  if Double(MaxVal) <> 0.0 then
  begin
    Flags := Flags or GDTR_MAX;
    DateTimeToSystemTime(MaxVal, STA[2]);
    STA[2].wDayOfWeek := DayOfWeek(MaxVal);
  end;
  if (Flags <> 0) then Monthcal_SetRange(Handle, Flags, @STA[1]);
end;

procedure TwwMonthCalendar.SetBorder(Value: TBorderStyle);
begin
  if FBorder <> Value then
  begin
    FBorder := Value;
    RecreateWnd;
  end;
end;

procedure TwwMonthCalendar.SetHeight(Value: Integer);
var flag:boolean;
    Rect:TRect;
begin
  if (Height <> Value) then
  begin
    Flag := MonthCal_GetMinReqRect(WindowHandle,Rect);
    if flag then begin
       if (Value >= (Rect.Bottom)) then
           inherited Height := Value
       else inherited Height := Rect.Bottom;
    end
    else inherited Height := Value;

    if not (csDesigning in ComponentState) then RecreateWnd;
  end;
end;

procedure TwwMonthCalendar.SetWidth(Value: Integer);
var flag:boolean;
    Rect:TRect;
begin
  if (Width <> Value) then
  begin
    Flag := MonthCal_GetMinReqRect(WindowHandle,Rect);
    if flag then begin
       if (Value >= (Rect.Right)) then
           inherited Width := Value
       else inherited Width := Rect.Right;
    end
    else inherited Width := Value;

    if not (csDesigning in ComponentState) then RecreateWnd;
  end;
end;

procedure TwwMonthCalendar.SetTime(Value: TTime);
begin
  if Frac(FDateTime) <> Frac(Value) then
  begin
    Value := Trunc(FDateTime) + Frac(Value);
    if Value = 0.0 then
    begin
      Invalidate;
    end
    else
      SetDateTime(Value);
  end;
end;

procedure TwwMonthCalendar.KeyDown(var Key: Word; Shift: TShiftState);
var pst: TSystemTime;
    tempDate: TDateTime;
    STA: packed array[1..2] of TSystemTime;
begin
  inherited KeyDown(Key, Shift);

  if key in [vk_right, vk_left, vk_down, vk_up, vk_next, vk_prior] then
  begin
    if mdoMultiSelect in Options then
    begin
       MonthCal_GetSelRange(handle,@STA);
       if (Trunc(SystemTimeToDateTime(STA[1])) =
           Trunc(SystemTimeToDateTime(STA[2]))) then
         pst := STA[1]
       else if (Key=VK_NEXT) or (Key=VK_Prior) then begin
         Key:=0;
         exit;
       end;
    end
    else MonthCal_GetCurSel(handle, pst);

    case key of
     vk_right:begin  {Handle Keyboard ShiftSelect}
                 if (mdoMultiSelect in Options) then begin
                    if ssshift in Shift then
                       if (Date < Trunc(SystemTimeToDateTime(STA[2]))) then
                          SetSelRange(Date,Trunc(SystemTimeToDateTime(STA[2])+1))
                        else
                          SetSelRange(Trunc(SystemTimeToDateTime(STA[1])+1),Date)
                    else Date:=Date+1;
                 end
                 else Date:= Date + 1;
              end;
     vk_left: begin
                 if (mdoMultiSelect in Options) then begin
                    if ssshift in Shift then
                       if (Date < Trunc(SystemTimeToDateTime(STA[2]))) then
                          SetSelRange(Date,Trunc(SystemTimeToDateTime(STA[2])-1))
                        else
                          SetSelRange(Trunc(SystemTimeToDateTime(STA[1])-1),Date)                    else Date:= Date - 1;
                 end
                 else Date:= Date - 1;
               end;
     vk_down: begin
                 if (mdoMultiSelect in Options) then begin
                    if ssshift in Shift then
                       if (Date < Trunc(SystemTimeToDateTime(STA[2]))) then
                          SetSelRange(Date,Trunc(SystemTimeToDateTime(STA[2])+7))
                        else
                          SetSelRange(Trunc(SystemTimeToDateTime(STA[1])+7),Date)                    else Date:= Date +7;
                 end
                 else Date:= Date +7;
              end;
     vk_up:   begin
                 if (mdoMultiSelect in Options) then begin
                    if ssshift in Shift then
                       if (Date < Trunc(SystemTimeToDateTime(STA[2]))) then
                          SetSelRange(Date,Trunc(SystemTimeToDateTime(STA[2])-7))
                        else
                          SetSelRange(Trunc(SystemTimeToDateTime(STA[1])-7),Date)
                    else Date:= Date -7;
                 end
                 else Date:= Date -7;
              end;
     vk_next: begin
         if pst.wMonth<12 then
            { 9/1/98 - Do not raise EncodeDate exception}
            tempDate:= EncodeDate(pst.wyear, pst.wMonth+1,
                min(pst.wday,DaysThisMonth(pst.wMonth+1,pst.wyear)))
            //               pst.wDay)
         else
            tempDate:= EncodeDate(pst.wyear+1, 1, pst.wDay);
         Date:= tempDate;
       end;
     vk_prior: begin
         if pst.wMonth>1 then
            tempDate:= EncodeDate(pst.wyear, pst.wMonth-1,
                       min(pst.wday,DaysThisMonth(pst.wMonth-1,pst.wyear))) { 10/29/98 }
         else
            tempDate:= EncodeDate(pst.wyear-1, 12, pst.wDay);
         Date:= tempDate;
       end;
    end;

    Change; { 8/24/98 }

    key:= 0;
  end;
end;

procedure TwwMonthCalendar.CNKeyDown(var Message: TWMKeyDown);
var shiftState: TShiftState;
begin
  if not (csDesigning in ComponentState) then
  begin
    with Message do
    begin
       shiftState:= KeyDataToShiftState(KeyData);

       if (charcode in [vk_right, vk_left, vk_down, vk_up, vk_next, vk_prior]) and
          not (ssCtrl in shiftState) then
       begin
          exit;
       end
    end
  end;

  inherited;
end;

procedure TwwMonthCalendar.Loaded;
begin
   inherited;
   RecreateWnd;         //Necessary to make sure OnCalcBoldDay is fired.
end;

procedure TwwMonthCalendar.GetFocus;
begin
   if visible then SetFocus;
end;

{procedure TwwMonthCalendar.WMLButtonDown(var Message: TWMLButtonDown);
begin
   GetFocus;
   inherited;
end;}

procedure TwwMonthCalendar.CMShowingChanged(var Message: TMessage);
begin
  inherited;
  FAfterYearPopup := False;
  FAfterMonthPopup := False;
end;

procedure TwwMonthCalendar.WMSize(var Message: TWMSize);
begin
  inherited;
  if (align <> alClient) and (csDesigning in Componentstate) then     //Add flag to disable automatic height adjustment
     AdjustHeight;
end;

procedure TwwMonthCalendar.Change;
begin
   if Assigned(FOnChange) then FOnChange(Self);
end;

constructor TwwDBCustomMonthCalendar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle;// + [csReplicatable];
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  FPaintControl := TPaintControl.Create(Self, MONTHCAL_CLASS);
end;

destructor TwwDBCustomMonthCalendar.Destroy;
begin
  FPaintControl.Free;
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

procedure TwwDBCustomMonthCalendar.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

procedure TwwDBCustomMonthCalendar.DataChange(Sender: TObject);
begin
   if (FDataLink.Field <> nil) and (not Patch[0]) then begin

      if (mdoMultiSelect in Options) then
         raise Exception.Create('Option mdoMultiSelect not allowed when bound '+
                                'to a database.');

      if FDataLink.Field.isNull then
         SetDateTime(0)
      else
         SetDateTime(FDataLink.Field.asDateTime);
      Invalidate;
   end
end;

procedure TwwDBCustomMonthCalendar.UpdateData(Sender: TObject);
var pst: TSystemTime;
    tempDate: TDateTime;
begin
   MonthCal_GetCurSel(handle, pst);
   tempDate:= EncodeDate(pst.wyear, pst.wMonth, pst.wDay);
   if FDataLink.Field is TDateTimeField then
      FDataLink.Field.asDateTime:= tempDate
   else begin
      FDataLink.Field.Text:= DateToStr(tempDate);
   end
end;

function TwwDBCustomMonthCalendar.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TwwDBCustomMonthCalendar.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TwwDBCustomMonthCalendar.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TwwDBCustomMonthCalendar.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TwwDBCustomMonthCalendar.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TwwDBCustomMonthCalendar.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TwwDBCustomMonthCalendar.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TwwDBCustomMonthCalendar.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  case Key of
    #27:
      FDataLink.Reset;
  end;
end;

procedure TwwDBCustomMonthCalendar.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SetFocus;
    raise;
  end;
  inherited;
end;

procedure TwwDBCustomMonthCalendar.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

procedure TwwDBCustomMonthCalendar.Change;
begin
  // 2/15/99 -PYW - Don't allow edit to change current date.
  Patch[0]:= True;
  FDataLink.Edit;
  Patch[0]:= False;
  inherited Change;
  FDataLink.Modified;
end;

procedure TwwDBCustomMonthCalendar.WMPaint(var Message: TWMPaint);
begin
  if (FDataLink.Field=Nil) then begin
     inherited;
     exit;
  end;

  if not (csPaintCopy in ControlState) then begin
     inherited;
     exit;
  end;

  with FPaintControl do begin
     if SetMonthCalDateTime(FDataLink.Field.asDateTime) then
        SendMessage(Handle, WM_PAINT, Message.DC, 0);
  end;

end;

function TwwMonthCalendar.IsPopupYearMonthShowing: boolean;
begin
   result:=
   ((FYearPopupMenu<>Nil) and (TCalendarPopupMenu(FYearPopupMenu).IsPoppedUp)) or
   ((FMonthPopupMenu<>Nil) and (TCalendarPopupMenu(FMonthPopupMenu).IsPoppedUp))
end;

{$ifdef wwdelphi4up}
function TwwDBCustomMonthCalendar.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

function TwwDBCustomMonthCalendar.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;
{$endif}

{procedure Register;
begin
  RegisterComponents('First Class', [TwwMonthCalendar]);
  RegisterComponents('First Class', [TwwDBCustomMonthCalendar]);
end;}

end.
