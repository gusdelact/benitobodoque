// Sistema         : Clase de Plaza Banxico
// Fecha de Inicio : Enero 2001
// Desarrollo por  : Rocío Berenice Muñoz Ríos
// Comentarios     :
unit IntPzaBan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

type

  TPzaBanx = Class;
  TWPzaBanx = class(TForm)
    InterForma1    : TInterForma;
    lbCveMoneda: TLabel;
    edIdPlaza: TEdit;
    lbDescMoneda: TLabel;
    edNomPlaza: TEdit;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    lbFUltRevMon: TLabel;
    edFAlta: TEdit;
    edFBaja: TEdit;
    lbFProxRevMon: TLabel;
    MacvDatePicker1: MacvDatePicker;
    MacvDatePicker2: MacvDatePicker;
    rgSitPlaza: TRadioGroup;
    Label1: TLabel;
    edCvePoblacion: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TPzaBanx;
  end;

  TPzaBanx = class(TInterFrame)
  private
  protected
//  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    { Public declarations }
   NUM_PLAZA                  :TInterCampo;
   F_ALTA                     :TInterCampo;
   F_BAJA                     :TInterCampo;
   NOM_PLAZA                  :TInterCampo;
   SIT_PLAZA                  :TInterCampo;
   CVE_POBLACION              :TInterCampo;

    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

implementation

Uses RepPzaCo;
{$R *.DFM}

constructor TPzaBanx.Create( AOwner : TComponent );
begin
   Inherited;
   NUM_PLAZA     :=CreaCampo('NUM_PLAZA',ftInteger,tsNinguno,tsNinguno,True);
   NUM_PLAZA.Size:=5;
   F_ALTA       :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
   F_BAJA       :=CreaCampo('F_BAJA',ftDate,tsNinguno,tsNinguno,True);
   NOM_PLAZA    :=CreaCampo('NOM_PLAZA',ftString,tsNinguno,tsNinguno,True);
   CVE_POBLACION:=CreaCampo('CVE_POBLACION',ftString,tsNinguno,tsNinguno,True);

   SIT_PLAZA:=CreaCampo('SIT_PLAZA',ftString,tsNinguno,tsNinguno,True);
   With SIT_PLAZA do
   begin
      Size := 2;
      UseCombo := True;
      ComboLista.Add('0');		ComboDatos.Add('AC');
      ComboLista.Add('1');		ComboDatos.Add('IN');
   end;

   FActive := False;
   FKeyFields.Add('NUM_PLAZA');
   TableName := 'SPEU_PZA_BANXICO';
   UseQuery := True;
   HelpFile := 'IntPzaBa.hlp';
   ShowMenuReporte:=True;
   IsCorp:=True;
end;

destructor TPzaBanx.Destroy;
begin inherited;
end;

function TPzaBanx.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWPzaBanx;
begin
   W:=TWPzaBanx.Create(Self);
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


Function TPzaBanx.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntPzaBa.it','I,S,S');
   try
      if Active then T.Param(0,Num_plaza.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TPzaBanx.Reporte:Boolean;
begin Execute_RepPzaCom(True,Self);
end;

(***********************************************FORMA MONEDAS********************)
(*                                                                              *)
(*  FORMA DE MONEDAS                                                            *)
(*                                                                              *)
(***********************************************FORMA MONEDAS********************)

procedure TWPzaBanx.FormShow(Sender: TObject);
begin
   Objeto.Num_Plaza.control     := edIdPlaza;
   Objeto.F_Alta.control        := edFAlta;
   Objeto.F_Baja.control        := edFBaja;
   Objeto.Nom_Plaza.control     := edNomPlaza;
   Objeto.Sit_Plaza.control     := rgSitPlaza;
   Objeto.Cve_Poblacion.control := edCvePoblacion;
end;

procedure TWPzaBanx.FormDestroy(Sender: TObject);
begin
   Objeto.Num_Plaza.control     := nil;
   Objeto.F_Alta.control 	:= nil;
   Objeto.F_Baja.control 	:= nil;
   Objeto.Nom_Plaza.control     := nil;
   Objeto.Sit_Plaza.control     := nil;
   Objeto.Cve_Poblacion.control := nil;
end;

procedure TWPzaBanx.FormClose(Sender: TObject; var Action: TCloseAction);
begin	Action := caFree;
end;

procedure TWPzaBanx.InterForma1DespuesNuevo(Sender: TObject);
begin
	rgSitPlaza.ItemIndex := 0;
	edIdPlaza.SetFocus;
   edFAlta.text := FormatDateTime('DD/MM/YYYY',DATE);
end;

procedure TWPzaBanx.InterForma1DespuesModificar(Sender: TObject);
begin	edNomPlaza.SetFocus;
end;

procedure TWPzaBanx.BitBtn1Click(Sender: TObject);
begin	Objeto.Reporte;
end;

end.



