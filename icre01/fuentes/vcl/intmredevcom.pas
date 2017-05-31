// Sistema         : Clase de TMReDevCom
// Fecha de Inicio : 01/10/2003
// Función forma   : Clase de TMReDevCom
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMReDevCom;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntCrEmisor,      //Emisor
IntCrProveed,     //Proveedor
IntCrCto,         //Contrato
IntCrCredito,     //Disposición
IntParamCre,
IntMQrDevCom,      //Reporte comisines
IntMQrDevRem,      //Reporte remanente / interes por devengar
Intempre,          //Empresa
IntUnNeg           //Unidad Negocio/Suc
;

Type
 TMReDevCom= class;

  TwMReDevCom=Class(TForm)
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
    lbAplica: TLabel;
    chbxF_Liq: TCheckBox;
    chbxF_Com: TCheckBox;
    edID_EMISOR: TEdit;
    btEMISOR: TBitBtn;
    ilEMISOR: TInterLinkit;
    edNOM_EMISOR: TEdit;
    lbID_EMISOR: TLabel;
    lbCVE_EMISOR_NAFIN: TLabel;
    edCVE_EMISOR_NAFIN: TEdit;
    edNOMBRE_EMISOR: TEdit;
    edID_PROVEEDOR: TEdit;
    lbID_PROVEEDOR: TLabel;
    btPROVEEDOR: TBitBtn;
    edID_PROV_NAFINSA: TEdit;
    edNOM_PROVEEDOR: TEdit;
    ilPROVEEDOR: TInterLinkit;
    Label7: TLabel;
    Label1: TLabel;
    rgSituacionDoc: TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    chbxEmisor: TCheckBox;
    chbxProveedor: TCheckBox;
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
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    dtpDevF_INICIO: TInterDateTimePicker;
    edDevF_INICIO: TEdit;
    edDevF_FINAL: TEdit;
    dtpDevF_FINAL: TInterDateTimePicker;
    chbxF_Dev: TCheckBox;
    rgSituacionDev: TRadioGroup;
    rgTipoRep: TRadioGroup;
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
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure ilEMISORCapture(Sender: TObject; var Show: Boolean);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure btEMISORExit(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure ilPROVEEDORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure edID_PROVEEDORExit(Sender: TObject);
    procedure btCONTRATOClick(Sender: TObject);
    procedure ilIDCONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure iedID_CONTRATOExit(Sender: TObject);
    procedure ilIDCONTRATOEjecuta(Sender: TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure ilCREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure chbxF_LiqClick(Sender: TObject);
    procedure chbxF_ComClick(Sender: TObject);
    procedure chbxEmisorClick(Sender: TObject);
    procedure chbxProveedorClick(Sender: TObject);
    procedure chbxAutorizacionClick(Sender: TObject);
    procedure chbxDisposicionClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure chbxF_DevClick(Sender: TObject);
    procedure edLiqF_INICIOChange(Sender: TObject);
    procedure edLiqF_FINALChange(Sender: TObject);
    procedure edDevF_INICIOChange(Sender: TObject);
    procedure edDevF_FINALChange(Sender: TObject);
    procedure edComF_INICIOChange(Sender: TObject);
    procedure edComF_FINALChange(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    private
    { Private declarations }
        Procedure ImprimirReporte(bPreview:Boolean);
        Procedure AsignaEmpresaSuc;        
    public
    { Public declarations }
    Objeto : TMReDevCom;
end;
 TMReDevCom= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        Emisor                   : TCrEmisor;
        Proveedor                : TCrProveed;
        ContratoCre              : TCrCto; //Contrato Crédito
        Credito                  : TCrCredito;
        ParamCre                 : TParamCre;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;

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


constructor TMReDevCom.Create( AOwner : TComponent );
begin Inherited;
      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;
      Emisor.FieldByName('ID_ACREDITADO').MasterField:='ID_EMISOR';
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//      Emisor.FieldByName('CVE_EMISOR_NAFIN').MasterField:='CVE_EMISOR_NAFIN';
      Emisor.FieldByName('CVE_EMISOR_EXT').MasterField:='CVE_EMISOR_NAFIN';
{/ROIM}

      Proveedor := TCrProveed.Create(Self);
      Proveedor.MasterSource:=Self;      StpName  := ' ';
      Proveedor.FieldByName('ID_ACREDITADO').MasterField:='ID_PROVEEDOR';

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;
      ContratoCre.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';
      ContratoCre.FieldByName('FOL_CONTRATO').MasterField:='FOL_CONTRATO';

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      UseQuery := False;
      HelpFile := 'InTMReDevCom.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMReDevCom.Destroy;
begin
   if Emisor <> nil then
      Emisor.Free;
   if Proveedor <> nil then
      Proveedor.Free;
   if ContratoCre <> nil then
      ContratoCre.Free;
   if Credito <> nil then
      Credito.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   inherited;
end;


function TMReDevCom.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMReDevCom;
begin
   W:=TwMReDevCom.Create(Self);
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


Function TMReDevCom.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TMReDevCom.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMReDevCom.AsignaEmpresaSuc;
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

procedure TwMReDevCom.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      dtpLiqF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpLiqF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpDevF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpDevF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpComF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpComF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresa;

      edLiqF_INICIO.text:=FormatDateTime('dd/mm/yyyy',dtpLiqF_INICIO.DateTime);
      edLiqF_FINAL.text:=FormatDateTime('dd/mm/yyyy',dtpLiqF_FINAL.DateTime);
      edDevF_INICIO.text:=FormatDateTime('dd/mm/yyyy',dtpDevF_INICIO.DateTime);
      edDevF_FINAL.text:=FormatDateTime('dd/mm/yyyy',dtpDevF_FINAL.DateTime);
      edComF_INICIO.text:=FormatDateTime('dd/mm/yyyy',dtpComF_INICIO.DateTime);
      edComF_FINAL.text:=FormatDateTime('dd/mm/yyyy',dtpComF_FINAL.DateTime);
      chbxF_Liq.Checked := True;
      chbxF_Dev.Checked := True;
      chbxF_Com.Checked := True;

      Objeto.Emisor.ID_ACREDITADO.Control := edID_EMISOR;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOM_EMISOR;
      Objeto.Emisor.NOMBRE_EMISOR.Control := edNOMBRE_EMISOR;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      Objeto.Emisor.CVE_EMISOR_NAFIN.Control := edCVE_EMISOR_NAFIN;
      Objeto.Emisor.CVE_EMISOR_EXT.Control := edCVE_EMISOR_NAFIN;
{/ROIM}
      Objeto.Emisor.GetParams(Objeto);
      edNOM_EMISOR.Hint := Objeto.Emisor.Acreditado.Persona.Nombre.AsString;
      edNOM_EMISOR.ShowHint := True;
      edNOMBRE_EMISOR.Hint := Objeto.Emisor.NOMBRE_EMISOR.AsString;
      edNOMBRE_EMISOR.ShowHint := True;

      Objeto.Proveedor.ID_ACREDITADO.Control := edID_PROVEEDOR;
      Objeto.Proveedor.Persona.Nombre.Control := edNOM_PROVEEDOR;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      Objeto.Proveedor.ID_PROV_NAFINSA.Control := edID_PROV_NAFINSA;
      Objeto.Proveedor.ID_PROV_EXTERNO.Control := edID_PROV_NAFINSA;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
      Objeto.Proveedor.GetParams(Objeto);
      edNOM_PROVEEDOR.Hint := Objeto.Proveedor.Persona.Nombre.AsString;
      edNOM_PROVEEDOR.ShowHint := True;

      Objeto.ContratoCre.ID_CONTRATO.Control := iedID_CONTRATO;
      Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO;
      Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control :=edDESC_PRODUCTO;
      edDESC_PRODUCTO.Hint := Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO.ShowHint := True;

      Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
      //Objeto.Credito.ContratoCre.Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edNOM_ACREDITADO;
      Objeto.Credito.GetParams(Objeto);
      edNOM_ACREDITADO.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edNOM_ACREDITADO.ShowHint := True;

      Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
      Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      Objeto.Empresa.GetParams(Objeto);

      Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
      Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
      Objeto.UnidadNegocio.GetParams(Objeto);
      AsignaEmpresaSuc;
end;

procedure TwMReDevCom.FormDestroy(Sender: TObject);
begin
      Objeto.Emisor.ID_ACREDITADO.Control := nil;
      Objeto.Emisor.NOMBRE_EMISOR.Control := nil;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := nil;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      Objeto.Emisor.CVE_EMISOR_NAFIN.Control := nil;
      Objeto.Emisor.CVE_EMISOR_EXT.Control := nil;
{/ROIM}
      Objeto.Proveedor.ID_ACREDITADO.Control := nil;
      Objeto.Proveedor.Persona.Nombre.Control := nil;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      Objeto.Proveedor.ID_PROV_NAFINSA.Control := nil;
      Objeto.Proveedor.ID_PROV_EXTERNO.Control := nil;
{/ROIM}
      Objeto.ContratoCre.ID_CONTRATO.Control := nil;
      Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control :=nil;
      Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control :=nil;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
      Objeto.Credito.ID_CREDITO.Control := nil;
      Objeto.Empresa.ID_Empresa.Control := Nil;
      Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
      Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
      Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMReDevCom.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMReDevCom.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMReDevCom.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWNinguno.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TwMReDevCom.btEMISORClick(Sender: TObject);
begin
    Objeto.Emisor.ShowAll := True;
    if Objeto.Emisor.Busca then begin
        chbxEmisor.Checked:=True;
        chbxEmisor.Enabled:=True;
        InterForma1.NextTab(edID_EMISOR);
    End;
end;

procedure TwMReDevCom.ilEMISORCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMReDevCom.ilEMISOREjecuta(Sender: TObject);
begin
    if Objeto.Emisor.FindKeyNear([ilEMISOR.Buffer],['ID_ACREDITADO']) then begin
        chbxEmisor.Checked:=True;
        chbxEmisor.Enabled:=True;
        InterForma1.NextTab(edID_EMISOR);
    end;
end;

procedure TwMReDevCom.btEMISORExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_EMISOR,True,'',True);
end;

procedure TwMReDevCom.btPROVEEDORClick(Sender: TObject);
begin
   Objeto.Proveedor.ShowAll := True;
   if Objeto.Proveedor.Busca then begin
        chbxProveedor.Checked:=True;
        chbxProveedor.Enabled:=True;
        InterForma1.NextTab(edID_PROVEEDOR);
   end;
end;

procedure TwMReDevCom.ilPROVEEDORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMReDevCom.ilPROVEEDOREjecuta(Sender: TObject);
begin
   if Objeto.Proveedor.FindKey([ilPROVEEDOR.Buffer]) then begin
        chbxProveedor.Checked:=True;
        chbxProveedor.Enabled:=True;
        InterForma1.NextTab(edID_PROVEEDOR);
   end;
end;

procedure TwMReDevCom.edID_PROVEEDORExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_PROVEEDOR,True,'',True);
end;

procedure TwMReDevCom.btCONTRATOClick(Sender: TObject);
begin
   //BUSCADOR DE LA CLASE CONTRATO CREDITO
   Objeto.ContratoCre.ShowAll := True;
   if Objeto.ContratoCre.Busca then begin
        chbxAutorizacion.Checked:=True;
        chbxAutorizacion.Enabled:=True;
        InterForma1.NextTab(btCONTRATO);
   end;
end;

procedure TwMReDevCom.ilIDCONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show := True;
end;

procedure TwMReDevCom.iedID_CONTRATOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(iedID_CONTRATO,True,'',True);
end;

procedure TwMReDevCom.ilIDCONTRATOEjecuta(Sender: TObject);
begin
   if Objeto.ContratoCre.FindKey([ilIDCONTRATO.Buffer,'1']) then begin
        chbxAutorizacion.Checked:=True;
        chbxAutorizacion.Enabled:=True;
        InterForma1.NextTab(iedID_CONTRATO);
   end;
end;

procedure TwMReDevCom.btCREDITOClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxDisposicion.Checked:=True;
        chbxDisposicion.Enabled:=True;
        InterForma1.NextTab(edID_CREDITO);
   End;
end;

procedure TwMReDevCom.ilCREDITOCapture(Sender: TObject; var Show: Boolean);
begin
     Show := True;
end;

procedure TwMReDevCom.ilCREDITOEjecuta(Sender: TObject);
begin
   if Objeto.Credito.FindKey([ilCREDITO.Buffer]) then begin
        chbxDisposicion.Checked:=True;
        chbxDisposicion.Enabled:=True;
        InterForma1.NextTab(edID_CREDITO);
   end;
end;

procedure TwMReDevCom.edID_CREDITOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CREDITO,True,'',True);
end;

