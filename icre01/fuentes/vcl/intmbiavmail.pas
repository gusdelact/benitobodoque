// Sistema         : Clase de RepCtaAcr
// Fecha de Inicio : 06/07/2005
// Función forma   : Clase de RepCtaAcr
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMBiAvMail;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntParamCre,
IntGenCre,
Intempre,       //Empresa
IntUnNeg,       //Unidad Negocio/Suc
IntCrCredito,   //Disposición
IntMQrBitAvMail,
IntCrEmisor,      //Emisor
IntCrProveed     //Prooveedor
;

Type
 TMBiAvMail= class;

  TWMBiAvMail=Class(TForm)
    InterForma1             : TInterForma;
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
    gbControl: TGroupBox;
    Label8: TLabel;
    lbICveRequisito: TLabel;
    edIDSucursal: TEdit;
    BBSucursal: TBitBtn;
    EdDescSucursal: TEdit;
    CBSucursal: TCheckBox;
    edIdEmpresa: TEdit;
    bbEmpresa: TBitBtn;
    edNombreEmpresa: TEdit;
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    Label5: TLabel;
    edID_CREDITO: TEdit;
    btID_CREDITO: TBitBtn;
    edDESC_CREDITO: TEdit;
    cbID_CREDITO: TCheckBox;
    ilDisposicion: TInterLinkit;
    rgCVE_TIP_EVENTO: TRadioGroup;
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    Label3: TLabel;
    edF_INICIO: TEdit;
    dtpF_Ini: TInterDateTimePicker;
    edF_FINAL: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    Label1: TLabel;
    Label6: TLabel;
    edID_EMISOR: TEdit;
    edID_PROVEEDOR: TEdit;
    btEmisor: TBitBtn;
    btPROVEEDOR: TBitBtn;
    edID_PROV_NAFINSA: TEdit;
    edNOMBRE_EMISOR: TEdit;
    edNOM_PROVEEDOR: TEdit;
    ilEmisor: TInterLinkit;
    ilPROVEEDOR: TInterLinkit;
    cbEmisor: TCheckBox;
    cbProveedor: TCheckBox;
    rgMAIL: TRadioGroup;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure cbID_CREDITOClick(Sender: TObject);
    procedure ilDisposicionEjecuta(Sender: TObject);
    procedure ilEmisorEjecuta(Sender: TObject);
    procedure btEmisorClick(Sender: TObject);
    procedure cbEmisorClick(Sender: TObject);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure cbProveedorClick(Sender: TObject);
    private
     Procedure EnableCheckBox(var CheckBox : TCheckBox);
     Procedure ImprimeReporte(bPreview:Boolean);
     Procedure AsignaEmpresaSuc;
    { Private declarations }
    public
    { Public declarations }
    Objeto : TMBiAvMail;
end;
 TMBiAvMail= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_CREDITO               : TInterCampo;
        CVE_TIP_EVENTO           : TInterCampo;
        ID_EMPRESA               : TInterCampo;
        F_INICIO                 : TInterCampo;
        F_FINAL                  : TInterCampo;

        ParamCre                 : TParamCre;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        CrCredito                : TCrCredito;
        Emisor                   : TCrEmisor;
        Proveedor                : TCrProveed;

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

