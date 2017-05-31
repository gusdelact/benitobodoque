// Sistema         : Clase de TMReEmiPro
// Fecha de Inicio : 01/10/2003
// Función forma   : Clase de TMReEmiPro
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMReEmiPro;     


interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntMon,           //Moneda
IntCrEmisor,      //Emisor
IntCrProveed,     //Proveedor
IntMPers,         //Promotor
IntEmple,
IntCrCto,         //Contrato
IntCrCredito,     //Disposición
IntParamCre,
IntMQrEmiPro,      //Reporte
IntCrDocto,
Intempre,          //Empresa
IntUnNeg,          //Unidad Negocio/Suc
IntMInstDesc,
IntGenCre, 
IntCrCartrIm            //Detalle de Impagado
;

Type
 TMReEmiPro= class;

  TwMReEmiPro=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox1: TGroupBox;
    dtpLiqF_INICIO: TInterDateTimePicker;
    edLiqF_INICIO: TEdit;
    lbLiqF_INICIO: TLabel;
    lbLiqF_FINAL: TLabel;
    edLiqF_FINAL: TEdit;
    dtpLiqF_FINAL: TInterDateTimePicker;
    GroupBox2: TGroupBox;
    lbComF_INICIO: TLabel;
    lbComF_FINAL: TLabel;
    dtpComF_INICIO: TInterDateTimePicker;
    edComF_INICIO: TEdit;
    edComF_FINAL: TEdit;
    dtpComF_FINAL: TInterDateTimePicker;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    ilMONEDA: TInterLinkit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    edID_EMISOR: TEdit;
    btEMISOR: TBitBtn;
    ilEMISOR: TInterLinkit;
    edNOM_EMISOR: TEdit;
    lbID_EMISOR: TLabel;
    edID_PROVEEDOR: TEdit;
    lbID_PROVEEDOR: TLabel;
    btPROVEEDOR: TBitBtn;
    edID_PROV_EXTERNO: TEdit;
    edNOM_PROVEEDOR: TEdit;
    ilPROVEEDOR: TInterLinkit;
    lbID_PROMOTOR: TLabel;
    edID_PROMOTOR: TEdit;
    btPROMOTOR: TBitBtn;
    ilPROMOTOR: TInterLinkit;
    edNOM_PROMOTOR: TEdit;
    Label7: TLabel;
    Label1: TLabel;
    rgSituacion: TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    chbxMoneda: TCheckBox;
    chbxEmisor: TCheckBox;
    chbxProveedor: TCheckBox;
    chbxPromotor: TCheckBox;
    chbxAutorizacion: TCheckBox;
    chbxDisposicion: TCheckBox;
    edDESC_PRODUCTO: TEdit;
    edCVE_PRODUCTO: TEdit;
    btCONTRATO: TBitBtn;
    iedID_CONTRATO: TInterEdit;
    ilIDCONTRATO: TInterLinkit;
    edID_CREDITO: TEdit;
    btCREDITO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    ilCREDITO: TInterLinkit;
    rgOrden: TRadioGroup;
    chbxF_Liq: TCheckBox;
    chbxF_Com: TCheckBox;
    GroupBox3: TGroupBox;
    chbxOrigRec: TCheckBox;
    chbxPromAdmin: TCheckBox;
    rgOPERADOPOR: TRadioGroup;
    Label2: TLabel;
    edTIPO_DOCTO: TEdit;
    btTIPO_DOCTO: TBitBtn;
    edDESC_TIPO_DOCTO: TEdit;
    cbTIPO_DOCTO: TCheckBox;
    ilTIPO_DOCTO: TInterLinkit;
    chbxTipoSector: TCheckBox;
    qMovimientos: TQuery;
    sdAviso: TSaveDialog;
    Button1: TButton;
    gbControl: TGroupBox;
    Label3: TLabel;
    EdIDSucursal: TEdit;
    BBSucursal: TBitBtn;
    EdDescSucursal: TEdit;
    CBSucursal: TCheckBox;
    lbICveRequisito: TLabel;
    EdIdEmpresa: TEdit;
    bbEmpresa: TBitBtn;
    edNombreEmpresa: TEdit;
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    lbCVE_FND_ENT_DES: TLabel;
    edCVE_FND_ENT_DES: TEdit;
    btnCVE_FND_ENT_DES: TBitBtn;
    edDESC_ENT_DES: TEdit;
    cbxCVE_FND_ENT_DES: TCheckBox;
    ilCVE_FND_ENT_DES: TInterLinkit;
    MsgPanel: TPanel;
    cbxArchivo: TCheckBox;
    edNbrArch: TEdit;
    sdArchivoExcel: TSaveDialog;
    sbExcel: TSpeedButton;
    Label6: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure ilEMISORCapture(Sender: TObject; var Show: Boolean);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure ilPROVEEDORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure edID_PROVEEDORExit(Sender: TObject);
    procedure btPROMOTORClick(Sender: TObject);
    procedure ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROMOTOREjecuta(Sender: TObject);
    procedure edID_PROMOTORExit(Sender: TObject);
    procedure btCONTRATOClick(Sender: TObject);
    procedure ilIDCONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure iedID_CONTRATOExit(Sender: TObject);
    procedure ilIDCONTRATOEjecuta(Sender: TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure ilCREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure chbxF_LiqClick(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure chbxF_ComClick(Sender: TObject);
    procedure chbxEmisorClick(Sender: TObject);
    procedure chbxProveedorClick(Sender: TObject);
    procedure chbxPromotorClick(Sender: TObject);
    procedure chbxAutorizacionClick(Sender: TObject);
    procedure chbxDisposicionClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure edLiqF_INICIOChange(Sender: TObject);
    procedure edLiqF_FINALChange(Sender: TObject);
    procedure edComF_INICIOChange(Sender: TObject);
    procedure edComF_FINALChange(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure btTIPO_DOCTOClick(Sender: TObject);
    procedure ilTIPO_DOCTOEjecuta(Sender: TObject);
    procedure ilTIPO_DOCTOCapture(Sender: TObject; var Show: Boolean);
    procedure cbTIPO_DOCTOClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);
    procedure btnCVE_FND_ENT_DESClick(Sender: TObject);
    procedure cbxCVE_FND_ENT_DESClick(Sender: TObject);
    procedure ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure edID_EMISORExit(Sender: TObject);
    procedure edTIPO_DOCTOExit(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);

    private
    { Private declarations }
        Procedure ImprimirReporte(bPreview:Boolean);
    public
    { Public declarations }
    Objeto : TMReEmiPro;
    Procedure Archivo;
    Procedure AsignaEmpresaSuc;
end;
 TMReEmiPro= class(TInterFrame)
      private
    function InternalBusca: Boolean;
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        Moneda                   : TMoneda;
        Emisor                   : TCrEmisor;
        Proveedor                : TCrProveed;
        Promotor                 : TEmpleado; //Promotor Responsable
        ContratoCre              : TCrCto; //Contrato Crédito
        Credito                  : TCrCredito;
        ParamCre                 : TParamCre;
        Documento                : TCrDocto;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        MInstDesc                : TMInstDesc;
        DetImpagado              : TCrCartrIm;
        
//        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TMReEmiPro.Create( AOwner : TComponent );
begin Inherited;
      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;
{      Emisor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
      Emisor.FieldByName('ID_ACREDITADO').MasterField:='ID_EMISOR';
      Emisor.FieldByName('CVE_EMISOR_EXT').MasterField:='CVE_EMISOR_EXT';}

      Proveedor := TCrProveed.Create(Self);
      Proveedor.MasterSource:=Self;      StpName  := ' ';
      Proveedor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
      Proveedor.FieldByName('ID_ACREDITADO').MasterField:='ID_PROVEEDOR';

      Promotor := TEmpleado.Create(Self);
      Promotor.FilterBy := fbTMPersonaEmpleado;
      Promotor.MasterSource := Self;
      Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
      Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;
      ContratoCre.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';
      ContratoCre.FieldByName('FOL_CONTRATO').MasterField:='FOL_CONTRATO';

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Documento := TCrDocto.Create(Self);
      Documento.MasterSource:=Self;
      Documento.FieldByName('ID_DOCUMENTO').MasterField:='ID_DOCUMENTO';

      Empresa := TEmpresa.Create(Self);
      Empresa.MasterSource:=Self;

      UnidadNegocio := TUnNegocio.Create(Self);
      UnidadNegocio.MasterSource:=Self;

      MInstDesc:= TMInstDesc.Create(Self);
      MInstDesc.MasterSource:=Self;

      UseQuery := False;
      HelpFile := 'IntMReEmiPro.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMReEmiPro.Destroy;
begin
   if Moneda <> nil then
      Moneda.Free;
   if Emisor <> nil then
      Emisor.Free;
   if Proveedor <> nil then
      Proveedor.Free;
   if Promotor <> nil then
      Promotor.Free;
   if ContratoCre <> nil then
      ContratoCre.Free;
   if Credito <> nil then
      Credito.Free;
   if documento <> nil then
      documento.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   if MInstDesc <> nil then
      MInstDesc.Free;
   inherited;
end;


function TMReEmiPro.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMReEmiPro;
begin
   W:=TwMReEmiPro.Create(Self);
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


Function TMReEmiPro.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TMReEmiPro.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TwMReEmiPro.AsignaEmpresaSuc;
begin
     Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);
    if  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) then
    begin
         CBSucursal.Checked := True;
    end;

    EdIdEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
    bbEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';

    EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    BBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    CBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';

