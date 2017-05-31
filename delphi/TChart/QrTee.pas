{**********************************************}
{  TChart 4.0 --> QuickReports 2.0 & 3.0       }
{  Copyright (c) 1996-98 by David Berneda      }
{  All Rights Reserved                         }
{**********************************************}
{$I teedefs.inc}
unit QrTee;

interface

uses
  WinTypes, WinProcs, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, TeeProcs, TeEngine, Chart, QuickRpt, TeCanvas,
  {$IFNDEF NOUSE_BDE}
  DBChart,
  {$ENDIF} StdCtrls, Menus, ExtCtrls;

type
  TTeeQuickMethod=(qtmBitmap,qtmMetafile);

  TQRChart=class;

  TQRDBChart=class({$IFNDEF NOUSE_BDE}TCustomDBChart{$ELSE}TCustomChart{$ENDIF})
  protected
  public
    constructor Create(AOwner : TComponent); override;
    Function GetRectangle:TRect; override;
    procedure Invalidate; override;
    procedure Paint; override;
  published
    {$IFNDEF NOUSE_BDE}
    { TCustomDBChart properties }
    property ShowGlassCursor;
    { TCustomDBChart events }
    property OnProcessRecord;
    {$ENDIF}

    { TCustomChart Properties }
    property BackImage;
    property BackImageInside;
    property BackImageMode;
    property BackWall;
    property BottomWall;
    property Foot;
    property Gradient;
    property LeftWall;
    property MarginBottom;
    property MarginLeft;
    property MarginRight;
    property MarginTop;
    property Title;

    { TCustomChart Events }
    property OnGetLegendPos;
    property OnGetLegendRect;

    { TCustomAxisPanel properties }
    property AxisVisible;
    property BackColor;
    property BottomAxis;
    property Chart3DPercent;
    property ClipPoints;
    property DepthAxis;
    property Frame;
    property LeftAxis;
    property Legend;
    property MaxPointsPerPage;
    property Page;
    property RightAxis;
    property ScaleLastPage;
    property SeriesList;
    property TopAxis;
    property View3D;
    property View3DOptions;
    property View3DWalls;

    { TCustomAxisPanel events }
    property OnAfterDraw;
    property OnBeforeDrawAxes;
    property OnBeforeDrawSeries;
    property OnGetAxisLabel;
    property OnGetLegendText;
    property OnGetNextAxisLabel;
    property OnPageChange;

    { TPanel properties }
    property BevelInner;
    property BevelWidth;
    property BevelOuter default bvNone;
    property BorderWidth;
    property BorderStyle;
    property Color default clWhite;
    property DragCursor;
    property DragMode;
    property ParentColor;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;

    { TPanel events }
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    {$IFDEF D3}
    property OnStartDrag;
    {$ENDIF}
  end;

  TPrintChartEvent = procedure( Sender: TQRChart; 
				Var PaperRect,ChartRect:TRect ) of object;

  TQRChart = class(TQRPrintable)
  private
    { Private declarations }
    FOnPrint        : TPrintChartEvent;
    FTeePrintMethod : TTeeQuickMethod;
    
    Function GetChart:TQRDBChart;
    Procedure SetPrintMethod(Value:TTeeQuickMethod);
    {$IFDEF D1}
    Function Previewing:Boolean;
    {$ENDIF}
  protected
    { Protected declarations }
    procedure ReadState(Reader: TReader); override;
  public
    { Public declarations }
    Constructor Create(AOwner : TComponent); override;
    procedure Print(OfsX, OfsY : integer); override;
    procedure Paint; override;
  published
    { Published declarations }
    property Chart : TQRDBChart read GetChart;
    property TeePrintMethod:TTeeQuickMethod read FTeePrintMethod
                                            write SetPrintMethod default qtmMetafile;
    { Published QR events }
    property OnPrint:TPrintChartEvent read FOnPrint write FOnPrint;

  end;

implementation

Uses DsgnIntf,TeeConst {$IFDEF D1},QRPrntr{$ENDIF} ;

Const TeeMsg_DefaultQRChart='QRDBChart'; { <-- dont translate }

{ TQRDBChart }
Constructor TQRDBChart.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  Color:=clWhite;
  BevelOuter:=bvNone;
  BufferedDisplay:=False;
  SetBounds(-1,-1,1,1);
  Hide;
end;

Function TQRDBChart.GetRectangle:TRect;
Var tmpZoomFactor : Double;
begin
  if Parent<>nil then
  With TQRChart(Parent) do
  begin
    if (ParentReport<>nil) then tmpZoomFactor:=100.0/ParentReport.Zoom
                           else tmpZoomFactor:=1;
    result:=Rect(0,0, Round(ClientWidth*tmpZoomFactor),
                      Round(ClientHeight*tmpZoomFactor) );
  end;
