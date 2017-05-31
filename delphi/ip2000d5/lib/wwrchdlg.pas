{
//
// Components : TwwRichParagraphDialog
//
// Copyright (c) 1998 by Woll2Woll Software
//
// 1/5/99 - Support rich edit 1 in paragraph
}
unit wwrchdlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, wwintl,
  StdCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb, comctrls, buttons, wwsystem,
  wwstr, wwriched, wwcommon, ExtCtrls;

type
  TwwRichParagraphDialog = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Panel1: TPanel;
    Label4: TLabel;
    AlignmentCombo: TwwDBComboBox;
    Bevel1: TBevel;
    Label1: TLabel;
    LeftEdit: TEdit;
    Label2: TLabel;
    RightEdit: TEdit;
    Label3: TLabel;
    FirstLineEdit: TEdit;
    GroupBox1: TLabel;
    SpacingGroup: TLabel;
    Bevel2: TBevel;
    BeforeParagraphLabel: TLabel;
    BeforeParagraphEdit: TEdit;
    AfterParagraphLabel: TLabel;
    AfterParagraphEdit: TEdit;
    WithinParagraphLabel: TLabel;
    WithinParagraphEdit: TEdit;
    LineSpacingComboBox: TComboBox;
    WithinParagraphAt: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure LineSpacingComboBoxClick(Sender: TObject);
    procedure LineSpacingComboBoxChange(Sender: TObject);
    procedure WithinParagraphEditKeyPress(Sender: TObject; var Key: Char);
  private
{    OKBtn, CancelBtn: TButton;}
    Procedure ApplyIntl;
  public
    RichEdit: TwwCustomRichEdit;
    { Public declarations }
  end;

var
  wwRichParagraphDialog: TwwRichParagraphDialog;

Function wwRichEditParagraphDlg(richedit1: TwwCustomRichEdit): boolean;

implementation

uses wwrich;

{$R *.DFM}

Function wwRichEditParagraphDlg(richedit1: TwwCustomRichEdit): boolean;
var templeft, tempRight, tempFirst: integer;  {Twips for better accuracy}
    temp: double;
    format: TwwParaFormat2;
    tempLineSpacing: integer;
    s: string;
