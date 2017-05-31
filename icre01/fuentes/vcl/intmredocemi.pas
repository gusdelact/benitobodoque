// Sistema         : Clase de TMReDocEmi
// Fecha de Inicio : 01/10/2003
// Función forma   : Clase de TMReDocEmi
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMReDocEmi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntMon,           //Moneda
IntCrEmisor,      //Emisor
IntCrProveed,     //Proveedor
IntMPers,         //Promotor
IntEmple,
IntCrCto,         //Contrato
IntCrCredito,     //Disposición
IntParamCre,
IntMQrDocEmi,      //Reporte
Intempre,          //Empresa
IntUnNeg,           //Unidad Negocio/Suc
IntGenCre, 
IntCrCartrIm            //Detalle de Impagado

;

Type
 TMReDocEmi= class;

  TwMReDocEmi=Class(TForm)
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
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    ilMONEDA: TInterLinkit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
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
    lbID_PROMOTOR: TLabel;
    edID_PROMOTOR: TEdit;
    btPROMOTOR: TBitBtn;
    ilPROMOTOR: TInterLinkit;
    edNOM_PROMOTOR: TEdit;
    Label7: TLabel;
    Label1: TLabel;
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
    chbxEmisor: TCheckBox;
    chbxProveedor: TCheckBox;
    chbxPromotor: TCheckBox;
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
    rgOrden: TRadioGroup;
    rgGrupo: TRadioGroup;
    chbxF_Liq: TCheckBox;
    chbxF_Com: TCheckBox;
    gbControl: TGroupBox;
    Label3: TLabel;
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
    MsgPanel: TPanel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure ilEMISORCapture(Sender: TObject; var Show: Boolean);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure btEMISORExit(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure ilPROVEEDORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure edID_PROVEEDORExit(Sender: TObject);
    procedure btPROMOTORClick(Sender: TObject);
    procedure ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROMOTOREjecuta(Sender: TObject);
    procedure edID_PROMOTORExit(Sender: TObject);
    procedure btCONTRATOClick(Sender: TObject);
    procedure ilIDCONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure iedID_CONTRATOExit(Sender: TObject);
    procedure ilIDCONTRATOEjecuta(Sender: TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure ilCREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure chbxF_LiqClick(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure chbxF_ComClick(Sender: TObject);
    procedure chbxEmisorClick(Sender: TObject);
    procedure edID_EMISORChange(Sender: TObject);
    procedure chbxProveedorClick(Sender: TObject);
    procedure edID_PROVEEDORChange(Sender: TObject);
    procedure chbxPromotorClick(Sender: TObject);
    procedure chbxAutorizacionClick(Sender: TObject);
    procedure chbxDisposicionClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure edLiqF_INICIOChange(Sender: TObject);
    procedure edLiqF_FINALChange(Sender: TObject);
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
         Procedure ImprimeReporte(bPreview:Boolean);
         Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMReDocEmi;
end;
 TMReDocEmi= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        Moneda                   : TMoneda;
        Emisor                   : TCrEmisor;
        Proveedor                : TCrProveed;
        Promotor                 : TEmpleado; //Promotor Responsable
        ContratoCre              : TCrCto; //Contrato Crédito
        Credito                  : TCrCredito;
        ParamCre                 : TParamCre;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        DetImpagado              : TCrCartrIm;
        
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


constructor TMReDocEmi.Create( AOwner : TComponent );
begin Inherited;
      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;
      Emisor.FieldByName('ID_ACREDITADO').MasterField:='ID_EMISOR';
      Emisor.FieldByName('CVE_EMISOR_EXT').MasterField:='CVE_EMISOR_NAFIN';

      Proveedor := TCrProveed.Create(Self);
      Proveedor.MasterSource:=Self;      StpName  := ' ';
      Proveedor.FieldByName('ID_ACREDITADO').MasterField:='ID_PROVEEDOR';

      Promotor := TEmpleado.Create(Self);
      Promotor.FilterBy := fbTMPersonaEmpleado;
      Promotor.MasterSource := Self;
      Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
      Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

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
      HelpFile := 'IntMReDocEmi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMReDocEmi.Destroy;
begin
   if Moneda <> nil then
      Moneda.Free;
   if Emisor <> nil then
      Emisor.Free;
   if Proveedor <> nil then
      Proveedor.Free;
   if Promotor <> nil then
      Promotor.Free;
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


function TMReDocEmi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMReDocEmi;
begin
   W:=TwMReDocEmi.Create(Self);
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


Function TMReDocEmi.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TMReDocEmi.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMReDocEmi.AsignaEmpresaSuc;
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

procedure TwMReDocEmi.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

//      dtpLiqF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa;
//      dtpLiqF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresa;
//      dtpComF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa;
//      dtpComF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresa;

//      edLiqF_INICIO.text:=FormatDateTime('dd/mm/yyyy',dtpLiqF_INICIO.DateTime);
//      edLiqF_FINAL.text:=FormatDateTime('dd/mm/yyyy',dtpLiqF_FINAL.DateTime);
//      edComF_INICIO.text:=FormatDateTime('dd/mm/yyyy',dtpComF_INICIO.DateTime);
//      edComF_FINAL.text:=FormatDateTime('dd/mm/yyyy',dtpComF_FINAL.DateTime);
//      chbxF_Liq.Checked := True;
//      chbxF_Com.Checked := True;

      Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);
      edDESC_MONEDA.Hint := Objeto.Moneda.Desc_Moneda.AsString;
      edDESC_MONEDA.ShowHint := True;

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
{/ROIM}
      Objeto.Proveedor.GetParams(Objeto);
      edNOM_PROVEEDOR.Hint := Objeto.Proveedor.Persona.Nombre.AsString;
      edNOM_PROVEEDOR.ShowHint := True;

      Objeto.Promotor.ID_Persona.Control :=edID_PROMOTOR;
      Objeto.Promotor.Persona.Nombre.Control :=edNOM_PROMOTOR;
      Objeto.Promotor.GetParams(Objeto);
      edNOM_PROMOTOR.Hint := Objeto.Promotor.Persona.Nombre.AsString;
      edNOM_PROMOTOR.ShowHint := True;

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
      Interforma1.MsgPanel := MsgPanel;
      chbxF_Com.Checked := False;      
end;

procedure TwMReDocEmi.FormDestroy(Sender: TObject);
begin
      Objeto.Moneda.Cve_Moneda.Control := nil;
      Objeto.Moneda.Desc_Moneda.Control := nil;
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
      Objeto.Promotor.Persona.Nombre.Control :=nil;
      Objeto.Promotor.Id_Persona.Control :=nil;
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

procedure TwMReDocEmi.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMReDocEmi.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMReDocEmi.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWNinguno.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TwMReDocEmi.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMReDocEmi.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMReDocEmi.ilMONEDAEjecuta(Sender: TObject);
begin
   if Objeto.Moneda.FindKey([ilMONEDA.Buffer]) then begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
   end;
end;

procedure TwMReDocEmi.edCVE_MONEDAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
end;

procedure TwMReDocEmi.btEMISORClick(Sender: TObject);
begin
    Objeto.Emisor.ShowAll := True;
    if Objeto.Emisor.Busca then begin
        chbxEmisor.Checked:=True;
        chbxEmisor.Enabled:=True;
    End;
end;

procedure TwMReDocEmi.ilEMISORCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMReDocEmi.ilEMISOREjecuta(Sender: TObject);
begin
    if Objeto.Emisor.FindKeyNear([ilEMISOR.Buffer],['ID_ACREDITADO']) then begin
        chbxEmisor.Checked:=True;
        chbxEmisor.Enabled:=True;
        InterForma1.NextTab(edID_EMISOR);
    End;
end;

procedure TwMReDocEmi.btEMISORExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_EMISOR,True,'',True);
end;

procedure TwMReDocEmi.btPROVEEDORClick(Sender: TObject);
Var vlMensaje :String;
begin
   Objeto.Proveedor.ShowAll := True;
   if Objeto.Proveedor.Busca then begin
        chbxProveedor.Checked:=True;
        chbxProveedor.Enabled:=True;
        //EASA  REQ. 20007 - 07 / 018   CARTERA IMPAGADA
        InterForma1.NextTab(edID_EMISOR);
        InterForma1.MsgPanel.Caption := '';
        InterForma1.MsgPanel.Color := clBtnFace;
        InterForma1.MsgPanel.Font.Color := clWhite;
        if not ( FindDispIMPProv(Objeto.Proveedor.ID_ACREDITADO.AsInteger,Objeto.Apli, vlMensaje)) then
        Begin
           InterForma1.MsgPanel.Caption := vlMensaje;
           InterForma1.MsgPanel.Color := clRed;
           InterForma1.MsgPanel.Font.Color := clWhite;
           if MessageDlg(vlMensaje + ', desea ver el detalle?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Begin
              Objeto.DetImpagado := TCrCartrIm.Create(self);
              Try
                Objeto.DetImpagado.Apli:= Objeto.Apli;
                Objeto.DetImpagado.ID_ACREDITADO.AsString := Objeto.Proveedor.ID_ACREDITADO.ASstring;
                Objeto.DetImpagado.NOM_ACREDITADO.AsString := Objeto.Proveedor.Persona.nombre.asstring;
                Objeto.DetImpagado.TIPO_CLIENTE.AsString := 'PR';
                Objeto.DetImpagado.ParamCre:=Objeto.ParamCre;
                Objeto.DetImpagado.Catalogo;
              finally
                Objeto.DetImpagado.Free;
              end;
           end;
        end;
        //END EASA
      InterForma1.NextTab(edID_PROVEEDOR);
   End;
end;

procedure TwMReDocEmi.ilPROVEEDORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMReDocEmi.ilPROVEEDOREjecuta(Sender: TObject);
Var vlMensaje :String;
begin
   if Objeto.Proveedor.FindKey([ilPROVEEDOR.Buffer]) then begin
        chbxProveedor.Checked:=True;
        chbxProveedor.Enabled:=True;
        //EASA  REQ. 20007 - 07 / 018   CARTERA IMPAGADA
        InterForma1.NextTab(edID_EMISOR);
        InterForma1.MsgPanel.Caption := '';
        InterForma1.MsgPanel.Color := clBtnFace;
        InterForma1.MsgPanel.Font.Color := clWhite;
        if not ( FindDispIMPProv(Objeto.Proveedor.ID_ACREDITADO.AsInteger,Objeto.Apli, vlMensaje)) then
        Begin
           InterForma1.MsgPanel.Caption := vlMensaje;
           InterForma1.MsgPanel.Color := clRed;
           InterForma1.MsgPanel.Font.Color := clWhite;
           if MessageDlg(vlMensaje + ', desea ver el detalle?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Begin
              Objeto.DetImpagado := TCrCartrIm.Create(self);
              Try
                Objeto.DetImpagado.Apli:= Objeto.Apli;
                Objeto.DetImpagado.ID_ACREDITADO.AsString := Objeto.Proveedor.ID_ACREDITADO.ASstring;
                Objeto.DetImpagado.NOM_ACREDITADO.AsString := Objeto.Proveedor.Persona.nombre.asstring;
                Objeto.DetImpagado.TIPO_CLIENTE.AsString := 'PR';
                Objeto.DetImpagado.ParamCre:=Objeto.ParamCre;
                Objeto.DetImpagado.Catalogo;
              finally
                Objeto.DetImpagado.Free;
              end;
           end;
        end;
        //END EASA
        InterForma1.NextTab(edID_PROVEEDOR);
   End;
end;

procedure TwMReDocEmi.edID_PROVEEDORExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_PROVEEDOR,True,'',True);
end;

procedure TwMReDocEmi.btPROMOTORClick(Sender: TObject);
begin
   Objeto.Promotor.ShowAll := True;
   if Objeto.Promotor.Busca then begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
   End;
end;

procedure TwMReDocEmi.ilPROMOTORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMReDocEmi.ilPROMOTOREjecuta(Sender: TObject);
begin
   if Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) then begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
   End;
end;

procedure TwMReDocEmi.edID_PROMOTORExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_PROMOTOR,True,'',True);
end;

