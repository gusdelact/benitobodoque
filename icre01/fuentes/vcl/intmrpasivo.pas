// Sistema         : Clase de MrPasivo
// Fecha de Inicio : 11/05/2012
// Función forma   : Clase de MrPasivo
// Diseñado por    : Juan Francisco Ortega Flores
// Comentarios     :
Unit IntMrPasivo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntParamCre, InterEdit, IntLinkit,

IntCrProduct,     //Producto de crédito
IntMon,           //Moneda
IntMInstDesc,     //Insitución
IntMPrgApoyo,     //Programa de Apoyo
Intempre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntMQrCaPas,      //REPORTE DE CARTERA PASIVA
IntMProdGpo,      //Grupo Producto
IntCrCredito,     //Disposición
IntCrOrigRec      //Origen de Recursos
;
                      

Type
 TMrpasivo= class; 

  TWMrpasivo=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox2: TGroupBox;
    lbCVE_PRODUCTO_CRE: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    chbxProducto: TCheckBox;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    chbxMoneda: TCheckBox;
    Label8: TLabel;
    edCVE_FND_ENT_DES: TEdit;
    btCVE_FND_ENT_DES: TBitBtn;
    edNOM_FND_ENT_DES: TEdit;
    cbxCVE_FND_ENT_DES: TCheckBox;
    Label9: TLabel;
    edCVE_FND_PROGRAMA: TEdit;
    btCVE_FND_PROGRAMA: TBitBtn;
    edNOM_FND_PROGRAMA: TEdit;
    cbxCVE_FND_PROGRAMA: TCheckBox;
    RadioGroup1: TRadioGroup;
    RbAct: TRadioButton;
    RbCanc: TRadioButton;
    RbTod: TRadioButton;
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
    Label5: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilPRODUCTO: TInterLinkit;
    ilMONEDA: TInterLinkit;
    ilCVE_FND_ENT_DES: TInterLinkit;
    ilCVE_FND_PROGRAMA: TInterLinkit;
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    SaveDialog1: TSaveDialog;
    RbLiq: TRadioButton;
    Label3: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edNOM_CVE_PRODUCTO_GPO: TEdit;
    chbxGpoProd: TCheckBox;
    Label10: TLabel;
    edCVE_ORIGEN_REC: TEdit;
    btCVE_ORIGEN_REC: TBitBtn;
    edNOM_ORIGEN_REC: TEdit;
    cbxCVE_ORIGEN_REC: TCheckBox;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    ilCVE_ORIGEN_REC: TInterLinkit;
    GroupBox3: TGroupBox;
    ChBFon: TCheckBox;
    ChBGar: TCheckBox;
    edF_CORTEIni: TEdit;
    dtpF_CORTEIni: TInterDateTimePicker;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edID_CESION: TEdit;
    btID_CESION: TBitBtn;
    ilCesion: TInterLinkit;
    edCESION: TEdit;
    chbxCESION: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure ilCVE_FND_PROGRAMACapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_FND_PROGRAMAEjecuta(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure btCVE_FND_ENT_DESClick(Sender: TObject);
    procedure btCVE_FND_PROGRAMAClick(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure cbxCVE_FND_ENT_DESClick(Sender: TObject);
    procedure cbxCVE_FND_PROGRAMAClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure ImprimeReporte(bPreview: Boolean);
    procedure ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure ilCVE_ORIGEN_RECCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_ORIGEN_RECEjecuta(Sender: TObject);
    procedure btCVE_ORIGEN_RECClick(Sender: TObject);
    procedure chbxGpoProdClick(Sender: TObject);
    procedure cbxCVE_ORIGEN_RECClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure ChBFonClick(Sender: TObject);
    procedure ChBGarClick(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    private
    { Private declarations }
    Procedure AsignaEmpresaSuc;
//    Procedure CambiaControl;
    public 
    { Public declarations } 
    Objeto : TMrpasivo;

end; 
 TMrpasivo= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre      : TParamCre;
        Producto      : TCrProduct;
        Moneda        : TMoneda;
        MInstDesc     : TMInstDesc;
        MPrgApoyo     : TMPrgApoyo;
        Empresa       : TEmpresa;
        UnidadNegocio : TUnNegocio;
        GpoProd       : TMProdGpo;
        OrigRec       : TCrOrigRec;
        Credito                  : TCrCredito;//Disposición
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


constructor TMrpasivo.Create( AOwner : TComponent ); 
begin Inherited;

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='CVE_PRODUCTO_CRE';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      MInstDesc := TMInstDesc.Create(Self);
      MInstDesc.MasterSource:=Self;
      MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';

      MPrgApoyo := TMPrgApoyo.Create(Self);
      MPrgApoyo.MasterSource:=Self;
      MPrgApoyo.FieldByName('CVE_FND_PROGRAMA').MasterField:='CVE_FND_PROGRAMA';

      GpoProd:= TMProdGpo.Create(Self);
      GpoProd.MasterSource:=Self;
      GpoProd.FieldByName('CVE_PRODUCTO_GPO').MasterField:='CVE_PRODUCTO_GPO';

      OrigRec := TCrOrigRec.Create(Self);
      OrigRec.MasterSource:=Self;
      OrigRec.FieldByName('CVE_ORIGEN_REC').MasterField:='CVE_ORIGEN_REC';

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      // Empresa
      Empresa := TEmpresa.Create(Self);
      // Sucursal
      UnidadNegocio := TUnNegocio.Create(Self);


      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntMrPasivo.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMrpasivo.Destroy;
begin
   if Producto <> nil then
      Producto.Free;
   if Moneda <> nil then
      Moneda.Free;
   If MInstDesc <> Nil Then
      MInstDesc.Free;
   If MPrgApoyo <> Nil Then
      MPrgApoyo.Free;
   If GpoProd <> Nil Then
      GpoProd.Free;
   If OrigRec <> Nil Then
      OrigRec.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   if Credito <> nil then
      Credito.Free;
inherited;
end;


function TMrpasivo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMrpasivo;
begin
   W:=TWMrpasivo.Create(Self);
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


Function TMrpasivo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IMrpasiv.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TMrpasivo.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA MrPasivo********************)
(*                                                                               *)
(*  FORMA DE MrPasivo                                                            *)
(*                                                                               *)
(***********************************************FORMA MrPasivo********************)

procedure TWMrpasivo.FormShow(Sender: TObject);
begin
   //USURAIO
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
   //PRODUCTO
   Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
   Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;
   Objeto.Producto.GetParams(Objeto);
   edDESC_PRODUCTO1.Hint := Objeto.Producto.DESC_C_PRODUCTO.AsString;
   edDESC_PRODUCTO1.ShowHint := True;
   //MONEDA
   Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
   Objeto.Moneda.GetParams(Objeto);
   edDESC_MONEDA.Hint := Objeto.Moneda.Desc_Moneda.AsString;
   edDESC_MONEDA.ShowHint := True;
   //INSTITUCION
   Objeto.MInstDesc.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
   Objeto.MInstDesc.DESC_ENT_DES.Control    := edNOM_FND_ENT_DES;
   Objeto.MInstDesc.GetParams(Objeto);
   //PROG DE APOYO
   Objeto.MPrgApoyo.CVE_FND_PROGRAMA.Control:= edCVE_FND_PROGRAMA;
   Objeto.MPrgApoyo.DESC_PROGRAMA.Control   := edNOM_FND_PROGRAMA;
   Objeto.MPrgApoyo.GetParams(Objeto);
   //EMPRESA
   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);
   //SUCURSAL
   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   //GPO. PRODUCTO
   Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
   Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
   Objeto.GpoProd.GetParams(Objeto);
   //ORIGEN DE RECURSOS
   Objeto.OrigRec.CVE_ORIGEN_REC.Control  := edCVE_ORIGEN_REC;
   Objeto.OrigRec.DESC_ORIGEN_REC.Control := edNOM_ORIGEN_REC;
   Objeto.OrigRec.GetParams(Objeto);
   //CREDITO
   Objeto.Credito.ID_CREDITO.Control := edID_CESION;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
   Objeto.Credito.GetParams(Objeto);
   edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
   edCESION.ShowHint := True;

   AsignaEmpresaSuc;

end;

procedure TWMrpasivo.FormDestroy(Sender: TObject);
begin
   Objeto.Producto.CVE_PRODUCTO_CRE.Control := nil;
   Objeto.Producto.DESC_C_PRODUCTO.Control := nil;

   Objeto.Moneda.Cve_Moneda.Control := nil;
   Objeto.Moneda.Desc_Moneda.Control := nil;

   Objeto.MInstDesc.CVE_FND_ENT_DES.Control  := Nil;
   Objeto.MInstDesc.DESC_ENT_DES.Control     := Nil;

   Objeto.MPrgApoyo.CVE_FND_PROGRAMA.Control := Nil;
   Objeto.MPrgApoyo.DESC_PROGRAMA.Control    := Nil;

   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;

   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;

   Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= nil;
   Objeto.GpoProd.DESC_C_PROD_GPO.Control:= nil;

   Objeto.OrigRec.CVE_ORIGEN_REC.Control  := Nil;
   Objeto.OrigRec.DESC_ORIGEN_REC.Control := Nil;

   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
   Objeto.Credito.ID_CREDITO.Control := nil;
end;

procedure TWMrpasivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMrpasivo.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMrpasivo.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWMrpasivo.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWMrpasivo.ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWMrpasivo.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TWMrpasivo.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWMrpasivo.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TWMrpasivo.ilCVE_FND_ENT_DESCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWMrpasivo.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   If Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) Then Begin
      cbxCVE_FND_ENT_DES.Checked:=True;
      cbxCVE_FND_ENT_DES.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TWMrpasivo.ilCVE_FND_PROGRAMACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWMrpasivo.ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TWMrpasivo.ilCVE_ORIGEN_RECCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWMrpasivo.ilCVE_FND_PROGRAMAEjecuta(Sender: TObject);
