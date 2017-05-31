Unit IntPerPaisCo;
//------------------------------------------------------------------------------
//  Paises en que se tiene cobertura
//  Realizó  : Carlos Adrian Mejía Ledón
//  Fecha    : Noviembre 2003
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, UnGene,
  IntPerEmpre, IntPobIngr, UnRpPerPaisCo, UnConKYC;

Type
  TPerPaisCo= class;

  TWPerPaisCo=Class(TForm)
    InterForma1             : TInterForma;
    lbID_PERSONA: TLabel;
    iedID_PERSONA: TInterEdit;
    sbPersona: TSpeedButton;
    edNOMBRE: TEdit;
    edCVE_POBLACION: TEdit;
    qPerPaisCo: TQuery;
    edDESC_POBLACION: TEdit;
    sbPoblacion: TSpeedButton;
    lbCVE_POBLACION: TLabel;
    chbB_IMPORTA: TCheckBox;
    chbB_EXPORTA: TCheckBox;
    qPais: TQuery;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1BtnAceptar(Sender: TObject);
    procedure sbPersonaClick(Sender: TObject);
    function  ValidaPersona : Boolean;
    function  ValidaPoblacion : Boolean;
    function  ValidaPais(pPais : String) : Boolean;
    function  ValidaImpExp : Boolean;
    function  ValidaExiste : Boolean;
    procedure iedID_PERSONAExit(Sender: TObject);
    procedure iedID_PERSONAChange(Sender: TObject);
    procedure edCVE_POBLACIONExit(Sender: TObject);
    procedure edCVE_POBLACIONChange(Sender: TObject);
    procedure sbPoblacionClick(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto         : TPerPaisCo;
    vgIdPersona    : String;
    vgCvePoblacion : String;
  end;

  TPerPaisCo= class(TInterFrame)
    private
    protected
    public
      vpIdPersona              : Integer;
      ID_PERSONA               : TInterCampo;
      CVE_POBLACION            : TInterCampo;
      B_IMPORTA                : TInterCampo;
      B_EXPORTA                : TInterCampo;

      PER_EMPRESA              : TPerEmpre;
      POBLACION                : TPoblacionIngr;

      function    InternalBusca : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
  end;

implementation
{$R *.DFM}

//**************************************************************//
//                      CLASE TPerPaisCo                        //
//**************************************************************//

constructor TPerPaisCo.Create( AOwner : TComponent );
begin
  Inherited;
  ID_PERSONA            := CreaCampo('ID_PERSONA',ftInteger,tsNinguno,tsNinguno,True);
  ID_PERSONA.Caption    := 'Persona';
  CVE_POBLACION         := CreaCampo('CVE_POBLACION',ftString,tsNinguno,tsNinguno,True);
  CVE_POBLACION.Caption := 'Poblacion';
  B_IMPORTA             := CreaCampo('B_IMPORTA',ftString,tsNinguno,tsNinguno,True);
  B_IMPORTA.Caption     := 'Importa';
  B_EXPORTA             := CreaCampo('B_EXPORTA',ftString,tsNinguno,tsNinguno,True);
  B_EXPORTA.Caption     := 'Exporta';

  FKeyFields.Add('ID_PERSONA');
  FKeyFields.Add('CVE_POBLACION');
  TableName := 'PER_PAIS_COBER';
  UseQuery := True;
  HelpFile := 'IntPerPaisCo.Hlp';
  ShowMenuReporte:=True;

  PER_EMPRESA                                := TPerEmpre.Create(Nil);
  PER_EMPRESA.MasterSource                   := Self;
  PER_EMPRESA.ID_PERSONA.MasterField         := 'ID_PERSONA';
  PER_EMPRESA.PERSONA.ID_PERSONA.MasterField := 'ID_PERSONA';
  POBLACION                                  := TPoblacionIngr.Create(Self);
  POBLACION.MasterSource                     := Self;
  POBLACION.CVE_POBLACION.MasterField        := 'CVE_POBLACION';
  POBLACION.BuscaWhereString                 := 'POBLACION.CVE_TIPO_POBLAC = ''PA''';
end;

destructor TPerPaisCo.Destroy;
begin
  if PER_EMPRESA <> nil then PER_EMPRESA.Free;
  PER_EMPRESA := nil;
  if POBLACION <> nil then POBLACION.Free;
  POBLACION := nil;
  inherited;
end;

function TPerPaisCo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWPerPaisCo;
begin
  W:=TWPerPaisCo.Create(Self);
  try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowBtnAyuda := False;
    W.InterForma1.ShowBtnPreview := True;
    W.qPerPaisCo.DatabaseName := Apli.DataBaseName;
    W.qPais.DatabaseName := Apli.DataBaseName;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

function TPerPaisCo.InternalBusca:Boolean;
var
  T : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IPerPaisCo.it','I,S');
  if vpIdPersona <> 0 then
    T.WhereString:= 'Persona.Id_Persona = ' + intToStr(vpIdPersona);
  try
    if Active then
    begin
      T.Param(0,ID_PERSONA.AsString);
      T.Param(1,CVE_POBLACION.AsString);
    end;
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(2)]);
  finally
    T.Free;
  end;
