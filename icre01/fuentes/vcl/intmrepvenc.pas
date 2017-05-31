// Sistema         : Clase de TMRepVenc
// Fecha de Inicio : 01/08/2005
// Función forma   : Clase de TMRepVenc
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
// Modificaciones  :
Unit IntMRepVenc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntCrProduct,     //Producto de crédito
IntMon,           //Moneda
IntCrAcredit,     //Acreditado
IntMPers,         //PromotorAsoc
IntEmple,
IntCrCredito,     //Disposición
IntParamCre,
IntCrProveed,     //Prooveedor
IntMProdGpo,
Intempre,         //Empresa
IntUnNeg, UCrpe32, //Unidad Negocio/Suc
IntMQrVencimientos
;

Type
 TMRepVenc= class;

  TwMRepVenc=Class(TForm)
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
    edID_PROM: TEdit;
    Label2: TLabel;
    chbxCESION: TCheckBox;
    edCESION: TEdit;
    btID_CESION: TBitBtn;
    edID_CESION: TEdit;
    ilCesion: TInterLinkit;
    edID_PROVEEDOR: TEdit;
    btPROVEEDOR: TBitBtn;
    edID_PROV_NAFINSA: TEdit;
    edNOM_PROVEEDOR: TEdit;
    chbxProveedor: TCheckBox;
    Label4: TLabel;
    ilPROVEEDOR: TInterLinkit;
    gbControl: TGroupBox;
    Label6: TLabel;
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
    Label8: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edNOM_CVE_PRODUCTO_GPO: TEdit;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    rgDescDoc: TRadioGroup;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label9: TLabel;
    edF_INICIO: TEdit;
    dtpF_Ini: TInterDateTimePicker;
    edF_FINAL: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    rgTipoFecha: TRadioGroup;
    rgOrden: TRadioGroup;
    rptReporte: TCrpe;
    cbMuestraAsoc: TCheckBox;
    cbMuestraAdm: TCheckBox;
    cbxArchivo: TCheckBox;
    edNbrArch: TEdit;
    sbExcel: TSpeedButton;
    Label3: TLabel;
    SaveDialog1: TSaveDialog;
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
    procedure chbxProveedorClick(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure ilPROVEEDORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure edID_PROVEEDORExit(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
      var Show: Boolean);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    private
    { Private declarations }
       Procedure ImprimeReporte(bPreview:Boolean);
       Procedure AsignaEmpresaSuc;
       Procedure CambiaControl;
       Procedure CambiaCtrolAcred(stipo: String);       
    public
    { Public declarations }
    Objeto : TMRepVenc;
end;
 TMRepVenc= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public

        F_INICIO                : TInterCampo;
        F_FINAL                 : TInterCampo;
        TIPO_FECHA              : TInterCampo;
        ID_EMPRESA              : TInterCampo;
        CVE_PRODUCTO_GPO        : TInterCampo;
        CVE_PRODUCTO_CRE        : TInterCampo;
        ID_PERS_ASOCIAD         : TInterCampo;
        ID_PROM_ADM             : TInterCampo;
        ID_ACREDITADO           : TInterCampo;
        CVE_MONEDA              : TInterCampo;
        ID_PROVEEDOR            : TInterCampo;
        ID_CREDITO              : TInterCampo;
        B_OPERA_NAFIN           : TInterCampo;
        ORDEN                   : TInterCampo;
        MUESTRA_ADM             : TInterCampo;
        MUESTRA_ASOC            : TInterCampo;
        MUESTRA_ACRED           : TInterCampo;
        MUESTRA_PROV            : TInterCampo;

        { Public declarations }
        Producto                 : TCrProduct;
        Moneda                   : TMoneda;
        Acreditado               : TCrAcredit;
        Promotor                 : TEmpleado; //Promotor Responsable
        PromotorAdmon            : TEmpleado; //Promotor Admon
        Credito                  : TCrCredito;//Disposición
        ParamCre                 : TParamCre;
        Proveedor                : TCrProveed;//Proveedor
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        GpoProd                  : TMProdGpo;

{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
        VLID_ACREDITADO          : Integer;
{/ROIM}

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


constructor TMRepVenc.Create( AOwner : TComponent );
begin Inherited;

   F_INICIO         :=CreaCampo('F_INICIO',ftDate,tsNinguno,tsNinguno,False);
   F_FINAL          :=CreaCampo('F_FINAL',ftDate,tsNinguno,tsNinguno,False);
   TIPO_FECHA       :=CreaCampo('TIPO_FECHA',ftString,tsNinguno,tsNinguno,False);
   With TIPO_FECHA Do Begin
      Size:=16; UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('F_VENCIMIENTO');
      ComboLista.Add('1'); ComboDatos.Add('F_PROG_PAGO');
   End;

   ID_EMPRESA       :=CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,False);
   CVE_PRODUCTO_GPO :=CreaCampo('CVE_PRODUCTO_GPO',ftString,tsNinguno,tsNinguno,False);
   CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,False);
   CVE_MONEDA       :=CreaCampo('CVE_MONEDA',ftInteger,tsNinguno,tsNinguno,False);
   ID_PERS_ASOCIAD  :=CreaCampo('ID_PERS_ASOCIAD',ftInteger,tsNinguno,tsNinguno,False);
   ID_PROM_ADM      :=CreaCampo('ID_PROM_ADM',ftInteger,tsNinguno,tsNinguno,False);
   ID_ACREDITADO    :=CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);
   ID_PROVEEDOR     :=CreaCampo('ID_PROVEEDOR',ftInteger,tsNinguno,tsNinguno,False);
   ID_CREDITO       :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
   B_OPERA_NAFIN    :=CreaCampo('B_OPERA_NAFIN',ftString,tsNinguno,tsNinguno,False);
   With B_OPERA_NAFIN Do Begin
      Size:=1; UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('');
      ComboLista.Add('1'); ComboDatos.Add('V');
      ComboLista.Add('1'); ComboDatos.Add('F');
   End;
   ORDEN :=CreaCampo('ORDEN',ftString,tsNinguno,tsNinguno,False);
   With ORDEN Do Begin
      Size:=16; UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('REG.ID_CREDITO');
      ComboLista.Add('1'); ComboDatos.Add('PTIT.NOMBRE');
   End;
   MUESTRA_ADM      :=CreaCampo('MUESTRA_ADM',ftString,tsNinguno,tsNinguno,False);
   MUESTRA_ASOC     :=CreaCampo('MUESTRA_ASOC',ftString,tsNinguno,tsNinguno,False);
   MUESTRA_ACRED    :=CreaCampo('MUESTRA_ACRED',ftString,tsNinguno,tsNinguno,False);
   MUESTRA_PROV     :=CreaCampo('MUESTRA_PROV',ftString,tsNinguno,tsNinguno,False);


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

      Proveedor := TCrProveed.Create(Self);
      Proveedor.MasterSource:=Self;
      Proveedor.FieldByName('ID_ACREDITADO').MasterField:='ID_PROVEEDOR';
      Proveedor.BuscaWhereString := 'SIT_PROVEEDOR = ''AC''';

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      GpoProd:= TMProdGpo.Create(Self);
      GpoProd.MasterSource:=Self;
      GpoProd.FieldByName('CVE_PRODUCTO_GPO').MasterField:='CVE_PRODUCTO_GPO';

      UseQuery := False;
      HelpFile := 'InTMRepVenc.Hlp';
      ShowMenuReporte:=True;

      VLID_ACREDITADO := 0;
