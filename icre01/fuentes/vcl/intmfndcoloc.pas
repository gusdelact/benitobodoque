// Sistema         : Clase de TMFndColoc
// Fecha de Inicio : 18/01/2005
// Función forma   : Clase de TMFndColoc
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMFndColoc;

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
IntCrCredito,     //Disposición
IntParamCre,
IntMQrFndColoca,       //Reporte
IntMProdGpo,
Intempre,          //Empresa
IntUnNeg,           //Unidad Negocio/Suc
IntMInstDesc,
IntMPrgApoyo,
IntCrOrigRec
;

Type
 TMFndColoc= class;

  TwMFndColoc=Class(TForm)
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
    edID_PROM: TEdit;
    Label2: TLabel;
    chbxCESION: TCheckBox;
    edCESION: TEdit;
    btID_CESION: TBitBtn;
    edID_CESION: TEdit;
    ilCesion: TInterLinkit;
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    edF_Inicio: TEdit;
    dtpF_Inicio: TInterDateTimePicker;
    Label3: TLabel;
    edF_FIN: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    CbPromotorAso: TCheckBox;
    chbxTipoSector: TCheckBox;
    CbPromotorAdm: TCheckBox;
    CbEmisorProv: TCheckBox;
    SaveDialog1: TSaveDialog;
    edNbrArch: TEdit;
    sbExcel: TSpeedButton;
    Label4: TLabel;
    cbxArchivo: TCheckBox;
    rgDescDoc: TRadioGroup;
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
    Label9: TLabel;
    edCVE_FND_ENT_DES: TEdit;
    edCVE_FND_PROGRAMA: TEdit;
    btCVE_FND_PROGRAMA: TBitBtn;
    btCVE_FND_ENT_DES: TBitBtn;
    ilCVE_FND_ENT_DES: TInterLinkit;
    ilCVE_FND_PROGRAMA: TInterLinkit;
    edNOM_FND_ENT_DES: TEdit;
    edNOM_FND_PROGRAMA: TEdit;
    cbxCVE_FND_ENT_DES: TCheckBox;
    cbxCVE_FND_PROGRAMA: TCheckBox;
    Label10: TLabel;
    edCVE_ORIGEN_REC: TEdit;
    btCVE_ORIGEN_REC: TBitBtn;
    ilCVE_ORIGEN_REC: TInterLinkit;
    edNOM_ORIGEN_REC: TEdit;
    cbxCVE_ORIGEN_REC: TCheckBox;
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
    procedure edCVE_ORIGEN_RECExit(Sender: TObject);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);
    procedure edCVE_FND_PROGRAMAExit(Sender: TObject);
    procedure btCVE_ORIGEN_RECClick(Sender: TObject);
    procedure ilCVE_ORIGEN_RECCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_FND_PROGRAMACapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_ORIGEN_RECEjecuta(Sender: TObject);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure ilCVE_FND_PROGRAMAEjecuta(Sender: TObject);
    procedure cbxCVE_ORIGEN_RECClick(Sender: TObject);
    procedure cbxCVE_FND_ENT_DESClick(Sender: TObject);
    procedure cbxCVE_FND_PROGRAMAClick(Sender: TObject);
    procedure btCVE_FND_ENT_DESClick(Sender: TObject);
    procedure btCVE_FND_PROGRAMAClick(Sender: TObject);
    private
    { Private declarations }
       Procedure ImprimeReporte(bPreview:Boolean);
       Procedure CambiaControl;
       Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMFndColoc;
end;
 TMFndColoc= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        Producto                 : TCrProduct;
        Moneda                   : TMoneda;
        Acreditado               : TCrAcredit;
        Promotor                 : TMPersona; //Promotor Responsable
        PromotorAdmon            : TMPersona; //Promotor Admon
        Credito                  : TCrCredito;//Disposición
        ParamCre                 : TParamCre;
        GpoProd                  : TMProdGpo;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        MInstDesc                : TMInstDesc;
        MPrgApoyo                : TMPrgApoyo;
        OrigRec                  : TCrOrigRec;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TMFndColoc.Create( AOwner : TComponent );
begin Inherited;
      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='CVE_PRODUCTO_CRE';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

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

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      GpoProd:= TMProdGpo.Create(Self);
      GpoProd.MasterSource:=Self;
      GpoProd.FieldByName('CVE_PRODUCTO_GPO').MasterField:='CVE_PRODUCTO_GPO';

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      MInstDesc := TMInstDesc.Create(Self);
      MInstDesc.MasterSource:=Self;
      MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';

      MPrgApoyo := TMPrgApoyo.Create(Self);
      MPrgApoyo.MasterSource:=Self;
      MPrgApoyo.FieldByName('CVE_FND_PROGRAMA').MasterField:='CVE_FND_PROGRAMA';

      OrigRec := TCrOrigRec.Create(Self);
      OrigRec.MasterSource:=Self;
      OrigRec.FieldByName('CVE_ORIGEN_REC').MasterField:='CVE_ORIGEN_REC';

      UseQuery := False;
      HelpFile := 'InMFndColoc.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMFndColoc.Destroy;
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
   If GpoProd <> Nil Then
      GpoProd.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   If MInstDesc <> Nil Then
      MInstDesc.Free;
   If MPrgApoyo <> Nil Then
      MPrgApoyo.Free;
   If OrigRec <> Nil Then
      OrigRec.Free;
   inherited;
