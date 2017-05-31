// Sistema         : Clase de TMProvDiar
// Fecha de Inicio :
// Función forma   : Clase de TMProvDiar
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMProvDiar;                        
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,
Math,

//Unidades Adicionales
IntGenCre,        //Unidad generica de ICRE
IntMProdGpo,      //Grupo de Producto de Crédito
IntCrProduct,     //Producto de crédito
IntMPers,         //PromotorAsoc
IntEmple,
IntPers,
IntParamCre,      //Parámetros de Crédito
IntMQProvDiaria,   //Reporte de Provisión Diaria
Intempre,         //Empresa
IntUnNeg          //Unidad Negocio/Suc
;

Type
 TMProvDiar= class;

  TwMProvDiar=Class(TForm)
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
    lbCVE_PRODUCTO_CRE: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    ilPRODUCTO: TInterLinkit;
    chbxProducto: TCheckBox;
    GroupBox1: TGroupBox;                                                                                 
    lbLiqF_INICIO: TLabel;
    edF_Inicio: TEdit;
    dtpF_Inicio: TInterDateTimePicker;
    Label3: TLabel;
    edF_FIN: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    Label1: TLabel;
    edGpoProd: TEdit;
    btGpoProd: TBitBtn;
    edNomGpoProd: TEdit;
    chbxGpoProd: TCheckBox;
    ilGpoProd: TInterLinkit;
    Label2: TLabel;
    edPromAdmin: TEdit;
    btPromAdmin: TBitBtn;
    edNomPromAdmin: TEdit;
    chbxPromAdmin: TCheckBox;
    ilPromAdmin: TInterLinkit;
    Label4: TLabel;
    edPromAsoc: TEdit;
    btPromAsoc: TBitBtn;
    edNomPromAsoc: TEdit;
    chbxPromAsoc: TCheckBox;
    ilPromAsoc: TInterLinkit;
    rgCartera: TRadioGroup;
    rgTraspaso: TRadioGroup;
    cbxOrdenProm: TCheckBox;
    cbxOrdenCliente: TCheckBox;
    cbxResumen: TCheckBox;
    cbxArchivo: TCheckBox;
    edNbrArch: TEdit;
    sbExcel: TSpeedButton;
    Label6: TLabel;
    SaveDialog1: TSaveDialog;
    rgSubtipos: TRadioGroup;
    cbxCatMin: TCheckBox;
    Label5: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    chbxAcreditado: TCheckBox;
    ilACREDITADO: TInterLinkit;
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
    cbNAFIN: TCheckBox;
    cbFOVI: TCheckBox;
    cbFIRA: TCheckBox;
    cbxOrdenPromAdm: TCheckBox;
    rgTIP_RECUPERA: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure edGpoProdExit(Sender: TObject);
    procedure btGpoProdClick(Sender: TObject);
    procedure chbxGpoProdClick(Sender: TObject);
    procedure ilGpoProdCapture(Sender: TObject; var Show: Boolean);
    procedure ilGpoProdEjecuta(Sender: TObject);
    procedure edPromAdminExit(Sender: TObject);
    procedure btPromAdminClick(Sender: TObject);
    procedure chbxPromAdminClick(Sender: TObject);
    procedure ilPromAdminCapture(Sender: TObject; var Show: Boolean);
    procedure ilPromAdminEjecuta(Sender: TObject);
    procedure edPromAsocExit(Sender: TObject);
    procedure btPromAsocClick(Sender: TObject);
    procedure chbxPromAsocClick(Sender: TObject);
    procedure ilPromAsocCapture(Sender: TObject; var Show: Boolean);
    procedure ilPromAsocEjecuta(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edPromAdminChange(Sender: TObject);
    procedure edPromAsocChange(Sender: TObject);
    procedure edACREDITADOExit(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    private
    { Private declarations }
     //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
     Procedure ImprimeReporte(bPreview:Boolean; grOpcion  : TGenRepOption );
     //Procedure ImprimeReporte(bPreview:Boolean);
     //</LOLS>
     Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMProvDiar;
end;
 TMProvDiar= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        GpoProducto              : TMProdGpo;
        Producto                 : TCrProduct;
        Promotor                 : TEmpleado; //Promotor Responsable
        PromotorAdmon            : TEmpleado; //Promotor Admon
        ParamCre                 : TParamCre;
        Acreditado               : TPersona;
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

constructor TMProvDiar.Create( AOwner : TComponent );
begin Inherited;

      Acreditado := TPersona.Create(Self);
      Acreditado.MasterSource := Self;
      Acreditado.FieldByName('ID_PERSONA').MasterField := 'ID_ACREDITADO';
      Acreditado.BuscaWhereString := 'SIT_PERSONA = ''AC''';

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField := 'CVE_PRODUCTO_CRE';

      GpoProducto := TMProdGpo.Create(Self);
      GpoProducto.MasterSource:=Self;
      GpoProducto.FieldByName('CVE_PRODUCTO_GPO').MasterField := 'CVE_PRODUCTO_GPO';

      Promotor := TEmpleado.Create(Self);
      Promotor.FilterBy := fbTMPersonaEmpleado;
      Promotor.MasterSource := Self;
      Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
      Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      PromotorAdmon := TEmpleado.Create(Self);
      PromotorAdmon.FilterBy := fbTMPersonaEmpleado;
      PromotorAdmon.MasterSource := Self;
      PromotorAdmon.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR_ADM';

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      UseQuery := False;
      HelpFile := 'InTMProvDiar.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMProvDiar.Destroy;
begin
   If Acreditado <> Nil Then
      Acreditado.Free;
   If GpoProducto <> Nil Then
      GpoProducto.Free;
   If Producto <> Nil Then
      Producto.Free;
   If Promotor <> Nil Then
      Promotor.Free;
   If PromotorAdmon <> Nil Then
      PromotorAdmon.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   Inherited;
end;


function TMProvDiar.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMProvDiar;
begin
   W:=TwMProvDiar.Create(Self);
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


Function TMProvDiar.InternalBusca:Boolean;
begin InternalBusca := False;
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMProvDiar.AsignaEmpresaSuc;
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

procedure TwMProvDiar.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
  With Objeto Do
   Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    dtpF_Inicio.DateTime:= Apli.DameFechaEmpresaDia('D000')-1;
    dtpF_Fin.DateTime:= Apli.DameFechaEmpresaDia('D000')-1;
    edF_Inicio.text:=FormatDateTime('dd/mm/yyyy',dtpF_Inicio.DateTime);
    edF_FIN.text:=FormatDateTime('dd/mm/yyyy',dtpF_Fin.DateTime);

    Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
    Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;
    Producto.GetParams(Objeto);

    GpoProducto.CVE_PRODUCTO_GPO.Control := edGpoProd;
    GpoProducto.DESC_C_PROD_GPO.Control := edNomGpoProd;
    GpoProducto.GetParams(Objeto);

    Promotor.ID_Persona.Control :=edPromAsoc;
    Promotor.Persona.Nombre.Control :=edNomPromAsoc;
    Promotor.GetParams(Objeto);
    edNomPromAsoc.Hint := Promotor.Persona.Nombre.AsString;
    edNomPromAsoc.ShowHint := True;

    PromotorAdmon.ID_Persona.Control :=edPromAdmin;
    PromotorAdmon.Persona.Nombre.Control :=edNomPromAdmin;
    PromotorAdmon.GetParams(Objeto);
    edNomPromAdmin.Hint := PromotorAdmon.Persona.Nombre.AsString;
    edNomPromAdmin.ShowHint := True;
    edDESC_PRODUCTO1.Hint      := Producto.DESC_C_PRODUCTO.AsString;
    edDESC_PRODUCTO1.ShowHint := True;

    Acreditado.Id_Persona.Control := edACREDITADO;
    Acreditado.Nombre.Control := edNOMBRE_ACRED;
    GetParams(Objeto);
    edNOMBRE_ACRED.Hint := Acreditado.Nombre.AsString;
    edNOMBRE_ACRED.ShowHint := True;
   End;
   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;
end;

procedure TwMProvDiar.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      Acreditado.ID_Persona.Control := nil;
      Acreditado.Nombre.Control := nil;
      Producto.CVE_PRODUCTO_CRE.Control := Nil;
      Producto.DESC_C_PRODUCTO.Control := Nil;
      GpoProducto.CVE_PRODUCTO_GPO.Control := Nil;
      GpoProducto.DESC_C_PROD_GPO.Control := Nil;
      PromotorAdmon.ID_Persona.Control := Nil;
      PromotorAdmon.Persona.Nombre.Control := Nil;
      Promotor.Persona.Nombre.Control :=nil;
      Promotor.Id_Persona.Control :=nil;
   End;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMProvDiar.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMProvDiar.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPROVDIAR_PREVI',True,True) then
   begin
      //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
      ImprimeReporte(True, grPreview );
      //ImprimeReporte(True);
      //</LOLS>
   end;
end;

procedure TwMProvDiar.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
end;

procedure TwMProvDiar.btPRODUCTOClick(Sender: TObject);
begin
   Objeto.Producto.ShowAll := True;
   If Objeto.Producto.Busca Then Begin
      chbxProducto.Checked:= True;
      chbxProducto.Enabled:= True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

procedure TwMProvDiar.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMProvDiar.ilPRODUCTOEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
      chbxProducto.Checked:=True;
      chbxProducto.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;


procedure TwMProvDiar.chbxProductoClick(Sender: TObject);
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

//<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
//Procedure TwMProvDiar.ImprimeReporte(bPreview:Boolean);
Procedure TwMProvDiar.ImprimeReporte(bPreview:Boolean; grOpcion  : TGenRepOption );
//</LOLS>
var sCartera, sCarteraCR, sTraspaso,sSubTipo : String;
   iMax, iMin, i: Integer;
       sTipRecu1:String;
    iTipRecu:Integer;
begin
   case rgCartera.ItemIndex Of
      0:sCartera:='';
      1: sCartera:='V';
      2: sCartera:='F';
   End;
   case rgTraspaso.ItemIndex Of
      0: sTraspaso:='';
      1: sTraspaso:='T';
      2: sTraspaso:='NT';
   End;

   case rgSubtipos.ItemIndex Of
      0: sSubTipo:='GL';
      1: sSubTipo:='CO';
      2: sSubTipo:='HI';
   End;

      iTipRecu := rgTIP_RECUPERA.ItemIndex;
   case iTipRecu of
        0: sTipRecu1 := '0';
        1: sTipRecu1 := '1';
        2: sTipRecu1 := '2';
   end;

   iMax:= Max(Trunc(StrToDate(edF_Inicio.Text)),Trunc(StrToDate(edF_FIN.Text)));
   iMin:= Min(Trunc(StrToDate(edF_Inicio.Text)),Trunc(StrToDate(edF_FIN.Text)));


   For i:= iMin To iMax Do Begin
      EjecutarReporteProvisionDiaria2 (
                                        //FormatDateTime('dd/mm/yyyy',imin),
                                        //-----JRG Correción de parametro inferior "i"
                                        FormatDateTime('dd/mm/yyyy',i),
                                        //********************************************
                                       FormatDateTime('dd/mm/yyyy',iMax),
                                       edGpoProd.Text, edCVE_PRODUCTO_CRE.Text,
                                       edPromAdmin.Text, edPromAsoc.Text,
                                       sCartera, sTraspaso, edNbrArch.Text,sSubTipo,sTipRecu1,
                                       edACREDITADO.Text, EdIdEmpresa.Text,
                                       EdIDSucursal.Text,
                                       cbxOrdenProm.Checked, cbxOrdenPromAdm.Checked, cbxOrdenCliente.Checked,
                                       cbxResumen.Checked,cbxCatMin.Checked,
                                       cbNAFIN.Checked,cbFOVI.Checked,cbFIRA.Checked,
                                       Objeto.Apli, bPreview
                                       //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
                                       ,grOpcion, ''
                                       //</LOLS>
                                       );
   End;
   If Trim(edNbrArch.Text)<>'' Then Begin
      If bGenArch Then
        ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
      Else
        ShowMessage('No se generó el Archivo')
   End;
End;
procedure TwMProvDiar.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPROVDIAR_IMPRI',True,True) then
   begin
     //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
     ImprimeReporte(False, grPrint );
     //ImprimeReporte(False);
     //</LOLS>
   end;
end;

procedure TwMProvDiar.edGpoProdExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edGpoProd,True,'',True);
end;

procedure TwMProvDiar.btGpoProdClick(Sender: TObject);
begin
   Objeto.GpoProducto.ShowAll := True;
   If Objeto.GpoProducto.Busca Then Begin
      chbxGpoProd.Checked:= True;
      chbxGpoProd.Enabled:= True;
      InterForma1.NextTab(edGpoProd);
   End;
end;

procedure TwMProvDiar.chbxGpoProdClick(Sender: TObject);
begin
   If not chbxGpoProd.Checked Then Begin
      Objeto.GpoProducto.Active:=False;
      chbxGpoProd.Checked:=False;
      chbxGpoProd.Enabled:=False;
   End Else Begin
      chbxGpoProd.Checked:=True;
      chbxGpoProd.Enabled:=True;
   End;
end;

procedure TwMProvDiar.ilGpoProdCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMProvDiar.ilGpoProdEjecuta(Sender: TObject);
begin
   If Objeto.GpoProducto.FindKey([ilGpoProd.Buffer])Then Begin
      chbxGpoProd.Checked:=True;
      chbxGpoProd.Enabled:=True;
      InterForma1.NextTab(edGpoProd);
   End;
end;

procedure TwMProvDiar.edPromAdminExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edPromAdmin,True,'',True);
end;

