// Sistema         : Clase de Filtro de Reporte de Estado de Cuenta
// Fecha de Inicio : 24/08/2004
// Función forma   : Clase de Filtro de Reporte de Estado de Cuenta
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMEdoCta;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
InterEdit, IntParamCre, IntCrCredito, IntSGCtrl,

IntCrAcredit,     //Acreditado
IntMPers,
IntMProdGpo,      //Grupo de crédito
IntCrProduct,     //Producto de crédito
Intempre,          //Empresa
IntUnNeg,          //Unidad Negocio/Suc
IntEmple,
IntGenCre, CheckLst
;

Type
 TMEdoCta= class;

  TwMEdoCta=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
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
    rgMes: TRadioGroup;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    ilPRODUCTO: TInterLinkit;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    chbxProducto: TCheckBox;
    rgSituacion: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edNOM_CVE_PRODUCTO_GPO: TEdit;
    edCVE_PRODUCTO_CRE: TEdit;
    btCREDITO_FIN: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    sgcDATA: TSGCtrl;
    cbxFECHAS: TCheckBox;
    cbxEdoCta: TCheckBox;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lbID_PROMOTOR: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edID_PROMOTOR: TEdit;
    btPROMOTOR: TBitBtn;
    edNOM_PROMOTOR: TEdit;
    chbxPromotor: TCheckBox;
    chbxPromAmon: TCheckBox;
    edNOM_PROM: TEdit;
    btPROM_ADMON: TBitBtn;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    chbxAcreditado: TCheckBox;
    edID_PROM: TEdit;
    ilACREDITADO: TInterLinkit;
    ilPROMOTOR: TInterLinkit;
    ilPromAdmon: TInterLinkit;
    gbControl: TGroupBox;
    Label14: TLabel;
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
    MBitacora: TMemo;
    Label15: TLabel;
    cbManual: TCheckBox;
    Label16: TLabel;
    cbxConsAcred: TCheckBox;
    rgCodPostal: TRadioGroup;
    cbProducto: TCheckListBox;
    cbProductos: TCheckBox;
    CBCveProd: TCheckListBox;
    cbCveGpoProd: TCheckListBox;
    cbGpoProducto: TCheckListBox;
    chbxGpoProducto: TCheckBox;
    RGRecup: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure ilDisposicionCapture(Sender: TObject; var Show: Boolean);
    procedure ilDisposicionEjecuta(Sender: TObject);
    procedure btDisposicionClick(Sender: TObject);
    procedure cbxDisposicionClick(Sender: TObject);
    procedure cbxFECHASClick(Sender: TObject);
    procedure edFIniChange(Sender: TObject);
    procedure edFFinChange(Sender: TObject);
    procedure rgMesClick(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure btCREDITO_FINClick(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure edFFinExit(Sender: TObject);
    procedure stpInicioExit(Sender: TObject);
    procedure stpFinExit(Sender: TObject);
    procedure sgcDATAMoveRow(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure btACREDITADOClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure btPROMOTORClick(Sender: TObject);
    procedure chbxPromotorClick(Sender: TObject);
    procedure ilPROMOTOREjecuta(Sender: TObject);
    procedure ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
    procedure btPROM_ADMONClick(Sender: TObject);
    procedure ilPromAdmonEjecuta(Sender: TObject);
    procedure chbxPromAmonClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure cbxConsAcredClick(Sender: TObject);
    procedure cbProductosClick(Sender: TObject);
    procedure chbxGpoProductoClick(Sender: TObject);
    private
    { Private declarations }
     procedure EnableCheckBox(var CheckBox : TCheckBox);
     procedure ImprimeReporte(bPreview : Boolean; grOpcion : TGenRepOption);
     procedure InhabilitaCtrls;
     procedure HabilitaCtrls;
     procedure InhabilitaEdit(pedEdit: TEdit);
     procedure HabilitaEdit(pedEdit: TEdit);

     Function  CadenaSql : String;
     Procedure MuestraDatos;
//SISDES 11/2008   Control de accesos
     Function  ObtenAcceso: String;
//SISDES        
     Procedure AsignaEmpresaSuc;     
    public
    { Public declarations }
    Objeto : TMEdoCta;
    VlIndexProd, VlIndexGpoProd : Integer;
    end;

 TMEdoCta= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre         : TParamCre;
        CrCredito        : TCrCredito;
        GpoProd          : TMProdGpo;
        Producto         : TCrProduct;
        Acreditado       : TCrAcredit;
        Promotor         : TEmpleado; //Promotor Responsable
        PromotorAdmon    : TEmpleado; //Promotor Admon
        UnidadNegocio    : TUnNegocio;
        Empresa          : TEmpresa;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
uses IntMQrEdoCta;
{$R *.DFM}   

constructor TMEdoCta.Create( AOwner : TComponent );
begin Inherited;
   CrCredito := TCrCredito.Create(Self);
   CrCredito.MasterSource:=Self;
   CrCredito.FieldByName('ID_CREDITO').MasterField :='ID_CREDITO';

   GpoProd:= TMProdGpo.Create(Self);
   GpoProd.MasterSource:=Self;
   GpoProd.FieldByName('CVE_PRODUCTO_GPO').MasterField :='CVE_PRODUCTO_GPO';

   Producto :=  TCrProduct.Create(Self);
   Producto.MasterSource:=Self;
   Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField :='CVE_PRODUCTO_CRE';

   Acreditado := TCrAcredit.Create(Self);
   Acreditado.MasterSource := Self;

   Promotor := TEmpleado.Create(Self);
   Promotor.FilterBy := fbTMPersonaEmpleado;
   Promotor.MasterSource := Self;
   Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
   Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';
   Promotor.FilterString := Promotor.BuscaWhereString;

   PromotorAdmon := TEmpleado.Create(Self);
   PromotorAdmon.FilterBy := fbTMPersonaEmpleado;
   PromotorAdmon.MasterSource := Self;
   PromotorAdmon.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR_ADM';
   PromotorAdmon.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';
   PromotorAdmon.FilterString := PromotorAdmon.BuscaWhereString;

   Empresa := TEmpresa.Create(Self);
   UnidadNegocio := TUnNegocio.Create(Self);

   StpName  := ' ';
   UseQuery := False;
   HelpFile := 'IntMEdoCta.Hlp';
   ShowMenuReporte:=True;
end;

Destructor TMEdoCta.Destroy;
begin
   If Assigned(CrCredito) Then
      CrCredito.Free;
   If Assigned(GpoProd) Then
      GpoProd.Free;
   If Assigned(Producto) Then
      Producto.Free;
   If Assigned(Acreditado) Then
      Acreditado.Free;
   If Assigned(Promotor) Then
      Promotor.Free;
   If Assigned(PromotorAdmon) Then
      PromotorAdmon.Free;
   If Assigned(Empresa) Then
      Empresa.Free;
   If Assigned(UnidadNegocio) Then
      UnidadNegocio.Free;
   Inherited;
end;


function TMEdoCta.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMEdoCta;
begin
   W:=TWMEdoCta.Create(Self);
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


Function TMEdoCta.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IMEdoCta.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TMEdoCta.Reporte:Boolean;
begin //Execute_Reporte();
end;

(***********************************************FORMA ********************)
(*                                                                              *)
(*  FORMA

(*                                                                              *)
(***********************************************FORMA ********************)
procedure TwMEdoCta.AsignaEmpresaSuc;
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

procedure TwMEdoCta.FormShow(Sender: TObject);
Var qyQuery : TQuery;
    sSQL    : String;
begin
   VlIndexProd := 0;
   // hegc se agrega variable de indice
   VlIndexGpoProd  := 0;

   With Objeto Do Begin
      CrCredito.ID_CREDITO.Control := edDisposicion;
      CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edDesc_Prod;
      CrCredito.GetParams(Objeto);

      Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
      Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
      Objeto.GpoProd.GetParams(Objeto);

      Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;
      Objeto.Producto.GetParams(Objeto);
      edDESC_PRODUCTO1.Hint := Objeto.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO1.ShowHint := True;

      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

      Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      Objeto.Promotor.Id_Persona.Control :=edID_PROMOTOR;
      Objeto.Promotor.Persona.Nombre.Control :=edNOM_PROMOTOR;
      Objeto.Promotor.GetParams(Objeto);
      edNOM_PROMOTOR.Hint := Objeto.Promotor.Persona.Nombre.AsString;
      edNOM_PROMOTOR.ShowHint := True;

      Objeto.PromotorAdmon.ID_Persona.Control :=edID_PROM;
      Objeto.PromotorAdmon.Persona.Nombre.Control :=edNOM_PROM;
      Objeto.PromotorAdmon.GetParams(Objeto);
      edNOM_PROM.Hint := Objeto.PromotorAdmon.Persona.Nombre.AsString;
      edNOM_PROM.ShowHint := True;

   End;
   stpInicio.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   stpFin.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   rgMes.ItemIndex:= 0;

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;

//HEGC OCT SE INTEGRA CLB PARA SELECCIÓN DE MULTIGRUPOS
   sSQL := ' SELECT CVE_PRODUCTO_GPO, CVE_PRODUCTO_GPO || '' - '' || DESC_L_PROD_GPO AS CVE_PRO_GPO_DES FROM CR_PRODUCTO_GPO '+
           ' WHERE CVE_PRODUCTO_GPO IN (SELECT CR_PRODUCTO.CVE_PRODUCTO_GPO FROM CR_PRODUCTO WHERE B_CONSULTA_DOC = ''F'' AND SIT_PRODUCTO = ''AC'' AND ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa) +') ORDER BY CVE_PRODUCTO_GPO ';
   qyQuery:= GetSQLQuery(sSQL, Objeto.DataBaseName, Objeto.SessionName, False);
   try
      If qyQuery <> Nil Then
      Begin
           while not(qyQuery.Eof)  do
           begin
                VlIndexGpoProd := cbGpoProducto.Items.Add(qyQuery.FieldByName('CVE_PRO_GPO_DES').AsString);
                                  CBCveGpoProd.Items.Add(qyQuery.FieldByName('CVE_PRODUCTO_GPO').AsString);
                qyQuery.Next;
           end;
      end;
   finally
         qyQuery.Free;
   end;
//hegc

//ROIM OCT SE INTEGRA CLB PARA SELECCIÓN DE MULTIPRODUCTOS
//SELECT CVE_PRODUCTO_GPO, CVE_PRODUCTO_GPO || ' - ' || DESC_L_PROD_GPO AS CVE_PRO_GPO_DES FROM CR_PRODUCTO_GPO WHERE CVE_PRODUCTO_GPO IN (SELECT CR_PRODUCTO.CVE_PRODUCTO_GPO FROM CR_PRODUCTO WHERE B_CONSULTA_DOC = 'F' AND SIT_PRODUCTO = 'AC' AND ID_EMPRESA = 2)

   sSQL := 'SELECT CVE_PRODUCTO_CRE, CVE_PRODUCTO_CRE || '' - '' || DESC_L_PRODUCTO AS CVE_PRODUCTO FROM CR_PRODUCTO WHERE B_CONSULTA_DOC = ''F'' AND SIT_PRODUCTO = ''AC'' AND ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa) +' ORDER BY CVE_PRODUCTO_CRE';
   qyQuery:= GetSQLQuery(sSQL, Objeto.DataBaseName, Objeto.SessionName, False);
   try
      If qyQuery <> Nil Then
      Begin
           while not(qyQuery.Eof)  do
           begin
                VlIndexProd := cbProducto.Items.Add(qyQuery.FieldByName('CVE_PRODUCTO').AsString);
                               CBCveProd.Items.Add(qyQuery.FieldByName('CVE_PRODUCTO_CRE').AsString);
                qyQuery.Next;
           end;
      end;
   finally
         qyQuery.Free;
   end;
//ROIM

end;

procedure TwMEdoCta.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CrCredito.ID_CREDITO.Control := Nil;
      CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := Nil;
      Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= Nil;
      Objeto.GpoProd.DESC_C_PROD_GPO.Control:= Nil;
      Objeto.Producto.CVE_PRODUCTO_CRE.Control := Nil;
      Objeto.Producto.DESC_C_PRODUCTO.Control := Nil;
      Objeto.Acreditado.ID_ACREDITADO.Control := nil;
      Objeto.Acreditado.Persona.Nombre.Control := nil;
      Objeto.Promotor.Persona.Nombre.Control :=nil;
      Objeto.Promotor.Id_Persona.Control :=nil;
      Objeto.PromotorAdmon.Persona.Nombre.Control :=nil;
      Objeto.PromotorAdmon.Id_Persona.Control :=nil;
      Objeto.Empresa.ID_Empresa.Control := Nil;
      Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
      Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
      Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
   End;
end;

procedure TwMEdoCta.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMEdoCta.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TwMEdoCta.ImprimeReporte(bPreview : Boolean; grOpcion : TGenRepOption);
Var
   sSituacion: String;
   VLMsg     : String;
   vlFcorte  : String;
   VlProducto : String;
   VlGpoProducto : String;
   VlIndex: Integer;
   VLPrimero  : Boolean;
   sEnRecup : String;  //FJR 07.06.2012 PARA PERMITIR FILTRADO DE ACREDITADOS EN RECUPERACION
begin
   If rgSituacion.ItemIndex = 0 Then
      sSituacion:= '0'
   Else If rgSituacion.ItemIndex = 1 Then
      sSituacion:= '1'
   Else If rgSituacion.ItemIndex = 2 Then
      sSituacion:= '2';

   //FJR 07.06.2012  PARA PERMITIR FILTRADO DE ACREDITADOS EN RECUPERACION
   sEnRecup:= IntToStr(RGRecup.ItemIndex) ;

// HEGC OCT SE INTEGRA CLB PARA SELECCION DE MULTIGRUPOS
     VLPrimero := True;

     for VlIndex := 0 to VlIndexGpoProd do
     begin
          CBCveGpoProd.Checked[VlIndex] := cbGpoProducto.Checked[VlIndex];
     end;


//HEGC OCT SE INTEGRA CLB PARA SELECCIÓN DE MULTIGRUPOS
     VlGpoProducto := '';
     for VlIndex := 0 to VlIndexGpoProd do
     begin
          if CBCveGpoProd.Checked[VlIndex] then
          begin
               if not(VLPrimero) then
                  VlGpoProducto := VlGpoProducto + ','+''''+CBCveGpoProd.Items.Strings[VlIndex]+''''
                else
                begin
                     VlGpoProducto := ''''+CBCveGpoProd.Items.Strings[VlIndex]+'''';
                     VLPrimero := False;
                end;
          end;
     end;
// HEGC



     VLPrimero := True;

     for VlIndex := 0 to VlIndexProd do
     begin
          CBCveProd.Checked[VlIndex] := cbProducto.Checked[VlIndex];
     end;


//ROIM OCT SE INTEGRA CLB PARA SELECCIÓN DE MULTIPRODUCTOS
     VlProducto := '';
     for VlIndex := 0 to VlIndexProd do
     begin
          if CBCveProd.Checked[VlIndex] then
          begin
               if not(VLPrimero) then
                  VlProducto := VlProducto + ','+''''+CBCveProd.Items.Strings[VlIndex]+''''
                else
                begin
                     VlProducto := ''''+CBCveProd.Items.Strings[VlIndex]+'''';
                     VLPrimero := False;
                end;
          end;
     end;
//ROIM


   VLMsg :=
   RepEdoCta(edDisposicion.Text     , edFIni.Text            ,
             edFFin.Text            ,
// HEGC OCT SE INTEGRA CLB PARA SELECCION DE MULTIGRUPOS
//             edCVE_PRODUCTO_GPO.Text,
             VlGpoProducto,
// hegc
//ROIM OCT SE INTEGRA CLB PARA SELECCIÓN DE MULTIPRODUCTOS
//             edCVE_PRODUCTO_CRE.Text, sSituacion             ,
             VlProducto, sSituacion             ,
//ROIM
             sgcDATA.CellStr['F_CORTE',sgcDATA.SG.Row]    ,
             sgcDATA.CellStr['FOLIO_CORTE',sgcDATA.SG.Row],
             edACREDITADO.Text, edID_PROMOTOR.Text,
             edID_PROM.Text, EdIdEmpresa.Text, EdIDSucursal.Text, IntToStr(rgCodPostal.ItemIndex),
             cbxEdoCta.Checked,
             cbxConsAcred.Checked,  // <ICASE JMML 08/Septiembre/2006>      Nuevo filtro para el reporte
             Objeto.Apli, bPreview,
             cbManual.Checked,
             grOpcion, '', sEnRecup);  // PARAMETRO PARA DIGITALIZAR REPORTE JFOF 27/12/2011  FJR 07.06.2012  PARA PERMITIR FILTRADO DE ACREDITADOS EN RECUPERACION
   MBitacora.Lines.Add(VLMsg);

End;

procedure TwMEdoCta.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMEDOCTA_IMPRI',True,True) then
   begin
      ImprimeReporte(False, grPrint);
   end;
end;

procedure TwMEdoCta.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMEDOCTA_PREVI',True,True) then
   begin
      ImprimeReporte(True, grPreview);
   end;
end;

procedure TwMEdoCta.ilDisposicionCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMEdoCta.ilDisposicionEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ilDisposicion.Buffer]) Then Begin
      cbxDisposicion.Checked:=True;
      cbxDisposicion.Enabled:=True;
      MuestraDatos;      
      InterForma1.NextTab(edDisposicion);
   End;
end;

procedure TwMEdoCta.btDisposicionClick(Sender: TObject);
begin
   With Objeto Do Begin
      CrCredito.ShowAll := True;
      If CrCredito.Busca then Begin
         cbxDisposicion.Checked:= True;
         cbxDisposicion.Enabled:= True;
         MuestraDatos;
         InterForma1.NextTab(edDisposicion);
      End;
   End;
end;

procedure TwMEdoCta.cbxDisposicionClick(Sender: TObject);
begin
   EnableCheckBox(cbxDisposicion);
   Objeto.CrCredito.Active := cbxDisposicion.Checked;
   MuestraDatos;
end;

procedure TwMEdoCta.cbxFECHASClick(Sender: TObject);
begin
   EnableCheckBox(cbxFECHAS);
   If not cbxFECHAS.Checked Then Begin
      edFIni.Text:='';
      edFFin.Text:='';
      rgMes.ItemIndex:= -1;
   End;
end;

procedure TwMEdoCta.edFIniChange(Sender: TObject);
begin
   If Trim(edFIni.Text)<>'' Then Begin
      If Not cbxFECHAS.Checked Then Begin
          cbxFECHAS.Checked:=True;
          cbxFECHAS.Enabled:=True;
      End;
   End;
end;

procedure TwMEdoCta.edFFinChange(Sender: TObject);
begin
   If Trim(edFFin.Text)<>'' Then Begin
      If Not cbxFECHAS.Checked Then Begin
          cbxFECHAS.Checked:=True;
          cbxFECHAS.Enabled:=True;
      End;
   End;
end;

procedure TwMEdoCta.rgMesClick(Sender: TObject);
begin
   Objeto.Apli.Fecha.FechaReferencia := Objeto.Apli.DameFechaEmpresaDia('D000');
   If  rgMes.ItemIndex = 0 Then Begin
{      edFIni.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.Fecha.DiaLiquidacion('IMAC'));
      edFFin.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.Fecha.DiaLiquidacion('FMAC'));
      }
      edFIni.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.Fecha.DiaLiquidacion('IMAN'));
      edFFin.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.Fecha.DiaLiquidacion('FMAN'));
      {EASA4011}
      edFFin.Text:= DateTimeToStr(DameFinMes(Objeto.Apli.Fecha.DiaLiquidacion('FMAN')));
      {EASA4011}
   End Else If  rgMes.ItemIndex = 1 Then Begin
