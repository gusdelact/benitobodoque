// Sistema         : Clase de la tabla de Cre_Presupuesto
// Fecha de Inicio : 14 de Abril de 1998
// Función forma   : Clase Presupuesto
// Desarrollo por  : Rocío Berenice Muñoz Ríos
// Comentarios     : TCrPre
unit IntCrPre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, IntCrGpI;

type

  TCrPre = Class;
  TWCrPre = class(TForm)
    InterForma1: TInterForma;
    lbCve: TLabel;
    edCve: TEdit;
    lbDesc: TLabel;
    BitBtn1: TBitBtn;
    edDesc: TEdit;
    Label1: TLabel;
    sbGpo: TSpeedButton;
    edNbrGpI: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sbGpoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TCrPre;
  end;

  TCrPre = class(TInterFrame)
  private
  protected
  public
   CVE_PRESUPUESTO            :TInterCampo;
   DESC_PRESUPUESTO           :TInterCampo;
   CVE_GPO_INGRESO            : TInterCampo;
   Gpo                        : TCrGpI;

    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

implementation

{$R *.DFM}

constructor TCrPre.Create( AOwner : TComponent );
begin
   Inherited Create(AOwner);
   CVE_PRESUPUESTO            :=CreaCampo('CVE_PRESUPUESTO',ftString,tsNinguno,tsNinguno,True);
   CVE_PRESUPUESTO.Size:=6;
   DESC_PRESUPUESTO           :=CreaCampo('DESC_PRESUPUESTO',ftString,tsNinguno,tsNinguno,True);
   DESC_PRESUPUESTO.Caption := 'Mercado Objetivo';
   CVE_GPO_INGRESO:=CreaCampo('CVE_GPO_INGRESO',ftString,tsNinguno,tsNinguno,True);

   FKeyFields.Add('CVE_PRESUPUESTO');
   TableName := 'CRE_PRESUPUESTO';
   UseQuery := True;
   HelpFile := 'IntTCrPre.hlp';
   ShowMenuReporte := True;

  Gpo:= TCrGpI.Create(Self);
  Gpo.MasterSource := Self;
  Gpo.FieldByName('CVE_GPO_INGRESO').MasterField := 'CVE_GPO_INGRESO';
end;

destructor TCrPre.Destroy;
begin
   inherited;
end;

function TCrPre.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrPre;
begin
   W:=TWCrPre.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame := Self;
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

Function TCrPre.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntCrPre.it','S');
   try
      if Active then T.Param(0,cve_presupuesto.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TCrPre.Reporte:Boolean;
begin
// Aqui ejecutar el proceso del reporte
end;

(***********************************************FORMA TEMPLATE*******************)
(*                                                                              *)
(*  FORMA TEMPLATE                                                              *)
(*                                                                              *)
(***********************************************FORMA TEMPLATE*******************)

procedure TWCrPre.FormShow(Sender: TObject);
begin
   Objeto.cve_presupuesto.Control := edCve;
   Objeto.desc_presupuesto.Control := edDesc;
  Objeto.Gpo.DESC_CARTERA.Control := edNbrGpI;
  Objeto.Gpo.MasterSourceEditControl := sbGpo;
end;

procedure TWCrPre.FormDestroy(Sender: TObject);
begin
  Objeto.cve_presupuesto.Control := nil;
  Objeto.desc_presupuesto.Control := nil;
  Objeto.Gpo.DESC_CARTERA.Control := nil;
  Objeto.Gpo.MasterSourceEditControl := nil;
end;

procedure TWCrPre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrPre.InterForma1DespuesNuevo(Sender: TObject);
begin
   edCve.SetFocus;
end;

procedure TWCrPre.InterForma1DespuesModificar(Sender: TObject);
begin
   edDesc.SetFocus;
end;

procedure TWCrPre.BitBtn1Click(Sender: TObject);
begin
   Objeto.Reporte;
end;

procedure TWCrPre.sbGpoClick(Sender: TObject);
begin
  Objeto.Gpo.Busca;
end;

end.