procedure TwMReDevCom.chbxF_LiqClick(Sender: TObject);
begin
    If not chbxF_Liq.Checked Then Begin
        edLiqF_INICIO.Text:='';
        edLiqF_FINAL.Text:='';
        chbxF_Liq.Checked:=False;
        chbxF_Liq.Enabled:=False;
    End;
end;
procedure TwMReDevCom.chbxF_ComClick(Sender: TObject);
begin
    If not chbxF_Com.Checked Then Begin
        edComF_INICIO.Text:='';
        edComF_FINAL.Text:='';
        chbxF_Com.Checked:=False;
        chbxF_Com.Enabled:=False;
    End;
end;

procedure TwMReDevCom.chbxEmisorClick(Sender: TObject);
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

procedure TwMReDevCom.chbxProveedorClick(Sender: TObject);
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

procedure TwMReDevCom.chbxAutorizacionClick(Sender: TObject);
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

procedure TwMReDevCom.chbxDisposicionClick(Sender: TObject);
begin
    If not chbxDisposicion.Checked Then Begin
        Objeto.Credito.Active:=False;
        chbxDisposicion.Checked:=False;
        chbxDisposicion.Enabled:=False;
    End Else Begin
        chbxDisposicion.Checked:=True;
        chbxDisposicion.Enabled:=True;
    End;
