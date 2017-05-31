// Sistema         : Clase de TMReAuCred
// Fecha de Inicio : 01/10/2003
// Función forma   : Clase de TMReAuCred
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMReAuCred;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntCrProduct,     //Producto de crédito
IntMon,           //Moneda
IntCrAcredit,     //Acreditado
IntMPers,         //Promotor
IntEmple,
IntCrCto,         //Contrato
IntParamCre,
IntMQrAuCred,      //Reporte
Intempre,          //Empresa
IntUnNeg           //Unidad Negocio/Suc
;

Type
 TMReAuCred= class;

  TwMReAuCred=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox1: TGroupBox;
    dtpAutF_INICIO: TInterDateTimePicker;
    edAutF_INICIO: TEdit;
    lbLiqF_INICIO: TLabel;
    lbLiqF_FINAL: TLabel;
    edAutF_FINAL: TEdit;
    dtpAutF_FINAL: TInterDateTimePicker;
    GroupBox2: TGroupBox;
    lbComF_INICIO: TLabel;
    lbComF_FINAL: TLabel;
    dtpVenF_INICIO: TInterDateTimePicker;
    edVenF_INICIO: TEdit;
    edVenF_FINAL: TEdit;
    dtpVenF_FINAL: TInterDateTimePicker;
    lbAplica: TLabel;
    chbxF_Aut: TCheckBox;
    chbxF_Ven: TCheckBox;
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
    chbxAutorizacion: TCheckBox;
    edDESC_PRODUCTO: TEdit;
    edCVE_PRODUCTO: TEdit;
    btCONTRATO: TBitBtn;
    iedID_CONTRATO: TInterEdit;
    ilIDCONTRATO: TInterLinkit;
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
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure btPROMOTORClick(Sender: TObject);
    procedure ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROMOTOREjecuta(Sender: TObject);
    procedure edID_PROMOTORExit(Sender: TObject);
    procedure btCONTRATOClick(Sender: TObject);
    procedure ilIDCONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure iedID_CONTRATOExit(Sender: TObject);
    procedure ilIDCONTRATOEjecuta(Sender: TObject);
    procedure chbxF_AutClick(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure chbxF_VenClick(Sender: TObject);
    procedure chbxPromotorClick(Sender: TObject);
    procedure chbxAutorizacionClick(Sender: TObject);
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
    procedure edAutF_INICIOChange(Sender: TObject);
    procedure edAutF_FINALChange(Sender: TObject);
    procedure edVenF_INICIOChange(Sender: TObject);
    procedure edVenF_FINALChange(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    private
    { Private declarations }
       Procedure ImprimirReporte(bPreview:Boolean);
       Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMReAuCred;
end;
 TMReAuCred= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        Producto                 : TCrProduct;
        Moneda                   : TMoneda;
        Acreditado               : TCrAcredit;
        Promotor                 : TEmpleado; //Promotor Responsable
        ContratoCre              : TCrCto; //Contrato Crédito
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


constructor TMReAuCred.Create( AOwner : TComponent );
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

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;
      ContratoCre.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';
      ContratoCre.FieldByName('FOL_CONTRATO').MasterField:='FOL_CONTRATO';

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      UseQuery := False;
      HelpFile := 'InTMReAuCred.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMReAuCred.Destroy;
begin
   if Producto <> nil then
      Producto.Free;
   if Moneda <> nil then
      Moneda.Free;
   if Acreditado <> nil then
      Acreditado.Free;
   if Promotor <> nil then
      Promotor.Free;
   if ContratoCre <> nil then
      ContratoCre.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   inherited;
end;


function TMReAuCred.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMReAuCred;
begin
   W:=TwMReAuCred.Create(Self);
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


Function TMReAuCred.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TMReAuCred.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMReAuCred.AsignaEmpresaSuc;
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

procedure TwMReAuCred.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

 {     dtpAutF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpAutF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpVenF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpVenF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresa;

      edAutF_INICIO.text:=FormatDateTime('dd/mm/yyyy',dtpAutF_INICIO.DateTime);
      edAutF_FINAL.text:=FormatDateTime('dd/mm/yyyy',dtpAutF_FINAL.DateTime);
      edVenF_INICIO.text:=FormatDateTime('dd/mm/yyyy',dtpVenF_INICIO.DateTime);
      edVenF_FINAL.text:=FormatDateTime('dd/mm/yyyy',dtpVenF_FINAL.DateTime);
      chbxF_Aut.Checked := True;
      chbxF_Ven.Checked := True;
                                }
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

      Objeto.ContratoCre.ID_CONTRATO.Control := iedID_CONTRATO;
      Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO;
      Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control :=edDESC_PRODUCTO;
      Objeto.ContratoCre.GetParams(Objeto);
      edDESC_PRODUCTO.Hint := Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO.ShowHint := True;

      Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
      Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      Objeto.Empresa.GetParams(Objeto);

      Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
      Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
      Objeto.UnidadNegocio.GetParams(Objeto);
      AsignaEmpresaSuc;
end;

procedure TwMReAuCred.FormDestroy(Sender: TObject);
begin
      Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
      Objeto.Acreditado.ID_ACREDITADO.Control := nil;
      Objeto.Acreditado.Persona.Nombre.Control := nil;
      Objeto.Moneda.Cve_Moneda.Control := nil;
      Objeto.Moneda.Desc_Moneda.Control := nil;
      Objeto.Promotor.Persona.Nombre.Control :=nil;
      Objeto.Promotor.Id_Persona.Control :=nil;
      Objeto.ContratoCre.ID_CONTRATO.Control := nil;
      Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control :=nil;
      Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control :=nil;
      Objeto.Empresa.ID_Empresa.Control := Nil;
      Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
      Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
      Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMReAuCred.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMReAuCred.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMReAuCred.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWNinguno.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TwMReAuCred.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMReAuCred.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMReAuCred.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TwMReAuCred.edCVE_MONEDAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
end;

procedure TwMReAuCred.btPROMOTORClick(Sender: TObject);
begin
    Objeto.Promotor.ShowAll := True;
    If Objeto.Promotor.Busca Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMReAuCred.ilPROMOTORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMReAuCred.ilPROMOTOREjecuta(Sender: TObject);
begin
    If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMReAuCred.edID_PROMOTORExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_PROMOTOR,True,'',True);
end;

procedure TwMReAuCred.btCONTRATOClick(Sender: TObject);
begin
    //BUSCADOR DE LA CLASE CONTRATO CREDITO
    Objeto.ContratoCre.ShowAll := True;
    if Objeto.ContratoCre.Busca then Begin
        chbxAutorizacion.Checked:= True;
        chbxAutorizacion.Enabled:= True;
        InterForma1.NextTab(btCONTRATO);
    End;
end;

procedure TwMReAuCred.ilIDCONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show := True;
end;

procedure TwMReAuCred.iedID_CONTRATOExit(Sender: TObject);
begin
    If iedID_CONTRATO.Text<>'' Then Begin
        chbxAutorizacion.Checked:= True;
        chbxAutorizacion.Enabled:= True;
    End Else Begin
        chbxAutorizacion.Checked:= False;
        chbxAutorizacion.Enabled:= False;
    End;
    InterForma1.ValidaExit(iedID_CONTRATO,True,'',True);
end;

procedure TwMReAuCred.ilIDCONTRATOEjecuta(Sender: TObject);
begin
    If Objeto.ContratoCre.FindKey([ilIDCONTRATO.Buffer,'1']) Then Begin
        chbxAutorizacion.Checked:= True;
        chbxAutorizacion.Enabled:= True;
        InterForma1.NextTab(iedID_CONTRATO);
    End;
end;

procedure TwMReAuCred.chbxF_AutClick(Sender: TObject);
begin
    If not chbxF_Aut.Checked Then Begin
        edAutF_INICIO.Text:='';
        edAutF_FINAL.Text:='';
        chbxF_Aut.Checked:=False;
        chbxF_Aut.Enabled:=False;
    End;
end;
procedure TwMReAuCred.chbxMonedaClick(Sender: TObject);
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

procedure TwMReAuCred.chbxF_VenClick(Sender: TObject);
begin
    If not chbxF_Ven.Checked Then Begin
        edVenF_INICIO.Text:='';
        edVenF_FINAL.Text:='';
        chbxF_Ven.Checked:=False;
        chbxF_Ven.Enabled:=False;
    End;
end;

procedure TwMReAuCred.chbxPromotorClick(Sender: TObject);
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

procedure TwMReAuCred.chbxAutorizacionClick(Sender: TObject);
begin
    If not chbxAutorizacion.Checked Then Begin
        Objeto.ContratoCre.Active:=False;
        chbxAutorizacion.Checked:= False;
        chbxAutorizacion.Enabled:=False;
    End
    Else Begin
        chbxAutorizacion.Checked:= True;
        chbxAutorizacion.Enabled:= True;
    End;
end;

procedure TwMReAuCred.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMREAUCRED_IMPRI',True,True) then
      ImprimirReporte(True);
end;

procedure TwMReAuCred.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMReAuCred.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMReAuCred.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMReAuCred.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
end;

procedure TwMReAuCred.btPRODUCTOClick(Sender: TObject);
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

procedure TwMReAuCred.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMReAuCred.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;


procedure TwMReAuCred.chbxProductoClick(Sender: TObject);
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

procedure TwMReAuCred.chbxAcreditadoClick(Sender: TObject);
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

procedure TwMReAuCred.edACREDITADOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TwMReAuCred.edAutF_INICIOChange(Sender: TObject);
begin
    If (Trim(edAutF_INICIO.Text)<>'') Then Begin
        chbxF_Aut.Checked:=True;
        chbxF_Aut.Enabled:=True;
    End Else If (Trim(edAutF_FINAL.Text)='') Then Begin
        chbxF_Aut.Checked:=False;
        chbxF_Aut.Enabled:=False;
    End;
end;

procedure TwMReAuCred.edAutF_FINALChange(Sender: TObject);
begin
    If Trim(edAutF_FINAL.Text)<>'' Then Begin
        chbxF_Aut.Checked:=True;
        chbxF_Aut.Enabled:=True;
    End Else If (Trim(edAutF_INICIO.Text)='') Then Begin
        chbxF_Aut.Checked:=False;
        chbxF_Aut.Enabled:=False;
    End;
end;

procedure TwMReAuCred.edVenF_INICIOChange(Sender: TObject);
begin
    If Trim(edVenF_INICIO.Text)<>'' Then Begin
        chbxF_Ven.Checked:=True;
        chbxF_Ven.Enabled:=True;
    End Else If (Trim(edVenF_FINAL.Text)='')Then Begin
        chbxF_Ven.Checked:=False;
        chbxF_Ven.Enabled:=False;
    End;
end;

procedure TwMReAuCred.edVenF_FINALChange(Sender: TObject);
begin
    If Trim(edVenF_FINAL.Text)<>'' Then Begin
        chbxF_Ven.Checked:=True;
        chbxF_Ven.Enabled:=True;
    End Else If Trim(edVenF_INICIO.Text)='' Then Begin
        chbxF_Ven.Checked:=False;
        chbxF_Ven.Enabled:=False;
    End;
end;

procedure TwMReAuCred.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMREAUCRED_IMPRI',True,True) then
      ImprimirReporte(False);
end;

Procedure TwMReAuCred.ImprimirReporte(bPreview:Boolean);
Var
    sSituacion:String;
    iSit:Integer;
begin
    iSit:=rgSituacion.ItemIndex;
    case iSit of
        0: sSituacion:='';  //Todos
        1: sSituacion:='AU';  //Vigentes
        2: sSituacion:='IN';  //No Vigentes
    end;

    RepRelDocEmiPro(edAutF_INICIO.Text, edAutF_FINAL.Text      , edVenF_INICIO.Text,
                    edVenF_FINAL.Text , edCVE_PRODUCTO_CRE.Text, edCVE_MONEDA.Text,
                    edACREDITADO.Text , edID_PROMOTOR.Text     , iedID_CONTRATO.Text,
                    sSituacion        , EdIdEmpresa.Text       , EdIDSucursal.Text  ,
                    Objeto.Apli       , bPreview);
End;
procedure TwMReAuCred.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMReAuCred.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMReAuCred.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMReAuCred.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMReAuCred.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

end.