procedure TwMReDocEmi.btCONTRATOClick(Sender: TObject);
begin
   //BUSCADOR DE LA CLASE CONTRATO CREDITO
   Objeto.ContratoCre.ShowAll := True;
   if Objeto.ContratoCre.Busca then begin
        chbxAutorizacion.Checked:=True;
        chbxAutorizacion.Enabled:=True;
        InterForma1.NextTab(btCONTRATO);
   End;
end;

procedure TwMReDocEmi.ilIDCONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show := True;
end;

procedure TwMReDocEmi.iedID_CONTRATOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(iedID_CONTRATO,True,'',True);
end;

procedure TwMReDocEmi.ilIDCONTRATOEjecuta(Sender: TObject);
begin
   if Objeto.ContratoCre.FindKey([ilIDCONTRATO.Buffer,'1']) then begin
        chbxAutorizacion.Checked:=True;
        chbxAutorizacion.Enabled:=True;
        InterForma1.NextTab(iedID_CONTRATO);
   End;
end;

procedure TwMReDocEmi.btCREDITOClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxDisposicion.Checked:=True;
        chbxDisposicion.Enabled:=True;
        InterForma1.NextTab(edID_CREDITO);
   End;
end;

procedure TwMReDocEmi.ilCREDITOCapture(Sender: TObject; var Show: Boolean);
begin
     Show := True;
