unit wwriched;
{
//
// Component : TwwDBRichEdit
//
// Copyright (c) 1995, 1996, 1997, 1998 by Woll2Woll Software
//
// 8/13/97 - Support TwwIntl richedit popup captions by updating menu captions
//           in Loaded method.
//
// 9/5/97 - PopupMenuPopup restores original property values so component
//          displays popup correctly when switching back to readonly=false
//
// 10/15/97 - Always set FDataLink.Readonly
//
// 10/29/97 - Call BeginEditing when changing attributes.  This is necessary
//            so that the component will still post even when just the attributes
//            are modified.
// 11/18/97 - Call BeginEditing when changing paragraph attributes
// 1/22/98 - Use TwwIntl setting
// 1/28/98  - Allow Change of text when there is a protected flag in previous richtext.
// 1/29/98 - Add check to see if Datafield is nil to see if this is an unbound case
// 2/6/98 - Default printpagesize changed to 1 from 2
// 4/6/98 - Use International Settings for Alignment
// 4/22/98 - Use richedit's Font charset for any change of font
// 4/28/98 - Support append operation
// 8/24/98 - Support em_findtext even when Delphi FindText is called
// 9/15/98 - Respect Tfield.readonly in change method.
// 9/22/98 - Support patch[1]=True to use RichEdit version 1
// 9/25/98 - Skip change when bringing when using CopyRichEditTo method.
// 9/27/98 - Use Screen.PixelsPerInch instead of 96 in SetEditRect
// 10/6/98 - Prevent richedit from incorrectly going into edit mode
// 10/16/98 - RichEditStrings.Get method no longer returns trailing carriage return
// 10/18/98 - Add support of OLE icons within the richedit text
// 10/30/98 - Restore to default cursor
// 11/4/98 - Workaround Delphi 4 showing bug within tabsheet
// 12/29/98 - Patch[3] Set to True to preserve old behavior of
              allowing ole link to file.  The component does not support this
              so this option is now disabled in the dialog.
// 1/9/99   - Don't allow OLE object to open if readonly
// 2/12/99 - Line spacing of 1.5 or 2 is not recognized.  Workaround by using
//           multiple instead.
// 2/15/99 - Don't use richedit's charset as this prevent's symbol fonts from
//           working
// 2/22/99 - Double-click richedit with OLE disabled on a REadOnly field
//           could cause nil pointer reference.  Problem fixed.
// 3/16/99 - Workaround for bug when assigning streaming a richedit which
//           has exceeded its maxLength.  Previously in this case, the richedit
//           control would lose the richedit formatting.
// 3/30/99 - Support form.print command
// 4/14/99 - Scope should be public so fix for VCL4
// 5/24/99 - RSW - Move before BeginDoc
// 5/29/99 - RSW - Fire OnCloseDialog when the user clicks Save And Exit without
//           making any changes.
}
interface

{$i wwIfDef.pas}

uses
  Windows, WinTypes, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, RichEdit, menus, dbctrls, db, wwstr, wwcommon, printers,
  dbtables, wwintl, extctrls, wwtrackicon, wwtypes, wwrichole, olectnrs, activex,
  {$ifdef wwDelphi5Up}
  word97, oleserver,
  {$endif}
  ShellAPI, OleDlg, buttons, oleconst, grids, wwframe;

const wwTwipsPerInch = 1440;

type
  TwwCustomRichEdit = class;
  TwwRichEditWidth=(rewWindowSize, rewPrinterSize);
  TwwOnRichEditDlgEvent = procedure(Form : TForm) of object;
  TwwURLOpenEvent = procedure(Sender : TwwCustomRichEdit; URLLink: string;
     var UseDefault: boolean) of object;
  TwwMeasurementUnits=(muInches, muCentimeters);
  TwwRichEditParaOption=(rpoAlignment, rpoBullet,
                         rpoLeftIndent, rpoRightIndent, rpoFirstLineIndent, rpoTabs,
                         rpoSpaceBefore, rpoSpaceAfter, rpoLineSpacing);
  TwwRichEditOleOption= (reoAdjustPopupMenu, reoDisableOLE);
  TwwRichEditOleOptions= set of TwwRichEditOleOption;

  TwwRichEditCopyMethod = (recmByMemory, recmByTempFile);

  TwwRichEditParaOptions=Set of TwwRichEditParaOption;
  TwwRichEditPopupOption=(rpoPopupEdit, rpoPopupCut, rpoPopupCopy, rpoPopupPaste,
       rpoPopupBold, rpoPopupItalic, rpoPopupUnderline,
       rpoPopupFont, rpoPopupBullet, rpoPopupParagraph, rpoPopupTabs,
       rpoPopupFind, rpoPopupReplace, rpoPopupInsertObject, rpoPopupMSWordSpellCheck
        );
  TwwRichEditPopupOptions=Set of TwwRichEditPopupOption;

  TwwRichEditOption=(reoShowLoad, reoShowSaveAs, reoShowSaveExit, reoShowPrint, reoShowPageSetup,
                     reoShowFormatBar, reoShowToolBar, reoShowStatusBar,
                     reoShowHints, reoShowRuler, reoShowInsertObject, reoCloseOnEscape,
                     reoFlatButtons, reoShowSpellCheck, reoShowMainMenuIcons);
  TwwRichEditOptions=Set of TwwRichEditOption;

  TwwSpellCheckOption = (reoSpellCheck, reoGrammarCheck, reoGrammarStatistics);
  TwwSpellCheckOptions = set of TwwSpellCheckOption;

  TwwPrintMargins = class(TPersistent)
  private
     FTop, FBottom, FLeft, FRight: Double;
  public
     Procedure Assign(Source: TPersistent); override;
     constructor Create(AOwner: TComponent); virtual;

  published
     property Top: Double read FTop write FTop;
     property Bottom: Double read FBottom write FBottom;
     property Left : Double read FLeft write FLeft;
     property Right : Double read FRight write FRight;
  end;

  TwwParaFormat2 = record
    cbSize: UINT;
    dwMask: DWORD;
    wNumbering: Word;
    wReserved: Word;
    dxStartIndent: Longint;
    dxRightIndent: Longint;
    dxOffset: Longint;
    wAlignment: Word;
    cTabCount: Smallint;
    rgxTabs: array [0..MAX_TAB_STOPS - 1] of Longint;
    dySpaceBefore: Longint;
    dySpaceAfter: Longint;
    dyLineSpacing: Longint;
    sStyle: SmallInt;
    bLineSpacingRule: Byte;
    bCRC: Byte;
    wShadingWeight: word;
    wShadingStyle: word;
    wNumberingStart: word;
    wNumberingStyle: word;
    wNumberingTab: word;
    wBorderSpace: word;
    wBorderWidth: word;
    wBorders: word;
  end;

  TwwRTFNotifyEvent = procedure (Form: TForm; RichEdit: TwwCustomRichEdit;
                                 var DoDefault: boolean) of object;

  TwwCustomRichEdit = class(TCustomRichEdit)
  private
     FAutoURLDetect: boolean;
     FOnURLOpen: TwwURLOpenEvent;
     FLibHandle: THandle;
     FWordWrap: boolean;
     FPrintMargins: TwwPrintMargins;
     FPrintPageSize: integer;
     FEditWidth: TwwRichEditWidth;
     StartingFindPos: integer;
     InResetToStart: boolean;
     DefaultPopupMenu: TPopupMenu;
     PopupEdit, PopupCut, PopupCopy, PopupPaste,
     PopupBold, PopupItalic, PopupUnderline,
     PopupFont, PopupBullet, PopupParagraph, PopupTabs,
     PopupFind, PopupReplace, PopupInsertObject, PopupSpellCheck,
     PopupSep1, PopupSep2, PopupSep3, PopupSep4, PopupSep5: TMenuItem;
     FPopupOptions: TwwRichEditPopupOptions;
     FEditorOptions: TwwRichEditOptions;
     FEditorCaption: string;
     FEditorPosition: TwwFormPosition;
     LastSearchText: string;
     FUnits: TwwMeasurementUnits;
     FOnInitDialog: TwwOnRichEditDlgEvent;
     FOnCloseDialog: TwwOnRichEditDlgEvent;
     FOnCreateDialog: TwwOnRichEditDlgEvent;
     FOnMenuLoadClick : TwwRTFNotifyEvent;
     FOnMenuPrintClick : TwwRTFNotifyEvent;
     FOnMenuSaveAsClick : TwwRTFNotifyEvent;
     FOnMenuSaveAndExitClick : TwwRTFNotifyEvent;
     FLastSetRect: TRect;
     OrigHideSelection: boolean;
     FOLEOptions: TwwRichEditOleOptions;
     FOleSelObject: IOleObject;
     FRichEditCopyMethod: TwwRichEditCopyMethod;
     FUserSpeedButton1: TSpeedButton;
     FUserSpeedButton2: TSpeedButton;
     FPrintJobName: string;
     FTransparent: boolean;
     FHighlightColor: TColor;
     FSpellCheckOptions: TwwSpellCheckOptions;
     FFrame: TwwEditFrame;
     FCanvas: TControlCanvas;

     { OLE support }
     FRichEditOle: IRichEditOLE;
     FRichEditOleCallback: IRichEditOleCallback;
     FObjectVerbs: TStringList;
     OleMenuItemList: TList;
     InParentChanging: boolean;

     ReloadStream: TStream;
     UseReloadStream: boolean;
     NewDataFormat: boolean;

     URLDetectButtonPressed: boolean;
     FVerbMenu: TPopupMenu;

     InitEditRect: boolean;
     FRichEditVersion: integer;
     FLines: TStrings; { Internal FLines list is never really used }

     InMouseUp: boolean;
     SkipChange: boolean;
//     FUseClipboardForSpelling: boolean;
     FGutterWidth: integer;
     OldLineCount, OldCharPos: Integer;

     procedure FindDialog1Close(Sender: TObject);
     procedure FindDialog1Find(Sender: TObject);
     Procedure FindReplaceDlg(
        dialog: TFindDialog; replace: boolean;
        replaceStr: string);
     procedure ReplaceDialog1Replace(Sender: TObject);
     Procedure CreatePopup;
     procedure PopupMenuPopup(Sender: TObject);
     procedure PopupEditclick(Sender: TObject);
     procedure PopupCutClick(Sender: TObject);
     procedure PopupCopyClick(Sender: TObject);
     procedure PopupPasteClick(Sender: TObject);
     procedure PopupFontClick(Sender: TObject);
     procedure PopupParagraphClick(Sender: TObject);
     procedure PopupTabsClick(Sender: TObject);
     procedure PopupBulletClick(Sender: TObject);
     procedure PopupBoldClick(Sender: TObject);
     procedure PopupItalicClick(Sender: TObject);
     procedure PopupUnderlineClick(Sender: TObject);
     procedure PopupFindClick(Sender: TObject);
     procedure PopupReplaceClick(Sender: TObject);
     procedure PopupInsertObjectClick(Sender: TObject);
     procedure PopupSpellCheckClick(Sender: TObject);
     procedure SetWordWrap(val: boolean);
     procedure CreateRuntimeComponents;
     procedure SetPrintPageSize(val: integer);
     function TwipsToPixels(twips: integer): integer;

     procedure WMNCDestroy(var Msg: TMessage); message WM_NCDESTROY;
     procedure SetOleOptions(val: TwwRichEditOleOptions);

     procedure ReadData(Stream: TStream);
     procedure WriteData(Stream: TStream);
     procedure ReadVersion(Reader: TReader);
     procedure WriteVersion(Writer: TWriter);
//     procedure SetTransparent(val: boolean);

     {$ifndef wwDelphi4Up}
     procedure WndProc(var Message: TMessage); override;
     {$endif}
     procedure WMNotify(var Message: TWMNotify); message WM_NOTIFY;
     procedure URLLinkNotification(Link: Pointer);
     procedure SetAutoURLDetect(val: boolean);
//     procedure InheritedCreateParams(var Params: TCreateParams);
     procedure SetUserSpeedButton1(val: TSpeedButton);
     procedure SetUserSpeedButton2(val: TSpeedButton);
     procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBkgnd;
     procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
     procedure SetLines(val: TStrings);
     procedure CNKeyDown(var Message: TWMKeyDown); message CN_KEYDOWN;
     procedure WMChar(var Message: TWMChar); message WM_CHAR;
     procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
    {$ifdef wwdelphi4up}
    procedure CMShowingChanged(var Message: TMessage); message CM_SHOWINGCHANGED;
    {$endif}
  protected
     BoundMode: boolean;
     ScreenPixelsPerInch : integer;
     FFocused: Boolean;

     procedure ClearSelectedBackgroundColor; virtual;
     procedure WriteState(Writer: TWriter); override;
     procedure ReadState(Reader: TReader); override;
     procedure Loaded; override;
     procedure CreateParams(var Params: TCreateParams); override;
     procedure EMFormatRange(var msg:TMessage); message EM_FORMATRANGE;
     procedure SelectionChange; override;
     procedure WMSize(var msg:twmsize); message wm_size;
     function GetReadOnly: Boolean; virtual;
     procedure BeginEditing; virtual;
     procedure UpdateField; virtual;
     procedure CreateWnd; override;
     procedure DestroyWnd; override;
     function GetPopupMenu: TPopupMenu; override;

     procedure DestroyVerbs;
     procedure UpdateVerbs;
     procedure PopupVerbMenuClick(Sender: TObject);
     Function IsMemoLoaded: boolean; virtual;
     procedure DefineProperties(Filer: TFiler); override;
     function GetField: TField; virtual;
     procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
     procedure DoURLOpen(URLLink: string; var UseDefault: boolean); virtual;
     {$ifndef wwDelphi4Up} { 4/14/99 - Scope should be public so fix for VCL4}
     function FindText(const SearchStr: string;
        StartPos, Length: Integer; Options: TSearchTypes): Integer; virtual;
     {$endif}
     procedure LoadPacketsFromStream(
       Stream: TStream; FirstPacketOnly: boolean; AppendMode: boolean); virtual;
     {$ifdef wwDelphi4Up}
     procedure WndProc(var Message: TMessage); override;
     {$endif}
     function isTransparentEffective: boolean; virtual;

  public
     DialogRichEdit: TwwCustomRichEdit;
     RichEditForm: TForm;
     FindDialog1: TFindDialog;
     ReplaceDialog1: TReplaceDialog;
     FontDialog1: TFontDialog;
     FirstLineText: string;
     SkipPaint, SkipErase: boolean;
     Patch: Variant;

//     {$ifdef wwDelphi4Up}
//     function FindText(const SearchStr: string;
//        StartPos, Length: Integer; Options: TSearchTypes): Integer; virtual;
//     {$endif}
     Procedure SetTextBackgroundColor(BackColor: TColor);
     function GetTextBackgroundColor: TColor;
     function FindTextBefore(const SearchStr: string;
        StartPos, Length: Integer; Options: TSearchTypes): Integer; virtual;
     function InsertObjectDialog: Boolean; virtual;
     procedure DoVerb(Verb: Integer);

     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
     function Execute: boolean; virtual;  { shows dialog }
     procedure ExecuteFindDialog; virtual;
     procedure ExecuteReplaceDialog; virtual;
     procedure ExecuteFontDialog; virtual;
     function ExecuteParagraphDialog: boolean; virtual;
     Procedure ExecuteTabDialog; virtual;

     Procedure FindNextMatch; virtual;
     Procedure FindReplace; virtual;
     Function FindReplaceText(SearchText, ReplaceText: string; { New IP 2000 method }
           SearchTypes: TSearchTypes): boolean; virtual;

     procedure SetBullet(val: boolean);
     procedure SetBold(val: boolean);
     procedure SetItalic(val: boolean);
     procedure SetUnderline(val: boolean);
     Function CanPaste: boolean;
     Function CanUndo: boolean;
     Function CanRedo: boolean;
     Function CanCut: boolean;
     Function CanFindNext: boolean;

     Procedure CopyRichEditFromBlob(Field: TField);
     Procedure CopyRichEdittoBlob(Field: TField);
     Procedure CopyRichEditTo(val: TCustomRichEdit);
     Procedure AppendRichEditFrom(val: TCustomRichEdit);
     Procedure SetRichEditFontAttributes(
          FontName: string; FontSize: integer; FontStyle: TFontStyles;
          FontColor: TColor);
     function GetCharSetOfFontName(const FaceName : string) : integer;
     procedure GetParaIndent(var LeftIndent, RightIndent, FirstIndent: integer);
     procedure SetParaFormat(
          Options: TwwRichEditParaOptions;
          alignment: string;
          bulletStyle: boolean;
          leftindent, rightindent, firstlineindent: integer;
          tabCount: integer; tabArray: Pointer;
          SpaceBefore, SpaceAfter, LineSpacing: integer;
          LineSpacingRule: integer);

     Function GetPrinterRect: TRect;
     procedure GetParaFormat(var Format: TwwParaFormat2);
     Function UnitStrToTwips(str: string): integer;  { Convert to twips }
     Function UnitsToTwips(val: double): integer;  { Convert to twips }
     Function FormatUnitStr(val: double): string;  { Append units to number }
     Function RoundedFormatUnitStr(units: double; intervals: integer): string;  { Append units to number }
     Function TwipsToUnits(val: integer): double;
     Procedure DoInitDialog(Form: TForm); virtual;
     Procedure DoCloseDialog(Form: TForm); virtual;
     Procedure DoCreateDialog(Form: TForm); virtual;
     Procedure SetEditRect;
     procedure Print(const Caption: string);
       {$ifdef wwDelphi4Up}override;{$endif}
       {$ifdef ver110}override;{$endif}
     Procedure UpdatePrinter;
     Function ILines: TStrings;
     Function MSWordSpellChecker: boolean;
     Function MSWordPrintDocument(TemplateFileName: string): boolean;
     Procedure GetRTFSelection (DestStream: TStream);
     Procedure PutRTFSelection (SourceStream: TStream);

     property Field: TField read GetField;
     property OleSelObject: IOleObject read FOleSelObject;
     property RichEditOle: IRichEditOLE read FRichEditOle;
     property RichEditOleCallback: IRichEditOleCallback read FRichEditOleCallback;

{ to be published}
    property PopupOptions: TwwRichEditPopupOptions read FPopupOptions write FPopupOptions default
        [rpoPopupEdit, rpoPopupCut, rpoPopupCopy, rpoPopupPaste,
         rpoPopupFind, rpoPopupReplace, rpoPopupInsertObject,
         rpoPopupBullet, rpoPopupFont, rpoPopupParagraph, rpoPopupTabs];
    property EditorOptions: TwwRichEditOptions read FEditorOptions write FEditorOptions default
           [reoShowSaveExit, reoShowPrint, reoShowPageSetup,
            reoShowFormatBar, reoShowToolbar, reoShowStatusBar,
            reoShowHints, reoShowRuler, reoShowInsertObject ,reoCloseOnEscape,
            reoFlatButtons, reoShowMainMenuIcons];

    property RichEditVersion: integer read FRichEditVersion write FRichEditVersion;
    property HighlightColor: TColor read FHighlightColor write FHighlightColor default clYellow;
    property EditorCaption : string read FEditorCaption write FEditorCaption;
    property MeasurementUnits: TwwMeasurementUnits read FUnits write FUnits;
    property OnInitDialog: TwwOnRichEditDlgEvent read FOnInitDialog write FOnInitDialog;
    property OnCloseDialog: TwwOnRichEditDlgEvent read FOnCloseDialog write FOnCloseDialog;
    property OnCreateDialog: TwwOnRichEditDlgEvent read FOnCreateDialog write FOnCreateDialog;
    property PrintMargins: TwwPrintMargins read FPrintMargins write FPrintMargins;
    property EditWidth: TwwRichEditWidth read FEditWidth write FEditWidth default rewWindowSize;
    property EditorPosition: TwwFormPosition read FEditorPosition write FEditorPosition;
    property PrintPageSize : integer read FPrintPageSize write SetPrintPageSize;
    property OleOptions: TwwRichEditOleOptions read FOleOptions write SetOleOptions
              default [reoAdjustPopupMenu];     { publish before lines }
    property RichEditCopyMethod: TwwRichEditCopyMethod read FRichEditCopyMethod
             write FRichEditCopyMethod default recmByMemory;
    property AutoURLDetect: boolean read FAutoURLDetect write SetAutoURLDetect;
    property OnURLOpen: TwwURLOpenEvent read FOnURLOpen write FOnURLOpen;
    property UserSpeedButton1: TSpeedButton read FUserSpeedButton1 write SetUserSpeedButton1;
    property UserSpeedButton2: TSpeedButton read FUserSpeedButton2 write SetUserSpeedButton2;

    {Override so inherited wordwrap is not used in WriteState}
    property WordWrap : boolean read FWordWrap write SetWordWrap default True;
    property PlainText;
    property Frame: TwwEditFrame read FFrame write FFrame;
    property PrintJobName: string read FPrintJobName write FPrintJobName;
    property GutterWidth : integer read FGutterWidth write FGutterWidth default 3;
    property Transparent: boolean read FTransparent write FTransparent default false;
    property SpellCheckOptions: TwwSpellCheckOptions read FSpellCheckOptions write FSpellCheckOptions default
                 [reoSpellCheck, reoGrammarCheck];
    property OnMenuLoadClick : TwwRTFNotifyEvent read FOnMenuLoadClick write FOnMenuLoadClick;
    property OnMenuPrintClick : TwwRTFNotifyEvent read FOnMenuPrintClick write FOnMenuPrintClick;
    property OnMenuSaveAsClick : TwwRTFNotifyEvent read FOnMenuSaveAsClick write FOnMenuSaveAsClick;
    property OnMenuSaveAndExitClick : TwwRTFNotifyEvent read FOnMenuSaveAndExitClick write FOnMenuSaveAndExitClick;

  published
    property ScrollBars;  { Publish before Lines as this causes recreatewnd }

