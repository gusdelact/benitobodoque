// Sistema         : Clase de TMInfCobr
// Fecha de Inicio : 01/10/2003
// Función forma   : Clase de TMInfCobr
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMInfCobr;    
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntMon,           //Moneda
IntMPers,         //PromotorAsoc
IntEmple,
IntParamCre,
IntCrProduct,     //Producto de crédito
IntCrAcredit,     //Acreditado
IntCrCredito,     //Disposición
IntMQrInfCobr,    //Reporte
Intempre,         //Empresa
IntMProdGpo,      //Grupo de Producto
IntUnNeg          //Unidad Negocio/Suc
;

Type
 TMInfCobr= class;

  TwMInfCobr=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    ilMONEDA: TInterLinkit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    lbID_PROMOTOR: TLabel;
    edID_PROMOTOR: TEdit;
    btPROMOTOR: TBitBtn;
    ilPROMOTOR: TInterLinkit;
    edNOM_PROMOTOR: TEdit;
    Label7: TLabel;
    rgSitMov: TRadioGroup;
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
    chbxPromotor: TCheckBox;
    chbxPromAmon: TCheckBox;
    edNOM_PROM: TEdit;
    btPROM_ADMON: TBitBtn;
    ilPromAdmon: TInterLinkit;
    lbCVE_PRODUCTO_CRE: TLabel;
    Label1: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilPRODUCTO: TInterLinkit;
    ilACREDITADO: TInterLinkit;
    chbxAcreditado: TCheckBox;
    chbxProducto: TCheckBox;
    dtpF_INICIO: TInterDateTimePicker;
    edF_INICIO: TEdit;
    lbLiqF_INICIO: TLabel;
    rgDetalle: TRadioGroup;
    edID_PROM: TEdit;
    Label2: TLabel;
    chbxCESION: TCheckBox;
    edCESION: TEdit;
    btID_CESION: TBitBtn;
    edID_CESION: TEdit;
    ilCesion: TInterLinkit;
    rgOrden: TRadioGroup;
    chbxTipoSector: TCheckBox;
    Label3: TLabel;
    edF_FINAL: TEdit;
    dtpF_FINAL: TInterDateTimePicker;
    Label4: TLabel;
    edID_CRED_EXT: TEdit;
    btCRED_EXT: TBitBtn;
    edDES_CRED_EXT: TEdit;
    chbxCRED_EXTERNO: TCheckBox;
    ilCRED_EXT: TInterLinkit;
    Label5: TLabel;
    edID_CONTROL_EXT: TEdit;
    btCONTROL_EXT: TBitBtn;
    ilCONTROL_EXT: TInterLinkit;
    ED_DESC_CONTROL: TEdit;
    chbxCONTROL_EXT: TCheckBox;
    rgReporte: TRadioGroup;
    sbExcel: TSpeedButton;
    Label6: TLabel;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
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
    Label9: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edNOM_CVE_PRODUCTO_GPO: TEdit;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    rgTipoDisposicion: TRadioGroup;
    chbxTasas: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure btPROMOTORClick(Sender: TObject);
    procedure ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROMOTOREjecuta(Sender: TObject);
    procedure edID_PROMOTORExit(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure chbxPromotorClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure edACREDITADOExit(Sender: TObject);
    procedure btPROM_ADMONClick(Sender: TObject);
    procedure ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
    procedure ilPromAdmonEjecuta(Sender: TObject);
    procedure edID_PROMExit(Sender: TObject);
    procedure chbxPromAmonClick(Sender: TObject);
    procedure edID_PROMOTORChange(Sender: TObject);
    procedure edID_PROMChange(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure edID_CESIONChange(Sender: TObject);
    procedure edID_CESIONExit(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure btCRED_EXTClick(Sender: TObject);
    procedure ilCRED_EXTEjecuta(Sender: TObject);
    procedure ilCRED_EXTCapture(Sender: TObject; var Show: Boolean);
    procedure chbxCRED_EXTERNOClick(Sender: TObject);
    procedure edID_CRED_EXTChange(Sender: TObject);
    procedure edID_CRED_EXTExit(Sender: TObject);
    procedure btCONTROL_EXTClick(Sender: TObject);
    procedure ilCONTROL_EXTEjecuta(Sender: TObject);
    procedure ilCONTROL_EXTCapture(Sender: TObject; var Show: Boolean);
    procedure edID_CONTROL_EXTChange(Sender: TObject);
    procedure edID_CONTROL_EXTExit(Sender: TObject);
    procedure chbxCONTROL_EXTClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure edCVE_PRODUCTO_GPOExit(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    private
    { Private declarations }
       Procedure ImprimeReporte(bPreview:Boolean);
       Procedure AsignaEmpresaSuc;
       Procedure CambiaControl;
    public
    { Public declarations }
    Objeto : TMInfCobr;
end;
 TMInfCobr= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        Producto                 : TCrProduct;
        Moneda                   : TMoneda;
        Acreditado               : TCrAcredit;
        Promotor                 : TEmpleado; //Promotor Responsable
        PromotorAdmon            : TEmpleado; //Promotor Admon
        Credito                  : TCrCredito;//Disposición
        ParamCre                 : TParamCre;
        CredExt                  : TCrCredito;//Disposición
        CtrlExt                  : TCrCredito;//Disposición
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        GpoProd                  : TMProdGpo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TMInfCobr.Create( AOwner : TComponent );
begin Inherited;
      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='CVE_PRODUCTO_CRE';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Promotor := TEmpleado.Create(Self);
      Promotor.FilterBy := fbTMPersonaEmpleado;
      Promotor.MasterSource := Self;
      Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
      Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      PromotorAdmon := TEmpleado.Create(Self);
      PromotorAdmon.FilterBy := fbTMPersonaEmpleado;
      PromotorAdmon.MasterSource := Self;
      PromotorAdmon.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
      PromotorAdmon.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      CredExt := TCrCredito.Create(Self);
      CredExt.MasterSource:=Self;

      CtrlExt := TCrCredito.Create(Self);
      CtrlExt.MasterSource:=Self;

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      GpoProd:= TMProdGpo.Create(Self);
      GpoProd.MasterSource:=Self;
      GpoProd.FieldByName('CVE_PRODUCTO_GPO').MasterField:='CVE_PRODUCTO_GPO';

      UseQuery := False;
      HelpFile := 'InTMInfCobr.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMInfCobr.Destroy;
begin
   If Producto <> Nil Then
      Producto.Free;
   If Moneda <> Nil Then
      Moneda.Free;
   If Acreditado <> Nil Then
      Acreditado.Free;
   If Promotor <> Nil Then
      Promotor.Free;
   If PromotorAdmon <> Nil Then
      PromotorAdmon.Free;
   If Credito <> Nil Then
      Credito.Free;
   If CredExt  <> Nil Then
      CredExt.Free;
   If CtrlExt <> Nil Then
      CtrlExt.Free;
   If Empresa <> Nil Then
      Empresa.free;
   If UnidadNegocio <> Nil Then
      UnidadNegocio.Free;
   If GpoProd <> Nil Then
      GpoProd.Free;
   inherited;
end;


function TMInfCobr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMInfCobr;
begin
   W:=TwMInfCobr.Create(Self);
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


Function TMInfCobr.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TMInfCobr.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMInfCobr.AsignaEmpresaSuc;
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

procedure TwMInfCobr.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      dtpF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_INICIO.text:=FormatDateTime('dd/mm/yyyy',dtpF_INICIO.DateTime);
      dtpF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_FINAL.text:=FormatDateTime('dd/mm/yyyy',dtpF_FINAL.DateTime);

      Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;
      Objeto.Producto.GetParams(Objeto);
      edDESC_PRODUCTO1.Hint := Objeto.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO1.ShowHint := True;

      Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);
      edDESC_MONEDA.Hint := Objeto.Moneda.Desc_Moneda.AsString;
      edDESC_MONEDA.ShowHint := True;

      Objeto.Promotor.ID_Persona.Control :=edID_PROMOTOR;
      Objeto.Promotor.Persona.Nombre.Control :=edNOM_PROMOTOR;
      Objeto.Promotor.GetParams(Objeto);
      edNOM_PROMOTOR.Hint := Objeto.Promotor.Persona.Nombre.AsString;
      edNOM_PROMOTOR.ShowHint := True;

      Objeto.PromotorAdmon.ID_Persona.Control :=edID_PROM;
      Objeto.PromotorAdmon.Persona.Nombre.Control :=edNOM_PROM;
      Objeto.PromotorAdmon.GetParams(Objeto);
      edNOM_PROM.Hint := Objeto.PromotorAdmon.Persona.Nombre.AsString;
      edNOM_PROM.ShowHint := True;

      Objeto.Credito.ID_CREDITO.Control := edID_CESION;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
      Objeto.Credito.GetParams(Objeto);
      edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edCESION.ShowHint := True;

      Objeto.CredExt.ID_CRED_EXTERNO.Control := edID_CRED_EXT;
      Objeto.CredExt.ContratoCre.Contrato.TITNombre.Control := edDES_CRED_EXT;
      Objeto.CredExt.GetParams(Objeto);
      edID_CRED_EXT.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edID_CRED_EXT.ShowHint := True;

      Objeto.CtrlExt.ID_CONTROL_EXT.Control := edID_CONTROL_EXT;
      Objeto.CtrlExt.ContratoCre.Contrato.TITNombre.Control := ED_DESC_CONTROL;
      Objeto.CtrlExt.GetParams(Objeto);
      edID_CONTROL_EXT.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edID_CONTROL_EXT.ShowHint := True;

      Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
      Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      Objeto.Empresa.GetParams(Objeto);

      Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
      Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
      Objeto.UnidadNegocio.GetParams(Objeto);
      AsignaEmpresaSuc;

      Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
      Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
      Objeto.GpoProd.GetParams(Objeto);
end;

procedure TwMInfCobr.FormDestroy(Sender: TObject);
begin
    Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
    Objeto.Acreditado.ID_ACREDITADO.Control := nil;
    Objeto.Acreditado.Persona.Nombre.Control := nil;
    Objeto.Moneda.Cve_Moneda.Control := nil;
    Objeto.Moneda.Desc_Moneda.Control := nil;
    Objeto.Promotor.Persona.Nombre.Control :=nil;
    Objeto.Promotor.Id_Persona.Control :=nil;
    Objeto.PromotorAdmon.Persona.Nombre.Control :=nil;
    Objeto.PromotorAdmon.Id_Persona.Control :=nil;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
    Objeto.Credito.ID_CREDITO.Control := nil;
    Objeto.CredExt.ID_CRED_EXTERNO.Control := nil;
    Objeto.CredExt.ContratoCre.Contrato.TITNombre.Control := nil;
    Objeto.CtrlExt.ID_CONTROL_EXT.Control := nil;
    Objeto.CtrlExt.ContratoCre.Contrato.TITNombre.Control := nil;
    Objeto.Empresa.ID_Empresa.Control := Nil;
    Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
    Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
    Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
    Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= nil;
    Objeto.GpoProd.DESC_C_PROD_GPO.Control:= nil;

end;

procedure TwMInfCobr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMInfCobr.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMInfCobr.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWNinguno.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TwMInfCobr.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMInfCobr.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMInfCobr.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TwMInfCobr.edCVE_MONEDAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
end;

procedure TwMInfCobr.btPROMOTORClick(Sender: TObject);
begin
    Objeto.Promotor.ShowAll := True;
    If Objeto.Promotor.Busca Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMInfCobr.ilPROMOTORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMInfCobr.ilPROMOTOREjecuta(Sender: TObject);
begin
    If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMInfCobr.edID_PROMOTORExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_PROMOTOR,True,'',True);
end;

procedure TwMInfCobr.chbxMonedaClick(Sender: TObject);
begin
    If not chbxMoneda.Checked Then Begin
        Objeto.Moneda.Active:=False;
        chbxMoneda.Checked:= False;
        chbxMoneda.Enabled:= False;
    End Else Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
    End;
end;

procedure TwMInfCobr.chbxPromotorClick(Sender: TObject);
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

procedure TwMInfCobr.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMINFCOBR_PREVI',True,True) then
   begin
     ImprimeReporte(True);
   end;
end;

procedure TwMInfCobr.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMInfCobr.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMInfCobr.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMInfCobr.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
end;

procedure TwMInfCobr.btPRODUCTOClick(Sender: TObject);
begin
   if Objeto.Acreditado.Persona.Cve_Per_Juridica.AsString = 'PF' then
   Begin
      Objeto.Producto.BuscaWhereString:= ' CR_PRODUCTO.B_PER_FISICA = '
                                       + #39 + 'V' + #39
                                       + ' AND CR_PRODUCTO.SIT_PRODUCTO ='
                                       + #39 + 'AC' + #39 ;
      Objeto.Producto.FilterString := Objeto.Producto.BuscaWhereString;
   end
   else if Objeto.Acreditado.Persona.Cve_Per_Juridica.AsString = 'PM' then
   Begin
      Objeto.Producto.BuscaWhereString:= ' CR_PRODUCTO.B_PER_MORAL = '
                                       + #39 + 'V' + #39
                                       + ' AND CR_PRODUCTO.SIT_PRODUCTO ='
                                       + #39 + 'AC' + #39 ;
      Objeto.Producto.FilterString := Objeto.Producto.BuscaWhereString;
   end;
    Objeto.Producto.ShowAll := True;
    if Objeto.Producto.Busca Then Begin
        chbxProducto.Checked:= True;
        chbxProducto.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    end;
end;

procedure TwMInfCobr.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMInfCobr.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;


procedure TwMInfCobr.chbxProductoClick(Sender: TObject);
begin
    If not chbxProducto.Checked Then Begin
        Objeto.Producto.Active:=False;
        chbxProducto.Checked:=False;
        chbxProducto.Enabled:=False;
    End Else Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
    End;
end;

procedure TwMInfCobr.chbxAcreditadoClick(Sender: TObject);
begin
    If not chbxAcreditado.Checked Then Begin
        Objeto.Acreditado.Active:=False;
        chbxAcreditado.Checked:=False;
        chbxAcreditado.Enabled:=False;
    End Else Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
    End;
end;

procedure TwMInfCobr.edACREDITADOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TwMInfCobr.btPROM_ADMONClick(Sender: TObject);
begin
    Objeto.PromotorAdmon.ShowAll := True;
    If Objeto.PromotorAdmon.Busca Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TwMInfCobr.ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMInfCobr.ilPromAdmonEjecuta(Sender: TObject);
begin
    If Objeto.PromotorAdmon.FindKey([ilPromAdmon.Buffer]) Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TwMInfCobr.edID_PROMExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_PROM,True,'',True);
end;

procedure TwMInfCobr.chbxPromAmonClick(Sender: TObject);
begin
    If not chbxPromAmon.Checked Then Begin
        Objeto.PromotorAdmon.Active:=False;
        chbxPromAmon.Checked:=False;
        chbxPromAmon.Enabled:=False;
    End Else Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
    End;
end;

procedure TwMInfCobr.edID_PROMOTORChange(Sender: TObject);
begin
    If Trim(edID_PROMOTOR.Text)<>'' Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        edID_PROM.Enabled:=False;
        btPROM_ADMON.Enabled:=False;
    End Else Begin
        chbxPromotor.Checked:=False;
        chbxPromotor.Enabled:=False;
        edID_PROM.Enabled:=True;
        btPROM_ADMON.Enabled:=True;
    End;
end;

procedure TwMInfCobr.edID_PROMChange(Sender: TObject);
begin
    If Trim(edID_PROM.Text)<>'' Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        edID_PROMOTOR.Enabled:=False;
        btPROMOTOR.Enabled:=False;
    End Else Begin
        chbxPromAmon.Checked:=False;
        chbxPromAmon.Enabled:=False;
        edID_PROMOTOR.Enabled:=True;
        btPROMOTOR.Enabled:=True;
    End;
end;

Procedure TwMInfCobr.ImprimeReporte(bPreview:Boolean);
Var
    sSitMov,sDetalle, sOrden, sReporte, sGpoProd,sTipoDisp:String;
    iSit,iTipoDisp: Integer;
begin
    iSit:=rgSitMov.ItemIndex;
    case iSit of
        0: sSitMov:='AC';  //Activos
        1: sSitMov:='CA';  //Cancelados
    end;
    iSit:=rgDetalle.ItemIndex;
    case iSit of
        0: sDetalle:='D'; //Detalle
        1: sDetalle:='';  //Resumen
    end;
    iSit:=rgOrden.ItemIndex;
    case iSit of
        0: sOrden:='C'; //Crédito
        1: sOrden:='P';  //Persona
    end;
    iSit:=rgReporte.ItemIndex;
    case iSit of
        0: sReporte:='P';  //Producto
        1: sReporte:='A';  //Acreditado
    end;

    iTipoDisp:=rgTipoDisposicion.ItemIndex;
    case iTipoDisp of
        0: sTipoDisp := '';
        1: sTipoDisp := 'DI';
        2: sTipoDisp := 'RE';
        3: sTipoDisp := 'RS';
    end;

    sGpoProd:= Trim(edCVE_PRODUCTO_GPO.Text);

    RepInfCobranza( edF_INICIO.Text      ,   edF_FINAL.Text   , edCVE_PRODUCTO_CRE.Text,
                    edCVE_MONEDA.Text    ,   edACREDITADO.Text, edID_PROMOTOR.Text     ,
                    edID_PROM.Text       ,   edID_CESION.Text , sSitMov                ,
                    sDetalle             ,   sOrden           , edID_CRED_EXT.Text     ,
                    edID_CONTROL_EXT.Text,   sReporte         , sTipoDisp              ,
                    edNbrArch.Text   ,
                    EdIdEmpresa.Text     ,   EdIDSucursal.Text, sGpoProd               ,
                    chbxTasas.Checked    ,   chbxAcreditado.Checked,  Objeto.Apli    , bPreview             );

    If Trim(edNbrArch.Text)<>'' Then Begin
       If bGenArch Then
         ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
       Else
         ShowMessage('No se generó el Archivo')
    End;
End;
procedure TwMInfCobr.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMINFCOBR_IMPRI',True,True) then
   begin
      ImprimeReporte(False);
   end;
end;

procedure TwMInfCobr.edID_CESIONChange(Sender: TObject);
begin
    If Trim(edID_CESION.Text)<>'' Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End Else Begin
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End;
end;

procedure TwMInfCobr.edID_CESIONExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CESION,True,'',True);
end;

