{
//
// Components : TwwDBCustomCombo, TwwDBComboDlg
//
// Copyright (c) 1996, 1997, 1998 by Woll2Woll Software
//
//
// 2/25/98 - Call IsValidChar instead of checking [32..255] in KeyDown method
//
// 9/2/98 -  Call FButton.Update in paint event so Delphi 4 paints icon correctly
//           in DBCtrlGrid
// 11/10/98 - Publish ParentBidiMode
}
unit Wwdotdot;

interface
{$i wwIfDef.pas}

uses
  Forms, SysUtils, Windows, Messages, Classes,
  Controls, Buttons, Graphics,
  dbctrls, mask, db, dbtables, stdctrls, wwdbedit, wwdblook, wwdatsrc,
  wwframe;

type

  TwwDBCustomCombo =class(TwwDBCustomEdit)
   private
    FBtnControl:TWincontrol;
    FButton:TSpeedButton;
    FOnCustomDlg:TNotifyevent;
    FStyle: TwwDBLookupComboStyle;
    FButtonStyle: TwwComboButtonStyle;
    FDroppedDown: boolean;
    FMouseInButtonControl: boolean;
    FLimitEditRect: boolean;
    FButtonEffects: TwwButtonEffects;
    FButtonGlyph: TBitmap;
    FButtonWidth: integer;
    SkipUpdate: boolean;

    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure WMPaint(var Message: TMessage); message WM_PAINT;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure SetButtonGlyph(Value: TBitmap);
    procedure NonEditMouseDown(var Message: TWMLButtonDown);
    procedure SetButtonStyle(val: TwwComboButtonStyle);
    Procedure UpdateButtonPosition;
    Procedure SetButtonWidth(val: integer);
    function GetButtonWidth: integer;

   protected
    procedure GlyphChanged(Sender: TObject); virtual;
    function IsCustom: Boolean; virtual;
    procedure KeyPress(var Key: Char); override;
    procedure CreateParams(var Params: TCreateParams); override;
    Function LoadComboGlyph: HBitmap; virtual;
    Procedure DrawButton(Canvas: TCanvas; R: TRect; State: TButtonState;
       ControlState: TControlState; var DefaultPaint: boolean); virtual;
    procedure SetEditRect; override;
    procedure WMSize(var msg:twmsize); message wm_size;
    procedure BtnClick(sender:tobject);
    procedure BtnMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    function GetShowButton: boolean; override;
    procedure SetShowButton(sel: boolean); override;
    Function GetIconIndent: integer; override;
    Function GetIconLeft: integer; override;
    Function Editable: boolean; override;
    Function MouseEditable: boolean; virtual;
//    Function GetClientEditRect: TRect; override;
    Function IsDroppedDown: boolean; virtual;
    procedure CloseUp(Accept: Boolean); virtual;
    procedure HandleDropDownKeys(var Key: Word; Shift: TShiftState);
    procedure Loaded; override;
    procedure InvalidateTransparentButton;

   public
    constructor Create(AOwner:tcomponent); override;
    destructor Destroy; override;
    procedure DropDown; virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

    property Button: TSpeedButton read FButton;
    property OnCustomDlg: TNotifyevent read FOnCustomDlg write FOnCustomDlg;
    property Style: TwwDBLookupComboStyle read FStyle write FStyle;
    property ButtonStyle: TwwComboButtonStyle read FButtonStyle write SetButtonStyle;
    property ButtonEffects: TwwButtonEffects read FButtonEffects write FButtonEffects;
