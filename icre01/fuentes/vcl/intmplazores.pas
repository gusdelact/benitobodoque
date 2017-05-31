// Sistema         : Clase de TMFndColoc
// Fecha de Inicio : 18/01/2005
// Función forma   : Clase de TMFndColoc
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMPlazoRes;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntCrProduct,     // Producto de crédito
IntMon,           // Moneda
IntCrAcredit,     // Acreditado
IntMPers,         // PromotorAsoc
IntCrCredito,     // Disposición
IntParamCre,      //
IntMQrPlazoRes,   //
IntMProdGpo,      //
Intempre,         // Empresa
IntUnNeg,         // Unidad Negocio/Suc
IntMInstDesc,
IntMPrgApoyo,
IntCrGruCla,
IntCrOrigRec
;

Type
 TMPlazoRes = class;

  TwMPlazoRes=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    ilMONEDA: TInterLinkit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
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
    lbCVE_PRODUCTO_CRE: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    ilPRODUCTO: TInterLinkit;
    chbxProducto: TCheckBox;
    ilCesion: TInterLinkit;
    SaveDialog1: TSaveDialog;
    edNbrArch: TEdit;
    sbExcel: TSpeedButton;
    Label4: TLabel;
    cbxArchivo: TCheckBox;
    Label5: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edNOM_CVE_PRODUCTO_GPO: TEdit;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
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
    Label8: TLabel;
    Label9: TLabel;
    edCVE_FND_ENT_DES: TEdit;
    edCVE_FND_PROGRAMA: TEdit;
    btCVE_FND_PROGRAMA: TBitBtn;
    btCVE_FND_ENT_DES: TBitBtn;
    ilCVE_FND_ENT_DES: TInterLinkit;
    ilCVE_FND_PROGRAMA: TInterLinkit;
    edNOM_FND_ENT_DES: TEdit;
    edNOM_FND_PROGRAMA: TEdit;
    cbxCVE_FND_ENT_DES: TCheckBox;
    cbxCVE_FND_PROGRAMA: TCheckBox;
    ilPROMOTOR: TInterLinkit;
    ilPromAdmon: TInterLinkit;
    ilACREDITADO: TInterLinkit;
    ilCVE_ORIGEN_REC: TInterLinkit;
    rgTIPO_REPORTE: TRadioGroup;
    Label11: TLabel;
    edVALOR_FILTRO: TEdit;
    btVALOR_FILTRO: TBitBtn;
    edDESC_FILTRO: TEdit;
    ikVALOR_FILTRO: TInterLinkit;
    cbVALOR_FILTRO: TCheckBox;
    rgSUB_TIPO_REP: TRadioGroup;
    edF_Inicio: TEdit;
    dtpF_Inicio: TInterDateTimePicker;
    lbLiqF_INICIO: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure edCVE_PRODUCTO_GPOExit(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);
    procedure edCVE_FND_PROGRAMAExit(Sender: TObject);
    procedure ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_FND_PROGRAMACapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure ilCVE_FND_PROGRAMAEjecuta(Sender: TObject);
    procedure cbxCVE_FND_ENT_DESClick(Sender: TObject);
    procedure cbxCVE_FND_PROGRAMAClick(Sender: TObject);
    procedure btCVE_FND_ENT_DESClick(Sender: TObject);
    procedure btCVE_FND_PROGRAMAClick(Sender: TObject);
    procedure rgTIPO_REPORTEClick(Sender: TObject);
    procedure rgSUB_TIPO_REPClick(Sender: TObject);
    procedure edVALOR_FILTROExit(Sender: TObject);
    procedure btVALOR_FILTROClick(Sender: TObject);
    procedure ikVALOR_FILTROCapture(Sender: TObject; var Show: Boolean);
    procedure ikVALOR_FILTROEjecuta(Sender: TObject);
    procedure cbVALOR_FILTROClick(Sender: TObject);
  private
    { Private declarations }
    Procedure MonedaEjecuta(CveMoneda: String; DoNextTab : Boolean );
    Procedure ImprimeReporte(bPreview:Boolean);
    Procedure CambiaControl;
    Procedure AsignaEmpresaSuc;
    Procedure SetFiltroPzoRes;
  public
    { Public declarations }
    Objeto : TMPlazoRes;
  end;

  TMPlazoRes= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        TIPO_REPORTE             : TInterCampo;
        SUB_TIPO_REP             : TInterCampo;
        //
        GpoProd                  : TMProdGpo;
        Producto                 : TCrProduct;
        Moneda                   : TMoneda;
        MInstDesc                : TMInstDesc;
        MPrgApoyo                : TMPrgApoyo;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        ParamCre                 : TParamCre;
        PzoRes                   : TCrGruCla;
        //
        Acreditado               : TCrAcredit;
        Promotor                 : TMPersona; //Promotor Responsable
        PromotorAdmon            : TMPersona; //Promotor Admon
        Credito                  : TCrCredito;//Disposición
        OrigRec                  : TCrOrigRec;
        //
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TMPlazoRes.Create( AOwner : TComponent );
begin
      Inherited;
      //
      TIPO_REPORTE := CreaCampo( 'TIPO_REPORTE',   ftString,  tsNinguno, tsNinguno, False );
      SUB_TIPO_REP := CreaCampo( 'SUB_TIPO_REP',   ftString,  tsNinguno, tsNinguno, False );
      //
      with TIPO_REPORTE do
      begin
        Size     := 2;
        UseCombo := True;
        ComboLista.Add('0');      ComboDatos.Add( coFndVig );
        ComboLista.Add('1');      ComboDatos.Add( coVigAct );
        ComboLista.Add('2');      ComboDatos.Add( coVdaAct );
      end;
      //
      with SUB_TIPO_REP do
      begin
        Size     := 2;
        UseCombo := True;
        ComboLista.Add('0');      ComboDatos.Add( coPlazo );
        ComboLista.Add('1');      ComboDatos.Add( coUDIS  );
        ComboLista.Add('2');      ComboDatos.Add( coDLLS  );
      end;
      //
      GpoProd:= TMProdGpo.Create(Self);
      GpoProd.MasterSource:=Self;
      GpoProd.FieldByName('CVE_PRODUCTO_GPO').MasterField  := 'CVE_PRODUCTO_GPO';
      //
      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField := 'CVE_PRODUCTO_CRE';
      //
      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField := 'CVE_MONEDA';
      //
      MInstDesc := TMInstDesc.Create(Self);
      MInstDesc.MasterSource:=Self;
      MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField := 'CVE_FND_ENT_DES';
      //
      MPrgApoyo := TMPrgApoyo.Create(Self);
      MPrgApoyo.MasterSource:=Self;
      MPrgApoyo.FieldByName('CVE_FND_PROGRAMA').MasterField := 'CVE_FND_PROGRAMA';
      //
      PzoRes  := TCrGruCla.Create(Self);
      PzoRes.MasterSource := Self;
      //
      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);
      //
      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;
      //
      Promotor := TMPersona.Create(Self);
      Promotor.FilterBy := fbTMPersonaEmpleado;
      Promotor.MasterSource := Self;
      Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
      Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';
      //
      PromotorAdmon := TMPersona.Create(Self);
      PromotorAdmon.FilterBy := fbTMPersonaEmpleado;
      PromotorAdmon.MasterSource := Self;
      PromotorAdmon.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
      //
      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';
      //
      OrigRec := TCrOrigRec.Create(Self);
      OrigRec.MasterSource:=Self;
      OrigRec.FieldByName('CVE_ORIGEN_REC').MasterField:='CVE_ORIGEN_REC';
      //
      UseQuery := False;
      HelpFile := 'InMFndColoc.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMPlazoRes.Destroy;
