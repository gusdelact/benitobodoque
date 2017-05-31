//MIGRACION ORACLE8.
unit UnCrPack;

interface

uses
  SysUtils, Classes, InterFor, IntFrm, DB, DbTables,IntFind, UnSQL2, InterFun,
  InterApl;

type

  TCrTipFolio = (foCesion, foCredito, foGarantia, foGpoTrans, foTransCred, foSubTipCn, foSubTipCr, foTipoCred, foFacultad, foTeso, foSeguro, foCaCre, foNego);

  TCrPack = class(TComponent)
  private
    FApli             : TInterApli;
  published
    property Apli : TInterApli read FApli write FApli;
  public
    constructor Create(Owner: TComponent); override;
    destructor  Destroy; override;
    function    EsHabil (FechaInhabil : TDateTime; DireccionBusqueda : integer; Pais : string) : TDateTime;
    function    GeneraPeriodos (Credito : integer; PlazoMeses : integer; PrimeraRenta : integer; Tasa : double) : integer;
    function    DameFolio(TipFolio : TCrTipFolio) : integer;
    function    DameIVA : double;
    function    DameIVAUDI(pFVenceDocto, pFCalculo : TDateTime; pTasa : Extended; pCveMonedap : integer) : Extended;
    function    DameCodigoRespuesta(Codigo : Integer):string;
    function    DameUltimoTipoCambio (pFAplicacion : double; pMoneda : integer; pUltimoCaptu : string) : double;
    function    ReducePerCap(Credito : integer; ImpSaldo : double) : integer;
    procedure   CalculaAdeudo(Credito : integer;
                            FechaCalculo : TDateTime;
                            var ImpVenCap : double;
                            var ImpVenInt : double;
                            var ImpVenCom : double;
                            var ImpIVAIntVen : double;
                            var ImpIVAComVen : double;
                            var ImpVigInt    : double;
                            var ImpIVAVigInt : double;

                            var ImpVigCom : double;
                            var ImpIVAVigCom : double;

                            var ImpMorasCap : double;
                            var ImpIVAMoraCap : double;
                            var ImpMorasInt : double;
                            var ImpIVAMoraInt : double;
                            var ImpMorasCom : double;
                            var ImpIVAMoraCom : double;

                            var TIVA : double;
                            var FVenCred : TDateTime);
  end;

function ConvierteFechaAHora (Fecha : TDateTime) : integer;
function BooltoStr(vBool : boolean) : string;
function StrtoBool(vStr  : string ) : boolean;
function PreDbltoStr(pFloat : double; pDecimales : integer) : string;
function PreDbltoDbl(pFloat : double; pDecimales : integer) : double;
function DameBaseSICA(Apli : TInterApli): TDatabase;
function InsertaTransaccion(pID_CREDITO : integer; pID_CONTRATO : integer;  pFOLIO_GPO_TRANS : integer;
                            pF_APLICACION : TDateTime; pNUM_PERIODO : integer; pIMP_OPERACION : Double;
                            pTASA_APLICACION : double; pTIPO_CAMBIO : double;
                            pCVE_OPERACION : string; pF_LIQUIDACION : TDateTime; pSDO_GENERA_TRANS : double;
                            pTX_COMENTARIO : string; pCVE_COMISION : string; pNUM_DOCUMENTO : integer; pID_CONTRA_DV : integer;
                            Sender : TInterFrame; ShowError : boolean; pCommit : boolean): integer;
function InsTransContable(pID_CREDITO : integer; pID_CONTRATO : integer; pNUM_PERIODO : integer;
                          pF_APLICACION : TDateTime; pF_VENCE : TDateTime;
                          pIMP_MOVIMIENTO : double; pIMP_CAPITAL : double; pIMP_INTERES : double;
                          pIMP_IVA : double; pIMP_MORAS : double; pIMP_AJUSTE : double;
                          pIMP_GARANTIA : double; pIMP_ISR : double; pIMP_COMISION : double;
                          pIMP_CAP_VEN : double; pIMP_INT_VEN : double; pIMP_INT_EXT : double;
                          pIMP_CAP_REFIN : double; pIMP_CARGA : double; pIMP_OPCION : double;
                          pIMP_IVA_INI : double; pIMP_IVA_VEN : double; pIMP_RENT_DEP : double;
                          pTIPO_APLICACION : string; pCTO_LIQ : integer; pF_TIPO_CAMBIO : TDateTime;
                          pMONEDA : integer; pApli : TInterApli; ShowError : boolean): integer;
implementation

constructor TCrPack.Create(Owner: TComponent);
begin
  inherited Create(owner);
end;

destructor TCrPack.Destroy;
begin
  inherited Destroy;
end;

function TCrPack.EsHabil(FechaInhabil : TDateTime; DireccionBusqueda : integer; Pais : string) : TDateTime;
var
  spFestivo : TStoredProc;
begin
  spFestivo := TStoredProc.Create(Self);
  try
    spFestivo.DatabaseName := FApli.DataBaseName;
    spFestivo.SessionName := FApli.SessionName;
    spFestivo.StoredProcName := 'PKGCREDITO.ESFESTIVO';
    
    spFestivo.Params.Clear; //  ^^Migración^^ STP V
    spFestivo.Params.CreateParam(ftString,'pPais',ptInput); //  ^^Migración^^ STP V
    spFestivo.Params.CreateParam(ftDateTime,'pFBusca',ptInput); //  ^^Migración^^ STP V
    spFestivo.Params.CreateParam(ftInteger,'pOffset',ptInput); //  ^^Migración^^ STP V
    spFestivo.Params.CreateParam(ftDateTime,'pFHabil',ptOutput); //  ^^Migración^^ STP V

    spFestivo.Prepare; //  ^^Migración^^
    
    spFestivo.ParamByName('pPais').AsString := Pais;    
    spFestivo.ParamByName('pFBusca').AsDate := FechaInhabil;
    spFestivo.ParamByName('pOffset').AsInteger := DireccionBusqueda;

    spFestivo.ExecProc;
    Result := spFestivo.ParamByName('pFHabil').AsDate;
    spFestivo.UnPrepare;
    spFestivo.Close;
  finally
    spFestivo.Free;
  end;
