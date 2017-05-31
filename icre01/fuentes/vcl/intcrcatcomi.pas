// UNIDAD LOCAL
// Sistema         : Clase de CR_CAT_COMISION
// Fecha de Inicio : 14/01/2005
// Función forma   : Clase de CR_CAT_COMISION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
// Modificado por  : 
//   FECHA          NOMBRE         COMENTARIO 
// ------------- -------------- ----------------------------------
// 27-JUN-2006    LOLS          CREDITO EN LINEA     
Unit IntCrCatComi;

interface

uses                   
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit,
//unidades adiconales
IntGenCre,
IntParamCre,
//
IntTasIndFin,   //Tasa Refer
IntCrUniTie,    //Unidad de tiempo 
IntMon          //Moneda
;
//
Type
  TCrCatComi= class;

  TWCrCatComision=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_COMISION : TLabel;
    edCVE_COMISION : TEdit;
    chB_APLICA_IVA : TCheckBox;
    chB_APLICA_MORA : TCheckBox;
    chB_APLICA_INGRESO : TCheckBox;
    lbIMP_COMISION : TLabel;
    lbDESC_COMISION : TLabel;
    edDESC_COMISION : TEdit;
    rgSIT_CAT_COMISION : TRadioGroup;
    chB_GENERA_FACTURA : TCheckBox;
    lbCVE_APLIC_COM : TLabel;
    rgCVE_IMP_CALC_COM : TRadioGroup;
    chbcalcprom1: TCheckBox;
    edIMP_COMISION: TInterEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    MsgPanel: TPanel;
    lbF_ALTA: TLabel;
    edF_ALTA: TEdit;
    lbCVE_USU_ALTA: TLabel;
    edCVE_USU_ALTA: TEdit;
    cbCVE_APLIC_COM: TComboBox;
    rgCVE_TIPO_COM: TRadioGroup;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btMONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    ilMONEDA: TInterLinkit;
    cbB_PRORRATEO: TCheckBox;
    cbB_TASA_MORA_OPE: TCheckBox;
    cbB_MODIFICA_CAT: TCheckBox;
    rgCVE_TIPO_COBRO: TRadioGroup;
    rgB_CALC_PROMEDIO: TRadioGroup;
    cbCVE_MONEDA: TCheckBox;
    cbB_COMIS_PREM: TCheckBox;
    cbB_APLVENC_SI: TCheckBox;
    rgCVE_TIPO_COMIS: TRadioGroup;
    cbB_BLOQ_SALDO: TCheckBox;
    GroupBox1: TGroupBox;
    Label19: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    lbUNIDAD_TIEMPO_CO: TLabel;
    edCVE_UN_TIEMPO_GR: TEdit;
    edCVE_UN_TIEMPO_CO: TEdit;
    edDESC_UN_TIEMPO_CO: TEdit;
    btUNIDAD_TIEMPO_CO: TBitBtn;
    edNUM_UNIDADES_CO: TInterEdit;
    edNUM_UNIDADES_GR: TInterEdit;
    edDESC_UN_TIEMPO_GR: TEdit;
    btUNIDAD_TIEMPO_GR: TBitBtn;
    GroupBox2: TGroupBox;
    lbCVE_TASA_MORA: TLabel;
    edCVE_TASA_MORA: TEdit;
    btCVE_TASA_MORA: TBitBtn;
    edDESC_TASA_MORA: TEdit;
    lbOPERADOR_STASA_M: TLabel;
    ilTASA_MORA: TInterLinkit;
    edOPERADOR_STASA_M: TEdit;
    lbSOBRETASA_M: TLabel;
    edSOBRETASA_M: TInterEdit;
    Panel_Eventual: TPanel;
    lbCVE_EVENTO_COM: TLabel;
    cbCVE_EVENTO_COM: TComboBox;
    Panel_Periodica: TPanel;
    lbCVE_TIPO_APLICACION: TLabel;
    cbCVE_TIPO_APLICA: TComboBox;
    lbUNIDAD_TIEMPO_CN: TLabel;
    edCVE_UN_TIEMPO_CN: TEdit;
    edDESC_UN_TIEMPO_CN: TEdit;
    btUNIDAD_TIEMPO_CN: TBitBtn;
    lbNUM_UNIDADES_CN: TLabel;
    edNUM_UNIDADES_CN: TInterEdit;
    lbDIA_PAGO_CN: TLabel;
    edDIA_PAGO_CN: TInterEdit;
    gbCobroPorcentaje: TGroupBox;
    lbPCT_COMISION: TLabel;
    edPCT_COMISION: TInterEdit;
    lbIMP_MINIMO: TLabel;
    edIMP_MINIMO: TInterEdit;
    lbIMP_MAXIMO: TLabel;
    edIMP_MAXIMO: TInterEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_COMISIONExit(Sender: TObject);
    procedure edDESC_COMISIONExit(Sender: TObject);
    procedure chB_APLICA_IVAExit(Sender: TObject);
    procedure chB_APLICA_MORAExit(Sender: TObject);
    procedure chB_APLICA_INGRESOExit(Sender: TObject);
    procedure chB_GENERA_FACTURAExit(Sender: TObject);
    procedure cbCVE_APLIC_COMExit(Sender: TObject);

    procedure edPCT_COMISIONExit(Sender: TObject);
    procedure edIMP_COMISIONExit(Sender: TObject);
    procedure rgCVE_IMP_CALC_COMExit(Sender: TObject);
    procedure rgSIT_CAT_COMISIONExit(Sender: TObject);
    procedure InterForma1AntesModificar(Sender: TObject; var Realizado: Boolean);
    procedure rgCVE_TIPO_COMExit(Sender: TObject);
    procedure cbCVE_TIPO_APLICAExit(Sender: TObject);
    procedure rgCVE_TIPO_COMClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure btMONEDAClick(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure cbB_TASA_MORA_OPEExit(Sender: TObject);
    procedure cbB_PRORRATEOExit(Sender: TObject);
    procedure cbB_MODIFICA_CATExit(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure edCVE_TASA_MORAExit(Sender: TObject);
    procedure btCVE_TASA_MORAClick(Sender: TObject);
    procedure ilTASA_MORACapture(Sender: TObject; var Show: Boolean);
    procedure ilTASA_MORAEjecuta(Sender: TObject);
    procedure edOPERADOR_STASA_MExit(Sender: TObject);
    procedure edSOBRETASA_MExit(Sender: TObject);
    procedure edNUM_UNIDADES_COExit(Sender: TObject);
    procedure edDESC_UN_TIEMPO_COExit(Sender: TObject);
    procedure edDESC_UN_TIEMPO_GRExit(Sender: TObject);
    procedure btUNIDAD_TIEMPO_COClick(Sender: TObject);
    procedure btUNIDAD_TIEMPO_GRClick(Sender: TObject);
    procedure edNUM_UNIDADES_GRExit(Sender: TObject);
    procedure btUNIDAD_TIEMPO_CNClick(Sender: TObject);
    procedure edNUM_UNIDADES_CNExit(Sender: TObject);
    procedure edDIA_PAGO_CNExit(Sender: TObject);
    procedure rgCVE_TIPO_COBROExit(Sender: TObject);
    procedure edIMP_MINIMOExit(Sender: TObject);
    procedure edIMP_MAXIMOExit(Sender: TObject);
    procedure edDESC_UN_TIEMPO_CNExit(Sender: TObject);
    procedure cbCVE_MONEDAClick(Sender: TObject);
    procedure cbCVE_MONEDAExit(Sender: TObject);
    procedure cbCVE_EVENTO_COMExit(Sender: TObject);
    procedure rgB_CALC_PROMEDIOExit(Sender: TObject);
    procedure edCVE_COMISIONChange(Sender: TObject);
    procedure chB_APLICA_MORAClick(Sender: TObject);
    procedure cbB_TASA_MORA_OPEClick(Sender: TObject);
    procedure cbCVE_TIPO_APLICAChange(Sender: TObject);
    procedure rgCVE_TIPO_COBROClick(Sender: TObject);
    procedure btUNIDAD_TIEMPO_CNExit(Sender: TObject);
    procedure cbB_TASA_MORA_OPEEnter(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure cbB_COMIS_PREMExit(Sender: TObject);
    procedure rgCVE_TIPO_COMISExit(Sender: TObject);
    procedure cbB_APLVENC_SIExit(Sender: TObject);
    procedure cbB_BLOQ_SALDOExit(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
  private
    SIT_COMIS_OLD : string;
  private
    procedure OnOffMismaMora;
    procedure OnOffTasaMora;
    procedure OnOffMoneda;
    procedure OnOffFrecuencia;
    procedure OnOffUnFrecuencia;
    procedure OnOffTipoCobro;
    Procedure UnTiempoPeriodicoOtro(vlVisible:Boolean);  //RABA FEB 2012  PPP    
    { Private declarations }
  public
    { Public declarations }
    Objeto : TCrCatComi;
  end;
  //
  TCrCatComi= class(TInterFrame)
  private
  protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
        { Public declarations } 
        CVE_COMISION             : TInterCampo;
        B_APLICA_IVA             : TInterCampo;
        B_APLICA_MORA            : TInterCampo;
        B_APLICA_INGRESO         : TInterCampo;
        PCT_COMISION             : TInterCampo;
        IMP_COMISION             : TInterCampo;
        DESC_COMISION            : TInterCampo;
        SIT_CAT_COMISION         : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        B_GENERA_FACTURA         : TInterCampo;
        B_APLI_DISPOS            : TInterCampo;
        B_APLI_CESION            : TInterCampo;
        CVE_APLIC_COM            : TInterCampo;
        CVE_IMP_CALC_COM         : TInterCampo;
        B_CALC_PROMEDIO          : TInterCampo;
        CVE_TIPO_APLICA          : TInterCampo;
        CVE_TIPO_COM             : TInterCampo;
        ParamCre                 : TParamCre;
        //
        CVE_MONEDA               : TInterCampo;
        B_PRORRATEO              : TInterCampo;
        B_TASA_MORA_OPE          : TInterCampo;
        CVE_TASA_MORA            : TInterCampo;
        OPERADOR_STASA_M         : TInterCampo;
        SOBRETASA_M              : TInterCampo;
        UNIDAD_TIEMPO_CO         : TInterCampo;
        NUM_UNIDADES_CO          : TInterCampo;
        UNIDAD_TIEMPO_GR         : TInterCampo;
        NUM_UNIDADES_GR          : TInterCampo;
        UNIDAD_TIEMPO_CN         : TInterCampo;
        NUM_UNIDADES_CN          : TInterCampo;
        DIA_PAGO_CN              : TInterCampo;
        CVE_TIPO_COBRO           : TInterCampo;
        IMP_MINIMO               : TInterCampo;
        IMP_MAXIMO               : TInterCampo;
        CVE_EVENTO_COM           : TInterCampo;
        B_MODIFICA_CAT           : TInterCampo;
        CVE_TIPO_GEN_COM         : TInterCampo;
        //
        B_COMIS_PREM             : TInterCampo; //HERJA 01.09.2010
        B_APLVENC_SI             : TInterCampo; //HERJA 08.11.2010
        CVE_TIPO_COMIS           : TInterCampo; //HERJA 08.11.2010
        B_BLOQ_SALDO             : TInterCampo; //RABA FEB 2012

        Moneda                   : TMoneda;
        TasaRefer                : TTasIndFin;
        UTiempoCob               : TCrUniTie;  //Unidad de Tiempo Cobro
        UTiempoGra               : TCrUniTie;  //Unidad de Tiempo Gracia
        UTiempoCom               : TCrUniTie;  //Unidad de Tiempo Comision
        //
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;



implementation
{$R *.DFM}


constructor TCrCatComi.Create( AOwner : TComponent );
begin Inherited;
      CVE_COMISION :=CreaCampo('CVE_COMISION',ftString,tsNinguno,tsNinguno,True);
                CVE_COMISION.Caption:='Cve. Comisión';
      B_APLICA_IVA :=CreaCampo('B_APLICA_IVA',ftString,tsNinguno,tsNinguno,True);
                B_APLICA_IVA.Caption:='Aplica Iva';
      B_APLICA_MORA :=CreaCampo('B_APLICA_MORA',ftString,tsNinguno,tsNinguno,True);
                B_APLICA_MORA.Caption:='Aplica Mora';
      B_APLICA_INGRESO :=CreaCampo('B_APLICA_INGRESO',ftString,tsNinguno,tsNinguno,True);
                B_APLICA_INGRESO.Caption:='Aplica Ingreso';
      PCT_COMISION :=CreaCampo('PCT_COMISION',ftFloat,tsNinguno,tsNinguno,True);
                PCT_COMISION.Caption:='Porcentaje de Comisión';
      IMP_COMISION :=CreaCampo('IMP_COMISION',ftFloat,tsNinguno,tsNinguno,True);
                IMP_COMISION.Caption:='Importe Comisión';
      DESC_COMISION :=CreaCampo('DESC_COMISION',ftString,tsNinguno,tsNinguno,True);
                DESC_COMISION.Caption:='Descripción';
      SIT_CAT_COMISION :=CreaCampo('SIT_CAT_COMISION',ftString,tsNinguno,tsNinguno,True);
        With SIT_CAT_COMISION do
           begin Size:=2;
                 UseCombo:=True;
                 ComboLista.Add('0');           ComboDatos.Add(CSIT_AC);
                 ComboLista.Add('1');           ComboDatos.Add(CSIT_CA);
           end;
                SIT_CAT_COMISION.Caption:='Situación';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      B_GENERA_FACTURA :=CreaCampo('B_GENERA_FACTURA',ftString,tsNinguno,tsNinguno,True);
                B_GENERA_FACTURA.Caption:='Genera Factura';
      B_APLI_DISPOS :=CreaCampo('B_APLI_DISPOS',ftString,tsNinguno,tsNinguno,True);
                B_APLI_DISPOS.Caption:='Apli Dispos';
      B_APLI_CESION :=CreaCampo('B_APLI_CESION',ftString,tsNinguno,tsNinguno,True);
                B_APLI_CESION.Caption:='Apli Cesion';
      CVE_APLIC_COM :=CreaCampo('CVE_APLIC_COM',ftString,tsNinguno,tsNinguno,True);
        With CVE_APLIC_COM do
           begin Size:=2;

                 UseCombo:=True;
                 ComboLista.Add('No Aplica');           ComboDatos.Add('NA');
                 ComboLista.Add('Cuota Fega');          ComboDatos.Add('CF');
           end;
                CVE_APLIC_COM.Caption:='Tipo Aplicación';
      CVE_IMP_CALC_COM :=CreaCampo('CVE_IMP_CALC_COM',ftString,tsNinguno,tsNinguno,True);
        With CVE_IMP_CALC_COM do
           begin Size:=2;
                 UseCombo:=True;
                 ComboLista.Add('0');           ComboDatos.Add(C_TCOM_AC);
                 ComboLista.Add('1');           ComboDatos.Add(C_TCOM_DC);
                 ComboLista.Add('2');           ComboDatos.Add(C_TCOM_CI);
                 ComboLista.Add('3');           ComboDatos.Add(C_TCOM_CD);
                 ComboLista.Add('4');           ComboDatos.Add(C_TCOM_AL);
                 ComboLista.Add('5');           ComboDatos.Add(C_TCOM_DL);
                 ComboLista.Add('6');           ComboDatos.Add(C_TCOM_LI);
                 ComboLista.Add('7');           ComboDatos.Add(C_TCOM_LD);
                 ComboLista.Add('8');           ComboDatos.Add(C_TCOM_ID);
                 ComboLista.Add('9');           ComboDatos.Add(C_TCOM_SI);
                 ComboLista.Add('10');          ComboDatos.Add(C_TCOM_PC);
                 ComboLista.Add('11');          ComboDatos.Add(C_TCOM_IO);
                 //ComboLista.Add('11');          ComboDatos.Add(C_TCOM_PI);
           end;
                CVE_IMP_CALC_COM.Caption:='Saldo Base';
      B_CALC_PROMEDIO :=CreaCampo('B_CALC_PROMEDIO',ftString,tsNinguno,tsNinguno,True);
                B_CALC_PROMEDIO.Caption:='Aplica Promedio';
      With B_CALC_PROMEDIO do
      begin
        Size := 1;
        UseCombo:=True;
        ComboLista.Add('0');            ComboDatos.Add('F');
        ComboLista.Add('1');            ComboDatos.Add('V');
      end;
      CVE_TIPO_COM  :=CreaCampo('CVE_TIPO_COM',ftString,tsNinguno,tsNinguno,True);
        With CVE_TIPO_COM do
           begin Size:=2;
                 UseCombo:=True;
                 ComboLista.Add('0');            ComboDatos.Add(C_TCOM_PE);
                 ComboLista.Add('1');            ComboDatos.Add(C_TCOM_EV);
                 ComboLista.Add('2');            ComboDatos.Add(C_TCOM_PP);
           end;
                CVE_TIPO_COM.Caption:='Tipo Comisión';
      CVE_TIPO_APLICA :=CreaCampo('CVE_TIPO_APLICA',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_APLICA.Caption:='Periodo Aplicación';
      With CVE_TIPO_APLICA do
      begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('Per. Capital y/o Interes');    ComboDatos.Add(C_TCOM_AM);
        ComboLista.Add('Per. Capital');                ComboDatos.Add(C_TCOM_PC);
        ComboLista.Add('Per. Interes');                ComboDatos.Add(C_TCOM_PI);
        ComboLista.Add('Otro');                        ComboDatos.Add(C_TCOM_UT);
      end;
      //
      CVE_MONEDA       := CreaCampo('CVE_MONEDA',       ftFloat,    tsNinguno, tsNinguno, True);
      CVE_MONEDA.Caption        := 'Moneda';
      B_PRORRATEO      := CreaCampo('B_PRORRATEO',      ftString,   tsNinguno, tsNinguno, True);
      B_PRORRATEO.Caption       := 'Aplica Prorrateo';
      B_TASA_MORA_OPE  := CreaCampo('B_TASA_MORA_OPE',  ftString,   tsNinguno, tsNinguno, True);
      B_TASA_MORA_OPE.Caption   := 'Misma mora operación';
      CVE_TASA_MORA    := CreaCampo('CVE_TASA_MORA',    ftString,   tsNinguno, tsNinguno, True);
      CVE_TASA_MORA.Caption     := 'Código tasa intereses moratorios';
      OPERADOR_STASA_M := CreaCampo('OPERADOR_STASA_M', ftString,   tsNinguno, tsNinguno, True);
      OPERADOR_STASA_M.Caption  := 'Operador matemático intereses moratorios';
      SOBRETASA_M      := CreaCampo('SOBRETASA_M',      ftFloat,    tsNinguno, tsNinguno, True);
      SOBRETASA_M.Caption       := 'Sobretasa moratoria';
      UNIDAD_TIEMPO_CO := CreaCampo('UNIDAD_TIEMPO_CO', ftString,   tsNinguno, tsNinguno, True);
      UNIDAD_TIEMPO_CO.Caption  := 'Unidad de tiempo de período de cobro';
      NUM_UNIDADES_CO  := CreaCampo('NUM_UNIDADES_CO',  ftFloat,    tsNinguno, tsNinguno, True);
      NUM_UNIDADES_CO.Caption   := 'Periodo de cobro';
      UNIDAD_TIEMPO_GR := CreaCampo('UNIDAD_TIEMPO_GR', ftString,   tsNinguno, tsNinguno, True);
      UNIDAD_TIEMPO_GR.Caption  := 'Unidad de tiempo de período de gracia';
      NUM_UNIDADES_GR  := CreaCampo('NUM_UNIDADES_GR',  ftFloat,    tsNinguno, tsNinguno, True);
      NUM_UNIDADES_GR.Caption   := 'Periodo de Gracia';
      UNIDAD_TIEMPO_CN := CreaCampo('UNIDAD_TIEMPO_CN', ftString,   tsNinguno, tsNinguno, True);
      UNIDAD_TIEMPO_CN.Caption  := 'Unidad de Tiempo';
      NUM_UNIDADES_CN  := CreaCampo('NUM_UNIDADES_CN',  ftFloat,    tsNinguno, tsNinguno, True);
      NUM_UNIDADES_CN.Caption   := 'Número de Unidades de Tiempo';
      DIA_PAGO_CN      := CreaCampo('DIA_PAGO_CN',      ftFloat,    tsNinguno, tsNinguno, True);
      DIA_PAGO_CN.Caption       := 'Dia de pago de comisión';
      CVE_TIPO_COBRO   := CreaCampo('CVE_TIPO_COBRO',   ftString,   tsNinguno, tsNinguno, True);
      CVE_TIPO_COBRO.Caption    := 'Tipo de cobro';
      With CVE_TIPO_COBRO do
      begin
        Size := 2;
        UseCombo := True;
        ComboLista.Add('0');            ComboDatos.Add(C_TCOB_COM_VF);
        ComboLista.Add('1');            ComboDatos.Add(C_TCOB_COM_PC);
      end;
      IMP_MINIMO       := CreaCampo('IMP_MINIMO',       ftFloat,    tsNinguno, tsNinguno, True);
      IMP_MINIMO.Caption        := 'Importe Mínimo';
      IMP_MAXIMO       := CreaCampo('IMP_MAXIMO',       ftFloat,    tsNinguno, tsNinguno, True);
      IMP_MAXIMO.Caption        := 'Importe Máximo';
      CVE_EVENTO_COM   := CreaCampo('CVE_EVENTO_COM',   ftString,   tsNinguno, tsNinguno, True);
      CVE_EVENTO_COM.Caption    := 'Tipo de Evento';
      With CVE_EVENTO_COM do
      begin
        Size := 2;
        UseCombo := True;
        ComboLista.Add('Colocación');                 ComboDatos.Add(C_TEVE_COM_CL);
        ComboLista.Add('Cob. anticipada');            ComboDatos.Add(C_TEVE_COM_PA);
        ComboLista.Add('Cob. programada');            ComboDatos.Add(C_TEVE_COM_PM);
        ComboLista.Add('Cob. impagada');              ComboDatos.Add(C_TEVE_COM_PV);
        ComboLista.Add('Cobranza');                   ComboDatos.Add(C_TEVE_COM_PG);
        ComboLista.Add('Incremento de Temporada');    ComboDatos.Add(C_TEVE_COM_IT);
        ComboLista.Add('Decremento de Temporada');    ComboDatos.Add(C_TEVE_COM_DT);
        ComboLista.Add('Desconocido');                ComboDatos.Add(C_TEVE_COM_UK);
      end;
      B_MODIFICA_CAT   := CreaCampo('B_MODIFICA_CAT',   ftString,   tsNinguno, tsNinguno, True);
      B_MODIFICA_CAT.Caption    := 'Modificable';
      CVE_TIPO_GEN_COM := CreaCampo('CVE_TIPO_GEN_COM', ftString,   tsNinguno, tsNinguno, True);
      CVE_TIPO_GEN_COM.Caption  := 'Tipo genera comisión';
      //
      //HERJA 01.09.2010
      B_COMIS_PREM  := CreaCampo('B_COMIS_PREM',  ftString,   tsNinguno, tsNinguno, True);
      B_COMIS_PREM.Caption   := 'Aplica PPP';

      B_APLVENC_SI  := CreaCampo('B_APLVENC_SI',  ftString,   tsNinguno, tsNinguno, True);
      B_APLVENC_SI.Caption   := 'Aplica Saldos Vencidos al Calculo sobre Saldo Insoluto';

      CVE_TIPO_COMIS   := CreaCampo('CVE_TIPO_COMIS',   ftString,   tsNinguno, tsNinguno, True);
      CVE_TIPO_COMIS.Caption    := 'Tipo de Comision';
      With CVE_TIPO_COMIS do
      begin
        Size := 2;
        UseCombo := True;
        ComboLista.Add('0');            ComboDatos.Add('CN');
        ComboLista.Add('1');            ComboDatos.Add('SG');
      end;
      //
      // RABA FEB 2012
      B_BLOQ_SALDO := CreaCampo('B_BLOQ_SALDO',  ftString,   tsNinguno, tsNinguno, True);
      B_BLOQ_SALDO.Caption   := 'Bloquea Imp. Comisión';
      //
      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource := Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField    := 'CVE_MONEDA';
      //
      TasaRefer := TTasIndFin.Create(Self);
      TasaRefer.MasterSource := Self;
      TasaRefer.FieldByName('CVE_TASA_INDICAD').MasterField := 'CVE_TASA_MORA';
      //
      UTiempoCob := TCrUniTie.Create(Self);  //Unidad de Tiempo Cobro
      UTiempoCob.MasterSource := Self;
      UTiempoCob.FieldByName('CVE_UNIDAD_TIEMP').MasterField := 'UNIDAD_TIEMPO_CO';
      //
      UTiempoGra := TCrUniTie.Create(Self);  //Unidad de Tiempo Gracia
      UTiempoGra.MasterSource := Self;
      UTiempoGra.FieldByName('CVE_UNIDAD_TIEMP').MasterField := 'UNIDAD_TIEMPO_GR';
      //
      UTiempoCom := TCrUniTie.Create(Self);  //Unidad de Tiempo Comision
      UTiempoCom.MasterSource := Self;
      UTiempoCom.FieldByName('CVE_UNIDAD_TIEMP').MasterField := 'UNIDAD_TIEMPO_CN';
      //

      FKeyFields.Add('CVE_COMISION');

      TableName := 'CR_CAT_COMISION';
      UseQuery := True;
      HelpFile := 'IntCrCatComi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCatComi.Destroy;
begin
  if Moneda <> nil then
    Moneda.Free;
  //
  if TasaRefer <> nil then
    TasaRefer.Free;
  //
  if UTiempoCob <> nil then
     UTiempoCob.Free;
  //
  if UTiempoGra <> nil then
     UTiempoGra.Free;
  //
  if UTiempoCom <> nil then
     UTiempoCom.Free;
  //
  inherited;
end;


function TCrCatComi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCatComision;
begin
   W:=TWCrCatComision.Create(Self);
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


Function TCrCatComi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCaCo.it','S');
      Try if Active then begin T.Param(0,CVE_COMISION.AsString);
                               end;
          if T.Execute then
             InternalBusca := FindKey([T.DameCampo(0)]);
          // RABA si se encuentra el registro buscado se actualizan los controles
//          if  then
          // FIN RABA
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_CAT_COMISION********************)
(*                                                                              *)
(*  FORMA DE CR_CAT_COMISION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CAT_COMISION********************)

procedure TWCrCatComision.OnOffMoneda;
begin
  if ( (Objeto.Modo = moEdit) or ( Objeto.Modo = moAppend ) ) then
  begin
    cbCVE_MONEDA.OnClick := nil;
    Objeto.CVE_MONEDA.GetFromControl;
    cbCVE_MONEDA.Checked := ( Objeto.CVE_MONEDA.AsString <> '' );
    cbCVE_MONEDA.Enabled := ( Objeto.CVE_MONEDA.AsString <> '' );
    cbCVE_MONEDA.OnClick := cbCVE_MONEDAClick;
  End;
end;

procedure TWCrCatComision.OnOffTasaMora;
var vlEnabled : Boolean;
begin
  if ( (Objeto.Modo = moEdit) or (Objeto.Modo=moAppend) ) then
  begin
    Objeto.B_TASA_MORA_OPE.GetFromControl;
    vlEnabled := ( NOT( Objeto.B_TASA_MORA_OPE.AsString = 'V' ) ) AND ( Objeto.B_APLICA_MORA.AsString = 'V' );
    edCVE_TASA_MORA.Enabled    := vlEnabled;
    btCVE_TASA_MORA.Enabled    := vlEnabled;
    edOPERADOR_STASA_M.Enabled := vlEnabled;
    edSOBRETASA_M.Enabled      := vlEnabled;
    //
    if vlEnabled then
    Begin
       edCVE_TASA_MORA.Color := clWindow;
       edSOBRETASA_M.Color   := clWindow;
       edOPERADOR_STASA_M.Color := clWindow;
    End Else
    Begin
       edCVE_TASA_MORA.Color := clBtnFace;
       edSOBRETASA_M.Color   := clBtnFace;
       edOPERADOR_STASA_M.Color := clBtnFace;
    End;
  End;
End;

procedure TWCrCatComision.OnOffMismaMora;
begin
  if ( (Objeto.Modo = moEdit) or (Objeto.Modo=moAppend) ) then
  begin
    Objeto.B_APLICA_MORA.GetFromControl;
    cbB_TASA_MORA_OPE.Enabled := ( Objeto.B_APLICA_MORA.AsString = 'V' );
    if ( Objeto.B_APLICA_MORA.AsString <> 'V' ) then
    Begin
      Objeto.B_TASA_MORA_OPE.AsString := 'F';
      OnOffTasaMora;
    End;//
  end;
  //
end;


procedure TWCrCatComision.OnOffFrecuencia;
var vlEnabled : Boolean;
    vlColor   : TColor;
begin
  if ( (Objeto.Modo = moEdit) or (Objeto.Modo=moAppend) ) then
  begin
    Objeto.CVE_TIPO_COM.GetFromControl;
    UnTiempoPeriodicoOtro(False);

    If Objeto.CVE_TIPO_COM.AsString = C_TCOM_PE THEN
    begin
      Panel_Periodica.Visible := True;
      Panel_Eventual.Visible  := False;

      Objeto.CVE_EVENTO_COM.AsString := '';
      cbCVE_EVENTO_COM.Text := '';

      rgCVE_TIPO_COBRO.Enabled   := True;
      edIMP_COMISION.Enabled     := True;
      edPCT_COMISION.Enabled     := True;
      edIMP_MINIMO.Enabled       := True;
      edIMP_MAXIMO.Enabled       := True;
      rgCVE_IMP_CALC_COM.Enabled := True;
      rgB_CALC_PROMEDIO.Enabled  := True;

      edIMP_COMISION.Color := clWindow;
      edPCT_COMISION.Color := clWindow;
      edIMP_MINIMO.Color   := clWindow;
      edIMP_MAXIMO.Color   := clWindow;
      rgCVE_TIPO_COBROClick(self);
    end;

    If Objeto.CVE_TIPO_COM.AsString = C_TCOM_EV THEN
    begin
      Panel_Periodica.Visible := False;
      Panel_Eventual.Visible  := True;

      Objeto.CVE_TIPO_APLICA.AsString := '';
      cbCVE_TIPO_APLICA.Text := '';
      Objeto.UTiempoCom.Active := False;
      edCVE_UN_TIEMPO_CN.Text := '';
      edNUM_UNIDADES_CN.Text := '';
      edDIA_PAGO_CN.Text := '';

      rgCVE_TIPO_COBRO.Enabled   := True;
      edIMP_COMISION.Enabled     := True;
      edPCT_COMISION.Enabled     := True;
      edIMP_MINIMO.Enabled       := True;
      edIMP_MAXIMO.Enabled       := True;
      rgCVE_IMP_CALC_COM.Enabled := True;
      rgB_CALC_PROMEDIO.Enabled  := True;

      edIMP_COMISION.Color := clWindow;
      edPCT_COMISION.Color := clWindow;
      edIMP_MINIMO.Color   := clWindow;
      edIMP_MAXIMO.Color   := clWindow;
      rgCVE_TIPO_COBROClick(self);
    end;

    If Objeto.CVE_TIPO_COM.AsString = C_TCOM_PP THEN
    begin
      Panel_Periodica.Visible := False;
      Panel_Eventual.Visible  := False;

      rgCVE_TIPO_COBRO.ItemIndex := 0;
      rgCVE_TIPO_COBRO.Enabled   := False;
      edIMP_COMISION.Enabled     := True;
      edPCT_COMISION.Enabled     := False;
      edIMP_MINIMO.Enabled       := False;
      edIMP_MAXIMO.Enabled       := False;
      rgCVE_IMP_CALC_COM.Enabled := False;
      rgB_CALC_PROMEDIO.Enabled  := False;

      edIMP_COMISION.Color := clWindow;
      edPCT_COMISION.Color := clBtnFace;
      edIMP_MINIMO.Color   := clBtnFace;
      edIMP_MAXIMO.Color   := clBtnFace;

      Objeto.CVE_EVENTO_COM.AsString := '';
      Objeto.CVE_TIPO_APLICA.AsString := '';
      cbCVE_TIPO_APLICA.Text := '';
      cbCVE_EVENTO_COM.Text := '';
      Objeto.UTiempoCom.Active := False;
      edCVE_UN_TIEMPO_CN.Text := '';
      edNUM_UNIDADES_CN.Text := '';
      edDIA_PAGO_CN.Text := '';
      edPCT_COMISION.Text := '';
      edIMP_MINIMO.Text := '';
      edIMP_MAXIMO.Text := '';
    end;
  End  ;
{  if ( (Objeto.Modo = moEdit) or (Objeto.Modo=moAppend) ) then
  begin
    Objeto.CVE_TIPO_COM.GetFromControl;
    vlEnabled := ( Objeto.CVE_TIPO_COM.AsString = C_TCOM_PE );
    //
    cbCVE_TIPO_APLICA.Enabled  := vlEnabled;
    btUNIDAD_TIEMPO_CN.Enabled := False;
    edNUM_UNIDADES_CN.Enabled  := False;
    edDIA_PAGO_CN.Enabled      := False;
    //
    if vlEnabled then
       cbCVE_TIPO_APLICA.Color := clWindow
    Else
       cbCVE_TIPO_APLICA.Color := clBtnFace;
    //

    cbCVE_EVENTO_COM.Enabled := ( Objeto.CVE_TIPO_COM.AsString = C_TCOM_EV );
    if cbCVE_EVENTO_COM.Enabled then
       cbCVE_EVENTO_COM.Color := clWindow
    else
       cbCVE_EVENTO_COM.Color := clBtnFace;
    //
    //
    vlEnabled := not ( Objeto.CVE_TIPO_COM.AsString = C_TCOM_PP );
    rgCVE_TIPO_COBRO.Enabled   := vlEnabled;
    edIMP_COMISION.Enabled     := vlEnabled;
    edPCT_COMISION.Enabled     := vlEnabled;
    edIMP_MINIMO.Enabled       := vlEnabled;
    edIMP_MAXIMO.Enabled       := vlEnabled;
    rgCVE_IMP_CALC_COM.Enabled := vlEnabled;
    rgB_CALC_PROMEDIO.Enabled  := vlEnabled;

    if vlEnabled then vlColor := clWindow
                 else vlColor := clBtnFace;

    edIMP_COMISION.Color := vlColor;
    edPCT_COMISION.Color := vlColor;
    edIMP_MINIMO.Color   := vlColor;
    edIMP_MAXIMO.Color   := vlColor;
    //
  End;
  }
End;


procedure TWCrCatComision.OnOffUnFrecuencia;
var vlEnabled : Boolean;
begin
  if ( (Objeto.Modo = moEdit) or (Objeto.Modo=moAppend) ) then
  begin
    Objeto.CVE_TIPO_APLICA.GetFromControl;
    vlEnabled := ( Objeto.CVE_TIPO_APLICA.AsString = C_TCOM_UT );
    //
    btUNIDAD_TIEMPO_CN.Enabled := vlEnabled;
    edNUM_UNIDADES_CN.Enabled  := vlEnabled;
    edDIA_PAGO_CN.Enabled      := vlEnabled;
    UnTiempoPeriodicoOtro(vlEnabled);
    //
    if vlEnabled then
    begin
       edDIA_PAGO_CN.Color := clWindow;
       edNUM_UNIDADES_CN.Color := clWindow;
    end else begin
       edDIA_PAGO_CN.Color := clBtnFace;
       edNUM_UNIDADES_CN.Color := clBtnFace;
    end;//
  End;
End;

procedure TWCrCatComision.OnOffTipoCobro;
var vlEnabled : Boolean;
begin
  if ( (Objeto.Modo = moEdit) or (Objeto.Modo=moAppend) ) then
  begin
      Objeto.CVE_TIPO_COBRO.GetFromControl;

      vlEnabled := ( Objeto.CVE_TIPO_COBRO.AsString = C_TCOB_COM_PC );
      //
      edIMP_COMISION.Enabled := not vlEnabled;
      lbIMP_COMISION.Visible := not vlEnabled;
      edIMP_COMISION.Visible := not vlEnabled;

      gbCobroPorcentaje.Visible := vlEnabled;
      edPCT_COMISION.Enabled := vlEnabled;
      edIMP_MINIMO.Enabled   := vlEnabled;
      edIMP_MINIMO.Visible   := vlEnabled;
      lbIMP_MINIMO.Visible   := vlEnabled;
      edIMP_MAXIMO.Enabled   := vlEnabled;
      edIMP_MAXIMO.Visible   := vlEnabled;
      lbIMP_MAXIMO.Visible   := vlEnabled;
      rgCVE_IMP_CALC_COM.Enabled := vlEnabled;
      rgCVE_IMP_CALC_COM.Visible := vlEnabled;
      //
      if vlEnabled then
      begin
        edIMP_COMISION.Color := clBtnFace;
        edPCT_COMISION.Color := clWindow;
        edIMP_MINIMO.Color   := clWindow;
        edIMP_MAXIMO.Color   := clWindow;
        // raba feb 2012
        edIMP_COMISION.Text := '';
        //
      end else begin
        edIMP_COMISION.Color := clWindow;
        edPCT_COMISION.Color := clBtnFace;
        edIMP_MINIMO.Color   := clBtnFace;
        edIMP_MAXIMO.Color   := clBtnFace;
        // raba feb 2012
        edPCT_COMISION.Text := '';
        //
      end;
  End;
End;

procedure TWCrCatComision.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_COMISION.Control:=edCVE_COMISION;
      Objeto.B_APLICA_IVA.Control:=chB_APLICA_IVA;
      Objeto.B_APLICA_MORA.Control:=chB_APLICA_MORA;
      Objeto.B_APLICA_INGRESO.Control:=chB_APLICA_INGRESO;
      Objeto.PCT_COMISION.Control:=edPCT_COMISION;
      Objeto.IMP_COMISION.Control:=edIMP_COMISION;
      Objeto.DESC_COMISION.Control:=edDESC_COMISION;
      Objeto.SIT_CAT_COMISION.Control:=rgSIT_CAT_COMISION;
      Objeto.B_GENERA_FACTURA.Control:=chB_GENERA_FACTURA;
      Objeto.CVE_APLIC_COM.Control:=cbCVE_APLIC_COM;
      Objeto.CVE_IMP_CALC_COM.Control:=rgCVE_IMP_CALC_COM;
      Objeto.B_CALC_PROMEDIO.Control:=rgB_CALC_PROMEDIO;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.CVE_TIPO_COM.Control:=rgCVE_TIPO_COM;
      Objeto.CVE_TIPO_APLICA.Control := cbCVE_TIPO_APLICA;
      //
      Objeto.CVE_MONEDA.Control       := edCVE_MONEDA;
      Objeto.B_PRORRATEO.Control      := cbB_PRORRATEO;
      Objeto.B_TASA_MORA_OPE.Control  := cbB_TASA_MORA_OPE;
      Objeto.CVE_TASA_MORA.Control    := edCVE_TASA_MORA;
      Objeto.OPERADOR_STASA_M.Control := edOPERADOR_STASA_M;
      Objeto.SOBRETASA_M.Control      := edSOBRETASA_M;
      Objeto.UNIDAD_TIEMPO_CO.Control := edCVE_UN_TIEMPO_CO;
      Objeto.NUM_UNIDADES_CO.Control  := edNUM_UNIDADES_CO;
      Objeto.UNIDAD_TIEMPO_GR.Control := edCVE_UN_TIEMPO_GR;
      Objeto.NUM_UNIDADES_GR.Control  := edNUM_UNIDADES_GR;
      Objeto.UNIDAD_TIEMPO_CN.Control := edCVE_UN_TIEMPO_CN;
      Objeto.NUM_UNIDADES_CN.Control  := edNUM_UNIDADES_CN;
      Objeto.DIA_PAGO_CN.Control      := edDIA_PAGO_CN;
      Objeto.CVE_TIPO_COBRO.Control   := rgCVE_TIPO_COBRO;
      Objeto.IMP_MINIMO.Control       := edIMP_MINIMO;
      Objeto.IMP_MAXIMO.Control       := edIMP_MAXIMO;
      Objeto.CVE_EVENTO_COM.Control   := cbCVE_EVENTO_COM;
      Objeto.B_MODIFICA_CAT.Control   := cbB_MODIFICA_CAT;
      Objeto.Moneda.Cve_Moneda.Control  := edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.TasaRefer.CVE_TASA_INDICAD.Control := edCVE_TASA_MORA;
      Objeto.TasaRefer.DESC_TASA_INDIC.Control  := edDESC_TASA_MORA;
      Objeto.TasaRefer.GetParams(Objeto);
      Objeto.UTiempoCob.CVE_UNIDAD_TIEMP.Control := edCVE_UN_TIEMPO_CO;
      Objeto.UTiempoCob.DESCRIPCION.Control      := edDESC_UN_TIEMPO_CO;
      Objeto.UTiempoGra.CVE_UNIDAD_TIEMP.Control := edCVE_UN_TIEMPO_GR;
      Objeto.UTiempoGra.DESCRIPCION.Control      := edDESC_UN_TIEMPO_GR;
      Objeto.UTiempoCom.CVE_UNIDAD_TIEMP.Control := edCVE_UN_TIEMPO_CN;
      Objeto.UTiempoCom.DESCRIPCION.Control      := edDESC_UN_TIEMPO_CN;
      //
      Objeto.B_COMIS_PREM.Control:=cbB_COMIS_PREM; //HERJA 01.09.2010
      Objeto.B_APLVENC_SI.Control:=cbB_APLVENC_SI; //HERJA 08.11.2010
      Objeto.CVE_TIPO_COMIS.Control:=rgCVE_TIPO_COMIS; //HERJA 08.11.2010
      //
      Objeto.B_BLOQ_SALDO.Control := cbB_BLOQ_SALDO;  // RABA FEB 2012 PPP

      InterForma1.MsgPanel := MsgPanel;
end;

procedure TWCrCatComision.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_COMISION.Control:=nil;
      Objeto.B_APLICA_IVA.Control:=nil;
      Objeto.B_APLICA_MORA.Control:=nil;
      Objeto.B_APLICA_INGRESO.Control:=nil;

      Objeto.PCT_COMISION.Control:=nil;
      Objeto.IMP_COMISION.Control:=nil;
      Objeto.DESC_COMISION.Control:=nil;
      Objeto.SIT_CAT_COMISION.Control:=nil;
      Objeto.B_GENERA_FACTURA.Control:=nil;
      Objeto.CVE_APLIC_COM.Control:=nil;
      Objeto.CVE_IMP_CALC_COM.Control:=nil;
      Objeto.B_CALC_PROMEDIO.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.CVE_TIPO_COM.Control:=nil;
      Objeto.CVE_TIPO_APLICA.Control:=nil;
      //
      Objeto.CVE_MONEDA.Control       := nil;
      Objeto.B_PRORRATEO.Control      := nil;
      Objeto.B_TASA_MORA_OPE.Control  := nil;
      Objeto.CVE_TASA_MORA.Control    := nil;
      Objeto.OPERADOR_STASA_M.Control := nil;
      Objeto.SOBRETASA_M.Control      := nil;
      Objeto.UNIDAD_TIEMPO_CO.Control := nil;
      Objeto.NUM_UNIDADES_CO.Control  := nil;
      Objeto.UNIDAD_TIEMPO_GR.Control := nil;
      Objeto.NUM_UNIDADES_GR.Control  := nil;
      Objeto.UNIDAD_TIEMPO_CN.Control := nil;
      Objeto.NUM_UNIDADES_CN.Control  := nil;
      Objeto.DIA_PAGO_CN.Control      := nil;
      Objeto.CVE_TIPO_COBRO.Control   := nil;
      Objeto.IMP_MINIMO.Control       := nil;
      Objeto.IMP_MAXIMO.Control       := nil;
      Objeto.CVE_EVENTO_COM.Control   := nil;
      Objeto.B_MODIFICA_CAT.Control   := nil;
      Objeto.Moneda.Cve_Moneda.Control  := nil;
      Objeto.Moneda.Desc_Moneda.Control := nil;
      Objeto.TasaRefer.CVE_TASA_INDICAD.Control  := nil;
      Objeto.TasaRefer.DESC_TASA_INDIC.Control   := nil;
      Objeto.UTiempoCob.CVE_UNIDAD_TIEMP.Control := nil;
      Objeto.UTiempoCob.DESCRIPCION.Control      := nil;
      Objeto.UTiempoGra.CVE_UNIDAD_TIEMP.Control := nil;
      Objeto.UTiempoGra.DESCRIPCION.Control      := nil;
      Objeto.UTiempoCom.CVE_UNIDAD_TIEMP.Control := nil;
      Objeto.UTiempoCom.DESCRIPCION.Control      := nil;
      //
      Objeto.B_COMIS_PREM.Control := nil; //HERJA 01.09.2010
      Objeto.B_APLVENC_SI.Control := nil; //HERJA 08.11.2010
      Objeto.CVE_TIPO_COMIS.Control := nil; //HERJA 08.11.2010
      //
      Objeto.B_BLOQ_SALDO.Control := nil; // RABA FEB 2012
end;

procedure TWCrCatComision.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrCatComision.InterForma1AntesModificar(Sender: TObject; var Realizado: Boolean);
var vlsql   : String;
    vlCount : Integer;
begin
   SIT_COMIS_OLD := Objeto.SIT_CAT_COMISION.AsString;
   vlsql:= 'SELECT COUNT(*) COUNT FROM CR_COMISION  WHERE CVE_COMISION = '+ SQLStr( Objeto.CVE_COMISION.AsString ) +
           ' AND SIT_COMISION NOT IN ( ''CA'', ''LQ'' )';
   GetSQLInt(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,'COUNT',vlCount,False);
   if vlCount > 0 then
      if MessageDlg('La comsión está siendo aplicada a una disposición ¿Desea modificarla?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Realizado := True
      else Realizado := False;
   //
   if Realizado then
     MessageDlg('Los cambios realizados en este catálogo NO se verán reflejados ' + coCRLF +
                'en las disposiciones que ya se encuentran actualmente configuradas',
                mtInformation, [ mbOk ], 0 );

end;

procedure TWCrCatComision.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.CVE_TIPO_GEN_COM.AsString := C_TGENCOM_CN;
   Objeto.PCT_COMISION.AsFloat := 0;
   Objeto.IMP_COMISION.AsFloat := 0;
   Objeto.F_ALTA.AsDateTime := Now;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_CAT_COMISION.ItemIndex := 0;
   rgCVE_IMP_CALC_COM.ItemIndex := 0;
   rgCVE_TIPO_COM.ItemIndex := 0;
   rgSIT_CAT_COMISION.ItemIndex := 0;
   edCVE_COMISION.SetFocus;
end;

procedure TWCrCatComision.InterForma1DespuesModificar(Sender: TObject);
begin
   edDESC_COMISION.SetFocus;
end;

procedure TWCrCatComision.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
var vlsql   : String;
    vlCount : Integer;
begin
  if IsNewData = False then
  begin
    Objeto.SIT_CAT_COMISION.GetFromControl;
    if ( Objeto.SIT_CAT_COMISION.AsString = CSIT_CA ) and ( SIT_COMIS_OLD = CSIT_AC ) then
    Begin
      vlsql:= 'SELECT SUM(COUNT) COUNT '               + coCRLF +
              'FROM   ( '                              + coCRLF +
              '        SELECT COUNT(*) COUNT '         + coCRLF +
              '        FROM CR_COMIS_PROG '            + coCRLF +
              '        WHERE CVE_COMISION   = '        + SQLStr( Objeto.CVE_COMISION.AsString ) + coCRLF +
              '          AND SIT_COMIS_PROG = ''AC'' ' + coCRLF +
              '        UNION '                         + coCRLF +
              '        SELECT COUNT(*) COUNT '         + coCRLF +
              '        FROM CR_COM_PROG_ACC '          + coCRLF +
              '        WHERE CVE_COMISION   = '        + SQLStr( Objeto.CVE_COMISION.AsString ) + coCRLF +
              '          AND SIT_COMIS_PROG = ''AC'' ' + coCRLF +
              '       ) ';
      GetSQLInt( vlsql, Objeto.Apli.DataBaseName,  Objeto.Apli.SessionName, 'COUNT', vlCount, False );
      if vlCount > 0 then
      Begin
        MessageDlg('¡¡¡La comisión está siendo aplicada a algún proceso no es posible darla de baja!!!', mtWarning, [mbOK], 0);
        Realizado := False;
      End;
    End;
  End;
  //
End;
//
procedure TWCrCatComision.edCVE_COMISIONChange(Sender: TObject);
begin
  {}
end;

procedure TWCrCatComision.edCVE_COMISIONExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := '';
      VLValida := True;
      Objeto.CVE_COMISION.GetFromControl;
      If Objeto.CVE_COMISION.AsString = '' then
      begin
         VLMsg := 'Favor de Indicar la Clave de Comisión';
         VLValida := False;
      end;
      InterForma1.ValidaExit(edCVE_COMISION,VLValida,VLMsg,True);
   end;
end;

procedure TWCrCatComision.edDESC_COMISIONExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := '';
      VLValida := True;
      Objeto.DESC_COMISION.GetFromControl;
      If Objeto.DESC_COMISION.AsString = '' then
      begin
         VLMsg := 'Favor de indicar la descripción de la comisión';
         VLValida := False;
      end;
      InterForma1.ValidaExit(edDESC_COMISION,VLValida,VLMsg,True);
   end;
end;

procedure TWCrCatComision.edCVE_MONEDAExit(Sender: TObject);
begin
  OnOffMoneda;
  InterForma1.ValidaExit(edCVE_MONEDA, True, CNULL, True );
end;


procedure TWCrCatComision.btMONEDAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCATCOMI_MONED',True,True) then
   begin
      Objeto.Moneda.ShowAll := True;
      if Objeto.Moneda.Busca then
         InterForma1.NextTab( edCVE_MONEDA );
      //end if;
   end;
end;

procedure TWCrCatComision.ilMONEDACapture(Sender: TObject;  var Show: Boolean);
begin
  Show := ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend));
end;

procedure TWCrCatComision.ilMONEDAEjecuta(Sender: TObject);
begin
  if Objeto.Moneda.FindKey([ilMONEDA.Buffer]) then
     InterForma1.NextTab(edCVE_MONEDA);
  //end if;
end;

procedure TWCrCatComision.cbCVE_MONEDAClick(Sender: TObject);
var  vlMsg     : String;
     vlTodoOk : Boolean;
Begin
  if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
  Begin
    if cbCVE_MONEDA.Checked = False then
    Begin
       Objeto.Moneda.Active := False;
       Objeto.CVE_MONEDA.AsString := '';
       cbCVE_MONEDA.Enabled := False;
    End;
  End;
End;

procedure TWCrCatComision.cbCVE_MONEDAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(cbCVE_MONEDA, True, CNULL, True);
end;


procedure TWCrCatComision.chB_APLICA_IVAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(chB_APLICA_IVA,True,CNULL,True);
end;

procedure TWCrCatComision.cbB_PRORRATEOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(cbB_PRORRATEO, True, CNULL, True);
end;

procedure TWCrCatComision.chB_APLICA_INGRESOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(chB_APLICA_INGRESO,True,CNULL,True);
end;

procedure TWCrCatComision.chB_GENERA_FACTURAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(chB_GENERA_FACTURA,True,CNULL,True);
end;

procedure TWCrCatComision.chB_APLICA_MORAClick(Sender: TObject);
begin
  OnOffMismaMora;
end;

procedure TWCrCatComision.chB_APLICA_MORAExit(Sender: TObject);
begin
  OnOffMismaMora;
  InterForma1.ValidaExit(chB_APLICA_MORA,True,CNULL,True);
end;

procedure TWCrCatComision.cbB_TASA_MORA_OPEEnter(Sender: TObject);
begin
  OnOffTasaMora;
end;

procedure TWCrCatComision.cbB_TASA_MORA_OPEExit(Sender: TObject);
begin
  OnOffTasaMora;
  InterForma1.ValidaExit(cbB_TASA_MORA_OPE,True,CNULL,True);
end;

procedure TWCrCatComision.cbB_TASA_MORA_OPEClick(Sender: TObject);
begin
  OnOffTasaMora;
  InterForma1.ValidaExit(cbB_TASA_MORA_OPE,True,CNULL,True);
end;


procedure TWCrCatComision.cbB_MODIFICA_CATExit(Sender: TObject);
begin
  InterForma1.ValidaExit(cbB_MODIFICA_CAT,True,CNULL,True);
end;

procedure TWCrCatComision.btCVE_TASA_MORAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCATCOMI_INTMR',True,True) then
   begin
      Objeto.TasaRefer.ShowAll := True;
      if Objeto.TasaRefer.Busca then
         InterForma1.NextTab( edCVE_TASA_MORA );
      //end if;
   end;
end;

procedure TWCrCatComision.ilTASA_MORACapture(Sender: TObject; var Show: Boolean);
begin
  Show := ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend));
end;

procedure TWCrCatComision.ilTASA_MORAEjecuta(Sender: TObject);
begin
  if Objeto.TasaRefer.FindKey([ilTASA_MORA.Buffer]) then
     InterForma1.NextTab(edCVE_TASA_MORA);
  //end if;
end;


procedure TWCrCatComision.edCVE_TASA_MORAExit(Sender: TObject);
var  vlMsg     : String;
     vlTodoOk : Boolean;
Begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    vlMsg    := '';
    vlTodoOk := True;
    Objeto.CVE_TASA_MORA.GetFromControl;
    if Objeto.CVE_TASA_MORA.AsString = '' then
    Begin
      vlMsg := 'Favor de Indicar la tasa de intereses moratorios';
      vlTodoOk := False;
    end;//end if
    InterForma1.ValidaExit(edCVE_TASA_MORA, vlTodoOk, vlMsg, True );
  End;
end;

procedure TWCrCatComision.edOPERADOR_STASA_MExit(Sender: TObject);
var  vlMsg     : String;
     vlTodoOk : Boolean;
Begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    vlMsg    := '';
    vlTodoOk := True;
    Objeto.OPERADOR_STASA_M.GetFromControl;
    if ( Objeto.OPERADOR_STASA_M.AsString = '' ) then
    Begin
      vlMsg := 'Favor de indicar el operador de sobretasa de intereses moratorios';
      vlTodoOk := False;
    End Else Begin
      if ( length ( Objeto.OPERADOR_STASA_M.AsString ) > 1 ) or
         ( not ( Objeto.OPERADOR_STASA_M.AsString[1] in [ '+', '-', '*', '/' ] ) ) then
      Begin
        vlMsg    := 'El operador debe ser ''+'', ''-'', ''*'' ó ''/'' ';
        vlTodoOk := False;
      End;
    End;//end if
    InterForma1.ValidaExit( edOPERADOR_STASA_M, vlTodoOk, vlMsg, True );
  End;
end;

procedure TWCrCatComision.edSOBRETASA_MExit(Sender: TObject);
var  vlMsg     : String;
     vlTodoOk : Boolean;
Begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    vlMsg    := '';
    vlTodoOk := True;
    Objeto.SOBRETASA_M.GetFromControl;
    if Objeto.SOBRETASA_M.AsString = '' then
    Begin
      vlMsg := 'Favor de indicar la sobretasa de intereses moratorios';
      vlTodoOk := False;
    end;//end if
    InterForma1.ValidaExit( edSOBRETASA_M, vlTodoOk, vlMsg, True );
  End;
end;

procedure TWCrCatComision.edDESC_UN_TIEMPO_COExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edDESC_UN_TIEMPO_CO, True, CNULL, True );
end;

