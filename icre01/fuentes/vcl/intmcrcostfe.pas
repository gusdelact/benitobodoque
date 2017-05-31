// Sistema         :
// Fecha de Inicio :
// Función forma   :
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMCrCostFe;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,InterEdit,

IntParamCre,      //Parámetros Crédito
IntCrAcredit,     //Acreditado
IntCrCredito,     //Disposición
IntQrCostFeg,     //Reporte
Intempre,         //Empresa
IntUnNeg          //Unidad Negocio/Suc
;

Type
 TMCrCostFe= class;

  TwMCrCostFe=Class(TForm)
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
    Label2: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    chbxAcreditado: TCheckBox;
    Label7: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    Label1: TLabel;
    edF_Ini_Vto: TEdit;
    dtpF_Ini_Vto: TInterDateTimePicker;
    edF_Fin_Vto: TEdit;
    dtpF_Fin_Vto: TInterDateTimePicker;
    chbxFVencimiento: TCheckBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edF_Ini_Pag: TEdit;
    dtpF_Ini_Pag: TInterDateTimePicker;
    edF_Fin_Pag: TEdit;
    dtpF_Fin_Pag: TInterDateTimePicker;
    chbxFPago: TCheckBox;
    Label5: TLabel;
    edDisposicion: TEdit;
    btDisposicion: TBitBtn;
    ilDisposicion: TInterLinkit;
    edNomDisposicion: TEdit;
    cbxDisposicion: TCheckBox;
    rgSituacion: TRadioGroup;
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
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure btDisposicionClick(Sender: TObject);
    procedure cbxDisposicionClick(Sender: TObject);
    procedure ilDisposicionCapture(Sender: TObject; var Show: Boolean);
    procedure ilDisposicionEjecuta(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure chbxFVencimientoClick(Sender: TObject);
    procedure chbxFPagoClick(Sender: TObject);
    private
    { Private declarations }
     procedure EnableCheckBox(var CheckBox : TCheckBox);
     procedure ImprimeReporte(bPreview : Boolean);
     Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMCrCostFe;
    end;

 TMCrCostFe= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CrCredito               : TCrCredito;
        ParamCre                : TParamCre;
        Acreditado              : TCrAcredit;
        UnidadNegocio           : TUnNegocio;
        Empresa                 : TEmpresa;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMCrCostFe.Create( AOwner : TComponent );
begin Inherited;
      CrCredito := TCrCredito.Create(Self);
      CrCredito.MasterSource:=Self;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      StpName  := ' ';
      UseQuery := False;
      HelpFile := '';
      ShowMenuReporte:=True;
end;

Destructor TMCrCostFe.Destroy;
begin
   If CrCredito <> nil then
      CrCredito.Free;
   //end if;
   if Acreditado <> nil then
      Acreditado.Free;
   //end if;
   if Empresa <> nil then
      Empresa.free;
   //end if;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   //end if;
   inherited;
end;


function TMCrCostFe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMCrCostFe;
begin
   W:=TwMCrCostFe.Create(Self);
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


(***********************************************FORMA ********************)
(*                                                                              *)
(*  FORMA
(*                                                                              *)
(***********************************************FORMA ********************)
procedure TwMCrCostFe.AsignaEmpresaSuc;
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

procedure TwMCrCostFe.FormShow(Sender: TObject);
begin
   With Objeto Do Begin
      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

      CrCredito.ID_CREDITO.Control := edDisposicion;
      CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edNomDisposicion;
      CrCredito.GetParams(Objeto);

      Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Acreditado.Persona.Nombre.AsString;
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

procedure TwMCrCostFe.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CrCredito.ID_CREDITO.Control := Nil;
      CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := Nil;
      Acreditado.ID_ACREDITADO.Control := nil;
      Acreditado.Persona.Nombre.Control := nil;
   End;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMCrCostFe.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMCrCostFe.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TwMCrCostFe.ImprimeReporte(bPreview : Boolean);
Var
   sSituacion: String;
begin
   If rgSituacion.ItemIndex = 0 Then
      sSituacion := ''
   Else If rgSituacion.ItemIndex = 1 Then
      sSituacion := 'AC'
   Else If rgSituacion.ItemIndex = 2 Then
      sSituacion := 'PA'
   Else If rgSituacion.ItemIndex = 3 Then
      sSituacion := 'LQ'
   Else If rgSituacion.ItemIndex = 4 Then
      sSituacion := 'IM';

   RepCobCostoFEGA( edF_Ini_Vto.Text,           edF_Fin_Vto.Text,      edF_Ini_Pag.Text,        edF_Fin_Pag.Text,
                    edACREDITADO.Text,          edDisposicion.Text,    sSituacion,              edNbrArch.Text,
                    EdIdEmpresa.Text,           EdIDSucursal.Text,      Objeto.Apli,            bPreview,
                    chbxFVencimiento.Checked,   chbxFPago.Checked );

   If Trim(edNbrArch.Text)<>'' Then Begin
      If bGenArch Then
        ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
      Else
        ShowMessage('No se generó el Archivo')
   End;
End;

procedure TwMCrCostFe.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimeReporte(False);
end;

procedure TwMCrCostFe.InterForma1BtnPreviewClick(Sender: TObject);
begin
   ImprimeReporte(True);
end;

procedure TwMCrCostFe.btACREDITADOClick(Sender: TObject);
begin
   With Objeto Do Begin
      Acreditado.ShowAll := True;
      If Acreditado.Busca Then Begin
         chbxAcreditado.Checked:= True;
         chbxAcreditado.Enabled:= True;
         InterForma1.NextTab(edACREDITADO);
      End;
   End;
end;

procedure TwMCrCostFe.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMCrCostFe.ilACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
      chbxAcreditado.Checked:=True;
      chbxAcreditado.Enabled:=True;
      InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMCrCostFe.chbxAcreditadoClick(Sender: TObject);
begin
   EnableCheckBox(chbxAcreditado);
   Objeto.Acreditado.Active := chbxAcreditado.Checked;
end;

procedure TwMCrCostFe.sbExcelClick(Sender: TObject);
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

procedure TwMCrCostFe.cbxArchivoClick(Sender: TObject);
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

procedure TwMCrCostFe.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
      cbxArchivo.Checked:=True;
      cbxArchivo.Enabled:=True;
   End Else Begin
      cbxArchivo.Checked:=False;
      cbxArchivo.Enabled:=False;
   End;
end;


procedure TwMCrCostFe.btDisposicionClick(Sender: TObject);
begin
   Objeto.CrCredito.ShowAll := True;
   If Objeto.CrCredito.Busca Then Begin
      cbxDisposicion.Checked:=True;
      cbxDisposicion.Enabled:=True;
      InterForma1.NextTab(edDisposicion);
   End;
end;

procedure TwMCrCostFe.cbxDisposicionClick(Sender: TObject);
begin
   EnableCheckBox(cbxDisposicion);
   Objeto.CrCredito.Active := cbxDisposicion.Checked;
end;

procedure TwMCrCostFe.ilDisposicionCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMCrCostFe.ilDisposicionEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ilDisposicion.Buffer]) Then Begin
      cbxDisposicion.Checked:=True;
      cbxDisposicion.Enabled:=True;
      InterForma1.NextTab(edDisposicion);
   End;
