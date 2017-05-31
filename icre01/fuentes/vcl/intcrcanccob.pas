{
+------------------------------------------------------------------------------+
|                                                                              |
|      MODULO: COBRANZA     SUBMODULO: DESCUENTO DE DOCUMENTOS                 |
|                                                                               |
+------------------------------------------------------------------------------+
}
// CON CAMBIO DE CLAVES DE OPERACION
// COMPATIBLE CON REDESCUENTO
unit IntCrCancCob;

interface

uses
  Windows,   Messages,   SysUtils,    Classes,   Graphics,   Controls,  Forms,
  Dialogs,   DB,         DbTables,    Mask,      StdCtrls,   Buttons,   ExtCtrls,

  // USES ADICIONALES
  IntCrCredito,
  IntCrAcredit,     // Acreditado
  IntGenCre,
  InterFor,  IntFrm,     IntFind,     UnSQL2,    InterFun, IntSGCtrl, IntParamCre,
  IntLinkit, ComCtrls, IntDtPk;



type

  TCrCanCob  = Class;
  TWCrCanCob = class(TForm)
    InterForma1 : TInterForma;
    Label25: TLabel;
    edID_CREDITO: TEdit;
    edDESC_CREDITO: TEdit;
    BBBusca: TBitBtn;
    MErrores: TMemo;
    sgDatos: TSGCtrl;
    BBCancela: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilCREDITO: TInterLinkit;
    cbCredito: TCheckBox;
    gbFCobranza: TGroupBox;
    lbLiqF_INICIO: TLabel;
    lbLiqF_FINAL: TLabel;
    dtpLiqF_INICIO: TInterDateTimePicker;
    edF_INICIO: TEdit;
    edF_FINAL: TEdit;
    dtpLiqF_FINAL: TInterDateTimePicker;
    Panel1: TPanel;
    lbSEL: TLabel;
    lbDiposicion: TLabel;
    lbDescripcion: TLabel;
    lbImporte: TLabel;
    lbFolGpo: TLabel;
    lbFolio: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    ilACREDITADO: TInterLinkit;
    edNOMBRE_ACRED: TEdit;
    cbAcreditado: TCheckBox;
    btCredito: TBitBtn;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure BBBuscaClick(Sender: TObject);
    procedure sgDatosDblClick(Sender: TObject);
    procedure BBCancelaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure cbCreditoClick(Sender: TObject);
    procedure btCreditoClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure cbAcreditadoClick(Sender: TObject);
  private
    vlIsEmpty : Boolean;
  private
    procedure LimpiaMemo;
    procedure AddLine( peLinea : string );
    procedure BuscaDatos;
    procedure CancelaTransac;
//</ RABA >
    Function BuscaCartaFq(peIdCredito:String):Integer;
// < RABA />
  public
    Objeto : TCrCanCob;
  end;

  TCrCanCob = class(TInterFrame)
  private
  protected
  public
    F_INICIAL : TIntercampo;
    F_FINAL   : TIntercampo;
    ParamCre  : TParamCre;
    Acreditado: TCrAcredit;
    Credito   : TCrCredito;
  private
    function    StpObtCntLog : Integer;
    procedure   StpObtLog( peIndice : Integer; var vlError:Integer; var  vlTxError : String );
  private
    procedure CancelaTrn( peFolGpo, peCredito, pePeriodo : Integer; peCveComis,
                          peIdDocto : String; var vlResult : Double;
                          var vlTxResult : String );
  public
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    procedure   DataBaseChange; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    Procedure   AsignaCred( peIdCredito: String; Sender: TInterLinkit);
  public
  published
  end;