end;

procedure TwMReDocEmi.ilCREDITOEjecuta(Sender: TObject);
begin
   if Objeto.Credito.FindKey([ilCREDITO.Buffer]) then begin
        chbxDisposicion.Checked:=True;
        chbxDisposicion.Enabled:=True;
        InterForma1.NextTab(edID_CREDITO);
   End;
end;

procedure TwMReDocEmi.edID_CREDITOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CREDITO,True,'',True);
end;

procedure TwMReDocEmi.chbxF_LiqClick(Sender: TObject);
begin
    If not chbxF_Liq.Checked Then Begin
        edLiqF_INICIO.Text:='';
        edLiqF_FINAL.Text:='';
        chbxF_Liq.Checked:=False;
        chbxF_Liq.Enabled:=False;
    End;
end;
procedure TwMReDocEmi.chbxMonedaClick(Sender: TObject);
begin
    If not chbxMoneda.Checked Then Begin
        Objeto.Moneda.Active:=False;
        chbxMoneda.Checked:=False;
        chbxMoneda.Enabled:=False;
    End Else Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
    End;
end;

procedure TwMReDocEmi.chbxF_ComClick(Sender: TObject);
begin
    If not chbxF_Com.Checked Then Begin
        edComF_INICIO.Text:='';
        edComF_FINAL.Text:='';
        chbxF_Com.Checked:=False;
        chbxF_Com.Enabled:=false;
    End;
