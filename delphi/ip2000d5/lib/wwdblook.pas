unit wwdblook;
{
//
// Components : TwwDBLookupCombo
//
// Copyright (c) 1995, 1996, 1997, 1998 by Woll2Woll Software
//
// 7/10/97 - Support non TwwTable lookup against a Linked or Lookup Field
// 7/21/97 - Added try/finally block to handle exceptions in EnableEdit
// 7/21/97 - ChangeFromLink now sets modified to True if just a plain calculated field
//           Previously would always be false in this case.
// 7/24/97 - Limit length to be up to field size
//
// 7/28/97 - If processing OnNotInList then ignore focus change since its
//           triggered by a message dialog by the user.  If we do call
//           UpdateRecord then the component incorrectly updates the tfield
//           even though the OnNotInList handler may indicate that it
//           it should not be updated.  Also select all text when
//           restoring back-values if user sets accept to false.
//
// 7/28/97   If modified then escape restores previous text.  Code added
//           to CnKeyDown.  UpdateData calls Closeup to handle NotInList.
//
// 7/30/97   Remove index switching on detail lookuptable when using a lookupfield
//
// 9/10/97 - Method UpdateFromCurrentSelection - Do not update active record if
//           its a TwwDBLookupComboDlg
//
// 9/18/97 - Reset backvalues when getting focus
//           Previously this code was in WMSetFocus, but that is fired also when
//           the form gets focus.  When the following code was placed in WMSetFocus,
//           the backvalues were incorrectly reset
//
// 9/18/97 - Escape updates FGrid.FDisplayValue instead of DisplayValue.
//           Previously in some cases could clear FDisplayValue to blank
//
// 9/18/97 - Don't beep when ShowMatchText is True
//
// 9/19/97 - Method KeyDown, Set ProcessingNotInList to True on escape so
//           validation is skipped in CMExit
//
// 9/28/97 - Assign TField.Text property intead of AsString property to fire
//           TField.OnSetText
//
// 10/5/97 - Method RefreshDisplay modifed to call DoLookup(False) to ensure
//           that lookuptable is positioned correctly before reading values.
//           Call this method to refresh the lookupcombo based on changes in
//           lookuptable.
//
// 10/12/97- Allows component to left-justify when exiting by setting selStart
//           to 0 in cmExit
// 10/16/97- When you have multiple combos on a form and the state changed from
//           Browse to Edit, then the combo would have its index changed while the
//           dropdown list was visible.  SetValue modified.
//
// 10/20/97- Use EnableEdit instead of FFieldLink.Edit so flag is set
// 10/20/97- Prevent the index from switching when delete key is pressed
// 10/21/97- Fix bug when drop-down grid remains visible after leaving column in
//           grid
//
// 10/27/97 - Fix for drawing text as disabled when control is dropdownlist style
//
// 10/29/97 - Search on calculated or lookup fields during incremental searching.
//            Previously used Locate method which did not support this.
//
// 11/6/97 -  Control was blank in some cases (i.e record-view dialog).  This
//            problem is now fixed.
//
// 11/15/97 - In Some Cases Quicken-Style would not work with autodropdown.
//            problem is now fixed.
//
// 11/19/97 - Fix - AllowClearKey when dropped down would change index order
// 11/25/97 - csDropDownList previosly did not update text when display field
//            differed from stored field in certain cases.
//
// 12/2/97 -  linked/lookup field use linked/lookup field value.
//            Optmization code now executed even when control is not visible
// 1/22/98 -  Don't allow clear key if csDropDownList
// 1/23/98 -  Clear FDisplayValue and hiliterow in AllowClearKey dropped-down case
//
// 2/5/98 -   Clear FDatalink.modified when encountering a vk_esc
//
// 2/20/98 - Don't clear tfield, so that esc can restore original contents
// 2/24/98 - Enable timer in KeyPress instead of KeyUp
//
// 3/1/98 -  Have NotInList event support for expression indexes
// 4/17/98 - Finish drawing down state in TwwComboButton MouseDown event
// 5/11/98 - Support Ctl3d=False
// 6/11/98 - Check for readonly flag when changing linked fields
// 8/24/98 - Support Delphi 4 ActionLists
// 8/25/98 - RefreshDisplay did not work properly with blank lookup values
// 8/25/98 - Update horzscrollbar property based on column widths.  This fixes
//           problem when have less rows than drop-down count.  The problem caused
//           the drop-down list to have the wrong active row when the last record
//           was selected.
// 8/26/98 - Adjust height more accurately as drop-down list was too tall when
//           titles were not shown in drop-down list
// 9/1/98 -  Don't call SetFocus unless CanFocus returns true in CMExit
// 9/2/98 -  Call FButton.Update in paint event so Delphi 4 paints icon correctly
//           in DBCtrlGrid
// 10/6/98 - Check dgTabs in cnKeyDown
// 10/8/98 - Fix problem with dgRowLines having the wrong number of records dropped down
// 10/16/98 - Drop-down grid created with height=0 for faster performance
// 11/15/98 - Calling closeup immediately would cause problems from hook
// 11/24/98 - Fix issues with pasting into control with respect to cs_DropDownList
// 1/20/99 -  Don't allow clear key if csDropDownList with AllowClearKey=False
// 1/21/99 -  Fix paint problem in situations where user invokess a dialog
              and when the dialog closes the focus returns to this control.
// 1/25/99 - Prevent grid's OnKeyDown from firing twice when encounter tab or cr
// 1/27/99 - Fixed problem with lookupfields where it was trying to assign a string
//           to the lookup field
// 3/9/99 -  Raise exception if exception raised in TField OnValidate.  Previously
//           the exception message would not be shown.  Also the focus could be lost without
//           this change.
// 3/14/99 - Remove flicker when shortening drop-down list (Delphi 4 problem only )
// 3/23/99 - Fix for 3/14/99 change
// 3/29/99 - RSW Don't clear unbound control if not in list
// 5/12/99 - Avoid exception by checking if semi-color exists in lookup field
// 5/27/99 - When clicking on a different combo dropdown controls edit area the
//           current combos text would be cleared after a delete.
// 6/16/99 - Fix problem where text didn't get cleared in tfield
// 7/25/99 - If entered text is not subset of current lookup record,
//           then set inlist to false.  This could happen if a trailing space
//           was in the entered text
}
interface

{$i wwIfDef.pas}

uses Windows, Classes, StdCtrls, DB, Controls, Messages, SysUtils,
  Forms, Graphics, Menus, Buttons, DBTables, Grids, dialogs,
  wwTable, {dsgnintf, }wwCommon, wwstr, wwdbigrd, extctrls, wwlocate, dbctrls,
  wwtypes, wwframe;

type

  TNotifyCloseUpEvent = procedure(Sender: TObject;
     LookupTable: TDataSet; FillTable: TDataSet; modified: boolean) of object;
  TNotInListEvent = procedure(Sender: TObject;
     LookupTable: TDataSet; NewValue: string; var Accept: boolean) of object;

  TwwPopupGrid = class;

  TwwDBLookupComboStyle = (csDropDown, csDropDownList);
  TwwDBLookupListOption = (loColLines, loRowLines, loTitles);
  TwwDBLookupListOptions = set of TwwDBLookupListOption;

  TwwCalcFieldType = (cftUnknown, cftCalculated, cftNotCalculated);

  TwwSeqSearchOption = (ssoEnabled, ssoCaseSensitive);
  TwwSeqSearchOptions = set of TwwSeqSearchOption;

//  TwwLookupComboButtonStyle = (lcbsEllipsis, lcbsDownArrow, lcbsCustom);

  TwwDBCustomLookupCombo= class(TCustomEdit)
  private
    FDropDownAlignment: TLeftRight;
    FCanvas: TControlCanvas;
    FDropDownCount: Integer;
    FDropDownWidth: Integer;
    FBtnControl: TWinControl;
    FStyle: TwwDBLookupComboStyle;
    FOnDropDown: TNotifyEvent;
    FOnCloseUp: TNotifyCloseUpEvent;
    FOnNotInList: TNotInListEvent;
    FShowMatchText: boolean;

    ChangingFromLink: boolean;
    ProcessingNotInList: boolean;
    InCloseUpEvent: boolean;
    FSearchDelay: integer;
    FAutoDropDown: boolean;
    FSearchField: String;
    FSeqSearchOptions: TwwSeqSearchOptions;
    FOrderByDisplay: boolean;
    FItemCount: integer;
    FPreciseEditRegion: boolean;
    FAllowClearKey: boolean;
    FUseTFields: boolean;
    FImageList: TImageList;
    FButtonStyle: TwwComboButtonStyle;

    ExtraHeight: integer;     { Extra 1 pixel for height when in 16 bit }
    FControlInfoInDataset: boolean;
    FFrame: TwwEditFrame;
    FUnboundAlignment: TAlignment;
    FButtonEffects: TwwButtonEffects;
    FButtonGlyph: TBitmap;
    FButtonWidth: integer;
//    FFlatButton: boolean;
//    FFlatButtonTransparent: boolean;
//    FTransparent: boolean;
//    FCreateTransparent: boolean;

//    procedure SetTransparent(val: boolean);
    SkipUpdate: boolean;

    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetLookupTable: TDataSet;
    function GetLookupField: string;
    function GetReadOnly: Boolean;
    function GetValue: string;
    function GetValue2: string;
    function GetValue3: string;

//    procedure BtnMouseDown(Sender: TObject; Button: TMouseButton;
//       Shift: TShiftState; X, Y: Integer);
    procedure EnableEdit;
    function GetDisplayValue: string;
    function GetMinHeight: Integer;
    function GetOptions: TwwDBLookupListOptions;
    function CanEdit: Boolean;
    function Editable: Boolean;
    function MouseEditable: Boolean;
    procedure SetValue(const NewValue: string);
    procedure SetDisplayValue(const NewValue: string);
    procedure DataChange(Sender: TObject);
    procedure EditingChange(Sender: TObject);
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
{    procedure SetLookupSource(Value: TDataSource);} { 4/30/97 - Not used }
    procedure SetLookupTable(sel : TDataSet);
    procedure SetLookupField(const Value: string);
    procedure SetReadOnly(Value: Boolean);
    procedure SetOptions(Value: TwwDBLookupListOptions);
    procedure SetStyle(Value: TwwDBLookupComboStyle);
    Procedure SetPreciseEditRegion(val: boolean);
    procedure FieldLinkActive(Sender: TObject);
    procedure NonEditMouseDown(var Message: TWMLButtonDown);
    procedure DoSelectAll;
    procedure SetEditRect;
    procedure WMPaste (var Message: TMessage); message WM_PASTE;
    procedure WMCut (var Message: TMessage); message WM_CUT;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CMCancelMode(var Message: TCMCancelMode); message CM_CANCELMODE;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure CMEnter(var Message: TCMGotFocus); message CM_ENTER;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure WMChar(var Msg: TWMChar); message WM_CHAR;
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBkgnd;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    function getSelectedFields: TStrings;
    procedure setSelectedFields(sel : TStrings);

    function GetShowButton: boolean;
    procedure SetShowButton(sel: boolean);
    Function IsLookup: boolean;
    Procedure SetUseTFields(val: boolean);
    Function GetControlType: TStrings;
    Procedure SetControlType(val: TStrings);
    procedure SetButtonGlyph(Value: TBitmap);
    procedure SetButtonStyle(val: TwwComboButtonStyle);
    Procedure SetButtonWidth(val: integer);
    function GetButtonWidth: integer;

  protected
    FFieldLink: TFieldDataLink;
    FTimer: TTimer;

    FGrid: TwwPopupGrid;
    FButton: TSpeedButton;
    FLastSearchKey: string;  { Last Incremental Search value }
    InList: Boolean;
    TypedInText: string;
    OldLookupValue, OldDisplayValue: string; { Restore backvalues for unbound case}
    InAutoDropDown: boolean;
    SkipDataChange: boolean;  { Skip DataChange event so index doesn't change }
    FMouseInButtonControl: boolean;
    FFocused: Boolean;

    Function HasMasterSource: boolean;
    Function UseSeqSearch: boolean;
    Function LTable: TwwTable;
    Function IsWWCalculatedField: boolean;
    Procedure DrawButton(Canvas: TCanvas; R: TRect; State: TButtonState;
       ControlState: TControlState; var DefaultPaint: boolean); virtual;

    Function SetValue2: string; { Set based on 2nd lookup field }
    Function SetValue3: string; { Set based on 3rd lookup field }
    procedure WwChangeFromLink(AlookupTable: TDataSet; var modified: boolean);
    procedure OnEditTimerEvent(Sender: TObject);  { Delay before doing incremental search }
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    function GetLookupSource: TDataSource;

    procedure UpdateData(Sender: TObject);

    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure Change; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure GridClick (Sender: TObject);
    procedure Loaded; override;
    Function GetLookupValue : string;
    procedure RedrawListGrid;
    Function LoadComboGlyph: HBitmap; virtual;
    procedure CNKeyDown(var Message: TWMKeyDown); message CN_KEYDOWN; {handle tab}
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure UpdateFromCurrentSelection;
    procedure UpdateSearchIndex(useDisplayIndex: boolean);
    Function GetSearchIndex: integer;
    Procedure SetModified(val: boolean);
    Function IsValidChar(key: word): boolean;
    Function IsLookupDlg: boolean; virtual;
    Function IsLookupRequired: boolean;
    Function DoFindRecord(ASearchValue, ASearchField: string;  { For TwwTable finds }
                          matchType: TwwLocateMatchType): boolean;
    Procedure ComputeLookupFields;
    Procedure UpdateButtonPosition;
    function FindRecord(
       KeyValue: string;
       LookupField: string;
       MatchType: TwwLocateMatchType;
       CaseSensitive: boolean): boolean;
//    procedure GetEditRectForFrame(var Loc: TRect); virtual;
    procedure DrawFrame(Canvas: TCanvas); virtual;
    procedure GlyphChanged(Sender: TObject); virtual;
    function IsCustom: Boolean; virtual;
    function Is3DBorder: boolean;
    function GetEffectiveAlignment: TAlignment;
    procedure InvalidateTransparentButton;

  public
    wwDBCalcFieldType : TwwCalcFieldType;
    Patch: Variant;

    {$ifdef wwdelphi4up}
    function ExecuteAction(Action: TBasicAction): Boolean; override; { 8/24/98 }
    function UpdateAction(Action: TBasicAction): Boolean; override; {8/24/98}
    {$endif}

    function isTransparentEffective: boolean;
    procedure RefreshDisplay;  {Used only by property editor in design mode }
    procedure RefreshButton;
    procedure PerformSearch; { Call this from your onDropDown event if you apply a filter}

    procedure KeyPress(var Key: Char); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DropDown; dynamic;
    procedure CloseUp (modified: boolean); dynamic;
    property Value: string read GetValue write SetValue;
    property Value2: string read GetValue2;
    property Value3: string read GetValue3;
    property LookupValue: string read GetLookupValue write SetValue;
    property DisplayValue: string read GetDisplayValue write SetDisplayValue;
    property SearchField: string read FSearchField write FSearchField;

    property DropDownAlignment: TLeftRight read FDropDownAlignment write FDropDownAlignment;
    property Selected : TStrings read getSelectedFields write setSelectedFields;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property ButtonStyle: TwwComboButtonStyle read FButtonStyle write SetButtonStyle;
    property ButtonEffects: TwwButtonEffects read FButtonEffects write FButtonEffects;
//    property ButtonFlat : boolean read GetFlatButton write SetFlatButton default False;
//    property ButtonTransparent: boolean read FFlatButtonTransparent write SetFlatButtonTransparent default false;
    property ButtonGlyph: TBitmap read FButtonGlyph write SetButtonGlyph stored IsCustom;
    property ButtonWidth: integer read GetButtonWidth write SetButtonWidth default 0;
    property LookupTable : TDataSet read getLookupTable write setLookupTable;
    property LookupField: string read GetLookupField write SetLookupField;
    property Options: TwwDBLookupListOptions read GetOptions write SetOptions default [];
    property Style: TwwDBLookupComboStyle read FStyle write SetStyle default csDropDown;
    property DropDownCount: Integer read FDropDownCount write FDropDownCount default 8;
    property DropDownWidth: Integer read FDropDownWidth write FDropDownWidth default 0;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property AutoDropDown: boolean read FAutoDropDown write FAutoDropDown;
    property OnDropDown: TNotifyEvent read FOnDropDown write FOnDropDown;
    property OnCloseUp: TNotifyCloseUpEvent read FOnCloseUp write FOnCloseUp;
    property ShowButton: boolean read GetShowButton write SetShowButton;
    property SeqSearchOptions: TwwSeqSearchOptions read FSeqSearchOptions write FSeqSearchOptions
             default [ssoEnabled];
//    property Transparent: boolean read FTransparent write SetTransparent;
    property OnNotInList: TNotInListEvent read FOnNotInList write FOnNotInList;
    property Grid : TwwPopupGrid read FGrid write FGrid;
    property OrderByDisplay: boolean read FOrderByDisplay write FOrderByDisplay default True;
    property PreciseEditRegion: boolean read FPreciseEditRegion write SetPreciseEditRegion;
    property AllowClearKey: boolean read FAllowClearKey write FAllowClearKey;
    property ShowMatchText: boolean read FShowMatchText write FShowMatchText default False;
    property UseTFields: boolean read FUseTFields write SetUseTFields default True;
    property ImageList:TImageList read FImageList write FImageList;
    property ControlInfoInDataset: boolean
             read FControlInfoInDataset write FControlInfoInDataSet default True;
    property ControlType: TStrings read GetControlType write SetControlType;
    property Frame: TwwEditFrame read FFrame write FFrame;
    property UnboundAlignment : TAlignment read FUnboundAlignment write FUnboundAlignment default taLeftJustify;
    property SearchDelay: integer read FSearchDelay write FSearchDelay default 0;
  published
    {$ifdef wwDelphi4Up}
    property Anchors;
    property BiDiMode;
    property Constraints;
    property ParentBiDiMode;  { 2/18/99 - Case sensitive name for Builder 4 }
    {$endif}
    property AutoSize;
    property Ctl3D;
    property Font;
    property CharCase;
    property BorderStyle;
  end;

  TwwDBLookupCombo= class(TwwDBCustomLookupCombo)
  published
    property ControlInfoInDataset;
    property ControlType;
    property DropDownAlignment;
    property Selected;
    property DataField;
    property DataSource;
    property LookupTable;
    property LookupField;
    property Options;
    property Style;
    property AutoSelect;
    property Color;
    property DragCursor;
    property DragMode;
    property DropDownCount;
    property DropDownWidth;
    property Enabled;
    property ButtonStyle default cbsDownArrow;
    property ButtonEffects;

    property Frame;
    property ButtonWidth;
    property ButtonGlyph;
    {$ifdef wwDelphi3Up}
    property ImeMode;
    property ImeName;
    {$endif}
    property ImageList;
    property MaxLength;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property AutoDropDown;
    property ShowButton;
    property SeqSearchOptions;
    property OrderByDisplay;
    property SearchDelay;
    property UseTFields;
    property UnboundAlignment;
//    property Transparent;

{    property PreciseEditRegion;}
    property AllowClearKey;
    property ShowMatchText;

    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDropDown;
    property OnCloseUp;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnNotInList;
  end;


  TwwDBLookupList = class(TwwCustomDBGrid)
  private
    FCombo: TwwDBCustomLookupCombo;
{    FSelected : TStrings;}

    FFieldLink: TFieldDataLink;
    FLookupField: String;
    FDisplayFld: TField;
    FValueFld: TField;  { Lookup Field - Should be unique }
    FValueFld2: TField; { If have 2 lookup fields }
    FValueFld3: TField; { If have 3 lookup fields }
    FValue: String;
    FValue2: String;
    FValue3: String;
    FDisplayValue: String;
    FHiliteRow: Integer;
    FOptions: TwwDBLookupListOptions;
    FTitleOffset: Integer;
    FFoundValue: Boolean;
    FInCellSelect: Boolean;
    FOnListClick: TNotifyEvent;
    BeAccurate: boolean;
    inDataChanged: integer;
    DummyString: string;  { Used so string is on heap instead of stack }

    function getSelectedFields: TStrings;
    procedure setSelectedFields(sel : TStrings);

    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetLookupSource: TDataSource;
    function GetLookupField: string;
    Function GetLookupTable: TDataSet;
    function GetValue: string;
    function GetValue2: string;
    function GetValue3: string;
    function GetDisplayValue: string;
    function GetReadOnly: Boolean;
    procedure FieldLinkActive(Sender: TObject);
    procedure DataChange(Sender: TObject);
    procedure EditingChange(Sender: TObject);
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetLookupSource(Value: TDataSource);
    procedure SetLookupTable(value : TDataSet);
    procedure SetLookupField(const Value: string);
    procedure SetValue(const Value: string);
    procedure SetDisplayValue(const Value: string);
    procedure SetReadOnly(Value: Boolean);
    procedure SetOptions(Value: TwwDBLookupListOptions);
    procedure UpdateData(Sender: TObject);
    procedure NewLayout;
    procedure FastLookup;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
  protected
    Function LTable: TwwTable;
    Function isWWCalculatedField: boolean;
    function HighlightCell(DataCol, DataRow: Integer; const Value: string;
      AState: TGridDrawState): Boolean; override;
    function CanGridAcceptKey(Key: Word; Shift: TShiftState): Boolean; override;
    procedure DefineFieldMap; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;

    function CanEdit: Boolean; virtual;
    procedure InitFields(showError: boolean);
    procedure CreateWnd; override;
    procedure KeyPress(var Key: Char); override;
    procedure LinkActive(Value: Boolean); override;
    procedure Scroll(Distance: Integer); override;
    procedure ListClick; dynamic;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure Paint; override;
    procedure DataChanged; override;

    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;  AState: TGridDrawState); override;

  public
    lookupFieldCount: integer;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    property Value: string read GetValue write SetValue;
    property DisplayValue: string read GetDisplayValue write SetDisplayValue;
    property DisplayFld: TField read FDisplayFld;
    property VisibleRowCount;

    procedure SetColumnAttributes; override;
    procedure DoLookup(SetToDisplayIndex: boolean);

  published
    {$ifdef wwDelphi4Up}
    property Anchors;
    property Constraints;
    {$endif}
    property Selected : TStrings read getSelectedFields write setSelectedFields;
    property LookupTable : TDataSet read GetLookupTable write setLookupTable;

    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property LookupField: string read GetLookupField write SetLookupField;
    property Options: TwwDBLookupListOptions read FOptions write SetOptions default [];
    property OnClick: TNotifyEvent read FOnListClick write FOnListClick;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property Align;
    property BorderStyle;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
  end;


  TwwPopupGrid = class(TwwDBLookupList)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    function CanEdit: Boolean; override;
    procedure LinkActive(Value: Boolean); override;

  public
    property RowCount;
    property ColCount;
    constructor Create(AOwner: TComponent); override;
  end;


  TwwComboButton = class(TSpeedButton)
  protected
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure paint; override;
  end;

