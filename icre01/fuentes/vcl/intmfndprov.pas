// Sistema         : Clase de TMFndProv
// Fecha de Inicio : 20/01/2005
// Función forma   : Clase de TMFndProv
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMFndProv;
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,
Math,

//Unidades Adicionales
IntMProdGpo,      //Grupo de Producto de Crédito
IntCrProduct,     //Producto de crédito
IntMPers,         //PromotorAsoc
IntEmple,
IntPers,
IntParamCre,      //Parámetros de Crédito
IntMQrFndProv,     //Reporte de Provisión Diaria
Intempre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntMInstDesc, IntMPrgApoyo, IntCrOrigRec
;

Type
 TMFndProv= class;

  TwMFndProv=Class(TForm)
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
    lbCVE_PRODUCTO_CRE: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    ilPRODUCTO: TInterLinkit;
    chbxProducto: TCheckBox;
    GroupBox1: TGroupBox;                                                                                 
    lbLiqF_INICIO: TLabel;
    edF_Inicio: TEdit;
    dtpF_Inicio: TInterDateTimePicker;
    Label3: TLabel;
    edF_FIN: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    Label1: TLabel;
    edGpoProd: TEdit;
    btGpoProd: TBitBtn;
    edNomGpoProd: TEdit;
    chbxGpoProd: TCheckBox;
    ilGpoProd: TInterLinkit;
    Label2: TLabel;
    edPromAdmin: TEdit;
    btPromAdmin: TBitBtn;
    edNomPromAdmin: TEdit;
    chbxPromAdmin: TCheckBox;
    ilPromAdmin: TInterLinkit;
    Label4: TLabel;
    edPromAsoc: TEdit;
    btPromAsoc: TBitBtn;
    edNomPromAsoc: TEdit;
    chbxPromAsoc: TCheckBox;
    ilPromAsoc: TInterLinkit;
    rgCartera: TRadioGroup;
    rgTraspaso: TRadioGroup;
    cbxOrdenProm: TCheckBox;
    cbxOrdenCliente: TCheckBox;
    cbxResumen: TCheckBox;
    cbxArchivo: TCheckBox;
    edNbrArch: TEdit;
    sbExcel: TSpeedButton;
    Label6: TLabel;
    SaveDialog1: TSaveDialog;
    rgSubtipos: TRadioGroup;
    cbxCatMin: TCheckBox;
    Label5: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    chbxAcreditado: TCheckBox;
    ilACREDITADO: TInterLinkit;
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
    Label10: TLabel;
    Label11: TLabel;
    edCVE_FND_ENT_DES: TEdit;
    edCVE_FND_PROGRAMA: TEdit;
    btCVE_FND_PROGRAMA: TBitBtn;
    btCVE_FND_ENT_DES: TBitBtn;
    edNOM_FND_ENT_DES: TEdit;
    edNOM_FND_PROGRAMA: TEdit;
    cbxCVE_FND_ENT_DES: TCheckBox;
    cbxCVE_FND_PROGRAMA: TCheckBox;
    edCVE_ORIGEN_REC: TEdit;
    btCVE_ORIGEN_REC: TBitBtn;
    edNOM_ORIGEN_REC: TEdit;
    cbxCVE_ORIGEN_REC: TCheckBox;
    ilCVE_FND_ENT_DES: TInterLinkit;
    ilCVE_FND_PROGRAMA: TInterLinkit;
    ilCVE_ORIGEN_REC: TInterLinkit;
    cbxOrdenPromAdmin: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure edGpoProdExit(Sender: TObject);
    procedure btGpoProdClick(Sender: TObject);
    procedure chbxGpoProdClick(Sender: TObject);
    procedure ilGpoProdCapture(Sender: TObject; var Show: Boolean);
    procedure ilGpoProdEjecuta(Sender: TObject);
    procedure edPromAdminExit(Sender: TObject);
    procedure btPromAdminClick(Sender: TObject);
    procedure chbxPromAdminClick(Sender: TObject);
    procedure ilPromAdminCapture(Sender: TObject; var Show: Boolean);
    procedure ilPromAdminEjecuta(Sender: TObject);
    procedure edPromAsocExit(Sender: TObject);
    procedure btPromAsocClick(Sender: TObject);
    procedure chbxPromAsocClick(Sender: TObject);
    procedure ilPromAsocCapture(Sender: TObject; var Show: Boolean);
    procedure ilPromAsocEjecuta(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edPromAdminChange(Sender: TObject);
    procedure edPromAsocChange(Sender: TObject);
    procedure edACREDITADOExit(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure edCVE_ORIGEN_RECExit(Sender: TObject);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);
    procedure edCVE_FND_PROGRAMAExit(Sender: TObject);
    procedure btCVE_ORIGEN_RECClick(Sender: TObject);
    procedure btCVE_FND_ENT_DESClick(Sender: TObject);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure ilCVE_ORIGEN_RECCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_FND_PROGRAMACapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_ORIGEN_RECEjecuta(Sender: TObject);
    procedure btCVE_FND_PROGRAMAClick(Sender: TObject);
    procedure ilCVE_FND_PROGRAMAEjecuta(Sender: TObject);
    procedure cbxCVE_ORIGEN_RECClick(Sender: TObject);
    procedure cbxCVE_FND_ENT_DESClick(Sender: TObject);
    procedure cbxCVE_FND_PROGRAMAClick(Sender: TObject);
    private
    { Private declarations }
        Procedure ImprimeReporte(bPreview:Boolean);
     Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMFndProv;
end;
 TMFndProv= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        GpoProducto              : TMProdGpo;
        Producto                 : TCrProduct;
        Promotor                 : TEmpleado; //Promotor Responsable
        PromotorAdmon            : TEmpleado; //Promotor Admon
        ParamCre                 : TParamCre;
        Acreditado               : TPersona;
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
{$R *.DFM}

constructor TMFndProv.Create( AOwner : TComponent );
begin Inherited;

   Acreditado := TPersona.Create(Self);
   Acreditado.MasterSource := Self;
   Acreditado.FieldByName('ID_PERSONA').MasterField := 'ID_ACREDITADO';
   Acreditado.BuscaWhereString := 'SIT_PERSONA = ''AC''';

   Producto :=  TCrProduct.Create(Self);
   Producto.MasterSource:=Self;
   Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField := 'CVE_PRODUCTO_CRE';

   GpoProducto := TMProdGpo.Create(Self);
   GpoProducto.MasterSource:=Self;
   GpoProducto.FieldByName('CVE_PRODUCTO_GPO').MasterField := 'CVE_PRODUCTO_GPO';

   Promotor := TEmpleado.Create(Self);
   Promotor.FilterBy := fbTMPersonaEmpleado;
   Promotor.MasterSource := Self;
   Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
   Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

   PromotorAdmon := TEmpleado.Create(Self);
   PromotorAdmon.FilterBy := fbTMPersonaEmpleado;
   PromotorAdmon.MasterSource := Self;
   PromotorAdmon.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR_ADM';

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
   HelpFile := 'InTMFndProv.Hlp';
   ShowMenuReporte:=True;
end;

Destructor TMFndProv.Destroy;
begin
   If Acreditado <> Nil Then
      Acreditado.Free;
   If GpoProducto <> Nil Then
      GpoProducto.Free;
   If Producto <> Nil Then
      Producto.Free;
   If Promotor <> Nil Then
      Promotor.Free;
   If PromotorAdmon <> Nil Then
      PromotorAdmon.Free;
   If Empresa <> Nil Then
      Empresa.free;
   If UnidadNegocio <> Nil Then
      UnidadNegocio.Free;
   If MInstDesc <> Nil Then
      MInstDesc.Free;
   If MPrgApoyo <> Nil Then
      MPrgApoyo.Free;
   If OrigRec <> Nil Then
      OrigRec.Free;
   Inherited;
end;


function TMFndProv.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMFndProv;
begin
   W:=TwMFndProv.Create(Self);
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


Function TMFndProv.InternalBusca:Boolean;
begin InternalBusca := False;
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMFndProv.AsignaEmpresaSuc;
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

procedure TwMFndProv.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
  With Objeto Do
   Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    dtpF_Inicio.DateTime:= Apli.DameFechaEmpresaDia('D000')-1;
    dtpF_Fin.DateTime:= Apli.DameFechaEmpresaDia('D000')-1;
    edF_Inicio.text:=FormatDateTime('dd/mm/yyyy',dtpF_Inicio.DateTime);
    edF_FIN.text:=FormatDateTime('dd/mm/yyyy',dtpF_Fin.DateTime);

    Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
    Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;
    Producto.GetParams(Objeto);

    GpoProducto.CVE_PRODUCTO_GPO.Control := edGpoProd;
    GpoProducto.DESC_C_PROD_GPO.Control := edNomGpoProd;
    GpoProducto.GetParams(Objeto);

    Promotor.ID_Persona.Control :=edPromAsoc;
    Promotor.Persona.Nombre.Control :=edNomPromAsoc;
    Promotor.GetParams(Objeto);
    edNomPromAsoc.Hint := Promotor.Persona.Nombre.AsString;
    edNomPromAsoc.ShowHint := True;

    PromotorAdmon.ID_Persona.Control :=edPromAdmin;
    PromotorAdmon.Persona.Nombre.Control :=edNomPromAdmin;
    PromotorAdmon.GetParams(Objeto);
    edNomPromAdmin.Hint := PromotorAdmon.Persona.Nombre.AsString;
    edNomPromAdmin.ShowHint := True;
    edDESC_PRODUCTO1.Hint      := Producto.DESC_C_PRODUCTO.AsString;
    edDESC_PRODUCTO1.ShowHint := True;

    Acreditado.Id_Persona.Control := edACREDITADO;
    Acreditado.Nombre.Control := edNOMBRE_ACRED;
    GetParams(Objeto);
    edNOMBRE_ACRED.Hint := Acreditado.Nombre.AsString;
    edNOMBRE_ACRED.ShowHint := True;
   End;
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

procedure TwMFndProv.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      Acreditado.ID_Persona.Control := nil;
      Acreditado.Nombre.Control := nil;
      Producto.CVE_PRODUCTO_CRE.Control := Nil;
      Producto.DESC_C_PRODUCTO.Control := Nil;
      GpoProducto.CVE_PRODUCTO_GPO.Control := Nil;
      GpoProducto.DESC_C_PROD_GPO.Control := Nil;
      PromotorAdmon.ID_Persona.Control := Nil;
      PromotorAdmon.Persona.Nombre.Control := Nil;
      Promotor.Persona.Nombre.Control :=nil;
      Promotor.Id_Persona.Control :=nil;
      Empresa.ID_Empresa.Control := Nil;
      Empresa.PersonaMoral.Nombre.Control := Nil;
      UnidadNegocio.Id_Entidad.Control := Nil;
      UnidadNegocio.Desc_Entidad.Control := Nil;
      MInstDesc.CVE_FND_ENT_DES.Control  := Nil;
      MInstDesc.DESC_ENT_DES.Control     := Nil;
      MPrgApoyo.CVE_FND_PROGRAMA.Control := Nil;
      MPrgApoyo.DESC_PROGRAMA.Control    := Nil;
      OrigRec.CVE_ORIGEN_REC.Control     := Nil;
      OrigRec.DESC_ORIGEN_REC.Control    := Nil;
   End;
end;

procedure TwMFndProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMFndProv.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMFNDPROV_PREVI',True,True) then
      ImprimeReporte(True);
end;

procedure TwMFndProv.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
end;

procedure TwMFndProv.btPRODUCTOClick(Sender: TObject);
begin
   Objeto.Producto.ShowAll := True;
   If Objeto.Producto.Busca Then Begin
      chbxProducto.Checked:= True;
      chbxProducto.Enabled:= True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

procedure TwMFndProv.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMFndProv.ilPRODUCTOEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
      chbxProducto.Checked:=True;
      chbxProducto.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;


procedure TwMFndProv.chbxProductoClick(Sender: TObject);
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

Procedure TwMFndProv.ImprimeReporte(bPreview:Boolean);
var sCartera, sTraspaso,sSubTipo : String;
   iMax, iMin, i: Integer;
begin
   case rgCartera.ItemIndex Of
      0: sCartera:='';
      1: sCartera:='V';
      2: sCartera:='F';
   End;
   case rgTraspaso.ItemIndex Of
      0: sTraspaso:='';
      1: sTraspaso:='T';
      2: sTraspaso:='NT';
   End;

   case rgSubtipos.ItemIndex Of
      0: sSubTipo:='GL';
      1: sSubTipo:='CO';
      2: sSubTipo:='HI';
   End;

   iMax:= Max(Trunc(StrToDate(edF_Inicio.Text)),Trunc(StrToDate(edF_FIN.Text)));
   iMin:= Min(Trunc(StrToDate(edF_Inicio.Text)),Trunc(StrToDate(edF_FIN.Text)));

   For i:= iMin To iMax Do Begin
      ReporteFndProvisionDiaria ( FormatDateTime('dd/mm/yyyy',i),
                                       FormatDateTime('dd/mm/yyyy',iMax),
                                       edGpoProd.Text, edCVE_PRODUCTO_CRE.Text,
                                       edPromAdmin.Text, edPromAsoc.Text,
                                       sCartera, sTraspaso, edNbrArch.Text,sSubTipo,
                                       edACREDITADO.Text, EdIdEmpresa.Text,
                                       EdIDSucursal.Text,edCVE_ORIGEN_REC.Text,
                                       edCVE_FND_ENT_DES.Text, edCVE_FND_PROGRAMA.Text,
                                       cbxOrdenProm.Checked, cbxOrdenCliente.Checked,
                                       cbxResumen.Checked,cbxCatMin.Checked,
                                       cbxOrdenPromAdmin.Checked,
                                       Objeto.Apli, bPreview);
   End;
   If Trim(edNbrArch.Text)<>'' Then Begin
      If bGenArch Then
        ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
      Else
        ShowMessage('No se generó el Archivo')
   End;
End;
procedure TwMFndProv.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMFNDPROV_IMPRI',True,True) then
      ImprimeReporte(False);
end;

procedure TwMFndProv.edGpoProdExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edGpoProd,True,'',True);
end;