begin
   If Objeto.MPrgApoyo.FindKey([Trim(edCVE_FND_ENT_DES.Text),
                                 ilCVE_FND_PROGRAMA.Buffer]) Then Begin
      cbxCVE_FND_PROGRAMA.Checked:=True;
      cbxCVE_FND_PROGRAMA.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_PROGRAMA);
   End;
end;

procedure TWMrpasivo.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      chbxGpoProd.Checked:=True;
      chbxGpoProd.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TWMrpasivo.ilCVE_ORIGEN_RECEjecuta(Sender: TObject);
begin
   If Objeto.OrigRec.FindKey([ilCVE_ORIGEN_REC.Buffer]) Then Begin
      cbxCVE_ORIGEN_REC.Checked:=True;
      cbxCVE_ORIGEN_REC.Enabled:=True;
      InterForma1.NextTab(edCVE_ORIGEN_REC);
   End;
end;

procedure TWMrpasivo.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TWMrpasivo.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMrpasivo.btPRODUCTOClick(Sender: TObject);
begin
    Objeto.Producto.ShowAll := True;
    if Objeto.Producto.Busca Then
    Begin
        chbxProducto.Checked:= True;
        chbxProducto.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    end;
end;

procedure TWMrpasivo.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWMrpasivo.btCVE_FND_ENT_DESClick(Sender: TObject);
begin
   Objeto.MInstDesc.ShowAll := True;
   If Objeto.MInstDesc.Busca Then Begin
      cbxCVE_FND_ENT_DES.Checked:=True;
      cbxCVE_FND_ENT_DES.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TWMrpasivo.btCVE_FND_PROGRAMAClick(Sender: TObject);
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

