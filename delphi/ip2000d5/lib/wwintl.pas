unit Wwintl;
{
//
// Components : TwwInternational
//
// Copyright (c) 1995,1996,1998 by Woll2Woll Software
//
// 11/10/97 - Add Bold, Italic, Underline for PopupMenuLabels
//
// 12/23/98 - Include Redo hint for richedit editor in Delphi 4
}

{$i wwIfDef.pas}

{$ifdef wwDelphi3Up}
{$DEFINE NEWIPSETUP}
{$endif}
{$ifdef VER93}
{$DEFINE NEWIPSETUP}
{$endif}

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, wwstr,
{$ifdef NEWIPSETUP}
  Registry,
{$endif}
  Buttons;

type

  TwwUserMessagesIntl = class(TPersistent)
  private
     FwwDBGridDiscardChanges: string;
     FPictureValidateError: string;
     FLocateNoMatches: string;
     FLocateNoMoreMatches: string;
     FMemoChangesWarning:string;
     FRichEditExitWarning: string;
     FRichEditClearWarning: string;
     FRichEditSpellCheckComplete: string;
     FRichEditMSWordNotFound: string;
{     FRichEditLoadWarning: string;}
     FFilterDlgNoCriteria: string;
     FRecordViewExitWarning: string;
  published
     property wwDBGridDiscardChanges: string read FwwDBGridDiscardChanges write FwwDBGridDiscardChanges;
     property PictureValidateError: string read FPictureValidateError write FPictureValidateError;
     property LocateNoMatches: string read FLocateNoMatches write FLocateNoMatches;
     property LocateNoMoreMatches: string read FLocateNoMoreMatches write FLocateNoMoreMatches;
     property MemoChangesWarning: string read FMemoChangesWarning write FMemoChangesWarning;
     property RichEditExitWarning: string read FRichEditExitWarning write FRichEditExitWarning;
     property RichEditClearWarning: string read FRichEditClearWarning write FRichEditClearWarning;
     property RichEditSpellCheckComplete: string read FRichEditSpellCheckComplete write FRichEditSpellCheckComplete;
     property RichEditMSWordNotFound: string read FRichEditMSWordNotFound write FRichEditMSWordNotFound;

     {     property RichEditLoadWarning: string read FRichEditLoadWarning write FRichEditLoadWarning;}
     property FilterDlgNoCriteria : string read FFilterDlgNoCriteria write FFilterDlgNoCriteria;
     property RecordViewExitWarning: string read FRecordViewExitWarning write FRecordViewExitWarning;
  end;

  TwwFilterDialogIntl = class(TPersistent)
  private
      FBtnViewSummary : string;
      FBtnViewSummaryHint  : string;
      FViewSummaryNotText : string;
      FBtnNewSearch  : string;
      FBtnNewSearchHint  : string;
      FFieldOrderLabel  : string;
      FFieldOrderHint : string;
      FAlphabeticLabel : string;
      FLogicalLabel : string;
      FAllFieldsLabel : string;
      FSearchedFieldsLabel : string;
      FStartingRangeLabel : string;
      FEndingRangeLabel : string;
      FStartingRangeHint : string;
      FEndingRangeHint: string;
      FBtnClearMin : string;
      FBtnClearMax : string;
      FBtnClearFiltervalue : string;
      FBtnClearMinHint : string;
      FBtnClearMaxHint : string;
      FBtnClearFilterValueHint : string;
      FByValueLabel  : string;
      FByRangeLabel  : string;
      FFieldValueLabel  : string;
      FFieldValueHint  : string;
      FSearchTypeLabel  : string;
      FSearchTypeHint  : string;
      FMatchExactLabel  : string;
      FMatchStartLabel  : string;
      FMatchAnyLabel  : string;
      FCaseSensitiveLabel  : string;
      FCaseSensitiveHint  : string;
      FNonMatchingLabel   : string;
      FNonMatchingHint    : string;
      FSummaryFieldLabel: string;
      FSummarySearchLabel: string;
      FSummaryValueLabel : string;
      {$ifdef wwdelphi4up}
      FSummaryCaption: string;
      {$endif}
      FFieldsLabel: string;
      FValueRangeTabHint : string;
      FAllSearchedTabHint : string;

  published
      property BtnViewSummary : string read     FBtnViewSummary write FBtnViewSummary;
      property BtnViewSummaryHint  : string read FBtnViewSummaryHint write FBtnViewSummaryHint;
      property BtnNewSearch  : string read      FBtnNewSearch write FBtnNewSearch;
      property BtnNewSearchHint  : string read  FBtnNewSearchHint write FBtnNewSearchHint;
      property FieldOrderLabel  : string read   FFieldOrderLabel write FFieldOrderLabel;
      property FieldOrderHint : string read     FFieldOrderHint write FFieldOrderHint;
      property AlphabeticLabel : string read    FAlphabeticLabel write FAlphabeticLabel;
      property LogicalLabel : string read       FLogicalLabel write FLogicalLabel;
      property AllFieldsLabel : string read     FAllFieldsLabel write FAllFieldsLabel;
      property SearchedFieldsLabel : string read FSearchedFieldsLabel write FSearchedFieldsLabel;
      property StartingRangeLabel : string read FStartingRangeLabel write FStartingRangeLabel;
      property EndingRangeLabel : string read   FEndingRangeLabel write FEndingRangeLabel;
      property StartingRangeHint : string read FStartingRangeHint write FStartingRangeHint;
      property EndingRangeHint: string read     FEndingRangeHint write FEndingRangeHint;
      property BtnClearMin : string read        FBtnClearMin write FBtnClearMin;
      property BtnClearMax : string read        FBtnClearMax write FBtnClearMax;
      property BtnClearFilterValue : string read FBtnClearFilterValue write FBtnClearFilterValue;
      property BtnClearMinHint : string read    FBtnClearMinHint write FBtnClearMinHint;
      property BtnClearMaxHint : string read    FBtnClearMaxHint write FBtnClearMaxHint;
      property BtnClearFilterValueHint : string read FBtnClearFilterValueHint write FBtnClearFilterValueHint;
      property ByValueLabel  : string read      FByValueLabel write FByValueLabel;
      property ByRangeLabel  : string read      FByRangeLabel write FByRangeLabel;
      property FieldValueLabel  : string read   FFieldValueLabel write FFieldValueLabel;
      property FieldValueHint  : string read   FFieldValueHint write FFieldValueHint;
      property SearchTypeLabel  : string read   FSearchTypeLabel write FSearchTypeLabel;
      property SearchTypeHint  : string read   FSearchTypeHint write FSearchTypeHint;
      property MatchExactLabel  : string read   FMatchExactLabel write FMatchExactLabel;
      property MatchStartLabel  : string read   FMatchStartLabel write FMatchStartLabel;
      property MatchAnyLabel  : string read     FMatchAnyLabel write FMatchAnyLabel;
      property CaseSensitiveLabel  : string read FCaseSensitiveLabel write FCaseSensitiveLabel;
      property CaseSensitiveHint  : string read FCaseSensitiveHint write FCaseSensitiveHint;
      property NonMatchingLabel  : string read FNonMatchingLabel write FNonMatchingLabel;
      property NonMatchingHint  : string read FNonMatchingHint write FNonMatchingHint;
      property SummaryFieldLabel: string read FSummaryFieldLabel write FSummaryFieldLabel;
      property SummarySearchLabel: string read FSummarySearchLabel write FSummarySearchLabel;
      property SummaryValueLabel : string read FSummaryValueLabel write FSummaryValueLabel;
      {$ifdef wwdelphi4up}
      property SummaryCaption : string read FSummaryCaption write FSummaryCaption;
      {$endif}
      property FieldsLabel: string read FFieldsLabel write FFieldsLabel;
      property ValueRangeTabHint : string read FValueRangeTabHint write FValueRangeTabHint;
      property AllSearchedTabHint : string read FAllSearchedTabHint write FAllSearchedTabHint;
      property ViewSummaryNotText : string read FViewSummaryNotText write FViewSummaryNotText;

  end;

  TwwRichEditMenuLabels = class(TPersistent)
  private
     FFileCaption: string;
     FLoadCaption: string;
     FSaveAsCaption: string;
     FSaveExitCaption: string;
     FPrintCaption: string;
     FPageSetupCaption: string;
     FExitCaption: string;

     FEditCaption: string;
     FUndoCaption: string;
     FCutCaption: string;
     FCopyCaption: string;
     FPasteCaption: string;
     FClearCaption: string;
     FSelectallCaption: string;
     FFindCaption: string;
     FFindNextCaption: string;
     FReplaceCaption: string;
     FInsertObjectCaption: string;
     FSpellCheckCaption: string;
     {$ifdef wwdelphi4up}
     FInsertCaption: string;
     FRulerCaption: string;
     FRedoCaption: string;
     {$endif}

     FViewCaption: string;
     FToolbarCaption: string;
     FFormatBarCaption: string;
     FViewStatusBarCaption: string;
     FOptionsCaption: string;

     FFormatCaption: string;
     FFontCaption: string;
     FBulletStyleCaption: string;
     FParagraphCaption: string;
     FTabsCaption: string;

     FHelpCaption: string;
  published
     property FileCaption : string read FFileCaption write FFileCaption;
     property LoadCaption : string read FLoadCaption write FLoadCaption;
     property SaveAsCaption : string read FSaveAsCaption write FSaveAsCaption;
     property SaveExitCaption : string read FSaveExitCaption write FSaveExitCaption;
     property PrintCaption : string read FPrintCaption write FPrintCaption;
     property PageSetupCaption : string read FPageSetupCaption write FPageSetupCaption;
     property ExitCaption : string read FExitCaption write FExitCaption;

     property EditCaption : string read FEditCaption write FEditCaption;
     property UndoCaption : string read FUndoCaption write FUndoCaption;
     property CutCaption : string read FCutCaption write FCutCaption;
     property CopyCaption : string read FCopyCaption write FCopyCaption;
     property PasteCaption : string read FPasteCaption write FPasteCaption;
     property ClearCaption : string read FClearCaption write FClearCaption;
     property SelectallCaption : string read FSelectallCaption write FSelectallCaption;
     property FindCaption : string read FFindCaption write FFindCaption;
     property FindNextCaption : string read FFindNextCaption write FFindNextCaption;
     property ReplaceCaption : string read FReplaceCaption write FReplaceCaption;
     property InsertObjectCaption : string read FInsertObjectCaption write FInsertObjectCaption;
     property SpellCheckCaption : string read FSpellCheckCaption write FSpellCheckCaption;
     {$ifdef wwdelphi4up}
     property InsertCaption : string read FInsertCaption write FInsertCaption;
     property RulerCaption: string read FRulerCaption write FRulerCaption;
     property RedoCaption: string read FRedoCaption write FRedoCaption;
     {$endif}
     property ViewCaption : string read FViewCaption write FViewCaption;
     property ToolbarCaption : string read FToolbarCaption write FToolbarCaption;
     property FormatBarCaption : string read FFormatBarCaption write FFormatBarCaption;
     property ViewStatusBarCaption : string read FViewStatusBarCaption write FViewStatusBarCaption;
     property OptionsCaption : string read FOptionsCaption write FOptionsCaption;

     property FormatCaption : string read FFormatCaption write FFormatCaption;
     property FontCaption : string read FFontCaption write FFontCaption;
     property BulletStyleCaption : string read FBulletStyleCaption write FBulletStyleCaption;
     property ParagraphCaption : string read FParagraphCaption write FParagraphCaption;
     property TabsCaption : string read FTabsCaption write FTabsCaption;

     property HelpCaption : string read FHelpCaption write FHelpCaption;
  end;

  TwwRichEditPopupMenuLabels = class(TPersistent)
  private
   {PopupMenu Captions for accelerators}
     FEditCaption: string;
     FViewCaption: string;
     FCutCaption: string;
     FCopyCaption: string;
     FPasteCaption: string;
     FFontCaption: string;
     FBulletStyleCaption: string;
     FBoldCaption: string;
     FItalicCaption: string;
     FUnderlineCaption: string;
     FParagraphCaption: string;
     FTabsCaption: string;
     FFindCaption: string;
     FReplaceCaption: string;
     FInsertObjectCaption: string;
     FSpellCheckCaption: string;
  published
    {PopupMenu Captions for accelerators}
     property EditCaption : string read FEditCaption write FEditCaption;
     property ViewCaption : string read FViewCaption write FViewCaption;
     property CutCaption : string read FCutCaption write FCutCaption;
     property CopyCaption : string read FCopyCaption write FCopyCaption;
     property PasteCaption : string read FPasteCaption write FPasteCaption;
     property FontCaption : string read FFontCaption write FFontCaption;
     property BulletStyleCaption : string read FBulletStyleCaption write FBulletStyleCaption;
     property BoldCaption : string read FBoldCaption write FBoldCaption;
     property ItalicCaption : string read FItalicCaption write FItalicCaption;
     property UnderlineCaption : string read FUnderlineCaption write FUnderlineCaption;
     property ParagraphCaption : string read FParagraphCaption write FParagraphCaption;
     property TabsCaption : string read FTabsCaption write FTabsCaption;
     property FindCaption : string read FFindCaption write FFindCaption;
     property ReplaceCaption : string read FReplaceCaption write FReplaceCaption;
     property InsertObjectCaption : string read FInsertObjectCaption write FInsertObjectCaption;
     property SpellCheckCaption : string read FSpellCheckCaption write FSpellCheckCaption;
  end;

  TwwRichEditParagraphDlg = class(TPersistent)
  private
     FParagraphDlgCaption: string;
     FIndentationGroupBoxCaption: string;
     FLeftEditCaption: string;
     FRightEditCaption: string;
     FFirstLineEditCaption: string;
     FAlignmentCaption: string;
     FLeftEditHint: string;
     FRightEditHint: string;
     FFirstLineEditHint: string;
     FSpacingGroupCaption: string;
     FBeforeParagraphCaption: string;
     FAfterParagraphCaption: string;
     FWithinParagraphCaption: string;
     FWithinParagraphAtCaption: string;
     FAlignmentHint: string;
     FAlignLeft:string;
     FAlignRight:string;
     FAlignCenter:string;
     {$ifdef wwdelphi4up}
     FSpacingSingle,
     FSpacing1_5,
     FSpacingDouble,
     FSpacingAtLeast,
     FSpacingExactly,
     FSpacingMultiple: string;
     {$endif}
  published
     property ParagraphDlgCaption : string read FParagraphDlgCaption write FParagraphDlgCaption;
     property IndentationGroupBoxCaption : string read FIndentationGroupBoxCaption
                                                 write FIndentationGroupBoxCaption;
     property LeftEditHint : string read FLeftEditHint write FLeftEditHint;
     property RightEditHint : string read FRightEditHint write FRightEditHint;
     property FirstLineEditHint : string read FFirstLineEditHint write FFirstLineEditHint;
     property AlignmentHint : string read FAlignmentHint write FAlignmentHint;
     property LeftEditCaption : string read FLeftEditCaption write FLeftEditCaption;
     property RightEditCaption : string read FRightEditCaption write FRightEditCaption;
     property FirstLineEditCaption : string read FFirstLineEditCaption write FFirstLineEditCaption;
     property SpacingGroupCaption: string read FSpacingGroupCaption write FSpacingGroupCaption;
     property BeforeParagraphCaption: string read FBeforeParagraphCaption write FBeforeParagraphCaption;
     property AfterParagraphCaption: string read FAfterParagraphCaption write FAfterParagraphCaption;
     property WithinParagraphCaption: string read FWithinParagraphCaption write FWithinParagraphCaption;
     property WithinParagraphAtCaption: string read FWithinParagraphAtCaption write FWithinParagraphAtCaption;
     property AlignmentCaption : string read FAlignmentCaption write FAlignmentCaption;
     property AlignLeft : string read FAlignLeft write FAlignLeft;
     property AlignRight : string read FAlignRight write FAlignRight;
     property AlignCenter : string read FAlignCenter write FAlignCenter;
     {$ifdef wwdelphi4up}
     property SpacingSingle: string read FSpacingSingle write FSpacingSingle;
     property Spacing1_5: string read FSpacing1_5 write FSpacing1_5;
     property SpacingDouble : string read FSpacingDouble write FSpacingDouble;
     property SpacingAtLeast: string read FSpacingAtLeast write FSpacingAtLeast;
     property SpacingExactly : string read FSpacingExactly write FSpacingExactly;
     property SpacingMultiple: string read FSpacingMultiple write FSpacingMultiple;
     {$endif}
  end;

  TwwRichEditTabDlg = class(TPersistent)
  private
     FTabDlgCaption: string;
     FTabGroupBoxCaption: string;
     FSetTabButtonCaption: string;
     FClearTabButtonCaption: string;
     FClearAllButtonCaption: string;

     FTabPositionEditHint: string;
     FListBoxHint: string;
     FSetButtonHint: string;
     FClearButtonHint: string;
     FClearAllButtonHint:string;
  published
     property TabDlgCaption : string read FTabDlgCaption write FTabDlgCaption;
     property TabGroupBoxCaption : string read FTabGroupBoxCaption write FTabGroupBoxCaption;
     property SetTabButtonCaption : string read FSetTabButtonCaption write FSetTabButtonCaption;
     property ClearTabButtonCaption : string read FClearTabButtonCaption write FClearTabButtonCaption;
     property ClearAllButtonCaption : string read FClearAllButtonCaption write FClearAllButtonCaption;
     property TabPositionEditHint : string read FTabPositionEditHint write FTabPositionEditHint;
     property ListBoxHint : string read FListBoxHint write FListBoxHint;
     property SetButtonHint : string read FSetButtonHint write FSetButtonHint;
     property ClearButtonHint : string read FClearButtonHint write FClearButtonHint;
     property ClearAllButtonHint : string read FClearAllButtonHint write FClearAllButtonHint;
  end;


  TwwDBRichEditIntl = class(TPersistent)
  private
      FFontNameComboHint : string;
      FFontSizeComboHint : string;

      FNewButtonHint : string;
      FLoadButtonHint : string;
      FSaveAsButtonHint : string;
      FPrintButtonHint : string;
      FFindButtonHint : string;
      FCutButtonHint : string;
      FCopyButtonHint : string;
      FUndoButtonHint : string;
      {$ifdef wwDelphi4Up}
      FRedoButtonHint : string;
      {$endif}
      FPasteButtonHint : string;
      FBoldButtonHint :string;
      FUnderlineButtonHint : string;
      FItalicButtonHint : string;
      FLeftButtonHint : string;
      FCenterButtonHint : string;
      FRightButtonHint : string;
      FBulletButtonHint : string;
      FHighlightButtonHint: string;

      FSaveExitHint : string;
      FPageSetupHint: string;
      FExitHint: string;

      FClearHint: string;
      FSelectAllHint: string;
      FFindNextHint: string;
      FReplaceHint: string;
      FInsertObjectHint: string;
      FSpellCheckHint: string;

      FToolbarHint: string;
      FFormatBarHint: string;
      FViewStatusBarHint : string;
      FOptionsHint: string;

      FFontHint: string;
      FParagraphHint: string;
      FTabsHint: string;

      FMenuLabels: TwwRichEditMenuLabels;
      FPopupMenuLabels:TwwRichEditPopupMenuLabels;
      FParagraphDialog:TwwRichEditParagraphDlg;
      FTabDialog:TwwRichEditTabDlg;

      FCAPLockCaption: string;
      FNUMLockCaption: string;
  public
      destructor Destroy; override;
  published
      property FontNameComboHint : string read FFontNameComboHint write FFontNameComboHint;
      property FontSizeComboHint : string read FFontSizeComboHint write FFontSizeComboHint;

      property NewButtonHint : string read FNewButtonHint write FNewButtonHint;
      property LoadButtonHint : string read FLoadButtonHint write FLoadButtonHint ;
      property SaveAsButtonHint : string read FSaveAsButtonHint write FSaveAsButtonHint ;
      property PrintButtonHint : string read FPrintButtonHint write FPrintButtonHint;
      property FindButtonHint : string read FFindButtonHint write FFindButtonHint;
      property CutButtonHint : string read FCutButtonHint write FCutButtonHint;
      property CopyButtonHint : string read FCopyButtonHint write FCopyButtonHint;
      property UndoButtonHint : string read FUndoButtonHint write FUndoButtonHint;
      {$ifdef wwDelphi4Up}
      property RedoButtonHint : string read FRedoButtonHint write FRedoButtonHint;
      {$endif}
      property PasteButtonHint : string read FPasteButtonHint write FPasteButtonHint;
      property BoldButtonHint : string read FBoldButtonHint write FBoldButtonHint;
      property UnderlineButtonHint : string read FUnderlineButtonHint write FUnderlineButtonHint;
      property ItalicButtonHint : string read FItalicButtonHint write FItalicButtonHint;
      property LeftButtonHint : string read FLeftButtonHint write FLeftButtonHint;
      property CenterButtonHint : string read FCenterButtonHint write FCenterButtonHint;
      property RightButtonHint : string read FRightButtonHint write FRightButtonHint;
      property BulletButtonHint : string read FBulletButtonHint write FBulletButtonHint;
      property HighlightButtonHint : string read FHighlightButtonHint write FHighlightButtonHint;

      property SaveExitHint : string read FSaveExitHint write FSaveExitHint;
      property PageSetupHint : string read FPageSetupHint write FPageSetupHint;
      property ExitHint : string read FExitHint write FExitHint;

      property ClearHint : string read FClearHint write FClearHint ;
      property SelectAllHint : string read FSelectAllHint write FSelectAllHint;
      property FindNextHint : string read FFindNextHint write FFindNextHint;
      property ReplaceHint : string read FReplaceHint write FReplaceHint;
      property InsertObjectHint : string read FInsertObjectHint write FInsertObjectHint;
      property SpellCheckHint : string read FSpellCheckHint write FSpellCheckHint;

      property ToolbarHint : string read FToolbarHint write FToolbarHint;
      property FormatBarHint : string read FFormatBarHint write FFormatBarHint;
      property ViewStatusBarHint : string read FViewStatusBarHint write FViewStatusBarHint;
      property OptionsHint : string read FOptionsHint write FOptionsHint;

      property FontHint : string read FFontHint write FFontHint;
      property ParagraphHint : string read FParagraphHint write FParagraphHint;
      property TabsHint : string read FTabsHint write FTabsHint;

      property CAPLockCaption : string read FCAPLockCaption write FCAPLockCaption;
      property NUMLockCaption : string read FNUMLockCaption write FNUMLockCaption;

      property MenuLabels : TwwRichEditMenuLabels read FMenuLabels write FMenuLabels;
      property PopupMenuLabels : TwwRichEditPopupMenuLabels read FPopupMenuLabels write FPopupMenuLabels;
      property ParagraphDialog : TwwRichEditParagraphDlg read FParagraphDialog write FParagraphDialog;
      property TabDialog : TwwRichEditTabDlg read FTabDialog write FTabDialog;

  end;

  TwwSearchDialogIntl = class(TPersistent)
  private
    FSearchCharLabel: string;
    FSearchCharShortLabel: string;
    FSearchByLabel: string;
    FStatusRecLabel: string;
    FStatusOfLabel: string;
    FSearchCharHint: string;
    FSearchByHint: string;
  published
    property SearchCharLabel: string read FSearchCharLabel write FSearchCharLabel;
    property SearchCharShortLabel: string read FSearchCharShortLabel write FSearchCharShortLabel;
    property SearchByLabel: string read FSearchByLabel write FSearchByLabel;
    property StatusRecLabel: string read FStatusRecLabel write FStatusRecLabel;
    property StatusOfLabel : string read FStatusOfLabel write FStatusOfLabel;
    property SearchCharHint: string read FSearchCharHint write FSearchCharHint;
    property SearchByHint: string read FSearchByHint write FSearchByHint;
  end;

  TwwMonthCalendarIntl = class(TPersistent)
  private
    FPopupYearLabel: string;
    FEnterYearPrompt : string;
  published
    property PopupYearLabel: string read FPopupYearLabel write FPopupYearLabel;
    property EnterYearPrompt: string read FEnterYearPrompt write FEnterYearPrompt;
  end;


  TwwLocateDialogIntl = class(TPersistent)
  private
    FFieldValueLabel: string;
    FSearchTypeLabel: string;
    FCaseSensitiveLabel: string;
    FMatchExactLabel: string;
    FMatchStartLabel: string;
    FMatchAnyLabel: string;
    FFieldsLabel: string;
    FButtonFirst: string;
    FButtonNext: string;
    FButtonCancel: string;
    FFieldValueHint: string;
    FCaseSensitiveHint: string;
    FMatchExactHint: string;
    FMatchStartHint: string;
    FMatchAnyHint: string;
    FButtonFirstHint: string;
    FButtonNextHint: string;
    FFieldNameHint: string;
  published
    property FieldValueLabel: string read FFieldValueLabel write FFieldValueLabel;
    property SearchTypeLabel: string read FSearchTypeLabel write FSearchTypeLabel;
    property CaseSensitiveLabel: string read FCaseSensitiveLabel write FCaseSensitiveLabel;
    property MatchExactLabel: string read FMatchExactLabel write FMatchExactlabel;
    property MatchStartLabel: string read FMatchStartLabel write FMatchStartLabel;
    property MatchAnyLabel: string read FMatchAnyLabel write FMatchAnyLabel;
    property FieldsLabel: string read FFieldsLabel write FFieldsLabel;
    property BtnFirst: string read FButtonFirst write FButtonFirst;
    property BtnNext: string read FButtonNext write FButtonNext;
    property BtnCancel: string read FButtonCancel write FButtonCancel;

    property FieldValueHint: string read FFieldValueHint write FFieldValueHint;
    property CaseSensitiveHint: string read FCaseSensitiveHint write FCaseSensitiveHint;
    property MatchExactHint: string read FMatchExactHint write FMatchExactHint;
    property MatchStartHint: string read FMatchStartHint write FMatchStartHint;
    property MatchAnyHint: string read FMatchAnyHint write FMatchAnyHint;
    property BtnFirstHint: string read FButtonFirstHint write FButtonFirstHint;
    property BtnNextHint: string read FButtonNextHint write FButtonNextHint;

    property FieldNameHint: string read FFieldNameHint write FFieldNameHint;
  end;

  TwwDBNavigatorIntlHints = class(TPersistent)
  private
    FFirstHint: string;
    FPriorHint: string;
    FNextHint: string;
    FLastHint: string;
    FInsertHint: string;
    FDeleteHint: string;
    FEditHint: string;
    FPostHint: string;
    FCancelHint: string;
    FRefreshHint: string;
    FPriorPageHint: string;
    FNextPageHint: string;
    FSaveBookmarkHint: string;
    FRestoreBookmarkHint: string;
    FRecordViewDialogHint: string;
    FLocateDialogHint: string;
    FFilterDialogHint: string;
    FSearchDialogHint: string;
  public
    constructor Create;
  published
    property FirstHint: string read FFirstHint write FFirstHint;
    property PriorHint: string read FPriorHint write FPriorHint;
    property NextHint: string read FNextHint write FNextHint;
    property LastHint: string read FLastHint write FLastHint;
    property InsertHint: string read FInsertHint write FInsertHint;
    property DeleteHint: string read FDeleteHint write FDeleteHint;
    property EditHint: string read FEditHint write FEditHint;
    property PostHint: string read FPostHint write FPostHint;
    property CancelHint: string read FCancelHint write FCancelHint;
    property RefreshHint: string read FRefreshHint write FRefreshHint;
    property PriorPageHint: string read FPriorPageHint write FPriorPageHint;
    property NextPageHint: string read FNextPageHint write FNextPageHint;
    property SaveBookmarkHint: string read FSaveBookmarkHint write FSaveBookmarkHint;
    property RestoreBookmarkHint: string read FRestoreBookmarkHint write FRestoreBookmarkHint;
    property RecordViewDialogHint: string read FRecordViewDialogHint write FRecordViewDialogHint;
    property LocateDialogHint: string read FLocateDialogHint write FLocateDialogHint;
    property FilterDialogHint: string read FFilterDialogHint write FFilterDialogHint;
    property SearchDialogHint: string read FSearchDialogHint write FSearchDialogHint;
  end;

  TwwDBNavigatorIntl = class(TPersistent)
  private
    FConfirmDeleteMessage: string;
    FHints: TwwDBNavigatorIntlHints;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property ConfirmDeleteMessage: string read FConfirmDeleteMessage write FConfirmDeleteMessage;
    property Hints: TwwDBNavigatorIntlHints read FHints write FHints;
  end;

  TwwCheckBoxInGridStyle = (cbStyleAuto, cbStyleCheckmark, cbStyleXmark);

  TwwIntl = class(TComponent)
  private
    FNavigator: TwwDBNavigatorIntl;
    FSearchDialog: TwwSearchDialogIntl;
    FLocateDialog: TwwLocateDialogIntl;
    FMonthCalendar: TwwMonthCalendarIntl;
    FOKCancelBitmapped: boolean;
    FDialogFontStyle: TFontStyles;
    FBtnOKCaption: string;
    FBtnCancelCaption: string;
    FConnected: Boolean;
    FUserMessages: TwwUserMessagesIntl;
    FFilterDialog: TwwFilterDialogIntl;
    FRichEdit: TwwDBRichEditIntl;
    FIPVersion: string;
    FIniFileName: string;
    FRegistrationNo: string;
    FFastSQLCancelRange: boolean;
    FCheckBoxInGridStyle: TwwCheckBoxInGridStyle;
    FUseLocateMethodForSearch: boolean;
    FDefaultEpochYear: Integer;
    FFilterMemoSize: integer;
    Procedure SetConnected(val: boolean);
    Procedure SetIPVersion(val: string);
    {$ifdef NEWIPSETUP}
    Procedure SetRegistrationNo(val: string);
    {$endif}

    Procedure SetCheckboxInGridStyle(val: TwwCheckboxInGridStyle);

  protected
    Procedure Loaded; override;
    Procedure Connect;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property FastSQLCancelRange: boolean read FFastSQLCancelRange write FFastSQLCancelRange;

    {$ifndef wwDelphi3Up}
    property UseLocateMethodForSearch: boolean read FUseLocateMethodForSearch write FUseLocateMethodForSearch default True;
    {$ENDIF}
  published
     property Navigator: TwwDBNavigatorIntl read FNavigator write FNavigator;
     property SearchDialog: TwwSearchDialogIntl read FSearchDialog write FSearchDialog;
     property LocateDialog: TwwLocateDialogIntl read FLocateDialog write FLocateDialog;
     property MonthCalendar: TwwMonthCalendarIntl read FMonthCalendar write FMonthCalendar;
     property FilterDialog: TwwFilterDialogIntl read FFilterDialog write FFilterDialog;
     property RichEdit: TwwDBRichEditIntl read FRichEdit write FRichEdit;
     property UserMessages: TwwUserMessagesIntl read FUserMessages write FUserMessages;
     property OKCancelBitmapped: boolean read FOKCancelBitmapped write FOKCancelBitmapped;
     property BtnOKCaption: string read FBtnOKCaption write FBtnOKCaption;
     property BtnCancelCaption: string read FBtnCancelCaption write FBtnCancelCaption;
     property CheckBoxInGridStyle: TwwCheckBoxInGridStyle read FCheckBoxInGridStyle write SetCheckboxInGridStyle;
     property VersionInfoPower: string read FIPVersion write SetIPVersion;
     property FilterMemoSize: integer read FFilterMemoSize write FFilterMemoSize;
     property IniFileName: string read FIniFileName write FIniFileName;
     {$ifdef wwDelphi3Up}
     property UseLocateMethodForSearch: boolean read FUseLocateMethodForSearch write FUseLocateMethodForSearch default True;
     {$ENDIF}
     property DialogFontStyle: TFontStyles read FDialogFontStyle write FDialogFontStyle;
     {$IFDEF WIN32}
     property DefaultEpochYear: integer read FDefaultEpochYear write FDefaultEpochYear default 1950;
     {$ENDIF}
     {$ifdef NEWIPSETUP}
     property RegistrationNo: string read FRegistrationNo write SetRegistrationNo;
     {$endif}
     property Connected: boolean read FConnected write SetConnected;
  end;

  Function wwCreateCommonButton(AOwner: TForm;
   ButtonKind: TBitBtnKind): TComponent;