procedure TWCrCatComision.btUNIDAD_TIEMPO_COClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCATCOMI_UTMPC',True,True) then
   begin
      Objeto.UTiempoCob.ShowAll := True;
      if Objeto.UTiempoCob.Busca then
         InterForma1.NextTab( btUNIDAD_TIEMPO_CO );
      //end if;
   end;
end;

procedure TWCrCatComision.edNUM_UNIDADES_COExit(Sender: TObject);
var  vlMsg     : String;
     vlTodoOk : Boolean;
Begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    vlMsg    := '';
    vlTodoOk := True;
    Objeto.UNIDAD_TIEMPO_CO.GetFromControl;
    if Objeto.UNIDAD_TIEMPO_CO.AsString <> '' then
    Begin
      Objeto.NUM_UNIDADES_CO.GetFromControl;
      if Objeto.NUM_UNIDADES_CO.AsInteger <= 0 then
      Begin
        vlMsg := 'Favor de indicar el número de unidades de tiempo de cobro de la comisión';
        vlTodoOk := False;
      end;//end if
    end;//end if
    InterForma1.ValidaExit( edNUM_UNIDADES_CO, vlTodoOk, vlMsg, True );
  End;
end;

procedure TWCrCatComision.edDESC_UN_TIEMPO_GRExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edDESC_UN_TIEMPO_GR, True, CNULL, True );
end;