end;

procedure TwMReDevCom.InterForma1BtnPreviewClick(Sender: TObject);
begin
    ImprimirReporte(True);
end;

procedure TwMReDevCom.chbxF_DevClick(Sender: TObject);
begin
    If not chbxF_Dev.Checked Then Begin
        edDevF_INICIO.Text:='';
        edDevF_FINAL.Text:='';
        chbxF_Dev.Checked:=False;
        chbxF_Dev.Enabled:=False;
    End;
end;

procedure TwMReDevCom.edLiqF_INICIOChange(Sender: TObject);
begin
    If Trim(edLiqF_INICIO.Text)<>'' Then Begin
        chbxF_Liq.Checked:=True;
        chbxF_Liq.Enabled:=True;
    End Else If Trim(edLiqF_FINAL.Text)='' Then Begin
        chbxF_Liq.Checked:=False;
        chbxF_Liq.Enabled:=False;
    End;
end;

procedure TwMReDevCom.edLiqF_FINALChange(Sender: TObject);
begin
    If Trim(edLiqF_FINAL.Text)<>'' Then Begin
        chbxF_Liq.Checked:=True;
        chbxF_Liq.Enabled:=True;
    End Else If Trim(edLiqF_INICIO.Text)=''Then Begin
        chbxF_Liq.Checked:=False;
        chbxF_Liq.Enabled:=False;
    End;