//    property ButtonFlat : boolean read GetFlatButton write SetFlatButton default False;
//    property ButtonTransparent: boolean read FFlatButtonTransparent write SetFlatButtonTransparent default false;
    property LimitEditRect: boolean read FLimitEditRect write FLimitEditRect default False;
    property ButtonGlyph: TBitmap read FButtonGlyph write SetButtonGlyph stored IsCustom;
    property ButtonWidth: integer read GetButtonWidth write SetButtonWidth default 0;
     { LimitEditRect allows text to scroll instead of being typed over button area.
       Set this to true to force the caret to always be visible instead of being hidden behind the button.
       The negative consequence of this being set to true is that the combobox will no
       longer close the form on an escape, as the escape goes to the control instead }

  end;

  TwwDBComboDlg =class(TwwDBCustomCombo)
   published
    property OnCustomDlg;
    {$ifdef wwDelphi4Up}
    property Anchors;
    property BiDiMode;
    property Constraints;
    property ParentBiDiMode; { 11/10/98 }
    {$endif}
    property ShowButton;
    property Style;
    property ButtonStyle default cbsEllipsis;
    property AutoFillDate;
    property AutoSelect;
    property AutoSize;
    property BorderStyle;
    property CharCase;
    property Color;
    property Ctl3D;
    property DataField;
    property DataSource;
    property DragCursor;
    property DragMode;
    property Enabled;
    property ButtonEffects;
//    property ButtonTransparent;
//    property ButtonFlat;
    property Frame;
    property ButtonWidth;
    property ButtonGlyph;
    property Font;
    {$ifdef wwDelphi3Up}
    property ImeMode;
    property ImeName;
    {$endif}
    property LimitEditRect;
    property MaxLength;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property Picture;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
//    property Transparent;
    property UnboundDataType;
    property UsePictureMask;
    property Visible;
    property UnboundAlignment;

    property OnChange;
    property OnCheckValue;
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

  end;

  TwwComboDlgButton = class(TSpeedButton)
  protected
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
  end;

  procedure Register;

implementation

uses wwDBiGrd, wwcommon;

{.$R *.RES}

type
{  TwwButton = clas(TSpeedButton)
    protected
  end;
}
  TwwComboButtonEffects = class(TwwButtonEffects)
     protected
        procedure Refresh; override;
  end;

  TBtnWinControl = class(TWinControl)
  private
    EditControl: TwwDBCustomCombo;

    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBkgnd;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  public
    constructor Create(AOwner: TComponent); override;
  end;

Procedure TwwComboButtonEffects.refresh;
begin
   (Button as TSpeedButton).Glyph.Handle:= TwwDBCustomCombo(Control).LoadComboGlyph;
end;


procedure TBtnWinControl.WMEraseBkgnd(var Message: TWmEraseBkgnd);
var r: TRect;
    cc: TwwDBCustomCombo;
begin
  cc:= TwwDBCustomCombo(parent);
  if cc.skipupdate then exit;
  if (IsInwwObjectViewPaint(parent) or
     cc.isTransparentEffective)  then
  begin
     { Fixes paint problem when mouse is clicked in button and moved outside
       region, but it is not released }
     if (cc.ButtonEffects.Flat or cc.ButtonEffects.Transparent) and
        (csLButtonDown in cc.FButton.ControlState) then
     begin
        r:= Rect(parent.left + Left , parent.Top+top,
                 parent.left + left + Width, parent.top + Top + Height);
        InvalidateRect(parent.parent.handle, @r, False);
        cc.skipupdate:= true;
        parent.parent.update;
        cc.skipupdate:= False;
     end;
     message.result:= 1;
  end
  else inherited;
end;

