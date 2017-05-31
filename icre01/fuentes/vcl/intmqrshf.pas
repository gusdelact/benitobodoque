// Sistema         : Clase de TMFndColoc
// Fecha de Inicio : 18/01/2005
// Función forma   : Clase de TMFndColoc
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMQrSHF;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntCrProduct,     // Producto de crédito
IntMProdGpo,      // Grupo Producto de crédito
IntMon,           // Moneda
IntCrAcredit,     // Acreditado
IntCrCto,         // Autorización
IntMPers,         // PromotorAsoc
IntCrCredito,     // Disposición
IntParamCre,      // Parametros Crédito
Intempre,         // Empresa
IntUnNeg,         // Unidad Negocio/Suc
IntQrSHF          // QuickReport Reporte Garantía SHF
;

Type
 TMQrSHF = class;

  TwMQrSHF=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    ilCVE_MONEDA: TInterLinkit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
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
    lbCVE_PRODUCTO_CRE: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    ilCVE_PRODUCTO_CRE: TInterLinkit;
    chbxProducto: TCheckBox;
    SaveDialog1: TSaveDialog;
    edNbrArch: TEdit;
    sbExcel: TSpeedButton;
    Label4: TLabel;
    cbxArchivo: TCheckBox;
    lbCVE_PRODUCTO_GPO: TLabel;
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
    lbID_ACREDITADO: TLabel;
    Label9: TLabel;
    edID_ACREDITADO: TEdit;
    edID_CONTRATO: TEdit;
    btID_CONTRATO: TBitBtn;
    btID_ACREDITADO: TBitBtn;
    ilID_ACREDITADO: TInterLinkit;
    ilID_CONTRATO: TInterLinkit;
    edDESC_ACREDITADO: TEdit;
    edDESC_CONTRATO: TEdit;
    cbxID_ACREDITADO: TCheckBox;
    cbxID_CONTRATO: TCheckBox;
    edF_Inicio: TEdit;
    dtpF_Inicio: TInterDateTimePicker;
    lbLiqF_INICIO: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilCVE_MONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_CRECapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
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
    procedure ilID_ACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_CONTRATOCapture(Sender: TObject;
      var Show: Boolean);
    procedure ilID_ACREDITADOEjecuta(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure cbxID_ACREDITADOClick(Sender: TObject);
    procedure cbxID_CONTRATOClick(Sender: TObject);
    procedure btID_ACREDITADOClick(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
  private
    { Private declarations }
    Procedure MonedaEjecuta(CveMoneda: String; DoNextTab : Boolean );
    Procedure ImprimeReporte(bPreview:Boolean);
    Procedure CambiaControl;
    Procedure AsignaEmpresaSuc;
  public
    { Public declarations }
    Objeto : TMQrSHF;
  end;

  TMQrSHF= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        TIPO_REPORTE             : TInterCampo;
        SUB_TIPO_REP             : TInterCampo;
        //
        GpoProd                  : TMProdGpo;
        Producto                 : TCrProduct;
        Moneda                   : TMoneda;
        Acreditado               : TCrAcredit;        

        UnidadNegocio            : TUnNegocio;

        Empresa                  : TEmpresa;
        ParamCre                 : TParamCre;
        Autorizacion             : TCrCto;
        
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}


constructor TMQrSHF.Create( AOwner : TComponent );
begin
      Inherited;
      {$WARNINGS OFF} GpoProd:= TMProdGpo.Create(Self); {$WARNINGS ON}
      GpoProd.MasterSource:=Self;
      GpoProd.FieldByName('CVE_PRODUCTO_GPO').MasterField  := 'CVE_PRODUCTO_GPO';
      //
      {$WARNINGS OFF} Producto :=  TCrProduct.Create(Self); {$WARNINGS ON}
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField := 'CVE_PRODUCTO_CRE';
      //
      {$WARNINGS OFF} Moneda := TMoneda.Create(Self); {$WARNINGS ON}
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField := 'CVE_MONEDA';
      //
      {$WARNINGS OFF} Acreditado := TCrAcredit.Create(Self); {$WARNINGS ON}
      Acreditado.MasterSource:=Self;
      Acreditado.FieldByName('ID_ACREDITADO').MasterField := 'ID_ACREDITADO';
      //
      {$WARNINGS OFF} Autorizacion := TCrCto.Create(Self); {$WARNINGS ON}
      Autorizacion.MasterSource:=Self;
      Autorizacion.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';
      //
      {$WARNINGS OFF} Empresa := TEmpresa.Create(Self); {$WARNINGS ON}
      {$WARNINGS OFF} UnidadNegocio := TUnNegocio.Create(Self); {$WARNINGS ON}
      //
      UseQuery := False;
      HelpFile := 'InMFndColoc.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMQrSHF.Destroy;
begin
   If Assigned(GpoProd ) Then GpoProd.Free;
   If Assigned(Producto) Then Producto.Free;
   If Assigned(Moneda  ) Then Moneda.Free;
   If Assigned(Acreditado) Then Acreditado.Free;
   If Assigned(Autorizacion) Then Acreditado.Free;

   If Assigned(Empresa ) then Empresa.free;
   If Assigned(UnidadNegocio ) then Empresa.free;
   Inherited;
end;


function TMQrSHF.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMQrSHF;
begin
   W := TwMQrSHF.Create(Self);
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

Function TMQrSHF.InternalBusca:Boolean;
begin
  InternalBusca := False;
end;
(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMQrSHF.AsignaEmpresaSuc;
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

Procedure TwMQrSHF.CambiaControl;
Begin
   cbxCVE_PRODUCTO_GPO.Checked:=True;
   cbxCVE_PRODUCTO_GPO.Enabled:=True;
End;

procedure TwMQrSHF.MonedaEjecuta(CveMoneda: String; DoNextTab : Boolean );
begin
    If Objeto.Moneda.FindKey([CveMoneda]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;


procedure TwMQrSHF.FormShow(Sender: TObject);
begin
   //PINTA DATOS DEL PANEL INFERIOR
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   dtpF_Inicio.DateTime:= Objeto.Apli.DameFechaEmpresa;
   edF_Inicio.text     := FormatDateTime('dd/mm/yyyy', dtpF_Inicio.DateTime);

   With Objeto Do
     Begin
     GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
     GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
     GpoProd.GetParams(Objeto);

     Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
     Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;
     Producto.GetParams(Objeto);
     edDESC_PRODUCTO1.Hint := Producto.DESC_C_PRODUCTO.AsString;
     edDESC_PRODUCTO1.ShowHint := True;

     Moneda.Cve_Moneda.Control := edCVE_MONEDA;
     Moneda.Desc_Moneda.Control := edDESC_MONEDA;
     Moneda.GetParams(Objeto);
     edDESC_MONEDA.Hint := Moneda.Desc_Moneda.AsString;
     edDESC_MONEDA.ShowHint := True;

     Acreditado.ID_ACREDITADO.Control  := edID_ACREDITADO;
     Acreditado.Persona.Nombre.Control := edDESC_ACREDITADO;
     Acreditado.GetParams(Objeto);

     Autorizacion.ID_CONTRATO.Control:= edID_CONTRATO;
     Autorizacion.Acreditado.Persona.Nombre.Control := edDESC_CONTRATO;
     Autorizacion.GetParams(Objeto);

     Empresa.ID_Empresa.Control := EdIdEmpresa;
     Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
     Empresa.GetParams(Objeto);

     UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
     UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
     UnidadNegocio.GetParams(Objeto);

     AsignaEmpresaSuc;
     End;
end;

procedure TwMQrSHF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  With Objeto Do
    Begin
    GpoProd.CVE_PRODUCTO_GPO.Control:= Nil;
    GpoProd.DESC_C_PROD_GPO.Control:= Nil;

    Producto.CVE_PRODUCTO_CRE.Control := Nil;
    Producto.DESC_C_PRODUCTO.Control := Nil;

    Moneda.Cve_Moneda.Control := Nil;
    Moneda.Desc_Moneda.Control := Nil;

    Acreditado.ID_ACREDITADO.Control  := Nil;
    Acreditado.Persona.Nombre.Control := Nil;

    Autorizacion.ID_CONTRATO.Control:= Nil;
    Autorizacion.Acreditado.Persona.Nombre.Control := Nil;

    Empresa.ID_Empresa.Control := Nil;
    Empresa.PersonaMoral.Nombre.Control := Nil;

    UnidadNegocio.Id_Entidad.Control := Nil;
    UnidadNegocio.Desc_Entidad.Control := Nil;
    End;
  Action := caFree;
end;

procedure TwMQrSHF.edCVE_PRODUCTO_GPOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edCVE_PRODUCTO_GPO,True,'',True);
end;

procedure TwMQrSHF.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMQrSHF.ilCVE_PRODUCTO_GPOCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMQrSHF.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMQrSHF.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   If Not cbxCVE_PRODUCTO_GPO.Checked Then Begin
      Objeto.GpoProd.Active:=False;
      cbxCVE_PRODUCTO_GPO.Checked:=False;
      cbxCVE_PRODUCTO_GPO.Enabled:=False;
   End Else Begin
      cbxCVE_PRODUCTO_GPO.Checked:=True;
      cbxCVE_PRODUCTO_GPO.Enabled:=True;
   End;
end;


procedure TwMQrSHF.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
end;

procedure TwMQrSHF.btPRODUCTOClick(Sender: TObject);
begin
    Objeto.Producto.ShowAll := True;
    if Objeto.Producto.Busca Then
        Begin
        chbxProducto.Checked:= True;
        chbxProducto.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
        End;
end;

procedure TwMQrSHF.ilCVE_PRODUCTO_CRECapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMQrSHF.ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilCVE_PRODUCTO_CRE.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TwMQrSHF.chbxProductoClick(Sender: TObject);
begin
    If Not chbxProducto.Checked Then
       Begin
       Objeto.Producto.Active:=False;
       chbxProducto.Checked:=False;
       chbxProducto.Enabled:=False;
       End
    Else
       Begin
       chbxProducto.Checked:=True;
       chbxProducto.Enabled:=True;
       End;
end;

procedure TwMQrSHF.edCVE_MONEDAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
end;

procedure TwMQrSHF.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMQrSHF.chbxMonedaClick(Sender: TObject);
begin
    If Not chbxMoneda.Checked Then
       Begin
       Objeto.Moneda.Active := False;
       chbxMoneda.Checked   := False;
       chbxMoneda.Enabled   := False;
       End
    Else
       Begin
       chbxMoneda.Checked:= True;
       chbxMoneda.Enabled:= True;
       End;
end;

procedure TwMQrSHF.ilCVE_MONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMQrSHF.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
  MonedaEjecuta( ilCVE_MONEDA.Buffer, True );
end;

procedure TwMQrSHF.btID_ACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then
      Begin
      cbxID_ACREDITADO.Checked:=True;
      cbxID_ACREDITADO.Enabled:=True;
      InterForma1.NextTab(edID_ACREDITADO);
      End;
end;

procedure TwMQrSHF.ilID_ACREDITADOCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMQrSHF.ilID_ACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Acreditado.FindKey([ilID_ACREDITADO.Buffer]) Then
      Begin
      cbxID_ACREDITADO.Checked:=True;
      cbxID_ACREDITADO.Enabled:=True;      
      InterForma1.NextTab(edID_ACREDITADO);
      End;
end;

procedure TwMQrSHF.cbxID_ACREDITADOClick(Sender: TObject);
begin
   If not cbxID_ACREDITADO.Checked Then
      Begin
      Objeto.Acreditado.Active:=False;
      cbxID_ACREDITADO.Checked:=False;
      cbxID_ACREDITADO.Enabled:=False;
      End
   Else
      Begin
      cbxID_ACREDITADO.Checked:=True;
      cbxID_ACREDITADO.Enabled:=True;
      End;
end;

procedure TwMQrSHF.btID_CONTRATOClick(Sender: TObject);
begin
   Objeto.Autorizacion.ShowAll := True;
   If Objeto.Autorizacion.Busca Then
      Begin
      cbxID_CONTRATO.Checked:=True;
      cbxID_CONTRATO.Enabled:=True;
      InterForma1.NextTab(edID_CONTRATO);
      End;
end;

procedure TwMQrSHF.ilID_CONTRATOCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMQrSHF.ilID_CONTRATOEjecuta(Sender: TObject);
begin
   If Objeto.Autorizacion.FindKey([Trim(ilID_CONTRATO.Buffer), 0]) Then Begin
      cbxID_CONTRATO.Checked:=True;
      cbxID_CONTRATO.Enabled:=True;
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TwMQrSHF.cbxID_CONTRATOClick(Sender: TObject);
begin
   If not cbxID_CONTRATO.Checked Then
      Begin
      Objeto.Autorizacion.Active:=False;
      cbxID_CONTRATO.Checked:=False;
      cbxID_CONTRATO.Enabled:=False;
      End
   Else
      Begin
      cbxID_CONTRATO.Checked:=True;
      cbxID_CONTRATO.Enabled:=True;
      End;
end;
//
procedure TwMQrSHF.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMQrSHF.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMQrSHF.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMQrSHF.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMQrSHF.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMQrSHF.sbExcelClick(Sender: TObject);
var sExt:String;
begin
  If SaveDialog1.Execute Then Begin
      sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
      If  UpperCase(sExt)= '.XLS' Then
         edNbrArch.Text := SaveDialog1.FileName
      Else
         edNbrArch.Text := SaveDialog1.FileName + '.XLS';
  End Else
    edNbrArch.Text := '';
end;

procedure TwMQrSHF.cbxArchivoClick(Sender: TObject);
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

procedure TwMQrSHF.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

Procedure TwMQrSHF.ImprimeReporte(bPreview:Boolean);
Var
    sSituacion, sGpoProd, sProcam, sOperDD :String;
    iSit, iNafin, iDescDoc: Integer;
    dIntereses : Double;
begin
 With Objeto Do
   Begin
      ReporteCreditosConSHF( Apli, bPreview, edNbrArch.Text,
                             StrToDate(edF_Inicio.Text), GpoProd.CVE_PRODUCTO_GPO.AsString, Producto.CVE_PRODUCTO_CRE.AsString,
                             Moneda.CVE_MONEDA.AsInteger, Acreditado.ID_ACREDITADO.AsInteger, Autorizacion.ID_CONTRATO.AsInteger,
                             Empresa.ID_EMPRESA.AsInteger, UnidadNegocio.ID_ENTIDAD.AsInteger
                          );

      If (Trim(edNbrArch.Text)<>'') Then 
         ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente');
    End;
End;

procedure TwMQrSHF.InterForma1BtnImprimirClick(Sender: TObject);
begin
    ImprimeReporte(False);
end;

procedure TwMQrSHF.InterForma1BtnPreviewClick(Sender: TObject);
begin
    ImprimeReporte(True);
end;

end.