//      edFIni.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.Fecha.DiaLiquidacion('IMAN'));
     edFIni.Text:= '01/'+FormatDateTime('mm/yyyy',Objeto.Apli.Fecha.DiaLiquidacion('FMAA'));

//      edFFin.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.Fecha.DiaLiquidacion('FMAN'));
      edFFin.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.Fecha.DiaLiquidacion('FMAA')); //HERJA MAYO 2014
      {EASA4011}
//      edFFin.Text:= DateTimeToStr(DameFinMes(Objeto.Apli.Fecha.DiaLiquidacion('FMAN')));
      edFFin.Text:= DateTimeToStr(DameFinMes(Objeto.Apli.Fecha.DiaLiquidacion('FMAA'))); //HERJA MAYO 2014
      {EASA4011}
   End;
end;

procedure TwMEdoCta.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   With Objeto Do Begin
      GpoProd.ShowAll := True;
      If GpoProd.Busca Then Begin
         cbxCVE_PRODUCTO_GPO.Checked:= True;
         cbxCVE_PRODUCTO_GPO.Enabled:= True;
         InterForma1.NextTab(edCVE_PRODUCTO_GPO);
      End;
   End;
end;

procedure TwMEdoCta.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
Begin
    EnableCheckBox(cbxCVE_PRODUCTO_GPO);
    Objeto.GpoProd.Active := cbxCVE_PRODUCTO_GPO.Checked;
