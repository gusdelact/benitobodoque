// Sistema         : Clase de TMProgVen
// Fecha de Inicio : 01/10/2003
// Función forma   : Clase de TMProgVen
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :               
// Modificaciones  : 23 10 2004 Importe de  pago histórico
Unit IntMProgVen;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntGenCre,
IntCrProduct,     //Producto de crédito
IntMon,           //Moneda
IntCrAcredit,     //Acreditado
IntMPers,         //PromotorAsoc
IntEmple,
IntCrCredito,     //Disposición
IntParamCre,
IntMQrProgVen,    //Reporte
IntCrProveed,     //Prooveedor
IntMProdGpo,
Intempre,         //Empresa
IntUnNeg;         //Unidad Negocio/Suc

Type
 TMProgVen= class;

  TwMProgVen=Class(TForm)
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
    dtpF_Vencimiento: TInterDateTimePicker;
    edF_Vencimiento: TEdit;
    lbLiqF_INICIO: TLabel;
    rgOrden: TRadioGroup;
    edID_PROM: TEdit;
    Label2: TLabel;
    chbxCESION: TCheckBox;
    edCESION: TEdit;
    btID_CESION: TBitBtn;
    edID_CESION: TEdit;
    ilCesion: TInterLinkit;
    Label3: TLabel;
    edF_Programada: TEdit;
    dtpF_Programada: TInterDateTimePicker;
    chbxF_Prog: TCheckBox;
    chbxF_Ven: TCheckBox;
    chbxTipoSector: TCheckBox;
    edID_PROVEEDOR: TEdit;
    btPROVEEDOR: TBitBtn;
    edID_PROV_NAFINSA: TEdit;
    edNOM_PROVEEDOR: TEdit;
    chbxProveedor: TCheckBox;
    Label4: TLabel;
    ilPROVEEDOR: TInterLinkit;
    rgTipoReporte: TRadioGroup;
    rgFecRep: TRadioGroup;
    sbExcel: TSpeedButton;
    Label5: TLabel;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
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
    SpeedButton1: TSpeedButton;
    Label9: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    SaveDialog2: TSaveDialog;
    rgTIP_CAL_INT: TRadioGroup;
    Label10: TLabel;
    cbFecAnt: TCheckBox;
    edFecAnt: TEdit;
    dtpF_Ant: TInterDateTimePicker;
    rgSDO_CHQRA: TRadioGroup;
    cbPromAdmon: TCheckBox;
    cbShowChq: TCheckBox;
    rgTIP_RECUPERA: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
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
    procedure edF_VencimientoChange(Sender: TObject);
    procedure edF_ProgramadaChange(Sender: TObject);
    procedure chbxF_VenClick(Sender: TObject);
    procedure chbxF_ProgClick(Sender: TObject);
    procedure chbxProveedorClick(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure ilPROVEEDORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure edID_PROVEEDORExit(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
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
    procedure cbFecAntClick(Sender: TObject);
    private
    { Private declarations }
       Procedure ImprimeReporte(bPreview:Boolean; grOpcion : TGenRepOption);
       Procedure AsignaEmpresaSuc;
       Procedure CambiaControl;       
    public
    { Public declarations }
    Objeto : TMProgVen;
end;
 TMProgVen= class(TInterFrame)
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
        Proveedor                : TCrProveed;//Proveedor
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


constructor TMProgVen.Create( AOwner : TComponent );
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
      HelpFile := 'InTMProgVen.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMProgVen.Destroy;
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


function TMProgVen.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMProgVen;
begin
   W:=TwMProgVen.Create(Self);
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


Function TMProgVen.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TMProgVen.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMProgVen.AsignaEmpresaSuc;
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

procedure TwMProgVen.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

//      dtpF_Vencimiento.DateTime:= Objeto.Apli.DameFechaEmpresa;
//      edF_Vencimiento.text:=FormatDateTime('dd/mm/yyyy',dtpF_Vencimiento.DateTime);

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
//      Objeto.Proveedor.ID_PROV_NAFINSA.Control := edID_PROV_NAFINSA;
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

      // RUCJ4248: oculte el grupo para seleccionar la visibilidad del saldo de la chequera
      rgSDO_CHQRA.visible := false;

      AsignaEmpresaSuc;
end;

procedure TwMProgVen.FormDestroy(Sender: TObject);
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
    Objeto.Proveedor.ID_ACREDITADO.Control := nil;
    Objeto.Proveedor.Persona.Nombre.Control := nil;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//    Objeto.Proveedor.ID_PROV_NAFINSA.Control := nil;
    Objeto.Proveedor.ID_PROV_EXTERNO.Control := nil;
{/ROIM}
    Objeto.Empresa.ID_Empresa.Control := Nil;
    Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
    Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
    Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
    Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= nil;
    Objeto.GpoProd.DESC_C_PROD_GPO.Control:= nil;
end;

procedure TwMProgVen.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMProgVen.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMProgVen.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMProgVen.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TwMProgVen.edCVE_MONEDAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
end;

procedure TwMProgVen.btPROMOTORClick(Sender: TObject);
begin
    Objeto.Promotor.ShowAll := True;
    If Objeto.Promotor.Busca Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMProgVen.ilPROMOTORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMProgVen.ilPROMOTOREjecuta(Sender: TObject);
begin
    If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMProgVen.edID_PROMOTORExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_PROMOTOR,True,'',True);
end;

procedure TwMProgVen.chbxMonedaClick(Sender: TObject);
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

procedure TwMProgVen.chbxPromotorClick(Sender: TObject);
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

procedure TwMProgVen.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPROGVEN_PREVI',True,True) then
    ImprimeReporte(True, grPreview);
end;

procedure TwMProgVen.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPROGVEN_IMPRI',True,True) then
    ImprimeReporte(False, grPrint);
end;

procedure TwMProgVen.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMProgVen.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMProgVen.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMProgVen.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
end;

procedure TwMProgVen.btPRODUCTOClick(Sender: TObject);
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

procedure TwMProgVen.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMProgVen.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;


procedure TwMProgVen.chbxProductoClick(Sender: TObject);
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

procedure TwMProgVen.chbxAcreditadoClick(Sender: TObject);
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

procedure TwMProgVen.edACREDITADOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TwMProgVen.btPROM_ADMONClick(Sender: TObject);
begin
    Objeto.PromotorAdmon.ShowAll := True;
    If Objeto.PromotorAdmon.Busca Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TwMProgVen.ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMProgVen.ilPromAdmonEjecuta(Sender: TObject);
begin
    If Objeto.PromotorAdmon.FindKey([ilPromAdmon.Buffer]) Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TwMProgVen.edID_PROMExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_PROM,True,'',True);