procedure TwMFndProv.btGpoProdClick(Sender: TObject);
begin
   Objeto.GpoProducto.ShowAll := True;
   If Objeto.GpoProducto.Busca Then Begin
      chbxGpoProd.Checked:= True;
      chbxGpoProd.Enabled:= True;
      InterForma1.NextTab(edGpoProd);
   End;
end;

procedure TwMFndProv.chbxGpoProdClick(Sender: TObject);
begin
   If not chbxGpoProd.Checked Then Begin
      Objeto.GpoProducto.Active:=False;
      chbxGpoProd.Checked:=False;
      chbxGpoProd.Enabled:=False;
   End Else Begin
      chbxGpoProd.Checked:=True;
      chbxGpoProd.Enabled:=True;
   End;
end;

procedure TwMFndProv.ilGpoProdCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMFndProv.ilGpoProdEjecuta(Sender: TObject);
begin
   If Objeto.GpoProducto.FindKey([ilGpoProd.Buffer])Then Begin
      chbxGpoProd.Checked:=True;
      chbxGpoProd.Enabled:=True;
      InterForma1.NextTab(edGpoProd);
   End;
end;

procedure TwMFndProv.edPromAdminExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edPromAdmin,True,'',True);
end;

procedure TwMFndProv.btPromAdminClick(Sender: TObject);
begin
    Objeto.PromotorAdmon.ShowAll := True;
    If Objeto.PromotorAdmon.Busca Then Begin
        chbxPromAdmin.Checked:=True;
        chbxPromAdmin.Enabled:=True;
        InterForma1.NextTab(edPromAdmin);
    End;
