// Sistema         : Clase de TMRepSieban
// Fecha de Inicio : 30/08/2004
// Función forma   : Clase de TMRepSieban
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMRepSieb;

Interface

Uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntParamCre,
IntMon,           //Moneda
IntMPers,         //Promotor
IntCrAcredit,     // Acreditado
IntMQrRepSieb,
Intempre,         //Empresa
IntUnNeg          //Unidad Negocio/Suc
;

Type
 TMRepSieb= class;

  TwMRepSieb=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    ilMONEDA: TInterLinkit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    lbID_PROMOTOR: TLabel;
    edID_PROMOTOR: TEdit;
    btPROMOTOR: TBitBtn;
    ilPROMOTOR: TInterLinkit;
    edNOM_PROMOTOR: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    chbxMoneda: TCheckBox;
    chbxPromotor: TCheckBox;
    lbAplica: TLabel;
    Label1: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    cbxACREDITADO: TCheckBox;
    ilACREDITADO: TInterLinkit;
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
    Procedure FormShow(SEnder : TObject);
    Procedure FormClose(SEnder : TObject; Var Action : TCloseAction);
    Procedure FormDestroy(SEnder : TObject);
    Procedure InterForma1DespuesNuevo(SEnder: TObject);
    Procedure InterForma1DespuesModificar(SEnder: TObject);
    Procedure btCVE_MONEDAClick(SEnder: TObject);
    Procedure ilMONEDACapture(SEnder: TObject; Var Show: Boolean);
    Procedure ilMONEDAEjecuta(SEnder: TObject);
    Procedure edCVE_MONEDAExit(SEnder: TObject);
    Procedure btPROMOTORClick(SEnder: TObject);
    Procedure ilPROMOTORCapture(SEnder: TObject; Var Show: Boolean);
    Procedure ilPROMOTOREjecuta(SEnder: TObject);
    Procedure edID_PROMOTORExit(SEnder: TObject);
    Procedure chbxMonedaClick(SEnder: TObject);
    Procedure chbxPromotorClick(SEnder: TObject);
    Procedure InterForma1BtnPreviewClick(SEnder: TObject);
    Procedure InterForma1BtnImprimirClick(SEnder: TObject);
    Procedure btACREDITADOClick(SEnder: TObject);
    Procedure ilACREDITADOCapture(SEnder: TObject; Var Show: Boolean);
    Procedure ilACREDITADOEjecuta(SEnder: TObject);
    Procedure cbxACREDITADOClick(SEnder: TObject);
    Procedure edACREDITADOExit(SEnder: TObject);
    Procedure bbEmpresaClick(SEnder: TObject);
    Procedure BBSucursalClick(SEnder: TObject);
    Procedure ilEmpresaEjecuta(SEnder: TObject);
    Procedure ILSucursalEjecuta(SEnder: TObject);
    Procedure CBSucursalClick(SEnder: TObject);
    private
    { Private declarations }
        Procedure EnableCheckBox(Var CheckBox : TCheckBox);
        Procedure ImprimirReporte(bPreview:Boolean);
        Procedure AsignaEmpresaSuc;        
    public
    { Public declarations }
    Objeto : TMRepSieb;
End;
 TMRepSieb= class(TInterFrame)
      private
    function InternalBusca: Boolean;
      protected
    //  Procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        Moneda           : TMoneda;
        Promotor         : TMPersona;
        ParamCre         : TParamCre;
        Acreditado       : TCrAcredit;
        UnidadNegocio    : TUnNegocio;
        Empresa          : TEmpresa;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      End;

implementation
{$R *.DFM}

constructor TMRepSieb.Create( AOwner : TComponent );
Begin Inherited;
   Moneda := TMoneda.Create(Self);
   Moneda.MasterSource:=Self;
   Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

   Promotor := TMPersona.Create(Self);
   Promotor.FilterBy := fbTMPersonaEmpleado;
   Promotor.MasterSource := Self;
   Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
   Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';
   Promotor.FilterString := Promotor.BuscaWhereString;

   Acreditado := TCrAcredit.Create(Self);
   Acreditado.MasterSource:=Self;
   Acreditado.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';

   //SASB
   Empresa := TEmpresa.Create(Self);
   UnidadNegocio := TUnNegocio.Create(Self);

   UseQuery := False;
   HelpFile := 'IntMRepSieb.Hlp';
   ShowMenuReporte:=True;
