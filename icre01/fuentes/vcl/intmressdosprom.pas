// Sistema         : Clase de RepCtaAcr
// Fecha de Inicio : 26/05/2005
// Funci�n forma   : Clase de RepCtaAcr
// Desarrollo por  : MACV. Class Maker.
// Dise�ado por    :
// Comentarios     :
Unit IntMResSdosProm;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntParamCre,
IntMPers,
IntMon,           //Moneda
IntCrProduct,     //Producto
Intempre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntEmple, IntMQrResSdosProm
;

Type
 TMResSdoPr= class;

  TWMResSdoPr=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_MONEDA : TLabel;
    edCVE_MONEDA : TEdit;
    edDESC_MONEDA : TEdit;
    lbID_ACREDITADO : TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    edDESC_PRODUCTO: TEdit;
    btMoneda: TBitBtn;
    btCVE_PRODUCTO_CRE: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbAplica: TLabel;
    chbMoneda: TCheckBox;
    chbProducto: TCheckBox;
    ilCVE_MONEDA: TInterLinkit;
    ilCVE_PRODUCTO_CRE: TInterLinkit;
    gbControl: TGroupBox;
    Label8: TLabel;
    lbICveRequisito: TLabel;
    EdIDSucursal: TEdit;
    BBSucursal: TBitBtn;
    EdDescSucursal: TEdit;
    CBSucursal: TCheckBox;
    EdIdEmpresa: TEdit;
    bbEmpresa: TBitBtn;
    edNombreEmpresa: TEdit;
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    Label2: TLabel;
    Label4: TLabel;
    edID_PROM_ADM: TEdit;
    btID_PROM_ADM: TBitBtn;
    edNOM_PROM_ADM: TEdit;
    chbID_PROM_ADM: TCheckBox;
    edID_PROM_ASOC: TEdit;
    btID_PROM_ASOC: TBitBtn;
    edNOM_PROM_ASOC: TEdit;
    chbID_PROM_ASOC: TCheckBox;
    ilID_PROM_ADM: TInterLinkit;
    ilID_PROM_ASOC: TInterLinkit;
    rgPromotor: TRadioGroup;
    edFECHA: TEdit;
    dtpFecha: TInterDateTimePicker;
    Label1: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btMonedaClick(Sender: TObject);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure chbMonedaClick(Sender: TObject);
    procedure btCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
    procedure chbProductoClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure btID_PROM_ADMClick(Sender: TObject);
    procedure ilID_PROM_ADMEjecuta(Sender: TObject);
    procedure chbID_PROM_ADMClick(Sender: TObject);
    procedure btID_PROM_ASOCClick(Sender: TObject);
    procedure ilID_PROM_ASOCEjecuta(Sender: TObject);
    procedure chbID_PROM_ASOCClick(Sender: TObject);
    private
     Procedure EnableCheckBox(var CheckBox : TCheckBox);
     Procedure ImprimeReporte(bPreview:Boolean);
     Procedure AsignaEmpresaSuc;
    { Private declarations }
    public
    { Public declarations }
    Objeto : TMResSdoPr;
end;
 TMResSdoPr= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_MONEDA               : TInterCampo;
        DESC_MONEDA              : TInterCampo;
        CVE_PRODUCTO_CRE         : TInterCampo;
        DESC_PRODUCTO            : TInterCampo;
        ID_PROM_ADM              : TInterCampo;
        NOM_PROM_ADM             : TInterCampo;
        ID_PROM_ASOC             : TInterCampo;
        NOM_PROM_ASOC            : TInterCampo;
        FECHA                    : TInterCampo;
        ID_EMPRESA               : TInterCampo;

        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;
        Producto                 : TCrProduct;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        Promotor                 : TEmpleado; //Promotor Responsable
        PromotorAdmon            : TEmpleado; //Promotor Admon

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

