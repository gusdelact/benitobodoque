unit VirtualTrees;

// Version 1.26
//
// The contents of this file are subject to the Mozilla Public License
// Version 1.1 (the "License"); you may not use this file except in compliance
// with the License. You may obtain a copy of the License at http://www.mozilla.org/MPL/
//
// Software distributed under the License is distributed on an "AS IS" basis,
// WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for the
// specific language governing rights and limitations under the License.
//
// The original code is VirtualTrees.pas, released September 30, 2000.
//
// The initial developer of the original code is digital publishing AG (Munich, Germany).
// Portions created by Digital Publishing are Copyright
// (C) 1999-2000 digital publishing AG. All Rights Reserved.
//
// Contributor(s):
//   Dipl. Ing. Mike Lischke - ml (public@lischke-online.de, original implementor)
//   Freddy Ertl - fe (main beta tester, ideas, much general support, critical observer)
//   Ondrej Kelle - ok (scroll improvements)
//   John Knipper - jk (knipjo@altavista.net, beta testing, Q&As, ideas)
//   Marian Aldenhövel - ma (Maier@home.ivm.de, beta testing, demos)
//----------------------------------------------------------------------------------------------------------------------
//
// 20-NOV-2000 ml:
//   VK_MULTIPLY handling
// 18-NOV-2000 ml:
//   TScreen.HintFont replacement for Delphi 4 
// 16-NOV-2000 ml:
//   small change in the streaming methods for columns
// 13-NOV-2000 ml:
//   - bug fix
// 11-NOV-2000 ml:
//   - node focus change events
//   - header drag mark improvements
//   - utilitiy images
// 10-NOV-2000 ml:
//   column options, bug fixes
// 09-NOV-2000 ml:
//   small bug fix
// 08-NOV-2000 ml:
//   bug fixes
// 07-NOV-2000 ml:
//   clipboard handling bug fixes
//
// for older history see help file
//----------------------------------------------------------------------------------------------------------------------

interface

{$I DFS.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, ImgList,
  ActiveX, Buttons, StdCtrls, Menus;

const
  VTVersion = '1.26';
  // these version numbers are used while streaming so let them separate
  // Note: versions for streams and the tree must be separated because the tree's number is relatively often
  //       increased while the one from the stream is not. The stream's version should only be changed
  //       when something in the stream format changes (which is not the case for tree changes).
  VTStreamMajorVersion = 1;
  VTStreamMinorVersion = 16;

  CacheThreshold = 2000; // number of nodes a tree must at least have to start caching and at the same
                         // time the maximum number of nodes between two cache entries

  // used to indicate that no visible column is concerned during hit tests
  InvalidColumn = -2;

  // indices for check state images used for checking,
  // Note: Depending on the default check image list assigned to a tree there may be tick marks instead of cross marks
  //       (or even totally different images if new images are later added or customization is enabled).
  ckEmpty         = 0;  // an empty image
  ckCheckEmpty    = 1;  // an empty checkbox
  ckCheckChecked  = 2;  // a checkbox with a cross
  ckCheckDisabled = 3;  // a grayed and empty checkbox
  ckCheckGrayed   = 4;  // a grayed checkbox with a cross
  ckRadioEmpty    = 5;  // an empty radio button (circle)
  ckRadioChecked  = 6;  // a radio button with a filled circle
  ckRadioDisabled = 7;  // a grayed and empty radio button
  ckRadioGrayed   = 8;  // a grayed radio button with a filled circle
  ckButtonUp      = 9;  // an unpressed button
  ckButtonDown    = 10; // a pressed button
  ckButtonGrayed  = 11; // a disabled button

  // instead using a TTimer class for each of the various events I use Windows timer with messages
  // as this is more economical
  ExpandTimer = 1;
  EditTimer = 2;
  HeaderTimer = 3;
  ScrollTimer = 4;
  ChangeTimer = 5;
  StructureChangeTimer = 6;

  // need to use this message to release the edit link interface asynchronly
  WM_RELEASEEDITLINK = WM_USER + 31;

  // the VT's own clipboard formats,
  // Note: The reference format is used internally to allow to link to a tree reference
  //       to implement optimized moves and other back references (currently only if sender and receiver are part of the
  //       same process, as I don't want to implement an own COM server just for this simple task).
  CFSTR_VIRTUALTREE = 'Virtual Tree Resource';
  CFSTR_VTREFERENCE = 'Virtual Tree Reference';

var // clipboard format IDs used in OLE drag'n drop and clipboard transfers
  CF_VIRTUALTREE,
  CF_VTREFERENCE: Word;

{$MINENUMSIZE 1}

type
  PCardinal = ^Cardinal;

  TBounds = record
    Left,
    Top,
    Width,
    Height: Integer;
  end;

  // limits the speed interval which can be used for auto scrolling (milliseconds)
  TAutoScrollInterval = 1..1000;

  // need to declare the correct WMNCPaint record as the VCL doesn't
  TRealWMNCPaint = packed record
    Msg: Cardinal;
    Rgn: HRGN;
    lParam: Integer;
    Result: Integer;
  end;

  // Be careful when adding new states as this changes the size of the type which in turn
  // changes the alignment in the node record.
  TVirtualNodeState = (
    vsInitialized,  // set after the node has been initialized
    vsChecking,     // node's check state is changing, avoid propagation
    vsCutOrCopy,    // node is selected as cut or copy and paste source
    vsDisabled,     // set if node is disabled
    vsDeleting,     // set when the node is about to be freed
    vsExpanded,     // set if the node is expanded
    vsHasChildren,  // indicates the presence of child nodes without actually setting them
    vsSelected      // set if the node in the current selection
  );
  TVirtualNodeStates = set of TVirtualNodeState;

  // states used in InitNode to indicate states a node shall initially have
  TVirtualNodeInitState = ( // node is initially selected etc.
    ivsDisabled,
    ivsExpanded,
    ivsHasChildren,
    ivsSelected
  );
  TVirtualNodeInitStates = set of TVirtualNodeInitState;

  TScrollBarStyle = (
    sbmRegular,
    sbmFlat,
    sbm3D
  );

  TScrollBars = (
    ssNone,
    ssHorizontal,
    ssVertical,
    ssBoth
  );

  TVirtualTreeOption = (
    voAcceptOLEDrop,        // register tree as OLE accepting drop target
    voAnimatedToggle,       // expanding and collapsing a node is animated (quick window scroll)
    voAutoDropExpand,       // expand node if it is the drop target for more than 1 sec.
    voAutoExpand,           // nodes are expanded/collapsed on node focus/unfocus
    voAutoScroll,           // tree automatically scrolls if mouse is near the border while dragging or selecting
    voAutoSpanColumns,      // large entries continue into next column(s) if there's no text in them (no clipping)
    voAutoTristateTracking, // if set then checkstates are automatically propagated for tri state check boxes
    voCheckSupport,         // checkboxes/radio buttons are shown
    voCustomizeItems,       // tree uses application provided font and text info for painting items
    voEditable,             // node labels can be edited
    voExtendedFocus,        // entries other than in the main column can be selected, edited etc.
    voFullRowSelect,        // hit test as well as selection highlight are not constrained to the (main) text of a node
    voGridExtensions,       // use some special enhancements to simulate grid behaviour
    voHotTrack,             // indicate the node where the mouse is currently over
    voInitOnSave,           // nodes which aren't already initialized when saving a tree to a stream will be initialized
                            // on the fly (including their children)
    voLevelSelectConstraint,// constrain selection to the same level as the selection anchor
    voMiddleClickSelect,    // like voRightClickSelect but with the middle mouse button
    voMultiSelect,          // multiselection is enabled
    voRightClickSelect,     // select node on right click
    voShowBackground,       // use the background image if there's one
    voShowButtons,          // display collapse/expand buttons left to a node
    voShowHorzGridLines,    // display horizontal lines to simulate a grid
    voShowRoot,             // show lines also at root level
    voShowTreeLines,        // display tree lines to show hierarchy of nodes
    voShowVertGridLines,    // display vertical lines (depending on columns) to simulate a grid
    voToggleOnDblClick      // when set then nodes are expanded/collapsed when double clicked
  );
  TVirtualTreeOptions = set of TVirtualTreeOption;

  // special options for string trees only 
  TVSTOption = (
    soSaveCaptions,          // if set then the caption is automatically saved with the tree node
                             // Note: If you have a save handler and save a node's caption along with
                             //       your node data then reset this option otherwise the caption gets
                             //       saved twice.
    soShowStaticText         // show static text in caption which can be differently formatted than the caption
                             // but not edited
  );
  TVSTOptions = set of TVSTOption;

  // options per column
  TVTColumnOption = (
    coAllowClick,
    coEnabled,
    coMovable,
    coParentBidiMode,
    coResizable,
    coShowDropMark,
    coVisible
  );
  TVTColumnOptions = set of TVTColumnOption;

  // flags returned by the hit test method
  THitPosition = set of (
    hiAbove,          // above the client area
    hiBelow,          // below the client area
    hiNowhere,        // in the client area, but below the last item
    hiOnItem,         // on the bitmaps/buttons or label associated with an item
    hiOnItemButton,   // on the button associated with an item
    hiOnItemBitmap,   // on the bitmaps associated with an item
    hiOnItemCheckbox, // on the checkbox if enabled
    hiOnItemIndent,   // in the indentation associated with an item
    hiOnItemLabel,    // on the label (text) associated with an item
    hiOnItemRight,    // in the area to the right of an item
    hiOnStateIcon,    // on the state image
    hiToLeft,         // to the left of the client area
    hiToRight         // to the right of the client area
  );

  THitInfo = record
    HitPosition: THitPosition;
    HitColumn: Integer;
  end;

  TCheckType = (
    ctNone,
    ctCheckBox,
    ctTriStateCheckBox,
    ctRadioButton,
    ctButton
  );

  TCheckState = (
    csUnchecked,      // used only for check box and radio button style
    csChecked,        // dito
    csCheckedGrayed,  // dito
    csUnpressed,      // used only for button style
    csPressed         // used only for button style
  );

  TCheckImageKind = (
    ckLightCheck,     // gray cross
    ckDarkCheck,      // black cross
    ckLightTick,      // gray tick mark
    ckDarkTick        // black tick mark
  );

  // mode to describe a move action
  TVTNodeAttachMode = (
    amNowhere,        // just for simplified tests, means to ignore the Add/Insert command
    amInsertBefore,   // insert node just before destination (as sibling of destination)
    amInsertAfter,    // insert node just after destionation (as sibling of destination)
    amAddChildFirst,  // add node as first child of destination
    amAddChildLast    // add node as last child of destination
  );

  // modes to determine drop position further
  TDropMode = (
    dmNowhere,
    dmAbove,
    dmOnNode,
    dmBelow
  );

  TVTImageKind = (
    ikNormal,
    ikSelected,
    ikState,
    ikOverlay
  );

  TVTHintMode = (
    hmDefault,            // show the hint of the control
    hmHint,               // show node specific hint string returned by the application
    hmHintAndDefault,     // same as hmHint but show the control's hint if no node is concerned
    hmTooltip             // show the text of the node if it isn't already fully shown
  );

  // set of formats to use when copying/cutting data to the clipboard or in drag'n drop operations
  TOLEFormats = set of (
    ofNative,
    ofUnicodeText,
    ofText
  );

  TMouseButtons = set of TMouseButton;

  // used to describe the action to do when using the OnBeforeItemErase event
  TItemEraseAction = (
    eaDefault,            // the tree should erase the item's background (bitmap or solid)
    eaNone,               // the item's background does not need to be erased at all
    eaColor               // use the provided color to erase the background instead the one of the tree
  );

const
  DefaultVTOptions = [voAcceptOLEDrop, voAutoDropExpand, voAutoTristateTracking, voInitOnSave, voShowButtons,
    voShowTreeLines, voShowRoot, voToggleOnDblClick];
  DefaultStringOptions = [soSaveCaptions];
  DefaultColumnOptions = [coAllowClick, coEnabled, coMovable, coParentBidiMode, coResizable, coShowDropMark, coVisible];

type
  TBaseVirtualTree = class;

  // used in the CF_VTREFERENCE clipboard format
  PVTReference = ^TVTReference;
  TVTReference = record
    Process: Cardinal;
    Tree: TBaseVirtualTree;
  end;

  PVirtualNode = ^TVirtualNode;
  TVirtualNode = packed record
    Index,                   // index of node with regard to its parent
    ChildCount: Cardinal;    // number of child nodes
    NodeHeight: Word;        // height in pixels
    States: TVirtualNodeStates; // states describing various properties of the node (expanded, initialized etc.)
    Align: Byte;             // line/button alignment
    CheckState: TCheckState;
    CheckType: TCheckType;   // indicates which check type shall be used for this node
    Dummy: Word;             // currently unused, just to fill to DWORD boundary
    TotalCount,              // sum of this node, all of its child nodes and their child nodes etc.
    TotalHeight: Cardinal;   // height in pixels this node covers on screen including the height of all of its
                             // children
    // Note: Some copy routines require that all pointers (as well as the data area) in a node are
    //       located at the end of the node! Hence if you want to add new member fields (except pointers to internal
    //       data) then put them before field Parent.
    Parent,                  // reference to the node's parent (for the root this contains the treeview)
    PrevSibling,             // link to the node's previous sibling or nil if it is the first node
    NextSibling,             // link to the node's next sibling or nil if it is the last node
    FirstChild,              // link to the node's first child...
    LastChild: PVirtualNode; // link to the node's last child...
    Data: record end;        // this is a placeholder, each node gets extra data determined by NodeDataSize
  end;

  TCacheEntry = record
    Node: PVirtualNode;
    AbsoluteTop: Cardinal;
  end;

  TCache = array of TCacheEntry;
  TNodeArray = array of PVirtualNode;

  // auto scroll directions
  TScrollDirection = set of (
    sdLeft,
    sdUp,
    sdRight,
    sdDown
  );

  // OLE drag'n drop support
  TFormatEtcArray = array of TFormatEtc;

  TFormatEtcList = class
  private
    FList: TFormatEtcArray;
    function Get(Index: Integer): TFormatEtc;
    procedure Put(Index: Integer; Item: TFormatEtc);
    function GetCount: Integer;
  public
    function Add(Item: TFormatEtc): Integer;
    procedure Clear;
    procedure Delete(Index: Integer);
    function Clone: TFormatEtcList;

    property Count: Integer read GetCount;
    property Items[Index: Integer]: TFormatEtc read Get write Put;
  end;

  TEnumFormatEtc = class(TInterfacedObject, IEnumFormatEtc)
  protected
    FFormatEtcList: TFormatEtcList;
    FCurrentIndex: Integer;
  public
    constructor Create(FormatEtcList: TFormatEtcList);
    destructor Destroy; override;

    function Next(celt: Integer; out elt; pceltFetched: PLongint): HResult; stdcall;
    function Skip(celt: Integer): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out Enum: IEnumFormatEtc): HResult; stdcall;
  end;

  // Generic drag'n drop handling (derive own classes from this one, add your data to
  // the FormatEtc list and override RenderData to actually give back results).
  //
  // This is an all-in-one class to allow all needed interfaces to access the same data.
  // For some operations this class needs to know when it is released.
  // Therefor the reference counting mechanism has been partially reimplemented.
  TBaseDragDropManager = class(TInterfacedObject, IDataObject, IDropSource, IDropTarget)
  private
    FFormatEtcList: TFormatEtcList;
    FOwner,
    FDragSource: TBaseVirtualTree;

    FMask,
    FImage: TBitmap;
    FMouseSpot: TPoint;
    FInDrag: Boolean;
    FBackOldDC,
    FBackNewDC,
    FWorkDC,
    FCopyDC: HDC;

    FHPicBMP,
    FHMaskBMP,
    FOldWorkBMP,
    FOldCopyBMP,
    FOldBackOldBMP,
    FOldBackNewBMP: HBitmap;

    FOldX,
    FOldY: Integer;    // last mouse position
    FDragHeight,
    FDragWidth: Integer;
    FHidden: Boolean;
  public
    // TObject implementation
    constructor Create(AOwner: TBaseVirtualTree); virtual;
    destructor Destroy; override;

    // IUnknown
    // implement this method to get notified of interface releases (others are implemented in TInterfacedObject)
    function _Release: Integer; stdcall;

    // IDataObject implementation
    function DAdvise(const FormatEtc: TFormatEtc; advf: Integer; const advSink: IAdviseSink; out dwConnection: Integer):
      HResult; stdcall;
    function DUnadvise(dwConnection: Integer): HResult; stdcall;
    function EnumDAdvise(out enumAdvise: IEnumStatData): HResult; stdcall;
    function EnumFormatEtc(Direction: Integer; out EnumFormatEtc: IEnumFormatEtc): HResult; stdcall;
    function GetCanonicalFormatEtc(const FormatEtc: TFormatEtc; out FormatEtcOut: TFormatEtc): HResult; stdcall;
    function GetData(const FormatEtcIn: TFormatEtc; out Medium: TStgMedium): HResult; stdcall;
    function GetDataHere(const FormatEtc: TFormatEtc; out Medium: TStgMedium): HResult; stdcall;
    function QueryGetData(const FormatEtc: TFormatEtc): HResult; stdcall;
    function RenderData(FormatEtc: TFormatEtc; var StgMedium: TStgMedium): HResult; virtual; abstract;
    function SetData(const FormatEtc: TFormatEtc; var Medium: TStgMedium; DoRelease: BOOL): HResult; stdcall;

    // IDropSource implementation
    function GiveFeedback(Effect: Integer): HResult; stdcall;
    function QueryContinueDrag(EscapePressed: BOOL; KeyState: Integer): HResult; stdcall;

    // IDropTarget implementation
    function DragEnter(const DataObject: IDataObject; KeyState: Integer; Pt: TPoint;
      var Effect: Integer): HResult; stdcall;
    function DragOver(KeyState: Integer; Pt: TPoint; var Effect: Integer): HResult; stdcall;
    function DragLeave: HResult; stdcall;
    function Drop(const DataObject: IDataObject; KeyState: Integer; Pt: TPoint; var Effect: Integer): HResult; stdcall;

    // TBaseDropManager implementation
    procedure DragMove(Target: TPoint);
    procedure DragStart(Position, Hotspot: TPoint);
    procedure DragStop;
    function GetDataSourceTree(DataObject: IDataObject): TBaseVirtualTree;
    procedure HideDragImage;
    procedure InvalidateDragImage(R: TRect);
    procedure ShowDragImage;

    property DragSource: TBaseVirtualTree read FDragSource;
  end;

  TVTDragDropManager = class(TBaseDragDropManager)
  public
    function RenderData(FormatEtc: TFormatEtc; var StgMedium: TStgMedium): HResult; override;
    procedure SetOLEFormats(Formats: TOLEFormats);
  end;

  PHintData = ^TVTHintData;
  TVTHintData = record
    Tree: TBaseVirtualTree;
    Node: PVirtualNode;
    Column: Integer;
    HintRect: TRect;         // used for draw trees only, string trees get the size from the hint string
    DefaultHint: WideString; // used only if there is no node specific hint string available
                             // or a header hint is about to appear
    HintText: WideString;    // set when size of the hint window is calculated
  end;

  // determines the kind of animation when a hint is activated
  THintAnimationType = (
    hatNone,                 // no animation at all, just display hint
    hatFade,                 // fade in the hint, just like in Windows 2000
    hatSlide                 // slide in the hint, just like in Windows 98
  );

  // the trees need an own hint window class because of Unicode output and adjusted font
  TVirtualTreeHintWindow = class(THintWindow)
  private
    FHintData: TVTHintData;
    FBackground,
    FDrawBuffer,
    FTarget: TBitmap;
    FCurrentStep: Integer; // alpha in percent
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure ActivateHint(Rect: TRect; const AHint: String); override;
    function CalcHintRect(MaxWidth: Integer; const AHint: String; AData: Pointer): TRect; override;
    function IsHintMsg(var Msg: TMsg): Boolean; override;
  end;

  // tree columns implementation
  TVTHeader = class;

  TVirtualTreeColumnStyle = (
    vsText,
    vsOwnerDraw
  );

  {$ifndef DFS_COMPILER_5_UP}
    TImageIndex = Integer;
  {$endif}

  TVirtualTreeColumn = class(TCollectionItem)
  private
    FText,
    FHint: WideString;
    FWidth: Integer;
    FMinWidth: Integer;
    FMaxWidth: Integer;
    FStyle: TVirtualTreeColumnStyle;
    FImageIndex: TImageIndex;
    FBiDiMode: TBiDiMode;
    FLayout: TButtonLayout;
    FMargin,
    FSpacing: Integer;
    FOptions: TVTColumnOptions;
    function GetLeft: Integer;
    function GetRight: Integer;
    function IsBiDiModeStored: Boolean;
    procedure SetBiDiMode(Value: TBiDiMode);
    procedure SetMaxWidth(Value: Integer);
    procedure SetMinWidth(Value: Integer);
    procedure SetStyle(Value: TVirtualTreeColumnStyle);
    procedure SetText(const Value: WideString);
    procedure SetWidth(Value: Integer);
    procedure SetImageIndex(Value: TImageIndex);
    procedure SetLayout(Value: TButtonLayout);
    procedure SetMargin(Value: Integer);
    procedure SetSpacing(Value: Integer);
    function GetPosition: Cardinal;
    procedure SetOptions(Value: TVTColumnOptions);
    procedure SetPosition(Value: Cardinal);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    function GetDisplayName: String; override;
    procedure ReadHint(Reader: TReader);
    procedure ReadText(Reader: TReader);
    procedure WriteHint(Writer: TWriter);
    procedure WriteText(Writer: TWriter);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;
    function GetRect: TRect;
    procedure LoadFromStream(const Stream: TStream);
    procedure ParentBiDiModeChanged;
    procedure SaveToStream(const Stream: TStream);
    function UseRightToLeftAlignment: Boolean;
    function UseRightToLeftReading: Boolean;

    property Left: Integer read GetLeft;
    property Right: Integer read GetRight;
  published
    property BiDiMode: TBiDiMode read FBiDiMode write SetBiDiMode stored IsBiDiModeStored;
    property Hint: WideString read FHint write FHint stored False;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex;
    property Layout: TButtonLayout read FLayout write SetLayout;
    property Margin: Integer read FMargin write SetMargin default -1;
    property MaxWidth: Integer read FMaxWidth write SetMaxWidth default 10000;
    property MinWidth: Integer read FMinWidth write SetMinWidth default 0;
    property Options: TVTColumnOptions read FOptions write SetOptions default DefaultColumnOptions;
    property Position: Cardinal read GetPosition write SetPosition;
    property Spacing: Integer read FSpacing write SetSpacing default 4;
    property Style: TVirtualTreeColumnStyle read FStyle write SetStyle default vsText;
    property Text: WideString read FText write SetText stored False; // Never let the VCL store the wide string
                                                                     // it just is unable to write it correctly.
                                                                     // We use DefineProperty here.
    property Width: Integer read FWidth write SetWidth;
  end;

  TVirtualTreeColumns = class(TCollection)
  private
    FOwner: TVTHeader;
    FHeaderBitmap: TBitmap;               // backbuffer for drawing
    FHoverIndex,                          // currently "hot" column
    FClickIndex: Integer;                 // currently clicked column
    FColumnPositions: array of Cardinal;

    // drag support
    FBackImage,                           // backup of overwritten screen area
    FAlphaImage,                          // target for alpha blending
    FDragImage: TBitmap;                  // in order to avoid frequent recalculation of the content of the header
                                          // just for a static image
    FImagePosition,                       // position of image (upper left corner) in screen coordinates
    FLastDragPosition: TPoint;            // last mouse position in screen coordinates
    FDragStart: TPoint;                   // used while start dragging (correct initial drag image position)
    FDragIndex: Integer;                  // index of column currently being dragged
    FDropTarget: Integer;                 // current target column (index) while dragging
    FDropBefore: Boolean;                 // True if drop position is in the left half of a column, False for the right
                                          // side to drop the dragged column to
    function GetItem(Index: Integer): TVirtualTreeColumn;
    procedure SetItem(Index: Integer; Value: TVirtualTreeColumn);
    procedure CalcButtonLayout(const Client: TRect; const Offset: TPoint; const Caption: WideString;
      Layout: TButtonLayout; ImageIndex, Margin, Spacing: Integer; var GlyphPos: TPoint; var TextBounds: TRect;
      BiDiFlags: Integer);
    procedure DrawButtonText(Caption: WideString; TextBounds: TRect; Enabled, Hot: Boolean; Flags: Integer);
  protected
    procedure AdjustAutoSize;
    function AdjustClickColumn(P: TPoint): Boolean;
    function AdjustHoverColumn(P: TPoint): Boolean;
    procedure AdjustPosition(Column: TVirtualTreeColumn; Position: Cardinal);
    function ColumnFromPosition(P: TPoint): Integer;
    procedure DragTo(P: TPoint);
    procedure EndDrag;
    function GetColumnAndBounds(P: TPoint; var Left, Right: Integer): Integer;
    procedure GetColumnBounds(Column: Integer; var Left, Right: Integer);
    function GetOwner: TPersistent; override;
    function GetFirstVisibleColumn: Integer;
    function GetNextColumn(Column: Integer): Integer;
    function GetNextVisibleColumn(Column: Integer): Integer;
    function GetPreviousColumn(Column: Integer): Integer;
    function GetPreviousVisibleColumn(Column: Integer): Integer;
    procedure HandleClick(P: TPoint);
    procedure PaintHeader(DC: HDC; R: TRect; HOffset: Integer);
    procedure PrepareDrag(P, Start: TPoint);
    procedure Update(Item: TCollectionItem); override;
    procedure ValidatePositions;
  public
    constructor Create(AOwner: TVTHeader);
    destructor Destroy; override;

    function Add: TVirtualTreeColumn;
    procedure Assign(Source: TPersistent); override;
    procedure LoadFromStream(const Stream: TStream);
    procedure SaveToStream(const Stream: TStream);
    function TotalWidth: Integer;

    property Items[Index: Integer]: TVirtualTreeColumn read GetItem write SetItem; default;
  end;

  TVTHeaderStyle = (
    hsThickButtons,    // TButton look and feel
    hsFlatButtons,     // flatter look than hsThickButton, like an always raised flat TToolButton
    hsPlates           // flat TToolButton look and feel (raise on hover etc.)
  );

  TVTHeaderOption = (
    hoAutoResize,      // adjust a column so that the header never exceeds client width of owner control
    hoColumnResize,    // resizing columns is allowed
    hoDrag,            // dragging columns is allowed
    hoHotTrack,        // header captions are highlighted when mouse is over a particular column
    hoOwnerDraw,       // header items with the owner draw style can be drawn by the application via event
    hoRestrictDrag,    // header can only be dragged horizontally
    hoShowHint,        // show application defined header hint
    hoShowImages,      // show images
    hoVisible          // header is visible
  );
  TVTHeaderOptions = set of TVTHeaderOption;

  THeaderState = (
    hsTracking,        // column resizing is in progress
    hsDragging,        // header dragging is in progress (only if enabled)
    hsDragPending      // left button is down, user might want to start dragging a column
  );
  THeaderStates = set of THeaderState;

  TVTHeader = class(TPersistent)
  private
    FOwner: TBaseVirtualTree;
    FColumns: TVirtualTreeColumns;
    FHeight: Cardinal;
    FFont: TFont;
    FOptions: TVTHeaderOptions;
    FStates: THeaderStates;                      // used to keep track of internal states the header can enter
    FTrackIndex: Integer;                        // index of column which is currently resized
    FLeftTrackPos: Integer;                      // left border of this column to quickly calculate its width on resize
    FStyle: TVTHeaderStyle;                      // button style
    FBackground: TColor;
    FAutoSizeIndex: Integer;
    FPopupMenu: TPopupMenu;
    function DetermineSplitterIndex(P: TPoint): Boolean;
    procedure FontChanged(Sender: TObject);
    function GetMainColumn: Integer;
    function GetUseColumns: Boolean;
    procedure SetBackground(Value: TColor);
    procedure SetColumns(Value: TVirtualTreeColumns);
    procedure SetFont(const Value: TFont);
    procedure SetHeight(Value: Cardinal);
    procedure SetStyle(Value: TVTHeaderStyle);
    procedure SetAutoSizeIndex(Value: Integer);
    procedure SetOptions(Value: TVTHeaderOptions);
  protected
    function GetOwner: TPersistent; override;
    function HandleMessage(var Message: TMessage): Boolean;
    procedure Invalidate(Column: TVirtualTreeColumn);
    procedure RecalculateHeader;
  public
    constructor Create(AOwner: TBaseVirtualTree); virtual;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;
    function InHeader(P: TPoint): Boolean;
    procedure LoadFromStream(const Stream: TStream);
    procedure SaveToStream(const Stream: TStream);

    property MainColumn: Integer read GetMainColumn;
    property States: THeaderStates read FStates;
    property UseColumns: Boolean read GetUseColumns;
  published
    property AutoSizeIndex: Integer read FAutoSizeIndex write SetAutoSizeIndex;
    property Background: TColor read FBackground write SetBackground default clBtnFace;
    property Columns: TVirtualTreeColumns read FColumns write SetColumns;
    property Font: TFont read FFont write SetFont;
    property Height: Cardinal read FHeight write SetHeight default 24;
    property Options: TVTHeaderOptions read FOptions write SetOptions default [hoColumnResize, hoDrag];
    property PopupMenu: TPopupMenu read FPopupMenu write FPopUpMenu;
    property Style: TVTHeaderStyle read FStyle write SetStyle;
  end;

  // communication interface between a tree editor and the tree itself (declared it using stdcall in case it
  // is implemented in a (C/C++) DLL)
  IVTEditLink = interface
    function BeginEdit: Boolean; stdcall;                  // called when editing actually starts
    procedure CancelEdit; stdcall;                         // called when editing has been cancelled by the tree
    function CanStop: Boolean; stdcall;                    // called when the tree is about to cancel or end editing
    procedure EndEdit; stdcall;                            // called when editing has been finished by the tree
    function PrepareEdit(Tree: TBaseVirtualTree; Node: PVirtualNode; Column: Integer): Boolean; stdcall;
                                                           // called after creation to allow a setup
    function GetBounds: TRect; stdcall;                    // called to get the current size of the edit window
                                                           // (only important if the edit resizes itself)
    procedure SetBounds(R: TRect); stdcall;                // called to place the editor
  end;

  // node enumeration
  TVTGetNodeProc = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode; Data: Pointer; var Abort: Boolean) of object;

  // node events
  TVTChangingEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode; var Allowed: Boolean) of object;
  TVTCheckChangingEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode; var NewState: TCheckState;
    var Allowed: Boolean) of object;
  TVTChangeEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode) of object;
  TVTEditCancelEvent = procedure(Sender: TBaseVirtualTree; Column: Integer) of object;
  TVTEditChangingEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: Integer;
    var Allowed: Boolean) of object;
  TVTEditChangeEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: Integer) of object;
  TVTFreeNodeEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode) of object;
  TVTFocusChangingEvent = procedure(Sender: TBaseVirtualTree; OldNode, NewNode: PVirtualNode; OldColumn,
    NewColumn: Integer; var Allowed: Boolean) of object;
  TVTFocusChangeEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: Integer) of object;
  TVTGetImageEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: Integer;
    var Index: Integer) of object;
  TVTHotNodeChangeEvent = procedure(Sender: TBaseVirtualTree; OldNode, NewNode: PVirtualNode) of object;
  TVTInitChildrenEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode; var ChildCount: Cardinal) of object;
  TVTInitNodeEvent = procedure(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
    var InitialStates: TVirtualNodeInitStates) of object;
  TVTPopupEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: Integer; var AskParent: Boolean;
    var PopupMenu: TPopupMenu) of object;
  TVTHelpContextEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: Integer;
    var HelpContext: Integer) of object;
  TVTCreateEditorEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: Integer;
    out EditLink: IVTEditLink) of object;
  TVTSaveNodeEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode; Stream: TStream) of object;

  // header/column events
  TVTHeaderClickEvent = procedure(Sender: TBaseVirtualTree; Column: Integer) of object;
  TVTHeaderDraggedEvent = procedure(Sender: TBaseVirtualTree; Column: Integer) of object;
  TVTHeaderDraggingEvent = procedure(Sender: TBaseVirtualTree; Column: Integer; var Allowed: Boolean) of object;
  TVTHeaderPaintEvent = procedure(Sender: TVTHeader; Canvas: TCanvas; Column: TVirtualTreeColumn; R: TRect; Hover,
    Pressed: Boolean) of object;
  TVTResizeColumnEvent = procedure(Sender: TBaseVirtualTree; Column: Integer) of object;

  // move and copy events
  TVTNodeMovedEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode) of object;
  TVTNodeMovingEvent = procedure(Sender: TBaseVirtualTree; Node, NewParent: PVirtualNode;
    var Allowed: Boolean) of object;
  TVTNodeCopiedEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode) of object;
  TVTNodeCopyingEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode;
    var Allowed: Boolean) of object;

  // drag'n drop events
  TVTDragOverEvent = procedure(Sender: TBaseVirtualTree; Source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint;
    Mode: TDropMode; var Effect: Integer; var Accept: Boolean) of object;
  TVTDragDropEvent = procedure(Sender: TBaseVirtualTree; Source: TObject; DataObject: IDataObject;
    const Formats: array of Word; Shift: TShiftState; Pt: TPoint; var Effect: Integer; Mode: TDropMode) of object;

  // paint events
  TVTBeforeItemEraseEvent = procedure(Sender: TBaseVirtualTree; Canvas: TCanvas; Node: PVirtualNode; ItemRect: TRect;
    var Color: TColor; var EraseAction: TItemEraseAction) of object;
  TVTAfterItemEraseEvent = procedure(Sender: TBaseVirtualTree; Canvas: TCanvas; Node: PVirtualNode;
    ItemRect: TRect) of object;
  TVTBeforeItemPaintEvent = procedure(Sender: TBaseVirtualTree; Canvas: TCanvas; Node: PVirtualNode; ItemRect: TRect;
    var CustomDraw: Boolean) of object;
  TVTAfterItemPaintEvent = procedure(Sender: TBaseVirtualTree; Canvas: TCanvas; Node: PVirtualNode;
    ItemRect: TRect) of object;
  TVTPaintEvent = procedure(Sender: TBaseVirtualTree; Canvas: TCanvas) of object;

  // search 
  TVTCompareFunction = function(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: Integer): Integer of object;

  // miscellaneous
  TVTGetNodeDataSizeEvent = procedure(Sender: TBaseVirtualTree; var NodeDataSize: Integer) of object;

  // various events must be handled at different places than they were initiated or need
  // a persistent storage until they are reset
  TVirtualTreeStates = set of (
    tsChangePending,  // a change is pending
    tsCollapsing,     // a full collapse operation is in progress
    tsClearPending,   // need to clear the current selection on next mouse move
    tsClipboardCancelling, // set during cancelling a clipboard operation
    tsClipboardOperation, // set during paste from clipboard
    tsCopyPending,    // indicates a pending copy operation which needs to be finished
    tsCutPending,     // indicates a pending cut operation which needs to be finished
    tsDragPending,    // user has requested to start delayed dragging
    tsDragging,       // dragging in progress
    tsDrawSelPending, // multiselection only, user held down the left mouse button on a free
                      // area and might want to start draw selection
    tsDrawSelecting,  // multiselection only, draw selection has actually started
    tsEditing,        // indicates that an edit operation is currently in progress
    tsEditPending,    // on mouse up start edit if dragging has not started
    tsExpanding,      // a full expand operation is in progress
    tsHintCancelling, // set when a node is about to be deleted to avoid showing a pending hint for it
    tsHintShown,      // indicates that a hint/tooltip (header or node) has been shown at least once (needed for
                      // workaround of a bug/gotcha in the VCL)
    tsScrolling,      // set when autoscrolling is active
    tsScrollPending,  // set when waiting for the scroll delay time to elapse
    tsSizing,         // set when the tree window is being resized and is used to prevent recursive calls
                      // due to setting the scrollbars when sizing
    tsStopValidation, // cache validation can be stopped (usually because a change has occured meanwhile)
    tsStructureChangePending, // the structure of the tree has been changed while the update was locked
    tsThumbTracking,  // stop updating the horizontal scroll bar
    tsUpdating,       // the tree does currently not update its window because a BeginUpdate has not yet ended
    tsValidating      // the tree's node caches are currently validated
  );

  // determines whether and how the drag image is to show
  TVTDragImageKind = (
    diComplete,       // show a complete drag image with all columns, only visible columns are shown
    diMainColumnOnly, // show only the main column (the tree column)
    diNoImage         // don't show a drag image at all
  );

  // put ScrollBars, ScrollbarStyle and AlwaysVisible into one property
  TScrollBarOptions = class(TPersistent)
  private
    FAlwaysVisible: Boolean;
    FOwner: TBaseVirtualTree;
    FScrollBars: TScrollBars;                    // used to hide or show vertical and/or horizontal scrollbar
    FScrollBarStyle: TScrollBarStyle;            // kind of scrollbars to use
    procedure SetAlwaysVisible(Value: Boolean);
    procedure SetScrollBars(Value: TScrollBars);
    procedure SetScrollBarStyle(Value: TScrollBarStyle);
  protected
    function  GetOwner: TPersistent; override;
  public
    constructor Create(AOwner: TBaseVirtualTree);
  published
    property AlwaysVisible: Boolean read FAlwaysVisible write SetAlwaysVisible default False;
    property ScrollBars: TScrollBars read FScrollbars write SetScrollBars default ssBoth;
    property ScrollBarStyle: TScrollBarStyle read FScrollBarStyle write SetScrollBarStyle default sbmRegular;
  end;

  // ----- TBaseVirtualTree
  TBaseVirtualTree = class(TCustomControl)
  private
    FBorderStyle: TBorderStyle;
    FHeader: TVTHeader;
    FRoot: PVirtualNode;
    FDefaultNodeHeight,
    FIndent: Cardinal;
    FOptions: TVirtualTreeOptions;
    FPlusBM,
    FMinusBM: TBitmap;                           // small bitmaps used for buttons
    FLastNodeTop: Integer;                       // set by GetNodeAt, this is the top position (in client coordinates)
                                                 // of the top node
    FUpdateCount: Cardinal;                      // update stopper, painting of window is only done if = 0
    FNodeDataSize: Integer;                      // number of bytes to allocate with each node (in addition to its base
                                                 // structure and the internal data), if -1 then do callback
    FStates: TVirtualTreeStates;                 // various active/pending states the tree needs to consider
    FLastSelected,
    FFocusedNode: PVirtualNode;
    FEditColumn,                                 // column to be edited (focused node)
    FFocusedColumn: Integer;                     // -1 if no columns are active otherwise the last hit column of the
                                                 // currently focused node
    FDragImageKind: TVTDragImageKind;            // determines whether or not and what to show in the drag image
    FImages,
    FStateImages: TImageList;
    FOffScreenBitmap: TBitmap;                   // backbuffer for drawing
    FScrollDirection: TScrollDirection;          // used for auto scrolling
    FDragThreshold: Integer;                     // used to determine when to actually start a drag'n drop operation
    FDragStartPos: TPoint;                       // used for retained drag start
    FDragManager: TVTDragDropManager;            // drag'n drop, cut'n paste
    FLastChangedNode,                            // used for delayed changed event
    FCurrentHotNode,                             // node over which the mouse is hovering
    FLastVCLDragTarget,                          // just a cache for VCL drag'n drop (keyword: DragLeave on DragDrop)
    FCurrentTargetNode: PVirtualNode;            // node currently selected as drop target
    FLastDropMode: TDropMode;                    // set while dragging and used to track changes
    FDropMarkColor: TColor;                      // color of the drop mark line
    FLastSelRect,
    FNewSelRect: TRect;                          // used while doing draw selection
    FCheckImageKind: TCheckImageKind;            // light or dark, cross marks or tick marks
    FCheckImages: TImageList;                    // reference to global image list to be used for the check images
    FImageChangeLink,
    FStateChangeLink: TChangeLink;               // connections to the image lists
    FHotCursor: TCursor;                         // can be set to additionally indicate the current hot node
    FAnimationType: THintAnimationType;          // none, fade in, slide in animation (just like those animations used
                                                 // in Win98 (slide) and Windows 2000 (fade))
    FHintMode: TVTHintMode;                      // determines the kind of the hint window 
    FHintData: TVTHintData;                      // used while preparing the hint window
    FChangeDelay: Integer;                       // use to delay OnChange event
    FUpdateRect: TRect;                          // contains the clipping rectangle for one paint cycle
    FPositionCache,                              // array which stores node references ordered by vertical positions
                                                 // (see also DoValidateCaches for more information)
    FNodeCache: TCache;                          // same as FPositionCache, but ordered by node references
    FVisibleCount: Cardinal;                     // number of currently visible nodes
    FStartIndex: Cardinal;                       // index to start validating cache from
    FLastCacheHit: Integer;                      // index into FPositionCache set by cache scanning functions
    FSelection,                                  // list of currently selected nodes
    FDragSelection: TNodeArray;                  // temporary copy of FSelection used during drag'n drop
    FSelectionCount: Integer;                    // number of currently selected nodes (size of FSelection might differ)
    FRangeAnchor: PVirtualNode;                  // anchor node for selection with the keyboard, determines start of a
                                                 // selection range
    FCheckNode: PVirtualNode;                    // node which "captures" an check event
    FLastSelectionLevel: Integer;                // keeps the last node level for constrained multiselection
    FDrawSelShiftState: TShiftState;             // keeps the initial shift state when the user starts selection with
                                                 // the mouse
    FEditLink: IVTEditLink;                      // used to comunicate with an application defined editor
    FTempNodeCache: TNodeArray;                  // used at various places to hold temporarily a bunch of node refs.
    FTempNodeCount: Cardinal;                    // number of nodes in FTempNodeCache
    FOLEFormats: TOLEFormats;                    // determines the formats which are provided in OLE operations
                                                 // (drag'n drop, cut'n paste etc.)
    FBackground: TPicture;                       // a background image loadable at design time
    FMargin: Integer;                            // horizontal alignment within a column
    FHDotLine,
    FVDotLine: TBitmap;                          // small bitmaps to aid drawing dotted grid lines

    // scroll support
    FScrollBarOptions: TScrollBarOptions;        // common properties of horizontal and vertical scrollbar 
    FAutoScrollInterval: TAutoScrollInterval;    // determines speed of auto scrolling
    FAutoScrollDelay: Cardinal;                  // amount of milliseconds to wait until autoscrolling becomes active
    FOffsetX,                                    // determines left and top scroll offset 
    FOffsetY,
    FIncrementX,                                 // used to know how much units to scroll in one step
    FIncrementY: Integer;
    FRangeX,                                     // current virtual width and height of the tree
    FRangeY: Cardinal;

    FGridLineColor,
    FTreeLineColor: TColor;                      // in order to customize grid and tree lines
    FDefaultPasteMode: TVTNodeAttachMode;        // used to determine where to add pasted nodes to
    FSingletonNodeArray: TNodeArray;             // contains only one element for quick addition of single nodes
                                                 // to the selection

    // common events
    FOnChange,                                   // selection change
    FOnStructureChange: TVTChangeEvent;          // structural change like adding nodes etc.
    FOnInitChildren: TVTInitChildrenEvent;       // called when a node's children are needed (expanding etc.)
    FOnInitNode: TVTInitNodeEvent;               // called when a node needs to be initialized (child count etc.)
    FOnFreeNode: TVTFreeNodeEvent;               // called when a node is about to be destroyed, user data can and should
                                                 // be freed in this event
    FOnGetImage: TVTGetImageEvent;               // used to retrieve the image index of a given node
    FOnHotChange: TVTHotNodeChangeEvent;         // called when the current "hot" node (that is, the node under the mouse)
                                                 // changes and hot tracking is enabled
    FOnExpanding,                                // called just before a node is expanded
    FOnCollapsing: TVTChangingEvent;             // called just before a node is collapsed
    FOnChecking: TVTCheckChangingEvent;          // called just before a node's check state is changed
    FOnExpanded,                                 // called after a node has been expanded
    FOnCollapsed,                                // called after a node has been collapsed
    FOnChecked: TVTChangeEvent;                  // called after a node's check state has been changed
    FOnResetNode: TVTChangeEvent;                // called when a node is set to be uninitialized
    FOnNodeMoving: TVTNodeMovingEvent;           // called just before a node is moved from one parent node to another
                                                 // (this can be cancelled)
    FOnNodeMoved: TVTNodeMovedEvent;             // called after a node and its children have been moved to another
                                                 // parent node (probably another tree, but within the same application)
    FOnNodeCopying: TVTNodeCopyingEvent;         // called when an node is copied to another parent node (probably in
                                                 // another tree, but within the same application, can be cancelled)
    FOnNodeCopied: TVTNodeCopiedEvent;           // call after a node has been copied
    FOnHeaderClick: TVTHeaderClickEvent;         // called when the header is clicked
    FOnEditing: TVTEditChangingEvent;            // called just before a node goes into edit mode
    FOnEditCancelled: TVTEditCancelEvent;        // called when editing has been cancelled
    FOnEdited: TVTEditChangeEvent;               // called when editing has successfully been finished
    FOnFocusChanging: TVTFocusChangingEvent;     // called when the focus is about to go to a new node and/or column
                                                 // (can be cancelled)
    FOnFocusChanged: TVTFocusChangeEvent;        // called when the focus goes to a new node and/or column
    FOnGetPopupMenu: TVTPopupEvent;              // called when the popup for a node needs to be shown
    FOnGetHelpContext: TVTHelpContextEvent;      // called when a node specific help theme should be called
    FOnCreateEditor: TVTCreateEditorEvent;       // called when a node goes into edit mode, this allows applications
                                                 // to supply their own editor
    FOnLoadNode,                                 // called after a node has been loaded from a stream (file, clipboard,
                                                 // OLE drag'n drop) to allow an application to load their own data
                                                 // saved in OnSaveNode
    FOnSaveNode: TVTSaveNodeEvent;               // called when a node needs to be serialized into a stream
                                                 // (see OnLoadNode) to give the application the opportunity to save
                                                 // their node specific, persistent data (note: don't save memory
                                                 // references unless you know that they will only be used in the
                                                 // currently running instance of the application)
    // paint events
    FOnAfterPaint,                               // triggered when the tree has entirly been painted
    FOnBeforePaint: TVTPaintEvent;               // triggered when the tree is about to be painted
    FOnAfterItemPaint: TVTAfterItemPaintEvent;   // triggered after an item has been painted
    FOnBeforeItemPaint: TVTBeforeItemPaintEvent; // triggered when an item is about to be painted
    FOnBeforeItemErase: TVTBeforeItemEraseEvent; // triggered when an item's background is about to be erased
    FOnAfterItemErase: TVTAfterItemEraseEvent;   // triggered after an item's background has been erased
    FOnDrawHeader: TVTHeaderPaintEvent;          // used when owner draw is enabled for the header and a column is set
                                                 // to owner draw mode

    // drag'n drop events
    FOnDragOver: TVTDragOverEvent;               // OLE drag'n drop
    FOnDragDrop: TVTDragDropEvent;               // OLE drag'n drop
    FOnHeaderDragged: TVTHeaderDraggedEvent;     // header (column) drag'n drop
    FOnHeaderDragging: TVTHeaderDraggingEvent;   // header (column) drag'n drop

    // miscellanous events
    FOnGetNodeDataSize: TVTGetNodeDataSizeEvent;
    FOnColumnResize: TVTResizeColumnEvent;
    procedure AdjustTotalCount(Node: PVirtualNode; Value: Integer; relative: Boolean = False);
    procedure AdjustTotalHeight(Node: PVirtualNode; Value: Integer; relative: Boolean = False);
    function CalculateCacheEntryCount: Integer;
    function CompareNodePositions(Node1, Node2: PVirtualNode): Integer;
    procedure DrawLineImage(Target: TCanvas; X, Y, dY, VAlign, Style: Integer);
    procedure InitRoot;
    procedure TileBackground(Source: TBitmap; Target: TCanvas; R: TRect);
    procedure PrepareBitmaps;
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetHeader(const Value: TVTHeader);
    procedure SetItemHeight(Value: Cardinal);
    procedure SetRootNodeCount(Value: Cardinal);
    procedure SetIndent(Value: Cardinal);
    procedure SetOptions(Value: TVirtualTreeOptions);
    procedure SetImages(const Value: TImageList);
    procedure SetFocusedNode(Value: PVirtualNode);
    procedure SortNodeCache(L, R: Integer);
    function FindInNodeCache(Node: PVirtualNode; var Index: Integer): Boolean;
    procedure SetUpdateState(Updating: Boolean);
    function MakeNewNode: PVirtualNode;
    function GetChildCount(Node: PVirtualNode): Cardinal;
    function GetChildrenInitialized(Node: PVirtualNode): Boolean;
    function GetDisabled(Node: PVirtualNode): Boolean;
    function GetHasChildren(Node: PVirtualNode): Boolean;
    function GetTotalCount: Cardinal;
    function GetRootNodeCount: Cardinal;
    function GetAlignment(Node: PVirtualNode): Byte;
    procedure SetAlignment(Node: PVirtualNode; Value: Byte);
    function GetSelected(Node: PVirtualNode): Boolean;
    procedure SetSelected(Node: PVirtualNode; Value: Boolean);
    function GetVisible(Node: PVirtualNode): Boolean;
    procedure SetVisible(Node: PVirtualNode; Value: Boolean);
    function GetExpanded(Node: PVirtualNode): Boolean;
    procedure SetExpanded(Node: PVirtualNode; Value: Boolean);
    function GetNodeHeight(Node: PVirtualNode): Cardinal;
    function GetDragging: Boolean;
    function GetCheckState(Node: PVirtualNode): TCheckState;
    function GetCheckType(Node: PVirtualNode): TCheckType;
    function GetTopNode: PVirtualNode;
    procedure HandleClickSelection(LastFocused, NewNode: PVirtualNode; Shift: TShiftState);
    procedure InternalConnectNode(Node, Destination: PVirtualNode; Target: TBaseVirtualTree; Mode: TVTNodeAttachMode);
    procedure InternalDisconnectNode(Node: PVirtualNode);
    function HandleDrawSelection(X, Y: Integer): Boolean;
    function PackArray(TheArray: TNodeArray; Count: Integer): Integer;
    procedure InterruptValidation;
    procedure ImageListChange(Sender: TObject);
    procedure SetBackground(const Value: TPicture);
    procedure SetCheckImageKind(Value: TCheckImageKind);
    procedure SetCheckState(Node: PVirtualNode; Value: TCheckState);
    procedure SetCheckType(Node: PVirtualNode; Value: TCheckType);
    procedure SetChildCount(Node: PVirtualNode; NewChildCount: Cardinal);
    procedure SetDisabled(Node: PVirtualNode; Value: Boolean);
    procedure SetFocusedColumn(Value: Integer);
    procedure SetNodeDataSize(Value: Integer);
    procedure SetHasChildren(Node: PVirtualNode; Value: Boolean);
    procedure SetLineColor(Index: Integer; Value: TColor);
    procedure SetMargin(Value: Integer);
    procedure SetNodeHeight(Node: PVirtualNode; Value: Cardinal);
    procedure SetOffsetX(Value: Integer);
    procedure SetOffsetY(Value: Integer);
    procedure SetOLEFormats(Value: TOLEFormats);
    procedure SetScrollBarOptions(Value: TScrollBarOptions);
    procedure SetStateImages(const Value: TImageList);
    procedure SetTopNode(Node: PVirtualNode);
    procedure StopTimer(ID: Integer);
    procedure OriginalWMNCPaint(DC: HDC);

    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMDrag(var Message: TCMDrag); message CM_DRAG;
    procedure CMHintShow(var Message: TCMHintShow); message CM_HINTSHOW;
    procedure CMHintShowPause(var Message: TCMHintShowPause); message CM_HINTSHOWPAUSE;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMMouseWheel(var Message: TCMMouseWheel); message CM_MOUSEWHEEL;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure WMChar(var Message: TWMChar); message WM_CHAR;
    procedure WMCut(var Message: TWMCut); message WM_CUT;
    procedure WMCopy(var Message: TWMCopy); message WM_COPY;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMHScroll(var Message: TWMVScroll); message WM_HSCROLL;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure WMKeyUp(var Message: TWMKeyUp); message WM_KEYUP;
    procedure WMKillFocus(var Msg: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMMButtonDown(var Message: TWMMButtonDown); message WM_MBUTTONDOWN;
    procedure WMMButtonUp(var Message: TWMMButtonUp); message WM_MBUTTONUP;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCDestroy(var Message: TWMNCDestroy); message WM_NCDESTROY;
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCPaint(var Message: TRealWMNCPaint); message WM_NCPAINT;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure WMPaste(var Message: TWMPaste); message WM_PASTE;
    procedure WMRButtonDown(var Message: TWMRButtonDown); message WM_RBUTTONDOWN;
    procedure WMRButtonUp(var Message: TWMRButtonUp); message WM_RBUTTONUP;
    procedure WMReleaseEditLink(var Message: TMessage); message WM_RELEASEEDITLINK;
    procedure WMSetCursor(var Message: TWMSetCursor); message WM_SETCURSOR;
    procedure WMSetFocus(var Msg: TWMSetFocus); message WM_SETFOCUS;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMTimer(var Message: TWMTimer); message WM_TIMER;
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
  protected
    // Variables used internally by all trees which can directly be modified to satisfy special needs.
    // These variables should only be set once during the lifetime of an instance!
    InternalDataSize: Cardinal; // each tree class should set this value in its constructor to indicate the amount
                                // of extra memory to add to each tree node (make sure it is enough to serve the needs
                                // for all ancestor classes as well as the derived class in question)

    procedure AddToSelection(Node: PVirtualNode); overload;
    procedure AddToSelection(const NewItems: TNodeArray; NewLength: Integer; ForceInsert: Boolean = False); overload;
    procedure AdjustPaintCellRect(Node: PVirtualNode; ColumnPosition: Integer; var NextNonEmpty: Integer;
      var ClipRect: TRect); virtual;
    function CalculateSelectionRect(X, Y: Integer): Boolean;
    function CanEdit(Node: PVirtualNode): Boolean;
    procedure Change(Node: PVirtualNode); virtual;
    procedure CheckParentCheckState(Node: PVirtualNode);
    procedure ClearTempCache;
    function ColumnIsEmpty(Node: PVirtualNode; Column: Integer): Boolean; virtual;
    function CountVisibleChildren(Node: PVirtualNode): Cardinal;
    function CreateEditor(Node: PVirtualNode; Column: Integer): IVTEditLink; virtual;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DoAfterItemErase(Canvas: TCanvas; Node: PVirtualNode; ItemRect: TRect); virtual;
    procedure DoAfterItemPaint(Canvas: TCanvas; Node: PVirtualNode; ItemRect: TRect); virtual;
    procedure DoAfterPaint(Canvas: TCanvas); virtual;
    procedure DoAutoScroll(X, Y: Integer); virtual;
    procedure DoCancelEdit; virtual;
    procedure DoBeforeItemErase(Canvas: TCanvas; Node: PVirtualNode; ItemRect: TRect; var Color: TColor;
      var EraseAction: TItemEraseAction); virtual;
    function DoBeforeItemPaint(Canvas: TCanvas; Node: PVirtualNode; ItemRect: TRect): Boolean; virtual;
    procedure DoBeforePaint(Canvas: TCanvas); virtual;
    procedure DoChange(Node: PVirtualNode); virtual;
    procedure DoCheckClick(Node: PVirtualNode);
    function DoChecking(Node: PVirtualNode; var NewState: TCheckState): Boolean; virtual;
    procedure DoChecked(Node: PVirtualNode); virtual;
    function DoCollapsing(Node: PVirtualNode): Boolean; virtual;
    procedure DoCollapsed(Node: PVirtualNode); virtual;
    procedure DoColumnResize(Column: Integer); virtual;
    function DoDragEnter(const DataObject: IDataObject; KeyState: Integer; Pt: TPoint;
      var Effect: Integer): HResult; virtual;
    procedure DoDragging(P: TPoint);
    function DoDragOver(Source: TObject; KeyState: Integer; DragState: TDragState; Pt: TPoint;
      var Effect: Integer): HResult; virtual;
    procedure DoDragLeave; virtual;
    function DoDragDrop(const DataObject: IDataObject; KeyState: Integer; Pt: TPoint;
      var Effect: Integer): HResult; virtual;
    procedure DoDragExpand;
    procedure DoDrawHeader(Canvas: TCanvas; Column: TVirtualTreeColumn; R: TRect; Hover, Pressed: Boolean); virtual;
    procedure DoEdit; virtual;
    procedure DoEndEdit; virtual;
    function DoExpanding(Node: PVirtualNode): Boolean; virtual;
    procedure DoExpanded(Node: PVirtualNode); virtual;
    function DoFocusChanging(OldNode, NewNode: PVirtualNode; OldColumn, NewColumn: Integer): Boolean; virtual;
    procedure DoFocusChange(Node: PVirtualNode; Column: Integer); virtual;
    procedure DoFreeNode(Node: PVirtualNode); virtual;
    function DoGetImageIndex(Node: PVirtualNode; Kind: TVTImageKind; Column: Integer): Integer; virtual;
    function DoGetNodeHint(Node: PVirtualNode; Column: Integer): WideString; virtual;
    function DoGetNodeTooltip(Node: PVirtualNode; Column: Integer): WideString; virtual;
    function DoGetNodeWidth(Node: PVirtualNode; Column: Integer): Integer; virtual;
    procedure DoHeaderClick(Column: Integer); virtual;
    procedure DoHeaderDragged(Column: Integer); virtual;
    function DoHeaderDragging(Column: Integer): Boolean; virtual;
    procedure DoHotChange(Old, New: PVirtualNode); virtual;
    procedure DoInitChildren(Node: PVirtualNode; var ChildCount: Cardinal); virtual;
    procedure DoInitNode(Parent, Node: PVirtualNode; var InitStates: TVirtualNodeInitStates); virtual;
    procedure DoLoadUserData(Node: PVirtualNode; Stream: TStream); virtual;
    procedure DoNodeCopied(Node: PVirtualNode); virtual;
    function DoNodeCopying(Node: PVirtualNode): Boolean; virtual;
    procedure DoNodeMoved(Node: PVirtualNode); virtual;
    function DoNodeMoving(Node, NewParent: PVirtualNode): Boolean; virtual;
    procedure DoPaintDropMark(Canvas: TCanvas; Node: PVirtualNode; R: TRect); virtual;
    procedure DoPaintNode(Canvas: TCanvas; Node: PVirtualNode; ClippingRect, NodeRect: TRect;
      Column, ColumnIndex: Integer); virtual;
    procedure DoReset(Node: PVirtualNode); virtual;
    procedure DoSaveUserData(Node: PVirtualNode; Stream: TStream); virtual;
    procedure DoStructureChange(Node: PVirtualNode); virtual;
    procedure DoTimerScroll;
    procedure DoValidateCaches;
    procedure DrawDottedHLine(Canvas: TCanvas; X, Y, W: Integer);
    procedure DrawDottedVLine(Canvas: TCanvas; X, Y, H: Integer);
    function FindNodeInSelection(P: PVirtualNode; var Index: Integer): Boolean; overload;
    function FindNodeInSelection(P: PVirtualNode; var Index: Integer; LowBound, HighBound: Integer): Boolean; overload;
    procedure FinishChunkHeader(Stream: TStream; StartPos, EndPos: Integer);
    function GetCheckImage(Node: PVirtualNode): Integer; virtual;
    function GetHeaderRect: TRect;
    function GetMaxRightExtend: Cardinal;
    procedure GetTextInfo(Node: PVirtualNode; Column: Integer; const AFont: TFont; var R: TRect;
      var Text: WideString); virtual;
    procedure HandleHotTrack(X, Y: Integer);
    procedure HandleMouseDown(var Message: TWMMouse);
    procedure HandleMouseUp(var Message: TWMMouse);
    procedure InitChildren(Node: PVirtualNode);
    procedure InitNode(Node: PVirtualNode);
    procedure InternalAddFromStream(Stream: TStream; Node: PVirtualNode);
    procedure InternalAddToSelection(Node: PVirtualNode; ForceInsert: Boolean); overload;
    procedure InternalAddToSelection(const NewItems: TNodeArray; NewLength: Integer; ForceInsert: Boolean); overload;
    procedure InternallyCacheNode(Node: PVirtualNode);
    procedure InternalClearSelection;
    procedure InternalRemoveFromSelection(Node: PVirtualNode);
    procedure InvalidateCache;
    procedure MarkCutCopyNodes;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Paint; override;
    function ReadChunk(Stream: TStream; Node: PVirtualNode; ChunkType, ChunkSize: Integer): Boolean; virtual;
    procedure ReadNode(Stream: TStream; Node: PVirtualNode); virtual;
    procedure RemoveFromSelection(Node: PVirtualNode);
    procedure SelectNodes(StartNode, EndNode: PVirtualNode; AddOnly: Boolean);
    procedure SkipNode(Stream: TStream); virtual;
    procedure SortSelection;
    function SuggestDropEffect(Source: TObject; Shift: TShiftState; Pt: TPoint; AllowedEffects: Integer): Integer; virtual;
    procedure StructureChange(Node: PVirtualNode); virtual;
    procedure ToggleSelection(StartNode, EndNode: PVirtualNode);
    procedure UpdateDesigner;
    procedure UpdateHorizontalScrollBar(DoRepaint: Boolean);
    procedure UpdateScrollBars(DoRepaint: Boolean);
    procedure UpdateVerticalScrollBar(DoRepaint: Boolean);
    procedure ValidateCache(StartIndex: Integer = 0);
    procedure ValidateNodeDataSize(var Size: Integer); virtual;
    procedure WndProc(var Message: TMessage); override;
    procedure WriteChunks(Stream: TStream; Node: PVirtualNode); virtual;
    procedure WriteNode(Stream: TStream; Node: PVirtualNode);

    property AutoScrollDelay: Cardinal read FAutoScrollDelay write FAutoScrollDelay default 1000;
    property AutoScrollInterval: TAutoScrollInterval read FAutoScrollInterval write FAutoScrollInterval default 1;
    property Background: TPicture read FBackground write SetBackground;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle;
    property ChangeDelay: Integer read FChangeDelay write FChangeDelay default 0;
    property CheckImageKind: TCheckImageKind read FCheckImageKind write SetCheckImageKind default ckLightCheck;
    property DefaultNodeHeight: Cardinal read FDefaultNodeHeight write SetItemHeight default 18;
    property DefaultPasteMode: TVTNodeAttachMode read FDefaultPasteMode write FDefaultPasteMode default amAddChildLast;
    property DragImageKind: TVTDragImageKind read FDragImageKind write FDragImageKind default diComplete;
    property DropMarkColor: TColor read FDropMarkColor write FDropMarkColor default clSilver;
    property GridLineColor: TColor index 0 read FGridLineColor write SetLineColor default clBtnFace;
    property Header: TVTHeader read FHeader write SetHeader;
    property HintAnimation: THintAnimationType read FAnimationType write FAnimationType;
    property HintMode: TVTHintMode read FHintMode write FHintMode;
    property HotCursor: TCursor read FHotCursor write FHotCursor default crDefault;
    property Images: TImageList read FImages write SetImages;
    property Indent: Cardinal read FIndent write SetIndent default 18;
    property LastDropMode: TDropMode read FLastDropMode write FlastDropMode;
    property Margin: Integer read FMargin write SetMargin default 4;
    property NodeDataSize: Integer read FNodeDataSize write SetNodeDataSize default 0;
    property OLEFormats: TOLEFormats read FOLEFormats write SetOLEFormats default [ofNative, ofUnicodeText, ofText];
    property Options: TVirtualTreeOptions read FOptions write SetOptions default DefaultVTOptions;
    property RootNodeCount: Cardinal read GetRootNodeCount write SetRootNodeCount default 0;
    property ScrollBarOptions: TScrollbarOptions read FScrollBarOptions write SetScrollBarOptions;
    property StateImages: TImageList read FStateImages write SetStateImages;
    property TreeLineColor: TColor index 1 read FTreeLineColor write SetLineColor default clBtnFace;

    property OnAfterItemErase: TVTAfterItemEraseEvent read FOnAfterItemErase write FOnAfterItemErase;
    property OnAfterItemPaint: TVTAfterItemPaintEvent read FOnAfterItemPaint write FOnAfterItemPaint;
    property OnAfterPaint: TVTPaintEvent read FOnAfterPaint write FOnAfterPaint;
    property OnBeforeItemErase: TVTBeforeItemEraseEvent read FOnBeforeItemErase write FOnBeforeItemErase;
    property OnBeforeItemPaint: TVTBeforeItemPaintEvent read FOnBeforeItemPaint write FOnBeforeItemPaint;
    property OnBeforePaint: TVTPaintEvent read FOnBeforePaint write FOnBeforePaint;
    property OnChange: TVTChangeEvent read FOnChange write FOnChange;
    property OnChecked: TVTChangeEvent read FOnChecked write FOnChecked;
    property OnChecking: TVTCheckChangingEvent read FOnChecking write FOnChecking;
    property OnCollapsed: TVTChangeEvent read FOnCollapsed write FOnCollapsed;
    property OnCollapsing: TVTChangingEvent read FOnCollapsing write FOnCollapsing;
    property OnColumnResize: TVTResizeColumnEvent read FOnColumnResize write FOnColumnResize;
    property OnCreateEditor: TVTCreateEditorEvent read FOnCreateEditor write FOnCreateEditor;
    property OnDragOver: TVTDragOverEvent read FOnDragOver write FOnDragOver;
    property OnDragDrop: TVTDragDropEvent read FOnDragDrop write FOnDragDrop;
    property OnDrawHeader: TVTHeaderPaintEvent read FOnDrawHeader write FOnDrawHeader;
    property OnEditCancelled: TVTEditCancelEvent read FOnEditCancelled write FOnEditCancelled;
    property OnEditing: TVTEditChangingEvent read FOnEditing write FOnEditing;
    property OnEdited: TVTEditChangeEvent read FOnEdited write FOnEdited;
    property OnExpanded: TVTChangeEvent read FOnExpanded write FOnExpanded;
    property OnExpanding: TVTChangingEvent read FOnExpanding write FOnExpanding;
    property OnFocusChanged: TVTFocusChangeEvent read FOnFocusChanged write FOnFocusChanged;
    property OnFocusChanging: TVTFocusChangingEvent read FOnFocusChanging write FOnFocusChanging;
    property OnFreeNode: TVTFreeNodeEvent read FOnFreeNode write FOnFreeNode;
    property OnGetHelpContext: TVTHelpContextEvent read FOnGetHelpContext write FOnGetHelpContext;
    property OnGetImageIndex: TVTGetImageEvent read FOnGetImage write FOnGetImage;
    property OnGetNodeDataSize: TVTGetNodeDataSizeEvent read FOnGetNodeDataSize write FOnGetNodeDataSize;
    property OnGetPopupMenu: TVTPopupEvent read FOnGetPopupMenu write FOnGetPopupMenu;
    property OnHeaderClick: TVTHeaderClickEvent read FOnHeaderClick write FOnHeaderClick;
    property OnHotChange: TVTHotNodeChangeEvent read FOnHotChange write FOnHotChange;
    property OnInitChildren: TVTInitChildrenEvent read FOnInitChildren write FOnInitChildren;
    property OnInitNode: TVTInitNodeEvent read FOnInitNode write FOnInitNode;
    property OnLoadNode: TVTSaveNodeEvent read FOnLoadNode write FOnLoadNode;
    property OnNodeCopied: TVTNodeCopiedEvent read FOnNodeCopied write FOnNodeCopied;
    property OnNodeCopying: TVTNodeCopyingEvent read FOnNodeCopying write FOnNodeCopying;
    property OnNodeMoved: TVTNodeMovedEvent read FOnNodeMoved write FOnNodeMoved;
    property OnNodeMoving: TVTNodeMovingEvent read FOnNodeMoving write FOnNodeMoving;
    property OnResetNode: TVTChangeEvent read FOnResetNode write FOnResetNode;
    property OnSaveNode: TVTSaveNodeEvent read FOnSaveNode write FOnSaveNode;
    property OnStructureChange: TVTChangeEvent read FOnStructureChange write FOnStructureChange;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function AddChild(Parent: PVirtualNode): PVirtualNode;
    procedure AddFromStream(Stream: TStream; TargetNode: PVirtualNode);
    function AbsoluteIndex(Node: PVirtualNode): Cardinal;
    // don't really need reintroduce, but it makes clearer what I'm doing here
    procedure BeginDrag(Immediate: Boolean; Threshold: Integer = -1); reintroduce;
    procedure BeginUpdate;
    procedure CancelCutOrCopy; 
    procedure CancelEditNode;
    procedure Clear; virtual;
    procedure ClearSelection;
    function CopyTo(Source: PVirtualNode; Tree: TBaseVirtualTree; Mode: TVTNodeAttachMode;
      ChildrenOnly: Boolean): PVirtualNode; overload;
    function CopyTo(Source, Target: PVirtualNode; Mode: TVTNodeAttachMode;
      ChildrenOnly: Boolean): PVirtualNode; overload;
    procedure CopyToClipBoard;
    procedure CutToClipBoard;
    procedure DeleteNode(Node: PVirtualNode);
    procedure DeleteChildren(Node: PVirtualNode; ResetHasChildren: Boolean = False);
    procedure DeleteSelectedNodes;
    function EditNode(Node: PVirtualNode; Column: Integer): Boolean; virtual;
    procedure EndEditNode;
    procedure EndUpdate;
    procedure FinishCutOrCopy;
    procedure FlushClipboard;
    procedure FullCollapse(Node: PVirtualNode = nil);
    procedure FullExpand(Node: PVirtualNode = nil);
    function GetDisplayRect(Node: PVirtualNode; Column: Integer; TextOnly: Boolean = False): TRect;
    function GetFirstChild(Node: PVirtualNode): PVirtualNode;
    function GetFirstNode: PVirtualNode;
    function GetFirstSelected: PVirtualNode;
    function GetHitTestInfoAt(X, Y: Integer; var HitInfo: THitInfo): PVirtualNode;
    function GetLastChild(Node: PVirtualNode): PVirtualNode;
    function GetLastChildNoInit(Node: PVirtualNode): PVirtualNode;
    function GetLastVisibleChild(Node: PVirtualNode): PVirtualNode;
    function GetNext(Node: PVirtualNode): PVirtualNode;
    function GetNextNoInit(Node: PVirtualNode): PVirtualNode;
    function GetNextSelected(Node: PVirtualNode): PVirtualNode;
    function GetNextSibling(Node: PVirtualNode): PVirtualNode;
    function GetNextVisible(Node: PVirtualNode): PVirtualNode;
    function GetNodeAt(X, Y: Integer): PVirtualNode;
    function GetNodeData(Node: PVirtualNode): Pointer;
    function GetNodeLevel(Node: PVirtualNode): Cardinal;
    function GetPrevious(Node: PVirtualNode): PVirtualNode;
    function GetPreviousSibling(Node: PVirtualNode): PVirtualNode;
    function GetPreviousNoInit(Node: PVirtualNode): PVirtualNode;
    function GetPreviousVisible(Node: PVirtualNode): PVirtualNode;
    function GetSortedSelection(Resolve: Boolean): TNodeArray;
    function GetSortedCutCopySet(Resolve: Boolean): TNodeArray;
    function GetTreeRect: TRect;
    function HasAsParent(Node1, Node2: PVirtualNode): Boolean;
    function InsertNode(Node: PVirtualNode; Mode: TVTNodeAttachMode): PVirtualNode;
    function InvalidateNode(Node: PVirtualNode): TRect; virtual;
    procedure InvalidateToBottom(Node: PVirtualNode);
    procedure InvertSelection(VisibleOnly: Boolean);
    function IsEditing: Boolean;
    function IsMouseSelecting: Boolean;
    function IterateSubtree(Node: PVirtualNode; Callback: TVTGetNodeProc; Data: Pointer; SelectedOnly: Boolean = False;
      DoInit: Boolean = False): PVirtualNode;
    procedure Loaded; override;
    procedure LoadFromFile(const FileName: TFileName); virtual;
    procedure LoadFromStream(Stream: TStream); virtual;
    procedure MoveTo(Source, Target: PVirtualNode; Mode: TVTNodeAttachMode; ChildrenOnly: Boolean); overload;
    procedure MoveTo(Node: PVirtualNode; Tree: TBaseVirtualTree; Mode: TVTNodeAttachMode;
      ChildrenOnly: Boolean); overload;
    procedure PaintTo(TargetCanvas: TCanvas; SourceRect: TBounds; SelectedOnly, MainOnly,
      Background, GridLines: Boolean); reintroduce;
    function PasteFromClipboard: Boolean; virtual;
    function ProcessDrop(DataObject: IDataObject; TargetNode: PVirtualNode; var Effect: Integer; Mode:
      TVTNodeAttachMode): Boolean;
    function ProcessOLEData(Source: TBaseVirtualTree; DataObject: IDataObject; TargetNode: PVirtualNode;
      Mode: TVTNodeAttachMode; Optimized: Boolean): Boolean;
    procedure RepaintNode(Node: PVirtualNode);
    procedure ReinitChildren(Node: PVirtualNode; recursive: Boolean); virtual;
    procedure ReinitNode(Node: PVirtualNode; recursive: Boolean); virtual;
    procedure ResetNode(Node: PVirtualNode); virtual;
    procedure SaveToFile(const FileName: TFileName);
    procedure SaveToStream(Stream: TStream; Node: PVirtualNode = nil); virtual;
    function ScrollIntoView(Node: PVirtualNode; Horizontally: Boolean = False): Boolean;
    procedure SelectAll(VisibleOnly: Boolean);
    procedure Sort(Node: PVirtualNode; Column: Integer; Ascending: Boolean; Compare: TVTCompareFunction;
      DoInit: Boolean = True); virtual;
    procedure ToggleNode(Node: PVirtualNode);
    procedure ValidateChildren(Node: PVirtualNode; recursive: Boolean);
    procedure ValidateNode(Node: PVirtualNode; recursive: Boolean);

    property Alignment[Node: PVirtualNode]: Byte read GetAlignment write SetAlignment;
    property CheckState[Node: PVirtualNode]: TCheckState read GetCheckState write SetCheckState;
    property CheckType[Node: PVirtualNode]: TCheckType read GetCheckType write SetCheckType;
    property ChildCount[Node: PVirtualNode]: Cardinal read GetChildCount write SetChildCount;
    property ChildrenInitialized[Node: PVirtualNode]: Boolean read GetChildrenInitialized;
    {$Warnings off}
    // need to switch off warnings here as Dragging is already a property declared in TControl,
    // but I want to force this one to be used (for OLE drag'n drop)
    property Dragging: Boolean read GetDragging;
    {$Warnings on}
    property DropTargetNode: PVirtualNode read FCurrentTargetNode;
    property Expanded[Node: PVirtualNode]: Boolean read GetExpanded write SetExpanded;
    property FocusedColumn: Integer read FFocusedColumn write SetFocusedColumn default InvalidColumn;
    property FocusedNode: PVirtualNode read FFocusedNode write SetFocusedNode;
    property Font;
    property HasChildren[Node: PVirtualNode]: Boolean read GetHasChildren write SetHasChildren;
    property HotNode: PVirtualNode read FCurrentHotNode;
    property IsDisabled[Node: PVirtualNode]: Boolean read GetDisabled write SetDisabled;
    property IsVisible[Node: PVirtualNode]: Boolean read GetVisible write SetVisible;
    property NodeHeight[Node: PVirtualNode]: Cardinal read GetNodeHeight write SetNodeHeight;
    property OffsetX: Integer read FOffsetX write SetOffsetX;
    property OffsetY: Integer read FOffsetY write SetOffsetY;
    property RootNode: PVirtualNode read FRoot;
    property Selected[Node: PVirtualNode]: Boolean read GetSelected write SetSelected;
    property TotalCount: Cardinal read GetTotalCount;
    property TreeStates: TVirtualTreeStates read FStates;
    property SelectedCount: Integer read FSelectionCount;
    property TopNode: PVirtualNode read GetTopNode write SetTopNode;
    property VisibleCount: Cardinal read FVisibleCount;
  end;


  // --------- TCustomVirtualStringTree
  TCustomVirtualStringTree = class;

  // support classes
  TStringEditLink = class;

  TVTEdit = class(TCustomEdit)
  private
    FLink: TStringEditLink;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
    procedure WMChar(var Message: TWMChar); message WM_CHAR;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure WMKillFocus(var Msg: TWMKillFocus); message WM_KILLFOCUS;
  protected
    procedure AutoAdjustSize(NewChar: Word);
    procedure CreateParams(var Params: TCreateParams); override;
  public
    constructor Create(Link: TStringEditLink); reintroduce;
  end;

  TStringEditLink = class(TInterfacedObject, IVTEditLink)
  private
    FEdit: TVTEdit;          // a normal custom edit control
    FTree: TCustomVirtualStringTree; // a back reference to the tree calling
    FNode: PVirtualNode;     // the node to be edited
    FColumn: Integer;        // the column of the node
    FTextBounds: TRect;      // smallest rectangle around the text
    FStopping: Boolean;      // set to True when the edit link requests stopping the edit action 
  public
    constructor Create;
    destructor Destroy; override;

    function  BeginEdit: Boolean; stdcall;
    procedure CancelEdit; stdcall;
    function CanStop: Boolean; stdcall;
    procedure EndEdit; stdcall;
    function GetBounds: TRect; stdcall;
    function PrepareEdit(Tree: TBaseVirtualTree; Node: PVirtualNode; Column: Integer): Boolean; stdcall;
    procedure SetBounds(R: TRect); stdcall;
  end;
  
  // used for customizing item appearance without doing entirely a custom draw
  TDrawInfo = record
    Font: TFont;
    Background: TColor;
  end;

  // describes the type of text to return in the text and draw info retrival events
  TVSTTextType = (
    ttNormal,      // normal label of the node, this is also the text which can be edited
    ttStatic       // static (non-editable) text after the normal text
  );

  // used to cache the column strings and widths of one node during a paint cycle to optimize access 
  TColumnData = record
    Visible: Boolean;
    Text: WideString;
    Width: Cardinal;
  end;

  TVSTGetDrawInfoEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: Integer;
    TextType: TVSTTextType; var DrawInfo: TDrawInfo) of object;
  TVSTGetTextEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: Integer;
    TextType: TVSTTextType; var Text: WideString) of object;
  // new text can only be set for variable caption
  TVSTNewTextEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: Integer;
    Text: WideString) of object;

  TCustomVirtualStringTree = class(TBaseVirtualTree)
  private
    FDefaultText: WideString;                    // text to show if there's no OnGetText event handler (e.g. at design time)
    FDrawInfo: TDrawInfo;                        // structure used in item customization
    FEllipsisWidth: Integer;                     // width of '...' in the current font to shorten strings quickly
    FTextHeight: Integer;                        // true size of the font
    FStringOptions: TVSTOptions;                 // tree options which only apply to string trees

    FOnGetDrawInfo: TVSTGetDrawInfoEvent;        // use when doing an item customization without doing a fully blown
                                                 // custom draw
    FOnGetText,                                  // used to retrieve the string to be displayed for a specific node
    FOnGetHint: TVSTGetTextEvent;                // used to retrieve the hint to be displayed for a specific node
    FOnNewText: TVSTNewTextEvent;                // used to notify the application about an edited node caption

    // cache for some node data used during a paint cycle
    FColumnData: array of TColumnData;
    procedure ReadText(Reader: TReader);
    procedure SetDefaultText(const Value: WideString);
    procedure SetStringOptions(Value: TVSTOptions);
    procedure WMSetFont(var Msg: TWMSetFont); message WM_SETFONT;
    procedure WriteText(Writer: TWriter);
  protected
    procedure AdjustPaintCellRect(Node: PVirtualNode; ColumnPosition: Integer; var NextNonEmpty: Integer;
      var ClipRect: TRect); override;
    procedure DefineProperties(Filer: TFiler); override;
    function DoBeforeItemPaint(Canvas: TCanvas; Node: PVirtualNode; ItemRect: TRect): Boolean; override;
    procedure DoBeforePaint(Canvas: TCanvas); override;
    function CalculateTextWidth(Node: PVirtualNode; Column: Integer; Text: WideString): Integer;
    function ColumnIsEmpty(Node: PVirtualNode; Column: Integer): Boolean; override;
    function CreateEditor(Node: PVirtualNode; Column: Integer): IVTEditLink; override;
    procedure DoGetDrawInfo(Node: PVirtualNode; Column: Integer; TextType: TVSTTextType;
      var DrawInfo: TDrawInfo); virtual;
    function DoGetNodeHint(Node: PVirtualNode; Column: Integer): WideString; override;
    function DoGetNodeTooltip(Node: PVirtualNode; Column: Integer): WideString; override;
    function DoGetNodeWidth(Node: PVirtualNode; Column: Integer): Integer; override;
    procedure DoGetText(Node: PVirtualNode; Column: Integer; TextType: TVSTTextType;
      var Text: WideString); virtual;
    procedure DoNewText(Node: PVirtualNode; Column: Integer; Text: WideString); virtual;
    procedure DoPaintNode(Canvas: TCanvas; Node: PVirtualNode; ClippingRect, NodeRect: TRect;
      Column, ColumnIndex: Integer); override;
    procedure GetTextInfo(Node: PVirtualNode; Column: Integer; const AFont: TFont; var R: TRect;
      var Text: WideString); override;
    function ReadChunk(Stream: TStream; Node: PVirtualNode; ChunkType, ChunkSize: Integer): Boolean; override;
    procedure WriteChunks(Stream: TStream; Node: PVirtualNode); override;

    property DefaultText: WideString read FDefaultText write SetDefaultText stored False;
    property StringOptions: TVSTOptions read FStringOptions write SetStringOptions default DefaultStringOptions;

    property OnGetDrawInfo: TVSTGetDrawInfoEvent read FOnGetDrawInfo write FOnGetDrawInfo;
    property OnGetHint: TVSTGettextEvent read FOnGetHint write FOnGetHint;
    property OnGetText: TVSTGetTextEvent read FOnGetText write FOnGetText;
    property OnNewText: TVSTNewTextEvent read FOnNewText write FOnNewText;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function InvalidateNode(Node: PVirtualNode): TRect; override;
    procedure ReinitNode(Node: PVirtualNode; recursive: Boolean); override;
  end;

  TVirtualStringTree = class(TCustomVirtualStringTree)
  public
    property Canvas;
  published
    property Align;
    property Anchors;
    property AutoScrollDelay;
    property AutoScrollInterval;
    property Background;
    property BiDiMode;
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind;
    property BevelWidth;
    property BorderStyle;
    property BorderWidth;
    property ChangeDelay;
    property CheckImageKind;
    property Color;
    property Ctl3D;
    property Constraints;
    property DefaultNodeHeight;
    property DefaultPasteMode;
    property DefaultText;
    property DragKind;
    property DragImageKind;
    property DragMode;
    property DropMarkColor;
    property Enabled;
    property Font;
    property GridLineColor;
    property Header;
    property HintAnimation;
    property HintMode;
    property HotCursor;
    property Images;
    property Indent;
    property Margin;
    property NodeDataSize;
    property OLEFormats;
    property Options;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property RootNodeCount;
    property ScrollBarOptions;
    property ShowHint;
    property StateImages;
    property StringOptions;
    property TabOrder;
    property TabStop default True;
    property TreeLineColor;
    property Visible;

    property OnAfterItemErase;
    property OnAfterItemPaint;
    property OnAfterPaint;
    property OnBeforeItemErase;
    property OnBeforeItemPaint;
    property OnBeforePaint;
    property OnChange;
    property OnChecked;
    property OnChecking;
    property OnClick;
    property OnCollapsed;
    property OnCollapsing;
    property OnColumnResize;
    property OnCreateEditor;
    property OnDblClick;
    property OnDragOver;
    property OnDragDrop;
    property OnDrawHeader;
    property OnGetText;
    property OnEditCancelled;
    property OnEdited;
    property OnEditing;
    property OnEndDock;
    property OnEnter;
    property OnExit;
    property OnExpanded;
    property OnExpanding;
    property OnFocusChanged;
    property OnFocusChanging;
    property OnFreeNode;
    property OnGetDrawInfo;
    property OnGetHelpContext;
    property OnGetImageIndex;
    property OnGetHint;
    property OnGetNodeDataSize;
    property OnGetPopupMenu;
    property OnHeaderClick;
    property OnHotChange;
    property OnInitChildren;
    property OnInitNode;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnLoadNode;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnNewText;
    property OnNodeCopied;
    property OnNodeCopying;
    property OnNodeMoved;
    property OnNodeMoving;
    property OnResetNode;
    property OnSaveNode;
    property OnStartDock;
    property OnStructureChange;
  end;

  TVTDrawHintEvent = procedure(Sender: TBaseVirtualTree; Canvas: TCanvas; Node: PVirtualNode; R: TRect;
    Column: Integer) of object;
  TVTDrawNodeEvent = procedure(Sender: TBaseVirtualTree; Canvas: TCanvas; Node: PVirtualNode; ClipRect, NodeRect: TRect;
    Column: Integer) of object;
  TVTGetNodeWidthEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: Integer;
    var NodeWidth: Integer) of object;
  TVTGetHintSizeEvent = procedure(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: Integer; var R: TRect) of object;

  // tree descentant to let an application draw its stuff itself
  TCustomVirtualDrawTree = class(TBaseVirtualTree)
  private
    FOnDrawNode: TVTDrawNodeEvent;
    FOnGetNodeWidth: TVTGetNodeWidthEvent;
    FOnGetHintSize: TVTGetHintSizeEvent;
    FOnDrawHint: TVTDrawHintEvent;
  protected
    procedure DoDrawHint(Canvas: TCanvas; Node: PVirtualNode; R: TRect; Column: Integer);
    procedure DoGetHintSize(Node: PVirtualNode; Column: Integer; var R: TRect); virtual;
    function DoGetNodeWidth(Node: PVirtualNode; Column: Integer): Integer; override;
    procedure DoPaintNode(Canvas: TCanvas; Node: PVirtualNode; ClippingRect, NodeRect: TRect; Column,
      ColumnIndex: Integer); override;

    property OnDrawHint: TVTDrawHintEvent read FOnDrawHint write FOnDrawHint;
    property OnDrawNode: TVTDrawNodeEvent read FOnDrawNode write FOnDrawNode;
    property OnGetHintSize: TVTGetHintSizeEvent read FOnGetHintSize write FOnGetHintSize;
    property OnGetNodeWidth: TVTGetNodeWidthEvent read FOnGetNodeWidth write FOnGetNodeWidth;
  end;

  TVirtualDrawTree = class(TCustomVirtualDrawTree)
  public
    property Canvas;
  published
    property Align;
    property Anchors;
    property AutoScrollDelay;
    property AutoScrollInterval;
    property Background;
    property BiDiMode;
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind;
    property BevelWidth;
    property BorderStyle;
    property BorderWidth;
    property ChangeDelay;
    property CheckImageKind;
    property Color;
    property Ctl3D;
    property Constraints;
    property DefaultNodeHeight;
    property DefaultPasteMode;
    property DragKind;
    property DragImageKind;
    property DragMode;
    property DropMarkColor;
    property Enabled;
    property Font;
    property GridLineColor;
    property Header;
    property HintAnimation;
    property HintMode;
    property HotCursor;
    property Images;
    property Indent;
    property Margin;
    property NodeDataSize;
    property OLEFormats;
    property Options;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property RootNodeCount;
    property ScrollBarOptions;
    property ShowHint;
    property StateImages;
    property TabOrder;
    property TabStop default True;
    property TreeLineColor;
    property Visible;

    property OnAfterItemErase;
    property OnAfterItemPaint;
    property OnAfterPaint;
    property OnBeforeItemErase;
    property OnBeforeItemPaint;
    property OnBeforePaint;
    property OnChange;
    property OnChecked;
    property OnChecking;
    property OnClick;
    property OnCollapsed;
    property OnCollapsing;
    property OnColumnResize;
    property OnCreateEditor;
    property OnDblClick;
    property OnDragOver;
    property OnDragDrop;
    property OnDrawHeader;
    property OnDrawHint;
    property OnDrawNode;
    property OnEdited;
    property OnEditing;
    property OnEndDock;
    property OnEnter;
    property OnExit;
    property OnExpanded;
    property OnExpanding;
    property OnFocusChanged;
    property OnFocusChanging;
    property OnFreeNode;
    property OnGetHelpContext;
    property OnGetHintSize;
    property OnGetImageIndex;
    property OnGetNodeDataSize;
    property OnGetNodeWidth;
    property OnGetPopupMenu;
    property OnHeaderClick;
    property OnHotChange;
    property OnInitChildren;
    property OnInitNode;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnLoadNode;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnNodeCopied;
    property OnNodeCopying;
    property OnNodeMoved;
    property OnNodeMoving;
    property OnResetNode;
    property OnSaveNode;
    property OnStartDock;
    property OnStructureChange;
  end;

// utility routines
function ShortenString(DC: HDC; const S: WideString; Width, EllipsisWidth: Integer): WideString;
function TreeFromNode(Node: PVirtualNode): TBaseVirtualTree;

procedure Register;

//----------------------------------------------------------------------------------------------------------------------

implementation

{$R VirtualTrees.res}

uses
  Consts, Math, ShlObj, CommCtrl;

resourcestring
  SEditLinkIsNil = 'Edit link must not be nil.';
  SWrongMoveError = 'Target node cannot be a child node of the node to be moved.';
  SWrongStreamFormat = 'Unable to load tree structure, the format is wrong.';
  SWrongStreamVersion = 'Unable to load tree structure, the version is unknown.';
  SCorruptStream1 = 'Stream data corrupt. A node''s anchor chunk is missing.';
  SCorruptStream2 = 'Stream data corrupt. Unexpected data after node''s end position.';
  SClipboardFailed = 'Clipboard operation failed.';

  SEtcInvalidItem = 'FormatEtcList: Invalid item index.';

const
  // symbolic line type identifiers
  LineBottomRight = 0;
  LineTopDown = 1;
  LineTopDownRight = 2;
  LineRight = 3;
  LineTopRight = 4;

  ClipboardStates = [tsCopyPending, tsCutPending];

var
  StandardOLEFormat: TFormatEtc = (
    // format must later be set
    cfFormat: 0;
    // no specific target device
    ptd: nil;
    // normal content to render
    dwAspect: DVASPECT_CONTENT;
    // no specific page of multipage data (we don't use multipage data by default)
    lindex: -1;
    // pass the data via memory
    tymed: TYMED_HGLOBAL
  );


type // streaming support
  TMagicID = array[0..5] of WideChar;

  TChunkHeader = record
    ChunkType,
    ChunkSize: Integer;      // contains the size of the chunk excluding the header
  end;

  // base information about a node
  TBaseChunkBody = packed record
    ChildCount,
    NodeHeight: Cardinal;
    States: TVirtualNodeStates;
    Align: Byte;
    CheckState: TCheckState;
    CheckType: TCheckType;
  end;

  TBaseChunk = packed record
    Header: TChunkHeader;
    Body: TBaseChunkBody;
  end;

const
  MagicID: TMagicID = (#$2045, 'V', 'T', WideChar(VTStreamMajorVersion), WideChar(VTStreamMinorVersion), #$2046);

  // chunk IDs
  NodeChunk = 1;
  BaseChunk = 2;        // chunk containing node state, check state, child node count etc.
                        // this chunk is immediately followed by all child nodes
  CaptionChunk = 3;     // used by the string tree to store a node's caption
  UserChunk = 4;        // used for data supplied by the application

  ScrollBarProp: array[TScrollBarStyle] of Integer = (FSB_REGULAR_MODE, FSB_FLAT_MODE, FSB_ENCARTA_MODE);

type
  // main tree error
  EVirtualTreeError = class(Exception);

  // internal worker thread
  TWorkerThread = class(TThread)
  private
    FCurrentTree: TBaseVirtualTree;
    FWaiterList: TThreadList;
    FRefCount: Cardinal;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy; override;

    procedure AddTree(Tree: TBaseVirtualTree);
    procedure RemoveTree(Tree: TBaseVirtualTree);
  end;

var
  WorkerThread: TWorkerThread;
  WorkEvent: THandle;
  LightCheckImages,    // global light check images
  DarkCheckImages,     // global heavy check images
  LightTickImages,     // global light tick images
  DarkTickImages,      // global heavy check images
  UtilityImages: TImageList; // some small additional images (e.g for header dragging)
  IsWin95: Boolean;    // necessary to fix a bug in Win95 regarding non-client area region intersection

  {$ifndef DFS_COMPILER_5_UP}
  HintFont: TFont; // in Delphi 4 there is no TScreen.HintFont yet
  {$endif}

//----------------------------------------------------------------------------------------------------------------------

procedure Register;

begin
  RegisterComponents('Virtual Controls', [TVirtualStringTree, TVirtualDrawTree]);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure AddThreadReference;

begin
  if WorkerThread = nil then
  begin
    // create worker thread, initialize it and send it to its wait loop
    WorkerThread := TWorkerThread.Create(False);

    // create an event used to trigger our worker thread when something is to do
    WorkEvent := CreateEvent(nil, False, False, nil);
    if WorkEvent = 0 then
      RaiseLastWin32Error;
  end;
  Inc(WorkerThread.FRefCount);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure ReleaseThreadReference(Tree: TBaseVirtualTree);

begin
  if Assigned(WorkerThread) then
  begin
    Dec(WorkerThread.FRefCount);

    // make sure there is no reference remaining to the releasing tree
    Tree.InterruptValidation;

    if WorkerThread.FRefCount = 0 then
    begin
      with WorkerThread do
      begin
        Terminate;                              
        SetEvent(WorkEvent);    
        WorkerThread.Free;
      end;
      WorkerThread := nil;
      CloseHandle(WorkEvent);
    end;
  end;
end;

//----------------- utility functions ----------------------------------------------------------------------------------

procedure ShowError(Msg: WideString);

begin
  raise EVirtualTreeError.Create(Msg);
end;

//----------------------------------------------------------------------------------------------------------------------

function TreeFromNode(Node: PVirtualNode): TBaseVirtualTree;

// returns the tree the node currently belongs to or nil if the node is not attached to a tree

begin
  Assert(Assigned(Node), 'TreeFromNode: Node must not be nil.');

  // the root node is marked by having its NextSibling pointing to itself
  while Assigned(Node) and (Node.NextSibling <> Node) do
    Node := Node.Parent;
  if Assigned(Node) then
    Result := TBaseVirtualTree(Node.Parent)
  else
    Result := nil;
end;

//----------------------------------------------------------------------------------------------------------------------

function OrderRect(const R: TRect): TRect;

// converts the incoming rectangle so that left and top are always less than or equal to right and bottom

begin
  if R.Left < R.Right then
  begin
    Result.Left := R.Left;
    Result.Right := R.Right;
  end
  else
  begin
    Result.Left := R.Right;
    Result.Right := R.Left;
  end;
  if R.Top < R.Bottom then
  begin
    Result.Top := R.Top;
    Result.Bottom := R.Bottom;
  end
  else
  begin
    Result.Top := R.Bottom;
    Result.Bottom := R.Top;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure QuickSort(const TheArray: TNodeArray; L, R: Integer);

var
  I, J: Integer;
  P, T: Pointer;

begin
  repeat
    I := L;
    J := R;
    P := TheArray[(L + R) shr 1];
    repeat
      while Cardinal(TheArray[I]) < Cardinal(P) do
        Inc(I);
      while Cardinal(TheArray[J]) > Cardinal(P) do
        Dec(J);
      if I <= J then
      begin
        T := TheArray[I];
        TheArray[I] := TheArray[J];
        TheArray[J] := T;
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then
      QuickSort(TheArray, L, J);
    L := I;
  until I >= R;
end;

//----------------------------------------------------------------------------------------------------------------------

function ShortenString(DC: HDC; const S: WideString; Width, EllipsisWidth: Integer): WideString;

// adjusts the given string S so that it fits into the given width

var
  I: Integer;
  Total: Integer;
  Size: TSize;
  Len: Integer;

begin
  Len := Length(S);
  if (Len = 0) or (Width <= 0) then
    Result := ''
  else
  begin
    // first try the quick way
    if GetTextExtentExPointW(DC, PWideChar(S), Len, Width, @I, nil, Size) then
    begin
      // if supported (WinNT, W2K, any future Win9x update) then we are lucky
      if I = Len then
        Result := S
      else
        Result := Copy(S, 1, I - 1) + '...';
    end
    else
    begin
      GetTextExtentPoint32W(DC, PWideChar(S), Length(S), Size);
      if Size.cx <= Integer(Width) then
        Result := S
      else
      begin
        Total := 0;
        for I := 1 to Len do
        begin
          // Note: GetCharWidth32 is not supported under Win9x
          GetCharWidth(DC, Word(S[I]), Word(S[I]), Len);
          if Total + Len + EllipsisWidth >= Width then
            Break;
          Inc(Total, Len);
        end;
        Result := Copy(S, 1, I - 1) + '...';
      end;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure FillDragRectangles(DragWidth, DragHeight, dX, dY: Integer; var RClip, RScroll, RSamp1, RSamp2, RDraw1,
  RDraw2: TRect);

// fills the given rectangles with values which can be used while dragging around an image
// (used in DragMove of the drag manager and DragTo of the header columns)

begin
  // ScrollDC limits
  RClip := Rect(0, 0, DragWidth, DragHeight);
  if dX > 0 then
  begin
    // move to the left
    if dY = 0 then
    begin
      // move only to the left
      // background movement
      RScroll := Rect(0, 0, DragWidth - dX, DragHeight);
      RSamp1 := Rect(0, 0, dX, DragHeight);
      RDraw1 := Rect(DragWidth - dX, 0, dX, DragHeight);
    end
    else
      if dY < 0 then
      begin
        // move to bottom left
        RScroll := Rect(0, -dY, DragWidth - dX, DragHeight);
        RSamp1 := Rect(0, 0, dX, DragHeight);
        RSamp2 := Rect(dX, DragHeight + dY, DragWidth - dX, -dY);
        RDraw1 := Rect(0, 0, DragWidth - dX, -dY);
        RDraw2 := Rect(DragWidth - dX, 0, dX, DragHeight);
      end
      else
      begin
        // move to upper left
        RScroll := Rect(0, 0, DragWidth - dX, DragHeight - dY);
        RSamp1 := Rect(0, 0, dX, DragHeight);
        RSamp2 := Rect(dX, 0, DragWidth - dX, dY);
        RDraw1 := Rect(0, DragHeight - dY, DragWidth - dX, dY);
        RDraw2 := Rect(DragWidth - dX, 0, dX, DragHeight);
      end;
  end
  else
    if dX = 0 then
    begin
      // vertical movement only
      if dY < 0 then
      begin
        // move downwards
        RScroll := Rect(0, -dY, DragWidth, DragHeight);
        RSamp2 := Rect(0, DragHeight + dY, DragWidth, -dY);
        RDraw2 := Rect(0, 0, DragWidth, -dY);
      end
      else
      begin
        // move upwards
        RScroll := Rect(0, 0, DragWidth, DragHeight - dY);
        RSamp2 := Rect(0, 0, DragWidth, dY);
        RDraw2 := Rect(0, DragHeight - dY, DragWidth, dY);
      end;
    end
    else
    begin
      // move to the right
      if dY > 0 then
      begin
        // move up right
        RScroll := Rect(-dX, 0, DragWidth, DragHeight);
        RSamp1 := Rect(0, 0, DragWidth + dX, dY);
        RSamp2 := Rect(DragWidth + dX, 0, -dX, DragHeight);
        RDraw1 := Rect(0, 0, -dX, DragHeight);
        RDraw2 := Rect(-dX, DragHeight - dY, DragWidth + dX, dY);
      end
      else
        if dY = 0 then
        begin
          // to the right only
          RScroll := Rect(-dX, 0, DragWidth, DragHeight);
          RSamp1 := Rect(DragWidth + dX, 0, -dX, DragHeight);
          RDraw1 := Rect(0, 0, -dX, DragHeight);
        end
        else
        begin
          // move down right
          RScroll := Rect(-dX, -dY, DragWidth, DragHeight);
          RSamp1 := Rect(0, DragHeight + dY, DragWidth + dX, -dY);
          RSamp2 := Rect(DragWidth + dX, 0, -dX, DragHeight);
          RDraw1 := Rect(0, 0, -dX, DragHeight);
          RDraw2 := Rect(-dX, 0, DragWidth + dX, -dY);
        end;
    end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure SimpleAlpha(Source1, Source2, Target: TBitmap);

// quick and simple alpha blending 
// Note: Source1 and Source2 must be equal in size and Target either equal too or larger than the sources 

var
  X, Y: Integer;
  SourceRun1,
  SourceRun2,
  TargetRun: PByte;

begin
  for Y := 0 to Source1.Height - 1 do
  begin
    SourceRun1 := Source1.ScanLine[Y];
    SourceRun2 := Source2.ScanLine[Y];
    TargetRun := Target.ScanLine[Y];
    for X := 0 to Source1.Width - 1 do
    begin
      // darken the first source a little more than the second
      // (the former is considered as being the background to blend against)
      TargetRun^ := ((SourceRun1^ * 4) + (SourceRun2^ * 3)) div 8;
      Inc(TargetRun);
      Inc(SourceRun1);
      Inc(SourceRun2);
      TargetRun^ := ((SourceRun1^ * 4) + (SourceRun2^ * 3)) div 8;
      Inc(TargetRun);
      Inc(SourceRun1);
      Inc(SourceRun2);
      TargetRun^ := ((SourceRun1^ * 4) + (SourceRun2^ * 3)) div 8;
      Inc(TargetRun);
      Inc(SourceRun1);
      Inc(SourceRun2);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

const
  Grays: array[0..3] of TColor = (clWhite, clSilver, clGray, clBlack);
  SysGrays: array[0..3] of TColor = (clWindow, clBtnFace, clBtnShadow, clBtnText);

procedure ConvertAndAddImages(IL: TImageList; const ImageName: String);

// loads the internal state image list for the tree's check images

var
  Images,
  OneImage: TBitmap;
  I: Integer;
  MaskColor: TColor;                     
  Source,
  Dest: TRect;

begin
  // Since we want the image list appearing in the correct system colors, we have to remap its colors.
  Images := TBitmap.Create;
  OneImage := TBitmap.Create;
  Images.Handle := CreateMappedRes(HInstance, PChar(ImageName), Grays, SysGrays);
  try
    // It is assumed that the image height determines also the width of one entry in the image list.
    IL.Clear;
    IL.Height := Images.Height;
    IL.Width := Images.Height;
    OneImage.Width := IL.Width;
    OneImage.Height := IL.Height;                         
    MaskColor := Images.Canvas.Pixels[0, 0];
    Dest := Rect(0, 0, IL.Width, IL.Height);
    for I := 0 to (Images.Width div Images.Height) - 1 do
    begin
      Source := Rect(I * IL.Width, 0, (I + 1) * IL.Width, IL.Height);
      OneImage.Canvas.CopyRect(Dest, Images.Canvas, Source);
      IL.AddMasked(OneImage, MaskColor);
    end;                                                  
  finally
    Images.Free;
    OneImage.Free;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure InitializeGlobalStructures;

// initialization of stuff global to the unit

{$ifndef DFS_COMPILER_5_UP}
var
  NonClientMetrics: TNonClientMetrics;
{$endif}

begin
  IsWin95 := ((Win32Platform and VER_PLATFORM_WIN32_WINDOWS) <> 0) and
             ((Win32MajorVersion < 4) or ((Win32MajorVersion = 4) and (Win32MinorVersion = 0)));
  OleInitialize(nil);

  // register the native and helper clipboard formats
  CF_VIRTUALTREE := RegisterClipboardFormat(CFSTR_VIRTUALTREE);
  CF_VTREFERENCE := RegisterClipboardFormat(CFSTR_VTREFERENCE);

  // load all internal image lists and convert their colors to current desktop color scheme
  LightCheckImages := TImageList.CreateSize(16, 16);
  ConvertAndAddImages(LightCheckImages, 'VBT_CHECK_LIGHT');
  DarkCheckImages := TImageList.CreateSize(16, 16);
  ConvertAndAddImages(DarkCheckImages, 'VBT_CHECK_DARK');
  LightTickImages := TImageList.CreateSize(16, 16);
  ConvertAndAddImages(LightTickImages, 'VBT_TICK_LIGHT');
  DarkTickImages := TImageList.CreateSize(16, 16);
  ConvertAndAddImages(DarkTickImages, 'VBT_TICK_DARK');
  UtilityImages := TImageList.CreateSize(16, 16);
  ConvertAndAddImages(UtilityImages, 'VBT_UTILITIES');

  {$ifndef DFS_COMPILER_5_UP}
  // in Delphi 4 there is not TScreen.HintFont yet hence we must manage this manually
  HintFont := TFont.Create;
  NonClientMetrics.cbSize := SizeOf(NonClientMetrics);
  if SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @NonClientMetrics, 0) then
    HintFont.Handle := CreateFontIndirect(NonClientMetrics.lfStatusFont)
  else
    HintFont.Size := 8;
  {$endif}
end;

//----------------------------------------------------------------------------------------------------------------------

procedure FinalizeGlobalStructures;

begin
  {$ifndef DFS_COMPILER_5_UP}
  HintFont.Free;
  {$endif}

  LightCheckImages.Free;
  DarkCheckImages.Free;
  LightTickImages.Free;
  DarkTickImages.Free;

  OleUninitialize;
end;

//----------------- TWorkerThread --------------------------------------------------------------------------------------

constructor TWorkerThread.Create(CreateSuspended: Boolean);

begin
  inherited Create(CreateSuspended);
  FWaiterList := TThreadList.Create;
end;

//----------------------------------------------------------------------------------------------------------------------

destructor TWorkerThread.Destroy;

begin
  FWaiterList.Free;
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TWorkerThread.AddTree(Tree: TBaseVirtualTree);

begin
  Assert(Assigned(Tree), 'TWorkerThread.AddTree: Tree must not be nil.');
  
  with FWaiterList.LockList do
  try
    if IndexOf(Tree) = -1 then
      Add(Tree);
  finally
    FWaiterList.UnlockList;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TWorkerThread.Execute;

// does some background tasks, like validating tree caches

begin
  while not Terminated do
  begin
    WaitForSingleObject(WorkEvent, INFINITE);
    if not Terminated then 
    begin
      // get the next waiting tree
      with FWaiterList.LockList do
      try
        if Count > 0 then
        begin
          FCurrentTree := Items[0];
          // remove this tree from waiter list
          Delete(0);
        end
        else
          FCurrentTree := nil;
      finally
        FWaiterList.UnlockList;
      end;

      // something to do?
      if Assigned(FCurrentTree) then
      try
        FCurrentTree.DoValidateCaches;
      finally
        FCurrentTree := nil;
      end;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TWorkerThread.RemoveTree(Tree: TBaseVirtualTree);

begin
  Assert(Assigned(Tree), 'TWorkerThread.RemoveTree: Tree must not be nil.');

  with FWaiterList.LockList do
  try
    Remove(Tree);
  finally
    FWaiterList.UnlockList;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

// OLE drag and drop support classes
// This is quite heavy stuff (compared with the VCL implementation) but is much better suited to fit the needs
// of DD'ing various kinds of virtual data and works also between applications.

//----------------- TFormatEtcList -------------------------------------------------------------------------------------

function TFormatEtcList.Get(Index: Integer): TFormatEtc;

begin
  if (Index < 0) or (Index > High(FList)) then
    raise EListError.Create(SEtcInvalidItem)
  else
    Result := FList[Index];
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TFormatEtcList.Put(Index: Integer; Item: TFormatEtc);

begin
  if (Index < 0) or (Index > High(FList)) then
    raise EListError.Create(SEtcInvalidItem)
  else
    FList[Index] := Item;
end;

//----------------------------------------------------------------------------------------------------------------------

function TFormatEtcList.GetCount: Integer;

begin
  Result := Length(FList);
end;

//----------------------------------------------------------------------------------------------------------------------

function TFormatEtcList.Add(Item: TFormatEtc): Integer;

begin
  Result := Length(FList);
  SetLength(FList, Result + 1);
  FList[Result] := Item;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TFormatEtcList.Clear;

// Currently the ptd member of the TFormatEtc structure is not used so we don't need to consider to free any
// additionaly memory.

begin
  Flist := nil;
end;

//----------------------------------------------------------------------------------------------------------------------

function TFormatEtcList.Clone: TFormatEtcList;

begin
  Result := TFormatEtcList.Create;
  if Length(FList) > 0 then
    Result.FList := Copy(FList, 0, Length(FList));
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TFormatEtcList.Delete(Index: Integer);

begin
  if (Index < 0) or (Index > High(FList)) then
    raise EListError.Create(SEtcInvalidItem)
  else
  begin
    if Index < High(FList) then
      Move(FList[Index + 1], FList[Index], (High(FList) - Index) * SizeOf(TFormatEtc));
    SetLength(FList, High(FList));
  end;
end;

//----------------- TEnumFormatEtc -------------------------------------------------------------------------------------

constructor TEnumFormatEtc.Create(FormatEtcList: TFormatEtcList);

begin
  inherited Create;
  FFormatEtcList := FormatEtcList;
end;

//----------------------------------------------------------------------------------------------------------------------

destructor TEnumFormatEtc.Destroy;

begin
  FFormatEtcList.Free;
  inherited Destroy;
end;

//----------------------------------------------------------------------------------------------------------------------

function TEnumFormatEtc.Next(celt: Integer; out elt; pceltFetched: PLongint): HResult;

var
  CopyCount: Integer;

begin
  Result := S_FALSE;
  CopyCount := FFormatEtcList.Count - FCurrentIndex;
  if celt < CopyCount then
    CopyCount := celt;
  if CopyCount > 0 then
  begin
    Move(FFormatEtcList.FList[FCurrentIndex], elt, CopyCount * SizeOf(TFormatEtc));
    Inc(FCurrentIndex, CopyCount);
    Result := S_OK;
  end;
  if Assigned(pceltFetched) then
    pceltFetched^ := CopyCount;
end;

//----------------------------------------------------------------------------------------------------------------------

function TEnumFormatEtc.Skip(celt: Integer): HResult;

begin
  if (FCurrentIndex + celt <= FFormatEtcList.Count) then
  begin
    Inc(FCurrentIndex, celt);
    Result := S_Ok;
  end
  else
    Result := S_FALSE;
end;

//----------------------------------------------------------------------------------------------------------------------

function TEnumFormatEtc.Reset: HResult;

begin
  FCurrentIndex := 0;
  Result := S_OK;
end;

//----------------------------------------------------------------------------------------------------------------------

function TEnumFormatEtc.Clone(out Enum: IEnumFormatEtc): HResult;

begin
  Result := S_OK;
  try
    Enum := TEnumFormatEtc.Create(FFormatEtcList);
    TEnumFormatEtc(Enum).FCurrentIndex := FCurrentIndex;
  except
    Result := E_FAIL;
  end;
end;

//----------------- TBaseDragDropManager -------------------------------------------------------------------------------

constructor TBaseDragDropManager.Create(AOwner: TBaseVirtualTree);

begin
  inherited Create;
  FOwner := AOwner;
  FFormatEtcList := TFormatEtcList.Create;
end;

//----------------------------------------------------------------------------------------------------------------------

destructor TBaseDragDropManager.Destroy;

begin
  if FInDrag then
    DragStop;
  FFormatEtcList.Free;
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseDragDropManager._Release: Integer;

begin
  with FOwner do
  begin
    // The IDataObject which is also implemented in this class gets a release call if it was placed on the clipboard
    // and some other data has been placed later. Since _Release is also called for various other reasons we maintain
    // a second reference counter.
    if not (tsClipboardCancelling in FOwner.FStates) then
    begin
      Include(FOwner.FStates, tsClipboardCancelling);
      CancelCutOrCopy;
      Exclude(FOwner.FStates, tsClipboardCancelling);
      Invalidate;
    end;
  end;

  Result := InterlockedDecrement(FRefCount);
  if Result = 0 then
    Destroy;
end;

//----------------------------------------------------------------------------------------------------------------------
                                            
function TBaseDragDropManager.DAdvise(const FormatEtc: TFormatEtc; advf: Integer; const advSink: IAdviseSink;
  out dwConnection: Integer): HResult;

begin
  Result := E_NOTIMPL;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseDragDropManager.DragEnter(const DataObject: IDataObject; KeyState: Integer; Pt: TPoint;
  var Effect: Integer): HResult;

begin
  FDragSource := GetDataSourceTree(DataObject);
  Result := FOwner.DoDragEnter(DataObject, KeyState, Pt, Effect);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseDragDropManager.DragLeave: HResult;

begin
  FOwner.DoDragLeave;
  FDragSource := nil;
  Result := NOERROR;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseDragDropManager.DragMove(Target: TPoint);

// moves the drag image to the new position

var
  ScreenDC: HDC;
  NewX,
  NewY,         // new position
  dX,
  dY: Integer;  // offset 
  RSamp1,
  RSamp2,       // newly added parts
  RDraw1,
  RDraw2,       // parts to be restored to background
  RScroll,
  RClip: TRect; // ScrollDC of the existent background

begin
  NewX := Target.X - FMouseSpot.X;
  NewY := Target.Y - FMouseSpot.Y;

  if not FHidden and FInDrag then
  begin                      
    dX := FOldX - NewX;
    dY := FOldY - NewY;
    if (dX <> 0) or (dY <> 0) then
    begin
      ScreenDC := GetDC(0);
      // Move distance is more than the entire height or width?
      if (Abs(dX) > FDragWidth) or (Abs(dY) > FDragHeight) then
      begin
        // new background -> BackNewDC
        BitBlt(FBackNewDC, 0, 0, FDragWidth, FDragHeight, ScreenDC, NewX, NewY, SRCCOPY);
        // work copy new background AND mask OR image -> screen
        BitBlt(FWorkDC, 0, 0, FDragWidth, FDragHeight, FBackNewDC, 0, 0, SRCCOPY);
        // mask new background
        SelectObject(FCopyDC, FHMaskBMP);
        BitBlt(FWorkDC, 0, 0, FDragWidth, FDragHeight, FCopyDC, 0, 0, SRCAND);
        // image over background / mask
        SelectObject(FCopyDC, FHPicBMP);
        BitBlt(FWorkDC, 0, 0, FDragWidth, FDragHeight, FCopyDC, 0, 0, SRCPAINT);
        // to screen
        BitBlt(ScreenDC, NewX, NewY, FDragWidth, FDragHeight, FWorkDC, 0, 0, SRCCOPY);
        // restore background at old position
        BitBlt(ScreenDC, FOldX, FOldY, FDragWidth, FDragHeight, FBackOldDC, 0, 0, SRCCOPY);
      end
      else
      begin
        // overlapping copy
        // Algorithm (example for a movement to lower left):
        //        +-------+  dX = 6 (6 pixels to the left), dY = -2 (2 pixels down)
        //        |       |
        //  ******///     |  1) move overlapping part of BackNewDC (///)
        //  *     ///     |     (here: 9 - dX = 3 pixels width, 5 - Abs(dY) = 2 pixels height
        //  *     ///-----+     -> lower left corner right upper corner
        //  *       *        2) collect new background pieces
        //  *********           RSamp1 := NewX, NewY, Width = dX, Height = PHeight
        //                      RSamp2 := NewX + dX, NewY + PHeight - Abs(dY),
        //                      Width = PWidth - dX, Height = Abs(dY);
        //                   3) TransBlt to NewX, NewY
        //                   4) remove old image parts
        //                      RDraw1 := OldX, OldY, Width = PWidth - dX, height = Abs(dY)
        //                      RDraw2 := OldX + PWidth - dX, OldY, Width = dX, Height = PHeight
        // RSamp1, RSamp2, RDraw1, RDraw2 contain in Left/Top the offsets to NewX and OldX
        // (and at the same time in BackNew and BackOld), respectively.
        // Right/Bottom are Height / Width.
        // RScroll is a "true" rectangle (absolute coordinates within BackNewDC).

        // filling the various rectangles has been moved to an own procedure because it is used twice
        FillDragRectangles(FDragWidth, FDragHeight, dX, dY, RClip, RScroll, RSamp1, RSamp2, RDraw1, RDraw2);

        // move existent background
        ScrollDC(FBackNewDC, dX, dY, RScroll, RClip, 0, nil);
        // get first and second additional rectangle from screen
        if dX = 0 then
          with RSamp2 do
            BitBlt(FBackNewDC, Left, Top, Right, Bottom, ScreenDC, NewX + Left, NewY + Top, SRCCOPY)
        else
          if dY = 0 then
            with RSamp1 do
              BitBlt(FBackNewDC, Left, Top, Right, Bottom, ScreenDC, NewX + Left, NewY + Top, SRCCOPY)
          else
          begin
            with RSamp1 do
              BitBlt(FBackNewDC, Left, Top, Right, Bottom, ScreenDC, NewX + Left, NewY + Top, SRCCOPY);
            with RSamp2 do
              BitBlt(FBackNewDC, Left, Top, Right, Bottom, ScreenDC, NewX + Left, NewY + Top, SRCCOPY);
          end;

        // work copy new background AND mask OR image -> screen
        BitBlt(FWorkDC, 0, 0, FDragWidth, FDragHeight, FBackNewDC, 0, 0, SRCCOPY);
        // mask new background
        SelectObject(FCopyDC, FHMaskBMP);
        BitBlt(FWorkDC, 0, 0, FDragWidth, FDragHeight, FCopyDC, 0, 0, SRCAND);
        // image over background / mask
        SelectObject(FCopyDC, FHPicBMP);
        BitBlt(FWorkDC, 0, 0, FDragWidth, FDragHeight, FCopyDC, 0, 0, SRCPAINT);
        // to screen
        BitBlt(ScreenDC, NewX, NewY, FDragWidth, FDragHeight, FWorkDC, 0, 0, SRCCOPY);

        // replace uncovered areas of the screen
        if dX = 0 then
          with RDraw2 do
            BitBlt(ScreenDC, FOldX + Left, FOldY + Top, Right, Bottom, FBackOldDC, Left, Top, SRCCOPY)
        else
          if dY = 0 then
            with RDraw1 do
              BitBlt(ScreenDC, FOldX + Left, FOldY + Top, Right, Bottom, FBackOldDC, Left, Top, SRCCOPY)
          else
          begin
            with RDraw1 do
              BitBlt(ScreenDC, FOldX + Left, FOldY + Top, Right, Bottom, FBackOldDC, Left, Top, SRCCOPY);
            with RDraw2 do
              BitBlt(ScreenDC, FOldX + Left, FOldY + Top, Right, Bottom, FBackOldDC, Left, Top, SRCCOPY);
          end;
      end;
      // new to old background
      BitBlt(FBackOldDC, 0, 0, FDragWidth, FDragHeight, FBackNewDC, 0, 0, SRCCOPY);
      ReleaseDC(0, ScreenDC);
    end;
  end;
  // keep new position for next move independent of whether we actually show a drag image
  FOldX := NewX;
  FOldY := NewY;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseDragDropManager.DragOver(KeyState: Integer; Pt: TPoint; var Effect: Integer): HResult;

begin
  Result := FOwner.DoDragOver(FDragSource, KeyState, dsDragMove, Pt, Effect);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseDragDropManager.DragStart(Position, Hotspot: TPoint);

// initiates an image drag operation, Position is the position of the upper left corner of the drag iamge
// and Hotspot a position within the drag image to show where's the mouse.

var
  BM: TBitmap;
  Bounds: TBounds;
  ScreenDC: HDC;
                                    
begin
  if not FInDrag and (FOwner.FDragImageKind <> diNoImage) then
  begin
    // create image and mask bitmaps
    FDragHeight := FOwner.ClientHeight;
    if FOwner.FHeader.UseColumns then
      FDragWidth := FOwner.ClientWidth
    else
      FDragWidth := Min(FOwner.GetMaxRightExtend, FOwner.ClientWidth);
      
    BM := TBitmap.Create;
    BM.PixelFormat := pfDevice;
    BM.Width := FDragWidth;
    BM.Height := FDragHeight;
    BM.Canvas.Brush.Color := FOwner.Color;
    BM.Canvas.FillRect(Rect(0, 0, FDragWidth, FDragHeight));
    Bounds.Left := 0;
    Bounds.Top := 0;
    Bounds.Width := FDragWidth;
    Bounds.Height := FDragHeight;
    FOwner.PaintTo(BM.Canvas, Bounds, True, FOwner.FDragImageKind = diMainColumnOnly, False, False);

    FMask := TBitmap.Create;
    FMask.Assign(BM);
    FMask.Mask(FOwner.Color);

    FImage := TBitmap.Create;
    FImage.Assign(BM);
    with FImage.Canvas do
    begin
      CopyMode := cmSrcAnd;
      Brush.Color := clBlack;
      Font.Color := clWhite;
      Draw(0, 0, FMask);
    end;

    BM.Free;

    // bitmaps for blitting, will be deleted on DragStop
    ScreenDC := GetDC(0);
    try
      FBackOldDC := CreateCompatibleDC(ScreenDC);
      FBackNewDC := CreateCompatibleDC(ScreenDC);

      FWorkDC := CreateCompatibleDC(ScreenDC);
      FCopyDC := CreateCompatibleDC(ScreenDC);

      if FImage.Palette <> 0 then
      begin
        SelectPalette(FBackOldDC, FImage.Palette, True);
        SelectPalette(FBackNewDC, FImage.Palette, True);
        SelectPalette(FWorkDC, FImage.Palette, True);
        SelectPalette(FCopyDC, FImage.Palette, True);
        RealizePalette(FCopyDC);
      end;
    
      FHPicBMP := CreateCompatibleBitmap(ScreenDC, FDragWidth, FDragHeight);
      FHMaskBMP := CreateCompatibleBitmap(ScreenDC, FDragWidth, FDragHeight);
      FOldWorkBMP := SelectObject(FWorkDC, FHPicBMP);
      FOldCopyBMP := SelectObject(FCopyDC, FImage.Handle);
      BitBlt(FWorkDC, 0, 0, FDragWidth, FDragHeight, FCopyDC, 0, 0, SRCCOPY);
      SelectObject(FWorkDC, FHMaskBMP);
      SelectObject(FCopyDC, FMask.Handle);
      BitBlt(FWorkDC, 0, 0, FDragWidth, FDragHeight, FCopyDC, 0, 0, SRCCOPY);
      SelectObject(FCopyDC, FOldCopyBMP);

      SelectObject(FWorkDC, CreateCompatibleBitmap(ScreenDC, FDragWidth, FDragHeight));
      FOldBackOldBMP := SelectObject(FBackOldDC, CreateCompatibleBitmap(ScreenDC, FDragWidth, FDragHeight));
      FOldBackNewBMP := SelectObject(FBackNewDC, CreateCompatibleBitmap(ScreenDC, FDragWidth, FDragHeight));

      // cursor offset
      FMouseSpot := Hotspot;
      FOldX := Position.X + 1;
      FOldY := Position.Y;

      BitBlt(FBackOldDC, 0, 0, FDragWidth, FDragHeight, ScreenDC, FOldX, FOldY, SRCCOPY);
      BitBlt(FBackNewDC, 0, 0, FDragWidth, FDragHeight, FBackOldDC, 0, 0, SRCCOPY);
    finally
      ReleaseDC(0, ScreenDC);
    end;
    
    // finally first display
    FInDrag := True;
    FHidden := False;
    DragMove(Point(Position.X, Position.Y));
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseDragDropManager.DragStop;

// stop dragging an image and restore background

begin
  // replace background
  HideDragImage;
  FInDrag := False;

  FImage.Free;
  FMask.Free;
  
  // clean all bitmaps we used during dragging
  if FCopyDC <> 0 then
  begin
    SelectObject(FCopyDC, FOldCopyBMP);
    DeleteDC(FCopyDC);
    FCopyDC := 0;
  end;
  if FWorkDC <> 0 then
  begin
    DeleteObject(SelectObject(FWorkDC, FOldWorkBMP));
    DeleteDC(FWorkDC);
    FWorkDC := 0;
  end;
  if FBackOldDC <> 0 then
  begin
    DeleteObject(SelectObject(FBackOldDC, FOldBackOldBMP));
    DeleteDC(FBackOldDC);
    FBackOldDC := 0;
    FOldBackOldBMP := 0;
  end;
  if FBackNewDC <> 0 then
  begin
    DeleteObject(SelectObject(FBackNewDC, FOldBackNewBMP));
    DeleteDC(FBackNewDC);
    FBackNewDC := 0;
    FOldBackNewBMP := 0;
  end;
  if FHPicBMP <> 0 then
  begin
    DeleteObject(FHPicBMP);
    FHPicBMP := 0;
  end;
  if FHMaskBMP <> 0 then
  begin
    DeleteObject(FHMaskBMP);
    FHMaskBMP := 0;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseDragDropManager.Drop(const DataObject: IDataObject; KeyState: Integer; Pt: TPoint;
  var Effect: Integer): HResult;

begin
  Result := FOwner.DoDragDrop(DataObject, KeyState, Pt, Effect);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseDragDropManager.DUnadvise(dwConnection: Integer): HResult;

begin
  Result := E_NOTIMPL;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseDragDropManager.EnumDAdvise(out enumAdvise: IEnumStatData): HResult;

begin
  Result := OLE_E_ADVISENOTSUPPORTED;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseDragDropManager.EnumFormatEtc(Direction: Integer; out EnumFormatEtc: IEnumFormatEtc): HResult;

begin
  Result := E_FAIL;
  if Direction = DATADIR_GET then
  begin
    EnumFormatEtc := TEnumFormatEtc.Create(FFormatEtcList.Clone);
    Result := S_OK;
  end
  else
    EnumFormatEtc := nil;
  if EnumFormatEtc = nil then
    Result := OLE_S_USEREG;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseDragDropManager.GetCanonicalFormatEtc(const FormatEtc: TFormatEtc; out FormatEtcOut: TFormatEtc): HResult;

begin
  Result := DATA_S_SAMEFORMATETC;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseDragDropManager.GetData(const FormatEtcIn: TFormatEtc; out Medium: TStgMedium): HResult;

var
  I: Integer;

begin
  try
    if FFormatEtcList.Count > 0 then
      for I := 0 to FFormatEtcList.Count - 1 do
        if (FormatEtcIn.tymed and FFormatEtcList.Items[I].tymed <> 0) and
           (FormatEtcIn.lindex = FFormatEtcList.Items[I].lindex) and
           (FormatEtcIn.dwAspect = FFormatEtcList.Items[I].dwAspect) and
           (FormatEtcIn.cfFormat = FFormatEtcList.Items[I].cfFormat) then
         begin
           Result := RenderData(FormatEtcIn, Medium);
           Exit;
         end;
    Result := DV_E_FORMATETC;
  except
    Medium.HGlobal := 0;
    Result := E_FAIL;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseDragDropManager.GetDataHere(const FormatEtc: TFormatEtc; out Medium: TStgMedium): HResult;

// It makes no sense to implement this method as the data size will vary very much and the receiver cannot know
// what size to allocate.

begin
  Result := E_NOTIMPL;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseDragDropManager.GiveFeedback(Effect: Integer): HResult;

begin
  Result := DRAGDROP_S_USEDEFAULTCURSORS;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseDragDropManager.GetDataSourceTree(DataObject: IDataObject): TBaseVirtualTree;

// returns the owner/sender of the given data object by means of a special clipboard format
// or nil if the sender is in another process or no virtual tree at all

var
  Medium: TStgMedium;
  Data: PVTReference;

begin
  Result := nil;
  if Assigned(DataObject) then
  begin
    StandardOLEFormat.cfFormat := CF_VTREFERENCE;
    if DataObject.GetData(StandardOLEFormat, Medium) = S_OK then
    begin
      Data := GlobalLock(Medium.hGlobal);
      // skip data size value
      Inc(PCardinal(Data));
      if Assigned(Data) then
      begin
        if Data.Process = GetCurrentProcessID then
          Result := Data.Tree;
        GlobalUnlock(Medium.hGlobal);
      end;
      ReleaseStgMedium(Medium);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseDragDropManager.HideDragImage;

// hides drag image and restores screen

var
  ScreenDC: HDC;

begin
  if FInDrag and not FHidden then
  begin
    FHidden := True;
    ScreenDC := GetDC(0);
    BitBlt(ScreenDC, FOldX, FOldY, FDragWidth, FDragHeight, FBackOldDC, 0, 0, SRCCOPY);
    ReleaseDC(0, ScreenDC);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseDragDropManager.QueryContinueDrag(EscapePressed: BOOL; KeyState: Integer): HResult;

var
  RButton,
  LButton: Boolean;
  P: TPoint;

begin
  LButton := (KeyState and MK_LBUTTON) <> 0;
  RButton := (KeyState and MK_RBUTTON) <> 0;

  // Drag'n drop canceled by pressing both mouse buttons or Esc?
  if (LButton and RButton) or EscapePressed then
    Result := DRAGDROP_S_CANCEL
  else
    // drag'n drop finished?
    if not (LButton or RButton) then
      Result := DRAGDROP_S_DROP
    else
      Result := S_OK;
      
  if Result = S_OK then
  begin
    GetCursorPos(P);
    DragMove(P);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseDragDropManager.QueryGetData(const FormatEtc: TFormatEtc): HResult;

const
  DVError: array[0..3] of HResult = (DV_E_FORMATETC, DV_E_TYMED, DV_E_DVASPECT, DV_E_LINDEX);

var
  I, J: Integer;

begin
  J := 0;
  if FFormatEtcList.Count > 0 then
    for I := 0 to FFormatEtcList.Count - 1 do
      if FormatEtc.cfFormat = FFormatEtcList.Items[I].cfFormat then
      begin
        if (FormatEtc.tymed and FFormatEtcList.Items[I].tymed) <> 0 then
        begin
          if FormatEtc.dwAspect = FFormatEtcList.Items[I].dwAspect then
          begin
            if FormatEtc.lindex = FFormatEtcList.Items[I].lindex then
            begin
              Result := S_OK;
              Exit;
            end
            else
              if J < 3 then
                J := 3;
          end
          else
            if J < 2 then
              J := 2;
        end
        else
          if J < 1 then
            J := 1;
      end;
      
  Result := DVError[J];
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseDragDropManager.SetData(const FormatEtc: TFormatEtc; var Medium: TStgMedium; DoRelease: BOOL): HResult;

var
  I: Integer;
  AddData: Boolean;
  
begin
  Result := E_FAIL;
  if not DoRelease then
  begin
    AddData := True;
    if FFormatEtcList.Count > 0 then
      for I := 0 to FFormatEtcList.Count - 1 do
        if FFormatEtcList.Items[I].cfFormat = FormatEtc.cfFormat then
        begin
          AddData := False;
          FFormatEtcList.Items[I] := FormatEtc;
        end;
    if AddData then
      FFormatEtcList.Add(FormatEtc);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseDragDropManager.InvalidateDragImage(R: TRect);

// refreshs the current drag image (if there is one) to take a changed background into account
// Note: the passed rectangle is given in screen coordinates.

var
  TargetPos: TPoint;
  ScreenDC: HDC;
  W, H: Integer;

begin
  if FInDrag and not FHidden then
  begin
    IntersectRect(R, R, Rect(FOldX, FOldY, FOldX + FDragWidth, FOldY + FDragHeight));
    // determine position of the area in the drag image which must be updated
    TargetPos := Point(R.Left - FOldX, R.Top - FOldY);

    ScreenDC := GetDC(0);
    with R do
    begin
      W := Right - Left;
      H := Bottom - Top;
    end;
    with TargetPos do
    begin
      BitBlt(FBackOldDC, X, Y, W, H, ScreenDC, R.Left, R.Top, SRCCOPY);
      BitBlt(FBackNewDC, X, Y, W, H, FBackOldDC, X, Y, SRCCOPY);
      // work copy new background AND mask OR image -> screen
      BitBlt(FWorkDC, X, Y, W, H, FBackNewDC, X, Y, SRCCOPY);
      // mask new background
      SelectObject(FCopyDC, FHMaskBMP);
      BitBlt(FWorkDC, X, Y, W, H, FCopyDC, X, Y, SRCAND);
      // image over background / mask...
      SelectObject(FCopyDC, FHPicBMP);
      BitBlt(FWorkDC, X, Y, W, H, FCopyDC, X, Y, SRCPAINT);
      // ...and blit to the screen
      BitBlt(ScreenDC, R.Left, R.Top, W, H, FWorkDC, X, Y, SRCCOPY);
    end;
    ReleaseDC(0, ScreenDC);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseDragDropManager.ShowDragImage;

// shows the drag image after it has been hidden by HideDragImage
// Note: there might be a new background now.

var
  ScreenDC: HDC;

begin
  if FInDrag and FHidden then
  begin
    ScreenDC := GetDC(0);
    BitBlt(FBackOldDC, 0, 0, FDragWidth, FDragHeight, ScreenDC, FOldX, FOldY, SRCCOPY);
    BitBlt(FBackNewDC, 0, 0, FDragWidth, FDragHeight, FBackOldDC, 0, 0, SRCCOPY);
    // work copy new background AND mask OR image -> screen
    BitBlt(FWorkDC, 0, 0, FDragWidth, FDragHeight, FBackNewDC, 0, 0, SRCCOPY);
    // mask new background
    SelectObject(FCopyDC, FHMaskBMP);
    BitBlt(FWorkDC, 0, 0, FDragWidth, FDragHeight, FCopyDC, 0, 0, SRCAND);
    // image over background / mask...
    SelectObject(FCopyDC, FHPicBMP);
    BitBlt(FWorkDC, 0, 0, FDragWidth, FDragHeight, FCopyDC, 0, 0, SRCPAINT);
    // ...and blit to the screen
    BitBlt(ScreenDC, FOldX, FOldY, FDragWidth, FDragHeight, FWorkDC, 0, 0, SRCCOPY);
    ReleaseDC(0, ScreenDC);
    FHidden := False;
  end;
end;

//----------------- TVTDragDropManager ---------------------------------------------------------------------------------

function TVTDragDropManager.RenderData(FormatEtc: TFormatEtc; var StgMedium: TStgMedium): HResult;

// Returns a memory expression of all currently selected nodes of the owner tree in the StgMedium structure.
// Note: The memory requirement of this method might be very high as we need to render first all nodes to local memory
//       and copy this then to global memory in StgMedium, because we have first to determine how much memory we need
//       before we can allocate it. Hence for a short moment we need twice the space as used by the nodes alone
//       (plus the amount the nodes need in the tree anyway!).

var
  Data: PWideChar;
  I, J,
  TabCount: Integer;
  SW, TabsW,
  ResStringW: WideString;
  ResStringA: String;
  RenderColumns,
  StoreResSize: Boolean;
  ColCount: Integer;
  ResPointer: Pointer;
  ResSize: Integer;
  Selection: TNodeArray;

  Stream: TMemoryStream;
  RefInfo: TVTReference;
  
begin
  Selection := nil;
  Stream := nil;
  try
    try
      RenderColumns := FOwner.FHeader.UseColumns;
      ColCount := 0;
      if RenderColumns then
        ColCount := FOwner.FHeader.FColumns.Count;
      // storing the actual res size is needed for correct retrival (but not for text)
      StoreResSize := True;
        
      case FormatEtc.cfFormat of
        CF_UNICODETEXT,
        CF_TEXT:
          begin
            StoreResSize := False;
            with FOwner as TCustomVirtualStringTree do
            begin
              // first retrieve the data to render
              ResStringW := '';
              // if the owner is currently dragging then use the selection otherwise the cut/copy set
              if tsDragging in FOwner.FStates then
                Selection := FOwner.GetSortedSelection(False)
              else
                Selection := FOwner.GetSortedCutCopySet(False);
              for J := 0 to High(Selection) do
              begin
                if RenderColumns then
                  DoGetText(Selection[J], 0, ttNormal, SW)
                else
                  DoGetText(Selection[J], -1, ttNormal, SW);
                // add a tabulator for each level of the node
                TabCount := GetNodeLevel(Selection[J]);
                // don't use StringOfChar here or all wide strings will be translated to ANSI and back
                // to Unicode with the disastrous result of loosing all characters > 255
                SetLength(TabsW, TabCount);
                for I := 1 to TabCount do
                  TabsW[I] := #9;
                ResStringW := ResStringW + TabsW + SW;
                if RenderColumns then
                begin
                  I := 1;
                  while I < ColCount do
                  begin
                    DoGetText(Selection[J], I, ttNormal, SW);
                    ResStringW := ResStringW + #9 + SW;
                    Inc(I);
                  end;
                end;
                ResStringW := ResStringW + #13;
              end;
              ResStringW := ResStringW + #0;

              if FormatEtc.cfFormat = CF_TEXT then
              begin
                // convert wide string to ANSI string
                ResStringA := ResStringW;
                ResPointer := PChar(ResStringA);
                ResSize := Length(ResStringA);
              end
              else
              begin
                ResPointer := PWideChar(ResStringW);
                // add two bytes for the terminating null
                ResSize := 2 * Length(ResStringW) + 2;
              end;
            end;
          end;
      else
        if FormatEtc.cfFormat = CF_VIRTUALTREE then
        begin
          // store nodes in our native format
          Stream := TMemoryStream.Create;
          with FOwner do
          begin
            // if the owner is currently dragging then use the selection otherwise the cut/copy set
            if tsDragging in FOwner.FStates then
              Selection := FOwner.GetSortedSelection(True)
            else
              Selection := FOwner.GetSortedCutCopySet(True);
            for I := 0 to High(Selection) do
              WriteNode(Stream, Selection[I]);
          end;
          ResPointer := Stream.Memory;
          ResSize := Stream.Position;
        end
        else
          if FormatEtc.cfFormat = CF_VTREFERENCE then
          begin
            // a target tree request information about the manager's owner tree
            RefInfo.Process := GetCurrentProcessID;
            RefInfo.Tree := FOwner;
            ResPointer := @RefInfo;
            ResSize := SizeOf(RefInfo);
          end
          else
          begin
            // fail the method if we cannot supply an appropriate format
            ResPointer := nil;
            ResSize := 0;
          end;
      end;

      // allocate memory to hold the string
      if ResSize > 0 then
      begin
        if StoreResSize then
          StgMedium.hGlobal := GlobalAlloc(GHND or GMEM_SHARE, ResSize + SizeOf(Cardinal))
        else
          StgMedium.hGlobal := GlobalAlloc(GHND or GMEM_SHARE, ResSize);
        Data := GlobalLock(StgMedium.hGlobal);

        if StoreResSize then
        begin
          PCardinal(Data)^ := ResSize;
          Inc(PCardinal(Data));
        end;
        Move(ResPointer^, Data^, ResSize);
        GlobalUnlock(StgMedium.hGlobal);
        StgMedium.tymed := TYMED_HGLOBAL;
        StgMedium.unkForRelease := nil;
        // Note: the source data just copied is either the stream released on exit, a string
        //       released by Delphi or a local variable which does not need to be released.
        Result := S_OK;
      end
      else
        Result := E_FAIL;
    except
      Result := E_FAIL;
    end;
  finally
    Stream.Free;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTDragDropManager.SetOLEFormats(Formats: TOLEFormats);

// since the application can choose which formats are to be supplied to OLE operation, these formats must be
// switchable which happens here

begin
  FFormatEtcList.Clear;

  // our special back reference format must always be registered
  // to get the reference under all circumstances
  StandardOLEFormat.cfFormat := CF_VTREFERENCE;
  FFormatEtcList.Add(StandardOLEFormat);

  if ofNative in Formats then
  begin
    // this is our native format
    StandardOLEFormat.cfFormat := CF_VIRTUALTREE;
    FFormatEtcList.Add(StandardOLEFormat);
  end;

  if ofUnicodeText in Formats then
  begin
    // better than nothing...
    StandardOLEFormat.cfFormat := CF_UNICODETEXT;
    FFormatEtcList.Add(StandardOLEFormat);
  end;

  if ofText in Formats then
  begin
    // to have at least one format for aged programs under aged OS' (Win9x)
    StandardOLEFormat.cfFormat := CF_TEXT;
    FFormatEtcList.Add(StandardOLEFormat);
  end;
end;

//----------------- TVirtualTreeHintWindow -----------------------------------------------------------------------------

constructor TVirtualTreeHintWindow.Create(AOwner: TComponent);

begin
  inherited;
  FBackground := TBitmap.Create;
  FBackground.PixelFormat := pf24Bit;
  FDrawBuffer := TBitmap.Create;
  FDrawBuffer.PixelFormat := pf24Bit;
  FTarget := TBitmap.Create;
  FTarget.PixelFormat := pf24Bit;

  DoubleBuffered := False; // we do our own double buffering
end;

//----------------------------------------------------------------------------------------------------------------------

destructor TVirtualTreeHintWindow.Destroy;

begin
  FDrawBuffer.Free;
  FBackground.Free;
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeHintWindow.ActivateHint(Rect: TRect; const AHint: String);

var
  DC: HDC;

begin
  if tsHintCancelling in FHintData.Tree.FStates then
    Exit;

  FCurrentStep := 0;
  SetWindowPos(Handle, HWND_TOPMOST, Rect.Left, Rect.Top, Width, Height, SWP_HIDEWINDOW or SWP_NOACTIVATE);

  Caption := AHint;
  UpdateBoundsRect(Rect);
  if Rect.Top + Height > Screen.DesktopHeight then
    Rect.Top := Screen.DesktopHeight - Height;
  if Rect.Left + Width > Screen.DesktopWidth then
    Rect.Left := Screen.DesktopWidth - Width;
  if Rect.Left < Screen.DesktopLeft then
    Rect.Left := Screen.DesktopLeft;
  if Rect.Bottom < Screen.DesktopTop then
    Rect.Bottom := Screen.DesktopTop;

  // adjust sizes of bitmaps
  FDrawBuffer.Width := Width;
  FDrawBuffer.Height := Height;
  FBackground.Width := Width;
  FBackground.Height := Height;
  FTarget.Width := Width;
  FTarget.Height := Height;

  // capture screen
  DC := GetDC(0);
  try
    with Rect do
      BitBlt(FBackground.Canvas.Handle, 0, 0, Width, Height, DC, Left, Top, SRCCOPY);
  finally
    ReleaseDC(0, DC);
  end;

  SetWindowPos(Handle, HWND_TOPMOST, Rect.Left, Rect.Top, Width, Height, SWP_SHOWWINDOW or SWP_NOACTIVATE);
  if FHintData.Tree.FAnimationType = hatNone then
  begin
    FCurrentStep := 15;
    InvalidateRect(Handle, nil, False);
  end
  else
  begin
    repeat
      InvalidateRect(Handle, nil, False);
      Perform(WM_PAINT, 0, 0);
      if FCurrentStep >= 15 then
        Break;
      Sleep(5);
      // handling messages in the loop makes the hint window much more responsive
      Application.ProcessMessages;
      Inc(FCurrentStep);
    until False;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeHintWindow.CalcHintRect(MaxWidth: Integer; const AHint: String; AData: Pointer): TRect;

var
  Size: TSize;

begin
  FHintData := PHintData(AData)^;

  if tsHintCancelling in FHintData.Tree.FStates then
    Exit;

  with FHintData do
  begin
    // The draw tree gets its hint size by the application.
    // This size has already been determined in CMHintShow.
    if Tree is TCustomVirtualDrawTree then
      Result := HintRect 
    else
    begin
      if (Node = nil) or (Tree.FHintMode <> hmToolTip) then
        {$ifndef DFS_COMPILER_5_UP}
        Canvas.Font := HintFont
        {$else}
        Canvas.Font := Screen.HintFont
        {$endif}
      else
        if (Tree is TCustomVirtualStringTree) and
           Assigned(TVirtualStringTree(Tree).FOnGetDrawInfo) and
           (voCustomizeItems in TVirtualStringTree(Tree).FOptions) then
        with TVirtualStringTree(Tree) do
        begin
          FDrawInfo.Font.Assign(Font);
          DoGetDrawInfo(Node, Column, ttNormal, FDrawInfo);
          Self.Canvas.Font := FDrawInfo.Font;
        end
        else
          Canvas.Font := Font;

      if DefaultHint <> '' then
        HintText := DefaultHint
      else
        if Tree.HintMode = hmToolTip then
          HintText := Tree.DoGetNodeToolTip(Node, Column)
        else
          HintText := Tree.DoGetNodeHint(Node, Column);

      if Length(HintText) = 0 then
        Result := Rect(0, 0, 0, 0)
      else
      begin
        GetTextExtentPoint32W(Canvas.Handle, PWideChar(HintText), Length(HintText), Size);

        if Size.cx > MaxWidth then
          Size.cx := MaxWidth;
        if Assigned(Node) then
          Result := Rect(0, 0, Size.cx + 8, Node.NodeHeight + 2)
        else
          Result := Rect(0, 0, Size.cx + 8, Size.cy + 4);
      end;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeHintWindow.CMTextChanged(var Message: TMessage);

begin
  // swallow this message to prevent the ancestor from resizing the window (we don't use the caption anyway)
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeHintWindow.WMEraseBkgnd(var Message: TWMEraseBkgnd);

// the control is fully painted by own code so don't erase its background as this causes flickering

begin
  Message.Result := 1;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeHintWindow.WMNCPaint(var Message: TMessage);

// the control is fully painted by own code so don't paint any borders

begin
  Message.Result := 0;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeHintWindow.IsHintMsg(var Msg: TMsg): Boolean;

// the VCL is a bit too generous when telling that an existing hint can be cancelled, need to specify further here

begin
  Result := inherited IsHintMsg(Msg) and not (tsHintCancelling in FHintData.Tree.FStates);
  if Msg.message = WM_NCMOUSEMOVE then
    Result := False;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeHintWindow.CreateParams(var Params: TCreateParams);

begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := WS_POPUP;
    WindowClass.Style := WindowClass.Style or CS_SAVEBITS;
    AddBiDiModeExStyle(ExStyle);
    ExStyle := Params.ExStyle or WS_EX_TOOLWINDOW and not WS_EX_CLIENTEDGE;
  end;                
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeHintWindow.Paint;

var
  R: TRect;
  Flags: Integer;
  Y: Integer;
  S: WideString;

  //--------------- local function --------------------------------------------

  procedure DoBlend(Target, Source1, Source2: TBitmap; Value: Integer);

  // Simple alpha blending of two source bitmaps into Target by Value degree.
  // Note: this is by far not the fastest blending method, but does its job here.
  //       I don't want to implement a full blown MMX aware blend version
  //       with global lookup tables etc. You know, it's just for hints...

  var
    X, Y: Integer;
    Difference: Integer;
    SourceRun1,
    SourceRun2,
    TargetRun: PByte;

  begin
    Difference := 16 - Value;
    for Y := 0 to Source1.Height - 1 do
    begin
      SourceRun1 := Source1.ScanLine[Y];
      SourceRun2 := Source2.ScanLine[Y];
      TargetRun := Target.ScanLine[Y];
      for X := 0 to Source1.Width - 1 do
      begin
        TargetRun^ := (SourceRun1^ * Value + SourceRun2^ * Difference) div 16;
        Inc(TargetRun);
        Inc(SourceRun1);
        Inc(SourceRun2);
        TargetRun^ := (SourceRun1^ * Value + SourceRun2^ * Difference) div 16;
        Inc(TargetRun);
        Inc(SourceRun1);
        Inc(SourceRun2);
        TargetRun^ := (SourceRun1^ * Value + SourceRun2^ * Difference) div 16;
        Inc(TargetRun);
        Inc(SourceRun1);
        Inc(SourceRun2);
      end;
    end;
  end;

  //--------------- end local function ----------------------------------------

begin
  with FHintData, FDrawBuffer do
  begin
    if tsHintCancelling in Tree.FStates then
      Exit;

    // do actual painting only in the very first and very last run
    if FCurrentStep in [0, 15] then
    begin
      // if the given node is nil then we have to display a header hint
      if Node = nil then
      begin
        {$ifndef DFS_COMPILER_5_UP}
        Canvas.Font := HintFont;
        {$else}
        Canvas.Font := Screen.HintFont;
        {$endif}
        Y := (Integer(Self.Height) - Abs(Canvas.Font.Height)) div 2 - 1;
      end
      else
      begin
        Tree.GetTextInfo(Node, Column, Canvas.Font, R, S);
        Y := (Integer(Self.Height) - (R.Bottom - R.Top)) div 2;
      end;

      R := Self.ClientRect;

      Flags := ETO_CLIPPED;
      if UseRightToLeftReading then
        Flags := Flags or ETO_RTLREADING;

      if Tree is TCustomVirtualDrawTree then
      begin
        // the draw tree has by default no hint text so let it draw the hint itself
        (Tree as TCustomVirtualDrawTree).DoDrawHint(Canvas, Node, R, Column);
      end
      else
        with Canvas do
        begin
          // still force tooltip text color
          Font.Color := clInfoText;
          Pen.Color := clBlack;
          Brush.Color := clInfoBk;
          Rectangle(R);
          // need to take the extra border around the window into account when specifying the text position
          ExtTextOutW(Handle, R.Left + 4, R.Top + Y, Flags, @R, PWideChar(HintText), Length(HintText), nil);
        end;
    end;
  end;

  if FCurrentStep < 15 then
  begin
    if FHintData.Tree.FAnimationType = hatFade then
    begin
      DoBlend(FTarget, FDrawBuffer, FBackground, FCurrentStep);
      Canvas.Draw(0, 0, FTarget);
    end
    else
    begin
      // slide is done by blitting FCurrentStep-percent of the lower part of the hint window
      // and fill the rest with the screen background

      // 1) calculate absolute split point in pixels
      Y := MulDiv(Height, FCurrentStep, 15);
      // 2) blit hint bitmap to the hint canvas
      BitBlt(Canvas.Handle, 0, 0, Width, Y, FDrawBuffer.Canvas.Handle, 0, Height - Y, SRCCOPY);
      // 3) blit background rest to hint canvas
      BitBlt(Canvas.Handle, 0, Y, Width, Height - Y, FBackground.Canvas.Handle, 0, Y, SRCCOPY);
    end;
  end
  else
    Canvas.Draw(0, 0, FDrawBuffer);
end;

//----------------- TVirtualTreeColumn ---------------------------------------------------------------------------------

constructor TVirtualTreeColumn.Create(Collection: TCollection);

begin
  inherited Create(Collection);
  FWidth := 50;
  FMaxWidth := 10000;
  FImageIndex := -1;
  FMargin := -1;
  FSpacing := 4;
  FText := '';
  FOptions := DefaultColumnOptions;
  ParentBiDiModeChanged;
end;

//----------------------------------------------------------------------------------------------------------------------

destructor TVirtualTreeColumn.Destroy;

begin
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.Assign(Source: TPersistent);

begin
  if Source is TVirtualTreeColumn then
  begin
    TVirtualTreeColumns(Collection).ValidatePositions;

    BiDiMode := TVirtualTreeColumn(Source).BiDiMode;
    ImageIndex := TVirtualTreeColumn(Source).ImageIndex;
    Layout := TVirtualTreeColumn(Source).Layout;
    Margin := TVirtualTreeColumn(Source).Margin;
    MaxWidth := TVirtualTreeColumn(Source).MaxWidth;
    MinWidth := TVirtualTreeColumn(Source).MinWidth;
    Position := TVirtualTreeColumn(Source).Position;
    Spacing := TVirtualTreeColumn(Source).Spacing;
    Style := TVirtualTreeColumn(Source).Style;
    Text := TVirtualTreeColumn(Source).Text;
    Hint := TVirtualTreeColumn(Source).Hint;
    Width := TVirtualTreeColumn(Source).Width;
    Options := TVirtualTreeColumn(Source).Options;

    Changed(False);
  end
  else
    inherited Assign(Source);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.SetBiDiMode(Value: TBiDiMode);

begin
  if Value <> FBiDiMode then
  begin
    FBiDiMode := Value;
    Exclude(FOptions, coParentBiDiMode);
    Changed(False);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumn.IsBiDiModeStored: Boolean;

begin
  Result := not (coParentBiDiMode in FOptions);
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumn.GetRect: TRect;

// returns the rectangle this column occupies in the header (relative to (0, 0) of the non-client area)

begin
  with TVirtualTreeColumns(GetOwner).FOwner do
  begin
    Result := FOwner.GetHeaderRect;
    Inc(Result.Left, Left);
    Result.Right := Result.Left + FWidth;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.LoadFromStream(const Stream: TStream);

var
  Dummy: Integer;
  NewOptions: TVTColumnOptions absolute Dummy; // little trick to have the options always 32bit, see comment below
  S: WideString;

begin
  with Stream do
  begin
    ReadBuffer(Dummy, SizeOf(Dummy));
    SetLength(S, Dummy);
    ReadBuffer(PWideChar(S)^, 2 * Dummy);
    Text := S;
    ReadBuffer(Dummy, SizeOf(Dummy));
    SetLength(FHint, Dummy);
    ReadBuffer(PWideChar(FHint)^, 2 * Dummy);
    ReadBuffer(Dummy, SizeOf(Dummy));
    Width := Dummy;
    ReadBuffer(Dummy, SizeOf(Dummy));
    MinWidth := Dummy;
    ReadBuffer(Dummy, SizeOf(Dummy));
    MaxWidth := Dummy;
    ReadBuffer(Dummy, SizeOf(Dummy));
    Style := TVirtualTreeColumnStyle(Dummy);
    ReadBuffer(Dummy, SizeOf(Dummy));
    ImageIndex := Dummy;
    ReadBuffer(Dummy, SizeOf(Dummy));
    Layout := TButtonLayout(Dummy);
    ReadBuffer(Dummy, SizeOf(Dummy));
    Margin := Dummy;
    ReadBuffer(Dummy, SizeOf(Dummy));
    Spacing := Dummy;
    ReadBuffer(Dummy, SizeOf(Dummy));
    BiDiMode := TBiDiMode(Dummy);
    // Here I use a little trick to have the options also being 32 bit to be flexible for future enhancements.
    // Dummy and NewOptions share the same memory location, hence I can load into one and use the other for
    // the assignment (simple type cast is not allowed).
    ReadBuffer(Dummy, SizeOf(Dummy));
    Options := NewOptions;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.ParentBiDiModeChanged;

begin
  if coParentBiDiMode in FOptions then
  begin
    if GetOwner <> nil then
    begin
      BiDiMode := TVirtualTreeColumns(GetOwner).FOwner.Fowner.BiDiMode;
      // this option might have been reset
      Include(FOptions, coParentBidiMode);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.SaveToStream(const Stream: TStream);

var
  Dummy: Integer;
  SaveOptions: TVTColumnOptions absolute Dummy; // little trick to have the options always 32bit, see comment below

begin
  with Stream do
  begin
    Dummy := Length(FText);
    WriteBuffer(Dummy, SizeOf(Dummy));
    WriteBuffer(PWideChar(FText)^, 2 * Dummy);
    Dummy := Length(FHint);
    WriteBuffer(Dummy, SizeOf(Dummy));
    WriteBuffer(PWideChar(FHint)^, 2 * Dummy);
    WriteBuffer(FWidth, SizeOf(FWidth));
    WriteBuffer(FMinWidth, SizeOf(FMinWidth));
    WriteBuffer(FMaxWidth, SizeOf(FMaxWidth));
    Dummy := Ord(FStyle);
    WriteBuffer(Dummy, SizeOf(Dummy));
    Dummy := FImageIndex;
    WriteBuffer(Dummy, SizeOf(Dummy));
    Dummy := Ord(FLayout);
    WriteBuffer(Dummy, SizeOf(Dummy));
    WriteBuffer(FMargin, SizeOf(FMargin));
    WriteBuffer(FSpacing, SizeOf(FSpacing));
    Dummy := Ord(FBiDiMode);
    WriteBuffer(Dummy, SizeOf(Dummy));
    // see comment in LoadFromStream about this way to store and load the options
    Dummy := 0;
    SaveOptions := FOptions;
    WriteBuffer(Dummy, SizeOf(Dummy));
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumn.UseRightToLeftReading: Boolean;

begin
  Result := SysLocale.MiddleEast and (FBiDiMode <> bdLeftToRight);
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumn.UseRightToLeftAlignment: Boolean;

begin
  Result := SysLocale.MiddleEast and (FBiDiMode = bdRightToLeft);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.DefineProperties(Filer: TFiler);

begin
  inherited;
  
  // Must define a new name for the properties otherwise the VCL will try to load the wide string
  // without asking us and screws it completely up.
  Filer.DefineProperty('WideText', ReadText, WriteText, FText <> '');
  Filer.DefineProperty('WideHint', ReadHint, WriteHint, FHint <> '');
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumn.GetDisplayName: String;

// returns always the column id as the IDE still cannot handle Unicode strings

begin
  Result := Format('Column %d', [Index]);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.ReadText(Reader: TReader);

begin
  case Reader.NextValue of
    vaLString, vaString:
      SetText(Reader.ReadString);
  else
    SetText(Reader.ReadWideString);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.ReadHint(Reader: TReader);

begin
  case Reader.NextValue of
    vaLString, vaString:
      FHint := Reader.ReadString;
  else
    FHint := Reader.ReadWideString;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.WriteHint(Writer: TWriter);

begin
  Writer.WriteWideString(FHint);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.WriteText(Writer: TWriter);

begin
  Writer.WriteWideString(FText);
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumn.GetLeft: Integer;

// determine left position of this column depending on the column order

var
  I: Integer;

begin
  with TVirtualTreeColumns(Collection) do
  begin
    Result := FOwner.FOwner.FOffsetX;
    // add all widths of columns which are visible and before this column
    for I := 0 to Count - 1 do
      if FColumnPositions[I] = Cardinal(Index) then
        Break
      else
        if coVisible in Items[FColumnPositions[I]].FOptions then
          Inc(Result, Items[FColumnPositions[I]].Width);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumn.GetRight: Integer;

begin
  Result := Left + FWidth;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.SetMaxWidth(Value: Integer);

begin
  if Value < FMinWidth then
    Value := FMinWidth;
  if Value > 10000 then
    Value := 10000;
  FMaxWidth := Value;
  SetWidth(FWidth);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.SetMinWidth(Value: Integer);

begin
  if Value < 0 then
    Value := 0;
  if Value > FMaxWidth then
    Value := FMaxWidth;
  FMinWidth := Value;
  SetWidth(FWidth);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.SetSpacing(Value: Integer);

begin
  if FSpacing <> Value then
  begin
    FSpacing := Value;
    Changed(False);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.SetStyle(Value: TVirtualTreeColumnStyle);

begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    Changed(False);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumn.GetPosition: Cardinal;

var
  I: Integer;

begin
  with TVirtualTreeColumns(Collection) do
  begin
    Result := Index;
    for I := 0 to High(FColumnPositions) do
      if FColumnPositions[I] = Result then
      begin
        Result := I;
        Break;
      end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.SetOptions(Value: TVTColumnOptions);

var
  ToBeSet,
  ToBeCleared: TVTColumnOptions;

begin
  if FOptions <> Value then
  begin
    ToBeCleared := FOptions - Value;
    ToBeSet := Value - FOptions;

    FOptions := Value;

    if coParentBidiMode in (ToBeSet + ToBeCleared) then
     ParentBiDiModeChanged;
     
    Changed(False);
    // need to repaint and adjust the owner tree too
    with TVirtualTreeColumns(Collection).FOwner.FOwner do
      if not (csLoading in ComponentState) and (coVisible in (ToBeSet + ToBeCleared)) then
      begin
        Invalidate;
        UpdateHorizontalScrollBar(False);
      end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.SetPosition(Value: Cardinal);

begin
  if Value >= Cardinal(Collection.Count) then
    Value := Collection.Count - 1;
  if Position <> Value then
    with TVirtualTreeColumns(Collection) do
    begin
      ValidatePositions;
      AdjustPosition(Self, Value);
      // need to repaint and adjust the owner tree too
      with FOwner do
      begin
        if not (csLoading in FOwner.ComponentState) then
        begin
          FOwner.CancelEditNode;
          Invalidate(Self);
          FOwner.Invalidate;
          FOwner.UpdateHorizontalScrollBar(False);
        end;
      end;
    end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.SetText(const Value: WideString);

begin
  if FText <> Value then
  begin
    FText := Value;
    Changed(False);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.SetWidth(Value: Integer);

begin
  if Value < FMinWidth then
    Value := FMinWidth;
  if Value > FMaxWidth then
    Value := FMaxWidth;
  if FWidth <> Value then
  begin
    FWidth := Value;
    // The following call directly reaches through to the tree. From the sight of structuring this is
    // not very good design as it leaves out two levels, but from the view of efficiency and clearness this *is* good
    // design, because it makes absolutely no sense to redirect a call twice without need
    // but only to conform to structural design patterns. Unfortunately, published events of the collection or the
    // header aren't shown in the object inspector hence I have to use an event located in the tree.
    TVirtualTreeColumns(Collection).FOwner.FOwner.DoColumnResize(Index);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.SetImageIndex(Value: TImageIndex);

begin
  if Value <> FImageIndex then
  begin
    FImageIndex := Value;
    Changed(False);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.SetLayout(Value: TButtonLayout);

begin
  if FLayout <> Value then
  begin
    FLayout := Value;
    Changed(False);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumn.SetMargin(Value: Integer);

begin
  if FMargin <> Value then
  begin
    FMargin := Value;
    Changed(False);
  end;
end;

//----------------- TVirtualTreeColumns --------------------------------------------------------------------------------

constructor TVirtualTreeColumns.Create(AOwner: TVTHeader);

begin
  inherited Create(TVirtualTreeColumn);
  FOwner := AOwner;
  FHeaderBitmap := TBitmap.Create;
  FHoverIndex := InvalidColumn;
  FClickIndex := InvalidColumn;
  FDropTarget := InvalidColumn;
end;

//----------------------------------------------------------------------------------------------------------------------

destructor TVirtualTreeColumns.Destroy;

begin
  FHeaderBitmap.Free;
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumns.GetItem(Index: Integer): TVirtualTreeColumn;

begin
  Result := TVirtualTreeColumn(inherited GetItem(Index));
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumns.Add: TVirtualTreeColumn;

begin
  Result := TVirtualTreeColumn(inherited Add);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumns.Assign(Source: TPersistent);

begin
  // let the collection class assign the items
  inherited;
  if Source is TVirtualTreeColumns then
  begin
    // copying the position array is the only needed task here
    FColumnPositions := Copy(TVirtualTreeColumns(Source).FColumnPositions, 0, MaxInt);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumns.LoadFromStream(const Stream: TStream);

var
  I,
  ItemCount: Integer;
  
begin
  Clear;
  Stream.ReadBuffer(ItemCount, SizeOf(ItemCount));
  // number of columns
  if ItemCount > 0 then
  begin
    for I := 0 to ItemCount - 1 do
      TVirtualTreeColumn(Add).LoadFromStream(Stream);

    SetLength(FColumnPositions, ItemCount);
    Stream.ReadBuffer(FColumnPositions[0], ItemCount * SizeOf(Cardinal));
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumns.SaveToStream(const Stream: TStream);

var
  I: Integer;
  
begin
  I := Count;
  Stream.WriteBuffer(I, SizeOf(I));
  if I > 0 then
  begin
    for I := 0 to Count - 1 do
      TVirtualTreeColumn(Items[I]).SaveToStream(Stream);

    Stream.WriteBuffer(FColumnPositions[0], Count * SizeOf(Cardinal));
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumns.TotalWidth: Integer;

var
  I: Integer;

begin
  Result := 0;
  for I := 0 to Count - 1 do
    if coVisible in Items[FColumnPositions[I]].FOptions then
      Inc(Result, Items[FColumnPositions[I]].Width);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumns.AdjustAutoSize;

// Called only if the header is in auto-size mode which means a column needs to be so large
// that it fills all the horizontal space not occupied by the other columns.

var
  AutoIndex,
  Index,
  RestWidth: Integer;

begin
  if Count > 0 then
  begin
    AutoIndex := FOwner.FAutoSizeIndex;
    if AutoIndex >= Count then
      AutoIndex := Count - 1;
    if FOwner.FOwner.HandleAllocated then
      RestWidth := FOwner.FOwner.ClientWidth
    else
      RestWidth := FOwner.FOwner.Width;

    // go through all columns and calculate the rest space remaining
    for Index := 0 to Count - 1 do
      if (Index <> AutoIndex) and
         (coVisible in Items[Index].FOptions) then
        Dec(RestWidth, Items[Index].Width);

    Items[AutoIndex].FWidth := Max(0, RestWidth);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumns.AdjustClickColumn(P: TPoint): Boolean;

// determines the index of the column where the mouse was over when a mouse button was pressed and returns True if the
// there was a hit otherwise False

var
  NewClickIndex: Integer;

begin
  Result := False;
  // convert to local coordinates
  Inc(P.Y, FOwner.FHeight);
  NewClickIndex := ColumnFromPosition(P);
  if (NewClickIndex > -1) and
     (coAllowClick in Items[NewClickIndex].FOptions) and
     (coEnabled in Items[NewClickIndex].FOptions) and
     (NewClickIndex <> FClickIndex) then
  begin
    FClickIndex := NewClickIndex;
    Result := True;
    FOwner.Invalidate(Items[NewClickIndex]);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumns.AdjustHoverColumn(P: TPoint): Boolean;

// determines the new hover index and returns True if the index actually changed else False

var
  NewHoverIndex: Integer;

begin
  Result := False;
  // convert to local coordinates
  Inc(P.Y, FOwner.FHeight);
  NewHoverIndex := ColumnFromPosition(P);
  if NewHoverIndex <> FHoverIndex then
  begin
    if FHoverIndex > -1 then
      FOwner.Invalidate(Items[FHoverIndex]);
    FHoverIndex := NewHoverIndex;
    if FHoverIndex > -1 then
      FOwner.Invalidate(Items[FHoverIndex]);
    Result := True;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumns.AdjustPosition(Column: TVirtualTreeColumn; Position: Cardinal);

// reorders the column position array so that the given column gets the given position

var
  OldPosition: Cardinal;

begin
  OldPosition := Column.Position;
  if OldPosition <> Position then
  begin
    if OldPosition < Position then
    begin
      // column will be moved up so move down other entries
      Move(FColumnPositions[OldPosition + 1], FColumnPositions[OldPosition], (Position - OldPosition) * SizeOf(Cardinal));
    end
    else
    begin
      // column will be moved down so move up other entries
      Move(FColumnPositions[Position], FColumnPositions[Position + 1], (OldPosition - Position) * SizeOf(Cardinal));
    end;
    FColumnPositions[Position] := Column.Index;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumns.ColumnFromPosition(P: TPoint): Integer;

// determines the current column based on the position passed in P (must be specified in local coordinates,
// but is not restricted to the header area)

var
  I, Sum: Integer;

begin
  Result := InvalidColumn;
  if P.X >= 0 then
  begin
    Sum := FOwner.Fowner.FOffsetX;
    for I := 0 to Count - 1 do
      if coVisible in Items[FColumnPositions[I]].FOptions then
      begin
        Inc(Sum, Items[FColumnPositions[I]].Width);
        if P.X < Sum then
        begin
          Result := FColumnPositions[I];
          Break;
        end;
      end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumns.DrawButtonText(Caption: WideString; TextBounds: TRect; Enabled, Hot: Boolean;
  Flags: Integer);

begin
  with FHeaderBitmap.Canvas do
  begin
    Caption := ShortenString(Handle, Caption, TextBounds.Right - TextBounds.Left, 10);
    Brush.Style := bsClear;
    if not Enabled then
    begin
      OffsetRect(TextBounds, 1, 1);
      Font.Color := clBtnHighlight;
      ExtTextOutW(Handle, TextBounds.Left, TextBounds.Top, ETO_CLIPPED, @TextBounds, PWideChar(Caption),
        Length(Caption), nil);
      OffsetRect(TextBounds, -1, -1);
      Font.Color := clBtnShadow;
      ExtTextOutW(Handle, TextBounds.Left, TextBounds.Top, ETO_CLIPPED, @TextBounds, PWideChar(Caption),
        Length(Caption), nil);
    end
    else
    begin
      if Hot then
        Font.Color := clBtnShadow
      else
        Font.Color := FOwner.FFont.Color;
      ExtTextOutW(Handle, TextBounds.Left, TextBounds.Top, ETO_CLIPPED, @TextBounds, PWideChar(Caption),
        Length(Caption), nil);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumns.CalcButtonLayout(const Client: TRect; const Offset: TPoint; const Caption: WideString;
  Layout: TButtonLayout; ImageIndex, Margin, Spacing: Integer; var GlyphPos: TPoint; var TextBounds: TRect;
  BiDiFlags: Integer);

var
  TextSize: TSize;
  TextPos,
  ClientSize,
  GlyphSize,
  TotalSize: TPoint;

begin
  if (BiDiFlags and ETO_RTLREADING) <> 0 then
    if Layout = blGlyphLeft then
      Layout := blGlyphRight
    else
      if Layout = blGlyphRight then
        Layout := blGlyphLeft;
      
  // calculate the item sizes
  ClientSize := Point(Client.Right - Client.Left, Client.Bottom - Client.Top);

  with FOwner.FOwner do
    if (hoShowImages in FOwner.FOptions) and Assigned(FImages) and (ImageIndex > - 1) then
      GlyphSize := Point(FImages.Width, FImages.Height)
    else
      GlyphSize := Point(0, 0);

  if Length(Caption) > 0 then
  begin
    GetTextExtentPoint32W(FHeaderBitmap.Canvas.Handle, PWideChar(Caption), Length(Caption), TextSize);
    Inc(TextSize.cx, 2);
    TextBounds := Rect(0, 0, TextSize.cx, TextSize.cy);
  end
  else
  begin
    TextBounds := Rect(0, 0, 0, 0);
    TextSize.cx := 0;
    TextSize.cy := 0;
  end;

  // If the layout has the glyph on the right or the left, then both the
  // text and the glyph are centered vertically.  If the glyph is on the top
  // or the bottom, then both the text and the glyph are centered horizontally.
  if Layout in [blGlyphLeft, blGlyphRight] then
  begin
    GlyphPos.Y := (ClientSize.Y - GlyphSize.Y + 1) div 2;
    TextPos.Y := (ClientSize.Y - TextSize.cy + 1) div 2;
  end
  else
  begin
    GlyphPos.X := (ClientSize.X - GlyphSize.X + 1) div 2;
    TextPos.X := (ClientSize.X - TextSize.cx + 1) div 2;
  end;

  // if there is no text or no bitmap, then Spacing is irrelevant 
  if (TextSize.cx = 0) or (GlyphSize.X = 0) then
    Spacing := 0;

  // adjust Margin and Spacing
  if Margin = -1 then
  begin
    if Spacing = -1 then
    begin
      TotalSize := Point(GlyphSize.X + TextSize.cx, GlyphSize.Y + TextSize.cy);
      if Layout in [blGlyphLeft, blGlyphRight] then
        Margin := (ClientSize.X - TotalSize.X) div 3
      else
        Margin := (ClientSize.Y - TotalSize.Y) div 3;
      Spacing := Margin;
    end
    else
    begin
      TotalSize := Point(GlyphSize.X + Spacing + TextSize.cx, GlyphSize.Y + Spacing + TextSize.cy);
      if Layout in [blGlyphLeft, blGlyphRight] then
        Margin := (ClientSize.X - TotalSize.X + 1) div 2
      else
        Margin := (ClientSize.Y - TotalSize.Y + 1) div 2;
    end;
  end
  else
  begin
    if Spacing = -1 then
    begin
      TotalSize := Point(ClientSize.X - (Margin + GlyphSize.X), ClientSize.Y - (Margin + GlyphSize.Y));
      if Layout in [blGlyphLeft, blGlyphRight] then
        Spacing := (TotalSize.X - TextSize.cx) div 2
      else
        Spacing := (TotalSize.Y - TextSize.cy) div 2;
    end;
  end;

  // calculate final positions, make sure they never exceed the left bound of the client rect
  // and adjust text bounds in case there's not enough room to hold the entire text
  case Layout of
    blGlyphLeft:
      begin
        GlyphPos.X := Margin;
        if GlyphPos.X < 0 then
          GlyphPos.X := 0;
        if Spacing < 4 then
          Spacing := 4;
        TextPos.X := GlyphPos.X + GlyphSize.X + Spacing;
        if TextBounds.Right + TextPos.X > ClientSize.X then
          TextBounds.Right := ClientSize.X - TextPos.X;
      end;
    blGlyphRight:
      begin
        GlyphPos.X := ClientSize.X - Margin - GlyphSize.X;
        if GlyphPos.X < 0 then
          GlyphPos.X := 0;
        TextPos.X := GlyphPos.X - Spacing - TextSize.cx;
        if TextPos.X < 0 then
          TextPos.X := 0;
        if TextPos.X + TextBounds.Right > GlyphPos.X then
          TextBounds.Right := GlyphPos.X;
      end;
    blGlyphTop:
      begin
        GlyphPos.Y := Margin;
        TextPos.Y := GlyphPos.Y + GlyphSize.Y + Spacing;
      end;
    blGlyphBottom:
      begin
        GlyphPos.Y := ClientSize.Y - Margin - GlyphSize.Y;
        TextPos.Y := GlyphPos.Y - Spacing - TextSize.cy;
      end;
  end;

  // fixup the result variables
  with GlyphPos do
  begin
    Inc(X, Client.Left + Offset.X);
    Inc(Y, Client.Top + Offset.Y);
  end;
  OffsetRect(TextBounds, TextPos.X + Client.Left + Offset.X, TextPos.Y + Client.Top + Offset.Y);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumns.DragTo(P: TPoint);

// moves the drag image to a new position, which is determined from the passed point P and the previous
// mouse position

var
  ScreenDC: HDC;
  dX, dY,
  I,
  NewTarget: Integer;
  // optimized drag image move support
  RSamp1,
  RSamp2,       // newly added parts from screen which will be overwritten
  RDraw1,
  RDraw2,       // parts to be restored to screen
  RScroll,
  RClip: TRect; // ScrollDC of the existent background
  ClientP: TPoint;
  Left,
  Right: Integer;
  NeedRepaint: Boolean; // True if the screen needs an update (changed drop target or drop side)

begin
  // determine new drop target and which side of it is prefered
  ClientP := FOwner.FOwner.ScreenToClient(P);
  NewTarget := ColumnFromPosition(ClientP);
  NeedRepaint := NewTarget <> FDropTarget;
  if NewTarget >= 0 then
  begin
    GetColumnBounds(NewTarget, Left, Right);
    if (ClientP.X < ((Left + Right) div 2)) <> FDropBefore then
    begin
      NeedRepaint := True;
      FDropBefore := not FDropBefore;
    end;
  end;

  ScreenDC := GetDC(0);
  try
    // this is the distance to move the drag image
    dX := FLastDragPosition.X - P.X;
    // move only horizontally
    if hoRestrictDrag in FOwner.FOptions then
      dY := 0
    else
      dY := FLastDragPosition.Y - P.Y;

    if (Abs(dX) >= FDragImage.Width) or
       (Abs(dY) >= FDragImage.Height) or
       NeedRepaint then
    begin
      // If moved more than image size then just restore old screen and blit image to new position.
      // restore screen...
      BitBlt(ScreenDC, FImagePosition.X, FImagePosition.Y, FBackImage.Width, FBackImage.Height, FBackImage.Canvas.Handle,
             0, 0, SRCCOPY);
             
      // ...repaint drag feedback...
      if NeedRepaint then
      begin
        if FDropTarget <> InvalidColumn then
        begin
          I := FDropTarget;
          FDropTarget := InvalidColumn;
          FOwner.Invalidate(Items[I]);
        end;
        if (NewTarget <> InvalidColumn) and
           (NewTarget <> FDropTarget) then
        begin
          FOwner.Invalidate(Items[NewTarget]);
          FDropTarget := NewTarget;
        end;
        // make sure the changes are placed on the screen
        UpdateWindow(FOwner.FOwner.Handle);
      end;
      
      Inc(FImagePosition.X, -dX);
      Inc(FImagePosition.Y, -dY);
      // ...save screen to restore it later...
      BitBlt(FBackImage.Canvas.Handle, 0, 0, FBackImage.Width, FBackImage.Height, ScreenDC,
             FImagePosition.X, FImagePosition.Y, SRCCOPY);
    end
    else
    begin
      // Overlapping copy, this is a modified and simplified copy of the general (and quite complex)
      // masked dragging code from the drag manager.

      // filling the various rectangles has been moved to an own procedure because it is used twice
      FillDragRectangles(FDragImage.Width, FDragImage.Height, dX, dY, RClip, RScroll, RSamp1, RSamp2, RDraw1, RDraw2);

      with FBackImage.Canvas do
      begin
        // restore uncovered areas of the screen
        if dX = 0 then
          with RDraw2 do
            BitBlt(ScreenDC, FImagePosition.X + Left, FImagePosition.Y + Top, Right, Bottom, Handle, Left, Top, SRCCOPY)
        else
          if dY = 0 then
            with RDraw1 do
              BitBlt(ScreenDC, FImagePosition.X + Left, FImagePosition.Y + Top, Right, Bottom, Handle, Left, Top, SRCCOPY)
          else
          begin
            with RDraw1 do
              BitBlt(ScreenDC, FImagePosition.X + Left, FImagePosition.Y + Top, Right, Bottom, Handle, Left, Top, SRCCOPY);
            with RDraw2 do
              BitBlt(ScreenDC, FImagePosition.X + Left, FImagePosition.Y + Top, Right, Bottom, Handle, Left, Top, SRCCOPY);
          end;

        // move existent background
        ScrollDC(Handle, dX, dY, RScroll, RClip, 0, nil);

        Inc(FImagePosition.X, -dX);
        Inc(FImagePosition.Y, -dY);

        // get first and second additional rectangle from screen
        if dX = 0 then
          with RSamp2 do
            BitBlt(Handle, Left, Top, Right, Bottom, ScreenDC, FImagePosition.X + Left, FImagePosition.Y + Top, SRCCOPY)
        else
          if dY = 0 then
            with RSamp1 do
              BitBlt(Handle, Left, Top, Right, Bottom, ScreenDC, FImagePosition.X + Left, FImagePosition.Y + Top, SRCCOPY)
          else
          begin
            with RSamp1 do
              BitBlt(Handle, Left, Top, Right, Bottom, ScreenDC, FImagePosition.X + Left, FImagePosition.Y + Top, SRCCOPY);
            with RSamp2 do
              BitBlt(Handle, Left, Top, Right, Bottom, ScreenDC, FImagePosition.X + Left, FImagePosition.Y + Top, SRCCOPY);
          end;
      end;
    end;

    // ... and finally draw drag image at new position
    SimpleAlpha(FBackImage, FDragImage, FAlphaImage);
    BitBlt(ScreenDC, FImagePosition.X, FImagePosition.Y, FAlphaImage.Width, FAlphaImage.Height,
           FAlphaImage.Canvas.Handle, 0, 0, SRCCOPY);

    FLastDragPosition.X := P.X;
    FLastDragPosition.Y := P.Y;
  finally
    ReleaseDC(0, ScreenDC);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumns.EndDrag;

var
  ScreenDC: HDC;

begin
  ScreenDC := GetDC(0);
  try
    // restore screen...
    BitBlt(ScreenDC, FImagePosition.X, FImagePosition.Y, FBackImage.Width, FBackImage.Height, FBackImage.Canvas.Handle,
           0, 0, SRCCOPY);
    FBackImage.Free;
    FDragImage.Free;
    FAlphaImage.Free;
  finally
    ReleaseDC(0, ScreenDC);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumns.GetColumnAndBounds(P: TPoint; var Left, Right: Integer): Integer;

// returns the column where the mouse is currently in as well as the left and right bound of
// this column (Left and Right are undetermined if no column is involved)

var
  I: Integer;

begin
  Result := InvalidColumn;
  Left := FOwner.Fowner.FOffsetX;
  for I := 0 to Count - 1 do
    if coVisible in Items[FColumnPositions[I]].FOptions then
    begin
      Right := Left + Items[FColumnPositions[I]].Width;
      if P.X < Right then
      begin
        Result := FColumnPositions[I];
        Exit;
      end;
      Left := Right;
    end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumns.GetColumnBounds(Column: Integer; var Left, Right: Integer);

// returns the left and right bound of the given column

begin
  Left := Items[Column].Left;
  Right := Left + Items[Column].Width;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumns.GetOwner: TPersistent;

begin
  Result := FOwner;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumns.SetItem(Index: Integer; Value: TVirtualTreeColumn);

begin
  inherited SetItem(Index, Value);
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumns.GetFirstVisibleColumn: Integer;

// returns the position of the first visible column or "InvalidColumn" if either no columns are defined or
// all columns are hidden

var
  I: Integer;

begin
  Result := InvalidColumn;
  for I := 0 to Count - 1 do
    if coVisible in Items[FColumnPositions[I]].FOptions then
    begin
      Result := I;
      Break;
    end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumns.GetNextColumn(Column: Integer): Integer;

// returns the next column in display order, Column is an index into the columns list

var
  Position: Integer;

begin
  if Column < 0 then
    Result := InvalidColumn
  else
  begin
    Position := Items[Column].Position;
    if Position < Count - 1 then
      Result := FColumnPositions[Position + 1]
    else
      Result := InvalidColumn;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumns.GetNextVisibleColumn(Column: Integer): Integer;

// returns the next visible column in display order, Column is an index into the columns list

begin
  Result := Column;
  repeat
    Result := GetNextColumn(Result);
  until (Result = InvalidColumn) or (coVisible in Items[Result].FOptions);
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumns.GetPreviousColumn(Column: Integer): Integer;

// returns the previous column in display order, Column is an index into the columns list

var
  Position: Integer;

begin
  if Column < 0 then
    Result := InvalidColumn
  else
  begin
    Position := Items[Column].Position;
    if Position > 0 then
      Result := FColumnPositions[Position - 1]
    else
      Result := InvalidColumn;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVirtualTreeColumns.GetPreviousVisibleColumn(Column: Integer): Integer;

// returns the previous column in display order, Column is an index into the columns list

begin
  Result := Column;
  repeat
    Result := GetPreviousColumn(Result);
  until (Result = InvalidColumn) or (coVisible in Items[Result].FOptions);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumns.HandleClick(P: TPoint);

// generates a click event if the mouse button has been released over the same column it was pressed first

var
  NewClickIndex: Integer;

begin
  // convert to local coordinates
  Inc(P.Y, FOwner.FHeight);
  NewClickIndex := ColumnFromPosition(P);
  if (NewClickIndex > -1) and
     (coAllowClick in Items[NewClickIndex].FOptions) and
     (NewClickIndex = FClickIndex) then
  begin
    FOwner.FOwner.DoHeaderClick(NewClickIndex);
    FOwner.Invalidate(Items[NewClickIndex]);
  end;

  if (FClickIndex >= 0) and
     (FClickIndex <> NewClickIndex) then
    FOwner.Invalidate(Items[FClickIndex]);
  FClickIndex := InvalidColumn;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumns.PaintHeader(DC: HDC; R: TRect; HOffset: Integer);

// main paint method to draw the header

var
  I, Y: Integer;
  ButtonR,
  TextR,
  Run: TRect;
  GlyphPos: TPoint;
  NormalButtonStyle,
  NormalButtonFlags,
  PressedButtonStyle,
  PressedButtonFlags: Cardinal;
  DrawTextFlags: Integer;
  Images: TImageList;
  ButtonRgn: HRGN;
  OwnerDraw: Boolean;

begin
  ButtonR := FOwner.FOwner.GetHeaderRect;
  FHeaderBitmap.Width := Max(ButtonR.Right, R.Right);
  FHeaderBitmap.Height := ButtonR.Bottom;
  OwnerDraw := (hoOwnerDraw in FOwner.FOptions) and
               Assigned(FOwner.FOwner.FOnDrawHeader) and
               not (csDesigning in FOwner.FOwner.ComponentState);

  with FHeaderBitmap.Canvas do
  begin
    Font := FOwner.FFont;

    SetBkMode(Handle, TRANSPARENT);
    case FOwner.Style of
      hsThickButtons:
        begin
          NormalButtonStyle := BDR_RAISEDINNER or BDR_RAISEDOUTER;
          NormalButtonFlags := BF_RECT or BF_MIDDLE or BF_SOFT;
          PressedButtonStyle := BDR_RAISEDINNER or BDR_RAISEDOUTER;
          PressedButtonFlags := NormalButtonFlags or BF_FLAT;
        end;
      hsFlatButtons:
        begin
          NormalButtonStyle := BDR_RAISEDINNER;
          NormalButtonFlags := BF_RECT or BF_MIDDLE;
          PressedButtonStyle := BDR_SUNKENOUTER;
          PressedButtonFlags := BF_RECT or BF_MIDDLE;
        end;
    else
      // hsPlates
      begin
        NormalButtonStyle := BDR_SUNKENOUTER or BDR_RAISEDINNER;
        NormalButtonFlags := BF_RIGHT or BF_MIDDLE or BF_SOFT;
        PressedButtonStyle := BDR_SUNKENOUTER;
        PressedButtonFlags := BF_RECT or BF_MIDDLE;
      end;
    end;

    // use shortcut for the images
    Images := FOwner.FOwner.FImages;

    Run.Top := R.Top;
    Run.Right := R.Left + HOffset;
    Run.Bottom := R.Bottom;
    // Run.Left is set in the loop

    // now go for each button
    for I := 0 to Count - 1 do
      with Items[FColumnPositions[I]] do
        if coVisible in FOptions then
        begin
          // we need an extra "running" rectangle since ButtonR is modified by DrawEdge
          // to correctly calculate the button layout
          Run.Left := Run.Right;
          Inc(Run.Right, Items[FColumnPositions[I]].Width);
          if Run.Right > Run.Left then
          begin
            ButtonR := Run;

            // create a clip region to avoid overpainting any other areas which do not belong to this column
            if ButtonR.Right > R.Right then
              ButtonR.Right := R.Right;
            if ButtonR.Left < R.Left then
              ButtonR.Left := R.Left;
            ButtonRgn := CreateRectRgnIndirect(ButtonR);
            SelectClipRgn(Handle, ButtonRgn);
            DeleteObject(ButtonRgn);

            ButtonR := Run;
            if (Style = vsText) or not OwnerDraw then
            begin
              if Integer(FColumnPositions[I]) = FClickIndex then
                DrawEdge(Handle, ButtonR, PressedButtonStyle, PressedButtonFlags)
              else
                if (FOwner.Style = hsPlates) and (Integer(FColumnPositions[I]) = FHoverIndex) and
                   (coAllowClick in FOptions) and (coEnabled in FOptions) then
                  DrawEdge(Handle, ButtonR, BDR_RAISEDINNER, BF_RECT or BF_MIDDLE)
                else
                  DrawEdge(Handle, ButtonR, NormalButtonStyle, NormalButtonFlags);

              // calculate text and glyph position
              InflateRect(ButtonR, -2, -2);
              DrawTextFlags := ETO_CLIPPED;
              if UseRightToLeftReading then
                DrawTextFlags := DrawTextFlags + ETO_RTLREADING;
              CalcButtonLayout(ButtonR, Point(0, 0), FText, FLayout, FImageIndex, FMargin, FSpacing, GlyphPos, TextR,
                DrawTextFlags);

              // move glyph and text one pixel to the right and down to simulate a pressed button
              if Integer(FColumnPositions[I]) = FClickIndex then
              begin
                OffsetRect(TextR, 1, 1);
                Inc(GlyphPos.X);
                Inc(GlyphPos.Y);
              end;

              // the glyph first...
              if (hoShowImages in FOwner.FOptions) and Assigned(Images) and (FImageIndex > -1) then
                Images.Draw(FHeaderBitmap.Canvas, GlyphPos.X, GlyphPos.Y, FImageIndex, coEnabled in FOptions);

              // ...then the text
              DrawButtonText(Text, TextR, coEnabled in FOptions, (Integer(FColumnPositions[I]) = FHoverIndex) and
                (hoHotTrack in FOwner.FOptions), DrawTextFlags);

              // show an indication if this column is the current drop target in a header drag operation
              if (Integer(FColumnPositions[I]) = FDropTarget) and (coShowDropMark in FOptions) then
              begin
                Y := (ButtonR.Bottom - ButtonR.Top - UtilityImages.Height) div 2;
                if FDropBefore then
                begin
                  with ButtonR do
                    UtilityImages.Draw(FHeaderBitmap.Canvas, Left, Top + Y, 0);
                end
                else
                begin
                  with ButtonR do
                    UtilityImages.Draw(FHeaderBitmap.Canvas, Right - 16 , Top + Y,  1);
                end;
              end;
            end
            else // let application draw the button
              FOwner.FOwner.DoDrawHeader(FHeaderBitmap.Canvas,
                                         Items[FColumnPositions[I]],
                                         ButtonR,
                                         Integer(FColumnPositions[I]) = FHoverIndex,
                                         Integer(FColumnPositions[I]) = FClickIndex);
            SelectClipRgn(Handle, 0);
          end;
        end;

    if Run.Right < R.Right then
    begin
      ButtonR := R;
      with ButtonR do
        IntersectClipRect(Handle, Run.Right, Top, Right, Bottom);
      // finally erase unused header space
      ButtonR.Left := Run.Right;
      Brush.Color := FOwner.FBackground;
      FillRect(ButtonR);
    end;

    // blit the result to target
    with R do
      BitBlt(DC, Left, Top, Right - Left, Bottom - Top, Handle, Left, Top, SRCCOPY);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumns.PrepareDrag(P, Start: TPoint);

// initializes dragging of the header, P is the current mouse postion and Start the start position

var
  ColumnR,
  HeaderR: TRect;
  ScreenDC: HDC;

begin
  // determine initial position of drag image (screen coordinates)
  FDropTarget := InvalidColumn;
  FLastDragPosition := Start;
  Start := FOwner.FOwner.ScreenToClient(Start);
  Inc(Start.Y, FOwner.FHeight);
  FDragIndex := ColumnFromPosition(Start);
  ColumnR := Items[FDragIndex].GetRect;

  FDragImage := TBitmap.Create;
  FDragImage.PixelFormat := pf24Bit;
  FDragImage.Width := ColumnR.Right - ColumnR.Left;
  FDragImage.Height := ColumnR.Bottom - ColumnR.Top;

  FAlphaImage := TBitmap.Create;
  FAlphaImage.PixelFormat := pf24Bit;
  FAlphaImage.Width := ColumnR.Right - ColumnR.Left;
  FAlphaImage.Height := ColumnR.Bottom - ColumnR.Top;

  HeaderR := FOwner.FOwner.GetHeaderRect;
  // set right border of the header rectangle to maximum extent to paint correctly
  HeaderR.Right := TotalWidth;

  // take out influence of border since we need a seamless drag image
  OffsetRect(ColumnR, -HeaderR.Left, -HeaderR.Top);
  OffsetRect(HeaderR, -HeaderR.Left, -HeaderR.Top);
  PaintHeader(FDragImage.Canvas.Handle, HeaderR, -ColumnR.Left + FOwner.FOwner.FOffsetX);

  FImagePosition := FOwner.FOwner.ClientToScreen(ColumnR.TopLeft);
  // column rectangles are given in local window coordinates not client coordinates
  Dec(FImagePosition.Y, FOwner.FHeight);

  FBackImage := TBitmap.Create;
  FBackImage.PixelFormat := pf24Bit;
  FBackImage.Width := ColumnR.Right - ColumnR.Left;
  FBackImage.Height := ColumnR.Bottom - ColumnR.Top;

  // It is quite strange that the following command is needed here, because we just have called RedrawWindow (in
  // the HandleMessage method (call to Invalidate) which is said to update the window immediately. It does not,
  // obviously, otherwise the screen would appear updated when grabbed with the code below.
  UpdateWindow(FOwner.FOwner.Handle);
  ScreenDC := GetDC(0);
  try
    // save screen to restore it later
    BitBlt(FBackImage.Canvas.Handle, 0, 0, FBackImage.Width, FBackImage.Height, ScreenDC,
           FImagePosition.X, FImagePosition.Y, SRCCOPY);
  finally
    ReleaseDC(0, ScreenDC);
  end;

  // move drag image to initial position
  DragTo(P);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumns.Update(Item: TCollectionItem);

begin
  // this is the only place which gets notified when a new column has been added or removed
  // and we need this event to adjust the column position array
  ValidatePositions;
  
  if not (csLoading in FOwner.FOwner.ComponentState) then
  begin
    with FOwner do
    begin
      if hoAutoResize in FOptions then
        AdjustAutoSize;
      Invalidate(Item as TVirtualTreeColumn);
      // This is mainly to let the designer know when a change occurs at design time which
      // doesn't involve the object inspector (like column resizing with the mouse).
      // This does NOT include design time code as the comunication is done via an interface.
      FOwner.UpdateDesigner;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVirtualTreeColumns.ValidatePositions;

// Makes sure the column position array contains as much entries as columns are defined.
// The array is resized and initialized with default values if needed.

var
  I, OldSize: Integer;
  Changed: Boolean;
  
begin
  if Count <> Length(FColumnPositions) then
  begin
    OldSize := Length(FColumnPositions);
    // set new size of the array
    SetLength(FColumnPositions, Count);
    if Count > OldSize then
    begin
      // new items have been added, just set their position to the same as their index
      for I := OldSize to Count - 1 do
        FColumnPositions[I] := I;
    end
    else
    begin
      // items have been deleted, reindex remaining entries by decrementing values larger than the highest
      // possible index until no entry is higher than this limit
      repeat
        Changed := False;
        for I := 0 to Count - 1 do
          if FColumnPositions[I] >= Cardinal(Count) then
          begin
            Dec(FColumnPositions[I]);
            Changed := True;
          end;
      until not Changed;
    end;
  end;
end;

//----------------- TVTHeader -----------------------------------------------------------------------------------------

constructor TVTHeader.Create(AOwner: TBaseVirtualTree);

begin
  inherited Create;
  FOwner := AOwner;
  FColumns := TVirtualTreeColumns.Create(Self);
  FHeight := 24;
  FFont := TFont.Create;
  FFont.OnChange := FontChanged;
  FBackground := clBtnFace;
  FOptions := [hoColumnResize, hoDrag];
end;

//----------------------------------------------------------------------------------------------------------------------

destructor TVTHeader.Destroy;

begin
  FFont.Free;
  FColumns.Free;
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTHeader.FontChanged(Sender: TObject);

begin
  Invalidate(nil);
end;

//----------------------------------------------------------------------------------------------------------------------

function TVTHeader.GetMainColumn: Integer;

begin
  if (hoVisible in FOptions) and (FColumns.Count > 0) then
    Result := 0
  else
    Result := -1;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVTHeader.GetOwner: TPersistent;

begin
  Result := FOwner;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVTHeader.GetUseColumns: Boolean;

begin
  Result := (hoVisible in FOptions) and (FColumns.Count > 0);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTHeader.SetBackground(Value: TColor);

begin
  if FBackground <> Value then
  begin
    FBackground := Value;
    Invalidate(nil);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTHeader.SetColumns(Value: TVirtualTreeColumns);

begin
  FColumns.Assign(Value);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTHeader.SetFont(const Value: TFont);

begin
  FFont.Assign(Value);
  Invalidate(nil);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTHeader.SetStyle(Value: TVTHeaderStyle);

begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    if not (csLoading in FOwner.ComponentState) then
      Invalidate(nil);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTHeader.SetHeight(Value: Cardinal);

begin
  if FHeight <> Value then
  begin
    FHeight := Value;
    if not (csLoading in FOwner.ComponentState) then
      RecalculateHeader;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVTHeader.DetermineSplitterIndex(P: TPoint): Boolean;

// Tries to find the index of that column whose right border corresponds to P.
// Result is True if there is a column border (with -3..+5 pixels) and the current track index is set.

var
  I,
  SplitPoint: Integer;

begin
  Result := False;
  if FColumns.Count > 0 then
    SplitPoint := FOwner.FOffsetX
  else
    SplitPoint := 0;

  for I := 0 to FColumns.Count - 1 do
    with FColumns, Items[FColumnPositions[I]] do
    if coVisible in FOptions then
    begin
      Inc(SplitPoint, FWidth);
      if (P.X < SplitPoint + 5) and (P.X > SplitPoint - 3) then
      begin
        if coResizable in FOptions then
        begin
          Result := True;
          FTrackIndex := FColumnPositions[I];
          FLeftTrackPos := SplitPoint - Width;
        end;
        Break;
      end;
    end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVTHeader.HandleMessage(var Message: TMessage): Boolean;

// The header gets here the opportunity to handle certain messages before they reach the tree. This is important
// because the tree needs to handle various non-client area messages for the header as well as some dragging/tracking
// events.
// By returning True the message will not be handled further, otherwise the tree is then dispatched
// to the proper message handlers.

var
  P: TPoint;
  R: TRect;
  I: Integer;

begin
  Result := False;
  case Message.Msg of
    WM_SIZE:
      begin
        if hoAutoResize in FOptions then
        begin
          FColumns.AdjustAutoSize;
          FOwner.UpdateHorizontalScrollBar(True);
        end;
        Invalidate(nil);
      end;
    CM_BIDIMODECHANGED:
      for I := 0 to FColumns.Count - 1 do
        if coParentBiDiMode in FColumns[I].FOptions then
          FColumns[I].ParentBiDiModeChanged;
    WM_NCLBUTTONDOWN,
    WM_NCLBUTTONDBLCLK:
      begin
        Application.CancelHint;
        
        // make sure no auto scrolling is active...
        FOwner.StopTimer(ScrollTimer);
        FOwner.FStates := FOwner.FStates - [tsScrollPending, tsScrolling];
        // ... pending editing is cancelled (actual editing remains active)
        FOwner.StopTimer(EditTimer);
        Exclude(FOwner.FStates, tsEditPending);

        with TWMNCLButtonDown(Message) do
        begin
          // want the drag start point in screen coordinates
          FColumns.FDragStart := Point(XCursor, YCursor);
          P := FOwner.ScreenToClient(FColumns.FDragStart);
        end;

        if InHeader(P) then
        begin
          if DetermineSplitterIndex(P) and (hoColumnResize in FOptions) then
          begin
            Include(FStates, hsTracking);
            SetCapture(FOwner.Handle);
            Result := True;
            Message.Result := 0;
          end
          else
          begin
            FColumns.AdjustClickColumn(P);
            if FColumns.FClickIndex > -1 then
            begin
              // show potential drag operation,
              // disabled columns do not start a drag operation because they can't be clicked 
              Include(FStates, hsDragPending);
              SetCapture(FOwner.Handle);
              Result := True;
              Message.Result := 0;
            end;
          end;
        end;
      end;
    WM_NCRBUTTONUP:
      begin
        // trigger header popup if there's one
        if Assigned(FPopupMenu) then
        begin
          with TWMNCRButtonUp(Message) do
            FPopupMenu.Popup(XCursor, YCursor);
          Result := True;
        end;
      end;
    // when the tree window has an active mouse capture then we only get "client-area" messages
    WM_LBUTTONUP,
    WM_NCLBUTTONUP:
      begin
        Application.CancelHint;
        
        if FStates <> [] then
        begin
          ReleaseCapture;
          if hsDragging in FStates then
          begin
            // successfull dragging moves columns
            with TWMLButtonUp(Message) do
              P := FOwner.ClientToScreen(Point(XPos, YPos));
            GetWindowRect(FOwner.Handle, R);
            with FColumns do
            begin
              EndDrag;
              if (FDropTarget > -1) and (FDropTarget <> FDragIndex) and PtInrect(R, P) then
              begin
                if FColumns.FDropBefore then
                begin
                  if FColumns[FDragIndex].Position < FColumns[FDropTarget].Position then
                    FColumns[FDragIndex].Position := Max(0, FColumns[FDropTarget].Position - 1)
                  else
                    FColumns[FDragIndex].Position := FColumns[FDropTarget].Position;
                end
                else
                begin
                  if FColumns[FDragIndex].Position < FColumns[FDropTarget].Position then
                    FColumns[FDragIndex].Position := FColumns[FDropTarget].Position
                  else
                    FColumns[FDragIndex].Position := FColumns[FDropTarget].Position + 1;
                end;
                Self.FOwner.DoHeaderDragged(FDropTarget);
              end;
              FDropTarget := InvalidColumn;
            end;
            Invalidate(nil);
          end;
          FStates := FStates - [hsDragging, hsDragPending, hsTracking];
          Result := True;
          Message.Result := 0;
        end;

        if (Message.Msg = WM_LBUTTONUP) and (FColumns.FClickIndex > -1) then
        begin
          // click event
          with TWMNCLButtonUp(Message) do
            FColumns.HandleClick(Point(XCursor, YCursor));
          Result := True;
          Message.Result := 0;
        end;
      end;
    // hovering, mouse leave detection
    WM_NCMOUSEMOVE:
      with TWMNCMouseMove(Message) do
      begin
        P := FOwner.ScreenToClient(Point(XCursor, YCursor));
        if InHeader(P) and ((FColumns.AdjustHoverColumn(P)) or (FColumns.FClickIndex >= 0)) then
        begin
          // We need a mouse leave detection from here for the non client area. The best solution available would be the
          // TrackMouseEvent API. Unfortunately, it leaves Win95 totally and WinNT4 for non-client stuff out and
          // currently I cannot ignore these systems. Hence I go the only other reliable way and use a timer
          // (although, I don't like it...).
          SetTimer(FOwner.Handle, HeaderTimer, 50, nil);
          // use Delphi's internal hint handling for header hints too
          if hoShowHint in FOptions then
          begin
            // client coordinates!
            XCursor := P.x;
            YCursor := P.y;
            Application.HintMouseMessage(FOwner, Message);
          end;
        end;
      end;
    WM_TIMER:
      if TWMTimer(Message).TimerID = HeaderTimer then
      begin
        // determine current mouse position to check if it left the window
        GetCursorPos(P);
        P := FOwner.ScreenToClient(P);
        if not InHeader(P) then
        begin
          FOwner.StopTimer(HeaderTimer);
          FColumns.FHoverIndex := InvalidColumn;
          FColumns.FClickIndex := InvalidColumn;
          Result := True;
          Message.Result := 0;
          Invalidate(nil);
        end;
      end;
    // mouse capture and general message redirection
    WM_MOUSEMOVE:
      with TWMMouseMove(Message) do
      begin
        if hsTracking in FStates then
        begin
          FColumns[FTrackIndex].Width := XPos - FLeftTrackPos;
          HandleMessage := True;
          Result := 0;
        end
        else
        begin
          P := Point(XPos, YPos);
          if hsDragPending in FStates then
          begin
            P := FOwner.ClientToScreen(P);
            // start actual dragging if allowed
            if not (csDesigning in FOwner.ComponentState) and
               (hoDrag in FOptions) and
               FOwner.DoHeaderDragging(FColumns.FClickIndex) then
            begin
              if ((Abs(FColumns.FDragStart.X - P.X) > Mouse.DragThreshold) or
                 (Abs(FColumns.FDragStart.Y - P.Y) > Mouse.DragThreshold)) then
              begin
                FOwner.StopTimer(HeaderTimer);
                I := FColumns.FClickIndex;
                FColumns.FClickIndex := InvalidColumn;
                FColumns.FHoverIndex := InvalidColumn;
                if I > -1 then
                  Invalidate(FColumns[I]);
                FColumns.PrepareDrag(P, FColumns.FDragStart);
                FStates := FStates - [hsDragPending] + [hsDragging];
                HandleMessage := True;
                Result := 0;
              end;
            end;
          end
          else
            if hsDragging in FStates then
            begin
              FColumns.DragTo(FOwner.ClientToScreen(Point(XPos, YPos)));
              HandleMessage := True;
              Result := 0;
            end;
        end;
      end;
    WM_SETCURSOR:
      if FStates = [] then
      begin
        // retrieve last cursor position (GetMessagePos does not work here, I don't know why)
        GetCursorPos(P);
        // Is the mouse in the header rectangle?
        P := FOwner.ScreenToClient(P);
        if InHeader(P) and (hoColumnResize in FOptions) then
        begin
          if DetermineSplitterIndex(P) then
            Windows.SetCursor(Screen.Cursors[crHSplit])
          else
            Windows.SetCursor(Screen.Cursors[crDefault]);
          Message.Result := 1;
          Result := True;
        end;
      end
      else
      begin
        Message.Result := 1;
        Result := True;
      end;
    WM_KEYDOWN,
    WM_KILLFOCUS:
      if (Message.Msg = WM_KILLFOCUS) or
         (TWMKeyDown(Message).CharCode = VK_ESCAPE) then
      begin
        if hsDragging in FStates then
        begin
          ReleaseCapture;
          FColumns.EndDrag;
          Exclude(FStates, hsDragging);
          FColumns.FDropTarget := InvalidColumn;
          Invalidate(nil);
          Result := True;
          Message.Result := 0;
        end
        else
          if hsTracking in FStates then
          begin
            ReleaseCapture;
            Exclude(FStates, hsTracking);
            Result := True;
            Message.Result := 0;
          end;
      end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTHeader.Invalidate(Column: TVirtualTreeColumn);

// because the header is in the non-client area of the tree it needs some special handling
// in order to initiate its repainting

var
  R, RW: TRect;

begin
  if (hoVisible in FOptions) and FOwner.HandleAllocated then
  begin
    Column := nil;
    if Column = nil then
      R := FOwner.GetHeaderRect
    else
      R := Column.GetRect;
    // current position of the owner in screen coordinates
    GetWindowRect(FOwner.Handle, RW);
    // consider the header within this rectangle
    OffsetRect(R, RW.Left, RW.Top);
    // expressed in client coordinates (because RedrawWindow wants them so, they will actually become negative)
    MapWindowPoints(0, FOwner.Handle, R, 2);
    RedrawWindow(FOwner.Handle, @R, 0, RDW_FRAME or RDW_INVALIDATE or RDW_NOERASE or RDW_NOCHILDREN);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTHeader.RecalculateHeader;

// initiate a recalculation of the non-client area of the owner tree

begin
  SetWindowPos(FOwner.Handle, 0, 0, 0, 0, 0, SWP_FRAMECHANGED or SWP_NOMOVE or SWP_NOACTIVATE or SWP_NOOWNERZORDER or
    SWP_NOSENDCHANGING or SWP_NOSIZE or SWP_NOZORDER);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTHeader.SetAutoSizeIndex(Value: Integer);

begin
  if FAutoSizeIndex <> Value then
  begin
    FAutoSizeIndex := Value;
    if hoAutoResize in FOptions then
      Columns.AdjustAutoSize;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTHeader.SetOptions(Value: TVTHeaderOptions);

var
  ToBeSet,
  ToBeCleared: TVTHeaderOptions;
  
begin 
  ToBeSet := Value - FOptions;
  ToBeCleared := FOptions - Value;
  FOptions := Value;

  if (hoAutoResize in (ToBeSet + ToBeCleared)) and
     (FColumns.Count > 0) then
  begin
    FColumns.AdjustAutoSize;
    if FOwner.HandleAllocated then
    begin
      FOwner.UpdateHorizontalScrollBar(False);
      if hoAutoResize in ToBeSet then
        FOwner.Invalidate;
    end;
  end;

  if not (csLoading in FOwner.ComponentState) and FOwner.HandleAllocated then
  begin
    if hoVisible in (ToBeSet + ToBeCleared) then
      RecalculateHeader;
    Invalidate(nil);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTHeader.Assign(Source: TPersistent);

begin
  if Source is TVTHeader then
  begin
    AutoSizeIndex := TVTHeader(Source).AutoSizeIndex;
    Background := TVTHeader(Source).Background;
    Columns := TVTHeader(Source).Columns;
    Font := TVTHeader(Source).Font;
    Height := TVTHeader(Source).Height;
    Options := TVTHeader(Source).Options;
    PopupMenu := TVTHeader(Source).PopupMenu;
    Style := TVTHeader(Source).Style;
  end
  else
    inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

function TVTHeader.InHeader(P: TPoint): Boolean;

// determines whether the given point (client coordinates!) is within the header rectangle (non-client coordinates)

var
  R, RW: TRect;

begin
  R := FOwner.GetHeaderRect;
  // current position of the owner in screen coordinates
  GetWindowRect(FOwner.Handle, RW);
  // convert to client coordinates
  MapWindowPoints(0, FOwner.Handle, RW, 2);
  // consider the header within this rectangle
  OffsetRect(R, RW.Left, RW.Top);
  Result := PtInRect(R, P);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTHeader.LoadFromStream(const Stream: TStream);

// restore the state of the header from the given stream

var
  Dummy: Integer;
  S: String;
  
begin
  with Stream do
  begin
    // switch off all options which could influence loading the columns (they will be later set again)
    Options := [];
    Columns.LoadFromStream(Stream);

    ReadBuffer(Dummy, SizeOf(Dummy));
    AutoSizeIndex := Dummy;
    ReadBuffer(Dummy, SizeOf(Dummy));
    Background := Dummy;
    ReadBuffer(Dummy, SizeOf(Dummy));
    Height := Dummy;
    ReadBuffer(Dummy, SizeOf(Dummy));
    Options := TVTHeaderOptions(Word(Dummy));
    // PopupMenu is neither saved nor restored
    ReadBuffer(Dummy, SizeOf(Dummy));
    Style := TVTHeaderStyle(Dummy);
    // TFont has no own save routine so we do it manually
    with Font do
    begin
      ReadBuffer(Dummy, SizeOf(Dummy));
      Color := Dummy;
      ReadBuffer(Dummy, SizeOf(Dummy));
      Height := Height;
      ReadBuffer(Dummy, SizeOf(Dummy));
      SetLength(S, Dummy);
      ReadBuffer(PChar(S)^, Dummy);
      Name := S;
      ReadBuffer(Dummy, SizeOf(Dummy));
      Pitch := TFontPitch(Dummy);
      ReadBuffer(Dummy, SizeOf(Dummy));
      Style := TFontStyles(Byte(Dummy));
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTHeader.SaveToStream(const Stream: TStream);

// save the complete state of the header into the provided stream

var
  Dummy: Integer;

begin
  with Stream do
  begin
    // first save columns in case they depend on certain options (like auto size)
    Columns.SaveToStream(Stream);

    Dummy := FAutoSizeIndex;
    WriteBuffer(Dummy, SizeOf(Dummy));
    Dummy := FBackground;
    WriteBuffer(Dummy, SizeOf(Dummy));
    Dummy := FHeight;
    WriteBuffer(Dummy, SizeOf(Dummy));
    Dummy := Word(FOptions);
    WriteBuffer(Dummy, SizeOf(Dummy));
    // PopupMenu is neither saved nor restored
    Dummy := Ord(FStyle);
    WriteBuffer(Dummy, SizeOf(Dummy));
    // TFont has no own save routine so we do it manually
    with Font do
    begin
      Dummy := Color;
      WriteBuffer(Dummy, SizeOf(Dummy));
      Dummy := Height;
      WriteBuffer(Dummy, SizeOf(Dummy));
      Dummy := Length(Name);
      WriteBuffer(Dummy, SizeOf(Dummy));
      WriteBuffer(PChar(Name)^, Dummy);
      Dummy := Ord(Pitch);
      WriteBuffer(Dummy, SizeOf(Dummy));
      // need only to write one: size or height, I decided to write height
      Dummy := Byte(Style);
      WriteBuffer(Dummy, SizeOf(Dummy));
    end;
  end;
end;

//----------------- TScrollBarOptions ----------------------------------------------------------------------------------

constructor TScrollBarOptions.Create(AOwner: TBaseVirtualTree);

begin
  inherited Create;
  FOwner := AOwner;
  FAlwaysVisible := False;
  FScrollBarStyle := sbmRegular;
  FScrollBars := ssBoth;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TScrollBarOptions.SetAlwaysVisible(Value: Boolean);

begin
  if FAlwaysVisible <> Value then
  begin
    FAlwaysVisible := Value;
    if not (csDesigning in FOwner.ComponentState) and not (csLoading in FOwner.ComponentState) and
      FOwner.HandleAllocated then
      FOwner.UpdateScrollBars(True);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TScrollBarOptions.SetScrollBars(Value: TScrollBars);

begin
  if FScrollbars <> Value then
  begin
    FScrollBars := Value;
    if not (csLoading in FOwner.ComponentState) and FOwner.HandleAllocated then
      FOwner.UpdateScrollBars(True);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TScrollBarOptions.SetScrollBarStyle(Value: TScrollBarStyle);

begin
  if FScrollBarStyle <> Value then
  begin
    FScrollBarStyle := Value;
    if FOwner.HandleAllocated then
    begin
      FlatSB_SetScrollProp(FOwner.Handle, WSB_PROP_HSTYLE, ScrollBarProp[FScrollBarStyle], True);
      FlatSB_SetScrollProp(FOwner.Handle, WSB_PROP_VSTYLE, ScrollBarProp[FScrollBarStyle], True);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TScrollBarOptions.GetOwner: TPersistent;

begin
  Result := FOwner;
end;

//----------------- TBaseVirtualTree -----------------------------------------------------------------------------------

constructor TBaseVirtualTree.Create(AOwner: TComponent);

begin
  inherited;
  ControlStyle := ControlStyle - [csSetCaption] + [csCaptureMouse, csOpaque, csReplicatable, csDisplayDragImage,
                                                   csReflector];
  // no extra space for nodes needed
  InternalDataSize := 0;
  FNodeDataSize := 0;
  Width := 200;
  Height := 100;
  TabStop := True;
  ParentColor := False;
  FDefaultNodeHeight := 18;
  FDropMarkColor := clSilver;
  FHotCursor := crDefault;
  FIncrementX := 8;
  FIncrementY := FDefaultNodeHeight;
  FScrollBarOptions := TScrollBarOptions.Create(Self);
  FFocusedColumn := InvalidColumn;
  FDragImageKind := diComplete;
  FLastSelectionLevel := -1;

  // FNodeDataSize is 0 at this point as well as the internal data size making FRoot
  // as small as possible
  InitRoot;
  FIndent := 18;
  FOptions := DefaultVTOptions;

  FPlusBM := TBitmap.Create;
  FMinusBM := TBitmap.Create;
  FHDotLine := TBitmap.Create;
  FVDotLine := TBitmap.Create;

  FBorderStyle := bsSingle;

  FHeader := TVTHeader.Create(Self);

  // we have an own double buffer handling
  DoubleBuffered := False;

  FOptions := DefaultVTOptions;
  FCheckImageKind := ckLightCheck;
  FCheckImages := LightCheckImages;

  FImageChangeLink := TChangeLink.Create;
  FImageChangeLink.OnChange := ImageListChange;
  FStateChangeLink := TChangeLink.Create;
  FStateChangeLink.OnChange := ImageListChange;

  FAutoScrollDelay := 1000;
  FAutoScrollInterval := 1;

  FOLEFormats := [ofNative, ofUnicodeText, ofText];

  FOffScreenBitmap := TBitmap.Create;
  FBackground := TPicture.Create;

  FGridLineColor := clBtnFace;
  FTreeLineColor := clBtnFace;

  FDefaultPasteMode := amAddChildLast;
  FMargin := 4;
  SetLength(FSingletonNodeArray, 1);
  AddThreadReference;
end;

//----------------------------------------------------------------------------------------------------------------------

destructor TBaseVirtualTree.Destroy;

begin
  InterruptValidation;
  CancelEditNode;
  // just in case it didn't happen already release the edit link
  FEditLink := nil;
  Clear;
  FBackground.Free;
  FImageChangeLink.Free;
  FStateChangeLink.Free;

  if Assigned(FDragManager) then
  begin
    // check if we still have pending clipboard data and reset it if necessary
    // to release the IDataObject instance once
    if OleIsCurrentClipBoard(FDragManager) = S_OK then
      OleSetClipboard(nil);
    // Do the final release for our compound interface implementation. 
    FDragManager._Release;
  end;
  FHeader.Free;
  FreeMem(FRoot);
  FPlusBM.Free;
  FMinusBM.Free;
  FHDotLine.Free;
  FVDotLine.Free;
  FOffScreenBitmap.Free;
  ReleaseThreadReference(Self);
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetBorderStyle(Value: TBorderStyle);

begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetHeader(const Value: TVTHeader);

begin
  FHeader.Assign(Value);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.ClearTempCache;

// make sure the temporary node cache is in a reliable state

begin
  FTempNodeCache := nil;
  FTempNodeCount := 0;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.ColumnIsEmpty(Node: PVirtualNode; Column: Integer): Boolean;

// Returns True if the given column is to be considered as being empty. This will usually be determined by
// descentants as the base tree implementation has not enough information to decide.

begin
  Result := False;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.CountVisibleChildren(Node: PVirtualNode): Cardinal;

// returns the number of visible child nodes of the given node
// Note: the given node must be visible.

begin
  Result := 0;
  // its direct children
  if vsExpanded in Node.States then
  begin
    // and their children
    Node := Node.FirstChild;
    while Assigned(Node) do
    begin
      Inc(Result, CountVisibleChildren(Node) + 1);
      Node := Node.NextSibling;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.CreateEditor(Node: PVirtualNode; Column: Integer): IVTEditLink;

begin
  Result := nil;
  if Assigned(FOnCreateEditor) then
  begin
    FOnCreateEditor(Self, Node, Column, Result);
    if Result = nil then
      ShowError(SEditLinkIsNil);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.CreateParams(var Params: TCreateParams);

begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or WS_CLIPCHILDREN or WS_CLIPSIBLINGS;
    if FBorderStyle = bsSingle then
      Style := Style or WS_BORDER;
    if Ctl3D and (FBorderStyle = bsSingle) then
      ExStyle := Params.ExStyle or WS_EX_CLIENTEDGE;

    WindowClass.Style := WindowClass.Style and not (CS_HREDRAW or CS_VREDRAW);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.PrepareBitmaps;

// initializes the contents of the internal bitmaps

var
  I: Integer;
  Run: PByte;

  //--------------- local function --------------------------------------------

  function MakePalette: HPALETTE;

  var
    LogPalette: TMaxLogPalette;
    WinColor: COLORREF;

  begin
    FillChar(LogPalette, SizeOf(LogPalette), 0);
    with LogPalette do
    begin
      palVersion := $300;
      palNumEntries := 2;
      WinColor := ColorToRGB(Color);
      palPalEntry[0].peBlue := (WinColor shr 16) and $FF;
      palPalEntry[0].peGreen := (WinColor shr 8) and $FF;
      palPalEntry[0].peRed := WinColor and $FF;
      WinColor := ColorToRGB(FGridLineColor);
      palPalEntry[1].peBlue := (WinColor shr 16) and $FF;
      palPalEntry[1].peGreen := (WinColor shr 8) and $FF;
      palPalEntry[1].peRed := WinColor and $FF;
    end;
    Result := CreatePalette(PLogPalette(@LogPalette)^);
  end;

  //--------------- end local function ----------------------------------------

begin
  with FMinusBM do
  begin
    // box is always of odd size
    Width := 9;
    Height := Width;
    with Canvas do
    begin
      Brush.Color := Self.Color;
      Pen.Color := FTreeLineColor;
      Rectangle(0, 0, Width, Height);
      Pen.Color := clBlack;
      MoveTo(2, Width div 2);
      LineTo(Width - 2 , Width div 2);
    end;
  end;

  with FPlusBM do
  begin
    Assign(FMinusBM);
    with Canvas do
    begin
      MoveTo(Width div 2, 2);
      LineTo(Width div 2, Width - 2);
    end;
  end;

  // horizontal line bitmap is twice as long as the window is wide (because it can happen that is partially
  // scrolled out to the left hand side)
  I := 2 * ClientWidth;
  if I > 0 then
  begin
    // make the width an even number
    Inc(I, I and 1);
    with FHDotLine do
    begin
      PixelFormat := pf1Bit;
      if Height <> 1 then
        Height := 1;
      if Width <> I then
        Width := I;

      // it appears the palette is damaged when resizing the bitmap
      Palette := MakePalette;
      Run:= Scanline[0];
      for I := 0 to (Width div 8) - 1 do
      begin
        Run^ := $AA;
        Inc(Run);
      end;
    end;
  end;

  // vertical line bitmap is as tall as the window is
  I := ClientHeight;
  if I > 0 then
  begin
    // make the height an even number
    Inc(I, I and 1);
    with FVDotLine do
    begin
      PixelFormat := pf1Bit;
      if Width <> 1 then
        Width := 1;
      if Height <> I then
        Height := I;

      Palette := MakePalette;
      for I := 0 to Height - 1 do
      begin
        Run := Scanline[I];
        if Odd(I) then
          Run^ := Run^ or $80
        else
          Run^ := Run^ and not $80;
      end;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.CalculateCacheEntryCount: Integer;

// calculates size of cache

begin
  if FVisibleCount > 1 then
    Result := Ceil(FVisibleCount / CacheThreshold)
  else
    Result := 0;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.FindInNodeCache(Node: PVirtualNode; var Index: Integer): Boolean;

// Looks through the node cache and returns the index of the found entry in Index. When successful then the result
// is True else False (in which case Index contains a value as nearest as possible to the given node).

var
  L, H, I, C: Integer;

begin
  Result := False;
  L := 0;
  H := High(FNodeCache);
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := Integer(FNodeCache[I].Node) - Integer(Node);
    if C < 0 then
      L := I + 1
    else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        L := I;
      end;
    end;
  end;
  Index := L;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SortNodeCache(L, R: Integer);

// sorts the node cache by node references

var
  Temp: TCacheEntry;
  I, J: Integer;
  Node: PVirtualNode;

begin
  if L < R then
  begin
    repeat
      I := L;
      J := R;
      Node := FNodeCache[(L + R) shr 1].Node;
      repeat
        while Cardinal(FNodeCache[I].Node) < Cardinal(Node) do
          Inc(I);
        while Cardinal(FNodeCache[J].Node) > Cardinal(Node) do
          Dec(J);
        if I <= J then
        begin
          // exchange items
          Temp := FNodeCache[I];
          FNodeCache[I] := FNodeCache[J];
          FNodeCache[J] := Temp;

          Inc(I);
          Dec(J);
        end;
      until I > J;
      if L < J then
        SortNodeCache(L, J);
      L := I;
    until I >= R;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoValidateCaches;

// This method actually fills the caches.
// The strategy is simple: Take the current number of visible nodes and distribute evenly a number of marks
// (which are stored in FPositionCache) so that iterating through the tree doesn't cost too much time.
// If there are less than 'CacheThreshold' nodes in the tree then the cache remains empty (it gets one entry
// which contains a nil node pointer to show the cache has been validated).
// Additionally, there's a second cache (FNodeCache) which holds the same values as FPositionCache, but is
// ordered by node references to make finding a particular node fast (used in GetDisplayRect etc.).
// Note: You can adjust the maximum number of nodes between two cache entries by changing CacheThreshold.

var
  EntryCount,
  CurrentTop,
  Index: Cardinal;
  CurrentNode,
  Temp: PVirtualNode;

begin
  FStates := FStates + [tsValidating] - [tsStopValidation];
  try
    if FVisibleCount <= CacheThreshold then
    begin
      SetLength(FPositionCache, 1);
      // show that cache is valid, but not used
      FPositionCache[0].Node := nil;
    end
    else
    begin
      EntryCount := CalculateCacheEntryCount;
      SetLength(FPositionCache, EntryCount);
      if FStartIndex > EntryCount then
        FStartIndex := EntryCount;

      // optimize validation by starting with FStartIndex if set
      if (FStartIndex > 0) and Assigned(FPositionCache[FStartIndex - 1].Node) then
      begin
        // index is the current entry in FPositionCache
        Index := FStartIndex - 1;
        // running term for absolute top value
        CurrentTop := FPositionCache[Index].AbsoluteTop;
        // running node pointer
        CurrentNode := FPositionCache[Index].Node;
      end
      else
      begin
        // index is the current entry in FPositionCache
        Index := 0;
        // running term for absolute top value
        CurrentTop := 0;
        // running node pointer
        CurrentNode := FRoot.FirstChild;
      end;

      // EntryCount serves as counter for processed nodes here. This value can always start at 0 as
      // the validation either starts also at index 0 or an index which is always a multiple of CacheThreshold
      // and EntryCount is only used with modulo CacheThreshold.
      EntryCount := 0;

      while not (tsStopValidation in FStates) do
      begin
        // increment before test, avoids storing very first node (which would make no sense)
        Inc(EntryCount);
        if (EntryCount mod CacheThreshold) = 0 then
        begin
          // new cache entry to set up
          with FPositionCache[Index] do
          begin
            Node := CurrentNode;
            AbsoluteTop := CurrentTop;
          end;
          Inc(Index);
        end;

        Inc(CurrentTop, CurrentNode.NodeHeight);
        // advance to next visible node
        Temp := GetNextVisible(CurrentNode);
        // if this was the last visible node and the cache isn't entirely filled then
        // use the last visible node as last entry in the cache
        if (Temp = nil) or (Integer(Index) = Length(FPositionCache)) then
        begin
          if Integer(Index) <= High(FPositionCache) then
          begin
            with FPositionCache[Index] do
            begin
              Node := CurrentNode;
              AbsoluteTop := CurrentTop;
            end;
            Inc(Index);
            // check if Index is still not at end of FPositionCache (shouldn't happen but to make the code more
            // stable I've included this (one time) check here)
            if Integer(Index) <= High(FPositionCache) then
              SetLength(FPositionCache, Index);
          end;
          Break;
        end;
      
        CurrentNode := Temp;
      end;
      // if validation has been stopped then shorten cache to what we have done so far
      if tsStopValidation in FStates then
        SetLength(FPositionCache, Index + 1);
    end;

    // finally prepare the node cache from values in FPositionCache
    FNodeCache := Copy(FPositionCache, 0, Length(FPositionCache));
    SortNodeCache(0, High(FNodeCache));
  finally
    FStates := FStates - [tsValidating, tsStopValidation];
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.InvalidateCache;

// mark the cache as invalid and initiate its validation

begin
  ValidateCache(0);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.ImageListChange(Sender: TObject);

begin
  if not (csDestroying in ComponentState) then
    Invalidate;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.InterruptValidation;

// waits until the worker thread has stopped validating the caches of this tree

begin
  if tsValidating in FStates then
  begin
    Include(FStates, tsStopValidation);
    // make a hard break until the worker thread has stopped validation
    WorkerThread.Priority := tpHighest;
    while tsValidating in FStates do
    begin
      Sleep(100);
      // just to be on the safe side...
      if WorkerThread.FCurrentTree <> Self then
      begin
        FStates := FStates - [tsValidating, tsStopValidation];
        Break;
      end;
    end;
    WorkerThread.Priority := tpNormal;
  end
  else // remove any pending validation
    WorkerThread.RemoveTree(Self);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.ValidateCache(StartIndex: Integer = 0);

// start cache validation if not already done by adding this instance to the worker thread's waiter list
// (if not already there) and signalling the thread it can start validating

begin
  // wait for thread to stop validation if it is currently validating this tree's cache
  InterruptValidation;

  if StartIndex > - 1 then
  begin
    if StartIndex < Length(FPositionCache) then
      SetLength(FPositionCache, StartIndex);
    FStartIndex := StartIndex;
  end
  else
    FStartIndex := 0;

  if (FPositionCache = nil) or
     (FPositionCache[0].Node = nil) or
     (CalculateCacheEntryCount <> Length(FPositionCache)) then
  begin
    // tell the thread this tree needs actually something to do
    WorkerThread.AddTree(Self);
    SetEvent(WorkEvent);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetNext(Node: PVirtualNode): PVirtualNode;

// get next node in tree (advance to next sibling of the node's parent or its parent, if necessary)

begin
  if Assigned(Node) then
  begin
    if Node = FRoot then
      Result := FRoot.FirstChild
    else
    begin
      if not (vsInitialized in Node.States) then
        InitNode(Node);
      // has this node children?
      if vsHasChildren in Node.States then
      begin
        if Node.ChildCount = 0 then
          InitChildren(Node);
        if Assigned(Node.FirstChild) then
        begin
          Result := Node.FirstChild;
          Exit;
        end;
      end;

      // is there a next sibling?
      if Assigned(Node.NextSibling) then
        Result := Node.NextSibling // yes, then take this
      else
      begin
        // no, so find a parent which has further nodes
        Result := Node;
        repeat
          Result := Result.Parent;
        until (Result = FRoot) or Assigned(Result.NextSibling);
        if Result = FRoot then
          Result := nil
        else
          Result := Result.NextSibling;
      end;
    end;
  end
  else
    Result := nil;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetNextNoInit(Node: PVirtualNode): PVirtualNode;

// optimized variant of GetNext, no initialization of nodes is performed (if a node is not initialized
// then it is considered as not being there)

begin
  Result := nil;
  if Assigned(Node) then
  begin
    if Node = FRoot then
      Result := FRoot.FirstChild
    else
    begin
      // if the node is initialized then look for its children, else (or if there's no child) then take its next sibling
      if (vsInitialized in Node.States) and Assigned(Node.FirstChild) then
        Result := Node.FirstChild
      else
        Result := Node.NextSibling;
        
      // Is there no next sibling?
      if Result = nil then
      begin
        // find a parent which has further nodes
        Result := Node;
        repeat
          Result := Result.Parent;
        until (Result = FRoot) or Assigned(Result.NextSibling);
        if Result = FRoot then
          Result := nil
        else
        begin
          Result := Result.NextSibling;
          // if the result node is not initialized then start over the entire process
          if not (vsInitialized in Result.States) then
            Result := GetNextNoInit(Result);
        end;
      end;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetNextSelected(Node: PVirtualNode): PVirtualNode;

// Returns the next node in the current selection logically after the given node. The given node must be in the
// current selection or the result is nil.
// Note: The selection is sorted by memory reference, not structurally. This means the nodes return by this method and
//       GetFirstSelected must to be considered as being random in order! Otherwise we'd need yet another cache and/or
//       quite a lot of CPU power.


var
  Index: Integer;

begin
  if Assigned(Node) then
  begin
    if FindNodeInSelection(Node, Index) and (Index < High(FSelection)) then
    begin
      Result := FSelection[Index + 1];
    end
    else
      Result := nil;
  end
  else
    Result := nil;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetNextSibling(Node: PVirtualNode): PVirtualNode;

// get next sibling of Node, initialize it if necessary

begin
  if Assigned(Node) and (Node <> FRoot) then
  begin
    Result := Node.NextSibling;
    if Assigned(Result) and not (vsInitialized in Result.States) then
      InitNode(Result);
  end
  else
    Result := nil;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetNextVisible(Node: PVirtualNode): PVirtualNode;

// get next node in tree which is visible (advance to next sibling of the node's parent or its parent, if necessary)

begin
  if Assigned(Node) then
  begin
    // check if node is visible or go back to the nearest parent which is visible
    // Note: FRoot is always expanded so the termination of this loop is ensured
    while not (vsExpanded in Node.Parent.States) do
      Node := Node.Parent;

    // is the node expanded and has it got children?
    if (vsExpanded in Node.States) and Assigned(Node.FirstChild) then
      Result := Node.FirstChild // yes, then take this
    else
      // is there a next sibling?
      if Assigned(Node.NextSibling) then
        Result := Node.NextSibling // yes, then take this
      else
      begin
        // no, so find a parent which has further visible nodes
        Result := Node;
        repeat
          Result := Result.Parent;
        until (Result = FRoot) or Assigned(Result.NextSibling);
        if Result = FRoot then
          Result := nil
        else
          Result := Result.NextSibling;
      end;
  end
  else
    Result := nil;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetPrevious(Node: PVirtualNode): PVirtualNode;

// get previous node in tree 

begin
  if Assigned(Node) and (Node <> FRoot) then
  begin
    // Is there a previous sibling?
    if Assigned(Node.PrevSibling) then
    begin
      // go down and find the last children
      Result := GetLastChild(Node.PrevSibling);
      if Result = nil then
        Result := Node.PrevSibling;
    end
    else
      // no previous sibling so the parent of the node is the previous visible node
      if Node.Parent <> FRoot then
        Result := Node.Parent
      else
        Result := nil
  end
  else
    Result := nil;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetPreviousVisible(Node: PVirtualNode): PVirtualNode;

// get previous node in tree which is visible

begin
  if Assigned(Node) and (Node <> FRoot) then
  begin
    // if the node is not visible then go up all levels until a visible parent is found
    // this is then the new node in question
    if not (vsExpanded in Node.Parent.States) then
    begin
      Result := Node;
      // Note: FRoot is always expanded so the termination of this loop is ensured
      while not (vsExpanded in Result.Parent.States) do
        Result := Result.Parent;
    end
    else
    begin
      // Is there a previous sibling?
      if Assigned(Node.PrevSibling) then
      begin
        Result := Node.PrevSibling;
        // go down and find the last visible children
        while (vsExpanded in Result.States) and Assigned(Result.LastChild) do
          Result := Result.LastChild;
      end
      else
        // no previous sibling so the parent of the node is the previous visible node
        if Node.Parent <> FRoot then
          Result := Node.Parent
        else
          Result := nil
    end;
  end
  else
    Result := nil;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetPreviousSibling(Node: PVirtualNode): PVirtualNode;

// get next sibling of Node, initialize it if necessary

begin
  if Assigned(Node) and (Node <> FRoot) then
  begin
    Result := Node.PrevSibling;
    if Assigned(Result) and not (vsInitialized in Result.States) then
      InitNode(Result);
  end
  else
    Result := nil;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetPreviousNoInit(Node: PVirtualNode): PVirtualNode;

// special version to get the previous node in the tree, not initialized nodes aren't considered
// while going down the child list (more exactily the search is stopped on such a node)

begin
  if Assigned(Node) and (Node <> FRoot) then
  begin
    // Is there a previous sibling?
    if Assigned(Node.PrevSibling) then
    begin
      // go down and find the last children
      Result := GetLastChildNoInit(Node.PrevSibling);
      if Result = nil then
        Result := Node.PrevSibling;
    end
    else
      // no previous sibling so the parent of the node is the previous visible node
      if Node.Parent <> FRoot then
        Result := Node.Parent
      else
        Result := nil
  end
  else
    Result := nil;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.AdjustPaintCellRect(Node: PVirtualNode; ColumnPosition: Integer; var NextNonEmpty: Integer;
  var ClipRect: TRect);

// used in descentants to modify the clip rectangle of the current column while painting a certain node

begin
  NextNonEmpty := ColumnPosition + 1;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.CalculateSelectionRect(X, Y: Integer): Boolean;

// Recalculates old and new selection rectangle given that X, Y are new mouse coordinates.
// Returns True if there was a change since the last call.

var
  MaxValue: Integer;

begin
  if tsDrawSelecting in FStates then
    FLastSelRect := FNewSelRect;
  FNewSelRect.BottomRight := Point(X - FOffsetX, Y - FOffsetY);
  if FNewSelRect.Right < 0 then
    FNewSelRect.Right := 0;
  if FNewSelRect.Bottom < 0 then
    FNewSelRect.Bottom := 0;
  MaxValue := ClientWidth;
  if FRangeX > Cardinal(MaxValue) then
    MaxValue := FRangeX;
  if FNewSelRect.Right > MaxValue then
    FNewSelRect.Right := MaxValue;
  MaxValue := ClientHeight;
  if FRangeY > Cardinal(MaxValue) then
    MaxValue := FRangeY;
  if FNewSelRect.Bottom > MaxValue then
    FNewSelRect.Bottom := MaxValue;
    
  Result := not CompareMem(@FLastSelRect, @FNewSelRect, SizeOf(FNewSelRect));
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.CanEdit(Node: PVirtualNode): Boolean;

// returns true if the given node can be edited

begin
  Result := (voEditable in FOptions) and Enabled;
  // application can override the default edit permission
  if Assigned(FOnEditing) then
    FOnEditing(Self, Node, FEditColumn, Result);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.Change(Node: PVirtualNode);

begin
  StopTimer(ChangeTimer);
  if assigned(FOnChange) then
    FOnChange(Self, Node);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetRootNodeCount: Cardinal;

begin
  Result := FRoot.ChildCount;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetRootNodeCount(Value: Cardinal);

begin
  // don't set the root node count until all other properties (in particular the OnInitNode event) have been set
  if csLoading in ComponentState then
    FRoot.ChildCount := Value
  else
    if FRoot.ChildCount <> Value then
    begin
      BeginUpdate;
      InterruptValidation;
      SetChildCount(FRoot, Value);
      EndUpdate;
    end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.FinishChunkHeader(Stream: TStream; StartPos, EndPos: Integer);

// used while streaming out a node to finally write out the size of the chunk

var
  Size: Integer;
  
begin
  // seek back to the second entry in the chunk header
  Stream.Position := StartPos + SizeOf(Integer);
  // determine size of chunk without the chunk header
  Size := EndPos - StartPos - SizeOf(TChunkHeader);
  // write the size...
  Stream.Write(Size, SizeOf(Size));
  // ... and seek to the last endposition
  Stream.Position := EndPos;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.FinishCutOrCopy;

// deletes nodes which are marked as being cutted

var
  Run: PVirtualNode;

begin
  if tsCutPending in FStates then
  begin
    Run := FRoot.FirstChild;
    while Assigned(Run) do
    begin
      if vsCutOrCopy in Run.States then
        DeleteNode(Run);
      Run := GetNextNoInit(Run);
    end;
    Exclude(FStates, tsCutPending);
  end
  else
    if tsCopyPending in FStates then
    begin
      Run := FRoot.FirstChild;
      while Assigned(Run) do
      begin
        Exclude(Run.States, vsCutOrCopy);
        Run := GetNextNoInit(Run);
      end;
      Exclude(FStates, tsCopyPending);
    end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.FlushClipboard;

// Used to render the data which is currently on the clipboard (finishes delayed rendering).

begin
  if OleIsCurrentClipBoard(FDragManager) = S_OK then
    OleFlushClipboard;
  FStates := FStates - [tsCopyPending, tsCutPending];
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.CopyTo(Source: PVirtualNode; Tree: TBaseVirtualTree; Mode: TVTNodeAttachMode;
  ChildrenOnly: Boolean): PVirtualNode;

// just a simplified method to allow to copy nodes to the root of another tree

begin
  Result := CopyTo(Source, Tree.FRoot, Mode, ChildrenOnly);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.CopyTo(Source, Target: PVirtualNode; Mode: TVTNodeAttachMode;
  ChildrenOnly: Boolean): PVirtualNode;

// Copies Source and all its child nodes to Target.
// Mode is used to specify further where to add the new node actually (as sibling of Target or as child of Target).
// Result is the newly created node to which source has been copied if ChildrenOnly is False or just contains Target
// in the other case.
// ChildrenOnly determines whether to copy also the source node or only its child nodes.

var
  TargetTree: TBaseVirtualTree;
  Stream: TMemoryStream;

begin
  Assert(TreeFromNode(Source) = Self, 'CopyTo: the source tree must contain the source node.');

  Result := nil;
  if (Mode <> amNowhere) and Assigned(Source) and (Source <> FRoot) then
  begin
    // assume that an empty destination means the root in this (the source) tree
    if Target = nil then
    begin
      TargetTree := Self;
      Target := FRoot;
      Mode := amAddChildFirst;
    end
    else
      TargetTree := TreeFromNode(Target);

    if Target = TargetTree.FRoot then
    begin
      case Mode of
        amInsertBefore:
          Mode := amAddChildFirst;
        amInsertAfter:
          Mode := amAddChildLast;
      end;
    end;

    Stream := TMemoryStream.Create;
    try
      // write all nodes into a temprary stream depending on the ChildrenOnly flag
      if not ChildrenOnly then
        WriteNode(Stream, Source)
      else
      begin
        Source := Source.FirstChild;
        while Assigned(Source) do
        begin
          WriteNode(Stream, Source);
          Source := Source.NextSibling;
        end;
      end;
      // now load the serialized nodes into the target node (tree)
      TargetTree.BeginUpdate;
      try
        Stream.Position := 0;
        while Stream.Position < Stream.Size do
        begin
          Result := TargetTree.InsertNode(Target, Mode);
          TargetTree.InternalAddFromStream(Stream, Result);
          if not DoNodeCopying(Result) then
            TargetTree.DeleteNode(Result)
          else
            DoNodeCopied(Result);
        end;
        if ChildrenOnly then
          Result := Target;
      finally
        TargetTree.EndUpdate;
      end;
    finally
      Stream.Free;
    end;

    with TargetTree do
    begin
      if FUpdateCount = 0 then
      begin
        InvalidateCache;
        UpdateScrollBars(True);
        Invalidate;
      end;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.CopyToClipBoard;

begin
  if FSelectionCount > 0 then
  begin
    Include(FStates, tsClipboardCancelling);
    try
      CancelCutOrCopy;
    finally
      Exclude(FStates, tsClipboardCancelling);
    end;
    Include(FStates, tsCopyPending);
    MarkCutCopyNodes;
    if Failed(OleSetClipboard(FDragManager)) then
      ShowError(SClipboardFailed);
    Invalidate;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.CutToClipBoard;

begin
  if FSelectionCount > 0 then
  begin
    Include(FStates, tsClipboardCancelling);
    try
      CancelCutOrCopy;
    finally
      Exclude(FStates, tsClipboardCancelling);
    end;
    Include(FStates, tsCutPending);
    MarkCutCopyNodes;
    if Failed(OleSetClipboard(FDragManager)) then
      ShowError(SClipboardFailed);
    Include(FStates, tsCopyPending);
    Invalidate;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DeleteChildren(Node: PVirtualNode; ResetHasChildren: Boolean = False);

// removes all children and their children from memory without changing the vsHasChildren style by default

var
  Run,
  Mark: PVirtualNode;
  LastTop,
  LastLeft: Integer;

begin
  if Node.ChildCount > 0 then
  begin
    LastLeft := FOffsetX;
    LastTop := FOffsetY;

    if IsVisible[Node] and (vsExpanded in Node.States) then
      Dec(FVisibleCount, Node.ChildCount);
    Run := Node.LastChild;
    while Assigned(Run) do
    begin
      Include(Run.States, vsDeleting);
      Mark := Run;
      Run := Run.PrevSibling;
      // important, to avoid exchange of invalid pointers while disconnecting the node
      if Assigned(Run) then
        Run.NextSibling := nil;
      // Need to execute the whole chain only if the node has already been initialized
      // otherwise it can neither be in the selection nor focused nor have got children.
      // Hence just delete it.
      if vsInitialized in Mark.States then
        DeleteNode(Mark)
      else
        DoFreeNode(Mark);
    end;
    if ResetHasChildren then
      Exclude(Node.States, vsHasChildren);
    Node.ChildCount := 0;
    if (Node = FRoot) or (vsDeleting in Node.States) then
    begin
      Node.TotalHeight := Node.NodeHeight;
      Node.TotalCount := 1;
    end
    else
    begin
      AdjustTotalHeight(Node, Node.NodeHeight);
      AdjustTotalCount(Node, 1);
    end;
    Node.FirstChild := nil;
    Node.LastChild := nil;

    if FUpdateCount = 0 then
    begin
      UpdateScrollbars(True);
      // invalidate entire tree if it scrolled e.g. to make the last node also the
      // bottom node in the treeview
      if (LastLeft <> FOffsetX) or (LastTop <> FOffsetY) then
        Invalidate;
      DoStructureChange(Node);
    end
    else
      Include(FStates, tsStructureChangePending);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DeleteNode(Node: PVirtualNode);

var
  LastTop,
  LastLeft: Integer;
  Parent: PVirtualNode;

begin
  if Assigned(Node) and (Node <> FRoot) then
  begin
    // determine parent node for structure change notification
    if Node.Parent = FRoot then
      Parent := nil
    else
      Parent := Node.Parent;

    LastLeft := FOffsetX;
    LastTop := FOffsetY;
    if FUpdateCount = 0 then
    begin
      RemoveFromSelection(Node);
      InvalidateToBottom(Node);
    end
    else
      InternalRemoveFromSelection(Node);

    Include(FStates, tsHintCancelling);

    DeleteChildren(Node);
    InternalDisconnectNode(Node);
    DoFreeNode(Node);                

    if FUpdateCount = 0 then
    begin
      UpdateScrollbars(True);
      // invalidate entire tree if it scrolled e.g. to make the last node also the
      // bottom node in the treeview
      if (LastLeft <> FOffsetX) or (LastTop <> FOffsetY) then
        Invalidate;
      DoStructureChange(Parent);
    end
    else
      Include(FStates, tsStructureChangePending);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.CancelCutOrCopy;

// resets nodes which are marked as being cutted

var
  Run: PVirtualNode;

begin
  if ([tsCutPending, tsCopyPending] * FStates) <> [] then
  begin
    Run := FRoot.FirstChild;
    while Assigned(Run) do
    begin
      if vsCutOrCopy in Run.States then
        Exclude(Run.States, vsCutOrCopy);
      Run := GetNextNoInit(Run);
    end;
    OleSetClipboard(nil);
  end;
  FStates := FStates - [tsCutPending, tsCopyPending, tsClipboardOperation];
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.Clear;

begin
  BeginUpdate;
  try
    InterruptValidation;
    if (ClipboardStates * FStates) <> [] then
    begin
      Include(FStates, tsClipboardCancelling);
      CancelCutOrCopy;
      FStates := FStates - ClipboardStates - [tsClipboardCancelling];
    end;
    ClearSelection;
    DeleteChildren(FRoot);
    FRoot.FirstChild := nil;
    FRoot.LastChild := nil;
    FLastSelected := nil;
    FFocusedNode := nil;
    FCurrentHotNode := nil;
    FVisibleCount := 0;
    FOffsetX := 0;
    FOffsetY := 0;
  finally
    EndUpdate;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.AdjustTotalCount(Node: PVirtualNode; Value: Integer; relative: Boolean = False);

// sets a node's total count to the given value and recursively adjusts the parent's total count
// (actually, the adjustment is done iteratively to avoid function call overheads)

var
  Difference: Integer;
  Run: PVirtualNode;

begin
  if relative then
    Difference := Value
  else 
    Difference := Integer(Value) - Integer(Node.TotalCount);
  if Difference <> 0 then
  begin
    Run := Node;
    // root node has as parent the tree view
    while Assigned(Run) and (Run <> Pointer(Self)) do
    begin
      Inc(Integer(Run.TotalCount), Difference);
      Run := Run.Parent;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.AdjustTotalHeight(Node: PVirtualNode; Value: Integer; relative: Boolean = False);

// sets a node's total height to the given value and recursively adjusts the parent's total height

var
  Difference: Integer;
  Run: PVirtualNode;

begin
  if relative then
    Difference := Value
  else
    Difference := Integer(Value) - Integer(Node.TotalHeight);
  if Difference <> 0 then
  begin
    Run := Node;
    // root node has as parent the tree view
    while True do
    begin
      Inc(Integer(Run.TotalHeight), Difference);
      Run := Run.Parent;
      // stop update if there is no parent (not yet connected tree) or the loop reached the tree
      // or the parent isn't expanded
      if (Run = nil) or (Run = Pointer(Self)) or not (vsExpanded in Run.States) then
        Break;
    end;
    if FUpdateCount = 0 then
      UpdateVerticalScrollBar(False);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoFocusChange(Node: PVirtualNode; Column: Integer);

begin
  if Assigned(FOnFocusChanged) then
    FOnFocusChanged(Self, Node, Column);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.DoFocusChanging(OldNode, NewNode: PVirtualNode; OldColumn, NewColumn: Integer): Boolean;

begin
  Result := True;
  if Assigned(FOnFocusChanging) then
    FOnFocusChanging(Self, OldNode, NewNode, OldColumn, NewColumn, Result);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoFreeNode(Node: PVirtualNode);

begin
  if Node = FCurrentHotNode then
    FCurrentHotNode := nil;
  if (vsInitialized in Node.States) and Assigned(FOnFreeNode) then
    FOnFreeNode(Self, Node);
  FreeMem(Node);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.DoGetImageIndex(Node: PVirtualNode; Kind: TVTImageKind; Column: Integer): Integer;

begin
  Result := -1;
  if Assigned(FOnGetImage) then
    FOnGetImage(Self, Node, Kind, Column, Result);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.DoGetNodeHint(Node: PVirtualNode; Column: Integer): WideString;

begin
  Result := Hint;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.DoGetNodeTooltip(Node: PVirtualNode; Column: Integer): WideString;

begin
  Result := Hint;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.DoGetNodeWidth(Node: PVirtualNode; Column: Integer): Integer;

begin
  Result := 0;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoInitChildren(Node: PVirtualNode; var ChildCount: Cardinal);

begin
  if Assigned(FOnInitChildren) then
    FOnInitChildren(Self, Node, ChildCount);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoInitNode(Parent, Node: PVirtualNode; var InitStates: TVirtualNodeInitStates);

begin
  InitStates := [];
  if Assigned(FOnInitNode) then
    FOnInitNode(Self, Parent, Node, InitStates);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoLoadUserData(Node: PVirtualNode; Stream: TStream);

begin
  if Assigned(FOnLoadNode) then
    if Node = FRoot then
      FOnLoadNode(Self, nil, Stream)
    else
      FOnLoadNode(Self, Node, Stream);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoNodeCopied(Node: PVirtualNode);

begin
  if Assigned(FOnNodeCopied) then
    FOnNodeCopied(Self, Node);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.DoNodeCopying(Node: PVirtualNode): Boolean;

begin
  Result := True;
  if Assigned(FOnNodeCopying) then
    FOnNodeCopying(Self, Node, Result);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoNodeMoved(Node: PVirtualNode);

begin
  if Assigned(FOnNodeMoved) then
    FOnNodeMoved(Self, Node);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.DoNodeMoving(Node, NewParent: PVirtualNode): Boolean;

begin
  Result := True;
  if Assigned(FOnNodeMoving) then
    FOnNodeMoving(Self, Node, NewParent, Result);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoPaintDropMark(Canvas: TCanvas; Node: PVirtualNode; R: TRect);

// draws the drop mark into the given rectangle
// Note: Changed properties of the given canvas should be reset to their previous values.

var
  SaveBrushColor: TColor;
  SavePenStyle: TPenStyle;

begin
  if FLastDropMode in [dmAbove, dmBelow] then
    with Canvas do
    begin
      SavePenStyle := Pen.Style;
      Pen.Style := psClear;
      SaveBrushColor := Brush.Color;
      Brush.Color := FDropMarkColor;

      if FLastDropMode = dmAbove then
      begin
        Polygon([Point(R.Left + 2, R.Top),
                 Point(R.Right - 2, R.Top),
                 Point(R.Right - 2, R.Top + 6),
                 Point(R.Right - 6, R.Top + 2),
                 Point(R.Left + 6 , R.Top + 2),
                 Point(R.Left + 2, R.Top + 6)
        ]);
      end
      else
        Polygon([Point(R.Left + 2, R.Bottom - 1),
                 Point(R.Right - 2, R.Bottom - 1),
                 Point(R.Right - 2, R.Bottom - 8),
                 Point(R.Right - 7, R.Bottom - 3),
                 Point(R.Left + 7 , R.Bottom - 3),
                 Point(R.Left + 2, R.Bottom - 8)
        ]);
      Brush.Color := SaveBrushColor;
      Pen.Style := SavePenStyle;
    end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoPaintNode(Canvas: TCanvas; Node: PVirtualNode; ClippingRect, NodeRect: TRect;
  Column, ColumnIndex: Integer);

begin
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.HandleMouseDown(var Message: TWMMouse);

// centralized mouse button down handling

var
  LastFocused,
  Node: PVirtualNode;
  Column: Integer;
  ShiftState: TShiftState;
  HitInfo: THitInfo;

  // helper variables to shorten boolean equations/expressions
  AutoDrag,             // automatic drag start
  IsFocused,            // tree is currently focused
  IsHit,                // there's a node hit
  MultiSelect,          // multiselection is enabled
  ShiftEmpty,           // ShiftState = []
  NodeSelected: Boolean; // the new node (if any) is selected
  NewColumn: Boolean;   // column changed

begin  
  if tsEditPending in FStates then
  begin
    StopTimer(EditTimer);
    Exclude(FStates, tsEditPending);
  end;
  // get information about the hit
  Node := GetHitTestInfoAt(Message.XPos, Message.YPos, HitInfo);

  // change column only if we have hit the node label
  if (hiOnItemLabel in HitInfo.HitPosition) or
     ([voFullRowSelect, voGridExtensions] * FOptions <> []) then
  begin
    NewColumn := FFocusedColumn <> HitInfo.HitColumn;
    if voExtendedFocus in FOptions then
      Column := HitInfo.HitColumn
    else
      Column := FHeader.MainColumn;
  end
  else
  begin
    NewColumn := False;
    Column := FFocusedColumn;
  end;

  // translate keys and filter out shift and ctrl key
  ShiftState := KeysToShiftState(Message.Keys) * [ssShift, ssCtrl];
       
  // Various combinations determine what states the tree enters now.
  // Initialize shorthand variables to avoid the following expressions getting too large
  // and to avoid repeative checks. I'm not sure if this is the most efficient way but getting
  // equations from a table having 7 variables and resulting in 6 (possibly parallel) states/actions
  // led to the constructs shown below:
  AutoDrag := (DragMode = dmAutomatic) or Dragging; // dragging might be started in the inherited handler manually
  IsFocused := Focused;
  IsHit := (hiOnItemLabel in HitInfo.HitPosition) or
           (hiOnItemBitmap in HitInfo.HitPosition) or
           (([voFullRowSelect, voGridExtensions] * FOptions <> []) and Assigned(Node));
  MultiSelect := voMultiSelect in FOptions;
  ShiftEmpty := ShiftState = [];
  NodeSelected := IsHit and (vsSelected in Node.States);

  // focus change
  if not IsFocused then
  begin
    SetFocus;
    IsFocused := True;
  end;
       
  // handle button clicks
  if (hiOnItemButton in HitInfo.HitPosition) and (vsHasChildren in Node.States) then
  begin
    ToggleNode(Node);
    Exit;
  end;

  // check event
  if hiOnItemCheckBox in HitInfo.HitPosition then
  begin
    // if the check node is already assigned then there is a pending check event
    // initiated by the keyboard (keep this)
    if FCheckNode = nil then
    begin
      FCheckNode := Node;
      if Node.CheckType = ctButton then
        Node.CheckState := csPressed;
      RepaintNode(Node);
    end;
    Exit;
  end;

  // keep this node's level in case we need it for constraint selection
  if (FRoot.ChildCount > 0) and ShiftEmpty or (FSelectionCount = 0) then
    if Assigned(Node) then
      FLastSelectionLevel := GetNodeLevel(Node)
    else
      FLastSelectionLevel := GetNodeLevel(GetLastVisibleChild(nil));

  // pending clearance
  if MultiSelect and ShiftEmpty and
     not (hiOnItemCheckbox in HitInfo.HitPosition) and
     ((not IsHit and IsFocused) or
     (IsHit and ShiftEmpty and AutoDrag and NodeSelected)) then
    Include(FStates, tsClearPending);

  // immediate clearance
  if IsHit and (not NodeSelected or NodeSelected and not AutoDrag) 
     and (ShiftEmpty or not MultiSelect) then
  begin
    Assert(not (tsClearPending in FStates), 'pending clear and direct clear are mutual exclusive!');
    ClearSelection;
  end;
       
  // pending node edit
  if IsFocused and (hiOnItemLabel in HitInfo.HitPosition) and NodeSelected and not NewColumn and ShiftEmpty then
    Include(FStates, tsEditPending);

  // user starts a selection with a selection rectangle
  if not IsHit and MultiSelect then
  begin
    Include(FStates, tsDrawSelPending);
    FDrawSelShiftState := ShiftState;
    FNewSelRect := Rect(Message.XPos - FOffsetX, Message.YPos - FOffsetY,
                        Message.XPos - FOffsetX, Message.YPos - FOffsetY);
    FLastSelRect := FNewSelRect;
    Exit;
  end;
       
  // keep current mouse position
  FDragStartPos := Point(Message.XPos, Message.YPos);

  // handle selection and node focus change
  if IsHit and
     DoFocusChanging(FFocusedNode, Node, FFocusedColumn, Column) then
  begin
    FFocusedColumn := Column;
    if DragKind = dkDock then
    begin
      StopTimer(ScrollTimer);
      FStates := FStates - [tsScrollPending, tsScrolling];
    end;
    // get the currently focused node to make multiple multi-selection blocks possible
    LastFocused := FFocusedNode;
    FocusedNode := Node;
    if MultiSelect and not Dragging and not ShiftEmpty then
      HandleClickSelection(LastFocused, Node, ShiftState)
    else
    begin
      if ShiftEmpty then
        FRangeAnchor := Node;

      // No dragging active? Then select the new node here.
      if not (AutoDrag or Dragging) then
        if NodeSelected then
          InternalAddToSelection(Node, True)
        else
          AddToSelection(Node);
    end;
    // drag'n drop initiation (if auto mode)
    if AutoDrag and ShiftEmpty then
      BeginDrag(False);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.HandleMouseUp(var Message: TWMMouse);

// counterpart to the mouse down handler

var
  HitInfo: THitInfo;
  ReleaseNode: PVirtualNode;

begin
  // reset pending or persistent states
  if IsMouseSelecting then
  begin
    FStates := FStates - [tsDrawSelecting, tsDrawSelPending];
    Invalidate;
  end;

  if tsClearPending in FStates then
  begin
    InternalClearSelection;
    Invalidate;
    // do change notification only if it will not be done by the following selection code 
    if not (tsDragPending in FStates) then
      DoChange(nil);
  end;

  ReleaseNode := GetHitTestInfoAt(Message.XPos, Message.YPos, HitInfo);

  // The focused node is not selected but the mouse has been released over it then
  // its selected state must have been deleted in the clear selection call above and
  // we need to reselect the node.
  if (tsDragPending in FStates) and not (vsSelected in FFocusedNode.States) then
  begin
    AddToSelection(FFocusedNode);
    InvalidateNode(FFocusedNode);
  end;
  FStates := FStates - [tsDragPending, tsDragging, tsClearPending, tsDrawSelPending, tsScrollPending, tsScrolling];
  StopTimer(ScrollTimer);

  // an assigned check node shows a pending check event
  if assigned(FCheckNode) then
  begin
    // Is the mouse still over the same node?
    if (ReleaseNode = FCheckNode) and
       (hiOnItem in HitInfo.HitPosition) then
    begin
      DoCheckClick(FCheckNode);
    end;
    InvalidateNode(FCheckNode);
    FCheckNode := nil;
  end;

  // handle a pending edit event
  if tsEditPending in FStates then
  begin
    // Is the mouse still over the same node?
    if (ReleaseNode = FFocusedNode) and
       (hiOnItem in HitInfo.HitPosition) and CanEdit(FFocusedNode) then
    begin
      FEditColumn := FFocusedColumn;
      SetTimer(Handle, EditTimer, 1000, nil);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.InitChildren(Node: PVirtualNode);

// initiates the initialization of the child number of the given node

var
  Count: Cardinal;

begin
  if Assigned(Node) and
     (Node <> FRoot) and
     (vsHasChildren in Node.States) then
  begin
    Count := Node.ChildCount; 
    DoInitChildren(Node, Count);
    if Count = 0 then
    begin
      // remove any child node which is already there
      DeleteChildren(Node);
      Exclude(Node.States, vsHasChildren);
    end
    else
      SetChildCount(Node, Count);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.InitNode(Node: PVirtualNode);

// Initiates the initialization of the given node to allow the application to load needed data for it.

var
  InitStates: TVirtualNodeInitStates;

begin
  with Node^ do
  begin
    if Parent = FRoot then
      DoInitNode(nil, Node, InitStates)
    else
      DoInitNode(Parent, Node, InitStates);
    Include(States, vsInitialized);
    if ivsDisabled in InitStates then
      Include(States, vsDisabled);
    if ivsHasChildren in InitStates then
      Include(States, vsHasChildren);
    if ivsSelected in InitStates then
    begin
      FSingletonNodeArray[0] := Node;
      InternalAddToSelection(FSingletonNodeArray, 1, False);
    end;

    // Expanded may already be set (when called from ReinitNode) or be set in DoInitNode, allow both.
    if (vsExpanded in Node.States) xor (ivsExpanded in InitStates) then
    begin
      // expand node if not yet done (this will automatically initialize child nodes)
      if ivsExpanded in InitStates then
        ToggleNode(Node)
      else
        // if the node already was expanded then explicitly trigger child initialization
        if vsHasChildren in Node.States then
          InitChildren(Node);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.InvalidateNode(Node: PVirtualNode): TRect;

// initiate repaint of given node and returns the just invalidated rectangle

begin
  if FUpdateCount = 0 then
  begin
    Result := GetDisplayRect(Node, -1);
    InvalidateRect(Handle, @Result, False);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.InvalidateToBottom(Node: PVirtualNode);

// initiate repaint of client area starting at given node

var
  CurrentNode: PVirtualNode;
  CurrentTop: Integer;
  R: TRect;

begin
  if FUpdateCount = 0 then
  begin
    if (Node = nil) or (Node = FRoot) then
      Invalidate
    else
    begin
      CurrentNode := GetNodeAt(0, 0);
      if CompareNodePositions(Node, CurrentNode) < 0 then
      begin
        // Node is somewhere above the client area so invalidate all
        InvalidateRect(Handle, nil, False);
      end
      else
      begin
        CurrentTop := FLastNodeTop;
        while Assigned(CurrentNode) and (CurrentNode <> Node) and (CurrentTop <= ClientHeight) do
        begin
          Inc(CurrentTop, CurrentNode.NodeHeight);
          CurrentNode := GetNextVisible(CurrentNode);
        end;
        // Node in client area?
        if CurrentNode = Node then
        begin
          R := Rect(0, CurrentTop, ClientWidth, ClientHeight);
          InvalidateRect(Handle, @R, False);
        end;
        // else ignore because the given node is somewhere below the client area
      end;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.MakeNewNode: PVirtualNode;

var
  Size: Cardinal;

begin
  if csDesigning in ComponentState then
    Size := SizeOf(TVirtualNode)
  else
  begin
    // make sure FNodeDataSize is valid
    if FNodeDataSize = -1 then
      ValidateNodeDataSize(FNodeDataSize);

    // take record alignment into account
    if (SizeOf(TVirtualNode) mod 4) = 0 then
      Size := SizeOf(TVirtualNode) + FNodeDataSize
    else
      Size := SizeOf(TVirtualNode) and not 3 + 4 + FNodeDataSize;
  end;

  // AllocMem clears the new memory, in opposition to New
  Result := AllocMem(Size + InternalDataSize);
  // fill in some default values
  with Result^ do
  begin
    TotalCount := 1;
    TotalHeight := FDefaultNodeHeight;
    NodeHeight := FDefaultNodeHeight;
    Align := 50;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.UpdateDesigner;

var
  ParentForm: TCustomForm;
  
begin
  if (csDesigning in ComponentState) and
     HandleAllocated and
     not (csUpdating in ComponentState) then
  begin
    ParentForm := GetParentForm(Self);
    if Assigned(ParentForm) and Assigned(ParentForm.Designer) then
      ParentForm.Designer.Modified;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.UpdateScrollBars(DoRepaint: Boolean);

// adjusts scrollbars to reflect current size and paint offset of the tree

begin
  UpdateHorizontalScrollBar(DoRepaint);
  UpdateVerticalScrollBar(DoRepaint);
end;
                           
//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetCheckImage(Node: PVirtualNode): Integer;

// determines the index into the check image list for the given node depending on the check type
// of the parent and the node's enabled state

const
  CheckStateToCheckImage: array[ctCheckBox..ctRadioButton, csUnchecked..csCheckedGrayed, Boolean] of Integer = (
                        {csUnchecked,                     csChecked,                       csCheckedGrayed
                        {enabled/disabled                 enabled/disabled                 enabled/disabled
    {ctCheckBox}        ((ckCheckEmpty, ckCheckDisabled), (ckCheckChecked, ckCheckGrayed), (ckCheckEmpty, ckCheckDisabled)),
    {ctTriStateCheckBox}((ckCheckEmpty, ckCheckDisabled), (ckCheckChecked, ckCheckGrayed), (ckCheckGrayed, ckCheckGrayed)),
    {ctRadioButton}     ((ckRadioEmpty, ckRadioDisabled), (ckRadioChecked, ckRadioGrayed), (ckRadioEmpty, ckRadioDisabled))  
  );

begin
  case Node.CheckType of
    ctNone:
      Result := -1;
    ctButton:
      begin
        if (vsDisabled in Node.States) or not Enabled then
          Result := ckButtonGrayed
        else
          if Node.CheckState = csPressed then
            Result := ckButtonDown
          else
            Result := ckButtonUp;
      end
  else
    Result := CheckStateToCheckImage[Node.CheckType, Node.CheckState,
                                    (vsDisabled in Node.States) or (Node = FCheckNode) or not Enabled];
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.Paint;

// paints the tree using an off-screen bitmap

var
  VAlign: Integer;

  //--------------- local functions -------------------------------------------

  function GetRGBColor(Value: TColor): DWORD;

  // used to draw a cutted node's images
  
  begin
    Result := ColorToRGB(Value);
    case Result of
      clNone:
        Result := CLR_NONE;
      clDefault:
        Result := CLR_DEFAULT;
    end;
  end;

  //--------------- end local functions ---------------------------------------

var
  Node,
  Temp: PVirtualNode;
  R, TextR: TRect;
  X, W: Integer;
  ButtonX,
  ButtonY: Integer;
  ShowImages,
  ShowStateImages,
  ShowChecks,
  UseColumns,
  UseBackground,
  CutPending: Boolean;
  EraseAction: TItemEraseAction;
  BackColor: TColor;
  ColIndex,                          // the column which is currently being drawn (independent of col position)
  NextColIndex,                      // index of next column to draw (might not be ColIndex + 1)
  Column,                            
  ImageVOffset,
  Image: Integer;
  IndentSize: Integer;               // actual size of LineType to avoid frequent reallocation
  LineType: array of Integer;        // contains a list of IDs which determine the kind of line image to be drawn
                                     // in front of each item (see also DrawLineImage)
  NodeRegion: HRGN;
  NodeClipRect: TRect;

begin
  // adjust size of off screen bitmap (need to do the check here since WM_SIZE might come with
  // totally wrong client size values (can even be < 0!) due to buggy VCL alignment implementation)
  with FOffScreenBitmap do
  begin
    W := ClientWidth;
    if W < 0 then
      W := 0;
    if Width <> W then
    begin
      Height := 0; // avoid copying the whole bitmap
      Width := W;
    end;
    W := ClientHeight;
    if W < 0 then
      W := 0;
    if Height <> W then
      Height := W;
  end;

  FUpdateRect := Canvas.ClipRect;

  DoBeforePaint(FOffscreenBitmap.Canvas);

  with FOffScreenBitmap.Canvas do
  begin
    Font := Self.Font;
    Brush.Color := Color;
    Pen.Color := FTreeLineColor;
    UseBackground := (voShowBackground in FOptions) and (FBackground.Graphic is TBitmap);

    Node := GetNodeAt(0, FUpdateRect.Top);

    if Assigned(Node) then
    begin
      // bottom bound will later be adjusted
      R := Rect(0, FLastNodeTop, ClientWidth, FLastNodeTop);

      // for quick checks some intermediate variables are used
      ShowImages := Assigned(FImages);
      ShowStateImages := Assigned(FStateImages);
      ShowChecks := Assigned(FCheckImages) and (voCheckSupport in FOptions);
      UseColumns := FHeader.UseColumns;
      CutPending := tsCutPending in FStates;
      EraseAction := eaDefault;
      BackColor := Color;

      // build initial line index array depending on options and level of top node
      if voShowRoot in FOptions then
        X := 1
      else
        X := 0;
      Temp := Node;
      // determine indentation level of top node
      while Temp.Parent <> FRoot do
      begin
        Inc(X);
        Temp := Temp.Parent;
      end;

      // precalculate horizontal position of buttons relative to the column start
      ButtonX := (X * Integer(FIndent)) + Trunc((Integer(FIndent) - FPlusBM.Width) / 2 + 0.5) - FIndent;

      // set initial size of line index array (need this also as distance/indentation array)
      IndentSize := X;
      SetLength(LineType, X);
      // only draw lines if requested
      if voShowTreeLines in FOptions then
      begin
        // start over parent traversal if necessary
        Temp := Node;
        if Temp.Parent <> FRoot then
        begin
          // the very last image (the one immediately before the item label) is different
          if Assigned(Temp.NextSibling) then
            LineType[X - 1] := LineTopDownRight
          else
            LineType[X - 1] := LineTopRight;
          Temp := Temp.Parent;
          // now go up all parents
          repeat
            if Temp.Parent = FRoot then
              Break;
            Dec(X);
            if Assigned(Temp.NextSibling) then
              LineType[X - 1] := LineTopDown
            else
              LineType[X - 1] := -1; // leave blank
            Temp := Temp.Parent;
          until False;
        end;

        // prepare root level, temp points at this stage to a top level node
        if (voShowRoot in FOptions) and (voShowTreeLines in FOptions) then
          // Is the top node a root node?
          if Temp = Node then
          begin
            // first child gets the bottom-right bitmap if it isn't also the only child
            if Temp = FRoot.FirstChild then
              // only child?
              if Temp = FRoot.LastChild then
                LineType[0] := LineRight
              else
                LineType[0] := LineBottomRight
            else
              // real last child
              if Temp = FRoot.LastChild then
                LineType[0] := LineTopRight
              else
                LineType[0] := LineTopDownRight;
          end
          else
          begin
            // no, top node is not a top level node -> we need different painting
            if Assigned(Temp.NextSibling) then
              LineType[0] := LineTopDown
            else
              LineType[0] := -1; // leave blank
          end;
      end;

      // ----- main node loop
      while Assigned(Node) do
      begin
        // initialize node if not already done
        if not (vsInitialized in Node.States) then
          InitNode(Node);
        // set values which depend on initialized node
        R.Bottom := R.Top + Integer(Node.NodeHeight);

        // consider button and line alignment, but make sure neither the image nor the button (whichever is taller)
        // go out of the entire node height (100% means bottom alignment to the node's bounds)
        if ShowImages or ShowStateImages then
        begin
          if ShowImages then
            VAlign := FImages.Height
          else
            VAlign := FStateImages.Height;
          VAlign := Trunc((Node.NodeHeight - VAlign) * Node.Align / 100) + VAlign div 2
        end
        else
          if voShowButtons in FOptions then
            VAlign := Trunc((Node.NodeHeight - FPlusBM.Height) * Node.Align / 100) + FPlusBM.Height div 2
          else
            VAlign := Trunc(Node.NodeHeight * Node.Align / 100);
            
        ButtonY := VAlign - FPlusBM.Height div 2;

        // let application decide whether the node should be draw as normal or by the application itself
        if not DoBeforeItemPaint(FOffscreenBitmap.Canvas, Node, R) then
        begin
          // clear node background
          DoBeforeItemErase(FOffScreenBitmap.Canvas, Node, R, Backcolor, EraseAction);
          case EraseAction of
            eaDefault: // user does not want to customize background
              begin
                if UseBackground then
                begin
                  TileBackground(FBackground.Bitmap, FOffScreenBitmap.Canvas, R);
                  Brush.Color := Color;
                end
                else
                begin
                  if (voFullRowSelect in FOptions) and (vsSelected in Node.States) then
                  begin
                    if Focused then
                      Brush.Color := clHighLight
                    else
                      Brush.Color := clBtnFace;
                  end
                  else
                    Brush.Color := Color;

                  FillRect(R);
                end;
                DoAfterItemErase(FOffscreenBitmap.Canvas, Node, R);
              end;
            eaColor:
              begin
                // user has given a new background color
                Brush.Color := BackColor;
                FillRect(R);
                DoAfterItemErase(FOffscreenBitmap.Canvas, Node, R);
              end;
            // otherwise don't touch the background, the application will erase it
          end;

          // paint drop mark
          if Node = FCurrentTargetNode then
            DoPaintDropMark(FOffScreenBitmap.Canvas, Node, R);

          // go through all columns
          ColIndex := -1;
          NodeClipRect := R;
          OffsetRect(NodeClipRect, FOffsetX, 0);
          if UseColumns then
          begin
            ColIndex := FHeader.FColumns.GetFirstVisibleColumn;
            NodeClipRect.Right := NodeClipRect.Left;
            with FHeader.FColumns do
              if ColIndex > -1 then
                Inc(NodeClipRect.Right, Items[FColumnPositions[ColIndex]].Width)
              else
                ColIndex := Count;
          end
          else
            NodeClipRect.Right := ClientWidth;

          // now go through all visible columns (there's still one run if columns aren't used)
          with FHeader.FColumns do
          begin
            while (ColIndex < Count) and (NodeClipRect.Left < FUpdateRect.Right) do
            begin
              if ColIndex > -1 then
                Column := FColumnPositions[ColIndex]
              else
                Column := -1;
              if not UseColumns or (coVisible in Items[Column].FOptions) then
              begin    
                // 1) Draw grid lines if requested and then set a clipping rectangle, so nothing gets painted
                //    outside the current node rect.
                AdjustPaintCellRect(Node, ColIndex, NextColIndex, NodeClipRect);

                // paint only if visible
                if NodeClipRect.Right >= 0 then
                begin

                  // horizontal grid line
                  if voShowHorzGridLines in FOptions then
                    DrawDottedHLine(FOffScreenBitmap.Canvas, NodeClipRect.Left, NodeClipRect.Bottom - 1,
                                    NodeClipRect.Right - NodeClipRect.Left);

                  if UseColumns then
                  begin
                    // vertical grid line (don't draw if this is the last column and the header is in autosize mode)
                    if (voShowVertGridLines in FOptions) and
                       (not (hoAutoResize in FHeader.FOptions) or (ColIndex < Count - 1)) then
                      DrawDottedVLine(FOffScreenBitmap.Canvas, NodeClipRect.Right - 1, NodeClipRect.Top,
                                      NodeClipRect.Bottom - NodeClipRect.Top);

                    with NodeClipRect do
                    begin
                      Dec(Right, 3);
                      NodeRegion := CreateRectRgn(Left, Top, Right + 1, Bottom);
                    end;
                    SelectClipRgn(Handle, NodeRegion);
                    DeleteObject(NodeRegion);
                  end;

                  TextR := NodeClipRect;
                  // distance from left column border (margin)
                  Inc(TextR.Left, FMargin);
                  // the following stuff is only for the main column
                  if (ColIndex = -1) or (FColumnPositions[ColIndex] = 0) then
                  begin
                    Inc(TextR.Left, IndentSize * Integer(FIndent));

                    // 2) paint tree lines if requested
                    if voShowTreeLines in FOptions then
                    begin
                      for X := 0 to IndentSize - 1 do
                        DrawLineImage(FOffScreenBitmap.Canvas, NodeClipRect.Left + X * Integer(FIndent), R.Top,
                                      Node.NodeHeight, VAlign, LineType[X]);
                    end;

                    // 3) draw buttons if requested
                    if (voShowButtons in FOptions) and (vsHasChildren in Node.States) then
                    begin
                      if vsExpanded in Node.States then
                        Draw(NodeClipRect.Left + ButtonX, R.Top + ButtonY, FMinusBM)
                      else
                        Draw(NodeClipRect.Left + ButtonX, R.Top + ButtonY, FPlusBM);
                    end;

                    // 4) draw check mark if enabled
                    if ShowChecks then
                    begin
                      Image := GetCheckImage(Node);
                      ImageVOffset := VAlign - FCheckImages.Height div 2 + 1;
                      if Image > -1 then
                      begin
                        FCheckImages.Draw(FOffScreenBitmap.Canvas, TextR.Left - 1, TextR.Top + ImageVOffset, Image);
                        Inc(TextR.Left, FCheckImages.Width + 2);
                      end;
                    end;
                  end;

                  // continue with stuff for all columns
                  // 5) draw state image if available
                  if ShowStateImages then
                  begin
                    Image := DoGetImageIndex(Node, ikState, Column);
                    ImageVOffset := VAlign - FStateImages.Height div 2;
                    if Image > -1 then
                    begin
                      if CutPending and (vsCutOrCopy in Node.States) then
                      begin
                        ImageList_DrawEx(FStateImages.Handle, Image, Handle, TextR.Left, TextR.Top + ImageVOffset, 0, 0,
                          GetRGBColor(FStateImages.BkColor), GetRGBColor(FStateImages.BlendColor), ILD_FOCUS)
                      end
                      else
                        FStateImages.Draw(FOffScreenBitmap.Canvas, TextR.Left, TextR.Top + ImageVOffset, Image,
                          not (vsDisabled in Node.States) and Enabled);
                      Inc(TextR.Left, FStateImages.Width + 2);
                    end;
                  end;

                  // 6) draw image if available
                  if ShowImages then
                  begin
                    ImageVOffset := VAlign - FImages.Height div 2;
                    if vsSelected in Node.States then
                      Image := DoGetImageIndex(Node, ikSelected, Column)
                    else
                      Image := DoGetImageIndex(Node, ikNormal, Column);
                    if Image > -1 then
                    begin
                      if CutPending and (vsCutOrCopy in Node.States) then
                      begin
                        ImageList_DrawEx(FImages.Handle, Image, Handle, TextR.Left, TextR.Top + ImageVOffset, 0, 0,
                          GetRGBColor(FImages.BkColor), GetRGBColor(FImages.BlendColor), ILD_FOCUS);

                        // paint eventual overlay image
                        Image := DoGetImageIndex(Node, ikOverlay, Column);
                        if Image > -1 then
                        ImageList_DrawEx(FImages.Handle, Image, Handle, TextR.Left, TextR.Top + ImageVOffset, 0, 0,
                          GetRGBColor(FImages.BkColor), GetRGBColor(FImages.BlendColor), ILD_FOCUS);
                      end
                      else
                      begin
                        FImages.Draw(FOffScreenBitmap.Canvas, TextR.Left, TextR.Top + ImageVOffset, Image,
                                     not (vsDisabled in Node.States) and Enabled);

                        // paint eventual overlay image
                        Image := DoGetImageIndex(Node, ikOverlay, Column);
                        if Image > -1 then
                          FImages.Draw(FOffScreenBitmap.Canvas, TextR.Left, TextR.Top + ImageVOffset, Image,
                                       not (vsDisabled in Node.States) and Enabled);
                      end;
                      Inc(TextR.Left, FImages.Width + 2);
                    end;
                  end;

                  // determine remaining text rectangle
                  W := DoGetNodeWidth(Node, Column);
                  if UseColumns then
                  begin
                    TextR.Right := TextR.Left + W;
                    if TextR.Right > NodeClipRect.Right then
                      TextR.Right := NodeClipRect.Right;
                  end
                  else
                    TextR.Right := TextR.Left + W;

                  // 7) let descendants or application draw whatever they want,
                  //    but don't draw the node if it is currently being edited
                  if not ((tsEditing in FStates) and (Node = FFocusedNode) and
                    ((Column = FEditColumn) or not UseColumns)) then
                    DoPaintNode(FOffScreenBitmap.Canvas, Node, NodeClipRect, TextR, Column, ColIndex);
                end;
                // leave after first run if columns aren't used
                if not UseColumns then
                  Break;
              end;

              // move on to next column which might not be the one immediately following the current one
              // because of auto span feature
              ColIndex := NextColIndex;

              // move clip rectangle and continue with next column
              if (ColIndex < Count) and (coVisible in Items[FColumnPositions[ColIndex]].FOptions) then
              begin
                NodeClipRect.Left := Items[FColumnPositions[ColIndex]].Left;
                NodeClipRect.Right := NodeClipRect.Left + Items[FColumnPositions[ColIndex]].Width;
              end;

              // 8) remove last clip rectangle
              SelectClipRgn(Handle, 0);
            end;
          end;

          // this node is finished, notify descentants/application
          DoAfterItemPaint(FOffscreenBitmap.Canvas, Node, R);
        end;

        if R.Top >= FUpdateRect.Bottom then
          Break;
        R.Top := R.Bottom;

        // 9) advance to next visible node
        Temp := GetNextVisible(Node);
        if Assigned(Temp) then
        begin
          // adjust line bitmap (and so also indentation level)
          if Temp.Parent = Node then
          begin
            // new node is a child node
            // need to adjust previous bitmap level
            if IndentSize > 0 then
              if Assigned(Node.NextSibling) then
                LineType[IndentSize - 1] := LineTopDown
              else
                LineType[IndentSize - 1] := -1;
            // enhance line type array if necessary
            Inc(IndentSize);
            if Length(LineType) <= IndentSize then
              SetLength(LineType, IndentSize + 8);
            Inc(ButtonX, FIndent);
          end
          else
            if Node.Parent <> Temp.Parent then
            begin
              // went up one or more levels,
              // determine how many levels we went up actually
              while Node.Parent <> Temp.Parent do
              begin
                Dec(IndentSize);
                Dec(ButtonX, FIndent);
                Node := Node.Parent;
              end;
            end;

          // set new image in front of the new node
          if IndentSize > 0 then
            if Assigned(Temp.NextSibling) then
              LineType[IndentSize - 1] := LineTopDownRight
            else
              LineType[IndentSize - 1] := LineTopRight;
        end;
        Node := Temp;
      end;
    end
    else // init running rect to allow for correct backround erasing
      R := Rect(0, 0, ClientWidth, FLastNodeTop);

    // delete rest of window not covered by a node
    if R.Top < FUpdateRect.Bottom then
    begin
      R.Bottom := ClientHeight;
      if UseBackground then
        TileBackground(FBackground.Bitmap, FOffScreenBitmap.Canvas, R)
      else
      begin
        Brush.Color := Color;
        FillRect(R);
      end;
    end;

    if IsMouseSelecting then
    begin
      R := OrderRect(FNewSelRect);
      OffsetRect(R, FOffsetX, FOffsetY);
      SetTextColor(Handle, $FFFFFF);
      SetBkColor(Handle, 0);
      DrawFocusRect(R);
    end;
  end;

  DoAfterPaint(FOffscreenBitmap.Canvas);

  with FOffScreenBitmap, FUpdateRect do
    BitBlt(Self.Canvas.Handle, Left, Top, Right - Left, Bottom - Top, Canvas.Handle, Left, Top, SRCCOPY);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.InternalConnectNode(Node, Destination: PVirtualNode; Target: TBaseVirtualTree;
  Mode: TVTNodeAttachMode);

// connects Node with Destination depending on Mode
// No error checking takes place. Node as well as Destination must be valid. Node must never be a root node and
// Destination must not be a root node if Mode is amInsertBefore or amInsertAfter.

var
  Run: PVirtualNode;
  
begin
  // keep in mind that the destination node might belong to another tree
  with Target do
  begin
    case Mode of
      amInsertBefore:
        begin
          Node.PrevSibling := Destination.PrevSibling;
          Destination.PrevSibling := Node;
          Node.NextSibling := Destination;
          Node.Parent := Destination.Parent;
          Node.Index := Destination.Index;
          if Node.PrevSibling = nil then
            Node.Parent.FirstChild := Node
          else
            Node.PrevSibling.NextSibling := Node;
          
          // reindex all following nodes
          Run := Destination;
          while Assigned(Run) do
          begin
            Inc(Run.Index);
            Run := Run.NextSibling;
          end;

          Inc(Destination.Parent.ChildCount);
          Include(Destination.Parent.States, vsHasChildren);
          AdjustTotalCount(Destination.Parent, Node.TotalCount, True);
          if vsExpanded in Destination.Parent.States then
          begin
            AdjustTotalHeight(Destination.Parent, Node.TotalHeight, True);
            Inc(FVisibleCount, CountVisibleChildren(Node) + 1);
          end;
        end;
      amInsertAfter:
        begin
          Node.NextSibling := Destination.NextSibling;
          Destination.NextSibling := Node;
          Node.PrevSibling := Destination;
          Node.Parent := Destination.Parent;
          if Node.NextSibling = nil then
            Node.Parent.LastChild := Node
          else
            Node.NextSibling.PrevSibling := Node;
          Node.Index := Destination.Index;

          // reindex all following nodes
          Run := Node;
          while Assigned(Run) do
          begin
            Inc(Run.Index);
            Run := Run.NextSibling;
          end;

          Inc(Destination.Parent.ChildCount);
          Include(Destination.Parent.States, vsHasChildren);
          AdjustTotalCount(Destination.Parent, Node.TotalCount, True);
          if vsExpanded in Destination.Parent.States then
          begin
            AdjustTotalHeight(Destination.Parent, Node.TotalHeight, True);
            Inc(FVisibleCount, CountVisibleChildren(Node) + 1);
          end;
        end;
      amAddChildFirst:
        begin
          if Assigned(Destination.FirstChild) then
          begin
            // if there's a first child then there must also be a last child
            Destination.FirstChild.PrevSibling := Node;
            Node.NextSibling := Destination.FirstChild;
            Destination.FirstChild := Node;
          end
          else
          begin
            // first child node at this location
            Destination.FirstChild := Node;
            Destination.LastChild := Node;
            Node.NextSibling := nil;
          end;
          Node.PrevSibling := nil;
          Node.Parent := Destination;
          Node.Index := 0;
          // reindex all following nodes
          Run := Node.NextSibling;
          while Assigned(Run) do
          begin
            Inc(Run.Index);
            Run := Run.NextSibling;
          end;

          Inc(Destination.ChildCount);
          Include(Destination.States, vsHasChildren);
          AdjustTotalCount(Destination, Node.TotalCount, True);
          if vsExpanded in Destination.States then
          begin
            AdjustTotalHeight(Destination, Node.TotalHeight, True);
            Inc(FVisibleCount, CountVisibleChildren(Node) + 1);
          end;
        end;
      amAddChildLast:
        begin
          if Assigned(Destination.LastChild) then
          begin
            // if there's a last child then there must also be a first child
            Destination.LastChild.NextSibling := Node;
            Node.PrevSibling := Destination.LastChild;
            Destination.LastChild := Node;
          end
          else
          begin
            // first child node at this location
            Destination.FirstChild := Node;
            Destination.LastChild := Node;
            Node.PrevSibling := nil;
          end;
          Node.NextSibling := nil;
          Node.Parent := Destination;
          if Assigned(Node.PrevSibling) then
            Node.Index := Node.PrevSibling.Index + 1
          else
            Node.Index := 0;
          Inc(Destination.ChildCount);
          Include(Destination.States, vsHasChildren);
          AdjustTotalCount(Destination, Node.TotalCount, True);
          if vsExpanded in Destination.States then
          begin
            AdjustTotalHeight(Destination, Node.TotalHeight, True);
            Inc(FVisibleCount, CountVisibleChildren(Node) + 1);
          end;
        end;
    else
      // amNowhere: do nothing
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.InternalDisconnectNode(Node: PVirtualNode);

// disconnects the given node from its parent and siblings, the node's pointer are not reset so they can still be used
// after return from this method (probably a very short time only!)
// Note: Node must not be nil or the root node!

var
  Parent,
  Run: PVirtualNode;
                                                 
begin
  if not (vsDeleting in Node.States) then
  begin
    // some states are only temporary so take them out as they make no sense at the new location
    Node.States := Node.States - [vsChecking];
    Parent := Node.Parent;
    Dec(Parent.ChildCount);
    if Parent.ChildCount = 0 then
      Exclude(Parent.States, vsHasChildren);
    AdjustTotalCount(Parent, -Integer(Node.TotalCount), True);
    if vsExpanded in Parent.States then
    begin
      AdjustTotalHeight(Parent, -Integer(Node.TotalHeight), True);
      Dec(FVisibleCount, CountVisibleChildren(Node) + 1);
    end;
    if Assigned(Node.PrevSibling) then
      Node.PrevSibling.NextSibling := Node.NextSibling
    else
      Parent.FirstChild := Node.NextSibling;
      
    if Assigned(Node.NextSibling) then
    begin
      Node.NextSibling.PrevSibling := Node.PrevSibling;
      // reindex all following nodes
      Run := Node.NextSibling;
      while Assigned(Run) do
      begin
        Dec(Run.Index);
        Run := Run.NextSibling;
      end;
    end
    else
      Parent.LastChild := Node.PrevSibling;
  end;
  if Node = FFocusedNode then
    FFocusedNode := nil;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.LoadFromFile(const FileName: TFileName);

var
  FileStream: TFileStream;

begin
  FileStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(FileStream);
  finally
    FileStream.Free;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.LoadFromStream(Stream: TStream);

// clears the current content of the tree and loads a new structure from the given stream

var
  ThisID: TMagicID;
  Major,
  Minor: Cardinal;
  Node: PVirtualNode;

begin
  // check first whether this is a stream we can read
  Stream.ReadBuffer(ThisID, SizeOf(TMagicID));
  if (ThisID[0] = MagicID[0]) and
     (ThisID[1] = MagicID[1]) and
     (ThisID[2] = MagicID[2]) and
     (ThisID[5] = MagicID[5]) then
  begin
    Major := Word(ThisID[3]);
    Minor := Word(ThisID[4]);
    if (Major < VTStreamMajorVersion) or
       ((Major = VTStreamMajorVersion) and (Minor <= VTStreamMinorVersion)) then
    begin
      Clear;
      BeginUpdate;
      try
        while Stream.Position < Stream.Size do
        begin
          Node := AddChild(FRoot);
          InternalAddFromStream(Stream, Node);
        end;
        DoNodeCopied(nil);
      finally
        EndUpdate;
      end;
    end
    else
      ShowError(SWrongStreamVersion);
  end
  else
    ShowError(SWrongStreamFormat);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.MoveTo(Node: PVirtualNode; Tree: TBaseVirtualTree; Mode: TVTNodeAttachMode;
  ChildrenOnly: Boolean);

// just a simplified method to allow to move nodes to the root of another tree

begin
  MoveTo(Node, Tree.FRoot, Mode, ChildrenOnly);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.MoveTo(Source, Target: PVirtualNode; Mode: TVTNodeAttachMode; ChildrenOnly: Boolean);

// Moves the given node (and all its children) to Destination. Node must belong to the tree instance to which this
// MoveTo method belongs. Mode determines how to connect Node to Destination.
// This method might involve a change of the tree if Destination belongs to a different tree than Node. In this case a
// node translation might also be necessary depending on the node data size of source and target tree. If both are the
// same then no translation is performed and instead the node as well as its children are just newly connected.

var
  TargetTree: TBaseVirtualTree;
  Allowed: Boolean;
  NewNode: PVirtualNode;
  Stream: TMemoryStream;

begin
  Assert(TreeFromNode(Source) = Self, 'MoveTo: the source tree must contain the source node.');

  if (Mode <> amNowhere) and Assigned(Source) and (Source <> FRoot) then
  begin
    // assume that an empty destination means the root in this (the source) tree
    if Target = nil then
    begin
      TargetTree := Self;
      Target := FRoot;
      Mode := amAddChildFirst;
    end
    else
      TargetTree := TreeFromNode(Target);

    if Target = TargetTree.FRoot then
    begin
      case Mode of
        amInsertBefore:
          Mode := amAddChildFirst;
        amInsertAfter:
          Mode := amAddChildLast;
      end;
    end;

    if TargetTree = Self then
    begin
      // simple case: move node(s) within the same tree
      if Target = FRoot then
        Allowed := DoNodeMoving(Source, nil)
      else
        Allowed := DoNodeMoving(Source, Target);
      if Allowed then
      begin
        // check first that the node is not added as new child to a destination node which
        // is already a child of this node
        if (Mode in [amAddChildFirst, amAddChildLast]) and HasAsParent(Target, Source) then
          ShowError(SWrongMoveError);

        if not ChildrenOnly then
        begin
          // disconnect from old location
          InternalDisconnectNode(Source);
          // connect to new location
          InternalConnectNode(Source, Target, Self, Mode);
          DoNodeMoved(Source);
        end
        else
        begin
          // only child nodes should be moved
          Source := Source.FirstChild;
          while Assigned(Source) do
          begin
            NewNode := Source.NextSibling;
            // disconnect from old location
            InternalDisconnectNode(Source);
            // connect to new location
            InternalConnectNode(Source, Target, Self, Mode);
            DoNodeMoved(Source);
            Source := NewNode;
          end;
        end;
      end;
    end
    else
    begin
      // difficult case: move node(s) to another tree,
      // In opposition to node copying we ask only once if moving is allowed because
      // we cannot take back a move once done.
      if Target = TargetTree.FRoot then
        Allowed := DoNodeMoving(Source, nil)
      else
        Allowed := DoNodeMoving(Source, Target);
        
      if Allowed then
      begin
        Stream := TMemoryStream.Create;
        try
          // write all nodes into a temprary stream depending on the ChildrenOnly flag
          if not ChildrenOnly then
            WriteNode(Stream, Source)
          else
          begin
            Source := Source.FirstChild;
            while Assigned(Source) do
            begin
              WriteNode(Stream, Source);
              Source := Source.NextSibling;
            end;
          end;
          // now load the serialized nodes into the target node (tree)
          TargetTree.BeginUpdate;
          try
            Stream.Position := 0;
            while Stream.Position < Stream.Size do
            begin
              NewNode := TargetTree.InsertNode(Target, Mode);
              TargetTree.InternalAddFromStream(Stream, NewNode);
              DoNodeMoved(NewNode);
            end;
          finally
            TargetTree.EndUpdate;
          end;
        finally
          Stream.Free;
        end;
        // finally delete original nodes
        BeginUpdate;
        try
          if ChildrenOnly then
            DeleteChildren(Source)
          else
            DeleteNode(Source);
        finally
          EndUpdate;
        end;
      end;
    end;

    if (FUpdateCount = 0) and Allowed then
    begin
      InvalidateCache;
      UpdateScrollBars(True);
      Invalidate;
      if TargetTree <> Self then
        TargetTree.Invalidate;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.PaintTo(TargetCanvas: TCanvas; SourceRect: TBounds; SelectedOnly, MainOnly,
  Background, GridLines: Boolean);

// special version to render the entire tree content to the given canvas
// This method can be used to render the entire tree regardless of clipping rectangles etc.
// Useful to create a drag image or to render the tree to a bitmap or a printer canvas.
//
// If SelectedOnly is True then only currently selected nodes and their children are rendered.
// If MainOnly is True then only the main column is rendered.
// If Background is True then also the background image (if there is one) will be rendered (switch this off for a drag
// image.
// If GridLines is True then grid lines (if enabled via Options) are drawn too.
// Note: You can set up special transformations for the target canvas (mapping modes, viewport and window origin etc.)
//       to scale and place the target image finally.

var
  VAlign: Integer;

  //--------------- local functions -------------------------------------------

  function GetRGBColor(Value: TColor): DWORD;

  // used to draw a cutted node's images

  begin
    Result := ColorToRGB(Value);
    case Result of
      clNone:
        Result := CLR_NONE;
      clDefault:
        Result := CLR_DEFAULT;
    end;
  end;

  //--------------- end local functions ---------------------------------------

var
  Node,
  Temp: PVirtualNode;
  R, TextR: TRect;
  X, W: Integer;
  ButtonX,
  ButtonY: Integer;
  ShowImages,
  ShowStateImages,
  ShowChecks,
  UseColumns,
  UseBackground,
  CutPending: Boolean;
  EraseAction: TItemEraseAction;
  BackColor: TColor;
  ColIndex,
  NextColIndex,
  Column,
  ImageVOffset,
  Image: Integer;
  IndentSize: Integer;         // actual size of LineType to avoid frequent reallocation
  LineType: array of Integer;  // contains a list of IDs which determine the kind of line image to be drawn
                               // in front of each item (see also DrawLineImage)
  NodeRegion: HRGN;
  NodeClipREct: TRect;
  SelectLevel: Integer;        // > 0 if current node is selected or child/grandchild etc. of a selected node

begin
  DoBeforePaint(TargetCanvas);

  with TargetCanvas do
  begin
    Font := Self.Font;
    Brush.Color := Color;
    Pen.Color := clBtnFace;
    UseBackground := (voShowBackground in FOptions) and (FBackground.Graphic is TBitmap) and Background;

    Node := GetNodeAt(0, SourceRect.Top);

    SelectLevel := 0;
    if Assigned(Node) then
    begin
      // bottom bound will later be adjusted
      R := Rect(0, FLastNodeTop, SourceRect.Width, FLastNodeTop);

      // for quick checks some intermediate variables are used
      ShowImages := Assigned(FImages);
      ShowStateImages := Assigned(FStateImages);
      ShowChecks := Assigned(FCheckImages) and (voCheckSupport in FOptions);
      UseColumns := FHeader.UseColumns;
      CutPending := tsCutPending in FStates;
      EraseAction := eaDefault;
      BackColor := Color;

      // build initial line index array depending on options and level of top node
      if voShowRoot in FOptions then
        X := 1
      else
        X := 0;
      Temp := Node;
      // determine indentation level of top node and initial value of SelectLevel
      while Temp.Parent <> FRoot do
      begin
        Inc(X);
        Temp := Temp.Parent;
        // FRoot is never selected
        if vsSelected in Temp.States then
          Inc(SelectLevel);
      end;

      // precalculate horizontal position of buttons relative to the column start
      ButtonX := (X * Integer(FIndent)) + Trunc((Integer(FIndent) - FPlusBM.Width) / 2 + 0.5) - FIndent;

      // set initial size of line index array (need this also as distance/indentation array)
      IndentSize := X;
      SetLength(LineType, X);
      // only draw lines if requested
      if voShowTreeLines in FOptions then
      begin
        // start over parent traversal if necessary
        Temp := Node;
        if Temp.Parent <> FRoot then
        begin
          // the very last image (the one immediately before the item label) is different
          if Assigned(Temp.NextSibling) then
            LineType[X - 1] := LineTopDownRight
          else
            LineType[X - 1] := LineTopRight;
          Temp := Temp.Parent;
          // now go up all parents
          repeat
            if Temp.Parent = FRoot then
              Break;
            Dec(X);
            if Assigned(Temp.NextSibling) then
              LineType[X - 1] := LineTopDown
            else
              LineType[X - 1] := -1; // leave blank
            Temp := Temp.Parent;
          until False;
        end;

        // prepare root level, temp points at this stage to a top level node
        if (voShowRoot in FOptions) and (voShowTreeLines in FOptions) then
          // Is the top node a root node?
          if Temp = Node then
          begin
            // first child gets the bottom-right bitmap if it isn't also the only child
            if Temp = FRoot.FirstChild then
              // only child?
              if Temp = FRoot.LastChild then
                LineType[0] := LineRight
              else
                LineType[0] := LineBottomRight
            else
              // real last child
              if Temp = FRoot.LastChild then
                LineType[0] := LineTopRight
              else
                LineType[0] := LineTopDownRight;
          end
          else
          begin
            // no, top node is not a top level node -> we need different painting
            if Assigned(Temp.NextSibling) then
              LineType[0] := LineTopDown
            else
              LineType[0] := -1; // leave blank
          end;
      end;

      // ----- main node loop
      while Assigned(Node) do
      begin
        // initialize node if not already done
        if not (vsInitialized in Node.States) then
          InitNode(Node);
        if vsSelected in Node.States then
          Inc(SelectLevel);
        
        // set values which depend on initialized node
        R.Bottom := R.Top + Integer(Node.NodeHeight);

        // do the following stuff only for selected nodes or nodes which are children of selected nodes
        // if SelectedOnly is set
        if (SelectLevel > 0) or not SelectedOnly then
        begin
          // consider button and line alignment, but make sure neither the image nor the button (whichever is taller)
          // go out of the entire node height (100% means bottom alignment to the node's bounds)
          if ShowImages or ShowStateImages then
          begin
            if ShowImages then
              VAlign := FImages.Height
            else
              VAlign := FStateImages.Height;
            VAlign := Trunc((Node.NodeHeight - VAlign) * Node.Align / 100) + VAlign div 2
          end
          else
            if voShowButtons in FOptions then
              VAlign := Trunc((Node.NodeHeight - FPlusBM.Height) * Node.Align / 100) + FPlusBM.Height div 2
            else
              VAlign := Trunc(Node.NodeHeight * Node.Align / 100);
            
          ButtonY := VAlign - FPlusBM.Height div 2;

          // let application decide whether the node should be draw as normal or by the application itself
          if not DoBeforeItemPaint(TargetCanvas, Node, R) then
          begin
            // clear node background
            DoBeforeItemErase(FOffScreenBitmap.Canvas, Node, R, Backcolor, EraseAction);
            case EraseAction of
              eaDefault: // user does not want to customize background
                begin
                  if UseBackground then
                  begin
                    TileBackground(FBackground.Bitmap, FOffScreenBitmap.Canvas, R);
                    Brush.Color := Color;
                  end
                  else
                  begin
                    if (voFullRowSelect in FOptions) and (vsSelected in Node.States) then
                    begin
                      if Focused then
                        Brush.Color := clHighLight
                      else
                        Brush.Color := clBtnFace;
                    end
                    else
                      Brush.Color := Color;

                    FillRect(R);
                  end;
                  DoAfterItemErase(FOffscreenBitmap.Canvas, Node, R);
                end;
              eaColor:
                begin
                  // user has given a new background color
                  Brush.Color := BackColor;
                  FillRect(R);
                  DoAfterItemErase(FOffscreenBitmap.Canvas, Node, R);
                end;
              // otherwise don't touch the background, the application will erase it 
            end;
          
            // paint drop mark
            if Node = FCurrentTargetNode then
              DoPaintDropMark(TargetCanvas, Node, R);

            // go through all columns
            ColIndex := -1;
            NodeClipRect := R;
            OffsetRect(NodeClipRect, FOffsetX, 0);
            NodeClipRect.Right := ClientWidth;
            if UseColumns then
            begin
              ColIndex := FHeader.FColumns.GetFirstVisibleColumn;
              NodeClipRect.Right := NodeClipRect.Left;
              with FHeader.FColumns do
                if ColIndex > -1 then
                  Inc(NodeClipRect.Right, Items[FColumnPositions[ColIndex]].Width)
                else
                  ColIndex := Count;
            end;

            // now go through all visible columns (there's still one run if columns aren't used)
            with FHeader.FColumns do
            begin
              while (ColIndex < Count) and (NodeClipRect.Left < (SourceRect.Width - SourceRect.Left)) do
              begin
                if ColIndex > -1 then
                  Column := FColumnPositions[ColIndex]
                else
                  Column := -1;

                AdjustPaintCellRect(Node, ColIndex, NextColIndex, NodeClipRect);

                if (not UseColumns or (coVisible in Items[Column].FOptions)) and
                   (not MainOnly or (Column = 0)) then
                begin
                  // 1) Draw grid lines if requested and then set a clipping rectangle, so nothing gets painted
                  //    outside the current node rect.
                  if GridLines and (voShowHorzGridLines in FOptions) then
                  begin
                    MoveTo(NodeClipRect.Left, NodeClipRect.Bottom - 1);
                    LineTo(NodeClipRect.Right, NodeClipRect.Bottom - 1);
                  end;

                  if UseColumns then
                  begin
                    // vertical grid line (don't draw if this is the last column and the header is in autosize mode)
                    if GridLines and (voShowVertGridLines in FOptions) and
                       (not (hoAutoResize in FHeader.FOptions) or (ColIndex < Count - 1)) then
                    begin
                      MoveTo(NodeClipRect.Right - 1, NodeClipRect.Top);
                      LineTo(NodeClipRect.Right - 1, NodeClipRect.Bottom);
                    end;

                    with NodeClipRect do
                    begin
                      Dec(Right, 3);
                      NodeRegion := CreateRectRgn(Left, Top, Right + 1, Bottom);
                    end;
                    SelectClipRgn(Handle, NodeRegion);
                    DeleteObject(NodeRegion);
                  end;

                  TextR := NodeClipRect;
                  // distance from left column border (margin)
                  Inc(TextR.Left, FMargin);
                  // the following stuff is only for the main column
                  if (ColIndex = -1) or (FColumnPositions[ColIndex] = 0) then
                  begin
                    Inc(TextR.Left, IndentSize * Integer(FIndent));

                    // 2) paint tree lines if requested
                    if voShowTreeLines in FOptions then
                    begin
                      for X := 0 to IndentSize - 1 do
                        DrawLineImage(TargetCanvas, NodeClipRect.Left + X * Integer(FIndent), R.Top,
                                      Node.NodeHeight, VAlign, LineType[X]);
                    end;

                    // 3) draw buttons if requested
                    if (voShowButtons in FOptions) and (vsHasChildren in Node.States) then
                    begin
                      if vsExpanded in Node.States then
                        Draw(NodeClipRect.Left + ButtonX, R.Top + ButtonY, FMinusBM)
                      else
                        Draw(NodeClipRect.Left + ButtonX, R.Top + ButtonY, FPlusBM);
                    end;

                    // 4) draw check mark if enabled
                    if ShowChecks then
                    begin
                      Image := GetCheckImage(Node);
                      ImageVOffset := VAlign - FCheckImages.Height div 2 + 1;
                      if Image > -1 then                                      
                      begin
                        FCheckImages.Draw(TargetCanvas, TextR.Left + 2, TextR.Top + ImageVOffset, Image);
                        Inc(TextR.Left, FCheckImages.Width + 2);
                      end;
                    end;
                  end;

                  // continue with stuff for all columns
                  // 5) draw state image if available
                  if ShowStateImages then
                  begin
                    Image := DoGetImageIndex(Node, ikState, Column);
                    ImageVOffset := VAlign - FStateImages.Height div 2;
                    if Image > -1 then
                    begin
                      if CutPending and (vsCutOrCopy in Node.States) then
                      begin
                        ImageList_DrawEx(FStateImages.Handle, Image, Handle, TextR.Left, TextR.Top + ImageVOffset, 0, 0,
                          GetRGBColor(FStateImages.BkColor), GetRGBColor(FStateImages.BlendColor), ILD_FOCUS)
                      end
                      else
                        FStateImages.Draw(TargetCanvas, TextR.Left, TextR.Top + ImageVOffset, Image,
                          not (vsDisabled in Node.States) and Enabled);
                      Inc(TextR.Left, FStateImages.Width + 2);
                    end;
                  end;

                  // 6) draw image if available
                  if ShowImages then
                  begin
                    ImageVOffset := VAlign - FImages.Height div 2;
                    if vsSelected in Node.States then
                      Image := DoGetImageIndex(Node, ikSelected, Column)
                    else
                      Image := DoGetImageIndex(Node, ikNormal, Column);
                    if Image > -1 then
                    begin
                      if CutPending and (vsCutOrCopy in Node.States) then
                      begin
                        ImageList_DrawEx(FImages.Handle, Image, Handle, TextR.Left, TextR.Top + ImageVOffset, 0, 0,
                          GetRGBColor(FImages.BkColor), GetRGBColor(FImages.BlendColor), ILD_FOCUS);

                        // paint eventual overlay image
                        Image := DoGetImageIndex(Node, ikOverlay, Column);
                        if Image > -1 then
                        ImageList_DrawEx(FImages.Handle, Image, Handle, TextR.Left, TextR.Top + ImageVOffset, 0, 0,
                          GetRGBColor(FImages.BkColor), GetRGBColor(FImages.BlendColor), ILD_FOCUS);
                      end
                      else
                      begin
                        FImages.Draw(TargetCanvas, TextR.Left, TextR.Top + ImageVOffset, Image,
                                     not (vsDisabled in Node.States) and Enabled);

                        // paint eventual overlay image
                        Image := DoGetImageIndex(Node, ikOverlay, Column);
                        if Image > -1 then
                          FImages.Draw(TargetCanvas, TextR.Left, TextR.Top + ImageVOffset, Image,
                                       not (vsDisabled in Node.States) and Enabled);
                      end;
                      Inc(TextR.Left, FImages.Width + 2);
                    end;
                  end;

                  // determine remaining text rectangle
                  W := DoGetNodeWidth(Node, Column);
                  if UseColumns then
                  begin
                    TextR.Right := TextR.Left + W;
                    if TextR.Right > NodeClipRect.Right then
                      TextR.Right := NodeClipRect.Right;
                  end
                  else
                    TextR.Right := TextR.Left + W;

                  // 7) let descendants or application draw whatever they want,
                  //    but don't draw the node if it is currently being edited
                  if not ((tsEditing in FStates) and (Node = FFocusedNode) and
                    ((Column = FEditColumn) or not UseColumns)) then
                    DoPaintNode(TargetCanvas, Node, NodeClipRect, TextR, Column, ColIndex);

                  // leave after first run if columns aren't used
                  if not UseColumns then
                    Break;
                end;

                ColIndex := NextColIndex;

                // move clip rectangle and continue with next column
                if (ColIndex < Count) and (coVisible in Items[FColumnPositions[ColIndex]].FOptions) then
                begin
                  NodeClipRect.Left := Items[FColumnPositions[ColIndex]].Left;
                  NodeClipRect.Right := NodeClipRect.Left + Items[FColumnPositions[ColIndex]].Width;
                end;

                // 8) remove last clip rectangle
                SelectClipRgn(Handle, 0);
              end;
            end;

            // this node is finished, notify descentants/application
            DoAfterItemPaint(TargetCanvas, Node, R);
          end;
        end;
          
        if R.Top >= (SourceRect.Height - SourceRect.Top) then
          Break;
        R.Top := R.Bottom;

        // 9) advance to next visible node
        Temp := GetNextVisible(Node);
        if Assigned(Temp) then
        begin
          // adjust line bitmap (and so also indentation level)
          if Temp.Parent = Node then
          begin
            // new node is a child node, make sure the select level becomes not zero if this node
            // need to adjust previous bitmap level
            if IndentSize > 0 then
              if Assigned(Node.NextSibling) then
                LineType[IndentSize - 1] := LineTopDown
              else
                LineType[IndentSize - 1] := -1;
            // enhance line type array if necessary
            Inc(IndentSize);
            if Length(LineType) <= IndentSize then
              SetLength(LineType, IndentSize + 8);
            Inc(ButtonX, FIndent);
          end
          else
          begin
            // new node is at the same or higher tree level, take back select level increase if the node was selected
            if vsSelected in Node.States then
              Dec(SelectLevel); 
            if Node.Parent <> Temp.Parent then
            begin
              // went up one or more levels,
              // determine how many levels we went up actually
              while Node.Parent <> Temp.Parent do
              begin
                Dec(IndentSize);
                Dec(ButtonX, FIndent);
                Node := Node.Parent;
                // take back selection level increase
                if vsSelected in Node.States then
                  Dec(SelectLevel);
              end;
            end;
          end;

          // set new image in front of the new node
          if IndentSize > 0 then
            if Assigned(Temp.NextSibling) then
              LineType[IndentSize - 1] := LineTopDownRight
            else
              LineType[IndentSize - 1] := LineTopRight;
        end;
        Node := Temp;
      end;
    end;

    // delete rest of window not covered by a node
    if R.Top < (SourceRect.Height - SourceRect.Top) then
    begin
      R.Bottom := ClientHeight;
      if UseBackground then
        TileBackground(FBackground.Bitmap, TargetCanvas, R)
      else
      begin
        Brush.Color := Color;
        FillRect(R);
      end;
    end;

    if IsMouseSelecting then
    begin
      R := OrderRect(FNewSelRect);
      OffsetRect(R, FOffsetX, FOffsetY);
      SetTextColor(Handle, $FFFFFF);
      SetBkColor(Handle, 0);
      DrawFocusRect(R);
    end;
  end;

  DoAfterPaint(TargetCanvas);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetItemHeight(Value: Cardinal);

begin
  if Value <= 0 then
    Value := 18;
  if FDefaultNodeHeight <> Value then
  begin
    Inc(Integer(FRoot.TotalHeight), Integer(Value) - Integer(FDefaultNodeHeight));
    Inc(SmallInt(FRoot.NodeHeight), Integer(Value) - Integer(FDefaultNodeHeight));
    FDefaultNodeHeight := Value;
    if Value < Cardinal(ClientHeight) then
      FIncrementY := Value
    else
      FIncrementY := ClientHeight;
    if (FUpdateCount = 0) and
       not (csLoading in ComponentState) then
    begin
      InvalidateCache;
      UpdateScrollBars(True);
      ScrollIntoView(FFocusedNode);
      Invalidate;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetFirstNode: PVirtualNode;

begin
  Result := FRoot.FirstChild;
  if Assigned(Result) and not (vsInitialized in Result.States) then
    InitNode(Result);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMCut(var Message: TWMCut);

begin
  CutToClipboard;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMCopy(var Message: TWMCopy);

begin
  CopyToClipboard;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMEraseBkgnd(var Message: TWMEraseBkgnd);

begin
  Message.Result := 1;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetIndent(Value: Cardinal);

begin
  if FIndent <> Value then
  begin
    FIndent := Value;
    if not (csLoading in ComponentState) and (FUpdateCount = 0) and HandleAllocated then
    begin
      UpdateScrollBars(True);
      Invalidate;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetOptions(Value: TVirtualTreeOptions);

var
  ToBeSet,
  ToBeCleared: TVirtualTreeOptions;

begin
  if FOptions <> Value then
  begin
    ToBeSet := Value - FOptions;
    ToBeCleared := FOptions - Value;
    FOptions := Value;
    if (voMultiSelect in (ToBeCleared + ToBeSet)) or (voLevelSelectConstraint in ToBeSet) then
      ClearSelection;

    if not (csLoading in ComponentState) and HandleAllocated then
    begin
      Invalidate;
      if not (csDesigning in ComponentState) then
      begin
        if voAcceptOLEDrop in ToBeSet then
        begin
          HandleNeeded;
          RegisterDragDrop(Handle, FDragManager{ as IDropTarget});
        end
        else
          if (voAcceptOLEDrop in ToBeCleared) and HandleAllocated then
            RevokeDragDrop(Handle);
      end;
    end;

    if (voExtendedFocus in ToBeCleared) and (FFocusedColumn > 0) and HandleAllocated then
    begin
      FFocusedColumn := FHeader.MainColumn;
      Invalidate;
    end;
  end;

  if not (voExtendedFocus in FOptions) then
    FFocusedColumn := FHeader.MainColumn;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.ValidateChildren(Node: PVirtualNode; recursive: Boolean);

// makes sure the children of the given node (and all their children, if recursive is True) have been initialized;
// Node must already be initialized

var
  Child: PVirtualNode;

begin
  if Node = nil then
    Node := FRoot;

  InitChildren(Node);
  Child := Node.FirstChild;
  while Assigned(Child) do
  begin
    ValidateNode(Child, recursive);
    Child := Child.NextSibling;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.ValidateNode(Node: PVirtualNode; recursive: Boolean);

// makes sure the given node (and all its children, if recursive is True) have been initialized

var
  Child: PVirtualNode;

begin
  if Node = nil then
    Node := FRoot
  else
    if not (vsInitialized in Node.States) then
      InitNode(Node);

  if recursive then
  begin
    InitChildren(Node);
    Child := Node.FirstChild;
    while Assigned(Child) do
    begin
      ValidateNode(Child, recursive);
      Child := Child.NextSibling;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetChildCount(Node: PVirtualNode): Cardinal;

begin
  Result := Node.ChildCount;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetChildrenInitialized(Node: PVirtualNode): Boolean;

begin
  Result := not (vsHasChildren in Node.States) or (Node.ChildCount > 0);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetDisabled(Node: PVirtualNode): Boolean;

begin
  Result := Assigned(Node) and (vsDisabled in Node.States);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetHasChildren(Node: PVirtualNode): Boolean;

begin
  Result := Assigned(Node) and (vsHasChildren in Node.States);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetTotalCount: Cardinal;

begin
  BeginUpdate;
  try
    ValidateNode(FRoot, True);
  finally
    EndUpdate;
  end;
  // the root node itself doesn't count as node
  Result := FRoot.TotalCount - 1;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.AddFromStream(Stream: TStream; TargetNode: PVirtualNode);

// loads nodes from the given stream and adds them to TargetNode
// the current content is not cleared before the load process starts (see also LoadFromStream)

var
  ThisID: TMagicID;
  Major,
  Minor: Cardinal;
  Node: PVirtualNode;

begin
  // check first whether this is a stream we can read
  Stream.ReadBuffer(ThisID, SizeOf(TMagicID));
  if (ThisID[0] = MagicID[0]) and
     (ThisID[1] = MagicID[1]) and
     (ThisID[2] = MagicID[2]) and
     (ThisID[5] = MagicID[5]) then
  begin
    Major := Word(ThisID[3]);
    Minor := Word(ThisID[4]);
    if (Major < VTStreamMajorVersion) or
       ((Major = VTStreamMajorVersion) and (Minor <= VTStreamMinorVersion)) then
    begin
      BeginUpdate;
      try
        while Stream.Position < Stream.Size do
        begin
          Node := AddChild(TargetNode);
          InternalAddFromStream(Stream, Node);
        end;
        if TargetNode = FRoot then
          DoNodeCopied(nil)
        else
          DoNodeCopied(TargetNode);
      finally
        EndUpdate;
      end;
    end
    else
      ShowError(SWrongStreamVersion);
  end
  else
    ShowError(SWrongStreamFormat);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.AbsoluteIndex(Node: PVirtualNode): Cardinal;

begin
  Result := 0;
  while Assigned(Node) and (Node <> FRoot) do
  begin
    if not (vsInitialized in Node.States) then
      InitNode(Node);
    if Assigned(Node.PrevSibling) then
    begin
      // if there's a previous sibling then add its total count to the result
      Node := Node.PrevSibling;
      Inc(Result, Node.TotalCount);
    end
    else
    begin
      Node := Node.Parent;
      if Node <> FRoot then
        Inc(Result);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetUpdateState(Updating: Boolean);

begin
  SendMessage(Handle, WM_SETREDRAW, Ord(not Updating), 0);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.BeginUpdate;       

begin
  if (FUpdateCount = 0) and not (csDestroying in ComponentState) then
    SetUpdateState(True);
  Inc(FUpdateCount);
  Include(FStates, tsUpdating);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DeleteSelectedNodes;

// deletes all currently selected nodes (including their child nodes)

var
  Nodes: TNodeArray;
  I: Integer;

begin
  BeginUpdate;
  try
    Nodes := GetSortedSelection(True);
    for I := 0 to High(Nodes) do
      DeleteNode(Nodes[I]);
  finally
    EndUpdate;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.EditNode(Node: PVirtualNode; Column: Integer): Boolean;

// application triggered edit event for the given node
// returns True if the tree started editing otherwise False

begin
  FocusedNode := Node;
  FEditColumn := Column;
  if Assigned(FFocusedNode) and CanEdit(FFocusedNode) then
  begin
    if not (vsInitialized in Node.States) then
      InitNode(Node);
    DoEdit;
    Result := tsEditing in FStates;
  end
  else
    Result := False;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.EndEditNode;

// called by the application or the current edit link to finish the edit action

begin
  if [tsEditing, tsEditPending] * FStates <> [] then
    DoEndEdit;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.EndUpdate;

var
  NewSize: Integer;

begin
  if FUpdateCount > 0 then
    Dec(FUpdateCount);
  if (FUpdateCount = 0) and not (csDestroying in ComponentState) then
  begin
    NewSize := PackArray(FSelection, FSelectionCount);
    if NewSize > -1 then
    begin
      FSelectionCount := NewSize;
      SetLength(FSelection, FSelectionCount);
    end;
    Exclude(FStates, tsUpdating);
    ValidateCache;
    SetUpdateState(False);
    UpdateScrollBars(True);
    if tsStructureChangePending in FStates then
    begin
      Exclude(FStates, tsStructureChangePending);
      DoStructureChange(nil);
    end;
    if tsChangePending in FStates then
    begin
      Exclude(FStates, tsChangePending);
      DoChange(nil);
    end;
    Invalidate;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetBackground(const Value: TPicture);

begin
  FBackground.Assign(Value);
  Invalidate;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetDisabled(Node: PVirtualNode; Value: Boolean);

begin
  if Assigned(Node) and (Value xor (vsDisabled in Node.States)) then
  begin
    if Value then
      Include(Node.States, vsDisabled)
    else
      Exclude(Node.States, vsDisabled);

    if FUpdateCount = 0 then
      InvalidateNode(Node);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetFocusedColumn(Value: Integer);

begin
  if (FFocusedColumn <> Value) and
     DoFocusChanging(FFocusedNode, FFocusedNode, FFocusedColumn, Value) then
  begin
    CancelEditNode;
    FFocusedColumn := Value;
    if Assigned(FFocusedNode) and not ScrollIntoView(FFocusedNode) then
      InvalidateNode(FFocusedNode);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetNodeDataSize(Value: Integer);

var
  LastRootCount: Cardinal;

begin
  if Value < -1 then
    Value := -1;
  if FNodeDataSize <> Value then
  begin
    FNodeDataSize := Value;
    if not (csLoading in ComponentState) then
    begin
      LastRootCount := FRoot.ChildCount;
      Clear;
      InitRoot;
      SetRootNodeCount(LastRootCount);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetCheckImageKind(Value: TCheckImageKind);

begin
  if FCheckImageKind <> Value then
  begin
    FCheckImageKind := Value;
    case Value of
      ckDarkCheck:
        FCheckImages := DarkCheckImages;
      ckLightTick:
        FCheckImages := LightTickImages;
      ckDarkTick:
        FCheckImages := DarkTickImages;
    else
      FCheckImages := LightCheckImages;
    end;
    if (FUpdateCount = 0) and not (csLoading in ComponentState) then
      InvalidateRect(Handle, nil, False);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetCheckState(Node: PVirtualNode): TCheckState;

begin
  Result := Node.CheckState;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetCheckType(Node: PVirtualNode): TCheckType;

begin
  Result := Node.CheckType;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetTopNode: PVirtualNode;

begin
  Result := GetNodeAt(0, 0);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.CheckParentCheckState(Node: PVirtualNode);

var
  CheckCount,
  BoxCount: Cardinal;
  PartialCheck: Boolean;
  Run: PVirtualNode;

begin
  with Node^ do
  begin
    CheckCount := 0;
    BoxCount := 0;
    PartialCheck := False;
    Run := FirstChild;
    while Assigned(Run) do
    begin
      if Run.CheckType in [ctCheckBox, ctTriStateCheckBox] then
      begin
        Inc(BoxCount);
        if Run.CheckState = csChecked then
          Inc(CheckCount);
        PartialCheck := PartialCheck or (Run.CheckState = csCheckedGrayed);
      end;
      Run := Run.NextSibling;
    end;

    if (CheckCount = 0) and not PartialCheck then
    begin
      CheckState := csUnchecked;
      InvalidateNode(Node);
    end
    else
      if CheckCount < BoxCount then
      begin
        CheckState := csCheckedGrayed;
        InvalidateNode(Node);
      end
      else
      begin
        CheckState := csChecked;
        InvalidateNode(Node);
      end;

    // recursively adjust parent of parent
    if ([vsChecking, vsDisabled] * Parent.States = []) and (Parent <> FRoot) and
       (Parent.CheckType = ctTriStateCheckBox) then
      CheckParentCheckState(Parent);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetCheckState(Node: PVirtualNode; Value: TCheckState);

// sets the check state of the node according to the given value and the
// parent's check type

var
  Run: PVirtualNode;

begin
  // nothing happens if the node is either disabled, not allowed to change
  // its state or the state type is ctNone (or is the same as Value)
  if (Node.CheckState <> Value) and
     not (vsDisabled in Node.States) and
     DoChecking(Node, Value) then
  begin
    with Node^ do
    begin
      Include(States, vsChecking);

      // make sure valid values are used
      if (Node.CheckType = ctButton) and not (Value in [csUnpressed, csPressed]) then
        Value := csUnpressed;
      if (Node.CheckType <> ctButton) and (Value in [csUnpressed, csPressed]) then
        Value := csChecked;

      case CheckType of
        // standard checkbox, simply check or uncheck it
        ctCheckBox:
          begin
            if Value in [csChecked, csCheckedGrayed] then
              Value := csChecked
            else
              Value := csUnchecked;
          end;
        // check state change with additional consequences for check states of the children
        ctTriStateCheckBox:
          begin
            // propagate state down to the children
            if voAutoTristateTracking in FOptions then
              case Value of
                csUnchecked:
                  begin
                    Run := FirstChild;
                    while Assigned(Run) do
                    begin
                      if Run.CheckType in [ctCheckBox, ctTriStateCheckBox] then
                        SetCheckState(Run, csUnchecked);
                      Run := Run.NextSibling;
                    end;
                  end;
                csChecked:
                  begin
                    Run := FirstChild;
                    while Assigned(Run) do
                    begin
                      if Run.CheckType in [ctCheckBox, ctTriStateCheckBox] then
                        SetCheckState(Run, csChecked);
                      Run := Run.NextSibling;
                    end;
                  end;
              end;
          end;
        // radio button check state change
        ctRadioButton:
          if Value in [csChecked, csCheckedGrayed] then
          begin
            Value := csChecked;
            // make sure only this node is checked
            Run := Parent.FirstChild;
            while Assigned(Run) do
            begin
              if (Run <> Node) and (Run.CheckType = ctRadioButton) then
              begin
                SetCheckState(Run, csUnchecked);
                InvalidateNode(Run);
              end;
              Run := Run.NextSibling;
            end;
          end;
        ctButton:
          ; // nothing to do here
      end;

      CheckState := Value;
      InvalidateNode(Node);
      // propagate state up to the parent
      if (voAutoTristateTracking in FOptions) and
         ([vsChecking, vsDisabled] * Parent.States = []) and
         (CheckType in [ctCheckBox, ctTriStateCheckBox]) and
         (Parent <> FRoot) and
         (Parent.CheckType = ctTriStateCheckBox) then
        CheckParentCheckState(Parent);
      DoChecked(Node);

      Exclude(States, vsChecking);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetCheckType(Node: PVirtualNode; Value: TCheckType);

begin
  if Node.CheckType <> Value then
  begin
    Node.CheckType := Value;
    if Value = ctButton then
      Node.CheckState := csUnpressed
    else
      Node.CheckState := csUnchecked;
    InvalidateNode(Node);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SelectAll(VisibleOnly: Boolean);

// select all initialized nodes in the tree, if VisibleOnly is True then only node of which all
// their parents are expanded are selected

var
  Run: PVirtualNode;
  NextFunction: function(Node: PVirtualNode): PVirtualNode of object;

begin
  if voMultiSelect in FOptions then
  begin
    Run := FRoot.FirstChild;
    ClearTempCache;
    if VisibleOnly then
      NextFunction := GetNextVisible
    else
      NextFunction := GetNextNoInit;
    while Assigned(Run) do
    begin
      if not(vsSelected in Run.States) then
        InternallyCacheNode(Run);
      Run := NextFunction(Run);
    end;
    if FTempNodeCount > 0 then
      AddToSelection(FTempNodeCache, FTempNodeCount, True);
    ClearTempCache;
    Invalidate;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.Sort(Node: PVirtualNode; Column: Integer; Ascending: Boolean; Compare: TVTCompareFunction;
  DoInit: Boolean = True);

// Sorts the given node. The application is queried about how to sort via the provided compare function.
// Column is simply passed to the the compare function so the application can also sort in a particular column.
// In order to free the application from taking care about sort direction the parameter Ascending is provided.

  //--------------- local functions -------------------------------------------

  function MergeAscending(A, B: PVirtualNode): PVirtualNode;

  // merges A and B (which both must be sorted via Compare) into one list

  var
    Dummy: TVirtualNode;

  begin
    // this avoids checking for Result = nil in the loops
    Result := @Dummy;
    while Assigned(A) and Assigned(B) do
    begin
      if Compare(Self, A, B, Column) <= 0 then
      begin
        Result.NextSibling := A;
        Result := A;
        A := A.NextSibling;
      end
      else
      begin
        Result.NextSibling := B;
        Result := B;
        B := B.NextSibling;
      end;
    end;

    // just append the list which is not nil (or set end of result list to nil if both lists are nil)
    if Assigned(A) then
      Result.NextSibling := A
    else
      Result.NextSibling := B;
    // return start of the new merged list
    Result := Dummy.NextSibling;
  end;

  //---------------------------------------------------------------------------

  function MergeDescending(A, B: PVirtualNode): PVirtualNode;

  // merges A and B (which both must be sorted via Compare) into one list

  var
    Dummy: TVirtualNode;

  begin
    // this avoids checking for Result = nil in the loops
    Result := @Dummy;
    while Assigned(A) and Assigned(B) do
    begin
      if Compare(Self, A, B, Column) > 0 then
      begin
        Result.NextSibling := A;
        Result := A;
        A := A.NextSibling;
      end
      else
      begin
        Result.NextSibling := B;
        Result := B;
        B := B.NextSibling;
      end;
    end;

    // just append the list which is not nil (or set end of result list to nil if both lists are nil)
    if Assigned(A) then
      Result.NextSibling := A
    else
      Result.NextSibling := B;
    // return start of the new merged list
    Result := Dummy.NextSibling;
  end;

  //---------------------------------------------------------------------------

  function MergeSortAscending(var Node: PVirtualNode; N: Cardinal): PVirtualNode;

  // sorts the list of nodes given by Node (which must not be nil)

  var
    A, B: PVirtualNode;

  begin
    if N > 1 then
    begin
      A := MergeSortAscending(Node, N div 2);
      B := MergeSortAscending(Node, (N + 1) div 2);
      Result := MergeAscending(A, B);
    end
    else
    begin
      Result := Node;
      Node := Node.NextSibling;
      Result.NextSibling := nil;
    end;
  end;

  //---------------------------------------------------------------------------

  function MergeSortDescending(var Node: PVirtualNode; N: Cardinal): PVirtualNode;

  // sorts the list of nodes given by Node (which must not be nil)

  var
    A, B: PVirtualNode;

  begin
    if N > 1 then
    begin
      A := MergeSortDescending(Node, N div 2);
      B := MergeSortDescending(Node, (N + 1) div 2);
      Result := MergeDescending(A, B);
    end
    else
    begin
      Result := Node;
      Node := Node.NextSibling;
      Result.NextSibling := nil;
    end;
  end;

  //--------------- end local functions ---------------------------------------

var
  Run: PVirtualNode;
  Index: Cardinal;
  
begin
  if Node = nil then
    Node := FRoot;
  if vsHasChildren in Node.States then
  begin
    if Node.ChildCount = 0 then
      InitChildren(Node);
    // make sure the children are valid, so they can be sorted at all
    if DoInit and (Node.ChildCount > 1) then
      ValidateChildren(Node, False);
    // child count might have changed
    if Node.ChildCount > 1 then
    begin
      // sort the linked list, check direction flag only once
      if Ascending then
        Node.FirstChild := MergeSortAscending(Node.FirstChild, Node.ChildCount)
      else
        Node.FirstChild := MergeSortDescending(Node.FirstChild, Node.ChildCount);
      // consolidate the child list finally
      Run := Node.FirstChild;
      Run.PrevSibling := nil;
      Index := 0;
      repeat
        Run.Index := Index;
        Inc(Index);
        if Run.NextSibling = nil then
          Break;
        Run.NextSibling.PrevSibling := Run;
        Run := Run.NextSibling;
      until False;
      Node.LastChild := Run;

      if vsExpanded in Node.States then
        ValidateCache;
    end;
    if FUpdateCount = 0 then
      Invalidate;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.ToggleNode(Node: PVirtualNode);

// changes a node's expand state to the opposite state

const
  AnimationStep = 10; // 10 pixels per animation step
  
var
  LastTopNode,
  Child: PVirtualNode;
  NewHeight: Cardinal;
  NeedUpdate: Boolean;
  R: TRect;
  Step: Integer;
  
begin
  NeedUpdate := False;
  LastTopNode := GetTopNode;
  if [tsEditing, tsEditPending] * FStates <> [] then
    CancelEditNode;
     
  if vsExpanded in Node.States then
  begin
    if DoCollapsing(Node) then
    begin
      NeedUpdate := True;

      if (voAnimatedToggle in FOptions) and
         not (tsCollapsing in FStates) then
      begin
        // animated collapsing
        R := GetDisplayRect(Node, -1);
        R.Bottom := ClientHeight;
        Inc(R.Top, Node.NodeHeight);
        if IntersectRect(R, R, ClientRect) then
        begin
          Step := Min(Node.TotalHeight - Node.NodeHeight, ClientHeight);
          Canvas.Brush.Color := Color;
          Canvas.FillRect(Rect(R.Left, R.Bottom - AnimationStep, R.Right, R.Bottom));
          while Step > 0 do
          begin
            ScrollWindow(Handle, 0, -AnimationStep, @R, @R);
            Sleep(1);
            Dec(Step, AnimationStep);
          end;
        end;
      end;
      
      // collapse the node
      AdjustTotalHeight(Node, Node.NodeHeight);
      if IsVisible[Node] then
        Dec(FVisibleCount, CountVisibleChildren(Node));
      Exclude(Node.States, vsExpanded);
      DoCollapsed(Node);
    end;
  end
  else
    if DoExpanding(Node) then
    begin
      NeedUpdate := True;
      // expand the node, need to adjust the height
      if not (vsInitialized in Node.States) then
        InitNode(Node);
      if (vsHasChildren in Node.States) and (Node.ChildCount = 0) then
        InitChildren(Node);
      NewHeight := 0;
      Child := Node.FirstChild;
      // avoid setting the vsExpanded style if there are no child nodes
      if Assigned(Child) then
      begin
        while Assigned(Child) do
        begin
          Inc(NewHeight, Child.TotalHeight);
          Child := Child.NextSibling;
        end;

        if (voAnimatedToggle in FOptions) and
           not (tsExpanding in FStates) then
        begin
          // animated expanding
          R := GetDisplayRect(Node, -1);
          Inc(R.Top, Node.NodeHeight);
          R.Bottom := ClientHeight;
          if IntersectRect(R, R, ClientRect) then
          begin
            Step := Min(NewHeight, ClientHeight);
            Canvas.Brush.Color := Color;
            Canvas.FillRect(Rect(R.Left, R.Top, R.Right, R.Top + AnimationStep));
            while Step > 0 do
            begin
              ScrollWindow(Handle, 0, AnimationStep, @R, @R);
              Sleep(1);
              Dec(Step, AnimationStep);
            end;
          end;
        end;

        Include(Node.States, vsExpanded);
        AdjustTotalHeight(Node, NewHeight, True);
      end;
      if IsVisible[Node] then
        Inc(FVisibleCount, CountVisibleChildren(Node));
      DoExpanded(Node);
    end;

  if NeedUpdate and (FUpdateCount = 0) then
    if Node.ChildCount > 0 then
    begin
      ValidateCache(FLastCacheHit);
      UpdateScrollbars(True);
      // update internal variables and check for automatically scrolled tree when collapsing nodes at its end
      if LastTopNode <> GetNodeAt(0, 0) then
        Invalidate
      else
        InvalidateToBottom(Node);
    end
    else
      InvalidateNode(Node);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.FullExpand(Node: PVirtualNode = nil);

// Expands all nodes starting with Node if given (otherwise starting with FRoot). All nodes on the way down are
// initialized so this procedure might take a long time. Since all nodes are validated, the tree cannot make use of
// optimatizations. Hence FullExpand is counter productive and you should consider avoiding its use.

var
  Stop: PVirtualNode;

begin
  BeginUpdate;
  Include(FStates, tsExpanding);
  try
    if Node = nil then
    begin
      Node := FRoot;
      Stop := nil;
    end
    else
      Stop := Node.NextSibling;

    repeat
      with Node^ do
      begin
        if not (vsInitialized in States) then
          InitNode(Node);
        if (vsHasChildren in Node.States) and not (vsExpanded in States) then
          ToggleNode(Node);
      end;
      Node := GetNext(Node);
    until Node = Stop;
  finally
    Exclude(FStates, tsExpanding);
    EndUpdate;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.FullCollapse(Node: PVirtualNode = nil);

// This routine collapses all expanded nodes starting with Node if given otherwise with FRoot. Well, not all nodes are
// collapsed, because expanded nodes belonging to an already collapsed node are not collapsed. Otherwise we'd need to
// expand them first to collapse the children or it would result in a wrong total height. This results from having
// a parent node storing the total height of itself and all its children (if expanded).

var
  Run: PVirtualNode;

begin
  if Node = FRoot then
    Node := nil;
  // node must be visible otherwise the main loop will become much slower due to extra checks and
  // it must still be expanded (FRoot is always expanded)
  if (Node = nil) or (IsVisible[Node] and (vsExpanded in Node.States)) then
  begin
    Run := GetLastChild(Node);
    BeginUpdate;
    Include(FStates, tsCollapsing);
    try
      // loop either terminates if GetPreviousNoInit returns nil (FRoot is reached) then also
      // Node will contain nil or all child nodes of Node have been collapsed
      while Run <> Node do
      begin
        if vsExpanded in Run.States then
          ToggleNode(Run);
        Run := GetPreviousVisible(Run);
      end;
      // if we started collapsing from a node other than FRoot then collapse the node finally
      if Assigned(Node) then
        ToggleNode(Run);
    finally
      Exclude(FStates, tsCollapsing);
      EndUpdate;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------
procedure TBaseVirtualTree.SetScrollBarOptions(Value: TScrollBarOptions);

begin
  FScrollBarOptions.Assign(Value);
end;

//------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetStateImages(const Value: TImageList);

begin
  if FStateImages <> Value then
  begin
    if Assigned(FStateImages) then
      FStateImages.UnRegisterChanges(FStateChangeLink);
    FStateImages := Value;
    if Assigned(FStateImages) then
      FStateImages.RegisterChanges(FStateChangeLink);
    if not (csLoading in ComponentState) then
      Invalidate;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetTopNode(Node: PVirtualNode);

var
  R: TRect;
  Run: PVirtualNode;
  
begin
  if Assigned(Node) then
  begin
    // make sure all parents of the node are expanded
    Run := Node.Parent;
    while Run <> FRoot do
    begin
      if not (vsExpanded in Run.States) then
        ToggleNode(Run);
      Run := Run.Parent;
    end;
    if FHeader.Columns.Count > 0 then
      R := GetDisplayRect(Node, 0, True)
    else
      R := GetDisplayRect(Node, -1, True);
    SetOffsetY(FOffsetY - R.Top);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMPaint(var Message: TWMPaint);

begin
  ControlState := ControlState + [csCustomPaint];
  inherited;
  ControlState := ControlState - [csCustomPaint];
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMNCDestroy(var Message: TWMNCDestroy);

// Used to release a reference of the drag manager, this is the only reliably way we get notified about
// window destruction, because of the automatic release of a window if its parent window is freed.

begin
  if not (csDesigning in ComponentState) and
     (voAcceptOLEDrop in FOptions) then
  begin
    RevokeDragDrop(Handle);
    FStates := FStates - ClipboardStates;
  end;
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMNCHitTest(var Message: TWMNCHitTest);

begin
  inherited;
  if (hoVisible in FHeader.FOptions) and FHeader.InHeader(ScreenToClient(SmallPointToPoint(Message.Pos))) then
    Message.Result := HTBORDER;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMNCCalcSize(var Message: TWMNCCalcSize);

begin
  inherited;

  with FHeader do
    if hoVisible in FHeader.FOptions then
      with Message.CalcSize_Params^ do
      begin
        Inc(rgrc[0].Top, FHeight);
      end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetHeaderRect: TRect;

// Returns the rectangle the header occupies in non-client area.
// These coordinates are relative to the entire window rectangle.

var
  OffsetX,
  OffsetY: Integer;
  EdgeSize: Integer;
  
begin
  if not (hoVisible in FHeader.FOptions) then
    Result := Rect(0, 0, 0, 0)
  else
  begin
    // start width the size of the header
    Result := Rect(0, 0, ClientWidth, FHeader.FHeight);
    // if the vertical scroll bar is visible we must extend the right border a bit
    if FRangeY > Cardinal(ClientHeight) then
      Inc(Result.Right, GetSystemMetrics(SM_CXVSCROLL));
    if BorderStyle = bsSingle then
      OffsetRect(Result, 3, 3);

    // then place it
    OffsetX := BorderWidth;
    OffsetY := BorderWidth;
    if BevelKind <> bkNone then
    begin
      EdgeSize := 0;
      if BevelInner <> bvNone then
        Inc(EdgeSize, BevelWidth);
      if BevelOuter <> bvNone then
        Inc(EdgeSize, BevelWidth);
      if beLeft in BevelEdges then
        Inc(OffsetX, EdgeSize);
      if beTop in BevelEdges then
        Inc(OffsetY, EdgeSize);
    end;

    OffsetRect(Result, OffsetX, OffsetY);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.OriginalWMNCPaint(DC: HDC);

// Unfortunately, the VCL does a bad job regarding non-client area painting in TWinControl to paint a window's bevel
// which results often in heavy flickering. This method is a copy of TWinControl.WMNCPaintHandler adjusted to take
// the passed update region into account (actually, this happens already in the WMNCPaint).

const
  InnerStyles: array[TBevelCut] of Integer = (0, BDR_SUNKENINNER, BDR_RAISEDINNER, 0);
  OuterStyles: array[TBevelCut] of Integer = (0, BDR_SUNKENOUTER, BDR_RAISEDOUTER, 0);
  EdgeStyles: array[TBevelKind] of Integer = (0, 0, BF_SOFT, BF_FLAT);
  Ctl3DStyles: array[Boolean] of Integer = (BF_MONO, 0);

var
  RC, RW: TRect;
  EdgeSize: Integer;

begin
  if (BevelKind <> bkNone) or (BorderWidth > 0) then
  begin
    // determine outer rectangle to draw
    RC := Rect(0, 0, Width, Height);

    if BorderStyle = bsSingle then
      InflateRect(RC, -3, -3);
    RW := RC;

    if BevelKind <> bkNone then
    begin
      DrawEdge(DC, RC, InnerStyles[BevelInner] or
                       OuterStyles[BevelOuter],
                       Byte(BevelEdges) or
                       EdgeStyles[BevelKind] or
                       Ctl3DStyles[Ctl3D] {or
                       BF_ADJUST});

      EdgeSize := 0;
      if BevelInner <> bvNone then
        Inc(EdgeSize, BevelWidth);
      if BevelOuter <> bvNone then
        Inc(EdgeSize, BevelWidth);
      with RC do
      begin
        if beLeft in BevelEdges then
          Inc(Left, EdgeSize);
        if beTop in BevelEdges then
          Inc(Top, EdgeSize);
        if beRight in BevelEdges then
          Dec(Right, EdgeSize);
        if beBottom in BevelEdges then
          Dec(Bottom, EdgeSize);
      end;
    end;

    // repaint only the part in the original clipping region and not yet drawn parts
    IntersectClipRect(DC, RC.Left, RC.Top, RC.Right, RC.Bottom);

    // determine inner rectangle to exclude (RC corresponds then to the client area)
    InflateRect(RC, -BorderWidth, -BorderWidth);

    // remove the inner rectangle
    ExcludeClipRect(DC, RC.Left, RC.Top, RC.Right, RC.Bottom);

    // erase parts not drawn
    Windows.FillRect(DC, RW, Brush.Handle);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMNCPaint(var Message: TRealWMNCPaint);

var
  DC: HDC;
  R: TRect;
  SavedDC: Integer;
  Flags: DWORD;

begin
  // don't use the inherited NC paint handler as it doesn't consider the current clipping region
  // leading so to annoying flicker
  DefaultHandler(Message);
  Flags := DCX_CACHE or DCX_CLIPSIBLINGS or DCX_CLIPCHILDREN or DCX_WINDOW;

  if (Message.Rgn = 1) or IsWin95 then
    DC := GetDCEx(Handle, 0, Flags)
  else
    DC := GetDCEx(Handle, Message.Rgn, Flags or DCX_INTERSECTRGN);

  if DC <> 0 then
  begin
    if hoVisible in FHeader.FOptions then
    begin
      SavedDC := SaveDC(DC);
      R := GetHeaderRect;
      FHeader.FColumns.PaintHeader(DC, R, FOffsetX);
      RestoreDC(DC, SavedDC);
    end;
    OriginalWMNCPaint(DC);
    ReleaseDC(Handle, DC);
  end;
  Message.Result := 0;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.ValidateNodeDataSize(var Size: Integer);

begin
  Size := 0;
  if Assigned(FOnGetNodeDataSize) then
    FOnGetNodeDataSize(Self, Size);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WndProc(var Message: TMessage);

var
  Handled: Boolean;

begin
  Handled := False;
  // try the header whether it needs to take this message
  if Assigned(FHeader) and (FHeader.FStates <> []) then
    Handled := FHeader.HandleMessage(Message);
  if not Handled then
  begin
    // for auto drag mode, let tree handle itself, instead of TControl
    if not (csDesigning in ComponentState) and
       ((Message.Msg = WM_LBUTTONDOWN) or (Message.Msg = WM_LBUTTONDBLCLK)) then
    begin
      if (DragMode = dmAutomatic) and (DragKind = dkDrag) then
      begin
        if IsControlMouseMsg(TWMMouse(Message)) then
          Handled := True;
        if not Handled then
        begin
          ControlState := ControlState + [csLButtonDown];
          Dispatch(Message);  // overrides TControl's BeginDrag
          Handled := True;
        end;
      end;
    end;

    if not Handled and Assigned(FHeader) and (hoVisible in FHeader.FOptions) then
      Handled := FHeader.HandleMessage(Message);
       
    if not Handled then
    begin
      if (Message.Msg in [WM_NCLBUTTONDOWN, WM_NCRBUTTONDOWN, WM_NCMBUTTONDOWN]) and not Focused then
        SetFocus;
      inherited;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WriteChunks(Stream: TStream; Node: PVirtualNode);

// writes the core chunks for Node into the stream
// Node: Descentants can optionally override this method to add other node specific chunks.
//       Keep in mind that this method is also called for the root node. Using this fact in descentants you can
//       create a kind of "global" chunks not directly bound to a specific node.

var
  Header: TChunkHeader;
  LastPosition,
  ChunkSize: Integer;
  Chunk: TBaseChunk;
  Run: PVirtualNode;

begin
  with Stream do
  begin
    // 1. The base chunk...
    LastPosition := Position;
    Chunk.Header.ChunkType := BaseChunk;
    with Node^, Chunk do
    begin
      Body.ChildCount := ChildCount;
      Body.NodeHeight := NodeHeight;
      // some states are only temporary so take them out as they make no sense at the new location
      Body.States := States - [vsChecking, vsCutOrCopy, vsDeleting];
      Body.Align := Align;
      Body.CheckState := CheckState;
      Body.CheckType := CheckType;
    end;
    // write the base chunk
    Write(Chunk, SizeOf(Chunk));

    // 2. ... directly followed by the child node chunks (actually they are child chunks of
    //   the base chunk)
    if vsInitialized in Node.States then
    begin
      Run := Node.FirstChild;
      while Assigned(Run) do
      begin
        WriteNode(Stream, Run);
        Run := Run.NextSibling;
      end;
    end;
    
    FinishChunkHeader(Stream, LastPosition, Position);

    // 3. write user data
    LastPosition := Position;
    Header.ChunkType := UserChunk;
    Write(Header, SizeOf(Header));
    DoSaveUserData(Node, Stream);
    // check if the application actually wrote data
    ChunkSize := Position - LastPosition - SizeOf(TChunkHeader);
    // seek back to start of chunk if nothing has been written 
    if ChunkSize = 0 then
    begin
      Position := LastPosition;
      Size := Size - SizeOf(Header);
    end
    else
      FinishChunkHeader(Stream, LastPosition, Position);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WriteNode(Stream: TStream; Node: PVirtualNode);

// write the "cover" chunk for Node to Stream and initiates writing child nodes and chunks

var
  LastPosition: Integer;
  Header: TChunkHeader;
  
begin
  // initialize the node first if necessary and wanted
  if voInitOnSave in FOptions then
  begin
    if not (vsInitialized in Node.States) then
      InitNode(Node);
    if (vsHasChildren in Node.States) and (Node.ChildCount = 0) then
      InitChildren(Node); 
  end;

  with Stream do
  begin
    LastPosition := Position;
    // emit the anchor chunk
    Header.ChunkType := NodeChunk;
    Write(Header, SizeOf(Header));
    // write other chunks to stream taking their size into this chunk's size
    WriteChunks(Stream, Node);

    // update chunk size
    FinishChunkHeader(Stream, LastPosition, Position);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMLButtonDown(var Message: TWMLButtonDown);

// handles all mouse button clicks (left button)

begin
  inherited;
  HandleMouseDown(Message);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoCancelEdit;

// called when the current edit action or a pending edit must be cancelled

begin
  StopTimer(EditTimer);
  Exclude(FStates, tsEditPending);
  if tsEditing in FStates then
  begin
    // recursion stopper
    if FEditLink.CanStop then
      FEditLink.CancelEdit;
    Exclude(FStates, tsEditing);
    if Assigned(FOnEditCancelled) then
      FOnEditCancelled(Self, FEditColumn);
    if not (csDestroying in ComponentState) then
    begin
      SetFocus;
      // asynchroniously release edit link
      PostMessage(Handle, WM_RELEASEEDITLINK, 0, 0);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoBeforeItemErase(Canvas: TCanvas; Node: PVirtualNode; ItemRect: TRect; var Color: TColor;
  var EraseAction: TItemEraseAction);

begin
  if Assigned(FOnBeforeItemErase) then
    FOnBeforeItemErase(Self, Canvas, Node, ItemRect, Color, EraseAction);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.DoBeforeItemPaint(Canvas: TCanvas; Node: PVirtualNode; ItemRect: TRect): Boolean;

begin
  // by default custom draw will not be used, so the tree handles drawing the node
  Result := False;
  if Assigned(FOnBeforeItemPaint) then
    FOnBeforeItemPaint(Self, Canvas, Node, ItemRect, Result);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoBeforePaint(Canvas: TCanvas);

begin
  if Assigned(FOnBeforePaint) then
    FOnBeforePaint(Self, Canvas);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoChange(Node: PVirtualNode);

begin
  if FChangeDelay > 0 then
  begin
    if tsChangePending in FStates then
      StopTimer(ChangeTimer);
    FLastChangedNode := Node;
    Include(FStates, tsChangePending);
    SetTimer(Handle, ChangeTimer, FChangeDelay, nil);
  end
  else
    Change(Node);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetSortedSelection(Resolve: Boolean): TNodeArray;

// Returns a copy of the selection array but sorted by locical order rather than memory location.
// If Resolve is True then nodes which are children of other selected nodes are not passed in the new array.
// This feature is in particuar important when doing drag'n drop as in this case all selected node plus their children
// need to be considered. A selected node which is child (grand child etc.) of another selected node is then
// automatically included and doesn't need to be explicitely mentioned in the returned selection array.
//
// Note: The caller is responsible for freeing the array. Allocation is done here. Usually, though, freeing the array
//       doesn't need additional attention as it is automatically freed by Delphi when it gets out of scope.

var
  Run: PVirtualNode;
  Counter: Cardinal;
  
begin
  SetLength(Result, FSelectionCount);
  if FSelectionCount > 0 then
  begin
    Run := FRoot.FirstChild;
    Counter := 0;
    if Resolve then
    begin
      // Resolving is actually easy: just find the first selected node in logical order
      // and then never go deeper in level than this node as long as there's a sibling node.
      // Restart the search for a selected node (at any level) if there are no further siblings.
      while Assigned(Run) do
      begin
        if vsSelected in Run.States then
        begin
          Result[Counter] := Run;
          Inc(Counter);
          if Assigned(Run.NextSibling) then
            Run := Run.NextSibling
          else
          begin
            // If there are no further siblings then go up one or more levels until a node is
            // found or all nodes have been processed. Although we consider here only initialized
            // nodes we don't need to make any special checks as only initialized nodes can also be selected.
            repeat
              Run := Run.Parent;
            until (Run = FRoot) or Assigned(Run.NextSibling);
            if Run = FRoot then
              Break
            else
              Run := Run.NextSibling;
          end;
        end
        else
          Run := GetNextNoInit(Run);
      end;
    end
    else
      while Assigned(Run) do
      begin
        if vsSelected in Run.States then
        begin
          Result[Counter] := Run;
          Inc(Counter);
        end;
        Run := GetNextNoInit(Run);
      end;

    // Since we may have skipped some nodes the result array is likely to be smaller than the
    // selection array, hence shorten the result to true length.
    if Integer(Counter) < Length(Result) then
      SetLength(Result, Counter);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetSortedCutCopySet(Resolve: Boolean): TNodeArray;

// Same as GetSortedSelection but with nodes marked as being part in a clipboard operation.

var
  Run: PVirtualNode;
  Counter: Cardinal;

  //--------------- local function --------------------------------------------

  procedure IncludeThisNode(Node: PVirtualNode);

  // adds the given node to the result

  var
    Len: Cardinal;

  begin
    Len := Length(Result);
    if Counter = Len then
    begin
      if Len < 100 then
        Len := 100
      else
        Len := Len + Len div 10;
      SetLength(Result, Len);
    end;
    Result[Counter] := Node;
    Inc(Counter);
  end;

  //--------------- end local function ----------------------------------------

begin
  Run := FRoot.FirstChild;
  Counter := 0;
  if Resolve then
  begin
    // Resolving is actually easy: just find the first cutted node in logical order
    // and then never go deeper in level than this node as long as there's a sibling node.
    // Restart the search for a cutted node (at any level) if there are no further siblings.
    while Assigned(Run) do
    begin
      if vsCutOrCopy in Run.States then
      begin
        IncludeThisNode(Run);
        if Assigned(Run.NextSibling) then
          Run := Run.NextSibling
        else
        begin
          // If there are no further siblings then go up one or more levels until a node is
          // found or all nodes have been processed. Although we consider here only initialized
          // nodes we don't need to make any special checks as only initialized nodes can also be selected.
          repeat
            Run := Run.Parent;
          until (Run = FRoot) or Assigned(Run.NextSibling);
          if Run = FRoot then
            Break
          else
            Run := Run.NextSibling;
        end;
      end
      else
        Run := GetNextNoInit(Run);
    end;
  end
  else
    while Assigned(Run) do
    begin
      if vsCutOrCopy in Run.States then
        IncludeThisNode(Run);
      Run := GetNextNoInit(Run);
    end;
    
  // set the resulting array to its real length
  SetLength(Result, Counter);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetTreeRect: TRect;

// Returns the true size in pixels of the tree. This size is at least ClientHeight x ClientWidth and depends on
// the expand state, header size etc.

begin
  Result := Rect(0, 0, FRangeX, FRangeY);
  if Integer(FRangeX) < ClientWidth then
    Result.Right := ClientWidth;
  if Integer(FRangeY) < ClientHeight then
    Result.Bottom := ClientHeight;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.HasAsParent(Node1, Node2: PVirtualNode): Boolean;

// determines whether Node1 has got Node2 as one of its parents

var
  Run: PVirtualNode;

begin
  Result := Assigned(Node1) and Assigned(Node2);
  if Result then
  begin
    Run := Node1;
    while (Run <> FRoot) and (Run <> Node2) do
      Run := Run.Parent;
    Result := Run = Node2;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.CompareNodePositions(Node1, Node2: PVirtualNode): Integer;

// tries hard and smart to quickly determine whether Node1's structural position is before Node2's position
// Returns 0 if Node1 = Node2, < 0 if Node1 is located before Node2 else > 0.

var
  Run1,
  Run2: PVirtualNode;
  Level1,
  Level2: Cardinal;

begin
  if Node1 = Node2 then
    Result := 0
  else
  begin
    if HasAsParent(Node1, Node2) then
      Result := 1
    else
      if HasAsParent(Node2, Node1) then
        Result := -1
      else
      begin
        // the given nodes are neither equal nor are they parents of each other, so go up to FRoot
        // for each node and compare the child indices of the top level parents
        // Note: neither Node1 nor Node2 can be FRoot at this point as this (a bit strange) circumstance would
        //       be caught by the previous code.

        // start lookup at the same level
        Level1 := GetNodeLevel(Node1);
        Level2 := GetNodeLevel(Node2);
        Run1 := Node1;
        while Level1 > Level2 do
        begin
          Run1 := Run1.Parent;
          Dec(Level1);
        end;
        Run2 := Node2;
        while Level2 > Level1 do
        begin
          Run2 := Run2.Parent;
          Dec(Level2);
        end;

        // now go up until we find a common parent node (loop will safely stop at FRoot if the nodes
        // don't share a common parent)
        while Run1.Parent <> Run2.Parent do
        begin
          Run1 := Run1.Parent;
          Run2 := Run2.Parent;
        end;
        Result := Integer(Run1.Index) - Integer(Run2.Index);
      end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DrawLineImage(Target: TCanvas; X, Y, dY, VAlign, Style: Integer);

// draws (depending on Style) one of the 5 line types of the tree

begin
  with Target do
    case Style of
      LineBottomRight:
        begin
          MoveTo(X + Integer(FIndent) div 2, Y + dY);
          LineTo(X + Integer(FIndent) div 2, Y + VAlign);
          LineTo(X + Integer(FIndent), Y + VAlign);
        end;
      LineTopDown:
        begin
          MoveTo(X + Integer(FIndent) div 2, Y);
          LineTo(X + Integer(FIndent) div 2, Y + dY);
        end;
      LineTopDownRight:
        begin
          MoveTo(X + Integer(FIndent) div 2, Y);
          LineTo(X + Integer(FIndent) div 2, Y + dY);
          MoveTo(X + Integer(FIndent) div 2, Y + VAlign);
          LineTo(X + Integer(FIndent), Y + VAlign);
        end;
      LineRight:
        begin
          MoveTo(X + Integer(FIndent) div 2, Y + VAlign);
          LineTo(X + Integer(FIndent), Y + VAlign);
        end;
      LineTopRight:
        begin
          MoveTo(X + Integer(FIndent) div 2, Y);
          LineTo(X + Integer(FIndent) div 2, Y + VAlign);
          LineTo(X + Integer(FIndent), Y + VAlign);
        end;
    end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.InitRoot;

// (re)initializes the root node (node data size is adjusted)

begin
  FreeMem(FRoot);
  FRoot := MakeNewNode;
  with FRoot^ do
  begin
    // special indication that this node is the root node
    NextSibling := FRoot;
    Parent := Pointer(Self);
    States := [vsInitialized, vsExpanded, vsHasChildren];
    TotalHeight := FDefaultNodeHeight;
    TotalCount := 1;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.TileBackground(Source: TBitmap; Target: TCanvas; R: TRect);

// Draws the given source graphic so that it tiles into the given rectangle which is relative to the target bitmap.
// The graphic is aligned so that it always starts at the upper left corner of the target.

var
  SourceX,
  SourceY,
  TargetX,
  dY: Integer;

begin
  with Target do
  begin
    SourceY := R.Top mod Source.Height;
    // always wrap the source coordinates into positive range
    if SourceY < 0 then
      SourceY := Source.Height + SourceY;

    // tile image vertically until target rect is filled
    while R.Top < R.Bottom do
    begin
      SourceX := R.Left mod Source.Width;
      // always wrap the source coordinates into positive range
      if SourceX < 0 then
        SourceX := Source.Width + SourceX;
      TargetX := R.Left;
      // height of strip to draw
      dY := Min(R.Bottom - R.Top, Source.Height - SourceY);
      // tile the image horizontally
      while TargetX < R.Right do
      begin
        BitBlt(Handle,
               TargetX, R.Top,
               Min(R.Right - TargetX, Source.Width - SourceX),
               dY,
               Source.Canvas.Handle,
               SourceX, SourceY,
               SRCCOPY);
        Inc(TargetX, Source.Width - SourceX);
        SourceX := 0;
      end;
      Inc(R.Top, Source.Height - SourceY);
      SourceY := 0;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SelectNodes(StartNode, EndNode: PVirtualNode; AddOnly: Boolean);

// Selects a range of nodes and unselects all other eventually selected nodes which are not in this range if
// AddOnly is False.
// EndNode must be visible while StartNode must not as in the case where the last focused node is the start node
// but it is a child of a node which has been collapsed previously. In this case the first visible parent node
// is used as start node. StartNode can be nil in which case the very first node in the tree is used.

var
  NodeFrom,
  NodeTo: PVirtualNode;

begin
  Assert(Assigned(EndNode), 'SelectNodes: EndNode must not be nil!');
  ClearTempCache;
  if StartNode = nil then
    StartNode := FRoot.FirstChild
  else
    if not IsVisible[StartNode] then
      StartNode := GetPreviousVisible(StartNode);

  if CompareNodePositions(StartNode, EndNode) < 0 then
  begin
    NodeFrom := StartNode;
    NodeTo := EndNode;
  end
  else
  begin
    NodeFrom := EndNode;
    NodeTo := StartNode;
  end;

  if not AddOnly then
    InternalClearSelection;

  while NodeFrom <> NodeTo do
  begin
    InternallyCacheNode(NodeFrom);
    NodeFrom := GetNextVisible(NodeFrom);
  end;
  // select last node too
  InternallyCacheNode(NodeFrom);
  // now add them all in "one" step
  AddToSelection(FTempNodeCache, FTempNodeCount);
  ClearTempCache;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.StructureChange(Node: PVirtualNode);

begin
  StopTimer(StructureChangeTimer);
  if assigned(FOnStructureChange) then
    FOnStructureChange(Self, Node);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.ToggleSelection(StartNode, EndNode: PVirtualNode);

// switchs the selection state of a range of nodes
// Note: This method is specifically designed to help selecting ranges with the keyboard and considers therefor
//       the range anchor.

var
  NodeFrom,
  NodeTo: PVirtualNode;
  NewSize: Integer;
  Position: Integer;

begin
  Assert(Assigned(EndNode), 'ToggleSelection: EndNode must not be nil!');
  if StartNode = nil then
    StartNode := FRoot.FirstChild
  else
    if not IsVisible[StartNode] then
      StartNode := GetPreviousVisible(StartNode);

  Position := CompareNodePositions(StartNode, EndNode);
  // nothing to do if start and end node are the same
  if Position <> 0 then
  begin
    if Position < 0 then
    begin
      NodeFrom := StartNode;
      NodeTo := EndNode;
    end
    else
    begin
      NodeFrom := EndNode;
      NodeTo := StartNode;
    end;

    ClearTempCache;

    // 1) toggle the start node if it is before the range anchor
    if CompareNodePositions(NodeFrom, FRangeAnchor) < 0 then
      if not (vsSelected in NodeFrom.States) then
        InternallyCacheNode(NodeFrom)
      else
        InternalRemoveFromSelection(NodeFrom);

    // 2) toggle all nodes within the range
    NodeFrom := GetNextVisible(NodeFrom);
    while NodeFrom <> NodeTo do
    begin
      if not (vsSelected in NodeFrom.States) then
        InternallyCacheNode(NodeFrom)
      else
        InternalRemoveFromSelection(NodeFrom);
      NodeFrom := GetNextVisible(NodeFrom);
    end;

    // 3) toggle end node if it is after the range anchor
    if CompareNodePositions(NodeFrom, FRangeAnchor) > 0 then
      if not (vsSelected in NodeFrom.States) then
        InternallyCacheNode(NodeFrom)
      else
        InternalRemoveFromSelection(NodeFrom);

    // do some housekeeping if there was a change
    NewSize := PackArray(FSelection, FSelectionCount);
    if NewSize > -1 then
    begin
      FSelectionCount := NewSize;
      SetLength(FSelection, FSelectionCount);
    end;
    // if the range went over the anchor then we need to reselect it
    if not (vsSelected in FRangeAnchor.States) then
      InternallyCacheNode(FRangeAnchor);
    if FTempNodeCount > 0 then
      AddToSelection(FTempNodeCache, FTempNodeCount);
    ClearTempCache;

  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.HandleClickSelection(LastFocused, NewNode: PVirtualNode; Shift: TShiftState);

// handles multi-selection with mouse click

begin
  // Ctrl key down
  if ssCtrl in Shift then
  begin
    if ssShift in Shift then
    begin
      SelectNodes(LastFocused, NewNode, True);
      Invalidate;
    end
    else
    begin
      if vsSelected in NewNode.States then
        RemoveFromSelection(NewNode)
      else
        AddToSelection(NewNode);
      InvalidateNode(NewNode);
    end;
  end
  else
    // Shift key down
    if ssShift in Shift then
    begin
      if FRangeAnchor = nil then
      begin
        FRangeAnchor := NewNode;
      end;
      // select node range
      if assigned(FRangeAnchor) then
      begin
        SelectNodes(FRangeAnchor, NewNode, False);
        Invalidate;
      end;
    end
    else
    begin
      // any other case
      if not (vsSelected in NewNode.States) then
      begin
        AddToSelection(NewNode);
        InvalidateNode(NewNode);
      end;
      // assign new reference item
      FRangeAnchor := NewNode;
    end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.AddToSelection(Node: PVirtualNode);

begin
  Assert(Assigned(Node), 'AddToSelection: Node must not be nil!');
  FSingletonNodeArray[0] := Node;
  InternalAddToSelection(FSingletonNodeArray, 1, False);
  if FUpdateCount = 0 then
    DoChange(Node);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.AddToSelection(const NewItems: TNodeArray; NewLength: Integer; ForceInsert: Boolean = False);

// Adds the given items all at once into the current selection array. NewLength is the amount of
// nodes to add (necessary to allow NewItems to be larger than the actual used entries).
// ForceInsert is True if nodes must be inserted without consideration of level select constraint or
// already set selected flags (e.g. when loading from stream).
// Note: In the case ForceInsert is True the caller is responsible for making sure the new nodes aren't already in the
//       selection array! 

begin
  InternalAddToSelection(NewItems, NewLength, ForceInsert);
  if FUpdateCount = 0 then
  begin
    if NewLength = 1 then
      DoChange(NewItems[0])
    else
      DoChange(nil);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.ReadNode(Stream: TStream; Node: PVirtualNode);

// Reads the anchor chunk of each node and initiates reading the sub chunks for this node

var
  Header: TChunkHeader;
  EndPosition: Integer;

begin
  with Stream do
  begin
    // read anchor chunk of the node
    Stream.Read(Header, SizeOf(Header));
    if Header.ChunkType = NodeChunk then
    begin
      EndPosition := Stream.Position + Header.ChunkSize;
      // read all subchunks until the indicated chunk end position is reached in the stream
      while Position < EndPosition do
      begin
        // read new chunk header
        Stream.Read(Header, SizeOf(Header));
        ReadChunk(Stream, Node, Header.ChunkType, Header.ChunkSize);
      end;
      // if the last chunk does not end at the given end position then there is something wrong
      if Position <> EndPosition then
        ShowError(SCorruptStream2);
    end
    else
      ShowError(SCorruptStream1);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.RemoveFromSelection(Node: PVirtualNode);

var
  Index: Integer;

begin
  Assert(Assigned(Node), 'RemoveFromSelection: Node must not be nil!');
  if vsSelected in Node.States then
  begin
    Exclude(Node.States, vsSelected);
    if FindNodeInSelection(Node, Index) and (Index < FSelectionCount - 1) then 
      Move(FSelection[Index + 1], FSelection[Index], (FSelectionCount - Index - 1) * 4);
    Dec(FSelectionCount);
    SetLength(FSelection, FSelectionCount);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.PackArray(TheArray: TNodeArray; Count: Integer): Integer; assembler;

// Removes all entries from the selection array which are no longer in use. The selection array must be sorted for this
// algo to work. Values which must be removed are marked with bit 0 (LSB) set. This little trick works because memory
// is always allocated DWORD aligned. Since the selection array must be sorted while determining the entries to be
// removed it is much more efficient to increment the entry in question instead of setting it to nil (which would break
// the ordered appearance of the list).
//
// On enter EAX contains self reference, EDX the address to TheArray and ECX Count
// The returned value is the number of remaining entries in the array, so the caller can reallocate (shorten)
// the selection array if needed or -1 if nothing needs to be changed.

asm
                   PUSH EBX
                   PUSH EDI
                   PUSH ESI
                   MOV ESI, EDX
                   MOV EDX, -1
                   JCXZ @@Finish                 // Empty list?
                   INC EDX                       // init remaining entries counter
                   MOV EDI, ESI                  // source and destination point to the list memory
                   MOV EBX, 1                    // use a register instead of immediate operant to check against
@@PreScan:         TEST [ESI], EBX               // do the fastest scan possible to find the first entry
                                                 // which must be removed
                   JNZ @@DoMainLoop
                   INC EDX
                   ADD ESI, 4
                   DEC ECX
                   JNZ @@PreScan
                   JMP @@Finish

@@DoMainLoop:      MOV EDI, ESI
@@MainLoop:        TEST [ESI], EBX               // odd entry?
                   JNE @@Skip                    // yes, so skip this one
                   MOVSD                         // else move the entry to new location
                   INC EDX                       // count the moved entries
                   DEC ECX
                   JNZ @@MainLoop                // do it until all entries are processed
                   JMP @@Finish

@@Skip:            ADD ESI, 4                    // point to the next entry
                   DEC ECX
                   JNZ @@MainLoop                // do it until all entries are processed
@@Finish:          MOV EAX, EDX                  // prepare return value
                   POP ESI
                   POP EDI
                   POP EBX
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoReset(Node: PVirtualNode);

begin
  if Assigned(FOnResetNode) then
    FOnResetNode(Self, Node);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoSaveUserData(Node: PVirtualNode; Stream: TStream);

begin
  if Assigned(FOnSaveNode) then
    if Node = FRoot then
      FOnSaveNode(Self, nil, Stream)
    else
      FOnSaveNode(Self, Node, Stream);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoStructureChange(Node: PVirtualNode);

begin
  if FChangeDelay > 0 then
  begin
    StopTimer(StructureChangeTimer);
    FLastChangedNode := Node;
    SetTimer(Handle, StructureChangeTimer, FChangeDelay, nil);
  end
  else
    StructureChange(Node);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DrawDottedHLine(Canvas: TCanvas; X, Y, W: Integer);

// optimized variant to draw a horizontal line with alternating pixels (this style is not supported under Win9x)

begin
  if X < 0 then
    X := X mod ClientWidth;
  BitBlt(Canvas.Handle, X, Y, W, 1, FHDotLine.Canvas.Handle, 0, 0, SRCCOPY);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DrawDottedVLine(Canvas: TCanvas; X, Y, H: Integer);

// optimized variant to a vertical draw line with alternating pixels (this style is not supported under Win9x)

begin
  BitBlt(Canvas.Handle, X, Y, 1, H, FVDotLine.Canvas.Handle, 0, Y, SRCCOPY);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.FindNodeInSelection(P: PVirtualNode; var Index: Integer): Boolean;

// search routine to find a specific node in the selection array (which must be sorted!)

var
  L, H,
  I, C: Integer;

begin
  Result := False;
  L := 0;
  H := FSelectionCount - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := Integer(FSelection[I]) - Integer(P);
    if C < 0 then
      L := I + 1
    else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        L := I;
      end;
    end;
  end;
  Index := L;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.FindNodeInSelection(P: PVirtualNode; var Index: Integer; LowBound,
  HighBound: Integer): Boolean;

// search routine to find a specific node in the selection array (which must be sorted!)
// LowBound and HighBound determine the range in which to search the node (LowBound <= HighBound!)

var
  L, H,
  I, C: Integer;

begin
  Result := False;
  if LowBound >= 0 then
    L := LowBound
  else
    L := 0;
  if HighBound > -1 then
    H := HighBound
  else
    H := FSelectionCount - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := Integer(FSelection[I]) - Integer(P);
    if C < 0 then
      L := I + 1
    else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        L := I;
      end;
    end;
  end;
  Index := L;
end;

//----------------------------------------------------------------------------------------------------------------------

const
  ScrollMasks: array[Boolean] of UINT = (0, SIF_DISABLENOSCROLL);

procedure TBaseVirtualTree.UpdateHorizontalScrollBar(DoRepaint: Boolean);

var
  ScrollInfo: TScrollInfo;

begin
  if (hoVisible in FHeader.FOptions) then
    FRangeX := FHeader.FColumns.TotalWidth
  else
    FRangeX := GetMaxRightExtend;

  FillChar(ScrollInfo, SizeOf(ScrollInfo), 0);
  ScrollInfo.cbSize := SizeOf(ScrollInfo);
  ScrollInfo.fMask := SIF_ALL;
  FlatSB_GetScrollInfo(Handle, SB_HORZ, ScrollInfo);

  if (FScrollBarOptions.ScrollBars in [ssHorizontal, ssBoth]) and
     (FRangeX > Cardinal(ClientWidth)) then
  begin
    ScrollInfo.nMax := FRangeX;
    ScrollInfo.nPos := -FOffsetX;
  end
  else
  begin
    // hide scroll bar independent of actual scroll range
    ScrollInfo.nMax := ClientWidth - 1;
  end;

  if ClientWidth > 0 then
    ScrollInfo.nPage := ClientWidth
  else
    ScrollInfo.nPage := 0;

  ScrollInfo.fMask := SIF_ALL or ScrollMasks[FScrollBarOptions.AlwaysVisible];
  FlatSB_SetScrollInfo(Handle, SB_HORZ, ScrollInfo, DoRepaint);
  
  // since the position is automatically changed if it doesn't meet the range
  // we better read the current position back to keep synchronized
  SetOffsetX(-FlatSB_GetScrollPos(Handle, SB_HORZ));
end;

//----------------------------------------------------------------------------------------------------------------------


procedure TBaseVirtualTree.UpdateVerticalScrollBar(DoRepaint: Boolean);

var
  ScrollInfo: TScrollInfo;

begin
  // total node height includes the height of the invisble root node
  if FRoot.TotalHeight < FDefaultNodeHeight then
    FRoot.TotalHeight := FDefaultNodeHeight;
  FRangeY := FRoot.TotalHeight - FRoot.NodeHeight;

  ScrollInfo.cbSize := SizeOf(ScrollInfo);
  ScrollInfo.fMask := SIF_ALL;
  FlatSB_GetScrollInfo(Handle, SB_VERT, ScrollInfo);

  if (FScrollBarOptions.ScrollBars in [ssVertical, ssBoth]) and
     (FRangeY > Cardinal(ClientHeight))  then
  begin
    ScrollInfo.nMax := FRangeY;
    ScrollInfo.nPos := -FOffsetY;
    if ClientHeight < 0 then
      ScrollInfo.nPage := 0
    else
      ScrollInfo.nPage := ClientHeight + 1;
  end
  else
  begin
    // hide scroll bar independent of actual scroll range
    ScrollInfo.nMin := 0;
    ScrollInfo.nMax := 0;
    ScrollInfo.nPage := 0;
  end;

  ScrollInfo.fMask := SIF_ALL or ScrollMasks[FScrollBarOptions.AlwaysVisible];
  FlatSB_SetScrollInfo(Handle, SB_VERT, ScrollInfo, DoRepaint);

  // since the position is automatically changed if it doesn't meet the range
  // we better read the current position back to keep synchronized
  SetOffsetY(-FlatSB_GetScrollPos(Handle, SB_VERT));
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SkipNode(Stream: TStream);

// skips the data for the next node in the given stream (including the child nodes)

var
  Header: TChunkHeader;

begin
  with Stream do
  begin
    // read achor chunk of the node
    Stream.Read(Header, SizeOf(Header));
    if Header.ChunkType = NodeChunk then
      Stream.Position := Stream.Position + Header.ChunkSize
    else
      ShowError(SCorruptStream1);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SortSelection;

// sorts the current selection array up to FSelectionCount entries

begin
  if FSelectionCount > 1 then
    QuickSort(FSelection, 0, FSelectionCount - 1);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.InternalAddFromStream(Stream: TStream; Node: PVirtualNode);

// Loads nodes from the given stream and adds them as children to Node.
// Because the new nodes might be selected this method also fixes the selection array.

var
  Stop: PVirtualNode;
  LastVisibleCount: Cardinal;
  Index: Integer;

begin
  if Node = nil then
    Node := FRoot;

  // read in the new nodes, keep number of visible nodes for a correction
  LastVisibleCount := FVisibleCount;
  ReadNode(Stream, Node);
  // I need to fix the visible count here because of the hierarchical load procedure
  // this values is wrong (nodes are added several times)
  if (Node = FRoot) or (vsExpanded in Node.Parent.States) then
    FVisibleCount := LastVisibleCount + CountVisibleChildren(Node)
  else
    FVisibleCount := LastVisibleCount;

  // fix selection array
  ClearTempCache;
  if Node = FRoot then
    Stop := nil
  else
    Stop := Node.NextSibling;

  if voMultiSelect in FOptions then
  begin
    // add all nodes which were selected before to the current selection (unless they are already there)
    while Node <> Stop do
    begin
      if (vsSelected in Node.States) and not FindInNodeCache(Node, Index) then
        InternallyCacheNode(Node);
      Node := GetNextNoInit(Node);
    end;
    if FTempNodeCount > 0 then
      AddToSelection(FTempNodeCache, FTempNodeCount, True);
    ClearTempCache;
  end
  else // no further selected nodes allowed so delete the corresponding flag in all new nodes
    while Node <> Stop do
    begin
      Exclude(Node.States, vsSelected);
      Node := GetNextNoInit(Node);
    end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.InternalAddToSelection(Node: PVirtualNode; ForceInsert: Boolean);

var
  NewItems: TNodeArray;

begin
  Assert(Assigned(Node), 'InternalAddToSelection: Node must not be nil!');
  SetLength(NewItems, 1);
  NewItems[0] := Node;
  InternalAddToSelection(NewItems, 1, False);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.InternalAddToSelection(const NewItems: TNodeArray; NewLength: Integer;
  ForceInsert: Boolean);

// Internal version of method AddToSelection which does not trigger OnChange events

var
  I, J: Integer;
  CurrentEnd: Integer;
  Constrained: Boolean;

begin
  // The idea behind this code is to use a kind of reverse merge sort. QuickSort is quite fast
  // and would do the job here too but has a serious problem with already sorted lists like FSelection.

  // 1) Remove already selected items, mark all other as being selected.
  if ForceInsert then
  begin
    for I := 0 to NewLength - 1 do
      Include(NewItems[I].States, vsSelected);
  end
  else
  begin
    Constrained := voLevelSelectConstraint in FOptions;
    if Constrained and (FLastSelectionLevel = -1) then
      FLastSelectionLevel := GetNodeLevel(NewItems[0]);
      
    for I := 0 to NewLength - 1 do
      if ([vsSelected, vsDisabled] * NewItems[I].States <> []) or (Constrained and
         (Cardinal(FLastSelectionLevel) <> GetNodeLevel(NewItems[I]))) then
        Inc(Cardinal(NewItems[I]))
      else
        Include(NewItems[I].States, vsSelected);
  end;
  
  I := PackArray(NewItems, NewLength);
  if I > -1 then
    NewLength := I;
  if NewLength > 0 then
  begin
    // 2) Sort the new item list so we can easily traverse it.
    if NewLength > 1 then
      QuickSort(NewItems, 0, NewLength - 1);
    // 3) Make room in FSelection for the new items.
    if FSelectionCount + NewLength >= Length(FSelection) then
      SetLength(FSelection, FSelectionCount + NewLength);

    // 4) Merge in new items
    J := NewLength - 1;
    CurrentEnd := FSelectionCount - 1;

    while J >= 0 do
    begin
      // First insert all new entries which are greater than the greatest entry in the old list.
      // If the current end marker is < 0 then there's nothing more to move in the selection
      // array and only the remaining new items must be inserted.
      if CurrentEnd >= 0 then
      begin
        while (J >= 0) and (Cardinal(NewItems[J]) > Cardinal(FSelection[CurrentEnd])) do
        begin
          FSelection[CurrentEnd + J + 1] := NewItems[J];
          Dec(J);
        end;
        // early out if nothing more needs to be copied
        if J < 0 then
          Break;
      end
      else
      begin
        // insert remaining new entries at position 0
        Move(NewItems[0], FSelection[0], (J + 1) * SizeOf(Pointer));
        // nothing more to do so exit main loop
        Break;
      end;

      // find the last entry in the remaining selection list which is smaller then the largest
      // entry in the remaining new items list
      FindNodeInSelection(NewItems[J], I, 0, CurrentEnd);
      Dec(I);
      // move all entries which are greater than the greatest entry in the new items list up
      // so the remaining gap travels down to where new items must be inserted
      Move(FSelection[I + 1], FSelection[I + J + 2], (CurrentEnd - I) * SizeOf(Pointer));
      CurrentEnd := I;
    end;

    Inc(FSelectionCount, NewLength);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.InternallyCacheNode(Node: PVirtualNode);

// adds the given node to the temporary node cache (used when collecting possibly large amounts of nodes)

var
  Len: Cardinal;

begin
  Len := Length(FTempNodeCache);
  if FTempNodeCount = Len then
  begin
    if Len < 100 then
      Len := 100
    else
      Len := Len + Len div 10;
    SetLength(FTempNodeCache, Len);
  end;
  FTempNodeCache[FTempNodeCount] := Node;
  Inc(FTempNodeCount);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.InternalClearSelection;  

begin
  while FSelectionCount > 0 do
  begin
    Dec(FSelectionCount);
    Exclude(FSelection[FSelectionCount].States, vsSelected);
  end;
  FSelection := nil;
  Exclude(FStates, tsClearPending);
end;                                         

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.CancelEditNode;

// called by the application or the current edit link to cancel the edit action

begin
  if HandleAllocated and ([tsEditing, tsEditPending] * FStates <> []) then
    DoCancelEdit;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.ClearSelection;

begin
  if (FSelectionCount > 0) and not (csDestroying in ComponentState) then
  begin
    InternalClearSelection;
    FLastSelectionLevel := -1;
    // repainting the entire tree is actually much faster than determining the display rectangles of all
    // previously selected nodes and invalidating them
    if FUpdateCount = 0 then
    begin
      Invalidate;
      DoChange(nil);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.CMCtl3DChanged(var Message: TMessage);

begin
  inherited;
  if FBorderStyle = bsSingle then
    RecreateWnd;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoCheckClick(Node: PVirtualNode);

begin
  with Node^ do
  begin
    if not (vsDisabled in States) then
      case CheckType of
        ctCheckBox:
          if CheckState = csUnchecked then
            SetCheckState(Node, csChecked)
          else
            SetCheckState(Node, csUnchecked);
        ctTriStateCheckBox:
          case CheckState of
            csUnchecked, // Making a grayed selection is not intuitive because it just represents the state
                         // that only a part of the children are checked (and some may even not have the check box style).
            csCheckedGrayed:
              SetCheckState(Node, csChecked);
            csChecked:
              SetCheckState(Node, csUnchecked);
          end;
        ctRadioButton:
          SetCheckState(Node, csChecked);
        ctButton:
          SetCheckState(Node, csUnpressed);
      end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMLButtonUp(var Message: TWMLButtonUp);

begin
  HandleMouseUp(Message);
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMMButtonDown(var Message: TWMMButtonDown);

begin
  inherited;
  if voMiddleClickSelect in FOptions then
    HandleMouseDown(Message);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMMButtonUp(var Message: TWMMButtonUp);

begin
  inherited;
  if voMiddleClickSelect in FOptions then
    HandleMouseUp(Message);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetFirstSelected: PVirtualNode;

// returns the first node in the current selection
// Note: The selection is sorted by memory reference, not structurally. This means the nodes return by this method and
//       GetNextSelected must to be considered as being random in order! Otherwise we'd need yet another cache and/or
//       quite a lot of CPU power. 

begin
  if FSelectionCount > 0 then
    Result := FSelection[0]
  else
    Result := nil;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetHitTestInfoAt(X, Y: Integer; var HitInfo: THitInfo): PVirtualNode;

// Determines the node that occupies the specified point, or nil if no node occupies the point. Additionally,
// HitInfo is filled with flags describing the hit further.

var
  Indent: Integer;
  Temp: PVirtualNode;
  NodeWidth,
  ImageOffset: Integer;

begin
  HitInfo.HitPosition := [];
  HitInfo.HitColumn := InvalidColumn;
  Result := nil;
  // determine if point lies in client area
  if X < 0 then
    Include(HitInfo.HitPosition, hiToLeft)
  else
    if X > ClientWidth then
      Include(HitInfo.HitPosition, hiToRight);

  if Y < 0 then
    Include(HitInfo.HitPosition, hiAbove)
  else
    if Y > ClientHeight then
      Include(HitInfo.HitPosition, hiBelow);

  // if the point is in the client area then check the nodes
  if HitInfo.HitPosition = [] then
  begin
    Result := GetNodeAt(X, Y);
    if Result = nil then
      Include(HitInfo.HitPosition, hiNowhere)
    else
    begin
      if FHeader.UseColumns then
      begin
        HitInfo.HitColumn := FHeader.Columns.ColumnFromPosition(Point(X, Y));
        if voExtendedFocus in FOptions then
        begin
          // if auto column spanning is enabled then look for the last non empty column
          if voAutoSpanColumns in FOptions then
            while (HitInfo.HitColumn > -1) and ColumnIsEmpty(Result, HitInfo.HitColumn) do
              HitInfo.HitColumn := FHeader.FColumns.GetPreviousVisibleColumn(HitInfo.HitColumn);
        end;
      end
      else
        HitInfo.HitColumn := -1;

      if HitInfo.HitColumn = InvalidColumn then
        Include(HitInfo.HitPosition, hiNowhere)
      else
      begin
        // here we have the node which is occupied by Y (might only partially be visible),
        // now determine horizontal hit position

        // determine base base offset (take column reordering into account)
        if HitInfo.HitColumn > -1 then
          Indent := FHeader.FColumns[HitInfo.HitColumn].Left
        else
          Indent := FOffsetX;
        // if no columns are used or the main column is hit then the usual tree indentation must be considered too
        if (HitInfo.HitColumn + 1) in [0, 1] then
        begin
          Temp := Result;
          while (Temp.Parent <> FRoot) do
          begin
            Inc(Indent, FIndent);
            Temp := Temp.Parent;
          end;
          if voShowRoot in FOptions then
            Inc(Indent, FIndent);
        end;

        if X <= Indent then
        begin
          // position is to the left of calculated intentation which can only happen for the main column,
          // check whether it corresponds to a button/checkbox
          if voShowButtons in FOptions then
          begin
            // Position of button is interpreted very generously to avoid forcing the user
            // to click exactly into the 9x9 pixels area. The entire node height and one full
            // indentation level is accepted as button hit.
            if X >= Indent - Integer(FIndent) then
              Include(HitInfo.HitPosition, hiOnItemButton);
          end;
          // no button hit so position is on indent
          if HitInfo.HitPosition = [] then
            Include(HitInfo.HitPosition, hiOnItemIndent);
        end
        else
        begin
          // general case for all columns (except checkbox), the hit can either be:
          //   - on the check box
          //   - the state image
          //   - the normal image                    
          //   - the label or
          //   - to the right of the node
          Dec(X, Indent);

          // consider associated images
          ImageOffset := 0;
          // check support is only for the main column
          if ((HitInfo.HitColumn + 1) in [0, 1]) and (voCheckSupport in FOptions) and (Result.CheckType <> ctNone) then
            Inc(ImageOffset, FCheckImages.Width + 2);

          if X < ImageOffset then
            HitInfo.HitPosition := [hiOnItem, hiOnItemCheckBox]
          else
          begin
            if Assigned(FStateImages) and (DoGetImageIndex(Result, ikState, HitInfo.HitColumn) > -1) then
              Inc(ImageOffset, FStateImages.Width + 2);
            if Assigned(FImages) and (DoGetImageIndex(Result, ikNormal, HitInfo.HitColumn) > -1) then
              Inc(ImageOffset, FImages.Width + 2);
            if X < ImageOffset then
              HitInfo.HitPosition := [hiOnItem, hiOnItemBitmap]
            else
            begin
              NodeWidth := DoGetNodeWidth(Result, HitInfo.HitColumn);
              if (X - ImageOffset) < NodeWidth then
                HitInfo.HitPosition := [hiOnItem, hiOnItemLabel]
              else
                HitInfo.HitPosition := [hiOnItemRight];
            end;
          end;
        end; // X > Indent
      end; // hit column is valid
    end; // assigned node
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetNodeAt(X, Y: Integer): PVirtualNode;

// Returns the node that occupies the specified point, or nil if there's none.
// X and Y must be given in client coordinates.

var
  RealPos,
  Index,
  CurrentPos: Cardinal;

begin
  Assert(Y >= FOffsetY, 'GetNodeAt: invalid vertical position.');

  RealPos := Y - FOffsetY;
  Result := FRoot.FirstChild;
  // CurrentPos tracks a running term of the current position to test for.
  // It corresponds aways to the top position of the currently considered node.
  CurrentPos := 0;
  // if the cache is available then use it
  if Assigned(FPositionCache) and (FPositionCache[0].Node <> nil) then
  begin
    for Index := 0 to High(FPositionCache) do
    begin
      // if the cache is currently validated by the worker thread but the thread hasn't already
      // validated the node we need then wait for it
      while (FPositionCache[Index].Node = nil) and not Application.Terminated do
        Sleep(100);
      if RealPos < FPositionCache[Index].AbsoluteTop then
      begin
        if Index > 0 then
        begin
          Result := FPositionCache[Index - 1].Node;
          CurrentPos := FPositionCache[Index - 1].AbsoluteTop;
          FLastCacheHit := Index - 1;
        end;
        Break;
      end;
    end;

    // if no node could be found (position is higher then the absolute pos of the last node in
    // the cache) then use the last node as starting point
    if (CurrentPos = 0) and (Index > 0)then
    begin
      Result := FPositionCache[High(FPositionCache)].Node;
      CurrentPos := FPositionCache[High(FPositionCache)].AbsoluteTop;
      FLastCacheHit := High(FPositionCache);
    end;
  end
  else
    FLastCacheHit := -1;

  // determine node, of which position and height corresponds to the scroll position most closely
  if Assigned(Result) then
    while Result <> FRoot do
    begin
      if RealPos < (CurrentPos + Result.TotalHeight) then
      begin
        // found a node which covers the given position, now go down one level
        // and search its children (if any, else stop looking)
        if (RealPos >= CurrentPos + Result.NodeHeight) and
           Assigned(Result.FirstChild) and
           (vsExpanded in Result.States) then
        begin
          Inc(CurrentPos, Result.NodeHeight);
          Result := Result.FirstChild;
          Continue;
        end
        else
          Break;
      end
      else
      begin
        // advance current position to after the current node
        Inc(CurrentPos, Result.TotalHeight);
        // advance from sibling to sibling
        if Assigned(Result.NextSibling) then
          Result := Result.NextSibling
        else
        begin
          // If the current node has no further siblings then we need to find one of its parents which
          // have further nodes. We cannot use GetNextVisible here since it goes also down child nodes
          // which we know not to be in the area in question.
          repeat
            Result := Result.Parent;
          until (Result = FRoot) or Assigned(Result.NextSibling);
          if Result <> FRoot then
            Result := Result.NextSibling;
        end;
      end;
    end;

  if Result = FRoot then
    Result := nil;
  // Keep the coordinate of the top line of the last considered node for further referenece,
  // but convert absolute top into a relative top position.
  FLastNodeTop := Integer(CurrentPos) + FOffsetY;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMLButtonDblClk(var Message: TWMLButtonDblClk);

var
  Node: PVirtualNode;
  HitInfo: THitInfo;

begin
  if tsEditPending in FStates then
  begin
    StopTimer(EditTimer);
    Exclude(FStates, tsEditPending);
  end;

  inherited;

  // get information about the hit
  Node := GetHitTestInfoAt(Message.XPos, Message.YPos, HitInfo);
  if hiOnItemCheckBox in HitInfo.HitPosition then
  begin
    FCheckNode := Node;
    RepaintNode(Node);
  end
  else
    if hiOnItemButton in HitInfo.HitPosition then
      ToggleNode(Node)
    else
      if voToggleOnDblClick in FOptions then
      begin
        if ((([hiOnItemButton, hiOnItemLabel, hiOnItemBitmap] * HitInfo.HitPosition) <> []) or
          ((voFullRowSelect in FOptions) and Assigned(Node))) then
          ToggleNode(Node);
      end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMKillFocus(var Msg: TWMKillFocus);

begin
  inherited;
  // don't let any timer continue if the tree is no longer the active control
  StopTimer(ExpandTimer);
  StopTimer(EditTimer);
  Exclude(FStates, tsEditPending);
  StopTimer(HeaderTimer);
  StopTimer(ScrollTimer);
  FStates := FStates - [tsScrollPending, tsScrolling];

  if FSelectionCount > 0 then
    Invalidate
  else
    if Assigned(FFocusedNode) then
      InvalidateNode(FFocusedNode);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMPaste(var Message: TWMPaste);

begin
  PasteFromClipboard;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMRButtonDown(var Message: TWMRButtonDown);

begin
  inherited;
  if voRightClickSelect in FOptions then
    HandleMouseDown(Message);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMRButtonUp(var Message: TWMRButtonUp);

// handle right click selection and node specific popup menu

var
  Menu: TPopupMenu;
  Run: PVirtualNode;
  AskParent: Boolean;

begin
  if voRightClickSelect in FOptions then
    HandleMouseUp(Message);

  // support for node dependent popup menus
  if Assigned(FOnGetPopupMenu) then
  begin
    Run := GetNodeAt(Message.XPos, Message.YPos);
    if Assigned(Run) then
    begin
      FocusedNode := Run;
      Menu := nil;
      AskParent := True;
      repeat
        FOnGetPopupMenu(Self, Run, 0, AskParent, Menu);
        Run := Run.Parent;
      until (Run = FRoot) or Assigned(Menu) or not AskParent;

      if assigned(Menu) then
      begin
        StopTimer(EditTimer);
        Menu.PopupComponent := Self;
        with ClientToScreen(Point(Message.XPos, Message.YPos)) do
          Menu.Popup(X, Y);
        Exit;
      end;
    end;
  end;
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMReleaseEditLink(var Message: TMessage);

begin
  // finally free edit link memory after editing has been finished
  if not IsEditing then
    FEditLink := nil;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMSetCursor(var Message: TWMSetCursor);

// sets the correct mouse cursor (header)

begin
  with Message do
    if CursorWnd = Handle then
      if (csDesigning in ComponentState) then
        inherited
      else
        if not FHeader.HandleMessage(TMessage(Message)) and Assigned(FCurrentHotNode) then
          Windows.SetCursor(Screen.Cursors[FHotCursor])
        else
          Windows.SetCursor(Screen.Cursors[Cursor]);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMSetFocus(var Msg: TWMSetFocus);

begin
  inherited;
  if FSelectionCount > 0 then
    Invalidate
  else
    if Assigned(FFocusedNode) then
      InvalidateNode(FFocusedNode);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetImages(const Value: TImageList);

begin
  if FImages <> Value then
  begin
    if Assigned(FImages) then
      FImages.UnRegisterChanges(FImageChangeLink);
    FImages := Value;
    if Assigned(FImages) then
      FImages.RegisterChanges(FImageChangeLink);
    if not (csLoading in ComponentState) then
      Invalidate;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.Notification(AComponent: TComponent; Operation: TOperation);

begin
  if Operation = opRemove then
    if AComponent = FImages then
    begin
      FImages := nil;
      if not (csDestroying in ComponentState) then
        Invalidate;
    end
    else
      if AComponent = FStateImages then
      begin
        FStateImages := nil;
        if not (csDestroying in ComponentState) then
          Invalidate;
      end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMGetDlgCode(var Message: TWMGetDlgCode);

begin
  Message.Result := DLGC_WANTCHARS or DLGC_WANTARROWS;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMKeyDown(var Message: TWMKeyDown);

// keyboard event handling for node focus and selection
// The behavior is currently defined as:
// - any special key without Shift or Ctrl clears the current selection
// - navigation keys (Home, End, Next, Prior etc.) together with Ctrl only scroll the tree
// - navigation keys together with Shift modify the current selection and set the focused node accordingly
//   which in turn scrolls the tree vertically if the new node is not visible
// - navigation keys without Ctrl or Shift set a new focused node
// Special behavior:
// - left arrow key (w/o Shift or Ctrl) collapses the currently focused node if it is expanded else the parent
//   becomes the new focused node, in extended focus mode the previous column is selected
// - left arrow key together with Ctrl scrolls the tree to the left without any further change to the selection or
//   or the currently focused node (scroll amount is FIndent)
// - right arrow key (w/o Shift or Ctrl) expands the currently focused node if it is collapsed else the first child
//   becomes the new focused node (if there's one, else no focused change is performed),
//   in extended focus mode the next column is selected
// - right arrow key together with Ctrl scrolls the tree to the right without any further change to the selection or
//   or the currently focused node (scroll amount is FIndent)
// - in edit mode also the currently active editor is handled

var
  Shift: TShiftState;
  Node, Temp,
  LastFocused: PVirtualNode;
  Offset: Integer;
  NeedInvalidate,
  DoRangeSelect,
  HandleMultiSelect: Boolean;
  Context: Integer;
  ParentControl: TWinControl;

begin
  // make form key preview work and let application modify the key if it wants this
  inherited;

  with Message do
  begin
    Shift := KeyDataToShiftState(KeyData);
    if CharCode in [VK_HOME, VK_END, VK_PRIOR, VK_NEXT, VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT] then
    begin
      HandleMultiSelect := (ssShift in Shift) and (voMultiSelect in FOptions) and not IsEditing;

      // flag to avoid range selection in case of single node advance
      DoRangeSelect := (CharCode in [VK_HOME, VK_END, VK_PRIOR, VK_NEXT]) and HandleMultiSelect and not IsEditing;

      NeedInvalidate := DoRangeSelect or (FSelectionCount > 1);
      if (Shift = []) or not (voMultiSelect in FOptions) then
        InternalClearSelection;
      // keep old focused node for range selection
      LastFocused := FFocusedNode;
      // determine new focused node
      case CharCode of
        VK_HOME:
          begin
            if Shift = [ssCtrl] then
              ScrollIntoView(FRoot.FirstChild)
            else
              FocusedNode := FRoot.FirstChild
          end;
        VK_END:
          begin
            if Shift = [ssCtrl] then
              ScrollIntoView(GetLastVisibleChild(FRoot.LastChild))
            else
              FocusedNode := GetLastVisibleChild(FRoot.LastChild)
          end;
        VK_PRIOR:
          begin
            Offset := 0;
            // if there's no focused node then just take the very first one
            if FFocusedNode = nil then
              Node := FRoot.FirstChild
            else
            begin
              // go up as many nodes as comprise together a size of ClientHeight
              Node := FFocusedNode;
              while Offset < ClientHeight do
              begin
                Temp := GetPreviousVisible(Node);
                if Temp = nil then
                  Break;
                Node := Temp;
                Inc(Offset, Node.NodeHeight);
              end;
            end;
            SetOffsetY(FOffsetY + Offset);
            if Shift <> [ssCtrl] then
              FocusedNode := Node;
          end;
        VK_NEXT:
          begin
            Offset := 0;
            // if there's no focused node then just take the very last one
            if FFocusedNode = nil then
              Node := GetLastVisibleChild(FRoot.LastChild)
            else
            begin
              // go up as many nodes as comprise together a size of ClientHeight
              Node := FFocusedNode;
              while Offset < ClientHeight do
              begin
                Temp := GetNextVisible(Node);
                if Temp = nil then
                  Break;
                Node := Temp;
                Inc(Offset, Node.NodeHeight);
              end;
            end;
            SetOffsetY(FOffsetY - Offset);
            if Shift <> [ssCtrl] then
              FocusedNode := Node;
          end;
        VK_UP:
          begin
            // scrolling without selection change
            if ssCtrl in Shift then
              SetOffsetY(FOffsetY + Integer(FDefaultNodeHeight))
            else
            begin
              if FFocusedNode = nil then
                Node := GetLastVisibleChild(FRoot)
              else
                Node := GetPreviousVisible(FFocusedNode);
              CancelEditNode;
              if Assigned(Node) then
              begin
                if HandleMultiSelect and (CompareNodePositions(Node, FRangeAnchor) > 0) then
                  RemoveFromSelection(FFocusedNode);
                FocusedNode := Node;
              end;
            end;
          end;
        VK_DOWN:
          begin
            // scrolling without selection change
            if ssCtrl in Shift then
              SetOffsetY(FOffsetY - Integer(FDefaultNodeHeight))
            else
            begin
              if FFocusedNode = nil then
                Node := FRoot.FirstChild
              else
                Node := GetNextVisible(FFocusedNode);
              CancelEditNode;
              if Assigned(Node) then
              begin
                if HandleMultiSelect and (CompareNodePositions(Node, FRangeAnchor) < 0) then
                  RemoveFromSelection(FFocusedNode);
                FocusedNode := Node;
              end;
            end;
          end;
        VK_LEFT:
          begin
            // special handling
            if ssCtrl in Shift then
              SetOffsetX(FOffsetX + Integer(FIndent))
            else
            begin
              // other special cases
              Context := InvalidColumn;
              if voExtendedFocus in FOptions then
              begin
                Context := FHeader.Columns.GetPreviousVisibleColumn(FFocusedColumn);
                if Context > -1 then
                  FocusedColumn := Context
              end
              else
                if Assigned(FFocusedNode) and (vsExpanded in FFocusedNode.States) and
                   (Shift = []) and (vsHasChildren in FFocusedNode.States) then
                  ToggleNode(FFocusedNode)
                else
                begin
                  if FFocusedNode = nil then
                    FocusedNode := FRoot.FirstChild
                  else
                  begin
                    if FFocusedNode.Parent <> FRoot then
                      Node := FFocusedNode.Parent
                    else
                      Node := nil;
                    if Assigned(Node) then
                    begin
                      if HandleMultiSelect then
                      begin
                        // and a third special case
                        if FFocusedNode.Index > 0 then
                          DoRangeSelect := True
                        else
                         if CompareNodePositions(Node, FRangeAnchor) > 0 then
                           RemoveFromSelection(FFocusedNode);
                      end;
                      FocusedNode := Node;
                    end;
                  end;
                end;
            end;
          end;
        VK_RIGHT:
          begin
            // special handling
            if ssCtrl in Shift then
              SetOffsetX(FOffsetX - Integer(FIndent))
            else
            begin
              // other special cases
              Context := InvalidColumn;
              if voExtendedFocus in FOptions then
              begin
                Context := FHeader.Columns.GetNextVisibleColumn(FFocusedColumn);
                if Context > -1 then
                  FocusedColumn := Context;
              end
              else
                if Assigned(FFocusedNode) and not (vsExpanded in FFocusedNode.States) and
                   (Shift = []) and (vsHasChildren in FFocusedNode.States) then
                  ToggleNode(FFocusedNode)
                else
                begin
                  if FFocusedNode = nil then
                    FocusedNode := FRoot.FirstChild
                  else
                  begin
                    Node := FFocusedNode.FirstChild;
                    if Assigned(Node) then
                    begin
                      if HandleMultiSelect and (CompareNodePositions(Node, FRangeAnchor) < 0) then
                        RemoveFromSelection(FFocusedNode);
                      FocusedNode := Node;
                    end;
                  end;
                end;
            end;
          end;
      end;
      // determine new selection anchor
      if Shift = [] then
      begin
        FRangeAnchor := FFocusedNode;
        FLastSelectionLevel := GetNodeLevel(FFocusedNode);
      end;
      // finally change the selection for a specific range of nodes
      if DoRangeSelect then
        ToggleSelection(LastFocused, FFocusedNode);

      // make sure the new focused node is also selected
      if Assigned(FFocusedNode) then
        AddToSelection(FFocusedNode);
      // always need to paint entire tree because of the ClearSelection call (if more than one node was selected)
      if NeedInvalidate then
        Invalidate;
    end
    else
      // second change for keys not directly concerned with selection changes
      case CharCode of
        VK_F2:
          begin
            FEditColumn := FFocusedColumn;
            if Assigned(FFocusedNode) and CanEdit(FFocusedNode) then
              DoEdit;
          end;
        187,
        VK_ADD:
          if ssCtrl in Shift then
            FullExpand
          else
            if Assigned(FFocusedNode) and not (vsExpanded in FFocusedNode.States) then
              ToggleNode(FFocusedNode);
        189,
        VK_SUBTRACT:
          if ssCtrl in Shift then
            FullCollapse
          else
            if Assigned(FFocusedNode) and (vsExpanded in FFocusedNode.States) then
              ToggleNode(FFocusedNode);
        VK_MULTIPLY:
          if Assigned(FFocusedNode) and not (vsExpanded in FFocusedNode.States) then
            FullExpand(FFocusedNode);
        VK_ESCAPE: // cancel actions currently in progress
          begin
            if IsMouseSelecting then
            begin
              FStates := FStates - [tsDrawSelecting, tsDrawSelPending];
              Invalidate;
            end
            else
              if IsEditing then
                CancelEditNode;
          end;
        VK_SPACE:
          if Assigned(FFocusedNode) then
          begin
            // if the check node is already assigned then there is a pending check event
            // initiated by a mouse click (cancel this)
            if Assigned(FCheckNode) then
              InvalidateNode(FCheckNode);
            FCheckNode := FFocusedNode;
            if FCheckNode.CheckType = ctButton then
              FCheckNode.CheckState := csPressed;
            RepaintNode(FCheckNode);
          end;
        VK_F1:
          if assigned(FOnGetHelpContext) then
          begin
            Context := 0;
            if Assigned(FFocusedNode) then
            begin
              Node := FFocusedNode;
              // traverse the tree structure up to the root
              repeat
                FOnGetHelpContext(Self, Node, 0, Context);
                Node := Node.Parent;
              until (Node = FRoot) or (Context <> 0);
            end;

            // if no help context could be found try the tree's one
            // or its parent's contexts
            ParentControl := Self;
            while assigned(ParentControl) and (Context = 0) do
            begin
              Context := ParentControl.HelpContext;
              ParentControl := ParentControl.Parent;
            end;
            if Context <> 0 then
              Application.HelpContext(Context);
          end;
      end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMChar(var Message: TWMChar);

// needed for incremental search

begin
  with Message do
  begin
    inherited;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMKeyUp(var Message: TWMKeyUp);

begin
  inherited;
  case Message.CharCode of
    VK_SPACE:
      begin
        // an assigned check node shows a pending check event
        if Assigned(FCheckNode) then
        begin
          if FCheckNode = FFocusedNode then
            DoCheckClick(FCheckNode);
          InvalidateNode(FCheckNode);
          FCheckNode := nil;
        end;
      end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetFocusedNode(Value: PVirtualNode);

var
  Run1,
  Run2: PVirtualNode;
  Level1,
  Level2: Cardinal;

begin
  if Value = FRoot then
    Value := nil;
  if (FFocusedNode <> Value) and
     DoFocusChanging(FFocusedNode, Value, FFocusedColumn, FFocusedColumn) then
  begin
    CancelEditNode;
    if Assigned(FFocusedNode) then
    begin
      // do automatic collapsing of last focused node if enabled, this involves collapsing of all nodes
      // starting from the last focused node up to (but not including) the first common parent of the last
      // and the new node
      if voAutoExpand in FOptions then
      begin
        Run1 := FFocusedNode;
        Run2 := Value;

        // start lookup at the same level
        Level1 := GetNodeLevel(Run1);
        Level2 := GetNodeLevel(Run2);
        while Level1 > Level2 do
        begin
          if vsExpanded in Run1.States then
            ToggleNode(Run1);
          Run1 := Run1.Parent;
          Dec(Level1);
        end;
        while Level2 > Level1 do
        begin
          Run2 := Run2.Parent;
          Dec(Level2);
        end;

        // now go up until we find a common parent node (loop will safely stop at FRoot if both nodes
        // don't share another common parent)
        while Run1.Parent <> Run2.Parent do
        begin
          if vsExpanded in Run1.States then
            ToggleNode(Run1);
          Run1 := Run1.Parent;
          Run2 := Run2.Parent;
        end;

        // if both nodes are on the same level and have the same parent then no loop from above will be invoke
        // hence we must collapse explicitely here 
        if vsExpanded in Run1.States then
          ToggleNode(Run1);
      end;
      InvalidateNode(FFocusedNode);
    end;
    FFocusedNode := Value;
  end;

  // need to scroll the node into view, even it is the same node as before
  if Assigned(FFocusedNode) then
  begin
    // make sure a valid column is set if columns are used and no column has currently the focus
    if FHeader.UseColumns and (FFocusedColumn < 0) then
      FFocusedColumn := 0;
    // do automatic expansion of the newly focused node if enabled
    if (voAutoExpand in FOptions) and not (vsExpanded in FFocusedNode.States) then
      ToggleNode(FFocusedNode); 
    InvalidateNode(FFocusedNode);
    if FUpdateCount = 0 then
      ScrollIntoView(FFocusedNode);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetDisplayRect(Node: PVirtualNode; Column: Integer; TextOnly: Boolean = False): TRect;

// Determines the client coordinates the given node covers, depending on scrolling, expand state etc.
// If the given node cannot be found (because one of its parents is collapsed) then an empty rectangle is returned.
// If TextOnly is True then only the text bounds are returned. Actually, the vertical extent is kept, only the
// horizontal extent is updated. If Column is -1 then the entire client width is used before determining the node's
// width otherwise the bounds of the particular column is returned.
// Note: Column must be a valid column and is used independent of whether the header is visible or not.

var
  Temp: PVirtualNode;
  Offset: Cardinal;
  Index,
  Indent: Integer;

begin
  Assert(Assigned(Node), 'GetDisplayRect: Node must not be nil.');
  Assert(Node <> FRoot, 'GetDisplayRect: Node must not be the hidden root node.');

  // check whether the node is visible (determine indentation level btw.)
  Temp := Node.Parent;
  Indent := 0;
  while (Temp <> FRoot) and (vsExpanded in Temp.States) do
  begin
    Temp := Temp.Parent;
    if (Column + 1) in [0, 1] then
      Inc(Indent, FIndent);
  end;

  // if we found a parent which is collapsed (FRoot is always expanded) then get out off here
  if not (vsExpanded in Temp.States) or (Column = InvalidColumn) then
    Result := Rect(0, 0, 0, 0)
  else
  begin
    // here we know the node is visible
    Offset := 0;
    Temp := GetPreviousVisible(Node);
    if (tsValidating in FStates) or (FNodeCache = nil) or (FNodeCache[0].Node = nil) then
    begin
      // if the cache is not available or not used (because of too few entries) then go straight through
      // all nodes up to the root
      while Assigned(Temp) do
      begin
        Inc(Offset, Temp.NodeHeight);
        Temp := GetPreviousVisible(Temp);
      end;
    end
    else
    begin
      // now try to find a previous (visible) node which is in the node cache
      while Assigned(Temp) do
      begin
        Inc(Offset, Temp.NodeHeight);
        if FindInNodeCache(Temp, Index) then
        begin
          // fine, we found a node in the cache, now calculate the final position and leave the loop
          Result := Rect(0, FNodeCache[Index].AbsoluteTop + Offset,
                         ClientWidth, FNodeCache[Index].AbsoluteTop + Offset + FNodeCache[Index].Node.NodeHeight);
          if FRangeX > Cardinal(ClientWidth) then
            Result.Right := FRangeX;
          Break;
        end;
        // no, this node couldn't be found in the node cache
        Temp := GetPreviousVisible(Temp);
      end;
    end;
    // construct a result if not already done
    if (Temp = FRoot) or (Temp = nil) then
    begin
      Result := Rect(0, Offset, ClientWidth, Offset + Node.NodeHeight);
      if FRangeX > Cardinal(ClientWidth) then
        Result.Right := FRangeX;
    end;
 
    // limit left and right bounds to the given column (-1 stands for no column and 0 for primary column)...
    if Column > -1 then
    begin
      FHeader.FColumns.GetColumnBounds(Column, Result.Left, Result.Right);
      // need only to adjust the rectangle vertically as the left/right bounds are already correct
      OffsetRect(Result, 0, FOffsetY);
    end
    else
      OffsetRect(Result, FOffsetX, FOffsetY);

    // ... or the text of the node if requested 
    if TextOnly then
    begin
      // distance from left column border (margin)
      Inc(Result.Left, FMargin);
      if not (vsInitialized in Node.States) then
        InitNode(Node);
      if (Column + 1) in [0, 1] then
      begin
        if voShowRoot in FOptions then
          Inc(Indent, FIndent);
        if (voCheckSupport in FOptions) and (Node.CheckType <> ctNone) then
          Inc(Indent, FCheckImages.Width + 2);
      end;
      // consider associated images
      if Assigned(FStateImages) and (DoGetImageIndex(Node, ikState, Column) > -1) then
        Inc(Indent, FStateImages.Width + 2);
      if Assigned(FImages) and (DoGetImageIndex(Node, ikNormal, Column) > -1) then
        Inc(Indent, FImages.Width + 2);
      // constrain the result to text only
      Inc(Result.Left, Indent);
      Indent := DoGetNodeWidth(Node, Column);
      if (Result.Left + Indent) < Result.Right then
        Result.Right := Result.Left + Indent;
    end;

  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.ReinitChildren(Node: PVirtualNode; recursive: Boolean);

// forces all child nodes of Node to be reinitialized,
// if recursive is True then also the grandchildren etc. are reinitialized

var
  Run: PVirtualNode;

begin
  if Assigned(Node) then
    Run := Node.FirstChild
  else
    Run := FRoot.FirstChild;
  while Assigned(Run) do
  begin
    ReinitNode(Run, recursive);
    Run := Run.NextSibling;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.ReinitNode(Node: PVirtualNode; recursive: Boolean);

// forces this node and all its children (if recursive is True) to be initialized again without
// modifying any data in the nodes nor deleting children (unless the application requests a different amount)

var
  Run: PVirtualNode;

begin
  if Assigned(Node) and (Node <> FRoot) then
  begin
    // remove dynamic styles
    Node.States := Node.States - [vsChecking, vsCutOrCopy, vsDeleting];
    InitNode(Node);
  end;

  if recursive then
  begin
    if Assigned(Node) then
      Run := Node.FirstChild
    else
      Run := FRoot.FirstChild;
    while Assigned(Run) do
    begin
      ReinitNode(Run, recursive);
      Run := Run.NextSibling;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.ResetNode(Node: PVirtualNode);

// deletes all children of the given node and marks it as being uninitialized

begin
  if (Node = nil) or (Node = FRoot) then
    Clear
  else
  begin
    DoReset(Node);
    DeleteChildren(Node);
    // remove initialized and other dynamic styles, keep persistent styles
    Node.States := Node.States - [vsInitialized, vsChecking, vsCutOrCopy, vsDeleting, vsHasChildren, vsExpanded];
    InvalidateNode(Node);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SaveToFile(const FileName: TFileName);

// saves the entire content of the tree into a file (see further nodes in SaveToStream)

var
  FileStream: TFileStream;

begin
  FileStream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(FileStream);
  finally
    FileStream.Free;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SaveToStream(Stream: TStream; Node: PVirtualNode = nil);  

// Saves Node and all its children to Stream. If Node is nil then all top level nodes will be stored.
// Note: You should be careful about assuming what is actually saved. The problem here is that we are dealing with
//       virtual data. The tree can so not know what it has to save. The only thing we reliably know is the tree's
//       structure. To be flexible for future enhancements as well as unknown content (unknown to the tree class which
//       is saving/loading the stream) a chunk based approach is used here. Every tree class handles only those
//       chunks which are not handled by an anchestor class and are known by the class.
//
// The base tree class saves only the structure of the tree along with application provided data. Descentants may
// optionally add their own chunks to store additional information. See: WriteChunks.

begin
  Stream.Write(MagicID, SizeOf(MagicID));
  if Node = nil then
  begin
    // save entire tree here
    Node := FRoot.FirstChild;
    while Assigned(Node) do
    begin
      WriteNode(Stream, Node);
      Node := Node.NextSibling;
    end;
  end
  else
    WriteNode(Stream, Node);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.ScrollIntoView(Node: PVirtualNode; Horizontally: Boolean = False): Boolean;

// Scrolls the tree so that the given node is in the client area and returns True if the tree really has been
// scrolled (e.g. to avoid further updates) else returns False. If extened focus is enabled then the tree will also
// be horizontally scrolled if needed.
// Remark: all collapsed parents of the node are expanded.

var
  R: TRect;
  Run: PVirtualNode;
  UseColumns,
  HScrollBarVisible: Boolean;

begin
  Result := False;
  if Assigned(Node) and (Node <> FRoot) then
  begin
    // make sure all parents of the node are expanded
    Run := Node.Parent;
    while Run <> FRoot do
    begin
      if not (vsExpanded in Run.States) then
        ToggleNode(Run);
      Run := Run.Parent;
    end;
    UseColumns := (hoVisible in FHeader.FOptions) and (FHeader.Columns.Count > 0);
    if UseColumns then
      R := GetDisplayRect(Node, FFocusedColumn, True)
    else
      R := GetDisplayRect(Node, -1, True);

    // the returned rectangle can never be empty after the expand code above
    // 1) scroll vertically
    if R.Top < 0 then
    begin
      SetOffsetY(FOffsetY - R.Top);
      Result := True;
    end
    else
      if R.Bottom > ClientHeight then
      begin
        HScrollBarVisible := Integer(FRangeX) > ClientWidth;
        SetOffsetY(FOffsetY - R.Bottom + ClientHeight);
        // When scrolling up and the horizontal scroll appears because of the operation
        // then we have to move up the node the horizontal scrollbar's height too
        // in order to avoid that the scroll bar hides the node which we wanted to have in view.
        if not UseColumns and not HScrollBarVisible and (Integer(FRangeX) > ClientWidth) then
          SetOffsetY(FOffsetY - GetSystemMetrics(SM_CYHSCROLL));
        Result := True;
      end;

    if Horizontally then
    begin
      // 2) scroll horizontally
      if R.Left < 0 then
      begin
        SetOffsetX(FOffsetX - R.Left);
        Result := True;
      end
      else
        if R.Right > ClientWIdth then
        begin
          SetOffsetX(FOffsetX - R.Right + ClientWidth);
          Result := True;
        end;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetFirstChild(Node: PVirtualNode): PVirtualNode;

// returns the first child of the given node 

begin
  if Node = nil then
    Result := FRoot.FirstChild
  else
    if vsHasChildren in Node.States then
    begin
      if Node.ChildCount = 0 then
        InitChildren(Node);
      Result := Node.FirstChild;
    end
    else
      Result := nil;

  if Assigned(Result) and not (vsInitialized in Result.States) then
    InitNode(Result);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetLastChild(Node: PVirtualNode): PVirtualNode;

// Determines the last child (or grand child etc.) of the given node. 
// The resulting node is not guaranteed to be visible.

begin
  if (Node = nil) or (Node = FRoot) then
    Result := FRoot.LastChild
  else
    if vsHasChildren in Node.States then
    begin
      if Node.ChildCount = 0 then
        InitChildren(Node);
      Result := Node.LastChild;
    end
    else
      Result := nil;
    
  // go down the grand children list to find the last child of the last child ...
  while Assigned(Result) do
  begin
    if not (vsInitialized in Result.States) then
      InitNode(Result);
    if (vsHasChildren in Result.States) and (Result.ChildCount = 0) then
      InitChildren(Node);
    if Result.LastChild = nil then
      Break;
    Result := Result.LastChild;
  end;

  if Assigned(Result) and not (vsInitialized in Result.States) then
    InitNode(Result);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetLastChildNoInit(Node: PVirtualNode): PVirtualNode;

// Determines the last initialized child (or grand child etc.) of the given node.

begin
  if (Node = nil) or (Node = FRoot) then
    Result := FRoot.LastChild
  else
    Result := Node;
  if Assigned(Result) then
  begin
    // the given node must be already initialized
    if not (vsInitialized in Result.States) then
      Result := nil
    else
    begin
      // there must be at least one child node attached to the given node or the result is nil
      Result := Result.LastChild;
      // go down the grand children list to find the last child of the last child ...
      while Assigned(Result) do
      begin
        if not (vsInitialized in Result.States) or (Result.LastChild = nil) then
          Break;
        Result := Result.LastChild;
      end;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetLastVisibleChild(Node: PVirtualNode): PVirtualNode;

// Determines the last visible child (or grand child etc.) of the given node.

begin
  if (Node = nil) or (Node = FRoot) then
    Result := FRoot.LastChild
  else
    Result := Node;
  if Assigned(Result) then
  begin
    if not IsVisible[Result] then
      Result := nil
    else
      while Assigned(Result) do
      begin
        if not (vsExpanded in Result.States) or (Result.LastChild = nil) then
          Break;
        Result := Result.LastChild;
      end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.AddChild(Parent: PVirtualNode): PVirtualNode;

// Adds a new node to the given parent node. This is simply done by increasing the child count of the
// parent node. If Parent is nil then the new node is added as (last) top level node.

begin
  if Parent = nil then
    Parent := FRoot;
  SetChildCount(Parent, Parent.ChildCount + 1);
  Result := Parent.LastChild;
  if FUpdateCount = 0 then
  begin
    InvalidateToBottom(Parent);
    UpdateScrollbars(True);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.InsertNode(Node: PVirtualNode; Mode: TVTNodeAttachMode): PVirtualNode;

// Adds a new node relative to Node. The final position is determined by Mode. 

begin
  if Mode <> amNowhere then
  begin
    CancelEditNode;

    if Node = nil then
      Node := FRoot;
    // we need a new node...
    Result := MakeNewNode;
    // avoid erronous attach mode
    if Node = FRoot then
    begin
      case Mode of
        amInsertBefore:
          Mode := amAddChildFirst;
        amInsertAfter:
          Mode := amAddChildLast;
      end;
    end;
    InternalConnectNode(Result, Node, Self, Mode);

    if FUpdateCount = 0 then
    begin
      UpdateScrollbars(True);
      ScrollIntoView(Result);
      if Mode = amInsertBefore then
        InvalidateToBottom(Result)
      else
        InvalidateToBottom(Node);

      // determine correct node for change notification
      if Mode in [amAddChildFirst, amAddChildLast] then
      begin
        if Node = FRoot then
          DoStructureChange(nil)
        else
          DoStructureChange(Node);
      end
      else
        DoStructureChange(Node.Parent);
    end
    else
      Include(FStates, tsStructureChangePending);
  end
  else
    Result := nil;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.CMDrag(var Message: TCMDrag);

var
  S: TObject;
  ShiftState: Integer;
  P: TPoint;
  DropEffect: Integer;

begin
  with Message, DragRec^ do
  begin
    S := Source;
    // let the ancestor handle dock operation
    if S is TDragDockObject then
      inherited
    else
      case DragMessage of
        dmDragEnter, dmDragLeave, dmDragMove:
          begin
            ShiftState := 0;
            // Alt key will be queried by the KeysToShiftState function in DoDragOver
            if GetKeyState(VK_SHIFT) < 0 then
              ShiftState := ShiftState or MK_SHIFT;
            if GetKeyState(VK_CONTROL) < 0 then
              ShiftState := ShiftState or MK_CONTROL;

            // allowed drop effects are simulated for VCL dd
            Result := DROPEFFECT_MOVE or DROPEFFECT_COPY;
            DoDragOver(S, ShiftState, TDragState(DragMessage), Pos, Result);
            FLastVCLDragTarget := FCurrentTargetNode;
            if (DragMessage = dmDragLeave) and Assigned(FCurrentTargetNode) then
            begin
              InvalidateNode(FCurrentTargetNode);
              FCurrentTargetNode := nil;
            end;
          end;
        dmDragDrop:
          begin
            ShiftState := 0;
            // Alt key will be queried by the KeysToShiftState function in DoDragOver
            if GetKeyState(VK_SHIFT) < 0 then
              ShiftState := ShiftState or MK_SHIFT;
            if GetKeyState(VK_CONTROL) < 0 then
              ShiftState := ShiftState or MK_CONTROL;

            // allowed drop effects are simulated for VCL dd
            // replace target node with cached node from other VCL dd messages
            if Assigned(FCurrentTargetNode) then
              InvalidateNode(FCurrentTargetNode);
            FCurrentTargetNode := FLastVCLDragTarget;
            P := Point(Pos.X, Pos.Y);
            P := ScreenToClient(P);
            DropEffect := DROPEFFECT_MOVE or DROPEFFECT_COPY;
            if Assigned(FOnDragDrop) then
              FOnDragDrop(Self, S, nil, [], KeysToShiftState(ShiftState), P, DropEffect, FLastDropMode);
            if Assigned(FCurrentTargetNode) then
            begin
              InvalidateNode(FCurrentTargetNode);
              FCurrentTargetNode := nil;
            end;
          end;
        dmFindTarget:
          begin
            Result := Longint(ControlAtPos(ScreenToClient(Pos), False));
            if Result = 0 then
              Result := Longint(Self);
          end;
      end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.CMHintShow(var Message: TCMHintShow);

// determines hint message (tooltip) and out-of-hint rect
// Note: A special handling is needed here because we cannot pass wide strings back to the caller.
//       I had to introduce the hint data record anyway so we can use this to pass the hint string.
//       We still need to set a dummy hint string in the message to make the VCL showing the hint window.

var
  Node: PVirtualNode;
  NodeRect: TRect;
  SpanColumn,
  Dummy,
  ColLeft,
  ColRight: Integer;
  HitInfo: THitInfo;
  ShowOwnHint: Boolean;

begin
  with Message do
  begin
    Result := 1;
    Include(FStates, tsHintShown);
    if ShowHint and not (Dragging or IsMouseSelecting) and
       ([tsEditPending, tsEditing, tsScrolling] * FStates = []) and (FHeader.States = [])then
    begin
      with HintInfo^ do
      begin
        Result := 0;
        ShowOwnHint := False;
        // assign a dummy string otherwise the VCL will not show the hint window
        HintStr := 'x';
        Node := nil;

        // first check whether there is a header hint to show
        if FHeader.UseColumns and (hoShowHint in FHeader.FOptions) and FHeader.InHeader(CursorPos) then
        begin
          CursorRect := GetHeaderRect;
          HitInfo.HitColumn := FHeader.FColumns.GetColumnAndBounds(CursorPos, CursorRect.Left, CursorRect.Right);
          // Note: the test for the left mouse button in ControlState might cause problems whenever the VCL does not
          //       realize when the button is released. This, for instance, happens when doing OLE drag'n drop and
          //       cancel this with ESC.
          if (HitInfo.HitColumn > -1) and not (csLButtonDown in ControlState) then
          begin
            FHintData.DefaultHint := FHeader.FColumns[HitInfo.HitColumn].FHint;
            if FHintData.DefaultHint <> '' then
              ShowOwnHint := True
            else
              Result := 1;
          end
          else
            Result := 1;
        end
        else
        begin
          // default mode is handled as would the tree be a usual VCL control (no own hint window necessary)
          if FHintMode = hmDefault then
            HintStr := GetShortHint(Hint)
          else
          begin
            // determine node for which to show hint/tooltip
            Node := GetHitTestInfoAt(CursorPos.X, CursorPos.Y, HitInfo);

            if Assigned(Node) then
            begin
              // a draw tree should only display a hint when at least its OnGetHintSize
              // event handler is assigned
              if Self is TCustomVirtualDrawTree then
              begin
                FHintData.HintRect := Rect(0, 0, 0, 0);
                with Self as TCustomVirtualDrawTree do
                  DoGetHintSize(Node, HitInfo.HitColumn, FHintData.HintRect);
                ShowOwnHint := not IsRectEmpty(FHintData.HintRect);
              end
              else
                // for string trees a decision about showing the hint or not is based
                // on the hint string (if it is empty then no hint is shown)
                ShowOwnHint := True;

              if ShowOwnHint then
              begin
                if HitInfo.HitColumn > -1 then
                begin
                  FHeader.FColumns.GetColumnBounds(HitInfo.HitColumn, ColLeft, ColRight);
                  // the right column border might be extended if column spanning is enabled
                  if voAutoSpanColumns in FOptions then
                  begin
                    SpanColumn := HitInfo.HitColumn;
                    repeat
                      Dummy := FHeader.FColumns.GetNextVisibleColumn(SpanColumn);
                      if (Dummy = InvalidColumn) or not ColumnIsEmpty(Node, Dummy) then
                        Break;
                      SpanColumn := Dummy;
                    until False;
                    if SpanColumn <> HitInfo.HitColumn then
                      FHeader.FColumns.GetColumnBounds(SpanColumn, Dummy, ColRight);
                  end;
                  if ClientWidth < ColRight then
                    ColRight := ClientWidth;
                end
                else
                begin
                  ColLeft := FOffsetX;
                  ColRight := ClientWidth;
                end;

                if FHintMode in [hmHint, hmHintAndDefault] then
                begin
                  // node specific hint text
                  FHintData.DefaultHint := DoGetNodeHint(Node, HitInfo.HitColumn);
                  // text for the hint makes only sense for the string tree
                  if (FHintData.DefaultHint = '') and (Self is TCustomVirtualStringTree) then
                    Result := 1
                  else
                  begin
                    CursorRect := GetDisplayRect(Node, HitInfo.HitColumn, False);
                    HintPos := ClientToScreen(Point(CursorPos.X, CursorRect.Bottom));
                  end;
                end
                else
                begin
                  // tool tip to show, this means the caption of the node is to be shown (perhaps)
                  NodeRect := GetDisplayRect(Node, HitInfo.HitColumn, True);
                  // we want the true width of the node (unclipped)
                  NodeRect.Right := NodeRect.Left + DoGetNodeWidth(Node, HitInfo.HitColumn) + FMargin;

                  if (HitInfo.HitColumn > InvalidColumn) and (CursorPos.X <= ColRight) and
                     (CursorPos.X >= NodeRect.Left) and (NodeRect.Right > ColRight) then
                  begin
                    // node specific hint text given will be retrieved when needed
                    FHintData.DefaultHint := '';
                    HintPos := ClientToScreen(Point(NodeRect.Left, NodeRect.Top));
                    CursorRect := NodeRect;
                  end
                  else
                    // nothing to show
                    Result := 1;
                end;
              end
              else
                Result := 1; // avoid hint if this is a draw tree returning an empty hint rectangle
            end
            else
            begin
              // no node so fall back to control's hint (if indicated) or show nothing
              if FHintMode = hmHintAndDefault then
                FHintData.DefaultHint := GetShortHint(Hint)
              else
                Result := 1;
            end;
          end;
        end;

        // set our own hint window class and prepare structure to be passed to the hint window
        if ShowOwnHint and (Result = 0) then
        begin
          Exclude(FStates, tsHintCancelling);
          
          // one pixel up because of single pixel border of the hint window
          Dec(HintPos.y);
          HintWindowClass := TVirtualTreeHintWindow;
          FHintData.Tree := Self;
          FHintData.Column := HitInfo.HitColumn;
          FHintData.Node := Node;
          HintData := @FHintData;
        end
        else
          // reset the internal flag to show that we need to immediately create our own hint window again
          // next time a CM_HINTSHOWPAUSE message is received
          Exclude(FStates, tsHintShown);
      end;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.CMHintShowPause(var Message: TCMHintShowPause);

// Tells the application that the tree (and only the tree) does not want a delayed tool tip.
// Normal hints / header hints use the default delay.

var
  P: TPoint;
  
begin
  // A little workaround is needed here to make the application class using the correct hint window class.
  // Once the application gets ShowHint set to true (which is the case when we want to show hints in the tree) then
  // an internal hint window will be created which is not our own class (because we don't set an application wide
  // hint window class but only one for the tree). Unfortunately, this default hint window class will prevent
  // hints for the non-client area to show up (e.g. for the header) by calling CancelHint whenever certain messages
  // arrive. By setting the hint show pause to 0 if this is the very first time that a hint is shown we make sure
  // that our own hint window class is used because the hint is immediately shown without using the hint timer (in Forms.pas).
  if tsHintShown in FStates then
  begin
    GetCursorPos(P);
    if FHeader.UseColumns and (hoShowHint in FHeader.FOptions) and
       FHeader.InHeader(ScreenToClient(P)) then // leave hint pause as it is
    else
      if FHintMode = hmToolTip then
        Message.Pause^ := 0
  end
  else
    Message.Pause^ := 0;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.CMMouseLeave(var Message: TMessage);

begin
  StopTimer(ScrollTimer);
  FStates := FStates - [tsScrollPending, tsScrolling];
  if Assigned(FCurrentHotNode) then
  begin
    DoHotChange(FCurrentHotNode, nil);
    InvalidateNode(FCurrentHotNode);
    FCurrentHotNode := nil;
  end;
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.CMMouseWheel(var Message: TCMMouseWheel);

var
  ScrollCount: Integer;
  P: TPoint;

begin
  inherited;
  if (Message.Result = 0) and (Message.ShiftState = []) then
  begin
    with Message do
    begin
      Result := 1;
      if FRangeY > Cardinal(ClientHeight) then
      begin
        // scroll vertical if there's something to scroll...
        if ssCtrl in ShiftState then
          ScrollCount := WheelDelta div WHEEL_DELTA * (ClientHeight div Integer(FDefaultNodeHeight))
        else
          ScrollCount := WheelDelta div WHEEL_DELTA;
        SetOffsetY(FOffsetY + ScrollCount * Integer(FDefaultNodeHeight));
      end
      else
      begin
        // ...else scroll horizontally
        if ssCtrl in ShiftState then
          ScrollCount := WheelDelta div WHEEL_DELTA * ClientWidth
        else
          ScrollCount := WheelDelta div WHEEL_DELTA;
        SetOffsetX(FOffsetX + ScrollCount * Integer(FIndent));
      end;
    end;

    // finally update "hot" node if hot tracking is activated
    if voHotTrack in FOptions then
    begin
      P := ScreenToClient(SmallPointToPoint(Message.Pos));
      if PtInRect(ClientRect, P) then
        HandleHotTrack(P.X, P.Y);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.CreateWnd;

// initializes data which depends on a valid window handle

begin
  inherited;
  // scrollbar initialization
  InitializeFlatSB(Handle);
  FlatSB_SetScrollProp(Handle, WSB_PROP_HSTYLE, ScrollBarProp[FScrollBarOptions.ScrollBarStyle], False);
  FlatSB_SetScrollProp(Handle, WSB_PROP_VSTYLE, ScrollBarProp[FScrollBarOptions.ScrollBarStyle], False);
  FlatSB_ShowScrollBar(Handle, SB_VERT, FScrollBarOptions.ScrollBars in [ssVertical, ssBoth]);
  FlatSB_ShowScrollBar(Handle, SB_HORZ, FScrollBarOptions.ScrollBars in [ssHorizontal, ssBoth]);
  UpdateScrollBars(True);
  if FPlusBM.Empty then
    PrepareBitmaps;

  // finally register tree as OLE drop target
  if not (csDesigning in ComponentState) then
  begin
    // OLE drag'n drop preparation (this is also used for clipboard operations, so create it always)
    FDragManager := TVTDragDropManager.Create(Self);
    FDragManager.SetOLEFormats(FOLEFormats);
    // Explicitly increment reference count to keep this manager alive. This is necessary because the manager is
    // also used in clipboard operations.
    FDragManager._AddRef;

    // registration will actually set the reference count to 1
    if voAcceptOLEDrop in FOptions then
      RegisterDragDrop(Handle, FDragManager{ as IDropTarget});
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMHScroll(var Message: TWMVScroll);

begin
  case Message.ScrollCode of
    SB_BOTTOM:
      SetOffsetX(FRangeX);
    SB_ENDSCROLL:
      begin
        Exclude(FStates, tsThumbTracking);
        // avoiding to adjust the vertical scroll position while tracking makes it much smoother
        // but we need to adjust the final position here then
        UpdateHorizontalScrollBar(False);
      end;
    SB_LINELEFT:
      SetOffsetX(FOffsetX + Integer(FIndent));
    SB_LINERIGHT:
      SetOffsetX(FOffsetX - Integer(FIndent));
    SB_PAGELEFT:
      SetOffsetX(FOffsetX + ClientWidth);
    SB_PAGERIGHT:
      SetOffsetX(FOffsetX - ClientWidth);
    SB_THUMBPOSITION,
    SB_THUMBTRACK:
      begin
        Include(FStates, tsThumbTracking);
        SetOffsetX(-Word(Message.Pos));
      end;
    SB_TOP:
      SetOffsetX(0);
  end;

  Message.Result := 0;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMTimer(var Message: TWMTimer);

// centralized timer handling happens here

begin
  with Message do
  begin
    case TimerID of
      ExpandTimer:
        DoDragExpand;
      EditTimer:
        DoEdit;
      ScrollTimer:
        begin
          if tsScrollPending in FStates then
          begin
            Application.CancelHint;
            // scroll delay has elapsed, set to normal scroll interval now
            SetTimer(Handle, ScrollTimer, FAutoScrollInterval, nil);
            FStates := FStates - [tsScrollPending] + [tsScrolling];

            // remove drag image to avoid paint problems
            if Assigned(FDragManager.DragSource) then
              FDragManager.DragSource.FDragManager.HideDragImage;
          end;
          DoTimerScroll;
        end;
      ChangeTimer:
        begin
          Change(FLastChangedNode);
          Exclude(FStates, tsChangePending);
        end;
      StructureChangeTimer:
        StructureChange(FLastChangedNode);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMVScroll(var Message: TWMVScroll);

  //--------------- local functions -------------------------------------------

  function GetRealScrollPosition: Integer;

  var
    SI: TScrollInfo;
    Code: Integer;

  begin
    SI.cbSize := SizeOf(TScrollInfo);
    SI.fMask := SIF_TRACKPOS;
    Code := SB_VERT;
    Result := Message.Pos;
    if FlatSB_GetScrollInfo(Handle, Code, SI) then
      Result := SI.nTrackPos;
  end;

  //--------------- end local functions ---------------------------------------

begin
  case Message.ScrollCode of
    SB_BOTTOM:
      SetOffsetY(-FRoot.TotalHeight);
    SB_ENDSCROLL:
      begin
        Exclude(FStates, tsThumbTracking);
        // avoiding to adjust the horizontal scroll position while tracking makes scrolling much smoother
        // but we need to adjust the final position here then
        UpdateScrollBars(True);
        // really weird invalidation needed here (and I do it only because it happens so rarely), because
        // when showing the horizontal scrollbar while scrolling down using the down arrow button,
        // the button will be repainted on mouse up (on the wrong place in the far right lower corner)... 
        RedrawWindow(Handle, nil, 0, RDW_FRAME or RDW_INVALIDATE or RDW_NOERASE or RDW_NOCHILDREN);
      end;
    SB_LINEUP:
      SetOffsetY(FOffsetY + Integer(FDefaultNodeHeight));
    SB_LINEDOWN:
      SetOffsetY(FOffsetY - Integer(FDefaultNodeHeight));
    SB_PAGEUP:
      SetOffsetY(FOffsetY + ClientHeight);
    SB_PAGEDOWN:
      SetOffsetY(FOffsetY - ClientHeight);

    SB_THUMBPOSITION,
    SB_THUMBTRACK:
      begin
        Include(FStates, tsThumbTracking);
        SetOffsetY(-GetRealScrollPosition);
      end;
    SB_TOP:
      SetOffsetY(0);
  end;
  Message.Result := 0;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.WMSize(var Message: TWMSize);

begin
  inherited;

  // Need to update scroll bars here. This will cause a recursion because of the change of the client area
  // when changing a scrollbar. Usually this is no problem since with the second level recursion no change of the
  // window size happens (the same values for the scrollbars are set, which shouldn't cause a window size change).
  // Appearently, this applies not to all systems (ComCtrl DLL devil again?).
  if not (csLoading in ComponentState) and not (tsSizing in FStates) then
  try
    Include(FStates, tsSizing);
    UpdateScrollBars(True);
    PrepareBitmaps;
  finally
    Exclude(FStates, tsSizing);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetNodeData(Node: PVirtualNode): Pointer;

// returns the address of the user defined data area in the node

begin
  // make sure FNodeDataSize is valid
  if FNodeDataSize = -1 then
    ValidateNodeDataSize(FNodeDataSize);

  if (FNodeDataSize <= 0) or (Node = nil) or (Node = FRoot) then
    Result := nil
  else
    Result := PChar(@Node.Data) + InternalDataSize;
end;

//----------------------------------------------------------------------------------------------------------------------

type
  // needed to handle OLE global memory objects  
  TOLEMemoryStream = class(TCustomMemoryStream)
  public
    function Write(const Buffer; Count: Longint): Longint; override;
  end;

//----------------------------------------------------------------------------------------------------------------------

function TOLEMemoryStream.Write(const Buffer; Count: Longint): Longint;

begin
  {$ifdef DFS_COMPILER_5_UP}
    raise EStreamError.CreateRes(@SCantWriteResourceStreamError);
  {$else}
    raise EStreamError.Create(SCantWriteResourceStreamError);
  {$endif}
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.PasteFromClipboard: Boolean;

// read what is currently on the clipboard into the tree (if the format is supported)
// Note: If the application wants to have text or special formats to be inserted then it must implement
//       its own code (OLE). Here only the native tree format is accepted.

var
  Data: IDataObject;
  Source: TBaseVirtualTree;

begin
  Result := False;
  Source := nil;
  if OleGetClipboard(Data) <> S_OK then
    ShowError(SClipboardFailed)
  else
  try
    // try to get the source tree of the operation, can use the same mechanism as for drag'n drop
    Source := FDragManager.GetDataSourceTree(Data);
    if Assigned(Source) then
      Include(Source.FStates, tsClipboardOperation);
    Result := ProcessOLEData(Source, Data, FFocusedNode, FDefaultPasteMode,
                             Assigned(Source) and (tsCutPending in Source.FStates));
    if Assigned(Source) and (tsCutPending in Source.FStates) then
      Source.FinishCutOrCopy;
  finally
    // release interface before clipboard operation is finished because the release code of
    // this interface checks for this state
    Data := nil;
    if Assigned(Source) then
      Exclude(Source.FStates, tsClipboardOperation);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.ProcessDrop(DataObject: IDataObject; TargetNode: PVirtualNode; var Effect: Integer;
  Mode: TVTNodeAttachMode): Boolean;

// Recreates the (sub) tree structure serialized into memory and provided by DataObject. The new nodes are attached to
// the passed node or FRoot if TargetNode is nil.
// Returns True on success, i.e. the CF_VIRTUALTREE format is supported by the data object and the structure could be
// recreated, otherwise False.

var
  Source: TBaseVirtualTree;

begin
  Result := False;
  if Mode = amNowhere then
    Effect := DROPEFFECT_NONE
  else
  begin
    BeginUpdate;
    // try to get the source tree of the operation
    Source := FDragManager.GetDataSourceTree(DataObject);
    if Assigned(Source) then
      Source.BeginUpdate;
    try
      try
        // before adding the new nodes try to optimize the operation if source and target tree reside in
        // the same application and operation is a move
        if ((Effect and DROPEFFECT_MOVE) <> 0) and Assigned(Source) then
        begin
          // if both copy and move are specified then prefer a copy because this is not destructing
          Result := ProcessOLEData(Source, DataObject, TargetNode, Mode, (Effect and DROPEFFECT_COPY) = 0);
          // since we made an optimized move or a copy there's no reason to act further after DoDragging returns
          Effect := DROPEFFECT_NONE;
        end
        else
          // act only if move or copy operation is requested
          if (Effect and (DROPEFFECT_MOVE or DROPEFFECT_COPY)) <> 0 then
            Result := ProcessOLEData(Source, DataObject, TargetNode, Mode, False)
          else
            Result := False;
      except
        Effect := DROPEFFECT_NONE;
      end;
    finally
      if Assigned(Source) then
        Source.EndUpdate;
      EndUpdate;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.ProcessOLEData(Source: TBaseVirtualTree; DataObject: IDataObject; TargetNode: PVirtualNode;
  Mode: TVTNodeAttachMode; Optimized: Boolean): Boolean;

// Recreates the (sub) tree structure serialized into memory and provided by DataObject. The new nodes are attached to
// the passed node or FRoot if TargetNode is nil according to Mode. Optimized can be set to True if the entire operation
// happens within the same process (i.e. sender and receiver of the OLE operation are located in the same process).
// Optimize = True makes only sense if the operation to carry out is a move hence it is also the indication of
// operation to be done here. Source is the source of the OLE data and only of use (and usually assigned) when
// an OLE operation takes place in the same application.
// Returns True on success, i.e. the CF_VIRTUALTREE format is supported by the data object and the structure could be
// recreated, otherwise False.

var
  Medium: TStgMedium;
  Stream: TOLEMemoryStream;
  Data: Pointer;
  Node: PVirtualNode;
  Nodes: TNodeArray;
  I: Integer;
  Res: HRESULT;

begin
  Nodes := nil;
  // check the data format available by the data object
  with StandardOLEFormat do
  begin
    // read best format
    cfFormat := CF_VIRTUALTREE;
  end;
  Result := DataObject.QueryGetData(StandardOLEFormat) = S_OK;
  if Result then
  begin
    BeginUpdate;
    Result := False;
    try
      // Optimized means source is known and in the same process so we can access its pointers, which avoids duplicating
      // the data while doing a serialization. Can only be used with cut'n paste and drag'n drop with move effect.
      if Optimized then
      begin                           
        Nodes := Source.GetSortedCutCopySet(True);
        if TargetNode = nil then
          TargetNode := FRoot;
        for I := High(Nodes) downto 0 do
          if not HasAsParent(TargetNode, Nodes[I]) then
            Source.MoveTo(Nodes[I], TargetNode, Mode, False);
        Result := True;
      end
      else
      begin
        // remove old selection if source is a VT
        if Assigned(Source) then
          Source.ClearSelection;
        Res := DataObject.GetData(StandardOLEFormat, Medium);
        if Res = S_OK then
        begin
          Data := GlobalLock(Medium.hGlobal);
          if Assigned(Data) then
          begin
            I := PCardinal(Data)^;
            Inc(PCardinal(Data));
            Stream := TOLEMemoryStream.Create;
            Stream.SetPointer(Data, I);
            try
              while Stream.Position < Stream.Size do
              begin
                Node := InsertNode(TargetNode, Mode);
                InternalAddFromStream(Stream, Node);
                // This seems a bit strange because of the callback for granting to add the node
                // which actually comes after the node has been added. The reason is that the node must
                // contain valid data otherwise I don't see how the application can make a funded decision.
                if not DoNodeCopying(Node) then
                  DeleteNode(Node)
                else
                  DoNodeCopied(Node);
              end;
              Result := True;
            finally
              Stream.Free;
              GlobalUnlock(Medium.hGlobal);
            end;
          end;
          ReleaseStgMedium(Medium);
        end;
      end;
    finally
      EndUpdate;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.RepaintNode(Node: PVirtualNode);

// causes an immediate repaint of the given node

var
  R: Trect;

begin
  if Assigned(Node) and (Node <> FRoot) then
  begin
    R := GetDisplayRect(Node, -1);
    RedrawWindow(Handle, @R, 0, RDW_INVALIDATE or RDW_UPDATENOW or RDW_NOERASE or RDW_VALIDATE or RDW_NOCHILDREN);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.InvertSelection(VisibleOnly: Boolean);

// Inverts the current selection (so nodes which are selected become unselected and vice versa).
// If VisibleOnly is True then only visble nodes are considered (that is, nodes of which all their parents are expanded).

var
  Run: PVirtualNode;
  NewSize: Integer;
  NextFunction: function(Node: PVirtualNode): PVirtualNode of object;
  TriggerChange: Boolean;

begin
  if voMultiSelect in FOptions then
  begin
    Run := FRoot.FirstChild;
    ClearTempCache;
    if VisibleOnly then
      NextFunction := GetNextVisible
    else
      NextFunction := GetNextNoInit;
    while Assigned(Run) do
    begin
      if vsSelected in Run.States then
        InternalRemoveFromSelection(Run)
      else
        InternallyCacheNode(Run);
      Run := NextFunction(Run);
    end;

    // do some housekeeping
    // need to trigger the OnChange event from here if nodes were only deleted but not added
    TriggerChange := False;
    NewSize := PackArray(FSelection, FSelectionCount);
    if NewSize > -1 then
    begin
      FSelectionCount := NewSize;
      SetLength(FSelection, FSelectionCount);
      TriggerChange := True;
    end;
    if FTempNodeCount > 0 then
    begin
      AddToSelection(FTempNodeCache, FTempNodeCount, True);
      ClearTempCache;
      TriggerChange := False;
    end;
    Invalidate;
    if TriggerChange then
      DoChange(nil);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.IsEditing: Boolean;

begin
  Result := tsEditing in FStates;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.IsMouseSelecting: Boolean;

begin
  Result := (tsDrawSelPending in FStates) or (tsDrawSelecting in FStates);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.InternalRemoveFromSelection(Node: PVirtualNode);

// Special version to remove a node from the current selection. PackArray must
// be used to remove finally those entries.

var
  Index: Integer;

begin
  // Because pointers are always DWORD aligned we can simply increment all those
  // which we want to have removed (see also PackArray) and still have the
  // order in the list preserved.
  if FindNodeInSelection(Node, Index) then
  begin
    Exclude(Node.States, vsSelected);
    Inc(Cardinal(FSelection[Index]));
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.HandleDrawSelection(X, Y: Integer): Boolean;

// handles multi-selection with a focus rectangle
// This method must only be entered if at least one node is in the tree!
// Result is True if something changed in selection.

var
  Run: PVirtualNode;
  NodeLeft,
  ActualLeft,
  NodeRight,
  CheckOffset,
  ImageOffset,
  StateImageOffset: Integer;
  OldRect,
  NewRect: TRect;
  MinY,
  MaxY,
  CurrentTop,
  MainColumn: Integer;
  DoSwitch,
  WithCheck,
  WithImages,
  WithStateImages,
  IsInOldRect,
  IsInNewRect: Boolean;
  MaxValue,
  MaxRight: Integer;

begin
  Result := False;

  // Selection changes are only done if the user drew a selection rectangle large
  // enough to exceed the threshold.
  if (FRoot.TotalCount > 0) and (tsDrawSelecting in FStates) then
  begin
    // effective handling of node selection is done by using two rectangles stored in FSelectRec
    OldRect := OrderRect(FLastSelRect);
    NewRect := OrderRect(FNewSelRect);
    MinY := OldRect.Top;
    if NewRect.Top < OldRect.Top then
      MinY := NewRect.Top;
    MaxY := OldRect.Bottom;
    if NewRect.Bottom > OldRect.Bottom then
      MaxY := NewRect.Bottom;
    DoSwitch := ssCtrl in FDrawSelShiftState;
    WithCheck := voCheckSupport in FOptions;
    // don't check the events here as descentant trees might have overriden
    // the DoGetImageIndex method
    WithImages := Assigned(FImages);
    if WithImages then
      ImageOffset := FImages.Width + 2
    else
      ImageOffset := 0;
    WithStateImages := Assigned(FStateImages);
    if WithStateImages then
      StateImageOffset := FStateImages.Width + 2
    else
      StateImageOffset := 0;

    // node to start at
    Run := GetNodeAt(0, MinY + FOffsetY);
    CurrentTop := FLastNodeTop - FOffsetY;
    ClearTempCache;
    CheckOffset := FCheckImages.Width + 2;

    if Assigned(Run) then
    begin
      // initial left border of first node (take column reordering into account)
      if FHeader.UseColumns then
      begin
        // the mouse coordinates don't include any horizontal scrolling hence take this also
        // out from the returned column position
        NodeLeft := FHeader.FColumns[0].Left - FOffsetX;
        MaxRight := NodeLeft + FHeader.FColumns[0].Width;
      end
      else
      begin
        NodeLeft := 0;
        MaxRight := MaxInt;
      end;
      MainColumn := FHeader.MainColumn;

      if voShowRoot in FOptions then
        Inc(NodeLeft, (GetNodeLevel(Run) + 1) * FIndent)
      else
        Inc(NodeLeft, GetNodeLevel(Run) * FIndent);

      // Change selection depending on the node's rectangle being in the selection rect or not, but
      // touch only those nodes which overlap either the old selection rectangle or the new one but not
      // both.
      repeat
        // collect offsets for check, normal and state images
        ActualLeft := NodeLeft;
        if WithCheck and (Run.CheckType <> ctNone) then
          Inc(ActualLeft, CheckOffset);
        if WithImages and (DoGetImageIndex(Run, ikNormal, -1) > -1) then
          Inc(ActualLeft, ImageOffset);
        if WithStateImages and (DoGetImageIndex(Run, ikState, -1) > -1) then
          Inc(ActualLeft, StateImageOffset);

        // check if we need the node's width
        if (ActualLeft < OldRect.Left) or (ActualLeft < NewRect.Left) then
        begin
          NodeRight := ActualLeft + DoGetNodeWidth(Run, MainColumn);
          if NodeRight > MaxRight then
            NodeRight := MaxRight;
        end
        else
          NodeRight := 0;

        // now determine whether we need to change the state
        IsInOldRect := (ActualLeft < OldRect.Right) and (CurrentTop + Integer(Run.NodeHeight) > OldRect.Top) and
                       (CurrentTop < OldRect.Bottom) and ((ActualLeft >= OldRect.Left) or (NodeRight >= OldRect.Left));
        IsInNewRect := (ActualLeft < NewRect.Right) and (CurrentTop + Integer(Run.NodeHeight) > NewRect.Top) and
                       (CurrentTop < NewRect.Bottom) and
                       ((ActualLeft >= NewRect.Left) or (NodeRight >= NewRect.Left));
        if IsInOldRect xor IsInNewRect then
        begin
          Result := True;
          if DoSwitch then
          begin
            if vsSelected in Run.States then
              InternalRemoveFromSelection(Run)
            else
              InternallyCacheNode(Run);
          end
          else
          begin
            if IsInNewRect then
              InternallyCacheNode(Run)
            else
              InternalRemoveFromSelection(Run);
          end;
        end;

        Inc(CurrentTop, Run.NodeHeight);
        // get next visible node and update left node position
        if (vsExpanded in Run.States) and (Run.ChildCount > 0) then
        begin
          Run := Run.FirstChild;
          Inc(NodeLeft, FIndent);
        end
        else
          if Assigned(Run.NextSibling) then
            Run := Run.NextSibling
          else
          begin
            // no child and no further sibling, so go up parent by parent until root is reached
            // or a node is found which has another sibling
            repeat
              Run := Run.Parent;
              Dec(NodeLeft, FIndent);
            until (Run = FRoot) or Assigned(Run.NextSibling);
            if Run = FRoot then
              Break
            else
              Run := Run.NextSibling;
          end;
      until CurrentTop > MaxY;
    end;

    if Result then
    begin
      // do some housekeeping if there was a change
      MaxValue := PackArray(FSelection, FSelectionCount);
      if MaxValue > -1 then
      begin
        FSelectionCount := MaxValue;
        SetLength(FSelection, FSelectionCount);
      end;
      if FTempNodeCount > 0 then
      begin
        AddToSelection(FTempNodeCache, FTempNodeCount);
        ClearTempCache;
      end;
        
      if FUpdateCount = 0 then
        DoChange(nil);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoHeaderClick(Column: Integer);

begin
  if Assigned(FOnHeaderClick) then
    FOnHeaderClick(Self, Column);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoHeaderDragged(Column: Integer);

begin
  if Assigned(FOnHeaderDragged) then
    FOnHeaderDragged(Self, Column);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.DoHeaderDragging(Column: Integer): Boolean;

begin
  Result := True;
  if Assigned(FOnHeaderDragging) then
    FOnHeaderDragging(Self, Column, Result);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoHotChange(Old, New: PVirtualNode);

begin
  if Assigned(FOnHotChange) then
    FOnHotChange(Self, Old, New);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.ReadChunk(Stream: TStream; Node: PVirtualNode; ChunkType, ChunkSize: Integer): Boolean;

// Called while loading a tree structure, Node is already valid at this point.
// The function handles the base and user chunks, any other chunk is marked as being unknown and skipped.
// Descentants may handle them by overriding this method.
// Returns True if the chunk could be handled, otherwise False.

var
  ChunkBody: TBaseChunkBody;
  Run: PVirtualNode;
  LastPosition: Integer;

begin
  case ChunkType of
    BaseChunk:
      begin
        // load base chunk's body (chunk header has already been consumed))
        Stream.Read(ChunkBody, SizeOf(ChunkBody));
        with Node^ do
        begin
          NodeHeight := ChunkBody.NodeHeight;
          States := ChunkBody.States;
          Align := ChunkBody.Align;
          CheckState := ChunkBody.CheckState;
          CheckType := ChunkBody.CheckType;

          // adjust total height but only if there aren't already child nodes
          if ChildCount = 0 then
            if Node = FRoot then
              TotalHeight := FDefaultNodeHeight
            else
              TotalHeight := NodeHeight;

          // create and read child nodes if necessary
          if ChunkBody.ChildCount > 0 then
          begin
            while ChunkBody.ChildCount > 0 do
            begin
              Run := MakeNewNode;
              InternalConnectNode(Run, Node, Self, amAddChildLast);
              ReadNode(Stream, Run);
              Dec(ChunkBody.ChildCount);
            end;
          end;
        end;
        Result := True;
      end;
    UserChunk:
      if ChunkSize > 0 then
      begin
        // need to know whether the data was read
        LastPosition := Stream.Position;
        DoLoadUserData(Node, Stream);
        // compare stream position to learn whether the data was read
        Result := Stream.Position > LastPosition;
        // seek to end for not handled user data (do this also if the handler read more data
        // than it is allowed)
        if not Result or (Stream.Position <> (LastPosition + ChunkSize)) then
          Stream.Position := LastPosition + ChunkSize;
      end
      else
        Result := True;
  else
    // unknown chunk, skip it 
    Stream.Position := Stream.Position + ChunkSize;
    Result := False;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetMaxRightExtend: Cardinal;

// Determines the maximum with of the currently visible part of the tree, depending on the length
// of the node texts. This method is used for determining the horizontal scroll range or the width
// of the drag image.

var
  Node: PVirtualNode;
  TopPosition: Integer;
  NodeLeft,
  CurrentWidth: Cardinal;
  WithCheck: Boolean;
  CheckOffset: Integer;
  
begin
  Node := GetNodeAt(0, 0);
  Result := 0;
  TopPosition := FLastNodeTop; // set by GetNodeAt
  if voShowRoot in FOptions then
    NodeLeft := (GetNodeLevel(Node) + 1) * FIndent
  else
    NodeLeft := GetNodeLevel(Node) * FIndent;
    
  if Assigned(FStateImages) then
    Inc(NodeLeft, FStateImages.Width + 2);
  if Assigned(FImages) then
    Inc(NodeLeft, FImages.Width + 2);
  WithCheck := voCheckSupport in FOptions;
  CheckOffset := FCheckImages.Width + 2;

  while Assigned(Node) do
  begin
    if not (vsInitialized in Node.States) then
      InitNode(Node);

    if WithCheck and (Node.CheckType <> ctNone) then
      Inc(NodeLeft, CheckOffset);
    CurrentWidth := DoGetNodeWidth(Node, -1);
    if Result < (NodeLeft + CurrentWidth) then
      Result := NodeLeft + CurrentWidth;
    Inc(TopPosition, Node.NodeHeight);
    if TopPosition > Height then
      Break;

    if WithCheck and (Node.CheckType <> ctNone) then
      Dec(NodeLeft, CheckOffset);

    // get next visible node and update left node position
    if (vsExpanded in Node.States) and (Node.ChildCount > 0) then
    begin
      Node := Node.FirstChild;
      Inc(NodeLeft, FIndent);
    end
    else
      if Assigned(Node.NextSibling) then
        Node := Node.NextSibling
      else
      begin
        // no child and no further sibling, so go up parent by parent until root is reached
        // or a node is found which has another sibling
        repeat
          Node := Node.Parent;
          if (Node = FRoot) or Assigned(Node.NextSibling) then
            Break;
          Dec(NodeLeft, FIndent);
        until False;
        if Node = FRoot then
          Break
        else
          Node := Node.NextSibling;
      end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.GetTextInfo(Node: PVirtualNode; Column: Integer; const AFont: TFont; var R: TRect;
  var Text: WideString);

// generic base method for editors, hint windows etc. to get some info about a node

begin
  R := Rect(0, 0, 0, 0);
  Text := '';
  AFont.Assign(Font);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.HandleHotTrack(X, Y: Integer);

// updates the current "hot" node

var
  Node: PVirtualNode;
  HitInfo: THitInfo;

begin
  // get information about the hit
  Node := GetHitTestInfoAt(X, Y, HitInfo);
  // only make the new node being "hot" if its label is hit or full row selection is enabled
  if not ((hiOnItemLabel in HitInfo.HitPosition) or (voFullRowSelect in FOptions)) then
    Node := nil;
  if (Node <> FCurrentHotNode)  then
  begin
    DoHotChange(FCurrentHotNode, Node);
    if Assigned(FCurrentHotNode) then
      InvalidateNode(FCurrentHotNode);
    FCurrentHotNode := Node;
    if Assigned(FCurrentHotNode) then
      InvalidateNode(FCurrentHotNode);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.MarkCutCopyNodes;

// Sets the vsCutOrCopy style in every currently selected but not disabled node to indicate it is
// now part of a clipboard operation.

var
  Nodes: TNodeArray;
  I: Integer;

begin
  Nodes := nil;
  if FSelectionCount > 0 then
  begin
    // need the current selection sorted to exclude selected nodes which are children, grandchildren etc. of
    // already selected nodes 
    Nodes := GetSortedSelection(False);
    for I := 0 to High(Nodes) do
      with Nodes[I]^ do
        if not (vsDisabled in States) then
          Include(States, vsCutOrCopy);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.MouseMove(Shift: TShiftState; X, Y: Integer);

var
  R: TRect;
  
begin
  // remove current selection in case the user clicked somewhere in the window (but not a node)
  // and moved the mouse
  if tsDrawSelPending in FStates then
  begin
    if CalculateSelectionRect(X, Y) then
    begin
      InvalidateRect(Handle, @FNewSelRect, False);
      UpdateWindow(Handle);
      if (Abs(FNewSelRect.Right - FNewSelRect.Left) > Mouse.DragThreshold) or
         (Abs(FNewSelRect.Bottom - FNewSelRect.Top) > Mouse.DragThreshold) then
      begin
        if (tsClearPending in FStates) then
        begin
          Exclude(FStates, tsClearPending);
          ClearSelection;
        end;
        FStates := FStates - [tsDrawSelPending] + [tsDrawSelecting];
        // reset to main column for multiselection
        FocusedColumn := FHeader.MainColumn;
      end;
    end;
  end
  else
  begin
    // really start dragging if the mouse has been moved more than the threshold
    if (tsDragPending in FStates) and ((Abs(FDragStartPos.X - X) >= FDragThreshold) or
       (Abs(FDragStartPos.Y - Y) >= FDragThreshold)) then
      DoDragging(FDragStartPos)
    else
    begin
      if not IsMouseSelecting then
      begin
        if voHotTrack in FOptions then
          HandleHotTrack(X, Y);
        inherited MouseMove(Shift, X, Y);
      end
      else
      begin
        if voAutoScroll in FOptions then
          DoAutoScroll(X, Y);

        // handle draw selection if reqired
        if CalculateSelectionRect(X, Y) then
        begin
          // if something in the selection changed then invalidate the entire
          // tree instead trying to figure out the display rects of all change nodes.
          if HandleDrawSelection(X, Y) then
            InvalidateRect(Handle, nil, False)
          else
          begin
            UnionRect(R, OrderRect(FNewSelRect), OrderRect(FLastSelRect));
            OffsetRect(R, FOffsetX, FOffsetY);
            InvalidateRect(Handle, @R, False);
          end;
          UpdateWindow(Handle);
        end;
      end;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoAfterItemErase(Canvas: TCanvas; Node: PVirtualNode; ItemRect: TRect);

begin
  if Assigned(FOnAfterItemErase) then
    FOnAfterItemErase(Self, Canvas, Node, ItemRect);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoAfterItemPaint(Canvas: TCanvas; Node: PVirtualNode; ItemRect: TRect);

begin
  if Assigned(FOnAfterItemPaint) then
    FOnAfterItemPaint(Self, Canvas, Node, ItemRect);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoAfterPaint(Canvas: TCanvas);

begin
  if Assigned(FOnAfterPaint) then
    FOnAfterPaint(Self, Canvas);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoAutoScroll(X, Y: Integer);

begin
  FScrollDirection := [];

  if (X < Integer(FDefaultNodeHeight div 2)) and (FOffsetX <> 0) then
    Include(FScrollDirection, sdLeft);
  if (ClientWidth - FOffsetX < Integer(FRangeX)) and (X > ClientWidth - Integer(FDefaultNodeHeight div 2)) then
    Include(FScrollDirection, sdRight);

  if (Y < Integer(FDefaultNodeHeight) div 2) and (FOffsetY <> 0) then
    Include(FScrollDirection, sdUp);
  if (ClientHeight - FOffsetY < Integer(FRangeY)) and (Y > ClientHeight - Integer(FDefaultNodeHeight) div 2) then
    Include(FScrollDirection, sdDown);

  if FScrollDirection = [] then
  begin
    if (FStates * [tsScrollPending, tsScrolling]) <> [] then
    begin
      StopTimer(ScrollTimer);
      FStates := FStates - [tsScrollPending, tsScrolling];

      // reshow drag image in case we are dragging
      if Assigned(FDragManager.DragSource) then
        FDragManager.DragSource.FDragManager.ShowDragImage;
    end;
  end
  else
  begin
    // start auto scroll if not yet done
    if (FStates * [tsScrollPending, tsScrolling]) = [] then
    begin
      Include(FStates, tsScrollPending);
      SetTimer(Handle, ScrollTimer, FAutoScrollDelay, nil);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoTimerScroll;

var
  ScrollFactor: Integer;
  P: TPoint;
  InRect: Boolean;
  R: TRect;

begin
  GetCursorPos(P);
  R := ClientRect;
  MapWindowPoints(Handle, 0, R, 2);
  InRect := PtInRect(R, P);

  if IsMouseSelecting or InRect then
  begin
    if sdUp in FScrollDirection then
    begin
      if InRect then
        ScrollFactor := 1
      else
        ScrollFactor := R.Top - P.Y;
      if FOffsetY = 0 then
        Exclude(FScrollDirection, sdUp)
      else
        SetOffsetY(FOffsetY + ScrollFactor * FIncrementY);
    end;

    if sdDown in FScrollDirection then
    begin
      if InRect then
        ScrollFactor := 1
      else
        ScrollFactor := P.Y - R.Bottom;
      if (ClientHeight - FOffsetY) = Integer(FRangeY) then
        Exclude(FScrollDirection, sdDown)
      else
        SetOffsetY(FOffsetY - ScrollFactor * FIncrementY);
    end;

    if sdLeft in FScrollDirection then
    begin
      if InRect then
        ScrollFactor := 1
      else
        ScrollFactor := R.Left - P.X;
      if FOffsetX = 0 then
        Exclude(FScrollDirection, sdleft)
      else
        SetOffsetX(FOffsetX + ScrollFactor * FIncrementX);
    end;

    if sdRight in FScrollDirection then
    begin
      if InRect then
        ScrollFactor := 1
      else
        ScrollFactor := P.X - R.Right;

      if (ClientWidth - FOffsetX) = Integer(FRangeX) then
        Exclude(FScrollDirection, sdRight)
      else
        SetOffsetX(FOffsetX - ScrollFactor * FIncrementX);
    end;

    if IsMouseSelecting then
    begin
      P := ScreenToClient(P);
      if CalculateSelectionRect(P.X, P.Y) then
      begin
        HandleDrawSelection(P.X, P.Y);
        UpdateWindow(Handle);
      end;
    end;

    if FScrollDirection = [] then
    begin
      StopTimer(ScrollTimer);
      FStates := FStates - [tsScrollPending, tsScrolling];
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.IterateSubtree(Node: PVirtualNode; Callback: TVTGetNodeProc; Data: Pointer; SelectedOnly,
  DoInit: Boolean): PVirtualNode;

// Iterates through the all children and grandchildren etc. of Node (or the entire tree if Node = nil or Node = FRoot)
// and calls for each node the provided callback method (which must not be empty).
// If SelectedOnly is True then only selected nodes are iterated. If DoInit is True then nodes which aren't initialized
// yet will be initialized and returned otherwise they are ignored.
// Note: During execution of the callback the application can set Abort to True. In this case the iteration is stopped
//       and the last accessed node (the one on which the callback set Abort to True) is returned to the caller.
//       Otherwise (no abort) nil is always returned.

var
  Stop: PVirtualNode;
  Abort: Boolean;

begin
  if Node = nil then
    Node := FRoot;
  Abort := False;
  if SelectedOnly then
  begin
    // skip to next node if we start with the root
    if Node = FRoot then
      Node := GetNextSelected(Node);

    while Assigned(Node) do
    begin
      Callback(Self, Node, Data, Abort);
      if Abort then
        Break;
      Node := GetNextSelected(Node);
    end;
  end
  else
  begin
    if Node = FRoot then
      Stop := nil
    else
    begin
      Stop := Node.NextSibling;
      if Stop = nil then
      begin
        Stop := Node;
        repeat
          Stop := Stop.Parent;
        until (Stop = FRoot) or Assigned(Stop.NextSibling);
        if Stop = FRoot then
          Stop := nil
        else
          Stop := Stop.NextSibling;
      end;
    end;
    
    // skip to next node if we start with the root
    if Node = FRoot then
    begin
      if DoInit then
        Node := GetNext(Node)
      else
        Node := GetNextNoInit(Node);
    end;

    while Assigned(Node) and (Node <> Stop) do
    begin
      Callback(Self, Node, Data, Abort);
      if Abort then
        Break;
      if DoInit then
        Node := GetNext(Node)
      else
        Node := GetNextNoInit(Node);
    end;
  end;
  
  if Abort then
    Result := Node
  else
    Result := nil;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.Loaded;

var
  LastRootCount: Cardinal;

begin
  // If a root node count has been set during load of the tree then update its child structure now
  // as this hasn't been done yet in this case.
  if FRoot.ChildCount > 0 then
  begin
    LastRootCount := FRoot.ChildCount;
    FRoot.ChildCount := 0;
    BeginUpdate;
    SetChildCount(FRoot, LastRootCount);
    EndUpdate;
  end;
  FHeader.RecalculateHeader;
  if hoAutoResize in FHeader.FOptions then
    FHeader.FColumns.AdjustAutoSize;
  // finally reset csLoading style
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetSelected(Node: PVirtualNode): Boolean;

begin
  Result := Assigned(Node) and (vsSelected in Node.States);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetSelected(Node: PVirtualNode; Value: Boolean);

begin
  if Assigned(Node) and (Node <> FRoot) and (Value xor (vsSelected in Node.States)) then
  begin
    if Value then
    begin
      if not (voMultiSelect in FOptions) then
        ClearSelection;
      AddToSelection(Node);
    end
    else
      RemoveFromSelection(Node);
    if IsVisible[Node] then
      InvalidateNode(Node);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetVisible(Node: PVirtualNode): Boolean;

// determines if all parents of the given node are expanded

var
  Run: PVirtualNode;

begin
  if Node <> FRoot then
  begin
    Run := Node.Parent;
    // FRoot is always expanded
    while (Run <> FRoot) and (vsExpanded in Run.States) do
      Run := Run.Parent;
    Result := Run = FRoot;
  end
  else
    Result := True;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetVisible(Node: PVirtualNode; Value: Boolean);

// makes sure all parents of the given node are expanded if Value = True

var
  Run: PVirtualNode;

begin
  if Value and Assigned(Node) and (Node <> FRoot) then
  begin
    Run := Node;
    // FRoot is always expanded
    repeat
      Run := Run.Parent;
      if not (vsExpanded in Run.States) then
        ToggleNode(Run);
    until Run = FRoot;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetExpanded(Node: PVirtualNode): Boolean;

begin
  if Assigned(Node) then
    Result := vsExpanded in Node.States
  else
    Result := False;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetExpanded(Node: PVirtualNode; Value: Boolean);

begin
  if Assigned(Node) and (Node <> FRoot) and (Value xor (vsExpanded in Node.States)) then
    ToggleNode(Node);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetNodeHeight(Node: PVirtualNode): Cardinal;

begin
  if Assigned(Node) and (Node <> FRoot) then
    Result := Node.NodeHeight
  else
    Result := 0;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetChildCount(Node: PVirtualNode; NewChildCount: Cardinal);

// Changes a node's child structure to accomodate the new child count. This is used to add or delete
// child nodes to/from the end of the node's child list. To insert or delete a specific node a separate
// routine is used.

var
  Count: Integer;
  Index: Cardinal;
  Child: PVirtualNode;
  C: Integer;
  NewHeight: Integer;

begin
  if NewChildCount = 0 then
    DeleteChildren(Node)
  else
  begin
    Count := Integer(NewChildCount) - Integer(Node.ChildCount);
    // if nothing changed then do nothing
    if Count <> 0 then
    begin
      C := Count;
      NewHeight := 0;
      if Count > 0 then
      begin
        // new nodes to add
        if Assigned(Node.LastChild) then
          Index := Node.LastChild.Index + 1
        else
        begin
          Index := 0;
          Include(Node.States, vsHasChildren);
        end;

        while Count > 0 do
        begin
          Child := MakeNewNode;
          Child.Index := Index;
          Child.PrevSibling := Node.LastChild;
          if Assigned(Node.LastChild) then
            Node.LastChild.NextSibling := Child;
          Child.Parent := Node;
          Node.LastChild := Child;
          if Node.FirstChild = nil then
            Node.FirstChild := Child;
          Dec(Count);
          Inc(Index);
          Inc(NewHeight, Child.NodeHeight);
        end;
        if vsExpanded in Node.States then
          AdjustTotalHeight(Node, NewHeight, True);
      end
      else
      begin
        // nodes have to be deleted
        NewHeight := Node.TotalHeight;
        while Count < 0 do
        begin
          Child := Node.LastChild;
          Node.LastChild := Child.PrevSibling;
          Include(Child.States, vsDeleting);
          DeleteChildren(Child);
          Dec(NewHeight, Child.TotalHeight);
          DoFreeNode(Child);
          Inc(Count);
        end;
        if vsExpanded in Node.States then
          AdjustTotalHeight(Node, NewHeight);
        if Assigned(Node.LastChild) then
          Node.LastChild.NextSibling := nil;
      end;

      if IsVisible[Node] and (vsExpanded in Node.States) then
        Inc(Integer(FVisibleCount), C);

      AdjustTotalCount(Node, C, True);

      Node.ChildCount := NewChildCount;
      if FUpdateCount = 0 then
      begin
        if Node = FRoot then
          DoStructureChange(nil)
        else
          DoStructureChange(Node);
      end
      else
        Include(FStates, tsStructureChangePending);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetHasChildren(Node: PVirtualNode; Value: Boolean);

begin
  if Assigned(Node) then
  begin
    if Value then
      Include(Node.States, vsHasChildren)
    else
    begin
      Exclude(Node.States, vsHasChildren);
      DeleteChildren(Node);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetLineColor(Index: Integer; Value: TColor);

begin
  case Index of
    0:
      if FGridLineColor <> Value then
      begin
        FGridLineColor := Value;
        PrepareBitmaps;
        if not (csLoading in ComponentState) then
          Invalidate;
      end;
    1:
      if FTreeLineColor <> Value then
      begin
        FTreeLineColor := Value;
        PrepareBitmaps;
        if not (csLoading in ComponentState) then
          Invalidate;
      end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetMargin(Value: Integer);

begin
  if FMargin <> Value then
  begin
    FMargin := Value;
    if not (csLoading in ComponentState) then
      Invalidate;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetNodeHeight(Node: PVirtualNode; Value: Cardinal);

var
  Difference: Integer;

begin
  if Assigned(Node) and (Node <> FRoot) and (Node.NodeHeight <> Value) then
  begin
    Difference := Integer(Value) - Integer(Node.NodeHeight);
    Node.NodeHeight := Value;
    AdjustTotalHeight(Node, Difference, True);
    ValidateCache;
    InvalidateToBottom(Node);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetOffsetX(Value: Integer);

// set scroll bar position and draw offset

var
  dX: Integer;

begin
  // range check, order is important here
  if Value < (ClientWidth - Integer(FRangeX)) then
    Value := ClientWidth - Integer(FRangeX);
  if Value > 0 then
    Value := 0;
  if FOffsetX <> Value then
  begin
    dX := Value - FOffsetX;
    FOffsetX := Value;
    // must invalidate the entire window if there's a background
    if (voShowBackground in FOptions) and (FBackground.Graphic is TBitmap) then
      InvalidateRect(Handle, nil, False)
    else
      ScrollWindow(Handle, dX, 0, nil, nil);
    if not (tsSizing in FStates) then
      UpdateHorizontalScrollBar(True);
    if hoVisible in FHeader.FOptions then
      FHeader.Invalidate(nil);
  end;
end;

//------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetOffsetY(Value: Integer);

// set scroll bar position and draw offset

var
  dY: Integer;

begin
  // range check, order is important here
  if Value < (ClientHeight - Integer(FRangeY)) then
    Value := ClientHeight - Integer(FRangeY);
  if Value > 0 then
    Value := 0;
  if FOffsetY <> Value then
  begin
    dY := Value - FOffsetY;
    FOffsetY := Value;
    // must invalidate the entire window if there's a background
    if (voShowBackground in FOptions) and (FBackground.Graphic is TBitmap) then
      InvalidateRect(Handle, nil, False)
    else
      ScrollWindow(Handle, 0, dY, nil, nil);
      
    if [tsThumbTracking, tsSizing] * FStates = [] then
    begin
      UpdateVerticalScrollBar(True);
      if not (FHeader.UseColumns or IsMouseSelecting) then
        UpdateHorizontalScrollBar(True);
    end;
  end;
end;

//------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetOLEFormats(Value: TOLEFormats);

begin
  if FOLEFormats <> Value then
  begin
    FOLEFormats := Value;
    // remove the current clipboard data if it is set by the tree
    if OleIsCurrentClipBoard(FDragManager) = S_OK then
      OleSetClipboard(nil);
    if Assigned(FDragManager) then
      FDragManager.SetOLEFormats(FOLEFormats);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetNodeLevel(Node: PVirtualNode): Cardinal;

// returns the level of the given node

var
  Run: PVirtualNode;
  
begin
  Result := 0;
  if Assigned(Node) and (Node <> FRoot) then
  begin
    Run := Node.Parent;
    while Run <> FRoot do
    begin
      Run := Run.Parent;
      Inc(Result);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoDragging(P: TPoint);

// initiates finally the drag'n drop operation and returns after DD is finished

var
  I,
  DragEffect,
  AllowedEffects: Integer;
  HotSpot: TPoint;

begin
  // dragging and another clipboard operation are not allowed simultaneously
  if (ClipboardStates * FStates) <> [] then
  begin
    Include(FStates, tsClipboardCancelling);
    CancelCutOrCopy;
    FStates := FStates - ClipboardStates - [tsClipboardCancelling];
  end;
    
  if Assigned(FCurrentHotNode) then
  begin
    InvalidateNode(FCurrentHotNode);
    FCurrentHotNode := nil;
    UpdateWindow(Handle);
  end;
  // select the node if not already done
  InternalAddToSelection(FFocusedNode, False);

  // keep a list of all currently selected nodes as this list might change, but we have probably to delete
  // currently selected nodes
  FDragSelection := Copy(FSelection, 0, FSelectionCount);
  try
    FStates := FStates + [tsDragging] - [tsDragPending, tsClearPending];
    HotSpot := P;
    P := ClientToScreen(HotSpot);
    FDragManager.DragStart(P, HotSpot);
    FLastDropMode := dmOnNode;
    // just to make it initialized
    DragEffect := DROPEFFECT_NONE;
    // don't allow linked drop operation because I don't see how a linked node should look like
    // (in the sense of being a shortcut)
    AllowedEffects := DROPEFFECT_COPY or DROPEFFECT_MOVE {or DROPEFFECT_LINK};
    try
      ActiveX.DoDragDrop(FDragManager{ as IDataObject}, FDragManager{ as IDropSource}, AllowedEffects, DragEffect);
    finally
      FDragManager.DragStop;

      // finish the operation
      if DragEffect = DROPEFFECT_MOVE then
      begin
        // the operation was a move so delete the previously selected nodes
        BeginUpdate;
        try
          for I := 0 to High(FDragSelection) do
            DeleteNode(FDragSelection[I]);
        finally
          EndUpdate;
        end;
      end;

      Exclude(FStates, tsDragging);
    end;
  finally
    FDragSelection := nil;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.BeginDrag(Immediate: Boolean; Threshold: Integer);

// reintroduced method to start OLE drag'n drop instead VCL drag'n drop

begin
  if (FStates * [tsDragPending, tsDragging]) = [] then
  begin
    // drag starting position is already recorded in WMMouseDown
    if Threshold < 0 then
      FDragThreshold := Mouse.DragThreshold
    else
      FDragThreshold := Threshold;
    if Immediate then
      DoDragging(FDragStartPos)
    else
      Include(FStates, tsDragPending);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.SuggestDropEffect(Source: TObject; Shift: TShiftState; Pt: TPoint;
  AllowedEffects: Integer): Integer;

// determines the drop action to take if the drag'n drop operation ends on this tree
// Note: Source can be any Delphi object not just a virtual tree

begin
  Result := AllowedEffects;
  
  // prefer MOVE if source and target are the same control, otherwise whatever is allowed as initial value
  if Assigned(Source) and (Source = Self) then
    if (AllowedEffects and DROPEFFECT_MOVE) <> 0 then
      Result := DROPEFFECT_MOVE
    else // no change
  else
    // drag between different applicatons
    if (AllowedEffects and DROPEFFECT_COPY) <> 0 then
      Result := DROPEFFECT_COPY;

  // consider modifier keys and what is allowed at the moment, if none of the following conditions apply then
  // the initial value just set is used
  if ssCtrl in Shift then
  begin
    // copy or link
    if ssShift in Shift then
    begin
      // link
      if (AllowedEffects and DROPEFFECT_LINK) <> 0 then
        Result := DROPEFFECT_LINK;
    end
    else
    begin
      // copy
      if (AllowedEffects and DROPEFFECT_COPY) <> 0 then
        Result := DROPEFFECT_COPY;
    end;
  end
  else
  begin
    // move, link or default
    if ssShift in Shift then
    begin
      // move
      if (AllowedEffects and DROPEFFECT_MOVE) <> 0 then
        Result := DROPEFFECT_MOVE;
    end
    else
    begin
      // link or default
      if ssAlt in Shift then
      begin
        // link
        if (AllowedEffects and DROPEFFECT_LINK) <> 0 then
          Result := DROPEFFECT_LINK;
      end;
      // else default
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoColumnResize(Column: Integer);

var
  R: TRect;

begin
  if not (csLoading in ComponentState) and HandleAllocated then
  begin
    if hoAutoResize in FHeader.FOptions then
      FHeader.Columns.AdjustAutoSize;
    UpdateHorizontalScrollBar(True);
    Invalidate;
    FHeader.Invalidate(FHeader.Columns[Column]);
    UpdateDesigner; // design time only

    if Assigned(FOnColumnResize) then
      FOnColumnResize(Self, Column);

    // if the tree is currently in edit state and the column resized is the same
    // as the one being edited then notify edit link
    if (tsEditing in FStates) and
       ((FEditColumn = Column) or (FEditColumn = FHeader.FAutoSizeIndex)) then
    begin
      R := FEditLink.GetBounds;
      FHeader.FColumns.GetColumnBounds(FEditColumn, R.Left, R.Right);
      FEditLink.SetBounds(R);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.DoDragEnter(const DataObject: IDataObject; KeyState: Integer; Pt: TPoint;
  var Effect: Integer): HResult;

// callback routine for the drop target interface

var
  Shift: TShiftState;
  Accept: Boolean;

begin
  try
    // determine acceptance of drag operation
    Shift := KeysToShiftState(KeyState);
    Accept := True;
    Pt := ScreenToClient(Pt);
    Effect := SuggestDropEffect(FDragManager.FDragSource, Shift, Pt, Effect);
    if Assigned(FOnDragOver) then
      FOnDragOver(Self, FDragManager.FDragSource, Shift, dsDragEnter, Pt, FLastDropMode, Effect, Accept);
    if not Accept then
      Effect := DROPEFFECT_NONE;
    // If the drag source is a virtual tree then we know how to control the drag image
    // and can show it even if the source is not the target tree.
    if Assigned(FDragManager.FDragSource) then
      FDragManager.FDragSource.FDragManager.ShowDragImage;
    Result :=  NOERROR;
  except
    Result := E_UNEXPECTED;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.StopTimer(ID: Integer);

begin
  KillTimer(Handle, ID);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.DoDragOver(Source: TObject; KeyState: Integer; DragState: TDragState; Pt: TPoint;
  var Effect: Integer): HResult;

// callback routine for the drop target interface

var
  Shift: TShiftState;
  Accept: Boolean;
  Node: PVirtualNode;
  OldR, R: TRect;
  NewDropMode: TDropMode;
  HitInfo: THitInfo;

begin
  try
    // determine acceptance of drag operation
    Shift := KeysToShiftState(KeyState);
    Accept := True;
    Pt := ScreenToClient(Pt);

    Node := GetHitTestInfoAt(Pt.X, Pt.Y, HitInfo);
    if Assigned(Node) then
    begin
      R := GetDisplayRect(Node, -1);
      if hiOnItemLabel in HitInfo.HitPosition then
        NewDropMode := dmOnNode
      else
        if ((R.Top + R.Bottom) div 2) > Pt.Y then
          NewDropMode := dmAbove
        else
          NewDropMode := dmBelow;
    end
    else
      NewDropMode := dmNowhere;

    // handle auto scrolling if required
    if voAutoScroll in FOptions then
      DoAutoScroll(Pt.X, Pt.Y);

    if (Node <> FCurrentTargetNode) or (FLastDropMode <> NewDropMode) then
    begin
      if Node <> FCurrentTargetNode then
      begin
        StopTimer(ExpandTimer);
        if Assigned(FCurrentTargetNode) then
        begin
          OldR := GetDisplayRect(FCurrentTargetNode, -1);
          InvalidateRect(Handle, @OldR, False);
        end
        else
          OldR := Rect(0, 0, 0, 0);
        FCurrentTargetNode := Node;   

        // start auto expand timer if necessary
        if (voAutoDropExpand in FOptions) and Assigned(FCurrentTargetNode) and
           (vsHasChildren in FCurrentTargetNode.States) then
          SetTimer(Handle, ExpandTimer, 1000, nil);
      end
      else
        OldR := Rect(0, 0, 0, 0);

      FLastDropMode := NewDropMode;
      // repaint changes before the drag image is shown again
      if Assigned(FCurrentTargetNode) then
        InvalidateRect(Handle, @R, False);

      // make sure all changes are written to the screen before changing the drag image
      UnionRect(R, R, OldR);
      if Abs(R.Bottom - R.Top) > 36 then
        InvalidateRect(Handle, @R, False);

      UpdateWindow(Handle);
      if Source is TBaseVirtualTree then
      begin
        // restrict R to the client area to avoid wrong updates of other screen parts
        IntersectRect(R, R, ClientRect);
        // convert to screen coordinates and calculate intersection between this rectangle and
        // the drag image rectangle
        MapWindowPoints(Handle, 0, R, 2);
        (Source as TBaseVirtualTree).FDragManager.InvalidateDragImage(R);
      end;
    end;

    Effect := SuggestDropEffect(Source, Shift, Pt, Effect);
    if Assigned(FOnDragOver) then
      FOnDragOver(Self, Source, Shift, DragState, Pt, FLastDropMode, Effect, Accept);
    if not Accept then
      Effect := DROPEFFECT_NONE;

    Result :=  NOERROR;
  except
    Result := E_UNEXPECTED;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoDragLeave;

var
  Accept: Boolean;
  Effect: Integer;
  
begin
  StopTimer(ExpandTimer);
  if Assigned(FDragManager.FDragSource) then
    FDragManager.FDragSource.FDragManager.HideDragImage;
  if Assigned(FCurrentTargetNode) then
  begin
    InvalidateNode(FCurrentTargetNode);
    FCurrentTargetNode := nil;
  end;

  // release last drop source if there was one
  Effect := 0;
  if Assigned(FOnDragOver) then
    FOnDragOver(Self, nil, [], dsDragLeave, Point(0, 0), FLastDropMode, Effect, Accept);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.DoDragDrop(const DataObject: IDataObject; KeyState: Integer; Pt: TPoint;
  var Effect: Integer): HResult;

var
  Shift: TShiftState;
  EnumFormat: IEnumFormatEtc;
  Fetched: Integer;
  OLEFormat: TFormatEtc;
  Formats: array of Word;
  
begin
  StopTimer(ExpandTimer);
  FDragManager.HideDragImage;
  Formats := nil;
  
  if Effect = DROPEFFECT_NONE then
    Result := E_FAIL
  else
  begin
    try
      try
        if Assigned(FOnDragDrop) then
        begin
          Shift := KeysToShiftState(KeyState);
          Pt := ScreenToClient(Pt);
          // Determine which formats we can get and passed them along with the data object to the drop handler.
          // Note: EnumFormat will be freed on exit of this method (DoDragDrop).
          Result := DataObject.EnumFormatEtc(DATADIR_GET, EnumFormat);
          if Failed(Result) then
            Abort;
          Result := EnumFormat.Reset;
          if Failed(Result) then
            Abort;
          // create a list of available formats
          while EnumFormat.Next(1, OLEFormat, @Fetched) = S_OK do
          begin
            SetLength(Formats, Length(Formats) + 1);
            Formats[High(Formats)] := OLEFormat.cfFormat;
          end;
          FOnDragDrop(Self, FDragManager.FDragSource, DataObject, Formats, Shift, Pt, Effect, FLastDropMode);
        end
        else
          Result := E_FAIL;
      finally
        if Assigned(FCurrentTargetNode) then
        begin
          InvalidateNode(FCurrentTargetNode);
          FCurrentTargetNode := nil;
        end;
      end;
    except
      Result := E_UNEXPECTED;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetDragging: Boolean;

begin
  Result := [tsDragPending, tsDragging] * FStates <> [];
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.GetAlignment(Node: PVirtualNode): Byte;

begin
  Result := Node.Align;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.SetAlignment(Node: PVirtualNode; Value: Byte);

begin
  if Value > 100 then
    Value := 100;
  if Node.Align <> Value then
  begin
    Node.Align := Value;
    if IsVisible[Node] then
      InvalidateNode(Node);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoExpanded(Node: PVirtualNode);

begin
  if Assigned(FOnExpanded) then
    FOnExpanded(Self, Node);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoDragExpand;

begin
  StopTimer(ExpandTimer);
  if Assigned(FCurrentTargetNode) and
     (vsHasChildren in FCurrentTargetNode.States) and
     not (vsExpanded in FCurrentTargetNode.States) then
    with FDragManager do
    begin
      if assigned(FDragSource) then
        FDragSource.FDragManager.HideDragImage;
      ToggleNode(FCurrentTargetNode);
      UpdateWindow(Handle);
      if assigned(FDragSource) then
        FDragSource.FDragManager.ShowDragImage;
    end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoDrawHeader(Canvas: TCanvas; Column: TVirtualTreeColumn; R: TRect; Hover, Pressed: Boolean);

begin
  if Assigned(FOnDrawHeader) then
    FOnDrawHeader(FHeader, Canvas, Column, R, Hover, Pressed);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoEdit;

begin
  StopTimer(ScrollTimer);
  StopTimer(EditTimer);
  Exclude(FStates, tsEditPending);
  if Assigned(FFocusedNode) and not (vsDisabled in FFocusedNode.States) then
  begin
    FEditLink := CreateEditor(FFocusedNode, FEditColumn);
    if Assigned(FEditLink) then
    begin
      ScrollIntoView(FFocusedNode, True);
      if FEditLink.PrepareEdit(Self, FFocusedNode, FEditColumn) then
      begin
        FEditLink.SetBounds(GetDisplayRect(FFocusedNode, FEditColumn));
        // node needs repaint because the selection rectangle and static text must disappear
        InvalidateNode(FFocusedNode);
        if FEditLink.BeginEdit then
          Include(FStates, tsEditing);
      end;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoEndEdit;

begin
  if tsEditing in FStates then
  begin
    Exclude(FStates, tsEditing);
    if FEditLink.CanStop then
      FEditLink.EndEdit;
    SetFocus;
    // asynchronously release edit link
    PostMessage(Handle, WM_RELEASEEDITLINK, 0, 0);
    if Assigned(FOnEdited) then
      FOnEdited(Self, FFocusedNode, FEditColumn);
  end;
  Exclude(FStates, tsEditPending);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.DoExpanding(Node: PVirtualNode): Boolean;

begin
  Result := True;
  if Assigned(FOnExpanding) then
    FOnExpanding(Self, Node, Result);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoChecked(Node: PVirtualNode);

begin
  if Assigned(FOnChecked) then
    FOnChecked(Self, Node);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.DoChecking(Node: PVirtualNode; var NewState: TCheckState): Boolean;

begin
  Result := True;
  if Assigned(FOnChecking) then
    FOnChecking(Self, Node, NewState, Result);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.DoCollapsed(Node: PVirtualNode);

begin
  if Assigned(FOnCollapsed) then
    FOnCollapsed(Self, Node);
end;

//----------------------------------------------------------------------------------------------------------------------

function TBaseVirtualTree.DoCollapsing(Node: PVirtualNode): Boolean;

begin
  Result := True;
  if Assigned(FOnCollapsing) then
    FOnCollapsing(Self, Node, Result);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TBaseVirtualTree.CMSysColorChange(var Message: TMessage);

begin
  inherited;
  ConvertAndAddImages(LightCheckImages, 'VBT_CHECK_LIGHT');
  ConvertAndAddImages(DarkCheckImages, 'VBT_CHECK_DARK');
  ConvertAndAddImages(LightTickImages, 'VBT_TICK_LIGHT');
  ConvertAndAddImages(DarkTickImages, 'VBT_TICK_DARK');
  Message.Msg := WM_SYSCOLORCHANGE;
  DefaultHandler(Message);
end;

//----------------- TStringEditLink ------------------------------------------------------------------------------------

constructor TStringEditLink.Create;

begin
  inherited;
  FEdit := TVTEdit.Create(Self);
  with FEdit do
  begin
    Visible := False;
    Ctl3D := False;
    BorderStyle := bsSingle;
    AutoSize := False;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

destructor TStringEditLink.Destroy;

begin
  FEdit.Free;
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

function TStringEditLink.BeginEdit: Boolean;

// Notifies the edit link that editing can start now. Descentants may cancel node edit
// by returning False.

begin
  Result := not FStopping;
  if Result then
  begin
    FEdit.Show;
    FEdit.SelectAll;
    FEdit.SetFocus;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TStringEditLink.CancelEdit;

begin
  if not FStopping then
  begin
    FStopping := True;
    FEdit.Hide;
    FTree.CancelEditNode;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TStringEditLink.CanStop: Boolean;

begin
  Result := not FStopping;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TStringEditLink.EndEdit;

begin
  if not FStopping then
  begin
    FStopping := True;
    if FEdit.Modified then
      FTree.DoNewText(FNode, FColumn, FEdit.Caption);
    FEdit.Hide;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TStringEditLink.GetBounds: TRect;

begin
  Result := FEdit.BoundsRect;
end;

//----------------------------------------------------------------------------------------------------------------------

function TStringEditLink.PrepareEdit(Tree: TBaseVirtualTree; Node: PVirtualNode; Column: Integer): Boolean;

// retrieves the true text bounds from the owner tree

var
  Text: WideString;

begin
  Result := Tree is TCustomVirtualStringTree;
  if Result then
  begin
    FTree := Tree as TCustomVirtualStringTree;
    FNode := Node;
    FColumn := Column;
    // initial size, font and text of the node
    FTree.GetTextInfo(Node, Column, FEdit.Font, FTextBounds, Text);
    FEdit.Caption := Text;
    FEdit.Parent := Tree;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TStringEditLink.SetBounds(R: TRect);

// set outer bounds of the edit control and the actual edit area in the control

var
  Text: WideString;
  LastWidth: Integer;

begin
  if not FStopping then
  begin
    // keep last width of edit (add the margin which gets subtracted below)
    LastWidth := FTextBounds.Right - FTextBounds.Left + 4;
    FTree.GetTextInfo(FNode, FColumn, FEdit.Font, FTextBounds, Text);
    FTextBounds.Right := FTextBounds.Left + LastWidth;

    with FTextBounds do
    begin
      // set the edit's bounds but make sure there's a minimum width and the right border does not
      // extend beyond the parent's right border
      if Right - Left < 30 then
        Right := Left + 30;
      if Right > FTree.ClientWidth then
        Right := FTree.ClientWidth;
      FEdit.SetBounds(Left, R.Top, Right - Left, R.Bottom - R.Top);
      MapWindowPoints(FTree.Handle, FEdit.Handle, FTextBounds, 2);
      // Top and bottom bounds of the actual edit rect are already adjusted, we need to
      // leave 2 pixels margins on left and right side.
      InflateRect(FTextBounds, -2, 0);
      SendMessage(FEdit.Handle, EM_SETRECT, 0, Integer(@FTextBounds));
    end;
  end;
end;

//----------------- TVTEdit --------------------------------------------------------------------------------------------

// implementation of a generic node caption editor

constructor TVTEdit.Create(Link: TStringEditLink);

begin
  inherited Create(nil);
  ShowHint := False;
  ParentShowHint := False;
  FLink := Link;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTEdit.CNCommand(var Message: TWMCommand);

begin
  if Assigned(FLink) and Assigned(FLink.FTree) then
    AutoAdjustSize(0);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTEdit.WMChar(var Message: TWMChar);

// handle character keys

begin
  // avoid beep
  if Message.CharCode <> VK_ESCAPE then
    inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTEdit.WMKeyDown(var Message: TWMKeyDown);

// handles some control keys 

begin
  case Message.CharCode of
    // pretend these keycodes were send to the tree
    VK_ESCAPE:
      FLink.FTree.WndProc(TMessage(Message));
    VK_RETURN:
      FLink.FTree.DoEndEdit;
    VK_UP:
      begin
        Message.CharCode := VK_LEFT;
        inherited;
      end;
    VK_DOWN:
      begin
        Message.CharCode := VK_RIGHT;
        inherited;
      end;
  else
    inherited;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTEdit.WMKillFocus(var Msg: TWMKillFocus);

begin
  inherited;
  // FLink.FTree is set to nil if the link doesn't need to notify the tree (e.g. hiding the edit causes
  // a kill focus message)
  if Assigned(FLink.FTree) then
    FLink.FTree.DoEndEdit;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTEdit.AutoAdjustSize(NewChar: Word);

// Changes the size of the edit to accomodate as much as possible of its text within its container window.
// NewChar describes the next character which will be added to the edit's text.

var
  DC: HDC;
  Size: TSize;
  LastFont: THandle;

begin
  // avoid flicker
  SendMessage(Handle, WM_SETREDRAW, 0, 0);

  DC := GetDC(Handle);
  LastFont := SelectObject(DC, Font.Handle);
  try
    // read needed space for the current text
    if NewChar > 0 then
      GetTextExtentPoint32(DC, PChar(Text + Char(NewChar)), Length(Text) + 1, Size)
    else
      GetTextExtentPoint32(DC, PChar(Text), Length(Text), Size);
    Inc(Size.cx, 8);
    // Is the resulting text size less than 30 pixels?
    if Size.cx < 30 then
      Size.cx := 30;
    // Is the resulting window larger than the parent window?
    if (Left + Size.cx) > (FLink.FTree.ClientWidth - 6) then
      Size.cx := FLink.FTree.ClientWidth - Left - 6;

    // update edit area 
    with FLink.FTextBounds do
      Right := Left + Size.cx;

    // Set new sizes of the edit.
    SetWindowPos(Handle, 0, 0, 0, Size.cx + 4, Height, SWP_NOMOVE or SWP_NOOWNERZORDER or SWP_NOZORDER);
    SendMessage(Handle, EM_SETRECT, 0, Integer(@FLink.FTextBounds));

    // Repaint associated node if the edit becomes smaller.
    if Size.cx < Width then
      FLink.FTree.InvalidateNode(FLink.FNode);
  finally
    SelectObject(DC, LastFont);
    ReleaseDC(Handle, DC);
  end;
  SendMessage(Handle, WM_SETREDRAW, 1, 0);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TVTEdit.CreateParams(var Params: TCreateParams);

begin
  Ctl3D := False;
  inherited;
  // Only with multiline style we can use the text formatting rectangle.
  // This does not harm formatting as single line control, as we don't use word wrapping.
  Params.Style := Params.Style or ES_MULTILINE;
end;

//----------------- TCustomVirtualString -------------------------------------------------------------------------------

constructor TCustomVirtualStringTree.Create(AOwner: TComponent);

begin
  inherited;
  FDefaultText := 'Node';
  FDrawInfo.Font := TFont.Create;
  // add 4 bytes extra space for node widths to each node
  InternalDataSize := 4;
  FStringOptions := DefaultStringOptions;
end;

//----------------------------------------------------------------------------------------------------------------------

destructor TCustomVirtualStringTree.Destroy;

begin
  if Assigned(FDrawInfo.Font) then
    FDrawInfo.Font.Free;
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

function TCustomVirtualStringTree.ColumnIsEmpty(Node: PVirtualNode; Column: Integer): Boolean;

// For hit tests it is necessary to consider cases where columns are empty and automatic column spanning is enabled.
// This method simply checks the given column's text and if this is empty then the column is considered as being empty.

var
  Text: WideString;

begin
  DoGetText(Node, Column, ttNormal, Text);
  Result := Length(Text) = 0;
end;

//----------------------------------------------------------------------------------------------------------------------

function TCustomVirtualStringTree.CreateEditor(Node: PVirtualNode; Column: Integer): IVTEditLink;

var
  Link: TStringEditLink;

begin
  Result := inherited CreateEditor(Node, Column);
  // enable generic label editing support if the application does not have own editors
  if Result = nil then
  begin
    Link := TStringEditLink.Create;
    // this assignment increments the reference count to 1
    Result := Link;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TCustomVirtualStringTree.DoGetDrawInfo(Node: PVirtualNode; Column: Integer; TextType: TVSTTextType;
  var DrawInfo: TDrawInfo);

begin
  if Assigned(FOnGetDrawInfo) then
    FOnGetDrawInfo(Self, Node, Column, TextType, DrawInfo);
end;

//----------------------------------------------------------------------------------------------------------------------

function TCustomVirtualStringTree.DoGetNodeHint(Node: PVirtualNode; Column: Integer): WideString;

begin
  Result := inherited DoGetNodeHint(Node, Column);
  if Assigned(FOnGetHint) then
    FOnGetHint(Self, Node, Column, ttNormal, Result);
end;

//----------------------------------------------------------------------------------------------------------------------

function TCustomVirtualStringTree.DoGetNodeTooltip(Node: PVirtualNode; Column: Integer): WideString;

begin
  Result := Hint;
  DoGetText(Node, Column, ttNormal, Result);
end;

//----------------------------------------------------------------------------------------------------------------------

function TCustomVirtualStringTree.DoGetNodeWidth(Node: PVirtualNode; Column: Integer): Integer;

// returns the text width of the given node in pixels, this width is stored in the node's data
// member to increase access speed
// Note: the node width is actually stored in DoGetText (for the primary column only)

var
  Text: WideString;

begin
  if (Column + 1) in [0..1] then
  begin
    // primary column or no columns
    Result := PInteger(@Node.Data)^;
    if Result = 0 then
    begin
      DoGetText(Node, Column, ttNormal, Text);
      PInteger(@Node.Data)^ := CalculateTextWidth(Node, Column, Text);
      Result := PInteger(@Node.Data)^;
    end;
  end
  else
  begin
    // any other column
    DoGetText(Node, Column, ttNormal, Text);
    Result := CalculateTextWidth(Node, Column, Text);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TCustomVirtualStringTree.AdjustPaintCellRect(Node: PVirtualNode; ColumnPosition: Integer;
  var NextNonEmpty: Integer; var ClipRect: TRect);

// in the case a node spans several columns (if enabled) we need to determine how many columns

var
  I: Integer;

begin
  if (voAutoSpanColumns in FOptions) and FHeader.UseColumns then
  begin
    NextNonEmpty := Length(FColumnData);
    for I := ColumnPosition + 1 to High(FColumnData) do
      with FColumnData[I] do
      begin
        if Visible then
        begin
          if Length(Text) > 0 then
          begin
            NextNonEmpty := I;
            Break;
          end;
          Inc(ClipRect.Right, Width);
        end;
      end;
  end
  else
    inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TCustomVirtualStringTree.DefineProperties(Filer: TFiler);

begin
  // Delphi still cannot handle wide strings properly while streaming
  Filer.DefineProperty('WideDefaultText', ReadText, WriteText, FDefaultText <> '');
end;

//----------------------------------------------------------------------------------------------------------------------

function TCustomVirtualStringTree.DoBeforeItemPaint(Canvas: TCanvas; Node: PVirtualNode; ItemRect: TRect): Boolean;

// called just before a node is drawn;
// we store the node's text for quicker access

var
  I: Integer;

begin
  Result := inherited DoBeforeItemPaint(Canvas, Node, ItemRect);
  if not Result and FHeader.UseColumns then
  begin
    with FHeader.FColumns do
    begin
      for I := 0 to High(FColumnData) do
        DoGetText(Node, FColumnPositions[I], ttNormal, FColumnData[I].Text);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TCustomVirtualStringTree.DoBeforePaint(Canvas: TCanvas);

// prepare cache for optimized access

var
  I: Integer;
  
begin
  inherited;
  if FHeader.UseColumns then
  begin
    SetLength(FColumnData, FHeader.FColumns.Count);
    with FHeader.FColumns do
    begin
      for I := 0 to High(FColumnData) do
      begin
        FColumnData[I].Visible := coVisible in Items[FColumnPositions[I]].FOptions;
        FColumnData[I].Width := Items[FColumnPositions[I]].Width;
      end;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TCustomVirtualStringTree.CalculateTextWidth(Node: PVirtualNode; Column: Integer;
  Text: WideString): Integer;

// determines the width of the given text

var
  Size: TSize;

begin
  if Length(Text) > 0 then
  begin
    if Assigned(FOnGetDrawInfo) and (voCustomizeItems in FOptions) then
    begin
      FDrawInfo.Font.Assign(Font);
      DoGetDrawInfo(Node, Column, ttNormal, FDrawInfo);
      Canvas.Font.Assign(FDrawInfo.Font);
    end
    else
      Canvas.Font := Font;

    GetTextExtentPoint32W(Canvas.Handle, PWideChar(Text), Length(Text), Size);
    Result := Size.cx + 8;
  end
  else // if the node text is empty then assume a small rectangle
    Result := 8;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TCustomVirtualStringTree.DoGetText(Node: PVirtualNode; Column: Integer; TextType: TVSTTextType;
  var Text: WideString);

begin
  Text := FDefaultText;
  if Assigned(FOnGetText) then
    FOnGetText(Self, Node, Column, TextType, Text);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TCustomVirtualStringTree.DoNewText(Node: PVirtualNode; Column: Integer; Text: WideString);

begin
  if Assigned(FOnNewText) then
    FOnNewText(Self, Node, Column, Text);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TCustomVirtualStringTree.DoPaintNode(Canvas: TCanvas; Node: PVirtualNode; ClippingRect, NodeRect: TRect;
  Column, ColumnIndex: Integer);

// main output routine to print the text of the given node using the space provided in R
// If ShowSelState is true then proper backgrounds for selected nodes and focus rectangle for a focused node
// are drawn.

var
  Text: WideString;
  SaveFontColor: TColor;
  Y: Integer;
  TM: TTextMetric;
  DoCustomize: Boolean;
  
begin
  with Canvas do
  begin  
    // initialize default values for customization
    FDrawInfo.Font.Assign(Self.Font);
    FDrawInfo.Background := Color;
    if Column > -1 then
      Text := FColumnData[ColumnIndex].Text
    else
      DoGetText(Node, Column, ttNormal, Text);
    // need this test twice, so make a shortcut
    DoCustomize := Assigned(FOnGetDrawInfo) and (voCustomizeItems in FOptions);
    if DoCustomize then
    begin
      DoGetDrawInfo(Node, Column, ttNormal, FDrawInfo);
      // apply changes of the drawinfo font to the current font
      // (there's almost no penalty by assigning the font to itself if it hasn't been changed
      // by the application)
      Font.Assign(FDrawInfo.Font);
      Brush.Color := FDrawInfo.Background;
      GetTextMetrics(Handle, TM);
      Y := (Integer(Node.NodeHeight) - TM.tmHeight) div 2;
    end
    else
    begin
      Brush.Color := Color;
      Font.Color := Self.Font.Color;
      Y := (Integer(Node.NodeHeight) - FTextHeight) div 2;
    end;

    if voHotTrack in FOptions then
      if Node = FCurrentHotNode then
        Font.Style := Font.Style + [fsUnderline]
      else
        Font.Style := Font.Style - [fsUnderline];

    if (Column = FFocusedColumn) or (voFullRowSelect in FOptions) then
    begin
      // draw selection and focus rect
      if vsSelected in Node.States then
      begin
        if Focused then
        begin
          Brush.Color := clHighLight;
          Font.Color := clWhite;
        end
        else
        begin
          Brush.Color := clBtnFace;
          Font.Color := FDrawInfo.Font.Color;
        end;
        if voGridExtensions in FOptions then
          FillRect(ClippingRect)
        else
          FillRect(NodeRect);
      end
      else
        if Node = FCurrentTargetNode then
        begin
          if FLastDropMode = dmOnNode then
          begin
            Brush.Color := clHighLight;
            Font.Color := clWhite;
          end
          else
          begin
            Brush.Style := bsClear;
            Font.Color := FDrawInfo.Font.Color;
          end;
          FillRect(NodeRect);
        end;

      if (Column = FFocusedColumn) and
         Focused and (FFocusedNode = Node) then
      begin
        if Self.Color = clGray then
          Brush.Color := clWhite
        else
          Brush.Color := clBlack;
        SaveFontColor := Font.Color;
        Font.Color := Self.Color;
        Windows.DrawFocusRect(Handle, NodeRect);
        Font.Color := SaveFontColor;
      end;
    end;

    // disabled node color overrides all other variants
    if (vsDisabled in Node.States) or not Enabled then
      Font.Color := clBtnShadow;
    
    // paint corresponding text
    SetBkMode(Handle, TRANSPARENT);
    if Length(Text) > 0 then
    begin
      if Column > -1 then
      begin
        Text := ShortenString(Canvas.Handle, Text, NodeRect.Right - NodeRect.Left - 4, FEllipsisWidth);
      end;
      ExtTextOutW(Handle, NodeRect.Left + 4, NodeRect.Top + Y, ETO_CLIPPED, @ClippingRect, PWideChar(Text),
                  Length(Text), nil);
    end;

    // draw static text after the main caption (if requested)
    if soShowStaticText in FStringOptions then
    begin
      DoGetText(Node, Column, ttStatic, Text);
      if Text > '' then
      begin
        Inc(NodeRect.Left, DoGetNodeWidth(Node, Column) + 4);
        // let the application format the this text
        if DoCustomize then
        begin
          // use the currently set styles as default
          DoGetDrawInfo(Node, Column, ttStatic, FDrawInfo);
          // apply changes of the drawinfo font to the current font
          Font.Assign(FDrawInfo.Font);
          Brush.Color := FDrawInfo.Background;
          GetTextMetrics(Handle, TM);
          Y := (Integer(Node.NodeHeight) - TM.tmHeight) div 2;
        end;

        SetBkMode(Handle, TRANSPARENT);
        ExtTextOutW(Handle, NodeRect.Left, NodeRect.Top + Y, ETO_CLIPPED, @ClippingRect, PWideChar(Text),
                    Length(Text), nil);
      end;
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TCustomVirtualStringTree.GetTextInfo(Node: PVirtualNode; Column: Integer; const AFont: TFont; var R: TRect;
  var Text: WideString);

// Returns the font, the text and its bounding rectangle to the caller. R is returned as the closest
// bounding rectangle around Text.

var
  NodeWidth: Integer;
  NewHeight,
  Y: Integer;
  TM: TTextMetric;

begin
  // get default font and initialize the other paramters
  inherited GetTextInfo(Node, Column, AFont, R, Text);

  if (FHintMode = hmToolTip) and Assigned(FOnGetDrawInfo) and (voCustomizeItems in FOptions) then
  begin
    FDrawInfo.Font.Assign(AFont);
    DoGetDrawInfo(Node, Column, ttNormal, FDrawInfo);
    AFont.Assign(FDrawInfo.Font);
    GetTextMetrics(Canvas.Handle, TM);
    NewHeight := TM.tmHeight;
  end
  else
  begin
    NewHeight := FTextHeight;
    {$ifndef DFS_COMPILER_5_UP}
    AFont.Assign(HintFont);
    {$else}
    AFont.Assign(Screen.HintFont);
    {$endif}
  end;

  // alignment to the actual text
  Y := (Integer(Node.NodeHeight) - NewHeight) div 2;
  DoGetText(Node, Column, ttNormal, Text);
  R := GetDisplayRect(Node, Column, True);
  NodeWidth := DoGetNodeWidth(Node, Column);
  R.Right := R.Left + NodeWidth;
  Inc(R.Top, Y);
  R.Bottom := R.Top + NewHeight;
end;

//----------------------------------------------------------------------------------------------------------------------

function TCustomVirtualStringTree.ReadChunk(Stream: TStream; Node: PVirtualNode; ChunkType,
  ChunkSize: Integer): Boolean;

// read in the caption chunk if there is one

var
  NewText: WideString;
  
begin
  case ChunkType of
    CaptionChunk:
      begin
        if ChunkSize > 0 then
        begin
          SetLength(NewText, ChunkSize div 2);
          Stream.Read(PWideChar(NewText)^, ChunkSize);
          if FHeader.Columns.Count > 0 then
            DoNewText(Node, 0, NewText)
          else
            DoNewText(Node, -1, NewText);
        end;
        Result := True;
      end;
  else
    Result := inherited ReadChunk(Stream, Node, ChunkType, ChunkSize);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TCustomVirtualStringTree.WriteChunks(Stream: TStream; Node: PVirtualNode);

// Adds another sibling chunk for Node storing the label if the node is initialized.
// Note: If the application stores a node's caption in the node's data member (which will be quite common) and needs to
//       store more node specific data then it should use the OnSaveNode event rather than the caption autosave function
//       (take out soSaveCaption from StringOptions). Otherwise the caption is unnecessarily stored twice.

var
  Header: TChunkHeader;
  Text: WideString;
  Len: Integer;

begin
  inherited;
  if (soSaveCaptions in FStringOptions) and
     (Node <> FRoot) and
     (vsInitialized in Node.States) then
    with Stream do
    begin
      // read the node's caption (primary column only)
      DoGetText(Node, 0, ttNormal, Text);
      Len := 2 * Length(Text);
      if Len > 0 then
      begin
        // write a new sub chunk
        Header.ChunkType := CaptionChunk;
        Header.ChunkSize := Len;
        Write(Header, SizeOf(Header));
        Write(PWideChar(Text)^, Len);
      end;
    end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TCustomVirtualStringTree.InvalidateNode(Node: PVirtualNode): TRect;

begin
  Result := inherited InvalidateNode(Node);
  // reset node width so changed text attributes are applied correctly
  PInteger(@Node.Data)^ := 0;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TCustomVirtualStringTree.ReinitNode(Node: PVirtualNode; recursive: Boolean);

begin
  inherited;
  // reset node width so changed text attributes are applied correctly
  if Assigned(Node) then
    PInteger(@Node.Data)^ := 0;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TCustomVirtualStringTree.ReadText(Reader: TReader);

begin
  case Reader.NextValue of
    vaLString, vaString:
      SetDefaultText(Reader.ReadString);
  else
    SetDefaultText(Reader.ReadWideString);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TCustomVirtualStringTree.SetDefaultText(const Value: WideString);

begin
  if FDefaultText <> Value then
  begin
    FDefaultText := Value;
    if not (csLoading in ComponentState) then
      Invalidate;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TCustomVirtualStringTree.SetStringOptions(Value: TVSTOptions);

begin
  if FStringOptions <> Value then
  begin
    FStringOptions := Value;
    Invalidate;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TCustomVirtualStringTree.WMSetFont(var Msg: TWMSetFont);

var
  MemDC: HDC;
  Run: PVirtualNode;
  TM: TTextMetric;

begin
  inherited;
  MemDC := CreateCompatibleDC(0);
  SelectObject(MemDC, Msg.Font);
  GetCharWidth(MemDC, Ord('.'), Ord('.'), FEllipsisWidth);
  FEllipsisWidth := 3 * FEllipsisWidth;
  GetTextMetrics(MemDC, TM);
  FTextHeight := TM.tmHeight;
  DeleteDC(MemDC);

  // need to reset all node widths
  Run := GetFirstNode;
  while Assigned(Run) do
  begin
    PInteger(@Run.Data)^ := 0;
    Run := GetNextNoInit(Run);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TCustomVirtualStringTree.WriteText(Writer: TWriter);

begin
  Writer.WriteWideString(FDefaultText);
end;

//----------------- TCustomVirtualDrawTree -----------------------------------------------------------------------------

procedure TCustomVirtualDrawTree.DoDrawHint(Canvas: TCanvas; Node: PVirtualNode; R: TRect; Column: Integer);

begin
  if Assigned(FOnDrawHint) then
    FOnDrawHint(Self, Canvas, Node, R, Column);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TCustomVirtualDrawTree.DoGetHintSize(Node: PVirtualNode; Column: Integer; var R: TRect);

begin
  if Assigned(FOnGetHintSize) then
    FOnGetHintSize(Self, Node, Column, R);
end;

//----------------------------------------------------------------------------------------------------------------------

function TCustomVirtualDrawTree.DoGetNodeWidth(Node: PVirtualNode; Column: Integer): Integer;

begin
  Result := 4;
  if Assigned(FOnGetNodeWidth) then
    FOnGetNodeWidth(Self, Node, Column, Result);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TCustomVirtualDrawTree.DoPaintNode(Canvas: TCanvas; Node: PVirtualNode; ClippingRect, NodeRect: TRect;
  Column, ColumnIndex: Integer);

begin
  if Assigned(FOnDrawNode) then
    FOnDrawNode(Self, Canvas, Node, ClippingRect, NodeRect, Column);
end;

//----------------------------------------------------------------------------------------------------------------------

initialization
  InitializeGlobalStructures;
finalization
  FinalizeGlobalStructures;
end.