end;


function TMFndColoc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMFndColoc;
begin
   W:=TwMFndColoc.Create(Self);
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


Function TMFndColoc.InternalBusca:Boolean;
begin InternalBusca := False;
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMFndColoc.AsignaEmpresaSuc;
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

procedure TwMFndColoc.FormShow(Sender: TObject);
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
   Objeto.Promotor.Nombre.Control :=edNOM_PROMOTOR;
   Objeto.Promotor.GetParams(Objeto);
   edNOM_PROMOTOR.Hint := Objeto.Promotor.Nombre.AsString;
   edNOM_PROMOTOR.ShowHint := True;

   Objeto.PromotorAdmon.ID_Persona.Control :=edID_PROM;
   Objeto.PromotorAdmon.Nombre.Control :=edNOM_PROM;
   Objeto.PromotorAdmon.GetParams(Objeto);
   edNOM_PROM.Hint := Objeto.PromotorAdmon.Nombre.AsString;
   edNOM_PROM.ShowHint := True;

   Objeto.Credito.ID_CREDITO.Control := edID_CESION;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
   Objeto.Credito.GetParams(Objeto);
   edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
   edCESION.ShowHint := True;

   Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
   Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
   Objeto.GpoProd.GetParams(Objeto);

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);

   Objeto.MInstDesc.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
   Objeto.MInstDesc.DESC_ENT_DES.Control    := edNOM_FND_ENT_DES;
   Objeto.MInstDesc.GetParams(Objeto);

   Objeto.MPrgApoyo.CVE_FND_PROGRAMA.Control:= edCVE_FND_PROGRAMA;
   Objeto.MPrgApoyo.DESC_PROGRAMA.Control   := edNOM_FND_PROGRAMA;
   Objeto.MPrgApoyo.GetParams(Objeto);

   Objeto.OrigRec.CVE_ORIGEN_REC.Control  := edCVE_ORIGEN_REC;
   Objeto.OrigRec.DESC_ORIGEN_REC.Control := edNOM_ORIGEN_REC;
   Objeto.OrigRec.GetParams(Objeto);

   AsignaEmpresaSuc;
end;

procedure TwMFndColoc.FormDestroy(Sender: TObject);
begin
   Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
   Objeto.Acreditado.ID_ACREDITADO.Control := nil;
   Objeto.Acreditado.Persona.Nombre.Control := nil;
   Objeto.Moneda.Cve_Moneda.Control := nil;
   Objeto.Moneda.Desc_Moneda.Control := nil;
   Objeto.Promotor.Nombre.Control :=nil;
   Objeto.Promotor.Id_Persona.Control :=nil;
   Objeto.PromotorAdmon.Nombre.Control :=nil;
   Objeto.PromotorAdmon.Id_Persona.Control :=nil;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
   Objeto.Credito.ID_CREDITO.Control := nil;
   Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= nil;
   Objeto.GpoProd.DESC_C_PROD_GPO.Control:= nil;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
   Objeto.MInstDesc.CVE_FND_ENT_DES.Control  := Nil;
   Objeto.MInstDesc.DESC_ENT_DES.Control     := Nil;
   Objeto.MPrgApoyo.CVE_FND_PROGRAMA.Control := Nil;
   Objeto.MPrgApoyo.DESC_PROGRAMA.Control    := Nil;
   Objeto.OrigRec.CVE_ORIGEN_REC.Control     := Nil;
   Objeto.OrigRec.DESC_ORIGEN_REC.Control    := Nil;
end;

procedure TwMFndColoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMFndColoc.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMFndColoc.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWNinguno.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TwMFndColoc.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMFndColoc.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMFndColoc.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TwMFndColoc.edCVE_MONEDAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
end;

procedure TwMFndColoc.btPROMOTORClick(Sender: TObject);
begin
    Objeto.Promotor.ShowAll := True;
    If Objeto.Promotor.Busca Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMFndColoc.ilPROMOTORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMFndColoc.ilPROMOTOREjecuta(Sender: TObject);
begin
    If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMFndColoc.edID_PROMOTORExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_PROMOTOR,True,'',True);
end;

procedure TwMFndColoc.chbxMonedaClick(Sender: TObject);
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

