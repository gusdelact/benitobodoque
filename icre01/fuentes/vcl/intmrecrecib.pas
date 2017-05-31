// Sistema         :
// Fecha de Inicio :
// Función forma   :
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMRecRecib;

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
IntCrAcredit,
IntCrCreChe,    //Cuenta de Cheques
IntEmple, IntMQrRecRecib,
IntMProdGpo,    //GRUPO PRODUCTO
IntGenCre
;

Type
 TMRecRecib = class;

  TwMRecRecib = Class(TForm)
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
    lbCUENTA_BANCO: TLabel;
    edCUENTA_BANCO: TEdit;
    edBANCO: TEdit;
    btCtaChequera: TBitBtn;
    chbCtaCheques: TCheckBox;
    cbFMovimiento: TCheckBox;
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    Label2: TLabel;
    edF_INICIO: TEdit;
    dtpF_Ini: TInterDateTimePicker;
    edF_FINAL: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    Label4: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edNOM_CVE_PRODUCTO_GPO: TEdit;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    cbRESUMENSM: TCheckBox;
    edNbrArch: TEdit;
    Label5: TLabel;
    sbExcel: TSpeedButton;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
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
    procedure btCtaChequeraClick(Sender: TObject);
    procedure chbCtaChequesClick(Sender: TObject);
    procedure cbFMovimientoClick(Sender: TObject);
    procedure edFECHAChange(Sender: TObject);
    procedure edF_INICIOExit(Sender: TObject);
    procedure edF_FINALExit(Sender: TObject);
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
    Objeto : TMRecRecib;
end;
 TMRecRecib= class(TInterFrame)
      private
      protected
      public
        { Public declarations }

        CVE_MONEDA               : TInterCampo;
        DESC_MONEDA              : TInterCampo;
        ID_CREDITO               : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        DESC_CONTRATO            : TInterCampo;
        F_INICIO                 : TInterCampo;
        F_FINAL                  : TInterCampo;
        FECHA                    : TInterCampo;
        ID_TITULAR               : TInterCampo;
        NOM_TITULAR              : TInterCampo;
        CUENTA_BANCO             : TInterCampo;
        ID_EMPRESA               : TInterCampo;
        CVE_PRODUCTO_GPO        : TInterCampo;

        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        CrCredito                : TCrCredito;
        Titular                  : TCrAcredit;
        CtaCheques               : TCrCreChe;
        GpoProd                  : TMProdGpo;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
//Uses RepMon;
{$R *.DFM}

constructor TMRecRecib.Create( AOwner : TComponent );
begin Inherited;

      CVE_MONEDA := CreaCampo('CVE_MONEDA',ftString,tsNinguno,tsNinguno,False);
                CVE_MONEDA.Caption := 'Moneda';
                CVE_MONEDA.Parametro := 'CVE_MONEDA';
      DESC_MONEDA := CreaCampo('DESC_MONEDA',ftString,tsNinguno,tsNinguno,False);
                DESC_MONEDA.Caption := 'Descripción de Moneda';
                DESC_MONEDA.Parametro := 'DESC_MONEDA';
      ID_CREDITO := CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
                ID_CREDITO.Caption := 'Número Disposición';
                ID_CREDITO.Parametro := 'ID_CREDITO';
      F_INICIO:=CreaCampo('F_INICIO',ftDate,tsNinguno,tsNinguno,False);
                F_INICIO.Caption := 'Fecha Inicial';
                F_INICIO.Parametro := 'F_INICIO';
      F_FINAL := CreaCampo('F_FINAL',ftDate,tsNinguno,tsNinguno,False);
                F_FINAL.Caption := 'Fecha Final';
                F_FINAL.Parametro := 'F_FINAL';
      FECHA := CreaCampo('FECHA',ftDate,tsNinguno,tsNinguno,False);
                FECHA.Caption := 'Fecha';
                FECHA.Parametro := 'FECHA';
      ID_TITULAR := CreaCampo('ID_TITULAR',ftInteger,tsNinguno,tsNinguno,False);
                ID_TITULAR.Caption := 'Titular';
                ID_TITULAR.Parametro := 'ID_TITULAR';
      NOM_TITULAR := CreaCampo('NOM_TITULAR',ftString,tsNinguno,tsNinguno,False);
                NOM_TITULAR.Caption:='Nombre Titular';
                NOM_TITULAR.Parametro:='NOM_TITULAR';
      CUENTA_BANCO := CreaCampo('CUENTA_BANCO',ftString,tsNinguno,tsNinguno,False);
                CUENTA_BANCO.Caption := 'Cuenta de Cheques';
                CUENTA_BANCO.Parametro:='CUENTA_BANCO';
      ID_EMPRESA:=CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,False);
      CVE_PRODUCTO_GPO :=CreaCampo('CVE_PRODUCTO_GPO',ftString,tsNinguno,tsNinguno,False);

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource := Self;

      CrCredito := TCrCredito.Create(Self);
      CrCredito.MasterSource := Self;

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      Titular := TCrAcredit.Create(Self);
      Titular.MasterSource := Self;

      CtaCheques := TCrCreChe.Create(Self);
      CtaCheques.MasterSource := Self;
      GpoProd:= TMProdGpo.Create(Self);
      GpoProd.MasterSource:=Self;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMRecRecib.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMRecRecib.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   If CrCredito <> Nil then
      CrCredito.Free;
   if Empresa <> Nil then
      Empresa.free;
   if UnidadNegocio <> Nil then
      UnidadNegocio.Free;
   If Titular <> Nil Then
      Titular.Free;
   If CtaCheques <> Nil Then
      CtaCheques.Free;
   If GpoProd <> Nil Then
      GpoProd.Free;
   inherited;
