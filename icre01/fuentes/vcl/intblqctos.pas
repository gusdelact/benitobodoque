unit IntBlqCtos;

interface

uses InterApl, UnSQL2,Sysutils;

const coCRLF = #13#10;

function  ObtenSQLAplicaFiltroCto( peApli : TInterApli; peCVE_FUNCION, peNOM_PARAMETRO : String;
                                   peB_COLOC_AND : Boolean ) : String;

function  ObtenSQLAplicaFiltroCred( peApli : TInterApli; peCVE_FUNCION, peNOM_PARAMETRO : String;
                                    peB_COLOC_AND : Boolean ) : String;


implementation

function  ObtenSQLAplicaFiltroCto( peApli : TInterApli; peCVE_FUNCION, peNOM_PARAMETRO : String;
                                   peB_COLOC_AND : Boolean ) : String;
var vlSQL, vlSQLAnd : String;
    vlTotal : Integer;
begin
    vlSQL := ''; vlSQLAnd := '';
    // Si Aplica AND entonces...
    If (peB_COLOC_AND) Then
      vlSQLAnd := ' AND ';
    // Busca si la función de "Permisos Contrato" aplica para el usuario
    If  GetSQLInt(' SELECT COUNT(*) AS TOTAL FROM SECU_OPER_ACC '+ coCRLF +
                  ' WHERE CVE_FUNCION  = '+SQLStr(peCVE_FUNCION)+ coCRLF +
                  '   AND CVE_USUARIO  = '+SQLStr(peApli.Usuario)+ coCRLF +
                  '   AND CVE_OPER_ACC = '+SQLStr('BL') + ' -- Permisos para ver Contratos '+ coCRLF,
                  peApli.DatabaseName, peApli.SessionName, 'TOTAL', vlTotal, True) Then
        // Válida si la función de "Permisos Contrato" aplica...
        If (vlTotal > 0) Then
           // Obtiene el filtro
//   AUDITORIA OCTUBRE 2007
//           vlSQL := peNOM_PARAMETRO + ' IN  (SELECT ID_CONTRATO FROM EXCEPCION_CTE WHERE CVE_TIP_EXCEP = ''BLQBNC'' AND SIT_EXCEPCION = ''AC'') '+vlSQLAnd+' -- < SATV4766 04/09/2006 SEG. PARA VER CONTRATOS CREDITO >'+coCRLF;
           vlSQL := peNOM_PARAMETRO + ' NOT IN  (SELECT ID_CONTRATO FROM EXCEPCION_CTE WHERE CVE_TIP_EXCEP = ''BLQBNC'' AND SIT_EXCEPCION = ''AC'''
                                    + ' UNION ALL '
                                    + ' SELECT ID_CONTRATO FROM CRE_CONTRATO WHERE CVE_SUB_TIP_BCO IN (50) '
                                    + ' UNION ALL '
                                    + ' SELECT ID_CONTRATO FROM CR_CONTRATO WHERE CVE_PRODUCTO_CRE IN (''001PPI'',''002PPI'')'
                                    + ') '+vlSQLAnd+coCRLF;
//   FIN AUDITORIA OCTUBRE 2007
    Result := vlSQL;
end;


function  ObtenSQLAplicaFiltroCred( peApli : TInterApli; peCVE_FUNCION, peNOM_PARAMETRO : String;
                                    peB_COLOC_AND : Boolean ) : String;
var vlSQL, vlSQLAnd : String;
    vlTotal : Integer;
begin
    vlSQL := ''; vlSQLAnd := '';
    // Si Aplica AND entonces...
    If (peB_COLOC_AND) Then
      vlSQLAnd := ' AND ';
    // Busca si la función de "Permisos Contrato" aplica para el usuario
    If  GetSQLInt(' SELECT COUNT(*) AS TOTAL FROM SECU_OPER_ACC '+ coCRLF +
                  ' WHERE CVE_FUNCION  = '+SQLStr(peCVE_FUNCION)+ coCRLF +
                  '   AND CVE_USUARIO  = '+SQLStr(peApli.Usuario)+ coCRLF +
                  '   AND CVE_OPER_ACC = '+SQLStr('BL') + ' -- Permisos para ver Contratos '+ coCRLF,
                  peApli.DatabaseName, peApli.SessionName, 'TOTAL', vlTotal, True) Then
        // Válida si la función de "Permisos Contrato" aplica...
        If (vlTotal > 0) Then
           // Obtiene el filtro
//   AUDITORIA OCTUBRE 2008
           vlSQL := peNOM_PARAMETRO + ' IN  (SELECT ID_REFERENCIA FROM CR_CTRL_CT_EXCE WHERE ID_EMPRESA = ' + IntToStr(peApli.IdEmpresa) + ' AND CVE_TIP_EXCEP = ''BLQBNC'' AND SIT_EXCEPCION = ''AC'''
                                    + ') '+vlSQLAnd+coCRLF;
//   FIN AUDITORIA OCTUBRE 2007
    Result := vlSQL;


end;



end.
