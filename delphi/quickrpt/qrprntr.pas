{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 3.0 for Delphi and C++Builder               ::
  ::                                                         ::
  :: QRPRNTR.PAS - LOW LEVEL PRINT AND PREVIEW CLASSES       ::
  ::                                                         ::
  :: Copyright (c) 1998 QuSoft AS                            ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.no                               ::
  ::                                                         ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }

{$I QRDEFS.INC}

unit QRPrntr;

{$R-}
{$T-}
{$B-}

interface

uses
  Windows, winspool, Sysutils, Messages, Classes, Controls, StdCtrls, ExtCtrls,
  ComCtrls, Buttons, Printers, Graphics, Forms, DB, DBTables, QR3Const, Dialogs;
type
  { All the known paper sizes }
  TQRPaperSize = (Default,
                  Letter,
                  LetterSmall,
                  Tabloid,
                  Ledger,
                  Legal,
                  Statement,
                  Executive,
                  A3,
                  A4,
                  A4Small,
                  A5,
                  B4,
                  B5,
                  Folio,
                  Quarto,
                  qr10X14,
                  qr11X17,
                  Note,
                  Env9,
                  Env10,
                  Env11,
                  Env12,
                  Env14,
                  CSheet,
                  DSheet,
                  ESheet,
                  Custom);

  TQRBin = (First,
            Upper,
            Lower,
            Middle,
            Manual,
            Envelope,
            EnvManual,
            Auto,
            Tractor,
            SmallFormat,
            LargeFormat,
            LargeCapacity,
            Cassette,
            Last);

