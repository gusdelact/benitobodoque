// Sistema         : Clase de CrMQCoIm
// Fecha de Inicio : 18/09/2009
// Función forma   : Clase de CrMQCoIm
// Desarrollo por  : MACV. Class Maker.                                                            
// Diseñado por    : AARJ 21 Sept 2009.
// Comentarios     : Forma para implementar el Reporte de Consolidado de Impagados                  
Unit IntCrMQCoIm;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,


// Unidades Adicionales  para la implementación de los controles de captura   #1
IntMon,           //Moneda
IntMPers,         //PromotorAsoc  y Promotor Administración
IntEmple,
IntCrAcredit,     //Acreditado
IntCrCredito,     //Disposición
IntCrImpDire,     //Direcciones
Intempre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc

// Unidad Adicional para invocar el quick report
IntMQrConsImpa,   // Reporte,

IntCrProduct,     //Producto de crédito
IntMProdGpo,      //Grupo Producto

// Unidades Adicionales para implementar barra de estus y seguridad al pie de la forma
IntParamCre,
IntGenCre;


Type
 TCrMQCoIm= class; 

  TWCrMQCoIm=Class(TForm)
    InterForma1 : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edCVE_MONEDA: TEdit;
    lbCVE_MONEDA: TLabel;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    ilMONEDA: TInterLinkit;
    chbxMoneda: TCheckBox;
    lbAplica: TLabel;
    lbID_PROMOTOR: TLabel;
    edID_PROMOTOR: TEdit;
    btPROMOTOR: TBitBtn;
    edNOM_PROMOTOR: TEdit;
    ilPROMOTOR: TInterLinkit;
    chbxPromotor: TCheckBox;
    Label7: TLabel;
    edID_PROM: TEdit;
    btPROM_ADMON: TBitBtn;
    edNOM_PROM: TEdit;
    ilPromAdmon: TInterLinkit;
    chbxPromAmon: TCheckBox;
    lbCVE_DIRECCION: TLabel;
    edCVE_DIRECCION: TEdit;
    edID_DIRECTOR: TEdit;
    rgOrden: TRadioGroup;
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
    lbF_CORTE: TLabel;
    edF_CORTE: TEdit;
    dtpF_CORTE: TInterDateTimePicker;
    chbxF_CORTE: TCheckBox;
    Label5: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    SaveDialog1: TSaveDialog;
    cbxArchivo: TCheckBox;
    edDESC_DIRECCION: TEdit;
    cbDIRECCION: TCheckBox;
    bbDIRECCION: TBitBtn;
    lbID_Region: TLabel;
    bbPOBLACION: TBitBtn;
    edCVE_POBLACION: TEdit;
    edDESC_POBLACION: TEdit;
    cbPOBLACION: TCheckBox;
    ilDIRECCION: TInterLinkit;
    lbCVE_PRODUCTO_CRE: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    chbxProducto: TCheckBox;
    Label1: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edNOM_CVE_PRODUCTO_GPO: TEdit;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    ilPRODUCTO: TInterLinkit;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    Label2: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    chbxAcreditado: TCheckBox;
    Label3: TLabel;
    edID_CESION: TEdit;
    btID_CESION: TBitBtn;
    edCESION: TEdit;
    chbxCESION: TCheckBox;
    ilCesion: TInterLinkit;
    rgRegion: TRadioGroup;
    rdAgrupacion: TRadioGroup;
    rgTIP_RECUPERA: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure edID_PROMOTORChange(Sender: TObject);
    procedure edID_PROMOTORExit(Sender: TObject);
    procedure btPROMOTORClick(Sender: TObject);
    procedure chbxPromotorClick(Sender: TObject);
    procedure ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROMOTOREjecuta(Sender: TObject);
    procedure edID_PROMChange(Sender: TObject);
    procedure edID_PROMExit(Sender: TObject);
    procedure btPROM_ADMONClick(Sender: TObject);
    procedure ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
    procedure ilPromAdmonEjecuta(Sender: TObject);
    procedure chbxPromAmonClick(Sender: TObject);

    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure edF_CORTEChange(Sender: TObject);
    procedure chbxF_CORTEClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edCVE_DIRECCIONExit(Sender: TObject);
    procedure bbDIRECCIONClick(Sender: TObject);
    procedure cbDIRECCIONClick(Sender: TObject);
    procedure ilDIRECCIONEjecuta(Sender: TObject);
    procedure ilDIRECCIONCapture(Sender: TObject; var Show: Boolean);
    procedure bbPOBLACIONClick(Sender: TObject);
    procedure cbPOBLACIONClick(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
      var Show: Boolean);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    private 
    { Private declarations }
        Procedure ImprimeReporte(bPreview:Boolean);
        Procedure AsignaEmpresaSuc;
    public
    { Public declarations } 
    Objeto : TCrMQCoIm;