end;

procedure TwMReEmiPro.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      dtpLiqF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpLiqF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpComF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpComF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresa;

      edLiqF_INICIO.text:=FormatDateTime('dd/mm/yyyy',dtpLiqF_INICIO.DateTime);
      edLiqF_FINAL.text:=FormatDateTime('dd/mm/yyyy',dtpLiqF_FINAL.DateTime);
      edComF_INICIO.text:=FormatDateTime('dd/mm/yyyy',dtpComF_INICIO.DateTime);
      edComF_FINAL.text:=FormatDateTime('dd/mm/yyyy',dtpComF_FINAL.DateTime);
      chbxF_Com.Checked := True;
      chbxF_Liq.Checked := True;


      Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);
      edDESC_MONEDA.Hint := Objeto.Moneda.Desc_Moneda.AsString;
      edDESC_MONEDA.ShowHint := True;

      Objeto.Emisor.ID_ACREDITADO.Control := edID_EMISOR;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOM_EMISOR;
      Objeto.Emisor.GetParams(Objeto);
      edNOM_EMISOR.Hint := Objeto.Emisor.Acreditado.Persona.Nombre.AsString;
      edNOM_EMISOR.ShowHint := True;

      Objeto.Proveedor.ID_ACREDITADO.Control := edID_PROVEEDOR;
      Objeto.Proveedor.Persona.Nombre.Control := edNOM_PROVEEDOR;
      Objeto.Proveedor.ID_PROV_EXTERNO.Control := edID_PROV_EXTERNO;
      Objeto.Proveedor.GetParams(Objeto);
      edNOM_PROVEEDOR.Hint := Objeto.Proveedor.Persona.Nombre.AsString;
      edNOM_PROVEEDOR.ShowHint := True;

      Objeto.Promotor.ID_Persona.Control :=edID_PROMOTOR;
      Objeto.Promotor.Persona.Nombre.Control :=edNOM_PROMOTOR;
      Objeto.Promotor.GetParams(Objeto);
      edNOM_PROMOTOR.Hint := Objeto.Promotor.Persona.Nombre.AsString;
      edNOM_PROMOTOR.ShowHint := True;

      Objeto.ContratoCre.ID_CONTRATO.Control := iedID_CONTRATO;
      Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO;
      Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control :=edDESC_PRODUCTO;
      edDESC_PRODUCTO.Hint := Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO.ShowHint := True;

      Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edNOM_ACREDITADO;
      Objeto.Credito.GetParams(Objeto);
      edNOM_ACREDITADO.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edNOM_ACREDITADO.ShowHint := True;

      Objeto.Documento.Docto.TipoDocto.CVE_DOCUMENTO.Control := edTIPO_DOCTO;
      Objeto.Documento.Docto.TipoDocto.DESC_DOCUMENTO.Control := edDESC_TIPO_DOCTO;
      Objeto.Documento.GetParams(Objeto);
      edTIPO_DOCTO.Hint := Objeto.Documento.Docto.TipoDocto.DESC_DOCUMENTO.AsString;
      edTIPO_DOCTO.ShowHint := True;

      Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
      Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      Objeto.Empresa.GetParams(Objeto);

      Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
      Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
      Objeto.UnidadNegocio.GetParams(Objeto);
      AsignaEmpresaSuc;

      Objeto.MInstDesc.CVE_FND_ENT_DES.Control:= edCVE_FND_ENT_DES;
      Objeto.MInstDesc.DESC_ENT_DES.Control:= edDESC_ENT_DES;
      Objeto.MInstDesc.GetParams(Objeto);

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TwMReEmiPro.FormDestroy(Sender: TObject);
begin
   Objeto.Moneda.Cve_Moneda.Control := nil;
   Objeto.Moneda.Desc_Moneda.Control := nil;
   Objeto.Emisor.ID_ACREDITADO.Control := nil;
   Objeto.Emisor.Acreditado.Persona.Nombre.Control := nil;
   Objeto.Proveedor.ID_ACREDITADO.Control := nil;
   Objeto.Proveedor.Persona.Nombre.Control := nil;
   Objeto.Proveedor.ID_PROV_EXTERNO.Control := nil;
   Objeto.Promotor.Persona.Nombre.Control :=nil;
   Objeto.Promotor.Id_Persona.Control :=nil;
   Objeto.ContratoCre.ID_CONTRATO.Control := nil;
   Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control :=nil;
   Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control :=nil;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
   Objeto.Credito.ID_CREDITO.Control := nil;
   Objeto.Documento.Docto.TipoDocto.CVE_DOCUMENTO.Control := nil;
   Objeto.Documento.Docto.TipoDocto.DESC_DOCUMENTO.Control := nil;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
   Objeto.MInstDesc.CVE_FND_ENT_DES.Control:= nil;
   Objeto.MInstDesc.DESC_ENT_DES.Control:= nil;