constructor TMBiAvMail.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
      CVE_TIP_EVENTO:=CreaCampo('CVE_TIP_EVENTO',ftString,tsNinguno,tsNinguno,False);
      With CVE_TIP_EVENTO Do Begin
         Size := 13;
         UseCombo := True;
         ComboLista.Add('0');    ComboDatos.Add('');
         ComboLista.Add('1');    ComboDatos.Add('CARGO');
         ComboLista.Add('2');    ComboDatos.Add('EPREAB');
         ComboLista.Add('3');    ComboDatos.Add('EPDEAB');
         ComboLista.Add('4');    ComboDatos.Add('EPMOCA');
      End;

      ID_EMPRESA:=CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,False);
      F_INICIO:=CreaCampo('F_INICIO',ftDate,tsNinguno,tsNinguno,False);
      F_FINAL:=CreaCampo('F_FINAL',ftDate,tsNinguno,tsNinguno,False);


      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);
      CrCredito := TCrCredito.Create(Self);
      CrCredito.MasterSource:=Self;

      {$WARNINGS OFF}
      Emisor    := TCrEmisor.Create(Self);
      Emisor.MasterSource := Self;
      {$WARNINGS ON}

      {$WARNINGS OFF}
      Proveedor := TCrProveed.Create(Self);
      Proveedor.MasterSource := Self;
      {$WARNINGS ON}

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMRepCtaChqAcr.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMBiAvMail.Destroy;
begin
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   If CrCredito <> nil then
      CrCredito.Free;
   if Emisor <> nil then
     Emisor.Free;
   //ends_if
   if Proveedor <> nil then
     Proveedor.Free;
   //ends_if
   inherited;
end;


function TMBiAvMail.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMBiAvMail;
begin
   W:=TWMBiAvMail.Create(Self);
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


Function TMBiAvMail.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IRepctaa.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TMBiAvMail.Reporte:Boolean;
begin //Execute_Reporte();
end;
(***********************************************FORMA RepCtaAcr********************)
(*                                                                              *)
(*  FORMA DE RepCtaAcr                                                            *)
(*                                                                              *)
(***********************************************FORMA RepCtaAcr********************)
procedure TWMBiAvMail.AsignaEmpresaSuc;
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

Procedure TWMBiAvMail.EnableCheckBox(Var CheckBox : TCheckBox);
Begin
   If Not CheckBox.Checked Then Begin
      CheckBox.Checked:=False;
      CheckBox.Enabled:=False;
   End Else Begin
      CheckBox.Checked:=True;
      CheckBox.Enabled:=True;
   End;
End;

procedure TWMBiAvMail.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.ID_CREDITO.Control :=edID_CREDITO;
   Objeto.CVE_TIP_EVENTO.Control:=rgCVE_TIP_EVENTO;
   Objeto.ID_EMPRESA.Control:=edIdEmpresa;
   Objeto.F_INICIO.Control:=edF_INICIO;
   Objeto.F_FINAL.Control:=edF_FINAL;

      Objeto.Emisor.ID_ACREDITADO.Control  := edID_EMISOR;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOMBRE_EMISOR;
      Objeto.Emisor.GetParams(Objeto);

      Objeto.Proveedor.ID_ACREDITADO.Control   := edID_PROVEEDOR;
      Objeto.Proveedor.ID_PROV_EXTERNO.Control := edID_PROV_NAFINSA;
      Objeto.Proveedor.Persona.Nombre.Control  := edNOM_PROVEEDOR;
      Objeto.Proveedor.GetParams(Objeto);

   Objeto.Empresa.ID_Empresa.Control:= EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control:= edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);
   Objeto.UnidadNegocio.Id_Entidad.Control:= EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control:= EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   Objeto.CrCredito.ID_CREDITO.Control:= edID_CREDITO;
   Objeto.CrCredito.GetParams(Objeto);
   AsignaEmpresaSuc;

   Objeto.F_INICIO.AsDateTime :=Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.F_FINAL.AsDateTime :=Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_TIP_EVENTO.AsString:='';

end;

procedure TWMBiAvMail.FormDestroy(Sender: TObject);
begin
   Objeto.ID_CREDITO.Control :=nil;
   Objeto.CVE_TIP_EVENTO.Control:=nil;
   Objeto.ID_EMPRESA.Control:=nil;
   Objeto.F_INICIO.Control:=nil;
   Objeto.F_FINAL.Control:=nil;

      Objeto.Emisor.ID_ACREDITADO.Control             := Nil;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := Nil;
      Objeto.Proveedor.ID_ACREDITADO.Control   := Nil;
      Objeto.Proveedor.ID_PROV_EXTERNO.Control := Nil;
      Objeto.Proveedor.Persona.Nombre.Control  := Nil;
      
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
   Objeto.CrCredito.ID_CREDITO.Control := Nil;

end;

