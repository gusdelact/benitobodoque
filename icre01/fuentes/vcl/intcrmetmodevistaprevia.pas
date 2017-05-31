unit IntCrMetModeVistaPrevia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, uMetComFramework, StdCtrls, ComCtrls, Buttons, IntFrm, IntFind, DB,
  DBTables;

type
  TTModeloVistaPrevia = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    EPersona: TEdit;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    AppModelo: TAppModelo;
    Panel3: TPanel;
    btnNuevo: TBitBtn;
    btnModificar: TBitBtn;
    btnActivar: TBitBtn;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    btnBuscar: TBitBtn;
    btnPersona: TBitBtn;
    EDescripcion: TEdit;
    Label3: TLabel;
    btnFechas: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure AppModeloActualizaBotones(Sender: TObject;
      BotonesActivos: TBotonesAppModelo);
    procedure btnPersonaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnFechasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MetMode: TForm;
  end;

var
  TModeloVistaPrevia: TTModeloVistaPrevia;

implementation
uses IntCrMetMode;
{$R *.DFM}

const
  coEsquema = 'SISTEMAS';
  coPaquete = 'PKGCRADMINCOMERCIAL';

procedure TTModeloVistaPrevia.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date := Trunc (Now);
end;

procedure TTModeloVistaPrevia.btnAceptarClick(Sender: TObject);
var
  Error, ID: integer;
  MsgError: string;
  Proc: TStoredProc;
begin
  if EPersona.Text = '' then exit;

  Val (EPersona.Text, ID, Error);
  if Error <> 0 then
  begin
    MessageDlg (Format ('El identificador de persona [%d] no es válido.', [ID]), mtError, [mbOk], 0);
    exit;
  end;

  //En la vista previa se desactiva la validación para verificar si la persona tiene asignado el modelo
  Proc := TStoredProc.Create (Self);
  try
    Proc.DatabaseName := (MetMode as TWCrMetModelo).Objeto.Apli.DataBaseName;
    Proc.SessionName  := (MetMode as TWCrMetModelo).Objeto.Apli.SessionName;

    Proc.Close;
    Proc.StoredProcName := coEsquema + '.' + coPaquete + '.SETVALIDAASIGNA';

    Proc.Params.Clear;
    Proc.Params.CreateParam (ftString, 'peValor', ptInput);
    Proc.ParamByName ('peValor').AsString := 'F';
    Proc.ExecProc;
  finally
    Proc.Free;
  end;

  AppModelo.IDPersona := ID;
  AppModelo.Periodo   := DateTimePicker1.Date;
  AppModelo.Aceptar (Error, MsgError);

  if Error = 0 then
    MessageDlg ('Información salvada con éxito!', mtInformation, [mbOk], 0)
  else
    MessageDlg (Format ('Se presentaron errores al salvar la información: Error (%d) "%s"', [Error, MsgError]), mtError, [mbOk], 0);
end;

procedure TTModeloVistaPrevia.btnBuscarClick(Sender: TObject);
var
  Encontrado: boolean;
  Error, ID: integer;
begin
  if EPersona.Text = '' then exit;

  Val (EPersona.Text, ID, Error);
  if Error <> 0 then
  begin
    MessageDlg (Format ('El identificador de persona [%d] no es válido.', [ID]), mtError, [mbOk], 0);
    exit;
  end;
  AppModelo.Consultar (ID, DateTimePicker1.Date, Encontrado);
  if not Encontrado then
    MessageDlg ('No existe información para la persona y fecha especificada. Favor de verificar los datos.', mtError, [mbOk], 0);
end;

procedure TTModeloVistaPrevia.AppModeloActualizaBotones(Sender: TObject;
  BotonesActivos: TBotonesAppModelo);
begin
  btnPersona.Enabled := AppModelo.Estado in [emVacio, emConsulta, emInsertado];
end;

procedure TTModeloVistaPrevia.btnPersonaClick(Sender: TObject);
var
  T: TInterFindit;
begin
  T := (MetMode as TWCrMetModelo).Objeto.CreaBuscador ('ICRPERVPREV.IT', 'F');
  try
    if AppModelo.IDPersona <> 0 then
      T.Param (0, IntToStr (AppModelo.IDPersona));

    if T.Execute then
    begin
      EPersona.Text     := T.DameCampo (0);
      EDescripcion.Text := T.DameCampo (1);
    end;
  finally
    T.Free;
  end;
end;

procedure TTModeloVistaPrevia.FormDestroy(Sender: TObject);
begin
  MetMode := nil;
end;

procedure TTModeloVistaPrevia.btnFechasClick(Sender: TObject);
var
  T: TInterFindit;
  s: string;
  y, m, d: Word;
begin
  T := (MetMode as TWCrMetModelo).Objeto.CreaBuscador ('ICRMODEAPP.IT', 'F');
  try
    T.Param (0, IntToStr (AppModelo.ModeloID));
    T.Param (1, EPersona.Text);

    if T.Execute then
    begin
      //      dd/mm/yyyy
      //      1234567890
      s := T.DameCampo (2);
      d := StrToInt (Copy (s, 1, 2));
      m := StrToInt (Copy (s, 4, 2));
      y := StrToInt (Copy (s, 7, 4));
      DateTimePicker1.DateTime := EncodeDate (y, m, d);
    end;
  finally
    T.Free;
  end;
end;

end.