end;

procedure TwMReEmiPro.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMReEmiPro.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMReEmiPro.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWNinguno.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TwMReEmiPro.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   If Objeto.Moneda.Busca Then Begin
      chbxMoneda.Checked:=True;
      chbxMoneda.Enabled:=True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMReEmiPro.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMReEmiPro.ilMONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) then Begin
      chbxMoneda.Checked:=True;
      chbxMoneda.Enabled:=True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMReEmiPro.edCVE_MONEDAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
end;

procedure TwMReEmiPro.btEMISORClick(Sender: TObject);
begin
   If edCVE_FND_ENT_DES.Text <> '' Then Begin
      Objeto.Emisor.BuscaWhereString := ' CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + edCVE_FND_ENT_DES.Text + #39;
      Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;
   End;

   Objeto.Emisor.ShowAll := True;
   If Objeto.Emisor.Busca Then Begin
      chbxEmisor.Checked:=True;
      chbxEmisor.Enabled:=True;
      InterForma1.NextTab(edID_EMISOR);
   End;
end;

procedure TwMReEmiPro.ilEMISORCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMReEmiPro.ilEMISOREjecuta(Sender: TObject);
begin
   If edCVE_FND_ENT_DES.Text <> '' Then Begin
      Objeto.Emisor.BuscaWhereString := ' CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + edCVE_FND_ENT_DES.Text + #39 ;
      Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;
   End;

   If Objeto.Emisor.FindKeyNear([ilEMISOR.Buffer],['ID_ACREDITADO']) Then Begin
      chbxEmisor.Checked:=True;
      chbxEmisor.Enabled:=True;
      InterForma1.NextTab(edID_EMISOR);
   End;
end;