end;

procedure TwMFndProv.chbxPromAdminClick(Sender: TObject);
begin
   If not chbxPromAdmin.Checked Then Begin
      Objeto.PromotorAdmon.Active:=False;
      chbxPromAdmin.Checked:=False;
      chbxPromAdmin.Enabled:=False;
   End Else Begin
      chbxPromAdmin.Checked:=True;
      chbxPromAdmin.Enabled:=True;
   End;
end;

procedure TwMFndProv.ilPromAdminCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMFndProv.ilPromAdminEjecuta(Sender: TObject);
begin
   If Objeto.PromotorAdmon.FindKey([ilPromAdmin.Buffer])Then Begin
      chbxPromAdmin.Checked:=True;
      chbxPromAdmin.Enabled:=True;
      InterForma1.NextTab(edPromAdmin);
   End;
end;

procedure TwMFndProv.edPromAsocExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edPromAsoc,True,'',True);
end;

procedure TwMFndProv.btPromAsocClick(Sender: TObject);
begin
   Objeto.Promotor.ShowAll := True;
   If Objeto.Promotor.Busca Then Begin
      chbxPromAsoc.Checked:= True;
      chbxPromAsoc.Enabled:= True;
      InterForma1.NextTab(edPromAsoc);
   End;
end;

procedure TwMFndProv.chbxPromAsocClick(Sender: TObject);
begin
   If not chbxPromAsoc.Checked Then Begin
      Objeto.Promotor.Active:=False;
      chbxPromAsoc.Checked:=False;
      chbxPromAsoc.Enabled:=False;
   End Else Begin
      chbxPromAsoc.Checked:=True;
      chbxPromAsoc.Enabled:=True;
   End;
