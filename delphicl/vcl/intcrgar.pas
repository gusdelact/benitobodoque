// Sistema         : Clase de Garantia, Sistema Corporativo de Creditos
// Fecha de Inicio : 2 de Marzo de 1998
// Función forma   : Clase de Garantia
// Desarrollo por  : Benjamín Hernández Delsordo
// Comentarios     :
unit InTCrGar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun;

type

  TCrGar = Class;
  TWCrGar = class(TForm)
    InterForma1: TInterForma;
    lbCveGarantia: TLabel;
    edCveGarantia: TEdit;
    lbDescgarantia: TLabel;
    edDescGarantia: TEdit;
    edTipoGarantia: TEdit;
    lbTipoGarantia: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Nuevo(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Aceptar(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Cancelar(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Eliminar(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Buscar(Sender : TObject);
    procedure InterForma1Modificar(Sender : TObject;
      var Realizado : Boolean);
    procedure InterForma1Ayuda(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TCrGar;
  end;

  TCrGar = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
   CVE_GARANTIA               :TInterCampo;
   DESC_GARANTIA              :TInterCampo;
   TIPO_GARANTIA              :TInterCampo;
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

implementation

{$R *.DFM}

constructor TCrGar.Create( AOwner : TComponent );
begin
   Inherited Create(AOwner);
   CVE_GARANTIA               :=CreaCampo('CVE_GARANTIA',ftString,tsNinguno,tsNinguno,True);
      CVE_GARANTIA.Size:=8;
   DESC_GARANTIA              :=CreaCampo('DESC_GARANTIA',ftString,tsNinguno,tsNinguno,True);
   TIPO_GARANTIA              :=CreaCampo('TIPO_GARANTIA',ftInteger,tsNinguno,tsNinguno,True);
   FKeyFields.Add('CVE_GARANTIA');
   TableName := 'CRE_GARANTIA';
   UseQuery := True;
   HelpFile := 'IntGar.hlp';
   ShowMenuReporte := True;
end;

destructor TCrGar.Destroy;
begin
   inherited;
end;

function TCrGar.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGar;
begin
   W:=TWCrGar.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TCrGar.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntCrGar.it','S,S');
   try
      if Active then T.Param(0,CVE_GARANTIA.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TCrGar.Reporte:Boolean;
begin
  result := true;
end;

(***********************************************FORMA TEMPLATE*******************)

procedure TWCrGar.FormShow(Sender: TObject);
begin
   Objeto.CVE_GARANTIA.Control := edCveGarantia;
   Objeto.DESC_GARANTIA.Control := edDescGarantia;
   Objeto.TIPO_GARANTIA.Control := edTipoGarantia;
end;

procedure TWCrGar.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_GARANTIA.Control := nil;
   Objeto.DESC_GARANTIA.Control := nil;
   Objeto.TIPO_GARANTIA.Control := nil;
end;

procedure TWCrGar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrGar.InterForma1Nuevo(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Append;
   Realizado := True;
end;

procedure TWCrGar.InterForma1Aceptar(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Post;
   Realizado := True;
end;

procedure TWCrGar.InterForma1Cancelar(Sender: TObject; var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Cancel;
   Realizado := True;
end;

procedure TWCrGar.InterForma1Eliminar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado:=False;
   Objeto.Delete;
   Realizado:=True;
end;

procedure TWCrGar.InterForma1Buscar(Sender: TObject);
begin
   Objeto.Busca;
end;

procedure TWCrGar.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Edit;
   Realizado := True;
end;

procedure TWCrGar.InterForma1Ayuda(Sender: TObject);
begin
   Objeto.Help;
end;

procedure TWCrGar.InterForma1DespuesNuevo(Sender: TObject);
begin
   edCveGarantia.SetFocus;
end;

procedure TWCrGar.InterForma1DespuesModificar(Sender: TObject);
begin
   edDescGarantia.SetFocus;
end;

procedure TWCrGar.BitBtn1Click(Sender: TObject);
begin
   Objeto.Reporte;
end;


end.



