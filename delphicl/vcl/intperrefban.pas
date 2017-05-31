Unit IntPerRefBan;
//------------------------------------------------------------------------------
//  Referencias bancarias
//  Realizó  : Carlos Adrian Mejía Ledón
//  Fecha    : Noviembre 2003
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, UnGene, UnConKYC,
  IntPers, IntInter, IntTipCuenta, UnRpPerRefBan;

Type
  TPerRefBan= class;

  TWPerRefBan=Class(TForm)
    InterForma1             : TInterForma;
    lbID_INTERMEDIARIO : TLabel;
    lbCUENTA_BANCO : TLabel;
    edCUENTA_BANCO : TEdit;
    lbID_PERSONA: TLabel;
    iedID_PERSONA: TInterEdit;
    sbPersona: TSpeedButton;
    edNOMBRE: TEdit;
    sbIntermediario: TSpeedButton;
    edNOMBRE_INTERMED: TEdit;
    qPerRefBan: TQuery;
    iedID_INTERMEDIARIO: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure iedID_PERSONAExit(Sender: TObject);
    procedure iedID_PERSONAChange(Sender: TObject);
    procedure edCUENTA_BANCOExit(Sender: TObject);
    procedure InterForma1BtnAceptar(Sender: TObject);
    procedure sbPersonaClick(Sender: TObject);
    procedure sbIntermediarioClick(Sender: TObject);
    function  ValidaPersona : Boolean;
    function  ValidaIntermediario : Boolean;
    function  ValidaCuenta : Boolean;
    function  ValidaExiste : Boolean;
    procedure iedID_INTERMEDIARIOExit(Sender: TObject);
    procedure iedID_INTERMEDIARIOChange(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
    Objeto            : TPerRefBan;
    vgIdPersona       : String;
    vgIdIntermediario : String;
  end;

  TPerRefBan = class(TInterFrame)
    private
    protected
    public
      vpIdPersona              : Integer;
      ID_PERSONA               : TInterCampo;
      ID_INTERMEDIARIO         : TInterCampo;
      CUENTA_BANCO             : TInterCampo;
      PERSONA                  : TPersona;
      INTERMEDIARIO            : TIntermed;

      function    InternalBusca : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
  end;

implementation
{$R *.DFM}

//**************************************************************//
//                      CLASE TPerRefBan                        //
//**************************************************************//

constructor TPerRefBan.Create( AOwner : TComponent );
begin
  Inherited;
  ID_PERSONA               := CreaCampo('ID_PERSONA',ftInteger,tsNinguno,tsNinguno,True);
  ID_PERSONA.Caption       := 'Persona';
  ID_INTERMEDIARIO         := CreaCampo('ID_INTERMEDIARIO',ftInteger,tsNinguno,tsNinguno,True);
  ID_INTERMEDIARIO.Caption := 'Intermediario';
  CUENTA_BANCO             := CreaCampo('CUENTA_BANCO',ftString,tsNinguno,tsNinguno,True);
  CUENTA_BANCO.Caption     := 'Cuenta';

  FKeyFields.Add('ID_PERSONA');
  FKeyFields.Add('ID_INTERMEDIARIO');
  FKeyFields.Add('CUENTA_BANCO');
  TableName := 'PER_REF_BANCARIA';
  UseQuery := True;
  HelpFile := 'IntPerRefBan.Hlp';
  ShowMenuReporte:=True;

  PERSONA                                    := TPersona.Create(Nil);
  PERSONA.MasterSource                       := Self;
  PERSONA.ID_PERSONA.MasterField             := 'ID_PERSONA';
  INTERMEDIARIO                              := TIntermed.Create(Self);
  INTERMEDIARIO.MasterSource                 := Self;
  INTERMEDIARIO.ID_INTERMEDIARIO.MasterField := 'ID_INTERMEDIARIO';
end;

destructor TPerRefBan.Destroy;
begin
  if PERSONA <> nil then PERSONA.Free;
  PERSONA := nil;
  if INTERMEDIARIO <> nil then INTERMEDIARIO.Free;
  INTERMEDIARIO := nil;
  inherited;
end;

function TPerRefBan.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWPerRefBan;
begin
  W := TWPerRefBan.Create(Self);
  try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.ShowBtnModificar := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowBtnAyuda := False;
    W.InterForma1.ShowBtnPreview := True;
    W.qPerRefBan.DatabaseName := Apli.DataBaseName;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

function TPerRefBan.InternalBusca:Boolean;
var
  T : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IPerRefBan.it','I,I,S');

  if vpIdPersona <> 0 then
    T.WhereString:= 'Persona.Id_Persona = ' + intToStr(vpIdPersona);

  try
    if Active then
    begin
      T.Param(0,ID_PERSONA.AsString);
      T.Param(2,ID_INTERMEDIARIO.AsString);
      T.Param(4,CUENTA_BANCO.AsString);
    end;
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(2),T.DameCampo(4)]);
  finally
    T.Free;
  end;
