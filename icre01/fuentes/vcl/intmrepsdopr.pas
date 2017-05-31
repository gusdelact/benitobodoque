// Sistema         : Clase de RepCtaAcr
// Fecha de Inicio : 26/05/2005
// Función forma   : Clase de RepCtaAcr
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMRepSdoPr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntParamCre,
IntMPers,
IntMon,           //Moneda
IntCrProduct,     //Producto
IntMQrSdoProyMSig,//Reporte
Intempre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntEmple, UCrpe32
;

Type
 TMRepSdoPr= class;

  TWMRepSdoPr=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_MONEDA : TLabel;
    edCVE_MONEDA : TEdit;
    edDESC_MONEDA : TEdit;
    lbID_ACREDITADO : TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    edDESC_PRODUCTO: TEdit;
    btMoneda: TBitBtn;
    btCVE_PRODUCTO_CRE: TBitBtn;
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
    chbProducto: TCheckBox;
    ilCVE_MONEDA: TInterLinkit;
    ilCVE_PRODUCTO_CRE: TInterLinkit;
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
    Label2: TLabel;
    Label4: TLabel;
    edID_PROM_ADM: TEdit;
    btID_PROM_ADM: TBitBtn;
    edNOM_PROM_ADM: TEdit;
    chbID_PROM_ADM: TCheckBox;
    edID_PROM_ASOC: TEdit;
    btID_PROM_ASOC: TBitBtn;
    edNOM_PROM_ASOC: TEdit;
    chbID_PROM_ASOC: TCheckBox;
    ilID_PROM_ADM: TInterLinkit;
    ilID_PROM_ASOC: TInterLinkit;
    lbCVE_MES: TListBox;
    Label1: TLabel;
    rgPromotor: TRadioGroup;
    rptReporte: TCrpe;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btMonedaClick(Sender: TObject);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure chbMonedaClick(Sender: TObject);
    procedure btCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
    procedure chbProductoClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure btID_PROM_ADMClick(Sender: TObject);
    procedure ilID_PROM_ADMEjecuta(Sender: TObject);
    procedure chbID_PROM_ADMClick(Sender: TObject);
    procedure btID_PROM_ASOCClick(Sender: TObject);
    procedure ilID_PROM_ASOCEjecuta(Sender: TObject);
    procedure chbID_PROM_ASOCClick(Sender: TObject);
    private
     Procedure EnableCheckBox(var CheckBox : TCheckBox);
     Procedure ImprimeReporte(bPreview:Boolean);
     Procedure AsignaEmpresaSuc;
    { Private declarations }
    public
    { Public declarations }
    Objeto : TMRepSdoPr;
end;
 TMRepSdoPr= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_MONEDA               : TInterCampo;
        DESC_MONEDA              : TInterCampo;
        CVE_PRODUCTO_CRE         : TInterCampo;
        DESC_PRODUCTO            : TInterCampo;
        ID_PROM_ADM              : TInterCampo;
        NOM_PROM_ADM             : TInterCampo;
        ID_PROM_ASOC             : TInterCampo;
        NOM_PROM_ASOC            : TInterCampo;
        TIPO_REPORTE             : TInterCampo;

        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;
        Producto                 : TCrProduct;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        Promotor                 : TEmpleado; //Promotor Responsable
        PromotorAdmon            : TEmpleado; //Promotor Admon

        slListaMes               : TStringList;
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

