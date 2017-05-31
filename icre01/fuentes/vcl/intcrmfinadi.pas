// Sistema         : Clase de CRMFINADI
// Fecha de Inicio : 09/07/2004
// Función forma   : Clase de CRMFINADI
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrMFinAdi;

interface           
                      
uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

//CLASES ADICIONALES
IntParamCre,
IntCrAcredit,     // Acreditado
IntCrCredito,
IntQrInfFiAd,     // Disposición
Intempre,         //Empresa
IntUnNeg          //Unidad Negocio/Suc
;
Type
 TCrMFinAdi= class;

  TWCrmfinadi=Class(TForm)
    InterForma1             : TInterForma;
    lbLiqF_INICIO: TLabel;
    Label3: TLabel;
    dtpF_INICIO: TInterDateTimePicker;
    edF_INICIO: TEdit;
    edF_FINAL: TEdit;
    dtpF_FINAL: TInterDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    rgDetalle: TRadioGroup;
    rgOrden: TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    chbxAcreditado: TCheckBox;
    edID_DISPOSICION: TEdit;
    btID_CESION: TBitBtn;
    edID_CRED_EXT: TEdit;
    btCRED_EXT: TBitBtn;
    edDES_DISPOSICION: TEdit;
    edDES_CRED_EXT: TEdit;
    chbxDISPOSICION: TCheckBox;
    chbxCRED_EXTERNO: TCheckBox;
    ilDISPOSICION: TInterLinkit;
    ilCRED_EXT: TInterLinkit;
    Label5: TLabel;
    edID_CONTROL_EXT: TEdit;
    btCONTROL_EXT: TBitBtn;
    ED_DESC_CONTROL: TEdit;
    chbxCONTROL_EXT: TCheckBox;
    ilCONTROL_EXT: TInterLinkit;
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
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    rgSitMov: TRadioGroup;
    rgSITDISP: TRadioGroup;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure btACREDITADOClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure edACREDITADOExit(Sender: TObject);
    procedure edID_DISPOSICIONChange(Sender: TObject);
    procedure edID_DISPOSICIONExit(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure chbxDISPOSICIONClick(Sender: TObject);
    procedure ilDISPOSICIONCapture(Sender: TObject; var Show: Boolean);
    procedure ilDISPOSICIONEjecuta(Sender: TObject);
    procedure btCRED_EXTClick(Sender: TObject);
    procedure ilCRED_EXTEjecuta(Sender: TObject);
    procedure ilCRED_EXTCapture(Sender: TObject; var Show: Boolean);
    procedure chbxCRED_EXTERNOClick(Sender: TObject);
    procedure btCONTROL_EXTClick(Sender: TObject);
    procedure ilCONTROL_EXTEjecuta(Sender: TObject);
    procedure ilCONTROL_EXTCapture(Sender: TObject; var Show: Boolean);
    procedure edID_CRED_EXTChange(Sender: TObject);
    procedure edID_CRED_EXTExit(Sender: TObject);
    procedure edID_CONTROL_EXTChange(Sender: TObject);
    procedure edID_CONTROL_EXTExit(Sender: TObject);
    procedure chbxCONTROL_EXTClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    private
    { Private declarations }
       Procedure ImprimeReporte(bPreview:Boolean);
       Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TCrmfinadi;
end;
 TCrmfinadi= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ParamCre                 : TParamCre;
        Acreditado               : TCrAcredit;
        Credito                  : TCrCredito;//Disposición
        CredExt                  : TCrCredito;//Disposición
        CtrlExt                  : TCrCredito;//Disposición
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;


        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}


constructor TCrmfinadi.Create( AOwner : TComponent );
begin Inherited;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrMFinAdi.Hlp';
      ShowMenuReporte:=True;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      CredExt := TCrCredito.Create(Self);
      CredExt.MasterSource:=Self;

      CtrlExt := TCrCredito.Create(Self);
      CtrlExt.MasterSource:=Self;
      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

end;

Destructor TCrmfinadi.Destroy;
begin
   if Acreditado <> nil then
      Acreditado.Free;
   if Credito <> nil then
      Credito.Free;
   if CredExt  <> nil then
      CredExt.Free;
   if CtrlExt <> nil then
      CtrlExt.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   inherited;
end;


function TCrmfinadi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrmfinadi;
begin
   W:=TWCrmfinadi.Create(Self);
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


Function TCrmfinadi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrmfina.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CRMFINADI********************)
(*                                                                              *)
(*  FORMA DE CRMFINADI                                                            *)
(*                                                                              *)
(***********************************************FORMA CRMFINADI********************)
procedure TWCrmfinadi.AsignaEmpresaSuc;
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

