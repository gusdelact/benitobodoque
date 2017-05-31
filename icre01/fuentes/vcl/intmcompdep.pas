// Sistema         : Clase de RepCtaAcr
// Fecha de Inicio : 19/07/2005
// Función forma   : Clase de RepCtaAcr
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMCompDep;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntParamCre,
IntMon,         //Moneda
Intempre,       //Empresa
IntUnNeg,       //Unidad Negocio/Suc
IntCrCredito,   //Disposición
IntCrAcredit,   //Acreditado
IntCrCreChe,    //Cuenta de Cheques
IntMQrCompDep,  //Reporte
IntMProdGpo,    //GRUPO PRODUCTO
IntGenCre
;

Type
 TMCompDep= class;

  TWMCompDep=Class(TForm)
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
    cbxID_ACREDITADO: TCheckBox;
    edID_ACREDITADO: TEdit;
    btID_ACREDITADO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    ilID_ACREDITADO: TInterLinkit;
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    Label3: TLabel;
    edF_INICIO: TEdit;
    dtpF_Ini: TInterDateTimePicker;
    edF_FINAL: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    lbCUENTA_BANCO: TLabel;
    edCUENTA_BANCO: TEdit;
    edBANCO: TEdit;
    btCtaChequera: TBitBtn;
    chbCtaCheques: TCheckBox;
    Label1: TLabel;
    edFECHA: TEdit;
    dtpFecha: TInterDateTimePicker;
    cbFMovimiento: TCheckBox;
    Label2: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edNOM_CVE_PRODUCTO_GPO: TEdit;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    cbRESUMENSM: TCheckBox;
    Label4: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
    rgSitImpresion: TRadioGroup;
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
    procedure edFECHAChange(Sender: TObject);
    procedure edFECHAExit(Sender: TObject);
    procedure cbFMovimientoClick(Sender: TObject);
    procedure btID_ACREDITADOClick(Sender: TObject);
    procedure ilID_ACREDITADOEjecuta(Sender: TObject);
    procedure cbxID_ACREDITADOClick(Sender: TObject);
    procedure btCtaChequeraClick(Sender: TObject);
    procedure chbCtaChequesClick(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    private
     Procedure EnableCheckBox(var CheckBox : TCheckBox);
     Procedure ImprimeReporte(bPreview:Boolean);
     Procedure AsignaEmpresaSuc;
     procedure VerificaFechaCtrls(pedFecha: TEdit; pdtpFecha: TInterDateTimePicker);
    { Private declarations }
    public
    { Public declarations }
    Objeto : TMCompDep;
end;
 TMCompDep= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_MONEDA               : TInterCampo;
        ID_ACREDITADO            : TInterCampo;
        ID_CREDITO               : TInterCampo;
        ID_EMPRESA               : TInterCampo;
        F_INICIO                 : TInterCampo;
        F_FINAL                  : TInterCampo;
        F_MOVIMIENTO             : TInterCampo;
        CUENTA_BANCO             : TInterCampo;
        CVE_PRODUCTO_GPO        : TInterCampo;

        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        CrCredito                : TCrCredito;
        Acreditado               : TCrAcredit;
        CtaCheques               : TCrCreChe;
        GpoProd                  : TMProdGpo;

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

constructor TMCompDep.Create( AOwner : TComponent );
begin Inherited;
   CVE_MONEDA:=CreaCampo('CVE_MONEDA',ftString,tsNinguno,tsNinguno,False);
   ID_ACREDITADO:=CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);
   ID_CREDITO:=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
   ID_EMPRESA:=CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,False);
   F_INICIO:=CreaCampo('F_INICIO',ftDate,tsNinguno,tsNinguno,False);
   F_FINAL:=CreaCampo('F_FINAL',ftDate,tsNinguno,tsNinguno,False);
   F_MOVIMIENTO:=CreaCampo('F_MOVIMIENTO',ftDate,tsNinguno,tsNinguno,False);
   CUENTA_BANCO:=CreaCampo('CUENTA_BANCO',ftString,tsNinguno,tsNinguno,False);
   CVE_PRODUCTO_GPO :=CreaCampo('CVE_PRODUCTO_GPO',ftString,tsNinguno,tsNinguno,False);

   Moneda := TMoneda.Create(Self);
   Moneda.MasterSource:=Self;
   Empresa := TEmpresa.Create(Self);
   UnidadNegocio := TUnNegocio.Create(Self);
   CrCredito := TCrCredito.Create(Self);
   CrCredito.MasterSource:=Self;
   Acreditado := TCrAcredit.Create(Self);
   Acreditado.MasterSource:=Self;
   CtaCheques := TCrCreChe.Create(Self);
   CtaCheques.MasterSource:=Self;
   GpoProd:= TMProdGpo.Create(Self);
   GpoProd.MasterSource:=Self;

   StpName  := ' ';
   UseQuery := False;
   HelpFile := 'IntMRepCtaChqAcr.Hlp';
   ShowMenuReporte:=True;
