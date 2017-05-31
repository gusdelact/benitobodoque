{******************************************************************************}
{*                                                                            *}
{*                     DFL Software's Light Lib Images                        *}
{*                          Toolbar Source Unit                               *}
{*                  (C) Copyright DFL Software, Inc. 1996                     *}
{*                                                                            *}
{******************************************************************************}
unit ITlbrSrc;


{******************************************************************************}
interface
{******************************************************************************}

uses SysUtils, WinTypes, WinProcs, Messages, Classes, Controls, Dialogs, Forms,
     Graphics, ExtCtrls, Buttons, StdCtrls, DsgnIntf, Llo, iToolBar;


type
    { Light Lib Images Buttons }
    TLLToolBtns = ( Scan, Open, Save, cCopy, Paste, Print, FitBest, FitToWidth,
                    FitToHeight, FitInWindow, FitRelease, Rotate90,
                    Rotate270, Rotate180, FlipHorz, FlipVert, Crop, ZoomIn, ZoomOut,
                    Palette, ImageOp, Info, About );

    TLLButtonBar = Set Of TLLToolBtns;   { LLI }
    TButtonInfo  = LongInt;

const
    BtnHintText : Array [TLLToolBtns] of String =
      ( 'Scanner', 'Open',
        'Save', 'Copy', 'Paste', 'Print', 'Fit Best', 'Fit to Width', 'Fit to Height',
        'Fit in Window', 'Fit Release', 'Rotate 90',
        'Rotate 270', 'Rotate 180', 'Flip Horizontal', 'Flip Vertical',
        'Crop', 'Zoom In', 'Zoom Out',
        'Palette', 'Image Operations', 'Image Information', 'About'
      );
    { Property Editor for ToolBarButtons }

{******************************************************************************}

type
    TToolBarProperty = class (TOrdinalProperty)
    private
        ButtonFlags  : TButtonInfo;
    public
        procedure Edit; override;
        function  GetValue : String; override;
        procedure SetValue( const Value: String ); override;
        function  GetAttributes: TPropertyAttributes; override;
    end;

{******************************************************************************}

    { TLLButton: Subclasses TSpeedButton that gives us an Index used in the
      BtnClick method to determine which button was pushed }

    TLLButton = class( TSpeedButton )
    private
        FIndex : TLLToolBtns;
    public
    published
        Property Index: TLLToolBtns read FIndex write FIndex;
    end;

{******************************************************************************}

    TLLToolbar = class(TCustomPanel)
    private
        { Private declarations }
        ToolBar          : Array[TLLToolBtns] Of TLLButton;
        HighestButton,
        LowestButton     : TLLButton;
        FillBtn          : TSpeedButton;
        FVisibleButtons  : TLLButtonBar;
        FocusButton      : TLLToolBtns;
        CurrentButton    : TLLToolBtns;
        ButtonLength     : Integer;
        ScrollOffset     : Integer;
        ButtonFlags      : TButtonInfo;
        procedure    InitButtons;
        procedure    Click( Sender:TObject );
    protected
        { Protected declarations }
        procedure    Paint; override;
    public
        { Public declarations }
        constructor  Create( AOwner: TComponent ); override;
        destructor   destroy; override;
        procedure    BtnClick( Index:TLLToolBtns ); virtual;
        function     Scroll( Step :Integer ) : Boolean;
        function     GetButtonLength : integer;
        function     GetScrollOffset : Integer;
        procedure    SetFiller( bVisible : Boolean );
        procedure    SetVisible( Value: TButtonInfo );
        function     GetVisible : TButtonInfo;
        procedure    SetButtonHints( Hints : TStringList );
        procedure    SetShowHints( Value : Boolean );
    published
        { Published declarations }
    end;


{******************************************************************************}
implementation
{******************************************************************************}

const
    { Hold the Resource ID for each Button's Glyph }

    BtnResourceNames : Array [TLLToolBtns] Of PChar =
        (
          'IB_SCAN', 'IB_OPEN', 'IB_SAVE', 'IB_COPY', 'IB_PASTE', 'IB_PRINT',
          'IB_FITBEST', 'IB_FITTOWIDTH', 'IB_FITTOHEIGHT', 'IB_FITINWINDOW',
          'IB_FITRELEASE', 'IB_ROT90', 'IB_ROT270', 'IB_ROT180',
          'IB_FLIP_HORZ', 'IB_FLIP_VERT', 'IB_CROP', 'IB_ZOOMIN',
          'IB_ZOOMOUT','IB_PALETTE', 'IB_IMAGEOP', 'IB_INFO', 'IB_ABOUT'
        );

    FL_SCAN         = $00000001;
    FL_OPEN         = $00000002;
    FL_SAVE         = $00000004;
    FL_COPY         = $00000008;
    FL_PASTE        = $00000010;
    FL_PRINT        = $00000020;
    FL_FITBEST      = $00000040;
    FL_FITTOWIDTH   = $00000080;
    FL_FITTOHEIGHT  = $00000100;
    FL_FITINWINDOW  = $00000200;
    FL_FITRELEASE   = $00000400;
    FL_ROT90        = $00000800;
    FL_ROT270       = $00001000;
    FL_ROT180       = $00002000;
    FL_FLIP_HORZ    = $00004000;
    FL_FLIP_VERT    = $00008000;
    FL_CROP         = $00010000;
    FL_ZOOMIN       = $00020000;
    FL_ZOOMOUT      = $00040000;
    FL_PALETTE      = $00080000;
    FL_IMAGEOP      = $00100000;
    FL_INFO         = $00200000;
    FL_ABOUT        = $00400000;

{******************************************************************************}
{*            TToolbarProperty-Editor class implementation                    *}
{******************************************************************************}

procedure TToolBarProperty.Edit;
Var
    oDialog : TDlgImageToolbar;
begin

    oDialog := TDlgImageToolbar.Create( Application );
    try
        oDialog.cbScan.Checked        := LongBool( ButtonFlags and FL_SCAN );
        oDialog.cbOpen.Checked        := LongBool( ButtonFlags and FL_OPEN );
        oDialog.cbSave.Checked        := LongBool( ButtonFlags and FL_SAVE );
        oDialog.cbCopy.Checked        := LongBool( ButtonFlags and FL_COPY );
        oDialog.cbPaste.Checked       := LongBool( ButtonFlags and FL_PASTE );
        oDialog.cbPrint.Checked       := LongBool( ButtonFlags and FL_PRINT );
        oDialog.cbFitBest.Checked     := LongBool( ButtonFlags and FL_FITBEST );
        oDialog.cbFitToWidth.Checked  := LongBool( ButtonFlags and FL_FITTOWIDTH );
        oDialog.cbFitToHeight.Checked := LongBool( ButtonFlags and FL_FITTOHEIGHT );
        oDialog.cbFitInWindow.Checked := LongBool( ButtonFlags and FL_FITINWINDOW );
        oDialog.cbFitRelease.Checked  := LongBool( ButtonFlags and FL_FITRELEASE );
        oDialog.cbRot90.Checked       := LongBool( ButtonFlags and FL_ROT90 );
        oDialog.cbRot270.Checked      := LongBool( ButtonFlags and FL_ROT270 );
        oDialog.cbRot180.Checked      := LongBool( ButtonFlags and FL_ROT180 );
        oDialog.cbFlipHorz.Checked    := LongBool( ButtonFlags and FL_FLIP_HORZ );
        oDialog.cbFlipVert.Checked    := LongBool( ButtonFlags and FL_FLIP_VERT );
        oDialog.cbCrop.Checked        := LongBool( ButtonFlags and FL_CROP );
        oDialog.cbZoomIn.Checked      := LongBool( ButtonFlags and FL_ZOOMIN );
        oDialog.cbZoomOut.Checked     := LongBool( ButtonFlags and FL_ZOOMOUT );
        oDialog.cbPalette.Checked     := LongBool( ButtonFlags and FL_PALETTE );
        oDialog.cbImageOp.Checked     := LongBool( ButtonFlags and FL_IMAGEOP );
        oDialog.cbInfo.Checked        := LongBool( ButtonFlags and FL_INFO );
        oDialog.cbAbout.Checked       := LongBool( ButtonFlags and FL_ABOUT );

        if ( oDialog.ShowModal = 1 ) then
        begin
            ButtonFlags := $00000000;
            if ( oDialog.cbScan.Checked ) then
                ButtonFlags := ButtonFlags or FL_SCAN;
            if ( oDialog.cbOpen.Checked ) then
                ButtonFlags := ButtonFlags or FL_OPEN;
            if ( oDialog.cbSave.Checked ) then
                ButtonFlags := ButtonFlags or FL_SAVE;
            if ( oDialog.cbCopy.Checked ) then
                ButtonFlags := ButtonFlags or FL_COPY;
            if ( oDialog.cbPaste.Checked ) then
                ButtonFlags := ButtonFlags or FL_PASTE;
            if ( oDialog.cbPrint.Checked ) then
                ButtonFlags := ButtonFlags or FL_PRINT;
            if ( oDialog.cbFitBest.Checked ) then
                ButtonFlags := ButtonFlags or FL_FITBEST;
            if ( oDialog.cbFitToWidth.Checked ) then
                ButtonFlags := ButtonFlags or FL_FITTOWIDTH;
            if ( oDialog.cbFitToHeight.Checked ) then
                ButtonFlags := ButtonFlags or FL_FITTOHEIGHT;
            if ( oDialog.cbFitInWindow.Checked ) then
                ButtonFlags := ButtonFlags or FL_FITINWINDOW;
            if ( oDialog.cbFitRelease.Checked ) then
                ButtonFlags := ButtonFlags or FL_FITRELEASE;
            if ( oDialog.cbRot90.Checked ) then
                ButtonFlags := ButtonFlags or FL_ROT90;
            if ( oDialog.cbRot270.Checked ) then
                ButtonFlags := ButtonFlags or FL_ROT270;
            if ( oDialog.cbRot180.Checked ) then
                ButtonFlags := ButtonFlags or FL_ROT180;
            if ( oDialog.cbFlipHorz.Checked ) then
                ButtonFlags := ButtonFlags or FL_FLIP_HORZ;
            if ( oDialog.cbFlipVert.Checked ) then
                ButtonFlags := ButtonFlags or FL_FLIP_VERT;
            if ( oDialog.cbCrop.Checked ) then
                ButtonFlags := ButtonFlags or FL_CROP;
            if ( oDialog.cbZoomIn.Checked ) then
                ButtonFlags := ButtonFlags or FL_ZOOMIN;
            if ( oDialog.cbZoomOut.Checked ) then
                ButtonFlags := ButtonFlags or FL_ZOOMOUT;
            if ( oDialog.cbPalette.Checked ) then
                ButtonFlags := ButtonFlags or FL_PALETTE;
            if ( oDialog.cbImageOp.Checked ) then
                ButtonFlags := ButtonFlags or FL_IMAGEOP;
            if ( oDialog.cbInfo.Checked ) then
                ButtonFlags := ButtonFlags or FL_INFO;
            if ( oDialog.cbAbout.Checked ) then
                ButtonFlags := ButtonFlags or FL_ABOUT;
        end;
    finally
        oDialog.free;
    end;
    SetValue( '' );
end;
{******************************************************************************}

function TToolBarProperty.GetValue : String;
Var
    sTmp : String;
begin

    ButtonFlags := GetOrdValue;

    sTmp := '[';
    if ( LongBool( ButtonFlags and FL_SCAN ) )        then sTmp := sTmp + 'Scan,';
    if ( LongBool( ButtonFlags and FL_OPEN ) )        then sTmp := sTmp + 'Open,';
    if ( LongBool( ButtonFlags and FL_SAVE ) )        then sTmp := sTmp + 'Save,';
    if ( LongBool( ButtonFlags and FL_COPY ) )        then sTmp := sTmp + 'Copy,';
    if ( LongBool( ButtonFlags and FL_PASTE ) )       then sTmp := sTmp + 'Paste,';
    if ( LongBool( ButtonFlags and FL_PRINT ) )       then sTmp := sTmp + 'Print,';
    if ( LongBool( ButtonFlags and FL_FITBEST ) )     then sTmp := sTmp + 'FitBest,';
    if ( LongBool( ButtonFlags and FL_FITTOWIDTH ) )  then sTmp := sTmp + 'FitToWidth,';
    if ( LongBool( ButtonFlags and FL_FITTOHEIGHT ) ) then sTmp := sTmp + 'FitToHeight,';
    if ( LongBool( ButtonFlags and FL_FITINWINDOW ) ) then sTmp := sTmp + 'FitInWindow,';
    if ( LongBool( ButtonFlags and FL_FITRELEASE ) )  then sTmp := sTmp + 'FitRelease,';
    if ( LongBool( ButtonFlags and FL_ROT90 ) )       then sTmp := sTmp + 'Rot90,';
    if ( LongBool( ButtonFlags and FL_ROT270 ) )      then sTmp := sTmp + 'Rot270,';
    if ( LongBool( ButtonFlags and FL_ROT180 ) )      then sTmp := sTmp + 'Rot180,';
    if ( LongBool( ButtonFlags and FL_FLIP_HORZ ) )   then sTmp := sTmp + 'FlipHorz,';
    if ( LongBool( ButtonFlags and FL_FLIP_VERT ) )   then sTmp := sTmp + 'FlipVert,';
    if ( LongBool( ButtonFlags and FL_CROP ) )        then sTmp := sTmp + 'Crop,';
    if ( LongBool( ButtonFlags and FL_ZOOMIN ) )      then sTmp := sTmp + 'ZoomIn,';
    if ( LongBool( ButtonFlags and FL_ZOOMOUT ) )     then sTmp := sTmp + 'ZoomOut,';
    if ( LongBool( ButtonFlags and FL_PALETTE ) )     then sTmp := sTmp + 'Palette,';
    if ( LongBool( ButtonFlags and FL_IMAGEOP ) )     then sTmp := sTmp + 'ImageOp,';
    if ( LongBool( ButtonFlags and FL_INFO ) )        then sTmp := sTmp + 'Info,';
    if ( LongBool( ButtonFlags and FL_ABOUT ) )       then sTmp := sTmp + 'About,';


    if ( Copy( sTmp, Length(sTmp), 1 ) = ',' ) then
        Delete( sTmp, Length(sTmp), 1 );

    sTmp := sTmp + ']';

    Result := sTmp;
end;

{******************************************************************************}

procedure TToolBarProperty.SetValue( const Value: String );
begin
    SetOrdValue( ButtonFlags );
end;

{******************************************************************************}

function TToolBarProperty.GetAttributes: TPropertyAttributes;
begin
    Result := [paDialog, paReadOnly];
end;


{******************************************************************************}
{*                    TLLToolBar class implementation                         *}
{******************************************************************************}

constructor TLLToolbar.Create( AOwner: TComponent);
begin
    Inherited Create( AOwner );
    ControlStyle := ControlStyle - [csAcceptsControls, csSetCaption ] +
                                   [csFramed, csOpaque];

    FVisibleButtons := [ Scan, Open, Save, cCopy, Paste, Print, FitBest, FitToWidth,
                         FitToHeight, FitInWindow, FitRelease, Rotate90,
                         Rotate270, Rotate180, FlipHorz, FlipVert, Crop, ZoomIn, ZoomOut,
                         Palette, ImageOp, Info, About ];

    ScrollOffset := 0;
    Initbuttons;

    Ctl3d       := False;
    BevelOuter  := bvNone;
    Bevelinner  := bvNone;

    Height      := 29;
    FocusButton := Open;
    ShowHint    := True;
end;

{******************************************************************************}

destructor TLLToolbar.Destroy;
begin
    Inherited Destroy;
end;

{******************************************************************************}

procedure TLLToolbar.Paint;
begin

    Inherited Paint;
    if ( GetButtonLength + ScrollOffset < Width ) or
       ( Width >= GetButtonLength ) then
        Scroll( -ScrollOffset );

    SetFiller( True );

end;

{******************************************************************************}

function TLLToolbar.GetButtonLength : Integer;
Var
    I       : TLLToolBtns;
    x       : Integer;
begin
    x := 0;
    for I:= low(ToolBar) to high(ToolBar) do
        if ( ToolBar[I].Visible ) then
            Inc(x);

    ButtonLength := ( x * 28 );
    Result := ButtonLength;
end;

{******************************************************************************}

procedure TLLToolbar.Initbuttons;
var
    I       : TLLToolBtns;
    Btn     : TLLButton;
    x       : Integer;
    ResName : Array[0..40] Of Char;
begin
    x := 0;

    ButtonFlags := $FFFFFFFF;

    for I:= low(ToolBar) to high(ToolBar) do
    begin
        Btn              := TLLButton.Create( Self );
        Btn.Index        := I;
        Btn.Visible      := True;
        Btn.Enabled      := True;
        Btn.Glyph.Handle := LoadBitmap( HInstance,
                                        StrFmt(ResName, '%s',
                                        [BtnResourceNames[I]]));
        Btn.NumGlyphs    := 1;
        Btn.Hint         := BtnHintText[ I ];
        Btn.Top          := Top;
        Btn.Left         := ( X * 28 );
        Btn.Height       := 28;
        Btn.Width        := 28;
        Btn.OnClick      := Click;
        Btn.Parent       := Self;
        ToolBar[I]       := Btn;

        ButtonFlags      := ButtonFlags or ( TButtonInfo( 1 shl x ) * TButtonInfo(Btn.Visible) );

        Inc(x);
    end;

    LowestButton  := ToolBar[low(ToolBar)];
    HighestButton := ToolBar[high(ToolBar)];

    ButtonLength  := ( X * 28 );

    FillBtn := TSpeedButton.Create( Self );
    with FillBtn do begin
        Visible      := True;
        Enabled      := False;
        Glyph.Handle := 0; { no glyph }
        NumGlyphs    := 1; { has to be at least 1 }
        Hint         := 'No function';
        Top          := 0;
        Left         := ButtonLength;
        Height       := 28;
        Width        := Self.Width - ButtonLength ;
        Parent       := Self;
    end;

end;

{******************************************************************************}

procedure TLLToolbar.SetButtonHints( Hints : TStringList );
Var
    I    : TLLToolBtns;
    x    : Integer;
begin
    x := 0;
    for I:= low(ToolBar) to high(ToolBar) do
    begin
        if ( x >= Hints.Count ) then exit;
        ToolBar[I].Hint := Hints.Strings[x];
        inc( x );
    end;
    if ( x = Hints.Count-1 ) then
        FillBtn.Hint := Hints.Strings[x];
end;

{******************************************************************************}

procedure TLLToolbar.SetShowHints( Value : Boolean );
Var
    I : TLLToolBtns;
begin
    for I:= low(ToolBar) to high(ToolBar) do
    begin
        ToolBar[I].ShowHint := Value;
    end;
    FillBtn.ShowHint := Value;
end;

{******************************************************************************}

function TLLToolbar.GetVisible : TButtonInfo;
begin
    Result := ButtonFlags;
end;

{******************************************************************************}

procedure TLLToolbar.SetVisible( Value : TButtonInfo );
Var
    I    : TLLToolBtns;
    x    : Integer;
    y    : LongInt;
begin
    x := 0;
    y := 0;

    ButtonFlags := Value;

    for I:= low(ToolBar) to high(ToolBar) do
    begin
        ToolBar[I].Visible := LongBool( ButtonFlags and TButtonInfo( 1 shl y ) );
        if ( ToolBar[I].Visible ) then
        begin
            ToolBar[I].Left := ( x * 28 );
            Inc(x);
        end
        else
            ToolBar[I].Left := -30;
        Inc(y);
    end;

    ButtonLength := ( x * 28 );

    { figure out the first visible button }
    for I:= low(ToolBar) to high(ToolBar) do
    begin
        if ( ToolBar[I].Visible ) then
           HighestButton := ToolBar[I];
    end;

    { figure out the last visible button }
    for I:=  high(ToolBar) downto low(ToolBar) do
    begin
        if ( ToolBar[I].Visible ) then
           LowestButton := ToolBar[I];
    end;
    SetFiller( True );

end;

{******************************************************************************}

function TLLToolbar.Scroll( Step :Integer ):Boolean;
Var
    I : TLLToolBtns;
    x : Integer;
begin
    x := 0;

    if (  Step >= 0 ) then    { positive step }
    begin
        { do not scroll beyond the first button }
        if ( LowestButton.Left + Step > 0 ) then
        begin
            Step := -LowestButton.Left;
        end;
        ScrollOffset := ScrollOffset + Step;
        for I:= low(ToolBar) to high(ToolBar) do
        begin
            if ( ToolBar[I].Visible ) then
                ToolBar[I].Left := ToolBar[I].Left + Step;
        end;
    end
    else                    { negative step }
    begin
        { do not scroll beyond the last button }
        if ( HighestButton.Left + Step < (Width-28) ) then
        begin
            Step := (Width - 28) - HighestButton.Left ;
        end;
        ScrollOffset := ScrollOffset + Step;
        for I:= low(ToolBar) to high(ToolBar) do
        begin
            if ( ToolBar[I].Visible ) then
                ToolBar[I].Left := ToolBar[I].Left + Step;
        end;
    end;
    Result := ( Step <> 0 );  { signal if scrolled }

end;

{******************************************************************************}

function TLLToolbar.GetScrollOffset : Integer;
begin
    Result := ScrollOffset;
end;

{******************************************************************************}

procedure TLLToolbar.SetFiller( bVisible : Boolean );
begin

    if ( bVisible ) then
    begin
        FillBtn.Left  := GetButtonLength;
        FillBtn.Width := Self.Width - GetButtonLength ;
        FillBtn.Visible := bVisible;
    end
    else
    begin
        FillBtn.Visible := bVisible;
    end;

end;

{******************************************************************************}

procedure TLLToolbar.Click( Sender:TObject );
begin
    BtnClick ( TLLButton( Sender ).Index );
end;
{******************************************************************************}

procedure TLLToolbar.BtnClick( Index:TLLToolBtns );
begin
end;

{******************************************************************************}



{******************************************************************************}
end. { of unit itlbrsrc }
{******************************************************************************}
