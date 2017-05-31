// Sistema         : Clase de CR_CONT_CTA_CC
// Fecha de Inicio : 26/04/2007
// Función forma   : Clase de CR_CONT_CTA_CC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Arturo Salcedo Caballero
// Comentarios     :
Unit IntCrCoCtCc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, intmon,IntCrProduct,
IntParamCre;

Type
 TCrCoCtCc= class;

  TWCrContCtaCc=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_PRODUCTO : TLabel;
    edCVE_PRODUCTO : TEdit;
    lbCVE_MONEDA : TLabel;
    edCVE_MONEDA : TEdit;
    lbCVE_CTA_CONTABLE : TLabel; 
    edCVE_CTA_CONTABLE : TEdit;
    lbID_CENT_COSTO : TLabel; 
    edID_CENT_COSTO : TEdit;
    sbCveProducto: TSpeedButton;
    sbMoneda: TSpeedButton;
    sbCtaContable: TSpeedButton;
    sbCentroCosto: TSpeedButton;
    edDesCveProd: TEdit;
    edDesMoneda: TEdit;
    edCtaContable: TEdit;
    edDesCentroCosto: TEdit;
    ilCveProducto: TInterLinkit;
    ilMoneda: TInterLinkit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilCtaContable: TInterLinkit;
    ilCentroConsto: TInterLinkit;    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbCveProductoClick(Sender: TObject);
    procedure sbMonedaClick(Sender: TObject);
    procedure ilCveProductoCapture(Sender: TObject; var Show: Boolean);
    procedure ilMonedaCapture(Sender: TObject; var Show: Boolean);
    procedure ilMonedaEjecuta(Sender: TObject);
    procedure ilCveProductoEjecuta(Sender: TObject);
    procedure sbCtaContableClick(Sender: TObject);
    procedure sbCentroCostoClick(Sender: TObject);
    procedure ilCtaContableCapture(Sender: TObject; var Show: Boolean);
    procedure ilCentroCostoCapture(Sender: TObject; var Show: Boolean);
    procedure ilCtaContableEjecuta(Sender: TObject);
    procedure LimpiaCampos;
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure ilCentroConstoEjecuta(Sender: TObject);
    procedure ilCentroConstoCapture(Sender: TObject; var Show: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrCoCtCc;
end; 
 TCrCoCtCc= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        { Public declarations }
        CVE_PRODUCTO             : TInterCampo;
        CVE_MONEDA               : TInterCampo;
        CVE_CTA_CONTABLE         : TInterCampo;
        ID_CENT_COSTO            : TInterCampo;
        ParamCre                 : TParamCre;
        Producto                 : TCrProduct;
        Moneda                   : TMoneda;
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


constructor TCrCoCtCc.Create( AOwner : TComponent );
begin Inherited; 
      CVE_PRODUCTO :=CreaCampo('CVE_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
                CVE_PRODUCTO.Caption:='Clave de Producto';
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA.Caption:='Clave de Moneda';
      CVE_CTA_CONTABLE :=CreaCampo('CVE_CTA_CONTABLE',ftString,tsNinguno,tsNinguno,True);
                CVE_CTA_CONTABLE.Caption:='Clave de Cta Contable';
      ID_CENT_COSTO :=CreaCampo('ID_CENT_COSTO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CENT_COSTO.Caption:='Número de Cent Costo';
      FKeyFields.Add('CVE_PRODUCTO');
      FKeyFields.Add('CVE_MONEDA');
      FKeyFields.Add('CVE_CTA_CONTABLE');

      TableName := 'CR_CONT_CTA_CC';
      UseQuery := True;
      HelpFile := 'IntCrCoCtCc.Hlp';
      ShowMenuReporte:=True;

      Producto:= TCrProduct.Create(nil);
      Producto.MasterSource:=Self;
      Producto.CVE_PRODUCTO_CRE.MasterField:='CVE_PRODUCTO';

      Moneda:= TMoneda.Create(nil);
      Moneda.MasterSource:=Self;
      Moneda.Cve_Moneda.MasterField:='CVE_MONEDA';

end;

Destructor TCrCoCtCc.Destroy;
begin inherited;
end;


function TCrCoCtCc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrContCtaCc;
begin
   W:=TWCrContCtaCc.Create(Self);
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


Function TCrCoCtCc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCoCC.it','S,F,S');
      Try if Active then begin T.Param(0,CVE_PRODUCTO.AsString);
                               T.Param(1,CVE_MONEDA.AsString);
                               T.Param(2,CVE_CTA_CONTABLE.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end; 
end;

function TCrCoCtCc.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_CONT_CTA_CC********************)
(*                                                                              *)
(*  FORMA DE CR_CONT_CTA_CC                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CONT_CTA_CC********************)

procedure TWCrContCtaCc.FormShow(Sender: TObject);
begin
      Objeto.CVE_PRODUCTO.Control:=edCVE_PRODUCTO;
      Objeto.CVE_MONEDA.Control:=edCVE_MONEDA;
      Objeto.CVE_CTA_CONTABLE.Control:=edCVE_CTA_CONTABLE;
      Objeto.ID_CENT_COSTO.Control:=edID_CENT_COSTO;

      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := Objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := Objeto.ParamCre.PERFIL.AsString;

      Objeto.Producto.CVE_PRODUCTO_CRE.Control:= edCVE_PRODUCTO;
      Objeto.Producto.DESC_C_PRODUCTO.Control := edDesCveProd;

      Objeto.Moneda.Cve_Moneda.Control  := edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control := edDesMoneda;

end;

procedure TWCrContCtaCc.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_PRODUCTO.Control:=nil;
      Objeto.CVE_MONEDA.Control:=nil;
      Objeto.CVE_CTA_CONTABLE.Control:=nil;
      Objeto.ID_CENT_COSTO.Control:=nil;


      Objeto.Producto.CVE_PRODUCTO_CRE.Control:= nil;
      Objeto.Producto.DESC_C_PRODUCTO.Control := nil;

      Objeto.Moneda.Cve_Moneda.Control  := nil;
      Objeto.Moneda.Desc_Moneda.Control := nil;

   //Objeto
end;

procedure TWCrContCtaCc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrContCtaCc.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrContCtaCc.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrContCtaCc.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrContCtaCc.sbCveProductoClick(Sender: TObject);
begin
  Objeto.Producto.Busca;
end;

procedure TWCrContCtaCc.sbMonedaClick(Sender: TObject);
begin
  Objeto.Moneda.Busca;
end;

procedure TWCrContCtaCc.ilCveProductoCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show:=True;
end;

procedure TWCrContCtaCc.ilMonedaCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show:=True;
end;

procedure TWCrContCtaCc.ilMonedaEjecuta(Sender: TObject);
begin
  Objeto.Moneda.FindKey([ilMoneda.Buffer]);
end;

procedure TWCrContCtaCc.ilCveProductoEjecuta(Sender: TObject);
begin
  Objeto.Producto.FindKey([ilCveProducto.Buffer]);
end;

procedure TWCrContCtaCc.sbCtaContableClick(Sender: TObject);
Var T:TInterFindit;
begin
      T := Objeto.CreaBuscador('IntCGCta2.it','F,F,F,S');
      Try if Active then begin T.Param(0,IntToStr(Objeto.Apli.IdEmpresa));
                               T.Param(1,FormatDateTime('YYYY',Objeto.Apli.DameFechaEmpresa));
                               T.Param(2,edCVE_MONEDA.Text);
                               T.Param(3,edCVE_CTA_CONTABLE.text);
                               end;
          if T.Execute then
          begin
            edCVE_CTA_CONTABLE.text  := T.DameCampo(3);
            edCtaContable.Text       := T.DameCampo(4);
          end
      finally  T.Free;
      end;
end;

procedure TWCrContCtaCc.sbCentroCostoClick(Sender: TObject);
Var T:TInterFindit;
begin
      T := Objeto.CreaBuscador('IntCgCC2.it','S,S,F,S');
      Try if Active then begin T.Param(0,IntToStr(Objeto.Apli.IdEmpresa));
                               T.Param(1,FormatDateTime('YYYY',Objeto.Apli.DameFechaEmpresa));
                               T.Param(2,edCVE_MONEDA.Text);
                               T.Param(3,edID_CENT_COSTO.Text);
                               end;

          if T.Execute then
          begin
            edID_CENT_COSTO.Text  := T.DameCampo(3);
            edDesCentroCosto.Text := T.DameCampo(4);
          end
      finally  T.Free;
      end;
end;

procedure TWCrContCtaCc.ilCtaContableCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show:=True;
end;

procedure TWCrContCtaCc.ilCentroCostoCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show:=True;
end;

procedure TWCrContCtaCc.ilCtaContableEjecuta(Sender: TObject);
VAR
vlcuenta: string;
begin
IF Length( edCVE_CTA_CONTABLE.Text) <> 0 THEN
 BEGIN
  GetSQLStr('SELECT DESC_CUENTAC FROM CG_CUENTA@CONT WHERE ID_EMPRESA ='+IntToStr( Objeto.Apli.IdEmpresa)+
            ' AND CVE_EJER_CONT = '+FormatDateTime('YYYY',Objeto.Apli.DameFechaEmpresa)+
            ' AND CVE_MONEDA = '+edCVE_MONEDA.Text+
            ' AND CVE_CTA_CONTABLE = '''+edCVE_CTA_CONTABLE.Text +'''',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,
            'DESC_CUENTAC', vlcuenta,FALSE);
  IF  Length(vlcuenta) <>0 THEN
      edCtaContable.Text:= vlcuenta;

 END;
end;

procedure TWCrContCtaCc.LimpiaCampos;
begin
edCVE_PRODUCTO.Clear;
edDesCveProd.Clear;
edCVE_MONEDA.Clear;
edDesMoneda.Clear;
edCVE_CTA_CONTABLE.Clear;
edCtaContable.Clear;
edID_CENT_COSTO.Clear;
edDesCentroCosto.Clear;

end;

procedure TWCrContCtaCc.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
  LimpiaCampos;
end;

procedure TWCrContCtaCc.InterForma1DespuesCancelar(Sender: TObject);
begin
  LimpiaCampos;
end;

procedure TWCrContCtaCc.ilCentroConstoEjecuta(Sender: TObject);
VAR
vlcentro: string;
begin
IF Length( edID_CENT_COSTO.Text) <> 0 THEN
 BEGIN
  GetSQLStr('SELECT DESC_CENT_COSTO FROM CG_CENTRO_COSTO@CONT WHERE ID_EMPRESA ='+IntToStr( Objeto.Apli.IdEmpresa)+
            ' AND CVE_EJER_CONT = '+FormatDateTime('YYYY',Objeto.Apli.DameFechaEmpresa)+
            ' AND CVE_MONEDA = '+edCVE_MONEDA.Text+
            ' AND ID_CENT_COSTO = '''+edID_CENT_COSTO.Text +'''',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,
            'DESC_CUENTAC', vlcentro,FALSE);
  IF  Length(vlcentro) <>0 THEN
      edDesCentroCosto.Text:= vlcentro;
 END;
end;


procedure TWCrContCtaCc.ilCentroConstoCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TWCrContCtaCc.InterForma1DespuesAceptar(Sender: TObject);
begin
  LimpiaCampos;
end;

end.

