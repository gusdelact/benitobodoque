//-------------------------------------------------------------
// Sistema         :
// Date            :   Agosto de 1997
// Fecha de Inicio :   Agosto de 1997
// Función         :   Clase de fecha del Corporativo
// Desarrollo por  :   José Alberto Martínez Rodríguez.
// Comentarios     :
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------
unit IntFecha;

interface

uses
  Classes, dbTables, SysUtils, db;


Type
  EFecha = class(Exception);
  TFecha = Class(TComponent)
    private
    { Private declarations }
      FIdEmpresa : double;
      FCvePais   : string;
      FFechaHoraHoy : TDateTime;
      FFechaReferencia : TDateTime;
      FNumFechasCalcular : Integer;
      FDataBaseName      : String;
      FSessionName       : String;
//      procedure SetDataBase( sDB: string);
//      function GetDataBase: string;
      Procedure SetIdEmpresa( Value : double);
      function GetIdEmpresa: double;
      Procedure SetCvePais( Value : string);
      function GetCvePais: string;
      function GetFechaReferencia: TDateTime;
      Procedure SetFechaReferencia( Value : TDateTime);
      function GetNumFechasCalcular: Integer;
      Procedure SetNumFechasCalcular( Value : Integer);
      function DiasCalculados: Integer; // calculos en tabla DESCR_FECHA
    public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy;override;
    procedure CodificaFecha(Year, Month, Day: Word);
    procedure DecodificaFecha( var Year, Month, Day: Word);
    function GetSysDate: TDateTime;
    function FechaValida: Boolean;
    function FechaValidaCvePais: Boolean;
    function EsFinSemana: Boolean;
    function GeneraFechas( NumDia : Integer ): Boolean;
    function GeneraFechasGlobal: Boolean;
    function DiaLiquidacion( vsCveLiq : string): TDateTime;
    function DiaLiquidacionTabla( vsCveLiq : string): TDateTime;
    function DiaAnterior: TDateTime;
    function DiaSiguiente: TDateTime;
    function SiguienteDiaHabil(FechaHoy:TDateTime; eEmpresa:Integer): TDateTime;
    procedure Error(viResp :Integer);virtual;
    published
    property IdEmpresa : double read GetIdEmpresa write SetIdEmpresa;
    property CvePais : string read GetCvePais write SetCvePais;
    property FechaReferencia : TDateTime read GetFechaReferencia write SetFechaReferencia;
    property NumFechasCalcular : Integer read GetNumFechasCalcular write SetNumFechasCalcular default 0;
    property DatabaseName : String read FDataBaseName write FDatabaseName;
    property SessionName : String read FSessionName write FSessionName;
  end;
implementation



constructor TFecha.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
end;

destructor TFecha.Destroy;
begin
  inherited Destroy;
end;

procedure TFecha.Error(viResp :Integer);
begin
  raise EFecha.Create('Error en proceso de Fecha, Oracle :' + IntToStr(viResp));
end;

procedure TFecha.CodificaFecha(Year, Month, Day: Word);
begin
  FechaReferencia := EncodeDate( Year, Month, Day);
end;

procedure TFecha.DecodificaFecha( var Year, Month, Day: Word);
begin
  DecodeDate(FechaReferencia, Year, Month, Day);
end;

function TFecha.GetSysDate: TDateTime;
var spFecha : TStoredProc;
begin
//  if DataBase = '' then begin
//    error(0);

  spFecha := TStoredProc.Create(Nil);
  try
    spFecha.DataBaseName := DataBaseName;
    spFecha.SessionName := SessionName;
    spFecha.StoredProcName := 'OBT_FECHA_HORA';
    spFecha.Params.CreateParam( ftDateTime,'P_FH_DATE', ptOutput);
    spFecha.Prepare;
    spFecha.ExecProc;
    FFechaHoraHoy := spFecha.ParamByName('P_FH_DATE').AsDateTime;
    spFecha.Unprepare;
    spFecha.Close;
    GetSysDate := FFechaHoraHoy;
    finally
      spFecha.Free;
    end;