procedure Register;

implementation

uses DBConsts, wwintl,
{$ifdef wwDelphi3Up}
 BDEConst,
{$endif}
wwdbgrid, wwquery;

{$IFDEF WIN32}
{$R WWDBD32.RES}
{$ELSE}
{$R WWDBDLG.RES}
{$ENDIF}


type
  TCheatGridCast = class(TCustomGrid);

{$ifdef wwDelphi3Up}
procedure RaiseException(error: string);
{$else}
procedure RaiseException(error: word);
{$endif}
begin
  {$ifdef wwDelphi3Up}
   raise EInvalidOperation.Create (error);
  {$else}
   raise EInvalidOperation.Create (LoadStr (error));
  {$endif}
end;

{ TwwDBCustomLookupCombo}

{ The following hook proc is a workaround for a delphi 4 bug
  where it no longer sends a CM_CANCELMODE message when the end-user
  clicks away from the dropped down list }
{$ifdef wwDelphi4up}
var wwLookupComboHook: HHOOK;

function wwLookupComboHookProc(nCode: Integer; wParam: Integer; lParam: Integer): LResult; stdcall;
var r1, r2: TRect;
begin
  result := CallNextHookEx(wwLookupComboHook, nCode, wParam, lParam);
  with PMouseHookStruct(lParam)^ do
  begin
    if (wParam = WM_LBUTTONDOWN) or (wParam = WM_NCLBUTTONDOWN) then
    begin
      if (Screen.ActiveControl <> nil) and (Screen.ActiveControl is TwwDBCustomLookupCombo) then
        with (Screen.ActiveControl as TwwDBCustomLookupCombo) do
      begin
        { Auto-closeup if clicked outside of drop-down area }
        if FGrid.visible then begin
           GetWindowRect(FGrid.Handle, r1);
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

type
  TwwComboButtonEffects = class(TwwButtonEffects)
     protected
        procedure Refresh; override;
  end;

 TBtnWinControl = class(TWinControl)
 private
    EditControl: TwwDBCustomLookupCombo;
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBkgnd;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  public
    constructor Create(AOwner: TComponent); override;
 end;

Procedure TwwComboButtonEffects.refresh;
begin
   (Button as TSpeedButton).Glyph.Handle:=
     TwwDBCustomLookupCombo(Control).LoadComboGlyph;
end;

procedure TBtnWinControl.WMEraseBkgnd(var Message: TWmEraseBkgnd);
var r: TRect;
    cc: TwwDBCustomLookupCombo;
begin
  cc:= TwwDBCustomLookupCombo(parent);
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

constructor TBtnWinControl.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   EditControl:= AOwner as TwwDBCustomLookupCombo;
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



constructor TwwDBCustomLookupCombo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FButtonStyle:= cbsDownArrow;
  FLastSearchKey:= '';
{  AutoSize := False; } { Removed 5/2/97 }

{$IFDEF WIN32}
  ControlStyle := ControlStyle + [csReplicatable];
  ExtraHeight:= 0;
{$ELSE}
  ExtraHeight:= 1;
{$ENDIF}

  FFieldLink := TFieldDataLink.Create;
  FFieldLink.Control := Self; {Release adds this }
  FFieldLink.OnDataChange := DataChange;
  FFieldLink.OnEditingChange := EditingChange;
  FFieldLink.OnUpdateData := UpdateData;
  FFieldLink.OnActiveChange := FieldLinkActive;

  FBtnControl := TBtnWinControl.Create (Self);
  {$IFDEF WIN32}
  FBtnControl.ControlStyle := FBtnControl.ControlStyle + [csReplicatable];
  {$ENDIF}
  FBtnControl.Width:= wwmax(GetSystemMetrics(SM_CXVSCROLL)+4, 17); {4/14/97}
  FBtnControl.Height := 17;
  FBtnControl.Visible := True;;
  FBtnControl.Parent := Self;

  FButton := TwwComboButton.Create (Self);
  {$IFDEF WIN32}
  FButton.ControlStyle := FButton.ControlStyle + [csReplicatable];
  {$ENDIF}
  FButton.SetBounds (0, 0, FBtnControl.Width, FBtnControl.Height);
  FButton.Width:= wwmax(GetSystemMetrics(SM_CXVSCROLL), 15); {5/2/97 }
  FButton.Visible := True;
  FButton.Parent := FBtnControl;

  FGrid := TwwPopupGrid.Create(Self);
  FGrid.height:= 0; { 10/16/98 -Faster performance }
  FGrid.FCombo := Self;
  FGrid.Parent := Self;
  FGrid.Visible := False;
  FGrid.OnClick := GridClick;
  FGrid.Ctl3D:= self.Ctl3D;

  Height := 25;
  FDropDownCount := 8;

  FTimer:= TTimer.create(self);
  FTimer.enabled:= False;
  FSearchDelay:= 0;
  FTimer.Interval:= 200;
  FTimer.OnTimer:= OnEditTimerEvent;

  wwDBCalcFieldType:=cftUnknown;
  ChangingFromLink:= False;
  InAutoDropDown:= False;
  AutoDropDown:= False;
  InList:= True;

  SeqSearchOptions:= [ssoEnabled];
  FOrderByDisplay:= True;
  FUseTFields:= True;

  FControlInfoInDataset:= True;
//  Transparent:= False;
  FFrame:= TwwEditFrame.create(self);

  FButtonGlyph := TBitmap.Create;
  FButtonGlyph.OnChange := GlyphChanged;

  FButtonEffects:= TwwComboButtonEffects.create(self, FButton);
  FButton.Glyph.Handle := LoadComboGlyph;

end;

destructor TwwDBCustomLookupCombo.Destroy;
begin
  FFrame.Free;
  FButtonEffects.Free;
  FTimer.Free;
  FFieldLink.OnDataChange := nil;
  FFieldLink.Free;
  FFieldLink := nil;

  FButton.Free;
  FButton:= Nil;
  FCanvas.Free;
  FCanvas:= Nil;
  FGrid.Free;
  FGrid:= Nil;

  {$ifdef wwDelphi4up}
  if wwLookupComboHook<>0 then begin
     UnhookWindowsHookEx(wwLookupComboHook);
     wwLookupComboHook:= 0;
  end;
  {$endif}
  
  FButtonGlyph.Free;
  inherited Destroy;
end;

Function TwwDBCustomLookupCombo.LoadComboGlyph: HBitmap;
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

{Function TwwDBCustomLookupCombo.LoadComboGlyph: HBitmap;
begin
   result:= 0;
   if ButtonEffects.Flat or ButtonEffects.Transparent then
      result:= LoadBitmap(HInstance, 'WWDROPDOWN')
//   result:= LoadBitmap(0, PChar(32738));
end;
}
procedure TwwDBCustomLookupCombo.SetButtonStyle(val: TwwComboButtonStyle);
begin
   if val<>FButtonStyle then begin
      FButtonStyle:= val;
      FButton.Glyph.Handle:= LoadComboGlyph;
      FButton.Invalidate;
   end
end;

function TwwDBCustomLookupCombo.IsCustom: Boolean;
begin
  Result := ButtonStyle = cbsCustom;
end;

procedure TwwDBCustomLookupCombo.SetButtonGlyph(Value: TBitmap);
begin
  FButtonGlyph.Assign(Value);
  Invalidate;
end;

procedure TwwDBCustomLookupCombo.GlyphChanged(Sender: TObject);
begin
   FButton.Glyph.Handle:= LoadComboGlyph;
   Invalidate;
end;

Procedure TwwDBCustomLookupCombo.SetButtonWidth(val: integer);
begin
   if FButtonWidth<>val then
   begin
      FButtonWidth:= val;
      if val<>0 then FButton.Width:= val
      else FButton.Width:= wwmax(GetSystemMetrics(SM_CXVSCROLL), 15);
      UpdateButtonPosition;
   end
end;

function TwwDBCustomLookupCombo.GetButtonWidth: integer;
begin
   result:= FButtonWidth;
end;


function TwwDBCustomLookupCombo.GetShowButton: boolean;
begin
   result:= FBtnControl.visible;
end;

procedure TwwDBCustomLookupCombo.SetShowButton(sel: boolean);
begin
   if (FBtnControl.visible<> sel) then
   begin
      FBtnControl.visible:= sel;
      SetEditRect;
      self.invalidate;
   end
end;

Function TwwDBCustomLookupCombo.LTable: TwwTable;
begin
   result:= LookupTable as TwwTable;
end;

Function TwwDBCustomLookupCombo.UseSeqSearch: boolean;
begin
   result:= (not (LookupTable is TwwTable)) or
            ((LookupTable as TwwTable).indexDefs.count=0) or
            ((LookupTable as TwwTable).indexFieldCount=0);

   { Still perform index search if xBASE expression index }
   if result and (LookupTable is TwwTable) then with (LookupTable as TwwTable) do
   begin
       result:= not
         (isDBaseTable and (SearchField<>'') and (IndexDefs.indexof(IndexName)>=0) and
          (ixExpression in IndexDefs.Items[IndexDefs.indexof(IndexName)].Options));
   end
end;

function TwwDBCustomLookupCombo.FindRecord(
       KeyValue: string;
       LookupField: string;
       MatchType: TwwLocateMatchType;
       CaseSensitive: boolean): boolean;
var curField: TField;
begin
   if (LookupTable is TwwTable) then
      result:= (LookupTable as TwwTable).wwFindRecord(KeyValue, LookupField, MatchType, CaseSensitive)
   else begin
      { 5/12/99 - Avoid exception by checking if semi-colon exists in lookup field }
      if (pos(';', LookupField)=0) and (LookupTable.FieldByName(LookupField).asString=KeyValue) then begin
         result:= True;
         FGrid.invalidate;  { In case nothing was highlighted before }
      end
      else begin
         curField:= LookupTable.FindField(LookupField);

         {7/24/97 - Limit length to be up to field size }
         if (curField is TStringField) and (curField.size>0) and (curField.size<length(Text)) then
            KeyValue:= copy(KeyValue, 1, curField.size);

         { If invalid value type or blank (blank lookup is slow) then skip search }
         if (not wwFieldIsValidLocateValue(curField, KeyValue)) or
            (KeyValue='') then
         begin
            result:= False;
            FGrid.invalidate;
         end
         else if (not wwInternational.UseLocateMethodForSearch) then
             result:= wwDataSetFindRecord(LookupTable, KeyValue, LookupField, MatchType, caseSensitive)
         { 10/29/97 - Search on calculated or lookup fields }
         {$ifdef win32}
         else if (curfield.calculated or curfield.lookup) then
         {$else}
         else if (curfield.calculated) then
         {$endif}
             result:= wwDataSetFindRecord(LookupTable, KeyValue, LookupField, MatchType, False)
         {$ifndef win32}
         else result:= wwDataSetFindRecord(LookupTable, KeyValue, LookupField, MatchType, caseSensitive)
         {$else}
         else if not (LookupTable is TwwQuery) then
         begin
            { 9/20/97 - Replace wwDataSetFindRecord call with Locate to allow 3rd party engines
                        opportunity to take advantage of the index.  The end-user should set
                        SeqSearchOptions to the case sensitivity of the index so that the
                        index can be used }
            {$ifdef wwDelphi3Up}
            Screen.cursor:= crHourGlass;
            if caseSensitive then begin
               if (MatchType=mtExactMatch) then result:= LookupTable.Locate(LookupField, KeyValue, [])
               else result:= LookupTable.Locate(LookupField, KeyValue, [loPartialKey]);
            end
            else begin
               if (MatchType=mtExactMatch) then result:= LookupTable.Locate(LookupField, KeyValue, [loCaseInsensitive])
               else result:= LookupTable.Locate(LookupField, KeyValue, [loPartialKey, loCaseInsensitive]);
            end;
            Screen.cursor:= crDefault;
            {$else}
            result:= wwDataSetFindRecord(LookupTable, KeyValue, LookupField, MatchType, caseSensitive)
            {$endif}
         end
         else if (LookupTable is TwwQuery) and TwwQuery(LookupTable).RequestLive and
                   TwwQuery(LookupTable).CanModify then
         begin
             Screen.cursor:= crHourGlass;
             { Require seq search on live parameterized query as Delphi Locate does not support this}
             if (TwwQuery(LookupTable).DataSource<>Nil) then
                result:= wwDataSetFindRecord(LookupTable, KeyValue, LookupField, MatchType, caseSensitive)
             else if (MatchType=mtExactMatch) then begin
                try
                  if TwwQuery(LookupTable).isValidIndexField(LookupField, False) then
                     result:= LookupTable.Locate(LookupField, KeyValue, [loCaseInsensitive])
                  else if TwwQuery(LookupTable).isValidIndexField(LookupField, True) then
                     result:= LookupTable.Locate(LookupField, KeyValue, [])
                  else
                     result:= wwDataSetFindRecord(LookupTable, KeyValue,
                                                  LookupField, MatchType, caseSensitive);
                  Screen.cursor:= crDefault;
                except
                  result:= wwDataSetFindRecord(LookupTable, KeyValue, LookupField, MatchType, caseSensitive)
                end
             end
             else begin
                try
                  if TwwQuery(LookupTable).isValidIndexField(LookupField, False) then
                     result:= LookupTable.Locate(LookupField, KeyValue, [loCaseInsensitive, loPartialKey])
                  else if TwwQuery(LookupTable).isValidIndexField(LookupField, True) then
                     result:= LookupTable.Locate(LookupField, KeyValue, [loPartialKey])
                  else
                     result:= wwDataSetFindRecord(LookupTable, KeyValue,
                                                  LookupField, MatchType, caseSensitive);
                  Screen.cursor:= crDefault;
                except
                  result:= wwDataSetFindRecord(LookupTable, KeyValue, LookupField, MatchType, caseSensitive)
                end;
             end
         end
         else begin
            Screen.cursor:= crHourGlass;
            if (MatchType=mtExactMatch) then result:= LookupTable.Locate(LookupField, KeyValue, [])
            else result:= LookupTable.Locate(LookupField, KeyValue, [loPartialKey, loCaseInsensitive]);
            Screen.cursor:= crDefault;
         end
         {$endif}
      end
   end
end;

procedure TwwDBCustomLookupCombo.OnEditTimerEvent(Sender: TObject);
var SearchIndex: integer;
    isFound: boolean;
    SearchText: string;
    TempSearchField: string;
begin
   FTimer.enabled:= False;

   if (text <> FLastSearchKey) and (LookupTable<>Nil) and LookupTable.active then
   begin
      if UseSeqSearch then begin
         if ssoEnabled in SeqSearchOptions then begin
            if FGrid.visible or InAutoDropDown then  { 8/17/96 - Execute code if inAutoDropDown }
            begin
               inList:= FindRecord(Value, FGrid.DisplayFld.FieldName,
                    mtPartialMatchStart, ssoCaseSensitive in SeqSearchOptions);
               if (not inList) and (FGrid.FDisplayFld=FGrid.FValueFld) then
               begin
{                  FGrid.FDisplayValue:= OldDisplayValue;
                  FGrid.FValue:= OldLookupValue;}
                  FGrid.FValue:= '';
                  exit;
               end
            end
            else
               inList:= FindRecord(Value, FGrid.DisplayFld.FieldName,
                    mtExactMatch, ssoCaseSensitive in SeqSearchOptions);
            TypedInText:= Text;
            FGrid.FDisplayValue:= FGrid.FDisplayFld.asString;
            { 7/25/99 - If entered text is not subset of current lookup record,
              then set inlist to false.  This could happen if a trailing space
              was in the entered text }
            if inList and (length(FGrid.FDisplayValue)<length(Text)) then
            begin
              inList:= false;
            end;
            isFound:= inList;
         end
         else exit;
      end
      else with (LookupTable as TwwTable) do begin
         { Incrementally search on SearchField }
         { if dBASE then use expression index }
         if isDBaseTable and (SearchField<>'') and (IndexDefs.indexof(IndexName)>=0) and
            (ixExpression in IndexDefs.Items[IndexDefs.indexof(IndexName)].Options) then
         begin
            if not wwFieldIsValidValue(FieldbyName(SearchField), text) then exit;
            EditKey;
            FieldByName(SearchField).asString:= text;
            GoToNearest;
            FGrid.FDisplayValue:= FieldByName(SearchField).asString;
            isFound:= pos(Uppercase(Text), Uppercase(FieldByName(SearchField).asString))=1;
            inList:= isFound; { 3/1/98 - For NotInList event }
         end
         else begin
            SearchIndex:= GetSearchIndex;

            { 8/27/99 - Don't search if index doesn't match search field }
            if (SearchIndex=0) and (FGrid.DisplayFld<>IndexFields[0]) then
            begin
               TempSearchField:= FGrid.DisplayFld.FieldName;
               if (ssoEnabled in SeqSearchOptions) then
               begin
                  if FGrid.visible or InAutoDropDown then
                     inList:= DoFindRecord(Text, TempSearchField, mtPartialMatchStart)
                  else
                     inList:= DoFindRecord(Text, TempSearchField, mtExactMatch)
               end;
               exit;
            end;

            if (SearchIndex>=0) and
               not ((SearchIndex=0) and (FGrid.DisplayFld<>IndexFields[0])) then
            begin
               if FGrid.visible or InAutoDropDown then
                  InList := wwFindNearest(text, SearchIndex)
               else begin
                  case searchindex of { Use searchindex for lookup }
                     1: inList:= wwFindKey([indexFields[0].asString, Text]);
                     2: inList:= wwFindKey([indexFields[0].asString, indexFields[1].asString, Text]);
                     else InList:= wwFindKey([Text]);
                  end;
               end;
               TypedInText:= Text;
               FGrid.FDisplayValue:= IndexFields[SearchIndex].text;
            end
            else begin    {1/22/97}
                if FGrid.visible or InAutoDropDown then
                   inList:= DoFindRecord(Text, SearchField, mtPartialMatchStart)
                else
                   inList:= DoFindRecord(Text, SearchField, mtExactMatch)
            end;

            isFound:= inList;
         end
      end;

         FGrid.FValue:= FGrid.FValueFld.asString;
         if FGrid.FValueFld2<>Nil then
            FGrid.FValue2:= FGrid.FValueFld2.asString;
         if FGrid.FValueFld3<>Nil then
            FGrid.FValue3:= FGrid.FValueFld3.asString;

         if (not FGrid.visible) then FGrid.FHiliteRow:= -1;  { Reset to -1 for UpdateData method - 4/3/97 }

         if FShowMatchText and isFound and
            (FLastSearchKey<>'~~~~') then { vk_delete when dropped down so skip }
         begin
            if selStart>0 then SearchText:= copy(Text, 1, selStart)
            else SearchText:= Text;
            Text:= FGrid.DisplayFld.asString;
            modified:= True;
            selStart:= length(SearchText);
            selLength:= length(Text)-length(SearchText);
            if (not FGrid.visible) then FGrid.FHiliteRow:= 0; { 4/3/97}
         end;

         FLastSearchKey:= text;
{      end}
   end;