begin
   with TwwRichParagraphDialog.create(Application) do begin

      RichEdit:= richedit1;
      ApplyIntl;
      richedit1.GetParaIndent(tempLeft, tempRight, tempFirst);

      temp:= richedit.TwipsToUnits(tempLeft+tempFirst);
      LeftEdit.text:= richedit.RoundedFormatUnitStr(temp, 0);
      FirstLineEdit.Text:= richedit.RoundedFormatUnitStr(richedit.TwipsToUnits(-tempLeft), 0);
      RightEdit.Text:= richedit.RoundedFormatUnitStr(richedit.TwipsToUnits(tempRight), 0);
      if richedit1.RichEditVersion>=2 then
      begin
         richedit1.GetParaFormat(Format);
         BeforeParagraphEdit.text:= richedit.RoundedFormatUnitStr(
                  richedit.TwipsToUnits(format.dySpaceBefore), 100);
         AfterParagraphEdit.Text:= richedit.RoundedFormatUnitStr(
                  richedit.TwipsToUnits(format.dySpaceAfter), 100);
         LineSpacingCombobox.itemIndex:= format.bLineSpacingRule;
         if LineSpacingCombobox.itemIndex=5 then
            WithinParagraphEdit.Text:= floatToStr(format.dyLineSpacing/20)
         else if LineSpacingCombobox.itemIndex>2 then
            WithinParagraphEdit.Text:= richedit.RoundedFormatUnitStr(
                  richedit.TwipsToUnits(format.dyLineSpacing), 100)
         else
            WithinParagraphEdit.Text:= '';
      end;

      case richedit1.paragraph.alignment of
         taleftJustify: AlignmentCombo.text:=wwInternational.RichEdit.ParagraphDialog.AlignLeft;
         taRightJustify: AlignmentCombo.text:=wwInternational.RichEdit.ParagraphDialog.AlignRight;
         taCenter: AlignmentCombo.text:=wwInternational.RichEdit.ParagraphDialog.AlignCenter;
      end;
      if RichEdit.RichEditVersion<2 then { 1/5/99 - Support rich edit 1 }
      begin
         BeforeParagraphEdit.enabled:= False;
         BeforeParagraphEdit.text:= '0';
         AfterParagraphEdit.text:= '0';
         WithinParagraphEdit.text:= '';
         AfterParagraphEdit.enabled:= False;
         LineSpacingCombobox.itemIndex:= 0;
         LineSpacingCombobox.enabled:= false;
         WithinParagraphEdit.enabled:= False;
      end;
      result:= ShowModal=mrOK;
      if result then begin
         tempLeft:= -richedit.UnitStrToTwips(FirstLineEdit.text);
         tempLeft:= wwmin(tempLeft, richedit.UnitStrToTwips(LeftEdit.text));
         tempFirst:= richedit.UnitStrToTwips(FirstLineEdit.text) +
                     richedit.UnitStrToTwips(LeftEdit.text);
         if LineSpacingComboBox.ItemIndex=5 then
         begin
            s:= WithinParagraphEdit.text;
            strStripTrailing(s, ['''', ' ', 'c', 'm', 'C', 'M']);
            if wwStrToFloat(s) then
               tempLineSpacing:= Trunc(StrToFloat(s) * 20)
            else tempLineSpacing:= 20;
         end
         else begin
            if WithinParagraphEdit.text<>'' then
               tempLineSpacing:= richedit.UnitStrToTwips(WithinParagraphEdit.text)
            else tempLineSpacing:= 0;
         end;
         richedit1.SetParaFormat([rpoLeftIndent, rpoRightIndent, rpoFirstLineIndent, rpoAlignment,
                         rpoSpaceBefore, rpoSpaceAfter, rpoLineSpacing],
           AlignmentCombo.text, False, tempLeft,
           richedit.UnitStrToTwips(RightEdit.text), tempFirst, 0, nil,
           richedit.UnitStrToTwips(BeforeParagraphEdit.text),
           richedit.UnitStrToTwips(AfterParagraphEdit.text),
           tempLineSpacing,
           LineSpacingCombobox.itemIndex);

      end;

      Free; { Not previously freed }
   end

end;

procedure TwwRichParagraphDialog.FormCreate(Sender: TObject);
begin
{   OkBtn:= TButton(wwCreateCommonButton(Self, bkOK));
   OKBtn.TabOrder := 4;
   OKBtn.onClick:= OKClick;
   CancelBtn:= TButton(wwCreateCommonButton(Self, bkCancel));
   CancelBtn.TabOrder := 5;

   OkBtn.Top:= wwAdjustPixels(16, PixelsPerInch);
   CancelBtn.Top:= wwAdjustPixels(52, PixelsPerInch);
   OkBtn.Left:= wwAdjustPixels(180, PixelsPerInch);
   CancelBtn.Left:= wwAdjustPixels(180, PixelsPerInch);
   OkBtn.visible:= True;
   CancelBtn.visible:= True;
}
end;

procedure TwwRichParagraphDialog.OKClick(Sender: TObject);

   Function ValidValue(str: string): boolean;
   var twips: integer;
   begin
      result:= False;
      strStripTrailing(str, ['''', ' ', 'c', 'm', 'C', 'M']);
      if not wwstrtofloat(str) then exit;

      twips:= richedit.UnitStrToTwips(str);
      if (twips<-22*1440) or (twips>22*1440) then exit;
      result:= True;
   end;

begin
   if not ValidValue(leftEdit.text) then begin
      LeftEdit.setFocus;
      modalResult:= mrNone;
   end
   else if not ValidValue(FirstLineEdit.text) then begin
      FirstLineEdit.setFocus;
      modalResult:= mrNone;
   end
   else if not ValidValue(RightEdit.text) then begin
      RightEdit.setFocus;
      modalResult:= mrNone;
   end
   else if not ValidValue(BeforeParagraphEdit.text) then begin
      BeforeParagraphEdit.setFocus;
      modalResult:= mrNone;
   end
   else if not ValidValue(AfterParagraphEdit.text) then begin
      AfterParagraphEdit.setFocus;
      modalResult:= mrNone;
   end
   else if (WithinParagraphEdit.text<>'') and
       not ValidValue(WithinParagraphEdit.text) then begin
      WithinParagraphEdit.setFocus;
      modalResult:= mrNone;
   end;
end;

procedure TwwRichParagraphDialog.ApplyIntl;
begin
    with wwInternational.RichEdit do begin

      Caption := ParagraphDialog.ParagraphDlgCaption;

      OKBtn.Caption := wwInternational.BtnOKCaption;
      CancelBtn.Caption := wwInternational.BtnCancelCaption;

      GroupBox1.Caption := ParagraphDialog.IndentationGroupBoxCaption;
      Label1.Caption := ParagraphDialog.LeftEditCaption;
      Label2.Caption := ParagraphDialog.RightEditCaption;
      Label3.Caption := ParagraphDialog.FirstLineEditCaption;
      Label4.Caption := ParagraphDialog.AlignmentCaption;
      SpacingGroup.Caption:= ParagraphDialog.SpacingGroupCaption;
      BeforeParagraphLabel.caption:= ParagraphDialog.BeforeParagraphCaption;
      AfterParagraphLabel.caption:= ParagraphDialog.AfterParagraphCaption;
      WithinParagraphLabel.caption:= ParagraphDialog.WithinParagraphCaption;
      WithinParagraphAt.caption:= ParagraphDialog.WithinParagraphAtCaption;

      if (reoShowHints in RichEdit.EditorOptions) then begin
         LeftEdit.ShowHint := True;
         RightEdit.ShowHint := True;
         FirstLineEdit.ShowHint := True;
         AlignmentCombo.ShowHint := True;

         LeftEdit.Hint := ParagraphDialog.LeftEditHint;
         RightEdit.Hint := ParagraphDialog.RightEditHint;
         FirstLineEdit.Hint := ParagraphDialog.FirstLineEditHint;
         AlignmentCombo.Hint := ParagraphDialog.AlignmentHint;
      end;

      AlignmentCombo.items.clear;
      AlignmentCombo.items.add(ParagraphDialog.AlignLeft);
      AlignmentCombo.items.add(ParagraphDialog.AlignCenter);
      AlignmentCombo.items.add(ParagraphDialog.AlignRight);
      AlignmentCombo.Applylist;

      {$ifdef wwdelphi4up}
      LineSpacingCombobox.items.clear;
      if ParagraphDialog.SpacingSingle='' then LineSpacingComboBox.items.add('Single')
      else LineSpacingComboBox.items.add(ParagraphDialog.SpacingSingle);
      if ParagraphDialog.Spacing1_5='' then LineSpacingComboBox.items.add('1.5 Lines')
      else LineSpacingComboBox.items.add(ParagraphDialog.Spacing1_5);
      if ParagraphDialog.SpacingDouble='' then LineSpacingComboBox.items.add('Double')
      else LineSpacingComboBox.items.add(ParagraphDialog.SpacingDouble);
      if ParagraphDialog.SpacingAtLeast='' then LineSpacingComboBox.items.add('At least')
      else LineSpacingComboBox.items.add(ParagraphDialog.SpacingAtLeast);
      if ParagraphDialog.SpacingExactly='' then LineSpacingComboBox.items.add('Exactly')
      else LineSpacingComboBox.items.add(ParagraphDialog.SpacingExactly);
      if ParagraphDialog.SpacingMultiple='' then LineSpacingComboBox.items.add('Multiple')
      else LineSpacingComboBox.items.add(ParagraphDialog.SpacingMultiple);
      {$endif}

    end;
end;

procedure TwwRichParagraphDialog.LineSpacingComboBoxClick(Sender: TObject);
begin
   WithinParagraphEdit.text:='';
end;

procedure TwwRichParagraphDialog.LineSpacingComboBoxChange(
  Sender: TObject);
var temp: double;
begin
  case LineSpacingCombobox.itemIndex of
    0,1,2: WithinParagraphEdit.text:= '';
    3,4: begin
        temp:= 20*12/1440;
        if RichEdit.measurementUnits=muCentimeters then
           temp:= temp * wwCentimetersPerInch;
        temp:=  Trunc(temp*100)/100;
        WithinParagraphEdit.text:= RichEdit.FormatUnitStr(temp)
      end;
    5: WithinParagraphEdit.text:= '1';
  end;
end;

procedure TwwRichParagraphDialog.WithinParagraphEditKeyPress(
  Sender: TObject; var Key: Char);
begin
   if LineSpacingCombobox.itemIndex<=2 then
      LineSpacingCombobox.itemIndex:= 5;
end;

end.