end;

function TFecha.DiasCalculados: Integer;
// dias calculados de una empresa  si es negativo hubo error.
var viResp : Integer;
    vbReturn: Integer;
    spFecha : TStoredProc;
begin
//  if DataBase = '' then
//    error(0);

  spFecha := TStoredProc.Create(Nil);
  try
  spFecha.DataBaseName := DataBaseName;
  spFecha.SessionName := SessionName;
  spFecha.StoredProcName := 'SPE_FECHA';
  spFecha.Params.CreateParam( ftInteger,'P_METODO', ptinput);
  spFecha.Params.CreateParam( ftFloat,'P_IDEMPRESA',ptInputOutput );
  spFecha.Params.CreateParam( ftDate,'P_FECHA',ptInputOutput);
  spFecha.Params.CreateParam( ftString,'P_CVELIQ', ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'P_NUMFECHASCALCULAR',ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'P_DIASCALCULADOS',ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'PS_RESP',ptOutput);
  spFecha.Prepare;
  //obtiene el numero de dias calculados de la empresa
  spFecha.ParamByName('p_metodo').Asinteger := 2;
  spFecha.ParamByName('p_IdEmpresa').AsFloat := FIdEmpresa;
  spFecha.ExecProc;
  viResp := spFecha.ParamByName('ps_Resp').AsInteger;
  if viResp = 0 then
    vbReturn := spFecha.ParamByName('p_DiasCalculados').AsInteger
  else
    vbReturn := -1;
  spFecha.Unprepare;
  spFecha.Close;
  DiasCalculados := vbReturn;
  finally
    spFecha.Free;
  end;
end;

function TFecha.DiaLiquidacion( vsCveLiq : string): TDateTime;
var viResp : Integer;
    vdtFechaRet : TDateTime;
        spFecha : TStoredProc;
begin
//  if DataBase = '' then
//    error(0);

  spFecha := TStoredProc.Create(Nil);
  try
  spFecha.DataBaseName := DataBaseName;
  spFecha.SessionName := SessionName;
  spFecha.StoredProcName := 'SPE_FECHA';
  spFecha.Params.CreateParam( ftInteger,'P_METODO', ptinput);
  spFecha.Params.CreateParam( ftFloat,'P_IDEMPRESA',ptInputOutput );
  spFecha.Params.CreateParam( ftDate,'P_FECHA',ptInputOutput);
  spFecha.Params.CreateParam( ftString,'P_CVELIQ', ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'P_NUMFECHASCALCULAR',ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'P_DIASCALCULADOS',ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'PS_RESP',ptOutput);
  spFecha.Prepare;
  //
  spFecha.ParamByName('p_metodo').AsInteger := 6;
  spFecha.ParamByName('p_IdEmpresa').AsFloat := FIdEmpresa;
  spFecha.ParamByName('p_Fecha').AsDate := FFechaReferencia;
  spFecha.ParamByName('p_CveLiq').AsString := vsCveLiq;
  spFecha.ExecProc;
  viResp := spFecha.ParamByName('ps_Resp').AsInteger;
  if viResp = 0 then begin
    vdtFechaRet := spFecha.ParamByName('p_Fecha').AsDate;
  end else
    Error(viResp);
  spFecha.Unprepare;
  spFecha.Close;
  DiaLiquidacion := vdtFechaRet;
  finally
    spFecha.Free;
  end;
end;

function TFecha.DiaLiquidacionTabla( vsCveLiq : string): TDateTime;
var viResp : Integer;
    vdtFechaRet : TDateTime;
        spFecha : TStoredProc;
