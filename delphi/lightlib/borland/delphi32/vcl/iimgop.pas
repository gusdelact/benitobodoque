unit Iimgop;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, TabNotBk, StdCtrls, Buttons, lli, ExtCtrls, Spin,
  Grids, llo {$ifdef Win32}, ComCtrls {$endif};

type
    TRotationPoints = Array[1..3] of TPoint;

type
  TDlgImageOperations = class(TForm)
    TabbedNotebook1: TTabbedNotebook;
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    HelpBtn: TBitBtn;
    ScrollBox1: TScrollBox;
    ImageWindow1: TImageWindow;
    btnPreview: TBitBtn;
    GroupBoxUser: TGroupBox;
    ComboFilters: TComboBox;
    ApplyToText: TLabel;
    GroupBoxFit: TGroupBox;
    ComboFit: TComboBox;
    GroupBoxRotation: TGroupBox;
    cbClipCorner: TCheckBox;
    speAngle: TSpinEdit;
    LabelAngle: TLabel;
    LabelDegrees: TLabel;
    cbRed: TCheckBox;
    cbGreen: TCheckBox;
    cbBlue: TCheckBox;
    btnDefineMatrix: TBitBtn;
    LabelBrightnessText: TLabel;
    sbBrightness: TScrollBar;
    LabelBrightness: TLabel;
    LabelContrastText: TLabel;
    sbContrast: TScrollBar;
    LabelContrast: TLabel;
    ComboTransform: TComboBox;
    GroupColors: TGroupBox;
    GrayScale: TCheckBox;
    Dithering: TCheckBox;
    ComboColors: TComboBox;
    speColors: TSpinEdit;
    LabelColors: TLabel;
    GroupBox1: TGroupBox;
    PromptDisWidth: TLabel;
    PromptDisHeight: TLabel;
    PromptDisColors: TLabel;
    PromptDisMemory: TLabel;
    PromptDisBits: TLabel;
    PromptDisDensity: TLabel;
    TextDisBits: TLabel;
    TextDisMemory: TLabel;
    TextDisWidth: TLabel;
    TextDisHeight: TLabel;
    TextDisColors: TLabel;
    TextDisDensity: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    speWidth: TSpinEdit;
    speElevation: TSpinEdit;
    speAzimuth: TSpinEdit;
    LabelAzimuth: TLabel;
    LabelElevation: TLabel;
    LabelWidth: TLabel;
    cbShared: TCheckBox;
    btnBackColor: TBitBtn;
    BackColor: TEdit;
    procedure btnPreviewClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure TabbedNotebook1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure ComboFiltersChange(Sender: TObject);
    procedure sbBrightnessChange(Sender: TObject);
    procedure sbContrastChange(Sender: TObject);
    procedure ImageWindow1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageWindow1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageWindow1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ComboTransformChange(Sender: TObject);
    procedure ComboColorsChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBackColorClick(Sender: TObject);
  private
    { Private declarations }
    OriginalStamp : Longint;

    liColors,
    liDithering,
    liScale      : Longint;
    liFilter     : Longint;
    liFilterFactor1 : Longint;
    liFilterFactor2 : Longint;
    liFilterFactor3 : Longint;
    liFit        : Longint;
    liOldRotAngle: Longint;
    { filter }
    liFilterRGB  : Longint;
    { rotation }
    PenFirstMove : Boolean;
    PenDown      : Boolean;
    PointCount   : Integer;
    RotPoints    : TRotationPoints;
    FImageInWindow  : TImageInWindow;
    function GetActivePage : String;
    procedure SetActivePage( Value : String );
  public
    { Public declarations }
    procedure Init( AImageInWindow : TImageInWindow );
    procedure InitColorsPage;
    procedure InitEffectsPage;
    procedure InitViewPage;
    procedure InitTransformPage;
    { EffectPage routines }
    procedure ShowBrightnessControls;
    procedure ShowContrastControls;
    procedure ShowEmbossControls;
    procedure ShowStdFilterControls;
    procedure ShowUserFilterControls;
    procedure HideEffectControls;

    procedure ShowArbitraryControls;
    procedure ShowRotFlipControls;
    procedure ShowColorControls;
    procedure ShowBitControls;
    function GetRotAngle( Points : TRotationPoints ) : Integer;
    property Page : String read GetActivePage write SetActivePage;
  end;

var
  DlgImageOperations: TDlgImageOperations;
  OldHelpFile  : String;

implementation

{uses LLO;}

{$R *.DFM}

{******************************************************************************}

function TDlgImageOperations.GetActivePage : String;
begin
    Result := TabbedNoteBook1.ActivePage;
end;

{******************************************************************************}

procedure TDlgImageOperations.SetActivePage( Value : String );
begin
    TabbedNoteBook1.ActivePage := Value;
end;
{******************************************************************************}

procedure TDlgImageOperations.Init( AImageInWindow : TImageInWindow );
var
    iHeight        : Integer;
    iWidth         : Integer;
    ImageRatio     : real;
    FrameRatio     : real;

    fScaleFactorX  : Real;
    fScaleFactorY  : Real;

    tiDim          : TImageDimension;
    DestWidth,
    DestHeight     : Longint;
begin
    FImageInWindow := AImageInWindow;

    RotPoints[1].X := -1;
    RotPoints[1].Y := -1;
    RotPoints[2].X := -1;
    RotPoints[2].Y := -1;
    RotPoints[3].X := -1;
    RotPoints[3].Y := -1;

    tiDim   := LLGetCanvasArea( ImageWindow1 );
    OriginalStamp  := AImageInWindow.InternalImage;
    if ( OriginalStamp <> 0 ) then
    begin
        iWidth  := oAccess( OriginalStamp, LLI_IMAGE_WIDTH, LLI_VOID_PARAM );
        iHeight := oAccess( OriginalStamp, LLI_IMAGE_HEIGHT, LLI_VOID_PARAM );
        ImageRatio := iWidth / iHeight;
    end
    else
    begin
        iWidth  := 0;
        iHeight := 0;
        ImageRatio := 0;
    end;

    FrameRatio := tiDim.Width / tiDim.Height;

    if ( ImageRatio > FrameRatio ) then
    begin
        { make the stamp fit to width }
        fScaleFactorX := ( tiDim.Width / iWidth );
        fScaleFactorY := fScaleFactorX;
    end
    else
    begin
        { make the stamp fit to height }
        fScaleFactorY := ( tiDim.Height / iHeight);
        fScaleFactorX := fScaleFactorY;
    end;
    DestWidth  := Round( iWidth * fScaleFactorX );
    DestHeight := Round( iHeight * fScaleFactorX );


    { Init Preview Image }
    OriginalStamp := 0;
    AImageInWindow.MakeStamp( DestWidth,
                              DestHeight,
                              OriginalStamp );
    ImageWindow1.ImageInWindow.LoadFromStamp( OriginalStamp );

    { init information page }
    TextDisWidth.Caption     := IntToStr( AImageInWindow.DisWidth );
    TextDisHeight.Caption    := IntToStr( AImageInWindow.DisHeight );
    TextDisColors.Caption    := FloatToStrF(AImageInWindow.Colors, ffNumber, 15, 0 );
    TextDisDensity.Caption   := IntToStr( AImageInWindow.Density );
    TextDisBits.Caption      := IntToStr( AImageInWindow.Bits );
    TextDisMemory.Caption    := IntToStr( Round( AImageInWindow.DisWidth*
                                                     AImageInWindow.DisHeight*
                                                     AImageInWindow.Bits/8 ) );

    InitColorsPage;
    InitEffectsPage;
    InitViewPage;
    InitTransformPage;
