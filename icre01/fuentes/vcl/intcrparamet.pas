// Sistema         : Clase de CR_PARAMETRO
// Fecha de Inicio : 07/11/2003
// Función forma   : Clase de CR_PARAMETRO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrParamet;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

//Clases Adicionales
        IntParamCre,  //Parametros
        IntCrConcept,  //conceptos
        IntCrOperaci,
        IntMon,        //Moneda;
        IntGenCre,
        InterEdit;

Type
 TCrParamet= class; 

  TWCrParametro=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_PARAMETRO : TLabel; 
    edCVE_PARAMETRO : TEdit;
    lbCVE_MON_BASE_ACR : TLabel; 
    edCVE_MON_BASE_ACR : TEdit;
    gpCvesOperacion: TGroupBox;
    GroupBox1: TGroupBox;
    lbCVE_OPE_PAG_CN: TLabel;
    edCVE_OPE_PAG_CN: TEdit;
    lbCVE_OPE_PAG_IN: TLabel;
    lbCVE_OPE_PAG_CP: TLabel;
    edCVE_OPE_PAG_CP: TEdit;
    edCVE_OPE_PAG_IN: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    lbCVE_OPE_MOR_CN: TLabel;
    lbCVE_OPE_MOR_IN: TLabel;
    lbCVE_OPE_MOR_CP: TLabel;
    edCVE_OPE_MOR_CP: TEdit;
    edCVE_OPE_MOR_IN: TEdit;
    edCVE_OPE_MOR_CN: TEdit;
    lbCVE_CON_MOR_CN: TLabel;
    lbCVE_CON_MOR_IN: TLabel;
    lbCVE_CON_MOR_CP: TLabel;
    edCVE_CON_MOR_CP: TEdit;
    edCVE_CON_MOR_IN: TEdit;
    edCVE_CON_MOR_CN: TEdit;
    GroupBox4: TGroupBox;
    lbCVE_RET_EMISOR: TLabel;
    lbCVE_DEP_PROV: TLabel;
    edCVE_DEP_PROV: TEdit;
    edCVE_RET_EMISOR: TEdit;
    rgSIT_ACC_SEGMTO: TRadioGroup;
    lbCVE_SEGUIMIENTO: TLabel;
    edCVE_SEGUIMIENTO: TEdit;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    GroupBox5: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIF: TEdit;
    edCVE_USUA_ALTA: TEdit;
    edCVE_USUA_MODIF: TEdit;
    btCVE_OPE_PAG_CN: TBitBtn;
    btCVE_OPE_PAG_CP: TBitBtn;
    btCVE_OPE_PAG_IN: TBitBtn;
    btCVE_OPE_MOR_CN: TBitBtn;
    btCVE_OPE_MOR_IN: TBitBtn;
    btCVE_OPE_MOR_CP: TBitBtn;
    btCVE_CON_MOR_CN: TBitBtn;
    btCVE_CON_MOR_IN: TBitBtn;
    btCVE_CON_MOR_CP: TBitBtn;
    btCVE_RET_EMISOR: TBitBtn;
    btCVE_DEP_PROV: TBitBtn;
    ilCVE_OPE_MOR_CN: TInterLinkit;
    ilCVE_OPE_MOR_IN: TInterLinkit;
    ilCVE_OPE_MOR_CP: TInterLinkit;
    ilCVE_RET_EMISOR: TInterLinkit;
    ilCVE_DEP_PROV: TInterLinkit;
    ilMONEDA: TInterLinkit;
    ilCVE_CON_MOR_CN: TInterLinkit;
    ilCVE_CON_MOR_IN: TInterLinkit;
    ilCVE_CON_MOR_CP: TInterLinkit;
    ilCVE_OPE_PAG_CN: TInterLinkit;
    ilCVE_OPE_PAG_IN: TInterLinkit;
    ilCVE_OPE_PAG_CP: TInterLinkit;
    btMONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    edH_INICIO_SEGMTO: TInterEdit;
    edH_FIN_SEGMTO: TInterEdit;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox6: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edCVE_OPE_FAC_C_P: TEdit;
    edCVE_OPE_FAC_A_I: TEdit;
    btCVE_OPE_FAC_C_P: TBitBtn;
    btCVE_OPE_FAC_A_C: TBitBtn;
    btCVE_OPE_FAC_A_I: TBitBtn;
    edCVE_OPE_FAC_A_C: TEdit;
    ilCVE_OPE_FAC_C_P: TInterLinkit;
    ilCVE_OPE_FAC_A_C: TInterLinkit;
    ilCVE_OPE_FAC_A_I: TInterLinkit;
    GroupBox7: TGroupBox;
    Label6: TLabel;
    edNUM_DIAS_DEP_CES: TInterEdit;
    Label7: TLabel;
    edF_ULT_CIERRE: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_PARAMETROExit(Sender: TObject);
    procedure edCVE_SEGUIMIENTOExit(Sender: TObject);
    procedure rgSIT_ACC_SEGMTOExit(Sender: TObject);
    procedure btCVE_OPE_PAG_CNClick(Sender: TObject);
    procedure ilCVE_OPE_PAG_CNEjecuta(Sender: TObject);
    procedure ilCVE_OPE_PAG_CNCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_OPE_PAG_CNExit(Sender: TObject);
    procedure btCVE_OPE_PAG_INClick(Sender: TObject);
    procedure ilCVE_OPE_PAG_INEjecuta(Sender: TObject);
    procedure ilCVE_OPE_PAG_INCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_OPE_PAG_INExit(Sender: TObject);
    procedure btCVE_OPE_PAG_CPClick(Sender: TObject);
    procedure ilCVE_OPE_PAG_CPEjecuta(Sender: TObject);
    procedure ilCVE_OPE_PAG_CPCapture(Sender: TObject; var Show: Boolean);
    procedure btCVE_OPE_MOR_CNClick(Sender: TObject);
    procedure ilCVE_OPE_MOR_CNEjecuta(Sender: TObject);
    procedure ilCVE_OPE_MOR_CNCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_OPE_MOR_CNExit(Sender: TObject);
    procedure btCVE_OPE_MOR_INClick(Sender: TObject);
    procedure ilCVE_OPE_MOR_INEjecuta(Sender: TObject);
    procedure ilCVE_OPE_MOR_INCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_OPE_MOR_INExit(Sender: TObject);
    procedure edH_INICIO_SEGMTOExit(Sender: TObject);
    procedure edH_FIN_SEGMTOExit(Sender: TObject);
    procedure edCVE_OPE_PAG_CPExit(Sender: TObject);
    procedure btCVE_OPE_MOR_CPClick(Sender: TObject);
    procedure ilCVE_OPE_MOR_CPEjecuta(Sender: TObject);
    procedure ilCVE_OPE_MOR_CPCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_OPE_MOR_CPExit(Sender: TObject);
    procedure btCVE_CON_MOR_CNClick(Sender: TObject);
    procedure ilCVE_CON_MOR_CNEjecuta(Sender: TObject);
    procedure ilCVE_CON_MOR_CNCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_CON_MOR_CNExit(Sender: TObject);
    procedure btCVE_CON_MOR_INClick(Sender: TObject);
    procedure ilCVE_CON_MOR_INEjecuta(Sender: TObject);
    procedure ilCVE_CON_MOR_INCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_CON_MOR_INExit(Sender: TObject);
    procedure btCVE_CON_MOR_CPClick(Sender: TObject);
    procedure ilCVE_CON_MOR_CPEjecuta(Sender: TObject);
    procedure ilCVE_CON_MOR_CPCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_CON_MOR_CPExit(Sender: TObject);
    procedure btCVE_RET_EMISORClick(Sender: TObject);
    procedure ilCVE_RET_EMISOREjecuta(Sender: TObject);
    procedure ilCVE_RET_EMISORCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_RET_EMISORExit(Sender: TObject);
    procedure btCVE_DEP_PROVClick(Sender: TObject);
    procedure ilCVE_DEP_PROVEjecuta(Sender: TObject);
    procedure ilCVE_DEP_PROVCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_DEP_PROVExit(Sender: TObject);
    procedure btMONEDAClick(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_MON_BASE_ACRExit(Sender: TObject);
    procedure btCVE_OPE_FAC_C_PClick(Sender: TObject);
    procedure ilCVE_OPE_FAC_C_PEjecuta(Sender: TObject);
    procedure ilCVE_OPE_FAC_C_PCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_OPE_FAC_C_PExit(Sender: TObject);
    procedure btCVE_OPE_FAC_A_CClick(Sender: TObject);
    procedure ilCVE_OPE_FAC_A_CEjecuta(Sender: TObject);
    procedure ilCVE_OPE_FAC_A_CCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_OPE_FAC_A_CExit(Sender: TObject);
    procedure btCVE_OPE_FAC_A_IClick(Sender: TObject);
    procedure ilCVE_OPE_FAC_A_IEjecuta(Sender: TObject);
    procedure ilCVE_OPE_FAC_A_ICapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_OPE_FAC_A_IExit(Sender: TObject);
    procedure edNUM_DIAS_DEP_CESExit(Sender: TObject);
    private
    { Private declarations }
    Procedure MuestraHints;
    public
    { Public declarations }
    Objeto : TCrParamet;
end;
 TCrParamet= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_PARAMETRO            : TInterCampo;
        CVE_SEGUIMIENTO          : TInterCampo;
        H_INICIO_SEGMTO          : TInterCampo;
        H_FIN_SEGMTO             : TInterCampo;
        SIT_ACC_SEGMTO           : TInterCampo;
        CVE_OPE_PAG_CN           : TInterCampo;
        CVE_OPE_PAG_IN           : TInterCampo;
        CVE_OPE_PAG_CP           : TInterCampo;
        CVE_OPE_MOR_CN           : TInterCampo;
        CVE_OPE_MOR_IN           : TInterCampo;
        CVE_OPE_MOR_CP           : TInterCampo;
        CVE_CON_MOR_CN           : TInterCampo;
        CVE_CON_MOR_IN           : TInterCampo;
        CVE_CON_MOR_CP           : TInterCampo;
        CVE_RET_EMISOR           : TInterCampo;
        CVE_DEP_PROV             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        CVE_MON_BASE_ACR         : TInterCampo;
        CVE_OPE_FAC_C_P          : TInterCampo;
        CVE_OPE_FAC_A_C          : TInterCampo;
        CVE_OPE_FAC_A_I          : TInterCampo;
        NUM_DIAS_DEP_CES         : TInterCampo;
        F_ULT_CIERRE             : TInterCampo;

        ParamCre                 : TParamCre;
        OperaPagoCN              : TCrOperaci;
        OperaPagoIN              : TCrOperaci;
        OperaPagoCP              : TCrOperaci;
        OperaMoraCN              : TCrOperaci;
        OperaMoraIN              : TCrOperaci;
        OperaMoraCP              : TCrOperaci;
        ConceMpraCN              : TCrConcept;
        ConceMoraIN              : TCrConcept;
        ConceMoraCP              : TCrConcept;
        OperaRetEmi              : TCrOperaci;
        OperaDepPro              : TCrOperaci;
        OperaFacCP               : TCrOperaci;
        OperaFacAC               : TCrOperaci;
        OperaFacAI               : TCrOperaci;
        Moneda                   : TMoneda;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrParamet.Create( AOwner : TComponent );
begin Inherited;
      CVE_PARAMETRO :=CreaCampo('CVE_PARAMETRO',ftString,tsNinguno,tsNinguno,True);
                CVE_PARAMETRO.Caption:='Cve. Parámetro';
      CVE_SEGUIMIENTO :=CreaCampo('CVE_SEGUIMIENTO',ftString,tsNinguno,tsNinguno,True);
                CVE_SEGUIMIENTO.Caption:='Cve. Seguimiento';
      H_INICIO_SEGMTO :=CreaCampo('H_INICIO_SEGMTO',ftFloat,tsNinguno,tsNinguno,True);
                H_INICIO_SEGMTO.Caption:='Hr. inicio Seguimiento';
      H_FIN_SEGMTO :=CreaCampo('H_FIN_SEGMTO',ftFloat,tsNinguno,tsNinguno,True);
                H_FIN_SEGMTO.Caption:='Hr. Fin Segumiento';
      SIT_ACC_SEGMTO :=CreaCampo('SIT_ACC_SEGMTO',ftString,tsNinguno,tsNinguno,True);
         With SIT_ACC_SEGMTO do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0');    ComboDatos.Add(CSIT_AC);
                ComboLista.Add('1');    ComboDatos.Add(CSIT_CA);
          end;
                SIT_ACC_SEGMTO.Caption:='Situación Acceso Seguimiento';
      CVE_OPE_PAG_CN :=CreaCampo('CVE_OPE_PAG_CN',ftString,tsNinguno,tsNinguno,True);
                CVE_OPE_PAG_CN.Caption:='Cve. Pago Capital';
      CVE_OPE_PAG_IN :=CreaCampo('CVE_OPE_PAG_IN',ftString,tsNinguno,tsNinguno,True);
                CVE_OPE_PAG_IN.Caption:='Cve. Pago Interés';
      CVE_OPE_PAG_CP :=CreaCampo('CVE_OPE_PAG_CP',ftString,tsNinguno,tsNinguno,True);
                CVE_OPE_PAG_CP.Caption:='Cve. Pago Capital';
      CVE_OPE_MOR_CN :=CreaCampo('CVE_OPE_MOR_CN',ftString,tsNinguno,tsNinguno,True);
                CVE_OPE_MOR_CN.Caption:='Cve. Mora Concepto';
      CVE_OPE_MOR_IN :=CreaCampo('CVE_OPE_MOR_IN',ftString,tsNinguno,tsNinguno,True);
                CVE_OPE_MOR_IN.Caption:='Cve. Moras Interés';
      CVE_OPE_MOR_CP :=CreaCampo('CVE_OPE_MOR_CP',ftString,tsNinguno,tsNinguno,True);
                CVE_OPE_MOR_CP.Caption:='Cve. Moras Capital';
      CVE_CON_MOR_CN :=CreaCampo('CVE_CON_MOR_CN',ftString,tsNinguno,tsNinguno,True);
                CVE_CON_MOR_CN.Caption:='Cve.Concepto Moras Concepto';
      CVE_CON_MOR_IN :=CreaCampo('CVE_CON_MOR_IN',ftString,tsNinguno,tsNinguno,True);
                CVE_CON_MOR_IN.Caption:='Cve.Concepto Moras Interés';
      CVE_CON_MOR_CP :=CreaCampo('CVE_CON_MOR_CP',ftString,tsNinguno,tsNinguno,True);
                CVE_CON_MOR_CP.Caption:='Cve. Concepto Moras Capital';
      CVE_RET_EMISOR :=CreaCampo('CVE_RET_EMISOR',ftString,tsNinguno,tsNinguno,True);
                CVE_RET_EMISOR.Caption:='Cve.Retiro Emisor';
      CVE_DEP_PROV :=CreaCampo('CVE_DEP_PROV',ftString,tsNinguno,tsNinguno,True);
                CVE_DEP_PROV.Caption:='Cve. Depósito Proveedor';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      CVE_MON_BASE_ACR :=CreaCampo('CVE_MON_BASE_ACR',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MON_BASE_ACR.Caption:='Moneda Base Acreditado';
      CVE_OPE_FAC_C_P :=CreaCampo('CVE_OPE_FAC_C_P',ftString,tsNinguno,tsNinguno,True);
                CVE_OPE_FAC_C_P.Caption:='Cve. Oper. Fac. C. P.';
      CVE_OPE_FAC_A_C :=CreaCampo('CVE_OPE_FAC_A_C',ftString,tsNinguno,tsNinguno,True);
                CVE_OPE_FAC_A_C.Caption:='Cve. Oper. Fac. A. C.';
      CVE_OPE_FAC_A_I :=CreaCampo('CVE_OPE_FAC_A_I',ftString,tsNinguno,tsNinguno,True);
                CVE_OPE_FAC_A_I.Caption:='Cve. Oper. Fac. A. I.';
      NUM_DIAS_DEP_CES :=CreaCampo('NUM_DIAS_DEP_CES',ftFloat,tsNinguno,tsNinguno,True);
                NUM_DIAS_DEP_CES.Caption:='Num. días depuración cesión';
      F_ULT_CIERRE :=CreaCampo('F_ULT_CIERRE',ftDate,tsNinguno,tsNinguno,True);
                F_ULT_CIERRE.Caption:='Fecha último cierre';

      FKeyFields.Add('CVE_PARAMETRO');

      TableName := 'CR_PARAMETRO';
      UseQuery := True;
      HelpFile := 'IntCrParamet.Hlp';
      ShowMenuReporte:=True;

      OperaPagoCN := TCrOperaci.Create(Self);
      OperaPagoCN.MasterSource:=Self;
      OperaPagoCN.FieldByName('CVE_OPERACION').MasterField:='CVE_OPE_PAG_CN';

      OperaPagoIN := TCrOperaci.Create(Self);
      OperaPagoIN.MasterSource:=Self;
      OperaPagoIN.FieldByName('CVE_OPERACION').MasterField:='CVE_OPE_PAG_IN';

      OperaPagoCP := TCrOperaci.Create(Self);
      OperaPagoCP.MasterSource:=Self;
      OperaPagoCP.FieldByName('CVE_OPERACION').MasterField:='CVE_OPE_PAG_CP';

      OperaMoraCN := TCrOperaci.Create(Self);
      OperaMoraCN.MasterSource:=Self;
      OperaMoraCN.FieldByName('CVE_OPERACION').MasterField:='CVE_OPE_MOR_CN';

      OperaMoraIN := TCrOperaci.Create(Self);
      OperaMoraIN.MasterSource:=Self;
      OperaMoraIN.FieldByName('CVE_OPERACION').MasterField:='CVE_OPE_MOR_IN';

      OperaMoraCP := TCrOperaci.Create(Self);
      OperaMoraCP.MasterSource:=Self;
      OperaMoraCP.FieldByName('CVE_OPERACION').MasterField:='CVE_OPE_MOR_CP';

      ConceMpraCN := TCrConcept.Create(Self);
      ConceMpraCN.MasterSource:=Self;
      ConceMpraCN.FieldByName('CVE_CONCEPTO').MasterField:='CVE_CON_MOR_CN';

      ConceMoraIN := TCrConcept.Create(Self);
      ConceMoraIN.MasterSource:=Self;
      ConceMoraIN.FieldByName('CVE_CONCEPTO').MasterField:='CVE_CON_MOR_IN';

      ConceMoraCP := TCrConcept.Create(Self);
      ConceMoraCP.MasterSource:=Self;
      ConceMoraCP.FieldByName('CVE_CONCEPTO').MasterField:='CVE_CON_MOR_CP';

      OperaRetEmi := TCrOperaci.Create(Self);
      OperaRetEmi.MasterSource:=Self;
      OperaRetEmi.FieldByName('CVE_OPERACION').MasterField:='CVE_RET_EMISOR';

      OperaDepPro := TCrOperaci.Create(Self);
      OperaDepPro.MasterSource:=Self;
      OperaDepPro.FieldByName('CVE_OPERACION').MasterField:='CVE_DEP_PROV';

      OperaFacCP := TCrOperaci.Create(Self);
      OperaFacCP.MasterSource:=Self;
      OperaFacCP.FieldByName('CVE_OPERACION').MasterField:='CVE_OPE_FAC_C_P';

      OperaFacAC := TCrOperaci.Create(Self);
      OperaFacAC.MasterSource:=Self;
      OperaFacAC.FieldByName('CVE_OPERACION').MasterField:='CVE_OPE_FAC_A_C';

      OperaFacAI := TCrOperaci.Create(Self);
      OperaFacAI.MasterSource:=Self;
      OperaFacAI.FieldByName('CVE_OPERACION').MasterField:='CVE_OPE_FAC_A_I';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MON_BASE_ACR';
end;

Destructor TCrParamet.Destroy;
begin
   if OperaPagoCN <> nil then
      OperaPagoCN.Free;
   //end if

   if OperaPagoIN <> nil then
      OperaPagoIN.Free;
   //end if

   if OperaPagoCP <> nil then
      OperaPagoCP.Free;
   //end if

   if OperaMoraCN <> nil then
      OperaMoraCN.Free;
   //end if

   if OperaMoraIN <> nil then
      OperaMoraIN.Free;
   //end if

   if OperaMoraCP <> nil then
      OperaMoraCP.Free;
   //end if

   if ConceMpraCN <> nil then
      ConceMpraCN.Free;
   //end if

   if ConceMoraIN <> nil then
      ConceMoraIN.Free;
   //end if

   if ConceMoraCP <> nil then
      ConceMoraCP.Free;
   //end if

   if OperaRetEmi <> nil then
      OperaRetEmi.Free;
   //end if

   if OperaDepPro <> nil then
      OperaDepPro.Free;
   //end if

   if Moneda <> nil then
      Moneda.Free;
   //end if

   if OperaFacCP <> nil then
      OperaFacCP.Free;
   //end if

   if OperaFacAC <> nil then
      OperaFacAC.Free;
   //end if

   if OperaFacAI <> nil then
      OperaFacAI.Free;
   //end if

   inherited;
end;


function TCrParamet.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrParametro;
begin
   W:=TWCrParametro.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
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


Function TCrParamet.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrParam.it','S');
      Try if Active then begin T.Param(0,CVE_PARAMETRO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_PARAMETRO********************)
(*                                                                              *)
(*  FORMA DE CR_PARAMETRO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_PARAMETRO********************)

procedure TWCrParametro.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_PARAMETRO.Control:=edCVE_PARAMETRO;
      Objeto.CVE_SEGUIMIENTO.Control:=edCVE_SEGUIMIENTO;
      Objeto.H_INICIO_SEGMTO.Control:=edH_INICIO_SEGMTO;
      Objeto.H_FIN_SEGMTO.Control:=edH_FIN_SEGMTO;
      Objeto.SIT_ACC_SEGMTO.Control:=rgSIT_ACC_SEGMTO;
      Objeto.CVE_OPE_PAG_CN.Control:=edCVE_OPE_PAG_CN;
      Objeto.CVE_OPE_PAG_IN.Control:=edCVE_OPE_PAG_IN;
      Objeto.CVE_OPE_PAG_CP.Control:=edCVE_OPE_PAG_CP;
      Objeto.CVE_OPE_MOR_CN.Control:=edCVE_OPE_MOR_CN;
      Objeto.CVE_OPE_MOR_IN.Control:=edCVE_OPE_MOR_IN;
      Objeto.CVE_OPE_MOR_CP.Control:=edCVE_OPE_MOR_CP;
      Objeto.CVE_CON_MOR_CN.Control:=edCVE_CON_MOR_CN;
      Objeto.CVE_CON_MOR_IN.Control:=edCVE_CON_MOR_IN;
      Objeto.CVE_CON_MOR_CP.Control:=edCVE_CON_MOR_CP;
      Objeto.CVE_RET_EMISOR.Control:=edCVE_RET_EMISOR;
      Objeto.CVE_DEP_PROV.Control:=edCVE_DEP_PROV;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USUA_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIF;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USUA_MODIF;
      Objeto.CVE_MON_BASE_ACR.Control:=edCVE_MON_BASE_ACR;
      Objeto.CVE_OPE_FAC_C_P.Control := edCVE_OPE_FAC_C_P;
      Objeto.CVE_OPE_FAC_A_C.Control := edCVE_OPE_FAC_A_C;
      Objeto.CVE_OPE_FAC_A_I.Control := edCVE_OPE_FAC_A_I;
      Objeto.NUM_DIAS_DEP_CES.Control := edNUM_DIAS_DEP_CES;
      Objeto.F_ULT_CIERRE.Control := edF_ULT_CIERRE;

      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);
end;

procedure TWCrParametro.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_PARAMETRO.Control:=nil;
      Objeto.CVE_SEGUIMIENTO.Control:=nil;
      Objeto.H_INICIO_SEGMTO.Control:=nil;
      Objeto.H_FIN_SEGMTO.Control:=nil;
      Objeto.SIT_ACC_SEGMTO.Control:=nil;
      Objeto.CVE_OPE_PAG_CN.Control:=nil;
      Objeto.CVE_OPE_PAG_IN.Control:=nil;
      Objeto.CVE_OPE_PAG_CP.Control:=nil;
      Objeto.CVE_OPE_MOR_CN.Control:=nil;
      Objeto.CVE_OPE_MOR_IN.Control:=nil;
      Objeto.CVE_OPE_MOR_CP.Control:=nil;
      Objeto.CVE_CON_MOR_CN.Control:=nil;
      Objeto.CVE_CON_MOR_IN.Control:=nil;
      Objeto.CVE_CON_MOR_CP.Control:=nil;
      Objeto.CVE_RET_EMISOR.Control:=nil;
      Objeto.CVE_DEP_PROV.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
      Objeto.CVE_MON_BASE_ACR.Control:=nil;
      Objeto.CVE_OPE_FAC_C_P.Control := nil;
      Objeto.CVE_OPE_FAC_A_C.Control := nil;
      Objeto.CVE_OPE_FAC_A_I.Control := nil;
      Objeto.NUM_DIAS_DEP_CES.Control := nil;
      Objeto.F_ULT_CIERRE.Control := nil;

      Objeto.Moneda.Desc_Moneda.Control := nil;
   //Objeto
end;

procedure TWCrParametro.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrParametro.InterForma1DespuesNuevo(Sender: TObject);
begin edCVE_PARAMETRO.SetFocus;
end;

procedure TWCrParametro.InterForma1DespuesModificar(Sender: TObject);
begin edCVE_PARAMETRO.SetFocus;
end;

procedure TWCrParametro.edCVE_PARAMETROExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_PARAMETRO,True,'',True);
end;

