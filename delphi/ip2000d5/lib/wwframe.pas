unit wwframe;

interface

uses classes, Windows, controls, stdctrls, graphics, forms, Messages, typinfo;

type
  TwwComboButtonStyle = (cbsEllipsis, cbsDownArrow, cbsCustom);

  TwwButtonEffects = class(TPersistent)
  private
     FTransparent: boolean;
     FFlat: boolean;
     procedure SetTransparent(val: boolean);
     procedure SetFlat(val: boolean);
  protected
     Procedure Refresh; virtual;
  public
     Control: TControl;
     Button: TControl;
     constructor Create(Owner: TComponent; AButton: TControl);
     class Function Get(Control: TControl): TwwButtonEffects;
  published
     property Transparent: boolean read FTransparent write SetTransparent default false;
     property Flat: boolean read FFlat write SetFlat default false;
  end;

  TwwEditFocusStyle = (efsFrameBox, efsFrameSunken, efsFrameRaised, efsFrameEtched, efsFrameBump);
  TwwEditFrameEnabledType = (efLeftBorder, efTopBorder, efRightBorder, efBottomBorder);
  TwwEditFrameEnabledSet = set of TwwEditFrameEnabledType;
  TwwEditFrame = class(TPersistent)
  private
    Control: TWinControl;
    FEnabled: boolean;
    FNonFocusBorders: TwwEditFrameEnabledSet;
    FFocusBorders: TwwEditFrameEnabledSet;
    FFocusStyle: TwwEditFocusStyle;
    FNonFocusStyle: TwwEditFocusStyle;
    FNonFocusTextOffsetX: integer;
    FNonFocusTextOffsetY: integer;
    FTransparent: boolean;
    FTransparentClearsBackground: boolean;
    FAutoSizeHeightAdjust: integer;
    FNonFocusTransparentFontColor: TColor;
    procedure SetFocusBorders(val: TwwEditFrameEnabledSet);
    procedure SetNonFocusBorders(val: TwwEditFrameEnabledSet);
    procedure SetNonFocusStyle(val: TwwEditFocusStyle);
    procedure SetEnabled(val: boolean);
    procedure SetTransparent(val: boolean);
    procedure CheckParentClipping;
//    procedure AdjustEditRect;
  public
    CreateTransparent: boolean;
    constructor Create(Owner: TComponent);
    procedure GetEditRectForFrame(var Loc: TRect);
    procedure RefreshTransparentText(InvalidateBorders: boolean=False);
    procedure RefreshControl;
    procedure AdjustHeight;
    Function IsFrameEffective: boolean;
    class Function Get(Control: TControl): TwwEditFrame;

    Procedure Assign(Source: TPersistent); override;

    property TransparentClearsBackground: boolean
       read FTransparentClearsBackground write FTransparentClearsBackground default False;

  published
    property Enabled: boolean read FEnabled write SetEnabled default False;
    property Transparent: boolean read FTransparent write SetTransparent default False;
    property AutoSizeHeightAdjust: integer read FAutoSizeHeightAdjust write FAutoSizeHeightAdjust default 0;
    property FocusBorders : TwwEditFrameEnabledSet read FFocusBorders write SetFocusBorders
       default [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder];
    property NonFocusBorders : TwwEditFrameEnabledSet read FNonFocusBorders write SetNonFocusBorders
             default [efBottomBorder];
    property FocusStyle: TwwEditFocusStyle read FFocusStyle write FFocusStyle default efsFrameBox;
    property NonFocusStyle: TwwEditFocusStyle read FNonFocusStyle write SetNonFocusStyle default efsFrameBox;
    property NonFocusTextOffsetX: integer read FNonFocusTextOffsetX write FNonFocusTextOffsetX default 0;
    property NonFocusTextOffsetY: integer read FNonFocusTextOffsetY write FNonFocusTextOffsetY default 0;
    property NonFocusTransparentFontColor: TColor read FNonFocusTransparentFontColor write FNonFocusTransparentFontColor default clNone;
  end;


