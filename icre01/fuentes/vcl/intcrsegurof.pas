 // Sistema         : Clase de CR_AM_SEGUPOL y CR_AM_SEGUSIN
 // Fecha de Inicio : 17/03/2010
 // Función forma   : Clase de CR_AM_SEGUPOL y CR_AM_SEGUSIN
 // Desarrollo por  : MACV. Class Maker.
 // Diseñado por    : Manuel Romero Ibarra
 // Comentarios     : se parece a IntCgCueEqu.pas  !!!
unit IntCrSeguroF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DBTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntParamCre,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk,
  // Unidades adicionales
  IntGenCre,
  IntCrCredito,
  IntLinkit, IntSGCtrl, InterEdit,                                       
  IntMPers;

const
  CFAVOR = 'Favor de indicar el/la ';

type
  TCrSeguroF = class;

  TWCrSeguroF = class(TForm)
    InterForma1:     TInterForma;
    Panel1:          TPanel;
    lblContFira:     TLabel;
    btID_CREDITO:    TBitBtn;
    lblNumPoliza:    TLabel;
    lblFinVigencia:  TLabel;
    lblDisposicion:  TLabel;
    edID_CREDITO: TEdit;
    lblAcreditado:   TLabel;
    edNomAcreditado: TEdit;
    edSecuencia:     TEdit;
    lblPromotor:     TLabel;
    lblCobertura:    TLabel;
    idtpF_FinVigencia: TInterDateTimePicker;
    edUnidad:        TRadioGroup;
    edNum_Poliza:    TEdit;
    edF_IniVigencia: TEdit;
    edId_Acreditado: TEdit;
    edId_Promotor:   TEdit;
    edNomPromotor:   TEdit;
    lblPrima:        TLabel;
    lblIniVigencia:  TLabel;
    edF_FinVigencia: TEdit;
    idtpF_IniVigencia: TInterDateTimePicker;
    edF_Pago:        TEdit;
    lblF_Cobro:      TLabel;
    edF_Cobro:       TEdit;
    idtpF_Cobro:     TInterDateTimePicker;
    lblF_Reporte:    TLabel;
    edF_Reporte:     TEdit;
    idtpF_Reporte:   TInterDateTimePicker;
    lblF_Siniestro:  TLabel;
    edF_Siniestro:   TEdit;
    idtpF_Siniestro: TInterDateTimePicker;
    edCheque:        TEdit;
    idtpF_Pago:      TInterDateTimePicker;
    MsgPanel:        TPanel;
    ilID_CREDITO:    TInterLinkit;
    Label1:          TLabel;
    Label2:          TLabel;
    edF_Indemn:      TEdit;
    idtpF_Indemn:    TInterDateTimePicker;
    lblF_Indem:      TLabel;
    lblImpIndemn:    TLabel;
    lblNumCheque:    TLabel;
    lblF_Pago:       TLabel;
    lblVigencia:     TLabel;
    edPrima:         TInterEdit;
    ed_ImpIndemnizado: TInterEdit;
    edCobertura:     TInterEdit;
    Label3: TLabel;
    Label4: TLabel;
    edNUM_INDEMN: TEdit;
    Label5: TLabel;
    edOBSERVACIONES: TMemo;
    Label6: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label8: TLabel;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    sgPolizas: TSGCtrl;
    TabSheet1: TTabSheet;
    sgSiniestros: TSGCtrl;
    edSTATUS: TEdit;
    Msg2Panel: TPanel;
    edTIPO_INDEMN: TComboBox;
    edEST_INDEMN: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure edNum_PolizaExit(Sender: TObject);
    procedure edUnidadExit(Sender: TObject);
    procedure edF_IniVigenciaExit(Sender: TObject);
    procedure edF_FinVigenciaExit(Sender: TObject);
    procedure edF_PagoExit(Sender: TObject);
    procedure edF_CobroExit(Sender: TObject);
    procedure edF_SiniestroExit(Sender: TObject);
    procedure edF_ReporteExit(Sender: TObject);
    procedure edF_IndemnExit(Sender: TObject);
    procedure edChequeExit(Sender: TObject);
    procedure ListaSiniestros;
    procedure ListaPolizas;
    procedure ColocaDatosDeLaPoliza;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure ed_ImpIndemnizadoExit(Sender: TObject);
    procedure edPrimaExit(Sender: TObject);
    procedure edCoberturaExit(Sender: TObject);
    procedure sgPolizasDblClick(Sender: TObject);
    procedure Vigencia;
    procedure FEGA;
    procedure edEST_INDEMNExit(Sender: TObject);
    procedure edNUM_INDEMNExit(Sender: TObject);
    procedure edTIPO_INDEMNExit(Sender: TObject);
    procedure Panel1DblClick(Sender: TObject);
    procedure sgSiniestrosDblClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
    Objeto: TCrSeguroF;
    procedure Consecutivo;
  end;

  TCrSeguroF = class(TInterFrame)
  private
  protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    { Public declarations }
    Ahora: TDateTime;

    ID_CREDITO:  TInterCampo;
    SECUENCIA:   TInterCampo;
    NUM_POLIZA:  TInterCampo;
    UNIDAD:      TInterCampo;
    COBERTURA:   TInterCampo;
    PRIMA:       TInterCampo;
    F_INI_VIG:   TInterCampo;
    F_FIN_VIG:   TInterCampo;
    F_PAGO:      TInterCampo;
    F_COBRO:     TInterCampo;
    F_SINIESTRO: TInterCampo;
    F_REPORTE:   TInterCampo;
    F_INDEMN:    TInterCampo;
    IMP_INDEMN:  TInterCampo;
    NUM_CHEQUE:  TInterCampo;
    TIPO_INDEMN: TInterCampo;
    NUM_INDEMN:  TInterCampo;
    EST_INDEMN:  TInterCampo;
    OBSERVACIONES:  TInterCampo;

    ParamCre: TParamCre;
    Credito:  TCrCredito;//Disposición
    Promotor: TMPersona; //Promotor

    accion: string;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ShowWindow(FormaTipo: TFormaTipo): integer; override;
    function Reporte: boolean; override;
    function InternalPost: boolean; override;
    function InternalBusca: boolean; override;
    function InsertaSiniestro: boolean;
    function ActualizaSiniestro: boolean;

  published
  end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrSeguroF.Create(AOwner: TComponent);
