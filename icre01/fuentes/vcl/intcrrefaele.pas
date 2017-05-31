// Sistema         : Clase de CrReFaEle
// Fecha de Inicio : 16/10/2012
// Función forma   : Clase de CrReFaEle
// Diseñado por    : Juan Fco. Ortega Flores
// Comentarios     :
Unit IntCrrefaele;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntLinkit,
IntParamCre,
IntMon,       // Moneda
IntCrEmisor,  // Emisor
IntCrEmiPro,  // EmiProv
//IntNetcnto, // Usuario Net Contrato
Intempre,     // EMPRESA
IntUnNeg,     // Unidad Negocio/Suc
IntMQrFaEle,  // REPORTE
IntMAcuFaEl   // ACUSE
;

Type
 TCrrefaele= class; 

  TWCrrefaele=Class(TForm)
    InterForma1        : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
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
    GroupBox4: TGroupBox;
    lbID_EMISOR: TLabel;
    edID_EMISOR: TEdit;
    btEMISOR: TBitBtn;
    edNOM_EMISOR: TEdit;
    cbBEMISOR: TCheckBox;
    lbID_PROVEEDOR: TLabel;
    edID_PROVEEDOR: TEdit;
    btPROVEEDOR: TBitBtn;
    edNOM_PROVEED: TEdit;
    cbBPROV: TCheckBox;
    lbAplica: TLabel;
    Label5: TLabel;
    edDOCUMENTO: TEdit;
    Label7: TLabel;
    edFOL_ACUSE: TEdit;
    ChBxDocto: TCheckBox;
    ChBxFolio: TCheckBox;
    Situacion: TGroupBox;
    ChBxNG: TCheckBox;
    ChBxCS: TCheckBox;
    ChBxXD: TCheckBox;
    ChBxBA: TCheckBox;
    ChBxOR: TCheckBox;
    ChBxVS: TCheckBox;
    ChBxCA: TCheckBox;
    Label8: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    SaveDialog1: TSaveDialog;
    cbxArchivo: TCheckBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edF_VntoIni: TEdit;
    dtpF_CORTEIni: TInterDateTimePicker;
    edF_VntoFin: TEdit;
    InterDateTimePicker1: TInterDateTimePicker;
    ChBxFV: TCheckBox;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edF_DsctoIni: TEdit;
    InterDateTimePicker2: TInterDateTimePicker;
    edF_DsctoFin: TEdit;
    InterDateTimePicker3: TInterDateTimePicker;
    ChBxFDe: TCheckBox;
    ilEMISOR: TInterLinkit;
    ilPROVEEDOR: TInterLinkit;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    edDESC_MONEDA: TEdit;
    cbMoneda: TCheckBox;
    BitBtn1: TBitBtn;
    ilMONEDA: TInterLinkit;
    ChBxTod: TCheckBox;
    RadioGroup1: TRadioGroup;
    RBtnFhDescto: TRadioButton;
    RBtnFhVencim: TRadioButton;
    RBtnSit: TRadioButton;
    RBtnDocto: TRadioButton;
    Label9: TLabel;
    edFOL_OPER: TEdit;
    ChBxOper: TCheckBox;
    Label10: TLabel;
    btUSUNETCTO: TBitBtn;
    edNOM_USUNETCTO: TEdit;
    cbUsuario: TCheckBox;
    ilUSUNETCTO: TInterLinkit;
    edUSU_NETCTO: TEdit;
    GroupBox2: TGroupBox;
    RBDetalle: TRadioButton;
    RBAcuse: TRadioButton;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure cbBEMISORClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure cbMonedaClick(Sender: TObject);
    procedure cbBPROVClick(Sender: TObject);
    procedure edDOCUMENTOChange(Sender: TObject);
    procedure edFOL_ACUSEChange(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure ChBxFVClick(Sender: TObject);
    procedure ChBxFDeClick(Sender: TObject);
    procedure edF_VntoIniChange(Sender: TObject);
    procedure edF_DsctoIniChange(Sender: TObject);
    procedure ChBxTodClick(Sender: TObject);
    procedure EnableCheckBox(var CheckBox : TCheckBox);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure ImprimeReporte(bPreview: Boolean);
    procedure edF_VntoFinChange(Sender: TObject);
    procedure edF_DsctoFinChange(Sender: TObject);
    procedure ChBxDoctoClick(Sender: TObject);
    procedure ChBxFolioClick(Sender: TObject);
    procedure edFOL_OPERChange(Sender: TObject);
    procedure ChBxOperClick(Sender: TObject);
    procedure ilUSUNETCTOEjecuta(Sender: TObject);
    procedure cbUsuarioClick(Sender: TObject);
    procedure btUSUNETCTOClick(Sender: TObject);
    procedure RBAcuseClick(Sender: TObject);
    procedure RBDetalleClick(Sender: TObject);
    private
    { Private declarations }
    procedure AsignaEmpresaSuc;

    public 
    { Public declarations } 
    Objeto : TCrrefaele;
end; 
 TCrrefaele= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        { Public declarations }
        CVE_MONEDA    : TInterCampo;
        ID_EMISOR     : TInterCampo;
        ID_PROVEEDOR  : TInterCampo;
        USUARIO_NET   : TInterCampo;

        ParamCre      : TParamCre;
        Emisor        : TCrEmisor;  //Emisor
        EmiProv       : TCrEmiPro;
        Moneda        : TMoneda;    //Moneda
//        UsuNetCto     : TNetcnto;
        Empresa       : TEmpresa;   //Empresa
        UnidadNegocio : TUnNegocio; //Sucursal

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrrefaele.Create( AOwner : TComponent ); 
begin Inherited;

      CVE_MONEDA  := CreaCampo('CVE_MONEDA',ftInteger,tsNinguno,tsNinguno,False);
                     CVE_MONEDA.Caption:='MONEDA';
                     CVE_MONEDA.Parametro:='CVE_MONEDA';
      ID_EMISOR   := CreaCampo('ID_EMISOR',ftString,tsNinguno,tsNinguno,False);
                     ID_EMISOR.Caption:='Emisor';
                     ID_EMISOR.Parametro:='ID_EMISOR';
      ID_PROVEEDOR := CreaCampo('ID_PROVEEDOR',ftString,tsNinguno,tsNinguno,False);
                      ID_PROVEEDOR.Caption:='Proveedor';
                      ID_PROVEEDOR.Parametro:='ID_PROVEEDOR';
      USUARIO_NET  := CreaCampo('CVE_USUARIO',ftString,tsNinguno,tsNinguno,False);
                      USUARIO_NET.Caption:='Usuario Net Contrato';
                      USUARIO_NET.Parametro:='CVE_USUARIO';



      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;

      Emisor:= TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;

      EmiProv := TCrEmiPro.Create(Self);
      EmiProv.MasterSource:=Self;

      EmiProv.FieldByName('ID_PROVEEDOR').MasterField:='ID_PROVEEDOR';

//      UsuNetCto := TNetcnto.Create(Self);
//      UsuNetCto.MasterSource:=Self;

      // Empresa
      Empresa := TEmpresa.Create(Self);
      // Sucursal
      UnidadNegocio := TUnNegocio.Create(Self);

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrrefaele.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrrefaele.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   if Emisor<> nil then
      Emisor.free;
   if EmiProv <> nil then
      EmiProv.Free;
//   if UsuNetCto <> nil then
//      UsuNetCto.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
inherited;
end;


function TCrrefaele.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrrefaele;
begin
   W:=TWCrrefaele.Create(Self);
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


Function TCrrefaele.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrrefae.it','');
//      T := CreaBuscador('INETCONTRO.IT','S,F,S');
      Try if Active then begin end;
//          T.Param(0,ID_CONTRATO.AsString};
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrrefaele.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrReFaEle********************)
(*                                                                              *)
(*  FORMA DE CrReFaEle                                                            *)
(*                                                                              *)                                              
(***********************************************FORMA CrReFaEle********************)