begin
//  if DataBase = '' then
//    error(0);

  spFecha := TStoredProc.Create(Nil);
  try
  spFecha.DataBaseName := DataBaseName;
  spFecha.SessionName := SessionName;
  spFecha.StoredProcName := 'SPE_FECHA';
  spFecha.Params.CreateParam( ftInteger,'P_METODO', ptinput);
  spFecha.Params.CreateParam( ftFloat,'P_IDEMPRESA',ptInputOutput );
  spFecha.Params.CreateParam( ftDate,'P_FECHA',ptInputOutput);
  spFecha.Params.CreateParam( ftString,'P_CVELIQ', ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'P_NUMFECHASCALCULAR',ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'P_DIASCALCULADOS',ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'PS_RESP',ptOutput);
  spFecha.Prepare;
  //
  spFecha.ParamByName('p_metodo').AsInteger := 5;
  spFecha.ParamByName('p_IdEmpresa').AsFloat := FIdEmpresa;
  spFecha.ParamByName('p_CveLiq').AsString := vsCveLiq;
  spFecha.ExecProc;
  viResp := spFecha.ParamByName('ps_Resp').AsInteger;
  if viResp = 0 then begin
    vdtFechaRet := spFecha.ParamByName('p_Fecha').AsDate;
  end else
    Error(viResp);
  spFecha.Unprepare;
  spFecha.Close;
  DiaLiquidacionTabla := vdtFechaRet;
  finally
    spFecha.Free;
  end;
end;

function TFecha.SiguienteDiaHabil(FechaHoy:TDateTime; eEmpresa:Integer): TDateTime;
var viResp : Integer;
    vdtFechaRet : TDateTime;
        spFecha : TStoredProc;
   Conteo:Integer;
begin
   Conteo:=0;
   FIdEmpresa:=eEmpresa;
   FFechaReferencia:=FechaHoy;
   if Not FechaValida  then
   begin Repeat FechaHoy:=FechaHoy-1;
                FFechaReferencia:=FechaHoy;
                Inc(Conteo);
         Until ((FechaValida) or (Conteo>=15));
         if Conteo>=15 then Error(-1);
   end;

  spFecha := TStoredProc.Create(Nil);
  try
  spFecha.DataBaseName := DataBaseName;
  spFecha.SessionName := SessionName;
  spFecha.StoredProcName := 'SPE_FECHA';
  spFecha.Params.CreateParam( ftInteger,'P_METODO', ptinput);
  spFecha.Params.CreateParam( ftFloat,'P_IDEMPRESA',ptInputOutput );
  spFecha.Params.CreateParam( ftDate,'P_FECHA',ptInputOutput);
  spFecha.Params.CreateParam( ftString,'P_CVELIQ', ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'P_NUMFECHASCALCULAR',ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'P_DIASCALCULADOS',ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'PS_RESP',ptOutput);
  spFecha.Prepare;
  //
  spFecha.ParamByName('p_metodo').AsInteger := 6;
  spFecha.ParamByName('p_IdEmpresa').AsFloat := eEmpresa;
  spFecha.ParamByName('p_FECHA').AsDateTime:= FechaHoy;
  spFecha.ParamByName('P_CVELIQ').AsString:='D001';
  spFecha.ExecProc;
  viResp := spFecha.ParamByName('ps_Resp').AsInteger;
  if viResp = 0 then begin
    vdtFechaRet := spFecha.ParamByName('p_Fecha').AsDate;
  end else
    Error(viResp);
  spFecha.Unprepare;
  spFecha.Close;
  Result:=vdtFechaRet;
  finally
    spFecha.Free;
  end;
end;


function TFecha.DiaAnterior: TDateTime;
begin
  DiaAnterior := DiaLiquidacion( 'AYER');
end;

function TFecha.DiaSiguiente: TDateTime;
begin
  DiaSiguiente := DiaLiquidacion( 'D001');
end;

function TFecha.FechaValida: Boolean;
var viResp : Integer;
    vbReturn : Boolean;
    spFecha  : TStoredProc;
