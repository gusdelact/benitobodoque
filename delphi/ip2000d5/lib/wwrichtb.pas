{
//
// Components : TwwRichTabDialog
//
// Copyright (c) 1998 by Woll2Woll Software
//
// 8/26/98 - Change the tab order to not be a sorted listbox, as this would
//           not allow it to work for values >= 10.
}
unit wwrichtb;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, wwriched, wwstr, wwsystem, richedit, wwintl;

type
  TwwRichTabDialog = class(TForm)
    OKButton: TButton;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button4Click(Sender: TObject);
    procedure SetButtonClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure OKButtonClick(Sender: TObject);
  private
    richedit: TwwCustomRichEdit;
    Procedure ApplyIntl;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  wwRichTabDialog: TwwRichTabDialog;

Function wwRichTabDlg(richedit1: TwwCustomRichEdit): boolean;

implementation

Function wwRichTabDlg(richedit1: TwwCustomRichEdit): boolean;
var tabs: array[0..MAX_TAB_STOPS] of longint;
    i: integer;
    str: string;
    format: TwwParaFormat2;
begin

   with TwwRichTabDialog.create(Application) do begin
      richEdit:= richedit1;
      ApplyIntl;
      richedit.GetParaFormat(Format);
      for i:= 0 to format.cTabcount-1 do
         with richedit do
            listbox1.items.add(FormatUnitStr(TwipsToUnits(format.rgxTabs[i])));

      result:= (ShowModal = mrOK);
      if result then begin
         for i:= 0 to listbox1.Items.count-1 do
         begin
            str:= listbox1.items[i];
            strStripTrailing(str, ['''', ' ', 'c', 'm', 'C', 'M']);
            tabs[i]:= richedit.UnitStrToTwips(str);
         end;
         richedit1.SetParaFormat([rpoTabs], '', False, 0, 0, 0,
            listbox1.items.count, @tabs, 0, 0, 0, 0);
      end;
      Free; { Not previously freed }
   end

end;

{$R *.DFM}


procedure TwwRichTabDialog.Button4Click(Sender: TObject);
begin
  ListBox1.clear;
end;

procedure TwwRichTabDialog.SetButtonClick(Sender: TObject);
var curitem, str: string;
    twips, i: integer;
    val: double;
    added: boolean;
begin
   if edit1.text='' then exit;

   str:= edit1.text;
   strStripTrailing(str, ['''', ' ', 'c', 'm', 'C', 'M']);
   if not wwstrtofloat(str) then exit;

   { Limit to valid range }
   twips:= richedit.UnitStrToTwips(str);
   if (twips<0) or (twips>22*1440) then exit;

   val:= strToFloat(str);
   if (ListBox1.items.indexOf(richedit.FormatUnitStr(val)))<0 then
   begin
      added:= false;
      for i:= 0 to Listbox1.items.count-1 do begin
         curItem:= Listbox1.items[i];
         strStripTrailing(curItem, ['''', ' ', 'c', 'm', 'C', 'M']);
         if not wwstrtofloat(str) then continue;

         if val<strToFloat(curItem) then
         begin
            Listbox1.items.insert(i, richedit.FormatUnitStr(val));
            added:= true;
            break;
         end
      end;

      if not added then
        ListBox1.items.add(richedit.FormatUnitStr(val));
      edit1.text:= '';
   end;
end;

procedure TwwRichTabDialog.Button2Click(Sender: TObject);
var i: integer;
begin
   with Listbox1 do begin
     I := 0;
     while SelCount > 0 do
     begin
        if Selected[I] then Items.Delete(i)
        else Inc(I);
     end
   end;
end;

procedure TwwRichTabDialog.Edit1Enter(Sender: TObject);
begin
   OKButton.default:= False;
end;

procedure TwwRichTabDialog.Edit1Exit(Sender: TObject);
begin
   OKButton.default:= True;
end;

procedure TwwRichTabDialog.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if (ord(key)=vk_return) then begin
      if edit1.text='' then modalResult:= mrOK
      else begin
         SetButtonClick(Sender);
      end
   end
end;

procedure TwwRichTabDialog.OKButtonClick(Sender: TObject);
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
   if Edit1.text<>'' then
   begin
      if not ValidValue(Edit1.text) then begin
         Edit1.setFocus;
         modalResult:= mrNone;
      end
      else begin
         SetButtonClick(Sender);
      end
   end
end;

procedure TwwRichTabDialog.ApplyIntl;
begin
    with wwInternational.RichEdit do begin

      Caption := TabDialog.TabDlgCaption;

      GroupBox1.Caption := TabDialog.TabGroupBoxCaption;
      Button1.Caption := TabDialog.SetTabButtonCaption;
      Button2.Caption := TabDialog.ClearTabButtonCaption;
      Button4.Caption := TabDialog.ClearAllButtonCaption;

      OKButton.Caption := wwInternational.BtnOKCaption;
      Button3.Caption := wwInternational.BtnCancelCaption;

      if (reoShowHints in RichEdit.EditorOptions) then begin
         Edit1.ShowHint := True;
         ListBox1.ShowHint := True;
         Button1.ShowHint := True;
         Button2.ShowHint := True;
         Button4.ShowHint := True;


         Edit1.Hint := TabDialog.TabPositionEditHint;
         ListBox1.Hint := TabDialog.ListBoxHint;
         Button1.Hint := TabDialog.SetButtonHint;
         Button2.Hint := TabDialog.ClearButtonHint;
         Button4.Hint := TabDialog.ClearAllButtonHint;
      end;

    end;
end;


end.

