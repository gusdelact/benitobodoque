unit Itoolbar;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls;

type
  TDlgImageToolbar = class(TForm)
    btnScan: TBitBtn;
    btnOpen: TBitBtn;
    btnSave: TBitBtn;
    btnPrint: TBitBtn;
    btnFitToWidth: TBitBtn;
    btnFitToHeight: TBitBtn;
    btnFitInWindow: TBitBtn;
    btnFitRelease: TBitBtn;
    btnRot90: TBitBtn;
    btnRot270: TBitBtn;
    btnRot180: TBitBtn;
    btnFlipHorz: TBitBtn;
    btnFlipVert: TBitBtn;
    btnCrop: TBitBtn;
    btnZoomIn: TBitBtn;
    btnZoomOut: TBitBtn;
    btnPalette: TBitBtn;
    btnImageOp: TBitBtn;
    btnInfo: TBitBtn;
    btnAbout: TBitBtn;
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    cbScan: TCheckBox;
    cbOpen: TCheckBox;
    cbSave: TCheckBox;
    cbPrint: TCheckBox;
    cbFitToWidth: TCheckBox;
    cbFitToHeight: TCheckBox;
    cbFitInWindow: TCheckBox;
    cbFitRelease: TCheckBox;
    cbRot90: TCheckBox;
    cbRot270: TCheckBox;
    cbRot180: TCheckBox;
    cbFlipHorz: TCheckBox;
    cbFlipVert: TCheckBox;
    cbCrop: TCheckBox;
    cbZoomIn: TCheckBox;
    cbZoomOut: TCheckBox;
    cbPalette: TCheckBox;
    cbImageOp: TCheckBox;
    cbInfo: TCheckBox;
    cbAbout: TCheckBox;
    Bevel1: TBevel;
    btnAll: TBitBtn;
    btnToggle: TBitBtn;
    btnCopy: TBitBtn;
    btnPaste: TBitBtn;
    btnFitBest: TBitBtn;
    cbCopy: TCheckBox;
    cbPaste: TCheckBox;
    cbFitBest: TCheckBox;
    procedure btnAllClick(Sender: TObject);
    procedure btnToggleClick(Sender: TObject);
    procedure btnScanClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnFitToWidthClick(Sender: TObject);
    procedure btnFitToHeightClick(Sender: TObject);
    procedure btnFitInWindowClick(Sender: TObject);
    procedure btnFitReleaseClick(Sender: TObject);
    procedure btnRot90Click(Sender: TObject);
    procedure btnRot270Click(Sender: TObject);
    procedure btnRot180Click(Sender: TObject);
    procedure btnCropClick(Sender: TObject);
    procedure btnZoomInClick(Sender: TObject);
    procedure btnZoomOutClick(Sender: TObject);
    procedure btnPaletteClick(Sender: TObject);
    procedure btnImageOpClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure btnFlipHorzClick(Sender: TObject);
    procedure btnFlipVertClick(Sender: TObject);
    procedure btnFitBestClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnPasteClick(Sender: TObject);

  private
    { Private declarations }
    bcheckMode : Boolean;
   public
    { Public declarations }
  end;

var
  DlgImageToolbar: TDlgImageToolbar;

implementation

{$R *.DFM}

procedure TDlgImageToolbar.btnAllClick(Sender: TObject);
begin
    bCheckMode := not bCheckMode;
    cbScan.Checked        := bcheckMode;
    cbOpen.Checked        := bcheckMode;
    cbSave.Checked        := bcheckMode;
    cbCopy.Checked        := bcheckMode;
    cbPaste.Checked       := bcheckMode;
    cbPrint.Checked       := bcheckMode;
    cbFitBest.Checked     := bcheckMode;
    cbFitToWidth.Checked  := bcheckMode;
    cbFitToHeight.Checked := bcheckMode;
    cbFitInWindow.Checked := bcheckMode;
    cbFitRelease.Checked  := bcheckMode;
    cbRot90.Checked       := bcheckMode;
    cbRot270.Checked      := bcheckMode;
    cbRot180.Checked      := bcheckMode;
    cbFlipHorz.Checked    := bcheckMode;
    cbFlipVert.Checked    := bcheckMode;
    cbCrop.Checked        := bcheckMode;
    cbZoomIn.Checked      := bcheckMode;
    cbZoomOut.Checked     := bcheckMode;
    cbPalette.Checked     := bcheckMode;
    cbImageOp.Checked     := bcheckMode;
    cbInfo.Checked        := bcheckMode;
    cbAbout.Checked       := bcheckMode;
end;


procedure TDlgImageToolbar.btnToggleClick(Sender: TObject);
begin
    cbScan.Checked        := not cbScan.Checked;
    cbOpen.Checked        := not cbOpen.Checked;
    cbSave.Checked        := not cbSave.Checked;
    cbCopy.Checked        := not cbCopy.Checked;
    cbPaste.Checked       := not cbPaste.Checked;
    cbPrint.Checked       := not cbPrint.Checked;
    cbFitBest.Checked     := not cbFitBest.Checked;
    cbFitToWidth.Checked  := not cbFitToWidth.Checked;
    cbFitToHeight.Checked := not cbFitToHeight.Checked;
    cbFitInWindow.Checked := not cbFitInWindow.Checked;
    cbFitRelease.Checked  := not cbFitRelease.Checked;
    cbRot90.Checked       := not cbRot90.Checked;
    cbRot270.Checked      := not cbRot270.Checked;
    cbRot180.Checked      := not cbRot180.Checked;
    cbFlipHorz.Checked    := not cbFlipHorz.Checked;
    cbFlipVert.Checked    := not cbFlipVert.Checked;
    cbCrop.Checked        := not cbCrop.Checked;
    cbZoomIn.Checked      := not cbZoomIn.Checked;
    cbZoomOut.Checked     := not cbZoomOut.Checked;
    cbPalette.Checked     := not cbPalette.Checked;
    cbImageOp.Checked     := not cbImageOp.Checked;
    cbInfo.Checked        := not cbInfo.Checked;
    cbAbout.Checked       := not cbAbout.Checked;