end;

procedure TwMFndProv.ilPromAsocCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMFndProv.ilPromAsocEjecuta(Sender: TObject);
begin
   If Objeto.Promotor.FindKey([ilPromAsoc.Buffer])Then Begin
      chbxPromAsoc.Checked:=True;
      chbxPromAsoc.Enabled:=True;
      InterForma1.NextTab(edPromAsoc);
   End;
end;

procedure TwMFndProv.sbExcelClick(Sender: TObject);
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

procedure TwMFndProv.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
      cbxArchivo.Checked:=True;
      cbxArchivo.Enabled:=True;
   End Else Begin
      cbxArchivo.Checked:=False;
      cbxArchivo.Enabled:=False;
   End;
end;

procedure TwMFndProv.cbxArchivoClick(Sender: TObject);
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

procedure TwMFndProv.edPromAdminChange(Sender: TObject);
begin
    If Trim(edPromAdmin.Text)<>'' Then Begin
        chbxPromAdmin.Checked:=True;
        chbxPromAdmin.Enabled:=True;
    End Else Begin
        chbxPromAdmin.Checked:=False;
        chbxPromAdmin.Enabled:=False;
    End;
end;

procedure TwMFndProv.edPromAsocChange(Sender: TObject);
begin
    If Trim(edPromAsoc.Text)<>'' Then Begin
        chbxPromAsoc.Checked:=True;
        chbxPromAsoc.Enabled:=True;
    End Else Begin
        chbxPromAsoc.Checked:=False;
        chbxPromAsoc.Enabled:=False;
    End;
