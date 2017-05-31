// Sistema         : Clase de TMColoca
// Fecha de Inicio : 01/10/2003
// Función forma   : Clase de TMColoca
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMDCartVda;
                          
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntGenCre,

IntPers,          //Persona
IntCrCredito,     //Disposición
IntParamCre,
Intempre,          //Empresa
IntUnNeg,          //Unidad Negocio/Suc
IntQrDiasCartVda,      //Reporte
IntMon,            //Moneda
IntCtto,          //Autorización
IntMFiraOpe     // Catalogo de operativas (garantias)
// generar o buscar al finit de presupeusto
;

Type
 TMDCartVda= class;

  TwMDCartVda=Class(TForm)
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
    Label1: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    chbxAcreditado: TCheckBox;
    SaveDialog1: TSaveDialog;
    edNbrArch: TEdit;
    sbExcel: TSpeedButton;
    Label4: TLabel;
    cbxArchivo: TCheckBox;
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
    lblCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btnCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    cbCVE_MONEDA: TCheckBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edDESC_ID_CREDITO: TEdit;
    chbxAutorizacion: TCheckBox;
    btCVE_PRODUCTO_CRE: TBitBtn;
    edDESC_PRODUCTO: TEdit;
    edID_CONTRATO: TEdit;
    btID_CONTRATO: TBitBtn;
    edDESC_AUTORIZACION: TEdit;
    btCTA_ORIGEN: TBitBtn;
    chbxproducto: TCheckBox;
    chbxPresupuesto: TCheckBox;
    btID_CREDITO: TBitBtn;
    edID_CREDITO: TEdit;
    edCVE_PRODUCTO: TEdit;
    edDESC_CAT_MINIMO: TEdit;
    ilID_CONTRATO: TInterLinkit;
    Label2: TLabel;
    chbxCatMinimo: TCheckBox;
    Label11: TLabel;
    btCVE_PRESUPUESTO: TBitBtn;
    edDESC_PRESUPUESTO: TEdit;
    cbID_CREDITO: TCheckBox;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    ilCVE_MONEDA: TInterLinkit;
    Label9: TLabel;
    edCVE_TIPO_GARANTIA: TEdit;
    btCVE_GARANTIA: TBitBtn;
    edDESC_GARANTIA: TEdit;
    ilTIPO_GARANTIA: TInterLinkit;
    chbxGarantia: TCheckBox;
    edCVE_CAT_MINIMO: TEdit;
    edCVE_PRESUPUESTO: TEdit;
    Label3: TLabel;
    edF_FIN: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    edRANGO_INICIO: TInterEdit;
    edRANGO_FIN: TInterEdit;
    chbxRango: TCheckBox;
    rgTipoCambio: TRadioGroup;
    rgResumen: TRadioGroup;
    Label10: TLabel;
    rgBancaria: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure chbxProductoClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure edACREDITADOExit(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure ilCreditoCapture(Sender: TObject; var Show: Boolean);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure cbID_CREDITOClick(Sender: TObject);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure btnCVE_MONEDAClick(Sender: TObject);
    procedure cbCVE_MONEDAClick(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure ilCVE_MONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilID_CONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure chbxAutorizacionClick(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure edID_CONTRATOExit(Sender: TObject);
    procedure btCVE_GARANTIAClick(Sender: TObject);
    procedure ilTIPO_GARANTIACapture(Sender: TObject; var Show: Boolean);
    procedure ilTIPO_GARANTIAEjecuta(Sender: TObject);
    procedure edCVE_TIPO_GARANTIAExit(Sender: TObject);
    procedure chbxGarantiaClick(Sender: TObject);
    procedure btCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure btCTA_ORIGENClick(Sender: TObject);
    procedure btCVE_PRESUPUESTOClick(Sender: TObject);
    procedure chbxPresupuestoClick(Sender: TObject);
    procedure chbxCatMinimoClick(Sender: TObject);
    procedure chbxRangoClick(Sender: TObject);
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
    Objeto : TMDCartVda;
end;
 TMDCartVda= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        Persona                  : TPersona;
        Credito                  : TCrCredito;//Disposición
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;
        Contrato                 : TContrato;
        TipoGarantia             : TMFiraOpe;
        //AreaNegocio            : TM;


        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TMDCartVda.Create( AOwner : TComponent );
begin Inherited;
      {$WARNINGS OFF}
      Persona := TPersona.Create(Self);
      {$WARNINGS ON}
      Persona.MasterSource := Self;

      {$WARNINGS OFF}
      Credito := TCrCredito.Create(Self);
      {$WARNINGS ON}
      Credito.MasterSource:=Self;

      {$WARNINGS OFF}
      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);
      {$WARNINGS ON}

      {$WARNINGS OFF}
      Moneda := TMoneda.Create(Self);
      {$WARNINGS ON}
      Moneda.MasterSource:=Self;

      Contrato := TContrato.Create(Self);
      {$WARNINGS ON}
      Contrato.MasterSource:=Self;

      TipoGarantia := TMFiraOpe.Create(Self);
      {$WARNINGS ON}
      TipoGarantia.MasterSource:=Self;

      UseQuery := False;
      HelpFile := 'InTMDCartVda.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMDCartVda.Destroy;
begin
   if Persona <> nil then
      Persona.Free;
   if Credito <> nil then
      Credito.Free;
   If Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   if Moneda <> nil then
      Moneda.Free;
   if Contrato <> nil then
      Contrato.Free;
   if TipoGarantia <> nil then
      TipoGarantia.Free;
   inherited;
end;


function TMDCartVda.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMDCartVda;
begin
   W:=TwMDCartVda.Create(Self);
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


Function TMDCartVda.InternalBusca:Boolean;
begin InternalBusca := False;
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMDCartVda.AsignaEmpresaSuc;
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

procedure TwMDCartVda.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      dtpF_Fin.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_FIN.text:=FormatDateTime('dd/mm/yyyy',dtpF_Fin.DateTime);

      edRANGO_INICIO.Text := '1';
      edRANGO_FIN.Text := '1';

      Objeto.Persona.Id_Persona.Control := edACREDITADO;
      Objeto.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
      Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      Objeto.Empresa.GetParams(Objeto);

      Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
      Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
      Objeto.UnidadNegocio.GetParams(Objeto);

      Objeto.Moneda.CVE_MONEDA.Control := edCVE_MONEDA;
      Objeto.Moneda.DESC_MONEDA.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);

      Objeto.Contrato.ID_CONTRATO.Control   := edID_CONTRATO;
      Objeto.Contrato.TITNOMBRE.Control := edDESC_AUTORIZACION;
      Objeto.Contrato.Titular.Nombre.Control  := edDESC_AUTORIZACION;
      Objeto.Contrato.GetParams(Objeto);

      Objeto.TipoGarantia.CVE_OPERATIVA.Control   := edCVE_TIPO_GARANTIA;
      Objeto.TipoGarantia.DESC_OPERATIVA.Control   := edDESC_GARANTIA;
      Objeto.TipoGarantia.GetParams(Objeto);

      AsignaEmpresaSuc;
end;

procedure TwMDCartVda.FormDestroy(Sender: TObject);
begin
    Objeto.Persona.Id_Persona.Control := nil;
    Objeto.Persona.Nombre.Control := nil;
    Objeto.Empresa.ID_Empresa.Control := Nil;
    Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
    Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
    Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
    Objeto.Moneda.CVE_MONEDA.Control := Nil;
    Objeto.Moneda.DESC_MONEDA.Control := Nil;
    Objeto.Contrato.ID_CONTRATO.Control := Nil;
    Objeto.Contrato.TITNOMBRE.Control := Nil;
    Objeto.Contrato.Titular.Nombre.Control := Nil;
    Objeto.TipoGarantia.CVE_OPERATIVA.Control := Nil;
    Objeto.TipoGarantia.DESC_OPERATIVA.Control := Nil;

end;

procedure TwMDCartVda.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMDCartVda.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMDCARTVDA_PREVI',True,True) then
    ImprimeReporte(True, grPreview );
end;

procedure TwMDCartVda.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMDCartVda.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Persona.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMDCartVda.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Persona.ShowAll := True;
   If Objeto.Persona.Busca Then Begin
        chbxAcreditado.Enabled:=True;   
        chbxAcreditado.Checked:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMDCartVda.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO,True,'',True);
