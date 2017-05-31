// Sistema         : Clase de Créditos
// Fecha de Inicio : 20 de Abril de 1998
// Función forma   : Clase de Interés
// Desarrollo por  : Rocío Berenice Muñoz Ríos
// Comentarios     : IntCrInt
unit IntCrInt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun;

type

  TCrInt = Class;
  TWCrInt = class(TForm)
    InterForma1: TInterForma;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    edCred: TEdit;
    Label2: TLabel;
    edperiodo: TEdit;
    edCobAut: TCheckBox;
    Label3: TLabel;
    edfpago: TEdit;
    Label4: TLabel;
    edfprog: TEdit;
    Label5: TLabel;
    edfvenc: TEdit;
    edfact: TCheckBox;
    Label12: TLabel;
    edplazo: TEdit;
    Label21: TLabel;
    edsitint: TEdit;
    Label22: TLabel;
    edTasa: TEdit;
    Label23: TLabel;
    edtipcap: TEdit;
    Label13: TLabel;
    edintper: TEdit;
    Label14: TLabel;
    edintpro: TEdit;
    Label15: TLabel;
    edIva: TEdit;
    Label16: TLabel;
    edIvaPag: TEdit;
    Label17: TLabel;
    edIvaPro: TEdit;
    Label18: TLabel;
    edPag: TEdit;
    Label19: TLabel;
    edPagFij: TEdit;
    Label20: TLabel;
    edVenc: TEdit;
    Label6: TLabel;
    edbco: TEdit;
    Label7: TLabel;
    edgob: TEdit;
    Label8: TLabel;
    edCap: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edintaye: TEdit;
    edintdia: TEdit;
    edintori: TEdit;
    Label24: TLabel;
    edImpPagoParcial: TEdit;
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
    Objeto : TCrInt;
  end;

  TCrInt = class(TInterFrame)
  private
  protected
  public
{ Definición de los Campos de la Clase CRE_INTERES}
{ Macv Generador Automático de Sp}
   ID_CREDITO                 :TInterCampo;
   NUM_PERIODO                :TInterCampo;
   B_COB_AUT                  :TInterCampo;
   F_PAGO                     :TInterCampo;
   F_PROG_PAGO                :TInterCampo;
   F_VENCIMIENTO              :TInterCampo;
   FACT_CAPITALIZA            :TInterCampo;
   IMP_BENEF_BCO              :TInterCampo;
   IMP_BENEF_GOB              :TInterCampo;
   IMP_CAPITALIZA             :TInterCampo;
   IMP_INTERES_AYER           :TInterCampo;
   IMP_INTERES_DIA            :TInterCampo;
   IMP_INTERES_ORIG           :TInterCampo;
   IMP_INTERES_PER            :TInterCampo;
   IMP_INTERES_PROY           :TInterCampo;
   IMP_IVA                    :TInterCampo;
   IMP_IVA_PAGADO             :TInterCampo;
   IMP_IVA_PROYEC             :TInterCampo;
   IMP_PAGADO                 :TInterCampo;
   IMP_PAGO_FIJO              :TInterCampo;
   IMP_VENCIDO                :TInterCampo;
   PLAZO                      :TInterCampo;
   SIT_INTERES                :TInterCampo;
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

constructor TCrInt.Create( AOwner : TComponent );
begin
   Inherited Create(AOwner);

{ Creación de Campos  de CRE_INTERES}
{ Macv Generador Automático de Sp}
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
   IMP_CAPITALIZA             :=CreaCampo('IMP_CAPITALIZA',ftFloat,tsNinguno,tsNinguno,True);
   IMP_INTERES_AYER           :=CreaCampo('IMP_INTERES_AYER',ftFloat,tsNinguno,tsNinguno,True);
   IMP_INTERES_DIA            :=CreaCampo('IMP_INTERES_DIA',ftFloat,tsNinguno,tsNinguno,True);
   IMP_INTERES_ORIG           :=CreaCampo('IMP_INTERES_ORIG',ftFloat,tsNinguno,tsNinguno,True);
   IMP_INTERES_PER            :=CreaCampo('IMP_INTERES_PER',ftFloat,tsNinguno,tsNinguno,True);
   IMP_INTERES_PROY           :=CreaCampo('IMP_INTERES_PROY',ftFloat,tsNinguno,tsNinguno,True);
   IMP_IVA                    :=CreaCampo('IMP_IVA',ftFloat,tsNinguno,tsNinguno,True);
   IMP_IVA_PAGADO             :=CreaCampo('IMP_IVA_PAGADO',ftFloat,tsNinguno,tsNinguno,True);
   IMP_IVA_PROYEC             :=CreaCampo('IMP_IVA_PROYEC',ftFloat,tsNinguno,tsNinguno,True);
   IMP_PAGADO                 :=CreaCampo('IMP_PAGADO',ftFloat,tsNinguno,tsNinguno,True);
   IMP_PAGO_FIJO              :=CreaCampo('IMP_PAGO_FIJO',ftFloat,tsNinguno,tsNinguno,True);
   IMP_VENCIDO                :=CreaCampo('IMP_VENCIDO',ftFloat,tsNinguno,tsNinguno,True);
   PLAZO                      :=CreaCampo('PLAZO',ftInteger,tsNinguno,tsNinguno,True);
   SIT_INTERES                :=CreaCampo('SIT_INTERES',ftString,tsNinguno,tsNinguno,True);
      SIT_INTERES.Size:=2;
   TASA_APLICADA              :=CreaCampo('TASA_APLICADA',ftFloat,tsNinguno,tsNinguno,True);
   TIPO_CAPITALIZA            :=CreaCampo('TIPO_CAPITALIZA',ftInteger,tsNinguno,tsNinguno,True);
   IMP_PAGO_PARCIAL           :=CreaCampo('IMP_PAGO_PARCIAL',ftFloat,tsNinguno,tsNinguno,True);
   FKeyFields.Add('ID_CREDITO');
   FKeyFields.Add('NUM_PERIODO');
   TableName := 'CRE_INTERES';
   UseQuery := True;
   HelpFile := 'IntTCrInt.hlp';
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

