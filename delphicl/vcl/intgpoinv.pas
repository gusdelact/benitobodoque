// Sistema         : Clase de Grupos de Inversionistas
// Fecha de Inicio :
// Función forma   : Clase
// Desarrollo por  : Armando Garcia
// Comentarios     :
unit IntGpoInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun;

type

  tGrupoInv = Class;
  TWGrpoInv = class(TForm)
    InterForma1: TInterForma;
    lbCve: TLabel;
    edCve: TEdit;
    lbDesc: TLabel;
    BitBtn1: TBitBtn;
    edDesc: TEdit;
    edFechaAlta: TEdit;
    lbFechaAlta: TLabel;
    edSaldo: TEdit;
    lbSaldo: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Aceptar(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : tGrupoInv;
  end;

  tGrupoInv = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
{ Definición de los Campos de la Clase INV_GRUPO}
{ Macv Generador Automático de Sp}
   FOLIO_GRUPO                :TInterCampo;
   F_ALTA                     :TInterCampo;
   DESC_GRUPO                 :TInterCampo;
   IMP_GRUPO                  :TInterCampo;
   IMP_PROMGPO_REAL           :TInterCampo;
   IMP_PROMGPO_VIRT           :TInterCampo;
   IMP_PROMGPO_IMES           :TInterCampo;

{ Creación de Campos  de INV_GRUPO}
{ Macv Generador Automático de Sp}
{   //  Código para Stored Procedures
    CodResp   : TInterCampo;
}
    function    InternalBusca : Boolean; override;
    function    InternalPost : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
//    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

implementation

{$R *.DFM}

constructor tGrupoInv.Create( AOwner : TComponent );
var p_tipo : tInterCampo;
begin
   Inherited Create(AOwner);
   FOLIO_GRUPO      := CreaCampo('FOLIO_GRUPO',ftInteger,tsNinguno,tsProc1,True);
   FOLIO_GRUPO.Size := 10;
   FOLIO_GRUPO.Parametro := 'P_FOLIO_TRN';
   DESC_GRUPO       := CreaCampo('DESC_GRUPO',ftString,tsNinguno,tsNinguno,True);
   F_ALTA           := CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
   IMP_GRUPO        := CreaCampo('IMP_GRUPO',ftfloat,tsNinguno,tsNinguno,True);
   IMP_PROMGPO_REAL := CreaCampo('IMP_PROMGPO_REAL',ftfloat,tsNinguno,tsNinguno,True);
   IMP_PROMGPO_VIRT := CreaCampo('IMP_PROMGPO_VIRT',ftfloat,tsNinguno,tsNinguno,True);
   IMP_PROMGPO_IMES := CreaCampo('IMP_PROMGPO_IMES',ftfloat,tsNinguno,tsNinguno,True);
   P_Tipo           := CreaCampo('TIPO',ftString,tsProc1,tsNinguno,False);
   P_Tipo.Parametro := 'P_TIPO';
   FKeyFields.Add('FOLIO_GRUPO');
   TableName        := 'INV_GRUPO';
   UseQuery         := True;
   HelpFile         := 'IntTemp.hlp';
   ShowMenuReporte  := True;

end;

(*
destructor tGrupoInv.Destroy;
begin inherited Destroy;
end;
*)

function tGrupoInv.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : twGrpoInv;
begin
   W:=twGrpoInv.Create(Self);
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

Function tGrupoInv.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntGPOS.it','S,S');
   try
      if Active then T.Param(0,FOLIO_GRUPO.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function tGrupoInv.InternalPost:Boolean;
var S:tStoredProc;
begin
  InternalPost:= False;
  if Modo = moAppend then
  begin
    S:= stpPrepara('STPINCIN',tsProc1);
    stpEjecuta(S,tsproc1);
  end;
  InternalPost:= Inherited InternalPost;
end;

function tGrupoInv.Reporte:Boolean;
begin
// Aqui ejecutar el proceso del reporte
end;

(***********************************************FORMA TEMPLATE*******************)
(*                                                                              *)
(*  FORMA TEMPLATE                                                              *)
(*                                                                              *)
(***********************************************FORMA TEMPLATE*******************)

procedure TWGrpoInv.FormShow(Sender: TObject);
begin
   Objeto.FOLIO_GRUPO.Control := edCve;
   Objeto.DESC_GRUPO.Control := edDesc;
   Objeto.F_ALTA.Control := edFechaAlta;
   Objeto.IMP_GRUPO.Control := edSaldo;
end;

procedure TWGrpoInv.FormDestroy(Sender: TObject);
begin
   Objeto.FOLIO_GRUPO.Control := nil;
   Objeto.DESC_GRUPO.Control := nil;
   Objeto.F_ALTA.Control := nil;
end;

procedure TWGrpoInv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWGrpoInv.InterForma1Aceptar(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado                       := False;
   Objeto.F_ALTA.AsDateTime        := Trunc(Now);
   Objeto.FOLIO_GRUPO.asInteger    := 87;
   Objeto.IMP_GRUPO.asFloat        := 0;
   Objeto.IMP_PROMGPO_REAL.asFloat := 0.0;
   Objeto.IMP_PROMGPO_VIRT.asFloat := 0.0;
   Objeto.IMP_PROMGPO_IMES.asFloat := 0.0;
   Objeto.Post;
   Realizado := True;
end;

procedure TWGrpoInv.InterForma1DespuesNuevo(Sender: TObject);
begin edDesc.SetFocus;
end;

procedure TWGrpoInv.InterForma1DespuesModificar(Sender: TObject);
begin edDesc.SetFocus;
end;

procedure TWGrpoInv.BitBtn1Click(Sender: TObject);
begin Objeto.Reporte;
end;

end.



