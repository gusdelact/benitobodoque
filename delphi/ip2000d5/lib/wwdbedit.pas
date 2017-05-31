{
//
// Components : TwwDBEdit
//
// Copyright (c) 1995, 1996, 1997, 1998 by Woll2Woll Software
//
//
//  8/12/97 - Clear selLength when handling mask in keypress event.  This fixes
//            a bug which updated the text incorrectly.
//
//  9/24/97 - Modify EditCanModify to return True for non physical fields
//
//  10/2/97 - Avoid beep in record-view
//
//  10/27/97 - Fix for drawing text as disabled when control is dropdownlist style
//
//  12/24/97 - Retrieve maxlength from field
//
//  2/14/98 - Non-editable control that has focus (i.e. combo - dropdownlist)
//  3/31/98 - Allow Horizontal Scroll when WordWrap and a single line edit control.
//  3/31/98 - Modified GetClientEditRect to return the actual Edit Rectangle
//  5/28/98 - Support password char in grid
//  8/24/98 - Support Delphi 4 ActionLists
//  9/2/98 -  Fixed 2 digit year bug in method UpdateData
//  9/15/98 - Fix bug where Calculated fields could not be modified with AutoEdit=False
// 10/12/98 - Avoid converting 4 digit years to prevent 1900 from converting to 2000
// 11/8/98 - Display memo text if outside grid by skipping inherited
// 12/16/98 - Fix problem when attached to memo field in WMPaint
// 12/16/98 - Support different epoch date by setting Patch[0] to the year.
//            Only supported if using Delphi 4.
// 1/7/99 - Avoid beep in record-view dialog
// 1/25/99 - Prevent grid's OnKeyDown from firing twice when encounter tab or cr
// 7/7/99 -  Clear inherited readonly when setting datasource
// 7/14/99 - Fix bug if memo is greater than 255 characters when usnig
//           custom editor
}
unit wwdbedit;

interface

{$i wwIfDef.pas}

uses
  windows, Forms, Graphics, Menus, SysUtils, WinTypes, WinProcs, Messages, Classes,
  Controls, Buttons,
  dbctrls, mask, db, dbtables, stdctrls, dialogs, wwdatsrc, grids, wwframe;

type

  TwwValidateEvent = procedure(Sender: TObject; PassesPictureTest: boolean) of object;
  TwwEditDataType = (wwDefault, wwEdtDate, wwEdtTime, wwEdtDateTime);

  TwwDBPicture = class(TPersistent)
  private
    FPictureMaskFromDataSet: boolean;
    FPictureMask: String;
    FAutoFill: boolean;
    FAllowInvalidExit: boolean;
    RelatedComponent: TComponent;

    procedure FlushToDataset(SetMask, SetAutoFill, SetUsePictureMask: boolean);
    procedure SetPictureMask(val: string);
    procedure SetAutoFill(val: boolean);
    procedure SetAllowInvalidExit(val: boolean);
    Function GetPictureMask: string;
    Function GetAutoFill: boolean;
    Function GetAllowInvalidExit: boolean;
  public
    constructor Create(Owner: TComponent);
    Procedure Assign(Source: TPersistent); override; { Add override 1/13/97}
    Function IsDatasetMask: boolean;

  published
    property PictureMaskFromDataSet: boolean read FPictureMaskFromDataset write FPictureMaskFromDataset default True;
    property PictureMask: string read GetPictureMask write SetPictureMask;
    property AutoFill: boolean read GetAutoFill write SetAutoFill default True;
    property AllowInvalidExit: boolean read GetAllowInvalidExit write SetAllowInvalidExit default False;
  end;

  TwwCustomMaskEdit = class(TCustomMaskEdit)
  private
    FwwPicture: TwwDBPicture;
    FWordWrap: boolean;
    FOnCheckValue: TwwValidateEvent;
    FUsePictureMask: boolean;
    FWantReturns: boolean;
    FShowVertScrollBar: boolean;
    DoExitPictureError: boolean;
//    FTransparent: boolean;
//    FCreateTransparent: boolean;
    FFrame: TwwEditFrame;

    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
//    procedure SetTransparent(val: boolean);

  protected
    ModifiedInKeyPress: boolean; {1/21/97 - True if keypress event modified text }
    procedure KeyPress(var Key: Char); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure EnableEdit; dynamic;
    procedure SetWordWrap(val: boolean);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure DoExit; override;

    procedure SetEditRect; virtual;
    procedure CreateWnd; override;
    procedure WMSize(var Message:TWMSize); message wm_size;

    Function HavePictureMask: boolean;
    procedure DoOnCheckValue(Valid: boolean); virtual;
    procedure SetShowVertScrollBar(Value: boolean);
//    procedure AdjustHeight;
//    procedure GetEditRectForFrame(var Loc: TRect); virtual;
  public
    function IsValidPictureValue(s: string): boolean;
    function IsValidPictureMask(s: string): boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ApplyMask;
    function Is3DBorder: boolean;

    property Frame: TwwEditFrame read FFrame write FFrame;
    property Picture: TwwDBPicture read FwwPicture write FwwPicture;
    property WordWrap: boolean read FWordWrap write SetWordWrap;
    property OnCheckValue: TwwValidateEvent read FOnCheckValue write FOnCheckValue;
    property UsePictureMask: boolean read FUsePictureMask write FUsePictureMask default True;
    property WantReturns: boolean read FWantReturns write FWantReturns;
    property ShowVertScrollBar: boolean read FShowVertScrollBar write SetShowVertScrollBar default False;
//    property Transparent: boolean read FTransparent write SetTransparent;
  end;

  TwwDBCustomEdit = class(TwwCustomMaskEdit)
  private
    FDataLink: TFieldDataLink;
    FCanvas: TControlCanvas;
    FAlignment, FUnboundAlignment: TAlignment;
    FTextMargin: Integer;
    StartValue: string;
    FAutoFillDate: boolean;
    FDataType: TwwEditDataType;
//    FUnderlineControl: boolean;
    FEpochYear: integer;

    procedure SetPicture(val: TwwDBPicture);
    function GetPicture: TwwDBPicture;

    Function DoAutoFillDate(var key: char): boolean;
    procedure CalcTextMargin;
    procedure EditingChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetFocused(Value: Boolean);
    procedure SetReadOnly(Value: Boolean);
    procedure UpdateData(Sender: TObject);
    procedure WMCut(var Message: TMessage); message WM_CUT;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CNKeyDown(var Message: TWMKeyDown); message CN_KEYDOWN; {handle tab}
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBkgnd;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    function IsMemoField: boolean;