destructor TCrInt.Destroy;
begin
   inherited;
end;

function TCrInt.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrInt;
begin
   W:=TWCrInt.Create(Self);
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

Function TCrInt.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntCrInt.it','S,S');
   try
      if Active then
      begin
        T.Param(0,Id_credito.AsString);
        T.Param(1,num_periodo.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TCrInt.Reporte:Boolean;
begin
// Aqui ejecutar el proceso del reporte
end;

(***********************************************FORMA TEMPLATE*******************)
(*                                                                              *)
(*  FORMA TEMPLATE                                                              *)
(*                                                                              *)
(***********************************************FORMA TEMPLATE*******************)

procedure TWCrInt.FormShow(Sender: TObject);
begin
   Objeto.id_credito.Control := edCred;
   Objeto.num_periodo.Control := edperiodo;
   Objeto.b_cob_aut.Control := edCobAut;
   Objeto.f_pago.Control := edfpago;
   Objeto.f_prog_pago.Control := edfprog;
   Objeto.f_vencimiento.Control := edfvenc;
   Objeto.fact_capitaliza.Control := edfact;
   Objeto.imp_benef_bco.Control := edbco;
   Objeto.imp_benef_gob.Control := edgob;
   Objeto.imp_capitaliza.Control := edcap;
   Objeto.imp_interes_ayer.Control := edintaye;
   Objeto.imp_interes_dia.Control := edintdia;
   Objeto.imp_interes_orig.Control := edintori;
   Objeto.imp_interes_per.Control := edintper;
   Objeto.imp_interes_proy.Control := edintpro;
   Objeto.imp_iva.Control := ediva;
   Objeto.imp_iva_pagado.Control := edivapag;
   Objeto.imp_iva_proyec.Control := edivapro;
   Objeto.imp_pagado.Control := edpag;
   Objeto.imp_pago_fijo.Control := edpagfij;
   Objeto.imp_vencido.Control := edvenc;
   Objeto.plazo.Control := edplazo;
   Objeto.sit_interes.Control := edsitint;
   Objeto.tasa_aplicada.Control := edtasa;
   Objeto.tipo_capitaliza.Control := edtipcap;
   Objeto.IMP_PAGO_PARCIAL.Control := edImpPagoParcial;
end;

procedure TWCrInt.FormDestroy(Sender: TObject);
begin
   Objeto.id_credito.Control := nil;
   Objeto.num_periodo.Control := nil;
   Objeto.b_cob_aut.Control := nil;
   Objeto.f_pago.Control := nil;
   Objeto.f_prog_pago.Control := nil;
   Objeto.f_vencimiento.Control := nil;
   Objeto.fact_capitaliza.Control := nil;
   Objeto.imp_benef_bco.Control := nil;
   Objeto.imp_benef_gob.Control := nil;
   Objeto.imp_capitaliza.Control := nil;
   Objeto.imp_interes_ayer.Control := nil;
   Objeto.imp_interes_dia.Control := nil;
   Objeto.imp_interes_orig.Control := nil;
   Objeto.imp_interes_per.Control := nil;
   Objeto.imp_interes_proy.Control := nil;
   Objeto.imp_iva.Control := nil;
   Objeto.imp_iva_pagado.Control := nil;
   Objeto.imp_iva_proyec.Control := nil;
   Objeto.imp_pagado.Control := nil;
   Objeto.imp_pago_fijo.Control := nil;
   Objeto.imp_vencido.Control := nil;
   Objeto.plazo.Control := nil;
   Objeto.sit_interes.Control := nil;
   Objeto.tasa_aplicada.Control := nil;
   Objeto.tipo_capitaliza.Control := nil;
   Objeto.IMP_PAGO_PARCIAL.Control := nil;
end;

procedure TWCrInt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrInt.InterForma1DespuesNuevo(Sender: TObject);
begin
   edCred.SetFocus;
end;

procedure TWCrInt.InterForma1DespuesModificar(Sender: TObject);
begin
   edPeriodo.SetFocus;
end;

procedure TWCrInt.BitBtn1Click(Sender: TObject);
begin
   Objeto.Reporte;
end;

end.