procedure wwDrawEdge(
     Control: TWinControl;
     Frame: TwwEditFrame;
     Canvas: TCanvas;
     Focused: boolean);

implementation

uses wwcommon, grids;

constructor TwwEditFrame.Create(Owner: TComponent);
begin
   inherited Create;
   Enabled:= false;
   FNonFocusBorders:= [efBottomBorder];
   FFocusBorders:= [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder];
   if Owner is TWinControl then
     control:= TWinControl(Owner)
   else
     control:= nil;
   FFocusStyle := efsFrameBox;
   FNonFocusStyle:= efsFrameBox;
   FNonFocusTextOffsetX:=0;
   FNonFocusTextOffsetX:=0;
   FNonFocusTransparentFontColor:= clNone;
end;

procedure TwwEditFrame.SetNonFocusBorders(val: TwwEditFrameEnabledSet);
begin
   FNonFocusBorders:= val;
   if control is TCustomEdit then
   begin
      RefreshControl;
   end
//   control.invalidate;
end;

procedure TwwEditFrame.SetFocusBorders(val: TwwEditFrameEnabledSet);
begin
   FFocusBorders:= val;
   if control is TCustomEdit then
   begin
      control.invalidate;
   end
end;

procedure TwwEditFrame.SetNonFocusStyle(val: TwwEditFocusStyle);
begin
   if val<>FNonFocusStyle then
   begin
      FNonFocusStyle:= val;
      if control is TCustomEdit then
      begin
         control.invalidate;
      end
   end
end;

procedure TwwEditFrame.SetEnabled(val: boolean);
begin
   if val<>FEnabled then
   begin
      FEnabled:= val;
      if control is TCustomEdit then
      begin
         if val then wwSetBorder(control, False);
         control.invalidate;
      end
   end
end;


procedure wwDrawEdge(
     Control: TWinControl;
     Frame: TwwEditFrame;
     Canvas: TCanvas;
     Focused: boolean);
var cr: TRect;
//    StateFlags: Word;
    Flags: integer;
    focusStyle: TwwEditFocusStyle;
begin
   cr:= Control.ClientRect;
   if Focused then begin
      if not (efRightBorder in Frame.FocusBorders) and
         frame.transparent then cr.right:= cr.right-2;
      flags:= 0;
      if efLeftBorder in Frame.FocusBorders then flags:= flags + bf_left;
      if efBottomBorder in Frame.FocusBorders then flags:= flags + bf_bottom;
      if efTopBorder in Frame.FocusBorders then flags:= flags + bf_top;
      if efRightBorder in Frame.FocusBorders then flags:= flags + bf_right;
      focusStyle:= Frame.FocusStyle;

   end
   else begin
      if not (efRightBorder in Frame.NonFocusBorders) and
         frame.transparent then cr.right:= cr.right-2;
      flags:= 0;
      if efLeftBorder in Frame.NonFocusBorders then flags:= flags + bf_left;
      if efBottomBorder in Frame.NonFocusBorders then flags:= flags + bf_bottom;
      if efTopBorder in Frame.NonFocusBorders then flags:= flags + bf_top;
      if efRightBorder in Frame.NonFocusBorders then flags:= flags + bf_right;
      focusStyle:= Frame.NonFocusStyle;
   end;

      if (FocusStyle=efsFrameBox) then
      begin
        DrawEdge(Canvas.Handle, cr, EDGE_SUNKEN, flags or bf_mono);
      end
      else if (FocusStyle=efsFrameSunken) then
      begin
        DrawEdge(Canvas.Handle, cr, EDGE_SUNKEN, flags);
      end
      else if (FocusStyle=efsFrameRaised) then
      begin
        DrawEdge(Canvas.Handle, cr, EDGE_RAISED, flags);
      end
      else if (FocusStyle=efsFrameEtched) then
      begin
        DrawEdge(Canvas.Handle, cr, EDGE_ETCHED, flags);
      end
      else if (FocusStyle=efsFrameBump) then
      begin
         DrawEdge(Canvas.Handle, cr, EDGE_BUMP, flags);
      end;

