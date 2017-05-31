unit IntQRPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, QRPrntr, QR3const, ComCtrls, ToolWin, Menus,
  Spin, QuickRpt{$ifdef ver110}, ImgList{$endif};

type

  TQRCustomPreviewInterface = class(TQRPreviewInterface)
    public
      function Show(AQRPrinter : TQRPrinter)
        : TWinControl; override;
      function ShowModal(AQRPrinter : TQRPrinter)
        : TWinControl; override;
    end;

  TWIntQRPreview = class(TForm)
    Panel1: TToolBar;
    QRPreview: TQRPreview;
    Label1: TLabel;
    Label3: TLabel;
    sePage: TSpinEdit;
    seZoom: TSpinEdit;
    SaveDialogExport: TSaveDialog;
    sbFirstPage: TToolButton;
    sbPreviousPage: TToolButton;
    sbNextPage: TToolButton;
    sbLastPage: TToolButton;
    ZoomToWidth: TToolButton;
    ZoomTo100: TToolButton;
    ZoomToFit: TToolButton;
    PrintSetup: TToolButton;
    Print: TToolButton;
    BitBtnExit: TBitBtn;
    lblCopies: TLabel;
    SpinEditCopies: TSpinEdit;
    Load: TToolButton;
    Save: TToolButton;
    pnlStatus: TPanel;
    lbStatus: TLabel;
    Images: TImageList;
    procedure Init;
    procedure sePageChange(Sender: TObject);
    procedure seZoomChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRPreviewPageAvailable(Sender: TObject; PageNum: Integer);
    procedure FormCreate(Sender: TObject);
    procedure sbFirstPageClick(Sender: TObject);
    procedure sbPreviousPageClick(Sender: TObject);
    procedure sbNextPageClick(Sender: TObject);
    procedure sbLastPageClick(Sender: TObject);
    procedure ZoomToFitClick(Sender: TObject);
    procedure ZoomTo100Click(Sender: TObject);
    procedure ZoomToWidthClick(Sender: TObject);
    procedure PrintSetupClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure BitBtnExitClick(Sender: TObject);
    procedure CancelReport;
    procedure LoadClick(Sender: TObject);
    procedure QRPreviewProgressUpdate(Sender: TObject; Progress: Integer);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    //Para Delphi 3 Gauge : TQRGauge;
    LastProgress : integer;
    fQRPrinter : TQRPrinter;
    Gauge : TProgressBar;
    procedure UpdateInfo;
  public
    { Public declarations }
    pQuickreport : TCustomQuickRep;
    bPleaseInit : Boolean;
    sTitle : string;
    bCanPrint: boolean;
    constructor Create(AOwner : TComponent; AQRPrinter : TQRPrinter); virtual;
    constructor CreatePreview(AOwner : TComponent; aQRPrinter : TQRPrinter; Reporte : TCustomQuickRep); virtual;
    procedure Show;
    property QRPrinter : TQRPrinter read FQRPrinter write FQRPrinter;
  end;

  TIntQRPreview = class(TComponent)
  public
    Reporte : TCustomQuickRep;
    constructor CreatePreview(AOwner : TComponent; pReporte : TCustomQuickRep); virtual;
    procedure ShowIntQRPreview(Sender : TObject);
  end;

  procedure MakeIntQRPreview;

implementation

{$R *.DFM}

procedure MakeIntQRPreview;
begin
  RegisterPreviewClass(TQRCustomPreviewInterface);
end;

constructor TIntQRPreview.CreatePreview(AOwner : TComponent; pReporte : TCustomQuickRep);
begin
  inherited Create(AOwner);
  Reporte := pReporte;
//  Reporte.OnPreview := ShowIntQRPreview;
  Reporte.OnPreview := ShowIntQRPreview;
end;

procedure TIntQRPreview.ShowIntQRPreview(Sender : TObject);
begin
  TWIntQRPreview.CreatePreview(Application, TQRPrinter(Sender),Reporte);
end;

constructor TWIntQRPreview.CreatePreview(AOwner : TComponent; aQRPrinter : TQRPrinter; Reporte : TCustomQuickRep);
begin
  inherited Create(AOwner);
  Gauge := TProgressBar.Create(Self);
  Gauge.Parent := pnlStatus;
  Gauge.Top := 2;
  Gauge.Left := 2;
  Gauge.Height := pnlStatus.Height - 3;
  Gauge.Width := 100;

  lbStatus.Caption := 'Procesando ... ';
  Caption := '';
  QRPreview.QRPrinter := aQRPrinter;
  QRPrinter := aQRPrinter;
  pQuickreport := Reporte;
  bCanPrint := True;
  Show;
end;

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
//
//
//
//Interface
//
//
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////