begin
  inherited;
  NUM_POLIZA := CreaCampo('NUM_POLIZA', ftFloat, tsNinguno, tsNinguno, True);
  ID_CREDITO := CreaCampo('ID_CREDITO', ftFloat, tsNinguno, tsNinguno, True);
  UNIDAD := CreaCampo('UNIDAD', ftString, tsNinguno, tsNinguno, True);
  COBERTURA := CreaCampo('COBERTURA', ftFloat, tsNinguno, tsNinguno, True);
  PRIMA  := CreaCampo('PRIMA', ftFloat, tsNinguno, tsNinguno, True);
  F_INI_VIG := CreaCampo('F_INI_VIG', ftDate, tsNinguno, tsNinguno, True);
  F_FIN_VIG := CreaCampo('F_FIN_VIG', ftDate, tsNinguno, tsNinguno, True);
  F_PAGO := CreaCampo('F_PAGO', ftDate, tsNinguno, tsNinguno, True);
  F_COBRO := CreaCampo('F_COBRO', ftDate, tsNinguno, tsNinguno, True);
  SECUENCIA := CreaCampo('SECUENCIA', ftinteger, tsNinguno, tsNinguno, True);
  F_SINIESTRO := CreaCampo('F_SINIESTRO', ftDate, tsNinguno, tsNinguno, True);
  F_REPORTE := CreaCampo('F_REPORTE', ftDate, tsNinguno, tsNinguno, True);
  F_INDEMN := CreaCampo('F_INDEMN', ftDate, tsNinguno, tsNinguno, True);
  IMP_INDEMN := CreaCampo('IMP_INDEMN', ftFloat, tsNinguno, tsNinguno, True);
  NUM_CHEQUE := CreaCampo('NUM_CHEQUE', ftString, tsNinguno, tsNinguno, True);
  TIPO_INDEMN := CreaCampo('TIPO_INDEMN', ftString, tsNinguno, tsNinguno, True);
  {
  With TIPO_INDEMN do
  begin Size:=4;
        UseCombo:=True;
        ComboLista.Add('Vientre'); ComboDatos.Add('Vientre');
        ComboLista.Add('Semental'); ComboDatos.Add('Semental');
        ComboLista.Add('Vientre/Semental'); ComboDatos.Add('Vientre/Semental');
        ComboLista.Add('Otro'); ComboDatos.Add('Otro');
  end;
  }
  NUM_INDEMN := CreaCampo('NUM_INDEMN', ftString, tsNinguno, tsNinguno, True);
  EST_INDEMN := CreaCampo('EST_INDEMN', ftString, tsNinguno, tsNinguno, True);
  {
  With EST_INDEMN do
  begin Size:=4;
        UseCombo:=True;
        ComboLista.Add('En chequera cliente'); ComboDatos.Add('En chequera cliente');
        ComboLista.Add('Aplicado al crédito'); ComboDatos.Add('Aplicado al crédito');
        ComboLista.Add('Reembolsado'); ComboDatos.Add('Reembolsado');
        ComboLista.Add('Otro'); ComboDatos.Add('Otro');
  end;
  }
  OBSERVACIONES := CreaCampo('OBSERVACIONES', ftString, tsNinguno, tsNinguno, True);


  ID_CREDITO.Caption := 'Disposición';
  SECUENCIA.Caption := 'Secuencia';
  NUM_POLIZA.Caption := 'Número de Póliza';
  UNIDAD.Caption := 'Unidad';
  COBERTURA.Caption := 'Cobertura';
  PRIMA.Caption  := 'Prima';
  F_INI_VIG.Caption := 'Inicio de Vigencia';
  F_FIN_VIG.Caption := 'Fin de Vigencia';
  F_PAGO.Caption := 'Fecha de Pago Binter';
  F_COBRO.Caption := 'Fecha de Cobro';
  F_SINIESTRO.Caption := 'Fecha del Siniestro';
  F_REPORTE.Caption := 'Fecha de Reporte';
  F_INDEMN.Caption := 'Fecha de Indeminización';
  IMP_INDEMN.Caption := 'Importe de la Indemnización';
  NUM_CHEQUE.Caption := 'Número de Cheque';
  OBSERVACIONES.Caption := 'Observaciones';

  with UNIDAD do
  begin
    Size := 2;
    UseCombo := True;
    ComboLista.Add('0');        ComboDatos.Add('CA');  // Cabezas
    ComboLista.Add('1');        ComboDatos.Add('HA');  // Hectáreas
    ComboLista.Add('2');        ComboDatos.Add('VI');  // Vida
    ComboLista.Add('3');        ComboDatos.Add('MA');  // Maquinaria
  end;

  FKeyFields.Add('ID_CREDITO');
  FKeyFields.Add('SECUENCIA');

  Credito := TCrCredito.Create(Self);
  Credito.MasterSource := Self;
  Credito.FieldByName('ID_CREDITO').MasterField := 'ID_CREDITO';

  Promotor := TMPersona.Create(Self);
  Promotor.MasterSource := Self;

  TableName := 'ADMIPROD.CR_AM_SEGUPOL';
  UseQuery  := True;
  HelpFile  := 'IntCrSeguroF.Hlp';
  ShowMenuReporte := True;
end;

destructor TCrSeguroF.Destroy;
begin
  if Credito <> nil then
    Credito.Free;
  if Promotor <> nil then
    Promotor.Free;
  inherited;
end;


function TCrSeguroF.ShowWindow(FormaTipo: TFormaTipo): integer;
var
  W: TWCrSeguroF;
begin
  W := TWCrSeguroF.Create(Self);
  try
    W.Objeto := Self;
    W.InterForma1.InterFrame := Self;
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