end;

Destructor TMRepVenc.Destroy;
begin
   if Producto <> nil then
      Producto.Free;
   if Moneda <> nil then
      Moneda.Free;
   if Acreditado <> nil then
      Acreditado.Free;
   if Promotor <> nil then
      Promotor.Free;
   if PromotorAdmon <> nil then
      PromotorAdmon.Free;
   if Credito <> nil then
      Credito.Free;
   if Proveedor <> nil then
      Proveedor.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   If GpoProd <> Nil Then
      GpoProd.Free;
   inherited;
end;


function TMRepVenc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMRepVenc;
begin
   W:=TwMRepVenc.Create(Self);
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


Function TMRepVenc.InternalBusca:Boolean;
begin InternalBusca := False;
end;

function TMRepVenc.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMRepVenc.AsignaEmpresaSuc;
begin
   Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);
   If  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) Then Begin
        CBSucursal.Checked := True;
   End;
   EdIdEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   bbEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   BBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   CBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
end;

procedure TwMRepVenc.FormShow(Sender: TObject);
begin
   Objeto.F_INICIO.Control         :=edF_INICIO;
   Objeto.F_FINAL.Control          :=edF_FINAL;
   Objeto.TIPO_FECHA.Control       :=rgTipoFecha;
   Objeto.ID_EMPRESA.Control       :=EdIdEmpresa;
   Objeto.CVE_PRODUCTO_GPO.Control :=edCVE_PRODUCTO_GPO;
   Objeto.CVE_PRODUCTO_CRE.Control :=edCVE_PRODUCTO_CRE;
   Objeto.CVE_MONEDA.Control       :=edCVE_MONEDA;
   Objeto.ID_PERS_ASOCIAD.Control  :=edID_PROMOTOR;
   Objeto.ID_PROM_ADM.Control      :=edID_PROM;
   Objeto.ID_ACREDITADO.Control    :=edACREDITADO;
   Objeto.ID_PROVEEDOR.Control     :=edID_PROVEEDOR;
   Objeto.ID_CREDITO.Control       :=edID_CESION;
   Objeto.B_OPERA_NAFIN.Control    :=rgDescDoc;
   Objeto.ORDEN.Control            :=rgOrden;
   Objeto.MUESTRA_ADM.Control      :=cbMuestraAdm;
   Objeto.MUESTRA_ASOC.Control     :=cbMuestraAsoc;
   Objeto.MUESTRA_ACRED.Control    :=chbxAcreditado;
   Objeto.MUESTRA_PROV.Control     :=chbxProveedor;

   //PINTA DATOS DEL PANEL INFERIOR
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

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

   Objeto.Proveedor.ID_ACREDITADO.Control := edID_PROVEEDOR;
   Objeto.Proveedor.Persona.Nombre.Control := edNOM_PROVEEDOR;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//   Objeto.Proveedor.ID_PROV_NAFINSA.Control := edID_PROV_NAFINSA;
   Objeto.Proveedor.ID_PROV_EXTERNO.Control := edID_PROV_NAFINSA;
{/ROIM}
   Objeto.Proveedor.GetParams(Objeto);

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);

   Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
   Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
   Objeto.GpoProd.GetParams(Objeto);
   AsignaEmpresaSuc;

   Objeto.F_INICIO.AsDateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.F_FINAL.AsDateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpF_Ini.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpF_Fin.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');

   rgTipoFecha.ItemIndex:= 0;
   rgDescDoc.ItemIndex:= 0;
   rgOrden.ItemIndex:= 0;
   cbMuestraAsoc.Checked:= True;
   cbMuestraAdm.Checked:= True;


