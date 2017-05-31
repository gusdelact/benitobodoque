// edFInicio
// Sistema         : ICre01
// Fecha de Inicio : 11/09/2006
// Función forma   : Clase de IntMAuBlqDes
// Desarrollo por  : Intercase JMML
// Diseñado por    : Intercase JMML
// Comentarios     :

Unit IntMAuBlqDes;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,InterEdit,

IntParamCre,      //Parámetros Crédito
IntMon,           //Moneda
IntCrAcredit,     //Acreditado
IntEmple,
IntUsuario,       //Usuario
IntCrCto,         //Contrato
IntEmpre,         //Empresa
IntUnNeg         //Unidad Negocio/Suc
;

Type
 TMAuBlqDes= class;

  TwMAuBlqDes=Class(TForm)
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
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    cbxMoneda: TCheckBox;
    ilMONEDA: TInterLinkit;
    Label7: TLabel;
    cbxAutorizacion: TCheckBox;
    edDESC_PRODUCTO: TEdit;
    edCVE_PRODUCTO: TEdit;
    btCONTRATO: TBitBtn;
    iedID_CONTRATO: TInterEdit;
    ilIDCONTRATO: TInterLinkit;
    gbF_BLOQUEO: TGroupBox;
    lbLiqF_INICIO: TLabel;
    lbLiqF_FINAL: TLabel;
    dtpFInicio: TInterDateTimePicker;
    edFIniBloq: TEdit;
    edFFinBloq: TEdit;
    dtpFFin: TInterDateTimePicker;
    Label1: TLabel;
    edID_USUARIO: TEdit;
    edNOM_USUARIO: TEdit;
    cbxUsuario: TCheckBox;
    btUSUARIO: TBitBtn;
    ilUSUARIO: TInterLinkit;
    gbF_DESBLOQUEO: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    dtpFIniDesbloq: TInterDateTimePicker;
    edFIniDesbloq: TEdit;
    edFFinDesbloq: TEdit;
    dtpFFinDesbloq: TInterDateTimePicker;
    cbF_BLOQUEO: TCheckBox;
    cbF_DESBLOQUEO: TCheckBox;
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
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure cbxMonedaClick(Sender: TObject);
    procedure cbxAutorizacionClick(Sender: TObject);
    procedure btCONTRATOClick(Sender: TObject);
    procedure ilIDCONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure ilIDCONTRATOEjecuta(Sender: TObject);
    procedure edFIniBloqExit(Sender: TObject);
    procedure edFFinBloqExit(Sender: TObject);
    procedure btUSUARIOClick(Sender: TObject);
    procedure ilUSUARIOCapture(Sender: TObject; var Show: Boolean);
    procedure ilUSUARIOEjecuta(Sender: TObject);
    procedure cbxUsuarioClick(Sender: TObject);
    procedure edFIniDesbloqExit(Sender: TObject);
    procedure edFFinDesbloqExit(Sender: TObject);
    private
    { Private declarations }
     procedure VerificaFechaCtrls(pedFecha: TEdit; pdtpFecha: TDateTimePicker);
     procedure EnableCheckBox(var CheckBox : TCheckBox);
     procedure ImprimeReporte(bPreview : Boolean);
     Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMAuBlqDes;
    end;

 TMAuBlqDes= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        F_INI_BLOQ              : TInterCampo;
        F_FIN_BLOQ              : TInterCampo;
        F_INI_DBLOQ             : TInterCampo;
        F_FIN_DBLOQ             : TInterCampo;



        ParamCre                : TParamCre;
        Moneda                  : TMoneda;
        Acreditado              : TCrAcredit;
        ContratoCre             : TCrCto;
        Usuario                 : TUsuario;
        UnidadNegocio           : TUnNegocio;
        Empresa                 : TEmpresa;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation
{$R *.DFM}
Uses IntMQrAuBlqDes;      //Reporte de Autorizaciones Bloqueadas / Desbloqueadas

