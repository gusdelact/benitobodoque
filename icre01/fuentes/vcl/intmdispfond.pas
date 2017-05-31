// Sistema         : Clase de CR_FND_CREDITO
// Fecha de Inicio : 16/12/2004
// Función forma   : Clase de CR_FND_CREDITO    
// Desarrollo por  : MACV. Class Maker.      
// Diseñado por    :
// Comentarios     : 17 OCT 2005. Cambios CrediBInter  
// Modificado por  : Araceli Ramos - SEP 2011  Validación Configuración Cuentas Contables
Unit IntMDispFond;

interface           

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntCtoPanel, IntLinkit,
//Unidades Adicionales
IntCrCto, IntParamCre, InterEdit, IntGenCre,Menus, IntBasicCred,
IntMInstDesc, IntMPrgApoyo, IntCrOrigRec, IntCrCalcInt, IntTasIndFin,
IntCrUniTie, ToolWin,
//HERJA
IntCrAmortiz,   IntCrPagInt, IntCRFNDcuot;


Const
  //HERJA - TIPOA DE MODALIDAD DE FONDEO
  C_DESCTO     = 'DS';
  C_PREST      = 'PR';
  C_FACTOR      = 'FACTOR';

Type
  TMDispFond= class;

  TwMDispFond=Class(TForm)
    InterForma1             : TInterForma;
    lbSITUACION: TLabel;
    lbSIT_CREDITO: TLabel;
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
    Label29: TLabel;
    icpCONTRATO: TInterCtoPanel;
    edID_CREDITO: TEdit;
    ilCVE_FND_ENT_DES: TInterLinkit;
    Label5: TLabel;
    edCVE_FND_ENT_DES: TEdit;
    btCVE_FND_ENT_DES: TBitBtn;
    edNOM_FND_ENT_DES: TEdit;
    edNOM_FND_PROGRAMA: TEdit;
    btCVE_FND_PROGRAMA: TBitBtn;
    edCVE_FND_PROGRAMA: TEdit;
    Label1: TLabel;
    ilCVE_FND_PROGRAMA: TInterLinkit;
    edNOM_ORIGEN_REC: TEdit;
    btCVE_ORIGEN_REC: TBitBtn;
    edCVE_ORIGEN_REC: TEdit;
    Label2: TLabel;
    ilCVE_ORIGEN_REC: TInterLinkit;
    Label22: TLabel;
    lbDIAS_PLAZO: TLabel;
    Label26: TLabel;
    edF_VENCIMIENTO: TEdit;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    btDIASPLAZO: TBitBtn;
    edDIAS_PLAZO: TInterEdit;
    edF_INICIO: TEdit;
    dtpF_INICIO: TInterDateTimePicker;
    lbIMP_CREDITO: TLabel;
    Label18: TLabel;
    edPCT_REDESCONTADO: TInterEdit;
    edIMP_REDESCONTADO: TInterEdit;
    Label7: TLabel;
    Label8: TLabel;
    edSDO_VIG_DISP_ACT: TInterEdit;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel1: TBevel;
    lbCVE_CALCULO: TLabel;
    lbCVE_TASA_REFER: TLabel;
    Label6: TLabel;
    lbOPERADOR_STASA: TLabel;
    Label9: TLabel;
    lbTASA_CREDITO: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label21: TLabel;
    edCVE_CALCULO: TEdit;
    btCVE_CALCULO: TBitBtn;
    edCVE_TASA_REFER: TEdit;
    btCVE_TASA_REFER: TBitBtn;
    edNOM_TASA_REFER: TEdit;
    edVALOR_TASA: TInterEdit;
    edOPERADOR_STASA: TEdit;
    edSOBRETASA: TInterEdit;
    edTASA_CREDITO: TInterEdit;
    edUNIDAD_TIEMPO_RE: TEdit;
    bbUNIDAD_TIEMPO_RE: TBitBtn;
    edNUM_UNIDADES_RE: TInterEdit;
    edDIA_REVISION: TEdit;
    edF_PROX_REVISION: TEdit;
    cbxB_FINAN_ADIC: TCheckBox;
    rgCVE_TIPO_ANUAL: TRadioGroup;
    rgCVE_TIPO_MES: TRadioGroup;
    rgCVE_TIPO_TASA: TRadioGroup;
    edNOM_CALCULO: TEdit;
    ilCVE_CALCULO: TInterLinkit;
    ilCVE_TASA_REFER: TInterLinkit;
    Label3: TLabel;
    edIMP_REC_P: TInterEdit;
    edPCT_REC_P: TInterEdit;
    dtpF_PROX_REVISION: TInterDateTimePicker;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btComisiones: TBitBtn;
    MainMenu1: TMainMenu;
    dispo1: TMenuItem;
    Cuotas1: TMenuItem;
    btAUTORIZA: TBitBtn;
    Label4: TLabel;
    lbCVE_PAG_INTERES: TLabel;
    edCVE_PAG_INTERES: TEdit;
    cbUNIDAD_TIEMPO_CP: TEdit;
    bbUNIDAD_TIEMPO_CP: TBitBtn;
    btPAGO_INT: TBitBtn;
    Label19: TLabel;
    edDESC_PAGO_INT: TEdit;
    edNUM_UNIDADES_CP: TInterEdit;
    Label10: TLabel;
    cbDIA_PAGO_CAP: TEdit;
    Label13: TLabel;
    edF_INI_PAG_CAP: TEdit;
    dtpF_INI_PAG_CAP: TInterDateTimePicker;
    Label11: TLabel;
    cbUNIDAD_TIEMPO_IN: TEdit;
    bbUNIDAD_TIEMPO_IN: TBitBtn;
    Label20: TLabel;
    edNUM_UNIDADES_IN: TInterEdit;
    Label12: TLabel;
    cbDIA_PAGO_INT: TEdit;
    Label14: TLabel;
    edF_INI_PAG_INT: TEdit;
    dtpF_INI_PAG_INT: TInterDateTimePicker;
    ilPAGINT: TInterLinkit;
    lbCVE_AMORTIZACION: TLabel;
    edCVE_AMORTIZACION: TEdit;
    btTIPO_AMORT: TBitBtn;
    edDESC_TIPO_AMORT: TEdit;
    ilTIPAMORT: TInterLinkit;
    btCANCELA: TBitBtn;
    rgCVE_MOD_FND: TRadioGroup;
    Lmsg_rescate: TLabel;
    lbConfgContable: TLabel;
    ch_CalculoInteresEspecial: TCheckBox;
    Label23: TLabel;
    Label32: TLabel;
    Label24: TLabel;
    edID_PRESTAMO_PAS: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure ilCVE_FND_PROGRAMACapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_ORIGEN_RECCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_CALCULOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_TASA_REFERCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure btCVE_FND_ENT_DESClick(Sender: TObject);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);
    procedure edCVE_FND_PROGRAMAExit(Sender: TObject);
    procedure ilCVE_FND_PROGRAMAEjecuta(Sender: TObject);
    procedure btCVE_ORIGEN_RECClick(Sender: TObject);
    procedure ilCVE_ORIGEN_RECEjecuta(Sender: TObject);
    procedure edCVE_ORIGEN_RECExit(Sender: TObject);
    procedure edF_INICIOExit(Sender: TObject);
    procedure edDIAS_PLAZOExit(Sender: TObject);
    procedure edF_VENCIMIENTOExit(Sender: TObject);
    procedure edPCT_REDESCONTADOExit(Sender: TObject);
    procedure edIMP_REDESCONTADOExit(Sender: TObject);
    procedure edCVE_CALCULOExit(Sender: TObject);
    procedure rgCVE_TIPO_TASAExit(Sender: TObject);
    procedure edCVE_TASA_REFERExit(Sender: TObject);
    procedure edOPERADOR_STASAExit(Sender: TObject);
    procedure edSOBRETASAExit(Sender: TObject);
    procedure edTASA_CREDITOExit(Sender: TObject);
    procedure edUNIDAD_TIEMPO_REExit(Sender: TObject);
    procedure edNUM_UNIDADES_REExit(Sender: TObject);
    procedure edDIA_REVISIONExit(Sender: TObject);
    procedure edF_PROX_REVISIONExit(Sender: TObject);
    procedure rgCVE_TIPO_ANUALExit(Sender: TObject);
    procedure rgCVE_TIPO_MESExit(Sender: TObject);
    procedure cbxB_FINAN_ADICExit(Sender: TObject);
    procedure btDIASPLAZOClick(Sender: TObject);
    procedure btCVE_CALCULOClick(Sender: TObject);
    procedure ilCVE_CALCULOEjecuta(Sender: TObject);
    procedure btCVE_TASA_REFERClick(Sender: TObject);
    procedure ilCVE_TASA_REFEREjecuta(Sender: TObject);
    procedure rgCVE_TIPO_TASAClick(Sender: TObject);
    procedure bbUNIDAD_TIEMPO_REClick(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure edOPERADOR_STASAKeyPress(Sender: TObject; var Key: Char);
    procedure cbxB_FINAN_ADICClick(Sender: TObject);
    procedure btComisionesClick(Sender: TObject);
    procedure btCVE_FND_PROGRAMAClick(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject; var Realizado: Boolean);
    procedure InterForma1AntesModificar(Sender: TObject; var Realizado: Boolean);
    procedure edVALOR_TASAExit(Sender: TObject);
    procedure btAUTORIZAClick(Sender: TObject);
    procedure Cuotas1Click(Sender: TObject);
    procedure bbUNIDAD_TIEMPO_CPClick(Sender: TObject);
    procedure bbUNIDAD_TIEMPO_CPExit(Sender: TObject);
    procedure edNUM_UNIDADES_CPExit(Sender: TObject);
    procedure cbDIA_PAGO_CAPEnter(Sender: TObject);
    procedure cbDIA_PAGO_CAPExit(Sender: TObject);
    procedure edDIA_REVISIONKeyPress(Sender: TObject; var Key: Char);
    procedure edF_INI_PAG_CAPExit(Sender: TObject);
    procedure edCVE_PAG_INTERESExit(Sender: TObject);
    procedure btPAGO_INTClick(Sender: TObject);
    procedure edCVE_AMORTIZACIONExit(Sender: TObject);
    procedure btTIPO_AMORTClick(Sender: TObject);
    procedure bbUNIDAD_TIEMPO_INClick(Sender: TObject);
    procedure bbUNIDAD_TIEMPO_INExit(Sender: TObject);
    procedure edNUM_UNIDADES_INExit(Sender: TObject);
    procedure cbDIA_PAGO_INTEnter(Sender: TObject);
    procedure cbDIA_PAGO_INTExit(Sender: TObject);
    procedure edF_INI_PAG_INTExit(Sender: TObject);
    procedure ilTIPAMORTEjecuta(Sender: TObject);
    procedure ilPAGINTEjecuta(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure btCANCELAClick(Sender: TObject);
    procedure cbUNIDAD_TIEMPO_CPChange(Sender: TObject);
    procedure cbUNIDAD_TIEMPO_INChange(Sender: TObject);
    procedure rgCVE_MOD_FNDExit(Sender: TObject);
    procedure ch_CalculoInteresEspecialExit(Sender: TObject);
    procedure edID_PRESTAMO_PASExit(Sender: TObject);
    procedure edID_PRESTAMO_PASKeyPress(Sender: TObject; var Key: Char);
  private
    //HERJA
    vgDiaPago   : Integer;
    Function  CalculaFecha : TDateTime;
    Procedure VerPagoCap;
    Procedure AsignaPagoCap;
    Procedure VerPagoInt;
    Procedure AsignaPagoInt;
    //FIN HERJA
    Function  VentanaCalculo(pDato : String): string;
    Procedure VerificaTasaRefer;
    Function  ValNumUnidades(pNumUnidades, peNumdiasMax, pPlazo: Integer; Var pMensaje : String): Boolean;
    Function  StpBusSigFecha(PPFInicioPag,PPFVencimiento : TDateTime;PPUnidadTiempo : String;
                             PPENumUnidades,PPDiaPago : Integer): TDateTime;
    Procedure ModificaControl;
    Procedure ModControles;
    Function  ValorTasa(pTasa: String): String;
    Procedure ValorTasaCred;
    Procedure ValorRecPropios;
    Procedure EliminaPeriodos;
    Procedure ObtFechas;
    Procedure AjustaControles;
    Procedure MuestraBtnAutoriza;
    function  FindComis: Boolean;
    function  GeneraCUFEGA: Boolean;

    //HERJA
    function  ValUnidadTiemp(pCveUniTiemp : String; pPlazo: Integer; Var pMensaje : String): Boolean;
    Procedure ActualizaValoresPagoEquivalente;
    Function  RevisaImpLimite(var PSImp_Limite:string):boolean;
    Procedure RevisaGpoProd;
    Function  ValidaTabla:boolean;
    //FIN HERJA
    // </ RABA > SEP 2011
    Function ValidaConfgContable:Boolean;
    // < RABA />
  public
    Objeto : TMDispFond;
  end;
  //
  //
  TMDispFond= class(TInterFrame)
  private
  protected
  public
        { Public declarations }
        ID_CREDITO               : TInterCampo;
        CVE_FND_ENT_DES          : TInterCampo;
        CVE_FND_PROGRAMA         : TInterCampo;
        CVE_ORIGEN_REC           : TInterCampo;
        F_INICIO                 : TInterCampo;
        DIAS_PLAZO               : TInterCampo;
        F_VENCIMIENTO            : TInterCampo;
        SDO_VIG_DISP_ACT         : TInterCampo;
        PCT_REDESCONTADO         : TInterCampo;
        IMP_REDESCONTADO         : TInterCampo;
        IMP_CREDITO              : TInterCampo;
        SDO_INSOLUTO             : TInterCampo;
        SDO_FINAN_ADIC           : TInterCampo;
        SDO_VIG_TOTAL            : TInterCampo;
        CVE_CALCULO              : TInterCampo;
        CVE_TIPO_TASA            : TInterCampo;
        CVE_TASA_REFER           : TInterCampo;
        OPERADOR_STASA           : TInterCampo;
        SOBRETASA                : TInterCampo;
        TASA_CREDITO             : TInterCampo;
        UNIDAD_TIEMPO_RE         : TInterCampo;
        NUM_UNIDADES_RE          : TInterCampo;
        DIA_REVISION             : TInterCampo;
        F_PROX_REVISION          : TInterCampo;
        CVE_TIPO_ANUAL           : TInterCampo;
        CVE_TIPO_MES             : TInterCampo;
        B_FINAN_ADIC             : TInterCampo;
        UNIDAD_TIEMPO_FN         : TInterCampo;
        NUM_UNIDADES_FN          : TInterCampo;
        DIA_REVISION_FN          : TInterCampo;
        SIT_CREDITO              : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;
        //
        //HERJA ANEXO DE CAMPOS PARA REDESCUENTO MARZO 2010
        CVE_AMORTIZACION         : TInterCampo;
        CVE_PAG_INTERES          : TInterCampo;
        DIA_PAGO_CAP             : TInterCampo;
        DIA_PAGO_INT             : TInterCampo;
        F_INI_PAG_CAP            : TInterCampo;
        F_INI_PAG_INT            : TInterCampo;
        NUM_UNIDADES_CP          : TInterCampo;
        NUM_UNIDADES_IN          : TInterCampo;
        UNIDAD_TIEMPO_CP         : TInterCampo;
        UNIDAD_TIEMPO_IN         : TInterCampo;
        CVE_MOD_FND              : TInterCampo;

        UTiempoCap               : TCrUniTie;
        UTiempoInt               : TCrUniTie;
        TipoAmort                : TCrAmortiz; //Tipo de Amortizacion
        PagoInt                  : TCrPagInt;  //Pago de intereses
        // FIN HERJA

        // </ RABA > OCT 2011   NUEVO CAMPO PARA EL CÁLCULO DE INTERES ESPECIAL (BANCOMEX)
        B_CFG_DIAS_TASA        : TInterCampo;
        // < RABA />

        ID_PRESTAMO_PAS        : TInterCampo; //ROUY4095 JUN2014 NVO CAMPO PARA ID PRESTAMO PASIVO ED
        
        vgIdCredito              : Integer;
        ParamCre                 : TParamCre;
        CreCto                   : TCrCto;
        BasicCred                : TBasicCred;
        MInstDesc                : TMInstDesc;
        MPrgApoyo                : TMPrgApoyo;
        OrigRec                  : TCrOrigRec;
        CalcInt                  : TCrCalcInt;
        TasaRefer                : TTasIndFin;
        UTiempoTasa              : TCrUniTie;
        UFinanAdic               : TCrUniTie;

        //
        function    stpObtSdoVigente: double;
        procedure   CambioSituacion(Sender: TObject);
        function    AutorizaFnd    : Boolean;
        function    AutorFndCero   : Boolean;        //< EASA4011       21.FEB.2007 Activación de creditos solo con Garantía
        function    MovtoFValor    : Boolean;
        function    stpGenPeriodos : Boolean;

        function    StpBusSigFecha(PPFInicioPag,PPFVencimiento : TDateTime;PPUnidadTiempo : String;
                                   PPENumUnidades,PPDiaPago : Integer;
                                   PPEDMinReqPer : Integer = 0;
                                   PPENumDiasAgrPer : Integer = 0): TDateTime;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

        //HERJA
        function    StpCancPasivo(PId_Credito:Integer; PCve_ent_des, PProg, POrigen_rec, PBdelcuota : String):boolean;
        function    StpAjusteIN(PId_Credito:Integer; PCve_ent_des, PProg, Porig_rec : String):boolean;
        function    GENFACTOPASIVO(bCVE_MOD_FND:string): Boolean;
        function    StpCancTransaccion(PId_Transaccion:Integer):boolean;

  published
    //
  end;
                    
//
//
var vlQry : TQuery;
    vlsql : string;
    vlGpoProd : string;
    vlCveCalCap : string;

    vlQry5 : TQuery;
    vlsql5 : string;

implementation
uses IntCrCalDia, IntMPrComRed, IntCrFndCons;
{$R *.DFM}

constructor TMDispFond.Create( AOwner : TComponent );
begin
  Inherited;
  ID_CREDITO         := CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
  ID_CREDITO.Caption := 'Número de Crédito';
  CVE_FND_ENT_DES    := CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,True);
  CVE_FND_ENT_DES.Caption := 'Clave de entidad';
  CVE_FND_PROGRAMA   := CreaCampo('CVE_FND_PROGRAMA',ftString,tsNinguno,tsNinguno,True);
  CVE_FND_PROGRAMA.Caption := 'Clave de Programa';
  CVE_ORIGEN_REC := CreaCampo('CVE_ORIGEN_REC',ftString,tsNinguno,tsNinguno,True);
  CVE_ORIGEN_REC.Caption := 'Clave de Programa';
  F_INICIO := CreaCampo('F_INICIO',ftDate,tsNinguno,tsNinguno,True);
  F_INICIO.Caption := 'Fecha de inicio';
  DIAS_PLAZO := CreaCampo('DIAS_PLAZO',ftFloat,tsNinguno,tsNinguno,True);
  DIAS_PLAZO.Caption := 'Días de plazo';
  F_VENCIMIENTO := CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,True);
  F_VENCIMIENTO.Caption := 'Fecha de vencimiento';
  SDO_VIG_DISP_ACT := CreaCampo('SDO_VIG_DISP_ACT',ftFloat,tsNinguno,tsNinguno,True);
  SDO_VIG_DISP_ACT.Caption:= 'Saldo vigente';
  PCT_REDESCONTADO := CreaCampo('PCT_REDESCONTADO',ftFloat,tsNinguno,tsNinguno,True);
  PCT_REDESCONTADO.Caption := 'Porcentaje redescontado';
  IMP_REDESCONTADO := CreaCampo('IMP_REDESCONTADO',ftFloat,tsNinguno,tsNinguno,True);
  IMP_REDESCONTADO.Caption := 'Importe de REDESCONTADO';
  IMP_CREDITO := CreaCampo('IMP_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
  IMP_CREDITO.Caption := 'Importe de Crédito';
  SDO_INSOLUTO := CreaCampo('SDO_INSOLUTO',ftFloat,tsNinguno,tsNinguno,True);
  SDO_INSOLUTO.Caption := 'Saldo Insoluto';
  SDO_FINAN_ADIC := CreaCampo('SDO_FINAN_ADIC',ftFloat,tsNinguno,tsNinguno,True);
  SDO_FINAN_ADIC.Caption := 'Saldo de Financiamiento Adicional';
  SDO_VIG_TOTAL := CreaCampo('SDO_VIG_TOTAL',ftFloat,tsNinguno,tsNinguno,True);
  SDO_VIG_TOTAL.Caption := 'Saldo Vigente Total';
  CVE_CALCULO := CreaCampo('CVE_CALCULO',ftString,tsNinguno,tsNinguno,True);
  CVE_CALCULO.Caption := 'Clave cálculo de intereses';
  CVE_TIPO_TASA := CreaCampo('CVE_TIPO_TASA',ftString,tsNinguno,tsNinguno,True);
  With CVE_TIPO_TASA do begin
    Size:=2;
    UseCombo:=True;
    ComboLista.Add('0'); ComboDatos.Add('FI');
    ComboLista.Add('1'); ComboDatos.Add('VA');
  end;
  CVE_TIPO_TASA.Caption:='Clave tipo de tasa';
  CVE_TASA_REFER :=CreaCampo('CVE_TASA_REFER',ftString,tsNinguno,tsNinguno,True);
  CVE_TASA_REFER.Caption:='Clave tasa de referencia';
  OPERADOR_STASA :=CreaCampo('OPERADOR_STASA',ftString,tsNinguno,tsNinguno,True);
  OPERADOR_STASA.Caption:='Operador';
  SOBRETASA :=CreaCampo('SOBRETASA',ftFloat,tsNinguno,tsNinguno,True);
  SOBRETASA.Caption:='Sobretasa';
  TASA_CREDITO :=CreaCampo('TASA_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
  TASA_CREDITO.Caption:='Tasa del Crédito';
  UNIDAD_TIEMPO_RE :=CreaCampo('UNIDAD_TIEMPO_RE',ftString,tsNinguno,tsNinguno,True);
  UNIDAD_TIEMPO_RE.Caption:='Unidad de tiempo';
  NUM_UNIDADES_RE :=CreaCampo('NUM_UNIDADES_RE',ftFloat,tsNinguno,tsNinguno,True);
  NUM_UNIDADES_RE.Caption:='Número de unidades de tiempo';
  DIA_REVISION :=CreaCampo('DIA_REVISION',ftFloat,tsNinguno,tsNinguno,True);
  DIA_REVISION.Caption:='Día de revisión';
  F_PROX_REVISION :=CreaCampo('F_PROX_REVISION',ftDate,tsNinguno,tsNinguno,True);
  F_PROX_REVISION.Caption:='Fecha de próxima revisión';
  CVE_TIPO_ANUAL :=CreaCampo('CVE_TIPO_ANUAL',ftString,tsNinguno,tsNinguno,True);
  With CVE_TIPO_ANUAL Do Begin
         Size:=2;
         UseCombo:=True;
         ComboLista.Add('0'); ComboDatos.Add('CO');
         ComboLista.Add('1'); ComboDatos.Add('CA');
  End;
  CVE_TIPO_ANUAL.Caption:='Clave tipo anual';
  CVE_TIPO_MES :=CreaCampo('CVE_TIPO_MES',ftString,tsNinguno,tsNinguno,True);
  With CVE_TIPO_ANUAL Do Begin
         Size:=2;
         UseCombo:=True;
         ComboLista.Add('0'); ComboDatos.Add('CO');
         ComboLista.Add('1'); ComboDatos.Add('CA');
  End;
  CVE_TIPO_MES.Caption:='Clave tipo mes';
  B_FINAN_ADIC :=CreaCampo('B_FINAN_ADIC',ftString,tsNinguno,tsNinguno,True);
  B_FINAN_ADIC.Caption:='Financiamiento Adicional';
  UNIDAD_TIEMPO_FN :=CreaCampo('UNIDAD_TIEMPO_FN',ftString,tsNinguno,tsNinguno,True);
  UNIDAD_TIEMPO_FN.Caption:='Unidad de tiempo';
  NUM_UNIDADES_FN :=CreaCampo('NUM_UNIDADES_FN',ftFloat,tsNinguno,tsNinguno,True);
  NUM_UNIDADES_FN.Caption:='Número de unidades de tiempo';
  DIA_REVISION_FN :=CreaCampo('DIA_REVISION_FN',ftFloat,tsNinguno,tsNinguno,True);
  DIA_REVISION_FN.Caption:='Día de revisión';
  SIT_CREDITO :=CreaCampo('SIT_CREDITO',ftString,tsNinguno,tsNinguno,True);
  With SIT_CREDITO do begin
    Size:=2;
    UseCombo:=True;
    ComboLista.Add('NO AUTORIZADA');      ComboDatos.Add(CSIT_NA);
    ComboLista.Add('ACTIVO');             ComboDatos.Add(CSIT_AC);
    ComboLista.Add('CANCELADA');          ComboDatos.Add(CSIT_CA);
    ComboLista.Add('LIQUIDADA');          ComboDatos.Add(CSIT_LQ);
    ComboLista.Add('RECHAZADA');          ComboDatos.Add(CSIT_RE);
    ComboLista.Add('AUTORIZADA');         ComboDatos.Add(CSIT_AU);
    ComboLista.Add('NO PROCESADO');       ComboDatos.Add(CSIT_NP);
  end;
  SIT_CREDITO.Caption:='Situación';
  CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
  CVE_USU_ALTA.Caption:='Usuario de alta';
  F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
  F_ALTA.Caption:='Fecha de alta';
  CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
  CVE_USU_MODIFICA.Caption:='Usuario que modifica';
  F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
  F_MODIFICA.Caption:='Fechad e modificación';
  //
  //HERJA ANEXO DE CAMPOS PARA REDESCUENTO MARZO 2010
  CVE_AMORTIZACION :=CreaCampo('CVE_AMORTIZACION',ftString,tsNinguno,tsNinguno,True);
        CVE_AMORTIZACION.Caption:='Tipo de Amortización';
  CVE_PAG_INTERES :=CreaCampo('CVE_PAG_INTERES',ftString,tsNinguno,tsNinguno,True);
        CVE_PAG_INTERES.Caption:='Pago de Intereses';
  DIA_PAGO_CAP :=CreaCampo('DIA_PAGO_CAP',ftFloat,tsNinguno,tsNinguno,True);
        DIA_PAGO_CAP.Caption:='Dia PAgo capital';
  DIA_PAGO_INT :=CreaCampo('DIA_PAGO_INT',ftFloat,tsNinguno,tsNinguno,True);
         DIA_PAGO_INT.Caption:='Dia PAgo Interes';
  F_INI_PAG_CAP :=CreaCampo('F_INI_PAG_CAP',ftDate,tsNinguno,tsNinguno,True);
         F_INI_PAG_CAP.Caption:='Fecha Pago Capital';
  F_INI_PAG_INT :=CreaCampo('F_INI_PAG_INT',ftDate,tsNinguno,tsNinguno,True);
         F_INI_PAG_INT.Caption:='Fecha Inicio pago interes';
  NUM_UNIDADES_CP :=CreaCampo('NUM_UNIDADES_CP',ftFloat,tsNinguno,tsNinguno,True);
         NUM_UNIDADES_CP.Caption:='Num. Unidades CP';
  NUM_UNIDADES_IN :=CreaCampo('NUM_UNIDADES_IN',ftFloat,tsNinguno,tsNinguno,True);
         NUM_UNIDADES_IN.Caption:='Num. Unidades interes';
  UNIDAD_TIEMPO_CP :=CreaCampo('UNIDAD_TIEMPO_CP',ftString,tsNinguno,tsNinguno,True);
         UNIDAD_TIEMPO_CP.Caption:='Unidad Tiempo CP';
  UNIDAD_TIEMPO_IN :=CreaCampo('UNIDAD_TIEMPO_IN',ftString,tsNinguno,tsNinguno,True);
         UNIDAD_TIEMPO_IN.Caption:='Unidad Tiempo Interes';

  CVE_MOD_FND :=CreaCampo('CVE_MOD_FND',ftString,tsNinguno,tsNinguno,True);
  With CVE_MOD_FND do
  Begin
     Size := 3;
     UseCombo := True;
     ComboLista.Add('0'); ComboDatos.Add(C_DESCTO);
     ComboLista.Add('1'); ComboDatos.Add(C_PREST);
  end;
  CVE_MOD_FND.Caption:='Tipo de Modalidad de Fondeo';

   // </ RABA > OCT 2011
   B_CFG_DIAS_TASA := CreaCampo('B_CFG_DIAS_TASA',ftString,tsNinguno,tsNinguno,True);
   B_CFG_DIAS_TASA.Caption := 'Configuración de cálculo de interés especial';
   // < RABA />

  ID_PRESTAMO_PAS := CreaCampo('ID_PRESTAMO_PAS',ftFloat,tsNinguno,tsNinguno,True);
  ID_PRESTAMO_PAS.Caption := 'ID Préstamo Pasivo';
   
  UTiempoCap  := TCrUniTie.Create(Self);
  UTiempoCap.MasterSource:=Self;
  UTiempoCap.FieldByName('CVE_UNIDAD_TIEMP').MasterField:='UNIDAD_TIEMPO_CP';

  UTiempoInt  := TCrUniTie.Create(Self);
  UTiempoInt.MasterSource:=Self;
  UTiempoInt.FieldByName('CVE_UNIDAD_TIEMP').MasterField:='UNIDAD_TIEMPO_IN';

  TipoAmort := TCrAmortiz.Create(Self);
  TipoAmort.MasterSource:=Self;
  TipoAmort.FieldByName('CVE_AMORTIZACION').MasterField:='CVE_AMORTIZACION';

  PagoInt := TCrPagInt.Create(Self);
  PagoInt.MasterSource:=Self;
  PagoInt.FieldByName('CVE_PAG_INTERES').MasterField:='CVE_PAG_INTERES';


  //FIN HERJA

   FKeyFields.Add('ID_CREDITO');
   FKeyFields.Add('CVE_FND_ENT_DES');
   FKeyFields.Add('CVE_FND_PROGRAMA');

   TableName := 'CR_FND_CREDITO';
   UseQuery := True;
   HelpFile := 'IntMDispFond.Hlp';
   ShowMenuReporte:=True;

   CreCto := TCrCto.Create(Self);
   CreCto.MasterSource:=Self;
   SIT_CREDITO.OnChange := CambioSituacion;

   MInstDesc := TMInstDesc.Create(Self);
   MInstDesc.MasterSource:=Self;
   MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';

   MPrgApoyo := TMPrgApoyo.Create(Self);
   MPrgApoyo.MasterSource:=Self;
   MPrgApoyo.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
   MPrgApoyo.FieldByName('CVE_FND_PROGRAMA').MasterField:='CVE_FND_PROGRAMA';

   OrigRec := TCrOrigRec.Create(Self);
   OrigRec.MasterSource:=Self;
   OrigRec.FieldByName('CVE_ORIGEN_REC').MasterField:='CVE_ORIGEN_REC';

   CalcInt := TCrCalcInt.Create(Self);
   CalcInt.MasterSource:=Self;
   CalcInt.FieldByName('CVE_CALCULO_INT').MasterField:='CVE_CALCULO';

   TasaRefer := TTasIndFin.Create(Self);
   TasaRefer.MasterSource:=Self;
   TasaRefer.FieldByName('CVE_TASA_INDICAD').MasterField:='CVE_TASA_REFER';
   TasaRefer.BuscaWhereString := 'TASA_INDIC_FINAN.B_TASA_CREDITO =' + #39 + 'V'+ #39;
   TasaRefer.FilterString := TasaRefer.BuscaWhereString;

   UTiempoTasa := TCrUniTie.Create(Self);
   UTiempoTasa.MasterSource:=Self;
   UTiempoTasa.FieldByName('CVE_UNIDAD_TIEMP').MasterField:='UNIDAD_TIEMPO_RE';

   UFinanAdic := TCrUniTie.Create(Self);
   UFinanAdic.MasterSource:=Self;
   UFinanAdic.FieldByName('CVE_UNIDAD_TIEMP').MasterField:='UNIDAD_TIEMPO_FN';
end;

Destructor TMDispFond.Destroy;
begin
   //HERJA
   if TipoAmort <> nil then
      TipoAmort.Free;
   if PagoInt <> nil then
      PagoInt.Free;
   //FIN HERJA
   If CreCto <> Nil Then
      CreCto.Free;
   If MInstDesc <> Nil Then
      MInstDesc.Free;
   If MPrgApoyo <> Nil Then
      MPrgApoyo.Free;
   If OrigRec <> Nil Then
      OrigRec.Free;
   If CalcInt <> Nil Then
      CalcInt.Free;
   If TasaRefer <> Nil Then
      TasaRefer.Free;
   Inherited;
end;

function TMDispFond.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMDispFond;
begin
   W:=TWMDispFond.Create(Self);
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


Function TMDispFond.InternalBusca:Boolean;
Var
   T        : TInterFindit;
   vlSalida : Boolean;
Begin
   InternalBusca := False;
   T := CreaBuscador('IMDISPFOND.IT','F,S,S,S,S');
   Try
      If Active Then Begin
         T.Param(0,ID_CREDITO.AsString);
         T.Param(1,CVE_FND_ENT_DES.AsString);
         T.Param(2,CVE_FND_PROGRAMA.AsString);
      End;
      If T.Execute Then Begin
         VLSalida := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
         InternalBusca := VLSalida;
      End;
   Finally
      T.Free;
   End;
end;

//Cambia la situación de la Cesión
procedure TMDispFond.CambioSituacion(Sender: TObject);
begin
     If (SIT_CREDITO.Control<>nil) and (SIT_CREDITO.Control is TLabel) then
        TLabel(SIT_CREDITO.Control).Caption:=SIT_CREDITO.AsCombo;
     //END IF
end;


function TMDispFond.stpObtSdoVigente: double;
{const SqlSdoVig = 'SELECT SUM(IMP_CUOTA) IMP_CUOTA FROM CR_SOL_CUOTA ' +
                  'WHERE ID_REF_SOL_CUOTA = %d ' +
                  '  AND CVE_ACCESORIO = ''CP''';}

const SqlSdoVig = 'SELECT NVL(IMP_CREDITO,0) IMP_CREDITO FROM CR_CREDITO ' +
                 'WHERE ID_CREDITO = %d ';
var  vlSqlSdoVig : String;
     vlTQuery    : TQuery;
begin
  result := 0;

  if BasicCred.SIT_CREDITO.AsString = 'AC' then
  begin
    result := BasicCred.SDO_VIG_TOTAL.AsFloat;
  end else begin
    vlSqlSdoVig := Format( SqlSdoVig, [ ID_CREDITO.AsInteger ] );
    vlTQuery := GetSQLQuery(vlSqlSdoVig, Apli.DataBaseName, Apli.SessionName, True );
    if vlTQuery <> nil then
    begin
      if vlTQuery.IsEmpty = False then
      begin
        vlTQuery.First;
        result := vlTQuery.FieldByName('IMP_CREDITO').AsFloat;
      end;
      vlTQuery.Close;
      vlTQuery.Free;
    end;
  end;
  //
end;



function TMDispFond.GENFACTOPASIVO(bCVE_MOD_FND:string): Boolean;
var vlStpAut : TStoredProc;
    vlResult    : Integer;
    vlTxResult  : String;
begin
  Result := False;

  try
    vlStpAut := TStoredProc.Create(nil);
    with vlStpAut do
    begin
      StoredProcName := 'PKGCRREDESCTO.STP_GENFACTOPASIVO';
      DatabaseName   := Apli.DataBaseName;
      SessionName    := Apli.SessionName;
      Params.Clear;
      Params.CreateParam( ftFloat,  'PEIDCESION',   ptInput  ); //
      Params.CreateParam( ftString, 'PECVE_ENT_DES',  ptInput  ); //
      Params.CreateParam( ftString, 'PECVE_FND_PROG', ptInput  ); //
      Params.CreateParam( ftString, 'PECVE_ORIGEN_REC',  ptInput  ); //
      Params.CreateParam( ftString, 'PECVEUSUAUT',   ptInput  ); //
      Params.CreateParam( ftFloat,  'PEFAUTORIZA',  ptInput ); //
      Params.CreateParam( ftString, 'PECVEMODFND',   ptInput  ); //
      Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput  ); //
      Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput ); //     OUT   CODIGO_RESPUESTA.ID_COD_RESP%TYPE,
      Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput ); //     OUT   CR_MOTIVO.TX_DESC_ADICIONA%TYPE
      //
      ParamByName( 'PEIDCESION'   ).AsInteger := ID_CREDITO.AsInteger;
      ParamByName( 'PECVE_ENT_DES'  ).AsString  := CVE_FND_ENT_DES.AsString; //
      ParamByName( 'PECVE_FND_PROG' ).AsString  := CVE_FND_PROGRAMA.AsString; //
      ParamByName( 'PECVE_ORIGEN_REC' ).AsString  := CVE_ORIGEN_REC.AsString; //
      ParamByName( 'PECVEUSUAUT'   ).AsString  := Apli.Usuario;
      ParamByName( 'PEFAUTORIZA'  ).AsDate    := Apli.DameFechaEmpresa;
      ParamByName( 'PECVEMODFND'   ).AsString  := bCVE_MOD_FND;
      ParamByName( 'PEBCOMMIT'     ).AsString  := 'V';
      ExecProc;
      vlResult    := ParamByName( 'PSRESULTADO' ).AsInteger;
      vlTxResult  := ParamByName( 'PSTXRESULTADO' ).AsString;
      if vlResult <> 0 then
      begin
        ShowMessage( 'Error al autorizar la solicitud de redescuento. Avise a Sistemas'+ coCRLF+
                     'Código  : ' + IntToStr(vlResult) + coCRLF+
                     'Mensaje : ' + vlTxResult );
      end else
        Result := True;
    end;
  finally
    if vlStpAut <> nil then
      vlStpAut.Free;
  end;
