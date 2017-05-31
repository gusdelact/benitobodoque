// Sistema         : Clase de TMColoca
// Fecha de Inicio : 01/10/2003
// Función forma   : Clase de TMColoca
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMEdoMovto;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntGenCre,
IntPers,     //Persona
IntMPers,         //Promotores
IntCrGrupEco,     //Grupo Económico
IntCrProduct,     //Producto de crédito
IntMProdGpo,      //Grupo Producto de crédito
IntParamCre,
Intempre,          //Empresa
IntUnNeg,          //Unidad Negocio/Suc
IntQrEdoMovto      //Reporte
;

Type
 TMEdoMovto= class;

  TwMEdoMovto=Class(TForm)
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
    SaveDialog1: TSaveDialog;
    edNbrArch: TEdit;
    sbExcel: TSpeedButton;
    Label4: TLabel;
    cbxArchivo: TCheckBox;
    Label5: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edNOM_CVE_PRODUCTO_GPO: TEdit;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
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
    Label8: TLabel;
    edCVE_GRUPO_ECO: TEdit;
    btCVE_GRUPO_ECO: TBitBtn;
    edDESC_AGRUPO_ECO: TEdit;
    ilCVE_GRUPO_ECO: TInterLinkit;
    cbCVE_GRUPO_ECO: TCheckBox;
    Label2: TLabel;
    btID_CREDITO: TBitBtn;
    edID_CREDITO: TEdit;
    edDESC_ID_CREDITO: TEdit;
    cbID_CREDITO: TCheckBox;
    cbDiasImpagado: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btPROMOTORClick(Sender: TObject);
    procedure ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROMOTOREjecuta(Sender: TObject);
    procedure edID_PROMOTORExit(Sender: TObject);
    procedure chbxPromotorClick(Sender: TObject);
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
    procedure btPROM_ADMONClick(Sender: TObject);
    procedure ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
    procedure ilPromAdmonEjecuta(Sender: TObject);
    procedure edID_PROMExit(Sender: TObject);
    procedure chbxPromAmonClick(Sender: TObject);
    procedure edID_PROMOTORChange(Sender: TObject);
    procedure edID_PROMChange(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure edCVE_PRODUCTO_GPOExit(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure btCVE_GRUPO_ECOClick(Sender: TObject);
    procedure ilCVE_GRUPO_ECOEjecuta(Sender: TObject);
    procedure cbCVE_GRUPO_ECOClick(Sender: TObject);
    procedure cbID_CREDITOClick(Sender: TObject);
    private
    { Private declarations }
       //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
       Procedure ImprimeReporte(bPreview:Boolean; grOpcion  : TGenRepOption );
       //Procedure ImprimeReporte(bPreview:Boolean);
       //</LOLS>
       Procedure CambiaControl;
       Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMEdoMovto;
end;
 TMEdoMovto= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        Persona                  : TPersona;
        Promotor                 : TMPersona; //Promotor Responsable
        PromotorAdmon            : TMPersona; //Promotor Admon
        CrGrupEco                : TCrGrupEco;
        Producto                 : TCrProduct;
        GpoProd                  : TMProdGpo;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TMEdoMovto.Create( AOwner : TComponent );
begin Inherited;

      Persona := TPersona.Create(Self);
      Persona.MasterSource := Self;

      Promotor := TMPersona.Create(Self);
      Promotor.FilterBy := fbTMPersonaEmpleado;
      Promotor.MasterSource := Self;
      Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      PromotorAdmon := TMPersona.Create(Self);
      PromotorAdmon.FilterBy := fbTMPersonaEmpleado;
      PromotorAdmon.MasterSource := Self;
      PromotorAdmon.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      CrGrupEco:= TCrGrupEco.Create(Self);
      CrGrupEco.MasterSource:=Self;

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;

      GpoProd:= TMProdGpo.Create(Self);
      GpoProd.MasterSource:=Self;

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      UseQuery := False;
      HelpFile := 'InTMEdoMovto.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMEdoMovto.Destroy;
begin

   if Persona <> nil then
      Persona.Free;
   if Promotor <> nil then
      Promotor.Free;
   if PromotorAdmon <> nil then
      PromotorAdmon.Free;
   If CrGrupEco <> Nil Then
      CrGrupEco.Free;
   if Producto <> nil then
      Producto.Free;
   If GpoProd <> Nil Then
      GpoProd.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   inherited;
end;


function TMEdoMovto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMEdoMovto;
begin
   W:=TwMEdoMovto.Create(Self);
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


Function TMEdoMovto.InternalBusca:Boolean;
begin InternalBusca := False;
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMEdoMovto.AsignaEmpresaSuc;
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

procedure TwMEdoMovto.FormShow(Sender: TObject);
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

      Objeto.Persona.Id_Persona.Control := edACREDITADO;
      Objeto.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

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

      Objeto.CrGrupEco.CVE_GRUPO_ECO.Control := edCVE_GRUPO_ECO;
      Objeto.CrGrupEco.DESC_AGRUPO_ECO.Control := edDESC_AGRUPO_ECO;

      Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;
      Objeto.Producto.GetParams(Objeto);
      edDESC_PRODUCTO1.Hint := Objeto.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO1.ShowHint := True;

      Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
      Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
      Objeto.GpoProd.GetParams(Objeto);

      Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
      Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      Objeto.Empresa.GetParams(Objeto);

      Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
      Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
      Objeto.UnidadNegocio.GetParams(Objeto);
      AsignaEmpresaSuc;

end;

procedure TwMEdoMovto.FormDestroy(Sender: TObject);
begin
    Objeto.Persona.Id_Persona.Control := nil;
    Objeto.Persona.Nombre.Control := nil;
    Objeto.Promotor.Nombre.Control :=nil;
    Objeto.Promotor.Id_Persona.Control :=nil;
    Objeto.PromotorAdmon.Nombre.Control :=nil;
    Objeto.PromotorAdmon.Id_Persona.Control :=nil;
    Objeto.CrGrupEco.CVE_GRUPO_ECO.Control :=Nil;
    Objeto.CrGrupEco.DESC_AGRUPO_ECO.Control :=Nil;
    Objeto.Producto.CVE_PRODUCTO_CRE.Control := nil;
    Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
    Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= nil;
    Objeto.GpoProd.DESC_C_PROD_GPO.Control:= nil;
    Objeto.Empresa.ID_Empresa.Control := Nil;
    Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
    Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
    Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMEdoMovto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMEdoMovto.btPROMOTORClick(Sender: TObject);
begin
    Objeto.Promotor.ShowAll := True;
    If Objeto.Promotor.Busca Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMEdoMovto.ilPROMOTORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMEdoMovto.ilPROMOTOREjecuta(Sender: TObject);
begin
    If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMEdoMovto.edID_PROMOTORExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_PROMOTOR,True,'',True);
end;

procedure TwMEdoMovto.chbxPromotorClick(Sender: TObject);
begin
   EnableCheckBox(chbxPromotor);
   Objeto.Promotor.Active := chbxPromotor.Checked;
end;

procedure TwMEdoMovto.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMEDOMOVTO_PREVI',True,True) then
      ImprimeReporte(True, grPreview );
end;

procedure TwMEdoMovto.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMEdoMovto.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Persona.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMEdoMovto.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Persona.ShowAll := True;
   If Objeto.Persona.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMEdoMovto.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
end;

procedure TwMEdoMovto.btPRODUCTOClick(Sender: TObject);
begin
   if Objeto.Persona.Cve_Per_Juridica.AsString = 'PF' then
   Begin
      Objeto.Producto.BuscaWhereString:= ' CR_PRODUCTO.B_PER_FISICA = '
                                       + #39 + 'V' + #39
                                       + ' AND CR_PRODUCTO.SIT_PRODUCTO ='
                                       + #39 + 'AC' + #39 ;
      Objeto.Producto.FilterString := Objeto.Producto.BuscaWhereString;
   end
   else if Objeto.Persona.Cve_Per_Juridica.AsString = 'PM' then
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

procedure TwMEdoMovto.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMEdoMovto.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;


procedure TwMEdoMovto.chbxProductoClick(Sender: TObject);
begin
   EnableCheckBox(chbxProducto);
   Objeto.Producto.Active := chbxProducto.Checked;
end;

procedure TwMEdoMovto.chbxAcreditadoClick(Sender: TObject);
begin
   EnableCheckBox(chbxAcreditado);
   Objeto.Persona.Active := chbxAcreditado.Checked;
end;

procedure TwMEdoMovto.edACREDITADOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TwMEdoMovto.btPROM_ADMONClick(Sender: TObject);
begin
    Objeto.PromotorAdmon.ShowAll := True;
    If Objeto.PromotorAdmon.Busca Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TwMEdoMovto.ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMEdoMovto.ilPromAdmonEjecuta(Sender: TObject);
begin
    If Objeto.PromotorAdmon.FindKey([ilPromAdmon.Buffer]) Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TwMEdoMovto.edID_PROMExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_PROM,True,'',True);