constructor TMAuBlqDes.Create( AOwner : TComponent );
begin
      Inherited;
      F_INI_BLOQ := CreaCampo('F_INI_BLOQ',ftDate,tsNinguno,tsNinguno,False);
      F_INI_BLOQ.Caption :='Fecha Inicial';

      F_FIN_BLOQ := CreaCampo('F_FIN',ftDate,tsNinguno,tsNinguno,False);
      F_FIN_BLOQ.Caption :='Fecha Final';

      F_INI_DBLOQ := CreaCampo('F_INI_DBLOQ',ftDate,tsNinguno,tsNinguno,False);
      F_FIN_DBLOQ := CreaCampo('F_FIN_DBLOQ',ftDate,tsNinguno,tsNinguno,False);


      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource := Self;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;

      Usuario := TUsuario.Create(Self);
      Usuario.MasterSource := Self;

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      StpName  := ' ';
      UseQuery := False;
      HelpFile := '';
      ShowMenuReporte:=True;
end;

Destructor TMAuBlqDes.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   If Acreditado <> Nil Then
      Acreditado.Free;
   If ContratoCre <> Nil Then
      ContratoCre.Free;
   If Usuario <> Nil Then
      Usuario.Free;
   If Empresa <> Nil Then
      Empresa.free;
   If UnidadNegocio <> Nil Then
      UnidadNegocio.Free;
   inherited;
end;

function TMAuBlqDes.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMAuBlqDes;
begin
   W:=TwMAuBlqDes.Create(Self);
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
procedure TwMAuBlqDes.AsignaEmpresaSuc;
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

procedure TwMAuBlqDes.FormShow(Sender: TObject);
var vlFD000 : TDate;
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

    Objeto.ContratoCre.ID_CONTRATO.Control := iedID_CONTRATO;
    Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO;
    Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control :=edDESC_PRODUCTO;
    Objeto.ContratoCre.GetParams(Objeto);

    Objeto.Usuario.CVE_USUARIO.Control := edID_USUARIO;
    Objeto.Usuario.Empleado.Persona.Nombre.Control := edNOM_USUARIO;
    Objeto.Usuario.GetParams(Objeto);

    Objeto.Empresa.ID_Empresa.Control := edIdEmpresa;
    Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
    Objeto.Empresa.GetParams(Objeto);

    Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
    Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
    Objeto.UnidadNegocio.GetParams(Objeto);

    Objeto.F_INI_BLOQ.Control := edFIniBloq;
    Objeto.F_FIN_BLOQ.Control := edFFinBloq;

    Objeto.F_INI_DBLOQ.Control := edFIniDesbloq;
    Objeto.F_FIN_DBLOQ.Control := edFFinDesbloq;

    vlFD000 := Objeto.Apli.DameFechaEmpresa;

    edFIniBloq.Text     := FormatDateTime('DD/MM/YYYY', vlFD000 );
    dtpFINICIO.DateTime := vlFD000;
    edFFinBloq.Text     := FormatDateTime('DD/MM/YYYY',vlFD000 );
    dtpFFIN.DateTime    := vlFD000;

    edFIniDesbloq.Text      := FormatDateTime('DD/MM/YYYY', vlFD000 );
    dtpFIniDesbloq.DateTime := vlFD000;
    edFFinDesbloq.Text      := FormatDateTime('DD/MM/YYYY', vlFD000 );
    dtpFFinDesbloq.DateTime := vlFD000;

    AsignaEmpresaSuc;
end;

procedure TwMAuBlqDes.FormDestroy(Sender: TObject);
begin
    Objeto.F_INI_BLOQ.Control := Nil;
    Objeto.F_FIN_BLOQ.Control := Nil;

    Objeto.F_INI_DBLOQ.Control := Nil;
    Objeto.F_FIN_DBLOQ.Control := Nil;

    Objeto.Moneda.Cve_Moneda.Control := Nil;
    Objeto.Moneda.Desc_Moneda.Control := Nil;
    Objeto.Acreditado.ID_ACREDITADO.Control := Nil;
    Objeto.Acreditado.Persona.Nombre.Control := Nil;
    Objeto.ContratoCre.ID_CONTRATO.Control := Nil;
    Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control := Nil;
    Objeto.Usuario.CVE_USUARIO.Control := Nil;
    Objeto.Usuario.Empleado.Persona.Nombre.Control := Nil;
    Objeto.Empresa.ID_Empresa.Control := Nil;
    Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
    Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
    Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMAuBlqDes.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMAuBlqDes.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TwMAuBlqDes.ImprimeReporte(bPreview : Boolean);
