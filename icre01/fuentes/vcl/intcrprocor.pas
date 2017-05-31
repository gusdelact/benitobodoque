// Sistema         : Clase de CR_PRODUCTO_CORP
// Fecha de Inicio : 04/11/2003
// Función forma   : Clase de CR_PRODUCTO_CORP
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrProCor;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntMon, IntProd,IntParamCre,
  IntLinkit, IntGenCre ;

Type
 TCrProCor= class;

  TWCrProductoCorp=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_MONEDA : TLabel; 
    edCVE_MONEDA : TEdit;
    lbCVE_PRODUC_CORP : TLabel; 
    edCVE_PRODUC_CORP : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btPRODUCTO_CRED: TBitBtn;
    edDESC_MONEDA: TEdit;
    btPRODUCTO_CORP: TBitBtn;
    edDESC_PRODUCTO: TEdit;
    rgPERSONA_JURIDICA: TRadioGroup;
    MsgPanel: TPanel;
    ilMONEDA: TInterLinkit;
    ilPRODUCTO: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btPRODUCTO_CREDClick(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure btPRODUCTO_CORPClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure edCVE_PRODUC_CORPExit(Sender: TObject);
    procedure rgPERSONA_JURIDICAExit(Sender: TObject);
    private
    { Private declarations }
    Procedure MuestraHint;
    public
    { Public declarations }
    Objeto : TCrProCor;
end;
 TCrProCor= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }

        CVE_MONEDA               : TInterCampo;
        CVE_PER_JURIDICA         : TInterCampo;
        CVE_PRODUC_CORP          : TInterCampo;

        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;
        Producto                 : TProducto;
        
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


constructor TCrProCor.Create( AOwner : TComponent );
begin Inherited;
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA.Caption:='Moneda';
      CVE_PER_JURIDICA :=CreaCampo('CVE_PER_JURIDICA',ftString,tsNinguno,tsNinguno,True);
        With CVE_PER_JURIDICA do
           begin Size:=2;
                 UseCombo:=True;
                 ComboLista.Add('0');      ComboDatos.Add(CPER_MORAL);
                 ComboLista.Add('1');      ComboDatos.Add(CPER_FISICA);
           end;
                CVE_PER_JURIDICA.Caption:='Personalidad Juridica';
      CVE_PRODUC_CORP :=CreaCampo('CVE_PRODUC_CORP',ftString,tsNinguno,tsNinguno,True);
                CVE_PRODUC_CORP.Caption:='Producto Corporativo';
      FKeyFields.Add('CVE_MONEDA');
      FKeyFields.Add('CVE_PER_JURIDICA');

      TableName := 'CR_PRODUCTO_CORP';
      UseQuery := True;
      HelpFile := 'IntCrProCor.Hlp';
      ShowMenuReporte:=True;

      Producto :=  TProducto.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO').MasterField      :='CVE_PRODUC_CORP';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';
end;

Destructor TCrProCor.Destroy;
begin inherited;
end;


function TCrProCor.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrProductoCorp;
begin
   W:=TWCrProductoCorp.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
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


Function TCrProCor.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrPrCo.it','F,S');
      Try if Active then begin T.Param(0,CVE_MONEDA.AsString); 
                               T.Param(1,CVE_PER_JURIDICA.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

function TCrProCor.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_PRODUCTO_CORP********************)
(*                                                                              *)
(*  FORMA DE CR_PRODUCTO_CORP                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_PRODUCTO_CORP********************)

procedure TWCrProductoCorp.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_MONEDA.Control:=edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);

      Objeto.CVE_PER_JURIDICA.Control:=rgPERSONA_JURIDICA;

      Objeto.CVE_PRODUC_CORP.Control:=edCVE_PRODUC_CORP;
      Objeto.Producto.Cve_Producto.Control :=edCVE_PRODUC_CORP;
      Objeto.Producto.Desc_Producto.Control := edDESC_PRODUCTO;
      Objeto.Producto.GetParams(Objeto);

      InterForma1.MsgPanel := MsgPanel;
end;

procedure TWCrProductoCorp.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_MONEDA.Control:=nil;
      Objeto.Moneda.Desc_Moneda.Control := nil;
      Objeto.CVE_PER_JURIDICA.Control:=nil;
      Objeto.CVE_PRODUC_CORP.Control:=nil;
      Objeto.Producto.Cve_Producto.Control :=nil;
      Objeto.Producto.Desc_Producto.Control := nil;
end;

procedure TWCrProductoCorp.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrProductoCorp.InterForma1DespuesNuevo(Sender: TObject);
begin edCVE_MONEDA.SetFocus;
end;

procedure TWCrProductoCorp.InterForma1DespuesModificar(Sender: TObject);
begin edCVE_PRODUC_CORP.SetFocus;
end;

procedure TWCrProductoCorp.btPRODUCTO_CREDClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPROCOR_MONE',True,True) then
   begin
       Objeto.Moneda.ShowAll := True;
       If Objeto.Moneda.Busca then
          InterForma1.NextTab(edCVE_MONEDA);
       //end if
   end;
end;

procedure TWCrProductoCorp.ilMONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) then
      InterForma1.NextTab(edCVE_MONEDA);
   //end if
end;

procedure TWCrProductoCorp.ilMONEDACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrProductoCorp.btPRODUCTO_CORPClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPROCOR_PRDCP',True,True) then
   begin
       Objeto.Producto.ShowAll := True;
       If Objeto.producto.Busca then
          InterForma1.NextTab(edCVE_PRODUC_CORP);
       //end if
   end;
end;

procedure TWCrProductoCorp.ilPRODUCTOEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilPRODUCTO.Buffer]) then
      InterForma1.NextTab(edCVE_PRODUC_CORP);
   //end if
end;

procedure TWCrProductoCorp.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrProductoCorp.edCVE_MONEDAExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         Objeto.CVE_MONEDA.GetFromControl;
         if Objeto.CVE_MONEDA.AsString = '' then
         Begin
            vlMsg := ('Favor de Indicar la Moneda');
            vlSalida   := False;
         end;
         InterForma1.ValidaExit(edCVE_MONEDA,vlSalida,vlMsg,True);
      end;
end;

procedure TWCrProductoCorp.edCVE_PRODUC_CORPExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         Objeto.CVE_PRODUC_CORP.GetFromControl;
         if Objeto.CVE_PRODUC_CORP.AsString = '' then
         Begin
            vlMsg := ('Favor de Indicar el Producto Corporativo para el Ssistema de Créditos');
            vlSalida   := False;
         end;
         InterForma1.ValidaExit(edCVE_PRODUC_CORP,vlSalida,vlMsg,True);
      end;
end;

procedure TWCrProductoCorp.rgPERSONA_JURIDICAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgPERSONA_JURIDICA,True,'',True);
end;

procedure TWCrProductoCorp.MuestraHint;
Begin
      edDESC_MONEDA.Hint := Objeto.Moneda.Desc_Moneda.AsString;
      edDESC_MONEDA.ShowHint := True;
      edDESC_PRODUCTO.Hint := Objeto.Producto.Desc_Producto.AsString;
      edDESC_PRODUCTO.ShowHint := True;
End;
end.
