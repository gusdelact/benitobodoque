// Sistema         : Clase de MLIQUIDACIONES
// Fecha de Inicio : 29/01/2004
// Función forma   : Clase de MLIQUIDACIONES
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntMliquidac;

Interface

Uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

IntParamCre,      // Parámetros Crédito
IntCrAcredit,     // Acreditado
IntCrLiqMedi,     // Medios de Liquidación
IntCrLiqDis,      // Medios de Liquidacion para Disposiciones
IntCrProveed,     // Proveedor
IntCrCredito,     // Alta de solictudes de Disposición
IntMon,           // Moneda
Intempre,         //Empresa
IntUnNeg,          //Unidad Negocio/Suc
IntMQrLiquida     // Reporte de Liquidaciones
;

Type
 TMliquidac= class;

  TWMliquidaciones=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    lbID_PROMOTOR: TLabel;
    Label1: TLabel;
    edCVE_MEDIO: TEdit;
    btCVE_MEDIO: TBitBtn;
    edDESC_MEDIO: TEdit;
    chbxCVE_MEDIO: TCheckBox;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    chbxACREDITADO: TCheckBox;
    ilCVE_MEDIO: TInterLinkit;
    ilACREDITADO: TInterLinkit;
    Label2: TLabel;
    edID_PROVEEDOR: TEdit;
    btID_PROVEEDOR: TBitBtn;
    edNOMBRE_PROVEEDOR: TEdit;
    chbxID_PROVEEDOR: TCheckBox;
    ilID_PROVEEDOR: TInterLinkit;
    Label3: TLabel;
    edCVE_LIQUIDACION: TEdit;
    btCVE_LIQUIDACION: TBitBtn;
    edDESC_LIQUIDACION: TEdit;
    chbxCVE_LIQUIDACION: TCheckBox;
    ilCVE_LIQUIDACION: TInterLinkit;
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
    edID_CREDITO: TEdit;
    btID_CREDITO: TBitBtn;
    edNOMBRE: TEdit;
    chbxID_CREDITO: TCheckBox;
    ilID_CREDITO: TInterLinkit;
    grbxF_OPERACION: TGroupBox;
    lbLiqF_INICIO: TLabel;
    Label5: TLabel;
    edF_Inicio: TEdit;
    dtpF_Inicio: TInterDateTimePicker;
    edF_Fin: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    chbxF_OPERACION: TCheckBox;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    chbxMoneda: TCheckBox;
    ilMONEDA: TInterLinkit;
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
    Procedure FormClose(SEnder : TObject; var Action : TCloseAction);  
    Procedure FormDestroy(SEnder : TObject);
    Procedure btCVE_MEDIOClick(SEnder: TObject);
    Procedure btACREDITADOClick(SEnder: TObject);
    Procedure btID_PROVEEDORClick(SEnder: TObject);
    Procedure chbxCVE_MEDIOClick(SEnder: TObject);
    Procedure chbxACREDITADOClick(SEnder: TObject);
    Procedure chbxID_PROVEEDORClick(SEnder: TObject);
    Procedure InterForma1BtnImprimirClick(SEnder: TObject);
    Procedure InterForma1BtnPreviewClick(SEnder: TObject);
    Procedure btCVE_LIQUIDACIONClick(SEnder: TObject);
    Procedure chbxCVE_LIQUIDACIONClick(SEnder: TObject);
    Procedure ilCVE_MEDIOCapture(SEnder: TObject; var Show: Boolean);
    Procedure ilCVE_MEDIOEjecuta(SEnder: TObject);
    Procedure ilACREDITADOEjecuta(SEnder: TObject);
    Procedure ilID_PROVEEDOREjecuta(SEnder: TObject);
    Procedure ilCVE_LIQUIDACIONEjecuta(SEnder: TObject);
    Procedure chbxID_CREDITOClick(SEnder: TObject);
    Procedure btID_CREDITOClick(SEnder: TObject);
    Procedure ilID_CREDITOEjecuta(SEnder: TObject);
    Procedure chbxF_OPERACIONClick(SEnder: TObject);
    Procedure edF_InicioChange(SEnder: TObject);
    Procedure btCVE_MONEDAClick(SEnder: TObject);
    Procedure ilMONEDAEjecuta(SEnder: TObject);
    Procedure chbxMonedaClick(SEnder: TObject);
    Procedure bbEmpresaClick(SEnder: TObject);
    Procedure BBSucursalClick(SEnder: TObject);
    Procedure ilEmpresaEjecuta(SEnder: TObject);
    Procedure ILSucursalEjecuta(SEnder: TObject);
    Procedure CBSucursalClick(SEnder: TObject);
    Private
    { Private declarations }
     Procedure EnableCheckBox(var CheckBox : TCheckBox);
     Procedure ImprimeReporte(bPreview : Boolean);
     Procedure AsignaEmpresaSuc;
    Public
    { Public declarations }
    Objeto : TMliquidac;
    End;

 TMliquidac= class(TInterFrame)
      Private
      Protected
    //  Procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      Public
        { Public declarations }
        Acreditado       : TCrAcredit;
        Medio            : TCrLiqMedi;
        MedioLiquidacion : TCrLiqDis;
        Proveedor        : TCrProveed;
        ParamCre         : TParamCre;
        Credito          : TCrCredito;
        Moneda           : TMoneda;
        UnidadNegocio    : TUnNegocio;
        Empresa          : TEmpresa;

        Function    InternalBusca : Boolean; Override;
        Constructor Create( AOwner : TComponent ); Override;
        Destructor  Destroy; Override;
        Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; Override;
      Published
      End;