end;

procedure TwMProgVen.chbxPromAmonClick(Sender: TObject);
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

procedure TwMProgVen.edID_PROMOTORChange(Sender: TObject);
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

procedure TwMProgVen.edID_PROMChange(Sender: TObject);
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

Procedure TwMProgVen.ImprimeReporte(bPreview:Boolean;
          grOpcion : TGenRepOption);
Var
   //RLUMBRERAS LATBC 9/02/2011 (Se agrgegan variables para reporte de recuperados)
    sTipRecu:String;
    iTipRecu:Integer;
   //------------------------------------------------

    sSituacion,sOrden,sTipoReporte,sFecRep,sTipoProd,sGpoProd, sOperDD, sTipCalInt, B_ANTICIPADA, sSdoChqra :String;
    iSit, iDescDoc, iTipCalInt, iSdoChqra: Integer;
    vlFecha: TDateTime;
begin

     //RLUMBRERAS LATBC 9/02/2011 (Se agrgegan para reporte de recuperados)
       iTipRecu := rgTIP_RECUPERA.ItemIndex;
   case iTipRecu of
        0: sTipRecu := '0';
        1: sTipRecu := '1';
        2: sTipRecu := '2';
   end;
   //------------------------------------------------
    iSit:=rgSituacion.ItemIndex;
    case iSit of
        0: sSituacion:='AC';  //Activa
        1: sSituacion:='LQ';  //Pagada
        2: sSituacion:='IM';  //Impagada
        3: sSituacion:='VE';  //Vencida Exigible
        4: sSituacion:='IV';  //Impagada + Vencida Exigible
        5: sSituacion:='';    //Indistinta
    end;

    iSit:=rgOrden.ItemIndex;
    case iSit of
        0: sOrden:='D'; //Disposicion
        1: sOrden:='C'; //Cliente Acreditado
        2: sOrden:='P'; //Promotor Asociado
        3: sOrden:='A'; //Promotor Administrador
    end;

    iSit:=rgTipoReporte.ItemIndex;
    case iSit of
        0: sTipoReporte:='O'; //Operativo
        1: sTipoReporte:='C'; //Cierre
    end;
    iSit:=rgFecRep.ItemIndex;
    case iSit of
        0: sFecRep:='A'; //Acumulado
        1: sFecRep:='D'; //Al Día
        2: sFecRep:='C'; //Consolidado //easa4011
    end;

    sGpoProd:= Trim(edCVE_PRODUCTO_GPO.Text);
    iDescDoc:=rgDescDoc.ItemIndex;
    case iDescDoc of
        0: sOperDD := '';
        1: sOperDD := 'V';
        2: sOperDD := 'F';
    end;

    //< EASA4011  11 AGOSTO 2006 ACTIVACION FILTRO TIPO CALCULO INTERES
    iTipCalInt := rgTIP_CAL_INT.ItemIndex;
    case iTipCalInt of
        0: sTipCalInt := '';
        1: sTipCalInt := 'IN';
        2: sTipCalInt := 'VE';
    end;
    // EASA4011 >/

    // RUCJ4248: Siempre de be de mostrar el saldo de la chequera
    iSdoChqra := 2;

    //< EASA4011  22.OVT.2007   Req. Apl. Sado Chequeras
    //iSdoChqra := rgSDO_CHQRA.ItemIndex;
    case iSdoChqra of
        0: sSdoChqra := 'V';
        1: sSdoChqra := 'F';
        2: sSdoChqra := '';
    end;
    // EASA4011 >/


    //< EVA  10 AGOSTO 2006 REQUERIMIENTO CARTERA
    if cbFecAnt.Checked then
      B_ANTICIPADA := 'V'
    else
     B_ANTICIPADA := 'F';
    // EVA >/

    if ((Trim(edF_Vencimiento.Text)='') AND (Trim(edF_Programada.Text)='')) THEN
       ShowMessage('Debe indica una fecha de referencia (Programada / Vencimiento)')
    else
    begin
       if sFecRep <> 'C' then Begin
         RepProgVen( edF_Vencimiento.Text  , edF_Programada.Text, edCVE_PRODUCTO_CRE.Text,
                     edCVE_MONEDA.Text     , edACREDITADO.Text  , edID_PROVEEDOR.Text,
                     edID_PROMOTOR.Text    , edID_PROM.Text     , edID_CESION.Text,
                     sSituacion            , sOrden             , sTipoReporte,
                     sFecRep               , sTipoProd          , edNbrArch.Text,
                   //RLUMBRERAS LATBC 8/02/2011 (Se agrgegan variables para reporte de recuperados)
                     sTipRecu,
                  //-----------------------------------------------------------------------------

                     EdIdEmpresa.Text      , EdIDSucursal.Text  , sGpoProd,
                     sOperDD               , sTipCalInt         , sSdoChqra, {* sSdoChqra := '' *}
                     chbxTipoSector.Checked, cbPromAdmon.Checked, cbShowChq.Checked,
                     Objeto.Apli           , //bPreview           ,
                     B_ANTICIPADA,
                     edFecAnt.Text,
                     grOpcion, ''
                     );

         If Trim(edNbrArch.Text)<>'' Then Begin
            If bGenArch Then
              ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
            Else
              ShowMessage('No se generó el Archivo')
         End;
       end;
    end;
