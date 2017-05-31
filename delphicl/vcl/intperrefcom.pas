Unit IntPerRefCom;
//------------------------------------------------------------------------------
//  Referencias comerciales
//  Realizó  : Carlos Adrian Mejía Ledón
//  Fecha    : Noviembre 2003
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, UnGene,
  IntPerEmpre, UnRpPerRefCom, UnConKYC;

Type
  TPerRefCom= class;

  TWPerRefCom=Class(TForm)
    InterForma1             : TInterForma;
    lbID_PERSONA: TLabel;
    iedID_PERSONA: TInterEdit;
    sbPersona: TSpeedButton;
    edNOMBRE_PER: TEdit;
    qPerRefCom: TQuery;
    lbNOMBRE_PERSONA: TLabel;
    edNOMBRE: TEdit;
    lbTELEFONO: TLabel;
    edTELEFONO: TEdit;
    lbID_REF_COMERCIAL: TLabel;
    iedID_REF_COMERCIAL: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
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
    Objeto         : TPerRefCom;
    vgIdPersona    : String;
    vgIdPersRef    : String;
  end;

  TPerRefCom= class(TInterFrame)
    private
    protected
    public
      vpIdPersona              : Integer;
      ID_PERSONA               : TInterCampo;
      ID_REF_COMERCIAL         : TInterCampo;
      NOMBRE                   : TInterCampo;
      TELEFONO                 : TInterCampo;
      PER_EMPRESA              : TPerEmpre;

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
//                      CLASE TPerRefCom                        //
//**************************************************************//

constructor TPerRefCom.Create( AOwner : TComponent );
begin
  Inherited;
  ID_PERSONA                   := CreaCampo('ID_PERSONA',ftInteger,tsNinguno,tsNinguno,True);
  ID_PERSONA.Caption           := 'Persona';
  ID_REF_COMERCIAL             := CreaCampo('ID_REF_COMERCIAL',ftInteger,tsNinguno,tsNuevo,True);
  ID_REF_COMERCIAL.Caption     := 'Número de Referencia';
  NOMBRE                       := CreaCampo('NOMBRE',ftString,tsNinguno,tsNinguno,True);
  NOMBRE.Caption               := 'Nombre Referencia';
  NOMBRE.IsRequiered           := True;
  TELEFONO                     := CreaCampo('TELEFONO',ftString,tsNinguno,tsNinguno,True);
  TELEFONO.Caption             := 'Teléfono';
  TELEFONO.IsRequiered         := True;

  FKeyFields.Add('ID_PERSONA');
  FKeyFields.Add('ID_REF_COMERCIAL');
  TableName := 'PER_REF_COMERCIAL';
  UseQuery := True;
  HelpFile := 'IntPerRefCom.Hlp';
  ShowMenuReporte:=True;

  PER_EMPRESA                                := TPerEmpre.Create(Nil);
  PER_EMPRESA.MasterSource                   := Self;
  PER_EMPRESA.ID_PERSONA.MasterField         := 'ID_PERSONA';
  PER_EMPRESA.PERSONA.ID_PERSONA.MasterField := 'ID_PERSONA';
end;

destructor TPerRefCom.Destroy;
begin
  if PER_EMPRESA <> nil then PER_EMPRESA.Free;
  PER_EMPRESA := nil;
  inherited;
end;

function TPerRefCom.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWPerRefCom;
begin
  W:=TWPerRefCom.Create(Self);
  try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowBtnAyuda := False;
    W.InterForma1.ShowBtnPreview := True;
    W.qPerRefCom.DatabaseName := Apli.DataBaseName;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

function TPerRefCom.InternalBusca:Boolean;
var
  T : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IPerRefCom.it','I,S,I,S');
  if vpIdPersona <> 0 then
    T.WhereString:= 'Persona.Id_Persona = ' + intToStr(vpIdPersona);
  try
    if Active then
    begin
      T.Param(0,ID_PERSONA.AsString);
      T.Param(1,ID_REF_COMERCIAL.AsString);
    end;
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(2)]);
  finally
    T.Free;
  end;
end;

function TPerRefCom.InternalPost : Boolean;
var
  Query : TQuery;
