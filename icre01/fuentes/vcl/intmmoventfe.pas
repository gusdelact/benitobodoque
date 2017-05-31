// Sistema         :
// Fecha de Inicio :
// Función forma   :
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMMovEntFe;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntParamCre,
InterEdit,
IntMPers,
IntMon,           //Moneda
IntEmpre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntCrCredito,     //Disposición
IntCrProduct,     //Producto
IntCrAcredit,
IntEmple, IntMQrMovEntFe 
;

Type
 TMMovEntFe = class;

  TwMMovEntFe = Class(TForm)
    InterForma1             : TInterForma;
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
    gbControl: TGroupBox;
    Label8: TLabel;
    lbICveRequisito: TLabel;
    EdIDSucursal: TEdit;
    BBSucursal: TBitBtn;
    EdDescSucursal: TEdit;
    CBSucursal: TCheckBox;
    edIdEmpresa: TEdit;
    bbEmpresa: TBitBtn;
    edNombreEmpresa: TEdit;
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    edFECHA: TEdit;
    dtpFecha: TInterDateTimePicker;
    Label1: TLabel;
    Label3: TLabel;
    edID_TITULAR: TEdit;
    btID_TITULAR: TBitBtn;
    edNOM_TITULAR: TEdit;
    chbID_TITULAR: TCheckBox;
    ilID_TITULAR: TInterLinkit;
    Label6: TLabel;
    edDisposicion: TEdit;
    btDisposicion: TBitBtn;
    edNomDisposicion: TEdit;
    cbxDisposicion: TCheckBox;
    ilDisposicion: TInterLinkit;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    edDESC_MONEDA: TEdit;
    btMoneda: TBitBtn;
    chbMoneda: TCheckBox;
    ilCVE_MONEDA: TInterLinkit;
    lbID_ACREDITADO: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    edDESC_PRODUCTO: TEdit;
    btCVE_PRODUCTO_CRE: TBitBtn;
    chbProducto: TCheckBox;
    ilCVE_PRODUCTO_CRE: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure btID_TITULARClick(Sender: TObject);
    procedure chbID_TITULARClick(Sender: TObject);
    procedure ilID_TITULAREjecuta(Sender: TObject);
    procedure edFECHAExit(Sender: TObject);
    procedure btDisposicionClick(Sender: TObject);
    procedure ilDisposicionEjecuta(Sender: TObject);
    procedure cbxDisposicionClick(Sender: TObject);
    procedure btMonedaClick(Sender: TObject);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure chbMonedaClick(Sender: TObject);
    procedure btCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
    procedure chbProductoClick(Sender: TObject);
    private
      Procedure EnableCheckBox(var CheckBox : TCheckBox);
      Procedure ImprimeReporte(bPreview:Boolean);
      Procedure AsignaEmpresaSuc;
      procedure VerificaFechaCtrls(pedFecha: TEdit; pdtpFecha: TInterDateTimePicker);

    { Private declarations }
    public
    { Public declarations }
    Objeto : TMMovEntFe;
end;
 TMMovEntFe= class(TInterFrame)
      private
      protected
      public
        { Public declarations }

        CVE_MONEDA               : TInterCampo;
        DESC_MONEDA              : TInterCampo;
        CVE_PRODUCTO_CRE         : TInterCampo;
        DESC_PRODUCTO            : TInterCampo;
        ID_CREDITO               : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        DESC_CONTRATO            : TInterCampo;
        FECHA                    : TInterCampo;
        ID_TITULAR               : TInterCampo;
        NOM_TITULAR              : TInterCampo;

        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;
        Producto                 : TCrProduct;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        CrCredito                : TCrCredito;
        Titular                  : TCrAcredit;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
//Uses RepMon;
{$R *.DFM}