end;

{******************************************************************************}

procedure TDlgImageOperations.InitColorsPage;
begin
    { Init of Color Operations }
    ShowBitControls;

    ComboColors.Items.Clear;
    ComboColors.Items.Add( 'None' );
    ComboColors.Items.Add( 'Colors' );
    ComboColors.Items.Add( '1 Bit Image' );
    ComboColors.Items.Add( '4 Bit Image' );
    ComboColors.Items.Add( '8 Bit Image' );
    ComboColors.Items.Add( '24 Bit Image' );

    case ImageWindow1.ImageInWindow.Bits of
        LLI_MEMORY_BW:
            begin
                ComboColors.ItemIndex := 2;
                speColors.Value := 2;
            end;
        LLI_MEMORY_16:
            begin
                ComboColors.ItemIndex := 3;
                speColors.Value := 16;
            end;
        LLI_MEMORY_256:
            begin
                ComboColors.ItemIndex := 4;
                speColors.Value := 256;
            end;
        LLI_MEMORY_16M:
            begin
                ComboColors.ItemIndex := 5;
                speColors.Value := 256;
            end;
        else
            begin
                ComboColors.ItemIndex := 0;
                speColors.Value := 0;
            end;
    end; { case }
    Dithering.Checked := True;
    GrayScale.Checked := False;
end;

{******************************************************************************}

procedure TDlgImageOperations.InitEffectsPage;
begin
    { Init of Effect Operations ( filters ) }
    if ( ImageWindow1.ImageInWindow.Bits = 24 ) then
    begin
        ComboFilters.Items.Clear;
        ComboFilters.Items.Add( 'None' );
        ComboFilters.Items.Add( 'Brightness' );
        ComboFilters.Items.Add( 'Contrast' );
        ComboFilters.Items.Add( 'Invert' );
        ComboFilters.Items.Add( 'Smooth' );
        ComboFilters.Items.Add( 'Smooth More' );
        ComboFilters.Items.Add( 'Blur' );
        ComboFilters.Items.Add( 'Sharpen' );
        ComboFilters.Items.Add( 'Detail' );
{        ComboFilters.Items.Add( 'Emboss' ); }
        ComboFilters.Items.Add( 'Edge Enhanced' );
        ComboFilters.Items.Add( 'Edge More Enhanced' );
        ComboFilters.Items.Add( 'Find Edge' );
        ComboFilters.Items.Add( 'Contour' );
{        ComboFilters.Items.Add( 'User Defined' );}
    end
    else
    begin
        ComboFilters.Items.Clear;
        ComboFilters.Items.Add( 'None' );
        ComboFilters.Items.Add( 'Brightness' );
        ComboFilters.Items.Add( 'Contrast' );
        ComboFilters.Items.Add( 'Invert' );
{        ComboFilters.Items.Add( 'Emboss' );}
    end;

    ComboFilters.ItemIndex := 0;
    sbBrightness.Position := 0;
    sbContrast.Position := 0;

    LabelBrightness.Caption := IntToStr( sbBrightness.Position );
    LabelContrast.Caption := IntToStr( sbContrast.Position );
    cbRed.Checked   := True;
    cbGreen.Checked := True;
    cbBlue.Checked  := True;
    HideEffectControls;

end;

{******************************************************************************}

procedure TDlgImageOperations.InitViewPage;
begin
    ComboFit.Items.Clear;
    ComboFit.Items.Add( 'None' );
    ComboFit.Items.Add( 'Fit Best' );
    ComboFit.Items.Add( 'Fit To Width' );
    ComboFit.Items.Add( 'Fit To Height' );
    ComboFit.Items.Add( 'Fit In Window' );
    ComboFit.ItemIndex := 0;
    cbShared.Checked   := FImageInWindow.lPaletteShared;
end;

{******************************************************************************}

procedure TDlgImageOperations.InitTransformPage;
begin
    PointCount := 1;
    speAngle.Value := 0;
    ComboTransform.Items.Clear;
    ComboTransform.Items.Add( 'None' );
    ComboTransform.Items.Add( 'Rotate Arbitrary' );
    ComboTransform.Items.Add( 'Rotate Left' );
    ComboTransform.Items.Add( 'Rotate Right' );
    ComboTransform.Items.Add( 'Rotate Invert' );
    ComboTransform.Items.Add( 'Flip Horizontal' );
    ComboTransform.Items.Add( 'Flip Vertical' );

    liOldRotAngle := 0;
    ComboTransform.ItemIndex := 0; { none }
    ShowRotFlipControls;
    ImageWindow1.BackGroundColor := TImageWindow(FImageInWindow.Owner).BackGroundColor;
    BackColor.Color := ImageWindow1.BackGroundColor;
end;

{******************************************************************************}

procedure TDlgImageOperations.btnPreviewClick(Sender: TObject);
Var
    FilterText : String;