end;


function TMDispFond.AutorizaFnd: Boolean;
var vlStpAut : TStoredProc;
    vlResult    : Integer;
    vlTxResult  : String;
begin
  Result := False;
  try
    vlStpAut := TStoredProc.Create(nil);
    with vlStpAut do
    begin
      StoredProcName := 'PKGCRREDESCTO.STPAUTORIZAFND';
      DatabaseName   := Apli.DataBaseName;
      SessionName    := Apli.SessionName;
      Params.Clear;
      Params.CreateParam( ftFloat,  'PEIDCREDITO',   ptInput  ); //
      Params.CreateParam( ftString, 'PECVEUSUAUT',   ptInput  ); //
      Params.CreateParam( ftFloat,  'PEIDGPOTRANS',  ptOutput ); //
      Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput  ); //

      Params.CreateParam( ftString, 'PECVEENTIDAD',  ptInput  ); //  HERJA MARZO
      Params.CreateParam( ftString, 'PECVEPROGRAMA', ptInput  ); //  HERJA MARZO

      Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput ); //     OUT   CODIGO_RESPUESTA.ID_COD_RESP%TYPE,
      Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput ); //     OUT   CR_MOTIVO.TX_DESC_ADICIONA%TYPE
      //
      ParamByName( 'PEIDCREDITO'   ).AsInteger := ID_CREDITO.AsInteger;
      ParamByName( 'PECVEENTIDAD'  ).AsString  := CVE_FND_ENT_DES.AsString; //  HERJA MARZO
      ParamByName( 'PECVEPROGRAMA' ).AsString  := CVE_FND_PROGRAMA.AsString; //  HERJA MARZO
      ParamByName( 'PECVEUSUAUT'   ).AsString  := Apli.Usuario;
      ParamByName( 'PEIDGPOTRANS'  ).Clear;
      ParamByName( 'PEBCOMMIT'     ).AsString  := 'V';
      ExecProc;
      vlResult    := ParamByName( 'PSRESULTADO' ).AsInteger;
      vlTxResult  := ParamByName( 'PSTXRESULTADO' ).AsString;
      if vlResult <> 0 then
      begin
        ShowMessage( 'Error al autorizar la solicitud de redescuento. Avise a Sistemas'+ coCRLF+
                     'Código  : ' + IntToStr(vlResult) + coCRLF+
                     'Mensaje : ' + vlTxResult );
      end else
        Result := True;
    end;
  finally
    if vlStpAut <> nil then
      vlStpAut.Free;
  end;
end;
//< EASA4011       21.FEB.2007 Activación de creditos solo con Garantía
function TMDispFond.AutorFndCero: Boolean;
var vlStpAut : TStoredProc;
    vlResult    : Integer;
    vlTxResult  : String;
begin
  Result := False;
  try
    vlStpAut := TStoredProc.Create(nil);
    with vlStpAut do
    begin
      StoredProcName := 'PKGCRREDESCTO.STPAUTFNDPCT_CERO';
      DatabaseName   := Apli.DataBaseName;
      SessionName    := Apli.SessionName;
      Params.Clear;
      Params.CreateParam( ftFloat,  'PEIDCREDITO',   ptInput  ); //
      Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput  ); //
      Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput ); //     OUT   CODIGO_RESPUESTA.ID_COD_RESP%TYPE,
      Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput ); //     OUT   CR_MOTIVO.TX_DESC_ADICIONA%TYPE
      //
      ParamByName( 'PEIDCREDITO'   ).AsInteger := ID_CREDITO.AsInteger;
      ParamByName( 'PEBCOMMIT'     ).AsString  := 'V';
      ExecProc;
      vlResult    := ParamByName( 'PSRESULTADO' ).AsInteger;
      vlTxResult  := ParamByName( 'PSTXRESULTADO' ).AsString;
      if vlResult <> 0 then
      begin
        ShowMessage( 'Error al autorizar la solicitud de redescuento. Avise a Sistemas'+ coCRLF+
                     'Código  : ' + IntToStr(vlResult) + coCRLF+
                     'Mensaje : ' + vlTxResult );
      end else
        Result := True;
    end;
  finally
    if vlStpAut <> nil then
      vlStpAut.Free;
  end;
end;

function TMDispFond.MovtoFValor: Boolean;
var vlStpFValor : TStoredProc;
    vlResult    : Integer;
    vlTxResult  : String;
begin
  Result := False;
  try
    vlStpFValor := TStoredProc.Create(nil);
    with vlStpFValor do
    begin
      StoredProcName := 'PKGCRREDESCTO.STPFNDMOVTOFVALOR';
      DatabaseName   := Apli.DataBaseName;
      SessionName    := Apli.SessionName;
      Params.Clear;
      Params.CreateParam( ftFloat,  'PEIDCREDITO',   ptInput  ); //     IN    CR_FND_CREDITO.ID_CREDITO%TYPE,
      Params.CreateParam( ftString, 'PECVEENTDES',   ptInput  ); //     IN    CR_FND_CREDITO.CVE_FND_ENT_DES%TYPE,
      Params.CreateParam( ftString, 'PEPROGRAMA',    ptInput  ); //     IN    CR_FND_CREDITO.CVE_FND_PROGRAMA%TYPE,
      Params.CreateParam( ftFloat,  'PENUMPERIODO',  ptInput  ); //     IN    CR_FND_CAPITAL.NUM_PERIODO%TYPE,
      Params.CreateParam( ftDate,   'PEFINICIOFND',  ptInput  ); //     IN    CR_FND_CREDITO.F_LIQUIDACION%TYPE,
      Params.CreateParam( ftDate,   'PEFREFERENCIA', ptInput  ); //     IN    CR_FND_CREDITO.F_LIQUIDACION%TYPE,
      Params.CreateParam( ftString, 'PECVEUSUARIO',  ptInput  ); //     IN    CR_CREDITO.CVE_USU_ALTA%TYPE,
      Params.CreateParam( ftFloat,  'PEGPOTRANSAC',  ptInput  ); //     IN    CR_TRANSACCION.ID_GRUPO_TRANSAC%TYPE,
      Params.CreateParam( ftString, 'PEBINICIO',     ptInput  ); //     IN    CR_CREDITO.B_COB_AUT%TYPE,
      Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput  ); //     IN    CR_CREDITO.B_COB_AUT%TYPE,
      Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput ); //     OUT   CODIGO_RESPUESTA.ID_COD_RESP%TYPE,
      Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput ); //     OUT   CR_MOTIVO.TX_DESC_ADICIONA%TYPE
      //
      ParamByName( 'PEIDCREDITO'   ).AsInteger := ID_CREDITO.AsInteger;
      ParamByName( 'PECVEENTDES'   ).AsString  := CVE_FND_ENT_DES.AsString;
      ParamByName( 'PEPROGRAMA'    ).AsString  := CVE_FND_PROGRAMA.AsString;
      ParamByName( 'PENUMPERIODO'  ).Clear;
      ParamByName( 'PEFINICIOFND'  ).AsDate    := F_INICIO.AsDateTime;
      ParamByName( 'PEFREFERENCIA' ).AsDate    := Apli.DameFechaEmpresa;
      ParamByName( 'PECVEUSUARIO'  ).AsString  := Apli.Usuario;
      ParamByName( 'PEGPOTRANSAC'  ).Clear;
      ParamByName( 'PEBINICIO'     ).AsString  := 'F';
      ParamByName( 'PEBCOMMIT'     ).AsString  := 'V';
      ExecProc;
      vlResult    := ParamByName( 'PSRESULTADO' ).AsInteger;
      vlTxResult  := ParamByName( 'PSTXRESULTADO' ).AsString;
      if vlResult <> 0 then
      begin
        ShowMessage( 'Error al reprocesar la solicitud de redescuento. Avise a Sistemas'+ coCRLF+
                     'Código  : ' + IntToStr(vlResult) + coCRLF+
                     'Mensaje : ' + vlTxResult );
      end else
        Result := True;
    end;
  finally
    if vlStpFValor <> nil then
      vlStpFValor.Free;
  end;
end;



function TMDispFond.stpGenPeriodos: Boolean;
var vlStpGenPer : TStoredProc;
    vlResult    : Integer;
    vlTxResult  : String;
begin
  Result      := False;
  vlStpGenPer := TStoredProc.Create(nil);
  try
    with vlStpGenPer do
    begin
      StoredProcName := 'PKGCRREDESCTO.STPGENPERIODOS';
      DatabaseName   := Apli.DataBaseName;
      SessionName    := Apli.SessionName;
      Params.Clear;
      Params.CreateParam( ftFloat,  'PEMetodo',       ptInput  ); //
      Params.CreateParam( ftFloat,  'PEIDCredito',    ptInput  ); //
      Params.CreateParam( ftString, 'PECveEntidad',   ptInput  ); //
{ROIM 03052007  CAMBIO LIBERACIÓN FACTORAJE ELECTRONICO ENTIDAD DESCONTADORA}
      Params.CreateParam( ftString, 'PECveFndEntDes',   ptInput  ); //
{/ROIM}
      Params.CreateParam( ftString, 'PECvePrograma',  ptInput  ); //
      Params.CreateParam( ftFloat,  'PENumPeriodo',   ptInput  ); //
      Params.CreateParam( ftString, 'PECveUsuAlta',   ptInput  ); //
      Params.CreateParam( ftString, 'PEBCommit',      ptInput  ); //
      Params.CreateParam( ftFloat,  'PSResultado',    ptOutput ); //
      Params.CreateParam( ftString, 'PSTxResultado',  ptOutput ); //
      //
      ParamByName( 'PEMetodo'      ).AsInteger := 1;
      ParamByName( 'PEIDCredito'   ).AsInteger := ID_CREDITO.AsInteger;
      ParamByName( 'PECveEntidad'  ).AsString  := CVE_FND_ENT_DES.AsString;
{ROIM 03052007  CAMBIO LIBERACIÓN FACTORAJE ELECTRONICO ENTIDAD DESCONTADORA}
      ParamByName( 'PECveFndEntDes'  ).AsString  := CVE_FND_ENT_DES.AsString;
{/ROIM}
      ParamByName( 'PECvePrograma' ).AsString  := CVE_FND_PROGRAMA.AsString;
      ParamByName( 'PENumPeriodo'  ).Clear;
      ParamByName( 'PECveUsuAlta'  ).AsString  := Apli.Usuario;
      ParamByName( 'PEBCommit'     ).AsString  := 'V';
      //
      ExecProc;
      vlResult    := ParamByName( 'PSResultado' ).AsInteger;
      vlTxResult  := ParamByName( 'PSTxResultado' ).AsString;
      if vlResult <> 0 then
      begin
        ShowMessage( 'Error al generar los períodos de la solicitud de redescuento.' + coCRLF+
                     'Avise a Sistemas'+ coCRLF+
                     'Código  : ' + IntToStr(vlResult) + coCRLF+
                     'Mensaje : ' + vlTxResult );
      end else
        Result := True;
    end;
  finally
    if vlStpGenPer <> nil then
       vlStpGenPer.Free;
  end;
end;


{--------------------------  BUSCA SIGUIENTE FECHA  ----------------------------}
// SATV4766
function TMDispFond.StpBusSigFecha(PPFInicioPag,PPFVencimiento : TDateTime;PPUnidadTiempo : String;
                                   PPENumUnidades,PPDiaPago : Integer;
                                   PPEDMinReqPer : Integer = 0;
                                   PPENumDiasAgrPer : Integer = 0): TDateTime;

          function StpObtenFIniPago(PPFInicioPag,PPFVencimiento : TDateTime;PPUnidadTiempo : String;
                                    PPENumUnidades,PPDiaPago : Integer) : TDateTime;
          var   sptBusFecha : TStoredProc;
                vlResultado : Boolean;
                VLFVencimiento : TDateTime;
          begin
             vlResultado := True;
             try
               sptBusFecha := TStoredProc.Create(Self);
               with sptBusFecha do
               begin
                  //Inicia el SPT
                  sptBusFecha.DatabaseName:= Apli.DatabaseName;
                  sptBusFecha.SessionName:= Apli.SessionName;
                  sptBusFecha.StoredProcName:= 'PKGCRCUOTAS.STPOBTENFINIPAGO';
                  Params.Clear;
                  Params.CreateParam(ftDateTime,'PEFAUTORIZA',ptInput);
                  Params.CreateParam(ftDateTime,'PEFVENCIMIENTO',ptInput);
                  Params.CreateParam(ftString, 'PEUNIDADTIEMPO',ptInput);  //HERJA 11.06.2010
                  Params.CreateParam(ftString, 'PENUMUNIDADES',ptInput);  //HERJA 11.06.2010
                  Params.CreateParam(ftString, 'PEALTADISP',ptInput);  //HERJA 11.06.2010
                  Params.CreateParam(ftInteger,'PEDIAPAGO',ptInput);
                  Params.CreateParam(ftDateTime,'PSFINICIOPAG',ptOutput);
                  Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
                  Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
                  Prepare;
                  ParamByName('PEFAUTORIZA').AsDateTime := PPFInicioPag;
                  ParamByName('PEFVENCIMIENTO').AsDateTime := PPFVencimiento;
                  ParamByName('PEUNIDADTIEMPO').AsString := PPUnidadTiempo;     //HERJA 11.06.2010
                  ParamByName('PENUMUNIDADES').AsInteger := PPENumUnidades;     //HERJA 11.06.2010
                  ParamByName('PEALTADISP').AsString := 'V';     //HERJA 11.06.2010
                  ParamByName('PEDIAPAGO').AsInteger := PPDiaPago;
                  ExecProc;
                  if (ParamByName('PSRESULTADO').AsInteger <> 0) then
                  Begin
                     ShowMessage( IntToStr(ParamByName('PSRESULTADO').AsInteger)  + ' : ' +
                                  ParamByName('PSTXRESULTADO').AsString );
                  end
                  else
                     VLFVencimiento := ParamByName('PSFINICIOPAG').AsDateTime;
                  //end if;
               end;
             finally
                sptBusFecha.Free;
             end;
             Result := VLFVencimiento;
          end;


          function StpObtenFIniPagoMinPzo(PPFInicioPag,PPFVencimiento : TDateTime;PPUnidadTiempo : String;
                                          PPENumUnidades,PPDiaPago, PPEDMinReqPer, PPENumDiasAgrPer : Integer) : TDateTime;
          var   Stp : TStoredProc;
                vlResultado : Boolean;
                VLFVencimiento : TDateTime;
          begin
             vlResultado := True;
             try
               Stp := TStoredProc.Create(Self);
               If Assigned(Stp) Then
                 with Stp do
                 begin
                    //Inicia el SPT
                    DatabaseName := Apli.DatabaseName;
                    SessionName  := Apli.SessionName;
                    StoredProcName:= 'PKGCRCUOTAS.STPOBTENFINIPAGOMINPZO';
                    Params.Clear;
                    Params.CreateParam(ftDateTime,'PEFAUTORIZA',ptInput);
                    Params.CreateParam(ftDateTime,'PEFVENCIMIENTO',ptInput);
                    Params.CreateParam(ftInteger,'PEDIAPAGO',ptInput);
                    Params.CreateParam(ftString,'PEUNIDADTIEMPO',ptInput);
                    Params.CreateParam(ftInteger,'PENUMUNIDADES',ptInput);
                    Params.CreateParam(ftInteger,'PEDMINREQPER',ptInput);
                    Params.CreateParam(ftInteger,'PENUMDIASAGRPER',ptInput);
                    Params.CreateParam(ftDateTime,'PSFINICIOPAG',ptOutput);
                    Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
                    Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
                    ParamByName('PEFAUTORIZA').AsDateTime := PPFInicioPag;
                    ParamByName('PEFVENCIMIENTO').AsDateTime := PPFVencimiento;
                    ParamByName('PEUNIDADTIEMPO').AsString := PPUnidadTiempo;
                    ParamByName('PENUMUNIDADES').AsInteger := PPENumUnidades;
                    ParamByName('PENUMDIASAGRPER').AsInteger := PPENumDiasAgrPer;
                    ParamByName('PEDMINREQPER').AsInteger := PPEDMinReqPer;
                    ExecProc;
                    If (ParamByName('PSRESULTADO').AsInteger <> 0) Then
                    Begin
                       ShowMessage( IntToStr(ParamByName('PSRESULTADO').AsInteger) + ' : ' +
                                    ParamByName('PSTXRESULTADO').AsString );
                    End
                    Else
                       VLFVencimiento := ParamByName('PSFINICIOPAG').AsDateTime;
                 end;
               finally
                  Stp.Free;
               end;
             Result := VLFVencimiento;
          end;

begin
    vlsql:=' SELECT CVE_GEN_TIP_PAG FROM CR_PRODUCTO '+
           ' WHERE CVE_PRODUCTO_CRE = (SELECT CVE_PRODUCTO_CRE FROM CR_CONTRATO '+
           '                           WHERE ID_CONTRATO = ( SELECT ID_CONTRATO FROM CR_CREDITO '+
           '                                                 WHERE ID_CREDITO= '+ ID_CREDITO.AsString +' ) ) ';
    vlQry := GetSQLQuery(vlsql, Apli.DataBaseName, Apli.SessionName, True );
    try
       if vlQry <> nil then
       Begin
          If (Trim(vlQry.FieldByName('CVE_GEN_TIP_PAG').AsString) = CPAGTRA) Then
          Begin
             Result := StpObtenFIniPago(PPFInicioPag, PPFVencimiento, PPUnidadTiempo, PPENumUnidades, PPDiaPago);
          End
       Else If (Trim(vlQry.FieldByName('CVE_GEN_TIP_PAG').AsString) = CPAGNIV) Then
          Begin
             Result := StpObtenFIniPagoMinPzo(PPFInicioPag, PPFVencimiento, PPUnidadTiempo, PPENumUnidades, PPDiaPago,
                                      PPEDMinReqPer, PPENumDiasAgrPer);
          End;
       end;
    finally
       if vlQry <> nil then vlQry.free;
    end;
end;

function TMDispFond.StpCancPasivo(PId_Credito: Integer; PCve_ent_des, PProg, POrigen_rec, PBdelcuota: String):boolean;
var sptEntDesc  : TStoredProc;
    vlResultado : Boolean;
