// Sistema         : ICre01
// Fecha de Inicio : 27/09/2006
// Función forma   : Clase de IntMMovXInt
// Desarrollo por  : Intercase JMML
// Diseñado por    : Intercase JMML
// Comentarios     :

Unit IntMMovXInt;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,InterEdit,

IntParamCre,      //Parámetros Crédito
IntMon,           //Moneda
IntCrAcredit,     //Acreditado
IntCrProduct,     //Producto de crédito
IntMPers,         //Promotor
IntEmple,
IntCrCto,         //Contrato
IntCrCredito,     //Disposición
IntEmpre,         //Empresa
IntUnNeg         //Unidad Negocio/Suc
;

Type
 TMMovXInt= class;

  TwMMovXInt=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label2: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    cbxAcreditado: TCheckBox;
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
    cbxProducto: TCheckBox;
    Label6: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO_CRE: TBitBtn;
    edDESC_PRODUCTO_CRE: TEdit;
    ilPRODUCTO_CRE: TInterLinkit;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    cbxMoneda: TCheckBox;
    ilMONEDA: TInterLinkit;
    lbID_PROMOTOR: TLabel;
    Label7: TLabel;
    edID_PROMOTOR: TEdit;
    btPROMOTOR: TBitBtn;
    edNOM_PROMOTOR: TEdit;
    rgTpoMovto: TRadioGroup;
    cbxPromotor: TCheckBox;
    cbxAutorizacion: TCheckBox;
    edDESC_PRODUCTO: TEdit;
    edCVE_PRODUCTO: TEdit;
    btCONTRATO: TBitBtn;
    iedID_CONTRATO: TInterEdit;
    ilPROMOTOR: TInterLinkit;
    ilIDCONTRATO: TInterLinkit;
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    lbLiqF_FINAL: TLabel;
    dtpFInicio: TInterDateTimePicker;
    edFInicio: TEdit;
    edFFin: TEdit;
    dtpFFin: TInterDateTimePicker;
    Label5: TLabel;
    edDisposicion: TEdit;
    btDisposicion: TBitBtn;
    edNomDisposicion: TEdit;
    cbxDisposicion: TCheckBox;
    ilDisposicion: TInterLinkit;
    rgSitMovto: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure cbxAcreditadoClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure btPRODUCTO_CREClick(Sender: TObject);
    procedure ilPRODUCTO_CREEjecuta(Sender: TObject);
    procedure cbxProductoClick(Sender: TObject);
    procedure ilPRODUCTO_GPOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTO_CRECapture(Sender: TObject; var Show: Boolean);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure cbxMonedaClick(Sender: TObject);
    procedure btPROMOTORClick(Sender: TObject);
    procedure ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROMOTOREjecuta(Sender: TObject);
    procedure cbxPromotorClick(Sender: TObject);
    procedure cbxAutorizacionClick(Sender: TObject);
    procedure btCONTRATOClick(Sender: TObject);
    procedure ilIDCONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure ilIDCONTRATOEjecuta(Sender: TObject);
    procedure edFInicioExit(Sender: TObject);
    procedure edFFinExit(Sender: TObject);
    procedure btDisposicionClick(Sender: TObject);
    procedure ilDisposicionCapture(Sender: TObject; var Show: Boolean);
    procedure ilDisposicionEjecuta(Sender: TObject);
    procedure cbxDisposicionClick(Sender: TObject);
    procedure rgTpoMovtoClick(Sender: TObject);
    private
    { Private declarations }
     procedure VerificaFechaCtrls(pedFecha: TEdit; pdtpFecha: TDateTimePicker);
     procedure EnableCheckBox(var CheckBox : TCheckBox);
     procedure ImprimeReporte(bPreview : Boolean);
     Procedure AsignaEmpresaSuc;
     procedure InhabilitaCtrls;
     procedure HabilitaCtrls;
    public
    { Public declarations }
    Objeto : TMMovXInt;
    end;

 TMMovXInt= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        F_INICIO                : TInterCampo;
        F_FIN                   : TInterCampo;

        ParamCre                : TParamCre;
        Moneda                  : TMoneda;
        Promotor                : TEmpleado;
        Acreditado              : TCrAcredit;
        ContratoCre             : TCrCto;
        CrCredito               : TCrCredito;
        UnidadNegocio           : TUnNegocio;
        Empresa                 : TEmpresa;
        Producto                : TCrProduct;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation
{$R *.DFM}
uses IntMQrMovXInt;      //Reporte de Movimientos X Internet