{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
   if objeto.VLID_ACREDITADO <> 0 then
   begin
        if Objeto.Acreditado.FindKey([IntToStr(Objeto.VLID_ACREDITADO)])then
           ImprimeReporte(True);            
        // end if;
   end;
{/ROIM}

end;

procedure TwMRepVenc.FormDestroy(Sender: TObject);
begin
   Objeto.F_INICIO.Control         :=nil;
   Objeto.F_FINAL.Control          :=nil;
   Objeto.TIPO_FECHA.Control       :=nil;
   Objeto.ID_EMPRESA.Control       :=nil;
   Objeto.CVE_PRODUCTO_GPO.Control :=nil;
   Objeto.CVE_PRODUCTO_CRE.Control :=nil;
   Objeto.CVE_MONEDA.Control       :=nil;
   Objeto.ID_PERS_ASOCIAD.Control  :=nil;
   Objeto.ID_PROM_ADM.Control      :=nil;
   Objeto.ID_ACREDITADO.Control    :=nil;
   Objeto.ID_PROVEEDOR.Control     :=nil;
   Objeto.ID_CREDITO.Control       :=nil;
   Objeto.B_OPERA_NAFIN.Control    :=nil;
   Objeto.ORDEN.Control            :=nil;
   Objeto.MUESTRA_ADM.Control      :=nil;
   Objeto.MUESTRA_ASOC.Control     :=nil;
   Objeto.MUESTRA_ACRED.Control    :=nil;
   OBJETO.MUESTRA_PROV.Control     :=nil;

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
   Objeto.Proveedor.ID_ACREDITADO.Control := nil;
   Objeto.Proveedor.Persona.Nombre.Control := nil;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//   Objeto.Proveedor.ID_PROV_NAFINSA.Control := nil;
   Objeto.Proveedor.ID_PROV_EXTERNO.Control := nil;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
   Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= nil;
   Objeto.GpoProd.DESC_C_PROD_GPO.Control:= nil;
end;

procedure TwMRepVenc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMRepVenc.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMRepVenc.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWNinguno.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TwMRepVenc.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMRepVenc.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMRepVenc.ilMONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
      chbxMoneda.Checked:=True;
      chbxMoneda.Enabled:=True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMRepVenc.edCVE_MONEDAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
end;

procedure TwMRepVenc.btPROMOTORClick(Sender: TObject);
begin
   Objeto.Promotor.ShowAll := True;
   If Objeto.Promotor.Busca Then Begin
      chbxPromotor.Checked:=True;
      chbxPromotor.Enabled:=True;
      InterForma1.NextTab(edID_PROMOTOR);
   End;
end;

procedure TwMRepVenc.ilPROMOTORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMRepVenc.ilPROMOTOREjecuta(Sender: TObject);
begin
   If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
      chbxPromotor.Checked:=True;
      chbxPromotor.Enabled:=True;
      InterForma1.NextTab(edID_PROMOTOR);
   End;
end;

procedure TwMRepVenc.edID_PROMOTORExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_PROMOTOR,True,'',True);
end;

