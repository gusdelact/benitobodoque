Unit IntProfeOfic;
//------------------------------------------------------------------------------
//  Catálogo de Profesiones u Oficios
//  Realizó  : Carlos Adrian Mejía Ledón
//  Fecha    : Noviembre 2003
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, UnGene, UnRpProfeOfic;

Type
  TProfeOfic= class;

  TWProfeOfic=Class(TForm)
    InterForma1             : TInterForma;
    lbID_PROFESION : TLabel;
    iedID_PROFESION: TInterEdit;
    lbDESC_PROFESION : TLabel;
    edDESC_PROFESION : TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    function  ValidaDesc : Boolean;
    procedure edDESC_PROFESIONExit(Sender: TObject);
    procedure InterForma1BtnAceptar(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TProfeOfic;
  end;

  TProfeOfic= class(TInterFrame)
    private
    protected
    public
      ID_PROFESION             : TInterCampo;
      DESC_PROFESION           : TInterCampo;
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
//                      CLASE TPROFEOFIC                        //
//**************************************************************//

constructor TProfeOfic.Create( AOwner : TComponent );
begin
  Inherited;
  ID_PROFESION :=CreaCampo('ID_PROFESION',ftInteger,tsNinguno,tsNuevo,True);
  ID_PROFESION.Caption:='Profesión';
  DESC_PROFESION :=CreaCampo('DESC_PROFESION',ftString,tsNinguno,tsNinguno,True);
  DESC_PROFESION.Caption:='Descripción';
  FKeyFields.Add('ID_PROFESION');

  TableName := 'PROFESION_OFICIO';
  UseQuery := True;
  HelpFile := 'IntProfeOfic.Hlp';
  ShowMenuReporte:=True;
end;

destructor TProfeOfic.Destroy;
begin
  inherited;
end;

function TProfeOfic.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWProfeOfic;
begin
  W:=TWProfeOfic.Create(Self);
  try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowBtnAyuda := False;
    W.InterForma1.ShowBtnPreview := True;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

function TProfeOfic.InternalBusca:Boolean;
var
  T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IProfeOfic.it','I');
  try
    if Active then
    begin
      T.Param(0,ID_PROFESION.AsString);
    end;
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;

function TProfeOfic.InternalPost : Boolean;
var
  Query : TQuery;
begin
  InternalPost := False;
  if Self.Modo = moAppend then
  begin
    Query := TQuery.Create(Nil);
    try
      Query.DatabaseName := Apli.DataBaseName;
      Query.SQL.Add('SELECT SQ01_PROFESION_OFICIO.NEXTVAL AS NEXTVAL FROM DUAL');
      Query.Close;
      Query.Open;
      if not Query.IsEmpty then
      begin
        ID_PROFESION.AsInteger := Query.FieldByName('NEXTVAL').AsInteger;
        InternalPost           := inherited InternalPost;
      end
      else
      begin
        MessageBeep(0);
        InterMsg(tmError,'',0,'Error al obtener el folio para el alta del registro...');
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
//                     CLASE TWPROFEOFIC                        //
//**************************************************************//

procedure TWProfeOfic.FormShow(Sender: TObject);
begin
  Objeto.ID_PROFESION.Control:=iedID_PROFESION;
  Objeto.DESC_PROFESION.Control:=edDESC_PROFESION;
  InterForma1.F.btNuevo.SetFocus;
end;

procedure TWProfeOfic.FormDestroy(Sender: TObject);
begin
  Objeto.ID_PROFESION.Control:=nil;
  Objeto.DESC_PROFESION.Control:=nil;
end;

procedure TWProfeOfic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//**************************************************************//
//             Eventos de los componentes de la Forma           //
//**************************************************************//

//---- Exit de Descripción ----//
procedure TWProfeOfic.edDESC_PROFESIONExit(Sender: TObject);
begin
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaDesc;
end;

//**************************************************************//
//                   Botones de Interforma                      //
//**************************************************************//

//---- Bóton Aceptar ----//
procedure TWProfeOfic.InterForma1BtnAceptar(Sender: TObject);
begin
  if ValidaDesc then
    InterForma1.Aceptar;
end;

//---- Bóton Preview ----//
procedure TWProfeOfic.InterForma1Preview(Sender: TObject);
begin
  EXECUTE_RP_PROFEOFIC(Objeto.Apli,'Ver');
end;

//**************************************************************//
//                   Eventos de Interforma                      //
//**************************************************************//

//---- Después de Nuevo ----//
procedure TWProfeOfic.InterForma1DespuesNuevo(Sender: TObject);
begin
  edDESC_PROFESION.SetFocus;
end;

//---- Después de Modificar ----//
procedure TWProfeOfic.InterForma1DespuesModificar(Sender: TObject);
begin
  edDESC_PROFESION.SetFocus;
end;

//**************************************************************//
//                       Validaciones                           //
//**************************************************************//

//---- Valida Descripción ----//
function TWProfeOfic.ValidaDesc : Boolean;
begin
  if Length(edDESC_PROFESION.Text) <= 0 then
  begin
    ValidaDesc := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,'Debe especificar una descripción para la profesión u oficio...');
    edDESC_PROFESION.SetFocus;
  end
  else
    ValidaDesc := True;
end;

end.
