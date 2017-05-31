(*
CRDYNAMIC.PAS
Delphi Dynamic Declarations for CRPE(32).DLL
============================================
Author   : Frank Zimmerman
           (based on CRDelphi.Pas by Andre Couturier & James Anderson)
Date     : September 1999
Purpose  : This file presents a Dynamic API to the Crystal Reports
           Print Engine DLL.  This file will compile and execute in
           Delphi 1.0, 2.0, 3.0 and 4.0.
Language : Delphi 1.0, 2.0, 3.0 and 4.0.
Copyright (c) 1991-1999 Seagate Software, Inc.
Notes    : This file will create a CRDynamic.dcu when you use compile
           and build. To use the CRDynamic.dcu, you will need to add
           the following line of code to your 'uses' section of your
           Delphi application, eg.

           uses
             Classes, CRDynamic, ...;
*)

unit CRDynamic;

{$X+}  {Extended Syntax on}
{$A-}  {Word Align Data off}

{******************************************************************************}
{*** Interface Section ********************************************************}
{******************************************************************************}
interface

uses
  Classes, 
{$IFDEF WIN32}
  Windows;
{$ELSE}
  WinTypes, WinProcs;
{$ENDIF}

const
  { Sizes for Variables }
  PE_BYTE_LEN      =  1;
  PE_CHAR_LEN      =  1;
  PE_WORD_LEN      =  2;
  PE_DWORD_LEN     =  4;
  PE_SMALLINT_LEN  =  2;
  PE_BOOL_LEN	   =  2;
  PE_LONGINT_LEN   =  8; {4 in 16 bit?}
  PE_LONGPTR_LEN   =  4;

  { Unchanged constants }
  PE_UNCHANGED       = -1;
  PE_UNCHANGED_COLOR = -2;
  PE_NO_COLOR        = $FFFFFFFF; { unsigned long }