end;

procedure TwwEditFrame.CheckParentClipping;
var OldStyle:  longint;
begin
   if FTransparent and IsFrameEffective and
      not (csDesigning in Control.ComponentState) then
   begin
      if Control.HandleAllocated then
      begin
         OldStyle:= GetWindowLong(Control.Parent.Handle, GWL_STYLE);
         if OldStyle and (NOT WS_CLIPCHILDREN)<>OldStyle then
         begin
            SendMessage(Control.Handle, CM_RECREATEWND, 0, 0);
         end
      end
   end
end;

procedure TwwEditFrame.SetTransparent(val: boolean);
begin
   if val<>FTransparent then
   begin
     CreateTransparent:= val;
     FTransparent:= val;

     CheckParentClipping;

   end
end;

procedure TwwEditFrame.RefreshTransparentText(InvalidateBorders: boolean=False);
var r,tempeditrect:TRect;
    dc: HDC;
    brush: HBRUSH;
begin
   r:= Control.BoundsRect;
   if not InvalidateBorders then
   begin
     SendMessage(Control.handle,em_getrect, 0, Integer(@tempeditrect));
     InflateRect(r,-2,-2);
     if not (efLeftBorder in nonFocusBorders) then dec(r.Left,2);
     r.Right := r.Left+tempeditrect.Right+1;
   end;

   { If imager not in background, then need to explicitly clear background }
   if (Control.Parent.ControlAtPos(  Point(Control.Left, Control.Top), True)=nil) then
   begin
      DC := GetDC(Control.Handle);
      brush:= 0;
      try
        brush:= CreateSolidBrush(ColorToRGB(TEdit(Control.parent).color));
        SelectObject(DC, brush);
        if not InvalidateBorders then
        begin
          InflateRect(tempEditRect, 1, 1);
          Windows.FillRect(DC, tempEditRect, brush);
        end
        else begin
          r:= Control.ClientRect;
          Windows.FillRect(DC, r, brush);
        end;
      finally
        ReleaseDC(Control.Handle, DC);
        DeleteObject(brush);
      end
   end
   else
      InvalidateRect(Control.parent.handle, @r, TransparentClearsBackground);

end;

procedure TwwEditFrame.RefreshControl;
var r:TRect;
begin
//   AdjustEditRect;
   r:= Control.BoundsRect;
   if Enabled and Transparent then
      InvalidateRect(Control.parent.handle, @r, false)
   else Control.Invalidate;
end;

{procedure TwwEditFrame.AdjustEditRect;
var TempEditRect:TRect;
begin
   if not Control.HandleAllocated then exit;
   SendMessage(Control.handle,em_getrect, 0, Integer(@TempEditRect));
   GetEditRectForFrame(TempEditRect);
   SendMessage(Control.Handle, EM_SETRECTNP, 0, LongInt(@TempEditRect));
end;
}
procedure TwwEditFrame.GetEditRectForFrame(var Loc: TRect);
begin
     if (FocusStyle = efsFrameBox) then
     begin
        Loc.Top := 2;
        Loc.Left := 2;
     end
     else begin
        Loc.Top := 3;
        if efLeftBorder in FocusBorders then
        begin
           if FocusStyle in [efsFrameSunken, efsFrameBump] then
              Loc.Left := 3
           else Loc.Left:= 2;
        end
        else Loc.Left:=1;

        Loc.Right:= Loc.Right -2
     end
end;

