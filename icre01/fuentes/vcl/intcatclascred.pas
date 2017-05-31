{ MAGV 2009-09-25
  Clase para manejar el catálogo de Clasificación legal
}
unit IntCatClasCred;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit;

type
  TCatClasCred = class;

  TwCatClasCred = class(TForm)
    edCveClasCred: TInterEdit;
    edDescClasCred: TInterEdit;
    InterForma: TInterForma;
    LbClave: TLabel;
    LbDescripcion: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
    Objeto : TCatClasCred;
  end;

  TCatClasCred = class(TInterFrame)
  private
  protected
  public
    CVE_CLAS_CRED    : TInterCampo;
    DESC_CLAS_CRED   : TInterCampo;
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
    procedure   DataBaseChange; override;
    function    InternalBusca : Boolean; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;

var
  wCatClasCred: TwCatClasCred;

implementation

{$R *.DFM}

constructor TCatClasCred.Create( AOwner : TComponent );
begin
  Inherited;
  CVE_CLAS_CRED := CreaCampo('CVE_CLAS_CRED',ftString,tsNinguno,tsNinguno,True);
  CVE_CLAS_CRED.Size := 10;
  CVE_CLAS_CRED.Caption:='Clave de la clasificación';
  DESC_CLAS_CRED := CreaCampo('DESC_CLAS_CRED',ftString,tsNinguno,tsNinguno,True);
  DESC_CLAS_CRED.Size := 250;
  DESC_CLAS_CRED.Caption := 'Descripción de la clasificación';
  FKeyFields.Add('CVE_CLAS_CRED');
  TableName := 'CR_CLAS_CRED';
  UseQuery := True;
  ShowMenuReporte:=False;
end;//Constructor

Destructor TCatClasCred.Destroy;
begin
  inherited;
end;//Destructor

procedure TCatClasCred.DataBaseChange;
begin
  inherited;
end;//procedure

function TCatClasCred.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TwCatClasCred;
begin
  W := TwCatClasCred.Create(Self);
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

Function TCatClasCred.InternalBusca:Boolean;
Var
   T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICatClasCred.it','S');
  Try
    if Active then
       T.Param(0,CVE_CLAS_CRED.AsString);
    if T.Execute then
       InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;//Try & Finally
end;//Function

procedure TwCatClasCred.FormShow(Sender: TObject);
begin
  Objeto.CVE_CLAS_CRED.Control    := edCveClasCred;
  Objeto.DESC_CLAS_CRED.Control   := edDescClasCred;
end;//procedure

procedure TwCatClasCred.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;//procedure

procedure TwCatClasCred.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_CLAS_CRED.Control    := nil;
  Objeto.DESC_CLAS_CRED.Control   := nil;
end;//procedure

end.