procedure TwMProvDiar.btPromAdminClick(Sender: TObject);
begin
    Objeto.PromotorAdmon.ShowAll := True;
    If Objeto.PromotorAdmon.Busca Then Begin
        chbxPromAdmin.Checked:=True;
        chbxPromAdmin.Enabled:=True;
        InterForma1.NextTab(edPromAdmin);
    End;
end;

procedure TwMProvDiar.chbxPromAdminClick(Sender: TObject);
begin
   If not chbxPromAdmin.Checked Then Begin
      Objeto.PromotorAdmon.Active:=False;
      chbxPromAdmin.Checked:=False;
      chbxPromAdmin.Enabled:=False;
   End Else Begin
      chbxPromAdmin.Checked:=True;
      chbxPromAdmin.Enabled:=True;
   End;
end;

procedure TwMProvDiar.ilPromAdminCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMProvDiar.ilPromAdminEjecuta(Sender: TObject);
begin
   If Objeto.PromotorAdmon.FindKey([ilPromAdmin.Buffer])Then Begin
      chbxPromAdmin.Checked:=True;
      chbxPromAdmin.Enabled:=True;
      InterForma1.NextTab(edPromAdmin);
   End;
end;

procedure TwMProvDiar.edPromAsocExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edPromAsoc,True,'',True);
end;

