// Sistema         : Clase de Segmentos
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Segmento
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :
unit IntSbSerFin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun;

type

  TSerFin= Class;
  TWSerFin= class(TForm)
    InterForma1    : TInterForma;
    lbICveSemento: TLabel;
    edCveSerFin: TEdit;
    lbDescSegmento: TLabel;
    edDescSerFin: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edFAlta: TEdit;
    Label2: TLabel;
    edCveUsuAlta: TEdit;
    edFModifica: TEdit;
    edCveUsuModif: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    rgSitSerFin: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TSerFin;
  end;

  TSerFin  = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
    CVE_SERVICIO_FIN : TInterCampo;
    DESC_SERVICIO_FIN : TInterCampo;
    SIT_SERVICIO_FIN   : TInterCampo;
    F_ALTA : TInterCampo;
    F_MODIFICACION : TInterCampo;
    CVE_USUARIO_MODIF : TInterCampo;
    CVE_USUARIO_ALTA : TInterCampo;

    Function InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    Function ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function  Reporte:Boolean; override;
  published
  end;

implementation

{$R *.DFM}

constructor TSerFin.Create( AOwner : TComponent );
begin Inherited;
    CVE_SERVICIO_FIN  := CreaCampo('CVE_SERVICIO_FIN',ftString,tsNinguno,tsNinguno,True);
    CVE_SERVICIO_FIN.Size := 6;
    DESC_SERVICIO_FIN := CreaCampo('DESC_SERVICIO_FIN',ftString,tsNinguno,tsNinguno,True);
    DESC_SERVICIO_FIN.Size := 100;
    SIT_SERVICIO_FIN  := CreaCampo('SIT_SERVICIO_FIN',ftString,tsNinguno,tsNinguno,True);
    With SIT_SERVICIO_FIN do
    Begin
    	Size := 2;
      UseCombo := True;
      ComboDatos.Add('AC');			ComboLista.Add('0');
      ComboDatos.Add('CA');			ComboLista.Add('1');
    end;
    F_ALTA            := CreaCampo('FH_ALTA',ftDate,tsNinguno,tsNinguno,True);
    F_MODIFICACION    := CreaCampo('FH_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
    CVE_USUARIO_MODIF := CreaCampo('CVE_USUARIO_MODI',ftString,tsNinguno,tsNinguno,True);;
    CVE_USUARIO_ALTA  := CreaCampo('CVE_USUARIO_ALTA',ftString,tsNinguno,tsNinguno,True);;;

    FActive := False;
    FKeyFields.Add('CVE_SERVICIO_FIN');
    TableName := 'SB_SERVICIO_FIN';
    UseQuery := True;
    ShowMenuReporte:=True;
    IsCorp:=True;
end;

destructor TSerFin.Destroy;
begin inherited;
end;

Function TSerFin.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWSerFin;
begin
   W:=TWSerFin.Create(Self);
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


Function TSerFin.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T:=CreaBuscador('IntSF.it','S,S,S');

   try
      if Active then T.Param(0,CVE_SERVICIO_FIN.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TSerFin.Reporte:Boolean;
begin //
end;


(***********************************************FORMA DE Requisito***************)
(*                                                                              *)
(*  FORMA DE Requisito                                                          *)
(*                                                                              *)
(***********************************************FORMA DE Requisito***************)

procedure TWSerFin.FormShow(Sender: TObject);
begin
  Objeto.CVE_SERVICIO_FIN.Control := edCveSerFin;
  Objeto.DESC_SERVICIO_FIN.Control := edDescSerFin;
  Objeto.SIT_SERVICIO_FIN.Control := rgSitSerFin;
  Objeto.F_ALTA.Control := edFAlta;
  Objeto.F_MODIFICACION.Control := edFModifica;
  Objeto.CVE_USUARIO_ALTA.Control := edCveUsuAlta;
  Objeto.CVE_USUARIO_MODIF.Control := edCveUsuModif;
end;

procedure TWSerFin.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_SERVICIO_FIN.Control := nil;
  Objeto.DESC_SERVICIO_FIN.Control := nil;
  Objeto.SIT_SERVICIO_FIN.Control := nil;
  Objeto.F_ALTA.Control := nil;
  Objeto.F_MODIFICACION.Control := nil;
  Objeto.CVE_USUARIO_ALTA.Control := nil;
  Objeto.CVE_USUARIO_MODIF.Control := nil;
end;


procedure TWSerFin.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;


procedure TWSerFin.InterForma1DespuesNuevo(Sender: TObject);
begin
  rgSiTSerFin.ItemIndex := 0;
  edFAlta.Text := DateToStr(Objeto.Apli.DameFechaEmpresa);
  edCveUsuAlta.text := Objeto.Apli.Usuario;
end;

procedure TWSerFin.InterForma1DespuesModificar(Sender: TObject);
begin
  edFModifica.Text := DateToStr(Objeto.Apli.DameFechaEmpresa);
  edCveUsuModif.text := Objeto.Apli.Usuario;
end;

end.



