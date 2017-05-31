unit IntCgMsg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TWCgMsg = class(TForm)
    lbMensaje: TLabel;
    Animate1: TAnimate;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure ShowCgMsg(Msg : string);
  procedure HideCgMsg;

const
  WCgMsg : TWCgMsg = nil;

implementation

procedure ShowCgMsg(Msg : string);
begin
  if not Assigned(WCgMsg) then
  begin
    WCgMsg := TWCgMsg.Create(Application);
    WCgMsg.Animate1.FileName := ExtractFilePath(Application.ExeName) + 'BMPS\Hourgla3.AVI';
    WCgMsg.Animate1.Active := True;
    WCgMsg.Show;
    WCgMsg.Caption := Application.Title;
    Application.ProcessMessages;
  end;
  WCgMsg.lbMensaje.Caption := Msg;
  Application.ProcessMessages;
end;

procedure HideCgMsg;
begin
  if Assigned(WCgMsg) then
  begin
    WCgMsg.Close;
    WCgMsg.Free; WCgMsg := nil;
  end;
end;


{$R *.DFM}

procedure TWCgMsg.Timer1Timer(Sender: TObject);
begin
  Application.ProcessMessages;
end;

end.