begin
   if Producto <> nil then
      Producto.Free;
   if Moneda <> nil then
      Moneda.Free;
   if Acreditado <> nil then
      Acreditado.Free;
   if Promotor <> nil then
      Promotor.Free;
   if PromotorAdmon <> nil then
      PromotorAdmon.Free;
   if Credito <> nil then
      Credito.Free;
   If GpoProd <> Nil Then
      GpoProd.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   If MInstDesc <> Nil Then
      MInstDesc.Free;
   If MPrgApoyo <> Nil Then
      MPrgApoyo.Free;
   If PzoRes <> Nil Then
      PzoRes.Free;         
   If OrigRec <> Nil Then
      OrigRec.Free;
   inherited;
end;


function TMPlazoRes.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMPlazoRes;
begin
   W := TwMPlazoRes.Create(Self);
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

Function TMPlazoRes.InternalBusca:Boolean;
begin
  InternalBusca := False;
end;
(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMPlazoRes.AsignaEmpresaSuc;
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

Procedure TwMPlazoRes.CambiaControl;
Begin
   cbxCVE_PRODUCTO_GPO.Checked:=True;
   cbxCVE_PRODUCTO_GPO.Enabled:=True;
End;

procedure TwMPlazoRes.MonedaEjecuta(CveMoneda: String; DoNextTab : Boolean );
begin
    If Objeto.Moneda.FindKey([CveMoneda]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;


procedure TwMPlazoRes.FormShow(Sender: TObject);
begin
   //PINTA DATOS DEL PANEL INFERIOR
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   dtpF_Inicio.DateTime:= Objeto.Apli.DameFechaEmpresa;
   edF_Inicio.text     := FormatDateTime('dd/mm/yyyy',dtpF_Inicio.DateTime);

   Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
   Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
   Objeto.GpoProd.GetParams(Objeto);

   Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
   Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;
   Objeto.Producto.GetParams(Objeto);
   edDESC_PRODUCTO1.Hint := Objeto.Producto.DESC_C_PRODUCTO.AsString;
   edDESC_PRODUCTO1.ShowHint := True;

   Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
   Objeto.Moneda.GetParams(Objeto);
   edDESC_MONEDA.Hint := Objeto.Moneda.Desc_Moneda.AsString;
   edDESC_MONEDA.ShowHint := True;

   Objeto.MInstDesc.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
   Objeto.MInstDesc.DESC_ENT_DES.Control    := edNOM_FND_ENT_DES;
   Objeto.MInstDesc.GetParams(Objeto);

   Objeto.MPrgApoyo.CVE_FND_PROGRAMA.Control:= edCVE_FND_PROGRAMA;
   Objeto.MPrgApoyo.DESC_PROGRAMA.Control   := edNOM_FND_PROGRAMA;
   Objeto.MPrgApoyo.GetParams(Objeto);

   Objeto.TIPO_REPORTE.Control := rgTIPO_REPORTE;
   Objeto.SUB_TIPO_REP.Control := rgSUB_TIPO_REP;

   Objeto.PzoRes.CVE_REFERENCIA.Control := edVALOR_FILTRO;
   Objeto.PzoRes.VALOR.Control  := edDESC_FILTRO;

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);

   AsignaEmpresaSuc;

   //
   Objeto.TIPO_REPORTE.AsString := coFndVig;
end;

procedure TwMPlazoRes.FormDestroy(Sender: TObject);
begin
   Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= nil;
   Objeto.GpoProd.DESC_C_PROD_GPO.Control:= nil;
   Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
   Objeto.Moneda.Cve_Moneda.Control := nil;
   Objeto.Moneda.Desc_Moneda.Control := nil;
   Objeto.MInstDesc.CVE_FND_ENT_DES.Control  := Nil;
   Objeto.MInstDesc.DESC_ENT_DES.Control     := Nil;
   Objeto.MPrgApoyo.CVE_FND_PROGRAMA.Control := Nil;
   Objeto.MPrgApoyo.DESC_PROGRAMA.Control    := Nil;
   Objeto.TIPO_REPORTE.Control := nil;
   Objeto.SUB_TIPO_REP.Control := nil;
   Objeto.PzoRes.CVE_REFERENCIA.Control := nil;
   Objeto.PzoRes.VALOR.Control  := nil;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMPlazoRes.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

{           +   E V E N T O S    D E L   U S U A R I O   +                     }

procedure TwMPlazoRes.edCVE_PRODUCTO_GPOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edCVE_PRODUCTO_GPO,True,'',True);
end;

