// Sistema         : Clase de TMColoca
// Fecha de Inicio : 01/10/2003
// Función forma   : Clase de TMColoca
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMCedExPg;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntGenCre,
IntPers,          //Persona
IntCrCredito,     //Disposición
IntMPers,         //Promotores
IntCrGrupEco,     //Grupo Económico
IntCrProduct,     //Producto de crédito
IntMProdGpo,      //Grupo Producto de crédito
IntParamCre,
Intempre,          //Empresa
IntUnNeg,          //Unidad Negocio/Suc
IntQrCedExPg,      //Reporte
IntMon,            //Moneda
IntCrProveed       //Proveedor
;

Type
 TMCedExPg= class;

  TwMCedExPg=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
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
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    edF_Inicio: TEdit;
    dtpF_Inicio: TInterDateTimePicker;
    Label3: TLabel;
    edF_FIN: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    SaveDialog1: TSaveDialog;
    edNbrArch: TEdit;
    sbExcel: TSpeedButton;
    Label4: TLabel;
    cbxArchivo: TCheckBox;
    Label5: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edNOM_CVE_PRODUCTO_GPO: TEdit;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
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
    edCVE_GRUPO_ECO: TEdit;
    btCVE_GRUPO_ECO: TBitBtn;
    edDESC_AGRUPO_ECO: TEdit;
    ilCVE_GRUPO_ECO: TInterLinkit;
    cbCVE_GRUPO_ECO: TCheckBox;
    Label2: TLabel;
    btID_CREDITO: TBitBtn;
    edID_CREDITO: TEdit;
    edDESC_ID_CREDITO: TEdit;
    cbID_CREDITO: TCheckBox;
    cbDiasImpagado: TCheckBox;
    rgFondeo: TRadioGroup;
    lblCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btnCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    cbCVE_MONEDA: TCheckBox;
    ilCVE_MONEDA: TInterLinkit;
    lblID_PROVEEDOR: TLabel;
    edID_PROVEEDOR: TEdit;
    btnID_PROVEEDOR: TBitBtn;
    edDESC_PROVEEDOR: TEdit;
    cbID_PROVEEDOR: TCheckBox;
    edCVE_FND_ENT_DES: TEdit;
    cbMuestraProveedor: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btPROMOTORClick(Sender: TObject);
    procedure ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROMOTOREjecuta(Sender: TObject);
    procedure edID_PROMOTORExit(Sender: TObject);
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
    procedure edID_CREDITOExit(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure ilCreditoCapture(Sender: TObject; var Show: Boolean);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure edCVE_PRODUCTO_GPOExit(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure btCVE_GRUPO_ECOClick(Sender: TObject);
    procedure ilCVE_GRUPO_ECOEjecuta(Sender: TObject);
    procedure cbCVE_GRUPO_ECOClick(Sender: TObject);
    procedure cbID_CREDITOClick(Sender: TObject);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure btnCVE_MONEDAClick(Sender: TObject);
    procedure cbCVE_MONEDAClick(Sender: TObject);
    procedure btnID_PROVEEDORClick(Sender: TObject);
    procedure cbID_PROVEEDORClick(Sender: TObject);
    private
    { Private declarations }
       //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
       Procedure ImprimeReporte(bPreview:Boolean; grOpcion  : TGenRepOption );
       //Procedure ImprimeReporte(bPreview:Boolean);
       //</LOLS>
       Procedure CambiaControl;
       Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMCedExPg;
end;
 TMCedExPg= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        Persona                  : TPersona;
        Credito                  : TCrCredito;//Disposición
        Promotor                 : TMPersona; //Promotor Responsable
        PromotorAdmon            : TMPersona; //Promotor Admon
        CrGrupEco                : TCrGrupEco;
        Producto                 : TCrProduct;
        GpoProd                  : TMProdGpo;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;
        Proveedor                : TCrProveed;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TMCedExPg.Create( AOwner : TComponent );
begin Inherited;
      {$WARNINGS OFF}
      Persona := TPersona.Create(Self);
      {$WARNINGS ON}      
      Persona.MasterSource := Self;

      {$WARNINGS OFF}
      Credito := TCrCredito.Create(Self);
      {$WARNINGS ON}
      Credito.MasterSource:=Self;

      {$WARNINGS OFF}
      Promotor := TMPersona.Create(Self);
      {$WARNINGS ON}
      Promotor.FilterBy := fbTMPersonaEmpleado;
      Promotor.MasterSource := Self;
      Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      {$WARNINGS OFF}
      PromotorAdmon := TMPersona.Create(Self);
      {$WARNINGS ON}
      PromotorAdmon.FilterBy := fbTMPersonaEmpleado;
      PromotorAdmon.MasterSource := Self;
      PromotorAdmon.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      {$WARNINGS OFF}
      CrGrupEco:= TCrGrupEco.Create(Self);
      {$WARNINGS ON}      
      CrGrupEco.MasterSource:=Self;

      {$WARNINGS OFF}
      Producto :=  TCrProduct.Create(Self);
      {$WARNINGS ON}
      Producto.MasterSource:=Self;

      {$WARNINGS OFF}
      GpoProd:= TMProdGpo.Create(Self);
      {$WARNINGS ON}
      GpoProd.MasterSource:=Self;

      {$WARNINGS OFF}
      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);
      {$WARNINGS ON}      

      {$WARNINGS OFF}
      Moneda := TMoneda.Create(Self);
      {$WARNINGS ON}
      Moneda.MasterSource:=Self;

      {$WARNINGS OFF}
      Proveedor := TCrProveed.Create(Self);
      {$WARNINGS ON}
      Proveedor.MasterSource:=Self;

      UseQuery := False;
      HelpFile := 'InTMCedExPg.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMCedExPg.Destroy;
begin
   if Persona <> nil then
      Persona.Free;
   if Credito <> nil then
      Credito.Free;
   if Promotor <> nil then
      Promotor.Free;
   if PromotorAdmon <> nil then
      PromotorAdmon.Free;
   If CrGrupEco <> Nil Then
      CrGrupEco.Free;
   if Producto <> nil then
      Producto.Free;
   If GpoProd <> Nil Then
      GpoProd.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   if Moneda <> nil then
      Moneda.Free;
   if Proveedor <> nil then
      Proveedor.Free;
   inherited;
end;


function TMCedExPg.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMCedExPg;
begin
   W:=TwMCedExPg.Create(Self);
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


Function TMCedExPg.InternalBusca:Boolean;
begin InternalBusca := False;
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMCedExPg.AsignaEmpresaSuc;
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

procedure TwMCedExPg.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      dtpF_Inicio.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpF_Fin.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_Inicio.text:=FormatDateTime('dd/mm/yyyy',dtpF_Inicio.DateTime);
      edF_FIN.text:=FormatDateTime('dd/mm/yyyy',dtpF_Fin.DateTime);

      Objeto.Persona.Id_Persona.Control := edACREDITADO;
      Objeto.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      Objeto.Promotor.ID_Persona.Control :=edID_PROMOTOR;
      Objeto.Promotor.Nombre.Control :=edNOM_PROMOTOR;
      Objeto.Promotor.GetParams(Objeto);
      edNOM_PROMOTOR.Hint := Objeto.Promotor.Nombre.AsString;
      edNOM_PROMOTOR.ShowHint := True;

      Objeto.PromotorAdmon.ID_Persona.Control :=edID_PROM;
      Objeto.PromotorAdmon.Nombre.Control :=edNOM_PROM;
      Objeto.PromotorAdmon.GetParams(Objeto);
      edNOM_PROM.Hint := Objeto.PromotorAdmon.Nombre.AsString;
      edNOM_PROM.ShowHint := True;

      Objeto.CrGrupEco.CVE_GRUPO_ECO.Control := edCVE_GRUPO_ECO;
      Objeto.CrGrupEco.DESC_AGRUPO_ECO.Control := edDESC_AGRUPO_ECO;

      Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;
      Objeto.Producto.GetParams(Objeto);
      edDESC_PRODUCTO1.Hint := Objeto.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO1.ShowHint := True;

      Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
      Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
      Objeto.GpoProd.GetParams(Objeto);

      Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
      Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      Objeto.Empresa.GetParams(Objeto);

      Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
      Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
      Objeto.UnidadNegocio.GetParams(Objeto);

      Objeto.Moneda.CVE_MONEDA.Control := edCVE_MONEDA;
      Objeto.Moneda.DESC_MONEDA.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);

      Objeto.Proveedor.ID_ACREDITADO.Control   := edID_PROVEEDOR;
      Objeto.Proveedor.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
      Objeto.Proveedor.Persona.Nombre.Control  := edDESC_PROVEEDOR;
      Objeto.Proveedor.GetParams(Objeto);

      AsignaEmpresaSuc;