end;

procedure TwMEdoCta.btCREDITO_FINClick(Sender: TObject);
begin
    Objeto.Producto.BuscaWhereString:= ' CR_PRODUCTO.SIT_PRODUCTO ='
                                     + #39 + 'AC' + #39 ;
    Objeto.Producto.FilterString := Objeto.Producto.BuscaWhereString;
    Objeto.Producto.ShowAll := True;
    if Objeto.Producto.Busca Then Begin
        chbxProducto.Checked:= True;
        chbxProducto.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    end;
end;

procedure TwMEdoCta.chbxProductoClick(Sender: TObject);
begin
   EnableCheckBox(chbxProducto);
   Objeto.Producto.Active := chbxProducto.Checked;
end;

procedure TwMEdoCta.ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMEdoCta.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMEdoCta.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      cbxCVE_PRODUCTO_GPO.Checked:=True;
      cbxCVE_PRODUCTO_GPO.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMEdoCta.ilPRODUCTOEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
      chbxProducto.Checked:=True;
      chbxProducto.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

Function TwMEdoCta.CadenaSql : String;
var
   vlsql : String;
Begin
   vlSql:='';
   If Objeto.CrCredito.ID_CREDITO.AsInteger <> 0 Then Begin
      vlsql := ' SELECT '+
               '        CR_EC_CREDITO.ID_CREDITO,'+
               '        CR_EC_CREDITO.F_CORTE,'+
               '        CR_EC_CREDITO.FOLIO_CORTE,'+
               '        CR_CREDITO.ID_CONTRATO,'+
               '        CONTRATO.ID_TITULAR,'+
               '        PERSONA.NOMBRE,'+
               '        CR_EC_CREDITO.F_INICIO,'+
               '        CR_EC_CREDITO.F_VENCIMIENTO ';

     vlsql := vlsql +
               '   FROM CR_EC_CREDITO, CR_CREDITO, CONTRATO, PERSONA ';

      vlsql := vlsql +
               '  WHERE CR_EC_CREDITO.ID_CREDITO = CR_CREDITO.ID_CREDITO ';