procedure TwMPlazoRes.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMPlazoRes.ilCVE_PRODUCTO_GPOCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMPlazoRes.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMPlazoRes.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   If not cbxCVE_PRODUCTO_GPO.Checked Then Begin
      Objeto.GpoProd.Active:=False;
      cbxCVE_PRODUCTO_GPO.Checked:=False;
      cbxCVE_PRODUCTO_GPO.Enabled:=False;
   End Else Begin
      cbxCVE_PRODUCTO_GPO.Checked:=True;
      cbxCVE_PRODUCTO_GPO.Enabled:=True;
   End;
end;


procedure TwMPlazoRes.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,'',True);
end;

procedure TwMPlazoRes.btPRODUCTOClick(Sender: TObject);
begin
   if Objeto.Acreditado.Persona.Cve_Per_Juridica.AsString = 'PF' then
   Begin
      Objeto.Producto.BuscaWhereString:= ' CR_PRODUCTO.B_PER_FISICA = '
                                       + #39 + 'V' + #39
                                       + ' AND CR_PRODUCTO.SIT_PRODUCTO ='
                                       + #39 + 'AC' + #39 ;
      Objeto.Producto.FilterString := Objeto.Producto.BuscaWhereString;
   end
   else if Objeto.Acreditado.Persona.Cve_Per_Juridica.AsString = 'PM' then
   Begin
      Objeto.Producto.BuscaWhereString:= ' CR_PRODUCTO.B_PER_MORAL = '
                                       + #39 + 'V' + #39
                                       + ' AND CR_PRODUCTO.SIT_PRODUCTO ='
                                       + #39 + 'AC' + #39 ;
      Objeto.Producto.FilterString := Objeto.Producto.BuscaWhereString;
   end;
    Objeto.Producto.ShowAll := True;
    if Objeto.Producto.Busca Then Begin
        chbxProducto.Checked:= True;
        chbxProducto.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    end;