constructor TMRepSdoPr.Create( AOwner : TComponent );
begin Inherited;
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftString,tsNinguno,tsNinguno,False);
                CVE_MONEDA.Caption:='Moneda';
                CVE_MONEDA.Parametro:='CVE_MONEDA';
      DESC_MONEDA :=CreaCampo('DESC_MONEDA',ftString,tsNinguno,tsNinguno,False);
                DESC_MONEDA.Caption:='Descripción de Moneda';
                DESC_MONEDA.Parametro:='DESC_MONEDA';
      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,False);
                CVE_PRODUCTO_CRE.Caption:='Producto';
                CVE_PRODUCTO_CRE.Parametro:='CVE_PRODUCTO_CRE';
      DESC_PRODUCTO :=CreaCampo('DESC_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
                DESC_PRODUCTO.Caption:='Producto';
                DESC_PRODUCTO.Parametro:='DESC_PRODUCTO';
      ID_PROM_ADM :=CreaCampo('ID_PROM_ADM',ftInteger,tsNinguno,tsNinguno,False);
                ID_PROM_ADM.Caption:='Promotor Administrativo';
                ID_PROM_ADM.Parametro:='ID_PROM_ADM';
      NOM_PROM_ADM :=CreaCampo('NOM_PROM_ADM',ftString,tsNinguno,tsNinguno,False);
                NOM_PROM_ADM.Caption:='Promotor Administrativo';
                NOM_PROM_ADM.Parametro:='NOM_PROM_ADM';
      ID_PROM_ASOC :=CreaCampo('ID_PROM_ASOC',ftInteger,tsNinguno,tsNinguno,False);
                ID_PROM_ASOC.Caption:='Promotor Asociado';
                ID_PROM_ASOC.Parametro:='ID_PROM_ASOC';
      NOM_PROM_ASOC :=CreaCampo('NOM_PROM_ASOC',ftString,tsNinguno,tsNinguno,False);
                NOM_PROM_ASOC.Caption:='Promotor Asociado';
                NOM_PROM_ASOC.Parametro:='NOM_PROM_ASOC';
      TIPO_REPORTE :=CreaCampo('TIPO_REPORTE',ftString,tsNinguno,tsNinguno,False);
                NOM_PROM_ASOC.Caption:='TIPO_REPORTE';
                NOM_PROM_ASOC.Parametro:='TIPO_REPORTE';
      With TIPO_REPORTE Do Begin
         Size := 3;
         UseCombo := True;
         ComboLista.Add('0');    ComboDatos.Add('ASC');
         ComboLista.Add('1');    ComboDatos.Add('ADM');
         ComboLista.Add('2');    ComboDatos.Add('');
      End;



      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Producto := TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);
      Promotor := TEmpleado.Create(Self);
      Promotor.FilterBy := fbTMPersonaEmpleado;
      Promotor.MasterSource := Self;
      Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROM_ASOC';
      Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';
      PromotorAdmon := TEmpleado.Create(Self);
      PromotorAdmon.FilterBy := fbTMPersonaEmpleado;
      PromotorAdmon.MasterSource := Self;
      PromotorAdmon.FieldByName('ID_PERSONA').MasterField := 'ID_PROM_ADM';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMRepCtaChqAcr.Hlp';
      ShowMenuReporte:=True;

      slListaMes:= TStringList.Create;
      slListaMes.Clear;
      slListaMes.Add('Enero=01');
      slListaMes.Add('Febrero=02');
      slListaMes.Add('Marzo=03');
      slListaMes.Add('Abril=04');
      slListaMes.Add('Mayo=05');
      slListaMes.Add('Junio=06');
      slListaMes.Add('Julio=07');
      slListaMes.Add('Agosto=08');
      slListaMes.Add('Septiembre=09');
      slListaMes.Add('Octubre=10');
      slListaMes.Add('Noviembre=11');
      slListaMes.Add('Diciembre=12');
end;

Destructor TMRepSdoPr.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   If Producto <> Nil Then
      Producto.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   If Promotor <> Nil Then
      Promotor.Free;
   If PromotorAdmon <> Nil Then
      PromotorAdmon.Free;
   slListaMes.Free;
   inherited;
end;


function TMRepSdoPr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMRepSdoPr;
begin
   W:=TWMRepSdoPr.Create(Self);
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


Function TMRepSdoPr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IRepctaa.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TMRepSdoPr.Reporte:Boolean;
begin //Execute_Reporte();
end;
(***********************************************FORMA RepCtaAcr********************)
(*                                                                              *)
(*  FORMA DE RepCtaAcr                                                            *)
(*                                                                              *)
(***********************************************FORMA RepCtaAcr********************)
procedure TWMRepSdoPr.AsignaEmpresaSuc;
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