begin
    if ( TabbedNotebook1.ActivePage = 'Colors' ) then
    begin
        ImageWindow1.ImageInWindow.LoadFromStamp( OriginalStamp );

        if ( ComboColors.Items[ComboColors.ItemIndex] = 'Colors' ) then
            ImageWindow1.ImageInWindow.ColorOperations( speColors.Value,
                                                        Dithering.Checked,
                                                        GrayScale.Checked )
        else if ( ComboColors.Items[ComboColors.ItemIndex] = '1 Bit Image' ) then
            ImageWindow1.ImageInWindow.ColorOperations( -1,
                                                        Dithering.Checked,
                                                        GrayScale.Checked )
        else if ( ComboColors.Items[ComboColors.ItemIndex] = '4 Bit Image' ) then
            ImageWindow1.ImageInWindow.ColorOperations( -4,
                                                        Dithering.Checked,
                                                        GrayScale.Checked )
        else if ( ComboColors.Items[ComboColors.ItemIndex] = '8 Bit Image' ) then
            ImageWindow1.ImageInWindow.ColorOperations( -8,
                                                        Dithering.Checked,
                                                        GrayScale.Checked )
        else if ( ComboColors.Items[ComboColors.ItemIndex] = '24 Bit Image' ) then
            ImageWindow1.ImageInWindow.ColorOperations( -24,
                                                        Dithering.Checked,
                                                        GrayScale.Checked );

        ImageWindow1.ImageInWindow.Display( True );
    end
    else if ( TabbedNotebook1.ActivePage = 'Effects' ) then
    begin

        ImageWindow1.ImageInWindow.LoadFromStamp( OriginalStamp );

        if ( ComboFilters.ItemIndex > -1 ) then
        begin
            FilterText := ComboFilters.Items[ComboFilters.ItemIndex];

            if ( FilterText = 'Brightness' ) then
            begin
                liFilter := LLI_FILTER_BRIGHTNESS;
                liFilterFactor1 := sbBrightness.Position;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                ImageWindow1.ImageInWindow.Filter( liFilter, liFilterFactor1,
                                               liFilterFactor2,
                                               liFilterFactor3,
                                               cbRed.Checked,
                                               cbGreen.Checked,
                                               cbBlue.Checked );
                 ImageWindow1.ImageInWindow.Display( True );
            end
            else if ( FilterText = 'Contrast' ) then
            begin
                liFilter := LLI_FILTER_CONTRAST;
                liFilterFactor1 := sbContrast.Position;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                ImageWindow1.ImageInWindow.Filter( liFilter, liFilterFactor1,
                                               liFilterFactor2,
                                               liFilterFactor3,
                                               cbRed.Checked,
                                               cbGreen.Checked,
                                               cbBlue.Checked );
                 ImageWindow1.ImageInWindow.Display( True );
            end
            else if ( FilterText = 'Invert' ) then
            begin
                liFilter := LLI_FILTER_INVERT;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                ImageWindow1.ImageInWindow.Filter( liFilter, liFilterFactor1,
                                               liFilterFactor2,
                                               liFilterFactor3,
                                               cbRed.Checked,
                                               cbGreen.Checked,
                                               cbBlue.Checked );
                 ImageWindow1.ImageInWindow.Display( True );
            end
            else if ( FilterText = 'Smooth' ) then
            begin
                liFilter := LLI_FILTER_SMOOTH;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                ImageWindow1.ImageInWindow.Filter( liFilter, liFilterFactor1,
                                               liFilterFactor2,
                                               liFilterFactor3,
                                               cbRed.Checked,
                                               cbGreen.Checked,
                                               cbBlue.Checked );
                 ImageWindow1.ImageInWindow.Display( True );
            end
            else if ( FilterText = 'Smooth More' ) then
            begin
                liFilter := LLI_FILTER_SMOOTH_MORE;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                ImageWindow1.ImageInWindow.Filter( liFilter, liFilterFactor1,
                                               liFilterFactor2,
                                               liFilterFactor3,
                                               cbRed.Checked,
                                               cbGreen.Checked,
                                               cbBlue.Checked );
                 ImageWindow1.ImageInWindow.Display( True );
            end
            else if ( FilterText = 'Blur' ) then
            begin
                liFilter := LLI_FILTER_BLUR;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                ImageWindow1.ImageInWindow.Filter( liFilter, liFilterFactor1,
                                               liFilterFactor2,
                                               liFilterFactor3,
                                               cbRed.Checked,
                                               cbGreen.Checked,
                                               cbBlue.Checked );
                ImageWindow1.ImageInWindow.Display( True );
            end
            else if ( FilterText = 'Sharpen' ) then
            begin
                liFilter := LLI_FILTER_SHARPEN;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                ImageWindow1.ImageInWindow.Filter( liFilter, liFilterFactor1,
                                               liFilterFactor2,
                                               liFilterFactor3,
                                               cbRed.Checked,
                                               cbGreen.Checked,
                                               cbBlue.Checked );
                ImageWindow1.ImageInWindow.Display( True );
            end
            else if ( FilterText = 'Detail' ) then
            begin
                liFilter := LLI_FILTER_DETAIL;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                ImageWindow1.ImageInWindow.Filter( liFilter, liFilterFactor1,
                                               liFilterFactor2,
                                               liFilterFactor3,
                                               cbRed.Checked,
                                               cbGreen.Checked,
                                               cbBlue.Checked );
                 ImageWindow1.ImageInWindow.Display( True );
            end
{            else if ( FilterText = 'Emboss' ) then
            begin
                liFilter := LLI_FILTER_EMBOSS;
                liFilterFactor1 := speAzimuth.Value;
                liFilterFactor2 := speElevation.Value;
                liFilterFactor3 := speWidth.Value;
            end}
            else if ( FilterText = 'Edge Enhanced' ) then
            begin
                liFilter := LLI_FILTER_EDGE_ENHANCE;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                ImageWindow1.ImageInWindow.Filter( liFilter, liFilterFactor1,
                                               liFilterFactor2,
                                               liFilterFactor3,
                                               cbRed.Checked,
                                               cbGreen.Checked,
                                               cbBlue.Checked );
                ImageWindow1.ImageInWindow.Display( True );
            end
            else if ( FilterText = 'Edge More Enhanced' ) then
            begin
                liFilter := LLI_FILTER_EDGE_ENHANCE_MORE;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                ImageWindow1.ImageInWindow.Filter( liFilter, liFilterFactor1,
                                               liFilterFactor2,
                                               liFilterFactor3,
                                               cbRed.Checked,
                                               cbGreen.Checked,
                                               cbBlue.Checked );
                ImageWindow1.ImageInWindow.Display( True );
            end
            else if ( FilterText = 'Find Edge' ) then
            begin
                liFilter := LLI_FILTER_FIND_EDGE;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                ImageWindow1.ImageInWindow.Filter( liFilter, liFilterFactor1,
                                               liFilterFactor2,
                                               liFilterFactor3,
                                               cbRed.Checked,
                                               cbGreen.Checked,
                                               cbBlue.Checked );
                ImageWindow1.ImageInWindow.Display( True );
            end
            else if ( FilterText = 'Contour' ) then
            begin
                liFilter := LLI_FILTER_CONTOUR;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                ImageWindow1.ImageInWindow.Filter( liFilter, liFilterFactor1,
                                               liFilterFactor2,
                                               liFilterFactor3,
                                               cbRed.Checked,
                                               cbGreen.Checked,
                                               cbBlue.Checked );
                ImageWindow1.ImageInWindow.Display( True );
            end
            else if ( FilterText = 'User Defined' ) then
            begin
                liFilter := LLI_FILTER_USER;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                ImageWindow1.ImageInWindow.Filter( liFilter, liFilterFactor1,
                                               liFilterFactor2,
                                               liFilterFactor3,
                                               cbRed.Checked,
                                               cbGreen.Checked,
                                               cbBlue.Checked );
                 ImageWindow1.ImageInWindow.Display( True );
            end;

        end;
    end
    else if ( TabbedNotebook1.ActivePage = 'View' ) then
    begin

        ImageWindow1.ImageInWindow.lPaletteShared := cbShared.Checked;

        if ( ComboFit.ItemIndex > -1 ) then
        begin
            if ( ComboFit.Items[ComboFit.ItemIndex] = 'Fit Best' ) then
                ImageWindow1.FitStyle := fsBest
            else if ( ComboFit.Items[ComboFit.ItemIndex] = 'Fit To Width' ) then
                ImageWindow1.FitStyle := fsWidth
            else if ( ComboFit.Items[ComboFit.ItemIndex] = 'Fit To Height' ) then
                ImageWindow1.FitStyle := fsHeight
            else if ( ComboFit.Items[ComboFit.ItemIndex] = 'Fit In Window' ) then
                ImageWindow1.FitStyle := fsWindow
            else if ( ComboFit.Items[ComboFit.ItemIndex] = 'None' ) then
                ImageWindow1.FitStyle := fsNone;