procedure TWCrrefaele.FormShow(Sender: TObject);
begin
      Objeto.ID_EMISOR.Control := edID_EMISOR;
      Objeto.ID_PROVEEDOR.Control := edID_PROVEEDOR;
      Objeto.CVE_MONEDA.Control := edCVE_MONEDA;
      Objeto.USUARIO_NET.Control := edUSU_NETCTO;

      Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;

      Objeto.Emisor.ID_ACREDITADO.Control := edID_EMISOR;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOM_EMISOR;

      Objeto.EmiProv.ID_PROVEEDOR.Control := edID_PROVEEDOR;
      Objeto.EmiProv.Proveedor.Persona.Nombre.Control :=edNOM_PROVEED;
      Objeto.EmiProv.GetParams(Objeto);


//      Objeto.UsuNetCto.CVE_USUARIO.Control := edUSU_NETCTO;
//      Objeto.UsuNetCto.NOMBRE.Control := edNOM_USUNETCTO;

      //DATOS DE USUARIO, FECHA Y PERFIL
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      // EMPRESA
      Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
      Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      Objeto.Empresa.GetParams(Objeto);
      // SUCURSAL
      Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
      Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
      Objeto.UnidadNegocio.GetParams(Objeto);

      AsignaEmpresaSuc;

      ChBxTodClick(Self);