end;

procedure TwMCedExPg.FormDestroy(Sender: TObject);
begin
    Objeto.Persona.Id_Persona.Control := nil;
    Objeto.Persona.Nombre.Control := nil;
    Objeto.Promotor.Nombre.Control :=nil;
    Objeto.Promotor.Id_Persona.Control :=nil;
    Objeto.PromotorAdmon.Nombre.Control :=nil;
    Objeto.PromotorAdmon.Id_Persona.Control :=nil;
    Objeto.CrGrupEco.CVE_GRUPO_ECO.Control :=Nil;
    Objeto.CrGrupEco.DESC_AGRUPO_ECO.Control :=Nil;
    Objeto.Producto.CVE_PRODUCTO_CRE.Control := nil;
    Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
    Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= nil;
    Objeto.GpoProd.DESC_C_PROD_GPO.Control:= nil;
    Objeto.Empresa.ID_Empresa.Control := Nil;
    Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
    Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
    Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
    Objeto.Moneda.CVE_MONEDA.Control := Nil;
    Objeto.Moneda.DESC_MONEDA.Control := Nil;
    Objeto.Proveedor.ID_ACREDITADO.Control := Nil;
    Objeto.Proveedor.CVE_FND_ENT_DES.Control := Nil;
    Objeto.Proveedor.Persona.Nombre.Control := Nil;