procedure TwMInfCobr.btID_CESIONClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TwMInfCobr.chbxCESIONClick(Sender: TObject);
begin
    If not chbxCESION.Checked Then Begin
        Objeto.Credito.Active:=False;
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End Else Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End;
end;

procedure TwMInfCobr.ilCesionCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMInfCobr.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TwMInfCobr.btCRED_EXTClick(Sender: TObject);
begin
   Objeto.CredExt.ShowAll := True;
   if Objeto.CredExt.Busca then begin
        chbxCRED_EXTERNO.Checked:=True;
        chbxCRED_EXTERNO.Enabled:=True;
        InterForma1.NextTab(edID_CRED_EXT);
   End;
end;

procedure TwMInfCobr.ilCRED_EXTEjecuta(Sender: TObject);
begin
    If Objeto.CredExt.FindKeyNear([ilCRED_EXT.Buffer],['ID_CRED_EXTERNO']) Then Begin
        chbxCRED_EXTERNO.Checked:=True;
        chbxCRED_EXTERNO.Enabled:=True;
        InterForma1.NextTab(edID_CRED_EXT);
   End;
end;

procedure TwMInfCobr.ilCRED_EXTCapture(Sender: TObject; var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMInfCobr.chbxCRED_EXTERNOClick(Sender: TObject);
begin
    If not chbxCRED_EXTERNO.Checked Then Begin
        Objeto.CredExt.Active:=False;
        chbxCRED_EXTERNO.Checked:=False;
        chbxCRED_EXTERNO.Enabled:=False;
    End Else Begin
        chbxCRED_EXTERNO.Checked:=True;
        chbxCRED_EXTERNO.Enabled:=True;
    End;
end;

procedure TwMInfCobr.edID_CRED_EXTChange(Sender: TObject);
begin
    If Trim(edID_CRED_EXT.Text)<>'' Then Begin
        chbxCRED_EXTERNO.Checked:=True;
        chbxCRED_EXTERNO.Enabled:=True;
    End Else Begin
        chbxCRED_EXTERNO.Checked:=False;
        chbxCRED_EXTERNO.Enabled:=False;
    End;
end;

procedure TwMInfCobr.edID_CRED_EXTExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CRED_EXT,True,'',True);
end;