procedure TWCrParametro.edCVE_SEGUIMIENTOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_SEGUIMIENTO,True,'',True);
end;

procedure TWCrParametro.rgSIT_ACC_SEGMTOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(rgSIT_ACC_SEGMTO,True,'',True);
end;

procedure TWCrParametro.btCVE_OPE_PAG_CNClick(Sender: TObject);
begin
   if Objeto.OperaPagoCN.Busca then
      InterForma1.NextTab(edCVE_OPE_PAG_CN);
   //end if
end;

procedure TWCrParametro.ilCVE_OPE_PAG_CNEjecuta(Sender: TObject);
begin
   if Objeto.OperaPagoCN.FindKey([ilCVE_OPE_PAG_CN.Buffer]) then
      InterForma1.NextTab(edCVE_OPE_PAG_CN);
   //end if
end;

procedure TWCrParametro.ilCVE_OPE_PAG_CNCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrParametro.edCVE_OPE_PAG_CNExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_OPE_PAG_CN,True,'',True);
end;

procedure TWCrParametro.btCVE_OPE_PAG_INClick(Sender: TObject);
begin
   if Objeto.OperaPagoIN.Busca then
      InterForma1.NextTab(edCVE_OPE_PAG_IN);
   //end if
end;

procedure TWCrParametro.ilCVE_OPE_PAG_INEjecuta(Sender: TObject);
begin
   if Objeto.OperaPagoIN.FindKey([ilCVE_OPE_PAG_IN.Buffer]) then
      InterForma1.NextTab(edCVE_OPE_PAG_IN);
   //end if
