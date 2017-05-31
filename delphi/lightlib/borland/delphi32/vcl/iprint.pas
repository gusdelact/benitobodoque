unit Iprint;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Printers, COMMDLG;

type
  TDlgPrintImage = class(TForm)
    GroupBoxMargin: TGroupBox;
    GroupBoxWhat: TGroupBox;
    GroupBoxCenter: TGroupBox;
    GroupBoxResize: TGroupBox;
    PromptMarginTop: TLabel;
    PromptMarginBottom: TLabel;
    PromptMarginLeft: TLabel;
    PromptMarginRight: TLabel;
    SleMarginTop: TEdit;
    SleMarginBottom: TEdit;
    SleMarginLeft: TEdit;
    SleMarginRight: TEdit;
    RbAll: TRadioButton;
    RbCropped: TRadioButton;
    CbVertically: TCheckBox;
    CbHorizontally: TCheckBox;
    PromptResize: TLabel;
    SleResize: TEdit;
    PostResize: TLabel;
    Print: TBitBtn;
    Setup: TBitBtn;
    Cancel: TBitBtn;
    procedure CancelClick(Sender: TObject);
    procedure SetupClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    ResHoriDpi    : Integer;
    ResVertDpi    : Integer;

    { horizontal papersize }
    SizeHoriMm    : Integer;
    SizeHoriCm    : Real;
    SizeHoriIn    : Real;
    SizeHoriPixel : Integer;

    { vertical papersize }
    SizeVertMm    : Integer;
    SizeVertCm    : Real;
    SizeVertIn    : Real;
    SizeVertPixel : Integer;

    PrinterHandle : HDC;

    fMarginTop    : real;
    fMarginBottom : real;
    fMarginLeft   : real;
    fMarginRight  : real;
    iResize       : integer;

    dlgPrint : TPRINTDLG ;
    lSetupDone : Boolean ;

  end;

var
  DlgPrintImage: TDlgPrintImage;
  OldHelpFile  : String;
implementation


{$R *.DFM}

procedure ResetDlgPrint(var PrintDlg: TPrintDlg);
begin
     if ( PrintDlg.hDevMode <> 0 ) then
     begin
          GlobalFree( PrintDlg.hDevMode  );
          PrintDlg.hDevMode := 0;
     end;

     if ( PrintDlg.hDevNames <> 0 ) then
     begin
          GlobalFree( PrintDlg.hDevNames );
	  PrintDlg.hDevNames := 0;
     end;
end;

procedure TDlgPrintImage.CancelClick(Sender: TObject);
begin
    ModalResult := -1
end;

procedure TDlgPrintImage.SetupClick(Sender: TObject);
begin

    if ( PrinterHandle <> 0 ) then
    begin
         DeleteDC( PrinterHandle );
         PrinterHandle := 0 ;
    end;

    fillchar( dlgPrint, SizeOf( dlgPrint ), 0 );

    dlgPrint.lStructSize  := SizeOf( dlgPrint );
    dlgPrint.hwndOwner    := GetActiveWindow ; { bozo ! }
    dlgPrint.Flags        := PD_RETURNDC or PD_NOSELECTION or PD_NOPAGENUMS;
    dlgPrint.nCopies      := 1;

    if ( PrintDlg( dlgPrint ) ) then
    begin
         ResetDlgPrint( dlgPrint );

         PrinterHandle := dlgPrint.hDC ;
         lSetupDone := TRUE ;
    end
    else
    begin
         { Error : Reset everything ! }
         ResetDlgPrint( dlgPrint );

         fillchar( dlgPrint, SizeOf( dlgPrint ), 0 );
         lSetupDone := FALSE ;
    end;

end;

procedure TDlgPrintImage.PrintClick(Sender: TObject);
Var
    dlgPrint : TPRINTDLG;
begin
    { get information about the printer }

    if ( lSetupDone = FALSE ) then
    begin
         { get information about the default printer }
         fillchar( dlgPrint, SizeOf( dlgPrint ), 0 );
         dlgPrint.lStructSize  := SizeOf( dlgPrint );
         dlgPrint.hwndOwner    := 0;
         dlgPrint.Flags        := PD_RETURNDC or PD_RETURNDEFAULT;

         if ( PrintDlg( dlgPrint ) ) then
              PrinterHandle := dlgPrint.hDC
         else PrinterHandle := 0;

         ResetDlgPrint( dlgPrint );
    end;

    { resolution}
    ResHoriDpi    := GetDeviceCaps( PrinterHandle, LOGPIXELSX );
    ResVertDpi    := GetDeviceCaps( PrinterHandle, LOGPIXELSY );

    { horizontal papersize }
    SizeHoriMm    := GetDeviceCaps( PrinterHandle , HORZSIZE );
    SizeHoriCm    := SizeHoriMM / 10;
    SizeHoriIn    := SizeHoriCM / 2.54;
    SizeHoriPixel := GetDeviceCaps( PrinterHandle , HORZRES );

    { vertical papersize }
    SizeVertMm    := GetDeviceCaps( PrinterHandle , VERTSIZE );
    SizeVertCm    := SizeVertMm / 10;
    SizeVertIn    := SizeVertCm / 2.54;
    SizeVertPixel := GetDeviceCaps( PrinterHandle , VERTRES );

    fMarginTop    := StrToFloat( SleMarginTop.Text );
    fMarginBottom := StrToFloat( SleMarginBottom.Text );
    fMarginLeft   := StrToFloat( SleMarginLeft.Text );
    fMarginRight  := StrToFloat( SleMarginRight.Text );
    iResize       := StrToInt( SleResize.Text );

    ModalResult := 1;
end;

procedure TDlgPrintImage.FormCreate(Sender: TObject);
begin
    OldHelpFile := Application.HelpFile;
    Application.HelpFile := 'LLIUSER.HLP';
end;

procedure TDlgPrintImage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Application.HelpFile := OldHelpFile;
end;

end.
