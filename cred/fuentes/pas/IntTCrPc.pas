// Sistema         : Clase de periodos de capital
// Fecha de Inicio : 16 de abril de 1998
// Función forma   : Clase de periodos de capital
// Desarrollo por  : Ing. Juan Carlos Sánchez Reyes
// Comentarios     :
unit IntTCrPc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun;

type

  TCrPc = Class;
  TWCrPc = class(TForm)
    InterForma1: TInterForma;
    lbDesc: TLabel;
    BitBtn1: TBitBtn;
    edCveCredito: TEdit;
    edNumPer: TEdit;
    edCveSit: TEdit;
    edPlazo: TEdit;
    edFAmortiza: TEdit;
    edFProgPago: TEdit;
    edFPago: TEdit;
    edMPagado: TEdit;
    edMVencido: TEdit;
    edMBeneficio: TEdit;
    edMCapitalizado: TEdit;
    edFactCap: TEdit;
    edTPer: TEdit;
    edMCapital: TEdit;
    edCobAut: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edMBeneficioBco: TEdit;
    Label5: TLabel;
    edTipCapitaliza: TEdit;
    stpEsFestivo: TStoredProc;
    Label17: TLabel;
    edImp_pago_parcial: TEdit;
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
    Objeto : TCrPc;
  end;

  TCrPc = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
   ID_CREDITO                 :TInterCampo;
   NUM_PERIODO                :TInterCampo;
   B_COB_AUT                  :TInterCampo;
   F_PAGO                     :TInterCampo;
   F_PROG_PAGO                :TInterCampo;
   F_VENCIMIENTO              :TInterCampo;
   FACT_CAPITALIZA            :TInterCampo;
   IMP_BENEF_BCO              :TInterCampo;
   IMP_BENEF_GOB              :TInterCampo;
   IMP_CAPITAL                :TInterCampo;
   IMP_CAPITALIZA             :TInterCampo;
   IMP_PAGADO                 :TInterCampo;
   IMP_VENCIDO                :TInterCampo;
   PLAZO                      :TInterCampo;
   SIT_CAPITAL                :TInterCampo;
   TASA_APLICADA              :TInterCampo;
   TIPO_CAPITALIZA            :TInterCampo;
   IMP_PAGO_PARCIAL           :TInterCampo;
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

implementation

{$R *.DFM}

constructor TCrPc.Create( AOwner : TComponent );
begin
   Inherited Create(AOwner);
   ID_CREDITO                 :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,True);
   NUM_PERIODO                :=CreaCampo('NUM_PERIODO',ftInteger,tsNinguno,tsNinguno,True);
   B_COB_AUT                  :=CreaCampo('B_COB_AUT',ftString,tsNinguno,tsNinguno,True);
   B_COB_AUT.Size:=1;
   F_PAGO                     :=CreaCampo('F_PAGO',ftDate,tsNinguno,tsNinguno,True);
   F_PROG_PAGO                :=CreaCampo('F_PROG_PAGO',ftDate,tsNinguno,tsNinguno,True);
   F_VENCIMIENTO              :=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,True);
   FACT_CAPITALIZA            :=CreaCampo('FACT_CAPITALIZA',ftFloat,tsNinguno,tsNinguno,True);
   IMP_BENEF_BCO              :=CreaCampo('IMP_BENEF_BCO',ftFloat,tsNinguno,tsNinguno,True);
   IMP_BENEF_GOB              :=CreaCampo('IMP_BENEF_GOB',ftFloat,tsNinguno,tsNinguno,True);
   IMP_CAPITAL                :=CreaCampo('IMP_CAPITAL',ftFloat,tsNinguno,tsNinguno,True);
   IMP_CAPITALIZA             :=CreaCampo('IMP_CAPITALIZA',ftFloat,tsNinguno,tsNinguno,True);
   IMP_PAGADO                 :=CreaCampo('IMP_PAGADO',ftFloat,tsNinguno,tsNinguno,True);
   IMP_VENCIDO                :=CreaCampo('IMP_VENCIDO',ftFloat,tsNinguno,tsNinguno,True);
   PLAZO                      :=CreaCampo('PLAZO',ftInteger,tsNinguno,tsNinguno,True);
   SIT_CAPITAL                :=CreaCampo('SIT_CAPITAL',ftString,tsNinguno,tsNinguno,True);
   SIT_CAPITAL.Size:=2;
   TASA_APLICADA              :=CreaCampo('TASA_APLICADA',ftFloat,tsNinguno,tsNinguno,True);
   TIPO_CAPITALIZA            :=CreaCampo('TIPO_CAPITALIZA',ftInteger,tsNinguno,tsNinguno,True);
   IMP_PAGO_PARCIAL           :=CreaCampo('IMP_PAGO_PARCIAL',ftFloat,tsNinguno,tsNinguno,True);

   FKeyFields.Add('ID_CREDITO');
   FKeyFields.Add('NUM_PERIODO');
   TableName := 'CRE_CAPITAL';
   UseQuery := True;
   HelpFile := 'IntTemp.hlp';
   ShowMenuReporte := True;


