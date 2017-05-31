Unit IntPerRanEmp;
//------------------------------------------------------------------------------
//  Catálogo de Rango de Empleados
//  Realizó  : Carlos Adrian Mejía Ledón
//  Fecha    : Noviembre 2003
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, UnGene, UnRpPerRanEmp;

type
  TPerRanEmp= class;

  TWPerRanEmp=Class(TForm)
    InterForma1             : TInterForma;
    lbID_RANGO_NO_EMPL : TLabel;
    IedID_RANGO_NO_EMPL : TInterEdit;
    lbMAXIMO : TLabel;
    iedMAXIMO: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    { Eventos de los componentes de la Forma }
    procedure iedMAXIMOExit(Sender: TObject);
    { Botones de InterForma }
    procedure InterForma1BtnAceptar(Sender: TObject);
    { Eventos de InterForma }
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    { Validaciones }
    function  ValidaMaximo : Boolean;
    procedure InterForma1Preview(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TPerRanEmp;
  end;

  TPerRanEmp= class(TInterFrame)
    private
    protected
    public
      ID_RANGO_NO_EMPL         : TInterCampo;
      MAXIMO                   : TInterCampo;
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
//                      CLASE TPERRANEMP                        //
//**************************************************************//

constructor TPerRanEmp.Create( AOwner : TComponent );
begin
  Inherited;
  ID_RANGO_NO_EMPL :=CreaCampo('ID_RANGO_NO_EMPL',ftInteger,tsNinguno,tsNuevo,True);
  ID_RANGO_NO_EMPL.Caption:='Rango';
  MAXIMO :=CreaCampo('MAXIMO',ftInteger,tsNinguno,tsNinguno,True);
  MAXIMO.Caption:='Máximo';
  FKeyFields.Add('ID_RANGO_NO_EMPL');

  TableName := 'PER_RANG_EMPL';
  UseQuery := True;
  HelpFile := 'IntPerRanEmp.Hlp';
  ShowMenuReporte:=True;
end;

destructor TPerRanEmp.Destroy;
begin
  inherited;
end;

function TPerRanEmp.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWPerRanEmp;
begin
  W:=TWPerRanEmp.Create(Self);
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

function TPerRanEmp.InternalBusca:Boolean;
var
  T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IPerRanEmp.it','I');
  try
    if Active then
    begin
      T.Param(0,ID_RANGO_NO_EMPL.AsString);
    end;
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;

function TPerRanEmp.InternalPost : Boolean;
var
  Query : TQuery;
begin
  InternalPost := False;
  if Self.Modo = moAppend then
  begin
    Query := TQuery.Create(Nil);
    try
      Query.DatabaseName := Apli.DataBaseName;
      Query.SQL.Add('SELECT SQ01_PER_RANG_EMPL.NEXTVAL AS NEXTVAL FROM DUAL');
      Query.Close;
      Query.Open;
      if not Query.IsEmpty then
      begin
        ID_RANGO_NO_EMPL.AsInteger := Query.FieldByName('NEXTVAL').AsInteger;
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
//                     CLASE TWPERRANEMP                        //
//**************************************************************//

procedure TWPerRanEmp.FormShow(Sender: TObject);
begin
  Objeto.ID_RANGO_NO_EMPL.Control:=IedID_RANGO_NO_EMPL;
  Objeto.MAXIMO.Control:=iedMAXIMO;
  InterForma1.F.btNuevo.SetFocus;
end;

procedure TWPerRanEmp.FormDestroy(Sender: TObject);
begin
  Objeto.ID_RANGO_NO_EMPL.Control:=nil;
  Objeto.MAXIMO.Control:=nil;
end;

procedure TWPerRanEmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//**************************************************************//
//             Eventos de los componentes de la Forma           //
//**************************************************************//

//---- Exit de Máximo ----//
procedure TWPerRanEmp.iedMAXIMOExit(Sender: TObject);
begin
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaMaximo;
end;

//**************************************************************//
//                   Botones de Interforma                      //
//**************************************************************//

//---- Bóton Aceptar ----//
procedure TWPerRanEmp.InterForma1BtnAceptar(Sender: TObject);
begin
  if ValidaMaximo then
    InterForma1.Aceptar;
end;

//---- Bóton Preview ----//
procedure TWPerRanEmp.InterForma1Preview(Sender: TObject);
begin
  EXECUTE_RP_PERRANEMP(Objeto.Apli,'Ver');
end;

//**************************************************************//
//                   Eventos de Interforma                      //
//**************************************************************//

//---- Después de Nuevo ----//
procedure TWPerRanEmp.InterForma1DespuesNuevo(Sender: TObject);
begin
  iedMAXIMO.SetFocus;
end;

//---- Después de Modificar ----//
procedure TWPerRanEmp.InterForma1DespuesModificar(Sender: TObject);
begin
  iedMAXIMO.SetFocus;
end;

//**************************************************************//
//                       Validaciones                           //
//**************************************************************//

//---- Valida Máximo ----//
function TWPerRanEmp.ValidaMaximo : Boolean;
begin
  if Length(iedMAXIMO.Text) <= 0 then
  begin
    ValidaMaximo := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,'Debe especificar un número máximo de empleados...');
    iedMAXIMO.SetFocus;
  end
  else if StrToInt(iedMAXIMO.Text) <= 0 then
  begin
    ValidaMaximo := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,'El número máximo de empleados debe ser mayo a cero...');
    iedMAXIMO.SetFocus;
  end
  else
    ValidaMaximo := True;
end;

end.
