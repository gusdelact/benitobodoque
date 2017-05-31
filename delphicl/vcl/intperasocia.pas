Unit IntPerAsocia;
//------------------------------------------------------------------------------
//  Asociaciones a que pertenece
//  Realizó  : Carlos Adrian Mejía Ledón
//  Fecha    : Noviembre 2003
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, UnGene,
  IntPers, UnRpPerAsocia, UnConKYC;

Type
  TPerAsocia= class;

  TWPerAsocia=Class(TForm)
    InterForma1             : TInterForma;
    lbID_PERSONA: TLabel;
    lbID_PERS_ASOCIA: TLabel;
    iedID_PERSONA: TInterEdit;
    sbPersona: TSpeedButton;
    edNOMBRE: TEdit;
    edNOMBRE_PERS_ASOCIA: TEdit;
    iedID_PERS_ASOCIA: TInterEdit;
    spPersonaAsocia: TSpeedButton;
    qPerAsocia: TQuery;
    lbPCT_COMIS_INF: TLabel;
    iedPCT_PARTICIPA: TInterEdit;
    Label1: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1BtnAceptar(Sender: TObject);
    procedure sbPersonaClick(Sender: TObject);
    function  ValidaPersona : Boolean;
    function  ValidaPersonaAsocia : Boolean;
    function  ValidaPctParticipa : Boolean;
    function  ValidaExiste : Boolean;
    procedure iedID_PERSONAExit(Sender: TObject);
    procedure iedID_PERSONAChange(Sender: TObject);
    procedure spPersonaAsociaClick(Sender: TObject);
    procedure iedID_PERS_ASOCIAExit(Sender: TObject);
    procedure iedID_PERS_ASOCIAChange(Sender: TObject);
    procedure iedPCT_PARTICIPAExit(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto         : TPerAsocia;
    vgIdPersona    : String;
    vgIdPersAsocia    : String;
  end;

  TPerAsocia= class(TInterFrame)
    private
    protected
    public
      vpIdPersona              : Integer;
      ID_PERSONA               : TInterCampo;
      ID_PERS_ASOCIA           : TInterCampo;
      PCT_PARTICIPA            : TInterCampo;
      PERSONA                  : TPersona;
      PERSONA_ASOCIA           : TPersona;

      function    InternalBusca : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
  end;

implementation
{$R *.DFM}

//**************************************************************//
//                      CLASE TPerAsocia                        //
//**************************************************************//

constructor TPerAsocia.Create( AOwner : TComponent );
begin
  Inherited;
  ID_PERSONA             := CreaCampo('ID_PERSONA',ftInteger,tsNinguno,tsNinguno,True);
  ID_PERSONA.Caption     := 'Persona';
  ID_PERS_ASOCIA         := CreaCampo('ID_PERS_ASOCIA',ftInteger,tsNinguno,tsNinguno,True);
  ID_PERS_ASOCIA.Caption := 'Persona Asociada';
  PCT_PARTICIPA          := CreaCampo('PCT_PARTICIPA',ftFloat,tsNinguno,tsNinguno,True);
  PCT_PARTICIPA.Caption  := 'Porcentaje de participación';

  FKeyFields.Add('ID_PERSONA');
  FKeyFields.Add('ID_PERS_ASOCIA');
  TableName := 'PER_ASOCIACION';
  UseQuery := True;
  HelpFile := 'IntPerAsocia.Hlp';
  ShowMenuReporte:=True;

  PERSONA                               := TPersona.Create(Nil);
  PERSONA.MasterSource                  := Self;
  PERSONA.ID_PERSONA.MasterField        := 'ID_PERSONA';
  PERSONA.FilterBy                      := cPersonaMoral;
  PERSONA_ASOCIA                        := TPersona.Create(Nil);
  PERSONA_ASOCIA.MasterSource           := Self;
  PERSONA_ASOCIA.ID_PERSONA.MasterField := 'ID_PERS_ASOCIA';
  PERSONA_ASOCIA.FilterBy               := cPersonaMoral;
end;

destructor TPerAsocia.Destroy;
begin
  if PERSONA <> nil then PERSONA.Free;
  PERSONA := nil;
  if PERSONA_ASOCIA <> nil then PERSONA_ASOCIA.Free;
  PERSONA_ASOCIA := nil;
  inherited;
end;

function TPerAsocia.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWPerAsocia;
begin
  W:=TWPerAsocia.Create(Self);
  try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowBtnAyuda := False;
    W.InterForma1.ShowBtnPreview := True;
    W.qPerAsocia.DatabaseName := Apli.DataBaseName;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

function TPerAsocia.InternalBusca:Boolean;
var
  T : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IPerAsocia.it','I,S,I,S');
  if vpIdPersona <> 0 then
    T.WhereString:= 'Persona.Id_Persona = ' + intToStr(vpIdPersona);
  try
    if Active then
    begin
      T.Param(0,ID_PERSONA.AsString);
      T.Param(1,ID_PERS_ASOCIA.AsString);
    end;
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(2)]);
  finally
    T.Free;
  end;