procedure TwMInfCobr.btCONTROL_EXTClick(Sender: TObject);
begin
   Objeto.CtrlExt.ShowAll := True;
   if Objeto.CtrlExt.Busca then begin
        chbxCONTROL_EXT.Checked:=True;
        chbxCONTROL_EXT.Enabled:=True;
        InterForma1.NextTab(edID_CONTROL_EXT);
   End;
end;

procedure TwMInfCobr.ilCONTROL_EXTEjecuta(Sender: TObject);
begin
    If Objeto.CtrlExt.FindKeyNear([ilCONTROL_EXT.Buffer],['ID_CONTROL_EXT']) Then Begin
        chbxCONTROL_EXT.Checked:=True;
        chbxCONTROL_EXT.Enabled:=True;
        InterForma1.NextTab(edID_CONTROL_EXT);
   End;
end;

procedure TwMInfCobr.ilCONTROL_EXTCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show:= True;
end;

procedure TwMInfCobr.edID_CONTROL_EXTChange(Sender: TObject);
begin
    If Trim(edID_CONTROL_EXT.Text)<>'' Then Begin
        chbxCONTROL_EXT.Checked:=True;
        chbxCONTROL_EXT.Enabled:=True;
    End Else Begin
        chbxCONTROL_EXT.Checked:=False;
        chbxCONTROL_EXT.Enabled:=False;
    End;