Implementation
{$R *.DFM}

Constructor TMliquidac.Create( AOwner : TComponent );
Begin Inherited;
   Acreditado := TCrAcredit.Create(Self);
   Acreditado.MasterSource:=Self;
   Acreditado.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';

   Medio := TCrLiqMedi.Create(Self);
   Medio.MasterSource:=Self;
   Medio.FieldByName('CVE_MEDIO').MasterField:='CVE_MEDIO';

   Proveedor := TCrProveed.Create(Self);
   Proveedor.MasterSource:=Self;
   Proveedor.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';

   MedioLiquidacion := TCrLiqDis.Create(Self);
   MedioLiquidacion.MasterSource:=Self;
   MedioLiquidacion.FieldByName('CVE_LIQUIDACION').MasterField:='CVE_LIQUIDACION';

   Credito := TCrCredito.Create(Self);
   Credito.MasterSource:=Self;
   Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

   Moneda := TMoneda.Create(Self);
   Moneda.MasterSource:=Self;

   //SASB
   Empresa := TEmpresa.Create(Self);
   UnidadNegocio := TUnNegocio.Create(Self);

   StpName  := ' ';
   UseQuery := False;
   HelpFile := 'IntMliquidac.Hlp';
   ShowMenuReporte:=True;
End;

Destructor TMliquidac.Destroy;
Begin
   If Assigned(Acreditado) Then
      Acreditado.Free;
   If Assigned(Medio) Then
      Medio.Free;
   If Assigned(Proveedor) Then
      Proveedor.Free;
   If Assigned(MedioLiquidacion) Then
      MedioLiquidacion.Free;
   If Assigned(Credito) Then
      Credito.Free;
   If Assigned(Moneda) Then
      Moneda.Free;
   If Assigned(Empresa) Then
      Empresa.Free;
   If Assigned(UnidadNegocio) Then
      UnidadNegocio.Free;
   Inherited;
End;


Function TMliquidac.ShowWindow(FormaTipo:TFormaTipo):Integer;
Var W : TWMliquidaciones;
Begin
   W:=TWMliquidaciones.Create(Self);
   Try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   Finally
      W.Free;
   End;
End;


Function TMliquidac.InternalBusca:Boolean;
Var
   T:TInterFindit;
Begin
   InternalBusca := False;
   T := CreaBuscador('IMliquid.it','');
   Try
      If Active Then Begin End;
      If T.Execute Then
         InternalBusca := FindKey([]);
   Finally
      T.Free;
   End;
End;

