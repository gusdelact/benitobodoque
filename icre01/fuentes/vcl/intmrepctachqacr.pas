// Sistema         : Clase de RepCtaAcr
// Fecha de Inicio : 26/05/2005
// Función forma   : Clase de RepCtaAcr
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMRepCtaChqAcr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntParamCre,
IntMon,         //Moneda
IntCrAcredit,   //Acreditado
IntCrCreChe,    //Cuenta de Cheques
IntMQrCtaChqAcr,//Reporte
Intempre,       //Empresa
IntCrCredito,     //Disposición  <LOLS 10 MAR 2006 SE AGREGA FILTRO POR DISPOSICION>
IntUnNeg, UCrpe32        //Unidad Negocio/Suc
;

Type
 TMRepChqAc= class;

  TWMRepChqAc=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_MONEDA : TLabel;
    edCVE_MONEDA : TEdit;
    edDESC_MONEDA : TEdit;
    lbID_ACREDITADO : TLabel; 
    edID_ACREDITADO : TEdit; 
    edNOMBRE_ACRED : TEdit;
    lbCUENTA_BANCO : TLabel; 
    edCUENTA_BANCO : TEdit;
    edBANCO : TEdit;
    btMoneda: TBitBtn;
    btAcreditado: TBitBtn;
    btCtaChequera: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbAplica: TLabel;
    chbMoneda: TCheckBox;
    chbAcreditado: TCheckBox;
    chbCtaCheques: TCheckBox;
    ilCVE_MONEDA: TInterLinkit;
    ilID_ACREDITADO: TInterLinkit;
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
    rptReporte: TCrpe;
    Label2: TLabel;
    edID_CREDITO: TEdit;
    btID_CREDITO: TBitBtn;
    ilID_CREDITO: TInterLinkit;
    edDESC_CREDITO: TEdit;
    chbxID_CREDITO: TCheckBox;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btMonedaClick(Sender: TObject);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure chbMonedaClick(Sender: TObject);
    procedure btAcreditadoClick(Sender: TObject);
    procedure ilID_ACREDITADOEjecuta(Sender: TObject);
    procedure chbAcreditadoClick(Sender: TObject);
    procedure btCtaChequeraClick(Sender: TObject);
    procedure chbCtaChequesClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure chbxID_CREDITOClick(Sender: TObject);
    private 
     Procedure EnableCheckBox(var CheckBox : TCheckBox);
     Procedure ImprimeReporte(bPreview:Boolean);
     Procedure AsignaEmpresaSuc;
    { Private declarations }
    public
    { Public declarations }
    Objeto : TMRepChqAc;
end;
 TMRepChqAc= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_MONEDA               : TInterCampo;
        DESC_MONEDA              : TInterCampo;
        ID_ACREDITADO            : TInterCampo;
        NOMBRE_ACRED             : TInterCampo;
        CUENTA_BANCO             : TInterCampo;
        BANCO                    : TInterCampo;
        ID_EMPRESA               : TInterCampo;

        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;
        Acreditado               : TCrAcredit;
        Credito                  : TCrCredito;  //Disposición  <LOLS 10 MAR 2006 SE AGREGA FILTRO POR DISPOSICION>
        CtaCheques               : TCrCreChe;
        UnidadNegocio           : TUnNegocio;
        Empresa                 : TEmpresa;

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

constructor TMRepChqAc.Create( AOwner : TComponent );
begin Inherited;
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftInteger,tsNinguno,tsNinguno,False);
                CVE_MONEDA.Caption:='Moneda';
                CVE_MONEDA.Parametro:='CVE_MONEDA';
      DESC_MONEDA :=CreaCampo('DESC_MONEDA',ftString,tsNinguno,tsNinguno,False);
                DESC_MONEDA.Caption:='Descripción de Moneda';
                DESC_MONEDA.Parametro:='DESC_MONEDA';
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);
                ID_ACREDITADO.Caption:='Acreditado';
                ID_ACREDITADO.Parametro:='ID_ACREDITADO';
      NOMBRE_ACRED :=CreaCampo('NOMBRE_ACRED',ftString,tsNinguno,tsNinguno,False);
                NOMBRE_ACRED.Caption:='Nombre ';
                NOMBRE_ACRED.Parametro:='NOMBRE_ACRED';
      CUENTA_BANCO :=CreaCampo('CUENTA_BANCO',ftString,tsNinguno,tsNinguno,False);
                CUENTA_BANCO.Caption:='Cuenta de Cheques';
                CUENTA_BANCO.Parametro:='CUENTA_BANCO';
      BANCO :=CreaCampo('BANCO',ftString,tsNinguno,tsNinguno,False);
                BANCO.Caption:='Cta';
                BANCO.Parametro:='BANCO';
      ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,False);
                BANCO.Caption:='Empresa';
                BANCO.Parametro:='ID_EMPRESA';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
      CtaCheques := TCrCreChe.Create(Self);
      CtaCheques.MasterSource:=Self;
      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      //
      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      //

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMRepCtaChqAcr.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMRepChqAc.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   If Acreditado <> Nil Then
      Acreditado.Free;
   If CtaCheques <> Nil Then
      CtaCheques.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   if Credito <> nil then
      Credito.Free;
   inherited;