end;

procedure TWCrrefaele.FormDestroy(Sender: TObject);
begin
    Objeto.ID_EMISOR.Control := nil;
    Objeto.ID_PROVEEDOR.Control := nil;
    Objeto.CVE_MONEDA.Control := Nil;
    Objeto.USUARIO_NET.Control := nil;

    Objeto.Moneda.Cve_Moneda.Control := nil;
    Objeto.Moneda.Desc_Moneda.Control := nil;

    Objeto.Emisor.ID_ACREDITADO.Control := nil;
    Objeto.Emisor.Acreditado.Persona.Nombre.Control := nil;

//    Objeto.UsuNetCto.CVE_USUARIO.Control := nil;
//    Objeto.UsuNetCto.NOMBRE.Control := nil;

    Objeto.EmiProv.ID_PROVEEDOR.Control := nil;
    Objeto.EmiProv.Proveedor.Persona.Nombre.Control :=nil;

    // Empresa
    Objeto.Empresa.ID_Empresa.Control := Nil;
    Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
    // Sucursal
    Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
    Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;

end;

procedure TWCrrefaele.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrrefaele.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrrefaele.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;


procedure TWCrrefaele.btEMISORClick(Sender: TObject);
begin
   Objeto.Emisor.BuscaWhereString := ' cr_emisor.cve_fnd_ent_des =(SELECT cve_parametro' +
                                          '                          FROM cr_fe_parametro' +
                                          '                         WHERE parametro = ''CVE_FND_ENT_DES_BINT'')';


   Objeto.Emisor.ShowAll := True;
   if Objeto.Emisor.Busca then
   Begin
      cbBEMISOR.Checked := True;
      cbBEMISOR.Enabled := True;
      InterForma1.NextTab(edID_EMISOR);
   end
end;


procedure TWCrrefaele.ilEMISOREjecuta(Sender: TObject);
begin
   if Objeto.Emisor.FindKeyNear([ilEMISOR.Buffer],['ID_ACREDITADO']) then
   Begin
      cbBEMISOR.Checked := True;
      cbBEMISOR.Enabled := True;
      InterForma1.NextTab(edID_EMISOR);
   end
end;

procedure TWCrrefaele.btPROVEEDORClick(Sender: TObject);
begin