function TCrSeguroF.InternalBusca: boolean;
var
  T: TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrAmSegF.it', 'F,I');
  try
    if Active then
    begin
      T.Param(0, ID_CREDITO.AsString);
      T.Param(1, SECUENCIA.AsString);
    end;
    if T.Execute then
    begin
      InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1)]);
    end;
  finally
    T.Free;
  end;
end;

function TCrSeguroF.Reporte: boolean;
begin //Execute_Reporte();
end;

function TCrSeguroF.InternalPost: boolean;
begin
  if (Modo = moAppend) or (Modo = moEdit) then
  begin
    NUM_POLIZA.GetFromControl;
    ID_CREDITO.GetFromControl;
    UNIDAD.GetFromControl;
    COBERTURA.GetFromControl;
    PRIMA.GetFromControl;
    F_INI_VIG.GetFromControl;
    F_FIN_VIG.GetFromControl;
    F_PAGO.GetFromControl;
    F_COBRO.GetFromControl;
    OBSERVACIONES.GetFromControl;
    F_SINIESTRO.GetFromControl;
    F_REPORTE.GetFromControl;
    IMP_INDEMN.GetFromControl;
    F_INDEMN.GetFromControl;
    NUM_CHEQUE.GetFromControl;
    TIPO_INDEMN.GetFromControl;
    EST_INDEMN.GetFromControl;
    NUM_INDEMN.GetFromControl;
  end;
  AutoRefresh := True;

  case Modo of
    moAppend:
    begin
      InsertaSiniestro;
      Result := True;
    end;

    moEdit:
    begin
      ActualizaSiniestro;
      Result := True;
    end;
    else
      Result := False;
  end;

end;

function TCrSeguroF.ActualizaSiniestro: boolean;
var
  Sql: string;
  sTemp : String;
  poliza : String;
  iTemp : Integer;
begin

  Result := True;

  //Actualiza todas las pólizas
  if NUM_POLIZA.AsString <> '' then
  begin
    sTemp := COBERTURA.AsString;
    if trim(sTemp) = '' then
      sTemp := 'null';

    //Obtiene el número de poliza original
    sql := ' select NUM_POLIZA from cr_am_segupol where ID_CREDITO = ' + ID_CREDITO.AsString +
           ' and SECUENCIA = ' + SECUENCIA.AsString;
    GetSQLStr(sql, Apli.DataBaseName, Apli.SessionName, 'NUM_POLIZA', poliza, False);

    sql := ' select count(id_credito) as num from cr_am_segupol where  ID_CREDITO = ' + ID_CREDITO.AsString +
           ' and NUM_POLIZA = ''' + poliza + '''';
    GetSQLInt(sql, Apli.DataBaseName, Apli.SessionName, 'num', iTemp, False);
    if iTemp = 0 then
      poliza := 'null';


    sql :=
      ' update cr_am_segupol set ' +
      ' NUM_POLIZA = ''' + NUM_POLIZA.AsString + ''', ' +
      ' UNIDAD = ''' + UNIDAD.AsString + ''', ' +
      ' COBERTURA = ' + sTemp + ', ' +
      ' PRIMA = ' + PRIMA.AsString + ', ' +
      ' F_INI_VIG = to_date(''' + F_INI_VIG.AsString + ''',''dd/mm/yyyy''), ' +
      ' F_FIN_VIG = to_date(''' + F_FIN_VIG.AsString + ''',''dd/mm/yyyy''), ' +
      ' F_COBRO = to_date(''' + F_COBRO.AsString + ''',''dd/mm/yyyy''), ' +
      ' F_PAGO = to_date(''' + F_PAGO.AsString + ''',''dd/mm/yyyy''), ' +
      ' OBSERVACIONES = ''' + OBSERVACIONES.AsString + ''' ' +
      ' where ID_CREDITO = ' + ID_CREDITO.AsString;
    if poliza = 'null' then
      sql := sql + ' and NUM_POLIZA is null'
    else
      sql := sql + ' and NUM_POLIZA = ''' + poliza + '''';
      //** Tomar el número de poliza de la búsqueda
    Result := RunSql(sql, Apli.DatabaseName, Apli.SessionName, False);
  end;
  //los siniestros
  if NUM_POLIZA.AsString <> '' then
  begin
    sql :=
      ' update cr_am_segupol set ' +
      ' F_SINIESTRO = to_date(''' + F_SINIESTRO.AsString + ''',''dd/mm/yyyy''), ' +
      ' F_REPORTE = to_date(''' + F_REPORTE.AsString + ''',''dd/mm/yyyy''), ' +
      ' IMP_INDEMN = ' + IMP_INDEMN.AsString + ', ' +
      ' F_INDEMN = to_date(''' + F_INDEMN.AsString + ''',''dd/mm/yyyy''), ' +
      ' NUM_CHEQUE = ''' + NUM_CHEQUE.AsString + ''', ' +
      ' TIPO_INDEMN = ''' + TIPO_INDEMN.AsString + ''', ' +
      ' NUM_INDEMN = ''' + NUM_INDEMN.AsString + ''', ' +
      ' EST_INDEMN = ''' + EST_INDEMN.AsString + ''' ' +
      ' where ID_CREDITO = ' + ID_CREDITO.AsString +
      ' and SECUENCIA = ' + SECUENCIA.AsString;
    Result := Result AND RunSql(sql, Apli.DatabaseName, Apli.SessionName, False);
  end;
end;


function TCrSeguroF.InsertaSiniestro: boolean;
var
  vlResult: boolean;
  qry1, qyQuery: TQuery;
  SQL: string;
begin
  InsertaSiniestro := False;

  if ((trim(F_SINIESTRO.AsString) <> '') or
     (trim(F_REPORTE.AsString) <> '') or
     (trim(IMP_INDEMN.AsString) <> '0.00') or
     (trim(F_INDEMN.AsString) <> '') or
     (trim(NUM_CHEQUE.AsString) <> '') or
     (trim(TIPO_INDEMN.AsString) <> '') or
     (trim(NUM_INDEMN.AsString) <> '') or
     (trim(EST_INDEMN.AsString) <> '')) and (trim(NUM_POLIZA.AsString) = '') then
  begin
    ShowMessage('No puede dar de alta indemnización sin número de poliza');
    Exit;
  end;


  SECUENCIA.AsInteger := 1;

  SQL := ' select max(pol.secuencia) as MAXSEC from cr_am_segupol pol';

  try
    qry1 := GetSQLQuery(SQL, DataBaseName, SessionName, False);
    if qry1 <> nil then
    begin
      SECUENCIA.AsInteger := qry1.FieldByName('MAXSEC').AsInteger + 1;
    end;
  finally
    qry1.Free;
  end;

  SQL :=
    ' insert into cr_am_segupol (num_poliza, id_credito, unidad, cobertura, prima, f_ini_vig, f_fin_vig, ' +
    ' f_pago, f_cobro, observaciones, secuencia, f_siniestro,f_reporte,imp_indemn,f_indemn,num_cheque, tipo_indemn, num_indemn, est_indemn) ' +
    ' values ( ' +
    ' ''' + NUM_POLIZA.AsString + ''', ' +
    ID_CREDITO.AsString + ', ' +
    ' ''' + UNIDAD.AsString + ''', ' +
    COBERTURA.AsString + ', ' +
    PRIMA.AsString + ', ' +
    ' to_date (''' + F_INI_VIG.AsString + ''', ''dd/mm/yyyy''), ' +
    ' to_date (''' + F_FIN_VIG.AsString + ''', ''dd/mm/yyyy''), ' +
    ' to_date (''' + F_PAGO.AsString + ''', ''dd/mm/yyyy''), ' +
    ' to_date (''' + F_COBRO.AsString + ''', ''dd/mm/yyyy''), ' +
    ' ''' + OBSERVACIONES.AsString + ''', ' +
    SECUENCIA.AsString + ', ' +
    ' to_date (''' + F_SINIESTRO.AsString + ''', ''dd/mm/yyyy''), ' +
    ' to_date (''' + F_REPORTE.AsString + ''', ''dd/mm/yyyy''), ' +
    IMP_INDEMN.AsString + ', ' +
    ' to_date (''' + F_INDEMN.AsString + ''', ''dd/mm/yyyy''), ' +
    '''' + NUM_CHEQUE.AsString + ''', ' +
    '''' + TIPO_INDEMN.AsString + ''', ' +
    '''' + NUM_INDEMN.AsString + ''', ' +
    '''' + EST_INDEMN.AsString + ''') ';

  if RunSql(SQL, Apli.DatabaseName, Apli.SessionName, True) then
    InsertaSiniestro := True;