procedure TwMProvDiar.btPromAsocClick(Sender: TObject);
begin
   Objeto.Promotor.ShowAll := True;
   If Objeto.Promotor.Busca Then Begin
      chbxPromAsoc.Checked:= True;
      chbxPromAsoc.Enabled:= True;
      InterForma1.NextTab(edPromAsoc);
   End;
end;

procedure TwMProvDiar.chbxPromAsocClick(Sender: TObject);
begin
   If not chbxPromAsoc.Checked Then Begin
      Objeto.Promotor.Active:=False;
      chbxPromAsoc.Checked:=False;
      chbxPromAsoc.Enabled:=False;
   End Else Begin
      chbxPromAsoc.Checked:=True;
      chbxPromAsoc.Enabled:=True;
   End;
end;

procedure TwMProvDiar.ilPromAsocCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMProvDiar.ilPromAsocEjecuta(Sender: TObject);
begin
   If Objeto.Promotor.FindKey([ilPromAsoc.Buffer])Then Begin
      chbxPromAsoc.Checked:=True;
      chbxPromAsoc.Enabled:=True;
      InterForma1.NextTab(edPromAsoc);
   End;
end;

procedure TwMProvDiar.sbExcelClick(Sender: TObject);
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

procedure TwMProvDiar.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
      cbxArchivo.Checked:=True;
      cbxArchivo.Enabled:=True;
   End Else Begin
      cbxArchivo.Checked:=False;
      cbxArchivo.Enabled:=False;
   End;
