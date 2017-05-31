// Sistema         : Clase de Filtro de Reporte de Estado de Cuenta
// Fecha de Inicio : 24/08/2004
// Función forma   : Clase de Filtro de Reporte de Estado de Cuenta
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMEdoCtaDD;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
InterEdit, IntParamCre, IntCrCredito, IntSGCtrl,

IntCrAcredit,     //Acreditado
IntMPers,
IntMProdGpo,      //Grupo de crédito
IntCrProduct,     //Producto de crédito                                                             e 
Intempre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntCrProveed,
IntEmple,
IntGenCre
;

Type
 TMEdoCtaDD= class;

  TwMEdoCtaDD=Class(TForm)
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
    Label4: TLabel;
    edDisposicion: TEdit;
    btDisposicion: TBitBtn;
    edDesc_Prod: TEdit;
    cbxDisposicion: TCheckBox;
    ilDisposicion: TInterLinkit;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    ilPRODUCTO: TInterLinkit;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    chbxProducto: TCheckBox;
    rgSituacion: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edNOM_CVE_PRODUCTO_GPO: TEdit;
    edCVE_PRODUCTO_CRE: TEdit;
    btCREDITO_FIN: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    lbID_PROMOTOR: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edPROVEEDOR: TEdit;
    btPROVEEDOR: TBitBtn;
    edNOM_PROVEEDOR: TEdit;
    chbxProveedor: TCheckBox;
    chbxPromAdm: TCheckBox;
    edNOM_PROM_ADM: TEdit;
    btPROM_ADMON: TBitBtn;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    chbxAcreditado: TCheckBox;
    edID_PROM_ADM: TEdit;
    ilACREDITADO: TInterLinkit;
    ilPROVEEDOR: TInterLinkit;
    ilPromAdmon: TInterLinkit;
    gbControl: TGroupBox;
    Label14: TLabel;
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
    MBitacora: TMemo;
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    stpInicio: TInterDateTimePicker;
    edFIni: TEdit;
    chbxF_Liq: TCheckBox;
    Label3: TLabel;
    edID_PROM_ASOC: TEdit;
    btPROM_ASOC: TBitBtn;
    edNOM_PROM_ASOC: TEdit;
    ilPromAsoc: TInterLinkit;
    chbxPromAsoc: TCheckBox;
    rgOrdendo: TRadioGroup;
    rgTipoCta: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure ilDisposicionCapture(Sender: TObject; var Show: Boolean);
    procedure ilDisposicionEjecuta(Sender: TObject);
    procedure btDisposicionClick(Sender: TObject);
    procedure cbxDisposicionClick(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure btCREDITO_FINClick(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure edFFinExit(Sender: TObject);
    procedure stpInicioExit(Sender: TObject);
    procedure sgcDATAMoveRow(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure btACREDITADOClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure ilPROVEEDORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
    procedure btPROM_ADMONClick(Sender: TObject);
    procedure ilPromAdmonEjecuta(Sender: TObject);
    procedure chbxPromAdmClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure chbxPromAsocClick(Sender: TObject);
    procedure btPROM_ASOCClick(Sender: TObject);
    procedure edPROVEEDORChange(Sender: TObject);
    procedure ilPromAsocEjecuta(Sender: TObject);
    procedure ilPromAsocCapture(Sender: TObject; var Show: Boolean);
    procedure chbxProveedorClick(Sender: TObject);
    procedure edID_PROM_ASOCChange(Sender: TObject);
    procedure stpInicioChange(Sender: TObject);
    procedure edFIniChange(Sender: TObject);
    private
    { Private declarations }
     procedure EnableCheckBox(var CheckBox : TCheckBox);
     procedure ImprimeReporte(bPreview : Boolean; grOpcion  : TGenRepOption );
     procedure InhabilitaCtrls;
     procedure HabilitaCtrls;
     Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMEdoCtaDD;
    end;

 TMEdoCtaDD= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre         : TParamCre;
        CrCredito        : TCrCredito;
        GpoProd          : TMProdGpo;
        Producto         : TCrProduct;
        Acreditado       : TCrAcredit;
        PromAsoc         : TEmpleado; //Promotor Asociado
        PromAdmon        : TEmpleado; //Promotor Admon
        UnidadNegocio    : TUnNegocio;
        Empresa          : TEmpresa;
        Proveedor        : TCrProveed;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
uses IntMQrEdoCtaDM, IntMQrEdoCtaDD;
{$R *.DFM}

constructor TMEdoCtaDD.Create( AOwner : TComponent );
begin Inherited;
   CrCredito := TCrCredito.Create(Self);
   CrCredito.MasterSource:=Self;
   CrCredito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

   GpoProd:= TMProdGpo.Create(Self);
   GpoProd.MasterSource:=Self;
   GpoProd.FieldByName('CVE_PRODUCTO_GPO').MasterField:='CVE_PRODUCTO_GPO';

   Producto :=  TCrProduct.Create(Self);
   Producto.MasterSource:=Self;
   Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='CVE_PRODUCTO_CRE';

   Acreditado := TCrAcredit.Create(Self);
   Acreditado.MasterSource := Self;

   Proveedor := TCrProveed.Create(Self);
   Proveedor.MasterSource := Self;

   PromAsoc := TEmpleado.Create(Self);
   PromAsoc.FilterBy := fbTMPersonaEmpleado;
   PromAsoc.MasterSource := Self;
   PromAsoc.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
   PromAsoc.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';
   PromAsoc.FilterString := PromAsoc.BuscaWhereString;

   PromAdmon := TEmpleado.Create(Self);
   PromAdmon.FilterBy := fbTMPersonaEmpleado;
   PromAdmon.MasterSource := Self;
   PromAdmon.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR_ADM';
   PromAdmon.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';
   PromAdmon.FilterString := PromAdmon.BuscaWhereString;

   Empresa := TEmpresa.Create(Self);
   UnidadNegocio := TUnNegocio.Create(Self);

   StpName  := ' ';
   UseQuery := False;
   HelpFile := 'IntMEdoCtaDD.Hlp';
   ShowMenuReporte:=True;
end;

Destructor TMEdoCtaDD.Destroy;
begin
   If Assigned(CrCredito) Then
      CrCredito.Free;
   If Assigned(GpoProd) Then
      GpoProd.Free;
   If Assigned(Producto) Then
      Producto.Free;
   If Assigned(Acreditado) Then
      Acreditado.Free;
   If Assigned(Proveedor) Then
      Proveedor.Free;
   If Assigned(PromAsoc) Then
      PromAsoc.Free;
   If Assigned(PromAdmon) Then
      PromAdmon.Free;
   If Assigned(Empresa) Then
      Empresa.Free;
   If Assigned(UnidadNegocio) Then
      UnidadNegocio.Free;
   Inherited;
end;


function TMEdoCtaDD.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMEdoCtaDD;
begin
   W:=TWMEdoCtaDD.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TMEdoCtaDD.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IMEdoCtaDD.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TMEdoCtaDD.Reporte:Boolean;
begin //Execute_Reporte();
end;

(***********************************************FORMA ********************)
(*                                                                              *)
(*  FORMA

(*                                                                              *)
(***********************************************FORMA ********************)
procedure TwMEdoCtaDD.AsignaEmpresaSuc;
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

procedure TwMEdoCtaDD.FormShow(Sender: TObject);
begin
   With Objeto Do Begin
      CrCredito.ID_CREDITO.Control := edDisposicion;
      CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edDesc_Prod;
      CrCredito.GetParams(Objeto);

      Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
      Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
      Objeto.GpoProd.GetParams(Objeto);

      Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;
      Objeto.Producto.GetParams(Objeto);
      edDESC_PRODUCTO1.Hint := Objeto.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO1.ShowHint := True;

      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

      Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      Objeto.Proveedor.ID_ACREDITADO.Control := edPROVEEDOR;
      Objeto.Proveedor.Persona.Nombre.Control := edNOM_PROVEEDOR;
      Objeto.GetParams(Objeto);
      edNOM_PROVEEDOR.Hint := Objeto.Proveedor.Persona.Nombre.AsString;
      edNOM_PROVEEDOR.ShowHint := True;

      Objeto.PromAsoc.Id_Persona.Control :=edID_PROM_ASOC;
      Objeto.PromAsoc.Persona.Nombre.Control :=edNOM_PROM_ASOC;
      Objeto.PromAsoc.GetParams(Objeto);
      edNOM_PROM_ASOC.Hint := Objeto.PromAsoc.Persona.Nombre.AsString;
      edNOM_PROM_ASOC.ShowHint := True;

      Objeto.PromAdmon.ID_Persona.Control :=edID_PROM_ADM;
      Objeto.PromAdmon.Persona.Nombre.Control :=edNOM_PROM_ADM;
      Objeto.PromAdmon.GetParams(Objeto);
      edNOM_PROM_ADM.Hint := Objeto.PromAdmon.Persona.Nombre.AsString;
      edNOM_PROM_ADM.ShowHint := True;

   End;

   stpInicio.DateTime:= DameFinMes(Objeto.Apli.DameFechaEmpresaDia('D000'));
   edFIni.text:=FormatDateTime('dd/mm/yyyy',stpInicio.DateTime);
   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;
end;

procedure TwMEdoCtaDD.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CrCredito.ID_CREDITO.Control := Nil;
      CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := Nil;
      Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= Nil;
      Objeto.GpoProd.DESC_C_PROD_GPO.Control:= Nil;
      Objeto.Producto.CVE_PRODUCTO_CRE.Control := Nil;
      Objeto.Producto.DESC_C_PRODUCTO.Control := Nil;
      Objeto.Acreditado.ID_ACREDITADO.Control := nil;
      Objeto.Acreditado.Persona.Nombre.Control := nil;
      Objeto.Proveedor.ID_ACREDITADO.Control := nil;
      Objeto.Proveedor.Persona.Nombre.Control := nil;
      Objeto.PromAsoc.Persona.Nombre.Control :=nil;
      Objeto.PromAsoc.Id_Persona.Control :=nil;
      Objeto.PromAdmon.Persona.Nombre.Control :=nil;
      Objeto.PromAdmon.Id_Persona.Control :=nil;
      Objeto.Empresa.ID_Empresa.Control := Nil;
      Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
      Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
      Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
   End;
end;

procedure TwMEdoCtaDD.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMEdoCtaDD.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TwMEdoCtaDD.ImprimeReporte(bPreview : Boolean; grOpcion  : TGenRepOption );
Var
   vlOrdena,
   sSituacion: String;
   VLMsg     : String;
   vlFcorte  : String;
begin
   If rgSituacion.ItemIndex = 0 Then
      sSituacion:= '0'
   Else If rgSituacion.ItemIndex = 1 Then
      sSituacion:= '1'
   Else If rgSituacion.ItemIndex = 2 Then
      sSituacion:= '2';
//////////////////// ASTECI LIEF 22/09/09 INICIO ///////////////////////////////
// Se introdice el siguiente bloque de decisión para definir el tipo de filtrado
// a usar (por nombre o por Código Postal)
   if rgOrdendo.ItemIndex = 0 then
     vlOrdena := '0'
   else
     vlOrdena := '1';

//   VLMsg :=
//   RepEdoCtaDD(edDisposicion.Text     , edFIni.Text            ,
//               edCVE_PRODUCTO_GPO.Text, edCVE_PRODUCTO_CRE.Text, sSituacion,
//               edACREDITADO.Text      , edPROVEEDOR.Text,
//               edID_PROM_ASOC.Text    , edID_PROM_ADM.Text,
//               EdIdEmpresa.Text, EdIDSucursal.Text,
//               Objeto.Apli, bPreview, grOpcion, '', vlOrdena
//              );
//////////////////// ASTECI  LIEF 29/09/09 FINAL ///////////////////////////////
// Se  comenta la sentencia de arriba y se introdice el siguiente bloque de
// decisión para definir el tipo de reporte a usar (descuento de documento o
// mercantil)
   if rgTipoCta.ItemIndex = 0 then
   begin
//////////////////// ASTECI  LIEF 29/09/09 FINAL ///////////////////////////////
     VLMsg :=
     RepEdoCtaDD(edDisposicion.Text     , edFIni.Text            ,
                 edCVE_PRODUCTO_GPO.Text, edCVE_PRODUCTO_CRE.Text, sSituacion,
                 edACREDITADO.Text      , edPROVEEDOR.Text,
                 edID_PROM_ASOC.Text    , edID_PROM_ADM.Text,
                 EdIdEmpresa.Text, EdIDSucursal.Text,
                 Objeto.Apli, bPreview, grOpcion, '', vlOrdena
                );
//////////////////// ASTECI  LIEF 29/09/09 FINAL ///////////////////////////////
// Se introdice el siguiente bloque de decisión para definir el tipo de reporte
// a usar (descuento de documento o mercantil)
   end
   else
   begin
     VLMsg :=
     RepEdoCtaDM(edDisposicion.Text     , edFIni.Text            ,
                 edCVE_PRODUCTO_GPO.Text, edCVE_PRODUCTO_CRE.Text, sSituacion,
                 edACREDITADO.Text      , edPROVEEDOR.Text,
                 edID_PROM_ASOC.Text    , edID_PROM_ADM.Text,
                 EdIdEmpresa.Text, EdIDSucursal.Text,
                 Objeto.Apli, bPreview, grOpcion, '', vlOrdena
                );
   end;
//////////////////// ASTECI  LIEF 29/09/09 FINAL ///////////////////////////////
End;

procedure TwMEdoCtaDD.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMEDOCTADD_IMPRI',True,True) then
      ImprimeReporte(False, grPrint );
end;

procedure TwMEdoCtaDD.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMEDOCTADD_PREVI',True,True) then
      ImprimeReporte(True, grPreview );
end;

procedure TwMEdoCtaDD.ilDisposicionCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMEdoCtaDD.ilDisposicionEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ilDisposicion.Buffer]) Then Begin
      cbxDisposicion.Checked:=True;
      cbxDisposicion.Enabled:=True;
     
      InterForma1.NextTab(edDisposicion);
   End;
end;

procedure TwMEdoCtaDD.btDisposicionClick(Sender: TObject);
begin
   With Objeto Do Begin
      CrCredito.ShowAll := True;
      If CrCredito.Busca then Begin
         cbxDisposicion.Checked:= True;
         cbxDisposicion.Enabled:= True;
        
         InterForma1.NextTab(edDisposicion);
      End;
   End;
end;

procedure TwMEdoCtaDD.cbxDisposicionClick(Sender: TObject);
begin
   EnableCheckBox(cbxDisposicion);
   Objeto.CrCredito.Active := cbxDisposicion.Checked;
end;

procedure TwMEdoCtaDD.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   With Objeto Do Begin
      GpoProd.ShowAll := True;
      If GpoProd.Busca Then Begin
         cbxCVE_PRODUCTO_GPO.Checked:= True;
         cbxCVE_PRODUCTO_GPO.Enabled:= True;
         InterForma1.NextTab(edCVE_PRODUCTO_GPO);
      End;
   End;
end;

procedure TwMEdoCtaDD.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   EnableCheckBox(cbxCVE_PRODUCTO_GPO);
   Objeto.GpoProd.Active := cbxCVE_PRODUCTO_GPO.Checked;
end;

procedure TwMEdoCtaDD.btCREDITO_FINClick(Sender: TObject);
begin
    Objeto.Producto.BuscaWhereString:= ' CR_PRODUCTO.SIT_PRODUCTO ='
                                     + #39 + 'AC' + #39 ;
    Objeto.Producto.FilterString := Objeto.Producto.BuscaWhereString;
    Objeto.Producto.ShowAll := True;
    if Objeto.Producto.Busca Then Begin
        chbxProducto.Checked:= True;
        chbxProducto.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    end;
end;

procedure TwMEdoCtaDD.chbxProductoClick(Sender: TObject);
begin
   EnableCheckBox(chbxProducto);
   Objeto.Producto.Active := chbxProducto.Checked;
end;

procedure TwMEdoCtaDD.ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMEdoCtaDD.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMEdoCtaDD.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      cbxCVE_PRODUCTO_GPO.Checked:=True;
      cbxCVE_PRODUCTO_GPO.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMEdoCtaDD.ilPRODUCTOEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
      chbxProducto.Checked:=True;
      chbxProducto.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

procedure TwMEdoCtaDD.edFFinExit(Sender: TObject);
begin
   edFIni.text := DateTimeToStr(DameFinMes(stpInicio.DateTime));
end;

procedure TwMEdoCtaDD.stpInicioExit(Sender: TObject);
begin
   edFIni.SetFocus;
end;

procedure TwMEdoCtaDD.sgcDATAMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   edFIni.text := DateTimeToStr(DameFinMes(stpInicio.DateTime));
end;

procedure TwMEdoCtaDD.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMEdoCtaDD.chbxAcreditadoClick(Sender: TObject);
begin
   EnableCheckBox(chbxAcreditado);
   Objeto.Acreditado.Active := chbxAcreditado.Checked;
end;

procedure TwMEdoCtaDD.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMEdoCtaDD.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMEdoCtaDD.btPROVEEDORClick(Sender: TObject);
begin
    Objeto.Proveedor.ShowAll := True;
    If Objeto.Proveedor.Busca Then Begin
        chbxProveedor.Checked:=True;
        chbxProveedor.Enabled:=True;
        InterForma1.NextTab(edPROVEEDOR);
    End;
end;

procedure TwMEdoCtaDD.ilPROVEEDOREjecuta(Sender: TObject);
begin
    If Objeto.Proveedor.FindKey([ilPROVEEDOR.Buffer]) Then Begin
        chbxProveedor.Checked:=True;
        chbxProveedor.Enabled:=True;
        InterForma1.NextTab(edPROVEEDOR);
    End;
end;

procedure TwMEdoCtaDD.ilPROVEEDORCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMEdoCtaDD.ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMEdoCtaDD.btPROM_ADMONClick(Sender: TObject);
begin
    Objeto.PromAdmon.ShowAll := True;
    If Objeto.PromAdmon.Busca Then Begin
        chbxPromAdm.Checked:=True;
        chbxPromAdm.Enabled:=True;
        InterForma1.NextTab(edID_PROM_ADM);
    End;
end;

procedure TwMEdoCtaDD.ilPromAdmonEjecuta(Sender: TObject);
begin
    If Objeto.PromAdmon.FindKey([ilPromAdmon.Buffer]) Then Begin
        chbxPromAdm.Checked:=True;
        chbxPromAdm.Enabled:=True;
        InterForma1.NextTab(edID_PROM_ADM);
    End;
end;

procedure TwMEdoCtaDD.chbxPromAdmClick(Sender: TObject);
begin
   EnableCheckBox(chbxPromAdm);
   Objeto.PromAdmon.Active := chbxPromAdm.Checked;
end;

procedure TwMEdoCtaDD.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMEdoCtaDD.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMEdoCtaDD.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMEdoCtaDD.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMEdoCtaDD.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

// </ICASE JMML 08/Septiembre/2006>   Nuevo procedimiento
procedure TwMEdoCtaDD.HabilitaCtrls;
begin
    btCVE_PRODUCTO_GPO.Enabled := True;
    btCREDITO_FIN.Enabled := True;
    btDisposicion.Enabled := True;
    btPROM_ASOC.Enabled := True;
    btPROM_ADMON.Enabled := True;
    rgSituacion.Enabled := True;
end;

// </ICASE JMML 08/Septiembre/2006>   Nuevo procedimiento
procedure TwMEdoCtaDD.InhabilitaCtrls;
begin
    If cbxCVE_PRODUCTO_GPO.Checked Then
        cbxCVE_PRODUCTO_GPO.Checked := False;
    If chbxProducto.Checked Then
        chbxProducto.Checked := False;
    If cbxDisposicion.Checked Then
        cbxDisposicion.Checked := False;
    If chbxPromAsoc.Checked Then
        chbxPromAsoc.Checked := False;
    If chbxPromAdm.Checked Then
        chbxPromAdm.Checked := False;

    btCVE_PRODUCTO_GPO.Enabled := False;
    btCREDITO_FIN.Enabled := False;
    btDisposicion.Enabled := False;
    btPROM_ASOC.Enabled := False;
    btPROM_ADMON.Enabled := False;

    rgSituacion.Enabled := False;
    rgSituacion.ItemIndex := 2
end;

procedure TwMEdoCtaDD.chbxPromAsocClick(Sender: TObject);
begin
   EnableCheckBox(chbxPromAsoc);
   Objeto.PromAsoc.Active := chbxPromAsoc.Checked;
end;

procedure TwMEdoCtaDD.btPROM_ASOCClick(Sender: TObject);
begin
    Objeto.PromAsoc.ShowAll := True;
    If Objeto.PromAsoc.Busca Then Begin
        chbxPromAsoc.Checked:=True;
        chbxPromAsoc.Enabled:=True;
        InterForma1.NextTab(edID_PROM_ASOC);
    End;
end;

procedure TwMEdoCtaDD.edPROVEEDORChange(Sender: TObject);
begin
    Objeto.Proveedor.ShowAll := True;
    If Objeto.Proveedor.Busca Then Begin
        chbxProveedor.Checked:=True;
        chbxProveedor.Enabled:=True;
        InterForma1.NextTab(edPROVEEDOR);
    End;
end;

procedure TwMEdoCtaDD.ilPromAsocEjecuta(Sender: TObject);
begin
    If Objeto.PromAsoc.FindKey([ilPROVEEDOR.Buffer]) Then Begin
        chbxPromAsoc.Checked:=True;
        chbxPromAsoc.Enabled:=True;
        InterForma1.NextTab(edPROVEEDOR);
    End;
end;

procedure TwMEdoCtaDD.ilPromAsocCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMEdoCtaDD.chbxProveedorClick(Sender: TObject);
begin
   EnableCheckBox(chbxProveedor);
   Objeto.Proveedor.Active := chbxProveedor.Checked;
end;

procedure TwMEdoCtaDD.edID_PROM_ASOCChange(Sender: TObject);
begin
    Objeto.PromAsoc.ShowAll := True;
    If Objeto.PromAsoc.Busca Then Begin
        chbxPromAsoc.Checked:=True;
        chbxPromAsoc.Enabled:=True;
        InterForma1.NextTab(edID_PROM_ASOC);
    End;
end;

procedure TwMEdoCtaDD.stpInicioChange(Sender: TObject);
begin
   edFIni.text := DateTimeToStr(DameFinMes(stpInicio.DateTime));
end;

procedure TwMEdoCtaDD.edFIniChange(Sender: TObject);
begin

   edFIni.text:=FormatDateTime('dd/mm/yyyy',DameFinMes(stpInicio.DateTime));
end;

end.
