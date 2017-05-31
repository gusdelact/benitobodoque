{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}

// Sistema         : Clase de CR_COMIS_PROG
// Fecha de Inicio : 02/06/2003
// Función forma   : Clase de CR_COMIS_PROG
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
// Modificaciones  : LOLS 07 MAR 2006. SE CAMBIA EL TAG DEL COMPONENTE rgSIT_COMIS_PROG DE 18 A 50.
// Modificaciones  : LOLS 28 JUL 2006. CREDITO EN LINEA

Unit IntCrCoProg;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,  Grids, Aligrid, IntSGCtrl, InterEdit,
IntCrCatComi, IntParamCre,IntGenCre,


IntMon,         //Moneda
IntTasIndFin,   //Tasa Refer
IntCrUniTie     //Unidad de tiempo
;
//IntCrCoPrAc

Const
   COL_CVE = 0; //Descripción de Comisión
   COL_COM = 1; //Descripción de Comisión
   COL_PCT = 2; //Porcentaje
   COL_IMP = 3; //Importe
   COL_SIT = 4; //Situación
Type
 TCrCoProg= class;

  TWCrComisProg=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CREDITO : TLabel;
    edID__CREDITO: TEdit;
    lbCVE_COMISION : TLabel;
    rgSIT_COMIS_PROG : TRadioGroup;
    Label16: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edDESC_CREDITO: TEdit;
    edDESC_COMISION: TEdit;
    PnlMsg: TPanel;
    lbPCT_COMISION: TLabel;
    edPCT_COMISION: TInterEdit;
    lbIMP_COMISION: TLabel;
    edIMP_COMISION: TInterEdit;
    ilCOMISION: TInterLinkit;
    edCVE_COMISION: TEdit;
    btCOMISION: TBitBtn;
    chB_GENERA_FACTURA: TCheckBox;
    chB_APLICA_MORA: TCheckBox;
    chB_TASA_MORA_OPE: TCheckBox;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btMONEDA: TBitBtn;
    ilMONEDA: TInterLinkit;
    edDESC_MONEDA: TEdit;
    rgCVE_TIPO_COM: TRadioGroup;
    btPlanPago: TBitBtn;
    rgCVE_TIPO_COBRO: TRadioGroup;
    lbIMP_MINIMO: TLabel;
    edIMP_MINIMO: TInterEdit;
    lbIMP_MAXIMO: TLabel;
    edIMP_MAXIMO: TInterEdit;
    rgCVE_IMP_CALC_COM: TRadioGroup;
    rgB_CALC_PROMEDIO: TRadioGroup;
    edID_CREDITO: TEdit;
    cbB_PRORRATEO: TCheckBox;
    chB_PREMIO: TCheckBox;
    edIMP_PREMIO: TInterEdit;
    Label4: TLabel;
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
    GroupBox1: TGroupBox;
    lbCVE_TASA_MORA: TLabel;
    edCVE_TASA_MORA: TEdit;
    btCVE_TASA_MORA: TBitBtn;
    ilTASA_MORA: TInterLinkit;
    edDESC_TASA_MORA: TEdit;
    edVAL_TASA_MORA: TEdit;
    lbVAL_TASA_MORA: TLabel;
    lbOPERADOR_STASA_M: TLabel;
    edOPERADOR_STASA_M: TEdit;
    lbSOBRETASA_M: TLabel;
    edSOBRETASA_M: TInterEdit;
    GroupBox2: TGroupBox;
    lbUNIDAD_TIEMPO_CO: TLabel;
    edCVE_UN_TIEMPO_CO: TEdit;
    edDESC_UN_TIEMPO_CO: TEdit;
    btUNIDAD_TIEMPO_CO: TBitBtn;
    Label1: TLabel;
    edNUM_UNIDADES_CO: TInterEdit;
    Label3: TLabel;
    edCVE_UN_TIEMPO_GR: TEdit;
    edDESC_UN_TIEMPO_GR: TEdit;
    btUNIDAD_TIEMPO_GR: TBitBtn;
    Label2: TLabel;
    edNUM_UNIDADES_GR: TInterEdit;
    Panel_Eventual: TPanel;
    lbCVE_EVENTO_COM: TLabel;
    cbCVE_EVENTO_COM: TComboBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edPCT_COMISIONExit(Sender: TObject);
    procedure edIMP_COMISIONExit(Sender: TObject);
    procedure rgSIT_COMIS_PROGExit(Sender: TObject);
    procedure btCOMISIONClick(Sender: TObject);
    procedure ilCOMISIONEjecuta(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure btMONEDAClick(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure chB_GENERA_FACTURAExit(Sender: TObject);
    procedure chB_APLICA_MORAClick(Sender: TObject);
    procedure chB_APLICA_MORAExit(Sender: TObject);
    procedure chB_TASA_MORA_OPEClick(Sender: TObject);
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
    procedure btPlanPagoClick(Sender: TObject);
    procedure btPlanPagoExit(Sender: TObject);
    procedure edDESC_UN_TIEMPO_CNExit(Sender: TObject);
    procedure btUNIDAD_TIEMPO_CNExit(Sender: TObject);
    procedure btUNIDAD_TIEMPO_CNClick(Sender: TObject);
    procedure edNUM_UNIDADES_CNExit(Sender: TObject);
    procedure edDIA_PAGO_CNExit(Sender: TObject);
    procedure cbCVE_EVENTO_COMExit(Sender: TObject);
    procedure rgCVE_TIPO_COBROClick(Sender: TObject);
    procedure rgCVE_TIPO_COBROExit(Sender: TObject);
    procedure edIMP_MINIMOExit(Sender: TObject);
    procedure edIMP_MAXIMOExit(Sender: TObject);
    procedure rgCVE_IMP_CALC_COMExit(Sender: TObject);
    procedure rgB_CALC_PROMEDIOExit(Sender: TObject);
    procedure cbB_PRORRATEOExit(Sender: TObject);
    procedure chB_PREMIOClick(Sender: TObject);
    procedure chB_PREMIOExit(Sender: TObject);
    procedure edIMP_PREMIOExit(Sender: TObject);
  private
    // LOLS 26 JUL 2006  CREDITO EN LINEA
    procedure OnOffMismaMora;
    procedure OnOffTasaMora;
    procedure OnOffFrecuencia;
    procedure OnOffUnFrecuencia;
    procedure OnOffTipoCobro;
    // RABA FEB 2012
    procedure OnOffImpPremio;
    procedure ObtieneDatosComision;
    Procedure UnTiempoPeriodicoOtro(vlVisible:Boolean);
    // RABA
    { Private declarations }
  public
    { Public declarations }
    Objeto : TCrCoProg;
  end;
  //
  
 TCrCoProg= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        vgDesCredito: String;
        vgBActualiza: Boolean;   // RABA SEP 2012
        { Public declarations }
        ID_CREDITO               : TInterCampo;
        CVE_COMISION             : TInterCampo;
        SIT_COMIS_PROG           : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        PCT_COMISION             : TInterCampo;
        IMP_COMISION             : TInterCampo;
        //
        // LOLS 29 JUL 2006. CREDITO EN LINEA
        B_APLICA_MORA            : TInterCampo;
        B_GENERA_FACTURA         : TInterCampo;
        B_PRORRATEO              : TInterCampo;
        CVE_IMP_CALC_COM         : TInterCampo;
        B_CALC_PROMEDIO          : TInterCampo;
        CVE_TIPO_COM             : TInterCampo;
        CVE_MONEDA               : TInterCampo;
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
        CVE_TIPO_APLICA          : TInterCampo;
        // RABA FEB 2012
        B_COMIS_PREM             : TInterCampo;
        IMP_COMIS_PREM           : TInterCampo;
        // RABA

        Moneda                   : TMoneda;
        TasaRefer                : TTasIndFin;
        UTiempoCob               : TCrUniTie;  //Unidad de Tiempo Cobro
        UTiempoGra               : TCrUniTie;  //Unidad de Tiempo Gracia
        UTiempoCom               : TCrUniTie;  //Unidad de Tiempo Comision
        //ENDS_LOLS

        VGIDCredito              : Integer;

        //Calses Adicionales
        ParamCre                 : TParamCre;
        Comision                 : TCrCatComi;

        function    getSQLQuery     : String; // LOLS 29 JUL 2006. CREDITO EN LINEA
        function    ObtenImpPlanPag : Double;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;



implementation
Uses IntCrGeCuCn;    //Plan de pago

{$R *.DFM}


constructor TCrCoProg.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Disposición';
      CVE_COMISION :=CreaCampo('CVE_COMISION',ftString,tsNinguno,tsNinguno,True);
                CVE_COMISION.Caption:='Clave de Comisión';
      SIT_COMIS_PROG :=CreaCampo('SIT_COMIS_PROG',ftString,tsNinguno,tsNinguno,True);
        with SIT_COMIS_PROG do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add('AC');
                ComboLista.Add('1'); ComboDatos.Add('CA');
          end;
                SIT_COMIS_PROG.Caption:='Situación de la Comisión';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      PCT_COMISION :=CreaCampo('PCT_COMISION',ftFloat,tsNinguno,tsNinguno,True);
                PCT_COMISION.Caption:='Pct Comision';
      IMP_COMISION :=CreaCampo('IMP_COMISION',ftFloat,tsNinguno,tsNinguno,True);
                IMP_COMISION.Caption:='Imp Comision';

      //<LOLS 26 JUL 2006.CREDITO EN LINEA>
      B_APLICA_MORA :=CreaCampo('B_APLICA_MORA',ftString,tsNinguno,tsNinguno,True);
      B_APLICA_MORA.Caption:='Aplica Mora';
      B_GENERA_FACTURA :=CreaCampo('B_GENERA_FACTURA',ftString,tsNinguno,tsNinguno,True);
      B_GENERA_FACTURA.Caption:='Genera Factura';
      B_PRORRATEO :=CreaCampo('B_PRORRATEO',ftString,tsNinguno,tsNinguno,True);
      B_PRORRATEO.Caption:='Aplica Prorrateo';
      CVE_IMP_CALC_COM :=CreaCampo('CVE_IMP_CALC_COM',ftString,tsNinguno,tsNinguno,True);
      CVE_IMP_CALC_COM.Caption:='Clave de Imp Calc Com';
      B_CALC_PROMEDIO :=CreaCampo('B_CALC_PROMEDIO',ftString,tsNinguno,tsNinguno,True);
      B_CALC_PROMEDIO.Caption:='Calc Promedio';
      CVE_TIPO_COM :=CreaCampo('CVE_TIPO_COM',ftString,tsNinguno,tsNinguno,True);
      CVE_TIPO_COM.Caption:='Clave de Tipo Com';
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
      CVE_MONEDA.Caption:='Clave de Moneda';
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
      UNIDAD_TIEMPO_CN :=CreaCampo('UNIDAD_TIEMPO_CN',ftString,tsNinguno,tsNinguno,True);
      UNIDAD_TIEMPO_CN.Caption:='Unidad Tiempo Cn';
      NUM_UNIDADES_CN :=CreaCampo('NUM_UNIDADES_CN',ftFloat,tsNinguno,tsNinguno,True);
      NUM_UNIDADES_CN.Caption:='Número Unidades Cn';
      DIA_PAGO_CN :=CreaCampo('DIA_PAGO_CN',ftFloat,tsNinguno,tsNinguno,True);
      DIA_PAGO_CN.Caption:='Dia Pago Cn';
      CVE_TIPO_COBRO :=CreaCampo('CVE_TIPO_COBRO',ftString,tsNinguno,tsNinguno,True);
      CVE_TIPO_COBRO.Caption:='Clave de Tipo Cobro';
      IMP_MINIMO :=CreaCampo('IMP_MINIMO',ftFloat,tsNinguno,tsNinguno,True);
      IMP_MINIMO.Caption:='Imp Minimo';
      IMP_MAXIMO :=CreaCampo('IMP_MAXIMO',ftFloat,tsNinguno,tsNinguno,True);
      IMP_MAXIMO.Caption:='Imp Maximo';
      CVE_EVENTO_COM :=CreaCampo('CVE_EVENTO_COM',ftString,tsNinguno,tsNinguno,True);
      CVE_EVENTO_COM.Caption:='Clave de Evento Com';
      CVE_TIPO_APLICA :=CreaCampo('CVE_TIPO_APLICA',ftString,tsNinguno,tsNinguno,True);
      CVE_TIPO_APLICA.Caption:='Clave de Tipo Aplica';
      //
      // RABA FEB 2012
      B_COMIS_PREM :=CreaCampo('B_COMIS_PREM',ftString,tsNinguno,tsNinguno,True);
      B_COMIS_PREM.Caption := 'Aplica PPP';
      IMP_COMIS_PREM :=CreaCampo('IMP_COMIS_PREM',ftFloat,tsNinguno,tsNinguno,True);
      IMP_COMIS_PREM.Caption := 'Importe PPP';
      // RABA



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
      //</LOLS>

      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('CVE_COMISION');

      TableName := 'CR_COMIS_PROG';
      UseQuery := True;
      HelpFile := 'IntCrCoProg.Hlp';
      ShowMenuReporte:=True;

      Comision := TCrCatComi.Create(Self);
      Comision.MasterSource:=Self;
      Comision.FieldByName('CVE_COMISION').MasterField:='CVE_COMISION';

end;

Destructor TCrCoProg.Destroy;
begin
   if Comision <> nil then
      Comision.Free;
   //end if
   //<LOLS 26 JUL 2006.CREDITO EN LINEA>
   if Moneda       <> nil then Moneda.Free;
   if TasaRefer    <> nil then TasaRefer.Free;
   if UTiempoCob   <> nil then UTiempoCob.Free;
   if UTiempoGra   <> nil then UTiempoGra.Free;
   if UTiempoCom   <> nil then UTiempoCom.Free;
   //</LOLS>

    inherited;
end;


function TCrCoProg.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrComisProg;
begin
   W:=TWCrComisProg.Create(Self);
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


Function TCrCoProg.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCoPr.it','F,S');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString);
                               T.Param(1,CVE_COMISION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;


function TCrCoProg.getSQLQuery: String;
begin
  Result := 'SELECT  COUNT(*) VECES'                                        + coCRLF +
            'FROM     CR_COM_CUOTA_ACC'                                     + coCRLF +
            'WHERE    ID_ACCESORIO  = '   + ID_CREDITO.AsString             + coCRLF +
            '  AND    FOL_ACCESORIO = 0 '                                   + coCRLF +
            '  AND    CVE_ACCESORIO = '   + SQLStr( 'CR' )                  + coCRLF +
            '  AND    CVE_COMISION  = '   + SQLStr( CVE_COMISION.AsString)
            ;
end;


(***********************************************FORMA CR_COMIS_PROG********************)
(*                                                                              *)
(*  FORMA DE CR_COMIS_PROG                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_COMIS_PROG********************)
procedure TWCrComisProg.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.CVE_COMISION.Control:=edCVE_COMISION;
      Objeto.SIT_COMIS_PROG.Control:=rgSIT_COMIS_PROG;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;
      Objeto.F_MODIFICA.Control:=edF_MODIFICA;
      Objeto.PCT_COMISION.Control:=edPCT_COMISION;
      Objeto.IMP_COMISION.Control:=edIMP_COMISION;
      //
      // LOLS 29 JUL 2006. CREDITO EN LINEA
      Objeto.CVE_MONEDA.Control       := edCVE_MONEDA;
      Objeto.B_GENERA_FACTURA.Control := chB_GENERA_FACTURA;
      Objeto.B_PRORRATEO.Control      := cbB_PRORRATEO;
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
      Objeto.IMP_MINIMO.Control       := edIMP_MINIMO;
      Objeto.IMP_MAXIMO.Control       := edIMP_MAXIMO;
      Objeto.CVE_EVENTO_COM.Control   := cbCVE_EVENTO_COM;
      Objeto.CVE_IMP_CALC_COM.Control := rgCVE_IMP_CALC_COM;
      Objeto.B_CALC_PROMEDIO.Control  := rgB_CALC_PROMEDIO;

      // RABA FEB 2012
      Objeto.B_COMIS_PREM.Control     := chB_PREMIO;
      Objeto.IMP_COMIS_PREM.Control   := edIMP_PREMIO;
      // RABA

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
      //ENDS_LOLS

      Objeto.Comision.CVE_COMISION.Control := edCVE_COMISION;
      Objeto.Comision.DESC_COMISION.Control := edDESC_COMISION;
      Objeto.Comision.GetParams(Objeto);
      InterForma1.MsgPanel := PnlMsg;
end;

procedure TWCrComisProg.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CREDITO.Control:=nil;
      Objeto.CVE_COMISION.Control:=nil;
      Objeto.SIT_COMIS_PROG.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
      Objeto.PCT_COMISION.Control:=nil;
      Objeto.IMP_COMISION.Control:=nil;
      Objeto.Comision.DESC_COMISION.Control := nil;
      Objeto.Comision.CVE_COMISION.Control := nil;
      //
      // LOLS 29 JUL 2006. CREDITO EN LINEA
      Objeto.CVE_MONEDA.Control       := nil;
      Objeto.B_GENERA_FACTURA.Control := nil;
      Objeto.B_PRORRATEO.Control      := nil;
      Objeto.B_APLICA_MORA.Control    := nil;
      Objeto.B_TASA_MORA_OPE.Control  := nil;
      Objeto.CVE_TASA_MORA.Control    := nil;
      Objeto.OPERADOR_STASA_M.Control := nil;
      Objeto.SOBRETASA_M.Control      := nil;
      Objeto.UNIDAD_TIEMPO_CO.Control := nil;
      Objeto.NUM_UNIDADES_CO.Control  := nil;
      Objeto.UNIDAD_TIEMPO_GR.Control := nil;
      Objeto.NUM_UNIDADES_GR.Control  := nil;
      Objeto.CVE_TIPO_COM.Control     := nil;
      Objeto.CVE_TIPO_APLICA.Control  := nil;
      Objeto.UNIDAD_TIEMPO_CN.Control := nil;
      Objeto.NUM_UNIDADES_CN.Control  := nil;
      Objeto.DIA_PAGO_CN.Control      := nil;
      Objeto.CVE_TIPO_COBRO.Control   := nil;
      Objeto.IMP_MINIMO.Control       := nil;
      Objeto.IMP_MAXIMO.Control       := nil;
      Objeto.CVE_EVENTO_COM.Control   := nil;
      Objeto.CVE_IMP_CALC_COM.Control := nil;
      Objeto.B_CALC_PROMEDIO.Control  := nil;
      
      // RABA FEB 2012
      Objeto.B_COMIS_PREM.Control     := nil;
      Objeto.IMP_COMIS_PREM.Control   := nil;
      // RABA

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
      //ENDS_LOLS
end;

procedure TWCrComisProg.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrComisProg.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
           Objeto.F_ALTA.AsDateTime     := Objeto.Apli.DameFechaEmpresaDia('D000');
           Realizado := True;
           Objeto.vgBActualiza := True;
      end
      else Realizado := False;
end;

procedure TWCrComisProg.InterForma1DespuesShow(Sender: TObject);
begin
   // LOLS 26 JUL 2006. CREDITO EN LINEA ( DATASET NOT IN EDIT OR INSERT MODE );
   // Objeto.ID_CREDITO.AsInteger := Objeto.VGIDCredito;
   // edDESC_CREDITO.Text := Objeto.vgDesCredito;
   edID__CREDITO.Text   := IntToStr( Objeto.VGIDCredito );
   edDESC_CREDITO.Text := Objeto.vgDesCredito;
end;

procedure TWCrComisProg.InterForma1DespuesModificar(Sender: TObject);
begin
  Objeto.CVE_USU_MODIFICA.AsString   := Objeto.Apli.Usuario;
  Objeto.F_MODIFICA.AsDateTime       := Now;
  //
  if edCVE_MONEDA.CanFocus then
     edCVE_MONEDA.SetFocus;

  with Objeto do
  begin
    If Comision.Active then
    begin
       chB_APLICA_MORAClick(Self);
       chB_TASA_MORA_OPEClick(self);
       chB_PREMIOClick(self);
       rgCVE_TIPO_COMClick(self);
       rgCVE_TIPO_COBROClick(self);
       if rgSIT_COMIS_PROG.ItemIndex = 0 then
          edIMP_COMISION.SetFocus;
       if rgSIT_COMIS_PROG.ItemIndex = 1 then
          edPCT_COMISION.SetFocus;
    end;
  end;
  //
(*
   //if Objeto.Comision.B_PORCENTAJE.AsString = 'V' then
   if Objeto.Comision.CVE_TIPO_COBRO.AsString = C_TCOB_COM_PC then
   //</LOLS>
   Begin
      edIMP_COMISION.Enabled := False;
      edIMP_COMISION.Color := clBtnFace;
      //<LOLS 14 JUN 2006.CREDITO EN LINEA>
      //if Objeto.Comision.B_MODIFICA_PCT.AsString = 'V' then
      if Objeto.Comision.B_MODIFICA_CAT.AsString = 'V' then
      //</LOLS>
      Begin
         edPCT_COMISION.Enabled := True;
         edPCT_COMISION.Color := clWindow;
      end
      else
      Begin
         edPCT_COMISION.Enabled := False;
         edPCT_COMISION.Color := clBtnFace;
      end;
   end
   else
   Begin
      edPCT_COMISION.Enabled := False;
      edPCT_COMISION.Color := clBtnFace;
      //<LOLS 14 JUN 2006.CREDITO EN LINEA>
      //if Objeto.Comision.B_MODIFICA_IMP.AsString = 'V' then
      if Objeto.Comision.B_MODIFICA_CAT.AsString = 'V' then
      //</LOLS>
      Begin
         edIMP_COMISION.Enabled := True;
         edIMP_COMISION.Color := clWindow;
      end
      else
      Begin
         edIMP_COMISION.Enabled := False;
         edIMP_COMISION.Color := clBtnFace;
      end;
   end;
*)
end;

procedure TWCrComisProg.edPCT_COMISIONExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
   //Verifica que el dato no sea negativo
      Objeto.PCT_COMISION.GetFromControl;
      if Objeto.PCT_COMISION.AsFloat <= 0 then
      Begin
         VLSalida := False;
         vlMsg := 'La comisión no puede ser menor o igual a cero';
      end;
      InterForma1.ValidaExit(edPCT_COMISION,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrComisProg.edIMP_COMISIONExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
   //Verifica que el dato no sea negativo
      Objeto.IMP_COMISION.GetFromControl;
      if Objeto.IMP_COMISION.AsFloat <= 0 then
      Begin
         VLSalida := False;
         vlMsg := 'La comisión no puede ser menor o igual a cero';
      end;
      InterForma1.ValidaExit(edIMP_COMISION,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrComisProg.rgSIT_COMIS_PROGExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_COMIS_PROG,True,'',True);
end;

procedure TWCrComisProg.btCOMISIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOPROG_CVECOM',True,True) then
   begin
       Objeto.Comision.ShowAll := True;
       if Objeto.Comision.Busca then
          //< EASA4011   14.FEB.2007     Hereda banderas
          Begin
             //procedimiento de banderas con respecto al catalogo de comisiones
             Objeto.B_PRORRATEO.AsString := Objeto.Comision.B_PRORRATEO.AsString;
             if Objeto.B_PRORRATEO.AsString = 'V' then Begin
                cbB_PRORRATEO.Checked := True;
             end
             else if ( Objeto.B_PRORRATEO.AsString = 'F' ) OR (Objeto.B_PRORRATEO.AsString = '')then Begin
                cbB_PRORRATEO.Checked := False;
             end;
             cbB_PRORRATEO.Enabled := cbB_PRORRATEO.Checked;
             ObtieneDatosComision;
             InterForma1.NextTab(edCVE_COMISION);
          end;
          // EASA4011 >
       //end if
   end;
end;

procedure TWCrComisProg.ilCOMISIONEjecuta(Sender: TObject);
begin
   if Objeto.Comision.FindKey([ilCOMISION.Buffer]) then
   begin
      ObtieneDatosComision;
      InterForma1.NextTab(edCVE_COMISION);
   end;
   //end if
end;

procedure TWCrComisProg.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.ID_CREDITO.AsInteger := Objeto.VGIDCredito;
   edDESC_CREDITO.Text         := Objeto.vgDesCredito;
   rgSIT_COMIS_PROG.ItemIndex  := 0;
end;

//<LOLS 29 JUL 2006. CREDITO EN LINEA>
procedure TWCrComisProg.OnOffTasaMora;
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
       // RABA FEB 2012
       edCVE_TASA_MORA.Text    := '';
       edSOBRETASA_M.Text      := '';
       edOPERADOR_STASA_M.Text := '';

    End;
  End;
end;
//
procedure TWCrComisProg.OnOffMismaMora;
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
procedure TWCrComisProg.OnOffFrecuencia;
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
      btPlanPago.Visible      := False;

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
      btPlanPago.Visible      := False;

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
      btPlanPago.Visible      := True;

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
// RABA FEB 2012    SE CAMBIA TOTALMENTE EL CODIGO PARA LOS CONTROLES
{    vlEnabled := ( Objeto.CVE_TIPO_COM.AsString = C_TCOM_PE );
    //
    Panel_Periodica.Visible := vlEnabled;
    Panel_Eventual.Visible := not(vlEnabled);

    cbCVE_TIPO_APLICA.Enabled  := vlEnabled;
    btUNIDAD_TIEMPO_CN.Enabled := False;
    edNUM_UNIDADES_CN.Enabled  := False;
    edDIA_PAGO_CN.Enabled      := False;
    UnTiempoPeriodicoOtro(False);
//    btPlanPago.Enabled         := ( Objeto.CVE_TIPO_COM.AsString = C_TCOM_PP );
    btPlanPago.Visible         := ( Objeto.CVE_TIPO_COM.AsString = C_TCOM_PP );

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
    rgCVE_TIPO_COBROClick(self);
}
end;
//
procedure TWCrComisProg.OnOffUnFrecuencia;
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
end;
//
procedure TWCrComisProg.OnOffTipoCobro;
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
end;
//
procedure TWCrComisProg.InterForma1AntesModificar(Sender: TObject; var Realizado: Boolean);
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




procedure TWCrComisProg.edCVE_MONEDAExit(Sender: TObject);
var  vlMsg     : String;
     vlTodoOk : Boolean;
Begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    vlMsg    := '';
    vlTodoOk := True;
    InterForma1.ValidaExit(edCVE_MONEDA, vlTodoOk, vlMsg, True );
  End;
end;

procedure TWCrComisProg.btMONEDAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOPROG_MONED',True,True) then
   begin
      Objeto.Moneda.ShowAll := False;
      if Objeto.Moneda.Busca then
         InterForma1.NextTab( edCVE_MONEDA );
      //end if;
   end;
end;

procedure TWCrComisProg.ilMONEDAEjecuta(Sender: TObject);
begin
  if Objeto.Moneda.FindKey([ilMONEDA.Buffer]) then
     InterForma1.NextTab(edCVE_MONEDA);
  //end if;
end;

procedure TWCrComisProg.chB_GENERA_FACTURAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(chB_GENERA_FACTURA,True,CNULL,True);
end;

procedure TWCrComisProg.cbB_PRORRATEOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(cbB_PRORRATEO, True, CNULL, True);
end;


procedure TWCrComisProg.chB_APLICA_MORAClick(Sender: TObject);
begin
  OnOffMismaMora;
end;

procedure TWCrComisProg.chB_APLICA_MORAExit(Sender: TObject);
begin
  OnOffMismaMora;
  InterForma1.ValidaExit(chB_APLICA_MORA,True,CNULL,True);
end;

procedure TWCrComisProg.chB_TASA_MORA_OPEClick(Sender: TObject);
begin
  OnOffTasaMora;
end;

procedure TWCrComisProg.chB_TASA_MORA_OPEExit(Sender: TObject);
begin
  OnOffTasaMora;
  InterForma1.ValidaExit(chB_TASA_MORA_OPE,True,CNULL,True);
end;

procedure TWCrComisProg.edCVE_TASA_MORAExit(Sender: TObject);
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

procedure TWCrComisProg.btCVE_TASA_MORAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOPROG_TSINMR',True,True) then
   begin
      Objeto.TasaRefer.ShowAll := True;
      if Objeto.TasaRefer.Busca then
         InterForma1.NextTab( edCVE_TASA_MORA );
      //end if;
   end;
end;

procedure TWCrComisProg.ilTASA_MORAEjecuta(Sender: TObject);
begin
  if Objeto.TasaRefer.FindKey([ilTASA_MORA.Buffer]) then
     InterForma1.NextTab(edCVE_TASA_MORA);
  //end if;
end;

procedure TWCrComisProg.edOPERADOR_STASA_MExit(Sender: TObject);
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

procedure TWCrComisProg.edSOBRETASA_MExit(Sender: TObject);
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

procedure TWCrComisProg.edDESC_UN_TIEMPO_COExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edDESC_UN_TIEMPO_CO, True, CNULL, True );
end;

procedure TWCrComisProg.btUNIDAD_TIEMPO_COClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOPROG_UTMPC',True,True) then
   begin
      Objeto.UTiempoCob.ShowAll := True;
      if Objeto.UTiempoCob.Busca then
         InterForma1.NextTab( btUNIDAD_TIEMPO_CO );
      //end if;
   end;
end;

procedure TWCrComisProg.edNUM_UNIDADES_COExit(Sender: TObject);
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

procedure TWCrComisProg.edDESC_UN_TIEMPO_GRExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edDESC_UN_TIEMPO_GR, True, CNULL, True );
end;

procedure TWCrComisProg.btUNIDAD_TIEMPO_GRClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOPROG_UTMPG',True,True) then
   begin
      Objeto.UTiempoGra.ShowAll := True;
      if Objeto.UTiempoGra.Busca then
         InterForma1.NextTab( btUNIDAD_TIEMPO_GR );
      //end if;
   end;
end;

procedure TWCrComisProg.edNUM_UNIDADES_GRExit(Sender: TObject);
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

procedure TWCrComisProg.rgCVE_TIPO_COMClick(Sender: TObject);
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin
    OnOffFrecuencia;
  end;
end;

procedure TWCrComisProg.rgCVE_TIPO_COMExit(Sender: TObject);
begin
//  OnOffFrecuencia;
  InterForma1.ValidaExit(rgCVE_TIPO_COM,True,CNULL,True);
end;

procedure TWCrComisProg.cbCVE_TIPO_APLICAExit(Sender: TObject);
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

procedure TWCrComisProg.btPlanPagoClick(Sender: TObject);
var
  CrGeCuCn : TCrGeCuCn;
begin
   if Objeto.ValidaAccesoEsp('TCRCOPROG_PLNPG',True,True) then
   begin
      If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
        Objeto.IMP_COMISION.GetFromControl;
        If Objeto.IMP_COMISION.AsFloat > 0 then
        begin
          CrGeCuCn   := TCrGeCuCn.Create(Self);
          try
            CrGeCuCn.Apli     := Objeto.Apli;
            CrGeCuCn.ParamCre := Objeto.ParamCre;
            //
            CrGeCuCn.ID_ACCESORIO.AsInteger  := Objeto.ID_CREDITO.AsInteger;
            CrGeCuCn.FOL_ACCESORIO.AsInteger := 0;
            CrGeCuCn.CVE_ACCESORIO.AsString  := 'CR';
            CrGeCuCn.CVE_COMISION.AsString   := Objeto.CVE_COMISION.AsString;
            CrGeCuCn.vgImporteCom            := Objeto.IMP_COMISION.AsFloat;
            //
            CrGeCuCn.Catalogo;
          finally
            CrGeCuCn.Free;
          end;
        end
        else
        begin
          InterForma1.ValidaExit( btPlanPago, False, 'Favor de indicar el importe de la comisión', True );
        end;
      end;
   end;
end;

procedure TWCrComisProg.btPlanPagoExit(Sender: TObject);
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
    // RABA FEB 2012 PPP
    if vlTodoOk then
    begin
      Objeto.IMP_COMISION.AsFloat := Objeto.ObtenImpPlanPag;
    end;
    // FIN RABA
    InterForma1.ValidaExit( btPlanPago, vlTodoOk, vlMsg, True );
  End;
end;

procedure TWCrComisProg.edDESC_UN_TIEMPO_CNExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edDESC_UN_TIEMPO_CN, True, CNULL, True );
end;

procedure TWCrComisProg.btUNIDAD_TIEMPO_CNExit(Sender: TObject);
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

procedure TWCrComisProg.btUNIDAD_TIEMPO_CNClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOPROG_UNTM',True,True) then
   begin
      Objeto.UTiempoCom.ShowAll := True;
      if Objeto.UTiempoCom.Busca then
         InterForma1.NextTab( btUNIDAD_TIEMPO_CN );
      //end_if;
   end;
end;

procedure TWCrComisProg.edNUM_UNIDADES_CNExit(Sender: TObject);
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

procedure TWCrComisProg.edDIA_PAGO_CNExit(Sender: TObject);
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

procedure TWCrComisProg.cbCVE_EVENTO_COMExit(Sender: TObject);
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

procedure TWCrComisProg.rgCVE_TIPO_COBROClick(Sender: TObject);
begin
  OnOffTipoCobro;
end;

procedure TWCrComisProg.rgCVE_TIPO_COBROExit(Sender: TObject);
begin
  OnOffTipoCobro;
  InterForma1.ValidaExit(rgCVE_TIPO_COBRO,True,CNULL,True);
end;

procedure TWCrComisProg.edIMP_MINIMOExit(Sender: TObject);
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

procedure TWCrComisProg.edIMP_MAXIMOExit(Sender: TObject);
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

procedure TWCrComisProg.rgCVE_IMP_CALC_COMExit(Sender: TObject);
begin
  InterForma1.ValidaExit(rgCVE_IMP_CALC_COM,True,CNULL,True);
end;

procedure TWCrComisProg.rgB_CALC_PROMEDIOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(rgB_CALC_PROMEDIO,True,CNULL,True);
end;
//</LOLS>

procedure TWCrComisProg.OnOffImpPremio;
var vlEnabled : Boolean;
    vlsql : String;
    vlQry : TQuery;
begin
  if ( (Objeto.Modo = moEdit) or (Objeto.Modo=moAppend) ) then
  begin
    Objeto.B_COMIS_PREM.GetFromControl;

    If Objeto.B_COMIS_PREM.AsString = 'V' then
    begin
      vlsql:=' SELECT B_COMIS_PREM FROM CR_CAT_COMISION '+
               ' WHERE CVE_COMISION = ' + SQLStr(Objeto.CVE_COMISION.AsString);

      vlQry := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
        try
           if vlQry <> nil then
           Begin
              If (vlQry.FieldByName('B_COMIS_PREM').AsString <> 'V') Then
              Begin
                 ShowMessage('Esta Comisión NO aplica PPO');
                 Objeto.B_COMIS_PREM.AsString := 'F';
              end;
           end;
        finally
           if vlQry <> nil then vlQry.free;
        end;
    end;

    vlEnabled := ( Objeto.B_COMIS_PREM.AsString = 'V' );
    edIMP_PREMIO.Enabled := vlEnabled;
    //
    if vlEnabled then
    Begin
       edIMP_PREMIO.Color := clWindow;
    End Else
    Begin
       edIMP_PREMIO.Color := clBtnFace;
       edIMP_PREMIO.Text    := '';
    End;
  End;
end;

procedure TWCrComisProg.chB_PREMIOClick(Sender: TObject);
begin
  OnOffImpPremio;
end;

procedure TWCrComisProg.ObtieneDatosComision;
begin
  with Objeto do
  begin
    If Comision.Active then
    begin
       CVE_MONEDA.AsInteger := Comision.CVE_MONEDA.AsInteger;
       B_GENERA_FACTURA.AsString := Comision.B_GENERA_FACTURA.AsString;
       B_PRORRATEO.AsString := Comision.B_PRORRATEO.AsString;
       B_APLICA_MORA.AsString := Comision.B_APLICA_MORA.AsString;
       chB_APLICA_MORAClick(Self);
       B_TASA_MORA_OPE.AsString := Comision.B_TASA_MORA_OPE.AsString;
       chB_TASA_MORA_OPEClick(self);
       B_COMIS_PREM.AsString := Comision.B_COMIS_PREM.AsString;
       chB_PREMIOClick(self);
       B_CALC_PROMEDIO.AsString := Comision.B_CALC_PROMEDIO.AsString;
       CVE_EVENTO_COM.AsString := Comision.CVE_EVENTO_COM.AsString;
       CVE_IMP_CALC_COM.AsString := Comision.CVE_IMP_CALC_COM.AsString;
       CVE_TIPO_COM.AsString := Comision.CVE_TIPO_COM.AsString;
       rgCVE_TIPO_COMClick(self);
       CVE_TIPO_COBRO.AsString := Comision.CVE_TIPO_COBRO.AsString;
       rgCVE_TIPO_COBROClick(self);
       CVE_TIPO_APLICA.AsString := Comision.CVE_TIPO_APLICA.AsString;
       CVE_TASA_MORA.AsString := Comision.CVE_TASA_MORA.AsString;
       DIA_PAGO_CN.AsString := Comision.DIA_PAGO_CN.AsString;
       IMP_MAXIMO.AsFloat := Comision.IMP_MAXIMO.AsFloat;
       IMP_MINIMO.AsFloat := Comision.IMP_MINIMO.AsFloat;
       NUM_UNIDADES_CN.AsString := Comision.NUM_UNIDADES_CN.AsString;
       NUM_UNIDADES_CO.AsString := Comision.NUM_UNIDADES_CO.AsString;
       NUM_UNIDADES_GR.AsString := Comision.NUM_UNIDADES_GR.AsString;
       OPERADOR_STASA_M.AsString := Comision.OPERADOR_STASA_M.AsString;
       PCT_COMISION.AsString := Comision.PCT_COMISION.AsString;
       SOBRETASA_M.AsString := Comision.SOBRETASA_M.AsString;
       UNIDAD_TIEMPO_CN.AsString := Comision.UNIDAD_TIEMPO_CN.AsString;
       UNIDAD_TIEMPO_CO.AsString := Comision.UNIDAD_TIEMPO_CO.AsString;
       UNIDAD_TIEMPO_GR.AsString := Comision.UNIDAD_TIEMPO_GR.AsString;

{
       Moneda.FindKey([CVE_MONEDA]);
       TasaRefer.FindKey([]);
      Objeto.TasaRefer.DESC_TASA_INDIC.Control   := edDESC_TASA_MORA;
      Objeto.UTiempoCob.CVE_UNIDAD_TIEMP.Control := edCVE_UN_TIEMPO_CO;
      Objeto.UTiempoCob.DESCRIPCION.Control      := edDESC_UN_TIEMPO_CO;
      Objeto.UTiempoGra.CVE_UNIDAD_TIEMP.Control := edCVE_UN_TIEMPO_GR;
      Objeto.UTiempoGra.DESCRIPCION.Control      := edDESC_UN_TIEMPO_GR;
      Objeto.UTiempoCom.CVE_UNIDAD_TIEMP.Control := edCVE_UN_TIEMPO_CN;
      Objeto.UTiempoCom.DESCRIPCION.Control      := edDESC_UN_TIEMPO_CN;
}

    end;
  end;
end;

procedure TWCrComisProg.chB_PREMIOExit(Sender: TObject);
begin
  OnOffImpPremio;
  InterForma1.ValidaExit(chB_PREMIO,True,CNULL,True);
end;

procedure TWCrComisProg.UnTiempoPeriodicoOtro(vlVisible: Boolean);
begin
  lbUNIDAD_TIEMPO_CN.Visible := vlVisible;
  edDESC_UN_TIEMPO_CN.Visible := vlVisible;
  btUNIDAD_TIEMPO_CN.Visible := vlVisible;
  lbNUM_UNIDADES_CN.Visible := vlVisible;
  edNUM_UNIDADES_CN.Visible := vlVisible;
  lbDIA_PAGO_CN.Visible := vlVisible;
  edDIA_PAGO_CN.Visible := vlVisible;
end;

procedure TWCrComisProg.edIMP_PREMIOExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
   //Verifica que el dato no sea negativo
      Objeto.IMP_COMISION.GetFromControl;
      Objeto.IMP_COMIS_PREM.GetFromControl;
      if Objeto.IMP_COMIS_PREM.AsFloat <= 0 then
      Begin
         VLSalida := False;
         vlMsg := 'El importe de PPO no puede ser menor o igual a cero.';
      end;
      if Objeto.IMP_COMIS_PREM.AsFloat > Objeto.IMP_COMISION.AsFloat  then
      Begin
         VLSalida := False;
         vlMsg := 'El importe de PPO no puede ser mayor al importe de comisión a cobrar.';
      end;
      InterForma1.ValidaExit(edIMP_PREMIO,vlSalida,vlMsg,True);
   end;
end;

function TCrCoProg.ObtenImpPlanPag: Double;
var
  sSql : String;
  qQry : TQuery;
  vlImporte : Real;
begin
  Result := 0;

  sSql := 'SELECT  SUM(IMP_CUOTA) IMPORTE'                                + coCRLF +
          'FROM     CR_COM_CUOTA_ACC'                                     + coCRLF +
          'WHERE    ID_ACCESORIO  = '   + ID_CREDITO.AsString             + coCRLF +
          '  AND    FOL_ACCESORIO = 0 '                                   + coCRLF +
          '  AND    CVE_ACCESORIO = '   + SQLStr( 'CR' )                  + coCRLF +
          '  AND    CVE_COMISION  = '   + SQLStr( CVE_COMISION.AsString);

  GetSQLFloat( sSql, Apli.DataBaseName, Apli.SessionName,
               'IMPORTE', vlImporte, True );

  Result := vlImporte;

end;

end.