(***********************************************FORMA MLIQUIDACIONES********************)
(*                                                                              *)
(*  FORMA DE MLIQUIDACIONES                                                            *)
(*                                                                              *)
(***********************************************FORMA MLIQUIDACIONES********************)
Procedure TWMliquidaciones.AsignaEmpresaSuc;
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

Procedure TWMliquidaciones.FormShow(SEnder: TObject);
Begin
   With Objeto Do Begin
      Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;

      Medio.CVE_MEDIO.Control := edCVE_MEDIO;
      Medio.DESC_MEDIO.Control := edDESC_MEDIO;

      Proveedor.ID_ACREDITADO.Control := edID_PROVEEDOR;
      Proveedor.Persona.Nombre.Control := edNOMBRE_PROVEEDOR;

      MedioLiquidacion.CVE_LIQUIDACION.Control := edCVE_LIQUIDACION;
      MedioLiquidacion.DESC_LIQUIDACION.Control := edDESC_LIQUIDACION;

      Credito.ID_CREDITO.Control := edID_CREDITO;
      Credito.ContratoCre.Contrato.TITNombre.Control := edNOMBRE;
      Credito.BuscaWhereString := 'PKGCRACTUALIZA.STPOBTEMPCTTO(CR_CREDITO.ID_CONTRATO)= ' + // LOLS 08 SEP 2005
                                   IntToStr(Objeto.Apli.IdEmpresa);                          // LOLS 08 SEP 2005
      Credito.FilterString     := Credito.BuscaWhereString;

      Moneda.Cve_Moneda.Control := edCVE_MONEDA;
      Moneda.Desc_Moneda.Control := edDESC_MONEDA;

      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

      edF_Inicio.Text := DateToStr(Apli.DameFechaEmpresa);
      edF_Fin.Text := DateToStr(Apli.DameFechaEmpresa);
   End;
   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;
End;

Procedure TWMliquidaciones.FormDestroy(SEnder: TObject);
Begin
   With Objeto Do Begin
      Acreditado.ID_ACREDITADO.Control := nil;
      Acreditado.Persona.Nombre.Control := nil;

      Medio.CVE_MEDIO.Control := nil;
      Medio.DESC_MEDIO.Control := nil;

      Proveedor.ID_ACREDITADO.Control := nil;
      Proveedor.Persona.Nombre.Control := nil;

      MedioLiquidacion.CVE_LIQUIDACION.Control := nil;
      MedioLiquidacion.DESC_LIQUIDACION.Control := nil;

      Credito.ID_CREDITO.Control := nil;
      Credito.ContratoCre.Contrato.TITNombre.Control := nil;

      Moneda.Cve_Moneda.Control := nil;
      Moneda.Desc_Moneda.Control := nil;
   End;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
End;

Procedure TWMliquidaciones.FormClose(SEnder: TObject; var Action: TCloseAction);
Begin Action := caFree;
End;

Procedure TWMliquidaciones.btCVE_MEDIOClick(SEnder: TObject);
Begin
   With Objeto Do Begin
      Medio.ShowAll := True;
      If Medio.Busca Then Begin
         chbxCVE_MEDIO.Checked:= True;
         chbxCVE_MEDIO.Enabled:= True;
         InterForma1.NextTab(edCVE_MEDIO);
      End;
   End;
End;

Procedure TWMliquidaciones.btACREDITADOClick(SEnder: TObject);
Begin
   With Objeto Do Begin
      Acreditado.ShowAll := True;
      If Acreditado.Busca Then Begin
         chbxAcreditado.Checked:= True;
         chbxAcreditado.Enabled:= True;
         InterForma1.NextTab(edACREDITADO);
      End;
   End;
End;

Procedure TWMliquidaciones.btID_PROVEEDORClick(SEnder: TObject);
Begin
   With Objeto Do Begin
      Proveedor.ShowAll := True;
      If Proveedor.Busca Then Begin
         chbxID_PROVEEDOR.Checked:= True;
         chbxID_PROVEEDOR.Enabled:= True;
         InterForma1.NextTab(edID_PROVEEDOR);
      End;
   End;
End;

