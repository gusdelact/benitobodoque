unit IntCrEditor;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls, ClipBrd,
  ToolWin, ActnList, ImgList;

type
  TFrmEditor = class(TForm)
    MainMenu: TMainMenu;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    FileExitItem: TMenuItem;
    EditUndoItem: TMenuItem;
    EditCutItem: TMenuItem;
    EditCopyItem: TMenuItem;
    EditPasteItem: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    Ruler: TPanel;
    FontDialog1: TFontDialog;
    FirstInd: TLabel;
    LeftInd: TLabel;
    RulerLine: TBevel;
    RightInd: TLabel;
    N5: TMenuItem;
    miEditFont: TMenuItem;
    Editor: TRichEdit;
    StatusBar: TStatusBar;
    StandardToolBar: TToolBar;
    ToolButton5: TToolButton;
    UndoButton: TToolButton;
    CutButton: TToolButton;
    CopyButton: TToolButton;
    PasteButton: TToolButton;
    ToolButton10: TToolButton;
    FontName: TComboBox;
    FontSize: TEdit;
    ToolButton11: TToolButton;
    UpDown1: TUpDown;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    ToolButton16: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    ToolButton20: TToolButton;
    BulletsButton: TToolButton;
    ToolbarImages: TImageList;
    ActionList1: TActionList;
    FileNewCmd: TAction;
    FileOpenCmd: TAction;
    FileSaveCmd: TAction;
    FilePrintCmd: TAction;
    FileExitCmd: TAction;
    ToolButton2: TToolButton;
    Bevel1: TBevel;
    EditCutCmd: TAction;
    EditCopyCmd: TAction;
    EditPasteCmd: TAction;
    EditUndoCmd: TAction;
    EditFontCmd: TAction;
    FileSaveAsCmd: TAction;
    Editor2: TRichEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    reTemp: TRichEdit;
    ToolButton1: TToolButton;

    procedure SelectionChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure FileNew(Sender: TObject);
    procedure FileOpen(Sender: TObject);
    procedure FileSave(Sender: TObject);
    procedure FileSaveAs(Sender: TObject);
    procedure FileExit(Sender: TObject);
    procedure EditUndo(Sender: TObject);
    procedure EditCut(Sender: TObject);
    procedure EditCopy(Sender: TObject);
    procedure EditPaste(Sender: TObject);
    procedure SelectFont(Sender: TObject);
    procedure RulerResize(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure AlignButtonClick(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure BulletsButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RulerItemMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RulerItemMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FirstIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure RichEditChange(Sender: TObject);
    procedure ActionList2Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure Editor2Enter(Sender: TObject);
    procedure EditorEnter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    FFileName: string;
    FUpdating: Boolean;
    FDragOfs: Integer;
    FDragging: Boolean;
    function CurrText: TTextAttributes;
    procedure GetFontNames;                                    
    procedure SetFileName(const FileName: String);
    procedure CheckFileSave;
    procedure SetupRuler;
    procedure SetEditRect;
    procedure UpdateCursorPos;
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    procedure PerformFileOpen(const AFileName: string);
    procedure SetModified(Value: Boolean);
  end;

var
  FrmEditor: TFrmEditor;
  Actual:integer;
implementation

uses RichEdit, ShellAPI;//, ReInit;

resourcestring
  sSaveChanges = 'Save changes to %s?';
  sOverWrite = 'OK to overwrite %s';
  sUntitled = 'Untitled';
  sModified = 'Modified';
  sColRowInfo = 'Line: %3d   Col: %3d';

const
  RulerAdj = 4/3;
  GutterWid = 6;

  ENGLISH = (SUBLANG_ENGLISH_US shl 10) or LANG_ENGLISH;
  FRENCH  = (SUBLANG_FRENCH shl 10) or LANG_FRENCH;
  GERMAN  = (SUBLANG_GERMAN shl 10) or LANG_GERMAN;

{$R *.DFM}

procedure TFrmEditor.SelectionChange(Sender: TObject);
begin
If Actual = 1
then
  with Editor.Paragraph do
  try
    FUpdating := True;
    FirstInd.Left := Trunc(FirstIndent*RulerAdj)-4+GutterWid;
    LeftInd.Left := Trunc((LeftIndent+FirstIndent)*RulerAdj)-4+GutterWid;
    RightInd.Left := Ruler.ClientWidth-6-Trunc((RightIndent+GutterWid)*RulerAdj);
    BoldButton.Down := fsBold in Editor.SelAttributes.Style;
    ItalicButton.Down := fsItalic in Editor.SelAttributes.Style;
    UnderlineButton.Down := fsUnderline in Editor.SelAttributes.Style;
    BulletsButton.Down := Boolean(Numbering);
    FontSize.Text := IntToStr(Editor.SelAttributes.Size);
    FontName.Text := Editor.SelAttributes.Name;
    case Ord(Alignment) of
      0: LeftAlign.Down := True;
      1: RightAlign.Down := True;
      2: CenterAlign.Down := True;
    end;
    UpdateCursorPos;
  finally
    FUpdating := False;
  end
else
  with Editor2.Paragraph do
  try
    FUpdating := True;
    FirstInd.Left := Trunc(FirstIndent*RulerAdj)-4+GutterWid;
    LeftInd.Left := Trunc((LeftIndent+FirstIndent)*RulerAdj)-4+GutterWid;
    RightInd.Left := Ruler.ClientWidth-6-Trunc((RightIndent+GutterWid)*RulerAdj);
    BoldButton.Down := fsBold in Editor2.SelAttributes.Style;
    ItalicButton.Down := fsItalic in Editor2.SelAttributes.Style;
    UnderlineButton.Down := fsUnderline in Editor2.SelAttributes.Style;
    BulletsButton.Down := Boolean(Numbering);
    FontSize.Text := IntToStr(Editor2.SelAttributes.Size);
    FontName.Text := Editor2.SelAttributes.Name;
    case Ord(Alignment) of
      0: LeftAlign.Down := True;
      1: RightAlign.Down := True;
      2: CenterAlign.Down := True;
    end;
    UpdateCursorPos;
  finally
    FUpdating := False;
  end
end;

function TFrmEditor.CurrText: TTextAttributes;
begin
If actual=1
then
  if Editor.SelLength > 0 then Result := Editor.SelAttributes
  else Result := Editor.DefAttributes
else
  if Editor2.SelLength > 0 then Result := Editor2.SelAttributes
  else Result := Editor2.DefAttributes

end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TFrmEditor.GetFontNames;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

procedure TFrmEditor.SetFileName(const FileName: String);
begin
  FFileName := FileName;
  Caption := Format('%s - %s', [ExtractFileName(FileName), Application.Title]);
end;

procedure TFrmEditor.CheckFileSave;
var
  SaveResp: Integer;
begin
  if not Editor.Modified then Exit;
  SaveResp := MessageDlg(Format(sSaveChanges, [FFileName]),
    mtConfirmation, mbYesNoCancel, 0);
  case SaveResp of
    idYes: FileSave(Self);
    idNo: {Nothing};
    idCancel: Abort;
  end;
end;

procedure TFrmEditor.SetupRuler;
var
  I: Integer;
  S: String;
begin
  SetLength(S, 201);
  I := 1;
  while I < 200 do
  begin
    S[I] := #9;
    S[I+1] := '|';
    Inc(I, 2);
  end;
  Ruler.Caption := S;
end;

procedure TFrmEditor.SetEditRect;
var
  R: TRect;
begin
  with Editor do
  begin
    R := Rect(GutterWid, 0, ClientWidth-GutterWid, ClientHeight);
    SendMessage(Handle, EM_SETRECT, 0, Longint(@R));
  end;
end;

{ Event Handlers }

procedure TFrmEditor.FormCreate(Sender: TObject);
begin
  Application.OnHint := ShowHint;
  OpenDialog.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog.InitialDir := OpenDialog.InitialDir;
  SetFileName(sUntitled);
  GetFontNames;
  SetupRuler;
  SelectionChange(Self);

  CurrText.Name := DefFontData.Name;
  CurrText.Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);
end;

procedure TFrmEditor.ShowHint(Sender: TObject);
begin
  if Length(Application.Hint) > 0 then
  begin
    StatusBar.SimplePanel := True;
    StatusBar.SimpleText := Application.Hint;
  end
  else StatusBar.SimplePanel := False;
end;

procedure TFrmEditor.FileNew(Sender: TObject);
begin
If Actual=1
then
Begin
  SetFileName(sUntitled);
  Editor.Lines.Clear;
  Editor.Modified := False;
  SetModified(False);
end
else
Begin
  SetFileName(sUntitled);
  Editor2.Lines.Clear;
  Editor2.Modified := False;
  SetModified(False);
End;
end;

procedure TFrmEditor.PerformFileOpen(const AFileName: string);
begin
If Actual=1
then
Begin
  Editor.Lines.LoadFromFile(AFileName);
  SetFileName(AFileName);
  Editor.SetFocus;
  Editor.Modified := False;
  SetModified(False);
end
else
Begin
  Editor2.Lines.LoadFromFile(AFileName);
  SetFileName(AFileName);
  Editor2.SetFocus;
  Editor2.Modified := False;
  SetModified(False);
end;
end;

procedure TFrmEditor.FileOpen(Sender: TObject);
begin
  CheckFileSave;
  if OpenDialog.Execute then
  begin
    PerformFileOpen(OpenDialog.FileName);
    If actual=1
    then Editor.ReadOnly := ofReadOnly in OpenDialog.Options
    else  Editor2.ReadOnly := ofReadOnly in OpenDialog.Options;
  end;
end;

procedure TFrmEditor.FileSave(Sender: TObject);
begin
  if FFileName = sUntitled then
    FileSaveAs(Sender)
  else
  begin
   If Actual=1 then
   Begin
    Editor.Lines.SaveToFile(FFileName);
    Editor.Modified := False;
   end
   else
   Begin
    Editor2.Lines.SaveToFile(FFileName);
    Editor2.Modified := False;
   End;
    SetModified(False);

  end;
end;

procedure TFrmEditor.FileSaveAs(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    if FileExists(SaveDialog.FileName) then
      if MessageDlg(Format(sOverWrite, [SaveDialog.FileName]),
        mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;
    If Actual=1
    then
    Begin
    Editor.Lines.SaveToFile(SaveDialog.FileName);
    SetFileName(SaveDialog.FileName);
    Editor.Modified := False;
    end
    else
    Begin
    Editor2.Lines.SaveToFile(SaveDialog.FileName);
    SetFileName(SaveDialog.FileName);
    Editor2.Modified := False;
    end;
    SetModified(False);
  end;
end;

procedure TFrmEditor.FileExit(Sender: TObject);
begin
  Close;
end;

procedure TFrmEditor.EditUndo(Sender: TObject);
begin
If actual=1
then
Begin
  with Editor do
    if HandleAllocated then SendMessage(Handle, EM_UNDO, 0, 0);
end
else
begin
  with Editor2 do
    if HandleAllocated then SendMessage(Handle, EM_UNDO, 0, 0);
end;
end;

procedure TFrmEditor.EditCut(Sender: TObject);
begin
If Actual=1
then  Editor.CutToClipboard
else  Editor2.CutToClipboard;
end;

procedure TFrmEditor.EditCopy(Sender: TObject);
begin
If Actual=1
then  Editor.CopyToClipboard
else  Editor2.CopyToClipboard;
end;

procedure TFrmEditor.EditPaste(Sender: TObject);
begin
If Actual=1
then Editor.PasteFromClipboard
else Editor2.PasteFromClipboard;
end;

procedure TFrmEditor.SelectFont(Sender: TObject);
begin
If Actual=1 then
Begin
  FontDialog1.Font.Assign(Editor.SelAttributes);
  if FontDialog1.Execute then
    CurrText.Assign(FontDialog1.Font);
  SelectionChange(Self);
  Editor.SetFocus;
end
else
Begin
  FontDialog1.Font.Assign(Editor2.SelAttributes);
  if FontDialog1.Execute then
    CurrText.Assign(FontDialog1.Font);
  SelectionChange(Self);
  Editor2.SetFocus;
end;
end;

procedure TFrmEditor.RulerResize(Sender: TObject);
begin
  RulerLine.Width := Ruler.ClientWidth - (RulerLine.Left*2);
end;

procedure TFrmEditor.FormResize(Sender: TObject);
begin
  SetEditRect;
  SelectionChange(Sender);
end;

procedure TFrmEditor.FormPaint(Sender: TObject);
begin
  SetEditRect;
end;

procedure TFrmEditor.BoldButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if BoldButton.Down
    then CurrText.Style := CurrText.Style + [fsBold]
    else CurrText.Style := CurrText.Style - [fsBold];
end;

procedure TFrmEditor.ItalicButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if ItalicButton.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
end;

procedure TFrmEditor.FontSizeChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Size := StrToInt(FontSize.Text);
end;

procedure TFrmEditor.AlignButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  If actual=1 then  Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag)
  else Editor2.Paragraph.Alignment := TAlignment(TControl(Sender).Tag)
end;

procedure TFrmEditor.FontNameChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Name := FontName.Items[FontName.ItemIndex];
end;

procedure TFrmEditor.UnderlineButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if UnderlineButton.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
end;

procedure TFrmEditor.BulletsButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  If actual=1
  then Editor.Paragraph.Numbering := TNumberingStyle(BulletsButton.Down)
  else Editor2.Paragraph.Numbering := TNumberingStyle(BulletsButton.Down);
end;

procedure TFrmEditor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
{
  try
    CheckFileSave;
  except
    CanClose := False;
  end;
  }
end;

{ Ruler Indent Dragging }

procedure TFrmEditor.RulerItemMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TFrmEditor.RulerItemMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if FDragging then
    TLabel(Sender).Left :=  TLabel(Sender).Left+X-FDragOfs
end;

procedure TFrmEditor.FirstIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  If Actual=1
  then  Editor.Paragraph.FirstIndent := Trunc((FirstInd.Left+FDragOfs-GutterWid) / RulerAdj)
  else   Editor2.Paragraph.FirstIndent := Trunc((FirstInd.Left+FDragOfs-GutterWid) / RulerAdj);
  LeftIndMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TFrmEditor.LeftIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  If Actual=1
  then Editor.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs-GutterWid) / RulerAdj)-Editor.Paragraph.FirstIndent
  else Editor2.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs-GutterWid) / RulerAdj)-Editor.Paragraph.FirstIndent;

  SelectionChange(Sender);
