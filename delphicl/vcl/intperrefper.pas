Unit IntPerRefPer;
//------------------------------------------------------------------------------
//  Referencias personales
//  Realizó  : Carlos Adrian Mejía Ledón
//  Fecha    : Noviembre 2003
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, UnGene,
  IntPers, UnRpPerRefPer, UnConKYC;

Type
  TPerRefPer= class;

  TWPerRefPer=Class(TForm)
    InterForma1             : TInterForma;
    lbID_PERSONA: TLabel;
    iedID_PERSONA: TInterEdit;
    sbPersona: TSpeedButton;
    edNOMBRE: TEdit;
    qPerRefPer: TQuery;
    lbID_REF_PERSONA: TLabel;
    iedID_REF_PERSONA: TInterEdit;
    edNOMBRE_PERSONA: TEdit;
    edAPELLIDO_PATERNO: TEdit;
    edAPELLIDO_MATERNO: TEdit;
    edTELEFONO: TEdit;
    edDOMICILIO: TEdit;
    lbAPELLIDO_PATERNO: TLabel;
    lbAPELLIDO_MATERNO: TLabel;
    lbNOMBRE_PERSONA: TLabel;
    lbTELEFONO: TLabel;
    lbDOMICILIO: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1BtnAceptar(Sender: TObject);
    procedure sbPersonaClick(Sender: TObject);
    function  ValidaPersona : Boolean;
    procedure iedID_PERSONAExit(Sender: TObject);
    procedure iedID_PERSONAChange(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto         : TPerRefPer;
    vgIdPersona    : String;
    vgIdPersRef    : String;
  end;

  TPerRefPer= class(TInterFrame)
    private
    protected
    public
      vpIdPersona              : Integer;
      ID_PERSONA               : TInterCampo;
      ID_REF_PERSONA           : TInterCampo;
      APELLIDO_PATERNO         : TInterCampo;
      APELLIDO_MATERNO         : TInterCampo;
      NOMBRE_PERSONA           : TInterCampo;
      DOMICILIO                : TInterCampo;
      TELEFONO                 : TInterCampo;
      PERSONA                  : TPersona;

      function    InternalBusca : Boolean; override;
      function    InternalPost : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
  end;

implementation
{$R *.DFM}

//**************************************************************//
//                      CLASE TPerRefPer                        //
//**************************************************************//

constructor TPerRefPer.Create( AOwner : TComponent );
begin
  Inherited;
  ID_PERSONA                   := CreaCampo('ID_PERSONA',ftInteger,tsNinguno,tsNinguno,True);
  ID_PERSONA.Caption           := 'Persona';
  ID_REF_PERSONA               := CreaCampo('ID_REF_PERSONA',ftInteger,tsNinguno,tsNuevo,True);
  ID_REF_PERSONA.Caption       := 'Número de Referencia';
  APELLIDO_PATERNO             := CreaCampo('APELLIDO_PATERNO',ftString,tsNinguno,tsNinguno,True);
  APELLIDO_PATERNO.Caption     := 'Apellido Paterno';
  APELLIDO_PATERNO.IsRequiered := True;
  APELLIDO_MATERNO             := CreaCampo('APELLIDO_MATERNO',ftString,tsNinguno,tsNinguno,True);
  APELLIDO_MATERNO.Caption     := 'Apellido Materno';
  //APELLIDO_MATERNO.IsRequiered := True;
  NOMBRE_PERSONA               := CreaCampo('NOMBRE_PERSONA',ftString,tsNinguno,tsNinguno,True);
  NOMBRE_PERSONA.Caption       := 'Nombre Persona Referencia';
  NOMBRE_PERSONA.IsRequiered   := True;
  DOMICILIO                    := CreaCampo('DOMICILIO',ftString,tsNinguno,tsNinguno,True);
  DOMICILIO.Caption            := 'Domicilio';
  //DOMICILIO.IsRequiered        := True;
  TELEFONO                     := CreaCampo('TELEFONO',ftString,tsNinguno,tsNinguno,True);
  TELEFONO.Caption             := 'Teléfono';
  TELEFONO.IsRequiered         := True;

  FKeyFields.Add('ID_PERSONA');
  FKeyFields.Add('ID_REF_PERSONA');
  TableName := 'PER_REF_PERSONA';
  UseQuery := True;
  HelpFile := 'IntPerRefPer.Hlp';
  ShowMenuReporte:=True;

  PERSONA                            := TPersona.Create(Nil);
  PERSONA.MasterSource               := Self;
  PERSONA.ID_PERSONA.MasterField     := 'ID_PERSONA';
  PERSONA.FilterBy                   := cPersonaFisica;
end;

destructor TPerRefPer.Destroy;
begin
  if PERSONA <> nil then PERSONA.Free;
  PERSONA := nil;
  inherited;
end;

function TPerRefPer.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWPerRefPer;
begin
  W:=TWPerRefPer.Create(Self);
  try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowBtnAyuda := False;
    W.InterForma1.ShowBtnPreview := True;
    W.qPerRefPer.DatabaseName := Apli.DataBaseName;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

function TPerRefPer.InternalBusca:Boolean;
var
  T : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IPerRefPer.it','I,S,I');
  if vpIdPersona <> 0 then
    T.WhereString:= 'Persona.Id_Persona = ' + intToStr(vpIdPersona);

  try
    if Active then
    begin
      T.Param(0,ID_PERSONA.AsString);
      T.Param(1,ID_REF_PERSONA.AsString);
    end;
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(2)]);
  finally
    T.Free;
  end;
end;

function TPerRefPer.InternalPost : Boolean;
var
  Query : TQuery;
