// Sistema         :
// Fecha de Inicio :
// Función forma   :
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMRsgMdoAg;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntParamCre, UCrpe32,
Menus,
InterEdit,
IntMPers,
IntMon,           //Moneda
IntEmpre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntCrAcredit,     //Acreditado
IntCrCredito,     //Disposición
IntCrCto          //Autorización
;

Type
 TMRsgMdoAg = class;

  TwMRsgMdoAg = Class(TForm)
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
    Label3: TLabel;
    edID_TITULAR: TEdit;
    btID_TITULAR: TBitBtn;
    edNOM_TITULAR: TEdit;
    chbID_TITULAR: TCheckBox;
    ilID_TITULAR: TInterLinkit;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    edDESC_MONEDA: TEdit;
    btMoneda: TBitBtn;
    chbMoneda: TCheckBox;
    ilCVE_MONEDA: TInterLinkit;
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    edFECHA: TEdit;
    dtpF_INICIAL: TInterDateTimePicker;
    PopupMenu1: TPopupMenu;
    SaveQryToFile1: TMenuItem;
    Label4: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
    edID_CONTRATO: TEdit;
    btID_CONTRATO: TBitBtn;
    edNOMB_CONTRATO: TEdit;
    chbID_CONTRATO: TCheckBox;
    ilID_CONTRATO: TInterLinkit;
    Label2: TLabel;
    edID_CREDITO: TEdit;
    btID_CREDITO: TBitBtn;
    chbID_CREDITO: TCheckBox;
    ilID_CREDITO: TInterLinkit;
    edNOM_ACREDITADO: TEdit;
    rgCVE_SIT_CARTERA: TRadioGroup;
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
    procedure btMonedaClick(Sender: TObject);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure chbMonedaClick(Sender: TObject);
    procedure SaveQryToFile1Click(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure chbID_CONTRATOClick(Sender: TObject);
    procedure chbID_CREDITOClick(Sender: TObject);
    procedure ilCVE_MONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    private
      Procedure EnableCheckBox(var CheckBox : TCheckBox);
      Procedure ImprimeReporte(bPreview:Boolean);
      Procedure AsignaEmpresaSuc;

    { Private declarations }
    public
    { Public declarations }
    Objeto : TMRsgMdoAg;
end;
 TMRsgMdoAg= class(TInterFrame)
      private
      protected
      public
        { Public declarations }

        FECHA                    : TInterCampo;
        CVE_MONEDA               : TInterCampo;
        DESC_MONEDA              : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        DESC_CONTRATO            : TInterCampo;
        ID_TITULAR               : TInterCampo;
        NOM_TITULAR              : TInterCampo;
        CVE_SIT_CARTERA          : TInterCampo;

        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        Titular                  : TCrAcredit;
        Credito                  : TCrCredito;
        Autorizacion             : TCrCto;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation

Uses IntMQrRsgMdo;
{$R *.DFM}

constructor TMRsgMdoAg.Create( AOwner : TComponent );
begin Inherited;
      CVE_MONEDA := CreaCampo('CVE_MONEDA',ftString,tsNinguno,tsNinguno,False);
                CVE_MONEDA.Caption := 'Moneda';
                CVE_MONEDA.Parametro := 'CVE_MONEDA';
      DESC_MONEDA := CreaCampo('DESC_MONEDA',ftString,tsNinguno,tsNinguno,False);
                DESC_MONEDA.Caption := 'Descripción de Moneda';
                DESC_MONEDA.Parametro := 'DESC_MONEDA';
      FECHA := CreaCampo('FECHA',ftDate,tsNinguno,tsNinguno,False);
                FECHA.Caption := 'Fecha';
                FECHA.Parametro := 'FECHA';
      ID_TITULAR := CreaCampo('ID_TITULAR',ftInteger,tsNinguno,tsNinguno,False);
                ID_TITULAR.Caption := 'Titular';
                ID_TITULAR.Parametro := 'ID_TITULAR';
      NOM_TITULAR := CreaCampo('NOM_TITULAR',ftString,tsNinguno,tsNinguno,False);
                NOM_TITULAR.Caption:='Nombre Titular';
                NOM_TITULAR.Parametro:='NOM_TITULAR';
      CVE_SIT_CARTERA := CreaCampo('CVE_SIT_CARTERA',ftString,tsNinguno,tsNinguno,False);
                CVE_SIT_CARTERA.Caption:='Sit. Cartera';
                CVE_SIT_CARTERA.Parametro:='CVE_SIT_CARTERA';
      With CVE_SIT_CARTERA do
        Begin
        Size:=3;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add('VI'); // Cartera Vigente
        ComboLista.Add('1'); ComboDatos.Add('VE'); // Cartera Vencida
        ComboLista.Add('2'); ComboDatos.Add('AM'); // Ambas Carteras
        End;

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      Titular := TCrAcredit.Create(Self);
      Titular.MasterSource:=Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      
      Autorizacion := TCrCto.Create(Self);
      Autorizacion.MasterSource:=Self;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMRsgMdoAg.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMRsgMdoAg.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   if Empresa <> Nil then
      Empresa.free;
   if UnidadNegocio <> Nil then
      UnidadNegocio.Free;
   If Titular <> Nil Then
      Titular.Free;
   If Credito <> Nil Then
      Credito.Free;
   If Autorizacion <> Nil Then
      Autorizacion.Free;
   inherited;
end;

function TMRsgMdoAg.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMRsgMdoAg;
begin
   W := TwMRsgMdoAg.Create(Self);
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

(****************************************FORMA IntMRsgMdoAg********************)
(*                                                                            *)
(*  FORMA DE IntMRsgMdoAg                                                     *)
(*                                                                            *)
(****************************************FORMA IntMRsgMdoAg********************)
procedure TwMRsgMdoAg.AsignaEmpresaSuc;
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

Procedure TwMRsgMdoAg.EnableCheckBox(Var CheckBox : TCheckBox);
Begin
   If Not CheckBox.Checked Then Begin
      CheckBox.Checked:=False;
      CheckBox.Enabled:=False;
   End Else Begin
      CheckBox.Checked:=True;
      CheckBox.Enabled:=True;
   End;
End;

procedure TwMRsgMdoAg.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.FECHA.Control := edFECHA;
   Objeto.CVE_MONEDA.Control := edCVE_MONEDA;
   Objeto.DESC_MONEDA.Control := edDESC_MONEDA;
   Objeto.ID_TITULAR.Control := edID_TITULAR;
   Objeto.NOM_TITULAR.Control := edNOM_TITULAR;

   Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
   Objeto.Titular.ID_ACREDITADO.Control := edID_TITULAR;
   Objeto.Titular.Persona.Nombre.Control := edNOM_TITULAR;

   Objeto.Empresa.ID_EMPRESA.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);
   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);

   Objeto.Autorizacion.ID_CONTRATO.Control := edID_CONTRATO;
   Objeto.Autorizacion.Contrato.TITNombre.Control := edNOMB_CONTRATO;

   Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edNOM_ACREDITADO;

   Objeto.CVE_SIT_CARTERA.Control    := rgCVE_SIT_CARTERA;
   Objeto.CVE_SIT_CARTERA.AsString := 'AM';

   AsignaEmpresaSuc;
   Objeto.FECHA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