end;

procedure TDlgImageToolbar.btnScanClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbScan.Checked;
    cbScan.Checked        := bTmp;
    cbOpen.Checked        := bTmp;
    cbSave.Checked        := bTmp;
    cbPrint.Checked       := bTmp;
end;

procedure TDlgImageToolbar.btnOpenClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp :=  not cbOpen.Checked;
    cbScan.Checked        := bTmp;
    cbOpen.Checked        := bTmp;
    cbSave.Checked        := bTmp;
    cbPrint.Checked       := bTmp;
end;

procedure TDlgImageToolbar.btnSaveClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbSave.Checked;
    cbScan.Checked        := bTmp;
    cbOpen.Checked        := bTmp;
    cbSave.Checked        := bTmp;
    cbPrint.Checked       := bTmp;
end;

procedure TDlgImageToolbar.btnCopyClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbCopy.Checked;
    cbCopy.Checked         := bTmp;
    cbPaste.Checked        := bTmp;
end;

procedure TDlgImageToolbar.btnPasteClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbPaste.Checked;
    cbCopy.Checked         := bTmp;
    cbPaste.Checked        := bTmp;
end;

procedure TDlgImageToolbar.btnPrintClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp :=  not cbPrint.Checked;
    cbScan.Checked        := bTmp;
    cbOpen.Checked        := bTmp;
    cbSave.Checked        := bTmp;
    cbPrint.Checked       := bTmp;
end;

procedure TDlgImageToolbar.btnFitBestClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbFitBest.Checked;
    cbFitBest.Checked     := bTmp;
    cbFitToWidth.Checked  := bTmp;
    cbFitToHeight.Checked := bTmp;
    cbFitInWindow.Checked := bTmp;
    cbFitRelease.Checked  := bTmp;
end;

procedure TDlgImageToolbar.btnFitToWidthClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbFitToWidth.Checked;
    cbFitBest.Checked     := bTmp;
    cbFitToWidth.Checked  := bTmp;
    cbFitToHeight.Checked := bTmp;
    cbFitInWindow.Checked := bTmp;
    cbFitRelease.Checked  := bTmp;
end;

procedure TDlgImageToolbar.btnFitToHeightClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbFitToHeight.Checked;
    cbFitBest.Checked     := bTmp;
    cbFitToWidth.Checked  := bTmp;
    cbFitToHeight.Checked := bTmp;
    cbFitInWindow.Checked := bTmp;
    cbFitRelease.Checked  := bTmp;
end;

procedure TDlgImageToolbar.btnFitInWindowClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbFitInWindow.Checked;
    cbFitBest.Checked     := bTmp;
    cbFitToWidth.Checked  := bTmp;
    cbFitToHeight.Checked := bTmp;
    cbFitInWindow.Checked := bTmp;
    cbFitRelease.Checked  := bTmp;
end;

procedure TDlgImageToolbar.btnFitReleaseClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbFitRelease.Checked;
    cbFitBest.Checked     := bTmp;
    cbFitToWidth.Checked  := bTmp;
    cbFitToHeight.Checked := bTmp;
    cbFitInWindow.Checked := bTmp;
    cbFitRelease.Checked  := bTmp;
end;

procedure TDlgImageToolbar.btnRot90Click(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbRot90.Checked;
    cbRot90.Checked       := bTmp;
    cbRot270.Checked      := bTmp;
    cbRot180.Checked      := bTmp;
end;

procedure TDlgImageToolbar.btnRot270Click(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbRot270.Checked;
    cbRot90.Checked       := bTmp;
    cbRot270.Checked      := bTmp;
    cbRot180.Checked      := bTmp;
end;

procedure TDlgImageToolbar.btnRot180Click(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbRot180.Checked;
    cbRot90.Checked       := bTmp;
    cbRot270.Checked      := bTmp;
    cbRot180.Checked      := bTmp;
end;

procedure TDlgImageToolbar.btnCropClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbCrop.Checked;
    cbCrop.Checked        := bTmp;
end;

procedure TDlgImageToolbar.btnZoomInClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbZoomIn.Checked;
    cbZoomIn.Checked      := bTmp;
    cbZoomOut.Checked     := bTmp;
end;

procedure TDlgImageToolbar.btnZoomOutClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbZoomOut.Checked;
    cbZoomIn.Checked      := bTmp;
    cbZoomOut.Checked     := bTmp;
end;

procedure TDlgImageToolbar.btnPaletteClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbPalette.Checked;
    cbPalette.Checked     := bTmp;
end;

procedure TDlgImageToolbar.btnImageOpClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbImageOp.Checked;
    cbImageOp.Checked     := bTmp;
end;

procedure TDlgImageToolbar.btnInfoClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbInfo.Checked;
    cbInfo.Checked     := bTmp;
end;

procedure TDlgImageToolbar.btnAboutClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbAbout.Checked;
    cbAbout.Checked     := bTmp;
end;

procedure TDlgImageToolbar.btnFlipHorzClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbFlipHorz.Checked;
    cbFlipHorz.Checked     := bTmp;
    cbFlipVert.Checked     := bTmp;
end;

procedure TDlgImageToolbar.btnFlipVertClick(Sender: TObject);
Var
    bTmp : Boolean;
begin
    bTmp := not cbFlipVert.Checked;
    cbFlipHorz.Checked     := bTmp;
    cbFlipVert.Checked     := bTmp;
end;



end.