end;

function TCrPack.GeneraPeriodos (Credito : integer; PlazoMeses : integer; PrimeraRenta : integer; Tasa : Double) : integer;
var
  spGenera : TStoredProc;
begin
  spGenera := TStoredProc.Create(Self);
  try
    spGenera.DatabaseName := FApli.DataBaseName;
    spGenera.SessionName := FApli.SessionName;
    spGenera.StoredProcName := 'PKGCREDITO.STPGENPERIODOS';

    spGenera.Params.Clear;
    spGenera.Params.CreateParam(ftInteger,'pIdCredito',ptInput); //  ^^Migración^^ STP V
    spGenera.Params.CreateParam(ftInteger,'pNumPeriodos',ptInput); //  ^^Migración^^ STP V
    spGenera.Params.CreateParam(ftDateTime,'pPrimeraRenta',ptInput); //  ^^Migración^^ STP V
    spGenera.Params.CreateParam(ftFloat,'pTasa',ptInput); //  ^^Migración^^ STP V

    spGenera.Prepare; //  ^^Migración^^

    spGenera.ParamByName('pIdCredito').AsInteger := Credito;
    spGenera.ParamByName('pNumPeriodos').AsInteger := PlazoMeses;
    spGenera.ParamByName('pPrimeraRenta').AsDate := PrimeraRenta;
    spGenera.ParamByName('pTasa').AsFloat := Tasa;
    spGenera.ExecProc;
    spGenera.UnPrepare;
    spGenera.Close;
  finally
    spGenera.Free;
  end;
end;

function TCrPack.ReducePerCap(Credito : integer; ImpSaldo : double) : integer;
var
  spReduce : TStoredProc;
begin
  spReduce := TStoredProc.Create(Self);
  try
    spReduce.DatabaseName := FApli.DataBaseName;
    spReduce.SessionName := FApli.SessionName;
    spReduce.StoredProcName := 'PKGCREDITO.STPREDUCEPERCAP';

    spReduce.Params.Clear;
    spReduce.Params.CreateParam(ftinteger, 'pIdCredito', ptInput);
    spReduce.Params.CreateParam(ftFloat, 'pImpSaldo', ptInput);
    spReduce.Prepare;
    spReduce.ParamByName('pIDCREDITO').AsInteger := Credito;
    spReduce.ParamByName('pIMPSALDO').AsFloat := ImpSaldo;
    spReduce.ExecProc;
    spReduce.UnPrepare;
    spReduce.Close;
  finally
    spReduce.Free;
  end;
end;

function TCrPack.DameFolio(TipFolio : TCrTipFolio) : integer;
var
  spFolio : TStoredProc;
begin
  spFolio := TStoredProc.Create(nil);
  try
    spFolio.SessionName := FApli.SessionName;
    spFolio.DataBaseName := FApli.DataBaseName;
    spFolio.StoredProcName := 'PKGCREDITO.STPDAMEFOLIO';

    spFolio.Params.Clear;
    spFolio.Params.CreateParam( ftInteger,'pTIPOFOLIO', ptInput);
    spFolio.Params.CreateParam( ftInteger,'pNUMFOLIO', ptOutput);
    spFolio.Prepare;

    spFolio.ParamByName('pTIPOFOLIO').Asinteger := Ord(TipFolio);
    spFolio.ExecProc;

    Result := spFolio.ParamByName('pNUMFOLIO').AsInteger;

    spFolio.Unprepare;
    spFolio.Close;
  finally
    spFolio.Free;
  end;
end;

function TCrPack.DameIVA : double;
var
  spIVA : TStoredProc;
begin
  spIVA := TStoredProc.Create(nil);
  try
    spIVA.SessionName := FApli.SessionName;
    spIVA.DataBaseName := FApli.DataBaseName;
    spIVA.StoredProcName := 'PKGCREDITO.STPDAMEIVA';

    spIVA.Params.Clear;
    spIVA.Params.CreateParam( ftFloat,'pIVA', ptOutput);
    spIVA.Prepare;
    spIVA.ExecProc;

    Result := spIVA.ParamByName('pIVA').AsFloat;

    spIVA.Unprepare;
    spIVA.Close;
  finally
    spIVA.Free;
  end;
end;

function  TCrPack.DameUltimoTipoCambio (pFAplicacion : double; pMoneda : integer; pUltimoCaptu : string) : double;
var
  spTipoC : TStoredProc;
begin
  spTipoC := TStoredProc.Create(nil);
  try
    spTipoC.SessionName := FApli.SessionName;
    spTipoC.DataBaseName := FApli.DataBaseName;
    spTipoC.StoredProcName := 'PKGCREDITO.STPDAMETIPOCAMBIO';
    
    spTipoC.Params.Clear;
    spTipoC.Params.CreateParam( ftDate,'pFECHA', ptInput);
    spTipoC.Params.CreateParam( ftInteger,'pCVE_MONEDA', ptInput);
    spTipoC.Params.CreateParam( ftString,'pBULTIMOCAPT', ptInput);
    spTipoC.Params.CreateParam( ftFloat,'pTIPO', ptOutput);    
    spTipoC.Prepare;

    spTipoC.ParamByName('pFECHA').AsDateTime := Trunc(pFAplicacion);
    spTipoC.ParamByName('pCVE_MONEDA').AsInteger := pMoneda;
    spTipoC.ParamByName('pBULTIMOCAPT').AsString := pUltimoCaptu;
    spTipoC.ExecProc;

    Result := spTipoC.ParamByName('pTIPO').AsFloat;
    spTipoC.Unprepare;
    spTipoC.Close;
  finally
    spTipoC.Free;
  end;