//SISDES 11/2008   Control de accesos
{      //FILTRO POR MESES
      vlsql := vlsql +
               '    AND CR_EC_CREDITO.F_CORTE > (' + SQLFecha(Objeto.Apli.Fecha.DiaLiquidacion('IMAN')) + ' - 5 )';
}
      vlsql := vlsql + ObtenAcceso;
//SISDES

      vlsql := vlsql +
               '    AND CR_CREDITO.ID_CONTRATO = CONTRATO.ID_CONTRATO '+
               '    AND CONTRATO.ID_TITULAR = PERSONA.ID_PERSONA '+
               '    AND CR_EC_CREDITO.ID_CREDITO = '+ Objeto.CrCredito.ID_CREDITO.AsString ;

      vlsql := vlsql +
               '  ORDER BY CR_EC_CREDITO.F_CORTE DESC,  CR_EC_CREDITO.FOLIO_CORTE DESC ';
   End;
   CadenaSql := vlSql;
end;


//SISDES 11/2008   Control de accesos
Function TwMEdoCta.ObtenAcceso: String;
var vlQry : TQuery;
    vlsql : String;
    vlSalida : String;
begin
     vlSalida := '';
     vlsql:= ' SELECT B_CTRL_EDO_CTA, F_INICIO ' + coCRLF +
             ' FROM CR_CTRL_EXCEP ' + coCRLF +
             ' WHERE ID_EMPRESA  = ' + IntToStr(Objeto.Apli.IdEmpresa) + coCRLF +
             '   AND CVE_CTRL_EXCEP = ''EDOCTA'' ' + coCRLF ;

     vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
             if vlQry.FieldByName('B_CTRL_EDO_CTA').AsString = 'V' then
                vlSalida := '    AND CR_EC_CREDITO.F_CORTE >= (' + SQLFecha(vlQry.FieldByName('F_INICIO').AsDateTime) + ') ';
             //end if;
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;


     vlSalida := '';


     ObtenAcceso := vlSalida;
