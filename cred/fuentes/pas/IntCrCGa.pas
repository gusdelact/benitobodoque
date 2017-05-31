// Sistema         : Clase de Garantia, Sistema Corporativo de Creditos
// Fecha de Inicio : 2 de Marzo de 1998
// Función forma   : Clase de Garantia
// Desarrollo por  : Benjamín Hernández Delsordo
// Comentarios     : Modificacion del 29 de Julio de 1998, para estar ligada
//                   con las autorizaciones
unit IntCrCGa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, IntCrCon, InterEdit, UnCrPack, IntLinkit,
  IntCrSGa, IntCrMLi, IntCtto, IntMon, IntCreConSeg, Menus, ComCtrls,
  IntDtPk,IntCreGarCnb,
  IntCreLocCnb, //localidad cnbv para el inmueble
  IntCrMunCnb
  ;

type

  TCrCGa = Class;
  TWCrCGa = class(TForm)
    InterForma1: TInterForma;
    rgSituacion: TRadioGroup;
    GroupBox1: TGroupBox;
    edNbrSubTip: TEdit;
    edNbrTipLib: TEdit;
    edNbrMoneda: TEdit;
    sbSubTip: TSpeedButton;
    sbTipLib: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    sbMoneda: TSpeedButton;
    GroupBox2: TGroupBox;
    edNbrCtoRef: TEdit;
    Label4: TLabel;
    sbCtoRef: TSpeedButton;
    InterLinkit1: TInterLinkit;
    edIdCtoRef: TEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edCveUsuAlta: TEdit;
    edCveUsuLibera: TEdit;
    edFAlta: TEdit;
    edFLibera: TEdit;
    GroupBox4: TGroupBox;
    edTxRefGaran: TMemo;
    GroupBox5: TGroupBox;
    edIdContrato: TInterEdit;
    lbIdContrato: TLabel;
    edFolioGarantia: TInterEdit;
    lbFolioGarantia: TLabel;
    GroupBox6: TGroupBox;
    edlugarprefban: TInterEdit;
    lblugarprefban: TLabel;
    GroupBox7: TGroupBox;
    btnCancela: TBitBtn;
    btnLibera: TBitBtn;
    GroupBox8: TGroupBox;
    lbImpGarantia: TLabel;
    edImpGarantia: TInterEdit;
    edDescGarantia: TEdit;
    lbDescGarantia: TLabel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    Catlogo1: TMenuItem;
    Catlogo2: TMenuItem;
    sbSeguro: TSpeedButton;
    edCveSeguro: TEdit;
    Label9: TLabel;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    Label10: TLabel;
    edProporcion: TEdit;
    Label11: TLabel;
    edFValGar: TEdit;
    InterDateTimePicker1: TInterDateTimePicker;
    Label12: TLabel;
    sbGarcnbv: TSpeedButton;
    edGarCNBV: TEdit;
    PopupMenu4: TPopupMenu;
    MenuItem2: TMenuItem;
    GroupBox9: TGroupBox;
    Label13: TLabel;
    edFRevGar: TEdit;
    InterCalPorxRev: TInterDateTimePicker;
    cbTipPeriodicidad: TComboBox;
    Label14: TLabel;
    Label15: TLabel;
    intEDPeriodicidad: TInterEdit;
    ilCVE_LOCAL_CNBV: TInterLinkit;
    GroupBox10: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edCVE_LOCAL_CNBV: TEdit;
    edNO_AVALUO: TEdit;
    btnCVE_LOCAL_CNBV: TBitBtn;
    edIMP_AVALUO: TInterEdit;
    edDESC_LOCAL_CNBV: TEdit;
    Label19: TLabel;
    InterDateTimePicker2: TInterDateTimePicker;
    edFAvaluo: TEdit;
    Label20: TLabel;
    btnCredito: TSpeedButton;
    edID_CREDITO: TEdit;
    Label21: TLabel;
    edCVE_MUNICIPIO: TEdit;
    edDESC_MUNICIPIO: TEdit;
    Label22: TLabel;
    edFOL_REG_GAR: TEdit;
    cbxB_FIDEICOMISO: TCheckBox;
    edFOLIO: TInterEdit;
    BitBtn1: TBitBtn;
    Label23: TLabel;
    cbCVE_LOCAL_EJECUT: TComboBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Nuevo(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Aceptar(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Cancelar(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Eliminar(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Buscar(Sender : TObject);
    procedure InterForma1Modificar(Sender : TObject;
      var Realizado : Boolean);
    procedure InterForma1Ayuda(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btnMunicipioClick(Sender: TObject);
    procedure sbContratoClick(Sender: TObject);
    procedure sbCtoRefClick(Sender: TObject);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    procedure sbSubTipClick(Sender: TObject);
    procedure sbTipLibClick(Sender: TObject);
    procedure sbMonedaClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure btnLiberaClick(Sender: TObject);
    procedure Catlogo1Click(Sender: TObject);
    procedure Catlogo2Click(Sender: TObject);
    procedure sbSeguroClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure sbGarcnbvClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure ilCVE_LOCAL_CNBVEjecuta(Sender: TObject);
    procedure btnCVE_LOCAL_CNBVClick(Sender: TObject);
    procedure btnCreditoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure ListaJurisprudencia;
  public
    { Public declarations }
    Objeto : TCrCGa;
  end;

  TCrCGa = class(TInterFrame)
  private
    FAutorizacion : TInterFrame;
  protected
    procedure SetAutorizacion(Aut : TInterFrame);
  public
    { Public declarations }
   ID_CONTRATO                :TInterCampo;
   FOLIO_GARANTIA             :TInterCampo;
   DESC_GARANTIA              :TInterCampo;
   IMP_GARANTIA               :TInterCampo;
   LUGAR_PREF_BAN             :TInterCampo;
   TX_REF_GARAN               :TInterCampo;
   CVE_SUB_TIP_GAR            :TInterCampo;
   SIT_GARANTIA               :TInterCampo;
   CVE_LIBERACION             :TInterCampo;
   F_LIB_GARANTIA             :TInterCampo;
   CVE_MONEDA                 :TInterCampo;
   CVE_USUAR_ALTA             :TInterCampo;
   CVE_USUAR_LIBER            :TInterCampo;
   ID_CONTRATO_REF            :TInterCampo;
   FOLIO_SEGURO_ACT           :TInterCampo;
   F_VAL_GARANTIA             :TInterCampo;
   CVE_GAR_CNBV               :TInterCampo;
   F_REVISION_FIS             :TInterCampo;
   TIP_PERIOD_REV             :TInterCampo;
   PERIOD_REV                 :TInterCampo;
   CVE_MUNICIPIO              :TInterCampo;
   FOL_REG_GAR                :TInterCampo;
   B_FIDEICOMISO              :TInterCampo;
   CVE_LOCAL_EJECUT              :TInterCampo;


   Paquete                    : TCrPack;
   CtoRef                     : TContrato;
   SubTipGar                  : TCrSGa;
   TipLib                     : TCrMLi;
   Moneda                     : TMoneda;
   Seguro                     : TCreConSeg;
   GarCNBV                    : TCGarCNBV;

    //RIRA4281 23jun2010 se agregan los datos del avaluo

    LocalCNBV          : TCrLocCNBV;
    MunicipioCNBV      : TCrMunCnb;
    CVE_LOCAL_CNBV     : TInterCampo;
    IMP_AVALUO         : TInterCampo;
    NO_AVALUO          : TInterCampo;
    ID_CREDITO         : TInterCampo;
    F_AVALUO           : TInterCampo;

   function    InternalBusca : Boolean; override;
   constructor Create( AOwner : TComponent ); override;
   destructor  Destroy; override;
   function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
//    function    Reporte:Boolean; override;
//    procedure   DatabaseChange; override;
  published
    property Autorizacion : TInterFrame read FAutorizacion write SetAutorizacion;
  end;

implementation

{$R *.DFM}

constructor TCrCGa.Create( AOwner : TComponent );
begin
   Inherited Create(AOwner);
   ID_CONTRATO                :=CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,True);
   FOLIO_GARANTIA             :=CreaCampo('FOLIO_GARANTIA',ftInteger,tsNinguno,tsNinguno,True);
   DESC_GARANTIA              :=CreaCampo('DESC_GARANTIA',ftString,tsNinguno,tsNinguno,True);
   IMP_GARANTIA               :=CreaCampo('IMP_GARANTIA',ftFloat,tsNinguno,tsNinguno,True);
   LUGAR_PREF_BAN             :=CreaCampo('LUGAR_PREF_BAN',ftInteger,tsNinguno,tsNinguno,True);
   TX_REF_GARAN               :=CreaCampo('TX_REF_GARAN',ftString,tsNinguno,tsNinguno,True);

   CVE_SUB_TIP_GAR            :=CreaCampo('CVE_SUB_TIP_GAR',ftString,tsNinguno,tsNinguno,True);
         CVE_SUB_TIP_GAR.Size:=8;
   SIT_GARANTIA               :=CreaCampo('SIT_GARANTIA',ftString,tsNinguno,tsNinguno,True);
         SIT_GARANTIA.Size:=2;
         SIT_GARANTIA.UseCombo := True;
         SIT_GARANTIA.ComboLista.Add('0');  SIT_GARANTIA.ComboDatos.Add('AC');
         SIT_GARANTIA.ComboLista.Add('1');  SIT_GARANTIA.ComboDatos.Add('CA');
         SIT_GARANTIA.ComboLista.Add('2');  SIT_GARANTIA.ComboDatos.Add('LI');
   CVE_LIBERACION:=CreaCampo('CVE_LIBERACION',ftString,tsNinguno,tsNinguno,True);
         CVE_LIBERACION.Size:=8;
   F_LIB_GARANTIA:=CreaCampo('F_LIB_GARANTIA',ftDateTime,tsNinguno,tsNinguno,True);

   CVE_MONEDA:=CreaCampo('CVE_MONEDA',ftInteger,tsNinguno,tsNinguno,True);
   CVE_USUAR_ALTA:=CreaCampo('CVE_USUAR_ALTA',ftString,tsNinguno,tsNinguno,True);
         CVE_USUAR_ALTA.Size:=8;
   CVE_USUAR_LIBER:=CreaCampo('CVE_USUAR_LIBER',ftString,tsNinguno,tsNinguno,True);
         CVE_USUAR_LIBER.Size:=8;
   ID_CONTRATO_REF:=CreaCampo('ID_CONTRATO_REF',ftInteger,tsNinguno,tsNinguno,True);
   FOLIO_SEGURO_ACT := CreaCampo('FOLIO_SEGURO_ACT',ftInteger,tsNinguno,tsNinguno,True);
   F_VAL_GARANTIA := CreaCampo('F_VAL_GARANTIA',ftDateTime,tsNinguno,tsNinguno,True);
   CVE_GAR_CNBV:=CreaCampo('CVE_GAR_CNBV',ftInteger,tsNinguno,tsNinguno,True);

   F_REVISION_FIS := CreaCampo('F_REVISION_FIS',ftDateTime,tsNinguno,tsNinguno,True);
   TIP_PERIOD_REV:=  CreaCampo('TIP_PERIOD_REV',ftString,tsNinguno,tsNinguno,True);
   with TIP_PERIOD_REV do
     begin
       UseCombo:=True;
       ComboLista.Add('Dias');  ComboDatos.Add('D');
       ComboLista.Add('Semanas');  ComboDatos.Add('S');
       ComboLista.Add('Meses');  ComboDatos.Add('M');
     end;
   PERIOD_REV:=CreaCampo('PERIOD_REV',ftInteger,tsNinguno,tsNinguno,True);

    //RIRA4281 23jun2010 se dan de alta los datos del avaluo
    CVE_LOCAL_CNBV :=CreaCampo('CVE_LOCAL_CNBV',ftString,tsNinguno,tsNinguno,True);
              CVE_LOCAL_CNBV.Caption:='Localidad del avaluo';
    CVE_MUNICIPIO :=CreaCampo('CVE_MUNICIPIO',ftString,tsNinguno,tsNinguno,True);
              CVE_MUNICIPIO.Caption:='Clave de Municipio';
    //RUCJ4248: 
    CVE_LOCAL_EJECUT :=CreaCampo('CVE_LOCAL_EJECUT',ftString,tsNinguno,tsNinguno,True);
    CVE_LOCAL_EJECUT.Caption:='Localidad de Ejecutablilidad';
    IMP_AVALUO :=CreaCampo('IMP_AVALUO',ftfloat,tsNinguno,tsNinguno,True);
              IMP_AVALUO.Caption:='Importe Avaluo';
    NO_AVALUO :=CreaCampo('NO_AVALUO',ftString,tsNinguno,tsNinguno,True);
              NO_AVALUO.Caption:='Numero Avaluo';

    {$WARNINGS OFF}
    LocalCNBV := TCrLocCNBV.Create(Self);
    MunicipioCNBV := TCrMunCnb.Create(Self);
    {$WARNINGS ON}
    LocalCNBV.MasterSource:= Self;
    LocalCNBV.FieldByName('CVE_LOCAL_CNBV').MasterField:= 'CVE_LOCAL_CNBV';
    MunicipioCNBV.MasterSource:= Self;
    MunicipioCNBV.FieldByName('CVE_MUNICIPIO').MasterField:= 'CVE_MUNICIPIO';

    ID_CREDITO :=  CreaCampo('ID_CREDITO',ftfloat,tsNinguno,tsNinguno,True);
        ID_CREDITO.Caption:='Id Credito';

     F_AVALUO := CreaCampo('F_AVALUO',ftDate,tsNinguno,tsNinguno,True);
         F_AVALUO.Caption:='Fecha Avaluo';

   FOL_REG_GAR := CreaCampo('FOL_REG_GAR',ftString,tsNinguno,tsNinguno,True);
      FOL_REG_GAR.Caption := 'Registro Único de G.';
   B_FIDEICOMISO :=CreaCampo('B_FIDEICOMISO',ftString,tsNinguno,tsNinguno,True);
      B_FIDEICOMISO.Caption:='Cuenta con Fideicomiso';

    //RIRA4281 23jun2010


   TableName := 'CRE_CONT_GARANT';
   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('FOLIO_GARANTIA');
   UseQuery := True;
   HelpFile := 'IntCGa.hlp';
   ShowMenuReporte := True;

   Paquete := TCrPack.Create(Self);

   CtoRef:= TContrato.Create(Self);
   CtoRef.MasterSource := Self;
   CtoRef.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO_REF';

   Moneda:= TMoneda.Create(Self);
   Moneda.MasterSource := Self;
   Moneda.FieldByName('CVE_MONEDA').MasterField := 'CVE_MONEDA';

   SubTipGar:= TCrSGa.Create(Self);
   SubTipGar.MasterSource:=Self;
   SubTipGar.FieldByName('CVE_SUB_TIP_GAR').MasterField := 'CVE_SUB_TIP_GAR';

   TipLib:= TCrMLi.Create(Self);
   TipLib.MasterSource:=Self;
   TipLib.FieldByName('CVE_LIBERACION').MasterField := 'CVE_LIBERACION';

   GarCNBV:= TCGarCNBV.Create(Self);
   GarCNBV.MasterSource:=Self;
   GarCNBV.FieldByName('CVE_GAR_CNBV').MasterField := 'CVE_GAR_CNBV';


end;


{procedure TCRCGa.DataBaseChange;
begin
   //Paquete.Apli := Apli;
   //Seguro.GetParams(self);
end;
 }
destructor TCrCGa.Destroy;
begin
//   if ContratoCred <> nil then ContratoCred.free;
  if Paquete <> nil then Paquete.Free;
  if CtoRef <> nil then CtoRef.Free;
  if SubTipGar<> nil then SubTipGar.Free;
  if TipLib <> nil then TipLib.Free;
  if Moneda <> nil then Moneda.Free;

  if GARCNBV <> nil then GARCNBV.Free;
  if LocalCNBV <> nil then LocalCNBV.free;
  if MunicipioCNBV <> nil then MunicipioCNBV.free;


  inherited;
end;

function TCrCGa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCGa;
begin
   W:=TWCrCGa.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TCrCGa.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('InTCrCGa.it','I,I');
   if Autorizacion <> nil then
     T.WhereString := '(CONTRATO.ID_CONTRATO = '+ Autorizacion.FieldByName('ID_CONTRATO').AsSQL + ')';
   try
     if Active then
       begin
         T.Param(0,id_contrato.AsString);
         T.Param(1,folio_garantia.AsString);
       end;
     if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      {end-if}
   finally
     T.Free;
   end;
end;

procedure TCrCGa.SetAutorizacion(Aut:TInterFrame);
begin
  FAutorizacion := Aut;
  if Aut = nil then
    Active := False
  else
    begin DrawControl;
    end;
end;

//function TCrCGa.Reporte:Boolean;
//begin
//end;

(***********************************************FORMA TEMPLATE*******************)

procedure TWCrCGa.FormShow(Sender: TObject);
begin
   if Objeto.Autorizacion <> nil then
       edProporcion.Text:=Objeto.Autorizacion.FieldByName('FACT_PROPOR_GAR').AsString+' a 1';
   Objeto.ID_CONTRATO.Control := edIdContrato;
   Objeto.FOLIO_GARANTIA.Control := edFolioGarantia;
   Objeto.DESC_GARANTIA.Control := edDescGarantia;
   Objeto.IMP_GARANTIA.Control := edImpGarantia;
   Objeto.LUGAR_PREF_BAN.Control := edLugarPrefBan;
   Objeto.TX_REF_GARAN.Control := edTxRefGaran;

   Objeto.SIT_GARANTIA.Control := rgSituacion;
   Objeto.F_LIB_GARANTIA.Control := edFLibera;
   Objeto.CVE_USUAR_ALTA.Control := edCveUsuAlta;
   Objeto.CVE_USUAR_LIBER.Control := edCveUsuLibera;
   Objeto.FOLIO_SEGURO_ACT.Control := edCveSeguro;

   Objeto.SubTipGar.DESC_SUB_TIP_GAR.Control := edNbrSubTip;
   Objeto.SubTipGar.MasterSourceEditControl := sbSubTip;

   Objeto.CtoRef.ID_Contrato.Control     := edIdCtoRef;
   Objeto.CtoRef.Titular.Nombre.Control  := edNbrCtoRef;
   Objeto.CtoRef.MasterSourceEditControl := sbCtoRef;

   Objeto.TipLib.DESC_LIBERACION.Control := edNbrTipLib;
   Objeto.TipLib.MasterSourceEditControl := sbTipLib;

   Objeto.Moneda.Desc_Moneda.Control     := edNbrMoneda;
   Objeto.Moneda.MasterSourceEditControl := sbMoneda;
   Objeto.F_VAL_GARANTIA.Control         := edFValGar;

   Objeto.GARCNBV.DESC_GAR_CNBV.Control   := edGarCNBV;
   Objeto.GARCNBV.MasterSourceEditControl := sbGarcnbv;
   Objeto.F_REVISION_FIS.Control          := edFRevGar;
   Objeto.TIP_PERIOD_REV.Control          := cbTipPeriodicidad;
   Objeto.PERIOD_REV.Control              := intEDPeriodicidad;

   //RIRA4281 23jun2010 se agregan los campos del avaluo
   Objeto.CVE_LOCAL_CNBV.Control:=edCVE_LOCAL_CNBV;
   Objeto.CVE_LOCAL_EJECUT.control := cbCVE_LOCAL_EJECUT;
   Objeto.CVE_MUNICIPIO.Control       := edFOLIO;
   Objeto.IMP_AVALUO.Control := edIMP_AVALUO;
   Objeto.NO_AVALUO.Control := edNO_AVALUO;

   objeto.FOL_REG_GAR.Control := edFOL_REG_GAR;
   objeto.B_FIDEICOMISO.Control := cbxB_FIDEICOMISO;

   Objeto.LocalCNBV.CVE_LOCAL_CNBV.Control := edCVE_LOCAL_CNBV;
   Objeto.LocalCNBV.DESC_LOCAL_CNBV.Control := edDESC_LOCAL_CNBV;
   Objeto.LocalCNBV.GetParams(Objeto);

   Objeto.ID_CREDITO.Control := edID_CREDITO;
   Objeto.F_AVALUO.Control   := edFAvaluo;

   ListaJurisprudencia;
end;

procedure TWCrCGa.FormDestroy(Sender: TObject);
begin
   Objeto.ID_CONTRATO.Control           := nil;
   Objeto.FOLIO_GARANTIA.Control        := nil;
   Objeto.DESC_GARANTIA.Control         := nil;
   Objeto.IMP_GARANTIA.Control          := nil;
   Objeto.LUGAR_PREF_BAN.Control        := nil;
   Objeto.TX_REF_GARAN.Control          := nil;

   Objeto.SIT_GARANTIA.Control          := nil;
   Objeto.F_LIB_GARANTIA.Control        := nil;
   Objeto.CVE_USUAR_ALTA.Control        := nil;
   Objeto.CVE_USUAR_LIBER.Control       := nil;
   Objeto.FOLIO_SEGURO_ACT.Control      := nil;

   Objeto.SubTipGar.DESC_SUB_TIP_GAR.Control := nil;
   Objeto.SubTipGar.MasterSourceEditControl  := nil;

   Objeto.CtoRef.ID_Contrato.Control     := nil;
   Objeto.CtoRef.Titular.Nombre.Control  := nil;
   Objeto.CtoRef.MasterSourceEditControl := nil;

   Objeto.TipLib.DESC_LIBERACION.Control := nil;
   Objeto.TipLib.MasterSourceEditControl := nil;

   Objeto.Moneda.Desc_Moneda.Control     := nil;
   Objeto.Moneda.MasterSourceEditControl := nil;

   Objeto.F_VAL_GARANTIA.Control         := nil;

   Objeto.GARCNBV.DESC_GAR_CNBV.Control   := NIL;
   Objeto.GARCNBV.MasterSourceEditControl := NIL;

   Objeto.F_REVISION_FIS.Control          := nil;
   Objeto.TIP_PERIOD_REV.Control          := nil;
   Objeto.PERIOD_REV.Control              := nil;

   Objeto.CVE_LOCAL_CNBV.Control := nil;
   Objeto.CVE_MUNICIPIO.Control  := nil;
   objeto.FOL_REG_GAR.Control := nil;
   objeto.B_FIDEICOMISO.Control := nil;
   Objeto.LocalCNBV.CVE_LOCAL_CNBV.Control := nil;
   Objeto.LocalCNBV.DESC_LOCAL_CNBV.Control := nil;
   Objeto.CVE_LOCAL_EJECUT.Control := nil;
   Objeto.IMP_AVALUO.Control := nil;
   Objeto.NO_AVALUO.Control := nil;
   Objeto.ID_CREDITO.Control:= nil;
   Objeto.F_AVALUO.Control  := nil;

end;

procedure TWCrCGa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrCGa.InterForma1Nuevo(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Append;
   Realizado := True;

   Objeto.SIT_GARANTIA.AsString := 'AC';
   Objeto.CVE_USUAR_ALTA.AsString := Objeto.Apli.Usuario;

end;

procedure TWCrCGa.InterForma1Aceptar(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Post;
   Realizado := True;
//   edCveSeguro.ReadOnly:=True;
   btnCancela.Enabled := False;
   btnLibera.Enabled  := False;

end;

procedure TWCrCGa.InterForma1Cancelar(Sender: TObject; var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Cancel;
   Realizado := True;
//   edCveSeguro.ReadOnly:=True;
   btnCancela.Enabled := False;
   btnLibera.Enabled  := False;
end;

procedure TWCrCGa.InterForma1Eliminar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado:=False;
   Objeto.Delete;
   Realizado:=True;
end;

procedure TWCrCGa.InterForma1Buscar(Sender: TObject);
begin
   Objeto.Busca;
end;

procedure TWCrCGa.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin
  Realizado := False;
  Objeto.Edit;
  Realizado := True;

  if Objeto.SIT_GARANTIA.AsString = '' then
    Objeto.SIT_GARANTIA.AsString := 'AC';

  btnCancela.Enabled := True;
  btnLibera.Enabled  := True;


end;

procedure TWCrCGa.InterForma1Ayuda(Sender: TObject);
begin
   Objeto.Help;
end;

procedure TWCrCGa.InterForma1DespuesNuevo(Sender: TObject);
begin
  if Objeto.Autorizacion <> nil then
    begin edIdContrato.Text := Objeto.Autorizacion.FieldByName('ID_CONTRATO').AsSQL;
    end;
  Objeto.Paquete.Apli := Objeto.Apli;
  Objeto.FOLIO_GARANTIA.AsInteger := Objeto.Paquete.DameFolio(foGarantia);
  Objeto.IMP_GARANTIA.AsFloat:=0.00;
  Objeto.CVE_MONEDA.AsString:='484';
  Objeto.Moneda.FindKey([484]);
  //Objeto.F_REVISION_FIS.AsString := DateTimeToString(Objeto.Apli.DameFechaEmpresa);
  InterCalPorxRev.Date := Objeto.Apli.DameFechaEmpresa;


  Objeto.TIP_PERIOD_REV.AsString:='M';
  Objeto.PERIOD_REV.AsInteger:=1;

  sbseguro.enabled:=False;
  edImpGarantia.SetFocus;

end;

procedure TWCrCGa.InterForma1DespuesModificar(Sender: TObject);
begin
{   if objeto.SIT_GARANTIA.AsString<>'AC' then
      edCveSeguro.ReadOnly:=True
   else
      edCveSeguro.ReadOnly:=False;
 }
   edimpgarantia.SetFocus;
end;

procedure TWCrCGa.btnMunicipioClick(Sender: TObject);
begin
   Objeto.Reporte;
end;

procedure TWCrCGa.sbContratoClick(Sender: TObject);
begin
//  Objeto.ContratoCred.Busca;
end;

procedure TWCrCGa.sbCtoRefClick(Sender: TObject);
begin
  Objeto.CtoRef.Busca;
end;

procedure TWCrCGa.InterLinkit1Ejecuta(Sender: TObject);
begin
  if Objeto.CtoRef.FindKey([InterLinkit1.Buffer]) then
  begin
    edNbrCtoRef.Text := Objeto.CtoRef.TITNOMBRE.AsString;
  end;
end;

procedure TWCrCGa.sbSubTipClick(Sender: TObject);
begin
  Objeto.SubTipGar.Busca;
end;

procedure TWCrCGa.sbTipLibClick(Sender: TObject);
begin
  Objeto.TipLib.Busca;
end;

procedure TWCrCGa.sbMonedaClick(Sender: TObject);
begin
  Objeto.Moneda.Busca;
end;

procedure TWCrCGa.btnCancelaClick(Sender: TObject);
begin
  if Objeto.SIT_GARANTIA.AsString <> 'AC' then
    ShowMessage('La garantía no puede ser cancelada, ya que está Liberada o cancelada previamente')
  else
    Objeto.SIT_GARANTIA.AsString := 'CA';
end;

procedure TWCrCGa.btnLiberaClick(Sender: TObject);
begin
  if Objeto.SIT_GARANTIA.AsString <> 'AC' then
    ShowMessage('La garantía no puede ser liberada, ya que está cancelada o liberada previamente')
  else
  begin
    Objeto.SIT_GARANTIA.AsString := 'LI';
    Objeto.CVE_USUAR_LIBER.AsString := Objeto.Apli.Usuario;
    Objeto.F_LIB_GARANTIA.AsDateTime := Objeto.Apli.DameFechaEmpresa
  end;
end;

procedure TWCrCGa.Catlogo1Click(Sender: TObject);
begin
   Objeto.SubTipGar.Catalogo;
end;

procedure TWCrCGa.Catlogo2Click(Sender: TObject);
begin
  Objeto.TipLib.Catalogo;
end;

procedure TWCrCGa.sbSeguroClick(Sender: TObject);
var
   Q : TQuery;
begin
      if Objeto.Active then
      begin
        if Objeto.SubTipGar.FieldByName('B_SEGURO').AsString='V' then
           Begin
              Objeto.Seguro:= TCreConSeg.Create(Self);
              Objeto.Seguro.FieldByName('FOLIO_GARANTIA').MasterField := 'FOLIO_GARANTIA';

              Objeto.Seguro.GetParams(Objeto);
              Objeto.Seguro.Autorizacion := Objeto;
              Objeto.Seguro.BuscaWhereString := '(cre_cont_seguro.sit_seguro=''AC'' and CRE_CONT_SEGURO.FOLIO_GARANTIA =' + Objeto.FOLIO_GARANTIA.AsString + ')';
              Q := GetSQLQuery('SELECT * FROM CRE_CONT_SEGURO WHERE cre_cont_seguro.sit_seguro=''AC'' and FOLIO_GARANTIA = ' + Objeto.FOLIO_GARANTIA.AsString, Objeto.DataBaseName, Objeto.SessionName,false);
              if Q <> nil then
              begin
                try Objeto.Seguro.FindKey([Q.FieldByName('FOLIO_GARANTIA').AsInteger,Q.FieldByName('FOLIO_SEGURO').AsInteger]);
                finally Q.Free;
                end;
              end;
              Objeto.Seguro.Busca;

              if Objeto.SIT_GARANTIA.AsString <> 'AC' then
                     ShowMessage('No se pueden asignar seguros a ésta garantía ya que está liberada o cancelada previamente')
              else
                     Objeto.FOLIO_SEGURO_ACT.AsString:=Objeto.Seguro.FOLIO_SEGURO.AsString;

              if Objeto.Seguro <> nil then Objeto.Seguro.Free;
           end
           else
              ShowMessage('El subtipo de garantía asociada no acepta control de seguros.');
      end
      else
      begin raise EInterFrame.Create('No existe una garantía de crédito activa');
      end;



end;

procedure TWCrCGa.MenuItem1Click(Sender: TObject);
var
  Q : TQuery;
begin
    if Objeto.Active then
    begin
      if Objeto.SubTipGar.FieldByName('B_SEGURO').AsString='V' then
         Begin
            Objeto.Seguro:= TCreConSeg.Create(Self);
            Objeto.Seguro.FieldByName('FOLIO_GARANTIA').MasterField := 'FOLIO_GARANTIA';

            Objeto.Seguro.GetParams(Objeto);
            Objeto.Seguro.Autorizacion := Objeto;
            Objeto.Seguro.BuscaWhereString := '(CRE_CONT_SEGURO.FOLIO_GARANTIA =' + Objeto.FOLIO_GARANTIA.AsString + ')';
            Q := GetSQLQuery('SELECT * FROM CRE_CONT_SEGURO WHERE FOLIO_GARANTIA = ' + Objeto.FOLIO_GARANTIA.AsString, Objeto.DataBaseName, Objeto.SessionName,false);
            if Q <> nil then
            begin
              try Objeto.Seguro.FindKey([Q.FieldByName('FOLIO_GARANTIA').AsInteger,Q.FieldByName('FOLIO_SEGURO').AsInteger]);
              finally Q.Free;
              end;
            end;
            Objeto.Seguro.Catalogo;

            if Objeto.SIT_GARANTIA.AsString <> 'AC' then
                  ShowMessage('No se pueden asignar seguros a ésta garantía ya que está Liberada o cancelada previamente')
            else
            Begin
                  if Objeto.Seguro.SIT_SEGURO.AsString='AC' then
                      Objeto.FOLIO_SEGURO_ACT.AsString:=Objeto.Seguro.FOLIO_SEGURO.AsString;
            end;
            if Objeto.Seguro <> nil then Objeto.Seguro.Free;
        end
        else
            ShowMessage('El subtipo de garantía asociada no acepta control de seguros.');
    end
    else
    begin raise EInterFrame.Create('No existe una garantía de crédito activa');
    end;
end;

procedure TWCrCGa.sbGarcnbvClick(Sender: TObject);
begin
   Objeto.GARCNBV.Busca;
end;

procedure TWCrCGa.MenuItem2Click(Sender: TObject);
begin
      Objeto.GARCNBV.cATALOGO;
end;

procedure TWCrCGa.ilCVE_LOCAL_CNBVEjecuta(Sender: TObject);
begin
 if Objeto.LocalCNBV.FindKey([ilCVE_LOCAL_CNBV.Buffer]) then
   InterForma1.NextTab(edCVE_LOCAL_CNBV);

end;

procedure TWCrCGa.btnCVE_LOCAL_CNBVClick(Sender: TObject);
begin
   Objeto.LocalCNBV.ShowAll := True;
   if Objeto.LocalCNBV.Busca then
   Begin
      InterForma1.NextTab(edCVE_LOCAL_CNBV);
   end;

end;

procedure TWCrCGa.btnCreditoClick(Sender: TObject);
var
  T:TInterFindit;
begin
  try
        T := Objeto.CreaBuscador('IntCrCre.it','I');
        T.WhereString := '';
        if Active then
        begin
                T.Param(0,Objeto.ID_CREDITO.AsString);
        end;
        if T.Execute then
        begin
        Objeto.ID_CREDITO.AsString := T.DameCampo(0);
        end;
  finally
    T.Free;
  end;
end;

procedure TWCrCGa.BitBtn1Click(Sender: TObject);
begin
  if Objeto.MunicipioCNBV.Busca then
  begin
    edFOLIO.Text := Objeto.MunicipioCNBV.FOLIO.AsString;
    edCVE_MUNICIPIO.Text := Objeto.MunicipioCNBV.CVE_MUNICIPIO.asString;
    edDESC_MUNICIPIO.Text := Objeto.MunicipioCNBV.NOM_MUNICIPIO.asString + ';' +
          Objeto.MunicipioCNBV.COL_MINUCIPIO.asString;
    InterForma1.NextTab(edCVE_MUNICIPIO);
  end;
end;

procedure TWCrCGa.FormActivate(Sender: TObject);
begin
  Objeto.MunicipioCNBV.FindKey([edFolio.text]);
  edCVE_MUNICIPIO.Text := Objeto.MunicipioCNBV.CVE_MUNICIPIO.asString;
  edDESC_MUNICIPIO.Text := Objeto.MunicipioCNBV.NOM_MUNICIPIO.asString + ';' +
      Objeto.MunicipioCNBV.COL_MINUCIPIO.asString;
end;

procedure TWCrCGa.ListaJurisprudencia;
const strJurrisprud= 'select (CVE_ESTADO || chr(59) || DESC_ESTADO) as Jurisprud from ADMIPROD.bc_estado';
var
  strQuery       : TQuery;
Begin
   cbCVE_LOCAL_EJECUT.Items.Clear;
   strQuery := TQuery.Create(Self);
   Try
       strQuery.SessionName := Objeto.SessionName;
       strQuery.DataBaseName := Objeto.DataBaseName;
       strQuery.SQL.Clear;
       strQuery.SQL.Add(strJurrisprud);
       strQuery.Open;

       While Not strQuery.Eof Do
         Begin
            cbCVE_LOCAL_EJECUT.Items.Add(strQuery.FieldByName('Jurisprud').AsString);
            strQuery.Next;
         End;
   Finally
     If Assigned(strQuery) Then
      Begin
         strQuery.Close;
         strQuery.Free;
      End;
   End;
end;

end.



