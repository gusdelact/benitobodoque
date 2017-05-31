Unit IntPerFueIng;
//------------------------------------------------------------------------------
//  Catálogo de Fuentes de Ingresos
//  Realizó  : Carlos Adrian Mejía Ledón
//  Fecha    : Noviembre 2003
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, UnGene, UnRpPerFueIng;

type
  TPerFueIng= class;

  TWPerFueIng=Class(TForm)
    InterForma1             : TInterForma;
    lbID_FUENTE_INGR : TLabel;
    IedID_FUENTE_INGR : TInterEdit;
    lbDESC_FUENTE_INGR : TLabel;
    edDESC_FUENTE_INGR : TEdit;
    chValidaPLD: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    function  ValidaDesc : Boolean;
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edDESC_FUENTE_INGRExit(Sender: TObject);
    procedure InterForma1BtnAceptar(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TPerFueIng;
  end;

  TPerFueIng= class(TInterFrame)
    private
    protected
    public
      ID_FUENTE_INGR           : TInterCampo;
      DESC_FUENTE_INGR         : TInterCampo;
      B_VAL_PLD                : TInterCampo;
      function    InternalBusca : Boolean; override;
      function    InternalPost : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
  end;

implementation
{$R *.DFM}

constructor TPerFueIng.Create( AOwner : TComponent );
begin
  Inherited;
  ID_FUENTE_INGR :=CreaCampo('ID_FUENTE_INGR',ftInteger,tsNinguno,tsNuevo,True);
  ID_FUENTE_INGR.Caption:='Fuente';
  DESC_FUENTE_INGR :=CreaCampo('DESC_FUENTE_INGR',ftString,tsNinguno,tsNinguno,True);
  B_VAL_PLD        :=CreaCampo('B_VAL_PLD',ftString,tsNinguno,tsNinguno,True);

  DESC_FUENTE_INGR.Caption:='Descripción';
  FKeyFields.Add('ID_FUENTE_INGR');

  TableName := 'PER_FUENTE_INGR';
  UseQuery := True;
  HelpFile := 'IntPerFueIng.Hlp';
  ShowMenuReporte:=True;
end;

destructor TPerFueIng.Destroy;
begin
  inherited;
end;

function TPerFueIng.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWPerFueIng;
begin
  W:=TWPerFueIng.Create(Self);
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

function TPerFueIng.InternalBusca:Boolean;
var
  T:TInterFindit;
begin InternalBusca := False;
  T := CreaBuscador('IPerFueIng.it','I');
  try
    if Active then
    begin
      T.Param(0,ID_FUENTE_INGR.AsString);
    end;
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;

function TPerFueIng.InternalPost : Boolean;
var
  Query : TQuery;
begin
  InternalPost := False;
  if Self.Modo = moAppend then
  begin
    Query := TQuery.Create(Nil);
    try
      Query.DatabaseName := Apli.DataBaseName;
      Query.SQL.Add('SELECT SQ01_PER_FUENTE_INGR.NEXTVAL AS NEXTVAL FROM DUAL');
      Query.Close;
      Query.Open;
      if not Query.IsEmpty then
      begin
        ID_FUENTE_INGR.AsInteger := Query.FieldByName('NEXTVAL').AsInteger;
        InternalPost             := inherited InternalPost;
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
//                     CLASE TWPERFUEING                        //
//**************************************************************//

procedure TWPerFueIng.FormShow(Sender: TObject);
begin
  Objeto.ID_FUENTE_INGR.Control:=IedID_FUENTE_INGR;
  Objeto.DESC_FUENTE_INGR.Control:=edDESC_FUENTE_INGR;
  Objeto.B_VAL_PLD.Control := chValidaPLD;
  InterForma1.F.btNuevo.SetFocus;
end;

procedure TWPerFueIng.FormDestroy(Sender: TObject);
begin
  Objeto.ID_FUENTE_INGR.Control:=nil;
  Objeto.DESC_FUENTE_INGR.Control:=nil;
  Objeto.B_VAL_PLD.Control := nil;  
end;

procedure TWPerFueIng.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//**************************************************************//
//             Eventos de los componentes de la Forma           //
//**************************************************************//

//---- Exit de Descripción ----//
procedure TWPerFueIng.edDESC_FUENTE_INGRExit(Sender: TObject);
begin
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaDesc;
end;

//**************************************************************//
//                   Botones de Interforma                      //
//**************************************************************//

//---- Bóton Aceptar ----//
procedure TWPerFueIng.InterForma1BtnAceptar(Sender: TObject);
begin
  if ValidaDesc then
    InterForma1.Aceptar;
end;

//---- Bóton Preview ----//
procedure TWPerFueIng.InterForma1Preview(Sender: TObject);
begin
  EXECUTE_RP_PERFUEING(Objeto.Apli,'Ver');
end;

//**************************************************************//
//                   Eventos de Interforma                      //
//**************************************************************//

//---- Después de Nuevo ----//
procedure TWPerFueIng.InterForma1DespuesNuevo(Sender: TObject);
begin
  edDESC_FUENTE_INGR.SetFocus;
end;

//---- Después de Modificar ----//
procedure TWPerFueIng.InterForma1DespuesModificar(Sender: TObject);
begin
  edDESC_FUENTE_INGR.SetFocus;
end;

//**************************************************************//
//                       Validaciones                           //
//**************************************************************//

//---- Valida Descripción ----//
function TWPerFueIng.ValidaDesc : Boolean;
begin
  if Length(edDESC_FUENTE_INGR.Text) <= 0 then
  begin
    ValidaDesc := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,'Debe especificar una descripción para la fuente de ingresos...');
    edDESC_FUENTE_INGR.SetFocus;
  end
  else
    ValidaDesc := True;
end;

end.
