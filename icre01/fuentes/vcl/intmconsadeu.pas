// Sistema         :
// Fecha de Inicio :
// Función forma   :
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMConsAdeu;                                  

interface
uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,InterEdit,

IntParamCre,      //Parámetros Crédito
IntMon,           //Moneda
IntCrGrupEco,     //Grupo Económico
IntPers,          //PERSONA
IntCtto,          //Autorización
//IntCrProduct,     //Producto de crédito
//IntMProdGpo,      //Grupo de Producto de Crédito
Intempre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntCrTCredit,     //TIPO CUENTA BURO CREDITO
//IntMQrConsAdeudo, //REPORTE ORIGINAL
IntQrConsAdeudo;  //REPORTE MODIFICADO

Type
 TMConsAdeu= class;

  TwMConsAdeu=Class(TForm)
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
    edID_ACREDITADO: TEdit;
    btID_ACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    cbAcreditado: TCheckBox;
    Label5: TLabel;
    edDESC_ID_CREDITO: TEdit;
    cbID_CREDITO: TCheckBox;
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
    cbPRODUCTO_CRE: TCheckBox;
    Label6: TLabel;
    btCVE_PRODUCTO_CRE: TBitBtn;
    edDESC_PRODUCTO_CRE: TEdit;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btCVE_MONEDA: TBitBtn;
    ilMONEDA: TInterLinkit;
    edDESC_MONEDA: TEdit;
    cbMoneda: TCheckBox;
    lbID_PROMOTOR: TLabel;
    edCVE_GRUPO_ECO: TEdit;
    btCVE_GRUPO_ECO: TBitBtn;
    edDESC_AGRUPO_ECO: TEdit;
    ilCVE_GRUPO_ECO: TInterLinkit;
    cbCVE_GRUPO_ECO: TCheckBox;
    edFECHA: TEdit;
    dtpFecha: TInterDateTimePicker;
    Label9: TLabel;
    Label3: TLabel;
    edID_CONTRATO: TEdit;
    btID_CONTRATO: TBitBtn;
    edDESC_AUTORIZACION: TEdit;
    cbID_CONTRATO: TCheckBox;
    ilID_CONTRATO: TInterLinkit;
    Label1: TLabel;
    btCTA_ORIGEN: TBitBtn;
    cbCTA_ORIGEN: TCheckBox;
    Label4: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
    Bevel1: TBevel;
    Label10: TLabel;
    btGpoProd: TBitBtn;
    edNomGpoProd: TEdit;
    chbxGpoProd: TCheckBox;
    ilGpoProd: TInterLinkit;
    btID_CREDITO: TBitBtn;
    edID_CREDITO: TEdit;
    edCVE_PRODUCTO_CRE: TEdit;
    edGpoProd: TEdit;
    edCTA_ORIGEN: TEdit;
    rgTIP_RECUPERA: TRadioGroup;
    Label32: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure btID_ACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure cbAcreditadoClick(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure cbID_CREDITOClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure btCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure cbPRODUCTO_CREClick(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure cbMonedaClick(Sender: TObject);
    procedure btCVE_GRUPO_ECOClick(Sender: TObject);
    procedure ilCVE_GRUPO_ECOEjecuta(Sender: TObject);
    procedure cbCVE_GRUPO_ECOClick(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure cbID_CONTRATOClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure btGpoProdClick(Sender: TObject);
    procedure chbxGpoProdClick(Sender: TObject);
    procedure btCTA_ORIGENClick(Sender: TObject);
    procedure cbCTA_ORIGENClick(Sender: TObject);
    private
    { Private declarations }
     procedure EnableCheckBox(var CheckBox : TCheckBox);
     procedure ImprimeReporte(bPreview : Boolean);
     Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMConsAdeu;
    end;

 TMConsAdeu= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }

        CVE_MONEDA              : TInterCampo;
        CVE_GRUPO_ECO           : TInterCampo;
        ID_ACREDITADO           : TInterCampo;
        ID_CONTRATO             : TInterCampo;
        CVE_PRODUCTO_CRE        : TInterCampo;
        DESC_PRODUCTO           : TInterCampo;
        CVE_PRODUCTO_GPO        : TInterCampo;
        DESC_PRODUCTO_GPO       : TInterCampo;
        ID_CREDITO              : TInterCampo;
        CTA_ORIGEN              : TInterCampo;
        FECHA                   : TInterCampo;
        ID_EMPRESA              : TInterCampo;
        ACREDITADO              : TInterCampo;
        CVE_CUENTA_CONT         : TInterCampo;

        Moneda                  : TMoneda;
        CrGrupEco               : TCrGrupEco;
        Persona                 : TPersona;
        Cto                     : TContrato;

        ParamCre                : TParamCre;
        Empresa                 : TEmpresa;
        UnidadNegocio           : TUnNegocio;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMConsAdeu.Create( AOwner : TComponent );
begin Inherited;

   CVE_MONEDA       :=CreaCampo('CVE_MONEDA',ftInteger,tsNinguno,tsNinguno,False);
   CVE_GRUPO_ECO    :=CreaCampo('CVE_GRUPO_ECO',ftString,tsNinguno,tsNinguno,False);
   ID_ACREDITADO    :=CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);
   ID_CONTRATO      :=CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,False);
   CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,False);
   DESC_PRODUCTO    :=CreaCampo('DESC_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
   CVE_PRODUCTO_GPO :=CreaCampo('CVE_PRODUCTO_GPO',ftString,tsNinguno,tsNinguno,False);
   DESC_PRODUCTO_GPO:=CreaCampo('DESC_PRODUCTO_GPO',ftString,tsNinguno,tsNinguno,False);
   ID_CREDITO       :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
   CTA_ORIGEN       :=CreaCampo('CTA_ORIGEN',ftString,tsNinguno,tsNinguno,False);
   FECHA            :=CreaCampo('FECHA',ftDate,tsNinguno,tsNinguno,False);
   ID_EMPRESA       :=CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,False);
   ACREDITADO       :=CreaCampo('ACREDITADO',ftString,tsNinguno,tsNinguno,False);
   CVE_CUENTA_CONT  :=CreaCampo('CVE_CUENTA_CONT',ftString,tsNinguno,tsNinguno,False);

   Moneda := TMoneda.Create(Self);
   Moneda.MasterSource:=Self;

   CrGrupEco:= TCrGrupEco.Create(Self);
   CrGrupEco.MasterSource:=Self;

   Persona := TPersona.Create(Self);
   Persona.MasterSource := Self;

   Cto := TContrato.Create(Self);
   Cto.MasterSource := Self;
