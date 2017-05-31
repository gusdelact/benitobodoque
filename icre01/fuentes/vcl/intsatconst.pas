unit IntSatConst;

interface           

uses SysUtils, Db, DbTables, UnSQL2, InterApl, Dialogs, Controls,

IntGenCre // Unidad Común
;                     

{ Esta función regresa la Sentencia SQL que otiene las constancias del SAT ya procesadas }
function ArmaQryConstanciaSAT( peEmpresa, peRepresentante, peEjercicio, peID_CREDITO_INI, peID_CREDITO_FIN : Integer) : String;

{ En teoría esta función debería de ser un procedimiento, pero débido a que está clase es para INTERCREDITOS,
  entonces... }
function ExecuteQuery(strSQL : String; peB_COMMIT : Boolean; peApli : TInterApli) : Boolean;

{ Actualiza la Bandera de Impresión por Constancia, siempre y cuando el usuario este de acuerdo con la impresión
  realizada }
function CambiaBanderaImprConst(peEJERCICIO, peID_EMPRESA, peID_CREDITO_INI, peID_CREDITO_FIN,
                                peNUM_COPIAS : Integer; peB_CONFIRMA : Boolean; peApli : TInterApli) : Boolean;
implementation

function ArmaQryConstanciaSAT( peEmpresa, peRepresentante, peEjercicio, peID_CREDITO_INI, peID_CREDITO_FIN : Integer) : String;
var vlSQL, vlStrFiltroCredito : String;
begin
  If (peID_CREDITO_INI > 0) And (peID_CREDITO_FIN > 0) Then
     vlStrFiltroCredito := '   AND CC.ID_CREDITO BETWEEN '+IntToStr(peID_CREDITO_INI)+' AND '+IntToSTr(peID_CREDITO_FIN)+coCRLF

  Else If (peID_CREDITO_INI > 0)  Then
     vlStrFiltroCredito := '   AND CC.ID_CREDITO = '+IntToStr(peID_CREDITO_INI)+coCRLF

  Else
     vlStrFiltroCredito := '';

  vlSQL :=
        ' SELECT '+coCRLF+
        '        SCL.ID_EMPRESA,        '+coCRLF+
        '        SCL.EJERCICIO,         '+coCRLF+
        '        SCL.ID_CONTRATO,       '+coCRLF+
        '        SCL.ID_CREDITO,        '+coCRLF+
        '        SCL.SDO_PROMEDIO,      '+coCRLF+
        '        SCL.TIPO_REGISTRO,     '+coCRLF+
        '        SCL.CONSECUTIVO,       '+coCRLF+
        '        SCL.CVE_IDENTIFICADOR, '+coCRLF+
        '        SCL.RFC_CURP,          '+coCRLF+
        '        SCL.NOMBRE_TIT,        '+coCRLF+
        '        SCL.DOMICILIO,         '+coCRLF+
        '        SCL.NUM_REFERENCIA,    '+coCRLF+
        '        SCL.NUM_REG_FIDE,      '+coCRLF+
        '        SCL.CVE_DEST_CREDITO,  '+coCRLF+
//        '        SCL.IMP_INT_NOM_DEV,   '+coCRLF+
        '        (SCL.IMP_INT_NOM_DEV  + SCL.IMP_INT_MOR_DEV) AS IMP_INT_NOM_DEV,   '+coCRLF+  //HERJA MARZO2012 PARA QUE TOME EN CUENTA MORATORIOS
        '        SCL.IMP_INT_REAL,      '+coCRLF+
        '        (SCL.IMP_INT_PAG_ORD  + SCL.IMP_INT_MOR_PAG)  AS IMP_INT_PAGADOS,'+coCRLF+
        '        SCL.IMP_INT_PAG_ORD,   '+coCRLF+
        '        SCL.IMP_INT_MOR_DEV,   '+coCRLF+
        '        SCL.IMP_INT_MOR_PAG,   '+coCRLF+
        '        SCL.SDO_CIE_ANIO_ANT,  '+coCRLF+
        '        SCL.SDO_FEC_CONTR,     '+coCRLF+
        '        SCL.F_CONTRATACION,    '+coCRLF+