procedure TWCrCatComision.btUNIDAD_TIEMPO_GRClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCATCOMI_UTMPG',True,True) then
   begin
      Objeto.UTiempoGra.ShowAll := True;
      if Objeto.UTiempoGra.Busca then
         InterForma1.NextTab( btUNIDAD_TIEMPO_GR );
      //end if;
   end;
end;

procedure TWCrCatComision.edNUM_UNIDADES_GRExit(Sender: TObject);
var  vlMsg     : String;
     vlTodoOk : Boolean;
Begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    vlMsg    := '';
    vlTodoOk := True;
    Objeto.UNIDAD_TIEMPO_GR.GetFromControl;
    if Objeto.UNIDAD_TIEMPO_GR.AsString <> '' then
    Begin
      Objeto.NUM_UNIDADES_GR.GetFromControl;
      if Objeto.NUM_UNIDADES_GR.AsInteger <= 0 then
      Begin
        vlMsg := 'Favor de indicar el número de unidades de tiempo de gracia de la comisión';
        vlTodoOk := False;
      end;//end if
    end;//end if
    InterForma1.ValidaExit( edNUM_UNIDADES_GR, vlTodoOk, vlMsg, True );
  End;
end;

procedure TWCrCatComision.rgCVE_TIPO_COMClick(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
     OnOffFrecuencia;
   end;
end;

procedure TWCrCatComision.rgCVE_TIPO_COMExit(Sender: TObject);
begin
  OnOffFrecuencia;
  InterForma1.ValidaExit(rgCVE_TIPO_COM,True,CNULL,True);
end;

procedure TWCrCatComision.cbCVE_TIPO_APLICAChange(Sender: TObject);
begin
  OnOffUnFrecuencia;
end;


procedure TWCrCatComision.cbCVE_TIPO_APLICAExit(Sender: TObject);
var  vlMsg     : String;
     vlTodoOk : Boolean;
begin
  If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    vlMsg    := '';
    vlTodoOk := True;
    Objeto.CVE_TIPO_APLICA.GetFromControl;
    if Objeto.CVE_TIPO_APLICA.AsString = '' then
    Begin
      vlMsg := 'Favor de indicar el período de aplicación';
      vlTodoOk := False;
    End;//end if
    OnOffUnFrecuencia;
    InterForma1.ValidaExit( cbCVE_TIPO_APLICA, vlTodoOk, vlMsg, True );
  End;
end;

procedure TWCrCatComision.edDESC_UN_TIEMPO_CNExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edDESC_UN_TIEMPO_CN, True, CNULL, True );
end;