end;
 TCrMQCoIm= class(TInterFrame)
      private
      protected

      public
        { Public declarations }
        //Codigo autogenerado por Class Maker: CAMPO1   : TInterCampo;
        //Clases Adicionales    # 2
        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;
        Promotor                 : TEmpleado;  //Promotor Responsable
        PromotorAdmon            : TEmpleado;  //Promotor Administración
        Direccion                : TCrImpDire; //Dirección
        Producto                 : TCrProduct;
        GpoProd                  : TMProdGpo;
        Acreditado               : TCrAcredit;
        Credito                  : TCrCredito;//Disposición


        UnidadNegocio            : TUnNegocio; //Sucursal
        Empresa                  : TEmpresa;   //Empresa

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


constructor TCrMQCoIm.Create( AOwner : TComponent );
begin Inherited;
      // Codigo autogenerado por Class Maker:
      // CAMPO1 :=CreaCampo('CAMPO1',ftString,tsNinguno,tsNinguno,False);
      // CAMPO1.Caption:='Campo1';
      // CAMPO1.Parametro:='CAMPO1';

      // #3
      // Dirección
      Direccion :=  TCrImpDire.Create(Self);
      Direccion.MasterSource:=Self;
      Direccion.FieldByName('CVE_DIRECCION').MasterField   :='CVE_DIRECCION';
      // Moneda
      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';
      // Promotor Asociado
      Promotor := TEmpleado.Create(Self);
      Promotor.FilterBy := fbTMPersonaEmpleado;
      Promotor.MasterSource := Self;
      Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
      Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';
      // Promotor Administrador
      PromotorAdmon := TEmpleado.Create(Self);
      PromotorAdmon.FilterBy := fbTMPersonaEmpleado;
      PromotorAdmon.MasterSource := Self;
      PromotorAdmon.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
      PromotorAdmon.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='CVE_PRODUCTO_CRE';

      GpoProd:= TMProdGpo.Create(Self);
      GpoProd.MasterSource:=Self;
      GpoProd.FieldByName('CVE_PRODUCTO_GPO').MasterField:='CVE_PRODUCTO_GPO';

      // Empresa
      Empresa := TEmpresa.Create(Self);
      // Sucursal
      UnidadNegocio := TUnNegocio.Create(Self);
      //
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrMQCoIm.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrMQCoIm.Destroy;
begin

   // #4
   if Direccion <> nil then
      Direccion.Free;
   if Moneda <> nil then
      Moneda.Free;
   if Promotor <> nil then
      Promotor.Free;
   if PromotorAdmon <> nil then
      PromotorAdmon.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   if Producto <> nil then
      Producto.Free;
   If GpoProd <> Nil Then
      GpoProd.Free;
   If Acreditado <> Nil Then
      Acreditado.Free;
   If Credito <> Nil Then
      Credito.Free;



   inherited;

end;


function TCrMQCoIm.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMQCoIm;
begin
   W:=TWCrMQCoIm.Create(Self);
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


Function TCrMQCoIm.InternalBusca:Boolean;
Var T:TInterFindit;
begin  InternalBusca := False;

    // Codigo autogenerado por Class Maker:
    // Verificar si puede quedar como se encuentra implementado en IntMProgVen

    T := CreaBuscador('ICrMQCoI.it','');
    Try
      if Active then
        begin
        end;
      if T.Execute then
        InternalBusca := FindKey([]);
    finally
      T.Free;
    end;