end;

//**************************************************************//
//                      CLASE TWPerPaisCo                       //
//**************************************************************//

procedure TWPerPaisCo.FormShow(Sender: TObject);
begin
  Objeto.ID_PERSONA.Control                   := iedID_PERSONA;
  Objeto.CVE_POBLACION.Control                := edCVE_POBLACION;
  Objeto.B_IMPORTA.Control                    := chbB_IMPORTA;
  Objeto.B_EXPORTA.Control                    := chbB_EXPORTA;
  Objeto.PER_EMPRESA.ID_PERSONA.Control       := iedID_PERSONA;
  Objeto.PER_EMPRESA.PERSONA.NOMBRE.Control   := edNOMBRE;
  Objeto.POBLACION.CVE_POBLACION.Control      := edCVE_POBLACION;
  Objeto.POBLACION.DESC_POBLACION.Control     := edDESC_POBLACION;
  InterForma1.F.btNuevo.SetFocus;
end;

procedure TWPerPaisCo.FormDestroy(Sender: TObject);
begin
  Objeto.ID_PERSONA.Control                   := nil;
  Objeto.CVE_POBLACION.Control                := nil;
  Objeto.B_IMPORTA.Control                    := nil;
  Objeto.B_EXPORTA.Control                    := nil;
  Objeto.PER_EMPRESA.ID_PERSONA.Control       := nil;
  Objeto.PER_EMPRESA.PERSONA.NOMBRE.Control   := nil;
  Objeto.POBLACION.CVE_POBLACION.Control      := nil;
  Objeto.POBLACION.DESC_POBLACION.Control     := nil;
end;

procedure TWPerPaisCo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//**************************************************************//
//             Eventos de los componentes de la Forma           //
//**************************************************************//

//---- Exit de Persona ----//
procedure TWPerPaisCo.iedID_PERSONAExit(Sender: TObject);
begin
  vgIdPersona := iedID_PERSONA.Text;
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaPersona;
end;

//---- Change de Persona ----//
procedure TWPerPaisCo.iedID_PERSONAChange(Sender: TObject);
begin
  edNOMBRE.Clear;
end;

//---- Exit de Población ----//
procedure TWPerPaisCo.edCVE_POBLACIONExit(Sender: TObject);
begin
  vgCvePoblacion := edCVE_POBLACION.Text;
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaPoblacion;
end;

//---- Change de Población ----//
procedure TWPerPaisCo.edCVE_POBLACIONChange(Sender: TObject);
begin
  edDESC_POBLACION.Clear;
end;

//**************************************************************//
//                   Botones de Interforma                      //
//**************************************************************//

//---- Bóton Aceptar ----//
procedure TWPerPaisCo.InterForma1BtnAceptar(Sender: TObject);
var
  vlAccion : string;
begin
  vlAccion := InterForma1.F.Accion;
  // Acción Nuevo
  if vlAccion = cNuevo then
  begin
    if ValidaPersona then
      if ValidaPoblacion then
        if ValidaImpExp then
          if ValidaExiste then
            InterForma1.Aceptar;
  end;
  // Acción Modificar
  if vlAccion = cModificar then
    if ValidaImpExp then
      InterForma1.Aceptar;
end;

//---- Bóton Preview ----//
procedure TWPerPaisCo.InterForma1Preview(Sender: TObject);
begin
  EXECUTE_RP_PERPAISCO(Objeto.Apli,'Ver', Objeto.vpIdPersona);
end;

//**************************************************************//
//                   Eventos de Interforma                      //
//**************************************************************//