procedure TwMReEmiPro.btPROVEEDORClick(Sender: TObject);
Var vlMensaje :String;
begin
   If edCVE_FND_ENT_DES.Text <> '' Then Begin
      Objeto.Proveedor.BuscaWhereString := ' CR_PROVEEDOR.CVE_FND_ENT_DES = ' + #39 + edCVE_FND_ENT_DES.Text + #39;
      Objeto.Proveedor.FilterString := Objeto.Proveedor.BuscaWhereString;
   End;

   Objeto.Proveedor.ShowAll := True;
   If Objeto.Proveedor.Busca Then Begin
      chbxProveedor.Checked:=True;
      chbxProveedor.Enabled:=True;
        //EASA  REQ. 20007 - 07 / 018   CARTERA IMPAGADA
        InterForma1.NextTab(edID_EMISOR);
        InterForma1.MsgPanel.Caption := '';
        InterForma1.MsgPanel.Color := clBtnFace;
        InterForma1.MsgPanel.Font.Color := clWhite;
        if not ( FindDispIMPProv(Objeto.Proveedor.ID_ACREDITADO.AsInteger,Objeto.Apli, vlMensaje)) then
        Begin
           InterForma1.MsgPanel.Caption := vlMensaje;
           InterForma1.MsgPanel.Color := clRed;
           InterForma1.MsgPanel.Font.Color := clWhite;
           if MessageDlg(vlMensaje + ', desea ver el detalle?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Begin
              Objeto.DetImpagado := TCrCartrIm.Create(self);
              Try
                Objeto.DetImpagado.Apli:= Objeto.Apli;
                Objeto.DetImpagado.ID_ACREDITADO.AsString := Objeto.Proveedor.ID_ACREDITADO.ASstring;
                Objeto.DetImpagado.NOM_ACREDITADO.AsString := Objeto.Proveedor.Persona.nombre.asstring;
                Objeto.DetImpagado.TIPO_CLIENTE.AsString := 'PR';
                Objeto.DetImpagado.ParamCre:=Objeto.ParamCre;
                Objeto.DetImpagado.Catalogo;
              finally
                Objeto.DetImpagado.Free;
              end;
           end;
        end;
        //END EASA
      InterForma1.NextTab(edID_PROVEEDOR);
   End;
end;

procedure TwMReEmiPro.ilPROVEEDORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMReEmiPro.ilPROVEEDOREjecuta(Sender: TObject);
Var vlMensaje :String;
begin
   If edCVE_FND_ENT_DES.Text <> '' Then Begin
      Objeto.Proveedor.BuscaWhereString := ' CR_PROVEEDOR.CVE_FND_ENT_DES = ' + #39 + edCVE_FND_ENT_DES.Text + #39;
      Objeto.Proveedor.FilterString := Objeto.Proveedor.BuscaWhereString;
   End;

  If Objeto.Proveedor.FindKeyNear([ilPROVEEDOR.Buffer],['ID_ACREDITADO']) Then Begin
      chbxProveedor.Checked:=True;
      chbxProveedor.Enabled:=True;
        //EASA  REQ. 20007 - 07 / 018   CARTERA IMPAGADA
        InterForma1.NextTab(edID_EMISOR);
        InterForma1.MsgPanel.Caption := '';
        InterForma1.MsgPanel.Color := clBtnFace;
        InterForma1.MsgPanel.Font.Color := clWhite;
        if not ( FindDispIMPProv(Objeto.Proveedor.ID_ACREDITADO.AsInteger,Objeto.Apli, vlMensaje)) then
        Begin
           InterForma1.MsgPanel.Caption := vlMensaje;
           InterForma1.MsgPanel.Color := clRed;
           InterForma1.MsgPanel.Font.Color := clWhite;
           if MessageDlg(vlMensaje + ', desea ver el detalle?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Begin
              Objeto.DetImpagado := TCrCartrIm.Create(self);
              Try
                Objeto.DetImpagado.Apli:= Objeto.Apli;
                Objeto.DetImpagado.ID_ACREDITADO.AsString := Objeto.Proveedor.ID_ACREDITADO.ASstring;
                Objeto.DetImpagado.NOM_ACREDITADO.AsString := Objeto.Proveedor.Persona.nombre.asstring;
                Objeto.DetImpagado.TIPO_CLIENTE.AsString := 'PR';
                Objeto.DetImpagado.ParamCre:=Objeto.ParamCre;
                Objeto.DetImpagado.Catalogo;
              finally
                Objeto.DetImpagado.Free;
              end;
           end;
        end;
        //END EASA
      InterForma1.NextTab(edID_PROVEEDOR);
   End;

end;

procedure TwMReEmiPro.edID_PROVEEDORExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_PROVEEDOR,True,'',True);
end;

procedure TwMReEmiPro.btPROMOTORClick(Sender: TObject);
begin
   Objeto.Promotor.ShowAll := True;
   If Objeto.Promotor.Busca Then Begin
      chbxPromotor.Checked:=True;
      chbxPromotor.Enabled:=True;
      InterForma1.NextTab(edID_PROMOTOR);
   End;
end;

procedure TwMReEmiPro.ilPROMOTORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMReEmiPro.ilPROMOTOREjecuta(Sender: TObject);
begin
   If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
      chbxPromotor.Checked:=True;
      chbxPromotor.Enabled:=True;
      InterForma1.NextTab(edID_PROMOTOR);
   End;
end;

procedure TwMReEmiPro.edID_PROMOTORExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_PROMOTOR,True,'',True);
end;

procedure TwMReEmiPro.btCONTRATOClick(Sender: TObject);
begin
   //BUSCADOR DE LA CLASE CONTRATO CREDITO
   Objeto.ContratoCre.ShowAll := True;
   If Objeto.ContratoCre.Busca Then Begin
        chbxAutorizacion.Checked:=True;
        chbxAutorizacion.Enabled:=True;
      InterForma1.NextTab(btCONTRATO);
   End;
end;

procedure TwMReEmiPro.ilIDCONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show := True;
end;

procedure TwMReEmiPro.iedID_CONTRATOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(iedID_CONTRATO,True,'',True);
end;

procedure TwMReEmiPro.ilIDCONTRATOEjecuta(Sender: TObject);
begin
   If Objeto.ContratoCre.FindKey([ilIDCONTRATO.Buffer,'1']) Then Begin
      chbxAutorizacion.Checked:=True;
      chbxAutorizacion.Enabled:=True;
      InterForma1.NextTab(iedID_CONTRATO);
   End;
end;

procedure TwMReEmiPro.btCREDITOClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   If Objeto.Credito.Busca Then Begin
      chbxDisposicion.Checked:=True;
      chbxDisposicion.Enabled:=True;
      InterForma1.NextTab(edID_CREDITO);
   End;
end;

procedure TwMReEmiPro.ilCREDITOCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMReEmiPro.ilCREDITOEjecuta(Sender: TObject);
begin
   If Objeto.Credito.FindKey([ilCREDITO.Buffer]) Then Begin
      chbxDisposicion.Checked:=True;
      chbxDisposicion.Enabled:=True;
      InterForma1.NextTab(edID_CREDITO);
   End;
end;

procedure TwMReEmiPro.edID_CREDITOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CREDITO,True,'',True);
end;

procedure TwMReEmiPro.chbxF_LiqClick(Sender: TObject);
begin
    If not chbxF_Liq.Checked Then Begin
        edLiqF_INICIO.Text:='';
        edLiqF_FINAL.Text:='';
        chbxF_Liq.Checked:=False;
        chbxF_Liq.Enabled:=False;
    End;
end;
procedure TwMReEmiPro.chbxMonedaClick(Sender: TObject);
begin
    If not chbxMoneda.Checked Then Begin
        Objeto.Moneda.Active:=False;
        chbxMoneda.Checked:=False;
        chbxMoneda.Enabled:=False;
    End Else Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
    End;
end;

procedure TwMReEmiPro.chbxF_ComClick(Sender: TObject);
begin
    If not chbxF_Com.Checked Then Begin
        edComF_INICIO.Text:='';
        edComF_FINAL.Text:='';
        chbxF_Com.Checked:=False;
        chbxF_Com.Enabled:=False;
    End;
end;