begin
  InternalPost := False;
  if Self.Modo = moAppend then
  begin
    Query := TQuery.Create(Nil);
    try
      Query.DatabaseName := Apli.DataBaseName;
      Query.SQL.Add('SELECT NVL(MAX(ID_REF_COMERCIAL),0) + 1 AS NEXT_ID_REF_COMERCIAL '
                  + 'FROM   PER_REF_COMERCIAL '
                  + 'WHERE  ID_PERSONA = ' + ID_PERSONA.AsString);
      Query.Close;
      Query.Open;
      if not Query.IsEmpty then
      begin
        ID_REF_COMERCIAL.AsInteger := Query.FieldByName('NEXT_ID_REF_COMERCIAL').AsInteger;
        InternalPost               := inherited InternalPost;
      end
      else
      begin
        MessageBeep(0);
        InterMsg(tmError,'',0,'Error al obtener el folio de referencia comercial para el alta del registro...');
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
//                      CLASE TWPerRefCom                       //
//**************************************************************//

procedure TWPerRefCom.FormShow(Sender: TObject);
begin
  Objeto.ID_PERSONA.Control                   := iedID_PERSONA;
  Objeto.ID_REF_COMERCIAL.Control             := iedID_REF_COMERCIAL;
  Objeto.NOMBRE.Control                       := edNOMBRE;
  Objeto.TELEFONO.Control                     := edTELEFONO;
  Objeto.PER_EMPRESA.ID_PERSONA.Control       := iedID_PERSONA;
  Objeto.PER_EMPRESA.PERSONA.NOMBRE.Control   := edNOMBRE_PER;
  InterForma1.F.btNuevo.SetFocus;
end;

procedure TWPerRefCom.FormDestroy(Sender: TObject);
begin
  Objeto.ID_PERSONA.Control                   := nil;
  Objeto.ID_REF_COMERCIAL.Control             := nil;
  Objeto.NOMBRE.Control                       := nil;
  Objeto.TELEFONO.Control                     := nil;
  Objeto.PER_EMPRESA.ID_PERSONA.Control       := nil;
  Objeto.PER_EMPRESA.PERSONA.NOMBRE.Control   := nil;
end;

procedure TWPerRefCom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//**************************************************************//
//             Eventos de los componentes de la Forma           //
//**************************************************************//

//---- Exit de Persona ----//
procedure TWPerRefCom.iedID_PERSONAExit(Sender: TObject);
begin
  vgIdPersona := iedID_PERSONA.Text;
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaPersona;
end;

//---- Change de Persona ----//
procedure TWPerRefCom.iedID_PERSONAChange(Sender: TObject);
begin
  edNOMBRE_PER.Clear;
end;

//**************************************************************//
//                   Botones de Interforma                      //
//**************************************************************//

//---- Bóton Aceptar ----//
procedure TWPerRefCom.InterForma1BtnAceptar(Sender: TObject);
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
procedure TWPerRefCom.InterForma1Preview(Sender: TObject);
begin
  EXECUTE_RP_PERREFCOM(Objeto.Apli,'Ver', Objeto.vpIdPersona);
end;

//**************************************************************//
//                   Eventos de Interforma                      //
//**************************************************************//

//---- Después de Nuevo ----//
procedure TWPerRefCom.InterForma1DespuesNuevo(Sender: TObject);
begin
  if Objeto.vpIdPersona <> 0 then
  begin
    Objeto.PER_EMPRESA.FindKey([Objeto.vpIdPersona]);
    edNOMBRE.SetFocus;
  end
  else
    iedID_PERSONA.SetFocus;
end;

//**************************************************************//
//                        Buscadores                            //
//**************************************************************//

//---- Buscador de Persona ----//
procedure TWPerRefCom.sbPersonaClick(Sender: TObject);
begin
  if Objeto.PER_EMPRESA.Busca then
    iedID_REF_COMERCIAL.SetFocus;
end;

//**************************************************************//
//                       Validaciones                           //
//**************************************************************//

//---- Valida Persona ----//
function TWPerRefCom.ValidaPersona : Boolean;
var
  vlMensaje : String;
begin
  // Valida que se especifique una persona
  if Length(iedID_PERSONA.Text) <= 0 then
    vlMensaje := 'Debe especificar una persona...'
  // Valida que la persona exista
  else if not Objeto.PER_EMPRESA.FindKey([Trim(iedID_PERSONA.Text)]) then
    vlMensaje := 'La persona ' + Trim(vgIdPersona) + ' no se encontro...'
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
    edNOMBRE_PER.Clear;
  end
  else
    ValidaPersona := True;
end;

end.
