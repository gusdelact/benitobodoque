Unit IntPerRanVen;
//------------------------------------------------------------------------------
//  Catálogo de Rango de Ventas
//  Realizó  : Carlos Adrian Mejía Ledón
//  Fecha    : Noviembre 2003
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, UnGene, UnRpPerRanVen;

type
  TPerRanVen= class;

  TWPerRanVen=Class(TForm)
    InterForma1             : TInterForma;
    lbID_RANGO_VENTAS : TLabel;
    iedID_RANGO_VENTAS: TInterEdit;
    lbMONTO_MAXIMO : TLabel;
    iedMONTO_MAXIMO: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    function  ValidaMaximo : Boolean;
    procedure iedMONTO_MAXIMOExit(Sender: TObject);
    procedure InterForma1BtnAceptar(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TPerRanVen;
  end;

  TPerRanVen= class(TInterFrame)
    private
    protected
    public
      ID_RANGO_VENTAS          : TInterCampo;
      MONTO_MAXIMO             : TInterCampo;
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
//                      CLASE TPERRANVEN                        //
//**************************************************************//

constructor TPerRanVen.Create( AOwner : TComponent );
begin
  Inherited;
  ID_RANGO_VENTAS :=CreaCampo('ID_RANGO_VENTAS',ftInteger,tsNinguno,tsNuevo,True);
  ID_RANGO_VENTAS.Caption:='Rango';
  MONTO_MAXIMO :=CreaCampo('MONTO_MAXIMO',ftFloat,tsNinguno,tsNinguno,True);
  MONTO_MAXIMO.Caption:='Monto Máximo';
  FKeyFields.Add('ID_RANGO_VENTAS');

  TableName := 'PER_RANG_VENTA';
  UseQuery := True;
  HelpFile := 'IntPerRanVen.Hlp';
  ShowMenuReporte:=True;
end;

destructor TPerRanVen.Destroy;
begin
  inherited;
end;

function TPerRanVen.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWPerRanVen;
begin
  W:=TWPerRanVen.Create(Self);
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

function TPerRanVen.InternalBusca:Boolean;
var
  T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IPerRanVen.it','I');
  try
    if Active then
    begin
      T.Param(0,ID_RANGO_VENTAS.AsString);
    end;
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;

function TPerRanVen.InternalPost : Boolean;
var
  Query : TQuery;
begin
  InternalPost := False;
  if Self.Modo = moAppend then
  begin
    Query := TQuery.Create(Nil);
    try
      Query.DatabaseName := Apli.DataBaseName;
      Query.SQL.Add('SELECT SQ01_PER_RANG_VENTA.NEXTVAL AS NEXTVAL FROM DUAL');
      Query.Close;
      Query.Open;
      if not Query.IsEmpty then
      begin
        ID_RANGO_VENTAS.AsInteger := Query.FieldByName('NEXTVAL').AsInteger;
        InternalPost              := inherited InternalPost;
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
//                     CLASE TWPERRANVEN                        //
//**************************************************************//

procedure TWPerRanVen.FormShow(Sender: TObject);
begin
  Objeto.ID_RANGO_VENTAS.Control:=iedID_RANGO_VENTAS;
  Objeto.MONTO_MAXIMO.Control:=iedMONTO_MAXIMO;
  InterForma1.F.btNuevo.SetFocus;
end;

procedure TWPerRanVen.FormDestroy(Sender: TObject);
begin
  Objeto.ID_RANGO_VENTAS.Control:=nil;
  Objeto.MONTO_MAXIMO.Control:=nil;
end;

procedure TWPerRanVen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//**************************************************************//
//             Eventos de los componentes de la Forma           //
//**************************************************************//

//---- Exit de Máximo ----//
procedure TWPerRanVen.iedMONTO_MAXIMOExit(Sender: TObject);
begin
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaMaximo;
end;

//**************************************************************//
//                   Botones de Interforma                      //
//**************************************************************//

//---- Bóton Aceptar ----//
procedure TWPerRanVen.InterForma1BtnAceptar(Sender: TObject);
begin
  if ValidaMaximo then
    InterForma1.Aceptar;
end;

//---- Bóton Preview ----//
procedure TWPerRanVen.InterForma1Preview(Sender: TObject);
begin
  EXECUTE_RP_PERRANVEN(Objeto.Apli,'Ver');
end;

//**************************************************************//
//                   Eventos de Interforma                      //
//**************************************************************//

//---- Después de Nuevo ----//
procedure TWPerRanVen.InterForma1DespuesNuevo(Sender: TObject);
begin
  iedMONTO_MAXIMO.SetFocus;
end;

//---- Después de Modificar ----//
procedure TWPerRanVen.InterForma1DespuesModificar(Sender: TObject);
begin
  iedMONTO_MAXIMO.SetFocus;
end;
//**************************************************************//
//                       Validaciones                           //
//**************************************************************//

//---- Valida Máximo ----//
function TWPerRanVen.ValidaMaximo : Boolean;
begin
  if Length(iedMONTO_MAXIMO.Text) <= 0 then
  begin
    ValidaMaximo := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,'Debe especificar un monto máximo de ventas...');
    iedMONTO_MAXIMO.SetFocus;
  end
  else if StrToFloat(iedMONTO_MAXIMO.Text) <= 0 then
  begin
    ValidaMaximo := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,'El monto máximo de ventas debe ser mayo a cero...');
    iedMONTO_MAXIMO.SetFocus;
  end
  else
    ValidaMaximo := True;
end;

end.