end;

procedure TwMDCartVda.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMDCartVda.chbxProductoClick(Sender: TObject);
begin
   EnableCheckBox(chbxProducto);
   edCVE_PRODUCTO.Enabled := chbxProducto.Checked;

   IF NOT (edCVE_PRODUCTO.Enabled ) then Begin
      edCVE_PRODUCTO.Text := '';
      edDESC_PRODUCTO.Text := '';
   End;
end;

procedure TwMDCartVda.chbxAcreditadoClick(Sender: TObject);
begin
   EnableCheckBox(chbxAcreditado);
   Objeto.Persona.Active := chbxAcreditado.Checked;
end;

procedure TwMDCartVda.edACREDITADOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

Procedure TwMDCartVda.ImprimeReporte(bPreview:Boolean; grOpcion  : TGenRepOption );
Var
   vlError : String;
   iTipoCambio: Integer;
   sTipoCambio : String;
begin
   iTipoCambio:=rgTipoCambio.ItemIndex;
    case iTipoCambio of                                                       
        0: sTipoCambio:='MD';  //Mismo día
        1: sTipoCambio:='FR';  //FEcha Reporte
        2: sTipoCambio:='FM';  //FEcha Fin de Mes
    end;
   //limpia tabla temporal
   ClearTblReport( Objeto.Apli, vlError );
   //Genera reporte
       RepDiasCarVda( edF_FIN.Text, edACREDITADO.Text, edID_CREDITO.Text, edID_CONTRATO.Text, edCVE_PRESUPUESTO.Text,
                      edCVE_PRODUCTO.Text, EdIdEmpresa.Text , EdIDSucursal.Text, edCVE_MONEDA.Text, edCVE_CAT_MINIMO.Text,
                      edCVE_TIPO_GARANTIA.Text, edRANGO_INICIO.Text, edRANGO_FIN.Text, edNbrArch.Text, sTipoCambio,IntToStr(rgResumen.ItemIndex), IntToStr(rgBancaria.ItemIndex),
                      Objeto.Apli, bPreview, grOpcion, ''               );

      If Trim(edNbrArch.Text)<>'' Then Begin
         If bGenArch Then
           ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
         Else
           ShowMessage('No se generó el Archivo')
      End;