{$IFDEF WIN32}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}

  protected
    FFocused: Boolean;
    procedure CreateWnd; override;
    procedure DataChange(Sender: TObject);
    procedure Change; override;
    function EditCanModify: Boolean; override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure DoEnter; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Loaded; override;

    procedure Reset; override;
    Function GetIconIndent: integer; dynamic;
    Function GetIconLeft: integer; dynamic;
    procedure EnableEdit; override;
    Function GetDBPicture: string;
    Function Editable: boolean; virtual;
    Function GetClientEditRect: TRect; virtual;
    Function GetStoredText: string; virtual;  { Map Text to stored value }
    Procedure ShowText(ACanvas: TCanvas;
          ARect: TRect; indentLeft, indentTop: integer; AText: string); virtual;
    Function StorePictureProperty: boolean;
    Procedure SetModified(val: boolean);
    Function ParentGridFocused: boolean;
    Function AllSelected: boolean;
    function GetShowButton: boolean; virtual;
    procedure SetShowButton(sel: boolean); virtual;

    Function isDateField: boolean;
    Function isTimeField: boolean;
    Function isDateTimeField: boolean;

    property Picture read GetPicture write SetPicture stored StorePictureProperty;
    procedure WndProc(var Message: TMessage); override;
    procedure DrawFrame(Control: TWinControl;
      Canvas: TCanvas); virtual;
    function GetEffectiveAlignment: TAlignment;

  public
    Patch: Variant;
    property EpochYear: integer read FEpochYear write FEpochYear default 0;
    property DataLink: TFieldDataLink read FDataLink;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function isTransparentEffective: boolean;

    {$ifdef wwdelphi4up}
    function ExecuteAction(Action: TBasicAction): Boolean; override; { 8/24/98 }
    function UpdateAction(Action: TBasicAction): Boolean; override; {8/24/98}
    {$endif}
    Function GetFieldMapText(StoreValue: string; var res: string): boolean; virtual; {Map Value to Display Value }
    procedure UpdateRecord;  { Flush edit's datalink contents to dataset record buffer }

    property Color;
    property Font;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    property Field: TField read GetField;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property AutoFillDate: boolean read FAutoFillDate write FAutoFillDate default True;
    property ShowButton: boolean read GetShowButton write SetShowButton;
    property UnboundDataType: TwwEditDataType read FDataType write FDataType;

    // Add in InfoPower 5 to support unbound alignment control
    property UnboundAlignment : TAlignment read FUnboundAlignment write FUnboundAlignment default taLeftJustify;

  end;

  TwwDBEdit = class(TwwDBCustomEdit)
  published
    {$ifdef wwDelphi4Up}
    property Anchors;
    property BiDiMode;
    {$endif}
    property AutoFillDate;
    property AutoSelect;
    property AutoSize;
    property BorderStyle;
    property CharCase;
    property Color;
    {$ifdef wwDelphi4Up}
    property Constraints;
    property ParentBiDiMode;  { 2/18/99 - Case sensitive name for Builder 4 }
    {$endif}
    property Ctl3D;
    property DataField;
    property DataSource;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property Frame;
    {$ifdef wwDelphi3Up}
    property ImeMode;
    property ImeName;
    {$endif}
    property MaxLength;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property Picture;
    property PopupMenu;
    property ReadOnly;
    property ShowVertScrollBar;
    property ShowHint;
    property TabOrder;
    property TabStop;
//    property Transparent;
    property UnboundDataType;
    property UnboundAlignment;
    property UsePictureMask;
    property Visible;
    property WantReturns;
    property WordWrap;
//    property UnderlineControl;

    property OnChange;
    property OnClick;
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
    property OnCheckValue;
  end;
{
  TwwPictureEdit = class(TwwCustomMaskEdit)
  published
    property AutoSelect;
    property AutoSize;
    property BorderStyle;
    property CharCase;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property MaxLength;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property Picture;
    property WordWrap;

    property OnChange;
    property OnClick;
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
    property OnCheckValue;

  end;
}

  procedure Register;

implementation

uses Consts, wwdbiGrd, wwpict, wwtable, wwcommon, wwdbgrid, wwsystem, wwstr, wwtypes,
{$IFDEF WIN32}
BDE;
{$ELSE}
DBITYPES, DBIPROCS;
{$ENDIF}

type
  TCheatGridCast = class(TCustomGrid);


constructor TwwDBPicture.Create(Owner: TComponent);
begin
   RelatedComponent:= Owner;
   FAutoFill:= True;
   FAllowInvalidExit:= False;
   FPictureMaskFromDataSet:= True;
end;

{
procedure TwwPicture.Assign(Source: TPersistent);
begin
  if Source is TwwPicture then
  begin
     FPictureMask:= TwwPicture(Source).PictureMask;
     FAutoFill:= TwwPicture(Source).AutoFill;
     Exit;
  end;
  inherited Assign(Source);
end;
}

procedure TwwDBPicture.Assign(Source: TPersistent);
begin
  if Source is TwwDBPicture then
  begin
     { Update this class }
     FPictureMask:= TwwDBPicture(Source).PictureMask;
     FAutoFill:= TwwDBPicture(Source).AutoFill;
     Exit;
  end;
  inherited Assign(Source);
end;

{.$R *.RES}

procedure ResetMaxLength(DBEdit: TwwDBCustomEdit);
var
  F: TField;
begin
  with DBEdit do
  if (MaxLength > 0) and (DataSource<>Nil) and (DataSource.DataSet<>Nil) then
  begin
    F := DataSource.DataSet.FindField(DataField);
    if Assigned(F) and (F.DataType = ftString) and (F.Size = MaxLength) then
      MaxLength := 0;
  end;
end;

constructor TwwDBCustomEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  inherited ReadOnly := True;  { Allow editing even if unbound }
  AutoSize:= True;

{$IFDEF WIN32}
  ControlStyle := ControlStyle + [csReplicatable];
{$ENDIF}

  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.OnUpdateData := UpdateData;
  FUsePictureMask:= True;
  FAutoFillDate:= True;
  CalcTextMargin;

  Patch:= VarArrayCreate([0, 2], varVariant);
  FEpochYear:= 0;
  Patch[0]:= 0;     { No longer used in InfoPower 5. Use EpochYear instead}
  Patch[1]:= False; { Skip data change event in wwdbcombobox}
  Patch[2]:= True;  { Set to True to disable new behavior of
                      allowingCombo-box to drop-down in MouseDown event for Delphi 4}
                    { incorporate Patch[2] functionality in IP 5, disabled for now }
//  FUnderlineControl:= True;

end;

{procedure TwwCustomMaskEdit.SetTransparent(val: boolean);
begin
   if val<>FTransparent then
   begin
     FCreateTransparent:= val;
     FTransparent:= val;
   end
end;
}

destructor TwwDBCustomEdit.Destroy;
begin
  FDataLink.OnDataChange := nil;
  FDataLink.Free;
  FDataLink := nil;
  FCanvas.Free;
  inherited Destroy;
end;

constructor TwwCustomMaskEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FwwPicture:= TwwDBPicture.create(self);
  FWordWrap:= False;
//  Transparent:= True;
  FFrame:= TwwEditFrame.create(self);
end;

destructor TwwCustomMaskEdit.Destroy;
begin
  FwwPicture.Free;
  FFrame.Free;
  inherited Destroy;
end;

procedure TwwCustomMaskEdit.SetWordWrap(val: boolean);
begin
   FWordWrap:= val;
   RecreateWnd;
end;

function TwwDBCustomEdit.isTransparentEffective: boolean;
begin
   result:= Frame.Transparent and Frame.IsFrameEffective
     and not wwIsDesigning(self)
end;

procedure TwwCustomMaskEdit.SetShowVertScrollBar(Value: Boolean);
begin
  if FShowVertScrollBar <> Value then
  begin
    FShowVertScrollBar := Value;
    RecreateWnd; 
  end;
end;

procedure TwwCustomMaskEdit.WMVScroll(var Message: TWMVScroll);
begin
   if (parent is TwwCustomDBGrid) and (not Focused) then SetFocus;  { Give focus to edit control }
   inherited;
end;

procedure TwwCustomMaskEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style and not (ES_AUTOVSCROLL or ES_WANTRETURN);
  if (BorderStyle = bsNone) or WordWrap then Params.Style:= Params.Style or ES_MULTILINE;
  if WordWrap then Params.Style := (Params.Style or ES_AUTOVSCROLL) and not ES_AUTOHSCROLL;
  if FWantReturns then Params.Style:= Params.Style or ES_WANTRETURN;
  if FShowVertScrollBar then Params.Style:= Params.Style or WS_VSCROLL;
//  Params.WindowClass.Style := CS_SAVEBITS;
end;

procedure TwwDBCustomEdit.CreateParams(var Params: TCreateParams);
var R:TRect;
//    hdc:Integer;
    dc:HDC; { 10/30/98 - Use HDC to avoid range checking problems }
begin
   inherited CreateParams(Params);

   if Frame.enabled then Params.Style:= Params.Style and not WS_BORDER;

   {If WordWrap and SingleLineEditControl then Allow Horizontal Scroll}
   R:= Rect(Left,Top,Left+Width-GetIconIndent,Top+Height);
   dc:= 0;
   try
     dc := GetDC(0);
     if (wwIsSingleLineEdit(dc,R,0)) then
     begin
        if WordWrap then
           Params.Style := Params.Style or ES_AUTOHSCROLL;
        if (((BorderStyle=bsNone) or Frame.enabled) and
           (PasswordChar<>#0)) then { 5/28/98 - Support password char in grid }
           Params.Style:= Params.Style and not ES_MULTILINE;
     end
   finally
     ReleaseDC(0,dc);
   end;
  if IsTransparentEffective and Frame.CreateTransparent then
  begin
     Params.ExStyle := Params.ExStyle or WS_EX_TRANSPARENT;
//     ControlStyle:= ControlStyle - [csOpaque]
  end;

end;

procedure TwwCustomMaskEdit.DoOnCheckValue(Valid: boolean);
begin
   if Assigned(FOnCheckValue) then
      FOnCheckValue(self, Valid);
end;

Function TwwCustomMaskEdit.HavePictureMask: boolean;
begin
   result:=
     FUsePictureMask and
     (FwwPicture.PictureMask<>'')
end;

procedure TwwCustomMaskEdit.DoExit;
begin
   inherited DoExit;

   DoExitPictureError:= False;
   if not HavePictureMask or not Modified then exit;
   if (not isValidPictureValue(Text) and (not FwwPicture.AllowInvalidExit)) then
   begin
      SelectAll;
      SetFocus;
      Modified:= True; {SetFocus clears modified so set it back to true }
      MessageBeep(0);
      DoExitPictureError:= True;  { Communicate to cmExit routine }
   end
end;

procedure TwwDBCustomEdit.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;


procedure TwwDBCustomEdit.KeyDown(var Key: Word; Shift: TShiftState);
type
  TSelection = record
    StartPos, EndPos: Integer;
  end;

var
  parentGrid: TCustomGrid; { 6/22/99 - Support TwwObjectView embedding }

  procedure SendToObjectView;
  begin
    if not IsInwwObjectView(self) then exit;
    TwwDBGrid(ParentGrid).KeyDown(Key, Shift);
  end;

  procedure SendToParent;
  begin
    ParentGrid.setFocus;

    { If grid does not have focus then SetFocus raised exception }
    if ParentGrid.focused then  { 7/2/98 }
       TwwDBGrid(ParentGrid).KeyDown(Key, Shift);
    Key := 0;
  end;

  procedure ParentEvent;
  var
    GridKeyDown: TKeyEvent;
  begin
    { 1/25/99 - Prevent grid's OnKeyDown from firing twice when encounter tab or cr }
    if (Screen.ActiveControl<>self) and ((key=13) or (key=9)) then exit;

    GridKeyDown := TwwDBGrid(ParentGrid).OnKeyDown;
    if Assigned(GridKeyDown) then GridKeyDown(ParentGrid, Key, Shift);
  end;

  function ForwardMovement: Boolean;
  var tempGrid: TwwDBGrid;
  begin
     if ParentGrid is TwwDBGrid then
     begin
       tempGrid:= ParentGrid as TwwDBGrid;
       Result := (dgAlwaysShowEditor in (tempGrid.Options));
     end
     else result:= False;
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
    {$ifdef win32}
    SendMessage(Handle, EM_GETSEL, Longint(@Result.StartPos), Longint(@Result.EndPos));
    {$else}
    Longint(Result) := SendMessage(Handle, EM_GETSEL, 0, 0);
    {$endif}
  end;

  function RightSide: Boolean;
  begin
    with Selection do
      Result := ((StartPos = 0) or (EndPos = StartPos)) and
        (EndPos = GetTextLen);
   end;

  function LeftSide: Boolean;
  begin
    with Selection do
      Result := (StartPos = 0) and
      ((EndPos = 0) or (EndPos = GetTextLen) or (isMasked and (EndPos=1)));
  end;

  procedure Deselect;
  begin
    {$ifdef win32}
    SendMessage(Handle, EM_SETSEL, -1, 0);
    {$else}
    SendMessage(Handle, EM_SETSEL, 1, $FFFFFFFF);
    {$endif}
    selLength:= 0;  {7/8/97 - Forces text to move to the far left }
  end;

  Function InsideMemoField: boolean;
  begin
     result:=
        (FDataLink.Field<>Nil) and isMemoField and (not allSelected);
  end;

begin
  { Don't pass to parent if inside memofield }
  if (parent is TCustomGrid) and not InsideMemoField then
  begin
     parentGrid:=  (parent as TCustomGrid);

     case Key of
       VK_ESCAPE: if not modified then SendToParent;
       VK_UP, VK_DOWN, VK_NEXT, VK_PRIOR: if (not Alt) then SendToParent;
       VK_LEFT: if IsInwwObjectView(self) then SendToObjectView
                else if ForwardMovement and (Ctrl or LeftSide) then SendToParent;
       VK_RIGHT: if IsInwwObjectView(self) then SendToObjectView
                 else if ForwardMovement and (Ctrl or RightSide) then SendToParent;
       VK_HOME: if ForwardMovement and (Ctrl or LeftSide) then SendToParent;
       VK_END: if ForwardMovement and (Ctrl or RightSide) then SendToParent;
       VK_INSERT: if not (ssShift in Shift) then SendToParent; {12/20/96 - Pass to grid only if insert only}
       VK_DELETE: if (Ctrl) then SendToParent;
       VK_F2:
         begin
           ParentEvent;
           if Key = VK_F2 then
           begin
             if Editable then Deselect;
             Exit;
           end;
         end;
     end;
     if (not Editable) and (Key in [VK_LEFT, VK_RIGHT, VK_HOME, VK_END]) then SendToParent;

     if Key <> 0 then
       ParentEvent;

  end;

  if (Key <> 0) then begin
     inherited KeyDown(Key, Shift);
     if (Key = VK_DELETE) or ((Key = VK_INSERT) and (ssShift in Shift)) then
     begin
        if (DataSource=nil) then begin  {10/2/96 }
           if not ReadOnly then ReadOnly:= False
        end
        else begin
           FDataLink.Edit;
           SetModified(True); {12/20/96 - Delete should set modified flag }
        end
     end
  end

end;

Function TwwDBCustomEdit.AllSelected: boolean;
begin
   result:= (selStart=0) and (selLength=length(Text));
end;

Function TwwDBCustomEdit.DoAutoFillDate(var Key: char): boolean;
var NowYear, NowMonth, NowDay: word;
    NowHour, NowMin, NowSec, NowMSec: word;
    dateCursor: TwwDateTimeSelection;
    curText: string;
    tempYear: integer;

    procedure AddDateSeparator;
    begin
        if (length(curText)>0) and (curText[length(curText)]<>DateSeparator) then
           if strCount(curText, DateSeparator)<2 then
              curText:= curText+ DateSeparator;
    end;

    procedure AddTimeSeparator;
    begin
        curText:= curText + TimeSeparator;
    end;

    Function DateComplete: boolean;
    begin
       if (strCount(curText, DateSeparator)>=2) and
          (curText[length(curText)]<>DateSeparator) then result:= True
       else result:= False
    end;

    Function TimeSecondComplete: boolean;
    begin
          if (strCount(curText, TimeSeparator)>=2) and
             (curText[length(curText)]<>TimeSeparator) then result:= True
          else result:= False
    end;

    Function TimeAMPMComplete: boolean;
    begin
       if TimeAMString='' then result:= TimeSecondComplete
       else begin
          result:=
             (pos(uppercase(TimeAMString[1]), uppercase(curText))>0) or
             (pos(uppercase(TimePMString[1]), uppercase(curText))>0)
       end
    end;

    Function Make2DigitStr(val: integer): string;
    begin
        if val < 10 then result:= '0' + inttostr(val)
        else result:= inttostr(val);
    end;

begin
   result:= False;
   if inherited ReadOnly then exit; { 10/3/96 }
                                    { Add TimeField support }
   if not (isDateField or isDateTimeField or isTimeField) then exit;
{   if not ((Field is TDateField) or (Field is TDateTimeField) and not (Field is TTimeField)) then exit;}
   if (selStart<length(Text)) and not AllSelected then exit;

   if ReadOnly then MessageBeep(0)
   else begin
      result:= True;

      if not AllSelected then curText:= Text
      else curText:= '';

      DecodeDate(Now, NowYear, NowMonth, NowDay);
      DecodeTime(Now, NowHour, NowMin, NowSec, NowMSec);
      Key:= #0;
      DataLink.Edit;

      if (not isTimeField) then begin      {Add TimeField Support}
      if AllSelected then
         case wwGetDateOrder(ShortDateFormat) of
           doYMD: DateCursor:= wwdsYear;
           doMDY: DateCursor:= wwdsMonth;
           doDMY: DateCursor:= wwdsDay;
           else DateCursor:= wwdsMonth; { Make compiler happy}
         end
      else begin
         if not DateComplete and (curText[length(curText)]<>DateSeparator) then
         begin
            Text:= curText + DateSeparator;
            SelStart:= length(Text);
            exit;
         end;
         dateCursor:= wwGetDateTimeCursorPosition(SelStart, curText, false);
      end;
      end
      else begin  {Add TimeField Support}
         dateCursor:= wwGetTimeCursorPosition(SelStart, curText);
      end;


      if (DateComplete or isTimeField) and (DateCursor in [wwdsDay, wwdsYear, wwdsMonth]) then
         DateCursor:= wwdsHour;

      case DateCursor of
         wwdsDay: begin
               if pos('dd', lowercase(ShortDateFormat))>0 then
                  curText:= curText + Make2DigitStr(NowDay)
               else curText:= curText + inttostr(NowDay);
               AddDateSeparator;
             end;

         wwdsYear: begin
               if pos('yyyy', ShortDateFormat)>0 then
                  curText:= curText + inttostr(NowYear)
               else begin { 2 digit year }
                  tempYear:= NowYear mod 100;
                  curText:= curText + Make2DigitStr(tempYear);
               end;
               AddDateSeparator;
            end;

         wwdsMonth: begin
               if pos('mm', lowercase(ShortDateFormat))>0 then
                  curText:= curText + Make2DigitStr(NowMonth)
               else curText:= curText + inttostr(NowMonth);
               AddDateSeparator;
            end;
      end;

      if (not (isDateField)) and (not TimeAMPMComplete) and
{      if (not (Field is TDateField)) and (not TimeAMPMComplete) and}
         (DateCursor in [wwdsHour, wwdsMinute, wwdsSecond, wwdsAMPM]) then
      begin
         if TimeSecondComplete and (DateCursor=wwdsSecond) then DateCursor:=  wwdsAMPM;

         if (DateCursor =wwdsHour) and (not isTimeField) then begin {Added for TimeField support}
            if (curText[length(curText)]<>' ') then
            begin
               Text:= curText + ' ';
               SelStart:= length(Text);
               exit;
            end;
         end
         else if (DateCursor=wwdsMinute) and (curText[length(curText)]<>TimeSeparator) then
         begin
            Text:= curText + TimeSeparator;
            SelStart:= length(Text);
            exit;
         end;

         case DateCursor of
            wwdsHour:  begin
                  if TimeAMString<>'' then begin
                     NowHour:= NowHour mod 12;
                     if NowHour=0 then NowHour:=12;  {2/23/97}
                  end;
                  curText:= curText + inttostr(NowHour);
                  AddTimeSeparator;
               end;
            wwdsMinute: begin
                   curText:= curText + Make2DigitStr(NowMin);
                   AddTimeSeparator;
               end;
            wwdsSecond: begin
                   curText:= curText + Make2DigitStr(NowSec);
               end;
            wwdsAMPM: begin
                   if curText[length(curText)]<>' ' then
                      curText:= curText + ' ';
                   if (NowHour>=12) then
                      curText:= curText + 'PM'
                   else
                      curText:= curText + 'AM'
               end;
         end
      end;

      Text:= curText;
      SelStart:= length(curText);
      SetModified(True);
   end;
end;

procedure TwwDBCustomEdit.KeyPress(var Key: Char);
var tempres: string;
    OrigKey: Char;
    ClearKey: boolean;
begin
  if key=#9 then begin
     key:= #0;  { Never process tabs,
                  Delphi 5 passes this to us if multi-line enabled so we need to handle it }
     exit;
  end;

  if (Key in [#32..#255]) or (ord(key)=vk_back) then begin
     if (inherited ReadOnly) and
        (DataSource<>Nil) and (not DataSource.autoEdit) then
        { 9/15/98 - Fix bug where Calculated fields could not be modified with AutoEdit=False}
        if (not (DataSource.state in [dsEdit, dsInsert])) then exit;

     if (DataSource=nil) then begin
        if not ReadOnly then ReadOnly:= False
        else exit;
     end
     else begin
        if (not ReadOnly) and (FDataLink.Field<>Nil) and  {7/4/97 - Support edits of non physical fields }
           (wwisNonPhysicalField(FDataLink.Field)) then
        begin
           if (FDataLink.Field.ReadOnly) or (not FDataLink.DataSet.CanModify) then exit;

           if (wwisNonPhysicalField(FDataLink.Field)) then
              if (parent is TwwCustomDBGrid) and (Parent as TwwCustomDBGrid).editCalculated then
                 FDataLink.DataSet.Edit
              else
                 FDataLink.DataSet.Edit;
           if (inherited ReadOnly) then inherited ReadOnly:= False;;
        end
     end
  end;

  if (not (FwwPicture.AutoFill and HavePictureMask)) and AutoFillDate and (ord(key)=vk_space) then
  begin
     EnableEdit; {10/4/96}

     if GetKeyState(VK_CONTROL) >= 0 then { Skip auto-fill if Ctrl key is pressed }
        if DoAutoFillDate(key) then
        begin
           if Assigned(FOnCheckValue) then isValidPictureValue(Text);
           exit;
        end;
  end;

  OrigKey:= Key;
  inherited KeyPress(Key);
  ClearKey:= False;
  if (Key=#0) and (ModifiedInKeyPress) then SetModified(True) { 1/21/97 - Set modified to True }
  else if IsMasked and (Key=#0) and (OrigKey<>#0) then
  begin
     Key:= OrigKey;  {4/28/97 - Support Delphi edit mask }
     ClearKey:= True;
  end;

  if not GetFieldMapText('', tempres) then  { 8/22/96 - Mapping text so allow any character }
  begin
     if (Key in [#32..#255]) and (FDataLink.Field <> nil) and
         not FDataLink.Field.IsValidChar(Key) then
     begin
       MessageBeep(0);
       Key := #0;
     end
  end;

  case Key of
    ^H, ^V, ^X, #32..#255:
      begin
        FDataLink.Edit;
        { if wwIsValidChar(ord(Key)) then } SetModified(True); { 9/20/96 }
        if not Editable then key:= #0;
      end;
    #27:
      begin
        Reset;
        Invalidate;
        Key := #0;
        if parent is TwwCustomDBGrid then begin
           parent.setFocus;
        end;
      end;
    #13:  if WantReturns then begin
             FDataLink.Edit;
             SetModified(True);
          end
          else if (parent is TwwCustomDBGrid) then Key:= #0;

    #9: if (parent is TwwCustomDBGrid) then Key:= #0;
                                                         { 10/27/96 - Ignore tab and cr                            }
                                                         { cr needs to be eaten so that parentgrid is not confused }
                                                         { when using dgEnterToTab }
  end;

  if ClearKey then Key:= #0;   {4/28/97 - Support Delphi edit mask }

end;

procedure TwwDBCustomEdit.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited KeyUp(Key, Shift);
{  if IsValidChar(Key) then SetModified(True);}
end;

procedure TwwDBCustomEdit.CNKeyDown(var Message: TWMKeyDown);
var shiftState: TShiftState;
begin
  if not (csDesigning in ComponentState) then
  begin
    with Message do
    begin
       shiftState:= KeyDataToShiftState(KeyData);
       if (WantReturns) and (charcode=vk_return) and { Ctrl-Enter goes to grid }
           not (ssCtrl in shiftState) then exit;

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
    end
  end;

  inherited;
end;

function TwwDBCustomEdit.EditCanModify: Boolean;
begin
  if FDataLink.Field<>Nil then
  begin
     Result := FDataLink.Edit;
     {9/24/97 - Support edits of non physical fields }
     if (not Result) and
        (not ReadOnly) and
        (wwisNonPhysicalField(FDataLink.Field)) and
        (not FDataLink.Field.ReadOnly) and (FDataLink.DataSet.CanModify) then
           result:= True;
  end
  else Result:= True;
end;

procedure TwwDBCustomEdit.Reset;
begin
  if FDataLink.Field<>Nil then begin
     FDataLink.Reset;
  end
  else
     Text:= StartValue;
  SelectAll;
  SetModified(False);
  if Assigned(FOnCheckValue) then isValidPictureValue(Text);
end;

procedure TwwDBCustomEdit.SetFocused(Value: Boolean);
begin
  if FFocused <> Value then
  begin
    FFocused := Value;
    if (GetEffectiveAlignment <> taLeftJustify) and not IsMasked then Invalidate;
    if FDataLink.Field<>Nil then begin
       FDataLink.Reset;
    end
    else if Focused then
       StartValue:= Text;  { For unbound case }
  end;
end;

procedure TwwDBCustomEdit.Change;
begin
  if (DataLink<>Nil) and (DataLink.Field=Nil) then SetModified(True);  {1/21/97 - Only set if unbound }
  inherited Change;
end;

function TwwDBCustomEdit.GetDataSource: TDataSource;
begin
  if (FDataLink<>Nil) and (FDataLink.DataSource is TDataSource) then begin
     Result := FDataLink.DataSource as TDataSource
  end
  else Result:= Nil;
end;

procedure TwwDBCustomEdit.SetDataSource(Value: TDataSource);
begin
  if (Value<>FDataLink.DataSource) and (Value<>nil) then
     inherited ReadOnly:= True; { 7/8/98 - Uncomment with further testing or IP 5}
  FDataLink.DataSource := Value;
end;

function TwwDBCustomEdit.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TwwDBCustomEdit.SetDataField(const Value: string);
begin
  if not (csDesigning in ComponentState) then
    ResetMaxLength(Self);
  FDataLink.FieldName := Value;
end;

function TwwDBCustomEdit.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TwwDBCustomEdit.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
  if (Value=False) and not (csLoading in ComponentState) then
     inherited ReadOnly := Value;
end;

function TwwDBCustomEdit.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TwwDBCustomEdit.DataChange(Sender: TObject);
begin
  if FDataLink.Field <> nil then
  begin
    if FAlignment <> FDataLink.Field.Alignment then
    begin
      EditText := '';  {forces update}
      FAlignment := FDataLink.Field.Alignment;
    end;
    if not HavePictureMask then EditMask:= FDataLink.Field.EditMask;

    { 12/24/97 - Retrieve maxlength from field }
    if not (csDesigning in ComponentState) then
    begin
      if (FDataLink.Field.DataType = ftString) and (MaxLength = 0) then
        MaxLength := FDataLink.Field.Size;
    end;

    if (FFocused or isMemoField) and FDataLink.CanModify then
    begin
      {$ifdef win32}
      if isMemoField then  { 12/20/96 - Retrieve memo field contents }
         Text := FDataLink.Field.asString
      else
      {$endif}
         Text := FDataLink.Field.Text
    end
    else
      EditText := FDataLink.Field.DisplayText;
  end else
  begin
    FAlignment := taLeftJustify;
    EditMask := '';
    if csDesigning in ComponentState then
      EditText := Name else
      EditText := '';
  end;

end;

procedure TwwDBCustomEdit.EditingChange(Sender: TObject);
begin
  inherited ReadOnly := not FDataLink.Editing;
end;

procedure TwwDBCustomEdit.UpdateData(Sender: TObject);
var FOnInvalidValue: TwwInvalidValueEvent;
    NewDate, NewTime: TDateTime;
    TempEpochYear: integer;
begin
  if inherited ReadOnly then exit;

  { 9/14/99 - Don't refer to ValidateWithMask flag here as that flag
    should only be used when positing.  Also use check Text value intead
    of internally stored value. }
  if (FwwPicture.PictureMask<>'') {and wwGetValidateWithMask(FDataLink.dataSet) }then
  begin  { Ignore UsePictureMask property }
//    if not isValidPictureValue(GetStoredText) then begin
    if not isValidPictureValue(Text) then begin
       FOnInvalidValue := wwGetOnInvalidValue(FDataLink.DataSet);
       if Assigned(FOnInvalidValue) then
       begin
          FOnInvalidValue(FDataLink.DataSet, FDataLink.Field)
       end
       else validateError;
    end
  end
  else ValidateEdit;
  if modified then begin
     {$ifdef win32}
     if isMemoField then
        FDataLink.Field.asString := GetStoredText  { 12/20/96 - Save to memo field }
     else
     {$endif}

     if FDataLink.editing or wwisNonPhysicalField(FDataLink.Field) then {7/4/97}
     begin
        if GetStoredText='' then FDataLink.Field.Text:= GetStoredText
        else if (FDataLink.Field is TDateTimeField) and
                 wwStrToDate(GetStoredText) then { 9/2/98 - Call wwStrToDate instead }
        begin
           { 12/16/98 -
             Uses 1950 as Epoch Date for 2 digt years, Only for Delphi 4 so-as to
             preserve backward package compatibility.  }
           {$ifdef wwDelphi4Up}
           if FEpochYear=0 then TempEpochYear:= 1950
           else TempEpochYear:= EpochYear;
           if wwScanDateEpoch(GetStoredText, NewDate, TempEpochYear) then
           {$else}
           if wwScanDate(GetStoredText, NewDate) then
           {$endif}
           begin
              NewTime:= Frac(StrToDateTime(GetStoredText));
              TDateTimeField(FDataLink.Field).asDateTime:= NewDate + NewTime;
           end
        end
        else
           FDataLink.Field.Text := GetStoredText;  {3/12/97- Only update if edit mode}
     end
  end
end;

Function TwwDBCustomEdit.GetStoredText: string;
begin
   result:= Text;
end;

{ Return displaytext for field - Used by TwwDBGrid}
Function TwwDBCustomEdit.GetFieldMapText(StoreValue: string; var res: string): boolean;
begin
   result:= False;
end;

procedure TwwDBCustomEdit.WMPaste(var Message: TMessage);
var prevText: string;
    prevSelStart: integer;
begin
  PrevText:= Text;
  PrevSelStart:= selStart;   { 11/26/96 - save previous selStart for use later }
  if (DataSource=nil) then begin  {9/11/96 }
     if not ReadOnly then ReadOnly:= False
     else exit;
  end;

  FDataLink.Edit;
  inherited;
  SetModified(True);

  { 9/11/96 }
  ApplyMask;
  { Incorrect Kludge - Override Delphi strange behavior of not moving selStart if previous selStart=0}
  if (selStart=0) then selStart:= prevSelStart + length(Text) - length(PrevText);

  if Assigned(FOnCheckValue) then isValidPictureValue(Text);
end;

procedure TwwDBCustomEdit.WMCut(var Message: TMessage);
begin
  FDataLink.Edit;
  inherited;
  SetModified(True);
  if Assigned(FOnCheckValue) then isValidPictureValue(Text);
end;

procedure TwwDBCustomEdit.CMEnter(var Message: TCMEnter);
var exStyle, origStyle: longint;
//    r: TRect;
begin
  SetEditRect;
  SetFocused(True);
  if AutoSelect and not (csLButtonDown in ControlState) then
  begin
     SelectAll;
  end;
  inherited;
  if not Editable then Invalidate;
  if IsTransparentEffective then begin
     Frame.CreateTransparent:= False;
     OrigStyle:= Windows.GetWindowLong(handle, GWL_EXSTYLE);
     exStyle:= OrigStyle and not WS_EX_TRANSPARENT;
     Windows.SetWindowLong(handle, GWL_EXSTYLE, exStyle);
     invalidate;
  end;
  if Frame.enabled then invalidate; { See if this causes any flicker }


end;

procedure TwwDBCustomEdit.UpdateRecord;
var lastModified: boolean;
begin
  lastModified:= modified;
  try
    FDataLink.UpdateRecord;
  except
    SelectAll;
    SetFocus;
    modified:= lastModified;
    raise;
  end;
end;

procedure TwwDBCustomEdit.CMExit(var Message: TCMExit);
//var
//    r: TRect;
//    exStyle, origStyle: longint;
//    i: integer;
begin
  UpdateRecord;
  DoExit;
  if not DoExitPictureError then begin
     SetFocused(False);  { Only call SetFocused(False) if no validation error }
     SetCursor(0);
  end;
  if not Editable then Invalidate;
  if IsTransparentEffective then begin
     Frame.CreateTransparent:= True;
     RecreateWnd;
  end;

  if Frame.enabled then invalidate; { See if this causes any flicker }

end;

Function TwwDBCustomEdit.GetIconIndent: integer;
begin
   result:= 0;
end;

Function TwwDBCustomEdit.GetIconLeft: integer;
begin
   result:= ClientWidth - 1;
end;

Procedure TwwDBCustomEdit.ShowText(ACanvas: TCanvas;
          ARect: TRect; indentLeft, indentTop: integer; AText: string);
begin
   ACanvas.TextRect(ARect, indentLeft, indentTop, AText);
end;

Function TwwDBCustomEdit.ParentGridFocused: boolean;
begin
   result:= False;
   if parent is TwwDBGrid then begin
      if parent.Focused then result:= True
   end;
end;

procedure TwwDBCustomEdit.DrawFrame(
     Control: TWinControl;
     Canvas: TCanvas);
begin
    wwDrawEdge(self, Frame, Canvas, FFocused);
end;

procedure TwwDBCustomEdit.WMPaint(var Message: TWMPaint);
var
  PS: TPaintStruct;
  Width, Indent, Left: Integer;
  ARect: TRect;
  S: array [0..255] of char;
  Focused: Boolean;
  DC: HDC;
  Win32: boolean;
  MapDisplayText: string;
  TempLeft, TempIndent, i: integer;
  WriteOptions: TwwWriteTextOptions;
//  r: TRect;

  Function DrawFocusControl: boolean;
  begin
      result:= ((not Editable and Focused) or ParentGridFocused)
                and not wwInPaintCopyState(ControlState)
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
  if ((GetEffectiveAlignment = taLeftJustify) and (not Frame.IsFrameEffective) or
     FFocused) and
     ((Editable and not ParentGridFocused)
      and not wwInPaintCopyState(ControlState)) then
  begin
     inherited;
     if Frame.IsFrameEffective then
     begin
       CanvasNeeded;
       FCanvas.Handle:= message.DC;
       DrawFrame(self, FCanvas);
       FCanvas.Handle:= 0;
     end;
//     inpaint:= false;
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
         font.color:= clInactiveCaption  {10/27/97}
      else if parent is TCustomGrid then
         font.Color:= TwwDBGrid(parent as TCustomGrid).Font.Color;
      Brush.Color:= clWhite;

      {$ifdef win32}
      Win32:= True;
      {$else}
      Win32:= False;
      {$endif}

      { 8/25/96 - Fix for winNT 3.5 }
      if (BorderStyle<>bsNone) then
      begin
         if (not NewStyleControls) or (not Ctl3d) or  { 4/13/97}
            ( (not wwInPaintCopyState(ControlState)) and
              ((parent is TwwDBGrid) or (not Win32)) ) then
         begin
           Brush.Color := clWindowFrame;
           FrameRect(ARect);
         end
      end;

      Brush.Style := bsSolid;
      Brush.Color := Color;
      InflateRect(ARect, -1, -1);  {Added for csDropDownList style }
      if (not IsTransparentEffective) and (not IsInwwObjectViewPaint(self)) then
         FillRect (ARect);

      if Showbutton and not IsInwwObjectViewPaint(self) then ARect:= GetClientEditRect
      else ARect:= ClientRect;

      InflateRect(ARect, -1, -1);  {Added for csDropDownList style }

      { Win 95 TGridRecord}
      { 7/14/99 - Fix bug if memo is greater than 255 characters }
      MapDisplayText:= '';
      if wwInPaintCopyState(ControlState) and (FDataLink.Field <> nil) then
      begin
         if not GetFieldMapText(FDataLink.Field.asString, MapDisplayText) then
            MapDisplayText:= FDataLink.Field.DisplayText;
      end
      else begin
         if isMemoField then MapDisplayText:= FDataLink.Field.asString
         else MapDisplayText:= EditText;
      end;
      MapDisplayText:= copy(MapDisplayText, 1, 255);
      strpcopy(S, MapDisplayText);

      if DrawFocusControl then begin
         Brush.Color := clHighlight;
         Font.Color := clHighlightText;
      end;

      Width := TextWidth(strpas(S));

      if IsInwwObjectView(self) then Indent:= 1
      else if ParentGridFocused or
        { 2/14/98 - Non-editable control that has focus (i.e. combo - dropdownlist) }
        ((parent is TwwDBGrid) and self.focused)then
      begin
         if BorderStyle=bsNone then Indent:= 2
         else Indent:= 3
      end
      else if Win32 and NewStyleControls then Indent:= 1 else Indent:= 2;

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
         Indent:= Indent + Frame.NonFocusTextOffsetY;
      end
      else Left:= Indent + 1;

      if GetEffectiveAlignment = taRightJustify then
      begin
         if (IsInwwObjectViewPaint(self)) then begin
            Left:= ClientRect.Right - Width - Indent
         end
         else if ShowButton then begin
            Left:= GetIconLeft - Width - Indent - 1;
            if Frame.Transparent then Left:= Left - 1;
         end
         else Left := ARect.Right - Width - Indent - 1;
         if Frame.IsFrameEffective then Left:= Left - Frame.NonFocusTextOffsetX;
      end
      else if GetEffectiveAlignment = taCenter then
      begin
         Left := (ARect.Left + ARect.Right - Width) div 2;
      end;

      { 11/20/96 - Use password char }
      if PasswordChar <> #0 then
      begin
        for I := 1 to length(StrPas(s)) do
          S[I-1] := PasswordChar;
      end;

      { 12/20/96 - Support multiple lines }
      if wwInPaintCopyState(ControlState) and (not NewStyleControls) and
        (FDataLink.Field <> nil) then
      begin
         TempIndent:= Indent+1;
         TempLeft:= Left;
      end
      else begin
         if wwInPaintCopyState(ControlState) then
         begin
            TempIndent:= Indent;
            TempLeft:= Left - 1;
         end
         else begin
            TempIndent:= Indent;
            TempLeft:= Left;
         end
      end;

      WriteOptions:= [];
      if WordWrap then WriteOptions:= WriteOptions + [wtoWordWrap];

      if IsInwwObjectViewPaint(self) or IsTransparentEffective then
         WriteOptions:= WriteOptions + [wtoTransparent];

      if isInwwObjectView(self) then
         ARect.bottom:= ClientRect.Bottom; { otherwise bottom of text could get clipped in data inspector }
      if (not FFocused) and IsTransparentEffective and (Frame.NonFocusTransparentFontColor<>clNone) then
         FCanvas.Font.Color:= Frame.NonFocusTransparentFontColor;

      wwWriteTextLinesT(FCanvas, ARect, TempLeft-1, TempIndent-1,
                s, GetEffectiveAlignment, WriteOptions);

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
      DrawFrame(self, FCanvas);
    end;

  finally
    FCanvas.Handle := 0;
    if Message.DC = 0 then EndPaint(Handle, PS);
//    inpaint:= false;
  end;
end;

procedure TwwDBCustomEdit.CMFontChanged(var Message: TMessage);
begin
  inherited;
  CalcTextMargin;

  {This is needed only when changing font in the middle of editing }
  { 9/10/98 - Check Owner<>Nil}
  if (Owner<>Nil) and (not (csLoading in Owner.ComponentState)) then SetEditRect;
end;

procedure TwwDBCustomEdit.CalcTextMargin;
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


function TwwDBCustomEdit.GetPicture: TwwDBPicture;
var tempMask: string;
    tempFill: boolean;
    tempUsePictureMask: boolean;
begin
   if FwwPicture.isDataSetMask then begin
      wwPictureByField(Datasource.DataSet, DataField, True,
          tempMask, tempFill, tempUsePictureMask);
      FwwPicture.FPictureMask:= tempMask;
      FwwPicture.FAutoFill:= tempFill;
      FwwPicture.FAllowInvalidExit:= False;
   end;
   result:= FwwPicture;
end;

procedure TwwDBCustomEdit.SetPicture(val: TwwDBPicture);
begin
   inherited Picture.assign(val);

   if HavePictureMask or (FDatalink.Field=Nil) then EditMask:= ''
   else EditMask := FDataLink.Field.EditMask;

   if (val.PictureMask<>'') and FwwPicture.isDataSetMask then
   begin
      wwSetPictureMask(DataSource.DataSet, DataField,
         val.PictureMask, val.autofill, False, True, True, False);
      if csDesigning in ComponentState then wwDataModuleChanged(DataSource.Dataset);
   end
end;

function TwwCustomMaskEdit.Is3DBorder: boolean;
begin
//   result:=
//     Frame.FocusStyle in [efsFrameSunken, efsFrameRaised, efsFrameEtched, efsFrameBump];
   result:= true;
end;

function TwwCustomMaskEdit.isValidPictureMask(s: string): boolean;
var pict: TwwPictureValidator;
begin
   pict:= TwwPictureValidator.create(FwwPicture.PictureMask, FwwPicture.AutoFill);;
   result := pict.isSyntaxError;
   pict.Free;
end;

function TwwCustomMaskEdit.isValidPictureValue(s: string): boolean;
var pict: TwwPictureValidator;
    res: TwwPicResult;
begin
   if s='' then
      result:= True
   else if FwwPicture.PictureMask='' then
      result:= True
   else begin
      pict:= TwwPictureValidator.create(FwwPicture.PictureMask, FwwPicture.AutoFill);;
      res:= Pict.picture(s, False);
      result := res = prComplete;
      pict.Free;
   end;

   DoOnCheckValue(result);
end;


procedure TwwCustomMaskEdit.KeyUp(var Key: Word; Shift: TShiftState);
begin
   inherited KeyUp(Key, Shift);
   if (Key= VK_DELETE) then
   begin
     if Assigned(FOnCheckValue) then isValidPictureValue(Text);
   end
end;

procedure TwwCustomMaskEdit.Applymask;
var s: string;
    pict: TwwPictureValidator;
begin
    pict:= TwwPictureValidator.create(FwwPicture.PictureMask, FwwPicture.AutoFill);
    s:= Text;
    Pict.picture(s, FwwPicture.AutoFill);
    Text:= s;
    Pict.Free;
end;

procedure TwwCustomMaskEdit.KeyPress(var Key: Char);
var pict: TwwPictureValidator;
    s: string;
    res: TwwPicResult;
    padlength, OldSelStart, Oldlen, OldSelLen: integer;
    DisplayTextIsInvalid, skipInvalidValueTest: boolean;
    Delphi2: boolean;

   Function NewText: string;
   var curStr : string;
   begin
      curStr:= Text;
      if (ord(key)=vk_back) then begin
         if (length(curstr)>=1) then
            delete(curstr, selStart, 1);
         result:= curStr;
      end
      else
         result:= copy(curStr, 1, selStart+1-1) +
               char(Key) + copy(curStr, selStart + 1 + length(SelText), 32767);
   end;


begin
  inherited KeyPress(Key);

  ModifiedInKeyPress:= False; {1/21/97}

  if HavePictureMask then begin
     if (ord(Key) = VK_BACK) then
     begin
       EnableEdit;
       if Assigned(FOnCheckValue) and (not ReadOnly) then
          isValidPictureValue(NewText);
       exit;
     end;
     if (ord(key)<VK_SPACE) then begin
        if (not wantReturns) and (ord(key)=vk_return) then key:= #0; { 1/7/99 - Avoid beep in record-view dialog }
        exit;
     end;

     pict:= TwwPictureValidator.create(FwwPicture.PictureMask, FwwPicture.AutoFill);

     s:= NewText;

     if (Maxlength>0) and (length(s)>MaxLength) and (length(s)>length(Text)) then exit; { Limit to maxlength }

     res:= Pict.picture(s, FwwPicture.AutoFill);
     DisplayTextIsInvalid:= False;
     SkipInvalidValueTest:= False;

     oldSelStart:= SelStart;
     oldLen:= length(Text);
     oldSelLen:= SelLength;

     case res of
       prError: begin
             { If at end of list }
             if (selStart + length(selText) >= length(Text)) then begin
                key:= char(0);
                MessageBeep(0);
                SkipInvalidValueTest:= True; { Rely upon previous call }
             end
             else DisplayTextIsInvalid:= True;
         end;

       prIncomplete: begin
            EnableEdit;
            if not ReadOnly then
            begin
               padLength := length(s) - length(text);
               text:= s;
               if (oldSelLen=oldLen) then selStart:= length(s)
               else if (oldSelLen>0) then selStart:= OldSelStart + 1 {5/12/97 }
               else selStart:= OldSelStart + padLength;
               key:= char(0);
               DisplayTextIsInvalid:= True;
               ModifiedInKeyPress:= True; {1/21/97}
            end;
         end;

       prComplete: begin
            EnableEdit;
            if not ReadOnly then
            begin
               {$ifdef win32}
               {$ifndef wwDelphi3Up}
               Delphi2:= True;
               {$else}
               Delphi2:= False;
               {$endif}
               {$else}
               Delphi2:= False;
               {$endif}

               {11/21/96 - Workaround for Delphi 2 bug in scrolling in unbordered control}
               if Delphi2 and (BorderStyle=bsNone) then begin
                  if (length(s)>1) then text:= copy(s, 1, oldSelStart) + copy(s, oldSelStart+2, length(s)-1)
                  else text:= '';
                  selStart:= OldSelStart;
                  if (length(s)>0) then key:= s[oldSelStart+1];
               end
               else begin
                  text:= s;
                  if (oldSelLen=oldLen) then selStart:= length(s)
                  else if (length(s)>oldlen) then
                     selStart:= oldSelStart + (length(s)-oldlen) {Move caret to the right}
                  else selStart:= oldSelStart + 1;  { 11/26/96 }
                  selLength:= 0; {8/12/97 - Clear selLength}
                  key:= char(0);
                  ModifiedInKeyPress:= True; {1/21/97}
               end
            end
         end;

     end;
     pict.Free;

     if (not SkipInvalidValueTest) and (not ReadOnly) then
        DoOnCheckValue(not DisplayTextIsInvalid);

  end;

  { 10/2/97 - Avoid beep in record-view with entertotab}
  { 12/1/97 - Added check to see if wantReturns is True to allow carriage
              returns in wwdbedits that have that property set.}
  if (not wantReturns) and (ord(key)=vk_return) then key:= #0;
end;

procedure TwwDBCustomEdit.EnableEdit;
begin
   FDataLink.Edit;
end;

procedure TwwCustomMaskEdit.EnableEdit;
begin
end;

Function TwwDBCustomEdit.GetDBPicture: string;
var tempResult: string;
begin
   result:= '';
   if (DataSource=Nil) or (DataSource.DataSet=Nil) then exit;
   if not (DataSource.DataSet is TwwTable) then exit;
   if not TwwTable(DataSource.DataSet).isParadoxTable then exit;

   tempResult:= TwwTable(DataSource.DataSet).GetDBPicture(DataField);
   if tempResult<>'' then result:= tempResult
   else result:= FwwPicture.PictureMask;

end;

{$ifdef win32}
procedure TwwDBCustomEdit.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;
{$endif}

procedure TwwCustomMaskEdit.SetEditRect;
var
  Loc: TRect;
begin
  Loc.Bottom :=ClientHeight+1; {+1 is workaround for windows paint bug
                                when es_multiline and borderStyle=bsSingle }
  Loc.Right := ClientWidth-1;

  if (BorderStyle = bsNone) and IsInwwObjectView(self) then begin
     Loc.Top := 1;
     Loc.Left := 1;
  end
  else if (BorderStyle = bsNone) and (Parent is TCustomGrid) then begin
     Loc.Top := 2;
     Loc.Left := 2;
  end
  else if (Frame.Enabled) then
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

procedure TwwCustomMaskEdit.CreateWnd;
begin
   inherited CreateWnd;
   if (BorderStyle=bsNone) and AutoSize and
     not (parent is TCustomGrid) then Frame.AdjustHeight;
   SetEditRect;
end;

procedure TwwDBCustomEdit.CreateWnd;
begin
   inherited CreateWnd;
   if IsTransparentEffective then
   begin
     wwDisableParentClipping(Parent);
   end;
end;

procedure TwwCustomMaskEdit.WMSize;
begin
  inherited;
  SetEditRect;
end;

Function TwwDBCustomEdit.Editable: boolean;
begin
   result:= True;
end;

procedure TwwDBCustomEdit.WndProc(var Message: TMessage);
begin
  inherited;
end;

procedure TwwDBCustomEdit.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if not Editable then
    HideCaret (Handle);
end;

Function TwwDBCustomEdit.GetClientEditRect: TRect;
var R:TRect;
begin
  {3/31/98 - Modified GetClientEditRect to return the actual Edit Rectangle}
  R:= ClientRect;
  if (GetIconIndent > 0) and ShowButton then
     R.Right := R.Right-GetIconIndent;
  result := R;
end;

Procedure TwwDBCustomEdit.DoEnter;
begin
   inherited DoEnter;
   GetPicture;
   if Parent is TwwDBGrid then SelectAll;  { Select all when focus set }
   if (DataLink.Field=Nil) then modified:= False;  { 1/21/97 - Only clear if unbound }
end;

  Function TwwDBPicture.isDatasetMask: boolean;
  begin
     result:= False;
     if not PictureMaskFromDataSet then exit;

     if (relatedComponent is TwwDBCustomEdit) then
        with (relatedComponent as TwwDBCustomEdit) do
        begin
           if (datasource<>nil) and (Datasource.dataset<>nil) and (DataField<>'') then
           begin
              if wwGetPictureMasks(datasource.dataset)=nil then result:= false
              else result:= True;
           end
        end
  end;

  procedure TwwDBPicture.FlushToDataset(SetMask, SetAutoFill, SetUsePictureMask: boolean);
  begin
     if isDatasetMask then
        with (relatedComponent as TwwDBCustomEdit) do begin
           wwSetPictureMask(DataSource.DataSet, DataField,
                  FPictureMask, FAutofill, False, SetMask, SetAutoFill, SetUsePictureMask);
           if ([csDesigning, csWriting] * ComponentState) = [csDesigning] then
              wwDataModuleChanged(DataSource.Dataset);
        end
  end;

  procedure TwwDBPicture.SetPictureMask(val: string);
  begin
     if isDataSetMask then
        with (relatedComponent as TwwDBCustomEdit) do begin
           if wwPdxPictureMask(DataSource.DataSet, DataField)<>'' then begin
              MessageDlg('Picture mask already defined in Paradox table. ',
                         mtWarning, [mbok], 0);
              exit;
           end
        end;
     FPictureMask:= val;
     FlushToDataset(True, False, False);
  end;

  procedure TwwDBPicture.SetAutoFill(val: boolean);
  begin
     FAutoFill:= val;
     FlushToDataset(False, True, False);
  end;

  procedure TwwDBPicture.SetAllowInvalidExit(val: boolean);
  begin
     if not isDataSetMask then
        FAllowInvalidExit:= val;
  end;

  Function TwwDBPicture.GetPictureMask: string;
  var tempMask: string;
      tempAutoFill, tempUsePictureMask: boolean;
  begin
     if isDatasetMask then
        with (relatedComponent as TwwDBCustomEdit) do begin
          wwPictureByField(Datasource.dataset, DataField, True,
                      tempMask, tempAutoFill, tempUsePictureMask);
          result:= tempMask;
        end
     else result:= FPictureMask;
  end;

  Function TwwDBPicture.GetAutoFill: boolean;
  var tempMask: string;
      tempAutoFill, tempUsePictureMask: boolean;
  begin
     if isDatasetMask then
        with (relatedComponent as TwwDBCustomEdit) do begin
          wwPictureByField(Datasource.dataset, DataField, True,
                      tempMask, tempAutoFill, tempUsePictureMask);
          if tempMask='' then result:= FAutoFill
          else result:= tempAutoFill;
        end
     else result:= FAutoFill;
  end;

  Function TwwDBPicture.GetAllowInvalidExit: boolean;
  begin
     if isDatasetMask then result:= False
     else result:= FAllowInvalidExit;
  end;

  Function TwwDBCustomEdit.StorePictureProperty: boolean;
  begin
     result:= (not Picture.isDatasetMask) and (Picture.PictureMask<>'');
  end;

  Procedure TwwDBCustomEdit.SetModified(val: boolean);
  begin
     if val and (FDataLink.Field<>Nil) and
        ((FDataLink.ReadOnly) or (FDataLink.Field.ReadOnly)) then exit; {2/22/99}

     if val then FDatalink.modified;
     Modified:= val;
     if (Modified <> val) then
        Modified:= val;
  end;

function TwwDBCustomEdit.GetShowButton: boolean;
begin
   result:= False;
end;

procedure TwwDBCustomEdit.SetShowButton(sel: boolean);
begin
end;

Function TwwDBCustomEdit.isDateField: boolean;
begin
   result:=
      ((Field<>Nil) and (Field is TDateField))
      or
      (FDataType = wwEdtDate)
end;

Function TwwDBCustomEdit.isTimeField: boolean;
begin
   result := ((Field<>Nil) and (Field is TTimeField))
   or (FDataType = wwEdtTime);
end;

Function TwwDBCustomEdit.isDateTimeField: boolean;
begin
   result:=
      ((Field<>Nil) and (Field is TDateTimeField))
      or
      (FDataType = wwEdtDateTime);
end;

function TwwDBCustomEdit.IsMemoField: boolean;
begin
   result:= (FDataLink.Field<>Nil) and (FDataLink.Field is TBlobField)
           {$ifdef win32}
             and
            (TBlobField(FDataLink.Field).BlobType=ftMemo)
           {$endif}
end;

procedure TwwDBCustomEdit.Loaded;
begin
   inherited Loaded;
   ResetMaxLength(Self);
   if (DataSource=nil) and (not ReadOnly) then ReadOnly:= False;
end;

{$ifdef wwdelphi4up}
function TwwDBCustomEdit.ExecuteAction(Action: TBasicAction): Boolean;
begin
   Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
     FDataLink.ExecuteAction(Action);
end;

function TwwDBCustomEdit.UpdateAction(Action: TBasicAction): Boolean;
begin
   Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
     FDataLink.UpdateAction(Action);
end;
{$endif}

procedure TwwDBCustomEdit.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  if IsInwwObjectViewPaint(self) or
    (IsTransparentEffective and not FFocused) then
  begin
     Message.result:= 1;
  end
  else
     inherited;
end;

{procedure TwwCustomMaskEdit.AdjustHeight;
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
{procedure TwwCustomMaskEdit.GetEditRectForFrame(var Loc: TRect);
begin
     if (Frame.FocusStyle = efsFrameBox) then
     begin
        Loc.Top := 2;
        Loc.Left := 2;
     end
     else if is3DBorder then
     begin
        Loc.Top := 3;
        if efLeftBorder in Frame.FocusBorders then
        begin
           if Frame.FocusStyle in [efsFrameSunken, efsFrameBump] then
              Loc.Left := 3
           else Loc.Left:= 2;
        end
        else Loc.Left:=1;

        Loc.Right:= Loc.Right -2
     end
     else begin
        Loc.Top:= 1;
        Loc.Left:= 1;
     end
end;
}
procedure TwwDBCustomEdit.CMTextChanged(var Message: TMessage);
begin
  if IsTransparentEffective and (not FFocused) then
     Frame.RefreshTransparentText;
     
  inherited;
end;

function TwwDBCustomEdit.GetEffectiveAlignment: TAlignment;
begin
   if IsInwwObjectView(self) then result:= taLeftJustify
   else if FDataLink.Field=nil then result:= FUnboundAlignment
   else result:= FAlignment
end;

procedure Register;
begin
end;

end.