Procedure TWMliquidaciones.btCVE_LIQUIDACIONClick(SEnder: TObject);
Begin
   With Objeto Do Begin
      MedioLiquidacion.ShowAll := True;
      If MedioLiquidacion.Busca Then Begin
         chbxCVE_LIQUIDACION.Checked:= True;
         chbxCVE_LIQUIDACION.Enabled:= True;
         InterForma1.NextTab(edCVE_LIQUIDACION);
      End;
   End;
End;

Procedure TWMliquidaciones.btID_CREDITOClick(SEnder: TObject);
Begin
   With Objeto Do Begin
      Credito.ShowAll := True;
      If Credito.Busca Then Begin
         chbxID_CREDITO.Checked:= True;
         chbxID_CREDITO.Enabled:= True;
         InterForma1.NextTab(edID_CREDITO);
      End;
   End;
End;

Procedure TWMliquidaciones.EnableCheckBox(var CheckBox : TCheckBox);
Begin
   If Not CheckBox.Checked Then Begin
      CheckBox.Checked:=False;
      CheckBox.Enabled:=False;
   End Else Begin
      CheckBox.Checked:=True;
      CheckBox.Enabled:=True;
   End;
End;

Procedure TWMliquidaciones.chbxCVE_MEDIOClick(SEnder: TObject);
Begin
   EnableCheckBox(chbxCVE_MEDIO);
   Objeto.Medio.Active := chbxCVE_MEDIO.Checked;
End;

Procedure TWMliquidaciones.chbxACREDITADOClick(SEnder: TObject);
Begin
   EnableCheckBox(chbxAcreditado);
   Objeto.Acreditado.Active := chbxAcreditado.Checked;
End;

Procedure TWMliquidaciones.chbxID_PROVEEDORClick(SEnder: TObject);
Begin
   EnableCheckBox(chbxID_PROVEEDOR);
   Objeto.PROVEEDOR.Active := chbxID_PROVEEDOR.Checked;
End;

Procedure TWMliquidaciones.chbxCVE_LIQUIDACIONClick(SEnder: TObject);
Begin
   EnableCheckBox(chbxCVE_LIQUIDACION);
   Objeto.MedioLiquidacion.Active := chbxCVE_LIQUIDACION.Checked;
End;

Procedure TWMliquidaciones.chbxID_CREDITOClick(SEnder: TObject);
Begin
   EnableCheckBox(chbxID_CREDITO);
   Objeto.Credito.Active := chbxID_CREDITO.Checked;
End;

Procedure TWMliquidaciones.ImprimeReporte(bPreview : Boolean);
Begin
 // Si seleccion el Filtro de Fechas y uno Filtro se encuentra vacio,
 // manda un mensaje de error y se sale del procedimiento
   If (chbxF_OPERACION.Checked) Then Begin
      If (Trim(edF_Inicio.Text) = '') Then Begin
         ShowMessage('Falta indicar la Fecha de Inicio de operación');
         If edF_Inicio.CanFocus Then
            edF_Inicio.SetFocus;
         Exit;
      End Else If (Trim(edF_Fin.Text) = '') Then Begin
         ShowMessage('Falta indicar la Fecha Final de operación');
         If edF_Fin.CanFocus Then
            edF_Fin.SetFocus;
         Exit;
      End;
   End;

   RepLiquidaciones( edID_CREDITO.Text, edCVE_MEDIO.Text, edACREDITADO.Text, edID_PROVEEDOR.Text,
                   edCVE_LIQUIDACION.Text, edF_Inicio.Text, edF_Fin.Text, edCVE_MONEDA.Text,
                   EdIdEmpresa.Text, EdIDSucursal.Text,//SASB
                   Objeto.Apli, bPreview );
End;

Procedure TWMliquidaciones.InterForma1BtnImprimirClick(SEnder: TObject);
Begin
   if Objeto.ValidaAccesoEsp('TMLIQUIDAC_IMPRI',True,True) then
      ImprimeReporte(False);
End;

Procedure TWMliquidaciones.InterForma1BtnPreviewClick(SEnder: TObject);
Begin
   if Objeto.ValidaAccesoEsp('TMLIQUIDAC_PREVI',True,True) then
      ImprimeReporte(True);
End;