End;
procedure TwMDCartVda.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMDCARTVDA_IMPRI',True,True) then
    ImprimeReporte( False, grPrint );
end;

procedure TwMDCartVda.edID_CREDITOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CREDITO,True,'',True);
end;

procedure TwMDCartVda.btID_CREDITOClick(Sender: TObject);
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
             cbID_CREDITO.Enabled:=True;             
             cbID_CREDITO.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
    
end;

procedure TwMDCartVda.ilCreditoCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMDCartVda.sbExcelClick(Sender: TObject);
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

procedure TwMDCartVda.cbxArchivoClick(Sender: TObject);
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

procedure TwMDCartVda.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

Procedure TwMDCartVda.CambiaControl;
Begin
End;
procedure TwMDCartVda.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMDCartVda.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMDCartVda.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMDCartVda.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMDCartVda.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMDCartVda.cbID_CREDITOClick(Sender: TObject);
begin
   EnableCheckBox(cbID_CREDITO);
   edID_CREDITO.Enabled := cbID_CREDITO.Checked;

   IF NOT (edID_CREDITO.Enabled ) then Begin
      edID_CREDITO.Text := '';
      edDESC_ID_CREDITO.Text := '';
   End;
end;

procedure TwMDCartVda.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
  With Objeto Do
    Begin
    If MONEDA.FindKey([ilCVE_MONEDA.Buffer]) Then
       Begin
       cbCVE_MONEDA.Checked:= True;
       cbCVE_MONEDA.Enabled:= True;
       InterForma1.NextTab(edCVE_MONEDA);
       End;
    End;
end;

procedure TwMDCartVda.btnCVE_MONEDAClick(Sender: TObject);
begin
  With Objeto Do
    Begin
    Moneda.ShowAll := True;
    If Moneda.Busca Then
       Begin
       cbCVE_MONEDA.Enabled:= True;       
       cbCVE_MONEDA.Checked:= True;
       InterForma1.NextTab(edCVE_MONEDA);
       End;
    End;
end;

procedure TwMDCartVda.cbCVE_MONEDAClick(Sender: TObject);
begin
   EnableCheckBox(cbCVE_MONEDA);
   Objeto.Moneda.Active := cbCVE_MONEDA.Checked;
end;

procedure TwMDCartVda.btID_CONTRATOClick(Sender: TObject);
begin
    Objeto.Contrato.ShowAll := True;
    If Objeto.Contrato.Busca Then Begin
        chbxAutorizacion.Enabled:=True;    
        chbxAutorizacion.Checked:=True;
        InterForma1.NextTab(edID_CONTRATO);
    End;
end;