procedure TWCrCatComision.btUNIDAD_TIEMPO_CNClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCATCOMI_UTM',True,True) then
   begin
      Objeto.UTiempoCom.ShowAll := True;
      if Objeto.UTiempoCom.Busca then
         InterForma1.NextTab( btUNIDAD_TIEMPO_CN );
      //end_if;
   end;
end;

procedure TWCrCatComision.btUNIDAD_TIEMPO_CNExit(Sender: TObject);
var  vlMsg     : String;
     vlTodoOk : Boolean;
Begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    vlMsg    := '';
    vlTodoOk := True;
    Objeto.UNIDAD_TIEMPO_CN.GetFromControl;
    if Objeto.UNIDAD_TIEMPO_CN.AsString = '' then
    Begin
      vlMsg := 'Favor de indicar la unidad de tiempo para generar la comisión';
      vlTodoOk := False;
    end;//end if
    InterForma1.ValidaExit( btUNIDAD_TIEMPO_CN, vlTodoOk, vlMsg, True );
  End;
end;


procedure TWCrCatComision.edNUM_UNIDADES_CNExit(Sender: TObject);
var  vlMsg     : String;
     vlTodoOk : Boolean;
Begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    vlMsg    := '';
    vlTodoOk := True;
    Objeto.UNIDAD_TIEMPO_CN.GetFromControl;
    if Objeto.UNIDAD_TIEMPO_CN.AsString <> '' then
    Begin
      Objeto.NUM_UNIDADES_CN.GetFromControl;
      if Objeto.NUM_UNIDADES_CN.AsInteger <= 0 then
      Begin
        vlMsg := 'Favor de indicar el número de unidades de tiempo de la comisión';
        vlTodoOk := False;
      end;//end if
    end;//end if
    InterForma1.ValidaExit( edNUM_UNIDADES_CN, vlTodoOk, vlMsg, True );
  End;