Procedure TWMRepSdoPr.EnableCheckBox(Var CheckBox : TCheckBox);
Begin
   If Not CheckBox.Checked Then Begin
      CheckBox.Checked:=False;
      CheckBox.Enabled:=False;
   End Else Begin
      CheckBox.Checked:=True;
      CheckBox.Enabled:=True;
   End;
End;

procedure TWMRepSdoPr.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.CVE_MONEDA.Control:=edCVE_MONEDA;
   Objeto.DESC_MONEDA.Control:=edDESC_MONEDA;
   Objeto.CVE_PRODUCTO_CRE.Control:=edCVE_PRODUCTO_CRE;
   Objeto.DESC_PRODUCTO.Control:=edDESC_PRODUCTO;
   Objeto.ID_PROM_ADM.Control:=edID_PROM_ADM;
   Objeto.NOM_PROM_ADM.Control:=edNOM_PROM_ADM;
   Objeto.ID_PROM_ASOC.Control:=edID_PROM_ASOC;
   Objeto.NOM_PROM_ASOC.Control:=edNOM_PROM_ASOC;
   Objeto.TIPO_REPORTE.Control:= rgPromotor;

   Objeto.Moneda.Cve_Moneda.Control:= edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control:= edDESC_MONEDA;
   Objeto.Producto.CVE_PRODUCTO_CRE.Control:= edCVE_PRODUCTO_CRE;
   Objeto.Producto.DESC_L_PRODUCTO.Control:= edDESC_PRODUCTO;
   Objeto.Promotor.ID_Persona.Control :=edID_PROM_ASOC;
   Objeto.Promotor.Persona.Nombre.Control :=edNOM_PROM_ASOC;
   Objeto.PromotorAdmon.ID_Persona.Control :=edID_PROM_ADM;
   Objeto.PromotorAdmon.Persona.Nombre.Control :=edNOM_PROM_ADM;

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);
   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);
   AsignaEmpresaSuc;
   lbCVE_MES.ItemIndex:=0;
   rgPromotor.ItemIndex:=2;
end;

procedure TWMRepSdoPr.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_MONEDA.Control:=nil;
   Objeto.DESC_MONEDA.Control:=nil;
   Objeto.CVE_PRODUCTO_CRE.Control:=nil;
   Objeto.DESC_PRODUCTO.Control:= nil;
   Objeto.ID_PROM_ADM.Control:=nil;
   Objeto.NOM_PROM_ADM.Control:=nil;
   Objeto.ID_PROM_ASOC.Control:=nil;
   Objeto.NOM_PROM_ASOC.Control:=nil;
   Objeto.TIPO_REPORTE.Control:= nil;

   Objeto.Moneda.Cve_Moneda.Control:= nil;
   Objeto.Moneda.Desc_Moneda.Control:= nil;
   Objeto.Producto.CVE_PRODUCTO_CRE.Control:= nil;
   Objeto.Producto.DESC_L_PRODUCTO.Control:= nil;
   Objeto.Promotor.ID_Persona.Control :=nil;
   Objeto.Promotor.Persona.Nombre.Control :=nil;
   Objeto.PromotorAdmon.ID_Persona.Control :=nil;
   Objeto.PromotorAdmon.Persona.Nombre.Control :=nil;

   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TWMRepSdoPr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMRepSdoPr.btMonedaClick(Sender: TObject);
begin
   If Objeto.Moneda.Busca Then Begin
      chbMoneda.Checked:= True;
      chbMoneda.Enabled:= True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWMRepSdoPr.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilCVE_MONEDA.Buffer]) Then Begin
      chbMoneda.Checked:=True;
      chbMoneda.Enabled:=True;
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWMRepSdoPr.chbMonedaClick(Sender: TObject);
begin
   EnableCheckBox(chbMoneda);
   Objeto.Moneda.Active := chbMoneda.Checked;
end;

procedure TWMRepSdoPr.btCVE_PRODUCTO_CREClick(Sender: TObject);
begin
   If Objeto.Producto.Busca Then Begin
      chbProducto.Checked:= True;
      chbProducto.Enabled:= True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