var sFIniBloq, sFFinBloq, sFIniDBloq, sFFinDBloq : String;
    bReporte : Boolean;
begin
    Objeto.GetFromControl;
    bReporte   := True;
    sFIniBloq  := '';    sFFinBloq  := '';
    sFIniDBloq := '';    sFFinDBloq := '';
    if cbF_BLOQUEO.Checked then
    begin
      if Objeto.F_INI_BLOQ.AsDateTime > Objeto.F_FIN_BLOQ.AsDateTime then
      begin
        ShowMessage('La Fecha Final de Bloqueo debe ser mayor o igual a la Fecha Inicial.');
        bReporte := False;
      end;
      sFIniBloq  := Objeto.F_INI_BLOQ.AsString;
      sFFinBloq  := Objeto.F_FIN_BLOQ.AsString;
    end;
    //
    if cbF_DESBLOQUEO.Checked then
    begin
      if Objeto.F_INI_DBLOQ.AsDateTime > Objeto.F_FIN_DBLOQ.AsDateTime then
      begin
        ShowMessage('La Fecha Final de Desbloqueo debe ser mayor o igual a la Fecha Inicial.');
        bReporte := False;
      end;
      sFIniDBloq := Objeto.F_INI_DBLOQ.AsString;
      sFFinDBloq := Objeto.F_FIN_DBLOQ.AsString;
    end;

    If bReporte Then
    Begin
        RepAuBlqDes( sFIniBloq, sFFinBloq, sFIniDBloq, sFFinDBloq,
                     Objeto.Moneda.Cve_Moneda.AsString,
                     Objeto.Acreditado.ID_ACREDITADO.AsString,
                     Objeto.ContratoCre.ID_CONTRATO.AsString,
                     Objeto.Usuario.CVE_USUARIO.AsString,
                     Objeto.Empresa.ID_Empresa.AsString,
                     Objeto.UnidadNegocio.Id_Entidad.AsString,
                     Objeto.Apli, bPreview );
    End;
End;

procedure TwMAuBlqDes.InterForma1BtnImprimirClick(Sender: TObject);
begin
    ImprimeReporte(False);
end;

procedure TwMAuBlqDes.InterForma1BtnPreviewClick(Sender: TObject);
begin
    ImprimeReporte(True);
end;

procedure TwMAuBlqDes.btACREDITADOClick(Sender: TObject);
begin
    Objeto.Acreditado.ShowAll := True;

    If Objeto.Acreditado.Busca Then Begin
        cbxAcreditado.Checked:= True;
        cbxAcreditado.Enabled:= True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMAuBlqDes.ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
begin
    Show:= True;
end;

procedure TwMAuBlqDes.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        cbxAcreditado.Checked:=True;
        cbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMAuBlqDes.cbxAcreditadoClick(Sender: TObject);
begin
    EnableCheckBox(cbxAcreditado);
    Objeto.Acreditado.Active := cbxAcreditado.Checked;
end;

procedure TwMAuBlqDes.bbEmpresaClick(Sender: TObject);
begin
    Objeto.Empresa.ShowAll := True;
    Objeto.Empresa.Busca;
end;

procedure TwMAuBlqDes.BBSucursalClick(Sender: TObject);
begin
    If Objeto.UnidadNegocio.Busca Then
        CBSucursal.Checked := True;
end;

procedure TwMAuBlqDes.ilEmpresaEjecuta(Sender: TObject);
begin
    Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMAuBlqDes.ILSucursalEjecuta(Sender: TObject);
