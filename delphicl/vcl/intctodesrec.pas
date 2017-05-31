Unit IntCtoDesRec;
//------------------------------------------------------------------------------
//  Catálogo de Destinos de Recursos
//  Realizó  : Carlos Adrian Mejía Ledón
//  Fecha    : Noviembre 2003
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, UnGene, UnRpCtoDesRec;

type
  TCtoDesRec= class;

  TWCtoDesRec=Class(TForm)
    InterForma1             : TInterForma;
    lbID_DESTINO_REC : TLabel;
    IedID_DESTINO_REC : TInterEdit;
    lbDESC_DESTINO_REC : TLabel;
    edDESC_DESTINO_REC : TEdit;
    cbBValPLD: TCheckBox;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    iedPtosRiesgoPF: TInterEdit;
    iedPtosRiesgoPM: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    { Eventos de los componentes de la Forma }
    procedure edDESC_DESTINO_RECExit(Sender: TObject);
    { Botones de InterForma }
    procedure InterForma1BtnAceptar(Sender: TObject);
    { Eventos de InterForma }
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    { Validaciones }
    function  ValidaDesc : Boolean;
    procedure InterForma1Preview(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCtoDesRec;
  end;

  TCtoDesRec= class(TInterFrame)
    private
    protected
    public
      ID_DESTINO_REC          : TInterCampo;
      DESC_DESTINO_REC        : TInterCampo;
      B_VAL_PLD               : TInterCampo; // CZR 25-mar-2013
      NUM_PUNTOS_RIESGO_PF    : TInterCampo; // Luis Hernandez Mar 2016
      NUM_PUNTOS_RIESGO_PM    : TInterCampo;

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
//                      CLASE TCTODESREC                        //
//**************************************************************//

constructor TCtoDesRec.Create( AOwner : TComponent );
begin
   Inherited;

   ID_DESTINO_REC           := CreaCampo('ID_DESTINO_REC',      ftFloat,    tsNinguno, tsNuevo,   True);
   ID_DESTINO_REC.Caption   := 'Destino';
   DESC_DESTINO_REC         := CreaCampo('DESC_DESTINO_REC',    ftString,   tsNinguno, tsNinguno, True);
   DESC_DESTINO_REC.Caption := 'Descripción';
   // CZR 25-mar-2013
   B_VAL_PLD                := CreaCampo('B_VAL_PLD',           ftString,   tsNinguno, tsNinguno, True);
   B_VAL_PLD.Caption        := 'Validado por PLD';
   // Luis Hernandez Mar 2016
   NUM_PUNTOS_RIESGO_PF     := CreaCampo('NUM_PUNTOS_RIESGO_PF',ftInteger,  tsNinguno, tsNinguno, True);
   NUM_PUNTOS_RIESGO_PF.Caption := 'Puntos Riesgo Persona Fisica';
   NUM_PUNTOS_RIESGO_PM     := CreaCampo('NUM_PUNTOS_RIESGO_PM',ftInteger,  tsNinguno, tsNinguno, True);
   NUM_PUNTOS_RIESGO_PM.Caption := 'Puntos Riesgo Persona Moral';



   FKeyFields.Add('ID_DESTINO_REC');

   TableName       := 'CTO_DESTINO_REC';
   UseQuery        := True;
   HelpFile        := 'IntCtoDesRec.Hlp';
   ShowMenuReporte := True;
end;

destructor TCtoDesRec.Destroy;
begin
  inherited;
end;

function TCtoDesRec.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWCtoDesRec;
begin
  W:=TWCtoDesRec.Create(Self);
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

function TCtoDesRec.InternalBusca:Boolean;
var
  T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICtoDesRec.it','F');
  try
    if Active then
    begin
      T.Param(0,ID_DESTINO_REC.AsString);
    end;
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;

function TCtoDesRec.InternalPost : Boolean;
var
  Query : TQuery;
begin
  InternalPost := False;
  if Self.Modo = moAppend then
  begin
    Query := TQuery.Create(Nil);
    try
      Query.DatabaseName := Apli.DataBaseName;
      Query.SQL.Add('SELECT SQ01_CTO_DESTINO_REC.NEXTVAL AS NEXTVAL FROM DUAL');
      Query.Close;
      Query.Open;
      if not Query.IsEmpty then
      begin
        ID_DESTINO_REC.AsInteger := Query.FieldByName('NEXTVAL').AsInteger;
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
//                     CLASE TWCTODESREC                        //
//**************************************************************//

procedure TWCtoDesRec.FormShow(Sender: TObject);
begin
   Objeto.ID_DESTINO_REC.Control   := IedID_DESTINO_REC;
   Objeto.DESC_DESTINO_REC.Control := edDESC_DESTINO_REC;
   Objeto.B_VAL_PLD.Control        := cbBValPLD; // CZR 25-mar-2013
   Objeto.NUM_PUNTOS_RIESGO_PF.Control  := iedPtosRiesgoPF; // Luis Hernandez Mar 2016
   Objeto.NUM_PUNTOS_RIESGO_PM.Control  := iedPtosRiesgoPM;
   InterForma1.F.btNuevo.SetFocus;
end;

procedure TWCtoDesRec.FormDestroy(Sender: TObject);
begin
   Objeto.ID_DESTINO_REC.Control   := nil;
   Objeto.DESC_DESTINO_REC.Control := nil;
   Objeto.B_VAL_PLD.Control        := nil; // CZR 25-mar-2013
   Objeto.NUM_PUNTOS_RIESGO_PF.Control  := nil; // Luis Hernandez Mar 2016
   Objeto.NUM_PUNTOS_RIESGO_PM.Control  := nil;
end;

procedure TWCtoDesRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//**************************************************************//
//             Eventos de los componentes de la Forma           //
//**************************************************************//

//---- Exit de Descripción ----//
procedure TWCtoDesRec.edDESC_DESTINO_RECExit(Sender: TObject);
begin
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaDesc;
end;

//**************************************************************//
//                   Botones de Interforma                      //
//**************************************************************//

//---- Bóton Aceptar ----//
procedure TWCtoDesRec.InterForma1BtnAceptar(Sender: TObject);
begin
  if ValidaDesc then
    InterForma1.Aceptar;
end;

//---- Bóton Preview ----//
procedure TWCtoDesRec.InterForma1Preview(Sender: TObject);
begin
  EXECUTE_RP_CTODESREC(Objeto.Apli,'Ver');
end;

//**************************************************************//
//                   Eventos de Interforma                      //
//**************************************************************//

//---- Después de Nuevo ----//
procedure TWCtoDesRec.InterForma1DespuesNuevo(Sender: TObject);
begin
  edDESC_DESTINO_REC.SetFocus;
end;

//---- Después de Modificar ----//
procedure TWCtoDesRec.InterForma1DespuesModificar(Sender: TObject);
begin
  edDESC_DESTINO_REC.SetFocus;
end;

//**************************************************************//
//                       Validaciones                           //
//**************************************************************//

//---- Valida Descripción ----//
function TWCtoDesRec.ValidaDesc : Boolean;
begin
  if Length(edDESC_DESTINO_REC.Text) <= 0 then
  begin
    ValidaDesc := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,'Debe especificar una descripción para el destino de recurso...');
    edDESC_DESTINO_REC.SetFocus;
  end
  else
    ValidaDesc := True;
end;

end.