end;

function TCrPack.DameIVAUDI(pFVenceDocto, pFCalculo : TDateTime; pTasa : Extended; pCveMonedap : integer) : Extended;
var
  spIVAUDI : TStoredProc;
begin
  spIVAUDI := TStoredProc.Create(nil);
  try
    spIVAUDI.SessionName := FApli.SessionName;
    spIVAUDI.DataBaseName := FApli.DataBaseName;
    spIVAUDI.StoredProcName := 'PKGCREDITO.STPDAMEIVAUDI';

    spIVAUDI.Params.Clear;
    spIVAUDI.Params.CreateParam( ftDate,'pFVenceDocto', ptInput);
    spIVAUDI.Params.CreateParam( ftDate,'pFCalculo', ptInput);
    spIVAUDI.Params.CreateParam( ftFloat,'pTasa', ptInput);
    spIVAUDI.Params.CreateParam( ftInteger,'pCveMonedap', ptInput);
    spIVAUDI.Params.CreateParam( ftFloat,'pIVA', ptOutput);
    spIVAUDI.Prepare;

    spIVAUDI.ParamByName('pFVenceDocto').AsDate := pFVenceDocto;
    spIVAUDI.ParamByName('pFCalculo').AsDate := pFCalculo;
    spIVAUDI.ParamByName('pTasa').AsFloat := pTasa;
    spIVAUDI.ParamByName('pCveMonedap').Asinteger := pCveMonedap;

    spIVAUDI.ExecProc;

    Result := spIVAUDI.ParamByName('pIVA').AsFloat;

    spIVAUDI.Unprepare;
    spIVAUDI.Close;
  finally
    spIVAUDI.Free;
  end;
end;


procedure TCrPack.CalculaAdeudo(Credito : integer;
                            FechaCalculo : TDateTime;
                            var ImpVenCap : double;
                            var ImpVenInt : double;
                            var ImpVenCom : double;
                            var ImpIVAIntVen : double;
                            var ImpIVAComVen : double;

                            var ImpVigInt    : double;
                            var ImpIVAVigInt : double;
                            var ImpVigCom : double;
                            var ImpIVAVigCom : double;

                            var ImpMorasCap : double;
                            var ImpIVAMoraCap : double;
                            var ImpMorasInt : double;
                            var ImpIVAMoraInt : double;
                            var ImpMorasCom : double;
                            var ImpIVAMoraCom : double;

                            var TIVA : double;
                            var FVenCred : TDateTime);

var
  spCalcula : TStoredProc;
begin
  spCalcula := TStoredProc.Create(nil);
  try
    spCalcula.SessionName := FApli.SessionName;
    spCalcula.DataBaseName := FApli.DataBaseName;
    spCalcula.StoredProcName := 'PKGCREDITO.STPCALCADEUDO';

    spCalcula.Params.Clear;
        
    spCalcula.Params.CreateParam(ftInteger, 'pIdCredito'    , ptInput);
    spCalcula.Params.CreateParam(ftDateTime, 'pFecha'        , ptInput);
    spCalcula.Params.CreateParam(ftFloat, 'pImpVenCap'     , ptOutput);
    spCalcula.Params.CreateParam(ftFloat, 'pImpVenInt'     , ptOutput);
    spCalcula.Params.CreateParam(ftFloat, 'pImpVenCom'     , ptOutput);
    spCalcula.Params.CreateParam(ftFloat, 'pImpIVAIntVen'  , ptOutput);
    spCalcula.Params.CreateParam(ftFloat, 'pImpIVAComVen'  , ptOutput);

    spCalcula.Params.CreateParam(ftFloat, 'pImpVigInt'     , ptOutput);
    spCalcula.Params.CreateParam(ftFloat, 'pImpIVAVigInt'  , ptOutput);
    spCalcula.Params.CreateParam(ftFloat, 'pImpVigCom'     , ptOutput);
    spCalcula.Params.CreateParam(ftFloat, 'pImpIVAVigCom'  , ptOutput);

    spCalcula.Params.CreateParam(ftFloat, 'pImpMorasCap'   , ptOutput);
    spCalcula.Params.CreateParam(ftFloat, 'pImpIVAMoraCap' , ptOutput);
    spCalcula.Params.CreateParam(ftFloat, 'pImpMorasInt'   , ptOutput);
    spCalcula.Params.CreateParam(ftFloat, 'pImpIVAMoraInt' , ptOutput);
    spCalcula.Params.CreateParam(ftFloat, 'pImpMorasCom'   , ptOutput);
    spCalcula.Params.CreateParam(ftFloat, 'pImpIVAMoraCom' , ptOutput);
    spCalcula.Params.CreateParam(ftFloat, 'pTIVA'          , ptOutput);
    spCalcula.Params.CreateParam(ftDate,  'pFVenCred'      , ptOutput);
    spCalcula.Params.CreateParam(ftFloat, 'pTasa'      , ptOutput);

    spCalcula.Prepare;

    spCalcula.ParamByName('pIdCredito').Asinteger := Credito;
    spCalcula.ParamByName('pFecha').AsDateTime := FechaCalculo;

    spCalcula.ExecProc;

    ImpVenCap     := spCalcula.ParamByName('pImpVenCap').AsFloat;
    ImpVenInt     := spCalcula.ParamByName('pImpVenInt').AsFloat;
    ImpVenCom     := spCalcula.ParamByName('pImpVenCom').AsFloat;
    ImpIVAIntVen  := spCalcula.ParamByName('pImpIVAIntVen').AsFloat;
    ImpIVAComVen  := spCalcula.ParamByName('pImpIVAComVen').AsFloat;

    ImpVigInt     := spCalcula.ParamByName('pImpVigInt').AsFloat;
    ImpIVAVigInt  := spCalcula.ParamByName('pImpIVAVigInt').AsFloat;
    ImpVigCom     := spCalcula.ParamByName('pImpVigCom').AsFloat;
    ImpIVAVigCom  := spCalcula.ParamByName('pImpIVAVigCom').AsFloat;

    ImpMorasCap   := spCalcula.ParamByName('pImpMorasCap').AsFloat;
    ImpIVAMoraCap := spCalcula.ParamByName('pImpIVAMoraCap').AsFloat;
    ImpMorasInt   := spCalcula.ParamByName('pImpMorasInt').AsFloat;
    ImpIVAMoraInt := spCalcula.ParamByName('pImpIVAMoraInt').AsFloat;
    ImpMorasCom   := spCalcula.ParamByName('pImpMorasCom').AsFloat;
    ImpIVAMoraCom := spCalcula.ParamByName('pImpIVAMoraCom').AsFloat;
    TIVA          := spCalcula.ParamByName('pTIVA').AsFloat;
    FVenCred      := spCalcula.ParamByName('pFVenCred').AsDateTime;

    spCalcula.Unprepare;
    spCalcula.Close;
  finally
    spCalcula.Free;
  end;
