// Sistema         : Clase de DIRECCION
// Fecha de Inicio : 29/03/2001
// Función forma   : Clase de DIRECCION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Jose Armando Garcia Estrada
// Comentarios     :
Unit IntDireccion;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
  TDireccion = class;

  TWDireccion=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_DIRECCION : TLabel;
    edCVE_DIRECCION : TEdit;
    lbDESC_L_ID_PRIM : TLabel;
    edDESC_L_ID_PRIM : TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TDireccion;
  end;

  TDireccion= class(TInterFrame)
  private
  protected
  public
    { Public declarations }
    Cve_Direccion: TInterCampo;
    Desc_L_Id_Prim: TInterCampo;
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TDireccion.Create( AOwner : TComponent );
begin
  Inherited;
  Cve_Direccion:= CreaCampo('CVE_DIRECCION',ftString,tsNinguno,tsNinguno,True);
    Cve_Direccion.Caption:= 'Clave de Dirección';
    Cve_Direccion.IsRequiered:= True;
  DESC_L_ID_PRIM :=CreaCampo('DESC_L_ID_PRIM',ftString,tsNinguno,tsNinguno,True);
    Desc_L_Id_Prim.Caption:='Descripción';
    Desc_L_Id_Prim.IsRequiered:= True;

  FKeyFields.Add('CVE_DIRECCION');

  TableName := 'DIRECCION';
  UseQuery := True;
  HelpFile := 'IntDireccion.Hlp';
  ShowMenuReporte:= False;
end;

Destructor TDireccion.Destroy;
Begin inherited;
end;


function TDireccion.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W: TWDireccion;
begin
  W:= TWDireccion.Create(Self);
  Try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.ShowBtnAyuda:= False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  Finally
    W.Free;
  end;
end;


Function TDireccion.InternalBusca:Boolean;
Var T:TInterFindit;
begin
  InternalBusca := False;
  T:= CreaBuscador('IDirecci.it','S');
  Try
    if Active then
      T.Param(0,CVE_DIRECCION.AsString);

    if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
  Finally  T.Free;
  end;
end;

function TDireccion.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA DIRECCION********************)
(*                                                                              *)
(*  FORMA DE DIRECCION                                                            *)
(*                                                                              *)
(***********************************************FORMA DIRECCION********************)

procedure TWDireccion.FormShow(Sender: TObject);
begin
  Objeto.CVE_DIRECCION.Control:=edCVE_DIRECCION;
  Objeto.DESC_L_ID_PRIM.Control:=edDESC_L_ID_PRIM;
end;

procedure TWDireccion.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_DIRECCION.Control:=nil;
  Objeto.DESC_L_ID_PRIM.Control:=nil;
end;

procedure TWDireccion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWDireccion.InterForma1DespuesNuevo(Sender: TObject);
begin edCVE_DIRECCION.SetFocus;
end;

procedure TWDireccion.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_L_ID_PRIM.SetFocus;
end;

end.
