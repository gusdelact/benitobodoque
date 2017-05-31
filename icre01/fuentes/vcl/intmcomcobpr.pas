// Sistema         :
// Fecha de Inicio :
// Función forma   :
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMComCobPr;

interface
uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,InterEdit,

IntParamCre,      //Parámetros Crédito
IntCrAcredit,     //Acreditado
IntCrCredito,     //Disposición
Intempre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntMProdGpo,      //Grupo Producto
IntCrProduct,     //Producto de crédito
IntCrCatComi,
IntMon,           //Moneda
IntMPers, //PromotorAsoc
IntMQrComCobPr
;

Type
 TMComCobPr= class;

  TwMComCobPr=Class(TForm)
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
    chbxAcreditado: TCheckBox;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    edDisposicion: TEdit;
    btDisposicion: TBitBtn;
    ilDisposicion: TInterLinkit;
    edNomDisposicion: TEdit;
    cbxDisposicion: TCheckBox;
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
    edCVE_COMISION: TEdit;
    btCVE_COMISION: TBitBtn;
    Label3: TLabel;
    edDESC_COMISION: TEdit;
    cbxCOMISION: TCheckBox;
    ilCOMISION: TInterLinkit;
    cbxPRODUCTO_GPO: TCheckBox;
    lbLiqF_INICIO: TLabel;
    edF_Ini: TEdit;
    dtpF_Ini: TInterDateTimePicker;
    Label1: TLabel;
    edF_Fin: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    Label4: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btPRODUCTO_GPO: TBitBtn;
    edDESC_PRODUCTO_GPO: TEdit;
    cbxPRODUCTO_CRE: TCheckBox;
    Label6: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO_CRE: TBitBtn;
    edDESC_PRODUCTO_CRE: TEdit;
    ilPRODUCTO_GPO: TInterLinkit;
    ilPRODUCTO_CRE: TInterLinkit;
    cbxCUOTA_MONEDA: TCheckBox;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btCVE_MONEDA: TBitBtn;
    ilMONEDA: TInterLinkit;
    edDESC_MONEDA: TEdit;
    chbxMoneda: TCheckBox;
    lbID_PROMOTOR: TLabel;
    edID_PROMOTOR: TEdit;
    btPROMOTOR: TBitBtn;
    edNOM_PROMOTOR: TEdit;
    ilPROMOTOR: TInterLinkit;
    chbxPromotor: TCheckBox;
    Label7: TLabel;
    edID_PROM: TEdit;
    btPROM_ADMON: TBitBtn;
    edNOM_PROM: TEdit;
    ilPromAdmon: TInterLinkit;
    chbxPromAmon: TCheckBox;
    CbPromotorAdm: TCheckBox;
    CbPromotorAso: TCheckBox;
    edF_APERTURA: TEdit;
    InterDateTimePicker1: TInterDateTimePicker;
    Label9: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure btDisposicionClick(Sender: TObject);
    procedure cbxDisposicionClick(Sender: TObject);
    procedure ilDisposicionEjecuta(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure btPRODUCTO_GPOClick(Sender: TObject);
    procedure ilPRODUCTO_GPOEjecuta(Sender: TObject);
    procedure cbxPRODUCTO_GPOClick(Sender: TObject);
    procedure btPRODUCTO_CREClick(Sender: TObject);
    procedure ilPRODUCTO_CREEjecuta(Sender: TObject);
    procedure cbxPRODUCTO_CREClick(Sender: TObject);
    procedure btCVE_COMISIONClick(Sender: TObject);
    procedure ilCOMISIONEjecuta(Sender: TObject);
    procedure cbxCOMISIONClick(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure btPROMOTORClick(Sender: TObject);
    procedure ilPROMOTOREjecuta(Sender: TObject);
    procedure chbxPromotorClick(Sender: TObject);
    procedure btPROM_ADMONClick(Sender: TObject);
    procedure chbxPromAmonClick(Sender: TObject);
    procedure ilPromAdmonEjecuta(Sender: TObject);
    procedure edID_PROMOTORChange(Sender: TObject);
    procedure edID_PROMChange(Sender: TObject);
    private
    { Private declarations }
     procedure EnableCheckBox(var CheckBox : TCheckBox);
     procedure ImprimeReporte(bPreview : Boolean);
     Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMComCobPr;
    end;

 TMComCobPr= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }

        CVE_PRODUCTO_GPO        : TInterCampo;
        CVE_PRODUCTO_CRE        : TInterCampo;
        ID_ACREDITADO           : TInterCampo;
        ID_CREDITO              : TInterCampo;
        CVE_COMISION            : TInterCampo;
        ID_PROM_ASOC            : TInterCampo;
        ID_PROM_ADM             : TInterCampo;
        CVE_MONEDA              : TInterCampo;
        SIT_COMISION            : TInterCampo;
        CORTE_ASOC              : TInterCampo;
        CORTE_ADM               : TInterCampo;
        CORTE_MONEDA            : TInterCampo;
        F_INICIO                : TInterCampo;
        F_FINAL                 : TInterCampo;
        ID_EMPRESA              : TInterCampo;
        F_APERTURA              : TInterCampo;

        CrCredito               : TCrCredito;
        ParamCre                : TParamCre;
        Acreditado              : TCrAcredit;
        UnidadNegocio           : TUnNegocio;
        Empresa                 : TEmpresa;
        GpoProducto             : TMProdGpo;
        Producto                : TCrProduct;
        Comision                : TCrCatComi;
        Moneda                  : TMoneda;
        Promotor                : TMPersona; //Promotor Responsable
        PromotorAdmon           : TMPersona; //Promotor Admon

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMComCobPr.Create( AOwner : TComponent );
begin Inherited;

   CVE_PRODUCTO_GPO :=CreaCampo('CVE_PRODUCTO_GPO',ftString,tsNinguno,tsNinguno,False);
   CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,False);
   ID_ACREDITADO    :=CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);
   ID_CREDITO       :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
   CVE_COMISION     :=CreaCampo('CVE_COMISION',ftString,tsNinguno,tsNinguno,False);
   ID_PROM_ASOC     :=CreaCampo('ID_PROM_ASOC',ftInteger,tsNinguno,tsNinguno,False);
   ID_PROM_ADM      :=CreaCampo('ID_PROM_ADM',ftInteger,tsNinguno,tsNinguno,False);
   CVE_MONEDA       :=CreaCampo('CVE_MONEDA',ftString,tsNinguno,tsNinguno,False);
   SIT_COMISION     :=CreaCampo('SIT_COMISION',ftString,tsNinguno,tsNinguno,False);
   With SIT_COMISION Do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0');           ComboDatos.Add('');
      ComboLista.Add('1');           ComboDatos.Add('AC');
      ComboLista.Add('2');           ComboDatos.Add('PA');
      ComboLista.Add('3');           ComboDatos.Add('LQ');
      ComboLista.Add('4');           ComboDatos.Add('IM');
   End;

   CORTE_ASOC       :=CreaCampo('CORTE_ASOC',ftString,tsNinguno,tsNinguno,False);
   CORTE_ADM        :=CreaCampo('CORTE_ADM',ftString,tsNinguno,tsNinguno,False);
   CORTE_MONEDA     :=CreaCampo('CORTE_MONEDA',ftString,tsNinguno,tsNinguno,False);
   F_INICIO         :=CreaCampo('F_INICIO',ftDate,tsNinguno,tsNinguno,False);
   F_FINAL          :=CreaCampo('F_FINAL',ftDate,tsNinguno,tsNinguno,False);
   ID_EMPRESA       :=CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,False);
   F_APERTURA       :=CreaCampo('F_APERTURA',ftDate,tsNinguno,tsNinguno,False);

   CrCredito := TCrCredito.Create(Self);
   CrCredito.MasterSource:=Self;

   Acreditado := TCrAcredit.Create(Self);
   Acreditado.MasterSource := Self;

   Empresa := TEmpresa.Create(Self);
   UnidadNegocio := TUnNegocio.Create(Self);

   GpoProducto := TMProdGpo.Create(Self);
   GpoProducto.MasterSource := Self;

   Producto := TCrProduct.Create(Self);
   Producto.MasterSource := Self;

   Comision := TCrCatComi.Create(Self);
   Comision.MasterSource := Self;

   Moneda := TMoneda.Create(Self);
   Moneda.MasterSource:=Self;

   Promotor := TMPersona.Create(Self);
   Promotor.FilterBy := fbTMPersonaEmpleado;
   Promotor.MasterSource := Self;
   Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
   Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

   PromotorAdmon := TMPersona.Create(Self);
   PromotorAdmon.FilterBy := fbTMPersonaEmpleado;
   PromotorAdmon.MasterSource := Self;
   PromotorAdmon.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
   //      PromotorAdmon.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

   StpName  := ' ';
   UseQuery := False;
   HelpFile := '';
   ShowMenuReporte:=True;