end;


procedure TWCrParametro.ilCVE_OPE_PAG_INCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrParametro.edCVE_OPE_PAG_INExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_OPE_PAG_IN,True,'',True);
end;

procedure TWCrParametro.btCVE_OPE_PAG_CPClick(Sender: TObject);
begin
   if Objeto.OperaPagoCP.Busca then
      InterForma1.NextTab(edCVE_OPE_PAG_CN);
   //end if
end;

procedure TWCrParametro.ilCVE_OPE_PAG_CPEjecuta(Sender: TObject);
begin
   if Objeto.OperaPagoCP.FindKey([ilCVE_OPE_PAG_CP.Buffer]) then
      InterForma1.NextTab(edCVE_OPE_PAG_CN);
   //end if
end;

procedure TWCrParametro.ilCVE_OPE_PAG_CPCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrParametro.btCVE_OPE_MOR_CNClick(Sender: TObject);
begin
   if Objeto.OperaMoraCN.Busca then
      InterForma1.NextTab(edCVE_OPE_MOR_CN);
   //end if
end;

procedure TWCrParametro.ilCVE_OPE_MOR_CNEjecuta(Sender: TObject);
begin
   if Objeto.OperaMoraCN.FindKey([ilCVE_OPE_MOR_CN.Buffer]) then
      InterForma1.NextTab(edCVE_OPE_MOR_CN);
   //end if
