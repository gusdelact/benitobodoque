// Sistema         : Clase de
// Fecha de Inicio :
// Función forma   : Clase
// Desarrollo por  :
// Comentarios     :
unit InTCrOri;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun;

type

  TCrOri = Class;
  TWCrOri = class(TForm)
    InterForma1: TInterForma;
    lbCveOrigenRec: TLabel;
    edCveOrigenRec: TEdit;
    lbDescOrigenRec: TLabel;
    edDescOrigenRec: TEdit;
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
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TCrOri;
  end;

  TCrOri = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
   CVE_ORIGEN_REC             :TInterCampo;
   DESC_ORIGEN_REC            :TInterCampo;
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

implementation

{$R *.DFM}

constructor TCrOri.Create( AOwner : TComponent );
begin
   Inherited Create(AOwner);
   CVE_ORIGEN_REC             :=CreaCampo('CVE_ORIGEN_REC',ftString,tsNinguno,tsNinguno,True);
      CVE_ORIGEN_REC.Size:=6;
   DESC_ORIGEN_REC            :=CreaCampo('DESC_ORIGEN_REC',ftString,tsNinguno,tsNinguno,True);
   FKeyFields.Add('CVE_ORIGEN_REC');
   TableName := 'CRE_ORIGEN_REC';
   UseQuery := True;
   HelpFile := 'IntCrOri.hlp';
   ShowMenuReporte := True;
end;

destructor TCrOri.Destroy;
begin
   inherited;
end;

function TCrOri.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrOri;
begin
   W:=TWCrOri.Create(Self);
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

Function TCrOri.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntCrOri.it','S,S');
   try
      if Active then T.Param(0,CVE_ORIGEN_REC.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TCrOri.Reporte:Boolean;
begin
// Aqui ejecutar el proceso del reporte
end;

(***********************************************FORMA TEMPLATE*******************)
(*                                                                              *)
(*  FORMA TEMPLATE                                                              *)
(*                                                                              *)
(***********************************************FORMA TEMPLATE*******************)

procedure TWCrOri.FormShow(Sender: TObject);
begin
   Objeto.CVE_ORIGEN_REC.Control := edCveOrigenRec;
   Objeto.DESC_ORIGEN_REC.Control := edDescOrigenRec;
end;

procedure TWCrOri.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_ORIGEN_REC.Control := nil;
   Objeto.DESC_ORIGEN_REC.Control := nil;
end;

procedure TWCrOri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrOri.InterForma1Nuevo(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Append;
   Realizado := True;
end;

procedure TWCrOri.InterForma1Aceptar(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Post;
   Realizado := True;
end;

procedure TWCrOri.InterForma1Cancelar(Sender: TObject; var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Cancel;
   Realizado := True;
end;

procedure TWCrOri.InterForma1Eliminar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado:=False;
   Objeto.Delete;
   Realizado:=True;
end;

procedure TWCrOri.InterForma1Buscar(Sender: TObject);
begin
   Objeto.Busca;
end;

procedure TWCrOri.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Edit;
   Realizado := True;
end;

procedure TWCrOri.InterForma1Ayuda(Sender: TObject);
begin
   Objeto.Help;
end;

procedure TWCrOri.InterForma1DespuesNuevo(Sender: TObject);
begin
   edCveOrigenRec.SetFocus;
end;

procedure TWCrOri.InterForma1DespuesModificar(Sender: TObject);
begin
   edDescOrigenRec.SetFocus;
end;

end.