constructor TMResSdoPr.Create( AOwner : TComponent );
begin Inherited;
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftString,tsNinguno,tsNinguno,False);
                CVE_MONEDA.Caption:='Moneda';
                CVE_MONEDA.Parametro:='CVE_MONEDA';
      DESC_MONEDA :=CreaCampo('DESC_MONEDA',ftString,tsNinguno,tsNinguno,False);
                DESC_MONEDA.Caption:='Descripci�n de Moneda';
                DESC_MONEDA.Parametro:='DESC_MONEDA';
      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,False);
                CVE_PRODUCTO_CRE.Caption:='Producto';
                CVE_PRODUCTO_CRE.Parametro:='CVE_PRODUCTO_CRE';
      DESC_PRODUCTO :=CreaCampo('DESC_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
                DESC_PRODUCTO.Caption:='Producto';
                DESC_PRODUCTO.Parametro:='DESC_PRODUCTO';
      ID_PROM_ADM :=CreaCampo('ID_PROM_ADM',ftInteger,tsNinguno,tsNinguno,False);
                ID_PROM_ADM.Caption:='Promotor Administrativo';
                ID_PROM_ADM.Parametro:='ID_PROM_ADM';
      NOM_PROM_ADM :=CreaCampo('NOM_PROM_ADM',ftString,tsNinguno,tsNinguno,False);
                NOM_PROM_ADM.Caption:='Promotor Administrativo';
                NOM_PROM_ADM.Parametro:='NOM_PROM_ADM';
      ID_PROM_ASOC :=CreaCampo('ID_PROM_ASOC',ftInteger,tsNinguno,tsNinguno,False);
                ID_PROM_ASOC.Caption:='Promotor Asociado';
                ID_PROM_ASOC.Parametro:='ID_PROM_ASOC';
      NOM_PROM_ASOC :=CreaCampo('NOM_PROM_ASOC',ftString,tsNinguno,tsNinguno,False);
                NOM_PROM_ASOC.Caption:='Promotor Asociado';
                NOM_PROM_ASOC.Parametro:='NOM_PROM_ASOC';
      FECHA :=CreaCampo('FECHA',ftDate,tsNinguno,tsNinguno,False);
                FECHA.Caption:='Fecha';
                FECHA.Parametro:='FECHA';
      ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,False);
                ID_EMPRESA.Caption:='Empresa';
                ID_EMPRESA.Parametro:='ID_EMPRESA';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Producto := TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);
      Promotor := TEmpleado.Create(Self);
      Promotor.FilterBy := fbTMPersonaEmpleado;
      Promotor.MasterSource := Self;
      Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROM_ASOC';
      Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';
      PromotorAdmon := TEmpleado.Create(Self);
      PromotorAdmon.FilterBy := fbTMPersonaEmpleado;
      PromotorAdmon.MasterSource := Self;
      PromotorAdmon.FieldByName('ID_PERSONA').MasterField := 'ID_PROM_ADM';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMRepCtaChqAcr.Hlp';
      ShowMenuReporte:=True;

end;

Destructor TMResSdoPr.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   If Producto <> Nil Then
      Producto.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   If Promotor <> Nil Then
      Promotor.Free;
   If PromotorAdmon <> Nil Then
      PromotorAdmon.Free;
   inherited;
end;


function TMResSdoPr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMResSdoPr;
begin
   W:=TWMResSdoPr.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TMResSdoPr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IRepctaa.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TMResSdoPr.Reporte:Boolean;
begin //Execute_Reporte();
end;
(***********************************************FORMA RepCtaAcr********************)
(*                                                                              *)
(*  FORMA DE RepCtaAcr                                                            *)
(*                                                                              *)
(***********************************************FORMA RepCtaAcr********************)
procedure TWMResSdoPr.AsignaEmpresaSuc;
begin
   Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);
   If  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) Then
      CBSucursal.Checked := True;
   EdIdEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   bbEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   BBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   CBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
end;