constructor TwwDBCustomCombo.Create;
begin
   inherited create(aowner);

   FButtonStyle:= cbsEllipsis;

   FBtnControl := TBtnWinControl.Create (Self);
   {$IFDEF WIN32}
   FBtnControl.ControlStyle := FBtnControl.ControlStyle + [csReplicatable];
   {$ENDIF}
   FBtnControl.Width:= wwmax(GetSystemMetrics(SM_CXVSCROLL)+4, 17); {4/10/97}
   FBtnControl.Height := 17;
   FBtnControl.Visible := True;
   FBtnControl.Parent := Self;

   FButton:=TwwComboDlgButton.create(self);
   {$IFDEF WIN32}
   FButton.ControlStyle := FButton.ControlStyle + [csReplicatable];
   {$ENDIF}
   FButton.SetBounds (0, 0, FBtnControl.Width, FBtnControl.Height);
   FButton.Width:= wwmax(GetSystemMetrics(SM_CXVSCROLL), 15); {5/2/97 }
   FButton.Parent:= FBtnControl;
   FButton.OnClick:=BtnClick;
   FButton.OnMouseDown:= BtnMouseDown;
   FButton.OnMouseUp:= BtnMouseDown;
   FLimitEditRect:= False;

   FButtonGlyph := TBitmap.Create;
   FButtonGlyph.OnChange := GlyphChanged;

   FButtonEffects:= TwwComboButtonEffects.create(self, FButton);
   FButton.Glyph.Handle:= LoadComboGlyph;


end;

destructor TwwDBCustomCombo.Destroy;
begin
  FButtonEffects.Free;
  FButton.Free;
  FButton:= Nil;
  FButtonGlyph.Free;
  inherited Destroy;
end;

procedure TwwDBCustomCombo.WMPaint(var Message: TMessage);
begin
  inherited;
  FButton.Invalidate;
  FButton.Update; { 9/2/98 }
end;

Function TwwDBCustomCombo.GetIconIndent: integer;
begin
   result:= FBtnControl.Width;
end;

Function TwwDBCustomCombo.GetIconLeft: integer;
begin
   result:= FBtnControl.Left - 1;
end;

Function TwwDBCustomCombo.LoadComboGlyph: HBitmap;
begin
   result:= 0;
   if (FButtonStyle=cbsCustom) and (FButtonGlyph<>nil) then
   begin
      result:= FButtonGlyph.Handle;
   end
   else if ButtonEffects.Flat or ButtonEffects.Transparent then
   begin
      if (FButtonStyle = cbsDownArrow) {and (FlatButtonTransparent) }then
         result:= LoadBitmap(HInstance, 'WWDROPDOWN')
//      else
//        result:= LoadBitmap(HInstance, 'WWDOTS')
   end;
(*   {$ifdef win32}
   result:= 0;
   {$else}
   if FButtonStyle = cbsDownArrow then
      result:= LoadBitmap(0, PChar(32738))
   else result:= LoadBitmap(HInstance, 'DOTS')
   {$endif}
*)
end;

function TwwDBCustomCombo.GetShowButton: boolean;
begin
   result:= FBtnControl.visible;
end;

procedure TwwDBCustomCombo.SetShowButton(sel: boolean);
begin
   if (FBtnControl.visible<> sel) then
   begin
      FBtnControl.visible:= sel;
      {10/5/97 - Don't call SetEditRect when loading as this is called when
                 loading is completed.  SetEditRect should be called after
                 all the properties are read in. }
      if not (csLoading in Owner.ComponentState) then SetEditRect;
      self.invalidate;
   end
end;

procedure TwwDBCustomCombo.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style :=(Params.Style and not (ES_AUTOVSCROLL or ES_WANTRETURN) or
                   WS_CLIPCHILDREN);
  {$ifdef wwdelphi4up}
  if UseRightToLeftAlignment or LimitEditRect then
    Params.Style:= Params.Style or ES_MULTILINE;
  {$endif}

end;

procedure TwwDBCustomCombo.SetEditRect;
var
  Loc: TRect;
begin
  Loc.Bottom :=ClientHeight+1; {+1 is workaround for windows paint bug}
  if ShowButton then Loc.Right := FBtnControl.Left - 2
  else Loc.Right:= ClientWidth - 2;

  if (Frame.IsFrameEffective) then
  begin
     Frame.GetEditRectForFrame(Loc);
  end
  else if (BorderStyle = bsNone) and
     (IsInwwObjectView(self)) then begin
     Loc.Top := 1;
     Loc.Left := 1;
  end
  else if (BorderStyle = bsNone) then begin
     Loc.Top := 2;
     Loc.Left := 2;
  end
  else begin
     Loc.Top := 0;
     Loc.Left := 0;
  end;

  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@Loc));
