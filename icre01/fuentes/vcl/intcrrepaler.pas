// Sistema         : Clase de CrRepAlerVenc
// Fecha de Inicio : 17/01/2013
// Función forma   : Clase de CrRepAlerVenc
// Diseñado por    : Juan Fco. Ortega Flores
// Comentarios     :
Unit IntCrrepaler;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
//Unidades Adicionales
IntGencre,
IntParamCre,
IntLinkit,
Intempre,     //Empresa
IntCrCredito, //Disposición
IntUnNeg,     //Unidad Negocio/Suc
IntCrEmiPro,  //EmiProv
IntCrEmisor,  //Emisor
IntCrTDocto,  //Tipo de Documento
IntCrmailven, //MAIL
IntMQrAlerVn  //REPORTE
;

Type
 TCrrepaler= class;

  TWCrrepalervenc=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox2: TGroupBox;
    lbAplica: TLabel;
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
    Label5: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    SaveDialog1: TSaveDialog;
    cbxArchivo: TCheckBox;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ILSucursal: TInterLinkit;
    ilEmpresa: TInterLinkit;
    lbID_PROVEEDOR: TLabel;
    edID_PROVEEDOR: TEdit;
    btPROVEEDOR: TBitBtn;
    edNOM_PROVEED: TEdit;
    cbBPROV: TCheckBox;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    edF_INGRIni: TEdit;
    InterDateTimePicker2: TInterDateTimePicker;
    edF_INGRFin: TEdit;
    InterDateTimePicker3: TInterDateTimePicker;
    ilPROVEEDOR: TInterLinkit;
    ilCVE_DOCTO: TInterLinkit;
    ChBxFI: TCheckBox;
    lbCVE_DOCUMENTO: TLabel;
    edCVE_DOCUMENTO: TEdit;
    btTIPO_DOCTO: TBitBtn;
    edDESC_TIPO_DOCTO: TEdit;
    cbTDOCTO: TCheckBox;
    lbID_CESION: TLabel;
    cbCESION: TCheckBox;
    lbID_EMISOR: TLabel;
    edID_EMISOR: TEdit;
    btEMISOR: TBitBtn;
    edNOM_EMISOR: TEdit;
    cbBEMISOR: TCheckBox;
    Label3: TLabel;
    edDOCUMENTO: TEdit;
    ChBxDocto: TCheckBox;
    Situacion: TGroupBox;
    ChBxAC: TCheckBox;
    ChBxNA: TCheckBox;
    ChBxCA: TCheckBox;
    ChBxLQ: TCheckBox;
    ChBxIM: TCheckBox;
    ChBxTod: TCheckBox;
    ilEMISOR: TInterLinkit;
    edID_CESION: TEdit;
    edCESION: TEdit;
    btID_CESION: TBitBtn;
    ilCesion: TInterLinkit;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    edF_EMISIni: TEdit;
    dtpF_CORTEIni: TInterDateTimePicker;
    Button1: TButton;
    procedure ImprimeReporte(bPreview: Boolean; grOpcion : TGenRepOption);
    procedure EnableCheckBox(var CheckBox : TCheckBox);
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure cbBPROVClick(Sender: TObject);
    procedure btTIPO_DOCTOClick(Sender: TObject);
    procedure cbTDOCTOClick(Sender: TObject);
    procedure ilCESIONCapture(Sender: TObject; var Show: Boolean);
    procedure cbCESIONClick(Sender: TObject);
    procedure ChBxFIClick(Sender: TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure edF_INGRIniChange(Sender: TObject);
    procedure edF_INGRFinChange(Sender: TObject);
    procedure cbBEMISORClick(Sender: TObject);
    procedure ChBxTodClick(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    private
    Procedure AsignaEmpresaSuc;
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrrepaler;
end; 
 TCrrepaler= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        { Public declarations }
        ParamCre      : TParamCre;
        Empresa       : TEmpresa;
        Emisor        : TCrEmisor;  //Emisor
        EmiProv       : TCrEmiPro;
        Credito       : TCrCredito;  //Disposición
        UnidadNegocio : TUnNegocio;
        TipoDocto     : TCrTDocto;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

 var
 vlgidemisor, vlgnomemis : String;


implementation

//Uses RepMon;

{$R *.DFM}


constructor TCrrepaler.Create( AOwner : TComponent ); 
begin Inherited; 
      // Empresa
      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      Emisor:= TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;

      EmiProv := TCrEmiPro.Create(Self);
      EmiProv.MasterSource:=Self;
      EmiProv.FieldByName('ID_PROVEEDOR').MasterField:='ID_PROVEEDOR';

      TipoDocto := TCrTDocto.Create(Self);
      TipoDocto.MasterSource:=Self;
      TipoDocto.FieldByName('CVE_DOCUMENTO').MasterField:='CVE_DOCUMENTO';

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrrepaler.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrrepaler.Destroy;
begin
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   if Emisor<> nil then
      Emisor.free;      
   if EmiProv <> nil then
      EmiProv.Free;
   if TipoDocto <> nil then
      TipoDocto.Free;
   if Credito <> nil then
      Credito.Free;

inherited;
end;


function TCrrepaler.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrrepalervenc;
begin
   W:=TWCrrepalervenc.Create(Self);
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


Function TCrrepaler.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrrepal.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrrepaler.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrRepAlerVenc********************)
(*                                                                              *)
(*  FORMA DE CrRepAlerVenc                                                            *)
(*                                                                              *)
(***********************************************FORMA CrRepAlerVenc********************)

procedure TWCrrepalervenc.FormShow(Sender: TObject);
begin
//      Objeto.CAMPO1.Control:=edCAMPO1;
   //USURAIO
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      //EMPRESA
   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);
   //SUCURSAL
   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);

   Objeto.Emisor.ID_ACREDITADO.Control := edID_EMISOR;
   Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOM_EMISOR;

   Objeto.EmiProv.ID_PROVEEDOR.Control := edID_PROVEEDOR;
   Objeto.EmiProv.Proveedor.Persona.Nombre.Control :=edNOM_PROVEED;
   Objeto.EmiProv.GetParams(Objeto);

   Objeto.TipoDocto.CVE_DOCUMENTO.Control := edCVE_DOCUMENTO;
   Objeto.TipoDocto.DESC_DOCUMENTO.Control := edDESC_TIPO_DOCTO;
   Objeto.TipoDocto.GetParams(Objeto);

   Objeto.Credito.ID_CREDITO.Control := edID_CESION;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
   Objeto.Credito.GetParams(Objeto);
   edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
   edCESION.ShowHint := True;

   AsignaEmpresaSuc;
   ChBxTodClick(Self);

   edF_EMISIni.text := DateToStr(Objeto.Apli.DameFechaEmpresa);

