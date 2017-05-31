// Sistema         : Clase de Filtro de reporte Garantias por Disposición
// Fecha de Inicio : 21/07/2004
// Función forma   : Clase de Filtro de reporte Garantias por Disposición
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMRepGarAc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

IntParamCre,      // Parámetros Crédito
IntCrCredito,     // Disposición
IntMon,           // Moneda  
IntMGarantia,     // Clave de garantía
IntMRegistro,      // Falta registro como objeto
Intempre,         //Empresa
IntUnNeg          //Unidad Negocio/Suc
;

Type
 TMRepGarAc= class;

  TwMRepGarAc=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    Label1: TLabel;
    edGARANTIA: TEdit;
    btGARANTIA: TBitBtn;
    edNOM_GARANTIA: TEdit;
    cbxGARANTIA: TCheckBox;
    ilGARANTIA: TInterLinkit;
    Label2: TLabel;
    edNUM_FIRA: TEdit;
    cbxNUM_FIRA: TCheckBox;
    Label3: TLabel;
    edCVE_GARANTIA: TEdit;
    btID_SOLICITUD: TBitBtn;
    edDESC_GARANTIA: TEdit;
    cbxCVE_GARANTIA: TCheckBox;
    ilCVE_GARANTIA: TInterLinkit;
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
    edMONEDA: TEdit;
    cbxMONEDA: TCheckBox;
    btMONEDA: TBitBtn;
    edNOM_MONEDA: TEdit;
    ilMONEDA: TInterLinkit;
    Label5: TLabel;
    edDisposicion: TEdit;
    btDisposicion: TBitBtn;
    edNomDisposicion: TEdit;
    cbxDisposicion: TCheckBox;
    ilDisposicion: TInterLinkit;
    rgSituacion: TRadioGroup;
    Label7: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
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
    procedure cbxNUM_FIRAClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure ilCVE_GARANTIACapture(Sender: TObject; var Show: Boolean);
    procedure btID_SOLICITUDClick(Sender: TObject);
    procedure ilCVE_GARANTIAEjecuta(Sender: TObject);
    procedure edNUM_FIRAChange(Sender: TObject);
    procedure cbxCVE_GARANTIAClick(Sender: TObject);
    procedure btMONEDAClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure cbxMONEDAClick(Sender: TObject);
    procedure btDisposicionClick(Sender: TObject);
    procedure cbxDisposicionClick(Sender: TObject);
    procedure ilDisposicionCapture(Sender: TObject; var Show: Boolean);
    procedure ilDisposicionEjecuta(Sender: TObject);
    procedure btGARANTIAClick(Sender: TObject);
    procedure cbxGARANTIAClick(Sender: TObject);
    procedure ilGARANTIACapture(Sender: TObject; var Show: Boolean);
    procedure ilGARANTIAEjecuta(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    private
    { Private declarations }
     procedure EnableCheckBox(var CheckBox : TCheckBox);
     procedure ImprimeReporte(bPreview : Boolean);
     Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMRepGarAc;
    end;

 TMRepGarAc= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CrCredito        : TCrCredito;
        ParamCre         : TParamCre;
        MGarantia        : TMGarantia;
        Moneda           : TMoneda;
        MRegistro        : TMRegistro;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
uses IntMQrGarAcred;
{$R *.DFM}

constructor TMRepGarAc.Create( AOwner : TComponent );
begin Inherited;
      CrCredito := TCrCredito.Create(Self);
      CrCredito.MasterSource:=Self;
      CrCredito.FieldByName('ID_CREDITO').MasterField:='ID_DISPOSICION';

      MGarantia := TMGarantia.Create(Self);
      MGarantia.MasterSource:=Self;
      MGarantia.FieldByName('CVE_GARANTIA').MasterField:='CVE_GARANTIA';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      MRegistro := TMRegistro.Create(Self);
      MRegistro.MasterSource:=Self;
      MRegistro.FieldByName('ID_SOLICITUD').MasterField:='ID_SOLICITUD';

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMRepGarAc.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMRepGarAc.Destroy;
begin
   If Assigned(CrCredito) Then
    CrCredito.Free;
   If Assigned(MGarantia) Then
    MGarantia.Free;
   If Assigned(Moneda) Then
      Moneda.Free;
   If Assigned(MRegistro) Then
      MRegistro.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   inherited;
end;


function TMRepGarAc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMRepGarAc;
begin
   W:=TWMRepGarAc.Create(Self);
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


Function TMRepGarAc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IMRepGarAc.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TMRepGarAc.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA ********************)
(*                                                                              *)
(*  FORMA
(*                                                                              *)
(***********************************************FORMA ********************)
procedure TwMRepGarAc.AsignaEmpresaSuc;
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

procedure TwMRepGarAc.FormShow(Sender: TObject);
begin
   With Objeto Do Begin
      CrCredito.ID_CREDITO.Control := edDisposicion;
      CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edNomDisposicion;
      CrCredito.GetParams(Objeto);

      MGarantia.CVE_GARANTIA.Control := edCVE_GARANTIA;
      MGarantia.DESC_GARANTIA.Control := edDESC_GARANTIA;
      MGarantia.GetParams(Objeto);

      Moneda.Cve_Moneda.Control   := edMONEDA;
      Moneda.Desc_Moneda.Control  := edNOM_MONEDA;
      Moneda.GetParams(Objeto);

      MRegistro.ID_SOLICITUD.Control := edGARANTIA;
      MRegistro.Acreditado.Persona.Nombre.Control := edNOM_GARANTIA;
      MRegistro.GetParams(Objeto);

      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
   End;
   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;
end;

procedure TwMRepGarAc.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CrCredito.ID_CREDITO.Control := Nil;
      CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := Nil;

      MGarantia.CVE_GARANTIA.Control := Nil;
      MGarantia.DESC_GARANTIA.Control := Nil;

      Moneda.Cve_Moneda.Control   := Nil;
      Moneda.Desc_Moneda.Control  := Nil;

      MRegistro.ID_SOLICITUD.Control := Nil;
      MRegistro.Acreditado.Persona.Nombre.Control := Nil;
   End;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMRepGarAc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMRepGarAc.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TwMRepGarAc.cbxNUM_FIRAClick(Sender: TObject);
begin
   EnableCheckBox(cbxNUM_FIRA);
   If not cbxNUM_FIRA.Checked Then
      edNUM_FIRA.Text:= '';
end;

procedure TwMRepGarAc.ImprimeReporte(bPreview : Boolean);
Var
   sSituacion: String;
begin
   If rgSituacion.ItemIndex = 0 Then
      sSituacion := ''
   Else If rgSituacion.ItemIndex = 1 Then
      sSituacion := 'AC'
   Else If rgSituacion.ItemIndex = 2 Then
      sSituacion := 'IN';

   RepRelGarAcred( edMONEDA.Text, edCVE_GARANTIA.Text, edDisposicion.Text, edNUM_FIRA.Text,
                   edGARANTIA.Text, sSituacion, edNbrArch.Text,
                   EdIdEmpresa.Text , EdIDSucursal.Text  ,Objeto.Apli, bPreview );
   If Trim(edNbrArch.Text)<>'' Then Begin
      If bGenArch Then
        ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
      Else
        ShowMessage('No se generó el Archivo')
   End;
End;

procedure TwMRepGarAc.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimeReporte(False);
end;

procedure TwMRepGarAc.InterForma1BtnPreviewClick(Sender: TObject);
begin
   ImprimeReporte(True);
end;

procedure TwMRepGarAc.ilCVE_GARANTIACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMRepGarAc.btID_SOLICITUDClick(Sender: TObject);
begin
   With Objeto Do Begin
      MGarantia.ShowAll := True;
      If MGarantia.Busca then Begin
         cbxCVE_GARANTIA.Checked:= True;
         cbxCVE_GARANTIA.Enabled:= True;
         InterForma1.NextTab(edCVE_GARANTIA);
      End;
   End;
end;

procedure TwMRepGarAc.ilCVE_GARANTIAEjecuta(Sender: TObject);
begin
   If Objeto.MGarantia.FindKey([ilCVE_GARANTIA.Buffer]) Then Begin
      cbxCVE_GARANTIA.Checked:=True;
      cbxCVE_GARANTIA.Enabled:=True;
      InterForma1.NextTab(edCVE_GARANTIA);
   End;
end;

procedure TwMRepGarAc.edNUM_FIRAChange(Sender: TObject);
begin
   If Trim(edNUM_FIRA.Text)<> '' Then Begin
      cbxNUM_FIRA.Checked:= True;
   End Else Begin
      cbxNUM_FIRA.Checked:= False;
   End;
end;

procedure TwMRepGarAc.cbxCVE_GARANTIAClick(Sender: TObject);
begin
   EnableCheckBox(cbxCVE_GARANTIA);
   Objeto.MGarantia.Active := cbxCVE_GARANTIA.Checked;
end;

procedure TwMRepGarAc.btMONEDAClick(Sender: TObject);
begin
   With Objeto Do Begin
      Moneda.ShowAll := True;
      If Moneda.Busca Then Begin
         cbxMONEDA.Checked:= True;
         cbxMONEDA.Enabled:= True;
         InterForma1.NextTab(edMONEDA);
      End;
   End;
end;

procedure TwMRepGarAc.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMRepGarAc.ilMONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
      cbxMONEDA.Checked:=True;
      cbxMONEDA.Enabled:=True;
      InterForma1.NextTab(edMONEDA);
   End;
end;

procedure TwMRepGarAc.cbxMONEDAClick(Sender: TObject);
begin
   EnableCheckBox(cbxMONEDA);
   Objeto.Moneda.Active := cbxMONEDA.Checked;
end;

procedure TwMRepGarAc.btDisposicionClick(Sender: TObject);
begin
   With Objeto Do Begin
      CrCredito.ShowAll := True;
      If CrCredito.Busca Then Begin
         cbxDisposicion.Checked:= True;
         cbxDisposicion.Enabled:= True;
         InterForma1.NextTab(edDisposicion);
      End;
   End;
end;

procedure TwMRepGarAc.cbxDisposicionClick(Sender: TObject);
begin
   EnableCheckBox(cbxDisposicion);
   Objeto.CrCredito.Active := cbxDisposicion.Checked;
end;

procedure TwMRepGarAc.ilDisposicionCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMRepGarAc.ilDisposicionEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ilDisposicion.Buffer]) Then Begin
      cbxDisposicion.Checked:=True;
      cbxDisposicion.Enabled:=True;
      InterForma1.NextTab(edDisposicion);
   End;