end;

procedure TFrmEditor.RightIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  If Actual=1
  then Editor.Paragraph.RightIndent := Trunc((Ruler.ClientWidth-RightInd.Left+FDragOfs-2) / RulerAdj)-2*GutterWid
  else Editor2.Paragraph.RightIndent := Trunc((Ruler.ClientWidth-RightInd.Left+FDragOfs-2) / RulerAdj)-2*GutterWid;  
  SelectionChange(Sender);
end;

procedure TFrmEditor.UpdateCursorPos;
var
  CharPos: TPoint;
begin
If Actual=1
then
Begin
  CharPos.Y := SendMessage(Editor.Handle, EM_EXLINEFROMCHAR, 0,
    Editor.SelStart);
  CharPos.X := (Editor.SelStart -
    SendMessage(Editor.Handle, EM_LINEINDEX, CharPos.Y, 0));
end
else
Begin
  CharPos.Y := SendMessage(Editor2.Handle, EM_EXLINEFROMCHAR, 0,
    Editor2.SelStart);
  CharPos.X := (Editor2.SelStart -
    SendMessage(Editor2.Handle, EM_LINEINDEX, CharPos.Y, 0));
End;
  Inc(CharPos.Y);
  Inc(CharPos.X);
  StatusBar.Panels[0].Text := Format(sColRowInfo, [CharPos.Y, CharPos.X]);