end;

procedure TwMRsgMdoAg.FormDestroy(Sender: TObject);
begin
   Objeto.FECHA.Control := Nil;
   Objeto.CVE_MONEDA.Control := Nil;
   Objeto.DESC_MONEDA.Control := Nil;
   Objeto.ID_TITULAR.Control := Nil;
   Objeto.NOM_TITULAR.Control := Nil;

   Objeto.Moneda.Cve_Moneda.Control := Nil;
   Objeto.Moneda.Desc_Moneda.Control := Nil;
   Objeto.Titular.ID_ACREDITADO.Control := Nil;
   Objeto.Titular.Persona.Nombre.Control := Nil;

   Objeto.Empresa.ID_EMPRESA.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;

   Objeto.Autorizacion.ID_CONTRATO.Control := Nil;
   Objeto.Autorizacion.Contrato.TITNombre.Control := Nil;

   Objeto.Credito.ID_CREDITO.Control := Nil;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := Nil;

   Objeto.CVE_SIT_CARTERA.Control    := Nil;
end;

procedure TwMRsgMdoAg.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

Procedure TwMRsgMdoAg.ImprimeReporte(bPreview:Boolean);
Var sSQL: String; 
begin
 With Objeto Do
  Begin
  GetFromControl;
  RiesgoMdoAgro( Empresa.ID_EMPRESA.AsInteger, CVE_MONEDA.AsInteger, ID_TITULAR.AsInteger,
                 Credito.ID_CREDITO.AsInteger, Autorizacion.ID_CONTRATO.AsInteger,
                 FECHA.AsDateTime,
                 CVE_SIT_CARTERA.AsString,
                 edNbrArch.Text, Apli, bPreview, SaveQryToFile1.Checked);
  End;