procedure TwMReEmiPro.chbxEmisorClick(Sender: TObject);
begin
    If not chbxEmisor.Checked Then Begin
        Objeto.Emisor.Active:=False;
        chbxEmisor.Checked:=False;
        chbxEmisor.Enabled:=False;
    End Else Begin
        chbxEmisor.Checked:=True;
        chbxEmisor.Enabled:=True;
    End;
end;

procedure TwMReEmiPro.chbxProveedorClick(Sender: TObject);
begin
    If not chbxProveedor.Checked Then Begin
        Objeto.Proveedor.Active:=False;
        chbxProveedor.Checked:=False;
        chbxProveedor.Enabled:=False;
    End Else Begin
        chbxProveedor.Checked:=True;
        chbxProveedor.Enabled:=True;
    End;
end;

procedure TwMReEmiPro.chbxPromotorClick(Sender: TObject);
begin
    If not chbxPromotor.Checked Then Begin
        Objeto.Promotor.Active:=False;
        chbxPromotor.Checked:=False;
        chbxPromotor.Enabled:=False;
    End Else Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
    End;
end;

procedure TwMReEmiPro.chbxAutorizacionClick(Sender: TObject);
begin
    If not chbxAutorizacion.Checked Then Begin
        Objeto.ContratoCre.Active:=False;
        chbxAutorizacion.Checked:=False;
        chbxAutorizacion.Enabled:=False;
    End Else Begin
        chbxAutorizacion.Checked:=True;
        chbxAutorizacion.Enabled:=True;
    End;
end;

procedure TwMReEmiPro.chbxDisposicionClick(Sender: TObject);
begin
    If not chbxDisposicion.Checked Then Begin
        Objeto.Credito.Active:=False;
        chbxDisposicion.Checked:=False;
        chbxDisposicion.Enabled:=False;
    End else Begin
        chbxDisposicion.Checked:=True;
        chbxDisposicion.Enabled:=True;
    End;
end;

procedure TwMReEmiPro.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMREEMIPRO_PREVI',True,True) then
      ImprimirReporte(True);
end;

procedure TwMReEmiPro.edLiqF_INICIOChange(Sender: TObject);
begin
    If Trim(edLiqF_INICIO.Text)<>'' Then Begin
        chbxF_Liq.Checked:=True;
        chbxF_Liq.Enabled:=True;
    End Else If Trim(edLiqF_FINAL.Text)='' Then Begin
        chbxF_Liq.Checked:=False;
        chbxF_Liq.Enabled:=False;
    End;
end;

procedure TwMReEmiPro.edLiqF_FINALChange(Sender: TObject);
begin
    If Trim(edLiqF_FINAL.Text)<>'' Then Begin
        chbxF_Liq.Checked:=True;
        chbxF_Liq.Enabled:=True;
    End Else If Trim(edLiqF_INICIO.Text)='' Then Begin
        chbxF_Liq.Checked:=False;
        chbxF_Liq.Enabled:=False;
    End;
end;

procedure TwMReEmiPro.edComF_INICIOChange(Sender: TObject);
begin
    If Trim(edComF_INICIO.Text)<>'' Then Begin
        chbxF_Com.Checked:=True;
        chbxF_Com.Enabled:=True;
    End Else If Trim(edComF_FINAL.Text)='' Then Begin
        chbxF_Com.Checked:=False;
        chbxF_Com.Enabled:=False;
    End;
end;

procedure TwMReEmiPro.edComF_FINALChange(Sender: TObject);
begin
    If Trim(edComF_FINAL.Text)<>'' Then Begin
        chbxF_Com.Checked:=True;
        chbxF_Com.Enabled:=True;
    End Else If Trim(edComF_INICIO.Text)='' Then Begin
        chbxF_Com.Checked:=False;
        chbxF_Com.Enabled:=False;
    End;
end;

procedure TwMReEmiPro.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMREEMIPRO_IMPRI',True,True) then
      ImprimirReporte(False);
end;
Procedure TwMReEmiPro.ImprimirReporte(bPreview:Boolean);
Var
   sSituacion,sOrden:String;
   iSit :Integer;
   vlOper : Integer; //ALES
   vlOperadoNafin : String;
begin
   iSit:=rgSituacion.ItemIndex;
   case iSit of
       0: sSituacion:='';  //Todos
       1: sSituacion:='AC';  //Activos
       2: sSituacion:='NA';  //En transito
       3: sSituacion:='LQ';  //Liquidados
       4: sSituacion:='IM';  //Impagados
       5: sSituacion:='CA';  //Cancelados
       6: sSituacion:='AC'',''IM';  //Activos + Impagados
   end;
   iSit:=rgOrden.ItemIndex;
   case iSit of
       0: sOrden:='C';   //Crédito
       1: sOrden:='P'; //Persona
   end;
   //ALES----
   vlOper:= rgOPERADOPOR.ItemIndex;
   case vlOper of
       0: vlOperadoNafin:='';   //Crédito
       1: vlOperadoNafin:='V'; //Persona
   end;
   RepRelDocEmiPro(edLiqF_INICIO.Text   , edLiqF_FINAL.Text  , edComF_INICIO.Text,
                   edComF_FINAL.Text    , edCVE_MONEDA.Text  , edID_EMISOR.Text,
                   edID_PROVEEDOR.Text  , edID_PROMOTOR.Text , iedID_CONTRATO.Text,
                   edID_CREDITO.Text    , edTIPO_DOCTO.Text  ,
                   EdIdEmpresa.Text     , EdIDSucursal.Text  ,
                   chbxOrigRec.Checked  , chbxPromAdmin.Checked, chbxTipoSector.Checked,
                   sSituacion           , sOrden               , vlOperadoNafin     ,
                   edCVE_FND_ENT_DES.Text, edNbrArch.Text , Objeto.Apli,
                   bPreview);

    If Trim(edNbrArch.Text)<>'' Then Begin
       If bGenArch Then
         ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
       Else
         ShowMessage('No se generó el Archivo')
    End;