end;


function TMRepChqAc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMRepChqAc;
begin
   W:=TWMRepChqAc.Create(Self);
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


Function TMRepChqAc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IRepctaa.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TMRepChqAc.Reporte:Boolean;
begin //Execute_Reporte();
end;
(***********************************************FORMA RepCtaAcr********************)
(*                                                                              *)
(*  FORMA DE RepCtaAcr                                                            *)
(*                                                                              *)
(***********************************************FORMA RepCtaAcr********************)
procedure TWMRepChqAc.AsignaEmpresaSuc;
begin
   Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);
   If  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) Then
      CBSucursal.Checked := True;
   EdIdEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   bbEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   BBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   CBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
end;

Procedure TWMRepChqAc.EnableCheckBox(Var CheckBox : TCheckBox);
Begin
   If Not CheckBox.Checked Then Begin
      CheckBox.Checked:=False;
      CheckBox.Enabled:=False;
   End Else Begin
      CheckBox.Checked:=True;
      CheckBox.Enabled:=True;
   End;
End;

procedure TWMRepChqAc.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.CVE_MONEDA.Control:=edCVE_MONEDA;
   Objeto.DESC_MONEDA.Control:=edDESC_MONEDA;
   Objeto.ID_ACREDITADO.Control:=edID_ACREDITADO;
   Objeto.NOMBRE_ACRED.Control:=edNOMBRE_ACRED;
   Objeto.CUENTA_BANCO.Control:=edCUENTA_BANCO;
   Objeto.BANCO.Control:=edBANCO;
   Objeto.ID_EMPRESA.Control:=EdIdEmpresa;

   Objeto.Moneda.Cve_Moneda.Control:= edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control:= edDESC_MONEDA;
   Objeto.Acreditado.ID_ACREDITADO.Control:= edID_ACREDITADO;
   Objeto.Acreditado.Persona.Nombre.Control:= edNOMBRE_ACRED;
   Objeto.CtaCheques.CUENTA_BANCO.Control:= edCUENTA_BANCO;
   Objeto.CtaCheques.Persona.Nombre.Control:= edBANCO;

   Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edDESC_CREDITO;

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);
   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;
end;

procedure TWMRepChqAc.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_MONEDA.Control:=nil;
   Objeto.DESC_MONEDA.Control:=nil;
   Objeto.ID_ACREDITADO.Control:=nil;
   Objeto.NOMBRE_ACRED.Control:=nil;
   Objeto.CUENTA_BANCO.Control:=nil;
   Objeto.BANCO.Control:=nil;
   Objeto.ID_EMPRESA.Control:=nil;

   Objeto.Moneda.Cve_Moneda.Control:= nil;
   Objeto.Moneda.Desc_Moneda.Control:= nil;
   Objeto.Acreditado.ID_ACREDITADO.Control:= nil;
   Objeto.Acreditado.Persona.Nombre.Control:= nil;
   Objeto.CtaCheques.CUENTA_BANCO.Control:= nil;
   Objeto.CtaCheques.Persona.Nombre.Control:= nil;

   Objeto.Credito.ID_CREDITO.Control := nil;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;


   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TWMRepChqAc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMRepChqAc.btMonedaClick(Sender: TObject);
begin
   If Objeto.Moneda.Busca Then Begin
      chbMoneda.Checked:= True;
      chbMoneda.Enabled:= True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWMRepChqAc.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilCVE_MONEDA.Buffer]) Then Begin
      chbMoneda.Checked:=True;
      chbMoneda.Enabled:=True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWMRepChqAc.chbMonedaClick(Sender: TObject);
begin
   EnableCheckBox(chbMoneda);
   Objeto.Moneda.Active := chbMoneda.Checked;
end;

procedure TWMRepChqAc.btAcreditadoClick(Sender: TObject);
begin
   If Objeto.Acreditado.Busca Then Begin
      chbAcreditado.Checked:= True;
      chbAcreditado.Enabled:= True;
      InterForma1.NextTab(edID_ACREDITADO);
   End;
end;

procedure TWMRepChqAc.ilID_ACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Acreditado.FindKey([ilID_ACREDITADO.Buffer]) Then Begin
      chbAcreditado.Checked:=True;
      chbAcreditado.Enabled:=True;
      InterForma1.NextTab(edID_ACREDITADO);
   End;