End;

procedure TwMRsgMdoAg.InterForma1BtnPreviewClick(Sender: TObject);
begin
   ImprimeReporte(True);
end;

procedure TwMRsgMdoAg.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimeReporte(False);
end;

procedure TwMRsgMdoAg.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMRsgMdoAg.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMRsgMdoAg.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMRsgMdoAg.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([IlSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMRsgMdoAg.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMRsgMdoAg.btID_TITULARClick(Sender: TObject);
begin
   Objeto.Titular.ShowAll := True;
   If Objeto.Titular.Busca Then Begin
      chbID_TITULAR.Checked := True;
      chbID_TITULAR.Enabled := True;
      InterForma1.NextTab(edID_TITULAR);
   End;
end;

procedure TwMRsgMdoAg.chbID_TITULARClick(Sender: TObject);
begin
   EnableCheckBox(chbID_TITULAR);
   Objeto.Titular.Active := chbID_TITULAR.Checked;
end;

procedure TwMRsgMdoAg.ilID_TITULAREjecuta(Sender: TObject);
begin
   If Objeto.Titular.FindKey([ilID_TITULAR.Buffer])Then Begin
      chbID_TITULAR.Checked := True;
      chbID_TITULAR.Enabled := True;
      InterForma1.NextTab(edID_TITULAR);
   End;
end;

procedure TwMRsgMdoAg.btMonedaClick(Sender: TObject);
begin
   If Objeto.Moneda.Busca Then Begin
      chbMoneda.Checked := True;
      chbMoneda.Enabled := True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMRsgMdoAg.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilCVE_MONEDA.Buffer]) Then Begin
      chbMoneda.Checked := True;
      chbMoneda.Enabled := True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMRsgMdoAg.chbMonedaClick(Sender: TObject);
begin
   EnableCheckBox(chbMoneda);
   Objeto.Moneda.Active := chbMoneda.Checked;
end;

procedure TwMRsgMdoAg.SaveQryToFile1Click(Sender: TObject);
begin
   SaveQryToFile1.Checked := Not SaveQryToFile1.Checked;
end;

procedure TwMRsgMdoAg.sbExcelClick(Sender: TObject);
var sExt:String;
begin
  If SaveDialog1.Execute Then Begin
      sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
      If  UpperCase(sExt)= '.XLS' Then
         edNbrArch.Text := SaveDialog1.FileName
      Else
         edNbrArch.Text := SaveDialog1.FileName + '.XLS';
  End Else
    edNbrArch.Text := '';
end;

procedure TwMRsgMdoAg.btID_CONTRATOClick(Sender: TObject);
begin
   Objeto.Autorizacion.ShowAll := True;
   If Objeto.Autorizacion.Busca Then Begin
      chbID_CONTRATO.Checked := True;
      chbID_CONTRATO.Enabled := True;
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TwMRsgMdoAg.btID_CREDITOClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   If Objeto.Credito.Busca Then Begin
      chbID_CREDITO.Checked := True;
      chbID_CREDITO.Enabled := True;
      InterForma1.NextTab(edID_CREDITO);
   End;
end;

procedure TwMRsgMdoAg.chbID_CONTRATOClick(Sender: TObject);
begin
   EnableCheckBox(chbID_CONTRATO);
   Objeto.Autorizacion.Active := chbID_CONTRATO.Checked;
end;

procedure TwMRsgMdoAg.chbID_CREDITOClick(Sender: TObject);
begin
   EnableCheckBox(chbID_CREDITO);
   Objeto.Credito.Active := chbID_CREDITO.Checked;
end;

procedure TwMRsgMdoAg.ilCVE_MONEDACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMRsgMdoAg.ilID_CONTRATOEjecuta(Sender: TObject);
begin
   If Objeto.Autorizacion.FindKey([ilID_CONTRATO.Buffer, 1])Then Begin
      chbID_CONTRATO.Checked := True;
      chbID_CONTRATO.Enabled := True;
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TwMRsgMdoAg.ilID_CREDITOEjecuta(Sender: TObject);
begin
   If Objeto.Credito.FindKey([ilID_CREDITO.Buffer])Then Begin
      chbID_CREDITO.Checked := True;
      chbID_CREDITO.Enabled := True;
      InterForma1.NextTab(edID_CREDITO);
   End;
end;

end.