procedure TwwEditFrame.AdjustHeight;
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
    if self.enabled then i:= i + AutoSizeHeightAdjust;;
  end else
  begin
    I := SysMetrics.tmHeight;
    if I > Metrics.tmHeight then I := Metrics.tmHeight;
    I := I div 4 + GetSystemMetrics(SM_CYBORDER) * 4;
  end;
  Control.Height := Metrics.tmHeight + I;
end;

Function GetBooleanProp(control: TControl; PropertyName: string): boolean;
var PropInfo: PPropInfo;
begin
   Result:= False;
   PropInfo:= Typinfo.GetPropInfo(Control.ClassInfo, PropertyName);
   if PropInfo<>Nil then
      result:= Boolean(GetOrdProp(Control, PropInfo));
end;

procedure SetBooleanProp(control: TControl; PropertyName: string; val: boolean);
var PropInfo: PPropInfo;
begin
   PropInfo:= Typinfo.GetPropInfo(Control.ClassInfo, PropertyName);
   if PropInfo<>Nil then
      SetOrdProp(control, PropInfo, ord(val));
end;

procedure TwwButtonEffects.SetTransparent(val: boolean);
begin
   if FTransparent<>val then
   begin
      FTransparent:= val;
      SetBooleanProp(Button, 'Transparent', FFlat or FTransparent);
      SetBooleanProp(Button, 'Flat', FFlat or FTransparent);
      Refresh;  //      FButton.Glyph.Handle:= LoadComboGlyph;
      Button.Invalidate;
   end;
end;

procedure TwwButtonEffects.SetFlat(val: boolean);
begin
   if FFlat<>val then
   begin
      FFlat:= val;
      SetBooleanProp(Button, 'Flat', FFlat or FTransparent);
      Refresh;  //      FButton.Glyph.Handle:= LoadComboGlyph;
      Button.Invalidate;
   end;
end;

constructor TwwButtonEffects.Create(Owner: TComponent; AButton: TControl);
begin
   inherited Create;
   button:= TControl(AButton);
   control:= TControl(Owner);
end;

Procedure TwwButtonEffects.Refresh;
begin
end;

class Function TwwEditFrame.Get(Control: TControl): TwwEditFrame;
var PropInfo: PPropInfo;
begin
   Result:= Nil;
   PropInfo:= Typinfo.GetPropInfo(Control.ClassInfo,'Frame');
   if PropInfo<>Nil then
      result:= TwwEditFrame(GetOrdProp(Control, PropInfo));
end;

class Function TwwButtonEffects.Get(Control: TControl): TwwButtonEffects;
var PropInfo: PPropInfo;
begin
   Result:= Nil;
   PropInfo:= Typinfo.GetPropInfo(Control.ClassInfo,'ButtonEffects');
   if PropInfo<>Nil then
      result:= TwwButtonEffects(GetOrdProp(Control, PropInfo));
end;

Function TwwEditFrame.IsFrameEffective: boolean;
begin
   result:= enabled and (control<>nil) and not (control.parent is TCustomGrid);
end;

procedure TwwEditFrame.Assign(Source: TPersistent);
var s: TwwEditFrame;
begin
  if Source is TwwEditFrame then
  begin
     s:= TwwEditFrame(source);
     Enabled:= s.Enabled;
     if not Enabled then exit; {Optimization }

     Transparent:= s.Transparent;
     TransparentClearsBackground:= s.TransparentClearsBackground;
     AutoSizeHeightAdjust:= s.AutoSizeHeightAdjust;
     FocusBorders:= s.FocusBorders;
     NonFocusBorders:= s.NonFocusBorders;
     FocusStyle:= s.FocusStyle;
     NonFocusStyle:= s.NonFocusStyle;
     NonFocusTextOffsetX:= s.NonFocusTextOffsetX;
     NonFocusTextOffsetY:= s.NonFocusTextOffsetY;
     NonFocusTransparentFontColor:= s.NonFocusTransparentFontColor;
  end
  else inherited Assign(Source);
end;


end.