//        '        NVL(SCL1.PROP_DEDUCIBLE, 100) AS PROP_DEDUCIBLE,'+coCRLF+    easa 12.FEB.2010
        '        NVL(SCL.PROP_DEDUCIBLE, 100) AS PROP_DEDUCIBLE,'+coCRLF+                      
        '        SCL.PCT_COP_SOC_CONY,  '+coCRLF+
        '        SCL.NUM_COPROPIET,     '+coCRLF+
        '        SCL.RFC_CURP_COPRO,    '+coCRLF+
        '        SCL.NOMBRE_COPRO,      '+coCRLF+
        '        SCL.RFC_CURP_CONYU,    '+coCRLF+
        '        SCL.NOMBRE_CONYU,      '+coCRLF+
        '        SCL.DOMICILIO_INMU,    '+coCRLF+
        '        SCL.NUM_IMPRESION,     '+coCRLF+
        '        SCL.PCT_PARTICIPACION, '+coCRLF+
        '        SCL.F_IMPRESION,       '+coCRLF+
        '        GREATEST( SCL.SDO_CIE_ANIO_ANT, SCL.SDO_FEC_CONTR ) SALDO_INICIAL,'+coCRLF+
        '        NOMEMP.NOMBRE EMPRESA,'+coCRLF+
        '        RFCEMP.SIGLAS_RFC   || RFCEMP.F_RFC   || RFCEMP.HOMOCLAVE_RFC  RFC_EMPRE,'+coCRLF+
        '        DOMEMP.CALLE_NUMERO || '' '' || DOMEMP.COLONIA || '' '' ||  DOMEMP.CODIGO_POSTAL DOM_EMPRE,'+coCRLF+
        '        DECODE( P.CVE_PER_JURIDICA , ''PF'','+coCRLF+
        '                  NOMREPF.APELLIDO_PATERNO || '' '' || NOMREPF.APELLIDO_MATERNO || '' '' || NOMREPF.NOMBRE_PERSONA,'+coCRLF+
        '                  NOMREPM.NOM_RAZON_SOCIAL ) AS REPRESENTANTE,'+coCRLF+
        '        RFCREP.SIGLAS_RFC   || RFCREP.F_RFC   || RFCREP.HOMOCLAVE_RFC  RFC_REP,'+coCRLF+
        '        -- INICIO MODIFICA PARA CONSTANCIA2  SATV4766 26/01/2005'+coCRLF+
        '        CC.F_AUT_OPERACION,'+coCRLF+
        '        CC.F_LIQ_BNC,'+coCRLF+
        '          TO_NUMBER(TO_CHAR(F_AUT_OPERACION,''MM'')) AS MES_F_AUT_OPE,'+coCRLF+
        '          TO_NUMBER(TO_CHAR(F_LIQ_BNC,''MM''))       AS MES_F_LIQ_BNC,'+coCRLF+
        '          TO_DATE(''01/01/''||SCL.EJERCICIO,''DD/MM/YYYY'') AS F_INI_EJER,'+coCRLF+
        '          TO_DATE(''31/12/''||SCL.EJERCICIO,''DD/MM/YYYY'') AS F_FIN_EJER'+coCRLF+
        '        -- FIN MODIFICA PARA CONSTANCIA2  SATV4766 26/01/2005'+coCRLF+
        ' FROM   ('+coCRLF+
        '            SELECT CC.ID_CREDITO, CC.ID_CONTRATO, CC.F_AUT_OPERACION, CC.F_LIQ_BNC'+coCRLF+
        '            FROM CRE_CREDITO CC'+coCRLF+
        '            WHERE CC.SIT_CREDITO NOT IN (''CA'',''TA'')'+coCRLF+
        '               '+vlStrFiltroCredito+coCRLF+
        '         UNION ALL'+coCRLF+ 
        '            SELECT CC.ID_CREDITO, CC.ID_CONTRATO, CC.F_INICIO AS F_AUT_OPERACION, CC.F_LIQUIDACION AS F_LIQ_BNC'+coCRLF+
        '            FROM CR_CREDITO CC'+coCRLF+
        '            WHERE CC.SIT_CREDITO <> ''CA'''+coCRLF+
        '               '+vlStrFiltroCredito+coCRLF+
        '         ) CC,'+coCRLF+
        '        SAT_CRE_LAYOUT SCL,'+coCRLF+
{   easa 12.FEB.2010
        '        ( SELECT ID_CREDITO, PROP_DEDUCIBLE'+coCRLF+
        '          FROM SAT_CRE_LAYOUT@DCORP'+coCRLF+
        '          WHERE ID_EMPRESA = '+IntToStr(peEmpresa)+coCRLF+
        '            AND EJERCICIO = '+IntToStr(peEjercicio)+coCRLF+
        '        ) SCL1,'+coCRLF+
        }
        '        EMPRESA   EMPRE,'+coCRLF+
        '        PERSONA   NOMEMP,'+coCRLF+
        '        DOMICILIO DOMEMP,'+coCRLF+
        '        RFC       RFCEMP,'+coCRLF+
        '        PERSONA   P,'+coCRLF+
        '        PERSONA_FISICA NOMREPF,'+coCRLF+
        '        PERSONA_MORAL  NOMREPM,'+coCRLF+
        '        RFC       RFCREP'+coCRLF+
        ' WHERE  1 = 1 '+coCRLF;

    If (peEmpresa > 0) Then
        vlSQL := vlSQL + '   AND  SCL.ID_EMPRESA = '+IntToStr(peEmpresa)+coCRLF;

    If (peEjercicio > 0) Then
        vlSQL := vlSQL + '   AND  SCL.EJERCICIO  = '+IntToStr(peEjercicio)+coCRLF;

    If (peID_CREDITO_INI > 0) And (peID_CREDITO_FIN > 0) Then
       vlSQL := vlSQL + '   AND SCL.ID_CREDITO BETWEEN '+IntToStr(peID_CREDITO_INI)+' AND '+IntToSTr(peID_CREDITO_FIN)+coCRLF
    Else If (peID_CREDITO_INI > 0)  Then
             vlSQL := vlSQL + '   AND SCL.ID_CREDITO = '+IntToStr(peID_CREDITO_INI)+coCRLF;

    vlSQL := vlSQL +
        '   AND  EMPRE.ID_EMPRESA    = SCL.ID_EMPRESA'+coCRLF+
        '   AND  NOMEMP.ID_PERSONA   = EMPRE.ID_EMPRESA'+coCRLF+
        '   AND  DOMEMP.ID_DOMICILIO = NOMEMP.ID_DOMICILIO'+coCRLF+
        '   AND  RFCEMP.ID_PERSONA   = NOMEMP.ID_PERSONA'+coCRLF+
        '   AND  P.ID_PERSONA   = '+IntToStr(peRepresentante)+coCRLF+
        '   AND  RFCREP.ID_PERSONA   = P.ID_PERSONA'+coCRLF+
        '   AND  NOMREPF.ID_PERSONA (+)= P.ID_PERSONA'+coCRLF+
        '   AND  NOMREPM.ID_PERSONA (+)= P.ID_PERSONA'+coCRLF+
        '   AND  CC.ID_CREDITO = SCL.ID_CREDITO'+coCRLF+
        '   AND  SCL.B_REPORTA_SAT = ''V'' '+coCRLF+