procedure TWMrpasivo.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
      Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      chbxGpoProd.Checked:=True;
      chbxGpoProd.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TWMrpasivo.btCVE_ORIGEN_RECClick(Sender: TObject);
begin
   Objeto.OrigRec.ShowAll := True;
   If Objeto.OrigRec.Busca Then Begin
      cbxCVE_ORIGEN_REC.Checked:=True;
      cbxCVE_ORIGEN_REC.Enabled:=True;
      InterForma1.NextTab(edCVE_ORIGEN_REC);
   End;
end;

procedure TWMrpasivo.AsignaEmpresaSuc;
begin
        Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);
    if  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) then
    begin
         CBSucursal.Checked := True;
    end;

    EdIdEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
    bbEmpresa.Enabled   := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';

    EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    BBSucursal.Enabled   := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    CBSucursal.Enabled   := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
end;

procedure TWMrpasivo.chbxProductoClick(Sender: TObject);
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

procedure TWMrpasivo.chbxMonedaClick(Sender: TObject);
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

procedure TWMrpasivo.cbxCVE_FND_ENT_DESClick(Sender: TObject);
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

procedure TWMrpasivo.cbxCVE_FND_PROGRAMAClick(Sender: TObject);
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

procedure TWMrpasivo.sbExcelClick(Sender: TObject);
var sExt : String;
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