begin
  InternalPost := False;
  if Self.Modo = moAppend then
  begin
    Query := TQuery.Create(Nil);
    try
      Query.DatabaseName := Apli.DataBaseName;
      Query.SQL.Add('SELECT NVL(MAX(ID_REF_PERSONA),0) + 1 AS NEXT_ID_REF_PERSONA '
                  + 'FROM   PER_REF_PERSONA '
                  + 'WHERE  ID_PERSONA = ' + ID_PERSONA.AsString);
      Query.Close;
      Query.Open;
      if not Query.IsEmpty then
      begin
        ID_REF_PERSONA.AsInteger := Query.FieldByName('NEXT_ID_REF_PERSONA').AsInteger;
        InternalPost             := inherited InternalPost;
      end
      else
      begin
        MessageBeep(0);
        InterMsg(tmError,'',0,'Error al obtener el folio de referencia de persona para el alta del registro...');
      end;
      Query.Close;
    finally
      Query.Free;
    end;
  end
  else
    InternalPost := inherited InternalPost;
end;

//**************************************************************//
//                      CLASE TWPerRefPer                       //
//**************************************************************//

procedure TWPerRefPer.FormShow(Sender: TObject);
begin
  Objeto.ID_PERSONA.Control                   := iedID_PERSONA;
  Objeto.PERSONA.ID_PERSONA.Control           := iedID_PERSONA;
  Objeto.PERSONA.NOMBRE.Control               := edNOMBRE;
  Objeto.ID_REF_PERSONA.Control               := iedID_REF_PERSONA;
  Objeto.APELLIDO_PATERNO.Control             := edAPELLIDO_PATERNO;
  Objeto.APELLIDO_MATERNO.Control             := edAPELLIDO_MATERNO;
  Objeto.NOMBRE_PERSONA.Control               := edNOMBRE_PERSONA;
  Objeto.DOMICILIO.Control                    := edDOMICILIO;
  Objeto.TELEFONO.Control                     := edTELEFONO;

  InterForma1.F.btNuevo.SetFocus;
end;

procedure TWPerRefPer.FormDestroy(Sender: TObject);
begin
  Objeto.ID_PERSONA.Control                   := nil;
  Objeto.PERSONA.ID_PERSONA.Control           := nil;
  Objeto.PERSONA.NOMBRE.Control               := nil;
  Objeto.ID_REF_PERSONA.Control               := nil;
  Objeto.APELLIDO_PATERNO.Control             := nil;
  Objeto.APELLIDO_MATERNO.Control             := nil;
  Objeto.NOMBRE_PERSONA.Control               := nil;
  Objeto.DOMICILIO.Control                    := nil;
  Objeto.TELEFONO.Control                     := nil;
end;

procedure TWPerRefPer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//**************************************************************//
//             Eventos de los componentes de la Forma           //
//**************************************************************//

//---- Exit de Persona ----//
procedure TWPerRefPer.iedID_PERSONAExit(Sender: TObject);
begin
  vgIdPersona := iedID_PERSONA.Text;
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaPersona;
end;

//---- Change de Persona ----//
procedure TWPerRefPer.iedID_PERSONAChange(Sender: TObject);
begin
  edNOMBRE.Clear;
end;

//**************************************************************//
//                   Botones de Interforma                      //
//**************************************************************//

//---- Bóton Aceptar ----//
procedure TWPerRefPer.InterForma1BtnAceptar(Sender: TObject);
var
  vlAccion : string;
begin
  vlAccion := InterForma1.F.Accion;
  // Acción Nuevo
  if vlAccion = cNuevo then
    if ValidaPersona then
      InterForma1.Aceptar;
  // Acción Modificar
  if vlAccion = cModificar then
    InterForma1.Aceptar;
end;

//---- Bóton Preview ----//
procedure TWPerRefPer.InterForma1Preview(Sender: TObject);
begin
  EXECUTE_RP_PERREFPER(Objeto.Apli,'Ver', Objeto.vpIdPersona);
end;

//**************************************************************//
//                   Eventos de Interforma                      //
//**************************************************************//

//---- Después de Nuevo ----//
procedure TWPerRefPer.InterForma1DespuesNuevo(Sender: TObject);
begin
  if Objeto.vpIdPersona <> 0 then
  begin
    Objeto.PERSONA.FindKey([Objeto.vpIdPersona]);
    edAPELLIDO_PATERNO.SetFocus;
  end
  else
    iedID_PERSONA.SetFocus;
end;

//---- Después de Modificar ----//
procedure TWPerRefPer.InterForma1DespuesModificar(Sender: TObject);
begin
  edAPELLIDO_PATERNO.SetFocus;
end;

//**************************************************************//
//                        Buscadores                            //
//**************************************************************//

//---- Buscador de Persona ----//
procedure TWPerRefPer.sbPersonaClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('REFPER_PERSONA',True,True) Then
  Begin
    if Objeto.PERSONA.Busca then
      edAPELLIDO_PATERNO.SetFocus;
  End;
end;

//**************************************************************//
//                       Validaciones                           //
//**************************************************************//

//---- Valida Persona ----//
function TWPerRefPer.ValidaPersona : Boolean;
var
  vlMensaje : String;
begin
  // Valida que se especifique una persona
  if Length(iedID_PERSONA.Text) <= 0 then
    vlMensaje := 'Debe especificar una persona...'
  // Valida que la persona exista
  else if not Objeto.PERSONA.FindKey([Trim(iedID_PERSONA.Text)]) then
    vlMensaje := 'La persona ' + Trim(vgIdPersona) + ' no existe como Persona Física...'
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

end.
