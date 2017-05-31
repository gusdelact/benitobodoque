{ MAGV 2009-09-25
  Clase para manejar el catálogo de Clasificación legal
}
unit IntCatConInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit;

type
  TCatConInv = class;

  TwCatConInv = class(TForm)
    edCveClasLegal: TInterEdit;
    edDescClasLegal: TInterEdit;
    InterForma: TInterForma;
    LbClave: TLabel;
    LbDescripcion: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
    Objeto : TCatConInv;
  end;

  TCatConInv = class(TInterFrame)
  private
  protected
  public
    CVE_CON_INV    : TInterCampo;
    DESC_CON_INV   : TInterCampo;
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
    procedure   DataBaseChange; override;
    function    InternalBusca : Boolean; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;

var
  wCatConInv: TwCatConInv;

implementation

{$R *.DFM}

constructor TCatConInv.Create( AOwner : TComponent );
begin
  Inherited;
  CVE_CON_INV := CreaCampo('CVE_CON_INV',ftString,tsNinguno,tsNinguno,True);
  CVE_CON_INV.Size := 10;
  CVE_CON_INV.Caption:='Clave del concepto';
  DESC_CON_INV := CreaCampo('DESC_CON_INV',ftString,tsNinguno,tsNinguno,True);
  DESC_CON_INV.Size := 30;
  DESC_CON_INV.Caption := 'Descripción del concepto';
  FKeyFields.Add('CVE_CON_INV');
  TableName := 'CR_CON_INV';
  UseQuery := True;
  ShowMenuReporte:=False;
end;//Constructor

Destructor TCatConInv.Destroy;
begin
  inherited;
end;//Destructor

procedure TCatConInv.DataBaseChange;
begin
  inherited;
end;//procedure

function TCatConInv.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TwCatConInv;
begin
  W := TwCatConInv.Create(Self);
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

Function TCatConInv.InternalBusca:Boolean;
Var
   T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICatConInv.it','S');
  Try
    if Active then
       T.Param(0,CVE_CON_INV.AsString);
    if T.Execute then
       InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;//Try & Finally
end;//Function

procedure TwCatConInv.FormShow(Sender: TObject);
begin
  Objeto.CVE_CON_INV.Control    := edCveClasLegal;
  Objeto.DESC_CON_INV.Control   := edDescClasLegal;
end;//procedure

procedure TwCatConInv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;//procedure

procedure TwCatConInv.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_CON_INV.Control    := nil;
  Objeto.DESC_CON_INV.Control   := nil;
end;//procedure

end.
