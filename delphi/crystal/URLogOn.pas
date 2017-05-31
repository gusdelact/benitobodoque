unit URLogOn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TLogOnInfoDlg = class(TForm)
    pnlLogOnInfo1: TPanel;
    lblConnections: TLabel;
    pnlLogOnInfo2: TPanel;
    lblServerName: TLabel;
    lblDatabaseName: TLabel;
    lblUserID: TLabel;
    lblPassword: TLabel;
    editServerName: TEdit;
    editDatabaseName: TEdit;
    editUserID: TEdit;
    editPassword: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    lbConnections: TListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lbConnectionsClick(Sender: TObject);
    procedure editServerNameChange(Sender: TObject);
    procedure editUserIDChange(Sender: TObject);
    procedure editPasswordChange(Sender: TObject);
    procedure editDatabaseNameChange(Sender: TObject);
    procedure UpdateLogOn;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    slLogInfo      : TStringList;
    slServerName   : TStringList;
    slUserID       : TStringList;
    slPassword     : TStringList;
    slDatabaseName : TStringList;
    function GetToken(var s: string; const sDelimiter: string): string;
  end;


var
  LogOnInfoDlg: TLogOnInfoDlg;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ FormShow procedure                                                           }
{------------------------------------------------------------------------------}
procedure TLogOnInfoDlg.FormShow(Sender: TObject);
var
  cnt    : integer;
  s1, s2 : string;
begin
  slServerName := TStringList.Create;
  slUserID     := TStringList.Create;
  slPassword   := TStringList.Create;
  slDatabaseName := TStringList.Create;
  for cnt := 0 to slLogInfo.Count - 1 do
  begin
    s1 := slLogInfo[cnt];
    s2 := GetToken(s1, ';;');
    slServerName.Add(s2);
    s2 := GetToken(s1, ';;');
    slUserID.Add(s2);
    s2 := GetToken(s1, ';;');
    slDatabaseName.Add(s2);
    slPassword.Add(s1);
  end;
  UpdateLogOn;
end;
{------------------------------------------------------------------------------}
{ UpdateLogOn procedure                                                        }
{------------------------------------------------------------------------------}
procedure TLogOnInfoDlg.UpdateLogOn;
var
  cnt : smallint;
begin
  {Clear and Enable/Disable controls}
  lbConnections.Clear;
  {Update list box}
  for cnt := 0 to (slLogInfo.Count - 1) do
    lbConnections.Items.Add(IntToStr(cnt + 1));
  lbConnections.ItemIndex := 0;
  lbConnectionsClick(self);
end;
{------------------------------------------------------------------------------}
{ lbConnectionsClick procedure                                                 }
{------------------------------------------------------------------------------}
procedure TLogOnInfoDlg.lbConnectionsClick(Sender: TObject);
var
  n : integer;
begin
  {Fill in controls}
  n := lbConnections.ItemIndex;
  editServerName.Text := slServerName[n];
  editUserID.Text := slUserID[n];
  editDatabaseName.Text := slDatabaseName[n];
  editPassword.Text := slPassword[n];
end;
{------------------------------------------------------------------------------}
{ editServerNameChange procedure                                               }
{------------------------------------------------------------------------------}
procedure TLogOnInfoDlg.editServerNameChange(Sender: TObject);
begin
  slServerName[lbConnections.ItemIndex] := editServerName.Text;
end;
{------------------------------------------------------------------------------}
{ editUserIDChange procedure                                                   }
{------------------------------------------------------------------------------}
procedure TLogOnInfoDlg.editUserIDChange(Sender: TObject);
begin
  slUserID[lbConnections.ItemIndex] := editUserID.Text;
end;
{------------------------------------------------------------------------------}
{ editPasswordChange procedure                                                 }
{------------------------------------------------------------------------------}
procedure TLogOnInfoDlg.editPasswordChange(Sender: TObject);
begin
  slPassword[lbConnections.ItemIndex] := editPassword.Text;
end;
{------------------------------------------------------------------------------}
{ editDatabaseNameChange procedure                                             }
{------------------------------------------------------------------------------}
procedure TLogOnInfoDlg.editDatabaseNameChange(Sender: TObject);
begin
  slDatabaseName[lbConnections.ItemIndex] := editDatabaseName.Text;
end;
{------------------------------------------------------------------------------}
{ btnOkClick procedure                                                         }
{------------------------------------------------------------------------------}
procedure TLogOnInfoDlg.btnOkClick(Sender: TObject);
var
  cnt : integer;
begin
  for cnt := 0 to slLogInfo.Count - 1 do
  begin
    slLogInfo[cnt] := slServerName[cnt] + ';;' +
      slUserID[cnt] + ';;' + slDatabaseName[cnt] + ';;' +
      slPassword[cnt];
  end;
end;
{------------------------------------------------------------------------------}
{ GetToken function                                                            }
{------------------------------------------------------------------------------}
function TLogOnInfoDlg.GetToken(var s: string; const sDelimiter: string): string;
var
  nPos, nOfs, nLen : Byte;
  sTmp             : string;

  function IsStrEmpty(const sValue: string): boolean;
  var
    sTmp : string;
  begin
    Result := True;
    sTmp := Trim(sValue);
    if Length(sTmp) > 0 then
      Result := False;
  end; { IsStrEmpty }

begin
  {Get the position of the Delimiter}
  nPos := Pos(sDelimiter, s);
  {Get the length of the Delimiter}
  nLen := Length(sDelimiter);
  nOfs := nLen - 1;
  if (IsStrEmpty(s)) or ((nPos = 0) and (Length(s) > 0)) then
  begin
    Result := s;
    s := '';
  end
  else
  begin
    sTmp := Copy(s, 1, nPos + nOfs);
    s := Copy(s, nPos + nLen, Length(s));
    Result := Copy(sTmp, 1, Length(sTmp) - nLen);
  end;
end; { GetToken }
{------------------------------------------------------------------------------}
{ FormClose procedure                                                          }
{------------------------------------------------------------------------------}
procedure TLogOnInfoDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  slServerName.Free;
  slUserID.Free;
  slPassword.Free;
  slDatabaseName.Free;
  Release;
end;



end.
