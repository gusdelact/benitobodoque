{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 3.0 for Delphi and C++Builder               ::
  ::                                                         ::
  :: QRPREV.PAS - QUICKREPORT STANDARD PREVIEW FORM          ::
  ::                                                         ::
  :: Copyright (c) 1998 QuSoft AS                            ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.no                               ::
  ::                                                         ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }

{$I QRDEFS.INC}

unit QRPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, QRPrntr, QR3const, ComCtrls, ToolWin, Menus
{$ifdef ver110}, ImgList{$endif};

type
  TQRStandardPreview = class(TForm)
    StatusBar: TStatusBar;
    ToolBar1: TToolBar;
    ZoomFit: TToolButton;
    Zoom100: TToolButton;
    ZoomToWidth: TToolButton;
    Separator1: TToolButton;
    FirstPage: TToolButton;
    PreviousPage: TToolButton;
    ToolButton2: TToolButton;
    LastPage: TToolButton;
    Separator2: TToolButton;
    PrintSetup: TToolButton;
    Print: TToolButton;
    Separator3: TToolButton;
    SaveReport: TToolButton;
    LoadReport: TToolButton;
    Separator4: TToolButton;
    Images: TImageList;
    ToolButton1: TToolButton;
    ExitButton: TSpeedButton;
    QRPreview: TQRPreview;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZoomToFitClick(Sender: TObject);
    procedure ZoomTo100Click(Sender: TObject);
    procedure ZoomToWidthClick(Sender: TObject);
    procedure FirstPageClick(Sender: TObject);
    procedure PrevPageClick(Sender: TObject);
    procedure NextPageClick(Sender: TObject);
    procedure LastPageClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SaveClick(Sender: TObject);
    procedure PrintSetupClick(Sender: TObject);
    procedure LoadClick(Sender: TObject);
    procedure QRPreviewPageAvailable(Sender: TObject; PageNum: Integer);
    procedure QRPreviewProgressUpdate(Sender: TObject; Progress: Integer);
    procedure FormCreate(Sender: TObject);
  private
    FQRPrinter : TQRPrinter;
    Gauge : TProgressBar;
    LastProgress : integer;
  public
    constructor CreatePreview(AOwner : TComponent; aQRPrinter : TQRPrinter); virtual;
    procedure Show;
    procedure UpdateInfo;
    property QRPrinter : TQRPrinter read FQRPrinter write FQRPrinter;
  end;

implementation

{$R *.DFM}

constructor TQRStandardPreview.CreatePreview(AOwner : TComponent; aQRPrinter : TQRPrinter);
begin
  inherited Create(AOwner);
  QRPrinter := aQRPrinter;
  WindowState := wsMaximized;
  QRPreview.QRPrinter := aQRPrinter;
  if (QRPrinter <> nil) and (QRPrinter.Title <> '') then Caption := QRPrinter.Title;
  Gauge := TProgressBar.Create(Self);
//  Gauge.Parent := self;//
  Gauge.Top := 2;
  Gauge.Left := 2;
  Gauge.Height := 10;//
  Gauge.Width := 100;
  LastProgress := 0;
  ZoomToWidth.Down := true;
  if qrprinter.status = mpFinished then
    Print.Enabled := true;
end;

procedure TQRStandardPreview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QRPrinter.ClosePreview(Self);
  Action := caFree;
end;

procedure TQRStandardPreview.UpdateInfo;
begin
  StatusBar.Panels[1].Text := SqrPage + ' ' + IntToStr(QRPreview.PageNumber) + ' ' +
    SqrOf + ' ' + IntToStr(QRPreview.QRPrinter.PageCount);
end;

procedure TQRStandardPreview.ZoomToFitClick(Sender: TObject);
begin
  Application.ProcessMessages;
  QRPreview.ZoomToFit;
end;

procedure TQRStandardPreview.ZoomTo100Click(Sender: TObject);
begin
  Application.ProcessMessages;
  QRPreview.Zoom := 100;
end;

procedure TQRStandardPreview.ZoomToWidthClick(Sender: TObject);
begin
  Application.ProcessMessages;
  QRPreview.ZoomToWidth;
end;

procedure TQRStandardPreview.FirstPageClick(Sender: TObject);
begin
  QRPreview.PageNumber := 1;
  UpdateInfo;
end;

procedure TQRStandardPreview.PrevPageClick(Sender: TObject);
begin
  QRPreview.PageNumber := QRPreview.PageNumber - 1;
  UpdateInfo;
end;

procedure TQRStandardPreview.NextPageClick(Sender: TObject);
begin
  QRPreview.PageNumber := QRPreview.PageNumber + 1;
  UpdateInfo;