end;

function ConvierteFechaAHora(Fecha : TDateTime) : integer;
var
  Hour, Min, Sec, MSec: Word;
  StrHora : string;
begin
  DecodeTime(Fecha, Hour, Min, Sec, MSec);
  StrHora := FormatFloat('00',Hour) + FormatFloat('00',Min) + FormatFloat('00',Sec);
  Result := StrtoInt(StrHora);
end;

function BooltoStr(vBool : boolean) : string;
begin
  BooltoStr := 'F';
  if vBool then BooltoStr :=  'V';
end;

function StrtoBool(vStr : string) : boolean;
begin
  StrtoBool := (vStr = 'V');
end;

function PreDbltoStr(pFloat : double; pDecimales : integer) : string;
var
  vCount : integer;
  vFormat : string;
begin
  vFormat := '0.';
  for vCount := 1 to pDecimales do
    begin
      vFormat := vFormat + '#';
    end;
  Result := FormatFloat(vFormat, pFloat);
end;

function PreDbltoDbl(pFloat : double; pDecimales : integer) : double;
begin
  Result := StrtoFloat(PreDbltoStr(pFloat,pDecimales));
end;

function DameBaseSICA(Apli : TInterApli): TDatabase;
var
  TempDatabase : TDatabase;
  DataBaseName : string;
  P : string;
  Us, Pa : string;
  Alias : string;
begin
  Alias := 'SICA';
  TempDatabase := nil;
  P:=ParamStr(1);
  Us:='USER NAME=CREDITO';
  Pa:='PASSWORD=SISTEMAS';
  if P <> 'P' then P:='D';
  DataBaseName := P+Alias;
  try
    Sessions.OpenSession(Apli.SessionName);
    with Sessions do
      begin
      with FindSession(Apli.SessionName) do
        begin
          Result := FindDatabase(DataBaseName);
          if Result = nil then
            begin
              TempDatabase := TDatabase.Create(nil);
              TempDatabase.DatabaseName := DataBaseName;
              TempDatabase.SessionName := Apli.SessionName;
              TempDatabase.KeepConnection := True;
              TempDataBase.Connected := False;
              TempDataBase.Params.Clear;
              TempDataBase.Params.Add('SERVER NAME='+P+Alias);
              TempDataBase.Params.Add('LANGDRIVER=DBWINWE0');
              TempDataBase.Params.Add(Us);
              TempDataBase.Params.Add(Pa);
              TempDataBase.LoginPrompt := False;
            end;
          Result := OpenDatabase(DatabaseName);
        end;
      end;
 except
   TempDatabase.Free;
   raise;
 end;
end;

function InsertaTransaccion(pID_CREDITO : integer; pID_CONTRATO : integer; pFOLIO_GPO_TRANS : integer;
                            pF_APLICACION : TDateTime; pNUM_PERIODO : integer; pIMP_OPERACION : Double;
                            pTASA_APLICACION : double; pTIPO_CAMBIO : double;
                            pCVE_OPERACION : string; pF_LIQUIDACION : TDateTime; pSDO_GENERA_TRANS : double;
                            pTX_COMENTARIO : string; pCVE_COMISION : string; pNUM_DOCUMENTO : integer; pID_CONTRA_DV : integer;
                            Sender : TInterFrame; ShowError : boolean; pCommit : boolean): integer;
var
  Paquete     : TCrPack;
  spInserta   : TStoredProc;
  ErrorStr    : string;