procedure TwMFndColoc.chbxPromotorClick(Sender: TObject);
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

procedure TwMFndColoc.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMFNDCOLOC_PREVI',True,True) then
   begin
     ImprimeReporte(True);
   end;  
end;

procedure TwMFndColoc.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMFndColoc.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMFndColoc.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMFndColoc.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
end;

procedure TwMFndColoc.btPRODUCTOClick(Sender: TObject);
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

procedure TwMFndColoc.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMFndColoc.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;


procedure TwMFndColoc.chbxProductoClick(Sender: TObject);
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

procedure TwMFndColoc.chbxAcreditadoClick(Sender: TObject);
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

procedure TwMFndColoc.edACREDITADOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TwMFndColoc.btPROM_ADMONClick(Sender: TObject);
begin
    Objeto.PromotorAdmon.ShowAll := True;
    If Objeto.PromotorAdmon.Busca Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TwMFndColoc.ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMFndColoc.ilPromAdmonEjecuta(Sender: TObject);
begin
    If Objeto.PromotorAdmon.FindKey([ilPromAdmon.Buffer]) Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TwMFndColoc.edID_PROMExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_PROM,True,'',True);
end;

procedure TwMFndColoc.chbxPromAmonClick(Sender: TObject);
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

procedure TwMFndColoc.edID_PROMOTORChange(Sender: TObject);
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

procedure TwMFndColoc.edID_PROMChange(Sender: TObject);
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

Procedure TwMFndColoc.ImprimeReporte(bPreview:Boolean);
Var
    sSituacion, sGpoProd, sProcam, sOperDD :String;
    iSit, iNafin, iDescDoc: Integer;
    dIntereses : Double;
begin
    iSit:=rgSitMov.ItemIndex;
    sProcam := '';
    case iSit of
        0: sSituacion:=SQLStr('LQ')+','+SQLStr('AC');  //Autorizados / liquidados
        1: sSituacion:=SQLStr('CA');  //Cancelado
        2: sSituacion:=SQLStr('AC');  //Autorizado
        3: sSituacion:=SQLStr('LQ');  //Cancelado
        4: sSituacion:=SQLStr('NA');  //No Autorizado
        5: sSituacion:='';    //Todos

    end;

    sGpoProd:= Trim(edCVE_PRODUCTO_GPO.Text);
    iDescDoc:=rgDescDoc.ItemIndex;
    case iDescDoc of
        0: sOperDD := '';
        1: sOperDD := 'V';
        2: sOperDD := 'F';
    end;
    RepFndColocaciones(
                     edF_Inicio.Text        , edF_Fin.Text           , edCVE_PRODUCTO_CRE.Text,
                     edCVE_MONEDA.Text      , edACREDITADO.Text      , edID_PROMOTOR.Text     ,
                     edID_PROM.Text         , edID_CESION.Text       , sSituacion             ,
                     sGpoProd          , sProcam                , CbPromotorAso.Checked  ,
                     CbPromotorAdm.Checked  , chbxTipoSector.Checked , CbEmisorProv.Checked   ,
                     edNbrArch.Text, sOperDD, EdIdEmpresa.Text       , EdIDSucursal.Text  ,
                     edCVE_ORIGEN_REC.Text  , edCVE_FND_ENT_DES.Text , edCVE_FND_PROGRAMA.Text,
                     Objeto.Apli            , bPreview               );
    If Trim(edNbrArch.Text)<>'' Then Begin
       If bGenArch Then
         ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
       Else
         ShowMessage('No se generó el Archivo')
    End;
End;
procedure TwMFndColoc.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMFNDCOLOC_IMPRI',True,True) then
   begin
     ImprimeReporte(False);
   end;
end;

procedure TwMFndColoc.edID_CESIONChange(Sender: TObject);
begin
    If Trim(edID_CESION.Text)<>'' Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End Else Begin
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End;
end;

procedure TwMFndColoc.edID_CESIONExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CESION,True,'',True);
end;

procedure TwMFndColoc.btID_CESIONClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TwMFndColoc.chbxCESIONClick(Sender: TObject);
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

procedure TwMFndColoc.ilCesionCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMFndColoc.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;



procedure TwMFndColoc.sbExcelClick(Sender: TObject);
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

procedure TwMFndColoc.cbxArchivoClick(Sender: TObject);
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

procedure TwMFndColoc.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TwMFndColoc.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
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

procedure TwMFndColoc.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMFndColoc.ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMFndColoc.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

Procedure TwMFndColoc.CambiaControl;
Begin
   If Objeto.GpoProd.B_APLICA_FONDEO.AsString = 'V' Then
      rgDescDoc.Enabled:= True
   Else
      rgDescDoc.Enabled:= False;
   cbxCVE_PRODUCTO_GPO.Checked:=True;
   cbxCVE_PRODUCTO_GPO.Enabled:=True;