const
   cQRName = 'QuickReport 3.0.5'; { This string should not be resourced }
   cQRVersion = 305;
   cQRPDefaultExt = 'QRP';      { Default extesion for QRP files }
   cQRDefaultExt = 'QR';        { Default extesion for QR files }
   { Actual paper sizes for all the known paper types }
   cQRPaperSizeMetrics : array[Letter..ESheet, 0..1] of extended =
      ((215.9, 279.4), { Letter }
       (215.9, 279.4), { Letter small }
       (279.4, 431.8), { Tabloid }
       (431.8, 279.4), { Ledger }
       (215.9, 355.6), { Legal }
       (139.7, 215.9), { Statement }
       (190.5, 254.0), { Executive }
       (297.0, 420.0), { A3 }
       (210.0, 297.0), { A4 }
       (210.0, 297.0), { A4 small }
       (148.0, 210.0), { A5 }
       (250.0, 354.0), { B4 }
       (182.0, 257.0), { B5 }
       (215.9, 330.2), { Folio }
       (215.0, 275.0), { Quarto }
       (254.0, 355.6), { 10X14 }
       (279.4, 431.8), { 11X17 }
       (215.9, 279.0), { Note }
       (98.43, 225.4), { Envelope #9 }
       (104.8, 241.3), { Envelope #10 }
       (114.3, 263.5), { Envelope #11 }
       (101.6, 279.4), { Envelope #12 - might be wrong !! }
       (127.0, 292.1), { Envelope #14 }
       (100.0, 100.0),
       (100.0, 100.0),
       (100.0, 100.0));

   { Table for translating TQRPaperSize to values which can be used with the
     printer driver }
   cQRPaperTranslate : array[Default..Custom] of integer =
       (0,
       dmpaper_Letter,
       dmpaper_LetterSmall,
       dmpaper_Tabloid,
       dmpaper_Ledger,
       dmpaper_Legal,
       dmpaper_Statement,
       dmpaper_Executive,
       dmpaper_A3,
       dmpaper_A4,
       dmpaper_A4Small,
       dmpaper_A5,
       dmpaper_B4,
       dmpaper_B5,
       dmpaper_Folio,
       dmpaper_Quarto,
       dmpaper_10X14,
       dmpaper_11X17,
       dmpaper_Note,
       dmpaper_Env_9,
       dmpaper_Env_10,
       dmpaper_Env_11,
       dmpaper_Env_12,
       dmpaper_Env_14,
       dmpaper_CSheet,
       dmpaper_DSheet,
       dmpaper_ESheet,
       $100);

   cQRBinTranslate : array[First..Last] of integer =
     (1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 14, 14);

type
  TQRBandType = (rbTitle,
                 rbPageHeader,
                 rbDetail,
                 rbPageFooter,
                 rbSummary,
                 rbGroupHeader,
                 rbGroupFooter,
                 rbSubDetail,
                 rbColumnHeader,
                 rbOverlay,
                 rbChild);

const
  { Misc constants }
  cQRPageShadowWidth = 2;
  cQRPageFrameWidth = 1;
  cQRPageShadowColor = clBlack;
  cQRCornerSize = 4;

  { TQRCompress related declarations }

const
  { TQRCompress constants }
  MaxChar = 256;
  EofChar = 256;
  PredMax = 255;
  TwiceMax = 512;
  ROOT = 0;
  BitMask : array[0..7] of Byte = (1, 2, 4, 8, 16, 32, 64, 128);

  CM_QRPROGRESSUPDATE = WM_USER + 0;
  CM_QRPAGEAVAILABLE = WM_USER + 1;
  CM_QRPRINT = WM_USER + 2;
  CM_QRPRINTSETUP = WM_USER + 3;
  CM_QRPREVIEWCLOSE = WM_USER + 4;
type
  TQRPrinter = class;

  EQRError = class(Exception);

  CodeType = 0..MaxChar;
  UpIndex = 0..PredMax;
  DownIndex = 0..TwiceMax;
  TreeDownArray = array[UpIndex] of DownIndex;
  TreeUpArray = array[DownIndex] of UpIndex;

  TCM_QRPRogressUpdate = record
    Msg : Cardinal;
    Position : word;
    QRPrinter : TQRPrinter;
  end;

  TCM_QRPageAvailable = record
    Msg : Cardinal;
    PageCount : word;
    QRPrinter : TQRPrinter;
  end;

  TCM_QRPreviewClose = record
    Msg : Cardinal;
    Dummy : word;
    QRPrinter : TQRPrinter;
  end;

  TCM_QRPrint = TMessage;

  { TQRExportFilterLibrary }
  TQRExportFilterClass = class of TQRExportFilter;

  TQRExportFilterLibraryEntry = class
  private
    FExportFilterClass : TQRExportFilterClass;
    FName : string;
    FExtension : string;
  public
    property ExportFilterClass : TQRExportFilterClass read FExportFilterClass write FExportFilterClass;
    property FilterName : string read FName write FName;
    property Extension : string read FExtension write FExtension;
  end;

  TQRExportFilterLibrary = class
  private
    FFilterList : TList;
  protected
    function GetSaveDialogFilter : string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddFilter(AFilter : TQRExportFilterClass);
    procedure RemoveFilter(AFilter : TQRExportFilterClass);
    property Filters : TList read FFilterList;
    property SaveDialogFilterString : string read GetSaveDialogFilter;
  end;

  { TQRStream }
  TQRStream = class(TStream)
  private
    FLock: TRTLCriticalSection;
    MemoryStream : TMemoryStream;
    FFilename : string;
    FileStream : TFileStream;
    FInMemory : boolean;
    FMemoryLimit : longint;
  public
    constructor Create(MemoryLimit : Longint);
    constructor CreateFromFile(Filename : string);
    destructor Destroy; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    function Seek(Offset: Longint; Origin: Word): Longint; override;
    function Read(var Buffer; Count: Longint): Longint; override;
    procedure LockStream;
    procedure UnlockStream;
    procedure SaveToStream(AStream : TStream);
    property InMemory : boolean read FInMemory;
  end;

  { TQRCompress }
  TQRCompress = class
  private
    BitPos : Byte;
    CompressFlag : Boolean;
    InByte : CodeType;
    Left, Right : TreeDownArray;
    OutByte : CodeType;
    Stream : TStream;
    Up : TreeUpArray;
    function GetByte : Byte;
    procedure InitializeSplay;
    procedure Splay(Plain : CodeType);
  public
    constructor Create(aStream : TStream; CompressData : boolean);
    destructor Destroy; override;
    procedure Expand(var Expanded : byte);
    procedure Compress(Plain : CodeType);
  end;

  { TQRPageList }
  TQRPageList = class
  private
    FLock: TRTLCriticalSection;
    aCompressor : TQRCompress;
    FCompression : boolean;
    FPageCount : integer;
    FStream : TQRStream;
    procedure SeekToFirst;
    procedure SeekToLast;
    procedure SeekToPage(PageNumber : integer);
    procedure ReadFileHeader;
    procedure WriteFileHeader;
  public
    constructor Create;
    destructor Destroy; override;
    function GetPage(PageNumber : integer) : TMetafile;
    procedure AddPage(aMetafile : TMetafile);
    procedure Clear;
    procedure Finish;
    procedure LoadFromFile(Filename : string);
    procedure LockList;
    procedure SaveToFile(Filename : string);
    procedure UnlockList;
    property Compression : boolean read FCompression write FCompression;
    property PageCount : integer read FPageCount;
    property Stream : TQRStream read FStream write FStream;
  end;

  { TQRPreviewInterface }
  TQRPreviewInterface = class(TComponent)
  public
    function Show(AQRPrinter : TQRPrinter) : TWinControl; virtual;
    function ShowModal(AQRPrinter : TQRPrinter) : TWinControl; virtual;
  end;

  TQRPreviewInterfaceClass = class of TQRPreviewInterface;

  TQRStandardPreviewInterface = class(TQRPreviewInterface)
  public
    function Show(AQRPrinter : TQRPrinter) : TWinControl; override;
    function ShowModal(AQRPrinter : TQRPrinter): TWinControl; override;
  end;

  { TQRPreviewImage }
  TQRZoomState = (qrZoomToFit,qrZoomToWidth,qrZoomOther);

  TQRPreviewImage = class(TGraphicControl)
  private
    FQRPrinter : TQRPrinter;
    FPageNumber : integer;
    aMetaFile : TMetafile;
    FImageOK : boolean;
    procedure PaintPage;
    procedure SetPageNumber(Value : integer);
  public
    Zoom : Integer;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Paint; override;
    property ImageOK : boolean read FImageOK write FImageOK;
    property PageNumber : integer read FPageNumber write SetPageNumber;
    property QRPrinter : TQRPrinter read FQRPrinter write FQRPrinter;
  end;

  { TQRPreview }
  TQRProgressUpdateEvent = procedure (Sender : TObject; Progress : integer) of object;

  TQRPageAvailableEvent = procedure (Sender : TObject; PageNum : integer) of object;

  TQRPreview = Class(TScrollBox)
  private
    FOnPageAvailableEvent : TQRPageAvailableEvent;
    FOnProgressUpdateEvent : TQRProgressUpdateEvent;
    FPreviewImage : TQRPreviewImage;
    FPageNumber : integer;
    FQRPrinter : TQRPrinter;
    FZoom : integer;
    FZoomState : TQRZoomState;
    procedure SetPageNumber(Value : integer);
    procedure SetZoom(value : integer);
    procedure Fixvalues(Sender : TObject);
    procedure SetQRPrinter(Value : TQRPrinter);
  protected
    procedure CMPageAvailable(var Message : TCM_QRPageAvailable); Message CM_QRPAGEAVAILABLE;
    procedure CMProgressUpdate(var Message : TCM_QRProgressUpdate); Message CM_QRPROGRESSUPDATE;
  public
    constructor Create(aOwner : TComponent); override;
    destructor Destroy; override;
    procedure UpdateImage;
    procedure UpdateZoom;
    procedure ZoomToWidth;
    procedure ZoomToFit;
    property PreviewImage : TQRPreviewImage read FPreviewImage;
    property QRPrinter : TQRPrinter read FQRPrinter write SetQRPrinter;
    property ZoomState : TQRZoomState read FZoomState write FZoomState;
  published
    property OnPageAvailable : TQRPageAvailableEvent read FOnPageAvailableEvent
                                                     write FOnPageAvailableEvent;
    property OnProgressUpdate : TQRProgressUpdateEvent read FOnProgressUpdateEvent write FOnProgressUpdateEvent;
    property PageNumber : integer read FPageNumber write setPageNumber;
    property Zoom : integer read FZoom write SetZoom;
  end;

  { TQRExportFilter }
  TQRExportFilter = class
  private
    FOriginalQRPrinter : TQRPrinter;
    FActive : boolean;
    FFilename : string;
    FOwner : TComponent;
  protected
    function GetDescription : string; virtual;
    function GetExtension : string; virtual;
    function GetFilterName : string; virtual;
    function GetVendorName : string; virtual;
    function GetStreaming : boolean; virtual;
  public
    constructor Create(Filename : string);
    procedure Start(PaperWidth, PaperHeight : integer; Font : TFont); virtual;
    procedure EndPage; virtual;
    procedure Finish; virtual;
    procedure NewPage; virtual;
    procedure TextOut(X,Y : extended; Font : TFont; BGColor : TColor; Alignment : TAlignment; Text : string); virtual;
    property Active : boolean read FActive write FActive;
    property Description : string read GetDescription;
    property FileExtension : string read GetExtension;
    property Filename : string read FFilename;
    property Name : string read GetFilterName;
    property Owner : TComponent read FOwner write FOwner;
    property Streaming : boolean read GetStreaming;
    property Vendor : string read GetVendorName;
    property OriginalQRPrinter : TQRPrinter read FOriginalQRPrinter write FOriginalQRPrinter;
  end;

  { TPrinterSettings }
  TPaperSizesSupported = array[Letter..Custom] of boolean;

  TPrinterSettings = class
  private
    { Device stuff }
    FDevice : PChar;
    FDriver : PChar;
    FPort : PChar;
    DeviceMode : THandle;
    DevMode : PDeviceMode;
    { Storage variables }
    FCopies : integer;
    FDuplex : boolean;
    FMaxExtentX : integer;
    FMaxExtentY : integer;
    FMinExtentX : integer;
    FMinExtentY : integer;
    FOrientation : TPrinterOrientation;
    FOutputBin : TQRBin;
    FPaperSize : TQRPaperSize;
    FPaperSizes : TPaperSizesSupported;
    FPaperWidth : integer;
    FPaperLength : integer;
    FPixelsPerX : integer;
    FPixelsPerY : integer;
    FTopOffset : integer;
    FLeftOffset : integer;
    FPrinter : TPrinter;
    FTitle : string;
    function GetCopies : integer;
    function GetDriver : string;
    function GetDuplex : boolean;
    function GetMaxExtentX : integer;
    function GetMaxExtentY : integer;
    function GetMinExtentX : integer;
    function GetMinExtentY : integer;
    function GetOrientation : TPrinterOrientation;
    function GetOutputBin : TQRBin;
    function GetPaperSize : TQRPaperSize;
    function GetPaperSizeSupported(PaperSize : TQRPaperSize) : boolean;
    function GetPaperWidth : integer;
    function GetPaperLength : integer;
    function GetPixelsPerX : integer;
    function GetPixelsPerY : integer;
    function GetPort : string;
    function GetPrinter : TPrinter;
    function GetTitle : string;
    function GetTopOffset : integer;
    function GetLeftOffset : integer;
    function Supported(Setting : integer) : boolean;
    procedure SetField(aField : integer);
    procedure GetPrinterSettings;
    procedure SetCopies(Value : integer);
    procedure SetDuplex(Value : boolean);
    procedure SetOrientation(Value : TPrinterOrientation);
    procedure SetOutputBin(Value : TQRBin);
    procedure SetPaperSize(Value : TQRPaperSize);
    procedure SetPaperLength(Value : integer);
    procedure SetPaperWidth(Value : integer);
    procedure SetPrinter(Value : TPrinter);
    procedure SetTitle(Value : string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure ApplySettings;
    { read only properties }
    property Device : string read GetDriver;
    property Driver : string read GetDriver;
    property LeftOffset : integer read GetLeftOffset;
    property MaxExtentX : integer read GetMaxExtentX;
    property MaxExtentY : integer read GetMaxExtentY;
    property MinExtentX : integer read GetMinExtentX;
    property MinExtentY : integer read GetMinExtentY;
    property PaperSizeSupported[PaperSize : TQRPaperSize] : boolean read GetPaperSizeSupported;
    property PixelsPerX : integer read GetPixelsPerX;
    property PixelsPerY : integer read GetPixelsPerY;
    property Port : string read GetPort;
    property TopOffset : integer read GetTopOffset;
    { Read/write properties }
    property Copies : integer read GetCopies write SetCopies;
    property Duplex : boolean read GetDuplex write SetDuplex;
    property Orientation : TPrinterOrientation read GetOrientation write SetOrientation;
    property OutputBin : TQRBin read GetOutputBin write SetOutputBin;
    property PaperLength : integer read GetPaperLength write SetPaperLength;
    property PaperSize : TQRPaperSize read GetPaperSize write SetPaperSize;
    property PaperWidth : integer read GetPaperWidth write SetPaperWidth;
    property Printer : TPrinter read GetPrinter write SetPrinter;
    property Title : string read GetTitle write SetTitle;
  end;

  { TQRPrinterSettings }
  TQRPrinterSettings = class(TPersistent)
  private
    FCopies : integer;
    FDuplex : boolean;
    FOrientation : TPrinterOrientation;
    FOutputBin : TQRBin;
    FPaperSize : TQRPaperSize;
    FPrinterIndex : integer;
    FTitle : string;
    FFirstPage : integer;
    FLastPage : integer;
  public
    constructor Create;
    procedure ApplySettings(APrinter : TQRPrinter);
    property Copies : integer read FCopies write FCopies;
    property Duplex : boolean read FDuplex write FDuplex;
    property FirstPage : integer read FFirstPage write FFirstPage;
    property LastPage : integer read FLastPage write FLastPage;
    property Orientation : TPrinterOrientation read FOrientation write FOrientation;
    property OutputBin : TQRBin read FOutputBin write FOutputBin;
    property PaperSize : TQRPaperSize read FPaperSize write FPaperSize;
    property PrinterIndex : integer read FPrinterIndex write FPrinterIndex;
    property Title : string read FTitle write FTitle;
  end;

  { TQRPrinter related declarations }

  TQRPrinterDestination = (qrdMetafile, qrdPrinter);

  TQRPrinterStatus = (mpReady, mpBusy, mpFinished);

  TQRGenerateToPrinterEvent = procedure of object;
  TQRPrintSetupEvent = procedure of object;
  TQRExportToFilterEvent = procedure (aFilter : TQRExportFilter) of object;
  TQRPreviewEvent = procedure of object;
  TQRAfterPrintEvent = procedure (Sender : TObject) of object;
  TQRAfterPreviewEvent = procedure (Sender : TObject) of object;

  { TQRPrinter }
  TQRPrinter = class(TPersistent)
  private
    aPrinter : TPrinter;
    aPrinterSettings : TPrinterSettings;
    aStream : TQRStream;
    FAfterPrintEvent : TQRAfterPrintEvent;
    FAfterPreviewEvent : TQRAfterPreviewEvent;
    FAvailablePages : integer;
    FCancelled : boolean;
    FCanvas : TCanvas;
    FCloseControl : TWinControl;
    FDestination : TQRPrinterDestination;
    FFirstPage : integer;
    FLastpage : integer;
    FLeftWaste : integer;
    FClient : TWinControl;
    FMaster : TWinControl;
    FMetafile : TMetafile;
    FOnExportToFilterEvent : TQRExportToFilterEvent;
    FOnPreviewEvent : TNotifyEvent;
    FOnPrintSetupEvent : TQRPrintSetupEvent;
    FPage : TMetafile;
    FPageCount : integer;
    FPageNumber : integer;
    FPrinterOK : boolean;
    FProgress : integer;
    FTitle : string;
    FTopWaste : integer;
    FShowingPreview : boolean;
    FStatus : TQRPrinterStatus;
    FXFactor : extended;
    FYFactor : extended;
    PageList : TQRPageList;
    PreviewControl : TWinControl;
    FReportLoaded : boolean;
    function CurrentPageOK : boolean;
    function GetLeftWaste : integer;
    function GetBin : TQRBin;
    function GetCanvas : TCanvas;
    function GetCompression : boolean;
    function GetCopies : integer;
    function GetDuplex : boolean;
    function GetOrientation : TPrinterOrientation;
    function GetPaperLength : integer;
    function GetPaperSize : TQRPaperSize;
    function GetPaperWidth : integer;
    function GetPrinterIndex : integer;
    function GetPrinters : TStrings;
    function GetTopWaste : integer;
    procedure CreateMetafileCanvas;
    procedure CreatePrinterCanvas;
    procedure EndMetafileCanvas;
    procedure EndPrinterCanvas;
    procedure SetAvailablePages(Value : integer);
    procedure SetBin(Value : TQRBin);
    procedure SetCompression(Value : boolean);
    procedure SetCopies(Value : integer);
    procedure SetDestination(Value : TQRPrinterDestination);
    procedure SetDuplex(Value : boolean);
    procedure SetOrientation(Value : TPrinterOrientation);
    procedure SetPaperLength(Value : integer);
    procedure SetPageNumber(Value : integer);
    procedure SetPaperSize(Value : TQRPaperSize);
    procedure SetPaperWidth(Value : integer);
    procedure SetPrinterIndex(Value : integer);
    procedure SetProgress(Value : integer);
    procedure SetShowingPreview(Value : boolean);
  public
    constructor Create;
    destructor Destroy; override;
    function GetPage(Value : integer) : TMetafile;
    function XPos(Value : extended) : integer;
    function XSize(Value : extended) : integer;
    function YPos(Value : extended) : integer;
    function YSize(Value : extended) : integer;
    function PaperLengthValue : integer;
    function PaperWidthValue : integer;
    procedure AbortDoc;
    procedure BeginDoc;
    procedure Cancel;
    procedure Cleanup;
    procedure ClosePreview(Control : TWinControl);
    procedure EndDoc;
    procedure ExportToFilter(aFilter : TQRExportFilter);
    procedure Load(Filename : string);
    procedure NewPage;
    procedure Preview;
    procedure PreviewModal;
    procedure Print;
    procedure PrintSetup;
    procedure Save(Filename : string);
    property ReportLoaded : boolean read FReportLoaded write FReportLoaded;
    property AfterPreview : TQRAfterPreviewEvent read FAfterPreviewEvent write FAfterPreviewEvent;
    property AfterPrint : TQRAfterPrintEvent read FAfterPrintEvent write FAfterPrintEvent;
    property AvailablePages : integer read FAvailablePages write SetAvailablePages;
    property OutputBin : TQRBin read GetBin write SetBin;
    property Cancelled : boolean read FCancelled write FCancelled;
    property Canvas : TCanvas read GetCanvas;
    property Client : TWinControl read FClient write FClient;
    property Compression : boolean read GetCompression write SetCompression;
    property Copies : integer read GetCopies write SetCopies;
    property Destination : TQRPrinterDestination read FDestination write SetDestination;
    property Duplex : boolean read GetDuplex write SetDuplex;
    property FirstPage : integer read FFirstPage write FFirstPage;
    property LastPage : integer read FLastPage write FLastPage;
    property LeftWaste : integer read GetLeftWaste;
    property Master : TWinControl read FMaster write FMaster;
    property Orientation : TPrinterOrientation read GetOrientation write SetOrientation;
    property OnExportToFilter : TQRExportToFilterEvent read FOnExportToFilterEvent
                                                       write FOnExportToFilterEvent;
    property OnPreview : TNotifyEvent read FOnPreviewEvent write FOnPreviewEvent;
    property OnPrintSetup : TQRPrintSetupEvent read FOnPrintSetupEvent write FOnPrintSetupEvent;
    property PaperLength : Integer read GetPaperLength write SetPaperLength;
    property Page : TMetafile read FPage;
    property PageCount : integer read FPageCount write FPageCount;
    property PageNumber : Integer read FPageNumber write SetPageNumber;
    property PaperWidth : Integer read GetPaperWidth write SetPaperWidth;
    property PaperSize : TQRPaperSize read GetPaperSize write SetPaperSize;
    property PrinterIndex : integer read GetPrinterIndex write SetPrinterIndex;
    property PrinterOK : boolean read FPrinterOK;
    property Printers : TStrings read GetPrinters;
    property Progress : integer read FProgress write SetProgress;
    property ShowingPreview : boolean read FShowingPreview write SetShowingPreview;
    property Status : TQRPrinterStatus read FStatus;
    property Title : string read FTitle write FTitle;
    property TopWaste : integer read GetTopWaste;
    property XFactor : extended read FXFactor write FXFactor;
    property YFactor : extended read FYFactor write FYFactor;
  end;

{$ifndef ver100}
  function AnsiPos(Substr: string; S: string): integer;
{$endif}
  function GetFonts : TStrings;

  function TempFilename : string;
  function QRPaperName(Size : TQRPaperSize) : string;

  procedure RegisterPreviewClass(APreviewInterface : TQRPreviewInterfaceClass);

function QRPrinter : TQRPrinter;

var
  QRExportFilterLibrary : TQRExportFilterLibrary;

implementation

uses
  QRPrev;

var
  FQRPrinter : TQRPrinter;
  GlobalPreviewInterface : TQRPreviewInterfaceClass;

const
  cQRPFormatVersion = 3;

type
  TQRFileHeader = record
    FormatVersion : word;                   { File format version }
    QRVersion : word;                       { QR version }
    PageSize : TQRPaperSize;
    PageCount : integer;
    CreateDateTime : TDateTime;
    Portrait : boolean;                     { field added in header version 2 }
    Compression : byte;                     { 0 - no compression, 1 - splay }
    EmptySpace : array[0..100] of byte;
  end;

{$ifdef EvalVersion}
function DelphiRunning : boolean;
var
  H1, H2, H3, H4 : Hwnd;
const
  A1 : array[0..12] of char = 'TApplication'#0;
  A2 : array[0..15] of char = 'TAlignPalette'#0;
  A3 : array[0..18] of char = 'TPropertyInspector'#0;
  A4 : array[0..11] of char = 'TAppBuilder'#0;
  T1 : array[0..6] of char = 'Delphi'#0;
begin
  H2 := FindWindow(A2, nil);
  H3 := FindWindow(A3, nil);
  H4 := FindWindow(A4, nil);
  Result := (H2 <> 0) and
            (H3 <> 0) and (H4 <> 0);
end;
{$endif}

{$ifndef ver100}

function AnsiPos(Substr: string; S: string): integer;
begin
  result := Pos(Substr,S);
end;

{$endif}

function QRPaperName(Size : TQRPaperSize) : string;
const
  Names : array[Default..Custom] of string = (
   SqrPaperSize0, SqrPaperSize1, SqrPaperSize2, SqrPaperSize3,
   SqrPaperSize4, SqrPaperSize5, SqrPaperSize6, SqrPaperSize7,
   SqrPaperSize8, SqrPaperSize9, SqrPaperSize10, SqrPaperSize11,
   SqrPaperSize12, SqrPaperSize13, SqrPaperSize14, SqrPaperSize15,
   SqrPaperSize16, SqrPaperSize17, SqrPaperSize18, SqrPaperSize19,
   SqrPaperSize20, SqrPaperSize21, SqrPaperSize22, SqrPaperSize23,
   SqrPaperSize24, SqrPaperSize25, SqrPaperSize26, SqrPaperSize27);

begin
  Result := Names[Size];
end;

function TempFilename : string;
var
  AName,
  ADir : array[0..255] of char;
begin
  GetTempPath(255, adir);
  GetTempFilename(aDir, PChar('QRP'), 0, aName);
  result := StrPas(aName);
end;

{ TQRStream }

constructor TQRStream.Create(MemoryLimit : longint);
begin
  inherited Create;
  FInMemory := true;
  MemoryStream := TMemoryStream.Create;
  FMemoryLimit := MemoryLimit;
  InitializeCriticalSection(FLock);
end;

constructor TQRStream.CreateFromFile(Filename : string);
begin
  inherited Create;
  FInMemory := false;
  FileStream := TFileStream.Create(Filename, fmOpenRead + fmShareDenyNone);
  FMemoryLimit := 0;
  InitializeCriticalSection(FLock);
end;

destructor TQRStream.Destroy;
begin
  LockStream;
  try
    if InMemory then
      MemoryStream.Free
    else
    begin
      FileStream.Free;
      DeleteFile(FFilename);
    end;
  finally
    UnlockStream;
    DeleteCriticalSection(FLock);
  end;
  inherited Destroy;
end;

procedure TQRStream.LockStream;
begin
  EnterCriticalSection(FLock);
end;

procedure TQRStream.UnlockStream;
begin
  LeaveCriticalSection(FLock);
end;

function TQRStream.Write(const Buffer; Count: Longint): Longint;
begin
  LockStream;
  if InMemory then
  begin
    result := MemoryStream.Write(Buffer,Count);
    if MemoryStream.Size > FMemoryLimit then {...this could be optimized somewhat }
    begin
      FFilename := TempFilename;
      FileStream := TFileStream.Create(FFilename, fmCreate or fmOpenReadWrite);
      MemoryStream.SaveToStream(FileStream);
      MemoryStream.Free;
      FInMemory := false;
    end
  end else
    result := FileStream.Write(Buffer,Count);
  UnlockStream;
end;

function TQRStream.Read(var Buffer; Count: Longint): Longint;
begin
  LockStream;
  if InMemory then
    result := MemoryStream.Read(Buffer,Count)
  else
    result := FileStream.Read(Buffer,Count);
  UnlockStream;
end;

function TQRStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  LockStream;
  if InMemory then
    result := MemoryStream.Seek(Offset,Origin)
  else
    result := FileStream.Seek(Offset,Origin);
  UnlockStream;
end;

procedure TQRStream.SaveToStream(AStream : TStream);
var
  Buffer : array[0..10240] of byte;
  BytesRead : longint;
begin
  LockStream;
  Position := 0;
  repeat
    BytesRead := Read(Buffer,10240);
    AStream.Write(Buffer,BytesRead);
  until BytesRead=0;
  UnlockStream;
end;

{ TQRCompress }

constructor TQRCompress.Create(aStream : TStream; CompressData : boolean);
begin
  Stream := aStream;
  InitializeSplay;
  if CompressData then
    BitPos := 0
  else
    BitPos := 7;
  OutByte := 0;
  CompressFlag := CompressData;
end;

destructor TQRCompress.Destroy;
begin
  if CompressFlag and (BitPos<>0) then
    Stream.Write(OutByte,1);
  inherited Destroy;
end;

procedure TQRCompress.InitializeSplay;
var
  I : DownIndex;
  J : UpIndex;
  K : DownIndex;
begin
  for I := 1 to TwiceMax do
    Up[I] := (I-1) shr 1;
  for J := 0 to PredMax do
  begin
    K := (J+1) shl 1;
    Left[J] := K-1;
    Right[J] := K;
  end;
end;

procedure TQRCompress.Splay(Plain : CodeType);
var
  A, B : DownIndex;
  C, D : UpIndex;
begin
  A := Plain+MaxChar;
  repeat
    C := Up[A];
    if C <> ROOT then
    begin
      D := Up[C];
      B := Left[D];
      if C = B then
      begin
        B := Right[D];
        Right[D] := A;
      end else
        Left[D] := A;
      if A = Left[C] then
        Left[C] := B
      else
        Right[C] := B;
      Up[A] := D;
      Up[B] := C;
      A := D;
    end else
      A := C;
  until A = ROOT;
end;

procedure TQRCompress.Compress(Plain : CodeType);
{ Compress a single byte }
var
  A : DownIndex;
  U : UpIndex;
  Sp : 0..MaxChar;
  Stack : array[UpIndex] of Boolean;
begin
  A := Plain+MaxChar;
  Sp := 0;
  repeat
    U := Up[A];
    Stack[Sp] := (Right[U] = A);
    inc(Sp);
    A := U;
  until A = ROOT;
  repeat
    dec(Sp);
    if Stack[Sp] then
      OutByte := OutByte or BitMask[BitPos];
    if BitPos = 7 then
    begin
      Stream.Write(OutByte, 1); { writebyte }
      BitPos := 0;
      OutByte := 0;
    end else
      inc(BitPos);
  until Sp = 0;
  Splay(Plain);
end;

function TQRCompress.GetByte : Byte;
begin
  Stream.Read(Result, 1);
end;

procedure TQRCompress.Expand(var Expanded : byte);
{ Expand a single byte }
var
  A : DownIndex;
begin
  A := ROOT;
  repeat
    if BitPos = 7 then
    begin
      InByte := GetByte;
      BitPos := 0;
    end else
      inc(BitPos);
    if InByte and BitMask[BitPos] = 0 then
      A := Left[A]
    else
      A := Right[A];
  until A > PredMax;
  dec(A, MaxChar);
  Splay(A);
  Expanded := A;
end;

{ TQRPageList }

constructor TQRPageList.Create;
begin
  inherited Create;
  FPageCount := 0;
  FCompression := false;
  FStream := nil;
  InitializeCriticalSection(FLock);
end;

destructor TQRPageList.Destroy;
begin
  DeleteCriticalSection(FLock);
  if assigned(FStream) then
  begin
    FStream.Free;
    FStream := nil;
  end;
  inherited Destroy;
end;

procedure TQRPageList.Clear;
begin
  FPageCount := 0;
end;

procedure TQRPageList.LockList;
begin
  EnterCriticalSection(FLock);
end;

procedure TQRPageList.UnlockList;
begin
  LeaveCriticalSection(FLock);
end;

procedure TQRPageList.Finish;
begin
  WriteFileHeader;
end;

procedure TQRPageList.LoadFromFile;
begin
  if assigned(FStream) then
    Stream.Free;
  Stream := TQRStream.CreateFromFile(Filename);
  ReadFileHeader;
end;

procedure TQRPageList.SaveToFile(Filename : string);
var
  AStream : TFileStream;
begin
  AStream := TFileStream.Create(Filename,fmCreate or fmOpenReadWrite);
  Stream.SaveToStream(AStream);
  AStream.Free;
end;

procedure TQRPageList.SeekToFirst;
begin
  Stream.Position := SizeOf(TQRFileHeader);
end;

procedure TQRPageList.SeekToLast;
var
  PrevPosition : longint;
begin
  Stream.Seek(-SizeOf(PrevPosition), soFromEnd);
  Stream.Read(PrevPosition,SizeOf(PrevPosition));
  Stream.Position := PrevPosition;
end;

procedure TQRPageList.SeekToPage(PageNumber : integer);
var
  ThisPageNum : longint;
  NextPosition : longint;
  PrevPosition : longint;
begin
  if PageNumber = 1 then
    SeekToFirst
  else
    if PageNumber = PageCount then
      SeekToLast
    else
    begin
      if Stream.Position = Stream.Size then
        SeekToLast;
      Stream.Read(ThisPageNum, SizeOf(ThisPageNum));
      Stream.Seek(-SizeOf(ThisPageNum), soFromCurrent);
      if ThisPageNum<PageNumber then
      begin
        repeat
          Stream.Read(ThisPageNum, SizeOf(ThisPageNum));
          if ThisPageNum<>PageNumber then
          begin
            Stream.Read(NextPosition, SizeOf(NextPosition));
            Stream.Position := NextPosition;
          end;
        until ThisPageNum=PageNumber;
        Stream.Seek(-SizeOf(ThisPageNum), soFromCurrent);
      end else
        if ThisPageNum>PageNumber then
        begin
          repeat
            Stream.Read(ThisPageNum,SizeOf(ThisPageNum));
            if ThisPageNum<>PageNumber then
            begin
              Stream.Position := Stream.Position - SizeOf(PrevPosition) - SizeOf(ThisPageNum);
              Stream.Read(PrevPosition,SizeOf(PrevPosition));
              Stream.Position := PrevPosition;
            end;
          until ThisPageNum=PageNumber;
          Stream.Seek(-SizeOf(ThisPageNum), soFromCurrent);
        end;
    end;
end;

function TQRPageList.GetPage(PageNumber : integer) : TMetafile;
var
  Dummy : longint;
  TempStream : TMemoryStream;
  aByte : byte;
  BytesToGet : longint;
  I : longint;
begin
  if PageNumber > PageCount then
    result := nil
  else
  try
    LockList;
    SeekToPage(PageNumber);
    Stream.Read(Dummy,SizeOf(Dummy));
    Stream.Read(Dummy,SizeOf(Dummy));
    BytesToGet := BytesToGet-Stream.Position;
    result := TMetafile.Create;
    if Compression then
    begin
      Stream.Read(BytesToGet,SizeOf(BytesToGet));
      TempStream := TMemoryStream.Create;
      aCompressor := TQRCompress.Create(Stream, false);
      for I := 1 to BytesToGet do
      begin
        aCompressor.Expand(aByte);
        TempStream.Write(aByte,1);
      end;
      aCompressor.Free;
      TempStream.Position := 0;
      result.LoadFromStream(TempStream);
      TempStream.Free;
    end else
      result.LoadFromStream(Stream);
    Stream.Read(Dummy, SizeOf(Dummy));
  finally
    UnlockList;
  end;
end;

procedure TQRPageList.ReadFileHeader;
var
  aFileHeader : TQRFileHeader;
begin
  Stream.Position := 0;
  Stream.Read(aFileHeader, SizeOf(aFileHeader));
  FPageCount := aFileHeader.PageCount;
end;

procedure TQRPageList.WriteFileHeader;
var
  aFileHeader : TQRFileHeader;
begin
  Stream.Position := 0;
  aFileHeader.FormatVersion := cQRPFormatVersion;
  aFileHeader.QRVersion := cQRVersion;
  aFileHeader.PageCount := PageCount;
  aFileHeader.CreateDateTime := Now;
  if Compression then
    aFileHeader.Compression := 1
  else
    aFileHeader.Compression := 0;
  Stream.Write(aFileHeader, SizeOf(aFileHeader));
end;

procedure TQRPageList.AddPage(aMetafile : TMetafile);
var
  I,
  SavePos1,
  SavePos2,
  SavePos3 : longint;
  TempStream : TMemoryStream;
  aByte : byte;

  procedure SavePreInfo;
  var
    aPageCount : longint;
  begin
    aPageCount := FPageCount;
    Stream.Position := Stream.Size;
    SavePos1 := Stream.Position;                    { Store start position }
    Stream.Write(aPageCount, SizeOf(aPageCount));   { Write page number }
    SavePos2 := Stream.Position;                    { Store metafile size pos }
    Stream.Write(SavePos2, SizeOf(SavePos2));       { Reserve space for size }
  end;

  procedure SavePostInfo;
  begin
    Stream.Write(SavePos1, Sizeof(SavePos1));       { Store previous start }
    SavePos3 := Stream.Position;                    { Store post of next }
    Stream.Position := SavePos2;                    { Go back to reserved pos }
    Stream.Write(SavePos3, Sizeof(SavePos3));       { Save pos of next};
    Stream.Position := SavePos3;                    { Go to end of stream }
  end;

begin
  try
    LockList;
    inc(FPageCount);
    if PageCount = 1 then
      WriteFileHeader;
    if Compression then
    begin
      TempStream := TMemoryStream.Create;
      AMetafile.SaveToStream(TempStream);
      SavePreInfo;
      aCompressor := TQRCompress.Create(Stream,true);
      TempStream.Position := 0;
      I := TempStream.Size;
      Stream.Write(I,SizeOf(I));
      for I := 0 to TempStream.Size - 1 do
      begin
        TempStream.Read(aByte,1);
        aCompressor.Compress(aByte);
      end;
      aCompressor.Free;
      TempStream.Free;
      SavePostInfo;
    end else
    begin
      SavePreInfo;
      AMetaFile.SaveToStream(Stream);               { Save the metafile }
      SavePostInfo;
    end;
  finally
    UnlockList;
  end;
end;

function QREnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
                       FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

function GetFonts : TStrings;
begin
  if Printer.Printers.Count = 0 then
    Result := Screen.Fonts
  else
    Result := Printer.Fonts;
end;

{ TQRPreviewInterface }

function TQRPreviewInterface.Show(AQRPrinter : TQRPrinter) : TWinControl;
begin
end;

function TQRPreviewInterface.ShowModal(AQRPrinter : TQRPrinter) : TWinControl;
begin
end;

function TQRStandardPreviewInterface.Show(AQRPrinter : TQRPrinter) : TWinControl;
begin
  Result := TQRStandardPreview.CreatePreview(Application, AQRPrinter);
  TQRStandardPreview(Result).Show;
end;

function TQRStandardPreviewInterface.ShowModal(AQRPrinter : TQRPrinter) : TWinControl;
begin
  Result := TQRStandardPreview.CreatePreview(Application, AQRPrinter);
  TQRStandardPreview(Result).ShowModal;
end;

{ TQRPreviewImage }

constructor TQRPreviewImage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Height := 50;
  Width := 100;
  Zoom := 100;
  QRPrinter := nil;
  ImageOK := false;
  FPageNumber := 1;
end;

destructor TQRPreviewImage.Destroy;
begin
  if ImageOK then
    aMetafile.Free;
  inherited Destroy;
end;

procedure TQRPReviewImage.PaintPage;
begin
  { Paint page background }
  if ImageOK or (csDesigning in ComponentState) then
    with Canvas do
    begin
      Brush.Color := clWhite;
      Pen.Color := clWhite;
      Rectangle(1, 1, Width - cQRPageFrameWidth - cQRPageShadowWidth, Height - cQRPageFrameWidth - cQRPageShadowWidth);
    end;
  if ImageOK then
  begin
    { Paint the metafile }
    Canvas.StretchDraw(rect(0, 0, Width, Height),aMetafile);
  end;
  { Paint frame around page }
  if ImageOK or (csDesigning in ComponentState) then
    with Canvas do
    begin
      Pen.Color := cQRPageShadowColor;
      Pen.Width := cQRPageFrameWidth;
      MoveTo(0,0);
      LineTo(0,Height - cQRPageFrameWidth - cQRPageShadowWidth);
      LineTo(Width - cQRPageFrameWidth - cQRPageShadowWidth, Height - cQRPageFrameWidth - cQRPageShadowWidth);
      LineTo(Width - cQRPageFrameWidth - cQRPageShadowWidth, 0);
      LineTo(0, 0);
      Brush.Color := cQRPageShadowColor;
      Rectangle(Width - cQRPageShadowWidth, cQRPageShadowWidth, Width, Height);
      Rectangle(cQRPageShadowWidth, Height - cqrPageShadowWidth, Width, Height);
    end;
end;

procedure TQRPreviewImage.Paint;
begin
  PaintPage;
end;

procedure TQRPreviewImage.SetPageNumber(Value : integer);
begin
  FPageNumber := Value;
  if assigned(aMetafile) then
    aMetafile.Free;
  aMetaFile := nil;
  if assigned(FQRPrinter) then
    aMetaFile := QRPrinter.GetPage(Value);
  ImageOK := aMetafile <> nil;
  PaintPage;
end;

{ TQRPreview }

constructor TQRPreview.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FPreviewImage := TQRPreviewImage.Create(self);
  FPreviewImage.Parent := self;
  with FPreviewImage do
  begin
    Top := 0;
    Left := 0;
  end;
  HorzScrollbar.Tracking := true;
  VertScrollBar.Tracking := true;
  FZoom := 100;
  FQRPrinter := nil;
  ZoomState := qrZoomOther{qrDefaultZoom};
  OnResize := FixValues;
  Height := 250;
  Width := 250;
  FPageNumber := 1;
  FOnPageAvailableEvent := nil;
  FOnProgressUpdateEvent := nil;
end;

destructor TQRPreview.Destroy;
begin
  if QRPrinter <> nil then QRPrinter := nil;
  inherited Destroy;
end;

procedure TQRPreview.SetQRPrinter(Value : TQRPrinter);
begin
  if assigned(FQRPrinter) and (FQRPrinter.Client = self) then
  begin
    FQRPrinter.ShowingPreview := false;
    FQRPrinter.Client := nil;
  end;
  FQRPrinter := Value;
  FPreviewImage.QRPrinter := Value;
  if FQRPrinter <> nil then
  begin
    FQRPrinter.Client := self;
    FQRPrinter.ShowingPreview := true;
  end;
  PageNumber := 1;
  PreviewImage.PageNumber := 1;
  Invalidate;
  FPreviewImage.OnClick := OnClick;
  FPreviewImage.OnDblClick := OnDblClick;
  FPreviewImage.OnDragDrop := OnDragDrop;
  FPreviewImage.OnDragOver := OnDragOver;
  FPreviewImage.OnEndDrag := OnEndDrag;
  FPreviewImage.OnMouseDown := OnMouseDown;
  FPreviewImage.OnMouseMove := OnMouseMove;
  FPreviewImage.OnMouseUp := OnMouseUp;
end;

procedure TQRPreview.CMPageAvailable(var Message : TCM_QRPageAvailable);
begin
  if Message.PageCount = PageNumber then
    UpdateImage;
  if assigned(FOnPageAvailableEvent) then
  try
    FOnPageAvailableEvent(Self, Message.PageCount);
  finally
  end;
end;

procedure TQRPreview.CMProgressUpdate(var Message : TCM_QRProgressUpdate);
begin
  if assigned(FOnProgressUpdateEvent) then
  try
    FOnProgressUpdateEvent(Self, Message.Position);
  finally
  end;
end;

procedure TQRPreview.SetPageNumber(value : integer);
begin
  if ((Value <> FPageNumber) or (not PreviewImage.ImageOK)) and (Value > 0)
    and assigned(FQRPrinter) and (Value <= QRPrinter.PageCount) then
  begin
    FPreviewImage.PageNumber := Value;
    FPageNumber := Value;
    VertScrollBar.Position := 0;
    HorzScrollBar.Position := 0;
  end;
end;

procedure TQRPreview.UpdateImage;
begin
  if assigned(FPreviewImage) and not FPreviewImage.ImageOK and
    (FPreviewImage.PageNumber <= QRPrinter.AvailablePages) then
  begin
    ZoomToWidth;
    FPreviewImage.PageNumber := FPreviewImage.PageNumber;
  end;
end;

procedure TQRPreview.UpdateZoom;
begin
  if assigned(FQRPrinter) then
  begin
    with FPreviewImage do
    begin
      Width := round(QRPrinter.XSize(QRPrinter.PaperWidthValue / 100 * FZoom)) +
               cQRPageShadowWidth + cQRPageFrameWidth * 2;
      Height := round(QRPrinter.YSize(QRPrinter.PaperLengthValue / 100 * FZoom)) +
                cQRPageShadowWidth + cQRPageFrameWidth * 2;
    end
  end else
  begin
    with FPreviewImage do
    begin
      Width := round(cQRPaperSizeMetrics[Letter, 0] / 100 * FZoom) +
               cQRPageShadowWidth + cQRPageFrameWidth * 2;
      Height := round(cQRPaperSizeMetrics[Letter, 1] / 100 * FZoom) +
                cQRPageShadowWidth + cQRPageFrameWidth * 2;
    end;
  end;
  if FPreviewImage.Width < self.Width then
    FPreviewImage.Left := (width - FPreviewImage.width) div 2
  else
    FPreviewImage.Left := 0;
  if FPreviewImage.Height < Height then
    FPreviewImage.Top := ((Height - FPreviewImage.Height) div 2)
  else
    FPreviewImage.Top := 0;
  HorzScrollBar.Position := 0;
  VertScrollBar.Position := 0;
  FPreviewImage.Zoom := FZoom;
end;

procedure TQRPreview.FixValues(Sender : TObject);
begin
  if ZoomState = qrZoomToFit then
    ZoomToFit
  else
    if ZoomState = qrZoomToWidth then
      ZoomToWidth;
  UpdateZoom;
end;

procedure TQRPreview.SetZoom(Value:integer);
begin
  if (Value >= 2) and (Value <= 2000) then
  begin
    ZoomState := qrZoomOther;
    FZoom := Value;
    UpdateZoom;
  end;
end;

procedure TQRPreview.ZoomToFit;
var
  Zoom1,
  Zoom2 : Integer;
begin
  if assigned(FQRPrinter) then
  begin
    Zoom1 := round(Width / QRPrinter.XSize(QRPrinter.PaperWidthValue) * 95);
    Zoom2 := round(Height / QRPrinter.YSize(QRPrinter.PaperLengthValue) * 95);
  end else
  begin
    Zoom1 := round((Width / cQRPaperSizeMetrics[Letter, 0]) * 95);
    Zoom2 := round((Height / cQRPaperSizeMetrics[Letter, 1]) * 95);
  end;
  if Zoom1 < Zoom2 then
    Zoom := Zoom1
  else
    Zoom := Zoom2;
  ZoomState := qrZoomToFit;
end;

procedure TQRPreview.ZoomToWidth;
begin
  if assigned(FQRPrinter) then
    Zoom := round((Width / QRPrinter.XSize(QRPrinter.PaperWidthValue)) * 90)
  else
    Zoom := round((Width / cQRPaperSizeMetrics[Letter, 0]) * 95);
  UpdateZoom;
  ZoomState := qrZoomToWidth;
end;

{ TQRExportFilter }

constructor TQRExportFilter.Create(Filename : string);
begin
  inherited Create;
  FFilename := Filename;
  FOwner := nil;
  Active := false;
end;

function TQRExportFilter.GetDescription : string;
begin
  result := SqrAbstractFilterDescription;
end;

function TQRExportFilter.GetExtension : string;
begin
  result := '';
end;

function TQRExportFilter.GetFilterName : string;
begin
  result := SqrAbstractFilterName;
end;

function TQRExportFilter.GetVendorName : string;
begin
  result := SqrQuSoft;
end;

function TQRExportFilter.GetStreaming : boolean;
begin
  Result := false;
end;

procedure TQRExportFilter.Start(PaperWidth, PaperHeight : integer; Font : TFont);
begin
  Active := true;
end;

procedure TQRExportFilter.EndPage;
begin
end;

procedure TQRExportFilter.Finish;
begin
  Active := false;
end;

procedure TQRExportFilter.NewPage;
begin
end;

procedure TQRExportFilter.TextOut(X,Y : extended; Font : TFont; BGColor : TColor; Alignment : TAlignment; Text : string);
begin
end;

{ TQRExportFilterLibrary }

constructor TQRExportFilterLibrary.Create;
begin
  inherited Create;
  FFilterList := TList.Create;
end;

destructor TQRExportFilterLibrary.destroy;
var
  I : integer;
begin
  for I := 0 to FFilterList.Count - 1 do
    TQRExportFilterLibraryEntry(FFilterList[I]).Free;
  FFilterList.Free;
  inherited Destroy;
end;

procedure TQRExportFilterLibrary.AddFilter(AFilter : TQRExportFilterClass);
var
  aTmpFilter : TQRExportFilter;
  aLibraryEntry : TQRExportFilterLibraryEntry;
begin
  aTmpFilter := AFilter.Create('');
  aLibraryEntry := TQRExportFilterLibraryEntry.Create;
  aLibraryEntry.ExportFilterClass := AFilter;
  aLibraryEntry.FilterName := aTmpFilter.Name;
  aLibraryEntry.Extension := aTmpFilter.FileExtension;
  aTmpFilter.Free;
  FFilterList.Add(aLibraryEntry);
end;

procedure TQRExportFilterLibrary.RemoveFilter(AFilter : TQRExportFilterClass);
var
  aTmpFilter : TQRExportFilter;
  I : integer;
  aLibraryEntry : TQRExportFilterLibraryEntry;
begin
  aTmpFilter := AFilter.Create('');
  for I := 0 to FFilterList.Count - 1 do
    if TQRExportFilterLibraryEntry(FFilterList[I]).FilterName = aTmpFilter.Name then
    begin
      aLibraryEntry := TQRExportFilterLibraryEntry(FFilterList[I]);
      FFilterList.Delete(I);
      aTmpFilter.Free;
      aLibraryEntry.Free;
      Exit;
    end;
end;

function TQRExportFilterLibrary.GetSaveDialogFilter : string;
var
  I : integer;
begin
  result := SqrQRFile + '(*.' +cQRPDefaultExt + ')|*.' + cqrpDefaultExt;
  for I := 0 to Filters.Count - 1 do
    with TQRExportFilterLibraryEntry(Filters[I]) do
        result := result + '|' + FilterName + ' (*.' + Extension + ')|*.' + Extension;
end;

{ TPrinterSettings }

constructor TPrinterSettings.Create;
begin
  inherited Create;
  GetMem(FDevice, 128);
  GetMem(FDriver, 128);
  GetMem(FPort, 128);
  FPaperSize := A4;
  FPrinter := nil;
end;

destructor TPrinterSettings.Destroy;
begin
  FreeMem(FDevice, 128);
  FreeMem(FDriver, 128);
  FreeMem(FPort, 128);
  inherited Destroy;
end;

function TPrinterSettings.GetCopies : integer;
begin
  Result := FCopies;
end;

function TPrinterSettings.GetDriver : string;
begin
  Result := StrPas(FDriver);
end;

function TPrinterSettings.GetDuplex : boolean;
begin
  Result := FDuplex;
end;

function TPrinterSettings.GetMaxExtentX : integer;
begin
  Result := FMaxExtentX;
end;

function TPrinterSettings.GetMaxExtentY : integer;
begin
  Result := FMaxExtentY;
end;

function TPrinterSettings.GetMinExtentX : integer;
begin
  Result := FMinExtentX;
end;

function TPrinterSettings.GetMinExtentY : integer;
begin
  Result := FMinExtentY;
end;

function TPrinterSettings.GetOrientation : TPrinterOrientation;
begin
  Result := FOrientation;
end;

function TPrinterSettings.GetOutputBin : TQRBin;
begin
  Result := FOutputBin;
end;

function TPrinterSettings.GetPaperSize : TQRPaperSize;
begin
  Result := FPaperSize;
end;

function TPrinterSettings.GetPaperSizeSupported(PaperSize : TQRPaperSize) : boolean;
begin
  result := FPaperSizes[PaperSize];
end;

function TPrinterSettings.GetPaperWidth : integer;
begin
  if (PaperSize <> Custom) and (PaperSize <> Default) then
    Result := round(cQRPaperSizeMetrics[PaperSize, 0] * 10)
  else
    Result := FPaperWidth;
end;

function TPrinterSettings.GetPaperLength : integer;
begin
  if (PaperSize <> Custom) and (PaperSize <> Default) then
    Result := round(cQRPaperSizeMetrics[PaperSize, 1] * 10)
  else
    Result := FPaperLength;
end;

function TPrinterSettings.GetPixelsPerX : integer;
begin
  Result := FPixelsPerX;
end;

function TPrinterSettings.GetPixelsPerY : integer;
begin
  Result := FPixelsPerY;
end;

function TPrinterSettings.GetPort : string;
begin
  Result := StrPas(FPort);
end;

function TPrinterSettings.GetTopOffset : integer;
begin
  Result := FTopOffset;
end;

function TPrinterSettings.GetLeftOffset : integer;
begin
  Result := FLeftOffset;
end;

function TPrinterSettings.GetPrinter : TPrinter;
begin
  Result := FPrinter;
end;

function TPrinterSettings.GetTitle : string;
begin
  Result := FTitle;
end;

function TPrinterSettings.Supported(Setting : integer) : boolean;
begin
  if assigned(FPrinter) then
    Supported := (DevMode^.dmFields and Setting) = Setting
  else
    Supported := false;
end;

procedure TPrinterSettings.SetField(aField : integer);
begin
  DevMode^.dmFields := DevMode^.dmFields or aField;
end;

procedure TPrinterSettings.GetPrinterSettings;

  procedure GPrinter;
  var
    Driver_info_2 : pDriverinfo2;
    Retrieved : dword;
    hPrinter : THandle;

  begin
    FPrinter.GetPrinter(FDevice, FDriver, FPort, DeviceMode);
    if DeviceMode = 0 then
      FPrinter.GetPrinter(FDevice, FDriver, FPort, DeviceMode);
    GetMem(Driver_info_2, 255);
    try
      OpenPrinter(FDevice, hPrinter, nil);
      try
        GetPrinterDriver(hPrinter, nil, 2, Driver_info_2, 255, Retrieved);
      finally
        ClosePrinter(hPrinter);
      end;
      StrLCopy(FDriver, PChar(ExtractFileName(StrPas(Driver_info_2^.PDriverPath)) + #0), 63);
    finally
      FreeMem(Driver_info_2, 255);
    end;
    DevMode := GlobalLock(DeviceMode);
  end;

  procedure GCopies; { Number of copies }
  begin
    if Supported(dm_copies) then
      FCopies := DevMode^.dmCopies
    else
      FCopies := 1;
  end;

  procedure GBin; { Paper bin }
  var
    aBin : integer;
    I : TQRBin;
  begin
    FOutputBin := First;
    if Supported(dm_defaultsource) then
    begin
      aBin := DevMode^.dmDefaultSource;
      for I := First to Last do
      begin
        if cQRBinTranslate[I] = aBin then
        begin
          FOutputBin := I;
          exit;
        end
      end
    end
  end;

  procedure GDuplex; { Duplex }
  begin
    if Supported(dm_duplex) and (DevMode^.dmDuplex <> dmdup_simplex) then
      FDuplex := true
    else
      FDuplex := false;
  end;

  procedure GPixelsPer; { Horizontal and Vertical pixels per inch }
  begin
    FPixelsPerX := GetDeviceCaps(FPrinter.Handle, LOGPIXELSX);
    FPixelsPerY := GetDeviceCaps(FPrinter.Handle, LOGPIXELSY);
  end;

  procedure GOffset; { Top left printing offset (waste) }
  var
    PrintOffset: TPoint;
    EscapeFunc: word;
  begin
    EscapeFunc := GetPrintingOffset;
    if Escape(FPrinter.Handle,QueryEscSupport,SizeOf(EscapeFunc), @EscapeFunc,nil) <> 0 then
    begin
      Escape(FPrinter.Handle,GetPrintingOffset,0,nil,@PrintOffset);
      FLeftOffset := round(PrintOffset.X/PixelsPerX*254);
      FTopOffset := round(PrintOffset.Y/PixelsPerY*254);
    end else
    begin
      FLeftOffset := 0;
      FTopOffset := 0;
    end;
  end;

  procedure GPaperSize;
  var
    aSize : integer;
    I : TQRPaperSize;
  begin
    FPaperSize := Default;
    if Supported(dm_papersize) then
    begin
      aSize := DevMode^.dmPaperSize;
      for I := Default to Custom do
      begin
        if aSize=cQRPaperTranslate[I] then
        begin
          FPaperSize := I;
          exit;
        end
      end
    end
  end;

  procedure GPaperDim;
  var
    PSize : TPoint;
    EscapeFunc : word;
  begin
    EscapeFunc := GetPhysPageSize;
    if Escape(FPrinter.Handle, QueryEscSupport, SizeOf(EscapeFunc), @EscapeFunc, nil) <> 0 then
    begin
      Escape(FPrinter.Handle, GetPhysPageSize, 0, nil, @PSize);
      FPaperWidth := round(PSize.X / PixelsPerX * 254);
      FPaperLength := round(PSize.Y / PixelsPerY * 254);
    end else
    begin
      FPaperWidth := 0;
      FPaperLength := 0;
    end
  end;

{$ifndef ver110}
  procedure GPaperSizes;
  var
    DCResult : array[0..64] of word;
    I : integer;
    J : TQRPaperSize;
    Count : integer;
  begin
    Fillchar(DCResult,SizeOf(DCResult),#0);
    Fillchar(FPaperSizes,Sizeof(FPaperSizes),#0);
    Count := DeviceCapabilities(FDevice, FPort, DC_PAPERS, @DCResult, DevMode);
    for I := 0 to Count - 1 do
    begin
      for J := Default to Custom do
      begin
        if cQRPaperTranslate[J] = DCResult[I] then
        begin
          FPaperSizes[J] := true;
          break;
        end
      end
    end;
    FPaperSizes[Custom] := true;
  end;
{$else}
  procedure GPaperSizes;
  var
    DCResult : array of word;
    I : integer;
    J : TQRPaperSize;
    Count : integer;
  begin
    Count := DeviceCapabilities(FDevice, FPort, DC_PAPERS, nil, DevMode);
    SetLength(DCResult, Count);
    Fillchar(Pointer(DCResult)^, Count * Sizeof(word), #0);
    Fillchar(FPaperSizes,Sizeof(FPaperSizes),#0);
    Count := DeviceCapabilities(FDevice, FPort, DC_PAPERS, PChar(DCResult), DevMode);
    for I := 0 to Count - 1 do
    begin
      for J := Default to Custom do
      begin
        if cQRPaperTranslate[J] = DCResult[I] then
        begin
          FPaperSizes[J] := true;
          break;
        end
      end
    end;
    FPaperSizes[Custom] := true;
  end;
{$endif}

begin
  if FPrinter<>nil then
  begin
    GPrinter;
    GPixelsPer;
    GCopies;
    GBin;
    GDuplex;
    GOffset;
    GPaperSize;
    GPaperDim;
    GPaperSizes;
    GlobalUnlock(DeviceMode);
  end
end;

procedure TPrinterSettings.ApplySettings;
begin
  FPrinter.GetPrinter(FDevice, FDriver, FPort, DeviceMode);
  DevMode := GlobalLock(DeviceMode);
  if PaperSize = Custom then
  begin
    if Supported(dm_paperlength) then
    begin
      SetField(dm_paperlength);
      DevMode^.dmPaperLength := PaperLength;
    end;
    if Supported(dm_PaperWidth) then
    begin
      SetField(dm_paperwidth);
      DevMode^.dmPaperWidth := PaperWidth;
    end
  end;

  If FDuplex then
  begin
    SetField(dm_duplex);
    DevMode^.dmDuplex := dmdup_horizontal;
  end;

  if Supported(dm_PaperSize) and
     (PaperSize <> Default) then
  begin
    SetField(dm_papersize);
    DevMode^.dmPaperSize := cQRPaperTranslate[PaperSize];
  end;

  SetField(dm_copies);
  DevMode^.dmCopies := FCopies;

  SetField(dm_defaultsource);
  DevMode^.dmDefaultSource := (DevMode^.dmDefaultSource  and 256) or cQRBinTranslate[OutputBin];

  SetField(dm_orientation);
  if Orientation=poPortrait then
    DevMode^.dmOrientation := dmorient_portrait
  else
    DevMode^.dmOrientation := dmorient_landscape;

  FPrinter.SetPrinter(FDevice, FDriver, FPort, DeviceMode);
  GlobalUnlock(DeviceMode);
end;

procedure TPrinterSettings.SetCopies(Value : integer);
begin
  if Supported(dm_copies) then
    FCopies := Value;
end;

procedure TPrinterSettings.SetDuplex(Value : boolean);
begin
  if Supported(dm_duplex) then
    FDuplex := Value;
end;

procedure TPrinterSettings.SetOrientation(Value : TPrinterOrientation);
begin
  if Supported(dm_orientation) then
    FOrientation := Value;
end;

procedure TPrinterSettings.SetOutputBin(Value : TQRBin);
begin
  if Supported(dm_defaultsource) then
    FOutputBin := Value;
end;

procedure TPrinterSettings.SetPaperSize(Value : TQRPaperSize);
begin
  if PaperSizeSupported[Value] then
    FPaperSize := Value
  else
    if (Value = Default) then
      FPaperSize := Default;
end;

procedure TPrinterSettings.SetPaperLength(Value : integer);
begin
  if PaperSize = Custom then
    FPaperLength := Value;
end;

procedure TPrinterSettings.SetPaperWidth(Value : integer);
begin
  if PaperSize = Custom then
    FPaperWidth := Value;
end;

procedure TPrinterSettings.SetPrinter(Value : TPrinter);
begin
  FPrinter := Value;
  if (Value <> nil) and (FPrinter.Printers.Count > 0) then
    GetPrinterSettings;
end;

procedure TPrinterSettings.SetTitle(Value : string);
begin
  FTitle := Value;
end;

{ TQRPrinterSettings }

constructor TQRPrinterSettings.Create;
begin
  PaperSize := Letter;
  Copies := 1;
  Duplex := false;
  Title := '';
  FFirstPage := 0;
  FLastPage := 0;
  FPrinterIndex := -1;
  FOutputBin := Auto;
end;

procedure TQRPrinterSettings.ApplySettings(APrinter : TQRPrinter);
begin
  aPrinter.PrinterIndex := PrinterIndex;
  aPrinter.PaperSize := PaperSize;
  aPrinter.Copies := Copies;
  aPrinter.Duplex := Duplex;
  aPrinter.Orientation := Orientation;
  aPrinter.OutputBin := OutputBin;
  aPrinter.Title := Title;
end;

{ TQRPrinter }

procedure ResetDriver(aPrinter : TPrinter);
var
  Device, Name, Port: array[0..255] of Char;
  DevMode: THandle;
begin
  aPrinter.GetPrinter( Device, Name, Port , DevMode );
  aPrinter.SetPrinter( Device, Name, Port , 0 );
end;

constructor TQRPrinter.Create;
begin
{$ifdef EvalVersion}
  if not DelphiRunning then
  begin
    ShowMessage('This evaluation copy of QuickReport only works while Delphi is running. '+
                'Please contact QuSoft to order a full version');
    Application.Terminate;
  end;
{$endif}
  FPrinterOK := Printer.Printers.Count > 0;
  aPrinter := TPrinter.Create;
  aPrinterSettings := TPrinterSettings.Create;
  if PrinterOK then
  begin
    aPrinterSettings.Printer := aPrinter;
    if Printer.PrinterIndex > aPrinter.Printers.Count then
      aPrinter.PrinterIndex := Printer.PrinterIndex;
  end;
  FTopWaste := aPrinterSettings.TopOffset;
  FLeftWaste := aPrinterSettings.LeftOffset;
  FDestination := qrdMetafile;
  FStatus := mpReady;
  FPageNumber := 0;
  PageList := TQRPageList.Create;
{  FOnProgressChangeEvent := nil;}
  FAvailablePages := 0;
  FXFactor := 1;
  FYFactor := 1;
  FClient := nil;
  FMaster := nil;
  FAfterPreviewEvent := nil;
  FAfterPrintEvent := nil;
  FCloseControl := nil;
  FShowingPreview := false;
  ReportLoaded := false;
end;

destructor TQRPrinter.Destroy;
begin
  if Status <> mpReady then
    Cleanup;
  if FCloseControl <> nil then
    FCloseControl.Free;
  aPrinter.Free;
  aPrinterSettings.Free;
  PageList.Free;
  if FPage <> nil then
    FPage.Free;
  inherited Destroy;
end;

procedure TQRPrinter.Cleanup;
begin
  if Status = mpBusy then
    Cancel;
  if assigned(aStream) then
  begin
    aStream.Free;
    aStream := nil;
    PageList.Stream := nil;
  end;
  PageList.Clear;
  FStatus := mpReady;
end;

procedure TQRPrinter.ClosePreview(Control : TWinControl);
begin
  if Master <> nil then
    SendMessage(Master.Handle, CM_QRPREVIEWCLOSE, 0, longint(Self));
//  if PreviewControl <> nil then
//    PreviewControl.Free;
//  if (Control <> nil) and (Control is TCustomForm) then
//    TCustomForm(Control).Free;
//    PostMessage(Control.Handle, WM_DESTROY, 0, 0);
//  FCloseControl := Control;
end;

function TQRPrinter.XPos(Value : extended) : integer;
begin
  result := round((Value - FLeftWaste) * XFactor);
end;

function TQRPrinter.XSize(Value : extended) : integer;
begin
  result := round(Value * XFactor);
end;

function TQRPrinter.YPos(Value : extended) : integer;
begin
  result := round((Value - FTopWaste) * YFactor);
end;

function TQRPrinter.YSize(Value : extended) : integer;
begin
  result := round(Value * YFactor);
end;

function TQRPrinter.GetCompression : boolean;
begin
  Result := PageList.Compression;
end;

procedure TQRPrinter.SetCompression(Value : boolean);
begin
  PageList.Compression := Value;
end;

{ TQRPrinter methods related to printer driver settings }

function TQRPrinter.GetBin : TQRBin;
begin
  Result := aPrinterSettings.OutputBin;
end;

function TQRPrinter.GetCopies;
begin
  Result := aPrinterSettings.Copies;
end;

function TQRPrinter.GetDuplex : boolean;
begin
  Result := aPrinterSettings.Duplex;
end;

function TQRPrinter.GetLeftWaste : integer;
{ Return left unprintable area in 0.1 mm }
begin
  if Destination=qrdPrinter then
    Result := aPrinterSettings.LeftOffset
  else
    Result := 0;
end;

function TQRPrinter.GetOrientation : TPrinterOrientation;
begin
  Result := aPrinterSettings.Orientation;
end;

function TQRPrinter.GetPaperLength : integer;
{ Return physical paper length in 0.1 mm }
begin
  Result := aPrinterSettings.PaperLength;
end;

function TQRPrinter.PaperLengthValue : integer;
begin
  if Orientation = poPortrait then
  begin
    if (PaperSize <> Custom) and (PaperSize <> Default) then
      result := round(cqrPaperSizeMetrics[PaperSize, 1] * 10)
    else
      result := PaperLength;
  end else
  begin
    if PaperSize <> Custom then
      result := round(cqrPaperSizeMetrics[PaperSize, 0] * 10)
    else
      if PaperSize = Default then
        result := PaperWidth
      else
        result := PaperLength; // size = custom
  end;
end;

function TQRPrinter.PaperWidthValue : integer;
begin
  if Orientation = poPortrait then
  begin
    if (PaperSize <> Custom) and (PaperSize <> Default) then
      result := round(cqrPaperSizeMetrics[PaperSize, 0] * 10)
    else
      result := PaperWidth;
  end else
  begin
    if PaperSize<>Custom then
      result := round(cqrPaperSizeMetrics[PaperSize, 1] * 10)
    else
      if PaperSize = Default then
        Result := PaperLength
      else
        Result := PaperWidth; // Size = custom
  end;
end;

function TQRPrinter.GetPaperWidth : integer;
{ Return physical paper width in 0.1 mm }
begin
  Result := aPrinterSettings.PaperWidth;
end;

function TQRPrinter.GetPaperSize : TQRPaperSize;
{ Return currently selected paper size }
begin
  Result := aPrinterSettings.PaperSize;
end;

function TQRPrinter.GetPrinterIndex : integer;
{ Return currently selected printer }
begin
  result := aPrinter.PrinterIndex;
end;

function TQRPrinter.GetPrinters : TStrings;
{ Return list of printers }
begin
  result := aPrinter.Printers;
end;

function TQRPrinter.GetTopWaste : integer;
{ Return unprintable area on top in 0.1 mm }
begin
  if Destination=qrdPrinter then
    Result := aPrinterSettings.TopOffset
  else
    Result := 0;
end;

procedure TQRPrinter.SetBin(Value : TQRBin);
begin
  aPrinterSettings.Outputbin := Value;
end;

procedure TQRPrinter.SetCopies(Value : integer);
begin
  aPrinterSettings.Copies := Value;
end;

procedure TQRPrinter.SetDestination(Value : TQRPrinterDestination);
begin
  FDestination := Value;
end;

procedure TQRPrinter.SetDuplex(Value : Boolean);
begin
  aPrinterSettings.Duplex := Value;
end;

procedure TQRPrinter.SetOrientation(Value : TPrinterOrientation);
begin
  aPrinterSettings.Orientation := Value;
end;

procedure TQRPrinter.SetPaperWidth(Value : integer);
{ Sets the paper width in 0.01 mm }
begin
  aPrinterSettings.PaperWidth := Value;
end;

function TQRPrinter.GetPage(Value : integer) : TMetafile;
begin
  if (Status in [mpBusy, mpFinished]) and
     (Value > 0) and (Value <= FPageCount) then
    Result := PageList.GetPage(Value)
  else
    Result := nil;
end;

procedure TQRPrinter.SetPageNumber(Value : integer);
begin
  if (PageNumber > 0) and (PageNumber <= FPageCount) then
  begin
    if FPage <> nil then
      FPage.Free;
    FPage := GetPage(Value);
    FPageNumber := Value;
  end;
end;

procedure TQRPrinter.SetPaperLength(Value : integer);
{ Sets the paper length in 0.1 mm }
begin
  aPrinterSettings.PaperLength := Value;
end;

procedure TQRPrinter.SetPaperSize(Value : TQRPaperSize);
begin
  aPrinterSettings.PaperSize := Value;
end;

procedure TQRPrinter.SetPrinterIndex(Value : integer);
begin
  if PrinterOK then
  begin
    aPrinter.PrinterIndex := Value;
    ResetDriver(aPrinter);
    aPrinterSettings.GetPrinterSettings;
  end;
end;

{ TQRPrinter methods related to printing }

function TQRPrinter.GetCanvas;
begin
  result := FCanvas;
end;

procedure TQRPrinter.CreateMetafileCanvas;
begin
  FMetafile := TMetafile.Create;
  FMetafile.Width := XSize(PaperWidthValue);
  FMetafile.Height := YSize(PaperLengthValue);
  FCanvas := TMetafileCanvas.Create(FMetafile, 0);
  YFactor := Screen.PixelsPerInch / 254;
  XFactor := YFactor;  
end;

function TQRPrinter.CurrentPageOK : boolean;
begin
  Result := true;
  if (FirstPage > 0) and (PageCount < FirstPage) then
    Result := false;
  if (LastPage > 0) and (PageCount > LastPage) then
    Result := false;
end;

procedure TQRPrinter.CreatePrinterCanvas;
begin
  if not aPrinter.Printing then
  begin
    aPrinter.Title := Title;
    aPrinter.BeginDoc;
    FCanvas := aPrinter.Canvas;
  end else
  begin
    StartPage(aPrinter.Handle);
    FCanvas := aPrinter.Canvas;
    Canvas.Refresh;
  end;
  XFactor := GetDeviceCaps(aPrinter.Handle, LogPixelsX) / 254;
  YFactor := GetDeviceCaps(aPrinter.Handle, LogPixelsY) / 254;
end;

procedure TQRPrinter.EndMetafileCanvas;
begin
  Canvas.Free;
end;

procedure TQRPrinter.EndPrinterCanvas;
begin
  if aPrinter.Printing and (PageCount <> LastPage) then
    aPrinter.NewPage;
end;

procedure TQRPrinter.NewPage;
begin
  if Status <> mpBusy then
    raise EQRError.Create(SqrIllegalNewPage);
  if PageNumber > 0 then
  begin
    case Destination of
      qrdMetafile: begin
                    EndMetafileCanvas;
                    PageList.AddPage(FMetafile);
                    FMetafile.Free;
                  end;
      qrdPrinter: begin
                    if CurrentPageOK then
                      EndPrinterCanvas
                    else
                    begin
                      EndMetafileCanvas;
                      FMetaFile.Free;
                    end;
                  end;
    end;
    AvailablePages := AvailablePages + 1;
  end;
  inc(FPageCount);
  inc(FPageNumber);
  case Destination of
    qrdMetafile : CreateMetafileCanvas;
    qrdPrinter : if CurrentPageOK then
                   CreatePrinterCanvas
                 else
                   CreateMetafileCanvas;
  end;
end;

procedure TQRPrinter.Cancel;
begin
  Cancelled := true;
end;

procedure TQRPrinter.BeginDoc;
begin
  FMetafile := nil;
  FAvailablePages := 0;
  FCancelled := false;
  if Destination = qrdPrinter then
    aPrinterSettings.ApplySettings;
  FTopWaste := TopWaste;
  FLeftWaste := LeftWaste;
  if Status <> mpReady then
    raise EQRError.Create(SqrQRPrinterNotReady)
  else
  begin
    FPageNumber := 0;
    FPageCount := 0;
    FStatus := mpBusy;
    case Destination of
      qrdMetafile : begin
                      aStream := TQRStream.Create(100000);
                      PageList.Stream := aStream;
                      YFactor := Screen.PixelsPerInch / 254;
                      XFactor := YFactor;
                    end;
      qrdPrinter : begin
                     XFactor := GetDeviceCaps(aPrinter.Handle, LogPixelsX) / 254;
                     YFactor := GetDeviceCaps(aPrinter.Handle, LogPixelsY) / 254;
                   end;
    end;
  end;
end;

procedure TQRPrinter.SetAvailablePages(Value : integer);
begin
  FAvailablePages := Value;
  if Client <> nil then
    PostMessage(Client.Handle, CM_QRPAGEAVAILABLE, Value, 0);
end;

procedure TQRPrinter.SetProgress(Value : integer);
begin
  FProgress := Value;
  if Client <> nil then
    PostMessage(Client.Handle, CM_QRPROGRESSUPDATE, Value, 0)
end;

procedure TQRPrinter.SetShowingPreview(Value : boolean);
begin
  if ShowingPreview and not Value then
  try
    if Status = mpBusy then Cancel;
    if assigned(FAfterPreviewEvent) then
      FAfterPreviewEvent(Self);
  finally
    FShowingPreview := Value;
  end else
    FShowingPreview := Value;
end;

procedure TQRPrinter.EndDoc;
begin
  if FStatus = mpBusy then
  begin
    case Destination of
      qrdPrinter : if aPrinter.Printing then aPrinter.EndDoc;
      qrdMetafile : begin
                      if FPageCount > 0 then
                      begin
                        EndMetafileCanvas;
                        PageList.AddPage(FMetafile);
                        FMetafile.Free;
                      end;
                    end;
    end;
    AvailablePages := AvailablePages + 1;
    FStatus := mpFinished;
    if Destination = qrdMetafile then
      PageList.Finish
    else
      if assigned(FAfterPrintEvent) then
      try
        FAfterPrintEvent(Self);
      finally
      end;
  end;
end;

procedure TQRPrinter.AbortDoc;
begin
  case Destination of
    qrdPrinter : aPrinter.Abort;
    qrdMetafile : begin
                    if FMetafile <> nil then
                    begin
                      EndMetafileCanvas;
                      PageList.AddPage(FMetafile);
                      FMetafile.Free;
                    end;
                  end;
  end;
  FStatus := mpFinished;
end;

procedure TQRPrinter.Load(Filename : string);
var
  I : TQRPaperSize;
  H, V : integer;
begin
  if Status <> mpReady then
    CleanUp;
  PageList := TQRPageList.Create;
  PageList.LoadFromFile(Filename);
  FPageCount := PageList.PageCount;
  FXFactor := Screen.PixelsPerInch / 254;
  FYFactor :=FXFactor;
  if FPageCount > 0 then
  begin
    with PageList.GetPage(1) do
    try
      h := round(int(Width / XFactor / 40));
      v := round(int(Height / XFactor / 40));
    finally
      free;
    end;
    for I := Letter to ESheet do
    begin
      if (round(int(cQRPaperSizeMetrics[I][0] / 4)) = h) and
         (round(int(cQRPaperSizeMetrics[I][1] / 4)) = v) then
      begin
        PaperSize := I;
        Orientation := poPortrait;
      end;
      if (round(int(cQRPaperSizeMetrics[I][0] / 4)) = v) and
         (round(int(cQRPaperSizeMetrics[I][1] / 4)) = h) then
      begin
        PaperSize := I;
        Orientation := poLandscape;
      end;
    end;
  end;
  aStream := PageList.Stream;
  FStatus := mpFinished;
//  FOnGenerateToPrinterEvent := nil;
  FOnPrintSetupEvent := nil;
  FOnExportToFilterEvent := nil;
  ReportLoaded := true;
end;

procedure TQRPrinter.Save(Filename : string);
begin
  if Status = mpFinished then
    PageList.SaveToFile(Filename);
end;

procedure TQRPrinter.ExportToFilter(AFilter : TQRExportFilter);
begin
  if assigned(FOnExportToFilterEvent) then
    FOnExportToFilterEvent(AFilter);
end;

procedure TQRPrinter.Preview;
begin
  if assigned(FOnPreviewEvent) then
  try
    FOnPreviewEvent(Self)
  finally
  end else
    with GlobalPreviewInterface.Create(nil) do
    try
      PreviewControl := Show(Self)
    finally
      Free;
    end;
end;

procedure TQRPrinter.PreviewModal;
begin
  if assigned(FOnPreviewEvent) then
  try
    FOnPreviewEvent(Self)
  finally
  end else
    with GlobalPreviewInterface.Create(nil) do
    try
      ShowModal(Self)
    finally
      Free;
    end;
end;

procedure TQRPrinter.Print;
type
  TSmallPoint = record
    X,
    Y : integer;
  end;
var
  I : integer;
  Count : integer;
  aPoint : TSmallPoint;
  ASize : TPoint;
  EscapeFunc : word;
  APage : TMetafile;
  FromPage, ToPage: integer;
begin
{$ifdef EVAL}
  if not DelphiRunning then
    MessageDlg('Unregistered evaluation copy - Printing is only allowed while Delphi is running',mtWarning,[mbOK],0)
  else
{$endif}
    if assigned(FMaster) and not ReportLoaded then
      PostMessage(Master.Handle, CM_QRPRINT, 0, 0)
    else
      if (Status = mpFinished) and PrinterOK then
      try
        APrinter.Title := Title;
        if APrinter.Printing then
          APrinter.Abort;
        APrinterSettings.ApplySettings;
        APrinter.BeginDoc;
        Count := 0;

        FromPage := 1;
        ToPage := PageCount;

        if (FirstPage <> 0) or (LastPage <> 0) then
        begin
          FromPage := FirstPage;
          ToPage := LastPage;
        end;

        for I := FromPage to ToPage do
        begin
          Application.ProcessMessages;
          PageNumber := I;
          EscapeFunc := GetPhysPageSize;
          if Escape(APrinter.Handle, QueryEscSupport, SizeOf(EscapeFunc), @EscapeFunc, nil) <> 0 then
            Escape(APrinter.Handle, GetPhysPageSize, 0, nil, @ASize);
          EscapeFunc := GetPrintingOffset;
          if Escape(APrinter.Handle, QueryEscSupport, SizeOf(EscapeFunc), @EscapeFunc, nil) <> 0 then
            Escape(APrinter.Handle, GetPrintingOffset, Count, @aPoint, @aPoint);
//          APrinter.Canvas.StretchDraw(Rect(-aPoint.X, -aPoint.Y, aSize.X - aPoint.X, aSize.Y - aPoint.Y), GetPage(I));
          APage := GetPage(I);
          try
            APrinter.Canvas.StretchDraw(Rect(0, 0, APrinter.PageWidth, APrinter.PageHeight), APage);
          finally
            APage.Free;
          end;
          if I < PageCount then APrinter.NewPage;
          if Cancelled then
            APrinter.Abort;
        end
      finally
        if APrinter.Printing then
          APrinter.EndDoc;
      end;
end;

procedure TQRPrinter.PrintSetup;
begin
  if assigned(FOnPrintSetupEvent) then
    FOnPrintSetupEvent;
end;

function QRPrinter : TQRPRinter;
begin
  if FQRPrinter = nil then
    FQRPrinter := TQRPrinter.Create;
  Result := FQRPrinter;
end;

procedure RegisterPreviewClass(APreviewInterface : TQRPreviewInterfaceClass);
begin
  GlobalPreviewInterface := APreviewInterface;
end;

initialization
  FQRPrinter := nil;
  GlobalPreviewInterface := TQRStandardPreviewInterface;
  QRExportFilterLibrary := TQRExportFilterLibrary.Create;

finalization
 if FQRPrinter <> nil then
    FQRPrinter.Free;
  QRExportFilterLibrary.Free;

end.