end;

procedure TWMRepChqAc.chbAcreditadoClick(Sender: TObject);
begin
   EnableCheckBox(chbAcreditado);
   Objeto.Acreditado.Active := chbAcreditado.Checked;
end;

procedure TWMRepChqAc.btCtaChequeraClick(Sender: TObject);
begin
   If Objeto.CtaCheques.Busca Then Begin
      chbCtaCheques.Checked:= True;
      chbCtaCheques.Enabled:= True;
      InterForma1.NextTab(btCtaChequera);
   End;
end;

procedure TWMRepChqAc.chbCtaChequesClick(Sender: TObject);
begin
   EnableCheckBox(chbCtaCheques);
   Objeto.CtaCheques.Active := chbCtaCheques.Checked;
end;

Procedure TWMRepChqAc.ImprimeReporte(bPreview:Boolean);
begin
   Objeto.GetFromControl;
   {rptReporte.Connect.ServerName := Objeto.Apli.DataBase.Params.Values['SERVER NAME'];
   rptReporte.Connect.UserID     := Objeto.Apli.DataBase.Params.Values['USER NAME'];
   rptReporte.Connect.Password   := Objeto.Apli.DataBase.Params.Values['PASSWORD'];
   rptReporte.Connect.Propagate  := True;
   rptReporte.Output := toWindow;

   rptReporte.ReportName := '\\Inter25\corp\Delphide\ICre01\Reportes\RepCtaChqAcred.rpt';

   rptReporte.ParamFields.Clear;
   rptReporte.ParamFields.Retrieve;
   rptReporte.ParamFields.Name := 'pCUENTA_BANCO';
   rptReporte.ParamFields.Value := Objeto.CUENTA_BANCO.AsString;
   rptReporte.ParamFields.Name := 'pCVE_MONEDA';
   rptReporte.ParamFields.AsNumber := Objeto.CVE_MONEDA.AsInteger;
   rptReporte.ParamFields.Name := 'pID_ACREDITADO';
   rptReporte.ParamFields.AsNumber := Objeto.ID_ACREDITADO.AsInteger;
   rptReporte.ParamFields.Name := 'pID_EMPRESA';
   rptReporte.ParamFields.AsNumber := Objeto.ID_EMPRESA.AsInteger;
   rptReporte.ParamFields.Name := 'pFECHA';
   rptReporte.ParamFields.AsDate:= Objeto.Apli.DameFechaEmpresaDia('D000');

   rptReporte.Connect.Send;
   rptReporte.Formulas.Send;
   rptReporte.ParamFields.Send;
   rptReporte.SQL.Send;
   rptReporte.Execute;}
   RepCtaChqAsocAcred( Objeto.ID_ACREDITADO.AsInteger,
                       Objeto.CVE_MONEDA.AsInteger,
                       StrToIntDef( edID_CREDITO.Text, 0 ), 
                       Objeto.CUENTA_BANCO.AsString,
                       EdIdEmpresa.Text, EdIDSucursal.Text,
                       Objeto.Apli , bPreview);
End;

procedure TWMRepChqAc.InterForma1BtnPreviewClick(Sender: TObject);
begin
   ImprimeReporte(True);
end;

procedure TWMRepChqAc.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimeReporte(False);
end;

procedure TWMRepChqAc.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TWMRepChqAc.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMRepChqAc.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TWMRepChqAc.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMRepChqAc.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

//<LOLS 10 MAR 2006 SE AGREGA FILTRO POR DISPOSICION>
procedure TWMRepChqAc.btID_CREDITOClick(Sender: TObject);
begin
  if Objeto.Credito.Busca then begin
     chbxID_CREDITO.Checked := True;
     chbxID_CREDITO.Enabled := True;
     InterForma1.NextTab(edID_CREDITO);
  End;
end;
//
procedure TWMRepChqAc.ilID_CREDITOEjecuta(Sender: TObject);
begin
  If Objeto.Credito.FindKey([ilID_CREDITO.Buffer]) Then Begin
    chbxID_CREDITO.Checked := True;
    chbxID_CREDITO.Enabled := True;
    InterForma1.NextTab(edID_CREDITO);
  End;
end;
//
procedure TWMRepChqAc.edID_CREDITOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edID_CREDITO,  True,  '',  True  );
end;


procedure TWMRepChqAc.chbxID_CREDITOClick(Sender: TObject);
begin
    If not chbxID_CREDITO.Checked Then Begin
        Objeto.Credito.Active:=False;
        chbxID_CREDITO.Checked:=False;
        chbxID_CREDITO.Enabled:=False;
    End Else Begin
        chbxID_CREDITO.Checked:=True;
        chbxID_CREDITO.Enabled:=True;
    End;
end;
//</LOLS>



end.
