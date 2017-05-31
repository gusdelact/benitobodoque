{
//
// Components : TwwDBCustomGrid
//
// Copyright (c) 1995, 1996, 1997, 1998 by Woll2Woll Software
//
//
//  7/10/97 - Unselect all only if left button is clicked - Allows popupmenu to work.
//  7/10/97 - Support bitmaps with lookup fields - Only 1 field lookups supported
//  7/18/97 - Call hidecontrols in Layoutchanged so displayed embedded control
//            does not remain visible when column order is changed.
//  7/23/97 - Display bitmaps even in insert mode if lookup bitmap
//  7/31/97 - Don't use displaylabel property when useTFields=False
//  8/12/97 - Checkmark checkboxes optimized to use DisplayBitmap canvas
//  8/12/97 - Clear selLength when handling mask in keypress event.  This fixes
//            a bug which updated the text incorrectly.
//  10/15/97- Save and restore pen color later to allow column-moving line to be
//            drawn correctly
//  10/15/97- Allow resize even if titlebuttons is True
//  11/2/97 - Added to take care of wordwrap bug in memos displayed in grid
//  12/8/97 - Use ScrollWindowEx so background isn't cleared before painting
//  12/11/97 - Insert in front instead of switching columns
//  12/15/97 - Paint indicator button now so blank space isn't displayed too long
//  12/21/97 - Use goColMoving instead of dgColumnResize.  Developer can
//             then progmatically set goColMoving to False, while leaving the
//             column sizing as True.  This allows the developer a way of
//             removing the column dragging vertical bar.
//  1/28/98 -  Clear multi-select last record
//  2/4/98 -   Don't call OnCheckValue if character is not accepted
//  2/9/98 -   Only depress currently clicked column
//  3/30/98 -  Support ampersands in titles
//  3/30/98 -  Support imagelist to display bitmaps
//  3/31/98 -  If CenterJustify then allow DrawText to properly center text
//  3/31/98 -  Check to see if this is a single line edit control to
//               determine if we should or should not have word breaks
//  4/28/98 - IsMemoField uses ftMemo
//  5/13/98 - Fix memory leak for ShiftSelectBookmark
//  8/24/98 - Support Delphi 4 ActionLists
//  8/24/98 - Don't allow insert/edit if no records and dgallowinsert is false
//  9/2/98 -  Fixed 2 digit year bug in method UpdateData
//  9/2/98 -  FieldChanged event not fired in some cases.  This problem
//            is corrected by using UpdateData instead when using the
//            default inplaceeditor.  Also previous call to FieldChanged
//            is only called when a customedit is attached.
// 9/2/98 -   Fix bug where footer is not cleared when maximizing grid with
//            no records.
// 9/15/98 - Test for GoFoward when going back to previous row
// 9/21/98 - Make DoCalcTitleImage virtual for Delphi 4
// 9/22/98 - Don't call inherited if fail to set focus as this would
             lead to OnValidate getting called twice
// 9/24/98 - Prevent recursion in OnFieldChanged event by comparing text
// 10/2/98 - Allow editing if editing in CanEditModify
// 10/12/98 - Avoid converting 4 digit years to prevent 1900 from converting to 2000
// 10/26/98 - Truncate to character boundary in SetColumnAttributes.  Prevents problem
//            of column changing size when sizing another column.
// 10/28/98 - Subtract -4 from ColWidths in SetColumnAttributes.  Also undo change made on
//            10/26/98
// 11/11/98 - Invisible grid problem when width=0
// 11/24/98 - Check for nil curbookmark in DoCheckRowChanged
// 12/4/98  - Fix problem when descenders cutoff when dgRowLines=False.  Indirectly
//            fixes problem with lookupcombos with this problem.
// 12/7/98 - Correct OnColWidthChanged event passing the wrong column
// 12/9/98 - Just call RequestAlign in CMShowingChanged
// 1/8/99 - Fix descendor cutoff problem when wordwrap is true
// 1/31/99 - Support OnRowChanged for insert
// 2/17/99 - If append in grid, custom controls were not automatically moved to new row
// 2/17/99 - Added MouseWheel support by overriding virtual methods DoMouseWheelUp and DoMouseWheelDown (Delphi 4 Only)
// 2/21/99 - RSW, Don't highlight if fixed row multi-select cell
// 3/30/99 - Only include Insert if the dataset is not empty
// 4/21/99 - Free ShiftSelectBookmark first to fix memory leak.
// 4/28/99 - Fix problem where fixed column didn't fire event after drag operation
// 6/11/99 - Make sure adding never subtracting
}
unit Wwdbigrd;

{$i wwIfDef.pas}

interface

uses SysUtils, WinTypes, WinProcs, Messages, Classes, Controls, Forms,
     Graphics, Menus, StdCtrls, DB, DBTables, Grids, DBCtrls,
     wwTable, wwStr, wwdbedit, wwtypes, buttons, wwlocate, wwsystem, extctrls;

type
  TwwCustomDBGrid = class;

  TwwGridHintWindow=class(THintWindow)
  private
  protected
     procedure Paint; override;
  public
     Field: TField;
     WordWrap: boolean;
     Alignment: TAlignment;
  end;
  
  TwwTitleImageAttributes = record
     ImageIndex: integer;
     Alignment: TAlignment;
     Margin: integer;
  end;

  TTitleButtonClickEvent =
     procedure (Sender: TObject; AFieldName: string) of object;
  TCalcCellColorsEvent =
     procedure (Sender: TObject; Field: TField; State: TGridDrawState;
		Highlight: boolean; AFont: TFont; ABrush: TBrush) of object;
  TCalcTitleAttributesEvent =
     procedure (Sender: TObject; AFieldName: string; AFont: TFont; ABrush: TBrush;
		var ATitleAlignment: TAlignment) of object;

  TwwDrawTitleCellEvent =
      procedure (Sender: TObject; Canvas: TCanvas;
       Field: TField; Rect: TRect; var DefaultDrawing: boolean) of object;

  TwwCalcTitleImageEvent =
      procedure (Sender: TObject; Field: TField;
         var TitleImageAttributes: TwwTitleImageAttributes) of object;

  TDrawFooterCellEvent =
     procedure (Sender : TObject; Canvas: TCanvas; FooterCellRect: TRect;
                Field: TField;
                FooterText: string; var DefaultDrawing: boolean) of object;

  TColWidthChangedEvent =
     procedure (Sender: TObject; Column: integer) of object;

  TwwLeftColChangedEvent =
     procedure (Sender: TObject; NewLeftCol: integer) of object;

  TwwCreateGridHintWindowEvent =
    procedure (Sender: TObject;
      HintWindow: TwwGridHintWindow;
      AField: TField; R: TRect;
      var WordWrap: boolean;
      var MaxWidth, MaxHeight: integer;
      var DoDefault: boolean) of object;

  TwwMultiSelectOption = (msoAutoUnselect, msoShiftSelect);
  TwwMultiSelectOptions = set of TwwMultiSelectOption;
  TwwFieldChangedEvent =
      procedure (Sender: TObject; Field: TField) of object;

  TwwGridDataLink = class(TDataLink)
  private
    FGrid: TwwCustomDBGrid;
    FFieldCount: Integer;
    FFieldMapSize: Integer;
    FModified: Boolean;
    FInUpdateData: Boolean;
    FFieldMap: Pointer;
    function GetDefaultFields: Boolean;
    function GetFields(I: Integer): TField;
  protected
    procedure ActiveChanged; override;
    procedure DataSetChanged; override;
    procedure DataSetScrolled(Distance: Integer); override;
    procedure EditingChanged; override;
    procedure LayoutChanged; override;
    procedure RecordChanged(Field: TField); override;
    procedure UpdateData; override;
  public
    constructor Create(AGrid: TwwCustomDBGrid);
    destructor Destroy; override;
    function AddMapping(const FieldName: string): Boolean;
    procedure ClearMapping;
    procedure Modified;
    procedure Reset;
    property DefaultFields: Boolean read GetDefaultFields;
    property FieldCount: Integer read FFieldCount;
    property Fields[I: Integer]: TField read GetFields;
    property isFieldModified : boolean read FModified;
  end;

  TwwDBGridOption = (dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator,
    dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect,
    dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit,
    dgWordWrap, dgPerfectRowFit, dgMultiSelect, dgShowFooter, dgFooter3DCells,
    dgNoLimitColSize,  dgTrailingEllipsis, dgShowCellHint, dgTabExitsOnLastCol);
  TwwDBGridOptions = set of TwwDBGridOption;
  TwwDBGridKeyOption = (dgEnterToTab, dgAllowDelete, dgAllowInsert);
  TwwDBGridKeyOptions = set of TwwDBGridKeyOption;
  TwwDrawDataCellEvent = procedure (Sender: TObject; const Rect: TRect; Field: TField;
    State: TGridDrawState) of object;
  TIndicatorColorType = (icBlack, icYellow);
  TwwBitmapSizeType = (bsOriginalSize, bsStretchToFit, bsFitHeight, bsFitWidth);
//  TwwWriteTextOption = (wtoAmpersandToUnderline, wtoEllipsis, wtoWordWrap, wtoMergeCanvas);
//  TwwWriteTextOptions = Set of TwwWriteTextOption;

  TwwIButton=class(TSpeedButton)
  public
     procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
     procedure Loaded; override;
     procedure Paint; override;
  end;

  TwwInplaceEdit = class(TInplaceEdit)
    private
      FwwPicture: TwwDBPicture;
      FWordWrap: boolean;
      ParentGrid: TwwCustomDBGrid;
      FUsePictureMask: boolean;

      procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
      procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
      procedure WMPaste(var Message: TMessage); message WM_PASTE;  {10/28/96 }

    protected
      procedure KeyDown(var Key: Word; Shift: TShiftState); override;
      procedure CreateParams(var Params: TCreateParams); override;
      procedure KeyUp(var Key: Word; Shift: TShiftState); override;
      procedure KeyPress(var Key: Char); override;
      procedure SetWordWrap(val: boolean);
    public
      constructor wwCreate(AOwner: TComponent; dummy: integer); virtual;
      destructor Destroy; override;
      function IsValidPictureValue(s: string): boolean;
      Function HavePictureMask: boolean;

      property Picture: TwwDBPicture read FwwPicture write FwwPicture;
      property WordWrap: boolean read FWordWrap write SetWordWrap;
      property Color;
      property Font;
    end;

  TwwColumn = class
  private
//     FReadOnly: boolean;
//     FDisplayLabel: string;
//     FDisplayWidth: integer;

     FFieldName: string;
     Grid: TwwCustomDBGrid;
     FFooterValue: string;
     function GetReadOnly: boolean;
     function GetDisplayLabel: string;
     function GetDisplayWidth: integer;
     procedure SetReadOnly(val: boolean);
     procedure SetDisplayLabel(val: string);
     procedure SetDisplayWidth(val: integer);
     procedure SetFooterValue(val: string);
  public
     property FieldName: string read FFieldName;
     property ReadOnly : boolean read GetReadOnly write SetReadOnly;
     property DisplayLabel: string read GetDisplayLabel write SetDisplayLabel;
     property DisplayWidth: integer read GetDisplayWidth write SetDisplayWidth;
     property FooterValue: string read FFooterValue write SetFooterValue;
     constructor Create(AOwner: TComponent; AFieldName: string);
  end;

  TwwGridValidationError = procedure (Sender: TwwCustomDBGrid;
     Field: TField; var Msg: string; var DoDefault: boolean) of object;

  TwwCustomDBGrid = class(TCustomGrid)
  private
    FSelected : TStrings;
    FTitleFont: TFont;
    FTitleColor: TColor;
    FFooterColor: TColor;
    FFooterCellColor: TColor;
    FFooterHeight: integer;
    FReadOnly: Boolean;
    FUserChange: Boolean;
//    FDataChanged: Boolean;
//    FEditRequest: Boolean;
    FUpdatingColWidths: Boolean;
    FOptions: TwwDBGridOptions;
    FKeyOptions: TwwDBGridKeyOptions;
    FTitleOffset, FIndicatorOffset: Byte;
    FUpdateLock: Byte;
    FInColExit: Boolean;
    FDefaultDrawing: Boolean;
    FSelfChangingTitleFont: Boolean;
    FSelRow: Integer;
    FDataLink: TwwGridDataLink;
    FOnColEnter: TNotifyEvent;
    FOnColExit: TNotifyEvent;
    FOnDrawDataCell: TwwDrawDataCellEvent;
    FOnCalcCellColors: TCalcCellColorsEvent;
    FOnCalcTitleAttributes: TCalcTitleAttributesEvent;
    FOnDrawTitleCell: TwwDrawTitleCellEvent;
    FOnCalcTitleImage: TwwCalcTitleImageEvent;
    FOnTitleButtonClick: TTitleButtonClickEvent;
    FOnCheckValue: TwwValidateEvent;
    FOnTopRowChanged: TNotifyEvent;
    FOnRowChanged: TNotifyEvent;
    FOnCellChanged: TNotifyEvent;
    FOnLeftColChanged: TwwLeftColChangedEvent;
    FEditText: string;
    FIndicatorColor: TIndicatorColorType;
    FTitleAlignment: TAlignment;
    FRowHeightPercent: Integer;
    FTitleLines: integer;
    FShowVertScrollBar: boolean;
    FOnColumnMoved: TMovedEvent;
    FOnColWidthChanged: TColWidthChangedEvent;
    FTitleButtons: boolean;
    FEditCalculated : boolean;
    FUseTFields: boolean;
    FIndicatorWidth: integer;
    FIndicatorButton: TwwIButton;
    FImageList: TImageList;
    FTitleImageList: TImageList;
    FOnDrawFooterCell: TDrawFooterCellEvent;
    FOnFieldChanged: TwwFieldChangedEvent;
    FOnUpdateFooter: TNotifyEvent;
    FOnCreateHintWindow: TwwCreateGridHintWindowEvent;
    FOnValidationErrorUsingMask: TwwGridValidationError;

    InUpdateRowCount: boolean;
    FCalcCellRow, FCalcCellCol: integer;
    isWhiteBackground: boolean;
    isDrawFocusRect: boolean;
    SkipLineDrawing: boolean;
    TitleClickColumn: integer;
    TitleClickRow: integer;
    FMultiSelectOptions: TwwMultiSelectOptions;
    DisableCellChangedEvent: boolean;
    ColItems: TList;

    { Suport drag/drop of titles }
    UseDragCanvas: boolean;
    CaptureTitleBitmap: TBitmap;
    FDragVertOffset: integer;
    SkipTitleButtonClick: boolean;

    FControlType: TStrings;
    FControlInfoInDataset: boolean;
    FPictureMasks: TStrings;
    FPictureMaskFromDataSet: boolean;
    CallColEnter: Boolean;
    LastBookmark, LastMasterBookmark: TBookmark;
    TempLastCol: integer; { Used when dataset is made active to fire ColEnter only once}
    ShouldUpdateFooter: boolean;
    DummyColumn: TwwColumn;

    lastMouseX, lastMouseY: integer;
    HintTimer: TTimer;
    HintTimerCount: integer;

    Function GetPictureControl: TComponent;
    procedure HintTimerEvent(Sender: TObject);
    procedure MouseLoop_DragColumn(HitTest: Integer; X, Y: Integer);
    Function IsScrollBarVisible: boolean;
    function AcquireFocus: Boolean;
    procedure EditingChanged;
//    function Edit: Boolean;
    function GetDataSource: TDataSource;
    function GetFieldCount: Integer;
    function GetFields(Index: Integer): TField;
    function GetSelectedField: TField;
    function GetSelectedIndex: Integer;
    procedure MoveCol(ACol: Integer);
    procedure RecordChanged(Field: TField);
    procedure FieldChanged(Field: TField);
    procedure SetDataSource(Value: TDataSource);
    procedure SetOptions(Value: TwwDBGridOptions);
    procedure SetSelectedField(Value: TField);
    procedure SetSelectedIndex(Value: Integer);
    procedure SetTitleFont(Value: TFont);
    procedure SetIndicatorColor(Value: TIndicatorColorType);
    procedure SetTitleAlignment(sel: TAlignment);
    procedure SetTitleLines(sel: integer);
    procedure SetRowHeightPercent(sel: Integer);
    Procedure SetShowVertScrollBar(val: boolean);
    Procedure SetTitleButtons(val: boolean);
    Function GetShowHorzScrollBar: Boolean;
    Procedure SetShowHorzScrollBar(val: boolean);
    function GetSelectedFields: TStrings;
    procedure SetSelectedFields(sel : TStrings);
{    Procedure SetWordWrap(val: boolean);}

    function GetColWidthsPixels(Index: Longint): Integer;  {4/23/97}
    procedure SetColWidthsPixels(Index: Longint; Value: Integer); {4/23/97}
    procedure SetIndicatorWidth(val: integer);

    procedure TitleFontChanged(Sender: TObject);
    procedure UpdateData;
    procedure UpdateActive;
    {$ifdef wwDelphi4Up}
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBkgnd;
    {$endif}
    procedure CMExit(var Message: TMessage); message CM_EXIT;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMParentFontChanged(var Message: TMessage); message CM_PARENTFONTCHANGED;
    procedure CMDesignHitTest(var Msg: TCMDesignHitTest); message CM_DESIGNHITTEST;
    procedure WMSetCursor(var Msg: TWMSetCursor); message WM_SETCURSOR;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
    procedure WMRButtonDown(var Message: TWMRButtonDown); message WM_RBUTTONDOWN;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    {$ifdef wwdelphi4up}
    procedure CMShowingChanged(var Message: TMessage); message CM_SHOWINGCHANGED;
    {$endif}
    function GetColumn(Index: Integer): TwwColumn;
    procedure SetFooterColor(sel: TColor);
    procedure SetFooterCellColor(sel: TColor);
    procedure SetFooterHeight(val: integer);
//    function GetColumnByName(Index: string): TwwColumn;
    function GetCanvas: TCanvas;
    procedure SetPictureMasks(val: TStrings);
    procedure SetControlType(val: TStrings);

  protected
    FUpdateFields: Boolean;
    FAcquireFocus: Boolean;
    SuppressShowEditor: boolean;
    ShiftSelectMode: boolean;
    ShiftSelectBookmark: TBookmark;
    dummy1, dummy2: string;
    TitleTextOffset: integer;
    FieldMappedText: boolean;
//    RichEditBufferList: TStrings;
    HintWindow: THintWindow;

    {$ifdef wwDelphi4Up}
    SkipErase: boolean;   { 1/26/99 - Prevent clearing of grid when hiding controls }
    {$endif}

    procedure DoCreateHintWindow(
      HintWindow: TwwGridHintWindow;
      AField: TField; R: TRect;
      var WordWrap: boolean;
      var MaxWidth, MaxHeight: integer;
      var DoDefault: boolean); virtual;

    procedure LayoutChanged; virtual;
    procedure CalcRowHeight; dynamic;
    Function AllowCancelOnExit: boolean; dynamic;
    function CanEditAcceptKey(Key: Char): Boolean; override;
    function CanEditModify: Boolean; override;
    function GetEditLimit: Integer; override;
    procedure ColumnMoved(FromIndex, ToIndex: Longint); override;
    procedure ColEnter; dynamic;
    procedure ColExit; dynamic;
    procedure Scroll(Distance: Integer); virtual;
    procedure ColWidthsChanged; override;
    function HighlightCell(DataCol, DataRow: Integer; const Value: string;
      AState: TGridDrawState): Boolean; virtual;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
    function GetEditMask(ACol, ARow: Longint): string; override;
    function GetEditText(ACol, ARow: Longint): string; override;
    procedure SetEditText(ACol, ARow: Longint; const Value: string); override;
    function GetColField(ACol: Integer): TField;
    function GetFieldValue(ACol: Integer): string; dynamic;
    procedure DefineFieldMap; virtual;
    procedure DrawDataCell(const Rect: TRect; Field: TField;
      State: TGridDrawState); dynamic;
    procedure SetColumnAttributes; virtual;
    procedure KeyPress(var Key: Char); override;
    procedure LinkActive(Value: Boolean); virtual;
    procedure Loaded; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure TimedScroll(Direction: TGridScrollDirection); override;
    procedure CreateWnd; override;
    function IsWWControl(ACol, ARow: integer): boolean; virtual;

    property DefaultDrawing: Boolean read FDefaultDrawing write FDefaultDrawing default True;
    property DataSource: TDataSource read GetDataSource write SetDataSource; {W2W}
    property DataLink: TwwGridDataLink read FDataLink;
    property ParentColor default False;
    property ReadOnly: Boolean read FReadOnly write FReadOnly default False;
    property TitleColor: TColor read FTitleColor write FTitleColor default clBtnFace;
    property FooterColor: TColor read FFooterColor write SetFooterColor default clBtnFace;
    property FooterCellColor: TColor read FFooterCellColor write SetFooterCellColor default clBtnFace;
    property FooterHeight: integer read FFooterHeight write SetFooterHeight default 0;
    property TitleFont: TFont read FTitleFont write SetTitleFont;
    property OnColEnter: TNotifyEvent read FOnColEnter write FOnColEnter;
    property OnColExit: TNotifyEvent read FOnColExit write FOnColExit;
    property OnDrawDataCell: TwwDrawDataCellEvent read FOnDrawDataCell write FOnDrawDataCell;
    procedure DoCalcCellColors(Field: TField; State: TGridDrawState;
	     highlight: boolean; AFont: TFont; ABrush: TBrush); virtual;
    procedure DoTitleButtonClick(AFieldName: string); virtual;
    procedure DoCalcTitleAttributes(AFieldName: string; AFont: TFont; ABrush: TBrush;
	     var FTitleAlignment: TAlignment); virtual;
    procedure DoDrawTitleCell(ACanvas: TCanvas;
       Field: TField; ARect: TRect; var DefaultDrawing: boolean); virtual;
    procedure DoCalcTitleImage(Sender: TObject; Field: TField;
         var TitleImageAttributes: TwwTitleImageAttributes); {$ifdef wwdelphi4up} virtual; {$endif}

    {$ifdef wwDelphi4Up}
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    {$endif}

    procedure UpdateScrollBar;
    Function IsValidCell(ACol, ARow: integer): boolean;
    function DbCol(col: integer): integer;
    function DbRow(row: integer): integer;
    procedure Draw3DLines(ARect: TRect; ACol, ARow: integer;
	    AState: TGridDrawState);
    Function CellColor(ACol, ARow: integer): TColor; virtual;
    procedure DrawCheckBox(ARect: TRect; ACol, ARow: integer; val: boolean); virtual;
    procedure DrawCheckBox_Checkmark(ARect: TRect; ACol, ARow: integer; val: boolean);
    procedure RefreshBookmarkList; virtual;
    function CreateEditor: TInplaceEdit; override;
    procedure HideControls; virtual;
    property OnColWidthChanged: TColWidthChangedEvent read FOnColWidthChanged write FOnColWidthChanged;
    property OnColumnMoved: TMovedEvent read FOnColumnMoved write FOnColumnMoved;
    Procedure UnselectAll; virtual;
    Function IsSelectedCheckbox(ACol: integer): boolean;
    procedure DataChanged; virtual;
    Function IsSelectedRow(DataRow: integer): boolean; dynamic;
    procedure DoTopRowChanged; virtual;
    procedure DoRowChanged; virtual;
    procedure DoCellChanged; virtual;
    procedure DoCheckRowChanged; virtual;
    { Renamed property for C++ Builder conflicts }
    property IndicatorButtonWidth: integer read FIndicatorWidth write SetIndicatorWidth;
    {$ifdef win32}
     {$ifdef wwDelphi3Up}
     procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
     {$else}
     procedure GetChildren(Proc: TGetChildProc); override;
     {$endif}
    {$else}
    procedure WriteComponents(Writer: TWriter); override;
    {$endif}

    procedure TopLeftChanged; override;
    function GetClientRect: TRect; override;
    procedure Paint; override;

    function GetControlType: TStrings;
    procedure GetControlInfo(AFieldName: string;
       var AControlType: string; var AParameters: string); virtual;
    procedure DoFieldChanged(Field: TField); virtual;
    procedure DoUpdateFooter; virtual;
    Function GetFooterRect: TRect; virtual;
    procedure CheckFooterUpdate; virtual;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure FreeHintWindow; virtual;
    Function CreateHintWindow(AField: TField): THintWindow; virtual;
    procedure ValidationErrorUsingMask(Field: TField); virtual;

  public
    SkipHideControls: boolean;  { IP Internal - Set by TwwDBLookupCombo DropDown method }
    SkipDataChange: boolean;    { IP Internal - Set by TwwDBLookupComboDlg }