end;

procedure TWCrParametro.ilCVE_OPE_MOR_CNCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrParametro.edCVE_OPE_MOR_CNExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_OPE_MOR_CN,True,'',True);
end;

procedure TWCrParametro.btCVE_OPE_MOR_INClick(Sender: TObject);
begin
   if Objeto.OperaMoraIN.Busca then
      InterForma1.NextTab(edCVE_OPE_MOR_IN);
   //end if
end;

procedure TWCrParametro.ilCVE_OPE_MOR_INEjecuta(Sender: TObject);
begin
   if Objeto.OperaMoraIN.FindKey([ilCVE_OPE_MOR_IN.Buffer]) then
      InterForma1.NextTab(edCVE_OPE_MOR_IN);
   //end if
end;

procedure TWCrParametro.ilCVE_OPE_MOR_INCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrParametro.edCVE_OPE_MOR_INExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_OPE_MOR_IN,True,'',True);
end;

procedure TWCrParametro.edH_INICIO_SEGMTOExit(Sender: TObject);
Var     vlSalida        : Boolean;
        vlMsg           : String;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
   //Verifica que el dato no sea negativo
      Objeto.H_INICIO_SEGMTO.GetFromControl;
      if Objeto.H_INICIO_SEGMTO.AsInteger < 0 then
      Begin
         VLSalida := False;
         vlMsg := 'La hora de inicio no puede de ser negativa';
      end;
      InterForma1.ValidaExit(edH_INICIO_SEGMTO,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrParametro.edH_FIN_SEGMTOExit(Sender: TObject);
Var     vlSalida        : Boolean;
        vlMsg           : String;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
   //Verifica que el dato no sea negativo
      Objeto.H_FIN_SEGMTO.GetFromControl;
      if Objeto.H_FIN_SEGMTO.AsInteger < 0 then
      Begin
         VLSalida := False;
         vlMsg := 'La hora final no puede de ser negativa';
      end;
      InterForma1.ValidaExit(edH_FIN_SEGMTO,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrParametro.edCVE_OPE_PAG_CPExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_OPE_PAG_CP,True,'',True);
end;

procedure TWCrParametro.btCVE_OPE_MOR_CPClick(Sender: TObject);
begin
   if Objeto.OperaMoraCP.Busca then
      InterForma1.NextTab(edCVE_OPE_MOR_CP);
   //end if
end;

procedure TWCrParametro.ilCVE_OPE_MOR_CPEjecuta(Sender: TObject);
begin
   if Objeto.OperaMoraCP.FindKey([ilCVE_OPE_MOR_CN.Buffer]) then
      InterForma1.NextTab(edCVE_OPE_MOR_CP);
   //end if
end;

procedure TWCrParametro.ilCVE_OPE_MOR_CPCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrParametro.edCVE_OPE_MOR_CPExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_OPE_MOR_CP,True,'',True);
end;

