// Sistema         : Clase de CR_CREDITO_MARCO
// Fecha de Inicio : 02/08/2006
// Función forma   : Clase de CR_CREDITO_MARCO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Sergio Eduardo Lopez Lopez
// Comentarios     :
Unit IntCrCreMar;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

IntGenCre,            // Unidad generica
IntParamCre,          // Parametros de crédito
IntCrLiqDis,          // Tipo de Liquidacion
IntMPers,             // Promotor Administrador
IntCrCalcInt,         // Calculo de Interes
IntCrUniTie,          // Unidad de Tiempo
IntCrAmortiz,         // Tipo de Amortización
IntMFiraOpe,          // Operativa
IntCrPagInt, InterEdit           // Pago de Interes
;

Type
  TCrCreMar= class;

  TWCrCreditoMarco=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_CREDITO_MARCO : TLabel; 
    edID_CREDITO_MARCO : TEdit;
    lbID_PROM_ADM : TLabel;
    edID_PROM_ADM : TEdit;
    lbCVE_LIQUIDACION : TLabel; 
    edCVE_LIQUIDACION : TEdit; 
    chB_APLICA_COM : TCheckBox;
    lbPCT_COMISION : TLabel;
    lbCVE_OPERATIVA : TLabel; 
    edCVE_OPERATIVA : TEdit;
    lbTX_COMENTARIOS : TLabel; 
    edTX_COMENTARIOS : TEdit;
    lbCVE_CALCULO : TLabel; 
    edCVE_CALCULO : TEdit;
    lbFACT_MORAS : TLabel;
    lbUNIDAD_TIEMPO_RE : TLabel;
    edDESC_UNIDAD_TIEMPO_RE: TEdit;
    lbNUM_UNIDADES_RE : TLabel; 
    edNUM_UNIDADES_RE : TEdit;
    lbDIA_REVISION : TLabel; 
    edDIA_REVISION : TEdit;
    lbCVE_AMORTIZACION : TLabel; 
    edCVE_AMORTIZACION : TEdit;
    lbUNIDAD_TIEMPO_CP : TLabel;
    edDESC_UNIDAD_TIEMPO_CP: TEdit;
    lbNUM_UNIDADES_CP : TLabel; 
    edNUM_UNIDADES_CP : TEdit;
    lbDIA_PAGO_CAP : TLabel; 
    edDIA_PAGO_CAP : TEdit;
    lbCVE_PAG_INTERES : TLabel; 
    edCVE_PAG_INTERES : TEdit;
    lbUNIDAD_TIEMPO_IN : TLabel;
    edDESC_UNIDAD_TIEMPO_IN: TEdit;
    lbNUM_UNIDADES_IN : TLabel; 
    edNUM_UNIDADES_IN : TEdit;
    lbDIA_PAGO_INT : TLabel; 
    edDIA_PAGO_INT : TEdit;
    btCVE_LIQUIDACION: TBitBtn;
    btID_PROM_ADM: TBitBtn;
    edDESC_LIQUIDACION: TEdit;
    edDESC_PROM_ADM: TEdit;
    btCVE_OPERATIVA: TBitBtn;
    btCVE_CALCULO: TBitBtn;
    edDESC_CALCULO: TEdit;
    Bevel2: TBevel;
    Bevel1: TBevel;
    btUNIDAD_TIEMPO_RE: TBitBtn;
    btCVE_AMORTIZACION: TBitBtn;
    edDESC_AMORTIZACION: TEdit;
    btUNIDAD_TIEMPO_CP: TBitBtn;
    btCVE_PAG_INTERES: TBitBtn;
    edDESC_PAG_INTERES: TEdit;
    btUNIDAD_TIEMPO_IN: TBitBtn;
    btComisADD: TBitBtn;
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
    edUNIDAD_TIEMPO_RE: TEdit;
    edUNIDAD_TIEMPO_CP: TEdit;
    edUNIDAD_TIEMPO_IN: TEdit;
    ilLIQUIDACION: TInterLinkit;
    ilPROM_ADM: TInterLinkit;
    ilCALCULO: TInterLinkit;
    ilAMORTIZACION: TInterLinkit;
    ilPAG_INTERES: TInterLinkit;
    lbUSUA_ALTA: TLabel;
    edCVE_USU_ALTA: TEdit;
    edF_ALTA: TEdit;
    lbF_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edCVE_USU_MODIFICA: TEdit;
    edF_MODIFICA: TEdit;
    lbF_MODIF: TLabel;
    rgSIT_CREDITO_MARCO: TRadioGroup;
    edPCT_COMISION: TInterEdit;
    edFACT_MORAS: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure edCVE_LIQUIDACIONExit(Sender: TObject);
    procedure btCVE_LIQUIDACIONClick(Sender: TObject);
    procedure ilLIQUIDACIONEjecuta(Sender: TObject);
    procedure edID_PROM_ADMExit(Sender: TObject);
    procedure btID_PROM_ADMClick(Sender: TObject);
    procedure chB_APLICA_COMExit(Sender: TObject);
    procedure chB_APLICA_COMClick(Sender: TObject);
    procedure edPCT_COMISIONExit(Sender: TObject);
    procedure btCVE_OPERATIVAClick(Sender: TObject);
    procedure edCVE_OPERATIVAExit(Sender: TObject);
    procedure edCVE_CALCULOExit(Sender: TObject);
    procedure btCVE_CALCULOClick(Sender: TObject);
    procedure edFACT_MORASExit(Sender: TObject);
    procedure edDESC_UNIDAD_TIEMPO_REExit(Sender: TObject);
    procedure btUNIDAD_TIEMPO_REClick(Sender: TObject);
    procedure edNUM_UNIDADES_REExit(Sender: TObject);
    procedure edDIA_REVISIONExit(Sender: TObject);
    procedure edCVE_AMORTIZACIONExit(Sender: TObject);
    procedure btCVE_AMORTIZACIONClick(Sender: TObject);
    procedure ilAMORTIZACIONEjecuta(Sender: TObject);
    procedure ilPROM_ADMEjecuta(Sender: TObject);
    procedure ilCALCULOEjecuta(Sender: TObject);
    procedure edDESC_UNIDAD_TIEMPO_CPExit(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure edNUM_UNIDADES_CPExit(Sender: TObject);
    procedure edDIA_PAGO_CAPExit(Sender: TObject);
    procedure edCVE_PAG_INTERESExit(Sender: TObject);
    procedure btCVE_PAG_INTERESClick(Sender: TObject);
    procedure ilPAG_INTERESEjecuta(Sender: TObject);
    procedure btUNIDAD_TIEMPO_CPClick(Sender: TObject);
    procedure edDESC_UNIDAD_TIEMPO_INExit(Sender: TObject);
    procedure btUNIDAD_TIEMPO_INClick(Sender: TObject);
    procedure edNUM_UNIDADES_INExit(Sender: TObject);
    procedure edDIA_PAGO_INTExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edTX_COMENTARIOSExit(Sender: TObject);
    procedure chB_APLICA_COMEnter(Sender: TObject);
    procedure rgSIT_CREDITO_MARCOExit(Sender: TObject);
    procedure btComisADDClick(Sender: TObject);
  private
    procedure OnOffPctComision;
    procedure OnOffTasaRevision;
    procedure OnOffTipoAmortiza;
    procedure OnOffTipoInteres;
    { Private declarations }
  public
    { Public declarations }
    Objeto : TCrCreMar;
  end;
  //
  TCrCreMar= class(TInterFrame)
  private
        function    stpInsDispMarco : Boolean;
  protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
        { Public declarations }
        ID_CREDITO_MARCO         : TInterCampo;
        ID_PROM_ADM              : TInterCampo;
        CVE_LIQUIDACION          : TInterCampo;
        B_APLICA_COM             : TInterCampo;
        PCT_COMISION             : TInterCampo;
        CVE_OPERATIVA            : TInterCampo;
        TX_COMENTARIOS           : TInterCampo;
        CVE_CALCULO              : TInterCampo;
        FACT_MORAS               : TInterCampo;
        UNIDAD_TIEMPO_RE         : TInterCampo;
        NUM_UNIDADES_RE          : TInterCampo;
        DIA_REVISION             : TInterCampo;
        CVE_AMORTIZACION         : TInterCampo;
        UNIDAD_TIEMPO_CP         : TInterCampo;
        NUM_UNIDADES_CP          : TInterCampo;
        DIA_PAGO_CAP             : TInterCampo;
        CVE_PAG_INTERES          : TInterCampo;
        UNIDAD_TIEMPO_IN         : TInterCampo;
        NUM_UNIDADES_IN          : TInterCampo;
        DIA_PAGO_INT             : TInterCampo;
        SIT_CREDITO_MARCO        : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        //
        ParamCre                 : TParamCre;
        CrLiqDis                 : TCrLiqDis;
        MPersona                 : TMPersona;
        MFiraOpe                 : TMFiraOpe;
        CrCalcInt                : TCrCalcInt;
        UTiempoTasa              : TCrUniTie;
        CrAmortiz                : TCrAmortiz;
        UTiempoCap               : TCrUniTie;
        CrPagInt                 : TCrPagInt;
        UTiempoInt               : TCrUniTie;
        //
        Function    InternalPost : Boolean; override;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override; 
  published
  end;



implementation
uses IntCrComMar, IntMensaje;


{$R *.DFM}


constructor TCrCreMar.Create( AOwner : TComponent ); 
begin
      Inherited;
      ID_CREDITO_MARCO :=CreaCampo('ID_CREDITO_MARCO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO_MARCO.Caption:='Número de Credito Marco';
      ID_PROM_ADM :=CreaCampo('ID_PROM_ADM',ftFloat,tsNinguno,tsNinguno,True);
                ID_PROM_ADM.Caption:='Número de Prom Adm';
      CVE_LIQUIDACION :=CreaCampo('CVE_LIQUIDACION',ftString,tsNinguno,tsNinguno,True);
                CVE_LIQUIDACION.Caption:='Clave de Liquidacion';
      B_APLICA_COM :=CreaCampo('B_APLICA_COM',ftString,tsNinguno,tsNinguno,True);
                B_APLICA_COM.Caption:='Aplica Com';
      PCT_COMISION :=CreaCampo('PCT_COMISION',ftFloat,tsNinguno,tsNinguno,True);
                PCT_COMISION.Caption:='Pct Comision';
      CVE_OPERATIVA :=CreaCampo('CVE_OPERATIVA',ftString,tsNinguno,tsNinguno,True);
                CVE_OPERATIVA.Caption:='Clave de Operativa';
      TX_COMENTARIOS :=CreaCampo('TX_COMENTARIOS',ftString,tsNinguno,tsNinguno,True);
                TX_COMENTARIOS.Caption:='Comentarios';
      CVE_CALCULO :=CreaCampo('CVE_CALCULO',ftString,tsNinguno,tsNinguno,True);
                CVE_CALCULO.Caption:='Clave de Calculo';
      FACT_MORAS :=CreaCampo('FACT_MORAS',ftFloat,tsNinguno,tsNinguno,True);
                FACT_MORAS.Caption:='Fact Moras';
      UNIDAD_TIEMPO_RE :=CreaCampo('UNIDAD_TIEMPO_RE',ftString,tsNinguno,tsNinguno,True);
                UNIDAD_TIEMPO_RE.Caption:='Unidad Tiempo Re';
      NUM_UNIDADES_RE :=CreaCampo('NUM_UNIDADES_RE',ftFloat,tsNinguno,tsNinguno,True);
                NUM_UNIDADES_RE.Caption:='Número Unidades Re';
      DIA_REVISION :=CreaCampo('DIA_REVISION',ftFloat,tsNinguno,tsNinguno,True);
                DIA_REVISION.Caption:='Dia Revision';
      CVE_AMORTIZACION :=CreaCampo('CVE_AMORTIZACION',ftString,tsNinguno,tsNinguno,True);
                CVE_AMORTIZACION.Caption:='Clave de Amortizacion';
      UNIDAD_TIEMPO_CP :=CreaCampo('UNIDAD_TIEMPO_CP',ftString,tsNinguno,tsNinguno,True);
                UNIDAD_TIEMPO_CP.Caption:='Unidad Tiempo Cp';
      NUM_UNIDADES_CP :=CreaCampo('NUM_UNIDADES_CP',ftFloat,tsNinguno,tsNinguno,True);
                NUM_UNIDADES_CP.Caption:='Número Unidades Cp';
      DIA_PAGO_CAP :=CreaCampo('DIA_PAGO_CAP',ftFloat,tsNinguno,tsNinguno,True);
                DIA_PAGO_CAP.Caption:='Dia Pago Cap';
      CVE_PAG_INTERES :=CreaCampo('CVE_PAG_INTERES',ftString,tsNinguno,tsNinguno,True);
                CVE_PAG_INTERES.Caption:='Clave de Pag Interes';
      UNIDAD_TIEMPO_IN :=CreaCampo('UNIDAD_TIEMPO_IN',ftString,tsNinguno,tsNinguno,True);
                UNIDAD_TIEMPO_IN.Caption:='Unidad Tiempo In';
      NUM_UNIDADES_IN :=CreaCampo('NUM_UNIDADES_IN',ftFloat,tsNinguno,tsNinguno,True);
                NUM_UNIDADES_IN.Caption:='Número Unidades In';
      DIA_PAGO_INT :=CreaCampo('DIA_PAGO_INT',ftFloat,tsNinguno,tsNinguno,True);
                DIA_PAGO_INT.Caption:='Dia Pago Int';
      SIT_CREDITO_MARCO :=CreaCampo('SIT_CREDITO_MARCO',ftString,tsNinguno,tsNinguno,True);
                SIT_CREDITO_MARCO.Caption:='Sit. Cred. Marco';
      With SIT_CREDITO_MARCO do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0');          ComboDatos.Add(CSIT_AC);
            ComboLista.Add('1');          ComboDatos.Add(CSIT_CA);
      end;
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption := 'Fecha de alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption := 'Cve Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption := 'F Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption := 'Cve Usu Modifica';
      //
      CrLiqDis  := TCrLiqDis.Create(Self);
      CrLiqDis.MasterSource := Self;
      CrLiqDis.FieldByName('CVE_LIQUIDACION').MasterField      := 'CVE_LIQUIDACION';
      //
      MPersona  := TMPersona.Create(Self);
      MPersona.FilterBy := fbTMPersonaEmpleado;
      MPersona.MasterSource := Self;
      MPersona.FieldByName('ID_PERSONA').MasterField           := 'ID_PROM_ADM';
      //
      MFiraOpe  := TMFiraOpe.Create(Self);
      MFiraOpe.MasterSource := Self;
      MFiraOpe.FieldByName('CVE_OPERATIVA').MasterField        := 'CVE_OPERATIVA';
      //
      CrCalcInt := TCrCalcInt.Create(Self);
      CrCalcInt.MasterSource := Self;
      CrCalcInt.FieldByName('CVE_CALCULO_INT').MasterField     := 'CVE_CALCULO';
      //
      UTiempoTasa := TCrUniTie.Create(Self);
      UTiempoTasa.MasterSource := Self;
      UTiempoTasa.FieldByName('CVE_UNIDAD_TIEMP').MasterField  := 'UNIDAD_TIEMPO_RE';
      //
      CrAmortiz   := TCrAmortiz.Create(Self);
      CrAmortiz.MasterSource := Self;
      CrAmortiz.FieldByName('CVE_AMORTIZACION').MasterField    := 'CVE_AMORTIZACION';
      //
      UTiempoCap  := TCrUniTie.Create(Self);
      UTiempoCap.MasterSource := Self;
      UTiempoCap.FieldByName('CVE_UNIDAD_TIEMP').MasterField   := 'UNIDAD_TIEMPO_CP';
      //
      CrPagInt    := TCrPagInt.Create(Self);
      CrPagInt.MasterSource := Self;
      CrPagInt.FieldByName('CVE_PAG_INTERES').MasterField      := 'CVE_PAG_INTERES';
      //
      UTiempoInt  := TCrUniTie.Create(Self);
      UTiempoInt.MasterSource := Self;
      UTiempoInt.FieldByName('CVE_UNIDAD_TIEMP').MasterField   := 'UNIDAD_TIEMPO_IN';
      //
      //
      FKeyFields.Add('ID_CREDITO_MARCO');
      //
      TableName := 'CR_CREDITO_MARCO'; 
      UseQuery  := True;
      HelpFile  := 'IntCrCreMar.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCreMar.Destroy;
begin
      if CrLiqDis    <> nil then CrLiqDis.Free;
      if MPersona    <> nil then MPersona.Free;
      if MFiraOpe    <> nil then MFiraOpe.Free;
      if CrCalcInt   <> nil then CrCalcInt.Free;
      if UTiempoTasa <> nil then UTiempoTasa.Free;
      if CrAmortiz   <> nil then CrAmortiz.Free;
      if UTiempoCap  <> nil then UTiempoCap.Free;
      if CrPagInt    <> nil then CrPagInt.Free;
      if UTiempoInt  <> nil then UTiempoInt.Free;
      //
      inherited;
end;


function TCrCreMar.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCreditoMarco;
begin
   W:=TWCrCreditoMarco.Create(Self);
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


function TCrCreMar.stpInsDispMarco: Boolean;
var vlError : string;
    stpInsDisp : TStoredProc;
begin
  Result := False;
  try
    stpInsDisp := TStoredProc.Create(self);
    with stpInsDisp do
    begin
      try
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        StoredProcName := 'PKGCRCREDITO.STPINSDISPMARCO';
        //
        Params.Clear;
        Params.CreateParam( ftFloat,    'PEID_PROM_ADM',        ptInput );
        Params.CreateParam( ftString,   'PECVE_LIQUIDACION',    ptInput );
        Params.CreateParam( ftString,   'PEB_APLICA_COM',       ptInput );
        Params.CreateParam( ftFloat,    'PEPCT_COMISION',       ptInput );
        Params.CreateParam( ftString,   'PECVE_OPERATIVA',      ptInput );
        Params.CreateParam( ftString,   'PETX_COMENTARIOS',     ptInput );
        Params.CreateParam( ftString,   'PECVE_CALCULO',        ptInput );
        Params.CreateParam( ftFloat,    'PEFACT_MORAS',         ptInput );
        Params.CreateParam( ftString,   'PEUNIDAD_TIEMPO_RE',   ptInput );
        Params.CreateParam( ftFloat,    'PENUM_UNIDADES_RE',    ptInput );
        Params.CreateParam( ftFloat,    'PEDIA_REVISION',       ptInput );
        Params.CreateParam( ftString,   'PECVE_AMORTIZACION',   ptInput );
        Params.CreateParam( ftString,   'PEUNIDAD_TIEMPO_CP',   ptInput );
        Params.CreateParam( ftFloat,    'PENUM_UNIDADES_CP',    ptInput );
        Params.CreateParam( ftFloat,    'PEDIA_PAGO_CAP',       ptInput );
        Params.CreateParam( ftString,   'PECVE_PAG_INTERES',    ptInput );
        Params.CreateParam( ftString,   'PEUNIDAD_TIEMPO_IN',   ptInput );
        Params.CreateParam( ftFloat,    'PENUM_UNIDADES_IN',    ptInput );
        Params.CreateParam( ftFloat,    'PEDIA_PAGO_INT',       ptInput );
        Params.CreateParam( ftString,   'PESIT_CREDITO_MARCO',  ptInput );
        Params.CreateParam( ftDate,     'PEF_ALTA',             ptInput );
        Params.CreateParam( ftString,   'PECVE_USU_ALTA',       ptInput );
        Params.CreateParam( ftDate,     'PEF_MODIFICA',         ptInput );
        Params.CreateParam( ftString,   'PECVE_USU_MODIFICA',   ptInput );
        Params.CreateParam( ftFloat,    'PEID_EMPRESA',         ptInput );
        Params.CreateParam( ftString,   'PEB_COMMIT',           ptInput );
        Params.CreateParam( ftFloat,    'PSID_CREDITO_MARCO',   ptOutput );
        Params.CreateParam( ftString,   'PSResultado',          ptOutput );
        Params.CreateParam( ftString,   'PSTxResultado',        ptOutput );
        //
        ParamByName( 'PEID_PROM_ADM'      ).AsFloat  := ID_PROM_ADM.AsFloat;
        ParamByName( 'PECVE_LIQUIDACION'  ).AsString := CVE_LIQUIDACION.AsString;
        ParamByName( 'PEB_APLICA_COM'     ).AsString := B_APLICA_COM.AsString;
        ParamByName( 'PEPCT_COMISION'     ).AsFloat  := PCT_COMISION.AsFloat;
        ParamByName( 'PECVE_OPERATIVA'    ).AsString := CVE_OPERATIVA.AsString;
        ParamByName( 'PETX_COMENTARIOS'   ).AsString := TX_COMENTARIOS.AsString;
        ParamByName( 'PECVE_CALCULO'      ).AsString := CVE_CALCULO.AsString;
        ParamByName( 'PEFACT_MORAS'       ).AsFloat  := FACT_MORAS.AsFloat;
        ParamByName( 'PEUNIDAD_TIEMPO_RE' ).AsString := UNIDAD_TIEMPO_RE.AsString;
        ParamByName( 'PENUM_UNIDADES_RE'  ).AsFloat  := NUM_UNIDADES_RE.AsFloat;
        ParamByName( 'PEDIA_REVISION'     ).AsFloat  := DIA_REVISION.AsFloat;
        ParamByName( 'PECVE_AMORTIZACION' ).AsString := CVE_AMORTIZACION.AsString;
        ParamByName( 'PEUNIDAD_TIEMPO_CP' ).AsString := UNIDAD_TIEMPO_CP.AsString;
        ParamByName( 'PENUM_UNIDADES_CP'  ).AsFloat  := NUM_UNIDADES_CP.AsFloat;
        ParamByName( 'PEDIA_PAGO_CAP'     ).AsFloat  := DIA_PAGO_CAP.AsFloat;
        ParamByName( 'PECVE_PAG_INTERES'  ).AsString := CVE_PAG_INTERES.AsString;
        ParamByName( 'PEUNIDAD_TIEMPO_IN' ).AsString := UNIDAD_TIEMPO_IN.AsString;
        ParamByName( 'PENUM_UNIDADES_IN'  ).AsFloat  := NUM_UNIDADES_IN.AsFloat;
        ParamByName( 'PEDIA_PAGO_INT'     ).AsFloat  := DIA_PAGO_INT.AsFloat;
        ParamByName( 'PESIT_CREDITO_MARCO').AsString := SIT_CREDITO_MARCO.AsString;
        ParamByName( 'PEF_ALTA'           ).AsDate   := F_ALTA.AsDateTime;
        ParamByName( 'PECVE_USU_ALTA'     ).AsString := CVE_USU_ALTA.AsString;
        ParamByName( 'PEF_MODIFICA'       ).Clear;
        ParamByName( 'PECVE_USU_MODIFICA' ).Clear;
        ParamByName( 'PEID_EMPRESA'       ).AsFloat  := Apli.IdEmpresa;
        ParamByName( 'PEB_COMMIT'         ).AsString := 'V';
        ParamByName( 'PSID_CREDITO_MARCO' ).Clear;
        ParamByName( 'PSResultado'        ).Clear;
        ParamByName( 'PSTxResultado'      ).Clear;
        //
        ExecProc;
        if ParamByName( 'PSResultado' ).AsInteger = 0 then
        begin
          ID_CREDITO_MARCO.AsFloat := ParamByName( 'PSID_CREDITO_MARCO' ).AsFloat;
          ID_CREDITO_MARCO.DrawControl;
          Result := True;
        end else
        begin
          vlError := 'Problemas al registrar la disposición marco: '   + coCRLF +
                     'Código : ' + ParamByName('PSResultado').AsString + coCRLF +
                     'Mensaje: ' + ParamByName('PSTxResultado').AsString;
          EXECUTE_MUESTRAMENSAJE( vlError );
        end;//
      finally
        stpInsDisp.Free;
      end;
      //
    end;
    //
  except
    //
    on e : exception do
    begin
      vlError := 'Error al registrar la disposición marco: '   + coCRLF +
                 'Código : ' + coCRLF + 'Mensaje: ' + e.Message;
    end;
    //
  end;
end;


Function TCrCreMar.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCrMa.it','F');
      Try if Active then begin T.Param(0,ID_CREDITO_MARCO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TCrCreMar.InternalPost: Boolean;
begin
  Result := False;
  if Modo = moEdit then
  begin
    Result := Inherited InternalPost;
  end else if Modo = moAppend then
  begin
    Result := stpInsDispMarco;
  end;
end;

function TCrCreMar.Reporte:Boolean;
begin //Execute_Reporte();
end;

(***********************************************FORMA CR_CREDITO_MARCO********************)
(*                                                                              *)
(*  FORMA DE CR_CREDITO_MARCO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CREDITO_MARCO********************)

procedure TWCrCreditoMarco.OnOffPctComision;
begin
  //
  if chB_APLICA_COM.Checked then
  begin
    edPCT_COMISION.Enabled := True;
    edPCT_COMISION.Color   := clWindow;
  end else
  begin
    edPCT_COMISION.Enabled := False;
    edPCT_COMISION.Color   := clBtnFace;
  end;
  //
end;


procedure TWCrCreditoMarco.OnOffTasaRevision;
var vlColor     : TColor;
    vlBRevision : Boolean;
begin
  Objeto.CVE_CALCULO.GetFromControl;
  vlBRevision := Objeto.CVE_CALCULO.AsString = 'RE';
  if vlBRevision then vlColor     := clWindow
                 else vlColor     := clBtnFace;
  //
  //edDESC_UNIDAD_TIEMPO_RE.Enabled := vlBRevision;
  btUNIDAD_TIEMPO_RE.Enabled      := vlBRevision;
  edNUM_UNIDADES_RE.Enabled       := vlBRevision;
  edDIA_REVISION.Enabled          := vlBRevision;
  //
  //edDESC_UNIDAD_TIEMPO_RE.Color   := vlColor;
  edNUM_UNIDADES_RE.Color         := vlColor;
  edDIA_REVISION.Color            := vlColor;
{}
end;


procedure TWCrCreditoMarco.OnOffTipoAmortiza;
{CAPITAL/COMISINN   (CP,CO)
--0	NO APLICA  OPERACIONES FUERA DE BALANCE
--1	AMORTIZACIONES PERIÓDICAS AL CAPITAL DE MONTO IDÉNTICO  ok
--2	AMORTIZACIONES PERIÓDICAS AL CAPITAL DE MONTO DIFERENTE  ok
--3	AMORTIZACIONES IRREGULARES PAGOS REALIZADOS EN ESP  DE TIEMPO DIFERENTES
--4	AMORTIZACIÓN  ÚNICA AL VENCIMIENTO}
var vlColor    : TColor;
    vlBEnabled : Boolean;
begin
  if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
  begin
    vlBEnabled := ( objeto.CVE_AMORTIZACION.AsString = '0' ) or
                  ( objeto.CVE_AMORTIZACION.AsString = '1' ) or
                  ( objeto.CVE_AMORTIZACION.AsString = '2' ) or
                  ( objeto.CVE_AMORTIZACION.AsString = '3' );
    if vlBEnabled then vlColor := clWindow
                  else vlColor := clBtnFace;
    //
    //edDESC_UNIDAD_TIEMPO_CP.Color := vlColor;
    edNUM_UNIDADES_CP.Color       := vlColor;
    edDIA_PAGO_CAP.Color          := vlColor;
    //
    //edDESC_UNIDAD_TIEMPO_CP.Enabled := vlBEnabled;
    btUNIDAD_TIEMPO_CP.Enabled      := vlBEnabled;
    edNUM_UNIDADES_CP.Enabled       := vlBEnabled;
    edDIA_PAGO_CAP.Enabled          := vlBEnabled;
  end;
end;

procedure TWCrCreditoMarco.OnOffTipoInteres;
{--INTERÉS  (IN)
--0	NO APLICA  OPERACIONES FUERA DE BALANCE
--1	SI SE COBRAN EN SU TOTALIDAD POR ANTICIPADO
--2	SI SE COBRAN EN SU TOTALIDAD AL VENCIMIENTO
--3	SI SE COBRAN EN FORMA PERIÓDICA}
var vlColor    : TColor;
    vlBEnabled : Boolean;
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  begin
    vlBEnabled := ( objeto.CVE_PAG_INTERES.AsString = '3' );
    if vlBEnabled then vlColor := clWindow
                  else vlColor := clBtnFace;
    //
    //edDESC_UNIDAD_TIEMPO_IN.Color   := vlColor;
    edNUM_UNIDADES_IN.Color         := vlColor;
    edDIA_PAGO_INT.Color            := vlColor;
    //
    //edDESC_UNIDAD_TIEMPO_IN.Enabled := vlBEnabled;
    btUNIDAD_TIEMPO_IN.Enabled      := vlBEnabled;
    edNUM_UNIDADES_IN.Enabled       := vlBEnabled;
    edDIA_PAGO_INT.Enabled          := vlBEnabled;
  end;
end;


procedure TWCrCreditoMarco.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_CREDITO_MARCO.Control := edID_CREDITO_MARCO;
      Objeto.ID_PROM_ADM.Control      := edID_PROM_ADM;
      Objeto.CVE_LIQUIDACION.Control  := edCVE_LIQUIDACION;
      Objeto.B_APLICA_COM.Control     := chB_APLICA_COM;
      Objeto.PCT_COMISION.Control     := edPCT_COMISION;
      Objeto.CVE_OPERATIVA.Control    := edCVE_OPERATIVA;
      Objeto.TX_COMENTARIOS.Control   := edTX_COMENTARIOS;
      Objeto.CVE_CALCULO.Control      := edCVE_CALCULO;
      Objeto.FACT_MORAS.Control       := edFACT_MORAS;
      Objeto.UNIDAD_TIEMPO_RE.Control := edUNIDAD_TIEMPO_RE;
      Objeto.NUM_UNIDADES_RE.Control  := edNUM_UNIDADES_RE;
      Objeto.DIA_REVISION.Control     := edDIA_REVISION;
      Objeto.CVE_AMORTIZACION.Control := edCVE_AMORTIZACION;
      Objeto.UNIDAD_TIEMPO_CP.Control := edUNIDAD_TIEMPO_CP;
      Objeto.NUM_UNIDADES_CP.Control  := edNUM_UNIDADES_CP;
      Objeto.DIA_PAGO_CAP.Control     := edDIA_PAGO_CAP;
      Objeto.CVE_PAG_INTERES.Control  := edCVE_PAG_INTERES;
      Objeto.UNIDAD_TIEMPO_IN.Control := edUNIDAD_TIEMPO_IN;
      Objeto.NUM_UNIDADES_IN.Control  := edNUM_UNIDADES_IN;
      Objeto.DIA_PAGO_INT.Control     := edDIA_PAGO_INT;
      Objeto.SIT_CREDITO_MARCO.Control:= rgSIT_CREDITO_MARCO;
      Objeto.F_ALTA.Control           := edF_ALTA;
      Objeto.CVE_USU_ALTA.Control     := edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control       := edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;
      //
      Objeto.CrLiqDis.CVE_LIQUIDACION.Control     := edCVE_LIQUIDACION;
      Objeto.CrLiqDis.DESC_LIQUIDACION.Control    := edDESC_LIQUIDACION;
      Objeto.MPersona.ID_Persona.Control          := edID_PROM_ADM;
      Objeto.MPersona.Nombre.Control              := edDESC_PROM_ADM;
      Objeto.MFiraOpe.CVE_OPERATIVA.Control       := edCVE_OPERATIVA;
      Objeto.CrCalcInt.CVE_CALCULO_INT.Control    := edCVE_CALCULO;
      Objeto.CrCalcInt.DESC_CALCULO.Control       := edDESC_CALCULO;
      Objeto.UTiempoTasa.CVE_UNIDAD_TIEMP.Control := edUNIDAD_TIEMPO_RE;
      Objeto.UTiempoTasa.DESCRIPCION.Control      := edDESC_UNIDAD_TIEMPO_RE;
      Objeto.CrAmortiz.CVE_AMORTIZACION.Control   := edCVE_AMORTIZACION;
      Objeto.CrAmortiz.DESC_AMORTIZA.Control      := edDESC_AMORTIZACION;
      Objeto.UTiempoCap.CVE_UNIDAD_TIEMP.Control  := edUNIDAD_TIEMPO_CP;
      Objeto.UTiempoCap.DESCRIPCION.Control       := edDESC_UNIDAD_TIEMPO_CP;
      Objeto.CrPagInt.CVE_PAG_INTERES.Control     := edCVE_PAG_INTERES;
      Objeto.CrPagInt.DESC_PAG_INTERES.Control    := edDESC_PAG_INTERES;
      Objeto.UTiempoInt.CVE_UNIDAD_TIEMP.Control  := edUNIDAD_TIEMPO_IN;
      Objeto.UTiempoInt.DESCRIPCION.Control       := edDESC_UNIDAD_TIEMPO_IN;
      //

      InterForma1.MsgPanel := MsgPanel;
end;

procedure TWCrCreditoMarco.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CREDITO_MARCO.Control := nil;
      Objeto.ID_PROM_ADM.Control      := nil;
      Objeto.CVE_LIQUIDACION.Control  := nil;
      Objeto.B_APLICA_COM.Control     := nil;
      Objeto.PCT_COMISION.Control     := nil;
      Objeto.CVE_OPERATIVA.Control    := nil;
      Objeto.TX_COMENTARIOS.Control   := nil;
      Objeto.CVE_CALCULO.Control      := nil;
      Objeto.FACT_MORAS.Control       := nil;
      Objeto.UNIDAD_TIEMPO_RE.Control := nil;
      Objeto.NUM_UNIDADES_RE.Control  := nil;
      Objeto.DIA_REVISION.Control     := nil;
      Objeto.CVE_AMORTIZACION.Control := nil;
      Objeto.UNIDAD_TIEMPO_CP.Control := nil;
      Objeto.NUM_UNIDADES_CP.Control  := nil;
      Objeto.DIA_PAGO_CAP.Control     := nil;
      Objeto.CVE_PAG_INTERES.Control  := nil;
      Objeto.UNIDAD_TIEMPO_IN.Control := nil;
      Objeto.NUM_UNIDADES_IN.Control  := nil;
      Objeto.DIA_PAGO_INT.Control     := nil;
      Objeto.SIT_CREDITO_MARCO.Control:= nil;
      Objeto.F_ALTA.Control           := nil;
      Objeto.CVE_USU_ALTA.Control     := nil;
      Objeto.F_MODIFICA.Control       := nil;
      Objeto.CVE_USU_MODIFICA.Control := nil;
      //
      Objeto.CrLiqDis.CVE_LIQUIDACION.Control     := nil;
      Objeto.CrLiqDis.DESC_LIQUIDACION.Control    := nil;
      Objeto.MPersona.ID_Persona.Control          := nil;
      Objeto.MPersona.Nombre.Control              := nil;
      Objeto.MFiraOpe.CVE_OPERATIVA.Control       := nil;
      Objeto.CrCalcInt.CVE_CALCULO_INT.Control    := nil;
      Objeto.CrCalcInt.DESC_CALCULO.Control       := nil;
      Objeto.UTiempoTasa.CVE_UNIDAD_TIEMP.Control := nil;
      Objeto.UTiempoTasa.DESCRIPCION.Control      := nil;
      Objeto.CrAmortiz.CVE_AMORTIZACION.Control   := nil;
      Objeto.CrAmortiz.DESC_AMORTIZA.Control      := nil;
      Objeto.UTiempoCap.CVE_UNIDAD_TIEMP.Control  := nil;
      Objeto.UTiempoCap.DESCRIPCION.Control       := nil;
      Objeto.CrPagInt.CVE_PAG_INTERES.Control     := nil;
      Objeto.CrPagInt.DESC_PAG_INTERES.Control    := nil;
      Objeto.UTiempoInt.CVE_UNIDAD_TIEMP.Control  := nil;
      Objeto.UTiempoInt.DESCRIPCION.Control       := nil;
      //
end;

procedure TWCrCreditoMarco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrCreditoMarco.InterForma1DespuesNuevo(Sender: TObject);
begin
  OnOffPctComision;
  Objeto.SIT_CREDITO_MARCO.AsString := CSIT_AC;
  Objeto.F_ALTA.AsDateTime     := Objeto.Apli.DameFechaEmpresa;
  Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
  //
  if edCVE_LIQUIDACION.CanFocus then
    edCVE_LIQUIDACION.SetFocus;
  //
end;

procedure TWCrCreditoMarco.InterForma1AntesAceptar(Sender: TObject;  IsNewData: Boolean; var Realizado: Boolean);
begin
  //Nuevo
  if IsNewData then
  begin
    Realizado := MessageDlg('¿Desea almacenar los datos capturados?',
                             mtConfirmation,[mbYes, mbNo], 0) = mrYes;
  end
  else if InterForma1.CanEdit then
  begin
      Realizado := MessageDlg('¿Desea guardar los datos modificados?',
                             mtConfirmation,[mbYes, mbNo], 0) = mrYes;
  end;
end;



procedure TWCrCreditoMarco.edCVE_LIQUIDACIONExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg    := '';
      vlValida := True;
      Objeto.CVE_LIQUIDACION.GetFromControl;
      If Objeto.CVE_LIQUIDACION.AsString = '' then
      begin
         vlMsg    := 'Favor de indicar el tipo de liquidación';
         vlValida := False;
      end;
      InterForma1.ValidaExit( edCVE_LIQUIDACION, vlValida, vlMsg, True );
   end;
end;

procedure TWCrCreditoMarco.btCVE_LIQUIDACIONClick(Sender: TObject);
begin
  Objeto.CrLiqDis.ShowAll := True;
  if Objeto.CrLiqDis.Busca then
     InterForma1.NextTab( edCVE_LIQUIDACION );
  //end if;
end;

procedure TWCrCreditoMarco.ilLIQUIDACIONEjecuta(Sender: TObject);
begin
  if Objeto.CrLiqDis.FindKey([ilLIQUIDACION.Buffer]) then
    InterForma1.NextTab( edCVE_LIQUIDACION );
  //end if;
end;

procedure TWCrCreditoMarco.edID_PROM_ADMExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg    := '';
      vlValida := True;
      Objeto.ID_PROM_ADM.GetFromControl;
      If Objeto.ID_PROM_ADM.AsString = '' then
      begin
         vlMsg    := 'Favor de indicar el promotor administrador';
         vlValida := False;
      end;
      InterForma1.ValidaExit( edID_PROM_ADM, vlValida, vlMsg, True );
   end;
end;

procedure TWCrCreditoMarco.btID_PROM_ADMClick(Sender: TObject);
begin
  Objeto.MPersona.ShowAll := True;
  if Objeto.MPersona.Busca then
     InterForma1.NextTab( edID_PROM_ADM );
  //end if;
end;

procedure TWCrCreditoMarco.ilPROM_ADMEjecuta(Sender: TObject);
begin
  if Objeto.MPersona.FindKey([ilPROM_ADM.Buffer]) then
    InterForma1.NextTab( edID_PROM_ADM );
  //end if;
end;
//
procedure TWCrCreditoMarco.chB_APLICA_COMEnter(Sender: TObject);
begin
  if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
  Begin
    OnOffPctComision;
  End;
end;
//
procedure TWCrCreditoMarco.chB_APLICA_COMClick(Sender: TObject);
begin
  if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
  Begin
    OnOffPctComision;
    InterForma1.NextTab( chB_APLICA_COM );
  End;
end;


procedure TWCrCreditoMarco.chB_APLICA_COMExit(Sender: TObject);
begin
  if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
  Begin
    InterForma1.ValidaExit( chB_APLICA_COM, True, '', True );
  End;
end;


procedure TWCrCreditoMarco.edPCT_COMISIONExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
  If ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
  Begin
    vlMsg    := '';
    VLValida := True;
    Objeto.PCT_COMISION.GetFromControl;
    if Objeto.PCT_COMISION.AsFloat <= 0 then
    Begin
      vlMsg := 'La comisión no puede ser menor o igual a cero';
      VLValida := False;
    end;
    InterForma1.ValidaExit(edPCT_COMISION, VLValida, vlMsg, True );
  End;
  //
End;

procedure TWCrCreditoMarco.btCVE_OPERATIVAClick(Sender: TObject);
begin
  Objeto.MFiraOpe.ShowAll := True;
  if Objeto.MFiraOpe.Busca then
    InterForma1.NextTab( btCVE_OPERATIVA );
  //end if;
end;

procedure TWCrCreditoMarco.edCVE_OPERATIVAExit(Sender: TObject);
begin
  InterForma1.ValidaExit( btCVE_OPERATIVA, True, '', True );
end;

procedure TWCrCreditoMarco.edTX_COMENTARIOSExit(Sender: TObject);
begin
  if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
  Begin
    InterForma1.ValidaExit( edTX_COMENTARIOS, True, '', True );
  end;
end;

procedure TWCrCreditoMarco.edCVE_CALCULOExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
   if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
   Begin
      vlMsg    := '';
      vlValida := True;
      Objeto.CVE_CALCULO.GetFromControl;
      If Objeto.CVE_CALCULO.AsString = '' then
      begin
         vlMsg    := 'Favor de indicar el tipo de cálculo de los intereses';
         vlValida := False;
      end;
      OnOffTasaRevision;
      InterForma1.ValidaExit( edCVE_CALCULO, vlValida, vlMsg, True );
   end;
end;

procedure TWCrCreditoMarco.btCVE_CALCULOClick(Sender: TObject);
begin
  Objeto.CrCalcInt.ShowAll := True;
  if Objeto.CrCalcInt.Busca then
  begin
     OnOffTasaRevision;
     InterForma1.NextTab( edCVE_CALCULO );
  end;//end if;
end;

procedure TWCrCreditoMarco.ilCALCULOEjecuta(Sender: TObject);
begin
  if Objeto.CrCalcInt.FindKey( [ ilCALCULO.Buffer ] ) then
    InterForma1.NextTab( edCVE_CALCULO );
  //end if;
end;

procedure TWCrCreditoMarco.edFACT_MORASExit(Sender: TObject);
begin
  InterForma1.ValidaExit( edFACT_MORAS, True, '', True );
end;
//
procedure TWCrCreditoMarco.edDESC_UNIDAD_TIEMPO_REExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
   if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
   Begin
      vlMsg    := '';
      vlValida := True;
      Objeto.UNIDAD_TIEMPO_RE.GetFromControl;
      If Objeto.UNIDAD_TIEMPO_RE.AsString = '' then
      begin
         vlMsg    := 'Favor de indicar la unidad de tiempo de revisión de tasa';
         vlValida := False;
      end;
      InterForma1.ValidaExit( btUNIDAD_TIEMPO_RE, vlValida, vlMsg, True );
   end;
end;
//
procedure TWCrCreditoMarco.btUNIDAD_TIEMPO_REClick(Sender: TObject);
begin
  Objeto.UTiempoTasa.ShowAll := True;
  if Objeto.UTiempoTasa.Busca then
     InterForma1.NextTab( btUNIDAD_TIEMPO_RE );
  //end if;
end;

procedure TWCrCreditoMarco.edNUM_UNIDADES_REExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
   if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
   Begin
      vlMsg    := '';
      vlValida := True;
      Objeto.NUM_UNIDADES_RE.GetFromControl;
      If Objeto.NUM_UNIDADES_RE.AsInteger <= 0 then
      begin
         vlMsg    := 'Favor de indicar el número de unidades de revisión';
         vlValida := False;
      end;
      InterForma1.ValidaExit( edNUM_UNIDADES_RE, vlValida, vlMsg, True );
   end;
end;

procedure TWCrCreditoMarco.edDIA_REVISIONExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
   if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
   Begin
      vlMsg    := '';
      vlValida := True;
      Objeto.DIA_REVISION.GetFromControl;
      If ( ( Objeto.DIA_REVISION.AsInteger <= 0 ) or ( Objeto.DIA_REVISION.AsInteger > 31 ) ) then
      begin
         vlMsg    := 'Favor de indicar el día de revisión de la tasa';
         vlValida := False;
      end;
      InterForma1.ValidaExit( edDIA_REVISION, vlValida, vlMsg, True );
   end;
end;
{
+------------------------------------------------------------------------------+
|                                                                              |
|                                                                              |
+------------------------------------------------------------------------------+
}
procedure TWCrCreditoMarco.edCVE_AMORTIZACIONExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
   if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
   Begin
      vlMsg    := '';
      vlValida := True;
      Objeto.CVE_AMORTIZACION.GetFromControl;
      If Objeto.CVE_AMORTIZACION.AsString = '' then
      begin
         vlMsg    := 'Favor de indicar el tipo de amortización';
         vlValida := False;
      end;
      OnOffTipoAmortiza;
      InterForma1.ValidaExit( edCVE_AMORTIZACION, vlValida, vlMsg, True );
   end;
end;


procedure TWCrCreditoMarco.btCVE_AMORTIZACIONClick(Sender: TObject);
begin
  Objeto.CrAmortiz.ShowAll := True;
  if Objeto.CrAmortiz.Busca then
  begin
     OnOffTipoAmortiza;
     InterForma1.NextTab( edCVE_AMORTIZACION );
  end;//end if;
end;

procedure TWCrCreditoMarco.ilAMORTIZACIONEjecuta(Sender: TObject);
begin
  if Objeto.CrAmortiz.FindKey( [ ilAMORTIZACION.Buffer ] ) then
    InterForma1.NextTab( edCVE_AMORTIZACION );
  //end if;
end;



procedure TWCrCreditoMarco.edDESC_UNIDAD_TIEMPO_CPExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
  if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
  Begin
    vlMsg    := '';
    vlValida := True;
    Objeto.UNIDAD_TIEMPO_CP.GetFromControl;
    If Objeto.UNIDAD_TIEMPO_CP.AsString = '' then
    begin
      vlMsg    := 'Favor de indicar la unidad de tiempo de amortización';
      vlValida := False;
    end;
    InterForma1.ValidaExit( btUNIDAD_TIEMPO_CP, vlValida, vlMsg, True );
  end;
end;
//
procedure TWCrCreditoMarco.btUNIDAD_TIEMPO_CPClick(Sender: TObject);
begin
  Objeto.UTiempoCap.ShowAll := True;
  if Objeto.UTiempoCap.Busca then
     InterForma1.NextTab( btUNIDAD_TIEMPO_CP );
  //end if;
end;



//
procedure TWCrCreditoMarco.edNUM_UNIDADES_CPExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
  if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
  Begin
    vlMsg    := '';
    vlValida := True;
    Objeto.NUM_UNIDADES_CP.GetFromControl;
    If Objeto.NUM_UNIDADES_CP.AsInteger <= 0 then
    begin
      vlMsg    := 'Favor de indicar el número de unidades de tiempo de amortización';
      vlValida := False;
    end;
    InterForma1.ValidaExit( edNUM_UNIDADES_CP, vlValida, vlMsg, True );
  end;
end;
//
procedure TWCrCreditoMarco.edDIA_PAGO_CAPExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
  if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
  Begin
    vlMsg    := '';
    vlValida := True;
    Objeto.DIA_PAGO_CAP.GetFromControl;
    If ( ( Objeto.DIA_PAGO_CAP.AsInteger <= 0 ) or ( Objeto.DIA_PAGO_CAP.AsInteger > 31 ) ) then
    begin
      vlMsg    := 'Favor de indicar el dia de pago de la amortización';
      vlValida := False;
    end;
    InterForma1.ValidaExit( edDIA_PAGO_CAP, vlValida, vlMsg, True );
  end;
end;
//
procedure TWCrCreditoMarco.edCVE_PAG_INTERESExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
  if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
  Begin
    vlMsg    := '';
    vlValida := True;
    Objeto.CVE_PAG_INTERES.GetFromControl;
    If Objeto.CVE_PAG_INTERES.AsString = '' then
    begin
      vlMsg    := 'Favor de indicar el tipo de pago de los intereses';
      vlValida := False;
    end;
    OnOffTipoInteres;
    InterForma1.ValidaExit( edCVE_PAG_INTERES, vlValida, vlMsg, True );
  end;
end;
//
procedure TWCrCreditoMarco.btCVE_PAG_INTERESClick(Sender: TObject);
begin
  Objeto.CrPagInt.ShowAll := True;
  if Objeto.CrPagInt.Busca then
  begin
    OnOffTipoInteres;
    InterForma1.NextTab( edCVE_PAG_INTERES );
  end;//end if;
end;
//
procedure TWCrCreditoMarco.ilPAG_INTERESEjecuta(Sender: TObject);
begin
  if Objeto.CrPagInt.FindKey( [ ilPAG_INTERES.Buffer ] ) then
    InterForma1.NextTab( edCVE_PAG_INTERES );
  //end if;
end;


procedure TWCrCreditoMarco.edDESC_UNIDAD_TIEMPO_INExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
  //
  if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
  Begin
    vlMsg    := '';
    vlValida := True;
    Objeto.UNIDAD_TIEMPO_IN.GetFromControl;
    If Objeto.UNIDAD_TIEMPO_IN.AsString = '' then
    begin
      vlMsg    := 'Favor de indicar la unidad de tiempo de interés';
      vlValida := False;
    end;
    InterForma1.ValidaExit( btUNIDAD_TIEMPO_IN, vlValida, vlMsg, True );
  end;
  //
end;

procedure TWCrCreditoMarco.btUNIDAD_TIEMPO_INClick(Sender: TObject);
begin
  Objeto.UTiempoInt.ShowAll := True;
  if Objeto.UTiempoInt.Busca then
     InterForma1.NextTab( btUNIDAD_TIEMPO_IN );
  //end if;
end;

procedure TWCrCreditoMarco.edNUM_UNIDADES_INExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
  if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
  Begin
    vlMsg    := '';
    vlValida := True;
    Objeto.NUM_UNIDADES_IN.GetFromControl;
    If Objeto.NUM_UNIDADES_IN.AsInteger <= 0 then
    begin
      vlMsg    := 'Favor de indicar el número de unidades de tiempo de interés';
      vlValida := False;
    end;
    InterForma1.ValidaExit( edNUM_UNIDADES_IN, vlValida, vlMsg, True );
  end;
end;

procedure TWCrCreditoMarco.edDIA_PAGO_INTExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
  if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
  Begin
    vlMsg    := '';
    vlValida := True;
    Objeto.DIA_PAGO_INT.GetFromControl;
    If ( ( Objeto.DIA_PAGO_INT.AsInteger <= 0 ) or ( Objeto.DIA_PAGO_INT.AsInteger > 31 ) ) then
    begin
      vlMsg    := 'Favor de indicar el dia de pago de los intereses';
      vlValida := False;
    end;
    InterForma1.ValidaExit( edDIA_PAGO_INT, vlValida, vlMsg, True );
  end;
end;









procedure TWCrCreditoMarco.rgSIT_CREDITO_MARCOExit(Sender: TObject);
begin
  if ( ( Objeto.Modo = moEdit ) or ( Objeto.Modo = moAppend ) ) then
  Begin
    InterForma1.ValidaExit( rgSIT_CREDITO_MARCO, True, '', True );
  end;
end;

procedure TWCrCreditoMarco.btComisADDClick(Sender: TObject);
var CrComMar : TCrComMar;
begin
  if Objeto.ID_CREDITO_MARCO.AsInteger <= 0 then
  begin
    MessageDlg( 'Favor de seleccionar una disposición marco', mtInformation, [mbOk], 0 );
    Exit;
  end;
  //
  CrComMar   := TCrComMar.Create(Self);
  try
    CrComMar.Apli     := Objeto.Apli;
    CrComMar.ParamCre := Objeto.ParamCre;
    //
    CrComMar.VGIDCredito      := Objeto.ID_CREDITO_MARCO.AsInteger;
    CrComMar.FilterString     := 'CR_COMIS_MARCO.ID_CREDITO_MARCO = ' + Objeto.ID_CREDITO_MARCO.AsString;
    CrComMar.BuscaWhereString := CrComMar.FilterString;     
    //
    CrComMar.Catalogo;
  finally
    CrComMar.Free;
  end;
end;

end.