end;

procedure TFrmEditor.FormShow(Sender: TObject);
begin
  UpdateCursorPos;
  DragAcceptFiles(Handle, True);
  RichEditChange(nil);
  Editor.SetFocus;
  { Check if we should load a file from the command line }
  if (ParamCount > 0) and FileExists(ParamStr(1)) then
    PerformFileOpen(ParamStr(1));
end;

procedure TFrmEditor.WMDropFiles(var Msg: TWMDropFiles);
var
  CFileName: array[0..MAX_PATH] of Char;
begin
  try
    if DragQueryFile(Msg.Drop, 0, CFileName, MAX_PATH) > 0 then
    begin
      CheckFileSave;
      PerformFileOpen(CFileName);
      Msg.Result := 0;
    end;
  finally
    DragFinish(Msg.Drop);
  end;
end;

procedure TFrmEditor.RichEditChange(Sender: TObject);
begin
If Actual=1
then SetModified(Editor.Modified)
else SetModified(Editor2.Modified);
end;

procedure TFrmEditor.SetModified(Value: Boolean);
begin
  if Value then StatusBar.Panels[1].Text := sModified
  else StatusBar.Panels[1].Text := '';
end;



procedure TFrmEditor.ActionList2Update(Action: TBasicAction;
  var Handled: Boolean);