end;
//SISDES


Procedure TwMEdoCta.MuestraDatos;
var
   vlQry : TQuery;
   sSQL :String;
begin
   sSQL:= CadenaSql;
   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      try
         if vlQry <> nil then Begin

            vlQry.FieldByName('ID_CREDITO').Visible := False;
            vlQry.FieldByName('F_CORTE').DisplayLabel := 'F_CORTE' + #30 +'>C';
            vlQry.FieldByName('FOLIO_CORTE').DisplayLabel := 'FOLIO_CORTE' + #30 +'>C';
            vlQry.FieldByName('ID_CONTRATO').DisplayLabel := 'ID_CONTRATO' + #30 +'>C';
            vlQry.FieldByName('ID_TITULAR').Visible := False;
            vlQry.FieldByName('NOMBRE').DisplayLabel := 'NOMBRE' + #30 +'>C';
            vlQry.FieldByName('F_INICIO').DisplayLabel := 'F_INICIO' + #30 +'>C';
            vlQry.FieldByName('F_VENCIMIENTO').DisplayLabel := 'F_VENCIMIENTO' + #30 +'>C';

            vlQry.FieldByName('F_CORTE').DisplayWidth := 12;
            vlQry.FieldByName('FOLIO_CORTE').DisplayWidth := 12;
            vlQry.FieldByName('ID_CONTRATO').DisplayWidth := 12;
            vlQry.FieldByName('NOMBRE').DisplayWidth := 27;
            vlQry.FieldByName('F_INICIO').DisplayWidth := 12;
            vlQry.FieldByName('F_VENCIMIENTO').DisplayWidth := 12;
            sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,False);
         End Else Begin
            sgcDATA.Clear('NO SE ENCONTRARON DATOS'#30'>C');
         end;
      finally
         if vlQry <> nil then
            vlQry.free;
      end;
   End Else Begin
      sgcDATA.Clear('NO SE ENCONTRARON DATOS'#30'>C');
   End;
end;

procedure TwMEdoCta.edFFinExit(Sender: TObject);
begin
   Objeto.Apli.Fecha.FechaReferencia := StrToDate(edFFin.Text);
   edFIni.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.Fecha.DiaLiquidacion('IMAC'));
end;

  procedure TwMEdoCta.stpInicioExit(Sender: TObject);
begin
   edFIni.SetFocus;
end;

procedure TwMEdoCta.stpFinExit(Sender: TObject);
begin
   edFFin.SetFocus;
end;

procedure TwMEdoCta.sgcDATAMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   Objeto.Apli.Fecha.FechaReferencia := StrToDate(sgcDATA.CellStr['F_CORTE',ToIndex]);
   edFIni.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.Fecha.DiaLiquidacion('IMAC'));
   edFFin.Text:= sgcDATA.CellStr['F_CORTE',ToIndex];
