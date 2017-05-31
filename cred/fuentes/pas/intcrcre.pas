// Sistema         : Clase de Credito
// Fecha de Inicio : 20 de Abril de 1998
// Función forma   : Clase de Credito
// Desarrollo por  : Benjamin Hernandez Delsordo
// Comentarios     :

unit IntCrCre;                       

interface

uses
  Windows,   Messages, SysUtils, Classes,   Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask,     StdCtrls,  Buttons, ExtCtrls, InterFor,
  IntFind,   UnSQL2,   InterFun, ComCtrls,  IntDtPk,
  IntCrCon,  IntCrLiq, IntCrPre, IntCrCal,  IntTasIndFin, IntCrPar,
  IntEmple,  UnTTasa,  UnCrPack, IntCrPCa,  IntGCto;

type

  TCrCre = Class;
  TWCrCre = class(TForm)
    InterForma1: TInterForma;
    sbCVE_LIQUIDACION: TSpeedButton;
    sbCVE_PRESUPUESTO: TSpeedButton;
    lbID_CREDITO: TLabel;
    lbCVE_CALCULO: TLabel;
    lbCVE_LIQUIDACION: TLabel;
    lbCVE_PRESUPUESTO: TLabel;
    lbCVE_TASA_REFER: TLabel;
    lbCVE_USUAR_ALTA: TLabel;
    lbCVE_USU_AUT: TLabel;
    lbDIAS_BASE_CALC: TLabel;
    lbDIAS_PLAZO: TLabel;
    lbFACT_MORAS: TLabel;
    lbF_AUT_OPERACION: TLabel;
    lbF_CAPTURA_CRED: TLabel;
    lbF_TRASPASO_VENC: TLabel;
    lbF_ULT_CAPITAL: TLabel;
    lbF_ULT_INTERES: TLabel;
    lbF_VALOR_CRED: TLabel;
    lbH_AUT_OPERACION: TLabel;
    lbID_CONTRATO: TLabel;
    lbID_CRE_RENOVADO: TLabel;
    lbID_CRE_RENUEVA: TLabel;
    lbIMP_CREDITO: TLabel;
    lbIMP_DISPUESTO: TLabel;
    lbIMP_PROV_RETRO: TLabel;
    lbNUM_PER_ACT_CAP: TLabel;
    lbNUM_PER_ACT_INT: TLabel;
    lbSDO_INSOLUTO: TLabel;
    lbSOBRETASA: TLabel;
    lbID_CESION: TLabel;
    lbIMP_CAPITAL_PAG: TLabel;
    lbIMP_COMISION_VDO: TLabel;
    lbIMP_COMISION_PAG: TLabel;
    lbIMP_CAPITAL_VDO: TLabel;
    lbIMP_INTERES_VDO: TLabel;
    lbIMP_INTERES_PAG: TLabel;
    lbSDO_INSOLUTO_VIRT: TLabel;
    lbTX_INSTRUC_LIQ: TLabel;
    sbid_contrato: TSpeedButton;
    sbCVE_CALCULO: TSpeedButton;
    sbCVE_TASA_REFER: TSpeedButton;
    edID_CREDITO: TEdit;
    chB_APLICA_COM: TCheckBox;
    chB_APLICA_IVA: TCheckBox;
    chB_PROG_CARRETERO: TCheckBox;
    edCVE_CALCULO: TEdit;
    edCVE_LIQUIDACION: TEdit;
    edCVE_PRESUPUESTO: TEdit;
    edCVE_TASA_REFER: TEdit;
    edCVE_USUAR_ALTA: TEdit;
    edCVE_USU_AUT: TEdit;
    edDIAS_BASE_CALC: TEdit;
    edDIAS_PLAZO: TEdit;
    edFACT_MORAS: TEdit;
    dtpF_AUT_OPERACION: TInterDateTimePicker;
    edF_AUT_OPERACION: TEdit;
    dtpF_CAPTURA_CRED: TInterDateTimePicker;
    edF_CAPTURA_CRED: TEdit;
    dtpF_TRASPASO_VENC: TInterDateTimePicker;
    edF_TRASPASO_VENC: TEdit;
    dtpF_ULT_CAPITAL: TInterDateTimePicker;
    edF_ULT_CAPITAL: TEdit;
    dtpF_ULT_INTERES: TInterDateTimePicker;
    edF_ULT_INTERES: TEdit;
    dtpF_VALOR_CRED: TInterDateTimePicker;
    edF_VALOR_CRED: TEdit;
    edH_AUT_OPERACION: TEdit;
    edID_CONTRATO: TEdit;
    edID_CRE_RENOVADO: TEdit;
    edID_CRE_RENUEVA: TEdit;
    edIMP_CREDITO: TEdit;
    edIMP_DISPUESTO: TEdit;
    edIMP_PROV_RETRO: TEdit;
    edNUM_PER_ACT_CAP: TEdit;
    edNUM_PER_ACT_INT: TEdit;
    edSDO_INSOLUTO: TEdit;
    rgSIT_CREDITO: TRadioGroup;
    edSOBRETASA: TEdit;
    chB_PROG_FOPYME: TCheckBox;
    edID_CESION: TEdit;
    edIMP_CAPITAL_PAG: TEdit;
    edIMP_COMISION_VDO: TEdit;
    edIMP_COMISION_PAG: TEdit;
    edIMP_CAPITAL_VDO: TEdit;
    edIMP_INTERES_VDO: TEdit;
    edIMP_INTERES_PAG: TEdit;
    edSDO_INSOLUTO_VIRT: TEdit;
    chB_EMPLEADO: TCheckBox;
    edTX_INSTRUC_LIQ: TMemo;
    rgTIPO_DISPOSICION: TRadioGroup;
    rgOPERADOR_STASA: TRadioGroup;
    lbCVE_CALIF: TLabel;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    chB_EDOCTA: TCheckBox;
    chB_REFERENCIADO: TCheckBox;
    lbCVE_PER_JUR_REG: TLabel;
    edCVE_TIPO_BAJA: TEdit;
    Label30: TLabel;
    edF_RESTRINGIDO: TEdit;
    dtpF_RESTRINGIDO: TInterDateTimePicker;
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
    procedure sbid_contratoClick(Sender: TObject);
    procedure sbCVE_LIQUIDACIONClick(Sender: TObject);
    procedure sbCVE_PRESUPUESTOClick(Sender: TObject);
    procedure sbCVE_CALCULOClick(Sender: TObject);
    procedure sbCVE_TASA_REFERClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TCrCre;
  end;

  TCrCre = class(TInterFrame)
  private
  protected
    FOnCambioCredito             : TNotifyEvent;
    FOnCambioTasa                : TNotifyEvent;
  public
        ID_CREDITO               : TInterCampo;
        B_APLICA_COM             : TInterCampo;
        B_APLICA_IVA             : TInterCampo;
        B_EMPLEADO               : TInterCampo;
        B_PROG_CARRETERO         : TInterCampo;
        CVE_CALCULO              : TInterCampo;
        CVE_LIQUIDACION          : TInterCampo;
        CVE_PRESUPUESTO          : TInterCampo;
        CVE_TASA_REFER           : TInterCampo;
        CVE_USUAR_ALTA           : TInterCampo;
        CVE_USU_AUT              : TInterCampo;
        DIAS_BASE_CALC           : TInterCampo;
        DIAS_PLAZO               : TInterCampo;
        FACT_MORAS               : TInterCampo;
        F_AUT_OPERACION          : TInterCampo;
        F_CAPTURA_CRED           : TInterCampo;
        F_TRASPASO_VENC          : TInterCampo;
        F_ULT_CAPITAL            : TInterCampo;
        F_ULT_INTERES            : TInterCampo;
        F_VALOR_CRED             : TInterCampo;
        H_AUT_OPERACION          : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        ID_CRE_RENOVADO          : TInterCampo;
        ID_CRE_RENUEVA           : TInterCampo;
        IMP_CREDITO              : TInterCampo;
        IMP_DISPUESTO            : TInterCampo;
        IMP_PROV_RETRO           : TInterCampo;
        NUM_PER_ACT_CAP          : TInterCampo;
        NUM_PER_ACT_INT          : TInterCampo;
        OPERADOR_STASA           : TInterCampo;
        SDO_INSOLUTO             : TInterCampo;
        SIT_CREDITO              : TInterCampo;
        SOBRETASA                : TInterCampo;
        TIPO_DISPOSICION         : TInterCampo;
        B_PROG_FOPYME            : TInterCampo;
        ID_CESION                : TInterCampo;
        B_GENERA_EDOCTA          : TInterCampo;
        B_REFERENCIADO           : TInterCampo;

        IMP_BEN_GOB_CAP          : TInterCampo;
        IMP_BEN_GOB_INT          : TInterCampo;
        IMP_CAPITAL_PAG          : TInterCampo;
        IMP_CAPITAL_VDO          : TInterCampo;
        IMP_COMISION_PAG         : TInterCampo;
        IMP_COMISION_VDO         : TInterCampo;
        IMP_INTERES_PAG          : TInterCampo;
        IMP_INTERES_VDO          : TInterCampo;
        IMP_IVA_COM_PAG          : TInterCampo;
        IMP_IVA_COM_VDO          : TInterCampo;
        IMP_IVA_INT_PAG          : TInterCampo;
        IMP_IVA_INT_VDO          : TInterCampo;
        SDO_INSOLUTO_VIRT        : TInterCampo;
        TX_INSTRUC_LIQ           : TInterCampo;
        B_CAPITAL_PER            : TInterCampo;
        B_INTERES_PER            : TInterCampo;

        B_COBRANZA               : TInterCampo;
        NUM_CONS_REN             : TInterCampo;
        B_PAGO_FIJO              : TInterCampo;
        CICLO_REVISION           : TInterCampo;
        SDO_CONDIC_DIA           : TInterCampo;

        CODRESP                  : TInterCampo;
        F_VENCIMIENTO            : TInterCampo;
        PLAZOQ                   : TInterCampo;
        TASA_REAL                : TInterCampo;
        VALOR_TASA               : TIntercampo;
        IMP_IVA_PAG              : TInterCampo;
        IMP_TOT_PAG              : TInterCampo;
        TIPO_DISPOSICIONs        : string;
        SIT_CREDITOs             : string;

        CVE_CALIF                : TInterCampo;
        ID_PROM_ADM              : TInterCampo;

        CVE_TIPO_BAJA            : TInterCampo; //ROIM748 JULIO 2009
        F_RESTRINGIDO            : TInterCampo; //ROIM748 JULIO 2009

        Autorizacion             : TCrCon;
        Liquidacion              : TCrLiq;
        Presupuesto              : TCrPre;
        Calculo                  : TCrCal;
        Tasa                     : TTasIndFin;
        Empleado                 : TEmpleado;
        Promotor                 : TGpoCto;


        function    InternalBusca : boolean; override;
        function    InternalLocaliza :boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
