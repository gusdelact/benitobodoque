// Sistema         : Clase de TMInCoCob
// Fecha de Inicio : 01/10/2003
// Función forma   : Clase de TMInCoCob
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMInfCoCob;                       
                           
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntMon,           //Moneda
IntGenCre,
IntCrCatMini,     //Catálogo Minimo
IntParamCre,
IntCrProduct,     //Producto de crédito
IntCrAcredit,     //Acreditado
IntCrCredito,     //Disposición
IntMQrInCoCob,    //Reporte normal
IntMQrInCoCob2,    //Reporte con Fecha Valor
IntMQrInCoCob3,    //Reporte con Fecha Valor Y Fondeo
Intempre,         //Empresa
IntUnNeg,          //Unidad Negocio/Suc
IntMProdGpo
;

Type
 TMInCoCob= class;

  TwMInCoCob=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    ilMONEDA: TInterLinkit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    CVE_CAT_MIN: TLabel;
    edCVE_CAT_MINIMO: TEdit;
    btCVE_CAT_MINIMO: TBitBtn;
    ilCAT_MIN: TInterLinkit;
    edDESC_CAT_MINIMO: TEdit;
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
    chbxCatMin: TCheckBox;
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
    Label2: TLabel;
    chbxCESION: TCheckBox;
    edCESION: TEdit;
    btID_CESION: TBitBtn;
    edID_CESION: TEdit;
    ilCesion: TInterLinkit;
    chbxDetalleDD: TCheckBox;
    Label3: TLabel;
    edF_FINAL: TEdit;
    dtpF_FINAL: TInterDateTimePicker;
    sbExcel: TSpeedButton;
    Label6: TLabel;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
    cbB_RESUMEN: TCheckBox;
    rgOrden: TRadioGroup;
    gbControl: TGroupBox;
    Label4: TLabel;
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
    Label5: TLabel;
    edGPO_PRODUCTO: TEdit;
    btGPO_PRODUCTO: TBitBtn;
    edDESC_GPO_PRODUCTO: TEdit;
    chGPO_PRODUCTO: TCheckBox;
    ilGPO_PRODUCTO: TInterLinkit;
    chbxTipoSector: TCheckBox;
    rgFIRA: TRadioGroup;
    chbxFechaValor: TCheckBox;
    chbxCreFondeo: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure btCVE_CAT_MINIMOClick(Sender: TObject);
    procedure ilCAT_MINCapture(Sender: TObject; var Show: Boolean);
    procedure ilCAT_MINEjecuta(Sender: TObject);
    procedure edCVE_CAT_MINIMOExit(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure chbxCatMinClick(Sender: TObject);
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
    procedure edCVE_CAT_MINIMOChange(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure edID_CESIONChange(Sender: TObject);
    procedure edID_CESIONExit(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure btGPO_PRODUCTOClick(Sender: TObject);
    procedure chGPO_PRODUCTOClick(Sender: TObject);
    procedure ilGPO_PRODUCTOEjecuta(Sender: TObject);
    procedure ilGPO_PRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure cbB_RESUMENClick(Sender: TObject);
    procedure chbxDetalleDDClick(Sender: TObject);
    private
    { Private declarations }
       //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
       Procedure ImprimeReporte(bPreview:Boolean; grOpcion  : TGenRepOption );
       //Procedure ImprimeReporte(bPreview:Boolean);
       //</LOLS>

       Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMInCoCob;
end;
 TMInCoCob= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        Producto                 : TCrProduct;
        Moneda                   : TMoneda;
        Acreditado               : TCrAcredit;
        CatMin                   : TCrCatMini;
        Credito                  : TCrCredito;//Disposición
        ParamCre                 : TParamCre;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        GpoProd                  : TMProdGpo;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TMInCoCob.Create( AOwner : TComponent );
begin Inherited;
      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      CatMin := TCrCatMini.Create(Self);
      CatMin.MasterSource := Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      GpoProd:= TMProdGpo.Create(Self);
      GpoProd.MasterSource:=Self;

      UseQuery := False;
      HelpFile := '.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMInCoCob.Destroy;
begin
   if Producto <> nil then
      Producto.Free;
   if Moneda <> nil then
      Moneda.Free;
   if Acreditado <> nil then
      Acreditado.Free;
   if CatMin <> nil then
      CatMin.Free;
   if Credito <> nil then
      Credito.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   if GpoProd  <> nil then
      GpoProd.Free;
   inherited;
end;

function TMInCoCob.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMInCoCob;
begin
   W:= TwMInCoCob.Create(Self);
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

(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMInCoCob.AsignaEmpresaSuc;
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

procedure TwMInCoCob.FormShow(Sender: TObject);
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

   Objeto.CatMin.CVE_CAT_MINIMO.Control :=edCVE_CAT_MINIMO;
   Objeto.CatMin.DESC_CAT_MINIMO.Control :=edDESC_CAT_MINIMO;
   Objeto.CatMin.GetParams(Objeto);
   edDESC_CAT_MINIMO.Hint := Objeto.CatMin.DESC_CAT_MINIMO.AsString;
   edDESC_CAT_MINIMO.ShowHint := True;

   Objeto.Credito.ID_CREDITO.Control := edID_CESION;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
   Objeto.Credito.GetParams(Objeto);
   edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
   edCESION.ShowHint := True;

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;

   Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edGPO_PRODUCTO;
   Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edDESC_GPO_PRODUCTO;
   Objeto.GpoProd.GetParams(Objeto);
end;

procedure TwMInCoCob.FormDestroy(Sender: TObject);
begin
    Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
    Objeto.Acreditado.ID_ACREDITADO.Control := nil;
    Objeto.Acreditado.Persona.Nombre.Control := nil;
    Objeto.Moneda.Cve_Moneda.Control := nil;
    Objeto.Moneda.Desc_Moneda.Control := nil;
    Objeto.CatMin.CVE_CAT_MINIMO.Control :=nil;
    Objeto.CatMin.DESC_CAT_MINIMO.Control :=nil;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
    Objeto.Credito.ID_CREDITO.Control := nil;
    Objeto.Empresa.ID_Empresa.Control := Nil;
    Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
    Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
    Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
    Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= Nil;
    Objeto.GpoProd.DESC_C_PROD_GPO.Control:= Nil;
end;

procedure TwMInCoCob.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMInCoCob.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMInCoCob.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMInCoCob.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TwMInCoCob.edCVE_MONEDAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
end;

procedure TwMInCoCob.btCVE_CAT_MINIMOClick(Sender: TObject);
begin
    Objeto.CatMin.ShowAll := True;
    If Objeto.CatMin.Busca Then Begin
        chbxCatMin.Checked:=True;
        chbxCatMin.Enabled:=True;
        InterForma1.NextTab(edCVE_CAT_MINIMO);
    End;
end;

procedure TwMInCoCob.ilCAT_MINCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMInCoCob.ilCAT_MINEjecuta(Sender: TObject);
begin
    If Objeto.CatMin.FindKey([ilCAT_MIN.Buffer]) Then Begin
        chbxCatMin.Checked:=True;
        chbxCatMin.Enabled:=True;
        InterForma1.NextTab(edCVE_CAT_MINIMO);
    End;
end;

procedure TwMInCoCob.edCVE_CAT_MINIMOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_CAT_MINIMO,True,'',True);
end;

procedure TwMInCoCob.chbxMonedaClick(Sender: TObject);
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

procedure TwMInCoCob.chbxCatMinClick(Sender: TObject);
begin
    If not chbxCatMin.Checked Then Begin
        Objeto.CatMin.Active:=False;
        chbxCatMin.Checked:=False;
        chbxCatMin.Enabled:=False;
    End Else Begin
        chbxCatMin.Checked:=True;
        chbxCatMin.Enabled:=True;
    End;
end;

procedure TwMInCoCob.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMINCOCOB_PREVI',True,True) then
   begin
      //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
      ImprimeReporte(True, grPreview );
      //ImprimeReporte(True);
      //</LOLS>
   end;   
end;

procedure TwMInCoCob.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMInCoCob.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMInCoCob.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMInCoCob.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
end;

procedure TwMInCoCob.btPRODUCTOClick(Sender: TObject);
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

procedure TwMInCoCob.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMInCoCob.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;


procedure TwMInCoCob.chbxProductoClick(Sender: TObject);
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

procedure TwMInCoCob.chbxAcreditadoClick(Sender: TObject);
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

procedure TwMInCoCob.edACREDITADOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TwMInCoCob.edCVE_CAT_MINIMOChange(Sender: TObject);
begin
    If Trim(edCVE_CAT_MINIMO.Text)<>'' Then Begin
        chbxCatMin.Checked:=True;
        chbxCatMin.Enabled:=True;
        edCVE_CAT_MINIMO.Enabled:=False;
        btCVE_CAT_MINIMO.Enabled:=False;
    End Else Begin
        chbxCatMin.Checked:=False;
        chbxCatMin.Enabled:=False;
        edCVE_CAT_MINIMO.Enabled:=True;
        btCVE_CAT_MINIMO.Enabled:=True;
    End;
end;

//<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
Procedure TwMInCoCob.ImprimeReporte(bPreview:Boolean; grOpcion  : TGenRepOption );
//Procedure TwMInCoCob.ImprimeReporte(bPreview:Boolean);
//</LOLS>
Var
    sSitMov,sDetalle,sOrden:String;
    iSit:Integer;
begin
    iSit:=rgSitMov.ItemIndex;
    case iSit of
        0: sSitMov:='AC';  //Activos
        1: sSitMov:='CA';  //Cancelados                
    end;

    iSit:=rgOrden.ItemIndex;
    case iSit of
        0: sOrden:='D'; //Dispocisión
        1: sOrden:='A';  //Acreditado
    end;

    if (chbxFechaValor.Checked = False)AND(chbxCreFondeo.Checked = False) then
    begin
       RepInfCobrConta( edF_INICIO.Text      , edF_FINAL.Text              , edCVE_PRODUCTO_CRE.Text,
                       edCVE_MONEDA.Text     , edACREDITADO.Text           , edCVE_CAT_MINIMO.Text  ,
                       edID_CESION.Text      , sSitMov                     , edNbrArch.Text         ,
                       sOrden                , EdIdEmpresa.Text            , EdIDSucursal.Text      ,
                       edGPO_PRODUCTO.Text   , chbxTipoSector.Checked      , cbB_RESUMEN.Checked    ,
                       chbxDetalleDD.Checked , rgFIRA.ItemIndex            ,    Objeto.Apli         ,
                       bPreview
                       //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
                       , grOpcion, ''
                       //</LOLS>
                      );
    end;

    if (chbxFechaValor.Checked = True) then
    begin
       RepInfCobrConta2( edF_INICIO.Text      , edF_FINAL.Text              , edCVE_PRODUCTO_CRE.Text,
                       edCVE_MONEDA.Text     , edACREDITADO.Text           , edCVE_CAT_MINIMO.Text  ,
                       edID_CESION.Text      , sSitMov                     , edNbrArch.Text         ,
                       sOrden                , EdIdEmpresa.Text            , EdIDSucursal.Text      ,
                       edGPO_PRODUCTO.Text   , chbxTipoSector.Checked      , cbB_RESUMEN.Checked    ,
                       chbxDetalleDD.Checked , rgFIRA.ItemIndex            ,    Objeto.Apli         ,
                       chbxCreFondeo.Checked, //HERJA - PARA FILTRAR SOLO CREDITOS CON FONDEO                       
                       bPreview
                       //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
                       , grOpcion, ''
                       //</LOLS>
                      );
    end;

    //HERJA NUEVO REPORTE PARA FECHA NORMAL Y CON FONDEO
    if (chbxFechaValor.Checked = False)AND(chbxCreFondeo.Checked = True) then
    begin
       RepInfCobrConta3( edF_INICIO.Text      , edF_FINAL.Text              , edCVE_PRODUCTO_CRE.Text,
                       edCVE_MONEDA.Text     , edACREDITADO.Text           , edCVE_CAT_MINIMO.Text  ,
                       edID_CESION.Text      , sSitMov                     , edNbrArch.Text         ,
                       sOrden                , EdIdEmpresa.Text            , EdIDSucursal.Text      ,
                       edGPO_PRODUCTO.Text   , chbxTipoSector.Checked      , cbB_RESUMEN.Checked    ,
                       chbxDetalleDD.Checked , rgFIRA.ItemIndex            ,    Objeto.Apli         ,
                       chbxCreFondeo.Checked, //HERJA - PARA FILTRAR SOLO CREDITOS CON FONDEO                                  
                       bPreview
                       //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
                       , grOpcion, ''
                       //</LOLS>
                      );
    end;

   { If Trim(edNbrArch.Text)<>'' Then Begin
       If bGenArch Then
         ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
       Else
         ShowMessage('No se generó el Archivo')
    End;}
End;
procedure TwMInCoCob.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMINCOCOB_IMPRI',True,True) then
   begin
      //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
      ImprimeReporte( False, grPrint );
      //ImprimeReporte(False);
      //</LOLS>
   end;
end;

procedure TwMInCoCob.edID_CESIONChange(Sender: TObject);
begin
    If Trim(edID_CESION.Text)<>'' Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End Else Begin
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End;
end;

procedure TwMInCoCob.edID_CESIONExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CESION,True,'',True);
end;

procedure TwMInCoCob.btID_CESIONClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TwMInCoCob.chbxCESIONClick(Sender: TObject);
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

procedure TwMInCoCob.ilCesionCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMInCoCob.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TwMInCoCob.sbExcelClick(Sender: TObject);
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

procedure TwMInCoCob.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TwMInCoCob.cbxArchivoClick(Sender: TObject);
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

procedure TwMInCoCob.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMInCoCob.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMInCoCob.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMInCoCob.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMInCoCob.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMInCoCob.btGPO_PRODUCTOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      chGPO_PRODUCTO.Checked:=True;
      chGPO_PRODUCTO.Enabled:=True;
      InterForma1.NextTab(edGPO_PRODUCTO);
   End;
end;

procedure TwMInCoCob.chGPO_PRODUCTOClick(Sender: TObject);
begin
   If not chGPO_PRODUCTO.Checked Then Begin
      Objeto.GpoProd.Active:=False;
      chGPO_PRODUCTO.Checked:=False;
      chGPO_PRODUCTO.Enabled:=False;
   End Else Begin
      chGPO_PRODUCTO.Checked:=True;
      chGPO_PRODUCTO.Enabled:=True;
   End;
end;

procedure TwMInCoCob.ilGPO_PRODUCTOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilGPO_PRODUCTO.Buffer]) Then Begin
      chGPO_PRODUCTO.Checked:=True;
      chGPO_PRODUCTO.Enabled:=True;
      InterForma1.NextTab(edGPO_PRODUCTO);
   End;
end;

procedure TwMInCoCob.ilGPO_PRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMInCoCob.cbB_RESUMENClick(Sender: TObject);
begin
   if cbB_RESUMEN.Checked then
      chbxDetalleDD.Enabled := False
   else
      chbxDetalleDD.Enabled := True;
end;

procedure TwMInCoCob.chbxDetalleDDClick(Sender: TObject);
begin
   if chbxDetalleDD.Checked then
      cbB_RESUMEN.Enabled := False
   else
      cbB_RESUMEN.Enabled := True;
end;

end.

