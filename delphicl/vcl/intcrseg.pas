// Sistema         : Sistema Corporativo de Creditos
// Fecha de Inicio : 2 de Marzo de 1997
// Función forma   : Clase de Segmento CNBV, Sistema de Creditos
// Desarrollo por  : Benjamin Hernandez Delsordo
// Comentarios     :
unit IntCrSeg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun;

type

  TCrSeg = Class;
  TWCrSeg = class(TForm)
    InterForma1: TInterForma;
    lbCveSegmento: TLabel;
    edCveSegmento: TEdit;
    lbDescSegmento: TLabel;
    edDescSegmento: TEdit;
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
    Objeto : TCrSeg;
  end;

  TCrSeg = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
   CVE_SEGMENTO_CNBV                :TInterCampo;
   DESC_SEGMENTO               :TInterCampo;
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

implementation

{$R *.DFM}

constructor TCrSeg.Create( AOwner : TComponent );
begin
   Inherited Create(AOwner);
   CVE_SEGMENTO_CNBV                :=CreaCampo('CVE_SEGMENTO_CNBV',ftString,tsNinguno,tsNinguno,True);
      CVE_SEGMENTO_CNBV.Size:=6;
   DESC_SEGMENTO               :=CreaCampo('DESC_SEGMENTO',ftString,tsNinguno,tsNinguno,True);
   FKeyFields.Add('CVE_SEGMENTO_CNBV');
   TableName := 'CRE_SEGMENTO_CNBV';
   UseQuery := True;
   HelpFile := 'IntCrSeg.hlp';
   ShowMenuReporte := True;
end;

destructor TCrSeg.Destroy;
begin
   inherited;
end;

function TCrSeg.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrSeg;
begin
   W:=TWCrSeg.Create(Self);
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

Function TCrSeg.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntCrSeg.it','S,S');
   try
      if Active then T.Param(0,CVE_SEGMENTO_CNBV.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TCrSeg.Reporte:Boolean;
begin
// Aqui ejecutar el proceso del reporte
end;

procedure TWCrSeg.FormShow(Sender: TObject);
begin
   Objeto.CVE_SEGMENTO_CNBV.Control := edCveSegmento;
   Objeto.DESC_SEGMENTO.Control := edDescSegmento;
end;

procedure TWCrSeg.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_SEGMENTO_CNBV.Control := nil;
   Objeto.DESC_SEGMENTO.Control := nil;
end;

procedure TWCrSeg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrSeg.InterForma1Nuevo(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Append;
   Realizado := True;
end;

procedure TWCrSeg.InterForma1Aceptar(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Post;
   Realizado := True;
end;

procedure TWCrSeg.InterForma1Cancelar(Sender: TObject; var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Cancel;
   Realizado := True;
end;

procedure TWCrSeg.InterForma1Eliminar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado:=False;
   Objeto.Delete;
   Realizado:=True;
end;

procedure TWCrSeg.InterForma1Buscar(Sender: TObject);
begin
   Objeto.Busca;
end;

procedure TWCrSeg.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Edit;
   Realizado := True;
end;

procedure TWCrSeg.InterForma1Ayuda(Sender: TObject);
begin
   Objeto.Help;
end;

procedure TWCrSeg.InterForma1DespuesNuevo(Sender: TObject);
begin
   edCveSegmento.SetFocus;
end;

procedure TWCrSeg.InterForma1DespuesModificar(Sender: TObject);
begin
   edDescSegmento.SetFocus;
end;

procedure TWCrSeg.BitBtn1Click(Sender: TObject);
begin
   Objeto.Reporte;
end;


end.



