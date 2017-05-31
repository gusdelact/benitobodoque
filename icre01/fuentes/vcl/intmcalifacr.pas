// Sistema         : Reporte de Calificación por Acreditado
// Fecha de Inicio : 28/06/2005
// Función forma   : Reporte de Calificación por Acreditado
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMCalifAcr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntParamCre,
Intempre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntEmple, UCrpe32,
IntCrAcredit,
IntCrCalific, Menus
;

Type
 TMCalifAcr= class;

  TWMCalifAcr=Class(TForm)
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
    EdIDSucursal: TEdit;
    BBSucursal: TBitBtn;
    EdDescSucursal: TEdit;
    CBSucursal: TCheckBox;
    edIdEmpresa: TEdit;
    bbEmpresa: TBitBtn;
    edNombreEmpresa: TEdit;
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    Label2: TLabel;
    edF_INICIAL: TEdit;
    dtpF_INICIAL: TInterDateTimePicker;
    edF_FINAL: TEdit;
    dtpF_FINAL: TInterDateTimePicker;
    rgORDEN: TRadioGroup;
    GroupBox2: TGroupBox;
    cbMUESTRA: TCheckBox;
    Label3: TLabel;
    edID_TITULAR: TEdit;
    btID_TITULAR: TBitBtn;
    edNOM_TITULAR: TEdit;
    chbID_TITULAR: TCheckBox;
    ilID_TITULAR: TInterLinkit;
    Label1: TLabel;
    edID_CALIFICADORA: TEdit;
    btID_CALIFICADORA: TBitBtn;
    edNOM_ID_CALIFICADORA: TEdit;
    chbID_CALIFICADORA: TCheckBox;
    ilID_CALIFICADORA: TInterLinkit;
    PopupMenu1: TPopupMenu;
    SaveQryToFile1: TMenuItem;
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
    procedure btID_TITULARClick(Sender: TObject);
    procedure chbID_TITULARClick(Sender: TObject);
    procedure ilID_TITULAREjecuta(Sender: TObject);
    procedure ilID_CALIFICADORAEjecuta(Sender: TObject);
    procedure btID_CALIFICADORAClick(Sender: TObject);
    procedure chbID_CALIFICADORAClick(Sender: TObject);
    procedure SaveQryToFile1Click(Sender: TObject);
    private
     Procedure EnableCheckBox(var CheckBox : TCheckBox);
     Procedure ImprimeReporte(bPreview:Boolean);
     Procedure AsignaEmpresaSuc;
    { Private declarations }
    public
    { Public declarations }
    Objeto : TMCalifAcr;
end;
 TMCalifAcr= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        F_INICIAL                : TInterCampo;
        F_FINAL                  : TInterCampo;
        ID_TITULAR               : TInterCampo;
        NOM_TITULAR              : TInterCampo;
        ID_CALIFICADORA          : TInterCampo;
        NOM_CALIFICADORA         : TInterCampo;
        MUESTRA_ACRED            : TInterCampo;
        ORDEN                    : TInterCampo;
        ID_EMPRESA               : TInterCampo;
        ID_SUCURSAL              : TInterCampo;

        ParamCre                 : TParamCre;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        Titular                  : TCrAcredit;
        CrCalific                : TCrCalific;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


implementation

Uses IntMQrCalifAcr;
{$R *.DFM}