end;

procedure TwMReDevCom.edDevF_INICIOChange(Sender: TObject);
begin
    If Trim(edDevF_INICIO.Text)<>'' Then Begin
        chbxF_Dev.Checked:=True;
        chbxF_Dev.Enabled:=True;
    End Else If Trim(edDevF_FINAL.Text)='' Then Begin
        chbxF_Dev.Checked:=False;
        chbxF_Dev.Enabled:=False;
    End;
end;

procedure TwMReDevCom.edDevF_FINALChange(Sender: TObject);
begin
    If Trim(edDevF_FINAL.Text)<>'' Then Begin
        chbxF_Dev.Checked:=True;
        chbxF_Dev.Enabled:=True;
    End Else If Trim(edDevF_INICIO.Text)='' Then Begin
        chbxF_Dev.Checked:=False;
        chbxF_Dev.Enabled:=False;
    End;
end;

procedure TwMReDevCom.edComF_INICIOChange(Sender: TObject);
begin
    If Trim(edComF_INICIO.Text)<>'' Then Begin
        chbxF_Com.Checked:=True;
        chbxF_Com.Enabled:=True;
    End Else If Trim(edComF_FINAL.Text)=''Then Begin
        chbxF_Com.Checked:=False;
        chbxF_Com.Enabled:=False;
    End;