end;

procedure TwMCedExPg.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMCedExPg.btPROMOTORClick(Sender: TObject);
begin
    Objeto.Promotor.ShowAll := True;
    If Objeto.Promotor.Busca Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMCedExPg.ilPROMOTORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMCedExPg.ilPROMOTOREjecuta(Sender: TObject);
begin
    If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMCedExPg.edID_PROMOTORExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_PROMOTOR,True,'',True);
end;

procedure TwMCedExPg.chbxPromotorClick(Sender: TObject);
begin
   EnableCheckBox(chbxPromotor);
   Objeto.Promotor.Active := chbxPromotor.Checked;
end;

procedure TwMCedExPg.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCEDEXPG_PREVI',True,True) then
   begin
     ImprimeReporte(True, grPreview );
   end;  
end;

procedure TwMCedExPg.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMCedExPg.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Persona.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMCedExPg.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Persona.ShowAll := True;
   If Objeto.Persona.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMCedExPg.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
end;

procedure TwMCedExPg.btPRODUCTOClick(Sender: TObject);
begin
   if Objeto.Persona.Cve_Per_Juridica.AsString = 'PF' then
   Begin
      Objeto.Producto.BuscaWhereString:= ' CR_PRODUCTO.B_PER_FISICA = '
                                       + #39 + 'V' + #39
                                       + ' AND CR_PRODUCTO.SIT_PRODUCTO ='
                                       + #39 + 'AC' + #39 ;
      Objeto.Producto.FilterString := Objeto.Producto.BuscaWhereString;
   end
   else if Objeto.Persona.Cve_Per_Juridica.AsString = 'PM' then
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

