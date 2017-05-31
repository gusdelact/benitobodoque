unit Wwdbdlg;
{
//
// Components : TwwDBLookupDlg
//
// Copyright (c) 1995, 1996, 1997, 1998 by Woll2Woll Software
//
// 9/19/97  - AutoDropDown with ShowMatchText should copy only selected text
//
// 10/7/97 - Check for active after OnDropDown is called
//
// 5/12/98 - check for active lookuptable before calling resync
// 5/28/98 - Restore original text before dialog opened
// 1/4/99 - Set InList if ok clicked from dialog
// 2/10/99 - Add PictureMaskFromField property for Delphi 4
}

interface
{$i wwIfDef.pas}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, Buttons,
  Forms, Dialogs, StdCtrls, wwdblook, dbTables, wwiDlg, db,
  Wwdbgrid, wwTable, menus, wwdbigrd, wwstr, wwcommon, wwframe;


type

  TwwDBLookupComboDlg = class(TwwDBCustomLookupCombo)
  private
    FGridOptions: TwwDBGridOptions;
    FGridColor: TColor;
    FGridTitleAlignment: TAlignment;
    FOptions : TwwDBLookupDlgOptions;
    FCaption: String;
    FMaxWidth, FMaxHeight: integer;
    FUserButton1Click: TwwUserButtonEvent;
    FUserButton2Click: TwwUserButtonEvent;
    FUserButton1Caption: string;
    FUserButton2Caption: string;
    FOnInitDialog: TwwOnInitDialogEvent;
    FOnCloseDialog: TwwOnInitDialogEvent;
    FOnSortChange: TNotifyEvent;
    {$ifdef wwDelphi4Up}
    FPictureMaskFromField: boolean;
    {$endif}

    FControlType: TStrings;
    FControlInfoInDataset: boolean;
    FPictureMasks: TStrings;
    FPictureMaskFromDataSet: boolean;

    procedure SetPictureMasks(val: TStrings);
    procedure SetControlType(val: TStrings);
    procedure SetOptions(sel: TwwDBLookupDlgOptions);
    procedure SetGridOptions(sel: TwwDBGridOptions);

  protected
//    Function LoadComboGlyph: HBitmap; override;
//    Procedure DrawButton(Canvas: TCanvas; R: TRect; State: TButtonState;
//       ControlState: TControlState; var DefaultPaint: boolean); override;
    Function IsLookupDlg: boolean; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DropDown; override;

  published
    {$ifdef wwDelphi4Up}
    property Anchors;
    property BiDiMode;
    property Constraints;
    property ParentBiDiMode;
    property PictureMaskFromField: boolean read FPictureMaskFromField write FPictureMaskFromField default False;
    {$endif}

    property ControlType : TStrings read FControlType write SetControlType;
    property ControlInfoInDataset: boolean
           read FControlInfoInDataset write FControlInfoInDataSet default True;
    property PictureMaskFromDataset: boolean
            read FPictureMaskFromDataset write FPictureMaskFromDataSet default True;
    property PictureMasks: TStrings read FPictureMasks write SetPictureMasks;

    property Options: TwwDBLookupDlgOptions read FOptions write SetOptions
      default [opShowOKCancel, opShowSearchBy];
    property GridOptions: TwwDBGridOptions read FGridOptions write SetGridOptions
      default [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines,
      dgRowLines, dgTabs, dgConfirmDelete, dgPerfectRowFit];

    property GridColor: TColor read FGridColor write FGridColor;
    property GridTitleAlignment: TAlignment read FGridTitleAlignment write FGridTitleAlignment;
    property Caption : String read FCaption write FCaption;
    property MaxWidth : integer read FMaxWidth write FMaxWidth;
    property MaxHeight : integer read FMaxHeight write FMaxHeight;
    property UserButton1Caption: string read FUserButton1Caption write FUserButton1Caption;
    property UserButton2Caption: string read FUserButton2Caption write FUserButton2Caption;
    property OnUserButton1Click: TwwUserButtonEvent read FUserButton1Click write FUserButton1Click;
    property OnUserButton2Click: TwwUserButtonEvent read FUserButton2Click write FUserButton2Click;
    property OnInitDialog: TwwOnInitDialogEvent read FOnInitDialog write FOnInitDialog;
    property OnCloseDialog: TwwOnInitDialogEvent read FOnCloseDialog write FOnCloseDialog;
    property OnSortChange: TNotifyEvent read FOnSortChange write FOnSortChange;

    property SearchDelay;
    property Selected;
    property DataField;
    property DataSource;
    property LookupTable;
    property LookupField;
    property SeqSearchOptions;
    property Style;
    property AutoSelect;
    property Color;
    property DragCursor;
    property DragMode;
    property Enabled;
    property ButtonStyle default cbsEllipsis;
    property ButtonEffects;
    property ButtonWidth;
    property ButtonGlyph;
    property Frame;

    {$ifdef wwDelphi3Up}
    property ImeMode;
    property ImeName;
    {$endif}
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
    property OrderByDisplay;
    property AllowClearKey;
    property UseTFields;
    property UnboundAlignment;
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
  end;

