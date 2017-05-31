unit UnConDiAme;

//------------------------------------------------------------------------------
//* Sistema     : Sistema de Divisas
//* Descripción : Constantes y funciones comunes para Travelers
//* Fecha       : Marzo 2008
//* Desarrollo  : Alicia Maya
//------------------------------------------------------------------------------
interface
Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterApl, UnSQL2, Printers,
  IntFrm, IntMesaBloq, UnGene, IniFiles, IntUsuario, UnQrComDiv, UnQrComDiv2,
  NMsmtp,UnFunGenCaja,IntUsuvent,IntBilletes;

function ObtenFolio(pGpo, pCve:String; pApli:TInterApli; BANDERA:BOOLEAN):Integer;
function GeneraFolio(pGpo, pCve:String; pApli:TInterApli; BANDERA:BOOLEAN):Integer;
function RevisaSumaDet(pIdMesa, pDot,pOrden, pCve, pProd:String; pApli:TInterApli):Real;

implementation


function ObtenFolio(pGpo, pCve:String; pApli:TInterApli; BANDERA:BOOLEAN):Integer;
var iFolio:Integer;
begin
  GetSQLInt(' select (ds_parametro+1) folio from di_param_ame '+
            ' where cve_gpo_param='''+pGpo+''' and cve_parametro ='''+pCve+''' ',
             pApli.DataBaseName, pApli.SessionName, 'folio', iFolio, False);
  IF BANDERA THEN
    iFolio:=1;
  ObtenFolio:=iFolio;
end;

function GeneraFolio(pGpo, pCve:String; pApli:TInterApli; BANDERA:BOOLEAN):Integer;
var iFolio:Integer;
begin
  GetSQLInt(' select (ds_parametro+1) folio from di_param_ame '+
            ' where cve_gpo_param='''+pGpo+''' and cve_parametro ='''+pCve+''' ',
             pApli.DataBaseName, pApli.SessionName, 'folio', iFolio, False);
  RunSQL(' UPDATE DI_PARAM_AME SET ds_parametro='+IntToStr(iFolio) +
         ' where cve_gpo_param='''+pGpo+''' and cve_parametro ='''+pCve+''' ',
          pApli.DataBaseName, pApli.SessionName, True);
  IF BANDERA THEN
  BEGIN
    RunSQL(' UPDATE DI_PARAM_AME SET ds_parametro= 1 ' +
           ' where cve_gpo_param='''+pGpo+''' and cve_parametro ='''+pCve+''' ',
            pApli.DataBaseName, pApli.SessionName, True);
    iFolio:=1;
  END;
  GeneraFolio:=iFolio;
end;

function RevisaSumaDet(pIdMesa, pDot, pOrden, pCve, pProd:String; pApli:TInterApli):Real;
var iResult:Real; sSQL:String;
begin
  if pOrden <> '' 
  then sSQL:=' AND d.id_orden = '+pOrden 
  else sSQL:='';
  GetSQLFloat(
    ' SELECT SUM(d.imp_cantidad) suma '+
    ' FROM DI_DET_ORD_TC d, DI_PROD_AME p '+
    ' WHERE d.id_mesa_cambio= '+pIdMesa +
    ' AND id_dotacion='+pDot+ sSQL +
    ' AND p.ID_mesa_cambio=d.id_mesa_cambio '+
    ' AND p.cve_prod_ame=d.cve_prod_ame '+
    ' AND p.CVE_TIPO='''+ pCve +''' '+
    ' AND d.cve_prod_ame<>'''+pProd+''' '+
    ' AND p.cve_prod_ame=d.cve_prod_ame ',
  pApli.DataBaseName, pApli.SessionName, 'suma', iResult, False);
  RevisaSumaDet:=iResult;
end;
  
end.

