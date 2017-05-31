unit UnConLim;

interface
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
DB, DbTables, StdCtrls, ExtCtrls, InterApl, UnSQL2, IntFrm, UnGene;

//type
// const
CONST
 cActivo    = 'AC';
 cCancelado = 'CA';
 cInactivo  = 'IN';
 cAutorizado= 'AU';
 cPorAut    = 'PA';
 cTxtAC     = 'ACTIVO';
 cTxtIN     = 'INACTIVO';
 cTxtCA     = 'CANCELADO';
 cVAR       = 'VAR'; //SACC 03062005 VALOR EN RIESGO
 cNBPUESTO1 = 'NPUESTO1';  //sacc
 cNBPUESTO2 = 'NPUESTO2';    //sacc
 cNBPUESTO3 = 'NPUESTO3';    //sacc
 cPUESTO1   = 'PUESTO1';    //sacc
 cPUESTO2   = 'PUESTO2';    //sacc
 cPUESTO3   = 'PUESTO3';    //sacc
//var

//function
function ObtUsrActivo(peUsuario:string; peApli: TInterApli): boolean;
function UnidCambUsu(pApli:TInterApli): Integer; //SACC
//procedure

implementation
function ObtUsrActivo(peUsuario:string; peApli: TInterApli): boolean;
var vlsql: string;
    vlquery: tquery;
begin
 Result:=false; //NO EXISTE USUARIO ACTIVO
 vlsql:='SELECT * FROM LIM_CTRL_AUTORIZA WHERE CVE_USUARIO='''+peUsuario+''' AND SIT_AUT_USR=''AC''';
 vlquery:=GetSQLQuery(vlsql, peApli.DataBaseName,peApli.SessionName,True);
 if ( vlquery <> nil ) then
  Result:=true; // EXISTE EL USUSARIO
end;


function UnidCambUsu(pApli:TInterApli): Integer;
Var qConsulta : TQuery;
    vlSQL     : String;
begin //Si el usuario tiene una excepción, se salta la validación
      vlSQL:='SELECT UNI.ID_MESA_CAMBIO ' +
             '  FROM DI_UNIDAD_CAMBIO UNI, DI_MESA_CAMBIO MES ' +
             ' WHERE UNI.ID_MESA_CAMBIO = MES.ID_MESA_CAMBIO AND ' +
             '       UNI.CVE_USUARIO    = ''' +  pApli.Usuario +  ''' AND ' +
             '       MES.ID_EMPRESA     =   ' +  IntToStr(pApli.IdEmpresa);
      qConsulta := tQuery.Create(Nil);
      try qConsulta.Databasename:=pApli.DataBaseName;
          qConsulta.SessionName:=pApli.SessionName;
          qConsulta.SQL.Text:=vlSQL;
          qConsulta.Open;
          if qConsulta.IsEmpty
          then UnidCambUsu:=-1
          else UnidCambUsu:=qConsulta.FieldByName('ID_MESA_CAMBIO').AsInteger;
          qConsulta.Close;
      finally qConsulta.free;
      end;
end;


//function
//procedure

end.