procedure TwMDCartVda.ilCVE_MONEDACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMDCartVda.ilID_CONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMDCartVda.ilID_CONTRATOEjecuta(Sender: TObject);
begin
    If Objeto.Contrato.FindKey([ilID_CONTRATO.Buffer]) Then Begin
        chbxAutorizacion.Checked:=True;
        chbxAutorizacion.Enabled:=True;
        InterForma1.NextTab(edID_CONTRATO);
    End;
end;

procedure TwMDCartVda.chbxAutorizacionClick(Sender: TObject);
begin
   EnableCheckBox(chbxAutorizacion);
   Objeto.Contrato.Active := chbxAutorizacion.Checked;
end;

procedure TwMDCartVda.edCVE_MONEDAExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
end;

procedure TwMDCartVda.edID_CONTRATOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edID_CONTRATO,True,'',True);
end;

procedure TwMDCartVda.btCVE_GARANTIAClick(Sender: TObject);
begin
   Objeto.TipoGarantia.ShowAll := True;
    If Objeto.TipoGarantia.Busca Then Begin
        chbxGarantia.Enabled:=True;    
        chbxGarantia.Checked:=True;
        InterForma1.NextTab(edCVE_TIPO_GARANTIA);
    End;

end;

procedure TwMDCartVda.ilTIPO_GARANTIACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMDCartVda.ilTIPO_GARANTIAEjecuta(Sender: TObject);
begin
    If Objeto.TipoGarantia.FindKey([ilTIPO_GARANTIA.Buffer]) Then Begin
        chbxGarantia.Checked:=True;
        chbxGarantia.Enabled:=True;
        InterForma1.NextTab(edCVE_TIPO_GARANTIA);
    End;
end;

procedure TwMDCartVda.edCVE_TIPO_GARANTIAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_TIPO_GARANTIA,True,'',True);
end;

procedure TwMDCartVda.chbxGarantiaClick(Sender: TObject);
begin
   EnableCheckBox(chbxGarantia);
   Objeto.TipoGarantia.Active := chbxGarantia.Checked;
end;

procedure TwMDCartVda.btCVE_PRODUCTO_CREClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('CONSCRPROD.IT','I');
      Try
        If T.Execute Then
           Begin
             edCVE_PRODUCTO.Text := T.DameCampo(0);
             edDESC_PRODUCTO.Text := T.DameCampo(1);
             chbxproducto.Enabled:=True;             
             chbxproducto.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TwMDCartVda.btCTA_ORIGENClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('ICRCATMIN.IT','I');
      Try
        If T.Execute Then
           Begin
             edCVE_CAT_MINIMO.Text := T.DameCampo(0);
             edDESC_CAT_MINIMO.Text := T.DameCampo(1);
             chbxCatMinimo.Enabled:=True;             
             chbxCatMinimo.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TwMDCartVda.btCVE_PRESUPUESTOClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('ICRPRESUP.IT','I');
      Try
        If T.Execute Then
           Begin
             edCVE_PRESUPUESTO.Text := T.DameCampo(0);
             edDESC_PRESUPUESTO.Text := T.DameCampo(1);
             chbxPresupuesto.Enabled:=True;             
             chbxPresupuesto.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;

end;

procedure TwMDCartVda.chbxPresupuestoClick(Sender: TObject);
begin
   EnableCheckBox(chbxPresupuesto);
   edCVE_PRESUPUESTO.Enabled := chbxPresupuesto.Checked;

   IF NOT (edCVE_PRESUPUESTO.Enabled ) then Begin
      edCVE_PRESUPUESTO.Text := '';
      edDESC_PRESUPUESTO.Text := '';
   End;
end;

procedure TwMDCartVda.chbxCatMinimoClick(Sender: TObject);
begin
   EnableCheckBox(chbxCatMinimo);
   edCVE_CAT_MINIMO.Enabled := chbxCatMinimo.Checked;

   IF NOT (edCVE_CAT_MINIMO.Enabled ) then Begin
      edCVE_CAT_MINIMO.Text := '';
      edDESC_CAT_MINIMO.Text := '';
   End;
end;

procedure TwMDCartVda.chbxRangoClick(Sender: TObject);
begin
//   EnableCheckBox(chbxRango);
   edRANGO_INICIO.Enabled := chbxRango.Checked;
   edRANGO_FIN.Enabled := chbxRango.Checked;
   
   IF NOT (edRANGO_INICIO.Enabled ) then Begin
      edRANGO_INICIO.Text := '1';
      edRANGO_FIN.Text := '0';
   End;
end;

end.