end;

procedure TwMReDocEmi.chbxEmisorClick(Sender: TObject);
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

procedure TwMReDocEmi.edID_EMISORChange(Sender: TObject);
begin
    If Trim(edID_EMISOR.Text)<>'' Then Begin
        chbxEmisor.Checked:= True;
        chbxEmisor.Enabled:=True;
        edID_PROVEEDOR.Enabled:= False;
        btPROVEEDOR.Enabled:= False;
    End Else Begin
        chbxEmisor.Checked:= False;
        chbxEmisor.Enabled:=False;
        edID_PROVEEDOR.Enabled:= True;
        btPROVEEDOR.Enabled:= True;
    End;
end;
procedure TwMReDocEmi.chbxProveedorClick(Sender: TObject);
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

procedure TwMReDocEmi.edID_PROVEEDORChange(Sender: TObject);
begin
    If Trim(edID_PROVEEDOR.Text)<>'' Then Begin
        chbxProveedor.Checked:= True;
        chbxProveedor.Enabled:=True;
        edID_EMISOR.Enabled:= False;
        btEMISOR.Enabled:= False;
    End Else Begin
        chbxProveedor.Checked:= False;
        chbxProveedor.Enabled:=False;
        edID_EMISOR.Enabled:= True;
        btEMISOR.Enabled:= True;
    End;
