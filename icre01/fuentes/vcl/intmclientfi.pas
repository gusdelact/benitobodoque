// Sistema         :
// Fecha de Inicio :
// Función forma   :
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMCliEntFi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntParamCre,
InterEdit,
IntMPers,
IntEmpre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntCrCredito,     //Disposición
IntEmple, 
IntCrAcredit,
IntCrCto,
IntCrInsDeu,
IntCrPctCapi,
IntMQrCliEntFi
;

Type
 TMCliEntFi = class;

  TwMCliEntFi = Class(TForm)
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
    Label4: TLabel;
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
    Label2: TLabel;
    Label5: TLabel;
    edID_PROM_ADM: TEdit;
    btID_PROM_ADM: TBitBtn;
    edNOM_PROM_ADM: TEdit;
    chbID_PROM_ADM: TCheckBox;
    edID_PROM_ASOC: TEdit;
    btID_PROM_ASOC: TBitBtn;
    edNOM_PROM_ASOC: TEdit;
    chbID_PROM_ASOC: TCheckBox;
    ilID_PROM_ADM: TInterLinkit;
    ilID_PROM_ASOC: TInterLinkit;
    Label6: TLabel;
    edDisposicion: TEdit;
    btDisposicion: TBitBtn;
    edNomDisposicion: TEdit;
    cbxDisposicion: TCheckBox;
    ilDisposicion: TInterLinkit;
    chbPCT_CAPITALIZA: TCheckBox;
    Label23: TLabel;
    edCVE_GPO_CAPITALIZ: TEdit;
    btCVE_GPO_CAPITALIZ: TBitBtn;
    Label9: TLabel;
    edPCT_CAPITALIZA: TEdit;
    edDESC_CAPITALIZA: TEdit;
    ilCVE_GPO_CAPITALIZ: TInterLinkit;
    rgB_INSC_DUEDA: TRadioGroup;
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
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure btID_TITULARClick(Sender: TObject);
    procedure chbID_TITULARClick(Sender: TObject);
    procedure ilID_TITULAREjecuta(Sender: TObject);
    procedure chbID_CONTRATOClick(Sender: TObject);
    procedure edFECHAExit(Sender: TObject);
    procedure btID_PROM_ADMClick(Sender: TObject);
    procedure ilID_PROM_ADMEjecuta(Sender: TObject);
    procedure chbID_PROM_ADMClick(Sender: TObject);
    procedure btID_PROM_ASOCClick(Sender: TObject);
    procedure ilID_PROM_ASOCEjecuta(Sender: TObject);
    procedure chbID_PROM_ASOCClick(Sender: TObject);
    procedure btDisposicionClick(Sender: TObject);
    procedure ilDisposicionEjecuta(Sender: TObject);
    procedure cbxDisposicionClick(Sender: TObject);
    procedure btCVE_GPO_CAPITALIZClick(Sender: TObject);
    procedure ilCVE_GPO_CAPITALIZEjecuta(Sender: TObject);
    procedure rgB_INSC_DUEDAClick(Sender: TObject);
    procedure chbPCT_CAPITALIZAClick(Sender: TObject);
    private
      Procedure EnableCheckBox(var CheckBox : TCheckBox);
      Procedure ImprimeReporte(bPreview:Boolean);
      Procedure AsignaEmpresaSuc;
      procedure VerificaFechaCtrls(pedFecha: TEdit; pdtpFecha: TInterDateTimePicker);

    { Private declarations }
    public
    { Public declarations }
    Objeto : TMCliEntFi;
end;
 TMCliEntFi= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_CREDITO               : TInterCampo;
        ID_PROM_ADM              : TInterCampo;
        NOM_PROM_ADM             : TInterCampo;
        ID_PROM_ASOC             : TInterCampo;
        NOM_PROM_ASOC            : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        DESC_CONTRATO            : TInterCampo;
        FECHA                    : TInterCampo;
        ID_TITULAR               : TInterCampo;
        NOM_TITULAR              : TInterCampo;
        CVE_GPO_CAPITALIZ        : TInterCampo;
        B_INSC_DUEDA             : TInterCampo;

        ParamCre                 : TParamCre;
        Promotor                 : TEmpleado; //Promotor Responsable
        PromotorAdmon            : TEmpleado; //Promotor Admon
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        CrCredito                : TCrCredito;
        Autorizacion             : TCrCto;
        Titular                  : TCrAcredit;
        PctCapitaliza            : TCrPctCapi;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
