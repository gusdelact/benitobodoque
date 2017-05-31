{
//
// Components : TwwTrackIcon - Used by richedit ruler
//
// Copyright (c) 1998 by Woll2Woll Software
//
}

unit wwTrackIcon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TwwTrackIcon = class(TGraphicControl)
  private
     TrackBmp: TBitmap;
     FOnEndDrag: TNotifyEvent;
     FBitmapName: string;
     FMinValue, FMaxValue: integer;
//     PaintFailed: boolean;
//     InPaint: boolean;
     procedure MouseLoop_Drag(X, Y: Integer);
     procedure SetBitmapName(val: string);

  protected
     procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
       X, Y: Integer); override;
     Procedure Paint; override;
  public
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;

  published
     property OnEndDrag: TNotifyEvent read FOnEndDrag write FOnEndDrag;
//     property OnChange: TNotifyEvent read FOnChange write FOnChange;
     property BitmapName: string read FBitmapName write SetBitmapName;
     property MinValue: integer read FMinValue write FMinValue;
     property MaxValue: integer read FMaxValue write FMaxValue;
  end;

procedure Register;

implementation

{$R wwruler.res}

type
  TwwShapeOrientation = (wwsoLeft,wwsoRight,wwsoUp,wwsoDown);
  TPoints = array[0..20] of TPoint;
  PPoints = ^TPoints;

constructor TwwTrackIcon.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  TrackBmp:= TBitmap.create;
end;

destructor TwwTrackIcon.Destroy;
begin
   TrackBmp.Free;
   TrackBmp:= nil;
   inherited Destroy;
end;

Procedure TwwTrackIcon.Paint;
var TempRect: TRect;
begin
   Canvas.Lock;
   TempRect:= Rect(0, 0, TrackBmp.Width, TrackBmp.Height);
   try
      Canvas.Brush.Style:= bsClear;
      Canvas.BrushCopy(TempRect, TrackBmp, TempRect,
          TrackBmp.Canvas.Pixels[0, Height-1]);
   finally
      Canvas.Unlock;
   end;
end;

procedure TwwTrackIcon.MouseLoop_Drag(X, Y: Integer);
var ACursor: TPoint;
    Msg: TMsg;
    FirstTime: boolean;
    CaptureHandle: HWND;
   function RoundPosition(val: integer): integer;
   begin
       result:= (val*360) div 360;
   end;

   procedure SetValue(val: integer);
   begin
       if (MinValue<>0) and (val<MinValue) then
          val:= MinValue
       else if (MaxValue<>0) and (val>MaxValue) then
          val:= MaxValue;
       Left:= val;
   end;


begin
   CaptureHandle:= GetParentForm(self).Handle;
   SetCapture(CaptureHandle);
   FirstTime:= True;

   try
      while GetCapture = CaptureHandle do
      begin
         GetCursorPos(ACursor);
         ACursor := ScreenToClient(ACursor);

         case Integer(GetMessage(Msg, 0, 0, 0)) of
           -1: Break;
           0: begin PostQuitMessage (Msg.WParam); Break; end;
         end;

         case Msg.Message of
            WM_MOUSEMOVE: begin
               if FirstTime then begin
                  if (X=ACursor.X) and (y=ACursor.Y) then continue;
                  SetValue(Left + ACursor.X-X);
                  FirstTime:= False;
               end
               else SetValue(Left + ACursor.X-X);
            end;

            WM_LBUTTONUP: begin
               if not FirstTime then
               begin
                  if Assigned(FOnEndDrag) then OnEndDrag(self);
               end;
               if GetCapture = CaptureHandle then ReleaseCapture;
               TranslateMessage(Msg);
               DispatchMessage(Msg);
            end

            else begin
               TranslateMessage(Msg);
               DispatchMessage(Msg);
            end
         end { Case }
      end;
   finally
       if GetCapture = CaptureHandle then ReleaseCapture;
   end;
end;

procedure TwwTrackIcon.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if ssLeft in Shift then MouseLoop_Drag(X,Y);
end;

procedure TwwTrackIcon.SetBitmapName(val: string);
begin
   if FBitmapName<>val then
   begin
      FBitmapName:= val;
      if val<>'' then begin
         TrackBmp.Handle := LoadBitmap(HInstance, PChar(BitmapName));
         Width:= TrackBmp.Width;
         Height:= TrackBmp.Height;
      end;
      invalidate;
   end
end;

procedure Register;
begin
  RegisterComponents('IP Controls', [TwwTrackIcon]);
end;

end.