procedure TWMBiAvMail.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;


Procedure TWMBiAvMail.ImprimeReporte(bPreview:Boolean);
Var sBMail: StrIng;
begin
   Objeto.F_INICIO.GetFromControl;
   Objeto.F_FINAL.GetFromControl;
   Objeto.ID_CREDITO.GetFromControl;
   Objeto.CVE_TIP_EVENTO.GetFromControl;
   Objeto.ID_EMPRESA.GetFromControl;

    case rgMAIL.ItemIndex of
        0: sBMail:= ''; //Detalle
        1: sBMail:= 'V';  //Resumen
        2: sBMail:= 'F';  //Resumen
    end;


   RepBitAvMail(  Objeto.F_INICIO.AsDateTime,       Objeto.F_FINAL.AsDateTime,
                '',       Objeto.ID_CREDITO.AsString,
                '', Objeto.CVE_TIP_EVENTO.AsString,
                edID_EMISOR.Text, edID_PROVEEDOR.Text, sbmail,
                Objeto.ID_EMPRESA.AsString,       EdIDSucursal.Text,
                Objeto.Apli,                      bPreview);
End;

procedure TWMBiAvMail.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMBIAVMAIL_PREVI',True,True) then
   ImprimeReporte(True);
end;

procedure TWMBiAvMail.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMBIAVMAIL_IMPRI',True,True) then
      ImprimeReporte(False);
end;

procedure TWMBiAvMail.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TWMBiAvMail.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMBiAvMail.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TWMBiAvMail.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMBiAvMail.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TWMBiAvMail.btID_CREDITOClick(Sender: TObject);
begin
   Objeto.CrCredito.ShowAll := True;
   If Objeto.CrCredito.Busca Then Begin
      cbID_CREDITO.Checked:=True;
      cbID_CREDITO.Enabled:=True;
   End;
end;

procedure TWMBiAvMail.cbID_CREDITOClick(Sender: TObject);
begin
   EnableCheckBox(cbID_CREDITO);
   Objeto.CrCredito.Active := cbID_CREDITO.Checked;
end;

procedure TWMBiAvMail.ilDisposicionEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ilDisposicion.Buffer]) Then Begin
      cbID_CREDITO.Checked:=True;
      cbID_CREDITO.Enabled:=True;
   End;
end;


procedure TWMBiAvMail.ilEmisorEjecuta(Sender: TObject);
begin
  if Objeto.Emisor.FindKeyNear([ilEMISOR.Buffer],['ID_ACREDITADO']) then
  begin
    cbEmisor.Checked := True;
  end;
end;

procedure TWMBiAvMail.btEmisorClick(Sender: TObject);
begin
  Objeto.Emisor.ShowAll := True;
  if Objeto.Emisor.Busca then
  begin
    cbEmisor.Checked := True;
  end;
end;

procedure TWMBiAvMail.cbEmisorClick(Sender: TObject);
begin
  if not(cbEmisor.Checked) then
  begin
    if Objeto.Emisor.Active then
    begin
      Objeto.Emisor.Active := False;
    end;
  end;
  //
  if not(Objeto.Emisor.Active) then
     cbEmisor.Checked := False;
end;

procedure TWMBiAvMail.ilPROVEEDOREjecuta(Sender: TObject);
begin
  if Objeto.Proveedor.FindKey([ilPROVEEDOR.Buffer]) then
  begin
    cbProveedor.Checked := True;
  end;
end;

procedure TWMBiAvMail.btPROVEEDORClick(Sender: TObject);
begin
  Objeto.Proveedor.ShowAll := True;
  if Objeto.Proveedor.Busca then
  begin
    cbProveedor.Checked := True;
  end;
end;

procedure TWMBiAvMail.cbProveedorClick(Sender: TObject);
begin
  if not(cbProveedor.Checked) then
  begin
    if Objeto.Proveedor.Active then
    begin
      Objeto.Proveedor.Active := False;
    end;
  end;
  //
  if not(Objeto.Proveedor.Active) then
     cbProveedor.Checked := False;
end;

end.