End;
procedure TwMFndColoc.edCVE_PRODUCTO_GPOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_GPO,True,'',True);
end;

procedure TwMFndColoc.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMFndColoc.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMFndColoc.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMFndColoc.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMFndColoc.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMFndColoc.edCVE_ORIGEN_RECExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_ORIGEN_REC,True,'',True);
end;

procedure TwMFndColoc.edCVE_FND_ENT_DESExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_FND_ENT_DES,True,'',True);
end;

procedure TwMFndColoc.edCVE_FND_PROGRAMAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_FND_PROGRAMA,True,'',True);
end;

procedure TwMFndColoc.btCVE_ORIGEN_RECClick(Sender: TObject);
begin
   Objeto.OrigRec.ShowAll := True;
   If Objeto.OrigRec.Busca Then Begin
      cbxCVE_ORIGEN_REC.Checked:=True;
      cbxCVE_ORIGEN_REC.Enabled:=True;
      InterForma1.NextTab(edCVE_ORIGEN_REC);
   End;
end;

procedure TwMFndColoc.ilCVE_ORIGEN_RECCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMFndColoc.ilCVE_FND_ENT_DESCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMFndColoc.ilCVE_FND_PROGRAMACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMFndColoc.ilCVE_ORIGEN_RECEjecuta(Sender: TObject);
begin
   If Objeto.OrigRec.FindKey([ilCVE_ORIGEN_REC.Buffer]) Then Begin
      cbxCVE_ORIGEN_REC.Checked:=True;
      cbxCVE_ORIGEN_REC.Enabled:=True;
      InterForma1.NextTab(edCVE_ORIGEN_REC);
   End;
end;

procedure TwMFndColoc.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   If Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) Then Begin
      cbxCVE_FND_ENT_DES.Checked:=True;
      cbxCVE_FND_ENT_DES.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TwMFndColoc.ilCVE_FND_PROGRAMAEjecuta(Sender: TObject);
begin
   If Objeto.MPrgApoyo.FindKey([Trim(edCVE_FND_ENT_DES.Text),
                                 ilCVE_FND_PROGRAMA.Buffer]) Then Begin
      cbxCVE_FND_PROGRAMA.Checked:=True;
      cbxCVE_FND_PROGRAMA.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_PROGRAMA);
   End;
end;

procedure TwMFndColoc.cbxCVE_ORIGEN_RECClick(Sender: TObject);
begin
   If not cbxCVE_ORIGEN_REC.Checked Then Begin
      Objeto.OrigRec.Active:=False;
      cbxCVE_ORIGEN_REC.Checked:=False;
      cbxCVE_ORIGEN_REC.Enabled:=False;
   End Else Begin
      cbxCVE_ORIGEN_REC.Checked:=True;
      cbxCVE_ORIGEN_REC.Enabled:=True;
   End;
end;

procedure TwMFndColoc.cbxCVE_FND_ENT_DESClick(Sender: TObject);
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

procedure TwMFndColoc.cbxCVE_FND_PROGRAMAClick(Sender: TObject);
begin
   If not cbxCVE_FND_PROGRAMA.Checked Then Begin
      Objeto.MPrgApoyo.Active:=False;
      cbxCVE_FND_PROGRAMA.Checked:=False;
      cbxCVE_FND_PROGRAMA.Enabled:=False;
   End Else Begin
      cbxCVE_FND_PROGRAMA.Checked:=True;
      cbxCVE_FND_PROGRAMA.Enabled:=True;
   End;
end;

procedure TwMFndColoc.btCVE_FND_ENT_DESClick(Sender: TObject);
begin
   Objeto.MInstDesc.ShowAll := True;
   If Objeto.MInstDesc.Busca Then Begin
      cbxCVE_FND_ENT_DES.Checked:=True;
      cbxCVE_FND_ENT_DES.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TwMFndColoc.btCVE_FND_PROGRAMAClick(Sender: TObject);
begin
   If Trim(edCVE_FND_ENT_DES.Text)<>'' Then Begin
      Objeto.MPrgApoyo.BuscaWhereString :=
            'CR_FND_PROGRAMA.CVE_FND_ENT_DES =' + #39 + Trim(edCVE_FND_ENT_DES.Text)+ #39;
   End Else Begin
      Objeto.MPrgApoyo.BuscaWhereString:= '';
   End;
   Objeto.MPrgApoyo.FilterString := Objeto.MPrgApoyo.BuscaWhereString;
   Objeto.MPrgApoyo.ShowAll := True;
   If Objeto.MPrgApoyo.Busca Then Begin
      cbxCVE_FND_PROGRAMA.Checked:=True;
      cbxCVE_FND_PROGRAMA.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_PROGRAMA);
   End;
end;

end.