procedure TwMCedExPg.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMCedExPg.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;


procedure TwMCedExPg.chbxProductoClick(Sender: TObject);
begin
   EnableCheckBox(chbxProducto);
   Objeto.Producto.Active := chbxProducto.Checked;
end;

procedure TwMCedExPg.chbxAcreditadoClick(Sender: TObject);
begin
   EnableCheckBox(chbxAcreditado);
   Objeto.Persona.Active := chbxAcreditado.Checked;
end;

procedure TwMCedExPg.edACREDITADOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TwMCedExPg.btPROM_ADMONClick(Sender: TObject);
begin
    Objeto.PromotorAdmon.ShowAll := True;
    If Objeto.PromotorAdmon.Busca Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TwMCedExPg.ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMCedExPg.ilPromAdmonEjecuta(Sender: TObject);
begin
    If Objeto.PromotorAdmon.FindKey([ilPromAdmon.Buffer]) Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TwMCedExPg.edID_PROMExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_PROM,True,'',True);
end;

procedure TwMCedExPg.chbxPromAmonClick(Sender: TObject);
begin
   EnableCheckBox(chbxPromAmon);
   Objeto.PromotorAdmon.Active := chbxPromAmon.Checked;
end;

procedure TwMCedExPg.edID_PROMOTORChange(Sender: TObject);
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

procedure TwMCedExPg.edID_PROMChange(Sender: TObject);
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

Procedure TwMCedExPg.ImprimeReporte(bPreview:Boolean; grOpcion  : TGenRepOption );
Var
   vlError : String;
   iFondeo : Integer;
   sFondeo : String;
begin
   //limpia tabla temporal
   ClearTblReport( Objeto.Apli, vlError );
   if vlError <> '' then
     ShowMessage(vlError)
   else
   Begin
      iFondeo:=rgFondeo.ItemIndex;
      case iFondeo of
          0: sFondeo := '';
          1: sFondeo := 'F';
          2: sFondeo := 'V';
      end;
   //Genera reporte
      RepCedExpPag( edF_Inicio.Text        , edF_Fin.Text           ,     edACREDITADO.Text      ,
                    edID_CREDITO.Text      , edID_PROMOTOR.Text     ,     edID_PROM.Text         ,
                    edCVE_GRUPO_ECO.Text   , edCVE_PRODUCTO_CRE.Text,     edCVE_PRODUCTO_GPO.Text,
                    sFondeo,
                    EdIdEmpresa.Text       , EdIDSucursal.Text      ,     edCVE_MONEDA.Text     ,
                    edID_PROVEEDOR.Text    , edCVE_FND_ENT_DES.Text ,     edNbrArch.Text         ,
                    cbDiasImpagado.Checked , cbMuestraProveedor.Checked,  Objeto.Apli            ,
                    bPreview               );

      If Trim(edNbrArch.Text)<>'' Then Begin
         If bGenArch Then
           ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
         Else
           ShowMessage('No se generó el Archivo')
      End;
   end;
End;
procedure TwMCedExPg.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCEDEXPG_IMPRI',True,True) then
   begin
      ImprimeReporte( False, grPrint );
   end;
end;

procedure TwMCedExPg.edID_CREDITOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CREDITO,True,'',True);
end;

procedure TwMCedExPg.btID_CREDITOClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('ICRDIMCR.IT','I');
      Try
        If T.Execute Then
           Begin
             edID_CREDITO.Text := T.DameCampo(0);
             edDESC_ID_CREDITO.Text := T.DameCampo(1);
             cbID_CREDITO.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
    
end;

procedure TwMCedExPg.ilCreditoCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMCedExPg.sbExcelClick(Sender: TObject);
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

procedure TwMCedExPg.cbxArchivoClick(Sender: TObject);
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

