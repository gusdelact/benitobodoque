unit DBCheckBoxList;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, CheckLst, DBCtrls, StdCtrls;

type
  TArrayString = array of string;

  TDBCheckList = class (TCheckListBox)
  private
    FValues: TStrings;
    FDataLink: TFieldDataLink;
    FSeparator: char;
    FReadOnly: boolean;
    procedure DataChange (Sender: TObject);
    procedure UpdateData (Sender: TObject);
    procedure SetDataSource(Value: TDataSource);
    function  GetDataSource: TDataSource;
    procedure SetDataField(const value : string);
    function  GetDataField : string;
    function  GetField: TField;
    procedure SetSeparator (Value: char);
    procedure SetValues (Value: TStrings);
    function GetValue: string;
    procedure SetValue (Value: string);
    procedure SetChecked (st: string);
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
  protected
    property Checked;
    property State;
    property ItemEnabled;
    property OnClickCheck;
    property Selected;
    procedure ClickCheck; override;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    property FieldValue: string read GetValue write SetValue;
    property Field: TField read getField;
  published
    property Separator: char read FSeparator write SetSeparator default '|';
    property Values: TStrings read FValues write SetValues;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DataField: string read GetDataField write SetDataField;
    property ReadOnly: boolean read FReadOnly write FReadOnly;
  end;

procedure Register;
function Split (S: string; Separator: char): TArrayString;

implementation

procedure Register;
begin
  RegisterComponents('MD-R04', [TDBCheckList]);
end;

function Split (S: string; Separator: char): TArrayString;
var
  Len, p: integer;
begin
  Len := 0;
  SetLength (result, Len);

  repeat
    p := Pos (Separator, S);

    if p > 0 then
    begin
      Inc (Len);
      SetLength (result, Len);

      result [Len - 1] := Copy (S, 1, p - 1);
      Delete (S, 1, p);
    end;
  until p = 0;

  if (S <> '') or (Len > 0) then
  begin
    Inc (Len);
    SetLength (result, Len);

    result [Len - 1] := S;
  end;
end;

constructor TDBCheckList.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);

  FSeparator             := '|';
  FReadOnly              := False;
  FValues                := TStringList.Create;
  FDataLink              := TFieldDataLink.Create;
  FDataLink.Control      := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
end;

destructor TDBCheckList.Destroy;
begin
  FreeAndNil (FDataLink);
  FreeAndNil (FValues);

  inherited Destroy;
end;

procedure TDBCheckList.DataChange(Sender: TObject);
begin
  if Assigned (FDatalink.Field) then
  begin
    if FieldValue <> FDataLink.Field.AsString then
      FieldValue := FDataLink.Field.AsString;
  end
  else
    FieldValue := '';
end;

procedure TDBCheckList.UpdateData(Sender: TObject);
begin
  if Assigned (FDataLink.Field) then
    FDataLink.Field.AsString := FieldValue;
end;

function TDBCheckList.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBCheckList.SetDataSource(Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
    FDataLink.DataSource := Value;

  if Assigned (Value) then
    Value.FreeNotification(Self);
end;

procedure TDBCheckList.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TDBCheckList.GetDataField: string;
begin
  result := FDataLink.FieldName;
end;

function TDBCheckList.GetField: TField;
begin
  result := FDataLink.field;
end;

procedure TDBCheckList.SetValues(Value: TStrings);
begin
  Values.Assign(Value);
end;

procedure TDBCheckList.SetSeparator (Value: char);
begin
  if FSeparator <> Value then
    FSeparator := Value;
end;

function TDBCheckList.GetValue: string;
var
  i: integer;
begin
  result := '';

  for i := 0 to Items.Count - 1 do
    if Checked [i] then
      result := result + FValues [i] + Separator;

  if Length (result) > 0 then
    Delete (result, Length (result), 1);
end;

procedure TDBCheckList.SetValue (Value: string);
begin
  if FieldValue <> Value then
    SetChecked (Value);
end;

procedure TDBCheckList.SetChecked (st: string);
var
  S: TArrayString;
  i, Index: integer;
begin
  if not Assigned (Parent) then exit; 

  SetLength (S, 0);
  if Assigned (FDataLink.Field) then
  begin
    S := Split (st, Separator);

    for i := 0 to Items.Count - 1 do
      State [i] := cbUnchecked;

    for i := 0 to Length (S) - 1 do
    begin
      Index := FValues.IndexOf (S [i]);

      if (Index >= 0) and (Index < Items.Count) then
        State [Index] := cbChecked;
    end;
  end
  else
    for i := 0 to Items.Count - 1 do
      State [i] := cbUnchecked;
end;

procedure TDBCheckList.ClickCheck;
begin
  if ReadOnly then
  begin
    if Assigned (FDataLink.Field) then
      SetChecked (FDataLink.Field.AsString)
    else
      SetChecked ('');
  end
  else
  begin
    if FDataLink.Edit or FDataLink.CanModify then
    begin
      FDataLink.Modified;
      FDataLink.Field.AsString := FieldValue;
    end;

    inherited ClickCheck;
  end;
  Invalidate;
end;

procedure TDBCheckList.CMEnter(var Message: TCMEnter);
begin
  // ...
  inherited;

  // ...
  FDataLink.CanModify;
end;

procedure TDBCheckList.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SetFocus;
    raise;
  end;

  inherited;
end;

end.