procedure TwMRepVenc.chbxMonedaClick(Sender: TObject);
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

procedure TwMRepVenc.chbxPromotorClick(Sender: TObject);
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

procedure TwMRepVenc.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMREPVENC_PREVI',True,True) then
      ImprimeReporte(True);
end;

procedure TwMRepVenc.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMRepVenc.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        CambiaCtrolAcred('ACRED');
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMRepVenc.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        CambiaCtrolAcred('ACRED');
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMRepVenc.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
end;

procedure TwMRepVenc.btPRODUCTOClick(Sender: TObject);
begin
   Objeto.Producto.BuscaWhereString:= ' CR_PRODUCTO.ID_EMPRESA='+ IntToStr(Objeto.Apli.IdEmpresa);
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

procedure TwMRepVenc.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMRepVenc.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;


procedure TwMRepVenc.chbxProductoClick(Sender: TObject);
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

procedure TwMRepVenc.chbxAcreditadoClick(Sender: TObject);
begin
    If not chbxAcreditado.Checked Then Begin
        Objeto.Acreditado.Active:=False;
        chbxAcreditado.Checked:=False;
        chbxAcreditado.Enabled:=False;
        edID_PROVEEDOR.Enabled:=True;
        btPROVEEDOR.Enabled:=True;
    End Else Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
    End;
end;

procedure TwMRepVenc.edACREDITADOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TwMRepVenc.btPROM_ADMONClick(Sender: TObject);
begin
    Objeto.PromotorAdmon.ShowAll := True;
    If Objeto.PromotorAdmon.Busca Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TwMRepVenc.ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMRepVenc.ilPromAdmonEjecuta(Sender: TObject);
begin
    If Objeto.PromotorAdmon.FindKey([ilPromAdmon.Buffer]) Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TwMRepVenc.edID_PROMExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_PROM,True,'',True);
end;