constructor TMMovXInt.Create( AOwner : TComponent );
begin Inherited;
      F_INICIO := CreaCampo('F_INICIO',ftDate,tsNinguno,tsNinguno,False);
            F_INICIO.Caption :='Fecha Inicial';
            F_INICIO.Parametro := 'F_INICIO';
      F_FIN := CreaCampo('F_FIN',ftDate,tsNinguno,tsNinguno,False);
            F_FIN.Caption :='Fecha Final';
            F_FIN.Parametro := 'F_FIN';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource := Self;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Producto := TCrProduct.Create(Self);
      Producto.MasterSource := Self;

      Promotor := TEmpleado.Create(Self);
      Promotor.FilterBy := fbTMPersonaEmpleado;
      Promotor.MasterSource := Self;
      Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;

      CrCredito := TCrCredito.Create(Self);
      CrCredito.MasterSource := Self;

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      StpName  := ' ';
      UseQuery := False;
      HelpFile := '';
      ShowMenuReporte:=True;
end;

Destructor TMMovXInt.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   If Acreditado <> Nil Then
      Acreditado.Free;
   If Producto <> Nil Then
      Producto.Free;
   If Promotor <> Nil Then
      Promotor.Free;
   If ContratoCre <> Nil Then
      ContratoCre.Free;
   If CrCredito <> Nil Then
      CrCredito.Free;
   If Empresa <> Nil Then
      Empresa.free;
   If UnidadNegocio <> Nil Then
      UnidadNegocio.Free;
   inherited;
end;

function TMMovXInt.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMMovXInt;
begin
   W:=TwMMovXInt.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