{******************************************************************************}
{ Error Codes returned by the CRPE.DLL                                         }
{******************************************************************************}
  PE_ERR_NOERROR                     = 0;
  PE_ERR_NOTENOUGHMEMORY             = 500;
  PE_ERR_INVALIDJOBNO                = 501;
  PE_ERR_INVALIDHANDLE               = 502;
  PE_ERR_STRINGTOOLONG               = 503;
  PE_ERR_NOSUCHREPORT                = 504;
  PE_ERR_NODESTINATION               = 505;
  PE_ERR_BADFILENUMBER               = 506;
  PE_ERR_BADFILENAME                 = 507;
  PE_ERR_BADFIELDNUMBER              = 508;
  PE_ERR_BADFIELDNAME                = 509;
  PE_ERR_BADFORMULANAME              = 510;
  PE_ERR_BADSORTDIRECTION            = 511;
  PE_ERR_ENGINENOTOPEN               = 512;
  PE_ERR_INVALIDPRINTER              = 513;
  PE_ERR_PRINTFILEEXISTS             = 514;
  PE_ERR_BADFORMULATEXT              = 515;
  PE_ERR_BADGROUPSECTION             = 516;
  PE_ERR_ENGINEBUSY                  = 517;
  PE_ERR_BADSECTION                  = 518;
  PE_ERR_NOPRINTWINDOW               = 519;
  PE_ERR_JOBALREADYSTARTED           = 520;
  PE_ERR_BADSUMMARYFIELD             = 521;
  PE_ERR_NOTENOUGHSYSRES             = 522;
  PE_ERR_BADGROUPCONDITION           = 523;
  PE_ERR_JOBBUSY                     = 524;
  PE_ERR_BADREPORTFILE               = 525;
  PE_ERR_NODEFAULTPRINTER            = 526;
  PE_ERR_SQLSERVERERROR              = 527;
  PE_ERR_BADLINENUMBER               = 528;
  PE_ERR_DISKFULL                    = 529;
  PE_ERR_FILEERROR                   = 530;
  PE_ERR_INCORRECTPASSWORD           = 531;
  PE_ERR_BADDATABASEDLL              = 532;
  PE_ERR_BADDATABASEFILE             = 533;
  PE_ERR_ERRORINDATABASEDLL          = 534;
  PE_ERR_DATABASESESSION             = 535;
  PE_ERR_DATABASELOGON               = 536;
  PE_ERR_DATABASELOCATION            = 537;
  PE_ERR_BADstructSize               = 538;
  PE_ERR_BADDATE                     = 539;
  PE_ERR_BADEXPORTDLL                = 540;
  PE_ERR_ERRORINEXPORTDLL            = 541;
  PE_ERR_PREVATFIRSTPAGE             = 542;
  PE_ERR_NEXTATLASTPAGE              = 543;
  PE_ERR_CANNOTACCESSREPORT          = 544;
  PE_ERR_USERCANCELLED               = 545;
  PE_ERR_OLE2NOTLOADED               = 546;
  PE_ERR_BADCROSSTABGROUP            = 547;
  PE_ERR_NOCTSUMMARIZEDFIELD         = 548;
  PE_ERR_DESTINATIONNOTEXPORT        = 549;
  PE_ERR_INVALIDPAGENUMBER           = 550;
  PE_ERR_NOTSTOREDPROCEDURE          = 552;
  PE_ERR_INVALIDPARAMETER            = 553;
  PE_ERR_GRAPHNOTFOUND               = 554;
  PE_ERR_INVALIDGRAPHTYPE            = 555;
  PE_ERR_INVALIDGRAPHDATA            = 556;
  PE_ERR_CANNOTMOVEGRAPH             = 557;
  PE_ERR_INVALIDGRAPHTEXT            = 558;
  PE_ERR_INVALIDGRAPHOPT             = 559;
  PE_ERR_BADSECTIONHEIGHT            = 560;
  PE_ERR_BADVALUETYPE                = 561;
  PE_ERR_INVALIDSUBREPORTNAME        = 562;
  PE_ERR_NOPARENTWINDOW              = 564; {dialog parent window}
  PE_ERR_INVALIDZOOMFACTOR           = 565; {zoom factor}
  PE_ERR_PAGESIZEOVERFLOW            = 567;
  PE_ERR_LOWSYSTEMRESOURCES          = 568;
  PE_ERR_BADGROUPNUMBER              = 570;
  PE_ERR_INVALIDOBJECTFORMATNAME     = 571;
  PE_ERR_INVALIDNEGATIVEVALUE        = 572;
  PE_ERR_INVALIDMEMORYPOINTER        = 573;
  PE_ERR_INVALIDOBJECTTYPE           = 574;
  PE_ERR_INVALIDGRAPHDATATYPE        = 577;
  PE_ERR_INVALIDSUBREPORTLINKNUMBER  = 582;
  PE_ERR_SUBREPORTLINKEXIST          = 583;
  PE_ERR_BADROWCOLVALUE              = 584;
  PE_ERR_INVALIDSUMMARYNUMBER        = 585;
  PE_ERR_INVALIDGRAPHDATAFIELDNUMBER = 586;
  PE_ERR_INVALIDSUBREPORTNUMBER      = 587;
  PE_ERR_INVALIDFIELDSCOPE           = 588;
  PE_ERR_FIELDINUSE                  = 590;
  PE_ERR_INVALIDPARAMETERNUMBER      = 594;
  PE_ERR_INVALIDPAGEMARGINS          = 595;
  PE_ERR_REPORTONSECUREQUERY         = 596;
  PE_ERR_CANNOTOPENSECUREQUERY       = 597;
  PE_ERR_INVALIDSECTIONNUMBER        = 598;
  PE_ERR_SQLSERVERNOTOPENED          = 599;
  PE_ERR_TABLENAMEEXIST              = 606;
  PE_ERR_INVALIDCURSOR               = 607;
  PE_ERR_FIRSTPASSNOTFINISHED        = 608;
  PE_ERR_CREATEDATASOURCE            = 609;
  PE_ERR_CREATEDRILLDOWNPARAMETERS   = 610;
  PE_ERR_CHECKFORDATASOURCECHANGES   = 613;
  PE_ERR_STARTBACKGROUNDPROCESSING   = 614;
  PE_ERR_SQLSERVERINUSE              = 619;
  PE_ERR_GROUPSORTFIELDNOTSET        = 620;
  PE_ERR_CANNOTSETSAVESUMMARIES      = 621;
  PE_ERR_LOADOLAPDATABASEMANAGER     = 622;
  PE_ERR_OPENOLAPCUBE                = 623;
  PE_ERR_READOLAPCUBEDATA            = 624;
  PE_ERR_CANNOTSAVEQUERY             = 626;
  PE_ERR_CANNOTREADQUERYDATA         = 627;
  PE_ERR_MAINREPORTFIELDLINKED       = 629;
  PE_ERR_INVALIDMAPPINGTYPEVALUE     = 630;
  PE_ERR_HITTESTFAILED               = 636;
  PE_ERR_BADSQLEXPRESSIONNAME        = 637; { no SQL expression by the specified *name* exists in this report. }
  PE_ERR_BADSQLEXPRESSIONNUMBER      = 638; { no SQL expression by the specified *number* exists in this report. }
  PE_ERR_BADSQLEXPRESSIONTEXT        = 639; { not a valid SQL expression }
  PE_ERR_INVALIDDEFAULTVALUEINDEX    = 641; { invalid index for default value of a parameter. }
  PE_ERR_NOMINMAXVALUE               = 642; { the specified PE_PF_* type does not have min/max values. }
  PE_ERR_INCONSISTANTTYPES           = 643; { if both min and max values are specified in PESetParameterMinMaxValue, }
                                            { the value types for the min and max must be the same. }
  PE_ERR_CANNOTLINKTABLES            = 645;
  PE_ERR_CREATEROUTER                = 646;
  PE_ERR_INVALIDFIELDINDEX           = 647;
  PE_ERR_INVALIDGRAPHTITLETYPE       = 648;
  PE_ERR_INVALIDGRAPHTITLEFONTTYPE   = 649;
  PE_ERR_PARAMTYPEDIFFERENT          = 650; { the type used in a add/set value API for a }
                                            { parameter differs with it's existing type. }
  PE_ERR_INCONSISTANTRANGETYPES      = 651; { the value type for both start & end range }
                                            { values must be the same. }
  PE_ERR_RANGEORDISCRETE             = 652; { an operation was attempted on a discrete parameter that is }
                                            { only legal for range parameters or vice versa. }
  PE_ERR_NOTMAINREPORT               = 654; { an operation was attempted that is disallowed for subreports. }
  PE_ERR_INVALIDCURRENTVALUEINDEX    = 655; { invalid index for current value of a parameter. }
  PE_ERR_LINKEDPARAMVALUE            = 656; { operation illegal on linked parameter. }
  PE_ERR_INVALIDSORTMETHODINDEX      = 674; { Invalid sort method index. }
  PE_ERR_INVALIDGRAPHSUBTYPE         = 675; { Invalid PE_GST_* or }
                                            { PE_GST_* does not match PE_GT_* or }
                                            { PE_GST_* current graph type. }
  PE_ERR_BADGRAPHOPTIONINFO          = 676; { one of them members of PEGraphOptionInfo is out of range. }
  PE_ERR_BADGRAPHAXISINFO            = 677; { one of them members of PEGraphAxisInfo is out of range. }
  PE_ERR_OTHERERROR                  = 997;
  PE_ERR_INTERNALERROR               = 998; { programming error }
  PE_ERR_NOTIMPLEMENTED              = 999;

{$IFNDEF WIN32}
type
  DWord = LongInt;
{$ENDIF}

const
{$IFDEF WIN32}
  CRPEDLLName = 'CRPE32.DLL';
{$ELSE}
  CRPEDLLName = 'CRPE.DLL';
{$ENDIF}

{******************************************************************************}
{ Load and Unload the CRPE DLL                                                 }
{******************************************************************************}
  function PELoadCrpeDll(const DllPath: string) : Bool;
  function PEUnloadCrpeDll : Bool;

{******************************************************************************}
{ Open and Close Print Engine                                                  }
{******************************************************************************}
type
  TPEOpenEngine = function : Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  TPECloseEngine = procedure; {$IFDEF WIN32} stdcall; {$ENDIF}
  TPECanCloseEngine = function : Bool; {$IFDEF WIN32} stdcall; {$ENDIF}

  function PEOpenEngine : Bool;
  procedure PECloseEngine;
  function PECanCloseEngine : Bool;

{OpenEngineEx not used yet...}
const
  PE_OE_SINGLE_THREADED = 0;
  PE_OE_MULTI_THREADED  = 1;

type
  PEEngineOptions = record
    structSize     : Word;
    openEngineType : smallint;
  end;

  TPEOpenEngineEx = function (var EngineOptions: PEEngineOptions): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEOpenEngineEx (var EngineOptions: PEEngineOptions): Bool;

{******************************************************************************}
{ Open and Close Print Job (i.e. Report)                                       }
{******************************************************************************}
type
  TPEOpenPrintJob = function (reportFilePath: PChar): SmallInt; {$IFDEF WIN32} stdcall; {$ENDIF}
  TPEClosePrintJob = function (printJob : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}

  function PEOpenPrintJob (reportFilePath : PChar): Smallint;
  function PEClosePrintJob (printJob : Smallint): Bool;

{******************************************************************************}
{ Start and Cancel Print Job                                                   }
{  - i.e. print the Report, usually after changing report                      }
{******************************************************************************}
type
  TPEStartPrintJob = function (
    printJob      : Smallint;
    waitUntilDone : Bool): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  TPECancelPrintJob = procedure(printJob: Smallint); {$IFDEF WIN32} stdcall; {$ENDIF}

  function PEStartPrintJob (
    printJob      : Smallint;
    waitUntilDone : Bool): Bool;
  procedure PECancelPrintJob (printJob : Smallint);

{******************************************************************************}
{ Print Job Status                                                             }
{******************************************************************************}
type
  TPEIsPrintJobFinished = function (printJob: Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEIsPrintJobFinished (printJob : Smallint): Bool;

{ Status returns for PEGetJobStatus }
const
  PE_JOBNOTSTARTED = 1;
  PE_JOBINPROGRESS = 2;
  PE_JOBCOMPLETED  = 3;
  PE_JOBFAILED     = 4;
  PE_JOBCANCELLED  = 5;

type
  PEJobInfo = record
    structSize         : Word;  (*initialize to SizeOf(PEJobInfo)*)
    NumRecordsRead     : DWord;
    NumRecordsSelected : DWord;
    NumRecordsPrinted  : DWord;
    DisplayPageN       : Word;  (*the page being displayed in window*)
    LatestPageN        : Word;  (*the page being generated*)
    StartPageN         : Word;  (*user opted, default to 1*)
    PrintEnded         : Bool;  (*full report print completed?*)
  end;

const
  PE_SIZEOF_JOB_INFO = SizeOf(PEJobInfo);

type
  TPEGetJobStatus = function (
    printJob    : Smallint;
    var jobInfo : PEJobInfo): SmallInt; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetJobStatus (
    printJob    : Smallint;
    var jobInfo : PEJobInfo): Smallint;

{******************************************************************************}
{ Get Version Info                                                             }
{******************************************************************************}
const
  PE_GV_DLL    = 100;
  PE_GV_ENGINE = 200;

type
  TPEGetVersion = function (versionRequested : Smallint) : SmallInt; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetVersion (versionRequested : Smallint): Smallint;

{******************************************************************************}
{ Print Job Error Codes and Messages                                           }
{******************************************************************************}
type
  TPEGetErrorCode = function (printJob : Smallint): SmallInt; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetErrorCode (printJob : Smallint): Smallint;

type
  TPEGetErrorText = function (
    printJob       : Smallint;
    var textHandle : HWnd;
    var textLength : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetErrorText (
    printJob       : Smallint;
    var textHandle : HWnd;
    var textLength : Smallint): Bool;

type
  TPEGetHandleString = function (
    textHandle   : HWnd;
    buffer       : PChar;
    bufferLength : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetHandleString (
    textHandle   : HWnd;
    buffer       : PChar;
    bufferLength : Smallint): Bool;

{******************************************************************************}
{ Open, Print and Close Report                                                 }
{  - used when no changes needed to report - Complete Default                  }
{******************************************************************************}
type
  TPEPrintReport = function (
    reportFilePath    : PChar;
    toDefaultPrinter,
    toWindow          : Bool;
    title             : PChar;
    left,
    top,
    width,
    height            : integer;
    style             : DWord;
    parentWindow      : Hwnd): Smallint; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEPrintReport (
    reportFilePath    : PChar;
    toDefaultPrinter,
    toWindow          : Bool;
    title             : PChar;
    left,
    top,
    width,
    height            : integer;
    style             : DWord;
    parentWindow      : Hwnd): Smallint;

{******************************************************************************}
{ Report Options                                                               }
{******************************************************************************}
const
  PE_RPTOPT_CVTDATETIMETOSTR  = 0;
  PE_RPTOPT_CVTDATETIMETODATE = 1;
  PE_RPTOPT_KEEPDATETIMETYPE  = 2;

type
  PEReportOptions = record
    structSize                       : Word;  	  {initialize to PE_SIZEOF_REPORT_OPTIONS}
    saveDataWithReport               : Smallint;  {BOOL value, except use PE_UNCHANGED for no change}
    saveSummariesWithReport          : Smallint;  {BOOL value, except use PE_UNCHANGED for no change}
    useIndexForSpeed                 : Smallint;  {BOOL value, except use PE_UNCHANGED for no change}
    translateDOSStrings              : Smallint;  {BOOL value, except use PE_UNCHANGED for no change}
    translateDOSMemos                : Smallint;  {BOOL value, except use PE_UNCHANGED for no change}
    convertDateTimeType              : Smallint;  {a PE_RPTOPT_ value, except use PE_UNCHANGED for no change}
    convertNullFieldToDefault        : Smallint;  {BOOL value, except use PE_UNCHANGED for no change}
    morePrintEngineErrorMessages     : Smallint;  {BOOL value, except use PE_UNCHANGED for no change}
    caseInsensitiveSQLData           : Smallint;  {BOOL value, except use PE_UNCHANGED for no change}
    verifyOnEveryPrint               : Smallint;  {BOOL value, except use PE_UNCHAGED for no change}
    zoomMode                         : Smallint;  {a PE_ZOOM_ constant, except use PE_UNCHANGED for no change}
    hasGroupTree                     : Smallint;  {BOOL value, except use PE_UNCHANGED for no change}
    dontGenerateDataForHiddenObjects : Smallint;  {BOOL value, except use PE_UNCHANGED for no change}
    performGroupingOnServer          : Smallint;  {BOOL value, except use PE_UNCHANGED for no change}
    doAsyncQuery                     : Smallint;  {BOOL value, except use PE_UNCHANGED for no change}
  end;

const
  PE_SIZEOF_REPORT_OPTIONS = SizeOf(PEReportOptions);

type
  TPEGetReportOptions = function (
    printJob          : Smallint;
    var ReportOptions : PEReportOptions): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetReportOptions (
    printJob          : Smallint;
    var reportOptions : PEReportOptions): Bool;

type
  TPESetReportOptions = function (
    printJob          : Smallint;
    var ReportOptions : PEReportOptions): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetReportOptions (
    printJob          : Smallint;
    var reportOptions : PEReportOptions): Bool;

{******************************************************************************}
{ Open and Close Subreport                                                     }
{******************************************************************************}
type
  TPEOpenSubreport = function (
    printJob      : Smallint;
    ReportName    : PChar): Smallint; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEOpenSubreport (
    parentJob     : Smallint;
    subreportName : PChar): Smallint;

type
  TPECloseSubreport = function(printJob: Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PECloseSubreport (printJob : Smallint): Bool;

{******************************************************************************}
{ Subreports                                                                   }
{******************************************************************************}
type
  TPEGetNSubreportsInSection = function (
    printJob    : Smallint;
    sectionCode : Smallint): Smallint; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNSubreportsInSection (
    printJob    : Smallint;
    sectionCode : Smallint): Smallint;

type
  TPEGetNthSubreportInSection = function (
    printJob    : Smallint;
    sectionCode : Smallint;
    subreportN  : Smallint): DWord; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthSubreportInSection (
    printJob    : Smallint;
    sectionCode : Smallint;
    subreportN  : Smallint): DWord;

const
  PE_SUBREPORT_NAME_LEN = 128;

type
  PESubreportNameType = array [0..PE_SUBREPORT_NAME_LEN-1] of Char;

  {Structure to use for SCR 5 & 6}
  PESubreportInfo56 = record
    structSize	  : Word;
    subreportName : PESubreportNameType;
  end;

  {Structure to use for SCR 7+}
  PESubreportInfo = record
    structSize    : Word;     { Initialize to PE_SIZEOF_SUBREPORT_INFO }
    subreportName : PESubreportNameType;
    NLinks        : Smallint; { Number of Links }
    IsOnDemand    : Smallint; { TRUE if subreport is On Demand }
  end;

const
  PE_SIZEOF_SUBREPORT_INFO = SizeOf(PESubreportInfo);

type
  TPEGetSubreportInfo = function (
    printJob          : Smallint;
    subreportHandle   : DWord;
    var subreportInfo : PESubreportInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetSubreportInfo (
    printJob          : Smallint;
    subreportHandle   : DWord;
    var subreportInfo : PESubreportInfo): Bool;

{******************************************************************************}
{ Controlling Dialogs                                                          }
{******************************************************************************}
type
  TPESetDialogParentWindow = function (
    printJob     : Smallint;
    parentWindow : HWnd): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetDialogParentWindow (
    printJob     : Smallint;
    parentWindow : HWnd): Bool;

type
  TPEEnableProgressDialog = function (
    printJob : Smallint;
    enable   : Bool): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEEnableProgressDialog (
    printJob : Smallint;
    enable   : Bool): Bool;

{******************************************************************************}
{ Controlling Parameter Field Prompting Dialog                                 }
{   Set boolean to indicate whether CRPE is allowed to prompt                  }
{   for parameter values during printing.                                      }
{******************************************************************************}
type
  TPEGetAllowPromptDialog = function (printJob: Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetAllowPromptDialog (printJob : Smallint): Bool;

type
  TPESetAllowPromptDialog = function (
    printJob         : Smallint;
    showPromptDialog : Bool): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetAllowPromptDialog (
    printJob         : Smallint;
    showPromptDialog : Bool): Bool;

{******************************************************************************}
{ Print Date                                                                   }
{******************************************************************************}
type
  TPEGetPrintDate = function (
    printJob  : Smallint;
    var year  : Smallint;
    var month : Smallint;
    var day   : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetPrintDate (
    printJob  : Smallint;
    var year  : Smallint;
    var month : Smallint;
    var day   : Smallint): Bool;

type
  TPESetPrintDate = function (
    printJob : Smallint;
    year     : Smallint;
    month    : Smallint;
    day      : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetPrintDate (
    printJob : Smallint;
    year     : Smallint;
    month    : Smallint;
    day      : Smallint): Bool;

{******************************************************************************}
{ Encoding and Decoding Section Codes                                          }
{******************************************************************************}
{ Section constants }
{ For use with PE_SECTION_CODE, PE_SECTION_TYPE,
  PE_GROUP_N and PE_SECTION_N functions }
const
  PE_SECT_REPORT_HEADER = 1;
  PE_SECT_PAGE_HEADER   = 2;
  PE_SECT_GROUP_HEADER  = 3;
  PE_SECT_DETAIL        = 4;
  PE_SECT_GROUP_FOOTER  = 5;
  PE_SECT_PAGE_FOOTER   = 7;
  PE_SECT_REPORT_FOOTER = 8;

{ The old section constants with comment showing them in terms of the new: }
{ Note that PE_GRANDTOTALSECTION and PE_SUMMARYSECTION both map }
{ to PE_SECT_REPORT_FOOTER. }
  PE_ALLSECTIONS       =    0;
  PE_HEADERSECTION     = 2000;  {PE_SECTION_CODE (PE_SECT_PAGE_HEADER, 0, 0)}
  PE_FOOTERSECTION     = 7000;  {PE_SECTION_CODE (PE_SECT_PAGE_FOOTER, 0, 0)}
  PE_TITLESECTION      = 1000;  {PE_SECTION_CODE (PE_SECT_REPORT_HEADER, 0, 0)}
  PE_SUMMARYSECTION    = 8000;  {PE_SECTION_CODE (PE_SECT_REPORT_FOOTER, 0, 0)}
  PE_GROUPHEADER       = 3000;  {PE_SECTION_CODE (PE_SECT_GROUP_HEADER, 0, 0)}
  PE_GROUPFOOTER       = 5000;  {PE_SECTION_CODE (PE_SECT_GROUP_FOOTER, 0, 0)}
  PE_DETAILSECTION     = 4000;  {PE_SECTION_CODE (PE_SECT_DETAIL, 0, 0)}
  PE_GRANDTOTALSECTION = PE_SUMMARYSECTION;

  { A function to create section codes: }
  { This representation allows up to 25 groups and 40 sections of a given }
  { type, although Crystal Reports itself has no such limitations. }
  function PE_SECTION_CODE (sectionType, groupN, sectionN : Smallint): Smallint;

  { Functions to decode section and area codes: }
  function PE_SECTION_TYPE (sectionCode : Smallint): Smallint;
  function PE_GROUP_N (sectionCode : Smallint): Smallint;
  function PE_SECTION_N (sectionCode : Smallint): Smallint;
  function PE_AREA_CODE (sectionType, groupN : Smallint): Smallint;

{******************************************************************************}
{ Group Conditions (i.e. group breaks)                                         }
{******************************************************************************}
const
  PE_SF_MAX_NAME_LENGTH = 50;

  {Sort Direction}
  PE_SF_DESCENDING   = 0;
  PE_SF_ASCENDING    = 1;
  PE_SF_ORIGINAL     = 2;  {only for group condition}
  PE_SF_SPECIFIED    = 3;  {only for group condition}

{ for PEGetGroupCondition, condition encodes both }
{ the condition and the type of the condition field }
  PE_GC_CONDITIONMASK = $00FF;
  PE_GC_TYPEMASK      = $0F00;
  {Condition Type}
  PE_GC_TYPEOTHER     = $0000;
  PE_GC_TYPEDATE      = $0200;
  PE_GC_TYPEBOOLEAN   = $0400;
  PE_GC_TYPETIME      = $0800;

  { use PE_ANYCHANGE for all field types except Date }
  PE_GC_ANYCHANGE    = 0;
  { use these constants for Date fields }
  PE_GC_DAILY        = 0;
  PE_GC_WEEKLY       = 1;
  PE_GC_BIWEEKLY     = 2;
  PE_GC_SEMIMONTHLY  = 3;
  PE_GC_MONTHLY      = 4;
  PE_GC_QUARTERLY    = 5;
  PE_GC_SEMIANNUALLY = 6;
  PE_GC_ANNUALLY     = 7;
  { use these constants for Time  and DateTime fields }
  PE_GC_BYSECOND     =  8;
  PE_GC_BYMINUTE     =  9;
  PE_GC_BYHOUR       = 10;
  PE_GC_BYAMPM       = 11;
  { use these constants for Boolean fields }
  PE_GC_TOYES        = 1;
  PE_GC_TONO         = 2;
  PE_GC_EVERYYES     = 3;
  PE_GC_EVERYNO      = 4;
  PE_GC_NEXTISYES    = 5;
  PE_GC_NEXTISNO     = 6;

type
  TPEGetNGroups = function (printJob : Smallint) : Smallint; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNGroups (printJob : Smallint): Smallint;

type
  TPEGetGroupCondition = function (
    printJob                 : Smallint;
    sectionCode              : Smallint;
    var conditionFieldHandle : Hwnd;
    var conditionFieldLength : Smallint;
    var condition            : Smallint;
    var sortDirection        : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetGroupCondition (
    printJob                 : Smallint;
    sectionCode              : Smallint;
    var conditionFieldHandle : Hwnd;
    var conditionFieldLength : Smallint;
    var condition            : Smallint;
    var sortDirection        : Smallint): Bool;

type
  TPESetGroupCondition = function (
    printJob       : Smallint;
    sectionCode    : Smallint;
    conditionField : PChar;
    condition      : Smallint; {a PE_GC_ constant}
    sortDirection  : Smallint  {a PE_SF_ constant}): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetGroupCondition (
    printJob       : Smallint;
    sectionCode    : Smallint;
    conditionField : PChar;
    condition      : Smallint; {a PE_GC_ constant}
    sortDirection  : Smallint  {a PE_SF_ constant}): Bool;

const
  PE_FIELD_NAME_LEN             = 512;
  {TopN/BottomN Groups}
  PE_GO_TBN_ALL_GROUPS_UNSORTED = 0;
  PE_GO_TBN_ALL_GROUPS_SORTED   = 1;
  PE_GO_TBN_TOP_N_GROUPS        = 2;
  PE_GO_TBN_BOTTOM_N_GROUPS     = 3;

type
  PEFieldNameType = array[0..PE_FIELD_NAME_LEN-1] of Char;

  PEGroupOptions = record
    structSize:                Word;
    (* when setting, pass a PE_GC_ constant, or PE_UNCHANGED for no change.
       when getting, use PE_GC_TYPEMASK and PE_GC_CONDITIONMASK to
       decode the condition.*)
    condition                 : Smallint;  {a PE_GC_ constant, or PE_UNCHANGED for no change.}
    FieldName                 : PEFieldNameType; { formula form, or empty for no change.}
    sortDirection             : Smallint;  { a PE_SF_ const, or PE_UNCHANGED for no change.}
    repeatGroupHeader         : Smallint;  { BOOL value, or PE_UNCHANGED for no change.}
    keepGroupTogether         : Smallint;  { BOOL value, or PE_UNCHANGED for no change.}
    topOrBottomNGroups        : Smallint;  { a PE_GO_TBN_ constant, or PE_UNCHANGED for no change.}
    topOrBottomNSortFieldName : PEFieldNameType; { formula form, or empty for no change.}
    nTopOrBottomGroups        : Smallint;  { the number of groups to keep,
                                             0 for all, or PE_UNCHANGED for no change.}
    discardOtherGroups        : Smallint;  { BOOL value, or PE_UNCHANGED for no change.}
  end;

const
  PE_SIZEOF_GROUP_OPTIONS = SizeOf(PEGroupOptions);

type
  TPEGetGroupOptions = function (
    printJob         : Smallint;
    groupN           : Smallint;
    var groupOptions : PEGroupOptions): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetGroupOptions (
    printJob         : Smallint;
    groupN           : Smallint;
    var groupOptions : PEGroupOptions): Bool;

type
  TPESetGroupOptions = function (
    printJob         : Smallint;
    groupN           : Smallint;
    var groupOptions : PEGroupOptions): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetGroupOptions (
    printJob         : Smallint;
    groupN           : Smallint;
    var groupOptions : PEGroupOptions): Bool;

{******************************************************************************}
{ Getting Number of Sections and Section Code                                  }
{******************************************************************************}
type
  TPEGetNSections = function (printJob: Smallint): Smallint; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNSections (printJob: Smallint): Smallint;

type
  TPEGetSectionCode = function (
    printJob : Smallint;
    nSection : Smallint): Smallint; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetSectionCode (
    printJob : Smallint;
    sectionN : Smallint): Smallint;

{******************************************************************************}
{ Section Height                                                               }
{   The PEGetMinimumSectionHeight/PESetMinimumSectionHeight API Calls          }
{   are obsolete (7.0+), please use PEGetSectionHeight/PESetSectionHeight      }
{   instead. The obsolete API calls will still work in older applications      }
{   but please use the NEW calls for all new Development.                      }
{   NOTE: Height or minimumHeight are in twips                                 }
{******************************************************************************}
type
  TPEGetMinimumSectionHeight = function (
    printJob          : Smallint;
    sectionCode       : Smallint;
    var minimumHeight : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetMinimumSectionHeight (
    printJob          : Smallint;
    sectionCode       : Smallint;
    var minimumHeight : Smallint): Bool;

type
  TPESetMinimumSectionHeight = function (
    printJob : Smallint;
    sectionCode : smallint;
    minimumHeight : smallint) : Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetMinimumSectionHeight (
    printJob : Smallint;
    sectionCode : smallint;
    minimumHeight : smallint) : Bool;

type
  TPEGetSectionHeight = function (
    printJob    : Smallint;
    sectionCode : Smallint;
    var Height  : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetSectionHeight (
    printJob :		Smallint;
    sectionCode : 	Smallint;
    var Height :	Smallint): Bool;

type
  TPESetSectionHeight = function (
    printJob    : Smallint;
    sectionCode : Smallint;
    Height      : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetSectionHeight (
    printJob    : Smallint;
    sectionCode : Smallint;
    Height      : Smallint): Bool;

{******************************************************************************}
{ Section or Area Format                                                       }
{******************************************************************************}
type
  PESectionOptions = record
    (*Initialize to PE_SIZEOF_SECTION_OPTIONS*)
    structSize           : Word;
    Visible              : Smallint; { BOOLEAN values, except use PE_UNCHANGED }
    newPageBefore        : Smallint; {  to preserve the existing settings      }
    newPageAfter         : Smallint;
    keepTogether         : Smallint;
    suppressBlankSection : Smallint;
    resetPageNAfter      : Smallint;
    printAtBottomOfPage  : Smallint;
    backgroundColor      : DWord;    { Use PE_UNCHANGED_COLOR to keep existing color }
                                     {  - also could be defined as COLORREF    }
    underlaySection      : Smallint; { BOOLEAN values, except use PE_UNCHANGED }
    showArea             : Smallint; {  to preserve the existing settings      }
    freeFormPlacement    : Smallint;
  end;

const
  PE_SIZEOF_SECTION_OPTIONS = SizeOf(PESectionOptions);

type
  TPEGetSectionFormat = function (
    printJob    : Smallint;
    sectionCode : Smallint;
    var options : PESectionOptions): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetSectionFormat (
    printJob    : Smallint;
    sectionCode : Smallint;
    var options : PESectionOptions): Bool;

type
  TPESetSectionFormat = function (
    printJob    : Smallint;
    sectionCode : Smallint;
    var options : PESectionOptions): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetSectionFormat (
    printJob    : Smallint;
    sectionCode : Smallint;
    var options : PESectionOptions): Bool;

type
  TPEGetAreaFormat = function (
    printJob    : Smallint;
    sectionCode : Smallint;
    var options : PESectionOptions): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetAreaFormat (
    printJob    : Smallint;
    areaCode    : Smallint;
    var options : PESectionOptions): Bool;

type
  TPESetAreaFormat = function (
    printJob    : Smallint;
    sectionCode : Smallint;
    var options : PESectionOptions): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetAreaFormat (
    printJob    : Smallint;
    areaCode    : Smallint;
    var options : PESectionOptions): Bool;

{******************************************************************************}
{ Setting Font info                                                            }
{******************************************************************************}
const
  PE_FIELDS : Smallint = $0001;
  PE_TEXT   : Smallint = $0002;

type
  TPESetFont = function (
    printJob     : Smallint;
    sectionCode  : Smallint;
    scopeCode    : smallint;
    faceName     : PChar;
    fontFamily   : Smallint;
    fontPitch    : Smallint;
    charSet      : Smallint;
    pointSize    : Smallint;
    isItalic     : Smallint;
    isUnderlined : Smallint;
    isStruckOut  : Smallint;
    weight       : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetFont (
    printJob     : Smallint;
    sectionCode  : Smallint;
    scopeCode    : smallint;
    faceName     : PChar;    { 0 for no change               }
    fontFamily   : Smallint; { FF_DONTCARE for no change     }
    fontPitch    : Smallint; { DEFAULT_PITCH for no change   }
    charSet      : Smallint; { DEFAULT_CHARSET for no change }
    pointSize    : Smallint; { 0 for no change               }
    isItalic     : Smallint; { PE_UNCHANGED for no change    }
    isUnderlined : Smallint; { PE_UNCHANGED for no change    }
    isStruckOut  : Smallint; { PE_UNCHANGED for no change    }
    weight       : Smallint  { 0 for no change }): Bool;

{******************************************************************************}
{ Graphing                                                                     }
{******************************************************************************}
{------------------------------------------------------------------------------}
{ Graph Type for SCR 5 & 6                                                     }
{------------------------------------------------------------------------------}
const
  PE_SIDE_BY_SIDE_BAR_GRAPH            =    0;
  PE_STACKED_BAR_GRAPH                 =    2;
  PE_PERCENT_BAR_GRAPH                 =    3;
  PE_FAKED_3D_SIDE_BY_SIDE_BAR_GRAPH   =    4;
  PE_FAKED_3D_STACKED_BAR_GRAPH        =    5;
  PE_FAKED_3D_PERCENT_BAR_GRAPH        =    6;
  PE_PIE_GRAPH                         =   40;
  PE_MULTIPLE_PIE_GRAPH                =   42;
  PE_PROPORTIONAL_MULTI_PIE_GRAPH      =   43;
  PE_LINE_GRAPH                        =   80;
  PE_AREA_GRAPH                        =  120;
  PE_THREED_BAR_GRAPH                  =  160;
  PE_USER_DEFINED_GRAPH                =  500;
  PE_UNKNOWN_TYPE_GRAPH                = 1000;

type
  TPEGetGraphType = function (
    printJob       : Smallint;
    sectionCode    : Smallint;
    graphN         : Smallint;
    var graphType  : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetGraphType (
    printJob       : Smallint;
    sectionCode    : Smallint;
    graphN         : Smallint;
    var graphType  : Smallint): Bool;

type
  TPESetGraphType = function (
    printJob      : Smallint;
    sectionCode   : Smallint;
    graphN        : Smallint;
    var graphType : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetGraphType (
    printJob      : Smallint;
    sectionCode   : Smallint;
    graphN        : Smallint;
    var graphType : Smallint): Bool;

{------------------------------------------------------------------------------}
{ Graph Type for SCR 7+                                                        }
{------------------------------------------------------------------------------}
const
  { SCR 7+ Graph Types }
  PE_GT_BARCHART           =   0;
  PE_GT_LINECHART          =   1;
  PE_GT_AREACHART          =   2;
  PE_GT_PIECHART           =   3;
  PE_GT_DOUGHNUTCHART      =   4;
  PE_GT_THREEDRISERCHART   =   5;
  PE_GT_THREEDSURFACECHART =   6;
  PE_GT_SCATTERCHART       =   7;
  PE_GT_RADARCHART         =   8;
  PE_GT_BUBBLECHART        =   9;
  PE_GT_STOCKCHART         =  10;
  { These next two are for PEGetGraphTypeInfo only }
  { Do not use in PESetGraphTypeInfo }
  PE_GT_USERDEFINEDCHART   =  50;
  PE_GT_UNKNOWNTYPECHART   = 100;

  { Graph Subtype }
  { Bar charts }
  PE_GST_SIDEBYSIDEBARCHART                =    0;
  PE_GST_STACKEDBARCHART                   =    1;
  PE_GST_PERCENTBARCHART                   =    2;
  PE_GST_FAKED3DSIDEBYSIDEBARCHART         =    3;
  PE_GST_FAKED3DSTACKEDBARCHART            =    4;
  PE_GST_FAKED3DPERCENTBARCHART            =    5;

  { Line charts }
  PE_GST_REGULARLINECHART                  =   10;
  PE_GST_STACKEDLINECHART                  =   11;
  PE_GST_PERCENTAGELINECHART               =   12;
  PE_GST_LINECHARTWITHMARKERS              =   13;
  PE_GST_STACKEDLINECHARTWITHMARKERS       =   14;
  PE_GST_PERCENTAGELINECHARTWITHMARKERS    =   15;

  { Area charts }
  PE_GST_ABSOLUTEAREACHART                 =   20;
  PE_GST_STACKEDAREACHART                  =   21;
  PE_GST_PERCENTAREACHART                  =   22;
  PE_GST_FAKED3DABSOLUTEAREACHART          =   23;
  PE_GST_FAKED3DSTACKEDAREACHART           =   24;
  PE_GST_FAKED3DPERCENTAREACHART           =   25;

  { Pie charts }
  PE_GST_REGULARPIECHART                   =   30;
  PE_GST_FAKED3DREGULARPIECHART            =   31;
  PE_GST_MULTIPLEPIECHART                  =   32;
  PE_GST_MULTIPLEPROPORTIONALPIECHART      =   33;

  { Doughnut charts }
  PE_GST_REGULARDOUGHNUTCHART              =   40;
  PE_GST_MULTIPLEDOUGHNUTCHART             =   41;
  PE_GST_MULTIPLEPROPORTIONALDOUGHNUTCHART =   42;

  { 3D Riser charts }
  PE_GST_THREEDREGULARCHART                =   50;
  PE_GST_THREEDPYRAMIDCHART                =   51;
  PE_GST_THREEDOCTAGONCHART                =   52;
  PE_GST_THREEDCUTCORNERSCHART             =   53;

  { 3D surface charts }
  PE_GST_THREEDSURFACEREGULARCHART         =   60;
  PE_GST_THREEDSURFACEWITHSIDESCHART       =   61;
  PE_GST_THREEDSURFACEHONEYCOMBCHART       =   62;

  { Scatter charts }
  PE_GST_XYSCATTERCHART                    =   70;
  PE_GST_XYSCATTERDUALAXISCHART            =   71;
  PE_GST_XYSCATTERWITHLABELSCHART          =   72;
  PE_GST_XYSCATTERDUALAXISWITHLABELSCHART  =   73;

  { Radar charts }
  PE_GST_REGULARRADARCHART                 =   80;
  PE_GST_STACKEDRADARCHART                 =   81;
  PE_GST_RADARDUALAXISCHART                =   82;

  { Bubble charts }
  PE_GST_REGULARBUBBLECHART                =   90;
  PE_GST_DUALAXISBUBBLECHART               =   91;

  { Stocked charts }
  PE_GST_HIGHLOWCHART                      =  100;
  PE_GST_HIGHLOWDUALAXISCHART              =  101;
  PE_GST_HIGHLOWOPENCHART                  =  102;
  PE_GST_HIGHLOWOPENDUALAXISCHART          =  103;
  PE_GST_HIGHLOWOPENCLOSECHART             =  104;
  PE_GST_HIGHLOWOPENCLOSEDUALAXISCHART     =  105;

  PE_GST_UNKNOWNSUBTYPECHART               = 1000;

type
  PEGraphTypeInfo = record
    structSize   : Word;
    graphType    : Smallint; { PE_GT_*, PE_UNCHANGED for no change }
    graphSubtype : Smallint; { PE_GST_*, PE_UNCHANGED for no change }
  end;

const
 PE_SIZEOF_GRAPH_TYPE_INFO = SizeOf(PEGraphTypeInfo);

type
  TPEGetGraphTypeInfo = function (
    printJob          : Smallint;
    sectionN          : Smallint;
    graphN            : Smallint;
    var graphTypeInfo : PEGraphTypeInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetGraphTypeInfo (
    printJob          : Smallint;
    sectionN          : Smallint;
    graphN            : Smallint;
    var graphTypeInfo : PEGraphTypeInfo): Bool;

type
  TPESetGraphTypeInfo = function (
    printJob          : Smallint;
    sectionN          : Smallint;
    graphN            : Smallint;
    var graphTypeInfo : PEGraphTypeInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetGraphTypeInfo (
    printJob          : Smallint;
    sectionN          : Smallint;
    graphN            : Smallint;
    var graphTypeInfo : PEGraphTypeInfo): Bool;

{------------------------------------------------------------------------------}
{ Graph Text for SCR 5 & 6                                                     }
{------------------------------------------------------------------------------}
const
  { Graph text max length }
  PE_GRAPH_TEXT_LEN = 128;

type
  PEGraphTextType = array [0..PE_GRAPH_TEXT_LEN-1] of Char;
  PEGraphTextInfo = record
    structSize 	      : Word;
    graphTitle        : PEGraphTextType;
    graphSubTitle     : PEGraphTextType;
    graphFootNote     : PEGraphTextType;
    graphGroupsTitle  : PEGraphTextType;
    graphSeriesTitle  : PEGraphTextType;
    graphXAxisTitle   : PEGraphTextType;
    graphYAxisTitle   : PEGraphTextType;
    graphZAxisTitle   : PEGraphTextType;
  end;

  TPEGetGraphText = function (
    printJob          : Smallint;
    sectionCode       : Smallint;
    graphN            : Smallint;
    var graphTextInfo : PEGraphTextInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetGraphText (
    printJob          : Smallint;
    sectionCode       : Smallint;
    graphN            : Smallint;
    var graphTextInfo : PEGraphTextInfo): Bool;

type
  TPESetGraphText = function (
    printJob          : Smallint;
    sectionCode       : Smallint;
    graphN            : Smallint;
    var graphTextInfo : PEGraphTextInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetGraphText (
    printJob          : Smallint;
    sectionCode       : Smallint;
    graphN            : Smallint;
    var graphTextInfo : PEGraphTextInfo): Bool;

{------------------------------------------------------------------------------}
{ Graph Text for SCR 7+                                                        }
{------------------------------------------------------------------------------}
const
  PE_GTT_TITLE           = 0;
  PE_GTT_SUBTITLE        = 1;
  PE_GTT_FOOTNOTE        = 2;
  PE_GTT_SERIESTITLE     = 3;
  PE_GTT_GROUPSTITLE     = 4;
  PE_GTT_XAXISTITLE      = 5;
  PE_GTT_YAXISTITLE      = 6;
  PE_GTT_ZAXISTITLE      = 7;

type
  TPEGetGraphTextInfo = function (
    printJob        : Smallint;
    sectionN        : Smallint;
    graphN          : Smallint;
    titleType       : Word;     { PE_GTT_ constant }
    var title       : Hwnd;
    var titleLength : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetGraphTextInfo (
    printJob        : Smallint;
    sectionN        : Smallint;
    graphN          : Smallint;
    titleType       : Word;     { PE_GTT_ constant }
    var title       : Hwnd;
    var titleLength : Smallint): Bool;

type
  TPESetGraphTextInfo = function(
    printJob  : Smallint;
    sectionN  : Smallint;
    graphN    : Smallint;
    titleType : Word;     { PE_GTT_ constant }
    title     : PChar): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetGraphTextInfo (
    printJob  : Smallint;
    sectionN  : Smallint;
    graphN    : Smallint;
    titleType : Word;     { PE_GTT_ constant }
    title     : PChar): Bool;

{------------------------------------------------------------------------------}
{ Graph Font                                                                   }
{------------------------------------------------------------------------------}
const
  PE_GTF_TITLEFONT       = 0;
  PE_GTF_SUBTITLEFONT    = 1;
  PE_GTF_FOOTNOTEFONT    = 2;
  PE_GTF_GROUPSTITLEFONT = 3;
  PE_GTF_DATATITLEFONT   = 4;
  PE_GTF_LEGENDFONT      = 5;
  PE_GTF_GROUPLABELSFONT = 6;
  PE_GTF_DATALABELSFONT  = 7;

  PE_FACE_NAME_LEN       = 64;

type
  PEFaceNameType = array [0..PE_FACE_NAME_LEN-1] of Char;
  PEFontColorInfo = record
    structSize   : Word;
    faceName     : PEFaceNameType; { empty string for no change }
    fontFamily   : Smallint; { FF_DONTCARE for no change }
    fontPitch    : Smallint; { DEFAULT_PITCH for no change }
    charSet      : Smallint; { DEFAULT_CHARSET for no change }
    pointSize    : Smallint; { 0 for no change }
    isItalic     : Smallint; { BOOL value, except use PE_UNCHANGED for no change }
    isUnderlined : Smallint; { BOOL value, except use PE_UNCHANGED for no change }
    isStruckOut  : Smallint; { BOOL value, except use PE_UNCHANGED for no change }
    weight       : Smallint; { 0 for no change }
    color        : COLORREF; { PE_UNCHANGED_COLOR for no change }
  end;

const
  PE_SIZEOF_FONT_COLOR_INFO = SizeOf(PEFontColorInfo);

type
  TPEGetGraphFontInfo = function (
    printJob           : Smallint;
    sectionN           : Smallint;
    graphN             : Smallint;
    titleFontType      : Word;  { PE_GTF_ constant }
    var fontColorInfo  : PEFontColorInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetGraphFontInfo (
    printJob           : Smallint;
    sectionN           : Smallint;
    graphN             : Smallint;
    titleFontType      : Word;  { PE_GTF_ constant }
    var fontColorInfo  : PEFontColorInfo): Bool;

type
  TPESetGraphFontInfo = function (
    printJob           : Smallint;
    sectionN           : Smallint;
    graphN             : Smallint;
    titleFontType      : Word; { PE_GTF_ constant }
    var fontColorInfo  : PEFontColorInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetGraphFontInfo (
    printJob           : Smallint;
    sectionN           : Smallint;
    graphN             : Smallint;
    titleFontType      : Word; { PE_GTF_ constant }
    var fontColorInfo  : PEFontColorInfo): Bool;

{------------------------------------------------------------------------------}
{ Graph Options for SCR 5 & 6                                                  }
{------------------------------------------------------------------------------}
type
  PEGraphOptions = record
    structSize    : Word;
    graphMaxValue : Double;
    graphMinValue : Double;
    showDataValue : Bool;
    showGridLine  : Bool;
    verticalBars  : Bool;
    showLegend    : Bool;
    fontFaceName  : PEGraphTextType;
  end;

type
  TPEGetGraphOptions = function (
    printJob         : Smallint;
    sectionCode      : Smallint;
    graphN           : Smallint;
    var graphOptions : PEGraphOptions): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetGraphOptions (
    printJob         : Smallint;
    sectionCode      : Smallint;
    graphN           : Smallint;
    var graphOptions : PEGraphOptions): Bool;

type
  TPESetGraphOptions = function (
    printJob         : Smallint;
    sectionCode      : Smallint;
    graphN           : Smallint;
    var graphOptions : PEGraphOptions): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetGraphOptions (
    printJob         : Smallint;
    sectionCode      : Smallint;
    graphN           : Smallint;
    var graphOptions : PEGraphOptions): Bool;

{------------------------------------------------------------------------------}
{ Graph Options for SCR 7+                                                     }
{------------------------------------------------------------------------------}
const
  PE_GLP_PLACEUPPERRIGHT    =  0;
  PE_GLP_PLACEBOTTOMCENTER  =  1;
  PE_GLP_PLACETOPCENTER     =  2;
  PE_GLP_PLACERIGHT         =  3;
  PE_GLP_PLACELEFT          =  4;

  { Bar Sizes }
  PE_GBS_MINIMUMBARSIZE     =  0;
  PE_GBS_SMALLBARSIZE       =  1;
  PE_GBS_AVERAGEBARSIZE     =  2;
  PE_GBS_LARGEBARSIZE       =  3;
  PE_GBS_MAXIMUMBARSIZE     =  4;

  { Pie Sizes }
  PE_GPS_MINIMUMPIESIZE     = 64;
  PE_GPS_SMALLPIESIZE       = 48;
  PE_GPS_AVERAGEPIESIZE     = 32;
  PE_GPS_LARGEPIESIZE       = 16;
  PE_GPS_MAXIMUMPIESIZE     =  0;

  { Detached Pie Slice }
  PE_GDPS_NODETACHMENT      =  0;
  PE_GDPS_SMALLESTSLICE     =  1;
  PE_GDPS_LARGESTSLICE      =  2;

  { Marker Sizes }
  PE_GMS_SMALLMARKERS       =  0;
  PE_GMS_MEDIUMSMALLMARKERS =  1;
  PE_GMS_MEDIUMMARKERS      =  2;
  PE_GMS_MEDIUMLARGEMARKERS =  3;
  PE_GMS_LARGEMARKERS       =  4;

  { Marker shapes }
  PE_GMSP_RECTANGLESHAPE    =  1;
  PE_GMSP_CIRCLESHAPE       =  4;
  PE_GMSP_DIAMONDSHAPE      =  5;
  PE_GMSP_TRIANGLESHAPE     =  8;

  { Chart Color }
  PE_GCR_COLORCHART         =  0;
  PE_GCR_BLACKANDWHITECHART =  1;

  { Chart Data points }
  PE_GDP_NONE               =  0;
  PE_GDP_SHOWLABEL          =  1;
  PE_GDP_SHOWVALUE          =  2;

  { Number formats }
  PE_GNF_NODECIMAL          =  0;
  PE_GNF_ONEDECIMAL         =  1;
  PE_GNF_TWODECIMAL         =  2;
  PE_GNF_CURRENCYNODECIMAL  =  3;
  PE_GNF_CURRENCYTWODECIMAL =  4;
  PE_GNF_PERCENTNODECIMAL   =  5;
  PE_GNF_PERCENTONEDECIMAL  =  6;
  PE_GNF_PERCENTTWODECIMAL  =  7;

  { Viewing Angles }
  PE_GVA_STANDARDVIEW       =  1;
  PE_GVA_TALLVIEW           =  2;
  PE_GVA_TOPVIEW            =  3;
  PE_GVA_DISTORTEDVIEW      =  4;
  PE_GVA_SHORTVIEW          =  5;
  PE_GVA_GROUPEYEVIEW       =  6;
  PE_GVA_GROUPEMPHASISVIEW  =  7;
  PE_GVA_FEWSERIESVIEW      =  8;
  PE_GVA_FEWGROUPSVIEW      =  9;
  PE_GVA_DISTORTEDSTDVIEW   = 10;
  PE_GVA_THICKGROUPSVIEW    = 11;
  PE_GVA_SHORTERVIEW        = 12;
  PE_GVA_THICKSERIESVIEW    = 13;
  PE_GVA_THICKSTDVIEW       = 14;
  PE_GVA_BIRDSEYEVIEW       = 15;
  PE_GVA_MAXVIEW            = 16;

type
  PEGraphOptionInfo = record
    structSize       : Word;
    graphColor       : Smallint; { PE_GCR_*, PE_UNCHANGED for no change }
    showLegend       : Smallint; { BOOL, PE_UNCHANGED for no change }
    legendPosition   : Smallint; { PE_GLP_*, if showLegend == 0, means no legend }
    { Pie Charts and Doughut Charts }
    pieSize          : Smallint; { PE_GPS_*, PE_UNCHANGED for no change }
    detachedPieSlice : Smallint; { PE_GDPS_*, PE_UNCHANGED for no change }
    { Bar Chart }
    barSize          : Smallint; { PE_GBS_*, PE_UNCHANGED for no change }
    verticalBars     : Smallint; { BOOL, PE_UNCHANGED for no change }
    { Markers (used for line and bar charts) }
    markerSize       : Smallint; { PE_GMS_*, PE_UNCHANGED for no change }
    markerShape      : Smallint; { PE_GMSP_*, PE_UNCHANGED for no change }
    { Data Points }
    dataPoints       : Smallint; { PE_GDP_*, PE_UNCHANGED for no change }
    dataValueNumberFormat : Smallint; { PE_GNF_*, PE_UNCHANGED for no change }
    { 3D }
    viewingAngle     : Smallint; { PE_GVA_*, PE_UNCHANGED for no change }
  end;

const
  PE_SIZEOF_GRAPH_OPTION_INFO = SizeOf(PEGraphOptionInfo);

type
  TPEGetGraphOptionInfo = function (
    printJob            : Smallint;
    sectionN            : Smallint;
    graphN              : Smallint;
    var graphOptionInfo : PEGraphOptionInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetGraphOptionInfo (
    printJob            : Smallint;
    sectionN            : Smallint;
    graphN              : Smallint;
    var graphOptionInfo : PEGraphOptionInfo): Bool;

type
  TPESetGraphOptionInfo = function (
    printJob            : Smallint;
    sectionN            : Smallint;
    graphN              : Smallint;
    var graphOptionInfo : PEGraphOptionInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetGraphOptionInfo (
    printJob            : Smallint;
    sectionN            : Smallint;
    graphN              : Smallint;
    var graphOptionInfo : PEGraphOptionInfo): Bool;

{------------------------------------------------------------------------------}
{ Graph Data for SCR 5 & 6 (no equivalent in SCR7 yet...)                      }
{------------------------------------------------------------------------------}
const
  { Graph Directions }
  PE_GRAPH_ROWS_ONLY          = 0 ;
  PE_GRAPH_COLS_ONLY          = 1 ;
  PE_GRAPH_MIXED_ROW_COL      = 2 ;
  PE_GRAPH_MIXED_COL_ROW      = 3 ;
  PE_GRAPH_UNKNOWN_DIRECTION  = 20;
  { Graph constant for rowGroupN, colGroupN, summarizedFieldN in PEGraphDataInfo }
  PE_GRAPH_DATA_NULL_SELECTION  = -1;

type
  PEGraphDataInfo  = record
    structSize 	      : Word;
    rowGroupN         : Smallint;
    colGroupN         : Smallint;
    summarizedFieldN  : Smallint;
    graphDirection    : Smallint
  end;

  TPEGetGraphData = function (
    printJob          : Smallint;
    sectionCode       : Smallint;
    graphN            : Smallint;
    var graphDataInfo : PEGraphDataInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetGraphData (
    printJob          : Smallint;
    sectionCode       : Smallint;
    graphN            : Smallint;
    var graphDataInfo : PEGraphDataInfo): Bool;

type
  TPESetGraphData = function (
    printJob          : Smallint;
    sectionCode       : Smallint;
    graphN            : Smallint;
    var graphDataInfo : PEGraphDataInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetGraphData (
    printJob          : Smallint;
    sectionCode       : Smallint;
    graphN            : Smallint;
    var graphDataInfo : PEGraphDataInfo): Bool;

{------------------------------------------------------------------------------}
{ Graph Axes                                                                   }
{------------------------------------------------------------------------------}
const
  PE_GGT_NOGRIDLINES            =  0;
  PE_GGT_MINORGRIDLINES         =  1;
  PE_GGT_MAJORGRIDLINES         =  2;
  PE_GGT_MAJORANDMINORGRIDLINES =  3;
  PE_ADM_AUTOMATIC              =  0;
  PE_ADM_MANUAL                 =  1;

type
  PEGraphAxisInfo = record
    structSize         : Word;
    { Grid Lines }
    groupAxisGridLine  : Smallint; { PE_GGT_*, PE_UNCHANGED for no change }
    dataAxisYGridLine  : Smallint; { PE_GGT_*, PE_UNCHANGED for no change }
    dataAxisY2GridLine : Smallint; { PE_GGT_*, PE_UNCHANGED for no change }
    seriesAxisGridline : Smallint; { PE_GGT_*, PE_UNCHANGED for no change }
    { Min/Max Values }
    dataAxisYMinValue  : double;
    dataAxisYMaxValue  : double;
    dataAxisY2MinValue : double;
    dataAxisY2MaxValue : double;
    seriesAxisMinValue : double;
    seriesAxisMaxValue : double;
    { Number Format }
    dataAxisYNumberFormat  : Smallint; { PE_GNF_*, PE_UNCHANGED for no change }
    dataAxisY2NumberFormat : Smallint; { PE_GNF_*, PE_UNCHANGED for no change }
    seriesAxisNumberFormat : Smallint; { PE_GNF_*, PE_UNCHANGED for no change }
    { Auto Range }
    dataAxisYAutoRange  : Smallint; { BOOL, PE_UNCHANGED for no change }
    dataAxisY2AutoRange : Smallint; { BOOL, PE_UNCHANGED for no change }
    seriesAxisAutoRange : Smallint; { BOOL, PE_UNCHANGED for no change }
    { Automatic Division }
    dataAxisYAutomaticDivision  : Smallint; { PE_ADM_*, PE_UNCHANGED for no change }
    dataAxisY2AutomaticDivision : Smallint; { PE_ADM_*, PE_UNCHANED for no change }
    seriesAxisAutomaticDivision : Smallint; { PE_ADM_*, PE_UNCHANED for no change }
    { Manual Division }
    dataAxisYManualDivision  : Longint; { if dataAxisYAutomaticDivision is PE_ADM_AUTOMATIC, this field is ignored }
    dataAxisY2ManualDivision : Longint; { if dataAxisY2AutomaticDivision is PE_ADM_AUTOMATIC, this field is ignored }
    seriesAxisManualDivision : LongInt; { if seriesAxisAutomaticDivision is PE_ADM_AUTOMATIC, this field is ignored }
  end;

const
  PE_SIZEOF_GRAPH_AXIS_INFO = SizeOf(PEGraphAxisInfo);

type
  TPEGetGraphAxisInfo = function (
    printJob          : Smallint;
    sectionN          : Smallint;
    graphN            : Smallint;
    var graphAxisInfo : PEGraphAxisInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetGraphAxisInfo (
    printJob          : Smallint;
    sectionN          : Smallint;
    graphN            : Smallint;
    var graphAxisInfo : PEGraphAxisInfo): Bool;

type
  TPESetGraphAxisInfo = function (
    printJob          : Smallint;
    sectionN          : Smallint;
    graphN            : Smallint;
    var graphAxisInfo : PEGraphAxisInfo): Bool;{$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetGraphAxisInfo (
    printJob          : Smallint;
    sectionN          : Smallint;
    graphN            : Smallint;
    var graphAxisInfo : PEGraphAxisInfo): Bool;

{******************************************************************************}
{  Formulas, Selection Formulas and Group Selection Formulas                   }
{******************************************************************************}
{------------------------------------------------------------------------------}
{ Formulas                                                                     }
{------------------------------------------------------------------------------}
type
  TPEGetNFormulas = function (printJob : Smallint) : Smallint; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNFormulas (printJob : Smallint): Smallint;

type
  TPEGetNthFormula = function (
    printJob       : Smallint;
    formulaN       : Smallint;
    var nameHandle : Hwnd;
    var nameLength : Smallint;
    var textHandle : Hwnd;
    var textLength : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthFormula (
    printJob       : Smallint;
    formulaN       : Smallint;
    var nameHandle : Hwnd;
    var nameLength : Smallint;
    var textHandle : Hwnd;
    var textLength : Smallint): Bool;

type
  TPEGetFormula = function (
    printJob       : Smallint;
    formulaName    : PChar;
    var textHandle : HWnd;
    var textLength : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetFormula (
    printJob       : Smallint;
    formulaName    : PChar;
    var textHandle : HWnd;
    var textLength : Smallint): Bool;

type
  TPESetFormula = function (
    printJob      : Smallint;
    formulaName   : PChar;
    formulaString : PChar): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetFormula (
    printJob      : Smallint;
    formulaName   : PChar;
    formulaString : PChar): Bool;

type
  TPECheckFormula = function (
    printJob    : Smallint;
    formulaName : PChar): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PECheckFormula (
    printJob    : Smallint;
    formulaName : PChar): Bool;

{------------------------------------------------------------------------------}
{ Selection Formula                                                            }
{------------------------------------------------------------------------------}
type
  TPEGetSelectionFormula = function (
    printJob       : Smallint;
    var textHandle : HWnd;
    var textLength : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetSelectionFormula (
    printJob       : Smallint;
    var textHandle : HWnd;
    var textLength : Smallint): Bool;

type
  TPESetSelectionFormula = function (
    printJob      : Smallint;
    formulaString : PChar): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetSelectionFormula (
    printJob      : Smallint;
    formulaString : PChar): Bool;

type
  TPECheckSelectionFormula = function (printJob : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PECheckSelectionFormula (printJob : Smallint): Bool;

{------------------------------------------------------------------------------}
{ Group Selection Formula                                                      }
{------------------------------------------------------------------------------}
type
  TPEGetGroupSelectionFormula = function (
    printJob       : Smallint;
    var textHandle : HWnd;
    var textLength : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetGroupSelectionFormula (
    printJob       : Smallint;
    var textHandle : HWnd;
    var textLength : Smallint): Bool;

type
  TPESetGroupSelectionFormula = function (
    printJob      : Smallint;
    formulaString : PChar): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetGroupSelectionFormula (
    printJob      : Smallint;
    formulaString : PChar): Bool;

type
  TPECheckGroupSelectionFormula = function (printJob : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PECheckGroupSelectionFormula (printJob : Smallint): Bool;

{------------------------------------------------------------------------------}
{ Section Format Formulas                                                      }
{------------------------------------------------------------------------------}
const
  { Format formula name : Old naming convention }
  SECTION_VISIBILITY      = 58;
  NEW_PAGE_BEFORE         = 60;
  NEW_PAGE_AFTER          = 61;
  KEEP_SECTION_TOGETHER   = 62;
  SUPPRESS_BLANK_SECTION  = 63;
  RESET_PAGE_N_AFTER      = 64;
  PRINT_AT_BOTTOM_OF_PAGE = 65;
  UNDERLAY_SECTION        = 66;
  SECTION_BACK_COLOUR     = 67;
  { Format formula name : New naming convention}
  PE_FFN_AREASECTION_VISIBILITY  = 58;
  PE_FFN_SECTION_VISIBILITY      = 58;
  PE_FFN_SHOW_AREA               = 59;
  PE_FFN_NEW_PAGE_BEFORE         = 60;
  PE_FFN_NEW_PAGE_AFTER          = 61;
  PE_FFN_KEEP_SECTION_TOGETHER   = 62;
  PE_FFN_SUPPRESS_BLANK_SECTION  = 63;
  PE_FFN_RESET_PAGE_N_AFTER      = 64;
  PE_FFN_PRINT_AT_BOTTOM_OF_PAGE = 65;
  PE_FFN_UNDERLAY_SECTION        = 66;
  PE_FFN_SECTION_BACK_COLOUR     = 67;

type
  TPEGetSectionFormatFormula = function (
    printJob       : Smallint;
    sectionCode    : Smallint;
    formulaName    : Smallint;
    var textHandle : HWnd;
    var textLength : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetSectionFormatFormula (
    printJob       : Smallint;
    sectionCode    : Smallint;
    formulaName    : Smallint;
    var textHandle : HWnd;
    var textLength : Smallint): Bool;

type
  TPESetSectionFormatFormula = function (
    printJob      : Smallint;
    sectionCode   : Smallint;
    formulaName   : Smallint;
    formulaString : PChar): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetSectionFormatFormula (
    printJob      : Smallint;
    sectionCode   : Smallint;
    formulaName   : Smallint;
    formulaString : PChar): Bool;

{------------------------------------------------------------------------------}
{ Area Format Formulas                                                         }
{------------------------------------------------------------------------------}
type
  TPEGetAreaFormatFormula = function (
    printJob       : Smallint;
    areaCode       : Smallint;
    formulaName    : Smallint;
    var textHandle : HWnd;
    var textLength : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetAreaFormatFormula (
    printJob       : Smallint;
    areaCode       : Smallint;
    formulaName    : Smallint;
    var textHandle : HWnd;
    var textLength : Smallint): Bool;

type
  TPESetAreaFormatFormula = function (
    printJob      : Smallint;
    areaCode      : Smallint;
    formulaName   : Smallint;
    formulaString : PChar): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetAreaFormatFormula (
    printJob      : Smallint;
    areaCode      : Smallint;
    formulaName   : Smallint;
    formulaString : PChar): Bool;

{******************************************************************************}
{ SQL Expressions                                                              }
{******************************************************************************}
type
  TPEGetNSQLExpressions = function (printJob: Smallint): Smallint; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNSQLExpressions (printJob: Smallint): Smallint;

type
  TPEGetNthSQLExpression = function (
    printJob       : Smallint;
    expressionN    : Smallint;
    var nameHandle : Hwnd;
    var nameLength : Smallint;
    var textHandle : Hwnd;
    var textLength : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthSQLExpression (
    printJob       : Smallint;
    expressionN    : Smallint;
    var nameHandle : Hwnd;
    var nameLength : Smallint;
    var textHandle : Hwnd;
    var textLength : Smallint): Bool;

type
  TPEGetSQLExpression = function (
    printJob             : Smallint;
    const expressionName : PChar;
    var textHandle       : Hwnd;
    var textLength       : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetSQLExpression (
    printJob             : Smallint;
    const expressionName : PChar;
    var textHandle       : Hwnd;
    var textLength       : Smallint): Bool;

type
  TPESetSQLExpression = function (
    printJob               : Smallint;
    const expressionName   : PChar;
    const expressionString : PChar): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetSQLExpression (
    printJob               : Smallint;
    const expressionName   : PChar;
    const expressionString : PChar): Bool;

type
  TPECheckSQLExpression = function (
    printJob             : Smallint;
    const expressionName : PChar): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PECheckSQLExpression (
    printJob             : Smallint;
    const expressionName : PChar): Bool;

(********************************************************************************/
** NOTE : Stored Procedures
**   The previous Stored Procedure API Calls PEGetNParams, PEGetNthParam,
** PEGetNthParamInfo and PESetNthParam have been made obsolete.  Older
** applications that used these API Calls will still work as before, but for new
** development please use the new Parameter API calls below,
**   The Stored Procedure Parameters have now been unified with the Parameter
** Fields.
**
** The replacements for these calls are as follows :
**		PEGetNParams	  = PEGetNParameterFields
**		PEGetNthParam	  = PEGetNthParameterField
**		PEGetNthParamInfo = PEGetParameterValueInfo
**		PESetNthParam	  = PESetNthParameterField
**
** NOTE : To tell if a Parameter Field is a Stored Procedure, use the
**	  PEGetNthParameterType or PEGetNthParameterField API Calls
**
** If you wish to SET a parameter to NULL then set the CurrentValue to CRWNULL.
** The CRWNULL is of Type String and is independant of the datatype of the
** parameter.
*******************************************************************************)
const
  PE_PARAMETER_NAME_LEN  = 128;
  PE_PT_LONGVARCHAR      = -1;
  PE_PT_BINARY           = -2;
  PE_PT_VARBINARY        = -3;
  PE_PT_LONGVARBINARY    = -4;
  PE_PT_BIGINT           = -5;
  PE_PT_TINYINT          = -6;
  PE_PT_BIT              = -7;
  PE_PT_CHAR             = 1;
  PE_PT_NUMERIC          = 2;
  PE_PT_DECIMAL          = 3;
  PE_PT_INTEGER          = 4;
  PE_PT_SMALLINT         = 5;
  PE_PT_FLOAT            = 6;
  PE_PT_REAL             = 7;
  PE_PT_DOUBLE           = 8;
  PE_PT_DATE             = 9;
  PE_PT_TIME             = 10;
  PE_PT_TIMESTAMP        = 11;
  PE_PT_VARCHAR          = 12;

type
  PEProcParamNameType = array [0..PE_PARAMETER_NAME_LEN-1] of Char;
  PEParameterInfo = record
    structSize : Word;
    paramType  : smallint; {PE_PT constant}
    Name       : PEProcParamNameType;
  end;

type
  TPEGetNParams = function(printJob: Smallint) : Smallint; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNParams (printJob: Smallint) : Smallint;

type
  TPEGetNthParamInfo = function (
    printJob      : Smallint;
    paramN        : Smallint;
    var ParamInfo : PEParameterInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthParamInfo (
    printJob      : Smallint;
    paramN        : Smallint;
    var ParamInfo : PEParameterInfo): Bool;

type
  TPEGetNthParam = function (
    printJob       : Smallint;
    paramN         : Smallint;
    var textHandle : hWnd;
    var textLength : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthParam (
    printJob       : Smallint;
    paramN         : Smallint;
    var textHandle : hWnd;
    var textLength : Smallint): Bool;

type
  TPESetNthParam = function (
    printJob       : Smallint;
    paramN         : Smallint;
    szParamValue   : PChar): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetNthParam (
    printJob       : Smallint;
    paramN         : Smallint;
    szParamValue   : PChar): Bool;

{******************************************************************************}
{ Parameter Fields                                                             }
{******************************************************************************}
{------------------------------------------------------------------------------}
{ Getting/Setting Parameter Fields                                             }
{------------------------------------------------------------------------------}
const
  PE_PF_REPORT_NAME_LEN = 128;
  PE_PF_NAME_LEN        = 256;
  PE_PF_PROMPT_LEN      = 256;
  PE_PF_VALUE_LEN       = 256;
  PE_PF_EDITMASK_LEN    = 256;

  PE_PF_NUMBER     = 0;
  PE_PF_CURRENCY   = 1;
  PE_PF_BOOLEAN    = 2;
  PE_PF_DATE       = 3;
  PE_PF_STRING     = 4;
  PE_PF_DATETIME   = 5;
  PE_PF_TIME       = 6;
  PE_PF_INTEGER    = 7;
  PE_PF_COLOR      = 8;
  PE_PF_CHAR       = 9;
  PE_PF_LONG       = 10;
  PE_PF_NOVALUE    = 100;

type
  PEPFReportNameType   = array [0..PE_PF_REPORT_NAME_LEN-1] of Char;
  PEPFNameType         = array [0..PE_PF_NAME_LEN-1] of Char;
  PEPFPromptType       = array [0..PE_PF_PROMPT_LEN-1] of Char;
  PEPFValueType        = array [0..PE_PF_VALUE_LEN-1] of Char;
  PEPFEditMaskType     = array [0..PE_PF_EDITMASK_LEN-1] of Char;

  {Structure to use for SCR 5 & 6}
  PEParameterFieldInfo56 = record
    structSize        : Word;
    ValueType         : Word; {PE_PF_CONSTANT}
    DefaultValueSet   : Word;
    CurrentValueSet   : Word;
    Name 	      : PEPFNameType;
    Prompt 	      : PEPFPromptType;
    DefaultValue      : PEPFValueType;
    CurrentValue      : PEPFValueType;
    ReportName        : PEPFReportNameType;
    needsCurrentvalue : Word;
  end;

  {Structure to use for SCR 7+}
  PEParameterFieldInfo = record
    structSize        : Word; { Initialize to PE_SIZEOF_PARAMETER_FIELD_INFO }
    ValueType         : Word; { PE_PF_ constant }
    DefaultValueSet   : Word; { Indicate the default value is set in PEParameterFieldInfo }
    CurrentValueSet   : Word; { Indicate the current value is set in PEParameterFieldInfo }
    Name              : PEPFNameType;
    Prompt            : PEPFPromptType;
    { Next 2 Could be Number, Date, DateTime, Time, Boolean, or String }
    DefaultValue      : PEPFValueType;
    CurrentValue      : PEPFValueType;
    { Name of report where the field belongs, only used in PEGetNthParameterField }
    ReportName        : PEPFReportNameType;
    { Returns false (0) if parameter is linked, not in use, or has current value set }
    needsCurrentValue : Word;
    { For String values this will be TRUE if the string is limited on length, for }
    { other types it will be TRUE if the parameter is limited by a range }
    isLimited         : Word;
    { For string fields, these are the minimum/maximum length of the string }
    { For numeric fields, they are the minimum/maximum numeric value }
    MinSize           : Double;
    MaxSize           : Double;
    { An edit mask that restricts what may be entered for string parameters }
    EditMask          : PEPFEditMaskType;
    { Returns True if it is essbase sub var }
    isHidden          : Word;
  end;

const
  PE_SIZEOF_PARAMETER_FIELD_INFO = SizeOf(PEParameterFieldInfo);
  PE_SIZEOF_VARINFO_TYPE = SizeOf(PEParameterFieldInfo);

type
  TPEGetNParameterFields = function (printJob : Smallint): SmallInt; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNParameterFields (printJob: Smallint): Smallint;

type
  TPEGetNthParameterField = function (
    printJob          : Smallint;
    parameterN        : Smallint;
    var parameterInfo : PEParameterFieldInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthParameterField (
    printJob          : Smallint;
    parameterN        : Smallint;
    var parameterInfo : PEParameterFieldInfo): Bool;

type
  TPESetNthParameterField = function (
    printJob          : Smallint;
    parameterN        : Smallint;
    var parameterInfo : PEParameterFieldInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetNthParameterField (
    printJob          : Smallint;
    parameterN        : Smallint;
    var parameterInfo : PEParameterFieldInfo): Bool;

{------------------------------------------------------------------------------}
{ Converting Default/Current Value via PEValueInfo                             }
{------------------------------------------------------------------------------}
const
  { ValueInfo types }
  PE_VI_NUMBER      = 0;
  PE_VI_CURRENCY    = 1;
  PE_VI_BOOLEAN     = 2;
  PE_VI_DATE        = 3;
  PE_VI_STRING      = 4;
  PE_VI_DATETIME    = 5;
  PE_VI_TIME        = 6;
  PE_VI_INTEGER     = 7;
  PE_VI_COLOR       = 8;
  PE_VI_CHAR        = 9;
  PE_VI_LONG        = 10;
  PE_VI_NOVALUE    = 100;

  PE_VI_STRING_LEN        = 256;
  PE_VI_DATE_OR_TIME_LEN  =   3;
  PE_VI_DATETIME_LEN      =   6;

type
  PEVIStringType     = array[0..PE_VI_STRING_LEN-1] of Char;
  PEVIDateOrTimeType = array[0..PE_VI_DATE_OR_TIME_LEN-1] of Smallint;
  PEVIDateTimeType   = array[0..PE_VI_DATETIME_LEN-1] of Smallint;

  {Structure to use for SCR 5}
  PEValueInfo5 = record
    structSize :Word;
    valueType  :Word;  {a PE_PF_ constant}
    viNumber   :Double;
    viCurrency :Double;
    viBoolean  :BOOL;
    viString   :PEVIStringType;
    viDate     :PEVIDateOrTimeType; {year, month, day}
    viDateTime :PEVIDateTimeType;   {year, month, day, hour, minute, second}
    viTime     :PEVIDateOrTimeType; {hour, minute, second}
    viColor    :COLORREF;
    viInteger  :Smallint;
    viC        :Char;
  end;

  {Structure to use for SCR 6 & 7+}
  PEValueInfo = record
    structSize : Word;
    valueType  : Word;   {a PE_VI_ constant}
    viNumber   : Double;
    viCurrency : Double;
    viBoolean  : Bool;
    viString   : PEVIStringType;
    viDate     : PEVIDateOrTimeType; {year, month, day}
    viDateTime : PEVIDateTimeType;   {year, month, day, hour, minute, second}
    viTime     : PEVIDateOrTimeType; {hour, minute, second}
    viColor    : DWord;
    viInteger  : Smallint;
    viC        : Char;
    ignored    : Char; {for 4 byte alignment. ignored.}
    viLong     : DWord;
  end;

const
  PE_SIZEOF_VALUE_INFO = SizeOf(PEValueInfo);

type
  TPEConvertPFInfoToVInfo = function (
    value         : PChar;
    valueType     : Smallint;
    var valueInfo : PEValueInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEConvertPFInfoToVInfo (
    value         : PChar;
    valueType     : Smallint;
    var valueInfo : PEValueInfo): Bool;

type
  TPEConvertVInfoToPFInfo = function (
    var valueInfo : PEValueInfo;
    var valueType : Word;
    value         : PChar): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEConvertVInfoToPFInfo (
    var valueInfo : PEValueInfo;
    var valueType : Word;
    value         : PChar): Bool;

{------------------------------------------------------------------------------}
{ Getting/Setting multiple Default Values                                      }
{------------------------------------------------------------------------------}
type
  TPEGetNParameterDefaultValues = function (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar): Smallint; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNParameterDefaultValues (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar): Smallint;

type
  TPEGetNthParameterDefaultValue = function (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    index                    : Smallint;
    var valueInfo            : PEValueInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthParameterDefaultValue (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    index                    : Smallint;
    var valueInfo            : PEValueInfo): Bool;

type
  TPESetNthParameterDefaultValue = function (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    index                    : Smallint;
    var valueInfo            : PEValueInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetNthParameterDefaultValue (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    index                    : Smallint;
    var valueInfo            : PEValueInfo): Bool;

type
  TPEAddParameterDefaultValue = function (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    var valueInfo            : PEValueInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEAddParameterDefaultValue (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    var valueInfo            : PEValueInfo): Bool;

type
  TPEDeleteNthParameterDefaultValue = function (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    index                    : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEDeleteNthParameterDefaultValue (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    index                    : Smallint): Bool;

{------------------------------------------------------------------------------}
{ Min/Max Values for Parameter Fields                                          }
{------------------------------------------------------------------------------}
type
  TPEGetParameterMinMaxValue = function (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    var valueMin             : PEValueInfo;
    var valueMax             : PEValueInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetParameterMinMaxValue (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    var valueMin             : PEValueInfo;
    { Set to NULL to retrieve MAX only; must be non-NULL if valueMax is NULL }
    var valueMax             : PEValueInfo): Bool;
    { Set to NULL to retrieve MIN only; must be non-NULL if valueMin is NULL }

type
  TPESetParameterMinMaxValue = function (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    var valueMin             : PEValueInfo;
    var valueMax             : PEValueInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetParameterMinMaxValue (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    var valueMin             : PEValueInfo;
    { Set to NULL to retrieve MAX only; must be non-NULL if valueMax is NULL }
    var valueMax             : PEValueInfo): Bool;
    { Set to NULL to retrieve MIN only; must be non-NULL if valueMin is NULL }

    { If both valueInfo and valueMax are non-NULL then }
    { valueMin.valueType MUST BE THE SAME AS valueMax.valueType. }
    { If different, PE_ERR_INCONSISTANTTYPES is returned. }

{------------------------------------------------------------------------------}
{ Pick List Options in Parameter Fields                                        }
{------------------------------------------------------------------------------}
type
  TPEGetNthParameterValueDescription = function (
    printJob            : Smallint;
    parameterFieldName  : PChar;
    reportName          : PChar;
    index               : Smallint;
    var valueDesc       : HWnd;
    var valueDescLength : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthParameterValueDescription (
    printJob            : Smallint;
    parameterFieldName  : PChar;
    reportName          : PChar;
    index               : Smallint;
    var valueDesc       : HWnd;
    var valueDescLength : Smallint): Bool;

type
  TPESetNthParameterValueDescription = function (
    printJob            : Smallint;
    parameterFieldName  : PChar;
    reportName          : PChar;
    index               : Smallint;
    valueDesc           : PChar): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetNthParameterValueDescription (
    printJob            : Smallint;
    parameterFieldName  : PChar;
    reportName          : PChar;
    index               : Smallint;
    valueDesc           : PChar): Bool;

{ Constants for sortMethod in PEParameterPickListOption }
const
  PE_OR_NO_SORT                 = 0;
  PE_OR_ALPHANUMERIC_ASCENDING  = 1;
  PE_OR_ALPHANUMERIC_DESCENDING = 2;
  PE_OR_NUMERIC_ASCENDING       = 3;
  PE_OR_NUMERIC_DESCENDING      = 4;

type
  PEParameterPickListOption = record
    structSize      : Word;      { initialize to PE_SIZEOF_PICK_LIST_OPTION }
    showDescOnly    : Smallint;  { boolean value or PE_UNCHANGED }
    sortMethod      : Smallint;  { PE_OR value or PE_UNCHANGED }
    sortBasedOnDesc : Smallint;  { boolean value or PE_UNCHANGED }
  end;

const
  PE_SIZEOF_PICK_LIST_OPTION = SizeOf(PEParameterPickListOption);

type
  TPEGetParameterPickListOption = function (
    printJob           : Smallint;
    parameterFieldName : PChar;
    reportName         : PChar;
    var pickListOption : PEParameterPickListOption): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetParameterPickListOption (
    printJob           : Smallint;
    parameterFieldName : PChar;
    reportName         : PChar;
    var pickListOption : PEParameterPickListOption): Bool;

type
  TPESetParameterPickListOption = function (
    printJob           : Smallint;
    parameterFieldName : PChar;
    reportName         : PChar;
    var pickListOption : PEParameterPickListOption): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetParameterPickListOption (
    printJob           : Smallint;
    parameterFieldName : PChar;
    reportName         : PChar;
    var pickListOption : PEParameterPickListOption): Bool;

{------------------------------------------------------------------------------}
{ Parameter Value Info - extra options for Parameter Fields                    }
{------------------------------------------------------------------------------}
type
  PEParameterValueInfo = record
    structSize             : Word;
    isNullable             : Smallint; {Boolean value or PE_UNCHANGED for no change.}
    disallowEditing        : Smallint; {Boolean value or PE_UNCHANGED for no change.}
    allowMultipleValues    : Smallint; {Boolean value or PE_UNCHANGED for no change.}
    hasDiscreteValues      : Smallint; {Boolean value or PE_UNCHANGED for no change.}
                                       {True: has discrete values, False: has ranges}
    partOfGroup            : Smallint; {Boolean value or PE_UNCHANGED for no change.}
    groupNum               : Smallint; {a group number or PE_UNCHANGED for no change.}
    mutuallyExclusiveGroup : Smallint; {Boolean value or PE_UNCHANGED for no change.}
  end;

const
  PE_SIZEOF_PARAMETER_VALUE_INFO = SizeOf(PEParameterValueInfo);

type
  TPEGetParameterValueInfo = function (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    var valueInfo            : PEParameterValueInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetParameterValueInfo (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    var valueInfo            : PEParameterValueInfo): Bool;

type
  TPESetParameterValueInfo = function (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    var valueInfo            : PEParameterValueInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetParameterValueInfo (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    var valueInfo            : PEParameterValueInfo): Bool;

{------------------------------------------------------------------------------}
{ Getting/Setting multiple Current Values and Ranges                           }
{------------------------------------------------------------------------------}
const
  { Range Info }
  PE_RI_INCLUDEUPPERBOUND = 1;
  PE_RI_INCLUDELOWERBOUND = 2;
  PE_RI_NOUPPERBOUND      = 4;
  PE_RI_NOLOWERBOUND      = 8;

  PE_DR_HASRANGE            = 0;
  PE_DR_HASDISCRETE         = 1;
  PE_DR_HASDISCRETEANDRANGE = 2;

type
  TPEGetNParameterCurrentValues = function (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar): Smallint; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNParameterCurrentValues (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar): Smallint;

type
  TPEGetNthParameterCurrentValue = function (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    index                    : Smallint;
    var currentValue         : PEValueInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthParameterCurrentValue (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    index                    : Smallint;
    var currentValue         : PEValueInfo): Bool;

type
  TPEAddParameterCurrentValue = function (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    var currentValue         : PEValueInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEAddParameterCurrentValue (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    var currentValue         : PEValueInfo): Bool;

  {Ranges for Parameter Fields}
type
  TPEGetNParameterCurrentRanges = function (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar): Smallint; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNParameterCurrentRanges (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar): Smallint;

type
  TPEGetNthParameterCurrentRange = function (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    index                    : Smallint;
    var rangeStart           : PEValueInfo;
    var rangeEnd             : PEValueInfo;
    var rangeInfo            : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthParameterCurrentRange (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    index                    : Smallint;
    var rangeStart           : PEValueInfo;
    var rangeEnd             : PEValueInfo;
    var rangeInfo            : Smallint): Bool;

type
  TPEAddParameterCurrentRange = function (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    var rangeStart           : PEValueInfo;
    var rangeEnd             : PEValueInfo;
    rangeInfo                : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEAddParameterCurrentRange (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar;
    var rangeStart           : PEValueInfo;
    var rangeEnd             : PEValueInfo;
    rangeInfo                : Smallint): Bool;

type
  TPEClearParameterCurrentValuesAndRanges = function (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEClearParameterCurrentValuesAndRanges (
    printJob                 : Smallint;
    const parameterFieldName : PChar;
    const reportName         : PChar): Bool;

{------------------------------------------------------------------------------}
{ Parameter Field Type                                                         }
{------------------------------------------------------------------------------}
const
  { Parameter Field origin }
  PE_PO_REPORT     = 0;
  PE_PO_STOREDPROC = 1;
  PE_PO_QUERY      = 2;

type
  {returns PE_PO_* or -1 if index is invalid.}
  TPEGetNthParameterType = function (
    printJob : Smallint;
    index    : Smallint): Smallint; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthParameterType (
    printJob : Smallint;
    index    : Smallint): Smallint;

{******************************************************************************}
{ Record and Group SortFields                                                  }
{******************************************************************************}
{------------------------------------------------------------------------------}
{ SortFields                                                                   }
{------------------------------------------------------------------------------}
type
  TPEGetNSortFields = function(printJob: Smallint): Smallint; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNSortFields (printJob: Smallint): Smallint;

type
  TPEGetNthSortField = function(
    printJob       : Smallint;
    sortFieldN     : Smallint;
    var nameHandle : HWnd;
    var nameLength : Smallint;
    var direction  : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthSortField (
    printJob       : Smallint;
    sortFieldN     : Smallint;
    var nameHandle : HWnd;
    var nameLength : Smallint;
    var direction  : Smallint): Bool;

type
  TPESetNthSortField = function (
    printJob   : Smallint;
    sortFieldN : Smallint;
    Name       : PChar;
    direction  : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetNthSortField (
    printJob   : Smallint;
    sortFieldN : Smallint;
    Name       : PChar;
    direction  : Smallint): Bool;

type
  TPEDeleteNthSortField = function (
    printJob   : Smallint;
    sortFieldN : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEDeleteNthSortField (
    printJob   : Smallint;
    sortFieldN : Smallint): Bool;

{------------------------------------------------------------------------------}
{ GroupSortFields                                                              }
{------------------------------------------------------------------------------}
type
  TPEGetNGroupSortFields = function (printJob : Smallint): Smallint; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNGroupSortFields (printJob : Smallint): Smallint;

type
  TPEGetNthGroupSortField = function(
    printJob       : Smallint;
    sortFieldN     : Smallint;
    var nameHandle : HWnd;
    var nameLength : Smallint;
    var direction  : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthGroupSortField (
    printJob       : Smallint;
    sortFieldN     : Smallint;
    var nameHandle : HWnd;
    var nameLength : Smallint;
    var direction  : Smallint): Bool;

type
  TPESetNthGroupSortField = function (
    printJob   : Smallint;
    sortFieldN : Smallint;
    Name       : PChar;
    direction  : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetNthGroupSortField (
    printJob   : Smallint;
    sortFieldN : Smallint;
    Name       : PChar;
    direction  : Smallint): Bool;

type
  TPEDeleteNthGroupSortField = function (
    printJob   : Smallint;
    sortFieldN : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEDeleteNthGroupSortField (
    printJob   : Smallint;
    sortFieldN : Smallint): Bool;

{******************************************************************************}
{ Controlling Databases                                                        }
{   The following functions allow retrieving and updating database info        }
{   in an opened report, so that a report can be printed using different       }
{   session, server, database, user and/or table location settings.  Any       }
{   changes made to the report via these functions are not permanent, and      }
{   only last as long as the report is open.                                   }
{                                                                              }
{   The following database functions (except for PELogOnServer and             }
{   PELogOffServer) must be called after PEOpenPrintJob and before             }
{   PEStartPrintJob.                                                           }
{******************************************************************************}
{------------------------------------------------------------------------------}
{ Getting Number of Tables                                                     }
{   The function PEGetNTables is called to fetch the number of tables in       }
{   the report.  This includes all PC databases (e.g. Paradox, xBase)          }
{   as well as SQL databases (e.g. SQL Server, Oracle, Netware).               }
{------------------------------------------------------------------------------}
type
  TPEGetNTables = function (printJob: Smallint): Smallint; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNTables (printJob: Smallint): Smallint;

{------------------------------------------------------------------------------}
{ Getting Table Type                                                           }
{   The function PEGetNthTableType allows the application to determine the     }
{   type of each table.  The application can test DBType (equal to             }
{   PE_DT_STANDARD or PE_DT_SQL), or test the database DLL name used to        }
{   create the report.  DLL names have the following naming convention:        }
{       - PDB*.DLL for standard (non-SQL) databases,                           }
{       - PDS*.DLL for SQL databases.                                          }
{                                                                              }
{   In the case of ODBC (PDSODBC.DLL) the DescriptiveName includes the         }
{   ODBC data source name.                                                     }
{------------------------------------------------------------------------------}
const
  PE_DLL_NAME_LEN            =  64;
  PE_FULL_NAME_LEN           = 256;
  { DBType constants }
  PE_DT_STANDARD             = 1;
  PE_DT_SQL                  = 2;
  PE_DT_SQL_STORED_PROCEDURE = 3;

type
  PEDllNameType  = array [0..PE_DLL_NAME_LEN - 1] of Char;
  PEFullNameType = array [0..PE_FULL_NAME_LEN - 1] of Char;
  PETableType = record
    structSize      : Word; { Initialize to PE_SIZEOF_TABLE_TYPE }
    DLLName         : PEDllNameType;
    DescriptiveName : PEFullNameType;
    DBType          : Word;
  end;

const
  PE_SIZEOF_TABLE_TYPE = SizeOf(PETableType);

type
  TPEGetNthTableType = function (
    printJob      : Smallint;
    tableN        : Smallint;
    var tableType : PETableType): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthTableType (
    printJob      : Smallint;
    tableN        : Smallint;
    var tableType : PETableType): Bool;

{------------------------------------------------------------------------------}
{ Getting Table Session Info                                                   }
{   The functions PEGetNthTableSessionInfo and PESetNthTableSessionInfo        }
{   are only used when connecting to MS Access databases (which require a      }
{   session to be opened first)                                                }
{------------------------------------------------------------------------------}
const
  PE_SESS_USERID_LEN   = 128;
  PE_SESS_PASSWORD_LEN = 128;

type
  PESesPassType = array [0..PE_SESS_PASSWORD_LEN - 1] of Char;
  PESessionInfo = record
    structSize    : Word; { Initialize to PE_SIZEOF_SESSION_INFO }
    UserID        : PESesPassType;
    { Password is undefined when getting information from report. }
    Password      : PESesPassType;
    { SessionHandle is undefined when getting information from report. }
    { When setting information, if it is = 0 the UserID and Password }
    { settings are used, otherwise the SessionHandle is used. }
    SessionHandle : DWord;
  end;

const
  PE_SIZEOF_SESSION_INFO = SizeOf(PESessionInfo);

type
  TPEGetNthTableSessionInfo = function (
    printJob        : Smallint;
    tableN          : Smallint;
    var sessionInfo : PESessionInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthTableSessionInfo (
    printJob        : Smallint;
    tableN          : Smallint;
    var sessionInfo : PESessionInfo): Bool;

type
  TPESetNthTableSessionInfo = function (
    printJob              : Smallint;
    tableN                : Smallint;
    var sessionInfo       : PESessionInfo;
    propagateAcrossTables : Bool): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetNthTableSessionInfo (
    printJob              : Smallint;
    tableN                : Smallint;
    var sessionInfo       : PESessionInfo;
    propagateAcrossTables : Bool): Bool;

{------------------------------------------------------------------------------}
{ Table LogOn/LogOff                                                           }
{   Logging on is performed when printing the report, but the correct          }
{   log on information must first be set using PESetNthTableLogOnInfo.         }
{   Only the password is required, but the server, database, and               }
{   user names may optionally be overriden as well.                            }
{                                                                              }
{   If the parameter propagateAcrossTables is TRUE, the new log on info        }
{   is also applied to any other tables in this report that had the            }
{   same original server and database names as this table.  If FALSE           }
{   only this table is updated.                                                }
{                                                                              }
{   Logging off is performed automatically when the print job is closed.       }
{------------------------------------------------------------------------------}
const
  PE_SERVERNAME_LEN   = 128;
  PE_DATABASENAME_LEN = 128;
  PE_USERID_LEN       = 128;
  PE_PASSWORD_LEN     = 128;

type
  PELogonServerType = array [0..PE_SERVERNAME_LEN-1] of Char;
  PELogonDbType     = array [0..PE_DATABASENAME_LEN-1] of Char;
  PELogonUserType   = array [0..PE_USERID_LEN-1] of Char;
  PELogonPassType   = array [0..PE_PASSWORD_LEN-1] of Char;
  PELogOnInfo = record
    structSize   : Word; { Initialize to PE_SIZEOF_LOGON_INFO }
    (* For any of the following values an empty string ("") means to use
    ** the value already set in the report.  To override a value in the
    ** report use a non-empty string (e.g. "Server A").  All strings are
    ** null-terminated.
    **
    ** For Netware SQL, pass the dictionary path name in ServerName and
    ** data path name in DatabaseName. *)
    ServerName   : PELogonServerType;
    DatabaseName : PELogonDbType;
    UserId       : PELogonUserType;
    (* Password is undefined when getting information from report. *)
    Password     : PELogonPassType;
  end;

const
  PE_SIZEOF_LOGON_INFO = SizeOf(PELogOnInfo);

type
  TPEGetNthTableLogOnInfo = function (
    printJob      : Smallint;
    tableN        : Smallint;
    var logOnInfo : PELogOnInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthTableLogOnInfo (
    printJob      : Smallint;
    tableN        : Smallint;
    var logOnInfo : PELogOnInfo): Bool;

type
  TPESetNthTableLogOnInfo = function (
    printJob              : Smallint;
    tableN                : Smallint;
    var logOnInfo         : PELogOnInfo;
    propagateAcrossTables : Bool): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetNthTableLogOnInfo (
    printJob              : Smallint;
    tableN                : Smallint;
    var logOnInfo         : PELogOnInfo;
    propagateAcrossTables : Bool): Bool;

{------------------------------------------------------------------------------}
{ Table Location                                                               }
{   A table's location is fetched and set using PEGetNthTableLocation and      }
{   PESetNthTableLocation.  This name is database-dependent, and must be       }
{   formatted correctly for the expected database.  For example:               }
{       - Paradox: "c:\crw\ORDERS.DB"                                          }
{       - SQL Server: "publications.dbo.authors"                               }
{------------------------------------------------------------------------------}
const
  PE_TABLE_LOCATION_LEN    = 256;
  PE_CONNECTION_BUFFER_LEN = 512;

type
  PETableLocType = array [0..PE_TABLE_LOCATION_LEN-1] of Char;
  PEConnectBufferType = array [0..PE_CONNECTION_BUFFER_LEN-1] of Char;

  {Structure to use for SCR 5 & 6}
  PETableLocation56  = record
    structSize  : Word;
    Location    : PETableLocType;
  end;

  {Structure to use for SCR 7+}
  PETableLocation = record
    structSize    : Word; { Initialize to PE_SIZEOF_TABLE_LOCATION }
    Location      : PETableLocType;
    SubLocation   : PETableLocType; { For MS Access Table Names }
    ConnectBuffer : PEConnectBufferType;
  end;

const
  PE_SIZEOF_TABLE_LOCATION = SizeOf(PETableLocation);

type
  TPEGetNthTableLocation = function (
    printJob     : Smallint;
    tableN       : Smallint;
    var location : PETableLocation): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthTableLocation (
    printJob     : Smallint;
    tableN       : Smallint;
    var location : PETableLocation): Bool;

type
  TPESetNthTableLocation = function (
    printJob     : Smallint;
    tableN       : Smallint;
    var location : PETableLocation): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetNthTableLocation (
    printJob     : Smallint;
    tableN       : Smallint;
    var location : PETableLocation): Bool;

{------------------------------------------------------------------------------}
{ Table Private Info - for CDO, ADO, etc.                                      }
{------------------------------------------------------------------------------}
type
  crBytePointer = ^Byte;
  PETablePrivateInfo = record
    structSize : Word;  { initialize to PE_SIZEOF_TABLE_PRIVATE_INFO }
    nBytes     : Smallint;
    tag        : DWord;
    dataPtr    : Pointer; {crBytePointer}
  end;

const
  PE_SIZEOF_TABLE_PRIVATE_INFO = SizeOf(PETablePrivateInfo);

type
  TPEGetNthTablePrivateInfo = function (
    printJob        : Smallint;
    tableN          : Smallint;
    var privateInfo : PETablePrivateInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNthTablePrivateInfo (
    printJob        : Smallint;
    tableN          : Smallint;
    var privateInfo : PETablePrivateInfo): Bool;

type
  TPESetNthTablePrivateInfo = function (
    printJob        : Smallint;
    tableN          : Smallint;
    var privateInfo : PETablePrivateInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetNthTablePrivateInfo (
    printJob        : Smallint;
    tableN          : Smallint;
    var privateInfo : PETablePrivateInfo): Bool;

{------------------------------------------------------------------------------}
{ Test Connectivity                                                            }
{   The function PETestNthTableConnectivity tests whether a database           }
{   table's settings are valid and ready to be reported on.  It returns        }
{   true if the database session, log on, and location info is all             }
{   correct.                                                                   }
{                                                                              }
{   This is useful, for example, in prompting the user and testing a           }
{   server password before printing begins.                                    }
{                                                                              }
{   This function may require a significant amount of time to complete,        }
{   since it will first open a user session (if required), then log onto       }
{   the database server (if required), and then open the appropriate           }
{   database table (to test that it exists).  It does not read any data,       }
{   and closes the table immediately once successful.  Logging off is          }
{   performed when the print job is closed.                                    }
{                                                                              }
{   If it fails in any of these steps, the error code set indicates            }
{   which database info needs to be updated using functions above:             }
{      - If it is unable to begin a session, PE_ERR_DATABASESESSION is set,    }
{        and the application should update with PESetNthTableSessionInfo.      }
{      - If it is unable to log onto a server, PE_ERR_DATABASELOGON is set,    }
{        and the application should update with PESetNthTableLogOnInfo.        }
{      - If it is unable open the table, PE_ERR_DATABASELOCATION is set,       }
{        and the application should update with PESetNthTableLocation.         }
{------------------------------------------------------------------------------}
type
  TPETestNthTableConnectivity = function (
    printJob : Smallint;
    tableN   : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PETestNthTableConnectivity (
    printJob : Smallint;
    tableN   : Smallint): Bool;

{------------------------------------------------------------------------------}
{ Logging On/Off Server                                                        }
{   PELogOnServer and PELogOffServer can be called at any time to log on       }
{   and off of a database server.  These functions are not required if         }
{   function PESetNthTableLogOnInfo above was already used to set the          }
{   password for a table.                                                      }
{                                                                              }
{   These functions require a database DLL name, which can be retrieved        }
{   using PEGetNthTableType above.                                             }
{                                                                              }
{   This function can also be used for non-SQL tables, such as password-       }
{   protected Paradox tables.  Call this function to set the password          }
{   for the Paradox DLL before beginning printing.                             }
{                                                                              }
{   Note: When printing using PEStartPrintJob the ServerName passed in         }
{   PELogOnServer must agree exactly with the server name stored in the        }
{   report.  If this is not true use PESetNthTableLogOnInfo to perform         }
{   logging on instead.                                                        }
{------------------------------------------------------------------------------}
type
  TPELogOnServer = function (
    dllName       : PChar;
    var logOnInfo : PELogOnInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PELogOnServer (
    dllName       : PChar;
    var logOnInfo : PELogOnInfo): Bool;

type
  TPELogOffServer = function (
    dllName       : PChar;
    var logOnInfo : PELogOnInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PELogOffServer (
    dllName       : PChar;
    var logOnInfo : PELogOnInfo): Bool;

type
  TPELogOnSQLServerWithPrivateInfo = function (
    dllName     : PChar;
    privateInfo : Pointer): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PELogOnSQLServerWithPrivateInfo (
    dllName     : PChar;
    privateInfo : Pointer): Bool;

{------------------------------------------------------------------------------}
{ Verify Database                                                              }
{------------------------------------------------------------------------------}
type
  TPEVerifyDatabase = function (printJob: Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEVerifyDatabase (printJob : Smallint): Bool;

{------------------------------------------------------------------------------}
{ Check Table Differences                                                      }
{   - Not implemented for Reports based on Dictionaries:                       }
{     returns PE_ERR_NOTIMPLEMENTED                                            }
{------------------------------------------------------------------------------}
const
  { Constants returned from PECheckNthTableDifferences, }
  { can be any combination of the following: }
  PE_TCD_OKAY                     = $00000000;
  PE_TCD_DATABASENOTFOUND         = $00000001;
  PE_TCD_SERVERNOTFOUND           = $00000002;
  PE_TCD_SERVERNOTOPENED          = $00000004;
  PE_TCD_ALIASCHANGED             = $00000008;
  PE_TCD_INDEXESCHANGED           = $00000010;
  PE_TCD_DRIVERCHANGED            = $00000020;
  PE_TCD_DICTIONARYCHANGED        = $00000040;
  PE_TCD_FILETYPECHANGED          = $00000080;
  PE_TCD_RECORDSIZECHANGED        = $00000100;
  PE_TCD_ACCESSCHANGED            = $00000200;
  PE_TCD_PARAMETERSCHANGED        = $00000400;
  PE_TCD_LOCATIONCHANGED          = $00000800;
  PE_TCD_DATABASEOTHER            = $00001000;
  PE_TCD_NUMFIELDSCHANGED         = $00010000;
  PE_TCD_FIELDOTHER               = $00020000;
  PE_TCD_FIELDNAMECHANGED         = $00040000;
  PE_TCD_FIELDDESCCHANGED         = $00080000;
  PE_TCD_FIELDTYPECHANGED         = $00100000;
  PE_TCD_FIELDSIZECHANGED         = $00200000;
  PE_TCD_NATIVEFIELDTYPECHANGED   = $00400000;
  PE_TCD_NATIVEFIELDOFFSETCHANGED = $00800000;
  PE_TCD_NATIVEFIELDSIZECHANGED   = $01000000;
  PE_TCD_FIELDDECPLACESCHANGED    = $02000000;

type
  PETableDifferenceInfo = record
    structSize       : Word;
    tableDifferences : DWord; { any combination of PE_TCD_* }
    reserved1        : DWord; { reserved - do not use }
    reserved2        : DWord; { reserved - do not use }
  end;

const
  PE_SIZEOF_TABLE_DIFFERENCE_INFO = SizeOf(PETableDifferenceInfo);

type
  TPECheckNthTableDifferences = function (
    printJob                : Smallint;
    tableN                  : Smallint;
    var tableDifferenceInfo : PETableDifferenceInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PECheckNthTableDifferences (
    printJob                : Smallint;
    tableN                  : Smallint;
    var tableDifferenceInfo : PETableDifferenceInfo): Bool;

{******************************************************************************}
{ Overriding SQL Query in Report                                               }
{   PEGetSQLQuery () returns the same query as appears in the Show SQL Query   }
{   dialog in CRW, in syntax specific to the database driver you are using.    }
{                                                                              }
{   PESetSQLQuery () is mostly useful for reports with SQL queries that        }
{   were explicitly edited in the Show SQL Query dialog in CRW, i.e. those     }
{   reports that needed database-specific selection criteria or joins.         }
{   (Otherwise it is usually best to continue using function calls such as     }
{   PESetSelectionFormula () and let CRW build the SQL query automatically.    }
{                                                                              }
{   PESetSQLQuery () has the same restrictions as editing in the Show SQL      }
{   Query dialog; in particular that changes are accepted in the FROM and      }
{   WHERE clauses but ignored in the SELECT list of fields.                    }
{******************************************************************************}
type
  TPEGetSQLQuery = function (
    printJob       : Smallint;
    var textHandle : HWnd;
    var textLength : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetSQLQuery (
    printJob       : Smallint;
    var textHandle : HWnd;
    var textLength : Smallint): Bool;

type
  TPESetSQLQuery = function (
    printJob    : Smallint;
    queryString : PChar): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetSQLQuery (
    printJob    : Smallint;
    queryString : PChar): Bool;

{******************************************************************************}
{ Saved Data                                                                   }
{   Use PEHasSavedData() to find out if a report currently has saved data      }
{   associated with it.  This may or may not be TRUE when a print job is       }
{   first opened from a report file.  Since data is saved during a print,      }
{   this will always be TRUE immediately after a report is printed.            }
{                                                                              }
{   Use PEDiscardSavedData() to release the saved data associated with a       }
{   report.  The next time the report is printed, it will get current data     }
{   from the database.                                                         }
{                                                                              }
{   The default behavior is for a report to use its saved data, rather than    }
{   refresh its data from the database when printing a report.                 }
{******************************************************************************}
type
  TPEHasSavedData = function (
    printJob         : Smallint;
    var hasSavedData : Bool): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEHasSavedData (
    printJob         : Smallint;
    var hasSavedData : Bool): Bool;

type
  TPEDiscardSavedData = function (printJob : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEDiscardSavedData (printJob : Smallint): Bool;

{******************************************************************************}
{ Report Title                                                                 }
{******************************************************************************}
type
  TPEGetReportTitle = function (
    printJob        : Smallint;
    var titleHandle : HWnd;
    var titleLength : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetReportTitle (
    printJob        : Smallint;
    var titleHandle : HWnd;
    var titleLength : Smallint): Bool;

type
  TPESetReportTitle = function (
    printJob : Smallint;
    title    : PChar): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetReportTitle (
    printJob : Smallint;
    title    : PChar): Bool;

{******************************************************************************}
{ Output to Window                                                             }
{******************************************************************************}
type
  TPEOutputToWindow = function (
    printJob     : Smallint;
    title        : PChar;
    left         : DWord;
    top          : DWord;
    width        : DWord;
    height       : DWord;
    style        : DWord;
    parentWindow : HWnd): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}

  function PEOutputToWindow (
    printJob     : Smallint;
    title        : PChar;
    left         : DWord;
    top          : DWord;
    width        : DWord;
    height       : DWord;
    style        : DWord;
    parentWindow : HWnd): Bool;

type
  TPEGetWindowHandle = function (printJob: Smallint): HWnd; {$IFDEF WIN32} stdcall; {$ENDIF}
  TPECloseWindow = procedure(printJob: Smallint); {$IFDEF WIN32} stdcall; {$ENDIF}

  function PEGetWindowHandle (printJob: Smallint): HWnd;
  procedure PECloseWindow (printJob: Smallint);

{------------------------------------------------------------------------------}
{ Window Options/Print Controls                                                }
{------------------------------------------------------------------------------}
type
  {Structure to use for SCR 6}
  PEWindowOptions6 = record
    structSize          : Word;
    hasGroupTree        : Smallint; {0 or 1 except use PE_UNCHANGED for no change}
    canDrillDown        : Smallint; {0 or 1 except use PE_UNCHANGED for no change}
    hasNavigationControls: Smallint; {0 or 1 except use PE_UNCHANGED for no change}
    hasCancelButton     : Smallint; {0 or 1 except use PE_UNCHANGED for no change}
    hasPrintButton      : Smallint; {0 or 1 except use PE_UNCHANGED for no change}
    hasExportButton     : Smallint; {0 or 1 except use PE_UNCHANGED for no change}
    hasZoomControl      : Smallint; {0 or 1 except use PE_UNCHANGED for no change}
    hasCloseButton      : Smallint; {0 or 1 except use PE_UNCHANGED for no change}
    hasProgressControls : Smallint; {0 or 1 except use PE_UNCHANGED for no change}
    hasSearchButton     : Smallint; {0 or 1 except use PE_UNCHANGED for no change}
    hasPrintSetupButton : Smallint; {0 or 1 except use PE_UNCHANGED for no change}
    hasRefreshButton    : Smallint; {0 or 1 except use PE_UNCHANGED for no change}
  end;

  {Structure to use for SCR 7+}
  PEWindowOptions = record
    structSize            : Word;     { initialize to PE_SIZEOF_WINDOW_OPTIONS}
    hasGroupTree          : Smallint; { 0 or 1 except use PE_UNCHANGED for no change}
    canDrillDown          : Smallint; { 0 or 1 except use PE_UNCHANGED for no change}
    hasNavigationControls : Smallint; { 0 or 1 except use PE_UNCHANGED for no change}
    hasCancelButton       : Smallint; { 0 or 1 except use PE_UNCHANGED for no change}
    hasPrintButton        : Smallint; { 0 or 1 except use PE_UNCHANGED for no change}
    hasExportButton       : Smallint; { 0 or 1 except use PE_UNCHANGED for no change}
    hasZoomControl        : Smallint; { 0 or 1 except use PE_UNCHANGED for no change}
    hasCloseButton        : Smallint; { 0 or 1 except use PE_UNCHANGED for no change}
    hasProgressControls   : Smallint; { 0 or 1 except use PE_UNCHANGED for no change}
    hasSearchButton       : Smallint; { 0 or 1 except use PE_UNCHANGED for no change}
    hasPrintSetupButton   : Smallint; { 0 or 1 except use PE_UNCHANGED for no change}
    hasRefreshButton      : Smallint; { 0 or 1 except use PE_UNCHANGED for no change}
    showToolbarTips       : Smallint; { BOOL value, except use PE_UNCHANGED for no change}
                                      { default is TRUE (*Show* tooltips on toolbar)}
    showDocumentTips      : Smallint; { BOOL value, except use PE_UNCHANGED for no change}
                                      { default is FALSE (*Hide* tooltips on document)}
  end;

const
  PE_SIZEOF_WINDOW_OPTIONS = SizeOf(PEWindowOptions);

type
  TPEGetWindowOptions = function (
    printJob    : Smallint;
    var options : PEWindowOptions): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetWindowOptions (
    printJob    : Smallint;
    var options : PEWindowOptions): Bool;

type
  TPESetWindowOptions = function (
    printJob    : Smallint;
    var options : PEWindowOptions): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetWindowOptions (
    printJob    : Smallint;
    var options : PEWindowOptions): Bool;

type
  TPEShowPrintControls = function (
    printJob          : Smallint;
    showPrintControls : Bool): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEShowPrintControls (
    printJob          : Smallint;
    showPrintControls : Bool): Bool;

type
  TPEPrintControlsShowing = function (
    printJob            : Smallint;
    var controlsShowing : Bool): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEPrintControlsShowing (
    printJob            : Smallint;
    var controlsShowing : Bool): Bool;

{------------------------------------------------------------------------------}
{ Paging                                                                       }
{------------------------------------------------------------------------------}
type
  TPEShowFirstPage = function (printJob : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  TPEShowNextPage = function (printJob : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  TPEShowPreviousPage = function (printJob : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  TPEShowLastPage = function (printJob : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  TPEGetNPages = function (printJob: Smallint): Smallint; {$IFDEF WIN32} stdcall; {$ENDIF}

  function PEShowFirstPage (printJob: Smallint): Bool;
  function PEShowNextPage (printJob: Smallint): Bool;
  function PEShowPreviousPage (printJob: Smallint): Bool;
  function PEShowLastPage (printJob: Smallint): Bool;
  function PEGetNPages (printJob: Smallint): Smallint;

type
  TPEShowNthPage = function (
    printJob : Smallint;
    pageN    : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEShowNthPage (
    printJob : Smallint;
    pageN    : Smallint): Bool;

{------------------------------------------------------------------------------}
{ Window Zoom                                                                  }
{------------------------------------------------------------------------------}
const
  PE_ZOOM_FULL_SIZE           = 0;
  PE_ZOOM_SIZE_FIT_ONE_SIDE   = 1;
  PE_ZOOM_SIZE_FIT_BOTH_SIDES = 2;

type
  TPEZoomPreviewWindow = function (
    printJob : Smallint;
    level    : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEZoomPreviewWindow (
    printJob : Smallint;
    level    : Smallint): Bool;
    {level: a percent from 25 to 400 or a PE_ZOOM_ constant}

type
  TPENextPrintWindowMagnification = function (printJob: Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PENextPrintWindowMagnification (printJob:  Smallint): Bool;

{------------------------------------------------------------------------------}
{ Print/Export Preview Window                                                  }
{------------------------------------------------------------------------------}
type
  TPEPrintWindow = function (
    printJob      : Smallint;
    waitUntilDone : Bool): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEPrintWindow (
    printJob      : Smallint;
    waitUntilDone : Bool): Bool;

type
  TPEExportPrintWindow = function (
    printJob      : Smallint;
    toMail        : Bool;
    waitUntilDone : Bool): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEExportPrintWindow (
    printJob      : Smallint;
    toMail        : Bool;
    waitUntilDone : Bool): Bool;

{******************************************************************************}
{ Output to Printer                                                            }
{******************************************************************************}
type
  TPEOutputToPrinter = function (
    printJob : Smallint;
    nCopies  : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEOutputToPrinter (
    printJob : Smallint;
    nCopies  : Smallint): Bool;

type
  TPESelectPrinter = function (
    printJob    : Smallint;
    driverName  : PChar;
    printerName : PChar;
    portName    : PChar;
    mode        : PDevMode): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESelectPrinter (
    printJob    : Smallint;
    driverName  : PChar;
    printerName : PChar;
    portName    : PChar;
    mode        : PDevMode): Bool;

type
  TPEGetSelectedPrinter = function (
    printJob          : Smallint;
    var driverHandle  : Hwnd;
    var driverLength  : Smallint;
    var printerHandle : Hwnd;
    var printerLength : Smallint;
    var portHandle    : Hwnd;
    var portLength    : Smallint;
    var mode          : PDevMode): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetSelectedPrinter (
    printJob          : Smallint;
    var driverHandle  : Hwnd;
    var driverLength  : Smallint;
    var printerHandle : Hwnd;
    var printerLength : Smallint;
    var portHandle    : Hwnd;
    var portLength    : Smallint;
    var mode          : PDevMode): Bool;

{******************************************************************************}
{ Detail Copies                                                                }
{   Commonly used for label-style Reports                                      }
{******************************************************************************}
type
  TPEGetNDetailCopies = function (
    printJob     : Smallint;
    var nCopies  : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetNDetailCopies (
    printJob     : Smallint;
    var nCopies  : Smallint): Bool;

type
  TPESetNDetailCopies = function (
    printJob     : Smallint;
    nCopies      : Smallint): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetNDetailCopies (
    printJob     : Smallint;
    nCopies      : Smallint): Bool;

{******************************************************************************}
{ Print Options                                                                }
{   Extension to PESetPrintOptions function: If the 2nd parameter              }
{   (pointer to PEPrintOptions) is set to 0 (null) the function prompts        }
{   the user for these options.                                                }
{                                                                              }
{   With this change, you can get the behaviour of the print-to-printer        }
{   button in the print window by calling PESetPrintOptions with a             }
{   null pointer and then calling PEPrintWindow.                               }
{******************************************************************************}
const
  {Start/Stop Page}
  PE_MAXPAGEN          = 65535;
  {Output FileName}
  PE_FILE_PATH_LEN     = 512;
  {Collation}
  PE_UNCOLLATED        = 0;
  PE_COLLATED          = 1;
  PE_DEFAULTCOLLATION  = 2;

type
  PEOutputFileNameType = array [0..PE_FILE_PATH_LEN-1] of Char;

  {Structure to use for SCR 5 & 6}
  PEPrintOptions56 = record
    structSize,
    StartPageN,
    StopPageN,
    nReportCopies,
    Collation       : Word;
  end;

  {Structure to use for SCR 7+}
  PEPrintOptions  = record
    structSize     : Word; { initialize to SizeOf(PEPrintOptions) }
    { page and copy numbers are 1-origin }
    { use 0 to preserve the existing Strings }
    StartPageN     : Word;
    StopPageN      : Word;
    nReportCopies  : Word;
    Collation      : Word;
    outputFileName : PEOutputFileNameType;
  end;

  TPEGetPrintOptions = function (
    printJob    : Smallint;
    var options : PEPrintOptions):Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetPrintOptions (
    printJob    : Smallint;
    var options : PEPrintOptions):Bool;

type
  TPESetPrintOptions = function (
    printJob    : Smallint;
    var options : PEPrintOptions): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetPrintOptions (
    printJob    : Smallint;
    var options : PEPrintOptions): Bool;

{******************************************************************************}
{ Output to Fax                                                                }
{  - not implemented yet...                                                    }
{******************************************************************************}
const
  {Fax Support}
  MAX_PHONE_NUMBER = 32;
  {PEFaxDriver Constants}
  PE_BLACK_ICE_FAX = 0;

type
  PEPhoneNumType = array [0..MAX_PHONE_NUMBER - 1] of Char;

  PEFaxOptions = record
    structSize  : Word; {initialize to PE_SIZEOF_FAX_OPTIONS}
    phoneNumber : PEPhoneNumType;
  end;

const
  PE_SIZEOF_FAX_OPTIONS = SizeOf(PEFaxOptions);

type
  TPEOutputToFax = function (
    printJob       : Smallint;
    faxDriver      : SmallInt; {use one of the PEFaxDriver Constants}
    var faxOptions : PEFaxOptions): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEOutputToFax (
    printJob       : Smallint;
    faxDriver      : SmallInt; {use one of the PEFaxDriver Constants}
    var faxOptions : PEFaxOptions): Bool;

{******************************************************************************}
{ Exporting                                                                    }
{******************************************************************************}
const
  UXFCrystalReportType    = 0;
  UXFWordWinType          = 0;
  UXFWordDosType          = 1;
  UXFWordPerfectType      = 2;
  UXFTextType             = 0;
  UXFTabbedTextType       = 1;
  UXFRichTextFormatType   = 0;
  UXFLotusWksType         = 0;
  UXFLotusWk1Type         = 1;
  UXFLotusWk3Type         = 2;
  UXFReportDefinitionType = 0;
  UXFQP5Type              = 0;

type
  PEExportOptions  = record
    { Initialize to SizeOfPEExportOptions }
    structSize               : Word;
    formatDLLName            : PEDllNameType;
    formatType               : DWord;
    formatOptions            : Pointer;
    destinationDLLName       : PEDllNameType;
    destinationType          : DWord;
    destinationOptions       : Pointer;
    nFormatOptionsBytes      : Word; { Set by PEExportOptions }
                                     { Ignored by PEExportTo  }
    nDestinationOptionsBytes : Word; { Set by PEExportOptions }
                                     { Ignored by PEExportTo  }
  end;

const
  PE_SIZEOF_EXPORT_OPTIONS = SizeOf(PEExportOptions);

type
  TPEGetExportOptions = function (
    printJob    : Smallint;
    var options : PEExportOptions): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetExportOptions (
    printJob    : Smallint;
    var options : PEExportOptions): Bool;

type
  TPEExportTo = function (
    printJob    : Smallint;
    var options : PEExportOptions): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEExportTo (
    printJob    : Smallint;
    var options : PEExportOptions): Bool;

{------------------------------------------------------------------------------}
{ Old call: PEOutputToFile                                                     }
{   - for backwards compatibility only                                         }
{------------------------------------------------------------------------------}
const
  PE_FT_RECORD        = 0; {Record style format as column of values;
                            Doesn't use commas or separators;
                            Outputs every record with a fixed field width}
  PE_FT_TABSEPARATED  = 1; {Tabular form. Encloses alphanumeric field data
                            in quotes and separates fields with tabs}
  PE_FT_TEXT          = 2; {ASCII text format with all values separated
                            by spaces}
  PE_FT_DIF           = 3; {Data interchange format(DIF), often used for
                            transfer of data between spreadsheet programs}
  PE_FT_CSV           = 4; {Comma separated values; encloses alphanumeric
                            field data in the character of your choice
                            (typically single or double quotes), and
                            separates fields with commas}
  PE_FT_CHARSEPARATED =	5; {Character separated values, encloses
                            alphanumeric field data in quotes, and
                            separates fields with the character of your choice}
  PE_FT_TABFORMATTED  = 6; {ASCII text format: all values separated by tabs}

type
  PEPrintFileOptions = record
    structSize 	        : Word;
    UseReportNumberFmt  : Bool;
    UseReportDateFormat : Bool;
  end;

  PECharSepFileOptions = record
    structSize 	        : Word;
    UseReportNumberFmt  : Bool;
    UseReportDateFormat : Bool;
    StringDelimiter     : Char;
    FieldDelimiter      : PChar;
  end;

  TPEOutputToFile = function (
    printJob       : Smallint;
    outputFilePath : PChar;
    fileType       : SmallInt; { a PE_FT constant }
    options        : Pointer): Bool;  {$IFDEF WIN32} stdcall; {$ENDIF}
    { options = Pointer to PEPrintFileOptions or PECharSepFileOptions }
  function PEOutputToFile (
    printJob       : Smallint;
    outputFilePath : PChar;
    fileType       : SmallInt; { a PE_FT constant }
    options        : Pointer): Bool;

{------------------------------------------------------------------------------}
{ Export to Excel                                                              }
{------------------------------------------------------------------------------}
const
  UXFXls2Type            = 0;
  UXFXls3Type            = 1;
  UXFXls4Type            = 2;
  UXFXls5Type            = 3;
  UXFXls5TypeTab         = 4; {Left in for backward compatibility}
  UXFXls5TypeExt         = 4;
  UXFXls7Type            = 5;
  UXFXls7TabType         = 6;
  UXFXls8Type            = 7;
  UXFXls8TabType         = 8;
  DEFAULT_COLUMN_WIDTH   = 10;

type
  AreaType = Word;

  {Structure to use for SCR 5}
  UXFXlsOptions5 = record
    structSize      : Word;
    bColumnHeadings : Bool;
  end;

  {Structure to use for SCR 6}
  UXFXlsOptions6 = record
    structSize        : Word;
    bColumnHeadings   : Bool;
      {TRUE -- has column headings, which come from}
      {       "Page Header" and "Report Header" areas.}
      {FALSE -- no column headings.}
      {The default value is FALSE.}
    bUseConstColWidth : Bool;
      {TRUE -- use constant column width}
      {FALSE -- set column width based on an area}
      {The default value is FALSE.}
    fConstColWidth    : Double;
      {Column width, when bUseConstColWidth is TRUE}
      {The default value is 9.}
    bTabularFormat    : Bool;
      {TRUE -- tabular format (flatten an area into a row)}
      {FALSE -- non-tabular format}
      {The default value is FALSE.}
    baseAreaType      : AreaType;
      {One of the 7 area types defined by PE_SECT_ constants.}
      {The default value is PE_SECT_DETAIL Details.}
    baseAreaGroupNum  : Word;
      {If baseAreaType is either GroupHeader or}
      {GroupFooter and there are more than one groups,}
      {we need to give the group number.}
      {The default value is 1.}
  end;

  {Structure to use for SCR 7+}
  UXFXlsOptions = record
    structSize        : Word;
    bColumnHeadings   : Bool;
    {TRUE -- has column headings, which come from}
    {        "Page Header" and "Report Header" areas.}
    {FALSE -- no column headings.}
    {The default value is FALSE.}
    bUseconstColWidth : Bool;
    {TRUE -- use constant column width}
    {FALSE -- set column width based on an area}
    {The default value is FALSE.}
    fconstColWidth    : Double;
    {Column width, when bUseconstColWidth is TRUE.}
    {The default value is DEFAULT_COLUMN_WIDTH (10)}
    bTabularFormat    : Bool;
    {TRUE -- tabular format (flatten an area into a row)}
    {FALSE -- non-tabular format}
    {The default value is FALSE.}
    baseAreaType      : AreaType;
    {One of the 7 area types defined by PE_SECT_ constants.}
    {The default value is PE_SECT_DETAIL Details.}
    baseAreaGroupNum  : Word;
    {If baseAreaType is either GroupHeader or GroupFooter,
    { and there are more than one group, we need to give the group number.}
    {The default value is 1.}
    bUseWorksheetFunc  : Bool;
    { If TRUE, use Excel worksheet functions to represent }
    { subtotal fields in SCR. }
    { The default value is TRUE. }
  end;

const
  UXFXlsOptionsSize = SizeOf(UXFXlsOptions);

{------------------------------------------------------------------------------}
{ Export to Lotus Notes Database                                               }
{------------------------------------------------------------------------------}
const
  UXDNotesType = 3;

type
  UXDNotesOptions = record
    structSize : Word;
    szDBName   : PChar;
    szFormName : PChar;  { should be "Report Form" }
    szComments : PChar;
  end;

const
  UXDNotesOptionsSize = SizeOf(UXDNotesOptions);

{------------------------------------------------------------------------------}
{ Export to Disk                                                               }
{------------------------------------------------------------------------------}
const
  UXDDiskType = 0;

type
  UXDDiskOptions = record
    {Initialize to UXDDiskOptionsSize}
    structSize : Word;
    fileName   : PChar;
  end;

const
  UXDDiskOptionsSize = SizeOf(UXDDiskOptions);

{------------------------------------------------------------------------------}
{ Export to MAPI                                                               }
{------------------------------------------------------------------------------}
const
  UXDMAPIType = 0;

type
  UXDMAPIOptions = record
    {Initialize to UXDMAPIOptionsSize}
    structSize  : Word;
    toList      : PChar;
    ccList      : PChar;
    subject     : PChar;
    mailmessage : PChar;
  end;

const
  UXDMAPIOptionsSize = SizeOf(UXDMAPIOptions);

{------------------------------------------------------------------------------}
{ Export to DIF                                                                }
{------------------------------------------------------------------------------}
const
  UXFDIFType = 0;

type
  UXFDIFOptions = record
    {Initialize to UXFDIFOptionsSize}
    structSize            : Word;
    useReportNumberFormat : Bool;
    useReportDateFormat   : Bool;
  end;

const
  UXFDIFOptionsSize = SizeOf(UXFDIFOptions);

{------------------------------------------------------------------------------}
{ Export to RecordStyle                                                        }
{------------------------------------------------------------------------------}
const
  UXFRecordType = 0;

type
  UXFRecordStyleOptions = record
    {Initialize to UXFRecordStyleOptionsSize}
    structSize            : Word;
    useReportNumberFormat : Bool;
    useReportDateFormat   : Bool;
  end;

const
  UXFRecordStyleOptionsSize = SizeOf(UXFRecordStyleOptions);

{------------------------------------------------------------------------------}
{ Export to Comma/Tab Separated                                                }
{------------------------------------------------------------------------------}
const
  UXFCommaSeparatedType = 0;
  UXFTabSeparatedType   = 1;

type
  UXFCommaTabSeparatedOptions = record
    {Initialize to UXFCommaTabSeparatedOptionsSize}
    structSize            : Word;
    useReportNumberFormat : Bool;
    useReportDateFormat   : Bool;
  end;

const
  UXFCommaTabSeparatedOptionsSize = SizeOf(UXFCommaTabSeparatedOptions);

{------------------------------------------------------------------------------}
{ Export to Char Separated                                                     }
{------------------------------------------------------------------------------}
const
  UXFCharSeparatedType = 2;

type
  UXFCharSeparatedOptions = record
    {Initialize to UXFCharSeparatedOptionsSize}
    structSize            : Word;
    useReportNumberFormat : Bool;
    useReportDateFormat   : Bool;
    stringDelimiter       : Char;
    fieldDelimiter        : PChar;
  end;

const
  UXFCharSeparatedOptionsSize = SizeOf(UXFCharSeparatedOptions);

{------------------------------------------------------------------------------}
{ Export to SMI                                                                }
{------------------------------------------------------------------------------}
const
  UXDSMIType = 0;

type
  UXDSMIOptions = record
    {Initialize to UXDSMIOptionsSize}
    structSize  : Word;
    toList      : PChar;
    ccList      : PChar;
    bccList     : PChar;
    subject     : PChar;
    mailmessage : PChar;
  end;

const
  UXDSMIOptionsSize = SizeOf(UXDSMIOptions);

{------------------------------------------------------------------------------}
{ Export to VIM                                                                }
{------------------------------------------------------------------------------}
const
  UXDVIMType = 0;

type
  UXDVIMOptions = record
    {Initialize to UXDVIMOptionsSize}
    structSize  : Word;
    toList      : PChar;
    ccList      : PChar;
    bccList     : PChar;
    subject     : PChar;
    mailmessage : PChar;
  end;

const
  UXDVIMOptionsSize = SizeOf(UXDVIMOptions);

{------------------------------------------------------------------------------}
{ Export to Exchange                                                           }
{------------------------------------------------------------------------------}
const
  UXDExchFolderType = 0;
  UXDPostDocMessage = 1011; {wDestType for folder messages}

type
  UXDPostFolderOptions = record
    structSize    : Word;
    pszProfile    : PChar;
    pszPassword   : PChar;
    wDestType     : Word;
    pszFolderPath : PChar;
  end;

  { pszFolderPath has to be in the following format:
     <Message Store Name>@<Folder Name>@<Folder Name> }

const
  UXDPostFolderOptionsSize = SizeOf(UXDPostFolderOptions);

{------------------------------------------------------------------------------}
{ Export to ODBC                                                               }
{------------------------------------------------------------------------------}
const
  UXFODBCType = 0;

type
  UXFODBCOptions = record
    structSize         : Word;
    dataSourceName     : PChar;
    dataSourceUserID   : PChar;
    dataSourcePassword : PChar;
    exportTableName    : PChar;
  end;

const
  UXFODBCOptionsSize = SizeOf(UXFODBCOptions);

{------------------------------------------------------------------------------}
{ Export to HTML                                                               }
{------------------------------------------------------------------------------}
const
  UXFHTML3Type     = 0; {Draft HTML 3.0 tags}
  UXFExplorer2Type = 1; {Include MS Explorer 2.0 tags}
  UXFNetscape2Type = 2; {Include Netscape 2.0 tags}
  UXFHTML32ExtType = 1; {HTML 3.2 tags + bg color extensions}
  UXFHTML32StdType = 2; {HTML 3.2 tags}

type
  UXFHTML3Options = record
    structSize : Word;  { set to UXFHTML3OptionsSize }
    fileName   : PChar; { ptr to full Windows filepath of HTML output file }
                        { e.g. "C:\pub\docs\boxoffic\default.htm" }
                        { NOTE: any exported GIF files will be  }
                        { located in the same directory as this file }
  end;

const
  UXFHTML3OptionsSize = SizeOf(UXFHTML3Options);

{------------------------------------------------------------------------------}
{ Export to Paginated Text                                                     }
{------------------------------------------------------------------------------}
const
  UXFPaginatedTextType = 2;

type
  UXFPaginatedTextOptions = record
    structSize     :Word;
    nLinesPerPage  :Word;
  end;

const
  UXFPaginatedTextOptionsSize = SizeOf(UXFPaginatedTextOptions);

{------------------------------------------------------------------------------}
{ Export to Application                                                        }
{------------------------------------------------------------------------------}
const
  UXDApplicationType = 0;

type
  UXDApplicationOptions = record
    structSize : word;
    fileName : PChar;
  end;

const
  UXDApplicationOptionsSize = SizeOf(UXDApplicationOptions);


{******************************************************************************}
{ Setting Page Margins                                                         }
{******************************************************************************}
const
  PE_SM_DEFAULT = $8000; {32768 in decimal}

type
  TPEGetMargins = function (
    printJob   : Smallint;
    var left   : Word;
    var right  : Word;
    var top    : Word;
    var bottom : Word): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetMargins (
    printJob   : Smallint;
    var left   : Word;
    var right  : Word;
    var top    : Word;
    var bottom : Word): Bool;

type
  TPESetMargins = function (
    printJob : Smallint;
    left     : Word;
    right    : Word;
    top      : Word;
    bottom   : Word): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetMargins (
    printJob : Smallint;
    left     : Word;
    right    : Word;
    top      : Word;
    bottom   : Word): Bool;

{******************************************************************************}
{ Report Summary Info                                                          }
{******************************************************************************}
const
  PE_SI_APPLICATION_NAME_LEN  = 128;
  PE_SI_TITLE_LEN             = 128;
  PE_SI_SUBJECT_LEN           = 128;
  PE_SI_AUTHOR_LEN            = 128;
  PE_SI_KEYWORDS_LEN          = 128;
  PE_SI_COMMENTS_LEN          = 512;
  PE_SI_REPORT_TEMPLATE_LEN   = 128;

type
  PEApplicationNameType = array [0..PE_SI_APPLICATION_NAME_LEN-1] of char;
  PETitleType           = array [0..PE_SI_TITLE_LEN-1] of char;
  PESubjectType         = array [0..PE_SI_SUBJECT_LEN-1] of char;
  PEAuthorType          = array [0..PE_SI_AUTHOR_LEN-1] of char;
  PEKeywordsType        = array [0..PE_SI_KEYWORDS_LEN-1] of char;
  PECommentsType        = array [0..PE_SI_COMMENTS_LEN-1] of char;
  PEReportTemplateType  = array [0..PE_SI_REPORT_TEMPLATE_LEN-1] of char;

  PEReportSummaryInfo = record
    structSize      : Word;
    applicationName : PEApplicationNameType; { read only.}
    title           : PETitleType;
    subject         : PESubjectType;
    author          : PEAuthorType;
    keywords        : PEKeywordsType;
    comments        : PECommentsType;
    reportTemplate  : PEReportTemplateType;
  end;

const
  PE_SIZEOF_REPORT_SUMMARY_INFO = SizeOf(PEReportSummaryInfo);

type
  TPEGetReportSummaryInfo = function (
    printJob        : Smallint;
    var summaryInfo : PEReportSummaryInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetReportSummaryInfo (
    printJob        : Smallint;
    var summaryInfo : PEReportSummaryInfo): Bool;

type
  TPESetReportSummaryInfo = function (
    printJob        : Smallint;
    var summaryInfo : PEReportSummaryInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetReportSummaryInfo (
    printJob        : Smallint;
    var summaryInfo : PEReportSummaryInfo): Bool;

{******************************************************************************}
{ Callback Events                                                              }
{******************************************************************************}
const
  { event ID }
  PE_CLOSE_PRINT_WINDOW_EVENT           = 1;
  PE_ACTIVATE_PRINT_WINDOW_EVENT        = 2;
  PE_DEACTIVATE_PRINT_WINDOW_EVENT      = 3;
  PE_PRINT_BUTTON_CLICKED_EVENT         = 4;
  PE_EXPORT_BUTTON_CLICKED_EVENT        = 5;
  PE_ZOOM_CONTROL_SELECTED_EVENT        = 6;
  PE_FIRST_PAGE_BUTTON_CLICKED_EVENT    = 7;
  PE_PREVIOUS_PAGE_BUTTON_CLICKED_EVENT = 8;
  PE_NEXT_PAGE_BUTTON_CLICKED_EVENT     = 9;
  PE_LAST_PAGE_BUTTON_CLICKED_EVENT     = 10;
  PE_CANCEL_BUTTON_CLICKED_EVENT        = 11;
  PE_CLOSE_BUTTON_CLICKED_EVENT         = 12;
  PE_SEARCH_BUTTON_CLICKED_EVENT        = 13;
  PE_GROUPTREE_BUTTON_CLICKED_EVENT     = 14;
  PE_PRINT_SETUP_BUTTON_CLICKED_EVENT   = 15;
  PE_REFRESH_BUTTON_CLICKED_EVENT       = 16;
  PE_SHOW_GROUP_EVENT                   = 17;
  PE_DRILL_ON_GROUP_EVENT	        = 18; { include drill on graph }
  PE_DRILL_ON_DETAIL_EVENT              = 19;
  PE_READING_RECORDS_EVENT              = 20;
  PE_START_EVENT                        = 21;
  PE_STOP_EVENT                         = 22;
  PE_MAPPING_FIELD_EVENT                = 23;
  PE_RIGHT_CLICK_EVENT                  = 24; { right mouse click  }
  PE_LEFT_CLICK_EVENT                   = 25; { left mouse click   }
  PE_MIDDLE_CLICK_EVENT                 = 26; { middle mouse click }

{ All Events are disabled by default; use PEEnableEvent to enable events }
type
  {Structure to use for SCR 6}
  PEEnableEventInfo6 = record
    structSize               : Word;
    startStopEvent           : smallint; // BOOL value, PE_UNCHANGED for no change
    readingRecordEvent       : smallint; // BOOL value, PE_UNCHANGED for no change
    printWindowButtonEvent   : smallint; // BOOL value, PE_UNCHANGED for no change
    drillEvent               : smallint; // BOOL value, PE_UNCHANGED for no change
    closePrintWindowEvent    : smallint; // BOOL value, PE_UNCHANGED for no change
    activatePrintWindowEvent : smallint; // BOOL value, PE_UNCHANGED for no change
  end;

  {Structure to use for SCR 7+}
  PEEnableEventInfo = record
    structSize               : Word;
    startStopEvent           : Smallint; {0 or 1, PE_UNCHANGED for no change}
    readingRecordEvent       : Smallint; {0 or 1, PE_UNCHANGED for no change}
    printWindowButtonEvent   : Smallint; {0 or 1, PE_UNCHANGED for no change}
    drillEvent               : Smallint; {0 or 1, PE_UNCHANGED for no change}
    closePrintWindowEvent    : Smallint; {0 or 1, PE_UNCHANGED for no change}
    activatePrintWindowEvent : Smallint; {0 or 1, PE_UNCHANGED for no change}
    fieldMappingEvent        : Smallint; {Bool value, PE_UNCHANGED for no change}
    mouseClickEvent          : Smallint; {Bool value, PE_UNCHANGED for no change}
  end;

const
  PE_SIZEOF_ENABLE_EVENT_INFO = SizeOf(PEEnableEventInfo);

type
  TPEEnableEvent = function (
    printJob            : Smallint;
    var enableEventInfo : PEEnableEventInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEEnableEvent (
    printJob            : Smallint;
    var enableEventInfo : PEEnableEventInfo): Bool;

type
  TPEGetEnableEventInfo = function (
    printJob            : Smallint;
    var enableEventInfo : PEEnableEventInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetEnableEventInfo (
    printJob            : Smallint;
    var enableEventInfo : PEEnableEventInfo): Bool;

type
  TPESetEventCallback = function (
    printJob     : Smallint;
    callbackProc : Pointer;
    userData     : Pointer): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetEventCallback (
    printJob     : Smallint;
    callbackProc : Pointer;
    userData     : Pointer): Bool;
    (*
    callbackProc function should be of form:
      function callbackProc (
        eventID : Smallint;  {event ID constant}
        param2  : Pointer;   {pointer to Event structure for event ID}
        param3  : Pointer    {user-defined pointer}
        ): Bool stdcall;
    *)
{should have "export" function keyword in 16-bit callback?}

{------------------------------------------------------------------------------}
{ General PrintWindow Event                                                    }
{------------------------------------------------------------------------------}
{ use this structure for
  PE_CLOSE_PRINT_WINDOW_EVENT
  PE_ACTIVATE_PRINT_WINDOW_EVENT
  PE_DEACTIVATE_PRINT_WINDOW_EVENT
  PE_PRINT_BUTTON_CLICKED_EVENT
  PE_EXPORT_BUTTON_CLICKED_EVENT
  PE_FIRST_PAGE_BUTTON_CLICKED_EVENT
  PE_PREVIOUS_PAGE_BUTTON_CLICKED_EVENT
  PE_NEXT_PAGE_BUTTON_CLICKED_EVENT
  PE_LAST_PAGE_BUTTON_CLICKED_EVENT
  PE_CANCEL_BUTTON_CLICKED_EVENT
  PE_PRINT_SETUP_BUTTON_CLICKED_EVENT
  PE_REFRESH_BUTTON_CLICKED_EVENT }
type
  PEGeneralPrintWindowEventInfo = record
    structSize   : Word;
    ignored      : Word; {for 4 byte alignment. ignore.}
    windowHandle : HWnd;
  end;

const
  PE_SIZEOF_GENERAL_PRINT_WINDOW_EVENT_INFO = SizeOf(PEGeneralPrintWindowEventInfo);

{------------------------------------------------------------------------------}
{ Mouse Click Event                                                            }
{------------------------------------------------------------------------------}
{ use this structure for
  PE_RIGHT_CLICK_EVENT
  PE_LEFT_CLICK_EVENT
  PE_MIDDLE_CLICK_EVENT }
const
  { mouse click action }
  PE_MOUSE_NOTSUPPORTED = 0;
  PE_MOUSE_DOWN         = 1;
  PE_MOUSE_UP           = 2;
  PE_MOUSE_DOUBLE_CLICK = 3;

  { mouse click flags (virtual key state-masks) }
  PE_CF_NONE       = $0000;
  PE_CF_LBUTTON    = $0001;
  PE_CF_RBUTTON    = $0002;
  PE_CF_SHIFTKEY   = $0004;
  PE_CF_CONTROLKEY = $0008;
  PE_CF_MBUTTON    = $0010;

{for PE_RIGHT_CLICK_EVENT}
type
  PEMouseClickEventInfo = record
    structSize   : Word;
    windowHandle : LongInt;
    clickAction  : integer;     {PE_MOUSE constants: mouse button down or up}
    clickFlags   : integer;     {any combination of PE_CF_*}
    xOffset      : integer;     {x-coordinate of mouse click in pixels}
    yOffset      : integer;     {y-coordinate of mouse click in pixels}
    fieldValue   : PEValueInfo;	{value of object at click point if it is a field}
                                {object, excluding MEMO and BLOB fields,}
                                {else valueType element = PE_VI_NOVALUE.}
    objectHandle : DWord;	{the design view object}
    sectionCode  : Smallint;	{section in which click occurred.}
  end;

const
  PE_SIZEOF_MOUSE_CLICK_EVENT_INFO = SizeOf(PEMouseClickEventInfo);

{------------------------------------------------------------------------------}
{ Start/Stop Event                                                             }
{------------------------------------------------------------------------------}
{ use this structure for
  PE_START_EVENT
  PE_STOP_EVENT }
const
  { job destination }
  PE_TO_NOWHERE = 0;
  PE_TO_WINDOW  = 1;
  PE_TO_PRINTER = 2;
  PE_TO_EXPORT  = 3;
  PE_FROM_QUERY = 4;
  PE_TO_FAX     = 5;

{ for PE_START_EVENT}
type
  PEStartEventInfo = record
    structSize  : Word;
    destination : Word;
  end;

const
  PE_SIZEOF_START_EVENT_INFO = SizeOf(PEStartEventInfo);

{ for PE_STOP_EVENT}
type
  PEStopEventInfo = record
    structSize  : Word;
    destination : Word;
    jobStatus   : Word; {a PE_JOB constant}
  end;

const
  PE_SIZEOF_STOP_EVENT_INFO = SizeOf(PEStopEventInfo);

{------------------------------------------------------------------------------}
{ Reading Records Event                                                        }
{------------------------------------------------------------------------------}
{ for PE_READING_RECORDS_EVENT }
type
  PEReadingRecordsEventInfo = record
    structSize      : Word;
    cancelled       : Smallint; {0 or 1.}
    recordsRead     : DWord;
    recordsSelected : DWord;
    done            : Smallint; {0 or 1}
  end;

const
  PE_SIZEOF_READING_RECORDS_EVENT_INFO = SizeOf(PEReadingRecordsEventInfo);

{------------------------------------------------------------------------------}
{ Zoom Control Event                                                           }
{------------------------------------------------------------------------------}
{ for PE_ZOOM_CONTROL_SELECTED_EVENT }
type
  PEZoomLevelChangingEventInfo = record
    structSize   : Word;
    zoomLevel    : Word;
    windowHandle : HWnd;
 end;

const
  PE_SIZEOF_ZOOM_LEVEL_CHANGING_EVENT_INFO = SizeOf(PEZoomLevelChangingEventInfo);

{------------------------------------------------------------------------------}
{ Close Button Clicked Event                                                   }
{------------------------------------------------------------------------------}
{ for PE_CLOSE_BUTTON_CLICKED_EVENT}
type
  PECloseButtonClickedEventInfo = record
    structSize   : Word;
    viewIndex    : Word; {which view is going to be closed. start from zero.}
    windowHandle : HWnd; {frame window handle the button is on.}
  end;

const
  PE_SIZEOF_CLOSE_BUTTON_CLICKED_EVENT_INFO = SizeOf(PECloseButtonClickedEventInfo);

{------------------------------------------------------------------------------}
{ Search Button Clicked Event                                                  }
{------------------------------------------------------------------------------}
{for PE_SEARCH_BUTTON_CLICKED_EVENT}
const
  PE_SEARCH_STRING_LEN = 128;

type
  PESearchStringType = array [0..PE_SEARCH_STRING_LEN-1] of Char;

  PESearchButtonClickedEventInfo = record
    windowHandle : HWnd;
    searchString : PESearchStringType;
    structSize   : Word;
  end;

const
  PE_SIZEOF_SEARCH_BUTTON_CLICKED_EVENT_INFO = SizeOf(PESearchButtonClickedEventInfo);

{------------------------------------------------------------------------------}
{ GroupTree Button Clicked Event                                               }
{------------------------------------------------------------------------------}
{for PE_GROUPTREE_BUTTON_CLICKED_EVENT}
type
  PEGroupTreeButtonClickedEventInfo = record
    structSize   : Word;
    Visible      : Smallint; {0 or 1. Current state of the group tree button}
    windowHandle : HWnd;
  end;

const
  PE_SIZEOF_GROUP_TREE_BUTTON_CLICKED_EVENT_INFO = SizeOf(PEGroupTreeButtonClickedEventInfo);

{------------------------------------------------------------------------------}
{ Show Group Event                                                             }
{------------------------------------------------------------------------------}
{for PE_SHOW_GROUP_EVENT}
type
  PEGroupArray = array[0..0] of PChar;
  PPEGroupArray = ^PEGroupArray;

  PEShowGroupEventInfo = record
    structSize   : Word;
    groupLevel   : Word;
    windowHandle : HWnd;
    groupList    : PPEGroupArray;
    { points to an array of group name PChars }
    { PChar memory is freed after calling the call back function }
  end;

const
  PE_SIZEOF_SHOW_GROUP_EVENT_INFO = SizeOf(PEShowGroupEventInfo);

(******************************************************************************
** An example of using the PEGroupArray (array of pointers)
**   - because the array is defined with zero elements,
**     we turn range-checking off in code.
*******************************************************************************
  {Local procedure WindowCallback}
  function WindowCallback(eventID: Smallint; pEvent: pointer; nil): LongBool stdcall;
  var
    ShowGroupInfo : PEShowGroupEventInfo;
    slGroups      : TStringList;
    cnt           : integer;
  begin
    case eventID of
      PE_SHOW_GROUP_EVENT :
        begin
          ShowGroupInfo := PEShowGroupEventInfo(pEvent^);
          if (ShowGroupInfo.structSize = SizeOf(PEShowGroupEventInfo)) then
          begin
            slGroups := TStringList.Create;
            {If Range Checking is on, turn it off}
            {$IFOPT R+}
              {$DEFINE CKRANGE}
              {$R-}
            {$ENDIF}
            for cnt := 0 to ShowGroupInfo.groupLevel - 1 do
              slGroups.Add(String(ShowGroupInfo.groupList^[cnt]));
            {$IFDEF CKRANGE}
              {$UNDEF CKRANGE}
              {$R+}
            {$ENDIF}
            {...do something...}
            slGroups.Free;
            Result := True; //to continue processing
          end;
        end;
    end;
  end;
*)

{------------------------------------------------------------------------------}
{ Drill On Group Event                                                         }
{------------------------------------------------------------------------------}
{For PE_DRILL_ON_GROUP_EVENT}
const
  PE_DE_ON_GROUP     = 0;
  PE_DE_ON_GROUPTREE = 1;
  PE_DE_ON_GRAPH     = 2;
  PE_DE_ON_MAP       = 3;
  PE_DE_ON_SUBREPORT = 4;

type
  PEDrillOnGroupEventInfo = record
    structSize   : Word;
    drillType    : Word; { a PE_DE_ constant}
    windowHandle : HWnd;
    { Points to an array of group name. Memory pointed by group list
    { is freed after calling the callback function }
    groupList    : PPEGroupArray;
    groupLevel   : Word;
  end;
  PPEDrillOnGroupEventInfo = ^PEDrillOnGroupEventInfo;

const
  PE_SIZEOF_DRILL_ON_GROUP_EVENT_INFO = SizeOf(PEDrillOnGroupEventInfo);

{------------------------------------------------------------------------------}
{ Drill On Detail Event                                                        }
{------------------------------------------------------------------------------}
{ for PE_DRILL_ON_DETAIL_EVENT }
type
  PEFieldValueInfo = record
    structSize : Word;
    ignored    : Word;            {for 4 byte alignment. ignore.}
    fieldName  : PEFieldNameType; {defined in GroupCondition/GroupOptions}
    fieldValue : PEValueInfo;
  end;
  PPEFieldValueInfo      = ^PEFieldValueInfo;
  PEFieldValueInfoArray  = array [0..0] of PPEFieldValueInfo;
  PPEFieldValueInfoArray = ^PEFieldValueInfoArray;

const
  PE_SIZEOF_FIELD_VALUE_INFO = SizeOf(PEFieldValueInfo);

type
  PEDrillOnDetailEventInfo = record
    structSize         : Word;
    selectedFieldIndex : Smallint; {-1 if no field selected}
    windowHandle       : HWnd;
    { points to an array of PEFieldValue. memory
      pointed by fieldValueList is freed after
      calling the call back function }
    fieldValueList     : PPEFieldValueInfoArray;
    nFieldValue        : Smallint; {number of field value in fieldValueList}
  end;

const
  PE_SIZEOF_DRILL_ON_DETAIL_EVENT_INFO = SizeOf(PEDrillOnDetailEventInfo);

{------------------------------------------------------------------------------}
{ Field Mapping Event                                                          }
{------------------------------------------------------------------------------}
const
  PE_TABLE_NAME_LEN          = 128;
  PE_DATABASE_FIELD_NAME_LEN = 128;

  { Field value type }
  PE_FVT_INT8SFIELD           = 1;
  PE_FVT_INT8UFIELD           = 2;
  PE_FVT_INT16SFIELD          = 3;
  PE_FVT_INT16UFIELD          = 4;
  PE_FVT_INT32SFIELD          = 5;
  PE_FVT_INT32UFIELD          = 6;
  PE_FVT_NUMBERFIELD          = 7;
  PE_FVT_CURRENCYFIELD        = 8;
  PE_FVT_BOOLEANFIELD         = 9;
  PE_FVT_DATEFIELD            = 10;
  PE_FVT_TIMEFIELD            = 11;
  PE_FVT_STRINGFIELD          = 12;
  PE_FVT_TRANSIENTMEMOFIELD   = 13;
  PE_FVT_PERSISTENTMEMOFIELD  = 14;
  PE_FVT_BLOBFIELD            = 15;
  PE_FVT_DATETIMEFIELD        = 16;
  PE_FVT_BITMAPFIELD          = 17;
  PE_FVT_ICONFIELD            = 18;
  PE_FVT_PICTUREFIELD         = 19;
  PE_FVT_OLEFIELD             = 20;
  PE_FVT_GRAPHFIELD           = 21;
  PE_FVT_UNKNOWNFIELD         = 22;

  { Field mapping types }
  PE_FM_AUTO_FLD_MAP          = 0;
  { Auto field name mapping }
  { Unmapped Report fields will be removed }

  PE_FM_CRPE_PROMPT_FLD_MAP   = 1;
  { CRPE provides dialog box to map field manually }

  PE_FM_EVENT_DEFINED_FLD_MAP = 2;
  { CRPE provides list of field in report and new database }
  { User needs to activate the PE_MAPPING_FIELD_EVENT }
  { and define a callback function }

type
  TPEGetFieldMappingType = function (
    printJob        : Smallint;
    var mappingType : Word): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetFieldMappingType (
    printJob        : Smallint;
    var mappingType : Word): Bool;

type
  TPESetFieldMappingType = function (
    printJob    : Smallint;
    mappingType : Word): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetFieldMappingType (
    printJob    : Smallint;
    mappingType : Word): Bool;

type
  PETableAliasNameType     = array [0..PE_TABLE_NAME_LEN -1] of Char;
  PEDatabaseFieldNameType  = array [0..PE_DATABASE_FIELD_NAME_LEN -1] of Char;

  PEReportFieldMappingInfo = record
    structSize        : Word;
    valueType         : Word; { a PE_FVT_constant }
    tableAliasName    : PETableAliasNameType;
    databaseFieldName : PEDatabaseFieldNameType;
    mappingTo         : integer;
    { Mapped fields are assigned to the index of a field }
    { in array PEFieldMappingEventInfo->databaseFields. }
    { Unmapped fields are assigned to -1 }
  end;

  PPEReportFieldMappingInfo = ^PEReportFieldMappingInfo;
  PEMappingInfoArray = array[0..0] of PPEReportFieldMappingInfo;
  PPEMappingInfoArray = ^PEMappingInfoArray;

const
  PE_SIZEOF_REPORT_FIELDMAPPING_INFO = SizeOf(PEReportFieldMappingInfo);

type
  PEFieldMappingEventInfo = record
    structSize      : Word;
    reportFields    : PPEMappingInfoArray;
    { An array of pointers to the fields in the report }
    { User need to modify the 'mappingTo' of each new mapped field
    { by assigning the value of the index of a field in the array of databaseFields }
    nReportFields   : Word; { Size of array reportFields }
    databaseFields  : PPEMappingInfoArray;
    { An array of pointers to the fields in the new database file }
    nDatabaseFields : Word; { Size of array databaseField }
  end;

const
  PE_SIZEOF_FIELDMAPPING_EVENT_INFO = SizeOf(PEFieldMappingEventInfo);

{******************************************************************************}
{ Window Cursor                                                                }
{******************************************************************************}
{ All are window standard cursors except PE_TC_MAGNIFY_CURSOR.
  PE_TC_SIZEALL_CURSOR, PE_TC_NO_CURSOR, PE_TC_APPSTARTING_CURSOR
  and PE_TC_HELP_CURSOR are  not supported in 16-bit.
  PE_TC_SIZE_CURSOR and PE_TC_ICON_CURSOR are obsolete for 32-bit;
  use PE_TC_SIZEALL_CURSOR and PE_TC_ARROW_CURSOR instead. }
const
  PE_TC_DEFAULT_CURSOR     = 0; {CRPE set default cursor to be PE_TC_ARRAOW_CURSOR}
  PE_TC_ARROW_CURSOR       = 1;
  PE_TC_CROSS_CURSOR       = 2;
  PE_TC_IBEAM_CURSOR       = 3;
  PE_TC_UPARROW_CURSOR     = 4;
  PE_TC_SIZEALL_CURSOR     = 5;  {32-bit}
  PE_TC_SIZENWSE_CURSOR    = 6;
  PE_TC_SIZENESW_CURSOR    = 7;
  PE_TC_SIZEWE_CURSOR      = 8;
  PE_TC_SIZENS_CURSOR      = 9;
  PE_TC_NO_CURSOR          = 10; {32-bit}
  PE_TC_WAIT_CURSOR        = 11;
  PE_TC_APPSTARTING_CURSOR = 12; {32-bit}
  PE_TC_HELP_CURSOR	   = 13; {32-bit}
  PE_TC_SIZE_CURSOR        = 14; {16-bit}
  PE_TC_ICON_CURSOR        = 15; {16-bit}
  PE_TC_MAGNIFY_CURSOR     = 99; {32-bit; CRPE specific cursor}

type
  PETrackCursorInfo = record
    structSize                  : Word;
    groupAreaCursor             : Smallint; {a PE_TC constant. PE_UNCHANGED for no change}
    groupAreaFieldCursor        : Smallint; {a PE_TC constant. PE_UNCHAGNED for no change}
    detailAreaCursor            : Smallint; {a PE_TC constant. PE_UNCHANGED for no change}
    detailAreaFieldCursor       : Smallint; {a PE_TC constant. PE_UNCHANGED for no change}
    graphCursor                 : Smallint; {a PE_TC constant. PE_UNCHANGED for no change}
    groupAreaCursorHandle       : DWord;    {reserved}
    groupAreaFieldCursorHandle  : DWord;    {reserved}
    detailAreaCursorHandle      : DWord;    {reserved}
    detailAreaFieldCursorHandle : DWord;    {reserved}
    graphCursorHandle           : DWord;    {reserved}
  end;

const
  PE_SIZEOF_TRACK_CURSOR_INFO = SizeOf(PETrackCursorInfo);

type
  TPEGetTrackCursorInfo = function (
    printJob       : Smallint;
    var cursorInfo : PETrackCursorInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PEGetTrackCursorInfo (
    printJob       : Smallint;
    var cursorInfo : PETrackCursorInfo): Bool;

type
  TPESetTrackCursorInfo = function (
    printJob       : Smallint;
    var cursorInfo : PETrackCursorInfo): Bool; {$IFDEF WIN32} stdcall; {$ENDIF}
  function PESetTrackCursorInfo (
    printJob       : Smallint;
    var cursorInfo : PETrackCursorInfo): Bool;

type
  TLogEvent = procedure(PECallStr: string; JobNum: smallint;
    param1: Pointer; param2: Pointer; param3: Pointer; param4: Pointer;
    param5: Pointer; param6: Pointer; param7: Pointer; param8: Pointer;
    param9: Pointer; param10: Pointer; param11: Pointer) of object;
  TLogResult = procedure(PECallStr: string; boolResult: Bool;
    intResult: integer) of object;

procedure CRDEngineError(const sMessage: string);
procedure LogEvent(PECallStr: string; JobNum: smallint;
  param1: Pointer; param2: Pointer; param3: Pointer; param4: Pointer;
  param5: Pointer; param6: Pointer; param7: Pointer; param8: Pointer;
  param9: Pointer; param10: Pointer; param11: Pointer);
procedure LogResult(PECallStr: string; boolResult: Bool;
  intResult: integer);

const
  CRD_ERROR_LOADING     = 'Error loading library: ' + CRPEDLLName;
  CRD_ERROR_FREEING     = 'Error freeing library: ' + CRPEDLLName;
  CRD_ENGINE_NOT_LOADED = CRPEDLLName + ' is not loaded';
  CRD_ERROR_LOADING_FUNCTION = 'Error loading function: ';

var
  CRDEngine     : THandle; {CRPE32.DLL Engine Handle}
  CRDErrorStr   : string;  {Contains the last error string}
  CRDVerMajor   : integer; {These variables should be set by the programmer }
  CRDVerMinor   : integer; {if an earlier version than Crystal 7 is being used}
  CRDLog        : TComponent; {Pointer to TCrpeLog component}
  CRDShowErrors : Boolean; {Use built-in Error Message routine}

{******************************************************************************}
{*** Implementation Section ***************************************************}
{******************************************************************************}
implementation

uses SysUtils;

{******************************************************************************}
{ Section Macros                                                               }
{******************************************************************************}
function PE_SECTION_CODE(sectionType, groupN, sectionN : Smallint): Smallint;
begin
  Result := (sectionType * 1000) + (groupN mod 25) + ((sectionN mod 40) * 25);
end;
function PE_AREA_CODE(sectionType, groupN: Smallint): Smallint;
begin
  Result := PE_SECTION_CODE(sectionType, groupN, 0);
end;
function PE_SECTION_TYPE(sectionCode: Smallint): Smallint;
begin
  Result := sectionCode div 1000;
end;
function PE_GROUP_N(sectionCode: Smallint): Smallint;
begin
  Result := sectionCode mod 25;
end;
function PE_SECTION_N(sectionCode: Smallint): Smallint;
begin
  Result := (sectionCode div 25) mod 40;
end;

{------------------------------------------------------------------------------}
{ LogEvent procedure                                                           }
{------------------------------------------------------------------------------}
procedure LogEvent(PECallStr: string; JobNum: smallint;
  param1: Pointer; param2: Pointer; param3: Pointer; param4: Pointer;
  param5: Pointer; param6: Pointer; param7: Pointer; param8: Pointer;
  param9: Pointer; param10: Pointer; param11: Pointer);
var
  Event : TMethod;
begin
  if (CRDLog <> nil) then
  begin
    if CRDLog.ClassName = 'TCrpeLog' then
    begin
      {Use MethodAddress so we don't have to include UCrpeLog}
      Event.Data := CRDLog;
      Event.Code := CRDLog.MethodAddress('LogEvent');
      TLogEvent(Event)(PECallStr, JobNum, param1, param2, param3,
        param4, param5, param6, param7, param8, param9,
        param10, param11);
    end;
  end;
end;

{------------------------------------------------------------------------------}
{ LogResult procedure                                                          }
{------------------------------------------------------------------------------}
procedure LogResult(PECallStr: string; boolResult: Bool;
  intResult: integer);
var
  Event : TMethod;
begin
  if (CRDLog <> nil) then
  begin
    if CRDLog.ClassName = 'TCrpeLog' then
    begin
      {Use MethodAddress so we don't have to include UCrpeLog}
      Event.Data := CRDLog;
      Event.Code := CRDLog.MethodAddress('LogResult');
      TLogResult(Event)(PECallStr, boolResult, intResult);
    end;
  end;
end;

{------------------------------------------------------------------------------}
{ CRDEngineError procedure                                                     }
{------------------------------------------------------------------------------}
procedure CRDEngineError (const sMessage: string);
var
  s1 : string;
begin
  s1 := sMessage;
  CRDErrorStr := s1;
  if Length(sMessage) > 1 then
  begin
    s1 := Copy(sMessage, 1, 2);
    if UpperCase(s1) = 'PE' then
      s1 := CRD_ERROR_LOADING_FUNCTION + sMessage
    else
      s1 := sMessage;

    CRDErrorStr := s1;

    if CRDShowErrors then
    begin
      if Windows.MessageBox(0, PChar(s1 + chr(10) + 'Continue anyway?'),
         'Print Engine Error', MB_ICONSTOP + MB_OKCANCEL) = IDCANCEL then
        Abort;
    end;
  end;
end;

{------------------------------------------------------------------------------}
{ PELoadCrpeDll function                                                       }
{------------------------------------------------------------------------------}
function PELoadCrpeDll(const DllPath: string) : Bool;
var
  s1,s2 : string;
  L     : integer;
begin
  Result := False;
  {Add trailing backslash if required}
  s1 := Trim(DllPath);
  L := Length(s1);
  if (L > 0) then
  begin
    if not (s1[L] = '\') then
      s1 := s1 + '\';
  end;
  s1 := s1 + CRPEDllName;
  LogEvent('PELoadCrpeDll',0,@s1,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
  CRDEngine := LoadLibrary(PChar(s1));
  {If an error occured, set the flag}
  if (CRDEngine < HINSTANCE_ERROR) then
  begin
    CRDEngine := 0;
    s2 := SysErrorMessage(GetLastError);
    if Trim(s2) = '' then
      s1 := CRD_ERROR_LOADING + Chr(10) + 'Windows Error Number: ' + IntToStr(GetLastError)
    else
      s1 := CRD_ERROR_LOADING + Chr(10) +
        'Windows Error Number: ' + IntToStr(GetLastError) + ' - ' + Trim(s2);
    CRDEngineError(s1);
  end
  else
    Result := True;
  LogResult('PELoadCrpeDll',Result,0);
end;

{------------------------------------------------------------------------------}
{ PEUnloadCrpeDll function                                                     }
{------------------------------------------------------------------------------}
function PEUnloadCrpeDll : Bool;
var
  s1 : string;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
    Exit;
  LogEvent('PEUnloadCrpeDll',0,@CRDEngine,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
  Result := FreeLibrary(CRDEngine);
  CRDEngine := 0;
  if Result = False then
  begin
    s1 := SysErrorMessage(GetLastError);
    if Trim(s1) = '' then
      CRDEngineError(CRD_ERROR_FREEING + Chr(10) +
        'Windows Error Number: ' + IntToStr(GetLastError))
    else
      CRDEngineError(CRD_ERROR_FREEING + Chr(10) +
        'Windows Error Number: ' + IntToStr(GetLastError) + ' - ' + Trim(s1));
  end;
  LogResult('PEUnloadCrpeDll',Result,0);
end;

{------------------------------------------------------------------------------}
{ PEOpenEngine function                                                        }
{------------------------------------------------------------------------------}
function PEOpenEngine : Bool;
var
  CrpeOpenEngine : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  if CRDEngine = 0 then
  begin
    if not PELoadCrpeDll('') then
      Exit;
  end;
  CrpeOpenEngine := GetProcAddress(CRDEngine, 'PEOpenEngine');
  if CrpeOpenEngine = nil then
  begin
    CRDEngineError('PEOpenEngine');
  end
  else
  begin
    LogEvent('PEOpenEngine',0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPEOpenEngine(CrpeOpenEngine);
    LogResult('PEOpenEngine',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PECloseEngine procedure                                                      }
{------------------------------------------------------------------------------}
procedure PECloseEngine;
var
  CrpeCloseEngine : TFarProc;
begin
  CRDEngineError('');
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    {CRDEngineError(CRD_ENGINE_NOT_LOADED);}
    Exit;
  end;
  CrpeCloseEngine := GetProcAddress(CRDEngine, 'PECloseEngine');
  if CrpeCloseEngine = nil then
  begin
    CRDEngineError('PECloseEngine');
  end
  else
  begin
    LogEvent('PECloseEngine',0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    TPECloseEngine(CrpeCloseEngine);
    PEUnloadCrpeDll;
  end;
end;

{------------------------------------------------------------------------------}
{ PECanCloseEngine function                                                    }
{------------------------------------------------------------------------------}
function PECanCloseEngine: Bool;
var
  CrpeCanCloseEngine : TFarProc;
begin
  CRDEngineError('');
  Result := True;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    {CRDEngineError(CRD_ENGINE_NOT_LOADED);}
    Exit;
  end;
  CrpeCanCloseEngine := GetProcAddress(CRDEngine, 'PECanCloseEngine');
  if CrpeCanCloseEngine = nil then
  begin
    CRDEngineError('PECanCloseEngine');
  end
  else
  begin
    LogEvent('PECanCloseEngine',0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPECanCloseEngine(CrpeCanCloseEngine);
    LogResult('PECanCloseEngine',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEOpenEngineEx function                                                      }
{  - Not fully implemented in CRPE yet...                                      }
{------------------------------------------------------------------------------}
function PEOpenEngineEx (var EngineOptions: PEEngineOptions): Bool;
var
  CrpeOpenEngineEx : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    if not PELoadCrpeDll('') then
      Exit;
  end;
  {OpenEngineEx applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEOpenEngineEx requires SCR 7 or higher');
    Exit;
  end;
  CrpeOpenEngineEx := GetProcAddress(CRDEngine, 'PEOpenEngineEx');
  if CrpeOpenEngineEx = nil then
  begin
    CRDEngineError('PEOpenEngineEx');
  end
  else
  begin
    EngineOptions.structSize := SizeOf(PEEngineOptions);
    LogEvent('PEOpenEngineEx',0,@EngineOptions,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPEOpenEngineEx(CrpeOpenEngineEx)(EngineOptions);
    LogResult('PEOpenEngineEx',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEOpenPrintJob function                                                      }
{------------------------------------------------------------------------------}
function PEOpenPrintJob (reportFilePath : PChar): Smallint;
var
  CrpeOpenPrintJob : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeOpenPrintJob := GetProcAddress(CRDEngine, 'PEOpenPrintJob');
  if CrpeOpenPrintJob = nil then
  begin
    CRDEngineError('PEOpenPrintJob');
  end
  else
  begin
    LogEvent('PEOpenPrintJob',0,@reportFilePath,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPEOpenPrintJob(CrpeOpenPrintJob)(reportFilePath);
    LogResult('PEOpenPrintJob',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEClosePrintJob function                                                     }
{------------------------------------------------------------------------------}
function PEClosePrintJob (printJob : Smallint): Bool;
var
  CrpeClosePrintJob : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    {CRDEngineError(CRD_ENGINE_NOT_LOADED);}
    Exit;
  end;
  CrpeClosePrintJob := GetProcAddress(CRDEngine, 'PEClosePrintJob');
  if CrpeClosePrintJob = nil then
  begin
    CRDEngineError('PEClosePrintJob');
  end
  else
  begin
    LogEvent('PEClosePrintJob',printJob,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPEClosePrintJob(CrpeClosePrintJob)(printJob);
    LogResult('PEClosePrintJob',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEStartPrintJob function                                                     }
{------------------------------------------------------------------------------}
function PEStartPrintJob (printJob: Smallint; waitUntilDone: Bool): Bool;
var
  CrpeStartPrintJob : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeStartPrintJob := GetProcAddress(CRDEngine, 'PEStartPrintJob');
  if CrpeStartPrintJob = nil then
  begin
    CRDEngineError('PEStartPrintJob');
  end
  else
  begin
    LogEvent('PEStartPrintJob',printJob,@waitUntilDone,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPEStartPrintJob(CrpeStartPrintJob)(printJob, waitUntilDone);
    LogResult('PEStartPrintJob',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PECancelPrintJob procedure                                                   }
{------------------------------------------------------------------------------}
procedure PECancelPrintJob (printJob : Smallint);
var
  CrpeCancelPrintJob : TFarProc;
begin
  CRDEngineError('');
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeCancelPrintJob := GetProcAddress(CRDEngine, 'PECancelPrintJob');
  if CrpeCancelPrintJob = nil then
  begin
    CRDEngineError('PECancelPrintJob');
  end
  else
  begin
    LogEvent('PECancelPrintJob',printJob,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    TPECancelPrintJob(CrpeCancelPrintJob)(printJob);
  end;
end;

{------------------------------------------------------------------------------}
{ PEIsPrintJobFinished function                                                }
{------------------------------------------------------------------------------}
function PEIsPrintJobFinished (printJob : Smallint): Bool;
var
  CrpeIsPrintJobFinished : TFarProc;
begin
  CRDEngineError('');
  Result := True;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeIsPrintJobFinished := GetProcAddress(CRDEngine, 'PEIsPrintJobFinished');
  if CrpeIsPrintJobFinished = nil then
  begin
    CRDEngineError('PEIsPrintJobFinished');
  end
  else
  begin
    LogEvent('PEIsPrintJobFinished',printJob,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPEIsPrintJobFinished(CrpeIsPrintJobFinished)(printJob);
    LogResult('PEIsPrintJobFinished',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetJobStatus function                                                      }
{------------------------------------------------------------------------------}
function PEGetJobStatus (printJob: Smallint; var jobInfo: PEJobInfo): Smallint;
var
  CrpeGetJobStatus : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetJobStatus := GetProcAddress(CRDEngine, 'PEGetJobStatus');
  if CrpeGetJobStatus = nil then
  begin
    CRDEngineError('PEGetJobStatus');
  end
  else
  begin
    jobInfo.StructSize := SizeOf(PEJobInfo);
    Result := TPEGetJobStatus(CrpeGetJobStatus)(printJob, jobInfo);
    LogEvent('PEGetJobStatus',printJob,@jobInfo,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetJobStatus',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetVersion function                                                        }
{------------------------------------------------------------------------------}
function PEGetVersion (versionRequested : Smallint): Smallint;
var
  CrpeGetVersion : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetVersion := GetProcAddress(CRDEngine, 'PEGetVersion');
  if CrpeGetVersion = nil then
  begin
    CRDEngineError('CrpeGetVersion');
  end
  else
  begin
    LogEvent('PEGetVersion',0,@versionRequested,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPEGetVersion(CrpeGetVersion)(versionRequested);
    LogResult('PEGetVersion',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetErrorCode function                                                      }
{------------------------------------------------------------------------------}
function PEGetErrorCode (printJob : Smallint): Smallint;
var
  CrpeGetErrorCode : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetErrorCode := GetProcAddress(CRDEngine, 'PEGetErrorCode');
  if CrpeGetErrorCode = nil then
  begin
    CRDEngineError('PEGetErrorCode');
  end
  else
  begin
    LogEvent('PEGetErrorCode',printJob,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPEGetErrorCode(CrpeGetErrorCode)(printJob);
    LogResult('PEGetErrorCode',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetErrorText function                                                      }
{------------------------------------------------------------------------------}
function PEGetErrorText (printJob: Smallint; var textHandle: HWnd;
  var textLength: Smallint): Bool;
var
  CrpeGetErrorText : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetErrorText := GetProcAddress(CRDEngine, 'PEGetErrorText');
  if CrpeGetErrorText = nil then
  begin
    CRDEngineError('PEGetErrorText');
  end
  else
  begin
    Result := TPEGetErrorText(CrpeGetErrorText)(printJob, textHandle, textLength);
    LogEvent('PEGetErrorText',printJob,@textHandle,@textLength,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetErrorText',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetHandleString function                                                   }
{------------------------------------------------------------------------------}
function PEGetHandleString (textHandle: HWnd; buffer: PChar;
  bufferLength: Smallint): Bool;
var
  CrpeGetHandleString : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetHandleString := GetProcAddress(CRDEngine, 'PEGetHandleString');
  if CrpeGetHandleString = nil then
  begin
    CRDEngineError('PEGetHandleString');
  end
  else
  begin
    Result := TPEGetHandleString(CrpeGetHandleString)(textHandle,
      buffer, bufferLength);
    LogEvent('PEGetHandleString',0,@textHandle,@buffer,@bufferLength,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetHandleString',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEPrintReport function                                                       }
{------------------------------------------------------------------------------}
function PEPrintReport (reportFilePath: PChar; toDefaultPrinter, toWindow: Bool;
  title: PChar; left, top, width, height: integer; style: DWord;
  parentWindow: Hwnd): Smallint;
var
  CrpePrintReport : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpePrintReport := GetProcAddress(CRDEngine, 'PEPrintReport');
  if CrpePrintReport = nil then
  begin
    CRDEngineError('PEPrintReport');
  end
  else
  begin
    LogEvent('PEPrintReport',0,@reportFilePath,@toDefaultPrinter,
      @toWindow,@title,@left,@top,@width,@height,@style,@parentWindow,nil);
    Result := TPEPrintReport(CrpePrintReport)(reportFilePath,
      toDefaultPrinter, toWindow, title, left, top, width,
      height, style, parentWindow);
    LogResult('PEPrintReport',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetReportOptions function                                                  }
{------------------------------------------------------------------------------}
function PEGetReportOptions (printJob: Smallint;
  var reportOptions: PEReportOptions): Bool;
var
  CrpeGetReportOptions : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {ReportOptions applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetReportOptions requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetReportOptions := GetProcAddress(CRDEngine, 'PEGetReportOptions');
  if CrpeGetReportOptions = nil then
  begin
    CRDEngineError('PEGetReportOptions');
  end
  else
  begin
    reportOptions.structSize := SizeOf(PEReportOptions);
    Result := TPEGetReportOptions(CrpeGetReportOptions)(printJob,
      reportOptions);
    LogEvent('PEGetReportOptions',printJob,@reportOptions,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetReportOptions',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetReportOptions function                                                  }
{------------------------------------------------------------------------------}
function PESetReportOptions (printJob: Smallint;
  var ReportOptions: PEReportOptions): Bool;
var
  CrpeSetReportOptions : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {ReportOptions applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PESetReportOptions requires SCR 7 or higher');
    Exit;
  end;
  CrpeSetReportOptions := GetProcAddress(CRDEngine, 'PESetReportOptions');
  if CrpeSetReportOptions = nil then
  begin
    CRDEngineError('PESetReportOptions');
  end
  else
  begin
    reportOptions.structSize := SizeOf(PEReportOptions);
    LogEvent('PESetReportOptions',printJob,@reportOptions,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPESetReportOptions(CrpeSetReportOptions)(printJob,
      reportOptions);
    LogResult('PESetReportOptions',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEOpenSubreport function                                                     }
{------------------------------------------------------------------------------}
function PEOpenSubreport (parentJob: Smallint; subreportName: PChar): Smallint;
var
  CrpeOpenSubreport : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeOpenSubreport := GetProcAddress(CRDEngine, 'PEOpenSubreport');
  if CrpeOpenSubreport = nil then
  begin
    CRDEngineError('PEOpenSubreport');
  end
  else
  begin
    LogEvent('PEOpenSubreport',parentJob,@subreportName,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPEOpenSubreport(CrpeOpenSubreport)(parentJob, subreportName);
    LogResult('PEOpenSubreport',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PECloseSubreport function                                                    }
{------------------------------------------------------------------------------}
function PECloseSubreport (printJob: Smallint): Bool;
var
  CrpeCloseSubreport : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    {CRDEngineError(CRD_ENGINE_NOT_LOADED);}
    Exit;
  end;
  CrpeCloseSubreport := GetProcAddress(CRDEngine, 'PECloseSubreport');
  if CrpeCloseSubreport = nil then
  begin
    CRDEngineError('PECloseSubreport');
  end
  else
  begin
    LogEvent('PECloseSubreport',printJob,nil,nil,
        nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPECloseSubreport(CrpeCloseSubreport)(printJob);
    LogResult('PECloseSubreport',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNSubreportsInSection function                                           }
{------------------------------------------------------------------------------}
function PEGetNSubreportsInSection (printJob: Smallint; sectionCode: Smallint): Smallint;
var
  CrpeGetNSubreportsInSection : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNSubreportsInSection := GetProcAddress(CRDEngine, 'PEGetNSubreportsInSection');
  if CrpeGetNSubreportsInSection = nil then
  begin
    CRDEngineError('PEGetNSubreportsInSection');
  end
  else
  begin
    LogEvent('PEGetNSubreportsInSection',printJob,@sectionCode,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPEGetNSubreportsInSection(CrpeGetNSubreportsInSection)
      (printJob, sectionCode);
    LogResult('PEGetNSubreportsInSection',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthSubreportInSection function                                          }
{------------------------------------------------------------------------------}
function PEGetNthSubreportInSection (printJob: Smallint; sectionCode: Smallint;
  subreportN: Smallint): DWord;
var
  CrpeGetNthSubreportInSection : TFarProc;
begin
  CRDEngineError('');
  Result := 0;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNthSubreportInSection := GetProcAddress(CRDEngine, 'PEGetNthSubreportInSection');
  if CrpeGetNthSubreportInSection = nil then
  begin
    CRDEngineError('PEGetNthSubreportInSection');
  end
  else
  begin
    LogEvent('PEGetNthSubreportInSection',printJob,@sectionCode,@subreportN,
      nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPEGetNthSubreportInSection(CrpeGetNthSubreportInSection)
      (printJob, sectionCode, subreportN);
    LogResult('PEGetNthSubreportInSection',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetSubreportInfo function                                                  }
{------------------------------------------------------------------------------}
function PEGetSubreportInfo (printJob: Smallint; subreportHandle: DWord;
  var subreportInfo: PESubreportInfo): Bool;
var
  CrpeGetSubreportInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetSubreportInfo := GetProcAddress(CRDEngine, 'PEGetSubreportInfo');
  if CrpeGetSubreportInfo = nil then
  begin
    CRDEngineError('PEGetSubreportInfo');
  end
  else
  begin
    {SCR 7+ has extra members in SubreportInfo}
    if CRDVerMajor < 7 then
    begin
      subreportInfo.Structsize := SizeOf(PESubreportInfo56);
      subreportInfo.NLinks := 0;
      subreportInfo.IsOnDemand := 0;
    end
    else
      subreportInfo.Structsize := SizeOf(PESubreportInfo);
    Result := TPEGetSubreportInfo(CrpeGetSubreportInfo)
      (printJob, subreportHandle, subreportInfo);
    LogEvent('PEGetSubreportInfo',printJob,@subreportHandle,@subreportInfo,
      nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetSubreportInfo',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetDialogParentWindow function                                             }
{------------------------------------------------------------------------------}
function PESetDialogParentWindow (printJob: Smallint; parentWindow: HWnd): Bool;
var
  CrpeSetDialogParentWindow : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetDialogParentWindow := GetProcAddress(CRDEngine, 'PESetDialogParentWindow');
  if CrpeSetDialogParentWindow = nil then
  begin
    CRDEngineError('PESetDialogParentWindow');
  end
  else
  begin
    LogEvent('PESetDialogParentWindow',printJob,@parentWindow,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPESetDialogParentWindow(CrpeSetDialogParentWindow)
      (printJob, parentWindow);
    LogResult('PESetDialogParentWindow',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEEnableProgressDialog function                                              }
{------------------------------------------------------------------------------}
function PEEnableProgressDialog (printJob: Smallint; enable: Bool): Bool;
var
  CrpeEnableProgressDialog : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeEnableProgressDialog := GetProcAddress(CRDEngine, 'PEEnableProgressDialog');
  if CrpeEnableProgressDialog = nil then
  begin
    CRDEngineError('PEEnableProgressDialog');
  end
  else
  begin
    LogEvent('PEEnableProgressDialog',printJob,@enable,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPEEnableProgressDialog(CrpeEnableProgressDialog)(printJob, enable);
    LogResult('PEEnableProgressDialog',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetAllowPromptDialog function                                              }
{------------------------------------------------------------------------------}
function PEGetAllowPromptDialog (printJob: Smallint): Bool;
var
  CrpeGetAllowPromptDialog : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {PEGetAllowPromptDialog applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetAllowPromptDialog requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetAllowPromptDialog := GetProcAddress(CRDEngine, 'PEGetAllowPromptDialog');
  if CrpeGetAllowPromptDialog = nil then
  begin
    CRDEngineError('PEGetAllowPromptDialog');
  end
  else
  begin
    LogEvent('PEGetAllowPromptDialog',printJob,nil,nil,
        nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPEGetAllowPromptDialog(CrpeGetAllowPromptDialog)(printJob);
    LogResult('PEGetAllowPromptDialog',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetAllowPromptDialog function                                              }
{------------------------------------------------------------------------------}
function PESetAllowPromptDialog (printJob: Smallint; showPromptDialog: Bool): Bool;
var
  CrpeSetAllowPromptDialog : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {PESetAllowPromptDialog applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PESetAllowPromptDialog requires SCR 7 or higher');
    Exit;
  end;
  CrpeSetAllowPromptDialog := GetProcAddress(CRDEngine, 'PESetAllowPromptDialog');
  if CrpeSetAllowPromptDialog = nil then
  begin
    CRDEngineError('PESetAllowPromptDialog');
  end
  else
  begin
    LogEvent('PESetAllowPromptDialog',printJob,@showPromptDialog,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPESetAllowPromptDialog(CrpeSetAllowPromptDialog)
      (printJob, showPromptDialog);
    LogResult('PESetAllowPromptDialog',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetPrintDate function                                                      }
{------------------------------------------------------------------------------}
function PEGetPrintDate (printJob: Smallint; var year: Smallint;
  var month: Smallint; var day: Smallint): Bool;
var
  CrpeGetPrintDate : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetPrintDate := GetProcAddress(CRDEngine, 'PEGetPrintDate');
  if CrpeGetPrintDate = nil then
  begin
    CRDEngineError('PEGetPrintDate');
  end
  else
  begin
    Result := TPEGetPrintDate(CrpeGetPrintDate)(printJob, year, month, day);
    LogEvent('PEGetPrintDate',printJob,@year,@month,
      @day,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetPrintDate',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetPrintDate function                                                      }
{------------------------------------------------------------------------------}
function PESetPrintDate (printJob: Smallint; year: Smallint;
  month: Smallint; day: Smallint): Bool;
var
  CrpeSetPrintDate : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetPrintDate := GetProcAddress(CRDEngine, 'PESetPrintDate');
  if CrpeSetPrintDate = nil then
  begin
    CRDEngineError('PESetPrintDate');
  end
  else
  begin
    LogEvent('PESetPrintDate',printJob,@year,@month,
      @day,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPESetPrintDate(CrpeSetPrintDate)(printJob, year, month, day);
    LogResult('PESetPrintDate',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNGroups function                                                        }
{------------------------------------------------------------------------------}
function PEGetNGroups (printJob: Smallint): Smallint;
var
  CrpeGetNGroups : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNGroups := GetProcAddress(CRDEngine, 'PEGetNGroups');
  if CrpeGetNGroups = nil then
  begin
    CRDEngineError('PEGetNGroups');
  end
  else
  begin
    LogEvent('PEGetNGroups',printJob,nil,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPEGetNGroups(CrpeGetNGroups)(printJob);
    LogResult('PEGetNGroups',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetGroupCondition function                                                 }
{------------------------------------------------------------------------------}
function PEGetGroupCondition (printJob: Smallint; sectionCode: Smallint;
  var conditionFieldHandle: Hwnd; var conditionFieldLength: Smallint;
  var condition: Smallint; var sortDirection: Smallint): Bool;
var
  CrpeGetGroupCondition : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetGroupCondition := GetProcAddress(CRDEngine, 'PEGetGroupCondition');
  if CrpeGetGroupCondition = nil then
  begin
    CRDEngineError('PEGetGroupCondition');
  end
  else
  begin
    Result := TPEGetGroupCondition(CrpeGetGroupCondition)(printJob,
      sectionCode, conditionFieldHandle, conditionFieldLength,
      condition, sortDirection);
    LogEvent('PEGetGroupCondition',printJob,@sectionCode,
      @conditionFieldHandle,@conditionFieldLength,@condition,
      @sortDirection,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetGroupCondition',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetGroupCondition function                                                 }
{------------------------------------------------------------------------------}
function PESetGroupCondition (printJob: Smallint; sectionCode: Smallint;
  conditionField: PChar; condition: Smallint; sortDirection: Smallint): Bool;
var
  CrpeSetGroupCondition : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetGroupCondition := GetProcAddress(CRDEngine, 'PESetGroupCondition');
  if CrpeSetGroupCondition = nil then
  begin
    CRDEngineError('PESetGroupCondition');
  end
  else
  begin
    LogEvent('PESetGroupCondition',printJob,@sectionCode,
      @conditionField,@condition,@sortDirection,nil,nil,nil,nil,nil,nil,nil);
    Result := TPESetGroupCondition(CrpeSetGroupCondition)(printJob,
      sectionCode, conditionField, condition, sortDirection);
    LogResult('PESetGroupCondition',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetGroupOptions function                                                   }
{------------------------------------------------------------------------------}
function PEGetGroupOptions (printJob: Smallint; groupN: Smallint;
  var groupOptions: PEGroupOptions): Bool;
var
  CrpeGetGroupOptions : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {GroupOptions applies to SCR6+}
  if CRDVerMajor < 6 then
  begin
    CRDEngineError('PEGetGroupOptions requires SCR 6 or higher');
    Exit;
  end;
  CrpeGetGroupOptions := GetProcAddress(CRDEngine, 'PEGetGroupOptions');
  if CrpeGetGroupOptions = nil then
  begin
    CRDEngineError('PEGetGroupOptions');
  end
  else
  begin
    groupOptions.structSize := SizeOf(PEGroupOptions);
    Result := TPEGetGroupOptions(CrpeGetGroupOptions)(printJob,
      groupN, groupOptions);
    LogEvent('PEGetGroupOptions',printJob,@groupN,
      @groupOptions,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetGroupOptions',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetGroupOptions function                                                   }
{------------------------------------------------------------------------------}
function PESetGroupOptions (printJob: Smallint; groupN: Smallint;
  var groupOptions: PEGroupOptions): Bool;
var
  CrpeSetGroupOptions : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {GroupOptions applies to SCR6+}
  if CRDVerMajor < 6 then
  begin
    CRDEngineError('PESetGroupOptions requires SCR 6 or higher');
    Exit;
  end;
  CrpeSetGroupOptions := GetProcAddress(CRDEngine, 'PESetGroupOptions');
  if CrpeSetGroupOptions = nil then
  begin
    CRDEngineError('PESetGroupOptions');
  end
  else
  begin
    groupOptions.structSize := SizeOf(PEGroupOptions);
    LogEvent('PESetGroupOptions',printJob,@groupN,
      @groupOptions,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPESetGroupOptions(CrpeSetGroupOptions)(printJob,
      groupN, groupOptions);
    LogResult('PESetGroupOptions',Result,0);
  end;
end;

{Stopped logging here!}

{------------------------------------------------------------------------------}
{ PEGetNSections function                                                      }
{------------------------------------------------------------------------------}
function PEGetNSections (printJob: Smallint): Smallint;
var
  CrpeGetNSections : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNSections := GetProcAddress(CRDEngine, 'PEGetNSections');
  if CrpeGetNSections = nil then
  begin
    CRDEngineError('PEGetNSections');
  end
  else
  begin
    Result := TPEGetNSections(CrpeGetNSections)(printJob);
    LogEvent('PEGetNSections',printJob,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNSections',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetSectionCode function                                                    }
{------------------------------------------------------------------------------}
function PEGetSectionCode (printJob: Smallint; sectionN: Smallint): Smallint;
var
  CrpeGetSectionCode : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetSectionCode := GetProcAddress(CRDEngine, 'PEGetSectionCode');
  if CrpeGetSectionCode = nil then
  begin
    CRDEngineError('PEGetSectionCode');
  end
  else
  begin
    Result := TPEGetSectionCode(CrpeGetSectionCode)(printJob, sectionN);
    LogEvent('PEGetSectionCode',printJob,@sectionN,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetSectionCode',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetMinimumSectionHeight function                                           }
{------------------------------------------------------------------------------}
function PEGetMinimumSectionHeight (printJob: Smallint; sectionCode: Smallint;
  var minimumHeight: Smallint): Bool;
var
  CrpeGetMinimumSectionHeight : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetMinimumSectionHeight := GetProcAddress(CRDEngine, 'PEGetMinimumSectionHeight');
  if CrpeGetMinimumSectionHeight = nil then
  begin
    CRDEngineError('PEGetMinimumSectionHeight');
  end
  else
  begin
    Result := TPEGetMinimumSectionHeight(CrpeGetMinimumSectionHeight)
      (printJob, sectionCode, minimumHeight);
    LogEvent('PEGetMinimumSectionHeight',printJob,@sectionCode,
      @minimumHeight,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetMinimumSectionHeight',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetMinimumSectionHeight function                                           }
{------------------------------------------------------------------------------}
function PESetMinimumSectionHeight (printJob: Smallint; sectionCode: Smallint;
  minimumHeight: Smallint): Bool;
var
  CrpeSetMinimumSectionHeight : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetMinimumSectionHeight := GetProcAddress(CRDEngine, 'PESetMinimumSectionHeight');
  if CrpeSetMinimumSectionHeight = nil then
  begin
    CRDEngineError('PESetMinimumSectionHeight');
  end
  else
  begin
    Result := TPESetMinimumSectionHeight(CrpeSetMinimumSectionHeight)
      (printJob, sectionCode, minimumHeight);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetSectionHeight function                                                  }
{------------------------------------------------------------------------------}
function PEGetSectionHeight (printJob: Smallint; sectionCode: Smallint;
  var Height: Smallint): Bool;
var
  CrpeGetSectionHeight : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {SectionHeight applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetSectionHeight requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetSectionHeight := GetProcAddress(CRDEngine, 'PEGetSectionHeight');
  if CrpeGetSectionHeight = nil then
  begin
    CRDEngineError('PEGetSectionHeight');
  end
  else
  begin
    Result := TPEGetSectionHeight(CrpeGetSectionHeight)
      (printJob, sectionCode, Height);
    LogEvent('PEGetSectionHeight',printJob,@sectionCode,
      @Height,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetSectionHeight',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetSectionHeight function                                                  }
{------------------------------------------------------------------------------}
function PESetSectionHeight (printJob: Smallint; sectionCode: Smallint;
  Height: Smallint): Bool;
var
  CrpeSetSectionHeight : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {SectionHeight applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PESetSectionHeight requires SCR 7 or higher');
    Exit;
  end;
  CrpeSetSectionHeight := GetProcAddress(CRDEngine, 'PESetSectionHeight');
  if CrpeSetSectionHeight = nil then
  begin
    CRDEngineError('PESetSectionHeight');
  end
  else
  begin
    Result := TPESetSectionHeight(CrpeSetSectionHeight)
      (printJob, sectionCode, Height);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetSectionFormat function                                                  }
{------------------------------------------------------------------------------}
function PEGetSectionFormat (printJob: Smallint; sectionCode: Smallint;
  var options: PESectionOptions): Bool;
var
  CrpeGetSectionFormat : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetSectionFormat := GetProcAddress(CRDEngine, 'PEGetSectionFormat');
  if CrpeGetSectionFormat = nil then
  begin
    CRDEngineError('PEGetSectionFormat');
  end
  else
  begin
    options.structSize := SizeOf(PESectionOptions);
    Result := TPEGetSectionFormat(CrpeGetSectionFormat)
      (printJob, sectionCode, options);
    LogEvent('PEGetSectionFormat',printJob,@sectionCode,
      @options,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetSectionFormat',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetSectionFormat function                                                  }
{------------------------------------------------------------------------------}
function PESetSectionFormat (printJob: Smallint; sectionCode: Smallint;
  var options: PESectionOptions): Bool;
var
  CrpeSetSectionFormat : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetSectionFormat := GetProcAddress(CRDEngine, 'PESetSectionFormat');
  if CrpeSetSectionFormat = nil then
  begin
    CRDEngineError('PESetSectionFormat');
  end
  else
  begin
    options.structSize := SizeOf(PESectionOptions);
    Result := TPESetSectionFormat(CrpeSetSectionFormat)
      (printJob, sectionCode, options);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetAreaFormat function                                                     }
{------------------------------------------------------------------------------}
function PEGetAreaFormat (printJob: Smallint; areaCode: Smallint;
  var options: PESectionOptions): Bool;
var
  CrpeGetAreaFormat : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetAreaFormat := GetProcAddress(CRDEngine, 'PEGetAreaFormat');
  if CrpeGetAreaFormat = nil then
  begin
    CRDEngineError('PEGetAreaFormat');
  end
  else
  begin
    options.structSize := SizeOf(PESectionOptions);
    Result := TPEGetAreaFormat(CrpeGetAreaFormat)
      (printJob, areaCode, options);
    LogEvent('PEGetAreaFormat',printJob,@areaCode,
      @options,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetAreaFormat',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetAreaFormat function                                                     }
{------------------------------------------------------------------------------}
function PESetAreaFormat (printJob: Smallint; areaCode: Smallint;
  var options: PESectionOptions): Bool;
var
  CrpeSetAreaFormat : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetAreaFormat := GetProcAddress(CRDEngine, 'PESetAreaFormat');
  if CrpeSetAreaFormat = nil then
  begin
    CRDEngineError('PESetAreaFormat');
  end
  else
  begin
    options.structSize := SizeOf(PESectionOptions);
    Result := TPESetAreaFormat(CrpeSetAreaFormat)
      (printJob, areaCode, options);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetFont function                                                           }
{------------------------------------------------------------------------------}
function PESetFont (printJob: Smallint; sectionCode: Smallint;
  scopeCode: Smallint; faceName: PChar; fontFamily: Smallint;
  fontPitch: Smallint; charSet: Smallint; pointSize: Smallint;
  isItalic: Smallint; isUnderlined: Smallint; isStruckOut: Smallint;
  weight: Smallint): Bool;
var
  CrpeSetFont : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetFont := GetProcAddress(CRDEngine, 'PESetFont');
  if CrpeSetFont = nil then
  begin
    CRDEngineError('PESetFont');
  end
  else
  begin
    Result := TPESetFont(CrpeSetFont)(printJob, sectionCode, scopeCode,
      faceName, fontFamily, fontPitch, charSet, pointSize, isItalic,
      isUnderlined, isStruckOut, weight);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetGraphType function                                                      }
{------------------------------------------------------------------------------}
function PEGetGraphType (printJob: Smallint; sectionCode: Smallint;
  graphN: Smallint; var graphType: Smallint): Bool;
var
  CrpeGetGraphType : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetGraphType := GetProcAddress(CRDEngine, 'PEGetGraphType');
  if CrpeGetGraphType = nil then
  begin
    CRDEngineError('PEGetGraphType');
  end
  else
  begin
    Result := TPEGetGraphType(CrpeGetGraphType)(printJob, sectionCode,
      graphN, graphType);
    LogEvent('PEGetGraphType',printJob,@sectionCode,
      @graphN,@graphType,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetGraphType',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetGraphType function                                                      }
{------------------------------------------------------------------------------}
function PESetGraphType (printJob: Smallint; sectionCode: Smallint;
  graphN: Smallint; var graphType: Smallint): Bool;
var
  CrpeSetGraphType : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetGraphType := GetProcAddress(CRDEngine, 'PESetGraphType');
  if CrpeSetGraphType = nil then
  begin
    CRDEngineError('PESetGraphType');
  end
  else
  begin
    Result := TPESetGraphType(CrpeSetGraphType)(printJob, sectionCode,
      graphN, graphType);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetGraphTypeInfo function                                                  }
{------------------------------------------------------------------------------}
function PEGetGraphTypeInfo (printJob: Smallint; sectionN: Smallint;
  graphN: Smallint; var graphTypeInfo: PEGraphTypeInfo): Bool;
var
  CrpeGetGraphTypeInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {GraphTypeInfo applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetGraphTypeInfo requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetGraphTypeInfo := GetProcAddress(CRDEngine, 'PEGetGraphTypeInfo');
  if CrpeGetGraphTypeInfo = nil then
  begin
    CRDEngineError('PEGetGraphTypeInfo');
  end
  else
  begin
    graphTypeInfo.structSize := SizeOf(PEGraphTypeInfo);
    Result := TPEGetGraphTypeInfo(CrpeGetGraphTypeInfo)(printJob,
      sectionN, graphN, graphTypeInfo);
    LogEvent('PEGetGraphTypeInfo',printJob,@sectionN,
      @graphN,@graphTypeInfo,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetGraphTypeInfo',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetGraphTypeInfo function                                                  }
{------------------------------------------------------------------------------}
function PESetGraphTypeInfo (printJob: Smallint; sectionN: Smallint;
  graphN: Smallint; var graphTypeInfo: PEGraphTypeInfo): Bool;
var
  CrpeSetGraphTypeInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {GraphTypeInfo applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PESetGraphTypeInfo requires SCR 7 or higher');
    Exit;
  end;
  CrpeSetGraphTypeInfo := GetProcAddress(CRDEngine, 'PESetGraphTypeInfo');
  if CrpeSetGraphTypeInfo = nil then
  begin
    CRDEngineError('PESetGraphTypeInfo');
  end
  else
  begin
    graphTypeInfo.structSize := SizeOf(PEGraphTypeInfo);
    Result := TPESetGraphTypeInfo(CrpeSetGraphTypeInfo)(printJob,
      sectionN, graphN, graphTypeInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetGraphText function                                                      }
{------------------------------------------------------------------------------}
function PEGetGraphText (printJob: Smallint; sectionCode: Smallint;
  graphN: Smallint; var graphTextInfo: PEGraphTextInfo): Bool;
var
  CrpeGetGraphText : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetGraphText := GetProcAddress(CRDEngine, 'PEGetGraphText');
  if CrpeGetGraphText = nil then
  begin
    CRDEngineError('PEGetGraphText');
  end
  else
  begin
    graphTextInfo.structSize := SizeOf(PEGraphTextInfo);
    Result := TPEGetGraphText(CrpeGetGraphText)(printJob,
      sectionCode, graphN, graphTextInfo);
    LogEvent('PEGetGraphText',printJob,@sectionCode,
      @graphN,@graphTextInfo,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetGraphText',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetGraphText function                                                      }
{------------------------------------------------------------------------------}
function PESetGraphText (printJob: Smallint; sectionCode: Smallint;
  graphN: Smallint; var graphTextInfo: PEGraphTextInfo): Bool;
var
  CrpeSetGraphText : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetGraphText := GetProcAddress(CRDEngine, 'PESetGraphText');
  if CrpeSetGraphText = nil then
  begin
    CRDEngineError('PESetGraphText');
  end
  else
  begin
    graphTextInfo.structSize := SizeOf(PEGraphTextInfo);
    Result := TPESetGraphText(CrpeSetGraphText)(printJob,
      sectionCode, graphN, graphTextInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetGraphTextInfo function                                                  }
{------------------------------------------------------------------------------}
function PEGetGraphTextInfo (printJob: Smallint; sectionN: Smallint;
  graphN: Smallint; titleType: Word; var title: Hwnd;
  var titleLength: Smallint): Bool;
var
  CrpeGetGraphTextInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {GraphTextInfo applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetGraphTextInfo requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetGraphTextInfo := GetProcAddress(CRDEngine, 'PEGetGraphTextInfo');
  if CrpeGetGraphTextInfo = nil then
  begin
    CRDEngineError('PEGetGraphTextInfo');
  end
  else
  begin
    Result := TPEGetGraphTextInfo(CrpeGetGraphTextInfo)(printJob,
      sectionN, graphN, titleType, title, titleLength);
    LogEvent('PEGetGraphTextInfo',printJob,@sectionN,
      @graphN,@titleType,@title,@titleLength,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetGraphTextInfo',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetGraphTextInfo function                                                  }
{------------------------------------------------------------------------------}
function PESetGraphTextInfo (printJob: Smallint; sectionN: Smallint;
  graphN: Smallint; titleType: Word; title: PChar): Bool;
var
  CrpeSetGraphTextInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {GraphTextInfo applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PESetGraphTextInfo requires SCR 7 or higher');
    Exit;
  end;
  CrpeSetGraphTextInfo := GetProcAddress(CRDEngine, 'PESetGraphTextInfo');
  if CrpeSetGraphTextInfo = nil then
  begin
    CRDEngineError('PESetGraphTextInfo');
  end
  else
  begin
    Result := TPESetGraphTextInfo(CrpeSetGraphTextInfo)(printJob,
      sectionN, graphN, titleType, title);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetGraphFontInfo function                                                  }
{------------------------------------------------------------------------------}
function PEGetGraphFontInfo (printJob: Smallint; sectionN: Smallint;
  graphN: Smallint; titleFontType: Word; var fontColorInfo: PEFontColorInfo): Bool;
var
  CrpeGetGraphFontInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {GraphFontInfo applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetGraphFontInfo requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetGraphFontInfo := GetProcAddress(CRDEngine, 'PEGetGraphFontInfo');
  if CrpeGetGraphFontInfo = nil then
  begin
    CRDEngineError('PEGetGraphFontInfo');
  end
  else
  begin
    fontColorInfo.structSize := SizeOf(PEFontColorInfo);
    Result := TPEGetGraphFontInfo(CrpeGetGraphFontInfo)(printJob,
      sectionN, graphN, titleFontType, fontColorInfo);
    LogEvent('PEGetGraphFontInfo',printJob,@sectionN,
      @graphN,@titleFontType,@fontColorInfo,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetGraphFontInfo',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetGraphFontInfo function                                                  }
{------------------------------------------------------------------------------}
function PESetGraphFontInfo (printJob: Smallint; sectionN: Smallint;
  graphN: Smallint; titleFontType: Word; var fontColorInfo: PEFontColorInfo): Bool;
var
  CrpeSetGraphFontInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {GraphFontInfo applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PESetGraphFontInfo requires SCR 7 or higher');
    Exit;
  end;
  CrpeSetGraphFontInfo := GetProcAddress(CRDEngine, 'PESetGraphFontInfo');
  if CrpeSetGraphFontInfo = nil then
  begin
    CRDEngineError('PESetGraphFontInfo');
  end
  else
  begin
    fontColorInfo.structSize := SizeOf(PEFontColorInfo);
    Result := TPESetGraphFontInfo(CrpeSetGraphFontInfo)(printJob,
      sectionN, graphN, titleFontType, fontColorInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetGraphOptions function                                                   }
{------------------------------------------------------------------------------}
function PEGetGraphOptions (printJob: Smallint; sectionCode: Smallint;
  graphN: Smallint; var graphOptions: PEGraphOptions): Bool;
var
  CrpeGetGraphOptions : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetGraphOptions := GetProcAddress(CRDEngine, 'PEGetGraphOptions');
  if CrpeGetGraphOptions = nil then
  begin
    CRDEngineError('PEGetGraphOptions');
  end
  else
  begin
    graphOptions.structSize := SizeOf(PEGraphOptions);
    Result := TPEGetGraphOptions(CrpeGetGraphOptions)(printJob,
      sectionCode, graphN, graphOptions);
    LogEvent('PEGetGraphOptions',printJob,@sectionCode,
      @graphN,@graphOptions,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetGraphOptions',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetGraphOptions function                                                   }
{------------------------------------------------------------------------------}
function PESetGraphOptions (printJob: Smallint; sectionCode: Smallint;
  graphN: Smallint; var graphOptions: PEGraphOptions): Bool;
var
  CrpeSetGraphOptions : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetGraphOptions := GetProcAddress(CRDEngine, 'PESetGraphOptions');
  if CrpeSetGraphOptions = nil then
  begin
    CRDEngineError('PESetGraphOptions');
  end
  else
  begin
    graphOptions.structSize := SizeOf(PEGraphOptions);
    Result := TPESetGraphOptions(CrpeSetGraphOptions)(printJob,
      sectionCode, graphN, graphOptions);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetGraphOptionInfo function                                                }
{------------------------------------------------------------------------------}
function PEGetGraphOptionInfo (printJob: Smallint; sectionN: Smallint;
  graphN: Smallint; var graphOptionInfo: PEGraphOptionInfo): Bool;
var
  CrpeGetGraphOptionInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {GraphOptionInfo applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetGraphOptionInfo requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetGraphOptionInfo := GetProcAddress(CRDEngine, 'PEGetGraphOptionInfo');
  if CrpeGetGraphOptionInfo = nil then
  begin
    CRDEngineError('PEGetGraphOptionInfo');
  end
  else
  begin
    graphOptionInfo.structSize := SizeOf(PEGraphOptionInfo);
    Result := TPEGetGraphOptionInfo(CrpeGetGraphOptionInfo)(printJob,
      sectionN, graphN, graphOptionInfo);
    LogEvent('PEGetGraphOptionInfo',printJob,@sectionN,
      @graphN,@graphOptionInfo,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetGraphOptionInfo',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetGraphOptionInfo function                                                }
{------------------------------------------------------------------------------}
function PESetGraphOptionInfo (printJob: Smallint; sectionN: Smallint;
  graphN: Smallint; var graphOptionInfo: PEGraphOptionInfo): Bool;
var
  CrpeSetGraphOptionInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {GraphOptionInfo applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PESetGraphOptionInfo requires SCR 7 or higher');
    Exit;
  end;
  CrpeSetGraphOptionInfo := GetProcAddress(CRDEngine, 'PESetGraphOptionInfo');
  if CrpeSetGraphOptionInfo = nil then
  begin
    CRDEngineError('PESetGraphOptionInfo');
  end
  else
  begin
    graphOptionInfo.structSize := SizeOf(PEGraphOptionInfo);
    Result := TPESetGraphOptionInfo(CrpeSetGraphOptionInfo)(printJob,
      sectionN, graphN, graphOptionInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetGraphData function                                                      }
{------------------------------------------------------------------------------}
function PEGetGraphData (printJob: Smallint; sectionCode: Smallint;
  graphN: Smallint; var graphDataInfo: PEGraphDataInfo): Bool;
var
  CrpeGetGraphData : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetGraphData := GetProcAddress(CRDEngine, 'PEGetGraphData');
  if CrpeGetGraphData = nil then
  begin
    CRDEngineError('PEGetGraphData');
  end
  else
  begin
    graphDataInfo.structSize := SizeOf(PEGraphDataInfo);
    Result := TPEGetGraphData(CrpeGetGraphData)(printJob, sectionCode,
      graphN, graphDataInfo);
    LogEvent('PEGetGraphData',printJob,@sectionCode,
      @graphN,@graphDataInfo,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetGraphData',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetGraphData function                                                      }
{------------------------------------------------------------------------------}
function PESetGraphData (printJob: Smallint; sectionCode: Smallint;
  graphN: Smallint; var graphDataInfo: PEGraphDataInfo): Bool;
var
  CrpeSetGraphData : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetGraphData := GetProcAddress(CRDEngine, 'PESetGraphData');
  if CrpeSetGraphData = nil then
  begin
    CRDEngineError('PESetGraphData');
  end
  else
  begin
    graphDataInfo.structSize := SizeOf(PEGraphDataInfo);
    Result := TPESetGraphData(CrpeSetGraphData)(printJob, sectionCode,
      graphN, graphDataInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetGraphAxisInfo function                                                  }
{------------------------------------------------------------------------------}
function PEGetGraphAxisInfo (printJob: Smallint; sectionN: Smallint;
  graphN: Smallint; var graphAxisInfo: PEGraphAxisInfo): Bool;
var
  CrpeGetGraphAxisInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {GraphAxisInfo applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetGraphAxisInfo requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetGraphAxisInfo := GetProcAddress(CRDEngine, 'PEGetGraphAxisInfo');
  if CrpeGetGraphAxisInfo = nil then
  begin
    CRDEngineError('PEGetGraphAxisInfo');
  end
  else
  begin
    graphAxisInfo.structSize := SizeOf(PEGraphAxisInfo);
    Result := TPEGetGraphAxisInfo(CrpeGetGraphAxisInfo)(printJob, sectionN,
      graphN, graphAxisInfo);
    LogEvent('PEGetGraphAxisInfo',printJob,@sectionN,
      @graphN,@graphAxisInfo,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetGraphAxisInfo',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetGraphAxisInfo function                                                  }
{------------------------------------------------------------------------------}
function PESetGraphAxisInfo (printJob: Smallint; sectionN: Smallint;
  graphN: Smallint; var graphAxisInfo: PEGraphAxisInfo): Bool;
var
  CrpeSetGraphAxisInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {GraphAxisInfo applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PESetGraphAxisInfo requires SCR 7 or higher');
    Exit;
  end;
  CrpeSetGraphAxisInfo := GetProcAddress(CRDEngine, 'PESetGraphAxisInfo');
  if CrpeSetGraphAxisInfo = nil then
  begin
    CRDEngineError('PESetGraphAxisInfo');
  end
  else
  begin
    graphAxisInfo.structSize := SizeOf(PEGraphAxisInfo);
    Result := TPESetGraphAxisInfo(CrpeSetGraphAxisInfo)(printJob, sectionN,
      graphN, graphAxisInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNFormulas function                                                      }
{------------------------------------------------------------------------------}
function PEGetNFormulas (printJob: Smallint): Smallint;
var
  CrpeGetNFormulas : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNFormulas := GetProcAddress(CRDEngine, 'PEGetNFormulas');
  if CrpeGetNFormulas = nil then
  begin
    CRDEngineError('PEGetNFormulas');
  end
  else
  begin
    Result := TPEGetNFormulas(CrpeGetNFormulas)(printJob);
    LogEvent('PEGetNFormulas',printJob,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNFormulas',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthFormula function                                                     }
{------------------------------------------------------------------------------}
function PEGetNthFormula (printJob: Smallint; formulaN: Smallint;
  var nameHandle: Hwnd; var nameLength: Smallint; var textHandle: Hwnd;
  var textLength: Smallint): Bool;
var
  CrpeGetNthFormula : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNthFormula := GetProcAddress(CRDEngine, 'PEGetNthFormula');
  if CrpeGetNthFormula = nil then
  begin
    CRDEngineError('PEGetNthFormula');
  end
  else
  begin
    Result := TPEGetNthFormula(CrpeGetNthFormula)(printJob, formulaN,
      nameHandle, nameLength, textHandle, textLength);
    LogEvent('PEGetNthFormula',printJob,@formulaN,
      @nameHandle,@nameLength,@textHandle,@textLength,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNthFormula',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetFormula function                                                        }
{------------------------------------------------------------------------------}
function PEGetFormula (printJob: Smallint; formulaName: PChar;
  var textHandle: HWnd; var textLength: Smallint): Bool;
var
  CrpeGetFormula : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetFormula := GetProcAddress(CRDEngine, 'PEGetFormula');
  if CrpeGetFormula = nil then
  begin
    CRDEngineError('PEGetFormula');
  end
  else
  begin
    Result := TPEGetFormula(CrpeGetFormula)(printJob, formulaName,
      textHandle, textLength);
    LogEvent('PEGetFormula',printJob,@formulaName,
      @textHandle,@textLength,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetFormula',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetFormula function                                                        }
{------------------------------------------------------------------------------}
function PESetFormula (printJob: Smallint; formulaName: PChar;
  formulaString: PChar): Bool;
var
  CrpeSetFormula : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetFormula := GetProcAddress(CRDEngine, 'PESetFormula');
  if CrpeSetFormula = nil then
  begin
    CRDEngineError('PESetFormula');
  end
  else
  begin
    Result := TPESetFormula(CrpeSetFormula)(printJob, formulaName,
      formulaString);
  end;
end;

{------------------------------------------------------------------------------}
{ PECheckFormula function                                                      }
{------------------------------------------------------------------------------}
function PECheckFormula (printJob: Smallint; formulaName: PChar): Bool;
var
  CrpeCheckFormula : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeCheckFormula := GetProcAddress(CRDEngine, 'PECheckFormula');
  if CrpeCheckFormula = nil then
  begin
    CRDEngineError('PECheckFormula');
  end
  else
  begin
    Result := TPECheckFormula(CrpeCheckFormula)(printJob, formulaName);
    LogEvent('PECheckFormula',printJob,@formulaName,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PECheckFormula',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetSelectionFormula function                                               }
{------------------------------------------------------------------------------}
function PEGetSelectionFormula (printJob: Smallint; var textHandle: HWnd;
  var textLength: Smallint): Bool;
var
  CrpeGetSelectionFormula : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetSelectionFormula := GetProcAddress(CRDEngine, 'PEGetSelectionFormula');
  if CrpeGetSelectionFormula = nil then
  begin
    CRDEngineError('PEGetSelectionFormula');
  end
  else
  begin
    Result := TPEGetSelectionFormula(CrpeGetSelectionFormula)(printJob,
      textHandle, textLength);
    LogEvent('PEGetSelectionFormula',printJob,@textHandle,
      @textLength,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetSelectionFormula',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetSelectionFormula function                                               }
{------------------------------------------------------------------------------}
function PESetSelectionFormula (printJob: Smallint; formulaString: PChar): Bool;
var
  CrpeSetSelectionFormula : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetSelectionFormula := GetProcAddress(CRDEngine, 'PESetSelectionFormula');
  if CrpeSetSelectionFormula = nil then
  begin
    CRDEngineError('PESetSelectionFormula');
  end
  else
  begin
    Result := TPESetSelectionFormula(CrpeSetSelectionFormula)(printJob,
      formulaString);
  end;
end;

{------------------------------------------------------------------------------}
{ PECheckSelectionFormula function                                             }
{------------------------------------------------------------------------------}
function PECheckSelectionFormula (printJob: Smallint): Bool;
var
  CrpeCheckSelectionFormula : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeCheckSelectionFormula := GetProcAddress(CRDEngine, 'PECheckSelectionFormula');
  if CrpeCheckSelectionFormula = nil then
  begin
    CRDEngineError('PECheckSelectionFormula');
  end
  else
  begin
    Result := TPECheckSelectionFormula(CrpeCheckSelectionFormula)(printJob);
    LogEvent('PECheckSelectionFormula',printJob,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PECheckSelectionFormula',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetGroupSelectionFormula function                                          }
{------------------------------------------------------------------------------}
function PEGetGroupSelectionFormula (printJob: Smallint; var textHandle: HWnd;
  var textLength: Smallint): Bool;
var
  CrpeGetGroupSelectionFormula : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetGroupSelectionFormula := GetProcAddress(CRDEngine, 'PEGetGroupSelectionFormula');
  if CrpeGetGroupSelectionFormula = nil then
  begin
    CRDEngineError('PEGetGroupSelectionFormula');
  end
  else
  begin
    Result := TPEGetGroupSelectionFormula(CrpeGetGroupSelectionFormula)
      (printJob, textHandle, textLength);
    LogEvent('PEGetGroupSelectionFormula',printJob,@textHandle,
      @textLength,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetGroupSelectionFormula',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetGroupSelectionFormula function                                          }
{------------------------------------------------------------------------------}
function PESetGroupSelectionFormula (printJob: Smallint; formulaString: PChar): Bool;
var
  CrpeSetGroupSelectionFormula : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetGroupSelectionFormula := GetProcAddress(CRDEngine, 'PESetGroupSelectionFormula');
  if CrpeSetGroupSelectionFormula = nil then
  begin
    CRDEngineError('PESetGroupSelectionFormula');
  end
  else
  begin
    Result := TPESetGroupSelectionFormula(CrpeSetGroupSelectionFormula)
      (printJob, formulaString);
  end;
end;

{------------------------------------------------------------------------------}
{ PECheckGroupSelectionFormula function                                        }
{------------------------------------------------------------------------------}
function PECheckGroupSelectionFormula (printJob: Smallint): Bool;
var
  CrpeCheckGroupSelectionFormula : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeCheckGroupSelectionFormula := GetProcAddress(CRDEngine, 'PECheckGroupSelectionFormula');
  if CrpeCheckGroupSelectionFormula = nil then
  begin
    CRDEngineError('PECheckGroupSelectionFormula');
  end
  else
  begin
    Result := TPECheckGroupSelectionFormula(CrpeCheckGroupSelectionFormula)
      (printJob);
    LogEvent('PECheckGroupSelectionFormula',printJob,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PECheckGroupSelectionFormula',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetSectionFormatFormula function                                           }
{------------------------------------------------------------------------------}
function PEGetSectionFormatFormula (printJob: Smallint; sectionCode: Smallint;
  formulaName: Smallint; var textHandle: HWnd; var textLength: Smallint): Bool;
var
  CrpeGetSectionFormatFormula : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetSectionFormatFormula := GetProcAddress(CRDEngine, 'PEGetSectionFormatFormula');
  if CrpeGetSectionFormatFormula = nil then
  begin
    CRDEngineError('PEGetSectionFormatFormula');
  end
  else
  begin
    Result := TPEGetSectionFormatFormula(CrpeGetSectionFormatFormula)
      (printJob, sectionCode, formulaName, textHandle, textLength);
    LogEvent('PEGetSectionFormatFormula',printJob,@sectionCode,
      @formulaName,@textHandle,@textLength,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetSectionFormatFormula',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetSectionFormatFormula function                                           }
{------------------------------------------------------------------------------}
function PESetSectionFormatFormula (printJob: Smallint; sectionCode: Smallint;
  formulaName: Smallint; formulaString: PChar): Bool;
var
  CrpeSetSectionFormatFormula : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetSectionFormatFormula := GetProcAddress(CRDEngine, 'PESetSectionFormatFormula');
  if CrpeSetSectionFormatFormula = nil then
  begin
    CRDEngineError('PEGetSectionFormatFormula');
  end
  else
  begin
    LogEvent('PESetSectionFormatFormula',printJob,@sectionCode,
      @formulaName,@formulaString,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPESetSectionFormatFormula(CrpeSetSectionFormatFormula)
      (printJob, sectionCode, formulaName, formulaString);
    LogResult('PESetSectionFormatFormula',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetAreaFormatFormula function                                              }
{------------------------------------------------------------------------------}
function PEGetAreaFormatFormula (printJob: Smallint; areaCode: Smallint;
  formulaName: Smallint; var textHandle: HWnd; var textLength: Smallint): Bool;
var
  CrpeGetAreaFormatFormula : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetAreaFormatFormula := GetProcAddress(CRDEngine, 'PEGetAreaFormatFormula');
  if CrpeGetAreaFormatFormula = nil then
  begin
    CRDEngineError('PEGetAreaFormatFormula');
  end
  else
  begin
    Result := TPEGetAreaFormatFormula(CrpeGetAreaFormatFormula)
      (printJob, areaCode, formulaName, textHandle, textLength);
    LogEvent('PEGetAreaFormatFormula',printJob,@areaCode,
      @formulaName,@textHandle,@textLength,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetAreaFormatFormula',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetAreaFormatFormula function                                              }
{------------------------------------------------------------------------------}
function PESetAreaFormatFormula (printJob: Smallint; areaCode: Smallint;
  formulaName: Smallint; formulaString: PChar): Bool;
var
  CrpeSetAreaFormatFormula : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetAreaFormatFormula := GetProcAddress(CRDEngine, 'PESetAreaFormatFormula');
  if CrpeSetAreaFormatFormula = nil then
  begin
    CRDEngineError('PESetAreaFormatFormula');
  end
  else
  begin
    Result := TPESetAreaFormatFormula(CrpeSetAreaFormatFormula)
      (printJob, areaCode, formulaName, formulaString);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNSQLExpressions function                                                }
{------------------------------------------------------------------------------}
function PEGetNSQLExpressions (printJob: Smallint): Smallint;
var
  CrpeGetNSQLExpressions : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {SQLExpressions applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetNSQLExpressions requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetNSQLExpressions := GetProcAddress(CRDEngine, 'PEGetNSQLExpressions');
  if CrpeGetNSQLExpressions = nil then
  begin
    CRDEngineError('PEGetNSQLExpressions');
  end
  else
  begin
    Result := TPEGetNSQLExpressions(CrpeGetNSQLExpressions)(printJob);
    LogEvent('PEGetNSQLExpressions',printJob,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNSQLExpressions',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthSQLExpression function                                               }
{------------------------------------------------------------------------------}
function PEGetNthSQLExpression (printJob: Smallint; expressionN: Smallint;
  var nameHandle: Hwnd; var nameLength: Smallint; var textHandle: Hwnd;
  var textLength: Smallint): Bool;
var
  CrpeGetNthSQLExpression : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {SQLExpressions applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetNthSQLExpression requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetNthSQLExpression := GetProcAddress(CRDEngine, 'PEGetNthSQLExpression');
  if CrpeGetNthSQLExpression = nil then
  begin
    CRDEngineError('PEGetNthSQLExpression');
  end
  else
  begin
    Result := TPEGetNthSQLExpression(CrpeGetNthSQLExpression)(printJob,
      expressionN, nameHandle, nameLength, textHandle, textLength);
    LogEvent('PEGetNthSQLExpression',printJob,@expressionN,
      @nameHandle,@nameLength,@textHandle,@textLength,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNthSQLExpression',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetSQLExpression function                                                  }
{------------------------------------------------------------------------------}
function PEGetSQLExpression (printJob: Smallint; const expressionName: PChar;
  var textHandle: Hwnd; var textLength: Smallint): Bool;
var
  CrpeGetSQLExpression : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {SQLExpressions applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetSQLExpression requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetSQLExpression := GetProcAddress(CRDEngine, 'PEGetSQLExpression');
  if CrpeGetSQLExpression = nil then
  begin
    CRDEngineError('PEGetSQLExpression');
  end
  else
  begin
    Result := TPEGetSQLExpression(CrpeGetSQLExpression)(printJob,
      expressionName, textHandle, textLength);
    LogEvent('PEGetSQLExpression',printJob,@expressionName,
      @textHandle,@textLength,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetSQLExpression',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetSQLExpression function                                                  }
{------------------------------------------------------------------------------}
function PESetSQLExpression (printJob: Smallint; const expressionName: PChar;
  const expressionString: PChar): Bool;
var
  CrpeSetSQLExpression : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {SQLExpressions applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PESetSQLExpression requires SCR 7 or higher');
    Exit;
  end;
  CrpeSetSQLExpression := GetProcAddress(CRDEngine, 'PESetSQLExpression');
  if CrpeSetSQLExpression = nil then
  begin
    CRDEngineError('PESetSQLExpression');
  end
  else
  begin
    Result := TPESetSQLExpression(CrpeSetSQLExpression)(printJob,
      expressionName, expressionString);
    LogEvent('PESetSQLExpression',printJob,@expressionName,
      @expressionString,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PESetSQLExpression',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PECheckSQLExpression function                                                }
{------------------------------------------------------------------------------}
function PECheckSQLExpression (printJob: Smallint; const expressionName: PChar): Bool;
var
  CrpeCheckSQLExpression : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {SQLExpressions applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PECheckSQLExpression requires SCR 7 or higher');
    Exit;
  end;
  CrpeCheckSQLExpression := GetProcAddress(CRDEngine, 'PECheckSQLExpression');
  if CrpeCheckSQLExpression = nil then
  begin
    CRDEngineError('PECheckSQLExpression');
  end
  else
  begin
    Result := TPECheckSQLExpression(CrpeCheckSQLExpression)(printJob,
      expressionName);
    LogEvent('PECheckSQLExpression',printJob,@expressionName,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PECheckSQLExpression',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNParams function                                                        }
{------------------------------------------------------------------------------}
function PEGetNParams (printJob: Smallint): Smallint;
var
  CrpeGetNParams : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {Params applies to SCR6 and down}
  if CRDVerMajor > 6 then
  begin
    CRDEngineError('PEGetNParams requires SCR 6 or lower');
    Exit;
  end;
  CrpeGetNParams := GetProcAddress(CRDEngine, 'PEGetNParams');
  if CrpeGetNParams = nil then
  begin
    CRDEngineError('PEGetNParams');
  end
  else
  begin
    Result := TPEGetNParams(CrpeGetNParams)(printJob);
    LogEvent('PEGetNParams',printJob,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNParams',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthParamInfo function                                                   }
{------------------------------------------------------------------------------}
function PEGetNthParamInfo (printJob: Smallint; paramN: Smallint;
  var ParamInfo: PEParameterInfo): Bool;
var
  CrpeGetNthParamInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {Params applies to SCR6 and down}
  if CRDVerMajor > 6 then
  begin
    CRDEngineError('PEGetNthParamInfo requires SCR 6 or lower');
    Exit;
  end;
  CrpeGetNthParamInfo := GetProcAddress(CRDEngine, 'PEGetNthParamInfo');
  if CrpeGetNthParamInfo = nil then
  begin
    CRDEngineError('PEGetNthParamInfo');
  end
  else
  begin
    ParamInfo.structSize := SizeOf(PEParameterInfo);
    Result := TPEGetNthParamInfo(CrpeGetNthParamInfo)(printJob,
      paramN, ParamInfo);
    LogEvent('PEGetNthParamInfo',printJob,@paramN,
      @ParamInfo,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNthParamInfo',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthParam function                                                       }
{------------------------------------------------------------------------------}
function PEGetNthParam (printJob: Smallint; paramN: Smallint;
  var textHandle: hWnd; var textLength: Smallint): Bool;
var
  CrpeGetNthParam : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {Params applies to SCR6 and down}
  if CRDVerMajor > 6 then
  begin
    CRDEngineError('PEGetNthParam requires SCR 6 or lower');
    Exit;
  end;
  CrpeGetNthParam := GetProcAddress(CRDEngine, 'PEGetNthParam');
  if CrpeGetNthParam = nil then
  begin
    CRDEngineError('PEGetNthParam');
  end
  else
  begin
    Result := TPEGetNthParam(CrpeGetNthParam)(printJob, paramN,
      textHandle, textLength);
    LogEvent('PEGetNthParam',printJob,@paramN,
      @textHandle,@textLength,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNthParam',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetNthParam function                                                       }
{------------------------------------------------------------------------------}
function PESetNthParam (printJob: Smallint; paramN: Smallint;
  szParamValue: PChar): Bool;
var
  CrpeSetNthParam : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {Params applies to SCR6 and down}
  if CRDVerMajor > 6 then
  begin
    CRDEngineError('PESetNthParam requires SCR 6 or lower');
    Exit;
  end;
  CrpeSetNthParam := GetProcAddress(CRDEngine, 'PESetNthParam');
  if CrpeSetNthParam = nil then
  begin
    CRDEngineError('PESetNthParam');
  end
  else
  begin
    Result := TPESetNthParam(CrpeSetNthParam)(printJob, paramN,
      szParamValue);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNParameterFields function                                               }
{------------------------------------------------------------------------------}
function PEGetNParameterFields (printJob: Smallint): Smallint;
var
  CrpeGetNParameterFields : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNParameterFields := GetProcAddress(CRDEngine, 'PEGetNParameterFields');
  if CrpeGetNParameterFields = nil then
  begin
    CRDEngineError('PEGetNParameterFields');
  end
  else
  begin
    Result := TPEGetNParameterFields(CrpeGetNParameterFields)(printJob);
    LogEvent('PEGetNParameterFields',printJob,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNParameterFields',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthParameterField function                                              }
{------------------------------------------------------------------------------}
function PEGetNthParameterField (printJob: Smallint; parameterN: Smallint;
  var parameterInfo: PEParameterFieldInfo): Bool;
var
  CrpeGetNthParameterField : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNthParameterField := GetProcAddress(CRDEngine, 'PEGetNthParameterField');
  if CrpeGetNthParameterField = nil then
  begin
    CRDEngineError('PEGetNthParameterField');
  end
  else
  begin
    {ParameterInfo in SCR6 and down has different structure size}
    if CRDVerMajor < 7 then
    begin
      parameterInfo.structSize := SizeOf(PEParameterFieldInfo56);
      parameterInfo.isLimited := 0;
      parameterInfo.MinSize := 0;
      parameterInfo.MaxSize := 0;
      StrCopy(parameterInfo.EditMask, '');
      parameterInfo.isHidden := 0;
    end
    else
      parameterInfo.structSize := SizeOf(PEParameterFieldInfo);
    Result := TPEGetNthParameterField(CrpeGetNthParameterField)(printJob,
      parameterN, parameterInfo);
    LogEvent('PEGetNthParameterField',printJob,@parameterN,
      @parameterInfo,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNthParameterField',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetNthParameterField function                                              }
{------------------------------------------------------------------------------}
function PESetNthParameterField (printJob: Smallint; parameterN: Smallint;
  var parameterInfo: PEParameterFieldInfo): Bool;
var
  CrpeSetNthParameterField : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetNthParameterField := GetProcAddress(CRDEngine, 'PESetNthParameterField');
  if CrpeSetNthParameterField = nil then
  begin
    CRDEngineError('PESetNthParameterField');
  end
  else
  begin
    {ParameterInfo in SCR6 and down has different structure size}
    if CRDVerMajor < 7 then
      parameterInfo.structSize := SizeOf(PEParameterFieldInfo56)
    else
      parameterInfo.structSize := SizeOf(PEParameterFieldInfo);
    Result := TPESetNthParameterField(CrpeSetNthParameterField)(printJob,
      parameterN, parameterInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PEConvertPFInfoToVInfo function                                              }
{------------------------------------------------------------------------------}
function PEConvertPFInfoToVInfo (value: PChar; valueType: Smallint;
  var valueInfo: PEValueInfo): Bool;
var
  CrpeConvertPFInfoToVInfo : TFarProc;
  s1                       : string;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeConvertPFInfoToVInfo := GetProcAddress(CRDEngine, 'PEConvertPFInfoToVInfo');
  if CrpeConvertPFInfoToVInfo = nil then
  begin
    CRDEngineError('PEConvertPFInfoToVInfo');
  end
  else
  begin
    {ValueInfo in 5.0 has different structure size}
    if CRDVerMajor < 6 then
    begin
      valueInfo.structSize := SizeOf(PEValueInfo5);
      s1 := '';
      valueInfo.ignored := s1[1];
      valueInfo.viLong := 0;
    end
    else
      valueInfo.structSize := SizeOf(PEValueInfo);
    Result := TPEConvertPFInfoToVInfo(CrpeConvertPFInfoToVInfo)(value,
      valueType, valueInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PEConvertVInfoToPFInfo function                                              }
{------------------------------------------------------------------------------}
function PEConvertVInfoToPFInfo (var valueInfo: PEValueInfo;
  var valueType: Word; value: PChar): Bool;
var
  CrpeConvertVInfoToPFInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeConvertVInfoToPFInfo := GetProcAddress(CRDEngine, 'PEConvertVInfoToPFInfo');
  if CrpeConvertVInfoToPFInfo = nil then
  begin
    CRDEngineError('PEConvertVInfoToPFInfo');
  end
  else
  begin
    {ValueInfo in 5.0 has different structure size}
    if CRDVerMajor < 6 then
      valueInfo.structSize := SizeOf(PEValueInfo5)
    else
      valueInfo.structSize := SizeOf(PEValueInfo);
    Result := TPEConvertVInfoToPFInfo(CrpeConvertVInfoToPFInfo)(valueInfo,
      valueType, value);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNParameterDefaultValues function                                        }
{------------------------------------------------------------------------------}
function PEGetNParameterDefaultValues (printJob: Smallint;
  const parameterFieldName: PChar; const reportName: PChar): Smallint;
var
  CrpeGetNParameterDefaultValues : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {DefaultValues applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetNParameterDefaultValues requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetNParameterDefaultValues := GetProcAddress(CRDEngine, 'PEGetNParameterDefaultValues');
  if CrpeGetNParameterDefaultValues = nil then
  begin
    CRDEngineError('PEGetNParameterDefaultValues');
  end
  else
  begin
    Result := TPEGetNParameterDefaultValues(CrpeGetNParameterDefaultValues)
      (printJob, parameterFieldName, reportName);
    LogEvent('PEGetNParameterDefaultValues',printJob,@parameterFieldName,
      @reportName,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNParameterDefaultValues',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthParameterDefaultValue function                                       }
{------------------------------------------------------------------------------}
function PEGetNthParameterDefaultValue (printJob: Smallint;
  const parameterFieldName: PChar; const reportName: PChar;
  index: Smallint; var valueInfo: PEValueInfo): Bool;
var
  CrpeGetNthParameterDefaultValue : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {DefaultValues applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetNthParameterDefaultValue requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetNthParameterDefaultValue := GetProcAddress(CRDEngine, 'PEGetNthParameterDefaultValue');
  if CrpeGetNthParameterDefaultValue = nil then
  begin
    CRDEngineError('PEGetNthParameterDefaultValue');
  end
  else
  begin
    valueInfo.structSize := SizeOf(PEValueInfo);
    Result := TPEGetNthParameterDefaultValue(CrpeGetNthParameterDefaultValue)
      (printJob, parameterFieldName, reportName, index, valueInfo);
    LogEvent('PEGetNthParameterDefaultValue',printJob,@parameterFieldName,
      @reportName,@index,@valueInfo,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNthParameterDefaultValue',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetNthParameterDefaultValue function                                       }
{------------------------------------------------------------------------------}
function PESetNthParameterDefaultValue (printJob: Smallint;
  const parameterFieldName: PChar; const reportName: PChar;
  index: Smallint; var valueInfo: PEValueInfo): Bool;
var
  CrpeSetNthParameterDefaultValue : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {DefaultValues applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PESetNthParameterDefaultValue requires SCR 7 or higher');
    Exit;
  end;
  CrpeSetNthParameterDefaultValue := GetProcAddress(CRDEngine, 'PESetNthParameterDefaultValue');
  if CrpeSetNthParameterDefaultValue = nil then
  begin
    CRDEngineError('PESetNthParameterDefaultValue');
  end
  else
  begin
    valueInfo.structSize := SizeOf(PEValueInfo);
    Result := TPESetNthParameterDefaultValue(CrpeSetNthParameterDefaultValue)
      (printJob, parameterFieldName, reportName, index, valueInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PEAddParameterDefaultValue function                                          }
{------------------------------------------------------------------------------}
function PEAddParameterDefaultValue (printJob: Smallint;
  const parameterFieldName: PChar; const reportName: PChar;
  var valueInfo: PEValueInfo): Bool;
var
  CrpeAddParameterDefaultValue : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {DefaultValues applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEAddParameterDefaultValue requires SCR 7 or higher');
    Exit;
  end;
  CrpeAddParameterDefaultValue := GetProcAddress(CRDEngine, 'PEAddParameterDefaultValue');
  if CrpeAddParameterDefaultValue = nil then
  begin
    CRDEngineError('PEAddParameterDefaultValue');
  end
  else
  begin
    valueInfo.structSize := SizeOf(PEValueInfo);
    Result := TPEAddParameterDefaultValue(CrpeAddParameterDefaultValue)
      (printJob, parameterFieldName, reportName, valueInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PEDeleteNthParameterDefaultValue function                                    }
{------------------------------------------------------------------------------}
function PEDeleteNthParameterDefaultValue (printJob: Smallint;
  const parameterFieldName: PChar; const reportName: PChar;
  index: Smallint): Bool;
var
  CrpeDeleteNthParameterDefaultValue : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {DefaultValues applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEDeleteNthParameterDefaultValue requires SCR 7 or higher');
    Exit;
  end;
  CrpeDeleteNthParameterDefaultValue := GetProcAddress(CRDEngine, 'PEDeleteNthParameterDefaultValue');
  if CrpeDeleteNthParameterDefaultValue = nil then
  begin
    CRDEngineError('PEDeleteNthParameterDefaultValue');
  end
  else
  begin
    Result := TPEDeleteNthParameterDefaultValue(CrpeDeleteNthParameterDefaultValue)
      (printJob, parameterFieldName, reportName, index);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetParameterMinMaxValue function                                           }
{------------------------------------------------------------------------------}
function PEGetParameterMinMaxValue (printJob: Smallint;
  const parameterFieldName: PChar; const reportName: PChar;
  var valueMin: PEValueInfo; var valueMax: PEValueInfo): Bool;
var
  CrpeGetParameterMinMaxValue : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {MinMaxValues applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetParameterMinMaxValue requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetParameterMinMaxValue := GetProcAddress(CRDEngine, 'PEGetParameterMinMaxValue');
  if CrpeGetParameterMinMaxValue = nil then
  begin
    CRDEngineError('PEGetParameterMinMaxValue');
  end
  else
  begin
    valueMin.structSize := SizeOf(PEValueInfo);
    valueMax.structSize := SizeOf(PEValueInfo);
    Result := TPEGetParameterMinMaxValue(CrpeGetParameterMinMaxValue)
      (printJob, parameterFieldName, reportName, valueMin, valueMax);
    LogEvent('PEGetParameterMinMaxValue',printJob,@parameterFieldName,
      @reportName,@valueMin,@valueMax,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetParameterMinMaxValue',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetParameterMinMaxValue function                                           }
{------------------------------------------------------------------------------}
function PESetParameterMinMaxValue (printJob: Smallint;
  const parameterFieldName: PChar; const reportName: PChar;
  var valueMin: PEValueInfo; var valueMax: PEValueInfo): Bool;
var
  CrpeSetParameterMinMaxValue : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {MinMaxValues applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PESetParameterMinMaxValue requires SCR 7 or higher');
    Exit;
  end;
  CrpeSetParameterMinMaxValue := GetProcAddress(CRDEngine, 'PESetParameterMinMaxValue');
  if CrpeSetParameterMinMaxValue = nil then
  begin
    CRDEngineError('PESetParameterMinMaxValue');
  end
  else
  begin
    valueMin.structSize := SizeOf(PEValueInfo);
    valueMax.structSize := SizeOf(PEValueInfo);
    Result := TPESetParameterMinMaxValue(CrpeSetParameterMinMaxValue)
      (printJob, parameterFieldName, reportName, valueMin, valueMax);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthParameterValueDescription function                                   }
{------------------------------------------------------------------------------}
function PEGetNthParameterValueDescription (printJob: Smallint;
  parameterFieldName: PChar; reportName: PChar; index: Smallint;
  var valueDesc: HWnd; var valueDescLength: Smallint): Bool;
var
  CrpeGetNthParameterValueDescription : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {ValueDescription applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetNthParameterValueDescription requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetNthParameterValueDescription := GetProcAddress(CRDEngine, 'PEGetNthParameterValueDescription');
  if CrpeGetNthParameterValueDescription = nil then
  begin
    CRDEngineError('PEGetNthParameterValueDescription');
  end
  else
  begin
    Result := TPEGetNthParameterValueDescription(CrpeGetNthParameterValueDescription)
      (printJob, parameterFieldName, reportName, index, valueDesc, valueDescLength);
    LogEvent('PEGetNthParameterValueDescription',printJob,@parameterFieldName,
      @reportName,@index,@valueDesc,@valueDescLength,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNthParameterValueDescription',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetNthParameterValueDescription function                                   }
{------------------------------------------------------------------------------}
function PESetNthParameterValueDescription (printJob: Smallint;
  parameterFieldName: PChar; reportName: PChar; index: Smallint;
  valueDesc: PChar): Bool;
var
  CrpeSetNthParameterValueDescription : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {ValueDescription applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PESetNthParameterValueDescription requires SCR 7 or higher');
    Exit;
  end;
  CrpeSetNthParameterValueDescription := GetProcAddress(CRDEngine, 'PESetNthParameterValueDescription');
  if CrpeSetNthParameterValueDescription = nil then
  begin
    CRDEngineError('PESetNthParameterValueDescription');
  end
  else
  begin
    Result := TPESetNthParameterValueDescription(CrpeSetNthParameterValueDescription)
      (printJob, parameterFieldName, reportName, index, valueDesc);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetParameterPickListOption function                                        }
{------------------------------------------------------------------------------}
function PEGetParameterPickListOption (printJob: Smallint;
  parameterFieldName: PChar; reportName: PChar;
  var pickListOption: PEParameterPickListOption): Bool;
var
  CrpeGetParameterPickListOption : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {PickList applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetParameterPickListOption requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetParameterPickListOption := GetProcAddress(CRDEngine, 'PEGetParameterPickListOption');
  if CrpeGetParameterPickListOption = nil then
  begin
    CRDEngineError('PEGetParameterPickListOption');
  end
  else
  begin
    pickListOption.structSize := SizeOf(PEParameterPickListOption);
    Result := TPEGetParameterPickListOption(CrpeGetParameterPickListOption)
      (printJob, parameterFieldName, reportName, pickListOption);
    LogEvent('PEGetParameterPickListOption',printJob,@parameterFieldName,
      @reportName,@pickListOption,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetParameterPickListOption',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetParameterPickListOption function                                        }
{------------------------------------------------------------------------------}
function PESetParameterPickListOption (printJob: Smallint;
  parameterFieldName: PChar; reportName: PChar;
  var pickListOption: PEParameterPickListOption): Bool;
var
  CrpeSetParameterPickListOption : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {PickList applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PESetParameterPickListOption requires SCR 7 or higher');
    Exit;
  end;
  CrpeSetParameterPickListOption := GetProcAddress(CRDEngine, 'PESetParameterPickListOption');
  if CrpeSetParameterPickListOption = nil then
  begin
    CRDEngineError('PESetParameterPickListOption');
  end
  else
  begin
    pickListOption.structSize := SizeOf(PEParameterPickListOption);
    Result := TPESetParameterPickListOption(CrpeSetParameterPickListOption)
      (printJob, parameterFieldName, reportName, pickListOption);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetParameterValueInfo function                                             }
{------------------------------------------------------------------------------}
function PEGetParameterValueInfo (printJob: Smallint;
  const parameterFieldName: PChar; const reportName: PChar;
  var valueInfo: PEParameterValueInfo): Bool;
var
  CrpeGetParameterValueInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {ParameterValueInfo applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetParameterValueInfo requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetParameterValueInfo := GetProcAddress(CRDEngine, 'PEGetParameterValueInfo');
  if CrpeGetParameterValueInfo = nil then
  begin
    CRDEngineError('PEGetParameterValueInfo');
  end
  else
  begin
    valueInfo.structSize := SizeOf(PEParameterValueInfo);
    Result := TPEGetParameterValueInfo(CrpeGetParameterValueInfo)
      (printJob, parameterFieldName, reportName, valueInfo);
    LogEvent('PEGetParameterValueInfo',printJob,@parameterFieldName,
      @reportName,@valueInfo,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetParameterValueInfo',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetParameterValueInfo function                                             }
{------------------------------------------------------------------------------}
function PESetParameterValueInfo (printJob: Smallint;
  const parameterFieldName: PChar; const reportName: PChar;
  var valueInfo: PEParameterValueInfo): Bool;
var
  CrpeSetParameterValueInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {ParameterValueInfo applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PESetParameterValueInfo requires SCR 7 or higher');
    Exit;
  end;
  CrpeSetParameterValueInfo := GetProcAddress(CRDEngine, 'PESetParameterValueInfo');
  if CrpeSetParameterValueInfo = nil then
  begin
    CRDEngineError('PESetParameterValueInfo');
  end
  else
  begin
    valueInfo.structSize := SizeOf(PEParameterValueInfo);
    Result := TPESetParameterValueInfo(CrpeSetParameterValueInfo)
      (printJob, parameterFieldName, reportName, valueInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNParameterCurrentValues function                                        }
{------------------------------------------------------------------------------}
function PEGetNParameterCurrentValues (printJob: Smallint;
  const parameterFieldName: PChar; const reportName: PChar): Smallint;
var
  CrpeGetNParameterCurrentValues : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {CurrentValues applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetNParameterCurrentValues requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetNParameterCurrentValues := GetProcAddress(CRDEngine, 'PEGetNParameterCurrentValues');
  if CrpeGetNParameterCurrentValues = nil then
  begin
    CRDEngineError('PEGetNParameterCurrentValues');
  end
  else
  begin
    Result := TPEGetNParameterCurrentValues(CrpeGetNParameterCurrentValues)
      (printJob, parameterFieldName, reportName);
    LogEvent('PEGetNParameterCurrentValues',printJob,@parameterFieldName,
      @reportName,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNParameterCurrentValues',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthParameterCurrentValue function                                       }
{------------------------------------------------------------------------------}
function PEGetNthParameterCurrentValue (printJob: Smallint;
  const parameterFieldName: PChar; const reportName: PChar;
  index: Smallint; var currentValue: PEValueInfo): Bool;
var
  CrpeGetNthParameterCurrentValue : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {CurrentValues applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetNthParameterCurrentValue requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetNthParameterCurrentValue := GetProcAddress(CRDEngine, 'PEGetNthParameterCurrentValue');
  if CrpeGetNthParameterCurrentValue = nil then
  begin
    CRDEngineError('PEGetNthParameterCurrentValue');
  end
  else
  begin
    currentValue.structSize := SizeOf(PEValueInfo);
    Result := TPEGetNthParameterCurrentValue(CrpeGetNthParameterCurrentValue)
      (printJob, parameterFieldName, reportName, index, currentValue);
    LogEvent('PEGetNthParameterCurrentValue',printJob,@parameterFieldName,
      @reportName,@index,@currentValue,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNthParameterCurrentValue',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEAddParameterCurrentValue function                                          }
{------------------------------------------------------------------------------}
function PEAddParameterCurrentValue (printJob: Smallint;
  const parameterFieldName: PChar; const reportName: PChar;
  var currentValue: PEValueInfo): Bool;
var
  CrpeAddParameterCurrentValue : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {CurrentValues applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEAddParameterCurrentValue requires SCR 7 or higher');
    Exit;
  end;
  CrpeAddParameterCurrentValue := GetProcAddress(CRDEngine, 'PEAddParameterCurrentValue');
  if CrpeAddParameterCurrentValue = nil then
  begin
    CRDEngineError('PEAddParameterCurrentValue');
  end
  else
  begin
    currentValue.structSize := SizeOf(PEValueInfo);
    Result := TPEAddParameterCurrentValue(CrpeAddParameterCurrentValue)
      (printJob, parameterFieldName, reportName, currentValue);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNParameterCurrentRanges function                                        }
{------------------------------------------------------------------------------}
function PEGetNParameterCurrentRanges (printJob: Smallint;
  const parameterFieldName: PChar; const reportName: PChar): Smallint;
var
  CrpeGetNParameterCurrentRanges : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {CurrentRanges applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetNParameterCurrentRanges requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetNParameterCurrentRanges := GetProcAddress(CRDEngine, 'PEGetNParameterCurrentRanges');
  if CrpeGetNParameterCurrentRanges = nil then
  begin
    CRDEngineError('PEGetNParameterCurrentRanges');
  end
  else
  begin
    Result := TPEGetNParameterCurrentRanges(CrpeGetNParameterCurrentRanges)
      (printJob, parameterFieldName, reportName);
    LogEvent('PEGetNParameterCurrentRanges',printJob,@parameterFieldName,
      @reportName,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNParameterCurrentRanges',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthParameterCurrentRange function                                       }
{------------------------------------------------------------------------------}
function PEGetNthParameterCurrentRange (printJob: Smallint;
  const parameterFieldName: PChar; const reportName: PChar;
  index: Smallint; var rangeStart: PEValueInfo;
  var rangeEnd: PEValueInfo; var rangeInfo: Smallint): Bool;
var
  CrpeGetNthParameterCurrentRange : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {CurrentRanges applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetNthParameterCurrentRange requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetNthParameterCurrentRange := GetProcAddress(CRDEngine, 'PEGetNthParameterCurrentRange');
  if CrpeGetNthParameterCurrentRange = nil then
  begin
    CRDEngineError('PEGetNthParameterCurrentRange');
  end
  else
  begin
    rangeStart.structSize := SizeOf(PEValueInfo);
    rangeEnd.structSize := SizeOf(PEValueInfo);
    Result := TPEGetNthParameterCurrentRange(CrpeGetNthParameterCurrentRange)
      (printJob, parameterFieldName, reportName, index, rangeStart,
       rangeEnd, rangeInfo);
    LogEvent('PEGetNthParameterCurrentRange',printJob,@parameterFieldName,
      @reportName,@index,@rangeStart,@rangeEnd,@rangeInfo,nil,nil,nil,nil,nil);
    LogResult('PEGetNthParameterCurrentRange',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEAddParameterCurrentRange function                                          }
{------------------------------------------------------------------------------}
function PEAddParameterCurrentRange (printJob: Smallint;
  const parameterFieldName: PChar; const reportName: PChar;
  var rangeStart: PEValueInfo; var rangeEnd: PEValueInfo;
  rangeInfo: Smallint): Bool;
var
  CrpeAddParameterCurrentRange : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {CurrentRanges applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEAddParameterCurrentRange requires SCR 7 or higher');
    Exit;
  end;
  CrpeAddParameterCurrentRange := GetProcAddress(CRDEngine, 'PEAddParameterCurrentRange');
  if CrpeAddParameterCurrentRange = nil then
  begin
    CRDEngineError('PEAddParameterCurrentRange');
  end
  else
  begin
    rangeStart.structSize := SizeOf(PEValueInfo);
    rangeEnd.structSize := SizeOf(PEValueInfo);
    Result := TPEAddParameterCurrentRange(CrpeAddParameterCurrentRange)
      (printJob, parameterFieldName, reportName, rangeStart,
       rangeEnd, rangeInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PEClearParameterCurrentValuesAndRanges function                              }
{------------------------------------------------------------------------------}
function PEClearParameterCurrentValuesAndRanges (printJob: Smallint;
  const parameterFieldName: PChar; const reportName: PChar): Bool;
var
  CrpeClearParameterCurrentValuesAndRanges : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {CurrentRanges applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEClearParameterCurrentValuesAndRanges requires SCR 7 or higher');
    Exit;
  end;
  CrpeClearParameterCurrentValuesAndRanges := GetProcAddress(CRDEngine, 'PEClearParameterCurrentValuesAndRanges');
  if CrpeClearParameterCurrentValuesAndRanges = nil then
  begin
    CRDEngineError('PEClearParameterCurrentValuesAndRanges');
  end
  else
  begin
    Result := TPEClearParameterCurrentValuesAndRanges(CrpeClearParameterCurrentValuesAndRanges)
      (printJob, parameterFieldName, reportName);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthParameterType function                                               }
{------------------------------------------------------------------------------}
function PEGetNthParameterType (printJob: Smallint; index: Smallint): Smallint;
var
  CrpeGetNthParameterType : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {ParameterType applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetNthParameterType requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetNthParameterType := GetProcAddress(CRDEngine, 'PEGetNthParameterType');
  if CrpeGetNthParameterType = nil then
  begin
    CRDEngineError('PEGetNthParameterType');
  end
  else
  begin
    Result := TPEGetNthParameterType(CrpeGetNthParameterType)(printJob, index);
    LogEvent('PEGetNthParameterType',printJob,@index,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNthParameterType',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNSortFields function                                                    }
{------------------------------------------------------------------------------}
function PEGetNSortFields (printJob: Smallint): Smallint;
var
  CrpeGetNSortFields : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNSortFields := GetProcAddress(CRDEngine, 'PEGetNSortFields');
  if CrpeGetNSortFields = nil then
  begin
    CRDEngineError('PEGetNSortFields');
  end
  else
  begin
    Result := TPEGetNSortFields(CrpeGetNSortFields)(printJob);
    LogEvent('PEGetNSortFields',printJob,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNSortFields',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthSortField function                                                   }
{------------------------------------------------------------------------------}
function PEGetNthSortField (printJob: Smallint; sortFieldN: Smallint;
  var nameHandle: HWnd; var nameLength : Smallint; var direction: Smallint): Bool;
var
  CrpeGetNthSortField : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNthSortField := GetProcAddress(CRDEngine, 'PEGetNthSortField');
  if CrpeGetNthSortField = nil then
  begin
    CRDEngineError('PEGetNthSortField');
  end
  else
  begin
    Result := TPEGetNthSortField(CrpeGetNthSortField)(printJob,
      sortFieldN, nameHandle, nameLength, direction);
    LogEvent('PEGetNthSortField',printJob,@sortFieldN,
      @nameHandle,@nameLength,@direction,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNthSortField',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetNthSortField function                                                   }
{------------------------------------------------------------------------------}
function PESetNthSortField (printJob: Smallint; sortFieldN: Smallint;
  Name: PChar; direction: Smallint): Bool;
var
  CrpeSetNthSortField : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetNthSortField := GetProcAddress(CRDEngine, 'PESetNthSortField');
  if CrpeSetNthSortField = nil then
  begin
    CRDEngineError('PESetNthSortField');
  end
  else
  begin
    Result := TPESetNthSortField(CrpeSetNthSortField)(printJob,
      sortFieldN, Name, direction);
  end;
end;

{------------------------------------------------------------------------------}
{ PEDeleteNthSortField function                                                }
{------------------------------------------------------------------------------}
function PEDeleteNthSortField (printJob: Smallint; sortFieldN: Smallint): Bool;
var
  CrpeDeleteNthSortField : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeDeleteNthSortField := GetProcAddress(CRDEngine, 'PEDeleteNthSortField');
  if CrpeDeleteNthSortField = nil then
  begin
    CRDEngineError('PEDeleteNthSortField');
  end
  else
  begin
    Result := TPEDeleteNthSortField(CrpeDeleteNthSortField)(printJob, sortFieldN);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNGroupSortFields function                                               }
{------------------------------------------------------------------------------}
function PEGetNGroupSortFields (printJob : Smallint): Smallint;
var
  CrpeGetNGroupSortFields : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNGroupSortFields := GetProcAddress(CRDEngine, 'PEGetNGroupSortFields');
  if CrpeGetNGroupSortFields = nil then
  begin
    CRDEngineError('PEGetNGroupSortFields');
  end
  else
  begin
    Result := TPEGetNGroupSortFields(CrpeGetNGroupSortFields)(printJob);
    LogEvent('PEGetNGroupSortFields',printJob,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNGroupSortFields',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthGroupSortField function                                              }
{------------------------------------------------------------------------------}
function PEGetNthGroupSortField (printJob: Smallint; sortFieldN: Smallint;
  var nameHandle: HWnd; var nameLength: Smallint; var direction: Smallint): Bool;
var
  CrpeGetNthGroupSortField : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNthGroupSortField := GetProcAddress(CRDEngine, 'PEGetNthGroupSortField');
  if CrpeGetNthGroupSortField = nil then
  begin
    CRDEngineError('PEGetNthGroupSortField');
  end
  else
  begin
    Result := TPEGetNthGroupSortField(CrpeGetNthGroupSortField)(printJob,
      sortFieldN, nameHandle, nameLength, direction);
    LogEvent('PEGetNthGroupSortField',printJob,@sortFieldN,
      @nameHandle,@nameLength,@direction,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNthGroupSortField',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetNthGroupSortField function                                              }
{------------------------------------------------------------------------------}
function PESetNthGroupSortField (printJob: Smallint; sortFieldN: Smallint;
  Name: PChar; direction: Smallint): Bool;
var
  CrpeSetNthGroupSortField : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetNthGroupSortField := GetProcAddress(CRDEngine, 'PESetNthGroupSortField');
  if CrpeSetNthGroupSortField = nil then
  begin
    CRDEngineError('PESetNthGroupSortField');
  end
  else
  begin
    Result := TPESetNthGroupSortField(CrpeSetNthGroupSortField)(printJob,
      sortFieldN, Name, direction);
  end;
end;

{------------------------------------------------------------------------------}
{ PEDeleteNthGroupSortField function                                           }
{------------------------------------------------------------------------------}
function PEDeleteNthGroupSortField (printJob: Smallint; sortFieldN: Smallint): Bool;
var
  CrpeDeleteNthGroupSortField : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeDeleteNthGroupSortField := GetProcAddress(CRDEngine, 'PEDeleteNthGroupSortField');
  if CrpeDeleteNthGroupSortField = nil then
  begin
    CRDEngineError('PEDeleteNthGroupSortField');
  end
  else
  begin
    Result := TPEDeleteNthGroupSortField(CrpeDeleteNthGroupSortField)
      (printJob, sortFieldN);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNTables function                                                        }
{------------------------------------------------------------------------------}
function PEGetNTables (printJob: Smallint): Smallint;
var
  CrpeGetNTables : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNTables := GetProcAddress(CRDEngine, 'PEGetNTables');
  if CrpeGetNTables = nil then
  begin
    CRDEngineError('PEGetNTables');
  end
  else
  begin
    Result := TPEGetNTables(CrpeGetNTables)(printJob);
    LogEvent('PEGetNTables',printJob,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNTables',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthTableType function                                                   }
{------------------------------------------------------------------------------}
function PEGetNthTableType (printJob: Smallint; tableN: Smallint;
  var tableType: PETableType): Bool;
var
  CrpeGetNthTableType : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNthTableType := GetProcAddress(CRDEngine, 'PEGetNthTableType');
  if CrpeGetNthTableType = nil then
  begin
    CRDEngineError('PEGetNthTableType');
  end
  else
  begin
    tableType.structSize := SizeOf(PETableType);
    Result := TPEGetNthTableType(CrpeGetNthTableType)(printJob,
      tableN, tableType);
    LogEvent('PEGetNthTableType',printJob,@tableN,
      @tableType,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNthTableType',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthTableSessionInfo function                                            }
{------------------------------------------------------------------------------}
function PEGetNthTableSessionInfo (printJob: Smallint;
  tableN: Smallint; var sessionInfo: PESessionInfo): Bool;
var
  CrpeGetNthTableSessionInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNthTableSessionInfo := GetProcAddress(CRDEngine, 'PEGetNthTableSessionInfo');
  if CrpeGetNthTableSessionInfo = nil then
  begin
    CRDEngineError('PEGetNthTableSessionInfo');
  end
  else
  begin
    sessionInfo.structSize := SizeOf(PESessionInfo);
    Result := TPEGetNthTableSessionInfo(CrpeGetNthTableSessionInfo)(printJob,
      tableN, sessionInfo);
    LogEvent('PEGetNthTableSessionInfo',printJob,@tableN,
      @sessionInfo,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNthTableSessionInfo',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetNthTableSessionInfo function                                            }
{------------------------------------------------------------------------------}
function PESetNthTableSessionInfo (printJob: Smallint;
  tableN: Smallint; var sessionInfo: PESessionInfo;
  propagateAcrossTables : Bool): Bool;
var
  CrpeSetNthTableSessionInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetNthTableSessionInfo := GetProcAddress(CRDEngine, 'PESetNthTableSessionInfo');
  if CrpeSetNthTableSessionInfo = nil then
  begin
    CRDEngineError('PESetNthTableSessionInfo');
  end
  else
  begin
    sessionInfo.structSize := SizeOf(PESessionInfo);
    Result := TPESetNthTableSessionInfo(CrpeSetNthTableSessionInfo)
      (printJob, tableN, sessionInfo, propagateAcrossTables);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthTableLogOnInfo function                                              }
{------------------------------------------------------------------------------}
function PEGetNthTableLogOnInfo (printJob: Smallint;
  tableN: Smallint; var logOnInfo: PELogOnInfo): Bool;
var
  CrpeGetNthTableLogOnInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNthTableLogOnInfo := GetProcAddress(CRDEngine, 'PEGetNthTableLogOnInfo');
  if CrpeGetNthTableLogOnInfo = nil then
  begin
    CRDEngineError('PEGetNthTableLogOnInfo');
  end
  else
  begin
    logOnInfo.structSize := SizeOf(PELogOnInfo);
    Result := TPEGetNthTableLogOnInfo(CrpeGetNthTableLogOnInfo)
      (printJob, tableN, logOnInfo);
    LogEvent('PEGetNthTableLogOnInfo',printJob,@tableN,
      @logOnInfo,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNthTableLogOnInfo',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetNthTableLogOnInfo function                                              }
{------------------------------------------------------------------------------}
function PESetNthTableLogOnInfo (printJob: Smallint; tableN: Smallint;
  var logOnInfo: PELogOnInfo; propagateAcrossTables: Bool): Bool;
var
  CrpeSetNthTableLogOnInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetNthTableLogOnInfo := GetProcAddress(CRDEngine, 'PESetNthTableLogOnInfo');
  if CrpeSetNthTableLogOnInfo = nil then
  begin
    CRDEngineError('PESetNthTableLogOnInfo');
  end
  else
  begin
    logOnInfo.structSize := SizeOf(PELogOnInfo);
    Result := TPESetNthTableLogOnInfo(CrpeSetNthTableLogOnInfo)
      (printJob, tableN, logOnInfo, propagateAcrossTables);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthTableLocation function                                               }
{------------------------------------------------------------------------------}
function PEGetNthTableLocation (printJob: Smallint; tableN: Smallint;
  var location: PETableLocation): Bool;
var
  CrpeGetNthTableLocation : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNthTableLocation := GetProcAddress(CRDEngine, 'PEGetNthTableLocation');
  if CrpeGetNthTableLocation = nil then
  begin
    CRDEngineError('PEGetNthTableLocation');
  end
  else
  begin
    {SubName and ConnectBuffer in 7.0+}
    if CRDVerMajor < 7 then
    begin
      location.StructSize := SizeOf(PETableLocation56);
      StrCopy(location.SubLocation, '');
      StrCopy(location.ConnectBuffer, '');
    end
    else
      location.StructSize := SizeOf(PETableLocation);
    Result := TPEGetNthTableLocation(CrpeGetNthTableLocation)
      (printJob, tableN, location);
    LogEvent('PEGetNthTableLocation',printJob,@tableN,
      @location,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNthTableLocation',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetNthTableLocation function                                               }
{------------------------------------------------------------------------------}
function PESetNthTableLocation (printJob: Smallint; tableN: Smallint;
  var location: PETableLocation): Bool;
var
  CrpeSetNthTableLocation : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetNthTableLocation := GetProcAddress(CRDEngine, 'PESetNthTableLocation');
  if CrpeSetNthTableLocation = nil then
  begin
    CRDEngineError('PESetNthTableLocation');
  end
  else
  begin
    {SubName and ConnectBuffer in 7.0+}
    if CRDVerMajor < 7 then
      location.StructSize := SizeOf(PETableLocation56)
    else
      location.StructSize := SizeOf(PETableLocation);
    Result := TPESetNthTableLocation(CrpeSetNthTableLocation)
      (printJob, tableN, location);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNthTablePrivateInfo function                                            }
{------------------------------------------------------------------------------}
function PEGetNthTablePrivateInfo (printJob: Smallint;
  tableN: Smallint; var privateInfo: PETablePrivateInfo): Bool;
var
  CrpeGetNthTablePrivateInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {PrivateInfo applies to SCR6+}
  if CRDVerMajor < 6 then
  begin
    CRDEngineError('PEGetNthTablePrivateInfo requires SCR 6 or higher');
    Exit;
  end;
  CrpeGetNthTablePrivateInfo := GetProcAddress(CRDEngine, 'PEGetNthTablePrivateInfo');
  if CrpeGetNthTablePrivateInfo = nil then
  begin
    CRDEngineError('PEGetNthTablePrivateInfo');
  end
  else
  begin
    privateInfo.structSize := SizeOf(PETablePrivateInfo);
    Result := TPEGetNthTablePrivateInfo(CrpeGetNthTablePrivateInfo)
      (printJob, tableN, privateInfo);
    LogEvent('PEGetNthTablePrivateInfo',printJob,@tableN,
      @privateInfo,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNthTablePrivateInfo',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetNthTablePrivateInfo function                                            }
{------------------------------------------------------------------------------}
function PESetNthTablePrivateInfo (printJob: Smallint;
  tableN: Smallint; var privateInfo: PETablePrivateInfo): Bool;
var
  CrpeSetNthTablePrivateInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {PrivateInfo applies to SCR6+}
  if CRDVerMajor < 6 then
  begin
    CRDEngineError('PESetNthTablePrivateInfo requires SCR 6 or higher');
    Exit;
  end;
  CrpeSetNthTablePrivateInfo := GetProcAddress(CRDEngine, 'PESetNthTablePrivateInfo');
  if CrpeSetNthTablePrivateInfo = nil then
  begin
    CRDEngineError('PESetNthTablePrivateInfo');
  end
  else
  begin
    privateInfo.structSize := SizeOf(PETablePrivateInfo);
    Result := TPESetNthTablePrivateInfo(CrpeSetNthTablePrivateInfo)
      (printJob, tableN, privateInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PETestNthTableConnectivity function                                          }
{------------------------------------------------------------------------------}
function PETestNthTableConnectivity (printJob: Smallint; tableN: Smallint): Bool;
var
  CrpeTestNthTableConnectivity : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeTestNthTableConnectivity := GetProcAddress(CRDEngine, 'PETestNthTableConnectivity');
  if CrpeTestNthTableConnectivity = nil then
  begin
    CRDEngineError('PETestNthTableConnectivity');
  end
  else
  begin
    Result := TPETestNthTableConnectivity(CrpeTestNthTableConnectivity)
      (printJob, tableN);
  end;
end;

{------------------------------------------------------------------------------}
{ PELogOnServer function                                                       }
{------------------------------------------------------------------------------}
function PELogOnServer (dllName: PChar; var logOnInfo: PELogOnInfo): Bool;
var
  CrpeLogOnServer : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeLogOnServer := GetProcAddress(CRDEngine, 'PELogOnServer');
  if CrpeLogOnServer = nil then
  begin
    CRDEngineError('PELogOnServer');
  end
  else
  begin
    logOnInfo.structSize := SizeOf(PELogOnInfo);
    Result := TPELogOnServer(CrpeLogOnServer)(dllName, logOnInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PELogOffServer function                                                      }
{------------------------------------------------------------------------------}
function PELogOffServer (dllName: PChar; var logOnInfo: PELogOnInfo): Bool;
var
  CrpeLogOffServer : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeLogOffServer := GetProcAddress(CRDEngine, 'PELogOffServer');
  if CrpeLogOffServer = nil then
  begin
    CRDEngineError('PELogOffServer');
  end
  else
  begin
    logOnInfo.structSize := SizeOf(PELogOnInfo);
    Result := TPELogOffServer(CrpeLogOffServer)(dllName, logOnInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PELogOnSQLServerWithPrivateInfo function                                     }
{------------------------------------------------------------------------------}
function PELogOnSQLServerWithPrivateInfo (dllName: PChar;
  privateInfo: Pointer): Bool;
var
  CrpeLogOnSQLServerWithPrivateInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeLogOnSQLServerWithPrivateInfo := GetProcAddress(CRDEngine, 'PELogOnSQLServerWithPrivateInfo');
  if CrpeLogOnSQLServerWithPrivateInfo = nil then
  begin
    CRDEngineError('PELogOnSQLServerWithPrivateInfo');
  end
  else
  begin
    Result := TPELogOnSQLServerWithPrivateInfo(CrpeLogOnSQLServerWithPrivateInfo)(dllName, privateInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PEVerifyDatabase function                                                    }
{------------------------------------------------------------------------------}
function PEVerifyDatabase (printJob : Smallint): Bool;
var
  CrpeVerifyDatabase : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {VerifyDatabase applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEVerifyDatabase requires SCR 7 or higher');
    Exit;
  end;
  CrpeVerifyDatabase := GetProcAddress(CRDEngine, 'PEVerifyDatabase');
  if CrpeVerifyDatabase = nil then
  begin
    CRDEngineError('PEVerifyDatabase');
  end
  else
  begin
    Result := TPEVerifyDatabase(CrpeVerifyDatabase)(printJob);
  end;
end;

{------------------------------------------------------------------------------}
{ PECheckNthTableDifferences function                                          }
{------------------------------------------------------------------------------}
function PECheckNthTableDifferences (printJob: Smallint;
  tableN: Smallint; var tableDifferenceInfo: PETableDifferenceInfo): Bool;
var
  CrpeCheckNthTableDifferences : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {CheckDifferences applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PECheckNthTableDifferences requires SCR 7 or higher');
    Exit;
  end;
  CrpeCheckNthTableDifferences := GetProcAddress(CRDEngine, 'PECheckNthTableDifferences');
  if CrpeCheckNthTableDifferences = nil then
  begin
    CRDEngineError('PECheckNthTableDifferences');
  end
  else
  begin
    tableDifferenceInfo.StructSize := SizeOf(PETableDifferenceInfo);
    Result := TPECheckNthTableDifferences(CrpeCheckNthTableDifferences)
      (printJob, tableN, tableDifferenceInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetSQLQuery function                                                       }
{------------------------------------------------------------------------------}
function PEGetSQLQuery (printJob: Smallint; var textHandle: HWnd;
  var textLength: Smallint): Bool;
var
  CrpeGetSQLQuery : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetSQLQuery := GetProcAddress(CRDEngine, 'PEGetSQLQuery');
  if CrpeGetSQLQuery = nil then
  begin
    CRDEngineError('PEGetSQLQuery');
  end
  else
  begin
    Result := TPEGetSQLQuery(CrpeGetSQLQuery)(printJob, textHandle, textLength);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetSQLQuery function                                                       }
{------------------------------------------------------------------------------}
function PESetSQLQuery (printJob: Smallint; queryString: PChar): Bool;
var
  CrpeSetSQLQuery : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetSQLQuery := GetProcAddress(CRDEngine, 'PESetSQLQuery');
  if CrpeSetSQLQuery = nil then
  begin
    CRDEngineError('PESetSQLQuery');
  end
  else
  begin
    Result := TPESetSQLQuery(CrpeSetSQLQuery)(printJob, queryString);
  end;
end;

{------------------------------------------------------------------------------}
{ PEHasSavedData function                                                      }
{------------------------------------------------------------------------------}
function PEHasSavedData (printJob: Smallint; var hasSavedData: Bool): Bool;
var
  CrpeHasSavedData : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeHasSavedData := GetProcAddress(CRDEngine, 'PEHasSavedData');
  if CrpeHasSavedData = nil then
  begin
    CRDEngineError('PEHasSavedData');
  end
  else
  begin
    Result := TPEHasSavedData(CrpeHasSavedData)(printJob, hasSavedData);
  end;
end;

{------------------------------------------------------------------------------}
{ PEDiscardSavedData function                                                  }
{------------------------------------------------------------------------------}
function PEDiscardSavedData (printJob : Smallint): Bool;
var
  CrpeDiscardSavedData : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeDiscardSavedData := GetProcAddress(CRDEngine, 'PEDiscardSavedData');
  if CrpeDiscardSavedData = nil then
  begin
    CRDEngineError('PEDiscardSavedData');
  end
  else
  begin
    Result := TPEDiscardSavedData(CrpeDiscardSavedData)(printJob);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetReportTitle function                                                    }
{------------------------------------------------------------------------------}
function PEGetReportTitle (printJob: Smallint; var titleHandle: HWnd;
  var titleLength: Smallint): Bool;
var
  CrpeGetReportTitle : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetReportTitle := GetProcAddress(CRDEngine, 'PEGetReportTitle');
  if CrpeGetReportTitle = nil then
  begin
    CRDEngineError('PEGetReportTitle');
  end
  else
  begin
    Result := TPEGetReportTitle(CrpeGetReportTitle)(printJob,
      titleHandle, titleLength);
    LogEvent('PEGetReportTitle',printJob,@titleHandle,
      @titleLength,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetReportTitle',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetReportTitle function                                                    }
{------------------------------------------------------------------------------}
function PESetReportTitle (printJob: Smallint; title: PChar): Bool;
var
  CrpeSetReportTitle : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetReportTitle := GetProcAddress(CRDEngine, 'PESetReportTitle');
  if CrpeSetReportTitle = nil then
  begin
    CRDEngineError('PESetReportTitle');
  end
  else
  begin
    Result := TPESetReportTitle(CrpeSetReportTitle)(printJob, title);
  end;
end;

{------------------------------------------------------------------------------}
{ PEOutputToWindow function                                                    }
{------------------------------------------------------------------------------}
function PEOutputToWindow (printJob: Smallint; title: PChar; left: DWord;
  top: DWord; width: DWord; height: DWord; style: DWord; parentWindow: HWnd): Bool;
var
  CrpeOutputToWindow : TFarProc;
  WinHandle          : HWnd;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeOutputToWindow := GetProcAddress(CRDEngine, 'PEOutputToWindow');
  if CrpeOutputToWindow = nil then
  begin
    CRDEngineError('PEOutputToWindow');
  end
  else
  begin
    WinHandle := parentWindow;
    Result := TPEOutputToWindow(CrpeOutputToWindow)(printJob, title,
      left, top, width, height, style, WinHandle);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetWindowHandle function                                                   }
{------------------------------------------------------------------------------}
function PEGetWindowHandle (printJob: Smallint): HWnd;
var
  CrpeGetWindowHandle : TFarProc;
  hWin                : HWnd;
begin
  CRDEngineError('');
  Result := 0;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetWindowHandle := GetProcAddress(CRDEngine, 'PEGetWindowHandle');
  if CrpeGetWindowHandle = nil then
  begin
    CRDEngineError('PEGetWindowHandle');
  end
  else
  begin
    LogEvent('PEGetWindowHandle',printJob,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPEGetWindowHandle(CrpeGetWindowHandle)(printJob);
    hWin := Result;
    LogResult('PEGetWindowHandle',False,hWin);
  end;
end;

{------------------------------------------------------------------------------}
{ PECloseWindow procedure                                                      }
{------------------------------------------------------------------------------}
procedure PECloseWindow (printJob: Smallint);
var
  CrpeCloseWindow : TFarProc;
begin
  CRDEngineError('');
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeCloseWindow := GetProcAddress(CRDEngine, 'PECloseWindow');
  if CrpeCloseWindow = nil then
  begin
    CRDEngineError('PECloseWindow');
  end
  else
  begin
    TPECloseWindow(CrpeCloseWindow)(printJob);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetWindowOptions function                                                  }
{------------------------------------------------------------------------------}
function PEGetWindowOptions (printJob: Smallint; var options: PEWindowOptions): Bool;
var
  CrpeGetWindowOptions : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {WindowOptions applies to SCR6+}
  if CRDVerMajor < 6 then
  begin
    CRDEngineError('PEGetWindowOptions requires SCR 6 or higher');
    Exit;
  end;
  CrpeGetWindowOptions := GetProcAddress(CRDEngine, 'PEGetWindowOptions');
  if CrpeGetWindowOptions = nil then
  begin
    CRDEngineError('PEGetWindowOptions');
  end
  else
  begin
    if CRDVerMajor < 7 then
    begin
      options.structSize := SizeOf(PEWindowOptions6);
      options.showToolbarTips := 0;
      options.showDocumentTips := 0;
    end
    else
      options.structSize := SizeOf(PEWindowOptions);
    Result := TPEGetWindowOptions(CrpeGetWindowOptions)(printJob, options);
    LogEvent('PEGetWindowOptions',printJob,@options,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetWindowOptions',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetWindowOptions function                                                  }
{------------------------------------------------------------------------------}
function PESetWindowOptions (printJob: Smallint; var options: PEWindowOptions): Bool;
var
  CrpeSetWindowOptions : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {WindowOptions applies to SCR6+}
  if CRDVerMajor < 6 then
  begin
    CRDEngineError('PESetWindowOptions requires SCR 6 or higher');
    Exit;
  end;
  CrpeSetWindowOptions := GetProcAddress(CRDEngine, 'PESetWindowOptions');
  if CrpeSetWindowOptions = nil then
  begin
    CRDEngineError('PESetWindowOptions');
  end
  else
  begin
    if CRDVerMajor < 7 then
      options.structSize := SizeOf(PEWindowOptions6)
    else
      options.structSize := SizeOf(PEWindowOptions);
    Result := TPESetWindowOptions(CrpeSetWindowOptions)(printJob, options);
  end;
end;

{------------------------------------------------------------------------------}
{ PEShowPrintControls function                                                 }
{------------------------------------------------------------------------------}
function PEShowPrintControls (printJob: Smallint; showPrintControls: Bool): Bool;
var
  CrpeShowPrintControls : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeShowPrintControls := GetProcAddress(CRDEngine, 'PEShowPrintControls');
  if CrpeShowPrintControls = nil then
  begin
    CRDEngineError('PEShowPrintControls');
  end
  else
  begin
    Result := TPEShowPrintControls(CrpeShowPrintControls)
      (printJob, showPrintControls);
  end;
end;

{------------------------------------------------------------------------------}
{ PEPrintControlsShowing function                                              }
{------------------------------------------------------------------------------}
function PEPrintControlsShowing (printJob: Smallint; var controlsShowing: Bool): Bool;
var
  CrpePrintControlsShowing : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpePrintControlsShowing := GetProcAddress(CRDEngine, 'PEPrintControlsShowing');
  if CrpePrintControlsShowing = nil then
  begin
    CRDEngineError('PEPrintControlsShowing');
  end
  else
  begin
    Result := TPEPrintControlsShowing(CrpePrintControlsShowing)
      (printJob, controlsShowing);
  end;
end;

{------------------------------------------------------------------------------}
{ PEShowFirstPage function                                                     }
{------------------------------------------------------------------------------}
function PEShowFirstPage (printJob: Smallint): Bool;
var
  CrpeShowFirstPage : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeShowFirstPage := GetProcAddress(CRDEngine, 'PEShowFirstPage');
  if CrpeShowFirstPage = nil then
  begin
    CRDEngineError('PEShowFirstPage');
  end
  else
  begin
    Result := TPEShowFirstPage(CrpeShowFirstPage)(printJob);
  end;
end;

{------------------------------------------------------------------------------}
{ PEShowNextPage function                                                      }
{------------------------------------------------------------------------------}
function PEShowNextPage (printJob: Smallint): Bool;
var
  CrpeShowNextPage : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeShowNextPage := GetProcAddress(CRDEngine, 'PEShowNextPage');
  if CrpeShowNextPage = nil then
  begin
    CRDEngineError('PEShowNextPage');
  end
  else
  begin
    Result := TPEShowNextPage(CrpeShowNextPage)(printJob);
  end;
end;

{------------------------------------------------------------------------------}
{ PEShowPreviousPage function                                                  }
{------------------------------------------------------------------------------}
function PEShowPreviousPage (printJob: Smallint): Bool;
var
  CrpeShowPreviousPage : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeShowPreviousPage := GetProcAddress(CRDEngine, 'PEShowPreviousPage');
  if CrpeShowPreviousPage = nil then
  begin
    CRDEngineError('PEShowPreviousPage');
  end
  else
  begin
    Result := TPEShowPreviousPage(CrpeShowPreviousPage)(printJob);
  end;
end;

{------------------------------------------------------------------------------}
{ PEShowLastPage function                                                      }
{------------------------------------------------------------------------------}
function PEShowLastPage (printJob: Smallint): Bool;
var
  CrpeShowLastPage : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeShowLastPage := GetProcAddress(CRDEngine, 'PEShowLastPage');
  if CrpeShowLastPage = nil then
  begin
    CRDEngineError('PEShowLastPage');
  end
  else
  begin
    Result := TPEShowLastPage(CrpeShowLastPage)(printJob);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNPages function                                                         }
{------------------------------------------------------------------------------}
function PEGetNPages (printJob: Smallint): Smallint;
var
  CrpeGetNPages : TFarProc;
begin
  CRDEngineError('');
  Result := -1;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNPages := GetProcAddress(CRDEngine, 'PEGetNPages');
  if CrpeGetNPages = nil then
  begin
    CRDEngineError('PEGetNPages');
  end
  else
  begin
    LogEvent('PEGetNPages',printJob,nil,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    Result := TPEGetNPages(CrpeGetNPages)(printJob);
    LogResult('PEGetNPages',False,Result);
  end;
end;

{------------------------------------------------------------------------------}
{ PEShowNthPage function                                                       }
{------------------------------------------------------------------------------}
function PEShowNthPage (printJob: Smallint; pageN: Smallint): Bool;
var
  CrpeShowNthPage : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeShowNthPage := GetProcAddress(CRDEngine, 'PEShowNthPage');
  if CrpeShowNthPage = nil then
  begin
    CRDEngineError('PEShowNthPage');
  end
  else
  begin
    Result := TPEShowNthPage(CrpeShowNthPage)(printJob, pageN);
  end;
end;

{------------------------------------------------------------------------------}
{ PEZoomPreviewWindow function                                                 }
{------------------------------------------------------------------------------}
function PEZoomPreviewWindow (printJob: Smallint; level: Smallint): Bool;
var
  CrpeZoomPreviewWindow : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeZoomPreviewWindow := GetProcAddress(CRDEngine, 'PEZoomPreviewWindow');
  if CrpeZoomPreviewWindow = nil then
  begin
    CRDEngineError('PEZoomPreviewWindow');
  end
  else
  begin
    Result := TPEZoomPreviewWindow(CrpeZoomPreviewWindow)(printJob, level);
  end;
end;

{------------------------------------------------------------------------------}
{ PENextPrintWindowMagnification function                                      }
{------------------------------------------------------------------------------}
function PENextPrintWindowMagnification (printJob:  Smallint): Bool;
var
  CrpeNextPrintWindowMagnification : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeNextPrintWindowMagnification := GetProcAddress(CRDEngine, 'PENextPrintWindowMagnification');
  if CrpeNextPrintWindowMagnification = nil then
  begin
    CRDEngineError('PENextPrintWindowMagnification');
  end
  else
  begin
    Result := TPENextPrintWindowMagnification(CrpeNextPrintWindowMagnification)
      (printJob);
  end;
end;

{------------------------------------------------------------------------------}
{ PEPrintWindow function                                                       }
{------------------------------------------------------------------------------}
function PEPrintWindow (printJob: Smallint; waitUntilDone: Bool): Bool;
var
  CrpePrintWindow : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpePrintWindow := GetProcAddress(CRDEngine, 'PEPrintWindow');
  if CrpePrintWindow = nil then
  begin
    CRDEngineError('PEPrintWindow');
  end
  else
  begin
    Result := TPEPrintWindow(CrpePrintWindow)(printJob, waitUntilDone);
  end;
end;

{------------------------------------------------------------------------------}
{ PEExportPrintWindow function                                                 }
{------------------------------------------------------------------------------}
function PEExportPrintWindow (printJob: Smallint; toMail: Bool;
  waitUntilDone: Bool): Bool;
var
  CrpeExportPrintWindow : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeExportPrintWindow := GetProcAddress(CRDEngine, 'PEExportPrintWindow');
  if CrpeExportPrintWindow = nil then
  begin
    CRDEngineError('PEExportPrintWindow');
  end
  else
  begin
    Result := TPEExportPrintWindow(CrpeExportPrintWindow)
      (printJob, toMail, waitUntilDone);
  end;
end;

{------------------------------------------------------------------------------}
{ PEOutputToPrinter function                                                   }
{------------------------------------------------------------------------------}
function PEOutputToPrinter (printJob: Smallint; nCopies: Smallint): Bool;
var
  CrpeOutputToPrinter : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeOutputToPrinter := GetProcAddress(CRDEngine, 'PEOutputToPrinter');
  if CrpeOutputToPrinter = nil then
  begin
    CRDEngineError('PEOutputToPrinter');
  end
  else
  begin
    Result := TPEOutputToPrinter(CrpeOutputToPrinter)(printJob, nCopies);
  end;
end;

{------------------------------------------------------------------------------}
{ PESelectPrinter function                                                     }
{------------------------------------------------------------------------------}
function PESelectPrinter (printJob: Smallint; driverName: PChar;
  printerName: PChar; portName: PChar; mode: PDevMode): Bool;
var
  CrpeSelectPrinter : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSelectPrinter := GetProcAddress(CRDEngine, 'PESelectPrinter');
  if CrpeSelectPrinter = nil then
  begin
    CRDEngineError('PESelectPrinter');
  end
  else
  begin
    Result := TPESelectPrinter(CrpeSelectPrinter)(printJob, driverName,
      printerName, portName, mode);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetSelectedPrinter function                                                }
{------------------------------------------------------------------------------}
function PEGetSelectedPrinter (printJob: Smallint; var driverHandle: Hwnd;
  var driverLength: Smallint; var printerHandle: Hwnd; var printerLength: Smallint;
  var portHandle: Hwnd; var portLength: Smallint; var mode: PDevMode): Bool;
var
  CrpeGetSelectedPrinter : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetSelectedPrinter := GetProcAddress(CRDEngine, 'PEGetSelectedPrinter');
  if CrpeGetSelectedPrinter = nil then
  begin
    CRDEngineError('PEGetSelectedPrinter');
  end
  else
  begin
    Result := TPEGetSelectedPrinter(CrpeGetSelectedPrinter)(printJob,
      driverHandle, driverLength, printerHandle, printerLength,
      portHandle, portLength, mode);
    LogEvent('PEGetSelectedPrinter',printJob,@driverHandle,
      @driverLength,@printerHandle,@printerLength,@portHandle,@portLength,@mode,
      nil,nil,nil,nil);
    LogResult('PEGetSelectedPrinter',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetNDetailCopies function                                                  }
{------------------------------------------------------------------------------}
function PEGetNDetailCopies (printJob: Smallint; var nCopies: Smallint): Bool;
var
  CrpeGetNDetailCopies : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetNDetailCopies := GetProcAddress(CRDEngine, 'PEGetNDetailCopies');
  if CrpeGetNDetailCopies = nil then
  begin
    CRDEngineError('PEGetNDetailCopies');
  end
  else
  begin
    Result := TPEGetNDetailCopies(CrpeGetNDetailCopies)(printJob, nCopies);
    LogEvent('PEGetNDetailCopies',printJob,@nCopies,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetNDetailCopies',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetNDetailCopies function                                                  }
{------------------------------------------------------------------------------}
function PESetNDetailCopies (printJob: Smallint; nCopies: Smallint): Bool;
var
  CrpeSetNDetailCopies : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetNDetailCopies := GetProcAddress(CRDEngine, 'PESetNDetailCopies');
  if CrpeSetNDetailCopies = nil then
  begin
    CRDEngineError('PESetNDetailCopies');
  end
  else
  begin
    Result := TPESetNDetailCopies(CrpeSetNDetailCopies)(printJob, nCopies);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetPrintOptions function                                                   }
{------------------------------------------------------------------------------}
function PEGetPrintOptions (printJob: Smallint; var options: PEPrintOptions): Bool;
var
  CrpeGetPrintOptions : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetPrintOptions := GetProcAddress(CRDEngine, 'PEGetPrintOptions');
  if CrpeGetPrintOptions = nil then
  begin
    CRDEngineError('PEGetPrintOptions');
  end
  else
  begin
    if CRDVerMajor < 7 then
    begin
      options.StructSize := SizeOf(PEPrintOptions56);
      StrCopy(options.outputFileName,'');
    end
    else
      options.StructSize := SizeOf(PEPrintOptions);
    Result := TPEGetPrintOptions(CrpeGetPrintOptions)(printJob, options);
    LogEvent('PEGetPrintOptions',printJob,@options,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetPrintOptions',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetPrintOptions function                                                   }
{------------------------------------------------------------------------------}
function PESetPrintOptions (printJob: Smallint; var options: PEPrintOptions): Bool;
var
  CrpeSetPrintOptions : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetPrintOptions := GetProcAddress(CRDEngine, 'PESetPrintOptions');
  if CrpeSetPrintOptions = nil then
  begin
    CRDEngineError('PESetPrintOptions');
  end
  else
  begin
    if @options <> nil then
    begin
      if CRDVerMajor < 7 then
        options.StructSize := SizeOf(PEPrintOptions56)
      else
        options.StructSize := SizeOf(PEPrintOptions);
    end;
    Result := TPESetPrintOptions(CrpeSetPrintOptions)(printJob, options);
  end;
end;

{------------------------------------------------------------------------------}
{ PEOutputToFax function                                                       }
{------------------------------------------------------------------------------}
function PEOutputToFax (printJob: Smallint; faxDriver: SmallInt;
  var faxOptions: PEFaxOptions): Bool;
var
  CrpeOutputToFax : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {OutputToFax applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEOutputToFax requires SCR 7 or higher');
    Exit;
  end;
  CrpeOutputToFax := GetProcAddress(CRDEngine, 'PEOutputToFax');
  if CrpeOutputToFax = nil then
  begin
    CRDEngineError('PEOutputToFax');
  end
  else
  begin
    faxOptions.structSize := SizeOf(PEFaxOptions);
    Result := TPEOutputToFax(CrpeOutputToFax)(printJob, faxDriver, faxOptions);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetExportOptions function                                                  }
{------------------------------------------------------------------------------}
function PEGetExportOptions (printJob: Smallint; var options: PEExportOptions): Bool;
var
  CrpeGetExportOptions : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetExportOptions := GetProcAddress(CRDEngine, 'PEGetExportOptions');
  if CrpeGetExportOptions = nil then
  begin
    CRDEngineError('PEGetExportOptions');
  end
  else
  begin
    options.structSize := SizeOf(PEExportOptions);
    Result := TPEGetExportOptions(CrpeGetExportOptions)(printJob, options);
    LogEvent('PEGetExportOptions',printJob,@options,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetExportOptions',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PEExportTo function                                                          }
{------------------------------------------------------------------------------}
function PEExportTo (printJob: Smallint; var options: PEExportOptions): Bool;
var
  CrpeExportTo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeExportTo := GetProcAddress(CRDEngine, 'PEExportTo');
  if CrpeExportTo = nil then
  begin
    CRDEngineError('PEExportTo');
  end
  else
  begin
    options.structSize := SizeOf(PEExportOptions);
    Result := TPEExportTo(CrpeExportTo)(printJob, options);
  end;
end;

{------------------------------------------------------------------------------}
{ PEOutputToFile function                                                      }
{------------------------------------------------------------------------------}
function PEOutputToFile (printJob: Smallint; outputFilePath: PChar;
  fileType: SmallInt; options: Pointer): Bool;
var
  CrpeOutputToFile : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeOutputToFile := GetProcAddress(CRDEngine, 'PEOutputToFile');
  if CrpeOutputToFile = nil then
  begin
    CRDEngineError('PEOutputToFile');
  end
  else
  begin
    Result := TPEOutputToFile(CrpeOutputToFile)(printJob, outputFilePath,
      fileType, options);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetMargins function                                                        }
{------------------------------------------------------------------------------}
function PEGetMargins (printJob: Smallint; var left: Word;
  var right: Word; var top: Word; var bottom: Word): Bool;
var
  CrpeGetMargins : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeGetMargins := GetProcAddress(CRDEngine, 'PEGetMargins');
  if CrpeGetMargins = nil then
  begin
    CRDEngineError('PEGetMargins');
  end
  else
  begin
    Result := TPEGetMargins(CrpeGetMargins)(printJob, left, right,
      top, bottom);
    LogEvent('PEGetMargins',printJob,@left,
      @right,@top,@bottom,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetMargins',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetMargins function                                                        }
{------------------------------------------------------------------------------}
function PESetMargins (printJob: Smallint; left: Word; right: Word;
  top: Word; bottom: Word): Bool;
var
  CrpeSetMargins : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  CrpeSetMargins := GetProcAddress(CRDEngine, 'PESetMargins');
  if CrpeSetMargins = nil then
  begin
    CRDEngineError('PESetMargins');
  end
  else
  begin
    Result := TPESetMargins(CrpeSetMargins)(printJob, left, right,
      top, bottom);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetReportSummaryInfo function                                              }
{------------------------------------------------------------------------------}
function PEGetReportSummaryInfo (printJob: Smallint;
  var summaryInfo: PEReportSummaryInfo): Bool;
var
  CrpeGetReportSummaryInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {SummaryInfo applies to SCR6+}
  if CRDVerMajor < 6 then
  begin
    CRDEngineError('PEGetReportSummaryInfo requires SCR 6 or higher');
    Exit;
  end;
  CrpeGetReportSummaryInfo := GetProcAddress(CRDEngine, 'PEGetReportSummaryInfo');
  if CrpeGetReportSummaryInfo = nil then
  begin
    CRDEngineError('PEGetReportSummaryInfo');
  end
  else
  begin
    summaryInfo.structSize := SizeOf(PEReportSummaryInfo);
    Result := TPEGetReportSummaryInfo(CrpeGetReportSummaryInfo)
      (printJob, summaryInfo);
    LogEvent('PEGetReportSummaryInfo',printJob,@summaryInfo,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetReportSummaryInfo',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetReportSummaryInfo function                                              }
{------------------------------------------------------------------------------}
function PESetReportSummaryInfo (printJob: Smallint;
  var summaryInfo: PEReportSummaryInfo): Bool;
var
  CrpeSetReportSummaryInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {SummaryInfo applies to SCR6+}
  if CRDVerMajor < 6 then
  begin
    CRDEngineError('PESetReportSummaryInfo requires SCR 6 or higher');
    Exit;
  end;
  CrpeSetReportSummaryInfo := GetProcAddress(CRDEngine, 'PESetReportSummaryInfo');
  if CrpeSetReportSummaryInfo = nil then
  begin
    CRDEngineError('PESetReportSummaryInfo');
  end
  else
  begin
    summaryInfo.structSize := SizeOf(PEReportSummaryInfo);
    Result := TPESetReportSummaryInfo(CrpeSetReportSummaryInfo)
      (printJob, summaryInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PEEnableEvent function                                                       }
{------------------------------------------------------------------------------}
function PEEnableEvent (printJob: Smallint; var enableEventInfo: PEEnableEventInfo): Bool;
var
  CrpeEnableEvent : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {Events only apply to SCR6+}
  if CRDVerMajor < 6 then
  begin
    CRDEngineError('PEEnableEvent requires SCR 6 or higher');
    Exit;
  end;
  CrpeEnableEvent := GetProcAddress(CRDEngine, 'PEEnableEvent');
  if CrpeEnableEvent = nil then
  begin
    CRDEngineError('PEEnableEvent');
  end
  else
  begin
    {EventInfo in 7.0 has different structure size}
    if CRDVerMajor < 7 then
    begin
      enableEventInfo.structSize := SizeOf(PEEnableEventInfo6);
      enableEventInfo.fieldMappingEvent := 0;
      enableEventInfo.mouseClickEvent := 0;
    end
    else
      enableEventInfo.structSize := SizeOf(PEEnableEventInfo);
    Result := TPEEnableEvent(CrpeEnableEvent)(printJob, enableEventInfo);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetEnableEventInfo function                                                }
{------------------------------------------------------------------------------}
function PEGetEnableEventInfo (printJob: Smallint;
  var enableEventInfo: PEEnableEventInfo): Bool;
var
  CrpeGetEnableEventInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {Events only apply to SCR6+}
  if CRDVerMajor < 6 then
  begin
    CRDEngineError('PEGetEnableEventInfo requires SCR 6 or higher');
    Exit;
  end;
  CrpeGetEnableEventInfo := GetProcAddress(CRDEngine, 'PEGetEnableEventInfo');
  if CrpeGetEnableEventInfo = nil then
  begin
    CRDEngineError('PEGetEnableEventInfo');
  end
  else
  begin
    enableEventInfo.structSize := SizeOf(PEEnableEventInfo);
    Result := TPEGetEnableEventInfo(CrpeGetEnableEventInfo)
      (printJob, enableEventInfo);
    LogEvent('PEGetEnableEventInfo',printJob,@enableEventInfo,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetEnableEventInfo',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetEventCallback function                                                  }
{------------------------------------------------------------------------------}
function PESetEventCallback (printJob: Smallint; callbackProc: Pointer;
  userData: Pointer): Bool;
var
  CrpeSetEventCallback : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {Events only apply to SCR6+}
  if CRDVerMajor < 6 then
  begin
    CRDEngineError('PESetEventCallback requires SCR 6 or higher');
    Exit;
  end;
  CrpeSetEventCallback := GetProcAddress(CRDEngine, 'PESetEventCallback');
  if CrpeSetEventCallback = nil then
  begin
    CRDEngineError('PESetEventCallback');
  end
  else
  begin
    Result := TPESetEventCallback(CrpeSetEventCallback)
      (printJob, callbackProc, userData);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetFieldMappingType function                                               }
{------------------------------------------------------------------------------}
function PEGetFieldMappingType (printJob: Smallint; var mappingType: Word): Bool;
var
  CrpeGetFieldMappingType : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {FieldMapping only applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PEGetFieldMappingType requires SCR 7 or higher');
    Exit;
  end;
  CrpeGetFieldMappingType := GetProcAddress(CRDEngine, 'PEGetFieldMappingType');
  if CrpeGetFieldMappingType = nil then
  begin
    CRDEngineError('PEGetFieldMappingType');
  end
  else
  begin
    Result := TPEGetFieldMappingType(CrpeGetFieldMappingType)
      (printJob, mappingType);
    LogEvent('PEGetFieldMappingType',printJob,@mappingType,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetFieldMappingType',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetFieldMappingType function                                               }
{------------------------------------------------------------------------------}
function PESetFieldMappingType (printJob: Smallint; mappingType: Word): Bool;
var
  CrpeSetFieldMappingType : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {FieldMapping only applies to SCR7+}
  if CRDVerMajor < 7 then
  begin
    CRDEngineError('PESetFieldMappingType requires SCR 7 or higher');
    Exit;
  end;
  CrpeSetFieldMappingType := GetProcAddress(CRDEngine, 'PESetFieldMappingType');
  if CrpeSetFieldMappingType = nil then
  begin
    CRDEngineError('PESetFieldMappingType');
  end
  else
  begin
    Result := TPESetFieldMappingType(CrpeSetFieldMappingType)
      (printJob, mappingType);
  end;
end;

{------------------------------------------------------------------------------}
{ PEGetTrackCursorInfo function                                                }
{------------------------------------------------------------------------------}
function PEGetTrackCursorInfo (printJob: Smallint; var cursorInfo: PETrackCursorInfo): Bool;
var
  CrpeGetTrackCursorInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {TrackCursor only applies to SCR6+}
  if CRDVerMajor < 6 then
  begin
    CRDEngineError('PEGetTrackCursorInfo requires SCR 6 or higher');
    Exit;
  end;
  CrpeGetTrackCursorInfo := GetProcAddress(CRDEngine, 'PEGetTrackCursorInfo');
  if CrpeGetTrackCursorInfo = nil then
  begin
    CRDEngineError('PEGetTrackCursorInfo');
  end
  else
  begin
    cursorInfo.structSize := SizeOf(PETrackCursorInfo);
    Result := TPEGetTrackCursorInfo(CrpeGetTrackCursorInfo)
      (printJob, cursorInfo);
    LogEvent('PEGetTrackCursorInfo',printJob,@cursorInfo,
      nil,nil,nil,nil,nil,nil,nil,nil,nil,nil);
    LogResult('PEGetTrackCursorInfo',Result,0);
  end;
end;

{------------------------------------------------------------------------------}
{ PESetTrackCursorInfo function                                                }
{------------------------------------------------------------------------------}
function PESetTrackCursorInfo (printJob: Smallint; var cursorInfo: PETrackCursorInfo): Bool;
var
  CrpeSetTrackCursorInfo : TFarProc;
begin
  CRDEngineError('');
  Result := False;
  {Check if Engine is loaded}
  if CRDEngine = 0 then
  begin
    CRDEngineError(CRD_ENGINE_NOT_LOADED);
    Exit;
  end;
  {TrackCursor only applies to SCR6+}
  if CRDVerMajor < 6 then
  begin
    CRDEngineError('PEGetTrackCursorInfo requires SCR 6 or higher');
    Exit;
  end;
  CrpeSetTrackCursorInfo := GetProcAddress(CRDEngine, 'PESetTrackCursorInfo');
  if CrpeSetTrackCursorInfo = nil then
  begin
    CRDEngineError('PESetTrackCursorInfo');
  end
  else
  begin
    cursorInfo.structSize := SizeOf(PETrackCursorInfo);
    Result := TPESetTrackCursorInfo(CrpeSetTrackCursorInfo)
      (printJob, cursorInfo);
  end;
end;


initialization
  CRDLog        := nil;  {TCrpeLog Component variable}
  CRDEngine     := 0;    {CRPE.DLL Handle}
  CRDErrorStr   := '';   {Clear Error String}
  CRDVerMajor   := 7;    {SCR 7.0 by default}
  CRDVerMinor   := 0;
  CRDShowErrors := True; {Show Errors with built-in handler}

end.