end;

Destructor TMComCobPr.Destroy;
begin
   If CrCredito <> nil then
      CrCredito.Free;
   if Acreditado <> nil then
      Acreditado.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   if GpoProducto <> nil then
      GpoProducto.MasterSource := Self;
   if Producto <> nil then
      Producto.MasterSource := Self;
   if Comision <> nil then
      Comision.MasterSource := Self;
   if Moneda <> nil then
      Moneda.Free;
   if Promotor <> nil then
      Promotor.Free;
   if PromotorAdmon <> nil then
      PromotorAdmon.Free;
   inherited;
end;


function TMComCobPr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMComCobPr;
begin
   W:=TwMComCobPr.Create(Self);
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
procedure TwMComCobPr.AsignaEmpresaSuc;
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

procedure TwMComCobPr.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := Objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := Objeto.ParamCre.PERFIL.AsString;

   Objeto.CVE_PRODUCTO_GPO.Control :=edCVE_PRODUCTO_GPO;
   Objeto.CVE_PRODUCTO_CRE.Control :=edCVE_PRODUCTO_CRE;
   Objeto.ID_ACREDITADO.Control    :=edACREDITADO;
   Objeto.ID_CREDITO.Control       :=edDisposicion;
   Objeto.CVE_COMISION.Control     :=edCVE_COMISION;
   Objeto.ID_PROM_ASOC.Control     :=edID_PROMOTOR;
   Objeto.ID_PROM_ADM.Control      :=edID_PROM;
   Objeto.CVE_MONEDA.Control       :=edCVE_MONEDA;
   Objeto.CORTE_ASOC.Control       :=CbPromotorAso;
   Objeto.CORTE_ADM.Control        :=CbPromotorAdm;
   Objeto.CORTE_MONEDA.Control     :=cbxCUOTA_MONEDA;
   Objeto.F_INICIO.Control         :=edF_Ini;
   Objeto.F_FINAL.Control          :=edF_Fin;
   Objeto.ID_EMPRESA.Control       :=EdIdEmpresa;
   Objeto.F_APERTURA.Control       :=edF_APERTURA;

   Objeto.CrCredito.ID_CREDITO.Control := edDisposicion;
   Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edNomDisposicion;
   Objeto.CrCredito.GetParams(Objeto);

   Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
   Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
   Objeto.GetParams(Objeto);

   Objeto.GpoProducto.CVE_PRODUCTO_GPO.Control := edCVE_PRODUCTO_GPO;
   Objeto.GpoProducto.DESC_L_PROD_GPO.Control := edDESC_PRODUCTO_GPO;
   Objeto.GpoProducto.GetParams(Objeto);

   Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
   Objeto.Producto.DESC_L_PRODUCTO.Control := edDESC_PRODUCTO_CRE;
   Objeto.Producto.GetParams(Objeto);

   Objeto.Comision.CVE_COMISION.Control := edCVE_COMISION;
   Objeto.Comision.DESC_COMISION.Control := edDESC_COMISION;
   Objeto.Comision.GetParams(Objeto);

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);

   Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
   Objeto.Moneda.GetParams(Objeto);

   Objeto.Promotor.ID_Persona.Control :=edID_PROMOTOR;
   Objeto.Promotor.Nombre.Control :=edNOM_PROMOTOR;
   Objeto.Promotor.GetParams(Objeto);

   Objeto.PromotorAdmon.ID_Persona.Control :=edID_PROM;
   Objeto.PromotorAdmon.Nombre.Control :=edNOM_PROM;
   Objeto.PromotorAdmon.GetParams(Objeto);
   AsignaEmpresaSuc;

   Objeto.F_INICIO.AsDateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.F_FINAL.AsDateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CORTE_ASOC.AsString:= 'V';
   Objeto.CORTE_ADM.AsString:= 'V';
   Objeto.CORTE_MONEDA.AsString:= 'V';