end;


 (****************************************FORMA CR_AM_SEGUPOL********************)
 (*                                                                             *)
 (*  FORMA DE CR_AM_BITACORA                                                    *)
 (*                                                                             *)
 (****************************************FORMA CR_AM_SEGUPOL********************)

procedure TWCrSeguroF.FormShow(Sender: TObject);
begin
  //Datos del panel de la parte inferior de la forma
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption  := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption := objeto.ParamCre.PERFIL.AsString;
  
  with objeto do
  begin
    ID_CREDITO.Control := edID_Credito;
    NUM_POLIZA.Control := edNum_Poliza;
    UNIDAD.Control := edUnidad;
    COBERTURA.Control := edCobertura;
    PRIMA.Control  := edPrima;
    F_INI_VIG.Control := edF_IniVigencia;
    F_FIN_VIG.Control := edF_FinVigencia;
    F_PAGO.Control := edF_Pago;
    F_COBRO.Control := edF_Cobro;
    OBSERVACIONES.Control := edOBSERVACIONES;
    F_SINIESTRO.Control := edF_Siniestro;
    F_REPORTE.Control := edF_Reporte;
    F_INDEMN.Control := edF_Indemn;
    IMP_INDEMN.Control := ed_ImpIndemnizado;
    NUM_CHEQUE.Control := edCheque;
    TIPO_INDEMN.Control := edTIPO_INDEMN;
    NUM_INDEMN.Control := edNUM_INDEMN;
    EST_INDEMN.Control := edEST_INDEMN;

    Credito.ContratoCre.Contrato.ID_Titular.Control := edId_Acreditado;
    Credito.ContratoCre.Contrato.TITNombre.Control := edNomAcreditado;
    Credito.ContratoCre.ID_PROM_ADMON.Control := edID_PROMOTOR;
    Promotor.Nombre.Control := edNomPromotor;

  end;

  Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrSeguroF.FormDestroy(Sender: TObject);
begin
  with Objeto do
  begin
    ID_CREDITO.Control := nil;
    NUM_POLIZA.Control := nil;
    UNIDAD.Control := nil;
    COBERTURA.Control := nil;
    PRIMA.Control  := nil;
    F_INI_VIG.Control := nil;
    F_FIN_VIG.Control := nil;
    F_PAGO.Control := nil;
    F_COBRO.Control := nil;
    OBSERVACIONES.Control := nil;
    F_SINIESTRO.Control := nil;
    F_REPORTE.Control := nil;
    F_INDEMN.Control := nil;
    IMP_INDEMN.Control := nil;
    NUM_CHEQUE.Control := nil;
    TIPO_INDEMN.Control := nil;
    NUM_INDEMN.Control := nil;
    EST_INDEMN.Control := nil;

    Credito.ContratoCre.Contrato.ID_Titular.Control := nil;
    Credito.ContratoCre.Contrato.TITNombre.Control := nil;
    Credito.ContratoCre.ID_PROM_ADMON.Control := nil;
    Promotor.Nombre.Control := nil;
  end;
end;

procedure TWCrSeguroF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrSeguroF.InterForma1DespuesNuevo(Sender: TObject);
begin
  if edID_CREDITO.CanFocus then
    edID_CREDITO.SetFocus;
  edUnidad.ItemIndex := 0;
  Msg2Panel.Caption := '';
  Msg2Panel.Color := clBtnFace;
  Consecutivo;
  ListaSiniestros;
  ListaPolizas;