end;

procedure TwMRepGarAc.btGARANTIAClick(Sender: TObject);
begin
   With Objeto Do Begin
      MRegistro.ShowAll := True;
      If MRegistro.Busca Then Begin
         cbxGARANTIA.Checked:= True;
         cbxGARANTIA.Enabled:= True;
         InterForma1.NextTab(edGARANTIA);
      End;
   End;
end;

procedure TwMRepGarAc.cbxGARANTIAClick(Sender: TObject);
begin
   EnableCheckBox(cbxGARANTIA);
   Objeto.MRegistro.Active := cbxGARANTIA.Checked;
end;

procedure TwMRepGarAc.ilGARANTIACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMRepGarAc.ilGARANTIAEjecuta(Sender: TObject);
begin
   If Objeto.MRegistro.FindKey([ilGARANTIA.Buffer]) Then Begin
      cbxGARANTIA.Checked:=True;
      cbxGARANTIA.Enabled:=True;
      InterForma1.NextTab(edGARANTIA);
   End;
end;

procedure TwMRepGarAc.sbExcelClick(Sender: TObject);
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

procedure TwMRepGarAc.cbxArchivoClick(Sender: TObject);
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

procedure TwMRepGarAc.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
      cbxArchivo.Checked:=True;
      cbxArchivo.Enabled:=True;
   End Else Begin
      cbxArchivo.Checked:=False;
      cbxArchivo.Enabled:=False;
   End;
end;

procedure TwMRepGarAc.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMRepGarAc.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMRepGarAc.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMRepGarAc.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMRepGarAc.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

end.