end;

procedure TWCrCatComision.edDIA_PAGO_CNExit(Sender: TObject);
var  vlMsg     : String;
     vlTodoOk : Boolean;
Begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    vlMsg    := '';
    vlTodoOk := True;
    Objeto.DIA_PAGO_CN.GetFromControl;
    if ( Objeto.DIA_PAGO_CN.AsInteger <= 0 ) OR ( Objeto.DIA_PAGO_CN.AsInteger > 31 ) then
    Begin
      vlMsg := 'Favor de indicar el día de cálculo, el cual debe estar entre 1 y 31';
      vlTodoOk := False;
    end;//end if
    InterForma1.ValidaExit( edDIA_PAGO_CN, vlTodoOk, vlMsg, True );
  End;
end;

procedure TWCrCatComision.rgCVE_TIPO_COBROClick(Sender: TObject);
begin
  OnOffTipoCobro;
end;

procedure TWCrCatComision.rgCVE_TIPO_COBROExit(Sender: TObject);
begin
  OnOffTipoCobro;
  InterForma1.ValidaExit(rgCVE_TIPO_COBRO,True,CNULL,True);
end;

procedure TWCrCatComision.edIMP_COMISIONExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := '';
      VLValida := True;
      Objeto.IMP_COMISION.GetFromControl;
      If Objeto.IMP_COMISION.AsFloat < 0 then
      begin
         VLMsg := 'No se permiten datos negativos';
         VLValida := False;
      end;
      InterForma1.ValidaExit(edIMP_COMISION,VLValida,VLMsg,True);
   end;
