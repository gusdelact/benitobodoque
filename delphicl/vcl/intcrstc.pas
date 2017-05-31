// Sistema         : Clase de Subtipo de Credito CNBV
// Fecha de Inicio : 7 de Abril de 1998
// Función forma   : Clase de Subtipo de Credito CNBV
// Desarrollo por  : Benjamín Hernández Delsordo
// Comentarios     :
unit IntCrStC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, IntCrTip, UnCrPack,
  Menus, RepCrStC;

type

  TCrStC = Class;
  TWCrStC = class(TForm)
    InterForma1: TInterForma;
    lbcveSubTipCNBV: TLabel;
    lbCveTipoCredito: TLabel;
    lbDescSubTipo: TLabel;
    lbCtaContable: TLabel;
    lbCtaInteres: TLabel;
    lbCtaInteresVdo: TLabel;
    lbCtaCapitalVdo: TLabel;
    edcveSubTipCNBV: TEdit;
    edCveTipoCredito: TEdit;
    edDescSubTipo: TEdit;
    edCtaContable: TEdit;
    edCtaInteres: TEdit;
    edCtaInteresVdo: TEdit;
    edCtaCapitalVdo: TEdit;
    sbCveTipoCredito: TSpeedButton;
    pumTipo: TPopupMenu;
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
    procedure sbCveTipoCreditoClick(Sender: TObject);
    procedure Catlogo1Click(Sender: TObject);
    procedure bbReporteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TCrStC;
    procedure impresion(Preview: Boolean);
  end;

  TCrStC = class(TInterFrame)
  private
  protected
  public
    CVE_SUB_TIP_CNBV           :TInterCampo;
    CVE_TIPO_CREDITO           :TInterCampo;
    DESC_SUB_TIPO              :TInterCampo;
    CTA_CONTABLE               :TInterCampo;
    CTA_INTERES                :TInterCampo;
    CTA_INTERES_VDO            :TInterCampo;
    CTA_CAPITAL_VDO            :TInterCampo;

    TipoCredito                :TCrTip;
    Paquete                    :TCrPack;

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

constructor TCrStC.Create( AOwner : TComponent );
begin
  inherited Create(AOwner);
  CVE_SUB_TIP_CNBV           :=CreaCampo('CVE_SUB_TIP_CNBV',ftinteger,tsNinguno,tsNinguno,True);
  CVE_TIPO_CREDITO           :=CreaCampo('CVE_TIPO_CREDITO',ftinteger,tsNinguno,tsNinguno,True);
  DESC_SUB_TIPO              :=CreaCampo('DESC_SUB_TIPO',ftString,tsNinguno,tsNinguno,True);
  CTA_CONTABLE               :=CreaCampo('CTA_CONTABLE',ftString,tsNinguno,tsNinguno,True);
     CTA_CONTABLE.Size:=6;
  CTA_INTERES                :=CreaCampo('CTA_INTERES',ftString,tsNinguno,tsNinguno,True);
  CTA_INTERES_VDO            :=CreaCampo('CTA_INTERES_VDO',ftString,tsNinguno,tsNinguno,True);
  CTA_CAPITAL_VDO            :=CreaCampo('CTA_CAPITAL_VDO',ftString,tsNinguno,tsNinguno,True);

  TipoCredito := TCrTip.Create(Self);
  TipoCredito.MasterSource:=Self;
  TipoCredito.FieldByName('CVE_TIPO_CREDITO').MasterField:='CVE_TIPO_CREDITO';

  Paquete := TCrPack.Create(Self);

  FKeyFields.Add('CVE_SUB_TIP_CNBV');
  TableName := 'CRE_SUB_TIP_CNBV';
  UseQuery := True;
  HelpFile := 'IntTemp.hlp';
  ShowMenuReporte := True;

end;

destructor TCrStC.Destroy;
begin
  if TipoCredito <> nil then TipoCredito.Free;
  if Paquete <> nil then Paquete.Free;
  inherited;
end;

