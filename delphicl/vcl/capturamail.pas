unit capturamail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,RegExpr, Mask;

type
  TEmail = class(TForm)
    edMail: TEdit;
    lbCorreo: TLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    lbPass: TLabel;
    lbCPass: TLabel;
    mePass: TMaskEdit;
    meCPass: TMaskEdit;
    lbMsg: TLabel;
    lbMensaje: TLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    function  GetRandomString(NumChar: cardinal): string;
    procedure btnSugerirClick(Sender: TObject);
  private
    { Private declarations }
    fmail:string;
  public
    { Public declarations }
   respEval : boolean;
   property mail:String read fmail write fmail;

  end;
Const CharMap='abcdefghijklmnopqrstuvwxyz1234567890';
var
  Email: TEmail;

implementation

{$R *.DFM}

procedure TEmail.btnAceptarClick(Sender: TObject);
var email    : String;

begin
email := edMail.Text;
respEval := ExecRegExpr('[\w\d\-\.]+@[\w\d\-]+(\.[\w\d\-]+)+', email);
if  respEval then
   Begin
//      MessageDlg('Direccion de correo Valida', mtInformation, [mbOK], 0);
      //Se procede a insertar el valor del correo con el contrao actual
      //Valida los password si van
      if mePass.Visible Then
         begin
           if trim(mepass.text) <> trim(mecpass.text) Then
              Begin
                   MessageDlg('El password y la confirmación no coinciden', mtInformation, [mbOK], 0);
                   exit;
              end;
         end;
       mail := email;
       btnAceptar.ModalResult:=mrOk;
//       close;

   end
else
   MessageDlg('No Direccion de correo Valida', mtInformation, [mbOK], 0);
end;
procedure TEmail.FormCreate(Sender: TObject);
begin
   respEval:=   false;
end;

procedure TEmail.btnCancelarClick(Sender: TObject);
begin
        respEval:=   false;
        close;
end;

function TEmail.GetRandomString(NumChar: cardinal): string;
var
  i: integer;
  MaxChar: cardinal;
begin
  randomize;
  MaxChar := length(CharMap) - 1;
  for i := 1 to NumChar do
  begin
    // Add one because CharMap is 1-based
    Result := result + CharMap[Random(maxChar) + 1];
  end;
end;
procedure TEmail.btnSugerirClick(Sender: TObject);
begin
  Randomize;
  mePass.text := GetRandomString( Random(15)+1);

end;

end.