end;

procedure TwMProvDiar.cbxArchivoClick(Sender: TObject);
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

procedure TwMProvDiar.edPromAdminChange(Sender: TObject);
begin
    If Trim(edPromAdmin.Text)<>'' Then Begin
        chbxPromAdmin.Checked:=True;
        chbxPromAdmin.Enabled:=True;
    End Else Begin
        chbxPromAdmin.Checked:=False;
        chbxPromAdmin.Enabled:=False;
    End;
end;

procedure TwMProvDiar.edPromAsocChange(Sender: TObject);
begin
    If Trim(edPromAsoc.Text)<>'' Then Begin
        chbxPromAsoc.Checked:=True;
        chbxPromAsoc.Enabled:=True;
    End Else Begin
        chbxPromAsoc.Checked:=False;
        chbxPromAsoc.Enabled:=False;
    End;
end;

procedure TwMProvDiar.edACREDITADOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TwMProvDiar.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;

end;

procedure TwMProvDiar.chbxAcreditadoClick(Sender: TObject);
begin
    If not chbxAcreditado.Checked Then Begin
        Objeto.Acreditado.Active:=False;
        chbxAcreditado.Checked:=False;
        chbxAcreditado.Enabled:=False;
    End Else Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
    End;
End;

procedure TwMProvDiar.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMProvDiar.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;

end;

procedure TwMProvDiar.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMProvDiar.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMProvDiar.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMProvDiar.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMProvDiar.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

end.