end;

 //procedure TWCrSeguro.BitBtn1Click(Sender: TObject);
 //begin // Objeto.Reporte;
 //end;


procedure TWCrSeguroF.Consecutivo;
var
   vlSQL : String;
   vlQry : TQuery;
begin
  if (Objeto.Modo = moAppend) Or (Objeto.Modo = moEdit) Then
  begin
    Objeto.ID_CREDITO.GetFromControl;
    vlSQL :=
      ' select count(id_credito)+1 as consecutivo '+
      ' from CR_AM_SEGUPOL '+
      ' where id_credito = ' + Objeto.ID_CREDITO.AsString+
      ' group by id_credito  ';

    vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DatabaseName, objeto.Apli.SessionName, False );

    If Assigned(vlQry) Then
    begin
      Try
        edSecuencia.Text := vlQry.FieldByName('consecutivo').AsString;
      Finally
        vlQry.Free;
      End;
    end
    else
      edSecuencia.Text := '1';
  end;
end;

procedure TWCrSeguroF.btID_CREDITOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRSEGUROF_DISP',True,True) then
   begin
      Objeto.Credito.ShowAll := True;
      if Objeto.Credito.Busca then
      begin
        Objeto.Promotor.FindKey([Objeto.Credito.ContratoCre.ID_PROM_ADMON.AsString]);
        Consecutivo;
        ListaSiniestros;
        ListaPolizas;
        InterForma1.NextTab(edID_CREDITO);
      end;
   end;   
end;

procedure TWCrSeguroF.ilID_CREDITOEjecuta(Sender: TObject);
begin
  Objeto.Credito.ShowAll := True;
  if Objeto.Credito.FindKey([ilID_CREDITO.buffer]) then
  begin
    Objeto.Promotor.FindKey([Objeto.Credito.ContratoCre.ID_PROM_ADMON.AsString]);
    Consecutivo;
    ListaSiniestros;
    ListaPolizas;
    InterForma1.NextTab(edID_CREDITO);
  end;
end;


procedure TWCrSeguroF.edID_CREDITOExit(Sender: TObject);
var
  vlbSalida: boolean;
  vlStrMesg: string;
begin
  vlbSalida := True;
  vlStrMesg := '';

  if (objeto.Modo = moAppend) or (objeto.Modo = moEdit) then
  begin
    objeto.ID_CREDITO.GetFromControl;
    if (objeto.ID_CREDITO.AsString = '') then
    begin
      vlbSalida := False;
      vlStrMesg := CFAVOR + lblDisposicion.Caption;
    end;
  end;
  FEGA;
  InterForma1.ValidaExit(edID_CREDITO, vlbSalida, vlStrMesg, True);
end;


procedure TWCrSeguroF.edNum_PolizaExit(Sender: TObject);
begin
  ColocaDatosDeLaPoliza;
  Vigencia;
  InterForma1.ValidaExit(edNum_Poliza, True, '', True);
end;

procedure TWCrSeguroF.edUnidadExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edUnidad, True, '', True);
end;

procedure TWCrSeguroF.edF_IniVigenciaExit(Sender: TObject);
var
  vlbSalida: boolean;
  vlStrMesg: String;
begin
  vlbSalida := True;
  vlStrMesg := '';

  if (objeto.Modo = moAppend) or (objeto.Modo = moEdit) then
  begin
    objeto.F_INI_VIG.GetFromControl;
    if objeto.F_INI_VIG.AsString = '' then
    begin
      vlbSalida := False;
      vlStrMesg := 'Favor de indicar la Fecha de inicio de Vigencia';
    end;
  end;
  InterForma1.ValidaExit(edF_IniVigencia, vlbSalida, vlStrMesg, True);
end;

procedure TWCrSeguroF.FEGA;
var
  vlSQL : String;
  sText : String;
begin
  if (objeto.Modo = moAppend) or (objeto.Modo = moEdit) then
  begin
  vlSQL := ' select nvl(B_GAR_VIGENTE,''F'') as B_GAR_VIGENTE from cr_am_dispf where id_credito = ' + edID_CREDITO.Text;
  GetSQLStr(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, 'B_GAR_VIGENTE', sText, False);
  if sText = 'V' then
  begin
    Msg2Panel.Caption := 'Crédito con garantía de FIRA ejecutada';
    Msg2Panel.Color := clYellow;
  end
  else
  begin
    Msg2Panel.Caption := '';
    Msg2Panel.Color := clBtnFace;
  end;
  end;
end;

procedure TWCrSeguroF.Vigencia;
var
  vlSQL : String;
  sText : String;
  fecha : TDateTime;
begin
  if (objeto.F_INI_VIG.AsString = '') or (objeto.F_FIN_VIG.AsString = '') then
    Exit;

  if (objeto.F_INI_VIG.AsDateTime <= Date) and (Date <= objeto.F_FIN_VIG.AsDateTime) then
  begin
    if (objeto.F_PAGO.AsString = '') and (objeto.F_COBRO.AsString = '') then
      edSTATUS.Text := 'VIGENTE NO PAGADA'
    else
      edSTATUS.Text := 'VIGENTE PAGADA'
  end
  else if (objeto.F_INI_VIG.AsDateTime <= Date) and (objeto.F_FIN_VIG.AsDateTime <= Date) then
  begin
    if (objeto.F_PAGO.AsString = '') and (objeto.F_COBRO.AsString = '') then
      edSTATUS.Text := 'VENCIDA NO PAGADA'
    else
      edSTATUS.Text := 'VENCIDA PAGADA'
  end
  else
    edSTATUS.Text := '';

  FEGA;
end;

procedure TWCrSeguroF.edF_FinVigenciaExit(Sender: TObject);   
var
  vlbSalida: boolean;
  vlStrMesg: string;
