// Sistema         : Clase de TMCartVenc
// Fecha de Inicio :
// Función forma   : Clase de TMCartVenc
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMCartVenc;

Interface

Uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntCrProduct,     //Producto de crédito
IntCrAcredit,     //Acreditado
IntMPers,         //PromotorAsoc
IntParamCre,
IntMQrCartVenc,   //Reporte
Intempre,         //Empresa
IntUnNeg          //Unidad Negocio/Suc
;

Type
 TMCartVenc= class;
  TwMCartVenc=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    lbID_PROMOTOR: TLabel;
    edID_PROMOTOR: TEdit;
    btPROMOTOR: TBitBtn;
    ilPROMOTOR: TInterLinkit;
    edNOM_PROMOTOR: TEdit;
    Label7: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    chbxPromotor: TCheckBox;
    chbxPromAmon: TCheckBox;
    edNOM_PROM: TEdit;
    btPROM_ADMON: TBitBtn;
    ilPromAdmon: TInterLinkit;
    lbCVE_PRODUCTO_CRE: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    ilPRODUCTO: TInterLinkit;
    chbxProducto: TCheckBox;
    edID_PROM: TEdit;
    GroupBox1: TGroupBox;                                                                                 
    lbLiqF_INICIO: TLabel;
    edF_Inicio: TEdit;
    dtpF_Inicio: TInterDateTimePicker;
    Label3: TLabel;
    edF_FIN: TEdit;
    dtpF_Fin: TInterDateTimePicker;
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
    ILSucursal: TInterLinkit;
    ilEmpresa: TInterLinkit;
    Procedure FormShow(SEnder : TObject);
    Procedure FormClose(SEnder : TObject; var Action : TCloseAction);
    Procedure FormDestroy(SEnder : TObject);
    Procedure InterForma1DespuesNuevo(SEnder: TObject);
    Procedure InterForma1DespuesModificar(SEnder: TObject);
    Procedure btPROMOTORClick(SEnder: TObject);
    Procedure ilPROMOTORCapture(SEnder: TObject; var Show: Boolean);
    Procedure ilPROMOTOREjecuta(SEnder: TObject);
    Procedure edID_PROMOTORExit(SEnder: TObject);
    Procedure chbxPromotorClick(SEnder: TObject);
    Procedure InterForma1BtnPreviewClick(SEnder: TObject);
    Procedure edCVE_PRODUCTO_CREExit(SEnder: TObject);
    Procedure btPRODUCTOClick(SEnder: TObject);
    Procedure ilPRODUCTOCapture(SEnder: TObject; var Show: Boolean);
    Procedure ilPRODUCTOEjecuta(SEnder: TObject);
    Procedure chbxProductoClick(SEnder: TObject);
    Procedure btPROM_ADMONClick(SEnder: TObject);
    Procedure ilPromAdmonCapture(SEnder: TObject; var Show: Boolean);
    Procedure ilPromAdmonEjecuta(SEnder: TObject);
    Procedure edID_PROMExit(SEnder: TObject);
    Procedure chbxPromAmonClick(SEnder: TObject);
    Procedure edID_PROMOTORChange(SEnder: TObject);
    Procedure edID_PROMChange(SEnder: TObject);
    Procedure InterForma1BtnImprimirClick(SEnder: TObject);
    Procedure bbEmpresaClick(SEnder: TObject);
    Procedure BBSucursalClick(SEnder: TObject);
    Procedure ilEmpresaEjecuta(SEnder: TObject);
    Procedure ILSucursalEjecuta(SEnder: TObject);
    Procedure CBSucursalClick(SEnder: TObject);
    Private
    { Private declarations }
        Procedure ImprimeReporte(bPreview:Boolean);
        Procedure AsignaEmpresaSuc;
    Public
    { Public declarations }
    Objeto : TMCartVenc;