(***********************************************FORMA ********************)
(*                                                                              *)
(*  FORMA
(*                                                                              *)
(***********************************************FORMA ********************)
procedure TwMMovXInt.AsignaEmpresaSuc;
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

procedure TwMMovXInt.FormShow(Sender: TObject);
begin
    lbDempresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := Objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := Objeto.ParamCre.PERFIL.AsString;

    Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
    Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
    Objeto.Moneda.GetParams(Objeto);

    Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
    Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
    Objeto.Acreditado.GetParams(Objeto);

    Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
    Objeto.Producto.DESC_L_PRODUCTO.Control := edDESC_PRODUCTO_CRE;
    Objeto.Producto.GetParams(Objeto);

    Objeto.Promotor.ID_Persona.Control :=edID_PROMOTOR;
    Objeto.Promotor.Persona.Nombre.Control :=edNOM_PROMOTOR;
    Objeto.Promotor.GetParams(Objeto);

    Objeto.ContratoCre.ID_CONTRATO.Control := iedID_CONTRATO;
    Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO;
    Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control :=edDESC_PRODUCTO;
    Objeto.ContratoCre.GetParams(Objeto);

    Objeto.CrCredito.ID_CREDITO.Control := edDisposicion;
    Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edNomDisposicion;
    Objeto.CrCredito.GetParams(Objeto);

    Objeto.Empresa.ID_Empresa.Control := edIdEmpresa;
    Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
    Objeto.Empresa.GetParams(Objeto);

    Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
    Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
    Objeto.UnidadNegocio.GetParams(Objeto);

    Objeto.F_INICIO.Control := edFInicio;
    Objeto.F_FIN.Control := edFFin;

    edFINICIO.Text := FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
    dtpFINICIO.DateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
    edFFIN.Text := FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
    dtpFFIN.DateTime := Objeto.Apli.DameFechaEmpresaDia('D000');

    AsignaEmpresaSuc;
end;

procedure TwMMovXInt.FormDestroy(Sender: TObject);
begin
    Objeto.F_INICIO.Control := Nil;
    Objeto.F_FIN.Control := Nil;

    Objeto.Moneda.Cve_Moneda.Control := Nil;
    Objeto.Moneda.Desc_Moneda.Control := Nil;
    Objeto.Acreditado.ID_ACREDITADO.Control := Nil;
    Objeto.Acreditado.Persona.Nombre.Control := Nil;
    Objeto.Producto.CVE_PRODUCTO_CRE.Control := Nil;
    Objeto.Producto.DESC_L_PRODUCTO.Control := Nil;
    Objeto.Promotor.Persona.Nombre.Control := Nil;
    Objeto.Promotor.Id_Persona.Control := Nil;
    Objeto.ContratoCre.ID_CONTRATO.Control := Nil;
    Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control := Nil;
    Objeto.CrCredito.ID_CREDITO.Control := Nil;
    Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := Nil;
    Objeto.Empresa.ID_Empresa.Control := Nil;
    Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
    Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
    Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMMovXInt.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMMovXInt.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TwMMovXInt.ImprimeReporte(bPreview : Boolean);
Var
    sSituacion: String;
    sTpoMovto: String;
    iSit: Integer;
    iTpo: Integer;
begin
    Objeto.GetFromControl;

    iSit := rgSitMovto.ItemIndex;

    Case iSit Of
        0: sSituacion := ' = ';   //Ok = 0
        1: sSituacion := ' <> ';  //Error <> 0
        2: sSituacion := '';      //Indistinto
    End;

    iTpo := rgTpoMovto.ItemIndex;

    Case iTpo Of
        0: sTpoMovto := 'COLOCA';  //Colocación
        1: sTpoMovto := 'PAGO';    //Recuperación
        2: sTpoMovto := '';        //Indistinto
    End;

    If Objeto.F_FIN.AsDateTime >= Objeto.F_INICIO.AsDateTime Then Begin
        RepMovXInt( FormatDateTime('dd/mm/yyyy', Objeto.F_INICIO.AsDateTime),
                    FormatDateTime('dd/mm/yyyy', Objeto.F_FIN.AsDateTime),
                    Objeto.Moneda.Cve_Moneda.AsString,
                    Objeto.Promotor.ID_Persona.AsString,
                    Objeto.Producto.CVE_PRODUCTO_CRE.AsString,
                    Objeto.Acreditado.ID_ACREDITADO.AsString,
                    Objeto.ContratoCre.ID_CONTRATO.AsString,
                    Objeto.CrCredito.ID_CREDITO.AsString,
                    sSituacion,
                    sTpoMovto,
                    Objeto.Empresa.ID_Empresa.AsString,
                    Objeto.UnidadNegocio.Id_Entidad.AsString,
                    Objeto.Apli, bPreview );
    End Else
       ShowMessage('La Fecha Final debe ser mayor a la Fecha Inicial.');
End;

procedure TwMMovXInt.InterForma1BtnImprimirClick(Sender: TObject);
begin
    ImprimeReporte(False);
end;

procedure TwMMovXInt.InterForma1BtnPreviewClick(Sender: TObject);
begin
    ImprimeReporte(True);
end;

procedure TwMMovXInt.btACREDITADOClick(Sender: TObject);
begin
    Objeto.Acreditado.ShowAll := True;

    If Objeto.Acreditado.Busca Then Begin
        cbxAcreditado.Checked:= True;
        cbxAcreditado.Enabled:= True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMMovXInt.ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
begin
    Show:= True;
end;

procedure TwMMovXInt.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        cbxAcreditado.Checked:=True;
        cbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMMovXInt.cbxAcreditadoClick(Sender: TObject);
begin
    EnableCheckBox(cbxAcreditado);
    Objeto.Acreditado.Active := cbxAcreditado.Checked;
end;

procedure TwMMovXInt.bbEmpresaClick(Sender: TObject);
begin
    Objeto.Empresa.ShowAll := True;
    Objeto.Empresa.Busca;
end;

procedure TwMMovXInt.BBSucursalClick(Sender: TObject);
begin
    If Objeto.UnidadNegocio.Busca Then
        CBSucursal.Checked := True;
end;

procedure TwMMovXInt.ilEmpresaEjecuta(Sender: TObject);
begin
    Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMMovXInt.ILSucursalEjecuta(Sender: TObject);
begin
    If Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then
        CBSucursal.Checked := True;
end;

procedure TwMMovXInt.CBSucursalClick(Sender: TObject);
begin
    If Not(CBSucursal.Checked) Then Begin
        EdIDSucursal.Clear;
        EdDescSucursal.Clear;
        Objeto.UnidadNegocio.Active := False;
        CBSucursal.Checked := False;
    End;
end;

procedure TwMMovXInt.btPRODUCTO_CREClick(Sender: TObject);
begin
    Objeto.Producto.ShowAll := True;

    If Objeto.Producto.Busca Then Begin
        cbxProducto.Checked:=True;
        cbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TwMMovXInt.ilPRODUCTO_CREEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO_CRE.Buffer]) Then Begin
        cbxProducto.Checked:=True;
        cbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TwMMovXInt.cbxProductoClick(Sender: TObject);
begin
    EnableCheckBox(cbxProducto);
    Objeto.Producto.Active := cbxProducto.Checked;
end;

procedure TwMMovXInt.ilPRODUCTO_GPOCapture(Sender: TObject; var Show: Boolean);
begin
    Show:= True;
end;

procedure TwMMovXInt.ilPRODUCTO_CRECapture(Sender: TObject; var Show: Boolean);
begin
    Show:= True;
end;

procedure TwMMovXInt.btCVE_MONEDAClick(Sender: TObject);
begin
    Objeto.Moneda.ShowAll := True;

    If Objeto.Moneda.Busca Then begin
        cbxMoneda.Checked:=True;
        cbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TwMMovXInt.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
    Show := True;