end;

procedure TwMReDevCom.edComF_FINALChange(Sender: TObject);
begin
    If Trim(edComF_FINAL.Text)<>'' Then Begin
        chbxF_Com.Checked:=True;
        chbxF_Com.Enabled:=True;
    End Else If Trim(edComF_INICIO.Text)=''Then Begin
        chbxF_Com.Checked:=False;
        chbxF_Com.Enabled:=False;
    End;
end;

procedure TwMReDevCom.InterForma1BtnImprimirClick(Sender: TObject);
begin
    ImprimirReporte(False);
end;

Procedure TwMReDevCom.ImprimirReporte(bPreview:Boolean);
Var
    sSituacionDoc,sSituacionDev,sTipoRep,sOrden:String;
    iSit:Integer;
begin
    iSit:=rgSituacionDoc.ItemIndex;
    case iSit of
        0: sSituacionDoc:='';  //Todos
        1: sSituacionDoc:='AC';  //Activos
        2: sSituacionDoc:='NA';  //En transito
        3: sSituacionDoc:='LQ';  //Liquidados
        4: sSituacionDoc:='IM';  //Impagados
        5: sSituacionDoc:='CA';  //Cancelados
    end;

    iSit:=rgSituacionDev.ItemIndex;
    case iSit of
        0: sSituacionDev:='';    //Todos
        1: sSituacionDev:='AU';  //Activos
        2: sSituacionDev:='LQ';  //Liquidados
        3: sSituacionDev:='NA';  //No Autorizados
        4: sSituacionDev:='CA';  //Cancelados
    end;
    iSit:=rgOrden.ItemIndex;
    case iSit of
        0: sOrden:='C';  //Crédito
        1: sOrden:='P';  //Persona
    end;
    iSit:=rgTipoRep.ItemIndex;
    case iSit of
        0: Begin
            sTipoRep:='''CN''';   //Devoluciones de Comisión por Pago Oportuno
            RepRelDevCom(   edLiqF_INICIO.Text,edLiqF_FINAL.Text  ,edDevF_INICIO.Text,
                            edDevF_FINAL.Text ,edComF_INICIO.Text ,edComF_FINAL.Text,
                            edID_EMISOR.Text  ,edID_PROVEEDOR.Text,iedID_CONTRATO.Text,
                            edID_CREDITO.Text ,sSituacionDoc      ,sSituacionDev,
                            sTipoRep          ,sOrden             ,
                            EdIdEmpresa.Text, EdIDSucursal.Text  , Objeto.Apli,
                            bPreview);
        End;
        1: Begin
            sTipoRep:='''IN''';//Devoluciones de Intereses Dev.
            RepRelDevRem(   edLiqF_INICIO.Text,edLiqF_FINAL.Text  ,edDevF_INICIO.Text,
                            edDevF_FINAL.Text ,edComF_INICIO.Text ,edComF_FINAL.Text,
                            edID_EMISOR.Text  ,edID_PROVEEDOR.Text,iedID_CONTRATO.Text,
                            edID_CREDITO.Text ,sSituacionDoc      ,sSituacionDev,
                            sTipoRep          ,sOrden             ,
                            EdIdEmpresa.Text, EdIDSucursal.Text  ,Objeto.Apli,
                            bPreview);
        End;
        2: Begin
            sTipoRep:='''RE''';//Devoluciones de Remanente
            RepRelDevRem(   edLiqF_INICIO.Text,edLiqF_FINAL.Text  ,edDevF_INICIO.Text,
                            edDevF_FINAL.Text ,edComF_INICIO.Text ,edComF_FINAL.Text,
                            edID_EMISOR.Text  ,edID_PROVEEDOR.Text,iedID_CONTRATO.Text,
                            edID_CREDITO.Text ,sSituacionDoc      ,sSituacionDev,
                            sTipoRep          ,sOrden             ,
                            EdIdEmpresa.Text, EdIDSucursal.Text  ,Objeto.Apli,
                            bPreview);
        End;
    end;
End;
procedure TwMReDevCom.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMReDevCom.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMReDevCom.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMReDevCom.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;       
   End;
end;

procedure TwMReDevCom.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

end.