procedure TWCrParametro.btCVE_CON_MOR_CNClick(Sender: TObject);
begin
   if Objeto.ConceMpraCN.Busca then
      InterForma1.NextTab(edCVE_CON_MOR_CN);
   //end if
end;

procedure TWCrParametro.ilCVE_CON_MOR_CNEjecuta(Sender: TObject);
begin
   if Objeto.ConceMpraCN.FindKey([ilCVE_OPE_MOR_CN.Buffer]) then
      InterForma1.NextTab(edCVE_CON_MOR_CN);
   //end if
end;

procedure TWCrParametro.ilCVE_CON_MOR_CNCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrParametro.edCVE_CON_MOR_CNExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_CON_MOR_CN,True,'',True);
end;

procedure TWCrParametro.btCVE_CON_MOR_INClick(Sender: TObject);
begin
   if Objeto.ConceMoraIN.Busca then
      InterForma1.NextTab(edCVE_CON_MOR_IN);
   //end if
end;

procedure TWCrParametro.ilCVE_CON_MOR_INEjecuta(Sender: TObject);
begin
   if Objeto.ConceMoraIN.FindKey([ilCVE_CON_MOR_IN.Buffer]) then
      InterForma1.NextTab(edCVE_CON_MOR_IN);
   //end if
end;