end;

procedure TwMEdoCta.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMEdoCta.chbxAcreditadoClick(Sender: TObject);
begin
   EnableCheckBox(chbxAcreditado);
   Objeto.Acreditado.Active := chbxAcreditado.Checked;
end;

procedure TwMEdoCta.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMEdoCta.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMEdoCta.btPROMOTORClick(Sender: TObject);
begin
    Objeto.Promotor.ShowAll := True;
    If Objeto.Promotor.Busca Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMEdoCta.chbxPromotorClick(Sender: TObject);
begin
   EnableCheckBox(chbxPromotor);
   Objeto.Promotor.Active := chbxPromotor.Checked;
end;

procedure TwMEdoCta.ilPROMOTOREjecuta(Sender: TObject);
begin
    If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TwMEdoCta.ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMEdoCta.ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMEdoCta.btPROM_ADMONClick(Sender: TObject);
begin
    Objeto.PromotorAdmon.ShowAll := True;
    If Objeto.PromotorAdmon.Busca Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TwMEdoCta.ilPromAdmonEjecuta(Sender: TObject);
begin
    If Objeto.PromotorAdmon.FindKey([ilPromAdmon.Buffer]) Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TwMEdoCta.chbxPromAmonClick(Sender: TObject);
begin
   EnableCheckBox(chbxPromAmon);
   Objeto.PromotorAdmon.Active := chbxPromAmon.Checked;
