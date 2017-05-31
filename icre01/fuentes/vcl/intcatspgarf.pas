{ MAGV 2009-09-25
  Clase para manejar el catálogo de Clasificación legal
}
unit IntCatSPGarF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit;

type
  TCatSPGARF = class;

  TwCatSPGARF = class(TForm)
    edCveSPGarF: TInterEdit;
    edDescSPGarF: TInterEdit;
    InterForma: TInterForma;
    LbClave: TLabel;
    LbDescripcion: TLabel;
    Label1: TLabel;
    edSubCveSPGarF: TInterEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
    Objeto : TCatSPGARF;
  end;

  TCatSPGARF = class(TInterFrame)
  private
  protected
  public
    CVE_SPGARF    : TInterCampo;
    SUBCVE_SPGARF    : TInterCampo;
    DESC_SPGARF   : TInterCampo;
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
    procedure   DataBaseChange; override;
    function    InternalBusca : Boolean; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;

var
  wCatSPGARF: TwCatSPGARF;

implementation

{$R *.DFM}

constructor TCatSPGARF.Create( AOwner : TComponent );
begin
  Inherited;
  CVE_SPGARF := CreaCampo('CVE_SPGARF',ftString,tsNinguno,tsNinguno,True);
  CVE_SPGARF.Size := 10;
  CVE_SPGARF.Caption:='Clave de la causa de pago de la garantía';
  SUBCVE_SPGARF := CreaCampo('SUBCVE_SPGARF',ftString,tsNinguno,tsNinguno,True);
  SUBCVE_SPGARF.Size := 10;
  SUBCVE_SPGARF.Caption:='Subclave de la causa de pago de la garantía';
  DESC_SPGARF := CreaCampo('DESC_SPGARF',ftString,tsNinguno,tsNinguno,True);
  DESC_SPGARF.Size := 60;
  DESC_SPGARF.Caption := 'Descripción de la causa de pago de la garantía';

  FKeyFields.Add('CVE_SPGARF');
  FKeyFields.Add('SUBCVE_SPGARF');
  
  TableName := 'CR_SPGARF';
  UseQuery := True;
  ShowMenuReporte:=False;
end;//Constructor

Destructor TCatSPGARF.Destroy;
begin
  inherited;
end;//Destructor

procedure TCatSPGARF.DataBaseChange;
begin
  inherited;
end;//procedure

function TCatSPGARF.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TwCatSPGARF;
begin
  W := TwCatSPGARF.Create(Self);
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

Function TCatSPGARF.InternalBusca:Boolean;
Var
   T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICATSPGARF.it','S');
  Try
    if Active then
       T.Param(0,CVE_SPGARF.AsString);
       T.Param(1,SUBCVE_SPGARF.AsString);
    if T.Execute then
       InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
  finally
    T.Free;
  end;//Try & Finally
end;//Function

procedure TwCatSPGARF.FormShow(Sender: TObject);
begin
  Objeto.CVE_SPGARF.Control    := edCveSPGarF;
  Objeto.SUBCVE_SPGARF.Control    := edCveSPGarF;
  Objeto.DESC_SPGARF.Control   := edDescSPGarF;
end;//procedure

procedure TwCatSPGARF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;//procedure

procedure TwCatSPGARF.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_SPGARF.Control    := nil;
  Objeto.SUBCVE_SPGARF.Control    := nil;
  Objeto.DESC_SPGARF.Control   := nil;
end;//procedure

end.