procedure TWCrParametro.ilCVE_CON_MOR_INCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrParametro.edCVE_CON_MOR_INExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_CON_MOR_IN,True,'',True);
end;

procedure TWCrParametro.btCVE_CON_MOR_CPClick(Sender: TObject);
begin
   if Objeto.ConceMoraCP.Busca then
      InterForma1.NextTab(edCVE_CON_MOR_CP);
   //end if
end;

procedure TWCrParametro.ilCVE_CON_MOR_CPEjecuta(Sender: TObject);
begin
   if Objeto.ConceMoraCP.FindKey([ilCVE_CON_MOR_CP.Buffer]) then
      InterForma1.NextTab(edCVE_CON_MOR_CP);
   //end if
end;

procedure TWCrParametro.ilCVE_CON_MOR_CPCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrParametro.edCVE_CON_MOR_CPExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_CON_MOR_CP,True,'',True);
end;

procedure TWCrParametro.btCVE_RET_EMISORClick(Sender: TObject);
begin
   if Objeto.OperaRetEmi.Busca then
      InterForma1.NextTab(edCVE_RET_EMISOR);
   //end if
end;

procedure TWCrParametro.ilCVE_RET_EMISOREjecuta(Sender: TObject);
begin
   if Objeto.OperaRetEmi.FindKey([ilCVE_RET_EMISOR.Buffer]) then
      InterForma1.NextTab(edCVE_RET_EMISOR);
   //end if