end;

procedure TwMEdoCta.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMEdoCta.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMEdoCta.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMEdoCta.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMEdoCta.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

// </ICASE JMML 08/Septiembre/2006>   Nuevo procedimiento
procedure TwMEdoCta.HabilitaCtrls;
begin
    btCVE_PRODUCTO_GPO.Enabled := True;
    btCREDITO_FIN.Enabled := True;
    btDisposicion.Enabled := True;
    btPROMOTOR.Enabled := True;
    btPROM_ADMON.Enabled := True;

    HabilitaEdit(edCVE_PRODUCTO_GPO);
    HabilitaEdit(edCVE_PRODUCTO_CRE);
    HabilitaEdit(edDisposicion);
    HabilitaEdit(edID_PROMOTOR);
    HabilitaEdit(edID_PROM);

    cbManual.Enabled := True;

    rgMes.Enabled := True;

    rgSituacion.Enabled := True;
end;

// </ICASE JMML 08/Septiembre/2006>   Nuevo procedimiento
procedure TwMEdoCta.InhabilitaCtrls;
begin
    If cbxCVE_PRODUCTO_GPO.Checked Then
        cbxCVE_PRODUCTO_GPO.Checked := False;
    If chbxProducto.Checked Then
        chbxProducto.Checked := False;
    If cbxDisposicion.Checked Then
        cbxDisposicion.Checked := False;
    If chbxPromotor.Checked Then
        chbxPromotor.Checked := False;
    If chbxPromAmon.Checked Then
        chbxPromAmon.Checked := False;

    btCVE_PRODUCTO_GPO.Enabled := False;
    btCREDITO_FIN.Enabled := False;
    btDisposicion.Enabled := False;
    btPROMOTOR.Enabled := False;
    btPROM_ADMON.Enabled := False;

    InhabilitaEdit(edCVE_PRODUCTO_GPO);
    InhabilitaEdit(edCVE_PRODUCTO_CRE);
    InhabilitaEdit(edDisposicion);
    InhabilitaEdit(edID_PROMOTOR);
    InhabilitaEdit(edID_PROM);

    cbManual.Checked := False;
    cbManual.Enabled := False;

    rgMes.Enabled := False;

    rgSituacion.Enabled := False;
    rgSituacion.ItemIndex := 2