end;

procedure TwMCrCostFe.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMCrCostFe.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMCrCostFe.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMCrCostFe.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMCrCostFe.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMCrCostFe.chbxFVencimientoClick(Sender: TObject);
begin
   if chbxFVencimiento.Checked then Begin
      chbxFPago.Checked := False;
      chbxFPago.Enabled := False;
      dtpF_Ini_Vto.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpF_Fin_Vto.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_Ini_Vto.text:=FormatDateTime('dd/mm/yyyy',dtpF_Ini_Vto.DateTime);
      edF_Fin_Vto.text:=FormatDateTime('dd/mm/yyyy',dtpF_Fin_Vto.DateTime);
      edF_Ini_Vto.Enabled:= True;
      edF_Fin_Vto.Enabled:= True;
      edF_Ini_Vto.Color:= clWindow;
      edF_Fin_Vto.Color:= clWindow;
      dtpF_Ini_Vto.Enabled:= True;
      dtpF_Fin_Vto.Enabled:= True;
      edF_Ini_Pag.text:='';
      edF_Fin_Pag.text:='';
      edF_Ini_Pag.Enabled:= False;
      edF_Fin_Pag.Enabled:= False;
      edF_Ini_Pag.Color:= clBtnFace;
      edF_Fin_Pag.Color:= clBtnFace;
      dtpF_Ini_Pag.Enabled:= False;
      dtpF_Fin_Pag.Enabled:= False;
   end
   else Begin
      chbxFPago.Checked := True;
      chbxFPago.Enabled := True;
      dtpF_Ini_Pag.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpF_Fin_Pag.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_Ini_Pag.text:=FormatDateTime('dd/mm/yyyy',dtpF_Ini_Pag.DateTime);
      edF_Fin_Pag.text:=FormatDateTime('dd/mm/yyyy',dtpF_Fin_Pag.DateTime);
      edF_Ini_Pag.Enabled:= True;
      edF_Fin_Pag.Enabled:= True;
      edF_Ini_Pag.Color:= clWindow;
      edF_Fin_Pag.Color:= clWindow;
      dtpF_Ini_Pag.Enabled:= True;
      dtpF_Fin_Pag.Enabled:= True;
      edF_Ini_Vto.text:='';
      edF_Fin_Vto.text:='';
      edF_Ini_Vto.Enabled:= False;
      edF_Fin_Vto.Enabled:= False;
      edF_Ini_Vto.Color:= clBtnFace;
      edF_Fin_Vto.Color:= clBtnFace;
      dtpF_Ini_Vto.Enabled:= False;
      dtpF_Fin_Vto.Enabled:= False;
   end;