end;

procedure TWCrParametro.ilCVE_RET_EMISORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrParametro.edCVE_RET_EMISORExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_RET_EMISOR,True,'',True);
end;

procedure TWCrParametro.btCVE_DEP_PROVClick(Sender: TObject);
begin
   if Objeto.OperaDepPro.Busca then
      InterForma1.NextTab(edCVE_DEP_PROV);
   //end if
end;

procedure TWCrParametro.ilCVE_DEP_PROVEjecuta(Sender: TObject);
begin
   if Objeto.OperaDepPro.FindKey([ilCVE_DEP_PROV.Buffer]) then
      InterForma1.NextTab(edCVE_DEP_PROV);
   //end if
end;

procedure TWCrParametro.ilCVE_DEP_PROVCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrParametro.edCVE_DEP_PROVExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_DEP_PROV,True,'',True);
end;

procedure TWCrParametro.btMONEDAClick(Sender: TObject);
begin
   if Objeto.Moneda.Busca then
      InterForma1.NextTab(edCVE_MON_BASE_ACR);
   //end if
end;

procedure TWCrParametro.ilMONEDAEjecuta(Sender: TObject);
begin
   if Objeto.Moneda.FindKey([ilMONEDA.Buffer]) then
      InterForma1.NextTab(edCVE_MON_BASE_ACR);
   //end if
