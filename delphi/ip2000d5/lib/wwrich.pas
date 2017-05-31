{
//
// Components : TwwRichEditForm
//
// Copyright (c) 1998 by Woll2Woll Software
//
// 9/15/98 - Only show InsertObject if not readonly
// 12/23/98 - Include Redo hint for Delphi 4
// 2/24/99 - No messagedlg if readonly - In case of resize which would set modified flag
}

unit wwrich;

interface

{$i wwIfDef.pas}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, ExtCtrls, Db, DBTables, Wwtable, Wwdatsrc, StdCtrls,
  ComCtrls, Grids, DBGrids, wwdbedit, Wwdotdot, Wwdbcomb, Buttons, richedit,
  Menus, wwrchdlg, wwriched, wwintl, wwrichtb, printers, commdlg, winspool,
  wwTrackIcon, ImgList;

type

  TwwRichEditForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Print1: TMenuItem;
    PageSetup1: TMenuItem;
    SaveExit1: TMenuItem;
    Exit1: TMenuItem;
    Edit1: TMenuItem;
    Undo1: TMenuItem;
    EditSep1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Clear1: TMenuItem;
    SelectAll1: TMenuItem;
    EditSep2: TMenuItem;
    Find1: TMenuItem;
    FindNext1: TMenuItem;
    Replace1: TMenuItem;
    View1: TMenuItem;
    Toolbar1: TMenuItem;
    FormatBar1: TMenuItem;
    StatusBar: TStatusBar;
    OptionsSep: TMenuItem;
    Options1: TMenuItem;
    Insert1: TMenuItem;
    DateandTime1: TMenuItem;
    Format1: TMenuItem;
    Font1: TMenuItem;
    BulletStyle1: TMenuItem;
    Paragraph1: TMenuItem;
    Tabs1: TMenuItem;
    Help1: TMenuItem;
    FormatBar: TPanel;
    FontNameCombo: TwwDBComboBox;
    FontSizeCombo: TwwDBComboBox;
    BoldButton: TSpeedButton;
    UnderlineButton: TSpeedButton;
    ItalicButton: TSpeedButton;
    LeftButton: TSpeedButton;
    CenterButton: TSpeedButton;
    RightButton: TSpeedButton;
    BulletButton: TSpeedButton;
    StatusBar1: TMenuItem;
    PrintDialog1: TPrintDialog;
    FileSep2: TMenuItem;
    FileSep1: TMenuItem;
    Load1: TMenuItem;
    SaveAs1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Toolbar: TPanel;
    NewButton: TSpeedButton;
    ToolBarBevel: TBevel;
    FormatBarBevel: TBevel;
    LoadButton1: TSpeedButton;
    SaveAsButton: TSpeedButton;
    PrintButton: TSpeedButton;
    FindButton: TSpeedButton;
    CutButton: TSpeedButton;
    CopyButton: TSpeedButton;
    UndoButton: TSpeedButton;
    PasteButton: TSpeedButton;
    SaveDialog1: TSaveDialog;
    RulerBevel: TBevel;
    Ruler1: TMenuItem;
    InsertObject1: TMenuItem;
    RedoButton: TSpeedButton;
    Redo1: TMenuItem;
    ToolbarBevel1: TBevel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    UserButtonBevel: TBevel;
    Bevel4: TBevel;
    PopupMenu1: TPopupMenu;
    Black1: TMenuItem;
    Green1: TMenuItem;
    Red1: TMenuItem;
    Blue1: TMenuItem;
    Yellow1: TMenuItem;
    Purple1: TMenuItem;
    Teal1: TMenuItem;
    Gray1: TMenuItem;
    Silver1: TMenuItem;
    Red2: TMenuItem;
    Lime1: TMenuItem;
    Yellow2: TMenuItem;
    Blue2: TMenuItem;
    Fuchsia1: TMenuItem;
    Aqua1: TMenuItem;
    White1: TMenuItem;
    Automatic1: TMenuItem;
    ColorButton: TSpeedButton;
    Tools1: TMenuItem;
    Spelling1: TMenuItem;
    SpellButton: TSpeedButton;
    ImageList1: TImageList;
    HighlightButton: TSpeedButton;
    procedure BoldButtonClick(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure RightButtonClick(Sender: TObject);
    procedure CenterButtonClick(Sender: TObject);
    procedure LeftButtonClick(Sender: TObject);
    procedure BulletButtonClick(Sender: TObject);
    procedure RichEdit1SelectionChange(Sender: TObject);
    procedure Undo1Click(Sender: TObject);
    procedure Cut1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure Find1Click(Sender: TObject);
    procedure FindNext1Click(Sender: TObject);
    procedure Replace1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure FontNameComboCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure FontSizeComboCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure BulletStyle1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Paragraph1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure FormatBar1Click(Sender: TObject);
    procedure StatusBar1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure SaveExit1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Tabs1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PageSetup1Click(Sender: TObject);
    procedure Load1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure Toolbar1Click(Sender: TObject);
    procedure NewButtonClick(Sender: TObject);
    procedure LoadButton1Click(Sender: TObject);
    procedure SaveAsButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure FindButtonClick(Sender: TObject);
    procedure CutButtonClick(Sender: TObject);
    procedure CopyButtonClick(Sender: TObject);
    procedure PasteButtonClick(Sender: TObject);
    procedure UndoButtonClick(Sender: TObject);
    procedure FontNameComboDropDown(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Ruler1Click(Sender: TObject);
    procedure InsertObject1Click(Sender: TObject);
    procedure RedoButtonClick(Sender: TObject);
    procedure Redo1Click(Sender: TObject);
    procedure ColorButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Spelling1Click(Sender: TObject);
    procedure SpellButtonClick(Sender: TObject);
    procedure HighlightButtonClick(Sender: TObject);
    procedure BoldButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    tempDown: boolean;
    OrigOnHint: TNotifyEvent;
    FCanvas: TCanvas;
    OldParent1, OldParent2: TWinControl;
    Procedure RefreshControls;
    Procedure SetRichEditFontName(Value: string);  { Bypass VCL bug as it doesn't set the CharSet}
    Procedure UpdateStatusBar;
    procedure UpdateFormatToolBar(ShowToolBar, ShowFormatBar: boolean);
    Procedure FormChangeHint(Sender: TObject);
    Procedure ApplyIntl;
    procedure WMCommand(var Message: TWMCommand); message WM_COMMAND;
    procedure WMMeasureItem(var Message: TWMMeasureItem); message WM_MEASUREITEM;
    procedure WMDrawItem(var Message: TWMDrawItem); message WM_DRAWITEM;
    procedure ColorClick(Sender: TObject);
    procedure InitColorMenu;
  public
    OrigRichEdit: TwwCustomRichEdit;
    RichEdit1: TwwDBRichEdit;
    RulerPanel: TwwRulerPanel;
  end;

const wwCentimetersPerInch = 2.537;
//const wwCentimetersPerInch = 2.54;
var
  wwRichEditForm: TwwRichEditForm;

implementation

{$R *.DFM}
uses wwcommon;

const ColorBoxWidth = 40;

type TwwPageSetupDialog = class(TCommonDialog)
public
   RichEdit1: TwwCustomRichEdit;
   {$ifdef wwDelphi3Up}
   function Execute: Boolean; override;
   {$else}
   function Execute: Boolean;
   {$endif}

end;

procedure TwwRichEditForm.BoldButtonClick(Sender: TObject);
begin
  if (TempDown) then
     richedit1.SelAttributes.Style:=
        richedit1.SelAttributes.Style -[fsBold]
  else
     richedit1.SelAttributes.Style:=
        richedit1.SelAttributes.Style +[fsBold];
  RefreshControls;
end;

procedure TwwRichEditForm.UnderlineButtonClick(Sender: TObject);
begin
  if (TempDown) then
    richedit1.SelAttributes.Style:=
        richedit1.SelAttributes.Style -[fsUnderline]
  else
    richedit1.SelAttributes.Style:=
        richedit1.SelAttributes.Style +[fsUnderline];
  RefreshControls;
end;

procedure TwwRichEditForm.ItalicButtonClick(Sender: TObject);
begin
  if (TempDown) then
    richedit1.SelAttributes.Style:=
        richedit1.SelAttributes.Style -[fsItalic]
  else
    richedit1.SelAttributes.Style:=
        richedit1.SelAttributes.Style +[fsItalic];
  RefreshControls;
end;

procedure TwwRichEditForm.RightButtonClick(Sender: TObject);
begin
  richedit1.Paragraph.Alignment:= taRightJustify;
  RefreshControls;
end;

procedure TwwRichEditForm.CenterButtonClick(Sender: TObject);
begin
  richedit1.Paragraph.Alignment:= taCenter;
  RefreshControls;
end;

procedure TwwRichEditForm.LeftButtonClick(Sender: TObject);
begin
  richedit1.Paragraph.Alignment:= taLeftJustify;
  RefreshControls;
end;

procedure TwwRichEditForm.BulletButtonClick(Sender: TObject);
begin
  RichEdit1.SetBullet(not TempDown);
  RefreshControls;
end;

procedure TwwRichEditForm.RichEdit1SelectionChange(Sender: TObject);
begin
  if richedit1.visible then
     RefreshControls;
end;

Procedure TwwRichEditForm.RefreshControls;
var haveSelection, haveText: boolean;
begin
  BoldButton.down:= fsBold in richedit1.SelAttributes.Style;
  UnderlineButton.down:= fsUnderline in richedit1.SelAttributes.Style;
  ItalicButton.down:= fsItalic in richedit1.SelAttributes.Style;
  FontNameCombo.itemIndex:= FontNameCombo.items.indexOf(RichEdit1.SelAttributes.Name);
  if FontNameCombo.itemIndex<0 then begin
     FontNameCombo.text:= RichEdit1.SelAttributes.Name;
     FontNameCombo.font.color:=clRed;
  end
  else FontNameCombo.font.color:=clWindowText;
  FontSizeCombo.itemIndex:= FontSizeCombo.items.indexOf(inttostr(RichEdit1.SelAttributes.Size));
  BulletButton.down:= richedit1.Paragraph.Numbering = nsBullet;
  HighlightButton.Down:= (richedit1.GetTextBackgroundColor<>0) and
                         (richedit1.GetTextBackgroundColor<>ColorToRGB(clWindow));

  BulletStyle1.checked:= BulletButton.down;
  case richedit1.Paragraph.Alignment of
    taLeftJustify: LeftButton.Down:= True;
    taCenter: CenterButton.Down:= True;
    taRightJustify: RightButton.Down:= True;
  end;


    Paste1.enabled:= RichEdit1.CanPaste and (not RichEdit1.readonly);
    PasteButton.enabled:= Paste1.enabled and (not RichEdit1.readonly);
    Undo1.enabled:= RichEdit1.CanUndo;
    Redo1.enabled:= RichEdit1.CanRedo;
    UndoButton.enabled:= Undo1.enabled;
    RedoButton.enabled:= Redo1.enabled;

    haveSelection:= RichEdit1.CanCut;
//    haveText:= RichEdit1.text<>''; { This line was very slow for larger buffers }
    haveText:= (RichEdit1.Lines.Count>1) or
               (RichEdit1.Lines.Count=1) and (RichEdit1.Lines[0]<>'');
    Cut1.enabled:= haveSelection and (not RichEdit1.readonly);
    CutButton.enabled:= haveSelection and (not RichEdit1.readonly);
    Copy1.enabled:= haveSelection;
    CopyButton.enabled:= haveSelection;
    Clear1.enabled:= haveSelection and (not RichEdit1.readOnly);
    SelectAll1.enabled:= haveText;
    Find1.enabled:= haveText;
    FindButton.enabled:= haveText;
    FindNext1.enabled:= RichEdit1.CanFindNext;
    Replace1.enabled:= haveText and (not RichEdit1.readOnly);

    TwwRulerPanel(RulerPanel).UpdateDragIcons;

end;


procedure TwwRichEditForm.Undo1Click(Sender: TObject);
begin
    SendMessage(RichEdit1.Handle, EM_UNDO, 0, 0);
    RefreshControls;
{    SendMessage(RichEdit1.Handle, EM_SETOPTIONS,
                ECOOP_XOR, ECO_AUTOWORDSELECTION);}
end;



procedure TwwRichEditForm.Cut1Click(Sender: TObject);
begin
   Richedit1.CutToClipboard;
end;

procedure TwwRichEditForm.Copy1Click(Sender: TObject);
begin
   Richedit1.CopyToClipboard;
end;

procedure TwwRichEditForm.Paste1Click(Sender: TObject);
begin
   Richedit1.PasteFromClipboard;
end;

procedure TwwRichEditForm.SelectAll1Click(Sender: TObject);
begin
   Richedit1.SelectAll;
end;

procedure TwwRichEditForm.Clear1Click(Sender: TObject);
begin
   Richedit1.ClearSelection;
end;

procedure TwwRichEditForm.Find1Click(Sender: TObject);
begin
   richedit1.ExecuteFindDialog;
end;

procedure TwwRichEditForm.FindNext1Click(Sender: TObject);
begin
   RichEdit1.FindNextMatch;
end;

procedure TwwRichEditForm.Replace1Click(Sender: TObject);
begin
   RichEdit1.ExecuteReplaceDialog;
end;

procedure TwwRichEditForm.Font1Click(Sender: TObject);
begin
   RichEdit1.ExecuteFontDialog;
   RefreshControls;
end;

Procedure TwwRichEditForm.SetRichEditFontName(Value: string);
var Format: TCharFormat;
begin
  if RichEdit1.selAttributes.Name=Value then exit;
  FillChar(Format, SizeOf(TCharFormat), 0);
  Format.cbSize := SizeOf(TCharFormat);
  with Format do
  begin
    dwMask:= CFM_FACE OR CFM_CHARSET;
    StrPLCopy(szFaceName, Value, SizeOf(szFaceName));
    bCharSet := RichEdit1.GetCharSetOfFontName(Value);
  end;
  SendMessage(RichEdit1.Handle, EM_SETCHARFORMAT, SCF_SELECTION, LPARAM(@Format));
end;


procedure TwwRichEditForm.FontNameComboCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  if not Select then exit;
  SetRichEditFontName(FontNameCombo.Text);
  RichEdit1.SetFocus;
  RefreshControls;
end;

procedure TwwRichEditForm.FontSizeComboCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
   if not Select then exit;
   if FontSizeCombo.text='' then exit;
   RichEdit1.SelAttributes.Size:= StrToInt(FontSizeCombo.Text);
   RichEdit1.SetFocus;
   RefreshControls;
end;

procedure TwwRichEditForm.BulletStyle1Click(Sender: TObject);
begin
   TempDown:=  (richedit1.Paragraph.Numbering = nsBullet);
   BulletButton.OnClick(Sender);
end;

procedure TwwRichEditForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if RichEdit1.readOnly then begin
     if ord(key)=vk_escape then Close;
  end
  else if ord(key)=vk_escape then begin
     if reoCloseOnEscape in RichEdit1.EditorOptions then
        Close
     else
        Undo1Click(Sender)
  end
  else begin
     if GetKeyState(VK_CONTROL) >=0 then exit;

     if ord(key)=(ord('B')+1-ord('A')) then begin
        TempDown:=  fsBold in richedit1.SelAttributes.Style;
        BoldButton.onClick(BoldButton);
        key:= #0;
     end
     else if ord(key)=(ord('U')+1-ord('A')) then begin
        TempDown:=  fsUnderline in richedit1.SelAttributes.Style;
        UnderlineButton.onClick(UnderlineButton);
        key:= #0;
     end
     else if ord(key)=(ord('I')+1-ord('A')) then begin
        TempDown:=  fsItalic in richedit1.SelAttributes.Style;
        ItalicButton.onClick(ItalicButton);
        key:= #0;
     end
  end
end;



procedure TwwRichEditForm.UpdateStatusBar;
var KeyState: TKeyboardState;
begin
   GetKeyboardState(KeyState);
   with wwInternational.RichEdit do begin
     if KeyState [VK_NumLock] <> 0 then StatusBar.Panels[2].text:= NUMLockCaption
     else StatusBar.Panels[2].text:= '';
     if KeyState [VK_Capital] <> 0 then StatusBar.Panels[1].text:= CAPLockCaption
     else StatusBar.Panels[1].text:= '';
   end;
end;

procedure TwwRichEditForm.FormShow(Sender: TObject);
var i: integer;
    OrigRichEditModified: boolean;
begin
   InitColorMenu;
   
   OrigOnHint := Application.OnHint;
   Application.OnHint := FormChangeHint;

   { Save previuos modified flag, as CopyRichEditTo incorrect sets this to True }
   OrigRichEditModified:= OrigRichEdit.modified;
   OrigRichEdit.CopyRichEditTo(RichEdit1);
   OrigRichEdit.modified:= OrigRichEditModified;

   Screen.Cursor:= crDefault;

   RichEdit1.GutterWidth:= 6;
   for i:= 0 to Screen.Fonts.Count-1 do begin
      if (RichEdit1.EditWidth=rewWindowSize) or
        (Printer.Fonts.indexOf(Screen.Fonts[i])>=0) then
         FontNameCombo.Items.Add(Screen.Fonts[i]);
   end;

   UpdateStatusBar;
   RefreshControls;
   RichEdit1.modified:= False;

   with RichEdit1 do begin
      if ReadOnly then begin
         EditorOptions:= EditorOptions -
            [reoShowLoad, reoShowSaveAs, reoShowSaveExit,
             reoShowStatusBar, reoShowFormatBar, reoShowToolBar, reoShowRuler, reoShowSpellCheck];
      end;
//      EditorOptions:= EditorOptions + [reoShowSpellCheck];

      if not (reoShowLoad in EditorOptions) then begin
         Load1.visible:= false;
         LoadButton1.visible:= False;
      end;
      if not (reoShowSaveAs in EditorOptions) then begin
         SaveAs1.visible:= false;
         SaveAsButton.visible:= False;
      end;
      if not (reoShowPrint in EditorOptions) then begin
         Print1.visible:= false;
         PrintButton.visible:= False;
      end;
      if not (reoShowSpellCheck in EditorOptions) or RichEdit1.ReadOnly then begin
         Tools1.visible:= False;
         Spelling1.visible:= false;
         SpellButton.visible:= False;
      end;

      { 9/15/98 - Only show if not readonly }
      if (not (reoShowInsertObject in EditorOptions)) or
         (reoDisableOLE in OLEOptions) or (RichEdit1.ReadOnly) then begin
         InsertObject1.visible:= false;
         Insert1.visible:= false;
      end;
      if ([reoShowPrint, reoShowPageSetup] * EditorOptions = []) then
         FileSep2.visible:= False;

      if not (reoShowPageSetup in EditorOptions) then PageSetup1.visible:= false;

      if not (reoShowSaveExit in EditorOptions) then begin
         SaveExit1.visible:= false;
      end;

      if ([reoShowLoad,reoShowSaveExit] * EditorOptions = []) then
         FileSep1.visible:= False;

      { Reposition format buttons so that there is no whitespace }
      if not PrintButton.visible then
         Bevel1.Left:= Bevel1.Left - PrintButton.Width;
      FindButton.Left:= Bevel1.left + 5;
      SpellButton.Left:= FindButton.Left + FindButton.Width;

      if SpellButton.visible then
          ToolBarBevel1.Left:= SpellButton.Left + SpellButton.Width + 3
      else ToolBarBevel1.left:= FindButton.Left + FindButton.Width + 3;

      CutButton.Left:= ToolBarBevel1.Left + 5;
      CopyButton.Left:= CutButton.Left + CutButton.Width;
      PasteButton.Left:= CopyButton.Left + CopyButton.Width;
      Bevel2.Left:= PasteButton.Left + PasteButton.Width + 3;
      UndoButton.Left:= Bevel2.Left + 5;
      RedoButton.Left:= UndoButton.Left + UndoButton.Width;

      if RedoButton.visible then
         UserButtonBevel.Left:= RedoButton.Left + RedoButton.Width + 3
      else if UndoButton.visible then
         UserButtonBevel.Left:= UndoButton.Left + UndoButton.Width + 3;

      StatusBar.visible:= reoShowStatusBar in EditorOptions;
      FormatBar.visible:= reoShowFormatBar in EditorOptions;
      ToolBar.visible:= reoShowToolBar in EditorOPtions;
      ToolBarBevel.visible:= reoShowToolBar in EditorOPtions;
      FormatBarBevel.visible:= reoShowFormatBar in EditorOptions;
      RulerPanel.visible:= reoShowRuler in EditorOPtions;

      if ReadOnly then begin
         Format1.visible:= False;
         View1.visible:= False;
         NewButton.visible:= False;
      end;

      Toolbar1.checked:= ToolBar.visible;
      Formatbar1.checked:= FormatBar.visible;
      StatusBar1.checked:= StatusBar.visible;
      Ruler1.checked:= RulerPanel.visible;

      if OrigRichEdit.UserSpeedButton1<>Nil then with OrigRichEdit.UserSpeedButton1 do
      begin
         UserButtonBevel.visible:= True;
         OldParent1:= parent;
         parent:= ToolBar;
         visible:= True;
         Flat:= (reoFlatButtons in OrigRichEdit.EditorOptions);
         Left:= UndoButton.Left + UndoButton.Width + 32;
         Top:= UndoButton.Top;
         Height:= UndoButton.Height;
      end;
      if OrigRichEdit.UserSpeedButton2<>Nil then with OrigRichEdit.UserSpeedButton2 do
      begin
         UserButtonBevel.visible:= True;
         OldParent2:= parent;
         parent:= ToolBar;
         visible:= True;
         Flat:= (reoFlatButtons in OrigRichEdit.EditorOptions);
         Top:= UndoButton.Top;
         Height:= UndoButton.Height;
         if OrigRichEdit.UserSpeedButton1<>Nil then
            Left:= OrigRichEdit.UserSpeedButton1.Left + OrigRichEdit.UserSpeedButton1.Width
         else
            Left:= UndoButton.Left + UndoButton.Width + 32;
      end
   end;

   if not (reoFlatButtons in OrigRichEdit.EditorOptions) then
   begin
      Toolbar.height:= Toolbar.Height + 4;
      Formatbar.height:= Formatbar.Height + 2;
      with Toolbar do begin
         for i:= 0 to ControlCount-1 do
         begin
            if Controls[i] is TSpeedButton then
               with Controls[i] as TSpeedButton do
               begin
                  Top:= Top + 2;
                  Margin:= Margin - 1;
                  Flat:= False;
               end
            else if Controls[i] is TBevel then
               with Controls[i] as TBevel do
               begin
                  Controls[i].visible:= False;
               end
         end
      end;
      with Formatbar do begin
         for i:= 0 to ControlCount-1 do
         begin
            if Controls[i] is TSpeedButton then
               with Controls[i] as TSpeedButton do
               begin
                  Top:= Top + 1;
                  Margin:= Margin - 1;
                  Flat:= False;
               end
            else if Controls[i] is TBevel then
               with Controls[i] as TBevel do
               begin
                  Controls[i].visible:= False;
               end
         end
      end
   end;


   Width:= wwAdjustPixels(Width, PixelsPerInch);
   Height:= wwAdjustPixels(Height, PixelsPerInch);
   with StatusBar do begin
     Panels[1].Width:= wwAdjustPixels(Panels[1].Width, PixelsPerInch);
     Panels[2].Width:= wwAdjustPixels(Panels[2].Width, PixelsPerInch);
     Panels[3].Width:= wwAdjustPixels(Panels[3].Width, PixelsPerInch);
   end;

   ApplyIntl;
{   if Assigned(OrigRichEdit.OnMenuLoadClick) then Load1.OnClick:= OrigRichEdit.OnMenuLoadClick;
   if Assigned(OrigRichEdit.OnMenuPrintClick) then Print1.OnClick:= OrigRichEdit.OnMenuPrintClick;
   if Assigned(OrigRichEdit.OnMenuSaveAsClick) then  SaveAs1.OnClick:= OrigRichEdit.OnMenuSaveAsClick;
   if Assigned(OrigRichEdit.OnMenuSaveAndExitClick) then SaveExit1.OnClick:= OrigRichEdit.OnMenuSaveAndExitClick;
}
   richedit1.DoInitDialog(self);

   FormResize(self);

   if reoShowMainMenuIcons in RichEdit1.EditorOptions then
      MainMenu1.Images:= ImageList1;
end;

procedure TwwRichEditForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (ssCtrl in Shift) and (key=ord('Z')) then Undo1Click(Sender);
   UpdateStatusBar;
end;

procedure TwwRichEditForm.Paragraph1Click(Sender: TObject);
begin
   if RichEdit1.ExecuteParagraphDialog then
      TwwRulerPanel(RulerPanel).UpdateDragIcons;
end;

procedure TwwRichEditForm.Edit1Click(Sender: TObject);
begin
   RefreshControls;
end;


procedure TwwRichEditForm.Print1Click(Sender: TObject);
var i: integer;
    DoDefault: boolean;
begin
  DoDefault:= True;
  if Assigned(OrigRichEdit.OnMenuPrintClick) then
     OrigRichEdit.OnMenuPrintClick(self, RichEdit1, DoDefault);
  if not DoDefault then exit;

  {Note: In order for an uncollated printout to take place, the target printer     }
  {      must support the setting of # of Copies via the Win API, and many do not. }
  {      Thus, the  Collate option is set to TRUE and NOTHING is done if the user  }
  {      changes it to FALSE (it still produces a collated printout)...            }
   printdialog1.collate:= True;
   if printdialog1.execute then
   begin
      for i:= 1 to printdialog1.copies do
         richedit1.Print(OrigRichEdit.PrintJobName);
   end
end;


procedure TwwRichEditForm.UpdateFormatToolBar(ShowToolBar, ShowFormatBar: boolean);
begin
   if ShowToolBar then begin
      if ShowFormatBar then begin
         ToolBarBevel.visible:= True;
         ToolBar.visible:= True;
         ToolBar1.checked:= True;
         FormatBarBevel.visible:= True;
         FormatBar.visible:= True;
         FormatBar1.checked:= True;
      end
      else begin
         FormatBar.visible:= False;
         FormatBarBevel.visible:= False;
         FormatBar1.checked:= False;
         ToolBarBevel.visible:= True;
         ToolBar.visible:= True;
         ToolBar1.checked:= True;
      end
   end
   else begin
      if ShowFormatBar then begin
         ToolBar.visible:= False;
         ToolBarBevel.visible:= False;
         ToolBar1.checked:= False;
         FormatBarBevel.visible:= True;
         FormatBar.visible:= True;
         FormatBar1.checked:= True;
      end
      else begin
         FormatBar.visible:= False;
         FormatBarBevel.visible:= False;
         FormatBar1.checked:= False;
         ToolBar.visible:= False;
         ToolBarBevel.visible:= FAlse;
         ToolBar1.checked:= False;
      end
   end;
end;

procedure TwwRichEditForm.Toolbar1Click(Sender: TObject);
begin
   UpdateFormatToolBar(not ToolBar.visible, FormatBar.visible);
   ToolBar1.checked:= ToolBar.visible;
   FormResize(self);
end;

procedure TwwRichEditForm.FormatBar1Click(Sender: TObject);
begin
   UpdateFormatToolBar(ToolBar.visible, not FormatBar.visible);
   FormatBar1.checked:= FormatBar.visible;
   FormResize(self);
end;

procedure TwwRichEditForm.StatusBar1Click(Sender: TObject);
begin
   StatusBar.visible:= not StatusBar.visible;
   StatusBar1.checked:= StatusBar.visible;
   FormResize(self);
end;

procedure TwwRichEditForm.Exit1Click(Sender: TObject);
begin
   ModalResult:= mrCancel;
end;

procedure TwwRichEditForm.SaveExit1Click(Sender: TObject);
var DoDefault: boolean;
begin
  DoDefault:= True;
  if Assigned(OrigRichEdit.OnMenuSaveAndExitClick) then
     OrigRichEdit.OnMenuSaveAndExitClick(self, RichEdit1, DoDefault);
  if not DoDefault then exit;

  ModalResult:= mrOK;
end;

procedure TwwRichEditForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var answer: integer;
begin
   if ModalResult=mrOK then exit;

   if RichEdit1.modified and (not RichEdit1.ReadOnly) then { 2/24/99 - No message if readonly }
   begin
      answer:= MessageDlg(wwInternational.UserMessages.RichEditExitWarning,
                 mtConfirmation, [mbYes, mbNo, mbCancel], 0);
      if (answer = mrYes) then begin
         ModalResult:= mrOK;
      end
      else if (answer = mrNo) then begin
         ModalResult:= mrCancel;
      end
      else CanClose:= False;
   end
   else ModalResult:= mrCancel;

end;

procedure TwwRichEditForm.Tabs1Click(Sender: TObject);
begin
   richedit1.executeTabDialog;
end;

procedure TwwRichEditForm.FormResize(Sender: TObject);
var RichEditTop, RichEditHeight, RulerPanelTop: integer;
begin
   RichEdit1.SkipPaint:= True;

   try try
      if (richedit1.editWidth <> rewPrinterSize) then
      begin
         RulerPanel.Width:=  Width - 8;
         TwwRulerPanel(RulerPanel).RulerRect:= Rect(6, 4, RulerPanel.Width-6, RulerPanel.Height-4);
      end;

      StatusBar.Panels[0].width:= Width - wwAdjustPixels(90, PixelsPerInch);

      RichEditTop:= 0;
      RulerPanelTop:= 0;
      if FormatBar.visible then begin
         RichEditTop:= RichEditTop + FormatBar.Height+2;
         RulerPanelTop:= RichEditTop;
      end;
      if ToolBar.visible then begin
         RichEditTop:= RichEditTop + ToolBar.Height+2;
         RulerPanelTop:= RichEditTop;
      end;
      if RulerPanel.visible then begin
         RichEditTop:= RichEditTop + RulerPanel.Height+2;
         RulerBevel.Top:= RulerPanelTop;
         RulerPanel.Top:= RulerPanelTop + 2;
      end;


      if StatusBar.visible then
         RichEditHeight:= ClientHeight - StatusBar.Height - RichEditTop
      else RichEditHeight:= ClientHeight - RichEditTop;

      SetWindowPos (RichEdit1.Handle, 0, RichEdit1.Left, RichEditTop,
             Width - 8, RichEditHeight, SWP_NOACTIVATE);

//   RichEdit1.Top := RichEditTop;
//   RichEdit1.Width:= Width - 8;
//   RichEdit1.Height:= RichEditHeight;

      TwwRulerPanel(RulerPanel).RightDragButton.MaxValue:=
        TwwRulerPanel(RulerPanel).RulerRect.Right-(TwwRulerPanel(RulerPanel).RightDragButton.Width div 2);
      TwwRulerPanel(RulerPanel).UpdateDragIcons;

      if StatusBar.visible then
      begin
         StatusBar.Top:= richedit1.top + RicheditHeight;
         StatusBar.Width:= richedit1.Width;
      end;

   finally
      richedit1.setEditRect;  { Call after sizing richedit }

      { Allows vertical scrollbars to appear when unmaximizing form }
      if richedit1.editWidth = rewPrinterSize then
      begin
         richedit1.width:= richedit1.width + 1;
         richedit1.width:= richedit1.width - 1;
      end;

      richedit1.SkipPaint:= False;
      richedit1.invalidate;
   end
   except
      richedit1.SkipPaint:= False;
      ShowMessage('Error in resize');
   end;

end;


procedure GetPrinter(var DeviceMode, DeviceNames: THandle);
var
  Device, Driver, Port: array[0..79] of char;
  DevNames: PDevNames;
  Offset: PChar;
begin
  Printer.GetPrinter(Device, Driver, Port, DeviceMode);
  if DeviceMode <> 0 then
  begin
    DeviceNames := GlobalAlloc(GHND, SizeOf(TDevNames) +
     StrLen(Device) + StrLen(Driver) + StrLen(Port) + 3);
    DevNames := PDevNames(GlobalLock(DeviceNames));
    try
      Offset := PChar(DevNames) + SizeOf(TDevnames);
      with DevNames^ do
      begin
        wDriverOffset := Longint(Offset) - Longint(DevNames);
        Offset := StrECopy(Offset, Driver) + 1;
        wDeviceOffset := Longint(Offset) - Longint(DevNames);
        Offset := StrECopy(Offset, Device) + 1;
        wOutputOffset := Longint(Offset) - Longint(DevNames);;
        StrCopy(Offset, Port);
      end;
    finally
      GlobalUnlock(DeviceNames);
    end;
  end;
end;

function CopyData(Handle: THandle): THandle;
var
  Src, Dest: PChar;
  Size: Integer;
begin
  if Handle <> 0 then
  begin
    Size := GlobalSize(Handle);
    Result := GlobalAlloc(GHND, Size);
    if Result <> 0 then
      try
        Src := GlobalLock(Handle);
        Dest := GlobalLock(Result);
        if (Src <> nil) and (Dest <> nil) then Move(Src^, Dest^, Size);
      finally
        GlobalUnlock(Handle);
        GlobalUnlock(Result);
      end
  end
  else Result := 0;
end;

procedure SetPrinter(DeviceMode, DeviceNames: THandle);
var
  DevNames: PDevNames;
begin
  DevNames := PDevNames(GlobalLock(DeviceNames));
  try
    with DevNames^ do begin
      Printer.SetPrinter(PChar(DevNames) + wDeviceOffset,
        PChar(DevNames) + wDriverOffset,
        PChar(DevNames) + wOutputOffset, DeviceMode);
    end;
  finally
    GlobalUnlock(DeviceNames);
    GlobalFree(DeviceNames);
  end;
end;


{procedure SetPrinterDev(DevMode: PDeviceMode; DeviceMode, DeviceNames: THandle);
var
  DevNames: PDevNames;
  FPrinterHandle: THandle;
begin
  DevNames := PDevNames(GlobalLock(DeviceNames));
  try
    with DevNames^ do begin
      if OpenPrinter(PChar(DevNames) + wDeviceOffset, FPrinterHandle, nil) then
      begin
         ShowMessage(inttostr(DocumentProperties(Application.handle, FPrinterHandle, PChar(DevNames) + wDeviceOffset,
            PDevMode(Nil)^, DevMode^, DM_IN_BUFFER)));
         if FPrinterHandle <> 0 then ClosePrinter(FPrinterHandle);
      end;
    end;
  finally
    GlobalUnlock(DeviceNames);
  end;
end;
}

{Center PageSetup Dialog }
function PageSetupHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT; stdcall;
  procedure CenterWindow(Wnd: HWnd);
  var Rect: TRect;
  begin
    GetWindowRect(Wnd, Rect);
    SetWindowPos(Wnd, 0,
      (GetSystemMetrics(SM_CXSCREEN) - Rect.Right + Rect.Left) div 2,
      (GetSystemMetrics(SM_CYSCREEN) - Rect.Bottom + Rect.Top) div 3,
      0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
  end;
begin
  Result := 0;
  case Msg of
    WM_INITDIALOG:
      begin
        Subclass3DDlg(Wnd, CTL3D_ALL);
        SetAutoSubClass(True);
        CenterWindow(Wnd);
      end;
    WM_DESTROY:
      SetAutoSubClass(False);
  end;
end;

{ TCommonDialog }
Function TwwPageSetupDialog.execute: boolean;
var setup: TPageSetupDlg;
    hOrigDeviceMode: THandle;
    hDeviceMode: THandle;
    DeviceMode : PDeviceMode;
    tempOrientation : TPrinterOrientation;
    tempPrintPageSize: integer;
begin
  FillChar(setup, SizeOf(TPageSetupDlg), 0);
  with Setup do begin
     lStructSize := SizeOf(TPageSetupDlg);
     hWndOwner := Application.Handle;
     {$ifdef wwDelphi3Up}
     hInstance := SysInit.HInstance;
     {$else}
     hInstance := System.HInstance;
     {$endif}
     GetPrinter(hOrigDeviceMode, hDevNames);
     hDeviceMode := CopyData(hOrigDeviceMode);
     hDevMode:= hDeviceMode;  { 4/18/98 - This important line previously omitted!  }
     lpfnPageSetupHook := PageSetupHook;

     flags:= PSD_MARGINS or PSD_ENABLEPAGESETUPHOOK;
     if richedit1.editwidth=rewWindowSize then flags:= flags or PSD_DISABLEPAPER;

     with RichEdit1 do begin
        if MeasurementUnits=muInches then
           flags:= flags or PSD_INTHOUSANDTHSOFINCHES
        else flags:= flags or PSD_INHUNDREDTHSOFMILLIMETERS;
        rtMargin.left:= Trunc(PrintMargins.left*1000);
        rtMargin.top:= Trunc(PrintMargins.top*1000);
        rtMargin.right:= Trunc(PrintMargins.right*1000);
        rtMargin.bottom:= Trunc(PrintMargins.bottom*1000);
        if richedit1.editwidth=rewPrinterSize then
        begin
           DeviceMode := GlobalLock(hDeviceMode);
           DeviceMode.dmPaperSize:= PrintPageSize;
           GlobalUnlock(hDeviceMode);
        end
     end;
     Result := TaskModalDialog(@PageSetupDlg, setup);
     if Result then with RichEdit1 do begin
        PrintMargins.Left:=  rtMargin.left /1000;
        PrintMargins.right:= rtMargin.right / 1000;
        PrintMargins.top:= rtMargin.top / 1000;
        Printmargins.bottom:= rtMargin.bottom / 1000;

//        DeviceMode := GlobalLock(hDeviceMode);  { Set printer attributes }
        DeviceMode := GlobalLock(hDevMode);  { Set printer attributes }
        tempPrintPageSize:= DeviceMode.dmPaperSize;
        if DeviceMode.dmOrientation=DMORIENT_LANDSCAPE then
           tempOrientation:= poLandscape
        else tempOrientation:= poPortrait;
//        GlobalUnlock(hDeviceMode);
        GlobalUnlock(hDevMode);

//        SetPrinter(hDeviceMode, hDevNames);  { Choose printer }
        SetPrinter(hDevMode, hDevNames);  { Choose printer }
        Printer.orientation:= tempOrientation;
        PrintPageSize:= tempPrintPageSize;
        UpdatePrinter;
     end
     else begin
       if hDeviceMode <> 0 then GlobalFree(hDeviceMode);
       if hDevNames <> 0 then GlobalFree(hDevNames);
     end;

  end;
end;

procedure TwwRichEditForm.PageSetup1Click(Sender: TObject);
begin
   with TwwPageSetupDialog.create(self) do
   begin
      RichEdit1:= self.RichEdit1;
      if Execute then
      begin
         if RichEdit1.EditWidth = rewPrinterSize then
         begin
            TwwRulerPanel(RulerPanel).UpdateSize(RichEdit1);
            TwwRulerPanel(RulerPanel).UpdateDragIcons;
            RulerPanel.UpdateRulerProp(RulerPanel.RightDragButton);
         end
         else self.RichEdit1.SetEditRect;
      end;
      Free;
   end
end;


procedure TwwRichEditForm.Load1Click(Sender: TObject);
var DoDefault: boolean;
begin
  DoDefault:= True;
  if Assigned(OrigRichEdit.OnMenuLoadClick) then
     OrigRichEdit.OnMenuLoadClick(self, RichEdit1, DoDefault);
  if not DoDefault then exit;

  if OpenDialog1.Execute then
  begin
    RichEdit1.Lines.LoadFromFile(OpenDialog1.FileName);
    RichEdit1.SetFocus;
  end;
end;

procedure TwwRichEditForm.SaveAs1Click(Sender: TObject);
var DoDefault: boolean;
begin
  DoDefault:= True;
  if Assigned(OrigRichEdit.OnMenuSaveAsClick) then
     OrigRichEdit.OnMenuSaveAsClick(self, RichEdit1, DoDefault);
  if not DoDefault then exit;

  if SaveDialog1.Execute then
  begin
    if FileExists(SaveDialog1.FileName) then
      if MessageDlg(Format('OK to overwrite %s', [SaveDialog1.FileName]),
        mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;
    RichEdit1.Lines.SaveToFile(SaveDialog1.FileName);
  end;
end;

procedure TwwRichEditForm.NewButtonClick(Sender: TObject);
begin
   if MessageDlg(wwInternational.UserMessages.RichEditClearWarning,
                 mtConfirmation, [mbOK, mbCancel], 0)  <> mrOK then exit;

   richedit1.clear;
   richedit1.modified:= True;
end;

procedure TwwRichEditForm.LoadButton1Click(Sender: TObject);
begin
   Load1Click(Sender);
end;

procedure TwwRichEditForm.SaveAsButtonClick(Sender: TObject);
begin
   SaveAs1Click(Sender);
end;

procedure TwwRichEditForm.PrintButtonClick(Sender: TObject);
begin
    Print1Click(Sender);
end;

procedure TwwRichEditForm.FindButtonClick(Sender: TObject);
begin
   Find1Click(Sender);
end;

procedure TwwRichEditForm.CutButtonClick(Sender: TObject);
begin
  Cut1Click(Sender);
end;

procedure TwwRichEditForm.CopyButtonClick(Sender: TObject);
begin
  Copy1Click(Sender);
end;

procedure TwwRichEditForm.PasteButtonClick(Sender: TObject);
begin
   Paste1Click(Sender);
end;

procedure TwwRichEditForm.UndoButtonClick(Sender: TObject);
begin
   Undo1Click(Sender);
end;

procedure TwwRichEditForm.FontNameComboDropDown(Sender: TObject);
begin
   FontNameCombo.font.color:=clBlack;
end;

procedure TwwRichEditForm.FormChangeHint(Sender: TObject);
begin
   StatusBar.Panels[0].text:=Application.Hint;
end;

procedure TwwRichEditForm.ApplyIntl;
begin
    with wwInternational.RichEdit do begin

       if (reoShowHints in richedit1.EditorOptions) then begin
          FontNameCombo.ShowHint := True;
          FontSizeCombo.ShowHint := True;
          NewButton.ShowHint := True;
          LoadButton1.ShowHint := True;
          SaveAsButton.ShowHint := True;
          PrintButton.ShowHint := True;
          FindButton.ShowHint := True;
          CutButton.ShowHint := True;
          CopyButton.ShowHint := True;
          UndoButton.ShowHint := True;
          RedoButton.ShowHint := True;
          PasteButton.ShowHint := True;
          BoldButton.ShowHint := True;
          UnderlineButton.ShowHint := True;
          ItalicButton.ShowHint := True;
          LeftButton.ShowHint := True;
          CenterButton.ShowHint := True;
          RightButton.ShowHint := True;
          BulletButton.ShowHint := True;
          HighlightButton.ShowHint:= True;
          SpellButton.ShowHint:= True;

    {Change Hints}
    FontNameCombo.Hint := FontNameComboHint;
    FontSizeCombo.Hint := FontSizeComboHint;

    {Buttons}
    NewButton.Hint := NewButtonHint;
    LoadButton1.Hint := LoadButtonHint;
    SaveAsButton.Hint := SaveAsButtonHint;
    PrintButton.Hint := PrintButtonHint;
    FindButton.Hint := FindButtonHint;
    CutButton.Hint := CutButtonHint;
    CopyButton.Hint := CopyButtonHint;
    UndoButton.Hint := UndoButtonHint;

    { 12/23/98 }
    {$ifdef wwdelphi4up}
    RedoButton.Hint := RedoButtonHint;
    {$endif}
    if RedoButton.Hint='' then RedoButton.Hint:= 'Redo | Reverses the last undo action';

    PasteButton.Hint := PasteButtonHint;
    BoldButton.Hint := BoldButtonHint;
    UnderlineButton.Hint := UnderlineButtonHint;
    ItalicButton.Hint := ItalicButtonHint;
    LeftButton.Hint := LeftButtonHint;
    CenterButton.Hint := CenterButtonHint;
    RightButton.Hint := RightButtonHint;
    BulletButton.Hint := BulletButtonHint;
    HighlightButton.Hint:= HighlightButtonHint;

    {File Menu Items}
    Load1.Hint:= LoadButton1.Hint;
    SaveAs1.Hint:= SaveAsButton.Hint;
    SaveExit1.Hint := SaveExitHint;
    Print1.Hint := PrintButton.Hint;
    PageSetup1.Hint:=PageSetupHint;
    Exit1.Hint:= ExitHint;

    {Edit Menu Items}
    Undo1.Hint:= UndoButton.Hint;
    Cut1.Hint:= CutButton.Hint;
    Copy1.Hint:= CopyButton.Hint;
    Paste1.Hint:= PasteButton.Hint;
    Find1.Hint:=FindButton.Hint;
    Clear1.Hint:= ClearHint;
    SelectAll1.Hint:= SelectAllHint;
    FindNext1.Hint:= FindNextHint;
    Replace1.Hint:=ReplaceHint;
    InsertObject1.Hint:=InsertObjectHint;
    Spelling1.Hint:= SpellCheckHint;

    {View Menu Items}
    Toolbar1.Hint:= ToolbarHint;
    FormatBar1.Hint:= FormatBarHint;
    StatusBar1.Hint :=ViewStatusBarHint;
    Options1.Hint:=OptionsHint;

    {Format Menu Items}
    Font1.Hint:=FontHint;
    BulletStyle1.Hint:= BulletButton.Hint;
    Paragraph1.Hint:= ParagraphHint;
    Tabs1.Hint:=TabsHint;

    end
    else Application.OnHint := nil;

{Change Menu Item Labels}

    File1.Caption := MenuLabels.FileCaption;
    Load1.Caption := MenuLabels.LoadCaption;
    SaveAs1.Caption := MenuLabels.SaveAsCaption;
    SaveExit1.Caption := MenuLabels.SaveExitCaption;
    Print1.Caption := MenuLabels.PrintCaption;
    PageSetup1.Caption := MenuLabels.PageSetupCaption;
    Exit1.Caption := MenuLabels.ExitCaption;

    Edit1.Caption := MenuLabels.EditCaption;
    Undo1.Caption := MenuLabels.UndoCaption;
    Cut1.Caption := MenuLabels.CutCaption;
    Copy1.Caption := MenuLabels.CopyCaption;
    Paste1.Caption := MenuLabels.PasteCaption;
    Clear1.Caption := MenuLabels.ClearCaption;
    Selectall1.Caption := MenuLabels.SelectallCaption;
    Find1.Caption:= MenuLabels.FindCaption;
    FindNext1.Caption:=MenuLabels.FindNextCaption;
    Replace1.Caption:=MenuLabels.ReplaceCaption;
    InsertObject1.Caption:=MenuLabels.InsertObjectCaption;
    {$ifdef wwdelphi4up}
    Insert1.Caption:= MenuLabels.InsertCaption;
    if Insert1.Caption='' then Insert1.caption:= '&Insert';
    Ruler1.Caption:= MenuLabels.RulerCaption;
    if Ruler1.Caption='' then Ruler1.caption:= '&Ruler';
    Redo1.Caption:= MenuLabels.RedoCaption;
    if Redo1.Caption='' then Redo1.caption:= '&Redo';
    {$endif}

    View1.Caption := MenuLabels.ViewCaption;
    Toolbar1.Caption:= MenuLabels.ToolbarCaption;
    FormatBar1.Caption:=MenuLabels.FormatBarCaption;
    StatusBar1.Caption:=MenuLabels.ViewStatusBarCaption;
    Options1.Caption:=MenuLabels.OptionsCaption;

    Format1.Caption:=MenuLabels.FormatCaption;
    Font1.Caption:=MenuLabels.FontCaption;
    BulletStyle1.Caption:=MenuLabels.BulletStyleCaption;
    Paragraph1.Caption:=MenuLabels.ParagraphCaption;
    Tabs1.Caption := MenuLabels.TabsCaption;

    Help1.Caption := MenuLabels.HelpCaption;
    end;
end;

procedure TwwRichEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Application.OnHint:= OrigOnHint;
   if OrigRichEdit.UserSpeedButton1<>Nil then
   begin
      OrigRichEdit.UserSpeedButton1.parent:= OldParent1;
      OrigRichEdit.UserSpeedButton1.visible:= false;
   end;
   if OrigRichEdit.UserSpeedButton2<>Nil then
   begin
      OrigRichEdit.UserSpeedButton2.parent:= OldParent2;
      OrigRichEdit.UserSpeedButton2.visible:= false;
   end;
end;

procedure TwwRichEditForm.Ruler1Click(Sender: TObject);
begin
   RulerPanel.visible:= not RulerPanel.visible;
   Ruler1.checked:= RulerPanel.visible;
   FormResize(self);
end;

procedure TwwRichEditForm.InsertObject1Click(Sender: TObject);
begin
   richedit1.InsertObjectDialog;
end;

procedure TwwRichEditForm.RedoButtonClick(Sender: TObject);
begin
   Redo1Click(Sender);
end;

procedure TwwRichEditForm.Redo1Click(Sender: TObject);
begin
    SendMessage(RichEdit1.Handle, EM_REDO, 0, 0);
    RefreshControls;
end;

{ Implement Color drop-down list }
procedure TwwRichEditForm.WMCommand(var Message: TWMCommand);
var item: TMenuItem;
begin
   inherited;
   if (Message.NotifyCode = 0) and (PopupMenu1<>nil) then
   begin
      item:= PopupMenu1.FindItem(Message.itemID, fkCommand);
      if item<>nil then Item.Click;
   end
end;

procedure TwwRichEditForm.WMMeasureItem(var Message: TWMMeasureItem);
var Item: TMenuItem;
  function GetMenuFont: HFONT;
  var
    NonClientMetrics: TNonClientMetrics;
  begin
    NonClientMetrics.cbSize := sizeof(NonClientMetrics);
    if SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @NonClientMetrics, 0) then
      Result := CreateFontIndirect(NonClientMetrics.lfMenuFont)
    else
      Result := GetStockObject(SYSTEM_FONT);
  end;
const
  VertPadding = 2;
  HorzPadding = 5;
begin
  inherited;
  if Message.MeasureItemStruct^.CtlType <> ODT_MENU then Exit;
  with Message.MeasureItemStruct^ do
  begin
    Item := TMenuItem(itemData);
    FCanvas.Handle := GetDC(0);
    FCanvas.Font.Handle := GetMenuFont;
    itemHeight := FCanvas.TextHeight(Item.Caption) + VertPadding;
    itemWidth := FCanvas.TextWidth(Item.Caption) + HorzPadding + ColorBoxWidth;
    FCanvas.Font.Handle := 0;
    ReleaseDC(0, FCanvas.Handle);
    FCanvas.Handle := 0;
  end;
end;

function DrawText(Canvas: TCanvas;
   AText: string; ARect: TRect; Style: Integer): TRect;
const
  DT_DISABLED = $80000;
begin
  with Canvas do begin
  // Used by DrawText API Function when "Item" has focus.
  SetBkColor(Handle, ColorToRGB(Brush.Color));
  SetTextColor(Handle, ColorToRGB(Font.Color));

  Refresh;
  if (Style and DT_DISABLED <> 0) and (Style and DT_CALCRECT = 0) then
  begin
    Font.Color := clBtnHighlight;
    OffSetRect(ARect, 1, 1);
    Windows.DrawText(Handle, PChar(AText), Length(AText), ARect, Style);
    SetBkMode(Handle, TRANSPARENT);
    OffSetRect(ARect, -1, -1);
    Font.Color := clBtnShadow;
  end;
  Windows.DrawTextEx(Handle, PChar(AText), Length(AText), ARect, Style, nil);
  result := ARect;
  end;
end;

procedure TwwRichEditForm.WMDrawItem(var Message: TWMDrawItem);
const
  VertMargin = 2;
  HorzMargin = 3;
var
  Item: TMenuItem;
  ColorRect: TRect;
begin
  inherited;
  if Message.DrawItemStruct^.CtlType <> ODT_MENU then Exit;
  with Message.DrawItemStruct^ do
  begin
    FCanvas.Handle := hDC;
    Item := TMenuItem(ItemData);
    if ODS_SELECTED and itemState <> 0 then begin
      FCanvas.Brush.Color := clHighlight;
      FCanvas.Pen.Color := clHighlightText;
      FCanvas.Pen.Color := clBlack;
      FCanvas.Font.Color := clHighlightText;
    end else begin
      FCanvas.Brush.Color := clBtnFace;
      FCanvas.Pen.Color := clWindowText;
      FCanvas.Font.Color := clWindowText
    end;
    FCanvas.FillRect(rcItem);

    ColorRect := Rect(rcItem.Left + HorzMargin, rcItem.Top + VertMargin, rcItem.Left + HorzMargin + ColorBoxWidth, rcItem.Bottom - VertMargin);
    DrawText(FCanvas, Item.Caption, Rect(ColorRect.Right + 1 * HorzMargin, rcItem.Top, rcItem.Right, rcItem.Bottom), DT_VCENTER or DT_SINGLELINE);

    FCanvas.Brush.Color := Item.Tag;
    FCanvas.Rectangle(ColorRect.Left, ColorRect.Top, ColorRect.Right, ColorRect.Bottom);

    FCanvas.Handle := 0;
  end;
end;

procedure TwwRichEditForm.ColorClick(Sender: TObject);
begin
   RichEdit1.SelAttributes.Color:= (Sender as TMenuItem).Tag;
end;

procedure TwwRichEditForm.InitColorMenu;
var i: Integer;
  procedure SetOwnerDraw(Item: TMenuItem);
  type TwwMenuItemInfo = packed record
    cbSize: UINT;
    fMask: UINT;
    fType: UINT;             { used if MIIM_TYPE}
    fState: UINT;            { used if MIIM_STATE}
    wID: UINT;               { used if MIIM_ID}
    hSubMenu: HMENU;         { used if MIIM_SUBMENU}
    hbmpChecked: HBITMAP;    { used if MIIM_CHECKMARKS}
    hbmpUnchecked: HBITMAP;  { used if MIIM_CHECKMARKS}
    dwItemData: DWORD;       { used if MIIM_DATA}
    dwTypeData: PAnsiChar;      { used if MIIM_TYPE}
    cch: UINT;               { used if MIIM_TYPE}
  end;
  var mii: TMenuItemInfo;
  begin
    FillChar(mii, SizeOf(TMenuItemInfo), 0);
    mii.cbSize := SizeOf(TwwMenuItemInfo);
    mii.fMask := MIIM_TYPE or MIIM_DATA;
    mii.fType := MFT_OWNERDRAW;
    mii.dwItemData := Integer(Item);
    SetMenuItemInfo(Item.Parent.Handle, Item.MenuIndex, True, mii);
  end;
begin
  for i := 0 to PopupMenu1.Items.Count - 1 do
  begin
    SetOwnerDraw(PopupMenu1.Items[i]);
    PopupMenu1.Items[i].OnClick:= ColorClick;
  end;
  Automatic1.Tag:= RichEdit1.Font.Color; { Use richedit's font color }
end;



procedure TwwRichEditForm.ColorButtonClick(Sender: TObject);
var p: TPoint;
begin
  p:= FormatBar.ClientToScreen(Point(ColorButton.left, ColorButton.Top + ColorButton.Height));
  TrackPopupMenu(PopupMenu1.Handle, TPM_LEFTALIGN,
     p.x-1, p.y, 0, handle, nil);
end;

procedure TwwRichEditForm.FormCreate(Sender: TObject);
begin
   FCanvas := TCanvas.Create;
end;

procedure TwwRichEditForm.FormDestroy(Sender: TObject);
begin
   FCanvas.Free;
end;

procedure TwwRichEditForm.Spelling1Click(Sender: TObject);
begin
   richedit1.MSWordSpellChecker;
end;

procedure TwwRichEditForm.SpellButtonClick(Sender: TObject);
begin
   Spelling1Click(Sender)
end;

procedure TwwRichEditForm.HighlightButtonClick(Sender: TObject);
begin
  with (Sender as TSpeedButton) do begin
     if not Down then RichEdit1.SetTextBackgroundColor(-1)
     else RichEdit1.SetTextBackgroundColor(RichEdit1.HighlightColor);
  end;
  RefreshControls;

end;

procedure TwwRichEditForm.BoldButtonMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   tempdown:= (Sender as TSpeedButton).down;
end;

end.
