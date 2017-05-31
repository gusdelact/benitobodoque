// Sistema         : Clase de Grupos de Credito
// Fecha de Inicio : 23 de Marzo de 1998
// Función forma   : Clase de Grupos de Credito
// Desarrollo por  : Benjamín Hernández Delsordo
// Comentarios     :
unit IntCrGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun;

type

  TCrGrp = Class;
  TWCrGrp = class(TForm)
    InterForma1: TInterForma;
    lbCveGrupo: TLabel;
    edCveGrupo: TEdit;
    lbDescGrupo: TLabel;
    edDescGrupo: TEdit;
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
    Objeto : TCrGrp;
  end;

  TCrGrp = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
   CVE_GRUPO                  :TInterCampo;
   DESC_GRUPO                 :TInterCampo;
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

implementation

{$R *.DFM}

constructor TCrGrp.Create( AOwner : TComponent );
begin
   Inherited Create(AOwner);
   CVE_GRUPO                  :=CreaCampo('CVE_GRUPO',ftString,tsNinguno,tsNinguno,True);
      CVE_GRUPO.Size:=6;
   DESC_GRUPO                 :=CreaCampo('DESC_GRUPO',ftString,tsNinguno,tsNinguno,True);
   FKeyFields.Add('CVE_GRUPO');
   TableName := 'CRE_GRUPO_EMPR';
   UseQuery := True;
   HelpFile := 'IntCrGrp.hlp';
   ShowMenuReporte := False;
end;

destructor TCrGrp.Destroy;
begin
   inherited;
end;

function TCrGrp.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGrp;
begin
   W:=TWCrGrp.Create(Self);
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

Function TCrGrp.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntCrGrp.it','S,S');
   try
      if Active then T.Param(0,cve_grupo.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TCrGrp.Reporte:Boolean;
begin
// Aqui ejecutar el proceso del reporte
end;

(***********************************************FORMA TEMPLATE*******************)
(*                                                                              *)
(*  FORMA TEMPLATE                                                              *)
(*                                                                              *)
(***********************************************FORMA TEMPLATE*******************)

procedure TWCrGrp.FormShow(Sender: TObject);
begin
   Objeto.CVE_GRUPO.Control := edCveGrupo;
   Objeto.DESC_GRUPO.Control := edDescGrupo;
end;

procedure TWCrGrp.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_GRUPO.Control := nil;
   Objeto.DESC_GRUPO.Control := nil;
end;

procedure TWCrGrp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrGrp.InterForma1Nuevo(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Append;
   Realizado := True;
end;

procedure TWCrGrp.InterForma1Aceptar(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Post;
   Realizado := True;
end;

procedure TWCrGrp.InterForma1Cancelar(Sender: TObject; var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Cancel;
   Realizado := True;
end;

procedure TWCrGrp.InterForma1Eliminar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado:=False;
   Objeto.Delete;
   Realizado:=True;
end;

procedure TWCrGrp.InterForma1Buscar(Sender: TObject);
begin
   Objeto.Busca;
end;

procedure TWCrGrp.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Edit;
   Realizado := True;
end;

procedure TWCrGrp.InterForma1Ayuda(Sender: TObject);
begin
   Objeto.Help;
end;

procedure TWCrGrp.InterForma1DespuesNuevo(Sender: TObject);
begin
   edCveGrupo.SetFocus;
end;

procedure TWCrGrp.InterForma1DespuesModificar(Sender: TObject);
begin
   edDescGrupo.SetFocus;
end;

procedure TWCrGrp.BitBtn1Click(Sender: TObject);
begin
   Objeto.Reporte;
end;


end.