//Uses RepMon;
{$R *.DFM}

constructor TMCliEntFi.Create( AOwner : TComponent );
begin Inherited;

      ID_CREDITO := CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
                ID_CREDITO.Caption := 'Número Disposición';
                ID_CREDITO.Parametro := 'ID_CREDITO';
      ID_PROM_ADM := CreaCampo('ID_PROM_ADM',ftInteger,tsNinguno,tsNinguno,False);
                ID_PROM_ADM.Caption := 'Promotor Administrativo';
                ID_PROM_ADM.Parametro := 'ID_PROM_ADM';
      NOM_PROM_ADM := CreaCampo('NOM_PROM_ADM',ftString,tsNinguno,tsNinguno,False);
                NOM_PROM_ADM.Caption := 'Promotor Administrativo';
                NOM_PROM_ADM.Parametro := 'NOM_PROM_ADM';
      ID_PROM_ASOC := CreaCampo('ID_PROM_ASOC',ftInteger,tsNinguno,tsNinguno,False);
                ID_PROM_ASOC.Caption := 'Promotor Asociado';
                ID_PROM_ASOC.Parametro := 'ID_PROM_ASOC';
      NOM_PROM_ASOC := CreaCampo('NOM_PROM_ASOC',ftString,tsNinguno,tsNinguno,False);
                NOM_PROM_ASOC.Caption := 'Promotor Asociado';
                NOM_PROM_ASOC.Parametro := 'NOM_PROM_ASOC';
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
      CVE_GPO_CAPITALIZ := CreaCampo('CVE_GPO_CAPITALIZ',ftString,tsNinguno,tsNinguno,False);
                CVE_GPO_CAPITALIZ.Caption := 'Grupo de Capitalización';
                CVE_GPO_CAPITALIZ.Parametro := 'DESC_CAPITALIZA';
      B_INSC_DUEDA := CreaCampo('B_INSC_DUEDA',ftInteger,tsNinguno,tsNinguno,False);
         With B_INSC_DUEDA Do Begin
            Size := 1;
            UseCombo := True;
            ComboLista.Add('0');    ComboDatos.Add('V');
            ComboLista.Add('1');    ComboDatos.Add('F');
            ComboLista.Add('2');    ComboDatos.Add('0');
         End;
                B_INSC_DUEDA.Caption:='Inscripción de Deuda en la SHCP';
                B_INSC_DUEDA.Parametro := 'B_INSC_DUEDA';

      CrCredito := TCrCredito.Create(Self);
      CrCredito.MasterSource:=Self;

      Promotor := TEmpleado.Create(Self);
      Promotor.FilterBy := fbTMPersonaEmpleado;
      Promotor.MasterSource := Self;
      Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROM_ASOC';
      Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      PromotorAdmon := TEmpleado.Create(Self);
      PromotorAdmon.FilterBy := fbTMPersonaEmpleado;
      PromotorAdmon.MasterSource := Self;
      PromotorAdmon.FieldByName('ID_PERSONA').MasterField := 'ID_PROM_ADM';

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      Autorizacion := TCrCto.Create(Self);
      Autorizacion.MasterSource := Self;

      Titular := TCrAcredit.Create(Self);
      Titular.MasterSource:=Self;

      PctCapitaliza := TCrPctCapi.Create(Self);
      PctCapitaliza.MasterSource:= Self;
      PctCapitaliza.FieldByName('CVE_GPO_CAPITALIZ').MasterField:= 'CVE_GPO_CAPITALIZ';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMCliEntFi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMCliEntFi.Destroy;
begin
   If CrCredito <> Nil then
      CrCredito.Free;
   If Promotor <> Nil Then
      Promotor.Free;
   If PromotorAdmon <> Nil Then
      PromotorAdmon.Free;
   if Empresa <> Nil then
      Empresa.free;
   if UnidadNegocio <> Nil then
      UnidadNegocio.Free;
   If Autorizacion <> Nil Then
      Autorizacion.Free;
   If Titular <> Nil Then
      Titular.Free;
   If PctCapitaliza <> Nil Then
      PctCapitaliza.Free;
   inherited;
end;


function TMCliEntFi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMCliEntFi;
begin
   W := TwMCliEntFi.Create(Self);
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