end;

procedure TWCrrepalervenc.FormDestroy(Sender: TObject);
begin
//      Objeto.CAMPO1.Control:=nil;

   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;

   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;

   Objeto.EmiProv.ID_PROVEEDOR.Control := nil;
   Objeto.EmiProv.Proveedor.Persona.Nombre.Control :=nil;

   Objeto.Emisor.ID_ACREDITADO.Control := nil;
   Objeto.Emisor.Acreditado.Persona.Nombre.Control := nil;

   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
   Objeto.Credito.ID_CREDITO.Control := nil;

   Objeto.TipoDocto.CVE_DOCUMENTO.Control := nil;
   Objeto.TipoDocto.DESC_DOCUMENTO.Control := nil;
end;

procedure TWCrrepalervenc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrrepalervenc.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrrepalervenc.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrrepalervenc.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrrepalervenc.ilEmpresaEjecuta(Sender: TObject);
begin
        Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TWCrrepalervenc.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWCrrepalervenc.AsignaEmpresaSuc;
begin
        Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);
    if  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) then
    begin
         CBSucursal.Checked := True;
    end;

    EdIdEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
    bbEmpresa.Enabled   := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';

    EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    BBSucursal.Enabled   := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    CBSucursal.Enabled   := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
end;

procedure TWCrrepalervenc.sbExcelClick(Sender: TObject);
var sExt : String;
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

procedure TWCrrepalervenc.cbxArchivoClick(Sender: TObject);
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

procedure TWCrrepalervenc.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked := True;
        cbxArchivo.Enabled := True;
    End Else Begin
        cbxArchivo.Checked := False;
        cbxArchivo.Enabled := False;
    End;
end;

