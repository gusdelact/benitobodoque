{ MAGV 2009-09-25
  Clase para manejar el catálogo de Clasificación legal
}
unit IntCatCPGarF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit;

type
  TCatCPGarF = class;

  TwCatCPGARF = class(TForm)
    edCveCPGarF: TInterEdit;
    edDescCPGarF: TInterEdit;
    InterForma: TInterForma;
    LbClave: TLabel;
    LbDescripcion: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
    Objeto : TCatCPGarF;
  end;

  TCatCPGarF = class(TInterFrame)
  private
  protected
  public
    CVE_CPGARF    : TInterCampo;
    DESC_CPGARF   : TInterCampo;
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
    procedure   DataBaseChange; override;
    function    InternalBusca : Boolean; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;

var
  wCatCPGARF: TwCatCPGARF;

implementation

{$R *.DFM}

constructor TCatCPGarF.Create( AOwner : TComponent );
begin
  Inherited;
  CVE_CPGARF := CreaCampo('CVE_CPGARF',ftString,tsNinguno,tsNinguno,True);
  CVE_CPGARF.Size := 10;
  CVE_CPGARF.Caption:='Clave de la causa de pago de la garantía';
  DESC_CPGARF := CreaCampo('DESC_CPGARF',ftString,tsNinguno,tsNinguno,True);
  DESC_CPGARF.Size := 30;
  DESC_CPGARF.Caption := 'Descripción de la causa de pago de la garantía';
  FKeyFields.Add('CVE_CPGARF');
  TableName := 'CR_CPGARF';
  UseQuery := True;
  ShowMenuReporte:=False;
end;//Constructor

Destructor TCatCPGarF.Destroy;
begin
  inherited;
end;//Destructor

procedure TCatCPGarF.DataBaseChange;
begin
  inherited;
end;//procedure

function TCatCPGarF.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TwCatCPGARF;
begin
  W := TwCatCPGARF.Create(Self);
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

Function TCatCPGarF.InternalBusca:Boolean;
Var
   T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICATCPGARF.it','S');
  Try
    if Active then
       T.Param(0,CVE_CPGARF.AsString);
    if T.Execute then
       InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;//Try & Finally
end;//Function

procedure TwCatCPGARF.FormShow(Sender: TObject);
begin
  Objeto.CVE_CPGARF.Control    := edCveCPGarF;
  Objeto.DESC_CPGARF.Control   := edCveCPGarF;
end;//procedure

procedure TwCatCPGARF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;//procedure

procedure TwCatCPGARF.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_CPGARF.Control    := nil;
  Objeto.DESC_CPGARF.Control   := nil;
end;//procedure

end.