end;

procedure TwwDBCustomLookupCombo.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FFieldLink <> nil) then
  begin
    if (AComponent = DataSource) then
      DataSource := nil
    else if (FImageList=AComponent) then
       FImageList:= nil
  end;
end;

function TwwDBCustomLookupCombo.Editable: Boolean;
begin
  if Fgrid.visible then begin
     Result:= True
  end
  else begin
     Result := (FStyle <> csDropDownList) or AutoDropDown;
  end
end;

function TwwDBCustomLookupCombo.MouseEditable: Boolean;
begin
  if Fgrid.visible then begin
     Result:= True
  end
  else begin
     Result := (FStyle <> csDropDownList);
  end
end;

Function TwwDBCustomLookupCombo.IsLookup: boolean;
begin
   {$ifdef win32}
   result:= (FFieldLink.Field<>Nil) and FFieldLink.Field.Lookup;
   {$else}
   result:= False;
   {$endif}
end;

Function TwwDBCustomLookupCombo.IsWWCalculatedField: boolean;

  Function calcOrLookup: boolean;
  begin
     result:=
       (FFieldLink.dataSource.dataSet.fieldByName(dataField).calculated)
        or isLookup;
  end;

begin
     result:=
       ((FFieldLink.dataSource <>Nil) and (FFieldLink.dataSource.dataSet<>Nil) and
        (dataField<>'') and
        (wwDataSetIsValidField(FFieldLink.dataSource.dataSet, dataField)) and
        calcOrLookup);

     if (result and (wwDBCalcFieldType=cftUnknown)) then begin
        if wwDataSetGetLinks(dataSource.dataSet, dataField)='' then
        begin
           if isLookup then
             wwDBCalcFieldType:= cftCalculated
           else
             wwDBCalcFieldType:= cftNotCalculated
        end
        else wwDBCalcFieldType:= cftCalculated;
     end
end;