begin
    If Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then
        CBSucursal.Checked := True;
end;

procedure TwMAuBlqDes.CBSucursalClick(Sender: TObject);
begin
    If Not(CBSucursal.Checked) Then Begin
        EdIDSucursal.Clear;
        EdDescSucursal.Clear;
        Objeto.UnidadNegocio.Active := False;
        CBSucursal.Checked := False;
    End;
end;

procedure TwMAuBlqDes.btCVE_MONEDAClick(Sender: TObject);
begin
    Objeto.Moneda.ShowAll := True;

    If Objeto.Moneda.Busca Then begin
        cbxMoneda.Checked:=True;
        cbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TwMAuBlqDes.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
    Show := True;
end;

procedure TwMAuBlqDes.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        cbxMoneda.Checked:=True;
        cbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TwMAuBlqDes.cbxMonedaClick(Sender: TObject);
begin
    EnableCheckBox(cbxMoneda);
    Objeto.Moneda.Active := cbxMoneda.Checked;
end;

procedure TwMAuBlqDes.cbxAutorizacionClick(Sender: TObject);
begin
    EnableCheckBox(cbxAutorizacion);
    Objeto.ContratoCre.Active := cbxAutorizacion.Checked;
end;

procedure TwMAuBlqDes.btCONTRATOClick(Sender: TObject);
begin
    Objeto.ContratoCre.ShowAll := True;

    if Objeto.ContratoCre.Busca then Begin
        cbxAutorizacion.Checked:= True;
        cbxAutorizacion.Enabled:= True;
        InterForma1.NextTab(btCONTRATO);
    End;
end;

procedure TwMAuBlqDes.ilIDCONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show := True;
end;

procedure TwMAuBlqDes.ilIDCONTRATOEjecuta(Sender: TObject);
begin
    If Objeto.ContratoCre.FindKey([ilIDCONTRATO.Buffer,'1']) Then Begin
        cbxAutorizacion.Checked:= True;
        cbxAutorizacion.Enabled:= True;
        InterForma1.NextTab(iedID_CONTRATO);
    End;
end;

procedure TwMAuBlqDes.VerificaFechaCtrls(pedFecha: TEdit; pdtpFecha: TDateTimePicker);
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

procedure TwMAuBlqDes.edFIniBloqExit(Sender: TObject);
begin
    VerificaFechaCtrls(edFIniBloq, dtpFInicio);
end;

procedure TwMAuBlqDes.edFFinBloqExit(Sender: TObject);
begin
    VerificaFechaCtrls(edFFinBloq, dtpFFin);
end;

procedure TwMAuBlqDes.edFIniDesbloqExit(Sender: TObject);
begin
    VerificaFechaCtrls(edFIniDesbloq, dtpFIniDesbloq);
end;


procedure TwMAuBlqDes.edFFinDesbloqExit(Sender: TObject);
begin
    VerificaFechaCtrls(edFFinDesbloq, dtpFFinDesbloq );
end;

procedure TwMAuBlqDes.btUSUARIOClick(Sender: TObject);
begin
    Objeto.Usuario.ShowAll := True;

    if Objeto.Usuario.Busca then Begin
        cbxUsuario.Checked:= True;
        cbxUsuario.Enabled:= True;
        InterForma1.NextTab(btUsuario);
    End;
end;

procedure TwMAuBlqDes.ilUSUARIOCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show := True;
end;

procedure TwMAuBlqDes.ilUSUARIOEjecuta(Sender: TObject);
begin
    If Objeto.Usuario.FindKey([ilUSUARIO.Buffer]) Then Begin
        cbxUsuario.Checked:= True;
        cbxUsuario.Enabled:= True;
        InterForma1.NextTab(edID_USUARIO);
    End;
end;

procedure TwMAuBlqDes.cbxUsuarioClick(Sender: TObject);
begin
    EnableCheckBox(cbxUsuario);
    Objeto.Usuario.Active := cbxUsuario.Checked;
end;



end.