{            if ( ComboFit.Items[ComboFit.ItemIndex] = 'Fit Best' ) then
                liFit := LLI_FIT_BEST
            else if ( ComboFit.Items[ComboFit.ItemIndex] = 'Fit To Width' ) then
                liFit := LLI_FIT_WIDTH
            else if ( ComboFit.Items[ComboFit.ItemIndex] = 'Fit To Height' ) then
                liFit := LLI_FIT_HEIGHT
            else if ( ComboFit.Items[ComboFit.ItemIndex] = 'Fit In Window' ) then
                liFit := LLI_FIT_WINDOW
            else if ( ComboFit.Items[ComboFit.ItemIndex] = 'None' ) then
            begin
                liFit := LLI_FIT_NONE;
                ImageWindow1.ImageInWindow.Zoom( -1, -1 );
            end;

            ImageWindow1.ImageInWindow.Fit( liFit );
            ImageWindow1.ImageInWindow.Display( True );
 }
        end;

    end
    else if ( TabbedNotebook1.ActivePage = 'Transform' ) then
    begin

        ImageWindow1.ImageInWindow.LoadFromStamp( OriginalStamp );
        ImageWindow1.BackGroundColor := BackColor.Color;

        if ( ComboTransform.Items[ComboTransform.ItemIndex] = 'Rotate Arbitrary' ) then
        begin
            liOldRotAngle := speAngle.Value + liOldRotAngle;
            while liOldRotAngle > 360 do dec( liOldRotAngle, 360 );
            speAngle.Value := 0;

            ImageWindow1.ImageInWindow.Rotate( liOldRotAngle, cbClipCorner.Checked );
            ImageWindow1.ImageInWindow.Display( True );
        end
        else if ( ComboTransform.Items[ComboTransform.ItemIndex] = 'Rotate Left' ) then
        begin
            ImageWindow1.RotateLeft;
        end
        else if ( ComboTransform.Items[ComboTransform.ItemIndex] = 'Rotate Right' ) then
        begin
            ImageWindow1.RotateRight;
        end
        else if ( ComboTransform.Items[ComboTransform.ItemIndex] = 'Rotate Invert' ) then
        begin
            ImageWindow1.RotateInvert;
        end
        else if ( ComboTransform.Items[ComboTransform.ItemIndex] = 'Flip Horizontal' ) then
        begin
            ImageWindow1.FlipHorizontal;
        end
        else if ( ComboTransform.Items[ComboTransform.ItemIndex] = 'Flip Vertical' ) then
        begin
            ImageWindow1.FlipVertical;
        end;
    end;
end;

{******************************************************************************}

procedure TDlgImageOperations.OKBtnClick(Sender: TObject);
Var
    FilterText : String;