function TwwDBCustomLookupCombo.CanEdit: Boolean;
begin
  Result := (FFieldLink.DataSource = nil) or (DataField='') or
    (FFieldLink.Editing and Editable) or
     (isWWCalculatedField and
     ((datasource.state in [dsEdit, dsInsert]) or (dataSource.autoEdit)));

  { Calculated fields don't allow edit if csDropDownList style}
  if (not FGrid.Visible) and
     ((Style=csDropDownList) and not AutoDropDown) then
     Result:= False;

  if ReadOnly then Result:= False; {!!! Added 6/8/96}
end;

{ Over-ride tab if owned by a grid }
procedure TwwDBCustomLookupCombo.CNKeyDown(var Message: TWMKeyDown);
var shiftState: TShiftState;

    Function ReturnAsTab: boolean;
    var ParentGrid: TwwCustomDBGrid;
    begin
       if parent is TwwCustomDBGrid then
       begin
          parentGrid:= TwwCustomDBGrid(parent);
          result:= (dgEnterToTab in ParentGrid.KeyOptions) and
                   (Message.charcode = VK_RETURN);
       end
       else result:= False;
    end;

begin
  if not (csDesigning in ComponentState) then
  begin
    with Message do
    begin
       if (charcode = VK_ESCAPE) and not (parent is TwwCustomDBGrid) then begin
          if FGrid.visible then exit; { 6/4/97}

          { 7/28/97 -  If modified then escape restores previous text }
          if modified then begin
             FGrid.FDisplayValue:= OldDisplayValue; {9/18/97 - Use FGrid.FDisplayValue instead of DisplayValue }
             FGrid.FValue:= OldLookupValue;
             Text:= OldDisplayValue;
             modified:= True;   { Leave modified as True so RecordView does not close }

             { 2/5/98 - Resets FFieldLink.modified flag }
             SkipDataChange:= True;
             FFieldLink.Reset;
             SkipDataChange:= False;

             exit;
          end;
       end;

       { Prevent tab from exiting if processing AutoDropDown character }
       if InAutoDropDown then exit;

       if (charcode = VK_TAB) or ReturnAsTab then
       begin
         if FGrid.visible then begin  { drop-down open, treat tab as CR + Tab }
            UpdateFromCurrentSelection;
            if InList then GridClick(self);  { InfoPower 2.0 addition}
            closeUp(True);
            DoSelectAll;
         end
       end;

       if (charcode = VK_TAB) or (charcode = VK_RETURN) then begin
         if not FGrid.Visible then begin
           if parent is TCustomGrid then begin
             if (charcode <> VK_TAB) or (goTabs in TCheatGridCast(parent).Options) then
             begin
               parent.setFocus;
               if parent.focused and
                 (IsInwwObjectView(self) or (charcode=vk_tab) or ReturnAsTab) then
               begin
                 shiftState:= KeyDataToShiftState(KeyData);
                 TCheatGridCast(parent).KeyDown(charcode, shiftState);
               end;
               exit;
             end
           end
         end
         else exit;
       end

    end
  end;
  inherited;
end;


procedure TwwDBCustomLookupCombo.KeyDown(var Key: Word; Shift: TShiftState);
type
  TSelection = record
    StartPos, EndPos: Integer;
  end;

var
  parentGrid: TCustomGrid;
  temp: boolean;

  procedure SendToParent;
  begin
    ParentGrid.setFocus;
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
      Result := (StartPos = 0) and ((EndPos = 0) or (EndPos = GetTextLen));
  end;

  procedure Deselect;
  begin
    {$ifdef win32}
    SendMessage(Handle, EM_SETSEL, -1, 0);
    {$else}
    SendMessage(Handle, EM_SETSEL, 1, $FFFFFFFF);
    {$endif}
  end;

begin
  if GetKeyState(VK_MENU) < 0 then Include(Shift, ssAlt);

  if (not FGrid.visible) and (parent is TCustomGrid) then
  begin
     parentGrid:=  (parent as TCustomGrid);

     case Key of
       { 9/19/97 - Set ProcessingNotInList to True so validation is skipped in CMExit}
       VK_ESCAPE:
          if not modified then begin
             Temp:= ProcessingNotInList;
             ProcessingNotInList:= True;
             SendToParent;
             ProcessingNotInList:= Temp;
          end;

       VK_UP, VK_DOWN, VK_NEXT, VK_PRIOR: if (not Alt) then SendToParent;
       VK_LEFT: if ForwardMovement and (Ctrl or LeftSide) then SendToParent;
       VK_RIGHT: if ForwardMovement and (Ctrl or RightSide) then SendToParent;
       VK_HOME: if ForwardMovement and (Ctrl or LeftSide) then SendToParent;
       VK_END: if ForwardMovement and (Ctrl or RightSide) then SendToParent;
       VK_INSERT: SendToParent;                {Fix - 8/12/96}
       VK_DELETE: if (Ctrl) then SendToParent; {Fix - 8/12/96}
       VK_F2:
         begin
           ParentEvent;
           if Key = VK_F2 then
           begin
             Deselect;
             Exit;
           end;
         end;
     end;
     if (not Editable) and (Key in [VK_LEFT, VK_RIGHT, VK_HOME, VK_END]) then SendToParent;

     if Key <> 0 then
       ParentEvent;
  end;

  { 1/20/99 - Don't allow clear key if csDropDownList regardless of ShowMatchText}
  if {FShowMatchText and }(key in [VK_BACK, VK_DELETE]) then begin
     if (style=csDropDownList) and (not AllowClearKey) and
        (not FGrid.visible) then
           Key:= 0;
  end;

  if Key <> 0 then begin
    { Prevent tab from exiting if processing AutoDropDown character }
    if isValidChar(Key) and FAutoDropDown and (not FGrid.visible) then
       InAutoDropDown:= True;
    inherited KeyDown(Key, Shift);

    if Key in [VK_BACK, VK_DELETE, VK_INSERT] then
    begin
      if Editable then EnableEdit;
      if not CanEdit then
        Key := 0;
    end
    else if not (Editable or isWWCalculatedfield) and (Key in [VK_HOME, VK_END, VK_LEFT, VK_RIGHT]) then
      Key := 0;

    if (Key in [VK_UP, VK_DOWN, VK_NEXT, VK_PRIOR] ) then
    begin
       if not FGrid.Visible then
       begin
         if ssAlt in Shift then begin
            DropDown;
            Key:= 0;
         end
       end
       else begin
         EnableEdit;
         if (FFieldLink.DataSource = nil) or FFieldLink.Editing or isWWCalculatedField then
           if (not ReadOnly) then FGrid.KeyDown (Key, Shift); { 6/11/98 - Check for readonly }
         Key := 0;
       end;
       {5/1/97 - Do not blindly set key:= 0, as key should remain - Necessary for support of
                 TwwRecordView's mapping of vk_down and vk_up to tab and shift-tab }
       {Key:= 0;}
    end
    else if (Key=vk_escape) and FGrid.visible then key:= 0; { 6/4/97 - RecordView ignores keystroke if 0 }

  end;


  if FShowMatchText and (key in [VK_BACK, VK_DELETE]) then begin
     if Grid.visible then FLastSearchKey:= '~~~~';
  end
  else begin
     FLastSearchKey:= '';
  end;


end;

Function TwwDBCustomLookupCombo.GetSearchIndex: integer;
var i, SearchIndex: integer;
begin
   if not wwHasIndex(LookupTable) then
   begin
      result:= -1;
      exit;
   end;
   SearchIndex:= 0;
   if SearchField<>'' then begin
      searchIndex:= -1; {1/22/97}
      if (LookupTable is TwwTable) then with (LookupTable as TwwTable) do begin
         for i:= 0 to indexFieldCount-1 do
         if (lowercase(SearchField)=lowercase(indexFields[i].fieldName)) then
         begin
            SearchIndex:= i;
            break;
         end
      end
   end;
   result:= SearchIndex;
end;

procedure TwwDBCustomLookupCombo.UpdateSearchIndex(useDisplayIndex: boolean);
var curpos: integer;
    curText: string;
    Field1Name, tempField: wwSmallString;
    lkupField: TField;                    {11/15/97}
//    IndexDef: TIndexDef;
begin
   if LookupTable=nil then exit;
   if not (LookupTable is TTable) then exit;
   if (LookupTable is TwwTable) and
      ((LookupTable as TwwTable).Query.Count>0) then exit; { Can't change index on query}

   if useDisplayIndex then begin
      if not (FOrderByDisplay) then exit;
      if Selected.count>0 then begin
         curPos:= 1;
         Field1Name:= strGetToken(Selected[0], #9, curpos);
         curText:= LookupTable.fieldByname(Field1Name).asString;
      end
      else begin
         if (Selected.count=0) then begin {11/15/97 }
            curPos:= 1;
            field1Name:= strGetToken(lookupField, ';', curpos);
            if isWWCalculatedField then lkupField:= FGrid.FDisplayFld
            else lkupField:= lookupTable.findField(field1Name);
            if (lkupField<>Nil) then begin
               Selected.add(
                 lkupField.fieldName + #9 + inttostr(lkupField.displayWidth) + #9 +
                 lkupField.DisplayLabel);
            end
        end
      end;

      if LookupTable is TwwTable then
         (LookupTable as TwwTable).setToIndexContainingFields(Selected) {Search using display key}
      else begin
          wwSetTableIndex(LookupTable, Field1Name);
      end;
      if (LookupTable as TTable).MasterSource<>Nil then begin
         curPos:= 1;
         if Selected.count>0 then begin
            SearchField:= strGetToken(Selected[0], #9, curpos);
            DoFindRecord(curText, SearchField, mtExactMatch); {1/22/97}
         end
      end;
   end
   else begin
      if (LookupTable as TTable).MasterSource<>Nil then begin
         if LookupField<>'' then begin
            curPos:= 1;
            repeat
               TempField:= strGetToken(LookupField, ';', curpos);
               if TempField<>'' then SearchField:= TempField;
            until TempField='';
         end;
         curText:= LookupTable.fieldByname(SearchField).asString;
         if LookupTable is TwwTable then
            (LookupTable as TwwTable).setToIndexContainingField(LookupField)
         else TTable(LookupTable).indexFieldNames:= LookupField;
         DoFindRecord(curText, SearchField, mtExactMatch); {1/22/97}
      end
      else begin
         if LookupTable is TwwTable then
            (LookupTable as TwwTable).setToIndexContainingField(LookupField)
         else TTable(LookupTable).indexFieldNames:= LookupField;
      end
   end

end;

procedure TwwDBCustomLookupCombo.KeyUp(var Key: Word; Shift: TShiftState);
var tempModified: boolean;
    skipSearch: boolean;
begin

   if AllowClearKey then begin
      if FGrid.Visible then begin
         if (not isWWCalculatedField) and
            ((key=vk_delete) or (key=vk_back)) and (Text='') then
         begin
            if (FFieldLink.Field<>Nil) then begin
               EnableEdit;{ 10/20/97 - Go through enableedit so flag is set}
                          {10/20/97 - Prevent the index from switching on delete.}
               FFieldLink.Modified; { 6/6/98 }
               FGrid.FValue:= '';
               FGrid.FDisplayValue:= '';  { 1/23/98 - Clear FDisplayValue and hiliterow }
               FGrid.FHiliteRow:= -1;
               FGrid.invalidate;
            end
            else begin
               FGrid.FValue:= '';
               FGrid.FDisplayValue:= ''; { 1/23/98 - Clear FDisplayValue and hiliterow }
               FGrid.FHiliteRow:= -1;
               FGrid.invalidate;
            end;
            Key:= 0;
         end
      end
      else begin
         if ((key=vk_delete) or (key=vk_back)) and (SelText=Text) {and
            ((Style=csDropDownList) or AutoDropDown) }then
         begin
            if IsWWCalculatedField then begin
                Text:= '';
               Grid.Fvalue:= '';
               Grid.Fvalue2:= '';
               Grid.Fvalue3:= '';
               wwChangeFromLink(LookupTable, tempModified);
               Key:= 0;
            end
            else begin
               Text:= '';
               if (FFieldLink.Field<>Nil) then begin
                  EnableEdit;{ 10/20/97 - Go through enableedit so flag is set }
                             { 10/20/97 - Prevent the index from switching on delete.}
                  FFieldLink.modified; { 6/6/98 }
                  FGrid.FValue:= '';
               end
               else LookupValue:= '';
               Key:= 0;
            end
         end
      end;
   end;

  inherited KeyUp(Key, Shift);

  {3/11/97 - Still perform search if length is 1 }
  if (((FLastSearchKey<>Text) or (length(FLastSearchKey)=1)) and IsValidChar(Key)) then
  begin
     if FShowMatchText and (key in [VK_BACK, VK_DELETE]) then begin
        if (LookupTable is TwwTable) and
           ((LookupTable as TwwTable).Query.Count=0) and
           (LookupTable as TwwTable).narrowSearch and (Text = '') then
           (LookupTable as TwwTable).FastCancelRange;
        skipSearch:= True;
     end
     else begin
        skipSearch:= False;
     end;

     { 1/20/99 - Skip clearing even when ShowMatchText is False }
     if (key in [VK_BACK, VK_DELETE]) then begin
        { 1/22/98 - Don't allow clear if csDropDownList and closed }
        if (not FGrid.visible) and (style=csDropDownList) and
           (not AllowClearKey) then begin
           Key:= 0;
           exit;
        end
     end;

     if (not FGrid.visible) and (not FAutoDropDown) and
        (FShowMatchText) and (Style<>csDropDownList) and { 6/6/98 }
        (Text<>'') and (not skipSearch) then
     begin
        UpdateSearchIndex(True);
        InAutoDropDown:= True;
        OnEditTimerEvent(Self);
        InAutoDropDown:= False;
     end
     else if (not FGrid.visible) and FAutoDropDown and (Text<>'') then
     begin
        UpdateSearchIndex(True);
        InAutoDropDown:= True;
        OnEditTimerEvent(Self);
        try DropDown finally InAutoDropDown:= False end;
     end;
  end;
  InAutoDropDown:= False;

  { Update drop-down data connection when user is typing in box}
  if IsValidChar(Key) and not FGrid.visible then
  begin
     FFieldLink.Modified;
  end;

end;

Procedure TwwDBCustomLookupCombo.RefreshDisplay;
var OrigValue: string;
begin
   OrigValue:= LookupValue; {8/25/98}
   LookupValue:= ''; {10/5/97 }

   FGrid.DoLookup(False);
   if not FGrid.FFoundValue then { 8/25/98}
   begin
      FGrid.FDisplayValue:= '';
      Text:= '';
   end
   else begin
      if FGrid.FDisplayFld=Nil then exit;
      FGrid.FDisplayValue:= FGrid.FDisplayFld.asString;
      Text:= FGrid.FDisplayFld.AsString;
   end;
   FGrid.FValue:= OrigValue {8/25/98}
end;

Procedure TwwDBCustomLookupCombo.UpdateFromCurrentSelection;
begin
    if FTimer.enabled then begin
       FTimer.enabled:= False;
       OnEditTimerEvent(self);
    end
    else begin
       if FGrid.visible and (FGrid.FHiliteRow<0) then exit;  { Default to no selection if nothing selected }

       {9/10/97 - Do not update active record if its a TwwDBLookupComboDlg }
       if not wwIsClass(self.classType, 'TwwDBLookupComboDlg') then begin
          if FGrid.FHiliteRow>=0 then
             FGrid.DataLink.ActiveRecord:= FGrid.FHiliteRow;       { Make sure activerecord is on highlighted row }
       end;
       FGrid.FDisplayValue:= FGrid.FDisplayFld.AsString;
       if (FGrid.FValueFld <> FGrid.FDisplayFld) then begin
          FGrid.FValue:= FGrid.FValueFld.asString;
       end
       else begin
          FGrid.FValue:= FGrid.FDisplayValue;
       end;
       if FGrid.FValueFld2<>Nil then
          FGrid.FValue2:= FGrid.FValueFld2.asString;
       if FGrid.FValueFld3<>Nil then
          FGrid.FValue3:= FGrid.FValueFld3.asString;
    end;
end;

procedure TwwDBCustomLookupCombo.DoEnter;
begin
   FGrid.FDisplayValue:= Text;
   inherited doEnter;
   if Parent is TwwDBGrid then SelectAll;  { Fix - 8/15/96 Select all when focus set }

   { 7/28/97 - Don't clear modified flag when processing NotInList }
   if not ProcessingNotInList then SetModified(False);

   { 9/18/97 - Reset backvalues when getting focus }
   { Previously this code was in WMSetFocus, but that is fired also when
     the form gets focus.  When the following code was placed in WMSetFocus,
     the backvalues were incorrectly reset}
   if (not FGrid.visible) and (not ProcessingNotInList) then begin
      OldDisplayValue:= Text;
      OldLookupValue:= LookupValue;
   end;

end;

procedure TwwDBCustomLookupCombo.DoExit;
begin
   inherited doExit;
end;


procedure TwwDBCustomLookupCombo.KeyPress(var Key: Char);
var FGridWasVisible: boolean;
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

   { 1/20/99 - Don't allow clear key if csDropDownList }
   if (AutoDropDown=True) and ((key=#8) or (key=^X)) then begin
      if (style=csDropDownList) and (not AllowClearKey) and
         (not FGrid.visible) then
      begin
          Key:= #0;
      end
   end;

   { 2/24/98 - Enable timer in KeyPress instead of KeyUp }
   if (((FLastSearchKey<>NewText) or (length(FLastSearchKey)=1))
         and (ord(Key)>=32)) and FGrid.visible then
   begin
      if FSearchDelay>0 then begin
         FTimer.Interval:= FSearchDelay;
      end;
      FTimer.enabled:= True;
   end;

   if (key = char(VK_RETURN)) then begin
      if FGrid.visible then begin
         UpdateFromCurrentSelection;
         if InList then GridClick(self);  { InfoPower 2.0 addition}
         closeUp(True);
         DoSelectAll;
         ShowCaret(Handle);
      end;
   end
   else if (key = char(VK_ESCAPE)) then begin
      if FGrid.Visible then begin
         closeup(False);
         FGridWasVisible:= True;
      end
      else FGridWasVisible:= False;

      if FFieldLink.Field<>Nil then begin
{         if FFieldLink.Editing then
            LookupValue:= '';
         FFieldLink.Reset;}
         FGrid.FDisplayValue:= OldDisplayValue; {9/18/97 - Use FGrid.FDisplayValue instead of DisplayValue }
         FGrid.FValue:= OldLookupValue;
         Text:= OldDisplayValue;
         modified:= False;  { 6/4/97}

         { 2/5/98 - Resets FFieldLink.modified flag }
         SkipDataChange:= True;
         FFieldLink.Reset;
         SkipDataChange:= False;

         DoSelectAll;

         if (not Editable) or (not FGridWasVisible) and
            (parent is TwwCustomDBGrid) then
         begin
//            if not (dgAlwaysShowEditor in TwwCustomDBGrid(parent).Options) then  { 6/6/98 }
               parent.setFocus;
         end;

      end
      else begin
         DisplayValue:= OldDisplayValue;
         LookupValue:= OldLookupValue;
         DoSelectAll;
      end;
      key:= #0;
      exit;
   end;

  if (not FGrid.visible) and (Key in [#32..#255]) and (FFieldLink.Field <> nil) and
      not FFieldLink.Field.IsValidChar(Key) and (not FAutoDropDown) and
      Editable and (not ShowMatchText) {9/18/97 - Don't beep when ShowMatchText is True} then
  begin
    Key := #0;
    MessageBeep(0)
  end;

  case Key of
    ^H, ^V, ^X, #32..#255:
      begin
        if Editable then EnableEdit;
        if not CanEdit then
        begin
          Key := #0;
        end
      end;

    Char (VK_RETURN):
      Key := #0;

    Char (VK_TAB):
      Key := #0;

  end;

end;

procedure TwwDBCustomLookupCombo.Change;
begin
  if FFieldLink.Editing then
    FFieldLink.Modified;
  inherited Change;
end;

function TwwDBCustomLookupCombo.GetDataSource: TDataSource;
begin
  if FFieldLink<>Nil then
     Result := FFieldLink.DataSource
  else Result:= Nil;
end;

procedure TwwDBCustomLookupCombo.SetDataSource(Value: TDataSource);
begin
  if (Value<>Nil) and (Value.dataSet <> nil) and (Value.dataSet = LookupTable) then
    RaiseException(SLookupSourceError);
  if (Value <> nil) and (LookupTable <> nil) and (Value.DataSet <> nil) and
    (Value.DataSet = LookupTable) then
    RaiseException(SLookupSourceError);
  FFieldLink.DataSource := Value;
end;

function TwwDBCustomLookupCombo.GetLookupTable: TDataSet;
begin
  Result := FGrid.getLookupTable;
end;

procedure TwwDBCustomLookupCombo.SetLookupTable(sel : TDataSet);
begin
    FGrid.setLookupTable(sel);
end;


function TwwDBCustomLookupCombo.GetLookupSource: TDataSource;
begin
  Result := FGrid.GetLookupSource;
end;

{ 4/30/97 - Not used }
{procedure TwwDBCustomLookupCombo.SetLookupSource(Value: TDataSource);
begin
  if (Value <> nil) and ((Value = DataSource) or
    ((Value.DataSet <> nil) and (Value.DataSet = FFieldLink.DataSet))) then
    RaiseException(SLookupSourceError);
  FGrid.SetLookupSource(Value);
  DataChange (Self);
end;
}

procedure TwwDBCustomLookupCombo.SetLookupField(const Value: string);
begin
  FGrid.LookupField := Value;
  FGrid.InitFields(True);
  DataChange (Self);
end;

function TwwDBCustomLookupCombo.GetLookupField: string;
begin
  Result := FGrid.LookupField;
end;

function TwwDBCustomLookupCombo.GetDataField: string;
begin
  Result := FFieldLink.FieldName;
end;

procedure TwwDBCustomLookupCombo.SetDataField(const Value: string);
begin
  FFieldLink.FieldName := Value;

  ComputeLookupFields;
end;

Function TwwDBCustomLookupCombo.SetValue2: string;
var
   tempFld: TField;
begin
   if (datasource=Nil) or (dataSource.dataSet=Nil) then tempFld:= Nil
   else tempFld:= dataSource.dataSet.FindField(FGrid.FValueFld2.fieldName);
   if tempFld<>Nil then begin
      if (FGrid.FValue2<>tempFld.asString) then
         if FGrid.FDisplayFld<>Nil then
         begin
            Text:= FGrid.FDisplayFld.asString;
            FGrid.FDisplayValue:= Text;
         end;
      FGrid.FValue2:= tempFld.asString;
   end;


   result:= FGrid.FValue2;
end;

Function TwwDBCustomLookupCombo.SetValue3: string;
var
   tempFld: TField;
begin
   if (datasource=Nil) or (dataSource.dataSet=Nil) then tempFld:= Nil
   else tempFld:= dataSource.dataSet.FindField(FGrid.FValueFld3.fieldName);
   if tempFld<>Nil then FGrid.FValue3:= tempFld.asString;
   result:= FGrid.FValue3;
end;

procedure TwwDBCustomLookupCombo.DataChange(Sender: TObject);
var APos: integer;
    TempLookupValue: string;
begin
  if SkipDataChange then exit;

  if (FFieldLink.Field <> nil) and not (csLoading in ComponentState) then begin

     { Update Text,  FFieldLink.Field.AsString is wrong if master record has moved }
     { However, LookupList.DataChanged calls this function later if master record }
     { has changed. }
     if HasMasterSource and (FGrid.inDataChanged=0) and
         IsWWCalculatedField then
     begin
       Text:= FFieldLink.Field.AsString;
       exit;
     end;

     { 4/5/97 - If masterfields have changed then skip rest of code since this will be called later by
       LookupList.DataChanged }
     if (FGrid.inDataChanged=0) and (LookupTable<>Nil) and (LookupTable.active) then
     begin
        if HasMasterSource and
           (DataSource=(LookupTable as TwwTable).MasterSource) then
        begin
           APos:= 1;
           TempLookupValue:=  DataSource.Dataset.FieldByName(
                strGetToken((LookupTable as TwwTable).MasterFields, ';', APos)).asstring;
           if ((LookupTable as TwwTable).indexFields[0].asstring <> TempLookupValue) then
           begin
              if not FFieldLink.Field.isNull then exit;  { If null, then LookupList.datachanged not called }
           end
        end
     end;

     inc(FGrid.inDataChanged);
     try
        { 7/1/97 - Multiple lookup fields, always perform dolookup }
        if (FGrid.FValueFld2<>Nil) or (FGrid.FValueFld3<>Nil) then
        begin
           FGrid.DoLookup(False);
           Text:= FGrid.DisplayFld.asString;
           FGrid.FDisplayValue:= Text;
        end;

        Value := FFieldLink.Field.AsString; {? Not correct for calculated fields}

        { Initialize Fvalue2 according to current record - assume 2nd lookupfield
          has the same name in both tables }
        if (FGrid.FValueFld2<>Nil) then SetValue2;
        if (FGrid.FValueFld3<>Nil) then SetValue3;

        { 1/23/97 - Update back-values when change records }
        if datasource.state=dsBrowse then begin
           OldDisplayValue:= Text;
           OldLookupValue:= LookupValue;
        end;

        if HasMasterSource and IsWWCalculatedField then
          Text:= FFieldLink.Field.AsString;

     finally
        dec(FGrid.inDataChanged);
     end;
  end
  else
    Text := EmptyStr;

  if Focused then DoSelectAll; {!!!!!}

end;

function TwwDBCustomLookupCombo.GetValue: String;
begin
  if Editable then
    Result := Text
  else
    Result := FGrid.Value;
end;

function TwwDBCustomLookupCombo.GetValue2: String;
begin
   Result := FGrid.FValue2;
end;
function TwwDBCustomLookupCombo.GetValue3: String;
begin
   Result := FGrid.FValue3;
end;

function TwwDBCustomLookupCombo.GetLookupValue: String;
begin
   Result := FGrid.Value;
end;

function TwwDBCustomLookupCombo.GetDisplayValue: String;
begin
  Result := Text;
end;

procedure TwwDBCustomLookupCombo.SetDisplayValue(const NewValue: String);
begin
  if FGrid.DisplayValue <> NewValue then
  begin
    if FGrid.DataLink.Active then
    begin
      FGrid.DisplayValue := NewValue;
      Text := FGrid.DisplayValue;
    end;
  end;
end;

procedure TwwDBCustomLookupCombo.SetValue(const NewValue: String);
begin
  if FGrid.DataLink.Active and FFieldLink.Active and (DataSource<>Nil) and
      (DataSource.DataSet = LookupTable) and (LookupTable<>Nil) then
    RaiseException(SLookupSourceError);
  {10/16/97 - When you have multiple combos on a form and the state changed from
              Browse to Edit, then the combo would have its index changed while the
              dropdown list was visible.  Skip the following code in this case.}
  if (FGrid.Value <> NewValue) or
     { 11/6/97 - control not visible earlier, so need to re-enter,
                 or else control can be blank in some cases}
     ((Text='') and (NewValue<>'')) or
     ((FGrid.FValueFld=FGrid.FDisplayFld) and (Text <> NewValue)) then
  begin
    if FGrid.DataLink.Active then
    begin
      if (not ChangingFromLink) then FGrid.Value := NewValue;
      Text:= FGrid.DisplayValue;
    end
    else if (LookupField='') and (lookupTable=Nil)  then begin
       Text:= NewValue;  {added for wwdotdot support }
    end
    else if (lookupTable<>Nil) and (not lookuptable.active) then {11/6/97 }
       Text:= NewValue;
  end;

end;

function TwwDBCustomLookupCombo.GetReadOnly: Boolean;
begin
  Result := FFieldLink.ReadOnly;
end;

procedure TwwDBCustomLookupCombo.SetReadOnly(Value: Boolean);
begin
  FFieldLink.ReadOnly := Value;
  inherited ReadOnly := not CanEdit;
end;

procedure TwwDBCustomLookupCombo.EditingChange(Sender: TObject);
begin
  inherited ReadOnly := not CanEdit;
end;

Function TwwDBCustomLookupCombo.HasMasterSource: boolean;
begin
   result:= (LookupTable<>Nil) and (LookupTable is TwwTable) and
            ((LookupTable as TwwTable).MasterSource<>Nil);
end;

procedure TwwDBCustomLookupCombo.WwChangeFromLink(AlookupTable: TDataSet;
          var modified: boolean);
var fromlink: wwSmallString;
    {$ifdef win32}
    fromlinks: string;
    fpos: integer;
    {$endif}

    tempValue: string;
    i: integer;
    pos: integer;
    fromfield: TField;
    fromFieldNames: TStrings;
    ADataSet: TDataSet;
    startField: integer;
begin

   if changingFromLink then exit;

   changingFromLink:= True;

   fromFieldNames:= TStringList.create;

   try
     ADataSet:= datasource.dataSet;
     with ADataSet do begin
        if isLookup then begin
           {$ifdef win32}
           fromLinks:= FFieldLink.Field.KeyFields;
           fpos:= 1;
           while True do begin
              fromLink:= strGetToken(fromlinks, ';', fpos);
              if (fromLink='') then break;
              fromFieldNames.add(fromLink);
           end
           {$endif}
        end
        else begin
           TempValue:= wwDataSetGetLinks(ADataSet, dataField);
           pos:= 1;
           while True do begin
              fromLink:= strGetToken(TempValue, ';', pos);
              strGetToken(TempValue, ';', pos); { Skip }
              if (fromLink='') then break;
              fromFieldNames.add(fromLink);
           end
        end;

     end;

     modified:= False;

     if fromfieldnames.count=0 then modified:= true; { 7/21/97 - in case of calcuated field }

     for i:= 0 to fromFieldNames.count-1 do begin
        tempValue:= ADataSet.fieldByName(FromFieldNames[i]).Text;
        case i of
        0: if (tempValue <> FGrid.FValue) then modified:= True;
        1: if (FGrid.FValueFld2<>Nil) and (tempValue <> FGrid.FValue2) then modified:= True;
        2: if (FGrid.FValueFld3<>Nil) and (tempValue <> FGrid.FValue3) then modified:= True;
        else;
        end;
     end;

     if modified then begin
        skipDataChange:= True;  { Assigning fields will trigger OnDataChange }

        if (ADataSet is TTable) and (ADataSet as TTable).readOnly then exit;
        if ReadOnly then exit; { 6/11/98 }

        self.datasource.edit; {Entering edit-mode clears looked up values so save them first }
        if (self.datasource.dataset.state=dsEdit) or (self.datasource.dataset.state=dsInsert) then
        begin
          { 2/10/97 - Only update last field for detail table}
          if HasMasterSource then startField:= fromFieldNames.count-1
          else startField:= 0;

          for i:= startField to fromFieldNames.count-1 do begin
             fromField := ADataSet.fieldByName(FromFieldNames[i]);
             case i of
               0: if (fromField.text<>FGrid.FValue) then fromField.text:= FGrid.FValue;
               1: if (FGrid.FValueFld2<>Nil) and (fromField.text<>FGrid.FValue2) then
                     fromField.text:= FGrid.FValue2;
               2: if (FGrid.FValueFld3<>Nil) and (fromField.text<>FGrid.FValue3) then
                     fromField.text:= FGrid.FValue3;
               else;
             end;
          end;
        end;
        modified:= True;
     end;

   finally
      fromFieldNames.free;
      skipDataChange:= False;

      repaint; { Necessary to repaint drop-down icon }
      changingFromLink:= False;
   end;

end;

procedure TwwDBCustomLookupCombo.UpdateData(Sender: TObject);
var tempFld: TField;
    modified: boolean;
begin
  if (FFieldLink.Field <> nil) then {and (FGrid.FHiliteRow>=0) then {debug}
  begin
    { 7/28/97 - Call CloseUp to handle NotInList event }
    if (not ProcessingNotInList) and (Text<>'') and (not FGrid.visible) then
       CloseUp(True);

    if isWWCalculatedField then begin
       if (FGrid.FHiliteRow>=0) then
          wwChangeFromLink(lookupTable, modified);
    end
    else begin
       if (FGrid.FValueFld = FGrid.FDisplayFld) then begin
         if (FFieldLink.Field.asString<>Text) then
{            FFieldLink.Field.AsString := Text;}
            FFieldLink.Field.Text := Text; { 9/28/97 - Assign Text property instead }
       end
       else begin
         if (FFieldLink.Field.asString<>FGrid.Value) then
            FFieldLink.Field.AsString := FGrid.Value;
       end;

       if (FGrid.FHiliteRow>=0) or (isLookupDlg) then begin
          if (FGrid.FValueFld2<>Nil) then begin
             tempFld:= dataSource.dataSet.FindField(FGrid.FValueFld2.fieldName);
             if tempFld<>Nil then tempFld.assign(FGrid.FValueFld2);
          end;
          if (FGrid.FValueFld3<>Nil) then begin
             tempFld:= dataSource.dataSet.FindField(FGrid.FValueFld3.fieldName);
             if tempFld<>Nil then tempFld.assign(FGrid.FValueFld3);
          end;
       end;
    end
  end;
end;

procedure TwwDBCustomLookupCombo.FieldLinkActive(Sender: TObject);
begin
  if FFieldLink.dataSource=Nil then exit;

  if (csDesigning in ComponentState) and { don't reset datafield when running program }
    (not wwDataSetIsValidField(FFieldLink.dataSource.dataSet, dataField)) and
    (FFieldLink.Active) then dataField:= '';

  if FFieldLink.Active then ComputeLookupFields; {3/27/97}

  if FFieldLink.Active and (FGrid.DataLink.Active) then
  begin
    FGrid.SetValue ('');   {force a data update}
    DataChange (Self);
  end;
end;

procedure TwwDBCustomLookupCombo.EnableEdit;
   { 8/16/96 Bypass parent HideControls in parent grid's dataChange}
   procedure SetHideControls(val: boolean);
   begin
      if (Grid.visible) and (Parent is TwwDBGrid) then
         (Parent as TwwDBGrid).SkipHideControls:= val;
   end;

begin
   SkipDataChange:= True;
   SetHideControls(True);
   try {7/21/97 Added try/finally block to handle exceptions}
     FFieldLink.Edit;
   finally
     SetHideControls(False);
     SkipDataChange:= False;
   end
end;

procedure TwwDBCustomLookupCombo.WMPaste (var Message: TMessage);
begin
  if Editable then EnableEdit;
  if CanEdit then begin
     if AutoDropDown and (not Grid.visible) then exit; { 11/24/98}

     inherited;
     FFieldLink.modified;
     if Grid.visible then PerformSearch; { 11/24/98 }
  end
end;

procedure TwwDBCustomLookupCombo.WMCut (var Message: TMessage);
begin
  if Editable then EnableEdit;
  if CanEdit then inherited;
end;

Procedure TwwDBCustomLookupCombo.SetUseTFields(val: boolean);
begin
   FuseTFields:= val;
   FGrid.useTFields:= val;
{   FGrid.HandleNeeded;
   FGrid.LayoutChanged;}
end;

procedure TwwDBCustomLookupCombo.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);

  {ES_MULTILINE allows precise positioning of edit region, but it has the
   following side effects:
   1. Escape key no longer passed to form for closing of a modal dialog
   2. More resource consumption
   For this reason we have added another property - PreciseEditRegion
  }
  if PreciseEditRegion or (BorderStyle=bsNone) then
     Params.Style := Params.Style or ES_MULTILINE or WS_CLIPCHILDREN
  else
     Params.Style := Params.Style or WS_CLIPCHILDREN;

  {$ifdef wwdelphi4up}
  if UseRightToLeftAlignment then
    Params.Style:= Params.Style or ES_MULTILINE;
  {$endif}

  if IsTransparentEffective and Frame.CreateTransparent then
  begin
     Params.ExStyle := Params.ExStyle or WS_EX_TRANSPARENT;
  end;

end;

procedure TwwDBCustomLookupCombo.CreateWnd;
begin
  inherited CreateWnd;
  if (BorderStyle=bsNone) and AutoSize and
     not (parent is TCustomGrid) then Frame.AdjustHeight;
  SetEditRect;
  FGrid.HandleNeeded;
  DataChange (Self);  {update to current value}

  if IsTransparentEffective then
  begin
     wwDisableParentClipping(Parent);
  end
end;

procedure TwwDBCustomLookupCombo.SetEditRect;
var
  Loc: TRect;
begin
  Loc.Bottom := ClientHeight + 1; {+1 is workaround for windows paint bug}
  if ShowButton then Loc.Right := FBtnControl.Left - 2
  else Loc.Right:= ClientWidth - 2;

  if (BorderStyle = bsNone) and (Parent is TwwCustomDBGrid) then begin
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
     Loc.Left := 0;
     Loc.Top:= 0;
  end;
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@Loc));
end;

type
 TCheatButton = class(TSpeedButton);
 
procedure TwwDBCustomLookupCombo.UpdateButtonPosition;
var
  MinHeight: Integer;
  offset: integer;
begin
  if (csDesigning in ComponentState) then
    FGrid.SetBounds (0, Height + 1, 10, 10);

  if Frame.IsFrameEffective then
  begin
     offset:= 2;
  end
  else offset:= 0;

  MinHeight := GetMinHeight;
    { text edit bug: if size to less than minheight, then edit ctrl does
      not display the text }
  if Height < MinHeight then Height := MinHeight
  else begin
    {$ifdef WIN32}
     if (not NewStyleControls) or (BorderStyle = bsNone) or (not Ctl3d) then
        FBtnControl.SetBounds (Width - FButton.Width - offset, offset, FButton.Width, ClientHeight-offset*2)
     else
        FBtnControl.SetBounds (Width - FButton.Width - 4, offset, FButton.Width, ClientHeight-offset);

    if BorderStyle = bsNone then begin
       FButton.Top:= -1; {Allows bitmap to be larger }
       FButton.Height := FBtnControl.Height+1;
    end
    else begin
       FButton.Top:= 0;
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
end;

procedure TwwDBCustomLookupCombo.WMSize(var Message: TWMSize);
begin
  inherited;
  UpdateButtonPosition;
end;

function TwwDBCustomLookupCombo.GetMinHeight: Integer;
var
  DC: HDC;
  SaveFont: HFont;
  SysMetrics, Metrics: TTextMetric;
begin
  result:= 0; { Don't have minheight }
  exit;

  DC := GetDC(0);
  GetTextMetrics(DC, SysMetrics);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
{  I := SysMetrics.tmHeight;
  if I > Metrics.tmHeight then I := Metrics.tmHeight;}
  Result := Metrics.tmHeight + 1 + GetSystemMetrics(SM_CYBORDER) * 2;
  if (bsSingle = BorderStyle) then Result:= Result + 2;
end;

procedure TwwDBLookupList.FastLookup;
var tempValue: string;
begin
   FFoundValue := False;
   if not HandleAllocated then Exit;
   if not FCombo.visible then exit;                { optimization}
   IF LookupField='' then exit;

   if (FCombo.FFieldLink=Nil) or (FCombo.FFieldLink.Field=Nil) then
      tempValue:= FCombo.LookupValue
   else tempValue:= FCombo.FFieldLink.Field.asString; {!!! Should be asString instead }

   if FCombo.UseSeqSearch then
      FFoundValue:= FCombo.FindRecord(tempValue, LookupField, mtExactMatch,
                                      ssoCaseSensitive in FCombo.SeqSearchOptions)
   else if FValueFld2=Nil then begin
      if FCombo.HasMasterSource then begin
         FFoundValue:= FCombo.DoFindRecord(tempValue, LookupField, mtExactMatch); {1/22/97}
      end
      else FFoundValue:= (LookupTable as TwwTable).wwFindKey([tempValue]);
   end
   else begin
      if FValueFld3=Nil then
         FFoundValue:= (LookupTable as TwwTable).wwFindKey([tempValue, FCombo.SetValue2])
      else FFoundValue:= (LookupTable as TwwTable).wwFindKey([tempValue, FCombo.SetValue2, FCombo.SetValue3]);
   end
end;

procedure TwwDBCustomLookupCombo.WMPaint(var Message: TWMPaint);
var
  PS: TPaintStruct;
  Indent, Left: Integer;
  ARect: TRect;
  S: array [0..255] of char;
  Focused: Boolean;
  DC: HDC;
  Win32: boolean;
//  flags: integer;
  WriteOptions: TwwWriteTextOptions;
//  editRect: TRect;
  ATextWidth: integer;

  Function ParentGridFocused: boolean;
  begin
     result:= False;
     if parent is TwwDBGrid then begin
        if parent.Focused then result:= True
     end
  end;

  Function DrawFocusControl: boolean;
  begin
      result:= (((Style=csDropDownList) and Focused) or ParentGridFocused)
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

  FButton.invalidate; {6/14/95}
  FButton.Update; { Required for Delphi 4}

  { Don't use MouseEditable here }
  if ((GetEffectiveAlignment = taLeftJustify) and (not Frame.IsFrameEffective) or
     FFocused) and
     ((Editable and not ParentGridFocused and not wwInPaintCopyState(ControlState))) then
  begin
    if FGrid.visible then redrawListGrid;
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
      else if parent is TwwDBGrid then
         font.Color:= (parent as TwwDBGrid).Font.Color;
      Brush.Color:= clWhite;

      {$ifdef win32}
      Win32:= True;
      {$else}
      Win32:= False;
      {$endif}

      { 8/25/96 - Fix for winNT }
      if (BorderStyle<>bsNone) then
      begin
         if (not NewStyleControls) or (not Ctl3d) or  { <-- This line changed }
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
      if Showbutton and not IsInwwObjectViewPaint(self) then ARect.Right:= FBtnControl.Left;

      { Win 95 TGridRecord}
      if wwInPaintCopyState(ControlState) and (FFieldLink.Field <> nil) then
      begin
        if (FGrid.FValueFld = FGrid.FDisplayFld) or (FFieldLink.Field.isNull) or
           (FFieldLink.Field.Lookup) or (FFieldLink.Field.Calculated) then
        begin
           StrPCopy(S, FFieldLink.Field.DisplayText)
        end
        else begin
           if (LookupTable is TwwTable) then
              (LookupTable as TwwTable).setToIndexContainingField(LookupField);
           FGrid.FastLookup;
           StrPCopy(S, FGrid.DisplayFld.asString);
        end;
      end
      else StrPCopy (S, Text);

      if DrawFocusControl then begin
         Brush.Color := clHighlight;
         Font.Color := clHighlightText;
      end;

{      Width := TextWidth(strpas(S));}

      if IsInwwObjectView(self) then Indent:= 1
      else if ParentGridFocused then begin
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
      else if isInGrid(self) then
        Left := Indent+1
      else Left:= Indent+1;

      if (FFieldLink.Field<>nil) and (not IsInwwObjectView(self)) then with FFieldLink.Field do
      begin
         ATextWidth := TextWidth(strpas(S));
         if (Alignment = taRightJustify) then
         begin
            Left:= ARect.Right - ATextWidth - 2;
            if ShowButton and (not IsInwwObjectViewPaint(self)) then begin
               if not Frame.Transparent then Left:= Left + 1;
            end;
            if Frame.IsFrameEffective then Left:= Left - Frame.NonFocusTextOffsetX;
         end
         else if Alignment = taCenter then
         begin
            Left := (ARect.Left + ARect.Right - ATextWidth) div 2;
         end
      end;

      WriteOptions:= [];
      if IsInwwObjectViewPaint(self) or IsTransparentEffective then
         WriteOptions:= WriteOptions + [wtoTransparent];
      if (not FFocused) and IsTransparentEffective and (Frame.NonFocusTransparentFontColor<>clNone) then
         FCanvas.Font.Color:= Frame.NonFocusTransparentFontColor;
      wwWriteTextLinesT(FCanvas, ARect, Left-1, Indent-1,
             s, taLeftJustify, WriteOptions);

      if DrawFocusControl then
      begin
        ARect := ClientRect;
        if Showbutton then ARect.Right:= FBtnControl.Left;

        if (BorderStyle <> bsNone) then
        begin
          ARect.Top:= ARect.Top + 1;
          ARect.Bottom:= ARect.Bottom - 1;
          ARect.Left:= ARect.Left + 1;
        end
        else begin
          {$ifndef win32}
{          ARect.Top:= ARect.Top + 1;}
          {$endif}
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
end;

procedure TwwDBCustomLookupCombo.CMFontChanged(var Message: TMessage);
begin
  inherited;
  GetMinHeight;
  if (Owner<>Nil) and (not (csLoading in Owner.ComponentState)) then SetEditRect;
end;

procedure TwwDBCustomLookupCombo.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  FButton.Enabled := Enabled;
end;

procedure TwwDBCustomLookupCombo.WMKillFocus(var Message: TWMKillFocus);
var tempNotInList: boolean;
begin
  tempNotInList:= (not InList) and (DisplayValue<>'');

{ 6/4/97
  if (not InList) then begin
     EnableEdit;
     if FFieldLink.Editing then FFieldLink.Modified;
  end;
}

  inherited;

  { 5/27/99 - When clicking on a different combo dropdown controls edit area the
            current combos text would be cleared after a delete.}
  if FGrid.visible and modified and (AllowClearKey=False) and (Text='') then
  begin
    UpdateFromCurrentSelection;
  end;

  CloseUp(True);

  if tempNotInList then begin
    { Code to prevent MouseCapture by different component }
  end;
end;

procedure TwwDBCustomLookupCombo.CMCancelMode(var Message: TCMCancelMode);
begin

  if modified and (not InList) then begin
     EnableEdit;
     if FFieldLink.Editing then FFieldLink.Modified;
  end;

  { Comment out if want list to remain open until another control is activated }
  with Message do
    if (Sender <> Self) and (Sender <> FBtnControl) and
      (Sender <> FButton) and (Sender <> FGrid) then
    begin
      { In case user exits drop-down with mouse then force to enter from list }
      if FGrid.visible then begin
         UpdateFromCurrentSelection;
         if inList then GridClick(self);
      end;

      CloseUp(True);
    end
end;

procedure TwwDBCustomLookupCombo.RefreshButton;
begin
{     FButton.enabled:= False;
     Repaint;
     FButton.enabled:= True;
     Repaint;}
end;

  { 8/25/98 - Move outside scrope of RedrawListGrid so that its callable by
              the DropDown method }
  function GetWidthForGrid(Combo: TwwDBCustomLookupCombo;
     lessFields: integer): integer;
  var i: integer;
    CWidth: Integer;
    APos: integer;
    tempWidth: integer;
    TitleWidth: integer;
  begin
    cwidth:= GetSystemMetrics(SM_CXHThumb) + 1;  {Win95 fix }

    if Combo.useTFields then begin
      with Combo.FGrid do begin
        for I := 0 to FieldCount - (1 + lessFields) do begin
          Canvas.Font := Font;

          with Fields[I] do
          begin
            tempWidth:= DisplayWidth * Canvas.TextWidth('0') + GridLineWidth;

            { Width at least Title Size }
            if (loTitles in Options) then
            begin
               Canvas.Font := TitleFont;
               TitleWidth:= Canvas.TextWidth(DisplayLabel);
               if tempWidth < TitleWidth then tempWidth:= TitleWidth;
            end;
            CWidth := CWidth +  TempWidth;
          end;
        end
      end
    end
    else begin
      with Combo.FGrid do begin
        for I := 0 to Selected.count - (1 + lessFields) do begin
           Canvas.Font := Font;
           APos:= 1;
           strGetToken(selected[i], #9, APos); { Field Name }
           tempWidth:=  strtoint(strGetToken(selected[i], #9, APos)) * Canvas.TextWidth('0') +
                     GridLineWidth;

           { Width at least Title Size }
           if (loTitles in Options) then
           begin
              Canvas.Font := TitleFont;
              TitleWidth:= Canvas.TextWidth(strGetToken(selected[i], #9, APos));
              if tempWidth < TitleWidth then tempWidth:= TitleWidth;
           end;

            CWidth := CWidth +  TempWidth;
        end
      end
    end;

    result:= CWidth;
  end;


procedure TwwDBCustomLookupCombo.RedrawListGrid;
var
  P: TPoint;
  Y:  Integer;
  GridWidth, BorderWidth, BorderOffset: Integer;
  WinAttribute: HWnd;
  parentForm: TCustomForm;
  gridHeight: integer;

  function min(x,y: integer): integer;
  begin
     if x<y then result:= x else result:= y;
  end;

  function max(x,y: integer): integer;
  begin
     if x>y then result:= x else result:= y;
  end;
(*
  function getWidth(lessFields: integer): integer;
  var i: integer;
    CWidth: Integer;
    APos: integer;
    tempWidth: integer;
    TitleWidth: integer;
  begin
    cwidth:= GetSystemMetrics(SM_CXHThumb) + 1;  {Win95 fix }

    if useTFields then begin
      with FGrid do begin
        for I := 0 to FieldCount - (1 + lessFields) do begin
          Canvas.Font := Font;

          with Fields[I] do
          begin
            tempWidth:= DisplayWidth * Canvas.TextWidth('0') + GridLineWidth;

            { Width at least Title Size }
            if (loTitles in Grid.Options) then
            begin
               Canvas.Font := TitleFont;
               TitleWidth:= Canvas.TextWidth(DisplayLabel);
               if tempWidth < TitleWidth then tempWidth:= TitleWidth;
            end;
            CWidth := CWidth +  TempWidth;
          end;
        end
      end
    end
    else begin
      with FGrid do begin
        for I := 0 to Selected.count - (1 + lessFields) do begin
           Canvas.Font := Font;
           APos:= 1;
           strGetToken(selected[i], #9, APos); { Field Name }
           tempWidth:=  strtoint(strGetToken(selected[i], #9, APos)) * Canvas.TextWidth('0') +
                     GridLineWidth;

           { Width at least Title Size }
           if (loTitles in Grid.Options) then
           begin
              Canvas.Font := TitleFont;
              TitleWidth:= Canvas.TextWidth(strGetToken(selected[i], #9, APos));
              if tempWidth < TitleWidth then tempWidth:= TitleWidth;
           end;

            CWidth := CWidth +  TempWidth;
        end
      end
    end;

    result:= CWidth;
  end;

*)
begin
  if (Width > 20) then
  begin

    P := ClientOrigin;
    Y := P.Y + Height - 1;
    if BorderStyle=bsNone then Y:= Y + 1;

    { Put dropdown list above or below drop-down control }
    if (Y + FGrid.Height) > Screen.height then Y := P.Y - FGrid.Height + 1;
    if Y < 0 then Y := P.Y + Height - 1;

    GridWidth := DropDownWidth;

    if GridWidth = 0 then begin  { manually compute width }
       GridWidth:= getWidthForGrid(self, 0) + FGrid.ColCount * FGrid.GridLineWidth + FButton.Width;
    end;

    WinAttribute:= 0;
    parentForm:= GetParentForm(self) as TCustomForm; { -ksw (6/22/98) }
    if (parentForm<>Nil) and (TForm(parentForm).FormStyle=fsStayOnTop) then
       WinAttribute:= HWND_TOPMOST;

    BorderWidth := 0;
    if loRowLines in Options then BorderWidth := 1;

    GridHeight:= FGrid.height;
    BorderOffset:= 0;
    if loRowLines in Options then BorderOffset:= -2;
    if FDropDownAlignment = taLeftJustify then begin
       { 3/14/99 - Support multiple monitors }
       {$ifdef wwDelphi4Up}
       GridWidth:= min(Screen.DesktopWidth - P.X - 2, GridWidth);
       {$else}
       GridWidth:= min(Screen.Width - P.X - 2, GridWidth);
       {$endif}

       GridWidth:= max(Width-4, GridWidth);

       { Make room for scrollbar if present }
       if (GridWidth<=GetWidthForGrid(self, 1) + FGrid.ColCount * FGrid.GridLineWidth + FButton.Width + 1)
          and (FItemCount>0) then begin
          GridHeight := (FGrid.DefaultRowHeight + BorderWidth) *
            (FItemCount + FGrid.FTitleOffset) + 5 + BorderOffset + GetSystemMetrics(SM_CYHScroll) +
            ExtraHeight;
       end;

       SetWindowPos (FGrid.Handle, WinAttribute, P.X, Y, GridWidth, GridHeight,
             SWP_NOACTIVATE)
    end
    else begin
       GridWidth:= min(P.X + Width - 2, GridWidth);
       GridWidth:= max(Width-4, GridWidth);

       { Make room for scrollbar if present }
       if (GridWidth<=GetWidthForGrid(self, 1) + FGrid.ColCount * FGrid.GridLineWidth + FButton.Width + 1)
          and (FItemCount>0) then begin
          GridHeight := (FGrid.DefaultRowHeight + BorderWidth) *
            (FItemCount + FGrid.FTitleOffset) + 5 + BorderOffset + GetSystemMetrics(SM_CYHScroll) +
            ExtraHeight;
       end;

       SetWindowPos (FGrid.Handle, WinAttribute, P.X + 1 + Width - GridWidth, Y,
                    GridWidth, GridHeight, SWP_NOACTIVATE);
    end
  end
end;


procedure TwwDBCustomLookupCombo.DropDown;
var
  P: TPoint;
  BorderWidth, BorderOffset: Integer;
  curpos: integer;
  lkupField: TField;
  field1Name: string;
  PrevText: string;
  PrevSelStart, PrevSelLength:integer;   {11/13/97}

  function min(x,y: integer): integer;
  begin
     if x<y then result:= x else result:= y;
  end;

  { 3/26/99 }
  procedure ClearHorzRange;
  begin
    if FGrid.ScrollBars in [ssHorizontal, ssBoth] then
      SetScrollRange(FGrid.Handle, SB_HORZ, 0, 0, True);
  end;

begin
  if (LookupTable=Nil) then begin
     MessageDlg('No lookup table specified!', mtWarning, [mbok], 0);
     RefreshButton;
     exit;
  end;

  if (not LookupTable.active) then begin
     MessageDlg('Lookup table is not active!', mtWarning, [mbok], 0);
     RefreshButton;
     exit;
  end;

  if not FGrid.Visible and (Width > 20) then
  begin

    FGrid.FHiliteRow:= -1;  { 8/30/96  - Reset HiliteRow when dropped down. }
                            { Otherwise HiliteRow could be out of range if records are deleted }

    { default to lookup field if no selection }
    if (Selected.count=0) then begin
       curPos:= 1;
       field1Name:= strGetToken(lookupField, ';', curpos);
       if isWWCalculatedField then lkupField:= FGrid.FDisplayFld
       else lkupField:= lookupTable.findField(field1Name);
       if (lkupField<>Nil) then begin
          Selected.add(
             lkupField.fieldName + #9 + inttostr(lkupField.displayWidth) + #9 +
             lkupField.DisplayLabel);
       end
    end;

    { 12/23/97 - Parameterized query moves dependent table when going into edit mode
      so go into edit-mode now instead of later }
    if (not InAutoDropDown) and wwIsClass(LookupTable.classType, 'TwwQuery') and
       (wwGetControlDataSource(LookupTable)<>Nil) then begin
       EnableEdit;
       FGrid.DoLookup(True); { Called in case lookupTable was moved by another control }
    end
    else if not InAutoDropDown then FGrid.DoLookup(True); { Called in case lookupTable was moved by another control }

    if useTFields then
       wwDataSetUpdateFieldProperties(FGrid.LookupTable, Selected)
    else begin
       FGrid.LayoutChanged;
    end;

    if Assigned(FOnDropDown) then FOnDropDown(Self);

    FItemCount := DropDownCount;
    if DropDownCount = 0 then FItemCount := 1;
    P := ClientOrigin;

    BorderWidth := 0;
    BorderOffset:= 0;
    if loRowLines in Options then begin
       BorderWidth := 1;
       BorderOffset:= 0;
    end;

    {8/26/98 - Height not accurate when titles are not shown }
    FGrid.Height := (FGrid.DefaultRowHeight + BorderWidth) *
      (FItemCount + FGrid.FTitleOffset) + 2 + 3*FGrid.FTitleOffset + BorderOffset + ExtraHeight;

//    FGrid.Height := (FGrid.DefaultRowHeight + BorderWidth) *
//      (FItemCount + FGrid.FTitleOffset) + 5 + BorderOffset + ExtraHeight;

    FGrid.BeAccurate:= True;
    {$ifdef wwDelphi4Up}
    ClearHorzRange;  {Necessary in Delphi 4 as it does not update scroll range if its not currently showing }
    {$endif}
    redrawListGrid;

    FGrid.UpdateRowCount;
    FGrid.beAccurate:= False;

    FGrid.ImageList:= ImageList;

    { Shorten drop-down list size if have don't have enough records }
    if (FItemCount > FGrid.DataLink.RecordCount) and
       ((not (LookupTable is TwwTable)) or
        ((LookupTable is TwwTable) and
         ((not LTable.SyncSQLByRange) or (not LTable.database.isSQLBased)) and
         (not LTable.NarrowSearch))) then
    begin
      PrevText:= Text;
      FItemCount:= FGrid.DataLink.RecordCount;
      {8/26/98 - Height not accurate when titles are not shown }
      FGrid.Height := (FGrid.DefaultRowHeight + BorderWidth) *
         (FItemCount + FGrid.FTitleOffset) + 2 + 3*FGrid.FTitleOffset + BorderOffset + ExtraHeight;
//      FGrid.Height := (FGrid.DefaultRowHeight + BorderWidth) *
//               (FItemCount + FGrid.FTitleOffset) + 5 + BorderOffset + ExtraHeight;
      SkipDataChange:= True;
      FGrid.ShowVertScrollBar:= False;
      {$ifdef wwdelphi4up} { 8/25/98 - Update horzscrollbar property based on column widths }
      FGrid.ShowHorzScrollBar:=
          GetWidthForGrid(self, 1) > Grid.Width;
      {$endif}
      FGrid.RecreateWnd;
      FGrid.HandleNeeded;  { Forces CreateWnd to be called }
      SkipDataChange:= False;

      redrawListGrid;
      {11/15/97 - Save and restore selStart and selLength }
      if ShowMatchText and InAutoDropDown then
      begin
         PrevSelStart:= selStart;
         PrevSelLength:= selLength;
         Text:= PrevText;     { Since recreating window, need to reset Text and SelStart }
         SelStart:= PrevSelStart;
         SelLength:= PrevSelLength;
      end
      else begin
         Text:= PrevText;     { Since recreating window, need to reset Text and SelStart }
         SelStart:= length(Text);
      end;
    end
    else if not FGrid.ShowVertScrollBar then begin  { Show scroll bar 9/4/96}
      SkipDataChange:= True;
      FGrid.ShowVertScrollBar:= True;
      FGrid.RecreateWnd;
      FGrid.HandleNeeded;
      SkipDataChange:= False;
    end;

    if Length (LookupField) = 0 then
      FGrid.FDisplayValue:= Text;
{      AssignStr(FGrid.FDisplayValue,Text);}
    FGrid.SetColumnAttributes;
    FGrid.UpdateRowCount;
    FGrid.Visible := True;
{    Invalidate;}

    FlastSearchKey := FGrid.DisplayValue;  { Reset each time drop down is called}
    Windows.SetFocus(Handle);

    inherited ReadOnly := not CanEdit;  { Refresh ReadOnly property - 6/6/95}
                                        { ReadOnly property gets reset by EditingChange }

    if not InAutoDropDown then DoSelectAll;       { If style = DropDownList, then doselectall and showcaret required }
    ShowCaret(Handle);

    Invalidate;  { Redraw this combo box for color changes in wmPaint }

    {$ifdef wwDelphi4up}
    if wwLookupComboHook=0 then
       wwLookupComboHook := SetWindowsHookEx(WH_MOUSE, @wwLookupComboHookProc, HINSTANCE, GetCurrentThreadID);
    {$endif}
  end;

end;

procedure TwwDBCustomLookupCombo.PerformSearch;
begin
   FLastSearchKey:= '';
   OnEditTimerEvent(self);
end;

procedure TwwDBCustomLookupCombo.CloseUp (Modified: boolean);
var tempFld: TField;
    accept: boolean;
    tempInList: boolean;

  Function UnBoundCombo: boolean;
  begin
     result:=  (dataSource=Nil) or (dataSource.dataSet=Nil)
  end;

begin
  Accept:= False;           { OnNotInList not processed 9/5/96}
  if InCloseUpEvent then exit;
  if not FGrid.Visible then begin
     if FGrid.FDisplayFld=nil then exit;

     if Assigned(FOnNotInList) and (OldDisplayValue<>Text) and
      (not ProcessingNotInList) and
      {7/18/98 - OnNotInList does not work for calculated fields }
      (isWWCalculatedField or not FGrid.DisplayFld.calculated) then
     begin
        UpdateSearchIndex(True);  {2/10/97}
        if Text<>'' then OnEditTimerEvent(self) { 6/16/99 - Fix problem where text didn't get cleared in tfield }
        else inList:= False;

        if (not inList) then begin
           Accept:= True;
           ProcessingNotInList:= True;
           try
              if (Text<>'') then begin  { 2/10/97 - Don't call NotInList if blank}
                 OnNotInList(self, LookupTable, Text, Accept);
                 wwFixMouseDown;
              end;
              if not Accept then begin
                 DisplayValue:= OldDisplayValue;
                 FGrid.FValue:= OldLookupValue;
                 Text:= OldDisplayValue;
                 if Focused then SelectAll;  {7/28/97 - Select all of text }
              end;
           except
              ProcessingNotInList:= False;
              raise;
           end
        end;
        ProcessingNotInList:= False;
        OldDisplayValue:= Text;
     end
     else if (Style=csDropDown) and (FGrid.FDisplayFld<>FGrid.FValueFld) and
          (OldDisplayValue<>Text) then { 7/24/98 - Prevent's combo from accepting
                                                   display text that is not in lookup table }
     begin
        if (not inList) then begin
           DisplayValue:= OldDisplayValue;
           FGrid.FValue:= OldLookupValue;
           Text:= OldDisplayValue;
           if Focused then SelectAll;
        end
     end
  end
  else try
     InCloseUpEvent:= True;

     tempInList:= inList;
     if Modified and (not InList) and
        (FFieldLink.editing or isWWCalculatedField or UnboundCombo) then  {6/10/97}
     begin
        FGrid.Visible := False;
        Invalidate;
        InList:= True;  { Reset flag }

        { 5/14/97 - If style is csDropDown, then allow change even though its not in the list }
        if (((Style=csDropDown) and (FGrid.FVAlueFld=FGrid.FDisplayFld))
           or Assigned(FOnNotInList))
           {and (OldDisplayValue<>Text) }then  { 5/23/97 - Call OnNotInList even when its the same, when dropped down }
        begin
           Accept:= True;
           if Assigned(FOnNotInList) and (Text<>'') then begin
              ProcessingNotInList:= True;
              OnNotInList(self, LookupTable, Text, Accept);
              wwFixMouseDown;
           end;
           if Accept then OldDisplayValue:= Text;
           ProcessingNotInList:= False;

           if Accept then begin
              if (FGrid.FValueFld=FGrid.DisplayFld) then begin
                 LookupValue:= Text;
                 DisplayValue:= Text;
                 if (FFieldLink.Field<>Nil) then begin
                    if FFieldLink.Field.asString<>Text then  { 6/7/97 - Only update if changed }
                       FFieldLink.Field.AsString := Text;
                 end
              end
              else if not isWWCalculatedField then begin
                 FGrid.FValue:= FGrid.FValueFld.asString;
                 if UnboundCombo then Text:= TypedInText;
              end;
           end
           else begin
              DisplayValue:= OldDisplayValue;
              LookupValue:= OldLookupValue;
              InCloseUpEvent:= False;
              exit
           end
        end
        else begin  { 7/24/98 - Prevent's combo from accepting display text that is not in lookup table }
           if (Style=csDropDown) and (FGrid.FDisplayFld<>FGrid.FValueFld) and
              (OldDisplayValue<>Text) then
           begin
              DisplayValue:= OldDisplayValue;
              { 1/27/99 - OldLookupValue is not reliable for calculated fields }
              if not IsWWCalculatedField then FGrid.FValue:= OldLookupValue;
              Text:= OldDisplayValue;
           end
        end
     end;

     if Modified and {(FGrid.FHiliteRow>=0) and}
        (FFieldLink.editing or isWWCalculatedField or UnboundCombo) then begin
        if UnboundCombo then begin
           if (not Accept) and TempInList then begin
              if (FGrid.FValueFld=FGrid.DisplayFld) then
                 Text:= LookupValue
              else Text:= FGrid.DisplayFld.asString;
           end;
           if tempInList then GridClick(self)  { InfoPower 2.0 addition}
           else if ((not Accept) and (Style=csDropDownList)) or   { 6/10/97}
                (FGrid.FValueFld<>FGrid.FDisplayFld) then
           begin
              if AllowClearKey then
              begin
                 Text:= '';   { Not in list so clear values }
                 FGrid.FValue:= '';
              end
              else begin { 3/29/99 - RSW Don't clear unbound control if not in list }
                 DisplayValue:= OldDisplayValue;
                 LookupValue:= OldLookupValue;
              end
           end
        end
        else if isWWCalculatedField then begin
           update;
           FGrid.Visible := False;
           wwChangeFromLink(lookupTable, Modified);
           Text:= FFieldLink.Field.AsString; {7/9/97}
           SelectAll;
        end
        else begin
           Modified:= False;

           if (dataSource<>Nil) and (dataSource.dataSet<>Nil) then begin
              if (FGrid.FValueFld2<>Nil) then begin
                 tempFld:= dataSource.dataSet.FindField(FGrid.FValueFld2.fieldName);
                 if (tempFld<>Nil) and (fgrid.fhiliterow>=0) then begin { 10/14/96 Only change if have selection }
                    if tempFld.asString<>FGrid.FvalueFld2.asString then Modified:= True;
                    tempFld.asString:= FGrid.FValueFld2.asString;
                 end
              end;

              if (FGrid.FValueFld3<>Nil) then begin
                 tempFld:= dataSource.dataSet.FindField(FGrid.FValueFld3.fieldName);
                 if (tempFld<>Nil) and (fgrid.fhiliterow>=0) then begin  { 10/14/96 Only change if have selection }
                    if tempFld.asString<>FGrid.FvalueFld3.asString then Modified:= True;
                    tempFld.asString:= FGrid.FValueFld3.asString;
                 end
              end
           end;

           if (FFieldLink.Field<>Nil) then begin
              if FFieldLink.Field.asString<>FGrid.Value then Modified:= True;
              if Modified then begin
                 ChangingFromLink:= True; { Skip dolookup }
                 try  {4/23/97 - Use try/except block in case of abort in onValidate }

                    {11/25/97 - Update text to current record value in this special case }
                    if (style=csDropDownList) and (not TempInList) and
                       (FGrid.FValueFld<>FGrid.DisplayFld) then
                    begin
                       Text:= FGrid.FDisplayValue;
                    end;

                    FFieldLink.Field.AsString := FGrid.Value;

                 except
                    if not Focused then { 3/9/99 - RSW - If Not Focused then Restore previous value }
                    begin
                       FGrid.FDisplayValue:= OldDisplayValue;
                       FGrid.FValue:= OldLookupValue;
                       Text:= OldDisplayValue;
                    end;

                    { 3/9/99 - RSW - Call raise here }
                    Repaint;
                    Raise;
                 end
              end
              else if (style=csDropDownList) and (not tempinlist) then begin {7/4/97}
                 FGrid.FDisplayValue:= OldDisplayValue;
                 if Assigned(OnNotInList) and (not Accept) then { 2/24/99 - Don't update FValue if Accept }
                    FGrid.FValue:= OldLookupValue;
                 Text:= OldDisplayValue;
              end;
              ChangingFromLink:= False;
           end;
           repaint; { Necessary to repaint drop-down icon }

        end
     end
     else Modified:= False; {6/7/97}

     if not visible then begin  { 10/21/97- If control has somehow become hidden, }
                                { we need to make it visible again in order to }
                                { make the drop-down grid be invisible         }
        visible:= true;
        FGrid.Visible := False;
        visible:= false;
     end
     else FGrid.visible:= false;
     Invalidate;

     if not editable then
        HideCaret(Handle); { Support csDropDownList style }

     if Modified then
     begin
        if (LookupTable is TwwTable) then inc(LTable.InFindRecordCount);  { 5/14/97 - Skip datachange }
        try
           LookupTable.UpdateCursorPos;
           LookupTable.resync([]);
        finally
           if (LookupTable is TwwTable) then dec(LTable.InFindRecordCount);
        end;
        OldDisplayValue:= Text;       {5/14/97}
        OldLookupValue:= LookupValue; {5/14/97}
     end;

     SetModified(Modified);

     if Assigned(FOnCloseUp) then begin
         if DataSource=Nil then FOnCloseUp(Self, LookupTable, Nil, Modified)
         else FOnCloseUp(Self, LookupTable, DataSource.dataSet, Modified);
(* 5/24/97 -  Remove disable controls in onCloseUp event - causes refresh of dataset *)
     end;

     InCloseupEvent:= False;
     {$ifdef wwDelphi4up}
     if wwLookupComboHook<>0 then UnhookWindowsHookEx(wwLookupComboHook);
     wwLookupComboHook:= 0;
     {$endif}
  except
     FGrid.visible:= False;
     ProcessingNotInList:= False;
     ChangingFromLink:= False; {3/11/97}
     Invalidate;
     InCloseupEvent:= False;
     {$ifdef wwDelphi4up}
     if wwLookupComboHook<>0 then begin
        UnhookWindowsHookEx(wwLookupComboHook);
        wwLookupComboHook:= 0;
     end;
     {$endif}
     raise;
  end
end;

procedure TwwDBCustomLookupCombo.GridClick (Sender: TObject);
begin
  inList:= True;
  if (FFieldLink.DataSource<>Nil) and (not FFieldLink.editing) and (not modified) then exit; { 6/7/97 }

  FFieldLink.Edit;
  if (FFieldLink.DataSource = nil) or FFieldLink.Editing or isWWCalculatedField then
  begin

    { Don't allow wwcalc field to be updated if table is readonly }
    if isWWCalculatedField then begin
       if (dataSource.dataSet is TTable) and (dataSource.dataSet as TTable).readOnly then exit;
       if ReadOnly then exit; { 6/11/98 }
    end;

    FFieldLink.Modified;
    Text := FGrid.DisplayValue;
    DoSelectAll;      { This added so text is highlighted when scrolling list }
    ShowCaret(Handle);

    FLastSearchKey:= Text;
  end
end;

procedure TwwDBCustomLookupCombo.SetStyle(Value: TwwDBLookupComboStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
  end;
end;

procedure TwwDBCustomLookupCombo.WMLButtonDown(var Message: TWMLButtonDown);
begin
  if MouseEditable then
    inherited
  else
    NonEditMouseDown (Message);
end;

procedure TwwDBCustomLookupCombo.WMLButtonUp(var Message: TWMLButtonUp);
begin
  if not MouseEditable then MouseCapture := False;
  inherited;
end;

procedure TwwDBCustomLookupCombo.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  if MouseEditable then
    inherited
  else
    NonEditMouseDown (Message);
end;

procedure TwwDBCustomLookupCombo.NonEditMouseDown(var Message: TWMLButtonDown);
var
  CtrlState: TControlState;
begin
  SetFocus;
  if not Focused then exit; {2/28/97}
  HideCaret (Handle);

  if FGrid.Visible then
    CloseUp(True)
  else
    DropDown;

{  MouseCapture := True;}
  if csClickEvents in ControlStyle then
  begin
    CtrlState := ControlState;
    Include(CtrlState, csClicked);
    ControlState := CtrlState;
  end;
  with Message do
    MouseDown(mbLeft, KeysToShiftState(Keys), XPos, YPos);
end;

procedure MouseDragToGrid (Ctrl: TControl; Grid: TwwPopupGrid; X, Y: Integer);
var
  pt, clientPt: TPoint;
begin
  if (Grid.Visible) then
  begin
    pt.X := X;
    pt.Y := Y;
    pt := Ctrl.ClientToScreen (pt);
    clientPt := Grid.ClientOrigin;
    if (pt.X >= clientPt.X) and (pt.Y >= clientPt.Y) and
       (pt.X <= clientPt.X + Grid.ClientWidth) and
       (pt.Y <= clientPt.Y + Grid.ClientHeight) then
    begin
      Ctrl.Perform(WM_LBUTTONUP, 0, MakeLong (pt.x, pt.y)); {9/21/96 }
      pt := Grid.ScreenToClient(pt);
      Grid.Perform(WM_LBUTTONDOWN, 0, MakeLong (pt.x, pt.y));
    end;
  end;
end;

procedure TwwDBCustomLookupCombo.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove (Shift, X, Y);
  if (ssLeft in Shift) and not Editable and (GetCapture = Handle) then
    MouseDragToGrid (Self, FGrid, X, Y);
end;

procedure TwwDBCustomLookupCombo.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if not Editable then
  begin
    HideCaret (Handle);
    invalidate;  { 1/21/99 - Not repainted correctly otherwise in the following situation
                   User invokes a dialog, and when the dialog closes
                   the focus returns to this control. }
  end;

{ 9/18/97 - Move to DoEnter }
{  if (not FGrid.visible) and (not ProcessingNotInList) then begin
     OldDisplayValue:= Text;
     OldLookupValue:= LookupValue;
  end;
}
end;

procedure TwwDBCustomLookupCombo.CMExit(var Message: TCMExit);
var OldText: string;
begin
  {7/28/97 - If processing OnNotInList then ignore focus change since its
             triggered by a message dialog by the user.  If we do call
             UpdateRecord then the component incorrectly updates the tfield
             even though the OnNotInList handler may indicate that it
             it should not be updated.
  }
  if ProcessingNotInList then
  begin
     exit;
  end;

  try
    FFieldLink.UpdateRecord;
    SelStart:= 0; { 10/12/97 - Allows component to left-justify when exiting }
  except
    DoSelectAll;
    ProcessingNotInList:= True; {10/1/97 - Don't reset backvalues in DoEnter }
    if CanFocus then SetFocus;  { 9/1/98 }
    ProcessingNotInList:= False; { 10/1/97 }
    raise;
  end;
  inherited;
  if not Editable then Invalidate;
  if ButtonEffects.Flat then FButton.invalidate;

  FFocused:= False;
  Invalidate;

  if IsTransparentEffective then begin
     Frame.CreateTransparent:= True;
     OldText:= Text;  { Text is cleared when recreating window }
     RecreateWnd;
     Text:= OldText;
     SetEditRect;
  end;

end;

procedure TwwDBCustomLookupCombo.CMEnter(var Message: TCMGotFocus);
var exStyle, origStyle: longint;
begin
  SetEditRect;
  if AutoSelect and not (csLButtonDown in ControlState) then DoSelectAll;
  inherited;
  if not Editable then Invalidate;
  if ButtonEffects.Flat then FButton.invalidate;

  if IsTransparentEffective then begin
     Frame.CreateTransparent:= False;
     OrigStyle:= Windows.GetWindowLong(handle, GWL_EXSTYLE);
     exStyle:= OrigStyle and not WS_EX_TRANSPARENT;
     Windows.SetWindowLong(handle, GWL_EXSTYLE, exStyle);
     invalidate;
  end;

  FFocused:= True;
  Invalidate;
end;

procedure TwwDBCustomLookupCombo.DoSelectAll;
begin
  if Editable then
    SelectAll;
end;

procedure TwwDBCustomLookupCombo.SetOptions(Value: TwwDBLookupListOptions);
begin
  FGrid.Options := Value;
end;

function TwwDBCustomLookupCombo.GetOptions: TwwDBLookupListOptions;
begin
  Result := FGrid.Options;
end;

procedure TwwDBCustomLookupCombo.Loaded;
begin
  FButton.Width:= wwmax(GetSystemMetrics(SM_CXVSCROLL), 15); {4/14/97}
  if (parent<>Nil) or (owner<>nil) then  { 11/17/97 - parent=nil causes runtime error }
     UpdateButtonPosition;
  inherited Loaded;
  DataChange(Self);
end;

function TwwDBCustomLookupCombo.GetSelectedFields: TStrings;
begin
    result:= FGrid.getSelectedFields;
end;

procedure TwwDBCustomLookupCombo.SetSelectedFields(sel : TStrings);
begin
    FGrid.setSelectedFields(sel);
end;

{ Map scrolling to keystrokes, otherwise current highlight doesn't update properly }
procedure TwwDBLookupList.WMVScroll(var Message: TWMVScroll);
  Function Sequencable: boolean;
  begin
     if (Datalink.Dataset is TwwTable) then
        result:= (DataLink.DataSet as TwwTable).isSequencable
     else result:= False;
  end;

begin
  if not visible then exit;

{  key:= 0;}

  if Datalink.Active then
    with Message, DataLink.DataSet, Datalink do
      case ScrollCode of
        SB_LINEUP: MoveBy(-ActiveRecord - 1);
        SB_LINEDOWN: MoveBy(RecordCount - ActiveRecord);
        SB_THUMBPOSITION:
          begin
            if FHiliteRow >= 0 then FHiliteRow := -1;
            inherited;
          end;
        else inherited;
      end;
{
        SB_PAGEUP: key:= VK_PRIOR;
        SB_PAGEDOWN: key:= VK_NEXT;
        SB_THUMBPOSITION:
          begin
            if Sequencable then inherited
            else begin
               case Pos of
                 0: key:= VK_HOME;
                 1: key:= VK_PRIOR;
                 2: Exit;
                 3: key:= VK_NEXT;
                 4: key:= VK_END;
               end;
            end
          end;

        SB_BOTTOM: key:= VK_END;
        SB_TOP: key:= VK_HOME;
      end;

   if key<>0 then KeyDown(key, []);
}
end;


{ TLookupList }

constructor TwwDBLookupList.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FFieldLink := TFieldDataLink.Create;
 
  FFieldLink.Control := Self;
  FFieldLink.OnDataChange := DataChange;
  FFieldLink.OnEditingChange := EditingChange;
  FFieldLink.OnUpdateData := UpdateData;
  FFieldLink.OnActiveChange := FieldLinkActive;
  FTitleOffset := 0;

  FInCellSelect:= False;
  FUpdateFields := False;
  FValue := '';
  FValue2 := '';
  FValue3 := '';
  FDisplayValue := '';
  FLookupField := '';
  FHiliteRow := -1;
  inherited Options := [dgRowSelect];
  FixedCols := 0;
  FixedRows := 0;
  Width := 121;
  Height := 97;

  SetLookupSource(TDataSource.create(Self));
{  FSelected:= TStringList.create;}
  LookupFieldCount:= 0;
end;

destructor TwwDBLookupList.Destroy;
begin
  FFieldLink.OnDataChange := nil;
  FFieldLink.Free;
  FFieldLink := nil;
{  FSelected.Free;
  FSelected := Nil;}

  inherited Destroy;
end;

function TwwDBLookupList.getSelectedFields: TStrings;
begin
    result:= inherited Selected;
end;

procedure TwwDBLookupList.setSelectedFields(sel : TStrings);
begin
   (inherited Selected).assign(sel);
end;

procedure TwwDBLookupList.CreateWnd;
begin
  inherited CreateWnd;
  DataChange (Self);  {update to current value}
end;

procedure TwwDBLookupList.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FFieldLink <> nil) and
     (AComponent = DataSource) then
    DataSource := nil;
end;

function TwwDBLookupList.GetDataSource: TDataSource;
begin
  if FFieldLink<>Nil then
     Result := FFieldLink.DataSource
  else Result:= Nil;
end;

procedure TwwDBLookupList.SetDataSource(Value: TDataSource);
begin
  if (Value <> nil) and ((Value = GetLookupSource) or ((Value.DataSet <> nil)
    and (Value.DataSet = DataLink.DataSet))) then
    RaiseException(SLookupSourceError);
  FFieldLink.DataSource := Value;
end;

function TwwDBLookupList.GetLookupSource: TDataSource;
begin
  Result := inherited DataSource;
end;

procedure TwwDBLookupList.NewLayout;
begin
  InitFields(True); { Release versin adds this }
  LayoutChanged;
  FValue:= '';
  FValue2:= '';
  FValue3:= '';
  DataChange (Self);
end;

Function TwwDBLookupList.GetLookupTable: TDataSet;
begin
   result:= Nil;
   if (inherited DataSource) = Nil then exit;
   result:= ((inherited DataSource).dataSet);
end;

procedure TwwDBLookupList.SetLookupTable(Value: TDataSet);
begin
   if (GetLookupSource = Nil) then begin
     MessageDlg('Lookup Source is not created', mtinformation, [mbok], 0);
     exit;
   end;

   if ((DataSource<>Nil) and (Value = DataSource.DataSet)) or
      ((Value<>Nil) and (Value = FFieldLink.DataSet)) then
     RaiseException(SLookupSourceError);

   if (Value <> nil) and
      not (Value.InheritsFrom(TDataSet)) then
     RaiseException(SLookupTableError);

   (inherited DataSource).dataSet:= Value;

   NewLayout;
end;

procedure TwwDBLookupList.SetLookupSource(Value: TDataSource);
begin
  if (Value <> nil) and ((Value = DataSource) or
    ((Value.DataSet <> nil) and (Value.DataSet = FFieldLink.DataSet))) then
     RaiseException(SLookupSourceError);
  if (Value <> nil) and (Value.DataSet <> nil) and
      not (Value.DataSet.InheritsFrom(TDataSet)) then
     RaiseException(SLookupTableError);
  inherited DataSource := Value;
  NewLayout;
end;

procedure TwwDBLookupList.SetLookupField(const Value: string);
begin
  if Value <> LookupField then
  begin
    FLookupField:= Value;
    NewLayout;
  end;
end;

procedure TwwDBLookupList.SetValue(const Value: string);
begin
  HandleNeeded;  {Added 5/19/96 so initialization of Text property works right away}

  if DataLink.Active and FFieldLink.Active and
      ((DataSource = GetLookupSource) or
      ((DataSource<>Nil) and (DataSource.DataSet = GetLookupSource.DataSet))) then
     RaiseException(SLookupSourceError);

  if (FValue <> Value) or (Row = FTitleOffset) then
  begin
    if DataLink.Active and (FValueFld <> nil) then
    begin
      FValue:= Value;
      FHiliteRow := -1;     { to be reset in .HighlightCell }

      {5/28/97 - Optimize of display when displayed field is a lookup or linked field }
      {12/2/97 - Move optimization code before test for FCombo.visible }
      if (inDataChanged>0) and isWWCalculatedField then
      begin
         FDisplayValue:= FCombo.DataSource.DataSet.FieldByName(FCombo.datafield).asstring;
         exit;
      end;

      {Optimize of display and stored field are the same }
      if (FValueFld=FDisplayFld) then begin
         FDisplayValue:= FValue;
         exit;
      end;

      if FCombo.visible then begin
         DoLookup(False);
         if FFoundValue and (FValueFld <> FDisplayFld) then
           FDisplayValue:= FDisplayFld.asString
         else if (FValueFld = FDisplayFld) then
           FDisplayValue:= FValue
         else
            FDisplayValue:= '';
      end
    end;
  end;
end;

procedure TwwDBLookupList.SetDisplayValue(const Value: string);
begin
  if (FDisplayValue <> Value) or (Row = FTitleOffset) then
  begin
    FFoundValue := False;
    if DataLink.Active and (FDisplayFld <> nil) then
    begin
      FHiliteRow := -1;     { to be reset in .HighlightCell }
      FFoundValue := False;

      if FCombo.UseSeqSearch then
      begin
          with self as TwwPopupGrid do begin
              FFoundValue:= FCombo.FindRecord(Value, LookupField, mtExactMatch,
                      ssoCaseSensitive in TwwPopupGrid(self).FCombo.SeqSearchOptions)
          end
      end
      else with TwwTable(inherited DataSource.DataSet) do
      begin
           if FValueFld2=Nil then begin
              with self as TwwPopupGrid do begin
                 if MasterSource<>Nil then
                    FFoundValue:= FCombo.DoFindRecord(Value, LookupField, mtExactMatch) {1/22/97}
                 else begin
                    if IndexFieldCount=0 then
                       FFoundValue:= wwFindRecord(Value, LookupField, mtExactMatch,
                           ssoCaseSensitive in TwwPopupGrid(self).FCombo.SeqSearchOptions)
                    else
                        FFoundValue:= wwFindKey([Value]);
                 end
              end
           end
           else begin
              if FValueFld3=Nil then begin
                 with self as TwwPopupGrid do begin
                   FFoundValue:= wwFindKey([Value, FCombo.SetValue2]);
                 end
              end
              else begin
                 with self as TwwPopupGrid do begin
                   FFoundValue:=
                      wwFindKey([Value, FCombo.SetValue2, FCombo.SetValue3])
                 end
              end
           end;
      end;

      with TwwPopupGrid(self).FCombo do begin
         inList:= FFoundValue;  { !!!! Added InfoPower 2.0}
         TypedInText:= Text;
         if Value='' then inList:= True;
      end;

      FDisplayValue:= Value;
      if (FValueFld = FDisplayFld) then
        FValue:= FDisplayValue
      else if not FFoundValue then
      begin
        FDisplayValue:= '';
        FValue:= '';
      end
      else
        FValue:= FValueFld.asString;
    end;
  end;
end;

Function TwwDBLookupList.isWWCalculatedField: boolean;
begin
   with TwwPopupGrid(self) do result:= FCombo.isWWCalculatedField;
end;

Procedure TwwDBCustomLookupCombo.ComputeLookupFields;
var tempValue, toLink, tolinks: string;
    pos: integer;
begin
    if DataField='' then exit;

    if FFieldLink.Field=nil then exit;
    if isLookup then begin
       {$ifdef win32}
       toLinks:= FFieldLink.Field.LookupKeyFields
       {$endif}
    end
    else begin
       toLinks:= '';
       TempValue:= wwDataSetGetLinks(DataSource.DataSet, dataField);
       if TempValue='' then exit;

       pos:= 1;
       while True do begin
          strGetToken(TempValue, ';', pos); { Skip }
          toLink:= strGetToken(TempValue, ';', pos);
          if (toLink='') then break;
          if toLinks<>'' then
             toLinks:= toLinks + ';' + toLink
          else toLinks:= toLink;
       end;
    end;

    if (tolinks<>'') then begin
       LookupField:= tolinks;
       FGrid.InitFields(True);
    end

end;

Function TwwDBLookupList.LTable: TwwTable;
begin
   result:= LookupTable as TwwTable;
end;

procedure TwwDBLookupList.DoLookup(SetToDisplayIndex: boolean);
var curTable: TDataSet;
    links: TStrings;
    fpos: integer;
    fromlink, toLink: wwSmallString;
    fromLinks: string;
    {$ifdef win32}
    toLinks: string;
    tpos: integer;
    {$endif}

  Function UnBoundCombo: boolean;
  begin
      with (self as TwwPopupGrid) do begin
         result:=  (FCombo.dataSource=Nil) or (FCombo.dataSource.dataSet=Nil)
      end
  end;

begin

  FFoundValue := False;
  if not HandleAllocated then Exit;
   with (self as TwwPopupGrid) do
     if not FCombo.visible then exit;                { optimization}

  if (LookupTable is TwwTable) then inc(LTable.InFindRecordCount);

  try with LookupTable do begin
    if isWWCalculatedField then begin
       with self as TwwPopupGrid do begin
          curTable:= (FCombo.dataSource.dataSet);
          if FCombo.isLookup then begin
             {$ifdef win32}
             links:= TStringlist.create;

             fromLinks:= FCombo.FFieldLink.Field.KeyFields;
             toLinks:= FCombo.FFieldLink.Field.LookupKeyFields;
             fpos:= 1; tpos:= 1;
             while True do begin
                fromLink:= strGetToken(fromlinks, ';', fpos);
                toLink:= strGetToken(tolinks, ';', tpos);
                if (fromLink='') or (toLink='') then break;
                links.add(fromLink );
                links.add(toLink);
             end;

             if (LookupTable is TwwTable) and (LTable.MasterSource<>Nil) then begin
                { 7/30/97 - Remove index switching on detail lookuptable when using a lookupfield }
                FFoundValue:= FCombo.DoFindRecord(curTable.FieldByName(links[links.count-2]).asString,
                    links[links.count-1], mtExactMatch);
             end
             else begin
                if (LookupTable is TwwTable) then begin  {7/10/97 - Support Non TwwTable against lookup field }
                   FCombo.UpdateSearchIndex(False);
                   FFoundValue:= FCombo.DoFindRecord(curTable.FieldByName(links[links.count-2]).asString,
                       links[links.count-1], mtExactMatch);
                end
                else begin
                   FFoundValue:= FCombo.FindRecord(curTable.FieldByName(links[links.count-2]).asString,
                    links[links.count-1], mtExactMatch, False);
                end
             end;
             links.free;
             {$endif}
          end
          else begin
             { Move lookupTable to match curTable's lookup value }
             if (LookupTable is TwwTable) and (not FCombo.HasMasterSource) then
             begin
                lTable.inLookupLink:= True;  {12/4/96}
                FFoundValue:= wwDataSetSyncLookupTable(curTable, lookupTable, FCombo.dataField, DummyString);
                lTable.inLookupLink:= False; {12/4/96}
             end
             else begin
                { Sequential search using lookupfield since its the detail table}
                links:= TStringlist.create;
                fpos:= 1;
                fromLinks:= wwDataSetGetLinks(curTable, FCombo.DataField); { From and to links }
                while True do begin
                   fromLink:= strGetToken(fromLinks, ';', fpos);
                   toLink:= strGetToken(fromLinks, ';', fpos);
                   if (fromLink='') or (toLink='') then break;
                   links.add(fromLink);
                   links.add(toLink);
                end;
                if (LookupTable is TwwTable) then begin  {7/10/97 - Support Non TwwTable against lookup field }
                   FCombo.UpdateSearchIndex(False);
                   FFoundValue:= FCombo.DoFindRecord(curTable.FieldByName(links[links.count-2]).asString,
                    links[links.count-1], mtExactMatch);
                end
                else begin
                   FFoundValue:= FCombo.FindRecord(curTable.FieldByName(links[links.count-2]).asString,
                    links[links.count-1], mtExactMatch, False);
                end;
                links.free;
             end;
          end;

          { Switch index to left-most column }
          if setToDisplayIndex then  {12/4/96}
             FCombo.UpdateSearchIndex(True);

          if not FFoundValue then begin
             First;
             { Clear so nothing is highlighted }
             FCombo.FGrid.FValue:= '';
             if FCombo.FGrid.FValueFld2<>Nil then
                FCombo.FGrid.FValue2:= '';
             if FCombo.FGrid.FValueFld3<>Nil then
                FCombo.FGrid.FValue3:= '';
             Update;
          end
          else begin
             FCombo.FGrid.FValue:= FCombo.FGrid.FValueFld.asString;
             if FCombo.FGrid.FValueFld2<>Nil then
                FCombo.FGrid.FValue2:= FCombo.FGrid.FValueFld2.asString;
             if FCombo.FGrid.FValueFld3<>Nil then
                FCombo.FGrid.FValue3:= FCombo.FGrid.FValueFld3.asString;
          end
       end
    end
    else begin

      {Switch index to lookupfield being used }
      with self as TwwPopupGrid do
         if Lookupfield<>'' then
         begin
            FCombo.UpdateSearchIndex(False);
         end;

      if State = dsSetKey then Exit;

      if UnBoundCombo then begin

         if FValueFld = DisplayFld then begin
            FValue:= (self as TwwPopupGrid).FCombo.DisplayValue;
            FDisplayValue:= FValue;
         end;

      end;

      FastLookup;
      if not setToDisplayIndex then exit;  { Optimization}

      with TwwPopupGrid(self).FCombo do begin
         inList:= FFoundValue;  { !!!! Added InfoPower 2.0}
         TypedInText:= Text;
         if Value='' then inList:= True;
      end;

      {Switch index to left most column for display purposes}
      with self as TwwPopupGrid do
      begin
         FCombo.UpdateSearchIndex(True);
      end;

      if not FFoundValue then
      begin
         First;
      end
    end;

  end
  finally
    if (LookupTable is TwwTable) then dec(LTable.InFindRecordCount);
  end;

end;

function TwwDBLookupList.GetLookupField: string;
begin
  Result := FLookupField;
end;

function TwwDBLookupList.GetValue: string;
begin
  Result := FValue;
end;

function TwwDBLookupList.GetValue2: string;
begin
  Result := FValue2;
end;

function TwwDBLookupList.GetValue3: string;
begin
  Result := FValue3;
end;

function TwwDBLookupList.GetDisplayValue: string;
begin
  Result := FDisplayValue;
end;

function TwwDBLookupList.GetDataField: string;
begin
  Result := FFieldLink.FieldName;
end;

procedure TwwDBLookupList.SetDataField(const Value: string);
begin
  FFieldLink.FieldName := Value;
end;

function TwwDBLookupList.GetReadOnly: Boolean;
begin
  Result := FFieldLink.ReadOnly;
end;

function TwwDBLookupList.CanEdit: Boolean;
begin
  Result := (FFieldLink.DataSource = nil) or FFieldLink.Editing
end;

procedure TwwDBLookupList.SetReadOnly(Value: Boolean);
begin
  FFieldLink.ReadOnly := Value;
end;

procedure TwwDBLookupList.DataChange(Sender: TObject);
begin
  if (FFieldLink.Field <> nil) and not (csLoading in ComponentState) then
  begin
    Value := FFieldLink.Field.AsString;
  end
end;

procedure TwwDBLookupList.EditingChange(Sender: TObject);
begin
end;

procedure TwwDBLookupList.UpdateData(Sender: TObject);
begin
  if FFieldLink.Field <> nil then
    FFieldLink.Field.AsString := Value;
end;

procedure TwwDBLookupList.InitFields(showError: boolean);
var thispos: integer;
    links, fromlink, toLink: string;
    APos: integer;
    curPos: integer;
    field1Name, field2Name, field3Name: string;
begin
  FDisplayFld:= nil;
  FValueFld:= nil;
  FValueFld2:= nil;
  FValueFld3:= nil;
  if (not DataLink.active) or(length(LookupField)=0) then exit;

  if (Datalink.Datasource = nil) or (Datalink.Dataset = nil) then Exit;
  with Datalink.DataSet do
  begin
    curPos:= 1;
    field1Name:= strGetToken(lookupField, ';', curpos);
    field2Name:= strGetToken(lookupField, ';', curpos);
    field3Name:= strGetToken(lookupField, ';', curpos);
    FValueFld := FindField(field1Name);
    if (FValueFld=Nil) and ShowError then
    {$ifdef wwDelphi3Up}
      {$ifdef wwDelphi3}
      raise EInvalidOperation.create(Format(SFieldNotFound, ['Error', lookupField]));
      {$else}
      raise EInvalidOperation.create(Format(SFieldNotFound, [lookupField]));
      {$endif}
    {$else}
      raise EInvalidOperation.create(FmtLoadStr(SFieldNotFound, [lookupField]));
    {$endif}
    if field2Name<>'' then FValueFld2 := FindField(field2name);
    if field3Name<>'' then FValueFld3 := FindField(field3name);

    { compute # of lookup fields }
    if FValueFld3<>Nil then LookupFieldCount:= 3
    else if FValueFld2<>Nil then LookupFieldCount:= 2
    else if FValueFld<>Nil then LookupFieldCount:= 1;

    { Set lookup field to match calculated field }
    if isWWCalculatedField then begin
       with self as TwwPopupGrid do begin
          links:= wwDataSetGetLinks(FCombo.dataSource.dataSet, FCombo.dataField);
          if selected.count=0 then
             FDisplayFld:= FindField(wwDataSetGetDisplayField(FCombo.dataSource.dataSet,
                                     FCombo.dataField));
       end;
       APos:= 1;
       fromLink:= strGetToken(links, ';', APos);
       toLink:= strGetToken(links, ';', APos);
       if (fromLink<>'') and (toLink<>'') then begin
          FValueFld:= FindField(toLink);
          fromLink:= strGetToken(links, ';', APos);
          toLink:= strGetToken(links, ';', APos);
          if (fromLink<>'') and (toLink<>'') then begin
             FValueFld2:= FindField(toLink);
             fromLink:= strGetToken(links, ';', APos);
             toLink:= strGetToken(links, ';', APos);
             if (fromLink<>'') and (toLink<>'') then
                FValueFld3:= FindField(toLink);
          end
       end
    end;

    if FValueFld <> nil then
    begin
      { Set DisplayFld to first field }
      if (Selected.count) > 0 then
      begin
        thisPos:= pos(#9, selected[0]);
        if (thisPos>=0) then FDisplayFld:= FindField(copy(selected[0], 1, thisPos-1));
      end;
      if FDisplayFld = nil then begin
         FDisplayFld := FValueFld;
      end
    end;
  end;
end;

procedure TwwDBLookupList.DefineFieldMap;
var
  i: integer;
begin
  InitFields(False);
  if FValueFld <> nil then
  begin
     if not useTFields then inherited DefineFieldMap
     else with LookupTable do begin
        if fieldCount = 0 then DataLink.AddMapping(FValueFld.FieldName)
        else begin
           for i:= 0 to fieldCount-1 do begin
              if (fields[i].visible) then begin
                 Datalink.AddMapping (Fields[i].FieldName)
              end;
           end
        end
     end
  end
end;

procedure TwwDBLookupList.SetColumnAttributes;
var
  I: Integer;
  TotalWidth, BorderWidth: Integer;
begin
  inherited SetColumnAttributes;

  if FieldCount > 0 then
  begin
    BorderWidth := 0;
    if loColLines in FOptions then BorderWidth := 1;
    TotalWidth := 0;
    for I := 0 to ColCount -2 do
      TotalWidth := TotalWidth + ColWidths[I] + BorderWidth;
    if (ColCount = 1) or (TotalWidth < (ClientWidth - 15)) then
      ColWidths[ColCount-1] := ClientWidth - TotalWidth;
  end;
end;

procedure TwwDBLookupList.WMSize(var Message: TWMSize);
begin
  if csDestroying in ComponentState then exit;
  if not BeAccurate and not visible then exit;
  inherited;
  SetColumnAttributes;
end;

function TwwDBLookupList.CanGridAcceptKey(Key: Word; Shift: TShiftState): Boolean;
var
  MyOnKeyDown: TKeyEvent;
begin
  Result := True;
  if Key = VK_INSERT then Result := False
  else if Key in [VK_UP, VK_DOWN, VK_NEXT, VK_RIGHT, VK_LEFT, VK_PRIOR,
    VK_HOME, VK_END] then
  begin
    FFieldLink.Edit;
    FCombo.Modified:= True;  { 6/4/97 - Allows GridClick to change text }
    if (Key in [VK_UP, VK_DOWN, VK_RIGHT, VK_LEFT]) and not CanEdit then
      Result := False
    else if (inherited DataSource <> nil) and
        (inherited DataSource.State <> dsInactive) then
    begin
      if (FHiliteRow >= 0) and (FHiliteRow <> DataLink.ActiveRecord) then
      begin
        Row := FTitleOffset + FHiliteRow;
        Datalink.ActiveRecord := FHiliteRow;
      end
      else if (FHiliteRow < 0) then
      begin
        if FFoundValue then
          DoLookup(True)
        else
        begin
          DataLink.DataSource.DataSet.First;
          Row := FTitleOffset;
          Key := 0;
          MyOnKeyDown := OnKeyDown;
          if Assigned(MyOnKeyDown) then MyOnKeyDown(Self, Key, Shift);
          InvalidateRow (FTitleOffset);
          ListClick;
          Result := False;
        end;
      end;
    end;
  end;
end;

procedure TwwDBLookupList.KeyDown(var Key: Word; Shift: TShiftState);
begin
  try
     FInCellSelect := True;
{     LookupTable.DisableControls;}
     inherited KeyDown (Key, Shift);
  finally
    FInCellSelect := False;
  end;

  if (Key in [VK_UP, VK_DOWN, VK_NEXT, VK_PRIOR, VK_HOME, VK_END]) and
      CanEdit then
  begin
    Invalidate;
    ListClick;
  end;
{  LookupTable.enableControls;}
end;


procedure TwwDBLookupList.KeyPress(var Key: Char);
begin
  inherited KeyPress (Key);
  case Key of
    #32..#255:
      DataLink.Edit;
    Char (VK_ESCAPE):
      begin
        FFieldLink.Reset;
        Key := #0;
      end;
  end;
end;

procedure TwwDBLookupList.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  CellHit: TGridCoord;
  MyOnMouseDown: TMouseEvent;
begin
  if not (csDesigning in ComponentState) and CanFocus and TabStop then
  begin
    SetFocus;
    if ValidParentForm(Self).ActiveControl <> Self then
    begin
      MouseCapture := False;
      Exit;
    end;
  end;
  if ssDouble in Shift then
  begin
    DblClick;
    Exit;
  end;
  if (Button = mbLeft) and (DataLink.DataSource <> nil) and
    (FDisplayFld <> nil)  then
  begin
    CellHit := MouseCoord (X, Y);
    if (CellHit.Y >= FTitleOffset) then
    begin
      FFieldLink.Edit;
      FGridState := gsSelecting;
      SetTimer(Handle, 1, 60, nil);
      if (CellHit.Y <> (FHiliteRow + FTitleOffset)) then
      begin
        InvalidateRow (FHiliteRow + FTitleOffset);
        InvalidateRow (CellHit.Y);
      end;
      Row := CellHit.Y;
      Datalink.ActiveRecord := Row - FTitleOffset;
    end;
  end;
  MyOnMouseDown := OnMouseDown;
  if Assigned(MyOnMouseDown) then MyOnMouseDown(Self, Button, Shift, X, Y);
end;

procedure TwwDBLookupList.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove (Shift, X, Y);
  if FGridState = gsSelecting then
    if (Row >= FTitleOffset) then Datalink.ActiveRecord := Row - FTitleOffset;
end;

procedure TwwDBLookupList.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  OldState: TGridState;
begin
  OldState := FGridState;
  inherited MouseUp(Button, Shift, X, Y);
  if OldState = gsSelecting then
  begin
    if (Row >= FTitleOffset) then Datalink.ActiveRecord := Row - FTitleOffset;
    ListClick;
  end;
end;

procedure TwwDBLookupList.ListClick;
begin
  { 11/12/98 -  Check readonly flag }
  if (CanEdit and not FCombo.ReadOnly) and (FDisplayFld <> nil) then
  begin
    if FFieldLink.Editing then
      FFieldLink.Modified;
    FDisplayValue:= FDisplayFld.asString;
    if (FValueFld <> FDisplayFld)then begin
      FValue:= FValueFld.asString;
      if FValueFld2<>Nil then FValue2:= FValueFld2.AsString;
      if FValueFld3<>Nil then FValue3:=FValueFld3.AsString;

    end
    else begin
      FValue:= FDisplayValue;
      if FValueFld2<>Nil then FValue2:= FValueFld2.AsString;
      if FValueFld3<>Nil then FValue3:= FValueFld3.AsString;
    end
  end;
  if Assigned (FOnListClick) then FOnListClick(Self);
end;

function TwwDBLookupList.HighlightCell(DataCol, DataRow: Integer; const Value: string;
      AState: TGridDrawState): Boolean;
var
  OldActive: Integer;
begin
  Result := False;
  if not DataLink.Active or (FValueFld = nil) then Exit;
  if (CanEdit) and ((FGridState = gsSelecting) or FInCellSelect) then
  begin
    if Row = (DataRow + FTitleOffset) then
    begin
      Result := True;
      FHiliteRow := DataRow;
    end;
  end
  else
  begin
    OldActive := DataLink.ActiveRecord;
    try
      DataLink.ActiveRecord := DataRow;
      if (GetValue = FValueFld.AsString) then begin
         if (FValueFld2<>Nil) then begin
            if (GetValue2 = FValueFld2.asString) then
            begin
              if (FValueFld3=Nil) then begin
                 Result := True;
                 FHiliteRow := DataRow;
              end
              else begin
                 if (GetValue3 = FValueFld3.asString) then begin
                    Result := True;
                    FHiliteRow := DataRow;
                 end
              end
            end
         end
         else begin
           Result := True;
           FHiliteRow := DataRow;
         end
      end;
    finally
      DataLink.ActiveRecord := OldActive;
    end;
  end;
end;

procedure TwwDBLookupList.Paint;
begin
{  FHiliteRow := -1;}
  inherited Paint;
  if Focused and (FHiliteRow <> -1) then
    Canvas.DrawFocusRect(BoxRect(0, FHiliteRow, MaxInt, FHiliteRow));
end;

procedure TwwDBLookupList.Scroll(Distance: Integer);
begin
  if not visible then exit;

  if FHiliteRow >= 0 then
  begin
    FHiliteRow := FHiliteRow - Distance;
    if FHiliteRow >= VisibleRowCount then
      FHiliteRow := -1;
  end;
  inherited Scroll(Distance);
end;

procedure TwwDBLookupList.LinkActive(Value: Boolean);
begin
  inherited LinkActive (Value);
  if DataLink.Active then
  begin
{    if not (GetLookupSource.DataSet.InheritsFrom(TTable)) then
      RaiseException(SLookupTableError);}
    SetValue ('');   {force a data update}
    DataChange(Self);
  end;
end;

procedure TwwDBLookupList.FieldLinkActive(Sender: TObject);
begin
  if FFieldLink.Active and DataLink.Active then
  begin
    DataChange(Self);
  end
end;

procedure TwwDBLookupList.CMEnter(var Message: TCMEnter);
begin
  inherited;
  if FHiliteRow <> -1 then InvalidateRow(FHiliteRow);
end;

procedure TwwDBLookupList.CMExit(var Message: TCMExit);
begin
  try
    FFieldLink.UpdateRecord;
  except
    SetFocus;
    raise;
  end;
  inherited;
  if FHiliteRow <> -1 then InvalidateRow(FHiliteRow);
end;

procedure TwwDBLookupList.SetOptions(Value: TwwDBLookupListOptions);
var
  NewGridOptions: TwwDBGridOptions;
begin
  if FOptions <> Value then
  begin
    FOptions := Value;
    FTitleOffset := 0;
    NewGridOptions := [dgRowSelect];
    if loColLines in Value then
      NewGridOptions := NewGridOptions + [dgColLines];
    if loRowLines in Value then
      NewGridOptions := NewGridOptions + [dgRowLines];
    if loTitles in Value then
    begin
      FTitleOffset := 1;
      NewGridOptions := NewGridOptions + [dgTitles];
    end;
    inherited Options := NewGridOptions;

  end;
end;

procedure TwwDBLookupList.Loaded;
begin
  inherited Loaded;
  DataChange(Self);
end;

{ TwwPopupGrid }

constructor TwwPopupGrid.Create(AOwner: TComponent);
begin
  FCombo:= AOwner as TwwDBCustomLookupCombo;

  inherited Create(AOwner);
  {$ifdef win32}
  ControlStyle := ControlStyle + [csNoDesignVisible, csReplicatable];
  {$endif}
  FAcquireFocus := False;
  TabStop := False;
end;

procedure TwwPopupGrid.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    {$ifdef win32}
    Style := Style or WS_BORDER;
    ExStyle := WS_EX_TOOLWINDOW;
    {$endif}
    WindowClass.Style := CS_SAVEBITS;
  end;
end;

procedure TwwPopupGrid.CreateWnd;
begin
  inherited CreateWnd;
  if not (csDesigning in ComponentState) then
    Windows.SetParent(Handle, 0);
  CallWindowProc(DefWndProc, Handle, WM_SETFOCUS, 0, 0);
  FCombo.DataChange (Self);  {update to current value}
end;

procedure TwwPopupGrid.WMLButtonUp(var Message: TWMLButtonUp);
begin
  inherited;
  with Message do
    FCombo.CloseUp(True);
end;

function TwwPopupGrid.CanEdit: Boolean;
begin
  Result := (FCombo.FFieldLink.DataSource = nil) or FCombo.FFieldLink.Editing
    or (FCombo.isWWCalculatedField and
     ((FCombo.datasource.state in [dsEdit, dsInsert]) or (FCombo.dataSource.autoEdit)))

end;

procedure TwwPopupGrid.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  FCombo.EnableEdit; { 10/20/97 - Go through enableedit so flag is set }
{  FCombo.FFieldLink.Edit;}
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TwwPopupGrid.LinkActive(Value: Boolean);
begin
  if Parent = nil then Exit;   {grid being destroyed}
  inherited LinkActive (Value);

  if DataLink.Active then
  begin
    if FValueFld = nil then InitFields(True);
    SetValue ('');   {force a data update}
    FCombo.DataChange (Self);
  end;
end;

{ TwwComboButton }

procedure TwwComboButton.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseUp (Button, Shift, X, Y);

  TwwDBCustomLookupCombo(parent.parent).InvalidateTransparentButton;
end;

procedure TwwComboButton.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var dropDownListVisible: boolean;
begin
  with TwwDBCustomLookupCombo(Parent.Parent) do
  begin
    dropDownListVisible:= FGrid.visible;

    if not FGrid.Visible then
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

  TwwDBCustomLookupCombo(parent.parent).InvalidateTransparentButton;

  with TwwDBCustomLookupCombo(Parent.Parent) do
  begin
    if not dropDownListVisible and FGrid.Visible then exit; {skip remaining code }

    if FGrid.Visible then begin
      if InList then GridClick(self);  {Now hiding drop down so select current selection } {5/14/97 - if InList}
      CloseUp(True)
    end
    else
    begin
      DropDown;
    end;
  end;

end;

procedure TwwComboButton.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove (Shift, X, Y);
  if (ssLeft in Shift) and (GetCapture = Parent.Handle) then
    MouseDragToGrid (Self, TwwDBCustomLookupCombo(Parent.Parent).FGrid, X, Y);
end;

Procedure TwwDBCustomLookupCombo.DrawButton(Canvas: TCanvas; R: TRect;
          State: TButtonState; ControlState: TControlState; var DefaultPaint: boolean);
var Transparent: boolean;
begin
  if ButtonStyle=cbsCustom then exit;

  DefaultPaint:= False;
  Transparent:=  FButton.Flat and
      (not FMouseInButtonControl) and not (FFocused);
  if ButtonStyle=cbsDownArrow then
     wwDrawDropDownArrow(Canvas, R, State, Enabled, ControlState)
  else
      wwDrawEllipsis(Canvas, R, State, Enabled, Transparent,
         ButtonEffects.Transparent {and ButtonEffects.Flat},
         ControlState)
end;

procedure TwwComboButton.paint;
var R : TRect;
    DefaultPaint: boolean;
begin
   { 7/2/99 }
   if twwdbCustomLookupCombo(parent.parent).SkipUpdate then exit;
   if (csPaintCopy in ControlState) and
      not (csDesigning in ComponentState) and IsInGrid(parent.parent) then exit;
   SetRect(R, 0, 0, ClientWidth, ClientHeight);
   with TwwDBCustomLookupCombo(Parent.Parent) do
   begin
      DefaultPaint:= True;
      FMouseInButtonControl:= MouseInControl;
      if (FButton.Glyph.Handle=0) or MouseInControl or
         FFocused or wwisClass(Parent.classType, 'TwwDBGrid') then
         if not (ButtonEffects.Transparent) then
            DrawButton(Canvas, R, FState, ControlState, DefaultPaint);

      if DefaultPaint then begin
         inherited Paint;

         { Draw edges if Default Paint }
         if MouseInControl or (not ButtonEffects.Flat) or
            FFocused or wwisClass(Parent.classType, 'TwwDBGrid') then
            DrawEdge(Canvas.Handle, R, EDGE_RAISED, BF_RECT);
      end;
   end
end;

{ Win95 Addition to support TGridRecord }
{$ifdef win32}
procedure TwwDBCustomLookupCombo.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FFieldLink);
end;
{$endif}

Procedure TwwDBCustomLookupCombo.SetModified(val: boolean);
begin
   Modified:= val;
end;

Function TwwDBCustomLookupCombo.isValidChar(key: word): boolean;
begin
   result:= (key = VK_BACK) or (key=VK_SPACE) or (key=VK_DELETE) or
            ((key >= ord('0')) and (key<=VK_DIVIDE)) or
            (key>VK_SCROLL); { Support international characters }
end;

{ Prevent tab from exiting if processing AutoDropDown character }
procedure TwwDBCustomLookupCombo.WMChar(var Msg: TWMChar);
begin
   if isValidChar(Msg.charcode) and FAutoDropDown and (not FGrid.visible) and
      (Parent is TwwCustomDBGrid) then
      InAutoDropDown:= True;
   inherited;
end;

Procedure TwwDBCustomLookupCombo.SetPreciseEditRegion(val: boolean);
begin
   if (val<>FPreciseEditRegion) then begin
     FPreciseEditRegion:= val;
     RecreateWnd;
   end
end;


Function TwwDBCustomLookupCombo.IsLookupDlg: boolean;
begin
   result:= False;
end;

Function TwwDBCustomLookupCombo.IsLookupRequired: boolean;
begin
   result:= False;
   with FGrid do begin
      if (FValueFld.asString <> LookupValue) then result:= True;
      if (FValueFld2<>Nil) and (FValueFld2.asString <> FValue) then result:= True;
      if (FValueFld3<>Nil) and (FValueFld3.asString <> FValue) then result:= True;
   end
end;

Function TwwDBCustomLookupCombo.DoFindRecord(ASearchValue, ASearchField: string;
   matchType: TwwLocateMatchType): boolean;
var searchIndex: integer;
    doSeqSearch: boolean;
begin
   doSeqSearch:= False;
   if HasMasterSource then begin
      searchIndex:= strCount(LTable.masterFields, ';')+1;
      if searchIndex >= LTable.indexFieldCount then doSeqSearch:= True { Changed > to >=, 3/27/97}
      else if not wwEqualStr(LTable.indexFields[searchIndex].fieldName,ASearchField) then
         doSeqSearch:= True;
   end;

   if (matchType=mtExactMatch) and
      wwEqualStr(ASearchValue, LTable.FieldByName(ASearchField).asString) then
      result:= True    {6/10/97 - Optimization}
   else if doSeqSearch then
      result:= LTable.wwFindRecord(ASearchValue, ASearchField, matchType,
            ssoCaseSensitive in SeqSearchOptions)
   else if HasMasterSource then
      result:= LTable.wwFindNearest(ASearchValue, strCount(LTable.MasterFields, ';')+1)
   else begin
      searchIndex:= GetSearchIndex;
      if searchIndex>=0 then
         result:= LTable.wwFindNearest(ASearchValue, searchIndex)
      else
         result:= FindRecord(ASearchValue, ASearchField, matchType,
            ssoCaseSensitive in SeqSearchOptions)
   end
end;

procedure TwwDBLookupList.DataChanged;
begin
   inherited DataChanged;
   if FCombo.HasMasterSource and (LTable.MasterFields<>'') and
      (LookupTable.state=dsBrowse) and
      (FCombo.FFieldLink.Field <> nil) and not (csLoading in ComponentState) then
   begin
      if not (lookupTable is TwwTable) then begin
         MessageDlg('LookupTable on a detail table is only supported when using a TwwTable as the LookupTable!',
                    mtWarning, [mbok], 0);
         exit;
      end;
      if ((LookupTable as TwwTable).inFindRecordCount>0) then exit;
      if inDataChanged>0 then exit;

      inc(inDataChanged);
      try
         FValue:= '';    { Forces lookup to be performed }
         FCombo.DataChange(FCombo);
      finally
         dec(inDataChanged);
      end;

   end

end;

procedure TwwDBLookupList.DrawCell(ACol, ARow: Longint;
   ARect: TRect;  AState: TGridDrawState);
begin
   { Make cells 3D style }
   inherited;
   Draw3DLines(ARect, ACol, ARow, AState);
end;

{$ifdef wwdelphi4up}
function TwwDBCustomLookupCombo.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FFieldLink <> nil) and
    FFieldLink.ExecuteAction(Action);
end;

function TwwDBCustomLookupCombo.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FFieldLink <> nil) and
    FFieldLink.UpdateAction(Action);
end;
{$endif}

Function TwwDBCustomLookupCombo.GetControlType: TStrings;
begin
   result:= Grid.controltype;
end;

Procedure TwwDBCustomLookupCombo.SetControlType(val: TStrings);
begin
   Grid.controltype.assign(val);
end;

procedure TwwDBCustomLookupCombo.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  if IsInwwObjectViewPaint(self) or
    (IsTransparentEffective and not FFocused) then
  begin
     Message.result:= 1;
     exit;
  end
  else
     inherited;
end;
{
procedure TwwDBCustomLookupCombo.SetFlatButton(val: boolean);
begin
   if FFlatButton<>val then
   begin
      FFlatButton:= val;
      FButton.Flat:= FFlatButton or FFlatButtonTransparent;
      FButton.Glyph.Handle:= LoadComboGlyph;
      FButton.Invalidate;
   end;
end;

procedure TwwDBCustomLookupCombo.SetFlatButtonTransparent(val: boolean);
begin
   if FFlatButtonTransparent<>val then
   begin
      FFlatButtonTransparent:= val;
      FButton.Flat:= FFlatButton or FFlatButtonTransparent;
      FButton.Glyph.Handle:= LoadComboGlyph;
      FButton.Invalidate;
   end;
end;

function TwwDBCustomLookupCombo.GetFlatButton: boolean;
begin
   result:= FFlatButton;
end;


{procedure TwwDBCustomLookupCombo.SetFlatButton(val: boolean);
begin
   if FButton.Flat<>val then
   begin
      FButton.Flat:= val;
      FButton.Glyph.Handle:= LoadComboGlyph;
      FButton.Invalidate;
   end;
end;


function TwwDBCustomLookupCombo.GetFlatButton: boolean;
begin
   result:= FButton.Flat;
end;
}

{procedure TwwDBCustomLookupCombo.GetEditRectForFrame(var Loc: TRect);
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
function TwwDBCustomLookupCombo.Is3DBorder: boolean;
begin
//   result:=
//     Frame.FocusStyle in [efsFrameSunken, efsFrameRaised, efsFrameEtched, efsFrameBump]
   result:= true;
end;

procedure TwwDBCustomLookupCombo.DrawFrame(Canvas: TCanvas);
begin
    wwDrawEdge(self, Frame, Canvas, FFocused);
end;

function TwwDBCustomLookupCombo.isTransparentEffective: boolean;
begin
   result:= Frame.Transparent and Frame.IsFrameEffective and
            not wwIsDesigning(self)
end;

{
procedure TwwDBCustomLookupCombo.SetTransparent(val: boolean);
begin
   if val<>FTransparent then
   begin
     FCreateTransparent:= val;
     FTransparent:= val;
   end
end;
}

procedure TwwDBCustomLookupCombo.CMTextChanged(var Message: TMessage);
begin
  if IsTransparentEffective and (not FFocused) then
     Frame.RefreshTransparentText;

  inherited;
end;


function TwwDBCustomLookupCombo.GetEffectiveAlignment: TAlignment;
begin
   if FFieldLink.Field=nil then result:= FUnboundAlignment
   else result:= FFieldLink.Field.Alignment
end;

{procedure TwwDBCustomLookupCombo.BtnMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
//var r: TRect;
begin
   exit;
   if ButtonFlat and ButtonTransparent then begin
     with FBtnControl do begin
         r:= Rect(parent.left + Left, parent.Top+top,
                 parent.left + left+ Width, parent.top + Top + Height);
         InvalidateRect(parent.parent.handle, @r, True);
         parent.parent.Update;
     end
   end;
end;
}
procedure TwwDBCustomLookupCombo.InvalidateTransparentButton;
var r: TRect;
begin
   if ButtonEffects.Flat or ButtonEffects.Transparent then begin
     with FBtnControl do begin
         r:= Rect(parent.left + Left, parent.Top+top,
               parent.left + left+ Width, parent.top + Top + Height);
        { Calling with True causes flicker for any control that is invalidated.
          Test with False to see if any side effects  }
         InvalidateRect(parent.parent.handle, @r, False);
      end
   end;
   FButton.invalidate;
end;

procedure Register;
begin
{  RegisterComponents('InfoPower', [TwwDBCustomLookupCombo]);
  RegisterComponents('InfoPower', [TwwDBLookupList]);
}
end;

end.