begin
  spInserta := TStoredProc.Create(Sender);
  Paquete   := TCrPack.Create(Sender);
  try
    spInserta.SessionName := Sender.SessionName;
    spInserta.DataBaseName := Sender.DataBaseName;
    Paquete.Apli := Sender.Apli;
    spInserta.StoredProcName := 'PKGCREDITO.STPINSRECEPTRANS';

    spInserta.Params.Clear;
    spInserta.Params.CreateParam(ftInteger,'pFOL_RECEP_TRAN'  , ptInput);
    spInserta.Params.CreateParam(ftInteger,'pID_CREDITO'      , ptInput);
    spInserta.Params.CreateParam(ftInteger,'pID_CONTRATO'     , ptInput);
    spInserta.Params.CreateParam(ftInteger,'pFOLIO_GPO_TRANS' , ptInput);
    spInserta.Params.CreateParam(ftDate   ,'pF_OPERACION'     , ptInput);
    spInserta.Params.CreateParam(ftInteger,'pH_OPERACION'     , ptInput);
    spInserta.Params.CreateParam(ftDate   ,'pF_APLICACION'    , ptInput);
    spInserta.Params.CreateParam(ftInteger,'pNUM_PERIODO'     , ptInput);
    spInserta.Params.CreateParam(ftFloat  ,'pIMP_OPERACION'   , ptInput);
    spInserta.Params.CreateParam(ftFloat  ,'pTASA_APLICACION' , ptInput);
    spInserta.Params.CreateParam(ftString ,'pSIT_RECEP_TRANS' , ptInput);
    spInserta.Params.CreateParam(ftFloat  ,'pTIPO_CAMBIO'     , ptInput);
    spInserta.Params.CreateParam(ftString ,'pCVE_USU_APLICA'  , ptInput);
    spInserta.Params.CreateParam(ftString ,'pCVE_OPERACION'   , ptInput);
    spInserta.Params.CreateParam(ftDate   ,'pF_LIQUIDACION'   , ptInput);
    spInserta.Params.CreateParam(ftInteger,'pH_LIQUIDACION'   , ptInput);
    spInserta.Params.CreateParam(ftFloat  ,'pSDO_GENERA_TRANS', ptInput);
    spInserta.Params.CreateParam(ftString ,'pTX_COMENTARIO'   , ptInput);
    spInserta.Params.CreateParam(ftString ,'pCVE_COMISION'    , ptInput);
    spInserta.Params.CreateParam(ftString,'pNUM_DOCUMENTO',ptInput); //  ^^Migración^^ STP V
    spInserta.Params.CreateParam(ftInteger,'pID_CONTRA_DV'    , ptInput);
    spInserta.Params.CreateParam(ftString ,'pB_COMMIT'        , ptInput);
    spInserta.Params.CreateParam(ftInteger,'pID_COD_RESP'     , ptOutput);
    spInserta.Prepare;

    spInserta.ParamByName('pFOL_RECEP_TRAN').Asinteger  := Paquete.DameFolio(foTransCred);
    spInserta.ParamByName('pID_CREDITO').Asinteger      := pID_CREDITO     ;
    spInserta.ParamByName('pID_CONTRATO').Asinteger     := pID_CONTRATO    ;
    spInserta.ParamByName('pFOLIO_GPO_TRANS').Asinteger := pFOLIO_GPO_TRANS;
    spInserta.ParamByName('pF_OPERACION').AsDate        := Trunc(Sender.Apli.DameFechaEmpresa);
    spInserta.ParamByName('pH_OPERACION').Asinteger     := ConvierteFechaAHora(Sender.Apli.SysDateTime);
    spInserta.ParamByName('pF_APLICACION').AsDate       := Trunc(pF_APLICACION);
    spInserta.ParamByName('pNUM_PERIODO').Asinteger     := pNUM_PERIODO    ;
    spInserta.ParamByName('pIMP_OPERACION').AsFloat     := pIMP_OPERACION  ;
    spInserta.ParamByName('pTASA_APLICACION').AsFloat   := pTASA_APLICACION;
    spInserta.ParamByName('pSIT_RECEP_TRANS').AsString  := 'AC';
    spInserta.ParamByName('pTIPO_CAMBIO').AsFloat       := pTIPO_CAMBIO    ;
    spInserta.ParamByName('pCVE_USU_APLICA').AsString   := Sender.Apli.Usuario;
    spInserta.ParamByName('pCVE_OPERACION').AsString    := pCVE_OPERACION  ;
    spInserta.ParamByName('pF_LIQUIDACION').AsDate      := Trunc(pF_LIQUIDACION);
    spInserta.ParamByName('pH_LIQUIDACION').AsInteger   := ConvierteFechaAHora(pF_LIQUIDACION);
    spInserta.ParamByName('pSDO_GENERA_TRANS').AsFloat  := pSDO_GENERA_TRANS;
    spInserta.ParamByName('pTX_COMENTARIO').AsString    := pTX_COMENTARIO  ;
    spInserta.ParamByName('pCVE_COMISION').AsString     := pCVE_COMISION   ;
    spInserta.ParamByName('pNUM_DOCUMENTO').AsInteger   := pNUM_DOCUMENTO  ;
    spInserta.ParamByName('pID_CONTRA_DV').AsInteger    := pID_CONTRA_DV   ;
    spInserta.ParamByName('pB_COMMIT').AsString         := BooltoStr(pCommit);
    if (spInserta.ParamByName('pIMP_OPERACION').AsFloat <> 0) or (spInserta.ParamByName('pCVE_OPERACION').AsString = 'CCHE') then
      spInserta.ExecProc;
    Result := spInserta.ParamByName('pID_COD_RESP').AsInteger;

    spInserta.Unprepare;
    spInserta.Close;

    if (Result <> 0) and (ShowError) then
      begin
        ErrorStr := Paquete.DameCodigoRespuesta(Result);
        raise EInterFrame.Create(ErrorStr);
      end;
  finally
    spInserta.Free;
    if Paquete <> nil then Paquete.Free;
    Paquete := nil;
  end;