procedure TWMRepSdoPr.ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilCVE_PRODUCTO_CRE.Buffer]) Then Begin
      chbProducto.Checked:=True;
      chbProducto.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

procedure TWMRepSdoPr.chbProductoClick(Sender: TObject);
begin
   EnableCheckBox(chbProducto);
   Objeto.Producto.Active := chbProducto.Checked;
end;

Procedure TWMRepSdoPr.ImprimeReporte(bPreview:Boolean);
Var sMes, sPromotor, sOrden, sCampos: String; dFecha: TDateTime;
   Year, Month, Day: Word; slSQL: TStringList;
Begin
   Objeto.GetFromControl;
   DecodeDate(Objeto.Apli.DameFechaEmpresaDia('D000'), Year, Month, Day);
   sMes:= Objeto.slListaMes.Values[Objeto.slListaMes.Names[lbCVE_MES.ItemIndex]];
   dFecha:= EncodeDate(Year,StrToInt(sMes),1);
   case rgPromotor.ItemIndex of
      0: sPromotor:='ASC';
      1: sPromotor:='ADM';
      2: sPromotor:='';
   end;


   If (lbCVE_MES.ItemIndex >= 0)and(rgPromotor.ItemIndex >=0 ) Then
      RepSdoProyMesSig( Objeto.CVE_MONEDA.AsInteger,
                        Objeto.ID_PROM_ADM.AsInteger,
                        Objeto.ID_PROM_ASOC.AsInteger,
                        EdIdEmpresa.Text, EdIDSucursal.Text,
                        Objeto.CVE_PRODUCTO_CRE.AsString,
                        sMes,sPromotor,
                        Objeto.Apli , bPreview)
   Else
      ShowMessage('Debe seleccionar un Mes y un Corte de Promotor');
      

   {DecodeDate(Objeto.Apli.DameFechaEmpresaDia('D000'), Year, Month, Day);
   sMes:= Objeto.slListaMes.Values[Objeto.slListaMes.Names[lbCVE_MES.ItemIndex]];
   dFecha:= EncodeDate(Year,StrToInt(sMes),1);

   If (Objeto.TIPO_REPORTE.AsString = 'ASC')or(Objeto.TIPO_REPORTE.AsString = '')Then Begin
      sCampos:= sCampos+ ' ID_PERS_ASOCIAD, NOMBRE_ASOC, '+ #13#10;
      sOrden:= sOrden + ' , NOMBRE_ASOC '+ #13#10;
   End Else If (Objeto.TIPO_REPORTE.AsString = 'ADM')or(Objeto.TIPO_REPORTE.AsString = '')Then Begin
      sCampos:= sCampos + ' ID_PROM_ADM, NOMBRE_ADM, '+ #13#10;
      sOrden:= sOrden + ' , NOMBRE_ADM '+ #13#10;
   End;

   If (lbCVE_MES.ItemIndex >= 0)and(rgPromotor.ItemIndex >=0 ) Then Begin
      rptReporte.Connect.ServerName := Objeto.Apli.DataBase.Params.Values['SERVER NAME'];
      rptReporte.Connect.UserID     := Objeto.Apli.DataBase.Params.Values['USER NAME'];
      rptReporte.Connect.Password   := Objeto.Apli.DataBase.Params.Values['PASSWORD'];
      rptReporte.Connect.Propagate  := True;
      rptReporte.Output := toWindow;
      rptReporte.ReportName := 'C:\Intercase\Interacciones\ICre01\Fuentes\Reportes\RepSdoProyMesSig.rpt';

      rptReporte.ParamFields.Clear;
      rptReporte.ParamFields.Retrieve;
      rptReporte.ParamFields.Name := 'pF_SISTEMA';
      rptReporte.ParamFields.AsDate := Objeto.Apli.DameFechaEmpresaDia('D000');
      rptReporte.ParamFields.Name := 'pFECHA';
      rptReporte.ParamFields.AsDate := dFecha;
      rptReporte.ParamFields.Name := 'pTIPO_REP';
      rptReporte.ParamFields.Value := Objeto.TIPO_REPORTE.AsString;

      rptReporte.ParamFields.Name := 'pCVE_MONEDA';
      rptReporte.ParamFields.AsNumber := Objeto.CVE_MONEDA.AsInteger;
      rptReporte.ParamFields.Name := 'pF_FINAL';
      rptReporte.ParamFields.AsDate := Objeto.F_FINAL.AsDateTime;
      rptReporte.ParamFields.Name := 'pF_INICIO';
      rptReporte.ParamFields.AsDate := Objeto.F_INICIO.AsDateTime;
      rptReporte.ParamFields.Name := 'pFH_OPERACION';
      If Objeto.F_MOVIMIENTO.AsString = '' Then
         rptReporte.ParamFields.Value := '0'
      Else rptReporte.ParamFields.Value := Objeto.F_MOVIMIENTO.AsString;

      rptReporte.ParamFields.Name := 'pID_ACREDITADO';
      rptReporte.ParamFields.AsNumber := Objeto.ID_ACREDITADO.AsInteger;
      rptReporte.ParamFields.Name := 'pID_CREDITO';
      rptReporte.ParamFields.AsNumber := Objeto.ID_CREDITO.AsInteger;
      rptReporte.ParamFields.Name := 'pID_EMPRESA';
      rptReporte.ParamFields.AsNumber := Objeto.ID_EMPRESA.AsInteger;

      rptReporte.Connect.Send;
      rptReporte.Formulas.Send;
      rptReporte.ParamFields.Send;
      rptReporte.SQL.Send;
      rptReporte.Execute;
   End  Else
      ShowMessage('Debe seleccionar un Mes y un Corte de Promotor'); }
