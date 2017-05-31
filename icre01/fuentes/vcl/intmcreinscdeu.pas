// Sistema         :
// Fecha de Inicio : 14/04/2005
// Función forma   :
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMCreInscDeu;

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
IntEmple,
IntCrAcredit,
IntCrCto,
IntCrInsDeu,
IntMQrCreInscDeud
;

Type
 TMCrInsDeu = class;

  TwMCrInsDeu = Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_MONEDA : TLabel;
    edCVE_MONEDA : TEdit;
    edDESC_MONEDA : TEdit;
    lbID_ACREDITADO : TLabel;
    edTIP_INSCR_DEU: TEdit;
    edDESC_INSCR_DEU: TEdit;
    btMoneda: TBitBtn;
    btTIP_INSCR_DEU: TBitBtn;
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
    chbTIP_INSCR_DEU: TCheckBox;
    ilCVE_MONEDA: TInterLinkit;
    ilTIP_INSCR_DEU: TInterLinkit;
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
    Label4: TLabel;
    chbDIAS_DIF: TCheckBox;
    edID_CONTRATO: TEdit;
    btID_CONTRATO: TBitBtn;
    edDESC_CONTRATO: TEdit;
    chbID_CONTRATO: TCheckBox;
    ilID_CONTRATO: TInterLinkit;
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
    edF_PROG_INSC: TEdit;
    dtpFProgInsc: TInterDateTimePicker;
    Label7: TLabel;
    edF_REAL_INSC: TEdit;
    dtpFRealInsc: TInterDateTimePicker;
    chbF_REAL_INSC: TCheckBox;
    chbF_PROG_INSC: TCheckBox;
    Label2: TLabel;
    edDIAS_DIF: TInterEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btMonedaClick(Sender: TObject);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure chbMonedaClick(Sender: TObject);
    procedure btTIP_INSCR_DEUClick(Sender: TObject);
    procedure ilTIP_INSCR_DEUEjecuta(Sender: TObject);
    procedure chbTIP_INSCR_DEUClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure btID_TITULARClick(Sender: TObject);
    procedure chbID_TITULARClick(Sender: TObject);
    procedure ilID_TITULAREjecuta(Sender: TObject);
    procedure chbID_CONTRATOClick(Sender: TObject);
    procedure chbF_PROG_INSCClick(Sender: TObject);
    procedure chbF_REAL_INSCClick(Sender: TObject);
    procedure chbDIAS_DIFClick(Sender: TObject);
    procedure edF_PROG_INSCChange(Sender: TObject);
    procedure edF_REAL_INSCChange(Sender: TObject);
    procedure edF_REAL_INSCExit(Sender: TObject);
    procedure edF_PROG_INSCExit(Sender: TObject);
    procedure edFECHAExit(Sender: TObject);
    procedure edDIAS_DIFChange(Sender: TObject);
    private
      Procedure EnableCheckBox(var CheckBox : TCheckBox);
      Procedure ImprimeReporte(bPreview:Boolean);
      Procedure AsignaEmpresaSuc;
      procedure VerificaFechaCtrls(pedFecha: TEdit; pdtpFecha: TInterDateTimePicker);

    { Private declarations }
    public
    { Public declarations }
    Objeto : TMCrInsDeu;
end;
 TMCrInsDeu= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_MONEDA               : TInterCampo;
        DESC_MONEDA              : TInterCampo;
        CVE_TIP_INSCR_D          : TInterCampo;
        DESC_INSC_DEU            : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        DESC_CONTRATO            : TInterCampo;
        FECHA                    : TInterCampo;
        ID_TITULAR               : TInterCampo;
        NOM_TITULAR              : TInterCampo;
        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;
        InscDeuda                : TCrInsDeu;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        Autorizacion             : TCrCto;
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