End;
 TMCartVenc= class(TInterFrame)
      Private
      Protected
    //  Procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       Public
        { Public declarations }
        Producto                 : TCrProduct;
        Promotor                 : TMPersona; //Promotor Responsable
        PromotorAdmon            : TMPersona; //Promotor Admon
        ParamCre                 : TParamCre;
        UnidadNegocio    : TUnNegocio;
        Empresa          : TEmpresa;

        Function    InternalBusca : Boolean; override;
        Constructor Create( AOwner : TComponent ); override;
        Destructor  Destroy; override;
        Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      Published
      End;
Implementation
{$R *.DFM}

Constructor TMCartVenc.Create( AOwner : TComponent );
Begin
   Inherited;
   Producto :=  TCrProduct.Create(Self);
   Producto.MasterSource:=Self;
   Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='CVE_PRODUCTO_CRE';

   Promotor := TMPersona.Create(Self);
   Promotor.FilterBy := fbTMPersonaEmpleado;
   Promotor.MasterSource := Self;
   Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
   Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

   PromotorAdmon := TMPersona.Create(Self);
   PromotorAdmon.FilterBy := fbTMPersonaEmpleado;
   PromotorAdmon.MasterSource := Self;
   PromotorAdmon.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';

   //SASB
   Empresa := TEmpresa.Create(Self);
   UnidadNegocio := TUnNegocio.Create(Self);

   UseQuery := False;
   HelpFile := 'InTMCartVenc.Hlp';
   ShowMenuReporte:=True;
End;

Destructor TMCartVenc.Destroy;
Begin
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
   inherited;
End;

Function TMCartVenc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMCartVenc;
Begin
   W:=TwMCartVenc.Create(Self);
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
   End;
End;

Function TMCartVenc.InternalBusca:Boolean;
Begin InternalBusca := False;
End;
(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

Procedure TwMCartVenc.AsignaEmpresaSuc;
Begin
   Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);
   If  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) Then Begin
         CBSucursal.Checked := True;
   End;

   EdIdEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   bbEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   BBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   CBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
End;

Procedure TwMCartVenc.FormShow(SEnder: TObject);
Begin
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

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;
End;

Procedure TwMCartVenc.FormDestroy(SEnder: TObject);
Begin
   Objeto.Promotor.Nombre.Control :=Nil;
   Objeto.Promotor.Id_Persona.Control :=Nil;
   Objeto.PromotorAdmon.Nombre.Control :=Nil;
   Objeto.PromotorAdmon.Id_Persona.Control :=Nil;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
End;

Procedure TwMCartVenc.FormClose(SEnder: TObject; var Action: TCloseAction);
Begin Action := caFree;
End;

Procedure TwMCartVenc.InterForma1DespuesNuevo(SEnder: TObject);
Begin //<<Control>>.SetFocus;
End;

Procedure TwMCartVenc.InterForma1DespuesModificar(SEnder: TObject);
Begin //<<Control>>.SetFocus;
End;

Procedure TwMCartVenc.btPROMOTORClick(SEnder: TObject);
Begin
   Objeto.Promotor.ShowAll := True;
   If Objeto.Promotor.Busca Then Begin
      chbxPromotor.Checked:=True;
      chbxPromotor.Enabled:=True;
      InterForma1.NextTab(edID_PROMOTOR);
   End;
End;

Procedure TwMCartVenc.ilPROMOTORCapture(SEnder: TObject;
  var Show: Boolean);
Begin
   Show:=True;
End;

Procedure TwMCartVenc.ilPROMOTOREjecuta(SEnder: TObject);
Begin
   If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
      chbxPromotor.Checked:=True;
      chbxPromotor.Enabled:=True;
      InterForma1.NextTab(edID_PROMOTOR);
   End;
End;

Procedure TwMCartVenc.edID_PROMOTORExit(SEnder: TObject);
Begin
   InterForma1.ValidaExit(edID_PROMOTOR,True,'',True);
End;

Procedure TwMCartVenc.chbxPromotorClick(SEnder: TObject);
Begin
   If Not chbxPromotor.Checked Then Begin
      Objeto.Promotor.Active:=False;
      chbxPromotor.Checked:=False;
      chbxPromotor.Enabled:=False;
   End Else Begin
      chbxPromotor.Checked:=True;
      chbxPromotor.Enabled:=True;
   End;
End;