end;

//**************************************************************//
//                      CLASE TWPerAsocia                       //
//**************************************************************//

procedure TWPerAsocia.FormShow(Sender: TObject);
begin
  Objeto.ID_PERSONA.Control                   := iedID_PERSONA;
  Objeto.ID_PERS_ASOCIA.Control               := iedID_PERS_ASOCIA;
  Objeto.PCT_PARTICIPA.Control                := iedPCT_PARTICIPA;
  Objeto.PERSONA.ID_PERSONA.Control           := iedID_PERSONA;
  Objeto.PERSONA.NOMBRE.Control               := edNOMBRE;
  Objeto.PERSONA_ASOCIA.ID_PERSONA.Control    := iedID_PERS_ASOCIA;
  Objeto.PERSONA_ASOCIA.NOMBRE.Control        := edNOMBRE_PERS_ASOCIA;
  InterForma1.F.btNuevo.SetFocus;
end;

procedure TWPerAsocia.FormDestroy(Sender: TObject);
begin
  Objeto.ID_PERSONA.Control                   := nil;
  Objeto.ID_PERS_ASOCIA.Control               := nil;
  Objeto.PCT_PARTICIPA.Control                := nil;
  Objeto.PERSONA.ID_PERSONA.Control           := nil;
  Objeto.PERSONA.NOMBRE.Control               := nil;
  Objeto.PERSONA_ASOCIA.ID_PERSONA.Control    := nil;
  Objeto.PERSONA_ASOCIA.NOMBRE.Control        := nil;
end;

procedure TWPerAsocia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//**************************************************************//
//             Eventos de los componentes de la Forma           //
//**************************************************************//

//---- Exit de Persona ----//
procedure TWPerAsocia.iedID_PERSONAExit(Sender: TObject);
begin
  vgIdPersona := iedID_PERSONA.Text;
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaPersona;
end;

//---- Change de Persona ----//
procedure TWPerAsocia.iedID_PERSONAChange(Sender: TObject);
begin
  edNOMBRE.Clear;
end;

//---- Exit de Persona Asociada ----//
procedure TWPerAsocia.iedID_PERS_ASOCIAExit(Sender: TObject);
begin
  vgIdPersAsocia := iedID_PERS_ASOCIA.Text;
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaPersonaAsocia;
end;

//---- Change de Persona Asociada ----//
procedure TWPerAsocia.iedID_PERS_ASOCIAChange(Sender: TObject);
begin
  edNOMBRE_PERS_ASOCIA.Clear;
end;

//---- Exit de Porcentaje de Participación ----//
procedure TWPerAsocia.iedPCT_PARTICIPAExit(Sender: TObject);
begin
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaPctParticipa;
end;

//**************************************************************//
//                   Botones de Interforma                      //
//**************************************************************//

//---- Bóton Aceptar ----//
procedure TWPerAsocia.InterForma1BtnAceptar(Sender: TObject);
var
  vlAccion : string;
begin
  vlAccion := InterForma1.F.Accion;
  // Acción Nuevo
  if vlAccion = cNuevo then
  begin
    if ValidaPersona then
      if ValidaPersonaAsocia then
        if ValidaPctParticipa then
          if ValidaExiste then
            InterForma1.Aceptar;
  end;
  // Acción Modificar
  if vlAccion = cModificar then
  begin
    if ValidaPctParticipa then
      InterForma1.Aceptar;
  end;
end;

//---- Bóton Preview ----//
procedure TWPerAsocia.InterForma1Preview(Sender: TObject);
begin
  EXECUTE_RP_PERASOCIA(Objeto.Apli,'Ver', Objeto.vpIdPersona);
end;

//**************************************************************//
//                   Eventos de Interforma                      //
//**************************************************************//

//---- Después de Nuevo ----//
procedure TWPerAsocia.InterForma1DespuesNuevo(Sender: TObject);
begin
  if Objeto.vpIdPersona <> 0 then
  begin
    Objeto.PERSONA.FindKey([Objeto.vpIdPersona]);
    iedID_PERS_ASOCIA.SetFocus;
  end
  else
    iedID_PERSONA.SetFocus;
end;