end;

procedure TwMEdoMovto.chbxPromAmonClick(Sender: TObject);
begin
   EnableCheckBox(chbxPromAmon);
   Objeto.PromotorAdmon.Active := chbxPromAmon.Checked;
end;

procedure TwMEdoMovto.edID_PROMOTORChange(Sender: TObject);
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

procedure TwMEdoMovto.edID_PROMChange(Sender: TObject);
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

Procedure TwMEdoMovto.ImprimeReporte(bPreview:Boolean; grOpcion  : TGenRepOption );
Var
    sSituacion, sGpoProd, sProcam, sOperDD, sTipoDisp :String;
    iSit, iNafin, iDescDoc, iTipoDisp: Integer;
    dIntereses : Double;
begin
    RepEdoMovto(  edF_Inicio.Text        , edF_Fin.Text           ,     edACREDITADO.Text      ,
                  edID_CREDITO.Text      , edID_PROMOTOR.Text     ,     edID_PROM.Text         ,
                  edCVE_GRUPO_ECO.Text   , edCVE_PRODUCTO_CRE.Text,     edCVE_PRODUCTO_GPO.Text,
                  EdIdEmpresa.Text       , EdIDSucursal.Text      ,     edNbrArch.Text         ,
                  cbDiasImpagado.Checked , Objeto.Apli            ,     bPreview               );

    If Trim(edNbrArch.Text)<>'' Then Begin
       If bGenArch Then
         ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
       Else
         ShowMessage('No se generó el Archivo')
    End;