end;

procedure TwMMovXInt.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        cbxMoneda.Checked:=True;
        cbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TwMMovXInt.cbxMonedaClick(Sender: TObject);
begin
    EnableCheckBox(cbxMoneda);
    Objeto.Moneda.Active := cbxMoneda.Checked;
end;

procedure TwMMovXInt.btPROMOTORClick(Sender: TObject);
begin
    Objeto.Promotor.ShowAll := True;

    If Objeto.Promotor.Busca Then Begin
        cbxPromotor.Checked:=True;
        cbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMMovXInt.ilPROMOTORCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show:=True;
end;

procedure TwMMovXInt.ilPROMOTOREjecuta(Sender: TObject);
begin
    If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
        cbxPromotor.Checked:=True;
        cbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMMovXInt.cbxPromotorClick(Sender: TObject);
begin
    EnableCheckBox(cbxPromotor);
    Objeto.Promotor.Active := cbxPromotor.Checked;
end;

procedure TwMMovXInt.cbxAutorizacionClick(Sender: TObject);
begin
    EnableCheckBox(cbxAutorizacion);
    Objeto.ContratoCre.Active := cbxAutorizacion.Checked;
end;

procedure TwMMovXInt.btCONTRATOClick(Sender: TObject);
begin
    Objeto.ContratoCre.ShowAll := True;
    
    if Objeto.ContratoCre.Busca then Begin
        cbxAutorizacion.Checked:= True;
        cbxAutorizacion.Enabled:= True;
        InterForma1.NextTab(btCONTRATO);
    End;
end;

procedure TwMMovXInt.ilIDCONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show := True;
end;

procedure TwMMovXInt.ilIDCONTRATOEjecuta(Sender: TObject);
begin
    If Objeto.ContratoCre.FindKey([ilIDCONTRATO.Buffer,'1']) Then Begin
        cbxAutorizacion.Checked:= True;
        cbxAutorizacion.Enabled:= True;
        InterForma1.NextTab(iedID_CONTRATO);
    End;
end;

procedure TwMMovXInt.VerificaFechaCtrls(pedFecha: TEdit; pdtpFecha: TDateTimePicker);
begin
     Try
        If Trim(pedFecha.Text) <> '' Then
            pdtpFecha.Date := StrToDate(pedFecha.Text)
        Else Begin
            pedFecha.Text := FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
            pdtpFecha.Date := StrToDate(pedFecha.Text);
        End;
     Except
        pedFecha.Text := FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
        pdtpFecha.Date := StrToDate(pedFecha.Text);
     End;
end;

procedure TwMMovXInt.edFInicioExit(Sender: TObject);
begin
    VerificaFechaCtrls(edFInicio, dtpFInicio);
end;

procedure TwMMovXInt.edFFinExit(Sender: TObject);
begin
    VerificaFechaCtrls(edFFin, dtpFFin);
end;

procedure TwMMovXInt.btDisposicionClick(Sender: TObject);
begin
    Objeto.CrCredito.ShowAll := True;

    If Objeto.CrCredito.Busca Then Begin
        cbxDisposicion.Checked:=True;
        cbxDisposicion.Enabled:=True;
        InterForma1.NextTab(edDisposicion);
    End;
end;

procedure TwMMovXInt.ilDisposicionCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show:= True;
end;

procedure TwMMovXInt.ilDisposicionEjecuta(Sender: TObject);
begin
    If Objeto.CrCredito.FindKey([ilDisposicion.Buffer]) Then Begin
        cbxDisposicion.Checked:=True;
        cbxDisposicion.Enabled:=True;
        InterForma1.NextTab(edDisposicion);
    End;
end;

procedure TwMMovXInt.cbxDisposicionClick(Sender: TObject);
begin
    EnableCheckBox(cbxDisposicion);
    Objeto.CrCredito.Active := cbxDisposicion.Checked;
end;

procedure TwMMovXInt.HabilitaCtrls;
begin
    btDisposicion.Enabled := True;

    edDisposicion.Color := clWindow;
    edDisposicion.ReadOnly := False;
end;

procedure TwMMovXInt.InhabilitaCtrls;
begin
    If cbxDisposicion.Checked Then
        cbxDisposicion.Checked := False;

    btDisposicion.Enabled := False;

    edDisposicion.Color := clBtnFace;
    edDisposicion.ReadOnly := True;
end;

procedure TwMMovXInt.rgTpoMovtoClick(Sender: TObject);
begin
    If rgTpoMovto.ItemIndex = 0 Then
        InhabilitaCtrls
    Else
        HabilitaCtrls;
end;

end.
