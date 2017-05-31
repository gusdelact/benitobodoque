unit IntValidPwd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, IntPass, InterApl, Db, dbTables, IntGenCre;

type
  TWValidPwd = class(TForm)
    btnAceptar: TButton;
    btnCancelar: TButton;
    GroupBox1: TGroupBox;
    edPASSWORD: TMaskEdit;
    edCVE_USUARIO: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edCVE_USUARIOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Apli : TInterApli;
    vgModalResult : TModalResult;
  end;

var
  WValidPwd: TWValidPwd;

function ValidaPassword(peCVE_USUARIO : String; peApli : TInterApli) : TModalResult;

implementation

{$R *.DFM}

function ValidaPassword(peCVE_USUARIO : String; peApli : TInterApli) : TModalResult;
var WValidPwd : TWValidPwd;
begin
 Result := mrCancel;
 Application.CreateForm(TWValidPwd, WValidPwd);
 If Assigned(WValidPwd) Then
  With WValidPwd Do
   Try
    WValidPwd.vgModalResult := mrCancel;
    WValidPwd.Apli := peApli;
    WValidPwd.edCVE_USUARIO.Text := peCVE_USUARIO;
    ShowModal;
    Result := vgModalResult;
   Finally
    WValidPwd.Free;
   End;
end;

procedure TWValidPwd.btnAceptarClick(Sender: TObject);

   function UsuarioValido(vlCVE_USUARIO, vlPASSWORD : String) : Boolean;
   var stpEncPass : TStoredProc;
   begin
     stpEncPass := TStoredProc.Create(Nil);
     Result := False;
     If Assigned(stpEncPass) Then
     With stpEncPass Do
      Try
       DatabaseName := Apli.DatabaseName;
       SessionName  := Apli.SessionName;
       StoredProcName := 'PKGSEGURIDAD.STPENCPASS';

       Params.Clear;
       Params.CreateParam(ftString,'peCveUsuario',ptInput);
       Params.CreateParam(ftString,'pePassword',  ptInput);
       Params.CreateParam(ftString,'peCveEvento', ptInput);
       Params.CreateParam(ftString,'psResultado', ptOutput);
       Params.CreateParam(ftString,'psTxtResultado',ptOutput);
       ParamByName('peCveUsuario').AsString := vlCVE_USUARIO;
       ParamByName('pePassword').AsString   := vlPASSWORD;
       ParamByName('peCveEvento').AsString  := 'V';
       ExecProc;

       If (ParamByName('psResultado').AsString = CVERDAD) Then
        Result := True;
      Finally
       stpEncPass.Params.Clear;
       stpEncPass.Free;
      End;
   end;

var vlCVE_USUARIO, vlPASSWORD : String;
begin
 vlCVE_USUARIO := Trim(edCVE_USUARIO.Text);
 vlPASSWORD := Trim(edPASSWORD.Text);
 If (vlCVE_USUARIO = '') Then
  Begin
  MessageDlg('Debe de indicar el usuario, para poder continuar.', mtError, [mbOk], 0);
  If (edCVE_USUARIO.CanFocus) Then edCVE_USUARIO.SetFocus;
  End
 Else If (vlPASSWORD = '') Then
    Begin
    MessageDlg('Debe de indicar el password, para poder continuar.', mtError, [mbOk], 0);
    If (edPASSWORD.CanFocus) Then edPASSWORD.SetFocus;
    End
   Else
     Begin
     If (Apli.Usuario <> vlCVE_USUARIO) Then
       Begin
       MessageDlg('Usuario No Válido.', mtError, [mbOk], 0);
       If (edCVE_USUARIO.CanFocus) Then edCVE_USUARIO.SetFocus;
       End
     Else
       If UsuarioValido(vlCVE_USUARIO, vlPASSWORD) Then
        Begin
        vgModalResult := mrYes;
        Close;
        End
       Else
        Begin
        MessageDlg('El password es incorrecto, intente nuevamente.', mtError, [mbOk], 0);
        If (edPASSWORD.CanFocus) Then edPASSWORD.SetFocus;
        End;
     End;
end;

procedure TWValidPwd.btnCancelarClick(Sender: TObject);
begin
 Close;
end;

procedure TWValidPwd.edCVE_USUARIOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If (Key = VK_RETURN) Then btnAceptarClick(Self);
end;

end.
