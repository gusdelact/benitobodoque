{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 3.0 for Delphi and C++Builder               ::
  ::                                                         ::
  :: QREXTRA.PAS - ADDITIONAL CLASSES                        ::
  ::                                                         ::
  :: Copyright (c) 1998 QuSoft AS                            ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.no                               ::
  ::                                                         ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }

{$I QRDEFS.INC}

unit qrextra;

interface

{$R-}
{$T-}
{$B-}

uses windows, sysutils, classes, controls, stdctrls, extctrls,graphics, buttons,
     forms, dialogs, printers, db, clipbrd, qrprntr, quickrpt, qrctrls, qrcomped, qrexpbld,
     DBTables, QRPrev;

type
  { TQRPrintJob }
  TQRPrintJob = class
  protected
    procedure CreateOutput(AQRPrinter : TQRPrinter); virtual;
  public
    procedure Preview;
    procedure Print;
  end;

  { TQRPHandler }
  TQRPHandler = class
  private
    FFilename : string;
    FQRPrinter : TQRPrinter;
  protected
    procedure SetFilename(Value : string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Preview;
    procedure Print;
    property Filename : string read FFilename write SetFilename;
  end;

  { TQRBuilder - base report builder class }
  TQRBuilder = class(TComponent)
  private
    FActive : boolean;
    FFont : TFont;
    FOrientation : TPrinterOrientation;
    FReport : TCustomQuickRep;
    FTitle : string;
    NameList : TStrings;
  protected
    function NewName(AClassName : string) : string;
    procedure BuildFramework; virtual;
    procedure RenameObjects;
    procedure SetActive(Value : boolean); virtual;
    procedure SetOrientation(Value : TPrinterOrientation); virtual;
    procedure SetTitle(Value : string); virtual;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function FetchReport : TCustomQuickRep;
    property Active : boolean read FActive write SetActive;
    property Font : TFont read FFont write FFont;
    property Orientation : TPrinterOrientation read FOrientation write SetOrientation;
    property Report : TCustomQuickRep read FReport write FReport;
    property Title : string read FTitle write SetTitle;
  published
  end;

  { TQRListBuilder - Simple list report builder class }
  TQRListBuilder = class(TQRBuilder)
  private
    FDataSet : TDataSet;
    FFields : TStrings;
    procedure SetFields(Value : TStrings);
  protected
    procedure SetActive(Value : boolean); override;
    procedure BuildList; virtual;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure AddAllFields;
    property DataSet : TDataSet read FDataSet write FDataSet;
    property Fields : TStrings read FFields write SetFields;
  end;


{ Report builder procedures }

procedure QRCreateList(var AReport : TCustomQuickRep; AOwner : TComponent;
                       aDataSet : TDataSet; aTitle : string; aFieldList : TStrings);

function AllDataSets(Form : TCustomForm; IncludeDataModules : boolean) : TStrings;

procedure PopulateFontSizeCombo(aCombo : TComboBox);

function QRLoadReport(Filename : string) : TQuickRep;

procedure QRFreeReport(aReport : TQuickRep);

implementation

uses QR3Const;

{var
  QRToolbarLibrary : TQRLibrary;}

const
  cqrToolBarHeight = 90;
  cqrStatusBarHeight = 20;

  cQRFontSizeCount = 16;
  cQRFontSizes : array[1..cQRFontSizeCount] of integer =
      (8, 9, 10, 11, 12, 14, 16, 18, 20, 22, 24, 26, 28, 36, 48, 72);

{ Utility routines }

procedure PopulateFontSizeCombo(aCombo : TComboBox);
var
  I : integer;
begin
  aCombo.Items.Clear;
  for I := 1 to cQRFontSizeCount do
    aCombo.Items.Add(IntToStr(cQRFontSizes[I]));
end;

function AllDataSets(Form : TCustomForm; IncludeDataModules : boolean) : TStrings;
var
  J : integer;

  procedure AddForm(AControl : TWinControl);
  var
    I : integer;
  begin
    for I:=0 to AControl.ComponentCount - 1 do
    begin
      if AControl.Components[I] is TDataSet then
        Result.AddObject(TDataSet(AControl.Components[I]).Name, AControl.Components[I])
      else
        if AControl.Components[I] is TWinControl then
          AddForm(TWinControl(AControl.Components[I]));
    end;
  end;

  procedure AddDM(DM : TDataModule);
  var
    I : integer;
  begin
    for I:=0 to DM.ComponentCount - 1 do
      if DM.Components[I] is TDataSet then
        Result.AddObject(TDataSet(DM.Components[I]).Name, DM.Components[I]);
  end;

begin
  Result := TStringList.Create;
  if Form <> nil then
    AddForm(Form);
  if IncludeDataModules then
    for J := 0 to Screen.DataModuleCount - 1 do
      AddDM(Screen.DataModules[J]);
end;

function dup(aChar : Char; Count : integer) : string;
var
  I : integer;
begin
  result := '';
  for I := 1 to Count do result := result + aChar;
end;

function QRLoadReport(Filename : string) : TQuickRep;
{ a QRLoadReport'ed report should always be freed with QRFreeReport }
var
  aForm : TForm;
begin
  result := nil;
  try
    aForm := TForm.Create(Application);
    ReadComponentResFile(Filename, aForm);
    if (aForm.ComponentCount > 0) and (aForm.Components[0] is TQuickRep) then
      result := TQuickRep(aForm.Components[0]);
  except
    ShowMessage(SqrErrorLoading);
  end;
end;

procedure QRFreeReport(aReport : TQuickRep);
begin
  aReport.Owner.Free;
end;

{ TQRPrintJob }

procedure TQRPrintJob.CreateOutput(AQRPrinter : TQRPrinter);
begin
end;

procedure TQRPrintJob.Preview;
var
  aQRPrinter : TQRPrinter;
begin
  aQRPrinter := TQRPrinter.Create;
  with aQRPrinter do
  try
    Destination := qrdMetafile;
//    OnGenerateToPrinter := Self.Print;
    Preview;
    Application.ProcessMessages;
    CreateOutput(aQRPrinter);
    repeat
      Application.ProcessMessages
    until not aQRPrinter.ShowingPreview;
  finally
    Free;
  end;
end;

procedure TQRPrintJob.Print;
var
  aQRPrinter : TQRPrinter;
begin
  aQRPrinter := TQRPrinter.Create;
  with aQRPrinter do
  try
    Destination := qrdPrinter;
    CreateOutput(aQRPrinter);
  finally
    Free;
  end;
end;

{ TQRPHandler }

constructor TQRPHandler.Create;
begin
  FFilename := '';
  FQRPrinter := nil;
end;

destructor TQRPHandler.Destroy;
begin
  if assigned(FQRPrinter) then
    FQRPrinter.Free;
  inherited Destroy;
end;

procedure TQRPHandler.SetFilename(Value : string);
begin
  if FFilename <> Value then
  begin
    if assigned(FQRPrinter) then FQRPrinter.Free;
    FQRPrinter := TQRPrinter.Create;
    FFilename := Value;
    FQRPrinter.Load(Filename);
  end;
end;

procedure TQRPHandler.Preview;
begin
  if assigned(FQRPrinter) then
  begin
    FQRPrinter.Preview;
    repeat
      Application.HandleMessage
    until not FQRPrinter.ShowingPreview;
  end;
end;

procedure TQRPHandler.Print;
begin
  if assigned(FQRPrinter) then FQRPrinter.Print;
end;

{ TQRBuilder }

type
  TNameCount = class
  public
    Count : integer;
  end;

constructor TQRBuilder.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FActive := false;
  FReport := nil;
  Font := TFont.Create;
{$ifdef ver100}
  if SysLocale.PriLangID = LANG_JAPANESE then
    Font.Name := DefFontData.Name
  else
{$endif}
    Font.Name := 'Arial'; {<-- do not resource }
  Orientation := poPortrait;
  NameList := TStringList.Create;
end;

destructor TQRBuilder.Destroy;
var
  I : integer;
begin
  FFont.Free;
  Active := false;
  for I := 0 to NameList.Count - 1 do
    TNameCount(NameList.Objects[I]).Free;
  NameList.Free;
  inherited Destroy;
end;

function TQRBuilder.FetchReport : TCustomQuickRep;
begin
  if Active then
  begin
    Result := Report;
    FReport := nil;
    FActive := false;
  end else
    Result := nil;
end;

function TQRBuilder.NewName(AClassName : string) : string;
var
  Value : integer;
  Index : integer;
begin
  Delete(AClassName, 1, 1);
  Index := NameList.IndexOf(AClassName);
  if Index >= 0 then
  begin
    with TNameCount(NameList.Objects[Index]) do
      Count := Count + 1;
    Value := TNameCount(NameList.Objects[Index]).Count;
  end else
  begin
    NameList.Add(AClassName);
    Index := NameList.Count - 1;
    NameList.Objects[Index] := TNameCount.Create;
    TNameCount(NameList.Objects[Index]).Count := 1;
    Value := 1;
  end;
  Result := AClassName + IntToStr(Value);
end;

procedure TQRBuilder.RenameObjects;
var
  I : integer;
  aName : string;
  AOwner : TWinControl;
begin
  if Report.Owner = nil then
    AOwner := Report
  else
    AOwner := TWinControl(Report.Owner);
  for I := 0 to AOwner.ComponentCount - 1 do
  begin
    aName := AOwner.Components[I].Name;
    if aName = '' then
    begin
      aName := AOwner.Components[I].ClassName;
      Delete(aName, 1, 1);
      AOwner.Components[I].Name := UniqueName(AOwner, aName);
    end;
  end;
end;

procedure TQRBuilder.SetOrientation(Value : TPrinterOrientation);
begin
  FOrientation := Value;
  if Active then
    Report.Page.Orientation := Orientation;
end;

procedure TQRBuilder.SetTitle(Value : string);
begin
  FTitle := Value;
  if Active then
    Report.ReportTitle := Title;
end;

procedure TQRBuilder.BuildFramework;
var
  HadBand : boolean;
begin
  if FReport = nil then
  begin
    FReport := TQuickRep.Create(Owner);
    FReport.Parent := TWinControl(Owner);
    with Report do
    begin
      Visible := false;
      Page.Orientation := Orientation;
      Font := Self.Font;
      if Title <> '' then
      begin
        if not Bands.HasTitle then
          Bands.HasTitle := true;
        with TQRLabel(Bands.TitleBand.AddPrintable(TQRLabel)) do
        begin
          AutoSize := true;
          Alignment := taCenter;
          AlignToBand := True;
{$ifdef ver100}
          if SysLocale.PriLangID = LANG_JAPANESE then
            Font.Name := DefFontData.Name
          else
{$endif}
            Font.Name := 'Arial'; {<-- do not resource }
          Font.Size := 14;
          Font.Style := [fsBold];
          Caption := Title;
        end;
      end;
      if not Bands.HasPageFooter then
      begin
        Bands.HasPageFooter := true;
        HadBand := false;
      end else
        HadBand := true;
      with TQRExpr(Bands.PageFooterBand.AddPrintable(TQRExpr)) do
      begin
        Alignment := taRightJustify;
        AlignToBand := true;
        Expression := '''' + SqrPage + ' '' + ' + 'PageNumber';
        if not HadBand then
          Bands.PageFooterBand.Height := round(Height * 1.5);
      end
    end
  end
end;

procedure TQRBuilder.SetActive(Value : boolean);
begin
  if Value <> FActive then
  begin
    if Value then
      BuildFramework
    else
      FReport.Free;
    FActive := Value;
  end;
end;

{ TQRListBuilder }

constructor TQRListBuilder.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FFields := TStringList.Create;
end;

destructor TQRListBuilder.Destroy;
begin
  FFields.Free;
  inherited Destroy;
end;

procedure TQRListBuilder.SetActive;
begin
  if Value <> Active then
  begin
    if Value and assigned(FDataSet) then
    begin
      inherited SetActive(true);
      BuildList;
    end else
      inherited SetActive(false);
  end;
end;

procedure TQRListBuilder.SetFields(Value : TStrings);
begin
  FFields.Assign(Value);
end;

procedure TQRListBuilder.BuildList;
var
  I : integer;
  aField : TField;
  aExpr : TQRExpr;
  aLabel : TQRLabel;
  aHeight : integer;
  HadDetail : boolean;
  HadColHead : boolean;

  procedure AddField(AField : TField);
  begin
    if not (AField is TBlobField) and
       (pos(' ', AField.FieldName) = 0) and
       (pos('/', AField.FieldName) = 0) and
       (AnsiPos('\', AField.FieldName) = 0) and
       (pos('&', AField.FieldName) = 0) and
       (pos('%', AField.FieldName) = 0) and
       (pos('-', AField.FieldName) = 0) then
    begin
      aLabel := TQRLabel(Report.Bands.ColumnHeaderBand.AddPrintable(TQRLabel));
      aHeight := aLabel.Height;
      aLabel.AutoSize := true;
      aLabel.Caption := Dup('X', aField.DisplayWidth);
      aLabel.AutoSize := false;
      aLabel.Caption := aField.DisplayName;
      aLabel.Frame.DrawBottom := true;
      aExpr := TQRExpr(Report.Bands.DetailBand.AddPrintable(TQRExpr));
      aExpr.AutoSize := false;
      aExpr.Expression := '[' + AField.FieldName + ']';
      aExpr.Left := aLabel.Left;
      aExpr.Width := aLabel.Width;
      aExpr.Alignment := aField.Alignment;
      if (aExpr.Left + aExpr.Width > Report.Bands.DetailBand.Width) and
        (Orientation = poPortrait) then
        Orientation := poLandscape;
      if aExpr.Left + aExpr.Width > Report.Bands.DetailBand.Width then
      begin
        aLabel.Free;
        aExpr.Free;
      end;
    end;
  end;

begin
  HadDetail := Report.Bands.HasDetail;
  HadColHead := Report.Bands.HasColumnHeader;
  if not HadColHead then Report.Bands.HasColumnHeader := true;
  if not HadDetail then Report.Bands.HasDetail := true;
  aHeight := round(Report.Bands.DetailBand.Height / 1.5);
  if Report is TQuickRep then TQuickRep(Report).DataSet := DataSet;
  if DataSet <> nil then
  begin
    if FFields.Count > 0 then
    begin
      for I := 0 to FFields.Count-1 do
      begin
        AField := DataSet.FieldByName(FFields[I]);
        if AField <> nil then
          AddField(AField);
      end;
    end else
    begin
      for I := 0 to DataSet.FieldCount - 1 do
      begin
        AField := DataSet.Fields[I];
        if aField.Visible then AddField(AField);
      end
    end
  end;
  if not HadDetail then Report.Bands.DetailBand.Height := round(aHeight*1.5);
  if not HadColHead then Report.Bands.ColumnHeaderBand.Height := round(aHeight*1.5);
  RenameObjects;
end;

procedure TQRListBuilder.AddAllFields;
var
  I : integer;
begin
  FFields.Clear;
  for I := 0 to DataSet.FieldCount - 1 do
    FFields.Add(DataSet.Fields[I].Name);
end;

procedure QRCreateList(var AReport : TCustomQuickRep; AOwner : TComponent;
                       aDataSet : TDataSet; ATitle : string; aFieldList : TStrings);
begin
  with TQRListBuilder.Create(AOwner) do
  try
    DataSet := aDataSet;
    Title := aTitle;
    Report := aReport;
    if aFieldList <> nil then
      Fields := aFieldList;
    Active := true;
    if Active then AReport := FetchReport;
  finally
    free;
  end;
end;


initialization
{  QRToolbarLibrary:=TQRLibrary.Create;}
  RegisterClasses([TQuickRep, TQRBand, TQRGroup, TQRSubDetail, TQRExpr, TQRShape, TTable, TQuery, TQRChildBand]);
end.

