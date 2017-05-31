// Sistema         : Clase de RepCtaAcr
// Fecha de Inicio : 06/07/2005
// Función forma   : Clase de RepCtaAcr
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMBitQCQC;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntParamCre,
IntMon,         //Moneda
Intempre,       //Empresa
IntUnNeg,       //Unidad Negocio/Suc
IntCrCredito,   //Disposición
IntCrProduct,    //Producto de crédito
IntMQrBitQCQC
;

Type
 TMBitQCQC= class;

  TWMBitQCQC=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_MONEDA : TLabel;
    edCVE_MONEDA : TEdit;
    edDESC_MONEDA : TEdit;
    btMoneda: TBitBtn;
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
    ilCVE_MONEDA: TInterLinkit;
    gbControl: TGroupBox;
    Label8: TLabel;
    lbICveRequisito: TLabel;
    edIDSucursal: TEdit;
    BBSucursal: TBitBtn;
    EdDescSucursal: TEdit;
    CBSucursal: TCheckBox;
    edIdEmpresa: TEdit;
    bbEmpresa: TBitBtn;
    edNombreEmpresa: TEdit;
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    Label5: TLabel;
    edID_CREDITO: TEdit;
    btID_CREDITO: TBitBtn;
    edDESC_CREDITO: TEdit;
    cbID_CREDITO: TCheckBox;
    ilDisposicion: TInterLinkit;
    Label6: TLabel;
    cbxPRODUCTO_CRE: TCheckBox;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO_CRE: TBitBtn;
    edDESC_PRODUCTO_CRE: TEdit;
    ilPRODUCTO_CRE: TInterLinkit;
    rgCVE_TIP_EVENTO: TRadioGroup;
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    Label3: TLabel;
    edF_INICIO: TEdit;
    dtpF_Ini: TInterDateTimePicker;
    edF_FINAL: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btMonedaClick(Sender: TObject);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure chbMonedaClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure cbID_CREDITOClick(Sender: TObject);
    procedure ilDisposicionEjecuta(Sender: TObject);
    procedure btPRODUCTO_CREClick(Sender: TObject);
    procedure cbxPRODUCTO_CREClick(Sender: TObject);
    procedure ilPRODUCTO_CREEjecuta(Sender: TObject);
    private
     Procedure EnableCheckBox(var CheckBox : TCheckBox);
     Procedure ImprimeReporte(bPreview:Boolean);
     Procedure AsignaEmpresaSuc;
    { Private declarations }
    public
    { Public declarations }
    Objeto : TMBitQCQC;
end;
 TMBitQCQC= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_MONEDA               : TInterCampo;
        ID_CREDITO               : TInterCampo;
        CVE_PRODUCTO_CRE         : TInterCampo;
        CVE_TIP_EVENTO           : TInterCampo;
        ID_EMPRESA               : TInterCampo;
        F_INICIO                 : TInterCampo;
        F_FINAL                  : TInterCampo;

        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        CrCredito                : TCrCredito;
        Producto                 : TCrProduct;

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

constructor TMBitQCQC.Create( AOwner : TComponent );
begin Inherited;
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftString,tsNinguno,tsNinguno,False);
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,False);
      CVE_TIP_EVENTO:=CreaCampo('CVE_TIP_EVENTO',ftString,tsNinguno,tsNinguno,False);
      With CVE_TIP_EVENTO Do Begin
         Size := 14;
         UseCombo := True;
         ComboLista.Add('0');    ComboDatos.Add('0');
         ComboLista.Add('1');    ComboDatos.Add('QUITA');
         ComboLista.Add('2');    ComboDatos.Add('QUEBRANTOS');
         ComboLista.Add('3');    ComboDatos.Add('CASTIGOS');
         ComboLista.Add('4');    ComboDatos.Add('CONDONACIONES');
         ComboLista.Add('5');    ComboDatos.Add('ADJUDICACIONES');
         ComboLista.Add('6');    ComboDatos.Add('DACIONES');
         ComboLista.Add('7');    ComboDatos.Add('VTA DE CARTERA');

      End;

      ID_EMPRESA:=CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,False);
      F_INICIO:=CreaCampo('F_INICIO',ftDate,tsNinguno,tsNinguno,False);
      F_FINAL:=CreaCampo('F_FINAL',ftDate,tsNinguno,tsNinguno,False);

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);
      CrCredito := TCrCredito.Create(Self);
      CrCredito.MasterSource:=Self;
      Producto := TCrProduct.Create(Self);
      Producto.MasterSource := Self;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMRepCtaChqAcr.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMBitQCQC.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   If CrCredito <> nil then
      CrCredito.Free;
   if Producto <> nil then
      Producto.Free;
   inherited;
end;


function TMBitQCQC.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMBitQCQC;
begin
   W:=TWMBitQCQC.Create(Self);
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


Function TMBitQCQC.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IRepctaa.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TMBitQCQC.Reporte:Boolean;
begin //Execute_Reporte();
end;
(***********************************************FORMA RepCtaAcr********************)
(*                                                                              *)
(*  FORMA DE RepCtaAcr                                                            *)
(*                                                                              *)
(***********************************************FORMA RepCtaAcr********************)
procedure TWMBitQCQC.AsignaEmpresaSuc;
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

Procedure TWMBitQCQC.EnableCheckBox(Var CheckBox : TCheckBox);
Begin
   If Not CheckBox.Checked Then Begin
      CheckBox.Checked:=False;
      CheckBox.Enabled:=False;
   End Else Begin
      CheckBox.Checked:=True;
      CheckBox.Enabled:=True;
   End;
End;