if  edID_EMISOR.Text = '' then
    begin

    Objeto.EmiProv.BuscaWhereString := ' cr_emisor_prov.cve_fnd_ent_des =(SELECT cve_parametro' +
                                       '                                    FROM cr_fe_parametro' +
                                       '                                   WHERE parametro = ''CVE_FND_ENT_DES_BINT'')';
                                         //'      AND id_emisor = '+Objeto.ID_EMISOR.AsSQL+')';
   end
   else begin
    Objeto.EmiProv.BuscaWhereString := ' cr_emisor_prov.cve_fnd_ent_des =(SELECT cve_parametro' +
                                       '                                    FROM cr_fe_parametro' +
                                       '                                   WHERE parametro = ''CVE_FND_ENT_DES_BINT'''+
                                       '   AND cr_emisor_prov.id_emisor = '+edID_EMISOR.Text+')';

   end;
      Objeto.EmiProv.ShowAll := True;
   if Objeto.EmiProv.Busca then
   Begin
      cbBPROV.Checked := True;
      cbBPROV.Enabled := True;
      InterForma1.NextTab(edID_PROVEEDOR);
   end
end;

procedure TWCrrefaele.ilPROVEEDOREjecuta(Sender: TObject);
begin
   if Objeto.EmiProv.FindKeyNear([ilPROVEEDOR.Buffer],['ID_PROVEEDOR']) then

   Begin
      cbBPROV.Checked := True;
      cbBPROV.Enabled := True;
      InterForma1.NextTab(edID_PROVEEDOR);
   end

end;

procedure TWCrrefaele.AsignaEmpresaSuc;
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