end;

procedure TWCrParametro.ilMONEDACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrParametro.edCVE_MON_BASE_ACRExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_MON_BASE_ACR,True,'',True);
end;

procedure TWCrParametro.MuestraHints;
begin
   edDESC_MONEDA.Hint := Objeto.Moneda.Desc_Moneda.AsString;
   edDESC_MONEDA.ShowHint := True;
end;

procedure TWCrParametro.btCVE_OPE_FAC_C_PClick(Sender: TObject);
begin
   if Objeto.OperaFacCP.Busca then
      InterForma1.NextTab(edCVE_OPE_FAC_C_P);
   //end if
end;

procedure TWCrParametro.ilCVE_OPE_FAC_C_PEjecuta(Sender: TObject);
begin
   if Objeto.OperaFacCP.FindKey([ilCVE_OPE_FAC_C_P.Buffer]) then
      InterForma1.NextTab(edCVE_OPE_FAC_C_P);
   //end if
end;

procedure TWCrParametro.ilCVE_OPE_FAC_C_PCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrParametro.edCVE_OPE_FAC_C_PExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_OPE_FAC_C_P,True,'',True);
end;

procedure TWCrParametro.btCVE_OPE_FAC_A_CClick(Sender: TObject);
begin
   if Objeto.OperaFacAC.Busca then
      InterForma1.NextTab(edCVE_OPE_FAC_A_C);
   //end if
end;

procedure TWCrParametro.ilCVE_OPE_FAC_A_CEjecuta(Sender: TObject);
begin
   if Objeto.OperaFacAC.FindKey([ilCVE_OPE_FAC_A_C.Buffer]) then
      InterForma1.NextTab(edCVE_OPE_FAC_A_C);
   //end if
end;

procedure TWCrParametro.ilCVE_OPE_FAC_A_CCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrParametro.edCVE_OPE_FAC_A_CExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_OPE_FAC_A_C,True,'',True);
end;

procedure TWCrParametro.btCVE_OPE_FAC_A_IClick(Sender: TObject);
begin
   if Objeto.OperaFacAI.Busca then
      InterForma1.NextTab(edCVE_OPE_FAC_A_I);
   //end if
end;

procedure TWCrParametro.ilCVE_OPE_FAC_A_IEjecuta(Sender: TObject);
begin
   if Objeto.OperaFacCP.FindKey([ilCVE_OPE_FAC_A_I.Buffer]) then
      InterForma1.NextTab(edCVE_OPE_FAC_A_I);
   //end if
end;

procedure TWCrParametro.ilCVE_OPE_FAC_A_ICapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrParametro.edCVE_OPE_FAC_A_IExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_OPE_FAC_A_I,True,'',True);
end;

procedure TWCrParametro.edNUM_DIAS_DEP_CESExit(Sender: TObject);
Var     vlSalida        : Boolean;
        vlMsg           : String;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
   //Verifica que el dato no sea negativo
      Objeto.NUM_DIAS_DEP_CES.GetFromControl;
      if Objeto.NUM_DIAS_DEP_CES.AsInteger < 0 then
      Begin
         VLSalida := False;
         vlMsg := 'El número no puede ser negativo';
      end;
      InterForma1.ValidaExit(edNUM_DIAS_DEP_CES,VLSalida,VLMsg,True);
   end;
end;

end.