//---- Después de Nuevo ----//
procedure TWPerPaisCo.InterForma1DespuesNuevo(Sender: TObject);
begin
  if Objeto.vpIdPersona <> 0 then
  begin
    Objeto.PER_EMPRESA.FindKey([Objeto.vpIdPersona]);
    edCVE_POBLACION.SetFocus;
  end
  else
    iedID_PERSONA.SetFocus;
end;

//---- Después de Modificar ----//
procedure TWPerPaisCo.InterForma1DespuesModificar(Sender: TObject);
begin
  chbB_IMPORTA.SetFocus;
end;

//**************************************************************//
//                        Buscadores                            //
//**************************************************************//

//---- Buscador de Persona ----//
procedure TWPerPaisCo.sbPersonaClick(Sender: TObject);
begin
  if Objeto.PER_EMPRESA.Busca then
    edCVE_POBLACION.SetFocus;
end;

//---- Buscador de Población ----//
procedure TWPerPaisCo.sbPoblacionClick(Sender: TObject);
begin
  if Objeto.POBLACION.Busca then
    chbB_IMPORTA.SetFocus;
end;

//**************************************************************//
//                       Validaciones                           //
//**************************************************************//

//---- Valida Persona ----//
function TWPerPaisCo.ValidaPersona : Boolean;
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
    edNOMBRE.Clear;
  end
  else
    ValidaPersona := True;
end;

//---- Valida Poblacion ----//
function TWPerPaisCo.ValidaPoblacion : Boolean;
var
  vlMensaje : String;
begin
  // Valida que se especifique un pais
  if Length(edCVE_POBLACION.Text) <= 0 then
    vlMensaje := 'Debe especificar un pais...'
  // Valida que el pais exista
  else if not ValidaPais(Trim(edCVE_POBLACION.Text)) then
    vlMensaje := 'El pais ' + Trim(vgCvePoblacion) + ' no existe...'
  // Validación exitosa
  else
    vlMensaje := '';
  // Presenta Mensaje
  if vlMensaje <> '' then
  begin
    ValidaPoblacion := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,vlMensaje);
    edCVE_POBLACION.SetFocus;
    edCVE_POBLACION.Clear;
    edDESC_POBLACION.Clear;
  end
  else
  begin
    Objeto.POBLACION.FindKey([Trim(edCVE_POBLACION.Text)]);
    ValidaPoblacion := True;
  end;
end;

//---- Valida Pais ----//
function TWPerPaisCo.ValidaPais(pPais : String) : Boolean;
var
  vlMensaje : String;
begin
  with qPais do
  begin
    Close;
    ParamByName('pPais').AsString := pPais;
    Open;
    if IsEmpty then
      ValidaPais := False
    else
      ValidaPais := True;
    Close;
  end;
end;

//---- Valida Importa/Exporta ----//
function TWPerPaisCo.ValidaImpExp : Boolean;
var
  vlMensaje : String;
begin
  // Valida que se especifique al menos una de las dos (Importa o Exporta)
  if (not chbB_IMPORTA.Checked) and
     (not chbB_EXPORTA.Checked) then
    vlMensaje := 'Se debe de indicar si el país en que se tiene cobertura Importa y/o Exporta...'
  // Validación exitosa
  else
    vlMensaje := '';
  // Presenta Mensaje
  if vlMensaje <> '' then
  begin
    ValidaImpExp := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,vlMensaje);
    chbB_IMPORTA.SetFocus;
  end
  else
    ValidaImpExp := True;
end;

//---- Valida Existe ----//
function TWPerPaisCo.ValidaExiste : Boolean;
begin
  with qPerPaisCo do
  begin
    Close;
    ParamByName('pIdPersona').AsInteger   := StrToInt(iedID_PERSONA.Text);
    ParamByName('pCvePoblacion').AsString := Trim(edCVE_POBLACION.Text);
    Open;
    if not IsEmpty then
    begin
      ValidaExiste := False;
      MessageBeep(0);
      InterMsg(tmInformacion,'',0,'La persona ' + Trim(iedID_PERSONA.Text) + ' ya tiene dada de alta al pais ' + Trim(edCVE_POBLACION.Text) + '...');
      iedID_PERSONA.SetFocus;
    end
    else
      ValidaExiste := True;
    Close;
  end;
end;

end.