end;


function TMRecRecib.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMRecRecib;
begin
   W := TwMRecRecib.Create(Self);
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

function TMRecRecib.Reporte:Boolean;
begin //Execute_Reporte();
end;
(****************************************FORMA IntMRecRecib********************)
(*                                                                            *)
(*  FORMA DE IntMRecRecib                                                     *)
(*                                                                            *)
(****************************************FORMA IntMRecRecib********************)
procedure TwMRecRecib.AsignaEmpresaSuc;
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

Procedure TwMRecRecib.EnableCheckBox(Var CheckBox : TCheckBox);
Begin
   If Not CheckBox.Checked Then Begin
      CheckBox.Checked:=False;
      CheckBox.Enabled:=False;
   End Else Begin
      CheckBox.Checked:=True;
      CheckBox.Enabled:=True;
   End;
End;

procedure TwMRecRecib.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.CVE_MONEDA.Control := edCVE_MONEDA;
   Objeto.DESC_MONEDA.Control := edDESC_MONEDA;
   Objeto.ID_CREDITO.Control := edDisposicion;
   Objeto.F_INICIO.Control := edF_INICIO;
   Objeto.F_FINAL.Control := edF_FINAL;
   Objeto.FECHA.Control := edFECHA;
   Objeto.ID_TITULAR.Control := edID_TITULAR;
   Objeto.NOM_TITULAR.Control := edNOM_TITULAR;
   Objeto.CUENTA_BANCO.Control := edCUENTA_BANCO;
   Objeto.CVE_PRODUCTO_GPO.Control :=edCVE_PRODUCTO_GPO;
   Objeto.ID_EMPRESA.Control:=edIdEmpresa;

   Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
   Objeto.CrCredito.ID_CREDITO.Control := edDisposicion;
   Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edNomDisposicion;
   Objeto.Titular.ID_ACREDITADO.Control := edID_TITULAR;
   Objeto.Titular.Persona.Nombre.Control := edNOM_TITULAR;
   Objeto.CtaCheques.CUENTA_BANCO.Control := edCUENTA_BANCO;
   Objeto.CtaCheques.Persona.Nombre.Control := edBANCO;

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);
   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
   Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
   Objeto.GpoProd.GetParams(Objeto);
   AsignaEmpresaSuc;
   Objeto.F_INICIO.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.F_FINAL.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
end;

