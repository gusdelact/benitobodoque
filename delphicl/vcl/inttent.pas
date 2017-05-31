// Sistema         : Clase de Tipos de Entidad
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Tipos de Entidad
// Desarrollo por  : Alberto Ramirez
// Comentarios     :
unit IntTEnt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, RepTEnt;

type

  TTipoEnt= Class;
  TWTipoEnt= class(TForm)
    InterForma1    : TInterForma;
    lbICveSemento: TLabel;
    EdCveTipoEntidad: TEdit;
    lbDescSegmento: TLabel;
    EdTipoEntidad: TEdit;
    btReporte: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btReporteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TipoEnt : TTipoEnt;
  end;

  TTipoEnt  = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
    Cve_Tipo_Entidad : TInterCampo;
    Desc_Tipo_Entid : TInterCampo;

    Function InternalBusca : Boolean; override;
    Function ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function  Reporte:Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
  published
  end;

implementation
{$R *.DFM}

constructor TTipoEnt.Create( AOwner : TComponent );
begin Inherited;
    Cve_Tipo_Entidad := CreaCampo('CVE_TIPO_ENTIDAD',ftString,tsNinguno,tsNinguno,True);
    Desc_Tipo_Entid := CreaCampo('DESC_TIPO_ENTID',ftString,tsNinguno,tsNinguno,True);
    FActive := False;
    FKeyFields.Add('CVE_TIPO_ENTIDAD');
    TableName := 'TIPO_ENTIDAD';
    UseQuery := True;
    HelpFile := 'IntTEnt.hlp';
    ShowMenuReporte:=True;
    IsCorp:=True;
end;

destructor TTipoEnt.Destroy;
begin inherited;
end;



Function TTipoEnt.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWTipoEnt;
begin
   W:=TWTipoEnt.Create(Self);
   try
      W.TipoEnt:= Self;
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

Function TTipoEnt.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T:=CreaBuscador('IntTEnt.it','S,S');
   try
      if Active then T.Param(0,Cve_Tipo_Entidad.AsString);
      if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TTipoEnt.Reporte:Boolean;
begin Execute_RepTipoEnt(True,Self);
end;

(***********************************************FORMA DE Tipo de Entidad*********)
(*                                                                              *)
(*  FORMA DE Tipo de Entidad                                                    *)
(*                                                                              *)
(***********************************************FORMA DE Tipo de Entidad*********)

procedure TWTipoEnt.FormShow(Sender: TObject);
begin
     TipoEnt.Cve_Tipo_Entidad.Control := EdCveTipoEntidad;
     TipoEnt.Desc_Tipo_Entid.Control := EdTipoEntidad;
end;

procedure TWTipoEnt.FormDestroy(Sender: TObject);
begin
     TipoEnt.Cve_Tipo_Entidad.Control := nil;
     TipoEnt.Desc_Tipo_Entid.Control := Nil;
end;


procedure TWTipoEnt.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;


procedure TWTipoEnt.InterForma1DespuesNuevo(Sender: TObject);
begin EdCveTipoEntidad.SetFocus;
end;

procedure TWTipoEnt.InterForma1DespuesModificar(Sender: TObject);
begin EdTipoEntidad.SetFocus;
end;

procedure TWTipoEnt.btReporteClick(Sender: TObject);
begin
  If TipoEnt.ValidaAccesoEsp('TENT_REPORTE',True,True) Then
  Begin
    TipoEnt.Reporte;
  End;
end;

end.



