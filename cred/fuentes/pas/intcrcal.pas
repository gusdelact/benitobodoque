// Sistema         : Clase de Crédito
// Fecha de Inicio : 14/04/98
// Función forma   : Clase de la tabla Cre_Calculo
// Desarrollo por  : Rocío Berenice Muñoz Ríos
// Comentarios     : IntCrCal
unit IntCrCal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun;

type

  TCrCal = Class;
  TWCrCal = class(TForm)
    InterForma1: TInterForma;
    lbCve: TLabel;
    edCve: TEdit;
    lbDesc: TLabel;
    BitBtn1: TBitBtn;
    edDesc: TEdit;
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
    Objeto : TCrCal;
  end;

  TCrCal = class(TInterFrame)
  private
  protected
  public
   CVE_CALCULO                :TInterCampo;
   DESC_CALCULO               :TInterCampo;
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

implementation

{$R *.DFM}

constructor TCrCal.Create( AOwner : TComponent );
begin
   Inherited Create(AOwner);
   CVE_CALCULO                :=CreaCampo('CVE_CALCULO',ftString,tsNinguno,tsNinguno,True);
   CVE_CALCULO.Size:=2;
   CVE_CALCULO.Caption := 'Clave de Cálculo';
   DESC_CALCULO               :=CreaCampo('DESC_CALCULO',ftString,tsNinguno,tsNinguno,True);
   DESC_CALCULO.Caption := 'Tipo de Cálculo';
   FKeyFields.Add('CVE_CALCULO');
   TableName := 'CRE_CALCULO';
   UseQuery := True;
   HelpFile := 'IntTCrCal.hlp';
   ShowMenuReporte := True;

{   //  Código para Stored Procedures
   Cve := CreaCampo('CVE',ftString,tsNuevo+tsModifica+tsElimina+tsConsulta,tsNinguno,False);
   Cve.Size := 3;
   Desc := CreaCampo('DESC',ftString,tsNuevo+tsModifica,tsConsulta,False);
   CodResp := CreaCampo('CODRESP',ftInteger,tsNinguno,tsNuevo+tsModifica+tsElimina+tsConsulta,False);
   StpName := 'STPCO<NOMBRETABLA>'
   FKeyFields.Add('<CAMPOLLAVE>');
   TableName := '<NOMBRETABLA>';
   HelpFile := '<IntTemp.hlp>';
   ShowMenuReporte := True;
}
end;

destructor TCrCal.Destroy;
begin
   inherited;
end;

function TCrCal.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCal;
begin
   W:=TWCrCal.Create(Self);
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

Function TCrCal.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntCrCal.it','S');
   try
      if Active then T.Param(0,cve_calculo.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TCrCal.Reporte:Boolean;
begin
// Aqui ejecutar el proceso del reporte
end;

(***********************************************FORMA TEMPLATE*******************)
(*                                                                              *)
(*  FORMA TEMPLATE                                                              *)
(*                                                                              *)
(***********************************************FORMA TEMPLATE*******************)

procedure TWCrCal.FormShow(Sender: TObject);
begin
   Objeto.Cve_calculo.Control := edCve;
   Objeto.Desc_calculo.Control := edDesc;
end;

procedure TWCrCal.FormDestroy(Sender: TObject);
begin
   Objeto.Cve_calculo.Control := nil;
   Objeto.Desc_calculo.Control := nil;
end;

procedure TWCrCal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrCal.InterForma1DespuesNuevo(Sender: TObject);
begin
   edCve.SetFocus;
end;

procedure TWCrCal.InterForma1DespuesModificar(Sender: TObject);
begin
   edDesc.SetFocus;
end;

procedure TWCrCal.BitBtn1Click(Sender: TObject);
begin
   Objeto.Reporte;
end;


end.