procedure TWCrrepalervenc.ilPROVEEDOREjecuta(Sender: TObject);
begin
   if Objeto.EmiProv.FindKeyNear([ilPROVEEDOR.Buffer],['ID_PROVEEDOR']) then

   Begin
      cbBPROV.Checked := True;
      cbBPROV.Enabled := True;
      InterForma1.NextTab(edID_PROVEEDOR);
   end

end;

procedure TWCrrepalervenc.btPROVEEDORClick(Sender: TObject);
begin

    Objeto.EmiProv.BuscaWhereString := ' cr_emisor_prov.cve_fnd_ent_des =(SELECT cve_parametro' +
                                       '                                    FROM cr_fe_parametro' +
                                       '                                   WHERE parametro = ''CVE_FND_ENT_DES_BINT'')';
      Objeto.EmiProv.ShowAll := True;
   if Objeto.EmiProv.Busca then
   Begin
      cbBPROV.Checked := True;
      cbBPROV.Enabled := True;
      InterForma1.NextTab(edID_PROVEEDOR);
   end
end;

procedure TWCrrepalervenc.cbBPROVClick(Sender: TObject);
begin
   EnableCheckBox(cbBPROV);
   Objeto.EmiProv.Active := cbBPROV.Checked;
end;

procedure TWCrrepalervenc.EnableCheckBox(var CheckBox: TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TWCrrepalervenc.btTIPO_DOCTOClick(Sender: TObject);
begin
      Objeto.TipoDocto.ShowAll := True;
   if Objeto.TipoDocto.Busca then
   Begin
      cbTDOCTO.Checked := True;
      cbTDOCTO.Enabled := True;
      InterForma1.NextTab(edCVE_DOCUMENTO);
   end
end;

procedure TWCrrepalervenc.cbTDOCTOClick(Sender: TObject);
begin
   EnableCheckBox(cbTDOCTO);
   Objeto.TipoDocto.Active := cbTDOCTO.Checked;
end;

procedure TWCrrepalervenc.ilCESIONCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TWCrrepalervenc.cbCESIONClick(Sender: TObject);
begin
   EnableCheckBox(cbCESION);
   Objeto.Credito.Active := cbCESION.Checked;
end;

procedure TWCrrepalervenc.cbBEMISORClick(Sender: TObject);
begin
   EnableCheckBox(cbBPROV);
   Objeto.Emisor.Active := cbBEMISOR.Checked;
end;

procedure TWCrrepalervenc.ChBxFIClick(Sender: TObject);
begin
    If not ChBxFI.Checked Then Begin
        edF_INGRIni.Text:= '';
        edF_INGRFin.Text:= '';
        ChBxFI.Checked := False;
        ChBxFI.Enabled := False;
    End Else Begin
        ChBxFI.Checked := True;
        ChBxFI.Enabled := True;
    End;
end;

procedure TWCrrepalervenc.btEMISORClick(Sender: TObject);
begin
{   Objeto.Emisor.BuscaWhereString := ' cr_emisor.cve_fnd_ent_des =(SELECT cve_parametro' +
                                          '                          FROM cr_fe_parametro' +
                                          '                         WHERE parametro = ''CVE_FND_ENT_DES_BINT'')'; }


   Objeto.Emisor.ShowAll := True;
   if Objeto.Emisor.Busca then
   Begin
      cbBEMISOR.Checked := True;
      cbBEMISOR.Enabled := True;
      InterForma1.NextTab(edID_EMISOR);
   end
end;

procedure TWCrrepalervenc.edF_INGRIniChange(Sender: TObject);
begin
    ChBxFI.Checked := True;
end;

procedure TWCrrepalervenc.edF_INGRFinChange(Sender: TObject);
begin
    ChBxFI.Checked := True;
end;


procedure TWCrrepalervenc.ChBxTodClick(Sender: TObject);
begin
    If not ChBxTod.Checked Then Begin
      ChBxAC.Checked := False;
      ChBxNA.Checked := False;
      ChBxCA.Checked := False;
      ChBxLQ.Checked := False;
      ChBxIM.Checked := False;
    End
    Else Begin
      ChBxAC.Checked := True;
      ChBxNA.Checked := True;
      ChBxCA.Checked := True;
      ChBxLQ.Checked := True;
      ChBxIM.Checked := True;
    End;
end;

procedure TWCrrepalervenc.btID_CESIONClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then
   begin
        cbCESION.Checked:=True;
        cbCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TWCrrepalervenc.ilCesionEjecuta(Sender: TObject);
begin
    If  Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        cbCESION.Checked:=True;
        cbCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TWCrrepalervenc.ImprimeReporte(bPreview: Boolean; grOpcion : TGenRepOption);
var tiprep, agrup : String;
    vltod, vlAC, vlNA, vlCA, vlLQ,vlIM : String;
    vlusuario, vlfechahr : String;
    vlfhoy : String;
    vlsalida : Boolean;
begin
    vlusuario := '';
    vlfechahr := '';

    vlsalida := True;
    //situaciones
    if ChBxTod.Checked then
         vltod := 'TOD';
    if ChBxAC.Checked then
         vlAC := 'AC';
    if ChBxNA.Checked then
         vlNA := 'NA';
    if ChBxCA.Checked then
         vlCA := 'CA';
    if ChBxLQ.Checked then
         vlLQ := 'LQ';
    if ChBxIM.Checked then
         vlIM := 'IM';

    vlfhoy := DateToStr(Objeto.Apli.DameFechaEmpresa);

    //valida rango de Fechas
 
     //VALIDA SITUACIONES
        if (ChBxAC.Checked = False) and (ChBxCA.Checked = False) and (ChBxIM.Checked = False) and
           (ChBxNA.Checked = False) and (ChBxLQ.Checked = False)   then
           begin
           Showmessage('   ¡ Favor de seleccionar al menos una situación !');
           vlsalida := False;
           end;

//        if (edF_EMISIni.Text = '') or (edF_EMISFin.Text = '') then
//        begin
//           Showmessage('   ¡ Favor de seleccionar un rango de Fechas de Emisión !');
//           vlsalida := False;
//        end;
       if edF_EMISIni.Text = '' then
       begin
       Showmessage('   ¡ Favor de seleccionar una fecha de corte !');
       vlsalida := False;
       end;


     if vlsalida then
     //Ejecuta Reporte
     begin
             RepAlerVn ( edF_EMISIni.Text, edF_INGRIni.Text, edF_INGRFin.Text,
                         edID_CESION.Text, edID_EMISOR.Text, edID_PROVEEDOR.Text, edDOCUMENTO.Text, edCVE_DOCUMENTO.Text,
                         EdIdEmpresa.Text, EdIDSucursal.Text, edNbrArch.Text,
                         vltod, vlAC, vlNA, vlCA, vlLQ,vlIM,
                         gropcion,
                         bPreview, Objeto.Apli );

            if Trim(edNbrArch.Text) <> '' then
            begin
               if  bGenArch then
                 ShowMessage('    El Archivo se generó correctamente')
               else
                 ShowMessage('    No se generó el Archivo')
            end;
     end;
end;

procedure TWCrrepalervenc.InterForma1BtnImprimirClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRREPALER_IMPR',True,True) then
   ImprimeReporte(False, grPrint);
end;

procedure TWCrrepalervenc.InterForma1BtnPreviewClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRREPALER_PREV',True,True) then
   ImprimeReporte(True, grPreview);
end;

procedure TWCrrepalervenc.Label4Click(Sender: TObject);
var   Crmailven     : TCrmailven;
begin
if Objeto.ValidaAccesoEsp('TCRREPALER_MAIL',True,True) then
  begin
    Crmailven := TCrmailven.Create(self);
    try
    Crmailven.apli := Objeto.Apli;
    Crmailven.ParamCre :=Objeto.ParamCre;
    Crmailven.Catalogo;
    finally
    Crmailven.Free;
    end;
  end;
end;

procedure TWCrrepalervenc.Button1Click(Sender: TObject);
var   Crmailven     : TCrmailven;
begin
if Objeto.ValidaAccesoEsp('TCRREPALER_MAIL',True,True) then
  begin
    Crmailven := TCrmailven.Create(self);
    try
    Crmailven.apli := Objeto.Apli;
    Crmailven.ParamCre :=Objeto.ParamCre;
    Crmailven.Catalogo;
    finally
    Crmailven.Free;
    end;
  end;
end;

end.