end;

procedure TwMPlazoRes.ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMPlazoRes.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TwMPlazoRes.chbxProductoClick(Sender: TObject);
begin
    If not chbxProducto.Checked Then Begin
        Objeto.Producto.Active:=False;
        chbxProducto.Checked:=False;
        chbxProducto.Enabled:=False;
    End Else Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
    End;
end;

procedure TwMPlazoRes.edCVE_MONEDAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
end;

procedure TwMPlazoRes.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMPlazoRes.chbxMonedaClick(Sender: TObject);
begin
    If not chbxMoneda.Checked Then Begin
        Objeto.Moneda.Active := False;
        chbxMoneda.Checked   := False;
        chbxMoneda.Enabled   := False;
        //
        if ( Objeto.SUB_TIPO_REP.AsString = coUDIS ) or
           ( Objeto.SUB_TIPO_REP.AsString = coDLLS ) then
        Begin
          Objeto.SUB_TIPO_REP.AsString := coPlazo;
          Objeto.SUB_TIPO_REP.DrawControl;
        End;
        //
    End Else Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
    End;
end;

procedure TwMPlazoRes.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMPlazoRes.ilMONEDAEjecuta(Sender: TObject);
begin
  MonedaEjecuta( ilMONEDA.Buffer, True );
  {
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
  }    
end;

procedure TwMPlazoRes.btCVE_FND_ENT_DESClick(Sender: TObject);
begin
   Objeto.MInstDesc.ShowAll := True;
   If Objeto.MInstDesc.Busca Then Begin
      cbxCVE_FND_ENT_DES.Checked:=True;
      cbxCVE_FND_ENT_DES.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TwMPlazoRes.edCVE_FND_ENT_DESExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_FND_ENT_DES,True,'',True);
end;

procedure TwMPlazoRes.ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMPlazoRes.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   If Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) Then Begin
      cbxCVE_FND_ENT_DES.Checked:=True;
      cbxCVE_FND_ENT_DES.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TwMPlazoRes.cbxCVE_FND_ENT_DESClick(Sender: TObject);
begin
   If not cbxCVE_FND_ENT_DES.Checked Then Begin
      Objeto.MInstDesc.Active:=False;
      cbxCVE_FND_ENT_DES.Checked:=False;
      cbxCVE_FND_ENT_DES.Enabled:=False;
   End Else Begin
      cbxCVE_FND_ENT_DES.Checked:=True;
      cbxCVE_FND_ENT_DES.Enabled:=True;
   End;
end;


procedure TwMPlazoRes.edCVE_FND_PROGRAMAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_FND_PROGRAMA,True,'',True);
end;