procedure TWMrpasivo.cbxArchivoClick(Sender: TObject);
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

procedure TWMrpasivo.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked := True;
        cbxArchivo.Enabled := True;
    End Else Begin
        cbxArchivo.Checked := False;
        cbxArchivo.Enabled := False;
    End;
end;

procedure TWMrpasivo.ImprimeReporte(bPreview: Boolean);
var tiprep, esqm : String;
begin

    if RbAct.Checked then
       tiprep := 'AC';

    if RbLiq.Checked then
       tiprep := 'LQ';

    if RbCanc.Checked then
       tiprep := 'CA';

    if RbTod.Checked then
       tiprep := '';

    if ChBFon.Checked then
       esqm := 'FON';

    if ChBGar.Checked then
       esqm := 'GAR';     

    if (Trim(edF_CORTEIni.Text)= '') then
       ShowMessage('    Favor de Validar Fecha')
    else
    begin
         RepCartPas( edF_CORTEIni.Text, edCVE_PRODUCTO_CRE.Text,
                     edCVE_MONEDA.Text, edCVE_FND_ENT_DES.Text, edCVE_FND_PROGRAMA.Text, edCVE_PRODUCTO_GPO.Text,
                     edCVE_ORIGEN_REC.Text, edID_CESION.Text, EdIdEmpresa.Text, EdIDSucursal.Text, edNbrArch.Text, tiprep, esqm,
                     bPreview        , Objeto.Apli );


         if Trim(edNbrArch.Text)<>'' then
         begin
            if  bGenArch then
              ShowMessage('    El Archivo se generó correctamente')
            else
              ShowMessage('    No se generó el Archivo')
         end;
    end; 
end;

{procedure TWMrpasivo.CambiaControl;
Begin
   If Objeto.GpoProd.B_APLICA_FONDEO.AsString = 'V' Then
      rgDescDoc.Enabled:= True
   Else
   rgDescDoc.Enabled:= False;
   cbxCVE_PRODUCTO_GPO.Checked:=True;
   cbxCVE_PRODUCTO_GPO.Enabled:=True;
End;}

procedure TWMrpasivo.chbxGpoProdClick(Sender: TObject);
begin
    If not chbxGpoProd.Checked Then Begin
        Objeto.GpoProd.Active:=False;
        chbxGpoProd.Checked:=False;
        chbxGpoProd.Enabled:=False;
        edCVE_PRODUCTO_GPO.Text:='';
        edNOM_CVE_PRODUCTO_GPO.Text:='';
    End Else Begin
        chbxGpoProd.Checked:=True;
        chbxGpoProd.Enabled:=True;
    End;
end;

procedure TWMrpasivo.cbxCVE_ORIGEN_RECClick(Sender: TObject);
begin
    If not cbxCVE_ORIGEN_REC.Checked Then Begin
        Objeto.GpoProd.Active:=False;
        cbxCVE_ORIGEN_REC.Checked:=False;
        cbxCVE_ORIGEN_REC.Enabled:=False;
        edCVE_ORIGEN_REC.Text:='';
        edNOM_ORIGEN_REC.Text:='';
    End Else Begin
        cbxCVE_ORIGEN_REC.Checked:=True;
        cbxCVE_ORIGEN_REC.Enabled:=True;
    End;
end;
procedure TWMrpasivo.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMRPASIVO_IMPRI',True,True) then
    ImprimeReporte(False);
end;

procedure TWMrpasivo.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMRPASIVO_PREVI',True,True) then
     ImprimeReporte(True);
end;

procedure TWMrpasivo.ChBFonClick(Sender: TObject);
begin
if ChBFon.Checked then
   ChBGar.Checked := False;
end;

procedure TWMrpasivo.ChBGarClick(Sender: TObject);
begin
if ChBGar.Checked then
   ChBFon.Checked := False;
end;

procedure TWMrpasivo.btID_CESIONClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   If Objeto.Credito.Busca Then Begin
      chbxCESION.Checked:=True;
      chbxCESION.Enabled:=True;
      InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TWMrpasivo.chbxCESIONClick(Sender: TObject);
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

procedure TWMrpasivo.ilCesionCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TWMrpasivo.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

end.