procedure TwMCedExPg.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TwMCedExPg.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   EnableCheckBox(cbxCVE_PRODUCTO_GPO);
   Objeto.GpoProd.Active := cbxCVE_PRODUCTO_GPO.Checked;
end;

procedure TwMCedExPg.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMCedExPg.ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMCedExPg.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

Procedure TwMCedExPg.CambiaControl;
Begin
   cbxCVE_PRODUCTO_GPO.Checked:=True;
   cbxCVE_PRODUCTO_GPO.Enabled:=True;
End;
procedure TwMCedExPg.edCVE_PRODUCTO_GPOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_GPO,True,'',True);
end;

procedure TwMCedExPg.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMCedExPg.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMCedExPg.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMCedExPg.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMCedExPg.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMCedExPg.btCVE_GRUPO_ECOClick(Sender: TObject);
begin
   Objeto.CrGrupEco.ShowAll := True;
   if Objeto.CrGrupEco.Busca then Begin
      cbCVE_GRUPO_ECO.Checked:= True;
      cbCVE_GRUPO_ECO.Enabled:= True;
   End;
end;

procedure TwMCedExPg.ilCVE_GRUPO_ECOEjecuta(Sender: TObject);
begin
   If Objeto.CrGrupEco.FindKey([ilCVE_GRUPO_ECO.Buffer]) Then Begin
      cbCVE_GRUPO_ECO.Checked:=True;
      cbCVE_GRUPO_ECO.Enabled:=True;
   End;
end;

procedure TwMCedExPg.cbCVE_GRUPO_ECOClick(Sender: TObject);
begin
   EnableCheckBox(cbCVE_GRUPO_ECO);
   Objeto.CrGrupEco.Active := cbCVE_GRUPO_ECO.Checked;
end;

procedure TwMCedExPg.cbID_CREDITOClick(Sender: TObject);
begin
   EnableCheckBox(cbID_CREDITO);
   edID_CREDITO.Enabled := cbID_CREDITO.Checked;

   IF NOT (edID_CREDITO.Enabled ) then Begin
      edID_CREDITO.Text := '';
      edDESC_ID_CREDITO.Text := '';
   End;
end;

procedure TwMCedExPg.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
  With Objeto Do
    Begin
    If MONEDA.FindKey([ilCVE_MONEDA.Buffer]) Then
       Begin
       cbCVE_MONEDA.Checked:= True;
       cbCVE_MONEDA.Enabled:= True;
       InterForma1.NextTab(edCVE_MONEDA);
       End;
    End;
end;

procedure TwMCedExPg.btnCVE_MONEDAClick(Sender: TObject);
begin
  With Objeto Do
    Begin
    Moneda.ShowAll := True;
    If Moneda.Busca Then
       Begin
       cbCVE_MONEDA.Checked:= True;
       cbCVE_MONEDA.Enabled:= True;
       InterForma1.NextTab(edCVE_MONEDA);
       End;
    End;
end;

procedure TwMCedExPg.cbCVE_MONEDAClick(Sender: TObject);
begin
   EnableCheckBox(cbCVE_MONEDA);
   Objeto.Moneda.Active := cbCVE_MONEDA.Checked;
end;

procedure TwMCedExPg.btnID_PROVEEDORClick(Sender: TObject);
begin
  With Objeto Do
    Begin
    Proveedor.ShowAll := True;
    If Proveedor.Busca Then
       Begin
       cbID_PROVEEDOR.Checked:= True;
       cbID_PROVEEDOR.Enabled:= True;
       InterForma1.NextTab(edID_PROVEEDOR);
       cbMuestraProveedor.Checked := True;;
       End;
    End;
end;

procedure TwMCedExPg.cbID_PROVEEDORClick(Sender: TObject);
begin
   EnableCheckBox(cbID_PROVEEDOR);
   Objeto.Proveedor.Active := cbID_PROVEEDOR.Checked;
end;

end.

