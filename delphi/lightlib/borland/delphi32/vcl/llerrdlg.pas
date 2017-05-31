unit Llerrdlg;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, LLO, Buttons;

type
  TDlgError = class(TForm)
    GroupBoxLocation: TGroupBox;
    PromptApplication: TLabel;
    PromptLightLib: TLabel;
    PromptAction: TLabel;
    PromptName: TLabel;
    PromptPropertyNumber: TLabel;
    PromptClass: TLabel;
    PromptParameter: TLabel;
    PromptMessage: TLabel;
    TextCalledFrom: TLabel;
    TextLightLibrary: TLabel;
    TextAction: TLabel;
    TextPropertyName: TLabel;
    TextPropertyNumber: TLabel;
    TextClass: TLabel;
    TextParameter: TLabel;
    TextMessage: TLabel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    oLLError : TLightLibError;
  public
    { Public declarations }
    procedure Init( TheError : TLightLibError );
  end;


var
  DlgError: TDlgError;

implementation

{$R *.DFM}

procedure TDlgError.Init( TheError : TLightLibError );
begin
    oLLError := TheError;

    TextCalledFrom.Caption     := oLLError.Caller;
    TextLightLibrary.Caption   := oLLError.ObjectLib;
    TextAction.Caption         := oLLError.Action;
    TextPropertyName.Caption   := oLLError.PropertyName;
    TextPropertyNumber.Caption := IntToHex( oLLError.PropertyDefine, 8 );
    TextClass.Caption          := oLLError.ObjectClass;
    TextParameter.Caption      := oLLError.PassedParameter;
    TextMessage.Caption        := oLLError.ErrorMessage;
end;

procedure TDlgError.FormCreate(Sender: TObject);
begin
    TextCalledFrom.Caption     := '';
    TextLightLibrary.Caption   := '';
    TextAction.Caption         := '';
    TextPropertyName.Caption   := '';
    TextPropertyNumber.Caption := '';
    TextClass.Caption          := '';
    TextParameter.Caption      := '';
    TextMessage.Caption        := '';
end;

procedure TDlgError.BitBtn1Click(Sender: TObject);
begin
    ModalResult := 1;
end;

end.