End;
procedure TwMReEmiPro.btTIPO_DOCTOClick(Sender: TObject);
begin
   Objeto.Documento.Docto.TipoDocto.ShowAll := True;
   if Objeto.Documento.Docto.TipoDocto.Busca then begin
        cbTIPO_DOCTO.Checked:=True;
        cbTIPO_DOCTO.Enabled:=True;
        InterForma1.NextTab(edTIPO_DOCTO);
   End;
end;

procedure TwMReEmiPro.ilTIPO_DOCTOEjecuta(Sender: TObject);
begin
   if Objeto.Documento.Docto.TipoDocto.FindKey([ilTIPO_DOCTO.Buffer]) then begin
        cbTIPO_DOCTO.Checked:=True;
        cbTIPO_DOCTO.Enabled:=True;
        InterForma1.NextTab(edTIPO_DOCTO);
   End;
end;

procedure TwMReEmiPro.ilTIPO_DOCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMReEmiPro.cbTIPO_DOCTOClick(Sender: TObject);
begin
   If not cbTIPO_DOCTO.Checked Then Begin
      Objeto.Documento.Active:=False;
      cbTIPO_DOCTO.Checked:=False;
      cbTIPO_DOCTO.Enabled:=False;
   End Else Begin
      cbTIPO_DOCTO.Checked:=True;
      cbTIPO_DOCTO.Enabled:=True;
   End;
end;

Procedure TwMReEmiPro.Archivo;
var
    cadenSQL,vlCadena,vlCadenaX,vlCadenaA,vlCadenaB,vlCadenaC,vlCadenaD,vlCadenaE,vlCadenaF,vlCadenaG  : String;
    sSituacion,sOrden:String;
    iSit :Integer;
    vlOper : Integer; //ALES
    vlOperadoNafin : String;
    VlProveedor, VLEmisor : String;
    vlArchivo : TextFile;
    VLNominalE, VLInteresE, VLIVAE : Double;
    VLNominalP, VLInteresP, VLIVAP : Double;
begin

     sdAviso.Execute;
     if (sdAviso.FileName = '') then
     begin
          MessageDlg('Debe indicar un nombre de archivo',mtError,[mbOK],0);
          exit;
     end;


    iSit:=rgSituacion.ItemIndex;
    case iSit of
        0: sSituacion:='';  //Todos
        1: sSituacion:='AC';  //Activos
        2: sSituacion:='NA';  //En transito
        3: sSituacion:='LQ';  //Liquidados
        4: sSituacion:='IM';  //Impagados
        5: sSituacion:='CA';  //Cancelados
    end;

    //ALES----
    vlOper:=rgOPERADOPOR.ItemIndex;
    case vlOper of
        0: vlOperadoNafin:='';   //Crédito
        1: vlOperadoNafin:='V'; //Persona
    end;

     //TOTAL DE REGISTROS
     cadenSQL :=
        ' SELECT ' +
        ' CD.ID_CESION, ' +
        ' CD.ID_DOCUMENTO, ' +
        ' CD.IMP_NOMINAL, ' +
        ' CD.F_COMPRA, ' +
        ' CCA.PLAZO, ' +
        ' CCA.F_VENCIMIENTO, ' +
        ' 0 IMP_INTERES, ' +
        ' 0 IMP_IVA, ' +
        ' PE.NOMBRE NOMBRE_EMISOR, ' +
        ' PP.NOMBRE NOMBRE_PROVEEDOR ' +
        ' FROM ' +
        ' CR_DOCUMENTO  CD, ' +
        ' CR_CAPITAL    CCA, ' +