begin
 { Update the status of the edit commands }
 If Actual=1
 then
 Begin
  EditCutCmd.Enabled := Editor.SelLength > 0;
  EditCopyCmd.Enabled := EditCutCmd.Enabled;
  if Editor.HandleAllocated then
  begin
    EditUndoCmd.Enabled := Editor.Perform(EM_CANUNDO, 0, 0) <> 0;
    EditPasteCmd.Enabled := Editor.Perform(EM_CANPASTE, 0, 0) <> 0;
  end;
 end
 else
 Begin
  EditCutCmd.Enabled := Editor2.SelLength > 0;
  EditCopyCmd.Enabled := EditCutCmd.Enabled;
  if Editor2.HandleAllocated then
  begin
    EditUndoCmd.Enabled := Editor2.Perform(EM_CANUNDO, 0, 0) <> 0;
    EditPasteCmd.Enabled := Editor2.Perform(EM_CANPASTE, 0, 0) <> 0;
  end;
 end;
end;

procedure TFrmEditor.Editor2Enter(Sender: TObject);
begin
actual:=2;
end;

procedure TFrmEditor.EditorEnter(Sender: TObject);
begin
actual:=1;
end;

procedure TFrmEditor.BitBtn2Click(Sender: TObject);
begin
If Actual=1
then
  Begin
   reTemp.clear;
   reTemp.text:='@@NOMBRE@@';
   reTemp.SelStart:=0;
   reTemp.selLength:=10;
   reTemp.CopyToClipboard;
   editor.PasteFromClipboard;
  end