end;

procedure TwMCrCostFe.chbxFPagoClick(Sender: TObject);
begin
   if chbxFPago.Checked then Begin
      chbxFPago.Checked := True;
      chbxFPago.Enabled := True;
      dtpF_Ini_Pag.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpF_Fin_Pag.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_Ini_Pag.text:=FormatDateTime('dd/mm/yyyy',dtpF_Ini_Pag.DateTime);
      edF_Fin_Pag.text:=FormatDateTime('dd/mm/yyyy',dtpF_Fin_Pag.DateTime);
      edF_Ini_Pag.Enabled:= True;
      edF_Fin_Pag.Enabled:= True;
      edF_Ini_Pag.Color:= clWindow;
      edF_Fin_Pag.Color:= clWindow;
      dtpF_Ini_Pag.Enabled:= True;
      dtpF_Fin_Pag.Enabled:= True;
      edF_Ini_Vto.text:='';
      edF_Fin_Vto.text:='';
      edF_Ini_Vto.Enabled:= False;
      edF_Fin_Vto.Enabled:= False;
      edF_Ini_Vto.Color:= clBtnFace;
      edF_Fin_Vto.Color:= clBtnFace;
      dtpF_Ini_Vto.Enabled:= False;
      dtpF_Fin_Vto.Enabled:= False;
   end
   else Begin
      chbxFPago.Checked := False;
      chbxFPago.Enabled := False;
      dtpF_Ini_Vto.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpF_Fin_Vto.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_Ini_Vto.text:=FormatDateTime('dd/mm/yyyy',dtpF_Ini_Vto.DateTime);
      edF_Fin_Vto.text:=FormatDateTime('dd/mm/yyyy',dtpF_Fin_Vto.DateTime);
      edF_Ini_Vto.Enabled:= True;
      edF_Fin_Vto.Enabled:= True;
      edF_Ini_Vto.Color:= clWindow;
      edF_Fin_Vto.Color:= clWindow;
      dtpF_Ini_Vto.Enabled:= True;
      dtpF_Fin_Vto.Enabled:= True;
      edF_Ini_Pag.text:='';
      edF_Fin_Pag.text:='';
      edF_Ini_Pag.Enabled:= False;
      edF_Fin_Pag.Enabled:= False;
      edF_Ini_Pag.Color:= clBtnFace;
      edF_Fin_Pag.Color:= clBtnFace;
      dtpF_Ini_Pag.Enabled:= False;
      dtpF_Fin_Pag.Enabled:= False;
   end;
end;

end.
