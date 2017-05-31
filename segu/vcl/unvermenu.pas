unit UnVerMenu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  InterApl;

type
  TfoVerMenu = class(TForm)
    InterApli1: TInterApli;
    procedure FormShow(Sender: TObject);
    procedure InterApli1MenuClick(Sender: TObject; var NomFuncion: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  foVerMenu: TfoVerMenu;


Procedure Executa_VerMenu(Aplicacion: String);


implementation

{$R *.DFM}

Procedure Executa_VerMenu(Aplicacion: String);
begin
	Application.CreateForm(TfoVerMenu,foVerMenu);
   foVerMenu.InterApli1.Apli:= Aplicacion;
   foVerMenu.ShowModal;
   foVerMenu.Free;
end;

procedure TfoVerMenu.FormShow(Sender: TObject);
begin InterApli1.Start(Self);
end;

procedure TfoVerMenu.InterApli1MenuClick(Sender: TObject; var NomFuncion: String);
begin IF nOMfUNCION<>'STARTAPLI' THEN ShowMessage('NomFuncion:'+NomFuncion);
end;

procedure TfoVerMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action:=caFree;
end;

end.