//   Cto.BuscaWhereString := 'CONTRATO.CVE_TIP_CONTRATO = ''CRED''';

   Empresa := TEmpresa.Create(Self);
   Empresa.MasterSource:=Self;

   UnidadNegocio := TUnNegocio.Create(Self);
   UnidadNegocio.MasterSource:=Self;

   StpName  := ' ';
   UseQuery := False;
   HelpFile := '';
   ShowMenuReporte:=True;
end;

Destructor TMConsAdeu.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   // end if

   If CrGrupEco <> Nil Then
      CrGrupEco.Free;
   // end if

   If Persona <> Nil Then
      Persona.Free;
   // end if

   If Cto <> Nil Then
      Cto.Free;
   // end if


   If Empresa <> Nil Then
      Empresa.Free;
   // end if

   If UnidadNegocio <> Nil Then
      UnidadNegocio.Free;
   // end if

   inherited;
end;


function TMConsAdeu.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMConsAdeu;
begin
   W:=TwMConsAdeu.Create(Self);
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
procedure TwMConsAdeu.AsignaEmpresaSuc;
begin
   Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);
   If  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) Then
      CBSucursal.Checked:= True;
   EdIdEmpresa.Enabled  := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   bbEmpresa.Enabled    := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   BBSucursal.Enabled   := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   CBSucursal.Enabled   := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
end;