procedure Register;


var wwInternational: TwwIntl;

implementation

uses StdCtrls;

constructor TwwIntl.Create(AOwner: TComponent);
{$ifdef NEWIPSETUP}
var ipReg: TRegIniFile;
{$endif}
begin
   inherited Create(AOwner);
   FIPVersion:= '5.0 Pre B';

   {$ifdef NEWIPSETUP}
   if csDesigning in ComponentState then begin
      ipreg := TRegIniFile.create('');
      FRegistrationNo:=
         ipreg.ReadString('\Software\Woll2Woll\InfoPower', 'Reg. No.', '');
      ipreg.free;
   end;
   {$endif}
   FFastSQLCancelRange:= True;
   FUseLocateMethodForSearch:= True;
   FDefaultEpochYear := 1950;
   FFilterMemoSize:= $10000; { 64k }

   FFilterDialog:= TwwFilterDialogIntl.create;
   with FFilterDialog do
   begin
      FBtnViewSummary := 'View Su&mmary';
      FBtnViewSummaryHint  := 'View summary of current search criteria';
      FBtnNewSearch  := '&New Search';
      FBtnNewSearchHint  := 'Start a new search';
      FFieldOrderLabel  := 'Field Order';
      FFieldOrderHint := 'Sort field list alphabetically or in their natural logical order';
      FAlphabeticLabel := 'Alpha&betic';
      FLogicalLabel := '&Logical';
      FAllFieldsLabel := '&All';
      FSearchedFieldsLabel := '&Searched';
      FStartingRangeLabel := '&Starting Range';
      FEndingRangeLabel := 'En&ding Range';
      FBtnClearMin := '&Clear';
      FBtnClearMax := 'Cl&ear';
      FBtnClearFilterValue := '&Clear';
      FStartingRangeHint := 'Enter starting range for field';
      FEndingRangeHint := 'Enter ending range for field';
      FBtnClearMinHint := 'Clear starting range for field';
      FBtnClearMaxHint := 'Clear ending range for field';
      FBtnClearFilterValueHint:= 'Clear the current field''s search value';
      FByValueLabel  := 'By &Value';
      FByRangeLabel  := 'By &Range';
      FFieldValueLabel  := 'Field &Value';
      FFieldValueHint:= 'Enter field''s search value';
      FSearchTypeLabel  := 'Search Type';
      FSearchTypeHint:= 'Specify how the Field Value should be compared';
      FMatchExactLabel  := '&Exact Match';
      FMatchStartLabel  := '&Partial Match at Beginning';
      FMatchAnyLabel  := 'Partial Match Any&where';
      FCaseSensitiveLabel  := 'Case Sensi&tive';
      FCaseSensitiveHint  := 'Searching is case-sensitive';
      FNonMatchingLabel := 'N&on-matching records';
      FNonMatchingHint := 'Show records that do not match the field value criteria';
      FSummaryFieldLabel:= 'Field';
      FSummarySearchLabel:= 'Search Type';
      FSummaryValueLabel := 'Value';
      {$ifdef wwdelphi4up}
      FSummaryCaption:= ''; { Use default }
      {$endif}
      FFieldsLabel:= '&Fields';
      FValueRangeTabHint := 'Search fields by value or by range';
      FAllSearchedTabHint := 'Show all fields or only currently searched fields';
      FViewSummaryNotText := 'NOT';
   end;

   FRichEdit := TwwDBRichEditIntl.create;
   with FRichEdit do
   begin
      FFontNameComboHint := 'Font | Changes the font of the selection';
      FFontSizeComboHint := 'Font Size | Changes the font size of the selection';

      FNewButtonHint := 'New | Creates a new document';
      FLoadButtonHint := 'Load | Load from file';
      FSaveAsButtonHint := 'Save As | Save to file';
      FPrintButtonHint := 'Print | Prints the active document';
      FFindButtonHint := 'Find | Finds the specified text';
      FCutButtonHint := 'Cut | Cuts the selection and puts it on the Clipboard';
      FCopyButtonHint := 'Copy | Copies the selection and puts it on the Clipboard';
      FUndoButtonHint := 'Undo | Reverses the last action';
      {$ifdef wwDelphi4Up}
      FRedoButtonHint := ''; {Redo | Reverses the last undo action';}
      {$endif}
      FPasteButtonHint := 'Paste | Inserts Clipboard contents';
      FBoldButtonHint := 'Bold | Makes the selection bold (toggle)';
      FUnderlineButtonHint := 'Underline | Formats the selection with a continuous underline (toggle)';
      FItalicButtonHint := 'Italic | Makes the selection italic (toggle)';
      FLeftButtonHint := 'Align Left | Left-justifies paragraph (toggle)';
      FCenterButtonHint := 'Center | Center-justifies paragraph (toggle)';
      FRightButtonHint := 'Align Right | Right-justifies paragraph (toggle)';
      FBulletButtonHint := 'Bullets | Inserts a bullet on this line (toggle)';
      FHighlightButtonHint:= 'Highlight Text | Makes the selection highlighted';
      FSaveExitHint := 'Save And Exit | Saves changes and exits editor';
      FPageSetupHint:='Page Setup | Changes page layout settings';
      FExitHint:= 'Exit';

      FClearHint:= 'Erases the Selection';
      FSelectAllHint:= 'Selects all of the text';
      FFindNextHint:= 'Repeats the last find';
      FReplaceHint:='Replaces specific text with different text';
      FInsertObjectHint:='Inserts new embedded object';
      FSpellCheckHint:='Check spelling';

      FToolbarHint:= 'Shows or hides the toolbar';
      FFormatBarHint:= 'Shows or hides the format bar';
      FViewStatusBarHint :='Shows or hides the status bar';
      FOptionsHint:='Sets options';

      FFontHint:='Selects font for current selection';
      FParagraphHint:= 'Formats current or selected paragraph(s)';
      FTabsHint:='Sets tabs';

      FMenuLabels:= TwwRichEditMenuLabels.create;
      MenuLabels.FileCaption := '&File';
      MenuLabels.LoadCaption := '&Load';
      MenuLabels.SaveAsCaption := 'Save &As';
      MenuLabels.SaveExitCaption := '&Save and Exit';
      MenuLabels.PrintCaption := '&Print';
      MenuLabels.PageSetupCaption := 'Page Set&up';
      MenuLabels.ExitCaption := 'E&xit';

      MenuLabels.EditCaption := '&Edit';
      MenuLabels.UndoCaption := '&Undo';
      MenuLabels.CutCaption := 'Cu&t';
      MenuLabels.CopyCaption := '&Copy';
      MenuLabels.PasteCaption := '&Paste';
      MenuLabels.ClearCaption := 'Cle&ar';
      MenuLabels.SelectallCaption := 'Select A&ll';
      MenuLabels.FindCaption:= '&Find';
      MenuLabels.FindNextCaption:='Find &Next';
      MenuLabels.ReplaceCaption:= 'R&eplace';
      MenuLabels.InsertObjectCaption:= '&Object...';
      MenuLabels.SpellCheckCaption:= 'Check Spelling';
//      {$ifdef wwdelphi4up}
//      MenuLabels.InsertCaption:= '&Insert';
//      MenuLabels.RulerCaption:= '&Ruler';
//      {$endif}

      MenuLabels.ViewCaption := '&View';
      MenuLabels.ToolbarCaption:= '&Toolbar';
      MenuLabels.FormatBarCaption:='&Format Bar';
      MenuLabels.ViewStatusBarCaption:='&Status Bar';
      MenuLabels.OptionsCaption:= '&Options';

      MenuLabels.FormatCaption:= 'F&ormat';
      MenuLabels.FontCaption:= '&Font';
      MenuLabels.BulletStyleCaption:='&Bullet Style';
      MenuLabels.ParagraphCaption:='&Paragraph';
      MenuLabels.TabsCaption := '&Tabs';

      MenuLabels.HelpCaption := 'Help';

      FPopupMenuLabels:= TwwRichEditPopupMenuLabels.create;
      {PopupMenu Captions for accelerators}
      PopupMenuLabels.EditCaption:= '&Edit';
      PopupMenuLabels.ViewCaption:= '&View';
      PopupMenuLabels.CutCaption:= 'Cu&t';
      PopupMenuLabels.CopyCaption:= '&Copy';
      PopupMenuLabels.PasteCaption:= '&Paste';
      PopupMenuLabels.FontCaption:= '&Font';
      PopupMenuLabels.BulletStyleCaption:= '&Bullet Style';
      PopupMenuLabels.BoldCaption:='B&old';
      PopupMenuLabels.ItalicCaption:='&Italic';
      PopupMenuLabels.UnderlineCaption:='&Underline';
      PopupMenuLabels.ParagraphCaption:='P&aragraph';
      PopupMenuLabels.TabsCaption:= '&Tabs';
      PopupMenuLabels.FindCaption:='Fin&d';
      PopupMenuLabels.ReplaceCaption:='&Replace';
      PopupMenuLabels.InsertObjectCaption:='Insert &Object...';
      PopupMenuLabels.SpellCheckCaption:='Check Spelling';

      CAPLockCaption := 'CAP';
      NUMLockCaption := 'NUM';

      FParagraphDialog:= TwwRichEditParagraphDlg.create;

      ParagraphDialog.ParagraphDlgCaption:='Paragraph';
      ParagraphDialog.IndentationGroupBoxCaption:='Indentation';

      ParagraphDialog.LeftEditCaption:='Left:';
      ParagraphDialog.RightEditCaption:='Right:';
      ParagraphDialog.FirstLineEditCaption:='First line:';
      ParagraphDialog.AlignmentCaption:='Alignment';

      ParagraphDialog.SpacingGroupCaption:='Spacing';
      ParagraphDialog.BeforeParagraphCaption:='&Before';
      ParagraphDialog.AfterParagraphCaption:='Aft&er';
      ParagraphDialog.WithinParagraphCaption:='Li&ne Spacing';
      ParagraphDialog.WithinParagraphAtCaption:='&At';

      ParagraphDialog.FLeftEditHint:='Left Indentation';
      ParagraphDialog.FRightEditHint:='Right Indentation';
      ParagraphDialog.FFirstLineEditHint:='First Line of Paragraph Indentation';
      ParagraphDialog.FAlignmentHint:='Changes Alignment of Paragraph';

      ParagraphDialog.AlignLeft:= 'Left';
      ParagraphDialog.AlignRight:= 'Right';
      ParagraphDialog.AlignCenter:= 'Center';

      FTabDialog:= TwwRichEditTabDlg.create;

      TabDialog.TabDlgCaption:='Tab';
      TabDialog.FTabGroupBoxCaption:='&Tab Stop Position';
      TabDialog.FSetTabButtonCaption:='Set';
      TabDialog.FClearTabButtonCaption:='Clear';
      TabDialog.FClearAllButtonCaption:='Clear All';

      TabDialog.FTabPositionEditHint:='Tab Position Edit Box';
      TabDialog.FListBoxHint:='List of tabs and their positions';
      TabDialog.FSetButtonHint:='Set a new tab position';
      TabDialog.FClearButtonHint:='Clear the selected tab position';
      TabDialog.FClearAllButtonHint:= 'Clear all the tabs';
   end;

   FNavigator := TwwDBNavigatorIntl.Create;

   FMonthCalendar := TwwMonthCalendarIntl.create;
   with FMonthCalendar do
   begin
      PopupYearLabel := 'Edit Year';
      EnterYearPrompt := 'Enter Valid Year';
   end;


   FSearchDialog:= TwwSearchDialogIntl.create;
   with FSearchDialog do
   begin
      SearchCharLabel:= '&Search Characters';
      SearchCharShortLabel:= '&Search Char';
      SearchByLabel:= 'Search &By';
      StatusRecLabel:= 'Rec #';
      StatusOfLabel := 'of';
      SearchCharHint:= 'Enter characters for incremental search';
      SearchByHint:= 'Incremental searching and sorting order';
   end;
   FLocateDialog:= TwwLocateDialogIntl.create;
   with FLocateDialog do
   begin
      FieldValueLabel:= 'Field &Value';
      SearchTypeLabel:= '&Search Type';
      CaseSensitiveLabel:= '&Case-sensitive';
      MatchExactLabel:= '&Exact Match';
      MatchStartLabel:= '&Partial Match at Beginning';
      MatchAnyLabel:= 'Partial Match &Anywhere';
      FieldsLabel:= '&Fields';
      BtnFirst:= 'Fi&rst';
      BtnNext:= '&Next';
      BtnCancel:= 'Cancel';
      FieldValueHint:= 'Enter field''s search value';
      CaseSensitiveHint:= 'Searching is case-sensitive';
      MatchExactHint:= 'Match occurs only if there is an exact match';
      MatchStartHint:= 'Match occurs if the start of the field''s value matches';
      MatchAnyHint:= 'Match occurs if any part of the field matches';
      BtnFirstHint:= 'Find first match';
      BtnNextHint:= 'Find next match from current record';
      FieldNameHint:= 'Select the field to search on';
   end;
   FUserMessages:= TwwUserMessagesIntl.create;
   with FUserMessages do
   begin
      wwDBGridDiscardChanges:= 'Discard changes to this record?';
      PictureValidateError:= 'Invalid characters. Field : ';
      LocateNoMatches:= 'No matches found';
      LocateNoMoreMatches:= 'No more matches found';
      MemoChangesWarning:= 'Changes have been made!  Are you sure you wish to cancel?';
      RichEditExitWarning:= 'Changes have been made!  Do you wish to save your changes?';
      RichEditClearWarning:= 'Clear entire text?';
      RichEditSpellCheckComplete:= 'The spell check is complete.';
      RichEditMSWordNotFound:= 'Unable to start Microsoft Word''s Spell Checker.';
{      RichEditLoadWarning:= 'Replace current contents with Rich Text from a file?';}
      FilterDlgNoCriteria:= 'You have not selected any search criteria';
      RecordViewExitWarning:= 'Changes have been made!  Do you wish to save your changes?';
   end;
   FOKCancelBitmapped:= True;
   FBtnOKCaption:= '&OK';
   FBtnCancelCaption:= 'Cancel';
   FIniFileName := wwExtractFileNameOnly(Application.ExeName)+'.ini';
   FCheckBoxInGridStyle:= cbStyleAuto;

   {$ifdef win32}
   FDialogFontStyle := [];  // Default is non-bold for 32 bit programs
   {$else}
   FDialogFontStyle := [fsBold];
   {$endif}
end;

destructor TwwDBRichEditIntl.Destroy;
begin
  MenuLabels.Free;
  PopupMenuLabels.Free;
  ParagraphDialog.Free;
  TabDialog.Free;
  inherited destroy;
end;

destructor TwwIntl.Destroy;
begin
  FSearchDialog.Free;
  FLocateDialog.Free;
  FFilterDialog.Free;
  FMonthCalendar.Free;
  FUserMessages.Free;
  FNavigator.Free;
  FRichEdit.Free;
  inherited Destroy;
  if self=wwInternational then wwInternational:= nil;
end;

Procedure TwwIntl.Loaded;
begin
   inherited Loaded;
   if Connected then Connect;
end;

constructor TwwDBNavigatorIntl.Create;
begin
  inherited Create;
  FConfirmDeleteMessage := 'Delete record?';
  FHints := TwwDBNavigatorIntlHints.Create;
end;

destructor TwwDBNavigatorIntl.Destroy;
begin
  FHints.Free;
  inherited Destroy;
end;

constructor TwwDBNavigatorIntlHints.Create;
begin
  inherited Create;
  FFirstHint := 'Move to first record';
  FPriorHint := 'Move to prior record';
  FNextHint := 'Move to next record';
  FLastHint := 'Move to last record';
  FInsertHint := 'Insert new record';
  FDeleteHint := 'Delete current record';
  FEditHint := 'Edit current record';
  FPostHint := 'Post changes of current record';
  FCancelHint := 'Cancel changes made to current record';
  FRefreshHint := 'Refresh the contents of the dataset';
  FPriorPageHint := 'Move backward %d records';
  FNextPageHint := 'Move forward %d records';
  FSaveBookmarkHint := 'Bookmark current record';
  FRestoreBookmarkHint := 'Go back to saved bookmark';
  FRecordViewDialogHint := 'View current record';
  FFilterDialogHint := 'Filter the dataset';
  FLocateDialogHint := 'Locate a specific record';
  FSearchDialogHint := 'Search the dataset';
end;

{$ifdef NEWIPSETUP}
Procedure TwwIntl.SetRegistrationNo(val: string);
begin
end;
{$endif}

Procedure TwwIntl.SetIPVersion(val: string);
begin
end;

Procedure TwwIntl.SetConnected(val: boolean);
begin
    FConnected:= val;
    if not val then exit;
    Connect;
end;

Procedure TwwIntl.SetCheckboxInGridStyle(val: TwwCheckboxInGridStyle);
begin
   FCheckBoxInGridStyle:= val;
   if connected and (wwInternational<>self) then
      wwInternational.CheckboxInGridStyle:= val;
end;

Procedure TwwIntl.Connect;
var wwFilterDialog: TwwFilterDialogIntl;
begin
    if self=wwInternational then exit;

    wwFilterDialog:= wwInternational.FilterDialog;

    with FilterDialog do begin
      wwFilterDialog.BtnViewSummary := FBtnViewSummary;
      wwFilterDialog.BtnViewSummaryHint  := FBtnViewSummaryHint;
      wwFilterDialog.BtnNewSearch  := FBtnNewSearch;
      wwFilterDialog.BtnNewSearchHint  := FBtnNewSearchHint;
      wwFilterDialog.FieldOrderLabel  := FFieldOrderLabel;
      wwFilterDialog.FieldOrderHint := FFieldOrderHint;
      wwFilterDialog.AlphabeticLabel := FAlphabeticLabel;
      wwFilterDialog.LogicalLabel := FLogicalLabel;
      wwFilterDialog.AllFieldsLabel := FAllFieldsLabel;
      wwFilterDialog.SearchedFieldsLabel := FSearchedFieldsLabel;
      wwFilterDialog.StartingRangeLabel :=  FStartingRangeLabel;
      wwFilterDialog.EndingRangeLabel := FEndingRangeLabel;
      wwFilterDialog.StartingRangeHint := FStartingRangeHint;
      wwFilterDialog.EndingRangeHint := FEndingRangeHint;
      wwFilterDialog.BtnClearMin := FBtnClearMin;
      wwFilterDialog.BtnClearMax := FBtnClearMax;
      wwFilterDialog.BtnClearFilterValue := FBtnClearFilterValue;
      wwFilterDialog.BtnClearMinHint := FBtnClearMinHint;
      wwFilterDialog.BtnClearMaxHint := FBtnClearMaxHint;
      wwFilterDialog.BtnClearFilterValueHint := FBtnClearFilterValueHint;
      wwFilterDialog.ByValueLabel  := FByValueLabel;
      wwFilterDialog.ByRangeLabel  :=  FByRangeLabel;
      wwFilterDialog.FieldValueLabel  := FFieldValueLabel;
      wwFilterDialog.FieldValueHint  := FFieldValueHint;
      wwFilterDialog.SearchTypeLabel  :=  FSearchTypeLabel;
      wwFilterDialog.SearchTypeHint :=  FSearchTypeHint;
      wwFilterDialog.MatchExactLabel  := FMatchExactLabel;
      wwFilterDialog.MatchStartLabel  := FMatchStartLabel;
      wwFilterDialog.MatchAnyLabel  := FMatchAnyLabel;
      wwFilterDialog.CaseSensitiveLabel := FCaseSensitiveLabel;
      wwFilterDialog.CaseSensitiveHint := FCaseSensitiveHint;
      wwFilterDialog.NonMatchingLabel := NonMatchingLabel;
      wwFilterDialog.NonMatchingHint := NonMatchingHint;
      wwFilterDialog.SummaryFieldLabel  := FSummaryFieldLabel;
      wwFilterDialog.SummarySearchLabel := FSummarySearchLabel;
      wwFilterDialog.SummaryValueLabel := FSummaryValueLabel;
      {$ifdef wwdelphi4up}
      wwFilterDialog.SummaryCaption:= FSummaryCaption;
      {$endif}
      wwFilterDialog.FieldsLabel:= FFieldsLabel;
      wwFilterDialog.ValueRangeTabHint:= FValueRangeTabHint;
      wwFilterDialog.AllSearchedTabHint:= FAllSearchedTabHint;
      wwFilterDialog.ViewSummaryNotText:= FViewSummaryNotText;
    end;

    with RichEdit do begin
       wwInternational.RichEdit.FontNameComboHint := FFontNameComboHint;
       wwInternational.RichEdit.FontSizeComboHint := FFontSizeComboHint;
       wwInternational.RichEdit.NewButtonHint := FNewButtonHint;
       wwInternational.RichEdit.LoadButtonHint:=FLoadButtonHint;
       wwInternational.RichEdit.SaveAsButtonHint:=FSaveAsButtonHint;
       wwInternational.RichEdit.PrintButtonHint:=FPrintButtonHint;
       wwInternational.RichEdit.FindButtonHint:=FFindButtonHint;
       wwInternational.RichEdit.CutButtonHint:=FCutButtonHint;
       wwInternational.RichEdit.CopyButtonHint:=FCopyButtonHint;
       wwInternational.RichEdit.UndoButtonHint:=FUndoButtonHint;
       {$ifdef wwDelphi4Up}
       wwInternational.RichEdit.RedoButtonHint:=FRedoButtonHint;
       {$endif}
       wwInternational.RichEdit.PasteButtonHint:=FPasteButtonHint;
       wwInternational.RichEdit.BoldButtonHint:=FBoldButtonHint;
       wwInternational.RichEdit.UnderlineButtonHint:=FUnderlineButtonHint;
       wwInternational.RichEdit.ItalicButtonHint:=FItalicButtonHint;
       wwInternational.RichEdit.LeftButtonHint:=FLeftButtonHint;
       wwInternational.RichEdit.CenterButtonHint:=FCenterButtonHint;
       wwInternational.RichEdit.RightButtonHint:=FRightButtonHint;
       wwInternational.RichEdit.BulletButtonHint:=FBulletButtonHint;
       wwInternational.RichEdit.HighlightButtonHint:=FHighlightButtonHint;

       wwInternational.RichEdit.SaveExitHint:=FSaveExitHint;
       wwInternational.RichEdit.PageSetupHint:=FPageSetupHint;
       wwInternational.RichEdit.ExitHint:=FExitHint;
       wwInternational.RichEdit.ClearHint:=FClearHint;
       wwInternational.RichEdit.SelectAllHint:=FSelectAllHint;
       wwInternational.RichEdit.FindNextHint:=FFindNextHint;
       wwInternational.RichEdit.ReplaceHint:=FReplaceHint;
       wwInternational.RichEdit.InsertObjectHint:=FInsertObjectHint;
       wwInternational.RichEdit.SpellCheckHint:=FSpellCheckHint;
       wwInternational.RichEdit.ToolbarHint:=FToolbarHint;
       wwInternational.RichEdit.FormatBarHint:=FFormatBarHint;
       wwInternational.RichEdit.ViewStatusBarHint:=FViewStatusBarHint;
       wwInternational.RichEdit.OptionsHint:=FOptionsHint;
       wwInternational.RichEdit.FFontHint:=FFontHint;
       wwInternational.RichEdit.ParagraphHint:=FParagraphHint;
       wwInternational.RichEdit.TabsHint:=FTabsHint;

       wwInternational.RichEdit.CAPLockCaption:=FCAPLockCaption;
       wwInternational.RichEdit.NUMLockCaption:=FNUMLockCaption;

       wwInternational.RichEdit.MenuLabels.FileCaption:=FMenuLabels.FileCaption;
       wwInternational.RichEdit.MenuLabels.LoadCaption:=FMenuLabels.LoadCaption;
       wwInternational.RichEdit.MenuLabels.SaveAsCaption:=FMenuLabels.SaveAsCaption;
       wwInternational.RichEdit.MenuLabels.SaveExitCaption:=FMenuLabels.SaveExitCaption;
       wwInternational.RichEdit.MenuLabels.PrintCaption:=FMenuLabels.PrintCaption;
       wwInternational.RichEdit.MenuLabels.PageSetupCaption:=FMenuLabels.PageSetupCaption;
       wwInternational.RichEdit.MenuLabels.ExitCaption:=FMenuLabels.ExitCaption;
       wwInternational.RichEdit.MenuLabels.EditCaption:=FMenuLabels.EditCaption;
       wwInternational.RichEdit.MenuLabels.UndoCaption:=FMenuLabels.UndoCaption;
       wwInternational.RichEdit.MenuLabels.CutCaption:=FMenuLabels.CutCaption;
       wwInternational.RichEdit.MenuLabels.CopyCaption:=FMenuLabels.CopyCaption;
       wwInternational.RichEdit.MenuLabels.PasteCaption:=FMenuLabels.PasteCaption;
       wwInternational.RichEdit.MenuLabels.ClearCaption:=FMenuLabels.ClearCaption;
       wwInternational.RichEdit.MenuLabels.SelectallCaption:=FMenuLabels.SelectallCaption;
       wwInternational.RichEdit.MenuLabels.FindCaption:=FMenuLabels.FindCaption;
       wwInternational.RichEdit.MenuLabels.FindNextCaption:=FMenuLabels.FindNextCaption;
       wwInternational.RichEdit.MenuLabels.ReplaceCaption:=FMenuLabels.ReplaceCaption;
       wwInternational.RichEdit.MenuLabels.InsertObjectCaption:=FMenuLabels.InsertObjectCaption;
       wwInternational.RichEdit.MenuLabels.SpellCheckCaption:=FMenuLabels.SpellCheckCaption;
       {$ifdef wwdelphi4up}
       wwInternational.RichEdit.MenuLabels.InsertCaption:=FMenuLabels.InsertCaption;
       wwInternational.RichEdit.MenuLabels.RulerCaption:=FMenuLabels.RulerCaption;
       wwInternational.RichEdit.MenuLabels.RedoCaption:=FMenuLabels.RedoCaption;
       {$endif}
       wwInternational.RichEdit.MenuLabels.ViewCaption:=FMenuLabels.ViewCaption;
       wwInternational.RichEdit.MenuLabels.ToolbarCaption:=FMenuLabels.ToolbarCaption;
       wwInternational.RichEdit.MenuLabels.FormatBarCaption:=FMenuLabels.FormatBarCaption;
       wwInternational.RichEdit.MenuLabels.ViewStatusBarCaption:=FMenuLabels.ViewStatusBarCaption;
       wwInternational.RichEdit.MenuLabels.OptionsCaption:=FMenuLabels.OptionsCaption;
       wwInternational.RichEdit.MenuLabels.FormatCaption:=FMenuLabels.FormatCaption;
       wwInternational.RichEdit.MenuLabels.FontCaption:=FMenuLabels.FontCaption;
       wwInternational.RichEdit.MenuLabels.BulletStyleCaption:=FMenuLabels.BulletStyleCaption;
       wwInternational.RichEdit.MenuLabels.ParagraphCaption:=FMenuLabels.ParagraphCaption;
       wwInternational.RichEdit.MenuLabels.TabsCaption:=FMenuLabels.TabsCaption;
       wwInternational.RichEdit.MenuLabels.HelpCaption:=FMenuLabels.HelpCaption;

       wwInternational.RichEdit.PopupMenuLabels.EditCaption:=FPopupMenuLabels.EditCaption;
       wwInternational.RichEdit.PopupMenuLabels.ViewCaption:=FPopupMenuLabels.ViewCaption;
       wwInternational.RichEdit.PopupMenuLabels.CutCaption:=FPopupMenuLabels.CutCaption;
       wwInternational.RichEdit.PopupMenuLabels.CopyCaption:=FPopupMenuLabels.CopyCaption;
       wwInternational.RichEdit.PopupMenuLabels.PasteCaption:=FPopupMenuLabels.PasteCaption;
       wwInternational.RichEdit.PopupMenuLabels.FontCaption:=FPopupMenuLabels.FontCaption;
       { 11/10/97 - Add Bold, Italic, Underline }
       wwInternational.RichEdit.PopupMenuLabels.BoldCaption:=FPopupMenuLabels.BoldCaption;
       wwInternational.RichEdit.PopupMenuLabels.ItalicCaption:=FPopupMenuLabels.ItalicCaption;
       wwInternational.RichEdit.PopupMenuLabels.UnderlineCaption:=FPopupMenuLabels.UnderlineCaption;
       wwInternational.RichEdit.PopupMenuLabels.BulletStyleCaption:=FPopupMenuLabels.BulletStyleCaption;
       wwInternational.RichEdit.PopupMenuLabels.ParagraphCaption:=FPopupMenuLabels.ParagraphCaption;
       wwInternational.RichEdit.PopupMenuLabels.TabsCaption:=FPopupMenuLabels.TabsCaption;
       wwInternational.RichEdit.PopupMenuLabels.FindCaption:=FPopupMenuLabels.FindCaption;
       wwInternational.RichEdit.PopupMenuLabels.ReplaceCaption:=FPopupMenuLabels.ReplaceCaption;
       wwInternational.RichEdit.PopupMenuLabels.InsertObjectCaption:=FPopupMenuLabels.InsertObjectCaption;
       wwInternational.RichEdit.PopupMenuLabels.SpellCheckCaption:=FPopupMenuLabels.SpellCheckCaption;

       wwInternational.RichEdit.ParagraphDialog.ParagraphDlgCaption:=FParagraphDialog.ParagraphDlgCaption;
       wwInternational.RichEdit.ParagraphDialog.IndentationGroupBoxCaption:=FParagraphDialog.IndentationGroupBoxCaption;
       wwInternational.RichEdit.ParagraphDialog.LeftEditCaption:=FParagraphDialog.LeftEditCaption;
       wwInternational.RichEdit.ParagraphDialog.RightEditCaption:=FParagraphDialog.RightEditCaption;
       wwInternational.RichEdit.ParagraphDialog.FirstLineEditCaption:=FParagraphDialog.FirstLineEditCaption;
       wwInternational.RichEdit.ParagraphDialog.AlignmentCaption:=FParagraphDialog.AlignmentCaption;
       wwInternational.RichEdit.ParagraphDialog.LeftEditHint:=FParagraphDialog.FLeftEditHint;
       wwInternational.RichEdit.ParagraphDialog.RightEditHint:=FParagraphDialog.FRightEditHint;
       wwInternational.RichEdit.ParagraphDialog.FirstLineEditHint:=FParagraphDialog.FFirstLineEditHint;
       wwInternational.RichEdit.ParagraphDialog.AlignmentHint:=FParagraphDialog.FAlignmentHint;
       wwInternational.RichEdit.ParagraphDialog.AlignLeft:= FParagraphDialog.AlignLeft;
       wwInternational.RichEdit.ParagraphDialog.AlignRight:= FParagraphDialog.AlignRight;
       wwInternational.RichEdit.ParagraphDialog.AlignCenter:= FParagraphDialog.AlignCenter;

       wwInternational.RichEdit.ParagraphDialog.SpacingGroupCaption:= FParagraphDialog.SpacingGroupCaption;
       wwInternational.RichEdit.ParagraphDialog.BeforeParagraphCaption:= FParagraphDialog.BeforeParagraphCaption;
       wwInternational.RichEdit.ParagraphDialog.AfterParagraphCaption:= FParagraphDialog.AfterParagraphCaption;
       wwInternational.RichEdit.ParagraphDialog.WithinParagraphCaption:= FParagraphDialog.WithinParagraphCaption;
       wwInternational.RichEdit.ParagraphDialog.WithinParagraphAtCaption:= FParagraphDialog.WithinParagraphAtCaption;
       {$ifdef wwdelphi4up}
       wwInternational.RichEdit.ParagraphDialog.SpacingSingle:= FParagraphDialog.SpacingSingle;
       wwInternational.RichEdit.ParagraphDialog.Spacing1_5:= FParagraphDialog.Spacing1_5;
       wwInternational.RichEdit.ParagraphDialog.SpacingDouble:= FParagraphDialog.SpacingDouble;
       wwInternational.RichEdit.ParagraphDialog.SpacingAtLeast:= FParagraphDialog.SpacingAtLeast;
       wwInternational.RichEdit.ParagraphDialog.SpacingExactly:= FParagraphDialog.SpacingExactly;
       wwInternational.RichEdit.ParagraphDialog.SpacingMultiple:= FParagraphDialog.SpacingMultiple;
       {$endif}

       wwInternational.RichEdit.TabDialog.TabDlgCaption:=FTabDialog.TabDlgCaption;
       wwInternational.RichEdit.TabDialog.TabGroupBoxCaption:=FTabDialog.FTabGroupBoxCaption;
       wwInternational.RichEdit.TabDialog.SetTabButtonCaption:=FTabDialog.FSetTabButtonCaption;
       wwInternational.RichEdit.TabDialog.ClearTabButtonCaption:=FTabDialog.FClearTabButtonCaption;
       wwInternational.RichEdit.TabDialog.ClearAllButtonCaption:=FTabDialog.FClearAllButtonCaption;
       wwInternational.RichEdit.TabDialog.TabPositionEditHint:=FTabDialog.FTabPositionEditHint;
       wwInternational.RichEdit.TabDialog.ListBoxHint:=FTabDialog.FListBoxHint;
       wwInternational.RichEdit.TabDialog.SetButtonHint:=FTabDialog.FSetButtonHint;
       wwInternational.RichEdit.TabDialog.ClearButtonHint:=FTabDialog.FClearButtonHint;
       wwInternational.RichEdit.TabDialog.ClearAllButtonHint:= FTabDialog.FClearAllButtonHint;
    end;

    with SearchDialog do begin
       wwInternational.SearchDialog.SearchCharLabel:= FSearchCharLabel;
       wwInternational.SearchDialog.SearchCharShortLabel:= FSearchCharShortLabel;
       wwInternational.SearchDialog.SearchByLabel:= FSearchByLabel;
       wwInternational.SearchDialog.StatusRecLabel:= FStatusRecLabel;
       wwInternational.SearchDialog.StatusOfLabel:= FStatusOfLabel;
       wwInternational.SearchDialog.SearchCharHint:= FSearchCharHint;
       wwInternational.SearchDialog.SearchByHint:= FSearchByHint;
    end;

    with MonthCalendar do begin
       wwInternational.MonthCalendar.PopupYearLabel := FPopupYearLabel;
       wwInternational.MonthCalendar.EnterYearPrompt:= FEnterYearPrompt;
    end;


    with LocateDialog do
    begin
      wwInternational.LocateDialog.FieldValueLabel:= FFieldValueLabel;
      wwInternational.LocateDialog.SearchTypeLabel:= FSearchTypelabel;
      wwInternational.LocateDialog.CaseSensitiveLabel:= FCaseSensitiveLabel;
      wwInternational.LocateDialog.MatchExactLabel:= FMatchExactLabel;
      wwInternational.LocateDialog.MatchStartLabel:= FMatchStartLabel;
      wwInternational.LocateDialog.MatchAnyLabel:= FMatchAnyLabel;
      wwInternational.LocateDialog.FieldsLabel:= FFieldsLabel;
      wwInternational.LocateDialog.BtnFirst:= FButtonFirst;
      wwInternational.LocateDialog.BtnNext:= FButtonNext;
      wwInternational.LocateDialog.BtnCancel:= FButtonCancel;

      wwInternational.LocateDialog.FieldValueHint:= FFieldValueHint;
      wwInternational.LocateDialog.CaseSensitiveHint:= FCaseSensitiveHint;
      wwInternational.LocateDialog.MatchExactHint:= FMatchExactHint;
      wwInternational.LocateDialog.MatchStartHint:= FMatchStartHint;
      wwInternational.LocateDialog.MatchAnyHint:= FMatchAnyHint;
      wwInternational.LocateDialog.BtnFirstHint:= FButtonFirstHint;
      wwInternational.LocateDialog.BtnNextHint:= FButtonNextHint;

      wwInternational.LocateDialog.FieldNameHint:= FFieldNameHint;
    end;

    with Navigator do
    begin
      wwInternational.Navigator.ConfirmDeleteMessage := FConfirmDeleteMessage;
      with Hints do
      begin
        wwInternational.Navigator.Hints.FirstHint := FFirstHint;
        wwInternational.Navigator.Hints.PriorHint := FPriorHint;
        wwInternational.Navigator.Hints.NextHint := FNextHint;
        wwInternational.Navigator.Hints.LastHint := FLastHint;
        wwInternational.Navigator.Hints.InsertHint := FInsertHint;
        wwInternational.Navigator.Hints.DeleteHint := FDeleteHint;
        wwInternational.Navigator.Hints.EditHint := FEditHint;
        wwInternational.Navigator.Hints.PostHint := FPostHint;
        wwInternational.Navigator.Hints.CancelHint := FCancelHint;
        wwInternational.Navigator.Hints.RefreshHint := FRefreshHint;
        wwInternational.Navigator.Hints.PriorPageHint := FPriorPageHint;
        wwInternational.Navigator.Hints.NextPageHint := FNextPageHint;
        wwInternational.Navigator.Hints.SaveBookmarkHint := FSaveBookmarkHint;
        wwInternational.Navigator.Hints.RestoreBookmarkHint := FRestoreBookmarkHint;
        wwInternational.Navigator.Hints.RecordViewDialogHint := FRecordViewDialogHint;
        wwInternational.Navigator.Hints.LocateDialogHint := FLocateDialogHint;
        wwInternational.Navigator.Hints.FilterDialogHint := FFilterDialogHint;
        wwInternational.Navigator.Hints.SearchDialogHint := FSearchDialogHint;
      end;
    end;

    wwInternational.OKCancelBitmapped:= FOKCancelBitmapped;

    with UserMessages do
    begin
      wwInternational.UserMessages.wwDBGridDiscardChanges:= FwwDBGridDiscardChanges;
      wwInternational.UserMessages.PictureValidateError:= FPictureValidateError;
      wwInternational.UserMessages.LocateNoMatches:= FLocateNoMatches;
      wwInternational.UserMessages.LocateNoMoreMatches:= FLocateNoMoreMatches;
      wwInternational.UserMessages.MemoChangesWarning:= FMemoChangesWarning;
      wwInternational.UserMessages.RichEditExitWarning:= FRichEditExitWarning;
      wwInternational.UserMessages.RichEditClearWarning:= FRichEditClearWarning;
      wwInternational.UserMessages.RichEditSpellCheckComplete:= FRichEditSpellCheckComplete;
      wwInternational.UserMessages.RichEditMSWordNotFound:= FRichEditMSWordNotFound;
{      wwInternational.UserMessages.RichEditLoadWarning:= FRichEditLoadWarning;}
      wwInternational.UserMessages.FilterDlgNoCriteria:= FFilterDlgNoCriteria;
      wwInternational.UserMessages.RecordViewExitWarning:= FRecordViewExitWarning;
    end;

    wwInternational.BtnOKCaption:= FBtnOKCaption;
    wwInternational.BtnCancelCaption:= FBtnCancelCaption;
    if (FIniFileName = '.ini') or (FIniFileName = '') then
       wwInternational.IniFileName:= wwExtractFileNameOnly(Application.ExeName)+'.ini'
    else
       wwInternational.IniFileName:= FIniFileName+'.ini';

    wwInternational.CheckBoxInGridStyle:= FCheckBoxInGridStyle;

    wwInternational.DialogFontStyle:= FDialogFontStyle;
    wwInternational.UseLocateMethodForSearch:= FUseLocateMethodForSearch;
    wwInternational.FastSQLCancelRange:= FFastSQLCancelRange;
    wwInternational.DefaultEpochYear:= FDefaultEpochYear;
    wwInternational.FilterMemoSize:= FFilterMemoSize;
end;

procedure Register;
begin
end;


Function wwCreateCommonButton(AOwner: TForm;
   ButtonKind: TBitBtnKind): TComponent;
var bitbtn: TBitBtn;
    btn: TButton;
begin
   bitbtn:= nil; { Make compiler happy }
   if wwInternational.OKCancelBitmapped then
   begin
      bitbtn:= TBitBtn.Create(AOwner);
      btn:= bitBtn;
   end
   else begin
      btn:= TButton.Create(AOwner)
   end;

   with btn do begin
      Parent:= AOwner;
      Visible := False;
      Width := (screen.pixelsperinch * 77) div 96;
      Height := (screen.pixelsperinch * 24) div 96;
   end;

   if wwInternational.OKCancelBitmapped then with bitBtn do begin
      Margin := 2;
      Kind := ButtonKind;
      Layout := blGlyphLeft;
      NumGlyphs := 2;
      Spacing := -1;
      Width := (screen.pixelsperinch * 77) div 96;
      Height := (screen.pixelsperinch * 27) div 96;

      Font.Color := clWindowText;
      Font.Height := -11;
      Font.Name := 'MS Sans Serif';
      Font.Style:= wwInternational.DialogFontStyle;
   end;

   with btn do begin
      case ButtonKind of
         bkOK: begin
            Caption := wwInternational.BtnOKCaption;
            ModalResult:= mrOK;
           end;
         bkCancel: begin
            Caption:= wwInternational.BtnCancelCaption;
            ModalResult:= mrCancel;
            Cancel:= True; {1/22/97 - Non-bitmapped buttons require this }
           end;
         bkHelp: Caption:= 'Help';
      end;
   end;

   result:= btn;
end;

procedure InitMainIntl;
begin
  wwInternational:= TwwIntl.create(Application);
end;

{$ifdef wwDelphi3Up}
initialization
  InitMainIntl;
finalization
  wwInternational.Free;
{$else}
begin
  InitMainIntl;
{$endif}
end.