end;

type
 TCheatButton = class(TSpeedButton);

Procedure TwwDBCustomCombo.UpdateButtonPosition;
var offset :Integer;
begin
  {$ifdef WIN32}
  if Frame.IsFrameEffective then
  begin
     offset:= 2;
  end
  else offset:= 0;
  if (not NewStyleControls) or (BorderStyle = bsNone) or (not Ctl3d) then
     FBtnControl.SetBounds (Width - FButton.Width - offset, offset, FButton.Width, ClientHeight-offset*2)
  else
     FBtnControl.SetBounds (Width - FButton.Width - 4, offset, FButton.Width, ClientHeight-offset);

  if BorderStyle = bsNone then begin
     FButton.Top:= -1; {Allows bitmap to be larger }
     FButton.Height := FBtnControl.Height+1;
  end
  else begin
     FButton.Top:= 0; {Allows bitmap to be larger }
     FButton.Height := FBtnControl.Height;
  end;
  {$else}
  if (not NewStyleControls) or (BorderStyle = bsNone) then
     FBtnControl.SetBounds (Width - FButton.Width, 0, FButton.Width, ClientHeight)
  else
     FBtnControl.SetBounds (Width - FButton.Width - 2, 2, FButton.Width, ClientHeight-4);
  FButton.Height := FBtnControl.Height;
  {$endif}

  SetEditRect;
end;

procedure TwwDBCustomCombo.WMSize;
begin
  inherited;
  UpdateButtonPosition;
end;

procedure TwwDBCustomCombo.BtnMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
begin
   exit; { Check if following code needed by exiting out and testing }
{   if FFlatButton and FFlatButtonTransparent then begin
     with FBtnControl do begin
         r:= Rect(parent.left + Left, parent.Top+top,
                 parent.left + left+ Width, parent.top + Top + Height);
         InvalidateRect(parent.parent.handle, @r, True);
         parent.parent.Update;
     end
   end;}
end;

procedure TwwDBCustomCombo.BtnClick;
begin
   if Patch[2]=False then exit;

   if isDroppedDown then CloseUp(True)
   else begin
      if CanFocus then SetFocus;  { 8/30/96 - Set focus to control }
      if Focused then DropDown;   { 5/28/97 - Only drop-down if focus was allowed }
   end
end;

procedure TwwDBCustomCombo.CloseUp(Accept: boolean);
begin
   if Accept then modified:= True;
end;

procedure TwwDBCustomCombo.DropDown;
begin
   if Assigned(FOnCustomDlg) then begin
      FDroppedDown:= True;

      Invalidate;

      try  { If exception then clean-up }
         if (datasource<>nil) and (datasource.dataset<>nil) then
{            datasource.dataset.edit;}
            EnableEdit;
         FOnCustomDlg(self);
      finally
         if (not editable) then
            HideCaret(Handle); { Support csDropDownList style }
         Invalidate;
         FDroppedDown:= False;
      end;
   end
end;

Function TwwDBCustomCombo.Editable: boolean;
begin
   Result := (FStyle <> csDropDownList) or isDroppedDown;
end;

Function TwwDBCustomCombo.MouseEditable: boolean;
begin
   Result := (FStyle <> csDropDownList);
end;


procedure TwwDBCustomCombo.HandleDropDownKeys(var Key: Word; Shift: TShiftState);
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
        Key := 0;
      end;
  end;
end;