procedure TwMRecRecib.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_MONEDA.Control := Nil;
   Objeto.DESC_MONEDA.Control := Nil;
   Objeto.ID_CREDITO.Control := Nil;
   Objeto.F_INICIO.Control := Nil;
   Objeto.F_FINAL.Control := Nil;
   Objeto.FECHA.Control := Nil;
   Objeto.ID_TITULAR.Control := Nil;
   Objeto.NOM_TITULAR.Control := Nil;
   Objeto.CUENTA_BANCO.Control := Nil;
   Objeto.ID_EMPRESA.Control:=nil;
   Objeto.CVE_PRODUCTO_GPO.Control :=nil;

   Objeto.Moneda.Cve_Moneda.Control := Nil;
   Objeto.Moneda.Desc_Moneda.Control := Nil;
   Objeto.CrCredito.ID_CREDITO.Control := Nil;
   Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := Nil;
   Objeto.Titular.ID_ACREDITADO.Control := Nil;
   Objeto.Titular.Persona.Nombre.Control := Nil;
   Objeto.CtaCheques.CUENTA_BANCO.Control := Nil;
   Objeto.CtaCheques.Persona.Nombre.Control := Nil;

   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
   Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= nil;
   Objeto.GpoProd.DESC_C_PROD_GPO.Control:= nil;
end;

procedure TwMRecRecib.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

Procedure TwMRecRecib.ImprimeReporte(bPreview:Boolean);
Var
   vlError : String;
begin
   Objeto.F_INICIO.GetFromControl;
   Objeto.F_FINAL.GetFromControl;
   Objeto.FECHA.GetFromControl;

   Objeto.CVE_MONEDA.GetFromControl;
   Objeto.ID_TITULAR.GetFromControl;
   Objeto.ID_CREDITO.GetFromControl;
   Objeto.CUENTA_BANCO.GetFromControl;
   Objeto.ID_EMPRESA.GetFromControl;
   Objeto.CVE_PRODUCTO_GPO.GetFromControl;   
   //limpia tabla temporal
   ClearTblReport( Objeto.Apli, vlError );
   if vlError <> '' then
     ShowMessage(vlError)
   else Begin
   //Genera reporte
   RepRecRecib( Objeto.F_INICIO.AsDateTime,       Objeto.F_FINAL.AsDateTime,    Objeto.FECHA.AsDateTime,
                Objeto.CVE_MONEDA.AsString,       Objeto.ID_TITULAR.AsString,   Objeto.ID_CREDITO.AsString,
                Objeto.CUENTA_BANCO.AsString,     objeto.CVE_PRODUCTO_GPO.AsString,Objeto.ID_EMPRESA.AsString,
                EdIDSucursal.Text,                edNbrArch.Text         ,      cbFMovimiento.Checked,
                cbRESUMENSM.Checked,              Objeto.Apli,                  bPreview);
    If Trim(edNbrArch.Text)<>'' Then Begin
       If bGenArch Then
         ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
       Else
         ShowMessage('No se generó el Archivo')
    End;
   end;
End;

procedure TwMRecRecib.InterForma1BtnPreviewClick(Sender: TObject);
begin
   ImprimeReporte(True);
end;

procedure TwMRecRecib.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimeReporte(False);
end;

