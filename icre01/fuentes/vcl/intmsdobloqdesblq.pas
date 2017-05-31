// Sistema         : Clase de RepCtaAcr
// Fecha de Inicio : 06/07/2005
// Función forma   : Clase de RepCtaAcr
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMSdoBloqDesblq;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntParamCre,
IntMon,         //Moneda
IntCrAcredit,   //Acreditado
IntCrCreChe,    //Cuenta de Cheques
Intempre,       //Empresa
IntUnNeg,       //Unidad Negocio/Suc
IntCrCredito,   //Disposición
IntCrProduct,    //Producto de crédito
IntMQrSdoBlqDs
;

Type
 TMSdoBloq= class;

  TWMSdoBloq=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_MONEDA : TLabel;
    edCVE_MONEDA : TEdit;
    edDESC_MONEDA : TEdit;
    lbID_ACREDITADO : TLabel;
    edID_ACREDITADO : TEdit;
    edNOMBRE_ACRED : TEdit;
    lbCUENTA_BANCO : TLabel;
    edCUENTA_BANCO : TEdit;
    edBANCO : TEdit;
    btMoneda: TBitBtn;
    btAcreditado: TBitBtn;
    btCtaChequera: TBitBtn;
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
    chbAcreditado: TCheckBox;
    chbCtaCheques: TCheckBox;
    ilCVE_MONEDA: TInterLinkit;
    ilID_ACREDITADO: TInterLinkit;
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
    edFECHA: TEdit;
    Label1: TLabel;
    dtpFECHA: TInterDateTimePicker;
    Label5: TLabel;
    edID_CREDITO: TEdit;
    btID_CREDITO: TBitBtn;
    edDESC_CREDITO: TEdit;
    cbID_CREDITO: TCheckBox;
    ilDisposicion: TInterLinkit;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    InterLinkit1: TInterLinkit;
    Label6: TLabel;
    cbxPRODUCTO_CRE: TCheckBox;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO_CRE: TBitBtn;
    edDESC_PRODUCTO_CRE: TEdit;
    ilPRODUCTO_CRE: TInterLinkit;
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    Label3: TLabel;
    edF_INICIO: TEdit;
    dtpF_Ini: TInterDateTimePicker;
    edF_FINAL: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    rgCVE_TIP_OPERACION: TRadioGroup;
    cbFMovimiento: TCheckBox;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btMonedaClick(Sender: TObject);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure chbMonedaClick(Sender: TObject);
    procedure btAcreditadoClick(Sender: TObject);
    procedure ilID_ACREDITADOEjecuta(Sender: TObject);
    procedure chbAcreditadoClick(Sender: TObject);
    procedure btCtaChequeraClick(Sender: TObject);
    procedure chbCtaChequesClick(Sender: TObject);
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
    procedure cbFMovimientoClick(Sender: TObject);
    procedure edFECHAChange(Sender: TObject);
    procedure edFECHAExit(Sender: TObject);
    private
     Procedure EnableCheckBox(var CheckBox : TCheckBox);
     Procedure ImprimeReporte(bPreview:Boolean);
     Procedure AsignaEmpresaSuc;
     procedure VerificaFechaCtrls(pedFecha: TEdit; pdtpFecha: TInterDateTimePicker);
    { Private declarations }
    public
    { Public declarations }
    Objeto : TMSdoBloq;
end;
 TMSdoBloq= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_MONEDA               : TInterCampo;
        DESC_MONEDA              : TInterCampo;
        ID_ACREDITADO            : TInterCampo;
        NOMBRE_ACRED             : TInterCampo;
        CUENTA_BANCO             : TInterCampo;
        BANCO                    : TInterCampo;
        ID_CREDITO               : TInterCampo;
        CVE_PRODUCTO_CRE         : TInterCampo;
        F_INICIO                 : TInterCampo;
        F_FINAL                  : TInterCampo;
        F_MOVIMIENTO             : TInterCampo;
        CVE_TIP_OPERACION        : TInterCampo;
        ID_EMPRESA               : TInterCampo;

        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;
        Acreditado               : TCrAcredit;
        CtaCheques               : TCrCreChe;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        CrCredito                : TCrCredito;
        Producto                 : TCrProduct;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


implementation
{$R *.DFM}