Procedure TWMliquidaciones.ilCVE_MEDIOCapture(SEnder: TObject;
  var Show: Boolean);
Begin
   Show := True;
End;

Procedure TWMliquidaciones.ilCVE_MEDIOEjecuta(SEnder: TObject);
Begin
   If Objeto.Medio.FindKey([ilCVE_MEDIO.Buffer]) Then Begin
      chbxCVE_MEDIO.Checked:=True;
      chbxCVE_MEDIO.Enabled:=True;
      InterForma1.NextTab(edCVE_MEDIO);
   End;
End;

Procedure TWMliquidaciones.ilACREDITADOEjecuta(SEnder: TObject);
Begin
   If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
      chbxACREDITADO.Checked:=True;
      chbxACREDITADO.Enabled:=True;
      InterForma1.NextTab(edACREDITADO);
   End;
End;

Procedure TWMliquidaciones.ilID_PROVEEDOREjecuta(SEnder: TObject);
Begin
   If Objeto.Proveedor.FindKey([ilID_PROVEEDOR.Buffer]) Then Begin
      chbxID_PROVEEDOR.Checked:=True;
      chbxID_PROVEEDOR.Enabled:=True;
      InterForma1.NextTab(edID_PROVEEDOR);
   End;
End;

Procedure TWMliquidaciones.ilCVE_LIQUIDACIONEjecuta(SEnder: TObject);
Begin
   If Objeto.MedioLiquidacion.FindKey([ilCVE_LIQUIDACION.Buffer]) Then Begin
      chbxCVE_LIQUIDACION.Checked:=True;
      chbxCVE_LIQUIDACION.Enabled:=True;
      InterForma1.NextTab(edCVE_LIQUIDACION);
   End;
End;

Procedure TWMliquidaciones.ilID_CREDITOEjecuta(SEnder: TObject);
Begin
   If Objeto.Credito.FindKey([ilID_CREDITO.Buffer]) Then Begin
      chbxID_CREDITO.Checked:=True;
      chbxID_CREDITO.Enabled:=True;
      InterForma1.NextTab(edID_CREDITO);
   End;
End;

Procedure TWMliquidaciones.chbxF_OPERACIONClick(SEnder: TObject);
Begin
   If Not chbxF_OPERACION.Checked Then Begin
      edF_Inicio.Text := '';
      edF_Fin.Text := '';
   End;
End;

Procedure TWMliquidaciones.edF_InicioChange(SEnder: TObject);
Begin
   If (SEnder Is TEdit) Then
      With (SEnder As TEdit) Do
         chbxF_OPERACION.Checked := Trim(Text) <> '';
      chbxF_OPERACION.Enabled := chbxF_OPERACION.Checked;
End;

Procedure TWMliquidaciones.btCVE_MONEDAClick(SEnder: TObject);
Begin
   With Objeto Do Begin
      Moneda.ShowAll := True;
      If Moneda.Busca Then Begin
         chbxMoneda.Checked:= True;
         chbxMoneda.Enabled:= True;
         InterForma1.NextTab(edCVE_MONEDA);
      End;
   End;
End;

Procedure TWMliquidaciones.ilMONEDAEjecuta(SEnder: TObject);
Begin
   With Objeto Do Begin
      If Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
         chbxMoneda.Checked:= True;
         chbxMoneda.Enabled:= True;
         InterForma1.NextTab(edCVE_MONEDA);
      End;
   End;
End;

Procedure TWMliquidaciones.chbxMonedaClick(SEnder: TObject);
Begin
   EnableCheckBox(chbxMoneda);
   Objeto.Moneda.Active := chbxMoneda.Checked;
End;

Procedure TWMliquidaciones.bbEmpresaClick(SEnder: TObject);
Begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
End;

Procedure TWMliquidaciones.BBSucursalClick(SEnder: TObject);
Begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
End;

Procedure TWMliquidaciones.ilEmpresaEjecuta(SEnder: TObject);
Begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
End;

Procedure TWMliquidaciones.ILSucursalEjecuta(SEnder: TObject);
Begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
End;

Procedure TWMliquidaciones.CBSucursalClick(SEnder: TObject);
Begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
   End;
End;

End.