end;

procedure TWCrCatComision.edPCT_COMISIONExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := '';
      VLValida := True;
      Objeto.PCT_COMISION.GetFromControl;
      If Objeto.PCT_COMISION.AsFloat < 0 then
      begin
         VLMsg := 'No se permiten datos negativos';
         VLValida := False;
      end;
      InterForma1.ValidaExit(edPCT_COMISION,VLValida,VLMsg,True);
   end;
end;

procedure TWCrCatComision.edIMP_MINIMOExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := '';
      VLValida := True;
      Objeto.IMP_MINIMO.GetFromControl;
      If Objeto.IMP_MINIMO.AsFloat < 0 then
      begin
         VLMsg := 'No se permiten datos negativos';
         VLValida := False;
      end;
      InterForma1.ValidaExit(edIMP_MINIMO,VLValida,VLMsg,True);
   end;
end;

procedure TWCrCatComision.edIMP_MAXIMOExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := '';
      VLValida := True;
      Objeto.IMP_MAXIMO.GetFromControl;
      If Objeto.IMP_MAXIMO.AsFloat < 0 then
      begin
         VLMsg := 'No se permiten datos negativos';
         VLValida := False;
      end;
      InterForma1.ValidaExit(edIMP_MAXIMO,VLValida,VLMsg,True);
   end;