procedure TwMRecRecib.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMRecRecib.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMRecRecib.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMRecRecib.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([IlSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMRecRecib.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMRecRecib.btID_TITULARClick(Sender: TObject);
begin
   Objeto.Titular.ShowAll := True;
   If Objeto.Titular.Busca Then Begin
      chbID_TITULAR.Checked := True;
      chbID_TITULAR.Enabled := True;
      InterForma1.NextTab(edID_TITULAR);
   End;
end;

procedure TwMRecRecib.chbID_TITULARClick(Sender: TObject);
begin
   EnableCheckBox(chbID_TITULAR);
   Objeto.Titular.Active := chbID_TITULAR.Checked;
end;

procedure TwMRecRecib.ilID_TITULAREjecuta(Sender: TObject);
begin
   If Objeto.Titular.FindKey([ilID_TITULAR.Buffer])Then Begin
      chbID_TITULAR.Checked := True;
      chbID_TITULAR.Enabled := True;
      InterForma1.NextTab(edID_TITULAR);
   End;
end;

procedure TwMRecRecib.VerificaFechaCtrls(pedFecha: TEdit; pdtpFecha: TInterDateTimePicker);
begin
     Try
        If Trim(pedFecha.Text) <> '' Then
            pdtpFecha.Date := StrToDate(pedFecha.Text);
     Except
        pedFecha.Text := FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
        pdtpFecha.Date := StrToDate(pedFecha.Text);
     End;
end;

procedure TwMRecRecib.edFECHAExit(Sender: TObject);
begin
    VerificaFechaCtrls(edFECHA, dtpFecha);
end;

procedure TwMRecRecib.btDisposicionClick(Sender: TObject);
begin
   Objeto.CrCredito.ShowAll := True;
   If Objeto.CrCredito.Busca Then Begin
      cbxDisposicion.Checked:=True;
      cbxDisposicion.Enabled:=True;
      InterForma1.NextTab(edDisposicion);
   End;
end;

procedure TwMRecRecib.ilDisposicionEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ilDisposicion.Buffer]) Then Begin
      cbxDisposicion.Checked:=True;
      cbxDisposicion.Enabled:=True;
      InterForma1.NextTab(edDisposicion);
   End;
end;

procedure TwMRecRecib.cbxDisposicionClick(Sender: TObject);
begin
   EnableCheckBox(cbxDisposicion);
   Objeto.CrCredito.Active := cbxDisposicion.Checked;
end;

procedure TwMRecRecib.btMonedaClick(Sender: TObject);
begin
   If Objeto.Moneda.Busca Then Begin
      chbMoneda.Checked := True;
      chbMoneda.Enabled := True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMRecRecib.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilCVE_MONEDA.Buffer]) Then Begin
      chbMoneda.Checked := True;
      chbMoneda.Enabled := True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMRecRecib.chbMonedaClick(Sender: TObject);
begin
   EnableCheckBox(chbMoneda);
   Objeto.Moneda.Active := chbMoneda.Checked;
end;

procedure TwMRecRecib.btCtaChequeraClick(Sender: TObject);
begin
   If Objeto.CtaCheques.Busca Then Begin
      chbCtaCheques.Checked:= True;
      chbCtaCheques.Enabled:= True;
      InterForma1.NextTab(btCtaChequera);
   End;
end;

procedure TwMRecRecib.chbCtaChequesClick(Sender: TObject);
begin
   EnableCheckBox(chbCtaCheques);
   Objeto.CtaCheques.Active := chbCtaCheques.Checked;
end;

procedure TwMRecRecib.cbFMovimientoClick(Sender: TObject);
begin
    EnableCheckBox(cbFMovimiento);
    cbFMovimiento.Enabled := cbFMovimiento.Checked;

    If Not cbFMovimiento.Enabled Then
        edFECHA.Text := '';
end;

procedure TwMRecRecib.edFECHAChange(Sender: TObject);
begin
    If edFECHA.Text <> '' Then Begin
        cbFMovimiento.Checked := True;
        cbFMovimiento.Enabled := True;
    End Else Begin
        cbFMovimiento.Checked := False;
        cbFMovimiento.Enabled := False;
    End;
end;

procedure TwMRecRecib.edF_INICIOExit(Sender: TObject);
begin
    VerificaFechaCtrls(edF_INICIO, dtpF_Ini);
    Objeto.F_INICIO.AsString := edF_INICIO.Text;
end;

procedure TwMRecRecib.edF_FINALExit(Sender: TObject);
begin
    VerificaFechaCtrls(edF_FINAL, dtpF_Fin);
    Objeto.F_FINAL.AsString := edF_FINAL.Text;
end;

procedure TwMRecRecib.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      cbxCVE_PRODUCTO_GPO.Checked:=True;
      cbxCVE_PRODUCTO_GPO.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMRecRecib.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      cbxCVE_PRODUCTO_GPO.Checked:=True;
      cbxCVE_PRODUCTO_GPO.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMRecRecib.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
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

procedure TwMRecRecib.sbExcelClick(Sender: TObject);
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

procedure TwMRecRecib.cbxArchivoClick(Sender: TObject);
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
