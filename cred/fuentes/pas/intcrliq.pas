// Sistema         : Clase de Liquidacion de Credito
// Fecha de Inicio : 14 de Abril de 1997
// Función forma   : Clase de Liquidacion de credito
// Desarrollo por  : Benjamin Hernandez Delsordo
// Comentarios     :
unit IntCrLiq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun;

type

  TCrLiq = Class;
  TWCrLiq = class(TForm)
    InterForma1: TInterForma;
    lbCveLiquidacion: TLabel;
    edCveLiquidacion: TEdit;
    lbDescLiquidacion: TLabel;
    BitBtn1: TBitBtn;
    edDescLiquidacion: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TCrLiq;
  end;

  TCrLiq = class(TInterFrame)
  private
  protected
  public
   CVE_LIQUIDACION            :TInterCampo;
   DESC_LIQUIDACION           :TInterCampo;
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

implementation

{$R *.DFM}

constructor TCrLiq.Create( AOwner : TComponent );
begin
   Inherited Create(AOwner);
   CVE_LIQUIDACION            :=CreaCampo('CVE_LIQUIDACION',ftString,tsNinguno,tsNinguno,True);
      CVE_LIQUIDACION.Size:=2;
   DESC_LIQUIDACION           :=CreaCampo('DESC_LIQUIDACION',ftString,tsNinguno,tsNinguno,True);

   FKeyFields.Add('CVE_LIQUIDACION');
   TableName := 'CRE_LIQUIDACION';
   UseQuery := True;
   HelpFile := 'IntCrLiq.hlp';
   ShowMenuReporte := True;
end;

destructor TCrLiq.Destroy;
begin
   inherited;
end;

function TCrLiq.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrLiq;
begin
   W:=TWCrLiq.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:=Self;
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

Function TCrLiq.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntCrLiq.it','S');
   try
      if Active then T.Param(0,CVE_LIQUIDACION.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TCrLiq.Reporte:Boolean;
begin
end;

(***********************************************FORMA TEMPLATE*******************)
(*                                                                              *)
(*  FORMA TEMPLATE                                                              *)
(*                                                                              *)
(***********************************************FORMA TEMPLATE*******************)

procedure TWCrLiq.FormShow(Sender: TObject);
begin
  Objeto.CVE_LIQUIDACION.Control := edCveLiquidacion;
  Objeto.DESC_LIQUIDACION.Control := edDescLiquidacion;
end;

procedure TWCrLiq.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_LIQUIDACION.Control := nil;
  Objeto.DESC_LIQUIDACION.Control := nil;
end;

procedure TWCrLiq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrLiq.InterForma1Buscar(Sender: TObject);
begin
   Objeto.Busca;
end;

procedure TWCrLiq.InterForma1DespuesNuevo(Sender: TObject);
begin
  edCveLiquidacion.SetFocus;
end;

procedure TWCrLiq.InterForma1DespuesModificar(Sender: TObject);
begin
  edDescLiquidacion.SetFocus;
end;

procedure TWCrLiq.BitBtn1Click(Sender: TObject);
begin
   Objeto.Reporte;
end;


end.



