{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 2.0 for Delphi 1.0/2.0/3.0                  ::
  ::                                                         ::
  :: QRPRGRESS.PAS - Foreground printing progress form       ::
  ::                                                         ::
  :: Copyright (c) 1997 QuSoft AS                            ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.no   mail: support@qusoft.no     ::
  ::                             fax: +47 22 41 74 91        ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }

unit QRPrgres;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, QRPrntr, QR3Const;

type
  TQRProgressForm = class(TForm)
    Info: TLabel;
    CancelButton: TButton;
    Gauge: TProgressBar;
    procedure CancelButtonClick(Sender: TObject);
  private
    FQRPrinter : TQRPrinter;
  protected
    procedure CMQRPROGRESSUPDATE(var Message); message CM_QRPROGRESSUPDATE;
  public
    property QRPrinter : TQRPrinter read FQRPrinter write FQRPrinter;
  end;

implementation

{$R *.DFM}

procedure TQRProgressForm.CMQRPROGRESSUPDATE(var Message);
begin
  if (FQRPrinter.Progress mod 5) = 0 then
  begin
    Gauge.Position := FQRPrinter.Progress;
    Info.Caption := IntToStr(FQRPrinter.Progress)+'% ' + SqrCompleted;
    Application.ProcessMessages;
  end;
end;

procedure TQRProgressForm.CancelButtonClick(Sender: TObject);
begin
  FQRPrinter.Cancel;
end;

end.
