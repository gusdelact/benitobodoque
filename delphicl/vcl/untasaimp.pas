// Sistema         : Clase VCL
// Fecha de Inicio : 11/12/2009
// Función forma   : Obtener tasa IVA ISR
// Desarrollo por  : Carlos A Pinacho M
unit UnTasaImp;


interface
uses
  InterApl, DBTables, Controls, Sysutils, DB;

const
  cStpFIVA = 'PKGIMPUESTO1.STPOBTFIVA';
  cStpIVA  = 'PKGIMPUESTO1.STPOBTIVA';
  cStpFISR = 'PKGIMPUESTO1.STPOBTFISR';
  cStpISR  = 'PKGIMPUESTO1.STPOBTISR';

Type
  TImpuesto = (imEmp, imFmt);
  TFormato = (fmtDec, fmtEnt);
  function fGetIva() : String;
  function fDameIVA( aFecha : TDate ; aFormato : TFormato ; aApli : TInterApli ) : String;  overload;
  function fDameIVA( aApli : TInterApli ) : String;  overload;
  function fDameISR( aFecha : TDate ; aFormato : TFormato ; aApli : TInterApli ) : String;  overload;
  function fDameISR( aApli : TInterApli ) : String;  overload;
var
  vStoreP : String;
  vTipoImpuesto : TImpuesto;
  fstpImpuesto : TStoredProc;
  vTipoFormato, vIdEmpresa : Integer;
  vDataBaseName, vSessionName, vStoredProcName : String;
  vFecha : TDate;

implementation

function fDameIVA(aFecha : TDate ; aFormato : TFormato ; aApli : TInterApli ) : String;
begin
  if aApli <> nil then
  begin
    vStoredProcName := cStpFIVA; //
    vTipoImpuesto   := imFmt;    //
    vFecha := aFecha;            //
    vDataBaseName := aApli.DataBaseName;
    vSessionName  := aApli.SessionName;
    case aFormato of
     fmtDec  : vTipoFormato := 0 ;
     fmtEnt  : vTipoFormato := 1 ;
    end;
    Result := fGetIva;
  end
  else
  Result := '0';
end;
{******************************************************************************************************
*******************************************************************************************************}
function fDameISR( aFecha : TDate ; aFormato : TFormato ; aApli : TInterApli ) : String;  overload;
begin
  if aApli <> nil then
  begin
    vStoredProcName := cStpFISR; //
    vTipoImpuesto   := imFmt;    //
    vFecha := aFecha;            //
    vDataBaseName := aApli.DataBaseName;
    vSessionName  := aApli.SessionName;
    case aFormato of
     fmtDec  : vTipoFormato := 0 ;
     fmtEnt  : vTipoFormato := 1 ;
    end;
    Result := fGetIva;
  end
  else
  Result := '0';
end;
{******************************************************************************************************
*******************************************************************************************************}
function fDameIVA( aApli : TInterApli ) : String;  overload;
begin
  if aApli <> nil then
  begin
    vStoredProcName := cStpIVA; //
    vTipoImpuesto   := imEmp;   //
    vIdEmpresa := aApli.IdEmpresa;
    vDataBaseName := aApli.DataBaseName;
    vSessionName  := aApli.SessionName;
    Result := fGetIva;
  end
  else
  Result := '0';
end;
{******************************************************************************************************
*******************************************************************************************************}
function fDameISR( aApli : TInterApli ) : String;  overload;
begin
  if aApli <> nil then
  begin
    vStoredProcName := cStpISR; //
    vTipoImpuesto   := imEmp;   //
    vIdEmpresa := aApli.IdEmpresa;
    vDataBaseName := aApli.DataBaseName;
    vSessionName  := aApli.SessionName;
    Result := fGetIva;
  end
  else
  Result := '0';
end;
{******************************************************************************************************
*******************************************************************************************************}
function fGetIva() : String;
begin
  fstpImpuesto := TStoredProc.Create(nil);
  fstpImpuesto.DatabaseName := vDataBaseName;
  fstpImpuesto.SessionName  := vSessionName;
  fstpImpuesto.StoredProcName := vStoredProcName;
  fstpImpuesto.Params.CreateParam(ftFloat, 'Result',ptResult);
  case vTipoImpuesto of
   imFmt : begin
              fstpImpuesto.Params.CreateParam(ftDate, 'peFecha',ptInput);
              fstpImpuesto.Params.CreateParam(ftInteger, 'peCveTipoFmto',ptInput);
              fstpImpuesto.ParamByName('peFecha').Value       := FormatDateTime('DD/MM/YYYY',vFecha);
              fstpImpuesto.ParamByName('peCveTipoFmto').Value := vTipoFormato;
           end;
   imEmp : begin
              fstpImpuesto.Params.CreateParam(ftInteger, 'peEmpresa',ptInput);
              fstpImpuesto.ParamByName('peEmpresa').Value  := vIdEmpresa;
           end;
  end;
  try
    fstpImpuesto.ExecProc;
    Result := fstpImpuesto.ParamByName('Result').AsString;
  finally
    fstpImpuesto.Free;
  end;
end;
{******************************************************************************************************
*******************************************************************************************************}
end.