function TQRCustomPreviewInterface.Show(AQRPrinter: TQRPrinter): TWinControl;
var
  frm : TWIntQRPreview;
begin
  frm := TWIntQRPreview.Create(Application, AQRPrinter);
  frm.Show;
  Result := frm;
end;

function TQRCustomPreviewInterface.ShowModal(
  AQRPrinter: TQRPrinter): TWinControl;
var
  frm : TWIntQRPreview;
begin
  frm := TWIntQRPreview.Create(Application, AQRPrinter);
  frm.ShowModal;
  Result := frm;
end;



/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
//
//
//CustomPreview
//
//
//
//////////////////////////////////////////////////////////////////////////////
//


constructor TWIntQRPreview.Create(AOwner: TComponent; AQRPrinter: TQRPrinter);
begin
  inherited Create(AOwner);
  QRPrinter := AQRPrinter;
  WindowState := wsMaximized;
  QRPreview.QRPrinter := AQRPrinter;
  if (QRPrinter <> nil) and (QRPrinter.Title <> '') then Caption := QRPrinter.Title;
  Gauge := TProgressBar.Create(Self);
  Gauge.Parent := pnlStatus;
  Gauge.Top := 2;
  Gauge.Left := 2;
  Gauge.Height := pnlStatus.Height - 3;
  Gauge.Width := 100;
//  Init;
end;

procedure TWIntQRPreview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QRPreview.QRPrinter := nil;
  Action := caFree;
end;

procedure TWIntQRPreview.UpdateInfo;
begin
  if QRPreview.QRPrinter.PageCount > 0 then
    lbStatus.Caption := 'Página ' + IntToStr(QRPreview.PageNumber) + ' de ' + IntToStr(QRPreview.QRPrinter.PageCount);
end;

procedure TWIntQRPreview.ZoomToFitClick(Sender: TObject);
begin
  Application.ProcessMessages;
  QRPreview.ZoomToFit;
  seZoom.Value:=QRPreview.Zoom;
end;

procedure TWIntQRPreview.ZoomTo100Click(Sender: TObject);
begin
  Application.ProcessMessages;
  QRPreview.Zoom:=100;
  seZoom.Value:=QRPreview.Zoom;
end;

procedure TWIntQRPreview.ZoomToWidthClick(Sender: TObject);
begin
  Application.ProcessMessages;
  QRPreview.ZoomToWidth;
  seZoom.Value:=QRPreview.Zoom;
end;

procedure TWIntQRPreview.sbFirstPageClick(Sender: TObject);
begin
  Application.ProcessMessages;
  QRPreview.PageNumber:=1;
  sePage.Value := QRPreview.PageNumber;
  UpdateInfo;
end;

procedure TWIntQRPreview.sbPreviousPageClick(Sender: TObject);
begin
  Application.ProcessMessages;
  QRPreview.PageNumber := QRPreview.PageNumber - 1;
  sePage.Value := QRPreview.PageNumber;
  UpdateInfo;
end;

procedure TWIntQRPreview.sbNextPageClick(Sender: TObject);
begin
  Application.ProcessMessages;
  QRPreview.PageNumber := QRPreview.PageNumber + 1;
  sePage.Value := QRPreview.PageNumber;
  UpdateInfo;
end;

procedure TWIntQRPreview.sbLastPageClick(Sender: TObject);
begin
  Application.ProcessMessages;
  QRPreview.PageNumber := QRPreview.QRPrinter.PageCount;
  sePage.Value := QRPreview.PageNumber;
  UpdateInfo;
end;

procedure TWIntQRPreview.PrintClick(Sender: TObject);
begin
  Print.Enabled := False;
  QRPreview.QRPrinter.Print;
  Print.Enabled := True;
end;

procedure TWIntQRPreview.BitBtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TWIntQRPreview.FormResize(Sender: TObject);
begin
  QRPreview.UpdateZoom;
end;

procedure TWIntQRPreview.Show;
begin
  inherited Show;
  UpdateInfo;
end;

procedure TWIntQRPreview.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Next : if Shift = [ssCtrl] then
                sbLastPageClick(Self)
              else
                sbNextPageClick(Self);
    VK_Prior : if Shift = [ssCtrl] then
                 sbFirstPageClick(Self)
               else
                 sbPreviousPageClick(Self);
    VK_Home : sbFirstPageClick(Self);
    VK_End : sbLastPageClick(Self);
  end;
end;

procedure TWIntQRPreview.SaveClick(Sender: TObject);
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

procedure TWIntQRPreview.PrintSetupClick(Sender: TObject);
begin
  QRPreview.QRPrinter.PrintSetup;
end;