end;

function TCrMQCoIm.Reporte:Boolean; 
begin
//Execute_Reporte(); 
end;


(***********************************************FORMA CrMQCoIm********************)
(*                                                                              *)
(*  FORMA DE CrMQCoIm                                                            *)
(*                                                                              *)
(***********************************************FORMA CrMQCoIm********************)

procedure TWCrMQCoIm.FormShow(Sender: TObject);
begin
      //Pinta los datos del panel inferior
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      // Codigo autogenerado por el Class Maker
      // Objeto.CAMPO1.Control:=edCAMPO1;

      // #5
      // Dirección
      Objeto.Direccion.CVE_DIRECCION.Control := edCVE_DIRECCION;
      Objeto.Direccion.DESC_DIRECCION.Control := edDESC_DIRECCION;
      Objeto.Direccion.ID_DIRECTOR.Control := edID_DIRECTOR;
      Objeto.Direccion.GetParams(Objeto);
      // Moneda
      Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);
      edDESC_MONEDA.Hint := Objeto.Moneda.Desc_Moneda.AsString;
      edDESC_MONEDA.ShowHint := True;
      // Promotor Asociado
      Objeto.Promotor.ID_Persona.Control :=edID_PROMOTOR;
      Objeto.Promotor.Persona.Nombre.Control :=edNOM_PROMOTOR;
      Objeto.Promotor.GetParams(Objeto);
      edNOM_PROMOTOR.Hint := Objeto.Promotor.Persona.Nombre.AsString;
      edNOM_PROMOTOR.ShowHint := True;
      // Promotor Administración
      Objeto.PromotorAdmon.ID_Persona.Control :=edID_PROM;
      Objeto.PromotorAdmon.Persona.Nombre.Control :=edNOM_PROM;
      Objeto.PromotorAdmon.GetParams(Objeto);
      edNOM_PROM.Hint := Objeto.PromotorAdmon.Persona.Nombre.AsString;
      edNOM_PROM.ShowHint := True;


      Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;
      Objeto.Producto.GetParams(Objeto);
      edDESC_PRODUCTO1.Hint := Objeto.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO1.ShowHint := True;

      Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
      Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
      Objeto.GpoProd.GetParams(Objeto);

      Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.Acreditado.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      Objeto.Credito.ID_CREDITO.Control := edID_CESION;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
      Objeto.Credito.GetParams(Objeto);
      edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edCESION.ShowHint := True;

      // Empresa
      Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
      Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      Objeto.Empresa.GetParams(Objeto);
      // Sucursal
      Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
      Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
      Objeto.UnidadNegocio.GetParams(Objeto);
      //
      AsignaEmpresaSuc;

      dtpF_CORTE.DateTime := Objeto.Apli.DameFechaEmpresa;
      edF_CORTE.text := FormatDateTime('dd/mm/yyyy',dtpF_CORTE.DateTime);
end;

procedure TWCrMQCoIm.FormDestroy(Sender: TObject);
begin
// #6
    // Codigo autogenerado por el Class Maker:
    // Objeto.CAMPO1.Control:=nil;

    // Dirección
    Objeto.Direccion.CVE_DIRECCION.Control := nil;
    Objeto.Direccion.DESC_DIRECCION.Control := nil;
    // Moneda
    Objeto.Moneda.Cve_Moneda.Control := nil;
    Objeto.Moneda.Desc_Moneda.Control := nil;
    // Promotor
    Objeto.Promotor.Persona.Nombre.Control :=nil;
    Objeto.Promotor.Id_Persona.Control :=nil;
    // Promotor Administración
    Objeto.PromotorAdmon.Persona.Nombre.Control :=nil;
    Objeto.PromotorAdmon.Id_Persona.Control :=nil;

    Objeto.Producto.CVE_PRODUCTO_CRE.Control := nil;
    Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
    
    Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= nil;
    Objeto.GpoProd.DESC_C_PROD_GPO.Control:= nil;

    Objeto.Acreditado.ID_ACREDITADO.Control := nil;
    Objeto.Acreditado.Persona.Nombre.Control := nil;

    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
    Objeto.Credito.ID_CREDITO.Control := nil;

    // Empresa
    Objeto.Empresa.ID_Empresa.Control := Nil;
    Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
    // Sucursal
    Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
    Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;