constructor TMCalifAcr.Create( AOwner : TComponent );
begin Inherited;
   F_INICIAL :=CreaCampo('F_INICIAL',ftDate,tsNinguno,tsNinguno,False);
      F_INICIAL.Caption:='Fecha Inicial';
   F_FINAL :=CreaCampo('F_FINAL',ftDate,tsNinguno,tsNinguno,False);
      F_FINAL.Caption:='Fecha Final';
   ID_TITULAR :=CreaCampo('ID_TITULAR',ftInteger,tsNinguno,tsNinguno,False);
      ID_TITULAR.Caption:='Titular';
   NOM_TITULAR :=CreaCampo('NOM_TITULAR',ftString,tsNinguno,tsNinguno,False);
      NOM_TITULAR.Caption:='Nombre Titular';
   ID_CALIFICADORA :=CreaCampo('ID_CALIFICADORA',ftInteger,tsNinguno,tsNinguno,False);
      ID_CALIFICADORA.Caption:='Calificadora';
   NOM_CALIFICADORA :=CreaCampo('NOM_CALIFICADORA',ftString,tsNinguno,tsNinguno,False);
      NOM_TITULAR.Caption:='Nombre Calificadora';
   MUESTRA_ACRED :=CreaCampo('MUESTRA_ACRED',ftString,tsNinguno,tsNinguno,False);
      MUESTRA_ACRED.Caption:='Muestra';
   ORDEN :=CreaCampo('ORDEN',ftString,tsNinguno,tsNinguno,False);
      ORDEN.Caption:='Orden';
   With ORDEN Do Begin
      Size:=16; UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('ID_ACREDITADO');
      ComboLista.Add('1'); ComboDatos.Add('NOM_ACREDITADO');
   End;

   ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,False);
      ID_EMPRESA.Caption:='Empresa';
   ID_SUCURSAL :=CreaCampo('ID_SUCURSAL',ftInteger,tsNinguno,tsNinguno,False);
      ID_SUCURSAL.Caption:='Sucursal';

   Empresa := TEmpresa.Create(Self);
   UnidadNegocio := TUnNegocio.Create(Self);
   Titular := TCrAcredit.Create(Self);
   Titular.MasterSource:=Self;
   CrCalific:= TCrCalific.Create(Self);
   CrCalific.MasterSource:=Self;

   StpName  := ' ';
   UseQuery := False;
   HelpFile := 'IntMRepCtaChqAcr.Hlp';
   ShowMenuReporte:=True;
end;

Destructor TMCalifAcr.Destroy;
begin
   If Empresa <> Nil Then
      Empresa.free;
   If UnidadNegocio <> Nil Then
      UnidadNegocio.Free;
   If Titular<> Nil Then
      Titular.Free;
   If CrCalific<>Nil Then
      CrCalific.Free;
   inherited;
end;


function TMCalifAcr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMCalifAcr;
begin
   W:=TWMCalifAcr.Create(Self);
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

Function TMCalifAcr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IRepctaa.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA RepDetAcred********************)
(*                                                                              *)
(*  FORMA DE RepDetAcred                                                            *)
(*                                                                              *)
(***********************************************FORMA RepDetAcred********************)
procedure TWMCalifAcr.AsignaEmpresaSuc;
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

Procedure TWMCalifAcr.EnableCheckBox(Var CheckBox : TCheckBox);
Begin
   If Not CheckBox.Checked Then Begin
      CheckBox.Checked:=False;
      CheckBox.Enabled:=False;
   End Else Begin
      CheckBox.Checked:=True;
      CheckBox.Enabled:=True;
   End;
End;

procedure TWMCalifAcr.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.F_INICIAL.Control                :=edF_INICIAL;
   Objeto.F_FINAL.Control                  :=edF_FINAL;
   Objeto.ID_TITULAR.Control               :=edID_TITULAR;
   Objeto.NOM_TITULAR.Control              :=edNOM_TITULAR;
   Objeto.ID_CALIFICADORA.Control          :=edID_CALIFICADORA;
   Objeto.NOM_CALIFICADORA.Control         :=edNOM_ID_CALIFICADORA;
   Objeto.MUESTRA_ACRED.Control            :=cbMUESTRA;
   Objeto.ORDEN.Control                    :=rgORDEN;
   Objeto.ID_EMPRESA.Control               :=edIdEmpresa;
   Objeto.ID_SUCURSAL.Control              :=EdIDSucursal;

   Objeto.Titular.ID_ACREDITADO.Control:=edID_TITULAR;
   Objeto.Titular.Persona.Nombre.Control:=edNOM_TITULAR;
   Objeto.Titular.GetParams(Objeto);
   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);
   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   Objeto.CrCalific.ID_CALIFICADORA.Control :=edID_CALIFICADORA;
   Objeto.CrCalific.Persona.NOMBRE.Control :=edNOM_ID_CALIFICADORA;
   Objeto.CrCalific.GetParams(Objeto);
   
   AsignaEmpresaSuc;
   edF_INICIAL.Text:= FormatDateTime('dd/mm/yyyy',IncMonth(Objeto.Apli.DameFechaEmpresaDia('D000'),-3));
   dtpF_INICIAL.DateTime:=IncMonth(Objeto.Apli.DameFechaEmpresaDia('D000'),-3);
   edF_FINAL.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));
   dtpF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   rgORDEN.ItemIndex:=0;
   cbMUESTRA.Checked:=True;
end;