end;

function InsTransContable(pID_CREDITO : integer; pID_CONTRATO : integer; pNUM_PERIODO : integer;
                          pF_APLICACION : TDateTime; pF_VENCE : TDateTime;
                          pIMP_MOVIMIENTO : double; pIMP_CAPITAL : double; pIMP_INTERES : double;
                          pIMP_IVA : double; pIMP_MORAS : double; pIMP_AJUSTE : double;
                          pIMP_GARANTIA : double; pIMP_ISR : double; pIMP_COMISION : double;
                          pIMP_CAP_VEN : double; pIMP_INT_VEN : double; pIMP_INT_EXT : double;
                          pIMP_CAP_REFIN : double; pIMP_CARGA : double; pIMP_OPCION : double;
                          pIMP_IVA_INI : double; pIMP_IVA_VEN : double; pIMP_RENT_DEP : double;
                          pTIPO_APLICACION : string; pCTO_LIQ : integer; pF_TIPO_CAMBIO : TDateTime;
                          pMONEDA : integer; pApli : TInterApli; ShowError : boolean): integer;
var
  Paquete                 : TCrPack;
  spPackSICA              : TStoredProc;
  vFAplicacion, vFVence   : TDateTime;
  vTipoCambio             : double;
begin
  Paquete := TCrPack.Create(nil);
  spPackSICA := TStoredProc.Create(nil);
  vTipoCambio := 0;
  if not (pMONEDA = 0) then
    begin
      try
        Paquete.Apli := pApli;
        vTipoCambio  := Paquete.DameUltimoTipoCambio(pF_TIPO_CAMBIO, pMONEDA, 'V');
      finally
        if Paquete <> nil then Paquete.Free;
      end;
    end;
  vFAplicacion := Trunc(pF_APLICACION);
  vFVence := Trunc(pF_VENCE);
  try
    spPackSICA.SessionName  := pApli.SessionName;
    spPackSICA.DataBaseName := pApli.DataBaseName;
    spPackSICA.StoredProcName := 'PKGCREDITO.STPINTERCONTA';

    spPackSICA.Params.Clear;
    spPackSICA.Params.CreateParam( ftFloat,    'PNUMOPER',     ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PAUTOR',       ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PNUMPERIO',    ptInput );
    spPackSICA.Params.CreateParam( ftDateTime, 'PFAPLICA',     ptInput );
    spPackSICA.Params.CreateParam( ftDateTime, 'PFVENCE',      ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMMOVIMIENTO', ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMCAPITAL',    ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMINTERES',    ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMIVA',        ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMMORAS',      ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMAJUSTE',     ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMGARANTIA',   ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMISR',        ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMCOMISION',   ptInput );
    spPackSICA.Params.CreateParam( ftString,   'PTIPOAPLICA',  ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMCAPVEN',     ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMINTVEN',     ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMINTEXT',     ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMCAPREFIN',   ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMCARGA',      ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMOPCION',     ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMIVAINI',     ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMIVAVEN',     ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PMRENTDEP',    ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PNUMUSU',      ptInput );
    spPackSICA.Params.CreateParam( ftString,   'PCHEQUERA',    ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PTIPOCAMBIO',  ptInput );
    spPackSICA.Params.CreateParam( ftDateTime, 'PFTIPOCAMBIO', ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PNUMEROMOVTO', ptInput );
    spPackSICA.Params.CreateParam( ftString,   'PCOMPANIA',    ptInput );
    spPackSICA.Params.CreateParam( ftFloat,    'PFOLGPO',      ptInput );
    
    spPackSICA.Prepare;

    spPackSICA.ParamByName('pNumOper'     ).AsInteger := pID_CREDITO;
    spPackSICA.ParamByName('pAutor'       ).AsInteger := pID_CONTRATO - 330000000;
    spPackSICA.ParamByName('pNumPerio'    ).AsInteger := pNUM_PERIODO;
    spPackSICA.ParamByName('pFAplica'    ).AsDateTime:= vFAplicacion;
    if vFVence = 0 then spPackSICA.ParamByName('pFVence').Clear else spPackSICA.ParamByName('pFVence').AsDateTime  := vFVence;
    spPackSICA.ParamByName('pMMovimiento' ).AsFloat   := PreDbltoDbl(pIMP_MOVIMIENTO*100,0);
    spPackSICA.ParamByName('pMCapital'    ).AsFloat   := PreDbltoDbl(pIMP_CAPITAL*100,0);
    spPackSICA.ParamByName('pMInteres'    ).AsFloat   := PreDbltoDbl(pIMP_INTERES*100,0);
    spPackSICA.ParamByName('pMIva'        ).AsFloat   := PreDbltoDbl(pIMP_IVA*100,0);
    spPackSICA.ParamByName('pMMoras'      ).AsFloat   := PreDbltoDbl(pIMP_MORAS*100,0);
    spPackSICA.ParamByName('pMAjuste'     ).AsFloat   := PreDbltoDbl(pIMP_AJUSTE*100,0);
    spPackSICA.ParamByName('pMGarantia'   ).AsFloat   := PreDbltoDbl(pIMP_GARANTIA*100,0);
    spPackSICA.ParamByName('pMIsr'        ).AsFloat   := PreDbltoDbl(pIMP_ISR*100,0);
    spPackSICA.ParamByName('pMComision'   ).AsFloat   := PreDbltoDbl(pIMP_COMISION*100,0);
    spPackSICA.ParamByName('pTipoAplica'  ).AsString  := pTIPO_APLICACION;
    spPackSICA.ParamByName('pMCapVen'     ).AsFloat   := PreDbltoDbl(pIMP_CAP_VEN*100,0);
    spPackSICA.ParamByName('pMIntVen'     ).AsFloat   := PreDbltoDbl(pIMP_INT_VEN*100,0);
    spPackSICA.ParamByName('pMIntExt'     ).AsFloat   := PreDbltoDbl(pIMP_INT_EXT*100,0);
    spPackSICA.ParamByName('pMCapRefin'   ).AsFloat   := PreDbltoDbl(pIMP_CAP_REFIN*100,0);
    spPackSICA.ParamByName('pMCarga'      ).AsFloat   := PreDbltoDbl(pIMP_CARGA*100,0);
    spPackSICA.ParamByName('pMOpcion'     ).AsFloat   := PreDbltoDbl(pIMP_OPCION*100,0);
    spPackSICA.ParamByName('pMIvaIni'     ).AsFloat   := PreDbltoDbl(pIMP_IVA_INI*100,0);
    spPackSICA.ParamByName('pMIvaVen'     ).AsFloat   := PreDbltoDbl(pIMP_IVA_VEN*100,0);
    spPackSICA.ParamByName('pMRentDep'    ).AsFloat   := PreDbltoDbl(pIMP_RENT_DEP*100,0);
    spPackSICA.ParamByName('pNumUsu'      ).AsInteger := pApli.UsuarioID;
    if (pCTO_LIQ = 0) then spPackSICA.ParamByName('pChequera').Clear else spPackSICA.ParamByName('pChequera').AsInteger  := pCTO_LIQ;
    if vTipoCambio = 0 then spPackSICA.ParamByName('pTipoCambio').Clear else spPackSICA.ParamByName('pTipoCambio').AsFloat   := vTipoCambio;
    spPackSICA.ParamByName('pFTipoCambio').AsDate    := pF_TIPO_CAMBIO;
    spPackSICA.ParamByName('pNumeroMovto' ).AsInteger := 0;
    spPackSICA.ParamByName('pCompania'    ).AsString  := 'BCO2';
    spPackSICA.ParamByName('pFolGpo'    ).AsInteger  := 0;

    spPackSICA.ExecProc;
    spPackSICA.Unprepare;
    spPackSICA.Close;
  finally
    Paquete.Free;
    spPackSICA.Free;
  end;
end;


{Version que utiliza la base de SICA,
deshabilitada el 23/02/2000

function InsTransContable(pID_CREDITO : integer; pID_CONTRATO : integer; pNUM_PERIODO : integer;
                          pF_APLICACION : TDateTime; pF_VENCE : TDateTime;
                          pIMP_MOVIMIENTO : double; pIMP_CAPITAL : double; pIMP_INTERES : double;
                          pIMP_IVA : double; pIMP_MORAS : double; pIMP_AJUSTE : double;
                          pIMP_GARANTIA : double; pIMP_ISR : double; pIMP_COMISION : double;
                          pIMP_CAP_VEN : double; pIMP_INT_VEN : double; pIMP_INT_EXT : double;
                          pIMP_CAP_REFIN : double; pIMP_CARGA : double; pIMP_OPCION : double;
                          pIMP_IVA_INI : double; pIMP_IVA_VEN : double; pIMP_RENT_DEP : double;
                          pTIPO_APLICACION : string; pCTO_LIQ : integer; pF_TIPO_CAMBIO : TDateTime;
                          pMONEDA : integer; pApli : TInterApli; ShowError : boolean): integer;
var
  Paquete                 : TCrPack;
  spPackSICA              : TStoredProc;
  vFAplicacion, vFVence   : TDateTime;
  vTipoCambio             : double;
  BaseSICA                : TDataBase;

begin
  Paquete := TCrPack.Create(nil);
  spPackSICA := TStoredProc.Create(nil);
  BaseSICA := DameBaseSICA(pApli);
  vTipoCambio := 0;
  if not (pMONEDA = 0) then
    begin
      try
        Paquete.Apli := pApli;
        vTipoCambio  := Paquete.DameUltimoTipoCambio(pF_TIPO_CAMBIO, pMONEDA, 'V');
      finally
        if Paquete <> nil then Paquete.Free;
      end;
    end;
  vFAplicacion := Trunc(pF_APLICACION);
  vFVence := Trunc(pF_VENCE);

  try
    spPackSICA.SessionName  := pApli.SessionName;
    spPackSICA.DataBaseName := BaseSICA.DatabaseName;
    spPackSICA.StoredProcName := 'GEN_FUNCION.FAZADABAS';

    spPackSICA.Params.CreateParam(ftInteger,'pNumOper',ptInput);
    spPackSICA.Params.CreateParam(ftInteger,'pAutor',ptInput);
    spPackSICA.Params.CreateParam(ftInteger,'pNumPerio',ptInput);
    spPackSICA.Params.CreateParam(ftDate   ,'pF8Aplica',ptInput);
    spPackSICA.Params.CreateParam(ftDate   ,'pF8Vence',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMMovimiento',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMCapital',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMInteres',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMIva',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMMoras',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMAjuste',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMGarantia',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMIsr',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMComision',ptInput);
    spPackSICA.Params.CreateParam(ftString ,'pTipoAplica',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMCapVen',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMIntVen',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMIntExt',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMCapRefin',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMCarga',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMOpcion',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMIvaIni',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMIvaVen',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pMRentDep',ptInput);
    spPackSICA.Params.CreateParam(ftInteger,'pNumUsu',ptInput);
    spPackSICA.Params.CreateParam(ftString ,'pChequera',ptInput);
    spPackSICA.Params.CreateParam(ftFloat  ,'pTipoCambio',ptInput);
    spPackSICA.Params.CreateParam(ftDate   ,'pF8TipoCambio',ptInput);
    spPackSICA.Params.CreateParam(ftInteger,'pNumeroMovto',ptInput);
    spPackSICA.Params.CreateParam(ftString ,'pCompania',ptInput);
    spPackSICA.Prepare;

    spPackSICA.ParamByName('pNumOper'     ).AsInteger := pID_CREDITO;
    spPackSICA.ParamByName('pAutor'       ).AsInteger := pID_CONTRATO - 330000000;
    spPackSICA.ParamByName('pNumPerio'    ).AsInteger := pNUM_PERIODO;
    spPackSICA.ParamByName('pF8Aplica'    ).AsDateTime:= vFAplicacion;
    if vFVence = 0 then spPackSICA.ParamByName('pF8Vence').Clear else spPackSICA.ParamByName('pF8Vence').AsDateTime  := vFVence;
    spPackSICA.ParamByName('pMMovimiento' ).AsFloat   := PreDbltoDbl(pIMP_MOVIMIENTO*100,0);
    spPackSICA.ParamByName('pMCapital'    ).AsFloat   := PreDbltoDbl(pIMP_CAPITAL*100,0);
    spPackSICA.ParamByName('pMInteres'    ).AsFloat   := PreDbltoDbl(pIMP_INTERES*100,0);
    spPackSICA.ParamByName('pMIva'        ).AsFloat   := PreDbltoDbl(pIMP_IVA*100,0);
    spPackSICA.ParamByName('pMMoras'      ).AsFloat   := PreDbltoDbl(pIMP_MORAS*100,0);
    spPackSICA.ParamByName('pMAjuste'     ).AsFloat   := PreDbltoDbl(pIMP_AJUSTE*100,0);
    spPackSICA.ParamByName('pMGarantia'   ).AsFloat   := PreDbltoDbl(pIMP_GARANTIA*100,0);
    spPackSICA.ParamByName('pMIsr'        ).AsFloat   := PreDbltoDbl(pIMP_ISR*100,0);
    spPackSICA.ParamByName('pMComision'   ).AsFloat   := PreDbltoDbl(pIMP_COMISION*100,0);
    spPackSICA.ParamByName('pTipoAplica'  ).AsString  := pTIPO_APLICACION;
    spPackSICA.ParamByName('pMCapVen'     ).AsFloat   := PreDbltoDbl(pIMP_CAP_VEN*100,0);
    spPackSICA.ParamByName('pMIntVen'     ).AsFloat   := PreDbltoDbl(pIMP_INT_VEN*100,0);
    spPackSICA.ParamByName('pMIntExt'     ).AsFloat   := PreDbltoDbl(pIMP_INT_EXT*100,0);
    spPackSICA.ParamByName('pMCapRefin'   ).AsFloat   := PreDbltoDbl(pIMP_CAP_REFIN*100,0);
    spPackSICA.ParamByName('pMCarga'      ).AsFloat   := PreDbltoDbl(pIMP_CARGA*100,0);
    spPackSICA.ParamByName('pMOpcion'     ).AsFloat   := PreDbltoDbl(pIMP_OPCION*100,0);
    spPackSICA.ParamByName('pMIvaIni'     ).AsFloat   := PreDbltoDbl(pIMP_IVA_INI*100,0);
    spPackSICA.ParamByName('pMIvaVen'     ).AsFloat   := PreDbltoDbl(pIMP_IVA_VEN*100,0);
    spPackSICA.ParamByName('pMRentDep'    ).AsFloat   := PreDbltoDbl(pIMP_RENT_DEP*100,0);
    spPackSICA.ParamByName('pNumUsu'      ).AsInteger := pApli.UsuarioID;
    if (pCTO_LIQ = 0) then spPackSICA.ParamByName('pChequera').Clear else spPackSICA.ParamByName('pChequera').AsInteger  := pCTO_LIQ;
    if vTipoCambio = 0 then spPackSICA.ParamByName('pTipoCambio').Clear else spPackSICA.ParamByName('pTipoCambio').AsFloat   := vTipoCambio;
    spPackSICA.ParamByName('pF8TipoCambio').AsDate    := pF_TIPO_CAMBIO;
    spPackSICA.ParamByName('pNumeroMovto' ).AsInteger := 0;
    spPackSICA.ParamByName('pCompania'    ).AsString  := 'BCO2';

    spPackSICA.ExecProc;

    spPackSICA.Unprepare;
    spPackSICA.Close;
  finally
    spPackSICA.Free;
    if BaseSICA <> nil then BaseSICA.Free;
  end;
end;
}

function TCrPack.DameCodigoRespuesta(Codigo : integer) : string;
var
  spCodigo : TStoredProc;
begin
  spCodigo := TStoredProc.Create(Self);
  try
    spCodigo.DatabaseName := FApli.DataBaseName;
    spCodigo.SessionName := FApli.SessionName;
    spCodigo.StoredProcName := 'PKGCREDITO.STPDAMECODRES';

    spCodigo.Params.Clear;
    spCodigo.Params.CreateParam(ftInteger, 'PCODRES', ptInput);
    spCodigo.Params.CreateParam(ftString,  'PMENSAJE', ptOutput);

    spCodigo.Prepare;

    spCodigo.ParamByName('PCODRES').AsInteger := Codigo;
    spCodigo.ExecProc;
    Result := spCodigo.ParamByName('pMENSAJE').AsString;
    spCodigo.UnPrepare;
    spCodigo.Close;
  finally
    spCodigo.Free;
  end;
end;



end.