end;

procedure TWCrMQCoIm.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMQCoIm.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrMQCoIm.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrMQCoIm.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;



(*********************************************************************************)
(*   Bloque para implementar el campo de captura :     MONEDA                    *)
(*********************************************************************************)

procedure TWCrMQCoIm.edCVE_MONEDAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
end;

procedure TWCrMQCoIm.btCVE_MONEDAClick(Sender: TObject);
begin
//
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWCrMQCoIm.chbxMonedaClick(Sender: TObject);
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

procedure TWCrMQCoIm.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
        Show := True;
end;

procedure TWCrMQCoIm.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

(*********************************************************************************)
(*   Bloque para implementar el campo de captura :     PROMOTOR ASOCIADO         *)
(*********************************************************************************)
procedure TWCrMQCoIm.edID_PROMOTORChange(Sender: TObject);
begin
// copy: 1
    If Trim(edID_PROMOTOR.Text)<>'' Then
      Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        edID_PROM.Enabled:=False;
        btPROM_ADMON.Enabled:=False;
      End
    Else
      Begin
        chbxPromotor.Checked:=False;
        chbxPromotor.Enabled:=False;
        edID_PROM.Enabled:=True;
        btPROM_ADMON.Enabled:=True;
      End;
end;

procedure TWCrMQCoIm.edID_PROMOTORExit(Sender: TObject);
begin
// copy: 2
      InterForma1.ValidaExit(edID_PROMOTOR,True,'',True);
end;

procedure TWCrMQCoIm.btPROMOTORClick(Sender: TObject);
begin
// copy: 3
    Objeto.Promotor.ShowAll := True;
    If Objeto.Promotor.Busca Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TWCrMQCoIm.chbxPromotorClick(Sender: TObject);
begin
// copy: 4
    If not chbxPromotor.Checked Then Begin
        Objeto.Promotor.Active:=False;
        chbxPromotor.Checked:=False;
        chbxPromotor.Enabled:=False;
    End Else Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
    End;
end;

procedure TWCrMQCoIm.ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
begin
// copy: 5
        Show:=True;
end;

procedure TWCrMQCoIm.ilPROMOTOREjecuta(Sender: TObject);
begin
// copy: 6
    If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;

end;

(*********************************************************************************)
(*   Bloque para implementar el campo de captura :     PROMOTOR ADMINISTRADOR    *)
(*********************************************************************************)

procedure TWCrMQCoIm.edID_PROMChange(Sender: TObject);
begin
    // copy:1
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

procedure TWCrMQCoIm.edID_PROMExit(Sender: TObject);
begin
// copy:2
      InterForma1.ValidaExit(edID_PROM,True,'',True);
end;

procedure TWCrMQCoIm.btPROM_ADMONClick(Sender: TObject);
begin
// copy:3
    Objeto.PromotorAdmon.ShowAll := True;
    If Objeto.PromotorAdmon.Busca Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TWCrMQCoIm.ilPromAdmonCapture(Sender: TObject;
  var Show: Boolean);
begin
// copy:4
   Show:=True;
end;

procedure TWCrMQCoIm.ilPromAdmonEjecuta(Sender: TObject);
begin
// copy:5
    If Objeto.PromotorAdmon.FindKey([ilPromAdmon.Buffer]) Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TWCrMQCoIm.chbxPromAmonClick(Sender: TObject);
begin
// copy:6
    If not chbxPromAmon.Checked Then Begin
        Objeto.PromotorAdmon.Active:=False;
        chbxPromAmon.Checked:=False;
        chbxPromAmon.Enabled:=False;
    End Else Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
    End;
end;


(*********************************************************************************)
(*   Bloque para implementar el campo de captura :   EMPRESA                     *)
(*********************************************************************************)

procedure TWCrMQCoIm.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TWCrMQCoIm.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;


(*********************************************************************************)
(*   Bloque para implementar el campo de captura :   SUCURSAL                    *)
(*********************************************************************************)

procedure TWCrMQCoIm.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWCrMQCoIm.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;