procedure TCrStC.DataBaseChange;
begin
  TipoCredito.GetParams(Self);
  Paquete.Apli := Apli;
end;


function TCrStC.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrStC;
begin
   W:=TWCrStC.Create(Self);
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

Function TCrStC.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('InTCrStC.it','S,S');
   try
      if Active then T.Param(0,CVE_SUB_TIP_CNBV.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TCrStC.Reporte:Boolean;
begin
// Aqui ejecutar el proceso del reporte
end;

(***********************************************FORMA TEMPLATE*******************)
(*                                                                              *)
(*  FORMA TEMPLATE                                                              *)
(*                                                                              *)
(***********************************************FORMA TEMPLATE*******************)

procedure TWCrStC.FormShow(Sender: TObject);
begin
   Objeto.CVE_SUB_TIP_CNBV.Control := edCveSubTipCNBV;
   Objeto.DESC_SUB_TIPO.Control := edDescSubTipo;
   Objeto.CTA_CONTABLE.Control := edCtaContable;
   Objeto.CTA_INTERES.Control := edCtaInteres;
   Objeto.CTA_INTERES_VDO.Control := edCtaInteresVdo;
   Objeto.CTA_CAPITAL_VDO.Control := edCtaCapitalVdo;

   Objeto.TipoCredito.DESC_TIPO_CRED.Control := edCveTipoCredito;
end;

procedure TWCrStC.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_SUB_TIP_CNBV.Control := nil;
   Objeto.DESC_SUB_TIPO.Control := nil;
   Objeto.CTA_CONTABLE.Control := nil;
   Objeto.CTA_INTERES.Control := nil;
   Objeto.CTA_INTERES_VDO.Control := nil;
   Objeto.CTA_CAPITAL_VDO.Control := nil;

   Objeto.TipoCredito.DESC_TIPO_CRED.Control := nil;
end;

procedure TWCrStC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrStC.InterForma1Nuevo(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Append;
   Realizado := True;
end;

procedure TWCrStC.InterForma1Aceptar(Sender: TObject;  var Realizado: Boolean);
begin
  Realizado := False;
  Objeto.Post;
  Realizado := True;
end;

procedure TWCrStC.InterForma1Cancelar(Sender: TObject; var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Cancel;
   Realizado := True;
end;

procedure TWCrStC.InterForma1Eliminar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado:=False;
   Objeto.Delete;
   Realizado:=True;
end;

procedure TWCrStC.InterForma1Buscar(Sender: TObject);
begin
   Objeto.Busca;
end;

procedure TWCrStC.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Edit;
   Realizado := True;
end;

procedure TWCrStC.InterForma1Ayuda(Sender: TObject);
begin
   Objeto.Help;
end;

procedure TWCrStC.InterForma1DespuesNuevo(Sender: TObject);
begin
  Objeto.CVE_SUB_TIP_CNBV.AsInteger := Objeto.Paquete.DameFolio(foSubTipCn);
  edCveTipoCredito.SetFocus;
end;

procedure TWCrStC.InterForma1DespuesModificar(Sender: TObject);
begin
  edcveSubTipCNBV.SetFocus;
end;

procedure TWCrStC.BitBtn1Click(Sender: TObject);
begin
   Objeto.Reporte;
end;


procedure TWCrStC.sbCveTipoCreditoClick(Sender: TObject);
begin
  Objeto.TipoCredito.Busca;
end;

procedure TWCrStC.Catlogo1Click(Sender: TObject);
begin
  Objeto.TipoCredito.Catalogo;
end;

procedure TWCrStC.impresion(Preview: Boolean);
//var sql:String;
begin
//  case rgOpcion.ItemIndex of {VALIDACION DE LAS OPCIONES}
//    0 : begin {Objeto.Condicion1.as<Tipo> := <valor>;}
//        end;
//  end;
  ExecRepCrStC(Objeto, Preview);
end;

procedure TWCrStC.bbReporteClick(Sender: TObject);
begin
  Impresion(True);
end;


end.



