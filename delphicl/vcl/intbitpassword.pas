unit IntBitPassword;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, InterEdit, IntUsuario, IntSeguMotivo,
  IntLinkit;

type
  TBitPass = class;

  TwBitPass = class(TForm)
    EdCveUsuario: TEdit;
    Usuario: TLabel;
    EdNomUsuario: TEdit;
    LbPassword: TLabel;
    EdPassword: TEdit;
    LbFechaHora: TLabel;
    EdFHRegistro: TEdit;
    LbComentario: TLabel;
    EdTxtComentario: TEdit;
    InterForma1: TInterForma;
    LbMotivo: TLabel;
    EdCveMotivo: TEdit;
    EdDescMotivo: TEdit;
    SpBtnMotivo: TSpeedButton;
    InterLinkit1: TInterLinkit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpBtnMotivoClick(Sender: TObject);
    procedure InterLinkit1Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
  private
  public
    Objeto: TBitPass;
  end;

  TBitPass = class(TInterFrame)
    private
    protected
    public
      CVE_USUARIO : TInterCampo;
      PASSWORD    : TInterCampo;
      FH_REGISTRO : TInterCampo;
      CVE_MOTIVO  : TInterCampo;
      TXT_COMENTARIO : TInterCampo;
      Usuario	  : TUsuario;
      Motivo      : TSegMotivo;
      function    InternalBusca : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
  end;

var
  wBitPass: TwBitPass;

implementation

{$R *.DFM}

constructor TBitPass.Create( AOwner : TComponent );
begin
  Inherited;
  Cve_Usuario:= CreaCampo('CVE_USUARIO',ftString,tsNinguno,tsNinguno,True);
  CVE_USUARIO .Size:=8;
  CVE_USUARIO.Caption:='Clave de Usuario';

  PASSWORD :=CreaCampo('PASSWORD',ftString,tsNinguno,tsNinguno,True);
  PASSWORD .Size:=8;
  PASSWORD.Caption:='Password';

  FH_REGISTRO :=CreaCampo('FH_REGISTRO',ftDate,tsNinguno,tsNinguno,True);
  FH_REGISTRO.Caption:='Fecha y hora del cambio';

  CVE_MOTIVO :=CreaCampo('CVE_MOTIVO',ftString,tsNinguno,tsNinguno,True);
  CVE_MOTIVO.Size:=8;
  CVE_MOTIVO.Caption:='CVE_MOTIVO';

  TXT_COMENTARIO :=CreaCampo('TXT_COMENTARIO',ftString,tsNinguno,tsNinguno,True);
  TXT_COMENTARIO.Size:=40;
  TXT_COMENTARIO.Caption:='TXT_COMENTARIO';

  Usuario := TUsuario.Create(self);
  Usuario.MasterSource := self;
  Usuario.CVE_USUARIO.MasterField := 'CVE_USUARIO';

  Motivo := TSegMotivo.Create(self);
  Motivo.MasterSource := self;
  Motivo.CVE_MOTIVO.MasterField := 'CVE_MOTIVO';

  TableName := 'SECU_BIT_PASSWRD';
  FKeyFields.Add('CVE_USUARIO');
  FKeyFields.Add('PASSWORD');
  UseQuery := True;
  HelpFile := 'InTBitPass.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TBitPass.Destroy;
begin
  inherited;
end;

function TBitPass.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TwBitPass;
begin
  W := TwBitPass.Create(Self);
  try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

Function TBitPass.InternalBusca:Boolean;
Var
  T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IntBitPassword.it','S,S');
  Try
    if Active then begin
       T.Param(0,CVE_USUARIO.AsString);
       T.Param(1,PASSWORD.AsString);
    end;
    if T.Execute then
       InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
  finally
    T.Free;
  end;
end;

procedure TwBitPass.FormShow(Sender: TObject);
begin
  Objeto.CVE_USUARIO.Control := EdCveUsuario;
  Objeto.PASSWORD.Control    := EdPassword;
  Objeto.FH_REGISTRO.Control := EdFHRegistro;
  Objeto.CVE_MOTIVO.Control     := EdCveMotivo;
  Objeto.TXT_COMENTARIO.Control := EdTxtComentario;
  Objeto.Usuario.Empleado.Persona.Nombre.Control := EdNomUsuario;
  Objeto.Motivo.DESC_MOTIVO.Control := EdDescMotivo;
end;//procedure

procedure TwBitPass.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_USUARIO.Control:=nil;
  Objeto.PASSWORD.Control:=nil;
  Objeto.FH_REGISTRO.Control := nil;
  Objeto.CVE_MOTIVO.Control     := nil;
  Objeto.TXT_COMENTARIO.Control := nil;
  Objeto.Usuario.Empleado.Persona.Nombre.Control := nil;
  Objeto.Motivo.DESC_MOTIVO.Control := nil;
end;//procedure

procedure TwBitPass.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;//procdure

procedure TwBitPass.SpBtnMotivoClick(Sender: TObject);
begin
  Objeto.Motivo.Busca;
end;

procedure TwBitPass.InterLinkit1Capture(Sender: TObject;
  var Show: Boolean);
begin
  Show := TRUE;
end;

procedure TwBitPass.InterLinkit1Ejecuta(Sender: TObject);
begin
  Objeto.Motivo.FindKey([InterLinkit1.Buffer]);
end;

procedure TwBitPass.InterForma1DespuesModificar(Sender: TObject);
begin
  if EdCveMotivo.Text <> '' then
     EdTxtComentario.SetFocus
  else
     EdCveMotivo.SetFocus;
end;//procedure

end.
