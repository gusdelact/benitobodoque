// Sistema         :
// Fecha de Inicio :
// Función forma   :
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMCapGobMp;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntParamCre, UCrpe32,
InterEdit,
IntMPers,
IntMon,           //Moneda
IntEmpre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntCrAcredit,
IntEmple,
Menus
;

Type
 TMCapGobMp = class;

  TwMCapGobMp = Class(TForm)
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
    rgB_REG_DEUDA: TRadioGroup;
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    edFECHA: TEdit;
    dtpF_INICIAL: TInterDateTimePicker;
    Label4: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
    cbGraba_Query: TCheckBox;
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
    procedure rgB_REG_DEUDAClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    private
      Procedure EnableCheckBox(var CheckBox : TCheckBox);
      Procedure ImprimeReporte(bPreview:Boolean);
      Procedure AsignaEmpresaSuc;

    { Private declarations }
    public
    { Public declarations }
    Objeto : TMCapGobMp;
end;
 TMCapGobMp= class(TInterFrame)
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
        B_REG_DEUDA              : TInterCampo;

        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        Titular                  : TCrAcredit;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation

Uses IntMQrCapGob;
{$R *.DFM}

constructor TMCapGobMp.Create( AOwner : TComponent );
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
      B_REG_DEUDA := CreaCampo('B_REG_DEUDA',ftInteger,tsNinguno,tsNinguno,False);
         With B_REG_DEUDA Do Begin
            Size := 1;
            UseCombo := True;
            ComboLista.Add('0');    ComboDatos.Add('V');
            ComboLista.Add('1');    ComboDatos.Add('F');
            ComboLista.Add('2');    ComboDatos.Add('0');
         End;
                B_REG_DEUDA.Caption:='Inscripción de Deuda en la SHCP';
                B_REG_DEUDA.Parametro := 'B_REG_DUEDA';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      Titular := TCrAcredit.Create(Self);
      Titular.MasterSource:=Self;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMCapGobMp.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMCapGobMp.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   if Empresa <> Nil then
      Empresa.free;
   if UnidadNegocio <> Nil then
      UnidadNegocio.Free;
   If Titular <> Nil Then
      Titular.Free;
   inherited;
end;

function TMCapGobMp.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMCapGobMp;
begin
   W := TwMCapGobMp.Create(Self);
   try
      W.Objeto := Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      // Muestra el control (únicamente el Perfil administrador) para grabar el QUERY 
      W.cbGraba_Query.Visible := Apli.CvePerfil = 101;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

(****************************************FORMA IntMCapGobMp********************)
(*                                                                            *)
(*  FORMA DE IntMCapGobMp                                                     *)
(*                                                                            *)
(****************************************FORMA IntMCapGobMp********************)
procedure TwMCapGobMp.AsignaEmpresaSuc;
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

Procedure TwMCapGobMp.EnableCheckBox(Var CheckBox : TCheckBox);
Begin
   If Not CheckBox.Checked Then Begin
      CheckBox.Checked:=False;
      CheckBox.Enabled:=False;
   End Else Begin
      CheckBox.Checked:=True;
      CheckBox.Enabled:=True;
   End;
End;

procedure TwMCapGobMp.FormShow(Sender: TObject);
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
   Objeto.B_REG_DEUDA.Control := rgB_REG_DEUDA;

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
   AsignaEmpresaSuc;
   Objeto.FECHA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.B_REG_DEUDA.AsString := '0'
end;

procedure TwMCapGobMp.FormDestroy(Sender: TObject);
begin
   Objeto.FECHA.Control := Nil;
   Objeto.CVE_MONEDA.Control := Nil;
   Objeto.DESC_MONEDA.Control := Nil;
   Objeto.ID_TITULAR.Control := Nil;
   Objeto.NOM_TITULAR.Control := Nil;
   Objeto.B_REG_DEUDA.Control := Nil;

   Objeto.Moneda.Cve_Moneda.Control := Nil;
   Objeto.Moneda.Desc_Moneda.Control := Nil;
   Objeto.Titular.ID_ACREDITADO.Control := Nil;
   Objeto.Titular.Persona.Nombre.Control := Nil;

   Objeto.Empresa.ID_EMPRESA.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMCapGobMp.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

Procedure TwMCapGobMp.ImprimeReporte(bPreview:Boolean);
Var sSQL: String; nReporte: Integer;
    vlSERVER_NAME : String;
begin
 With Objeto Do
  Begin
  GetFromControl;
  Objeto.B_REG_DEUDA.GetFromControl;
  RepCapGob( Empresa.ID_EMPRESA.AsInteger, CVE_MONEDA.AsInteger, ID_TITULAR.AsInteger,
             FECHA.AsDateTime, B_REG_DEUDA.AsString, edNbrArch.Text,
             Apli, bPreview, cbGraba_Query.Checked);
  End;
End;

procedure TwMCapGobMp.InterForma1BtnPreviewClick(Sender: TObject);
begin
   ImprimeReporte(True);
end;

procedure TwMCapGobMp.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimeReporte(False);
end;

procedure TwMCapGobMp.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMCapGobMp.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMCapGobMp.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMCapGobMp.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([IlSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMCapGobMp.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMCapGobMp.btID_TITULARClick(Sender: TObject);
begin
   Objeto.Titular.ShowAll := True;
   If Objeto.Titular.Busca Then Begin
      chbID_TITULAR.Checked := True;
      chbID_TITULAR.Enabled := True;
      InterForma1.NextTab(edID_TITULAR);
   End;
end;

procedure TwMCapGobMp.chbID_TITULARClick(Sender: TObject);
begin
   EnableCheckBox(chbID_TITULAR);
   Objeto.Titular.Active := chbID_TITULAR.Checked;
end;

procedure TwMCapGobMp.ilID_TITULAREjecuta(Sender: TObject);
begin
   If Objeto.Titular.FindKey([ilID_TITULAR.Buffer])Then Begin
      chbID_TITULAR.Checked := True;
      chbID_TITULAR.Enabled := True;
      InterForma1.NextTab(edID_TITULAR);
   End;
end;

procedure TwMCapGobMp.btMonedaClick(Sender: TObject);
begin
   If Objeto.Moneda.Busca Then Begin
      chbMoneda.Checked := True;
      chbMoneda.Enabled := True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMCapGobMp.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilCVE_MONEDA.Buffer]) Then Begin
      chbMoneda.Checked := True;
      chbMoneda.Enabled := True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMCapGobMp.chbMonedaClick(Sender: TObject);
begin
   EnableCheckBox(chbMoneda);
   Objeto.Moneda.Active := chbMoneda.Checked;
end;

procedure TwMCapGobMp.rgB_REG_DEUDAClick(Sender: TObject);
begin
   Objeto.B_REG_DEUDA.GetFromControl;
end;

procedure TwMCapGobMp.sbExcelClick(Sender: TObject);
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

end.