end;

procedure TwMComCobPr.FormDestroy(Sender: TObject);
begin

   Objeto.CVE_PRODUCTO_GPO.Control :=nil;
   Objeto.CVE_PRODUCTO_CRE.Control :=nil;
   Objeto.ID_ACREDITADO.Control    :=nil;
   Objeto.ID_CREDITO.Control       :=nil;
   Objeto.CVE_COMISION.Control     :=nil;
   Objeto.ID_PROM_ASOC.Control     :=nil;
   Objeto.ID_PROM_ADM.Control      :=nil;
   Objeto.CVE_MONEDA.Control       :=nil;
   Objeto.CORTE_ASOC.Control       :=nil;
   Objeto.CORTE_ADM.Control        :=nil;
   Objeto.CORTE_MONEDA.Control     :=nil;
   Objeto.F_INICIO.Control         :=nil;
   Objeto.F_FINAL.Control          :=nil;
   Objeto.ID_EMPRESA.Control       :=nil;
   Objeto.F_APERTURA.Control       :=nil;

   Objeto.CrCredito.ID_CREDITO.Control := Nil;
   Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := Nil;
   Objeto.Acreditado.ID_ACREDITADO.Control := nil;
   Objeto.Acreditado.Persona.Nombre.Control := nil;
   Objeto.GpoProducto.CVE_PRODUCTO_GPO.Control := nil;
   Objeto.GpoProducto.DESC_L_PROD_GPO.Control := nil;
   Objeto.Producto.CVE_PRODUCTO_CRE.Control := nil;
   Objeto.Producto.DESC_L_PRODUCTO.Control := nil;
   Objeto.Comision.CVE_COMISION.Control := nil;
   Objeto.Comision.DESC_COMISION.Control := nil;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
   Objeto.Moneda.Cve_Moneda.Control := nil;
   Objeto.Moneda.Desc_Moneda.Control := nil;
   Objeto.Promotor.Nombre.Control :=nil;
   Objeto.Promotor.Id_Persona.Control :=nil;
   Objeto.PromotorAdmon.Nombre.Control :=nil;
   Objeto.PromotorAdmon.Id_Persona.Control :=nil;