procedure TWCrmfinadi.FormShow(Sender: TObject);
begin
   //PINTA DATOS DEL PANEL INFERIOR
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   dtpF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa;
   edF_INICIO.text:=FormatDateTime('dd/mm/yyyy',dtpF_INICIO.DateTime);
   dtpF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresa;
   edF_FINAL.text:=FormatDateTime('dd/mm/yyyy',dtpF_FINAL.DateTime);

   Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
   Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
   Objeto.GetParams(Objeto);
   edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
   edNOMBRE_ACRED.ShowHint := True;

   Objeto.Credito.ID_CREDITO.Control := edID_DISPOSICION;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edDES_DISPOSICION;
   Objeto.Credito.GetParams(Objeto);
   edID_DISPOSICION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
   edID_DISPOSICION.ShowHint := True;

   Objeto.CredExt.ID_CRED_EXTERNO.Control := edID_CRED_EXT;
   Objeto.CredExt.ContratoCre.Contrato.TITNombre.Control := edDES_CRED_EXT;
   Objeto.CredExt.GetParams(Objeto);
   edID_CRED_EXT.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
   edID_CRED_EXT.ShowHint := True;

   Objeto.CtrlExt.ID_CONTROL_EXT.Control := edID_CONTROL_EXT;
   Objeto.CtrlExt.ContratoCre.Contrato.TITNombre.Control := ED_DESC_CONTROL;
   Objeto.CtrlExt.GetParams(Objeto);
   edID_CONTROL_EXT.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
   edID_CONTROL_EXT.ShowHint := True;

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;
end;

procedure TWCrmfinadi.FormDestroy(Sender: TObject);
begin
    Objeto.Acreditado.ID_ACREDITADO.Control := nil;
    Objeto.Acreditado.Persona.Nombre.Control := nil;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
    Objeto.Credito.ID_CREDITO.Control := nil;
    Objeto.CredExt.ID_CRED_EXTERNO.Control := nil;
    Objeto.CredExt.ContratoCre.Contrato.TITNombre.Control := nil;
    Objeto.CtrlExt.ID_CONTROL_EXT.Control := nil;
    Objeto.CtrlExt.ContratoCre.Contrato.TITNombre.Control := nil;
    Objeto.Empresa.ID_Empresa.Control := Nil;
    Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
    Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
    Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TWCrmfinadi.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrmfinadi.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrmfinadi.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrmfinadi.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrmfinadi.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TWCrmfinadi.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrmfinadi.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TWCrmfinadi.chbxAcreditadoClick(Sender: TObject);
begin
    If not chbxAcreditado.Checked Then Begin
        Objeto.Acreditado.Active:=False;
        chbxAcreditado.Checked:=False;
        chbxAcreditado.Enabled:=False;
    End Else Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
    End;
end;

procedure TWCrmfinadi.edACREDITADOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TWCrmfinadi.edID_DISPOSICIONChange(Sender: TObject);
begin
    If Trim(edID_DISPOSICION.Text)<>'' Then Begin
        chbxDISPOSICION.Checked:=True;
        chbxDISPOSICION.Enabled:=True;
    End Else Begin
        chbxDISPOSICION.Checked:=False;
        chbxDISPOSICION.Enabled:=False;
    End;
end;

procedure TWCrmfinadi.edID_DISPOSICIONExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_DISPOSICION,True,'',True);
end;

procedure TWCrmfinadi.btID_CESIONClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxDISPOSICION.Checked:=True;
        chbxDISPOSICION.Enabled:=True;
        InterForma1.NextTab(edID_DISPOSICION);
   End;
end;

procedure TWCrmfinadi.chbxDISPOSICIONClick(Sender: TObject);
begin
    If not chbxDISPOSICION.Checked Then Begin
        Objeto.Credito.Active:=False;
        chbxDISPOSICION.Checked:=False;
        chbxDISPOSICION.Enabled:=False;
    End Else Begin
        chbxDISPOSICION.Checked:=True;
        chbxDISPOSICION.Enabled:=True;
    End;
end;

procedure TWCrmfinadi.ilDISPOSICIONCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TWCrmfinadi.ilDISPOSICIONEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilDISPOSICION.Buffer]) Then Begin
        chbxDISPOSICION.Checked:=True;
        chbxDISPOSICION.Enabled:=True;
        InterForma1.NextTab(edID_DISPOSICION);
    End;
end;

procedure TWCrmfinadi.btCRED_EXTClick(Sender: TObject);
begin
   Objeto.CredExt.ShowAll := True;
   if Objeto.CredExt.Busca then begin
        chbxCRED_EXTERNO.Checked:=True;
        chbxCRED_EXTERNO.Enabled:=True;
        InterForma1.NextTab(edID_CRED_EXT);
   End;
end;

procedure TWCrmfinadi.ilCRED_EXTEjecuta(Sender: TObject);
begin
    If Objeto.CredExt.FindKeyNear([ilCRED_EXT.Buffer],['ID_CRED_EXTERNO']) Then Begin
        chbxCRED_EXTERNO.Checked:=True;
        chbxCRED_EXTERNO.Enabled:=True;
        InterForma1.NextTab(edID_CRED_EXT);
   End;