end;

procedure TwMInfCobr.edID_CONTROL_EXTExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CONTROL_EXT,True,'',True);
end;

procedure TwMInfCobr.chbxCONTROL_EXTClick(Sender: TObject);
begin
    If not chbxCONTROL_EXT.Checked Then Begin
        Objeto.CtrlExt.Active:=False;
        chbxCONTROL_EXT.Checked:=False;
        chbxCONTROL_EXT.Enabled:=False;
    End Else Begin
        chbxCONTROL_EXT.Checked:=True;
        chbxCONTROL_EXT.Enabled:=True;
    End;
end;

procedure TwMInfCobr.sbExcelClick(Sender: TObject);
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

procedure TwMInfCobr.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TwMInfCobr.cbxArchivoClick(Sender: TObject);
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

procedure TwMInfCobr.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMInfCobr.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMInfCobr.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMInfCobr.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMInfCobr.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMInfCobr.edCVE_PRODUCTO_GPOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_GPO,True,'',True);
end;

procedure TwMInfCobr.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;
Procedure TwMInfCobr.CambiaControl;
Begin
   cbxCVE_PRODUCTO_GPO.Checked:=True;
   cbxCVE_PRODUCTO_GPO.Enabled:=True;
End;

procedure TwMInfCobr.ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMInfCobr.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMInfCobr.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
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

end.