begin
  vlbSalida := True;
  vlStrMesg := '';

  if (objeto.Modo = moAppend) or (objeto.Modo = moEdit) then
  begin
    objeto.F_FIN_VIG.GetFromControl;
    if objeto.F_FIN_VIG.AsString = '' then
    begin
      vlbSalida := False;
      vlStrMesg := 'Favor de indicar la Fecha de fin de Vigencia';
    end;

  end;
  vigencia;

  InterForma1.ValidaExit(edF_FinVigencia, vlbSalida, vlStrMesg, True);
end;

procedure TWCrSeguroF.edF_PagoExit(Sender: TObject);
var
  vlbSalida: boolean;
  vlStrMesg: string;
begin
  vlbSalida := True;
  vlStrMesg := '';
{
  if (objeto.Modo = moAppend) or (objeto.Modo = moEdit) then
  begin
    objeto.F_PAGO.GetFromControl;
    if objeto.F_PAGO.AsString <> '' then
    begin
      objeto.F_INI_VIG.GetFromControl;
      if (objeto.F_PAGO.AsDateTime < objeto.F_INI_VIG.AsDateTime) then
      begin
        vlbSalida := False;
        vlStrMesg := 'La fecha de pago no puede ser menor a la vigencia';
      end;
    end;
  end;
  }
  InterForma1.ValidaExit(edF_Pago, vlbSalida, vlStrMesg, True);
end;

procedure TWCrSeguroF.edF_CobroExit(Sender: TObject);
var
  vlbSalida: boolean;
  vlStrMesg: string;
begin
  vlbSalida := True;
  vlStrMesg := '';
{
  if (objeto.Modo = moAppend) or (objeto.Modo = moEdit) then
  begin
    objeto.F_COBRO.GetFromControl;
    if objeto.F_COBRO.AsString <> '' then
    begin
      objeto.F_INI_VIG.GetFromControl;
      if (objeto.F_COBRO.AsDateTime < objeto.F_INI_VIG.AsDateTime) then
      begin
        vlbSalida := False;
        vlStrMesg := 'La fecha de cobro no puede ser menor a la vigencia';
      end;
    end;
  end;
}  
  InterForma1.ValidaExit(edF_Cobro, vlbSalida, vlStrMesg, True);
end;

procedure TWCrSeguroF.edF_SiniestroExit(Sender: TObject);
var
  vlbSalida: boolean;
  vlStrMesg: string;
begin
  vlbSalida := True;
  vlStrMesg := '';
  with Objeto do
    if (Modo = moAppend) or (Modo = moEdit) then
    begin
      F_SINIESTRO.GetFromControl;
      if (Trim(F_SINIESTRO.AsString) <> '') then
      begin
        if (F_SINIESTRO.AsDateTime > F_FIN_VIG.AsDateTime) or
          (F_SINIESTRO.AsDateTime < F_INI_VIG.AsDateTime) then
        begin
          vlbSalida := False;
          vlStrMesg := 'La fecha del siniestro está fuera de Vigencia';
        end else
        if trim(edF_Reporte.Text) <> '' then
        begin
          F_REPORTE.GetFromControl;
          if (F_SINIESTRO.AsDateTime > F_REPORTE.AsDateTime) then
          begin
            vlbSalida := False;
            vlStrMesg :=
              'La fecha del siniestro no puede ser mayor que la del reporte';
          end;
        end;
      end;
    end;
  InterForma1.ValidaExit(edF_Siniestro, vlbSalida, vlStrMesg, True);
end;

procedure TWCrSeguroF.edF_ReporteExit(Sender: TObject);
var
  vlbSalida: boolean;
  vlStrMesg: string;
begin
  vlbSalida := True;
  vlStrMesg := '';
  with Objeto do
    if (Modo = moAppend) or (Modo = moEdit) then
    begin
      F_REPORTE.GetFromControl;
      if (Trim(F_REPORTE.AsString) <> '') then
      begin

        if (F_REPORTE.AsDateTime > F_FIN_VIG.AsDateTime) or
          (F_REPORTE.AsDateTime < F_INI_VIG.AsDateTime) then
        begin
          vlbSalida := False;
          vlStrMesg := 'La fecha del reporte está fuera de la Vigencia';
        end else

        if trim(edF_Siniestro.Text) <> '' then
        begin
          F_SINIESTRO.GetFromControl;
          if (F_REPORTE.AsDateTime < F_SINIESTRO.AsDateTime) then
          begin
            vlbSalida := False;
            vlStrMesg := 'La fecha del reporte no puede ser menor a la del siniestro';
          end;
        end;
      end;
    end;
  InterForma1.ValidaExit(edF_Reporte, vlbSalida, vlStrMesg, True);
end;

procedure TWCrSeguroF.edF_IndemnExit(Sender: TObject);
var
  vlbSalida: boolean;
  vlStrMesg: string;
begin
  vlbSalida := True;
  vlStrMesg := '';
  with Objeto do
    if (Modo = moAppend) or (Modo = moEdit) then
    begin
      F_INDEMN.GetFromControl;
      if (Trim(F_INDEMN.AsString) <> '') then
      begin
        if trim(edF_Reporte.Text) <> '' then
        begin
          F_REPORTE.GetFromControl;
          if (F_REPORTE.AsDateTime > F_INDEMN.AsDateTime) then
          begin
            vlbSalida := False;
            vlStrMesg :=
              'La fecha de indemnización no puede ser menor a la del reporte';
          end;
        end;
      end;
    end;
  InterForma1.ValidaExit(edF_Indemn, vlbSalida, vlStrMesg, True);
end;

procedure TWCrSeguroF.edChequeExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edCheque, True, '', True);
end;

procedure TWCrSeguroF.ColocaDatosDeLaPoliza;
var
  SQL: string;
  qyQuery: TQuery;
