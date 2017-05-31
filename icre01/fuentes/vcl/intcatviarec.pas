{ MAGV 2009-09-25
  Clase para manejar el catálogo de Clasificación legal
}
unit IntCatViaRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit;

type
  TCatViaRec = class;

  TwCatViaRec = class(TForm)
    edCveViaRec: TInterEdit;
    edDescViaRec: TInterEdit;
    InterForma: TInterForma;
    LbClave: TLabel;
    LbDescripcion: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
    Objeto : TCatViaRec;
  end;

  TCatViaRec = class(TInterFrame)
  private
  protected
  public
    CVE_VIAREC    : TInterCampo;
    DESC_VIAREC   : TInterCampo;
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
    procedure   DataBaseChange; override;
    function    InternalBusca : Boolean; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;

var
  wCatViaRec: TwCatViaRec;

implementation

{$R *.DFM}

constructor TCatViaRec.Create( AOwner : TComponent );
begin
  Inherited;
  CVE_VIAREC := CreaCampo('CVE_VIAREC',ftString,tsNinguno,tsNinguno,True);
  CVE_VIAREC.Size := 10;
  CVE_VIAREC.Caption:='Clave de la causa de pago de la garantía';
  DESC_VIAREC := CreaCampo('DESC_VIAREC',ftString,tsNinguno,tsNinguno,True);
  DESC_VIAREC.Size := 30;
  DESC_VIAREC.Caption := 'Descripción de la causa de pago de la garantía';
  FKeyFields.Add('CVE_VIAREC');
  TableName := 'CR_VIAREC';
  UseQuery := True;
  ShowMenuReporte:=False;
end;//Constructor

Destructor TCatViaRec.Destroy;
begin
  inherited;
end;//Destructor

procedure TCatViaRec.DataBaseChange;
begin
  inherited;
end;//procedure

function TCatViaRec.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TwCatViaRec;
begin
  W := TwCatViaRec.Create(Self);
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

Function TCatViaRec.InternalBusca:Boolean;
Var
   T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICATVIAREC.it','S');
  Try
    if Active then
       T.Param(0,CVE_VIAREC.AsString);
    if T.Execute then
       InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;//Try & Finally
end;//Function

procedure TwCatViaRec.FormShow(Sender: TObject);
begin
  Objeto.CVE_VIAREC.Control    := edCveViaRec;
  Objeto.DESC_VIAREC.Control   := edDescViaRec;
end;//procedure

procedure TwCatViaRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;//procedure

procedure TwCatViaRec.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_VIAREC.Control    := nil;
  Objeto.DESC_VIAREC.Control   := nil;
end;//procedure

end.