begin
//  if DataBase = '' then
//    error(0);

  spFecha := TStoredProc.Create(Nil);
  try
  spFecha.DataBaseName := DataBaseName;
  spFecha.SessionName := SessionName;
  spFecha.StoredProcName := 'SPE_FECHA';
  spFecha.Params.CreateParam( ftInteger,'P_METODO', ptinput);
  spFecha.Params.CreateParam( ftFloat,'P_IDEMPRESA',ptInputOutput );
  spFecha.Params.CreateParam( ftDate,'P_FECHA',ptInputOutput);
  spFecha.Params.CreateParam( ftString,'P_CVELIQ', ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'P_NUMFECHASCALCULAR',ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'P_DIASCALCULADOS',ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'PS_RESP',ptOutput);
  spFecha.Prepare;
  //
  spFecha.ParamByName('p_metodo').Asinteger := 1;
  spFecha.ParamByName('p_IdEmpresa').AsFloat := FIdEmpresa;
  spFecha.ParamByName('p_Fecha').AsDate := FFechaReferencia;
  spFecha.ExecProc;
  viResp := spFecha.ParamByName('ps_Resp').AsInteger;
  if viResp = 0 then
    vbReturn := TRUE
  else
    vbReturn := FALSE;
  spFecha.Unprepare;
  spFecha.Close;
  FechaValida := vbReturn;
  finally
    spFecha.Free;
  end;
end;

function TFecha.FechaValidaCvePais: Boolean;
var viResp : Integer;
    vbReturn : Boolean;
    spFecha  : TStoredProc;
begin
//  if DataBase = '' then
//    error(0);

  spFecha := TStoredProc.Create(Nil);
  try
  spFecha.DataBaseName := DataBaseName;
  spFecha.SessionName := SessionName;
  spFecha.StoredProcName := 'SPE_FECHA';
  spFecha.Params.CreateParam( ftInteger,'P_METODO', ptinput);
  spFecha.Params.CreateParam( ftFloat,'P_IDEMPRESA',ptInputOutput );
  spFecha.Params.CreateParam( ftDate,'P_FECHA',ptInputOutput);
  spFecha.Params.CreateParam( ftString,'P_CVELIQ', ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'P_NUMFECHASCALCULAR',ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'P_DIASCALCULADOS',ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'PS_RESP',ptOutput);
  spFecha.Prepare;
  //
  spFecha.ParamByName('p_metodo').Asinteger := 7;
  spFecha.ParamByName('p_CveLiq').AsString := FCvePais;
  spFecha.ParamByName('p_Fecha').AsDate := FFechaReferencia;
  spFecha.ExecProc;
  viResp := spFecha.ParamByName('ps_Resp').AsInteger;
  if viResp = 0 then
    vbReturn := TRUE
  else
    vbReturn := FALSE;
  spFecha.Unprepare;
  spFecha.Close;
  FechaValidaCvePais := vbReturn;
  finally
    spFecha.Free;
  end;
end;

function TFecha.EsFinSemana: Boolean;
var vbReturn: Boolean;
    viDia : Integer;
begin
  vbReturn := FALSE;
  viDia := DayOfWeek(FFechaReferencia);
  if ((viDia = 1) OR (viDia = 7)) then
    vbReturn := TRUE;
  EsFinSemana := vbReturn;
end;

function TFecha.GeneraFechas( NumDia : Integer ): Boolean;
var viResp : Integer;
    vbReturn : Boolean;
    spFecha  : TStoredProc;