procedure Register;

implementation

uses wwlocate;

constructor TwwDBLookupComboDlg.Create(AOwner: TComponent);
begin
   inherited create(AOwner);

   ButtonStyle:= cbsEllipsis;
   
   FGridOptions := [dgTitles, dgIndicator, dgColumnResize, dgRowSelect,
    dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete,
    dgPerfectRowFit];

   FGridColor:= clWhite;
   FGridTitleAlignment:= taLeftJustify;
   FOptions:= [opShowOKCancel, opShowSearchBy];
   FCaption:= 'Lookup';
   FMaxHeight:= 209;
   FGrid.SkipDataChange:= True;

   FControlType:= TStringList.create;
   FControlInfoInDataset:= True;
   FPictureMasks:= TStringList.create;
   FPictureMaskFromDataSet:= True;

end;

destructor TwwDBLookupComboDlg.Destroy;
begin
   FControlType.Free;
   FPictureMasks.Free;
   inherited Destroy;
end;

(*
Procedure TwwDBLookupComboDlg.DrawButton(Canvas: TCanvas; R: TRect; State: TButtonState;
       ControlState: TControlState; var DefaultPaint: boolean);
var Transparent: boolean;
begin

   {$ifdef win32}
   DefaultPaint:= False;
   Transparent:=  FButton.Flat and
      (not FMouseInButtonControl) and not (FFocused);
//   Transparent:=  FButton.Flat and
//      (not FMouseInButtonControl) and (not Focused);
   wwDrawEllipsis(Canvas, R, State, Enabled, Transparent,
         ButtonEffects.Transparent and ButtonEffects.Flat,
//                  ButtonEffects.Transparent,
         ControlState)
//   wwDrawEllipsis(Canvas, R, State, Enabled, ControlState)
   {$endif}
end;

*)

//Function TwwDBLookupComboDlg.LoadComboGlyph: HBitmap; { Win95 }
//begin
//   if FlatButton then
//      result:= LoadBitmap(HInstance, 'WWDOTS')
//   result:= LoadBitmap(HInstance, 'DOTS');
//end;

procedure TwwDBLookupComboDlg.SetOptions(sel: TwwDBLookupDlgOptions);
begin
   FOptions:= sel;
end;

procedure TwwDBLookupComboDlg.SetGridOptions(sel: TwwDBGridOptions);
begin
   FGridOptions:= sel;
end;

procedure TwwDBLookupComboDlg.DropDown;
type SmallString = string[63];
var MyOnDropDown: TNotifyEvent;
    {fromFieldName: String;} {Win95 - formerly SmallString}
    MyOnCloseUp: TNotifyCloseUpEvent;
    res: boolean;
    keyFieldValue: string;
    lkupField: TField;
    searchText, field1name: SmallString;
    curpos: integer;
    modified: boolean;
