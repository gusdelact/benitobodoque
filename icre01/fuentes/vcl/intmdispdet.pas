// Sistema         : Clase de TMDispDet
// Fecha de Inicio : 02/08/2004
// Función forma   : Clase de TMDispDet
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMDispDet;

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
IntMQrDispDet,    //Reporte Disposicion
IntMQrDetCred,    //Reporte detalle Crédito
Intempre,         //Empresa
IntUnNeg          //Unidad Negocio/Suc
;

Type
 TMDispDet= class;

  TwMDispDet=Class(TForm)
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
    GroupBox1: TGroupBox;                                                                                 
    lbLiqF_INICIO: TLabel;
    edF_Inicio: TEdit;
    dtpF_Inicio: TInterDateTimePicker;
    Label3: TLabel;
    edF_FIN: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    GroupBox2: TGroupBox;
    chbxDispo: TCheckBox;
    chbxDetalle: TCheckBox;
    Label2: TLabel;
    chbxCESION: TCheckBox;
    edCESION: TEdit;
    btID_CESION: TBitBtn;
    edID_CESION: TEdit;
    ilCesion: TInterLinkit;
    chbxFechas: TCheckBox;
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
    cbFirmasOrd: TCheckBox;
    cbFirmasDet: TCheckBox;
    cbFirstPage: TCheckBox;
    cbDetFA: TCheckBox;
    Label4: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
    chbxCapPag: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure btPROMOTORClick(Sender: TObject);
    procedure ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROMOTOREjecuta(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure chbxPromotorClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure btPROM_ADMONClick(Sender: TObject);
    procedure ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
    procedure ilPromAdmonEjecuta(Sender: TObject);
    procedure chbxPromAmonClick(Sender: TObject);
    procedure edID_PROMOTORChange(Sender: TObject);
    procedure edID_PROMChange(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure edID_CESIONChange(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure chbxFechasClick(Sender: TObject);
    procedure edF_InicioChange(Sender: TObject);
    procedure edF_FINChange(Sender: TObject);
    procedure chbxDispoClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    private
    { Private declarations }
        Procedure ImprimeReporte(bPreview:Boolean);
        Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMDispDet;
end;
 TMDispDet= class(TInterFrame)
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
        UnidadNegocio    : TUnNegocio;
        Empresa          : TEmpresa;

        VGID_CREDITO     : Integer;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}


constructor TMDispDet.Create( AOwner : TComponent );
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

      //BSS
      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);
      
      UseQuery := False;
      HelpFile := 'InTMDispDet.Hlp';
      ShowMenuReporte:=True;

      VGID_CREDITO := 0;
end;

Destructor TMDispDet.Destroy;
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
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   inherited;
end;


function TMDispDet.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMDispDet;
begin
   W:=TwMDispDet.Create(Self);
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


Function TMDispDet.InternalBusca:Boolean;
begin InternalBusca := False;
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMDispDet.AsignaEmpresaSuc;
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

procedure TwMDispDet.FormShow(Sender: TObject);
begin
   //PINTA DATOS DEL PANEL INFERIOR
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   dtpF_Inicio.DateTime:= Objeto.Apli.DameFechaEmpresa;
   dtpF_Fin.DateTime:= Objeto.Apli.DameFechaEmpresa;
//      edF_Inicio.text:=FormatDateTime('dd/mm/yyyy',dtpF_Inicio.DateTime);
//      edF_FIN.text:=FormatDateTime('dd/mm/yyyy',dtpF_Fin.DateTime);
   edF_Inicio.text:='';
   edF_FIN.text:='';

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

   Self.chbxDispo.Checked := True;
   Self.chbxDetalle.Checked := True;

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

   if Objeto.VGID_CREDITO <> 0 then
   begin
        if Objeto.Credito.FindKey([IntToStr(Objeto.VGID_CREDITO)]) then
        begin
             chbxCESION.Checked:=True;
             chbxCESION.Enabled:=True;
        end;
   end;

end;

procedure TwMDispDet.FormDestroy(Sender: TObject);
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
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMDispDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMDispDet.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMDispDet.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMDispDet.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMDispDet.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TwMDispDet.btPROMOTORClick(Sender: TObject);
begin
    Objeto.Promotor.ShowAll := True;
    If Objeto.Promotor.Busca Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMDispDet.ilPROMOTORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMDispDet.ilPROMOTOREjecuta(Sender: TObject);
begin
    If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMDispDet.chbxMonedaClick(Sender: TObject);
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

procedure TwMDispDet.chbxPromotorClick(Sender: TObject);
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

procedure TwMDispDet.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMDISPDET_PREVI',True,True) then
   begin
      ImprimeReporte(True);
   end;
end;

procedure TwMDispDet.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMDispDet.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMDispDet.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMDispDet.btPRODUCTOClick(Sender: TObject);
begin
   Objeto.Producto.BuscaWhereString:= ' CR_PRODUCTO.ID_EMPRESA='+ IntToStr(Objeto.Apli.IdEmpresa);

   If Objeto.Acreditado.Persona.Cve_Per_Juridica.AsString = 'PF' Then Begin
      Objeto.Producto.BuscaWhereString:= Objeto.Producto.BuscaWhereString +
                                       ' and CR_PRODUCTO.B_PER_FISICA = '
                                       + #39 + 'V' + #39
                                       + ' AND CR_PRODUCTO.SIT_PRODUCTO ='
                                       + #39 + 'AC' + #39 ;
   End Else If Objeto.Acreditado.Persona.Cve_Per_Juridica.AsString = 'PM' Then Begin
      Objeto.Producto.BuscaWhereString:= Objeto.Producto.BuscaWhereString +
                                       ' and CR_PRODUCTO.B_PER_MORAL = '
                                       + #39 + 'V' + #39
                                       + ' AND CR_PRODUCTO.SIT_PRODUCTO ='
                                       + #39 + 'AC' + #39 ;
   End;

   Objeto.Producto.FilterString := Objeto.Producto.BuscaWhereString;
   Objeto.Producto.ShowAll := True;
   if Objeto.Producto.Busca Then Begin
      chbxProducto.Checked:= True;
      chbxProducto.Enabled:= True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   end;
end;

procedure TwMDispDet.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMDispDet.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;


procedure TwMDispDet.chbxProductoClick(Sender: TObject);
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

procedure TwMDispDet.chbxAcreditadoClick(Sender: TObject);
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

procedure TwMDispDet.btPROM_ADMONClick(Sender: TObject);
begin
    Objeto.PromotorAdmon.ShowAll := True;
    If Objeto.PromotorAdmon.Busca Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TwMDispDet.ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMDispDet.ilPromAdmonEjecuta(Sender: TObject);
begin
    If Objeto.PromotorAdmon.FindKey([ilPromAdmon.Buffer]) Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TwMDispDet.chbxPromAmonClick(Sender: TObject);
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

procedure TwMDispDet.edID_PROMOTORChange(Sender: TObject);
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

procedure TwMDispDet.edID_PROMChange(Sender: TObject);
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

Procedure TwMDispDet.ImprimeReporte(bPreview:Boolean);
Var
    sSituacion,sBFirmasOrd, sBFirmasDet, sBCapacPago :String;
    iSit : Integer;
    dIntereses : Double;
begin
    iSit:=rgSitMov.ItemIndex;
    case iSit of
        0: sSituacion:='';    //Indistinta
        1: sSituacion:='AC';  //Autorizado
        2: sSituacion:='NA';  //No Autorizado
        3: sSituacion:='CA';  //Cancelado
        4: sSituacion:='LQ';  //liquidado
    end;

    if cbFirmasOrd.Checked then
       sBFirmasOrd := 'V';

    if Not(cbFirmasOrd.Checked) then
       sBFirmasOrd := 'F';

    if cbFirmasDet.Checked then
       sBFirmasDet := 'V';

    if Not(cbFirmasDet.Checked) then
       sBFirmasDet := 'F';

    if chbxCapPag.Checked then          //JFOF 23/04/2013 Se agrega, Opción de Capacidad de Pago
       sBCapacPago := 'V';

    if Not(chbxCapPag.Checked) then     //JFOF 23/04/2013 Se agrega, Opción de Capacidad de Pago
       sBCapacPago := 'F';


    If (Self.chbxDispo.Checked) AND (NOT Self.chbxdetalle.Checked ) Then Begin

       EjecutarReporteDispDet( edF_Inicio.Text, edF_Fin.Text, edCVE_PRODUCTO_CRE.Text,
                             edCVE_MONEDA.Text, edACREDITADO.Text, edID_PROMOTOR.Text,
                             edID_PROM.Text, edID_CESION.Text,sSituacion, sBFirmasOrd, sBCapacPago,  //JFOF 23/04/2013 Se agrega, Opción de Capacidad de Pago
                             EdIdEmpresa.Text, EdIDSucursal.Text,//BSS
                             Objeto.Apli,bPreview,cbFirstPage.Checked     );
    End
    Else If(NOT Self.chbxDispo.Checked) AND (Self.chbxdetalle.Checked ) Then Begin

       {EjecutarReporteDetCred( edF_Inicio.Text, edF_Fin.Text, edCVE_PRODUCTO_CRE.Text,
                             edCVE_MONEDA.Text, edACREDITADO.Text, edID_PROMOTOR.Text,
                             edID_PROM.Text, edID_CESION.Text,sSituacion,sBFirmas, Objeto.Apli,
                             bPreview);}

       EjecutarReporteDetCred('', '', '','', '', '','',
                              edID_CESION.Text,sSituacion,sBFirmasDet,
                              EdIdEmpresa.Text, EdIDSucursal.Text,//BSS
                              Objeto.Apli, bPreview, cbDetFA.Checked
                              ,edNbrArch.Text); //salida a excel
    End
    Else If(Self.chbxDispo.Checked) AND (Self.chbxdetalle.Checked) Then Begin
       EjecutarReporteDispDet( edF_Inicio.Text, edF_Fin.Text, edCVE_PRODUCTO_CRE.Text,
                            edCVE_MONEDA.Text, edACREDITADO.Text, edID_PROMOTOR.Text,
                            edID_PROM.Text, edID_CESION.Text,sSituacion,sBFirmasOrd, sBCapacPago, //JFOF 23/04/2013 Se agrega, Opción de Capacidad de Pago
                            EdIdEmpresa.Text, EdIDSucursal.Text,//BSS
                            Objeto.Apli, bPreview,cbFirstPage.Checked);

       {EjecutarReporteDetCred( edF_Inicio.Text, edF_Fin.Text, edCVE_PRODUCTO_CRE.Text,
                             edCVE_MONEDA.Text, edACREDITADO.Text, edID_PROMOTOR.Text,
                             edID_PROM.Text, edID_CESION.Text, sSituacion,sBFirmas, Objeto.Apli,
                             bPreview);}
       EjecutarReporteDetCred('', '', '','', '', '','',
                              edID_CESION.Text,sSituacion,sBFirmasDet,
                              EdIdEmpresa.Text, EdIDSucursal.Text,//BSS
                              Objeto.Apli, bPreview, cbDetFA.Checked
                              ,edNbrArch.Text); //salida a excel

    End;

End;
procedure TwMDispDet.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMDISPDET_IMPRI',True,True) then
   begin
      ImprimeReporte(False);
   end;
end;

procedure TwMDispDet.edID_CESIONChange(Sender: TObject);
begin
    If Trim(edID_CESION.Text)<>'' Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        chbxDetalle.Enabled:= True;
        chbxDetalle.Checked:= True;
        chbxFechas.Checked:= False;
        cbDetFA.Checked:= False;
    End Else Begin
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
        chbxDetalle.Checked:= False;
        chbxDetalle.Enabled:= False;
        cbDetFA.Checked:= False;        
        dtpF_Inicio.DateTime:= Objeto.Apli.DameFechaEmpresa;
        dtpF_Fin.DateTime:= Objeto.Apli.DameFechaEmpresa;
        edF_Inicio.text:=FormatDateTime('dd/mm/yyyy',dtpF_Inicio.DateTime);
        edF_FIN.text:=FormatDateTime('dd/mm/yyyy',dtpF_Fin.DateTime);
    End;
end;

procedure TwMDispDet.btID_CESIONClick(Sender: TObject);
begin
   Objeto.Credito.BuscaWhereString:= ' CONTRATO.ID_EMPRESA ='+ IntToStr(Objeto.Apli.IdEmpresa);
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;


procedure TwMDispDet.chbxCESIONClick(Sender: TObject);
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

procedure TwMDispDet.ilCesionCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMDispDet.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TwMDispDet.InterForma1DespuesShow(Sender: TObject);
begin
//   Objeto.Credito.ID_CREDITO.AsInteger := Objeto.vgIdCredito;
//   Objeto.Credito.FindKey([Objeto.Credito.ID_CREDITO.AsString]);
end;

procedure TwMDispDet.chbxFechasClick(Sender: TObject);
begin
    If not chbxFechas.Checked Then Begin
        edF_Inicio.Text:= '';
        edF_FIN.Text:= '';
        chbxFechas.Checked:=False;
        chbxFechas.Enabled:=False;
    End Else Begin
        chbxFechas.Checked:=True;
        chbxFechas.Enabled:=True;
    End;
end;

procedure TwMDispDet.edF_InicioChange(Sender: TObject);
begin
    If (Trim(edF_Inicio.Text)<>'') OR (Trim(edF_FIN.Text)<>'') Then Begin
        chbxFechas.Checked:=True;
    End Else Begin
        chbxFechas.Checked:=False;
    End;
end;

procedure TwMDispDet.edF_FINChange(Sender: TObject);
begin
    If (Trim(edF_Inicio.Text)<>'') OR (Trim(edF_FIN.Text)<>'') Then Begin
        chbxFechas.Checked:=True;
    End Else Begin
        chbxFechas.Checked:=False;
    End;

end;

procedure TwMDispDet.chbxDispoClick(Sender: TObject);
begin
   If not chbxDispo.Checked Then Begin
      chbxFechas.Checked := False;
      Objeto.Producto.Active := False;
      Objeto.Moneda.Active := False;
      Objeto.Acreditado.Active := False;
      Objeto.Promotor.Active := False;
      Objeto.PromotorAdmon.Active := False;
   End;
end;

procedure TwMDispDet.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMDispDet.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMDispDet.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMDispDet.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMDispDet.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMDispDet.sbExcelClick(Sender: TObject);
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

procedure TwMDispDet.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TwMDispDet.cbxArchivoClick(Sender: TObject);
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