constructor TMCrInsDeu.Create( AOwner : TComponent );
begin Inherited;
      CVE_MONEDA := CreaCampo('CVE_MONEDA',ftString,tsNinguno,tsNinguno,False);
                CVE_MONEDA.Caption := 'Moneda';
                CVE_MONEDA.Parametro := 'CVE_MONEDA';
      DESC_MONEDA := CreaCampo('DESC_MONEDA',ftString,tsNinguno,tsNinguno,False);
                DESC_MONEDA.Caption := 'Descripción de Moneda';
                DESC_MONEDA.Parametro := 'DESC_MONEDA';
      CVE_TIP_INSCR_D := CreaCampo('CVE_TIP_INSCR_D',ftString,tsNinguno,tsNinguno,False);
                CVE_TIP_INSCR_D.Caption := 'Tipo Inscripción de Deuda';
                CVE_TIP_INSCR_D.Parametro := 'CVE_TIP_INSCR_D';
      DESC_INSC_DEU := CreaCampo('DESC_INSC_DEU',ftString,tsNinguno,tsNinguno,False);
                DESC_INSC_DEU.Caption := 'Tipo de Inscripción de Deuda';
                DESC_INSC_DEU.Parametro := 'DESC_INSC_DEU';
      ID_CONTRATO := CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,False);
                ID_CONTRATO.Caption := 'Número de Autorización';
                ID_CONTRATO.Parametro := 'ID_CONTRATO';
      DESC_CONTRATO := CreaCampo('DESC_CONTRATO',ftString,tsNinguno,tsNinguno,False);
                DESC_CONTRATO.Caption := 'Descripción de Contrato';
                DESC_CONTRATO.Parametro := 'DESC_CONTRATO';
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

      InscDeuda := TCrInsDeu.Create(Self);
      InscDeuda.MasterSource:=Self;

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      Autorizacion := TCrCto.Create(Self);
      Autorizacion.MasterSource := Self;

      Titular := TCrAcredit.Create(Self);
      Titular.MasterSource:=Self;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMCreInscDeu.Hlp';
      ShowMenuReporte:=True;

end;

Destructor TMCrInsDeu.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   If InscDeuda <> Nil Then
      InscDeuda.Free;
   if Empresa <> Nil then
      Empresa.free;
   if UnidadNegocio <> Nil then
      UnidadNegocio.Free;
   If Autorizacion <> Nil Then
      Autorizacion.Free;
   If Titular<> Nil Then
      Titular.Free;
   inherited;
end;


function TMCrInsDeu.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMCrInsDeu;
begin
   W := TwMCrInsDeu.Create(Self);
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

function TMCrInsDeu.Reporte:Boolean;
begin //Execute_Reporte();
end;
(****************************************FORMA IntMCreInscDeu********************)
(*                                                                              *)
(*  FORMA DE IntMCreInscDeu                                                     *)
(*                                                                              *)
(****************************************FORMA IntMCreInscDeu********************)
procedure TwMCrInsDeu.AsignaEmpresaSuc;
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

Procedure TwMCrInsDeu.EnableCheckBox(Var CheckBox : TCheckBox);
Begin
   If Not CheckBox.Checked Then Begin
      CheckBox.Checked:=False;
      CheckBox.Enabled:=False;
   End Else Begin
      CheckBox.Checked:=True;
      CheckBox.Enabled:=True;
   End;
End;

procedure TwMCrInsDeu.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.CVE_MONEDA.Control := edCVE_MONEDA;
   Objeto.DESC_MONEDA.Control := edDESC_MONEDA;
   Objeto.CVE_TIP_INSCR_D.Control := edTIP_INSCR_DEU;
   Objeto.DESC_INSC_DEU.Control := edDESC_INSCR_DEU;
   Objeto.ID_CONTRATO.Control := edID_CONTRATO;
   Objeto.DESC_CONTRATO.Control := edDESC_CONTRATO;
   Objeto.FECHA.Control := edFECHA;
   Objeto.ID_TITULAR.Control := edID_TITULAR;
   Objeto.NOM_TITULAR.Control := edNOM_TITULAR;

   Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
   Objeto.InscDeuda.CVE_TIP_INSCR_D.Control := edTIP_INSCR_DEU;
   Objeto.InscDeuda.DESCRIPCION.Control := edDESC_INSCR_DEU;
   Objeto.Autorizacion.ID_CONTRATO.Control := edID_CONTRATO;
   Objeto.Autorizacion.Acreditado.Persona.Nombre.Control := edDESC_CONTRATO;
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