procedure TwMPlazoRes.btCVE_FND_PROGRAMAClick(Sender: TObject);
begin
   If Trim(edCVE_FND_ENT_DES.Text)<>'' Then Begin
      Objeto.MPrgApoyo.BuscaWhereString :=
            'CR_FND_PROGRAMA.CVE_FND_ENT_DES =' + #39 + Trim(edCVE_FND_ENT_DES.Text)+ #39;
   End Else Begin
      Objeto.MPrgApoyo.BuscaWhereString:= '';
   End;
   Objeto.MPrgApoyo.FilterString := Objeto.MPrgApoyo.BuscaWhereString;
   Objeto.MPrgApoyo.ShowAll := True;
   If Objeto.MPrgApoyo.Busca Then Begin
      cbxCVE_FND_PROGRAMA.Checked:=True;
      cbxCVE_FND_PROGRAMA.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_PROGRAMA);
   End;
end;

procedure TwMPlazoRes.ilCVE_FND_PROGRAMACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMPlazoRes.ilCVE_FND_PROGRAMAEjecuta(Sender: TObject);
begin
   If Objeto.MPrgApoyo.FindKey([Trim(edCVE_FND_ENT_DES.Text),
                                 ilCVE_FND_PROGRAMA.Buffer]) Then Begin
      cbxCVE_FND_PROGRAMA.Checked:=True;
      cbxCVE_FND_PROGRAMA.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_PROGRAMA);
   End;
end;

procedure TwMPlazoRes.cbxCVE_FND_PROGRAMAClick(Sender: TObject);
begin
   If not cbxCVE_FND_PROGRAMA.Checked Then Begin
      Objeto.MPrgApoyo.Active:=False;
      cbxCVE_FND_PROGRAMA.Checked:=False;
      cbxCVE_FND_PROGRAMA.Enabled:=False;
   End Else Begin
      cbxCVE_FND_PROGRAMA.Checked:=True;
      cbxCVE_FND_PROGRAMA.Enabled:=True;
   End;
end;

procedure TwMPlazoRes.rgTIPO_REPORTEClick(Sender: TObject);
begin
  if Objeto.PzoRes.Active then
     Objeto.PzoRes.Active := False;
end;

procedure TwMPlazoRes.rgSUB_TIPO_REPClick(Sender: TObject);
begin
  if Objeto.PzoRes.Active then
     Objeto.PzoRes.Active := False;
  //
  Objeto.SUB_TIPO_REP.GetFromControl;
  //
  {
  IF Objeto.SUB_TIPO_REP.AsString = coUDIS then
  Begin
    MonedaEjecuta( IntToStr(coPESO), False );
  End;
  //
  IF Objeto.SUB_TIPO_REP.AsString = coDLLS then
  Begin
    MonedaEjecuta( IntToStr(coDOLAR), False );
  End;//
  }
end;

procedure TwMPlazoRes.edVALOR_FILTROExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edVALOR_FILTRO,True,'',True);
end;

procedure TwMPlazoRes.SetFiltroPzoRes;
var sBusca : String;
begin
  //
  Objeto.TIPO_REPORTE.GetFromControl;
  Objeto.SUB_TIPO_REP.GetFromControl;
  //
  sBusca := 'CR_GRUPO_CLAVE.CVE_GRUPO_CLAVE = ''NINGUNO'' ';
  if Objeto.TIPO_REPORTE.AsString = coFndVig then
  begin
    //
    if Objeto.SUB_TIPO_REP.AsString = coPlazo then
       sBusca := 'CR_GRUPO_CLAVE.CVE_GRUPO_CLAVE = ''PRFNDI'' '
    else if Objeto.SUB_TIPO_REP.AsString = coUDIS then
       sBusca := 'CR_GRUPO_CLAVE.CVE_GRUPO_CLAVE = ''PRFNMU'' '
    else if Objeto.SUB_TIPO_REP.AsString = coDLLS then
       sBusca := 'CR_GRUPO_CLAVE.CVE_GRUPO_CLAVE = ''PRFNMD'' '
    //
  end else if Objeto.TIPO_REPORTE.AsString = coVigAct then
  begin
    if Objeto.SUB_TIPO_REP.AsString = coPlazo then
       sBusca := 'CR_GRUPO_CLAVE.CVE_GRUPO_CLAVE = ''PRVGDI'' '
    else if Objeto.SUB_TIPO_REP.AsString = coUDIS then
       sBusca := 'CR_GRUPO_CLAVE.CVE_GRUPO_CLAVE = ''PRVGMU'' '
    else if Objeto.SUB_TIPO_REP.AsString = coDLLS then
       sBusca := 'CR_GRUPO_CLAVE.CVE_GRUPO_CLAVE = ''PRVGMD'' '
    //
  end else if Objeto.TIPO_REPORTE.AsString = coVdaAct then
  begin
    if Objeto.SUB_TIPO_REP.AsString = coPlazo then
       sBusca := 'CR_GRUPO_CLAVE.CVE_GRUPO_CLAVE = ''PRVDDI'' '
    else if Objeto.SUB_TIPO_REP.AsString = coUDIS then
       sBusca := 'CR_GRUPO_CLAVE.CVE_GRUPO_CLAVE = ''PRVDMU'' '
    else if Objeto.SUB_TIPO_REP.AsString = coDLLS then
       sBusca := 'CR_GRUPO_CLAVE.CVE_GRUPO_CLAVE = ''PRVDMD'' '
    //
  end;
  //
  Objeto.PzoRes.FilterString     := sBusca;
  Objeto.PzoRes.BuscaWhereString := sBusca;
