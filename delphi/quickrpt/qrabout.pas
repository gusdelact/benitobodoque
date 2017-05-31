{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 3.0 for Delphi and C++Builder               ::
  ::                                                         ::
  :: QRABOUT.PAS - QuickReport About box with registration   ::
  ::                                                         ::
  :: Copyright (c) 1998 QuSoft AS                            ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.no                               ::
  ::                                                         ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }

{$I QRDEFS.INC}

unit qrabout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, OleCtrls, ShellAPI;

type
  { TQRAboutbox, About box with registration form and services }
  TQRAboutBox = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    VisitLabel: TLabel;
    Label3: TLabel;
    OrderLabel: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    Image2: TImage;
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  end;

implementation

{$R *.DFM}

uses Qr3Const;

{ TQRAboutBox }

procedure TQRAboutBox.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TQRAboutBox.FormCreate(Sender: TObject);
begin
{$ifndef EvalVersion}
  VisitLabel.Caption := SqrAboutInfo;
  OrderLabel.Caption := '';
{$endif}
  Label3.Cursor := crHandPoint;
end;

procedure TQRAboutBox.Label3Click(Sender: TObject);
const
  QuSoftPage = 'www.qusoft.com';
begin
  ShellExecute(Handle, 'open', QuSoftPage, nil, nil, SW_SHOW);
end;

end.