procedure TwMCrInsDeu.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_MONEDA.Control := Nil;
   Objeto.DESC_MONEDA.Control := Nil;
   Objeto.CVE_TIP_INSCR_D.Control := Nil;
   Objeto.DESC_INSC_DEU.Control := Nil;
   Objeto.ID_CONTRATO.Control := Nil;
   Objeto.DESC_CONTRATO.Control := Nil;
   Objeto.FECHA.Control := Nil;
   Objeto.ID_TITULAR.Control := Nil;
   Objeto.NOM_TITULAR.Control := Nil;

   Objeto.Moneda.Cve_Moneda.Control := Nil;
   Objeto.Moneda.Desc_Moneda.Control := Nil;
   Objeto.InscDeuda.CVE_TIP_INSCR_D.Control := Nil;
   Objeto.InscDeuda.DESCRIPCION.Control := Nil;
   Objeto.Autorizacion.ID_CONTRATO.Control := Nil;
   Objeto.Autorizacion.Acreditado.Persona.Nombre.Control := Nil;
   Objeto.Titular.ID_ACREDITADO.Control := Nil;
   Objeto.Titular.Persona.Nombre.Control := Nil;

   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMCrInsDeu.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMCrInsDeu.btMonedaClick(Sender: TObject);
begin
   If Objeto.Moneda.Busca Then Begin
      chbMoneda.Checked := True;
      chbMoneda.Enabled := True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMCrInsDeu.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilCVE_MONEDA.Buffer]) Then Begin
      chbMoneda.Checked := True;
      chbMoneda.Enabled := True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMCrInsDeu.chbMonedaClick(Sender: TObject);
begin
   EnableCheckBox(chbMoneda);
   Objeto.Moneda.Active := chbMoneda.Checked;
end;

procedure TwMCrInsDeu.btTIP_INSCR_DEUClick(Sender: TObject);
begin
   If Objeto.InscDeuda.Busca Then Begin
      chbTIP_INSCR_DEU.Checked := True;
      chbTIP_INSCR_DEU.Enabled := True;
      InterForma1.NextTab(edTIP_INSCR_DEU);
   End;
end;

procedure TwMCrInsDeu.ilTIP_INSCR_DEUEjecuta(Sender: TObject);
begin
   If Objeto.InscDeuda.FindKey([ilTIP_INSCR_DEU.Buffer]) Then Begin
      chbTIP_INSCR_DEU.Checked := True;
      chbTIP_INSCR_DEU.Enabled := True;
      InterForma1.NextTab(edTIP_INSCR_DEU);
   End;
end;

procedure TwMCrInsDeu.chbTIP_INSCR_DEUClick(Sender: TObject);
begin
   EnableCheckBox(chbTIP_INSCR_DEU);
   Objeto.InscDeuda.Active := chbTIP_INSCR_DEU.Checked;
end;

Procedure TwMCrInsDeu.ImprimeReporte(bPreview:Boolean);
begin
   Objeto.CVE_MONEDA.GetFromControl;
   Objeto.CVE_TIP_INSCR_D.GetFromControl;
   Objeto.ID_CONTRATO.GetFromControl;
   Objeto.FECHA.GetFromControl;
   Objeto.ID_TITULAR.GetFromControl;

   RepCreInscDeud(objeto.CVE_MONEDA.AsString,      Objeto.CVE_TIP_INSCR_D.AsString,
                   Objeto.ID_TITULAR.AsString,     Objeto.ID_CONTRATO.AsString,
                   edF_PROG_INSC.Text,             edF_REAL_INSC.Text,
                   edDIAS_DIF.Text,                EdIdEmpresa.Text,
                   EdIDSucursal.Text  ,
                   Objeto.FECHA.AsDateTime,
                   Objeto.Apli,                    bPreview  );
End;

procedure TwMCrInsDeu.InterForma1BtnPreviewClick(Sender: TObject);
begin
   ImprimeReporte(True);
end;

procedure TwMCrInsDeu.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimeReporte(False);
end;