//    property Lines stored False;  { Backwards compatibility } //Required to be published for proper streaming }
    property Lines: TStrings read FLines write SetLines stored False;

  end;

  TwwRulerPanel = class(TPanel)
    private
      Function TwipsToPixels(Twips: integer): integer;
      Function PrinterPixelsToTwipsX(pixels: integer): integer;
      Function PixelsToTwipsX(pixels: integer): integer;

    protected
      procedure Paint; override;
    public
      RulerRect: TRect;
      LeftDragButton: TwwTrackIcon;
      RightDragButton: TwwTrackIcon;
      FirstLineDragButton: TwwTrackIcon;

      procedure UpdateDragIcons;
      procedure UpdateSize(DialogRichEdit: TwwCustomRichEdit);
      procedure UpdateRulerProp(Sender: TObject);
  end;

  TwwDBRichEdit = class(TwwCustomRichEdit)
  private
    FDataLink: TFieldDataLink;
    FAutoDisplay: Boolean;
    FMemoLoaded: Boolean;
    FDataSave: string;


    Function isBlob: boolean;
    procedure DataChange(Sender: TObject);
    procedure EditingChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    {$ifndef wwDelphi4Up} { Move to protected in IP 5 }
    function GetField: TField; override;
    {$endif}
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetReadOnly(Value: Boolean);
    procedure SetAutoDisplay(Value: Boolean);
    procedure SetFocused(Value: Boolean);
    procedure UpdateData(Sender: TObject);
    procedure WMCut(var Message: TMessage); message WM_CUT;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
  protected
    procedure BeginEditing; override;
    procedure Change; override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    function GetReadOnly: Boolean; override;
    procedure UpdateField; override;
    procedure SetParent(AParent: TWinControl); override;
    procedure CreateWnd; override;
    Function IsMemoLoaded: boolean; override;
    function GetField: TField; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadMemo;
    procedure LoadBlobStart(Field: TField);
  published
    {$ifdef wwDelphi4Up}
    property Anchors;
    property Constraints;
    {$endif}

    property Align;
    property Alignment;
    property AutoURLDetect;
    property AutoDisplay: Boolean read FAutoDisplay write SetAutoDisplay default True;
    property BorderStyle;
    property Color;
    property Ctl3D;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property Frame;
//    property GutterWidth;
    property HideSelection;
    property HideScrollBars;
    {$ifdef wwDelphi3Up}
    property ImeMode;
    property ImeName;
    {$endif}
    property MaxLength;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property OleOptions;
    property Transparent;
    property SpellCheckOptions;
//    property RichEditCopyMethod;
    property UserSpeedButton1;
    property UserSpeedButton2;
    property HighlightColor;

{    property PlainText;}
    property PopupMenu;
    property PrintJobName;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
//    property ScrollBars;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property WantReturns;
    property WantTabs;
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
    property OnResizeRequest;
    property OnSelectionChange;
    property OnProtectChange;
    property OnSaveClipboard;
    property OnStartDrag;

    property PopupOptions;
    property EditorOptions;
    property EditorCaption;
    property EditorPosition;
    property MeasurementUnits;
    property PrintMargins;
    property EditWidth;
    property OnInitDialog;
    property OnCloseDialog;
    property OnCreateDialog;
    property OnURLOpen;
    property OnMenuLoadClick;
    property OnMenuPrintClick;
    property OnMenuSaveAsClick;
    property OnMenuSaveAndExitClick;
  end;

  TwwCharFormat2 = record
    cbSize: UINT;
    dwMask: Longint;
    dwEffects: Longint;
    yHeight: Longint;
    yOffset: Longint;
    crTextColor: TColorRef;
    bCharSet: Byte;
    bPitchAndFamily: Byte;
    szFaceName: array[0..LF_FACESIZE - 1] of AnsiChar;
    wWeight: Word;
    sSpacing: Shortint;
    crBackColor: TColorRef;
    lcid: longint;
    dwReserved: longint;
    style: shortint;
    wKerning: word;
    bUnderlineType: byte;
    bAnimation: byte;
    bRevAuthor: byte;
    bReserved1: byte;
  end;
{
  Typedef struct _charformat2
    UINT        cbSize;
    DWORD       dwMask;
    DWORD       dwEffects;
    LONG        yHeight;
    LONG        yOffset;
    COLORREF    crTextColor;
    BYTE        bCharSet;
    BYTE        bPitchAndFamily;
    WCHAR       szFaceName[LF_FACESIZE];
    WORD        wWeight;
    SHORT       sSpacing;
    COLORREF    crBackColor;
    LCID        lcid;
    DWORD       dwReserved;
    SHORT       sStyle;
    WORD        wKerning;
    BYTE        bUnderlineType;
    BYTE        bAnimation;
    BYTE        bRevAuthor;
    BYTE        bReserved1;
 CHARFORMAT2;
}
procedure Register;

implementation

uses consts, comstrs, wwrich, wwrchdlg, wwrichtb, comobj, clipbrd, wwricholecallback;

{1/28/98  - Allow Change of text when there is a protected flag in previous richtext.}
type
  TRichProtectClass = class(TObject)
     procedure RichProtectChange(Sender: TObject; StartPos,
       EndPos: Integer; var AllowChange: Boolean);
  end;

{ TwwDBRichEdit }

  { The following class is for the sole purpose of avoiding
    the incompatibility of the Delphi TRichEditStrings.insert method
    with RichEdit version 2.
    We have removed the exception raised at the end. }
  TwwRichEditStrings = class(TStrings)
  private
    RichEdit: TwwCustomRichEdit;
    procedure EnableChange(const Value: Boolean);
  protected
    function Get(Index: Integer): string; override;
    function GetCount: Integer; override;
    procedure Put(Index: Integer; const S: string); override;
    procedure SetUpdateState(Updating: Boolean); override;
    procedure SetTextStr(const Value: string); override;
  public
    procedure Clear; override;
    procedure AddStrings(Strings: TStrings); override;
    procedure Delete(Index: Integer); override;
    procedure Insert(Index: Integer; const S: string); override;
    procedure LoadFromFile(const FileName: string); override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToFile(const FileName: string); override;
    procedure SaveToStream(Stream: TStream); override;
  end;

procedure TwwRichEditStrings.LoadFromFile(const FileName: string);
begin
   RichEdit.ILines.LoadFromFile(FileName);
end;

procedure TwwRichEditStrings.LoadFromStream(Stream: TStream);
begin
   RichEdit.ILines.LoadFromStream(Stream);
end;

procedure TwwRichEditStrings.SaveToFile(const FileName: string);
begin
   RichEdit.ILines.SaveToFile(FileName);
end;

procedure TwwRichEditStrings.SaveToStream(Stream: TStream);
begin
   RichEdit.ILines.SaveToStream(Stream);
end;

procedure TwwCustomRichEdit.SetLines(val: TStrings);
begin
   ILines.Assign(val);
end;

procedure TwwRichEditStrings.AddStrings(Strings: TStrings);
var
  SelChange: TNotifyEvent;
begin
  SelChange := RichEdit.OnSelectionChange;
  RichEdit.OnSelectionChange := nil;
  try
    inherited AddStrings(Strings);
  finally
    RichEdit.OnSelectionChange := SelChange;
  end;
end;

function TwwRichEditStrings.GetCount: Integer;
begin
  Result := SendMessage(RichEdit.Handle, EM_GETLINECOUNT, 0, 0);
  if SendMessage(RichEdit.Handle, EM_LINELENGTH, SendMessage(RichEdit.Handle,
    EM_LINEINDEX, Result - 1, 0), 0) = 0 then Dec(Result);
end;

function TwwRichEditStrings.Get(Index: Integer): string;
var
  Text: array[0..4095] of Char;
  L: Integer;