end;

procedure TwMComCobPr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMComCobPr.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TwMComCobPr.ImprimeReporte(bPreview : Boolean);
Begin

    Objeto.CVE_PRODUCTO_GPO.GetFromControl;
    Objeto.CVE_PRODUCTO_CRE.GetFromControl;
    Objeto.ID_ACREDITADO.GetFromControl;
    Objeto.ID_CREDITO.GetFromControl;
    Objeto.CVE_COMISION.GetFromControl;
    Objeto.ID_PROM_ASOC.GetFromControl;
    Objeto.ID_PROM_ADM.GetFromControl;
    Objeto.CVE_MONEDA.GetFromControl;
    Objeto.SIT_COMISION.GetFromControl;
    Objeto.CORTE_ASOC.GetFromControl;
    Objeto.CORTE_ADM.GetFromControl;
    Objeto.CORTE_MONEDA.GetFromControl;
    Objeto.F_INICIO.GetFromControl;
    Objeto.F_FINAL.GetFromControl;
    Objeto.ID_EMPRESA.GetFromControl;
    Objeto.F_APERTURA.GetFromControl;

    RepComCobPr(objeto.CVE_MONEDA.AsString,        Objeto.ID_PROM_ASOC.AsString,    Objeto.ID_PROM_ADM.AsString,
                Objeto.ID_ACREDITADO.AsString,     Objeto.ID_CREDITO.AsString,      Objeto.CVE_COMISION.AsString,
                Objeto.CVE_PRODUCTO_GPO.AsString,  Objeto.CVE_PRODUCTO_CRE.AsString,Objeto.ID_EMPRESA.AsString,
                Objeto.CORTE_ASOC.AsString,        Objeto.CORTE_ADM.AsString,       Objeto.CORTE_MONEDA.AsString,
                Objeto.F_INICIO.AsDateTime,        Objeto.F_FINAL.AsDateTime,       Objeto.F_APERTURA.AsDateTime,
                Objeto.Apli,                       bPreview               );
