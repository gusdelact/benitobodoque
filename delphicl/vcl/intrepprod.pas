unit IntRepProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, db,
  InterFor, StdCtrls, ExtCtrls, Menus, Buttons, UnSql2, IntFrm,ComCtrls,
  IntMPers, IntProd, IntConceCtte;


type
  TReporteProducto = class;

  TwReporteProducto = class(TForm)
    InterForma1: TInterForma;
    edIdEmpresa: TEdit;
    edDescEmpresa: TEdit;
    sbIdEmpresa: TBitBtn;
    edCveProducto: TEdit;
    edDescProducto: TEdit;
    sbCveProducto: TBitBtn;
    edCveConcepCtte: TEdit;
    edDescConcepCtte: TEdit;
    sbCveConcepCtte: TBitBtn;
    PopupEmpresa: TPopupMenu;
    PopupProducto: TPopupMenu;
    PopupConcepto: TPopupMenu;
    NoSeleccionar1: TMenuItem;
    NoSeleccionar2: TMenuItem;
    NoSeleccionar3: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure InterForma1Preview(Sender: TObject);
    procedure InterForma1Imprimir(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure sbIdEmpresaClick(Sender: TObject);
    procedure sbCveProductoClick(Sender: TObject);
    procedure sbCveConcepCtteClick(Sender: TObject);
    procedure NoSeleccionar1Click(Sender: TObject);
    procedure NoSeleccionar2Click(Sender: TObject);
    procedure NoSeleccionar3Click(Sender: TObject);
  private
    { Private declarations }
  protected
  public
    { Public declarations }
      Objeto: TReporteProducto;
      procedure Impresion(Preview: Boolean);
  end;

  TReporteProducto = class(TInterFrame)
  private
  public
  		Id_Empresa		: TInterCampo;
		Cve_Producto	: TInterCampo;
      Cve_Concep_ctte: TInterCampo;
      Desc_Concepto  : TInterCampo;

      Empresa: TMPersona;
      Producto: TProducto;
      Concepto: TConcCtte;

      Constructor Create( AOwner: TComponent); override;
      Destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      procedure   DatabaseChange; override;
  end;

var wReporteProducto: TwReporteProducto;

implementation

Uses RepProd; //Unidad(es) que Contiene el Reporte de QuickReports

{$R *.DFM}


Constructor TReporteProducto.Create( AOwner: TComponent);
begin
	inherited;

   Id_Empresa		:= CreaCampo('ID_EMPRESA',ftinteger,tsNinguno,tsNinguno,False);
   Cve_Producto	:= CreaCampo('CVE_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
   Cve_Concep_ctte:= CreaCampo('CVE_CONCEP_CTTE',ftString,tsNinguno,tsNinguno,False);
   Desc_Concepto  := CreaCampo('DESC_CONCEPTO',ftString,tsNinguno,tsNinguno,False);


   Empresa:= TMPersona.Create(self);
   Empresa.FilterBy := fbTMPersonaEmpresa;
   Producto:= TProducto.Create(self);
   Concepto:= TConcCtte.Create(self);
   Concepto.BuscaWhereString := 'CVE_CTTE = ''TI''';
end;

Destructor  TReporteProducto.destroy;
begin
	if Empresa <> nil then Empresa.Free;
   if Producto <> nil then Producto.Free;
   if Concepto <> nil then Concepto.Free;
	inherited;
end;

procedure TReporteProducto.DatabaseChange;
begin
	inherited;
   Empresa.GetParams(self);
   Producto.GetParams(self);
   Concepto.GetParams(self);
end;

Function TReporteProducto.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var   W: TwReporteProducto;
begin W:= TwReporteProducto.Create(self);
      try
         W.Objeto := Self;
         w.InterForma1.CentrarForma := True;
         W.InterForma1.FormaTipo := ftImprimir; // DEFINE LOS BOTONES DE IMPRIMIR Y PREVIEW EN LA VENTANA
         W.InterForma1.Funcion := FInterFun;
         W.InterForma1.ShowModal;
         ShowWindow := W.InterForma1.ModalResult;
      finally W.Free;
      end;
end;

(*************************************************************************)
(*                                 FORMA DEL REPORTE                     *)
(*************************************************************************)

procedure TwReporteProducto.FormShow(Sender: TObject);
begin //   Objeto.ClaseUsada.cve_clase.Control := edCveClase;
      //   Objeto.ClaseUsada.desc_clase.Control := edDescClase;

	Objeto.Empresa.ID_Persona.Control := edIdEmpresa;
	Objeto.Empresa.Nombre.Control := edDescEmpresa;
   Objeto.Producto.Cve_Producto.Control := edCveProducto;
   Objeto.Producto.Desc_Producto.Control := edDescProducto;
   Objeto.Concepto.CVE_CONCEP_CTTE.Control := edCveConcepCtte;
   Objeto.Concepto.DESC_CONCEPTO.Control := edDescConcepCtte;
end;

procedure TwReporteProducto.FormHide(Sender: TObject);
begin
	Objeto.Empresa.ID_Persona.Control := nil;
	Objeto.Empresa.Nombre.Control := nil;
   Objeto.Producto.Cve_Producto.Control := nil;
   Objeto.Producto.Desc_Producto.Control := nil;
   Objeto.Concepto.CVE_CONCEP_CTTE.Control := nil;
   Objeto.Concepto.DESC_CONCEPTO.Control := nil;
end;

procedure TwReporteProducto.Impresion(Preview: Boolean);
var sql:String;
begin
	If Objeto.Empresa.Active Then
   	Objeto.Id_Empresa.AsInteger := Objeto.Empresa.ID_Persona.AsInteger else Objeto.Id_Empresa.asString := '';
   If Objeto.Producto.Active Then
   	Objeto.Cve_Producto.AsString := Objeto.Producto.Cve_Producto.AsString else Objeto.Cve_Producto.AsString := '';
   If Objeto.Concepto.Active Then
      begin
         Objeto.Cve_Concep_ctte.AsString := Objeto.Concepto.CVE_CONCEP_CTTE.AsString;
         Objeto.Desc_Concepto.AsString := Objeto.Concepto.DESC_CONCEPTO.AsString;
      end
   else
      begin
         Objeto.Cve_Concep_ctte.AsString := '';
         Objeto.Desc_Concepto.AsString := '';
      end;


   Execute_RepProd(Objeto, Preview);
end;

procedure TwReporteProducto.InterForma1Preview(Sender: TObject);
begin  Impresion(True);
end;

procedure TwReporteProducto.InterForma1Imprimir(Sender: TObject);
begin  Impresion(False);
end;

procedure TwReporteProducto.sbIdEmpresaClick(Sender: TObject);
begin	Objeto.Empresa.Busca;
end;

procedure TwReporteProducto.sbCveProductoClick(Sender: TObject);
begin	Objeto.Producto.Busca;
end;

procedure TwReporteProducto.sbCveConcepCtteClick(Sender: TObject);
begin Objeto.Concepto.Busca;
end;

procedure TwReporteProducto.NoSeleccionar1Click(Sender: TObject);
begin Objeto.Empresa.Active := False;
end;

procedure TwReporteProducto.NoSeleccionar2Click(Sender: TObject);
begin Objeto.Producto.Active := False;
end;

procedure TwReporteProducto.NoSeleccionar3Click(Sender: TObject);
begin Objeto.Concepto.Active := False;
end;

end.