Procedure TWMResSdoPr.EnableCheckBox(Var CheckBox : TCheckBox);
Begin
   If Not CheckBox.Checked Then Begin
      CheckBox.Checked:=False;
      CheckBox.Enabled:=False;
   End Else Begin
      CheckBox.Checked:=True;
      CheckBox.Enabled:=True;
   End;
End;

procedure TWMResSdoPr.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.CVE_MONEDA.Control:=edCVE_MONEDA;
   Objeto.DESC_MONEDA.Control:=edDESC_MONEDA;
   Objeto.CVE_PRODUCTO_CRE.Control:=edCVE_PRODUCTO_CRE;
   Objeto.DESC_PRODUCTO.Control:=edDESC_PRODUCTO;
   Objeto.ID_PROM_ADM.Control:=edID_PROM_ADM;
   Objeto.NOM_PROM_ADM.Control:=edNOM_PROM_ADM;
   Objeto.ID_PROM_ASOC.Control:=edID_PROM_ASOC;
   Objeto.NOM_PROM_ASOC.Control:=edNOM_PROM_ASOC;
   Objeto.FECHA.Control:=edFECHA;
   Objeto.ID_EMPRESA.Control:=EdIdEmpresa;

   Objeto.Moneda.Cve_Moneda.Control:= edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control:= edDESC_MONEDA;
   Objeto.Producto.CVE_PRODUCTO_CRE.Control:= edCVE_PRODUCTO_CRE;
   Objeto.Producto.DESC_L_PRODUCTO.Control:= edDESC_PRODUCTO;
   Objeto.Promotor.ID_Persona.Control :=edID_PROM_ASOC;
   Objeto.Promotor.Persona.Nombre.Control :=edNOM_PROM_ASOC;
   Objeto.PromotorAdmon.ID_Persona.Control :=edID_PROM_ADM;
   Objeto.PromotorAdmon.Persona.Nombre.Control :=edNOM_PROM_ADM;

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);
   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;
   rgPromotor.ItemIndex:=1;
   dtpFecha.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   edFECHA.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));
end;

procedure TWMResSdoPr.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_MONEDA.Control:=nil;
   Objeto.DESC_MONEDA.Control:=nil;
   Objeto.CVE_PRODUCTO_CRE.Control:=nil;
   Objeto.DESC_PRODUCTO.Control:= nil;
   Objeto.ID_PROM_ADM.Control:=nil;
   Objeto.NOM_PROM_ADM.Control:=nil;
   Objeto.ID_PROM_ASOC.Control:=nil;
   Objeto.NOM_PROM_ASOC.Control:=nil;
   Objeto.FECHA.Control:=nil;
   Objeto.ID_EMPRESA.Control:=nil;

   Objeto.Moneda.Cve_Moneda.Control:= nil;
   Objeto.Moneda.Desc_Moneda.Control:= nil;
   Objeto.Producto.CVE_PRODUCTO_CRE.Control:= nil;
   Objeto.Producto.DESC_L_PRODUCTO.Control:= nil;
   Objeto.Promotor.ID_Persona.Control :=nil;
   Objeto.Promotor.Persona.Nombre.Control :=nil;
   Objeto.PromotorAdmon.ID_Persona.Control :=nil;
   Objeto.PromotorAdmon.Persona.Nombre.Control :=nil;

   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TWMResSdoPr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMResSdoPr.btMonedaClick(Sender: TObject);
begin
   If Objeto.Moneda.Busca Then Begin
      chbMoneda.Checked:= True;
      chbMoneda.Enabled:= True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWMResSdoPr.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilCVE_MONEDA.Buffer]) Then Begin
      chbMoneda.Checked:=True;
      chbMoneda.Enabled:=True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWMResSdoPr.chbMonedaClick(Sender: TObject);
begin
   EnableCheckBox(chbMoneda);
   Objeto.Moneda.Active := chbMoneda.Checked;
end;

procedure TWMResSdoPr.btCVE_PRODUCTO_CREClick(Sender: TObject);
begin
   If Objeto.Producto.Busca Then Begin
      chbProducto.Checked:= True;
      chbProducto.Enabled:= True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