End;

procedure TwMComCobPr.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimeReporte(False);
end;

procedure TwMComCobPr.InterForma1BtnPreviewClick(Sender: TObject);
begin
   ImprimeReporte(True);
end;

procedure TwMComCobPr.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
      chbxAcreditado.Checked:= True;
      chbxAcreditado.Enabled:= True;
   End;
end;

procedure TwMComCobPr.ilACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
      chbxAcreditado.Checked:=True;
      chbxAcreditado.Enabled:=True;
   End;
end;

procedure TwMComCobPr.chbxAcreditadoClick(Sender: TObject);
begin
   EnableCheckBox(chbxAcreditado);
   Objeto.Acreditado.Active := chbxAcreditado.Checked;
end;

procedure TwMComCobPr.btDisposicionClick(Sender: TObject);
begin
   Objeto.CrCredito.ShowAll := True;
   If Objeto.CrCredito.Busca Then Begin
      cbxDisposicion.Checked:=True;
      cbxDisposicion.Enabled:=True;
   End;
end;

procedure TwMComCobPr.cbxDisposicionClick(Sender: TObject);
begin
   EnableCheckBox(cbxDisposicion);
   Objeto.CrCredito.Active := cbxDisposicion.Checked;
end;

procedure TwMComCobPr.ilDisposicionEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ilDisposicion.Buffer]) Then Begin
      cbxDisposicion.Checked:=True;
      cbxDisposicion.Enabled:=True;
   End;
end;

procedure TwMComCobPr.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMComCobPr.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMComCobPr.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMComCobPr.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMComCobPr.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMComCobPr.btPRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProducto.ShowAll := True;
   If Objeto.GpoProducto.Busca Then Begin
      cbxPRODUCTO_GPO.Checked:=True;
      cbxPRODUCTO_GPO.Enabled:=True;
   End;
end;

procedure TwMComCobPr.ilPRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProducto.FindKey([ilPRODUCTO_GPO]) Then Begin
      cbxPRODUCTO_GPO.Checked:=True;
      cbxPRODUCTO_GPO.Enabled:=True;
   End;
end;

procedure TwMComCobPr.cbxPRODUCTO_GPOClick(Sender: TObject);
begin
   EnableCheckBox(cbxPRODUCTO_GPO);
   Objeto.GpoProducto.Active := cbxPRODUCTO_GPO.Checked;
end;

procedure TwMComCobPr.btPRODUCTO_CREClick(Sender: TObject);
begin
   Objeto.Producto.ShowAll := True;
   If Objeto.Producto.Busca Then Begin
      cbxPRODUCTO_CRE.Checked:=True;
      cbxPRODUCTO_CRE.Enabled:=True;
   End;