end;

procedure TwMProgVen.edID_CESIONChange(Sender: TObject);
begin
    If Trim(edID_CESION.Text)<>'' Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End Else Begin
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End;
end;

procedure TwMProgVen.edID_CESIONExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CESION,True,'',True);
end;

procedure TwMProgVen.btID_CESIONClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TwMProgVen.chbxCESIONClick(Sender: TObject);
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

procedure TwMProgVen.ilCesionCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMProgVen.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TwMProgVen.edF_VencimientoChange(Sender: TObject);
begin
    If Trim(edF_Vencimiento.Text)<>'' Then Begin
//        edF_Programada.Enabled:=False;
//        dtpF_Programada.Enabled:=False;
        chbxF_Ven.Checked:=True;
        chbxF_Ven.Enabled:=True;
    End Else Begin
//        edF_Programada.Enabled:=True;
//        dtpF_Programada.Enabled:=True;
        chbxF_Ven.Checked:=False;
        chbxF_Ven.Enabled:=False;
    End;
end;

procedure TwMProgVen.edF_ProgramadaChange(Sender: TObject);
begin
    If Trim(edF_Programada.Text)<>'' Then Begin
//        edF_Vencimiento.Enabled:=False;
//        dtpF_Vencimiento.Enabled:=False;
        chbxF_Prog.Checked:=True;
        chbxF_Prog.Enabled:=True;
    End Else Begin
