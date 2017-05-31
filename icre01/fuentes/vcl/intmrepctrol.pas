// Sistema         : Clase de Filtro de reporte de Control de Garantias
// Fecha de Inicio : 23/07/2004
// Función forma   : Clase de Filtro de reporte de Control de Garantias
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMRepCtrol;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

IntParamCre,      // Parámetros Crédito
IntCrAcredit,     // Acreditado
IntMGarantia,     // Tipo de garantía
IntMon,           // Moneda
IntMTipoGar,      // Clasificación de Garantía
Intempre,         //Empresa
IntUnNeg          //Unidad Negocio/Suc
;

Type
 TMRepCtrol= class;

  TwMRepCtrol=Class(TForm)
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
    edCVE_GARANTIA: TEdit;
    btCVE_GARANTIA: TBitBtn;
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
    btMONEDA: TBitBtn;
    edNOM_MONEDA: TEdit;
    ilMONEDA: TInterLinkit;
    Label4: TLabel;
    edClasific: TEdit;
    btClasific: TBitBtn;
    edNom_Clasific: TEdit;
    cbxClasific: TCheckBox;
    ilClasific: TInterLinkit;
    rgSituacion: TRadioGroup;
    rgFechas: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edFIni: TEdit;
    edFFin: TEdit;
    stpInicio: TInterDateTimePicker;
    stpFin: TInterDateTimePicker;
    Label7: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
    cbxFECHAS: TCheckBox;
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
    procedure btACREDITADOClick(Sender: TObject);
    procedure cbxACREDITADOClick(Sender: TObject);
    procedure cbxMONEDAClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_GARANTIACapture(Sender: TObject; var Show: Boolean);
    procedure btCVE_GARANTIAClick(Sender: TObject);
    procedure ilCVE_GARANTIAEjecuta(Sender: TObject);
    procedure cbxCVE_GARANTIAClick(Sender: TObject);
    procedure btMONEDAClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure ilClasificCapture(Sender: TObject; var Show: Boolean);
    procedure ilClasificEjecuta(Sender: TObject);
    procedure btClasificClick(Sender: TObject);
    procedure cbxClasificClick(Sender: TObject);
    procedure cbxFECHASClick(Sender: TObject);
    procedure edFIniChange(Sender: TObject);
    procedure edFFinChange(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
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
    Objeto : TMRepCtrol;
    end;

 TMRepCtrol= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        Acreditado       : TCrAcredit;
        ParamCre         : TParamCre;
        MGarantia        : TMGarantia;
        Moneda           : TMoneda;
        MTipoGar         : TMTipoGar;
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
uses IntMQrCtrol;
{$R *.DFM}

constructor TMRepCtrol.Create( AOwner : TComponent );
begin Inherited;
      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
      Acreditado.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';

      MGarantia := TMGarantia.Create(Self);
      MGarantia.MasterSource:=Self;
      MGarantia.FieldByName('CVE_GARANTIA').MasterField:='CVE_GARANTIA';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      MTipoGar := TMTipoGar.Create(Self);
      MTipoGar.MasterSource:=Self;
      MTipoGar.FieldByName('CVE_TIPO_GAR').MasterField:='CVE_TIPO_GAR';

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMRepCtrol.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMRepCtrol.Destroy;
begin
   If Assigned(Acreditado) Then
      Acreditado.Free;
   If Assigned(MGarantia) Then
      MGarantia.Free;
   If Assigned(Moneda) Then
      Moneda.Free;
   If Assigned(MTipoGar) Then
      MTipoGar.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   inherited;
end;


function TMRepCtrol.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMRepCtrol;
begin
   W:=TWMRepCtrol.Create(Self);
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


Function TMRepCtrol.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IMRepCtrol.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TMRepCtrol.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA ********************)
(*                                                                              *)
(*  FORMA
(*                                                                              *)
(***********************************************FORMA ********************)
procedure TwMRepCtrol.AsignaEmpresaSuc;
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

procedure TwMRepCtrol.FormShow(Sender: TObject);
begin
   With Objeto Do Begin
      Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Acreditado.GetParams(Objeto);

      MGarantia.CVE_GARANTIA.Control := edCVE_GARANTIA;
      MGarantia.DESC_GARANTIA.Control := edDESC_GARANTIA;
      MGarantia.GetParams(Objeto);

      Moneda.Cve_Moneda.Control   := edMONEDA;
      Moneda.Desc_Moneda.Control  := edNOM_MONEDA;
      Moneda.GetParams(Objeto);

      MTipoGar.CVE_TIPO_GAR.Control := edClasific;
      MTipoGar.DESC_TIPO_GAR.Control := edNom_Clasific;
      MTipoGar.GetParams(Objeto);

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

procedure TwMRepCtrol.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      Acreditado.ID_ACREDITADO.Control := Nil;
      Acreditado.Persona.Nombre.Control := Nil;

      MGarantia.CVE_GARANTIA.Control := Nil;
      MGarantia.DESC_GARANTIA.Control := Nil;

      Moneda.Cve_Moneda.Control   := Nil;
      Moneda.Desc_Moneda.Control  := Nil;

      MTipoGar.CVE_TIPO_GAR.Control := Nil;
      MTipoGar.DESC_TIPO_GAR.Control := Nil;
   End;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMRepCtrol.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMRepCtrol.btACREDITADOClick(Sender: TObject);
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

procedure TwMRepCtrol.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TwMRepCtrol.cbxACREDITADOClick(Sender: TObject);
begin
   EnableCheckBox(cbxAcreditado);
   Objeto.Acreditado.Active := cbxAcreditado.Checked;
end;

procedure TwMRepCtrol.cbxMONEDAClick(Sender: TObject);
begin
   EnableCheckBox(cbxMONEDA);
   Objeto.Moneda.Active := cbxMONEDA.Checked;
end;

procedure TwMRepCtrol.ImprimeReporte(bPreview : Boolean);
Var
   sSituacion: String;
begin
   If rgSituacion.ItemIndex = 0 Then
      sSituacion:= ''
   Else If rgSituacion.ItemIndex = 1 Then
      sSituacion:= 'AC'
   Else If rgSituacion.ItemIndex = 2 Then
      sSituacion:= 'IN';

   If ((Trim(edFIni.Text)<>'')and (Trim(edFFin.Text)=''))Or
      ((Trim(edFIni.Text)='')and (Trim(edFFin.Text)<>''))Then Begin
      ShowMessage('Debe especificarse el rango de fechas completo');
   End Else Begin
      RepCtrolGarantias(edACREDITADO.Text, edMONEDA.text      ,
                        edClasific.Text  , edCVE_GARANTIA.Text,
                        edFIni.Text      , edFFin.Text        ,
                        sSituacion       , edNbrArch.Text     ,
                        EdIdEmpresa.Text , EdIDSucursal.Text  ,
                        Objeto.Apli      , bPreview           );

      If Trim(edNbrArch.Text)<>'' Then Begin
         If bGenArch Then
           ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
         Else
           ShowMessage('No se generó el Archivo')
      End;
   End;
End;

procedure TwMRepCtrol.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimeReporte(False);
end;

procedure TwMRepCtrol.InterForma1BtnPreviewClick(Sender: TObject);
begin
   ImprimeReporte(True);
end;

procedure TwMRepCtrol.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        cbxACREDITADO.Checked:=True;
        cbxACREDITADO.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMRepCtrol.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMRepCtrol.ilCVE_GARANTIACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMRepCtrol.btCVE_GARANTIAClick(Sender: TObject);
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

procedure TwMRepCtrol.ilCVE_GARANTIAEjecuta(Sender: TObject);
begin                                         
   If Objeto.MGarantia.FindKey([ilCVE_GARANTIA.Buffer]) Then Begin
      cbxCVE_GARANTIA.Checked:=True;
      cbxCVE_GARANTIA.Enabled:=True;
      InterForma1.NextTab(edCVE_GARANTIA);
   End;
end;

procedure TwMRepCtrol.cbxCVE_GARANTIAClick(Sender: TObject);
begin
   EnableCheckBox(cbxCVE_GARANTIA);
   Objeto.MGarantia.Active := cbxCVE_GARANTIA.Checked;
end;

procedure TwMRepCtrol.btMONEDAClick(Sender: TObject);
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

procedure TwMRepCtrol.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMRepCtrol.ilMONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
      cbxMONEDA.Checked:=True;
      cbxMONEDA.Enabled:=True;
      InterForma1.NextTab(edMONEDA);
   End;
end;

procedure TwMRepCtrol.ilClasificCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMRepCtrol.ilClasificEjecuta(Sender: TObject);
begin
   If Objeto.MTipoGar.FindKey([ilClasific.Buffer]) Then Begin
      cbxClasific.Checked:=True;
      cbxClasific.Enabled:=True;
      InterForma1.NextTab(edClasific);
   End;
end;

procedure TwMRepCtrol.btClasificClick(Sender: TObject);
begin
   With Objeto Do Begin
      MTipoGar.ShowAll := True;
      If MTipoGar.Busca then Begin
         cbxClasific.Checked:= True;
         cbxClasific.Enabled:= True;
         InterForma1.NextTab(edClasific);
      End;
   End;
end;

procedure TwMRepCtrol.cbxClasificClick(Sender: TObject);
begin
   EnableCheckBox(cbxClasific);
   Objeto.MTipoGar.Active := cbxClasific.Checked;
end;

procedure TwMRepCtrol.cbxFECHASClick(Sender: TObject);
begin
   EnableCheckBox(cbxFECHAS);
   If not cbxFECHAS.Checked Then Begin
      edFIni.Text:='';
      edFFin.Text:='';
   End;
end;

procedure TwMRepCtrol.edFIniChange(Sender: TObject);
begin
   If Trim(edFIni.Text)<>'' Then Begin
      If Not cbxFECHAS.Checked Then Begin
          cbxFECHAS.Checked:=True;
          cbxFECHAS.Enabled:=True;
      End;
   End;
end;

procedure TwMRepCtrol.edFFinChange(Sender: TObject);
begin
   If Trim(edFFin.Text)<>'' Then Begin
      If Not cbxFECHAS.Checked Then Begin
          cbxFECHAS.Checked:=True;
          cbxFECHAS.Enabled:=True;
      End;
   End;
end;

procedure TwMRepCtrol.InterForma1DespuesShow(Sender: TObject);
begin
   edMONEDA.SetFocus;
end;

procedure TwMRepCtrol.sbExcelClick(Sender: TObject);
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

procedure TwMRepCtrol.cbxArchivoClick(Sender: TObject);
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

procedure TwMRepCtrol.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
      cbxArchivo.Checked:=True;
      cbxArchivo.Enabled:=True;
   End Else Begin
      cbxArchivo.Checked:=False;
      cbxArchivo.Enabled:=False;
   End;
end;

procedure TwMRepCtrol.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMRepCtrol.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMRepCtrol.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMRepCtrol.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMRepCtrol.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

end.
