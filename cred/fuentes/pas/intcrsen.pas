// Sistema         : Clase de Claves de Senicreb
// Fecha de Inicio : 10 de Junio de 1999
// Función forma   : Clase de Senicreb de Credito
// Desarrollo por  : Rocío Berenice Muñoz Ríos
// Comentarios     :
unit intcrSen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun;

type

  TCrSen = Class;
  TWCrSen = class(TForm)
    InterForma1: TInterForma;
    lbCveSen: TLabel;
    edCveSen: TEdit;
    lbDescSen: TLabel;
    edDescSen: TEdit;
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
    Objeto : TCrSen;
  end;

  TCrSen = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
   CVE_SENICREB                  :TInterCampo;
   DESC_SENICREB                 :TInterCampo;
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

implementation

{$R *.DFM}

constructor TCrSen.Create( AOwner : TComponent );
begin
   Inherited Create(AOwner);
   CVE_SENICREB                  :=CreaCampo('CVE_SENICREB',ftString,tsNinguno,tsNinguno,True);
   CVE_SENICREB.Size:=11;
   DESC_SENICREB                 :=CreaCampo('DESC_SENICREB',ftString,tsNinguno,tsNinguno,True);
   FKeyFields.Add('CVE_SENICREB');
   TableName := 'CRE_SENICREB';
   UseQuery := True;
   HelpFile := 'IntCrSen.hlp';
   ShowMenuReporte := False;
end;

destructor TCrSen.Destroy;
begin
   inherited;
end;

function TCrSen.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrSen;
begin
   W:=TWCrSen.Create(Self);
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

Function TCrSen.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ICrSen.it','S,S');
   try
      if Active then T.Param(0,cve_senicreb.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TCrSen.Reporte:Boolean;
begin
// Aqui ejecutar el proceso del reporte
end;

(***********************************************FORMA TEMPLATE*******************)
(*                                                                              *)
(*  FORMA TEMPLATE                                                              *)
(*                                                                              *)
(***********************************************FORMA TEMPLATE*******************)

procedure TWCrSen.FormShow(Sender: TObject);
begin
   Objeto.CVE_SENICREB.Control := edCveSen;
   Objeto.DESC_SENICREB.Control := edDescSen;
end;

procedure TWCrSen.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_SENICREB.Control := nil;
   Objeto.DESC_SENICREB.Control := nil;
end;

procedure TWCrSen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrSen.InterForma1Nuevo(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Append;
   Realizado := True;
end;

procedure TWCrSen.InterForma1Aceptar(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Post;
   Realizado := True;
end;

procedure TWCrSen.InterForma1Cancelar(Sender: TObject; var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Cancel;
   Realizado := True;
end;

procedure TWCrSen.InterForma1Eliminar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado:=False;
   Objeto.Delete;
   Realizado:=True;
end;

procedure TWCrSen.InterForma1Buscar(Sender: TObject);
begin
   Objeto.Busca;
end;

procedure TWCrSen.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Edit;
   Realizado := True;
end;

procedure TWCrSen.InterForma1Ayuda(Sender: TObject);
begin
   Objeto.Help;
end;

procedure TWCrSen.InterForma1DespuesNuevo(Sender: TObject);
begin
   edCveSen.SetFocus;
end;

procedure TWCrSen.InterForma1DespuesModificar(Sender: TObject);
begin
   edDescSen.SetFocus;
end;

procedure TWCrSen.BitBtn1Click(Sender: TObject);
begin
   Objeto.Reporte;
end;


end.