const
  coCRLF      = #13#10;
  coGridCheck = 'SI' + #30 + '>C';
  coMsgResult = 'Resultado: %10.0f Mensaje : %s';
  coErrCanc   = 'Ocurrió un error al cancelar el folio de grupo %s.' +
                coCRLF + '¿Desea continuar?.';
  coSQLCanCob =
      'SELECT '' '' BSEL,          '       + coCRLF +
      '       CT.F_OPERACION,      '       + coCRLF +
      '       CT.ID_TRANSACCION,   '       + coCRLF +
      '       CT.ID_CREDITO,       '       + coCRLF +
      '       CT.TX_NOTA || DECODE( CON.CVE_CONCEPTO, ''IMPBRU'', '''', '' ('' || CON.DESC_C_CONCEPTO || '')'') TX_NOTA, ' + coCRLF +
      '       CDT.IMP_CONCEPTO IMP_NETO, ' + coCRLF +
      '       CT.ID_GRUPO_TRANSAC, '       + coCRLF +
      '       CT.ID_CESION,        '       + coCRLF +
      '       CT.ID_PERIODO,       '       + coCRLF +
      '       CT.CVE_COMISION,     '       + coCRLF +
      '       CT.ID_DOCUMENTO,     '       + coCRLF +
      '       CT.CVE_OPERACION     '       + coCRLF +
      'FROM   CR_OPERACION CO,  CR_TRANSACCION CT,   CR_DET_TRANSAC CDT, ' + coCRLF +
      '       CR_CONCEPTO  CON, CR_REL_OPE_CON CROC, CR_CREDITO   CR,  '   + coCRLF +
      '       CR_CONTRATO    L, CONTRATO CTTO,        ' + coCRLF +
      '       (SELECT DISTINCT CVE_OPERACION '          + coCRLF +
      '        FROM   CR_CVE_OPERACION '                + coCRLF +
      '        WHERE  CVE_PARAMETRO IN ( ''PAGOCN'', ''PAGOCP'', ''PAGOFN'', ''PAGOIN'', ' + coCRLF +
      '                                  ''PGCNGF'', ''PGINGF'', ''PGFNGF'', ''PGCPGF'', ' + coCRLF +
      '                                  ''RCGFCN'', ''RCGFIN'', ''RCGFFN'', ''RCGFCP'', ' + coCRLF +
      '                                  ''PGCNGP'', ''PGINGP'', ''PGFNGP'', ''PGCPGP'', ' + coCRLF +
      '                                  ''RCGPCN'', ''RCGPIN'', ''RCGPFN'', ''RCGPCP'', ' + coCRLF +
      '                                  ''PGAPCN'', ''PGAPIN'', ''PGAPFN'', ''PGAPCP'', ' + coCRLF +
      '                                  ''PGDMCN'', ''PGDMIN'', ''PGDMFN'', ''PGDMCP'', ' + coCRLF +
      '                                  ''PGCTCN'', ''PGCTIN'', ''PGCTFN'', ''PGCTCP'', ' + coCRLF +
      '                                  ''PGSTCN'', ''PGSTIN'', ''PGSTFN'', ''PGSTCP'', ' + coCRLF +

      //HERJA - CLAVES DE OPERACION DE RESCATE, DEVOLUCIONES E INCOBRABILIDAD
      '                                  ''RTCPGF'', ''RTINGF'', ''RTFNGF'', ''RTCNGF'', ' + coCRLF +
      '                                  ''RTCPGP'', ''RTINGP'', ''RTFNGP'', ''RTCNGP'', ' + coCRLF +
      '                                  ''RSCPGF'', ''RSINGF'', ''RSFNGF'', ''RSCNGF'', ' + coCRLF +
      '                                  ''RSCPGP'', ''RSINGP'', ''RSFNGP'', ''RSCNGP'', ' + coCRLF +
      '                                  ''INCPGF'', ''ININGF'', ''INFNGF'', ''INCNGF'', ' + coCRLF +
      '                                  ''INCPGP'', ''ININGP'', ''INFNGP'', ''INCNGP'', ' + coCRLF +
      //FIN HERJA
      '                                  ''DMPGCP'', ' + coCRLF +  //HERJA OCTUBRE 2013

      //EASA    28072005
      '                                  ''CODNCP'', ''CODNFN'', ''CODNIN'', ''CODNCN'', ' + coCRLF +   //CONDONACIONES
      '                                  ''QUITCP'', ''QUITFN'', ''QUITIN'', ''QUITCN'', ' + coCRLF +   //QUITAS
      '                                  ''QUEBCP'', ''QUEBFN'', ''QUEBCN'', ''QUEBIN'', ' + coCRLF +   //QUEBRANTOS
      '                                  ''CASTCP'', ''CASTFN'', ''CASTCN'', ''CASTIN'',  ' + coCRLF +   //CASTIGOS
      //RIRA4281 27Oct10
      '                                  ''DACICN'', ''DACIIN'', ''DACIFN'', ''DACICP'',  ' + coCRLF +   //Dacion
      '                                  ''ADJUCN'', ''ADJUIN'', ''ADJUFN'', ''ADJUCP'',  ' + coCRLF +   //Adjudicacion
      //FIN RIRA4281 27Oct10
      //JAGF 01Dic10
      '                                  ''VTCTCN'', ''VTCTIN'', ''VTCTFN'', ''VTCTCP''  ' + coCRLF +   //Adjudicacion
      //FIN JAGF 01Dic10
      '                                )' + coCRLF +
      '        UNION '                    + coCRLF +
      '        SELECT DISTINCT CVE_OPE_FIN_ADIC FROM CR_PARAMETRO ' + coCRLF +
      '       ) CVES ' + coCRLF +
      'WHERE  CT.F_OPERACION     BETWEEN @F_INICIAL@ AND @F_FINAL@'       + coCRLF +
      '  @@CONDICION_ID_CREDITO@@                '               + coCRLF +
      '  @@CONDICION_ID_TITULAR@@                '               + coCRLF +
      '  @@CONDICION_ID_EMPRESA@@                '               + coCRLF +
      '  AND  CT.SIT_TRANSACCION = ''AC''             '          + coCRLF +
      '  AND  CROC.B_EDO_CTA     = ''V''              '          + coCRLF +
      '  AND  CO.CVE_OPERACION   = CVES.CVE_OPERACION '          + coCRLF +
      '  AND  CO.CVE_OPERACION   = CT.CVE_OPERACION  '           + coCRLF +
      '  AND  CT.ID_TRANS_CANCELA  IS NULL ' + coCRLF +
      '  AND  CDT.ID_TRANSACCION = CT.ID_TRANSACCION ' + coCRLF +
      '  AND  CDT.CVE_OPERACION  = CT.CVE_OPERACION  ' + coCRLF +
      '  AND  CON.CVE_CONCEPTO   = CDT.CVE_CONCEPTO  ' + coCRLF +
      '  AND  CROC.CVE_OPERACION = CDT.CVE_OPERACION ' + coCRLF +
      '  AND  CROC.CVE_CONCEPTO  = CDT.CVE_CONCEPTO  ' + coCRLF +
      '  AND  CR.ID_CREDITO      = CT.ID_CREDITO   ' + coCRLF +
      '  AND  L.ID_CONTRATO      = CR.ID_CONTRATO  ' + coCRLF +
      '  AND  L.FOL_CONTRATO     = CR.FOL_CONTRATO ' + coCRLF +
      '  AND  CTTO.ID_CONTRATO   = CR.ID_CONTRATO  ' + coCRLF +
      //JAGF 17Ene11
      '  AND Not Exists (Select ID_Grupo_Transac'                        + coCRLF +
      '                    From CR_Vta_Cartera_Det_Tx'                   + coCRLF +
      '                   Where ID_Grupo_Transac = CT.ID_Grupo_Transac)' + coCRLF +
      // FIN JAGF 17Ene11
      'ORDER BY CT.ID_TRANSACCION DESC, CT.ID_GRUPO_TRANSAC ASC';

  coCheckBox   = 'BSEL';
  coIdTransac  = 'ID_TRANSACCION';
  coIdCredito  = 'ID_CREDITO';
  coTxNota     = 'TX_NOTA';
  coImpNeto    = 'IMP_NETO';
  coFolGpoTrn  = 'ID_GRUPO_TRANSAC';
  coIdCesion   = 'ID_CESION';
  coNumPeriodo = 'ID_PERIODO';
  coCveComis   = 'CVE_COMISION';
  coIdDocto    = 'ID_DOCUMENTO';
  coCveOper    = 'CVE_OPERACION';
  coPosFolio   = 0;
  coPosFolGpo  = 1;
  coPosIdCred  = 2;
  coPosTxNota  = 3;
  coPosImpNeto = 4;
  coFmtCurr    =  '###,###,###,###,###,##0.00';


implementation
{$R *.DFM}

constructor TCrCanCob.Create( AOwner : TComponent );
begin
  Inherited Create( AOwner );
  F_INICIAL  := CreaCampo('F_INICIAL',   ftDate, tsNinguno, tsNinguno, False);
  F_FINAL    := CreaCampo('F_FINAL',     ftDate, tsNinguno, tsNinguno, False);
  {$WARNINGS OFF}
  Credito := TCrCredito.Create(Self);
  {$WARNINGS ON}
  Credito.MasterSource:=Self;
  Credito.FieldByName('ID_CREDITO').MasterField := 'ID_CREDITO';
  //
  {$WARNINGS OFF}
  Acreditado := TCrAcredit.Create(Self);
  {$WARNINGS ON}
  Acreditado.MasterSource := Self;
end;

destructor TCrCanCob.Destroy;
begin
   if Credito <> nil then
      Credito.free;
   //end if;
   if Acreditado <> nil then
      Acreditado.free;
   //end if;
   inherited;
end;

Procedure TCrCanCob.DataBaseChange;
begin
  Credito.GetParams(self);
  Acreditado.GetParams(self);
end;


function TCrCanCob.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCanCob;
begin
   W := TWCrCanCob.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.FormaTipo := ftConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

procedure TCrCanCob.CancelaTrn(peFolGpo,   peCredito, pePeriodo : Integer;
                               peCveComis, peIdDocto : String;
                               var vlResult : Double; var vlTxResult : String );
var vlSTP : TStoredProc;
begin
  vlSTP := TStoredProc.Create(nil);
  try
    vlSTP.DatabaseName := Apli.DataBaseName;
    vlSTP.SessionName  := Apli.SessionName;
    vlSTP.StoredProcName := 'PKGCRCOBRANZA.STPCANCCOBRANZA';
    vlSTP.Params.Clear;
    //CREA LOS PARAMETROS
    vlSTP.Params.CreateParam( ftFloat,  'PEIDGRUPOTRANSAC', ptInput );
    vlSTP.Params.CreateParam( ftString, 'PECVEUSUCANC',     ptInput );
    vlSTP.Params.CreateParam( ftString, 'PEBCOMMIT',        ptInput );
    vlSTP.Params.CreateParam( ftFloat,  'PSRESULTADO',      ptOutput);
    vlSTP.Params.CreateParam( ftString, 'PSTXRESULTADO',    ptOutput);
    //ASIGNA LOS VALORES
    vlSTP.ParamByName('PEIDGRUPOTRANSAC' ).AsInteger := peFolGpo;
    vlSTP.ParamByName('PECVEUSUCANC' ).AsString  := Apli.Usuario;
    vlSTP.ParamByName('PEBCOMMIT'    ).AsString  := 'V';
    //EJECUTA EL STORED PROCEDURE
    vlSTP.ExecProc;
    vlResult := vlSTP.ParamByName('PSRESULTADO' ).AsFloat;
    vlTxResult := vlSTP.ParamByName('PSTXRESULTADO' ).AsString;
  finally
    if Assigned(vlSTP) then
      vlSTP.Free;
    //ends_if
  end;
end;


function TCrCanCob.StpObtCntLog: Integer;
var spObtCntlog : TStoredProc;
begin
  spObtCntlog := TStoredProc.Create(Nil);
  try
    with spObtCntlog do
    begin
      DatabaseName:= Apli.DatabaseName;
      SessionName:= Apli.SessionName;
      StoredProcName:='PKGCRCOBRANZA.STPOBTENCNTLOG';
      Params.Clear;
      Params.CreateParam( ftFloat,  'psNumItems',    ptOutput );
      Params.CreateParam( ftFloat,  'psResultado',   ptOutput );
      Params.CreateParam( ftString, 'psTxResultado', ptOutput );
      ExecProc;
      if ParamByName( 'psResultado' ).AsInteger = 0 then
        Result := ParamByName( 'psNumItems' ).AsInteger
      else
        Result := -1;
      //ends_if
    end;
  finally
    if assigned(spObtCntlog) then
      spObtCntlog.Free;
    //ends_if
  end;
end;

procedure TCrCanCob.StpObtLog(peIndice: Integer; var vlError: Integer;
  var vlTxError: String);
var spObtlog : TStoredProc;
begin
  spObtlog := TStoredProc.Create(Nil);
  try
    with spObtlog do
    begin
      DatabaseName:= Apli.DatabaseName;
      SessionName:= Apli.SessionName;
      StoredProcName:='PKGCRCOBRANZA.STPOBTENLOG';
      Params.Clear;
      Params.CreateParam( ftFloat,  'peIndice',      ptInput );
      Params.CreateParam( ftFloat,  'psLogResult',   ptOutput );
      Params.CreateParam( ftString, 'psLogTxResult', ptOutput );
      Params.CreateParam( ftFloat,  'psResultado',   ptOutput );
      Params.CreateParam( ftString, 'psTxResultado', ptOutput );
      ParamByName( 'peIndice' ).AsInteger := peIndice;
      ExecProc;
      if ParamByName( 'psResultado' ).AsInteger = 0 then
      begin
        vlError   := ParamByName( 'psLogResult' ).AsInteger;
        vlTxError := ParamByName( 'psLogTxResult' ).AsString;
      end else begin
        vlError   := ParamByName( 'psResultado' ).AsInteger;
        vlTxError := 'Error Interno: ' + ParamByName( 'psTxResultado' ).AsString;
      end;
      //ends_if
    end;
  finally
    if assigned(spObtlog) then
      spObtlog.Free;
    //ends_if
  end;
end;
//ASIGNA CONTROL DE BUSCADOR
procedure TCrCanCob.AsignaCred(peIdCredito: String; Sender: TInterLinkit);
begin
   Sender.Buffer := peIdCredito;
   Sender.OnEjecuta(Sender);
end;
(***********************************FORMA TEMPLATE*****************************)
(*                                                                            *)
(*                                                                            *)
(*                                                                            *)
(*                                  FORMA TEMPLATE                            *)
(*                                                                            *)
(*                                                                            *)
(*                                                                            *)
(***********************************FORMA TEMPLATE*****************************)

procedure TWCrCanCob.FormShow(Sender: TObject);
begin
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
  vlIsEmpty := True;

  Objeto.F_INICIAL.Control := edF_INICIO;
  Objeto.F_FINAL.Control   := edF_FINAL;

  Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
  Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;

  Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
  Objeto.Credito.ContratoCre.Contrato.TITNombre.Control:= edDESC_CREDITO;
  Objeto.F_INICIAL.AsDateTime := Objeto.Apli.DameFechaEmpresa;
  Objeto.F_FINAL.AsDateTime   := Objeto.Apli.DameFechaEmpresa;
  //
  Objeto.Credito.BuscaWhereString  := 'PKGCRACTUALIZA.STPOBTEMPCTTO(CR_CREDITO.ID_CONTRATO)= ' +  // LOLS 08 SEP 2005
                                      IntToStr(Objeto.Apli.IdEmpresa);                            // LOLS 08 SEP 200
  Objeto.Credito.FilterString      := Objeto.Credito.BuscaWhereString;
  //
  //SI SE ACCESA DE OTRA PANTALLA CON EL NÚMERO DE CREDITO
  if Objeto.Credito.ID_CREDITO.AsString <> '' then
      Objeto.AsignaCred( Objeto.Credito.ID_CREDITO.AsString,  ilCREDITO);
  //

end;

procedure TWCrCanCob.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrCanCob.FormDestroy(Sender: TObject);
begin
  Objeto.F_INICIAL.Control := nil;
  Objeto.F_FINAL.Control   := nil;
  Objeto.Acreditado.ID_ACREDITADO.Control := nil;
  Objeto.Acreditado.Persona.Nombre.Control := nil;
  Objeto.Credito.ID_CREDITO.Control := nil;
  Objeto.Credito.ContratoCre.Contrato.TITNombre.Control:= nil;
end;
//LIMPIA EL MEMO DE MENSAJES
procedure TWCrCanCob.LimpiaMemo;
begin
  MErrores.Lines.Clear;
end;
//AGREGA UNA LINEA AL MEMO DE MENSAJES
procedure TWCrCanCob.AddLine(peLinea: string);
begin
  MErrores.Lines.Add(peLinea);
end;
//HACE UNA BUSQUEDA DE LOS DATOS
procedure TWCrCanCob.BuscaDatos;
var vlSQLQry : TQuery;
    vlSQLCad : String;
    vlCndCred : String;
    vlCndAcre : String;
begin
  vlCndCred := '';
  vlCndAcre := '';
  Objeto.F_INICIAL.GetFromControl;
  Objeto.F_FINAL.GetFromControl;
  if Objeto.Credito.Active then
    vlCndCred := '  AND  CT.ID_CREDITO  = ' + Objeto.Credito.ID_CREDITO.AsString;
  //ends_if
  if Objeto.Acreditado.Active then
    vlCndAcre := '  AND  CTTO.ID_TITULAR = ' + Objeto.Acreditado.ID_ACREDITADO.AsString;
  //ends_if

  
  vlSQLCad := StringReplace( coSQLCanCob, '@F_INICIAL@',
                             SQLFecha( Objeto.F_INICIAL.AsDateTime ),
                             [ rfReplaceAll, rfIgnoreCase ] );
  vlSQLCad := StringReplace( vlSQLCad,    '@F_FINAL@',
                             SQLFecha( Objeto.F_FINAL.AsDateTime ),
                             [ rfReplaceAll, rfIgnoreCase ] );
  vlSQLCad := StringReplace( vlSQLCad, '@@CONDICION_ID_CREDITO@@',
                             vlCndCred, [ rfReplaceAll, rfIgnoreCase ] );
  vlSQLCad := StringReplace( vlSQLCad, '@@CONDICION_ID_TITULAR@@',
                             vlCndAcre, [ rfReplaceAll, rfIgnoreCase ] );
  vlSQLCad := StringReplace( vlSQLCad, '@@CONDICION_ID_EMPRESA@@',
                             ' AND  CTTO.ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa),
                             [ rfReplaceAll, rfIgnoreCase ] );

  vlSQLQry := TQuery.Create(nil);
  try
    vlSQLQry.DatabaseName := Objeto.Apli.DataBaseName;
    vlSQLQry.SessionName  := Objeto.Apli.SessionName;
    vlSQLQry.SQL.Clear;
    vlSQLQry.SQL.Add(vlSQLCad);
    vlSQLQry.Open;
    vlIsEmpty := vlSQLQry.IsEmpty;
    vlSQLQry.FieldByName('BSEL').DisplayWidth := 3;
    vlSQLQry.FieldByName('TX_NOTA').DisplayWidth  := 56;
    vlSQLQry.FieldByName('IMP_NETO').DisplayWidth := 18;
    vlSQLQry.FieldByName('ID_CREDITO').DisplayWidth := 12;
    vlSQLQry.FieldByName('F_OPERACION').DisplayWidth  := 10;
    vlSQLQry.FieldByName('ID_TRANSACCION').DisplayWidth   := 12;
    vlSQLQry.FieldByName('ID_GRUPO_TRANSAC').DisplayWidth := 12;
    {CAMPOS_NO_VISIBLES}
    vlSQLQry.FieldByName('ID_CESION').Visible  := False;
    vlSQLQry.FieldByName('ID_PERIODO').Visible := False;
    vlSQLQry.FieldByName('CVE_COMISION').Visible  := False;
    vlSQLQry.FieldByName('ID_DOCUMENTO').Visible  := False;
    vlSQLQry.FieldByName('CVE_OPERACION').Visible := False;
    {ENDS_CAMPOS_NO_VISIBLES}
    TNumericField( vlSQLQry.FieldByName('IMP_NETO') ).DisplayFormat:= coFmtCurr;
    sgDatos.addQry( vlSQLQry, True, True, -1, -1, -1, False );
    sgDatos.ColumnByName('BSEL').IsCheck := True;
    vlSQLQry.Close;
  finally
    if Assigned( vlSQLQry ) then
      vlSQLQry.Free;
  end;
end;
//CANCELA LA TRANSACCION
procedure TWCrCanCob.CancelaTransac;
var vlRow     : Integer;
    vlResult  : Double;
    vlTxResult: String;
    vlStrFolio: String;
    vlStrList : TStringList;
begin
  messageIniFinProceso( MErrores, CINICIO );
  vlStrList := TStringList.Create;
  try
    vlStrList.Clear;
    for vlRow := 0 to sgDatos.SG.RowCount  - 1 do
    begin

      vlStrFolio := sgDatos.CellStr[ coFolGpoTrn,  vlRow ]; //Obtiene el folio de Grupo
      if ( sgDatos.CellStr[ coCheckBox, vlRow ] = coGridCheck ) and
         ( vlStrList.IndexOfName ( vlStrFolio ) < 0 ) then
      begin
        vlStrList.Values[ vlStrFolio ] := 'processed';
        vlStrList.Sort;
        Objeto.CancelaTrn( StrToInt( vlStrFolio ), //Folio de Gpo
                           StrToInt( sgDatos.CellStr[ coIdCredito,  vlRow ] ), //Id Credito
                           StrToInt( sgDatos.CellStr[ coNumPeriodo, vlRow ] ), //Num Periodo
                           sgDatos.CellStr[ coCveComis ,  vlRow ], //Clave de Com
                           sgDatos.CellStr[ coIdDocto  ,  vlRow ], //Documento
                           vlResult, vlTxResult );
        AddLine( Format( 'Resultado: %10.0f Mensaje : %s', [ vlResult, vlTxResult ] ) );
        if vlResult <> 0 then
        begin
          if MessageDlg('Error al cancelar el folio de grupo ' + vlStrFolio +
                        coCRLF + vlTxResult + coCRLF  +'¿Desea continuar?',
                        mtWarning, mbYesNoCancel, 0 ) <> mrYes then
            break;
          //ends_if
        end;//ends_if
      end;//ends_if
    end;//ends_for
  finally
    if Assigned(vlStrList) then
      vlStrList.Free;
  end;
  messageIniFinProceso( MErrores, CFINAL  );
end;
//MARCA LA TRANSACCION
procedure TWCrCanCob.sgDatosDblClick(Sender: TObject);
var IsChecked : Boolean;
    Y         : Integer;
    vlFolio   : String;
    vlContinua : Boolean;  // RABA 27 JUL 2011
begin
  IsChecked:= ( sgDatos.CellStr[ coCheckBox, sgDatos.SG.Row ] = coGridCheck );
//</ RABA > 27 JUL 2011   VALIDACION DE EMISION CARTA FINIQUITO
  vlContinua := True;
  If not IsChecked then
  begin
    If BuscaCartaFq(sgDatos.CellStr[ coIdCredito, sgDatos.SG.Row ]) > 0 then
    begin
       MessageDlg('El crédito ' + sgDatos.CellStr[ coIdCredito, sgDatos.SG.Row ] +
                     ' tiene carta finiquito impresa con anterioridad.' + chr(13) +
                     'Solicite autorización para la cancelación de la cobranza.',
                      mtWarning, [mbOk], 0);
       vlContinua := False;
    end;
  end;

  If vlContinua then
  begin
//< RABA />
      vlFolio  := sgDatos.CellStr[ coFolGpoTrn, sgDatos.SG.Row ];
      for Y := 0 to sgDatos.SG.RowCount  - 1 do
        if  sgDatos.CellStr[ coFolGpoTrn, Y ] = vlFolio then
        begin
          if IsChecked then
            sgDatos.CellStr[ coCheckBox, Y ] := ''
          else
            sgDatos.CellStr[ coCheckBox, Y ] := coGridCheck;
        end;
  end;  // RABA 27 JUL 2011
end;

procedure TWCrCanCob.ilACREDITADOEjecuta(Sender: TObject);
begin
  if Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) then
  begin
    cbAcreditado.Checked := True;
    BBBuscaClick(BBBusca);
  end;
end;

procedure TWCrCanCob.btACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCANCOB_ACRED',True,True) then
   begin
      if Objeto.Acreditado.Busca then
      begin
        cbAcreditado.Checked := True;
        BBBuscaClick(BBBusca);
      end;
   end;
end;


procedure TWCrCanCob.cbAcreditadoClick(Sender: TObject);
begin
  if cbAcreditado.Checked and Objeto.Acreditado.Active = False then
   cbAcreditado.Checked := False;

  if not cbAcreditado.Checked then
    Objeto.Acreditado.Active := false;
end;


procedure TWCrCanCob.ilCREDITOEjecuta(Sender: TObject);
begin
  if Objeto.Credito.FindKey([ilCREDITO.Buffer]) then
  begin
    cbCredito.Checked := True;
    BBBuscaClick(BBBusca);
  end;
end;


procedure TWCrCanCob.btCreditoClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCANCOB_DISP',True,True) then
   begin
      if Objeto.Credito.Busca then
      begin
        cbCredito.Checked := True;
        BBBuscaClick(BBBusca);
      end;
   end;
end;

procedure TWCrCanCob.cbCreditoClick(Sender: TObject);
begin
  if cbCredito.Checked and Objeto.Credito.Active = False then
   cbCredito.Checked := False;

  if not cbCredito.Checked then
    Objeto.Credito.Active := false;
end;


//BUSCA DATOS
procedure TWCrCanCob.BBBuscaClick(Sender: TObject);
var vlCLave : String;
begin
//   vlCLave := '05';
//    if ValidaUsuario(Objeto.Apli,vlClave) then begin
   if Objeto.ValidaAccesoEsp('TCRCANCOB_BUSCA',True,True) then
   begin
    LimpiaMemo;
    BuscaDatos;
   end;
//  else begin
//    ShowMessage('    No tiene suficientes permisos para esta Acción');
//    end;
end;
//CANCELA LAS OPERACIONES
procedure TWCrCanCob.BBCancelaClick(Sender: TObject);
var vlIndex    : Integer;
    vlCnt      : Integer;
    vlResult   : Integer;
    vlTxResult : String;
    vlClave    : String;
begin
//     vlClave := '06';
//  if ValidaUsuario(Objeto.Apli,vlClave) then
   if Objeto.ValidaAccesoEsp('TCRCANCOB_CANC',True,True) then
    begin
      if vlIsEmpty then
        exit;
      //ends_if
      BBCancela.Enabled := False;
      try
        if MessageDlg('Estás seguro de cancelar las operaciones seleccionadas',
             mtConfirmation, mbYesNoCancel, 0 ) = mrYes then
        begin
          CancelaTransac;
          vlIndex := Objeto.StpObtCntLog;
          for vlCnt := 1 to vlIndex do
          begin
            Objeto.StpObtLog( vlCnt, vlResult, vlTxResult );
            if vlResult <> 0 then
              AddLine( Format( 'Error %.7d : %s', [ vlResult, vlTxResult ] ) )
            else
              AddLine( Format( '%s', [ vlTxResult ] ) )
          end;//ends_for
          ShowMessage('El proceso ha concluido');
          BuscaDatos;
        end;//ends_if;
      except
        on e : Exception do
          ShowMessage( e.Message );
      end;
      BBCancela.Enabled := True;
    end;
//    else begin
//    ShowMessage('    No tiene suficientes permisos para esta Acción');
//    end;
end;

function TWCrCanCob.BuscaCartaFq(peIdCredito:String): Integer;
var
  vlsql : String;
  vlQryAux : TQuery;
begin
  Result := 0;
  vlsql := ' SELECT COUNT(*) HAYCARFINQ FROM CR_CTRL_CARTA C, CR_CTRL_CARTA_D D ' +
           ' WHERE C.ID_CARTA = D.ID_CARTA AND C.CVE_TIPO_FORMATO = ''LIQ'' ' +
           ' AND D.ID_CREDITO = ' + peIdCredito +
           ' AND D.CVE_USU_AUT_CC IS NULL ';

  vlQryAux := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

  If Assigned(vlQryAux) Then
  With vlQryAux Do
     Begin
       Result := FieldByName('HAYCARFINQ').AsInteger;
       Close;
       Free;
     end;
end;

end.
