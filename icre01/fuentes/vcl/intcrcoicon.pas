// Sistema         : Clase de CR_COINCRE_CONC
// Fecha de Inicio : 07/03/2006
// Función forma   : Clase de CR_COINCRE_CONC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntCrCoiCon;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

IntParamCre,
IntCrProduct,   //Producto Credito
IntCrStB

;

Type
 TCrCoiCon= class;

  TWCrCoincreConc=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_OLTP_PRODUCTO : TLabel; 
    edID_OLTP_PRODUCTO : TEdit;
    lbID_REPORTE : TLabel; 
    edID_REPORTE : TEdit;
    lbID_METRICA : TLabel; 
    edID_METRICA : TEdit;
    lbCVE_CTA_CONTABLE : TLabel; 
    edCVE_CTA_CONTABLE : TEdit;
    lbSIT_RELACION : TLabel; 
    edSIT_RELACION : TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO: TEdit;
    cbSistemaCredito: TComboBox;
    ilPRODUCTO: TInterLinkit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrCoiCon;
end; 
 TCrCoiCon= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public 
        { Public declarations } 
        ID_OLTP_PRODUCTO         : TInterCampo;
        ID_REPORTE               : TInterCampo;
        ID_METRICA               : TInterCampo;
        CVE_CTA_CONTABLE         : TInterCampo;
        SIT_RELACION             : TInterCampo;

        ParamCre                 : TParamCre;        
        Producto                 : TCrProduct;
        SubTipo                  : TCrStB;

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


constructor TCrCoiCon.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_OLTP_PRODUCTO :=CreaCampo('ID_OLTP_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
                ID_OLTP_PRODUCTO.Caption:='Número de Oltp Producto';
      ID_REPORTE :=CreaCampo('ID_REPORTE',ftFloat,tsNinguno,tsNinguno,True);
                ID_REPORTE.Caption:='Número de Reporte';
      ID_METRICA :=CreaCampo('ID_METRICA',ftFloat,tsNinguno,tsNinguno,True);
                ID_METRICA.Caption:='Número de Metrica';
      CVE_CTA_CONTABLE :=CreaCampo('CVE_CTA_CONTABLE',ftString,tsNinguno,tsNinguno,True);
                CVE_CTA_CONTABLE.Caption:='Clave de Cta Contable';
      SIT_RELACION :=CreaCampo('SIT_RELACION',ftString,tsNinguno,tsNinguno,True);
                SIT_RELACION.Caption:='Situación Relacion';
      FKeyFields.Add('ID_OLTP_PRODUCTO');
      FKeyFields.Add('ID_REPORTE');
      FKeyFields.Add('ID_METRICA');
      FKeyFields.Add('CVE_CTA_CONTABLE');

      TableName := 'CR_COINCRE_CONC';
      UseQuery := True;
      HelpFile := 'IntCrCoiCon.Hlp';
      ShowMenuReporte:=True;

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='ID_OLTP_PRODUCTO';

      SubTipo :=  TCrStB.Create(Self);
      SubTipo.MasterSource:=Self;
      SubTipo.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='CVE_PRODUCTO_CRE';
end;

Destructor TCrCoiCon.Destroy;
begin inherited;
end;


function TCrCoiCon.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCoincreConc;
begin
   W:=TWCrCoincreConc.Create(Self);
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


Function TCrCoiCon.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCoCo.it','S,F,F,S');
      Try if Active then begin T.Param(0,ID_OLTP_PRODUCTO.AsString); 
                               T.Param(1,ID_REPORTE.AsString); 
                               T.Param(2,ID_METRICA.AsString); 
                               T.Param(3,CVE_CTA_CONTABLE.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
      finally  T.Free;
      end; 
end;

function TCrCoiCon.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_COINCRE_CONC********************)
(*                                                                              *)
(*  FORMA DE CR_COINCRE_CONC                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_COINCRE_CONC********************)

procedure TWCrCoincreConc.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_OLTP_PRODUCTO.Control:=edID_OLTP_PRODUCTO;
      Objeto.ID_REPORTE.Control:=edID_REPORTE;
      Objeto.ID_METRICA.Control:=edID_METRICA;
      Objeto.CVE_CTA_CONTABLE.Control:=edCVE_CTA_CONTABLE;
      Objeto.SIT_RELACION.Control:=edSIT_RELACION;
end;

procedure TWCrCoincreConc.FormDestroy(Sender: TObject);
begin
      Objeto.ID_OLTP_PRODUCTO.Control:=nil;
      Objeto.ID_REPORTE.Control:=nil;
      Objeto.ID_METRICA.Control:=nil;
      Objeto.CVE_CTA_CONTABLE.Control:=nil;
      Objeto.SIT_RELACION.Control:=nil;
   //Objeto
end;

procedure TWCrCoincreConc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCoincreConc.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCoincreConc.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCoincreConc.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrCoincreConc.btPRODUCTOClick(Sender: TObject);
begin
   Objeto.Producto.ShowAll := True;
   if Objeto.Producto.Busca then
      InterForma1.NextTab(cbSistemaCredito);
   //end if

   
end;

procedure TWCrCoincreConc.ilPRODUCTOEjecuta(Sender: TObject);
begin
   if Objeto.Producto.FindKey([ilPRODUCTO.Buffer])then
      InterForma1.NextTab(cbSistemaCredito);
   //end if
end;

end.