end;

//**************************************************************//
//                      CLASE TWPerRefBan                       //
//**************************************************************//

procedure TWPerRefBan.FormShow(Sender: TObject);
begin
  Objeto.ID_PERSONA.Control                     := iedID_PERSONA;
  Objeto.ID_INTERMEDIARIO.Control               := iedID_INTERMEDIARIO;
  Objeto.CUENTA_BANCO.Control                   := edCUENTA_BANCO;
  Objeto.PERSONA.ID_PERSONA.Control             := iedID_PERSONA;
  Objeto.PERSONA.NOMBRE.Control                 := edNOMBRE;
  Objeto.INTERMEDIARIO.ID_INTERMEDIARIO.Control := iedID_INTERMEDIARIO;
  Objeto.INTERMEDIARIO.PERSONA.NOMBRE.Control   := edNOMBRE_INTERMED;
  InterForma1.F.btNuevo.SetFocus;
end;

procedure TWPerRefBan.FormDestroy(Sender: TObject);
begin
  Objeto.ID_PERSONA.Control                     := nil;
  Objeto.ID_INTERMEDIARIO.Control               := nil;
  Objeto.CUENTA_BANCO.Control                   := nil;
  Objeto.PERSONA.ID_PERSONA.Control             := nil;
  Objeto.PERSONA.NOMBRE.Control                 := nil;
  Objeto.INTERMEDIARIO.ID_INTERMEDIARIO.Control := nil;
  Objeto.INTERMEDIARIO.PERSONA.NOMBRE.Control   := nil;
end;

procedure TWPerRefBan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//**************************************************************//
//             Eventos de los componentes de la Forma           //
//**************************************************************//

//---- Exit de Persona ----//
procedure TWPerRefBan.iedID_PERSONAExit(Sender: TObject);
begin
  vgIdPersona := iedID_PERSONA.Text;
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaPersona;
end;

//---- Change de Persona ----//
procedure TWPerRefBan.iedID_PERSONAChange(Sender: TObject);
begin
  edNOMBRE.Clear;
end;

//---- Exit de Intermediario ----//
procedure TWPerRefBan.iedID_INTERMEDIARIOExit(Sender: TObject);
begin
  vgIdIntermediario := iedID_INTERMEDIARIO.Text;
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaIntermediario;
end;

//---- Change de Intermediario ----//
procedure TWPerRefBan.iedID_INTERMEDIARIOChange(Sender: TObject);
begin
  edNOMBRE_INTERMED.Clear;
end;

//---- Exit de Cuenta ----//
procedure TWPerRefBan.edCUENTA_BANCOExit(Sender: TObject);
begin
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaCuenta;
end;

//**************************************************************//
//                   Botones de Interforma                      //
//**************************************************************//

//---- Bóton Aceptar ----//
procedure TWPerRefBan.InterForma1BtnAceptar(Sender: TObject);
var
  vlAccion : string;
begin
  vlAccion := InterForma1.F.Accion;
  // Acción Nuevo
  if vlAccion = cNuevo then
  begin
    if ValidaPersona then
      if ValidaIntermediario then
        if ValidaCuenta then
          if ValidaExiste then
            InterForma1.Aceptar;
  end;
end;

//---- Bóton Preview ----//
procedure TWPerRefBan.InterForma1Preview(Sender: TObject);
begin
  EXECUTE_RP_PERREFBAN(Objeto.Apli,'Ver', Objeto.vpIdPersona);
end;

//**************************************************************//
//                   Eventos de Interforma                      //
//**************************************************************//

//---- Después de Nuevo ----//
procedure TWPerRefBan.InterForma1DespuesNuevo(Sender: TObject);
begin
  if Objeto.vpIdPersona <> 0 then
  begin
    Objeto.PERSONA.FindKey([Objeto.vpIdPersona]);
    iedID_INTERMEDIARIO.SetFocus;
  end
  else
    iedID_PERSONA.SetFocus;