end;

procedure TWCrmfinadi.ilCRED_EXTCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TWCrmfinadi.chbxCRED_EXTERNOClick(Sender: TObject);
begin
    If not chbxCRED_EXTERNO.Checked Then Begin
        Objeto.CredExt.Active:=False;
        chbxCRED_EXTERNO.Checked:=False;
        chbxCRED_EXTERNO.Enabled:=False;
    End Else Begin
        chbxCRED_EXTERNO.Checked:=True;
        chbxCRED_EXTERNO.Enabled:=True;
    End;
end;

procedure TWCrmfinadi.btCONTROL_EXTClick(Sender: TObject);
begin
   Objeto.CtrlExt.ShowAll := True;
   if Objeto.CtrlExt.Busca then begin
        chbxCONTROL_EXT.Checked:=True;
        chbxCONTROL_EXT.Enabled:=True;
        InterForma1.NextTab(edID_CONTROL_EXT);
   End;
end;

procedure TWCrmfinadi.ilCONTROL_EXTEjecuta(Sender: TObject);
begin
    If Objeto.CtrlExt.FindKeyNear([ilCONTROL_EXT.Buffer],['ID_CONTROL_EXT']) Then Begin
        chbxCONTROL_EXT.Checked:=True;
        chbxCONTROL_EXT.Enabled:=True;
        InterForma1.NextTab(edID_CONTROL_EXT);
   End;
end;

procedure TWCrmfinadi.ilCONTROL_EXTCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show:= True;
end;

procedure TWCrmfinadi.edID_CRED_EXTChange(Sender: TObject);
begin
    If Trim(edID_CRED_EXT.Text)<>'' Then Begin
        chbxCRED_EXTERNO.Checked:=True;
        chbxCRED_EXTERNO.Enabled:=True;
    End Else Begin
        chbxCRED_EXTERNO.Checked:=False;
        chbxCRED_EXTERNO.Enabled:=False;
    End;
end;

procedure TWCrmfinadi.edID_CRED_EXTExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CRED_EXT,True,'',True);
end;

procedure TWCrmfinadi.edID_CONTROL_EXTChange(Sender: TObject);
begin
    If Trim(edID_CONTROL_EXT.Text)<>'' Then Begin
        chbxCONTROL_EXT.Checked:=True;
        chbxCONTROL_EXT.Enabled:=True;
    End Else Begin
        chbxCONTROL_EXT.Checked:=False;
        chbxCONTROL_EXT.Enabled:=False;
    End;
end;

procedure TWCrmfinadi.edID_CONTROL_EXTExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CONTROL_EXT,True,'',True);
end;

procedure TWCrmfinadi.chbxCONTROL_EXTClick(Sender: TObject);
begin
    If not chbxCONTROL_EXT.Checked Then Begin
        Objeto.CtrlExt.Active:=False;
        chbxCONTROL_EXT.Checked:=False;
        chbxCONTROL_EXT.Enabled:=False;
    End Else Begin
        chbxCONTROL_EXT.Checked:=True;
        chbxCONTROL_EXT.Enabled:=True;
    End;
end;

procedure TWCrmfinadi.ImprimeReporte(bPreview: Boolean);
Var
    sSitMov,sDetalle,sOrden, sSitDisp:String;
    iSit:Integer;
begin
    iSit:=rgDetalle.ItemIndex;
    case iSit of
        0: sDetalle:='D'; //Detalle
        1: sDetalle:='';  //Resumen
    end;
    iSit:=rgOrden.ItemIndex;
    case iSit of
        0: sOrden:='C'; //Crédito
        1: sOrden:='P';  //Persona
    end;

    iSit:=rgSitMov.ItemIndex;
    case iSit of
        0: sSitMov:='AC';  //Activos
        1: sSitMov:='CA';  //Cancelados
    end;

    iSit:=rgSitDisp.ItemIndex;
    case iSit of
        0: sSitDisp:='VE';  //Vencidos
        1: sSitDisp:='VI';  //Vigentes
        2: sSitDisp:='IN';  //Indistintos
    end;

   RepInfFinAdic( edF_INICIO.Text      , edF_FINAL.Text         , edACREDITADO.Text,
                  edID_DISPOSICION.Text, sDetalle               , sOrden           ,
                  edID_CRED_EXT.Text   , edID_CONTROL_EXT.Text  , EdIdEmpresa.Text ,
                  EdIDSucursal.Text    , sSitMov                , sSitDisp         ,
                  Objeto.Apli          , bPreview);
end;

procedure TWCrmfinadi.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRMFINADI_IMPRI',True,True) then
    ImprimeReporte(False);
end;

procedure TWCrmfinadi.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRMFINADI_PREVI',True,True) then
    ImprimeReporte(True);
end;

procedure TWCrmfinadi.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TWCrmfinadi.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWCrmfinadi.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TWCrmfinadi.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWCrmfinadi.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

end.