end;

procedure TwMComCobPr.ilPRODUCTO_CREEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilPRODUCTO_CRE]) Then Begin
      cbxPRODUCTO_CRE.Checked:=True;
      cbxPRODUCTO_GPO.Enabled:=True;
   End;
end;

procedure TwMComCobPr.cbxPRODUCTO_CREClick(Sender: TObject);
begin
   EnableCheckBox(cbxPRODUCTO_CRE);
   Objeto.Producto.Active := cbxPRODUCTO_CRE.Checked;
end;

procedure TwMComCobPr.btCVE_COMISIONClick(Sender: TObject);
begin
   Objeto.Comision.ShowAll := True;
   If Objeto.Comision.Busca Then Begin
      cbxCOMISION.Checked:=True;
      cbxCOMISION.Enabled:=True;
   End;
end;

procedure TwMComCobPr.ilCOMISIONEjecuta(Sender: TObject);
begin
   If Objeto.Comision.FindKey([ilCOMISION]) Then Begin
      cbxCOMISION.Checked:=True;
      cbxCOMISION.Enabled:=True;
   End;
end;

procedure TwMComCobPr.cbxCOMISIONClick(Sender: TObject);
begin
   EnableCheckBox(cbxCOMISION);
   Objeto.Comision.Active := cbxCOMISION.Checked;
end;

procedure TwMComCobPr.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
      chbxMoneda.Checked:= True;
      chbxMoneda.Enabled:= True;
   End;
end;

procedure TwMComCobPr.ilMONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
      chbxMoneda.Checked:=True;
      chbxMoneda.Enabled:=True;
   End;
end;

procedure TwMComCobPr.chbxMonedaClick(Sender: TObject);
begin
   EnableCheckBox(chbxMoneda);
   Objeto.Moneda.Active := chbxMoneda.Checked;
end;

procedure TwMComCobPr.btPROMOTORClick(Sender: TObject);
begin
   Objeto.Promotor.ShowAll := True;
   If Objeto.Promotor.Busca Then Begin
      chbxPromotor.Checked:=True;
      chbxPromotor.Enabled:=True;
   End;
end;

procedure TwMComCobPr.ilPROMOTOREjecuta(Sender: TObject);
begin
   If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
      chbxPromotor.Checked:=True;
      chbxPromotor.Enabled:=True;
   End;
end;

procedure TwMComCobPr.chbxPromotorClick(Sender: TObject);
begin
   EnableCheckBox(chbxPromotor);
   Objeto.Promotor.Active := chbxPromotor.Checked;
end;

procedure TwMComCobPr.btPROM_ADMONClick(Sender: TObject);
begin
   Objeto.PromotorAdmon.ShowAll := True;
   If Objeto.PromotorAdmon.Busca Then Begin
      chbxPromAmon.Checked:=True;
      chbxPromAmon.Enabled:=True;
   End;
end;

procedure TwMComCobPr.chbxPromAmonClick(Sender: TObject);
begin
   EnableCheckBox(chbxPromAmon);
   Objeto.PromotorAdmon.Active := chbxPromAmon.Checked;
end;

procedure TwMComCobPr.ilPromAdmonEjecuta(Sender: TObject);
begin
   If Objeto.PromotorAdmon.FindKey([ilPromAdmon.Buffer]) Then Begin
      chbxPromAmon.Checked:=True;
      chbxPromAmon.Enabled:=True;
   End;
end;

procedure TwMComCobPr.edID_PROMOTORChange(Sender: TObject);
begin
   If Trim(edID_PROMOTOR.Text)<>'' Then Begin
      chbxPromotor.Checked:=True;
      chbxPromotor.Enabled:=True;
   End;
end;

procedure TwMComCobPr.edID_PROMChange(Sender: TObject);
begin
   If Trim(edID_PROM.Text)<>'' Then Begin
      chbxPromAmon.Checked:=True;
      chbxPromAmon.Enabled:=True;
   End;
end;

end.