procedure TwMConsAdeu.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := Objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := Objeto.ParamCre.PERFIL.AsString;

   Objeto.CVE_MONEDA.Control       :=edCVE_MONEDA;
   Objeto.CVE_GRUPO_ECO.Control    :=edCVE_GRUPO_ECO;
   Objeto.ID_ACREDITADO.Control    :=edID_ACREDITADO;
   Objeto.ID_CONTRATO.Control      :=edID_CONTRATO;
   Objeto.CVE_PRODUCTO_CRE.Control :=edCVE_PRODUCTO_CRE;
   Objeto.DESC_PRODUCTO.Control    :=edDESC_PRODUCTO_CRE;
   Objeto.CVE_PRODUCTO_GPO.Control :=edGpoProd;
   Objeto.DESC_PRODUCTO_GPO.Control:=edNomGpoProd;
   Objeto.CTA_ORIGEN.Control       :=edCTA_ORIGEN;
   Objeto.FECHA.Control            :=edFECHA;
   Objeto.ID_EMPRESA.Control       :=EdIdEmpresa;
   Objeto.ID_CREDITO.Control       := edID_CREDITO;
   Objeto.ACREDITADO.Control       := edDESC_ID_CREDITO;
   Objeto.CVE_CUENTA_CONT.Control  := edCTA_ORIGEN;

   Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;

   Objeto.CrGrupEco.CVE_GRUPO_ECO.Control := edCVE_GRUPO_ECO;
   Objeto.CrGrupEco.DESC_AGRUPO_ECO.Control := edDESC_AGRUPO_ECO;

   Objeto.Persona.Id_Persona.Control := edID_ACREDITADO;
   Objeto.Persona.Nombre.Control := edNOMBRE_ACRED;

   Objeto.Cto.ID_CONTRATO.Control := edID_CONTRATO;
   Objeto.Cto.TITNOMBRE.Control := edDESC_AUTORIZACION;

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
//   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
//   Objeto.UnidadNegocio.GetParams(Objeto);

   AsignaEmpresaSuc;
   dtpFecha.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   edFECHA.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));
end;

procedure TwMConsAdeu.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_MONEDA.Control       :=Nil;
   Objeto.CVE_GRUPO_ECO.Control    :=Nil;
   Objeto.ID_ACREDITADO.Control    :=Nil;
   Objeto.ID_CONTRATO.Control      :=Nil;
   Objeto.CVE_PRODUCTO_CRE.Control :=Nil;
   Objeto.DESC_PRODUCTO.Control :=Nil;
   Objeto.CVE_PRODUCTO_GPO.Control :=Nil;
   Objeto.DESC_PRODUCTO_GPO.Control:=Nil;
   Objeto.CTA_ORIGEN.Control       :=Nil;
   Objeto.FECHA.Control            :=Nil;
   Objeto.ID_EMPRESA.Control       :=Nil;
   Objeto.ID_CREDITO.Control       :=Nil;
   Objeto.ACREDITADO.Control       :=Nil;
   Objeto.CVE_CUENTA_CONT.Control  :=Nil;

   Objeto.Moneda.Cve_Moneda.Control :=Nil;
   Objeto.Moneda.Desc_Moneda.Control :=Nil;

   Objeto.CrGrupEco.CVE_GRUPO_ECO.Control :=Nil;
   Objeto.CrGrupEco.DESC_AGRUPO_ECO.Control :=Nil;

   Objeto.Persona.Id_Persona.Control :=Nil;
   Objeto.Persona.Nombre.Control :=Nil;

   Objeto.Cto.ID_CONTRATO.Control :=Nil;
   Objeto.Cto.TITNOMBRE.Control :=Nil;

   Objeto.Empresa.ID_Empresa.Control :=Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control :=Nil;

   Objeto.UnidadNegocio.Id_Entidad.Control :=Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control :=Nil;

end;

procedure TwMConsAdeu.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMConsAdeu.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TwMConsAdeu.ImprimeReporte(bPreview : Boolean);
var

    sTipRecu:String;
    iTipRecu:Integer;