Procedure TwMCartVenc.InterForma1BtnPreviewClick(SEnder: TObject);
Begin
   ImprimeReporte(True);
End;

Procedure TwMCartVenc.edCVE_PRODUCTO_CREExit(SEnder: TObject);
Begin
   InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
End;

Procedure TwMCartVenc.btPRODUCTOClick(SEnder: TObject);
Begin
   Objeto.Producto.ShowAll := True;
   If Objeto.Producto.Busca Then Begin
      chbxProducto.Checked:= True;
      chbxProducto.Enabled:= True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
End;

Procedure TwMCartVenc.ilPRODUCTOCapture(SEnder: TObject;
  var Show: Boolean);
Begin
   Show := True;
End;

Procedure TwMCartVenc.ilPRODUCTOEjecuta(SEnder: TObject);
Begin
   If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
      chbxProducto.Checked:=True;
      chbxProducto.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
End;


Procedure TwMCartVenc.chbxProductoClick(SEnder: TObject);
Begin
   If Not chbxProducto.Checked Then Begin
      Objeto.Producto.Active:=False;
      chbxProducto.Checked:=False;
      chbxProducto.Enabled:=False;
   End Else Begin
      chbxProducto.Checked:=True;
      chbxProducto.Enabled:=True;
   End;
End;

Procedure TwMCartVenc.btPROM_ADMONClick(SEnder: TObject);
Begin
   Objeto.PromotorAdmon.ShowAll := True;
   If Objeto.PromotorAdmon.Busca Then Begin
      chbxPromAmon.Checked:=True;
      chbxPromAmon.Enabled:=True;
      InterForma1.NextTab(edID_PROM);
   End;
End;

Procedure TwMCartVenc.ilPromAdmonCapture(SEnder: TObject; var Show: Boolean);
Begin
   Show:=True;
End;

Procedure TwMCartVenc.ilPromAdmonEjecuta(SEnder: TObject);
Begin
   If Objeto.PromotorAdmon.FindKey([ilPromAdmon.Buffer]) Then Begin
      chbxPromAmon.Checked:=True;
      chbxPromAmon.Enabled:=True;
      InterForma1.NextTab(edID_PROM);
   End;
End;

Procedure TwMCartVenc.edID_PROMExit(SEnder: TObject);
Begin
   InterForma1.ValidaExit(edID_PROM,True,'',True);
End;

Procedure TwMCartVenc.chbxPromAmonClick(SEnder: TObject);
Begin
   If Not chbxPromAmon.Checked Then Begin
      Objeto.PromotorAdmon.Active:=False;
      chbxPromAmon.Checked:=False;
      chbxPromAmon.Enabled:=False;
   End Else Begin
      chbxPromAmon.Checked:=True;
      chbxPromAmon.Enabled:=True;
   End;
End;

Procedure TwMCartVenc.edID_PROMOTORChange(SEnder: TObject);
Begin
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
End;

Procedure TwMCartVenc.edID_PROMChange(SEnder: TObject);
Begin
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
End;

Procedure TwMCartVenc.ImprimeReporte(bPreview:Boolean);
Begin
   EjecutarReporteIngPromotor(edF_Inicio.Text, edF_Fin.Text, edCVE_PRODUCTO_CRE.Text,
                              edID_PROMOTOR.Text, edID_PROM.Text,
                              EdIdEmpresa.Text, EdIDSucursal.Text,//SASB
                              Objeto.Apli,bPreview);
End;
Procedure TwMCartVenc.InterForma1BtnImprimirClick(SEnder: TObject);
Begin
   ImprimeReporte(False);
End;

Procedure TwMCartVenc.bbEmpresaClick(SEnder: TObject);
Begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
End;

Procedure TwMCartVenc.BBSucursalClick(SEnder: TObject);
Begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
End;

Procedure TwMCartVenc.ilEmpresaEjecuta(SEnder: TObject);
Begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
End;

Procedure TwMCartVenc.ILSucursalEjecuta(SEnder: TObject);
Begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
End;

Procedure TwMCartVenc.CBSucursalClick(SEnder: TObject);
Begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
   End;
End;

End.

