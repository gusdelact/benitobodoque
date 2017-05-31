// Sistema         : Sistema Corporativo de Creditos
// Fecha de Inicio : 2 de Marzo de 1997
// Función forma   : Clase de Destino de Recursos, Sistema de Creditos
// Desarrollo por  : Benjamin Hernandez Delsordo
// Comentarios     :
unit IntCrDes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun;

type

  TCrDes = Class;
  TWCrDes = class(TForm)
    InterForma1: TInterForma;
    lbCveDestino: TLabel;
    edCveDestino: TEdit;
    lbDescDestino: TLabel;
    edDescDestino: TEdit;
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
    Objeto : TCrDes;
  end;

  TCrDes = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
   CVE_DESTINO                :TInterCampo;
   DESC_DESTINO               :TInterCampo;
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

implementation

{$R *.DFM}

constructor TCrDes.Create( AOwner : TComponent );
begin
   Inherited Create(AOwner);
   CVE_DESTINO                :=CreaCampo('CVE_DESTINO',ftString,tsNinguno,tsNinguno,True);
      CVE_DESTINO.Size:=6;
   DESC_DESTINO               :=CreaCampo('DESC_DESTINO',ftString,tsNinguno,tsNinguno,True);
   FKeyFields.Add('CVE_DESTINO');
   TableName := 'CRE_DESTINO';
   UseQuery := True;
   HelpFile := 'IntDestino.hlp';
   ShowMenuReporte := True;
end;

destructor TCrDes.Destroy;
begin
   inherited;
end;

function TCrDes.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrDes;
begin
   W:=TWCrDes.Create(Self);
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

Function TCrDes.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntCrDes.it','S,S');
   try
      if Active then T.Param(0,Cve_Destino.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TCrDes.Reporte:Boolean;
begin
// Aqui ejecutar el proceso del reporte
end;

procedure TWCrDes.FormShow(Sender: TObject);
begin
   Objeto.CVE_DESTINO.Control := edCveDestino;
   Objeto.DESC_DESTINO.Control := edDescDestino;
end;

procedure TWCrDes.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_DESTINO.Control := nil;
   Objeto.DESC_DESTINO.Control := nil;
end;

procedure TWCrDes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrDes.InterForma1Nuevo(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Append;
   Realizado := True;
end;

procedure TWCrDes.InterForma1Aceptar(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Post;
   Realizado := True;
end;

procedure TWCrDes.InterForma1Cancelar(Sender: TObject; var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Cancel;
   Realizado := True;
end;

procedure TWCrDes.InterForma1Eliminar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado:=False;
   Objeto.Delete;
   Realizado:=True;
end;

procedure TWCrDes.InterForma1Buscar(Sender: TObject);
begin
   Objeto.Busca;
end;

procedure TWCrDes.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Edit;
   Realizado := True;
end;

procedure TWCrDes.InterForma1Ayuda(Sender: TObject);
begin
   Objeto.Help;
end;

procedure TWCrDes.InterForma1DespuesNuevo(Sender: TObject);
begin
   edCveDestino.SetFocus;
end;

procedure TWCrDes.InterForma1DespuesModificar(Sender: TObject);
begin
   edDescDestino.SetFocus;
end;

procedure TWCrDes.BitBtn1Click(Sender: TObject);
begin
   Objeto.Reporte;
end;


end.