procedure TWMResSdoPr.ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilCVE_PRODUCTO_CRE.Buffer]) Then Begin
      chbProducto.Checked:=True;
      chbProducto.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

procedure TWMResSdoPr.chbProductoClick(Sender: TObject);
begin
   EnableCheckBox(chbProducto);
   Objeto.Producto.Active := chbProducto.Checked;
end;

Procedure TWMResSdoPr.ImprimeReporte(bPreview:Boolean);
Var sTipPromotor: String;
begin
   Objeto.GetFromControl;
    objeto.CVE_MONEDA.GetFromControl;
    Objeto.CVE_PRODUCTO_CRE.GetFromControl;
    Objeto.ID_PROM_ADM.GetFromControl;
    Objeto.ID_PROM_ASOC.GetFromControl;
    Objeto.FECHA.GetFromControl;
    Objeto.ID_EMPRESA.GetFromControl;

   case rgPromotor.ItemIndex of
      0: sTipPromotor:='ASC';
      1: sTipPromotor:='ADM';
      2: sTipPromotor:='';
   end;

    RepResSdosProm(objeto.CVE_MONEDA.AsString,     Objeto.CVE_PRODUCTO_CRE.AsString,
                   Objeto.ID_PROM_ADM.AsString,    Objeto.ID_PROM_ASOC.AsString,
                   sTipPromotor,                      Objeto.ID_EMPRESA.AsString,
                   Objeto.FECHA.AsDateTime,        Objeto.Apli,                    bPreview  );
End;

procedure TWMResSdoPr.InterForma1BtnPreviewClick(Sender: TObject);
begin
   ImprimeReporte(True);
end;

procedure TWMResSdoPr.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimeReporte(False);
end;

procedure TWMResSdoPr.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TWMResSdoPr.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMResSdoPr.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TWMResSdoPr.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMResSdoPr.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TWMResSdoPr.btID_PROM_ADMClick(Sender: TObject);
begin
   Objeto.PromotorAdmon.ShowAll := True;
   If Objeto.PromotorAdmon.Busca Then Begin
      chbID_PROM_ADM.Checked:=True;
      chbID_PROM_ADM.Enabled:=True;
      InterForma1.NextTab(edID_PROM_ADM);
   End;
end;

procedure TWMResSdoPr.ilID_PROM_ADMEjecuta(Sender: TObject);
begin
   If Objeto.PromotorAdmon.FindKey([ilID_PROM_ADM.Buffer])Then Begin
      chbID_PROM_ADM.Checked:=True;
      chbID_PROM_ADM.Enabled:=True;
      InterForma1.NextTab(edID_PROM_ADM);
   End;
end;

procedure TWMResSdoPr.chbID_PROM_ADMClick(Sender: TObject);
begin
   EnableCheckBox(chbID_PROM_ADM);
   Objeto.PromotorAdmon.Active := chbID_PROM_ADM.Checked;
end;

procedure TWMResSdoPr.btID_PROM_ASOCClick(Sender: TObject);
begin
   Objeto.Promotor.ShowAll := True;
   If Objeto.Promotor.Busca Then Begin
      chbID_PROM_ASOC.Checked:=True;
      chbID_PROM_ASOC.Enabled:=True;
      InterForma1.NextTab(edID_PROM_ASOC);
   End;
end;

procedure TWMResSdoPr.ilID_PROM_ASOCEjecuta(Sender: TObject);
begin
   If Objeto.Promotor.FindKey([ilID_PROM_ASOC.Buffer])Then Begin
      chbID_PROM_ASOC.Checked:=True;
      chbID_PROM_ASOC.Enabled:=True;
      InterForma1.NextTab(edID_PROM_ASOC);
   End;
end;

procedure TWMResSdoPr.chbID_PROM_ASOCClick(Sender: TObject);
begin
   EnableCheckBox(chbID_PROM_ADM);
   Objeto.Promotor.Active := chbID_PROM_ASOC.Checked;
end;

end.