function TMCliEntFi.Reporte:Boolean;
begin //Execute_Reporte();
end;
(****************************************FORMA IntMCliEntFi********************)
(*                                                                            *)
(*  FORMA DE IntMCliEntFi                                                     *)
(*                                                                            *)
(****************************************FORMA IntMCliEntFi********************)
procedure TwMCliEntFi.AsignaEmpresaSuc;
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

Procedure TwMCliEntFi.EnableCheckBox(Var CheckBox : TCheckBox);
Begin
   If Not CheckBox.Checked Then Begin
      CheckBox.Checked:=False;
      CheckBox.Enabled:=False;
   End Else Begin
      CheckBox.Checked:=True;
      CheckBox.Enabled:=True;
   End;
End;

procedure TwMCliEntFi.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.ID_CREDITO.Control := edDisposicion;
   Objeto.ID_PROM_ADM.Control := edID_PROM_ADM;
   Objeto.NOM_PROM_ADM.Control := edNOM_PROM_ADM;
   Objeto.ID_PROM_ASOC.Control := edID_PROM_ASOC;
   Objeto.NOM_PROM_ASOC.Control := edNOM_PROM_ASOC;
   Objeto.ID_CONTRATO.Control := edID_CONTRATO;
   Objeto.DESC_CONTRATO.Control := edDESC_CONTRATO;
   Objeto.FECHA.Control := edFECHA;
   Objeto.ID_TITULAR.Control := edID_TITULAR;
   Objeto.NOM_TITULAR.Control := edNOM_TITULAR;
   Objeto.CVE_GPO_CAPITALIZ.Control := edCVE_GPO_CAPITALIZ;
   Objeto.B_INSC_DUEDA.Control := rgB_INSC_DUEDA;

   Objeto.CrCredito.ID_CREDITO.Control := edDisposicion;
   Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edNomDisposicion;
   Objeto.Promotor.ID_Persona.Control := edID_PROM_ASOC;
   Objeto.Promotor.Persona.Nombre.Control := edNOM_PROM_ASOC;
   Objeto.PromotorAdmon.ID_Persona.Control := edID_PROM_ADM;
   Objeto.PromotorAdmon.Persona.Nombre.Control := edNOM_PROM_ADM;
   Objeto.Autorizacion.ID_CONTRATO.Control := edID_CONTRATO;
   Objeto.Autorizacion.Acreditado.Persona.Nombre.Control := edDESC_CONTRATO;
   Objeto.Titular.ID_ACREDITADO.Control := edID_TITULAR;
   Objeto.Titular.Persona.Nombre.Control := edNOM_TITULAR;
   Objeto.PctCapitaliza.CVE_GPO_CAPITALIZ.Control := edCVE_GPO_CAPITALIZ;
   Objeto.PctCapitaliza.PCT_CAPITALIZA.Control := edPCT_CAPITALIZA;
   Objeto.PctCapitaliza.DESC_CAPITALIZA.Control := edDESC_CAPITALIZA;

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);
   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;

    Objeto.B_INSC_DUEDA.AsString := '0';
   dtpFecha.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   edFECHA.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));
end;

procedure TwMCliEntFi.FormDestroy(Sender: TObject);
begin
   Objeto.ID_CREDITO.Control := Nil;
   Objeto.ID_PROM_ADM.Control := Nil;
   Objeto.NOM_PROM_ADM.Control := Nil;
   Objeto.ID_PROM_ASOC.Control := Nil;
   Objeto.NOM_PROM_ASOC.Control := Nil;
   Objeto.ID_CONTRATO.Control := Nil;
   Objeto.DESC_CONTRATO.Control := Nil;
   Objeto.FECHA.Control := Nil;
   Objeto.ID_TITULAR.Control := Nil;
   Objeto.NOM_TITULAR.Control := Nil;
   Objeto.CVE_GPO_CAPITALIZ.Control := Nil;
   Objeto.B_INSC_DUEDA.Control := Nil;

   Objeto.CrCredito.ID_CREDITO.Control := Nil;
   Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := Nil;
   Objeto.Autorizacion.ID_CONTRATO.Control := Nil;
   Objeto.Autorizacion.Acreditado.Persona.Nombre.Control := Nil;
   Objeto.Titular.ID_ACREDITADO.Control := Nil;
   Objeto.Titular.Persona.Nombre.Control := Nil;
   Objeto.PctCapitaliza.CVE_GPO_CAPITALIZ.Control := Nil;
   Objeto.PctCapitaliza.PCT_CAPITALIZA.Control := Nil;
   Objeto.PctCapitaliza.DESC_CAPITALIZA.Control := Nil;

   Objeto.Promotor.ID_Persona.Control := Nil;
   Objeto.Promotor.Persona.Nombre.Control := Nil;
   Objeto.PromotorAdmon.ID_Persona.Control := Nil;
   Objeto.PromotorAdmon.Persona.Nombre.Control := Nil;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMCliEntFi.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