constructor TMSdoBloq.Create( AOwner : TComponent );
begin Inherited;
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftString,tsNinguno,tsNinguno,False);
                CVE_MONEDA.Caption:='Moneda';
                CVE_MONEDA.Parametro:='CVE_MONEDA';
      DESC_MONEDA :=CreaCampo('DESC_MONEDA',ftString,tsNinguno,tsNinguno,False);
                DESC_MONEDA.Caption:='Descripción de Moneda';
                DESC_MONEDA.Parametro:='DESC_MONEDA';
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);
                ID_ACREDITADO.Caption:='Acreditado';
                ID_ACREDITADO.Parametro:='ID_ACREDITADO';
      NOMBRE_ACRED :=CreaCampo('NOMBRE_ACRED',ftString,tsNinguno,tsNinguno,False);
                NOMBRE_ACRED.Caption:='Nombre ';
                NOMBRE_ACRED.Parametro:='NOMBRE_ACRED';
      CUENTA_BANCO :=CreaCampo('CUENTA_BANCO',ftString,tsNinguno,tsNinguno,False);
                CUENTA_BANCO.Caption:='Cuenta de Cheques';
                CUENTA_BANCO.Parametro:='CUENTA_BANCO';
      BANCO :=CreaCampo('BANCO',ftString,tsNinguno,tsNinguno,False);
                BANCO.Caption:='Cta';
                BANCO.Parametro:='BANCO';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,False);
      F_INICIO :=CreaCampo('F_INICIO',ftDate,tsNinguno,tsNinguno,False);
      F_FINAL :=CreaCampo('F_FINAL',ftDate,tsNinguno,tsNinguno,False);
      F_MOVIMIENTO:=CreaCampo('F_MOVIMIENTO',ftDate,tsNinguno,tsNinguno,False);
      CVE_TIP_OPERACION:=CreaCampo('CVE_TIP_OPERACION',ftString,tsNinguno,tsNinguno,False);
      With CVE_TIP_OPERACION Do Begin
         Size:=2; UseCombo:=True;
         ComboLista.Add('0'); ComboDatos.Add('BL');
         ComboLista.Add('1'); ComboDatos.Add('DB');
         ComboLista.Add('2'); ComboDatos.Add('0');
      End;
      ID_EMPRESA:=CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,False);

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
      CtaCheques := TCrCreChe.Create(Self);
      CtaCheques.MasterSource:=Self;
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

Destructor TMSdoBloq.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   If Acreditado <> Nil Then
      Acreditado.Free;
   If CtaCheques <> Nil Then
      CtaCheques.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   If CrCredito <> nil then
      CrCredito.Free;
   if Producto <> nil then
      Producto.MasterSource := Self;
   inherited;
end;


function TMSdoBloq.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMSdoBloq;
begin
   W:=TWMSdoBloq.Create(Self);
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

(***********************************************FORMA RepCtaAcr********************)
(*                                                                              *)
(*  FORMA DE RepCtaAcr                                                            *)
(*                                                                              *)
(***********************************************FORMA RepCtaAcr********************)
procedure TWMSdoBloq.AsignaEmpresaSuc;
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

Procedure TWMSdoBloq.EnableCheckBox(Var CheckBox : TCheckBox);
Begin
   If Not CheckBox.Checked Then Begin
      CheckBox.Checked:=False;
      CheckBox.Enabled:=False;
   End Else Begin
      CheckBox.Checked:=True;
      CheckBox.Enabled:=True;
   End;
End;