procedure TwwDBCustomCombo.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if GetKeyState(VK_MENU) < 0 then
  begin
     Include(Shift, ssAlt);
{     wwClearAltChar;}
  end;

  HandleDropDownKeys(Key, Shift);

  inherited KeyDown (Key, Shift);

  { 2/25/98 }
  if wwIsValidChar(Key) and (not Editable) then key:= 0;
//  if (Key in [32..255]) and (not Editable) then key:=0;

end;

procedure TwwDBCustomCombo.KeyPress(var Key: Char);
begin
  { Disregard tab key since inherited maskedit event will beep }
  if isMasked and (Key=#9) then exit;
  inherited KeyPress(Key);
end;

procedure TwwDBCustomCombo.WMLButtonDown(var Message: TWMLButtonDown);
begin
  if MouseEditable then
    inherited
  else
    NonEditMouseDown (Message);
end;

procedure TwwDBCustomCombo.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  if MouseEditable then
    inherited
  else
    NonEditMouseDown (Message);
end;

procedure TwwDBCustomCombo.WMLButtonUp(var Message: TWMLButtonUp);
begin
  if not MouseEditable then MouseCapture := False;
  inherited;
end;

procedure TwwDBCustomCombo.NonEditMouseDown(var Message: TWMLButtonDown);
var
  CtrlState: TControlState;
begin
  if not (Parent is TwwCustomDBGrid) then SetFocus;
{  HideCaret (Handle);}

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

Procedure TwwDBCustomCombo.DrawButton(Canvas: TCanvas; R: TRect; State: TButtonState;
       ControlState: TControlState; var DefaultPaint: boolean);
var Transparent: boolean;
begin
   {$ifdef win32}
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
   {$endif}
end;

constructor TBtnWinControl.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   EditControl:= AOwner as TwwDBCustomCombo;
end;

procedure TBtnWinControl.CMMouseEnter(var Message: TMessage);
begin
  inherited;
//  if EditControl.FButton.Flat and (not EditControl.ButtonTransparent) then
//  begin
//     EditControl.UpdateButtonPosition;
//     EditControl.InvalidateTransparentButton;
//     Invalidate;
//  end
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

procedure TwwComboDlgButton.Paint;
var R : TRect;
    DefaultPaint: boolean;
begin
   if twwdbCustomCombo(parent.parent).SkipUpdate then exit;

   if (csPaintCopy in ControlState) and
      not (csDesigning in ComponentState) and IsInGrid(parent.parent) then exit;

   SetRect(R, 0, 0, ClientWidth, ClientHeight);
   with TwwDBCustomCombo(Parent.Parent) do
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

      { Draw edges  }
      if MouseInControl or (not ButtonEffects.Flat) or
         FFocused or wwisClass(Parent.classType, 'TwwDBGrid') then
      begin
         if FState=bsDown then
            DrawEdge(Canvas.Handle, R, EDGE_SUNKEN, BF_RECT)
         else
            DrawEdge(Canvas.Handle, R, EDGE_RAISED, BF_RECT)
      end

   end
end;

{Function TwwDBCustomCombo.GetClientEditRect: TRect;
begin
   result:= ClientRect;
   if ShowButton then result.Right:= FBtnControl.Left;
end;}

procedure TwwDBCustomCombo.SetButtonStyle(val: TwwComboButtonStyle);
begin
   if val<>FButtonStyle then begin
      FButtonStyle:= val;
      FButton.Glyph.Handle:= LoadComboGlyph;
      FButton.Invalidate;
   end
end;

Function TwwDBCustomCombo.IsDroppedDown: boolean;
begin
   result:= FDroppedDown;
end;

procedure TwwDBCustomCombo.Loaded;
begin
  if FButtonWidth=0 then
     FButton.Width:= wwmax(GetSystemMetrics(SM_CXVSCROLL), 15);
  if (parent<>Nil) or (owner<>nil) then  { 11/17/97 - parent=nil causes runtime error }
     UpdateButtonPosition;
  inherited Loaded;
end;

procedure TwwDBCustomCombo.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  FButton.Enabled := Enabled;
end;

procedure TwwDBCustomCombo.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  Invalidate;
end;

procedure Register;
begin
{  RegisterComponents('InfoPower', [TwwDBComboDlg]);}
end;

procedure TwwDBCustomCombo.InvalidateTransparentButton;
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

procedure TwwComboDlgButton.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
   inherited MouseUp(Button, Shift, X, Y);
   TwwDBComboDlg(parent.parent).InvalidateTransparentButton;
end;

procedure TwwComboDlgButton.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var dropDownListVisible: boolean;
begin

  if TwwDBComboDlg(Parent.Parent).Patch[2]=True then
  begin
     inherited MouseDown (Button, Shift, X, Y);
     TwwDBComboDlg(parent.parent).InvalidateTransparentButton;
     exit;
  end;

  with TwwDBComboDlg(Parent.Parent) do
  begin

    dropDownListVisible:= IsDroppedDown;

    if isDroppedDown then
    begin
      if (Handle <> GetFocus) and CanFocus then
      begin
        SetFocus;
        if GetFocus <> Handle then Exit;
      end;
    end;
  end;
  inherited MouseDown (Button, Shift, X, Y);
  Update;  { 4/17/98 - Finish drawing down state }

  with TwwDBComboDlg(Parent.Parent) do
  begin
    if not dropDownListVisible and isDroppedDown then exit; {skip remaining code }

    if IsDroppedDown then begin
//      if InList then GridClick(self);  {Now hiding drop down so select current selection } {5/14/97 - if InList}
      CloseUp(True)
    end
    else
    begin
      DropDown;
    end;
  end;


end;

{procedure TwwDBCustomCombo.SetFlatButton(val: boolean);
begin
   if FFlatButton <>val then
   begin
      FFlatButton:= val;
      FButton.Flat:= FFlatButton or FFlatButtonTransparent;
      FButton.Glyph.Handle:= LoadComboGlyph;
      FButton.Invalidate;
   end;
end;

procedure TwwDBCustomCombo.SetFlatButtonTransparent(val: boolean);
begin
   if FFlatButtonTransparent<>val then
   begin
      FFlatButtonTransparent:= val;
      FButton.Flat:= FFlatButton or FFlatButtonTransparent;
      FButton.Glyph.Handle:= LoadComboGlyph;
      FButton.Invalidate;
   end;
end;

function TwwDBCustomCombo.GetFlatButton: boolean;
begin
   result:= FFlatButton;
//   result:= FButton.Flat;
end;
}

procedure TwwDBCustomCombo.CMExit(var Message: TCMExit);
begin
   inherited;
   if ButtonEffects.Flat then FButton.invalidate;
end;

procedure TwwDBCustomCombo.CMEnter(var Message: TCMEnter);
begin
   inherited;
   if ButtonEffects.Flat then begin
      UpdateButtonPosition;
      FButton.invalidate;
   end
end;

function TwwDBCustomCombo.IsCustom: Boolean;
begin
  Result := ButtonStyle = cbsCustom;
end;

procedure TwwDBCustomCombo.SetButtonGlyph(Value: TBitmap);
begin
  FButtonGlyph.Assign(Value);
  Invalidate;
end;

procedure TwwDBCustomCombo.GlyphChanged(Sender: TObject);
begin
   FButton.Glyph.Handle:= LoadComboGlyph;
   Invalidate;
end;

Procedure TwwDBCustomCombo.SetButtonWidth(val: integer);
begin
   if FButtonWidth<>val then
   begin
      FButtonWidth:= val;
      if val<>0 then Button.Width:= val
      else Button.Width:= wwmax(GetSystemMetrics(SM_CXVSCROLL), 15);
      UpdateButtonPosition;
   end
end;

function TwwDBCustomCombo.GetButtonWidth: integer;
begin
   result:= FButtonWidth;
end;


end.
