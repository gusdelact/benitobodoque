{ MAGV 2009-09-25
  Clase para manejar el catálogo de Clasificación legal
}
unit IntCatInfRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit;

type
  TCatInfRec = class;

  TwCatInfRec = class(TForm)
    edCveInfRecupera: TInterEdit;
    edDescInfRecupera: TInterEdit;
    InterForma: TInterForma;
    LbClave: TLabel;
    LbDescripcion: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
    Objeto : TCatInfRec;
  end;

  TCatInfRec = class(TInterFrame)
  private
  protected
  public
    CVE_INF_RECUPERA    : TInterCampo;
    DESC_INF_RECUPERA   : TInterCampo;
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
    procedure   DataBaseChange; override;
    function    InternalBusca : Boolean; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;

var
  wCatInfRec: TwCatInfRec;

implementation

{$R *.DFM}

constructor TCatInfRec.Create( AOwner : TComponent );
begin
  Inherited;
  CVE_INF_RECUPERA := CreaCampo('CVE_INF_RECUPERA',ftString,tsNinguno,tsNinguno,True);
  CVE_INF_RECUPERA.Size := 10;
  CVE_INF_RECUPERA.Caption:='Clave Solicitud';
  DESC_INF_RECUPERA := CreaCampo('DESC_INF_RECUPERA',ftString,tsNinguno,tsNinguno,True);
  DESC_INF_RECUPERA.Size := 30;
  DESC_INF_RECUPERA.Caption := 'Descripción de la solicitud';
  FKeyFields.Add('CVE_INF_RECUPERA');
  TableName := 'CR_INF_RECUPERA';
  UseQuery := True;
  ShowMenuReporte:=False;
end;//Constructor

Destructor TCatInfRec.Destroy;
begin
  inherited;
end;//Destructor

procedure TCatInfRec.DataBaseChange;
begin
  inherited;
end;//procedure

function TCatInfRec.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TwCatInfRec;
begin
  W := TwCatInfRec.Create(Self);
  try
    W.Objeto:= Self;
    W.InterForma.InterFrame:= Self;
    W.InterForma.FormaTipo := FormaTipo;
    W.InterForma.ShowGrid := False;
    W.InterForma.ShowNavigator := False;
    W.InterForma.Funcion := FInterFun;
    W.InterForma.CentrarForma := True;
    W.InterForma.ShowModal;
    ShowWindow := W.InterForma.ModalResult;
  finally
    W.Free;
  end;//Try & Finally
end;//Function

Function TCatInfRec.InternalBusca:Boolean;
Var
   T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICatInfRec.it','S');
  Try
    if Active then
       T.Param(0,CVE_INF_RECUPERA.AsString);
    if T.Execute then
       InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;//Try & Finally
end;//Function

procedure TwCatInfRec.FormShow(Sender: TObject);
begin
  Objeto.CVE_INF_RECUPERA.Control    := edCveInfRecupera;
  Objeto.DESC_INF_RECUPERA.Control   := edDescInfRecupera;
end;//procedure

procedure TwCatInfRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;//procedure

procedure TwCatInfRec.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_INF_RECUPERA.Control    := nil;
  Objeto.DESC_INF_RECUPERA.Control   := nil;
end;//procedure

end.