begin

   iTipRecu := rgTIP_RECUPERA.ItemIndex;
   case iTipRecu of
        0: sTipRecu := '0';
        1: sTipRecu := '1';
        2: sTipRecu := '2';
   end;

    objeto.CVE_MONEDA.GetFromControl;
    Objeto.CVE_GRUPO_ECO.GetFromControl;
    Objeto.ID_ACREDITADO.GetFromControl;
    Objeto.ID_CONTRATO.GetFromControl;
    Objeto.CVE_PRODUCTO_CRE.GetFromControl;
    Objeto.CTA_ORIGEN.GetFromControl;
    Objeto.ID_EMPRESA.GetFromControl;
    Objeto.FECHA.GetFromControl;
    Objeto.ID_CREDITO.GetFromControl;

    RepConsolidAdeudo(objeto.CVE_MONEDA.AsString,     Objeto.CVE_GRUPO_ECO.AsString,    Objeto.ID_ACREDITADO.AsString,
                      Objeto.ID_CONTRATO.AsString,    Objeto.CVE_PRODUCTO_CRE.AsString, Objeto.ID_CREDITO.AsString,
                      Objeto.CTA_ORIGEN.AsString,     Objeto.ID_EMPRESA.AsString,        edGpoProd.Text,
                      edNbrArch.Text, sTipRecu,  Objeto.FECHA.AsDateTime,        Objeto.Apli,
                      bPreview);
    If Trim(edNbrArch.Text)<>'' Then Begin
       If bGenArch Then
         ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
       Else
         ShowMessage('No se generó el Archivo')
    End;
End;

procedure TwMConsAdeu.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCONSADEU_IMPRI',True,True) then
   begin
      ImprimeReporte(False);
   end;
end;

procedure TwMConsAdeu.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCONSADEU_PREVI',True,True) then
   begin
      ImprimeReporte(True);
   end;   
end;

procedure TwMConsAdeu.btID_ACREDITADOClick(Sender: TObject);
begin
   Objeto.Persona.ShowAll := True;
   If Objeto.Persona.Busca Then Begin
      cbAcreditado.Checked:= True;
      cbAcreditado.Enabled:= True;
   End;
end;

procedure TwMConsAdeu.ilACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Persona.FindKey([ilACREDITADO.Buffer]) Then Begin
      cbAcreditado.Checked:=True;
      cbAcreditado.Enabled:=True;
   End;
end;

procedure TwMConsAdeu.cbAcreditadoClick(Sender: TObject);
begin
   EnableCheckBox(cbAcreditado);
   Objeto.Persona.Active := cbAcreditado.Checked;
end;

procedure TwMConsAdeu.btID_CREDITOClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('ICRDIMCR.IT','I');
      Try
        If T.Execute Then
           Begin
             ID_CREDITO.AsString := T.DameCampo(0);
             ACREDITADO.AsString := T.DameCampo(1);
             cbID_CREDITO.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TwMConsAdeu.cbID_CREDITOClick(Sender: TObject);
begin
   EnableCheckBox(cbID_CREDITO);
   edID_CREDITO.Enabled := cbID_CREDITO.Checked;

   IF NOT (edID_CREDITO.Enabled ) then Begin
      edID_CREDITO.Text := '';
      edDESC_ID_CREDITO.Text := '';
   End;


end;

procedure TwMConsAdeu.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMConsAdeu.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMConsAdeu.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMConsAdeu.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMConsAdeu.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMConsAdeu.btCVE_PRODUCTO_CREClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('IPRODCR.IT','I');
      Try
        If T.Execute Then
           Begin
             CVE_PRODUCTO_CRE.AsString := T.DameCampo(0);
             DESC_PRODUCTO.AsString := T.DameCampo(1);
             cbPRODUCTO_CRE.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TwMConsAdeu.cbPRODUCTO_CREClick(Sender: TObject);
begin
   EnableCheckBox(cbPRODUCTO_CRE);
   edCVE_PRODUCTO_CRE.Enabled := cbPRODUCTO_CRE.Checked;

   IF NOT (edCVE_PRODUCTO_CRE.Enabled ) then Begin
      edCVE_PRODUCTO_CRE.Text := '';
      edDESC_PRODUCTO_CRE.Text := '';
   End;