end;

procedure TWCrMQCoIm.CBSucursalClick(Sender: TObject);
begin
    If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

(*********************************************************************************)
(*   Bloque para implementar funcionalidad en los controles de entrada:          *)
(*                                                                               *)
(*                           EMPRESA Y SUCURSAL                                  *)
(*********************************************************************************)
procedure TWCrMQCoIm.AsignaEmpresaSuc;
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

procedure TWCrMQCoIm.edF_CORTEChange(Sender: TObject);
begin
    If Trim(edF_CORTE.Text)<>'' Then Begin
        chbxF_CORTE.Checked:=True;
        chbxF_CORTE.Enabled:=True;
    End Else Begin
        chbxF_CORTE.Checked:=False;
        chbxF_CORTE.Enabled:=False;
    End;
end;

procedure TWCrMQCoIm.chbxF_CORTEClick(Sender: TObject);
begin
    If not chbxF_CORTE.Checked Then Begin
        edF_CORTE.Text:='';
        chbxF_CORTE.Checked:=False;
        chbxF_CORTE.Enabled:=False;
    End;
end;

procedure TWCrMQCoIm.ImprimeReporte(bPreview: Boolean);
Var

    //RLUMBRERAS LATBC 8/02/2011 (Se agrgegan variables para reporte de recuperados)
    sTipRecu:String;
    iTipRecu:Integer;
   //------------------------------------------------
    sOrden      :String;  // para el ordenamiento de los registros
    sSituacion  :String;  // Situación de la Programación : Impagada + Vencida Exigible
    iSit        :Integer; // para trabajar con el radio group
begin
     //RLUMBRERAS LATBC 8/02/2011 (Se agrgegan para reporte de recuperados)
       iTipRecu := rgTIP_RECUPERA.ItemIndex;
   case iTipRecu of
        0: sTipRecu := '0';
        1: sTipRecu := '1';
        2: sTipRecu := '2';
   end;
   //------------------------------------------------

    sSituacion:='IV';  //Impagada + Vencida Exigible

    // indica el ordenamiento de los registros presentados en el reporte
    iSit:=rgOrden.ItemIndex;
    case iSit of
        0: sOrden:='D'; //Disposicion
        1: sOrden:='C'; //Cliente Acreditado
        2: sOrden:='P'; //Promotor Asociado
        3: sOrden:='A'; //Promotor Administrador
    end;


    if (Trim(edF_CORTE.Text)='')  then
       ShowMessage('Debe indicar la fecha de vencimiento ...')
    else
    begin
     //if sFecRep <> 'C' then
     //begin
         RepConsImpa(edF_CORTE.Text {=sF_Vencimiento}    ,
                     edCVE_DIRECCION.Text, edID_DIRECTOR.Text, edCVE_POBLACION.Text ,
                     edID_PROMOTOR.Text , edID_PROM.Text    , edCVE_MONEDA.Text  , sSituacion ,
                     sOrden             , edCVE_PRODUCTO_CRE.Text, edCVE_PRODUCTO_GPO.Text,
                     EdIdEmpresa.Text  , EdIDSucursal.Text  ,  edACREDITADO.Text,   edID_CESION.Text, IntToStr(rdAgrupacion.ItemIndex), IntToStr(rgRegion.ItemIndex),
                     edNbrArch.Text
    //RLUMBRERAS LATBC 8/02/2011 (Se agrgegan variables para reporte de recuperados)
                     ,sTipRecu
    //-----------------------------------------------------------------------------
                     , bPreview , Objeto.Apli );
                   //sTipoProd          ,

         if Trim(edNbrArch.Text)<>'' then
         begin
            // bGenArch : variable que se encuentra en la unidad IntMQrConsImpa y ahi se
            // le asigna un valor booleano para desplegar el siguiente mensaje
            if  bGenArch then
              ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
            else
              ShowMessage('No se generó el Archivo')
         end;
     //end;
    end;


end;

procedure TWCrMQCoIm.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRMQCOIM_IMPRI',True,True) then
      ImprimeReporte(False);
end;

