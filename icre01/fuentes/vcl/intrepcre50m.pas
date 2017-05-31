unit IntRepCre50M;
//------------------------------------------------------------------------------
//  Empresa    :  BANCO INTERACCIONES
//  Sistema    :  Sistema de Creditos "ICRE"
//  Modulo     :  Pantalla de Parametros para el Reporte de
//                Créditos con Monto autorizado mayor a 50 Millones de pesos
//  Función    :  Configura los parametros para la visualización del Reporte
//  Fecha      :  Enero '2009
//  Desarrollo :  Esthela Almanza Camarillo.
//  Modificó   :  MAGV700729
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  InterFor, StdCtrls, ComCtrls, ExtCtrls, Buttons, IntSGCtrl,
  IntFrm,                 //  TInterFrame
  IntParamCre,            //  TParamCre
  Db, DBTables, Grids, DBGrids,
  UnSQL2,
  IntGenCre, Aligrid, Excel97, OleServer, InterEdit
  ;                 //  RunSQL

const
  //--********************
  //Constante utilizada para definir el grupo económico SIN GRUPO
  //utilizado como caso especial para filtrar los créditos individualmente
  SINGRUPO : String = '5190';
  //Línea de crédito contingente
  CRE_CONTINGENTE : String = '99681';
  //--********************

type
 TRepCre50M = class;

  TWRepCre50M = class(TForm)
    InterForma1: TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    qDatos: TQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    sgDatos: TSGCtrl;
    btConsulta: TBitBtn;
    TabSheet2: TTabSheet;
    lbArchivoSalida: TLabel;
    edArchivoSalida: TEdit;
    sbArchivoSalida: TSpeedButton;
    sagR50_LAYOUT: TStringAlignGrid;
    sdArchivoSalida: TSaveDialog;
    ExcelWorksheetO: TExcelWorksheet;
    ExcelWorkbookO: TExcelWorkbook;
    ExcelApplicationO: TExcelApplication;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DTP_FECHA_DIA: TDateTimePicker;
    ed_TipoCambio: TEdit;
    ed_montoinf: TInterEdit;
    ed_montosup: TInterEdit;
    btActualiza: TBitBtn;
    TabSheet3: TTabSheet;
    btActualiza2: TBitBtn;
    sagRC_LAYOUT: TStringAlignGrid;
    Label5: TLabel;
    edArchivoSalida2: TEdit;
    sbArchivoSalida2: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btConsultaClick(Sender: TObject);
    procedure ed_TipoCambioKeyPress(Sender: TObject; var Key: Char);
    procedure sbArchivoSalidaClick(Sender: TObject);
    procedure btActualizaClick(Sender: TObject);
    procedure btActualiza2Click(Sender: TObject);
    procedure sbArchivoSalida2Click(Sender: TObject);
  private
    { Private declarations }
    //ACMEvlIsEmpty : Boolean;
    Procedure BuscaDatos;
    Procedure GeneraResumen50M;
    Procedure GeneraResumenCartera;
    Procedure GuardaResumen(tipo:String);
  public
    { Public declarations }
    Objeto : TRepCre50M;        //  Declaración del Objeto de tipo TRepCre50M
    StrTipoCam,
    StrFechaRep : String;
    qDatosStr: String;
  end;

 TRepCre50M= class(TInterFrame)
      private
      protected
      public
        ParamCre                 : TParamCre;
        { Public declarations }
        constructor Create( AOwner : TComponent ); override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        destructor  Destroy; override;
      published
 end;


var
  WRepCre50M: TWRepCre50M;

implementation

uses IntDmMain;

{$R *.DFM}