end;

procedure TwMReDocEmi.chbxPromotorClick(Sender: TObject);
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

procedure TwMReDocEmi.chbxAutorizacionClick(Sender: TObject);
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

procedure TwMReDocEmi.chbxDisposicionClick(Sender: TObject);
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

procedure TwMReDocEmi.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMREDOCEMI_PREVI',True,True) then
   begin
      ImprimeReporte(True);
   end;
end;

procedure TwMReDocEmi.edLiqF_INICIOChange(Sender: TObject);
begin
    If Trim(edLiqF_INICIO.Text)<>'' Then Begin
        chbxF_Liq.Checked:=True;
        chbxF_Liq.Enabled:=True;
    End Else If Trim(edLiqF_FINAL.Text)='' Then Begin
        chbxF_Liq.Checked:=False;
        chbxF_Liq.Enabled:=False;
    End;
end;

procedure TwMReDocEmi.edLiqF_FINALChange(Sender: TObject);
begin
    If Trim(edLiqF_FINAL.Text)<>'' Then Begin
        chbxF_Liq.Checked:=True;
        chbxF_Liq.Enabled:=True;
    End Else If Trim(edLiqF_INICIO.Text)='' Then Begin
        chbxF_Liq.Checked:=False;
        chbxF_Liq.Enabled:=False;
    End;
end;

procedure TwMReDocEmi.edComF_INICIOChange(Sender: TObject);
begin
    If Trim(edComF_INICIO.Text)<>'' Then Begin
        chbxF_Com.Checked:=True;
        chbxF_Com.Enabled:=True;
    End Else If Trim(edComF_FINAL.Text)='' Then Begin
        chbxF_Com.Checked:=False;
        chbxF_Com.Enabled:=false;
    End;
end;

procedure TwMReDocEmi.edComF_FINALChange(Sender: TObject);
begin
    If Trim(edComF_FINAL.Text)<>'' Then Begin
        chbxF_Com.Checked:=True;
        chbxF_Com.Enabled:=True;
    End Else If Trim(edComF_INICIO.Text)='' Then Begin
        chbxF_Com.Checked:=False;
        chbxF_Com.Enabled:=false;
    End;
end;

procedure TwMReDocEmi.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMREDOCEMI_IMPRI',True,True) then
   begin
      ImprimeReporte(False);
   end;
end;
Procedure TwMReDocEmi.ImprimeReporte(bPreview:Boolean);
Var
    sSituacion,sOrden,sGrupo:String;
    iSit:Integer;
begin
    iSit:=rgOrden.ItemIndex;
    case iSit of
        0: sOrden:='C';   //Crédito
        1: sOrden:='P';  //Persona
    end;
    iSit:=rgSituacion.ItemIndex;
    case iSit of
        0: sSituacion:='';     //Todos
        1: sSituacion:='AC';  //Activos
        2: sSituacion:='NA';  //En transito
        3: sSituacion:='LQ';  //Liquidados
        4: sSituacion:='IM';  //Impagados
        5: sSituacion:='CA';  //Cancelados
    end;
    iSit:=rgGrupo.ItemIndex;
    case iSit of
        0: sGrupo:='E';  //Proveedor
        1: sGrupo:='P';  //Emisor
        2: sGrupo:='C';  //Cesión
    end;

    RepRelDocEmi(edLiqF_INICIO.Text , edLiqF_FINAL.Text , edComF_INICIO.Text ,
                 edComF_FINAL.Text  , edCVE_MONEDA.Text , edID_EMISOR.Text   ,
                 edID_PROVEEDOR.Text, edID_PROMOTOR.Text, iedID_CONTRATO.Text,
                 edID_CREDITO.Text  , sSituacion        , sOrden             ,
                 sGrupo             , EdIdEmpresa.Text  , EdIDSucursal.Text  ,
                 Objeto.Apli        , bPreview);
End;
procedure TwMReDocEmi.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMReDocEmi.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMReDocEmi.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMReDocEmi.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMReDocEmi.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

end.