end;

procedure TQRStandardPreview.LastPageClick(Sender: TObject);
begin
  QRPreview.PageNumber := QRPrinter.PageCount;
  UpdateInfo;
end;

procedure TQRStandardPreview.PrintClick(Sender: TObject);
begin
  QRPrinter.Print;
end;

procedure TQRStandardPreview.ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TQRStandardPreview.FormResize(Sender: TObject);
begin
  QRPreview.UpdateZoom;
end;

procedure TQRStandardPreview.Show;
begin
{  QRPreview.QRPrinter.ShowingPreview:=true;}
  inherited Show;
  UpdateInfo;
end;

procedure TQRStandardPreview.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Next : if Shift = [ssCtrl] then
                LastPageClick(Self)
              else
                NextPageClick(Self);
    VK_Prior : if Shift = [ssCtrl] then
                 FirstPageClick(Self)
               else
                 PrevPageClick(Self);
    VK_Home : FirstPageClick(Self);
    VK_End : LastPageClick(Self);
    VK_Escape : ExitClick(self)
  end;
end;

procedure TQRStandardPreview.SaveClick(Sender: TObject);
var
  aExportFilter : TQRExportFilter;
{$ifndef win32}
  FileExt : string;
  I : integer;
{$endif}
begin
  aExportFilter := nil;
  with TSaveDialog.Create(Application) do
  try
    Title := SqrSaveReport;
    Filter := QRExportFilterLibrary.SaveDialogFilterString;
    DefaultExt := cQRPDefaultExt;
    if Execute then
    begin
    {$ifdef win32}
      if FilterIndex = 1 then
        QRPrinter.Save(Filename)
      else
      begin
        try
          aExportFilter := TQRExportFilterLibraryEntry(
            QRExportFilterLibrary.Filters[FilterIndex - 2]).ExportFilterClass.Create(Filename);
          QRPrinter.ExportToFilter(aExportFilter);
        finally
          aExportFilter.Free
        end
      end
    {$else}
      FileExt := ExtractFileExt(Filename);
      if copy(FileExt, 1, 1) = '.' then delete(FileExt, 1, 1);
      if (FileExt = '') or (FileExt = cQRPDefaultExt) then
        QRPrinter.Save(Filename)
      else
      begin
        for I := 0 to QRExportFilterLibrary.Filters.Count - 1 do
        begin
          if TQRExportFilterLibraryEntry(QRExportFilterLibrary.Filters[I]).Extension = FileExt then
          try
            aExportFilter := TQRExportFilterLibraryEntry(
            QRExportFilterLibrary.Filters[I]).ExportFilterClass.Create(Filename);
            QRPrinter.ExportToFilter(aExportFilter);
          finally
            aExportFilter.Free;
          end;
        end;
      end;
    {$endif}
    end;
  finally
    Free;
  end;
end;

procedure TQRStandardPreview.PrintSetupClick(Sender: TObject);
begin
  QRPrinter.PrintSetup;
end;

procedure TQRStandardPreview.LoadClick(Sender: TObject);
begin
  with TOpenDialog.Create(Application) do
  try
    Title := SqrLoadReport;
    Filter := SqrQRFile + ' (*.' +cQRPDefaultExt + ')|*.' + cqrpDefaultExt;
    if Execute then
      if FileExists(FileName) then
      begin
        QRPrinter.Load(Filename);
        QRPreview.PageNumber := 1;
        QRPreview.PreviewImage.PageNumber := 1;
        UpdateInfo;
        PrintSetup.Enabled := False;
        Print.Enabled := true;
      end
      else
        ShowMessage(SqrFileNotExist);
  finally
    free;
  end;
end;

procedure TQRStandardPreview.QRPreviewPageAvailable(Sender: TObject;
  PageNum: Integer);
begin
  UpdateInfo;
  if qrprinter.status = mpFinished then
  begin
    PrintSetup.Enabled := true;
    Print.Enabled := true;
  end;
end;

procedure TQRStandardPreview.QRPreviewProgressUpdate(Sender: TObject;
  Progress: Integer);
begin
  if Progress >= LastProgress + 5 then
  begin
    StatusBar.Panels[0].Text := IntToStr(Progress)+'%';
    LastProgress := Progress;
  end;
//  Gauge.Position := Progress;
  if (Progress = 0) or (Progress = 100) then StatusBar.Panels[0].Text := '';
end;

procedure TQRStandardPreview.FormCreate(Sender: TObject);
begin
{$ifdef win32}
   HorzScrollbar.Tracking := true;
   VertScrollbar.Tracking := true;
{$endif}
end;

end.