constructor TMMovEntFe.Create( AOwner : TComponent );
begin Inherited;

      CVE_MONEDA := CreaCampo('CVE_MONEDA',ftString,tsNinguno,tsNinguno,False);
                CVE_MONEDA.Caption := 'Moneda';
                CVE_MONEDA.Parametro := 'CVE_MONEDA';
      DESC_MONEDA := CreaCampo('DESC_MONEDA',ftString,tsNinguno,tsNinguno,False);
                DESC_MONEDA.Caption := 'Descripción de Moneda';
                DESC_MONEDA.Parametro := 'DESC_MONEDA';
      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,False);
                CVE_PRODUCTO_CRE.Caption:='Producto';
                CVE_PRODUCTO_CRE.Parametro:='CVE_PRODUCTO_CRE';
      DESC_PRODUCTO :=CreaCampo('DESC_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
                DESC_PRODUCTO.Caption:='Producto';
                DESC_PRODUCTO.Parametro:='DESC_PRODUCTO';
      ID_CREDITO := CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
                ID_CREDITO.Caption := 'Número Disposición';
                ID_CREDITO.Parametro := 'ID_CREDITO';
      FECHA := CreaCampo('FECHA',ftDate,tsNinguno,tsNinguno,False);
                FECHA.Caption := 'Fecha';
                FECHA.Parametro := 'FECHA';
      ID_TITULAR := CreaCampo('ID_TITULAR',ftInteger,tsNinguno,tsNinguno,False);
                ID_TITULAR.Caption := 'Titular';
                ID_TITULAR.Parametro := 'ID_TITULAR';
      NOM_TITULAR := CreaCampo('NOM_TITULAR',ftString,tsNinguno,tsNinguno,False);
                NOM_TITULAR.Caption:='Nombre Titular';
                NOM_TITULAR.Parametro:='NOM_TITULAR';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;

      Producto := TCrProduct.Create(Self);
      Producto.MasterSource:=Self;

      CrCredito := TCrCredito.Create(Self);
      CrCredito.MasterSource:=Self;

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      Titular := TCrAcredit.Create(Self);
      Titular.MasterSource:=Self;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMMovEntFe.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMMovEntFe.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   If Producto <> Nil Then
      Producto.Free;
   If CrCredito <> Nil then
      CrCredito.Free;
   if Empresa <> Nil then
      Empresa.free;
   if UnidadNegocio <> Nil then
      UnidadNegocio.Free;
   If Titular <> Nil Then
      Titular.Free;
   inherited;
end;


function TMMovEntFe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMMovEntFe;
begin
   W := TwMMovEntFe.Create(Self);
   try
      W.Objeto := Self;
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

function TMMovEntFe.Reporte:Boolean;
begin //Execute_Reporte();
end;
(****************************************FORMA IntMMovEntFe********************)
(*                                                                            *)
(*  FORMA DE IntMMovEntFe                                                     *)
(*                                                                            *)
(****************************************FORMA IntMMovEntFe********************)
procedure TwMMovEntFe.AsignaEmpresaSuc;
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

Procedure TwMMovEntFe.EnableCheckBox(Var CheckBox : TCheckBox);
Begin
   If Not CheckBox.Checked Then Begin
      CheckBox.Checked:=False;
      CheckBox.Enabled:=False;
   End Else Begin
      CheckBox.Checked:=True;
      CheckBox.Enabled:=True;
   End;
End;

procedure TwMMovEntFe.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.CVE_MONEDA.Control := edCVE_MONEDA;
   Objeto.DESC_MONEDA.Control := edDESC_MONEDA;
   Objeto.CVE_PRODUCTO_CRE.Control:=edCVE_PRODUCTO_CRE;
   Objeto.DESC_PRODUCTO.Control:=edDESC_PRODUCTO;
   Objeto.ID_CREDITO.Control := edDisposicion;
   Objeto.FECHA.Control := edFECHA;
   Objeto.ID_TITULAR.Control := edID_TITULAR;
   Objeto.NOM_TITULAR.Control := edNOM_TITULAR;

   Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
   Objeto.Producto.CVE_PRODUCTO_CRE.Control:= edCVE_PRODUCTO_CRE;
   Objeto.Producto.DESC_L_PRODUCTO.Control:= edDESC_PRODUCTO;
   Objeto.CrCredito.ID_CREDITO.Control := edDisposicion;
   Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edNomDisposicion;
   Objeto.Titular.ID_ACREDITADO.Control := edID_TITULAR;
   Objeto.Titular.Persona.Nombre.Control := edNOM_TITULAR;

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);
   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;
   dtpFecha.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   edFECHA.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));
end;

procedure TwMMovEntFe.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_MONEDA.Control := Nil;
   Objeto.DESC_MONEDA.Control := Nil;
   Objeto.CVE_PRODUCTO_CRE.Control := Nil;
   Objeto.DESC_PRODUCTO.Control := Nil;
   Objeto.ID_CREDITO.Control := Nil;
   Objeto.FECHA.Control := Nil;
   Objeto.ID_TITULAR.Control := Nil;
   Objeto.NOM_TITULAR.Control := Nil;

   Objeto.Moneda.Cve_Moneda.Control := Nil;
   Objeto.Moneda.Desc_Moneda.Control := Nil;
   Objeto.Producto.CVE_PRODUCTO_CRE.Control := Nil;
   Objeto.Producto.DESC_L_PRODUCTO.Control := Nil;
   Objeto.CrCredito.ID_CREDITO.Control := Nil;
   Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := Nil;
   Objeto.Titular.ID_ACREDITADO.Control := Nil;
   Objeto.Titular.Persona.Nombre.Control := Nil;

   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMMovEntFe.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