procedure TWMSdoBloq.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.CVE_MONEDA.Control:=edCVE_MONEDA;
   Objeto.DESC_MONEDA.Control:=edDESC_MONEDA;
   Objeto.ID_ACREDITADO.Control:=edID_ACREDITADO;
   Objeto.NOMBRE_ACRED.Control:=edNOMBRE_ACRED;
   Objeto.CUENTA_BANCO.Control:=edCUENTA_BANCO;
   Objeto.BANCO.Control:=edBANCO;
   Objeto.ID_CREDITO.Control:=edID_CREDITO;
   Objeto.CVE_PRODUCTO_CRE.Control :=edCVE_PRODUCTO_CRE;
   Objeto.F_INICIO.Control :=edF_INICIO;
   Objeto.F_FINAL.Control :=edF_FINAL;
   Objeto.F_MOVIMIENTO.Control :=edFECHA;
   Objeto.CVE_TIP_OPERACION.Control:= rgCVE_TIP_OPERACION;
   Objeto.ID_EMPRESA.Control:=EdIdEmpresa;

   Objeto.Moneda.Cve_Moneda.Control:= edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control:= edDESC_MONEDA;
   Objeto.Acreditado.ID_ACREDITADO.Control:= edID_ACREDITADO;
   Objeto.Acreditado.Persona.Nombre.Control:= edNOMBRE_ACRED;
   Objeto.CtaCheques.CUENTA_BANCO.Control:= edCUENTA_BANCO;
   Objeto.CtaCheques.Persona.Nombre.Control:= edBANCO;
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
   Objeto.F_MOVIMIENTO.AsDateTime :=Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_TIP_OPERACION.AsString:='0';
end;

procedure TWMSdoBloq.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_MONEDA.Control:=nil;
   Objeto.DESC_MONEDA.Control:=nil;
   Objeto.ID_ACREDITADO.Control:=nil;
   Objeto.NOMBRE_ACRED.Control:=nil;
   Objeto.CUENTA_BANCO.Control:=nil;
   Objeto.BANCO.Control:=nil;
   Objeto.ID_CREDITO.Control:=nil;
   Objeto.CVE_PRODUCTO_CRE.Control :=nil;
   Objeto.F_INICIO.Control :=nil;
   Objeto.F_FINAL.Control :=nil;
   Objeto.F_MOVIMIENTO.Control :=nil;
   Objeto.CVE_TIP_OPERACION.Control:= nil;
   Objeto.ID_EMPRESA.Control:=nil;

   Objeto.Moneda.Cve_Moneda.Control:= nil;
   Objeto.Moneda.Desc_Moneda.Control:= nil;
   Objeto.Acreditado.ID_ACREDITADO.Control:= nil;
   Objeto.Acreditado.Persona.Nombre.Control:= nil;
   Objeto.CtaCheques.CUENTA_BANCO.Control:= nil;
   Objeto.CtaCheques.Persona.Nombre.Control:= nil;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
   Objeto.CrCredito.ID_CREDITO.Control := Nil;
   Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := Nil;
   Objeto.Producto.CVE_PRODUCTO_CRE.Control := nil;
   Objeto.Producto.DESC_L_PRODUCTO.Control := nil;
end;

procedure TWMSdoBloq.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMSdoBloq.btMonedaClick(Sender: TObject);
begin
   If Objeto.Moneda.Busca Then Begin
      chbMoneda.Checked:= True;
      chbMoneda.Enabled:= True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWMSdoBloq.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilCVE_MONEDA.Buffer]) Then Begin
      chbMoneda.Checked:=True;
      chbMoneda.Enabled:=True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWMSdoBloq.chbMonedaClick(Sender: TObject);
begin
   EnableCheckBox(chbMoneda);
   Objeto.Moneda.Active := chbMoneda.Checked;
end;

procedure TWMSdoBloq.btAcreditadoClick(Sender: TObject);
begin
   If Objeto.Acreditado.Busca Then Begin
      chbAcreditado.Checked:= True;
      chbAcreditado.Enabled:= True;
      InterForma1.NextTab(edID_ACREDITADO);
   End;
end;

procedure TWMSdoBloq.ilID_ACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Acreditado.FindKey([ilID_ACREDITADO.Buffer]) Then Begin
      chbAcreditado.Checked:=True;
      chbAcreditado.Enabled:=True;
      InterForma1.NextTab(edID_ACREDITADO);
   End;
end;

procedure TWMSdoBloq.chbAcreditadoClick(Sender: TObject);
begin
   EnableCheckBox(chbAcreditado);
   Objeto.Acreditado.Active := chbAcreditado.Checked;
end;

procedure TWMSdoBloq.btCtaChequeraClick(Sender: TObject);
begin
   If Objeto.CtaCheques.Busca Then Begin
      chbCtaCheques.Checked:= True;
      chbCtaCheques.Enabled:= True;
      InterForma1.NextTab(btCtaChequera);
   End;
end;