procedure TWMBitQCQC.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.CVE_MONEDA.Control :=edCVE_MONEDA;
   Objeto.ID_CREDITO.Control :=edID_CREDITO;
   Objeto.CVE_PRODUCTO_CRE.Control :=edCVE_PRODUCTO_CRE;
   Objeto.CVE_TIP_EVENTO.Control:=rgCVE_TIP_EVENTO;
   Objeto.ID_EMPRESA.Control:=edIdEmpresa;
   Objeto.F_INICIO.Control:=edF_INICIO;
   Objeto.F_FINAL.Control:=edF_FINAL;

   Objeto.Moneda.Cve_Moneda.Control:= edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control:= edDESC_MONEDA;
   Objeto.Empresa.ID_Empresa.Control:= EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control:= edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);
   Objeto.UnidadNegocio.Id_Entidad.Control:= EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control:= EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   Objeto.CrCredito.ID_CREDITO.Control:= edID_CREDITO;
   Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control:= edDESC_CREDITO;
   Objeto.CrCredito.GetParams(Objeto);
   Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
   Objeto.Producto.DESC_L_PRODUCTO.Control := edDESC_PRODUCTO_CRE;
   Objeto.Producto.GetParams(Objeto);
   AsignaEmpresaSuc;

   Objeto.F_INICIO.AsDateTime :=Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.F_FINAL.AsDateTime :=Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_TIP_EVENTO.AsString:='0';
end;

procedure TWMBitQCQC.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_MONEDA.Control :=nil;
   Objeto.ID_CREDITO.Control :=nil;
   Objeto.CVE_PRODUCTO_CRE.Control :=nil;
   Objeto.CVE_TIP_EVENTO.Control:=nil;
   Objeto.ID_EMPRESA.Control:=nil;
   Objeto.F_INICIO.Control:=nil;
   Objeto.F_FINAL.Control:=nil;

   Objeto.Moneda.Cve_Moneda.Control:= nil;
   Objeto.Moneda.Desc_Moneda.Control:= nil;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
   Objeto.CrCredito.ID_CREDITO.Control := Nil;
   Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := Nil;
   Objeto.Producto.CVE_PRODUCTO_CRE.Control := nil;
   Objeto.Producto.DESC_L_PRODUCTO.Control := nil;
end;

procedure TWMBitQCQC.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMBitQCQC.btMonedaClick(Sender: TObject);
begin
   If Objeto.Moneda.Busca Then Begin
      chbMoneda.Checked:= True;
      chbMoneda.Enabled:= True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWMBitQCQC.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilCVE_MONEDA.Buffer]) Then Begin
      chbMoneda.Checked:=True;
      chbMoneda.Enabled:=True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWMBitQCQC.chbMonedaClick(Sender: TObject);
begin
   EnableCheckBox(chbMoneda);
   Objeto.Moneda.Active := chbMoneda.Checked;
end;

Procedure TWMBitQCQC.ImprimeReporte(bPreview:Boolean);
begin
   Objeto.F_INICIO.GetFromControl;
   Objeto.F_FINAL.GetFromControl;
   Objeto.CVE_MONEDA.GetFromControl;
   Objeto.ID_CREDITO.GetFromControl;
   Objeto.CVE_PRODUCTO_CRE.GetFromControl;
   Objeto.CVE_TIP_EVENTO.GetFromControl;
   Objeto.ID_EMPRESA.GetFromControl;

   RepBitQCQC(  Objeto.F_INICIO.AsDateTime,       Objeto.F_FINAL.AsDateTime,
                Objeto.CVE_MONEDA.AsString,       Objeto.ID_CREDITO.AsString,
                Objeto.CVE_PRODUCTO_CRE.AsString, Objeto.CVE_TIP_EVENTO.AsString,
                Objeto.ID_EMPRESA.AsString,       EdIDSucursal.Text,
                Objeto.Apli,                      bPreview);
End;

procedure TWMBitQCQC.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMBITQCQC_PREVI',True,True) then
      ImprimeReporte(True);
end;

procedure TWMBitQCQC.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMBITQCQC_IMPRI',True,True) then
      ImprimeReporte(False);
end;

procedure TWMBitQCQC.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TWMBitQCQC.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMBitQCQC.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TWMBitQCQC.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMBitQCQC.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TWMBitQCQC.btID_CREDITOClick(Sender: TObject);
begin
   Objeto.CrCredito.ShowAll := True;
   If Objeto.CrCredito.Busca Then Begin
      cbID_CREDITO.Checked:=True;
      cbID_CREDITO.Enabled:=True;
   End;
end;

procedure TWMBitQCQC.cbID_CREDITOClick(Sender: TObject);
begin
   EnableCheckBox(cbID_CREDITO);
   Objeto.CrCredito.Active := cbID_CREDITO.Checked;
end;

procedure TWMBitQCQC.ilDisposicionEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ilDisposicion.Buffer]) Then Begin
      cbID_CREDITO.Checked:=True;
      cbID_CREDITO.Enabled:=True;
   End;
end;

procedure TWMBitQCQC.btPRODUCTO_CREClick(Sender: TObject);
begin
   Objeto.Producto.ShowAll := True;
   If Objeto.Producto.Busca Then Begin
      cbxPRODUCTO_CRE.Checked:=True;
      cbxPRODUCTO_CRE.Enabled:=True;
   End;
end;

procedure TWMBitQCQC.cbxPRODUCTO_CREClick(Sender: TObject);
begin
   EnableCheckBox(cbxPRODUCTO_CRE);
   Objeto.Producto.Active := cbxPRODUCTO_CRE.Checked;
end;

procedure TWMBitQCQC.ilPRODUCTO_CREEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilPRODUCTO_CRE]) Then Begin
      cbxPRODUCTO_CRE.Checked:=True;
      cbxPRODUCTO_CRE.Enabled:=True;
   End;
end;

end.