End;

Destructor TMRepSieb.Destroy;
Begin
   If Assigned(Moneda) Then
      Moneda.Free;
   If Assigned(Promotor)Then
      Promotor.Free;
   If Assigned(Acreditado) Then
      Acreditado.Free;
   If Empresa <> Nil Then
      Empresa.free;
   If UnidadNegocio <> Nil Then
      UnidadNegocio.Free;
   Inherited;
End;


function TMRepSieb.ShowWindow(FormaTipo:TFormaTipo):Integer;
Var W : TwMRepSieb;
Begin
   W:=TwMRepSieb.Create(Self);
   Try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   Finally
      W.Free;
   End;
End;


Function TMRepSieb.InternalBusca:Boolean;
Begin InternalBusca := False;

End;

function TMRepSieb.Reporte:Boolean;
Begin //Execute_Reporte();
End;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
Procedure TwMRepSieb.AsignaEmpresaSuc;
Begin
   Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);
   If  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) Then Begin
         CBSucursal.Checked := True;
   End;

   EdIdEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   bbEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   BBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   CBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
End;

Procedure TwMRepSieb.FormShow(SEnder: TObject);
Begin
      //PINTA DATOS DEL PANEL INFERIOR
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
   Objeto.Moneda.GetParams(Objeto);

   Objeto.Promotor.ID_Persona.Control :=edID_PROMOTOR;
   Objeto.Promotor.Nombre.Control :=edNOM_PROMOTOR;
   Objeto.Promotor.GetParams(Objeto);

   Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
   Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
   Objeto.Acreditado.GetParams(Objeto);

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;
End;

Procedure TwMRepSieb.FormDestroy(SEnder: TObject);
Begin
   Objeto.Moneda.Cve_Moneda.Control := Nil;
   Objeto.Moneda.Desc_Moneda.Control := Nil;
   Objeto.Promotor.Nombre.Control :=Nil;
   Objeto.Promotor.Id_Persona.Control :=Nil;
   Objeto.Acreditado.ID_ACREDITADO.Control := Nil;
   Objeto.Acreditado.Persona.Nombre.Control := Nil;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
End;

Procedure TwMRepSieb.FormClose(SEnder: TObject; Var Action: TCloseAction);
Begin Action := caFree;
End;

Procedure TwMRepSieb.InterForma1DespuesNuevo(SEnder: TObject);
Begin //<<Control>>.SetFocus;
End;

Procedure TwMRepSieb.InterForma1DespuesModificar(SEnder: TObject);
Begin //<<Control>>.SetFocus;
End;

//Procedure TWNinguno.BitBtn1Click(SEnder: TObject);
//Begin // Objeto.Reporte;
//End;


Procedure TwMRepSieb.btCVE_MONEDAClick(SEnder: TObject);
Begin
   Objeto.Moneda.ShowAll := True;
   If Objeto.Moneda.Busca Then Begin
      chbxMoneda.Checked:=True;
      chbxMoneda.Enabled:=True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
End;

Procedure TwMRepSieb.ilMONEDACapture(SEnder: TObject; Var Show: Boolean);
Begin
   Show := True;
End;

Procedure TwMRepSieb.ilMONEDAEjecuta(SEnder: TObject);
Begin
   If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
      chbxMoneda.Checked:=True;
      chbxMoneda.Enabled:=True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
End;

Procedure TwMRepSieb.edCVE_MONEDAExit(SEnder: TObject);
Begin
   InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
End;