//  ************************************************************************  //
//  Ejecución del Query y formateo de campos.
//  ************************************************************************  //
procedure TWRepCre50M.BuscaDatos;
begin
  with qDatos do
  begin
    try
      sgDatos.Clear('NO EXISTEN DATOS'#30'>C');
      if trim(ed_TipoCambio.text) = ''  then
      begin
        MessageDlg('Debe capturar el Tipo de Cambio', mtError, [mbOk], 0);
        Abort;
      end;
      close;
      ParambyName('TipoCambio').Asstring := trim(ed_TipoCambio.text);
      ParambyName('FechaRep').Asstring := FormatDateTime('dd/mm/yyyy',DTP_FECHA_DIA.date);

      ParambyName('inf').Asstring := trim(ed_montoinf.text);

      if ((ed_montosup.text = '0') or (ed_montosup.text = '0.00')) then
        ParambyName('sup').Asstring := '1e125'
      else
        ParambyName('sup').Asstring := trim(ed_montosup.text);

      SQL.SaveToFile('C:\RepCre50M.sql');
      Open;
      if recordcount > 0 then
      begin
        FieldByName('CREDITO').DisplayLabel := 'CREDITO' + #30 +'>C';
        FieldByName('RFC_DEUDOR').DisplayLabel := 'RFC DEUDOR' + #30 +'>C';
        FieldByName('NOMBRE_DEUDOR').DisplayLabel := 'NOMBRE DEUDOR' + #30 +'>C';
        FieldByName('NOMBRE_GPO_ECONOMICO').DisplayLabel := 'NOMBRE GRUPO ECONOMICO' + #30 +'>C';
        FieldByName('F_AUTORIZACION').DisplayLabel := 'FECHA AUTORIZACION' + #30 +'>C';
        FieldByName('F_VENCIMIENTO').DisplayLabel := 'FECHA VENCIMIENTO' + #30 +'>C';
        FieldByName('MONTO_AUTORIZADO').DisplayLabel := 'MONTO AUTORIZADO' + #30 +'>C';
        FieldByName('SALDO_PRINCIPAL').DisplayLabel := 'SALDO PRINCIPAL' + #30 +'>C';
        FieldByName('SITUACION').DisplayLabel := 'SITUACION' + #30 +'>C';
        FieldByName('TIPO_TASA').DisplayLabel := 'TIPO TASA' + #30 +'>C';
        FieldByName('FECH_PAGO').DisplayLabel := 'FECHA PAGO' + #30 +'>C';
        FieldByName('MONTO_SIG_PAGO_EXIGIBLE').DisplayLabel := 'MONTO SIG. PAGO EXIGIBLE' + #30 +'>C';
        FieldByName('TIPO_PROX_PAGO_EX').DisplayLabel := 'TIPO PROX PAGO EXIGIBLE' + #30 +'>C';

        FieldByName('CREDITO').DisplayWidth := 11;
        FieldByName('RFC_DEUDOR').DisplayWidth := 17;
        FieldByName('NOMBRE_DEUDOR').DisplayWidth := 80;
        FieldByName('NOMBRE_GPO_ECONOMICO').DisplayWidth := 80;
        FieldByName('F_AUTORIZACION').DisplayWidth := 22;
        FieldByName('F_VENCIMIENTO').DisplayWidth := 22;
        FieldByName('MONTO_AUTORIZADO').DisplayWidth := 20;
        FieldByName('SALDO_PRINCIPAL').DisplayWidth := 20;
        FieldByName('SITUACION').DisplayWidth := 15;
        FieldByName('TIPO_TASA').DisplayWidth := 15;
        FieldByName('FECH_PAGO').DisplayWidth := 22;
        FieldByName('MONTO_SIG_PAGO_EXIGIBLE').DisplayWidth := 30;
        FieldByName('TIPO_PROX_PAGO_EX').DisplayWidth := 15;

        TNumericField(FieldByName('CREDITO')).DisplayFormat:= '###';
        TNumericField(FieldByName('MONTO_AUTORIZADO')).DisplayFormat:= '###,###,###,###,###,##0.00';
        TNumericField(FieldByName('SALDO_PRINCIPAL')).DisplayFormat:= '###,###,###,###,###,##0.00';
        TNumericField(FieldByName('MONTO_SIG_PAGO_EXIGIBLE')).DisplayFormat:= '###,###,###,###,###,##0.00';

//        TDateField(FieldByName('F_AUTORIZACION')).DisplayFormat:= 'YYYY-MM-DD';
//        TNumericField(FieldByName('TIPO_PROX_PAGO_EX')).DisplayFormat:= '###0.0000';
        sgDatos.addQry( qDatos, True, True, -1, -1, -1, True );
      end
      else
        sgDatos.Clear('NO EXISTEN DATOS'#30'>C');
    finally
      Close;
    end;
  end;
end;
//*  MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMW  *//
//                                                                            //
//   P R O C E D I M I E N T O S    TINTERFRAME                               //
//                                                                            //
//*  MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMW  *//

//  ************************************************************************  //
//  Parametros Iniciales de InterFrame
//  ************************************************************************  //
constructor TRepCre50M.Create( AOwner : TComponent );
begin
  Inherited;
  StpName  := ' ';
  UseQuery := False;
  HelpFile := '';
  ShowMenuReporte:=True;
end;

//  ************************************************************************  //
//  Creación de la forma WRepCre50M
//  Configuración de parametros iniciales
//  Visualización y destrucción de la forma
//  ************************************************************************  //
function TRepCre50M.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var
  W : TWRepCre50M;
begin
  W:=TWRepCre50M.Create(Self);
  try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo :=ftConsulta; //ftImprimir;//FIJA EL TIPO DE FORMA
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

//  ************************************************************************  //
//  Sin Funcionalidad
//  ************************************************************************  //
destructor TRepCre50M.Destroy;
begin
   inherited;
end;


//*  MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMW  *//
//                                                                            //
//   P R O C E D I M I E N T O S    F O R M A    TWREPCRE50M                  //
//                                                                            //
//*  MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMW  *//


//  ************************************************************************  //
//  Visualización de Empresa, Fecha, Usuario y Perfil al momento de
//  Mostrar la forma.
//  ************************************************************************  //
procedure TWRepCre50M.FormShow(Sender: TObject);
var
creditosg: String;
creditosi: String;
ccreditos: String;
begin
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

  qDatos.DataBaseName:= Objeto.Apli.DataBaseName;
  qDatos.SessionName := Objeto.Apli.SessionName;
  qDatos.SQL.Clear;
  creditosg :=
' select CREDITO, ' +coCRLF+
' RFC_DEUDOR, ' +coCRLF+
' NOMBRE as NOMBRE_DEUDOR, ' +coCRLF+
' DESC_GPO as NOMBRE_GPO_ECONOMICO, ' +coCRLF+
' F_AUTORIZA as F_AUTORIZACION, ' +coCRLF+
' F_VENCIMIENTO, ' +coCRLF+
' trunc (decode (cve_moneda, 484, IMP_AUTORIZADO, 840, (IMP_AUTORIZADO * :TipoCambio) ) ) as MONTO_AUTORIZADO, ' +coCRLF+
' trunc (decode (cve_moneda, 484, SDO_INSOLUTO, 840, (SDO_INSOLUTO * :TipoCambio) ) ) as SALDO_PRINCIPAL, ' +coCRLF+
' SITUACION, ' +coCRLF+
' nvl (TIPO_TASA, ''N/A'') as TIPO_TASA, ' +coCRLF+
' nvl (to_char (Fech_PAgo, ''YYYY-MM-DD''), ''N/A'') as FECH_PAGO, ' +coCRLF+
' nvl (trunc (decode (CVE_MONEDA, 484, Monto_Sig_PAgo_EXIGIBLE, 840, Monto_Sig_PAgo_EXIGIBLE * :TipoCambio) ), 0) as MONTO_SIG_PAGO_EXIGIBLE, ' +coCRLF+
' TIPO_PROX_PAGO_EX ' +coCRLF+
' from (select CREDITO, ' +coCRLF+
' CVE_MONEDA, ' +coCRLF+
' RFC_DEUDOR, ' +coCRLF+
' NOMBRE, ' +coCRLF+
' decode (DESC_GPO, ''SIN GRUPO'', NOMBRE, ''SIN GRUPO DE RIESGO COMÚN'', NOMBRE, DESC_GPO) as DESC_GPO, ' +coCRLF+
' to_char (F_AUTORIZA, ''YYYY-MM-DD'') as F_AUTORIZA, ' +coCRLF+
' to_char (F_VENCIMIENTO, ''YYYY-MM-DD'') as F_VENCIMIENTO, ' +coCRLF+
' IMP_AUTORIZADO, ' +coCRLF+
' SDO_INSOLUTO, ' +coCRLF+
' SITUACION, ' +coCRLF+
' TIPO_TASA, ' +coCRLF+
' IMP_CESION_INT, ' +coCRLF+
' to_char (F_VENC_CAP, ''YYYY-MM-DD'') as F_VENC_CAP, ' +coCRLF+
' IMP_CAPITAL, ' +coCRLF+
' F_VENTO_INT, ' +coCRLF+
' IMP_INT_PROY, ' +coCRLF+
' IMP_CESION, ' +coCRLF+
' FEC_VEN_CESION, ' +coCRLF+
' case ' +coCRLF+
' when ((F_PAGO_ANT_CAP < F_VENC_CAP) and (F_PAGO_ANT_CAP < to_date (:FechaRep, ''DD/MM/YYYY''))) or ((F_PAGO_ANT_INT < F_VENTO_INT) and (F_PAGO_ANT_INT < to_date (:FechaRep, ''DD/MM/YYYY''))) then null ' +coCRLF+
' when F_VENC_CAP > F_VENTO_INT THEN F_VENTO_INT ' +coCRLF+
' when F_VENC_CAP < F_VENTO_INT THEN F_VENC_CAP ' +coCRLF+
' when F_VENC_CAP = F_VENTO_INT THEN F_VENC_CAP ' +coCRLF+
' else FEC_VEN_CESION ' +coCRLF+
' end as FECH_PAGO, ' +coCRLF+
' case ' +coCRLF+
' when F_VENC_CAP > F_VENTO_INT THEN IMP_INT_PROY ' +coCRLF+
' when F_VENC_CAP < F_VENTO_INT THEN IMP_CAPITAL ' +coCRLF+
' when F_VENC_CAP = F_VENTO_INT THEN IMP_CAPITAL+IMP_INT_PROY ' +coCRLF+
' else IMP_CESION ' +coCRLF+
' end as Monto_Sig_PAgo_EXIGIBLE, ' +coCRLF+
' case ' +coCRLF+
' when (F_VENC_CAP = F_VENTO_INT) then 3 ' +coCRLF+
' when (F_VENTO_INT is null) then 1 ' +coCRLF+
' when (F_VENC_CAP is null) then 2 ' +coCRLF+
' when (F_VENC_CAP > F_VENTO_INT) then 2 ' +coCRLF+
' when (F_VENC_CAP < F_VENTO_INT) then 1 ' +coCRLF+
' end as Tipo_Prox_Pago_Ex ' +coCRLF+
' from (select CREDITO, ' +coCRLF+
' CVE_MONEDA, ' +coCRLF+
' SIGLAS_RFC || F_RFC || ''-'' || HOMOCLAVE_RFC as RFC_Deudor, ' +coCRLF+
' PERSONA.NOMBRE, ' +coCRLF+
' DESC_GPO, ' +coCRLF+
' F_AUTORIZA, ' +coCRLF+
' DATOS.F_VENCIMIENTO, ' +coCRLF+
' IMP_AUTORIZADO, ' +coCRLF+
' trunc (SDO_INSOLUTO) as SDO_INSOLUTO, ' +coCRLF+
' decode (F_TRASPASO_VENC, null, ''1'', ''2'') as SITUACION, ' +coCRLF+
' decode (CVE_TASA, ''FIJA'', ''1'', ''2'') as TIPO_TASA, ' +coCRLF+
' (select F_VENCIMIENTO ' +coCRLF+
' from (select cr_capital.ID_CREDITO, ' +coCRLF+
' CR_CAPITAL.F_VENCIMIENTO ' +coCRLF+
' from cr_capital, ' +coCRLF+
' cr_cesion ' +coCRLF+
' where cr_capital.id_credito = cr_cesion.ID_CESION ' +coCRLF+
' and cr_capital.F_VENCIMIENTO = ' +coCRLF+
' (select min (F_VENCIMIENTO) ' +coCRLF+
' from cr_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and SIT_capital in (''AC'') ' +coCRLF+
' and cr_capital.id_credito = cr_cesion.ID_CESION) ' +coCRLF+
' and sit_cesion <> ''CA'' ' +coCRLF+
' and sit_capital in (''AC'') ) ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' union ' +coCRLF+
' select F_VENCIMIENTO ' +coCRLF+
' from (select cre_capital.ID_CREDITO, ' +coCRLF+
' CRE_CAPITAL.F_VENCIMIENTO ' +coCRLF+
' from crE_capital, ' +coCRLF+
' crE_cesion ' +coCRLF+
' where cre_capital.id_credito = cre_cesion.ID_CESION ' +coCRLF+
' and crE_capital.F_VENCIMIENTO = ' +coCRLF+
' (select min (F_VENCIMIENTO) ' +coCRLF+
' from cre_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and SIT_capital in (''AC'') ' +coCRLF+
' and crE_capital.id_credito = crE_cesion.ID_CESION) ' +coCRLF+
' and sit_cesion <> ''CA'' ' +coCRLF+
' and sit_capital in (''AC'') ) ' +coCRLF+
' where ID_CREDITO = CREDITO) as FEC_VEN_CESION, ' +coCRLF+
' nvl ( (select imp_cesion ' +coCRLF+
' from (select cr_capital.ID_CREDITO, ' +coCRLF+
' nvl (sum (cr_capital.imp_capital), 0) as imp_cesion ' +coCRLF+
' from cr_capital, ' +coCRLF+
' cr_cesion ' +coCRLF+
' where cr_capital.id_credito = cr_cesion.ID_CESION ' +coCRLF+
' and cr_capital.F_VENCIMIENTO = ' +coCRLF+
' (select min (F_VENCIMIENTO) ' +coCRLF+
' from cr_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and SIT_capital in (''AC'') ' +coCRLF+
' and cr_capital.id_credito = cr_cesion.ID_CESION) ' +coCRLF+
' and sit_cesion <> ''CA'' ' +coCRLF+
' and sit_capital in (''AC'') ' +coCRLF+
' group by ID_CREDITO) ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' union ' +coCRLF+
' select imp_cesion ' +coCRLF+
' from (select cre_capital.ID_CREDITO, ' +coCRLF+
' nvl (sum (cre_capital.imp_capital), 0) as imp_cesion ' +coCRLF+
' from crE_capital, ' +coCRLF+
' crE_cesion ' +coCRLF+
' where cre_capital.id_credito = cre_cesion.ID_CESION ' +coCRLF+
' and crE_capital.F_VENCIMIENTO = ' +coCRLF+
' (select min (F_VENCIMIENTO) ' +coCRLF+
' from cre_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and SIT_capital in (''AC'') ' +coCRLF+
' and crE_capital.id_credito = crE_cesion.ID_CESION) ' +coCRLF+
' and sit_cesion <> ''CA'' ' +coCRLF+
' and sit_capital in (''AC'') ' +coCRLF+
' group by ID_CREDITO) ' +coCRLF+
' where ID_CREDITO = CREDITO), ' +coCRLF+
' 0) as IMP_CESION, ' +coCRLF+
' nvl ( (select imp_cesion_Int ' +coCRLF+
' from (select cr_interes.ID_CREDITO, ' +coCRLF+
' nvl (sum (cr_interes.IMP_INTERES_PROY), 0) as imp_cesion_Int ' +coCRLF+
' from cr_interes, ' +coCRLF+
' cr_cesion ' +coCRLF+
' where cr_interes.id_credito = cr_cesion.ID_CESION ' +coCRLF+
' and cr_interes.F_VENCIMIENTO = ' +coCRLF+
' (select min (F_VENCIMIENTO) ' +coCRLF+
' from cr_interes ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and SIT_interes in (''AC'') ' +coCRLF+
' and cr_INTERES.id_credito = cr_cesion.ID_CESION) ' +coCRLF+
' and sit_cesion <> ''CA'' ' +coCRLF+
' and SIT_interes in (''AC'') ' +coCRLF+
' group by ID_CREDITO) ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' union ' +coCRLF+
' select imp_cesion_Int ' +coCRLF+
' from (select ID_CREDITO, ' +coCRLF+
' nvl (sum (cre_interes.IMP_INTERES_PROY), 0) as imp_cesion_Int ' +coCRLF+
' from crE_Interes, ' +coCRLF+
' crE_cesion ' +coCRLF+
' where crE_Interes.id_credito = crE_cesion.ID_CESION ' +coCRLF+
' and cre_interes.F_VENCIMIENTO = ' +coCRLF+
' (select min (F_VENCIMIENTO) ' +coCRLF+
' from cre_interes ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and SIT_interes in (''AC'') ' +coCRLF+
' and crE_INTERES.id_credito = cre_cesion.ID_CESION) ' +coCRLF+
' and sit_cesion <> ''CA'' ' +coCRLF+
' and SIT_interes in (''AC'') ' +coCRLF+
' group by ID_CREDITO) ' +coCRLF+
' where ID_CREDITO = CREDITO), ' +coCRLF+
' 0) as IMP_CESION_Int, ' +coCRLF+
' (select F_vencimiento ' +coCRLF+
' from cr_INTERES ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from cr_INTERES ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_INTERES in (''AC'') ' +coCRLF+
' group by id_credito) ' +coCRLF+
' union ' +coCRLF+
' select F_vencimiento ' +coCRLF+
' from cre_INTERES ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from crE_INTERES ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_INTERES in (''AC'') ' +coCRLF+
' group by id_credito) ) as F_VENTO_INT, ' +coCRLF+
' (select F_VALOR_PAGO ' +coCRLF+
' from cr_INTERES ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from cr_INTERES ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_INTERES in (''AC'') ' +coCRLF+
' group by id_credito) ' +coCRLF+
' union ' +coCRLF+
' select F_PAGO ' +coCRLF+
' from cre_INTERES ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from crE_INTERES ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_INTERES in (''AC'') ' +coCRLF+
' group by id_credito) ) as F_PAGO_ANT_INT, ' +coCRLF+
' (select IMP_INTERES_PROY ' +coCRLF+
' from cr_INTERES ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from cr_INTERES ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_INTERES in (''AC'') ' +coCRLF+
' group by id_credito) ' +coCRLF+
' union ' +coCRLF+
' select IMP_INTERES_PROY ' +coCRLF+
' from cre_INTERES ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from crE_INTERES ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_INTERES in (''AC'') ' +coCRLF+
' group by id_credito) ) as IMP_INT_PROY, ' +coCRLF+
' (select F_vencimiento ' +coCRLF+
' from cr_capital ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from cr_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_CAPITAL in (''AC'') ' +coCRLF+
' group by id_credito) ' +coCRLF+
' union ' +coCRLF+
' select F_vencimiento ' +coCRLF+
' from cre_capital ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from crE_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_CAPITAL in (''AC'') ' +coCRLF+
' group by id_credito) ) as F_VENC_CAP, ' +coCRLF+
' (select F_VALOR_PAGO ' +coCRLF+
' from cr_capital ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from cr_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_CAPITAL in (''AC'') ' +coCRLF+
' group by id_credito) ' +coCRLF+
' union ' +coCRLF+
' select F_PAGO ' +coCRLF+
' from cre_capital ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from crE_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_CAPITAL in (''AC'') ' +coCRLF+
' group by id_credito) ) as F_PAGO_ANT_CAP, ' +coCRLF+
' (select imp_capital - imp_pagado ' +coCRLF+
' from cr_capital ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from cr_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and sit_capital in (''AC'') ' +coCRLF+
' group by id_credito) ' +coCRLF+
' union ' +coCRLF+
' select imp_capital - imp_pagado ' +coCRLF+
' from cre_capital ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from crE_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_CAPITAL in (''AC'') ' +coCRLF+
' group by id_credito) ) as IMP_CAPITAL ' +coCRLF+
' from (select CRE.F_TRASPASO_VENC as F_TRASPASO_VENC, ' +coCRLF+
' CTO.ID_EMPRESA as EMPRESA, ' +coCRLF+
' CRP.CVE_GPO_INGRESO as PRODUCTO_GPO, ' +coCRLF+
' CCTO.ID_CONTRATO as CONTRATO, ' +coCRLF+
' CRE.ID_CREDITO as CREDITO, ' +coCRLF+
' substr (CSB.CVE_SUB_TIP_BCO, 1, 6) as PRODUCTO, ' +coCRLF+
' substr (CSB.DESC_SUB_TIPO, 1, 80) as DESC_PROD, ' +coCRLF+
' decode (CRE.TIPO_DISPOSICION, ''RN'', CTA_RENOVACION, CTC.TIPO_CUENTA || ''-'' || substr (CSC.CTA_CONTABLE, 1, 4) || ''-'' || substr (CSC.CTA_CONTABLE, 5, 7) ) as CTA_ORIGEN, ' +coCRLF+
' CRE.F_AUT_OPERACION as F_AUTORIZA, ' +coCRLF+
' CRE.F_VALOR_CRED + CRE.DIAS_PLAZO as F_VENCIMIENTO, ' +coCRLF+
' CRE.CVE_TASA_REFER as CVE_TASA, ' +coCRLF+
' CRE.OPERADOR_STASA as OPERADOR_STASA, ' +coCRLF+
' CRE.SOBRETASA as SOBRETASA, ' +coCRLF+
' CCTO.IMP_AUTORIZADO as IMP_AUTORIZADO, ' +coCRLF+
' CRE.SDO_INSOLUTO as SDO_VIG_TOTAL, ' +coCRLF+
' '' '' as CVE_FND_ENT_DES, ' +coCRLF+
' 0 as PCT_REDESCONTADO, ' +coCRLF+
' '' '' as OPE_STASA_FND, ' +coCRLF+
' 0 as SOBRETASA_FND, ' +coCRLF+
' CCM.CVE_CAT_MIN as CAT_MINIMO, ' +coCRLF+
' CCM.DESC_CAT_MIN as DESC_CAT_MINIMO, ' +coCRLF+
' CTO.CVE_MONEDA as CVE_MONEDA, ' +coCRLF+
' MON.DESC_MONEDA as DESC_MONEDA, ' +coCRLF+
' CAC.CVE_GRUPO as CVE_GRUPO, ' +coCRLF+
' CGE.DESC_GRUPO as DESC_GPO, ' +coCRLF+
' CTO.ID_TITULAR as TITULAR, ' +coCRLF+
' substr (PKGCRCONSOLIDADO.FUN_NOM_TIT_CRED (CTO.ID_TITULAR), 1, 80) as NOMBRE, ' +coCRLF+
' CSB.CVE_SUB_TIP_BCO as SUB_TIP_BCO, ' +coCRLF+
' CRE.TIPO_DISPOSICION as TIPO_DISP, ' +coCRLF+
' CTC.TIPO_CUENTA as TIPO_CTA, ' +coCRLF+
' CTO.ID_PERS_ASOCIAD as ID_PROM_ASOC, ' +coCRLF+
' ASO.NOMBRE as PROM_ASOC, ' +coCRLF+
' CRE.ID_PROM_ADM as ID_PROM_ADM, ' +coCRLF+
' ADM.NOMBRE as PROM_ADM, ' +coCRLF+
' CRP.CVE_PRESUPUESTO as CVE_MERC_OBJ, ' +coCRLF+
' CRP.DESC_PRESUPUESTO as MERCADO_OBJ, ' +coCRLF+
' CAS.IMP_CAP_VIG as VIGENTE_CP, ' +coCRLF+
' CAS.IMP_CAP_VDO_NE as NOEXIGIBLE_CP, ' +coCRLF+
' CAS.IMP_CAP_IMP as IMPAGADO_CP, ' +coCRLF+
' CAS.IMP_CAP_VDO_EX as EXIGIBLE_CP, ' +coCRLF+
' (CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX) as SDO_INSOLUTO, ' +coCRLF+
' CAS.IMP_INT_VIG as VIGENTE_IN, ' +coCRLF+
' CAS.IMP_INT_IMP as IMPAGADO_IN, ' +coCRLF+
' CAS.IMP_INT_VDO_EX as EXIGIBLE_IN, ' +coCRLF+
' CAS.IMP_CTAS_ORD as CTA_ORD_IN, ' +coCRLF+
' 0 as MORATORIOS, ' +coCRLF+
' 0 as IMP_OTROS, ' +coCRLF+
' (CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX + CAS.IMP_INT_VIG + CAS.IMP_INT_IMP + CAS.IMP_INT_VDO_EX + CAS.IMP_CTAS_ORD) as TOT_ADEUDO, ' +coCRLF+
' (select TASA_APLICADA ' +coCRLF+
' from CRE_INTERES ' +coCRLF+
' where ID_CREDITO = CAS.ID_CREDITO and NUM_PERIODO = (select max (NUM_PERIODO) ' +coCRLF+
' from CRE_INTERES ' +coCRLF+
' where ID_CREDITO = CAS.ID_CREDITO and SIT_INTERES in (''AC'', ''IM'') ) ) as TASA_TOTAL, ' +coCRLF+
' 0 as VALOR_TASA, ' +coCRLF+
' 0 as TASA_FND_TOT ' +coCRLF+
' from CR_CON_ADEUDO_SDO CAS, ' +coCRLF+
' CRE_CREDITO CRE, ' +coCRLF+
' CONTRATO CTO, ' +coCRLF+
' CRE_CLIENTE CAC, ' +coCRLF+
' MONEDA MON, ' +coCRLF+
' CRE_GRUPO_EMPR CGE, ' +coCRLF+
' CRE_TIPO_CREDITO CTC, ' +coCRLF+
' CRE_CAT_MINIMO CCM, ' +coCRLF+
' CRE_CONTRATO CCTO, ' +coCRLF+
' CRE_SUB_TIP_BCO CSB, ' +coCRLF+
' CRE_SUB_TIP_CNBV CSC, ' +coCRLF+
' CRE_GPO_INGRESO CPG, ' +coCRLF+
' CRE_PRESUPUESTO CRP, ' +coCRLF+
' PERSONA ASO, ' +coCRLF+
' PERSONA ADM ' +coCRLF+
' where CTO.ID_EMPRESA = 2 ' +coCRLF+
' and CAS.F_CIERRE = to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' and (CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX) > 0 ' +coCRLF+
' and ( (CSB.F_TRASPASO_ICRE is not null and CRE.SIT_CREDITO not in (''TA'') ) ' +coCRLF+
' or CSB.F_TRASPASO_ICRE is null) ' +coCRLF+
' and CRE.ID_CREDITO = CAS.ID_CREDITO ' +coCRLF+
' and CCTO.ID_CONTRATO = CRE.ID_CONTRATO ' +coCRLF+
' and CSB.CVE_SUB_TIP_BCO = CCTO.CVE_SUB_TIP_BCO ' +coCRLF+
' and CCM.CVE_CAT_MIN = CCTO.CVE_CAT_MIN ' +coCRLF+
' and MON.CVE_MONEDA = CTO.CVE_MONEDA ' +coCRLF+
' and CTO.ID_CONTRATO = CCTO.ID_CONTRATO ' +coCRLF+
' and CAC.ID_PERSONA = CTO.ID_TITULAR ' +coCRLF+
' and CGE.CVE_GRUPO = CAC.CVE_GRUPO ' +coCRLF+
' and CSB.CVE_SUB_TIP_CNBV = CSC.CVE_SUB_TIP_CNBV ' +coCRLF+
' and CTC.CVE_TIPO_CREDITO = CSC.CVE_TIPO_CREDITO ' +coCRLF+
' and CPG.CVE_GPO_INGRESO = CRP.CVE_GPO_INGRESO ' +coCRLF+
' and CRP.CVE_PRESUPUESTO = CRE.CVE_PRESUPUESTO ' +coCRLF+
' and CTO.ID_PERS_ASOCIAD = ASO.ID_PERSONA(+) ' +coCRLF+
' and CRE.ID_PROM_ADM = ADM.ID_PERSONA(+) ' +coCRLF+
' union all ' +coCRLF+
' select CRE.F_TRASPASO_VENC as F_TRASPASO_VENC, ' +coCRLF+
' CTO.ID_EMPRESA as EMPRESA, ' +coCRLF+
' CPR.CVE_PRODUCTO_GPO as PRODUCTO_GPO, ' +coCRLF+
' CCTO.ID_CONTRATO as CONTRATO, ' +coCRLF+
' CRE.ID_CREDITO as CREDITO, ' +coCRLF+
' CCTO.CVE_PRODUCTO_CRE as PRODUCTO, ' +coCRLF+
' CPR.DESC_L_PRODUCTO as DESC_PROD, ' +coCRLF+
' substr (PKGCRCONSOLIDADO.FUN_CR_CTASCONTAB (CTO.ID_EMPRESA, CCTO.CVE_MONEDA, CCTO.CVE_PRODUCTO_CRE, ''CI''), 1, 30) CTA_ORIGEN, ' +coCRLF+
' CRE.F_AUTORIZA as F_AUTORIZA, ' +coCRLF+
' CRE.F_VENCIMIENTO as F_VENCIMIENTO, ' +coCRLF+
' CRE.CVE_TASA_REFER as CVE_TASA, ' +coCRLF+
' CRE.OPERADOR_STASA as OPERADOR_STASA, ' +coCRLF+
' CRE.SOBRETASA as SOBRETASA, ' +coCRLF+
' CCTO.IMP_AUTORIZADO as IMP_AUTORIZADO, ' +coCRLF+
' nvl (CFN.SDO_VIG_TOTAL, 0) as SDO_VIG_TOTAL, ' +coCRLF+
' CFN.CVE_FND_ENT_DES, ' +coCRLF+
' nvl (PCT_REDESCONTADO, 0) as PCT_REDESCONTADO, ' +coCRLF+
' CFN.OPERADOR_STASA as OPE_STASA_FND, ' +coCRLF+
' CFN.SOBRETASA as SOBRETASA_FND, ' +coCRLF+
' CCM.CVE_CAT_MINIMO as CAT_MINIMO, ' +coCRLF+
' CCM.DESC_CAT_MINIMO as DESC_CAT_MINIMO, ' +coCRLF+
' CCTO.CVE_MONEDA as CVE_MONEDA, ' +coCRLF+
' MON.DESC_MONEDA as DESC_MONEDA, ' +coCRLF+
' CAC.CVE_GRUPO_ECO as CVE_GRUPO, ' +coCRLF+
' CGE.DESC_GRUPO_ECO as DESC_GRUPO, ' +coCRLF+
' CTO.ID_TITULAR as TITULAR, ' +coCRLF+
' substr (PKGCRCONSOLIDADO.FUN_NOM_TIT_CRED (CTO.ID_TITULAR), 1, 80) NOMBRE, ' +coCRLF+
' CPS.CVE_SUB_TIP_BCO as SUB_TIP_BCO, ' +coCRLF+
' CRE.TIPO_DISPOSICION as TIPO_DISP, ' +coCRLF+
' CPR.CVE_TIPO_CRED_BC as TIPO_CTA, ' +coCRLF+
' CTO.ID_PERS_ASOCIAD as ID_PROM_ASOC, ' +coCRLF+
' ASO.NOMBRE as PROM_ASOC, ' +coCRLF+
' CRE.ID_PROM_ADM as ID_PROM_ADM, ' +coCRLF+
' ADM.NOMBRE as PROM_ADM, ' +coCRLF+
' CRP.CVE_PRESUPUESTO as CVE_MERC_OBJ, ' +coCRLF+
' CRP.DESC_PRESUPUESTO as MERCADO_OBJ, ' +coCRLF+
' CAS.IMP_CAP_VIG as VIGENTE_CP, ' +coCRLF+
' CAS.IMP_CAP_VDO_NE as NOEXIGIBLE_CP, ' +coCRLF+
' CAS.IMP_CAP_IMP as IMPAGADO_CP, ' +coCRLF+
' CAS.IMP_CAP_VDO_EX as EXIGIBLE_CP, ' +coCRLF+
' (CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX) as SDO_INSOLUTO, ' +coCRLF+
' CAS.IMP_INT_VIG as VIGENTE_IN, ' +coCRLF+
' CAS.IMP_INT_IMP as IMPAGADO_IN, ' +coCRLF+
' CAS.IMP_INT_VDO_EX as EXIGIBLE_IN, ' +coCRLF+
' CAS.IMP_CTAS_ORD as CTA_ORD_IN, ' +coCRLF+
' 0 as MORATORIOS, ' +coCRLF+
' 0 as IMP_OTROS, ' +coCRLF+
' (CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX + CAS.IMP_INT_VIG + CAS.IMP_INT_IMP + CAS.IMP_INT_VDO_EX + CAS.IMP_CTAS_ORD) as TOT_ADEUDO, ' +coCRLF+
' (select TASA_APLICADA ' +coCRLF+
' from CR_INTERES ' +coCRLF+
' where ID_CREDITO = CAS.ID_CREDITO and NUM_PERIODO = (select max (NUM_PERIODO) ' +coCRLF+
' from CR_INTERES ' +coCRLF+
' where ID_CREDITO = CAS.ID_CREDITO and SIT_INTERES in (''AC'', ''IM'') ) ) as TASA_TOTAL, ' +coCRLF+
' 0 as VALOR_TASA, ' +coCRLF+
' (select TASA_APLICADA ' +coCRLF+
' from CR_FND_INTERES ' +coCRLF+
' where ID_CREDITO = CAS.ID_CREDITO and NUM_PERIODO = (select max (NUM_PERIODO) ' +coCRLF+
' from CR_FND_INTERES ' +coCRLF+
' where ID_CREDITO = CAS.ID_CREDITO and SIT_INTERES in (''AC'', ''IM'') ) ) as TASA_FND_TOT ' +coCRLF+
' from CR_CON_ADEUDO_SDO CAS, ' +coCRLF+
' CR_CREDITO CRE, ' +coCRLF+
' CR_CONTRATO CCTO, ' +coCRLF+
' CR_PRODUCTO CPR, ' +coCRLF+
' CR_PROD_SUB_TIPO CPS, ' +coCRLF+
' CR_FND_CREDITO CFN, ' +coCRLF+
' CONTRATO CTO, ' +coCRLF+
' CR_ACREDITADO CAC, ' +coCRLF+
' MONEDA MON, ' +coCRLF+
' CR_GRUPO_ECO CGE, ' +coCRLF+
' CR_CAT_MINIMO CCM, ' +coCRLF+
' CRE_PRESUPUESTO CRP, ' +coCRLF+
' PERSONA ASO, ' +coCRLF+
' PERSONA ADM ' +coCRLF+
' where CTO.ID_EMPRESA = 2 ' +coCRLF+
' and CAS.F_CIERRE = to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' and (CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX) > 0 ' +coCRLF+
' and CRE.ID_CREDITO = CAS.ID_CREDITO ' +coCRLF+
' and CCTO.ID_CONTRATO = CRE.ID_CONTRATO ' +coCRLF+
' and CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE ' +coCRLF+
' and CFN.ID_CREDITO(+) = CRE.ID_CREDITO ' +coCRLF+
' and CCM.CVE_CAT_MINIMO = CPR.CVE_CLAS_CONTAB ' +coCRLF+
' and MON.CVE_MONEDA = CCTO.CVE_MONEDA ' +coCRLF+
' and CTO.ID_CONTRATO = CCTO.ID_CONTRATO ' +coCRLF+
' and CAC.ID_ACREDITADO = CTO.ID_TITULAR ' +coCRLF+
' and CGE.CVE_GRUPO_ECO = CAC.CVE_GRUPO_ECO ' +coCRLF+
' and CPR.CVE_PRODUCTO_CRE = CPS.CVE_PRODUCTO_CRE ' +coCRLF+
' and CRP.CVE_PRESUPUESTO = CPR.CVE_PRESUPUESTO ' +coCRLF+
' and CTO.ID_PERS_ASOCIAD = ASO.ID_PERSONA(+) ' +coCRLF+
' and CRE.ID_PROM_ADM = ADM.ID_PERSONA(+) ' +coCRLF+
' and CPR.CVE_PRODUCTO_CRE = CPS.CVE_PRODUCTO_CRE) DATOS, ' +coCRLF+
' PERSONA, ' +coCRLF+
' RFC ' +coCRLF+
' where 1 = 1 ' +coCRLF+
' and PERSONA.ID_PERSONA = DATOS.TITULAR ' +coCRLF+
' and RFC.ID_PERSONA(+) = PERSONA.ID_PERSONA ' +coCRLF+
' and CVE_GRUPO in ( ' +coCRLF+
' select RESULTADO.CVE_GRUPO_ECO ' +coCRLF+
' from ( ' +coCRLF+
' --> Obtiene el saldo insoluto por grupo economico ' +coCRLF+
' select GRUPO.CVE_GRUPO_ECO, ' +coCRLF+
' sum (SDO_INSOLUTO) as SUM_SDO_INSOLUTO ' +coCRLF+
' from (select CCAC.CVE_GRUPO_ECO, ' +coCRLF+
' CVE_MONEDA, ' +coCRLF+
' CCAS.SDO_INSOLUTO ' +coCRLF+
' from (select CCAS.ID_CREDITO, ' +coCRLF+
' (CCAS.IMP_CAP_VIG + CCAS.IMP_CAP_VDO_NE + CCAS.IMP_CAP_IMP + CCAS.IMP_CAP_VDO_EX) as SDO_INSOLUTO ' +coCRLF+
' from CR_CON_ADEUDO_SDO CCAS ' +coCRLF+
' where CCAS.F_CIERRE = to_date (:FechaRep, ''DD/MM/YYYY'') ) CCAS, ' +coCRLF+
' CR_CON_ADEU_CLTV CCAC, ' +coCRLF+
' persona p ' +coCRLF+
' where CCAC.ID_CREDITO = CCAS.ID_CREDITO ' +coCRLF+
' and CCAC.ID_REG_VIGENTE = 1 ' +coCRLF+
' and p.id_persona = ccac.id_acreditado ' +coCRLF+
' and p.cve_tipo_sector not in (''11'', ''14'') ' +coCRLF+
' and ccac.cve_grupo_eco not in (''0'', ''5190'') ' +coCRLF+
' and ( ' +coCRLF+
' regexp_like (ccac.CVE_CAT_MINIMO, ''^1301050'') or ' +coCRLF+
' regexp_like (ccac.CVE_CAT_MINIMO, ''^1301060'') or ' +coCRLF+
' regexp_like (ccac.CVE_CAT_MINIMO, ''^1301210|^7100000'') or ' +coCRLF+
' regexp_like (ccac.CVE_CAT_MINIMO, ''^7300000'')) ' +coCRLF+
' ) GRUPO ' +coCRLF+
' group by GRUPO.CVE_GRUPO_ECO, ' +coCRLF+
' GRUPO.CVE_MONEDA ' +coCRLF+
' having decode (CVE_MONEDA, 484, sum (SDO_INSOLUTO), 840, (sum (SDO_INSOLUTO) * :TipoCambio) ) between :inf and :sup) RESULTADO ' +coCRLF+
' union ' +coCRLF+
' -- Filtra todas las cartas para aquellos Grupos Económicos que rebasen los 50 millones ' +coCRLF+
' select CARTAS1.CVE_GRUPO_ECO ' +coCRLF+
' from (select CVE_GRUPO_ECO, ' +coCRLF+
' sum (round (CARTAS.SALDO_CCI * CARTAS.TIPO_CAMBIO, 2) ) as SUM_SDO_GPO_ECO ' +coCRLF+
' from (select GPE.CVE_GRUPO_ECO, ' +coCRLF+
' CCC1.ID_CREDITO as CREDITO, ' +coCRLF+
' (SIGLAS_RFC || F_RFC || ''-'' || HOMOCLAVE_RFC) as RFC_DEUDOR, ' +coCRLF+
' P.NOMBRE as NOMBRE_DEUDOR, ' +coCRLF+
' decode (GPE.DESC_GRUPO_ECO, ''SIN GRUPO'', P.NOMBRE, GPE.DESC_GRUPO_ECO) as NOMBRE_GPO_ECONOMICO, ' +coCRLF+
' CCC1.F_DISPOSICION as F_AUTORIZACION, ' +coCRLF+
' CCC1.F_VENCIMIENTO, ' +coCRLF+
' P.ID_PERSONA as ID_ACREDITADO, ' +coCRLF+
' CCC1.CVE_IDENTIF_CNBV, ' +coCRLF+
' CCC1.ID_CONTRATO, ' +coCRLF+
' decode (CTO.CVE_MONEDA, 484, 1, 840, :TipoCambio, PKGCORPO.OBTTIPOCAMBIO (to_date (:FechaRep, ''DD/MM/YYYY''), CTO.CVE_MONEDA, ''V'') ) as TIPO_CAMBIO, ' +coCRLF+
' CTO.CVE_MONEDA, ' +coCRLF+
' CCC1.IMP_CREDITO, ' +coCRLF+
' PCT_ADICIONAL, ' +coCRLF+
' CCC1.IMP_CREDITO + round (CCC1.IMP_CREDITO * CCC1.PCT_ADICIONAL / 100, 2) as IMP_TOTAL_CCI, ' +coCRLF+
' (CCC1.F_VENCIMIENTO - CCC1.F_DISPOSICION) as DIAS_PLAZO, ' +coCRLF+
' nvl (CCI_TRANSAC.SUM_IMP_CONCEPTO, 0) as IMP_DISMINUIDO, ' +coCRLF+
' CCC1.IMP_CREDITO + round (CCC1.IMP_CREDITO * CCC1.PCT_ADICIONAL / 100, 2) + nvl (CCI_TRANSAC.SUM_IMP_CONCEPTO, 0) as SALDO_CCI, ' +coCRLF+
' CCC1.B_OPER_CORRE_FOR, ' +coCRLF+
' CCC1.B_EXP_CRED_COMP, ' +coCRLF+
' CCC1.CVE_INF_RECUPERA ' +coCRLF+
' from ( -- Obtiene las cartas de crédito Vigentes ' +coCRLF+
' select CCC.CVE_IDENTIF_CNBV, ' +coCRLF+
' CCC.ID_CONTRATO, ' +coCRLF+
' CCC.ID_CREDITO, ' +coCRLF+
' CCC.IMP_CREDITO, ' +coCRLF+
' nvl (CCC.PCT_ADICIONAL, 0) as PCT_ADICIONAL, ' +coCRLF+
' CCC.F_DISPOSICION, ' +coCRLF+
' CCC.F_VENCIMIENTO, ' +coCRLF+
' CCC.IMP_GARANTIA, ' +coCRLF+
' CCC.DESC_GTIA_ADIC, ' +coCRLF+
' CCC.B_OPER_CORRE_FOR, ' +coCRLF+
' CCC.B_EXP_CRED_COMP, ' +coCRLF+
' CCC.CVE_INF_RECUPERA ' +coCRLF+
' from ADMIPROD.CR_CON_REG_CCI CCC ' +coCRLF+
' where CCC.ID_REG_VIGENTE = 1 ' +coCRLF+
' and ( ' +coCRLF+
' (CCC.F_DISPOSICION <= to_date (:FechaRep, ''DD/MM/YYYY'') and CCC.SIT_CON_REG_CCI = ''AC'') ' +coCRLF+
' or (CCC.F_LIQUIDACION <= to_date (:FechaRep, ''DD/MM/YYYY'') and CCC.SIT_CON_REG_CCI = ''LQ'') ) ) CCC1, ' +coCRLF+
' ( -- Obtiene todas las afectaciones de las cartas de créditos ' +coCRLF+
' -- aplicadas al corte solicitado ' +coCRLF+
' select CCI.ID_CREDITO, ' +coCRLF+
' sum (CCI.IMP_CONCEPTO * decode (CCCONC.CVE_AFEC_SALDO, ''I'', 1, ''D'', -1, 0) ) as SUM_IMP_CONCEPTO ' +coCRLF+
' from (select CCC2.ID_CREDITO ' +coCRLF+
' from admiprod.CR_CON_REG_CCI CCC2 ' +coCRLF+
' where CCC2.ID_REG_VIGENTE = 1 ' +coCRLF+
' and ( ' +coCRLF+
' (CCC2.F_DISPOSICION <= to_date (:FechaRep, ''DD/MM/YYYY'') and CCC2.SIT_CON_REG_CCI = ''AC'') ' +coCRLF+
' or (CCC2.F_LIQUIDACION <= to_date (:FechaRep, ''DD/MM/YYYY'') and CCC2.SIT_CON_REG_CCI = ''LQ'') ) ) CCC3, ' +coCRLF+
' ADMIPROD.CR_CCI_TRANSAC CCI, ' +coCRLF+
' ADMIPROD.CR_CCI_CONCEPTO CCCONC ' +coCRLF+
' where CCI.ID_CREDITO = CCC3.ID_CREDITO ' +coCRLF+
' and CCI.F_OPERACION <= to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' and CCI.SIT_CCI_TRANSAC <> ''CA'' ' +coCRLF+
' and CCCONC.CVE_CCI_CONCEPTO = CCI.CVE_CCI_CONCEPTO ' +coCRLF+
' group by CCI.ID_CREDITO) CCI_TRANSAC, ' +coCRLF+
' ADMIPROD.CONTRATO CTO, ' +coCRLF+
' ADMIPROD.PERSONA P, ' +coCRLF+
' RFC, ' +coCRLF+
' CR_ACREDITADO CA, ' +coCRLF+
' CR_GRUPO_ECO GPE ' +coCRLF+
' where CTO.ID_CONTRATO = CCC1.ID_CONTRATO ' +coCRLF+
' and P.ID_PERSONA = CTO.ID_TITULAR ' +coCRLF+
' and CA.ID_ACREDITADO = CTO.ID_TITULAR ' +coCRLF+
' and GPE.CVE_GRUPO_ECO = CA.CVE_GRUPO_ECO ' +coCRLF+
' and RFC.ID_PERSONA(+) = CTO.ID_TITULAR ' +coCRLF+
' and CCI_TRANSAC.ID_CREDITO(+) = CCC1.ID_CREDITO ' +coCRLF+
' and GPE.CVE_GRUPO_ECO(+) = CA.CVE_GRUPO_ECO) CARTAS ' +coCRLF+
' group by CVE_GRUPO_ECO) CARTAS1 ' +coCRLF+
' where CARTAS1.SUM_SDO_GPO_ECO between :inf and :sup) ) ) ' +coCRLF+
' union ' +coCRLF+
' select CREDITO, ' +coCRLF+
' RFC_DEUDOR, ' +coCRLF+
' NOMBRE as NOMBRE_DEUDOR, ' +coCRLF+
' DESC_GPO as NOMBRE_GPO_ECONOMICO, ' +coCRLF+
' F_AUTORIZA as F_AUTORIZACION, ' +coCRLF+
' F_VENCIMIENTO, ' +coCRLF+
' trunc (decode (cve_moneda, 484, IMP_AUTORIZADO, 840, (IMP_AUTORIZADO * :TipoCambio) ) ) as MONTO_AUTORIZADO, ' +coCRLF+
' trunc (decode (cve_moneda, 484, SDO_INSOLUTO, 840, (SDO_INSOLUTO * :TipoCambio) ) ) as SALDO_PRINCIPAL, ' +coCRLF+
' SITUACION, ' +coCRLF+
' nvl (TIPO_TASA, ''N/A'') as TIPO_TASA, ' +coCRLF+
' nvl (to_char (Fech_PAgo, ''YYYY-MM-DD''), ''N/A'') as FECH_PAGO, ' +coCRLF+
' nvl (trunc (decode (CVE_MONEDA, 484, Monto_Sig_PAgo_EXIGIBLE, 840, Monto_Sig_PAgo_EXIGIBLE * :TipoCambio) ), 0) as MONTO_SIG_PAGO_EXIGIBLE, ' +coCRLF+
' TIPO_PROX_PAGO_EX ' +coCRLF+
' from (select CREDITO, ' +coCRLF+
' CVE_MONEDA, ' +coCRLF+
' RFC_DEUDOR, ' +coCRLF+
' NOMBRE, ' +coCRLF+
' decode (DESC_GPO, ''SIN GRUPO'', NOMBRE, ''SIN GRUPO DE RIESGO COMÚN'', NOMBRE, DESC_GPO) as DESC_GPO, ' +coCRLF+
' to_char (F_AUTORIZA, ''YYYY-MM-DD'') as F_AUTORIZA, ' +coCRLF+
' to_char (F_VENCIMIENTO, ''YYYY-MM-DD'') as F_VENCIMIENTO, ' +coCRLF+
' IMP_AUTORIZADO, ' +coCRLF+
' SDO_INSOLUTO, ' +coCRLF+
' SITUACION, ' +coCRLF+
' TIPO_TASA, ' +coCRLF+
' IMP_CESION_INT, ' +coCRLF+
' to_char (F_VENC_CAP, ''YYYY-MM-DD'') as F_VENC_CAP, ' +coCRLF+
' IMP_CAPITAL, ' +coCRLF+
' F_VENTO_INT, ' +coCRLF+
' IMP_INT_PROY, ' +coCRLF+
' IMP_CESION, ' +coCRLF+
' FEC_VEN_CESION, ' +coCRLF+
' case ' +coCRLF+
' when ((F_PAGO_ANT_CAP < F_VENC_CAP) and (F_PAGO_ANT_CAP < to_date (:FechaRep, ''DD/MM/YYYY''))) or ((F_PAGO_ANT_INT < F_VENTO_INT) and (F_PAGO_ANT_INT < to_date (:FechaRep, ''DD/MM/YYYY''))) then null ' +coCRLF+
' when F_VENC_CAP > F_VENTO_INT THEN F_VENTO_INT ' +coCRLF+
' when F_VENC_CAP < F_VENTO_INT THEN F_VENC_CAP ' +coCRLF+
' when F_VENC_CAP = F_VENTO_INT THEN F_VENC_CAP ' +coCRLF+
' else FEC_VEN_CESION ' +coCRLF+
' end as FECH_PAGO, ' +coCRLF+
' case ' +coCRLF+
' when F_VENC_CAP > F_VENTO_INT THEN IMP_INT_PROY ' +coCRLF+
' when F_VENC_CAP < F_VENTO_INT THEN IMP_CAPITAL ' +coCRLF+
' when F_VENC_CAP = F_VENTO_INT THEN IMP_CAPITAL+IMP_INT_PROY ' +coCRLF+
' else IMP_CESION ' +coCRLF+
' end as Monto_Sig_PAgo_EXIGIBLE, ' +coCRLF+
' case ' +coCRLF+
' when (F_VENC_CAP = F_VENTO_INT) then 3 ' +coCRLF+
' when (F_VENTO_INT is null) then 1 ' +coCRLF+
' when (F_VENC_CAP is null) then 2 ' +coCRLF+
' when (F_VENC_CAP > F_VENTO_INT) then 2 ' +coCRLF+
' when (F_VENC_CAP < F_VENTO_INT) then 1 ' +coCRLF+
' end as Tipo_Prox_Pago_Ex ' +coCRLF+
' from (select CREDITO, ' +coCRLF+
' CVE_MONEDA, ' +coCRLF+
' SIGLAS_RFC || F_RFC || ''-'' || HOMOCLAVE_RFC as RFC_Deudor, ' +coCRLF+
' PERSONA.NOMBRE, ' +coCRLF+
' DESC_GPO, ' +coCRLF+
' F_AUTORIZA, ' +coCRLF+
' DATOS.F_VENCIMIENTO, ' +coCRLF+
' IMP_AUTORIZADO, ' +coCRLF+
' trunc (SDO_INSOLUTO) as SDO_INSOLUTO, ' +coCRLF+
' decode (F_TRASPASO_VENC, null, ''1'', ''2'') as SITUACION, ' +coCRLF+
' decode (CVE_TASA, ''FIJA'', ''1'', ''2'') as TIPO_TASA, ' +coCRLF+
' (select F_VENCIMIENTO ' +coCRLF+
' from (select cr_capital.ID_CREDITO, ' +coCRLF+
' CR_CAPITAL.F_VENCIMIENTO ' +coCRLF+
' from cr_capital, ' +coCRLF+
' cr_cesion ' +coCRLF+
' where cr_capital.id_credito = cr_cesion.ID_CESION ' +coCRLF+
' and cr_capital.F_VENCIMIENTO = ' +coCRLF+
' (select min (F_VENCIMIENTO) ' +coCRLF+
' from cr_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and SIT_capital in (''AC'') ' +coCRLF+
' and cr_capital.id_credito = cr_cesion.ID_CESION) ' +coCRLF+
' and sit_cesion <> ''CA'' ' +coCRLF+
' and sit_capital in (''AC'') ) ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' union ' +coCRLF+
' select F_VENCIMIENTO ' +coCRLF+
' from (select cre_capital.ID_CREDITO, ' +coCRLF+
' CRE_CAPITAL.F_VENCIMIENTO ' +coCRLF+
' from crE_capital, ' +coCRLF+
' crE_cesion ' +coCRLF+
' where cre_capital.id_credito = cre_cesion.ID_CESION ' +coCRLF+
' and crE_capital.F_VENCIMIENTO = ' +coCRLF+
' (select min (F_VENCIMIENTO) ' +coCRLF+
' from cre_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and SIT_capital in (''AC'') ' +coCRLF+
' and crE_capital.id_credito = crE_cesion.ID_CESION) ' +coCRLF+
' and sit_cesion <> ''CA'' ' +coCRLF+
' and sit_capital in (''AC'') ) ' +coCRLF+
' where ID_CREDITO = CREDITO) as FEC_VEN_CESION, ' +coCRLF+
' nvl ( (select imp_cesion ' +coCRLF+
' from (select cr_capital.ID_CREDITO, ' +coCRLF+
' nvl (sum (cr_capital.imp_capital), 0) as imp_cesion ' +coCRLF+
' from cr_capital, ' +coCRLF+
' cr_cesion ' +coCRLF+
' where cr_capital.id_credito = cr_cesion.ID_CESION ' +coCRLF+
' and cr_capital.F_VENCIMIENTO = ' +coCRLF+
' (select min (F_VENCIMIENTO) ' +coCRLF+
' from cr_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and SIT_capital in (''AC'') ' +coCRLF+
' and cr_capital.id_credito = cr_cesion.ID_CESION) ' +coCRLF+
' and sit_cesion <> ''CA'' ' +coCRLF+
' and sit_capital in (''AC'') ' +coCRLF+
' group by ID_CREDITO) ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' union ' +coCRLF+
' select imp_cesion ' +coCRLF+
' from (select cre_capital.ID_CREDITO, ' +coCRLF+
' nvl (sum (cre_capital.imp_capital), 0) as imp_cesion ' +coCRLF+
' from crE_capital, ' +coCRLF+
' crE_cesion ' +coCRLF+
' where cre_capital.id_credito = cre_cesion.ID_CESION ' +coCRLF+
' and crE_capital.F_VENCIMIENTO = ' +coCRLF+
' (select min (F_VENCIMIENTO) ' +coCRLF+
' from cre_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and SIT_capital in (''AC'') ' +coCRLF+
' and crE_capital.id_credito = crE_cesion.ID_CESION) ' +coCRLF+
' and sit_cesion <> ''CA'' ' +coCRLF+
' and sit_capital in (''AC'') ' +coCRLF+
' group by ID_CREDITO) ' +coCRLF+
' where ID_CREDITO = CREDITO), ' +coCRLF+
' 0) as IMP_CESION, ' +coCRLF+
' nvl ( (select imp_cesion_Int ' +coCRLF+
' from (select cr_interes.ID_CREDITO, ' +coCRLF+
' nvl (sum (cr_interes.IMP_INTERES_PROY), 0) as imp_cesion_Int ' +coCRLF+
' from cr_interes, ' +coCRLF+
' cr_cesion ' +coCRLF+
' where cr_interes.id_credito = cr_cesion.ID_CESION ' +coCRLF+
' and cr_interes.F_VENCIMIENTO = ' +coCRLF+
' (select min (F_VENCIMIENTO) ' +coCRLF+
' from cr_interes ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and SIT_interes in (''AC'') ' +coCRLF+
' and cr_INTERES.id_credito = cr_cesion.ID_CESION) ' +coCRLF+
' and sit_cesion <> ''CA'' ' +coCRLF+
' and SIT_interes in (''AC'') ' +coCRLF+
' group by ID_CREDITO) ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' union ' +coCRLF+
' select imp_cesion_Int ' +coCRLF+
' from (select ID_CREDITO, ' +coCRLF+
' nvl (sum (cre_interes.IMP_INTERES_PROY), 0) as imp_cesion_Int ' +coCRLF+
' from crE_Interes, ' +coCRLF+
' crE_cesion ' +coCRLF+
' where crE_Interes.id_credito = crE_cesion.ID_CESION ' +coCRLF+
' and cre_interes.F_VENCIMIENTO = ' +coCRLF+
' (select min (F_VENCIMIENTO) ' +coCRLF+
' from cre_interes ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and SIT_interes in (''AC'') ' +coCRLF+
' and crE_INTERES.id_credito = cre_cesion.ID_CESION) ' +coCRLF+
' and sit_cesion <> ''CA'' ' +coCRLF+
' and SIT_interes in (''AC'') ' +coCRLF+
' group by ID_CREDITO) ' +coCRLF+
' where ID_CREDITO = CREDITO), ' +coCRLF+
' 0) as IMP_CESION_Int, ' +coCRLF+
' (select F_vencimiento ' +coCRLF+
' from cr_INTERES ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from cr_INTERES ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_INTERES in (''AC'') ' +coCRLF+
' group by id_credito) ' +coCRLF+
' union ' +coCRLF+
' select F_vencimiento ' +coCRLF+
' from cre_INTERES ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from crE_INTERES ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_INTERES in (''AC'') ' +coCRLF+
' group by id_credito) ) as F_VENTO_INT, ' +coCRLF+
' (select F_VALOR_PAGO ' +coCRLF+
' from cr_INTERES ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from cr_INTERES ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_INTERES in (''AC'') ' +coCRLF+
' group by id_credito) ' +coCRLF+
' union ' +coCRLF+
' select F_PAGO ' +coCRLF+
' from cre_INTERES ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from crE_INTERES ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_INTERES in (''AC'') ' +coCRLF+
' group by id_credito) ) as F_PAGO_ANT_INT, ' +coCRLF+
' (select IMP_INTERES_PROY ' +coCRLF+
' from cr_INTERES ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from cr_INTERES ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_INTERES in (''AC'') ' +coCRLF+
' group by id_credito) ' +coCRLF+
' union ' +coCRLF+
' select IMP_INTERES_PROY ' +coCRLF+
' from cre_INTERES ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from crE_INTERES ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_INTERES in (''AC'') ' +coCRLF+
' group by id_credito) ) as IMP_INT_PROY, ' +coCRLF+
' (select F_vencimiento ' +coCRLF+
' from cr_capital ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from cr_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_CAPITAL in (''AC'') ' +coCRLF+
' group by id_credito) ' +coCRLF+
' union ' +coCRLF+
' select F_vencimiento ' +coCRLF+
' from cre_capital ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from crE_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_CAPITAL in (''AC'') ' +coCRLF+
' group by id_credito) ) as F_VENC_CAP, ' +coCRLF+
' (select F_VALOR_PAGO ' +coCRLF+
' from cr_capital ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from cr_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_CAPITAL in (''AC'') ' +coCRLF+
' group by id_credito) ' +coCRLF+
' union ' +coCRLF+
' select F_PAGO ' +coCRLF+
' from cre_capital ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from crE_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_CAPITAL in (''AC'') ' +coCRLF+
' group by id_credito) ) as F_PAGO_ANT_CAP, ' +coCRLF+
' (select imp_capital - imp_pagado ' +coCRLF+
' from cr_capital ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from cr_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_VALOR_PAGO is null ' +coCRLF+
' or F_VALOR_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and sit_capital in (''AC'') ' +coCRLF+
' group by id_credito) ' +coCRLF+
' union ' +coCRLF+
' select imp_capital - imp_pagado ' +coCRLF+
' from cre_capital ' +coCRLF+
' where ID_CREDITO = CREDITO ' +coCRLF+
' and NUM_PERIODO = ' +coCRLF+
' (select min (NUM_PERIODO) ' +coCRLF+
' from crE_capital ' +coCRLF+
' where (F_VENCIMIENTO > to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' or (F_PAGO is null ' +coCRLF+
' or F_PAGO > to_date (:FechaRep, ''DD/MM/YYYY'') ) ) ' +coCRLF+
' and ID_CREDITO = CREDITO ' +coCRLF+
' and SIT_CAPITAL in (''AC'') ' +coCRLF+
' group by id_credito) ) as IMP_CAPITAL ' +coCRLF+
' from (select CRE.F_TRASPASO_VENC as F_TRASPASO_VENC, ' +coCRLF+
' CTO.ID_EMPRESA as EMPRESA, ' +coCRLF+
' CRP.CVE_GPO_INGRESO as PRODUCTO_GPO, ' +coCRLF+
' CCTO.ID_CONTRATO as CONTRATO, ' +coCRLF+
' CRE.ID_CREDITO as CREDITO, ' +coCRLF+
' substr (CSB.CVE_SUB_TIP_BCO, 1, 6) as PRODUCTO, ' +coCRLF+
' substr (CSB.DESC_SUB_TIPO, 1, 80) as DESC_PROD, ' +coCRLF+
' decode (CRE.TIPO_DISPOSICION, ''RN'', CTA_RENOVACION, CTC.TIPO_CUENTA || ''-'' || substr (CSC.CTA_CONTABLE, 1, 4) || ''-'' || substr (CSC.CTA_CONTABLE, 5, 7) ) as CTA_ORIGEN, ' +coCRLF+
' CRE.F_AUT_OPERACION as F_AUTORIZA, ' +coCRLF+
' CRE.F_VALOR_CRED + CRE.DIAS_PLAZO as F_VENCIMIENTO, ' +coCRLF+
' CRE.CVE_TASA_REFER as CVE_TASA, ' +coCRLF+
' CRE.OPERADOR_STASA as OPERADOR_STASA, ' +coCRLF+
' CRE.SOBRETASA as SOBRETASA, ' +coCRLF+
' CCTO.IMP_AUTORIZADO as IMP_AUTORIZADO, ' +coCRLF+
' CRE.SDO_INSOLUTO as SDO_VIG_TOTAL, ' +coCRLF+
' '' '' as CVE_FND_ENT_DES, ' +coCRLF+
' 0 as PCT_REDESCONTADO, ' +coCRLF+
' '' '' as OPE_STASA_FND, ' +coCRLF+
' 0 as SOBRETASA_FND, ' +coCRLF+
' CCM.CVE_CAT_MIN as CAT_MINIMO, ' +coCRLF+
' CCM.DESC_CAT_MIN as DESC_CAT_MINIMO, ' +coCRLF+
' CTO.CVE_MONEDA as CVE_MONEDA, ' +coCRLF+
' MON.DESC_MONEDA as DESC_MONEDA, ' +coCRLF+
' CAC.CVE_GRUPO as CVE_GRUPO, ' +coCRLF+
' CGE.DESC_GRUPO as DESC_GPO, ' +coCRLF+
' CTO.ID_TITULAR as TITULAR, ' +coCRLF+
' substr (PKGCRCONSOLIDADO.FUN_NOM_TIT_CRED (CTO.ID_TITULAR), 1, 80) as NOMBRE, ' +coCRLF+
' CSB.CVE_SUB_TIP_BCO as SUB_TIP_BCO, ' +coCRLF+
' CRE.TIPO_DISPOSICION as TIPO_DISP, ' +coCRLF+
' CTC.TIPO_CUENTA as TIPO_CTA, ' +coCRLF+
' CTO.ID_PERS_ASOCIAD as ID_PROM_ASOC, ' +coCRLF+
' ASO.NOMBRE as PROM_ASOC, ' +coCRLF+
' CRE.ID_PROM_ADM as ID_PROM_ADM, ' +coCRLF+
' ADM.NOMBRE as PROM_ADM, ' +coCRLF+
' CRP.CVE_PRESUPUESTO as CVE_MERC_OBJ, ' +coCRLF+
' CRP.DESC_PRESUPUESTO as MERCADO_OBJ, ' +coCRLF+
' CAS.IMP_CAP_VIG as VIGENTE_CP, ' +coCRLF+
' CAS.IMP_CAP_VDO_NE as NOEXIGIBLE_CP, ' +coCRLF+
' CAS.IMP_CAP_IMP as IMPAGADO_CP, ' +coCRLF+
' CAS.IMP_CAP_VDO_EX as EXIGIBLE_CP, ' +coCRLF+
' (CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX) as SDO_INSOLUTO, ' +coCRLF+
' CAS.IMP_INT_VIG as VIGENTE_IN, ' +coCRLF+
' CAS.IMP_INT_IMP as IMPAGADO_IN, ' +coCRLF+
' CAS.IMP_INT_VDO_EX as EXIGIBLE_IN, ' +coCRLF+
' CAS.IMP_CTAS_ORD as CTA_ORD_IN, ' +coCRLF+
' 0 as MORATORIOS, ' +coCRLF+
' 0 as IMP_OTROS, ' +coCRLF+
' (CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX + CAS.IMP_INT_VIG + CAS.IMP_INT_IMP + CAS.IMP_INT_VDO_EX + CAS.IMP_CTAS_ORD) as TOT_ADEUDO, ' +coCRLF+
' (select TASA_APLICADA ' +coCRLF+
' from CRE_INTERES ' +coCRLF+
' where ID_CREDITO = CAS.ID_CREDITO and NUM_PERIODO = (select max (NUM_PERIODO) ' +coCRLF+
' from CRE_INTERES ' +coCRLF+
' where ID_CREDITO = CAS.ID_CREDITO and SIT_INTERES in (''AC'', ''IM'') ) ) as TASA_TOTAL, ' +coCRLF+
' 0 as VALOR_TASA, ' +coCRLF+
' 0 as TASA_FND_TOT ' +coCRLF+
' from CR_CON_ADEUDO_SDO CAS, ' +coCRLF+
' CRE_CREDITO CRE, ' +coCRLF+
' CONTRATO CTO, ' +coCRLF+
' CRE_CLIENTE CAC, ' +coCRLF+
' MONEDA MON, ' +coCRLF+
' CRE_GRUPO_EMPR CGE, ' +coCRLF+
' CRE_TIPO_CREDITO CTC, ' +coCRLF+
' CRE_CAT_MINIMO CCM, ' +coCRLF+
' CRE_CONTRATO CCTO, ' +coCRLF+
' CRE_SUB_TIP_BCO CSB, ' +coCRLF+
' CRE_SUB_TIP_CNBV CSC, ' +coCRLF+
' CRE_GPO_INGRESO CPG, ' +coCRLF+
' CRE_PRESUPUESTO CRP, ' +coCRLF+
' PERSONA ASO, ' +coCRLF+
' PERSONA ADM ' +coCRLF+
' where CTO.ID_EMPRESA = 2 ' +coCRLF+
' and CAS.F_CIERRE = to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' and (CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX) > 0 ' +coCRLF+
' and ( (CSB.F_TRASPASO_ICRE is not null and CRE.SIT_CREDITO not in (''TA'') ) ' +coCRLF+
' or CSB.F_TRASPASO_ICRE is null) ' +coCRLF+
' and CRE.ID_CREDITO = CAS.ID_CREDITO ' +coCRLF+
' and CCTO.ID_CONTRATO = CRE.ID_CONTRATO ' +coCRLF+
' and CSB.CVE_SUB_TIP_BCO = CCTO.CVE_SUB_TIP_BCO ' +coCRLF+
' and CCM.CVE_CAT_MIN = CCTO.CVE_CAT_MIN ' +coCRLF+
' and MON.CVE_MONEDA = CTO.CVE_MONEDA ' +coCRLF+
' and CTO.ID_CONTRATO = CCTO.ID_CONTRATO ' +coCRLF+
' and CAC.ID_PERSONA = CTO.ID_TITULAR ' +coCRLF+
' and CGE.CVE_GRUPO = CAC.CVE_GRUPO ' +coCRLF+
' and CSB.CVE_SUB_TIP_CNBV = CSC.CVE_SUB_TIP_CNBV ' +coCRLF+
' and CTC.CVE_TIPO_CREDITO = CSC.CVE_TIPO_CREDITO ' +coCRLF+
' and CPG.CVE_GPO_INGRESO = CRP.CVE_GPO_INGRESO ' +coCRLF+
' and CRP.CVE_PRESUPUESTO = CRE.CVE_PRESUPUESTO ' +coCRLF+
' and CTO.ID_PERS_ASOCIAD = ASO.ID_PERSONA(+) ' +coCRLF+
' and CRE.ID_PROM_ADM = ADM.ID_PERSONA(+) ' +coCRLF+
' union all ' +coCRLF+
' select CRE.F_TRASPASO_VENC as F_TRASPASO_VENC, ' +coCRLF+
' CTO.ID_EMPRESA as EMPRESA, ' +coCRLF+
' CPR.CVE_PRODUCTO_GPO as PRODUCTO_GPO, ' +coCRLF+
' CCTO.ID_CONTRATO as CONTRATO, ' +coCRLF+
' CRE.ID_CREDITO as CREDITO, ' +coCRLF+
' CCTO.CVE_PRODUCTO_CRE as PRODUCTO, ' +coCRLF+
' CPR.DESC_L_PRODUCTO as DESC_PROD, ' +coCRLF+
' substr (PKGCRCONSOLIDADO.FUN_CR_CTASCONTAB (CTO.ID_EMPRESA, CCTO.CVE_MONEDA, CCTO.CVE_PRODUCTO_CRE, ''CI''), 1, 30) CTA_ORIGEN, ' +coCRLF+
' CRE.F_AUTORIZA as F_AUTORIZA, ' +coCRLF+
' CRE.F_VENCIMIENTO as F_VENCIMIENTO, ' +coCRLF+
' CRE.CVE_TASA_REFER as CVE_TASA, ' +coCRLF+
' CRE.OPERADOR_STASA as OPERADOR_STASA, ' +coCRLF+
' CRE.SOBRETASA as SOBRETASA, ' +coCRLF+
' CCTO.IMP_AUTORIZADO as IMP_AUTORIZADO, ' +coCRLF+
' nvl (CFN.SDO_VIG_TOTAL, 0) as SDO_VIG_TOTAL, ' +coCRLF+
' CFN.CVE_FND_ENT_DES, ' +coCRLF+
' nvl (PCT_REDESCONTADO, 0) as PCT_REDESCONTADO, ' +coCRLF+
' CFN.OPERADOR_STASA as OPE_STASA_FND, ' +coCRLF+
' CFN.SOBRETASA as SOBRETASA_FND, ' +coCRLF+
' CCM.CVE_CAT_MINIMO as CAT_MINIMO, ' +coCRLF+
' CCM.DESC_CAT_MINIMO as DESC_CAT_MINIMO, ' +coCRLF+
' CCTO.CVE_MONEDA as CVE_MONEDA, ' +coCRLF+
' MON.DESC_MONEDA as DESC_MONEDA, ' +coCRLF+
' CAC.CVE_GRUPO_ECO as CVE_GRUPO, ' +coCRLF+
' CGE.DESC_GRUPO_ECO as DESC_GRUPO, ' +coCRLF+
' CTO.ID_TITULAR as TITULAR, ' +coCRLF+
' substr (PKGCRCONSOLIDADO.FUN_NOM_TIT_CRED (CTO.ID_TITULAR), 1, 80) NOMBRE, ' +coCRLF+
' CPS.CVE_SUB_TIP_BCO as SUB_TIP_BCO, ' +coCRLF+
' CRE.TIPO_DISPOSICION as TIPO_DISP, ' +coCRLF+
' CPR.CVE_TIPO_CRED_BC as TIPO_CTA, ' +coCRLF+
' CTO.ID_PERS_ASOCIAD as ID_PROM_ASOC, ' +coCRLF+
' ASO.NOMBRE as PROM_ASOC, ' +coCRLF+
' CRE.ID_PROM_ADM as ID_PROM_ADM, ' +coCRLF+
' ADM.NOMBRE as PROM_ADM, ' +coCRLF+
' CRP.CVE_PRESUPUESTO as CVE_MERC_OBJ, ' +coCRLF+
' CRP.DESC_PRESUPUESTO as MERCADO_OBJ, ' +coCRLF+
' CAS.IMP_CAP_VIG as VIGENTE_CP, ' +coCRLF+
' CAS.IMP_CAP_VDO_NE as NOEXIGIBLE_CP, ' +coCRLF+
' CAS.IMP_CAP_IMP as IMPAGADO_CP, ' +coCRLF+
' CAS.IMP_CAP_VDO_EX as EXIGIBLE_CP, ' +coCRLF+
' (CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX) as SDO_INSOLUTO, ' +coCRLF+
' CAS.IMP_INT_VIG as VIGENTE_IN, ' +coCRLF+
' CAS.IMP_INT_IMP as IMPAGADO_IN, ' +coCRLF+
' CAS.IMP_INT_VDO_EX as EXIGIBLE_IN, ' +coCRLF+
' CAS.IMP_CTAS_ORD as CTA_ORD_IN, ' +coCRLF+
' 0 as MORATORIOS, ' +coCRLF+
' 0 as IMP_OTROS, ' +coCRLF+
' (CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX + CAS.IMP_INT_VIG + CAS.IMP_INT_IMP + CAS.IMP_INT_VDO_EX + CAS.IMP_CTAS_ORD) as TOT_ADEUDO, ' +coCRLF+
' (select TASA_APLICADA ' +coCRLF+
' from CR_INTERES ' +coCRLF+
' where ID_CREDITO = CAS.ID_CREDITO and NUM_PERIODO = (select max (NUM_PERIODO) ' +coCRLF+
' from CR_INTERES ' +coCRLF+
' where ID_CREDITO = CAS.ID_CREDITO and SIT_INTERES in (''AC'', ''IM'') ) ) as TASA_TOTAL, ' +coCRLF+
' 0 as VALOR_TASA, ' +coCRLF+
' (select TASA_APLICADA ' +coCRLF+
' from CR_FND_INTERES ' +coCRLF+
' where ID_CREDITO = CAS.ID_CREDITO and NUM_PERIODO = (select max (NUM_PERIODO) ' +coCRLF+
' from CR_FND_INTERES ' +coCRLF+
' where ID_CREDITO = CAS.ID_CREDITO and SIT_INTERES in (''AC'', ''IM'') ) ) as TASA_FND_TOT ' +coCRLF+
' from CR_CON_ADEUDO_SDO CAS, ' +coCRLF+
' CR_CREDITO CRE, ' +coCRLF+
' CR_CONTRATO CCTO, ' +coCRLF+
' CR_PRODUCTO CPR, ' +coCRLF+
' CR_PROD_SUB_TIPO CPS, ' +coCRLF+
' CR_FND_CREDITO CFN, ' +coCRLF+
' CONTRATO CTO, ' +coCRLF+
' CR_ACREDITADO CAC, ' +coCRLF+
' MONEDA MON, ' +coCRLF+
' CR_GRUPO_ECO CGE, ' +coCRLF+
' CR_CAT_MINIMO CCM, ' +coCRLF+
' CRE_PRESUPUESTO CRP, ' +coCRLF+
' PERSONA ASO, ' +coCRLF+
' PERSONA ADM ' +coCRLF+
' where CTO.ID_EMPRESA = 2 ' +coCRLF+
' and CAS.F_CIERRE = to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' and (CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX) > 0 ' +coCRLF+
' and CRE.ID_CREDITO = CAS.ID_CREDITO ' +coCRLF+
' and CCTO.ID_CONTRATO = CRE.ID_CONTRATO ' +coCRLF+
' and CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE ' +coCRLF+
' and CFN.ID_CREDITO(+) = CRE.ID_CREDITO ' +coCRLF+
' and CCM.CVE_CAT_MINIMO = CPR.CVE_CLAS_CONTAB ' +coCRLF+
' and MON.CVE_MONEDA = CCTO.CVE_MONEDA ' +coCRLF+
' and CTO.ID_CONTRATO = CCTO.ID_CONTRATO ' +coCRLF+
' and CAC.ID_ACREDITADO = CTO.ID_TITULAR ' +coCRLF+
' and CGE.CVE_GRUPO_ECO = CAC.CVE_GRUPO_ECO ' +coCRLF+
' and CPR.CVE_PRODUCTO_CRE = CPS.CVE_PRODUCTO_CRE ' +coCRLF+
' and CRP.CVE_PRESUPUESTO = CPR.CVE_PRESUPUESTO ' +coCRLF+
' and CTO.ID_PERS_ASOCIAD = ASO.ID_PERSONA(+) ' +coCRLF+
' and CRE.ID_PROM_ADM = ADM.ID_PERSONA(+) ' +coCRLF+
' and CPR.CVE_PRODUCTO_CRE = CPS.CVE_PRODUCTO_CRE) DATOS, ' +coCRLF+
' PERSONA, ' +coCRLF+
' RFC ' +coCRLF+
' where 1 = 1 ' +coCRLF+
' and PERSONA.ID_PERSONA = DATOS.TITULAR ' +coCRLF+
' and RFC.ID_PERSONA(+) = PERSONA.ID_PERSONA ' +coCRLF+
' and credito in ( ' +coCRLF+
' select ccac.id_credito ' +coCRLF+
' from (select p.id_persona, ' +coCRLF+
' sum (decode (CVE_MONEDA, 484, SDO_INSOLUTO, 840, (SDO_INSOLUTO * :TipoCambio) ) ) as sdo_insoluto ' +coCRLF+
' from (select CCAS.ID_CREDITO, ' +coCRLF+
' (CCAS.IMP_CAP_VIG + CCAS.IMP_CAP_VDO_NE + CCAS.IMP_CAP_IMP + CCAS.IMP_CAP_VDO_EX) as SDO_INSOLUTO ' +coCRLF+
' from CR_CON_ADEUDO_SDO CCAS ' +coCRLF+
' where CCAS.F_CIERRE = to_date (:FechaRep, ''DD/MM/YYYY'') ) CCAS, ' +coCRLF+
' CR_CON_ADEU_CLTV CCAC, ' +coCRLF+
' persona p ' +coCRLF+
' where CCAC.ID_CREDITO = CCAS.ID_CREDITO ' +coCRLF+
' and CCAC.ID_REG_VIGENTE = 1 ' +coCRLF+
' and p.id_persona = ccac.id_acreditado ' +coCRLF+
' and p.cve_tipo_sector not in (''11'', ''14'') ' +coCRLF+
' and ccac.cve_grupo_eco in (''0'', ''5190'') ' +coCRLF+
' and ( ' +coCRLF+
' regexp_like (ccac.CVE_CAT_MINIMO, ''^1301050'') or ' +coCRLF+
' regexp_like (ccac.CVE_CAT_MINIMO, ''^1301060'') or ' +coCRLF+
' regexp_like (ccac.CVE_CAT_MINIMO, ''^1301210|^7100000'') or ' +coCRLF+
' regexp_like (ccac.CVE_CAT_MINIMO, ''^7300000'')) ' +coCRLF+
' group by p.id_persona) acreditados, ' +coCRLF+
' cr_con_adeu_cltv ccac ' +coCRLF+
' where acreditados.sdo_insoluto between :inf and :sup and ccac.id_reg_vigente = 1 and ccac.id_acreditado = acreditados.id_persona) ) ) ' +coCRLF+
' union ' +coCRLF+
' select ' +coCRLF+
' -- CARTAS.CVE_MONEDA, ' +coCRLF+
' CARTAS.CREDITO, ' +coCRLF+
' CARTAS.RFC_DEUDOR, ' +coCRLF+
' CARTAS.NOMBRE_DEUDOR, ' +coCRLF+
' CARTAS.NOMBRE_GPO_ECONOMICO, ' +coCRLF+
' to_char (CARTAS.F_AUTORIZACION, ''YYYY-MM-DD'') as F_AUTORIZA, ' +coCRLF+
' to_char (CARTAS.F_VENCIMIENTO, ''YYYY-MM-DD'') as F_VENCIMIENTO, ' +coCRLF+
' round (CARTAS.IMP_CREDITO * CARTAS.TIPO_CAMBIO, 2) as MONTO_AUTORIZADO, ' +coCRLF+
' round (CARTAS.SALDO_CCI * CARTAS.TIPO_CAMBIO, 2) as SALDO_PRINCIPAL, ' +coCRLF+
' ''1'' as SITUACION, -- Situación Vigente ' +coCRLF+
' ''N/A'' as TIPO_TASA, ' +coCRLF+
' nvl (to_char (CARTAS.F_VENCIMIENTO, ''YYYY-MM-DD''), ''N/A'') as FECH_PAGO, ' +coCRLF+
' round (CARTAS.IMP_CREDITO * CARTAS.TIPO_CAMBIO, 2) as MONTO_SIG_PAGO_EXIGIBLE, ' +coCRLF+
' 1 as TIPO_PROX_PAGO_EX ' +coCRLF+
' from (select CCC1.ID_CREDITO as CREDITO, ' +coCRLF+
' (SIGLAS_RFC || F_RFC || ''-'' || HOMOCLAVE_RFC) as RFC_DEUDOR, ' +coCRLF+
' P.NOMBRE as NOMBRE_DEUDOR, ' +coCRLF+
' decode (GPE.DESC_GRUPO_ECO, ''SIN GRUPO'', P.NOMBRE, GPE.DESC_GRUPO_ECO) as NOMBRE_GPO_ECONOMICO, ' +coCRLF+
' CCC1.F_DISPOSICION as F_AUTORIZACION, ' +coCRLF+
' CCC1.F_VENCIMIENTO, ' +coCRLF+
' P.ID_PERSONA as ID_ACREDITADO, ' +coCRLF+
' CCC1.CVE_IDENTIF_CNBV, ' +coCRLF+
' CCC1.ID_CONTRATO, ' +coCRLF+
' decode (CTO.CVE_MONEDA, 484, 1, 840, :TipoCambio, PKGCORPO.OBTTIPOCAMBIO (to_date (:FechaRep, ''DD/MM/YYYY''), CTO.CVE_MONEDA, ''V'') ) as TIPO_CAMBIO, ' +coCRLF+
' CTO.CVE_MONEDA, ' +coCRLF+
' CCC1.IMP_CREDITO, ' +coCRLF+
' PCT_ADICIONAL, ' +coCRLF+
' CCC1.IMP_CREDITO + round (CCC1.IMP_CREDITO * CCC1.PCT_ADICIONAL / 100, 2) as IMP_TOTAL_CCI, ' +coCRLF+
' (CCC1.F_VENCIMIENTO - CCC1.F_DISPOSICION) as DIAS_PLAZO, ' +coCRLF+
' nvl (CCI_TRANSAC.SUM_IMP_CONCEPTO, 0) as IMP_DISMINUIDO, ' +coCRLF+
' CCC1.IMP_CREDITO + round (CCC1.IMP_CREDITO * CCC1.PCT_ADICIONAL / 100, 2) + nvl (CCI_TRANSAC.SUM_IMP_CONCEPTO, 0) as SALDO_CCI, ' +coCRLF+
' CCC1.B_OPER_CORRE_FOR, ' +coCRLF+
' CCC1.B_EXP_CRED_COMP, ' +coCRLF+
' CCC1.CVE_INF_RECUPERA, ' +coCRLF+
' CCC1.F_LIQUIDACION ' +coCRLF+
' from ( -- Obtiene las cartas de crédito Vigentes ' +coCRLF+
' select CCC.CVE_IDENTIF_CNBV, ' +coCRLF+
' CCC.ID_CONTRATO, ' +coCRLF+
' CCC.ID_CREDITO, ' +coCRLF+
' CCC.IMP_CREDITO, ' +coCRLF+
' nvl (CCC.PCT_ADICIONAL, 0) as PCT_ADICIONAL, ' +coCRLF+
' CCC.F_DISPOSICION, ' +coCRLF+
' CCC.F_VENCIMIENTO, ' +coCRLF+
' CCC.IMP_GARANTIA, ' +coCRLF+
' CCC.DESC_GTIA_ADIC, ' +coCRLF+
' CCC.B_OPER_CORRE_FOR, ' +coCRLF+
' CCC.B_EXP_CRED_COMP, ' +coCRLF+
' CCC.CVE_INF_RECUPERA, ' +coCRLF+
' CCC.F_LIQUIDACION ' +coCRLF+
' from ADMIPROD.CR_CON_REG_CCI CCC ' +coCRLF+
' where to_date (:FechaRep, ''DD/MM/YYYY'') between CCC.F_DISPOSICION and CCC.F_VENCIMIENTO and CCC.ID_REG_VIGENTE = 1 and CCC.SIT_CON_REG_CCI <> ''CA'') CCC1, ' +coCRLF+
' ( -- Obtiene todas las afectaciones de las cartas de créditos ' +coCRLF+
' -- aplicadas al corte solicitado ' +coCRLF+
' select CCI.ID_CREDITO, ' +coCRLF+
' sum (CCI.IMP_CONCEPTO * decode (CCCONC.CVE_AFEC_SALDO, ''I'', 1, ''D'', -1, 0) ) as SUM_IMP_CONCEPTO ' +coCRLF+
' from (select CCC2.ID_CREDITO ' +coCRLF+
' from admiprod.CR_CON_REG_CCI CCC2 ' +coCRLF+
' where CCC2.ID_REG_VIGENTE = 1 ' +coCRLF+
' and ( (CCC2.F_DISPOSICION <= to_date (:FechaRep, ''DD/MM/YYYY'') and CCC2.SIT_CON_REG_CCI = ''AC'') ' +coCRLF+
' or (CCC2.F_LIQUIDACION <= to_date (:FechaRep, ''DD/MM/YYYY'') and CCC2.SIT_CON_REG_CCI = ''LQ'') ) ) CCC3, ' +coCRLF+
' ADMIPROD.CR_CCI_TRANSAC CCI, ' +coCRLF+
' ADMIPROD.CR_CCI_CONCEPTO CCCONC ' +coCRLF+
' where CCI.ID_CREDITO = CCC3.ID_CREDITO and CCI.F_OPERACION <= to_date (:FechaRep, ''DD/MM/YYYY'') and CCI.SIT_CCI_TRANSAC <> ''CA'' and CCCONC.CVE_CCI_CONCEPTO = CCI.CVE_CCI_CONCEPTO ' +coCRLF+
' group by CCI.ID_CREDITO) CCI_TRANSAC, ' +coCRLF+
' ADMIPROD.CONTRATO CTO, ' +coCRLF+
' ADMIPROD.PERSONA P, ' +coCRLF+
' RFC, ' +coCRLF+
' CR_ACREDITADO CA, ' +coCRLF+
' CR_GRUPO_ECO GPE ' +coCRLF+
' where CTO.ID_CONTRATO = CCC1.ID_CONTRATO ' +coCRLF+
' and P.ID_PERSONA = CTO.ID_TITULAR ' +coCRLF+
' and CA.ID_ACREDITADO = CTO.ID_TITULAR ' +coCRLF+
' and GPE.CVE_GRUPO_ECO = CA.CVE_GRUPO_ECO ' +coCRLF+
' and RFC.ID_PERSONA(+) = CTO.ID_TITULAR ' +coCRLF+
' and CCI_TRANSAC.ID_CREDITO(+) = CCC1.ID_CREDITO ' +coCRLF+
' and GPE.CVE_GRUPO_ECO(+) = CA.CVE_GRUPO_ECO ' +coCRLF+
' and CCC1.IMP_CREDITO + round (CCC1.IMP_CREDITO * CCC1.PCT_ADICIONAL / 100, 2) + nvl (CCI_TRANSAC.SUM_IMP_CONCEPTO, 0) > 0 ' +coCRLF+
' and CA.CVE_GRUPO_ECO in ( ' +coCRLF+
' -- <INICIA FILTRO> ' +coCRLF+
' -- Filtra todas las cartas para aquellos Grupos Económicos que rebasen los 50 millones ' +coCRLF+
' select CARTAS1.CVE_GRUPO_ECO ' +coCRLF+
' from (select CVE_GRUPO_ECO, ' +coCRLF+
' sum (round (CARTAS.SALDO_CCI * CARTAS.TIPO_CAMBIO, 2) ) as SUM_SDO_GPO_ECO ' +coCRLF+
' from (select GPE.CVE_GRUPO_ECO, ' +coCRLF+
' CCC1.ID_CREDITO as CREDITO, ' +coCRLF+
' (SIGLAS_RFC || F_RFC || ''-'' || HOMOCLAVE_RFC) as RFC_DEUDOR, ' +coCRLF+
' P.NOMBRE as NOMBRE_DEUDOR, ' +coCRLF+
' decode (GPE.DESC_GRUPO_ECO, ''SIN GRUPO'', P.NOMBRE, GPE.DESC_GRUPO_ECO) as NOMBRE_GPO_ECONOMICO, ' +coCRLF+
' CCC1.F_DISPOSICION as F_AUTORIZACION, ' +coCRLF+
' CCC1.F_VENCIMIENTO, ' +coCRLF+
' P.ID_PERSONA as ID_ACREDITADO, ' +coCRLF+
' CCC1.CVE_IDENTIF_CNBV, ' +coCRLF+
' CCC1.ID_CONTRATO, ' +coCRLF+
' decode (CTO.CVE_MONEDA, 484, 1, 840, :TipoCambio, PKGCORPO.OBTTIPOCAMBIO (to_date (:FechaRep, ''DD/MM/YYYY''), CTO.CVE_MONEDA, ''V'') ) as TIPO_CAMBIO, ' +coCRLF+
' CTO.CVE_MONEDA, ' +coCRLF+
' CCC1.IMP_CREDITO, ' +coCRLF+
' PCT_ADICIONAL, ' +coCRLF+
' CCC1.IMP_CREDITO + round (CCC1.IMP_CREDITO * CCC1.PCT_ADICIONAL / 100, 2) as IMP_TOTAL_CCI, ' +coCRLF+
' (CCC1.F_VENCIMIENTO - CCC1.F_DISPOSICION) as DIAS_PLAZO, ' +coCRLF+
' nvl (CCI_TRANSAC.SUM_IMP_CONCEPTO, 0) as IMP_DISMINUIDO, ' +coCRLF+
' CCC1.IMP_CREDITO + round (CCC1.IMP_CREDITO * CCC1.PCT_ADICIONAL / 100, 2) + nvl (CCI_TRANSAC.SUM_IMP_CONCEPTO, 0) as SALDO_CCI, ' +coCRLF+
' CCC1.B_OPER_CORRE_FOR, ' +coCRLF+
' CCC1.B_EXP_CRED_COMP, ' +coCRLF+
' CCC1.CVE_INF_RECUPERA ' +coCRLF+
' from ( -- Obtiene las cartas de crédito Vigentes ' +coCRLF+
' select CCC.CVE_IDENTIF_CNBV, ' +coCRLF+
' CCC.ID_CONTRATO, ' +coCRLF+
' CCC.ID_CREDITO, ' +coCRLF+
' CCC.IMP_CREDITO, ' +coCRLF+
' nvl (CCC.PCT_ADICIONAL, 0) as PCT_ADICIONAL, ' +coCRLF+
' CCC.F_DISPOSICION, ' +coCRLF+
' CCC.F_VENCIMIENTO, ' +coCRLF+
' CCC.IMP_GARANTIA, ' +coCRLF+
' CCC.DESC_GTIA_ADIC, ' +coCRLF+
' CCC.B_OPER_CORRE_FOR, ' +coCRLF+
' CCC.B_EXP_CRED_COMP, ' +coCRLF+
' CCC.CVE_INF_RECUPERA ' +coCRLF+
' from ADMIPROD.CR_CON_REG_CCI CCC ' +coCRLF+
' where CCC.ID_REG_VIGENTE = 1 ' +coCRLF+
' and ( ' +coCRLF+
' (CCC.F_DISPOSICION <= to_date (:FechaRep, ''DD/MM/YYYY'') and CCC.SIT_CON_REG_CCI = ''AC'') ' +coCRLF+
' or (CCC.F_LIQUIDACION <= to_date (:FechaRep, ''DD/MM/YYYY'') and CCC.SIT_CON_REG_CCI = ''LQ'') ) ) CCC1, ' +coCRLF+
' ( -- Obtiene todas las afectaciones de las cartas de créditos ' +coCRLF+
' -- aplicadas al corte solicitado ' +coCRLF+
' select CCI.ID_CREDITO, ' +coCRLF+
' sum (CCI.IMP_CONCEPTO * decode (CCCONC.CVE_AFEC_SALDO, ''I'', 1, ''D'', -1, 0) ) as SUM_IMP_CONCEPTO ' +coCRLF+
' from (select CCC2.ID_CREDITO ' +coCRLF+
' from admiprod.CR_CON_REG_CCI CCC2 ' +coCRLF+
' where CCC2.ID_REG_VIGENTE = 1 ' +coCRLF+
' and ( ' +coCRLF+
' (CCC2.F_DISPOSICION <= to_date (:FechaRep, ''DD/MM/YYYY'') and CCC2.SIT_CON_REG_CCI = ''AC'') ' +coCRLF+
' or (CCC2.F_LIQUIDACION <= to_date (:FechaRep, ''DD/MM/YYYY'') and CCC2.SIT_CON_REG_CCI = ''LQ'') ) ) CCC3, ' +coCRLF+
' ADMIPROD.CR_CCI_TRANSAC CCI, ' +coCRLF+
' ADMIPROD.CR_CCI_CONCEPTO CCCONC ' +coCRLF+
' where CCI.ID_CREDITO = CCC3.ID_CREDITO ' +coCRLF+
' and CCI.F_OPERACION <= to_date (:FechaRep, ''DD/MM/YYYY'') ' +coCRLF+
' and CCI.SIT_CCI_TRANSAC <> ''CA'' ' +coCRLF+
' and CCCONC.CVE_CCI_CONCEPTO = CCI.CVE_CCI_CONCEPTO ' +coCRLF+
' group by CCI.ID_CREDITO) CCI_TRANSAC, ' +coCRLF+
' ADMIPROD.CONTRATO CTO, ' +coCRLF+
' ADMIPROD.PERSONA P, ' +coCRLF+
' RFC, ' +coCRLF+
' CR_ACREDITADO CA, ' +coCRLF+
' CR_GRUPO_ECO GPE ' +coCRLF+
' where CTO.ID_CONTRATO = CCC1.ID_CONTRATO ' +coCRLF+
' and P.ID_PERSONA = CTO.ID_TITULAR ' +coCRLF+
' and CA.ID_ACREDITADO = CTO.ID_TITULAR ' +coCRLF+
' and GPE.CVE_GRUPO_ECO = CA.CVE_GRUPO_ECO ' +coCRLF+
' and RFC.ID_PERSONA(+) = CTO.ID_TITULAR ' +coCRLF+
' and CCI_TRANSAC.ID_CREDITO(+) = CCC1.ID_CREDITO ' +coCRLF+
' and GPE.CVE_GRUPO_ECO(+) = CA.CVE_GRUPO_ECO) CARTAS ' +coCRLF+
' group by CVE_GRUPO_ECO) CARTAS1 ' +coCRLF+
' where CARTAS1.SUM_SDO_GPO_ECO between :inf and :sup ' +coCRLF+
' union ' +coCRLF+
' select RESULTADO.CVE_GRUPO_ECO ' +coCRLF+
' from ( ' +coCRLF+
' -- Obtiene el saldo insoluto por grupo economico de los CREDITOS ' +coCRLF+
' select GRUPO.CVE_GRUPO_ECO, ' +coCRLF+
' sum (SDO_INSOLUTO) as SUM_SDO_INSOLUTO ' +coCRLF+
' from ( --GRUPO ' +coCRLF+
' -- Obtiene el saldo insoluto de las disposiciones al corte solicitado ' +coCRLF+
' select decode (CCAC.CVE_GRUPO_ECO, ''0'', ''5190'', CCAC.CVE_GRUPO_ECO) as CVE_GRUPO_ECO, ' +coCRLF+
' CVE_MONEDA, ' +coCRLF+
' CCAS.SDO_INSOLUTO ' +coCRLF+
' from (select CCAS.ID_CREDITO, ' +coCRLF+
' (CCAS.IMP_CAP_VIG + CCAS.IMP_CAP_VDO_NE + CCAS.IMP_CAP_IMP + CCAS.IMP_CAP_VDO_EX) as SDO_INSOLUTO ' +coCRLF+
' from CR_CON_ADEUDO_SDO CCAS ' +coCRLF+
' where CCAS.F_CIERRE = to_date (:FechaRep, ''DD/MM/YYYY'') ) CCAS, ' +coCRLF+
' CR_CON_ADEU_CLTV CCAC, ' +coCRLF+
' persona p ' +coCRLF+
' where CCAC.ID_CREDITO = CCAS.ID_CREDITO ' +coCRLF+
' and CCAC.ID_REG_VIGENTE = 1 ' +coCRLF+
' and p.id_persona = ccac.id_acreditado ' +coCRLF+
' and p.cve_tipo_sector not in (''11'', ''14'') ' +coCRLF+
' and ccac.cve_grupo_eco not in (''0'', ''5190'') ' +coCRLF+
' and ( ' +coCRLF+
' regexp_like (ccac.CVE_CAT_MINIMO, ''^1301050'') or ' +coCRLF+
' regexp_like (ccac.CVE_CAT_MINIMO, ''^1301060'') or ' +coCRLF+
' regexp_like (ccac.CVE_CAT_MINIMO, ''^1301210|^7100000'') or ' +coCRLF+
' regexp_like (ccac.CVE_CAT_MINIMO, ''^7300000'')) ' +coCRLF+
' ) GRUPO ' +coCRLF+
' group by GRUPO.CVE_GRUPO_ECO, ' +coCRLF+
' GRUPO.CVE_MONEDA ' +coCRLF+
' having decode (CVE_MONEDA, 484, sum (SDO_INSOLUTO), 840, (sum (SDO_INSOLUTO) * :TipoCambio) ) between :inf and :sup) RESULTADO ' +coCRLF+
' -- <TERMINA FILTRO> ' +coCRLF+
' ) ) CARTAS ' +coCRLF+
' order by 3, ' +coCRLF+
' 1 ';

  //Creditos del grupo 5190 individualmente probados
  creditosi := '';

  //Cartas de crédito
  ccreditos := '';

  qDatosStr :=
    creditosg +coCRLF +
    ' union '+coCRLF +
    creditosi +coCRLF +
    ' union '+coCRLF +
    ccreditos;
  qDatosStr := creditosg;
  qDatos.SQL.Add(qDatosStr);

  ed_montoinf.Text := '50000000.00';
  ed_montosup.Text := '0.00';

  //ACMEvlIsEmpty := True;
end;

//  ************************************************************************  //
//  Destruye la forma y libera recursos al cerrarla
//  ************************************************************************  //
procedure TWRepCre50M.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RunSQL('ALTER SESSION SET '+'"_optimizer_cost_based_transformation" = on',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
  Action := caFree;
end;

//  ************************************************************************  //
//  Obtiene la Fecha actual al mostrar la forma
//  ************************************************************************  //
procedure TWRepCre50M.InterForma1DespuesShow(Sender: TObject);
  Var vlFecha     : TDateTime;
begin
  vlFecha := Objeto.Apli.DameFechaEmpresa;
  DTP_FECHA_DIA.Date := vlFecha;
end;

//  ************************************************************************  //
//  Ejecuta Consulta del Reporte
//  ************************************************************************  //
procedure TWRepCre50M.btConsultaClick(Sender: TObject);
begin
  RunSQL('ALTER SESSION SET '+'"_optimizer_cost_based_transformation" = off',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
  BuscaDatos;

end;

//  ************************************************************************  //
//  Validación de Datos capturados en el componente Ed_TipoCambio
//  ************************************************************************  //
procedure TWRepCre50M.ed_TipoCambioKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not (key in ['0'..'9', #1..#30, '.']) then
     key := #0;
end;

procedure TWRepCre50M.GeneraResumen50M;
var
  vlQry : TQuery;
  vlsQry: String;
  vlsQry2: String;
  fila  : Integer;
begin
  fila := 1;

  vlsQry2 := StringReplace(qDatosStr, ':TipoCambio', ed_TipoCambio.text,[rfReplaceAll]);
  vlsQry2 := StringReplace(vlsQry2, ':FechaRep', ''''+FormatDateTime('dd/mm/yyyy', DTP_FECHA_DIA.date)+'''',[rfReplaceAll]);
  vlsQry2 := StringReplace(vlsQry2, ':inf', ed_montoinf.text,[rfReplaceAll]);
  if ((ed_montosup.text = '0') or (ed_montosup.text = '0.00')) then
    vlsQry2 := StringReplace(vlsQry2, ':sup', '1e125',[rfReplaceAll])
  else
    vlsQry2 := StringReplace(vlsQry2, ':sup', ed_montosup.text,[rfReplaceAll]);

  {* Genera el resumen
   *}

  vlsQry :=
      ' select   cve_cat_minimo_s, '+coCRLF+
      '          sum (saldo_principal) as total '+coCRLF+
      ' from     (select credito, '+coCRLF+
      '                  case '+coCRLF+
      '                    when regexp_like (CVE_CAT_MINIMO, ''^1301050'') then ''Comercial'' '+coCRLF+
      '                    when regexp_like (CVE_CAT_MINIMO, ''^1301060'') then ''Financiera'' '+coCRLF+
      '                    when regexp_like (CVE_CAT_MINIMO, ''^1301210|^7100000'') then ''Gubernamental'' '+coCRLF+
//      '                    when regexp_like (CVE_CAT_MINIMO, ''^7300000'') then ''Cartas de Crédito'' '+coCRLF+
      '                    when regexp_like (CVE_CAT_MINIMO, ''^7300000'') and credito <> ' + CRE_CONTINGENTE + ' then ''Cartas de Crédito'' '+coCRLF+
      ' 									 when credito = ' + CRE_CONTINGENTE + ' then ''Línea de crédito contingente'' '+coCRLF+
      '                    else ''null'' '+coCRLF+
      '                  end as CVE_CAT_MINIMO_S, '+coCRLF+
      '                  saldo_principal '+coCRLF+
      '           from   (select rep50m.credito, '+coCRLF+
      '                          rep50m.saldo_principal, '+coCRLF+
      '                          ccac.cve_cat_minimo '+coCRLF+
      '                   from   (  '+coCRLF+
      '                            ' + vlsQry2 +
      ' 									       ) rep50m, '+coCRLF+
      '                          (select * '+coCRLF+
      '                           from   cr_con_adeu_cltv '+coCRLF+
      '                           where  id_reg_vigente = 1) ccac '+coCRLF+
      '                   where  rep50m.credito = ccac.id_credito(+)) ) '+coCRLF+
      ' where    CVE_CAT_MINIMO_S <> ''null'' '+coCRLF+
      ' group by CVE_CAT_MINIMO_S ';

  vlQry := GetSQLQueryNoNil(vlsQry, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
  vlQry.SQL.SaveToFile('C:\RepCre50MRes.sql');
  
  if Assigned(vlQry) then
  begin
    with sagR50_LAYOUT do
    begin
      while not vlQry.Eof do
      begin
        Cells[0,fila] := IntToStr(fila);
        Cells[1,fila] := vlQry.FieldByName('CVE_CAT_MINIMO_S').asString;
        Cells[2,fila] := FormatFloat('###,###,###,###,###,##0.00',vlQry.FieldByName('TOTAL').AsFloat);
        vlQry.Next;
        fila := fila + 1;
        RowCount := fila;
        Application.ProcessMessages;
      end;
    end;
  end;

end;

procedure TWRepCre50M.GeneraResumenCartera;
var
  vlQry : TQuery;
  vlsQry: String;
  fila  : Integer;
begin
  fila := 1;

  {* Genera el resumen
   *}

  vlsQry :=
      ' select   CVE_CAT_MINIMO_S, '+coCRLF+
      '          sum (SDO_INSOLUTO_TOTAL) as TOTAL '+coCRLF+
      ' from     (select case '+coCRLF+
      '                    when regexp_like (CVE_CAT_MINIMO, ''^1301050'') then ''Comercial'' '+coCRLF+
      '                    when regexp_like (CVE_CAT_MINIMO, ''^1301060'') then ''Financiera'' '+coCRLF+
      '                    when regexp_like (CVE_CAT_MINIMO, ''^1301210|^7100000'') then ''Gubernamental'' '+coCRLF+
      '                    else ''null'' '+coCRLF+
      '                  end as CVE_CAT_MINIMO_S, '+coCRLF+
      '                  trunc (decode (cve_moneda, 484, SDO_INSOLUTO, 840, (SDO_INSOLUTO * ' + ed_TipoCambio.text + ') ) ,2) as SDO_INSOLUTO_TOTAL '+coCRLF+
      '           from   (select CCAC.CVE_MONEDA, '+coCRLF+
      '                          CCAC.CVE_CAT_MINIMO, '+coCRLF+
      '                          (CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX) as SDO_INSOLUTO '+coCRLF+
      '                   from   CR_CON_ADEUDO_SDO CAS, '+coCRLF+
      '                          CR_CON_ADEU_CLTV CCAC '+coCRLF+
      '                   where  CAS.F_CIERRE = ' + SQLFecha(DTP_FECHA_DIA.date) + ' and (CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX) > 0  '+coCRLF+
      ' 									and		 cas.id_credito = ccac.id_credito '+coCRLF+
      ' 									and		 ccac.id_reg_vigente = 1 ))								 '+coCRLF+
      ' where    CVE_CAT_MINIMO_S <> ''null'' '+coCRLF+
      ' group by CVE_CAT_MINIMO_S '+coCRLF+
      ' union '+coCRLF+
      ' select   cve_cat_minimo_s, '+coCRLF+
      '          sum (sdo_insoluto_total) as total '+coCRLF+
      ' from     (select case '+coCRLF+
//      '                    when regexp_like (CVE_CAT_MINIMO, ''^7300000'') then ''Cartas de Crédito'' '+coCRLF+
      '                    when regexp_like (CVE_CAT_MINIMO, ''^7300000'') and cartas.id_credito <> ' + CRE_CONTINGENTE + ' then ''Cartas de Crédito'' '+coCRLF+
      ' 									 when cartas.id_credito = ' + CRE_CONTINGENTE + ' then ''Línea de crédito contingente'' '+coCRLF+
      '                    else ''null'' '+coCRLF+
      '                  end as CVE_CAT_MINIMO_S, '+coCRLF+
      '                  cartas.id_credito, '+coCRLF+
      '                  trunc (decode (cve_moneda, 484, cartas.saldo_cci, 840, (cartas.saldo_cci * ' + ed_TipoCambio.text + ') ) ,2) as SDO_INSOLUTO_TOTAL, '+coCRLF+
      '                  catmins.cve_cat_minimo '+coCRLF+
      '           from   (select CCC1.ID_CREDITO, '+coCRLF+
      '                          CTO.CVE_MONEDA, '+coCRLF+
      '                          CCC1.IMP_CREDITO + round (CCC1.IMP_CREDITO * CCC1.PCT_ADICIONAL / 100, 2) + nvl (CCI_TRANSAC.SUM_IMP_CONCEPTO, 0) as SALDO_CCI '+coCRLF+
      '                   from   (   -- Obtiene las cartas de crédito Vigentes '+coCRLF+
      '                           select CCC.ID_CONTRATO, '+coCRLF+
      '                                  CCC.ID_CREDITO, '+coCRLF+
      '                                  CCC.IMP_CREDITO, '+coCRLF+
      '                                  nvl (CCC.PCT_ADICIONAL, 0) as PCT_ADICIONAL '+coCRLF+
      '                           from   ADMIPROD.CR_CON_REG_CCI CCC '+coCRLF+
      '                           where  CCC.ID_REG_VIGENTE = 1 '+coCRLF+
      '                           and    ( (CCC.F_DISPOSICION <= ' + SQLFecha(DTP_FECHA_DIA.date) + ' and CCC.SIT_CON_REG_CCI = ''AC'') '+coCRLF+
      '                                   or (CCC.F_LIQUIDACION <= ' + SQLFecha(DTP_FECHA_DIA.date) + ' and CCC.SIT_CON_REG_CCI = ''LQ'') ) ) CCC1, '+coCRLF+
      '                          (   -- Obtiene todas las afectaciones de las cartas de créditos '+coCRLF+
      '                              -- aplicadas al corte solicitado '+coCRLF+
      '                           select   CCI.ID_CREDITO, '+coCRLF+
      '                                    sum (CCI.IMP_CONCEPTO * decode (CCCONC.CVE_AFEC_SALDO, ''I'', 1, ''D'', -1, 0) ) as SUM_IMP_CONCEPTO '+coCRLF+
      '                           from     (select CCC2.ID_CREDITO '+coCRLF+
      '                                     from   CR_CON_REG_CCI CCC2 '+coCRLF+
      '                                     where  CCC2.ID_REG_VIGENTE = 1 '+coCRLF+
      '                                     and    ( '+coCRLF+
      '                                             (CCC2.F_DISPOSICION <= ' + SQLFecha(DTP_FECHA_DIA.date) + ' and CCC2.SIT_CON_REG_CCI = ''AC'') '+coCRLF+
      '                                             or (CCC2.F_LIQUIDACION <= ' + SQLFecha(DTP_FECHA_DIA.date) + ' and CCC2.SIT_CON_REG_CCI = ''LQ'') ) ) CCC3, '+coCRLF+
      '                                    ADMIPROD.CR_CCI_TRANSAC CCI, '+coCRLF+
      '                                    ADMIPROD.CR_CCI_CONCEPTO CCCONC '+coCRLF+
      '                           where    CCI.ID_CREDITO = CCC3.ID_CREDITO and CCI.F_OPERACION <= ' + SQLFecha(DTP_FECHA_DIA.date) + ' and CCI.SIT_CCI_TRANSAC <> ''CA'' and CCCONC.CVE_CCI_CONCEPTO = CCI.CVE_CCI_CONCEPTO '+coCRLF+
      '                           group by CCI.ID_CREDITO) CCI_TRANSAC, '+coCRLF+
      '                          ADMIPROD.CONTRATO CTO '+coCRLF+
      '                   where  CTO.ID_CONTRATO = CCC1.ID_CONTRATO and CCI_TRANSAC.ID_CREDITO(+) = CCC1.ID_CREDITO) CARTAS, '+coCRLF+
      '                  (   --catálogo mínimo para las cartas de créditos definidas en CRED '+coCRLF+
      '                   select id_credito, '+coCRLF+
      '                          cve_cat_minimo '+coCRLF+
      '                   from   cr_con_adeu_cltv '+coCRLF+
      '                   where  id_reg_vigente = 1) catmins '+coCRLF+
      '           where  catmins.id_credito = cartas.id_credito) '+coCRLF+
      ' where    CVE_CAT_MINIMO_S <> ''null'' '+coCRLF+
      ' group by CVE_CAT_MINIMO_S ';

  vlQry := GetSQLQueryNoNil(vlsQry, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

  if Assigned(vlQry) then
  begin
    with sagRC_LAYOUT do
    begin
      while not vlQry.Eof do
      begin
        Cells[0,fila] := IntToStr(fila);
        Cells[1,fila] := vlQry.FieldByName('CVE_CAT_MINIMO_S').asString;
        Cells[2,fila] := FormatFloat('###,###,###,###,###,##0.00',vlQry.FieldByName('TOTAL').AsFloat);
        vlQry.Next;
        fila := fila + 1;
        RowCount := fila;
        Application.ProcessMessages;
      end;
    end;
  end;

end;

procedure TWRepCre50M.GuardaResumen(tipo:String);
var
  fila,i : Integer;
  vlQry : TQuery;
  LCID : Integer;
  Format : OleVariant;
  archivo : String;
  tabla : TStringAlignGrid;
begin
  If sdArchivoSalida.Execute then
  begin
    archivo := sdArchivoSalida.FileName;
    if FileExists(sdArchivoSalida.FileName) then
    begin
      if MessageDlg('Reporte existente. ¿Desea sobreescribirlo?',
         mtConfirmation, [mbYes, mbNo], 0) <> mrYes
      then archivo := '';
    end;
  end
  else
    archivo := '';

  if tipo = '50M' then
    edArchivoSalida.Text := archivo
  else
    edArchivoSalida2.Text := archivo;

  //Crea el reporte
  if archivo <> '' then
  begin
    // Abre el archivo
    LCID := GetUserDefaultLCID;
    ExcelApplicationO.Connect;
    //Excel.Workbooks.Add(EmptyParam, LCID);
    ExcelWorkbookO.ConnectTo(ExcelApplicationO.Workbooks.Add(EmptyParam, LCID));
    //ExcelWorkbookO.ConnectTo(ExcelApplicationO.ActiveWorkbook);
    ExcelWorksheetO.ConnectTo(ExcelApplicationO.ActiveSheet as _Worksheet);
    // Hace a Excel invisible
    ExcelApplicationO.Visible[LCID] := False;
    ExcelApplicationO.DisplayAlerts[LCID] := False;

    //Define el encabezado
    ExcelWorksheetO.Range['A1','D1'].MergeCells := True;
    ExcelWorksheetO.Range['A2','D2'].MergeCells := True;
    ExcelWorksheetO.Range['A3','D3'].MergeCells := True;
    ExcelWorksheetO.Cells.Item[1,'A'] := 'Banco Interacciones, S. A.';
    if tipo = '50M' then
      ExcelWorksheetO.Cells.Item[2,'A'] := 'Reporte Semanal de Cartera de crédito >50 mdp'
    else
      ExcelWorksheetO.Cells.Item[2,'A'] := 'Reporte Semanal de Cartera de Crédito Comercial';

    ExcelWorksheetO.Cells.Item[3,'A'] := 'Cifras al ' + FormatDateTime('d "de" mmmm "de" yyyy', DTP_FECHA_DIA.date);

    //Formato del encabezado
    with ExcelWorksheetO.Range['A1','A1'].Font do
    begin
      Size := 14;
      FontStyle := 'Bold';
      Name := 'Verdana';
    end;
    //Renglón negro
    ExcelWorksheetO.Range['A3','A3'].Interior.Color := RGB(0,0,0);
    ExcelWorksheetO.Range['A3','A3'].Font.Color := RGB(255,255,255);

    //Centra el encabezado
    ExcelWorksheetO.Range['A1','A1'].HorizontalAlignment := xlCenter;
    ExcelWorksheetO.Range['A2','A2'].HorizontalAlignment := xlCenter;
    ExcelWorksheetO.Range['A3','A3'].HorizontalAlignment := xlCenter;

    fila := 5;
    if tipo = '50M' then
    tabla := sagR50_LAYOUT
      else
    tabla := sagRC_LAYOUT;

    with tabla do
    begin
      for i := 1 to RowCount-1 do
      begin
        ExcelWorksheetO.Cells.Item[fila,'B'] := Cells[1,i];
        ExcelWorksheetO.Cells.Item[fila,'C'] := Cells[2,i];
        fila := fila + 1;
      end;
    end;

    ExcelWorksheetO.Cells.Item[fila,'B'] := 'Total';
    ExcelWorksheetO.Range['C'+IntToStr(fila),'C'+IntToStr(fila)].Formula := '=sum(C5:C'+IntToStr(fila-1)+')';
    ExcelWorksheetO.Range['B'+IntToStr(fila),'C'+IntToStr(fila)].Interior.Color := RGB(0,0,0);
    ExcelWorksheetO.Range['B'+IntToStr(fila),'C'+IntToStr(fila)].Font.Color := RGB(255,255,255);

    //Formato de moneda
    ExcelWorksheetO.Range['C5','C'+IntToStr(fila)].NumberFormat := '#,##0.00';

    //Guarda el archivo con nuevo nombre
    ExcelWorkbookO.SaveAs(archivo,
                          Null,
                          Null,
                          Null,
                          false,
                          false,
                          xlNoChange,
                          xlUserResolution,
                          false,
                          Null,
                          Null,
                          0
                          );

    ExcelApplicationO.Visible[LCID] := True;

  end;
end;

procedure TWRepCre50M.sbArchivoSalidaClick(Sender: TObject);
begin
  if sagR50_LAYOUT.Cells[1,1] = '' then
  begin
    MessageDlg('Debe ejecutar la consulta primero', mtError, [mbOk], 0);
    Exit;
  end;

  GuardaResumen('50M');
end;

procedure TWRepCre50M.sbArchivoSalida2Click(Sender: TObject);
begin
  if sagRC_LAYOUT.Cells[1,1] = '' then
  begin
    MessageDlg('Debe ejecutar la consulta primero', mtError, [mbOk], 0);
    Exit;
  end;

  GuardaResumen('Cartera');
end;

procedure TWRepCre50M.btActualizaClick(Sender: TObject);
begin
  if trim(ed_TipoCambio.text) = ''  then
  begin
    MessageDlg('Debe capturar el Tipo de Cambio', mtError, [mbOk], 0);
    Exit;
  end;
  RunSQL('ALTER SESSION SET '+'"_optimizer_cost_based_transformation" = off',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
  GeneraResumen50M;
end;

procedure TWRepCre50M.btActualiza2Click(Sender: TObject);
begin
  if trim(ed_TipoCambio.text) = ''  then
  begin
    MessageDlg('Debe capturar el Tipo de Cambio', mtError, [mbOk], 0);
    Exit;
  end;
  RunSQL('ALTER SESSION SET '+'"_optimizer_cost_based_transformation" = off',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
  GeneraResumenCartera;
end;



end.