//    OriginalCellText: string;

    {$ifdef wwdelphi4up}
    function ExecuteAction(Action: TBasicAction): Boolean; override; { 8/24/98 }
    function UpdateAction(Action: TBasicAction): Boolean; override; {8/24/98}
    {$endif}
    procedure InvalidateFooter;
    procedure FlushChanges; virtual;
    procedure UpdateRowCount;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override; {public to allow child to send keys to parent }
    Procedure SizeLastColumn;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function IsCheckBox(col,row: integer; var checkboxon, checkboxoff: string): boolean;
    Function IsMemoField(Acol, Arow: integer): boolean;
    Function IsSelected: boolean; dynamic;
    function AllowPerfectFit: boolean;
    Function DoPerfectFit: boolean;
    Procedure SelectRecord; virtual;
    Procedure UnselectRecord; virtual;
    Procedure SetPictureMask(FieldName: string; Mask: string);
    Procedure SetPictureAutoFill(FieldName: string; AutoFill: boolean);

    procedure DefaultDrawDataCell(const Rect: TRect; Field: TField; State: TGridDrawState);
    property ColWidthsPixels[Index: Longint]: Integer read GetColWidthsPixels write SetColWidthsPixels;
    property EditorMode;
    property FieldCount: Integer read GetFieldCount;
    property Fields[Index: Integer]: TField read GetFields;
    property SelectedField: TField read GetSelectedField write SetSelectedField;
    property SelectedIndex: Integer read GetSelectedIndex write SetSelectedIndex;
    property IndicatorColor: TIndicatorColorType read FIndicatorColor write SetIndicatorColor;
    property Options: TwwDBGridOptions read FOptions write SetOptions
       default [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines,
      dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit,
      dgWordWrap];
    property KeyOptions : TwwDBGridKeyOptions read FKeyOptions write FKeyOptions
       default [dgAllowInsert, dgAllowDelete];
    property TitleAlignment: TAlignment read FTitleAlignment write setTitleAlignment;
    property TitleLines : integer read FTitleLines write setTitleLines;
    property OnCalcCellColors: TCalcCellColorsEvent read FOnCalcCellColors write FOnCalcCellColors;
    property OnCalcTitleAttributes: TCalcTitleAttributesEvent read FOnCalcTitleAttributes write FOnCalcTitleAttributes;
    property OnDrawTitleCell: TwwDrawTitleCellEvent read FOnDrawTitleCell write FOnDrawTitleCell;
    property OnCalcTitleImage: TwwCalcTitleImageEvent read FOnCalcTitleImage write FOnCalcTitleImage;
    property OnTitleButtonClick: TTitleButtonClickEvent read FOnTitleButtonClick write FOnTitleButtonClick;
    property RowHeightPercent : Integer read FRowHeightPercent write SetRowHeightPercent Default 100;
    property ShowVertScrollBar: boolean read FShowVertScrollBar write setShowVertScrollBar default True;
    property ShowHorzScrollBar: boolean read getShowHorzScrollBar write setShowHorzScrollBar;
    property OnCheckValue: TwwValidateEvent read FOnCheckValue write FOnCheckValue;
    property OnTopRowChanged: TNotifyEvent read FOnTopRowChanged write FOnTopRowChanged;
    property OnRowChanged: TNotifyEvent read FOnRowChanged write FOnRowChanged;
    property OnCellChanged: TNotifyEvent read FOnCellChanged write FOnCellChanged;
    property OnLeftColChanged: TwwLeftColChangedEvent read FOnLeftColChanged write FOnLeftColChanged;
    property OnFieldChanged: TwwFieldChangedEvent read FOnFieldChanged write FOnFieldChanged;
    property OnUpdateFooter: TNotifyEvent read FOnUpdateFooter write FOnUpdateFooter;
    property CalcCellRow: integer read FCalcCellRow;  {onCalcCellColor Row}
    property CalcCellCol: integer read FCalcCellCol;  {onCalcCellColor Column}
    property TitleButtons: boolean read FTitleButtons write SetTitleButtons;
    property EditCalculated : boolean read FEditCalculated write FEditCalculated default False;
    property MultiSelectOptions: TwwMultiSelectOptions read FMultiSelectOptions write FMultiSelectOptions default [];
    property Selected : TStrings read getSelectedFields write setSelectedFields;
    property UseTFields: boolean read FUseTFields write FUseTFields default True;
    property IndicatorButton: TwwIButton read FIndicatorButton write FIndicatorButton stored False;
    property ImageList: TImageList read FImageList write FImageList;
    property TitleImageList: TImageList read FTitleImageList write FTitleImageList;

    property Columns[Index: Integer]: TwwColumn read GetColumn; // write SetColumn;
    Function ColumnByName(Index: String): TwwColumn; // read GetColumnByName; // write SetColumn;
    property OnDrawFooterCell: TDrawFooterCellEvent read FOnDrawFooterCell write FOnDrawFooterCell;
    property OnCreateHintWindow : TwwCreateGridHintWindowEvent read FOnCreateHintWindow write FOnCreateHintWindow;
    property OnValidationErrorUsingMask: TwwGridValidationError read FOnValidationErrorUsingMask write FOnValidationErrorUsingMask;

    property Canvas : TCanvas read GetCanvas;
    property DragVertOffset: integer read FDragVertOffset write FDragVertOffset default 15;

    property ControlInfoInDataset: boolean
             read FControlInfoInDataset write FControlInfoInDataSet default True;
    property ControlType : TStrings read FControlType write SetControlType;
    property PictureMaskFromDataset: boolean
             read FPictureMaskFromDataset write FPictureMaskFromDataSet default True;
    property PictureMasks: TStrings read FPictureMasks write SetPictureMasks;
    property LeftCol;

  end;

   TwwUpdateSelected=(sptUpdateField, sptUpdateWidth, sptUpdateLabel, sptUpdateReadOnly);

procedure UpdateSelectedProp(Selected: TStrings;
   FieldName: string; val: string;
   SelectedProperty: TwwUpdateSelected);

function GetSelectedProp(Selected: TStrings;
   FieldName: string;
   SelectedProperty: TwwUpdateSelected): string;

Procedure wwWriteTextLines(ACanvas: TCanvas;
    const ARect: TRect; DX, DY: Integer; S: PChar; Alignment: TAlignment;
    WriteOptions: TwwWriteTextOptions);


implementation

uses DBConsts, Consts, Dialogs, wwcommon, wwpict, wwintl, wwdbgrid,
{$IFDEF WIN32}
bde
{$ELSE}
dbiprocs, dbiTypes, dbierrs
{$ENDIF}
;

{$IFDEF WIN32}
{$R WWDBI32.RES}
{$ELSE}
{$R WWDBIGRD.RES}
{$ENDIF}

const
  bmArrow = 'WWDBGARROW';
  bmEdit = 'WWDBEDIT';
  bmInsert = 'WWDBINSERT';
  bmArrowYellow = 'WWDBGARROWYELLOW';
  bmEditYellow = 'WWDBEDITYELLOW';
  bmInsertYellow = 'WWDBINSERTYELLOW';

  MaxMapSize = 65520 div SizeOf(Integer);
  GridScrollSize = 200;

  NormalPad = 2;

  ctmdNone = 0;
  ctmdForward = 1;
  ctmdBackward = 2;

var
  BrowseIndicatorBitmap, EditIndicatorBitmap, InsertIndicatorBitmap: TBitmap;

{type
  TwwGridHintWindow=class(THintWindow)
  private
     Field: TField;
     WordWrap: boolean;
  protected
     procedure Paint; override;
  public
     HintText: string;
  end;
}
procedure TwwGridHintWindow.Paint;
var
  R: TRect;
  WriteOptions: TwwWriteTextOptions;
begin
  R := ClientRect;
  Inc(R.Left, 2);
  Inc(R.Top, 2);
  Canvas.Font.Color := clInfoText;
  if WordWrap then
     WriteOptions:= [wtoWordWrap];

  wwWriteTextLinesT(Canvas, R, 0, 0, PChar(Caption), Alignment,
    WriteOptions);
//  SetBkMode(Canvas.Handle, TRANSPARENT);
//  DrawText(Canvas.Handle, PChar(Caption), -1, R,
//     DT_LEFT or DT_NOPREFIX {or DT_WORDBREAK });
end;


function TwwCustomDBGrid.GetCanvas: TCanvas;
begin
  if useDragCanvas then
     result:= CaptureTitleBitmap.Canvas
  else
     result:= inherited Canvas;
end;

procedure UpdateSelectedProp(Selected: TStrings;
   FieldName: string; val: string;
   SelectedProperty: TwwUpdateSelected);
var APos, index: integer;
    FieldWidth, DisplayLabel, ReadOnly: wwSmallString;