begin
   vlResultado := True;
   try
     sptEntDesc := TStoredProc.Create(Self);
     with sptEntDesc do
     begin
        sptEntDesc.DatabaseName:= Apli.DatabaseName;
        sptEntDesc.SessionName:= Apli.SessionName;
        sptEntDesc.StoredProcName:= 'PKGCRREDESCTO.STPCANCPASIVO_MISMODIA';
        Params.Clear;
        Params.CreateParam(ftString,'PEID_CREDITO',ptInput);
        Params.CreateParam(ftString,'PECVE_ENT_DES',ptInput);
        Params.CreateParam(ftString,'PECVE_FND_PROG',ptInput);
        Params.CreateParam(ftString,'PECVE_ORIGEN_REC',ptInput);
        Params.CreateParam(ftString,'PDELCUOTA',ptInput);
        Params.CreateParam(ftString,'PECVE_USUARIO',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        //
        Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('PEID_CREDITO').AsInteger := PId_Credito;
        ParamByName('PECVE_ENT_DES').AsString := PCve_ent_des;
        ParamByName('PECVE_FND_PROG').AsString := PProg;
        ParamByName('PECVE_ORIGEN_REC').AsString := POrigen_rec;
        ParamByName('PDELCUOTA').AsString := PBdelcuota;
        ParamByName('PECVE_USUARIO').AsString := Apli.Usuario;
        ParamByName('PEBCOMMIT').AsString := 'V';
        ExecProc;
        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage( IntToStr(ParamByName('PSRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('PSTXRESULTADO').AsString );
           GenMsg('Disposición' + IntToStr(PId_Credito) +
                  'Desc: [' + IntToStr(ParamByName('PSRESULTADO').AsInteger)+'] '+
                  ParamByName('PSTXRESULTADO').AsString,Apli);
        end;
     end;
   finally
     sptEntDesc.Free;
   end;
   StpCancPasivo := vlResultado;
end;


function TMDispFond.StpAjusteIN(PId_Credito:Integer; PCve_ent_des, PProg, Porig_rec : String):boolean;
var sptEntDesc  : TStoredProc;
    vlResultado : Boolean;
begin
   vlResultado := True;
   try
     sptEntDesc := TStoredProc.Create(Self);
     with sptEntDesc do
     begin
        sptEntDesc.DatabaseName:= Apli.DatabaseName;
        sptEntDesc.SessionName:= Apli.SessionName;
        sptEntDesc.StoredProcName:= 'PKGCRREDESCTO.STPAJUSTE_INTFND';
        Params.Clear;
        Params.CreateParam(ftString,'PEID_CREDITO',ptInput);
        Params.CreateParam(ftString,'PECVE_ENT_DES',ptInput);
        Params.CreateParam(ftString,'PECVE_FND_PROG',ptInput);
        Params.CreateParam(ftString,'PECVE_ORIGEN_REC',ptInput);
        Params.CreateParam(ftString,'PECVE_USUARIO',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        //
        Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('PEID_CREDITO').AsInteger := PId_Credito;
        ParamByName('PECVE_ENT_DES').AsString := PCve_ent_des;
        ParamByName('PECVE_FND_PROG').AsString := PProg;
        ParamByName('PECVE_ORIGEN_REC').AsString := Porig_rec;
        ParamByName('PECVE_USUARIO').AsString := Apli.Usuario;
        ParamByName('PEBCOMMIT').AsString := 'V';
        ExecProc;
        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage( IntToStr(ParamByName('PSRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('PSTXRESULTADO').AsString );
           GenMsg('Disposición' + IntToStr(PId_Credito) +
                  'Desc: [' + IntToStr(ParamByName('PSRESULTADO').AsInteger)+'] '+
                  ParamByName('PSTXRESULTADO').AsString,Apli);
        end;
     end;
   finally
     sptEntDesc.Free;
   end;
   StpAjusteIN := vlResultado;
end;

function TMDispFond.StpCancTransaccion(PId_Transaccion:Integer):boolean;
var sptCancTrans  : TStoredProc;
    vlResultado : Boolean;
begin
   vlResultado := True;
   try
     sptCancTrans := TStoredProc.Create(Self);
     with sptCancTrans do
     begin
        sptCancTrans.DatabaseName:= Apli.DatabaseName;
        sptCancTrans.SessionName:= Apli.SessionName;
        sptCancTrans.StoredProcName:= 'PKGCRACTUALIZA.STPCANCELATRN';
        Params.Clear;

        Params.CreateParam(ftString,'peIdTransac',ptInput);
        Params.CreateParam(ftString,'peCveUsuCanc',ptInput);
        Params.CreateParam(ftString,'peBCommit',ptInput);
        //
        Params.CreateParam(ftInteger,'psResultado',ptOutput);
        Params.CreateParam(ftString,'psTxResultado',ptOutput);
        Prepare;
        ParamByName('peIdTransac').AsInteger := PId_Transaccion;
        ParamByName('peCveUsuCanc').AsString := Apli.Usuario;
        ParamByName('peBCommit').AsString := 'V';
        ExecProc;
        if (ParamByName('psResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage( IntToStr(ParamByName('psResultado').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
           GenMsg('Desc: [' + IntToStr(ParamByName('psResultado').AsInteger)+'] '+
                  ParamByName('psTxResultado').AsString,Apli);
        end;
     end;
   finally
     sptCancTrans.Free;
   end;
   StpCancTransaccion := vlResultado;
end;


(***********************************************FORMA CR_FND_CREDITO********************)
(*                                                                              *)
(*  FORMA DE CR_FND_CREDITO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FND_CREDITO********************)

//HERJA
Function TwMDispFond.ValidaTabla:boolean;
var STPObtSuc  : TStoredProc;
begin
   ValidaTabla:=true;
     try
          STPObtSuc:=TStoredProc.Create(Nil);
          STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
          STPObtSuc.SessionName:=Objeto.Apli.SessionName;
          STPObtSuc.StoredProcName:='PKGCRREDESCTO.STPVALIDAAMORT';
          STPObtSuc.Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PECVE_ENT_DES',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PECVE_FND_PROG',ptInput);
          STPObtSuc.Params.CreateParam(ftFloat,'PSDiferencia',ptOutput);
          STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
          STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
          STPObtSuc.Prepare;
          STPObtSuc.ParamByName('PEIDCREDITO').AsInteger := Objeto.ID_CREDITO.AsInteger;
          STPObtSuc.ParamByName('PECVE_ENT_DES').AsString := Objeto.CVE_FND_ENT_DES.AsString;
          STPObtSuc.ParamByName('PECVE_FND_PROG').AsString := Objeto.CVE_FND_PROGRAMA.AsString;
          STPObtSuc.ExecProc;
          if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
          begin
               if (STPObtSuc.ParamByName('PSResultado').AsInteger = 2) then
               Begin
                  ShowMessage(STPObtSuc.ParamByName('PSTXResultado').AsString + ' (' +  FormatFloat('###,###,###,###,##.00',STPObtSuc.ParamByName('PSDiferencia').AsFloat) + ') ');
               end
               else
                  ShowMessage(STPObtSuc.ParamByName('PSTXResultado').AsString);
               ValidaTabla:=false;
          end;
     finally
            STPObtSuc.Free;
     end;
end;


Function TwMDispFond.RevisaImpLimite(var PSImp_Limite:string):boolean;
var vlQry : TQuery;
    vlsql : string;
    vlImp_Limite, dImpOld, dImpRdes : Double;
begin
   RevisaImpLimite:=true;
   vlImp_Limite:=0;
   dImpOld:=0;
   dImpRdes:=0;

   If Objeto.Active Then
   Begin

      vlsql:=' SELECT IMP_LIMITE FROM CR_FND_ENT_DES '+
             ' WHERE CVE_FND_ENT_DES = '+ SQLStr(Objeto.CVE_FND_ENT_DES.AsString) ;
      vlQry := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      try
         if vlQry <> nil then
            vlImp_Limite:= vlQry.FieldByName('IMP_LIMITE').AsFloat;
      finally
         if vlQry <> nil then vlQry.free;
      end;

      if vlImp_Limite>0 then
      begin

         vlsql:='SELECT IMP_REDESCONTADO '+
               '  FROM CR_FND_CREDITO '+
               ' WHERE ID_CREDITO ='+ Objeto.ID_CREDITO.AsString +
               '   AND SIT_CREDITO IN (''AC'',''NA'')' +
               '   AND CVE_FND_ENT_DES ='+ SQLStr(Objeto.CVE_FND_ENT_DES.AsString) +
               '   AND CVE_FND_PROGRAMA ='+ SQLStr(Objeto.CVE_FND_PROGRAMA.AsString);
         vlQry:= GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
         try
            If vlQry <> Nil Then
               dImpOld:= vlQry.FieldByName('IMP_REDESCONTADO').AsFloat;
         finally
            if vlQry <> nil then vlQry.free;
         end;

         vlsql:='SELECT NVL(SUM(IMP_REDESCONTADO),0) AS IMP_REDES '+
               '  FROM CR_FND_CREDITO '+
               ' WHERE ID_CREDITO ='+ Objeto.ID_CREDITO.AsString +
               '   AND SIT_CREDITO IN (''AC'',''NA'')' +
               '   AND CVE_FND_ENT_DES ='+ SQLStr(Objeto.CVE_FND_ENT_DES.AsString);
         vlQry:= GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
         try
            If vlQry <> Nil Then
               dImpRdes := (vlQry.FieldByName('IMP_REDES').AsFloat - dImpOld) + Objeto.IMP_REDESCONTADO.AsFloat
            else
              dImpRdes:= Objeto.IMP_REDESCONTADO.AsFloat;
         finally
            if vlQry <> nil then vlQry.free;
         end;

         PSImp_Limite := FloatToStr(vlImp_Limite);
         if dImpRdes>vlImp_Limite then RevisaImpLimite:=false;

      end;
   end;
end;


function  TwMDispFond.ValUnidadTiemp(pCveUniTiemp : String; pPlazo: Integer; Var pMensaje : String): Boolean;
Var vlResultado     : Boolean;
    stpValUnidTiemp : TStoredProc;
begin
    vlResultado := True;
    pMensaje := '';
    stpValUnidTiemp := TStoredProc.Create(Nil);
    try
       with stpValUnidTiemp do
       begin
          stpValUnidTiemp.DatabaseName:= Objeto.Apli.DatabaseName;
          stpValUnidTiemp.SessionName:= Objeto.Apli.SessionName;
          stpValUnidTiemp.StoredProcName:='PKGCRPERIODO.SPTVALIDAUNITIEMPO';

          Params.Clear;
          Params.CreateParam(ftInteger,'PECVEUNIDTIEMPO',ptInput);
          Params.CreateParam(ftString,'PEPLAZO',ptInput);
          Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSMENSAJE',ptOutput);

          Prepare;
          ParamByName('peCveUnidTiempo').AsString := pCveUniTiemp;
          ParamByName('pePlazo').AsInteger := pPlazo;
          ExecProc;

          if ParamByName('psResultado').AsInteger <> 0 then
          begin
             pMensaje := ParamByName('psMensaje').AsString;
             vlResultado := False;
          end;
          UnPrepare;
       end;
    finally
       stpValUnidTiemp.Free;
    end;
    ValUnidadTiemp := vlResultado;
end;

Procedure TwMDispFond.ActualizaValoresPagoEquivalente;
var vlQry : TQuery;
    vlsql : string;
begin
 With Objeto Do
   If (Modo = moAppend) Or (Modo = moEdit) Then
   begin
    // Si utiliza el Método de "Pago Equivalente"

    vlsql:=' SELECT CVE_GEN_TIP_PAG FROM CR_PRODUCTO '+
           ' WHERE CVE_PRODUCTO_CRE = (SELECT CVE_PRODUCTO_CRE FROM CR_CONTRATO '+
           '                           WHERE ID_CONTRATO = ( SELECT ID_CONTRATO FROM CR_CREDITO '+
           '                                                 WHERE ID_CREDITO= '+ edID_CREDITO.Text +' ) ) ';
    vlQry := GetSQLQuery(vlsql, Apli.DataBaseName, Apli.SessionName, True );
    try
       if vlQry <> nil then
       Begin
          If (Trim(vlQry.FieldByName('CVE_GEN_TIP_PAG').AsString) = CPAGNIV) Then
          Begin
             // Si utiliza el Método de "Pago Equivalente"
             UNIDAD_TIEMPO_CP.GetFromControl;
             NUM_UNIDADES_CP.GetFromControl;
             DIA_PAGO_CAP.GetFromControl;
             F_INI_PAG_CAP.GetFromControl;
             // Iguala la selección realizada en la Amortización de "Capital" con los campos de "Interés"
             UTiempoInt.FindKey([UNIDAD_TIEMPO_CP.AsString]);
             NUM_UNIDADES_IN.AsInteger  := NUM_UNIDADES_CP.AsInteger;
             DIA_PAGO_INT.AsInteger     := DIA_PAGO_CAP.AsInteger;
             If (Trim(edF_INI_PAG_CAP.Text) <> '') Then
                F_INI_PAG_INT.AsDateTime   := F_INI_PAG_CAP.AsDateTime;
          End;
       end;
    finally
       if vlQry <> nil then vlQry.free;
    end;
   end;
end;

function TwMDispFond.CalculaFecha: TDateTime;
var vlFecha     : TDateTime;
    vlUniTiempo : Integer;
    vlNumUnid   : Integer;
    vlDiaPago   : Integer;
begin
   Result :=  Objeto.Apli.DameFechaEmpresa;
end;

procedure TwMDispFond.VerPagoCap;
begin
   if (  ((Objeto.Modo = moEdit) AND (Objeto.SIT_CREDITO.AsString='NA')) //HERJA MARZO 2014
      or (Objeto.Modo=moAppend)) then
{CAPITAL/COMISINN   (CP,CO)
--0	NO APLICA  OPERACIONES FUERA DE BALANCE
--1	AMORTIZACIONES PERIÓDICAS AL CAPITAL DE MONTO IDÉNTICO  ok
--2	AMORTIZACIONES PERIÓDICAS AL CAPITAL DE MONTO DIFERENTE  ok
--3	AMORTIZACIONES IRREGULARES PAGOS REALIZADOS EN ESP  DE TIEMPO DIFERENTES
--4	AMORTIZACIÓN  ÚNICA AL VENCIMIENTO}
   BEGIN
      if (objeto.CVE_AMORTIZACION.AsString = '1') OR
         (objeto.CVE_AMORTIZACION.AsString = '2') OR
         (objeto.CVE_AMORTIZACION.AsString = '3') then
      begin
         bbUNIDAD_TIEMPO_CP.Enabled := True;
         edNUM_UNIDADES_CP.Enabled := True;
         cbDIA_PAGO_CAP.Enabled := True;
         edF_INI_PAG_CAP.Enabled := True; //019
         dtpF_INI_PAG_CAP.Enabled := True;
         edNUM_UNIDADES_CP.Color := clWindow;
         cbDIA_PAGO_CAP.Color := clWindow;
         edF_INI_PAG_CAP.Color := clWindow; //019

        cbDIA_PAGO_CAP.HelpContext:=7401;  cbDIA_PAGO_CAP.Tag := 18;  cbDIA_PAGO_CAP.TabStop := True;
      end;
      if objeto.CVE_AMORTIZACION.AsString = '4' then
      Begin
         cbUNIDAD_TIEMPO_CP.Text := '';
         edNUM_UNIDADES_CP.Text := '1';
         cbDIA_PAGO_CAP.Text :='';

         bbUNIDAD_TIEMPO_CP.Enabled := False;
         edNUM_UNIDADES_CP.Enabled := False;
         edNUM_UNIDADES_CP.Color := clBtnFace;
         cbDIA_PAGO_CAP.Enabled := False;
         cbDIA_PAGO_CAP.Color := clBtnFace;
         edF_INI_PAG_CAP.Enabled := False; //019
         edF_INI_PAG_CAP.Color := clBtnFace;//019

         edF_INI_PAG_CAP.Text := edF_VENCIMIENTO.Text;
         dtpF_INI_PAG_CAP.Enabled := False;

         cbDIA_PAGO_CAP.HelpContext:=0; cbDIA_PAGO_CAP.Tag := 0;  cbDIA_PAGO_CAP.TabStop := False;
      end;

      //if (objeto.CVE_AMORTIZACION.AsString = '0') OR (objeto.CVE_AMORTIZACION.AsString = '3') then
      //   ShowMessage('PRECAUCION: Esta Clave de Amortizacion NO GENERARA CUOTAS DE CAPITAL, habra que capturarlas manualmente de manera posterior')
   END;
end;

Procedure TwMDispFond.AsignaPagoCap;
begin
      if objeto.CVE_AMORTIZACION.AsString = '4' then
      Begin
           Objeto.F_INI_PAG_CAP.AsDateTime := Objeto.F_VENCIMIENTO.AsDateTime;
      end;
      if (objeto.CVE_AMORTIZACION.AsString = '1') OR
         (objeto.CVE_AMORTIZACION.AsString = '2') OR
         (objeto.CVE_AMORTIZACION.AsString = '3') then
      begin
           Objeto.NUM_UNIDADES_CP.AsInteger := 1;
          // Objeto.F_INI_PAG_CAP.AsDateTime := CalculaFecha;
           Objeto.F_INI_PAG_CAP.AsString := '';
      end;
end;

procedure TwMDispFond.VerPagoInt;
begin
   if ( ((Objeto.Modo = moEdit) AND (Objeto.SIT_CREDITO.AsString='NA')) //HERJA MARZO 2014
        or (Objeto.Modo=moAppend)) then
{--INTERÉS  (IN)
--0	NO APLICA  OPERACIONES FUERA DE BALANCE
--1	SI SE COBRAN EN SU TOTALIDAD POR ANTICIPADO
--2	SI SE COBRAN EN SU TOTALIDAD AL VENCIMIENTO
--3	SI SE COBRAN EN FORMA PERIÓDICA}

   BEGIN
      if ( objeto.CVE_PAG_INTERES.AsString = '1') or ( objeto.CVE_PAG_INTERES.AsString = '2') then
      Begin
         bbUNIDAD_TIEMPO_IN.Enabled := False;
         cbUNIDAD_TIEMPO_IN.Text := '';
         edNUM_UNIDADES_IN.Enabled := False;
         edNUM_UNIDADES_IN.Text := '1';
         edNUM_UNIDADES_IN.Color := clBtnFace;

         cbDIA_PAGO_INT.Enabled := False;
         cbDIA_PAGO_INT.Text := '';
         cbDIA_PAGO_INT.Color := clBtnFace;

         cbDIA_PAGO_INT.HelpContext:=0; cbDIA_PAGO_INT.Tag := 0;  cbDIA_PAGO_INT.TabStop := False;

         edF_INI_PAG_INT.Enabled := False; //019
         edF_INI_PAG_INT.Color := clBtnFace; //019
         dtpF_INI_PAG_INT.Enabled := False;
         if ( objeto.CVE_PAG_INTERES.AsString = '1') then
             edF_INI_PAG_INT.Text := edF_INICIO.Text
         else
             edF_INI_PAG_INT.Text := edF_VENCIMIENTO.Text;
      end
      else
      Begin
         cbDIA_PAGO_INT.HelpContext:=8301; cbDIA_PAGO_INT.Tag := 18;  cbDIA_PAGO_INT.TabStop := True;

         bbUNIDAD_TIEMPO_IN.Enabled := True;
         edNUM_UNIDADES_IN.Enabled := True;
         cbDIA_PAGO_INT.Enabled := True;
         edF_INI_PAG_INT.Enabled := True; //019
         dtpF_INI_PAG_INT.Enabled := True;
         edNUM_UNIDADES_IN.Color := clWindow;
         cbDIA_PAGO_INT.Color := clWindow;
         edF_INI_PAG_INT.Color := clWindow; //019
      end;

      if (objeto.CVE_PAG_INTERES.AsString = '0') then
         ShowMessage('PRECAUCION: Esta Clave de Interes NO GENERARA CUOTAS DE INTERES, habra que capturarlas manualmente de manera posterior')

   END;
end;

Procedure  TwMDispFond.AsignaPagoInt;
begin
     if objeto.CVE_PAG_INTERES.AsString <> '3' then
     Begin
          Objeto.NUM_UNIDADES_IN.AsInteger := 1;
//          Objeto.F_INI_PAG_INT.AsDateTime := CalculaFecha;
          Objeto.F_INI_PAG_INT.AsString := '';
     end;
end;

//FIN HERJA

procedure TwMDispFond.AjustaControles;
var vlTagEdit  : Longint;
    vlTagBoton : Longint;
    vlTagAA    : Longint;
    vlTabStop  : Boolean;
begin

  If (InterForma1.IsNewData) OR (Objeto.SIT_CREDITO.AsString='NA') Then
  Begin
    vlTagEdit  := 18;
    vlTagBoton := 18;
    vlTagAA    := 18;
    vlTabStop  := True;

    edCVE_FND_ENT_DES.HelpContext:=1001;  btCVE_FND_ENT_DES.HelpContext:=1002;
    edCVE_FND_PROGRAMA.HelpContext:=1101; btCVE_FND_PROGRAMA.HelpContext:=1102;
    edCVE_ORIGEN_REC.HelpContext:=1201;   btCVE_ORIGEN_REC.HelpContext:=1202;

    edF_INICIO.HelpContext:=1301;   dtpF_INICIO.HelpContext:=1302;
    edDIAS_PLAZO.HelpContext:=1400; btDIASPLAZO.HelpContext:=1401;

    edF_VENCIMIENTO.HelpContext:=1500;  dtpF_VENCIMIENTO.HelpContext:=1501;
    edPCT_REDESCONTADO.HelpContext:=1601;
    edIMP_REDESCONTADO.HelpContext:=1701;

    edCVE_CALCULO.HelpContext:=2000;    btCVE_CALCULO.HelpContext:=2001;
    rgCVE_TIPO_TASA.HelpContext:=2100;
    edCVE_TASA_REFER.HelpContext:=2200; btCVE_TASA_REFER.HelpContext:=2201;
    edOPERADOR_STASA.HelpContext:=2400;
//    edSOBRETASA.HelpContext:=2500;
    edTASA_CREDITO.HelpContext:=2600;

    //edUNIDAD_TIEMPO_RE.HelpContext:=2800;
    bbUNIDAD_TIEMPO_RE.HelpContext:=2700;
    edNUM_UNIDADES_RE.HelpContext:=2800;
    edDIA_REVISION.HelpContext:=2900;

    edF_PROX_REVISION.HelpContext:=3000; dtpF_PROX_REVISION.HelpContext:=3050;

    edCVE_AMORTIZACION.HelpContext:=7101;   btTIPO_AMORT.HelpContext:=7102;
    //cbUNIDAD_TIEMPO_CP.HelpContext:=0;
    bbUNIDAD_TIEMPO_CP.HelpContext:=7201;
    edNUM_UNIDADES_CP.HelpContext:=7301;    cbDIA_PAGO_CAP.HelpContext:=7401;

    edF_INI_PAG_CAP.HelpContext:=7501;  dtpF_INI_PAG_CAP.HelpContext:=7502;

    edCVE_PAG_INTERES.HelpContext:=8001;   btPAGO_INT.HelpContext:=8002;
    //cbUNIDAD_TIEMPO_IN.HelpContext:=0;
    bbUNIDAD_TIEMPO_IN.HelpContext:=8101;
    edNUM_UNIDADES_IN.HelpContext:=8201;   cbDIA_PAGO_INT.HelpContext:=8301;

    edF_INI_PAG_INT.HelpContext:=8401;  dtpF_INI_PAG_INT.HelpContext:=8402;

    //rgCVE_MOD_FND.HelpContext:=8701;
    rgCVE_TIPO_ANUAL.HelpContext:=8501;  rgCVE_TIPO_MES.HelpContext:=8601;
    cbxB_FINAN_ADIC.HelpContext:=8801;

    edID_PRESTAMO_PAS.TabOrder:=60;

  end
  else
  begin
    vlTagEdit  := 0;
    vlTagBoton := 0;
    vlTagAA    := 0;
    vlTabStop  := False;

    edCVE_FND_ENT_DES.HelpContext:=0;  btCVE_FND_ENT_DES.HelpContext:=0;
    edCVE_FND_PROGRAMA.HelpContext:=0; btCVE_FND_PROGRAMA.HelpContext:=0;
    edCVE_ORIGEN_REC.HelpContext:=0;   btCVE_ORIGEN_REC.HelpContext:=0;

    edF_INICIO.HelpContext:=0;   dtpF_INICIO.HelpContext:=0;
    edDIAS_PLAZO.HelpContext:=0; btDIASPLAZO.HelpContext:=0;

    edF_VENCIMIENTO.HelpContext:=0;  dtpF_VENCIMIENTO.HelpContext:=0;
    edPCT_REDESCONTADO.HelpContext:=0;
    edIMP_REDESCONTADO.HelpContext:=0;

    edCVE_CALCULO.HelpContext:=0;    btCVE_CALCULO.HelpContext:=0;
    rgCVE_TIPO_TASA.HelpContext:=0;  edCVE_TASA_REFER.HelpContext:=0;
    btCVE_TASA_REFER.HelpContext:=0; edOPERADOR_STASA.HelpContext:=0;
//    edSOBRETASA.HelpContext:=0;
    edTASA_CREDITO.HelpContext:=0;
    edUNIDAD_TIEMPO_RE.HelpContext:=0; bbUNIDAD_TIEMPO_RE.HelpContext:=0;
    edNUM_UNIDADES_RE.HelpContext:=0;  edDIA_REVISION.HelpContext:=0;

    edF_PROX_REVISION.HelpContext:=0; dtpF_PROX_REVISION.HelpContext:=0;

    edCVE_AMORTIZACION.HelpContext:=0;   btTIPO_AMORT.HelpContext:=0;
    //cbUNIDAD_TIEMPO_CP.HelpContext:=0;
    bbUNIDAD_TIEMPO_CP.HelpContext:=0;
    edNUM_UNIDADES_CP.HelpContext:=0;    cbDIA_PAGO_CAP.HelpContext:=0;

    edF_INI_PAG_CAP.HelpContext:=0;  dtpF_INI_PAG_CAP.HelpContext:=0;

    edCVE_PAG_INTERES.HelpContext:=0;   btPAGO_INT.HelpContext:=0;
    //cbUNIDAD_TIEMPO_IN.HelpContext:=0;
    bbUNIDAD_TIEMPO_IN.HelpContext:=0;
    edNUM_UNIDADES_IN.HelpContext:=0;   cbDIA_PAGO_INT.HelpContext:=0;

    edF_INI_PAG_INT.HelpContext:=0;  dtpF_INI_PAG_INT.HelpContext:=0;

    //rgCVE_MOD_FND.HelpContext:=0;
    rgCVE_TIPO_ANUAL.HelpContext:=0;  rgCVE_TIPO_MES.HelpContext:=0;
    cbxB_FINAN_ADIC.HelpContext:=0;

    edID_PRESTAMO_PAS.TabOrder:=32;
  end;

  ch_CalculoInteresEspecial.Tag := 18;  //HERJA MARZO 2014
{    if ( Objeto.SIT_CREDITO.AsString <> CSIT_NA )  then  //HERJA 2014
 //   if ( Objeto.SIT_CREDITO.AsString = CSIT_NA )  then
    begin
      vlTagEdit  := 562;
      vlTagBoton := 50;
      vlTagAA    := 0;
      vlTabStop  := False;
    end;
 }
    if (vlGpoProd=C_FACTOR) then
    begin
      vlTagEdit  := 0;
      vlTagBoton := 0;
      vlTagAA    := 0;
      vlTabStop  := False;
    end;

    //
    edCVE_FND_ENT_DES.Tag   := vlTagEdit;
    btCVE_FND_ENT_DES.Tag   := vlTagBoton;
    ilCVE_FND_ENT_DES.Tag   := vlTagBoton;

    edCVE_FND_PROGRAMA.Tag   := vlTagEdit;
    btCVE_FND_PROGRAMA.Tag   := vlTagBoton;
    ilCVE_FND_PROGRAMA.Tag   := vlTagBoton;
    // </ RABA > OCT 2011
//    ch_CalculoInteresEspecial.Tag := vlTagEdit;
    // < RABA />

    edCVE_ORIGEN_REC.Tag   := vlTagEdit;
    btCVE_ORIGEN_REC.Tag   := vlTagBoton;
    ilCVE_ORIGEN_REC.Tag   := vlTagBoton;

    edF_INICIO.Tag         := vlTagEdit; //019
//    edF_INICIO.Tag         := 0;

    dtpF_INICIO.Tag        := vlTagBoton;
    edDIAS_PLAZO.Tag       := vlTagEdit;
    btDIASPLAZO.Tag        := vlTagBoton;

    edF_VENCIMIENTO.Tag    := vlTagEdit;  //019
//    edF_VENCIMIENTO.Tag    := 0;

    dtpF_VENCIMIENTO.Tag   := vlTagBoton;
    edPCT_REDESCONTADO.Tag := vlTagEdit;
    edIMP_REDESCONTADO.Tag := vlTagEdit;
    edIMP_REDESCONTADO.TabStop := vlTabStop;
    edPCT_REDESCONTADO.TabStop := vlTabStop;

    {Unicos componentes modificables de la pantalla}
    edCVE_CALCULO.Tag      := vlTagAA;
    btCVE_CALCULO.Tag      := vlTagAA;
    rgCVE_TIPO_TASA.Tag    := vlTagAA;
    edCVE_TASA_REFER.Tag   := vlTagAA;
    btCVE_TASA_REFER.Tag   := vlTagAA;
    edOPERADOR_STASA.Tag   := vlTagAA;
//    edSOBRETASA.Tag        := vlTagAA; --HERJA ABRIL 2014
    edSOBRETASA.Tag        := 18;
    edTASA_CREDITO.Tag     := vlTagEdit;
    edUNIDAD_TIEMPO_RE.Tag := vlTagAA;
    bbUNIDAD_TIEMPO_RE.Tag := vlTagAA;
    edNUM_UNIDADES_RE.Tag  := vlTagAA;
    edDIA_REVISION.Tag     := vlTagAA;

    edF_PROX_REVISION.Tag  := vlTagAA; //019
//    edF_PROX_REVISION.Tag  := 0;

    dtpF_PROX_REVISION.Tag := vlTagAA;
    rgCVE_TIPO_ANUAL.Tag   := vlTagAA;
    rgCVE_TIPO_MES.Tag     := vlTagAA;

    //HERJA
    //edDESC_TIPO_AMORT.Tag  := vlTagEdit;
    //edDESC_PAGO_INT.Tag    := vlTagEdit;

    edCVE_AMORTIZACION.Tag := vlTagAA;
    btTIPO_AMORT.Tag       := vlTagAA;
    cbUNIDAD_TIEMPO_CP.Tag := vlTagAA;
    bbUNIDAD_TIEMPO_CP.Tag := vlTagAA;
    edNUM_UNIDADES_CP.Tag  := vlTagAA;
    cbDIA_PAGO_CAP.Tag     := vlTagAA;

    edF_INI_PAG_CAP.Tag    := vlTagAA; //019
//    edF_INI_PAG_CAP.Tag    := 0;

    dtpF_INI_PAG_CAP.Tag   := vlTagAA;

    edCVE_PAG_INTERES.Tag  := vlTagAA;
    btPAGO_INT.Tag         := vlTagAA;
    cbUNIDAD_TIEMPO_IN.Tag := vlTagAA;
    bbUNIDAD_TIEMPO_IN.Tag := vlTagAA;
    edNUM_UNIDADES_IN.Tag  := vlTagAA;
    cbDIA_PAGO_INT.Tag     := vlTagAA;

    edF_INI_PAG_INT.Tag    := vlTagAA; //019
//    edF_INI_PAG_INT.Tag    := 0;

    dtpF_INI_PAG_INT.Tag   := vlTagAA;

    // </ RABA > OCT 2011
    //ch_CalculoInteresEspecial.Tag := vlTagAA;  //HERJA MARZO 2014
    // < RABA />

//    rgCVE_MOD_FND.Tag   := vlTagAA;
    rgCVE_MOD_FND.Tag   := 18;
    if (vlGpoProd<>C_FACTOR) then
    begin
       VerPagoCap;
       VerPagoInt;
    end;

    if (vlGpoProd=C_FACTOR) then
    begin
       edCVE_FND_ENT_DES.Tag   := 18;
       btCVE_FND_ENT_DES.Tag   := 18;
       ilCVE_FND_ENT_DES.Tag   := 18;

       edCVE_FND_PROGRAMA.Tag   := 18;
       btCVE_FND_PROGRAMA.Tag   := 18;
       ilCVE_FND_PROGRAMA.Tag   := 18;
       // </ RABA > OCT 2011
       ch_CalculoInteresEspecial.Tag := 18;
       // < RABA />


       edCVE_ORIGEN_REC.Tag   := 18;
       btCVE_ORIGEN_REC.Tag   := 18;
       ilCVE_ORIGEN_REC.Tag   := 18;

       rgCVE_MOD_FND.Tag   := 18;
       edPCT_REDESCONTADO.Text:='100.00';
    end;
    //FIN HERJA

    {ends_unicos componentes modificables de la pantalla}
    cbxB_FINAN_ADIC.Tag    := vlTagEdit;

    edID_PRESTAMO_PAS.Tag := 18;
end;

procedure TwMDispFond.RevisaGpoProd;
var vlsql :  String;
    vlQry : TQuery;
begin
   AjustaControles;
   vlGpoProd := 'NIL';
   vlsql:=' SELECT C.ID_CREDITO, P.CVE_PRODUCTO_CRE, P.CVE_PRODUCTO_GPO, CTTO.CVE_MONEDA, P.CVE_CAL_CAPITAL '+
          '   FROM CR_CREDITO C, CR_CONTRATO L, CR_PRODUCTO P, CONTRATO CTTO '+
          '  WHERE C.ID_CREDITO  = '+Objeto.ID_CREDITO.AsString +
          '    AND  L.ID_CONTRATO      = C.ID_CONTRATO '+
          '    AND  L.FOL_CONTRATO     = C.FOL_CONTRATO '+
          '    AND  CTTO.ID_CONTRATO   = L.ID_CONTRATO '+
          '    AND  P.CVE_PRODUCTO_CRE = L.CVE_PRODUCTO_CRE ';

   vlQry := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   try
     if vlQry <> nil then
     begin
        vlGpoProd   := vlQry.FieldByName('CVE_PRODUCTO_GPO').AsString;
        vlCveCalCap := vlQry.FieldByName('CVE_CAL_CAPITAL').AsString;
     end;
   finally
     if vlQry <> nil then vlQry.free;
   end;
end;

// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
Procedure TwMDispFond.ObtFechas;
Begin
   If Objeto.BasicCred.F_INICIO.AsDateTime <= Objeto.Apli.DameFechaEmpresaDia('D000') Then Begin
      Objeto.F_INICIO.AsDateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
      If Objeto.BasicCred.F_VENCIMIENTO.AsDateTime = 0 Then Begin
         Objeto.DIAS_PLAZO.AsFloat:= Objeto.BasicCred.DIAS_PLAZO.AsFloat;
         Objeto.F_VENCIMIENTO.AsDateTime:= Objeto.Apli.DameFechaEmpresaDia('D000') + Objeto.BasicCred.DIAS_PLAZO.AsFloat;
      End Else Begin
         Objeto.DIAS_PLAZO.AsFloat:= (Objeto.BasicCred.F_VENCIMIENTO.AsDateTime - Objeto.Apli.DameFechaEmpresaDia('D000'));
         Objeto.F_VENCIMIENTO.AsDateTime:= Objeto.BasicCred.F_VENCIMIENTO.AsDateTime;
      End;
   End Else Begin
      Objeto.F_INICIO.AsDateTime:= Objeto.BasicCred.F_INICIO.AsDateTime;
      Objeto.DIAS_PLAZO.AsInteger:= Objeto.BasicCred.DIAS_PLAZO.AsInteger;
      Objeto.F_VENCIMIENTO.AsDateTime:= Objeto.BasicCred.F_VENCIMIENTO.AsDateTime;
   End;
End;


//
procedure TwMDispFond.ValorTasaCred;
begin
   If Objeto.OPERADOR_STASA.AsString = '+' Then
      Objeto.TASA_CREDITO.AsFloat := StrToFloat(edVALOR_TASA.Text) + Objeto.SOBRETASA.AsFloat
   Else If Objeto.OPERADOR_STASA.AsString = '-' Then
      Objeto.TASA_CREDITO.AsFloat := StrToFloat(edVALOR_TASA.Text) - Objeto.SOBRETASA.AsFloat
   Else If Objeto.OPERADOR_STASA.AsString = '*' Then
      Objeto.TASA_CREDITO.AsFloat := StrToFloat(edVALOR_TASA.Text) * Objeto.SOBRETASA.AsFloat
   Else If Objeto.OPERADOR_STASA.AsString = '/' Then
      Objeto.TASA_CREDITO.AsFloat := StrToFloat(edVALOR_TASA.Text) / Objeto.SOBRETASA.AsFloat
   Else Begin
      If Objeto.SOBRETASA.AsFloat <> 0 Then Begin
         Objeto.OPERADOR_STASA.AsString:= '+';
         Objeto.TASA_CREDITO.AsFloat := StrToFloat(edVALOR_TASA.Text) + Objeto.SOBRETASA.AsFloat;
      End Else
         Objeto.TASA_CREDITO.AsFloat := StrToFloat(edVALOR_TASA.Text);
   End;
end;

//
Function TwMDispFond.ValorTasa(pTasa: String): String;
var vlValor : String;
    StpValorTasa: TStoredProc;
    vlFecha: TDateTime;
    vlDia: Integer;
    function ObtDiaIniTasa(): Integer;
    Var vlDia: Integer;
    Begin
       vlDia := 0;
       GetSQLInt('SELECT nvl(DIA_INI_TASA_FND,0) DIA FROM CR_PRODUCTO_FND WHERE  CVE_PRODUCTO_CRE = '+
                 SQLStr(Objeto.CreCto.CVE_PRODUCTO_CRE.AsString) +'  AND CVE_MONEDA = '+Objeto.CreCto.CVE_MONEDA.AsString +
                 ' AND CVE_FND_ENT_DES = '+ SQLStr(Objeto.CVE_FND_ENT_DES.AsString) + ' AND CVE_FND_PROGRAMA = '+SQLStr(Objeto.CVE_FND_PROGRAMA.AsString),
                 Objeto.apli.DataBaseName,Objeto.apli.SessionName, 'DIA', vlDia,False );
       IF vlDia = -1 then
         vlDia := 0;
       Result:= vlDia;
    End;
begin
  vlValor:='0';
  StpValorTasa := TStoredProc.Create(Nil);
  vlDia := ObtDiaIniTasa;
  vlFecha:= Objeto.F_INICIO.AsDateTime - vlDia;
  If Assigned(StpValorTasa) Then
  With StpValorTasa Do
      Try
       StoredProcName := 'PKGCRCREDITOO1.STPCALCTASAREFER';
       DatabaseName := Objeto.Apli.DataBaseName;
       SessionName := Objeto.Apli.SessionName;
       Params.Clear;
       Params.CreateParam(ftString,'peCVE_TASA_INDICAD', ptInput);
       Params.CreateParam(ftDate,'peF_CALCULO', ptInput);
       Params.CreateParam(ftFloat,'psVAL_TASA', ptOutput);
       Params.CreateParam(ftFloat,'PSRESULTADO', ptOutput);
       Params.CreateParam(ftString,'PSTX_RESULTADO', ptOutput);

       ParamByName('peCVE_TASA_INDICAD').AsString := pTasa;
       ParamByName('peF_CALCULO').AsDateTime := vlFecha;
       ExecProc;

       If (ParamByName('PSRESULTADO').AsFloat = 0) Then
         vlValor:= ParamByName('psVAL_TASA').AsString
       else showMessage(ParamByName('PSTX_RESULTADO').AsString);

      Finally
       Free;
      End;
    ValorTasa := vlValor;
end;
//
procedure TwMDispFond.VerificaTasaRefer;
begin
  If Objeto.CVE_TASA_REFER.AsString <> '' Then
    if Objeto.CVE_TASA_REFER.AsString <> C_TASA_FIJA then
      edVALOR_TASA.Text := ValorTasa(Objeto.CVE_TASA_REFER.AsString)
    else
      edVALOR_TASA.Text := '0.0'
    ;
end;
//
Procedure TwMDispFond.ValorRecPropios;
Var
   sSQL: String;
   qyQuery: TQuery;
   dPorcentaje, dPctOld, dImporte: Double;
Begin
   dPorcentaje:= 0;
   dPctOld    := 0;
   If Objeto.Active Then Begin
      sSQL:='SELECT PCT_REDESCONTADO, ID_CREDITO '+
            '  FROM CR_FND_CREDITO '+
            ' WHERE ID_CREDITO ='+ Objeto.ID_CREDITO.AsString +
            '   AND SIT_CREDITO IN (''AC'',''NA'')' +  //HERJA
            '   AND CVE_FND_ENT_DES ='+ SQLStr(Objeto.CVE_FND_ENT_DES.AsString) +
            '   AND CVE_FND_PROGRAMA ='+ SQLStr(Objeto.CVE_FND_PROGRAMA.AsString);
      qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      If qyQuery <> Nil Then Begin
         If qyQuery.FieldByName('ID_CREDITO').AsInteger = Objeto.ID_CREDITO.AsInteger Then Begin
            dPctOld:= qyQuery.FieldByName('PCT_REDESCONTADO').AsFloat;
         End;
      End;
      //HERJA
      sSQL:='SELECT SUM(PCT_REDESCONTADO)PCT , ID_CREDITO'+
            '  FROM CR_FND_CREDITO '+
            ' WHERE ID_CREDITO ='+ Objeto.ID_CREDITO.AsSQL +
            '   AND SIT_CREDITO IN (''AC'',''NA'')' +
            '   AND  ( ' +
            '         ( ' +
            '          (F_INICIO <= TO_DATE('''+Objeto.F_INICIO.AsString+''',''DD/MM/YYYY''))' +
            '           AND ' +
	    '          (F_VENCIMIENTO >= TO_DATE('''+Objeto.F_INICIO.AsString+''',''DD/MM/YYYY''))' +
            '         ) ' +
            '	      OR '+
            '	      ( ' +
            '          (F_INICIO BETWEEN TO_DATE('''+Objeto.F_INICIO.AsString+''',''DD/MM/YYYY'') AND TO_DATE('''+Objeto.F_VENCIMIENTO.AsString+''',''DD/MM/YYYY'') ) ' +
            '          AND ' +
            '          (F_VENCIMIENTO >= TO_DATE('''+Objeto.F_VENCIMIENTO.AsString+''',''DD/MM/YYYY'')) ' +
            '         ) ' +
            '	      OR '+
            '	      ( ' +
            '          (F_INICIO BETWEEN TO_DATE('''+Objeto.F_INICIO.AsString+''',''DD/MM/YYYY'') AND TO_DATE('''+Objeto.F_VENCIMIENTO.AsString+''',''DD/MM/YYYY'') ) ' +
            '          AND ' +
            '          (F_VENCIMIENTO BETWEEN TO_DATE('''+Objeto.F_INICIO.AsString+''',''DD/MM/YYYY'') AND TO_DATE('''+Objeto.F_VENCIMIENTO.AsString+''',''DD/MM/YYYY'') ) ' +
            '         ) ' +
            '        ) ' +
            ' GROUP BY ID_CREDITO ';
      //FIN HERJA
      qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      If qyQuery <> Nil Then
      Begin
      //   If qyQuery.FieldByName('ID_CREDITO').AsInteger = Objeto.ID_CREDITO.AsInteger Then
         dPorcentaje:= 100 - (qyQuery.FieldByName('PCT').AsFloat - dPctOld) - Objeto.PCT_REDESCONTADO.AsFloat;
      End
      Else
      Begin
         dPorcentaje:= 100 - Objeto.PCT_REDESCONTADO.AsFloat;
//         dPorcentaje:= 100 ;
      End;

   End;
   dImporte:= (Objeto.stpObtSdoVigente/100)* dPorcentaje; // (Objeto.BasicCred.SDO_VIG_TOTAL.AsFloat/100)* dPorcentaje;

   edPCT_REC_P.Text:= FormatFloat('##0.0000',dPorcentaje);
   edIMP_REC_P.Text:= FormatFloat('###,###,###,###,##0.00',dImporte);
End;


Procedure TwMDispFond.ModificaControl;
Begin
   If (  ((Objeto.Modo = moEdit) AND (Objeto.SIT_CREDITO.AsString='NA')) //HERJA MARZO 2014
         or (Objeto.Modo=moAppend)) Then Begin //HERJA MARZO 2014
      If rgCVE_TIPO_TASA.ItemIndex = 0 Then
      Begin
         Objeto.UTiempoTasa.Active       := False;
         Objeto.NUM_UNIDADES_RE.AsString := '';
         Objeto.DIA_REVISION.AsString    := '';
         Objeto.F_PROX_REVISION.AsString := '';

         bbUNIDAD_TIEMPO_RE.Enabled:= False;
         edNUM_UNIDADES_RE.Color:= clBtnFace;
         edNUM_UNIDADES_RE.ReadOnly:= True;
         edNUM_UNIDADES_RE.TabStop:= False;

         edDIA_REVISION.Color:= clBtnFace;
         edDIA_REVISION.ReadOnly:= True;
         edDIA_REVISION.TabStop:= False;

         edF_PROX_REVISION.Color:= clBtnFace;
         edF_PROX_REVISION.ReadOnly:= True;
         edF_PROX_REVISION.TabStop:= False;

      End Else Begin
         Objeto.UTiempoTasa.Active:= True;

         bbUNIDAD_TIEMPO_RE.Enabled:= True;
         edNUM_UNIDADES_RE.Color:= clWindow;
         edNUM_UNIDADES_RE.ReadOnly:= False;
         edNUM_UNIDADES_RE.TabStop:= True;

         edDIA_REVISION.Color:= clWindow;
         edDIA_REVISION.ReadOnly:= False;
         edDIA_REVISION.TabStop:= True;

         edF_PROX_REVISION.Color:= clWindow;  //019
         edF_PROX_REVISION.ReadOnly:= False;  //019
         edF_PROX_REVISION.TabStop:= True;  //019
      End;
   End;
End;


Function TwMDispFond.StpBusSigFecha(PPFInicioPag,PPFVencimiento : TDateTime;
                                    PPUnidadTiempo : String;
                                    PPENumUnidades,PPDiaPago : Integer): TDateTime;
var
   sptBusFecha : TStoredProc;
Begin
   Result := PPFInicioPag;
   Try
      sptBusFecha := TStoredProc.Create(Self);
      With sptBusFecha Do Begin
         sptBusFecha.DatabaseName:= Objeto.Apli.DatabaseName;
         sptBusFecha.SessionName:= Objeto.Apli.SessionName;
         sptBusFecha.StoredProcName:= 'PKGCRCUOTAS.STPOBTENFINIPAGO';
         Params.Clear;
         Params.CreateParam(ftDateTime,'PEFAUTORIZA',ptInput);
         Params.CreateParam(ftDateTime,'PEFVENCIMIENTO',ptInput);
         Params.CreateParam(ftString, 'PEUNIDADTIEMPO',ptInput);  //HERJA 11.06.2010
         Params.CreateParam(ftString, 'PENUMUNIDADES',ptInput);  //HERJA 11.06.2010
         Params.CreateParam(ftString, 'PEALTADISP',ptInput);  //HERJA 11.06.2010
         Params.CreateParam(ftInteger,'PEDIAPAGO',ptInput);
         Params.CreateParam(ftDateTime,'PSFINICIOPAG',ptOutput);
         Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
         Prepare;
         ParamByName('PEFAUTORIZA').AsDateTime := PPFInicioPag;
         ParamByName('PEFVENCIMIENTO').AsDateTime := PPFVencimiento;
         ParamByName('PEUNIDADTIEMPO').AsString := PPUnidadTiempo;     //HERJA 11.06.2010
         ParamByName('PENUMUNIDADES').AsInteger := PPENumUnidades;     //HERJA 11.06.2010
         ParamByName('PEALTADISP').AsString := 'V';     //HERJA 11.06.2010
         ParamByName('PEDIAPAGO').AsInteger := PPDiaPago;
         ExecProc;
         If (ParamByName('PSRESULTADO').AsInteger <> 0) Then Begin
            ShowMessage( IntToStr(ParamByName('PSRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('PSTXRESULTADO').AsString );
         End Else
            Result := ParamByName('PSFINICIOPAG').AsDateTime;
      End;
   Finally
     if sptBusFecha <> nil then
      sptBusFecha.Free;
   End;
end;
        

Procedure TwMDispFond.EliminaPeriodos;
Var
   sSQL:String;
Begin
   sSQL:= 'DELETE CR_FND_CAPITAL WHERE ID_CREDITO ='+ Objeto.ID_CREDITO.AsString +
          ' AND CVE_FND_ENT_DES ='+ SQLStr(Objeto.CVE_FND_ENT_DES.AsString) +
          ' AND CVE_FND_PROGRAMA ='+ SQLStr(Objeto.CVE_FND_PROGRAMA.AsString);
   RunSQL(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

   sSQL:= 'DELETE CR_FND_INTERES WHERE ID_CREDITO ='+ Objeto.ID_CREDITO.AsString +
          ' AND CVE_FND_ENT_DES ='+ SQLStr(Objeto.CVE_FND_ENT_DES.AsString) +
          ' AND CVE_FND_PROGRAMA ='+ SQLStr(Objeto.CVE_FND_PROGRAMA.AsString);
   RunSQL(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

   sSQL:= 'Delete CR_FND_COMISION '+
          ' WHERE ID_CREDITO = '+ Objeto.ID_CREDITO.AsSQL +
          '   AND CVE_FND_ENT_DES = '+ Objeto.CVE_FND_ENT_DES.AsSQL +
          '   AND CVE_FND_PROGRAMA = '+ Objeto.CVE_FND_PROGRAMA.AsSQL;
   RunSQL(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

   sSQL:= 'Delete CR_FND_COM_PROG '+
          ' WHERE ID_CREDITO = '+ Objeto.ID_CREDITO.AsSQL +
          '   AND CVE_FND_ENT_DES = '+ Objeto.CVE_FND_ENT_DES.AsSQL +
          '   AND CVE_FND_PROGRAMA = '+ Objeto.CVE_FND_PROGRAMA.AsSQL;
   RunSQL(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
End;


procedure TwMDispFond.MuestraBtnAutoriza;
begin
   btAUTORIZA.Visible := ( Objeto.BasicCred.SIT_CREDITO.AsString = CSIT_AC ) and
                         ( Objeto.SIT_CREDITO.AsString = CSIT_NA );
   if Objeto.SIT_CREDITO.AsString = CSIT_AC then btAUTORIZA.Visible:=false;

   btAUTORIZA.Enabled := ( Objeto.BasicCred.SIT_CREDITO.AsString = CSIT_AC ) and
                         ( Objeto.SIT_CREDITO.AsString = CSIT_NA );
   if Objeto.SIT_CREDITO.AsString = CSIT_AC then btAUTORIZA.Enabled:=false;
end;

function TwMDispFond.FindComis: Boolean;
var vlCount : Integer;
begin
  Result := False;
  GetSQLInt('SELECT COUNT(*) COUNT ' +
            'FROM CR_FND_COM_PROG  ' +
            ' WHERE  ID_CREDITO  =  '     + Objeto.ID_CREDITO.AsString       +
//            '   AND  CVE_FND_ENT_DES  = ' + Objeto.CVE_FND_ENT_DES.AsString  +
//            '   AND  CVE_FND_PROGRAMA = ' + Objeto.CVE_FND_PROGRAMA.AsString +
//            '   AND  CVE_COMISION = ''CUFEGA''',
            '   AND  CVE_COMISION IN (SELECT CVE_COMISION FROM CR_CAT_COMISION WHERE DESC_COMISION LIKE ''%CUOTA%GARANT%'') ',
            Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,'COUNT',vlCount, False);
  Result := (vlCount > 0);
end;

function TwMDispFond.GeneraCUFEGA: Boolean;
var vlCount : Integer;
begin
  Result := False;
  GetSQLInt('SELECT COUNT(*) COUNT  ' +
            'FROM   CR_PRODUCTO_COM ' +
            'WHERE  CVE_PRODUCTO_CRE = ' + SQLStr(Objeto.BasicCred.CVE_PRODUCTO.AsString) +
            '  AND  CVE_COMISION     = ''CUFEGA'' ',
            Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,'COUNT',vlCount, False);
  Result := (vlCount > 0);
end;


procedure TwMDispFond.FormShow(Sender: TObject);
begin
   icpCONTRATO.Frame := Objeto.CreCto.Contrato;
   icpCONTRATO.RefrescaInfo; //Refresca la información del Contrato

   //Pinta los datos del panel inferior
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.ID_CREDITO.Control       := edID_CREDITO;
   Objeto.CVE_FND_ENT_DES.Control  := edCVE_FND_ENT_DES;
   Objeto.CVE_FND_PROGRAMA.Control := edCVE_FND_PROGRAMA;
   Objeto.CVE_ORIGEN_REC.Control   := edCVE_ORIGEN_REC;
   // </ RABA > OCT 2011
   Objeto.B_CFG_DIAS_TASA.Control  := ch_CalculoInteresEspecial;
   // < RABA />
   Objeto.F_INICIO.Control         := edF_INICIO;
   Objeto.DIAS_PLAZO.Control       := edDIAS_PLAZO;
   Objeto.F_VENCIMIENTO.Control    := edF_VENCIMIENTO;
   Objeto.PCT_REDESCONTADO.Control  := edPCT_REDESCONTADO;
   Objeto.IMP_REDESCONTADO.Control  := edIMP_REDESCONTADO;
   //Objeto.SDO_VIG_TOTAL.Control    := edSDO_VIG_TOTAL;
   Objeto.SDO_VIG_DISP_ACT.Control  := edSDO_VIG_DISP_ACT;
   Objeto.CVE_CALCULO.Control      := edCVE_CALCULO;
   Objeto.CVE_TIPO_TASA.Control    := rgCVE_TIPO_TASA;
   Objeto.CVE_TASA_REFER.Control   := edCVE_TASA_REFER;
   Objeto.OPERADOR_STASA.Control   := edOPERADOR_STASA;
   Objeto.SOBRETASA.Control        := edSOBRETASA;
   Objeto.TASA_CREDITO.Control     := edTASA_CREDITO;
   Objeto.NUM_UNIDADES_RE.Control  := edNUM_UNIDADES_RE;
   Objeto.DIA_REVISION.Control     := edDIA_REVISION;
   Objeto.F_PROX_REVISION.Control  := edF_PROX_REVISION;
   Objeto.CVE_TIPO_ANUAL.Control   := rgCVE_TIPO_ANUAL;
   Objeto.CVE_TIPO_MES.Control     := rgCVE_TIPO_MES;
   Objeto.B_FINAN_ADIC.Control     := cbxB_FINAN_ADIC;
   Objeto.SIT_CREDITO.Control      := lbSIT_CREDITO;
   Objeto.ID_PRESTAMO_PAS.Control  := edID_PRESTAMO_PAS;

   //HERJA ANEXO DE CAMPOS PARA REDESCUENTO MARZO 2010
   Objeto.CVE_AMORTIZACION.Control:=edCVE_AMORTIZACION;
   Objeto.CVE_PAG_INTERES.Control:=edCVE_PAG_INTERES;
   Objeto.DIA_PAGO_CAP.Control := cbDIA_PAGO_CAP;
   Objeto.DIA_PAGO_INT.Control := cbDIA_PAGO_INT;
   Objeto.F_INI_PAG_CAP.Control := edF_INI_PAG_CAP;
   Objeto.F_INI_PAG_INT.Control := edF_INI_PAG_INT;
   Objeto.NUM_UNIDADES_CP.Control := edNUM_UNIDADES_CP;
   Objeto.NUM_UNIDADES_IN.Control := edNUM_UNIDADES_IN;
   Objeto.UTiempoCap.DESCRIPCION.Control := cbUNIDAD_TIEMPO_CP;
   Objeto.UTiempoInt.DESCRIPCION.Control := cbUNIDAD_TIEMPO_IN;

   Objeto.TipoAmort.DESC_AMORTIZA.Control :=edDESC_TIPO_AMORT;
   Objeto.PagoInt.DESC_PAG_INTERES.Control :=edDESC_PAGO_INT;
   Objeto.CVE_MOD_FND.Control:= rgCVE_MOD_FND;
   //FIN HERJA
   InterForma1.MsgPanel := MsgPanel;

   Objeto.MInstDesc.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
   Objeto.MInstDesc.DESC_ENT_DES.Control    := edNOM_FND_ENT_DES;
   Objeto.MInstDesc.GetParams(Objeto);

   Objeto.MPrgApoyo.CVE_FND_PROGRAMA.Control:= edCVE_FND_PROGRAMA;
   Objeto.MPrgApoyo.DESC_PROGRAMA.Control   := edNOM_FND_PROGRAMA;
   // </ RABA > OCT 2011
//   Objeto.MPrgApoyo.B_CFG_DIAS_TASA.Control := ch_CalculoInteresEspecial;  //HERJA MARZO 2014 
   // < RABA />
   Objeto.MPrgApoyo.GetParams(Objeto);

   Objeto.OrigRec.CVE_ORIGEN_REC.Control  := edCVE_ORIGEN_REC;
   Objeto.OrigRec.DESC_ORIGEN_REC.Control := edNOM_ORIGEN_REC;
   Objeto.OrigRec.GetParams(Objeto);

   Objeto.CalcInt.CVE_CALCULO_INT.Control := edCVE_CALCULO;
   Objeto.CalcInt.DESC_CALCULO.Control    := edNOM_CALCULO;
   Objeto.CalcInt.GetParams(Objeto);

   Objeto.TasaRefer.CVE_TASA_INDICAD.Control := edCVE_TASA_REFER;
   Objeto.TasaRefer.DESC_TASA_INDIC.Control  := edNOM_TASA_REFER;
   Objeto.TasaRefer.GetParams(Objeto);

   Objeto.UTiempoTasa.DESCRIPCION.Control := edUNIDAD_TIEMPO_RE;
   Objeto.UTiempoTasa.GetParams(Objeto);

   dtpF_INICIO.Date:=Objeto.Apli.DameFechaEmpresa;
   dtpF_VENCIMIENTO.Date:=Objeto.Apli.DameFechaEmpresa;
   dtpF_PROX_REVISION.Date:=Objeto.Apli.DameFechaEmpresa;
   dtpF_INI_PAG_CAP.Date:=Objeto.Apli.DameFechaEmpresa;
   dtpF_INI_PAG_INT.Date:=Objeto.Apli.DameFechaEmpresa;

   If Objeto.vgIdCredito <> 0 Then Begin
      Objeto.BasicCred := CreaTBCredito(Objeto.vgIdCredito, Objeto.Apli);
      Objeto.ID_CREDITO.AsInteger:= Objeto.BasicCred.ID_CREDITO.AsInteger;
      Objeto.CreCto.FindKey([Objeto.BasicCred.ID_CONTRATO.AsString,
                             Objeto.BasicCred.FOL_CONTRATO.AsString]);
      Objeto.FindKeyNear( [Objeto.ID_CREDITO.AsString] , [ 'ID_CREDITO' ] );


      if (edCVE_AMORTIZACION.Text = '4') then
      begin
         cbUNIDAD_TIEMPO_CP.Text := '';
         cbDIA_PAGO_CAP.Text :='';
      end;

      if (edCVE_PAG_INTERES.Text = '1')OR(edCVE_PAG_INTERES.Text = '2') then
      begin
         cbUNIDAD_TIEMPO_IN.Text := '';
         cbDIA_PAGO_INT.Text :='';
      end;

      VerificaTasaRefer;
      MuestraBtnAutoriza;
      ValidaConfgContable;
   End;

   InterForma1.BtnEliminar.Visible:=false;
end;

procedure TwMDispFond.FormDestroy(Sender: TObject);
begin
   Objeto.ID_CREDITO.Control       := Nil;
   Objeto.CVE_FND_ENT_DES.Control  := Nil;
   Objeto.CVE_FND_PROGRAMA.Control := Nil;
   Objeto.CVE_ORIGEN_REC.Control   := Nil;
   // </ RABA > OCT 2011
   Objeto.B_CFG_DIAS_TASA.Control  := Nil;
   // < RABA />
   Objeto.F_INICIO.Control         := Nil;
   Objeto.DIAS_PLAZO.Control       := Nil;
   Objeto.F_VENCIMIENTO.Control    := Nil;
   Objeto.PCT_REDESCONTADO.Control  := Nil;
   Objeto.IMP_REDESCONTADO.Control  := Nil;
   //Objeto.SDO_VIG_TOTAL.Control    := Nil;
   Objeto.SDO_VIG_DISP_ACT.Control    := Nil;
   Objeto.CVE_CALCULO.Control      := Nil;
   Objeto.CVE_TIPO_TASA.Control    := Nil;
   Objeto.CVE_TASA_REFER.Control   := Nil;
   Objeto.OPERADOR_STASA.Control   := Nil;
   Objeto.SOBRETASA.Control        := Nil;
   Objeto.TASA_CREDITO.Control     := Nil;
   Objeto.NUM_UNIDADES_RE.Control  := Nil;
   Objeto.DIA_REVISION.Control     := Nil;
   Objeto.F_PROX_REVISION.Control  := Nil;
   Objeto.CVE_TIPO_ANUAL.Control   := Nil;
   Objeto.CVE_TIPO_MES.Control     := Nil;
   Objeto.B_FINAN_ADIC.Control     := Nil;
   {
   Objeto.NUM_UNIDADES_FN.Control  := Nil;
   Objeto.DIA_REVISION_FN.Control  := Nil;
   }
   Objeto.SIT_CREDITO.Control  := Nil;
   Objeto.ID_PRESTAMO_PAS.Control  := Nil;
   //HERJA ANEXO DE CAMPOS PARA REDESCUENTO MARZO 2010
   Objeto.CVE_AMORTIZACION.Control       := Nil;
   Objeto.CVE_PAG_INTERES.Control        := Nil;
   Objeto.DIA_PAGO_CAP.Control           := Nil;
   Objeto.DIA_PAGO_INT.Control           := Nil;
   Objeto.F_INI_PAG_CAP.Control          := Nil;
   Objeto.F_INI_PAG_INT.Control          := Nil;
   Objeto.NUM_UNIDADES_CP.Control        := Nil;
   Objeto.NUM_UNIDADES_IN.Control        := Nil;
   Objeto.UTiempoCap.DESCRIPCION.Control := Nil;
   Objeto.UTiempoInt.DESCRIPCION.Control := Nil;

   Objeto.TipoAmort.DESC_AMORTIZA.Control :=nil;
   Objeto.PagoInt.DESC_PAG_INTERES.Control :=nil;
   Objeto.CVE_MOD_FND.Control:= Nil;     
   //FIN HERJA
   InterForma1.MsgPanel := Nil;

   Objeto.MInstDesc.CVE_FND_ENT_DES.Control  := Nil;
   Objeto.MInstDesc.DESC_ENT_DES.Control     := Nil;
   Objeto.MPrgApoyo.CVE_FND_PROGRAMA.Control := Nil;
   Objeto.MPrgApoyo.DESC_PROGRAMA.Control    := Nil;
   // </ RABA > OCT 2011
//   Objeto.MPrgApoyo.B_CFG_DIAS_TASA.Control  := Nil; //HERJA MARZO 2014
   // < RABA />
   Objeto.OrigRec.CVE_ORIGEN_REC.Control     := Nil;
   Objeto.OrigRec.DESC_ORIGEN_REC.Control    := Nil;
   Objeto.CalcInt.CVE_CALCULO_INT.Control    := Nil;
   Objeto.CalcInt.DESC_CALCULO.Control       := Nil;
   Objeto.TasaRefer.CVE_TASA_INDICAD.Control := Nil;
   Objeto.TasaRefer.DESC_TASA_INDIC.Control  := Nil;
   Objeto.UTiempoTasa.DESCRIPCION.Control    := Nil;
   //Objeto.UFinanAdic.DESCRIPCION.Control    := Nil;
end;

procedure TwMDispFond.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

Procedure TwMDispFond.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
var VLSalida  :  boolean;
    VLMsg     :  String;
    Qry1: TQuery;
    VLvalCP   : boolean;
    VLvalIN   : boolean;
Begin
   //nuevo
   If IsNewData Then Begin
      If MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin

         Qry1 := TQuery.Create(Self);
         Qry1.DatabaseName := Objeto.Apli.DataBaseName;
         Qry1.SessionName  := Objeto.Apli.SessionName;
         Qry1.close;
         Qry1.SQL.Text:= ' SELECT F_INICIO, F_VENCIMIENTO, CVE_FND_ENT_DES, CVE_FND_PROGRAMA'+
                         ' FROM CR_FND_CREDITO '+
                         ' WHERE ID_CREDITO ='+ Objeto.ID_CREDITO.AsString+
                         ' AND SIT_CREDITO NOT IN (''CA'',''LQ'') ';
         Qry1.Open;
         while (Qry1.Eof=FALSE)and(VlSalida=true) do
         begin
            if (Objeto.F_INICIO.AsDateTime>=Qry1.FieldByName('F_INICIO').AsDateTime)and(Objeto.F_INICIO.AsDateTime<=Qry1.FieldByName('F_VENCIMIENTO').AsDateTime) then
            begin
               VLMsg := 'La Fecha de Inicio esta dentro del pasivo de la Entidad '+
                         Qry1.FieldByName('CVE_FND_ENT_DES').AsString+ ' Programa '+Qry1.FieldByName('CVE_FND_PROGRAMA').AsString;
               VlSalida   := False;
            end;
            Qry1.Next;
         end;
         Qry1.Close;

         Qry1.SQL.Text:= ' SELECT F_INICIO, F_VENCIMIENTO, CVE_FND_ENT_DES, CVE_FND_PROGRAMA'+
                         ' FROM CR_FND_CREDITO '+
                         ' WHERE ID_CREDITO ='+ Objeto.ID_CREDITO.AsString+
                         ' AND SIT_CREDITO NOT IN (''CA'',''LQ'') ';
         Qry1.Open;
         while (Qry1.Eof=FALSE)and(VlSalida=true) do
         begin
            if (Objeto.F_VENCIMIENTO.AsDateTime>=Qry1.FieldByName('F_INICIO').AsDateTime)and(Objeto.F_VENCIMIENTO.AsDateTime<=Qry1.FieldByName('F_VENCIMIENTO').AsDateTime) then
            begin
               VLMsg := 'La Fecha de Vencimiento esta dentro del pasivo de la Entidad '+
                         Qry1.FieldByName('CVE_FND_ENT_DES').AsString+ ' y Programa '+Qry1.FieldByName('CVE_FND_PROGRAMA').AsString;
               VlSalida   := False;
            end;
            Qry1.Next;
         end;
         Qry1.Close;
         Qry1.Free;

         //REVISA EN EL ACTIVO SI HAY OPERATIVA ASOCIADA Y VALIDA QUE LAS AMORTIZACIONES Y
         //PERIODOS DE CAPITAL SEAN LOS MISMOS.
         if ( Objeto.BasicCred.CVE_OPERATIVA.AsString <> CNULL ) and ( GeneraCUFEGA = True ) then
         begin
            VLvalCP:=false;
            if Objeto.BasicCred.CVE_AMORTIZACION.AsString <> Objeto.CVE_AMORTIZACION.AsString then VLvalCP:=true;
            if Objeto.BasicCred.UNIDAD_TIEMPO_CP.AsString <> Objeto.UNIDAD_TIEMPO_CP.AsString then VLvalCP:=true;
            if Objeto.BasicCred.DIA_PAGO_CAP.AsString <> Objeto.DIA_PAGO_CAP.AsString then VLvalCP:=true;

            if VLvalCP then
            begin
               VLMsg := 'El Activo tiene asociada una Operativa, las cuotas de Capital deben de ser las mismas para generar correctamente las Cuotas FEGA';
               VlSalida   := False;
            end;
         end;

         //REVISA EN EL ACTIVO SI HAY FINANCIAMIENTO ADICIONAL Y VALIDA QUE LAS BANDERAS Y
         //PERIODOS DE INTERES SEAN LOS MISMOS.
         Objeto.B_FINAN_ADIC.GetFromControl;
         if ( Objeto.BasicCred.B_FINANC_ADIC.AsString = 'V') then
         begin
            VLvalIN:=false;
            //if Objeto.B_FINAN_ADIC.AsString<>'V' then VLvalIN:=true;
            if Objeto.B_FINAN_ADIC.AsString='V' then
            begin
               if Objeto.BasicCred.CVE_PAG_INTERES.AsString <> Objeto.CVE_PAG_INTERES.AsString then VLvalIN:=true;
               if Objeto.BasicCred.UNIDAD_TIEMPO_IN.AsString <> Objeto.UNIDAD_TIEMPO_IN.AsString then VLvalIN:=true;
               if Objeto.BasicCred.DIA_PAGO_INT.AsString <> Objeto.DIA_PAGO_INT.AsString then VLvalIN:=true;
            end;   

            if VLvalIN then
            begin
               VLMsg := 'El Activo esta configurado con Financiamiento Adicional, el Pasivo debe de estar configurado de igual manera, y los Intereses deben tener las mismas cuotas';
               VlSalida   := False;
            end;
         end;

         
         if VlSalida=true then
         begin
            Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
            Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
            Realizado := True;
         end;

         if VlSalida=false then
         begin
            MessageDlg(VLMsg, mtError, [mbOK], 0);
            Realizado := False;
         end;

      End
      Else
         Realizado := False;
   End Else Begin
      If MessageDlg('¿Desea guardar los datos modificados?', mtConfirmation,[mbYes, mbNo], 0) = mrYes Then
      begin
        Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
        Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
        Realizado := True;
      end else
         Realizado := False;
   End;
End;

procedure TwMDispFond.InterForma1DespuesAceptar(Sender: TObject);
var bCVE_MOD_FND:string;
label lbsig;
begin
  ValorRecPropios;
  If InterForma1.IsNewData Then
  Begin
     //SECCION DONDE SE REVISA SI SE TRATA DE UNA CESION DE FACTORAJE Y GENERA TODO LO NECESARIO DE PASIVOS

     RevisaGpoProd;
     if (vlGpoProd=C_FACTOR)and(edCVE_FND_ENT_DES.Text='0070025')and(vlCveCalCap='TRA') then
     begin              
        //MessageDlg('Se trata de una Cesion de Factoraje de NAFIN. Al guardar se Generara y Autorizaran los Redescuentos automaticamente', mtConfirmation, [mbOK],0 );
        If MessageDlg('El Activo es una Cesion de Factoraje Tradicional. ¿Desea Generar y Autorizar los Redescuentos con el esquema de Factoraje?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes Then
        Begin

           bCVE_MOD_FND:=C_DESCTO;
           if (rgCVE_MOD_FND.ItemIndex = -1)OR(rgCVE_MOD_FND.ItemIndex = 0) then bCVE_MOD_FND:=C_DESCTO;
           if (rgCVE_MOD_FND.ItemIndex = 1) then bCVE_MOD_FND:=C_PREST;

           if Objeto.GENFACTOPASIVO(bCVE_MOD_FND) then
           begin
              ShowMessage('Se autorizó la disposición '  + Objeto.ID_CREDITO.AsString );
              Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
              MuestraBtnAutoriza;
           end;
           goto lbsig;
        end;   
     end;

    if objeto.PCT_REDESCONTADO.AsFloat > 0 then
    Begin
       if ( Objeto.BasicCred.CVE_OPERATIVA.AsString <> CNULL ) and ( GeneraCUFEGA = True ) then
       begin
          if not FindComis then
          begin
            if MessageDlg('¿ Desea Generar Cuota Fega ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            Begin
              btComisionesClick(btComisiones);
            end;
          end
          else
            MessageDlg('No se generaran CUOTAS debido a que ya se encuentran generadas', mtError, [mbOK], 0);
       end;

       if Objeto.stpGenPeriodos then
          ShowMessage('Se guardo la Disposición Pasiva: '  + Objeto.ID_CREDITO.AsString );
     end;
  end
  else
  begin
     if Objeto.SIT_CREDITO.AsString <> CSIT_NA then
     begin
//        Objeto.MovtoFValor;    //HERJA MARZO 2014
     end;
  end;

  lbsig:
  vlGpoProd:='NIL';
  AjustaControles;

  cbDIA_PAGO_CAP.HelpContext:=7401;
  cbDIA_PAGO_INT.HelpContext:=8301;
  MuestraBtnAutoriza;
end;
//
procedure TwMDispFond.InterForma1AntesEliminar(Sender: TObject; var Realizado: Boolean);
begin
   If (MessageDlg('¿Desea eliminar los periodos de capital, interés y comisiones relacionadas?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then Begin
      EliminaPeriodos;
   End;
end;
//

procedure TwMDispFond.InterForma1DespuesNuevo(Sender: TObject);
var B_fvenc: boolean;
    sSQL :  String;
    qyQuery : TQuery;
begin
   Objeto.ID_CREDITO.AsInteger:= Objeto.BasicCred.ID_CREDITO.AsInteger;
   Objeto.CreCto.FindKey([Objeto.BasicCred.ID_CONTRATO.AsString,
                          Objeto.BasicCred.FOL_CONTRATO.AsString]);
   icpCONTRATO.RefrescaInfo;
   ObtFechas;
   Objeto.SDO_VIG_DISP_ACT.AsFloat:= Objeto.stpObtSdoVigente; // Objeto.BasicCred.SDO_VIG_TOTAL.AsFloat; // LOLS
   Objeto.IMP_CREDITO.AsFloat     := 0;
   Objeto.SDO_INSOLUTO.AsFloat    := 0;
   Objeto.SDO_FINAN_ADIC.AsFloat  := 0;
   Objeto.SDO_VIG_TOTAL.AsFloat   := 0;
   Objeto.SIT_CREDITO.AsString    := CSIT_NA;

   if Objeto.SDO_VIG_DISP_ACT.AsFloat=0 then
      ShowMessage('PRECAUCION: El Saldo Vigente es CERO, el calculo del Redescuento sera CERO tambien, favor de revisar');

   { DATOS HEREDADOS DE LA DISPOSICION ACTIVA  }
   Objeto.CalcInt.FindKey([Objeto.BasicCred.CVE_CALCULO.AsString]);
   Objeto.CVE_TIPO_TASA.AsString    := Objeto.BasicCred.CVE_TIPO_TASA.AsString;
   Objeto.CVE_TASA_REFER.AsString   := Objeto.BasicCred.CVE_TASA_REFER.AsString;
   Objeto.TasaRefer.FindKey([Objeto.BasicCred.CVE_TASA_REFER.AsString]);
   Objeto.OPERADOR_STASA.AsString   := Objeto.BasicCred.OPERADOR_STASA.AsString;
   //Objeto.SOBRETASA.AsString        := Objeto.BasicCred.SOBRETASA.AsString; // LOLS 08 03 2005
   Objeto.SOBRETASA.AsFloat         := 0;
   Objeto.UTiempoTasa.FindKey([ Objeto.BasicCred.UNIDAD_TIEMPO_RE.AsString ]);
   Objeto.NUM_UNIDADES_RE.AsString  := Objeto.BasicCred.NUM_UNIDADES_RE.AsString;
   Objeto.DIA_REVISION.AsString     := Objeto.BasicCred.DIA_REVISION.AsString;
   Objeto.F_PROX_REVISION.AsString  := Objeto.BasicCred.F_PROX_REVISION.AsString;
   Objeto.B_FINAN_ADIC.AsString     := Objeto.BasicCred.B_FINANC_ADIC.AsString;

   //HERJA


   Objeto.MInstDesc.BuscaWhereString := ' CVE_FND_ENT_DES IN ( SELECT CVE_FND_ENT_DES '+
                                                               ' FROM CR_PROD_FND_ENT '+
				                              ' WHERE CVE_PRODUCTO_GPO IN (SELECT CVE_PRODUCTO_GPO '+
                                                                                           ' FROM CR_PRODUCTO '+
					                                                  ' WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE '+
                                                                                                                       ' FROM CR_CONTRATO '+
					                                                                              ' WHERE ID_CONTRATO IN (SELECT ID_CONTRATO '+
				                                                                                                              ' FROM CR_CREDITO '+
                                                                                                                                             ' WHERE ID_CREDITO='+IntToStr(Objeto.ID_CREDITO.AsInteger)+
					                                                                                                    ' ) '+
                                                                                                                     ' ) '+
					                                                 ' ) '+
                                                           ' ) ';

   B_fvenc:=false;
   {
   vlSql := ' SELECT F_VENCIMIENTO FROM CR_FND_CREDITO ' +
            ' WHERE ID_CREDITO = ' +  edID_CREDITO.Text +
            '  AND SIT_CREDITO NOT IN (''CA'',''LQ'') '+
            '  ORDER BY F_VENCIMIENTO DESC ';

    vlQry := GetSQLQuery(vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
    if vlQry <> nil then
    begin
      if vlQry.IsEmpty = False then
      begin
        vlQry.First;
        Objeto.F_INICIO.AsDateTime := vlQry.FieldByName('F_VENCIMIENTO').AsDateTime + 1;
        B_fvenc:=true;
      end;
      vlQry.Close;
      vlQry.Free;
    end;
    }
    if B_fvenc=false then
    begin
       Objeto.CVE_AMORTIZACION.AsString := Objeto.BasicCred.CVE_AMORTIZACION.AsString;
       Objeto.CVE_PAG_INTERES.AsString  := Objeto.BasicCred.CVE_PAG_INTERES.AsString;
       Objeto.DIA_PAGO_CAP.AsString     := Objeto.BasicCred.DIA_PAGO_CAP.AsString;
       Objeto.DIA_PAGO_INT.AsString     := Objeto.BasicCred.DIA_PAGO_INT.AsString;
       Objeto.F_INI_PAG_CAP.AsString    := Objeto.BasicCred.F_INI_PAG_CAP.AsString;
       Objeto.F_INI_PAG_INT.AsString    := Objeto.BasicCred.F_INI_PAG_INT.AsString;
       Objeto.NUM_UNIDADES_CP.AsString  := Objeto.BasicCred.NUM_UNIDADES_CP.AsString;
       Objeto.NUM_UNIDADES_IN.AsString  := Objeto.BasicCred.NUM_UNIDADES_IN.AsString;
       Objeto.UTiempoCap.FindKey([ Objeto.BasicCred.UNIDAD_TIEMPO_CP.AsString ]);
       Objeto.UTiempoInt.FindKey([ Objeto.BasicCred.UNIDAD_TIEMPO_IN.AsString ]);

       edF_PROX_REVISION.Text:='';
       edF_INI_PAG_CAP.Text:='';
       edF_INI_PAG_INT.Text:='';

       Objeto.F_INI_PAG_CAP.GetFromControl;
       Objeto.F_INI_PAG_INT.GetFromControl;
       Objeto.F_PROX_REVISION.GetFromControl;
   end;

   if Objeto.TipoAmort.FindKey([Objeto.BasicCred.CVE_AMORTIZACION.AsString]) then
   begin
      edDESC_TIPO_AMORT.Hint := Objeto.TipoAmort.DESC_AMORTIZA.AsString;
      edDESC_TIPO_AMORT.ShowHint := True;
   end;

   if Objeto.PagoInt.FindKey([Objeto.BasicCred.CVE_PAG_INTERES.AsString]) then
   begin
      edDESC_PAGO_INT.Hint := Objeto.PagoInt.DESC_PAG_INTERES.AsString;
      edDESC_PAGO_INT.ShowHint := True;
   end;

   //LEE LA MODALIDAD DE FONDEO DEL PROGRAMA
   sSQL:= 'SELECT CVE_MOD_FND FROM CR_FND_PROGRAMA '+
          ' WHERE CVE_FND_ENT_DES ='+ SQLStr(Objeto.CVE_FND_ENT_DES.AsString) +
          '   AND CVE_FND_PROGRAMA ='+  SQLStr(Objeto.CVE_FND_PROGRAMA.AsString);
   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then
   Begin
      If qyQuery.FieldByName('CVE_MOD_FND').AsString = 'DS' then
         rgCVE_MOD_FND.ItemIndex:=0;
      If qyQuery.FieldByName('CVE_MOD_FND').AsString = 'PR' then
         rgCVE_MOD_FND.ItemIndex:=1;
   End;
   qyQuery.Free;

   {RevisaGpoProd;
   if vlGpoProd=C_FACTOR then
   begin
      //AjustaControles;
      MessageDlg('Se trata de una Cesion de Factoraje, seleccione la Entidad Descontadora y Programas. Al guardar se Generara y Autorizaran los Redescuentos automaticamente', mtConfirmation, [mbOK],0 );
   end;
   //FIN HERJA
    }

   { ASIGNACION DE VARIABLES INTERNAS }
   VerificaTasaRefer;
   ValorTasaCred;
   ValorRecPropios;
   ModificaControl;
   { DATOS DE CONTROL }
   rgCVE_TIPO_ANUAL.ItemIndex:=0;
   rgCVE_TIPO_MES.ItemIndex:=1;
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;

   MuestraBtnAutoriza;
   { COLOCA EL FOCO }
   if edCVE_FND_ENT_DES.CanFocus then
      edCVE_FND_ENT_DES.SetFocus;
end;
//
procedure TwMDispFond.InterForma1AntesModificar(Sender: TObject;  var Realizado: Boolean);
begin
   AjustaControles;
   
   {RevisaGpoProd;
   if vlGpoProd=C_FACTOR then
   begin
      AjustaControles;
      edCVE_FND_ENT_DES.Tag   := 0;
      btCVE_FND_ENT_DES.Tag   := 0;
      ilCVE_FND_ENT_DES.Tag   := 0;

      edCVE_FND_PROGRAMA.Tag   := 0;
      btCVE_FND_PROGRAMA.Tag   := 0;
      ilCVE_FND_PROGRAMA.Tag   := 0;

      edCVE_ORIGEN_REC.Tag   := 0;
      btCVE_ORIGEN_REC.Tag   := 0;
      ilCVE_ORIGEN_REC.Tag   := 0;

      rgCVE_MOD_FND.Tag   := 0;
   end;}
end;
//
procedure TwMDispFond.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;

   Objeto.BasicCred := CreaTBCredito(Objeto.ID_CREDITO.AsInteger, Objeto.Apli);
   Objeto.CreCto.FindKey([Objeto.BasicCred.ID_CONTRATO.AsString,
                          Objeto.BasicCred.FOL_CONTRATO.AsString]);
   icpCONTRATO.RefrescaInfo;
   ModificaControl;
   ValorRecPropios;

    //HERJA
   //RevisaGpoProd;
   //if vlGpoProd<>C_FACTOR then
   //begin
      Objeto.F_INI_PAG_CAP.GetFromControl;
      Objeto.F_INI_PAG_INT.GetFromControl;
      VerPagoCap;
      VerPagoInt;
   //end;

   edCVE_ORIGEN_REC.SetFocus;
end;




procedure TwMDispFond.InterForma1Buscar(Sender: TObject);
begin
   If Objeto.vgIdCredito <> 0 Then Begin
      Objeto.BuscaWhereString := 'CR_FND_CREDITO.ID_CREDITO =' +
                                   IntToStr(Objeto.vgIdCredito);
      Objeto.FilterString := Objeto.BuscaWhereString;
   End Else Begin
      Objeto.BuscaWhereString := '';
      Objeto.FilterString := Objeto.BuscaWhereString;
   End;
   If Objeto.Busca Then Begin
      icpCONTRATO.RefrescaInfo;
      Objeto.MInstDesc.FindKey([Objeto.CVE_FND_ENT_DES.AsString]);
      Objeto.MPrgApoyo.FindKey([Objeto.CVE_FND_ENT_DES.AsString,
                                Objeto.CVE_FND_PROGRAMA.AsString]);
      ValorRecPropios;
      VerificaTasaRefer;

      //MUESTRA SI EL CREDITO FUE CANCELADO POR RESCATE
      Lmsg_rescate.Caption:='';
      vlSql5 :=' SELECT F_RESCATE FROM CR_FND_CREDITO WHERE 1=1 ' +
              ' AND ID_CREDITO = ' +edID_CREDITO.Text+
              ' AND CVE_FND_ENT_DES = '''+edCVE_FND_ENT_DES.Text+'''' +
              ' AND CVE_FND_PROGRAMA = '''+edCVE_FND_PROGRAMA.Text+'''' +
              ' AND CVE_CA_FND = ''DP'' ';

      vlQry5 := GetSQLQuery(vlSql5,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      try
        if vlQry5 <> nil then  Lmsg_rescate.Caption:='CANCELADO POR RESCATE EL DIA: '+DateToStr(vlQry5.FieldByName('F_RESCATE').AsDateTime);
      finally
          if vlQry5 <> nil then vlQry.free;
      end;
      //RevisaGpoProd;
   End;
   MuestraBtnAutoriza;
end;




procedure TwMDispFond.InterForma1DespuesShow(Sender: TObject);
begin
   icpCONTRATO.RefrescaInfo;
   ValorRecPropios;

      //MUESTRA SI EL CREDITO FUE CANCELADO POR RESCATE
      Lmsg_rescate.Caption:='';
      vlSql5 :=' SELECT F_RESCATE FROM CR_FND_CREDITO WHERE 1=1 ' +
              ' AND ID_CREDITO = ' +edID_CREDITO.Text+
              ' AND CVE_FND_ENT_DES = '''+edCVE_FND_ENT_DES.Text+'''' +
              ' AND CVE_FND_PROGRAMA = '''+edCVE_FND_PROGRAMA.Text+'''' +
              ' AND CVE_CA_FND = ''DP'' ';

      vlQry5 := GetSQLQuery(vlSql5,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      try
        if vlQry5 <> nil then  Lmsg_rescate.Caption:='CANCELADO POR RESCATE EL DIA: '+DateToStr(vlQry5.FieldByName('F_RESCATE').AsDateTime);
      finally
          if vlQry5 <> nil then vlQry.free;
      end;   
end;


{
+------------------------------------------------------------------------------+
|                                                                              |
|                    E V E N T O S   D E   L A   F O R M A                     |
|                                                                              |
+------------------------------------------------------------------------------+
}


{                         ENTIDAD DESCONTADORA                                 }
procedure TwMDispFond.ilCVE_FND_ENT_DESCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;
//
procedure TwMDispFond.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   If Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) Then
      InterForma1.NextTab(edCVE_FND_ENT_DES);
end;
//
procedure TwMDispFond.btCVE_FND_ENT_DESClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMDISPFOND_INST',True,True) then
   begin
       If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
          Objeto.ID_CREDITO.GetFromControl;
          Objeto.MInstDesc.ShowAll := True;
          If Objeto.MInstDesc.Busca Then
             InterForma1.NextTab(edCVE_FND_ENT_DES);
       End;
   end;
end;
//
procedure TwMDispFond.edCVE_FND_ENT_DESExit(Sender: TObject);
Var
   VLSalida  :  boolean;
   VLMsg     :  String;
   sSQL: String;
   qyQuery: TQuery;
   vlPROD_GPO: string;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then Begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.CVE_FND_ENT_DES.GetFromControl;
      If Objeto.CVE_FND_ENT_DES.AsString = '' Then Begin
         VLMsg := 'Favor de Indicar la Institución o Entidad descontadora';
         VlSalida   := False;
      End;

      vlPROD_GPO:='';
      //HERJA VALIDA QUE LA ENTIDAD SE ENCUENTRE DENTRO DE LAS CONFIGURADAS PARA EL PRODUCTO
      sSQL:=' SELECT CVE_PRODUCTO_GPO '+
           ' FROM CR_PRODUCTO '+
          ' WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE '+
                                       ' FROM CR_CONTRATO '+
                                      ' WHERE ID_CONTRATO IN (SELECT ID_CONTRATO '+
                                                              ' FROM CR_CREDITO '+
                                                             ' WHERE ID_CREDITO='+IntToStr(Objeto.ID_CREDITO.AsInteger)+
                                                            ' ) '+
                                     ' ) ';

      qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      If qyQuery <> Nil Then
      Begin
         vlPROD_GPO:= qyQuery.FieldByName('CVE_PRODUCTO_GPO').AsString;
         qyQuery.close;
      End;

      if (vlPROD_GPO<>'')and(Trim(edCVE_FND_ENT_DES.Text)<>'') then
      begin
         sSQL:=' SELECT * FROM CR_PROD_FND_ENT ' +
               ' WHERE CVE_PRODUCTO_GPO = '''+vlPROD_GPO+''''+
               '   AND CVE_FND_ENT_DES = '''+edCVE_FND_ENT_DES.Text+'''';

         qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
         If qyQuery = Nil Then //LA ENTIDAD NO SE ENCUENTRA ASOCIADA AL GRUPO PRODUCTO
         Begin
            VLMsg := 'La Entidad Descontadora no esta asociada a este Grupo Producto';
            VlSalida   := False;

            edCVE_FND_ENT_DES.Text:='';
            edNOM_FND_ENT_DES.Text:='';
         End
         else
           qyQuery.close;
      end;

{      if (Objeto.Modo=moAppend) then
      begin
         edCVE_FND_PROGRAMA.Text:='';
         edNOM_FND_PROGRAMA.Text:='';
         edCVE_ORIGEN_REC.Text:='';
         edNOM_ORIGEN_REC.Text:='';
      end;
 }
      InterForma1.ValidaExit(edCVE_FND_ENT_DES,VLSalida,VLMsg,True);
   End;
end;




{                                PROGRAMA DE APOYO                             }
procedure TwMDispFond.ilCVE_FND_PROGRAMACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;
//
procedure TwMDispFond.ilCVE_FND_PROGRAMAEjecuta(Sender: TObject);
begin
   If Objeto.MPrgApoyo.FindKey([Objeto.CVE_FND_ENT_DES.AsString,
                                ilCVE_FND_PROGRAMA.Buffer]) Then
      InterForma1.NextTab(edCVE_FND_PROGRAMA);
end;
//
procedure TwMDispFond.btCVE_FND_PROGRAMAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMDISPFOND_PROG',True,True) then
   begin
     If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
        Objeto.CVE_FND_ENT_DES.GetFromControl;
        Objeto.MPrgApoyo.BuscaWhereString :=
              'CR_FND_PROGRAMA.CVE_FND_ENT_DES =' + #39 + Objeto.CVE_FND_ENT_DES.AsString+ #39;
        Objeto.MPrgApoyo.FilterString := Objeto.MPrgApoyo.BuscaWhereString;
        Objeto.MPrgApoyo.ShowAll := True;
        If Objeto.MPrgApoyo.Busca Then
           InterForma1.NextTab(edCVE_FND_PROGRAMA);
     End;
   end;
end;
//
procedure TwMDispFond.edCVE_FND_PROGRAMAExit(Sender: TObject);
Var
   VLSalida  :  boolean;
   VLMsg, sSQL :  String;
   qyQuery: TQuery;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then Begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.CVE_FND_PROGRAMA.GetFromControl;
      If Objeto.CVE_FND_PROGRAMA.AsString = '' Then Begin
         VLMsg := 'Favor de Indicar el Programa de Apoyo';
         VlSalida   := False;
      End Else Begin
         If InterForma1.IsNewData Then
         Begin
            sSQL:= 'SELECT * FROM CR_FND_CREDITO '+
                   ' WHERE ID_CREDITO ='+ Objeto.ID_CREDITO.AsSQL +
                   '   AND CVE_FND_ENT_DES ='+ Objeto.CVE_FND_ENT_DES.AsSQL +
                   '   AND CVE_FND_PROGRAMA ='+ Objeto.CVE_FND_PROGRAMA.AsSQL +
                   '   AND SIT_CREDITO IN (''AC'', ''NA'')' ; //HERJA
            qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            If qyQuery <> Nil Then Begin
               If qyQuery.FieldByName('ID_CREDITO').AsInteger = Objeto.ID_CREDITO.AsInteger Then Begin
                  VLMsg := 'El registro ya existe';
                  VlSalida   := False;
               End;
               qyQuery.Free;
            End;

            //HERJA MARZO 2014
            if Objeto.MPrgApoyo.B_CFG_DIAS_TASA.AsString = 'V' then
               ch_CalculoInteresEspecial.Checked:=True
            else
               ch_CalculoInteresEspecial.Checked:=False;
            //FIN HERJA MARZO 2014
         End;
      End;
      InterForma1.ValidaExit(edCVE_FND_PROGRAMA,VLSalida,VLMsg,True);
   End;
end;


{                                ORIGEN DE RECURSOS                            }
procedure TwMDispFond.ilCVE_ORIGEN_RECCapture(Sender: TObject; var Show: Boolean);
begin
  Show:= ( (InterForma1.CanEdit) and ( Objeto.SIT_CREDITO.AsString = CSIT_NA) ) Or (InterForma1.IsNewData);
end;
//
procedure TwMDispFond.ilCVE_ORIGEN_RECEjecuta(Sender: TObject);
begin
   If Objeto.OrigRec.FindKey([ilCVE_ORIGEN_REC.Buffer]) Then
       InterForma1.NextTab(edCVE_ORIGEN_REC);
end;
//
procedure TwMDispFond.btCVE_ORIGEN_RECClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMDISPFOND_ORIG',True,True) then
   begin
     Objeto.OrigRec.ShowAll := True;
     If Objeto.OrigRec.Busca Then
        InterForma1.NextTab(edCVE_ORIGEN_REC);
   end;
end;
//
procedure TwMDispFond.edCVE_ORIGEN_RECExit(Sender: TObject);
Var
   VLSalida  :  boolean;
   VLMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then Begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.CVE_ORIGEN_REC.GetFromControl;
      If Objeto.CVE_ORIGEN_REC.AsString = '' Then Begin
         VLMsg := 'Favor de Indicar el origen de los recursos de la disposición pasiva';
         VlSalida   := False;
      End;
      InterForma1.ValidaExit(edCVE_ORIGEN_REC,VLSalida,VLMsg,True);
   End;
end;


{                            FECHA DE INICO DE LA DISPOSICION                 }
procedure TwMDispFond.edF_INICIOExit(Sender: TObject);
Var
   VLSalida  :  boolean;
   VLMsg     :  String;
   Qry1: TQuery;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then Begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.F_INICIO.GetFromControl;
      Objeto.F_VENCIMIENTO.GetFromControl;
      If Objeto.F_INICIO.AsString = '' Then Begin
         Objeto.F_INICIO.AsDateTime:= Objeto.BasicCred.F_INICIO.AsDateTime;
         Objeto.F_VENCIMIENTO.AsDateTime:= Objeto.BasicCred.F_VENCIMIENTO.AsDateTime;
      End Else Begin
         If ValidaFecha(Objeto.F_INICIO.AsDateTime,Objeto.Apli) <> 0 Then Begin
            vlMsg := ' La fecha de inicio es un día no hábil';
            vlSalida := False;
         End;
         If Objeto.F_INICIO.AsDateTime < Objeto.BasicCred.F_INICIO.AsDateTime Then
         Begin
            VLMsg := 'La fecha de Inicio debe ser mayor al Inicio de la Disposión';
            VlSalida   := False;
         End
         Else
         If Objeto.F_INICIO.AsDateTime >= Objeto.BasicCred.F_VENCIMIENTO.AsDateTime Then
         Begin
            VLMsg := 'La fecha de Inicio debe ser menor al Vencimiento de la Disposión';
            VlSalida   := False;
         End;

         {
         Qry1 := TQuery.Create(Self);
         Qry1.DatabaseName := Objeto.Apli.DataBaseName;
         Qry1.SessionName  := Objeto.Apli.SessionName;
         Qry1.close;
         Qry1.SQL.Text:= ' SELECT F_INICIO, F_VENCIMIENTO, CVE_FND_ENT_DES, CVE_FND_PROGRAMA'+
                         ' FROM CR_FND_CREDITO '+
                         ' WHERE ID_CREDITO ='+ Objeto.ID_CREDITO.AsString+
                         ' AND SIT_CREDITO NOT IN (''CA'',''LQ'') ';
         Qry1.Open;
         while (Qry1.Eof=FALSE)and(VlSalida=true) do
         begin
            if (Objeto.F_INICIO.AsDateTime>=Qry1.FieldByName('F_INICIO').AsDateTime)and(Objeto.F_INICIO.AsDateTime<=Qry1.FieldByName('F_VENCIMIENTO').AsDateTime) then
            begin
               VLMsg := 'La Fecha de Inicio esta dentro del pasivo de la Entidad '+
                         Qry1.FieldByName('CVE_FND_ENT_DES').AsString+ ' Programa '+Qry1.FieldByName('CVE_FND_PROGRAMA').AsString;
               VlSalida   := False;
            end;
            Qry1.Next;
         end;
         Qry1.Close;
         Qry1.Free;
         }

      End;
      If (Objeto.F_VENCIMIENTO.AsDateTime <= Objeto.F_INICIO.AsDateTime) And
         (Objeto.F_VENCIMIENTO.AsDateTime > Objeto.BasicCred.F_VENCIMIENTO.AsDateTime)Then
         Objeto.F_VENCIMIENTO.AsDateTime:= Objeto.BasicCred.F_VENCIMIENTO.AsDateTime;
      Objeto.DIAS_PLAZO.AsInteger:= Objeto.F_VENCIMIENTO.AsInteger - Objeto.F_INICIO.AsInteger;
      VerificaTasaRefer; { Valida el valor de la tasa de referencia  }
      ValorTasaCred;     { Valida el valor de la tasa de redescuento }
      InterForma1.ValidaExit(edF_INICIO,VLSalida,VLMsg,True);
   End;
end;

{                            PLAZO DE LA DISPOSICION                           }
procedure TwMDispFond.btDIASPLAZOClick(Sender: TObject);
begin
   If Objeto.Active Then
      edDIAS_PLAZO.Text:= VentanaCalculo(Objeto.DIAS_PLAZO.AsString);
end;
//
procedure TwMDispFond.edDIAS_PLAZOExit(Sender: TObject);
Var
   VLSalida  :  boolean;
   VLMsg     :  String;
Begin
   If ( ((Objeto.Modo = moEdit) AND (Objeto.SIT_CREDITO.AsString='NA')) //HERJA MARZO 2014
       Or (Objeto.Modo=moAppend)) Then Begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.F_INICIO.GetFromControl;
      Objeto.DIAS_PLAZO.GetFromControl;
      If Objeto.DIAS_PLAZO.AsInteger <= 0  Then
         Objeto.DIAS_PLAZO.AsInteger:=1;

      If Objeto.DIAS_PLAZO.AsInteger > Objeto.BasicCred.DIAS_PLAZO.AsInteger Then Begin
         vlMsg := ' El plazo deben ser menor al plazo de la disposición';
         vlSalida := False;
      End
      Else
      Begin
         Objeto.F_VENCIMIENTO.AsDateTime:= Objeto.F_INICIO.AsDateTime + StrToInt(edDIAS_PLAZO.Text);

         Objeto.UTiempoTasa.BuscaWhereString := 'CR_UNIDAD_TIEMPO.NUM_DIAS < ' + Objeto.DIAS_PLAZO.AsString;
         Objeto.UTiempoTasa.FilterString := Objeto.UTiempoTasa.BuscaWhereString;

         //HERJA
         Objeto.UTiempoCap.BuscaWhereString := 'CR_UNIDAD_TIEMPO.NUM_DIAS < ' + Objeto.DIAS_PLAZO.AsString;
         Objeto.UTiempoCap.FilterString := Objeto.UTiempoCap.BuscaWhereString;

         Objeto.UTiempoInt.BuscaWhereString := 'CR_UNIDAD_TIEMPO.NUM_DIAS < ' + Objeto.DIAS_PLAZO.AsString;
         Objeto.UTiempoInt.FilterString := Objeto.UTiempoInt.BuscaWhereString;

         edPCT_REDESCONTADO.Text:='0.00';
         Objeto.PCT_REDESCONTADO.GetFromControl;
         ValorRecPropios;

         if (StrToFloat(edPCT_REC_P.Text) < 0 ) then
         begin
            vlMsg := ' El porcentaje Redescontado es MAYOR a 100, revise los Pasivos existentes';
            vlSalida := False;
         end;
         // FIN HERJA
      End;
      InterForma1.ValidaExit(edDIAS_PLAZO,VLSalida,VLMsg,True);
   End;
end;

{                   FECHA DE VENCIMIENTO DE LA DISPOSICION                     }
procedure TwMDispFond.edF_VENCIMIENTOExit(Sender: TObject);
Var
   VLSalida  :  boolean;
   VLMsg     :  String;
   Qry1: TQuery;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then Begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.F_VENCIMIENTO.GetFromControl;
      If Objeto.F_VENCIMIENTO.AsString = '' Then
         Objeto.F_VENCIMIENTO.AsDateTime:= Objeto.F_INICIO.AsDateTime + Objeto.DIAS_PLAZO.AsInteger
      Else Begin
         If Objeto.F_VENCIMIENTO.AsDateTime < Objeto.F_INICIO.AsDateTime Then Begin
            VLMsg := 'La fecha de Vencimiento debe ser mayor a la fecha de Inicio';
            VlSalida   := False;
         End;
         If ValidaFecha(Objeto.F_VENCIMIENTO.AsDateTime,Objeto.Apli) <> 0 Then Begin
            vlMsg := ' ';
            If MessageDlg('La fecha de vencimiento es un día inhábil. ¿Desea Continuar?',
              mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Begin
               vlMsg := ' La fecha de vencimiento es un día inhábil';
               vlSalida := False;
            End;
         End;
         Objeto.DIAS_PLAZO.AsInteger:= Objeto.F_VENCIMIENTO.AsInteger - Objeto.F_INICIO.AsInteger;
         If Objeto.DIAS_PLAZO.AsInteger <= 0 Then Begin
            vlMsg := 'Los días de Plazo no pueden ser menores o iguales a cero';
            vlSalida := False;
         End;

         {
         Qry1 := TQuery.Create(Self);
         Qry1.DatabaseName := Objeto.Apli.DataBaseName;
         Qry1.SessionName  := Objeto.Apli.SessionName;
         Qry1.close;
         Qry1.SQL.Text:= ' SELECT F_INICIO, F_VENCIMIENTO, CVE_FND_ENT_DES, CVE_FND_PROGRAMA'+
                         ' FROM CR_FND_CREDITO '+
                         ' WHERE ID_CREDITO ='+ Objeto.ID_CREDITO.AsString+
                         ' AND SIT_CREDITO NOT IN (''CA'',''LQ'') ';
         Qry1.Open;
         while (Qry1.Eof=FALSE)and(VlSalida=true) do
         begin
            if (Objeto.F_VENCIMIENTO.AsDateTime>=Qry1.FieldByName('F_INICIO').AsDateTime)and(Objeto.F_VENCIMIENTO.AsDateTime<=Qry1.FieldByName('F_VENCIMIENTO').AsDateTime) then
            begin
               VLMsg := 'La Fecha de Vencimiento esta dentro del pasivo de la Entidad '+
                         Qry1.FieldByName('CVE_FND_ENT_DES').AsString+ ' y Programa '+Qry1.FieldByName('CVE_FND_PROGRAMA').AsString;
               VlSalida   := False;
            end;
            Qry1.Next;
         end;
         Qry1.Close;
         Qry1.Free;
         }

         Objeto.UTiempoTasa.BuscaWhereString := 'CR_UNIDAD_TIEMPO.NUM_DIAS < ' + Objeto.DIAS_PLAZO.AsString;
         Objeto.UTiempoTasa.FilterString := Objeto.UTiempoTasa.BuscaWhereString;

         //HERJA
         Objeto.UTiempoCap.BuscaWhereString := 'CR_UNIDAD_TIEMPO.NUM_DIAS < ' + Objeto.DIAS_PLAZO.AsString;
         Objeto.UTiempoCap.FilterString := Objeto.UTiempoCap.BuscaWhereString;

         Objeto.UTiempoInt.BuscaWhereString := 'CR_UNIDAD_TIEMPO.NUM_DIAS < ' + Objeto.DIAS_PLAZO.AsString;
         Objeto.UTiempoInt.FilterString := Objeto.UTiempoInt.BuscaWhereString;
         //FIN HERJA
      End;
      InterForma1.ValidaExit(edF_VENCIMIENTO,VLSalida,VLMsg,True);
   End;
end;

{                PORCENTAJE REDESCONTADO DE LA DISPOSICION                     }
procedure TwMDispFond.edPCT_REDESCONTADOExit(Sender: TObject);
Var
   VLSalida  :  boolean;
   VLMsg, vlimp_lim     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then Begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.PCT_REDESCONTADO.GetFromControl;
      If Objeto.PCT_REDESCONTADO.AsFloat < 0 Then Begin
         VLMsg := 'Favor de Indicar el porcentaje';
         VlSalida   := False;
      End Else If Objeto.PCT_REDESCONTADO.AsFloat > 100 Then Begin
         VLMsg := 'El porcentaje deber ser menor o igual a 100';
         VlSalida   := False;
      End Else If StrToFloat(edPCT_REC_P.Text) < 0 Then Begin
         VLMsg := 'El porcentaje TOTAL no deber ser mayor a 100';
         VlSalida   := False;
      End;

      ValorRecPropios;

      if (StrToFloat(edPCT_REC_P.Text) < 0 ) then
      begin
         VLMsg := 'El porcentaje TOTAL no deber ser mayor a 100, revise Pasivos existentes';
         edPCT_REDESCONTADO.Text:='0.00';
         Objeto.PCT_REDESCONTADO.GetFromControl;
         edIMP_REDESCONTADO.Text:='0.00';
         Objeto.IMP_REDESCONTADO.GetFromControl;
         ValorRecPropios;
         VlSalida   := False;
      end ;

      Objeto.SDO_VIG_DISP_ACT.AsFloat:= Objeto.stpObtSdoVigente;
      Objeto.IMP_REDESCONTADO.AsFloat:= (Objeto.SDO_VIG_DISP_ACT.AsFloat *
                                         Objeto.PCT_REDESCONTADO.AsFloat)/100;
//      ValorRecPropios;

      if RevisaImpLimite(vlimp_lim)=false then
      begin
         VLMsg := 'Se excede el Importe Limite de la Entidad Descontadora $'+vlimp_lim;
         edPCT_REDESCONTADO.Text:='0.00';
         Objeto.PCT_REDESCONTADO.GetFromControl;
         edIMP_REDESCONTADO.Text:='0.00';
         Objeto.IMP_REDESCONTADO.GetFromControl;         
         ValorRecPropios;
         VlSalida   := False;
      end;

      InterForma1.ValidaExit(edPCT_REDESCONTADO,VLSalida,VLMsg,True);
   End;
end;

{                  IMPORTE REDESCONTADO DE LA DISPOSICION                      }
procedure TwMDispFond.edIMP_REDESCONTADOExit(Sender: TObject);
Var
   VLSalida  :  boolean;
   VLMsg, vlimp_lim     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then Begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.IMP_REDESCONTADO.GetFromControl;
      If Objeto.IMP_REDESCONTADO.AsFloat < 0 Then Begin
         VLMsg := 'Favor de Indicar el Importe';
         VlSalida   := False;
      End Else Begin
         Objeto.SDO_VIG_DISP_ACT.AsFloat:= Objeto.stpObtSdoVigente;
         If Objeto.SDO_VIG_DISP_ACT.AsFloat <> 0 Then
         begin
            Objeto.PCT_REDESCONTADO.AsFloat:= (Objeto.IMP_REDESCONTADO.AsFloat*100)/Objeto.SDO_VIG_DISP_ACT.AsFloat;

            ValorRecPropios;
            if (StrToFloat(edPCT_REC_P.Text) < 0 ) then
            begin
               VLMsg := 'El porcentaje TOTAL no deber ser mayor a 100, revise Pasivos existentes';
               edPCT_REDESCONTADO.Text:='0.00';
               Objeto.PCT_REDESCONTADO.GetFromControl;

               edIMP_REDESCONTADO.Text:='0.00';
               Objeto.IMP_REDESCONTADO.GetFromControl;
               ValorRecPropios;
               VlSalida   := False;
            end ;
         end;
      End;

      if RevisaImpLimite(vlimp_lim)=false then
      begin
         VLMsg := 'Se excede el Importe Limite de la Entidad Descontadora $'+vlimp_lim;
         edPCT_REDESCONTADO.Text:='0.00';
         Objeto.PCT_REDESCONTADO.GetFromControl;

         edIMP_REDESCONTADO.Text:='0.00';
         Objeto.IMP_REDESCONTADO.GetFromControl;
  //       ValorRecPropios;
         VlSalida   := False;
      end;


      InterForma1.ValidaExit(edIMP_REDESCONTADO,VLSalida,VLMsg,True);
   End;
   ValorRecPropios;
end;





{                    CALCULO DE LOS INTERESES PASIVOS                          }
procedure TwMDispFond.ilCVE_CALCULOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;
//
procedure TwMDispFond.ilCVE_CALCULOEjecuta(Sender: TObject);
begin
   If Objeto.CalcInt.FindKey([ilCVE_CALCULO.Buffer]) Then
      InterForma1.NextTab(edCVE_CALCULO);
end;
//
procedure TwMDispFond.btCVE_CALCULOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMDISPFOND_CALIN',True,True) then
   begin
     Objeto.CalcInt.BuscaWhereString := 'CR_CALCULO_INT.B_INTERES_ORD =' + #39 + 'V'+ #39;
     Objeto.CalcInt.FilterString := Objeto.CalcInt.BuscaWhereString;
     Objeto.CalcInt.ShowAll := True;
     If Objeto.CalcInt.Busca Then
        InterForma1.NextTab(edCVE_CALCULO);
   end;
end;
//
procedure TwMDispFond.edCVE_CALCULOExit(Sender: TObject);
Var
   VLSalida  :  boolean;
   VLMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then Begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.CVE_CALCULO.GetFromControl;
      If Objeto.CVE_CALCULO.AsString = '' Then Begin
         VLMsg := 'Favor de Indicar la clave de cálculo de intereses';
         VlSalida   := False;
      End
      // </ RABA > OCT 2011  SE VALIDA QUE LA CLAVE DE CALCULO Y EL CÁLCULO DE
      // INTERES ESPECIAL SEAN CORRESPONDIDOS A "IN" Y "RE"
      Else Begin
        If (Objeto.CVE_CALCULO.AsString <> 'IN') AND (Objeto.CVE_CALCULO.AsString <> 'RE') AND (ch_CalculoInteresEspecial.Checked) Then
        Begin
           VLMsg := 'La clave de cálculo de interés no aplica con el cálculo de interés especial.';
           VlSalida   := False;
        End;
      End;
      // < RABA />
      InterForma1.ValidaExit(edCVE_CALCULO,VLSalida,VLMsg,True);
   End;
end;

{                    TIPO DE TASA - FIJA O VARIABLE -                          }
procedure TwMDispFond.rgCVE_TIPO_TASAClick(Sender: TObject);
begin
   ModificaControl;
end;
//
procedure TwMDispFond.rgCVE_TIPO_TASAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_TIPO_TASA,True,'',True);
end;

{                    TASA DE REFERENCIA - TIIE LIBOR                           }
procedure TwMDispFond.ilCVE_TASA_REFEREjecuta(Sender: TObject);
begin
   If Objeto.TasaRefer.FindKey([ilCVE_TASA_REFER.Buffer]) Then
       InterForma1.NextTab(edCVE_TASA_REFER);
end;
//
procedure TwMDispFond.ilCVE_TASA_REFERCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;
//
procedure TwMDispFond.edCVE_TASA_REFERExit(Sender: TObject);
Var
   VLSalida  :  boolean;
   VLMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then Begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.CVE_TASA_REFER.GetFromControl;
      VerificaTasaRefer;
      If Objeto.CVE_TASA_REFER.AsString = '' Then Begin
         VLMsg := 'Favor de Indicar la Tasa de Referencia';
         VlSalida   := False;
      End Else Begin
         VerificaTasaRefer;
      End;
      InterForma1.ValidaExit(edCVE_TASA_REFER,VLSalida,VLMsg,True);
   End;
end;

{                           VALOR DE LA TASA DE REFERENCIA                     } 
procedure TwMDispFond.edVALOR_TASAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edVALOR_TASA,True,'',True);
end;


{                    OPERADOR DE SOBRETASA  + - * /                            }
procedure TwMDispFond.edOPERADOR_STASAExit(Sender: TObject);
var
   vlSalida        : Boolean;
   VlMsg           : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg   := CNULL;
      vlSalida := True;
      Objeto.OPERADOR_STASA.GetFromControl;
      InterForma1.ValidaExit(edOPERADOR_STASA,vlSalida,vlMsg,True);
   End;
end;

{                    SOBRETASA  ( PUNTOS PORCENTUALES )                        }
procedure TwMDispFond.edSOBRETASAExit(Sender: TObject);
var
   vlSalida        : Boolean;
   VlMsg           : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg   := CNULL;
      vlSalida := True;
      Objeto.OPERADOR_STASA.GetFromControl;
      Objeto.SOBRETASA.GetFromControl;
      Objeto.CVE_TASA_REFER.GetFromControl;
      Objeto.TASA_CREDITO.GetFromControl;
      If Objeto.OPERADOR_STASA.AsString <> CNULL Then Begin
         If Objeto.SOBRETASA.AsString = CNULL Then Begin
            vlSalida := False;
            vlMsg := 'Favor de indicar la Sobretasa';
         End Else If Objeto.SOBRETASA.AsFloat < 0 Then Begin
            vlSalida := False;
            vlMsg := 'La sobretasa no debe ser menor a cero';
         End;
      End;
      ValorTasaCred;
      InterForma1.ValidaExit(edSOBRETASA,vlSalida,vlMsg,True);
   End;
end;

{                    TASA    DEL     CREDITO                                   }
procedure TwMDispFond.edTASA_CREDITOExit(Sender: TObject);
var
   vlSalida        : Boolean;
   VlMsg           : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg   := CNULL;
      vlSalida := True;
      Objeto.TASA_CREDITO.GetFromControl;
      If Objeto.TASA_CREDITO.AsFloat <= 0 Then Begin
         vlSalida := False;
         vlMsg := 'La tasa de fondeo no debe ser menor o igual a cero';
      End;
     InterForma1.ValidaExit(edTASA_CREDITO,vlSalida,vlMsg,True);
   End;
end;




procedure TwMDispFond.edUNIDAD_TIEMPO_REExit(Sender: TObject);
Var
   VLSalida  :  boolean;
   VLMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then Begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.UNIDAD_TIEMPO_RE.GetFromControl;

      If (Objeto.UNIDAD_TIEMPO_RE.AsString = '') AND (Objeto.CVE_CALCULO.AsString = 'RE')Then Begin
         VLMsg := 'Favor de Indicar la Unidad de tiempo';
         VlSalida   := False;
      End;
      InterForma1.ValidaExit(bbUNIDAD_TIEMPO_RE,VLSalida,VLMsg,True);
   End;
end;

procedure TwMDispFond.edNUM_UNIDADES_REExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
     if ((Objeto.CVE_CALCULO.AsString = 'RE'))then
     begin
        Objeto.NUM_UNIDADES_RE.GetFromControl;
        If rgCVE_TIPO_TASA.ItemIndex <>0 Then Begin
           If Objeto.NUM_UNIDADES_RE.AsInteger <= 0 Then Begin
              VLSalida := False;
              vlMsg := 'El número de unidades debe de ser Mayor o igual a 1';
           End Else If Not
              (ValNumUnidades(Objeto.NUM_UNIDADES_RE.AsInteger,
                              Objeto.UTiempoTasa.NUM_DIAS.AsInteger,
                              Objeto.DIAS_PLAZO.AsInteger,VLMsg) ) Then
              VLSalida := False;
        End;
     end;
     InterForma1.ValidaExit(edNUM_UNIDADES_RE,VLSalida,VLMsg,True);
   end;
end;

procedure TwMDispFond.edDIA_REVISIONExit(Sender: TObject);
var
   vlSalida : Boolean;
   vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.DIA_REVISION.GetFromControl;
      If rgCVE_TIPO_TASA.ItemIndex <> 0 Then Begin
         If ((Objeto.DIA_REVISION.AsInteger < 1) or (Objeto.DIA_REVISION.AsInteger > 31)) and
            ((Objeto.CVE_CALCULO.AsString = 'RE')) Then Begin
             vlSalida := False;
             vlMsg    := 'El día de revisión debe ser mayor a 0 y menor o igual a 31';
         End;
         //
         If vlSalida Then Begin
            if (Objeto.UNIDAD_TIEMPO_RE.AsString <> '') and
               (Objeto.NUM_UNIDADES_RE.AsString  <> '') and
               (Objeto.DIA_REVISION.AsString     <> '') then
               Objeto.F_PROX_REVISION.AsDateTime :=  StpBusSigFecha(Objeto.F_INICIO.AsDateTime,
                                                                    Objeto.F_VENCIMIENTO.AsDateTime,
                                                                    Objeto.UNIDAD_TIEMPO_RE.AsString,
                                                                    Objeto.NUM_UNIDADES_RE.AsInteger,
                                                                    Objeto.DIA_REVISION.AsInteger);
         End;
      END;
      InterForma1.ValidaExit(edDIA_REVISION,vlSalida,vlMsg,True);
   End;
end;

procedure TwMDispFond.edF_PROX_REVISIONExit(Sender: TObject);
var
   vlSalida : Boolean;
   vlMsg    : String;
   VLDiaPago : String;
   VLMesPagS : String;
   VLMesPag  : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg := '';
      vlSalida := True;
      if ((Objeto.CVE_CALCULO.AsString = 'RE'))then
      begin
           Objeto.F_PROX_REVISION.GetFromControl;
           Objeto.F_INICIO.GetFromControl;
           Objeto.DIA_REVISION.GetFromControl;
           If rgCVE_TIPO_TASA.ItemIndex <>0 Then Begin
              If Objeto.F_PROX_REVISION.AsString <> '' Then Begin
                 If Objeto.F_PROX_REVISION.AsDateTime <= Objeto.F_INICIO.AsDateTime Then Begin
                    vlMsg := ' La fecha próxima revisión no puede ser menor a la fecha de inicio';
                    vlSalida := False;
                 End;
                 If ((Objeto.F_PROX_REVISION.AsDateTime > Objeto.F_VENCIMIENTO.AsDateTime ) And (vlSalida)) Then Begin
                    vlMsg := ' La fecha próxima revisión no puede ser mayor a la fecha de vencimiento';
                    vlSalida := False;
                 End;
                 If ((ValidaFecha(Objeto.F_PROX_REVISION.AsDateTime,Objeto.Apli) <> 0) And (vlSalida)) Then Begin
                    If Not(MessageDlg('La fecha de revisión de Tasa es un día no hábil. ¿Desea Continuar?',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then Begin
                       vlMsg := ' La fecha de revisión de Tasa es un día no hábil';
                       vlSalida := False;
                    End;
                 End;
                 DateTimeToString(VLDiaPago,'dd',Objeto.F_PROX_REVISION.AsDateTime);
                 If ((Objeto.DIA_REVISION.AsInteger <> StrToInt(VLDiaPago)) And (vlSalida)) Then Begin
                    DateTimeToString(VLMesPagS,'MM',Objeto.F_PROX_REVISION.AsDateTime + 1);
                    DateTimeToString(VLMesPag,'MM',Objeto.F_PROX_REVISION.AsDateTime);
                    If Not((Objeto.DIA_REVISION.AsInteger = 31) And (StrToInt(VLMesPagS) > StrToInt(VLMesPag))) Then Begin
                       If Not(MessageDlg('La fecha de revisión de Tasa no coincide con el día de revisión de Tasa señalado. ¿Desea Continuar?',
                             mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then Begin
                          vlMsg := ' La fecha de revisión de Tasa no coincide con el día de revisión de Tasa señalado';
                          vlSalida := False;
                       End;
                    End;
                 End;
              End Else Begin
                 vlMsg := ' Debe indicar la fecha de revisión de Tasa';
                 vlSalida := False;
              End;
           End;
      End;
      InterForma1.ValidaExit(edF_PROX_REVISION,VLSalida,VlMsg,True);
   End;
end;

procedure TwMDispFond.rgCVE_TIPO_ANUALExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_TIPO_ANUAL,True,'',True);
end;

procedure TwMDispFond.rgCVE_TIPO_MESExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_TIPO_MES,True,'',True);
end;

procedure TwMDispFond.cbxB_FINAN_ADICExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbxB_FINAN_ADIC,True,'',True);
end;


Function TwMDispFond.VentanaCalculo(pDato : String): string;
var   CalDia : TCrCalDia;
      vlDias : String;
begin
   vlDias := pDato;
   CalDia := TCrCalDia.Create(Self);
   Try
      If CalDia.ShowModal = mrOk Then
         If CalDia.edDIAS.Text <>'' Then
            vlDias := CalDia.edDIAS.Text;
   Finally
      CalDia.Free;
   End;
   VentanaCalculo := vlDias;
end;




procedure TwMDispFond.btCVE_TASA_REFERClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMDISPFOND_TSREF',True,True) then
   begin
     Objeto.TasaRefer.ShowAll := True;
     If Objeto.TasaRefer.Busca Then
        InterForma1.NextTab(edCVE_TASA_REFER);
   end;
end;




procedure TwMDispFond.bbUNIDAD_TIEMPO_REClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMDISPFOND_UTMRT',True,True) then
   begin
     Objeto.UTiempoTasa.ShowAll := True;
     If Objeto.UTiempoTasa.Busca Then Begin
          Objeto.UNIDAD_TIEMPO_RE.AsString := Objeto.UTiempoTasa.CVE_UNIDAD_TIEMP.AsString;
          Objeto.NUM_UNIDADES_RE.AsInteger:= 1;
          Objeto.DIA_REVISION.AsInteger:= 31;
          InterForma1.NextTab(bbUNIDAD_TIEMPO_RE);
     End;
   end;
end;

Function TwMDispFond.ValNumUnidades(pNumUnidades, peNumdiasMax, pPlazo: Integer;
  var pMensaje: String): Boolean;
Var
   vlResult : Boolean;
   vlTotal  : Double;
Begin
   vlResult := True;
   vlTotal := ( pPlazo / peNumdiasMax ) / pNumUnidades;
   pMensaje := '';
   If vlTotal < 1 Then Begin
      vlResult := False;
      pMensaje := 'Número de Unidades de acuerdo al plazo no corresponde';
   End;
   ValNumUnidades:= vlResult;
End;


procedure TwMDispFond.InterForma1DespuesEliminar(Sender: TObject);
begin
   Objeto.ID_CREDITO.AsInteger:= Objeto.BasicCred.ID_CREDITO.AsInteger;
   Objeto.CreCto.FindKey([Objeto.BasicCred.ID_CONTRATO.AsString,
                          Objeto.BasicCred.FOL_CONTRATO.AsString]);
   icpCONTRATO.RefrescaInfo;
   edPCT_REC_P.Text:= FormatFloat('##0.0000',0);
   edIMP_REC_P.Text:= FormatFloat('###,###,###,###,##0.00',0);
end;



procedure TwMDispFond.edOPERADOR_STASAKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Not((key=Char(42)) or (key=Char(43)) or (key=Char(45))
      or (key=Char(47)) or (key=Char(8)) or (key=Char(13))) Then Begin
      Key:=Char(0);
      InterForma1.ShowMsgPanel('Solo se permiten + , - , / , * ');
   End;
end;

procedure TwMDispFond.cbxB_FINAN_ADICClick(Sender: TObject);
begin
//   ModControles;
end;

Procedure TwMDispFond.ModControles;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      If not cbxB_FINAN_ADIC.Checked Then Begin
         Objeto.UNIDAD_TIEMPO_RE.AsString := '';
         Objeto.NUM_UNIDADES_FN.AsString  := '';
         Objeto.DIA_REVISION_FN.AsString  := '';
      End Else Begin
         Objeto.UNIDAD_TIEMPO_RE.AsString := 'MN';
         Objeto.NUM_UNIDADES_FN.AsInteger := 1;
         Objeto.DIA_REVISION_FN.AsInteger := 31;
      End;
   End;
End;
procedure TwMDispFond.btComisionesClick(Sender: TObject);
Var
   MPrComRed : TMPrComRed;
begin
  IF ( ( Objeto.Active ){ AND (Objeto.SIT_CREDITO.AsString = CSIT_NA)} ) THEN
  BEGIN
       MPrComRed:= TMPrComRed.Create(self);
       Try
          MPrComRed.Apli:=Objeto.Apli;
          MPrComRed.ParamCre:=Objeto.ParamCre;
          MPrComRed.VGIDCredito := Objeto.ID_CREDITO.AsInteger;
          MPrComRed.vgCveEntidad := Objeto.CVE_FND_ENT_DES.AsString;
          MPrComRed.vgCvePrograma := Objeto.CVE_FND_PROGRAMA.AsString;
          MPrComRed.Catalogo;
       Finally
          MPrComRed.Free;
       End;
  END ELSE BEGIN
    ShowMessage('No es posible agregar/modificar comisiones cuando la solicitud esta ' + lbSIT_CREDITO.Caption );
  END;
end;

procedure TwMDispFond.InterForma1DespuesCancelar(Sender: TObject);
begin
   edID_CREDITO.Text:= Objeto.BasicCred.ID_CREDITO.AsString;
   Objeto.CreCto.FindKey([Objeto.BasicCred.ID_CONTRATO.AsString,
                          Objeto.BasicCred.FOL_CONTRATO.AsString]);
   icpCONTRATO.RefrescaInfo;
   ValorRecPropios;
   Objeto.MInstDesc.FindKey([Objeto.CVE_FND_ENT_DES.AsString]);
   Objeto.MPrgApoyo.FindKey([Objeto.CVE_FND_PROGRAMA.AsString]);

   if (edCVE_AMORTIZACION.Text = '4') then
   begin
      cbUNIDAD_TIEMPO_CP.Text := '';
      cbDIA_PAGO_CAP.Text :='';
   end;

   if (edCVE_PAG_INTERES.Text = '1')OR(edCVE_PAG_INTERES.Text = '2') then
   begin
      cbUNIDAD_TIEMPO_IN.Text := '';
      cbDIA_PAGO_INT.Text :='';
   end;

   vlGpoProd:='NIL';
   AjustaControles;

   MuestraBtnAutoriza;
end;


procedure TwMDispFond.btAUTORIZAClick(Sender: TObject);
var vlQry : TQuery;
    vlsql : string;
    vlF_Inicio, vlF_Autoriza : TDate;
    bfechas:boolean;
    vlContinua:Boolean;

begin
   if Objeto.ValidaAccesoEsp('TMDISPFOND_AUTOR',True,True) then
   begin

       vlContinua:=true;

      If ( Objeto.BasicCred.SIT_CREDITO.AsString <> CSIT_AC ) Then
      begin
          MessageDlg('La Situacion de la Disposición original no se encuentra como Activa ', mtError, [mbOK],0 );
          vlContinua := False;
      end;

      If ( Objeto.SIT_CREDITO.AsString <> CSIT_NA ) Then
      begin
          MessageDlg('La Situacion de la Disposición es diferente a No Autorizada ', mtError, [mbOK],0 );
          vlContinua := False;
      end;

      // </ RABA > SEP 2011
      // SE AGREGA LA VALIDACION DE CONFIGURACIÓN CONTABLE
      if (vlContinua = True) then
      begin
         vlContinua := ValidaConfgContable;
         If Not vlContinua  Then
            MessageDlg('Falta configuración de cuentas contables ', mtError, [mbOK],0 );
      end;
      // < RABA />

      IF (Objeto.F_INICIO.AsDateTime > Objeto.Apli.DameFechaEmpresa) and (vlContinua = True)  THEN
      Begin
         ShowMessage('No se puede autorizar una disposición con fecha de inicio mayor a la de hoy');
         vlContinua := False;
      end;


      If ( Objeto.BasicCred.SIT_CREDITO.AsString = CSIT_AC ) and ( Objeto.SIT_CREDITO.AsString = CSIT_NA )
         and vlContinua Then
      Begin
        If (MessageDlg('¿Desea autorizar la solicitud de redescuento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
        begin
           if (objeto.PCT_REDESCONTADO.AsFloat > 0) then
           Begin
              if (ValidaTabla) then
              begin
                 if Objeto.AutorizaFnd then
                 begin
                    ShowMessage('Se autorizó la disposición: '  + Objeto.ID_CREDITO.AsString );
                    Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
                    Objeto.FindKeyNear( [Objeto.ID_CREDITO.AsString] , [ 'ID_CREDITO' ] );
                    MuestraBtnAutoriza;
    // </ RABA > OCT 2011
    // SE COMENTA ESTE PROCEDIMIENTO YA QUE EN EL PAQUETE SE GENERA UNA PROVISIÓN DE INTERES A FECHA VALOR
    // PVRTFD   Provisión retroactiva de disposición pasiva...
    // POR LO QUE CON ESTE CODIGO SE DUPLICA
    {
                    //HERJA - COMPARA FECHA DE INICIO Y DE AUTORIZACION
                    //        SIN SON DIFERENTES LLAMA TRANSACCION DE AJUSTE DE INTERES
                    bfechas:=false;
                    vlsql:=' SELECT F_INICIO, F_AUTORIZA FROM CR_FND_CREDITO '+
                           ' WHERE ID_CREDITO ='+ Objeto.ID_CREDITO.AsString +
                           '   AND CVE_FND_ENT_DES ='+ SQLStr(Objeto.CVE_FND_ENT_DES.AsString) +
                           '   AND CVE_FND_PROGRAMA ='+ SQLStr(Objeto.CVE_FND_PROGRAMA.AsString);
                    vlQry := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
                    try
                    if vlQry <> nil then
                    begin
                       bfechas:=true;
                       vlF_Inicio   := vlQry.FieldByName('F_INICIO').AsDateTime;
                       vlF_Autoriza := vlQry.FieldByName('F_AUTORIZA').AsDateTime;
                    end;
                    finally
                       if vlQry <> nil then vlQry.free;
                    end;

                    if (bfechas=true)and(vlF_Inicio<>vlF_Autoriza) then
                    begin
                       if Objeto.StpAjusteIN(StrToInt(Objeto.ID_CREDITO.AsString), Objeto.CVE_FND_ENT_DES.AsString,
                                             Objeto.CVE_FND_PROGRAMA.AsString, Objeto.CVE_ORIGEN_REC.AsString) then
                          ShowMessage('Se generó una Transacción de Ajuste de Interes ');
                    end;
    }
                 end;
              end
              else
                ShowMessage('Las cuotas de Capital no coinciden con el Importe Redescontado');
           end
           //< EASA4011       21.FEB.2007 Activación de creditos solo con Garantía
           else Begin
              If (MessageDlg('¿Desea autorizar la solicitud de redescuento con % de redescuento en CERO?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
                 if Objeto.AutorFndCero then Begin
                    ShowMessage('Se autorizó la disposición con % redescuento en cero '  + Objeto.ID_CREDITO.AsString );
                    Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
                    MuestraBtnAutoriza;
                 end;
           end;
           //EASA4011 >/
        end;
      end;
   end;
end;


procedure TwMDispFond.Cuotas1Click(Sender: TObject);
var Consult : TCrFndCons;
    GenCuot : TCRFNDcuot;
begin
   if Objeto.Active then
      Begin
//        if ( Objeto.SIT_CREDITO.AsString = CSIT_AC ) then
        if ( Objeto.SIT_CREDITO.AsString <> CSIT_NA ) then
        Begin
                Consulta_Credito(ftCapital,Objeto.ID_CREDITO.AsInteger,0,'',
                                 '',Objeto.Apli, Objeto.ParamCre);
        end;
        if ( Objeto.SIT_CREDITO.AsString = CSIT_NA ) then
        Begin
           GenCuot := TCRFNDcuot.Create(self);
            try
               GenCuot.Apli := Objeto.Apli;
               GenCuot.ParamCre := Objeto.ParamCre;

               GenCuot.ID_CONTRATO.AsString := Objeto.BasicCred.ID_CONTRATO.AsString;
               GenCuot.CVE_PRODUCTO_CRE.AsString := Objeto.BasicCred.CVE_PRODUCTO.AsString;
               GenCuot.DESC_L_PRODUCTO.AsString := Objeto.BasicCred.DESC_L_PRODUCTO.AsString;
               GenCuot.CVE_AMORTIZACION.AsString := Objeto.CVE_AMORTIZACION.AsString;
               GenCuot.CVE_PAG_INTERES.AsString := Objeto.CVE_PAG_INTERES.AsString;
               GenCuot.UNIDAD_TIEMPO_CP.AsString := cbUNIDAD_TIEMPO_CP.Text; //Objeto.UNIDAD_TIEMPO_CP.AsString;
               GenCuot.NUM_UNIDADES_CP.AsString := Objeto.NUM_UNIDADES_CP.AsString;
               GenCuot.DIA_PAGO_CAP.AsString := Objeto.DIA_PAGO_CAP.AsString;
               GenCuot.UNIDAD_TIEMPO_IN.AsString := cbUNIDAD_TIEMPO_IN.Text; //Objeto.UNIDAD_TIEMPO_IN.AsString;
               GenCuot.NUM_UNIDADES_IN.AsString := Objeto.NUM_UNIDADES_IN.AsString;
               GenCuot.DIA_PAGO_INT.AsString := Objeto.DIA_PAGO_INT.AsString;
               GenCuot.DESC_AMORTIZA.AsString := Objeto.TipoAmort.DESC_AMORTIZA.AsString;
               GenCuot.DESC_PAG_INTERES.AsString := Objeto.PagoInt.DESC_PAG_INTERES.AsString;
               GenCuot.F_INI_PAG_CAP.AsString := Objeto.F_INI_PAG_CAP.AsString;
               GenCuot.F_INI_PAG_INT.AsString := Objeto.F_INI_PAG_INT.AsString;
               GenCuot.SIT_CREDITO.AsString := Objeto.SIT_CREDITO.AsString;
               GenCuot.IMP_CREDITO.AsString := Objeto.IMP_CREDITO.AsString;

               GenCuot.VGCredito := Objeto.id_credito.AsInteger;
               GenCuot.VGEntDesc := Objeto.CVE_FND_ENT_DES.AsString;
               GenCuot.VGPrograma := Objeto.CVE_FND_PROGRAMA.AsString;

              // GenCuot.VGCredRenuev := Objeto.ID_CRE_RENUEVA.AsInteger;
               GenCuot.Catalogo;
            finally
                   GenCuot.Free;
            end;
        end;

        Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
      end
   else
       ShowMessage('Debe de seleccionar una Disposición.');
   //end if;
end;

procedure TwMDispFond.bbUNIDAD_TIEMPO_CPClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMDISPFOND_UTMAM',True,True) then
   begin
     Objeto.UTiempoCap.ShowAll := True;
     if Objeto.UTiempoCap.Busca then
     begin
          Objeto.UNIDAD_TIEMPO_CP.AsString := Objeto.UTiempoCap.CVE_UNIDAD_TIEMP.AsString;
          InterForma1.NextTab(bbUNIDAD_TIEMPO_CP);
     end;
   end;
end;

procedure TwMDispFond.bbUNIDAD_TIEMPO_CPExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlSalida := True;
     vlMsg := CNULL;
     Objeto.UNIDAD_TIEMPO_CP.GetFromControl;
     if Objeto.UNIDAD_TIEMPO_CP.AsString = CNULL then
     Begin
        vlSalida := False;
        vlMsg := 'Favor de Indicar el tipo de Amortización';
     end
     else if NOT ( ValUnidadTiemp(Objeto.UNIDAD_TIEMPO_CP.AsString,Objeto.DIAS_PLAZO.AsInteger,vlMsg)) then
     Begin
        vlSalida := False;
     end;
   end;
   InterForma1.ValidaExit(bbUNIDAD_TIEMPO_CP,vlSalida,vlMsg,True);
end;

procedure TwMDispFond.edNUM_UNIDADES_CPExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //Verifica que el dato no sea negativo
      Objeto.NUM_UNIDADES_CP.GetFromControl;
      if Objeto.NUM_UNIDADES_CP.AsInteger <= 0 then
      Begin
         VLSalida := False;
         vlMsg := 'El número de unidades debe de ser Mayor o igual a 1';
      end
      else if not (ValNumUnidades(Objeto.NUM_UNIDADES_CP.AsInteger,Objeto.UTiempoCap.NUM_DIAS.AsInteger,
                                  Objeto.DIAS_PLAZO.AsInteger,vlMsg) ) then
           VLSalida := False;
      If VLSalida Then ActualizaValoresPagoEquivalente; // SATV4766
      InterForma1.ValidaExit(edNUM_UNIDADES_CP,VLSalida,VLMsg,True);
   end;
end;

procedure TwMDispFond.cbDIA_PAGO_CAPEnter(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.DIA_PAGO_CAP.GetFromControl;
      vgDiaPago := Objeto.DIA_PAGO_CAP.AsInteger;
   End;
end;

procedure TwMDispFond.cbDIA_PAGO_CAPExit(Sender: TObject);
var
    vlSalida : Boolean;
    vlMsg    : String;
    VLMesPag  : String;
    VLYearPag : String;
    vlQry2 : TQuery;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
     Objeto.DIA_PAGO_CAP.GetFromControl;
     if ((Objeto.DIA_PAGO_CAP.AsInteger < 1) or (Objeto.DIA_PAGO_CAP.AsInteger > 31)) then
     begin
          vlSalida := False;
          vlMsg    := 'El día de pago de capital debe ser mayor a 0 y menor o igual a 31';
     end;
     if vlSalida then
     begin
       //<LOLS 15 ENE 2005.GUARDA EL DIA DE PAGO QUE TIENE EL CONTROL PARA LLAMAR LA RUTINA DE ACTUALIZACION SOLO SI ESTE CAMBIA>
       if ( vgDiaPago <> Objeto.DIA_PAGO_CAP.AsInteger ) or
          ( Objeto.F_INI_PAG_CAP.AsString = ''         ) then
       //</LOLS>
       begin
          vlsql:=' SELECT NUM_DMIN_REQ_PER,NUM_DIAS_AGR_PER FROM CR_PRODUCTO '+
                 ' WHERE CVE_PRODUCTO_CRE = (SELECT CVE_PRODUCTO_CRE FROM CR_CONTRATO '+
                 '                           WHERE ID_CONTRATO = ( SELECT ID_CONTRATO FROM CR_CREDITO '+
                 '                                                 WHERE ID_CREDITO= '+ edID_CREDITO.Text +' ) ) ';
          vlQry2 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
          try
             if vlQry2 <> nil then
             Begin
                Objeto.F_INI_PAG_CAP.AsDateTime :=  Objeto.StpBusSigFecha(Objeto.F_INICIO.AsDateTime,
                                                                          Objeto.F_VENCIMIENTO.AsDateTime,
                                                                          Objeto.UNIDAD_TIEMPO_CP.AsString,
                                                                          Objeto.NUM_UNIDADES_CP.AsInteger,
                                                                          Objeto.DIA_PAGO_CAP.AsInteger,
                                                                          vlQry2.FieldByName('NUM_DMIN_REQ_PER').AsInteger,
                                                                          vlQry2.FieldByName('NUM_DIAS_AGR_PER').AsInteger
                                                                          ); // SATV4766
             end;
          finally
             vlQry2.Close;
             if vlQry2 <> nil then vlQry2.free;
          end;
       end;
     end;
     If VLSalida Then ActualizaValoresPagoEquivalente; // SATV4766
     InterForma1.ValidaExit(cbDIA_PAGO_CAP,vlSalida,vlMsg,True);
   end;
end;

procedure TwMDispFond.edDIA_REVISIONKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     if Not((key=Char(48)) or (key=Char(49)) or (key=Char(50)) or (key=Char(51)) or (key=Char(52)) or (key=Char(53))
     or (key=Char(54)) or (key=Char(55)) or (key=Char(56)) or (key=Char(57)) or (key=Char(8)) or (key=Char(13)))  then
     begin
          Key:=Char(0);
          InterForma1.ShowMsgPanel('Solo se permiten números ( 1 - 31 )');
     end;
   end;
end;

procedure TwMDispFond.edF_INI_PAG_CAPExit(Sender: TObject);
var vlSalida  : Boolean;
    vlMsg     : String;
    VLDiaPago : String;
    VLMesPagS : String;
    VLMesPag  : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      VLDiaPago := '';
      vlSalida := True;
      Objeto.F_INI_PAG_CAP.GetFromControl;
      Objeto.F_INICIO.GetFromControl;
      Objeto.DIA_PAGO_CAP.GetFromControl;
      If Objeto.F_INI_PAG_CAP.AsString <> '' then
      Begin
         if Objeto.F_INI_PAG_CAP.AsDateTime < Objeto.F_INICIO.AsDateTime then
         Begin
            vlMsg := ' La fecha de primer pago de capital no puede ser menor a la fecha de inicio';
            vlSalida := False;
         End;
         if ((Objeto.F_INI_PAG_CAP.AsDateTime > Objeto.F_VENCIMIENTO.AsDateTime ) and (vlSalida)) then
         Begin
            vlMsg := ' La fecha de primer pago de capital no puede ser mayor a la fecha de vencimiento';
            vlSalida := False;
         End;
         if ((ValidaFecha(Objeto.F_INI_PAG_CAP.AsDateTime,Objeto.Apli) <> 0) and (vlSalida)) then
         Begin
              if Not(MessageDlg('La fecha de primer pago de capital es un día no hábil. ¿Desea Continuar?',
                 mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
              begin
                   vlMsg := ' La fecha de primer pago de capital es un día no hábil';
                   vlSalida := False;
              end;
         End;
         DateTimeToString(VLDiaPago,'dd',Objeto.F_INI_PAG_CAP.AsDateTime);
         if ((Objeto.DIA_PAGO_CAP.AsInteger <> StrToInt(VLDiaPago)) and (vlSalida)) then
         begin
              DateTimeToString(VLMesPagS,'MM',Objeto.F_INI_PAG_CAP.AsDateTime + 1);
              DateTimeToString(VLMesPag,'MM',Objeto.F_INI_PAG_CAP.AsDateTime);
              if not((Objeto.DIA_PAGO_CAP.AsInteger = 31) and (StrToInt(VLMesPagS) > StrToInt(VLMesPag))) then
              begin
                  if Not(MessageDlg('La fecha de primer pago de capital no coincide con el día de pago de capital señalado. ¿Desea Continuar?',
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
                  begin
                       vlMsg := ' La fecha de primer pago de capital no coincide con el día de pago de capital señalado';
                       vlSalida := False;
                  end;
              end;
         end;
      end
      else
      begin
           vlMsg := ' Debe indicar la fecha de primer pago de interés';
           vlSalida := False;
      end;
      If VLSalida Then ActualizaValoresPagoEquivalente; // SATV4766      
      InterForma1.ValidaExit(edF_INI_PAG_CAP,VLSalida,VlMsg,True);
   end;
end;

procedure TwMDispFond.edCVE_PAG_INTERESExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
        VLMsg    := '';
        VlSalida := True;
        Objeto.CVE_PAG_INTERES.GetFromControl;
        if Objeto.CVE_PAG_INTERES.AsString = '' then
        Begin
             VLMsg := 'Favor de Indicar el Pago de Intereses';
             VlSalida   := False;
        end; //end if
        if (Objeto.Modo=moAppend) and (VlSalida) then
        begin
             AsignaPagoInt;
        end;
        VerPagoInt;
        InterForma1.ValidaExit(edCVE_PAG_INTERES,VLSalida,VLMsg,True);
   end;
end;

procedure TwMDispFond.btPAGO_INTClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMDISPFOND_PGINT',True,True) then
   begin
     //Buscador a la Clase de Pago de Intereses
     Objeto.PagoInt.ShowAll := True;
     if Objeto.PagoInt.Busca then
        InterForma1.NextTab(btPAGO_INT);
     //end if
   end;
end;

procedure TwMDispFond.edCVE_AMORTIZACIONExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.CVE_AMORTIZACION.GetFromControl;
      if Objeto.CVE_AMORTIZACION.AsString = '' then
      Begin
         VLMsg := 'Favor de Indicar el Tipo de Amortización';
         VlSalida   := False;
      end; //end if
      //Solo Modo Append
      if (Objeto.Modo=moAppend) and VlSalida then
      begin
           AsignaPagoCap;
      end;
      VerPagoCap;
      InterForma1.ValidaExit(edCVE_AMORTIZACION,VLSalida,VLMsg,True);
   end;
end;

procedure TwMDispFond.btTIPO_AMORTClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMDISPFOND_TPAMO',True,True) then
   begin
     // Buscador de Tipos de Amortizacion
      Objeto.TipoAmort.ShowAll := True;
      if Objeto.TipoAmort.Busca then
         InterForma1.NextTab(btTIPO_AMORT);
      //end if
   end;
end;

procedure TwMDispFond.bbUNIDAD_TIEMPO_INClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMDISPFOND_UTPGI',True,True) then
   begin
     Objeto.UTiempoInt.ShowAll := True;
     if Objeto.UTiempoInt.Busca then
     begin
          Objeto.UNIDAD_TIEMPO_IN.AsString := Objeto.UTiempoInt.CVE_UNIDAD_TIEMP.AsString;
          InterForma1.NextTab(bbUNIDAD_TIEMPO_IN);
     end;
   end;
end;

procedure TwMDispFond.bbUNIDAD_TIEMPO_INExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlSalida := True;
     vlMsg := CNULL;
     Objeto.UNIDAD_TIEMPO_IN.GetFromControl;
     if Objeto.UNIDAD_TIEMPO_IN.AsString = CNULL then
     Begin
        vlSalida := False;
        vlMsg := 'Favor de Indicar el tipo de pago de Interés';
     end
     else if NOT ( ValUnidadTiemp(Objeto.UNIDAD_TIEMPO_IN.AsString,Objeto.DIAS_PLAZO.AsInteger,vlMsg)) then
     Begin
        vlSalida := False;
     end;
   end;
   InterForma1.ValidaExit(bbUNIDAD_TIEMPO_IN,vlSalida,vlMsg,True);
end;

procedure TwMDispFond.edNUM_UNIDADES_INExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //Verifica que el dato no sea negativo
      Objeto.NUM_UNIDADES_IN.GetFromControl;
      if Objeto.NUM_UNIDADES_IN.AsInteger <= 0 then
      Begin
         VLSalida := False;
         vlMsg := 'El número de unidades debe de ser Mayor o igual a 1';
      end
      else if not (ValNumUnidades(Objeto.NUM_UNIDADES_IN.AsInteger, Objeto.UTiempoInt.NUM_DIAS.AsInteger,
                                  Objeto.DIAS_PLAZO.AsInteger,vlMsg) ) then
           VLSalida := False;
      InterForma1.ValidaExit(edNUM_UNIDADES_IN,VLSalida,VLMsg,True);
   end;
end;

procedure TwMDispFond.cbDIA_PAGO_INTEnter(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.DIA_PAGO_INT.GetFromControl;
      vgDiaPago := Objeto.DIA_PAGO_INT.AsInteger;
   End;
end;

procedure TwMDispFond.cbDIA_PAGO_INTExit(Sender: TObject);
var
    vlSalida : Boolean;
    vlMsg    : String;
    VLMesPag  : String;
    VLYearPag : String;
    vlQry2 : TQuery;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
     Objeto.DIA_PAGO_INT.GetFromControl;
     if ((Objeto.DIA_PAGO_INT.AsInteger < 1) or (Objeto.DIA_PAGO_INT.AsInteger > 31)) then
     begin
          vlSalida := False;
          vlMsg    := 'El día de pago de interés debe ser mayor a 0 y menor o igual a 31';
     end;
     if vlSalida then
     begin
       //<LOLS 15 ENE 2005.GUARDA EL DIA DE PAGO QUE TIENE EL CONTROL PARA LLAMAR LA RUTINA DE ACTUALIZACION SOLO SI ESTE CAMBIA>
       if ( vgDiaPago <> Objeto.DIA_PAGO_INT.AsInteger ) or
          ( Objeto.F_INI_PAG_INT.AsString = ''         ) then
       // </LOLS>
       begin
          vlsql:=' SELECT NUM_DMIN_REQ_PER,NUM_DIAS_AGR_PER FROM CR_PRODUCTO '+
                 ' WHERE CVE_PRODUCTO_CRE = (SELECT CVE_PRODUCTO_CRE FROM CR_CONTRATO '+
                 '                           WHERE ID_CONTRATO = ( SELECT ID_CONTRATO FROM CR_CREDITO '+
                 '                                                 WHERE ID_CREDITO= '+ edID_CREDITO.Text +' ) ) ';
          vlQry2 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
          try
             if vlQry2 <> nil then
             Begin
                Objeto.F_INI_PAG_INT.AsDateTime :=  Objeto.StpBusSigFecha(Objeto.F_INICIO.AsDateTime,
                                                                          Objeto.F_VENCIMIENTO.AsDateTime,
                                                                          Objeto.UNIDAD_TIEMPO_IN.AsString,
                                                                          Objeto.NUM_UNIDADES_IN.AsInteger,
                                                                          Objeto.DIA_PAGO_INT.AsInteger,
                                                                          vlQry2.FieldByName('NUM_DMIN_REQ_PER').AsInteger,
                                                                          vlQry2.FieldByName('NUM_DIAS_AGR_PER').AsInteger
                                                                          ); // SATV4766
             end;
          finally
             vlQry2.Close;
             if vlQry2 <> nil then vlQry2.free;
          end;
       end;   
     end;
   end;
   InterForma1.ValidaExit(cbDIA_PAGO_INT,vlSalida,vlMsg,True);
end;

procedure TwMDispFond.edF_INI_PAG_INTExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
    VLDiaPago : String;
    VLMesPagS : String;
    VLMesPag  : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      VLDiaPago := '';
      vlSalida := True;
      Objeto.F_INI_PAG_INT.GetFromControl;
      Objeto.F_INICIO.GetFromControl;
      Objeto.DIA_PAGO_INT.GetFromControl;
      If Objeto.F_INI_PAG_INT.AsString <> '' then
      Begin
         if Objeto.F_INI_PAG_INT.AsDateTime < Objeto.F_INICIO.AsDateTime then
         Begin
            vlMsg := ' La fecha de primer pago de interés no puede ser menor a la fecha de inicio';
            vlSalida := False;
         End;
         if ((Objeto.F_INI_PAG_INT.AsDateTime > Objeto.F_VENCIMIENTO.AsDateTime ) and (vlSalida)) then
         Begin
            vlMsg := ' La fecha de primer pago de interés no puede ser mayor a la fecha de vencimiento';
            vlSalida := False;
         End;
         if ((ValidaFecha(Objeto.F_INI_PAG_INT.AsDateTime,Objeto.Apli) <> 0) and (vlSalida)) then
         Begin
              if Not(MessageDlg('La fecha de primer pago de interés es un día no hábil. ¿Desea Continuar?',
                 mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
              begin
                   vlMsg := ' La fecha de primer pago de interés es un día no hábil';
                   vlSalida := False;
              end;
         End;
         DateTimeToString(VLDiaPago,'dd',Objeto.F_INI_PAG_INT.AsDateTime);
         if ((Objeto.DIA_PAGO_INT.AsInteger <> StrToInt(VLDiaPago)) and (vlSalida)) then
         begin
              DateTimeToString(VLMesPagS,'MM',Objeto.F_INI_PAG_INT.AsDateTime + 1);
              DateTimeToString(VLMesPag,'MM',Objeto.F_INI_PAG_INT.AsDateTime);
              if not((Objeto.DIA_PAGO_INT.AsInteger = 31) and (StrToInt(VLMesPagS) > StrToInt(VLMesPag))) then
              begin
                  if Not(MessageDlg('La fecha de primer pago de interés no coincide con el día de pago de interés señalado. ¿Desea Continuar?',
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
                  begin
                       vlMsg := ' La fecha de primer pago de interés no coincide con el día de pago de interés señalado';
                       vlSalida := False;
                  end;
              end;
         end;
      end
      else
      begin
           vlMsg := ' Debe indicar la fecha de primer pago de interés';
           vlSalida := False;
      end;
      InterForma1.ValidaExit(edF_INI_PAG_INT,vlSalida,vlMsg,True);
   end;
end;

procedure TwMDispFond.ilTIPAMORTEjecuta(Sender: TObject);
begin
   if Objeto.TipoAmort.FindKey([ilTIPAMORT.Buffer]) then
      InterForma1.NextTab(edCVE_AMORTIZACION);
   //end if
end;

procedure TwMDispFond.ilPAGINTEjecuta(Sender: TObject);
begin
   if Objeto.PagoInt.FindKey([ilPAGINT.Buffer]) then
      InterForma1.NextTab(edCVE_PAG_INTERES);
   //end if
end;

procedure TwMDispFond.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
     AjustaControles;  

    vlSql := ' SELECT SIT_CREDITO FROM CR_CREDITO' +
             ' WHERE ID_CREDITO = ' +  edID_CREDITO.Text ;
    vlQry := GetSQLQuery(vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
    if vlQry <> nil then
    begin
      if vlQry.IsEmpty = False then
      begin
        vlQry.First;
        if vlQry.FieldByName('SIT_CREDITO').AsString <> 'AC' then
        begin
           //MessageDlg('El credito Activo tiene situacion: '+vlQry.FieldByName('SIT_CREDITO').AsString, mtError, [mbOK], 0);
           //Realizado := False;
        end;
      end
      else
      begin
         Realizado := False;
      end;
      vlQry.Close;
      vlQry.Free;

      RevisaGpoProd;
      if (vlGpoProd=C_FACTOR)AND(edCVE_FND_ENT_DES.Text='0070025') then
      begin
         vlsql:=' SELECT COUNT(*) AS COUNT FROM CR_FND_CREDITO '+
                ' WHERE ID_CREDITO  = '+Objeto.ID_CREDITO.AsString;

         vlQry := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
         try
           if vlQry <> nil then
           begin
              if vlQry.FieldByName('COUNT').AsInteger>0 then
              begin
                 MessageDlg('Para disposiciones de Factoraje de NAFIN solo se puede capturar un solo¨Pasivo', mtError, [mbOK], 0);
                 Realizado := False;
              end;
           end;
         finally
           if vlQry <> nil then vlQry.free;
         end;
         vlGpoProd:='NIL';
      end;
    end
    Else
    begin
       MessageDlg('No existe credito Activo asociado', mtError, [mbOK], 0);
       Realizado := False;
    end;
end;

procedure TwMDispFond.btCANCELAClick(Sender: TObject);
var sSQL :  String;
    qyQuery: TQuery;
    vfF_ALTA, vfF_D000, vfF_AUTORIZA : TDate;
    vfSit, Bdelcuota, vlidcredito: string;
    vPct_Redesc : single;
    Benc_fecha, Bcanc, Bcuota : boolean;
    vlCount: integer;

    vlID_TRANSACCION:integer;
    vgQryA: TQuery;
begin
   if Objeto.ValidaAccesoEsp('TMDISPFOND_CANC',True,True) then
   begin
       if Objeto.Active then
       begin

          Benc_fecha:=false;
          Bcanc:=false;
          vPct_Redesc:=0;

          sSQL:= 'SELECT SIT_CREDITO, F_ALTA, F_AUTORIZA, PCT_REDESCONTADO, NVL(ID_GRUPO_TRANSAC,0) AS GPO_TRANS FROM CR_FND_CREDITO '+
                 ' WHERE ID_CREDITO ='+ Objeto.ID_CREDITO.AsSQL +
                 '   AND CVE_FND_ENT_DES ='+ Objeto.CVE_FND_ENT_DES.AsSQL +
                 '   AND CVE_FND_PROGRAMA ='+ Objeto.CVE_FND_PROGRAMA.AsSQL;

          qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
          If qyQuery <> Nil Then
          begin
             vfSit:=qyQuery.FieldByName('SIT_CREDITO').AsString;
             vfF_ALTA:=qyQuery.FieldByName('F_ALTA').AsDateTime;
             vfF_AUTORIZA:=qyQuery.FieldByName('F_AUTORIZA').AsDateTime;
             vPct_Redesc:=qyQuery.FieldByName('PCT_REDESCONTADO').AsFloat;
             Benc_fecha:=true;
             qyQuery.Close;
          End;

          vfF_D000:=Objeto.Apli.DameFechaEmpresa;

          if (Benc_fecha) then
          begin
             if Objeto.SIT_CREDITO.AsString = CSIT_CA then
                ShowMessage('El Pasivo ya se encuentra Cancelado')
             else
             Begin
                if ( Objeto.SIT_CREDITO.AsString <> CSIT_CA ) OR
                   ( Objeto.SIT_CREDITO.AsString <> CSIT_LQ ) then
                Begin

    //               if  (vfSit='NA')and(vfF_ALTA = vfF_D000) then Bcanc:=true;
                   if  (vfSit='NA') then Bcanc:=true;

                   if  (vfSit='AC')and(vfF_AUTORIZA = vfF_D000) then Bcanc:=true;

                   if (Bcanc)OR(vPct_Redesc=0) then
                   begin
                      if MessageDlg('¿Está seguro de cancelar la Operación', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                      Begin

                         //HERJA - 08.06.2011
                        //CODIGO PARA BUSCAR EL GPO_TRANSACCION CON EL QUE SE ACTIVO EL PASIVO EN CASO DE QUE NO EXISTA
                        //Y POSTERIORMENTE ACTUALIZARLO EN EL REGISTRO
                        //ESTO PARA SOLVENTAR LA CANCELACIONES DE CADENAS PRODUCTIVAS
                        vlID_TRANSACCION:=0;
                        RevisaGpoProd;
                        if (vlGpoProd=C_FACTOR)and(edCVE_FND_ENT_DES.Text='0070025') then
                        begin
                              sSQL:= ' SELECT CT.ID_TRANSACCION FROM CR_TRANSACCION CT, CR_XTRANSACCION CXT ' +
                                     ' WHERE CT.ID_CREDITO ='+ Objeto.ID_CREDITO.AsSQL +
                                     '   AND CT.CVE_OPERACION IN (''DISPFD'') ' +
                                     '   AND CT.SIT_TRANSACCION = ''AC'' ' +
                                     '   AND CT.ID_TRANS_CANCELA IS NULL ' +
                                     '   AND CT.ID_TRANSACCION = CXT.ID_TRANSACCION ' +
                                     '   AND CXT.CVE_FND_ENT_DES ='+ Objeto.CVE_FND_ENT_DES.AsSQL +
                                     '   AND CXT.CVE_FND_PROGRAMA ='+ Objeto.CVE_FND_PROGRAMA.AsSQL;

                               qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
                              If qyQuery <> Nil Then
                              begin
                                 vlID_TRANSACCION:=qyQuery.FieldByName('ID_TRANSACCION').AsInteger;
                                 qyQuery.Close;
                              End;

                              if vlID_TRANSACCION > 0 then
                              begin
                                 if Objeto.StpCancTransaccion(vlID_TRANSACCION) = TRUE then
                                 begin

    sSQL:=' BEGIN ' + coCRLF+
          ' DELETE CR_FND_CAPITAL ' + coCRLF+
          '  WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsSQL + coCRLF +
          '    AND  CVE_FND_ENT_DES = '+ Objeto.CVE_FND_ENT_DES.AsSQL + coCRLF+
          '    AND  CVE_FND_PROGRAMA = '+ Objeto.CVE_FND_PROGRAMA.AsSQL + ';'+ coCRLF+
          ' DELETE CR_FND_INTERES ' + coCRLF+
          '  WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsSQL + coCRLF +
          '    AND  CVE_FND_ENT_DES = '+ Objeto.CVE_FND_ENT_DES.AsSQL + coCRLF+
          '    AND  CVE_FND_PROGRAMA = '+ Objeto.CVE_FND_PROGRAMA.AsSQL + ';'+ coCRLF+
          ' DELETE CR_FND_FIN_ADIC ' + coCRLF+
          '  WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsSQL + coCRLF +
          '    AND  CVE_FND_ENT_DES = '+ Objeto.CVE_FND_ENT_DES.AsSQL + coCRLF+
          '    AND  CVE_FND_PROGRAMA = '+ Objeto.CVE_FND_PROGRAMA.AsSQL + ';'+ coCRLF+
          ' DELETE CR_FND_COMISION ' + coCRLF+
          '  WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsSQL + coCRLF +
          '    AND  CVE_FND_ENT_DES = '+ Objeto.CVE_FND_ENT_DES.AsSQL + coCRLF+
          '    AND  CVE_FND_PROGRAMA = '+ Objeto.CVE_FND_PROGRAMA.AsSQL + ';'+ coCRLF+
          ' DELETE CR_FND_COM_PROG ' + coCRLF+
          '  WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsSQL + coCRLF +
          '    AND  CVE_FND_ENT_DES = '+ Objeto.CVE_FND_ENT_DES.AsSQL + coCRLF+
          '    AND  CVE_FND_PROGRAMA = '+ Objeto.CVE_FND_PROGRAMA.AsSQL + ';'+ coCRLF+
          ' DELETE CR_FND_CREDITO ' + coCRLF+
          '  WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsSQL + coCRLF +
          '    AND  CVE_FND_ENT_DES = '+ Objeto.CVE_FND_ENT_DES.AsSQL + coCRLF+
          '    AND  CVE_FND_PROGRAMA = '+ Objeto.CVE_FND_PROGRAMA.AsSQL + ';'+ coCRLF+
          'COMMIT;' + #13 + 'END;';

    {      try
            vgQryA := TQuery.Create(Self);
            vgQryA.DatabaseName  := Objeto.Apli.DataBaseName;
            vgQryA.SessionName   := Objeto.Apli.SessionName;
            vgQryA.SQL.Add(sSQL);
            vgQryA.ExecSQL;
          finally
            vgQryA.close;
          end; }

                                 end;
                              end;


                           {
                            ShowMessage('Se canceló el Pasivo : ' + Objeto.ID_CREDITO.AsString );
                            Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
                            Objeto.FindKeyNear( [Objeto.ID_CREDITO.AsString] , [ 'ID_CREDITO' ] );
                            icpCONTRATO.RefrescaInfo;
                            Objeto.MInstDesc.FindKey([Objeto.CVE_FND_ENT_DES.AsString]);
                            Objeto.MPrgApoyo.FindKey([Objeto.CVE_FND_ENT_DES.AsString,
                                                      Objeto.CVE_FND_PROGRAMA.AsString]);
                            //Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
                            ValorRecPropios;
                            VerificaTasaRefer;
                            MuestraBtnAutoriza;

                            edID_CREDITO.Text:=vlidcredito;
                            EXIT;          }
                        end;
                       //FIN HERJA - 08.06.2011


                         //SE REVISA SI EL PASIVO TIENE CUOTA FEGA PARA ELIMINARLA
                         Bcuota:=false;
                         Bdelcuota:='F';
                         GetSQLInt('SELECT COUNT(*) COUNT ' +
                                   'FROM CR_FND_COM_PROG  ' +
                                   ' WHERE  ID_CREDITO  =  '     + Objeto.ID_CREDITO.AsString       +
                                   '   AND  CVE_COMISION IN (SELECT CVE_COMISION FROM CR_CAT_COMISION WHERE DESC_COMISION LIKE ''%CUOTA%GARANT%'') ',
                                   Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,'COUNT',vlCount, False);
                         Bcuota := (vlCount > 0);
                         if Bcuota then
                         begin
                            //if MessageDlg('Existe una Cuota asociada al Pasivo, ¿Desea eliminarla?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                              ShowMessage('Existe una Cuota asociada al Pasivo, tambien se eliminara');
                              Bdelcuota:='V';
                         end;

                         vlidcredito:=Objeto.ID_CREDITO.AsString;

                         if Objeto.StpCancPasivo(StrToInt(Objeto.ID_CREDITO.AsString), Objeto.CVE_FND_ENT_DES.AsString,
                                                 Objeto.CVE_FND_PROGRAMA.AsString, Objeto.CVE_ORIGEN_REC.AsString, Bdelcuota) then
                         Begin
                            ShowMessage('Se canceló el Pasivo : ' + Objeto.ID_CREDITO.AsString );
                            Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
                            Objeto.FindKeyNear( [Objeto.ID_CREDITO.AsString] , [ 'ID_CREDITO' ] );
                            icpCONTRATO.RefrescaInfo;
                            Objeto.MInstDesc.FindKey([Objeto.CVE_FND_ENT_DES.AsString]);
                            Objeto.MPrgApoyo.FindKey([Objeto.CVE_FND_ENT_DES.AsString,
                                                      Objeto.CVE_FND_PROGRAMA.AsString]);
                            //Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
                            ValorRecPropios;
                            VerificaTasaRefer;
                            MuestraBtnAutoriza;

                            edID_CREDITO.Text:=vlidcredito;
                         end;
                      end;
                   end
                   else ShowMessage('La Cancelacion debe de ser Mismo Dia ');

                end
                else ShowMessage('El Pasivo no puede ser cancelado');
             end;
          end
          else ShowMessage('No se encontro el Pasivo');
       end
       else
          ShowMessage('Debe de seleccionar un Pasivo.');
   end;
end;

procedure TwMDispFond.cbUNIDAD_TIEMPO_CPChange(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend))AND(Trim(cbUNIDAD_TIEMPO_CP.Text)<>'') Then
   begin
      cbDIA_PAGO_CAP.Text:='';
      Objeto.DIA_PAGO_CAP.GetFromControl;
   end;
end;

procedure TwMDispFond.cbUNIDAD_TIEMPO_INChange(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend))AND(Trim(cbUNIDAD_TIEMPO_IN.Text)<>'') then
   begin
      cbDIA_PAGO_INT.Text:='';
      Objeto.DIA_PAGO_INT.GetFromControl;
   end;
end;

procedure TwMDispFond.rgCVE_MOD_FNDExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_MOD_FND,True,'',True);
end;

Function TwMDispFond.ValidaConfgContable:Boolean;
var
  vlResultado  : Boolean;
  STPValConta  : TStoredProc;
begin
   vlResultado := False;
   try
      STPValConta:=TStoredProc.Create(Nil);
      STPValConta.DatabaseName:=Objeto.Apli.DatabaseName;
      STPValConta.SessionName:=Objeto.Apli.SessionName;
      STPValConta.StoredProcName:='PKGCRREDESCTO.STPVALCONFGCONTA';
      STPValConta.Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
      STPValConta.Params.CreateParam(ftString,'PECVEFNDENTDES',ptInput);
      STPValConta.Params.CreateParam(ftString,'PECVEFNDPROGRAMA',ptInput);
      STPValConta.Params.CreateParam(ftString,'PSMENSAJE',ptOutput);
      STPValConta.Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
      STPValConta.Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
      STPValConta.Prepare;
      STPValConta.ParamByName('PEIDCREDITO').AsInteger := Objeto.ID_CREDITO.AsInteger;
      STPValConta.ParamByName('PECVEFNDENTDES').AsString := Objeto.CVE_FND_ENT_DES.AsString;
      STPValConta.ParamByName('PECVEFNDPROGRAMA').AsString := Objeto.CVE_FND_PROGRAMA.AsString;
      STPValConta.ExecProc;
      If (STPValConta. ParamByName('PSRESULTADO').AsInteger <> 0) Then Begin
         ShowMessage( IntToStr(STPValConta.ParamByName('PSRESULTADO').AsInteger)  + ' : ' +
                     STPValConta.ParamByName('PSTXRESULTADO').AsString );
         vlResultado := False;
      End Else
         If STPValConta.ParamByName('PSMENSAJE').AsString <> '' then begin
            lbConfgContable.Caption := 'Falta configuración contable de: ' +
                             STPValConta.ParamByName('PSMENSAJE').AsString;
            vlResultado := False;
         end else begin
            lbConfgContable.Caption := 'Configuración contable correcta.';
            vlResultado := True;
         end;
      STPValConta.UnPrepare;
   finally
      STPValConta.Free;
   end;
   ValidaConfgContable := vlResultado;
end;

procedure TwMDispFond.ch_CalculoInteresEspecialExit(Sender: TObject);
Var
   VLSalida  :  boolean;
   VLMsg     :  String;
begin
  // </ RABA > OCT 2011  SE VALIDA QUE LA CLAVE DE CALCULO Y EL CÁLCULO DE
  // INTERES ESPECIAL SEAN CORRESPONDIDOS A "IN" Y "RE"
  Objeto.CVE_CALCULO.GetFromControl;
  VlSalida := True;
  VLMsg := '';

  If Objeto.CVE_CALCULO.AsString <> '' then
  Begin
    If (Objeto.CVE_CALCULO.AsString <> 'IN') AND (Objeto.CVE_CALCULO.AsString <> 'RE') AND (ch_CalculoInteresEspecial.Checked) Then
    Begin
      VLMsg := 'La clave de cálculo de interés no aplica con el cálculo de interés especial.';
      VlSalida   := False;
      ch_CalculoInteresEspecial.Checked := False;
    End;
  End;
  InterForma1.ValidaExit(ch_CalculoInteresEspecial,VLSalida,VLMsg,True);
end;

procedure TwMDispFond.edID_PRESTAMO_PASExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_PRESTAMO_PAS,True,'',True);
end;

procedure TwMDispFond.edID_PRESTAMO_PASKeyPress(Sender: TObject;
  var Key: Char);
begin
   if NOT (key IN ['0'..'9', #13, #8]) then
   begin
      key := #0;
      exit;
   end;
end;

end.