Procedure TwMCliEntFi.ImprimeReporte(bPreview:Boolean);
Var sSQL: String;
begin
   Objeto.ID_PROM_ASOC.GetFromControl;
   Objeto.ID_PROM_ADM.GetFromControl;
   Objeto.ID_TITULAR.GetFromControl;
   Objeto.ID_CREDITO.GetFromControl;
   Objeto.ID_CONTRATO.GetFromControl;
   Objeto.CVE_GPO_CAPITALIZ.GetFromControl;
   Objeto.B_INSC_DUEDA.GetFromControl;
   Objeto.FECHA.GetFromControl;

   RepCliEntFinGM( Objeto.ID_PROM_ASOC.AsString,         Objeto.ID_PROM_ADM.AsString,
                   Objeto.ID_TITULAR.AsString,           Objeto.ID_CREDITO.AsString,
                   Objeto.ID_CONTRATO.AsString,          Objeto.CVE_GPO_CAPITALIZ.AsString,
                   Objeto.B_INSC_DUEDA.AsString,         edIdEmpresa.Text,
                   edIDSucursal.Text,                    Objeto.FECHA.AsDateTime,
                   Objeto.Apli,                          bPreview);
End;

procedure TwMCliEntFi.InterForma1BtnPreviewClick(Sender: TObject);
begin
   ImprimeReporte(True);
end;

procedure TwMCliEntFi.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimeReporte(False);
end;

