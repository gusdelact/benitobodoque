// Sistema         : Clase de TMColProm
// Fecha de Inicio :
// Función forma   : Clase de TMColProm
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMColProm;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntCrProduct,     //Producto de crédito
IntCrAcredit,     //Acreditado
IntMPers,         //PromotorAsoc
IntParamCre,
IntMQrColProm,
Intempre,         //Empresa
IntUnNeg          //Unidad Negocio/Suc
;

Type
 TMColProm= class;

  TwMColProm=Class(TForm)
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
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    sbExcel: TSpeedButton;
    Label4: TLabel;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btPROMOTORClick(Sender: TObject);
    procedure ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROMOTOREjecuta(Sender: TObject);
    procedure edID_PROMOTORExit(Sender: TObject);
    procedure chbxPromotorClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure btPROM_ADMONClick(Sender: TObject);
    procedure ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
    procedure ilPromAdmonEjecuta(Sender: TObject);
    procedure edID_PROMExit(Sender: TObject);
    procedure chbxPromAmonClick(Sender: TObject);
    procedure edID_PROMOTORChange(Sender: TObject);
    procedure edID_PROMChange(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
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
    Objeto : TMColProm;
end;
 TMColProm= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        Producto                 : TCrProduct;
        Promotor                 : TMPersona; //Promotor Responsable
        PromotorAdmon            : TMPersona; //Promotor Admon
        ParamCre                 : TParamCre;
        UnidadNegocio    : TUnNegocio;
        Empresa          : TEmpresa;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;
implementation
{$R *.DFM}

constructor TMColProm.Create( AOwner : TComponent );
begin Inherited;
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
   HelpFile := 'InTMColProm.Hlp';
   ShowMenuReporte:=True;
end;

Destructor TMColProm.Destroy;
begin
   if Producto <> nil then
      Producto.Free;
   if Promotor <> nil then
      Promotor.Free;
   if PromotorAdmon <> nil then
      PromotorAdmon.Free;
   If Empresa <> Nil Then
      Empresa.free;
   If UnidadNegocio <> Nil Then
      UnidadNegocio.Free;
   inherited;
end;


function TMColProm.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMColProm;
begin
   W:=TwMColProm.Create(Self);
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


Function TMColProm.InternalBusca:Boolean;
begin InternalBusca := False;
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
Procedure TwMColProm.AsignaEmpresaSuc;
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

procedure TwMColProm.FormShow(Sender: TObject);
begin
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
end;

procedure TwMColProm.FormDestroy(Sender: TObject);
begin
   Objeto.Promotor.Nombre.Control :=nil;
   Objeto.Promotor.Id_Persona.Control :=nil;
   Objeto.PromotorAdmon.Nombre.Control :=nil;
   Objeto.PromotorAdmon.Id_Persona.Control :=nil;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMColProm.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMColProm.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMColProm.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMColProm.btPROMOTORClick(Sender: TObject);
begin
   Objeto.Promotor.ShowAll := True;
   If Objeto.Promotor.Busca Then Begin
      chbxPromotor.Checked:=True;
      chbxPromotor.Enabled:=True;
      InterForma1.NextTab(edID_PROMOTOR);
   End;
end;

procedure TwMColProm.ilPROMOTORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMColProm.ilPROMOTOREjecuta(Sender: TObject);
begin
   If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
      chbxPromotor.Checked:=True;
      chbxPromotor.Enabled:=True;
      InterForma1.NextTab(edID_PROMOTOR);
   End;
end;

procedure TwMColProm.edID_PROMOTORExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_PROMOTOR,True,'',True);
end;

procedure TwMColProm.chbxPromotorClick(Sender: TObject);
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

procedure TwMColProm.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCOLPROM_PREVI',True,True) then
      ImprimeReporte(True);
end;

procedure TwMColProm.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
end;

procedure TwMColProm.btPRODUCTOClick(Sender: TObject);
begin
   Objeto.Producto.ShowAll := True;
   If Objeto.Producto.Busca Then Begin
      chbxProducto.Checked:= True;
      chbxProducto.Enabled:= True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

procedure TwMColProm.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMColProm.ilPRODUCTOEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
      chbxProducto.Checked:=True;
      chbxProducto.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

procedure TwMColProm.chbxProductoClick(Sender: TObject);
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

procedure TwMColProm.btPROM_ADMONClick(Sender: TObject);
begin
   Objeto.PromotorAdmon.ShowAll := True;
   If Objeto.PromotorAdmon.Busca Then Begin
      chbxPromAmon.Checked:=True;
      chbxPromAmon.Enabled:=True;
      InterForma1.NextTab(edID_PROM);
   End;
end;

procedure TwMColProm.ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMColProm.ilPromAdmonEjecuta(Sender: TObject);
begin
   If Objeto.PromotorAdmon.FindKey([ilPromAdmon.Buffer]) Then Begin
      chbxPromAmon.Checked:=True;
      chbxPromAmon.Enabled:=True;
      InterForma1.NextTab(edID_PROM);
   End;
end;

procedure TwMColProm.edID_PROMExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_PROM,True,'',True);
end;

procedure TwMColProm.chbxPromAmonClick(Sender: TObject);
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

procedure TwMColProm.edID_PROMOTORChange(Sender: TObject);
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

procedure TwMColProm.edID_PROMChange(Sender: TObject);
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

Procedure TwMColProm.ImprimeReporte(bPreview:Boolean);
begin
   EjecutarReporteColPromotor(edF_Inicio.Text, edF_Fin.Text, edCVE_PRODUCTO_CRE.Text,
                              edID_PROMOTOR.Text, edID_PROM.Text,
                              EdIdEmpresa.Text, EdIDSucursal.Text,//SASB
                              edNbrArch.Text,  //easa4011 14.03.2008 consulta en excel
                              Objeto.Apli,bPreview);
  //easa4011 14.03.2008 consulta en excel
    If Trim(edNbrArch.Text)<>'' Then Begin
       If bGenArch Then
         ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
       Else
         ShowMessage('No se generó el Archivo')
    End;
  //end easa4011 14.03.2008
End;
procedure TwMColProm.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCOLPROM_IMPRI',True,True) then
      ImprimeReporte(False);
end;

procedure TwMColProm.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMColProm.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMColProm.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMColProm.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMColProm.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
   End;
end;

  //easa4011 14.03.2008 consulta en excel
procedure TwMColProm.sbExcelClick(Sender: TObject);
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

procedure TwMColProm.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TwMColProm.cbxArchivoClick(Sender: TObject);
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
//ene easa 14.03.2008

end.

