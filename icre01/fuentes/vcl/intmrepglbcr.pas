// Sistema         : Clase de Filtro de reporte de Control de Garantias
// Fecha de Inicio : 23/07/2004
// Función forma   : Clase de Filtro de reporte de Control de Garantias
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMRepGlbCr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
InterEdit,
IntParamCre,      // Parámetros Crédito
IntCrAcredit,     // Acreditado
IntMon,           // Moneda
IntCrCredito,      // Disposición
Intempre,         //Empresa
IntUnNeg          //Unidad Negocio/Suc
;

Type
 TMRepGlbCr= class;

  TwMRepGlbCr=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    Label1: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    cbxACREDITADO: TCheckBox;
    ilACREDITADO: TInterLinkit;
    Label2: TLabel;
    edMONEDA: TEdit;
    cbxMONEDA: TCheckBox;
    Label3: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btMONEDA: TBitBtn;
    edNOM_MONEDA: TEdit;
    ilMONEDA: TInterLinkit;
    Label4: TLabel;
    edDisposicion: TEdit;
    btDisposicion: TBitBtn;
    edDesc_Prod: TEdit;
    cbxDisposicion: TCheckBox;
    ilDisposicion: TInterLinkit;
    rgFechas: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edFIni: TEdit;
    edFFin: TEdit;
    stpInicio: TInterDateTimePicker;
    stpFin: TInterDateTimePicker;
    edSOBRANTE: TInterEdit;
    cbxSOBRANTE: TCheckBox;
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
    cbxFECHAS: TCheckBox;
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    rgSIT_CREDITO: TRadioGroup;
    Label9: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure cbxACREDITADOClick(Sender: TObject);
    procedure cbxMONEDAClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure btMONEDAClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure ilDisposicionCapture(Sender: TObject; var Show: Boolean);
    procedure ilDisposicionEjecuta(Sender: TObject);
    procedure btDisposicionClick(Sender: TObject);
    procedure cbxDisposicionClick(Sender: TObject);
    procedure cbxFECHASClick(Sender: TObject);
    procedure edFIniChange(Sender: TObject);
    procedure edFFinChange(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure cbxSOBRANTEClick(Sender: TObject);
    procedure edSOBRANTEExit(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
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
    Objeto : TMRepGlbCr;
    end;

 TMRepGlbCr= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        Acreditado       : TCrAcredit;
        ParamCre         : TParamCre;
        CrCredito        : TCrCredito;
        Moneda           : TMoneda;
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
uses IntMQrGlbCr;
{$R *.DFM}

constructor TMRepGlbCr.Create( AOwner : TComponent );
begin Inherited;
      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
      Acreditado.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';

      CrCredito := TCrCredito.Create(Self);
      CrCredito.MasterSource:=Self;
      CrCredito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMRepGlbCr.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMRepGlbCr.Destroy;
begin
   If Assigned(Acreditado) Then
      Acreditado.Free;
   If Assigned(CrCredito) Then
      CrCredito.Free;
   If Assigned(Moneda) Then
      Moneda.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   inherited;
end;


function TMRepGlbCr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMRepGlbCr;
begin
   W:=TWMRepGlbCr.Create(Self);
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


Function TMRepGlbCr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IMRepGlbCr.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TMRepGlbCr.Reporte:Boolean;
begin //Execute_Reporte();
end;

(***********************************************FORMA ********************)
(*                                                                              *)
(*  FORMA

(*                                                                              *)
(***********************************************FORMA ********************)
procedure TwMRepGlbCr.AsignaEmpresaSuc;
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

procedure TwMRepGlbCr.FormShow(Sender: TObject);
begin
   With Objeto Do Begin
      Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Acreditado.GetParams(Objeto);

      Moneda.Cve_Moneda.Control   := edMONEDA;
      Moneda.Desc_Moneda.Control  := edNOM_MONEDA;
      Moneda.GetParams(Objeto);

      CrCredito.ID_CREDITO.Control := edDisposicion;
      CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edDesc_Prod;
      CrCredito.GetParams(Objeto);

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

procedure TwMRepGlbCr.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      Acreditado.ID_ACREDITADO.Control := Nil;
      Acreditado.Persona.Nombre.Control := Nil;
      CrCredito.ID_CREDITO.Control := Nil;
      CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := Nil;
      Moneda.Cve_Moneda.Control   := Nil;
      Moneda.Desc_Moneda.Control  := Nil;
   End;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMRepGlbCr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMRepGlbCr.btACREDITADOClick(Sender: TObject);
begin
   With Objeto Do Begin
      Acreditado.ShowAll := True;
      If Acreditado.Busca Then Begin
         cbxAcreditado.Checked:= True;
         cbxAcreditado.Enabled:= True;
         InterForma1.NextTab(edACREDITADO);
      End;
   End;
end;

procedure TwMRepGlbCr.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TwMRepGlbCr.cbxACREDITADOClick(Sender: TObject);
begin
   EnableCheckBox(cbxAcreditado);
   Objeto.Acreditado.Active := cbxAcreditado.Checked;
end;

procedure TwMRepGlbCr.cbxMONEDAClick(Sender: TObject);
begin
   EnableCheckBox(cbxMONEDA);
   Objeto.Moneda.Active := cbxMONEDA.Checked;
end;

procedure TwMRepGlbCr.ImprimeReporte(bPreview : Boolean);
var vlSIT_CREDITO : String;
begin
 With Objeto Do
  Begin
    // Obtiene el Filtro de Situación del Crédito
    vlSIT_CREDITO := '';
    Case rgSIT_CREDITO.ItemIndex Of
      0 : vlSIT_CREDITO := 'AC';
      1 : vlSIT_CREDITO := 'LQ';
    End;
    // Muestra el Reporte
    RepGlbGtias(  Moneda.CVE_MONEDA.AsInteger, Acreditado.ID_ACREDITADO.AsInteger, CrCredito.ID_CREDITO.AsInteger,
                  Empresa.ID_EMPRESA.AsInteger, UnidadNegocio.ID_ENTIDAD.AsInteger,
                  vlSIT_CREDITO, edFIni.Text, edFFin.Text, edNbrArch.Text,
                  Objeto.Apli, bPreview);
  End;
End;

procedure TwMRepGlbCr.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMREPGLBCR_IMPRI',True,True) then
      ImprimeReporte(False);
end;

procedure TwMRepGlbCr.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMREPGLBCR_IMPRI',True,True) then
      ImprimeReporte(True);
end;

procedure TwMRepGlbCr.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        cbxACREDITADO.Checked:=True;
        cbxACREDITADO.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMRepGlbCr.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMRepGlbCr.btMONEDAClick(Sender: TObject);
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

procedure TwMRepGlbCr.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMRepGlbCr.ilMONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
      cbxMONEDA.Checked:=True;
      cbxMONEDA.Enabled:=True;
      InterForma1.NextTab(edMONEDA);
   End;
end;

procedure TwMRepGlbCr.ilDisposicionCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMRepGlbCr.ilDisposicionEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ilDisposicion.Buffer]) Then Begin
      cbxDisposicion.Checked:=True;
      cbxDisposicion.Enabled:=True;
      InterForma1.NextTab(edDisposicion);
   End;
end;

procedure TwMRepGlbCr.btDisposicionClick(Sender: TObject);
begin
   With Objeto Do Begin
      CrCredito.ShowAll := True;
      If CrCredito.Busca then Begin
         cbxDisposicion.Checked:= True;
         cbxDisposicion.Enabled:= True;
         InterForma1.NextTab(edDisposicion);
      End;
   End;
end;

procedure TwMRepGlbCr.cbxDisposicionClick(Sender: TObject);
begin
   EnableCheckBox(cbxDisposicion);
   Objeto.CrCredito.Active := cbxDisposicion.Checked;
end;

procedure TwMRepGlbCr.cbxFECHASClick(Sender: TObject);
begin
   EnableCheckBox(cbxFECHAS);
   If not cbxFECHAS.Checked Then Begin
      edFIni.Text:='';
      edFFin.Text:='';
   End;
end;

procedure TwMRepGlbCr.edFIniChange(Sender: TObject);
begin
   If Trim(edFIni.Text)<>'' Then Begin
      If Not cbxFECHAS.Checked Then Begin
          cbxFECHAS.Checked:=True;
          cbxFECHAS.Enabled:=True;
      End;
   End;
end;

procedure TwMRepGlbCr.edFFinChange(Sender: TObject);
begin
   If Trim(edFFin.Text)<>'' Then Begin
      If Not cbxFECHAS.Checked Then Begin
          cbxFECHAS.Checked:=True;
          cbxFECHAS.Enabled:=True;
      End;
   End;
end;

procedure TwMRepGlbCr.InterForma1DespuesShow(Sender: TObject);
begin
   edMONEDA.SetFocus;
end;

procedure TwMRepGlbCr.cbxSOBRANTEClick(Sender: TObject);
begin
   EnableCheckBox(cbxSOBRANTE);
   If not cbxSOBRANTE.Checked Then Begin
      edSOBRANTE.Text:='';
   End;
end;

procedure TwMRepGlbCr.edSOBRANTEExit(Sender: TObject);
begin
   If Trim(edSOBRANTE.Text)<>'' Then
      cbxSOBRANTE.Checked:= True;
end;

procedure TwMRepGlbCr.sbExcelClick(Sender: TObject);
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

procedure TwMRepGlbCr.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
      cbxArchivo.Checked:=True;
      cbxArchivo.Enabled:=True;
   End Else Begin
      cbxArchivo.Checked:=False;
      cbxArchivo.Enabled:=False;
   End;
end;

procedure TwMRepGlbCr.cbxArchivoClick(Sender: TObject);
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

procedure TwMRepGlbCr.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMRepGlbCr.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMRepGlbCr.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMRepGlbCr.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMRepGlbCr.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

end.
