// Sistema         : Clase de Subtipo de Credito Banco
// Fecha de Inicio : 7 de Abril de 1998
// Función forma   : Clase de Subtipo de Credito Banco
// Desarrollo por  : Benjamín Hernández Delsordo
// Comentarios     :

unit IntCrStB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, IntCrStC, IntCrPar, IntCrCar, UnCrPack,
  Menus, RepCrStB;

type

  TCrStB = Class;
  TWCrStB = class(TForm)
    InterForma1: TInterForma;
    edCveSubTipCNBV: TEdit;
    sbCveSubTipCNBV: TSpeedButton;
    lbCveSubTipCNBV: TLabel;
    lbCveSubTipBco: TLabel;
    lbFactComisBCO: TLabel;
    lbDescSubTipo: TLabel;
    lbFactErogNeta: TLabel;
    lbFactComisFOVI: TLabel;
    edCveSubTipBco: TEdit;
    edFactErogNeta: TEdit;
    edFactComisFOVI: TEdit;
    edDescSubTipo: TEdit;
    edFactComisBCO: TEdit;
    edFactPagoMillar: TEdit;
    cbBAnticipado: TCheckBox;
    cbBAplicaIVA: TCheckBox;
    cbBGeneraBNC: TCheckBox;
    cbBReestructura: TCheckBox;
    lbFactPagoMillar: TLabel;
    puSubTipoCNBV: TPopupMenu;
    Catlogo1: TMenuItem;
    bbReporte: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Nuevo(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Aceptar(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Cancelar(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Eliminar(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Buscar(Sender : TObject);
    procedure InterForma1Modificar(Sender : TObject;
      var Realizado : Boolean);
    procedure InterForma1Ayuda(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Catlogo1Click(Sender: TObject);
    procedure sbCveSubTipCNBVClick(Sender: TObject);
    procedure bbReporteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TCrStB;
    procedure Impresion(Preview: Boolean);
  end;

  TCrStB = class(TInterFrame)
  private
  protected
  public
    CVE_SUB_TIP_BCO            :TInterCampo;
    CVE_SUB_TIP_CNBV           :TInterCampo;
    B_ANTICIPADO               :TInterCampo;
    B_APLICA_IVA               :TInterCampo;
    B_GENERA_BNC               :TInterCampo;
    B_REESTRUCTURA             :TInterCampo;
    DESC_SUB_TIPO              :TInterCampo;
    FACT_EROG_NETA             :TInterCampo;
    FACT_COMIS_BCO             :TInterCampo;
    FACT_COMIS_FOVI            :TInterCampo;
    FACT_PAGO_MILLAR           :TInterCampo;
    B_GENERA_CONTA             :TInterCampo;
    CVE_SUB_CARTERA            :TInterCampo;

    SubtipoCNBV                :TCrStC;
    Paquete                    :TCrPack;
    Cartera                    :TCrCar;

    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
    procedure   DataBaseChange; override;
  published
  end;

implementation

{$R *.DFM}

constructor TCrStB.Create( AOwner : TComponent );
begin
   inherited Create(AOwner);
   CVE_SUB_TIP_BCO            :=CreaCampo('CVE_SUB_TIP_BCO',ftInteger,tsNinguno,tsNinguno,True);
   CVE_SUB_TIP_CNBV           :=CreaCampo('CVE_SUB_TIP_CNBV',ftInteger,tsNinguno,tsNinguno,True);
   B_ANTICIPADO               :=CreaCampo('B_ANTICIPADO',ftString,tsNinguno,tsNinguno,True);
      B_ANTICIPADO.Size:=1;
   B_APLICA_IVA               :=CreaCampo('B_APLICA_IVA',ftString,tsNinguno,tsNinguno,True);
      B_APLICA_IVA.Size:=1;
   B_GENERA_BNC               :=CreaCampo('B_GENERA_BNC',ftString,tsNinguno,tsNinguno,True);
      B_GENERA_BNC.Size:=1;
   B_REESTRUCTURA             :=CreaCampo('B_REESTRUCTURA',ftString,tsNinguno,tsNinguno,True);
      B_REESTRUCTURA.Size:=1;
   DESC_SUB_TIPO              :=CreaCampo('DESC_SUB_TIPO',ftString,tsNinguno,tsNinguno,True);
   FACT_EROG_NETA             :=CreaCampo('FACT_EROG_NETA',ftFloat,tsNinguno,tsNinguno,True);
   FACT_COMIS_BCO             :=CreaCampo('FACT_COMIS_BCO',ftFloat,tsNinguno,tsNinguno,True);
   FACT_COMIS_FOVI            :=CreaCampo('FACT_COMIS_FOVI',ftFloat,tsNinguno,tsNinguno,True);
   FACT_PAGO_MILLAR           :=CreaCampo('FACT_PAGO_MILLAR',ftFloat,tsNinguno,tsNinguno,True);
   B_GENERA_CONTA             :=CreaCampo('B_GENERA_CONTA',ftString,tsNinguno,tsNinguno,True);
     B_GENERA_CONTA.Size:=1;
   CVE_SUB_CARTERA            :=CreaCampo('CVE_SUB_CARTERA',ftString,tsNinguno,tsNinguno,True);
      CVE_SUB_CARTERA.Size:=6;

   SubtipoCNBV := TCrStC.Create(Self);
   SubtipoCNBV.MasterSource := Self;
   SubtipoCNBV.FieldByName('CVE_SUB_TIP_CNBV').MasterField := 'CVE_SUB_TIP_CNBV';

   Cartera := TCrCar.Create(Self);
   Cartera.MasterSource := Self;
   Cartera.FieldByName('CVE_SUB_CARTERA').MasterField := 'CVE_SUB_CARTERA';

   Paquete := TCrPack.Create(Self);

   FKeyFields.Add('CVE_SUB_TIP_BCO');
   TableName := 'CRE_SUB_TIP_BCO';
   UseQuery := True;
   HelpFile := 'InTCrStB.hlp';
   ShowMenuReporte := True;
end;

destructor TCrStB.Destroy;
begin
  if Paquete <> nil then Paquete.Free;
  if SubtipoCNBV <> nil then SubtipoCNBV.Free;
  if Cartera <> nil then Cartera.Free;
  inherited;
end;

procedure TCrStB.DataBaseChange;
begin
  Paquete.Apli := Apli;
  SubTipoCNBV.GetParams(Self);
  Cartera.GetParams(Self);
end;

function TCrStB.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrStB;
begin
   W:=TWCrStB.Create(Self);
   try
      W.Objeto:= Self;
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

Function TCrStB.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntCrStB.it','S,S');
   try
      if Active then T.Param(0,CVE_SUB_TIP_BCO.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TCrStB.Reporte:Boolean;
begin
// Aqui ejecutar el proceso del reporte
end;

(***********************************************FORMA TEMPLATE*******************)
(*                                                                              *)
(*  FORMA TEMPLATE                                                              *)
(*                                                                              *)
(***********************************************FORMA TEMPLATE*******************)

procedure TWCrStB.FormShow(Sender: TObject);
begin
   Objeto.CVE_SUB_TIP_BCO.Control := edCveSubTipBco;
   Objeto.B_ANTICIPADO.Control := cbBAnticipado;
   Objeto.B_APLICA_IVA.Control := cbBAplicaIVA;
   Objeto.B_GENERA_BNC.Control := cbBGeneraBNC;
   Objeto.B_REESTRUCTURA.Control := cbBReestructura;
   Objeto.DESC_SUB_TIPO.Control := edDescSubTipo;
   Objeto.FACT_EROG_NETA.Control := edFactErogNeta;
   Objeto.FACT_COMIS_BCO.Control := edFactComisBCO;
   Objeto.FACT_COMIS_FOVI.Control := edFactComisFovi;
   Objeto.FACT_PAGO_MILLAR.Control := edFactPagoMillar;

   Objeto.SubtipoCNBV.DESC_SUB_TIPO.Control := edCveSubTipCNBV;
end;

procedure TWCrStB.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_SUB_TIP_BCO.Control := nil;
   Objeto.B_ANTICIPADO.Control := nil;
   Objeto.B_APLICA_IVA.Control := nil;
   Objeto.B_GENERA_BNC.Control := nil;
   Objeto.B_REESTRUCTURA.Control := nil;
   Objeto.DESC_SUB_TIPO.Control := nil;
   Objeto.FACT_EROG_NETA.Control := nil;
   Objeto.FACT_COMIS_BCO.Control := nil;
   Objeto.FACT_COMIS_FOVI.Control := nil;
   Objeto.FACT_PAGO_MILLAR.Control := nil;

   Objeto.SubtipoCNBV.DESC_SUB_TIPO.Control := nil;
end;

procedure TWCrStB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrStB.InterForma1Nuevo(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Append;
   Realizado := True;
end;

procedure TWCrStB.InterForma1Aceptar(Sender: TObject;  var Realizado: Boolean);
begin
  Realizado := False;
  Objeto.Post;
  Realizado := True;
end;

procedure TWCrStB.InterForma1Cancelar(Sender: TObject; var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Cancel;
   Realizado := True;
end;

procedure TWCrStB.InterForma1Eliminar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado:=False;
   Objeto.Delete;
   Realizado:=True;
end;

procedure TWCrStB.InterForma1Buscar(Sender: TObject);
begin
   Objeto.Busca;
end;

procedure TWCrStB.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Edit;
   Realizado := True;
end;

procedure TWCrStB.InterForma1Ayuda(Sender: TObject);
begin
   Objeto.Help;
end;

procedure TWCrStB.InterForma1DespuesNuevo(Sender: TObject);
begin
  edCveSubTipCNBV.SetFocus;
  Objeto.CVE_SUB_TIP_BCO.AsInteger := Objeto.Paquete.DameFolio(foSubTipCr);
end;

procedure TWCrStB.InterForma1DespuesModificar(Sender: TObject);
begin
  edDescSubTipo.SetFocus;
end;

procedure TWCrStB.BitBtn1Click(Sender: TObject);
begin
   Objeto.Reporte;
end;



procedure TWCrStB.Catlogo1Click(Sender: TObject);
begin
  Objeto.SubtipoCNBV.Catalogo;
end;

procedure TWCrStB.sbCveSubTipCNBVClick(Sender: TObject);
begin
  Objeto.SubtipoCNBV.Busca;
end;

procedure TWCrStB.Impresion(Preview: Boolean);
//var sql:String;
begin
//  case rgOpcion.ItemIndex of {VALIDACION DE LAS OPCIONES}
//    0 : begin {Objeto.Condicion1.as<Tipo> := <valor>;}
//        end;
//  end;
  ExecRepCrStB(Objeto, Preview);
end;

procedure TWCrStB.bbReporteClick(Sender: TObject);
begin
  Impresion(True);
end;

end.