Procedure TwMMovEntFe.ImprimeReporte(bPreview:Boolean);
begin
   Objeto.CVE_MONEDA.GetFromControl;
   Objeto.CVE_PRODUCTO_CRE.GetFromControl;
   Objeto.ID_TITULAR.GetFromControl;
   Objeto.ID_CREDITO.GetFromControl;
   Objeto.FECHA.GetFromControl;

   RepMovEntFe( Objeto.CVE_MONEDA.AsString,       Objeto.CVE_PRODUCTO_CRE.AsString,
                Objeto.ID_TITULAR.AsString,       Objeto.ID_CREDITO.AsString,
                edIdEmpresa.Text,                 EdIDSucursal.Text,
                Objeto.FECHA.AsDateTime,
                Objeto.Apli,                      bPreview);
End;

procedure TwMMovEntFe.InterForma1BtnPreviewClick(Sender: TObject);
begin
   ImprimeReporte(True);
end;

procedure TwMMovEntFe.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimeReporte(False);
end;

procedure TwMMovEntFe.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMMovEntFe.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMMovEntFe.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMMovEntFe.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([IlSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMMovEntFe.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMMovEntFe.btID_TITULARClick(Sender: TObject);
begin
   Objeto.Titular.ShowAll := True;
   If Objeto.Titular.Busca Then Begin
      chbID_TITULAR.Checked := True;
      chbID_TITULAR.Enabled := True;
      InterForma1.NextTab(edID_TITULAR);
   End;
end;

procedure TwMMovEntFe.chbID_TITULARClick(Sender: TObject);
begin
   EnableCheckBox(chbID_TITULAR);
   Objeto.Titular.Active := chbID_TITULAR.Checked;
end;

procedure TwMMovEntFe.ilID_TITULAREjecuta(Sender: TObject);
begin
   If Objeto.Titular.FindKey([ilID_TITULAR.Buffer])Then Begin
      chbID_TITULAR.Checked := True;
      chbID_TITULAR.Enabled := True;
      InterForma1.NextTab(edID_TITULAR);
   End;
end;

procedure TwMMovEntFe.VerificaFechaCtrls(pedFecha: TEdit; pdtpFecha: TInterDateTimePicker);
begin
     Try
        If Trim(pedFecha.Text) <> '' Then
            pdtpFecha.Date := StrToDate(pedFecha.Text);
     Except
        pedFecha.Text := FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
        pdtpFecha.Date := StrToDate(pedFecha.Text);
     End;
end;

procedure TwMMovEntFe.edFECHAExit(Sender: TObject);
begin
    VerificaFechaCtrls(edFECHA, dtpFecha);
end;

procedure TwMMovEntFe.btDisposicionClick(Sender: TObject);
begin
   Objeto.CrCredito.ShowAll := True;
   If Objeto.CrCredito.Busca Then Begin
      cbxDisposicion.Checked:=True;
      cbxDisposicion.Enabled:=True;
      InterForma1.NextTab(edDisposicion);
   End;
end;

procedure TwMMovEntFe.ilDisposicionEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ilDisposicion.Buffer]) Then Begin
      cbxDisposicion.Checked:=True;
      cbxDisposicion.Enabled:=True;
      InterForma1.NextTab(edDisposicion);
   End;
end;

procedure TwMMovEntFe.cbxDisposicionClick(Sender: TObject);
begin
   EnableCheckBox(cbxDisposicion);
   Objeto.CrCredito.Active := cbxDisposicion.Checked;
end;

procedure TwMMovEntFe.btMonedaClick(Sender: TObject);
begin
   If Objeto.Moneda.Busca Then Begin
      chbMoneda.Checked := True;
      chbMoneda.Enabled := True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMMovEntFe.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilCVE_MONEDA.Buffer]) Then Begin
      chbMoneda.Checked := True;
      chbMoneda.Enabled := True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMMovEntFe.chbMonedaClick(Sender: TObject);
begin
   EnableCheckBox(chbMoneda);
   Objeto.Moneda.Active := chbMoneda.Checked;
end;

procedure TwMMovEntFe.btCVE_PRODUCTO_CREClick(Sender: TObject);
begin
   If Objeto.Producto.Busca Then Begin
      chbProducto.Checked:= True;
      chbProducto.Enabled:= True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

procedure TwMMovEntFe.ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilCVE_PRODUCTO_CRE.Buffer]) Then Begin
      chbProducto.Checked:=True;
      chbProducto.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

procedure TwMMovEntFe.chbProductoClick(Sender: TObject);
begin
   EnableCheckBox(chbProducto);
   Objeto.Producto.Active := chbProducto.Checked;
end;

end.