//        edF_Vencimiento.Enabled:=True;
//        dtpF_Vencimiento.Enabled:=True;
        chbxF_Prog.Checked:=False;
        chbxF_Prog.Enabled:=False;
    End;
end;

procedure TwMProgVen.chbxF_VenClick(Sender: TObject);
begin
    If not chbxF_Ven.Checked Then Begin
        edF_Vencimiento.Text:='';
        chbxF_Ven.Checked:=False;
        chbxF_Ven.Enabled:=False;
    End;
end;

procedure TwMProgVen.chbxF_ProgClick(Sender: TObject);
begin
    If not chbxF_Prog.Checked Then Begin
        edF_Programada.Text:='';
        chbxF_Prog.Checked:=False;
        chbxF_Prog.Enabled:=False;
    End;
end;

procedure TwMProgVen.chbxProveedorClick(Sender: TObject);
begin
    If not chbxProveedor.Checked Then Begin
        Objeto.Proveedor.Active:=False;
        chbxProveedor.Checked:= False;
        chbxProveedor.Enabled:= False;
    End Else Begin
        chbxProveedor.Checked:= True;
        chbxProveedor.Enabled:= True;
    End;
end;

procedure TwMProgVen.btPROVEEDORClick(Sender: TObject);
begin
   Objeto.Proveedor.ShowAll := True;
   if Objeto.Proveedor.Busca then
    Begin
      chbxProveedor.Checked:= True;
      chbxProveedor.Enabled:= True;
    End;
end;

procedure TwMProgVen.ilPROVEEDORCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TwMProgVen.ilPROVEEDOREjecuta(Sender: TObject);
begin
  if Objeto.Proveedor.FindKey([ilPROVEEDOR.Buffer]) then
    Begin
    chbxProveedor.Checked:=True;
    chbxProveedor.Enabled:=True;
    End;
end;

procedure TwMProgVen.edID_PROVEEDORExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edID_PROVEEDOR,True,'',True);
end;

procedure TwMProgVen.sbExcelClick(Sender: TObject);
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

procedure TwMProgVen.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TwMProgVen.cbxArchivoClick(Sender: TObject);
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

procedure TwMProgVen.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMProgVen.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMProgVen.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMProgVen.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMProgVen.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMProgVen.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMProgVen.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMProgVen.ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMProgVen.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
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
Procedure TwMProgVen.CambiaControl;
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

procedure TwMProgVen.cbFecAntClick(Sender: TObject);
begin
 if cbFecAnt.Checked then
  begin
    edFecAnt.Visible := True;
    dtpF_Ant.Visible := True;
  end
  else
  begin
    edFecAnt.Visible := False;
    dtpF_Ant.Visible := False;
  end;
end;

end.