begin
//  if DataBase = '' then
//    error(0);

  spFecha := TStoredProc.Create(Nil);
  try
  spFecha.DataBaseName := DataBaseName;
  spFecha.SessionName := SessionName;
  spFecha.StoredProcName := 'SPE_FECHA';
  spFecha.Params.CreateParam( ftInteger,'P_METODO', ptinput);
  spFecha.Params.CreateParam( ftFloat,'P_IDEMPRESA',ptInputOutput );
  spFecha.Params.CreateParam( ftDate,'P_FECHA',ptInputOutput);
  spFecha.Params.CreateParam( ftString,'P_CVELIQ', ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'P_NUMFECHASCALCULAR',ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'P_DIASCALCULADOS',ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'PS_RESP',ptOutput);
  spFecha.Prepare;
  //
  spFecha.ParamByName('p_metodo').Asinteger := 3;
  spFecha.ParamByName('p_IdEmpresa').AsFloat := FIdEmpresa;
  spFecha.ParamByName('p_Fecha').AsDate := FFechaReferencia;
  if NumDia <> 0 then
    spFecha.ParamByName('p_NumFechasCalcular').AsInteger := NumDia
  else
    spFecha.ParamByName('p_NumFechasCalcular').Clear;
  spFecha.ExecProc;
  viResp := spFecha.ParamByName('ps_Resp').AsInteger;
  if viResp = 0 then
    vbReturn := TRUE
  else begin
    Error(viResp);
    vbReturn := FALSE;
  end;
  spFecha.UnPrepare;
  spFecha.Close;
  GeneraFechas := vbReturn;
  finally
    spFecha.Free;
  end;
end;

function TFecha.GeneraFechasGlobal: Boolean;
var viResp : Integer;
    vbReturn : Boolean;
    spFecha  : TStoredProc;
begin
//  if DataBase = '' then
//    error(0);

  spFecha := TStoredProc.Create(Nil);
  try
  spFecha.DataBaseName := DataBaseName;
  spFecha.SessionName := SessionName;
  spFecha.StoredProcName := 'SPE_FECHA';
  spFecha.Params.CreateParam( ftInteger,'P_METODO', ptinput);
  spFecha.Params.CreateParam( ftFloat,'P_IDEMPRESA',ptInputOutput );
  spFecha.Params.CreateParam( ftDate,'P_FECHA',ptInputOutput);
  spFecha.Params.CreateParam( ftString,'P_CVELIQ', ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'P_NUMFECHASCALCULAR',ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'P_DIASCALCULADOS',ptInputOutput);
  spFecha.Params.CreateParam( ftInteger,'PS_RESP',ptOutput);
  spFecha.Prepare;
  //
  spFecha.ParamByName('p_metodo').Asinteger := 4;
  if FFechaReferencia <> 0 then
    spFecha.ParamByName('p_Fecha').AsDate := FFechaReferencia
  else
    spFecha.ParamByName('p_Fecha').Clear;
  spFecha.ExecProc;
  viResp := spFecha.ParamByName('ps_Resp').AsInteger;
  if viResp = 0 then
    vbReturn := TRUE
  else begin
    Error(viResp);
    vbReturn := FALSE;
  end;
  spFecha.UnPrepare;
  spFecha.Close;
  GeneraFechasGlobal := vbReturn;
  finally
    spFecha.Free;
  end;
end;

function TFecha.GetIdEmpresa: double;
begin
  GetIdEmpresa := FIdEmpresa;
end;

Procedure TFecha.SetIdEmpresa( Value : double);
begin
  if FIdEmpresa <> Value then
    FIdEmpresa := Value;
end;

function TFecha.GetCvePais: string;
begin
  GetCvePais := FCvePais;
end;

Procedure TFecha.SetCvePais( Value : string);
begin
  if FCvePais <> Value then
    FCvePais := Value;
end;

function TFecha.GetFechaReferencia: TDateTime;
begin
  GetFechaReferencia := FFechaReferencia;
end;

Procedure TFecha.SetFechaReferencia( Value : TDateTime);
begin
  if FFechaReferencia <> Value then
    FFechaReferencia := Value;
end;

function TFecha.GetNumFechasCalcular: Integer;
begin
  GetNumFechasCalcular := FNumFechasCalcular;
end;

Procedure TFecha.SetNumFechasCalcular( Value : Integer);
begin
  if FNumFechasCalcular <> Value then
    FNumFechasCalcular := Value;
end;

end.