End;

procedure TWMRepSdoPr.InterForma1BtnPreviewClick(Sender: TObject);
begin
   ImprimeReporte(True);
end;

procedure TWMRepSdoPr.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimeReporte(False);
end;

procedure TWMRepSdoPr.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TWMRepSdoPr.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMRepSdoPr.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TWMRepSdoPr.ILSucursalEjecuta(Sender: TObject);
begin
   If Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMRepSdoPr.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TWMRepSdoPr.btID_PROM_ADMClick(Sender: TObject);
begin
   Objeto.PromotorAdmon.ShowAll := True;
   If Objeto.PromotorAdmon.Busca Then Begin
      chbID_PROM_ADM.Checked:=True;
      chbID_PROM_ADM.Enabled:=True;
      InterForma1.NextTab(edID_PROM_ADM);
   End;
end;

procedure TWMRepSdoPr.ilID_PROM_ADMEjecuta(Sender: TObject);
begin
   If Objeto.PromotorAdmon.FindKey([ilID_PROM_ADM.Buffer])Then Begin
      chbID_PROM_ADM.Checked:=True;
      chbID_PROM_ADM.Enabled:=True;
      InterForma1.NextTab(edID_PROM_ADM);
   End;
end;

procedure TWMRepSdoPr.chbID_PROM_ADMClick(Sender: TObject);
begin
   EnableCheckBox(chbID_PROM_ADM);
   Objeto.PromotorAdmon.Active := chbID_PROM_ADM.Checked;
end;

procedure TWMRepSdoPr.btID_PROM_ASOCClick(Sender: TObject);
begin
   Objeto.Promotor.ShowAll := True;
   If Objeto.Promotor.Busca Then Begin
      chbID_PROM_ASOC.Checked:=True;
      chbID_PROM_ASOC.Enabled:=True;
      InterForma1.NextTab(edID_PROM_ASOC);
   End;
end;

procedure TWMRepSdoPr.ilID_PROM_ASOCEjecuta(Sender: TObject);
begin
   If Objeto.Promotor.FindKey([ilID_PROM_ASOC.Buffer])Then Begin
      chbID_PROM_ASOC.Checked:=True;
      chbID_PROM_ASOC.Enabled:=True;
      InterForma1.NextTab(edID_PROM_ASOC);
   End;
end;

procedure TWMRepSdoPr.chbID_PROM_ASOCClick(Sender: TObject);
begin
   EnableCheckBox(chbID_PROM_ADM);
   Objeto.Promotor.Active := chbID_PROM_ASOC.Checked;
end;

end.