end;

destructor TCrPc.Destroy;
begin
   inherited;
end;

function TCrPc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrPc;
begin
   W:=TWCrPc.Create(Self);
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

Function TCrPc.InternalBusca:Boolean;
Var T:TInterFindit;
begin

   InternalBusca := False;
   T := CreaBuscador('IntCrPc.it','I,I');
   try
      if Active then
      begin
        T.Param(0,ID_CREDITO.AsString);
        T.Param(1,NUM_PERIODO.AsString);
      end;

      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TCrPc.Reporte:Boolean;
begin
// Aqui ejecutar el proceso del reporte
end;

(***********************************************FORMA TEMPLATE*******************)
(*                                                                              *)
(*  FORMA TEMPLATE                                                              *)
(*                                                                              *)
(***********************************************FORMA TEMPLATE*******************)

procedure TWCrPc.FormShow(Sender: TObject);
begin
   Objeto.ID_CREDITO.Control := edCveCredito;
   Objeto.NUM_PERIODO.Control := edNumPer;
   Objeto.B_COB_AUT.Control := edCobAut;
   Objeto.F_PAGO.Control := edFPago;
   Objeto.F_PROG_PAGO.Control := edFProgPago;
   Objeto.F_VENCIMIENTO.Control := edFAmortiza;
   Objeto.FACT_CAPITALIZA.Control := edTipCapitaliza;
   Objeto.IMP_BENEF_BCO.Control := edMBeneficioBco;
   Objeto.IMP_BENEF_GOB.Control := edMBeneficio;
   Objeto.IMP_CAPITAL.Control := edMCapital;
   Objeto.IMP_CAPITALIZA.Control := edMCapitalizado;
   Objeto.IMP_PAGADO.Control := edMPagado;
   Objeto.IMP_VENCIDO.Control := edMVencido;
   Objeto.PLAZO.Control := edPlazo;
   Objeto.SIT_CAPITAL.Control := edCveSit;
   Objeto.TASA_APLICADA.Control := edTPer;
   Objeto.TIPO_CAPITALIZA.Control := edTipCapitaliza;
   Objeto.IMP_PAGO_PARCIAL.Control := edImp_pago_parcial;
end;

procedure TWCrPc.FormDestroy(Sender: TObject);
begin
   Objeto.ID_CREDITO.Control := nil;
   Objeto.NUM_PERIODO.Control := nil;
   Objeto.B_COB_AUT.Control := nil;
   Objeto.F_PAGO.Control := nil;
   Objeto.F_PROG_PAGO.Control := nil;
   Objeto.F_VENCIMIENTO.Control := nil;
   Objeto.FACT_CAPITALIZA.Control := nil;
   Objeto.IMP_BENEF_BCO.Control := nil;
   Objeto.IMP_BENEF_GOB.Control := nil;
   Objeto.IMP_CAPITAL.Control := nil;
   Objeto.IMP_CAPITALIZA.Control := nil;
   Objeto.IMP_PAGADO.Control := nil;
   Objeto.IMP_VENCIDO.Control := nil;
   Objeto.PLAZO.Control := nil;
   Objeto.SIT_CAPITAL.Control := nil;
   Objeto.TASA_APLICADA.Control := nil;
   Objeto.TIPO_CAPITALIZA.Control := nil;
   Objeto.IMP_PAGO_PARCIAL.Control := nil;
end;

procedure TWCrPc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrPc.InterForma1DespuesNuevo(Sender: TObject);
begin
   edCveCredito.SetFocus;
end;

procedure TWCrPc.InterForma1DespuesModificar(Sender: TObject);
begin
   edNumPer.SetFocus;
end;

procedure TWCrPc.BitBtn1Click(Sender: TObject);
begin
   Objeto.Reporte;
end;


end.



