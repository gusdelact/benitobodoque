Unit IntCtoOriRec;
//------------------------------------------------------------------------------
//  Catálogo de Origenes de Recursos
//  Realizó  : Carlos Adrian Mejía Ledón
//  Fecha    : Noviembre 2003
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, UnGene, UnRpCtoOriRec;

type
  TCtoOriRec= class;

  TWCtoOriRec=Class(TForm)
    InterForma1             : TInterForma;
    lbID_ORIGEN_REC : TLabel;
    IedID_ORIGEN_REC : TInterEdit;
    lbDESC_ORIGEN_REC : TLabel;
    edDESC_ORIGEN_REC : TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    iedPtosRiesgoPF: TInterEdit;
    Label2: TLabel;
    iedPtosRiesgoPM: TInterEdit;
    cbBValPLD: TCheckBox;
    Label3: TLabel;
    rgCvePerJuridica: TRadioGroup;
    lCvePerJuridica: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    { Eventos de los componentes de la Forma }
    procedure edDESC_ORIGEN_RECExit(Sender: TObject);
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
    Objeto : TCtoOriRec;
  end;

  TCtoOriRec= class(TInterFrame)
    private
    protected
    public
      ID_ORIGEN_REC    : TInterCampo;
      DESC_ORIGEN_REC  : TInterCampo;
      Ptos_Riesgo_PF   : TInterCampo;
      Ptos_Riesgo_PM   : TInterCampo;
      // CZR 25-mar-2013
      B_VAL_PLD        : TInterCampo;
      CVE_PER_JURIDICA : TInterCampo;

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
//                      CLASE TCTOORIREC                        //
//**************************************************************//

constructor TCtoOriRec.Create( AOwner : TComponent );
begin
   Inherited;

   ID_ORIGEN_REC            := CreaCampo('ID_ORIGEN_REC',    ftInteger, tsNinguno, tsNuevo,   True);
   ID_ORIGEN_REC.Caption    := 'Origen';
   DESC_ORIGEN_REC          := CreaCampo('DESC_ORIGEN_REC',  ftString,  tsNinguno, tsNinguno, True);
   DESC_ORIGEN_REC.Caption  := 'Descripción';
   Ptos_Riesgo_PF           := CreaCampo('PTOS_RIESGO_PF',   ftFloat,   tsNinguno, tsNinguno, True);
   Ptos_Riesgo_PM           := CreaCampo('PTOS_RIESGO_PM',   ftFloat,   tsNinguno, tsNinguno, True);

   // CZR 25-mar-2013
   B_VAL_PLD                := CreaCampo('B_VAL_PLD',        ftString,  tsNinguno, tsNinguno, True);
   B_VAL_PLD.Caption        := 'Validado por PLD';
   CVE_PER_JURIDICA         := CreaCampo('CVE_PER_JURIDICA', ftString,  tsNinguno, tsNinguno, True);
   CVE_PER_JURIDICA.Caption := 'Clave de Jurisdicción';
   with CVE_PER_JURIDICA do
   begin
      Size     := 2;
      UseCombo := True;
      ComboLista.Add('0');   ComboDatos.Add('PF');
      ComboLista.Add('1');   ComboDatos.Add('PM');
   end;

   FKeyFields.Add('ID_ORIGEN_REC');

   TableName       := 'CTO_ORIGEN_REC';
   UseQuery        := True;
   HelpFile        := 'IntCtoOriRec.Hlp';
   ShowMenuReporte := False;
end;

destructor TCtoOriRec.Destroy;
begin
  inherited;
end;

function TCtoOriRec.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWCtoOriRec;
begin
  W:=TWCtoOriRec.Create(Self);
  try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowBtnAyuda := False;
    W.InterForma1.ShowBtnPreview := False;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

function TCtoOriRec.InternalBusca:Boolean;
var
  T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICtoOriRec.it','I');
  try
    if Active then
    begin
      T.Param(0,ID_ORIGEN_REC.AsString);
    end;
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;

function TCtoOriRec.InternalPost : Boolean;
var
  Query : TQuery;
begin
  InternalPost := False;
  if Self.Modo = moAppend then
  begin
    Query := TQuery.Create(Nil);
    try
      Query.DatabaseName := Apli.DataBaseName;
      Query.SQL.Add('SELECT SQ01_CTO_ORIGEN_REC.NEXTVAL AS NEXTVAL FROM DUAL');
      Query.Close;
      Query.Open;
      if not Query.IsEmpty then
      begin
        ID_ORIGEN_REC.AsInteger := Query.FieldByName('NEXTVAL').AsInteger;
        InternalPost            := inherited InternalPost;
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
//                     CLASE TWCTOORIREC                        //
//**************************************************************//

procedure TWCtoOriRec.FormShow(Sender: TObject);
begin
   Objeto.ID_ORIGEN_REC.Control    := IedID_ORIGEN_REC;
   Objeto.DESC_ORIGEN_REC.Control  := edDESC_ORIGEN_REC;
   Objeto.Ptos_Riesgo_PF.Control   := iedPtosRiesgoPF;
   Objeto.Ptos_Riesgo_PM.Control   := iedPtosRiesgoPM;

   // CZR 25-mar-2013
   Objeto.B_VAL_PLD.Control        := cbBValPLD;
   Objeto.CVE_PER_JURIDICA.Control := rgCvePerJuridica;

   InterForma1.F.btNuevo.SetFocus;
end;

procedure TWCtoOriRec.FormDestroy(Sender: TObject);
begin
   Objeto.ID_ORIGEN_REC.Control    := nil;
   Objeto.DESC_ORIGEN_REC.Control  := nil;
   Objeto.Ptos_Riesgo_PF.Control   := nil;
   Objeto.Ptos_Riesgo_PM.Control   := nil;
   // CZR 25-mar-2013
   Objeto.B_VAL_PLD.Control        := nil;
   Objeto.CVE_PER_JURIDICA.Control := nil;
end;

procedure TWCtoOriRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//**************************************************************//
//             Eventos de los componentes de la Forma           //
//**************************************************************//

//---- Exit de Descripción ----//
procedure TWCtoOriRec.edDESC_ORIGEN_RECExit(Sender: TObject);
begin
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaDesc;
end;

//**************************************************************//
//                   Botones de Interforma                      //
//**************************************************************//

//---- Bóton Aceptar ----//
procedure TWCtoOriRec.InterForma1BtnAceptar(Sender: TObject);
begin
  if ValidaDesc then
    InterForma1.Aceptar;
end;

//---- Bóton Preview ----//
procedure TWCtoOriRec.InterForma1Preview(Sender: TObject);
begin
  EXECUTE_RP_CTOORIREC(Objeto.Apli,'Ver');
end;

//**************************************************************//
//                   Eventos de Interforma                      //
//**************************************************************//

//---- Después de Nuevo ----//
procedure TWCtoOriRec.InterForma1DespuesNuevo(Sender: TObject);
begin
  edDESC_ORIGEN_REC.SetFocus;
end;

//---- Después de Modificar ----//
procedure TWCtoOriRec.InterForma1DespuesModificar(Sender: TObject);
begin
  edDESC_ORIGEN_REC.SetFocus;
end;

//**************************************************************//
//                       Validaciones                           //
//**************************************************************//

//---- Valida Descripción ----//
function TWCtoOriRec.ValidaDesc : Boolean;
begin
  if Length(edDESC_ORIGEN_REC.Text) <= 0 then
  begin
    ValidaDesc := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,'Debe especificar una descripción para el origne de recursos...');
    edDESC_ORIGEN_REC.SetFocus;
  end
  else
    ValidaDesc := True;
end;

end.