procedure TWMSdoBloq.chbCtaChequesClick(Sender: TObject);
begin
   EnableCheckBox(chbCtaCheques);
   Objeto.CtaCheques.Active := chbCtaCheques.Checked;
end;

Procedure TWMSdoBloq.ImprimeReporte(bPreview:Boolean);
Var
    sOper :String;
    iOper : Integer;
begin
    iOper:= rgCVE_TIP_OPERACION.ItemIndex;
    case iOper of
        0: sOper := 'BL';
        1: sOper := 'DB';
        2: sOper := '';
    end;

    RepRelBlqDesBlqs(edF_Inicio.Text,   edF_Final.Text, objeto.CVE_MONEDA.AsString,     Objeto.ID_ACREDITADO.AsString,
                     Objeto.CUENTA_BANCO.AsString,      Objeto.ID_CREDITO.AsString,     Objeto.CVE_PRODUCTO_CRE.AsString,
                     edFECHA.Text,      sOper,          EdIdEmpresa.Text          ,     EdIDSucursal.Text  ,
                     Objeto.Apli            , bPreview               );
End;

procedure TWMSdoBloq.InterForma1BtnPreviewClick(Sender: TObject);
begin
   ImprimeReporte(True);
end;

procedure TWMSdoBloq.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimeReporte(False);
end;

procedure TWMSdoBloq.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TWMSdoBloq.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMSdoBloq.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TWMSdoBloq.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMSdoBloq.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TWMSdoBloq.btID_CREDITOClick(Sender: TObject);
begin
   Objeto.CrCredito.ShowAll := True;
   If Objeto.CrCredito.Busca Then Begin
      cbID_CREDITO.Checked:=True;
      cbID_CREDITO.Enabled:=True;
   End;
end;

procedure TWMSdoBloq.cbID_CREDITOClick(Sender: TObject);
begin
   EnableCheckBox(cbID_CREDITO);
   Objeto.CrCredito.Active := cbID_CREDITO.Checked;
end;

procedure TWMSdoBloq.ilDisposicionEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ilDisposicion.Buffer]) Then Begin
      cbID_CREDITO.Checked:=True;
      cbID_CREDITO.Enabled:=True;
   End;
end;

procedure TWMSdoBloq.btPRODUCTO_CREClick(Sender: TObject);
begin
   Objeto.Producto.ShowAll := True;
   If Objeto.Producto.Busca Then Begin
      cbxPRODUCTO_CRE.Checked:=True;
      cbxPRODUCTO_CRE.Enabled:=True;
   End;
end;

procedure TWMSdoBloq.cbxPRODUCTO_CREClick(Sender: TObject);
begin
   EnableCheckBox(cbxPRODUCTO_CRE);
   Objeto.Producto.Active := cbxPRODUCTO_CRE.Checked;
end;

procedure TWMSdoBloq.ilPRODUCTO_CREEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilPRODUCTO_CRE]) Then Begin
      cbxPRODUCTO_CRE.Checked:=True;
      cbxPRODUCTO_CRE.Enabled:=True;
   End;
end;

procedure TWMSdoBloq.cbFMovimientoClick(Sender: TObject);
begin
   If Not cbFMovimiento.Checked Then Begin
      Objeto.F_MOVIMIENTO.AsString := '';
      cbFMovimiento.Enabled := False;
   End;
end;

procedure TWMSdoBloq.edFECHAChange(Sender: TObject);
begin
   If edFECHA.Text <> '' Then Begin
      cbFMovimiento.Checked := True;
      cbFMovimiento.Enabled := True;
   End Else Begin
      cbFMovimiento.Checked := False;
      cbFMovimiento.Enabled := False;
   End;
end;

procedure TWMSdoBloq.edFECHAExit(Sender: TObject);
begin
    VerificaFechaCtrls(edFECHA, dtpFECHA);
end;

procedure TWMSdoBloq.VerificaFechaCtrls(pedFecha: TEdit; pdtpFecha: TInterDateTimePicker);
begin
     Try
        If Trim(pedFecha.Text) <> '' Then
            pdtpFecha.Date := StrToDate(pedFecha.Text);
     Except
        pedFecha.Text := FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
        pdtpFecha.Date := StrToDate(pedFecha.Text);
     End;
end;

end.