begin
  Word((@Text)^) := SizeOf(Text);
  L := SendMessage(RichEdit.Handle, EM_GETLINE, Index, Longint(@Text));
  if (L>1) and (Text[L - 2] = #13) and (Text[L - 1] = #10) then Dec(L, 2); { 10/16/98 }
  if (L>0) and (Text[L - 1] = #13) then Dec(L, 1); { 10/16/98}
  SetString(Result, Text, L);
end;

procedure TwwRichEditStrings.Put(Index: Integer; const S: string);
var
  Selection: TCharRange;
begin
  if Index >= 0 then
  begin
    Selection.cpMin := SendMessage(RichEdit.Handle, EM_LINEINDEX, Index, 0);
    if Selection.cpMin <> -1 then
    begin
      Selection.cpMax := Selection.cpMin +
        SendMessage(RichEdit.Handle, EM_LINELENGTH, Selection.cpMin, 0);
      SendMessage(RichEdit.Handle, EM_EXSETSEL, 0, Longint(@Selection));
      SendMessage(RichEdit.Handle, EM_REPLACESEL, 0, Longint(PChar(S)));
    end;
  end;
end;

procedure TwwRichEditStrings.Insert(Index: Integer; const S: string);
var
  L: Integer;
  Selection: TCharRange;
  Fmt: PChar;
  Str: string;
begin
  if Index >= 0 then
  begin
    Selection.cpMin := SendMessage(RichEdit.Handle, EM_LINEINDEX, Index, 0);
    if Selection.cpMin >= 0 then Fmt := '%s'#13#10
    else begin
      Selection.cpMin :=
        SendMessage(RichEdit.Handle, EM_LINEINDEX, Index - 1, 0);
      if Selection.cpMin < 0 then Exit;
      L := SendMessage(RichEdit.Handle, EM_LINELENGTH, Selection.cpMin, 0);
      if L = 0 then Exit;
      Inc(Selection.cpMin, L);
      Fmt := #13#10'%s';
    end;
    Selection.cpMax := Selection.cpMin;
    SendMessage(RichEdit.Handle, EM_EXSETSEL, 0, Longint(@Selection));
    Str := Format(Fmt, [S]);
    SendMessage(RichEdit.Handle, EM_REPLACESEL, 0, LongInt(PChar(Str)));

//   if RichEdit.SelStart <> (Selection.cpMax + Length(Str)) then
//      raise EOutOfResources.Create(sRichEditInsertError);
  end;
end;

procedure TwwRichEditStrings.Delete(Index: Integer);
begin
  RichEdit.ILines.Delete(Index);
end;

procedure TwwRichEditStrings.Clear;
begin
  RichEdit.Clear;
end;

procedure TwwRichEditStrings.SetUpdateState(Updating: Boolean);
begin
  if RichEdit.Showing then
    SendMessage(RichEdit.Handle, WM_SETREDRAW, Ord(not Updating), 0);
  if not Updating then begin
    RichEdit.Refresh;
    RichEdit.Perform(CM_TEXTCHANGED, 0, 0);
  end;
end;

procedure TwwRichEditStrings.EnableChange(const Value: Boolean);
var
  EventMask: Longint;
begin
  with RichEdit do
  begin
    if Value then
      EventMask := SendMessage(Handle, EM_GETEVENTMASK, 0, 0) or ENM_CHANGE
    else
      EventMask := SendMessage(Handle, EM_GETEVENTMASK, 0, 0) and not ENM_CHANGE;
    SendMessage(Handle, EM_SETEVENTMASK, 0, EventMask);
  end;
end;

procedure TwwRichEditStrings.SetTextStr(const Value: string);
begin
  EnableChange(False);
  try
    inherited SetTextStr(Value);
  finally
    EnableChange(True);
  end;
end;

{ Advise sink to detect when OLE object is changed }
type
  TwwAdviseSinkChange = (asData, asView, asRename, asSave, asClose);
  TwwRichEditAdviseSink = class(TInterfacedObject, IAdviseSink)
  protected
    // IAdviseSink
    procedure OnDataChange(const formatetc: TFormatEtc;
      const stgmed: TStgMedium); stdcall;
    procedure OnViewChange(dwAspect: Longint; lindex: Longint); stdcall;
    procedure OnRename(const mk: IMoniker); stdcall;
    procedure OnSave; stdcall;
    procedure OnClose; stdcall;

    procedure Change(Change: TwwAdviseSinkChange); virtual;
  public
    Owner: TComponent;
    Connection: integer;
    constructor Create(AOwner: TComponent); virtual;
    destructor Destroy; override;
  end;



{$WARNINGS OFF}
function EditSelectStreamInCallback(dwCookie: Longint; pbBuff: PByte;
  cb: Longint; var pcb: Longint): Longint; Stdcall;
var
  theStream: TStream;
  dataAvail: LongInt;
begin
  theStream := TStream(dwCookie);
  with theStream do begin
    dataAvail := Size - Position;
    Result := 0; {assume everything is ok}
    if dataAvail <= cb then begin
      pcb := Read(pbBuff^, dataAvail);
      if pcb <> dataAvail then {couldn't read req. amount of bytes}
         result := E_FAIL;
    end
    else begin
      pcb := Read(pbBuff^, cb);
      if pcb <> cb then
        result := E_FAIL;
    end;
  end;
end;
{$WARNINGS ON}


Function EditSelectStreamOutCallback(dwCookie: Longint; pbBuff: PByte;
     cb: Longint; var pcb: Longint): Longint; stdcall;
var
  theStream: TStream;
begin
  theStream := TStream(dwCookie);

  with theStream do begin
    If cb > 0 Then
      pcb := Write(pbBuff^, cb);
    Result := 0;
  end;
end;

{ Extracts richedit's current selection into a stream }
Procedure TwwCustomRichEdit.GetRTFSelection (DestStream: TStream);
var editstream: TEditStream;
Begin
  with editStream Do begin
    dwCookie:= Longint(DestStream);
    dwError:= 0;
    pfnCallback:= EditSelectStreamOutCallBack;
  end;
  Perform( EM_STREAMOUT, SF_RTF or SFF_SELECTION, longint(@editstream));
end;

{ Replaces richedit's current seelction with characters from stream }
Procedure TwwCustomRichEdit.PutRTFSelection (sourceStream: TStream);
var
  editstream: TEditStream;
Begin
  sourceStream.Position := 0;
  With editstream Do Begin
    dwCookie:= Longint(sourceStream);
    dwError:= 0;
    pfnCallback:= EditSelectStreamInCallBack;
  end;
  Perform( EM_STREAMIN, SF_RTF or SFF_SELECTION, longint(@editstream));
end;


destructor TwwRichEditAdviseSink.Destroy;
begin
   inherited Destroy;
end;

constructor TwwRichEditAdviseSink.Create(AOwner: TComponent);
begin
   Owner:= AOwner;
//   _AddRef;
end;

procedure TwwRichEditAdviseSink.OnDataChange(const formatetc: TFormatEtc;
  const stgmed: TStgMedium);
begin
  Change(asData);
end;

procedure TwwRichEditAdviseSink.OnViewChange(dwAspect: Longint; lindex: Longint);
begin
  Change(asView);
end;

procedure TwwRichEditAdviseSink.OnRename(const mk: IMoniker);
begin
  Change(asRename);
end;

procedure TwwRichEditAdviseSink.OnSave;
begin
  Change(asSave);
end;

procedure TwwRichEditAdviseSink.OnClose;
begin
  Change(asClose);
end;

procedure TwwRichEditAdviseSink.Change(Change: TwwAdviseSinkChange);
begin
  if Change = asSave then begin
    with (Owner as TwwDBRichEdit) do
    begin
//       FOleSelObject.UnAdvise(Connection);
       BeginEditing;
       Fdatalink.modified;
       Modified:= True;
    end;
  end;
end;

constructor TwwDBRichEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FVerbMenu := TPopupMenu.Create(self);
  FAutoDisplay := True;
  FDataLink := TFieldDataLink.Create;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.OnUpdateData := UpdateData;
  RichEditCopyMethod:= recmByMemory;
  OleMenuItemList:= TList.create;
  OleOptions:= [reoAdjustPopupMenu];
  GutterWidth:= 3;
  FObjectVerbs:= TStringList.create;
  SpellCheckOptions:= [reoSpellCheck, reoGrammarCheck];

  Patch:= VarArrayCreate([0, 6], varVariant);
  Patch[0]:= False; { 8/24/98 - Used when em_findtext within WndProc }
  Patch[1]:= False; { 9/22/98 - When True use Rich Edit Version 1}
  Patch[2]:= False; { 11/4/98 - Set to True to disable Delphi 4 bug fix in CmShowingChanged }
  Patch[3]:= False; { 12/29/98 - Set to True to preserve old behavior of
                      allowing ole link to file.  The component does not support this
                      so this option is now disabled in the dialog.}
  Patch[4]:= False; { 2/15/99 - Set to True to preserve old behavior of
                      setting CharSet }
  Patch[5]:= 0; // Connection to AdviseSink
  Patch[6]:= False; { Set to True to disable new OLEAdvise behavior for checking if changed }
end;

destructor TwwDBRichEdit.Destroy;
var i: integer;
begin
  FDataLink.Free;
  FDataLink := nil;
  for i:= 0 to OleMenuItemList.count-1 do TMenuItem(OleMenuItemList[i]).Free;
  OleMenuItemList.Free;
  DestroyVerbs;
  FObjectVerbs.Free;

  inherited Destroy;
end;

procedure TwwDBRichEdit.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) then
  begin
     if (FDataLink <> nil) and (AComponent = DataSource) then DataSource := nil;
     if (AComponent = FUserSpeedButton1) then FUserSpeedButton1:= nil;
     if (AComponent = FUserSpeedButton2) then FUserSpeedButton2:= nil;
  end
end;

procedure TwwDBRichEdit.BeginEditing;
begin
  if (FDataLink.Field=Nil) then exit;
  if not FDataLink.Editing then
  try
    if isBlob then
      FDataSave := FDataLink.Field.AsString;
    FDataLink.Edit;

    { Change not fired if in grid }
    if IsInGrid(self) and (not GetReadOnly) and FDataLink.Editing then
    begin
        FDataLink.Modified;
    end;

  finally
    FDataSave := '';
  end;
end;

type
  TCheatGridCast = class(TCustomGrid);

procedure TwwDBRichEdit.KeyDown(var Key: Word; Shift: TShiftState);
var parentGrid: TCustomGrid;
  procedure SendToParent;
  begin
    ParentGrid.setFocus;

    { If grid does not have focus then SetFocus raised exception }
    if ParentGrid.focused then  { 7/2/98 }
       TCheatGridCast(ParentGrid).KeyDown(Key, Shift);
    Key := 0;
  end;

  procedure ParentEvent;
  var
    GridKeyDown: TKeyEvent;
  begin
    { 1/25/99 - Prevent grid's OnKeyDown from firing twice when encounter tab or cr }
    if (Screen.ActiveControl<>self) and ((key=13) or (key=9)) then exit;

    GridKeyDown := TCheatGridCast(ParentGrid).OnKeyDown;
    if Assigned(GridKeyDown) then GridKeyDown(ParentGrid, Key, Shift);
  end;

  function Ctrl: Boolean;
  begin
    Result := ssCtrl in Shift;
  end;

  function Alt: Boolean;
  begin
    Result := ssAlt in Shift;
  end;


begin
  if (parent is TCustomGrid) then
  begin
     parentGrid:=  (parent as TCustomGrid);

     case Key of
       VK_ESCAPE: if not modified then SendToParent;
       VK_UP, VK_DOWN, VK_NEXT, VK_PRIOR: if (not Alt) then SendToParent;
       VK_HOME: if Ctrl then SendToParent;
       VK_END: if Ctrl then SendToParent;
     end
  end;

  inherited KeyDown(Key, Shift);

  if (key=vk_f2) and (rpoPopupEdit in PopupOptions) {and not visible }then
  begin
     Execute;
     key:= 0;
  end;

  if (key=vk_insert) and (ssShift in Shift) then
     if (not CanPaste) then
     Key:= 0;
  if (key=ord('V')) and (ssCtrl in Shift) then
     if (not CanPaste) then
     Key:= 0;

  if (FDataLink.Field=Nil) then exit;
  if FMemoLoaded then
  begin
    if (Key = VK_DELETE) or (Key = VK_BACK) or
      ((Key = VK_INSERT) and (ssShift in Shift)) or
      (((Key = Ord('V')) or (Key = Ord('X'))) and (ssCtrl in Shift)) then
      BeginEditing
    else if (key=vk_return) then begin
       if WantReturns then BeginEditing
       else begin
          selStart:= 0;
          selLength:= 0;
          key:= 0;
       end
    end
  end;
end;

procedure TwwDBRichEdit.KeyPress(var Key: Char);
begin
  if (key=#9) and (not WantTabs) then begin
     key:= #0;  { Never process tabs,
                  Delphi 5 passes this to us if multi-line enabled so we need to handle it }
     exit;
  end;
  inherited KeyPress(Key);
  if (FDataLink.Field=Nil) then exit;
  if FMemoLoaded then
  begin
    if (Key in [#32..#255]) and (FDataLink.Field <> nil) and
      not FDataLink.Field.IsValidChar(Key) then
    begin
      MessageBeep(0);
      Key := #0;
    end;
    case Key of
      ^H, ^I, ^J, ^M, ^V, ^X, #32..#255:
        begin
          BeginEditing;
        end;
      #27:
        FDataLink.Reset;
    end;
  end else
  begin
    if Key = #13 then LoadMemo;
    Key := #0;
  end;
end;

procedure TwwDBRichEdit.Change;
begin
  if IsTransparentEffective and (not FFocused) then
  begin
     Frame.RefreshTransparentText;
     parent.update; { May be necessary in recordviewdialog }
  end;

  if (FDataLink.Field<>Nil) then
  begin
     if FMemoLoaded and (not SkipChange) and (not InParentChanging) then
     begin
        if (not GetReadOnly) then { 9/15/98 - Don't go into edit mode if readonly }
        begin
           BeginEditing;
           FDataLink.Modified;
        end
     end
  end;
  inherited Change;
end;

function TwwDBRichEdit.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TwwDBRichEdit.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TwwDBRichEdit.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TwwDBRichEdit.SetDataField(const Value: string);
begin
  if (Value<>'') then begin
     if  (Value<>FDataLink.FieldName) then
        inherited ReadOnly := True;
     BoundMode:= True;
  end
  else begin
     inherited ReadOnly:= ReadOnly; // 6/10/98
     BoundMode:= False;
  end;
  FDataLink.FieldName := Value;
end;

function TwwDBRichEdit.GetReadOnly: Boolean;
begin     {1/29/98 - Add check to see if Datafield is nil to see if
                     this is an unbound case}
  if (FDataLink.Field=Nil) and (DataField = '') then
       Result:= inherited ReadOnly
  else begin
     Result := FDataLink.ReadOnly or
               ((not wwIsDesigning(self)) and
//              ((not (csDesigning in ComponentState)) and { 9/3/98 }
               (FDatalink.Field<>Nil) and
               (FDataLink.DataSet<>Nil) and
               { 9/15/98 - Check Field.ReadOnly too}
               ((not Fdatalink.Field.Dataset.CanModify) or FDataLink.Field.ReadOnly));
  end
end;

procedure TwwCustomRichEdit.BeginEditing;
begin
end;

procedure TwwCustomRichEdit.UpdateField;
begin
end;

function TwwCustomRichEdit.GetReadOnly: Boolean;
begin
   result:= inherited ReadOnly
end;

procedure TwwDBRichEdit.SetReadOnly(Value: Boolean);
begin
  if (FDataLink.Field=Nil) then inherited ReadOnly:= Value;
  {10/15/97 - Always set FDataLink.Readonly }
  if (FDataLink<>Nil) then FDataLink.ReadOnly := Value;
end;

function TwwDBRichEdit.GetField: TField;
begin
  Result := FDataLink.Field;
end;

function TwwCustomRichEdit.GetField: TField;
begin
  Result := nil;
end;

procedure TwwDBRichEdit.LoadMemo;
var LastProtectChange:TRichEditProtectChange;
    rpc:TRichProtectClass;
    PrevCursor: TCursor;
    OldSkipChange: boolean;
begin
  if (FDataLink.Field=Nil) then exit;
  if not FMemoLoaded and Assigned(FDataLink.Field) and isBlob then
  begin
    OldSkipChange:= SkipChange;
    SkipChange:= True;

    PrevCursor:= Screen.Cursor;
    try try
      {1/28/97 - Allow Change of text when there is a protected flag in richtext to handle
                 TRichEdit bug.}
      LastProtectChange := OnProtectChange;
      rpc:=TRichProtectClass.Create;
      OnProtectChange:= rpc.RichProtectChange;


      { 6/8/98 - Faster than assign Lines.Assign}
      FMemoLoaded := True;  { Set to true immediately so wmpaint won't repaint repeatedly }

//      Screen.Cursor:= crHourGlass;  { Distracting when scrolling the grid }
      CopyRichEditFromBlob(FDataLink.Field);
//      Screen.Cursor:= PrevCursor;

      OnProtectChange:= LastProtectChange;
      rpc.Free;

      { 11/10/97 - If blank, then restore default setting }
      if FDatalink.field.asstring='' then begin
         Paragraph.Numbering:= nsNone;
         Paragraph.alignment:= taLeftJustify;
         DefAttributes.color:= clBlack;
      end;

    except
      { Rich Edit Load failure }
      on E:EOutOfResources do
        ILines.Text := Format('(%s)', [E.Message]);
    end
    finally
      Screen.Cursor:= PrevCursor;
      SkipChange:= OldSkipChange;
    end;
    EditingChange(Self);
    modified:= False; { 5/10/97}
  end;
end;

procedure TwwDBRichEdit.DataChange(Sender: TObject);
begin
  if FDataLink.Field <> nil then begin
    if isBlob then
    begin
      if FAutoDisplay or (FDataLink.Editing and FMemoLoaded) then
      begin
        { Check if the data has changed since we read it the first time }
        if (FDataSave <> '') and (FDataSave = FDataLink.Field.AsString) then Exit;
        FMemoLoaded := False;
        if visible then LoadMemo;
      end else
      begin
        FMemoLoaded := False;
        Text := Format('(%s)', [FDataLink.Field.DisplayLabel]);
      end;
    end
    else begin
      FMemoLoaded := False;
      if FFocused and FDataLink.CanModify then
        Text := FDataLink.Field.Text
      else
        Text := FDataLink.Field.DisplayText;
      FMemoLoaded := True;
    end
  end
  else begin
    if csDesigning in ComponentState then Text := Name else Text := '';
    FMemoLoaded := False;
  end;

//  if HandleAllocated then
//    RedrawWindow(Handle, nil, 0, RDW_INVALIDATE or RDW_ERASE or RDW_FRAME);
end;

procedure TwwDBRichEdit.EditingChange(Sender: TObject);
begin
  if (FDataLink.Field=Nil) then exit;
  inherited ReadOnly := not (FDataLink.Editing and FMemoLoaded);
end;

procedure TwwDBRichEdit.UpdateData(Sender: TObject);
begin
   UpdateField;
end;

procedure TwwDBRichEdit.UpdateField;
begin
  if (FDataLink.Field=Nil) then exit;
  if modified and FMemoLoaded then
  begin
    if IsBlob then
      FDataLink.Field.Assign(ILines) else
      FDataLink.Field.AsString := Text;
  end
end;

procedure TwwDBRichEdit.SetFocused(Value: Boolean);
begin
  if FFocused <> Value then
  begin
    FFocused := Value;
    if (FDataLink.Field=Nil) then exit;
    if not Assigned(FDataLink.Field) or not isBlob then
      FDataLink.Reset;
  end;
end;

function TwwCustomRichEdit.isTransparentEffective: boolean;
begin
   result:= Frame.Transparent and Frame.IsFrameEffective and
      not wwIsDesigning(self)
end;

procedure TwwDBRichEdit.CMEnter(var Message: TCMEnter);
var
    r: TRect;
    exStyle, origStyle: longint;
begin

  SetFocused(True);
  inherited;

  if IsTransparentEffective then begin
//     Frame.CreateTransparent:= False;
     OrigStyle:= Windows.GetWindowLong(handle, GWL_EXSTYLE);
     exStyle:= OrigStyle and not WS_EX_TRANSPARENT;
     Windows.SetWindowLong(handle, GWL_EXSTYLE, exStyle);
     SetEditRect;
     invalidate;
  end;

  if Frame.enabled then begin
     if IsTransparentEffective then begin
        r:= BoundsRect;
        InvalidateRect(Parent.Handle, @r, False);
     end;
     invalidate;
  end;

end;

procedure TwwDBRichEdit.CMExit(var Message: TCMExit);
var
//    r: TRect;
    exStyle, origStyle: longint;
begin
  if (FDataLink.Field<>Nil) then begin
    try
      FDataLink.UpdateRecord;
    except
      SetFocus;
      raise;
    end;
  end;
  SetFocused(False);
  inherited;

  if IsTransparentEffective then begin
//     Frame.CreateTransparent:= True;
     OrigStyle:= Windows.GetWindowLong(handle, GWL_EXSTYLE);
     exStyle:= OrigStyle or WS_EX_TRANSPARENT;
     Windows.SetWindowLong(handle, GWL_EXSTYLE, exStyle);
     invalidate;
  end;

  if Frame.enabled then begin
     Frame.RefreshTransparentText(True);
//     invalidate; { See if this causes any flicker }
{     if IsTransparentEffective then begin
        r:= BoundsRect;
        InvalidateRect(Parent.Handle, @r, False);
     end;}
//     invalidate;
  end;
end;

procedure TwwDBRichEdit.SetAutoDisplay(Value: Boolean);
begin
  if (FDataLink.Field=Nil) then exit;
  if FAutoDisplay <> Value then
  begin
    FAutoDisplay := Value;
    if Value then LoadMemo;
  end;
end;

procedure TwwDBRichEdit.WMLButtonDblClk(var Message: TWMLButtonDblClk);
var ReObject: TReObject;
    TmpConn: Integer;
begin
  if (FDataLink.Field<>Nil) and (not FMemoLoaded) then LoadMemo
  else begin
     if Assigned(FRichEditOLE) then begin

        FillChar(ReObject, SizeOf(TReObject), 0);
        ReObject.cbStruct:= sizeof(TReObject);

        {$WARNINGS OFF}
        if (FRichEditOle.GetObject(REO_IOB_SELECTION, ReObject, REO_GETOBJ_POLEOBJ) = S_OK) and
           (Assigned(ReObject.oleobj)) then
        {$WARNINGS ON}
        begin
           if (Reobject.dwflags and REO_INPLACEACTIVE) <>0 then ShowMessage('');

           if (not ReadOnly) and (Patch[6]=False) then
           begin
              FOleSelObject:= ReObject.OleObj;
//              if Patch[5]<>0 then FOleSelObject.Unadvise(patch[5]);
              FOleSelObject.Advise(TwwRichEditAdviseSink.create(self), TmpConn);
//              Patch[5] := TmpConn;
              inherited;
           end
           else if not ReadOnly then inherited
           { 1/9/99, 2/22/99 - Else Don't allow OLE object to open if readonly }
        end
        else inherited;
     end
     else inherited;
  end;
end;

procedure TwwDBRichEdit.WMCut(var Message: TMessage);
begin
  if (FDataLink.Field<>Nil) then BeginEditing;
  inherited;
end;

procedure TwwDBRichEdit.WMPaste(var Message: TMessage);
begin
  if (FDataLink.Field<>Nil) then BeginEditing;
  inherited;
end;

procedure TwwDBRichEdit.CMGetDataLink(var Message: TMessage);
begin
  if (FDataLink.Field=Nil) then exit;
  Message.Result := Integer(FDataLink);
end;

{ 4/22/98 }
{ 2/15/99 - Don't use richedit's charset as this prevent's symbol fonts from working}
{$ifndef wwDelphi3UpXXX}
function EnumFontProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
         FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  PWord(Data)^ := LogFont.lfCharSet;
  Result := 0;
end;

function TwwCustomRichEdit.GetCharSetOfFontName(const FaceName : string) : integer;
var
  Flag: Word;
  DC: HDC;
begin
//  result := -1;
  result:= Font.charset; {2/15/99 }
  if Patch[4]=True then exit;

  Flag := $8000;
  DC := GetDC(0);
  EnumFontFamilies(DC, PChar(FaceName), @EnumFontProc, LPARAM(@Flag));
  ReleaseDC(0, DC);
  if Flag <> $8000 then
    Result := LoByte(Flag);
end;
{$else}
function TwwCustomRichEdit.GetCharSetOfFontName(const FaceName : string) : integer;
begin
   result:= Font.charset;
end;
{$endif}


constructor TwwCustomRichEdit.Create(AOwner: TComponent);
var DC: HDC;
begin
   inherited Create(AOwner);

   EditWidth:= rewWindowSize;
   FPrintMargins:=  TwwPrintMargins.create(self);
   PrintPageSize:= 1; { 2/6/98 - Used to be 2, not all printers support 2 }

   PopupOptions:= [rpoPopupEdit, rpoPopupCut, rpoPopupCopy, rpoPopupPaste,
         rpoPopupFind, rpoPopupReplace, rpoPopupInsertObject,
         rpoPopupBullet, rpoPopupFont, rpoPopupParagraph, rpoPopupTabs];

   EditorOptions:=
         [reoShowSaveExit, reoShowPrint, reoShowPageSetup,
            reoShowFormatBar, reoShowToolbar, reoShowStatusBar,
            reoShowHints, reoShowRuler, reoShowInsertObject, reoCloseOnEscape,
            reoFlatButtons, reoShowMainMenuIcons];

   EditorCaption:= 'Edit Rich Text';
   FWordWrap:= True;
   FUnits:= muInches;

   CreateRunTimeComponents;

   DC := GetDC(0);
   ScreenPixelsPerInch := GetDeviceCaps(DC, LOGPIXELSY);
   ReleaseDC(0, DC);

   FRichEditOleCallback:= TRichEditOleCallback.Create(Self);
   FRichEditVersion:= 2;

  FEditorPosition:= TwwFormPosition.create;
  with FEditorPosition do begin
     Left:= 0;  { Auto-center }
     Top:= 0;   { Auto-center }
     Width:= 0;  { Auto-size }
     Height:= 0; { Auto-size }
  end;

  FPrintJobName:= Application.Title;

  FLines:= TwwRichEditStrings.create;
  TwwRichEditStrings(FLines).RichEdit:=self;

  FHighlightColor:= clYellow;

  FFrame:= TwwEditFrame.create(self);


end;

procedure TwwCustomRichEdit.CreateRunTimeComponents;
begin
   if (csDesigning in Componentstate) then exit;

   FindDialog1:= TFindDialog.create(self);
   with FindDialog1 do begin
     Options := [frHideUpDown, frReplace, frReplaceAll];
     OnFind := FindDialog1Find;
     {$ifdef wwDelphi3Up}
     OnClose := FindDialog1Close;
     {$endif}
   end;

   ReplaceDialog1:= TReplaceDialog.create(self);
   with ReplaceDialog1 do begin
      OnReplace:= ReplaceDialog1Replace;
      OnFind := FindDialog1Find;
     {$ifdef wwDelphi3Up}
      OnClose := FindDialog1Close;
      {$endif}
   end;

   FontDialog1:= TFontDialog.create(self);
   with FontDialog1 do begin
      Device := fdBoth;
      MinFontSize := 0;
      MaxFontSize := 0;
   end;

   CreatePopup;  { Only create during runtime - Moved from loaded function 5/14/97 }
   if PopupMenu=Nil then PopupMenu:= DefaultPopupMenu;

end;

destructor TwwCustomRichEdit.Destroy;
begin
//   if Patch[5]<>0 then FOleSelObject.Unadvise(patch[5]);
   FCanvas.Free;
   FFrame.Free;
   FindDialog1.Free;
   ReplaceDialog1.Free;
   FontDialog1.Free;
   DefaultPopupMenu.Free;
   FPrintMargins.Free;
   ReloadStream.Free;
   FEditorPosition.Free;
   FLines.Free;

   if HandleAllocated then DestroyWindowHandle;

   inherited Destroy;
end;


Function TwwRulerPanel.PixelsToTwipsX(pixels: integer): integer;
var DialogRichEdit: TwwCustomRichEdit;
begin
   DialogRichEdit:= (parent as TwwRichEditForm).RichEdit1;
   result := (pixels * wwTwipsPerInch) div DialogRichEdit.ScreenPixelsPerInch;
end;

Function TwwRulerPanel.PrinterPixelsToTwipsX(pixels: integer): integer;
begin
   result := (pixels * wwTwipsPerInch) div GetDeviceCaps(Printer.Handle, LogPixelsX);
end;

Function TwwRulerPanel.TwipsToPixels(Twips: integer): integer;
var DialogRichEdit: TwwCustomRichEdit;
begin
   DialogRichEdit:= (parent as TwwRichEditForm).RichEdit1;
   result:= DialogRichEdit.TwipsToPixels(Twips);
end;


procedure TwwRulerPanel.Paint;
var i,j: integer;
    DialogRichEdit: TwwCustomRichEdit;
    MarginWidth, PageWidth: double;
    PrnPhysPageSize: TPoint;
    ScreenPixelsPerUnit: Double;
    Divisions: integer;
//    WidthPixels: integer;
begin
   inherited Paint;
   DialogRichEdit:= (parent as TwwRichEditForm).RichEdit1;
   ScreenPixelsPerUnit:= DialogRichEdit.ScreenPixelsPerInch;
   if DialogRichEdit.MeasurementUnits=muCentimeters then
      ScreenPixelsPerUnit:= ScreenPixelsPerUnit / wwCentimetersPerInch;

   with Canvas do begin
      Brush.Color:= clWhite;
      FillRect(RulerRect);

      Pen.Color:= clBtnShadow;
      MoveTo(RulerRect.Left-1, RulerRect.Bottom);
      LineTo(RulerRect.Left-1, RulerRect.Top);
      LineTo(RulerRect.Right+1, RulerRect.Top);

      Pen.Color:= clBlack;
      MoveTo(RulerRect.Left, RulerRect.Bottom);
      LineTo(RulerRect.Left, RulerRect.Top+1);
      LineTo(RulerRect.Right+1, RulerRect.Top + 1);

      Pen.Color:= clBtnFace;
      MoveTo(RulerRect.Left-1, RulerRect.Bottom);
      LineTo(RulerRect.Right+1, RulerRect.Bottom);
      LineTo(RulerRect.Right+1, RulerRect.Top);

      Pen.Color:= clBtnHighlight;
      MoveTo(RulerRect.Left-1, RulerRect.Bottom + 1);
      LineTo(RulerRect.Right+2, RulerRect.Bottom + 1);
      LineTo(RulerRect.Right+2, RulerRect.Top);

      { Now draw all the tics }
      If DialogRichEdit.EditWidth = rewPrinterSize then
      begin
         Escape( Printer.Handle, GETPHYSPAGESIZE, 0, nil, @PrnPhysPageSize);
         MarginWidth:= DialogRichEdit.PrintMargins.Left + DialogRichEdit.PrintMargins.Right;
         if DialogRichEdit.MeasurementUnits = muCentimeters then
            MarginWidth:= MarginWidth / wwCentimetersPerInch;
         PageWidth := PrinterPixelsToTwipsX(PrnPhysPageSize.x)/1440 - MarginWidth;
         if DialogRichEdit.MeasurementUnits=muCentimeters then
            PageWidth:= PageWidth * wwCentimetersPerInch;
//         WidthPixels:= Trunc(PageWidth * DialogRichEdit.ScreenPixelsPerInch);
      end
      else
         PageWidth:= (DialogRichEdit.Width-12) / ScreenPixelsPerUnit;

      for i:= 0 to trunc(pageWidth)+1 do begin
         if (i >= PageWidth) then continue;

         if i>0 then
          TextOut(Trunc(RulerRect.Left + i*ScreenPixelsPerUnit - TextWidth(inttostr(i)) div 2),
                  RulerRect.Top+3, inttostr(i));
         if DialogRichEdit.MeasurementUnits=muCentimeters then Divisions:= 4
         else Divisions:= 8;
         for j:= 1 to Divisions-1 do
         begin
            Pen.color:= clBlack;
            if (i + j/Divisions >= PageWidth) then continue;

            if (j=Divisions div 2) then begin
               MoveTo(RulerRect.Left + Trunc((i+(j/Divisions))*ScreenPixelsPerUnit), RulerRect.Top+7);
               LineTo(RulerRect.Left + Trunc((i+(j/Divisions))*ScreenPixelsPerUnit), RulerRect.Bottom-5);
            end
            else begin
               MoveTo(RulerRect.Left + Trunc((i+(j/Divisions))*ScreenPixelsPerUnit), RulerRect.Top+8);
               LineTo(RulerRect.Left + Trunc((i+(j/Divisions))*ScreenPixelsPerUnit), RulerRect.Bottom-7);
            end
         end
      end;

   end;

end;

procedure TwwRulerPanel.UpdateSize(DialogRichEdit: TwwCustomRichEdit);
var PrnPhysPageSize: TPoint;
    MarginWidth, PageWidthInches: Double;
    WidthPixels: integer;
begin
   Escape( Printer.Handle, GETPHYSPAGESIZE, 0, nil, @PrnPhysPageSize);
   MarginWidth:= DialogRichEdit.PrintMargins.Left + DialogRichEdit.PrintMargins.Right;
   if DialogRichEdit.MeasurementUnits = muCentimeters then
      MarginWidth:= MarginWidth / wwCentimetersPerInch;

   PageWidthInches :=
        PrinterPixelsToTwipsX(PrnPhysPageSize.x)/1440 - MarginWidth;
   WidthPixels:= Trunc(PageWidthInches * DialogRichEdit.ScreenPixelsPerInch);
   Width:= 12 + WidthPixels;
   RulerRect:= Rect(6, 4, Width-6, Height-4);
   if LeftDragButton<>Nil then
      LeftDragButton.MaxValue:= RulerRect.Right-(LeftDragButton.Width div 2);
   if RightDragButton<>Nil then
     RightDragButton.MaxValue:= RulerRect.Right-(RightDragButton.Width div 2);
   if FirstLineDragButton<>Nil then
     FirstLineDragButton.MaxValue:= RulerRect.Right-(FirstLineDragButton.Width div 2);
end;

procedure TwwRulerPanel.UpdateDragIcons;
var DialogRichEdit: TwwCustomRichEdit;
   tempLeft, tempRight, tempFirst: integer;
   temp: integer;
begin
   DialogRichEdit:= (parent as TwwRichEditForm).RichEdit1;
   DialogRichEdit.GetParaIndent(tempLeft, tempRight, tempFirst);
   temp:= TwipsToPixels(tempLeft) + TwipsToPixels(tempFirst);;
   LeftDragButton.Left:= RulerRect.Left - LeftDragButton.Width div 2 + temp;

   RightDragButton.Left:= (Width - TwipsToPixels(tempRight) - RightDragButton.Width);
   FirstLineDragButton.Left:= RulerRect.Left - FirstLineDragButton.Width div 2 + TwipsToPixels(tempFirst);
end;

procedure TwwRulerPanel.UpdateRulerProp(Sender: TObject);
const MinWidth= 96 div 2;
var templeft, tempRight, tempFirst: integer;  {Twips for better accuracy}
    DialogRichEdit: TwwCustomRichEdit;
    TwipsLeft, TwipsFirst: integer;
    tempPixels: integer;
//    modPixel: integer;

   function PixelsPerUnit: double;
   var ScreenPixelsPerUnit: double;
   begin
      ScreenPixelsPerUnit:= DialogRichEdit.ScreenPixelsPerInch;
      if DialogRichEdit.MeasurementUnits=muCentimeters then
         ScreenPixelsPerUnit:= ScreenPixelsPerUnit / wwCentimetersPerInch;
      result:= ScreenPixelsPerUnit;
   end;

   function PixelsToRoundedUnits(Pixels: integer): Double;
   var Intervals: integer;
   begin
      if DialogRichEdit.MeasurementUnits = muCentimeters then Intervals:= 4
      else Intervals:= 8;
      result:= (Trunc(Pixels/PixelsPerUnit * 1000)
         - Trunc(Pixels/PixelsPerUnit * 1000) mod (1000 div Intervals)) / 1000;
   end;


   procedure LimitDragPositions;
   var PixelsLeft,PixelsRight, PixelsFirstLine: integer;
       UnitsLeft, UnitsRight, UnitsFirstLine: Double;
   begin
      UnitsLeft:= PixelsToRoundedUnits(LeftDragButton.Left+LeftDragButton.Width div 2);
      UnitsRight:= PixelsToRoundedUnits(RightDragButton.Left+RightDragButton.Width div 2);
      UnitsFirstLine:= PixelsToRoundedUnits(FirstLineDragButton.Left + FirstLineDragButton.Width div 2);
      PixelsLeft:= Trunc(UnitsLeft * PixelsPerUnit + 1);
      if PixelsLeft>LeftDragButton.MaxValue then PixelsLeft:= LeftDragButton.MaxValue;
      PixelsRight:= Trunc(UnitsRight * PixelsPerUnit + 1);
      if PixelsRight>RightDragButton.MaxValue then PixelsRight:= RightDragButton.MaxValue;
      PixelsFirstLine:= Trunc(UnitsFirstLine * PixelsPerUnit + 1);
      if PixelsFirstLine>FirstLineDragButton.MaxValue then PixelsFirstLine:= FirstLineDragButton.MaxValue;

      if (Sender = LeftDragButton) then begin
         if PixelsLeft>PixelsRight-MinWidth then
            LeftDragButton.Left:= PixelsRight - MinWidth
         else LeftDragButton.Left:= PixelsLeft
      end
      else if (Sender = RightDragButton) then begin
         if PixelsRight-MinWidth < wwmax(PixelsLeft, PixelsFirstLine) then
            RightDragButton.Left:= wwmax(PixelsLeft, PixelsFirstLine) + MinWidth
         else RightDragButton.Left:= PixelsRight
      end
      else if (Sender = FirstLineDragButton) then begin
         if PixelsFirstLine>PixelsRight -MinWidth then
            FirstLineDragButton.Left:= PixelsRight -MinWidth
         else FirstLineDragButton.Left:= PixelsFirstLine
      end;

   end;


begin
   DialogRichEdit:= (parent as TwwRichEditForm).RichEdit1;

   LimitDragPositions;

//   UnitsLeft:= PixelsToRoundedUnits(LeftDragButton.Left+LeftDragButton.Width div 2);

//   ModPixel:= 0.25 * 1440/2.537;
   tempLeft:= LeftDragButton.Left-LeftDragButton.MinValue;
   tempLeft:= PixelsToTwipsX(tempLeft);
   tempFirst:= FirstLineDragButton.Left-FirstLineDragButton.MinValue;
   tempFirst:= PixelsToTwipsX(tempFirst);
//   tempFirst:= UnitsToTwips(tempFirst);

//    -5 + (LeftDragButton.Width div 2);
//   tempLeft:= PixelsToTwipsX(tempLeft);
//   tempLeft:= (tempLeft div ModPixel)*ModPixel + (1440 div 96);
//
//   tempFirst:= FirstLineDragButton.Left-FirstLineDragButton.MinValue
//   -5+ (FirstLineDragButton.Width div 2);
//   tempFirst:= PixelsToTwipsX(tempFirst);
//   tempFirst:= (tempFirst div ModPixel)*ModPixel + 1440 div 96;

//   (twips/inch) /  (pixels/Inch)
//   Round to nearest 1/4 for centimeters


   TwipsLeft:= -tempFirst;
   TwipsLeft:= wwmin(TwipsLeft, tempLeft);
   TwipsFirst:= TempFirst + TempLeft;

   if (Sender = LeftDragButton) then begin
      dialogrichedit.SetParaFormat([rpoLeftIndent, rpoFirstLineIndent {, rpoRightIndent, rpoFirstLineIndent}],
           '', False, twipsLeft+tempLeft, 0, twipsFirst-tempLeft,0, nil, 0, 0, 0, 0);
   end
   else if (Sender = RightDragButton) then begin
      if DialogRichEdit.EditWidth = rewPrinterSize then
      begin
         tempPixels:= (RightDragButton.MaxValue-DialogRichEdit.GutterWidth-4) -
                     RightDragButton.Left + 2*(RightDragButton.Width div 2);
         tempRight:= PixelsToTwipsX(tempPixels);
      end
      else begin
         tempPixels:= (DialogRichEdit.Width-DialogRichEdit.GutterWidth-4) -
                     RightDragButton.Left + (RightDragButton.Width div 2);
         tempRight:= PixelsToTwipsX(tempPixels);
      end;
      dialogrichedit.SetParaFormat([rpoRightIndent],
              '', False, 0, tempRight, 0, 0, nil, 0, 0, 0, 0);
   end
   else if (Sender = FirstLineDragButton) then begin
      dialogrichedit.SetParaFormat([rpoLeftIndent, rpoFirstLineIndent {, rpoRightIndent, rpoFirstLineIndent}],
           '', False, twipsLeft+tempLeft, 0,
           twipsFirst-tempLeft, 0, nil, 0, 0, 0, 0);
   end
end;


function TwwCustomRichEdit.Execute: boolean;
var form: TwwRichEditForm;
    dragButton: TwwTrackIcon;
    wwRulerPanel: TwwRulerPanel;
    ARect: TRect;
    SaveCursor: TCursor;
begin
   form:= TwwRichEditForm.create(Application);
   RichEditForm:= form;

   SaveCursor:= Screen.Cursor;
   Screen.Cursor:= crHourGlass;

   with form do try
      { Ruler support }
      RulerPanel:= TwwRulerPanel.create(self);
      wwRulerPanel:= TwwRulerPanel(RulerPanel);
      with wwRulerPanel do begin
         Parent:=form;
         Top:= FormatBar.Top + FormatBar.Height + 10;
         if PixelsPerInch>96 then Height:= 27
         else Height:= 25;
         align:= alTop;
         BevelOuter:= bvNone;
         wwRulerPanel.RulerRect:= Rect(6, 4, RulerPanel.Width-6, RulerPanel.Height-4); //RulerHeight);
      end;

      wwRulerPanel.Align:= alNone;
      if EditWidth = rewPrinterSize then wwRulerPanel.UpdateSize(self)
      else wwRulerPanel.Width:=  Width;

      wwRulerPanel.RulerRect:= Rect(6, 4, RulerPanel.Width-6, RulerPanel.Height-4); //RulerHeight);

      dragButton:= TwwTrackIcon.create(self);
      dragButton.parent:= RulerPanel;
      dragButton.BitmapName:= 'wwRulerUp';
      dragButton.MinValue:= wwRulerPanel.RulerRect.Left -
        ((dragButton.Width) div 2);
      dragButton.MaxValue:= wwRulerPanel.RulerRect.Right-(dragButton.Width div 2);
      dragButton.Left:= dragButton.MinValue;
      dragButton.Top:= wwRulerPanel.RulerRect.Bottom - dragButton.Height + 4;
      dragButton.OnEndDrag:= wwRulerPanel.UpdateRulerProp;
      wwRulerPanel.LeftDragButton:= dragButton;

      dragButton:= TwwTrackIcon.create(self);
      dragButton.parent:= RulerPanel;
      dragButton.BitmapName:= 'wwRulerUp';
      dragButton.MinValue:= wwRulerPanel.RulerRect.Left -
        ((dragButton.Width) div 2);
      dragButton.MaxValue:= wwRulerPanel.RulerRect.Right-(dragButton.Width div 2);
      dragButton.Left:= dragButton.MaxValue;
      dragButton.Top:= wwRulerPanel.RulerRect.Bottom - dragButton.Height + 4;
      dragButton.OnEndDrag:= wwRulerPanel.UpdateRulerProp;
      wwRulerPanel.RightDragButton:= dragButton;

      dragButton:= TwwTrackIcon.create(self);
      dragButton.parent:= RulerPanel;
      dragButton.BitmapName:= 'wwRulerDown';
      dragButton.MinValue:= wwRulerPanel.RulerRect.Left -
        ((dragButton.Width) div 2);
      dragButton.MaxValue:= wwRulerPanel.RulerRect.Right-(dragButton.Width div 2);
      dragButton.Left:= dragButton.MinValue+10;
      dragButton.Top:= wwRulerPanel.RulerRect.Top -2;
      dragButton.OnEndDrag:= wwRulerPanel.UpdateRulerProp;
      wwRulerPanel.FirstLineDragButton:= dragButton;

      { Create rich-edit control - Control is created dynamically so that the
        pop-up editor's richedit will support any overrided virtual functions }
      RichEdit1:= TwwDBRichEdit(TComponentClass(self.classType).create(form));
      DialogRichEdit:= RichEdit1;
      with RichEdit1 do begin
         OleOptions:= self.OleOptions;
         ScrollBars := ssVertical;
         RichEdit1.WordWrap:= self.WordWrap; { 6/16/98 }
//         WordWrap := False;
         Parent:= form;
         Left := 0;
         Top := 60 + wwRulerPanel.Height+2;
         Width := 595;
         Height := 330;
         HideSelection := False;
         TabOrder := 3;
         WantTabs := True;
         OnSelectionChange := RichEdit1SelectionChange;
         PopupOptions := [rpoPopupCut, rpoPopupCopy, rpoPopupPaste, rpoPopupFont, rpoPopupBullet, rpoPopupParagraph];
         EditorCaption := 'Edit Rich Text';
         MeasurementUnits := muInches;
         PrintMargins.Top := 1;
         PrintMargins.Bottom := 1;
         PrintMargins.Left := 1;
         PrintMargins.Right := 1;
         Name:= 'RichEdit1';
      end;
      ActiveControl:= RichEdit1;

      Caption:= EditorCaption;
      RichEdit1.Font.Assign(self.font); { Assign default font - Put before CopyRichEditTo }
      with RichEdit1 do begin
         DefAttributes.Name:= self.Font.Name;
         DefAttributes.Style:= self.Font.Style;
         DefAttributes.Color:= self.Font.Color;
         DefAttributes.Size:= self.Font.Size;
         DefAttributes.Pitch:= self.Font.Pitch;
      end;
      OrigRichEdit:= self;  { Delay update of rich edit contents until dialog is loaded }
      RichEdit1.WantReturns:= True;
      RichEdit1.WantTabs:= True;
      RichEdit1.MeasurementUnits:= self.MeasurementUnits;
      RichEdit1.OnInitDialog:= self.onInitDialog;
      RichEdit1.PrintMargins.Assign(self.PrintMargins);
      RichEdit1.EditWidth:= self.EditWidth;
      RichEdit1.PrintPageSize:= self.PrintPageSize;
      RichEdit1.HighlightColor:=self.HighlightColor;
      if RichEdit1.EditWidth=rewPrinterSize then with RichEdit1.FontDialog1 do
         Options:= Options + [fdWysiwyg];
      if csDesigning in self.ComponentState then
      begin
         RichEdit1.EditorOptions:=
            [reoShowLoad, reoShowSaveAs, reoShowSaveExit, reoShowPrint, reoShowPageSetup,
             reoShowFormatBar, reoShowToolBar, reoShowStatusBar,
             reoShowHints, reoShowRuler, reoShowInsertObject,
             reoCloseOnEscape,
             reoFlatButtons, reoShowSpellCheck, reoShowMainMenuIcons];
         TwwCustomRichEdit(RichEdit1).ReadOnly:= False;
      end
      else begin
         RichEdit1.EditorOptions:= self.EditorOptions;
         TwwCustomRichEdit(RichEdit1).ReadOnly:= self.GetReadOnly;
      end;
      RichEdit1.MaxLength:= self.MaxLength;
      RichEdit1.selStart:= self.selStart;
      RichEdit1.AutoURLDetect:= self.AutoURLDetect;
      RichEdit1.OnURLOpen:= self.OnURLOpen;

      { Position form on screen }
      ARect := wwGetWorkingRect;

      if EditorPosition.Width>0 then Width:= EditorPosition.Width;
      if EditorPosition.Height>0 then Height:= EditorPosition.Height;

      if EditorPosition.Left>0 then Left:= EditorPosition.Left
      else Left:= ARect.Left+(((ARect.Right-ARect.Left) -
         wwAdjustPixels(Width, PixelsPerInch)) div 2);

      if EditorPosition.Top>0 then Top:= EditorPosition.Top
      else Top:= ARect.Top+ (((ARect.Bottom-ARect.Top)-
         wwAdjustPixels(Height, PixelsPerInch)) div 2);

      self.DoCreateDialog(form);

      result:= ShowModal=mrOK;

      if result then begin
         if RichEdit1.modified then begin
             BeginEditing;

             if (GetField=Nil) then
             begin
                RichEdit1.CopyRichEditTo(self);
             end
             else begin
                if (GetField is TBlobField) then
                   GetField.Assign(RichEdit1.ILines) { Much faster as 1 step process }
             end;

             self.DoCloseDialog(form);
             modified:= True; {5/21/97}
         end
         else begin
            self.DoCloseDialog(form); { RSW - 5/29/99 }
         end;
         self.PrintMargins.Assign(RichEdit1.PrintMargins);
         self.PrintPageSize:= RichEdit1.PrintPageSize;
      end
      else
         self.DoCloseDialog(form);

   finally
      DialogRichEdit:= Nil;
      RichEditForm:= nil;
      Screen.Cursor:= SaveCursor;
      RichEdit1.ILines.Clear; { Inherited DestroyWnd is slow to clear large buffers !!!! 6/18/98}
      Free;
   end;
end;

{ Allocate larger chunks of memory at a time - much faster this way}
type
 TwwRichMemoryStream = class(TMemoryStream)
   protected
     function Realloc(var NewCapacity: Longint): Pointer; override;
 end;

function TwwRichMemoryStream.Realloc(var NewCapacity: Longint): Pointer;
const MemoryDelta = $20000; { 256k - Must be a power of 2 }
begin
  if NewCapacity > 0 then
    NewCapacity := (NewCapacity + (MemoryDelta - 1)) and not (MemoryDelta - 1);
  Result := Memory;
  if NewCapacity <> Capacity then
  begin
    if NewCapacity = 0 then
    begin
      GlobalFreePtr(Memory);
      Result := nil;
    end else
    begin
      if Capacity = 0 then
        Result := GlobalAllocPtr(HeapAllocFlags, NewCapacity)
      else
        Result := GlobalReallocPtr(Memory, NewCapacity, HeapAllocFlags);
      if Result = nil then raise EStreamError.Create(SMemoryStreamError);
    end;
  end;
end;

Procedure TwwCustomRichEdit.AppendRichEditFrom(val: TCustomRichEdit);
var
  MemStream: TwwRichMemoryStream;
begin
   MemStream := TwwRichMemoryStream.Create;
   try
      with val as TwwCustomRichEdit do Begin
          PlainText := False;
          ILines.SaveToStream( MemStream );
      end;
      MemStream.Position := 0;
      selLength := 0;
      selStart := gettextlen;
      LoadPacketsFromStream(MemStream, False, True);
   finally
      MemStream.Free;
   end;
end;

Function GetUniqueFileName(var Filename: string): boolean;
var
    tempFileNameC: array[0..255] of char;
    PathBuffer: array[0..255] of char;
begin
   if GetTempPath(256, PathBuffer)=0 then FileName:= '';
   GetTempFileName(PathBuffer, '_WW', 0, tempFileNameC);
   FileName:= strPas(tempFileNameC);
   result:= True;
end;

Function TwwCustomRichEdit.IsMemoLoaded: boolean;
begin
   result:= True;
end;

Function TwwDBRichEdit.IsMemoLoaded: boolean;
begin
   result:= FMemoLoaded;
end;

Procedure TwwCustomRichEdit.CopyRichEditTo(val: TCustomRichEdit);
var prevCursor: TCursor;
    FileName: string;
    stream1: TwwRichMemoryStream;
    OldSkipChange: boolean;
begin
   PrevCursor:= Screen.Cursor;
   Screen.Cursor:= crHourGlass;
   OldSkipChange:= SkipChange;
   SkipChange:= True; { 9/25/98 - Skip change event as it incorrectly
                        gets called by SaveToStream }
   try
      if (Field<>Nil) and (not IsMemoLoaded) then
      begin
         if val is TwwCustomRichEdit then
         begin
            TwwCustomRichEdit(val).CopyRichEditFromBlob(Field); // Copy directly from tfield for speed
            exit;
         end
         else CopyRichEditFromBlob(Field);
      end;

      if RichEditCopyMethod = recmByTempFile then begin
         if not GetUniqueFileName(FileName) then begin
            ShowMessage('Fail to create temporary file.');
            exit;
         end;

         ILines.SaveToFile(FileName);
         try
            TRichEdit(val).Lines.LoadFromFile(FileName);
         finally
            DeleteFile(FileName);
         end;
      end
      else begin
         stream1:= TwwRichMemoryStream.create;
         try
            if MaxLength>0 then { 3/16/99 }
               TRichEdit(val).MaxLength:= TRichEdit(val).MaxLength + 1;
            ILines.SaveToStream(stream1);
            stream1.position:= 0;
            TRichEdit(val).Lines.LoadFromStream(stream1);
         finally
            if MaxLength>0 then { 3/16/99 }
               TRichEdit(val).MaxLength:= TRichEdit(val).MaxLength - 1;
            stream1.free;
         end
      end
   finally
      Screen.Cursor:= PrevCursor;
      SkipChange:= OldSkipChange;
   end
end;

Procedure TwwCustomRichEdit.CopyRichEditFromBlob(Field: TField);
var stream1: TwwRichMemoryStream;
    OldSkipChange: boolean;
begin
   stream1:= TwwRichMemoryStream.create;
   OldSkipChange:= SkipChange;
   SkipChange:= True; { 9/25/98 - Skip change event as it incorrectly
                        gets called by SaveToStream }
   try
//      stream1.size:= TBlobField(Field).BlobSize;
      if MaxLength>0 then MaxLength:= MaxLength + 1; { 3/16/99 }
      TBlobField(Field).SaveToStream(stream1);
      stream1.position:= 0;
      ILines.Clear;
      ILines.LoadFromStream(stream1);
   finally
      if MaxLength>0 then MaxLength:= MaxLength - 1; { 3/16/99 }
      stream1.free;
      SkipChange:= OldSkipChange;
   end
end;

Procedure TwwCustomRichEdit.CopyRichEditToBlob(Field: TField);
var prevCursor: TCursor;
    stream1: TwwRichMemoryStream;
begin
   PrevCursor:= Screen.Cursor;
   Screen.Cursor:= crHourGlass;
   stream1:= TwwRichMemoryStream.create;
   try
      ILines.SaveToStream(stream1);
      stream1.position:= 0;
      TBlobField(Field).LoadFromStream(stream1);
   finally
      stream1.free;
      Screen.Cursor:= PrevCursor;
   end
end;

{
Procedure TwwCustomRichEdit.CopyRichEditTo(val: TCustomRichEdit);
var stream1: TwwRichMemoryStream;
    prevCursor: TCursor;
begin
   PrevCursor:= Screen.Cursor;
   Screen.Cursor:= crHourGlass;
   stream1:= TwwRichMemoryStream.create;
   lines.SaveToStream(stream1);

   stream1.position:= 0;
   TRichEdit(val).lines.LoadFromStream(stream1);
   stream1.free;
   Screen.Cursor:= PrevCursor;
end;
}
Procedure TwwCustomRichEdit.ExecuteFindDialog;
var tempText: string;
begin
   tempText:= selText;
   if (length(tempText)>0) and
      (pos(#13, tempText)<=0) then FindDialog1.FindText:= tempText
   else FindDialog1.FindText:= LastSearchText;
   InResetToStart:= False;
   StartingFindPos:= selStart;
   OrigHideSelection:= HideSelection;
   HideSelection:= False;
   FindDialog1.execute;
end;

Procedure TwwCustomRichEdit.FindNextMatch;
begin
   FindReplaceDlg(FindDialog1, false, '');
end;

Procedure TwwCustomRichEdit.FindReplace;
begin
   FindReplaceDlg(ReplaceDialog1, true, ReplaceDialog1.replaceText);
end;

Function TwwCustomRichEdit.FindReplaceText(SearchText, ReplaceText: string;
           SearchTypes: TSearchTypes): boolean;
var MatchPos: integer;
begin
    MatchPos:=
       self.FindText(SearchText, selStart,  length(self.Text), SearchTypes);

    if (MatchPos>=0) then
    begin
       selStart:= MatchPos;
       selLength:= length(SearchText);
       selText:= ReplaceText;
       selStart:= MatchPos + length(ReplaceText);
       result:= True;
    end
    else begin
       result:= False;
    end;
end;

Procedure TwwCustomRichEdit.FindReplaceDlg(
        dialog: TFindDialog; replace: boolean;
        replaceStr: string);
var SearchTypes : TSearchTypes;
    MatchPos: integer;
begin
   While True do With dialog do begin
      SearchTypes:= [];
      if frMatchCase in Options then
         SearchTypes:= SearchTypes + [stMatchCase];
      if frWholeWord in Options then
         SearchTypes:= SearchTypes + [stWholeWord];

      if replace then begin
         MatchPos:=
            self.FindText(FindText, selStart,  length(self.Text), SearchTypes);
         if (MatchPos=selStart) and
            (length(selText)=length(FindText)) then
         begin
            if inResetToStart then
               StartingFindPos:= StartingFindPos + length(ReplaceStr)-length(FindText);
            selText:= ReplaceStr;
            selStart:= MatchPos + length(ReplaceStr);
         end
      end;

      MatchPos:=
            self.FindText(FindText,  selStart+1,  length(self.Text), SearchTypes);
      if InResetToStart and (MatchPos>StartingFindPos) then MatchPos:= -1;

      if (not InResetToStart) and (MatchPos<0) and (selStart>=1) then
      begin
         MatchPos:=
            self.FindText(FindText,  0,  length(self.Text), SearchTypes);
         if MatchPos>StartingFindPos then MatchPos:= -1;
         InResetToStart:= True;
      end;

      if MatchPos>=0 then
      begin
         selStart:= MatchPos;
         selLength:= length(FindText);
      end
      else begin
         { 1/22/98 - Use TwwIntl setting for LocateNoMoreMatches }
         MessageDlg(wwInternational.UserMessages.LocateNoMoreMatches,
                    mtInformation, [mbOK], 0);
         StartingFindPos:= selStart;
         InResetToStart:= False;
         break;
      end;

      if (frReplaceAll in dialog.options) then
      begin
      end
      else break;

   end;
end;

procedure TwwCustomRichEdit.ReplaceDialog1Replace(Sender: TObject);
begin
   LastSearchText:= ReplaceDialog1.FindText;
   FindReplace;
end;

procedure TwwCustomRichEdit.ExecuteFontDialog;
begin
  with FontDialog1 do
  begin
    Font.Name:= SelAttributes.Name;
    Font.Style:= SelAttributes.Style;
    Font.Color:= SelAttributes.Color;
    Font.Size:= SelAttributes.Size;
    Font.Pitch:= SelAttributes.Pitch;
  end;

  with FontDialog1 do begin
     if EditWidth=rewPrinterSize then
{        Device:= fdPrinter}
        Options:= Options + [fdWysiwyg]
     else
{        Device:= fdBoth;}
        Options:= Options - [fdWysiwyg];
  end;

  if FontDialog1.execute then
  begin
    with FontDialog1 do
    begin
       BeginEditing; {10/29/97 }
       SetRichEditFontAttributes(Font.Name, Font.Size, Font.Style, Font.Color);
    end;
  end;
end;

procedure TwwCustomRichEdit.ExecuteReplaceDialog;
var tempText : string;
begin
   tempText:= selText;
   if (length(tempText)>0) and
      (pos(#13, tempText)<=0) then ReplaceDialog1.FindText:= tempText
   else ReplaceDialog1.FindText:= LastSearchText;
   InResetToStart:= False;
   StartingFindPos:= SelStart;
   OrigHideSelection:= HideSelection;
   HideSelection:= False;
   ReplaceDialog1.execute;
end;

procedure TwwCustomRichEdit.ClearSelectedBackgroundColor;
const highlightText='\highlight';
var s, temps: string;
    LiteralHighlightPos, APos, TempPos, len: integer;
    memStream:TMemoryStream;
begin
  memStream:= TMemoryStream.create;
  try
    GetRTFSelection(memStream);
    memstream.position:= 0;
    s:= PChar(memStream.Memory);

    { Remove all occurrences of \highlight including any digits following it. }
    APos:= 1;
    repeat
       temps:= Copy(s, APos, length(s)+1-APos);
       tempPos:= AnsiPos(highlightText, temps);
       if tempPos=0 then break;
       APos:= APos + tempPos -1;

       { Need to avoid case where have \\highlight in case user has typed in '\highlight' }
       LiteralHighlightPos:= AnsiPos('\' + highlightText, temps);
       if (LiteralHighlightPos>0) and (LiteralHighlightPos<tempPos) then
       begin
          APos:= APos + length(highlightText);
          continue;
       end;

       { Read all digits following \highlight }
       len:= length(highlightText);
       while (s[APos+len] in ['0'..'9']) do inc(len);
       if s[APos+len]=' ' then inc(len);
       Delete(s, APos, len);
    until False;

    memStream.WriteBuffer(PChar(s)^, length(s));
    PutRTFSelection (memStream);

    { Unselect all }

  finally
    memStream.Free;
  end;

end;

Procedure TwwCustomRichEdit.SetTextBackgroundColor(BackColor: TColor);
var Format: TwwCharFormat2;
begin
  if BackColor=-1 then
  begin
      ClearSelectedBackgroundColor;
      exit;
  end;


  if RichEditVersion<2 then exit;
  FillChar(Format, SizeOf(TwwCharFormat2), 0);
  Format.cbSize := SizeOf(TwwCharFormat2);
  with Format do
  begin
    {$WARNINGS OFF}
    dwMask:= CFM_BACKCOLOR;
    {$WARNINGS ON}
    crBackColor:= BackColor;
  end;
  SendMessage(Handle, EM_SETCHARFORMAT, SCF_SELECTION, LPARAM(@Format));

  selLength:= 0; { Unselect text so its clear that its highlighted }
end;

function TwwCustomRichEdit.GetTextBackgroundColor: TColor;
var Format: TwwCharFormat2;
begin
  result:= clWhite;

  if RichEditVersion<2 then exit;
  FillChar(Format, SizeOf(TwwCharFormat2), 0);
  Format.cbSize := SizeOf(TwwCharFormat2);
  with Format do
  begin
    {$WARNINGS OFF}
    dwMask:= CFM_BACKCOLOR;
    {$WARNINGS ON}
  end;
  SendMessage(Handle, EM_GETCHARFORMAT, SCF_SELECTION, LPARAM(@Format));
  result:= Format.crBackColor;
end;

Procedure TwwCustomRichEdit.SetRichEditFontAttributes(
   FontName: string; FontSize: integer; FontStyle: TFontStyles;
   FontColor: TColor);
var Format: TwwCharFormat2;
begin
  FillChar(Format, SizeOf(TwwCharFormat2), 0);
  Format.cbSize := SizeOf(TwwCharFormat2);
  with Format do
  begin
    {$WARNINGS OFF}
    dwMask:= CFM_FACE OR CFM_CHARSET or CFM_SIZE or CFM_BOLD or
             CFM_ITALIC or CFM_COLOR OR CFM_UNDERLINE OR CFM_STRIKEOUT;
    {$WARNINGS ON}
    StrPLCopy(szFaceName, FontName, SizeOf(szFaceName));
    bCharSet := GetCharSetOfFontName(FontName);
    crTextColor:= FontColor;
    if fsBold in FontStyle then
       dwEffects:= dwEffects + CFE_BOLD;
    if fsItalic in FontStyle then dwEffects:= dwEffects + CFE_Italic;
    if fsUnderline in FontStyle then dwEffects:= dwEffects + CFE_Underline;
    if fsStrikeout in FontStyle then dwEffects:= dwEffects + CFE_Strikeout;
    yHeight:= FontSize * 20;
  end;
  SendMessage(Handle, EM_SETCHARFORMAT, SCF_SELECTION, LPARAM(@Format));
end;

Function TwwCustomRichEdit.ExecuteParagraphDialog: boolean;
begin
   result:= wwRichEditParagraphDlg(self);
end;

procedure TwwCustomRichEdit.WriteState(Writer: TWriter);
//var stream1, stream2: TMemoryStream;
begin
  if BoundMode then
  begin
     inherited WriteState(Writer);
     exit;
  end;
  inherited WriteState(Writer);
(*
  ShowMessage('WriteState');
  stream1:= TwwRichMemoryStream.create;
  stream2:= TwwRichMemoryStream.create;
  lines.saveToStream(stream2);
  lines.saveToStream(stream1);
  stream1.position:= 0;
  PlainText:= True;
  inherited WordWrap:= False;
  lines.LoadFromStream(stream1);
  inherited WriteState(Writer);
  inherited WordWrap:= WordWrap; {Restore original wordwrap }
  PlainText:= False;
  stream2.position:= 0;
  lines.LoadFromStream(stream2);
  stream1.free;
  stream2.free;
*)
end;

procedure TwwCustomRichEdit.ReadState(Reader: TReader);
var stream1: TMemoryStream;
    tempHourGlass: TCursor;
begin
  FRichEditVersion:= 1;

  if BoundMode then
  begin
     inherited ReadState(Reader);
     exit;
  end;
  tempHourGlass:= Screen.cursor;
  Screen.cursor:= crHourGlass;

  PlainText:= True;
  inherited ReadState(Reader);
  if not NewDataFormat then begin {Backwards compatibility }
     stream1:= TwwRichMemoryStream.create;
     ILines.SaveToStream(stream1);
     stream1.position:= 0;
     PlainText:= False;
     ILines.LoadFromStream(stream1);
     stream1.free;
  end;
  Screen.cursor:= tempHourGlass;
end;

procedure TwwCustomRichEdit.FindDialog1Close(Sender: TObject);
begin
   HideSelection:= OrigHideSelection;
end;

procedure TwwCustomRichEdit.FindDialog1Find(Sender: TObject);
begin
   LastSearchText:= (Sender as TFindDialog).FindText;
   FindDialog1.FindText:= LastSearchText;
   FindNextMatch;
end;

{ Don't allow CF_BITMAP, as this causes a resource leak in Microsoft's control}
function TwwCustomRichEdit.CanPaste: boolean;
var format: integer;
    OldReadOnly: boolean;
begin
   OldReadOnly:= inherited ReadOnly;
   inherited ReadOnly:= False;
   result:= SendMessage(Handle, EM_CANPASTE, 0, 0)<>0;
   inherited ReadOnly:= OldReadOnly;

      OpenClipboard(Handle);
      format:= 0;
      repeat
         format:= EnumClipboardFormats(format);
         if format=0 then break;

         if (format=CF_BITMAP) then  { CF_Bitmap are handled poorly by Microsoft's richedit }
         begin
            result:= False;
         end
         else if (format=CF_METAFILEPICT) or (format=CF_ENHMETAFILE) then
         begin
            result:= True;
            break;
         end;
      until format=0;

      CloseClipboard;
end;

function TwwCustomRichEdit.CanUndo: boolean;
begin
   result:= SendMessage(Handle, EM_CANUNDO, 0, 0)<>0;
end;

function TwwCustomRichEdit.CanRedo: boolean;
begin
   result:= SendMessage(Handle, EM_CANREDO, 0, 0)<>0;
end;

Function TwwCustomRichEdit.CanFindNext: boolean;
begin
   result:= lastSearchText<>'';
end;

function TwwCustomRichEdit.CanCut: boolean;
begin
   result:= seltext<>'';
end;

procedure TwwCustomRichEdit.GetParaIndent(
   var LeftIndent, RightIndent, FirstIndent: integer);
var Format: TParaFormat;
begin
  LeftIndent:= 0; RightIndent:= 0; FirstIndent:= 0;
  FillChar(Format, SizeOf(TParaFormat), 0);
  Format.cbSize := SizeOf(TParaFormat);
  if HandleAllocated then begin
     SendMessage(Handle, EM_GETPARAFORMAT, 0, LPARAM(@Format));
     LeftIndent:= format.dxOffset;
     RightIndent:= format.dxRightIndent;
     FirstIndent:= format.dxStartIndent;
  end;
end;

procedure TwwCustomRichEdit.GetParaFormat(var Format: TwwParaFormat2);
begin
  if RichEditVersion>=2 then begin
     FillChar(Format, SizeOf(TwwParaFormat2), 0);
     Format.cbSize := SizeOf(TwwParaFormat2);
  end
  else begin
     FillChar(Format, SizeOf(TParaFormat), 0);
     Format.cbSize := SizeOf(TParaFormat);
  end;
  if HandleAllocated then begin
     SendMessage(Handle, EM_GETPARAFORMAT, 0, LPARAM(@Format));
  end;
end;


procedure TwwCustomRichEdit.SetParaFormat(
    Options: TwwRichEditParaOptions;
    alignment: string;
    bulletStyle: boolean;
    leftindent, rightindent, firstlineindent: integer;
    tabCount: integer; tabArray: Pointer;
    SpaceBefore, SpaceAfter, LineSpacing: integer;
    LineSpacingRule: integer);
type wwLongArray = Array [0..MAX_TAB_STOPS] of longint;
     PwwLongArray=^wwLongArray;
var Format: TwwParaFormat2;
    i: integer;
 //   i, j: integer;
//    temp: integer;
begin
   BeginEditing; {11/18/97 }
   if RichEditVersion>=2 then begin
      FillChar(Format, SizeOf(TwwParaFormat2), 0);
      Format.cbSize := SizeOf(TwwParaFormat2);
   end
   else begin
      FillChar(Format, SizeOf(TParaFormat), 0);
      Format.cbSize := SizeOf(TParaFormat);
   end;
   with Format do
   begin
      if rpoAlignment in Options then dwMask:= dwMask + PFM_ALIGNMENT;
      if rpoBullet in Options then dwMask:= dwMask + PFM_NUMBERING;
      if rpoLeftIndent in Options then dwMask:= dwMask + PFM_OFFSET;
      if rpoRightIndent in Options then dwMask:= dwMask + PFM_RIGHTINDENT;
      if rpoFirstLineIndent in Options then dwMask:= dwMask + PFM_STARTINDENT;
      if rpoTabs in Options then dwMask:= dwMask + PFM_TABSTOPS;
      if rpoSpaceBefore in Options then dwMask:= dwMask + PFM_SPACEBEFORE;
      if rpoSpaceAfter in Options then dwMask:= dwMask + PFM_SPACEAFTER;
      if rpoLineSpacing in Options then dwMask:= dwMask + PFM_LINESPACING;

      if bulletStyle then wNumbering:= PFN_BULLET
      else wNumbering:= 0;
      dxOffset:= leftIndent;
      dxRightIndent:= rightIndent;
      dxStartIndent:= firstLineIndent;
      dySpaceBefore:= SpaceBefore;
      dySpaceAfter:= SpaceAfter;
      { 2/12/99 -
        Don't use LineSpacingRule 1.5 or 2.0 to avoid bug in RichEdit20.dll.
        The problem is that it does not recognizes its own format when streaming
        back in }
      if (LineSpacingRule=1) or (LineSpacingRule=2) then begin
          bLineSpacingRule:= 5;
          if LineSpacingRule=1 then LineSpacing := 30
          else LineSpacing:= 40;
      end
      else bLineSpacingRule:= LineSpacingRule;
      dyLineSpacing:= LineSpacing;

      // 4/6/98 - Use International Settings for Alignment
      if Alignment = wwInternational.RichEdit.ParagraphDialog.AlignLeft then wAlignment:=PFA_LEFT
      else if Alignment = wwInternational.RichEdit.ParagraphDialog.AlignRight then wAlignment:= PFA_RIGHT
      else wAlignment:= PFA_CENTER;
      if rpoTabs in Options then
      begin
         cTabCount:= wwMin(tabCount, MAX_TAB_STOPS);
         { 8/26/98 - Sort the tab order numerically }
{         for i:= 0 to cTabCount-2 do begin
            for j:= i+1 to cTabCount-1 do begin
               if PwwLongArray(tabArray)^[i]>PwwLongArray(tabArray)^[j] then
               begin
                  temp:= PwwLongArray(tabArray)^[j];
                  PwwLongArray(tabArray)^[j]:= PwwLongArray(tabArray)^[i];
                  PwwLongArray(tabArray)^[i]:= temp;
               end
            end
         end;
}
         for i:= 0 to cTabCount-1 do
         begin
            rgxTabs[i]:= PwwLongArray(tabArray)^[i];
         end;
      end;
      SendMessage(Handle, EM_SETPARAFORMAT, 0, LPARAM(@Format));
   end
end;


procedure TwwCustomRichEdit.SetBullet(val: boolean);
begin
   BeginEditing; {10/29/97 }
   if val then begin
       SetParaFormat([rpoBullet, rpoLeftIndent], '', True,
          Trunc(0.5*wwTwipsPerInch), 0, 0, 0, nil, 0, 0, 0, 0);
   end
   else
      Paragraph.Numbering:= nsNone;
end;

procedure TwwCustomRichEdit.SetBold(val: boolean);
begin
  BeginEditing; {10/29/97 }
  if (val) then
     SelAttributes.Style:= SelAttributes.Style +[fsBold]
  else
     SelAttributes.Style:= SelAttributes.Style -[fsBold];
end;

procedure TwwCustomRichEdit.SetItalic(val: boolean);
begin
  BeginEditing; {10/29/97 }
  if (val) then
     SelAttributes.Style:= SelAttributes.Style +[fsItalic]
  else
     SelAttributes.Style:= SelAttributes.Style -[fsItalic];
end;

procedure TwwCustomRichEdit.SetUnderline(val: boolean);
begin
  BeginEditing; {10/29/97 }
  if (val) then
     SelAttributes.Style:= SelAttributes.Style +[fsUnderline]
  else
     SelAttributes.Style:= SelAttributes.Style -[fsUnderline];
end;

Procedure TwwCustomRichEdit.CreatePopup;
   Function AddMenuItem(ACaption: string; event: TNotifyEvent): TMenuItem;
   var menuItem: TMenuItem;
   begin
      menuItem:= TMenuItem.create(DefaultPopupMenu);
      menuItem.caption:= ACaption;
      menuItem.OnClick:= event;
      result:= menuItem;
      DefaultPopupMenu.items.Add(menuItem);
   end;
begin
   DefaultPopupMenu:= TPopupMenu.create(self);

   with DefaultPopupMenu,wwInternational.RichEdit do begin
      OnPopup:= PopupMenuPopup;
      PopupEdit:= AddMenuItem(PopupMenuLabels.EditCaption, PopupEditClick);
      PopupSep1:= AddMenuItem('-', nil);
      PopupCut:= AddMenuItem(PopupMenuLabels.CutCaption, PopupCutClick);
      PopupCopy:= AddMenuItem(PopupMenuLabels.CopyCaption, PopupCopyClick);
      PopupPaste:= AddMenuItem(PopupMenuLabels.PasteCaption, PopupPasteClick);
      PopupSep2:= AddMenuItem('-', nil);
      PopupBold:= AddMenuItem(PopupMenuLabels.BoldCaption, PopupBoldClick);
      PopupItalic:= AddMenuItem(PopupMenuLabels.ItalicCaption, PopupItalicClick);
      PopupUnderline:= AddMenuItem(PopupMenuLabels.UnderlineCaption, PopupUnderlineClick);
      PopupSep3:= AddMenuItem('-', nil);
      PopupFont:= AddMenuItem(PopupMenuLabels.FontCaption, PopupFontClick);
      PopupBullet:= AddMenuItem(PopupMenuLabels.BulletStyleCaption, PopupBulletClick);
      PopupParagraph:= AddMenuItem(PopupMenuLabels.ParagraphCaption, PopupParagraphClick);
      PopupTabs:= AddMenuItem(PopupMenuLabels.TabsCaption, PopupTabsClick);
      PopupSep4:= AddMenuItem('-', nil);
      PopupFind:= AddMenuItem(PopupMenuLabels.FindCaption, PopupFindClick);
      PopupReplace:= AddMenuItem(PopupMenuLabels.ReplaceCaption, PopupReplaceClick);
      PopupSep5:= AddMenuItem('-', nil);
      PopupInsertObject:= AddMenuItem(PopupMenuLabels.InsertObjectCaption, PopupInsertObjectClick);
      PopupSpellCheck:= AddMenuItem(PopupMenuLabels.SpellCheckCaption, PopupSpellCheckClick);
   end;
end;

procedure TwwCustomRichEdit.PopupCutClick(Sender: TObject);
begin
   CutToClipboard;
end;

procedure TwwCustomRichEdit.PopupCopyClick(Sender: TObject);
begin
   CopyToClipboard;
end;

procedure TwwCustomRichEdit.PopupPasteClick(Sender: TObject);
begin
   PasteFromClipboard;
end;

procedure TwwCustomRichEdit.PopupFontClick(Sender: TObject);
begin
   ExecuteFontDialog;
end;

procedure TwwCustomRichEdit.PopupParagraphClick(Sender: TObject);
begin
   ExecuteParagraphDialog;
end;

procedure TwwCustomRichEdit.PopupTabsClick(Sender: TObject);
begin
   ExecuteTabDialog;
end;

procedure TwwCustomRichEdit.PopupFindClick(Sender: TObject);
begin
   ExecuteFindDialog;
end;

procedure TwwCustomRichEdit.PopupReplaceClick(Sender: TObject);
begin
   ExecuteReplaceDialog;
end;

procedure TwwCustomRichEdit.PopupInsertObjectClick(Sender: TObject);
begin
   InsertObjectDialog;
end;

procedure TwwCustomRichEdit.PopupSpellCheckClick(Sender: TObject);
begin
   MSWordSpellChecker;
end;

procedure TwwCustomRichEdit.PopupEditclick(Sender: TObject);
begin
   execute;
end;

procedure TwwCustomRichEdit.PopupBulletClick(Sender: TObject);
begin
   SetBullet(not PopupBullet.checked);
   PopupBullet.checked:= not PopupBullet.checked;
end;

procedure TwwCustomRichEdit.PopupBoldClick(Sender: TObject);
begin
   SetBold(not PopupBold.checked);
   PopupBold.checked:= not PopupBold.checked;
end;

procedure TwwCustomRichEdit.PopupItalicClick(Sender: TObject);
begin
   SetItalic(not PopupItalic.checked);
   PopupItalic.checked:= not PopupItalic.checked;
end;

procedure TwwCustomRichEdit.PopupUnderlineClick(Sender: TObject);
begin
   SetUnderline(not PopupUnderline.checked);
   PopupUnderline.checked:= not PopupUnderline.checked;
end;


procedure TwwCustomRichEdit.PopupMenuPopup(Sender: TObject);
var OrigPopupOptions: TwwRichEditPopupOptions;
    ShowInsertObject: boolean;
{ 9/5/97 - Restore original property values so component displays popup
  correctly when switching back to readonly=false }
begin
   OrigPopupOptions:= PopupOptions; {9/5/97}
   if GetReadOnly then begin
      PopupOptions:= PopupOptions -
         [{rpoPopupEdit,}
          rpoPopupBold, rpoPopupItalic, rpoPopupUnderline,
          rpoPopupFont, rpoPopupParagraph, rpoPopupTabs,
              rpoPopupBullet, rpoPopupReplace, rpoPopupInsertObject, rpoPopupMSWordSpellCheck];
      PopupEdit.caption:=
         wwInternational.RichEdit.PopupMenuLabels.ViewCaption;
   end
   else
      PopupEdit.caption:=
         wwInternational.RichEdit.PopupMenuLabels.EditCaption;

   PopupEdit.visible:= rpoPopupEdit in PopupOptions;
   PopupSep1.visible:= PopupEdit.visible and
      ([rpoPopupCut, rpoPopupcopy, rpoPopupPaste,
        rpoPopupBold, rpoPopupItalic, rpoPopupUnderline,
        rpoPopupFont, rpoPopupParagraph, rpoPopupBullet, rpoPopupTabs,
        rpoPopupFind, rpoPopupReplace, rpoPopupInsertObject, rpoPopupMSWordSpellCheck]*PopupOptions<>[]);

   PopupCut.visible:= (rpoPopupCut in PopupOptions);
   PopupCopy.visible:= rpoPopupCopy in PopupOptions;
   PopupPaste.visible:= (rpoPopupPaste in PopupOptions);

   PopupSep2.visible:= ([rpoPopupCut, rpoPopupCopy, rpoPopupPaste]*PopupOptions<>[])
      and
      ([rpoPopupBold, rpoPopupItalic, rpoPopupUnderline,
        rpoPopupFont, rpoPopupParagraph, rpoPopupTabs, rpoPopupBullet,
        rpoPopupFind, rpoPopupReplace, rpoPopupInsertObject, rpoPopupMSWordSpellCheck]*PopupOptions<>[]);

   PopupBold.visible:= rpoPopupBold in PopupOptions;
   PopupItalic.visible:= rpoPopupItalic in PopupOptions;
   PopupUnderline.visible:= rpoPopupUnderline in PopupOptions;

   PopupSep3.visible:=
      ([rpoPopupBold, rpoPopupItalic, rpoPopupUnderline]*PopupOptions<>[]) and
      ([rpoPopupFont, rpoPopupParagraph, rpoPopupTabs, rpoPopupBullet,
        rpoPopupFind, rpoPopupReplace, rpoPopupInsertObject, rpoPopupMSWordSpellCheck]*PopupOptions<>[]);

   PopupFont.visible:= (rpoPopupFont in PopupOptions);
   PopupParagraph.visible:= (rpoPopupParagraph in PopupOptions);
   PopupTabs.visible:= (rpoPopupTabs in PopupOptions);
   PopupBullet.visible:= (rpoPopupBullet in PopupOptions);

   ShowInsertObject:= (rpoPopupInsertObject in PopupOptions) and
                       not (reoDisableOLE in OLEOPtions);
   PopupSep4.visible:=
      ([rpoPopupFont, rpoPopupParagraph, rpoPopupTabs, rpoPopupBullet]*PopupOptions<>[]) and
      (([rpoPopupFind, rpoPopupReplace]*PopupOptions<>[]) or
      (ShowInsertObject or (rpoPopupMSWordSpellCheck in Popupoptions)));

   PopupFind.visible:= rpoPopupFind in PopupOptions;
   PopupReplace.visible:= (rpoPopupReplace in PopupOptions);

   PopupSep5.visible:=
      ([rpoPopupFind, rpoPopupReplace]*PopupOptions<>[]) and
      ShowInsertObject;
   PopupInsertObject.visible:= ShowInsertObject;
   PopupSpellCheck.visible:= rpoPopupMSWordSpellCheck in PopupOptions;

   PopupCut.enabled:= CanCut and (not GetReadOnly);
   PopupCopy.enabled:= CanCut;
   PopupPaste.enabled:= CanPaste and (not GetReadOnly);
   PopupBullet.checked:= Paragraph.Numbering <> nsNone;
   PopupBold.checked:= fsBold in SelAttributes.Style;
   PopupItalic.checked:= fsItalic in SelAttributes.Style;
   PopupUnderline.checked:= fsUnderline in SelAttributes.Style;

   PopupOptions:= OrigPopupOptions; {9/5/97}
end;

procedure TwwCustomRichEdit.Loaded;
begin
   inherited Loaded;

   { Avoid Delphi bug which ignores visible=False }
   if not (csDesigning in GetParentForm(self).ComponentState) then
   begin
      if (not visible) then ShowWindow(handle, sw_hide)
   end;

   { 8/13/97 - Support TwwIntl richedit popup captions }
   if not (csDesigning in GetParentForm(self).ComponentState) then
   with DefaultPopupMenu,wwInternational.RichEdit.PopupMenuLabels do begin
      PopupEdit.caption:= EditCaption;
      PopupCut.caption:= CutCaption;
      PopupCopy.caption:= CopyCaption;
      PopupPaste.caption:= PasteCaption;
      PopupBold.caption:= BoldCaption;
      PopupItalic.caption:= ItalicCaption;
      PopupUnderline.caption:= UnderlineCaption;
      PopupFont.caption:= FontCaption;
      PopupBullet.caption:= BulletStyleCaption;
      PopupParagraph.caption:= ParagraphCaption;
      PopupTabs.caption:= TabsCaption;
      PopupFind.caption:= FindCaption;
      PopupReplace.caption:= ReplaceCaption;
      PopupInsertObject.caption:= InsertObjectCaption;
      PopupSpellCheck.caption:= SpellCheckCaption;
   end;

end;

procedure TwwCustomRichEdit.SetWordWrap(val: boolean);
begin
   inherited WordWrap:= val;
   FWordWrap:= val;
end;

Function TwwCustomRichEdit.FormatUnitStr(val: double): string;  { Append units to number }
begin
   if measurementunits=muCentimeters then
      result:= floatToStr(val) + ' cm'
   else
      result:= floattostr(val) + '''''';
end;


Function TwwCustomRichEdit.RoundedFormatUnitStr(units: double; intervals: integer): string;  { Append units to number }
//var Intervals: integer;
begin
   if intervals=0 then
   begin
     if MeasurementUnits = muCentimeters then Intervals:= 20
     else Intervals:= 8;
   end;

   if units<0 then
     units:= Units - (1/(3/2*Intervals))
   else units:= Units + (1/(3/2*Intervals));

   Units:= (Trunc(units * 1000)
         - Trunc(units * 1000) mod (1000 div Intervals)) / 1000;
   if measurementunits=muCentimeters then
      result:= floatToStr(units) + ' cm'
   else
      result:= floattostr(units) + '''''';
end;

Function TwwCustomRichEdit.UnitStrToTwips(str: string): integer;
var temp: double;
begin
   strStripTrailing(str, ['''', ' ', 'c', 'm', 'C', 'M']);
   temp:= strtofloat(str) * wwTwipsPerInch; { Use Twips }
   if measurementUnits=muCentimeters then temp:= temp / wwCentimetersPerInch;
   result:= trunc(temp);
end;

Function TwwCustomRichEdit.UnitsToTwips(val: double): integer;
var temp: double;
begin
   temp:= val * wwTwipsPerInch; { Use Twips }
   if measurementUnits=muCentimeters then temp:= temp / wwCentimetersPerInch;
   result:= trunc(temp);
end;

Function TwwCustomRichEdit.TwipsToUnits(val: integer): double;
var temp: double;
begin
   temp:= val / wwTwipsPerInch;
   if measurementunits=muCentimeters then
   begin
      temp:= temp * wwCentimetersPerInch;
      temp:= round(temp * 100) / 100; { 2 decimal places }
   end
   else begin
      temp:= round(temp * 100) / 100; { 2 decimal places }
   end;
   result:= temp;
end;

procedure TwwCustomRichEdit.ExecuteTabDialog;
begin
   wwRichTabDlg(self);
end;

Procedure TwwCustomRichEdit.DoCloseDialog(Form: TForm);
begin
  if Assigned(FOnCloseDialog) then OnCloseDialog(Form);
end;

Procedure TwwCustomRichEdit.DoCreateDialog(Form: TForm);
begin
  if Assigned(FOnCreateDialog) then OnCreateDialog(Form);
end;

Procedure TwwCustomRichEdit.DoInitDialog(Form: TForm);
begin
  if Assigned(FOnInitDialog) then OnInitDialog(Form);
end;

{procedure TwwCustomRichEdit.InheritedCreateParams(var Params: TCreateParams);
const
  Passwords: array[Boolean] of Longint = (0, ES_PASSWORD);
  ReadOnlys: array[Boolean] of Longint = (0, ES_READONLY);
  CharCases: array[TEditCharCase] of Longint = (0, ES_UPPERCASE, ES_LOWERCASE);
  OEMConverts: array[Boolean] of Longint = (0, ES_OEMCONVERT);
  BorderStyles: array[TBorderStyle] of Longint = (0, WS_BORDER);
  WordWraps: array[Boolean] of LongInt = (0, ES_AUTOHSCROLL);
  Alignments: array[TAlignment] of Longint = (ES_LEFT, ES_RIGHT, ES_CENTER);
  ScrollBar: array[TScrollStyle] of LongInt = (0, WS_HSCROLL, WS_VSCROLL,
    WS_HSCROLL or WS_VSCROLL);
  HideSelections: array[Boolean] of Longint = (ES_NOHIDESEL, 0);
begin
  FillChar(Params, SizeOf(Params), 0);
  with Params do
  begin
    Caption := '';
    Style := WS_CHILD or WS_CLIPSIBLINGS;
    if csAcceptsControls in ControlStyle then
    begin
      Style := Style or WS_CLIPCHILDREN;
      ExStyle := ExStyle or WS_EX_CONTROLPARENT;
    end;
    if not (csDesigning in ComponentState) and not Enabled then
      Style := Style or WS_DISABLED;
    if TabStop then Style := Style or WS_TABSTOP;
    X := Left;
    Y := Top;
    Width := self.Width;
    Height := self.Height;
    if Parent <> nil then
      WndParent := Parent.Handle else
      WndParent := ParentWindow;
    WindowClass.style := CS_VREDRAW + CS_HREDRAW + CS_DBLCLKS;
    WindowClass.lpfnWndProc := @DefWindowProc;
    WindowClass.hCursor := LoadCursor(0, IDC_ARROW);
    WindowClass.hbrBackground := 0;
    WindowClass.hInstance := HInstance;
    StrPCopy(WinClassName, ClassName);
  end;

  with Params do
  begin
    Style := Style or (ES_AUTOHSCROLL or ES_AUTOVSCROLL) or
      BorderStyles[BorderStyle] or Passwords[PasswordChar <> #0] or
      ReadOnlys[ReadOnly] or CharCases[CharCase] or
      HideSelections[HideSelection] or OEMConverts[OEMConvert];
    if NewStyleControls and Ctl3D and (BorderStyle = bsSingle) then
    begin
      Style := Style and not WS_BORDER;
      ExStyle := ExStyle or WS_EX_CLIENTEDGE;
    end;
  end;

  with Params do
  begin
    Style := Style and not WordWraps[FWordWrap] or ES_MULTILINE or
      Alignments[Alignment] or ScrollBar[ScrollBars];
  end;
end;
}
{
procedure TwwCustomRichEdit.SetTransparent(val: boolean);
var exStyle, origStyle: longint;
begin
   if val<>FTransparent then
   begin
      FTransparent:= val;

      OrigStyle:= Windows.GetWindowLong(handle, GWL_EXSTYLE);
      if val then
         exStyle:= OrigStyle or WS_EX_TRANSPARENT
      else
         exStyle:= OrigStyle and not WS_EX_TRANSPARENT;
      Windows.SetWindowLong(handle, GWL_EXSTYLE, exStyle);
   end
end;
}
procedure TwwCustomRichEdit.CreateParams(var Params: TCreateParams);
const
  HideScrollBars: array[Boolean] of DWORD = (ES_DISABLENOSCROLL, 0);
  HideSelections: array[Boolean] of DWORD = (ES_NOHIDESEL, 0);
var
  OldError: Longint;
  RichEditModuleName: PChar;
//  resHandle: THandle;
begin
  if RichEditVersion<2 then begin
     inherited CreateParams(Params);
     exit;
  end;

(*  if not (csDesigning in ComponentState) then
  begin
     resHandle:= OpenMutex(MUTEX_ALL_ACCESS, false, 'InfoPowerRichEditDTP');
     { Richedit design time patch to workaround richedit paint bug with Integrated debugging}
     if resHandle=0 then
     begin
        FLibHandle := 0;
     end
     else begin
        CloseHandle(resHandle);
        RichEditModuleName:= 'WWIP4DTP.BPL';
        FLibHandle := LoadLibrary(RichEditModuleName);
     end
  end
  else *)
     FLibHandle:= 0;

  if FLibHandle=0 then begin
     RichEditModuleName:= 'RICHED20.DLL';
     OldError := SetErrorMode(SEM_NOOPENFILEERRORBOX);
     FLibHandle := LoadLibrary(RichEditModuleName);
     if (FLibHandle > 0) and (FLibHandle < HINSTANCE_ERROR) then FLibHandle := 0;
     SetErrorMode(OldError);
  end;

  inherited CreateParams(Params);

  if (FLibHandle<>0) and (Patch[1]=False) then
     CreateSubClass(Params, 'RICHEDIT20A')
  else
     CreateSubClass(Params, 'RICHEDIT');
  with Params do
  begin
    Style := Style or HideScrollBars[self.HideScrollBars] or
      HideSelections[HideSelection];
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);

    if IsTransparentEffective { and Frame.CreateTransparent } then
    begin
       Params.ExStyle := Params.ExStyle or WS_EX_TRANSPARENT;
    end;

//    if IsTransparentEffective then
//       Params.ExStyle := Params.ExStyle or WS_EX_TRANSPARENT;
  end;
end;


Procedure TwwCustomRichEdit.SetEditRect;
var r: TRect;
   Logx, logy: integer;
   PrnPhysPageSize: TPoint;
   xMarginInches: double;
   OldSkipChange: boolean;

   Function isVertScrollVisible: boolean;
   var si: TScrollInfo;
   begin
      result:= False;
      if not ((ScrollBars=ssVertical) or (ScrollBars=ssBoth)) then exit;

      FillChar(SI, SizeOf(TScrollInfo), 0);
      SI.cbSize := sizeof(SI);
      SI.fMask := SIF_ALL;
      GetScrollInfo(Handle, SB_VERT, SI);
      result:= (si.nMax<>0);
   end;

   function sameRect(rect1, rect2: TRect): boolean;
   begin
      result:=
       (rect1.left = rect2.left) and
       (rect1.right = rect2.right) and
       (rect1.top = rect2.top) and
       (rect1.bottom = rect2.bottom);
   end;

begin
   OldSkipChange:= SkipChange;
   SkipChange:= True;
   try
   if EditWidth<>rewWindowSize then begin
      with Printer do begin
        Escape( Printer.Handle, GETPHYSPAGESIZE, 0, nil, @PrnPhysPageSize);
        LogX := GetDeviceCaps(Handle, LOGPIXELSX);
        LogY := GetDeviceCaps(Handle, LOGPIXELSY);
        XMarginInches:= UnitStrToTwips(floattostr(PrintMargins.left+PrintMargins.Right))/1440;

        r.left:= GutterWidth;
        r.top:= 0;
        { 9/27/98 - Use Screen.PixelsPerInch instead of 96 }
        r.right:= GutterWidth+4+Trunc(((PrnPhysPageSize.x/logx) - XMarginInches)*Screen.PixelsPerInch);
        if isVertScrollVisible then r.right:= r.right - (GetSystemMetrics(SM_CXHThumb)+5);
        r.bottom:= PageHeight * Screen.PixelsPerInch div logy;

        SendMessage(self.handle, EM_SETRECT, 0, longint(@r));
      end
   end
   else begin
//      if not isWindowVisible(self.handle) then exit; { With this line editrect can be wrong since WMPaint SetEditRect removed }

      if (BorderStyle = bsNone) and IsInwwObjectView(self) then
         r.left:= 1
      else
         r.left:= GutterWidth;

      if BorderStyle=bsNone then
         r.top:= 0
      else r.top:= 2;
      r.bottom:= Height;
      r.right:= Width - 4;
      if isVertScrollVisible then r.right:= r.right - (GetSystemMetrics(SM_CXHThumb));
      if sameRect(r,FLastSetRect) then exit;

      if (Frame.Enabled) then
      begin
         Frame.GetEditRectForFrame(r);
         r.Left:= r.Left + GutterWidth -1;
         if ((Windows.GetWindowLong(handle, GWL_EXSTYLE) and WS_EX_TRANSPARENT)<>0) then
         begin
           r.Top:= r.Top - 1;
           r.Bottom:= r.Bottom - 2;
         end
         else begin
            r.Bottom:= r.Bottom - 2;
         end
      end;

      SendMessage(self.handle, EM_SETRECT, 0, longint(@r));
      FLastSetRect:= r;
   end;
   finally
   SkipChange:= OldSkipChange;
   end;
end;

Function TwwCustomRichEdit.GetPrinterRect: TRect;
var
   PrnPageOffset : TPoint;	{Offset from physical printer page size to print size X/Y}
   PrnPhysPageSize: TPoint;

   rect: TRect;
   LeftoffsetTwips, TopOffsetTwips: integer;

   Function ScreenPixelsToTwipsX(pixels: integer): integer;
   begin
       result := (pixels * 1440) div ScreenPixelsPerInch;
   end;

   Function PixelsToTwipsX(pixels: integer): integer;
   begin
       result := (pixels * 1440) div GetDeviceCaps(Printer.Handle, LogPixelsX);
   end;

   Function PixelsToTwipsY(pixels: integer): integer;
   begin
       result := (pixels * 1440) div GetDeviceCaps(Printer.Handle, LogPixelsY);
   end;
begin
   Escape( Printer.Handle, GETPHYSPAGESIZE, 0, nil, @PrnPhysPageSize);
   Escape( Printer.Handle, GETPRINTINGOFFSET, 0, nil, @PrnPageOffset);

   LeftOffsetTwips := PixelsToTwipsX(PrnPageOffset.x);
   TopOffsetTwips := PixelsToTwipsY(PrnPageOffset.Y);

   with rect do begin
      Left:= UnitStrToTwips(floattostr(PrintMargins.left));
      Left:= Left - LeftOffsetTwips;
      Left:= wwMax(0, Left);
      Left:= wwMin(Left, PixelsToTwipsX(PrnPhysPageSize.X - PrnPageOffset.X*2));

      Right:= PixelsToTwipsX(PrnPhysPageSize.X)
              - UnitStrToTwips(floattostr(PrintMargins.right)) - LeftOffsetTwips;
      Right:= wwMax(Left, Right);
      Right:= wwMin(Right, PixelsToTwipsX(PrnPhysPageSize.X - 2*PrnPageOffset.X));

      Top:= UnitStrToTwips(floattostr(PrintMargins.top));
      Top:= Top - TopOffsetTwips;
      Top:= wwMax(0, Top);
      Top:= wwMin(Top, PixelsToTwipsY(PrnPhysPageSize.Y - PrnPageOffset.Y));

      Bottom:= PixelsToTwipsX(PrnPhysPageSize.Y)
               - UnitStrToTwips(floattostr(PrintMargins.bottom)) - TopOffsetTwips;
      Bottom:= wwMax(Top, Bottom);
      Bottom:= wwMin(Bottom, PixelsToTwipsX(PrnPhysPageSize.Y - 2*PrnPageOffset.Y));
   end;
   result:= rect;
end;

procedure TwwCustomRichEdit.EMFormatRange(var msg:TMessage);
begin
   inherited;
end;

procedure TwwPrintMargins.Assign(Source: TPersistent);
begin
  if Source is TwwPrintMargins then with TwwPrintMargins(Source) do
  begin
     self.left:= left;
     self.right:= right;
     self.top:= top;
     self.bottom:= bottom;
  end;
end;

constructor TwwPrintMargins.Create(AOwner: TComponent);
begin
   left:= 1;
   right:= 1;
   top:= 1;
   bottom:= 1;
end;

Procedure TwwCustomRichEdit.UpdatePrinter;
var Device, Driver, Port: array[0..79] of char;
    hDMode: THandle;
    pDMode: PDEVMODE;
begin
   Printer.PrinterIndex:= Printer.PrinterIndex;  { Forces hdMode to be valid }
   Printer.GetPrinter(Device, Driver, Port, hDMode);
   if hDMode<>0 then begin
      pDMode:= GlobalLock(hDMode);
      if pDMode<>nil then begin
         pDMode^.dmFields:= pDMode^.dmFields or dm_PaperSize;
         pDMode.dmPaperSize:= PrintPageSize;
         GlobalUnlock(hDMode);
         Printer.PrinterIndex:= Printer.PrinterIndex;
      end
   end;
end;

procedure TwwCustomRichEdit.Print(const Caption: string);
var
  Range: TFormatRange;
  LastChar, MaxLen, LogX, LogY, OldMap: Integer;
begin

  if EditWidth=rewPrinterSize then UpdatePrinter;

  FillChar(Range, SizeOf(TFormatRange), 0);
  with Printer, Range do
  begin
    Title := Caption; { 5/24/99 - RSW - Move before BeginDoc }
    BeginDoc;
    hdc := Handle;
    hdcTarget := hdc;
    LogX := GetDeviceCaps(Handle, LOGPIXELSX);
    LogY := GetDeviceCaps(Handle, LOGPIXELSY);
    if IsRectEmpty(PageRect) then
    begin
//      rc.right := PageWidth * 1440 div LogX;
//      rc.bottom := PageHeight * 1440 div LogY;
      rc:= GetPrinterRect;
    end
    else begin
      rc.left := PageRect.Left * 1440 div LogX;
      rc.top := PageRect.Top * 1440 div LogY;
      rc.right := PageRect.Right * 1440 div LogX;
      rc.bottom := PageRect.Bottom * 1440 div LogY;
    end;
    rcPage := rc;
    LastChar := 0;
    MaxLen := GetTextLen;
    chrg.cpMax := -1;
    // ensure printer DC is in text map mode
    OldMap := SetMapMode(hdc, MM_TEXT);

    { Render to determine last character in document - required for RichEdit 2 }
    SendMessage(Handle, EM_FORMATRANGE, 0, 0);
    repeat
       chrg.cpMin := LastChar;
       LastChar := SendMessage(Self.Handle, EM_FORMATRANGE, 0, Longint(@Range));
    until (LastChar<=chrg.cpMin) or (LastChar >= MaxLen) or (LastChar = -1);
    MaxLen:= LastChar;
    chrg.cpMax := -1;

    { Start printing }
    LastChar:= 0;
    SendMessage(Handle, EM_FORMATRANGE, 0, 0);    // flush buffer
    try
      repeat
        chrg.cpMin := LastChar;
        LastChar := SendMessage(Self.Handle, EM_FORMATRANGE, 1, Longint(@Range));
        if LastChar<=chrg.cpMin then break;
        if (LastChar < MaxLen) and (LastChar <> -1) then NewPage;
      until (LastChar >= MaxLen) or (LastChar = -1);
      EndDoc;
    finally
      SendMessage(Handle, EM_FORMATRANGE, 0, 0);  // flush buffer
      SetMapMode(hdc, OldMap);       // restore previous map mode
    end;
  end;
end;


Function TwwDBRichEdit.isBlob: boolean;
begin
   result:= FDataLink.Field is TBlobField;
end;

procedure TwwCustomRichEdit.SetPrintPageSize(val: integer);
begin
   FPrintPageSize:= val;

   if (GetParentForm(self)<>Nil) and (EditWidth<>rewWindowSize) then
   begin
      UpdatePrinter;
      SetEditRect;
   end
end;

procedure TwwCustomRichEdit.SelectionChange;
var p: TPoint;
    CharPos: Integer;
    tempEditRect: TRect;
begin
   inherited SelectionChange;

   { Repaint richedit control to fix residue problem of letters in the first
     column with the letter j.  Only necessary if frame.enabled is true }
   if Frame.enabled and FFocused then
   begin
      SendMessage(Handle,em_getrect, 0, Integer(@tempeditrect));
      p.x:= tempEditRect.Left + 1;
      p.y:= tempEditRect.Top + 1;
      CharPos := SendMessage(Handle, EM_CHARFROMPOS, 0, Longint(@p));
      if (CharPos<>OldCharPos) or (Lines.Count<>OldLineCount) then
      begin
         tempEditRect.Right:= tempEditRect.Left;
         tempEditRect.Left:=2;
         if tempEditRect.Left<tempEditRect.Right then
           invalidateRect(Handle, @tempEditRect, False);
      end;
      OldCharPos:= CharPos;
      OldLineCount:= Lines.Count;
   end
end;

procedure TwwCustomRichEdit.WMSize(var msg:twmsize);
begin
   inherited;
   if (EditWidth=rewWindowSize) then SetEditRect;  { Readjust edit rectange if scroll becomes visible }
end;

{1/28/97 - Allow Change of text when there is a protected flag in previous richtext.}
procedure TRichProtectClass.RichProtectChange(Sender: TObject; StartPos,
  EndPos: Integer; var AllowChange: Boolean);
begin
   AllowChange:= True;
end;

function TwwCustomRichEdit.TwipsToPixels(Twips: integer): integer;
begin
   result:= Twips * ScreenPixelsPerInch div 1440;
end;

procedure TwwCustomRichEdit.DestroyWnd;
var OldSkipChange: boolean;
begin
   useReloadStream:= False;
   if (not InParentChanging) and not (csDestroying in ComponentState) then
   begin
      if ReloadStream=Nil then ReloadStream:= TwwRichMemoryStream.create
      else ReloadStream.position:= 0;
      ILines.SaveToStream(ReloadStream);
      useReloadStream:= True;
   end;

   OldSkipChange:= SkipChange;
   SkipChange:= True;
   try
      ILines.Clear; { Inherited DestroyWnd is slow to clear large buffers }
   finally
      SkipChange:= OldSkipChange;
   end;

   inherited DestroyWnd;
end;

procedure TwwCustomRichEdit.CreateWnd;
var mask: integer;
    OldSkipChange: boolean;
begin
  { SetEditRect called in paint event after recreatewnd }
  FLastSetRect:= Rect(0,0,0,0);
  InitEditRect:= False;

  OldSkipChange:= SkipChange;
  SkipChange:= True;
  try
     inherited CreateWnd;
  finally
     Skipchange:= OldSkipChange;
  end;

  if not (reoDisableOLE in OLEOptions) then
  begin
    if not RichEdit_GetOleInterface(Handle, FRichEditOle) then
      raise Exception.Create('Unable to get interface');
    if not RichEdit_SetOleCallback(Handle, FRichEditOleCallback) then
      raise Exception.Create('Unable to set callback');
  end;

  { Stream in after setting ole callback routines }
  if (useReloadStream) and (ReloadStream<>nil) then begin
     ReloadStream.position:= 0;
     try
        if MaxLength>0 then MaxLength:= MaxLength + 1; { 3/16/99 }
        SkipChange:= True;
        ILines.LoadFromStream(ReloadStream);
     finally
        if MaxLength>0 then MaxLength:= MaxLength - 1; { 3/16/99 }
        Skipchange:= OldSkipChange;
     end;
  end;

  if AutoURLDetect then begin
     Perform(EM_AutoURLDetect, 1, 0);  { Enable web addresses }
     mask:= Perform(em_GetEventMask, 0, 0);
     mask:= mask or enm_link;
     Perform(em_SetEventMask, 0, mask);
  end;

  if IsTransparentEffective then
  begin
    wwDisableParentClipping(Parent);
  end;

  SetEditRect;

end;

procedure TwwCustomRichEdit.SetOleOptions(val: TwwRichEditOleOptions);
begin
   if val<>FOLEOptions then
   begin
      FOleOptions:= val;
      RecreateWnd;
   end
end;

procedure TwwCustomRichEdit.WMNCDestroy(var Msg: TMessage);
begin
  FRichEditOle:= nil;
  inherited;
  if FLibHandle <> 0 then begin
     FreeLibrary(FLibHandle);
     FLibHandle:= 0;
  end
end;

function TwwCustomRichEdit.GetPopupMenu: TPopupMenu;
var
  I: Integer;
  Item: TMenuItem;
  ReObject: TReObject;
  UserType: POleStr;
  MyMalloc: IMalloc;
  ParentItem: TMenuItem;
begin
  Result := inherited GetPopupMenu;

  if (reoAdjustPopupMenu in OleOptions) and Assigned(FRichEditOle) then begin
    { Free previuosly added menu items }
    for i:= 0 to OleMenuItemList.count-1 do TMenuItem(OleMenuItemList[i]).Free;
    OleMenuItemList.Clear;

    ReObject.cbStruct:= sizeof(TReObject);

    {if an object is selected, get its IOLEObject interface}
    {$WARNINGS OFF}
    if (FRichEditOle.GetObject(REO_IOB_SELECTION, ReObject, REO_GETOBJ_POLEOBJ) <> S_OK) or
          (not Assigned(ReObject.oleobj)) then begin
    {$WARNINGS ON}
      {no object selected -- clean up any previous object info}
      FOleSelObject:= nil;
      DestroyVerbs;
    end
    else begin
      if True then
      begin
        { Add separator to popup menu}
        FOleSelObject:= ReObject.oleobj;
        Item := TMenuItem.Create(Self);
        Item.Caption := '-';
        Item.Tag := 0;
        Result.Items.Add(Item);
        OleMenuItemList.Add(Item);

        { Add Ole Type to popup menu}
        FOleSelObject.GetUserType(0, UserType);
        Item := TMenuItem.Create(Self);
        Item.Caption := UserType + ' &Object';;
        Item.Tag := 0;

        { Free pointer created from GetUserType Ole function }
        CoGetMalloc(1, MyMalloc);
        MyMalloc.Free(UserType);

        Result.Items.Add(Item);
        OleMenuItemList.Add(Item);
        ParentItem:= Item;

        if GetReadOnly then begin
           Item.enabled:= false;
           exit;
        end;

        UpdateVerbs;
        if FObjectVerbs.Count = 0 then exit
        else begin
          for I := 0 to FObjectVerbs.Count - 1 do begin
            Item := TMenuItem.Create(Self);
            Item.Caption := FObjectVerbs[I];
            Item.Tag := I;
            if TVerbInfo(FObjectVerbs.Objects[i]).Verb = 0 then
              Item.Default:= true;              // Verb = 0 is the primary verb
            Item.OnClick := PopupVerbMenuClick;
            ParentItem.Add(Item);
          end;
//          Result := Result;
        end;
      end
    end
  end;
end;

procedure TwwCustomRichEdit.DestroyVerbs;
begin
  while FVerbMenu.Items.Count > 0 do
    FVerbMenu.Items.Delete(0);
  FObjectVerbs.clear;
end;

procedure TwwCustomRichEdit.UpdateVerbs;
var
  EnumOleVerb: IEnumOleVerb;
  OleVerb: TOleVerb;
  VerbInfo: TVerbInfo;
begin
  DestroyVerbs;

  if FOleSelObject.EnumVerbs(EnumOleVerb) = 0 then
  begin
    while (EnumOleVerb.Next(1, OleVerb, nil) = 0) and
      (OleVerb.lVerb >= 0) and
      (OleVerb.grfAttribs and OLEVERBATTRIB_ONCONTAINERMENU <> 0) do
    begin
      VerbInfo.Verb := OleVerb.lVerb;
      VerbInfo.Flags := OleVerb.fuFlags;
      FObjectVerbs.AddObject(OleVerb.lpszVerbName, TObject(VerbInfo));
    end;
  end;
end;

procedure TwwCustomRichEdit.PopupVerbMenuClick(Sender: TObject);
begin
  DoVerb((Sender as TMenuItem).Tag);
end;

procedure TwwCustomRichEdit.DoVerb(Verb: Integer);
var
  H: THandle;
  R: TRect;
  ClientSite: IOleClientSite;
begin
  if not Assigned(FRichEditOle) or not Assigned(FOleSelObject) then Exit;
  if Verb > 0 then begin
    if FObjectVerbs = nil then UpdateVerbs;
    if Verb >= FObjectVerbs.Count then
      raise EOleError.Create('Invalid Verb');
    Verb := Smallint(Integer(FObjectVerbs.Objects[Verb]) and $0000FFFF);
  end else
    if Verb = ovPrimary then Verb := 0;
  R := ClientRect;
  H := Handle;
  OleCheck(FRichEditOle.GetClientSite(ClientSite));
  OleCheck(FOleSelObject.DoVerb(Verb, nil, ClientSite, 0, H, R));
end;


{ The following methods are to support the reading of only the first richedit
packet.  This is used by the TwwDBGrid
  AdjustLineBreaks
  StreamLoad
  LoadFirstLineFromStream
  LoadBlobStart
}
function AdjustLineBreaks(Dest, Source: PChar): Integer; assembler;
asm
        PUSH    ESI
        PUSH    EDI
        MOV     EDI,EAX
        MOV     ESI,EDX
        MOV     EDX,EAX
        CLD
@@1:    LODSB
@@2:    OR      AL,AL
        JE      @@4
        CMP     AL,0AH
        JE      @@3
        STOSB
        CMP     AL,0DH
        JNE     @@1
        MOV     AL,0AH
        STOSB
        LODSB
        CMP     AL,0AH
        JE      @@1
        JMP     @@2
@@3:    MOV     EAX,0A0DH
        STOSW
        JMP     @@1
@@4:    STOSB
        LEA     EAX,[EDI-1]
        SUB     EAX,EDX
        POP     EDI
        POP     ESI
end;

type
  PwwRichEditStreamInfo = ^TwwRichEditStreamInfo;
  TwwRichEditStreamInfo = record
    Converter: TConversion;
    Stream: TStream;
    FirstTime: boolean;
    FirstPacketOnly: boolean;
  end;

function StreamLoad(dwCookie: Longint; pbBuff: PByte;
  cb: Longint; var pcb: Longint): Longint; stdcall;
const
  ReadError = $0001;
  WriteError = $0002;
  NoError = $0000;
var
  Buffer, pBuff: PChar;
  StreamInfo: PwwRichEditStreamInfo;
  pos1, pos2: PChar;
begin
  Result := NoError;
  StreamInfo := PwwRichEditStreamInfo(Pointer(dwCookie));
  if not StreamInfo^.FirstTime then
  begin
     pcb:= 0;
     exit;
  end;
  Buffer := StrAlloc(cb + 1);
  try
    cb := cb div 2;
    pcb := 0;
    pBuff := Buffer + cb;
    try
      if StreamInfo^.Converter <> nil then
        pcb := StreamInfo^.Converter.ConvertReadStream(StreamInfo^.Stream, pBuff, cb);
      if pcb > 0 then
      begin
        pBuff[pcb] := #0;
        if pBuff[pcb - 1] = #13 then pBuff[pcb - 1] := #0;
        pcb := AdjustLineBreaks(Buffer, pBuff);
        if StreamInfo^.FirstPacketOnly then
        begin
           StreamInfo^.FirstTime:= False;

           { Retrieve until encounter '{', and then terminate RTF};
           pos1:= strpos(Buffer, '\pard');
           if pos1<>nil then begin
              pos2:= strpos(pos1, '{');
              if pos2<>nil then begin
                 pos2[0]:= '}';
                 pos2[1]:= #0;
              end
           end;
        end;
        Move(Buffer^, pbBuff^, pcb);
        if StreamInfo^.FirstPacketOnly then
           StreamInfo^.FirstTime:= False;
      end;
    except
      Result := ReadError;
    end;
  finally
    StrDispose(Buffer);
  end;
end;

procedure TwwCustomRichEdit.LoadPacketsFromStream(
   Stream: TStream; FirstPacketOnly: boolean; AppendMode: boolean);
var
  EditStream: TEditStream;
  Position: Longint;
  TextType: Longint;
  StreamInfo: TwwRichEditStreamInfo;
  Converter: TConversion;
begin
  StreamInfo.Stream := Stream;
  Converter := DefaultConverter.Create;

  StreamInfo.Converter := Converter;
  StreamInfo.FirstTime:= True;
  StreamInfo.FirstPacketOnly:= FirstPacketOnly;

  try
    with EditStream do
    begin
      dwCookie := LongInt(Pointer(@StreamInfo));
      pfnCallBack := @StreamLoad;
      dwError := 0;
    end;
    Position := Stream.Position;
    if PlainText then TextType := SF_TEXT
    else TextType := SF_RTF;
    if AppendMode then TextType:= TextType or SFF_SELECTION;
    SendMessage(self.Handle, EM_STREAMIN, TextType, Longint(@EditStream));

    if (TextType = SF_RTF) and (EditStream.dwError <> 0) then { Try twice }
    begin
      Stream.Position := Position;
      if PlainText then TextType := SF_RTF
      else TextType := SF_TEXT;
      SendMessage(self.Handle, EM_STREAMIN, TextType, Longint(@EditStream));
      if EditStream.dwError <> 0 then
        raise EOutOfResources.Create(sRichEditLoadFail);
    end;
  finally
    Converter.Free;
  end;
end;

procedure TwwDBRichEdit.LoadBlobStart(Field: TField);
var
  BlobStream: TStream;
begin
  BlobStream := Field.DataSet.CreateBlobStream(Field, bmRead);
  try
    LoadPacketsFromStream(BlobStream, True, False);
    FMemoLoaded := False;
  finally
    BlobStream.Free;
  end;
end;

procedure TwwDBRichEdit.SetParent(AParent: TWinControl);
begin
   if Parent <> AParent then
   begin
      InParentChanging:= True;
      try
        inherited SetParent(AParent);
        FMemoLoaded:= False;
      finally
        InParentChanging:= False;
      end
   end
   else inherited SetParent(AParent);
end;

procedure TwwDBRichEdit.CreateWnd;
begin
  inherited CreateWnd;
end;

procedure TwwDBRichEdit.WMPaint(var Message: TWMPaint);
var SaveCursor: TCursor;

   Function Twips(pixels: integer): integer;
   begin
       result := (pixels * 1440) div ScreenPixelsPerInch;
   end;

  { 3/30/99 - Support form.print command }
  procedure Print;
  var
    Range: TFormatRange;
    p: TPoint;
  begin
    FillChar(Range, SizeOf(TFormatRange), 0);
    with Range do
    begin
      hdc := Message.DC;
      hdcTarget:= Message.DC;
      chrg.cpMax := -1;
      chrg.cpMin := 0;
      p.x:= 1;
      p.y:= 1;

      chrg.cpMin := SendMessage(self.handle, EM_CHARFROMPOS, 0, Longint(@p));

      if (BorderStyle = bsNone) and IsInwwObjectView(self) then begin
        rc:= Rect(Twips(2), Twips(0), Twips(Width) {-Twips(2)},
             GetPrinterRect.Bottom);
      end
      else
        rc:= Rect(Twips(GutterWidth), Twips(1), Twips(Width)-Twips(GutterWidth),
             GetPrinterRect.Bottom);
      SendMessage(Self.Handle, EM_FORMATRANGE, 0, 0);
      SendMessage(Self.Handle, EM_FORMATRANGE, 1, Longint(@Range));
      SendMessage(Self.Handle, EM_FORMATRANGE, 0, 0);
    end;
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
   if (not FMemoLoaded) and (GetField<>Nil) then
   begin
      SaveCursor:= Screen.Cursor;
      Screen.Cursor:= crHourglass;
      LoadMemo;
      Screen.Cursor:= SaveCursor;
   end;

   if not (csDesigning in ComponentState) and
      (csPaintCopy in ControlState) then begin { Printing }
      Print;
      exit;
   end;

(*   if not InitEditRect then
   begin
      InitEditRect:= True;
      SetEditRect;  { Call after sizing richedit }
   end;
*)

{   if (not FMemoLoaded) and (GetField<>Nil) then
   begin
      SaveCursor:= Screen.Cursor;
      Screen.Cursor:= crHourglass;
      LoadMemo;
      Screen.Cursor:= SaveCursor;
   end;                   }
   if SkipPaint then exit;
   SkipErase:= True;
   inherited;
   SkipErase:= False;

   if Frame.IsFrameEffective then
   begin
      CanvasNeeded;
      FCanvas.Handle:= message.DC;
      wwDrawEdge(self, Frame, FCanvas, Focused);
      FCanvas.Handle:= 0;
   end;


end;


procedure TwwCustomRichEdit.DefineProperties(Filer: TFiler);
begin
  Filer.DefineProperty('RichEditVersion', ReadVersion, WriteVersion, True);
  inherited DefineProperties(Filer);
  Filer.DefineBinaryProperty('Data', ReadData, WriteData, GetField=Nil);
end;

procedure TwwCustomRichEdit.ReadVersion(Reader: TReader);
var OldRichEditVersion: integer;
begin
   OldRichEditVersion:= FRichEditVersion;
   FRichEditVersion:= Reader.ReadInteger;
   if HandleAllocated and (OldRichEditVersion<>FRichEditVersion) then
      RecreateWnd;
end;

procedure TwwCustomRichEdit.WriteVersion(Writer: TWriter);
begin
   FRichEditVersion:= 2;
   Writer.WriteInteger(RichEditVersion)
end;

procedure TwwCustomRichEdit.ReadData(Stream: TStream);
var Size: integer;
    TempStream: TwwRichMemoryStream;
begin
  TempStream:= TwwRichMemoryStream.create;
  try
     PlainText:= False;
     Stream.ReadBuffer(Size, SizeOf(Size));
     if Size>0 then begin
        TempStream.CopyFrom(Stream, Size);
        TempStream.position:= 0;
        ILines.LoadFromStream(TempStream);
     end;
     NewDataFormat:= True;
  finally
     TempStream.Free;
  end
end;

procedure TwwCustomRichEdit.WriteData(Stream: TStream);
var TempStream: TwwRichMemoryStream;
    Size: integer;
begin
   TempStream:= TwwRichMemoryStream.create;
   try
      ILines.SaveToStream(TempStream);
      TempStream.position:= 0;
      Size:= TempStream.Size;
      Stream.WriteBuffer(Size, SizeOf(Size));
      if Size>0 then
        Stream.WriteBuffer(PChar(TempStream.Memory)^, Size);
   finally
      TempStream.free;
   end;
end;

{ On right click - send message so clicked area is selected - i.e. OLE selection}
procedure TwwCustomRichEdit.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
type
  TPosition = record
    x: Word;
    y: Word;
  end;
var
  wp: TPosition;
  oldSelStart, OldSelLength: integer;
begin
   if InMouseUp then exit;
   InMouseUp:= True;
   try
      if Button =  mbRight then
      begin
         wp.x:= x;
         wp.y:= y;
         OldSelStart:= SelStart;
         OldSelLength:= SelLength;
         SendMessage(Handle, WM_LBUTTONDOWN, 0 , Integer(wp)); { Selects object }
         SendMessage(Handle, WM_LBUTTONUP, 0 , Integer(wp));
         if selText='' then  { Restore previuos selection }
         begin
            SelStart:= OldSelStart;
            SelLength:= OldSelLength;
         end;
      end;
      inherited MouseUp(mbLeft, Shift, X, Y);
      URLDetectButtonPressed:= False;
   finally
      InMouseUp:= False;
   end;
end;

procedure TwwCustomRichEdit.WndProc(var Message: TMessage);
const FR_DOWN = $00000001;
begin
  if (Message.Msg = EM_FINDTEXT) and (Patch[0]=False) then begin {8/24/98 }
     Message.wParam:= Message.wParam or FR_DOWN;
  end
  else if (Message.Msg = CN_NOTIFY) then
     if (TWMNotify(Message).NMHdr.Code =  EN_LINK) then
     begin
        URLLinkNotification(TWMNotify(Message).NMHdr);
        exit;
     end;
  inherited WndProc(Message);
end;

procedure TwwCustomRichEdit.WMNotify(var Message: TWMNotify);
begin
{  with Message.NMHdr^ do
    case code of
      EN_Link: URLLinkNotification(Message.NMHdr);
    end;
}
  inherited;

end;

procedure TwwCustomRichEdit.DoURLOpen(URLLink: string; var UseDefault: boolean);
begin
   if Assigned(FOnURLOpen) then FOnURLOpen(self, URLLink, UseDefault);
end;

procedure TwwCustomRichEdit.URLLinkNotification(Link: Pointer);
type
  TTextRange = record
    chrg: TCharRange;
    lpstrText: PAnsiChar;
  end;
var sz: string;
    TextRange: TTextRange;
    pENLink: ^TENLink absolute link;
    UseDefault: boolean;
begin
   with pENLink^ do begin
      SetLength(sz, chrg.cpMax - chrg.cpMin);
      TextRange.chrg:= chrg;
      TextRange.lpstrText:= Pointer(sz);
      Perform(em_getTextRange, 0, Integer(@TextRange));

      if (Msg = WM_LBUTTONDOWN) then
      begin
          URLDetectButtonPressed:= True;
      end
      else if(Msg = WM_LBUTTONUP) then
      begin
          if URLDetectButtonPressed then
          begin
             UseDefault:= True;
             URLDetectButtonPressed:= False;
             DoURLOpen(sz, UseDefault);
             if UseDefault then
             begin
                Screen.Cursor:= crHourGlass;
                ShellExecute(Handle, 'OPEN', PChar(sz), nil, nil, sw_shownormal);
                Screen.Cursor:= crDefault; { 10/30/98 - Restore to default cursor }
             end
          end;
      end
   end
end;

procedure TwwCustomRichEdit.SetAutoURLDetect(val: boolean);
var mask: longint;
begin
   if FAutoURLDetect<>val then
   begin
      FAutoURLDetect:= val;
      if val then begin
        Perform(EM_AutoURLDetect, 1, 0);
        mask:= Perform(em_GetEventMask, 0, 0);
        mask:= mask or enm_link;
        Perform(em_SetEventMask, 0, mask);
      end
      else begin
        Perform(EM_AutoURLDetect, 0, 0);
        mask:= Perform(em_GetEventMask, 0, 0);
        mask:= mask and not enm_link;
        Perform(em_SetEventMask, 0, mask);
      end
   end;
end;

procedure TwwCustomRichEdit.SetUserSpeedButton1(val: TSpeedButton);
begin
   if FUserSpeedButton1<>val then
   begin
      FUserSpeedButton1:= val;
      FUserSpeedButton1.visible:= false;
   end
end;

procedure TwwCustomRichEdit.SetUserSpeedButton2(val: TSpeedButton);
begin
   if FUserSpeedButton2<>val then
   begin
      FUserSpeedButton2:= val;
      FUserSpeedButton2.visible:= false;
   end
end;

procedure TwwCustomRichEdit.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
   if IsInwwObjectViewPaint(self) or SkipErase then begin  { Delphi's paint causes background to be erased }
                           { Don't erase as otherwise a whole line is
                             repainted on each keystroke }
     Message.result:= 1;
     exit;
  end;

  inherited;
end;

{ 10/18/98 - Re-implement TOleContainer so that TDataObject supports OLE Icon copy }
type
  PFormatList = ^TFormatList;
  TFormatList = array[0..255] of TFormatEtc;

type
  TEnumFormatEtc = class(TInterfacedObject, IEnumFormatEtc)
  private
    FFormatList: PFormatList;
    FFormatCount: Integer;
    FIndex: Integer;
  public
    constructor Create(FormatList: PFormatList; FormatCount, Index: Integer);
    { IEnumFormatEtc }
    function Next(celt: Longint; out elt; pceltFetched: PLongint): HResult; stdcall;
    function Skip(celt: Longint): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out enum: IEnumFormatEtc): HResult; stdcall;
  end;

constructor TEnumFormatEtc.Create(FormatList: PFormatList;
  FormatCount, Index: Integer);
begin
  inherited Create;
  FFormatList := FormatList;
  FFormatCount := FormatCount;
  FIndex := Index;
end;

function TEnumFormatEtc.Next(celt: Longint; out elt; pceltFetched: PLongint): HResult;
var
  I: Integer;
begin
  I := 0;
  while (I < celt) and (FIndex < FFormatCount) do
  begin
    TFormatList(elt)[I] := FFormatList[FIndex];
    Inc(FIndex);
    Inc(I);
  end;
  if pceltFetched <> nil then pceltFetched^ := I;
  if I = celt then Result := S_OK else Result := S_FALSE;
end;

function TEnumFormatEtc.Skip(celt: Longint): HResult;
begin
  if celt <= FFormatCount - FIndex then
  begin
    FIndex := FIndex + celt;
    Result := S_OK;
  end else
  begin
    FIndex := FFormatCount;
    Result := S_FALSE;
  end;
end;

function TEnumFormatEtc.Reset: HResult;
begin
  FIndex := 0;
  Result := S_OK;
end;

function TEnumFormatEtc.Clone(out enum: IEnumFormatEtc): HResult;
begin
  enum := TEnumFormatEtc.Create(FFormatList, FFormatCount, FIndex);
  Result := S_OK;
end;


type
  TDataObject = class(TInterfacedObject, IDataObject)
  private
    FOleObject: IOleObject;
    function GetObjectDescriptor: HGlobal;
  public
    constructor Create(const OleObject: IOleObject);
    { IDataObject }
    function GetData(const formatetcIn: TFormatEtc;
      out medium: TStgMedium): HResult; stdcall;
    function GetDataHere(const formatetc: TFormatEtc;
      out medium: TStgMedium): HResult; stdcall;
    function QueryGetData(const formatetc: TFormatEtc): HResult; stdcall;
    function GetCanonicalFormatEtc(const formatetc: TFormatEtc;
      out formatetcOut: TFormatEtc): HResult; stdcall;
    function SetData(const formatetc: TFormatEtc; var medium: TStgMedium;
      fRelease: BOOL): HResult; stdcall;
    function EnumFormatEtc(dwDirection: Longint; out enumFormatEtc:
      IEnumFormatEtc): HResult; stdcall;
    function DAdvise(const formatetc: TFormatEtc; advf: Longint;
      const advSink: IAdviseSink; out dwConnection: Longint): HResult; stdcall;
    function DUnadvise(dwConnection: Longint): HResult; stdcall;
    function EnumDAdvise(out enumAdvise: IEnumStatData): HResult; stdcall;
  end;

const DataFormatCount = 2;
var
  CFObjectDescriptor: Integer;
  CFEmbeddedObject: Integer;
  DataFormats: array[0..DataFormatCount - 1] of TFormatEtc;

constructor TDataObject.Create(const OleObject: IOleObject);
begin
  inherited Create;
  FOleObject := OleObject;
end;

function GetFullNameStr(const OleObject: IOleObject): string;
var
  P: PWideChar;
begin
  OleObject.GetUserType(USERCLASSTYPE_FULL, P);
  Result := P;
  CoTaskMemFree(P);
end;

function GetDisplayNameStr(const OleLink: IOleLink): string;
var
  P: PWideChar;
begin
  OleLink.GetSourceDisplayName(P);
  Result := P;
  CoTaskMemFree(P);
end;


function TDataObject.GetObjectDescriptor: HGlobal;
var
  DescSize, UTNCharLen, SOCCharLen: Integer;
  Descriptor: PObjectDescriptor;
  UserTypeName, SourceOfCopy: string;
  OleLink: IOleLink;
  P: PWideChar;
begin
  UserTypeName := GetFullNameStr(FOleObject);
  SourceOfCopy := UserTypeName;
  FOleObject.QueryInterface(IOleLink, OleLink);
  if OleLink <> nil then
  begin
    UserTypeName := Format(SLinkedObject, [UserTypeName]);
    SourceOfCopy := GetDisplayNameStr(OleLink);
  end;
  UTNCharLen := MultiByteToWideChar(0, 0, PChar(UserTypeName),
      Length(UserTypeName), nil, 0) + 1;
  SOCCharLen := MultiByteToWideChar(0, 0, PChar(SourceOfCopy),
      Length(SourceOfCopy), nil, 0) + 1;
  DescSize := SizeOf(TObjectDescriptor) +
    ((UTNCharLen + SOCCharLen) * Sizeof(WideChar));
  Result := GlobalAlloc(GMEM_MOVEABLE, DescSize);
  if Result <> 0 then
  begin
    Descriptor := GlobalLock(Result);
    FillChar(Descriptor^, DescSize, 0);
    with Descriptor^ do
    begin
      cbSize := DescSize;
      FOleObject.GetUserClassID(clsid);
      dwDrawAspect := DVASPECT_ICON;
      FOleObject.GetMiscStatus(DVASPECT_ICON, dwStatus);

      dwFullUserTypeName := SizeOf(TObjectDescriptor);
      P := PWideChar(Integer(Descriptor) + dwFullUserTypeName);
      MultiByteToWideChar(0, 0, PChar(UserTypeName), Length(UserTypeName),
        P, UTNCharLen);
      P[UTNCharLen-1] := #0;

      dwSrcOfCopy := dwFullUserTypeName + SOCCharLen * SizeOf(WideChar);
      P := PWideChar(Integer(Descriptor) + dwSrcOfCopy);
      MultiByteToWideChar(0, 0, PChar(SourceOfCopy), Length(SourceOfCopy),
        P, SOCCharLen);
      P[SOCCharLen-1] := #0;
    end;
    GlobalUnlock(Result);
  end;
end;

function TDataObject.GetData(const formatetcIn: TFormatEtc;
  out medium: TStgMedium): HResult;
var
  Descriptor: HGlobal;
begin
  Result := DV_E_FORMATETC;
  medium.tymed := 0;
  medium.hGlobal := 0;
  medium.unkForRelease := nil;
  with formatetcIn do
  begin
    if (cfFormat = CFObjectDescriptor) and (dwAspect = DVASPECT_CONTENT) and
      (tymed = TYMED_HGLOBAL) then
    begin
      Descriptor := GetObjectDescriptor;
      if Descriptor <> 0 then
      begin
        medium.tymed := TYMED_HGLOBAL;
        medium.hGlobal := Descriptor;
        Result := S_OK;
      end;
    end;
  end;
end;

function TDataObject.GetDataHere(const formatetc: TFormatEtc;
  out medium: TStgMedium): HResult;
var
  PersistStorage: IPersistStorage;
begin
  Result := DV_E_FORMATETC;
  with formatetc do
    if (cfFormat = CFEmbeddedObject) and (dwAspect = DVASPECT_CONTENT) and
      (tymed = TYMED_ISTORAGE) then
    begin
      medium.unkForRelease := nil;
      FOleObject.QueryInterface(IPersistStorage, PersistStorage);
      if PersistStorage <> nil then
      begin
        Result := OleSave(PersistStorage, IStorage(medium.stg), False);
        PersistStorage.SaveCompleted(nil);
      end;
    end;
end;

function TDataObject.QueryGetData(const formatetc: TFormatEtc): HResult;
begin
  Result := DV_E_FORMATETC;
  with formatetc do
    if dwAspect = DVASPECT_CONTENT then
      if (cfFormat = CFEmbeddedObject) and (tymed = TYMED_ISTORAGE) or
        (cfFormat = CFObjectDescriptor) and (tymed = TYMED_HGLOBAL) then
        Result := S_OK;
end;

function TDataObject.GetCanonicalFormatEtc(const formatetc: TFormatEtc;
  out formatetcOut: TFormatEtc): HResult;
begin
  formatetcOut.ptd := nil;
  Result := E_NOTIMPL;
end;

function TDataObject.SetData(const formatetc: TFormatEtc; var medium: TStgMedium;
  fRelease: BOOL): HResult;
begin
  Result := E_NOTIMPL;
end;

function TDataObject.EnumFormatEtc(dwDirection: Longint; out enumFormatEtc:
  IEnumFormatEtc): HResult;
begin
  if dwDirection = DATADIR_GET then
  begin
    enumFormatEtc := TEnumFormatEtc.Create(@DataFormats, DataFormatCount, 0);
    Result := S_OK;
  end else
  begin
    enumFormatEtc := nil;
    Result := E_NOTIMPL;
  end;
end;

function TDataObject.DAdvise(const formatetc: TFormatEtc; advf: Longint;
  const advSink: IAdviseSink; out dwConnection: Longint): HResult;
begin
  Result := OLE_E_ADVISENOTSUPPORTED;
end;

function TDataObject.DUnadvise(dwConnection: Longint): HResult;
begin
  Result := OLE_E_ADVISENOTSUPPORTED;
end;

function TDataObject.EnumDAdvise(out enumAdvise: IEnumStatData): HResult;
begin
  Result := OLE_E_ADVISENOTSUPPORTED;
end;


{ 12/29/98 - Implement our own InsertObjectDialog to disable link button }
{ Links not properly supported by copy and paste technique }
procedure CenterWindow(Wnd: HWnd);
var
  Rect: TRect;
begin
  GetWindowRect(Wnd, Rect);
  SetWindowPos(Wnd, 0,
    (GetSystemMetrics(SM_CXSCREEN) - Rect.Right + Rect.Left) div 2,
    (GetSystemMetrics(SM_CYSCREEN) - Rect.Bottom + Rect.Top) div 3,
    0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
end;


{ Generic dialog hook. Centers the dialog on the screen in response to
  the WM_INITDIALOG message }
function OleDialogHook(Wnd: HWnd; Msg, WParam, LParam: Longint): Longint; stdcall;
begin
  Result := 0;
  if Msg = WM_INITDIALOG then
  begin
    if GetWindowLong(Wnd, GWL_STYLE) and WS_CHILD <> 0 then
      Wnd := GetWindowLong(Wnd, GWL_HWNDPARENT);
    CenterWindow(Wnd);
    Result := 1;
  end;
end;


function InsertObjectDialogNoLink(richedit: TwwCustomRichEdit;
    OleContainer: TOleContainer): Boolean;
var
  Data: TOleUIInsertObject;
  NameBuffer: array[0..255] of Char;
  CreateInfo: TCreateInfo;
begin
  with OleContainer do begin
  Result := False;
  FillChar(Data, SizeOf(Data), 0);
  FillChar(NameBuffer, SizeOf(NameBuffer), 0);
  Data.cbStruct := SizeOf(Data);
  Data.dwFlags := IOF_SELECTCREATENEW or IOF_DISABLELINK;
  Data.hWndOwner := Application.Handle;
  Data.lpfnHook := OleDialogHook;
  Data.lpszFile := NameBuffer;
  Data.cchFile := SizeOf(NameBuffer);
  try
    if OleUIInsertObject(Data) = OLEUI_OK then
    begin
      if Data.dwFlags and IOF_SELECTCREATENEW <> 0 then
      begin
        CreateInfo.CreateType := ctNewObject;
        CreateInfo.ClassID := Data.clsid;
      end else
      begin
        if Data.dwFlags and IOF_CHECKLINK = 0 then
          CreateInfo.CreateType := ctFromFile else
          CreateInfo.CreateType := ctLinkToFile;
        CreateInfo.FileName := NameBuffer;
      end;
      CreateInfo.ShowAsIcon := Data.dwFlags and IOF_CHECKDISPLAYASICON <> 0;
      CreateInfo.IconMetaPict := Data.hMetaPict;
      CreateObjectFromInfo(CreateInfo);
      Result := True;
    end;
  finally
    DestroyMetaPict(Data.hMetaPict);
  end
  end;
end;

function TwwCustomRichEdit.InsertObjectDialog: Boolean;
var c: TOleContainer;
  { Put in procedure as code outside procedure does not work with Ole }
  procedure CopyOle;
  begin
      c.Close;
      OleCheck(OleSetClipboard(TDataObject.Create(c.OleObjectInterface) as IDataObject));
  end;
begin
   c:= TOleContainer.create(self);
   with c do try
      visible:= False;
      parent:= self;
      { 12/29/98 - Disable OLE Link to File from dialog since its not supported }
      if Patch[3] then
        result:= InsertObjectDialog
      else
        result:= InsertObjectDialogNoLink(self, c);
      if not result then exit;

      if c.iconic then CopyOle
      else Copy;
      self.selLength:= 0;
      self.PasteFromClipboard;
      Clipboard.clear; { clear so no memory leak }

      self.setfocus;
      self.selStart:= wwmax(0, self.selStart - 1);
      self.selLength:= 1;
   finally
      self.invalidate;
      Free;
   end;
end;

{ Don't call Borland's version as it is much slower and also resets the editrect }
procedure TwwCustomRichEdit.CMFontChanged(var Message: TMessage);
   procedure Assign;
   begin
      with DefAttributes do begin
        if Name<>Font.Name then Name:= Font.Name;
        if Size<>Font.Size then Size:= Font.Size;
        if Style<>Font.Style then Style:= Font.Style;
        if Color<>Font.Color then Color:= Font.Color;
        if Charset<>Font.Charset then Charset := Font.Charset;
        if Pitch<>Font.Pitch then Pitch := Font.Pitch;
     end
   end;
begin
   Assign;

//   if (Owner<>Nil) and (not (csLoading in Owner.ComponentState)) then SetEditRect;
   exit;

   { SetEditRect called in paint event after recreatewnd }
{   FLastSetRect:= Rect(0,0,0,0);
   InitEditRect:= False;
   Invalidate;}
end;
{
function TwwCustomRichEdit.FindText(const SearchStr: string;
  StartPos, Length: Integer; Options: TSearchTypes): Integer;
const FR_DOWN = $00000001;
var
  Find: TFindText;
  Flags: Integer;
begin
  FillChar(Find, SizeOf(TFindText), 0);
  with Find.chrg do
  begin
    cpMin := StartPos;
    cpMax := (cpMin + Length);
  end;
  Flags := FR_DOWN;
  if stWholeWord in Options then Flags := Flags or FT_WHOLEWORD;
  if stMatchCase in Options then Flags := Flags or FT_MATCHCASE;
  Find.lpstrText := PChar(SearchStr);
  Result := SendMessage(Handle, EM_FINDTEXT, Flags, LongInt(@Find));
end;
}

function TwwCustomRichEdit.FindTextBefore(const SearchStr: string;
  StartPos, Length: Integer; Options: TSearchTypes): Integer;
const FR_DOWN = $00000001;
var
  Find: TFindText;
  Flags: Integer;
begin
  FillChar(Find, SizeOf(TFindText), 0);
  with Find.chrg do
  begin
    cpMin := StartPos;
    cpMax := (cpMin + Length);
  end;
  Flags := 0;
  if stWholeWord in Options then Flags := Flags or FT_WHOLEWORD;
  if stMatchCase in Options then Flags := Flags or FT_MATCHCASE;
  Find.lpstrText := PChar(SearchStr);
  Patch[0]:= True;
  Result := SendMessage(Handle, EM_FINDTEXT, Flags, LongInt(@Find));
  Patch[0]:= False;
end;

{ Workaround for problem with lines.add }
{ Delphi's TCustomRichEdit raises a bogus exception so we
  trick it by changing the length of the str passes to this function.
  This code can be dangerous if EMReplaceSelection is called, where
  the caller is not using a Delphi String object.  This is the
  reason for all the extra checks.  }
{procedure TwwCustomRichEdit.EMReplaceSelection(var Message: TMessage);
type PInteger = ^Integer;
var lenPtr: PInteger;
    str: PChar;
    oldselstart: integer;
begin
   if selLength=0 then
   begin
      inherited;
      str:= PChar(pointer(Message.lparam));
      if (strlen(str)>=2) then
      begin
         if ((str[0]=#13) and (str[1]=#10)) or
            ((str[strlen(str)-2]=#13) and (str[strlen(str)-1]=#10)) then
         begin
            lenPtr:= PInteger(pointer(Message.lparam-4));
            if lenPtr^>0 then lenPtr^:= lenPtr^-1;
         end
      end
   end
   else inherited;
end;
}

Function TwwCustomRichEdit.ILines: TStrings;
begin
   result:= inherited Lines;
end;

{$ifdef wwdelphi4up}
procedure TwwCustomRichEdit.CMShowingChanged(var Message: TMessage);
begin
  inherited;
  if Showing and (parent<>nil) and
     (parent.align<>alNone) and
     ((parent.height=0) or (parent.width=0)) { 11/12/98} and (Patch[2]=False) then
     RequestAlign; { 11/4/98 - Workaround Delphi 4 showing bug within tabsheet}
end;
{$endif}

procedure Register;
begin
end;


var LibHandle: THandle;

procedure Initialize;
var
    RichEditModuleName: PChar;
begin
  CFObjectDescriptor := RegisterClipboardFormat('Object Descriptor');
  CFEmbeddedObject := RegisterClipboardFormat('Embedded Object');
  DataFormats[0].cfFormat := CFEmbeddedObject;
  DataFormats[0].dwAspect := DVASPECT_CONTENT;
  DataFormats[0].lIndex := -1;
  DataFormats[0].tymed := TYMED_ISTORAGE;
  DataFormats[1].cfFormat := CFObjectDescriptor;
  DataFormats[1].dwAspect := DVASPECT_CONTENT;
  DataFormats[1].lIndex := -1;
  DataFormats[1].tymed := TYMED_HGLOBAL;

  { 7/3/99 - Create global handle to richedit dll so that component-level cleanup
    that depends upon dll does not fail.
  }
  RichEditModuleName:= 'RICHED20.DLL';
  LibHandle := LoadLibrary(RichEditModuleName);
end;

function GetPropertyID(Dispatch: IDispatch; const PropertyName: WideString): Integer;
var
  PName: PWideChar;
begin
  PName := PWideChar(PropertyName);
  if PropertyName = '' then
    Result := DISPID_UNKNOWN else
    OleCheck(Dispatch.GetIDsOfNames(GUID_NULL, @PName, 1, GetThreadLocale,
      @Result));
end;
(*
function wwInvokeDispatch(Disp: IDispatch; DispatchName: string): boolean;
var
  ExcepInfo: TExcepInfo;
  DispParams: TDispParams;
  Status: HResult;
  DispID: TDispID;
  ResultDispatch: Variant;
begin
  DispID:= GetPropertyID(Disp, DispatchName);
  FillChar(DispParams, SizeOf(DispParams), 0);
  Status := Disp.Invoke(DispID, GUID_NULL, 0, DISPATCH_METHOD, DispParams,
    @ResultDispatch, @ExcepInfo, nil);
  result:= Succeeded(Status); // then DispatchInvokeError(Status, ExcepInfo);
end;
*)
{
function InvokeDispatch(Disp: IDispatch; DispatchName: string): integer;
var
  ExcepInfo: TExcepInfo;
  DispParams: TDispParams;
  Status: HResult;
  DispID: TDispID;
  ResultDispatch: Variant;
begin
  DispID:= GetPropertyID(Disp, DispatchName);
  FillChar(DispParams, SizeOf(DispParams), 0);
  Status := Disp.Invoke(DispID, GUID_NULL, 0, DISPATCH_METHOD, DispParams,
    @ResultDispatch, @ExcepInfo, nil);
  result:= ResultDispatch;
//  result:= status;
end;
}


function ProgIDToClassID(const ProgID: string; var status: HResult): TGUID;
begin
   Status:= CLSIDFromProgID(PWideChar(WideString(ProgID)), Result);
end;

function CreateOleObject(const ClassName: string; var status: HResult): IDispatch;
var
  ClassID: TCLSID;
begin
  ClassID := ProgIDToClassID(ClassName, status);
  if Succeeded(status) then
     Status:=
        CoCreateInstance(ClassID, nil, CLSCTX_INPROC_SERVER or
          CLSCTX_LOCAL_SERVER, IDispatch, Result);
end;

{$ifdef wwDelphi5Up}
type
 TwwWordApplication=class(TWordApplication)
  private
    ValidServer: boolean;
  protected
    function GetServer: IUnknown; override;
 end;

function CreateComObject(const ClassID: TGUID; var Status: HResult): IUnknown;
begin
  Status:= CoCreateInstance(ClassID, nil, CLSCTX_INPROC_SERVER or
    CLSCTX_LOCAL_SERVER, IUnknown, Result);
end;

function TwwWordApplication.GetServer: IUnknown;
var Status: HResult;
begin
  case ConnectKind of
    ckNewInstance:
      Result := CreateComObject(ServerData^.ClassId, Status)
    else Result:= inherited GetServer;
  end;
  ValidServer:= (Result<>nil);
  if not ValidServer then abort; //OleCheck(Status);
end;
{$endif}

Function TwwCustomRichEdit.MSWordSpellChecker: boolean;
{$ifdef wwDelphi5Up}
var
//    Word: Variant;
//    OleStatus: HREsult;
    ErrorStarting: boolean;

function SpellCheckWithCom: boolean;
var
  RouteDocument, OriginalFormat, SaveChanges: OLEVariant;
  BoolFalse, EmptyString, Format, FileNameOLE: OLEVariant;
  WordApplication: TwwWordApplication;
  FileName:string;
  NoErrors: OLEVariant;
  Data: OLEVariant;
begin
    result:= False;
    if not GetUniqueFileName(FileName) then begin
       ShowMessage('Fail to create temporary file.');
       exit;
    end;

    ILines.SaveToFile(FileName);

    Screen.cursor:= crHourGlass;
    WordApplication:= TwwWordApplication.create(self);
    try
       WordApplication.ConnectKind:= ckNewInstance;

       with WordApplication do begin
         ErrorStarting:= True;
         Connect;
         ErrorStarting:= not Validserver;
         if not ValidServer then begin
            exit;
         end;

         WindowState:= wdWindowStateMinimize;

         Data:= self.text;
         NoErrors:= CheckGrammar(Data);
         if NoErrors then exit;

         FileNameOLE := FileName;
         BoolFalse:= False;
         EmptyString:= '';
         Format:= wdOpenFormatAuto;
         Documents.Open(FileNameOLE, BoolFalse, BoolFalse,
            BoolFalse, EmptyString, EmptyString, BoolFalse,
            EmptyString, EmptyString, format);
         Visible := False;

         ActiveDocument.CheckGrammar;
         ActiveDocument.Save;

         SaveChanges:= wdDoNotSaveChanges;
         OriginalFormat:= wdOriginalDocumentFormat;
         RouteDocument:= False;
         ActiveDocument.Close(SaveChanges, OriginalFormat, RouteDocument);
         Quit(SaveChanges, OriginalFormat, RouteDocument);
      end;
   finally
//       WordApplication.Disconnect;
       WordApplication.Free;
       if (not ErrorStarting) then
          if (not NoErrors) then
             ILines.LoadFromFile(FileName);
       DeleteFile(FileName);
       Application.BringToFront;
       Screen.Cursor:= crArrow;
   end;
   if Not ErrorStarting then
      result:= not NoErrors
   else result:= false
end;
{$Endif}

begin
   result:= true;
   if not ((reoSpellCheck in SpellCheckOptions) or (reoGrammarCheck in SpellCheckOptions)) then exit;

   {$ifdef wwDelphi5Up}
   try
      result:= SpellCheckWithCom;
   except
      if ErrorStarting then begin
         result:= False;
         MessageDlg(wwInternational.UserMessages.RichEditMSWordNotFound,
                    mtInformation, [mbOK], 0);
         exit;
      end;
      raise;
   end;

   if not result then
      MessageDlg(wwInternational.UserMessages.RichEditSpellCheckComplete,
                    mtInformation, [mbOK], 0);
   {$endif}
end;


Function TwwCustomRichEdit.MSWordPrintDocument(TemplateFileName: string): boolean;
var FileName: string;
    Word: Variant;
    OleStatus: HREsult;
begin
   word:= CreateOleObject('Word.Basic', OleStatus);
   result:= True;
   if not Succeeded(OleStatus) then begin
      result:= false;
      MessageDlg(wwInternational.UserMessages.RichEditMSWordNotFound,
                    mtInformation, [mbOK], 0);
      exit;
   end;

   if not GetUniqueFileName(FileName) then begin
      ShowMessage('Fail to create temporary file.');
      exit;
   end;

   try
      Screen.cursor:= crHourGlass;
      ILines.SaveToFile(FileName);
      if TemplateFileName<>'' then
      begin
         Word.FileOpen(TemplateFileName);
         Word.InsertFile(FileName);
      end
      else
         Word.FileOpen(FileName);

      word.StartOfDocument;
      word.AppMinimize;
      word.FilePrint(0);
   finally
      Screen.Cursor:= crArrow;
      Word.FileClose(2);
      Word.FileExit;
      DeleteFile(FileName);
   end;

end;

procedure TwwCustomRichEdit.CNKeyDown(var Message: TWMKeyDown);
var shiftState: TShiftState;
begin
//  if not (csDesigning in ComponentState) then
  if not wwIsDesigning(self) then
  begin
    with Message do
    begin
       shiftState:= KeyDataToShiftState(KeyData);
       if (WantReturns) and (charcode=vk_return) and { Ctrl-Enter goes to grid }
           not (ssCtrl in shiftState) then begin
           inherited;
           exit;
       end;
       if (charcode = VK_TAB) or (charcode = VK_RETURN) then begin
          if parent is TCustomGrid then begin
            if (charcode <> VK_TAB) or (goTabs in TCheatGridCast(parent).Options) then
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

procedure TwwCustomRichEdit.WMChar(var Message: TWMChar);
begin
  if (parent is TCustomGrid)
     and (message.charcode = 9) then exit;
  inherited;
end;

procedure TwwCustomRichEdit.WMVScroll(var Message: TWMVScroll);
begin
  if IsTransparentEffective and CanFocus then SetFocus;
  inherited;
(*
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
*)
end;

initialization
  OleInitialize(nil);
  Initialize;
finalization
  FreeLibrary(LibHandle);
  OleUninitialize;
end.