procedure TwMRepVenc.chbxPromAmonClick(Sender: TObject);
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

procedure TwMRepVenc.edID_PROMOTORChange(Sender: TObject);
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

procedure TwMRepVenc.edID_PROMChange(Sender: TObject);
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

Procedure TwMRepVenc.ImprimeReporte(bPreview:Boolean);
var bMuestraAcred, bMuestraProv : Boolean;
begin
   bMuestraAcred:= chbxAcreditado.Checked;
   bMuestraProv := chbxProveedor.Checked;


   Objeto.GetFromControl;
   If ((Trim(edF_INICIO.Text)='') And (Trim(edF_FINAL.Text)='')) Then
      ShowMessage('Debe indica una fecha de referencia (Programada / Vencimiento)')
   Else Begin
      {rptReporte.ParamFields.Name := 'pFECHA';
      rptReporte.ParamFields.Name := 'pACREDITADO';
      rptReporte.ParamFields.Name := 'pCFECHA';
      rptReporte.ParamFields.Name := 'pF_FINAL';
      rptReporte.ParamFields.Name := 'pF_INICIO';
      rptReporte.ParamFields.Name := 'pGPOPROD';
      rptReporte.ParamFields.Name := 'pID_CREDITO';
      rptReporte.ParamFields.Name := 'pID_EMPRESA';
      rptReporte.ParamFields.Name := 'pMONEDA';
      rptReporte.ParamFields.Name := 'pOPERANAFIN';
      rptReporte.ParamFields.Name := 'pORDEN';
      rptReporte.ParamFields.Name := 'pPRODUCTO';
      rptReporte.ParamFields.Name := 'pPROMADM';
      rptReporte.ParamFields.Name := 'pPROMASOC';
      rptReporte.ParamFields.Name := 'pPROVEEDOR';
      rptReporte.ParamFields.Name := 'pMUESTRA_ADM';
      rptReporte.ParamFields.Name := 'pMUESTRA_ASOC';
      rptReporte.ParamFields.Name := 'pMUESTRA_ACRED';
      rptReporte.ParamFields.Name := 'pMUESTRA_PROV';}

      RepVencimientos(
         Objeto.Apli.DameFechaEmpresaDia('D000'),
         Objeto.ID_ACREDITADO.AsInteger,
         Objeto.TIPO_FECHA.AsString,
         Objeto.F_FINAL.AsDateTime,
         Objeto.F_INICIO.AsDateTime,
         Objeto.CVE_PRODUCTO_GPO.AsString,
         Objeto.ID_CREDITO.AsInteger,
         Objeto.ID_EMPRESA.AsInteger,
         Objeto.CVE_MONEDA.AsInteger,
         Objeto.B_OPERA_NAFIN.AsString,
         Objeto.ORDEN.AsString,
         Objeto.CVE_PRODUCTO_CRE.AsString,
         Objeto.ID_PROM_ADM.AsInteger,
         Objeto.ID_PERS_ASOCIAD.AsInteger,
         Objeto.ID_PROVEEDOR.AsInteger,
         Objeto.MUESTRA_ADM.AsString,
         Objeto.MUESTRA_ASOC.AsString,
         Objeto.MUESTRA_ACRED.AsString,
         Objeto.MUESTRA_PROV.AsString,
         edNbrArch.Text,
         Objeto.Apli, bPreview);
       If Trim(edNbrArch.Text)<>'' Then Begin
          If bGenArch Then
            ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
          Else
            ShowMessage('No se generó el Archivo')
       End;

      {rptReporte.Connect.ServerName := Objeto.Apli.DataBase.Params.Values['SERVER NAME'];
      rptReporte.Connect.UserID     := Objeto.Apli.DataBase.Params.Values['USER NAME'];
      rptReporte.Connect.Password   := Objeto.Apli.DataBase.Params.Values['PASSWORD'];
      rptReporte.Connect.Propagate  := True;
      rptReporte.Output := toWindow;
      If Objeto.Apli.DataBase.Params.Values['SERVER NAME'] = 'PCORP' Then
      rptReporte.ReportName := '\\Inter25\corp\Delphide\ICre01\Reportes\RepVencimientos_PCORP.rpt'
      Else
      rptReporte.ReportName := '\\Inter25\corp\Delphide\ICre01\Reportes\RepVencimientos.rpt';

      rptReporte.ParamFields.Clear;
      rptReporte.ParamFields.Retrieve;
      rptReporte.ParamFields.Name := 'pFECHA';
      rptReporte.ParamFields.AsDate := Objeto.Apli.DameFechaEmpresaDia('D000');
      rptReporte.ParamFields.Name := 'pACREDITADO';
      rptReporte.ParamFields.AsNumber := Objeto.ID_ACREDITADO.AsInteger;
      rptReporte.ParamFields.Name := 'pCFECHA';
      rptReporte.ParamFields.Value := Objeto.TIPO_FECHA.AsString;
      rptReporte.ParamFields.Name := 'pF_FINAL';
      rptReporte.ParamFields.AsDate := Objeto.F_FINAL.AsDateTime;
      rptReporte.ParamFields.Name := 'pF_INICIO';
      rptReporte.ParamFields.AsDate := Objeto.F_INICIO.AsDateTime;
      rptReporte.ParamFields.Name := 'pGPOPROD';
      If Objeto.CVE_PRODUCTO_GPO.AsString = '' Then
         rptReporte.ParamFields.Value := '0'
      Else
         rptReporte.ParamFields.Value := Objeto.CVE_PRODUCTO_GPO.AsString;
      rptReporte.ParamFields.Name := 'pID_CREDITO';
      rptReporte.ParamFields.AsNumber := Objeto.ID_CREDITO.AsInteger;
      rptReporte.ParamFields.Name := 'pID_EMPRESA';
      rptReporte.ParamFields.AsNumber := Objeto.ID_EMPRESA.AsInteger;
      rptReporte.ParamFields.Name := 'pMONEDA';
      rptReporte.ParamFields.AsNumber := Objeto.CVE_MONEDA.AsInteger;
      rptReporte.ParamFields.Name := 'pOPERANAFIN';
      rptReporte.ParamFields.Value := Objeto.B_OPERA_NAFIN.AsString;
      rptReporte.ParamFields.Name := 'pORDEN';
      rptReporte.ParamFields.Value := Objeto.ORDEN.AsString;
      rptReporte.ParamFields.Name := 'pPRODUCTO';
      If Objeto.CVE_PRODUCTO_CRE.AsString='' Then
         rptReporte.ParamFields.Value := '0'
      Else
         rptReporte.ParamFields.Value := Objeto.CVE_PRODUCTO_CRE.AsString;
      rptReporte.ParamFields.Name := 'pPROMADM';
      rptReporte.ParamFields.AsNumber := Objeto.ID_PROM_ADM.AsInteger;
      rptReporte.ParamFields.Name := 'pPROMASOC';
      rptReporte.ParamFields.AsNumber := Objeto.ID_PERS_ASOCIAD.AsInteger;
      rptReporte.ParamFields.Name := 'pPROVEEDOR';
      rptReporte.ParamFields.AsNumber := Objeto.ID_PROVEEDOR.AsInteger;
      rptReporte.ParamFields.Name := 'pMUESTRA_ADM';
      rptReporte.ParamFields.Value := Objeto.MUESTRA_ADM.AsString;
      rptReporte.ParamFields.Name := 'pMUESTRA_ASOC';
      rptReporte.ParamFields.Value := Objeto.MUESTRA_ASOC.AsString;
      rptReporte.ParamFields.Name := 'pMUESTRA_ACRED';
      rptReporte.ParamFields.Value := Objeto.MUESTRA_ACRED.AsString;
      rptReporte.ParamFields.Name := 'pMUESTRA_PROV';
      rptReporte.ParamFields.Value := Objeto.MUESTRA_PROV.AsString;

      rptReporte.Connect.Send;
      rptReporte.Formulas.Send;
      rptReporte.ParamFields.Send;
      rptReporte.SQL.Send;
      rptReporte.Execute;}
   End;