end;

procedure TwMPlazoRes.btVALOR_FILTROClick(Sender: TObject);
begin
  SetFiltroPzoRes;
  If Objeto.PzoRes.Busca Then
  begin
     cbVALOR_FILTRO.Checked := True; 
     InterForma1.NextTab( btVALOR_FILTRO );
  end;//
end;

procedure TwMPlazoRes.ikVALOR_FILTROCapture(Sender: TObject;  var Show: Boolean);
begin
  Show := True;
end;

procedure TwMPlazoRes.ikVALOR_FILTROEjecuta(Sender: TObject);
begin
  SetFiltroPzoRes;
  cbVALOR_FILTRO.Checked := Objeto.PzoRes.FindKeyNear( [  ikVALOR_FILTRO.Buffer ], [ 'CVE_REFERENCIA' ]);
end;

procedure TwMPlazoRes.cbVALOR_FILTROClick(Sender: TObject);
begin
   If not cbVALOR_FILTRO.Checked Then Begin
      Objeto.PzoRes.Active    := False;
      cbVALOR_FILTRO.Checked  := False;
      cbVALOR_FILTRO.Enabled  := False;
   End Else Begin
      cbVALOR_FILTRO.Checked  := True;
      cbVALOR_FILTRO.Enabled  := True;
   End;
   //
end;
//
procedure TwMPlazoRes.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMPlazoRes.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMPlazoRes.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMPlazoRes.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMPlazoRes.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMPlazoRes.sbExcelClick(Sender: TObject);
var sExt:String;
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

procedure TwMPlazoRes.cbxArchivoClick(Sender: TObject);
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

procedure TwMPlazoRes.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;


Procedure TwMPlazoRes.ImprimeReporte(bPreview:Boolean);
Var
    sSituacion, sGpoProd, sProcam, sOperDD :String;
    iSit, iNafin, iDescDoc: Integer;
    dIntereses : Double;
begin
  Objeto.TIPO_REPORTE.GetFromControl;
  Objeto.SUB_TIPO_REP.GetFromControl;

  if Objeto.TIPO_REPORTE.AsString = '' then
  begin
    ShowMessage( 'Favor de indicar el tipo de reporte' );
    exit;
  end;
  //
  if Objeto.SUB_TIPO_REP.AsString = '' then
  begin
    ShowMessage( 'Favor de indicar el sub tipo de reporte.' );
    exit;
  end;
  //
    RepPlazoResidual(  StrToDate(edF_Inicio.Text),           edCVE_PRODUCTO_GPO.Text,
      edCVE_PRODUCTO_CRE.Text, edCVE_MONEDA.Text,            edCVE_FND_ENT_DES.Text ,
      edCVE_FND_PROGRAMA.Text, Objeto.TIPO_REPORTE.AsString, Objeto.SUB_TIPO_REP.AsString,
      edVALOR_FILTRO.Text,     EdIdEmpresa.Text,             EdIDSucursal.Text,
      edNbrArch.Text,          Objeto.Apli,                  bPreview );
    If Trim(edNbrArch.Text)<>'' Then Begin
         If bGenArch Then
          ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
        Else
           ShowMessage('No se generó el Archivo')
    End;
  //
End;

procedure TwMPlazoRes.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPLAZORES_IMPRI',True,True) then
    ImprimeReporte(False);
end;

procedure TwMPlazoRes.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPLAZORES_PREVI',True,True) then
    ImprimeReporte(True);
end;


end.