end;

Destructor TMCompDep.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   If CrCredito <> nil then
      CrCredito.Free;
   If Acreditado <> Nil Then
      Acreditado.Free;
   If CtaCheques <> Nil Then
      CtaCheques.Free;
   If GpoProd <> Nil Then
      GpoProd.Free;
   inherited;
end;


function TMCompDep.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMCompDep;
begin
   W:=TWMCompDep.Create(Self);
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


Function TMCompDep.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IRepctaa.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TMCompDep.Reporte:Boolean;
begin //Execute_Reporte();
end;
(***********************************************FORMA RepCtaAcr********************)
(*                                                                              *)
(*  FORMA DE RepCtaAcr                                                            *)
(*                                                                              *)
(***********************************************FORMA RepCtaAcr********************)
procedure TWMCompDep.AsignaEmpresaSuc;
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

Procedure TWMCompDep.EnableCheckBox(Var CheckBox : TCheckBox);
Begin
   If Not CheckBox.Checked Then Begin
      CheckBox.Checked:=False;
      CheckBox.Enabled:=False;
   End Else Begin
      CheckBox.Checked:=True;
      CheckBox.Enabled:=True;
   End;
End;

procedure TWMCompDep.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.CVE_MONEDA.Control :=edCVE_MONEDA;
   Objeto.ID_ACREDITADO.Control :=edID_ACREDITADO;
   Objeto.ID_CREDITO.Control :=edID_CREDITO;
   Objeto.ID_EMPRESA.Control :=edIdEmpresa;
   Objeto.F_INICIO.Control :=edF_INICIO;
   Objeto.F_FINAL.Control :=edF_FINAL;
   Objeto.F_MOVIMIENTO.Control :=edFECHA;
   Objeto.CUENTA_BANCO.Control :=edCUENTA_BANCO;
   Objeto.CVE_PRODUCTO_GPO.Control :=edCVE_PRODUCTO_GPO;

   Objeto.Moneda.Cve_Moneda.Control:= edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control:= edDESC_MONEDA;
   Objeto.Moneda.GetParams(Objeto);
   Objeto.Empresa.ID_Empresa.Control:= edIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control:= edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);
   Objeto.UnidadNegocio.Id_Entidad.Control:= EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control:= EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   Objeto.CrCredito.ID_CREDITO.Control:= edID_CREDITO;
   Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control:= edDESC_CREDITO;
   Objeto.CrCredito.GetParams(Objeto);
   Objeto.Acreditado.ID_ACREDITADO.Control:= edID_ACREDITADO;
   Objeto.Acreditado.Persona.Nombre.Control:= edNOM_ACREDITADO;
   Objeto.Acreditado.GetParams(Objeto);
   Objeto.CtaCheques.CUENTA_BANCO.Control:= edCUENTA_BANCO;
   Objeto.CtaCheques.Persona.Nombre.Control:= edBANCO;
   Objeto.CtaCheques.GetParams(Objeto);
   Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
   Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
   Objeto.GpoProd.GetParams(Objeto);
   AsignaEmpresaSuc;

   Objeto.F_INICIO.AsDateTime :=Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.F_FINAL.AsDateTime :=Objeto.Apli.DameFechaEmpresaDia('D000');
end;