Procedure TwMRepSieb.btPROMOTORClick(SEnder: TObject);
Begin
   Objeto.Promotor.ShowAll := True;
   If Objeto.Promotor.Busca Then Begin
      chbxPromotor.Checked:=True;
      chbxPromotor.Enabled:=True;
      InterForma1.NextTab(edID_PROMOTOR);
   End;
End;

Procedure TwMRepSieb.ilPROMOTORCapture(SEnder: TObject;
  Var Show: Boolean);
Begin
   Show:=True;
End;

Procedure TwMRepSieb.ilPROMOTOREjecuta(SEnder: TObject);
Begin
   If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
      chbxPromotor.Checked:=True;
      chbxPromotor.Enabled:=True;
      InterForma1.NextTab(edID_PROMOTOR);
   End;
End;

Procedure TwMRepSieb.edID_PROMOTORExit(SEnder: TObject);
Begin
   InterForma1.ValidaExit(edID_PROMOTOR,True,'',True);
End;

Procedure TwMRepSieb.chbxMonedaClick(SEnder: TObject);
Begin
   EnableCheckBox(chbxMoneda);
   Objeto.Moneda.Active := chbxMoneda.Checked;
End;

Procedure TwMRepSieb.chbxPromotorClick(SEnder: TObject);
Begin
   EnableCheckBox(chbxPromotor);
   Objeto.Promotor.Active := chbxPromotor.Checked;
End;

Procedure TwMRepSieb.InterForma1BtnPreviewClick(SEnder: TObject);
Begin
   ImprimirReporte(True);
End;

Procedure TwMRepSieb.InterForma1BtnImprimirClick(SEnder: TObject);
Begin
   ImprimirReporte(False);
End;
Procedure TwMRepSieb.ImprimirReporte(bPreview:Boolean);
Begin
   RepSieb(edCVE_MONEDA.Text,edID_PROMOTOR.Text,edACREDITADO.Text,
           EdIdEmpresa.Text, EdIDSucursal.Text,//SASB
           Objeto.Apli, bPreview);
End;

Procedure TwMRepSieb.btACREDITADOClick(SEnder: TObject);
Begin
   With Objeto Do Begin
      Acreditado.ShowAll := True;
      If Acreditado.Busca Then Begin
         cbxAcreditado.Checked:= True;
         cbxAcreditado.Enabled:= True;
         InterForma1.NextTab(edACREDITADO);
      End;
   End;
End;

Procedure TwMRepSieb.ilACREDITADOCapture(SEnder: TObject;
  Var Show: Boolean);
Begin
   Show:= True;
End;

Procedure TwMRepSieb.ilACREDITADOEjecuta(SEnder: TObject);
Begin
   If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
      cbxACREDITADO.Checked:=True;
      cbxACREDITADO.Enabled:=True;
      InterForma1.NextTab(edACREDITADO);
   End;
End;

Procedure TwMRepSieb.cbxACREDITADOClick(SEnder: TObject);
Begin
   EnableCheckBox(cbxAcreditado);
   Objeto.Acreditado.Active := cbxAcreditado.Checked;
End;

Procedure TwMRepSieb.EnableCheckBox(Var CheckBox : TCheckBox);
Begin
   If Not CheckBox.Checked Then Begin
      CheckBox.Checked:=False;
      CheckBox.Enabled:=False;
   End Else Begin
      CheckBox.Checked:=True;
      CheckBox.Enabled:=True;
   End;
End;

Procedure TwMRepSieb.edACREDITADOExit(SEnder: TObject);
Begin
   InterForma1.ValidaExit(edACREDITADO,True,'',True);
End;

Procedure TwMRepSieb.bbEmpresaClick(SEnder: TObject);
Begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
End;

Procedure TwMRepSieb.BBSucursalClick(SEnder: TObject);
Begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
End;

Procedure TwMRepSieb.ilEmpresaEjecuta(SEnder: TObject);
Begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
End;

Procedure TwMRepSieb.ILSucursalEjecuta(SEnder: TObject);
Begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
End;

Procedure TwMRepSieb.CBSucursalClick(SEnder: TObject);
Begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
   End;
End;

End.