begin
    if ( TabbedNotebook1.ActivePage = 'Colors' ) then
    begin

        if ( ComboColors.Items[ComboColors.ItemIndex] = 'Colors' ) then
            FImageInWindow.ColorOperations( speColors.Value,
                                            Dithering.Checked,
                                            GrayScale.Checked )
        else if ( ComboColors.Items[ComboColors.ItemIndex] = '1 Bit Image' ) then
            FImageInWindow.ColorOperations( -1,
                                            Dithering.Checked,
                                            GrayScale.Checked )
        else if ( ComboColors.Items[ComboColors.ItemIndex] = '4 Bit Image' ) then
            FImageInWindow.ColorOperations( -4,
                                            Dithering.Checked,
                                            GrayScale.Checked )
        else if ( ComboColors.Items[ComboColors.ItemIndex] = '8 Bit Image' ) then
            FImageInWindow.ColorOperations( -8,
                                            Dithering.Checked,
                                            GrayScale.Checked )
        else if ( ComboColors.Items[ComboColors.ItemIndex] = '24 Bit Image' ) then
            FImageInWindow.ColorOperations( -24,
                                            Dithering.Checked,
                                            GrayScale.Checked );

        FImageInWindow.Display( True );
    end
    else if ( TabbedNotebook1.ActivePage = 'Effects' ) then
    begin

        if ( ComboFilters.ItemIndex > -1 ) then
        begin
            FilterText := ComboFilters.Items[ComboFilters.ItemIndex];

            if ( FilterText = 'Brightness' ) then
            begin
                liFilter := LLI_FILTER_BRIGHTNESS;
                liFilterFactor1 := sbBrightness.Position;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                FImageInWindow.Filter( liFilter, liFilterFactor1,
                                       liFilterFactor2,
                                       liFilterFactor3,
                                       cbRed.Checked,
                                       cbGreen.Checked,
                                       cbBlue.Checked );
                FImageInWindow.Display( True );
            end
            else if ( FilterText = 'Contrast' ) then
            begin
                liFilter := LLI_FILTER_CONTRAST;
                liFilterFactor1 := sbContrast.Position;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                FImageInWindow.Filter( liFilter, liFilterFactor1,
                                       liFilterFactor2,
                                       liFilterFactor3,
                                       cbRed.Checked,
                                       cbGreen.Checked,
                                       cbBlue.Checked );
                FImageInWindow.Display( True );
            end
            else if ( FilterText = 'Invert' ) then
            begin
                liFilter := LLI_FILTER_INVERT;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                FImageInWindow.Filter( liFilter, liFilterFactor1,
                                               liFilterFactor2,
                                               liFilterFactor3,
                                               cbRed.Checked,
                                               cbGreen.Checked,
                                               cbBlue.Checked );
                FImageInWindow.Display( True );
            end
            else if ( FilterText = 'Smooth' ) then
            begin
                liFilter := LLI_FILTER_SMOOTH;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                FImageInWindow.Filter( liFilter, liFilterFactor1,
                                       liFilterFactor2,
                                       liFilterFactor3,
                                       cbRed.Checked,
                                       cbGreen.Checked,
                                       cbBlue.Checked );
                FImageInWindow.Display( True );
            end
            else if ( FilterText = 'Smooth More' ) then
            begin
                liFilter := LLI_FILTER_SMOOTH_MORE;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                FImageInWindow.Filter( liFilter, liFilterFactor1,
                                       liFilterFactor2,
                                       liFilterFactor3,
                                       cbRed.Checked,
                                       cbGreen.Checked,
                                       cbBlue.Checked );
                FImageInWindow.Display( True );
            end
            else if ( FilterText = 'Blur' ) then
            begin
                liFilter := LLI_FILTER_BLUR;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                FImageInWindow.Filter( liFilter, liFilterFactor1,
                                       liFilterFactor2,
                                       liFilterFactor3,
                                       cbRed.Checked,
                                       cbGreen.Checked,
                                       cbBlue.Checked );
                FImageInWindow.Display( True );
            end
            else if ( FilterText = 'Sharpen' ) then
            begin
                liFilter := LLI_FILTER_SHARPEN;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                FImageInWindow.Filter( liFilter, liFilterFactor1,
                                       liFilterFactor2,
                                       liFilterFactor3,
                                       cbRed.Checked,
                                       cbGreen.Checked,
                                       cbBlue.Checked );
                FImageInWindow.Display( True );
            end
            else if ( FilterText = 'Detail' ) then
            begin
                liFilter := LLI_FILTER_DETAIL;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                FImageInWindow.Filter( liFilter, liFilterFactor1,
                                       liFilterFactor2,
                                       liFilterFactor3,
                                       cbRed.Checked,
                                       cbGreen.Checked,
                                       cbBlue.Checked );
                FImageInWindow.Display( True );
            end
{            else if ( FilterText = 'Emboss' ) then
            begin
                liFilter := LLI_FILTER_EMBOSS;
                liFilterFactor1 := speAzimuth.Value;
                liFilterFactor2 := speElevation.Value;
                liFilterFactor3 := speWidth.Value;
                FImageInWindow.Filter( liFilter, liFilterFactor1,
                                       liFilterFactor2,
                                       liFilterFactor3,
                                       cbRed.Checked,
                                       cbGreen.Checked,
                                       cbBlue.Checked );
                FImageInWindow.Display( True );
            end}
            else if ( FilterText = 'Edge Enhanced' ) then
            begin
                liFilter := LLI_FILTER_EDGE_ENHANCE;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                FImageInWindow.Filter( liFilter, liFilterFactor1,
                                       liFilterFactor2,
                                       liFilterFactor3,
                                       cbRed.Checked,
                                       cbGreen.Checked,
                                       cbBlue.Checked );
                FImageInWindow.Display( True );
            end
            else if ( FilterText = 'Edge More Enhanced' ) then
            begin
                liFilter := LLI_FILTER_EDGE_ENHANCE_MORE;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                FImageInWindow.Filter( liFilter, liFilterFactor1,
                                       liFilterFactor2,
                                       liFilterFactor3,
                                       cbRed.Checked,
                                       cbGreen.Checked,
                                       cbBlue.Checked );
                FImageInWindow.Display( True );
            end
            else if ( FilterText = 'Find Edge' ) then
            begin
                liFilter := LLI_FILTER_FIND_EDGE;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                FImageInWindow.Filter( liFilter, liFilterFactor1,
                                       liFilterFactor2,
                                       liFilterFactor3,
                                       cbRed.Checked,
                                       cbGreen.Checked,
                                       cbBlue.Checked );
                FImageInWindow.Display( True );
            end
            else if ( FilterText = 'Contour' ) then
            begin
                liFilter := LLI_FILTER_CONTOUR;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                FImageInWindow.Filter( liFilter, liFilterFactor1,
                                       liFilterFactor2,
                                       liFilterFactor3,
                                       cbRed.Checked,
                                       cbGreen.Checked,
                                       cbBlue.Checked );
                FImageInWindow.Display( True );
            end
            else if ( FilterText = 'User Defined' ) then
            begin
                liFilter := LLI_FILTER_USER;
                liFilterFactor1 := 0;
                liFilterFactor2 := 0;
                liFilterFactor3 := 0;
                FImageInWindow.Filter( liFilter, liFilterFactor1,
                                       liFilterFactor2,
                                       liFilterFactor3,
                                       cbRed.Checked,
                                       cbGreen.Checked,
                                       cbBlue.Checked );
                FImageInWindow.Display( True );
            end;

        end;

    end
    else if ( TabbedNotebook1.ActivePage = 'View' ) then
    begin

        if ( ComboFit.ItemIndex > -1 ) then
        begin

            if ( ComboFit.Items[ComboFit.ItemIndex] = 'Fit Best' ) then
                TImageWindow(FImageInWindow.Owner).FitStyle := fsBest
            else if ( ComboFit.Items[ComboFit.ItemIndex] = 'Fit To Width' ) then
                TImageWindow(FImageInWindow.Owner).FitStyle := fsWidth
            else if ( ComboFit.Items[ComboFit.ItemIndex] = 'Fit To Height' ) then
                TImageWindow(FImageInWindow.Owner).FitStyle := fsHeight
            else if ( ComboFit.Items[ComboFit.ItemIndex] = 'Fit In Window' ) then
                TImageWindow(FImageInWindow.Owner).FitStyle := fsWindow
            else if ( ComboFit.Items[ComboFit.ItemIndex] = 'None' ) then
                TImageWindow(FImageInWindow.Owner).FitStyle := fsNone;

        end;

    end
    else if ( TabbedNotebook1.ActivePage = 'Transform' ) then
    begin

        FImageInWindow.lPaletteShared := cbShared.Checked;
        TImageWindow(FImageInWindow.Owner).BackGroundColor := BackColor.Color;

        if ( ComboTransform.Items[ComboTransform.ItemIndex] = 'Rotate Arbitrary' ) then
        begin
            liOldRotAngle := speAngle.Value + liOldRotAngle;
            while liOldRotAngle > 360 do dec( liOldRotAngle, 360 );

            FImageInWindow.Rotate( liOldRotAngle, cbClipCorner.Checked );
            FImageInWindow.Display( True );
        end
        else if ( ComboTransform.Items[ComboTransform.ItemIndex] = 'Rotate Left' ) then
        begin
            TImageWindow(FImageInWindow.Owner).RotateLeft;
        end
        else if ( ComboTransform.Items[ComboTransform.ItemIndex] = 'Rotate Right' ) then
        begin
            TImageWindow(FImageInWindow.Owner).RotateRight;
        end
        else if ( ComboTransform.Items[ComboTransform.ItemIndex] = 'Rotate Invert' ) then
        begin
            TImageWindow(FImageInWindow.Owner).RotateInvert;
        end
        else if ( ComboTransform.Items[ComboTransform.ItemIndex] = 'Flip Horizontal' ) then
        begin
            TImageWindow(FImageInWindow.Owner).FlipHorizontal;
        end
        else if ( ComboTransform.Items[ComboTransform.ItemIndex] = 'Flip Vertical' ) then
        begin
            TImageWindow(FImageInWindow.Owner).FlipVertical;
        end;


    end;
    ModalResult := mrOK;