else
  Begin
   reTemp.clear;
   reTemp.text:='@@NOMBRE@@';
   reTemp.SelStart:=0;
   reTemp.selLength:=10;
   reTemp.CopyToClipboard;
   editor2.PasteFromClipboard;
  End;
end;

procedure TFrmEditor.BitBtn1Click(Sender: TObject);
begin
If Actual=1
then
  Begin
   reTemp.clear;
   reTemp.text:='@@FECHA@@';
   reTemp.SelStart:=0;
   reTemp.selLength:=9;
   reTemp.CopyToClipboard;
   editor.PasteFromClipboard;
  end
else
begin
   reTemp.clear;
   reTemp.text:='@@FECHA@@';
   reTemp.SelStart:=0;
   reTemp.selLength:=9;
   reTemp.CopyToClipboard;
   editor2.PasteFromClipboard;
End
end;

procedure TFrmEditor.ToolButton1Click(Sender: TObject);
Var x,y,longitud,totespacios,aumentar,aumentados :Integer;
    cadena:string;
   Function cuentaEspacios(Linea:String):integer;
   Var cuenta,a:integer;

   Begin
     cuenta:=0;
     for a:=0 to length(linea) do
     Begin
        If linea[a]=' ' then cuenta:=cuenta+1;
     end;
     Result:=cuenta
   End;
begin
If Actual=1
then
  Begin
     //1.- obten la linea mas ancha
     longitud:=0;
     For x:=1 to Editor.Lines.Count do
     Begin
        if length(editor.Lines.Strings[x]) > longitud
        then  longitud:=length(editor.Lines.Strings[x]);
     end;
     // 2.- todas las lineas deben tener ese ancho revisar linea por linea
     For x:=1 to Editor.Lines.Count do
     Begin
        if length(editor.Lines.Strings[x]) < longitud
        then
        Begin
           TotEspacios:=cuentaEspacios(editor.Lines.Strings[x]);
           Aumentar:=Longitud-length(editor.Lines.Strings[x]);
           Y:=0;
           cadena:=editor.Lines.Strings[x];
           aumentados:=0;
           While (aumentar-Aumentados > 0) AND (Y <LENGTH(Cadena)) do
           Begin
               while (Y <  length(Cadena) ) and (Copy(cadena,y,1) <> ' ') do
               Begin
                  Y:=Y+1;
               End;
               if Y < length(Cadena)
               then
                 begin
                    insert(' ',cadena,Y);
                    aumentados:=aumentados+1;
                    Y:=Y+1;
                 end;
               y:=Y+1;
           end;
           editor.lines.strings[x]:=Cadena;
        End;

     end;
  end
else
  Begin
  End;
end;

end.