end;

procedure TwMRepVenc.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMREPVENC_IMPRI',True,True) then
      ImprimeReporte(False);
end;

procedure TwMRepVenc.edID_CESIONChange(Sender: TObject);
begin
    If Trim(edID_CESION.Text)<>'' Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End Else Begin
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End;
end;

procedure TwMRepVenc.edID_CESIONExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CESION,True,'',True);
end;

procedure TwMRepVenc.btID_CESIONClick(Sender: TObject);
begin
   Objeto.Credito.BuscaWhereString:= ' CONTRATO.ID_EMPRESA ='+ IntToStr(Objeto.Apli.IdEmpresa);
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TwMRepVenc.chbxCESIONClick(Sender: TObject);
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

procedure TwMRepVenc.ilCesionCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMRepVenc.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TwMRepVenc.chbxProveedorClick(Sender: TObject);
begin
    If not chbxProveedor.Checked Then Begin
        Objeto.Proveedor.Active:=False;
        chbxProveedor.Checked:= False;
        chbxProveedor.Enabled:= False;
        edACREDITADO.Enabled:=True;
        btACREDITADO.Enabled:=True;
    End Else Begin
        chbxProveedor.Checked:= True;
        chbxProveedor.Enabled:= True;
    End;
end;

procedure TwMRepVenc.btPROVEEDORClick(Sender: TObject);
begin
   Objeto.Proveedor.ShowAll := True;
   If Objeto.Proveedor.Busca Then Begin
      chbxProveedor.Checked:= True;
      chbxProveedor.Enabled:= True;
      CambiaCtrolAcred('PROV');
    End;