procedure TWMCompDep.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_MONEDA.Control :=nil;
   Objeto.ID_ACREDITADO.Control :=nil;
   Objeto.ID_CREDITO.Control :=nil;
   Objeto.ID_EMPRESA.Control :=nil;
   Objeto.F_INICIO.Control :=nil;
   Objeto.F_FINAL.Control :=nil;
   Objeto.F_MOVIMIENTO.Control :=nil;
   Objeto.CUENTA_BANCO.Control :=nil;
   Objeto.CVE_PRODUCTO_GPO.Control :=nil;

   Objeto.Moneda.Cve_Moneda.Control:= nil;
   Objeto.Moneda.Desc_Moneda.Control:= nil;
   Objeto.Empresa.ID_Empresa.Control:= nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control:= nil;
   Objeto.UnidadNegocio.Id_Entidad.Control:= nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control:= nil;
   Objeto.CrCredito.ID_CREDITO.Control:= nil;
   Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control:= nil;
   Objeto.Acreditado.ID_ACREDITADO.Control:= nil;
   Objeto.Acreditado.Persona.Nombre.Control:= nil;
   Objeto.CtaCheques.CUENTA_BANCO.Control:= nil;
   Objeto.CtaCheques.Persona.Nombre.Control:= nil;
   Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= nil;
   Objeto.GpoProd.DESC_C_PROD_GPO.Control:= nil;
end;

procedure TWMCompDep.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMCompDep.btMonedaClick(Sender: TObject);
begin
   If Objeto.Moneda.Busca Then Begin
      chbMoneda.Checked:= True;
      chbMoneda.Enabled:= True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWMCompDep.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilCVE_MONEDA.Buffer]) Then Begin
      chbMoneda.Checked:=True;
      chbMoneda.Enabled:=True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWMCompDep.chbMonedaClick(Sender: TObject);
begin
   EnableCheckBox(chbMoneda);
   Objeto.Moneda.Active := chbMoneda.Checked;
end;

Procedure TWMCompDep.ImprimeReporte(bPreview:Boolean);
Var
   vlError : String;
begin
   Objeto.GetFromControl;
   Objeto.F_INICIO.GetFromControl;
   Objeto.F_FINAL.GetFromControl;
   Objeto.CVE_MONEDA.GetFromControl;
   Objeto.ID_ACREDITADO.GetFromControl;
   Objeto.ID_CREDITO.GetFromControl;
   Objeto.ID_EMPRESA.GetFromControl;
   Objeto.F_MOVIMIENTO.GetFromControl;
   Objeto.CUENTA_BANCO.GetFromControl;
   Objeto.CVE_PRODUCTO_GPO.GetFromControl;
   //limpia tabla temporal
   ClearTblReport( Objeto.Apli, vlError );
   if vlError <> '' then
     ShowMessage(vlError)
   else begin
   //Genera reporte
   RepCompDep(  Objeto.F_INICIO.AsDateTime,       Objeto.F_FINAL.AsDateTime,    Objeto.F_MOVIMIENTO.AsDateTime,
                Objeto.CVE_MONEDA.AsString,       Objeto.ID_ACREDITADO.AsString,Objeto.CUENTA_BANCO.AsString,
                Objeto.ID_CREDITO.AsString,       objeto.CVE_PRODUCTO_GPO.AsString,     Objeto.ID_EMPRESA.AsString,
                EdIDSucursal.Text,                edNbrArch.Text         ,      cbFMovimiento.Checked,
                cbRESUMENSM.Checked,              rgSitImpresion.ItemIndex ,    Objeto.Apli,                  bPreview);
   end;
    If Trim(edNbrArch.Text)<>'' Then Begin
       If bGenArch Then
         ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
       Else
         ShowMessage('No se generó el Archivo')
    End;

End;

procedure TWMCompDep.InterForma1BtnPreviewClick(Sender: TObject);
begin
   ImprimeReporte(True);
end;

procedure TWMCompDep.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimeReporte(False);
end;

procedure TWMCompDep.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TWMCompDep.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMCompDep.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TWMCompDep.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMCompDep.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TWMCompDep.btID_CREDITOClick(Sender: TObject);
begin
   Objeto.CrCredito.ShowAll := True;
   If Objeto.CrCredito.Busca Then Begin
      cbID_CREDITO.Checked:=True;
      cbID_CREDITO.Enabled:=True;
   End;
end;

procedure TWMCompDep.cbID_CREDITOClick(Sender: TObject);
begin
   EnableCheckBox(cbID_CREDITO);
   Objeto.CrCredito.Active := cbID_CREDITO.Checked;