end;

procedure TWCrCatComision.cbCVE_EVENTO_COMExit(Sender: TObject);
var  vlMsg     : String;
     vlTodoOk : Boolean;
begin
  If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    vlMsg    := '';
    vlTodoOk := True;
    Objeto.CVE_EVENTO_COM.GetFromControl;
    if Objeto.CVE_EVENTO_COM.AsString = '' then
    Begin
      vlMsg := 'Favor de indicar el tipo de evento de la comisión.';
      vlTodoOk := False;
    End;//end if
    InterForma1.ValidaExit( cbCVE_EVENTO_COM, vlTodoOk, vlMsg, True );
  End;
  // InterForma1.ValidaExit( cbCVE_EVENTO_COM, True, CNULL, True );
end;

procedure TWCrCatComision.rgCVE_IMP_CALC_COMExit(Sender: TObject);
begin
  InterForma1.ValidaExit(rgCVE_IMP_CALC_COM,True,CNULL,True);
end;

procedure TWCrCatComision.rgB_CALC_PROMEDIOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(rgB_CALC_PROMEDIO,True,CNULL,True);
end;


procedure TWCrCatComision.cbCVE_APLIC_COMExit(Sender: TObject);
var  vlMsg     : String;
     vlTodoOk : Boolean;
begin
  If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    vlMsg    := '';
    vlTodoOk := True;
    Objeto.CVE_APLIC_COM.GetFromControl;
    if Objeto.CVE_APLIC_COM.AsString = '' then
    Begin
      vlMsg := 'Favor de indicar el tipo de aplicación';
      vlTodoOk := False;
    End;//end if
    InterForma1.ValidaExit( cbCVE_APLIC_COM, vlTodoOk, vlMsg, True );
  End;
