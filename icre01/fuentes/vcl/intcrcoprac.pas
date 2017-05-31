// Sistema         : Clase de CR_COM_PROG_ACC
// Fecha de Inicio : 26/06/2006
// Función forma   : Clase de CR_COM_PROG_ACC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Sergio Eduardo Lopez Lopez
// Comentarios     :
Unit IntCrCoPrAc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

IntGenCre,      //Unidad generica
IntParamCre,    //ParamCre
IntMon,         //Moneda
IntCrCto,       //Contrato
IntCrCatComi,   //Comisiones
IntTasIndFin,   //Tasa Refer
IntCrUniTie,    //Unidad de tiempo
IntCrAcredit    //Acreditado
;

Type
  TCrCoPrAc = class; 

  TWCrComProgAc=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_COMISION : TLabel; 
    edCVE_COMISION : TEdit;
    lbCVE_MONEDA : TLabel; 
    edCVE_MONEDA : TEdit; 
    chB_APLICA_MORA : TCheckBox;
    chB_GENERA_FACTURA: TCheckBox;
    chB_TASA_MORA_OPE: TCheckBox;
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
    rgCVE_ACCESORIO: TRadioGroup;
    btCOMISION: TBitBtn;
    edDESC_COMISION: TEdit;
    ilCOMISION: TInterLinkit;
    btMONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    ilMONEDA: TInterLinkit;
    lbPCT_COMISION: TLabel;
    lbIMP_COMISION: TLabel;
    lbF_ALTA: TLabel;
    lbCVE_USU_ALTA: TLabel;
    lbCVE_TIPO_APLICACION: TLabel;
    lbCVE_TASA_MORA: TLabel;
    lbOPERADOR_STASA_M: TLabel;
    lbSOBRETASA_M: TLabel;
    Label19: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    lbNUM_UNIDADES_CN: TLabel;
    lbDIA_PAGO_CN: TLabel;
    lbIMP_MAXIMO: TLabel;
    lbCVE_EVENTO_COM: TLabel;
    lbUNIDAD_TIEMPO_CO: TLabel;
    lbVAL_TASA_MORA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_MODIF: TLabel;
    edCVE_UN_TIEMPO_GR: TEdit;
    edCVE_UN_TIEMPO_CO: TEdit;
    edDESC_UN_TIEMPO_CO: TEdit;
    rgSIT_COMIS_PROG: TRadioGroup;
    rgCVE_IMP_CALC_COM: TRadioGroup;
    edIMP_COMISION: TInterEdit;
    edPCT_COMISION: TInterEdit;
    edF_ALTA: TEdit;
    edCVE_USU_ALTA: TEdit;
    cbCVE_TIPO_APLICA: TComboBox;
    rgCVE_TIPO_COM: TRadioGroup;
    edCVE_TASA_MORA: TEdit;
    btCVE_TASA_MORA: TBitBtn;
    edDESC_TASA_MORA: TEdit;
    edOPERADOR_STASA_M: TEdit;
    edSOBRETASA_M: TInterEdit;
    btUNIDAD_TIEMPO_CO: TBitBtn;
    edNUM_UNIDADES_CO: TInterEdit;
    edNUM_UNIDADES_GR: TInterEdit;
    edDESC_UN_TIEMPO_GR: TEdit;
    btUNIDAD_TIEMPO_GR: TBitBtn;
    edDESC_UN_TIEMPO_CN: TEdit;
    btUNIDAD_TIEMPO_CN: TBitBtn;
    edNUM_UNIDADES_CN: TInterEdit;
    rgCVE_TIPO_COBRO: TRadioGroup;
    edDIA_PAGO_CN: TInterEdit;
    edIMP_MINIMO: TInterEdit;
    edIMP_MAXIMO: TInterEdit;
    cbCVE_EVENTO_COM: TComboBox;
    rgB_CALC_PROMEDIO: TRadioGroup;
    edCVE_UN_TIEMPO_CN: TEdit;
    edVAL_TASA_MORA: TEdit;
    btPlanPago: TBitBtn;
    edCVE_USU_MODIFICA: TEdit;
    edF_MODIFICA: TEdit;
    ilTASA_MORA: TInterLinkit;
    lbUNIDAD_TIEMPO_CN: TLabel;
    lbIMP_MINIMO: TLabel;
    edID_ACCESORIO: TEdit;
    lbID_ACCESORIO: TLabel;
    btACCESORIO: TBitBtn;
    edDESC_ACCESORIO: TEdit;
    edFOL_ACCESORIO: TEdit;
    ilACCESORIO: TInterLinkit;
    chB_PRORRATEO: TCheckBox;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure edCVE_COMISIONExit(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure rgCVE_ACCESORIOExit(Sender: TObject);
    procedure rgCVE_ACCESORIOClick(Sender: TObject);
    procedure ilCOMISIONEjecuta(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure btCOMISIONClick(Sender: TObject);
    procedure btMONEDAClick(Sender: TObject);
    procedure chB_GENERA_FACTURAExit(Sender: TObject);
    procedure chB_APLICA_MORAExit(Sender: TObject);
    procedure chB_TASA_MORA_OPEExit(Sender: TObject);
    procedure edCVE_TASA_MORAExit(Sender: TObject);
    procedure btCVE_TASA_MORAClick(Sender: TObject);
    procedure ilTASA_MORAEjecuta(Sender: TObject);
    procedure edOPERADOR_STASA_MExit(Sender: TObject);
    procedure edSOBRETASA_MExit(Sender: TObject);
    procedure edDESC_UN_TIEMPO_COExit(Sender: TObject);
    procedure btUNIDAD_TIEMPO_COClick(Sender: TObject);
    procedure edNUM_UNIDADES_COExit(Sender: TObject);
    procedure edDESC_UN_TIEMPO_GRExit(Sender: TObject);
    procedure btUNIDAD_TIEMPO_GRClick(Sender: TObject);
    procedure edNUM_UNIDADES_GRExit(Sender: TObject);
    procedure rgCVE_TIPO_COMClick(Sender: TObject);
    procedure rgCVE_TIPO_COMExit(Sender: TObject);
    procedure cbCVE_TIPO_APLICAExit(Sender: TObject);
    procedure btPlanPagoExit(Sender: TObject);
    procedure edDESC_UN_TIEMPO_CNExit(Sender: TObject);
    procedure btUNIDAD_TIEMPO_CNClick(Sender: TObject);
    procedure edNUM_UNIDADES_CNExit(Sender: TObject);
    procedure edDIA_PAGO_CNExit(Sender: TObject);
    procedure rgCVE_TIPO_COBROExit(Sender: TObject);
    procedure edIMP_COMISIONExit(Sender: TObject);
    procedure edPCT_COMISIONExit(Sender: TObject);
    procedure edIMP_MINIMOExit(Sender: TObject);
    procedure edIMP_MAXIMOExit(Sender: TObject);
    procedure cbCVE_EVENTO_COMExit(Sender: TObject);
    procedure rgCVE_IMP_CALC_COMExit(Sender: TObject);
    procedure rgB_CALC_PROMEDIOExit(Sender: TObject);
    procedure rgSIT_COMIS_PROGExit(Sender: TObject);
    procedure chB_APLICA_MORAClick(Sender: TObject);
    procedure btUNIDAD_TIEMPO_CNExit(Sender: TObject);
    procedure rgCVE_TIPO_COBROClick(Sender: TObject);
    procedure chB_TASA_MORA_OPEClick(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure btPlanPagoClick(Sender: TObject);
    procedure edID_ACCESORIOEnter(Sender: TObject);
    procedure edID_ACCESORIOExit(Sender: TObject);
    procedure btACCESORIOClick(Sender: TObject);
    procedure ilACCESORIOEjecuta(Sender: TObject);
    procedure ilACCESORIOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCOMISIONCapture(Sender: TObject; var Show: Boolean);
    procedure chB_PRORRATEOExit(Sender: TObject);
  private
    procedure OnOffControlAcc(Bandera : Boolean; CveAccesorio : String );
    procedure OnOffControles(Bandera : Boolean; TipoComision : String );
    procedure OnOffComision;
    procedure OnOffMismaMora;
    procedure OnOffTasaMora;
    procedure OnOffFrecuencia;
    procedure OnOffTipoCobro;
    procedure OnOffUnFrecuencia;
  public
    Objeto : TCrCoPrAc;
  end;
  //
  TCrCoPrAc= class(TInterFrame)
  private
  protected
  //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
        { Public declarations }
        ID_ACC_DEFAULT           : String;
        FOL_ACC_DEFAULT          : String;
        CVE_ACC_DEFAULT          : String;
        //
        ID_ACCESORIO             : TInterCampo;
        FOL_ACCESORIO            : TInterCampo;
        CVE_ACCESORIO            : TInterCampo;
        CVE_COMISION             : TInterCampo;
        CVE_MONEDA               : TInterCampo;
        B_PRORRATEO              : TInterCampo;
        B_GENERA_FACTURA         : TInterCampo;
        B_APLICA_MORA            : TInterCampo;
        B_TASA_MORA_OPE          : TInterCampo;
        CVE_TASA_MORA            : TInterCampo;
        OPERADOR_STASA_M         : TInterCampo;
        SOBRETASA_M              : TInterCampo;
        UNIDAD_TIEMPO_CO         : TInterCampo;
        NUM_UNIDADES_CO          : TInterCampo;
        UNIDAD_TIEMPO_GR         : TInterCampo;
        NUM_UNIDADES_GR          : TInterCampo;
        CVE_TIPO_COM             : TInterCampo;
        CVE_TIPO_APLICA          : TInterCampo;
        UNIDAD_TIEMPO_CN         : TInterCampo;
        NUM_UNIDADES_CN          : TInterCampo;
        DIA_PAGO_CN              : TInterCampo;
        CVE_TIPO_COBRO           : TInterCampo;
        IMP_COMISION             : TInterCampo;
        PCT_COMISION             : TInterCampo;
        IMP_MINIMO               : TInterCampo;
        IMP_MAXIMO               : TInterCampo;
        CVE_EVENTO_COM           : TInterCampo;
        CVE_IMP_CALC_COM         : TInterCampo;
        B_CALC_PROMEDIO          : TInterCampo;
        SIT_COMIS_PROG           : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        //
        ParamCre                 : TParamCre;
        Acreditado               : TCrAcredit;
        Autorizacion             : TCrCto;
        Comision                 : TCrCatComi;
        Moneda                   : TMoneda;
        TasaRefer                : TTasIndFin;
        UTiempoCob               : TCrUniTie;  //Unidad de Tiempo Cobro
        UTiempoGra               : TCrUniTie;  //Unidad de Tiempo Gracia
        UTiempoCom               : TCrUniTie;  //Unidad de Tiempo Comision

        //
        function    getSQLQuery    : String;
        function    InternalBusca  : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
      published 
      end;



implementation
Uses IntCrGeCuCn;    //Plan de pago

{$R *.DFM}


constructor TCrCoPrAc.Create( AOwner : TComponent ); 
begin
      Inherited;
      //
      ID_ACCESORIO  := CreaCampo('ID_ACCESORIO',   ftFloat, tsNinguno, tsNinguno, True );
      ID_ACCESORIO.Caption   := 'Número de Accesorio';
      FOL_ACCESORIO  := CreaCampo('FOL_ACCESORIO', ftFloat, tsNinguno, tsNinguno, True );
      FOL_ACCESORIO.Caption  := 'Fol Accesorio';
      CVE_ACCESORIO := CreaCampo('CVE_ACCESORIO',  ftString,  tsNinguno, tsNinguno,  True );
      CVE_ACCESORIO.Caption  := 'Clave de Accesorio';
      CVE_COMISION :=CreaCampo('CVE_COMISION',ftString,tsNinguno,tsNinguno,True);
                CVE_COMISION.Caption:='Clave de Comision';
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA.Caption:='Clave de Moneda';
      B_PRORRATEO := CreaCampo('B_PRORRATEO', ftString, tsNinguno, tsNinguno, True);
      B_PRORRATEO.Caption:='Aplica Prorrateo';
      B_GENERA_FACTURA :=CreaCampo('B_GENERA_FACTURA',ftString,tsNinguno,tsNinguno,True);
                B_GENERA_FACTURA.Caption:='Genera Factura';
      B_APLICA_MORA :=CreaCampo('B_APLICA_MORA',ftString,tsNinguno,tsNinguno,True);
                B_APLICA_MORA.Caption:='Aplica Mora';
      B_TASA_MORA_OPE :=CreaCampo('B_TASA_MORA_OPE',ftString,tsNinguno,tsNinguno,True);
                B_TASA_MORA_OPE.Caption:='Tasa Mora Ope';
      CVE_TASA_MORA :=CreaCampo('CVE_TASA_MORA',ftString,tsNinguno,tsNinguno,True);
                CVE_TASA_MORA.Caption:='Clave de Tasa Mora';
      OPERADOR_STASA_M :=CreaCampo('OPERADOR_STASA_M',ftString,tsNinguno,tsNinguno,True);
                OPERADOR_STASA_M.Caption:='Operador Stasa M';
      SOBRETASA_M :=CreaCampo('SOBRETASA_M',ftFloat,tsNinguno,tsNinguno,True);
                SOBRETASA_M.Caption:='Sobretasa M';
      UNIDAD_TIEMPO_CO :=CreaCampo('UNIDAD_TIEMPO_CO',ftString,tsNinguno,tsNinguno,True);
                UNIDAD_TIEMPO_CO.Caption:='Unidad Tiempo Co';
      NUM_UNIDADES_CO :=CreaCampo('NUM_UNIDADES_CO',ftFloat,tsNinguno,tsNinguno,True);
                NUM_UNIDADES_CO.Caption:='Número Unidades Co';
      UNIDAD_TIEMPO_GR :=CreaCampo('UNIDAD_TIEMPO_GR',ftString,tsNinguno,tsNinguno,True);
                UNIDAD_TIEMPO_GR.Caption:='Unidad Tiempo Gr';
      NUM_UNIDADES_GR :=CreaCampo('NUM_UNIDADES_GR',ftFloat,tsNinguno,tsNinguno,True);
                NUM_UNIDADES_GR.Caption:='Número Unidades Gr';
      CVE_TIPO_COM :=CreaCampo('CVE_TIPO_COM',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_COM.Caption:='Clave de Tipo Com';
      CVE_TIPO_APLICA :=CreaCampo('CVE_TIPO_APLICA',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_APLICA.Caption:='Clave de Tipo Aplica';
      UNIDAD_TIEMPO_CN :=CreaCampo('UNIDAD_TIEMPO_CN',ftString,tsNinguno,tsNinguno,True);
                UNIDAD_TIEMPO_CN.Caption:='Unidad Tiempo Cn';
      NUM_UNIDADES_CN :=CreaCampo('NUM_UNIDADES_CN',ftFloat,tsNinguno,tsNinguno,True);
                NUM_UNIDADES_CN.Caption:='Número Unidades Cn';
      DIA_PAGO_CN :=CreaCampo('DIA_PAGO_CN',ftFloat,tsNinguno,tsNinguno,True);
                DIA_PAGO_CN.Caption:='Dia Pago Cn';
      CVE_TIPO_COBRO :=CreaCampo('CVE_TIPO_COBRO',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_COBRO.Caption:='Clave de Tipo Cobro';
      IMP_COMISION :=CreaCampo('IMP_COMISION',ftFloat,tsNinguno,tsNinguno,True);
                IMP_COMISION.Caption:='Imp Comision';
      PCT_COMISION :=CreaCampo('PCT_COMISION',ftFloat,tsNinguno,tsNinguno,True);
                PCT_COMISION.Caption:='Pct Comision';
      IMP_MINIMO :=CreaCampo('IMP_MINIMO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MINIMO.Caption:='Imp Minimo';
      IMP_MAXIMO :=CreaCampo('IMP_MAXIMO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MAXIMO.Caption:='Imp Maximo';
      CVE_EVENTO_COM :=CreaCampo('CVE_EVENTO_COM',ftString,tsNinguno,tsNinguno,True);
                CVE_EVENTO_COM.Caption:='Clave de Evento Com';
      CVE_IMP_CALC_COM :=CreaCampo('CVE_IMP_CALC_COM',ftString,tsNinguno,tsNinguno,True);
                CVE_IMP_CALC_COM.Caption:='Clave de Imp Calc Com';
      B_CALC_PROMEDIO :=CreaCampo('B_CALC_PROMEDIO',ftString,tsNinguno,tsNinguno,True);
                B_CALC_PROMEDIO.Caption:='Calc Promedio';
      SIT_COMIS_PROG :=CreaCampo('SIT_COMIS_PROG',ftString,tsNinguno,tsNinguno,True);
                SIT_COMIS_PROG.Caption:='Situación Comis Prog';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      //
      With CVE_ACCESORIO do
      begin
        Size := 2;
        UseCombo := True;
        ComboLista.Add('0');                           ComboDatos.Add(C_ACCESORIO_ACREDITADO);
        ComboLista.Add('1');                           ComboDatos.Add(C_ACCESORIO_AUTORIZACION);
      end;
      With SIT_COMIS_PROG do
      begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0');                           ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1');                           ComboDatos.Add(CSIT_CA);
      end;
      With CVE_IMP_CALC_COM do
      begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0');                           ComboDatos.Add(C_TCOM_AC);
        ComboLista.Add('1');                           ComboDatos.Add(C_TCOM_DC);
        ComboLista.Add('2');                           ComboDatos.Add(C_TCOM_CI);
        ComboLista.Add('3');                           ComboDatos.Add(C_TCOM_CD);
        ComboLista.Add('4');                           ComboDatos.Add(C_TCOM_AL);
        ComboLista.Add('5');                           ComboDatos.Add(C_TCOM_DL);
        ComboLista.Add('6');                           ComboDatos.Add(C_TCOM_LI);
        ComboLista.Add('7');                           ComboDatos.Add(C_TCOM_LD);
        ComboLista.Add('8');                           ComboDatos.Add(C_TCOM_ID);
        ComboLista.Add('9');                           ComboDatos.Add(C_TCOM_SI);
        ComboLista.Add('10');                          ComboDatos.Add(C_TCOM_PC);
        ComboLista.Add('11');                          ComboDatos.Add(C_TCOM_IO);
        //ComboLista.Add('11');                          ComboDatos.Add(C_TCOM_PI);
      end;
      With B_CALC_PROMEDIO do
      begin
        Size := 1;
        UseCombo:=True;
        ComboLista.Add('0');                           ComboDatos.Add('F');
        ComboLista.Add('1');                           ComboDatos.Add('V');
      end;
      With CVE_TIPO_COM do
      begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0');                           ComboDatos.Add(C_TCOM_PE);
        ComboLista.Add('1');                           ComboDatos.Add(C_TCOM_EV);
        ComboLista.Add('2');                           ComboDatos.Add(C_TCOM_PP);
      end;
      With CVE_TIPO_APLICA do
      begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('Per. Capital y/o Interes');    ComboDatos.Add(C_TCOM_AM);
        ComboLista.Add('Per. Capital');                ComboDatos.Add(C_TCOM_PC);
        ComboLista.Add('Per. Interes');                ComboDatos.Add(C_TCOM_PI);
        ComboLista.Add('Otro');                        ComboDatos.Add(C_TCOM_UT);
      end;
      With CVE_TIPO_COBRO do
      begin
        Size := 2;
        UseCombo := True;
        ComboLista.Add('0');                           ComboDatos.Add(C_TCOB_COM_VF);
        ComboLista.Add('1');                           ComboDatos.Add(C_TCOB_COM_PC);
      end;
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
      //
      Acreditado   := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;
      Acreditado.FieldByName('ID_ACREDITADO').MasterField := 'ID_ACCESORIO';
      //
      Autorizacion := TCrCto.Create(Self);
      Autorizacion.MasterSource := Self;
      Autorizacion.FieldByName('ID_CONTRATO').MasterField := 'ID_ACCESORIO';
      Autorizacion.FieldByName('FOL_CONTRATO').MasterField:= 'FOL_ACCESORIO';
      //
      Comision := TCrCatComi.Create(Self);
      Comision.MasterSource := Self;
      Comision.FieldByName('CVE_COMISION').MasterField := 'CVE_COMISION';
      //
      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource := Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField := 'CVE_MONEDA';
      //
      TasaRefer := TTasIndFin.Create(Self);
      TasaRefer.MasterSource := Self;
      TasaRefer.FieldByName('CVE_TASA_INDICAD').MasterField  := 'CVE_TASA_MORA';
      //
      UTiempoCob := TCrUniTie.Create(Self);
      UTiempoCob.MasterSource := Self;
      UTiempoCob.FieldByName('CVE_UNIDAD_TIEMP').MasterField := 'UNIDAD_TIEMPO_CO';
      //
      UTiempoGra := TCrUniTie.Create(Self);
      UTiempoGra.MasterSource := Self;
      UTiempoGra.FieldByName('CVE_UNIDAD_TIEMP').MasterField := 'UNIDAD_TIEMPO_GR';
      //
      UTiempoCom := TCrUniTie.Create(Self);
      UTiempoCom.MasterSource := Self;
      UTiempoCom.FieldByName('CVE_UNIDAD_TIEMP').MasterField := 'UNIDAD_TIEMPO_CN';
      //
      ID_ACC_DEFAULT  := '0';
      FOL_ACC_DEFAULT := '0';
      CVE_ACC_DEFAULT := C_ACCESORIO_AUTORIZACION;
      //
      FKeyFields.Add('ID_ACCESORIO');
      FKeyFields.Add('FOL_ACCESORIO');
      FKeyFields.Add('CVE_ACCESORIO');
      FKeyFields.Add('CVE_COMISION');
      //
      TableName := 'CR_COM_PROG_ACC';
      //
      UseQuery := True; 
      HelpFile := 'IntCrCoPrAc.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCoPrAc.Destroy;
begin
  if Acreditado   <> nil then Acreditado.Free;
  if Autorizacion <> nil then Autorizacion.Free;
  if Comision     <> nil then Comision.Free;
  if Moneda       <> nil then Moneda.Free;
  if TasaRefer    <> nil then TasaRefer.Free;
  if UTiempoCob   <> nil then UTiempoCob.Free;
  if UTiempoGra   <> nil then UTiempoGra.Free;
  if UTiempoCom   <> nil then UTiempoCom.Free;
  //
  inherited;
end;


function TCrCoPrAc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrComProgAc;
begin
   W  := TWCrComProgAc.Create(Self);
   try
      W.Objeto := Self;
      W.InterForma1.InterFrame := Self;
      W.InterForma1.FormaTipo  := FormaTipo;
      W.InterForma1.ShowGrid   := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion    := FInterFun;
      //W.
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrCoPrAc.InternalBusca:Boolean;
Var T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrCPAc.it','F,F,S,S');
  Try
    if Active then
    begin
      T.Param(0, ID_ACCESORIO.AsString  );
      T.Param(1, FOL_ACCESORIO.AsString );
      T.Param(2, CVE_ACCESORIO.AsString );
      T.Param(3, CVE_COMISION.AsString  );
    end;
    if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
  finally
    T.Free;
  end;
end;


function TCrCoPrAc.getSQLQuery: String;
begin
  Result := 'SELECT  COUNT(*) VECES'                                      + coCRLF +
            'FROM     CR_COM_CUOTA_ACC'                                   + coCRLF +
            'WHERE    ID_ACCESORIO  = ' + ID_ACCESORIO.AsString           + coCRLF +
            '  AND    FOL_ACCESORIO = ' + FOL_ACCESORIO.AsString          + coCRLF +
            '  AND    CVE_ACCESORIO = ' + SQLStr( CVE_ACCESORIO.AsString) + coCRLF +
            '  AND    CVE_COMISION  = ' + SQLStr( CVE_COMISION.AsString)  + coCRLF +
            '  AND    SIT_COM_CUOTA = ''AU'' ';
            ;
end;

(***********************************************FORMA CR_COM_PROG_ACC********************)
(*                                                                              *)
(*  FORMA DE CR_COM_PROG_ACC                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_COM_PROG_ACC********************)
//
procedure TWCrComProgAc.OnOffControlAcc(Bandera : Boolean; CveAccesorio : String );
begin
  {
  if ( (Objeto.Modo = moEdit) or (Objeto.Modo=moAppend) ) then
  begin
  }
    if Objeto.Acreditado.ID_ACREDITADO.Control  <> nil then Objeto.Acreditado.ID_ACREDITADO.Control  := nil;
    if Objeto.Acreditado.Persona.Nombre.Control <> nil then Objeto.Acreditado.Persona.Nombre.Control := nil;
    if Objeto.Autorizacion.ID_CONTRATO.Control  <> nil then Objeto.Autorizacion.ID_CONTRATO.Control  := nil;
    if Objeto.Autorizacion.FOL_CONTRATO.Control <> nil then Objeto.Autorizacion.FOL_CONTRATO.Control := nil;
    if Objeto.Autorizacion.Producto.DESC_C_PRODUCTO.Control <> nil then Objeto.Autorizacion.Producto.DESC_C_PRODUCTO.Control := nil;
    //
    if Bandera then
    Begin
      //
      lbID_ACCESORIO.Caption   := 'Accesorio';
      if CveAccesorio = C_ACCESORIO_ACREDITADO then
      begin
        lbID_ACCESORIO.Caption := 'Acreditado';
        Objeto.Acreditado.ID_ACREDITADO.Control  := edID_ACCESORIO;
        Objeto.Acreditado.Persona.Nombre.Control := edDESC_ACCESORIO;
        if ( Objeto.Modo = moAppend ) then
          Objeto.FOL_ACCESORIO.AsInteger         := 0;
      end else if CveAccesorio = C_ACCESORIO_AUTORIZACION then
      begin
        lbID_ACCESORIO.Caption := 'Autorización';
        Objeto.Autorizacion.ID_CONTRATO.Control  := edID_ACCESORIO;
        Objeto.Autorizacion.FOL_CONTRATO.Control := edFOL_ACCESORIO;
        Objeto.Autorizacion.Producto.DESC_C_PRODUCTO.Control  := edDESC_ACCESORIO;
      end;
      //
    end;
    //
  {
  end;
  }
  //
end;
//
//
procedure TWCrComProgAc.OnOffControles(Bandera : Boolean; TipoComision : String );
begin
      edCVE_MONEDA.Enabled         := Bandera;
      btMONEDA.Enabled             := Bandera;
      chB_PRORRATEO.Enabled        := Bandera;
      chB_GENERA_FACTURA.Enabled   := Bandera;
      chB_APLICA_MORA.Enabled      := Bandera;
      chB_TASA_MORA_OPE.Enabled    := Bandera;
      edCVE_TASA_MORA.Enabled      := Bandera;
      btCVE_TASA_MORA.Enabled      := Bandera;
      edOPERADOR_STASA_M.Enabled   := Bandera;
      edSOBRETASA_M.Enabled        := Bandera;
      btUNIDAD_TIEMPO_CO.Enabled   := Bandera;
      edNUM_UNIDADES_CO.Enabled    := Bandera;
      btUNIDAD_TIEMPO_GR.Enabled   := Bandera;
      edNUM_UNIDADES_GR.Enabled    := Bandera;
      rgCVE_TIPO_COM.Enabled       := Bandera;
      cbCVE_TIPO_APLICA.Enabled    := Bandera;
      btPlanPago.Enabled           := ( Bandera or ( TipoComision = C_TCOM_PP ));
      btUNIDAD_TIEMPO_CN.Enabled   := Bandera;
      edNUM_UNIDADES_CN.Enabled    := Bandera;
      edDIA_PAGO_CN.Enabled        := Bandera;
      cbCVE_EVENTO_COM.Enabled     := Bandera;
      rgCVE_TIPO_COBRO.Enabled     := Bandera;
      edIMP_COMISION.Enabled       := Bandera;
      edPCT_COMISION.Enabled       := Bandera;
      edIMP_MINIMO.Enabled         := Bandera;
      edIMP_MAXIMO.Enabled         := Bandera;
      rgCVE_IMP_CALC_COM.Enabled   := Bandera;
      rgB_CALC_PROMEDIO.Enabled    := Bandera;
      rgSIT_COMIS_PROG.Enabled     := Bandera;
end;
//
procedure TWCrComProgAc.OnOffComision;
begin
  if ( (Objeto.Modo = moEdit) or (Objeto.Modo=moAppend) ) then
  begin
    if ( ( Objeto.Modo = moAppend ) ) then
    Begin
        Objeto.CVE_MONEDA.AsString       := Objeto.Comision.CVE_MONEDA.AsString;
        if Objeto.CVE_MONEDA.AsString <> '' then
          Objeto.Moneda.FindKey([ Objeto.CVE_MONEDA.AsString ]);
        //ends_if
        Objeto.B_PRORRATEO.AsString      := Objeto.Comision.B_PRORRATEO.AsString;
        Objeto.B_GENERA_FACTURA.AsString := Objeto.Comision.B_GENERA_FACTURA.AsString;
        Objeto.B_APLICA_MORA.AsString    := Objeto.Comision.B_APLICA_MORA.AsString;
        Objeto.B_TASA_MORA_OPE.AsString  := Objeto.Comision.B_TASA_MORA_OPE.AsString;
        Objeto.CVE_TASA_MORA.AsString    := Objeto.Comision.CVE_TASA_MORA.AsString;
        Objeto.OPERADOR_STASA_M.AsString := Objeto.Comision.OPERADOR_STASA_M.AsString;
        Objeto.SOBRETASA_M.AsString      := Objeto.Comision.SOBRETASA_M.AsString;
        Objeto.UNIDAD_TIEMPO_CO.AsString := Objeto.Comision.UNIDAD_TIEMPO_CO.AsString;
        Objeto.NUM_UNIDADES_CO.AsInteger := Objeto.Comision.NUM_UNIDADES_CO.AsInteger;
        Objeto.UNIDAD_TIEMPO_GR.AsString := Objeto.Comision.UNIDAD_TIEMPO_GR.AsString;
        Objeto.NUM_UNIDADES_GR.AsInteger := Objeto.Comision.NUM_UNIDADES_GR.AsInteger;
        Objeto.CVE_TIPO_COM.AsString     := Objeto.Comision.CVE_TIPO_COM.AsString;
        Objeto.CVE_TIPO_APLICA.AsString  := Objeto.Comision.CVE_TIPO_APLICA.AsString;
        Objeto.UNIDAD_TIEMPO_CN.AsString := Objeto.Comision.UNIDAD_TIEMPO_CN.AsString;
        Objeto.NUM_UNIDADES_CN.AsInteger := Objeto.Comision.NUM_UNIDADES_CN.AsInteger;
        Objeto.DIA_PAGO_CN.AsInteger     := Objeto.Comision.DIA_PAGO_CN.AsInteger;
        Objeto.CVE_TIPO_COBRO.AsString   := Objeto.Comision.CVE_TIPO_COBRO.AsString;
        Objeto.IMP_COMISION.AsFloat      := Objeto.Comision.IMP_COMISION.AsFloat;
        Objeto.PCT_COMISION.AsFloat      := Objeto.Comision.PCT_COMISION.AsFloat;
        Objeto.IMP_MINIMO.AsFloat        := Objeto.Comision.IMP_MINIMO.AsFloat;
        Objeto.IMP_MAXIMO.AsFloat        := Objeto.Comision.IMP_MAXIMO.AsFloat;
        Objeto.CVE_EVENTO_COM.AsString   := Objeto.Comision.CVE_EVENTO_COM.AsString;
        Objeto.CVE_IMP_CALC_COM.AsString := Objeto.Comision.CVE_IMP_CALC_COM.AsString;
        Objeto.B_CALC_PROMEDIO.AsString  := Objeto.Comision.B_CALC_PROMEDIO.AsString;
    End;
    //
    if Objeto.Comision.B_MODIFICA_CAT.AsString = 'V' then
    Begin
      OnOffControles(True, Objeto.CVE_TIPO_COM.AsString );
    End else Begin
      OnOffControles(False, Objeto.CVE_TIPO_COM.AsString);
      //
    End;
    //
  End;
end;
//
procedure TWCrComProgAc.OnOffTasaMora;
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
end;
//
procedure TWCrComProgAc.OnOffMismaMora;
var vlEnabled : Boolean;
begin
  if ( (Objeto.Modo = moEdit) or (Objeto.Modo=moAppend) ) then
  begin
    Objeto.B_APLICA_MORA.GetFromControl;
    vlEnabled := ( Objeto.B_APLICA_MORA.AsString = 'V' );
    chB_TASA_MORA_OPE.Enabled := vlEnabled;
    if not vlEnabled then
      OnOffTasaMora;
    //
  end;
  //
end;
//
procedure TWCrComProgAc.OnOffFrecuencia;
var vlEnabled : Boolean;
begin
  if ( (Objeto.Modo = moEdit) or (Objeto.Modo=moAppend) ) then
  begin
    Objeto.CVE_TIPO_COM.GetFromControl;
    vlEnabled := ( Objeto.CVE_TIPO_COM.AsString = C_TCOM_PE );
    //
    cbCVE_TIPO_APLICA.Enabled  := vlEnabled;
    btUNIDAD_TIEMPO_CN.Enabled := False;
    edNUM_UNIDADES_CN.Enabled  := False;
    edDIA_PAGO_CN.Enabled      := False;
    btPlanPago.Enabled         := ( Objeto.CVE_TIPO_COM.AsString = C_TCOM_PP );
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
  End;
end;
//
procedure TWCrComProgAc.OnOffTipoCobro;
var vlEnabled : Boolean;
begin
  if ( (Objeto.Modo = moEdit) or (Objeto.Modo=moAppend) ) then
  begin
    Objeto.CVE_TIPO_COBRO.GetFromControl;
    vlEnabled := ( Objeto.CVE_TIPO_COBRO.AsString = C_TCOB_COM_PC );
    //
    edIMP_COMISION.Enabled := not vlEnabled;
    edPCT_COMISION.Enabled := vlEnabled;
    edIMP_MINIMO.Enabled   := vlEnabled;
    edIMP_MAXIMO.Enabled   := vlEnabled;
    rgCVE_IMP_CALC_COM.Enabled := vlEnabled;
    //
    if vlEnabled then
    begin
      edIMP_COMISION.Color := clBtnFace;
      edPCT_COMISION.Color := clWindow;
      edIMP_MINIMO.Color   := clWindow;
      edIMP_MAXIMO.Color   := clWindow;
    end else begin
      edIMP_COMISION.Color := clWindow;
      edPCT_COMISION.Color := clBtnFace;
      edIMP_MINIMO.Color   := clBtnFace;
      edIMP_MAXIMO.Color   := clBtnFace;
    end;
  End;
end;
//
procedure TWCrComProgAc.OnOffUnFrecuencia;
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
end;



procedure TWCrComProgAc.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
      //
      Objeto.CVE_ACCESORIO.Control    := rgCVE_ACCESORIO;
      Objeto.ID_ACCESORIO.Control     := edID_ACCESORIO;
      Objeto.FOL_ACCESORIO.Control    := edFOL_ACCESORIO;
      Objeto.CVE_COMISION.Control     := edCVE_COMISION;
      Objeto.CVE_MONEDA.Control       := edCVE_MONEDA;
      Objeto.B_PRORRATEO.Control      := chB_PRORRATEO;
      Objeto.B_GENERA_FACTURA.Control := chB_GENERA_FACTURA;
      Objeto.B_APLICA_MORA.Control    := chB_APLICA_MORA;
      Objeto.B_TASA_MORA_OPE.Control  := chB_TASA_MORA_OPE;
      Objeto.CVE_TASA_MORA.Control    := edCVE_TASA_MORA;
      Objeto.OPERADOR_STASA_M.Control := edOPERADOR_STASA_M;
      Objeto.SOBRETASA_M.Control      := edSOBRETASA_M;
      Objeto.UNIDAD_TIEMPO_CO.Control := edCVE_UN_TIEMPO_CO;
      Objeto.NUM_UNIDADES_CO.Control  := edNUM_UNIDADES_CO;
      Objeto.UNIDAD_TIEMPO_GR.Control := edCVE_UN_TIEMPO_GR;
      Objeto.NUM_UNIDADES_GR.Control  := edNUM_UNIDADES_GR;
      Objeto.CVE_TIPO_COM.Control     := rgCVE_TIPO_COM;
      Objeto.CVE_TIPO_APLICA.Control  := cbCVE_TIPO_APLICA;
      Objeto.UNIDAD_TIEMPO_CN.Control := edCVE_UN_TIEMPO_CN;
      Objeto.NUM_UNIDADES_CN.Control  := edNUM_UNIDADES_CN;
      Objeto.DIA_PAGO_CN.Control      := edDIA_PAGO_CN;
      Objeto.CVE_TIPO_COBRO.Control   := rgCVE_TIPO_COBRO;
      Objeto.IMP_COMISION.Control     := edIMP_COMISION;
      Objeto.PCT_COMISION.Control     := edPCT_COMISION;
      Objeto.IMP_MINIMO.Control       := edIMP_MINIMO;
      Objeto.IMP_MAXIMO.Control       := edIMP_MAXIMO;
      Objeto.CVE_EVENTO_COM.Control   := cbCVE_EVENTO_COM;
      Objeto.CVE_IMP_CALC_COM.Control := rgCVE_IMP_CALC_COM;
      Objeto.B_CALC_PROMEDIO.Control  := rgB_CALC_PROMEDIO;
      Objeto.SIT_COMIS_PROG.Control   := rgSIT_COMIS_PROG;
      Objeto.F_ALTA.Control           := edF_ALTA;
      Objeto.CVE_USU_ALTA.Control     := edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control       := edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;
      //
      OnOffControlAcc(True, Objeto.CVE_ACC_DEFAULT );
      Objeto.Comision.CVE_COMISION.Control       := edCVE_COMISION;
      Objeto.Comision.DESC_COMISION.Control      := edDESC_COMISION;
      Objeto.Moneda.Cve_Moneda.Control           := edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control          := edDESC_MONEDA;
      Objeto.TasaRefer.CVE_TASA_INDICAD.Control  := edCVE_TASA_MORA;
      Objeto.TasaRefer.DESC_TASA_INDIC.Control   := edDESC_TASA_MORA;
      Objeto.UTiempoCob.CVE_UNIDAD_TIEMP.Control := edCVE_UN_TIEMPO_CO;
      Objeto.UTiempoCob.DESCRIPCION.Control      := edDESC_UN_TIEMPO_CO;
      Objeto.UTiempoGra.CVE_UNIDAD_TIEMP.Control := edCVE_UN_TIEMPO_GR;
      Objeto.UTiempoGra.DESCRIPCION.Control      := edDESC_UN_TIEMPO_GR;
      Objeto.UTiempoCom.CVE_UNIDAD_TIEMP.Control := edCVE_UN_TIEMPO_CN;
      Objeto.UTiempoCom.DESCRIPCION.Control      := edDESC_UN_TIEMPO_CN;

      InterForma1.MsgPanel := MsgPanel;
end;

procedure TWCrComProgAc.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_ACCESORIO.Control    := nil;
      Objeto.ID_ACCESORIO.Control     := nil;
      Objeto.FOL_ACCESORIO.Control    := nil;
      Objeto.CVE_COMISION.Control     := nil;
      Objeto.CVE_MONEDA.Control       := nil;
      Objeto.B_PRORRATEO.Control      := nil;
      Objeto.B_GENERA_FACTURA.Control := nil;
      Objeto.B_APLICA_MORA.Control    := nil;
      Objeto.B_TASA_MORA_OPE.Control  := nil;

      Objeto.CVE_TASA_MORA.Control:=nil;
      Objeto.OPERADOR_STASA_M.Control:=nil;
      Objeto.SOBRETASA_M.Control:=nil;
      Objeto.UNIDAD_TIEMPO_CO.Control:=nil;
      Objeto.NUM_UNIDADES_CO.Control:=nil;
      Objeto.UNIDAD_TIEMPO_GR.Control:=nil;
      Objeto.NUM_UNIDADES_GR.Control:=nil;
      Objeto.CVE_TIPO_COM.Control:=nil;
      Objeto.CVE_TIPO_APLICA.Control:=nil;
      Objeto.UNIDAD_TIEMPO_CN.Control:=nil;
      Objeto.NUM_UNIDADES_CN.Control:=nil;
      Objeto.DIA_PAGO_CN.Control:=nil;
      Objeto.CVE_TIPO_COBRO.Control:=nil;
      Objeto.IMP_COMISION.Control:=nil;
      Objeto.PCT_COMISION.Control:=nil;
      Objeto.IMP_MINIMO.Control:=nil;
      Objeto.IMP_MAXIMO.Control:=nil;
      Objeto.CVE_EVENTO_COM.Control:=nil;
      Objeto.CVE_IMP_CALC_COM.Control:=nil;
      Objeto.B_CALC_PROMEDIO.Control:=nil;
      Objeto.SIT_COMIS_PROG.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
      //
      OnOffControlAcc(False, Objeto.CVE_ACC_DEFAULT );
      Objeto.Comision.CVE_COMISION.Control       := nil;
      Objeto.Comision.DESC_COMISION.Control      := nil;
      Objeto.Moneda.Cve_Moneda.Control           := nil;
      Objeto.Moneda.Desc_Moneda.Control          := nil;
      Objeto.TasaRefer.CVE_TASA_INDICAD.Control  := nil;
      Objeto.TasaRefer.DESC_TASA_INDIC.Control   := nil;
      Objeto.UTiempoCob.CVE_UNIDAD_TIEMP.Control := nil;
      Objeto.UTiempoCob.DESCRIPCION.Control      := nil;
      Objeto.UTiempoGra.CVE_UNIDAD_TIEMP.Control := nil;
      Objeto.UTiempoGra.DESCRIPCION.Control      := nil;
      Objeto.UTiempoCom.CVE_UNIDAD_TIEMP.Control := nil;
      Objeto.UTiempoCom.DESCRIPCION.Control      := nil;

end;

procedure TWCrComProgAc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TWCrComProgAc.InterForma1DespuesNuevo(Sender: TObject);
begin
  Objeto.SIT_COMIS_PROG.AsString := CSIT_AC;
  Objeto.CVE_USU_ALTA.AsString   := Objeto.Apli.Usuario;
  Objeto.F_ALTA.AsDateTime       := Now;
  //
  if ( Objeto.CVE_ACC_DEFAULT  <> '' ) then
  begin
    Objeto.CVE_ACCESORIO.AsString := Objeto.CVE_ACC_DEFAULT;
    Objeto.CVE_ACCESORIO.DrawControl;
    //
    if ( StrToIntDef(Objeto.ID_ACC_DEFAULT, 0 ) > 0 ) then
    begin
      rgCVE_ACCESORIO.Enabled := False;
      //
      if Objeto.CVE_ACC_DEFAULT = C_ACCESORIO_ACREDITADO then
         Objeto.Acreditado.FindKey  ( [ Objeto.ID_ACC_DEFAULT ] )
      else if Objeto.CVE_ACC_DEFAULT = C_ACCESORIO_AUTORIZACION then
         Objeto.Autorizacion.FindKey( [ Objeto.ID_ACC_DEFAULT, Objeto.FOL_ACC_DEFAULT ] );
      //
      if edCVE_COMISION.CanFocus then edCVE_COMISION.SetFocus;
      //
    end else
      if rgCVE_ACCESORIO.CanFocus then rgCVE_ACCESORIO.SetFocus;
    //
  end else begin
    //
    if rgCVE_ACCESORIO.CanFocus then rgCVE_ACCESORIO.SetFocus;
    //
  end;
end;
//
procedure TWCrComProgAc.InterForma1AntesModificar(Sender: TObject;  var Realizado: Boolean);
begin
  Realizado := True;
  if Objeto.Comision.B_MODIFICA_CAT.AsString <> 'V' then
  Begin
    Realizado := False;
    MessageDlg('¡¡¡ No se aceptan cambios a esta comisión !!!', mtWarning, [mbOk], 0 );
  End;
  //
  if ( Realizado ) AND ( Objeto.SIT_COMIS_PROG.AsString <> 'AC' ) then
  Begin
    Realizado := False;
    MessageDlg('¡¡¡ La comisión debe de estar activa para modificación !!!', mtWarning, [mbOk], 0 );
  End;
  //
end;
//
procedure TWCrComProgAc.InterForma1DespuesModificar(Sender: TObject);
begin
  Objeto.CVE_USU_MODIFICA.AsString   := Objeto.Apli.Usuario;
  Objeto.F_MODIFICA.AsDateTime       := Now;
  //
  if edCVE_MONEDA.CanFocus then
     edCVE_MONEDA.SetFocus;
  //
end;
//
procedure TWCrComProgAc.rgCVE_ACCESORIOClick(Sender: TObject);
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  begin
    Objeto.CVE_ACCESORIO.GetFromControl;
    OnOffControlAcc(True, Objeto.CVE_ACCESORIO.AsString );
    InterForma1.NextTab( rgCVE_ACCESORIO );
  end;
end;
//
procedure TWCrComProgAc.rgCVE_ACCESORIOExit(Sender: TObject);
var  vlMsg     : String;
     vlTodoOk : Boolean;
Begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    vlMsg    := '';
    vlTodoOk := True;
    Objeto.CVE_ACCESORIO.GetFromControl;
    if Objeto.CVE_ACCESORIO.AsString = '' then
    Begin
      vlMsg := 'Favor de indicar la clave de accesorio';
      vlTodoOk := False;
    end;//end if
    //
    if vlTodoOk then OnOffControlAcc( True, Objeto.CVE_ACCESORIO.AsString );
    //
    InterForma1.ValidaExit( rgCVE_ACCESORIO, vlTodoOk, vlMsg, True );
  End;
end;
//
procedure TWCrComProgAc.edID_ACCESORIOEnter(Sender: TObject);
begin
  Objeto.Comision.FilterString := 'CR_CAT_COMISION.CVE_COMISION <> ''CODI''';
  Objeto.Comision.BuscaWhereString := 'CR_CAT_COMISION.CVE_COMISION <> ''CODI''';
end;
//
procedure TWCrComProgAc.edID_ACCESORIOExit(Sender: TObject);
var  vlMsg     : String;
     vlTodoOk : Boolean;
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    vlMsg    := '';
    vlTodoOk := True;
    Objeto.CVE_ACCESORIO.GetFromControl;
    Objeto.ID_ACCESORIO.GetFromControl;
    Objeto.FOL_ACCESORIO.GetFromControl;
    //
    if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_ACREDITADO then
    Begin
      //
      if (   Objeto.ID_ACCESORIO.AsInteger < 0 ) OR
         ( ( Objeto.ID_ACCESORIO.AsInteger = 0 ) AND ( Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_ACREDITADO ) ) then
      Begin
        vlMsg := 'Favor de indicar el acreditado';
        vlTodoOk := False;
      end;//end if
    End else if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_AUTORIZACION then
    Begin
      if (   Objeto.ID_ACCESORIO.AsInteger < 0 ) OR
         ( ( Objeto.ID_ACCESORIO.AsInteger = 0 ) AND ( Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_AUTORIZACION ) ) then
      Begin
        vlMsg := 'Favor de indicar el número de autorización';
        vlTodoOk := False;
      End else Begin
        Objeto.Comision.FilterString     := 'CR_CAT_COMISION.CVE_COMISION <> ''CODI'' '    + coCRLF +
                                            'AND CR_CAT_COMISION.CVE_COMISION IN ( '       + coCRLF +
                                            'SELECT CVE_COMISION FROM CR_PRODUCTO_COM '    + coCRLF +
                                            'WHERE CVE_PRODUCTO_CRE = ' +
                                            SQLStr(Objeto.Autorizacion.Producto.CVE_PRODUCTO_CRE.AsString) + coCRLF +
                                            'AND SIT_PRO_COMISION = ''AC'' )';
        Objeto.Comision.BuscaWhereString := Objeto.Comision.FilterString;
      end;//end if
      //
    end;//end if
    InterForma1.ValidaExit(edID_ACCESORIO, vlTodoOk, vlMsg, True );
  End;
  //
End;
//
procedure TWCrComProgAc.btACCESORIOClick(Sender: TObject);
begin
  if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_ACREDITADO then
  Begin
    Objeto.Acreditado.ShowAll := False;
    if Objeto.Acreditado.Busca then
       InterForma1.NextTab( edID_ACCESORIO );
    //end if;
  End else if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_AUTORIZACION then
  Begin
    Objeto.Autorizacion.ShowAll := False;
    if Objeto.Autorizacion.Busca then
       InterForma1.NextTab( edID_ACCESORIO );
  End;
  //
end;
//
procedure TWCrComProgAc.ilACCESORIOCapture(Sender: TObject; var Show: Boolean);
begin
//  Show := ( Objeto.Modo = moAppend );
end;
//
procedure TWCrComProgAc.ilACCESORIOEjecuta(Sender: TObject);
begin
  if ( Objeto.Modo = moAppend ) then
  begin
    //
    if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_ACREDITADO then
    Begin
      if Objeto.Acreditado.FindKey([ilACCESORIO.Buffer]) then
         InterForma1.NextTab(edID_ACCESORIO);
      //end if;
    End else if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_AUTORIZACION then
    Begin
      if Objeto.Autorizacion.FindKeyNear( [ ilACCESORIO.Buffer, 'AU' ],  [ 'ID_CONTRATO', 'SIT_LINEA' ] ) then
         InterForma1.NextTab(edID_ACCESORIO);
      //end if;
    End;
    //
  end;
  //
End;
//
procedure TWCrComProgAc.edCVE_COMISIONExit(Sender: TObject);
var  vlMsg     : String;
     vlTodoOk : Boolean;
Begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    vlMsg    := '';
    vlTodoOk := True;
    Objeto.CVE_COMISION.GetFromControl;
    if Objeto.CVE_COMISION.AsString = '' then
    Begin
      vlMsg := 'Favor de indicar la clave de comisión';
      vlTodoOk := False;
    end;
    //
    OnOffComision;
    //
    if ( Objeto.Comision.B_MODIFICA_CAT.AsString <> 'V' ) and
       ( Objeto.CVE_ACCESORIO.AsString  = C_ACCESORIO_ACREDITADO ) and
       ( Objeto.CVE_MONEDA.AsString     = ''   ) then
    begin
      vlMsg    := 'La comisión no acepta modificaciones y para agregar '  +
                  'una comisión al acreditado es necesario indicar '      +
                  'la moneda de la comisión';
      vlTodoOk := False;
    end;//end if
    //
    InterForma1.ValidaExit(edCVE_COMISION, vlTodoOk, vlMsg, True );
  End;
end;
//
procedure TWCrComProgAc.btCOMISIONClick(Sender: TObject);
begin
  Objeto.Comision.ShowAll := False;
  if Objeto.Comision.Busca then
  Begin
     OnOffComision;
     InterForma1.NextTab( edCVE_COMISION );
  End;//end if;
end;
//
procedure TWCrComProgAc.ilCOMISIONCapture(Sender: TObject; var Show: Boolean);
begin
//  Show := ( Objeto.Modo = moAppend );
end;
//
procedure TWCrComProgAc.ilCOMISIONEjecuta(Sender: TObject);
begin
  if ( Objeto.Modo = moAppend ) then
  begin
    //
    if Objeto.Comision.FindKey([ilCOMISION.Buffer]) then
    Begin
       OnOffComision;
       InterForma1.NextTab(edCVE_COMISION);
    End;//end if;
    //
  End;//end if;
end;
//
procedure TWCrComProgAc.edCVE_MONEDAExit(Sender: TObject);
var  vlMsg     : String;
     vlTodoOk : Boolean;
Begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    vlMsg    := '';
    vlTodoOk := True;
    Objeto.CVE_MONEDA.GetFromControl;
    if ( Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_ACREDITADO ) and ( Objeto.CVE_MONEDA.AsString = '' ) then
    begin
      vlMsg    := 'Para agregar una comisión a nivel acreditado es necesario indicar una moneda de la comisión';
      vlTodoOk := False;
    end;
    InterForma1.ValidaExit(edCVE_MONEDA, vlTodoOk, vlMsg, True );
  End;
end;
//
procedure TWCrComProgAc.btMONEDAClick(Sender: TObject);
begin
  Objeto.Moneda.ShowAll := False;
  if Objeto.Moneda.Busca then
     InterForma1.NextTab( edCVE_MONEDA );
  //end if;
end;
//
procedure TWCrComProgAc.ilMONEDAEjecuta(Sender: TObject);
begin
  if Objeto.Moneda.FindKey([ilMONEDA.Buffer]) then
     InterForma1.NextTab(edCVE_MONEDA);
  //end if;
end;
//
procedure TWCrComProgAc.chB_PRORRATEOExit(Sender: TObject);
begin
  InterForma1.ValidaExit( chB_PRORRATEO, True, CNULL, True );
end;
//
procedure TWCrComProgAc.chB_GENERA_FACTURAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(chB_GENERA_FACTURA,True,CNULL,True);
end;

procedure TWCrComProgAc.chB_APLICA_MORAClick(Sender: TObject);
begin
  OnOffMismaMora;
end;


procedure TWCrComProgAc.chB_APLICA_MORAExit(Sender: TObject);
begin
  OnOffMismaMora;
  InterForma1.ValidaExit(chB_APLICA_MORA,True,CNULL,True);
end;

procedure TWCrComProgAc.chB_TASA_MORA_OPEClick(Sender: TObject);
begin
  OnOffTasaMora;
end;

procedure TWCrComProgAc.chB_TASA_MORA_OPEExit(Sender: TObject);
begin
  OnOffTasaMora;
  InterForma1.ValidaExit(chB_TASA_MORA_OPE,True,CNULL,True);
end;

procedure TWCrComProgAc.edCVE_TASA_MORAExit(Sender: TObject);
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

procedure TWCrComProgAc.btCVE_TASA_MORAClick(Sender: TObject);
begin
  Objeto.TasaRefer.ShowAll := True;
  if Objeto.TasaRefer.Busca then
     InterForma1.NextTab( edCVE_TASA_MORA );
  //end if;
end;

procedure TWCrComProgAc.ilTASA_MORAEjecuta(Sender: TObject);
begin
  if Objeto.TasaRefer.FindKey([ilTASA_MORA.Buffer]) then
     InterForma1.NextTab(edCVE_TASA_MORA);
  //end if;
end;

procedure TWCrComProgAc.edOPERADOR_STASA_MExit(Sender: TObject);
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

procedure TWCrComProgAc.edSOBRETASA_MExit(Sender: TObject);
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

procedure TWCrComProgAc.edDESC_UN_TIEMPO_COExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edDESC_UN_TIEMPO_CO, True, CNULL, True );
end;

procedure TWCrComProgAc.btUNIDAD_TIEMPO_COClick(Sender: TObject);
begin
  Objeto.UTiempoCob.ShowAll := True;
  if Objeto.UTiempoCob.Busca then
     InterForma1.NextTab( btUNIDAD_TIEMPO_CO );
  //end if;
end;

procedure TWCrComProgAc.edNUM_UNIDADES_COExit(Sender: TObject);
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

procedure TWCrComProgAc.edDESC_UN_TIEMPO_GRExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edDESC_UN_TIEMPO_GR, True, CNULL, True );
end;

procedure TWCrComProgAc.btUNIDAD_TIEMPO_GRClick(Sender: TObject);
begin
  Objeto.UTiempoGra.ShowAll := True;
  if Objeto.UTiempoGra.Busca then
     InterForma1.NextTab( btUNIDAD_TIEMPO_GR );
  //end if;
end;

procedure TWCrComProgAc.edNUM_UNIDADES_GRExit(Sender: TObject);
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

procedure TWCrComProgAc.rgCVE_TIPO_COMClick(Sender: TObject);
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    OnOffFrecuencia;
  end;
end;

procedure TWCrComProgAc.rgCVE_TIPO_COMExit(Sender: TObject);
begin
  OnOffFrecuencia;
  InterForma1.ValidaExit(rgCVE_TIPO_COM,True,CNULL,True);
end;

procedure TWCrComProgAc.cbCVE_TIPO_APLICAExit(Sender: TObject);
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

procedure TWCrComProgAc.btPlanPagoClick(Sender: TObject);
var CrGeCuCn : TCrGeCuCn;
begin
  CrGeCuCn   := TCrGeCuCn.Create(Self);
  try
    CrGeCuCn.Apli     := Objeto.Apli;
    CrGeCuCn.ParamCre := Objeto.ParamCre;
    //
    CrGeCuCn.ID_ACCESORIO.AsInteger  := Objeto.ID_ACCESORIO.AsInteger;
    CrGeCuCn.FOL_ACCESORIO.AsInteger := Objeto.FOL_ACCESORIO.AsInteger;
    CrGeCuCn.CVE_ACCESORIO.AsString  := Objeto.CVE_ACCESORIO.AsString;
    CrGeCuCn.CVE_COMISION.AsString   := Objeto.CVE_COMISION.AsString;
    //
    CrGeCuCn.Catalogo;
  finally
    CrGeCuCn.Free;
  end;
end;


procedure TWCrComProgAc.btPlanPagoExit(Sender: TObject);
var  vlMsg    : String;
     vlTodoOk : Boolean;
     Cnt      : Integer;
begin
  If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    Cnt := 0;
    GetSQLInt( Objeto.getSQLQuery, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
               'VECES', Cnt, True );
    if Cnt <= 0  then
    Begin
      vlMsg    := 'Favor de indicar y autorizar el plan de pago';
      vlTodoOk := False;
    End;
    InterForma1.ValidaExit( btPlanPago, vlTodoOk, vlMsg, True );
  End;
end;

procedure TWCrComProgAc.edDESC_UN_TIEMPO_CNExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edDESC_UN_TIEMPO_CN, True, CNULL, True );
end;

procedure TWCrComProgAc.btUNIDAD_TIEMPO_CNClick(Sender: TObject);
begin
  Objeto.UTiempoCom.ShowAll := True;
  if Objeto.UTiempoCom.Busca then
     InterForma1.NextTab( btUNIDAD_TIEMPO_CN );
  //end_if;
end;

procedure TWCrComProgAc.btUNIDAD_TIEMPO_CNExit(Sender: TObject);
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
      vlMsg := 'Favor de indicar la unidad de tiempo de la comisión.';
      vlTodoOk := False;
    end;//end if
    InterForma1.ValidaExit( btUNIDAD_TIEMPO_CN, vlTodoOk, vlMsg, True );
  End;
end;


procedure TWCrComProgAc.edNUM_UNIDADES_CNExit(Sender: TObject);
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

procedure TWCrComProgAc.edDIA_PAGO_CNExit(Sender: TObject);
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

procedure TWCrComProgAc.rgCVE_TIPO_COBROClick(Sender: TObject);
begin
  OnOffTipoCobro;
end;


procedure TWCrComProgAc.rgCVE_TIPO_COBROExit(Sender: TObject);
begin
  OnOffTipoCobro;
  InterForma1.ValidaExit(rgCVE_TIPO_COBRO,True,CNULL,True);
end;


procedure TWCrComProgAc.edIMP_COMISIONExit(Sender: TObject);
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

procedure TWCrComProgAc.edPCT_COMISIONExit(Sender: TObject);
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

procedure TWCrComProgAc.edIMP_MINIMOExit(Sender: TObject);
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
{}
procedure TWCrComProgAc.edIMP_MAXIMOExit(Sender: TObject);
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

procedure TWCrComProgAc.cbCVE_EVENTO_COMExit(Sender: TObject);
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
end;

procedure TWCrComProgAc.rgCVE_IMP_CALC_COMExit(Sender: TObject);
begin
  InterForma1.ValidaExit(rgCVE_IMP_CALC_COM,True,CNULL,True);
end;

procedure TWCrComProgAc.rgB_CALC_PROMEDIOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(rgB_CALC_PROMEDIO,True,CNULL,True);
end;

procedure TWCrComProgAc.rgSIT_COMIS_PROGExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_COMIS_PROG,True,CNULL,True);
end;








end.