//        '   AND  SCL1.ID_CREDITO (+)= SCL.ID_CREDITO'+coCRLF+
//        '   AND SCL.ID_CREDITO NOT IN (44978,47589,45398,48022,45522,45557,46360,265005,261950,16548,6485,5013,4998,5002,5188,5048,4973,5064,5186,5056,5052,4990,4991,5134,47601) ' + // EASA 12.FEB.2010
        '   ORDER BY SCL.ID_CREDITO '+coCRLF
        ;
    Result := vlSQL;
end;

function ExecuteQuery(strSQL : String; peB_COMMIT : Boolean; peApli : TInterApli) : Boolean;
var Qry : TQuery;
begin
  Result := False;
  Qry := TQuery.Create(Nil);
  If Assigned(Qry) Then
   With (Qry) Do
    Try
     DatabaseName := peApli.DataBaseName;
     SessionName  := peApli.SessionName;
     // Ejecuta el Query
     SQL.Clear; SQL.Add(strSQL);  ExecSQL;
     // Genera el COMMIT
     If peB_COMMIT Then
      SQL.Clear; SQL.Add('COMMIT');  ExecSQL;
     Result := True;
    Finally
     Close;
     Free;
    End;           
end;
                                        
function CambiaBanderaImprConst(peEJERCICIO, peID_EMPRESA, peID_CREDITO_INI, peID_CREDITO_FIN, 
                                peNUM_COPIAS : Integer; peB_CONFIRMA : Boolean; peApli : TInterApli) : Boolean;
var vlstrSQL : String;
    vlB_CONTINUA : Boolean;
begin
 Result := False;
 If peB_CONFIRMA Then
  vlB_CONTINUA := MessageDlg('¿La(s) constancia(s) se imprimieron correctamente?',
                             mtConfirmation, [mbYes, mbNo],0) = mrYes
 Else
  vlB_CONTINUA := True;

 // Si procede entonces...
 If vlB_CONTINUA Then
  Begin
   // Actualiza la Fecha de Impresión y el número de Impresiones del Registro de Constancia
   vlstrSQL := ' UPDATE SAT_CRE_LAYOUT'+coCRLF+
               ' SET NUM_IMPRESION  = '+IntToStr(peNUM_COPIAS)+','+coCRLF+
               '     F_IMPRESION    = '+SQLFecha(peApli.DameFechaEmpresa)+coCRLF+
               ' WHERE ID_EMPRESA  = '+ IntToStr(peID_EMPRESA) +coCRLF+
               '   AND EJERCICIO   = '+ IntToStr(peEJERCICIO) +coCRLF+
               '   AND F_IMPRESION IS NULL '+coCRLF;
   If (peID_CREDITO_INI > 0) Then
    vlstrSQL := vlstrSQL + ' AND ID_CREDITO BETWEEN '+ IntToStr(peID_CREDITO_INI)+' AND '+IntToStr(peID_CREDITO_FIN);

   // Si hubo problemas al realizar la actualización, entonces...
   If Not ExecuteQuery(vlstrSQL, True, peApli) Then
    MessageDlg('Problemas al actualizar los registros de Constancia. Avise a Sistemas.',
                mtError, [mbOk],0)
   Else
    Result := True;
  End;
end;

end.
