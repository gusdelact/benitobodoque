unit IntGrFind;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFGrFind = class(TForm)
    edBuscar: TEdit;
    btBuscar: TButton;
    btCancela: TButton;
    procedure btCancelaClick(Sender: TObject);
    procedure btBuscarClick(Sender: TObject);
    procedure edBuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


function MuestraBusqueda : String;

implementation

{$R *.DFM}

function MuestraBusqueda : String;
var
  FGrFind : TFGrFind;
  vlTextoBuscar : String;
begin
  vlTextoBuscar := ''; 
  Try
    Application.CreateForm(TFGrFind, FGrFind);
    If Assigned(FGrFind) Then
     Begin
     FGrFind.ShowModal;
     vlTextoBuscar := FGrFind.edBuscar.Text;
     End;
  Finally
     Result := vlTextoBuscar;
  End;
end;

procedure TFGrFind.btCancelaClick(Sender: TObject);
begin
 Close;
end;

procedure TFGrFind.btBuscarClick(Sender: TObject);
begin
 Close;
end;

procedure TFGrFind.edBuscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If Key = VK_RETURN Then btBuscarClick(Self)
 Else If Key = VK_ESCAPE Then btCancelaClick(Self);
end;

end.