end;

procedure TwMRepVenc.ilPROVEEDORCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TwMRepVenc.ilPROVEEDOREjecuta(Sender: TObject);
begin
   If Objeto.Proveedor.FindKey([ilPROVEEDOR.Buffer]) Then Begin
      chbxProveedor.Checked:=True;
      chbxProveedor.Enabled:=True;
      CambiaCtrolAcred('PROV');
   End;
end;

procedure TwMRepVenc.edID_PROVEEDORExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edID_PROVEEDOR,True,'',True);
end;

procedure TwMRepVenc.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMRepVenc.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMRepVenc.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMRepVenc.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMRepVenc.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMRepVenc.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMRepVenc.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMRepVenc.ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True; 
end;

procedure TwMRepVenc.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   If not cbxCVE_PRODUCTO_GPO.Checked Then Begin
      Objeto.GpoProd.Active:=False;
      cbxCVE_PRODUCTO_GPO.Checked:=False;
      cbxCVE_PRODUCTO_GPO.Enabled:=False;
      rgDescDoc.ItemIndex:= 0;
      rgDescDoc.Enabled:= False;
   End Else Begin
      cbxCVE_PRODUCTO_GPO.Checked:=True;
      cbxCVE_PRODUCTO_GPO.Enabled:=True;
   End;
end;

Procedure TwMRepVenc.CambiaControl;
Begin
   rgDescDoc.ItemIndex:=0;
   If Objeto.GpoProd.B_APLICA_FONDEO.AsString = 'V' Then Begin
      rgDescDoc.Enabled:= True
   End Else Begin
      rgDescDoc.Enabled:= False;
   End;
   cbxCVE_PRODUCTO_GPO.Checked:=True;
   cbxCVE_PRODUCTO_GPO.Enabled:=True;
End;

Procedure TwMRepVenc.CambiaCtrolAcred(stipo: String);
Begin
   If stipo= 'ACRED' Then Begin
      edID_PROVEEDOR.Enabled:= False;
      btPROVEEDOR.Enabled:= False
   End Else If stipo= 'PROV' Then Begin
      edACREDITADO.Enabled:= False;
      btACREDITADO.Enabled:= False;
   End;
End;
procedure TwMRepVenc.sbExcelClick(Sender: TObject);
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

procedure TwMRepVenc.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TwMRepVenc.cbxArchivoClick(Sender: TObject);
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