End;
procedure TwMEdoMovto.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMEDOMOVTO_IMPRI',True,True) then
    ImprimeReporte( False, grPrint );
end;

procedure TwMEdoMovto.edID_CREDITOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CREDITO,True,'',True);
end;

procedure TwMEdoMovto.btID_CREDITOClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('ICRDIMCR.IT','I');
      Try
        If T.Execute Then
           Begin
             edID_CREDITO.Text := T.DameCampo(0);
             edDESC_ID_CREDITO.Text := T.DameCampo(1);
             cbID_CREDITO.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TwMEdoMovto.sbExcelClick(Sender: TObject);
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

procedure TwMEdoMovto.cbxArchivoClick(Sender: TObject);
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

procedure TwMEdoMovto.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TwMEdoMovto.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   EnableCheckBox(cbxCVE_PRODUCTO_GPO);
   Objeto.GpoProd.Active := cbxCVE_PRODUCTO_GPO.Checked;
end;

procedure TwMEdoMovto.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMEdoMovto.ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMEdoMovto.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

Procedure TwMEdoMovto.CambiaControl;
Begin
   cbxCVE_PRODUCTO_GPO.Checked:=True;
   cbxCVE_PRODUCTO_GPO.Enabled:=True;
End;
procedure TwMEdoMovto.edCVE_PRODUCTO_GPOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_GPO,True,'',True);
end;

procedure TwMEdoMovto.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMEdoMovto.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMEdoMovto.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMEdoMovto.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMEdoMovto.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMEdoMovto.btCVE_GRUPO_ECOClick(Sender: TObject);
begin
   Objeto.CrGrupEco.ShowAll := True;
   if Objeto.CrGrupEco.Busca then Begin
      cbCVE_GRUPO_ECO.Checked:= True;
      cbCVE_GRUPO_ECO.Enabled:= True;
   End;
end;

procedure TwMEdoMovto.ilCVE_GRUPO_ECOEjecuta(Sender: TObject);
begin
   If Objeto.CrGrupEco.FindKey([ilCVE_GRUPO_ECO.Buffer]) Then Begin
      cbCVE_GRUPO_ECO.Checked:=True;
      cbCVE_GRUPO_ECO.Enabled:=True;
   End;
end;

procedure TwMEdoMovto.cbCVE_GRUPO_ECOClick(Sender: TObject);
begin
   EnableCheckBox(cbCVE_GRUPO_ECO);
   Objeto.CrGrupEco.Active := cbCVE_GRUPO_ECO.Checked;
end;

procedure TwMEdoMovto.cbID_CREDITOClick(Sender: TObject);
begin
   EnableCheckBox(cbID_CREDITO);
   edID_CREDITO.Enabled := cbID_CREDITO.Checked;

   IF NOT (edID_CREDITO.Enabled ) then Begin
      edID_CREDITO.Text := '';
      edDESC_ID_CREDITO.Text := '';
   End;
end;

end.