//---- Después de Modificar ----//
procedure TWPerAsocia.InterForma1DespuesModificar(Sender: TObject);
begin
  iedPCT_PARTICIPA.SetFocus;
end;

//**************************************************************//
//                        Buscadores                            //
//**************************************************************//

//---- Buscador de Persona ----//
procedure TWPerAsocia.sbPersonaClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('PASOC_PERSONA',True,True) Then
  Begin
    if Objeto.PERSONA.Busca then
      iedID_PERS_ASOCIA.SetFocus;
  End;
end;

//---- Buscador de Persona Referencia ----//
procedure TWPerAsocia.spPersonaAsociaClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('PASOC_PERTENECE',True,True) Then
  Begin
    if objeto.PERSONA_ASOCIA.Busca then
      iedPCT_PARTICIPA.SetFocus;
  End;
end;

//**************************************************************//
//                       Validaciones                           //
//**************************************************************//

//---- Valida Persona ----//
function TWPerAsocia.ValidaPersona : Boolean;
var
  vlMensaje : String;
begin
  // Valida que se especifique una persona
  if Length(iedID_PERSONA.Text) <= 0 then
    vlMensaje := 'Debe especificar una persona...'
  // Valida que la persona exista
  else if not Objeto.PERSONA.FindKey([Trim(iedID_PERSONA.Text)]) then
    vlMensaje := 'La persona ' + Trim(vgIdPersona) + ' no existe como Persona Moral...'
  // Valida que la personas sean diferentes
  else if Trim(iedID_PERSONA.Text) = Trim(iedID_PERS_ASOCIA.Text) then
    vlMensaje := 'La persona no puede ser asociada de ella misma...'
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

//---- Valida Persona Asociada ----//
function TWPerAsocia.ValidaPersonaAsocia : Boolean;
var
  vlMensaje : String;
begin
  // Valida que se especifique una persona
  if Length(iedID_PERS_ASOCIA.Text) <= 0 then
    vlMensaje := 'Debe especificar una persona...'
  // Valida que la persona exista
  else if not Objeto.PERSONA_ASOCIA.FindKey([Trim(iedID_PERS_ASOCIA.Text)]) then
    vlMensaje := 'La persona ' + Trim(vgIdPersAsocia) + ' no existe como Persona Moral...'
  // Valida que la personas sean diferentes
  else if Trim(iedID_PERS_ASOCIA.Text) = Trim(iedID_PERSONA.Text) then
    vlMensaje := 'La persona no puede ser asociada de ella misma...'
  // Validación exitosa
  else
    vlMensaje := '';
  // Presenta Mensaje
  if vlMensaje <> '' then
  begin
    ValidaPersonaAsocia := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,vlMensaje);
    iedID_PERS_ASOCIA.SetFocus;
    iedID_PERS_ASOCIA.Clear;
    edNOMBRE_PERS_ASOCIA.Clear;
  end
  else
    ValidaPersonaAsocia := True;
end;

//---- Valida Porcentaje de Participación ----//
function TWPerAsocia.ValidaPctParticipa : Boolean;
var
  vlMensaje : String;
begin
  if Length(iedPCT_PARTICIPA.Text) > 0 then
  begin
    // Valida que el Porcentaje de Participación sea mayor de cero
    if StrToFloat(iedPCT_PARTICIPA.Text) <= 0 then
      vlMensaje := 'El porcentaje de participación debe ser mayor a cero...'
    else
      vlMensaje := '';
    //Presenta Mensaje
    if vlMensaje <> '' then
    begin
      ValidaPctParticipa := False;
      MessageBeep(0);
      InterMsg(tmInformacion,'',0,vlMensaje);
      iedPCT_PARTICIPA.SetFocus;
      iedPCT_PARTICIPA.Clear;
    end
    else
      ValidaPctParticipa := True;
  end
  else
    ValidaPctParticipa := True;
end;

//---- Valida Existe ----//
function TWPerAsocia.ValidaExiste : Boolean;
begin
  with qPerAsocia do
  begin
    Close;
    ParamByName('pIdPersona').AsInteger    := StrToInt(iedID_PERSONA.Text);
    ParamByName('pIdPersAsocia').AsInteger := StrToInt(iedID_PERS_ASOCIA.Text);
    Open;
    if not IsEmpty then
    begin
      ValidaExiste := False;
      MessageBeep(0);
      InterMsg(tmInformacion,'',0,'La asociación entre las personas ' + Trim(iedID_PERSONA.Text) + ' y ' + Trim(iedID_PERS_ASOCIA.Text) + ' ya esta dada de alta...');
      iedID_PERSONA.SetFocus;
    end
    else
      ValidaExiste := True;
    Close;
  end;
end;

end.