end;

procedure TwMConsAdeu.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
      cbMoneda.Checked:= True;
      cbMoneda.Enabled:= True;
   End;
end;

procedure TwMConsAdeu.ilMONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
      cbMoneda.Checked:=True;
      cbMoneda.Enabled:=True;
   End;
end;

procedure TwMConsAdeu.cbMonedaClick(Sender: TObject);
begin
   EnableCheckBox(cbMoneda);
   Objeto.Moneda.Active := cbMoneda.Checked;
end;

procedure TwMConsAdeu.btCVE_GRUPO_ECOClick(Sender: TObject);
begin
   Objeto.CrGrupEco.ShowAll := True;
   if Objeto.CrGrupEco.Busca then Begin
      cbCVE_GRUPO_ECO.Checked:= True;
      cbCVE_GRUPO_ECO.Enabled:= True;
   End;
end;

procedure TwMConsAdeu.ilCVE_GRUPO_ECOEjecuta(Sender: TObject);
begin
   If Objeto.CrGrupEco.FindKey([ilCVE_GRUPO_ECO.Buffer]) Then Begin
      cbCVE_GRUPO_ECO.Checked:=True;
      cbCVE_GRUPO_ECO.Enabled:=True;
   End;
end;

procedure TwMConsAdeu.cbCVE_GRUPO_ECOClick(Sender: TObject);
begin
   EnableCheckBox(cbCVE_GRUPO_ECO);
   Objeto.CrGrupEco.Active := cbCVE_GRUPO_ECO.Checked;
end;

procedure TwMConsAdeu.btID_CONTRATOClick(Sender: TObject);
begin
   Objeto.Cto.ShowAll := True;
   If Objeto.Cto.Busca Then Begin
      cbID_CONTRATO.Checked := True;
      cbID_CONTRATO.Enabled := True;
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TwMConsAdeu.ilID_CONTRATOEjecuta(Sender: TObject);
begin
   If Objeto.Cto.FindKey([ilID_CONTRATO.Buffer])Then Begin
      cbID_CONTRATO.Checked := True;
      cbID_CONTRATO.Enabled := True;
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TwMConsAdeu.cbID_CONTRATOClick(Sender: TObject);
begin
   EnableCheckBox(cbID_CONTRATO);
   Objeto.Cto.Active := cbID_CONTRATO.Checked;
end;

procedure TwMConsAdeu.sbExcelClick(Sender: TObject);
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

procedure TwMConsAdeu.cbxArchivoClick(Sender: TObject);
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

procedure TwMConsAdeu.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TwMConsAdeu.btGpoProdClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('IPRODGPO.IT','I');
      Try
        If T.Execute Then
           Begin
             CVE_PRODUCTO_GPO.AsString := T.DameCampo(0);
             DESC_PRODUCTO_GPO.AsString := T.DameCampo(1);
             chbxGpoProd.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TwMConsAdeu.chbxGpoProdClick(Sender: TObject);
begin
   EnableCheckBox(chbxGpoProd);
   edGpoProd.Enabled := chbxGpoProd.Checked;

   IF NOT (edGpoProd.Enabled ) then Begin
      edGpoProd.Text := '';
      edNomGpoProd.Text := '';
   End;
end;

procedure TwMConsAdeu.btCTA_ORIGENClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('ICRCTASCONT.IT','I');
      Try
        If T.Execute Then
           Begin
             CVE_CUENTA_CONT.AsString := T.DameCampo(2);
             cbCTA_ORIGEN.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TwMConsAdeu.cbCTA_ORIGENClick(Sender: TObject);
begin
    If Not cbCTA_ORIGEN.Checked Then Begin
        cbCTA_ORIGEN.Checked:=False;
        cbCTA_ORIGEN.Enabled:=False;
    End Else Begin
        cbCTA_ORIGEN.Checked:=True;
        cbCTA_ORIGEN.Enabled:=True;
    End;
end;

end.
