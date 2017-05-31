{ MAGV 2009-09-25
  Clase para manejar el catálogo de Clasificación legal
}
unit IntCatClasLegal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit;

type
  TCatClasLegal = class;

  TwCatClasLegal = class(TForm)
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
    Objeto : TCatClasLegal;
  end;

  TCatClasLegal = class(TInterFrame)
  private
  protected
  public
    CVE_CLAS_LEGAL    : TInterCampo;
    DESC_CLAS_LEGAL   : TInterCampo;
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
    procedure   DataBaseChange; override;
    function    InternalBusca : Boolean; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;

var
  wCatClasLegal: TwCatClasLegal;

implementation

{$R *.DFM}

constructor TCatClasLegal.Create( AOwner : TComponent );
begin
  Inherited;
  CVE_CLAS_LEGAL := CreaCampo('CVE_CLAS_LEGAL',ftString,tsNinguno,tsNinguno,True);
  CVE_CLAS_LEGAL.Size := 10;
  CVE_CLAS_LEGAL.Caption:='Clave Solicitud';
  DESC_CLAS_LEGAL := CreaCampo('DESC_CLAS_LEGAL',ftString,tsNinguno,tsNinguno,True);
  DESC_CLAS_LEGAL.Size := 30;
  DESC_CLAS_LEGAL.Caption := 'Descripción de la solicitud';
  FKeyFields.Add('CVE_CLAS_LEGAL');
  TableName := 'CR_CLAS_LEGAL';
  UseQuery := True;
  ShowMenuReporte:=False;
end;//Constructor

Destructor TCatClasLegal.Destroy;
begin
  inherited;
end;//Destructor

procedure TCatClasLegal.DataBaseChange;
begin
  inherited;
end;//procedure

function TCatClasLegal.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TwCatClasLegal;
begin
  W := TwCatClasLegal.Create(Self);
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

Function TCatClasLegal.InternalBusca:Boolean;
Var
   T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICatClasLegal.it','S');
  Try
    if Active then
       T.Param(0,CVE_CLAS_LEGAL.AsString);
    if T.Execute then
       InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;//Try & Finally
end;//Function

procedure TwCatClasLegal.FormShow(Sender: TObject);
begin
  Objeto.CVE_CLAS_LEGAL.Control    := edCveClasLegal;
  Objeto.DESC_CLAS_LEGAL.Control   := edDescClasLegal;
end;//procedure

procedure TwCatClasLegal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;//procedure

procedure TwCatClasLegal.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_CLAS_LEGAL.Control    := nil;
  Objeto.DESC_CLAS_LEGAL.Control   := nil;
end;//procedure

end.
