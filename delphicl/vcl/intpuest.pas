// Sistema         : Clase de Puesto
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Puesto
// Desarrollo por  : Alberto Ramirez
// Comentarios     :
unit IntPuest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntFrm,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind, UnSQL2, InterFun;

type
  TPuesto = Class;
  TWPuesto = class(TForm)
    InterForma1    : TInterForma;
    Label1: TLabel;
    Label2: TLabel;
    EdCvePuesto: TEdit;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    edNombrePuesto: TEdit;
    EdDescPuesto: TMemo;
    Label4: TLabel;
    edNivel: TEdit;
    edCveGraddir: TEdit;
    Label5: TLabel;
    rgClasificacion: TRadioGroup;
    cbSap: TCheckBox;
    cbBAutCtte: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
  public
    Puest : TPuesto;
  end;

  TPuesto = class(TInterFrame)
  private
  protected
  public
    Cve_Puesto    : TInterCampo;
    Desc_Puesto   : TInterCampo;
    Nombre_Puesto : TInterCampo;
    Nivel         : TInterCampo;
    CVE_VALUACION : TInterCampo;
    CLASIFICACION : TInterCampo;
    B_SEGURO_AP   : TInterCampo;
    B_AUT_CTTE    : TInterCampo; // CZR 11-sep-2013

    function InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    function ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function  Reporte:Boolean; override;
  published
  end;

implementation
uses
   RepPuest;
{$R *.DFM}

constructor TPuesto.Create(AOwner: TComponent);
begin
   Inherited;
   Cve_Puesto := CreaCampo('CVE_PUESTO',ftString,tsNinguno,tsNinguno,True);
   Desc_Puesto := CreaCampo('DESC_PUESTO',ftString,tsNinguno,tsNinguno,True);
   Nombre_Puesto := CreaCampo('NOMBRE_PUESTO',ftString,tsNinguno,tsNinguno,True);
   Nivel         := CreaCampo('NIVEL',ftString,tsNinguno,tsNinguno,True);
   CVE_VALUACION := CreaCampo('CVE_VALUACION',ftString,tsNinguno,tsNinguno,True);
   CLASIFICACION := CreaCampo('CLASIFICACION',ftString,tsNinguno,tsNinguno,True);
   With CLASIFICACION do
   begin Size:=1;
       	UseCombo:=True;
        ComboLista.Add('0');	ComboDatos.Add('T');
       	ComboLista.Add('1');	ComboDatos.Add('G');
	ComboLista.Add('2');	ComboDatos.Add('D');
   end;

   B_SEGURO_AP := CreaCampo('B_SEGURO_AP',ftString,tsNinguno,tsNinguno,True);
   B_AUT_CTTE  := CreaCampo('B_AUT_CTTE', ftString,tsNinguno,tsNinguno,True); // CZR 11-sep-2013

   FActive := False;
   FKeyFields.Add('CVE_PUESTO');
   TableName := 'PUESTO';
   UseQuery := True;
   HelpFile := 'IntPuest.hlp';
   ShowMenuReporte:=True;
   IsCorp:=True;
end;

destructor TPuesto.Destroy;
begin
   inherited;
end;

Function TPuesto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWPuesto;
begin
   W:=TWPuesto.Create(Self);
   try
      W.Puest:= Self;
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

Function TPuesto.InternalBusca:Boolean;
Var T:TInterFindit;
begin
  InternalBusca := False;
  T:=CreaBuscador('IntPuest.it','S,S');
  try
     if T.Execute then
        InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;

function TPuesto.Reporte:Boolean;
begin
   Execute_RepPuest(True,Self);
end;

procedure TWPuesto.FormShow(Sender: TObject);
begin
   Puest.Cve_Puesto.Control    := EdCvePuesto;
   Puest.Desc_Puesto.Control   := EdDescPuesto;
   Puest.Nombre_Puesto.Control := EdNombrePuesto;
   Puest.Nivel.Control         := edNivel;
   Puest.CVE_VALUACION.Control := edCveGraddir;
   Puest.CLASIFICACION.Control := rgClasificacion;
   Puest.B_SEGURO_AP.Control   := cbSap;
   Puest.B_AUT_CTTE.Control    := cbBAutCtte; // CZR 11-sep-2013
end;

procedure TWPuesto.FormDestroy(Sender: TObject);
begin
   Puest.Cve_Puesto.Control    := nil;
   Puest.Desc_Puesto.Control   := nil;
   Puest.Nombre_Puesto.Control := nil;
   Puest.Nivel.Control         := nil;
   Puest.CVE_VALUACION.Control := nil;
   Puest.CLASIFICACION.Control := nil;
   Puest.B_SEGURO_AP.Control   := nil;
   Puest.B_AUT_CTTE.Control    := nil; // CZR 11-sep-2013
end;

procedure TWPuesto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWPuesto.InterForma1DespuesNuevo(Sender: TObject);
begin
   EdCvePuesto.SetFocus;
end;

procedure TWPuesto.InterForma1DespuesModificar(Sender: TObject);
begin
   EdDescPuesto.SetFocus;
end;

procedure TWPuesto.BitBtn1Click(Sender: TObject);
begin
   Puest.Reporte;
end;

procedure TWPuesto.Button1Click(Sender: TObject);
begin
  Execute_RepPuest(False,Puest);
end;
end.