begin
   if ReadOnly then exit;

   if (LookupTable=Nil) then begin
      MessageDlg('No lookup table specified!', mtWarning, [mbok], 0);
      RefreshButton;
      exit;
   end;

   try
     { If calculated field then
       1. Find dest link field(s) name
       2. Set lookup table to use indexName for calculated field indexName
       3. Perform FindKey
       4. Switch index of lookupTable to match display of left-most column field
       5. After dialog returns, change value of from link field to selection
     }
     MyOnDropDown:= OnDropDown;
     MyOnCloseUp:= OnCloseUp;
     if Assigned(MyOnDropDown) then MyOnDropDown(Self);

     {10/7/97 - Check for active after OnDropDown is called }
     if (not LookupTable.active) then begin
        MessageDlg('No lookup table specified!', mtWarning, [mbok], 0);
        RefreshButton;
        exit;
     end;

     { default to lookup field if no selection }
     curPos:= 1;
     field1Name:= strGetToken(lookupField, ';', curpos);

     if (Selected.count=0) then begin
        if isWWCalculatedField then lkupField:= TwwPopupGrid(FGrid).DisplayFld
        else lkupField:= lookupTable.findField(field1Name);
        if (lkupField<>Nil) then begin
           Selected.add(
              lkupField.fieldName + #9 + inttostr(lkupField.displayWidth) + #9 +
              lkupField.DisplayLabel);
        end
     end;

     {9/19/97  - AutoDropDown with ShowMatchText should copy only selected text }
     if AutoDropDown and inAutoDropDown then begin
        if ShowMatchText then
           SearchText:= copy(Text, 1, selStart)
        else
           SearchText:= Text
     end
     else SearchText:= '';

     if (dataSource<>Nil) and (dataSource.dataSet<>Nil)
        and isWWCalculatedField then begin

        {7/20/98}
        if not InAutoDropDown then Grid.DoLookup(True); { Called in case lookupTable was moved by another control }

        if (not HasMasterSource) and (LookupTable is TwwTable) and OrderByDisplay then
           LTable.setToIndexContainingFields(Selected);

        res:=  ExecuteWWLookupDlg(Screen.ActiveForm, self, Selected, lookupTable, FOptions, FGridOptions,
                  FGridColor, FGridTitleAlignment, FCaption, FMaxWidth, FMaxHeight, CharCase,
                  FUserButton1Caption, FUserButton2Caption,
                  FUserButton1Click, FUserButton2Click, FOnInitDialog, FOnCloseDialog,
                  FOnSortChange, SearchText, UseTFields,
                  {$ifdef wwDelphi4Up}
                  PictureMaskFromField
                  {$else}
                  False
                  {$endif}
                  );
        if (DataSource<>Nil) and (DataSource.dataset<>Nil) then
           DataSource.dataSet.disableControls;

        if res then begin
           InList:= True; { 1/4/99 }
           if LookupField<>'' then UpdateFromCurrentSelection;  { Updates FValue^ used by wwChangeFromLink }
           wwChangefromLink(LookupTable, modified)
        end
        else modified:= false;


        if Assigned(MyOnCloseUp) then begin
           MyOnCloseUp(Self, LookupTable, dataSource.dataSet, modified);
        end;
        if (DataSource<>Nil) and (DataSource.dataset<>Nil) then
           DataSource.dataSet.enableControls;
     end
     else begin
{        if (lookupTable.fieldByName(Field1Name).asString <> LookupValue) or}
         if  (LookupValue='') or isLookupRequired then begin

           { Switch index to lookup field's index }
           if (LookupTable is TwwTable) and (LTable.MasterSource=Nil) and (Lookupfield<>'') then
              LTable.setToIndexContainingField(LookupField);

           if TwwPopupGrid(FGrid).LookupFieldCount<2 then begin
              if UseSeqSearch or (LTable.indexFieldCount=0) then { Sequential search }
              begin
                 FindRecord(LookupValue, LookupField, mtExactMatch,
                            ssoCaseSensitive in SeqSearchOptions)
              end
              else LTable.wwFindKey([LookupValue])
           end
           else if TwwPopupGrid(FGrid).LookupFieldCount<3 then
             LTable.wwFindKey([LookupValue, Value2])
           else LTable.wwFindKey([LookupValue, SetValue2, SetValue3]);
        end;

        {Switch index back to previous index if not sql}
        if (LookupTable is TwwTAble) and (not HasMasterSource) and OrderByDisplay then
           LTable.setToIndexContainingFields(Selected);

        res:= ExecuteWWLookupDlg(Screen.ActiveForm, self, Selected, lookupTable, FOptions, FGridOptions,
                  FGridColor, FGridTitleAlignment, FCaption, FMaxWidth, FMaxHeight, CharCase,
                  FUserButton1Caption, FUserButton2Caption,
                  FUserButton1Click, FUserButton2Click, FOnInitDialog, FOnCloseDialog,
                  FOnSortChange, SearchText, UseTFields,
                  {$ifdef wwDelphi4Up}
                  PictureMaskFromField
                  {$else}
                  False
                  {$endif}
                  );

        if (DataSource<>Nil) and (DataSource.dataset<>Nil) then
           DataSource.dataSet.disableControls;

        try

           skipDataChange:= True;  { Don't update internal lookup values 1/15/96 }

           if res then
           begin
              InList:= True; { 1/4/99 }
              if LookupField<>'' then begin
                 KeyFieldValue:= lookupTable.fieldByName(Field1Name).Text;
                 FFieldLink.Edit;
                 if (DataSource=Nil) or (DataSource.dataSet=Nil) then
                 begin
                     UpdateFromCurrentSelection;
                     Text:= TwwPopupGrid(FGrid).DisplayValue;
                 end;
                 FFieldLink.Modified;
                 if FFieldLink.Field<>Nil then begin
                    FFieldLink.Field.AsString := KeyFieldValue; { forces calculated fields to refresh }
                    UpdateFromCurrentSelection;       { 8/25/96 - Update internal variables }
                    Text:= FGrid.DisplayFld.asString; { 8/25/96 }
                    FFieldLink.UpdateRecord;          { 1/22/96 - Update 2nd-3rd fields }
                 end
              end
           end
           else if InAutoDropDown and (Style=csDropDownList) then
              SendMessage(Handle, WM_CHAR, VK_ESCAPE, 0); { 5/28/98 - Restore original text before dialog opened }

           if Assigned(MyOnCloseUp) then begin
              if DataSource=Nil then MyOnCloseUp(Self, LookupTable, Nil, res)
              else MyOnCloseUp(Self, LookupTable, DataSource.dataSet, res);
           end;

        finally
           if (DataSource<>Nil) and (DataSource.dataset<>Nil) then
              DataSource.dataSet.enableControls;
        end;
     end;

   finally
      if (Style <> csDropDownList) or AutoDropDown then SelectAll;
      FLastSearchKey:= '';
      RefreshButton;
      SkipDataChange:= False;
      if modified and LookupTable.active then begin { 5/12/98 check for active lookuptable }
         LookupTable.updateCursorPos;
         LookupTable.resync([]);
      end
   end;
end;

Function TwwDBLookupComboDlg.IsLookupDlg: boolean;
begin
   result:= True;
end;


procedure TwwDBLookupComboDlg.SetPictureMasks(val: TStrings);
begin
   FPictureMasks.assign(val);
end;

procedure TwwDBLookupComboDlg.SetControlType(val: TStrings);
begin
   ControlType.assign(val);
end;


procedure Register;
begin
{  RegisterComponents('InfoPower', [TwwDBLookupComboDlg]);}
end;

end.