//        ' CR_INTERES    CCI, ' +
        ' CR_CESION     CCE, ' +
        ' PERSONA       PE, ' +
        ' PERSONA       PP, ' +
        ' CR_CREDITO    CC '+
        ' WHERE CCA.ID_CREDITO = CD.ID_CESION ' +
        ' AND   CCA.NUM_PERIODO = CD.NUM_PERIODO_DOC '+
        ' AND   CCA.SIT_CAPITAL = ' + #39 + 'AC' + #39;

    If (Trim(edLiqF_INICIO.Text)<>'')And(Trim(edLiqF_FINAL.Text)<>'') Then Begin
        cadenSQL:= cadenSQL + ' AND CCA.F_VENCIMIENTO BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edLiqF_INICIO.Text))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edLiqF_FINAL.Text))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(edLiqF_INICIO.Text)<>'')And(Trim(edLiqF_FINAL.Text)='') Then Begin
         cadenSQL:= cadenSQL + ' AND CCA.F_VENCIMIENTO > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edLiqF_INICIO.Text))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(edLiqF_INICIO.Text)='')And(Trim(edLiqF_FINAL.Text)<>'') Then Begin
        cadenSQL:= cadenSQL + ' AND CCA.F_VENCIMIENTO < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edLiqF_FINAL.Text))+
        ''',''DD/MM/YYYY'')';
    End;

{     cadenSQL := cadenSQL +
        ' AND   CCI.ID_CREDITO (+)= CD.ID_CESION ' +
        ' AND   CCI.NUM_PERIODO (+)= CD.NUM_PERIODO_DOC ' +
        ' AND   CCI.SIT_INTERES = ' + #39 + 'AC' + #39;

    If (Trim(edLiqF_INICIO.Text)<>'')And(Trim(edLiqF_FINAL.Text)<>'') Then Begin
        cadenSQL:= cadenSQL + ' AND CCI.F_VENCIMIENTO BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edLiqF_INICIO.Text))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edLiqF_FINAL.Text))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(edLiqF_INICIO.Text)<>'')And(Trim(edLiqF_FINAL.Text)='') Then Begin
         cadenSQL:= cadenSQL + ' AND CCI.F_VENCIMIENTO > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edLiqF_INICIO.Text))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(edLiqF_INICIO.Text)='')And(Trim(edLiqF_FINAL.Text)<>'') Then Begin
        cadenSQL:= cadenSQL + ' AND CCI.F_VENCIMIENTO < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edLiqF_FINAL.Text))+
        ''',''DD/MM/YYYY'')';
    End;
}

     cadenSQL := cadenSQL +
        ' AND   CCE.ID_CESION = CD.ID_CESION ' +
        ' AND   PE.ID_PERSONA = CCE.ID_EMISOR ' +
        ' AND   PP.ID_PERSONA = CCE.ID_PROVEEDOR ' +
        ' AND   CC.ID_CREDITO = CD.ID_CESION ';

    If (Trim(edID_EMISOR.Text)<>'') Then
        cadenSQL:= cadenSQL + ' AND   CCE.ID_EMISOR  ='+edID_EMISOR.Text;
    If (Trim(edID_PROVEEDOR.Text)<>'') Then
        cadenSQL:= cadenSQL + ' AND CCE.ID_PROVEEDOR  ='+ edID_PROVEEDOR.Text;
    If (Trim(edID_PROMOTOR.Text)<>'') Then
        cadenSQL:= cadenSQL + ' AND   CC.ID_PROM_ADM  ='+ edID_PROMOTOR.Text;
    If (Trim(edID_CREDITO.Text)<>'') Then
        cadenSQL:= cadenSQL + ' AND   CC.ID_CREDITO   ='+ edID_CREDITO.Text;
    If (Trim(sSituacion)<>'') Then
        cadenSQL:= cadenSQL + ' AND   CD.SIT_DOCUMENTO='''+ sSituacion +'''';
    If (Trim(vlOperadoNafin)<>'') Then
        cadenSQL:= cadenSQL + ' AND   CCE.B_OPERADO_NAFIN='''+ vlOperadoNafin +'''';

     cadenSQL := cadenSQL + 'ORDER BY NOMBRE_EMISOR, NOMBRE_PROVEEDOR , CC.ID_CREDITO,  CD.ID_DOCUMENTO, CCA.F_VENCIMIENTO';

     qMovimientos.close;
     qMovimientos.SQL.text:=cadenSQL;
     qMovimientos.DatabaseName:=Objeto.Apli.DataBaseName;
     qMovimientos.SessionName:=Objeto.Apli.SessionName;
     qMovimientos.Open;
     try
        AssignFile(vlArchivo,sdAviso.FileName);
        Rewrite(vlArchivo);
        VlProveedor := '';
        VLEmisor := '';
        vlCadenaX := '';
        vlCadenaA := '';
        vlCadenaB := '';
        vlCadenaC := '';
        vlCadenaD := '';
        vlCadenaE := '';
        vlCadenaF := '';
        vlCadenaG := '';
        VLNominalE := 0;
        VLInteresE := 0;
        VLIVAE := 0;
        VLNominalP := 0;
        VLInteresP := 0;
        VLIVAP := 0;
        Writeln(vlArchivo,'BANCO INTERACCIONES S.A.');
        Writeln(vlArchivo,'');
        Writeln(vlArchivo,'REPORTE DE VENCIMIENTOS PERIODO DEL : ' + edLiqF_INICIO.Text + ' AL ' + edLiqF_FINAL.Text);
        Writeln(vlArchivo,' ');
        Writeln(vlArchivo,' ');
        while not qMovimientos.eof do
        begin

           if VLEmisor <> qMovimientos.FieldByName('NOMBRE_EMISOR').AsString then
           begin
               Writeln(vlArchivo,' ');
               vlCadena :=  'EMISOR : ' + qMovimientos.FieldByName('NOMBRE_EMISOR').AsString;
               Writeln(vlArchivo,vlCadena);
               VLNominalE := 0;
               VLInteresE := 0;
               VLIVAE := 0;
               VLNominalP := 0;
               VLInteresP := 0;
               VLIVAP := 0;
           end;
           if  VlProveedor <> qMovimientos.FieldByName('NOMBRE_PROVEEDOR').AsString then
           begin
               Writeln(vlArchivo,' ');
               vlCadena :=  '  PROVEEDOR : ' + qMovimientos.FieldByName('NOMBRE_PROVEEDOR').AsString;
               Writeln(vlArchivo,vlCadena);
               VLNominalP := 0;
               VLInteresP := 0;
               VLIVAP := 0;

//                               1234567890 12345678901234567890 1234567890123456 1234567890 12345 1234567890 1234567890123456 1234567890123456

               vlCadena :=  '     CREDITO       No DOCUMENTO      IMPORTE NOMINAL  F COMPRA  PLAZO  F VENTO   IMPORTE INTERES  IVA DE INTERES';
               Writeln(vlArchivo,vlCadena);
           end;

           VLNominalE := VLNominalE + qMovimientos.FieldByName('IMP_NOMINAL').AsFloat;
           VLInteresE := VLInteresE + qMovimientos.FieldByName('IMP_INTERES').AsFloat;
           VLIVAE := VLIVAE + qMovimientos.FieldByName('IMP_IVA').AsFloat;
           VLNominalP := VLNominalP + qMovimientos.FieldByName('IMP_NOMINAL').AsFloat;
           VLInteresP := VLInteresP + qMovimientos.FieldByName('IMP_INTERES').AsFloat;
           VLIVAP := VLIVAP + qMovimientos.FieldByName('IMP_IVA').AsFloat;

           vlCadenaX :=  qMovimientos.FieldByName('ID_CESION').AsString + '                      ';
           vlCadenaX :=  copy(vlCadenaX,1,10);

           vlCadenaA :=  qMovimientos.FieldByName('ID_DOCUMENTO').AsString + '                      ';
           vlCadenaA :=  copy(vlCadenaA,1,20);

           vlCadenaB :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',qMovimientos.FieldByName('IMP_NOMINAL').AsFloat);
           vlCadenaB := copy(vlCadenaB,length(vlCadenaB)- 15,16);

           vlCadenaC := qMovimientos.FieldByName('F_COMPRA').AsString;

           vlCadenaD :=  '               ' + qMovimientos.FieldByName('PLAZO').AsString;
           vlCadenaD := copy(vlCadenaD,length(vlCadenaD)- 4,5);

           vlCadenaE := qMovimientos.FieldByName('F_VENCIMIENTO').AsString;

           vlCadenaF :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',qMovimientos.FieldByName('IMP_INTERES').AsFloat);
           vlCadenaF := copy(vlCadenaF,length(vlCadenaF)- 15,16);

           vlCadenaG :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',qMovimientos.FieldByName('IMP_IVA').AsFloat);
           vlCadenaG := copy(vlCadenaG,length(vlCadenaG)- 15,16);

           Writeln(vlArchivo,'    '+vlCadenaX+' '+vlCadenaA+' '+vlCadenaB+' '+vlCadenaC+' '+vlCadenaD+' '+vlCadenaE+' '+vlCadenaF+' '+vlCadenaG);

           vlCadenaX := '';
           vlCadenaA := '';
           vlCadenaB := '';
           vlCadenaC := '';
           vlCadenaD := '';
           vlCadenaE := '';
           vlCadenaF := '';
           vlCadenaG := '';

           VLEmisor := qMovimientos.FieldByName('NOMBRE_EMISOR').AsString;
           VlProveedor := qMovimientos.FieldByName('NOMBRE_PROVEEDOR').AsString;

           qMovimientos.next;

           if  ((VlProveedor <> qMovimientos.FieldByName('NOMBRE_PROVEEDOR').AsString) or (qMovimientos.eof)) then
           begin
                 vlCadenaB :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',VLNominalP);
                 vlCadenaB := copy(vlCadenaB,length(vlCadenaB)- 15,16);

                 vlCadenaF :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',VLInteresP);
                 vlCadenaF := copy(vlCadenaF,length(vlCadenaF)- 15,16);

                 vlCadenaG :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',VLIVAP);
                 vlCadenaG := copy(vlCadenaG,length(vlCadenaG)- 15,16);
                 Writeln(vlArchivo,'    '+'TOTAL     '+' '+'PROVEEDOR:          '+' '+vlCadenaB+' '+'          '+' '+'     '+' '+'          '+' '+vlCadenaF+' '+vlCadenaG);
                 vlCadenaB := '';
                 vlCadenaF := '';
                 vlCadenaG := '';
           end;
           if ((VLEmisor <> qMovimientos.FieldByName('NOMBRE_EMISOR').AsString) or (qMovimientos.eof)) then
           begin
                 vlCadenaB :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',VLNominalE);
                 vlCadenaB := copy(vlCadenaB,length(vlCadenaB)- 15,16);

                 vlCadenaF :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',VLInteresE);
                 vlCadenaF := copy(vlCadenaF,length(vlCadenaF)- 15,16);

                 vlCadenaG :=  '                         ' + FormatFloat('###,###,###,###,###,##0.00',VLIVAE);
                 vlCadenaG := copy(vlCadenaG,length(vlCadenaG)- 15,16);
                 Writeln(vlArchivo,'    '+'TOTAL     '+' '+'EMISOR:             '+' '+vlCadenaB+' '+'          '+' '+'     '+' '+'          '+' '+vlCadenaF+' '+vlCadenaG);
                 Writeln(vlArchivo,'___________________________________________________________________________________________________________________________________________ ');
                 vlCadenaB := '';
                 vlCadenaF := '';
                 vlCadenaG := '';
           end;
        end;
        CloseFile(vlArchivo);
     except
           Messagedlg('Error al generar archivo. Vuelva a intentarlo',mtError,[mbOK],0);
           CloseFile(vlArchivo);
     end;
     qMovimientos.close;
end;

procedure TwMReEmiPro.Button1Click(Sender: TObject);
begin
   Archivo;
end;

procedure TwMReEmiPro.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMReEmiPro.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMReEmiPro.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMReEmiPro.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMReEmiPro.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMReEmiPro.edCVE_FND_ENT_DESExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   If ((Objeto.Modo = moInActive)) Then Begin
      VLMesg     := '';
      VLSalida := True;
      If edCVE_FND_ENT_DES.Text = '' Then Begin
         VLSalida  := False;
         VLMesg    := 'Favor de Indicar la Entidad Descontadora';
      End;
      InterForma1.ValidaExit(edCVE_FND_ENT_DES,VLSalida,VLMesg,True);
   end;
end;

procedure TwMReEmiPro.btnCVE_FND_ENT_DESClick(Sender: TObject);
begin
   Objeto.MInstDesc.ShowAll := True;
   If Objeto.MInstDesc.Busca Then Begin
      cbxCVE_FND_ENT_DES.Checked:=True;
      cbxCVE_FND_ENT_DES.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TwMReEmiPro.cbxCVE_FND_ENT_DESClick(Sender: TObject);
begin
   If not cbxCVE_FND_ENT_DES.Checked Then Begin
      Objeto.MInstDesc.Active:=False;
      cbxCVE_FND_ENT_DES.Checked:=False;
      cbxCVE_FND_ENT_DES.Enabled:=False;
   End Else Begin
      cbxCVE_FND_ENT_DES.Checked:=True;
      cbxCVE_FND_ENT_DES.Enabled:=True;
   End;
end;

procedure TwMReEmiPro.ilCVE_FND_ENT_DESCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMReEmiPro.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   If Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) then Begin
      cbxCVE_FND_ENT_DES.Checked:=True;
      cbxCVE_FND_ENT_DES.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TwMReEmiPro.edID_EMISORExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_EMISOR,True,'',True);
end;

procedure TwMReEmiPro.edTIPO_DOCTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edTIPO_DOCTO,True,'',True);
end;


procedure TwMReEmiPro.sbExcelClick(Sender: TObject);
var sExt:String;
begin
   If sdArchivoExcel.Execute Then Begin
      sExt:= copy(sdArchivoExcel.FileName,Length(sdArchivoExcel.FileName)-3,Length(sdArchivoExcel.FileName));
      If  UpperCase(sExt)= '.PRN' Then
         edNbrArch.Text := sdArchivoExcel.FileName
      Else
         edNbrArch.Text := sdArchivoExcel.FileName + '.prn';
   End Else
      edNbrArch.Text := '';
end;

procedure TwMReEmiPro.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
      cbxArchivo.Checked:=True;
      cbxArchivo.Enabled:=True;
   End Else Begin
      cbxArchivo.Checked:=False;
      cbxArchivo.Enabled:=False;
   End;
end;

procedure TwMReEmiPro.cbxArchivoClick(Sender: TObject);
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

