Unit IntPerRanIng;
//------------------------------------------------------------------------------
//  Catálogo de Rango de Ingresos
//  Realizó  : Carlos Adrian Mejía Ledón
//  Fecha    : Noviembre 2003
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, UnGene, UnRpPerRanIng;

type
  TPerRanIng= class;

  TWPerRanIng=Class(TForm)
    InterForma1         : TInterForma;
    rgPerJuridica: TRadioGroup;
    lbID_RANGO_INGRESO: TLabel;
    lbMONTO_MAXIMO: TLabel;
    IedID_RANGO_INGRESO: TInterEdit;
    iedMONTO_MAXIMO: TInterEdit;
    edCvePerJuridica: TEdit;


    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    function  ValidaMaximo : Boolean;
    procedure iedMONTO_MAXIMOExit(Sender: TObject);
    procedure InterForma1BtnAceptar(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    procedure edCvePerJuridicaChange(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TPerRanIng;
  end;

  TPerRanIng= class(TInterFrame)
    private
    protected
    public
      ID_RANGO_INGRESO         : TInterCampo;
      MONTO_MAXIMO             : TInterCampo;
      CVE_PER_JURIDICA         : TInterCampo;


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
//                      CLASE TPERRANING                        //
//**************************************************************//

constructor TPerRanIng.Create( AOwner : TComponent );
begin
  Inherited;
  ID_RANGO_INGRESO :=CreaCampo('ID_RANGO_INGRESO',ftInteger,tsNinguno,tsNuevo,True);
  MONTO_MAXIMO      :=CreaCampo('MONTO_MAXIMO',ftFloat,tsNinguno,tsNinguno,True);
  CVE_PER_JURIDICA  :=CreaCampo('CVE_PER_JURIDICA',ftString,tsNinguno,tsNinguno,True);

  ID_RANGO_INGRESO.Caption:='Rango';
  MONTO_MAXIMO.Caption:='Monto Máximo';

  FKeyFields.Add('ID_RANGO_INGRESO');

  TableName := 'PER_RANG_INGRESO';
  UseQuery := True;
  HelpFile := 'IntPerRanIng.Hlp';
  ShowMenuReporte:=True;
end;

destructor TPerRanIng.Destroy;
begin
  inherited;
end;

function TPerRanIng.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWPerRanIng;
begin
  W:=TWPerRanIng.Create(Self);
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

function TPerRanIng.InternalBusca:Boolean;
var
  T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IPerRanIng.it','I');
  try
    if Active then
    begin
      T.Param(0,ID_RANGO_INGRESO.AsString);
    end;
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;

end;

function TPerRanIng.InternalPost : Boolean;
var
  Query : TQuery;
begin
  InternalPost := False;
  if Self.Modo = moAppend then
  begin
    Query := TQuery.Create(Nil);
    try
      Query.DatabaseName := Apli.DataBaseName;
      Query.SQL.Add('SELECT SQ01_PER_RANG_INGRESO.NEXTVAL AS NEXTVAL FROM DUAL');
      Query.Close;
      Query.Open;
      if not Query.IsEmpty then
      begin
        ID_RANGO_INGRESO.AsInteger := Query.FieldByName('NEXTVAL').AsInteger;
        InternalPost               := inherited InternalPost;
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
//                     CLASE TWPERRANING                        //
//**************************************************************//

procedure TWPerRanIng.FormShow(Sender: TObject);
begin
  Objeto.ID_RANGO_INGRESO.Control := IedID_RANGO_INGRESO;
  Objeto.MONTO_MAXIMO.Control     := iedMONTO_MAXIMO;
  Objeto.CVE_PER_JURIDICA.Control := edCvePerJuridica;
  InterForma1.F.btNuevo.SetFocus;
end;

procedure TWPerRanIng.FormDestroy(Sender: TObject);
begin
  Objeto.ID_RANGO_INGRESO.Control := nil;
  Objeto.MONTO_MAXIMO.Control     := nil;
end;

procedure TWPerRanIng.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//**************************************************************//
//             Eventos de los componentes de la Forma           //
//**************************************************************//

//---- Exit de Máximo ----//
procedure TWPerRanIng.iedMONTO_MAXIMOExit(Sender: TObject);
begin
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaMaximo;
end;

//**************************************************************//
//                   Botones de Interforma                      //
//**************************************************************//

//---- Bóton Aceptar ----//
procedure TWPerRanIng.InterForma1BtnAceptar(Sender: TObject);
begin
  if rgPerJuridica.ItemIndex = 0 then
     Objeto.CVE_PER_JURIDICA.AsString := 'PF'
  else
     Objeto.CVE_PER_JURIDICA.AsString := 'PM';

  if ValidaMaximo then
    InterForma1.Aceptar;
end;

//---- Bóton Preview ----//
procedure TWPerRanIng.InterForma1Preview(Sender: TObject);
begin
  EXECUTE_RP_PERRANING(Objeto.Apli,'Ver');
end;

//**************************************************************//
//                   Eventos de Interforma                      //
//**************************************************************//

//---- Después de Nuevo ----//
procedure TWPerRanIng.InterForma1DespuesNuevo(Sender: TObject);
begin
  iedMONTO_MAXIMO.SetFocus;
end;

//---- Después de Modificar ----//
procedure TWPerRanIng.InterForma1DespuesModificar(Sender: TObject);
begin
  iedMONTO_MAXIMO.SetFocus;
end;

//**************************************************************//
//                       Validaciones                           //
//**************************************************************//

//---- Valida Máximo ----//
function TWPerRanIng.ValidaMaximo : Boolean;
begin
  if Length(iedMONTO_MAXIMO.Text) <= 0 then
  begin
    ValidaMaximo := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,'Debe especificar un monto máximo de ingresos...');
    iedMONTO_MAXIMO.SetFocus;
  end
  else if StrToFloat(iedMONTO_MAXIMO.Text) <= 0 then
  begin
    ValidaMaximo := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,'El monto máximo de ingresos debe ser mayo a cero...');
    iedMONTO_MAXIMO.SetFocus;
  end
  else
    ValidaMaximo := True;
end;

procedure TWPerRanIng.edCvePerJuridicaChange(Sender: TObject);
var
   Visi:Boolean;
begin
  Visi := (edCvePerJuridica.Text = 'PM');
  rgPerJuridica.ItemIndex := Byte(Visi); // Los posibles valores de Byte(Visi) Son 0  = False o 1  = True
  Refresh;
end;//procedure

end.