procedure TWIntQRPreview.LoadClick(Sender: TObject);
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
      end
      else
        ShowMessage(SqrFileNotExist);
  finally
    free;
  end;
end;

procedure TWIntQRPreview.QRPreviewPageAvailable(Sender: TObject;
  PageNum: Integer);
begin
  UpdateInfo;
  sePage.MaxValue := PageNum;
  case QRPreview.QRPrinter.Status of
    mpReady: lbstatus.Caption := ' Listo. ';
    mpBusy: lbstatus.Caption := ' Procesando ... ' + lbstatus.Caption;
    mpFinished: lbstatus.Caption := ' Terminado.';
  end;
end;

procedure TWIntQRPreview.QRPreviewProgressUpdate(Sender: TObject;
  Progress: Integer);
begin
  if Progress >= LastProgress + 5 then
  begin
    Gauge.Position := Progress;
    LastProgress := Progress;
  end;
  Gauge.Visible := (Gauge.Position > 0) and (Gauge.Position < 100);
end;

///Adicionales


procedure TWIntQRPreview.sePageChange(Sender: TObject);
begin
  Application.ProcessMessages;
  if sePage.Value > 0 then
    QRPreview.PageNumber:=sePage.Value;
  UpdateInfo;
end;

procedure TWIntQRPreview.seZoomChange(Sender: TObject);
begin
  Application.ProcessMessages;
  QRPreview.Zoom:=seZoom.Value;
end;

procedure TWIntQRPreview.Init;
begin
  if bPleaseInit then
  begin
    lbStatus.Caption := 'Procesando ... ';
    Caption := '';
    LastProgress := 0;
//    sePage.MaxValue := QRPreview.QRPrinter.PageCount;
    sePage.MinValue := 1;
    sePage.Value := 1;
    UpdateInfo;
    QRPreview.ZoomToWidth;
    ZoomToWidth.Down := true;
    seZoom.Value:=QRPreview.Zoom;
    bPleaseInit := False;
  end;
end;

procedure TWIntQRPreview.FormShow(Sender: TObject);
var
  OffSet: integer;
begin
  bPleaseInit := True;
//  Init;
  if not bCanPrint then
  begin
    Print.Enabled := bCanPrint;
    Print.Visible := bCanPrint;
    PrintSetup.Enabled := Print.Enabled;
    PrintSetup.Visible := Print.Enabled;
    lblCopies.Visible := Print.Enabled;
    SpinEditCopies.Enabled := Print.Enabled;
    SpinEditCopies.Visible := Print.Enabled;

    OffSet := Load.Left - lblCopies.Left;
    Load.Left := Load.Left - Offset;
    Save.Left := Save.Left - Offset;
    BitBtnExit.Left := BitBtnExit.Left - Offset;
  end;
end;

procedure TWIntQRPreview.cmdExitClick(Sender: TObject);
begin
  Close;
end;

procedure TWIntQRPreview.FormCreate(Sender: TObject);
begin
{
  sbFirstPage.Glyph.Handle := LoadBitmap(hinstance, 'QRFIRSTPAGEBITMAP');
  sbPreviousPage.Glyph.Handle := LoadBitmap(hinstance, 'QRPREVPAGEBITMAP');
  sbNextPage.Glyph.Handle := LoadBitmap(hinstance, 'QRNEXTPAGEBITMAP');
  sbLastPage.Glyph.Handle := LoadBitmap(hinstance, 'QRLASTPAGEBITMAP');
  ZoomToFit.Glyph.Handle := LoadBitmap(hinstance, 'QRZOOMTOFITBITMAP');
  ZoomTo100.Glyph.Handle := LoadBitmap(hinstance, 'QRZOOMTO100BITMAP');
  ZoomToWidth.Glyph.Handle := LoadBitmap(hinstance, 'QRZOOMTOWIDTHBITMAP');
  PrintSetup.Glyph.Handle := LoadBitmap(hinstance, 'QRPRINTSETUPBITMAP');
  Print.Glyph.Handle := LoadBitmap(hinstance, 'QRPRINTBITMAP');
  Load.Glyph.Handle := LoadBitmap(hinstance, 'QROPENBITMAP');
  Save.Glyph.Handle := LoadBitmap(hinstance, 'QRSAVEBITMAP');
}
  WindowState := wsMaximized;
  FormStyle := fsNormal;
  bCanPrint := True;
end;


procedure TWIntQRPreview.CancelReport;
begin
  if pQuickReport.qrprinter.status = mpBusy then
    if MessageDlg('Stop this report?', mtConfirmation, mbOKCancel,0) = mrOK then
    begin
      QRPrinter.Cancel;
      QRPreview.qrprinter := nil;
    end;
end;

end.