end;

{******************************************************************************}

procedure TDlgImageOperations.CancelBtnClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

{******************************************************************************}

procedure TDlgImageOperations.TabbedNotebook1Change(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
    case NewTab of
        0: HelpBtn.HelpContext := 201004000; {information}
        1: HelpBtn.HelpContext := 201003000; {colors}
        2: HelpBtn.HelpContext := 201007000; {effects}
        3: HelpBtn.HelpContext := 201008000; {view}
        4: HelpBtn.HelpContext := 201009000; {transform}
    end;

    ImageWindow1.ImageInWindow.LoadFromStamp( OriginalStamp );
    if ( TabbedNotebook1.ActivePage = 'Information' ) then
    begin

    end
    else if ( TabbedNotebook1.ActivePage = 'Colors' ) then
    begin
        InitColorsPage;
    end
    else if ( TabbedNotebook1.ActivePage = 'Effects' ) then
    begin
        InitEffectsPage;
    end
    else if ( TabbedNotebook1.ActivePage = 'View' ) then
    begin
        InitViewPage;
    end
    else if ( TabbedNotebook1.ActivePage = 'Transform' ) then
    begin
        InitTransformPage;
    end;
    ImageWindow1.ImageInWindow.Display( True );
end;


{******************************************************************************}

procedure TDlgImageOperations.ShowBrightnessControls;
begin

    sbBrightness.Position := 0;
    sbContrast.Position := 0;
    btnDefineMatrix.Hide;
    LabelBrightnessText.Show;
    LabelContrastText.Hide;
    LabelBrightness.Show;
    LabelContrast.Hide;
    sbBrightness.Show;
    sbContrast.Hide;
    ApplyToText.Enabled := False;
    cbRed.Enabled       := True;
    cbGreen.Enabled     := True;
    cbBlue.Enabled      := True;
end;

{******************************************************************************}

procedure TDlgImageOperations.ShowContrastControls;
begin
    sbBrightness.Position := 0;
    sbContrast.Position := 0;
    btnDefineMatrix.Hide;
    LabelBrightnessText.Hide;
    LabelContrastText.Show;
    LabelBrightness.Hide;
    LabelContrast.Show;
    sbBrightness.Hide;
    sbContrast.Show;
    ApplyToText.Enabled := True;
    cbRed.Enabled       := True;
    cbGreen.Enabled     := True;
    cbBlue.Enabled      := True;
    ApplyToText.Show;
    cbRed.Show;
    cbGreen.Show;
    cbBlue.Show;

    LabelAzimuth.Hide;
    LabelElevation.Hide;
    LabelWidth.Hide;

    speAzimuth.Hide;
    speElevation.Hide;
    speWidth.Hide;
    speAzimuth.Value   := 30;
    speElevation.Value := 30;
    speWidth.Value       := 3;
end;

{******************************************************************************}

procedure TDlgImageOperations.ShowEmbossControls;
begin
    sbBrightness.Position := 0;
    sbContrast.Position := 0;
    btnDefineMatrix.Hide;
    LabelBrightnessText.Hide;
    LabelContrastText.Hide;
    LabelBrightness.Hide;
    LabelContrast.Hide;
    sbBrightness.Hide;
    sbContrast.Hide;
    ApplyToText.Enabled := True;
    cbRed.Enabled       := True;
    cbGreen.Enabled     := True;
    cbBlue.Enabled      := True;
    ApplyToText.Hide;
    cbRed.Hide;
    cbGreen.Hide;
    cbBlue.Hide;

    LabelAzimuth.Show;
    LabelElevation.Show;
    LabelWidth.Show;

    speAzimuth.Show;
    speElevation.Show;
    speWidth.Show;
    speAzimuth.Value   := 30;
    speElevation.Value := 30;
    speWidth.Value       := 3;
end;

{******************************************************************************}

procedure TDlgImageOperations.ShowStdFilterControls;
begin
    sbBrightness.Position := 0;
    sbContrast.Position := 0;
    btnDefineMatrix.Hide;
    LabelBrightnessText.Hide;
    LabelContrastText.Hide;
    LabelBrightness.Hide;
    LabelContrast.Hide;
    sbBrightness.Hide;
    sbContrast.Hide;
    ApplyToText.Enabled := True;
    cbRed.Enabled       := True;
    cbGreen.Enabled     := True;
    cbBlue.Enabled      := True;
    ApplyToText.Show;
    cbRed.Show;
    cbGreen.Show;
    cbBlue.Show;

    LabelAzimuth.Hide;
    LabelElevation.Hide;
    LabelWidth.Hide;
    speAzimuth.Hide;
    speElevation.Hide;
    speWidth.Hide;
    speAzimuth.Value   := 30;
    speElevation.Value := 30;
    speWidth.Value       := 3;
end;

{******************************************************************************}

procedure TDlgImageOperations.ShowUserFilterControls;
begin
    sbBrightness.Position := 0;
    sbContrast.Position := 0;
    btnDefineMatrix.Show;
    LabelBrightnessText.Hide;
    LabelContrastText.Hide;
    LabelBrightness.Hide;
    LabelContrast.Hide;
    sbBrightness.Hide;
    sbContrast.Hide;
    ApplyToText.Enabled := True;
    cbRed.Enabled       := True;
    cbGreen.Enabled     := True;
    cbBlue.Enabled      := True;
    ApplyToText.Show;
    cbRed.Show;
    cbGreen.Show;
    cbBlue.Show;

    LabelAzimuth.Hide;
    LabelElevation.Hide;
    LabelWidth.Hide;
    speAzimuth.Hide;
    speElevation.Hide;
    speWidth.Hide;
    speAzimuth.Value   := 30;
    speElevation.Value := 30;
    speWidth.Value       := 3;
end;

{******************************************************************************}

procedure TDlgImageOperations.HideEffectControls;
begin
    sbBrightness.Position := 0;
    sbContrast.Position := 0;
    btnDefineMatrix.Hide;
    LabelBrightnessText.Hide;
    LabelContrastText.Hide;
    LabelBrightness.Hide;
    LabelContrast.Hide;
    sbBrightness.Hide;
    sbContrast.Hide;
    ApplyToText.Enabled := False;
    cbRed.Enabled       := False;
    cbGreen.Enabled     := False;
    cbBlue.Enabled      := False;


    LabelAzimuth.Hide;
    LabelElevation.Hide;
    LabelWidth.Hide;
    speAzimuth.Hide;
    speElevation.Hide;
    speWidth.Hide;
    speAzimuth.Value   := 30;
    speElevation.Value := 30;
    speWidth.Value     := 3;
end;

{******************************************************************************}

procedure TDlgImageOperations.ShowArbitraryControls;
begin
    speAngle.Value := 0;
    cbClipCorner.Enabled   := True;
    LabelAngle.Enabled     := True;
    LabelDegrees.Enabled   := True;
    speAngle.Enabled       := True;
end;

{******************************************************************************}

procedure TDlgImageOperations.ShowRotFlipControls;
begin
    cbClipCorner.Enabled   := False;
    LabelAngle.Enabled     := False;
    LabelDegrees.Enabled   := False;
    speAngle.Enabled       := False;
end;

{******************************************************************************}

procedure TDlgImageOperations.ShowColorControls;
begin
    speColors.Show;
    LabelColors.Show;
end;

{******************************************************************************}

procedure TDlgImageOperations.ShowBitControls;
begin
    speColors.Hide;
    LabelColors.Hide;
end;

{******************************************************************************}

procedure TDlgImageOperations.ComboFiltersChange(Sender: TObject);
begin

    if ( ComboFilters.Items[ComboFilters.ItemIndex] = 'None' ) then
    begin
        HideEffectControls;
    end
    else if ( ComboFilters.Items[ComboFilters.ItemIndex] = 'Brightness' ) then
    begin
        ShowBrightnessControls;
    end
    else if ( ComboFilters.Items[ComboFilters.ItemIndex] = 'Contrast' ) then
    begin
        ShowContrastControls;
    end
    else if ( ComboFilters.Items[ComboFilters.ItemIndex] = 'Emboss' ) then
    begin
        ShowEmbossControls;
    end
    else if ( ComboFilters.Items[ComboFilters.ItemIndex] = 'User Defined' ) then
    begin
        ShowUserFilterControls;
    end
    else { all other filters }
    begin
        ShowStdFilterControls;
    end;

    ImageWindow1.ImageInWindow.LoadFromStamp( OriginalStamp );
    ImageWindow1.ImageInWindow.Display( False );

end;

{******************************************************************************}

procedure TDlgImageOperations.sbBrightnessChange(Sender: TObject);
begin
    LabelBrightness.Caption := IntToStr( sbBrightness.Position );
end;

{******************************************************************************}

procedure TDlgImageOperations.sbContrastChange(Sender: TObject);
begin
    LabelContrast.Caption := IntToStr( sbContrast.Position );
end;

{******************************************************************************}

procedure TDlgImageOperations.ImageWindow1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if ( TabbedNotebook1.ActivePage <> 'Transform' ) or
       ( ComboTransform.Items[ComboTransform.ItemIndex] <> 'Rotate Arbitrary' ) or
       ( Button = mbRight ) then exit;

    if not ( PenDown ) then
    begin
        PenDown := True;
        PenFirstMove := True;
    end;
    RotPoints[PointCount].X := X;
    RotPoints[PointCount].Y := Y;
end;

{******************************************************************************}

procedure TDlgImageOperations.ImageWindow1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
Var
    OldStyle : TBrushStyle;
    OldMode  : TPenMode;
    OldColor : TColor;
begin
    if not PenDown then exit;
    if ( TabbedNotebook1.ActivePage <> 'Transform' ) or
       (  ComboTransform.Items[ComboTransform.ItemIndex] <> 'Rotate Arbitrary' ) then exit;

    OldStyle := ImageWindow1.Canvas.Brush.Style;
    OldColor := ImageWindow1.Canvas.Brush.Color;
    OldMode  := ImageWindow1.Canvas.Pen.Mode;

    if ( PointCount > 1 ) then
    begin
        ImageWindow1.Canvas.Brush.Style := bsFDiagonal;
        ImageWindow1.Canvas.Brush.Color := clBlack;
        ImageWindow1.Canvas.Pen.Mode    := pmNotXor;
        if not ( PenFirstMove ) then
        begin
            { erase old line }
            ImageWindow1.Canvas.MoveTo( RotPoints[PointCount-1].X, RotPoints[PointCount-1].Y );
            ImageWindow1.Canvas.LineTo( RotPoints[PointCount].X, RotPoints[PointCount].Y );
            if ( PointCount = 3 ) and
               ( RotPoints[3].X = -1 ) and
               ( RotPoints[3].Y = -1 ) then
            begin
                ImageWindow1.Canvas.MoveTo( RotPoints[PointCount-1].X, RotPoints[PointCount-1].Y );
                ImageWindow1.Canvas.LineTo( RotPoints[PointCount].X, RotPoints[PointCount].Y );
            end;
            if ( PointCount = 3 ) and
               ( RotPoints[3].X <> -1 ) and
               ( RotPoints[3].Y <> -1 ) then
            begin
                ImageWindow1.Canvas.Pie( RotPoints[2].X-30, RotPoints[2].Y-30,
                                         RotPoints[2].X+30, RotPoints[2].Y+30,
                                         RotPoints[3].X, RotPoints[3].Y,
                                         RotPoints[1].X, RotPoints[1].Y );
            end;

        end;
        { draw new line }
        RotPoints[PointCount].X := X;
        RotPoints[PointCount].Y := Y;
        ImageWindow1.Canvas.MoveTo( RotPoints[PointCount-1].X, RotPoints[PointCount-1].Y );
        ImageWindow1.Canvas.LineTo( RotPoints[PointCount].X, RotPoints[PointCount].Y );
        PenFirstMove := False;
        if ( PointCount = 3 ) and
               ( RotPoints[3].X <> -1 ) and
               ( RotPoints[3].Y <> -1 ) then
        begin
            ImageWindow1.Canvas.Pie( RotPoints[2].X-30, RotPoints[2].Y-30,
                                     RotPoints[2].X+30, RotPoints[2].Y+30,
                                     RotPoints[3].X, RotPoints[3].Y,
                                     RotPoints[1].X, RotPoints[1].Y );
            speAngle.Value := GetRotAngle( RotPoints );
        end;
    end;

    ImageWindow1.Canvas.Brush.Style := OldStyle;
    ImageWindow1.Canvas.Brush.Color := OldColor;
    ImageWindow1.Canvas.Pen.Mode    := OldMode;
end;

{******************************************************************************}

procedure TDlgImageOperations.ImageWindow1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Var
    OldStyle : TBrushStyle;
    OldMode  : TPenMode;
    OldColor : TColor;
begin
    if ( TabbedNotebook1.ActivePage <> 'Transform' ) or
       ( ComboTransform.Items[ComboTransform.ItemIndex] <> 'Rotate Arbitrary' ) or
       ( Button = mbRight ) then exit;

    OldStyle := ImageWindow1.Canvas.Brush.Style;
    OldColor := ImageWindow1.Canvas.Brush.Color;
    OldMode  := ImageWindow1.Canvas.Pen.Mode;

    RotPoints[PointCount].X := X;
    RotPoints[PointCount].Y := Y;

    if ( PointCount < 3 ) then
    begin
        Inc( PointCount );
        if ( PointCount < 3 ) then
        begin
            RotPoints[PointCount].X := X;
            RotPoints[PointCount].Y := Y;
        end;
    end
    else
    begin
        PointCount := 1;
        PenDown := False;
        PenFirstMove := True;
        { erase both lines }
        ImageWindow1.Canvas.Brush.Style := bsFDiagonal;
        ImageWindow1.Canvas.Brush.Color := clBlack;
        ImageWindow1.Canvas.Pen.Mode    := pmNotXor;
        ImageWindow1.Canvas.MoveTo( RotPoints[1].X, RotPoints[1].Y );
        ImageWindow1.Canvas.LineTo( RotPoints[2].X, RotPoints[2].Y );
        ImageWindow1.Canvas.LineTo( RotPoints[3].X, RotPoints[3].Y );
        ImageWindow1.Canvas.Pie( RotPoints[2].X-30, RotPoints[2].Y-30,
                                 RotPoints[2].X+30, RotPoints[2].Y+30,
                                 RotPoints[3].X, RotPoints[3].Y,
                                 RotPoints[1].X, RotPoints[1].Y );

        RotPoints[3].X := -1;
        RotPoints[3].Y := -1;
    end;

    ImageWindow1.Canvas.Brush.Style := OldStyle;
    ImageWindow1.Canvas.Brush.Color := OldColor;
    ImageWindow1.Canvas.Pen.Mode    := OldMode;

end;

{******************************************************************************}

function TDlgImageOperations.GetRotAngle( Points : TRotationPoints ) : Integer;
Var
    Alpha1,
    Alpha2     : Real;
    dx1, dy1,
    dx2, dy2   : Integer;
begin
    Result := 0;

    dy1 := (Points[2].Y - Points[1].Y);
    dx1 := (Points[2].X - Points[1].X);

    dy2 := (Points[2].Y - Points[3].Y);
    dx2 := (Points[2].X - Points[3].X);

    { calculate Alpha1 }
    if ( dy1 <> 0 ) then
    begin
        Alpha1 := ( ArcTan( dx1 / dy1 ) * 180 / Pi );
        if ( dy1 > 0 ) then Alpha1 := 90 - Alpha1
        else Alpha1 := 270 - Alpha1;
    end
    else
    begin
        if ( dx1 >= 0 ) then Alpha1 := 0
        else Alpha1 := 180;
    end;

    { calculate Alpha2 }
    if ( dy2 <> 0 ) then
    begin
        Alpha2 := ( ArcTan( dx2 / dy2 ) * 180 / Pi );
        if ( dy2 > 0 ) then Alpha2 := 90 - Alpha2
        else Alpha2 := 270 - Alpha2;
    end
    else
    begin
        if ( dx2 >= 0 ) then Alpha2 := 0
        else Alpha2 := 180;
    end;

    if ( Alpha2 > Alpha1 ) then
        Result := Round( Alpha2 - Alpha1 )
    else
        Result := Round( Alpha2 + 360 - Alpha1 );

end;

{******************************************************************************}

procedure TDlgImageOperations.ComboTransformChange(Sender: TObject);
begin

    if ( ComboTransform.Items[ComboTransform.ItemIndex] = 'Rotate Arbitrary' ) then
    begin
        ShowArbitraryControls;
    end
    else if ( ComboTransform.Items[ComboTransform.ItemIndex] = 'Rotate Left' ) then
    begin
        speAngle.Value := 270;
        ShowRotFlipControls;
    end
    else if ( ComboTransform.Items[ComboTransform.ItemIndex] = 'Rotate Right' ) then
    begin
        speAngle.Value := 90;
        ShowRotFlipControls;
    end
    else if ( ComboTransform.Items[ComboTransform.ItemIndex] = 'Rotate Invert' ) then
    begin
        speAngle.Value := 180;
        ShowRotFlipControls;
    end;

    ImageWindow1.ImageInWindow.LoadFromStamp( OriginalStamp );
    ImageWindow1.ImageInWindow.Display( True );

end;

{******************************************************************************}

procedure TDlgImageOperations.ComboColorsChange(Sender: TObject);
begin
    if ( ComboColors.Items[ComboColors.ItemIndex] = 'Colors' ) then
    begin
        ShowColorControls;
    end
    else if ( ComboColors.Items[ComboColors.ItemIndex] = '24 Bit Image' ) then
    begin
        GrayScale.Enabled := False;
        Dithering.Enabled := False;
        ShowBitControls;
    end
    else
    begin
        GrayScale.Enabled := True;
        Dithering.Enabled := True;
        ShowBitControls;
    end;

end;

{******************************************************************************}


procedure TDlgImageOperations.FormCreate(Sender: TObject);
begin
    OldHelpFile := Application.HelpFile;
    Application.HelpFile := 'LLIUSER.HLP';
end;

procedure TDlgImageOperations.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Application.HelpFile := OldHelpFile;
end;

procedure TDlgImageOperations.btnBackColorClick(Sender: TObject);
Var
    ColorDialog : TColorDialog;
begin
    ColorDialog := TColorDialog.Create(Self);
    ColorDialog.Ctl3d := True;
    if ColorDialog.Execute then
    begin
        BackColor.Color := ColorDialog.Color;
    end;
end;

end.