procedure TWMCalifAcr.FormDestroy(Sender: TObject);
begin
   Objeto.F_INICIAL.Control                :=Nil;
   Objeto.F_FINAL.Control                  :=Nil;
   Objeto.ID_TITULAR.Control               :=Nil;
   Objeto.NOM_TITULAR.Control              :=Nil;
   Objeto.ID_CALIFICADORA.Control          :=Nil;
   Objeto.NOM_CALIFICADORA.Control         :=Nil;
   Objeto.MUESTRA_ACRED.Control            :=Nil;
   Objeto.ORDEN.Control                    :=Nil;
   Objeto.ID_EMPRESA.Control               :=Nil;
   Objeto.ID_SUCURSAL.Control              :=Nil;

   Objeto.Titular.ID_ACREDITADO.Control:=Nil;
   Objeto.Titular.Persona.Nombre.Control:=Nil;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
   Objeto.CrCalific.ID_CALIFICADORA.Control :=Nil;
   Objeto.CrCalific.Persona.NOMBRE.Control :=Nil;
end;

procedure TWMCalifAcr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

Procedure TWMCalifAcr.ImprimeReporte(bPreview:Boolean);
begin
 With Objeto Do
   Begin
     GetFromControl;
     If (F_INICIAL.AsDateTime = 0) Or (F_FINAL.AsDateTime = 0) Then
        MessageDlg('Debe seleccionar un rango de Fechas', mtWarning, [mbOk], 0)
     Else
        RepCalifAcr( F_FINAL.AsDateTime, F_INICIAL.AsDateTime,
                     Titular.ID_ACREDITADO.AsInteger, CrCalific.ID_CALIFICADORA.AsInteger, Empresa.ID_EMPRESA.AsInteger,
                     MUESTRA_ACRED.AsString, ORDEN.AsString, Apli.DameFechaEmpresa,
                     Apli,
                     bPreview,
                     SaveQryToFile1.Checked);
   End;
End;

procedure TWMCalifAcr.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCALIFACR_PREVI',True,True) then
      ImprimeReporte(True);
end;

procedure TWMCalifAcr.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCALIFACR_IMPRI',True,True) then
      ImprimeReporte(False);
end;

procedure TWMCalifAcr.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TWMCalifAcr.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMCalifAcr.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TWMCalifAcr.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMCalifAcr.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TWMCalifAcr.btID_TITULARClick(Sender: TObject);
begin
   Objeto.Titular.ShowAll := True;
   If Objeto.Titular.Busca Then Begin
      chbID_TITULAR.Checked:=True;
      chbID_TITULAR.Enabled:=True;
      InterForma1.NextTab(edID_TITULAR);
   End;
end;

procedure TWMCalifAcr.chbID_TITULARClick(Sender: TObject);
begin
   EnableCheckBox(chbID_TITULAR);
   Objeto.Titular.Active := chbID_TITULAR.Checked;
end;

procedure TWMCalifAcr.ilID_TITULAREjecuta(Sender: TObject);
begin
   If Objeto.Titular.FindKey([ilID_TITULAR.Buffer])Then Begin
      chbID_TITULAR.Checked:=True;
      chbID_TITULAR.Enabled:=True;
      InterForma1.NextTab(edID_TITULAR);
   End;
end;

procedure TWMCalifAcr.ilID_CALIFICADORAEjecuta(Sender: TObject);
begin
   If Objeto.CrCalific.FindKey([ilID_CALIFICADORA.Buffer])Then Begin
      chbID_CALIFICADORA.Checked:=True;
      chbID_CALIFICADORA.Enabled:=True;
      InterForma1.NextTab(edID_CALIFICADORA);
   End;
end;

procedure TWMCalifAcr.btID_CALIFICADORAClick(Sender: TObject);
begin
   Objeto.CrCalific.ShowAll := True;
   If Objeto.CrCalific.Busca Then Begin
      chbID_CALIFICADORA.Checked:=True;
      chbID_CALIFICADORA.Enabled:=True;
      InterForma1.NextTab(edID_CALIFICADORA);
   End;
end;

procedure TWMCalifAcr.chbID_CALIFICADORAClick(Sender: TObject);
begin
   EnableCheckBox(chbID_CALIFICADORA);
   Objeto.CrCalific.Active := chbID_CALIFICADORA.Checked;
end;

procedure TWMCalifAcr.SaveQryToFile1Click(Sender: TObject);
begin
   SaveQryToFile1.Checked := Not SaveQryToFile1.Checked;
end;

end.