end;

procedure TWMCompDep.ilDisposicionEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ilDisposicion.Buffer]) Then Begin
      cbID_CREDITO.Checked:=True;
      cbID_CREDITO.Enabled:=True;
   End;
end;

procedure TWMCompDep.edFECHAChange(Sender: TObject);
begin
   If edFECHA.Text <> '' Then Begin
      cbFMovimiento.Checked := True;
      cbFMovimiento.Enabled := True;
   End Else Begin
      cbFMovimiento.Checked := False;
      cbFMovimiento.Enabled := False;
   End;
end;

procedure TWMCompDep.edFECHAExit(Sender: TObject);
begin
    VerificaFechaCtrls(edFECHA, dtpFECHA);
end;
procedure TWMCompDep.VerificaFechaCtrls(pedFecha: TEdit; pdtpFecha: TInterDateTimePicker);
begin
     Try
        If Trim(pedFecha.Text) <> '' Then
            pdtpFecha.Date := StrToDate(pedFecha.Text);
     Except
        pedFecha.Text := FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
        pdtpFecha.Date := StrToDate(pedFecha.Text);
     End;
end;

procedure TWMCompDep.cbFMovimientoClick(Sender: TObject);
begin
   If Not cbFMovimiento.Checked Then Begin
      Objeto.F_MOVIMIENTO.AsString := '';
      cbFMovimiento.Enabled := False;
   End;
end;

procedure TWMCompDep.btID_ACREDITADOClick(Sender: TObject);
begin
   If Objeto.Acreditado.Busca Then Begin
      cbxID_ACREDITADO.Checked:= True;
      cbxID_ACREDITADO.Enabled:= True;
      InterForma1.NextTab(edID_ACREDITADO);
   End;
end;

procedure TWMCompDep.ilID_ACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Acreditado.FindKey([ilID_ACREDITADO.Buffer]) Then Begin
      cbxID_ACREDITADO.Checked:=True;
      cbxID_ACREDITADO.Enabled:=True;
      InterForma1.NextTab(edID_ACREDITADO);
   End;
end;

procedure TWMCompDep.cbxID_ACREDITADOClick(Sender: TObject);
begin
   EnableCheckBox(cbxID_ACREDITADO);
   Objeto.Acreditado.Active := cbxID_ACREDITADO.Checked;
end;

procedure TWMCompDep.btCtaChequeraClick(Sender: TObject);
begin
   If Objeto.CtaCheques.Busca Then Begin
      chbCtaCheques.Checked:= True;
      chbCtaCheques.Enabled:= True;
      InterForma1.NextTab(btCtaChequera);
   End;
end;

procedure TWMCompDep.chbCtaChequesClick(Sender: TObject);
begin
   EnableCheckBox(chbCtaCheques);
   Objeto.CtaCheques.Active := chbCtaCheques.Checked;
end;

procedure TWMCompDep.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      cbxCVE_PRODUCTO_GPO.Checked:=True;
      cbxCVE_PRODUCTO_GPO.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TWMCompDep.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      cbxCVE_PRODUCTO_GPO.Checked:=True;
      cbxCVE_PRODUCTO_GPO.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TWMCompDep.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   If not cbxCVE_PRODUCTO_GPO.Checked Then Begin
      Objeto.GpoProd.Active:=False;
      cbxCVE_PRODUCTO_GPO.Checked:=False;
      cbxCVE_PRODUCTO_GPO.Enabled:=False;
   End Else Begin
      cbxCVE_PRODUCTO_GPO.Checked:=True;
      cbxCVE_PRODUCTO_GPO.Enabled:=True;
   End;
end;

procedure TWMCompDep.sbExcelClick(Sender: TObject);
var sExt:String;
begin
  If SaveDialog1.Execute Then Begin
      sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
      If  UpperCase(sExt)= '.PRN' Then
         edNbrArch.Text := SaveDialog1.FileName
      Else
         edNbrArch.Text := SaveDialog1.FileName + '.prn';
  End Else
    edNbrArch.Text := '';
end;

procedure TWMCompDep.cbxArchivoClick(Sender: TObject);
begin
    If not cbxArchivo.Checked Then Begin
        edNbrArch.Text:= '';
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End Else Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End;
end;

end.