begin
  if (objeto.Modo = moAppend) or (objeto.Modo = moEdit) then
  begin
    objeto.NUM_POLIZA.GetFromControl;
    objeto.ID_CREDITO.GetFromControl;
  end;

  SQL :=
    ' select COBERTURA, UNIDAD, PRIMA, ' +
    '  F_INI_VIG, F_FIN_VIG, F_PAGO, F_COBRO ' +
    ' from cr_am_segupol' +
    ' where ID_CREDITO =  ' + objeto.ID_CREDITO.AsString +
    ' and NUM_POLIZA = ''' + objeto.NUM_POLIZA.AsString+'''';
      
  qyQuery := GetSQLQueryNoNil(SQL, objeto.Apli.DatabaseName,
    objeto.Apli.SessionName, True);
  if Assigned(qyQuery) then
    try
      if not (qyQuery.IsEmpty) then
        with objeto do
        begin
          COBERTURA.AsString := qyQuery.FieldByName('COBERTURA').AsString;
          UNIDAD.AsString := qyQuery.FieldByName('UNIDAD').AsString;
          PRIMA.AsString  := qyQuery.FieldByName('PRIMA').AsString;
          F_INI_VIG.AsString := qyQuery.FieldByName('F_INI_VIG').AsString;
          F_FIN_VIG.AsString := qyQuery.FieldByName('F_FIN_VIG').AsString;
          F_PAGO.AsString := qyQuery.FieldByName('F_PAGO').AsString;
          F_COBRO.AsString := qyQuery.FieldByName('F_COBRO').AsString;
        end;
    finally
      qyQuery.Free;
    end;

end;


procedure TWCrSeguroF.ListaSiniestros;
var
  vlSQL: string;
  vgQrySiniestros: TQuery;
begin
  sgSiniestros.Clear('NO EXISTEN DATOS'#30'>C');
  if edID_Credito.Text <> '' then
  begin

    vlSQL :=
      ' select   secuencia, num_poliza, ' +
      '          p.cobertura, ' +
      '          num_indemn, ' +
      '          (cober.cobertura - sum (num_indemn) over (order by secuencia)) as cabezas_actuales, ' +
      '          f_indemn, ' +
      '          tipo_indemn, ' +
      '          imp_indemn, ' +
      '          num_cheque ' +
      ' from     cr_am_segupol p, ' +
      '          (select pol.id_credito, pol.cobertura ' +
      '           from   cr_am_segupol pol, ' +
      '                  (select   id_credito, ' +
      '                            min (secuencia) as secuencia ' +
      '                   from     cr_am_segupol ' +
      '                   group by id_credito) indemn ' +
      '           where  pol.id_credito = indemn.id_credito and pol.secuencia = indemn.secuencia) cober ' +
      ' where    p.id_credito = cober.id_credito and p.id_credito = ' + edID_Credito.Text +
      ' order by secuencia ';

    vgQrySiniestros := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DatabaseName,
      Objeto.Apli.SessionName, True);
    if Assigned(vgQrySiniestros) then
    begin
      try
        vgQrySiniestros.FieldByName('SECUENCIA').DisplayLabel := '';
        vgQrySiniestros.FieldByName('SECUENCIA').DisplayWidth := 0;
        vgQrySiniestros.FieldByName('SECUENCIA').Visible := False;
        vgQrySiniestros.FieldByName('NUM_POLIZA').DisplayLabel := 'Poliza';
        vgQrySiniestros.FieldByName('NUM_POLIZA').DisplayWidth := 20;
        vgQrySiniestros.FieldByName('COBERTURA').DisplayLabel := 'Cobertura';
        vgQrySiniestros.FieldByName('COBERTURA').DisplayWidth := 16 ;
        vgQrySiniestros.FieldByName('NUM_INDEMN').DisplayLabel  := 'Indemnizaciones';
        vgQrySiniestros.FieldByName('NUM_INDEMN').DisplayWidth  := 16;
        vgQrySiniestros.FieldByName('CABEZAS_ACTUALES').DisplayLabel  := 'Cab. Actuales';
        vgQrySiniestros.FieldByName('CABEZAS_ACTUALES').DisplayWidth  := 16;
        vgQrySiniestros.FieldByName('F_INDEMN').DisplayLabel := 'F Indem.';
        vgQrySiniestros.FieldByName('F_INDEMN').DisplayWidth := 16;
        vgQrySiniestros.FieldByName('TIPO_INDEMN').DisplayLabel := 'T Indem.';
        vgQrySiniestros.FieldByName('TIPO_INDEMN').DisplayWidth := 16;
        vgQrySiniestros.FieldByName('IMP_INDEMN').DisplayLabel := 'Imp Indem.';
        vgQrySiniestros.FieldByName('IMP_INDEMN').DisplayWidth := 16;
        vgQrySiniestros.FieldByName('NUM_CHEQUE').DisplayLabel := 'Cheque';
        vgQrySiniestros.FieldByName('NUM_CHEQUE').DisplayWidth := 16;

        sgSiniestros.AddQry(vgQrySiniestros, True, True, -1, -1, -1, True);
      finally
        vgQrySiniestros.Free;
      end;
    end;

  end;

end;


procedure TWCrSeguroF.ListaPolizas;
var
  vlSQL: string;
  vgQryPolizas: TQuery;
begin
  sgPolizas.Clear('NO EXISTEN DATOS'#30'>C');
  if edID_Credito.Text <> '' then
  begin

    vlSQL :=
      ' select   SECUENCIA, ' +
      '          NUM_POLIZA, ' +
      '          COBERTURA, ' +
      '          PRIMA, ' +
      '          F_INI_VIG, ' +
      '          F_FIN_VIG, ' +
      '          F_PAGO, ' +
      '          F_COBRO ' +
      ' from     cr_am_segupol ' +
      ' where    id_credito = ' + edID_Credito.Text + ' and secuencia in (select   min (SECUENCIA) ' +
      '                                                from     CR_AM_SEGUPOL ' +
      '                                                where    ID_CREDITO = ' + edID_Credito.Text +
      '                                                group by num_poliza) ' +
      ' order by secuencia ';

    vgQryPolizas := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DatabaseName,
      Objeto.Apli.SessionName, True);
    if Assigned(vgQryPolizas) then
    begin
      try
        vgQryPolizas.FieldByName('SECUENCIA').DisplayLabel := '';
        vgQryPolizas.FieldByName('SECUENCIA').DisplayWidth := 0;
        vgQryPolizas.FieldByName('SECUENCIA').Visible := False;
        vgQryPolizas.FieldByName('NUM_POLIZA').DisplayLabel := 'Poliza';
        vgQryPolizas.FieldByName('NUM_POLIZA').DisplayWidth := 20;
        vgQryPolizas.FieldByName('COBERTURA').DisplayLabel := 'Cobertura';
        vgQryPolizas.FieldByName('COBERTURA').DisplayWidth := 4 ;
        vgQryPolizas.FieldByName('PRIMA').DisplayLabel  := 'Prima';
        vgQryPolizas.FieldByName('PRIMA').DisplayWidth  := 12;
        vgQryPolizas.FieldByName('F_INI_VIG').DisplayLabel := 'Ini Vigencia';
        vgQryPolizas.FieldByName('F_INI_VIG').DisplayWidth := 12;
        vgQryPolizas.FieldByName('F_FIN_VIG').DisplayLabel := 'Fin Vigencia';
        vgQryPolizas.FieldByName('F_FIN_VIG').DisplayWidth := 12;
        vgQryPolizas.FieldByName('F_PAGO').DisplayLabel := 'F Pago Binter';
        vgQryPolizas.FieldByName('F_PAGO').DisplayWidth := 12;
        vgQryPolizas.FieldByName('F_COBRO').DisplayLabel := 'F Cobro';
        vgQryPolizas.FieldByName('F_COBRO').DisplayWidth := 12;

        sgPolizas.AddQry(vgQryPolizas, True, True, -1, -1, -1, True);
      finally
        vgQryPolizas.Free;
      end;
    end;

  end;

end;

procedure TWCrSeguroF.InterForma1DespuesAceptar(Sender: TObject);
begin
  ListaSiniestros;
  ListaPolizas;
end;


procedure TWCrSeguroF.ed_ImpIndemnizadoExit(Sender: TObject);
begin
  InterForma1.ValidaExit(ed_ImpIndemnizado, True, '', True);
end;

procedure TWCrSeguroF.edPrimaExit(Sender: TObject);
var
  vlbSalida: boolean;
  vlStrMesg: string;
begin
  vlbSalida := True;
  vlStrMesg := '';
  if (objeto.Modo = moAppend) or (objeto.Modo = moEdit) then
  begin
    objeto.PRIMA.GetFromControl;
    if (objeto.PRIMA.AsString = '') or (objeto.PRIMA.AsFloat = 0) then
    begin
      vlbSalida := False;
      vlStrMesg := 'La prima no puede ser cero';
    end;
  end;
  InterForma1.ValidaExit(edPrima, vlbSalida, vlStrMesg, True);
end;

procedure TWCrSeguroF.edCoberturaExit(Sender: TObject);
var
  vlbSalida: boolean;
  vlStrMesg: string;
begin
  vlbSalida := True;
  vlStrMesg := '';

  if (objeto.Modo = moAppend) or (objeto.Modo = moEdit) then
  begin
    objeto.COBERTURA.GetFromControl;
    if (objeto.COBERTURA.AsString = '') or (objeto.COBERTURA.AsString = '0') then
    begin
      vlbSalida := False;
      vlStrMesg := 'La cobertura no puede ser cero';
    end;
  end;
  InterForma1.ValidaExit(edCobertura, vlbSalida, vlStrMesg, True);
end;

procedure TWCrSeguroF.InterForma1Buscar(Sender: TObject);
begin
 With Objeto Do
   If Busca Then
   Begin
     Objeto.Promotor.FindKey([Objeto.Credito.ContratoCre.ID_PROM_ADMON.AsString]);
     edSecuencia.Text := '';
     vigencia;
     ListaSiniestros;
     ListaPolizas;
   End;
end;

procedure TWCrSeguroF.sgPolizasDblClick(Sender: TObject);
var
  row : Integer;
  sec,pol   : String;
begin
  if objeto.Modo = moBrowse then
  begin

    row := sgPolizas.SG.Row;
    sec := sgPolizas.SG.Cells[3,row];

    Objeto.FindKey([edID_CREDITO.Text, sec]);
    Vigencia;
    Objeto.Promotor.FindKey([Objeto.Credito.ContratoCre.ID_PROM_ADMON.AsString]);

  end;
end;

procedure TWCrSeguroF.sgSiniestrosDblClick(Sender: TObject);
var
  row : Integer;
  sec,pol   : String;
begin
  if objeto.Modo = moBrowse then
  begin

    row := sgSiniestros.SG.Row;
    sec := sgSiniestros.SG.Cells[3,row];

    Objeto.FindKey([edID_CREDITO.Text, sec]);
    Vigencia;
    Objeto.Promotor.FindKey([Objeto.Credito.ContratoCre.ID_PROM_ADMON.AsString]);
  end;
end;

procedure TWCrSeguroF.edEST_INDEMNExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edEST_INDEMN, True, '', True);
end;

procedure TWCrSeguroF.edNUM_INDEMNExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edNUM_INDEMN, True, '', True);
end;

procedure TWCrSeguroF.edTIPO_INDEMNExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edTIPO_INDEMN, True, '', True);
end;

procedure TWCrSeguroF.Panel1DblClick(Sender: TObject);
var
  row : Integer;
  sec,pol   : String;
begin
  if objeto.Modo = moBrowse then
  begin
    //for row := 0 to 15 do

    row := sgPolizas.SG.Row;
    sec := sgPolizas.SG.Cells[3,row];

    Objeto.FindKey([edID_CREDITO.Text, sec]);
    Objeto.Promotor.FindKey([Objeto.Credito.ContratoCre.ID_PROM_ADMON.AsString]);
  end;
end;

procedure TWCrSeguroF.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  Objeto.TIPO_INDEMN.AsString := edTIPO_INDEMN.Text;
  Objeto.EST_INDEMN.AsString := edEST_INDEMN.Text;
end;

end.
