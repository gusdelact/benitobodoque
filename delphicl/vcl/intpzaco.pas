// Sistema         : Clase de Monedas
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Monedas
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :
unit IntPzaCo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

type

  TPzaComp = Class;
  TWPzaComp = class(TForm)
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
    Objeto : TPzaComp;
  end;

  TPzaComp = class(TInterFrame)
  private
  protected
//  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    { Public declarations }
   ID_PLAZA                   :TInterCampo;
   F_ALTA                     :TInterCampo;
   F_BAJA                     :TInterCampo;
   NOM_PLAZA                  :TInterCampo;
   SIT_PLAZA                  :TInterCampo;

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

constructor TPzaComp.Create( AOwner : TComponent );
begin
   Inherited;
   ID_PLAZA	:=CreaCampo('ID_PLAZA',ftString,tsNinguno,tsNinguno,True);
   F_ALTA   :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
   F_BAJA   :=CreaCampo('F_BAJA',ftDate,tsNinguno,tsNinguno,True);
   NOM_PLAZA:=CreaCampo('NOM_PLAZA',ftString,tsNinguno,tsNinguno,True);
   ID_PLAZA.Size:=3;

   SIT_PLAZA:=CreaCampo('SIT_PLAZA',ftString,tsNinguno,tsNinguno,True);
   With SIT_PLAZA do
   begin
      Size := 2;
      UseCombo := True;
      ComboLista.Add('0');		ComboDatos.Add('AC');
      ComboLista.Add('1');		ComboDatos.Add('IN');
   end;

   FActive := False;
   FKeyFields.Add('ID_PLAZA');
   TableName := 'PZA_COMPENSACION';
   UseQuery := True;
   HelpFile := 'IntPzaCo.hlp';
   ShowMenuReporte:=True;
   IsCorp:=True;
end;

destructor TPzaComp.Destroy;
begin inherited;
end;

function TPzaComp.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWPzaComp;
begin
   W:=TWPzaComp.Create(Self);
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


Function TPzaComp.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntPzaCo.it','I,S,S');
   try
      if Active then T.Param(0,Id_plaza.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TPzaComp.Reporte:Boolean;
begin Execute_RepPzaCom(True,Self);
end;

(***********************************************FORMA MONEDAS********************)
(*                                                                              *)
(*  FORMA DE MONEDAS                                                            *)
(*                                                                              *)
(***********************************************FORMA MONEDAS********************)

procedure TWPzaComp.FormShow(Sender: TObject);
begin
   Objeto.Id_Plaza.control  := edIdPlaza;
   Objeto.F_Alta.control 	 := edFAlta;
   Objeto.F_Baja.control 	 := edFBaja;
   Objeto.Nom_Plaza.control := edNomPlaza;
   Objeto.Sit_Plaza.control := rgSitPlaza;
end;

procedure TWPzaComp.FormDestroy(Sender: TObject);
begin
   Objeto.Id_Plaza.control  := nil;
   Objeto.F_Alta.control 	 := nil;
   Objeto.F_Baja.control 	 := nil;
   Objeto.Nom_Plaza.control := nil;
   Objeto.Sit_Plaza.control := nil;
end;

procedure TWPzaComp.FormClose(Sender: TObject; var Action: TCloseAction);
begin	Action := caFree;
end;

procedure TWPzaComp.InterForma1DespuesNuevo(Sender: TObject);
begin
	rgSitPlaza.ItemIndex := 0;
	edIdPlaza.SetFocus;
   edFAlta.text := FormatDateTime('DD/MM/YYYY',DATE);
end;

procedure TWPzaComp.InterForma1DespuesModificar(Sender: TObject);
begin	edNomPlaza.SetFocus;
end;

procedure TWPzaComp.BitBtn1Click(Sender: TObject);
begin	Objeto.Reporte;
end;

end.