end;

procedure TQRDBChart.Paint;
var Meta   : TMetaFile;
    Bitmap : TBitmap;
begin
  if Parent<>nil then
  With TQRChart(Parent) do
  Case FTeePrintMethod of
  qtmMetafile: begin
                 Meta:=TeeCreateMetafile(True,GetRectangle);
                 try
                   Canvas.StretchDraw(GetClientRect,Meta);
                 finally
                   Meta.Free;
                 end;
               end;
  qtmBitmap:   begin
                 Bitmap:=TeeCreateBitmap(clWhite,GetRectangle);
                 try
                   Canvas.StretchDraw(GetClientRect,Bitmap);
                 finally
                   Bitmap.Free;
                 end;
               end;
  end;
end;

procedure TQRDBChart.Invalidate;
begin
  if Parent<>nil then Parent.Invalidate;
end;

{ TQRChart }
Constructor TQRChart.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FTeePrintMethod:=qtmMetafile;
  Width :=350;
  Height:=200;
  if (csDesigning in ComponentState) and
     (not (csLoading in Owner.ComponentState)) then
  With TQRDBChart.Create(AOwner) do
  begin
    Parent:=TWinControl(Self);
    Name:=TeeGetUniqueName(AOwner,TeeMsg_DefaultQRChart);
    Title.Text.Clear;
    Title.Text.Add(Self.ClassName);
  end;
end;

procedure TQRChart.ReadState(Reader: TReader);
Var tmpChart:TQRDBChart;
begin
  tmpChart:=Chart;
  if (tmpChart<>nil) and
     (not (csLoading in tmpChart.ComponentState))
     {$IFNDEF D1}
     and (not (csAncestor in tmpChart.ComponentState))
     {$ENDIF}
        then
          tmpChart.Free;
  inherited ReadState(Reader);
end;

Procedure TQRChart.SetPrintMethod(Value:TTeeQuickMethod);
begin
  if Value<>FTeePrintMethod then
  begin
    FTeePrintMethod:=Value;
    Repaint;
  end;
end;

{$IFDEF D1}
Function TQRChart.Previewing:Boolean;
begin
  result:=(QRPrinter<>nil) and (QRPrinter.Destination=qrdMetafile);
end;
{$ENDIF}

procedure TQRChart.Print(OfsX, OfsY : Integer);
Var tmpMeta   : TMetafile;
    QuickRect : TRect;
    tmpRect   : TRect;
    tmpChart  : TQRDBChart;
    tmpBitmap : TBitmap;
begin
  tmpChart:=Chart;
  if tmpChart<>nil then
  begin
    {$IFNDEF NOUSE_BDE}
    tmpChart.RefreshData;
    {$ENDIF}
    With ParentReport.QRPrinter do
    begin
      QuickRect:=Rect( Xpos(OfsX+Size.Left),
                       Ypos(OfsY+Size.Top),
                       Xpos(OfsX+Size.Left+Size.Width),
                       Ypos(OfsY+Size.Top+Size.Height));

      tmpRect:=tmpChart.GetRectangle;

      if Assigned( FOnPrint ) then FOnPrint( Self, QuickRect, tmpRect );

      Case FTeePrintMethod of
      qtmMetafile: begin
                     tmpMeta:=tmpChart.TeeCreateMetafile(True, tmpRect);
                     try
                       {$IFDEF D1}
                       if Previewing then
                          tmpChart.DrawToMetaCanvas(Canvas,QuickRect)
                       else
                          Canvas.StretchDraw(QuickRect,tmpMeta);
                       {$ELSE}
                       Canvas.StretchDraw(QuickRect,tmpMeta);
                       {$ENDIF}
                     finally
                       tmpMeta.Free;
                     end;
                   end;
        qtmBitmap: begin
                     tmpBitmap:=tmpChart.TeeCreateBitmap(clWhite, tmpRect);
                     try
                       Canvas.StretchDraw(QuickRect,tmpBitmap);
                     finally
                       tmpBitmap.Free;
                     end;
                   end;
      end;
    end;
  end;
  inherited Print(OfsX,OfsY);
end;

procedure TQRChart.Paint;
begin
  if Chart<>nil then Chart.Paint;
  inherited Paint;
end;

Function TQRChart.GetChart:TQRDBChart;
begin
  if ControlCount>0 then result:=TQRDBChart(Controls[0])
                    else result:=nil;
end;

initialization
  RegisterClass( TQRDBChart );
end.