//        function    Reporte:Boolean; override;
        procedure   DataBaseChange; override;
        procedure   LocalizaCurrent; override;
        procedure   OnAutorizacionDespuesBusca(Sender:TObject);
        procedure   OnTasaDespuesBusca(Sender:TObject);
        property    OnCambioCredito : TNotifyEvent Read FOnCambioCredito Write FOnCambioCredito;
        property    OnCambioTasa : TNotifyEvent Read FOnCambioTasa Write FOnCambioTasa;
        procedure   CambiaTasas(Sender:TObject);
        function    QuincenasADias : TDateTime;
        procedure   DiasAQuincenas;
//        procedure   Autoriza;
//        procedure   Cancela;
        procedure   GeneraPeriodos;
        function    GeneraPeriodosXSubTipo : boolean;
        procedure   GeneraPago;
        function    CuentaPerCap :  integer;
        function    CuentaPerInt : integer;
  published
  end;

implementation

uses
  IntCrPCG;

{$R *.DFM}

constructor TCrCre.Create( AOwner : TComponent );
begin
   Inherited;
   FOnCambioCredito:=nil;
   FOnCambioTasa:=nil;
   ID_CREDITO :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,True);
     ID_CREDITO.Caption:='Credito';
     ID_CREDITO.IsRequiered := True;
   B_APLICA_COM :=CreaCampo('B_APLICA_COM',ftString,tsNinguno,tsNinguno,True);
     B_APLICA_COM .Size:=1;
     B_APLICA_COM.Caption:='Aplica Comision';
   B_APLICA_IVA :=CreaCampo('B_APLICA_IVA',ftString,tsNinguno,tsNinguno,True);
     B_APLICA_IVA .Size:=1;
     B_APLICA_IVA.Caption:='Aplica Iva';
   B_EMPLEADO :=CreaCampo('B_EMPLEADO',ftString,tsNinguno,tsNinguno,True);
        B_EMPLEADO.Size:=1;
        B_EMPLEADO.Caption:='Empleado';
   B_PROG_CARRETERO :=CreaCampo('B_PROG_CARRETERO',ftString,tsNinguno,tsNinguno,True);
        B_PROG_CARRETERO .Size:=1;
        B_PROG_CARRETERO.Caption:='Programa Carretero';
   CVE_CALCULO :=CreaCampo('CVE_CALCULO',ftString,tsNinguno,tsNinguno,True);
        CVE_CALCULO.Size:=2;
        CVE_CALCULO.Caption:='Clave de Calculo';
        CVE_CALCULO.IsRequiered := True;
 { ***************************************************************************}
   CVE_CALIF :=CreaCampo('CVE_CALIF',ftString,tsNinguno,tsNinguno,True);
        CVE_CALIF .Size:=4;
        CVE_CALIF.Caption:='Clave de Calificación de la cartera';
   with CVE_CALIF do
   begin
     UseCombo:=True;
     ComboLista.Add('0');  ComboDatos.Add('PESO');
     ComboLista.Add('1');  ComboDatos.Add('UDI1');
     ComboLista.Add('2');  ComboDatos.Add('UDI2');
     ComboLista.Add('3');  ComboDatos.Add('FOVI');
     Caption:='Tipo de Operación';
   end;
{ *********************************************************************************}


   CVE_LIQUIDACION :=CreaCampo('CVE_LIQUIDACION',ftString,tsNinguno,tsNinguno,True);
        CVE_LIQUIDACION.Size:=2;
        CVE_LIQUIDACION.Caption:='Clave de Liquidacion';
        CVE_LIQUIDACION.IsRequiered := True;
   CVE_PRESUPUESTO :=CreaCampo('CVE_PRESUPUESTO',ftString,tsNinguno,tsNinguno,True);
        CVE_PRESUPUESTO.Size:=6;
        CVE_PRESUPUESTO.Caption:='Clave de Presupuesto';
        CVE_PRESUPUESTO.IsRequiered := True;
   CVE_TASA_REFER :=CreaCampo('CVE_TASA_REFER',ftString,tsNinguno,tsNinguno,True);
        CVE_TASA_REFER.Size:=8;
        CVE_TASA_REFER.Caption:='Clave de Tasa Referencia';
        CVE_TASA_REFER.IsRequiered := True;
   CVE_USUAR_ALTA :=CreaCampo('CVE_USUAR_ALTA',ftString,tsNinguno,tsNinguno,True);
        CVE_USUAR_ALTA .Size:=8;
        CVE_USUAR_ALTA.Caption:='Clave de Usuario Alta';
        CVE_USUAR_ALTA.IsRequiered := True;
   CVE_USU_AUT :=CreaCampo('CVE_USU_AUT',ftString,tsNinguno,tsNinguno,True);
        CVE_USU_AUT .Size:=8;
        CVE_USU_AUT.Caption:='Clave de Usuario de  Autorizacion';
   DIAS_BASE_CALC :=CreaCampo('DIAS_BASE_CALC',ftInteger,tsNinguno,tsNinguno,True);
        with DIAS_BASE_CALC do
        begin
          Caption:='Dias Base de Calculo';
          UseCombo:=True;
          ComboLista.Add('0');  ComboDatos.Add('360');
          ComboLista.Add('1');   ComboDatos.Add('365');
        end;
        DIAS_BASE_CALC.IsRequiered := True;
   DIAS_PLAZO :=CreaCampo('DIAS_PLAZO',ftInteger,tsNinguno,tsNinguno,True);
        DIAS_PLAZO.Caption:='Plazo (dias)';
        DIAS_PLAZO.IsRequiered := True;
   FACT_MORAS :=CreaCampo('FACT_MORAS',ftFloat,tsNinguno,tsNinguno,True);
        FACT_MORAS.Caption:='Factor de Moras';
        FACT_MORAS.IsRequiered := True;
   F_AUT_OPERACION :=CreaCampo('F_AUT_OPERACION',ftDateTime,tsNinguno,tsNinguno,True);
        F_AUT_OPERACION.Caption:='Fecha de Autorizacion Operacion';
   F_CAPTURA_CRED :=CreaCampo('F_CAPTURA_CRED',ftDate,tsNinguno,tsNinguno,True);
        F_CAPTURA_CRED.Caption:='Fecha Captura de Credito';
        F_CAPTURA_CRED.IsRequiered := True;
   F_TRASPASO_VENC :=CreaCampo('F_TRASPASO_VENC',ftDate,tsNinguno,tsNinguno,True);
        F_TRASPASO_VENC.Caption:='Fecha Traspaso Vencida';
   F_VALOR_CRED :=CreaCampo('F_VALOR_CRED',ftDate,tsNinguno,tsNinguno,True);
        F_VALOR_CRED.Caption:='Fecha Valor';
        F_VALOR_CRED.IsRequiered := True;
   F_ULT_CAPITAL :=CreaCampo('F_ULT_CAPITAL',ftDate,tsNinguno,tsNinguno,True);
        F_ULT_CAPITAL.Caption:='Fecha Ultimo Capital';
   F_ULT_INTERES :=CreaCampo('F_ULT_INTERES',ftDate,tsNinguno,tsNinguno,True);
        F_ULT_INTERES.Caption:='Fecha Ultimo Interes';
   H_AUT_OPERACION :=CreaCampo('H_AUT_OPERACION',ftInteger,tsNinguno,tsNinguno,True);
        H_AUT_OPERACION.Caption:='Hora de Aut Operacion';
   ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,True);
        ID_CONTRATO.Caption:='Autorizacion';
        ID_CONTRATO.IsRequiered := True;
   ID_CRE_RENOVADO :=CreaCampo('ID_CRE_RENOVADO',ftInteger,tsNinguno,tsNinguno,True);
        ID_CRE_RENOVADO.Caption:='Credito Renovado';
   ID_CRE_RENUEVA :=CreaCampo('ID_CRE_RENUEVA',ftInteger,tsNinguno,tsNinguno,True);
        ID_CRE_RENUEVA.Caption:='Importe de Credito que Renueva';
   IMP_CREDITO :=CreaCampo('IMP_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
        IMP_CREDITO.Caption:='Monto de Credito';
        IMP_CREDITO.IsRequiered := True;
   IMP_DISPUESTO :=CreaCampo('IMP_DISPUESTO',ftFloat,tsNinguno,tsNinguno,True);
        IMP_DISPUESTO.Caption:='Importe Dispuesto';
   IMP_PROV_RETRO :=CreaCampo('IMP_PROV_RETRO',ftFloat,tsNinguno,tsNinguno,True);
        IMP_PROV_RETRO.Caption:='Importe Provision Retroactiva';
   SDO_INSOLUTO :=CreaCampo('SDO_INSOLUTO',ftFloat,tsNinguno,tsNinguno,True);
      SDO_INSOLUTO.Caption:='Saldo Insoluto';
      SDO_INSOLUTO.IsRequiered := True;
   NUM_PER_ACT_CAP :=CreaCampo('NUM_PER_ACT_CAP',ftInteger,tsNinguno,tsNinguno,True);
        NUM_PER_ACT_CAP.Caption:='Numero de Periodo Actual de Capital';
   NUM_PER_ACT_INT :=CreaCampo('NUM_PER_ACT_INT',ftInteger,tsNinguno,tsNinguno,True);
        NUM_PER_ACT_INT.Caption:='Numero de Perido Actual de Interés';
   OPERADOR_STASA :=CreaCampo('OPERADOR_STASA',ftString,tsNinguno,tsNinguno,True);
      with OPERADOR_STASA do
      begin
        Size:=1;
        UseCombo:=True;
        ComboLista.Add('0');  ComboDatos.Add('+');
        ComboLista.Add('1');   ComboDatos.Add('*');
        Caption:='Operador de Sobretasa';
      end;
//      OPERADOR_STASA.IsRequiered := True;
   SIT_CREDITO :=CreaCampo('SIT_CREDITO',ftString,tsNinguno,tsNinguno,True);
      with SIT_CREDITO do
      begin
        Size:=2;
        UseCombo := True;
        ComboLista.Add('0');     ComboDatos.Add('IN');
        ComboLista.Add('1');  ComboDatos.Add('PA');
        ComboLista.Add('2');       ComboDatos.Add('AC');
        ComboLista.Add('3');    ComboDatos.Add('LQ');
        ComboLista.Add('4');    ComboDatos.Add('CA');
        Caption:='Situacion del Credito';
      end;
   SOBRETASA :=CreaCampo('SOBRETASA',ftFloat,tsNinguno,tsNinguno,True);
      SOBRETASA.Caption:='Sobretasa';
      SOBRETASA.IsRequiered := True;
   TIPO_DISPOSICION :=CreaCampo('TIPO_DISPOSICION',ftString,tsNinguno,tsNinguno,True);
      with TIPO_DISPOSICION do
      begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0');  ComboDatos.Add('DI');
        ComboLista.Add('1');  ComboDatos.Add('RN');
        ComboLista.Add('2');  ComboDatos.Add('RT');
        ComboLista.Add('3');  ComboDatos.Add('RS');
        Caption:='Tipo de Operación';
      end;
   B_PROG_FOPYME :=CreaCampo('B_PROG_FOPYME',ftString,tsNinguno,tsNinguno,True);
        B_PROG_FOPYME .Size:=1;
                B_PROG_FOPYME.Caption:='Programa Fopyme';
   ID_CESION :=CreaCampo('ID_CESION',ftInteger,tsNinguno,tsNinguno,True);
                ID_CESION.Caption:='Numero de Cesion';
   B_GENERA_EDOCTA :=CreaCampo('B_GENERA_EDOCTA',ftString,tsNinguno,tsNinguno,True);
     B_GENERA_EDOCTA .Size:=1;
     B_GENERA_EDOCTA.Caption:='B_GENERA_EDOCTA';
   B_REFERENCIADO :=CreaCampo('B_REFERENCIADO',ftString,tsNinguno,tsNinguno,True);
     B_REFERENCIADO .Size:=1;
     B_REFERENCIADO.Caption:='B_REFERENCIADO';


   IMP_BEN_GOB_CAP  := CreaCampo('IMP_BEN_GOB_CAP',ftFloat,tsNinguno,tsNinguno,True);
   IMP_BEN_GOB_INT  := CreaCampo('IMP_BEN_GOB_INT',ftFloat,tsNinguno,tsNinguno,True);
   IMP_CAPITAL_PAG  := CreaCampo('IMP_CAPITAL_PAG',ftFloat,tsNinguno,tsNinguno,True);
   IMP_CAPITAL_VDO  := CreaCampo('IMP_CAPITAL_VDO',ftFloat,tsNinguno,tsNinguno,True);
   IMP_COMISION_PAG := CreaCampo('IMP_COMISION_PAG',ftFloat,tsNinguno,tsNinguno,True);
   IMP_COMISION_VDO := CreaCampo('IMP_COMISION_VDO',ftFloat,tsNinguno,tsNinguno,True);
   IMP_INTERES_PAG  := CreaCampo('IMP_INTERES_PAG',ftFloat,tsNinguno,tsNinguno,True);
   IMP_INTERES_VDO  := CreaCampo('IMP_INTERES_VDO',ftFloat,tsNinguno,tsNinguno,True);
   IMP_IVA_COM_PAG  := CreaCampo('IMP_IVA_COM_PAG',ftFloat,tsNinguno,tsNinguno,True);
   IMP_IVA_COM_VDO  := CreaCampo('IMP_IVA_COM_VDO',ftFloat,tsNinguno,tsNinguno,True);
   IMP_IVA_INT_PAG  := CreaCampo('IMP_IVA_INT_PAG',ftFloat,tsNinguno,tsNinguno,True);
   IMP_IVA_INT_VDO  := CreaCampo('IMP_IVA_INT_VDO',ftFloat,tsNinguno,tsNinguno,True);

   SDO_INSOLUTO_VIRT :=CreaCampo('SDO_INSOLUTO_VIRT',ftFloat,tsNinguno,tsNinguno,True);
                SDO_INSOLUTO_VIRT.Caption:='Saldo Insoluto Virtual';
   TX_INSTRUC_LIQ :=CreaCampo('TX_INSTRUC_LIQ',ftString,tsNinguno,tsNinguno,True);
                TX_INSTRUC_LIQ.Caption:='Instruccion de Liquidacion';
   B_CAPITAL_PER :=CreaCampo('B_CAPITAL_PER',ftString,tsNinguno,tsNinguno,True);
        B_CAPITAL_PER.Size:=1;
   B_INTERES_PER :=CreaCampo('B_INTERES_PER',ftString,tsNinguno,tsNinguno,True);
        B_INTERES_PER.Size:=1;
   B_COBRANZA      :=CreaCampo('B_COBRANZA',ftString,tsNinguno,tsNinguno,True);
        B_COBRANZA.Size:=1;
   NUM_CONS_REN    :=CreaCampo('NUM_CONS_REN',ftInteger,tsNinguno,tsNinguno,True);
   B_PAGO_FIJO     :=CreaCampo('B_PAGO_FIJO',ftString,tsNinguno,tsNinguno,True);
        B_PAGO_FIJO.Size:=1;
   CICLO_REVISION  :=CreaCampo('CICLO_REVISION',ftInteger,tsNinguno,tsNinguno,True);
   SDO_CONDIC_DIA  :=CreaCampo('SDO_CONDIC_DIA',ftFloat,tsNinguno,tsNinguno,True);
   PLAZOQ := CreaCampo('PLAZOQ',ftInteger,tsNinguno,tsNinguno,False);
        PLAZOQ.Caption := 'Plazo en Quincenas';
   F_VENCIMIENTO  := CreaCampo('FECHA_INGRESO',ftDate,tsNinguno,tsNinguno,False);
        F_VENCIMIENTO.Caption := 'Fecha de Vencimiento';
        F_VENCIMIENTO.IsRequiered := True;
   TASA_REAL := CreaCampo('TASA_REAL',ftFloat,tsNinguno,tsNinguno,False);
   VALOR_TASA := CreaCampo('TASA_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
   IMP_IVA_PAG := CreaCampo('IMP_IVA_PAG',ftFloat,tsNinguno,tsNinguno,False);
   IMP_TOT_PAG := CreaCampo('IMP_TOT_PAG',ftFloat,tsNinguno,tsNinguno,False);
   ID_PROM_ADM := CreaCampo('ID_PROM_ADM',ftFloat,tsNinguno,tsNinguno,True);

      //ROIM748 JULIO 2009
      CVE_TIPO_BAJA :=CreaCampo('CVE_TIPO_BAJA',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_BAJA.Caption:='CVE_TIPO_BAJA';
      F_RESTRINGIDO :=CreaCampo('F_RESTRINGIDO',ftDate,tsNinguno,tsNinguno,True);
                F_RESTRINGIDO.Caption:='Fecha Restringido';
      //ROIM748 JULIO 2009                

      Autorizacion := TCrCon.Create(Self);
      Autorizacion.MasterSource := Self;
      Autorizacion.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';
      Autorizacion.OnDespuesBusca := OnAutorizacionDespuesBusca;

      Liquidacion := TCrLiq.Create(Self);
      Liquidacion.MasterSource := Self;
      Liquidacion.FieldByName('CVE_LIQUIDACION').MasterField := 'CVE_LIQUIDACION';

      Presupuesto := TCrPre.Create(Self);
      Presupuesto.MasterSource := Self;
      Presupuesto.FieldByName('CVE_PRESUPUESTO').MasterField := 'CVE_PRESUPUESTO';

      Calculo := TcrCal.Create(Self);
      Calculo.MasterSource := Self;
      Calculo.FieldByName('CVE_CALCULO').MasterField := 'CVE_CALCULO';

      Empleado := TEmpleado.Create(Self);
      Empleado.MasterSource := Autorizacion.Contrato;
      Empleado.FieldByName('ID_PERSONA').MasterField := 'ID_TITULAR';

      Tasa := TTasIndFin.Create(Self);
      Tasa.MasterSource := Self;
      Tasa.FieldByName('CVE_TASA_INDICAD').MasterField := 'CVE_TASA_REFER';
      Tasa.BuscaWhereString := 'TIPO_TASA_INDIC = ''MK'' AND B_TASA_CREDITO = ''V''';
      Tasa.OnDespuesBusca := OnTasaDespuesBusca;

      Promotor:=TGpoCto.Create(Self);
      Promotor.MasterSource:=Self;
      Promotor.FieldByName('ID_PERS_ASOCIAD').MasterField:='ID_PROM_ADM';

      FKeyFields.Add('ID_CREDITO');
      TableName := 'CRE_CREDITO';
      UseQuery := True;
      HelpFile := 'IntCrCre.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCre.Destroy;
begin
  if Tasa <> nil then Tasa.Free;
  if Calculo <> nil then Calculo.Free;
  if Presupuesto <> nil then Presupuesto.Free;
  if Liquidacion <> nil then Liquidacion.Free;
  if Empleado <> nil then Empleado.Free;
  if Autorizacion <> nil then Autorizacion.Free;
  inherited;
end;

procedure TCrCre.DataBaseChange;
begin
  inherited;
end;

function TCrCre.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCre;
begin
   W := TWCrCre.Create(Self);
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

function TCrCre.InternalBusca:Boolean;
Var T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IntCrCre.it','I');
  try
    if Active then
      begin
        T.Param(0,ID_CREDITO.AsString);
      end;
          if T.Execute then
            begin
              InternalBusca := FindKey([T.DameCampo(0)]);
            end;
      finally
        T.Free;
      end;
end;

function TCrCre.InternalLocaliza : boolean;
begin
  if not ((F_VALOR_CRED.AsString = '') or (DIAS_PLAZO.AsString = '')) then
  begin
    F_VENCIMIENTO.AsDateTime := F_VALOR_CRED.AsDateTime + DIAS_PLAZO.AsInteger;
    DiasAQuincenas;
  end;
  if SIT_CREDITO.AsString = 'IN' then
    SIT_CREDITOs := 'Inactivo'
  else
    if SIT_CREDITO.AsString = 'PA' then
      SIT_CREDITOs := 'Por Activar'
    else
      if SIT_CREDITO.AsString = 'AC' then
        SIT_CREDITOs := 'Activar'
      else
        if SIT_CREDITO.AsString = 'LQ' then
          SIT_CREDITOs := 'Liquidado'
        else
          if SIT_CREDITO.AsString = 'CA' then
            SIT_CREDITOs := 'Cancelado';
  if TIPO_DISPOSICION.AsString = 'DI' then
    TIPO_DISPOSICIONs := 'Disposición'
  else
    if TIPO_DISPOSICION.AsString = 'RN' then
      TIPO_DISPOSICIONs := 'Renovación'
    else
      if TIPO_DISPOSICION.AsString = 'RT' then
        TIPO_DISPOSICIONs := 'Revisión de Tasa'
      else
        if TIPO_DISPOSICION.AsString = 'RS' then
          TIPO_DISPOSICIONs := 'Reestructura';
  IMP_IVA_PAG.AsFloat := IMP_IVA_COM_PAG.AsFloat + IMP_IVA_INT_PAG.AsFloat;
  IMP_TOT_PAG.AsFloat := IMP_CAPITAL_PAG.AsFloat + IMP_INTERES_PAG.AsFloat +
                         IMP_COMISION_PAG.AsFloat + IMP_IVA_PAG.AsFloat;
  Result := True;
end;

procedure TCrCre.LocalizaCurrent;
begin
  inherited;
  if Assigned(FOnCambioCredito) then FOnCambioCredito(Self);
  if Assigned(FOnCambioTasa) then FOnCambioTasa(Self);
//  if (Autorizacion.Contrato.Active) then
//    begin Empleado.FindKey([Autorizacion.Contrato.ID_Titular.AsInteger]);
//    end;
end;

//function TCrCre.Reporte:Boolean;
//begin
//Execute_Reporte();
//end;

procedure TCrCre.OnAutorizacionDespuesBusca(Sender:TObject);
begin
  if (Modo=moEdit)or(modo=moAppend) then
    begin
      if Autorizacion.Active then
        if Assigned(OnCambioCredito) then FOnCambioCredito(Self);
    end;
end;

procedure TCrCre.OnTasaDespuesBusca(Sender:TObject);
begin
  if (Modo=moEdit)or(modo=moAppend) then
    begin
      if Tasa.Active then
        if Assigned(OnCambioTasa) then FOnCambioTasa(Self);
    end;
end;

procedure TCrCre.CambiaTasas(Sender:TObject);
begin
  if (SOBRETASA.AsString <> '') and (Tasa.Active) then
    if (OPERADOR_STASA.AsString = '+') then
      TASA_REAL.AsFloat := VALOR_TASA.AsFloat + SOBRETASA.AsFloat
    else
      TASA_REAL.AsFloat := VALOR_TASA.AsFloat * SOBRETASA.AsFloat;
end;

function TCrCre.CuentaPerCap;
var
  vlContador : integer;
begin
  vlContador := 0;
  if Active then
    GetSQLInt('SELECT COUNT(*) TOTAL FROM CRE_CAPITAL WHERE SIT_CAPITAL IN(''AC'',''PA'') AND ID_CREDITO = ' + ID_CREDITO.AsSQL + ' GROUP BY ID_CREDITO',DataBaseName,SessionName,'TOTAL', vlContador, True);
  Result := vlContador;
end;

function TCrCre.CuentaPerInt;
var
  vlContador : integer;
begin
  vlContador := 0;
  if Active then
    GetSQLInt('SELECT COUNT(*) TOTAL FROM CRE_INTERES WHERE SIT_INTERES IN(''AC'',''PA'') AND ID_CREDITO = ' + ID_CREDITO.AsSQL + ' GROUP BY ID_CREDITO',DataBaseName,SessionName,'TOTAL', vlContador, True);
  Result := vlContador;
end;

procedure TWCrCre.FormShow(Sender: TObject);
begin
      Objeto.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.B_APLICA_COM.Control:=chB_APLICA_COM;
      Objeto.B_APLICA_IVA.Control:=chB_APLICA_IVA;
      Objeto.B_EMPLEADO.Control:=chB_EMPLEADO;
      Objeto.B_PROG_CARRETERO.Control:=chB_PROG_CARRETERO;
      Objeto.B_GENERA_EDOCTA.Control:=chB_EDOCTA;
      Objeto.B_REFERENCIADO.Control:=chB_REFERENCIADO;

      Objeto.CVE_USUAR_ALTA.Control:=edCVE_USUAR_ALTA;
      Objeto.CVE_USU_AUT.Control:=edCVE_USU_AUT;
      Objeto.DIAS_BASE_CALC.Control:=edDIAS_BASE_CALC;
      Objeto.DIAS_PLAZO.Control:=edDIAS_PLAZO;
      Objeto.FACT_MORAS.Control:=edFACT_MORAS;
      Objeto.F_AUT_OPERACION.Control:=edF_AUT_OPERACION;
      Objeto.F_CAPTURA_CRED.Control:=edF_CAPTURA_CRED;
      Objeto.F_TRASPASO_VENC.Control:=edF_TRASPASO_VENC;
      Objeto.F_ULT_CAPITAL.Control:=edF_ULT_CAPITAL;
      Objeto.F_ULT_INTERES.Control:=edF_ULT_INTERES;
      Objeto.F_VALOR_CRED.Control:=edF_VALOR_CRED;
      Objeto.H_AUT_OPERACION.Control:=edH_AUT_OPERACION;
      Objeto.ID_CRE_RENOVADO.Control:=edID_CRE_RENOVADO;
      Objeto.ID_CRE_RENUEVA.Control:=edID_CRE_RENUEVA;
      Objeto.IMP_CREDITO.Control:=edIMP_CREDITO;
      Objeto.IMP_DISPUESTO.Control:=edIMP_DISPUESTO;
      Objeto.IMP_PROV_RETRO.Control:=edIMP_PROV_RETRO;
      Objeto.NUM_PER_ACT_CAP.Control:=edNUM_PER_ACT_CAP;
      Objeto.NUM_PER_ACT_INT.Control:=edNUM_PER_ACT_INT;
      Objeto.OPERADOR_STASA.Control:=rgOPERADOR_STASA;
      Objeto.SDO_INSOLUTO.Control:=edSDO_INSOLUTO;
      Objeto.SIT_CREDITO.Control:=rgSIT_CREDITO;
      Objeto.SOBRETASA.Control:=edSOBRETASA;
      Objeto.TIPO_DISPOSICION.Control:= rgTIPO_DISPOSICION;
      Objeto.B_PROG_FOPYME.Control:=chB_PROG_FOPYME;
      Objeto.ID_CESION.Control:=edID_CESION;
      Objeto.IMP_CAPITAL_PAG.Control:=edIMP_CAPITAL_PAG;
      Objeto.IMP_COMISION_VDO.Control:=edIMP_COMISION_VDO;
      Objeto.IMP_COMISION_PAG.Control:=edIMP_COMISION_PAG;
      Objeto.IMP_CAPITAL_VDO.Control:=edIMP_CAPITAL_VDO;
      Objeto.IMP_INTERES_VDO.Control:=edIMP_INTERES_VDO;
      Objeto.IMP_INTERES_PAG.Control:=edIMP_INTERES_PAG;
      Objeto.SDO_INSOLUTO_VIRT.Control:=edSDO_INSOLUTO_VIRT;
      Objeto.TX_INSTRUC_LIQ.Control:=edTX_INSTRUC_LIQ;

      Objeto.Autorizacion.ID_CONTRATO.Control := edID_CONTRATO;
      Objeto.Autorizacion.MasterSourceEditControl := sbID_CONTRATO;
      Objeto.Liquidacion.DESC_LIQUIDACION.Control := edCVE_LIQUIDACION;
      objeto.Liquidacion.MasterSourceEditControl := sbCVE_LIQUIDACION;
      Objeto.Presupuesto.DESC_PRESUPUESTO.Control := edCVE_PRESUPUESTO;
      Objeto.Presupuesto.MasterSourceEditControl := sbCVE_PRESUPUESTO;
      Objeto.Tasa.DESC_TASA_INDIC.Control := edCVE_TASA_REFER;
      Objeto.Tasa.MasterSourceEditControl := sbCVE_TASA_REFER;
      objeto.Calculo.DESC_CALCULO.Control := edCVE_CALCULO;
      objeto.Calculo.MasterSourceeditControl := sbCVE_CALCULO;

      //ROIM748 JULIO 2009
      objeto.CVE_TIPO_BAJA.Control := edCVE_TIPO_BAJA;
      objeto.F_RESTRINGIDO.Control := edF_RESTRINGIDO;
      //ROIM748 JULIO 2009



end;

procedure TWCrCre.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CREDITO.Control:=nil;
      Objeto.B_APLICA_COM.Control:=nil;
      Objeto.B_APLICA_IVA.Control:=nil;
      Objeto.B_EMPLEADO.Control:=nil;
      Objeto.B_PROG_CARRETERO.Control:=nil;
      Objeto.B_GENERA_EDOCTA.Control:=nil;
      Objeto.B_REFERENCIADO.Control:=nil;
      Objeto.CVE_USUAR_ALTA.Control:=nil;
      Objeto.CVE_USU_AUT.Control:=nil;
      Objeto.DIAS_BASE_CALC.Control:=nil;
      Objeto.DIAS_PLAZO.Control:=nil;
      Objeto.FACT_MORAS.Control:=nil;
      Objeto.F_AUT_OPERACION.Control:=nil;
      Objeto.F_CAPTURA_CRED.Control:=nil;
      Objeto.F_TRASPASO_VENC.Control:=nil;
      Objeto.F_ULT_CAPITAL.Control:=nil;
      Objeto.F_ULT_INTERES.Control:=nil;
      Objeto.F_VALOR_CRED.Control:=nil;
      Objeto.H_AUT_OPERACION.Control:=nil;
      Objeto.ID_CRE_RENOVADO.Control:=nil;
      Objeto.ID_CRE_RENUEVA.Control:=nil;
      Objeto.IMP_CREDITO.Control:=nil;
      Objeto.IMP_DISPUESTO.Control:=nil;
      Objeto.IMP_PROV_RETRO.Control:=nil;
      Objeto.NUM_PER_ACT_CAP.Control:=nil;
      Objeto.NUM_PER_ACT_INT.Control:=nil;
      Objeto.OPERADOR_STASA.Control:=nil;
      Objeto.SDO_INSOLUTO.Control:=nil;
      Objeto.SIT_CREDITO.Control:=nil;
      Objeto.SOBRETASA.Control:=nil;
      Objeto.TIPO_DISPOSICION.Control:=nil;
      Objeto.B_PROG_FOPYME.Control:=nil;
      Objeto.ID_CESION.Control:=nil;
      Objeto.IMP_CAPITAL_PAG.Control:=nil;
      Objeto.IMP_COMISION_VDO.Control:=nil;
      Objeto.IMP_COMISION_PAG.Control:=nil;
      Objeto.IMP_CAPITAL_VDO.Control:=nil;
      Objeto.IMP_INTERES_VDO.Control:=nil;
      Objeto.IMP_INTERES_PAG.Control:=nil;
      Objeto.SDO_INSOLUTO_VIRT.Control:=nil;
      Objeto.TX_INSTRUC_LIQ.Control:=nil;

      Objeto.Autorizacion.ID_CONTRATO.Control := nil;
      Objeto.Autorizacion.MasterSourceEditControl := nil;
      Objeto.Liquidacion.DESC_LIQUIDACION.Control := nil;
      objeto.Liquidacion.MasterSourceEditControl := nil;
      Objeto.Presupuesto.DESC_PRESUPUESTO.Control := nil;
      Objeto.Presupuesto.MasterSourceEditControl := nil;
      Objeto.Tasa.DESC_TASA_INDIC.Control := nil;
      Objeto.Tasa.MasterSourceEditControl := nil;
      objeto.Calculo.DESC_CALCULO.Control := nil;
      objeto.Calculo.MasterSourceeditControl := nil;

      //ROIM748 JULIO 2009
      objeto.CVE_TIPO_BAJA.Control := nil;
      objeto.F_RESTRINGIDO.Control := nil;
      //ROIM748 JULIO 2009


end;

procedure TWCrCre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrCre.InterForma1Nuevo(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Append;
   Realizado := True;
end;

procedure TWCrCre.InterForma1Aceptar(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Post;
   Realizado := True;
end;

procedure TWCrCre.InterForma1Cancelar(Sender: TObject; var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Cancel;
   Realizado := True;
end;

procedure TWCrCre.InterForma1Eliminar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado:=False;
   Objeto.Delete;
   Realizado:=True;
end;

procedure TWCrCre.InterForma1Buscar(Sender: TObject);
begin
   Objeto.Busca;
end;

procedure TWCrCre.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Edit;
   Realizado := True;
end;

procedure TWCrCre.InterForma1Ayuda(Sender: TObject);
begin
   Objeto.Help;
end;

procedure TWCrCre.InterForma1DespuesNuevo(Sender: TObject);
begin
  edID_CREDITO.SetFocus;
end;

procedure TWCrCre.InterForma1DespuesModificar(Sender: TObject);
begin
  edID_CREDITO.SetFocus;
end;

procedure TWCrCre.sbCVE_LIQUIDACIONClick(Sender: TObject);
begin
  objeto.Liquidacion.Busca;
end;

procedure TWCrCre.sbCVE_PRESUPUESTOClick(Sender: TObject);
begin
  Objeto.Presupuesto.Busca;
end;

procedure TWCrCre.sbCVE_CALCULOClick(Sender: TObject);
begin
  Objeto.Calculo.Busca;
end;

procedure TWCrCre.sbCVE_TASA_REFERClick(Sender: TObject);
begin
  Objeto.Tasa.Busca;
end;

procedure TWCrCre.sbid_contratoClick(Sender: TObject);
begin
  Objeto.Autorizacion.Busca;
end;



{
procedure TCrCre.Autoriza;
var
  Hour, Min, Sec, MSec: Word;
  Paquete : TCrPack;
begin
  if Active and Autorizacion.Active then
    begin
      if (SIT_CREDITO.AsString = 'IN') and (SitCred = sitIN) then
        begin
          if (MessageDlg('El credito será enviado a mesa de control para autorizarse', mtConfirmation, mbOkCancel, 0) = mrOk) then
            begin
              if Acceso('AP') then
                begin
                  try
                    InsertaTransaccion(ID_CREDITO.AsInteger, Autorizacion.ID_CONTRATO.AsInteger, Apli.SysDateTime, 0, IMP_CREDITO.AsFloat, 0, 0, 'CALTDI', Apli.SysDateTime, IMP_CREDITO.AsFloat, 'ALTA DE DISPOSICION', Self, True);
                    Edit;
                    F_CAPTURA_CRED.AsDateTime := Apli.SysDateTime;
                    CVE_USUAR_ALTA.AsString:= DameUsuario;
                    SIT_CREDITO.AsString := 'PA';
                    Post;
                    ShowMessage('Credito '+ ID_CREDITO.AsString +' por Autorizar en Mesa de Control');
                  except
                    if Modo = moEdit then
                      Cancel;
                    raise EInterframe.Create('La autorizacion no ha sido efectuada');
                  end;
                end
              else
                begin raise EInterframe.Create('No tiene acceso para ejecutar esta funcion, verifique con su administrador'); Exit;
                end;
            end;
        end
      else if (SIT_CREDITO.AsString = 'PA') and (SitCred = sitPA) and (Autorizacion.Contrato.Id_Cto_Liq.AsString <> '') then
        begin
          if (MessageDlg('El credito será autorizado', mtConfirmation, mbOkCancel, 0) = mrOk) then
            begin
              if Acceso('AO') then
                begin
                  try
                    if TIPO_DISPOSICION.AsString = 'DI' then
                      InsertaTransaccion(ID_CREDITO.AsInteger, Autorizacion.ID_CONTRATO.AsInteger, Apli.SysDateTime, 0, IMP_CREDITO.AsFloat, 0, 0, 'CAUTDI', Apli.SysDateTime, IMP_CREDITO.AsFloat, 'AUTORIZACION DE DISPOSICION', Self, True)
                    else
                      InsertaTransaccion(ID_CREDITO.AsInteger, Autorizacion.ID_CONTRATO.AsInteger, Apli.SysDateTime, 0, IMP_CREDITO.AsFloat, 0, 0, 'CAUTRE', Apli.SysDateTime, IMP_CREDITO.AsFloat, 'AUTORIZACION DE DISPOSICION', Self, True);
                    Edit;
                    F_AUT_OPERACION.AsDateTime := Apli.SysDateTime;
                    CVE_USU_AUT.AsString:= DameUsuario;
                    DecodeTime(F_AUT_OPERACION.AsDateTime, Hour, Min, Sec, MSec);
                    H_AUT_OPERACION.AsString := FormatFloat('00',Hour) + FormatFloat('00',Min) + FormatFloat('00',Sec);
                    SIT_CREDITO.AsString := 'AC';
                    Post;
                    ShowMessage('Credito '+ ID_CREDITO.AsString +' Autorizado');
                  except
                    //Cancel;
                    raise EInterframe.Create('La autorizacion no ha sido efectuada');
                  end;
                end
              else
                begin raise EInterframe.Create('No tiene acceso para ejecutar esta funcion, verifique con su administrador'); Exit;
                end;
            end;
        end
      else raise EInterframe.Create('La autorizacion no puede ser efectuada');
    end;
end;

procedure TCrCre.Cancela;
var
  Paquete : TCrPack;
begin
  if Active and Autorizacion.Active then
    begin
      if ((SIT_CREDITO.AsString = 'IN') and (SitCred = SitIN)) or ((SIT_CREDITO.AsString = 'PA') and (SitCred = sitPA)) then
        begin
          if (MessageDlg('El credito será cancelado', mtConfirmation, mbOkCancel, 0) = mrOk) then
            begin
              if Acceso('CA') then
                begin
                  try
                    InsertaTransaccion(ID_CREDITO.AsInteger, Autorizacion.ID_CONTRATO.AsInteger, Apli.SysDateTime, 0, IMP_CREDITO.AsFloat, 0, 0, 'CCANDI', Apli.SysDateTime, IMP_CREDITO.AsFloat, 'CANCELACION DE DISPOSICION', Self, True);
                    Edit;
                    SIT_CREDITO.AsString := 'CA';
                    Post;
                    ShowMessage('Credito '+ ID_CREDITO.AsString +' cancelado');
                  except
                    if Modo = moEdit then
                      Cancel;
                    raise EInterframe.Create('La cancelacion no ha sido efectuada'); Exit;
                  end;
                end
              else
                begin raise EInterframe.Create('No tiene acceso para ejecutar esta funcion, verifique con su administrador'); Exit;
                end;
            end;
        end
      else
        raise EInterframe.Create('La cancelacion no puede ser efectuada');
    end;
end;
}

function TCrCre.QuincenasADias : TDateTime;
var
  Q : TQuery;
  Contador : integer;
  Dias : variant;
  FechaAnt : TDateTime;
  FechaNue : TDateTime;
begin
  Q := GetSQLQuery('SELECT * FROM CRE_FECHA_NOMINA WHERE F_PAGO >= ' + F_VALOR_CRED.AsSQL + '+10 ' + 'ORDER BY F_PAGO ASC', DataBaseName, SessionName, False);
  try
    FechaAnt := Q.FieldByName('F_PAGO').AsDateTime;
    Result := FechaAnt;
    Dias := FechaAnt - F_VALOR_CRED.AsDateTime;
    for Contador := 1 to PLAZOQ.AsInteger - 1 do
      begin
        Q.Next;
        FechaNue := Q.FieldByName('F_PAGO').AsDateTime;
        Dias := Dias + (FechaNue - FechaAnt);
        FechaAnt := FechaNue;
      end;
    if (Modo = moEdit) or (Modo = moAppend) then
      DIAS_PLAZO.AsInteger := Dias;
  finally
    if Q <> nil then Q.Free; Q := nil;
  end;
end;

procedure TCrCre.DiasAQuincenas;
var
  Q : TQuery;
  Quincenas : integer;
  SQL : string;
begin
  SQL :='SELECT COUNT(F_PAGO) QUINCENAS '+
                     'FROM CRE_FECHA_NOMINA '+
                     'WHERE F_PAGO >= ' + F_VALOR_CRED.AsSQL + '+10 AND ' +
                     'F_PAGO <= ' + F_VENCIMIENTO.AsSQL + ' '+
                     'ORDER BY F_PAGO ASC';
  try
    Q := GetSQLQuery(SQL, DataBaseName, SessionName, False);
    Quincenas := Q.FieldByName('QUINCENAS').AsInteger;
    PLAZOQ.AsInteger := Quincenas;
  finally
    if Q <> nil then Q.Free; Q := nil;
  end;
end;

procedure TCrCre.GeneraPago;
begin
  if B_CAPITAL_PER.AsString = 'F' then
  RunSQL('INSERT INTO CRE_CAPITAL                                                            ' +
         '   (ID_CREDITO,   NUM_PERIODO,   B_COB_AUT,   F_PAGO,                              ' +
         '    F_PROG_PAGO,   F_VENCIMIENTO,   FACT_CAPITALIZA,   IMP_BENEF_BCO,              ' +
         '    IMP_BENEF_GOB,   IMP_CAPITAL,   IMP_CAPITALIZA,   IMP_PAGADO,   IMP_VENCIDO,   ' +
         '    PLAZO,   SIT_CAPITAL,   TASA_APLICADA,   TIPO_CAPITALIZA)                      ' +
         'VALUES                                                                             ' +
         '   (' + ID_CREDITO.AsSQL +',   1, ''F'',' + 'NULL' + ',               ' +
         '    ' + F_VENCIMIENTO.AsSQL + ',' + F_VENCIMIENTO.AsSQL + ', 0, 0,                 ' +
         '    0,' + IMP_CREDITO.AsSQL + ',   0,   0,   0,                                    ' +
         '    ' + DIAS_PLAZO.AsSQL + ', ''AC'',' + TASA_REAL.AsSQL + ',  0)                  '
         ,DataBaseName,SessionName,True);
  if B_INTERES_PER.AsString = 'F' then
  RunSQL('INSERT INTO CRE_INTERES                                                                             ' +
         '   (ID_CREDITO,   NUM_PERIODO,   B_COB_AUT,   F_PAGO,   F_PROG_PAGO,                                ' +
         '    F_VENCIMIENTO,   FACT_CAPITALIZA,   IMP_BENEF_BCO,   IMP_BENEF_GOB,   IMP_CAPITALIZA,           ' +
         '    IMP_INTERES_AYER,   IMP_INTERES_DIA,   IMP_INTERES_ORIG,   IMP_INTERES_PER,   IMP_INTERES_PROY, ' +
         '    IMP_IVA,   IMP_IVA_PAGADO,   IMP_IVA_PROYEC,   IMP_PAGADO,   IMP_PAGO_FIJO,   IMP_VENCIDO,      ' +
         '    PLAZO,   SIT_INTERES,   TASA_APLICADA,   TIPO_CAPITALIZA)                                       ' +
         'VALUES                                                                                              ' +
         '   (' + ID_CREDITO.AsSQL + ',   1, ''F'',' + 'NULL' + ',' + F_VENCIMIENTO.AsSQL + ',   ' +
         '    ' + F_VENCIMIENTO.AsSQL + ',  0,   0,   0,   0,                                                 ' +
         '     0,  0,   0,   0,   0,                                                                          ' +
         '     0,   0,   0,   0,   0,   0,                                                                    ' +
         '    ' + DIAS_PLAZO.AsSQL  + ',''AC'',' + TASA_REAL.AsSQL + ',   0)                                  '
         ,DataBaseName,SessionName,True);
end;

procedure TCrCre.GeneraPeriodos;
var
  Paquete : TCrPack;
  FPrimeraR : variant;
begin
  FPrimeraR := Int(QuincenasADias);
  Paquete := TCrPack.Create(Self);
  try
    Paquete.Apli := Apli;
    Paquete.GeneraPeriodos(ID_CREDITO.AsInteger, PLAZOQ.AsInteger, FPrimeraR, TASA_REAL.AsFloat);
  finally
    if Paquete <> nil then Paquete.Free; Paquete := nil;
  end;
end;

function TCrCre.GeneraPeriodosXSubTipo : boolean;
var
  CrPCG : TCrPCG;
begin
  Result := False;
  if (Autorizacion.SubtipoBanco.CVE_SUB_TIP_BCO.AsInteger = 155) then
  begin
    CrPCG := TCrPCG.Create(Self);
    try
      CrPCG.GetParams(Self);
      CrPCG.Credito.AsInteger       := ID_CREDITO.AsInteger;
      CrPCG.Monto.AsFloat           := IMP_CREDITO.AsFloat;
      CrPCG.FechaInicial.AsDateTime := F_VALOR_CRED.AsDateTime;
      CrPCG.GenerarPeriodos;
      Edit;
      DIAS_PLAZO.AsInteger     := CrPCG.PlazoCred.AsInteger;
      F_VENCIMIENTO.AsDateTime := CrPCG.FechaFinal.AsDateTime;
      B_CAPITAL_PER.AsString   := 'V';
      B_INTERES_PER.AsString   := 'V';
      B_APLICA_COM.AsString    := 'V';
      Post;
      Result := True;
    finally
      CrPCG.Free; CrPCG := nil;
    end;
  end;
end;

end.