procedure TWCrrefaele.EnableCheckBox(var CheckBox: TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;


procedure TWCrrefaele.cbBEMISORClick(Sender: TObject);
begin
   EnableCheckBox(cbBEMISOR);
   Objeto.Emisor.Active := cbBEMISOR.Checked;
end;


procedure TWCrrefaele.BitBtn1Click(Sender: TObject);
begin
      Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        cbMoneda.Checked:= True;
        cbMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWCrrefaele.ilMONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
      cbMoneda.Checked:=True;
      cbMoneda.Enabled:=True;
   End;
end;

procedure TWCrrefaele.cbMonedaClick(Sender: TObject);
begin
   EnableCheckBox(cbMoneda);
   Objeto.Moneda.Active := cbMoneda.Checked;
end;

procedure TWCrrefaele.cbBPROVClick(Sender: TObject);
begin
   EnableCheckBox(cbBPROV);
   Objeto.EmiProv.Active := cbBPROV.Checked;
end;

procedure TWCrrefaele.edDOCUMENTOChange(Sender: TObject);
begin
   ChBxDocto.Checked := True;
   ChBxDocto.Enabled := True;
end;

procedure TWCrrefaele.edFOL_ACUSEChange(Sender: TObject);
begin
   ChBxFolio.Checked := True;
   ChBxFolio.Enabled := True;
end;

procedure TWCrrefaele.sbExcelClick(Sender: TObject);
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

procedure TWCrrefaele.cbxArchivoClick(Sender: TObject);
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

procedure TWCrrefaele.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked := True;
        cbxArchivo.Enabled := True;
    End Else Begin
        cbxArchivo.Checked := False;
        cbxArchivo.Enabled := False;
    End;
end;

procedure TWCrrefaele.ChBxFVClick(Sender: TObject);
begin
    If not ChBxFV.Checked Then Begin
        edF_VntoIni.Text:= '';
        edF_VntoFin.Text:= '';
        ChBxFV.Checked := False;
        ChBxFV.Enabled := False;
    End Else Begin
        ChBxFV.Checked := True;
        ChBxFV.Enabled := True;
    End;
end;

procedure TWCrrefaele.ChBxFDeClick(Sender: TObject);
begin
    If not ChBxFDe.Checked Then Begin
        edF_DsctoIni.Text:= '';
        edF_DsctoFin.Text:= '';
        ChBxFDe.Checked := False;
        ChBxFDe.Enabled := False;
    End
    Else Begin
        ChBxFDe.Checked := True;
        ChBxFDe.Enabled := True;
    End;
end;

procedure TWCrrefaele.edF_VntoIniChange(Sender: TObject);
begin
  ChBxFV.Checked := True;
end;

procedure TWCrrefaele.edF_DsctoIniChange(Sender: TObject);
begin
   ChBxFDe.Checked := True;
end;

procedure TWCrrefaele.ChBxTodClick(Sender: TObject);
begin
    If not ChBxTod.Checked Then Begin
      ChBxNG.Checked := False;
      ChBxXD.Checked := False;
      ChBxOR.Checked := False;
      ChBxCA.Checked := False;
      ChBxCS.Checked := False;
      ChBxBA.Checked := False;
      ChBxVS.Checked := False;
    End
    Else Begin
      ChBxNG.Checked := True;
      ChBxXD.Checked := True;
      ChBxOR.Checked := True;
      ChBxCA.Checked := True;
      ChBxCS.Checked := True;
      ChBxBA.Checked := True;
      ChBxVS.Checked := True;
    End;

end;

procedure TWCrrefaele.InterForma1BtnPreviewClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRREFAELE_PRE',True,True) then // FUNCION DE SEGURDIADES 30/10/2012 JFOF
    ImprimeReporte(True);
end;

procedure TWCrrefaele.InterForma1BtnImprimirClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRREFAELE_IMP',True,True) then // FUNCION DE SEGURDIADES 30/10/2012 JFOF
   ImprimeReporte(False);
end;

procedure TWCrrefaele.ImprimeReporte(bPreview: Boolean);
var tiprep, agrup : String;
    vltod, vlng, vlxd, vlor, vlca,vlcs, vlba, vlvs : String;
    vlusuario, vlfechahr : String;

    vlsalida : Boolean;
begin
    vlusuario := '';
    vlfechahr := '';

if RBDetalle.Checked then begin

    vlsalida := True;
    //situaciones
    if ChBxTod.Checked then
         vltod := 'TOD';
    if ChBxNG.Checked then
         vlng := 'NG';
    if ChBxXD.Checked then
         vlxd := 'XD';
    if ChBxOR.Checked then
         vlor := 'OR';
    if ChBxCA.Checked then
         vlca := 'CA';
    if ChBxCS.Checked then
         vlcs := 'CS';
    if ChBxBA.Checked then
         vlba := 'BA';
    if ChBxVS.Checked then
         vlvs := 'VS';
    //ordenar por
    if RBtnFhDescto.Checked then
         tiprep := 'FHD';
    if RBtnFhVencim.Checked then
         tiprep := 'FHV';
    if RBtnSit.Checked then
         tiprep := 'SIT';
    if RBtnDocto.Checked then
         tiprep := 'DOC';

    //Agrupa por Emisor - Proveedor
    if (cbBPROV.Checked) and (cbBEMISOR.Checked = false) then
        begin
           agrup := 'PRO';
        end
        else
           agrup := 'EMI';

    //valida rango de Fechas
    if (ChBxFV.Checked) or (ChBxFDe.Checked) then
        begin
           if (ChBxFV.Checked) then
           begin
             if (Trim(edF_VntoIni.Text)= '') or (Trim(edF_VntoFin.Text)= '') then
              begin
              ShowMessage('   ¡ Validar Rango de Fechas Prog. de Pago !');
              vlsalida := False;
              end;

             if (Trim(edF_VntoIni.Text) > Trim(edF_VntoFin.Text)) then
             begin
             ShowMessage('   ¡ La Fecha Prog. de Pago Final no puede ser menor a la Inicial !');
             vlsalida := False;
             end;
           end;

           if (ChBxFDe.Checked) then
           begin
             if (Trim(edF_DsctoIni.Text)= '') or (Trim(edF_DsctoFin.Text)= '') then
              begin
              ShowMessage('   ¡ Validar Rango de Fechas de Publicación !');
              vlsalida := False;
              end;

             if (Trim(edF_DsctoIni.Text) > Trim(edF_DsctoFin.Text)) then
             begin
             ShowMessage('   ¡ La Fecha de Publicación Final no puede ser menor a la Inicial !');
             vlsalida := False;
             end;
           end;
        end;

     //VALIDA SITUACIONES
        if (ChBxNG.Checked = False) and (ChBxXD.Checked = False) and (ChBxOR.Checked = False) and (ChBxCA.Checked = False) and
           (ChBxCS.Checked = False) and (ChBxBA.Checked = False) and (ChBxVS.Checked = False)  then
           begin
           Showmessage('   ¡ Favor de seleccionar al menos una situación !');
            vlsalida := False;
           end;   

     if vlsalida then
     //Ejecuta Reporte
     begin
             RepFacEle ( edF_VntoIni.Text, edF_VntoFin.Text, edF_DsctoIni.Text, edF_DsctoFin.Text,
                         edCVE_MONEDA.Text, edID_EMISOR.Text, edID_PROVEEDOR.Text, edUSU_NETCTO.Text, edDOCUMENTO.Text,
                         edFOL_ACUSE.Text, edFOL_OPER.Text, EdIdEmpresa.Text, EdIDSucursal.Text, edNbrArch.Text,
                         tiprep, agrup, vltod, vlng, vlxd, vlor, vlca,vlcs, vlba, vlvs,
                         bPreview, Objeto.Apli );

            if Trim(edNbrArch.Text) <> '' then
            begin
               if  bGenArch then
                 ShowMessage('    El Archivo se generó correctamente')
               else
                 ShowMessage('    No se generó el Archivo')
            end;
     end;

  end
  else
  begin
       vlusuario := Objeto.ParamCre.DameUsuario; 
       vlfechahr := FormatDateTime('DD/MM/YYYY HH:NN:SS AMPM',Objeto.Apli.SysDateTime);//Objeto.Apli.DameFechaEmpresa);

       AcuFaEle ( edF_VntoIni.Text, edF_VntoFin.Text, edCVE_MONEDA.Text, edID_EMISOR.Text, edID_PROVEEDOR.Text,
                  edDOCUMENTO.Text, edFOL_ACUSE.Text, edFOL_OPER.Text, vlusuario, vlfechahr, bPreview, Objeto.Apli );
  end;

end;

procedure TWCrrefaele.edF_VntoFinChange(Sender: TObject);
begin
  ChBxFV.Checked := True;
end;

procedure TWCrrefaele.edF_DsctoFinChange(Sender: TObject);
begin
   ChBxFDe.Checked := True;
end;

procedure TWCrrefaele.ChBxDoctoClick(Sender: TObject);
begin
    If not ChBxDocto.Checked Then Begin
        edDOCUMENTO.Text:= '';
        ChBxDocto.Checked := False;
        ChBxDocto.Enabled := False;
    End Else Begin
        ChBxDocto.Checked := True;
        ChBxDocto.Enabled := True;
    End;
end;

procedure TWCrrefaele.ChBxFolioClick(Sender: TObject);
begin
    If not ChBxFolio.Checked Then Begin
        edFOL_ACUSE.Text:= '';
        ChBxFolio.Checked := False;
        ChBxFolio.Enabled := False;
    End Else Begin
        ChBxFolio.Checked := True;
        ChBxFolio.Enabled := True;
    End;
end;


procedure TWCrrefaele.edFOL_OPERChange(Sender: TObject);
begin
   ChBxOper.Checked := True;
   ChBxOper.Enabled := True;
end;

procedure TWCrrefaele.ChBxOperClick(Sender: TObject);
begin
    If not ChBxOper.Checked Then Begin
        edFOL_OPER.Text:= '';
        ChBxOper.Checked := False;
        ChBxOper.Enabled := False;
    End Else Begin
        ChBxOper.Checked := True;
        ChBxOper.Enabled := True;
    End;
end;

procedure TWCrrefaele.ilUSUNETCTOEjecuta(Sender: TObject);
begin
{   If Objeto.UsuNetCto.FindKeyNear([ilUSUNETCTO.Buffer],['CVE_USUARIO']) Then Begin
      cbUsuario.Checked:=True;
      cbUsuario.Enabled:=True;
      InterForma1.NextTab(edUSU_NETCTO);
   End; }
end;

procedure TWCrrefaele.cbUsuarioClick(Sender: TObject);
begin
   EnableCheckBox(cbUsuario);
//   Objeto.UsuNetCto.Active := cbUsuario.Checked;
  if not (cbUsuario.Checked ) then Begin
          edUSU_NETCTO.Text := '';
          edNOM_USUNETCTO.Text := '';
     End;
end;

procedure TWCrrefaele.btUSUNETCTOClick(Sender: TObject);
{
      Objeto.UsuNetCto.ShowAll := True;
   if Objeto.UsuNetCto.Busca then Begin
        cbUsuario.Checked:= True;
        cbUsuario.Enabled:= True;
        InterForma1.NextTab(edUSU_NETCTO);
   End;    }

Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('INETCONTRO.IT','S,F,S');
      Try
        If T.Execute Then
           Begin
             edUSU_NETCTO.Text := T.DameCampo(1);
             edNOM_USUNETCTO.Text := T.DameCampo(2);
             cbUsuario.Enabled:=True;
             cbUsuario.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TWCrrefaele.RBAcuseClick(Sender: TObject);
begin
  GroupBox1.Caption := 'Fecha de Descuento';
  GroupBox3.Caption := '';

  edF_DsctoIni.Enabled  := False;
  edF_DsctoIni.Color    := clBtnFace;
  InterDateTimePicker2.Enabled  := False;
  edF_DsctoFin.Enabled  := False;
  edF_DsctoFin.Color    := clBtnFace;
  InterDateTimePicker3.Enabled  := False;
  ChBxFDe.Enabled  := False;

  ChBxTod.Enabled     := False;
  ChBxNG.Enabled      := False;
  ChBxXD.Enabled      := False;
  ChBxOR.Enabled      := False;
  ChBxCA.Enabled      := False;
  ChBxCS.Enabled      := False;
  ChBxBA.Enabled      := False;
  ChBxVS.Enabled      := False;

  Situacion.Caption := '';
  RadioGroup1.Caption := '';

  RBtnFhDescto.Enabled := False;
  RBtnFhVencim.Enabled := False;
  RBtnSit.Enabled      := False;
  RBtnDocto.Enabled    := False;

  sbExcel.Enabled    := False;
  cbxArchivo.Enabled := False;
end;

procedure TWCrrefaele.RBDetalleClick(Sender: TObject);
begin
  GroupBox1.Caption := 'Fecha Prog. Pago';
  GroupBox3.Caption := 'Fecha Publicación';

  edF_DsctoIni.Enabled  := True;
  edF_DsctoIni.Color    := clWindow;
  InterDateTimePicker2.Enabled  := True;
  edF_DsctoFin.Enabled  := True;
  edF_DsctoFin.Color    := clWindow;
  InterDateTimePicker3.Enabled  := True;
  ChBxFDe.Enabled  := True;

  ChBxTod.Enabled     := True;
  ChBxNG.Enabled      := True;
  ChBxXD.Enabled      := True;
  ChBxOR.Enabled      := True;
  ChBxCA.Enabled      := True;
  ChBxCS.Enabled      := True;
  ChBxBA.Enabled      := True;
  ChBxVS.Enabled      := True;

  Situacion.Caption := 'Situación';
  RadioGroup1.Caption := 'Ordenado por :';

  RBtnFhDescto.Enabled := True;
  RBtnFhVencim.Enabled := True;
  RBtnSit.Enabled      := True;
  RBtnDocto.Enabled    := True;

  sbExcel.Enabled    := True;
  cbxArchivo.Enabled := True;
end;

end.