procedure TwMCliEntFi.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMCliEntFi.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMCliEntFi.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMCliEntFi.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([IlSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMCliEntFi.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMCliEntFi.btID_CONTRATOClick(Sender: TObject);
begin
   Objeto.Autorizacion.ShowAll := True;
   If Objeto.Autorizacion.Busca Then Begin
      chbID_CONTRATO.Checked := True;
      chbID_CONTRATO.Enabled := True;
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TwMCliEntFi.ilID_CONTRATOEjecuta(Sender: TObject);
begin
   If Objeto.Autorizacion.FindKey([ilID_CONTRATO.Buffer])Then Begin
      chbID_CONTRATO.Checked := True;
      chbID_CONTRATO.Enabled := True;
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TwMCliEntFi.btID_TITULARClick(Sender: TObject);
begin
   Objeto.Titular.ShowAll := True;
   If Objeto.Titular.Busca Then Begin
      chbID_TITULAR.Checked := True;
      chbID_TITULAR.Enabled := True;
      InterForma1.NextTab(edID_TITULAR);
   End;
end;

procedure TwMCliEntFi.chbID_TITULARClick(Sender: TObject);
begin
   EnableCheckBox(chbID_TITULAR);
   Objeto.Titular.Active := chbID_TITULAR.Checked;
end;

procedure TwMCliEntFi.ilID_TITULAREjecuta(Sender: TObject);
begin
   If Objeto.Titular.FindKey([ilID_TITULAR.Buffer])Then Begin
      chbID_TITULAR.Checked := True;
      chbID_TITULAR.Enabled := True;
      InterForma1.NextTab(edID_TITULAR);
   End;
end;

procedure TwMCliEntFi.chbID_CONTRATOClick(Sender: TObject);
begin
   EnableCheckBox(chbID_CONTRATO);
   Objeto.Autorizacion.Active := chbID_CONTRATO.Checked;
end;

procedure TwMCliEntFi.VerificaFechaCtrls(pedFecha: TEdit; pdtpFecha: TInterDateTimePicker);
begin
     Try
        If Trim(pedFecha.Text) <> '' Then
            pdtpFecha.Date := StrToDate(pedFecha.Text);
     Except
        pedFecha.Text := FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
        pdtpFecha.Date := StrToDate(pedFecha.Text);
     End;
end;

procedure TwMCliEntFi.edFECHAExit(Sender: TObject);
begin
    VerificaFechaCtrls(edFECHA, dtpFecha);
end;

procedure TwMCliEntFi.btID_PROM_ADMClick(Sender: TObject);
begin
   Objeto.PromotorAdmon.ShowAll := True;
   If Objeto.PromotorAdmon.Busca Then Begin
      chbID_PROM_ADM.Checked:=True;
      chbID_PROM_ADM.Enabled:=True;
      InterForma1.NextTab(edID_PROM_ADM);
   End;
end;

procedure TwMCliEntFi.ilID_PROM_ADMEjecuta(Sender: TObject);
begin
   If Objeto.PromotorAdmon.FindKey([ilID_PROM_ADM.Buffer])Then Begin
      chbID_PROM_ADM.Checked:=True;
      chbID_PROM_ADM.Enabled:=True;
      InterForma1.NextTab(edID_PROM_ADM);
   End;
end;

procedure TwMCliEntFi.chbID_PROM_ADMClick(Sender: TObject);
begin
   EnableCheckBox(chbID_PROM_ADM);
   Objeto.PromotorAdmon.Active := chbID_PROM_ADM.Checked;
end;

procedure TwMCliEntFi.btID_PROM_ASOCClick(Sender: TObject);
begin
   Objeto.Promotor.ShowAll := True;
   If Objeto.Promotor.Busca Then Begin
      chbID_PROM_ASOC.Checked:=True;
      chbID_PROM_ASOC.Enabled:=True;
      InterForma1.NextTab(edID_PROM_ASOC);
   End;
end;

procedure TwMCliEntFi.ilID_PROM_ASOCEjecuta(Sender: TObject);
begin
   If Objeto.Promotor.FindKey([ilID_PROM_ASOC.Buffer])Then Begin
      chbID_PROM_ASOC.Checked:=True;
      chbID_PROM_ASOC.Enabled:=True;
      InterForma1.NextTab(edID_PROM_ASOC);
   End;
end;

procedure TwMCliEntFi.chbID_PROM_ASOCClick(Sender: TObject);
begin
   EnableCheckBox(chbID_PROM_ASOC);
   Objeto.Promotor.Active := chbID_PROM_ASOC.Checked;
end;

procedure TwMCliEntFi.btDisposicionClick(Sender: TObject);
begin
   Objeto.CrCredito.ShowAll := True;
   If Objeto.CrCredito.Busca Then Begin
      cbxDisposicion.Checked:=True;
      cbxDisposicion.Enabled:=True;
      InterForma1.NextTab(edDisposicion);
   End;
end;

procedure TwMCliEntFi.ilDisposicionEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ilDisposicion.Buffer]) Then Begin
      cbxDisposicion.Checked:=True;
      cbxDisposicion.Enabled:=True;
      InterForma1.NextTab(edDisposicion);
   End;
end;

procedure TwMCliEntFi.cbxDisposicionClick(Sender: TObject);
begin
   EnableCheckBox(cbxDisposicion);
   Objeto.CrCredito.Active := cbxDisposicion.Checked;
end;

procedure TwMCliEntFi.btCVE_GPO_CAPITALIZClick(Sender: TObject);
begin
   Objeto.PctCapitaliza.ShowAll := True;
   If Objeto.PctCapitaliza.Busca Then Begin
      chbPCT_CAPITALIZA.Checked := True;
      chbPCT_CAPITALIZA.Enabled := True;
      InterForma1.NextTab(edPCT_CAPITALIZA);
   End;
end;

procedure TwMCliEntFi.ilCVE_GPO_CAPITALIZEjecuta(Sender: TObject);
begin
   If Objeto.PctCapitaliza.FindKey([ilCVE_GPO_CAPITALIZ.Buffer]) Then Begin
      chbPCT_CAPITALIZA.Checked := True;
      chbPCT_CAPITALIZA.Enabled := True;
      InterForma1.NextTab(edPCT_CAPITALIZA);
   End;
end;

procedure TwMCliEntFi.rgB_INSC_DUEDAClick(Sender: TObject);
begin
   Objeto.B_INSC_DUEDA.GetFromControl;
end;

procedure TwMCliEntFi.chbPCT_CAPITALIZAClick(Sender: TObject);
begin
   EnableCheckBox(chbPCT_CAPITALIZA);
   Objeto.PctCapitaliza.Active := chbPCT_CAPITALIZA.Checked;
end;

end.