end;

// </ICASE JMML 08/Septiembre/2006>   Nuevo procedimiento
procedure TwMEdoCta.InhabilitaEdit(pedEdit: TEdit);
begin
    pedEdit.Color := clBtnFace;
    pedEdit.ReadOnly := True;
end;

// </ICASE JMML 08/Septiembre/2006>   Nuevo procedimiento
procedure TwMEdoCta.HabilitaEdit(pedEdit: TEdit);
begin
    pedEdit.Color := clWindow;
    pedEdit.ReadOnly := False;
end;

procedure TwMEdoCta.cbxConsAcredClick(Sender: TObject);
begin
    // <ICASE JMML 08/Septiembre/2006>      Se agregó un CheckBOx para seleccionar la opción de "Consolidado por Acreditado"
    If cbxConsAcred.Checked Then
        InhabilitaCtrls
    Else
        HabilitaCtrls;
    // </ICASE JMML 08/Septiembre/2006>
end;

procedure TwMEdoCta.cbProductosClick(Sender: TObject);
var VlIndex: Integer;
begin
     for VlIndex := 0 to VlIndexProd do
     begin
          cbProducto.Checked[VlIndex] :=  cbProductos.Checked;
     end;
end;

procedure TwMEdoCta.chbxGpoProductoClick(Sender: TObject);
var VlIndex: Integer;
begin
     for VlIndex := 0 to VlIndexGpoProd do
     begin
          cbGpoProducto.Checked[VlIndex] :=  chbxGpoProducto.Checked;
     end;
End;

end.