end;

//**************************************************************//
//                        Buscadores                            //
//**************************************************************//

//---- Buscador de Persona ----//
procedure TWPerRefBan.sbPersonaClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('REFBAN_PERSONA',True,True) Then
  Begin
    if Objeto.PERSONA.Busca then
      iedID_INTERMEDIARIO.SetFocus;
  End;
end;

//---- Buscador de Intermediario ----//
procedure TWPerRefBan.sbIntermediarioClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('REFBAN_INTERM',True,True) Then
  Begin
    if Objeto.INTERMEDIARIO.Busca then
      edCUENTA_BANCO.SetFocus;
  End;
end;

//**************************************************************//
//                       Validaciones                           //
//**************************************************************//

//---- Valida Persona ----//
function TWPerRefBan.ValidaPersona : Boolean;
var
  vlMensaje : String;
begin
  // Valida que se especifique una persona
  if Length(iedID_PERSONA.Text) <= 0 then
    vlMensaje := 'Debe especificar una persona...'
  // Valida que la persona exista
  else if not Objeto.PERSONA.FindKey([Trim(iedID_PERSONA.Text)]) then
    vlMensaje := 'La persona ' + Trim(vgIdPersona) + ' no existe...'
  // Validación exitosa
  else
    vlMensaje := '';
  // Presenta Mensaje
  if vlMensaje <> '' then
  begin
    ValidaPersona := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,vlMensaje);
    iedID_PERSONA.SetFocus;
    iedID_PERSONA.Clear;
    edNOMBRE.Clear;
  end
  else
    ValidaPersona := True;
end;

//---- Valida Intermediario ----//
function TWPerRefBan.ValidaIntermediario : Boolean;
var
  vlMensaje : String;
begin
  // Valida que se especifique un intermediario
  if Length(iedID_INTERMEDIARIO.Text) <= 0 then
    vlMensaje := 'Debe especificar un intermediario...'
  // Valida que el intermediario exista
  else if not Objeto.INTERMEDIARIO.FindKey([Trim(iedID_INTERMEDIARIO.Text)]) then
    vlMensaje := 'El intermediario ' + Trim(vgIdIntermediario) + ' no existe...'
  // Validación exitosa
  else
    vlMensaje := '';
  // Presenta Mensaje
  if vlMensaje <> '' then
  begin
    ValidaIntermediario := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,vlMensaje);
    iedID_INTERMEDIARIO.SetFocus;
    iedID_INTERMEDIARIO.Clear;
    edNOMBRE_INTERMED.Clear;
  end
  else
    ValidaIntermediario := True;
end;

//---- Valida Cuenta ----//
function TWPerRefBan.ValidaCuenta : Boolean;
var
  vlMensaje : String;
begin
  // Validación que se especifique una cuenta
  if Length(edCUENTA_BANCO.Text) <= 0 then
    vlMensaje := 'Debe especificar una cuenta...'
  // Validación exitosa
  else
    vlMensaje := '';
  // Presenta Mensaje
  if vlMensaje <> '' then
  begin
    ValidaCuenta := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,vlMensaje);
    edCUENTA_BANCO.SetFocus;
    edCUENTA_BANCO.Clear;
  end
  else
    ValidaCuenta := True;
end;

//---- Valida Existe ----//
function TWPerRefBan.ValidaExiste : Boolean;
begin
  with qPerRefBan do
  begin
    Close;
    ParamByName('pIdPersona').AsInteger       := StrToInt(iedID_PERSONA.Text);
    ParamByName('pIdIntermediario').AsInteger := StrToInt(iedID_INTERMEDIARIO.Text);
    ParamByName('pCuentaBanco').AsString      := Trim(edCUENTA_BANCO.Text);
    Open;
    if not IsEmpty then
    begin
      ValidaExiste := False;
      MessageBeep(0);
      InterMsg(tmInformacion,'',0,'La persona ' + Trim(iedID_PERSONA.Text) + ' ya tiene dada de alta la cuenta '
                                + Trim(edCUENTA_BANCO.Text) + ' del intermediario ' + Trim(iedID_INTERMEDIARIO.Text) + '...');
      iedID_PERSONA.SetFocus;
    end
    else
      ValidaExiste := True;
    Close;
  end;
end;

end.