procedure TWCrMQCoIm.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRMQCOIM_PREVI',True,True) then
     ImprimeReporte(True);
end;

procedure TWCrMQCoIm.sbExcelClick(Sender: TObject);
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

procedure TWCrMQCoIm.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TWCrMQCoIm.cbxArchivoClick(Sender: TObject);
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

procedure TWCrMQCoIm.edCVE_DIRECCIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_DIRECCION,True,'',True);
end;

procedure TWCrMQCoIm.bbDIRECCIONClick(Sender: TObject);
begin
   Objeto.Direccion.ShowAll := True;
   if Objeto.Direccion.Busca then Begin
        cbDIRECCION.Checked:= True;
        cbDIRECCION.Enabled:= True;
        InterForma1.NextTab(edCVE_DIRECCION);
   End;



end;

procedure TWCrMQCoIm.cbDIRECCIONClick(Sender: TObject);
begin
  If not cbDIRECCION.Checked Then
    Begin
        Objeto.Direccion.Active:=False;
        cbDIRECCION.Checked:= False;
        cbDIRECCION.Enabled:= False;
    End
  Else
    Begin
        cbDIRECCION.Checked:= True;
        cbDIRECCION.Enabled:= True;
    End;
end;

procedure TWCrMQCoIm.ilDIRECCIONEjecuta(Sender: TObject);
begin
    If Objeto.Direccion.FindKey([ilDIRECCION.Buffer]) Then Begin
        cbDIRECCION.Checked:=True;
        cbDIRECCION.Enabled:=True;
        InterForma1.NextTab(edCVE_DIRECCION);
    End;
end;

procedure TWCrMQCoIm.ilDIRECCIONCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrMQCoIm.bbPOBLACIONClick(Sender: TObject);
Var   T:TInterFindit;
begin T := Objeto.CreaBuscador('CRIMPPOB.IT','S,S');
      Try
         if T.Execute then
         begin
              edCVE_POBLACION.Text := T.DameCampo(0);
              edDESC_POBLACION.Text := T.DameCampo(1);
              cbPOBLACION.Checked:=True;
              cbPOBLACION.Enabled:=True;
         end
         else
         begin
              edCVE_POBLACION.Text := ' ';
              edDESC_POBLACION.Text := ' ';
         end;
      finally  T.Free;
      end;
end;

procedure TWCrMQCoIm.cbPOBLACIONClick(Sender: TObject);
begin
    If not cbPOBLACION.Checked Then Begin
        edCVE_POBLACION.Text := ' ';
        edDESC_POBLACION.Text := ' ';
        cbPOBLACION.Checked:=False;
        cbPOBLACION.Enabled:=False;
    End Else Begin
        cbPOBLACION.Checked:=True;
        cbPOBLACION.Enabled:=True;
    End;
end;

procedure TWCrMQCoIm.btPRODUCTOClick(Sender: TObject);
begin
    Objeto.Producto.ShowAll := True;
    if Objeto.Producto.Busca Then Begin
        chbxProducto.Checked:= True;
        chbxProducto.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    end;
end;

procedure TWCrMQCoIm.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TWCrMQCoIm.ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrMQCoIm.ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrMQCoIm.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TWCrMQCoIm.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TWCrMQCoIm.chbxProductoClick(Sender: TObject);
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

procedure TWCrMQCoIm.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   If not cbxCVE_PRODUCTO_GPO.Checked Then Begin
      Objeto.GpoProd.Active:=False;
      cbxCVE_PRODUCTO_GPO.Checked:=False;
      cbxCVE_PRODUCTO_GPO.Enabled:=False;
   End Else Begin
      cbxCVE_PRODUCTO_GPO.Checked:=True;
      cbxCVE_PRODUCTO_GPO.Enabled:=True;
   End;
end;

procedure TWCrMQCoIm.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TWCrMQCoIm.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrMQCoIm.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TWCrMQCoIm.chbxAcreditadoClick(Sender: TObject);
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

procedure TWCrMQCoIm.btID_CESIONClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TWCrMQCoIm.ilCesionCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TWCrMQCoIm.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TWCrMQCoIm.chbxCESIONClick(Sender: TObject);
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

end.