end;

procedure TWCrCatComision.rgSIT_CAT_COMISIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_CAT_COMISION,True,CNULL,True);
end;

procedure TWCrCatComision.cbB_COMIS_PREMExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_COMIS_PREM,True,CNULL,True);
end;

procedure TWCrCatComision.rgCVE_TIPO_COMISExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_TIPO_COMIS,True,CNULL,True);
end;

procedure TWCrCatComision.cbB_APLVENC_SIExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_APLVENC_SI,True,CNULL,True);
end;

procedure TWCrCatComision.cbB_BLOQ_SALDOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_BLOQ_SALDO,True,CNULL,True);
end;

procedure TWCrCatComision.UnTiempoPeriodicoOtro(vlVisible: Boolean);
begin
  lbUNIDAD_TIEMPO_CN.Visible := vlVisible;
  edDESC_UN_TIEMPO_CN.Visible := vlVisible;
  btUNIDAD_TIEMPO_CN.Visible := vlVisible;
  lbNUM_UNIDADES_CN.Visible := vlVisible;
  edNUM_UNIDADES_CN.Visible := vlVisible;
  lbDIA_PAGO_CN.Visible := vlVisible;
  edDIA_PAGO_CN.Visible := vlVisible;
end;

procedure TWCrCatComision.InterForma1Buscar(Sender: TObject);
begin
   if Objeto.Busca then
   Begin
     If Objeto.CVE_TIPO_COM.AsString = C_TCOM_PE Then
     begin
        Panel_Periodica.Visible := True;
        Panel_Eventual.Visible := False;
        if Objeto.CVE_TIPO_APLICA.AsString = 'C_TCOM_UT' then
        begin
          UnTiempoPeriodicoOtro(True);
        end;
     end;

     If Objeto.CVE_TIPO_COM.AsString = C_TCOM_EV then
     begin
        Panel_Eventual.Visible := True;
        Panel_Periodica.Visible := False;
     end;

     if Objeto.CVE_TIPO_COM.AsString = C_TCOM_PP then
     begin
        Panel_Eventual.Visible := False;
        Panel_Periodica.Visible := False;
     end;

     if Objeto.CVE_TIPO_COBRO.AsString = C_TCOB_COM_PC then
     begin
        lbIMP_COMISION.Visible := False;
        edIMP_COMISION.Visible := False;
        gbCobroPorcentaje.Visible := True;
        edIMP_MINIMO.Visible   := True;
        lbIMP_MINIMO.Visible   := True;
        edIMP_MAXIMO.Visible   := True;
        lbIMP_MAXIMO.Visible   := True;
        rgCVE_IMP_CALC_COM.Visible := True;
     end
     else
     begin
        lbIMP_COMISION.Visible := True;
        edIMP_COMISION.Visible := True;
        gbCobroPorcentaje.Visible := False;
        edIMP_MINIMO.Visible   := False;
        lbIMP_MINIMO.Visible   := False;
        edIMP_MAXIMO.Visible   := False;
        lbIMP_MAXIMO.Visible   := False;
        rgCVE_IMP_CALC_COM.Visible := False;
     end;
   end;

end;

end.