procedure TwMCrInsDeu.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMCrInsDeu.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMCrInsDeu.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMCrInsDeu.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([IlSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMCrInsDeu.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMCrInsDeu.btID_CONTRATOClick(Sender: TObject);
begin
   Objeto.Autorizacion.ShowAll := True;
   If Objeto.Autorizacion.Busca Then Begin
      chbID_CONTRATO.Checked := True;
      chbID_CONTRATO.Enabled := True;
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TwMCrInsDeu.ilID_CONTRATOEjecuta(Sender: TObject);
begin
   If Objeto.Autorizacion.FindKey([ilID_CONTRATO.Buffer])Then Begin
      chbID_CONTRATO.Checked := True;
      chbID_CONTRATO.Enabled := True;
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TwMCrInsDeu.btID_TITULARClick(Sender: TObject);
begin
   Objeto.Titular.ShowAll := True;
   If Objeto.Titular.Busca Then Begin
      chbID_TITULAR.Checked := True;
      chbID_TITULAR.Enabled := True;
      InterForma1.NextTab(edID_TITULAR);
   End;
end;

procedure TwMCrInsDeu.chbID_TITULARClick(Sender: TObject);
begin
   EnableCheckBox(chbID_TITULAR);
   Objeto.Titular.Active := chbID_TITULAR.Checked;
end;

procedure TwMCrInsDeu.ilID_TITULAREjecuta(Sender: TObject);
begin
   If Objeto.Titular.FindKey([ilID_TITULAR.Buffer])Then Begin
      chbID_TITULAR.Checked := True;
      chbID_TITULAR.Enabled := True;
      InterForma1.NextTab(edID_TITULAR);
   End;
end;

procedure TwMCrInsDeu.chbID_CONTRATOClick(Sender: TObject);
begin
   EnableCheckBox(chbID_CONTRATO);
   Objeto.Autorizacion.Active := chbID_CONTRATO.Checked;
end;

procedure TwMCrInsDeu.chbF_PROG_INSCClick(Sender: TObject);
begin
    EnableCheckBox(chbF_PROG_INSC);
    chbF_PROG_INSC.Enabled := chbF_PROG_INSC.Checked;

    If Not chbF_PROG_INSC.Enabled Then
        edF_PROG_INSC.Text := '';
end;

procedure TwMCrInsDeu.chbF_REAL_INSCClick(Sender: TObject);
begin
    EnableCheckBox(chbF_REAL_INSC);
    chbF_REAL_INSC.Enabled := chbF_REAL_INSC.Checked;

    If Not chbF_REAL_INSC.Enabled Then
        edF_REAL_INSC.Text := '';
end;

procedure TwMCrInsDeu.chbDIAS_DIFClick(Sender: TObject);
begin
    EnableCheckBox(chbDIAS_DIF);
    chbDIAS_DIF.Enabled := chbDIAS_DIF.Checked;

    If Not chbDIAS_DIF.Enabled Then
        edDIAS_DIF.Text := '';
end;

procedure TwMCrInsDeu.edF_PROG_INSCChange(Sender: TObject);
begin
    If edF_PROG_INSC.Text <> '' Then Begin
        chbF_PROG_INSC.Checked := True;
        chbF_PROG_INSC.Enabled := True;
    End Else Begin
        chbF_PROG_INSC.Checked := False;
        chbF_PROG_INSC.Enabled := False;
    End;
end;

procedure TwMCrInsDeu.edF_REAL_INSCChange(Sender: TObject);
begin
    If edF_REAL_INSC.Text <> '' Then Begin
        chbF_REAL_INSC.Checked := True;
        chbF_REAL_INSC.Enabled := True;
    End Else Begin
        chbF_REAL_INSC.Checked := False;
        chbF_REAL_INSC.Enabled := False;
    End;
end;

procedure TwMCrInsDeu.edDIAS_DIFChange(Sender: TObject);
begin
    If edDIAS_DIF.Text <> '' Then Begin
        chbDIAS_DIF.Checked := True;
        chbDIAS_DIF.Enabled := True;
    End Else Begin
        chbDIAS_DIF.Checked := False;
        chbDIAS_DIF.Enabled := False;
    End;
end;

procedure TwMCrInsDeu.VerificaFechaCtrls(pedFecha: TEdit; pdtpFecha: TInterDateTimePicker);
begin
     Try
        If Trim(pedFecha.Text) <> '' Then
            pdtpFecha.Date := StrToDate(pedFecha.Text);
     Except
        pedFecha.Text := FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
        pdtpFecha.Date := StrToDate(pedFecha.Text);
     End;
end;

procedure TwMCrInsDeu.edF_REAL_INSCExit(Sender: TObject);
begin
    VerificaFechaCtrls(edF_REAL_INSC, dtpFRealInsc);
end;

procedure TwMCrInsDeu.edF_PROG_INSCExit(Sender: TObject);
begin
    VerificaFechaCtrls(edF_PROG_INSC, dtpFProgInsc);
end;

procedure TwMCrInsDeu.edFECHAExit(Sender: TObject);
begin
    VerificaFechaCtrls(edFECHA, dtpFecha);
end;

end.