begin
   if wwFindSelected(Selected, FieldName, index) then
   begin
      APos:=1;
      FieldName:= strGetToken(Selected[index], #9, apos);
      FieldWidth:= strGetToken(Selected[index], #9, apos);
      DisplayLabel:= strGetToken(Selected[index], #9, apos);
      ReadOnly:= strGetToken(Selected[index], #9, apos);
      if ReadOnly='' then ReadOnly:= 'F';
      case SelectedProperty of
         sptUpdateWidth: FieldWidth:= val;
         sptUpdateLabel: DisplayLabel:= val;
         sptUpdateReadOnly: ReadOnly:= val;
      end;
      Selected[index]:= FieldName + #9 + FieldWidth + #9 +
         DisplayLabel + #9 + ReadOnly;
   end;
end;

function GetSelectedProp(Selected: TStrings;
   FieldName: string;
   SelectedProperty: TwwUpdateSelected): string;
var APos, index: integer;
    FieldWidth, DisplayLabel, ReadOnly: wwSmallString;
begin
   if wwFindSelected(Selected, FieldName, index) then
   begin
      APos:=1;
      FieldName:= strGetToken(Selected[index], #9, apos);
      FieldWidth:= strGetToken(Selected[index], #9, apos);
      DisplayLabel:= strGetToken(Selected[index], #9, apos);
      ReadOnly:= strGetToken(Selected[index], #9, apos);
      if ReadOnly='' then ReadOnly:= 'F';
      case SelectedProperty of
         sptUpdateField: result:= FieldName;
         sptUpdateWidth: result:= FieldWidth;
         sptUpdateLabel: result:= DisplayLabel;
         sptUpdateReadOnly: result:= ReadOnly;
      end;
   end
end;

Function min(x,y: integer): integer;
begin
   if x<y then min:= x
   else min:= y;
end;

{ Error reporting }
procedure RaiseGridError(const S: string);
begin
  raise EInvalidGridOperation.Create(S);
end;

{procedure GridError(S: Word);
begin
  RaiseGridError(LoadStr(S));
end;

procedure GridErrorFmt(S: Word; const Args: array of const);
begin
  RaiseGridError(FmtLoadStr(S, Args));
end;
}

{ TwwGridDataLink }
type
  TIntArray = array[0..MaxMapSize] of Integer;
  PIntArray = ^TIntArray;

  TBitmapCacheType=class
    Bitmap: TBitmap;
    LookupValue: string;
    curField: TField;
  end;

constructor TwwGridDataLink.Create(AGrid: TwwCustomDBGrid);
begin
  inherited Create;
  FGrid := AGrid;
end;

destructor TwwGridDataLink.Destroy;
begin
  ClearMapping;
  inherited Destroy;
end;

function TwwGridDataLink.GetDefaultFields: Boolean;
begin
  Result := True;
  if DataSet <> nil then Result := DataSet.DefaultFields;
end;

function TwwGridDataLink.GetFields(I: Integer): TField;
begin
  if I < FFieldCount then
    Result := DataSet.Fields[PIntArray(FFieldMap)^[I]]
  else Result:= nil;
end;

function TwwGridDataLink.AddMapping(const FieldName: string): Boolean;
var
  Field: TField;
  NewSize: Integer;
  NewMap: Pointer;
begin
  if FFieldCount >= MaxMapSize then
  {$ifdef wwDelphi3Up}
     RaiseGridError(STooManyColumns);
  {$else}
     GridError(STooManyColumns);
  {$endif}
  Field := DataSet.FindField(FieldName);
  Result := Field <> nil;
  if Result then
  begin
    if FFieldMapSize = 0 then
    begin
      FFieldMapSize := 8;
      GetMem(FFieldMap, FFieldMapSize * SizeOf(Integer));
    end
    else if FFieldCount = FFieldMapSize then
    begin
      NewSize := FFieldMapSize;
      Inc(NewSize, NewSize);
      if (NewSize > MaxMapSize) or (NewSize < FFieldCount) then
	NewSize := MaxMapSize;
      GetMem(NewMap, NewSize * SizeOf(Integer));
      Move(FFieldMap^, NewMap^, SizeOf(Integer) * FFieldCount);
      FreeMem(FFieldMap, SizeOf(Integer) * FFieldCount);
      FFieldMapSize := NewSize;
      FFieldMap := NewMap;
    end;
    PIntArray(FFieldMap)^[FFieldCount] := Field.Index;
{    if FGrid.useTFields then
       PIntArray(FFieldMap)^[FFieldCount] := Field.Index
    else if wwFindSelected(FGrid.Selected, Field.FieldName, AIndex) then
       PIntArray(FFieldMap)^[FFieldCount] := AIndex;}
    Inc(FFieldCount);
  end;
end;

procedure TwwGridDataLink.ActiveChanged;
begin
  FGrid.LinkActive(Active);
end;

procedure TwwGridDataLink.ClearMapping;
begin
  if FFieldMap <> nil then
  begin
    FreeMem(FFieldMap, FFieldMapSize * SizeOf(Integer));
    FFieldMap := nil;
    FFieldMapSize := 0;
    FFieldCount := 0;
  end;
end;

procedure TwwGridDataLink.Modified;
begin
  FModified := True;
end;

procedure TwwGridDataLink.DataSetChanged;
begin
  FGrid.DataChanged;
  FModified := False;
end;

procedure TwwGridDataLink.DataSetScrolled(Distance: Integer);
begin
  FGrid.Scroll(Distance);
end;

procedure TwwGridDataLink.LayoutChanged;
begin
{  if FGrid.useTFields then} FGrid.LayoutChanged;
end;

procedure TwwGridDataLink.EditingChanged;
begin
  FGrid.EditingChanged;

  { Update footer later, when encountering edit or insert mode }
  if (datasource<>nil) and  { 10/7/98 }
     ((datasource.state=dsInsert) or (datasource.state=dsEdit)) then
  begin
    FGrid.ShouldUpdateFooter:= True;
  end;
end;

procedure TwwGridDataLink.RecordChanged(Field: TField);
begin
  if (Field = nil) or not FInUpdateData then
  begin
    FGrid.RecordChanged(Field);
    FModified := False;
  end;

  if (Field<>Nil) and (Dataset.State in [dsEdit, dsInsert]) then
  begin
     FGrid.FieldChanged(Field);
     if (FGrid is TwwDBGrid) then TwwDBGrid(FGrid).Patch[0]:=True;
  end
end;

procedure TwwGridDataLink.UpdateData;
begin
  FInUpdateData := True;
  try
    if FModified then FGrid.UpdateData;
    FModified := False;
  finally
    FInUpdateData := False;
  end;
end;

procedure TwwGridDataLink.Reset;
begin
  if FModified then RecordChanged(nil) else begin
     if ((DataSource.DataSet.State = dsEdit) or (DataSource.DataSet.State = dsInsert)) and
	 dataSet.modified then
     begin
	 if MessageDlg(wwInternational.UserMessages.wwDBGridDiscardChanges,
		    mtConfirmation, [mbYes,mbNo], 0)<>mrYes then exit;
     end;
     Dataset.Cancel;
  end
end;

{ TwwCustomDBGrid }

var
  DrawBitmap: TBitmap;
  UserCount: Integer;

procedure UsesBitmap;
begin
  if UserCount = 0 then
  begin
    DrawBitmap := TBitmap.Create;
  end;
  Inc(UserCount);
end;

procedure ReleaseBitmap;
begin
  Dec(UserCount);
  if UserCount = 0 then begin
     DrawBitmap.Free;
     DrawBitmap:= Nil;
     EditIndicatorBitmap.Free;
     BrowseIndicatorBitmap.Free;
     InsertIndicatorBitmap.Free;
     EditIndicatorBitmap:= Nil;
     BrowseIndicatorBitmap:= Nil;
     InsertIndicatorBitmap:= Nil;
  end;
end;

function Max(X, Y: Integer): Integer;
begin
  Result := Y;
  if X > Y then Result := X;
end;


{ Support all colors }
(*
procedure WriteText(ACanvas: TCanvas; ARect: TRect; DX, DY: Integer;
  const Text: string; Alignment: TAlignment);
const
  AlignFlags : array [TAlignment] of Integer =
    ( DT_LEFT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_RIGHT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_CENTER or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX );
var
  B, R: TRect;
  I, Left: Longint; { 6/17/97 - Longint for 16 bit compatibilty }
  {$ifndef win32}
  S: array[0..255] of Char;
  {$endif}
  Flags:Integer;
begin
  I := ColorToRGB(ACanvas.Brush.Color);
  if (GetNearestColor(ACanvas.Handle, I) = I) then
  begin                       { Use ExtTextOut for solid colors }
    case Alignment of
      taLeftJustify:
	Left := ARect.Left + DX;
      taRightJustify:
	Left := ARect.Right - ACanvas.TextWidth(Text) - 3;
    else { taCenter }
      Left := ARect.Left + (ARect.Right - ARect.Left) shr 1
	- (ACanvas.TextWidth(Text) shr 1);
    end;
    {$ifdef win32}
    ExtTextOut(ACanvas.Handle, Left, ARect.Top + DY, ETO_OPAQUE or
       ETO_CLIPPED, @ARect, PChar(Text), Length(Text), nil)
    {$else}
    ExtTextOut(ACanvas.Handle, Left, ARect.Top + DY, ETO_OPAQUE or
       ETO_CLIPPED, @ARect, StrPCopy(S, Text), Length(Text), nil)
    {$endif}
  end
  else begin                  { Use FillRect and Drawtext for dithered colors }
    with DrawBitmap, ARect do { Use offscreen bitmap to eliminate flicker and }
    begin                     { brush origin tics in painting / scrolling.    }
      Width := Max(Width, Right - Left);
      Height := Max(Height, Bottom - Top);
      if Alignment=taRightJustify then
         R := Rect(DX, DY, Right - Left-3, Bottom - Top - 1)
      else if Alignment=taLeftJustify then
         R := Rect(DX, DY, Right - Left, Bottom - Top - 1)
      else {3/31/98 - If CenterJustify then allow DrawText to properly center text}
         R := Rect(0,DY,Right-Left,Bottom-Top-1);

      B := Rect(0, 0, Right - Left, Bottom - Top);
    end;
    with DrawBitmap.Canvas do
    begin
      Font := ACanvas.Font;
      Font.Color := ACanvas.Font.Color;
      Brush := ACanvas.Brush;
      Brush.Style := bsSolid;
      FillRect(B);
      SetBkMode(Handle, TRANSPARENT);

      Flags := AlignFlags[Alignment];

      {3/31/98 - Check to see if this is a single line edit control to
       determine if we should or should not have word breaks}
      if wwIsSingleLineEdit(Handle,R,Flags) then
         Flags := Flags and not DT_WORDBREAK;

      {$ifdef win32}
      DrawText(Handle, PChar(Text), Length(Text), R, Flags);
      {$else}
      DrawText(Handle, StrPCopy(S, Text), Length(Text), R, Flags);
      {$endif}
    end;
    ACanvas.CopyRect(ARect, DrawBitmap.Canvas, B);
  end;
end;
*)
{function Substring(s: string; Start, Stop: integer): string;
begin
  if Stop = 0 then result := Copy(s, Start, length(s) - Start + 1)
  else result := Copy(s, Start, Stop - Start);
end;

function IndexOf(Substr, s: string; Index: integer): integer;
begin
  result := pos(Substr, Substring(s, Index, 0));
  if result <> 0 then result := result + Index - 1;
end;

function Replace(s, Find, Replace: string): string;
var i: integer;
begin
  i := 1;
  result := '';
  while i <> 0 do
  begin
    result := result + Substring(s, i, IndexOf(Find, s, i));
    if IndexOf(Find, s, i) = 0 then break;
    result := result + Replace;
    i := IndexOf(Find, s, i);
    if i <> 0 then inc(i, Length(Find));
  end;

end;
}
Procedure wwWriteTextLines(ACanvas: TCanvas;
    const ARect: TRect; DX, DY: Integer; S: PChar; Alignment: TAlignment;
    WriteOptions: TwwWriteTextOptions);
const
  AlignFlags : array [TAlignment] of Integer =
    ( DT_LEFT or DT_EXPANDTABS or DT_NOPREFIX,
      DT_RIGHT or DT_EXPANDTABS or DT_NOPREFIX,
      DT_CENTER or DT_EXPANDTABS or DT_NOPREFIX );
var
  B, R: TRect;
  Flags: integer;
  ADrawCanvas: TCanvas;
  tempRect: TRect;
begin
    if DrawBitmap<>Nil then ADrawCanvas:= DrawBitmap.Canvas
    else ADrawCanvas:= ACanvas;

    with DrawBitmap, ARect do { Use offscreen bitmap to eliminate flicker and }
    begin                     { brush origin tics in painting / scrolling.    }
      if DrawBitmap<>Nil then begin
         Width := Max(Width, Right - Left);
         Height := Max(Height, Bottom - Top);
      end;
      if Alignment=taRightJustify then
         R := Rect(DX, DY, Right - Left -2, Bottom - Top - 1) { 7/10/98 - Make width 1 less }
      else if Alignment=taLeftJustify then
         R := Rect(DX, DY, Right - Left, Bottom - Top - 1)
      else  {3/31/98 - If CenterJustify then allow DrawText to properly center text}
      begin
         if DX>3 then
            R := Rect(2, DY, Right - Left, Bottom - Top - 1)
         else
            R := Rect(0, DY, Right - Left, Bottom - Top - 1)
      end;
      if DrawBitmap=Nil then begin
         R.Left:= R.Left + ARect.Left;
         R.Right:= R.Right + ARect.Left;
         R.Top:= R.Top + ARect.Top;
         R.Bottom:= R.Bottom + ARect.Top;
      end;
      B := Rect(0, 0, Right - Left, Bottom - Top);
    end;
    with ADrawCanvas do
    begin
      Font := ACanvas.Font;
      Font.Color := ACanvas.Font.Color;
      Brush := ACanvas.Brush;
      Brush.Style := bsSolid;
      if not (wtoTransparent in WriteOptions) then
      begin
        if DrawBitmap<>Nil then FillRect(B)
        else FillRect(ARect);
      end;

      if (wtoMergeCanvas in WriteOptions) and (DrawBitmap<>Nil) then
      begin
         DrawBitmap.Canvas.CopyMode:= cmMergeCopy;
         DrawBitmap.Canvas.CopyRect(B, ACanvas, ARect);
      end;

      SetBkMode(Handle, TRANSPARENT);
      Flags:= AlignFlags[Alignment];
      if wtoAmpersandToUnderline in WriteOptions then
         Flags:= Flags and (not  DT_NOPREFIX);

      if wtoWordWrap in WriteOptions then
         Flags := Flags or DT_WORDBREAK;

      {3/31/98 - Check to see if this is a single line edit control to
       determine if we should or should not have word breaks}
      if wwIsSingleLineEdit(Handle,R,Flags) or (wtoEllipsis in WriteOptions) then
          Flags := Flags and not DT_WORDBREAK;

      if wtoEllipsis in WriteOptions then
      begin
         Flags:= Flags or DT_END_ELLIPSIS;  { If text does not fit then put ellipsis at end }
         DrawText(Handle, S, StrLen(S), R, Flags);
      end
      else begin
         DrawText(Handle, S, StrLen(S), R, Flags);
      end
    end;
    if (DrawBitmap<>Nil) then
    begin
       TempRect:= ARect;
       {$ifdef wwDelphi4Up}
       if (ACanvas.CanvasOrientation = coRightToLeft) then { 9/25/98 - Support bidi mode }
       begin
         TempRect.Left := ARect.Right;
         TempRect.Right := ARect.Left;
       end;
       {$endif}
       ACanvas.CopyRect(TempRect, DrawBitmap.Canvas, B);
    end
end;

constructor TwwCustomDBGrid.Create(AOwner: TComponent);
var
  Bmp: TBitmap;
begin
  TempLastCol:= -1;

  inherited Create(AOwner);
  inherited DefaultDrawing := False;
  FAcquireFocus := True;
  Bmp := TBitmap.Create;
  try
    Bmp.Handle := LoadBitmap(HInstance, bmArrow);
    if BrowseIndicatorBitmap=Nil then begin
       BrowseIndicatorBitmap:= TBitmap.create;
       BrowseIndicatorBitmap.assign(Bmp);
    end;
    Bmp.Handle := LoadBitmap(HInstance, bmEdit);
    if EditIndicatorBitmap=Nil then begin
       EditIndicatorBitmap:=TBitmap.create;
       editIndicatorBitmap.assign(Bmp);
    end;
    Bmp.Handle := LoadBitmap(HInstance, bmInsert);
    if InsertIndicatorBitmap=Nil then begin
       InsertIndicatorBitmap:= TBitmap.create;
       InsertIndicatorBitmap.assign(Bmp);
    end;

    FIndicatorColor := icBlack;
  finally
    Bmp.Free;
  end;
  FTitleOffset := 1;
  FIndicatorOffset := 1;
  FUpdateFields := True;
  FOptions := [dgEditing, dgTitles, dgIndicator, dgColumnResize,
    dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit,
    dgWordWrap];
  FKeyOptions:= [dgAllowInsert, dgAllowDelete];
  UsesBitmap;
  ScrollBars := ssHorizontal;
  inherited Options := [goFixedHorzLine, goFixedVertLine, goHorzLine,
    goVertLine, goColSizing, goColMoving, goTabs, goEditing];
  inherited RowCount := 2;
  inherited ColCount := 2;
  FDataLink := TwwGridDataLink.Create(Self);
  Color := clWindow;
  ParentColor := False;
  FTitleFont := TFont.Create;
  FTitleFont.OnChange := TitleFontChanged;
  FTitleColor := clBtnFace;
  FFooterColor:= clBtnFace;
  FFooterCellColor:= clBtnFace;
  FSaveCellExtents := False;
  FUserChange := True;
  FDefaultDrawing := True;
  HideEditor;

  FTitleAlignment:= taLeftJustify;
  FRowHeightPercent:= 100;

  FTitleLines:= 1;
  ShowVertScrollBar:= True;

  InUpdateRowCount:= False;
  TitleClickColumn:= -1;

  FSelected:= TStringList.create;
  UseTFields:= True;
  FIndicatorWidth:= 11;
  ColItems:= TList.Create;

  FDragVertOffset:= 15;

  FControlType:= TStringList.create;
  FControlInfoInDataset:= True;
  FPictureMasks:= TStringList.create;
  FPictureMaskFromDataSet:= True;

  DummyColumn:= TwwColumn.Create(self, '');


end;

destructor TwwCustomDBGrid.Destroy;
var i: integer;
begin
  FIndicatorButton.Free;

  FSelected.Free;
  FSelected := Nil;

  FDataLink.Free;
  FDataLink := nil;
  FTitleFont.Free;
  FTitleFont:= Nil;

  for i:= 0 to ColItems.Count-1 do TwwColumn(ColItems[i]).Free;
  ColItems.Free;

  CaptureTitleBitmap.Free;
  CaptureTitleBitmap:= nil;
  FControlType.Free;
  FPictureMasks.Free;

  {$ifdef wwdelphi4up}
  if LastBookmark<>Nil then FreeMem(LastBookmark);
  LastBookmark:= nil;
  if LastMasterBookmark<>Nil then FreeMem(LastMasterBookmark);
  LastMasterBookmark:= nil;
  {$else}
  if LastBookmark<>Nil then StrDispose(LastBookmark);
  LastBookmark:= nil;
  if LastMasterBookmark<>Nil then StrDispose(LastMasterBookmark);
  LastMasterBookmark:= nil;
  {$endif}
  DummyColumn.Free;
  DummyColumn:= nil;

  inherited Destroy;
  ReleaseBitmap;
end;

procedure TwwCustomDBGrid.DefineFieldMap;
var
  I: Integer;
  APos: integer;
  FldName: string;
  TempList: TList;
  {ExistingColumn, }CurColumn: TwwColumn;
begin

  if FDataLink.DataSet=nil then exit;

  with FDatalink.Dataset do begin
    if useTFields then begin
       for I := 0 to FieldCount - 1 do
       begin
         with Fields[I] do if Visible then FDatalink.AddMapping(Fieldname);
       end
    end
    else begin
       i:= 0;
       while i<=Selected.count-1 do
       begin
          APos:= 1;
          FldName:= strGetToken(selected[i], #9, APos);
          if FDataLink.Active and (FindField(FldName)=Nil) then
          begin
             Selected.delete(i);
             continue;
          end
          else begin
             FDatalink.AddMapping(FldName);
          end;
          inc(i);
       end
    end
  end;

  { Create templist for TwwColumns - saves existing properties }
  TempList:= TList.create;
  for i:= 0 to FieldCount-1 do
  begin
     curColumn:= TwwColumn.Create(self, Fields[i].FieldName);
//     ExistingColumn:= ColumnByName(Fields[i].FieldName);
//     if ExistingColumn<>nil then curColumn.FooterValue:= ExistingColumn.FooterValue;
     curColumn.FooterValue:= ColumnByName(Fields[i].FieldName).FooterValue;
     TempList.Add(curColumn);
  end;

  { Free prior column list - Do after creating new tempList}
  for i:= 0 to ColItems.Count-1 do TwwColumn(ColItems[i]).Free;
  ColItems.Clear;

  { Transfer tempitems over to Items }
  for i:= 0 to TempList.count-1 do ColItems.Add(TempList[i]);
  TempList.Free;

end;

procedure TwwCustomDBGrid.DrawDataCell(const Rect: TRect; Field: TField;
  State: TGridDrawState);
begin
  if Assigned(FOnDrawDataCell) then FOnDrawDataCell(Self, Rect, Field, State);
end;

procedure TwwCustomDBGrid.SetColumnAttributes;
var
  I: Integer;
  CWidth: Integer;
  parts: TStrings;
  tempField: TField;
  tempCount: integer;

  Function GetTitleWidth(lbl: string): integer;
  var APos, currentTitleWidth, lineWidth: integer;
      line: string;
  begin
     APos:= 1;
     lineWidth:= 0;
     while True do begin
	line:= strGetToken(lbl, '~', APos);
	if (line='') and ((APos<=0) or (APos>=length(line))) then break;
	currentTitleWidth:= Canvas.TextWidth(line);
	if currentTitleWidth>LineWidth then lineWidth:= currentTitleWidth;
     end;
     result:= lineWidth + 4;
  end;

  Function GetDisplayWidth(index: integer): integer;
  begin
     if useTFields then
        result:= Fields[i].DisplayWidth * Canvas.TextWidth('0') + 4
     else result:= strtoint(parts[1]) * Canvas.TextWidth('0') + 4;
  end;

  Function GetDisplayLabel(index: integer): string;
  begin
     if useTFields then result:= Fields[i].DisplayLabel
     else if parts.count>2 then result:= parts[2] {7/31/97}
     else result:= tempField.DisplayLabel;
  end;

begin
   if datasource=nil then exit;
   if datasource.dataset=nil then exit; {3/15/97}


   if useTFields then TempCount:= FieldCount
   else begin
      TempCount:= selected.Count;
      parts := TStringList.create;
   end;

   for I := 0 to TempCount - 1 do
   begin
       if useTFields then
         tempField:= Fields[i]
       else begin
         strBreakApart(selected[i], #9, parts);
         tempField:= DataSource.DataSet.FindField(parts[0]);
         if tempField=nil then continue;
       end;
       Canvas.Font := Font;
       CWidth := GetDisplayWidth(i);
//       { 10/26/98 - Truncate to character }
//       CWidth:= (GetDisplayWidth(i) div Canvas.TextWidth('0')) * Canvas.TextWidth('0');

       if (dgTitles in Options) and not (dgNoLimitColSize in Options) then
       begin
           Canvas.Font := TitleFont;
              if CWidth < GetTitleWidth(GetDisplayLabel(i)) then
                 CWidth:= GetTitleWidth(GetDisplaylabel(i));
       end;
       ColWidths[I + FIndicatorOffset] := CWidth;
       TabStops[I + FIndicatorOffset] := (not TempField.ReadOnly);
       if {(ColumnByName(TempField.FieldName)<>Nil) and }
          (ColumnByName(TempField.FieldName).ReadOnly) then
          TabStops[I + FIndicatorOffset]:= False;

       if TabStops[I + FIndicatorOffset] and (not EditCalculated) then
          TabStops[I + FIndicatorOffset] := (not TempField.Calculated);
   end;

   if not useTFields then parts.Free;

end;

procedure TwwCustomDBGrid.CalcRowHeight;
begin
   Canvas.Font := Font;
   DefaultRowHeight:= Canvas.Textheight('W') + NormalPad;
   if dgRowLines in Options then DefaultRowHeight:= DefaultRowHeight + 1;

   DefaultRowHeight:= (DefaultRowHeight * RowHeightPercent) div 100;

   if dgTitles in Options then
   begin
      Canvas.Font := TitleFont;
      RowHeights[0] := Canvas.TextHeight('W') * TitleLines + 4;

      {$ifndef win32}
      rowHeights[0]:= RowHeights[0] + 1;
      {$endif}

      { Increase by 1 in order to show 3D effects }
      if (not (dgRowLines in Options)) {and Ctl3D} then
	 rowHeights[0]:= RowHeights[0] + 1;

   end;

   if (dgIndicator in Options) and (FIndicatorButton<>Nil) then
   begin
      TitleTextOffset:= 2 +
         (max(RowHeights[0], FIndicatorButton.height) - rowHeights[0]) div 2;
      {$ifdef win32}
      if (dgRowLines in Options)then
         RowHeights[0]:= max(RowHeights[0], FIndicatorButton.height)-1  {5/09/97 Removed -1}
      else RowHeights[0]:= max(RowHeights[0], FIndicatorButton.height)+1;  {5/09/97 Removed -1}
      {$else}
      RowHeights[0]:= max(RowHeights[0], FIndicatorButton.height)-2;
      {$endif}
   end
   else TitleTextOffset:= 2;

end;

procedure TwwCustomDBGrid.SetIndicatorWidth(val: integer);
begin
   if FIndicatorWidth<>val then
   begin
      FIndicatorWidth:= val;
   end
end;

procedure TwwCustomDBGrid.LayoutChanged;
var
  J: Integer;
  PrevVisibleRowCount: integer;
begin
  if csLoading in ComponentState then Exit;
  if not HandleAllocated then Exit;
  if FUpdateLock <> 0 then Exit;
  Inc(FUpdateLock);
  try
    FUpdatingColWidths := True;
    try
      FTitleOffset := 0;
      if dgTitles in Options then FTitleOffset := 1;

      calcRowHeight;

      FIndicatorOffset := 0;
      if dgIndicator in Options then FIndicatorOffset := 1;

      FDatalink.ClearMapping;
      if FDatalink.Active then DefineFieldMap;
      if not useTFields and (FieldCount=0) then j:= Selected.Count
      else J := FieldCount;
      if J = 0 then J := 1;
      inherited ColCount := J + FIndicatorOffset;
      if dgIndicator in Options then ColWidths[0] := FIndicatorWidth;
      if (dgIndicator in Options) and (Col=0) then Col:= 1; {5/31/95 - Avoid }

      HideControls;   {7/18/97 - in case of re-order }
      UpdateRowCount;

      PrevVisibleRowCount:= VisibleRowCount;
      SetColumnAttributes;
      if VisibleRowCount<>PrevVisibleRowCount then UpdateRowCount;  {6/1/95}
      CheckFooterUpdate;
    finally
      FUpdatingColWidths := False;
    end;
    UpdateActive;

    if AllowPerfectFit then DoPerfectFit;
    Invalidate;

  finally
    Dec(FUpdateLock);
  end;
end;

procedure TwwCustomDBGrid.LinkActive(Value: Boolean);
begin

  if not Value then HideEditor;
  LayoutChanged;
  UpdateScrollBar;

  { 1/28/98 - Clear multi-select last record }
  { 4/21/99 - Free ShiftSelectBookmark first }
  {$ifdef wwdelphi4up}
  If Value then begin
     if ShiftSelectBookmark<>Nil then FreeMem(ShiftSelectBookmark);
     ShiftSelectBookmark:= nil;
     ShiftSelectMode:= False;
  end;
  if LastBookmark<>Nil then FreeMem(LastBookmark);
  LastBookmark:= nil;
  if LastMasterBookmark<>Nil then FreeMem(LastMasterBookmark);
  LastMasterBookmark:= nil;
  {$else}
  If Value then begin
     if ShiftSelectBookmark<>Nil then StrDispose(ShiftSelectBookmark);
     ShiftSelectBookmark:= nil;
     ShiftSelectMode:= False;
  end;
  if LastBookmark<>Nil then StrDispose(LastBookmark);
  LastBookmark:= nil;
  if LastMasterBookmark<>Nil then StrDispose(LastMasterBookmark);
  LastMasterBookmark:= nil;
  {$endif}

  if Value then begin
     if (not HandleAllocated) then CallColEnter:= True
     else begin
        if Col<>TempLastCol then ColEnter;
        TempLastCol:= Col;
     end;
     ShouldUpdateFooter:= True; { Update footer first time after active }
  end
  else TempLastCol:= -1;
end;

procedure TwwCustomDBGrid.CreateWnd;
begin
  inherited CreateWnd;
  LayoutChanged;
  UpdateScrollBar;
  DoCheckRowChanged;
end;

function TwwCustomDBGrid.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TwwCustomDBGrid.CanEditAcceptKey(Key: Char): Boolean;
begin
  Result := FDatalink.Active and (FieldCount > 0) and
    Fields[SelectedIndex].IsValidChar(Key);
end;

function TwwCustomDBGrid.GetEditLimit: Integer;
begin
  Result := 0;
  if (FieldCount > 0) and (SelectedField is TStringField) then
    Result := TStringField(SelectedField).Size;
end;

function TwwCustomDBGrid.CanEditModify: Boolean;
var colInfo: TwwColumn;
begin
  Result := False;

  {8/24/98 - Don't allow insert/edit if no records and dgallowinsert is false }
  {10/2/98 - Fix this fix.  Allow editing if editing. }
  if (datasource<>nil) and (datasource.dataset<>nil) and
     (not (dgAllowInsert in KeyOptions)) and
     Datasource.dataset.BOF and datasource.dataset.EOF and
     (datasource.state = dsBrowse) then
  begin
     exit;
  end;

  if not ReadOnly and FDatalink.Active and not FDatalink.Readonly and
    (FieldCount > 0) and
    (Fields[SelectedIndex].CanModify or
    (FEditCalculated and wwisNonPhysicalField(Fields[SelectedIndex]) {5/9/97}
     and not (Fields[SelectedIndex].ReadOnly))) then
  begin
    colInfo:= ColumnByName(Fields[SelectedIndex].FieldName);
    if {(colInfo<>nil) and }(colInfo.ReadOnly) then exit;

    FDatalink.Edit;
    Result := FDatalink.Editing;
    if Result then FDatalink.Modified;
  end;
end;

function TwwCustomDBGrid.GetEditMask(ACol, ARow: Longint): string;
begin
  Result := '';
  if FDatalink.Active and (ACol - FIndicatorOffset < FieldCount) then
    Result := Fields[ACol - FIndicatorOffset].EditMask;
end;

function TwwCustomDBGrid.GetEditText(ACol, ARow: Longint): string;
begin
  Result := '';
  if FDatalink.Active and (ACol - FIndicatorOffset < FieldCount) then
    Result := Fields[ACol - FIndicatorOffset].Text;
  FEditText := Result;
end;

procedure TwwCustomDBGrid.SetEditText(ACol, ARow: Longint; const Value: string);
begin
  FEditText := Value;
end;

function TwwCustomDBGrid.GetFieldCount: Integer;
begin
  Result := FDatalink.FieldCount;
{  if Result=0 then
   result:= Selected.count}
end;

function TwwCustomDBGrid.GetFields(Index: Integer): TField;
begin
  Result := FDatalink.Fields[Index];
end;

procedure TwwCustomDBGrid.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  LinkActive(FDataLink.Active);
end;

function TwwCustomDBGrid.GetSelectedField: TField;
begin
  Result := nil;
  if SelectedIndex < FieldCount then Result := Fields[SelectedIndex];
end;

function TwwCustomDBGrid.GetSelectedIndex: Integer;
begin
  Result := Col - FIndicatorOffset;
end;

procedure TwwCustomDBGrid.SetSelectedField(Value: TField);
var
  I: Integer;
begin
  for I := 0 to FieldCount - 1 do
    if Fields[I] = Value then SelectedIndex := I;
end;

procedure TwwCustomDBGrid.SetSelectedIndex(Value: Integer);
begin
  MoveCol(Value);
end;

procedure TwwCustomDBGrid.CheckFooterUpdate;
var MasterBookmark: TBookmark;
    MasterSource: TDatasource;
    res: CmpBkmkRslt;
begin
  if not Assigned(FOnUpdateFooter) then exit;
  
  if not HandleAllocated then Exit;
  if (datasource<>nil) and (datasource.state=dsBrowse) then { 10/21/98 - Check datsource<>nil}
  begin
     { If child dataset then update when master moves to a new record }
     if not ShouldUpdatefooter then
     begin
        MasterSource:= wwGetControlDataSource(datasource.dataset);
        if MasterSource=nil then
           MasterSource:= wwGetControlMasterSource(datasource.dataset);
        if (MasterSource<>Nil) and (MasterSource.Dataset<>Nil) then
        begin
           MasterBookmark:= MasterSource.dataset.GetBookmark;
           if MasterBookmark<>nil then { 1/9/98 - Check for nil bookmark }
           begin
              res:= wwDataSetCompareBookmarks(MasterSource.DataSet,
                     MasterBookmark, lastMasterBookmark);
              if (res<>CMPKeyEql) and (res<>CMPEql) then
                 ShouldUpdateFooter:= True;
              MasterSource.dataset.FreeBookmark(LastMasterBookmark);
              LastMasterBookmark:= MasterBookmark;
           end
        end;
     end;

     { Handles record deletions }
     if not ShouldUpdateFooter then
     begin
        if (lastbookmark<>nil) and
           (not datasource.dataset.bookmarkvalid(lastbookmark)) then
           ShouldUpdateFooter:= True;
     end;

     if ShouldUpdateFooter then DoUpdateFooter;
     ShouldUpdateFooter:= False;
  end;

end;

procedure TwwCustomDBGrid.DataChanged;
begin
  if not HandleAllocated then Exit;
  if SkipDataChange then exit;

  CheckFooterUpdate;

  { Fix - (8/25/96) Required when canceling insert with navigator }
  { 2/12/97 - This line used to be after the call to InvalidateEditor }
  { By putting it before UpdateRowCount then screen painting is more optimized }
  { 2/17/99 - Include dsInsert as Hidecontrols case }
  { 3/30/99 - Only include Insert if the dataset is not empty }
  if (not SkipHideControls) and (DataSource.state = dsInsert) and
     not (Datasource.dataset.bof and Datasource.Dataset.eof) then
     HideControls;
  if (not SkipHideControls) and (DataSource.state in [dsBrowse]) then HideControls;
  UpdateRowCount;
  UpdateScrollBar;
  UpdateActive;
  InvalidateEditor;

  { Fix - (8/25/96) Required when canceling insert with navigator }
{  if (not SkipHideControls) and (DataSource.state=dsBrowse) then HideControls;}

  ValidateRect(Handle, nil);
  Invalidate;

  DoCheckRowChanged;
end;

procedure TwwCustomDBGrid.EditingChanged;
begin
  if dgIndicator in Options then InvalidateCell(0, FSelRow);
end;

procedure TwwCustomDBGrid.RecordChanged(Field: TField);
var
  R: TRect;
  InvBegin, InvEnd: Integer;
begin
  if not HandleAllocated then Exit;

  InvBegin := 0;
  if Field = nil then InvEnd := ColCount - 1 else
  begin
    for InvBegin := 0 to FieldCount - 1 do
      if Fields[InvBegin] = Field then Break;
    InvEnd := InvBegin;
  end;
  R := BoxRect(InvBegin + FIndicatorOffset, Row, InvEnd + FIndicatorOffset,
    Row);
  InvalidateRect(Handle, @R, False);
  if ((Field = nil) or (SelectedField = Field)) and
    (SelectedIndex<FieldCount) and  { 6/17/97}
    (Fields[SelectedIndex].Text <> FEditText) then
  begin
    InvalidateEditor;
    if InplaceEditor <> nil then InplaceEditor.Deselect;
  end;

end;

procedure TwwCustomDBGrid.FieldChanged(Field: TField);
begin
  DoFieldChanged(Field);
end;

procedure TwwCustomDBGrid.DoFieldChanged(Field: TField);
begin
  if Assigned(FOnFieldChanged) then
     FOnFieldChanged(self, Field);
end;

{function TwwCustomDBGrid.Edit: Boolean;
begin
  Result := False;
  if not ReadOnly then
  begin
    FDataChanged := False;
    FEditRequest := True;
    try
      FDataLink.Edit;
    finally
      FEditRequest := False;
    end;
    Result := FDataChanged;
  end;
end;
}
procedure TwwCustomDBGrid.Scroll(Distance: Integer);
var
  OldRect, NewRect: TRect;
  RowHeight: Integer;
begin
  if not HandleAllocated then Exit;  { 6/2/97}

  OldRect := BoxRect(0, Row, ColCount - 1, Row);
  UpdateScrollBar;
  UpdateActive;
  NewRect := BoxRect(0, Row, ColCount - 1, Row);
  ValidateRect(Handle, @OldRect);
  InvalidateRect(Handle, @OldRect, False);
  InvalidateRect(Handle, @NewRect, False);

  {$ifdef win32}
  HideEditor;  { 10/20/96 - Always hide editor if this method is called }
  {$endif}

  if Distance <> 0 then
  begin
    {$ifndef win32}
    HideEditor;
    {$endif}

    HideControls;
    try
      if Abs(Distance) > VisibleRowCount then
      begin
	{ Update bookmarks }
	Invalidate;
	Exit;
      end
      else
      begin
	RowHeight := DefaultRowHeight;
	if dgRowLines in Options then Inc(RowHeight);
	NewRect := BoxRect(FIndicatorOffset, FTitleOffset, ColCount - 1, 1000);
        { 12/8/97 - Use ScrollWindowEx so background isn't cleared before painting }
        ScrollWindowEx(Handle, 0, -RowHeight * Distance, @NewRect, @NewRect,
          0, nil, SW_Invalidate);
	if dgIndicator in Options then
	begin
	  OldRect := BoxRect(0, FSelRow, ColCount - 1, FSelRow);
	  InvalidateRect(Handle, @OldRect, False);
	  NewRect := BoxRect(0, Row, ColCount - 1, Row);
	  InvalidateRect(Handle, @NewRect, False);
	end;
      end;
    finally {1/2/96 - Don't show editor for memo}
      if (dgAlwaysShowEditor in Options) and (not isWWControl(col, row)) and
	 (not isMemoField(Col, Row)) then
	 ShowEditor;
    end;
  end;
  if (not SuppressShowEditor) and visible then Update;
  if (Distance<>0) then DoTopRowChanged;
  DoCheckRowChanged;
end;

procedure TwwCustomDBGrid.DoTopRowChanged;
begin
   if Assigned(FOnTopRowChanged) then FOnTopRowChanged(self);
end;

procedure TwwCustomDBGrid.DoRowChanged;
begin
   if Assigned(FOnRowChanged) then FOnRowChanged(self);
   DoCellChanged;
end;

procedure TwwCustomDBGrid.DoCheckRowChanged;
var curBookmark: TBookmark;
    res: CmpBkmkRslt;
    tempDisable: boolean;
begin
//   if GetColField(dbCol(Col))<>Nil then
//      OriginalCellText:= GetColField(dbCol(Col)).asString
//   else OriginalCellText:= '';

   tempDisable:= DisableCellChangedEvent;
   try
      if (Datasource<>nil) and (Datasource.dataset<>Nil) and
         (Datasource.dataset.active) and
         (Assigned(FOnRowChanged) or
          Assigned(FOnCellChanged) or
          Assigned(FOnUpdateFooter)) then
      begin
         curBookmark:= Datasource.dataset.GetBookmark;
         if lastBookmark=nil then begin
            DoRowChanged;
            DisableCellChangedEvent:= True;
         end
         else if curBookmark<>nil then begin { 11/24/98 - Check for nil curbookmark }
            res:= wwDataSetCompareBookmarks(DataSource.DataSet, curBookmark, lastBookmark);
            if (res<>CMPKeyEql) and (res<>CMPEql) then begin
               DoRowChanged;
               DisableCellChangedEvent:= True;
            end
         end
         else if (datasource.state=dsInsert) then begin { 1/31/99 - Support OnRowChanged for insert }
            if (lastBookmark<>nil) then begin
               DoRowChanged;
               DisableCellChangedEvent:= True;
            end
         end;

         if lastbookmark<>nil then Datasource.dataset.FreeBookmark(lastBookmark);
         lastBookmark:= curBookmark;
      end;

      if CallColEnter then begin
         CallColEnter:= False;
         ColEnter;
         DoUpdateFooter;
      end;
   finally
      DisableCellChangedEvent:= tempDisable;
   end;

   FreeHintWindow;

end;

procedure TwwCustomDBGrid.TitleFontChanged(Sender: TObject);
begin
  if (not FSelfChangingTitleFont) and not (csLoading in ComponentState) then
    ParentFont := False;
  if dgTitles in Options then LayoutChanged;
end;

procedure TwwCustomDBGrid.UpdateData;
var NewDate, NewTime: TDateTime;
    editor: TwwInplaceEdit;
    FOnInvalidValue: TwwInvalidValueEvent;
begin
   if (InplaceEditor <> nil) then
   begin
      editor:= TwwInplaceEdit(InplaceEditor);
      if (editor.HavePictureMask) and FDataLink.isFieldModified and
	 (not editor.IsValidPictureValue(editor.Text)) and
	    (not editor.Picture.AllowInvalidExit) then
      begin
//	 editor.SelectAll;
//	 editor.SetFocus;
//	 FDataLink.Modified; {SetFocus clears modified so set it back to true }

         {7/3/97 - Use OnInvalidValue }
         FOnInvalidValue := wwGetOnInvalidValue(FDataLink.DataSet);
         if Assigned(FOnInvalidValue) then
         begin
            FOnInvalidValue(FDataLink.DataSet, GetColField(dbCol(Col)));
         end
         else ValidationErrorUsingMask(GetColField(dbCol(Col)));

	 exit;
      end
   end;


  if FieldCount > 0 then with Fields[SelectedIndex] do
  begin
     { Handle 2 digit year logic }
     if (self is TwwDBGrid) then
        TwwDBGrid(self).Patch[0]:= (Text=FEditText); { 9/24/98 - Prevent recursion by comparing text}

     if (Fields[SelectedIndex] is TDateTimeField) and
        wwStrToDate(FEditText) then
     begin
        { Uses 1950 as Epoch Date for 2 digt years }
        if wwScanDate(FEditText, NewDate) then { 10/12/98 - Avoid converting 4 digit years}
        begin
           NewTime:= Frac(StrToDateTime(FEditText));
           TDateTimeField(Fields[SelectedIndex]).asDateTime:= NewDate + NewTime;
        end;
     end
     else
        Text := FEditText;

     if (self is TwwDBGrid) and (TwwDBGrid(self).Patch[0]=False) then
        FieldChanged(Fields[SelectedIndex]); { 9/2/98 }
  end
end;

procedure TwwCustomDBGrid.UpdateActive;
var
  NewRow: Integer;
begin
  if FDatalink.Active then
  begin
    NewRow := FDatalink.ActiveRecord + FTitleOffset;
    if Row <> NewRow then
    begin
      if not (dgAlwaysShowEditor in Options) then HideEditor;
      if NewRow>VisibleRowCount then
      begin
	 UpdateRowCount; { Avoid index out of range }
	 NewRow:= VisibleRowCount + FTitleOffset - 1;  { 12/7/96 - Subtract 1 }
      end;
      {$ifdef win32}
      MoveColRow(Col, NewRow, False, False);
      {$else}
      Row := NewRow;
      {$endif}
    end;
    if (SelectedIndex>=0) and
       (FieldCount > 0) and (Fields[SelectedIndex].Text <> FEditText) then
      InvalidateEditor;
  end;
end;

function TwwCustomDBGrid.GetColField(ACol: Integer): TField;
begin
  Result := nil;
  if (ACol >= 0) and FDatalink.Active and (ACol < FDataLink.FieldCount) then
    Result := FDatalink.Fields[ACol];
end;

function TwwCustomDBGrid.GetFieldValue(ACol: Integer): string;
var
  Field: TField;
begin
  Result := '';
  Field := GetColField(ACol);
  if Field <> nil then Result := Field.DisplayText;
end;

procedure TwwCustomDBGrid.UpdateScrollBar;
var
  Pos: Integer;
  recNum, recCount: longint;
  sequencable: boolean;
begin
  if not FShowVertScrollBar then exit;

  if FDatalink.Active and HandleAllocated then
  begin

    { Set scroll bar precisely }
    recNum:= 0; { Make compiler happy}
    recCount:= 0;  { Make compiler happy}

    {$ifdef wwDelphi3Up}
    sequencable:= FDataLink.DataSet.isSequenced;
    if sequencable then begin
       FDataLink.DataSet.UpdateCursorPos;
       recCount:= FDataLink.DataSet.RecordCount;
       if recCount>=0 then
          recNum:= FDataLink.DataSet.RecNo;
    end;
    {$else}
    sequencable:= (FDataLink.DataSet is TwwTable)  and (FDataLink.DataSet as TwwTable).isSequencable;
    if sequencable then with FDataLink.DataSet do begin
       UpdateCursorPos;
       if dbiGetRecordCount(Handle, recCount)<>0 then sequencable:= False;
       if dbiGetSeqNo(Handle, recNum)<>0 then sequencable:= False;
    end;
    {$endif}
    if sequencable then with FDataLink.DataSet do
    begin
       if recCount<2 then recCount:= 2;
       SetScrollRange(Self.Handle, SB_VERT, 0, GridScrollSize, False);
       if BOF then Pos := 0
       else if EOF then Pos := GridScrollSize
       else Pos:= ((recNum-1) * GridScrollSize) div (recCount-1);
       if GetScrollPos(Self.Handle, SB_VERT) <> Pos then
       SetScrollPos(Self.Handle, SB_VERT, Pos, True);
       exit;
    end;

    with FDatalink.DataSet do
    begin
      SetScrollRange(Self.Handle, SB_VERT, 0, 4, False);
      if BOF then Pos := 0
      else if EOF then Pos := 4
      else Pos := 2;
      if GetScrollPos(Self.Handle, SB_VERT) <> Pos then
	SetScrollPos(Self.Handle, SB_VERT, Pos, True);

    end
  end
end;

procedure TwwCustomDBGrid.UpdateRowCount;
begin
  if InUpdateRowCount then exit;  { Prevent recursion }
  InUpdateRowCount:= True;

  if RowCount <= FTitleOffset then RowCount := FTitleOffset + 1;
  FixedRows := FTitleOffset;
  with FDataLink do
    if not Active or (RecordCount = 0) then
      RowCount := 1 + FTitleOffset
    else
    begin
      RowCount := 1000;

      {6/23/97 - Toprow has changed so repaint grid }
      if (FDataLink.Buffercount>VisibleRowCount) and (row>=VisibleRowCount+FTitleOffset) then
      begin
         invalidate;
         DoTopRowChanged;
      end;

      FDataLink.BufferCount := VisibleRowCount;
      RowCount := RecordCount + FTitleOffset;
      UpdateActive;
    end;

  InUpdateRowCount:= False;
end;

function TwwCustomDBGrid.AcquireFocus: Boolean;
begin
  Result := True;
  if FAcquireFocus and CanFocus and not (csDesigning in ComponentState) then
  begin
    SetFocus;
    Result := Focused or (InplaceEditor <> nil) and InplaceEditor.Focused;
  end;
end;

procedure TwwCustomDBGrid.CMParentFontChanged(var Message: TMessage);
begin
  inherited;
  if ParentFont then
  begin
    FSelfChangingTitleFont := True;
    try
      TitleFont := Font;
    finally
      FSelfChangingTitleFont := False;
    end;
    LayoutChanged;
  end;
end;

Function TwwCustomDBGrid.AllowCancelOnExit: boolean;
begin
   result:= True;
end;

procedure TwwCustomDBGrid.CMExit(var Message: TMessage);
begin
  try
    if FDatalink.Active then
      with FDatalink.Dataset do
	if (dgCancelOnExit in Options) and (State = dsInsert) and
	  not Modified and not FDatalink.FModified and AllowCancelOnExit then
	  Cancel else
	  FDataLink.UpdateData;
  except
    SetFocus;
    exit;  { Raise causes problems with Delphi being confused on who has focus }
//    raise;
  end;
  inherited;
end;

procedure TwwCustomDBGrid.CMFontChanged(var Message: TMessage);
begin
  inherited;
  LayoutChanged;
end;

procedure TwwCustomDBGrid.CMDesignHitTest(var Msg: TCMDesignHitTest);
begin
  inherited;
  if Msg.Result = 0 then
    with MouseCoord(Msg.Pos.X, Msg.Pos.Y) do
      if (X >= FIndicatorOffset) and (Y < FTitleOffset) then Msg.Result := 1;
  if (Msg.Result = 1) and ((FDataLink = nil) or FDataLink.DefaultFields or
    not FDataLink.Active) then
    Msg.Result := 0;
end;

procedure TwwCustomDBGrid.WMSetCursor(var Msg: TWMSetCursor);
begin
  if (csDesigning in ComponentState) and ((FDataLink = nil) or
    not FDataLink.Active) then
    WinProcs.SetCursor(LoadCursor(0, IDC_ARROW))
  else inherited;
end;

procedure TwwCustomDBGrid.WMSize(var Message: TWMSize);
begin
  inherited;
  if FUpdateLock = 0 then
  begin
     HideControls;   {10/9/96 - in case of resize}
     HideEditor;     {10/9/96 - in case of resize }
     UpdateRowCount;
     if AllowPerfectFit then DoPerfectFit;

     { 9/2/98 - Fix bug where footer is not cleared when maximizing}
     if (Datasource<>nil) and (datasource.dataset<>nil) and
        (FDataLink<>Nil) and (FDataLink.Active) and
        (Datasource.dataset.bof and datasource.dataset.eof) then Invalidate;
  end
end;

Function TwwCustomDBGrid.IsScrollBarVisible: boolean;
  function getWidth: integer;
  var i: integer;
      CWidth: Integer;
      tempGridLineWidth: integer;
  begin
     if dgColLines in Options then tempGridLineWidth:= GridLineWidth
     else tempGridLineWidth:= 0;

     cWidth:= 1;
     if ShowVertScrollBar then cwidth:= GetSystemMetrics(SM_CXHThumb) + 1;
     for i:= 0 to ColCount-1 do
	CWidth:= CWidth + ColWidths[i] + TempGridLineWidth;
     result:= CWidth;
  end;
begin
    if (GetWidth > Width) then
    begin
       if ShowHorzScrollBar then
	  result:= True
       else result:= False;
    end
    else result:= False;
end;

Function TwwCustomDBGrid.AllowPerfectFit: boolean;
begin
   result:= False;
   if not (Align in [alTop, alBottom, alClient]) and
      (dgPerfectRowFit in Options) then
      if (csDesigning in ComponentState) and not (csLoading in ComponentState) then
	 result:= True;
end;

Function TwwCustomDBGrid.DoPerfectFit: boolean;
var newHeight: integer;
    NextToBottomCell: TRect;
    BottomCellTop: integer;
    offset: integer;
    ScrollBarVisible: boolean;
begin
   NextToBottomCell:= CellRect(0, RowCount-1);
   BottomCellTop:= NextToBottomCell.Top + DefaultRowHeight + 1;
   newHeight:= Height;
   ScrollBarVisible:=  isScrollBarVisible;
   {$ifdef win32}
   if ScrollBarVisible then offset:= 5
   else offset:= 4;
   {$else}
   if ScrollBarVisible then offset:= 3
   else offset:= 2;
   if not (dgRowLines in Options) then offset:= offset - 1;
   {$endif}
   if (ScrollBarVisible) then begin
      if ((BottomCellTop + GetSystemMetrics(SM_CYHSCROLL) + DefaultRowHeight + offset - 1)>self.height) then
      begin
	 newHeight:= BottomCellTop + GetSystemMetrics(SM_CYHSCROLL) + offset - 1;
      end
   end
   else begin
      if ((BottomCellTop + DefaultRowHeight + offset)>self.height) then
      begin
	 newHeight:= BottomCellTop + offset;
      end
   end;

   { Auto-shrink grid height}
   if (newHeight<>height) then begin
      height:= newHeight;
      result:= True;
   end
   else result:= False;
end;

procedure TwwCustomDBGrid.WMVScroll(var Message: TWMVScroll);
  procedure NextRow;
  begin
    with FDatalink.Dataset do
    begin
      if (State = dsInsert) and not Modified and not FDatalink.FModified then
	if EOF then Exit else Cancel
      else begin
	 { Already pointing to end of table but active record is before this. 10/15/96 - dsInsert should not increment}
	 if Eof and (FDataLink.ActiveRecord>=0) and  { IP2 - Used to be >0, now >=0 }
	     (FDataLink.ActiveRecord<FDataLink.RecordCount-1) and not (State=dsInsert) then
	    FDataLink.ActiveRecord:= FDataLink.ActiveRecord + 1
	 else Next;
      end;
    end;
  end;

  procedure PriorRow;
  begin
    with FDatalink.Dataset do
      if (State = dsInsert) and not Modified and EOF and
	not FDatalink.FModified then
	Cancel
      else begin
	if BOF and (FDataLink.ActiveRecord>0) then
	   FDataLink.ActiveRecord:= FDataLink.ActiveRecord - 1
	else Prior;
      end
  end;

  Function Sequencable: boolean;
  begin
    {$ifdef wwDelphi3Up}
    result:= FDataLink.DataSet.isSequenced;
    {$else}
     if (FDatalink.Dataset is TwwTable) then
	result:= (FDataLink.DataSet as TwwTable).isSequencable
     else result:= False;
     {$endif}
  end;


  procedure ParadoxPosition;
  var recNum : Longint;
      {$ifndef wwDelphi3Up}
      recCount: Longint;
      {$endif}
  begin
     {$ifdef wwDelphi3Up}
     with FDataLink.DataSet do begin
        recNum:= (Message.Pos * recordCount) div GridScrollSize;
        checkBrowseMode;
        RecNo:= recNum+1;
        resync([]);
     end;
     {$else}
     if (FDatalink.Dataset is TwwTable) then with FDataLink.DataSet as TwwTable do
     begin
	if isSequencable and (dbiGetRecordCount(Handle, recCount)=0) then
	begin
	   recNum:= (Message.Pos * recCount) div GridScrollSize;
	   checkBrowseMode;
	   dbiSetToSeqNo(Handle, recNum+1);
	   resync([]);
	end
     end;
     {$endif}
  end;

begin
  if not AcquireFocus then Exit;
  if FDatalink.Active then
    with Message, FDataLink.DataSet, FDatalink do
      case ScrollCode of
	SB_LINEUP: PriorRow;  {MoveBy(-ActiveRecord - 1); }
	SB_LINEDOWN: NextRow; {MoveBy(RecordCount - ActiveRecord);}
	SB_PAGEUP: MoveBy(-VisibleRowCount);
	SB_PAGEDOWN: MoveBy(VisibleRowCount);
	SB_THUMBPOSITION:
	  begin
	    if Sequencable then begin
	       if pos=0 then First
	       else if pos=GridScrollSize then Last
	       else ParadoxPosition;
	    end
	    else begin
	       case Pos of
		 0: First;
		 1: MoveBy(-VisibleRowCount);
		 2: exit;
		 3: MoveBy(VisibleRowCount);
		 4: Last;
	       end;
	    end
	  end;

	SB_BOTTOM: Last;
	SB_TOP: First;
      end;
end;

function TwwCustomDBGrid.HighlightCell(DataCol, DataRow: Integer;
  const Value: string; AState: TGridDrawState): Boolean;
begin
  Result := (gdSelected in AState) and ((dgAlwaysShowSelection in Options) or
    Focused);
  if (dgMultiSelect in Options) and not (gdFixed in AState) then { 2/21/99 - RSW, Don't highlight if fixed }
  begin
     result:= isSelectedRow(DataRow);
  end
end;

procedure TwwCustomDBGrid.DefaultDrawDataCell(const Rect: TRect; Field: TField;
  State: TGridDrawState);
//const
//  Formats: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT,
//    DT_CENTER or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX);
var
  Alignment: TAlignment;
  Value: string;
  {$ifndef win32}
  SPtr: array[0..255] of char;
  {$endif}
begin
  Alignment := taLeftJustify;
  Value := '';
  if Field <> nil then
  begin
    Alignment := Field.Alignment;
    Value := Field.DisplayText;
  end;
  {$ifdef win32}
  wwWriteTextLines(Canvas, Rect, 2, 2, PChar(Value), Alignment, []);
  {$else}
  wwWriteTextLines(Canvas, Rect, 2, 2, StrPCopy(SPtr, Value), Alignment, []);
  {$endif}
//  WriteText(Canvas, Rect, 2, 2, Value, Alignment);
end;

  Function TwwCustomDBGrid.CellColor(ACol, ARow: integer): TColor;
  begin
     result:= Color;
  end;

  procedure TwwCustomDBGrid.Draw3DLines(ARect: TRect; ACol, ARow: integer;
	    AState: TGridDrawState);
  var ACanvas: TCanvas;
      OrigPenColor: TColor;
  begin
     if SkipLineDrawing then exit;

     SkipLineDrawing:= True;

     { 4/16/97 - Treat as non-3d when white background }
           { Exit if highlighted cell, and background color is same as highlight }
     if (ACol>=FIndicatorOffset) and (ARow>=FTitleOffset) and (ColorToRGB(Color)=clWhite) then
     begin
        if isWhiteBackground then exit
        else if HighlightCell(ACol, dbRow(ARow), '', AState) and
               (ColorToRGB(Canvas.Brush.Color)=ColorToRGB(clHighLight)) then exit;
     end;
     ACanvas:= Canvas;

     with ACanvas do begin
        OrigPenColor:= Pen.Color; { 10/15/97 - Save and restore pen color later }
	with ARect do
	begin
	   if (Ctl3D) or (dbrow(ARow)=-1) or (dbcol(ACol)=-1) then
	   begin
	      Pen.Color := clBtnHighlight;
//	      Pen.Color := clBlack;
	      Pen.Width:= 1;
	      if dgColLines in Options then begin
		if not (dgRowLines in Options) then begin
		   PolyLine([Point(Left, Bottom), Point(Left, Top-1)]);
                   Pen.Color:= clBtnShadow;
                   if (ACol>=FIndicatorOffset) then
                     PolyLine([Point(Right, Bottom-1), Point(Right, Top-1)]); { 7/18/98 - Change to Bottom - 1}
                   Pen.Color:= clBtnHighlight;
                end
		else begin
		   if isWhiteBackground then begin
		      PolyLine([Point(Left, Bottom), Point(Left, Top)]);
		   end
		   else begin
		      if not isDrawFocusRect then
			PolyLine([Point(Left, Bottom), Point(Left, Top)]);
		      if gdFixed in AState then Pen.Color:= clBlack
		      else Pen.Color:= clBtnShadow;     {Changed from clGray - 5/09/97}
		      PolyLine([Point(Right, Bottom), Point(Right, Top)]);
		      Pen.Color:= clBtnHighlight;
		   end
		end
	      end;

              {Retest all combinations - 5/9/97 !!!!}
              if ColorToRGB(Color)=clWhite then begin
                 if (dbRow(ARow)=-1) and (not (dgRowLines in Options)) then
                 begin
                    Pen.Color:= clBlack;
		    PolyLine([Point(Left, Bottom-1), Point(Right, Bottom-1)]);
                 end
              end;

	      if (not (dgRowLines in Options)) and (dbRow(ARow)=0) and (dbCol(ACol)=-1) and
                 (FIndicatorButton<>Nil) then
              begin
		 PolyLine([Point(Left, Top-0), Point(Right, Top-0)]);
		 Pen.Color:= clBtnShadow;     {Changed from clGray - 5/09/97}
		 PolyLine([Point(Left, Top-1), Point(Right, Top-1)]);
	      end
	      else if (dgRowLines in Options) then begin
		 if isWhiteBackground then begin
		    PolyLine([Point(Left, Top), Point(Right, Top)]);
                    Pen.Color:= clBtnHighlight;
		 end
		 else begin
		    if not isDrawFocusRect then begin
		       Pen.Color:= clBtnHighlight;    {Changed from clWhite - 5/09/97}
		       PolyLine([Point(Left, Top), Point(Right, Top)]);
		    end;

		    if gdFixed in AState then Pen.Color:= clBlack
		    else Pen.Color:= clBtnShadow;     {Changed from clGray - 5/09/97}
		    if (dgRowLines in Options) then
		       PolyLine([Point(Left, Bottom), Point(Right, Bottom)]);
		 end
	      end
              { Make TopFixedRow look 3d}
              else if (dbRow(ARow)=-1) then begin
                 Pen.Color:= clBtnHighlight;
		 PolyLine([Point(Left, Top), Point(Right, Top)]);
              end
	   end
	   else begin
	   end
	end;
        Pen.Color:= OrigPenColor;
     end;
  end;

    procedure TwwCustomDBGrid.DrawCheckBox_Checkmark(ARect: TRect; ACol, ARow:
      integer; val: boolean);
    const ItemChecked: array[Boolean] of Integer = (0, DFCS_CHECKED);
//          CheckBoxFlat: array[Boolean] of Integer = (0, DFCS_FLAT);
//          CheckboxDisabled: array[Boolean] of Integer = (0, DFCS_INACTIVE);
    var ACanvas : TCanvas;
        TempReadOnly: boolean;
    begin

       ACanvas:= DrawBitmap.Canvas; { 8/12/97 - Draw to bitmap canvas for performance }

{           ARect.Left:= ARect.Left - 1;
           ARect.Top:= ARect.Top - 1;
           ARect.Right:= ARect.Right + 2;
           ARect.Bottom:= ARect.Bottom + 2;

           DrawFrameControl(Canvas.Handle, ARect,
              DFC_BUTTON,
              DFCS_BUTTONCHECK or ItemChecked[val] or
              CheckboxDisabled[ColumnByName(GetColField(dbCol(ACol)).FieldName).ReadOnly]);
           exit;
 }

       with DrawBitmap do
       begin
          Width := self.width;
          Height := self.height;
       end;

       ACanvas.Pen.Width:= 1;
       TempReadOnly:= ColumnByName(GetColField(dbCol(ACol)).FieldName).ReadOnly;
       if TempReadOnly then
          ACanvas.Brush.Color := clInactiveBorder
       else
          ACanvas.Brush.Color := clWindow;

       { Draw checkbox frame }
       ACanvas.FillRect(ARect);
       ACanvas.Pen.Color:= clBlack;
       ACanvas.MoveTo(ARect.right-1, ARect.Top);
       ACanvas.LineTo(ARect.left, ARect.Top);
       ACanvas.LineTo(ARect.left, ARect.Bottom);

//       ACanvas.Pen.Color:= clGrayText;
       ACanvas.Pen.Color:= cl3dLight;
       ACanvas.MoveTo(ARect.left, ARect.Bottom);
       ACanvas.LineTo(ARect.right, ARect.Bottom);
       ACanvas.LineTo(ARect.right, ARect.Top-1);

       ACanvas.Pen.Color:= clWhite;
       ACanvas.MoveTo(ARect.left-1, ARect.Bottom+1);
       ACanvas.LineTo(ARect.right+1, ARect.Bottom+1);
       ACanvas.LineTo(ARect.right+1, ARect.Top-2);

       ACanvas.Pen.Color:= clGray;
       ACanvas.MoveTo(ARect.right, ARect.Top-1);
       ACanvas.LineTo(ARect.left-1, ARect.Top-1);
       ACanvas.LineTo(ARect.left-1, ARect.Bottom+1);

       if val then begin
          if TempReadOnly then
             ACanvas.Pen.Color:= clInactiveCaption
          else
             ACanvas.Pen.Color:= clBlack;

         { Draw TICKmark lines }
         ACanvas.Pen.Width:=1;

         ACanvas.MoveTo(ARect.Left+2,ARect.Top+8 div 2);
         ACanvas.LineTo(ARect.Left+2,ARect.Bottom-3);
         ACanvas.MoveTo(ARect.Left+3,ARect.Top+10 div 2);
         ACanvas.LineTo(ARect.Left+3,ARect.Bottom-2);
         ACanvas.MoveTo(ARect.Left+4,ARect.Top+12 div 2);
         ACanvas.LineTo(ARect.Left+4,ARect.Bottom-1);
         ACanvas.MoveTo(ARect.Left+5,ARect.Top+10 div 2);
         ACanvas.LineTo(ARect.Left+5,ARect.Bottom-2);
         ACanvas.MoveTo(ARect.Left+6,ARect.Top+8 div 2);
         ACanvas.LineTo(ARect.Left+6,ARect.Bottom-3);
         ACanvas.MoveTo(ARect.Left+7,ARect.Top+6 div 2);
         ACanvas.LineTo(ARect.Left+7,ARect.Bottom-4);
         ACanvas.MoveTo(ARect.Left+8,ARect.Top+4 div 2);
         ACanvas.LineTo(ARect.Left+8,ARect.Bottom-5);
      end;
      if Canvas<>ACanvas then begin
         Canvas.CopyMode := cmSrcCopy;
         InflateRect(ARect, 1, 1);
         ARect.right:= ARect.right + 1;
         ARect.bottom:= ARect.bottom + 1;
         Canvas.CopyRect(ARect, ACanvas, ARect);
      end

{       if val then begin
         ACanvas.Pen.Color:= clBlack;
         ACanvas.Pen.Width:=1;
         ACanvas.MoveTo(ARect.Left+2,ARect.Top+13 div 2+1);
         ACanvas.LineTo(ARect.Left+2,ARect.Bottom-1);
         ACanvas.MoveTo(ARect.Left+3,ARect.Top+13 div 2);
         ACanvas.LineTo(ARect.Left+3,ARect.Bottom-2);
         ACanvas.MoveTo(ARect.Left+2,ARect.Bottom-1);
         ACanvas.LineTo(ARect.Right-2,ARect.Top+3);
         ACanvas.MoveTo(ARect.Left+3,ARect.Bottom-1);
         ACanvas.LineTo(ARect.Right-1,ARect.Top+3);
      end;}
  end;

  procedure TwwCustomDBGrid.DrawCheckBox(ARect: TRect; ACol, ARow: integer; val: boolean);
  var ACanvas : TCanvas;
  begin
      if (wwInternational.CheckBoxInGridStyle=cbStyleCheckmark) or
         (NewStyleControls and (wwInternational.CheckBoxInGridStyle=cbStyleAuto)) then
      begin
         DrawCheckBox_Checkmark(ARect, ACol, ARow, val);
         exit;
      end;

      ACanvas:= DrawBitmap.Canvas; { Draw to bitmap canvas for performance }

      with DrawBitmap do
      begin
	Width := self.width;
	Height := self.height;
      end;

      ACanvas.Pen.Width:= 1;
      ACanvas.Brush.Color := clWindow;

      { Draw checkbox frame }
      ACanvas.FillRect(ARect);
      ACanvas.Pen.Color:= clBlack;
      ACanvas.MoveTo(ARect.right-1, ARect.Top);
      ACanvas.LineTo(ARect.left, ARect.Top);
      ACanvas.LineTo(ARect.left, ARect.Bottom+1);

      ACanvas.Pen.Color:= clGrayText;
      ACanvas.MoveTo(ARect.left+1, ARect.Bottom);
      ACanvas.LineTo(ARect.right, ARect.Bottom);
      ACanvas.LineTo(ARect.right, ARect.Top-1);

      ACanvas.Pen.Color:= clWhite;
      ACanvas.MoveTo(ARect.left, ARect.Bottom+1);
      ACanvas.LineTo(ARect.right+1, ARect.Bottom+1);
      ACanvas.LineTo(ARect.right+1, ARect.Top-1);

      ACanvas.Pen.Color:= clGray;
      ACanvas.MoveTo(ARect.right, ARect.Top-1);
      ACanvas.LineTo(ARect.left-1, ARect.Top-1);
      ACanvas.LineTo(ARect.left-1, ARect.Bottom+1);

      if val then begin
	 ACanvas.Pen.Color:= clBlack;

	{ Draw checkbox lines }
	 ACanvas.MoveTo(ARect.right-2, ARect.Top+2);
	 ACanvas.LineTo(ARect.left+1, ARect.Bottom-1);
	 ACanvas.MoveTo(ARect.right-3, ARect.Top+2);
	 ACanvas.LineTo(Arect.left+1, ARect.Bottom-2);
	 ACanvas.MoveTo(ARect.right-2, ARect.Top+3);
	 ACanvas.LineTo(ARect.left+2, ARect.Bottom-1);

	 ACanvas.MoveTo(ARect.left+2, ARect.Top+2);
	 ACanvas.LineTo(ARect.right-1, ARect.Bottom-1);
	 ACanvas.MoveTo(ARect.left+3, ARect.Top+2);
	 ACanvas.LineTo(ARect.right-1, ARect.Bottom-2);
	 ACanvas.MoveTo(ARect.left+2, ARect.Top+3);
	 ACanvas.LineTo(ARect.right-2, ARect.Bottom-1);
     end;

     if Canvas<>ACanvas then begin
	Canvas.CopyMode := cmSrcCopy;
	InflateRect(ARect, 1, 1);
	ARect.right:= ARect.right + 1;
	ARect.bottom:= ARect.bottom + 1;
	Canvas.CopyRect(ARect, ACanvas, ARect);
     end

  end;


Procedure TwwCustomDBGrid.DrawCell(ACol, ARow: Longint;
	 ARect: TRect; AState: TGridDrawState);
var
  OldActive: Integer;
  Alignment: TAlignment;
  Highlight: Boolean;
  Value: string;
  ATitleAlignment: TAlignment;
  TempDisplayLabel: string;
  APos, Index : integer;

  defaultTitleDrawing: boolean;
  ATextRect: TRect;
  TitleImageAttributes: TwwTitleImageAttributes;
  TitleOffset: integer;

  procedure showHighlight(ACanvas: TCanvas; const ARect: TRect; DX, DY: Integer);
  var text: string;
      S: array[0..1] of char;
  begin
     text:= '';
     s[0]:= #0;
     with ACanvas do
       ExtTextOut(Handle, ARect.Right - TextWidth(Text) - 3, ARect.Top + DY,
	   ETO_OPAQUE or ETO_CLIPPED, @ARect, s, Length(Text), nil)
  end;

  procedure Display(S: string; Alignment: TAlignment);
  const
    Formats: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT,
      DT_CENTER or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX);
  var
    {$ifndef win32}
    SPtr: array[0..255] of char;
    {$endif}
    ButtonOffset: integer;
    NumLines, startOffset: integer;
    WriteOptions: TwwWriteTextOptions;
  begin
    {11/26/97 - Only for title row}
    { 2/9/98 - Only depress currently clicked column }
    if FTitleButtons and (TitleClickColumn>=0) and (ARow<0) and
       (ACol+FIndicatorOffset=TitleClickColumn) then
       ButtonOffset:= 1
    else ButtonOffset:= 0;

    if (ARow<0) then begin
       if FTitleLines=1 then NumLines:= 1
       else NumLines:= strCount(s, '~')+1;
       startOffset:= Trunc((RowHeights[0]/2)-(0.5*NumLines *Canvas.Textheight(s)));
       {$ifNdef win32}
       inc(startOffset);
       {$endif}

       s:= strReplaceChar(s, '~',#13);
       WriteOptions:= [wtoEllipsis];
       If Assigned(FOnDrawTitleCell) then WriteOptions:= WriteOptions + [wtoMergeCanvas];
       if not useTfields then WriteOptions:= WriteOptions + [wtoAmpersandToUnderline];

//       if Alignment = taCenter then ATextRect.Right:= ATextRect.Right + 2* ButtonOffset;
       wwWriteTextLines(Canvas, ATextRect, 3+ButtonOffset, startOffset+ButtonOffset, PChar(s),
              Alignment, WriteOptions);
//       if Alignment = taCenter then ATextRect.Right:= ATextRect.Right - 2* ButtonOffset;
    end
    else begin
       WriteOptions:= [];
       { Ellipsis only supported for single line }
       if (dgTrailingEllipsis in Options) and
          wwIsSingleLineEdit(Canvas.Handle,ARect,
                DT_LEFT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX) then
          WriteOptions:= [wtoEllipsis];

       if not (dgWordWrap in Options) then begin
          if (dgTrailingEllipsis in Options) then
             WriteOptions:= [wtoEllipsis];

          { 12/4/98 - Fix problem when descenders cutoff when dgRowLines=False}
          if dgRowLines in Options then ButtonOffset:= 1;
	  wwWriteTextLines(Canvas, ARect, 3{+ButtonOffset} { 2/20/99 - Comment out ButtonOffset, Text too far to right before },
              (NormalPad div 2)+ButtonOffset, PChar(s), Alignment, WriteOptions); { 5/21/98 }
       end
       else begin
          WriteOptions:= WriteOptions + [wtoWordWrap];
          {$ifdef win32}
          if not (dgRowLines in Options) then { 1/8/99 - Fix descendor cutoff problem when wordwrap is true }
             wwWriteTextLines(Canvas, ARect, 3+ButtonOffset,
                (NormalPad div 2)+ButtonOffset, PChar(s), Alignment, WriteOptions)
          else wwWriteTextLines(Canvas, ARect, 3+ButtonOffset,
                (NormalPad div 2)+1+ButtonOffset, PChar(s), Alignment, WriteOptions);
          {$else}
          StrPCopy(SPtr, S);
	  wwWriteTextLines(Canvas, ARect, 3+ButtonOffset,
              (NormalPad div 2)+1+ButtonOffset, SPtr, Alignment, False);
          {$endif}
       end;
    end
  end;


  procedure SaveToBitmap(Bitmap: TBitmap; tempField: TField);
  type
    TGraphicHeader = record
      Count: Word;                { Fixed at 1 }
      HType: Word;                { Fixed at $0100 }
      Size: Longint;              { Size not including header }
    end;

  var
     {$ifdef wwDelphi3Up}
     BlobStream: TStream;
     {$else}
     BlobStream: TwwMemoStream;
     {$endif}
     Size: Longint;
     Header: TGraphicHeader;
  begin
     {$ifdef wwDelphi3Up}
     { Support TClientDataSet by using CreateBlobStream instead }
     BlobStream:= tempField.dataset.CreateBlobStream(tempField, bmRead);
     {$else}
     BlobStream := TwwMemoStream.Create(tempField as TBlobField);
     {$endif}

     try { Use try/except instead of try/finally for efficiency}
       Size := BlobStream.Size;
       if Size >= SizeOf(TGraphicHeader) then
       begin
	 BlobStream.Read(Header, SizeOf(Header));
	 if (Header.Count <> 1) or (Header.HType <> $0100) or
	   (Header.Size <> Size - SizeOf(Header)) then
	   BlobStream.Position := 0;
       end;
       Bitmap.LoadFromStream(BlobStream);
       BlobStream.Free;
     except
       BlobStream.Free;
     end;
  end;

  procedure DrawCellColors(tempField: TField; DrawFocus: boolean);
  begin
      with Canvas do begin
	 if gdFixed in AState then Brush.Color := TitleColor
	 else Brush.Color := Color;

	 FCalcCellRow:= ARow;
	 if dgTitles in Options then Dec(FCalcCellRow, 1);
	 FCalcCellCol:= ACol;
	 if dgIndicator in Options then Dec(FCalcCellcol, 1);

	 Highlight := HighlightCell(ACol, FCalcCellRow, Value, AState);
	 if Highlight then
	 begin
	   Brush.Color := clHighlight;
	   Font.Color := clHighlightText;
	 end;

	 DoCalcCellColors(tempField, AState, Highlight, Font, Brush); {new code}

         showHighlight(Canvas, ARect, 2, 2); {Call after brush and font are set }

	 if Highlight then begin
	   if not (csDesigning in ComponentState) and
		  (ValidParentForm(Self).ActiveControl = Self) then
	   begin
	      if not (dgRowSelect in Options) then begin
		 isDrawFocusRect:= True;
                 if DrawFocus then
                   WinProcs.DrawFocusRect(Canvas.Handle, ARect);
//                   wwDrawFocusRect(Canvas, ARect)
	      end
	   end
	 end;
      end;
  end;

  procedure DisplayBitMap(tempField: TField; Parameters: string);
  var myBitmap: TBitmap;
      SRect, DRect : TRect;
      tempBitmapField: TField; {win95}
      tempLookupValue: string;
      tempHeight, tempWidth: Longint;
      bitmapSubsetWidth, bitmapSubsetHeight: integer;
      PrevCopyMode: TCopyMode;
      bitmapSize, rasterOperation: string;
      APos: integer;
      cellWidth, cellHeight: integer;

      Function GetCopyMode(cm: string): TCopyMode;
      begin
	  Result:= cmSrcCopy;
	  if cm='Source Copy' then Result:= cmSrcCopy
	  else if cm='Source Paint' then Result:= cmSrcPaint
	  else if cm='Source And' then Result:= cmSrcAnd
	  else if cm='Source Invert' then Result:= cmSrcInvert
	  else if cm='Source Erase' then Result:= cmSrcErase
	  else if cm='Not Source Copy' then Result:= cmNotSrcCopy
	  else if cm='Not Source Erase' then Result:= cmNotSrcErase
	  else if cm='Merge Paint' then Result:= cmMergePaint
      end;

  begin
      Apos:= 1;
      BitmapSize:= strGetToken(Parameters, ';', APos);
      RasterOperation:= strGetToken(Parameters, ';', APos);
      cellWidth:= ARect.Right - ARect.Left;
      cellHeight:= ARect.Bottom - ARect.Top;

      if tempField.calculated then
      begin
	 if not wwDataSetLookupDisplayField(tempField, tempLookupValue, tempBitmapField) then
	 begin
	    DrawCellColors(tempField, True);   { Lookup failed }
	    exit;
	 end
      end

      { 7/10/97 - Support bitmaps with lookup fields - Only 1 field lookups supported}
      {$ifdef win32}
      else if tempField.lookup then begin
         if not wwDataSetFindRecord(tempField.LookupDataSet,
               tempField.DataSet.fieldByName(tempField.KeyFields).asString,
               tempField.LookupKeyFields, mtExactMatch, False) then
         begin
	    DrawCellColors(tempField, True);   { Lookup failed }
	    exit;
         end
         else TempBitmapField:= tempField.LookupDataSet.FieldByname(tempField.LookupResultField);
      end
      {$endif}
      else begin
	tempBitmapField:= tempField;
      end;

      myBitmap := TBitmap.Create;

      {7/23/97 - Display bitmaps even in insert mode if lookup bitmap }
      if tempField.calculated or
         {$ifdef win32}
         tempField.Lookup or
         {$endif}
         not ((DataSource.DataSet.State = dsInsert) and
	      (dbRow(row)=DataLink.ActiveRecord)) then SaveToBitmap(myBitmap, tempBitmapField);

      if (MyBitmap.height<=0) or (MyBitmap.width<=0) then
      begin
	 DrawCellColors(tempField, True);
	 myBitmap.Free;
	 exit;
      end;

      SRect  := classes.Rect(0, 0, myBitmap.Width, myBitmap.Height);

      PrevCopyMode:= Canvas.CopyMode;
      Canvas.CopyMode:= GetCopyMode(rasterOperation);
      DrawCellColors(tempField, True);

      if BitmapSize='Original Size' then
      begin
	 tempHeight:= cellHeight;
	 tempWidth:= cellWidth;
	 SRect  := classes.Rect(0, 0, min(myBitmap.Width, tempWidth-1),
				      min(myBitmap.Height, tempHeight - 1));
	 DRect  := classes.Rect(ARect.Left+1, ARect.Top + 1,
		ARect.Left + 1 + (SRect.Right - SRect.Left),
		ARect.Top + 1 + (SRect.Bottom - SRect.Top));

	 Canvas.CopyRect(DRect, myBitmap.Canvas, SRect);
      end
      else if BitmapSize='Stretch To Fit' then
      begin
	 Canvas.StretchDraw(ARect, myBitmap);
      end
      else if BitmapSize='Fit Height' then begin
	 { Paint bitmap portion that is shown.                  }
	 { BitmapSubsetWidth is portion of bitmap that is drawn }
	 tempHeight:= cellHeight;
	 tempWidth:= (myBitmap.Width * tempHeight) div myBitmap.Height;
	 if tempWidth > CellWidth then begin
	    BitmapSubsetWidth:= (myBitmap.width * cellWidth) div tempWidth;
	    tempWidth:= cellWidth; { Limit to cell's width }
	 end
	 else BitmapSubsetWidth:= myBitmap.width;

	 if (tempWidth>2) and (tempHeight>2) then begin
	    DRect  := classes.Rect(ARect.Left+1, ARect.Top,
		ARect.Left + tempWidth,
		ARect.Top + tempHeight - 1);
	    SRect  := classes.Rect(0, 0, BitmapSubsetWidth, myBitmap.Height);
	    Canvas.CopyRect(DRect, myBitmap.Canvas, SRect);
	 end
      end
      else if BitmapSize='Fit Width' then
      begin
	 { Paint bitmap portion that is shown.                   }
	 { BitmapSubsetHeight is portion of bitmap that is drawn }
	 tempWidth:= cellWidth;
	 tempHeight:= (myBitmap.Height * tempWidth) div myBitmap.Width;
	 if tempHeight > CellHeight then begin
	    BitmapSubsetHeight:= (myBitmap.height * cellHeight) div tempHeight;
	    tempHeight:= cellHeight; { Limit to cell's height }
	 end
	 else BitmapSubsetHeight:= myBitmap.Height;

	 if (tempWidth>2) and (tempHeight>2) then begin
	    DRect  := classes.Rect(ARect.Left+1, ARect.Top ,
		     ARect.Left+ tempWidth,
		     ARect.Top + tempHeight - 1);
	    SRect  := classes.Rect(0, 0, myBitmap.Width, BitmapSubsetHeight);
	    Canvas.CopyRect(DRect, myBitmap.Canvas, SRect);
	 end
      end;

      if Highlight then begin
	 Canvas.Brush.Color := clHighlight;
	 Canvas.FrameRect(ARect);
	 SkipLineDrawing:= True;
      end;
      Canvas.CopyMode:= PrevCopyMode;

      myBitmap.Free;
  end;



  procedure DisplayBitmapFromImageList(tempField: TField; Parameters: string);
  var myBitmap: TBitmap;
      SRect, DRect, bitmapRect : TRect;
      APos: integer;
      BitmapSize: string;
  begin
        DrawCellColors(tempField, False);
        myBitmap := TBitmap.Create;
        myBitmap.width:= ImageList.width;
        myBitmap.height:= ImageList.height;
        BitmapRect  := classes.Rect(0, 0, ImageList.width, ImageList.height);
        myBitmap.Canvas.Brush.Color:= Canvas.Brush.Color;
        SRect  := classes.Rect(0, 0, min(ARect.right-Arect.Left-2, myBitmap.Width),
                            min(Arect.Bottom-Arect.Top-2, myBitmap.Height));
        myBitmap.Canvas.FillRect(BitmapRect);

        if (not tempField.isNull) then
        begin
           if (tempField is TIntegerField) and (tempField.asInteger>=0) then
             ImageList.Draw(MyBitmap.Canvas, 0, 0, tempField.asInteger)
           else if (tempField is TFloatField) and (tempField.asFloat>=0) then
             ImageList.Draw(MyBitmap.Canvas, 0, 0, trunc(tempField.asFloat))
        end;

        DRect.left:= max(ARect.Left, (ARect.Left + ARect.right - ImageList.Width) div 2);
        DRect.top:= max(ARect.Top, (ARect.Top + ARect.Bottom - ImageList.height) div 2);
        DRect.right:= DRect.left +
           Min(myBitmap.width, ARect.right - ARect.left);
        DRect.bottom:= DRect.Top +
           Min(myBitmap.height, ARect.bottom - ARect.top);

         Apos:= 1;
         BitmapSize:= strGetToken(Parameters, ';', APos);
         if (BitmapSize = 'Shrink To Fit') then
            Canvas.StretchDraw(DRect, myBitmap)
         else
            Canvas.CopyRect(DRect, myBitmap.Canvas, SRect);

         if IsDrawFocusRect then
           wwDrawFocusRect(Canvas, ARect);

        myBitmap.Free;
  end;


  Function HandleWWControls: boolean;
  var tempField: TField;
      Rect: TRect;
      ControlType, Parameters: string;
      checkboxOn, checkBoxOff: string;
      APos: integer;
  begin
     result:= False;
     if not isValidCell(ACol, ARow) then exit;
     tempField:= GetColField(dbCol(ACol));
     if tempField=Nil then exit;

     GetControlInfo(tempField.FieldName, ControlType, Parameters);

     {  Bitmap support }
     if ControlType='Bitmap' then begin
       OldActive:= DataLink.ActiveRecord;
       try
	  DataLink.ActiveRecord:= dbRow(ARow);
          DisplayBitMap(tempField, Parameters);
       finally
	  DataLink.ActiveRecord:= OldActive;
       end;

       Draw3DLines(ARect, ACol, ARow, AState);

       result:= True;
       exit;
    end
    else if ControlType='ImageIndex' then begin
       OldActive:= DataLink.ActiveRecord;
       try
	  DataLink.ActiveRecord:= dbRow(ARow);
          if (tempField is TIntegerField) or
             (tempField is TFloatField) then
          begin
             if (FImageList<>Nil) then
               DisplayBitmapFromImageList(tempField, Parameters)
          end
       finally
	  DataLink.ActiveRecord:= OldActive;
       end;

       Draw3DLines(ARect, ACol, ARow, AState);

       result:= True;
       exit;
    end
    else if ControlType='CheckBox' then begin
      APos:= 1;
      checkBoxOn:= strGetToken(Parameters, ';', APos);
      checkBoxOff:= strGetToken(Parameters, ';', APos);
      OldActive:= DataLink.ActiveRecord;
      Value:= '';
      try
	 DataLink.ActiveRecord:= dbRow(ARow);
	 if tempField.calculated and (lowercase(tempField.fieldName)='selected') then begin
	    if isSelected then value:= checkBoxOn
	    else value:= checkBoxOff;
	 end
	 else begin
	    value:= GetFieldValue(dbCol(ACol));
	 end;

	 DrawCellColors(tempField, True);
      finally
	 DataLink.ActiveRecord:= OldActive;
      end;

      rect.left:= (ARect.right + ARect.left - 10) div 2;
      rect.right:= rect.left + 10;
      rect.Top:= ((ARect.Top + ARect.Bottom - 10) div 2);
      rect.Bottom:= rect.Top + 10;

      DrawCheckBox(rect, ACol, ARow, wwEqualStr(value, checkBoxOn));  { 2/11/97 Case insensitive check}

      Draw3DLines(ARect, ACol, ARow, AState);
      result:= True;
      exit;
   end;


  end;

  {4/31/97 - Use extra temp bitmap due to bug in Delphi 3 BrushCopy method }
  procedure ShowIndicator;
  var tempBitmap, tempBitmap2: TBitmap;
      SRect: TRect;
  begin
     tempBitmap:= TBitmap.create;
     tempBitmap2:= TBitmap.create;
     if FDataLink.DataSet = nil then tempBitmap.assign(BrowseIndicatorBitmap)
     else begin
       case FDataLink.DataSet.State of
	  dsEdit: tempBitmap.assign(EditIndicatorBitmap);
	  dsInsert: tempBitmap.assign(InsertIndicatorBitmap);
	  else tempBitmap.assign(BrowseIndicatorBitmap);
       end;
     end;

     SRect  := classes.Rect(0, 0, tempBitmap.Width, tempBitmap.Height);

     if FIndicatorColor=icYellow then begin
        { Substitute background color for white}
        tempBitmap2.assign(tempBitmap);
        tempBitmap2.Canvas.Brush.Color:= Canvas.Brush.Color;
        tempBitmap2.Canvas.BrushCopy(SRect, tempBitmap, SRect, clWhite);
        {Warning - Delphi 2's brushcopy may have a resource leak }

        { Substitute yellow for indicator color }
	tempBitmap.Canvas.Brush.Color:= clYellow;
        tempBitmap.Canvas.BrushCopy(SRect, tempBitmap2, SRect, clBlack);
        Canvas.CopyMode:= cmSrcCopy;
     end
     else Canvas.CopyMode:= cmSrcAnd;

     Canvas.Draw(((ARect.right-tempBitmap.Width) div 2)+1,
		(ARect.Top + ARect.Bottom - tempBitmap.Height) div 2, tempBitmap);

     tempBitmap.Free;
     tempBitmap2.Free;
     Canvas.CopyMode:= cmSrcCopy;  { Restore default }
  end;
begin
  isDrawFocusRect:= False;
  SkipLineDrawing:= False;
  ATextRect:= ARect;


  if gdFixed in AState then
    Canvas.Font := TitleFont
  else
    Canvas.Font := Font;

  with Canvas do
  begin
    if gdFixed in AState then
      Brush.Color := TitleColor else
      Brush.Color := Color;

    if HandleWWControls then exit;

    if dgTitles in Options then Dec(ARow, 1);
    if dgIndicator in Options then Dec(ACol, 1);

    if ARow < 0 then begin
      ATitleAlignment:= FTitleAlignment;
      if (ACol >= 0) and (ACol < FieldCount) then begin
        {12/15/97 - Paint indicator button now so blank space isn't displayed too long }
        if (ACol=0) and (dgIndicator in Options) then
           if (IndicatorButton<>Nil) and
              IndicatorButton.visible then IndicatorButton.paint;
        {7/31/97 - Don't use displaylabel property when useTFields=False }
        tempDisplayLabel:= Fields[ACol].DisplayLabel;
        if not useTFields then begin
           if wwFindSelected(Selected, Fields[ACol].FieldName, index) then
           begin
              APos:= 1;
              strGetToken(Selected[Index], #9, APos); { 11/11/98 - Changed ACol to Index }
              strGetToken(Selected[Index], #9, APos); { Changed ACol to Index }
              tempDisplayLabel:= strGetToken(Selected[index], #9, APos);
           end;
        end;
	DoCalcTitleAttributes(Fields[ACol].FieldName, Font, Brush, ATitleAlignment);
        Canvas.FillRect(ARect);
        TitleImageAttributes.ImageIndex:= -1;
        TitleImageAttributes.Alignment:= taRightJustify;
        TitleImageAttributes.Margin:= 3;
        DoCalcTitleImage(Self, Fields[ACol], TitleImageAttributes);

        titleOffset:= 0;
	if FTitleButtons and (TitleClickColumn>=0) and (not UseDragCanvas) and
          (TitleClickColumn=ACol+FIndicatorOffset) then titleoffset:= 1;

        if (TitleImageAttributes.ImageIndex>=0) and (TitleImageList<>Nil) then begin
           case TitleImageAttributes.Alignment of
             taRightJustify: begin
                 TitleImageList.Draw(Canvas,
                     ARect.Right-TitleImageList.Width-TitleImageAttributes.Margin + TitleOffset,
                     (ARect.Top + Arect.Bottom - TitleImageList.Height) div 2 + TitleOffset,
                     TitleImageAttributes.ImageIndex);
                 ATextRect:= ARect;
                 ATextRect.Right:=
                    wwmax(ARect.Right - TitleImageList.Width - TitleImageAttributes.Margin, ARect.Left)
               end;
             taLeftJustify: begin
                 TitleImageList.Draw(Canvas,
                     ARect.Left + TitleImageAttributes.Margin + TitleOffset,
                     (ARect.Top + Arect.Bottom - TitleImageList.Height) div 2 + TitleOffset,
                     TitleImageAttributes.ImageIndex);
                 ATextRect:= ARect;
                 ATextRect.Left:=
                    wwmin(ARect.Left + TitleImageList.Width + TitleImageAttributes.Margin, ARect.Right)
               end;
             taCenter: begin
                 TitleImageList.Draw(Canvas,
                     (ARect.Left + ARect.Right - TitleImageList.Width) div 2 + TitleOffset,
                     (ARect.Top + Arect.Bottom - TitleImageList.Height) div 2+ TitleOffset,
                     TitleImageAttributes.ImageIndex);
                 ATextRect:= ARect;
               end;
           end
        end;

        defaultTitleDrawing:= True;
	DoDrawTitleCell(Canvas, Fields[ACol], ARect, defaultTitleDrawing);
        if DefaultTitleDrawing and (TitleImageAttributes.Alignment<>taCenter) then
           Display(TempDisplayLabel, ATitleAlignment);


	if FTitleButtons and (not useDragCanvas) then
	begin
	   SkipLineDrawing:= True;
	   if (TitleClickColumn<0) or
             { 2/9/98 - Only depress currently clicked column }
             (TitleClickColumn<>ACol+FIndicatorOffset) then
          begin
	      Pen.Color:= clGray;
	      with ARect do begin
		 PolyLine([Point(Left, Top), Point(Left, Bottom-1)]);
		 PolyLine([Point(Left, Bottom-1), Point(Right-1, Bottom-1)]);
		 PolyLine([Point(Right-1, Bottom-1), Point(Right-1, Top)]);
	      end;
	      Pen.Color:= clBtnHighlight;
	      with ARect do begin
		 PolyLine([Point(Left, Top), Point(Left, Bottom)]);
		 PolyLine([Point(Left+1, Top), Point(Right-1, Top)]);
	      end;
              Pen.Color:= clBtnShadow;
	      with ARect do begin
                PolyLine([Point(Left, Bottom-1), Point(Right, Bottom-1)]);
              end;
	   end
	   else begin
	      Pen.Color:= clBlack;
	      with ARect do begin
		 PolyLine([Point(Left, Top), Point(Left, Bottom)]);
		 PolyLine([Point(Left, Top), Point(Right, Top)]);
	      end;
	      Pen.Color:= clGray;
	      with ARect do begin
		 PolyLine([Point(Left+1, Top+1), Point(Left+1, Bottom-1)]);
		 PolyLine([Point(Left+1, Bottom-1), Point(Right, Bottom-1)]);
//                 Pen.Color:= clBtnHighlight;
//		 PolyLine([Point(Right, Bottom-1), Point(Right, Top-1)]);
	      end;
	   end
	end
      end
      else
         Display('', FTitleAlignment);
    end
    else if (DataLink = nil) or not DataLink.Active then FillRect(ARect)
    else if ACol < 0 then
    begin
      FillRect(ARect);
      if ARow = FDataLink.ActiveRecord then
      begin
	ShowIndicator;
	FSelRow := ARow + FTitleOffset;
      end;
    end
    else begin
      Value := '';
      OldActive := DataLink.ActiveRecord;
      try
	DataLink.ActiveRecord := ARow;
	FCalcCellRow:= ARow;
	FCalcCellCol:= ACol;

        FieldMappedText:= False;
	Value := GetFieldValue(ACol);

	Highlight := HighlightCell(ACol, ARow, Value, AState);
	if Highlight then
	begin
	  Brush.Color := clHighlight;
	  Font.Color := clHighlightText;
	end;

	DoCalcCellColors(GetColField(ACol), AState, Highlight, Font, Brush);
	Alignment := taLeftJustify;
	if ACol < FieldCount then Alignment := Fields[ACol].Alignment;
        if FieldMappedText then Alignment:= taLeftJustify;

	if DefaultDrawing then
	   Display(Value, Alignment);
	DrawDataCell(ARect, GetColField(ACol), AState);
      finally
	DataLink.ActiveRecord := OldActive;
      end;
      if DefaultDrawing and Highlight and not (csDesigning in ComponentState) and
	not (dgRowSelect in Options) and (ValidParentForm(Self).ActiveControl = Self) then
      begin
        WinProcs.DrawFocusRect(Canvas.Handle, ARect);
	isDrawFocusRect:= True;
      end

    end;

{    if (gdFixed in AState) or not isWhiteBackground then
      with ARect do
      begin
	Pen.Color := clBtnHighlight;
	if dgRowLines in Options then
	  PolyLine([Point(Left, Top), Point(Right, top)]);
	if dgColLines in Options then
	  PolyLine([Point(Left, Bottom - 1), Point(Left, Top)]);
      end;
}
  end;
end;

procedure TwwCustomDBGrid.ValidationErrorUsingMask(Field: TField);
var msg: string;
    doDefault: boolean;
begin
  msg:= Format(SMaskEditErr, ['']);
  DoDefault:= True;
  if Assigned(FOnValidationErrorUsingMask) then
     FOnValidationErrorUsingMask(self, Field, msg, doDefault);
  if doDefault then
  begin
     MessageBeep(0);
     raise EInvalidOperation.create(Format(SMaskEditErr, ['']));
  end
end;


procedure TwwCustomDBGrid.MoveCol(ACol: Integer);
var
  OldCol: Integer;
//  editor: TwwInplaceEdit;
//  FOnInvalidValue: TwwInvalidValueEvent;
begin
(*   if (InplaceEditor <> nil) then
   begin
      editor:= TwwInplaceEdit(InplaceEditor);
      if (editor.HavePictureMask) and FDataLink.isFieldModified and
	 (not editor.IsValidPictureValue(editor.Text)) and
	    (not editor.Picture.AllowInvalidExit) then
      begin
	 editor.SelectAll;
	 editor.SetFocus;
	 FDataLink.Modified; {SetFocus clears modified so set it back to true }

         {7/3/97 - Use OnInvalidValue }
         FOnInvalidValue := wwGetOnInvalidValue(FDataLink.DataSet);
         if Assigned(FOnInvalidValue) then
         begin
            FOnInvalidValue(FDataLink.DataSet, GetColField(dbCol(Col)));
         end
         else ValidationErrorUsingMask(GetColField(dbCol(Col)));

	 exit;
      end
   end;
*)
  FDatalink.UpdateData;
  if ACol >= FieldCount then ACol := FieldCount - 1;
  if ACol < 0 then ACol := 0;
  if ACol < (FixedCols - FIndicatorOffset) then begin
     { Don't allow movement to a fixed column }
     ACol:= FixedCols - FIndicatorOffset;
  end;

  OldCol := Col - FIndicatorOffset;
  if ACol <> OldCol then
  begin
    if not FInColExit then
    begin
      FInColExit := True;
      try
	ColExit;
      finally
	FInColExit := False;
      end;
      if Col - FIndicatorOffset <> OldCol then Exit;
    end;

    HideEditor;
    if (not SuppressShowEditor) and
       (dgAlwaysShowEditor in Options) and not isWWControl(ACol + FIndicatorOffset, row) then
    begin
       HideControls;
       { 12/19/96 - Don't call showeditor if going to memo field}
       if not isMemoField(ACol + FIndicatorOffset, row) then ShowEditor;
    end;

    Col := ACol + FIndicatorOffset;
    ColEnter;
  end;
end;

function TwwCustomDBGrid.IsWWControl(ACol, ARow: integer): boolean;
begin
   result:= False;
end;

function TwwCustomDBGrid.CreateEditor: TInplaceEdit;
begin
  Result := TwwInplaceEdit.wwCreate(Self, 0);
end;

procedure TwwCustomDBGrid.KeyDown(var Key: Word; Shift: TShiftState);
var
  KeyDownEvent: TKeyEvent;
  editor: TwwInplaceEdit;

  procedure NextRow;
  begin
    with FDatalink.Dataset do
    begin
      if (State = dsInsert) and not Modified and not FDatalink.FModified then
	if EOF then Exit else Cancel
      else begin
	 { Already pointing to end of table but active record is before this. 10/15/96 - dsInsert should not increment}
	 if Eof and (FDataLink.ActiveRecord>=0) and  { IP2 - Used to be >0, now >=0 }
	     (FDataLink.ActiveRecord<FDataLink.RecordCount-1) and not (State=dsInsert) then
	    FDataLink.ActiveRecord:= FDataLink.ActiveRecord + 1
	 else Next;
      end;
      if EOF and CanModify and (dgEditing in Options) and (dgAllowInsert in KeyOptions) then
      begin
	HideControls;
	Append;
      end;
    end
  end;

  procedure PriorRow;
  begin
    with FDatalink.Dataset do
      if (State = dsInsert) and not Modified and EOF and
	not FDatalink.FModified then
	Cancel
      else begin
	if BOF and (FDataLink.ActiveRecord>0) then
	   FDataLink.ActiveRecord:= FDataLink.ActiveRecord - 1
	else Prior;
      end
  end;

  procedure Tab(GoForward: Boolean);
  var
    ACol, Original: Integer;
  begin
    ACol := SelectedIndex;
    Original := ACol;
    while True do
    begin

      if GoForward then
	Inc(ACol) else
	Dec(ACol);
      if ACol >= FieldCount then
      begin
	HideControls; { Necessary when all columns fit in grid's view }
        if (dgTabExitsOnLastCol in Options) then begin
           parent.Perform(wm_nextdlgctl, 0, 0);
           break;
        end
        else begin
           if (Original=0) and TabStops[FIndicatorOffset] then SuppressShowEditor:= True;
           NextRow;
           ACol := 0;
        end
      end
      { 9/15/98 - Test for GoFoward when going back to previous row }
      else if (not GoForward) and (ACol < (FixedCols - FIndicatorOffset)) then { 7/10/98 - Support fixed columns }
      begin
	HideControls;
        if (dgTabExitsOnLastCol in Options) then begin
           parent.Perform(wm_nextdlgctl, 1, 0);
           break;
        end
        else begin
           if (FieldCount-1<>Original) and TabStops[(FieldCount-1) + FIndicatorOffset] then SuppressShowEditor:= True;
           PriorRow;
           ACol := FieldCount - 1;
        end
      end;
      if ACol = Original then Exit;
      if TabStops[ACol + FIndicatorOffset] then
      begin
	SuppressShowEditor:= False;
	MoveCol(ACol);
	Exit;
      end;

      SuppressShowEditor:= False;
    end;
  end;

  function DeletePrompt: Boolean;
  begin
    Result := not (dgConfirmDelete in Options) or
      (MessageDlg(
         {$ifdef wwDelphi3Up}
         SDeleteRecordQuestion,
         {$else}
         LoadStr(SDeleteRecordQuestion),
         {$endif}
         mtConfirmation, mbOKCancel, 0) <> idCancel);
  end;

  Function ShouldShowEditor: boolean;
  var tempField: TField;
  begin
      result:= False;
      tempField:= GetColField(dbCol(Col));
      if tempField=Nil then exit;
      if (tempField is TBlobField) then exit;  { Changed to TBlobField}
      if isWWControl(Col, Row) then exit;  {10/12/96 - Don't show editor for any customEdit }

      result:= True;
  end;

begin
  KeyDownEvent := OnKeyDown;

  if Assigned(KeyDownEvent) then KeyDownEvent(Self, Key, Shift);
  if not FDatalink.Active or not CanGridAcceptKey(Key, Shift) then Exit;

  with FDatalink.DataSet do
    if ssCtrl in Shift then
      case Key of
	VK_UP, VK_PRIOR: MoveBy(-FDatalink.ActiveRecord);
	VK_DOWN, VK_NEXT: MoveBy(FDatalink.BufferCount - FDatalink.ActiveRecord - 1);
	VK_LEFT: MoveCol(0);
	VK_RIGHT: MoveCol(FieldCount - 1);
	VK_HOME: First;
	VK_END: Last;
	VK_DELETE: begin
	      if (dgAllowDelete in KeyOptions) and (not ReadOnly) and CanModify and
		 (dgEditing in Options) and DeletePrompt then
	      begin
		 Delete;
		 HideEditor; {10/3/96}
	      end;
	      Key:= 0; {10/3/96 }
	   end;
      end
    else
      case Key of
	VK_UP: PriorRow;
	VK_DOWN: NextRow;
	VK_LEFT:
	  if dgRowSelect in Options then
	    PriorRow else
	    MoveCol(SelectedIndex - 1);
	VK_RIGHT:
	  if dgRowSelect in Options then
	    NextRow else
	    MoveCol(SelectedIndex + 1);
	VK_HOME:
	  if (FieldCount = 1) or (dgRowSelect in Options) then
	    First else
	    MoveCol(0);
	VK_END:
	  if (FieldCount = 1) or (dgRowSelect in Options) then
	    Last else
	    MoveCol(FieldCount - 1);
	VK_NEXT: MoveBy(VisibleRowCount);
	VK_PRIOR: MoveBy(-VisibleRowCount);
	VK_INSERT: if not ReadOnly and
		  (dgEditing in Options) and (dgAllowInsert in KeyOptions) then Insert;
	VK_TAB: if not (ssAlt in Shift) then Tab(not (ssShift in Shift));
	VK_RETURN: if dgEnterToTab in KeyOptions then Tab(not (ssShift in Shift));
	VK_ESCAPE:
	  begin
	    FDatalink.Reset;
	    if not (dgAlwaysShowEditor in Options) then HideEditor
	    else if Assigned(FOnCheckValue) then begin
	       if (InplaceEditor <> nil) then
	       begin
		  editor:= TwwInplaceEdit(InplaceEditor);
		  editor.IsValidPictureValue(editor.Text);
	       end
	    end
	  end;
	VK_F2: if ShouldShowEditor then EditorMode := True;
      end;
end;

procedure TwwCustomDBGrid.KeyPress(var Key: Char);
var OrigKey: char;
begin
  OrigKey:= Key;
  if (dgEnterToTab in KeyOptions) and (ord(Key)=VK_RETURN) then Key:= #9;
  if not (dgAlwaysShowEditor in Options) and (Key = #13) then
    FDatalink.UpdateData;

  inherited KeyPress(Key);
  if not (dgAlwaysShowEditor in Options) and (OrigKey = #13) then
  begin
     if (not CanEditShow) and EditorMode then EditorMode:= false;
  end
end;

procedure TwwCustomDBGrid.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var temp: integer;
    field: TField;
    Cell: TGridCoord;
    tempSizing: boolean;
begin
   tempSizing:= Sizing(X,Y);
   inherited MouseUp(Button, Shift, x, y);

   if TempSizing and Assigned(FOnColWidthChanged) then
   begin
      { 12/7/98 - Correct OnColWidthChanged event passing the wrong column }
      if (self is TwwDBGrid) then
        FOnColWidthChanged(Self, TwwDBGrid(self).Patch[2]);
   end;

   if (TitleClickColumn>=0) then begin
      Cell := MouseCoord(X, Y);
      Temp:= TitleClickColumn;
      TitleClickColumn:= -1;
      InvalidateCell(Temp, 0);
      if (Cell.X=Temp) and (Cell.Y=TitleClickRow) and (Y>=0) then
      begin
	 field:= GetColField(dbCol(Cell.X));
	 if (field<>nil) and (not SkipTitleButtonClick) then
	    DoTitleButtonClick(Field.FieldName)
      end;
      TitleClickRow:= -1;
   end;
  { 4/28/99 - Fix problem where fixed column didn't fire event after drag operation}
   SkipTitleButtonClick:= False;
end;

procedure TwwCustomDBGrid.DoTitleButtonClick(AFieldName: string);
begin
  if Assigned(FOnTitleButtonClick) then
     FOnTitleButtonClick(Self, AFieldName)
end;

procedure TwwCustomDBGrid.MouseLoop_DragColumn(HitTest: Integer; X, Y: Integer);
var ACursor: TPoint;
    Msg: TMsg;
    FirstTime: boolean;
    RootRect, TitleCellRect: TRect;
    DestRect, TempRect: TRect;
    tempx: integer;
    dragTo: integer;
    Cell, OrigCell: TGridCoord;
    Scrolled: boolean;

    CaptureTitleXOffset: integer;
    CaptureTitleMouseDirection: integer;
    CaptureTitleLastMovedPosition: integer;
    LastDestRect: TRect;
    DragFrom: integer;

    MaxWidth: integer;
    GridDisplayWidth: integer;

    procedure UpdateDestRect;
    begin
       DestRect:= Rect(tempx, DragVertOffset, tempx+CaptureTitleBitmap.Width,
                  DragVertOffset+CaptureTitleBitmap.Height);
    end;

begin
   SetCapture(Handle);
   FirstTime:= True;

   { Make compiler happy with the following 3 assignments }
   CaptureTitleMouseDirection:= ctmdNone;
   CaptureTitleLastMovedPosition:= 0;
   CaptureTitleXOffset:= 0;
   DragFrom:= 0;
   GridDisplayWidth:= Width;
   SkipTitleButtonClick:= False;

   try
      while GetCapture = Handle do
      begin
         GetCursorPos(ACursor);
         ACursor := ScreenToClient(ACursor);
         case Integer(GetMessage(Msg, 0, 0, 0)) of
           -1: Break;
           0: begin PostQuitMessage (Msg.WParam); Break; end;
         end;

         case Msg.Message of
            WM_TIMER: begin
               if (msg.hwnd<>Handle) then
               begin
                  TranslateMessage(Msg);
                  DispatchMessage(Msg);
                  continue;
               end;

               if CaptureTitleBitmap=nil then continue;

               Scrolled:= False;
               if (ACursor.x-CaptureTitleXOffset+CaptureTitleBitmap.Width>GridDisplayWidth) and
                  (CaptureTitleMouseDirection = ctmdForward) then
               begin
                  if LeftCol+VisibleColCount>=ColCount then continue;
                  LeftCol:= LeftCol + 1;

                  TempRect:= LastDestRect;
                  TempRect.Left:= 0;
                  TempRect.Right:= Width;
                  InvalidateRect(Handle, @TempRect, False);
                  Scrolled:= True;
               end
               else if (ACursor.x-CaptureTitleXOffset<CellRect(LeftCol, 0).Left) and
                  (CaptureTitleMouseDirection = ctmdBackward) then
               begin
                  if LeftCol<=inherited FixedCols then continue;
                  LeftCol:= LeftCol - 1;
                  TempRect:= LastDestRect;
                  TempRect.Left:= 0;
                  TempRect.Right:= Width;
                  InvalidateRect(Handle, @TempRect, False);
                  Scrolled:= True;
               end;

               if Scrolled then
               begin
                  tempx:= ACursor.x - CaptureTitleXOffset;
                  UpdateDestRect;
                  ValidateRect(Handle, @DestRect);
                  Update;
                  Canvas.CopyRect(DestRect, CaptureTitleBitmap.Canvas, RootRect);
                  LastDestRect:= DestRect;
                  Update;
               end
            end;

            WM_MOUSEMOVE: begin
               if FirstTime then begin
//                  if (X=ACursor.X) and (y=ACursor.Y) then continue;
                  if (abs(X-ACursor.X)<=2) and (abs(y-ACursor.Y)<=2) then continue;

                  SkipTitleButtonClick:= True;
                  Cell := MouseCoord(X, Y);
                  OrigCell:= Cell;
                  TitleCellRect:= CellRect(Cell.X, Cell.Y);
                  CaptureTitleBitmap:= TBitmap.create;
                  CaptureTitleBitmap.Width:= max(TitleCellRect.Right-TitleCellRect.Left, ColWidths[Cell.X]);
                  MaxWidth:= Width-10;
                  if ShowVertScrollBar then MaxWidth:= MaxWidth - GetSystemMetrics(SM_CXHThumb) + 1;
                  if dgIndicator in Options then MaxWidth:= MaxWidth - ColWidths[0] - 2;
                  CaptureTitleBitmap.Width:= min(CaptureTitleBitmap.Width, MaxWidth);

                  CaptureTitleBitmap.Height:= TitleCellRect.Bottom-TitleCellRect.Top;
                  CaptureTitleXOffset:= X-TitleCellRect.Left;
                  RootRect:= Rect(0, 0, CaptureTitleBitmap.Width, CaptureTitleBitmap.Height);
                  UseDragCanvas:= True;
                  DrawCell(Cell.X, Cell.Y, RootRect, [gdFixed]);
                  UseDragCanvas:= False;

                  CaptureTitleBitmap.Canvas.Pen.Color:= clBlack;
                  CaptureTitleBitmap.Canvas.MoveTo(RootRect.Right-1, RootRect.Top);
                  CaptureTitleBitmap.Canvas.LineTo(RootRect.Right-1, RootRect.Bottom-1);
                  CaptureTitleBitmap.Canvas.LineTo(RootRect.Left+1, RootRect.Bottom-1);
                  DragFrom:= Cell.X;
                  CaptureTitleMouseDirection:= ctmdNone;
                  CaptureTitleLastMovedPosition:= X;
                  LastDestRect:= Rect(0,0,0,0);

                  SetTimer(Handle, 1, 100, nil);
                  if IsScrollBarVisible then
                     GridDisplayWidth:= Width - GetSystemMetrics(SM_CXHThumb)
                  else
                     GridDisplayWidth:= Width;

                  FirstTime:= False;
               end
               else begin
                  tempx:= ACursor.x - CaptureTitleXOffset;
                  UpdateDestRect;
                  InvalidateRect(Handle, @LastDestRect, False);
                  ValidateRect(Handle, @DestRect);
                  Update;

                  Canvas.CopyRect(DestRect, CaptureTitleBitmap.Canvas, RootRect);
                  LastDestRect:= DestRect;
                  if ACursor.X>CaptureTitleLastMovedPosition then
                     CaptureTitleMouseDirection:= ctmdForward
                  else
                     CaptureTitleMouseDirection:= ctmdBackward;
                  CaptureTitleLastMovedPosition:= ACursor.X;
               end;
            end;

            WM_LBUTTONUP: begin
               if not FirstTime then
               begin
                  KillTimer(Handle, 1);
                  InvalidateRect(Handle, @LastDestRect, False);
                  CaptureTitleBitmap.Free;
                  CaptureTitleBitmap:= nil;
                  Cell := MouseCoord(ACursor.X, ACursor.Y);
                  LastDestRect:= Rect(0,0,0,0);

                  { Make sure that DragTo isn't more than last column }
                  if (LeftCol+VisibleColCount>=ColCount) and
                     (ACursor.X>CellRect(ColCount-1, 0).Right) then
                     DragTo:= ColCount-1
                  else begin
                     DragTo:= Min(Cell.X, ColCount-1);
                     DragTo:= Max(DragTo, inherited FixedCols);
                  end;
                  TitleClickColumn:= -1;
                  if DragFrom<>DragTo then MoveColumn(DragFrom, DragTo)
                  else InvalidateCell(OrigCell.X, 0);
               end;
               if GetCapture = Handle then ReleaseCapture;
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
       if GetCapture = Handle then ReleaseCapture;
   end;
end;


procedure TwwCustomDBGrid.DoCellChanged;
begin
  if not DisableCellChangedEvent then
     if Assigned(FOnCellChanged) then
        FOnCellChanged(self);
end;

procedure TwwCustomDBGrid.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  Cell: TGridCoord;
  CellChanged: boolean;
  TempOnMouseDown: TMouseEvent;
  NewRow: boolean;
  TempShiftSelectBookmark: TBookmark;

  Procedure CallMouseDown;
  begin
    TempOnMouseDown:= OnMouseDown;
    if Assigned(TempOnMouseDown) then begin
       update;
       TempOnMouseDown(Self, Button, Shift, X, Y);
    end
  end;

  procedure ProcessTitleClick;
  begin
    if TitleButtons and (ssLeft in Shift) and not (csDesigning in ComponentState) then
    begin
       Cell := MouseCoord(X, Y);
       if (Cell.Y < FTitleOffset) then
       begin
	  TitleClickColumn:= Cell.X;
	  TitleClickRow:= Cell.y;
	  InvalidateCell(Cell.X, 0);
       end
    end;
  end;

begin
  FreeHintWindow;
  if not AcquireFocus then Exit;
  if (ssDouble in Shift) and (Button = mbLeft) then
  begin
    DblClick;
    Exit;
  end;
  if Sizing(X, Y) then begin
    { 12/7/98 - Correct OnColWidthChanged event passing the wrong column }
    Cell := MouseCoord(X-8, Y);
    if Self is TwwDBGrid then TwwDBGrid(self).Patch[2]:= Cell.X;

    FDataLink.UpdateData;    { 2/7/97 - Flush data to TField if modified }
    inherited MouseDown(Button, Shift, X, Y)
  end
  else begin
    Cell := MouseCoord(X, Y);
    if Cell.Y<0 then begin  {2/7/97}
       CallMouseDown;
       exit;
    end;
    {12/21/97 - Use goColMoving instead of dgColumnResize.  Developer can
     then progmatically set goColMoving to False, while leaving the column
     sizing as True. }
    if ((csDesigning in ComponentState) or (goColMoving in inherited Options)) and
      (Cell.Y < FTitleOffset) then
    begin
       {10/15/97 - Allow resize even if titlebuttons is True }
       ProcessTitleClick;

       { Copy title snapshot to bitmap - Use when mouse moves }
       if Cell.X>=inherited FixedCols then
       begin
           if ssLeft in Shift then MouseLoop_DragColumn(0, X, Y);
           exit;
       end;

       inherited MouseDown(Button, Shift, X, Y);
    end
    else if (not (goColMoving in inherited Options)) and (Cell.Y < FTitleOffset) then
       ProcessTitleClick
    else
      if FDatalink.Active then
	with Cell do
	begin
	  if (X = Col) and (Y = Row) and not isWWControl(col, row) and
	    (not isMemoField(col, row)) then ShowEditor;  { Don't show internal editor if memo field }
	  NewRow:=(Y >= FTitleOffset) and (Y - Row <> 0);
	  if NewRow then SuppressShowEditor:= True;

	  if (dgMultiSelect in Options) then
          begin
             if not ((ssCtrl in Shift) or (ssShift in Shift)) then
                if (msoAutoUnselect in MultiSelectOptions) then
                begin
                end
          end;

{             begin
                if not NewRow then begin
		   if isSelected then UnselectRecord
                   else SelectRecord;
                end
             end
             else if (msoAutoUnselect in MultiSelectOptions) then
             begin
                UnselectAll;
             end
	  end;              }


{	  SuppressShowEditor:= False;
          MoveColRow(x,y, False, False);
}
          CellChanged:= (y<>row) or (x<>col);
          DisableCellChangedEvent:= True;
          if not (dgRowSelect in Options) then { 9/3/99 - Don't reset LeftCol }
             if X >= inherited FixedCols then MoveCol(X - FIndicatorOffset);
	  SuppressShowEditor:= False;

	  if NewRow then FDatalink.Dataset.MoveBy(Y - Row);
          DisableCellChangedEvent:= False;

          if CellChanged then DoCellChanged;

          TempShiftSelectBookmark:= ShiftSelectBookmark; { 5/13/98 }

	  if (dgMultiSelect in Options) and not isSelectedCheckbox(X) then
          begin
             if ((ssCtrl in Shift) or (ssShift in Shift)) then
             begin
                if isSelected then UnselectRecord
                else SelectRecord;
             end
             else begin {7/10/97 - Unselect all only if left button is clicked - Allows popupmenu}
                if (msoAutoUnselect in MultiSelectOptions) and (ssLeft in Shift) then
                begin
                   UnselectAll;
                   SelectRecord;
                end
             end
          end;

          if (dgMultiSelect in Options) and
             ((ssShift in Shift) or (ssCtrl in Shift) or (msoAutoUnselect in MultiSelectOptions)) then
          begin
             if (msoShiftSelect in MultiSelectOptions) then
             begin
                ShiftSelectMode:= True;
                FDataLink.dataset.checkBrowseMode;

                { 5/13/98 - Only Getbookmark one time as SelectRecord can get bookmark}
                if TempShiftSelectBookmark=ShiftSelectBookmark then
                   ShiftSelectBookmark:= FDataLink.DataSet.GetBookmark;
             end
          end

	end;

    CallMouseDown;
  end;
end;

procedure TwwCustomDBGrid.InvalidateFooter;
var FooterRect: TRect;
begin
   FooterRect:= GetFooterRect;
   InvalidateRect(Handle, @FooterRect, false);
end;

procedure TwwCustomDBGrid.ColEnter;
begin
//  if GetColField(dbCol(Col))<>Nil then
//     OriginalCellText:= GetColField(dbCol(Col)).asString
//  else OriginalCellText:= '';

  if Assigned(FOnColEnter) then begin
     FOnColEnter(Self);
  end;
  DoCellChanged;
end;

procedure TwwCustomDBGrid.ColExit;
begin
  if Assigned(FOnColExit) then FOnColExit(Self);
end;

procedure TwwCustomDBGrid.ColumnMoved(FromIndex, ToIndex: Longint);
var temp: string;
    FooterRect: TRect;
begin
  FromIndex:= FromIndex  - FIndicatorOffset;
  ToIndex := ToIndex - FIndicatorOffset;

  if useTFields then begin
     if FDatalink.Active and (FieldCount > 0) then
       Fields[FromIndex].Index := Fields[ToIndex].Index;
  end
  else begin
     { 12/11/97 - Insert in front instead of switching columns }
     Temp:= Selected[FromIndex];
     Selected.Delete(FromIndex);
     Selected.Insert(ToIndex, Temp);
     LayoutChanged;
  end;
  FooterRect:= GetFooterRect;
  Winprocs.InvalidateRect(Canvas.Handle, @FooterRect, False);

  if Assigned(FOnColumnMoved) then FOnColumnMoved(Self, FromIndex, ToIndex);

end;

procedure TwwCustomDBGrid.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) then
  begin
      if (FDataLink <> nil) and (AComponent = DataSource)  then
         DataSource := nil
      else if (FIndicatorButton=AComponent) then
         FIndicatorButton:= nil
      else if (FImageList=AComponent) then
         FImageList:= nil
      else if (FTitleImageList=AComponent) then
         FTitleImageList:= nil
  end;
end;

procedure TwwCustomDBGrid.TimedScroll(Direction: TGridScrollDirection);
begin
  if FDatalink.Active then
  begin
    with FDatalink do
    begin
      if sdUp in Direction then
      begin
	DataSet.MoveBy(-ActiveRecord - 1);
	Exclude(Direction, sdUp);
      end;
      if sdDown in Direction then
      begin
	DataSet.MoveBy(RecordCount - ActiveRecord);
	Exclude(Direction, sdDown);
      end;
    end;
    if Direction <> [] then inherited TimedScroll(Direction);
  end;
end;

procedure TwwCustomDBGrid.ColWidthsChanged;
var
  I: Integer;
  CWidth: Integer;
  ParentForm: TCustomForm;
  tempSelected, Parts: TStrings;
begin
  inherited ColWidthsChanged;
  if not FUpdatingColWidths and FUpdateFields and FDatalink.Active and
    HandleAllocated then
  begin
    Inc(FUpdateLock);
    tempSelected:= nil;
    parts:= nil;

    try
      Canvas.Font := Font;
      CWidth := Canvas.TextWidth('0');

      { 10/28/98 - Substract 4 from ColWidths to be consistent with setting of ColWidths }
      if useTFields then begin
         for I := 0 to FieldCount - 1 do
            { 6/11/99 - Make sure adding never subtracting }
            Fields[I].DisplayWidth := ((ColWidths[I + FIndicatorOffset]-4) +
               wwMax(0, CWidth div 2 - 3)) div CWidth;
      end
      else begin
         tempSelected:= TStringList.create;
         parts:= TStringList.create;
         tempSelected.assign(Selected);
         Selected.clear;
         for I := 0 to tempSelected.count-1 do
         begin
             strBreakApart(tempselected[i], #9, parts);
             { 6/11/99 - Make sure adding never subtracting }
             Selected.Add(parts[0] + #9 +
               inttostr(((ColWidths[I + FIndicatorOffset]-4) + wwMax(0, CWidth div 2 - 3)) div CWidth)
                  +#9 + parts[2]);
             if parts.count>3 then Selected[i]:= Selected[i] + #9 + parts[3];
         end;
      end;

      ParentForm := GetParentForm(Self) as TCustomForm;  { -ksw (6/22/98) }
      if (ParentForm <> nil) and (TForm(ParentForm).Designer <> nil) then
      begin
	ParentForm.Designer.Modified;
      end
    finally
      Dec(FUpdateLock);
      tempSelected.Free;
      Parts.Free;
    end;
    LayoutChanged;
{    SizelastColumn; {!!! 4/7/97}
  end;
end;

procedure TwwCustomDBGrid.Loaded;
begin
  inherited Loaded;
  LayoutChanged;
end;

procedure TwwCustomDBGrid.SetOptions(Value: TwwDBGridOptions);
const
  LayoutOptions = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator,
    dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgPerfectRowFit,
    dgShowFooter];
var
  NewGridOptions: TGridOptions;
  ChangedOptions: TwwDBGridOptions;
begin
  if FOptions <> Value then
  begin
    NewGridOptions := [];
    if dgColLines in Value then
      NewGridOptions := NewGridOptions + [goFixedVertLine, goVertLine];
    if dgRowLines in Value then
      NewGridOptions := NewGridOptions + [goFixedHorzLine, goHorzLine];
    if dgColumnResize in Value then
      NewGridOptions := NewGridOptions + [goColSizing, goColMoving];
    if dgTabs in Value then Include(NewGridOptions, goTabs);
    if dgRowSelect in Value then Include(NewGridOptions, goRowSelect);
    if (dgEditing in Value) and not (dgRowSelect in Value) then  {edit not allowed if RowSelect}
       Include(NewGridOptions, goEditing);
    if dgAlwaysShowEditor in Value then Include(NewGridOptions, goAlwaysShowEditor);
    inherited Options := NewGridOptions;
    ChangedOptions := (FOptions + Value) - (FOptions * Value);
    if (dgWordWrap in Value) <> (dgWordWrap in FOptions) then
    begin
       if (InplaceEditor<>Nil) then
	  (InplaceEditor as TwwInplaceEdit).WordWrap:= (dgWordWrap in Value);
       Invalidate; { if wordwrap changed }
    end;
    FOptions := Value;
    if ChangedOptions * LayoutOptions <> [] then LayoutChanged;
  end;


end;

procedure TwwCustomDBGrid.SetTitleFont(Value: TFont);
begin
  FTitleFont.Assign(Value);
  LayoutChanged;
end;

procedure TwwCustomDBGrid.SetIndicatorColor(Value: TIndicatorColorType);
begin
  FIndicatorColor:= Value;
  LayoutChanged;
end;

procedure TwwCustomDBGrid.SetTitleAlignment(sel: TAlignment);
begin
   if sel<>FtitleAlignment then
   begin
      FTitleAlignment:= sel;
      LayoutChanged;
   end
end;

procedure TwwCustomDBGrid.SetTitleLines(sel: integer);
begin
   if sel<=0 then exit;
   if sel<>FTitleLines then
   begin
      FTitleLines:= sel;
      LayoutChanged;
   end
end;

procedure TwwCustomDBGrid.SetRowHeightPercent(sel: Integer);
begin
   if sel<=0 then begin
      FRowHeightPercent:= 100;
      exit;
   end;

   if sel<>FRowHeightPercent then
   begin
      FRowHeightPercent:= sel;
      LayoutChanged;
   end
end;

procedure TwwCustomDBGrid.DoCalcTitleImage(Sender: TObject; Field: TField;
         var TitleImageAttributes: TwwTitleImageAttributes);
begin
  if Assigned(FOnCalcTitleImage) then
     FOnCalcTitleImage(Sender, Field, TitleImageAttributes);
end;

procedure TwwCustomDBGrid.DoDrawTitleCell(ACanvas: TCanvas;
     Field: TField; ARect: TRect; var DefaultDrawing: boolean);
begin
  if Assigned(FOnDrawTitleCell) then
     FOnDrawTitleCell(Self, ACanvas, Field, ARect, DefaultDrawing);
end;

procedure TwwCustomDBGrid.DoCalcTitleAttributes(AFieldName: string; AFont: TFont; ABrush: TBrush;
	     var FTitleAlignment: TAlignment);
begin
  if Assigned(FOnCalcTitleAttributes) then
     FOnCalcTitleAttributes(Self, AFieldName, AFont, ABrush, FTitleAlignment)
end;

procedure TwwCustomDBGrid.DoCalcCellColors(Field: TField; State: TGridDrawState;
	     highlight: boolean; AFont: TFont; ABrush: TBrush);
begin
  if Assigned(FOnCalcCellColors) then
     FOnCalcCellColors(Self, Field, State, highlight, AFont, ABrush);
  isWhiteBackground:= ColorToRGB(Canvas.Brush.Color)=clWhite;
end;

Function TwwCustomDBGrid.GetShowHorzScrollBar: Boolean;
begin
   result:= ScrollBars in [ssBoth, ssHorizontal];
end;

Procedure TwwCustomDBGrid.SetShowHorzScrollBar(val: boolean);
begin
   if (val) then ScrollBars:= ssHorizontal
   else ScrollBars:= ssNone;
end;

Procedure TwwCustomDBGrid.SetShowVertScrollBar(val: boolean);
begin
   FShowVertScrollBar:= val;
   UpdateScrollBar;
   invalidate;
end;

Function TwwCustomDBGrid.IsMemoField(Acol, Arow: integer): boolean;
var Field: TField;
begin
   Result:= False;
   if dbRow(ARow)<0 then exit;
   Field := GetColField(dbCol(Acol));
   if (Field = nil) then exit;
   if not (Field is TBlobField) then exit;
   if (Field.DataType <> ftMemo) and { 6/8/98 - return true if richedit field }
       (not wwIsRichEditField(Field, False)) then exit;

   Result:= True;
end;

function TwwCustomDBGrid.IsCheckBox(col, row: integer; var checkboxOn, checkboxOff: string): boolean;
var fldName: string;
    i: integer;
    parts : TStrings;
    controlType: TStrings;
begin
   result:= False;
   if not isValidCell(col, row) then exit;

   fldName:= DataLink.fields[dbCol(col)].fieldName;
   parts:= TStringList.create;

   controlType:= GetControlType;
   for i:= 0 to ControlType.count-1 do begin
      strBreakapart(controlType[i], ';', parts);
      if parts.count<4 then continue;
      if parts[0]<>fldName then continue;
      if parts[1]='CheckBox' then begin
	 CheckBoxOn:= parts[2];
	 CheckBoxOff:= parts[3];
	 result:= True;
	 break;
      end
   end;

   parts.free;
end;

Function TwwCustomDBGrid.isValidCell(ACol, ARow: integer): boolean;
begin
   Result:= False;
   if dataSource=Nil then exit;
   if dataSource.dataSet=Nil then exit;
   ACol:= dbCol(ACol);
   ARow:= dbRow(ARow);
   if (ACol<0) or (ACol>=DataLink.FieldCount) then exit;
   if (ARow<0) then exit;
   if not (wwDataSet(DataSource.dataSet)) then exit;
   Result:= True;
end;

function TwwCustomDBGrid.DbCol(col: integer): integer;
begin
   result:= col;
   if dgIndicator in Options then result:= col - 1;
end;

function TwwCustomDBGrid.DbRow(row: integer): integer;
begin
   result:= row;
   if dgtitles in Options then result:= row - 1;
end;

Function TwwCustomDBGrid.IsSelected: boolean;
begin
   result:= False;
end;

Function TwwCustomDBGrid.IsSelectedRow(DataRow: integer): boolean;
begin
   result:= False;
end;

procedure TwwCustomDBGrid.RefreshBookmarkList;
begin
end;

procedure TwwCustomDBGrid.HideControls;
begin
end;

constructor TwwInplaceEdit.wwCreate(AOwner: TComponent; dummy: integer);
begin
  Create(AOwner);
  FwwPicture:= TwwDBPicture.create(self);
  ParentGrid:= Owner as TwwCustomDBGrid;
  FWordWrap:= dgWordWrap in ParentGrid.Options;
  {$ifdef wwDelphi3Up}
  ImeMode := ParentGrid.ImeMode;
  ImeName := ParentGrid.ImeName;
  {$endif}
end;

destructor TwwInplaceEdit.Destroy;
begin
  FwwPicture.Free;
  inherited Destroy;
end;

{ Convert cr to tab }
procedure TwwInplaceEdit.KeyDown(var Key: Word; Shift: TShiftState);

  procedure SendToParent;
  begin
     ParentGrid.setFocus;
     ParentGrid.KeyDown(Key, Shift);
     Key := 0;
     Update;
  end;

  function Ctrl: Boolean;
  begin
    Result := ssCtrl in Shift;
  end;

begin
   case Key of
      VK_RETURN:
	 if dgEnterToTab in ParentGrid.KeyOptions then
	 begin
	    SendToParent;
	 end;

      VK_DELETE: if (Ctrl) then SendToParent;
   end;

   inherited KeyDown(Key, Shift);
end;

procedure TwwInplaceEdit.KeyUp(var Key: Word; Shift: TShiftState);
begin
   if (dgEnterToTab in ParentGrid.KeyOptions) and (Key=VK_RETURN) then Key:= 9;
   inherited KeyUp(Key, Shift);
   if (Key= VK_DELETE) then
   begin
      if Assigned(parentGrid.FOnCheckValue) then
	 IsValidPictureValue(Text);
   end
end;

procedure TwwInplaceEdit.KeyPress(var Key: Char);
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
  if (dgEnterToTab in ParentGrid.KeyOptions) and (ord(Key)=VK_RETURN) then Key:= #9;

  inherited KeyPress(Key);

  if HavePictureMask then begin
     if (ord(Key) = VK_BACK) then
     begin
       if Assigned(parentGrid.FOnCheckValue) then IsValidPictureValue(NewText);
       exit;
     end;
     if (ord(key)<VK_SPACE) then exit;

     s:= NewText;
     if (Maxlength>0) and (length(s)>MaxLength) and (length(s)>length(Text)) then exit; { Limit to maxlength }

     pict:= TwwPictureValidator.create(FwwPicture.PictureMask, FwwPicture.AutoFill);
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
               SkipInvalidValueTest:= True; { 2/4/98 - Rely upon previous call }
	     end
	     else DisplayTextIsInvalid:= True;
	 end;

       prIncomplete: begin
	    padLength := length(s) - length(text);
	    text:= s;
	    (Owner as TwwCustomDBGrid).FEditText:= Text;
	    if (oldSelLen=oldLen) then selStart:= length(s)
	    else selStart:= OldSelStart + padLength;
	    key:= char(0);
	    DisplayTextIsInvalid:= True;
	    end;

       prComplete: begin
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
            if Delphi2 then begin
               if (length(s)>1) then text:= copy(s, 1, oldSelStart) + copy(s, oldSelStart+2, length(s)-1)
               else text:= '';
               selStart:= OldSelStart;
               (Owner as TwwCustomDBGrid).FEditText:= s;
               if (length(s)>0) then
                  key:= s[oldSelStart+1];
            end
            else begin
               text:= s;
               (Owner as TwwCustomDBGrid).FEditText:= s;
               if (oldSelLen=oldLen) then selStart:= length(s)
               else if (length(s)>oldlen) then
                  selStart:= oldSelStart + (length(s)-oldlen) {Move caret to the right}
               else selStart:= oldSelStart + 1;  { 11/26/96 }
               selLength:= 0;  { 8/12/97 }

               key:= char(0);
            end
	 end;

     end;
     pict.Free;

     if (not SkipInvalidValueTest) and
        Assigned(parentGrid.FOnCheckValue) then
	parentGrid.FOnCheckValue(self, not DisplayTextIsInvalid);

  end;
end;

{ Allow paste to change text - 10/29/96 }
procedure TwwInplaceEdit.WMPaste(var Message: TMessage);
begin
  inherited;
  if not ParentGrid.CanEditModify then exit;
//  ParentGrid.edit;
//  ParentGrid.DataLink.modified;
end;

procedure TwwInplaceEdit.SetWordWrap(val: boolean);
begin
   FWordWrap:= val;
   RecreateWnd;
end;

procedure TwwInplaceEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style and not (ES_AUTOVSCROLL or ES_WANTRETURN);
  if (BorderStyle = bsNone) or WordWrap then Params.Style:= Params.Style or ES_MULTILINE;
  if WordWrap then Params.Style := (Params.Style or ES_AUTOVSCROLL) and not ES_AUTOHSCROLL;
end;

function TwwInplaceEdit.IsValidPictureValue(s: string): boolean;
var pict: TwwPictureValidator;
    res: TwwPicResult;
begin
   if s='' then
      result:= True
   else if not HavePictureMask then
      result:= True
   else begin
      pict:= TwwPictureValidator.create(FwwPicture.PictureMask, FwwPicture.AutoFill);;
      res:= Pict.picture(s, False);
      result := res = prComplete;
      pict.Free;
   end;
   if Assigned(parentGrid.FOnCheckValue) then
      parentGrid.FOnCheckValue(self, result);
end;

procedure TwwInplaceEdit.WMSetFocus(var Message: TWMSetFocus);
var tempMask: string;
    tempAutoFill: boolean;
begin
  inherited;
  if (parentGrid.datasource=nil) or (parentGrid.datasource.dataset=nil) then exit;
  with ParentGrid do begin
     if GetColField(dbCol(Col))=nil then exit;
     wwPictureByField(ParentGrid.GetPictureControl, GetColField(dbCol(Col)).FieldName, True,
	      tempMask, tempAutoFill, FUsePictureMask);
     FwwPicture.PictureMask:= tempMask;
     FwwPicture.AutoFill:=tempAutoFill;
     FwwPicture.AllowInvalidExit:= False;
     IsValidPictureValue(GetColField(dbCol(Col)).text)
  end
end;

Function TwwInplaceEdit.HavePictureMask: boolean;
begin
   result:=
     FUsePictureMask and
     (FwwPicture.PictureMask<>'')
end;

procedure TwwInplaceEdit.CMFontChanged(var Message: TMessage);
var
  Loc: TRect;
begin
  inherited;
  Loc.Bottom :=ClientHeight;
  Loc.Right := ClientWidth-1;
  if BorderStyle = bsNone then begin
     Loc.Top := 2;
     Loc.Left := 2;
  end
  else begin
     Loc.Top := 0;
     Loc.Left := 0;
  end;
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@Loc));  { Use 2 pixel border on top and left }
end;

Procedure TwwCustomDBGrid.SelectRecord;
begin
end;

Procedure TwwCustomDBGrid.UnselectRecord;
begin
end;

Procedure TwwCustomDBGrid.SetTitleButtons(val: boolean);
begin
   if (FTitleButtons<>val) then
   begin
      FTitleButtons:= val;
      invalidate;
   end
end;

Function TwwCustomDBGrid.GetPictureControl: TComponent;
begin
   result:= wwGetPictureControl(self);
//   if (Datasource=nil) then
//      result:= wwGetPictureControl(self, nil)
//   else
//      result:= wwGetPictureControl(self, DataSource.DataSet)
end;

Procedure TwwCustomDBGrid.SetPictureMask(FieldName: string; Mask: string);
begin
   if DataSource=nil then exit;
   wwSetPictureMask(GetPictureControl, FieldName, Mask, True, True,
		    True, False, False);
end;

Procedure TwwCustomDBGrid.SetPictureAutoFill(FieldName: string; AutoFill: boolean);
begin
   if DataSource=nil then exit;
   wwSetPictureMask(GetPictureControl, FieldName, '', AutoFill, True,
		    False, True, False);
end;

Procedure TwwCustomDBGrid.UnselectAll;
begin
end;

    function TwwCustomDBGrid.GetSelectedFields: TStrings;
    begin
         Result:= FSelected;
    end;

    procedure TwwCustomDBGrid.SetPictureMasks(val: TStrings);
    begin
       FPictureMasks.assign(val);
    end;

    procedure TwwCustomDBGrid.SetControlType(val: TStrings);
    begin
       ControlType.assign(val);
    end;

    procedure TwwCustomDBGrid.SetSelectedFields(sel : TStrings);
    begin
         FSelected.assign(sel);
    end;

Function TwwCustomDBGrid.IsSelectedCheckbox(ACol: integer): boolean;
var tempField: TField;
begin
    if isCheckBox(ACol, 1, dummy1, dummy2) then
    begin
       tempField:=GetColField(dbCol(ACol));
       if tempField=nil then result:= False
       else result:= (lowercase(tempField.fieldName)='selected');
    end
    else result:= False;
end;


Procedure TwwCustomDBGrid.SizeLastColumn;
var i, FieldsSize: integer;
begin
   if csLoading in ComponentState then Exit;
   if not HandleAllocated then Exit;

   FUpdatingColWidths:= True;
   SetColumnAttributes;
   FUpdatingColWidths:= False;

   if ShowVertScrollBar then FieldsSize:= GetSystemMetrics(SM_CXHThumb) + 5
   else FieldsSize:= 0;

   if dgIndicator in Options then FieldsSize:= FieldsSize + colWidths[0] + GridLineWidth;

   for i:= LeftCol to ColCount-2 do
      FieldsSize:= FieldsSize + colWidths[i] + GridLineWidth;
   if FieldsSize>Width then exit;  { Last column is not visble }

   FieldsSize:= FieldsSize + ColWidths[ColCount-1] + GridLineWidth;

   FUpdatingColWidths:= True;
   if Width-FieldsSize>0 then
      colWidths[ColCount-1]:= colWidths[ColCount-1] + (Width - FieldsSize);
   FUpdatingColWidths:= False;
end;

function TwwCustomDBGrid.GetColWidthsPixels(Index: Longint): Integer;
begin
  result:= inherited ColWidths[Index];
end;

procedure TwwCustomDBGrid.SetColWidthsPixels(Index: Longint; Value: Integer);
begin
   FUpdatingColWidths:= True;
   ColWidths[Index]:= Value;
   FUpdatingColWidths:= False;
end;

procedure TwwCustomDBGrid.FlushChanges;
begin
   DataLink.UpdateData;
end;

procedure TwwIButton.Loaded;
begin
  inherited Loaded;
  if parent is TwwCustomDBGrid then
  begin
     (parent as TwwCustomDBGrid).FIndicatorButton:= self;
     {$ifdef win32}
     (parent as TwwCustomDBGrid).FIndicatorWidth:= Width-1;
     {$else}
     (parent as TwwCustomDBGrid).FIndicatorWidth:= Width-2;
     {$endif}
  end;
end;

procedure TwwIButton.Paint;
begin
   inherited Paint;
{   if parent is TwwDBGrid then
      with (parent as TwwDBGrid) do begin
         InvalidateCell(0,1);
         Update;
      end}
end;

procedure TwwIButton.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var SizeChanging: boolean;
begin
  {$ifdef win32}
  if ALeft>0 then ALeft:= 0;
  if ATop>0 then ATop:= 0;
  {$else}
  ALeft:= -1;
  ATop:= -1;
  {$endif}

  SizeChanging:= (AWidth<>Width) or (AHeight<>Height);
  {$ifdef wwdelphi4up}
  if UseRightToLeftAlignment and (parent is TwwCustomDBGrid) then { 10/6/98 }
    with (parent as TwwCustomDBGrid) do
       inherited SetBounds(ClientWidth - AWidth + 2, ATop, AWidth, AHeight)
  else
  {$endif}
    inherited SetBounds(ALeft, ATop, AWidth, AHeight);

  if (parent=nil) then exit;

  if SizeChanging and (not (csLoading in ComponentSTate)) then
  begin
     with (parent as TwwCustomDBGrid) do begin
        {$ifdef win32}
        FIndicatorWidth:= self.Width-1;
        {$else}
        FIndicatorWidth:= self.Width-2;
        {$endif}
        LayoutChanged;
     end
  end;

end;

{$ifdef win32}
{$ifdef wwDelphi3Up}
procedure TwwCustomDBGrid.GetChildren(Proc: TGetChildProc; Root: TComponent);
{$else}
procedure TwwCustomDBGrid.GetChildren(Proc: TGetChildProc);
{$endif}
begin
   if FIndicatorButton<>Nil then begin
      Proc(FIndicatorButton);
   end;
end;
{$else}
procedure TwwCustomDBGrid.WriteComponents(Writer: TWriter);
begin
   if FIndicatorButton<>Nil then Writer.WriteComponent(FIndicatorButton);
end;
{$endif}

procedure TwwColumn.SetDisplayLabel(val: string);
begin
   if self=Grid.DummyColumn then exit;
   try
      Inc(Grid.FUpdateLock);
      UpdateSelectedProp(Grid.Selected, FFieldName, val, sptUpdateLabel);
      if Grid.useTFields then
        Grid.Datasource.dataset.fieldbyname(FFieldName).DisplayLabel:= val;
      Grid.SetColumnAttributes;
      Grid.Invalidate;
   finally
     Dec(Grid.FUpdateLock);
   end
end;

procedure TwwColumn.SetFooterValue(val: string);
begin
   if self=Grid.DummyColumn then exit;
   if FFooterValue<>val then
   begin
      FFooterValue:= val;
      Grid.InvalidateFooter;
   end;
end;

procedure TwwColumn.SetDisplayWidth(val: integer);
var s: string;
begin
   if self=Grid.DummyColumn then exit;
   s:= inttostr(val);
   try
      Inc(Grid.FUpdateLock);
      UpdateSelectedProp(Grid.Selected, FFieldName, s, sptUpdateWidth);
      if Grid.useTFields then
        Grid.Datasource.dataset.fieldbyname(FFieldName).DisplayWidth:= val;
      Grid.SetColumnAttributes;
   finally
     Dec(Grid.FUpdateLock);
   end;

end;

procedure TwwColumn.SetReadOnly(val: boolean);
var s: string;
begin
   if self=Grid.DummyColumn then exit;
   if val then s:= 'T' else s:= 'F';
   UpdateSelectedProp(Grid.Selected, FFieldName, s, sptUpdateReadOnly);
end;

function TwwColumn.GetReadOnly: boolean;
begin
   if self=Grid.DummyColumn then result:= False
   else result:= (GetSelectedProp(Grid.Selected, FFieldName, sptUpdateReadOnly) = 'T')
end;

function TwwColumn.GetDisplayLabel: string;
begin
   if self=Grid.DummyColumn then result:= ''
   else result:= GetSelectedProp(Grid.Selected, FFieldName, sptUpdateLabel);
end;

function TwwColumn.GetDisplayWidth: integer;
begin
   if self=Grid.DummyColumn then result:= 0
   else result:= strtoInt(GetSelectedProp(Grid.Selected, FFieldName, sptUpdateWidth));
end;

function TwwCustomDBGrid.GetColumn(Index: Integer): TwwColumn;
begin
   result:= ColumnByName(Fields[index].FieldName)
end;

function TwwCustomDBGrid.ColumnByName(Index: string): TwwColumn;
var i: integer;
begin
   result:= DummyColumn;
   for i:= 0 to ColItems.count-1 do begin
      if wwEqualStr(TwwColumn(ColItems[i]).FFieldName, Index) then
      begin
         result:= TwwColumn(ColItems[i]);
         exit;
      end
   end;
end;

constructor TwwColumn.Create(AOwner: TComponent; AFieldName: string);
begin
   Grid:= AOwner as TwwCustomDBGrid;
   FFieldName:= AFieldName;
end;

procedure TwwCustomDBGrid.TopLeftChanged;
var FooterRect: TRect;
   {$ifdef wwdelphi4up}
   PatchRect: TRect;
   DrawInfo: TGridDrawInfo;
   {$endif}
begin
   FreeHintWindow;

   inherited TopLeftChanged;
   if Assigned(FOnLeftColChanged) then
      FOnLeftColChanged(self, LeftCol);

   if dgShowFooter in Options then
   begin
      FooterRect:= GetFooterRect;
      FooterRect.Bottom:= FooterRect.Bottom + 1;
      Winprocs.InvalidateRect(Handle, @FooterRect, False);
   end;

   {8/5/98 - Delphi 4 patch for bug in TCustomGrid }
   {$ifdef wwdelphi4up}
   CalcDrawInfo(DrawInfo);
   PatchRect:= Rect(DrawInfo.Horz.GridExtent-1, 0,
                    DrawInfo.Horz.GridExtent, height);
   Winprocs.InvalidateRect(Handle, @PatchRect, False);
   {$endif}

end;

function TwwCustomDBGrid.GetClientRect: TRect;
begin
  result:= inherited GetClientRect;
  if dgShowFooter in Options then
  begin
     if FooterHeight=0 then
        Result.Bottom := result.Bottom - (DefaultRowHeight+4)
     else
        Result.Bottom := result.Bottom - FooterHeight;
     if dgFooter3DCells in Options then
        Result.Bottom:= Result.Bottom - 2;
  end
end;

Function TwwCustomDBGrid.GetFooterRect: TRect;
var FooterRect: TRect;
begin
   FooterRect:= CellRect(0, RowCount-1);
   {$ifdef wwdelphi4up}
   if UseRightToLeftAlignment then { 10/18/98 }
   begin
      FooterRect.Left:= FooterRect.Right;
      FooterRect.right:= 0;
   end
   else
   {$endif}
      FooterRect.right:= ClientWidth;
   FooterRect.Top:= ClientRect.Bottom;
   if FooterHeight=0 then
      FooterRect.Bottom:= FooterRect.Top + DefaultRowHeight+3
   else
      FooterRect.Bottom := FooterRect.Top + FooterHeight-1;
   if dgFooter3DCells in Options then
      FooterRect.Bottom:= FooterRect.Bottom + 2;
   result:= FooterRect;
end;

Procedure TwwCustomDBGrid.Paint;
const AlignFlags : array [TAlignment] of Integer =
    ( DT_LEFT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_RIGHT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_CENTER or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX );
var FooterRect: TRect;
    TempRect, FooterCellRect,LastFooterCellRect: TRect;
    ACol: integer;
    ACanvas: TCanvas;

    Function GetFooterCellRect(Col: integer): TRect;
    var FooterCellRect: TRect;
    begin
       FooterCellRect:= CellRect(ACol, RowCount-1);
       if FooterCellRect.left<>FooterCellRect.right then
       begin
          FooterCellRect.Top:= FooterRect.Top;
          FooterCellRect.Bottom:= FooterRect.Bottom;
       end;
//       InflateRect(FooterCellRect, -2, -2);
       result:= FooterCellRect;
    end;

    procedure DrawFooterLines(rect: TRect; Col, Row: integer);
    begin
        with ACanvas do begin
           Pen.color:= clBtnShadow;
           MoveTo(rect.left+1, rect.bottom-2);
           LineTo(rect.left+1, rect.top+1);
           LineTo(rect.right-1, rect.top+1);

           if dgFooter3DCells in Options then //(ColorToRGB(Brush.Color)=clWhite) then
           begin
              Pen.color:= clBlack;
              MoveTo(rect.left+2, rect.bottom-2);
              LineTo(rect.left+2, rect.top+2);
              LineTo(rect.right-1, rect.top+2);

              Pen.color:= clBtnHighlight;
              MoveTo(rect.left+2, rect.bottom-2);
              LineTo(rect.right-1, rect.bottom-2);
              LineTo(rect.right-1, rect.top+1);

              Pen.color:= clBtnFace;
              MoveTo(rect.left+3, rect.bottom-3);
              LineTo(rect.right-2, rect.bottom-3);
              LineTo(rect.right-2, rect.top+1);
           end
           else begin
              Pen.color:= clBtnHighlight;
              MoveTo(rect.left+2, rect.bottom-2);
              LineTo(rect.right-1, rect.bottom-2);
              LineTo(rect.right-1, rect.top+1);
           end
        end
    end;

    procedure ProcessFooterCell(ACol: integer);
    var FooterText: string;
        Flags : integer;
        DefaultDrawing: boolean;
    begin
       FooterCellRect:= CellRect(ACol, RowCount-1);
       if FooterCellRect.left<>FooterCellRect.right then
       begin
          FooterText:= Columns[dbCol(ACol)].FooterValue;
          DefaultDrawing:= true;
          ACanvas.Brush.Color:= FFooterCellColor;
          ACanvas.Font:= Font;

          FooterCellRect:= GetFooterCellRect(ACol);
          InflateRect(FooterCellRect, 0, -2);

          If Assigned(FOnDrawFooterCell) then
          begin
             FOnDrawFooterCell(self, ACanvas, FooterCellRect,
                 Fields[dbCol(ACol)], FooterText, DefaultDrawing);
          end;

          if not DefaultDrawing then exit;
          if FooterText='' then exit;

          { Fill with brush color for cell }
          ACanvas.FillRect(FooterCellRect);

          FooterCellRect.Top:= FooterRect.Top+1;
          FooterCellRect.Bottom:= FooterRect.Bottom-1;
          FooterCellRect.Left:= FooterCellRect.Left - 1;
          DrawFooterLines(FooterCellRect,  ACol, RowCount);

          Flags:= AlignFlags[Fields[dbCol(ACol)].Alignment];
          FooterCellRect.Top:= FooterCellRect.Top +
             (FooterCellRect.Bottom - FooterCellRect.Top - ACanvas.TextHeight('A')) div 2;
          FooterCellRect.Left:= FooterCellRect.Left + 5;
          FooterCellRect.Right := FooterCellRect.Left + ColWidths[ACol] - 9;

          DrawText(ACanvas.Handle, PChar(FooterText), length(FooterText),
                   FooterCellRect, Flags);

       end
    end;

begin
   inherited Paint;

   if not (dgShowFooter in Options) then exit;

   ACanvas:= DrawBitmap.Canvas; {  Draw to bitmap canvas for performance }
   with DrawBitmap do
   begin
      Width := self.width;
      Height := self.height;
   end;

   for ACol:= LeftCol to ColCount-1 do
   begin
      FooterCellRect:= CellRect(ACol, RowCount-1);
      if FooterCellRect.left=FooterCellRect.right then break;
      LastFooterCellRect:= FooterCellRect;
   end;

   FooterRect:= GetFooterRect;
   FooterRect.Top:= FooterRect.Top -1;
   FooterRect.Bottom:= FooterRect.Bottom +1;
   ACanvas.Brush.Color:= Color;
   ACanvas.FillRect(FooterRect);

   { Fill with Footer color, up to right-most visible cell }
   ACanvas.Brush.Color:= FFooterColor;
   FooterRect:= GetFooterRect;
   FooterRect.Right:= LastFooterCellRect.Right + 1;
   {$ifdef wwDelphi4Up}
   if (ACanvas.CanvasOrientation = coRightToLeft) then { 9/25/98 - Support bidi mode }
      FooterRect.Right:= LastFooterCellRect.Left;
   {$endif}
   ACanvas.Pen.Color:= clBlack;
   ACanvas.MoveTo(FooterRect.Left, FooterRect.Top-1);
   ACanvas.LineTo(FooterRect.Right, FooterRect.Top-1);
   ACanvas.LineTo(FooterRect.Right, FooterRect.Bottom+1);
   ACanvas.FillRect(FooterRect);

   ACanvas.Pen.Color:= clWhite;
   ACanvas.MoveTo(FooterRect.Left, FooterRect.Top);
   ACanvas.LineTo(FooterRect.Right, FooterRect.Top);
   ACanvas.MoveTo(FooterRect.Left, FooterRect.Top);
   ACanvas.LineTo(FooterRect.Left, FooterRect.Bottom);
   ACanvas.Pen.Color:= clBlack;
   ACanvas.MoveTo(FooterRect.Left, FooterRect.Bottom);
   ACanvas.LineTo(FooterRect.Right, FooterRect.Bottom);

   if FDatalink.Active then
   begin
      for ACol:= FIndicatorOffset to (inherited FixedCols)-FIndicatorOffset do
         ProcessFooterCell(ACol);
      for ACol:= LeftCol to ColCount-1 do ProcessFooterCell(ACol);
   end;

   FooterRect:= GetFooterRect;
   FooterRect.Top:= FooterRect.Top -1;
   FooterRect.Bottom:= FooterRect.Bottom +1;

   TempRect:= FooterRect;
   {$ifdef wwdelphi4up}
   if (ACanvas.CanvasOrientation = coRightToLeft) then
   begin
      TempRect.Left := FooterRect.Right;
      TempRect.Right := FooterRect.Left;
   end;
   {$endif}
   Canvas.CopyRect(TempRect, ACanvas, TempRect);

//   Canvas.CopyRect(FooterRect, ACanvas, FooterRect);

end;

procedure TwwCustomDBGrid.SetFooterColor(sel: TColor);
begin
   if sel<>FFootercolor then
   begin
      FFooterColor:= sel;
      LayoutChanged;
   end;
end;

procedure TwwCustomDBGrid.SetFooterCellColor(sel: TColor);
begin
   if sel<>FFooterCellColor then
   begin
      FFooterCellColor:= sel;
      LayoutChanged;
   end;
end;

procedure TwwCustomDBGrid.SetFooterHeight(val: integer);
begin
   if (val<>FFooterHeight) then
   begin
      if FFooterHeight<0 then FFooterHeight:= 0
      else FFooterHeight:= val;
      LayoutChanged;
   end;
end;


(*
procedure TwwCustomDBGrid.PaintWindow(DC: HDC);
var GridRect: TRect;
    TempRect: TRect;
    tempDC: HDC;
    save: HBitmap;
    PS: TPaintStruct;
//    bm: HBitmap;
    DrawBitmap2: TBitmap;
    tempDC: HDC;
begin
  DrawBitmap2 := TBitmap.Create;
  DrawBitmap2.Height:= Height;
  DrawBitmap2.Width:= Width;

//  BeginPaint(Handle, PS);

  Canvas.Lock;
  tempDC:= CreateCompatibleDC(DC);

//  bm:= CreateCompatibleBitmap(tempDC, Width, Height);
//  Save:= SelectObject(tempDC, bm);

  Save:= SelectObject(tempDC, DrawBitmap2.handle);
  Canvas.Handle:= tempDC;

  try
    RealCanvas.Handle := DC;
    GridRect:= Rect(0, 0, Width, Height);

    try
      TempRect:= RealCanvas.ClipRect;
      Paint;
      RealCanvas.CopyRect(TempRect, Canvas, TempRect);
    finally
      Canvas.Handle := 0;
      RealCanvas.Handle := 0;
    end;
  finally
    Canvas.Unlock;
    SelectObject(tempDC, Save);
    DeleteObject(tempDC);
//    DeleteDC(tempDC);
//    DeleteObject(bm);
//    DrawBitmap2.Free;
  end;
end;
*)

procedure TwwCustomDBGrid.GetControlInfo(AFieldName: string;
      var AControlType: string; var AParameters: string);
var TempComponent: TComponent;
begin
   if ControlInfoInDataset then begin
      TempComponent:= Datasource.dataset;
      if (DataSource.DataSet=nil) or (wwGetControlType(Datasource.dataset)=nil) then TempComponent:= self;
   end
   else TempComponent:= self;
   WWDataSet_GetControl(TempComponent, AFieldName, AControlType, AParameters);
end;

function TwwCustomDBGrid.GetControlType: TStrings;
begin
   result:= nil;
   if ControlInfoInDataset then result:= wwGetControlType(Datasource.dataset);
   if result=nil then  { Delphi5}
      result:= controlType;
end;

procedure TwwCustomDBGrid.DoUpdateFooter;
begin
   if Assigned(FOnUpdateFooter) then FOnUpdateFooter(self);
end;

procedure TwwCustomDBGrid.WMRButtonDown(var Message: TWMRButtonDown);
var parentform: TCustomForm;
begin
  if not (csDesigning in ComponentState) then
  begin
     ParentForm := GetParentForm(Self) as TCustomForm;
     if (ParentForm<>Nil) and
        (TForm(ParentForm).FormStyle = fsMDIChild) then
     begin
        if (GetParentForm(Screen.ActiveControl)<>ParentForm) then
        begin
           Winprocs.SetFocus(handle);
           { 9/22/98 - Don't call inherited if fail to set focus as this would
             lead to OnValidate getting called twice }
           if Winprocs.GetFocus<>self.handle then exit;
        end
     end
  end;
  inherited;
end;

procedure TwwCustomDBGrid.WMLButtonDown(var Message: TWMLButtonDown);
var parentform: TCustomForm;
begin
  if not (csDesigning in ComponentState) then
  begin
     ParentForm := GetParentForm(Self) as TCustomForm;
     if (ParentForm<>Nil) and
        (TForm(ParentForm).FormStyle = fsMDIChild) then
     begin
        if (GetParentForm(Screen.ActiveControl)<>ParentForm) then
        begin
           { 9/22/98 - Don't call inherited if fail to set focus as this would
             lead to OnValidate getting called twice }
           Winprocs.SetFocus(handle);
           if Winprocs.GetFocus<>self.handle then exit;
        end
     end
  end;
  inherited;
end;

{$ifdef wwdelphi4up}
function TwwCustomDBGrid.DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  if (DataSource <> nil) and (DataSource.DataSet <> nil) then DataSource.DataSet.Next;
  result := True;
end;

function TwwCustomDBGrid.DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  if (DataSource <> nil) and (DataSource.DataSet <> nil) then DataSource.DataSet.Prior;
  result := True;
end;

function TwwCustomDBGrid.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

function TwwCustomDBGrid.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;

procedure TwwCustomDBGrid.CMShowingChanged(var Message: TMessage);
begin
  inherited;
  if Showing and ((Height=0) or (Width=0)) and (Align<>alNone) and { 11/11/98 - Check width too}
    (self is TwwDBGrid) and (TwwDBGrid(self).Patch[1]=False) then
  begin
     RequestAlign; { 10/21/98 }
  end
end;
{$endif}

procedure TwwCustomDBGrid.DoCreateHintWindow(
  HintWindow: TwwGridHintWindow;
  AField: TField;
  R: TRect;
  var WordWrap: boolean;
  var MaxWidth, MaxHeight: integer;
  var DoDefault: boolean);
begin
  if Assigned(FOnCreateHintWindow) then
     FOnCreateHintWindow(self, HintWindow, AField, R, WordWrap,
        MaxWidth, MaxHeight, DoDefault);
end;

type TCheatCast = class(TwwDBGrid);

procedure TwwCustomDBGrid.MouseMove(Shift: TShiftState; X, Y: Integer);
var PriorRow: integer;
    indicatoroffset, titleoffset: integer;
    R: TRect;
    sp: TPoint;
    AHintText: string;
    drawrect: trect;
    drawflags: Integer;
    oldmaxheight, maxwidth, maxheight: Integer;
    DoDefault: boolean;
    VerticalFits, HorizontalFits: boolean;
    curField: TField;
begin
   inherited;
   if not (dgShowCellHint in Options) then exit;

   with MouseCoord(x,y) do
   begin
      if ((x<>lastMouseX) or (y<>lastMouseY)) then begin
         R:= CellRect(x,y);
         lastMouseX:= x;
         lastMouseY:= y;
         FreeHintWindow;
         HintTimer.Free;
         HintTimer:= nil;

         if (x=Col) and (y=Row) then begin
            if (InplaceEditor<>nil) and (InplaceEditor.visible) then exit;
            if self is TwwDBGrid then begin
              if (TcheatCast(self).currentcustomedit<>nil) and
                 (TCheatCast(self).currentcustomedit.visible) then exit;
            end
         end;

         indicatorOffset:= 0;
         titleoffset:= 0;
         if dgIndicator in Options then indicatorOffset:= 1;
         if dgTitles in Options then titleOffset:= 1;
         if (y>=titleOffset) and (x>=IndicatorOffset) then
         begin
            curField:= Fields[x-indicatorOffset];
            PriorRow:= dbRow(Row);
            DataLink.ActiveRecord:= y-titleoffset;
            AHintText:= '';
            try
              if x-indicatorOffset<ColCount then
              begin
                 if curField is TBlobField then
                 begin
                    if curField.dataType=ftMemo then
                       AHintText:= GetFieldValue(x-indicatorOffset)
                 end
                 else begin
                    AHintText:= GetFieldValue(x-indicatorOffset)
                 end;
              end;
            finally
              DataLink.ActiveRecord:= PriorRow;
            end;

            if AHintText='' then exit;

            drawRect := Rect(0, 0, r.Right-r.left-4, 0);
            drawflags:= DT_NOPREFIX;
            if dgWordWrap in Options then drawflags:= drawflags or DT_EDITCONTROL or DT_WORDBREAK;
            DrawTextEx(Canvas.Handle, PChar(AHintText),
                      Length(AHintText), drawrect, DrawFlags or DT_CALCRECT, nil);

            VerticalFits:= (drawrect.bottom-drawrect.top<=r.bottom-r.top);
            HorizontalFits:= (drawrect.Right-drawrect.Left<r.right-r.left-1);
            if VerticalFits and HorizontalFits then exit;

            HintWindow:= CreateHintWindow(Fields[x-indicatoroffset]);
            HintTimer:= TTimer.create(self);
            HintTimer.OnTimer:=HintTimerEvent;
            HintTimer.Interval:=250;
            HintTimer.Enabled:= True;

            sp:= self.ClientToScreen(Point(0, 0));
            with TwwGridHintWindow(HintWindow) do
            begin
               if FieldMappedText or (curField.Alignment = taLeftJustify) then
                 Alignment:= taLeftJustify
               else
                 Alignment:= curField.Alignment;

               DoDefault:= True;
               WordWrap:= True;
               MaxHeight:= r.bottom-r.top-2;
               OldMaxHeight:= MaxHeight;
               MaxWidth:= Screen.Width;
               DoCreateHintWindow(TwwGridHintWindow(HintWindow),
                   Fields[x-indicatoroffset],
                   R, WordWrap,
                   MaxWidth, MaxHeight, DoDefault);
               MaxWidth := max((r.right-r.left), MaxWidth); { Make at least cell width }

               if not DoDefault then exit;

               R.bottom:= R.Bottom -2;

//               MaxWidth:= wwmax(r.Right-r.left, MaxWidth);
               drawRect := Rect(0, 0, MaxWidth, MaxHeight);
               drawflags:= DT_NOPREFIX;
               if WordWrap then drawflags:= drawflags or DT_EDITCONTROL or DT_WORDBREAK;
               DrawTextEx(Canvas.Handle, PChar(AHintText),
                   Length(AHintText), drawrect, DrawFlags or DT_CALCRECT, nil);
               if drawrect.right>MaxWidth then
                  drawrect.right:= MaxWidth;
               if drawrect.bottom>Maxheight then
                  drawrect.bottom:= MaxHeight;

               if MaxHeight<>OldMaxHeight then
                  r.bottom:= wwmax(r.top + drawrect.bottom, r.bottom);

               { FieldMappedText set to True by GetFieldValue if its mapped }
               if (Alignment = taLeftJustify) then
               begin
                  if r.left + drawrect.right + 8<=MaxWidth then
                     r.right:= r.Left + drawrect.right + 8
                  else if MaxWidth<>0 then r.right:= r.left + MaxWidth
               end
               else
                  r.left:= r.right - drawrect.right - 8;


               OffsetRect(R, sp.x, sp.y-1);
               ActivateHint(R, AHintText);
            end;
         end;
      end
   end
end;

procedure TwwCustomDBGrid.FreeHintWindow;
begin
   HintTimerCount:= 0;
   SkipErase:= True;
   HintWindow.Free;
   SkipErase:= False;
   HintWindow:= nil;
   if HintTimer<>nil then HintTimer.enabled:= False;
end;

Function TwwCustomDBGrid.CreateHintWindow(AField: TField): THintWindow;
begin
   HintWindow:= TwwGridHintWindow.create(self);
   HintWindow.Color:= GetSysColor(COLOR_INFOBK);
   HintWindow.Canvas.Brush.Color:= GetSysColor(COLOR_INFOBK);
   HintWindow.Canvas.Font:= self.Font;
   HintWindow.Canvas.Font.Color:= GetSysColor(COLOR_INFOTEXT);
   HintWindow.Canvas.Pen.Color:= clBlack;
   TwwGridHintWindow(HintWindow).Field:= AField;
   result:= HintWindow;
end;

procedure TwwCustomDBGrid.HintTimerEvent(Sender: TObject);
var
    sp, cp: TPoint;
    OutsideClient: boolean;
    cr: TRect;
begin
   if not (HintWindow<>nil) then exit;

   GetCursorPos(cp);

   sp:= self.ScreenToClient(cp);
   cr:= cellrect(lastmousex, lastmousey);
   inflaterect(cr, 1, 1);
   if not (ptinrect(cr, sp)) then begin
      FreeHintWindow;
      LastMouseX:= 0; LastMouseY:= 0;
      exit;
   end;

   sp:= self.ClientToScreen(Point(0, 0));

   if (cp.x<sp.x) or (cp.x>sp.x+ClientRect.Right-ClientRect.Left) or
      (cp.y<sp.y) or (cp.y>sp.y+ClientRect.Bottom-ClientRect.Top) then
   begin
      OutsideClient:= True;
   end
   else OutsideClient:= False;

   { Process Hint Timer clean-up}
   if OutsideClient then
   begin
      FreeHintWindow;
      LastMouseX:= 0; LastMouseY:= 0;
   end
   else begin
      inc(HintTimerCount);
      if HintTimerCount>16 then
      begin
         FreeHintWindow;
      end
   end

end;

{$ifdef wwDelphi4Up}
procedure TwwCustomDBGrid.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  if SkipErase then begin
     Message.result:= 1;
     exit;
  end
  else inherited;
end;

{$endif}


end.