end;

procedure TwMFndProv.edACREDITADOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TwMFndProv.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;

end;

procedure TwMFndProv.chbxAcreditadoClick(Sender: TObject);
begin
    If not chbxAcreditado.Checked Then Begin
        Objeto.Acreditado.Active:=False;
        chbxAcreditado.Checked:=False;
        chbxAcreditado.Enabled:=False;
    End Else Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
    End;
End;

procedure TwMFndProv.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMFndProv.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;

end;

procedure TwMFndProv.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMFndProv.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMFndProv.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMFndProv.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMFndProv.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMFndProv.edCVE_ORIGEN_RECExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_ORIGEN_REC,True,'',True);
end;

procedure TwMFndProv.edCVE_FND_ENT_DESExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_FND_ENT_DES,True,'',True);
end;

procedure TwMFndProv.edCVE_FND_PROGRAMAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_FND_PROGRAMA,True,'',True);
end;

procedure TwMFndProv.btCVE_ORIGEN_RECClick(Sender: TObject);
begin
   Objeto.OrigRec.ShowAll := True;
   If Objeto.OrigRec.Busca Then Begin
      cbxCVE_ORIGEN_REC.Checked:=True;
      cbxCVE_ORIGEN_REC.Enabled:=True;
      InterForma1.NextTab(edCVE_ORIGEN_REC);
   End;
end;

procedure TwMFndProv.btCVE_FND_ENT_DESClick(Sender: TObject);
begin
   Objeto.MInstDesc.ShowAll := True;
   If Objeto.MInstDesc.Busca Then Begin
      cbxCVE_FND_ENT_DES.Checked:=True;
      cbxCVE_FND_ENT_DES.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TwMFndProv.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   If Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) Then Begin
      cbxCVE_FND_ENT_DES.Checked:=True;
      cbxCVE_FND_ENT_DES.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TwMFndProv.ilCVE_ORIGEN_RECCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMFndProv.ilCVE_FND_ENT_DESCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMFndProv.ilCVE_FND_PROGRAMACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMFndProv.ilCVE_ORIGEN_RECEjecuta(Sender: TObject);
begin
   If Objeto.OrigRec.FindKey([ilCVE_ORIGEN_REC.Buffer]) Then Begin
      cbxCVE_ORIGEN_REC.Checked:=True;
      cbxCVE_ORIGEN_REC.Enabled:=True;
      InterForma1.NextTab(edCVE_ORIGEN_REC);
   End;
end;

procedure TwMFndProv.btCVE_FND_PROGRAMAClick(Sender: TObject);
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

procedure TwMFndProv.ilCVE_FND_PROGRAMAEjecuta(Sender: TObject);
begin
   If Objeto.MPrgApoyo.FindKey([Trim(edCVE_FND_ENT_DES.Text),
                                 ilCVE_FND_PROGRAMA.Buffer]) Then Begin
      cbxCVE_FND_PROGRAMA.Checked:=True;
      cbxCVE_FND_PROGRAMA.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_PROGRAMA);
   End;
end;

procedure TwMFndProv.cbxCVE_ORIGEN_RECClick(Sender: TObject);
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

procedure TwMFndProv.cbxCVE_FND_ENT_DESClick(Sender: TObject);
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

procedure TwMFndProv.cbxCVE_FND_PROGRAMAClick(Sender: TObject);
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

end.

