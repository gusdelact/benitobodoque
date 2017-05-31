unit IntGenCre;

interface

uses
Windows,Messages, SysUtils, Classes,Graphics,Controls, Forms, Dialogs,
DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls,InterFor,IntFind,InterFun,
UnSQL2, ComCtrls, IntDtPk, IntParamCre,Aligrid, IntFrm,InterApl,
Clipbrd, Grids, IntSGCtrl, Psock, InterEdit, NMFtp,    ShellApi,  FileCtrl,  ZipTypes,
QRCtrls,   Unzip,    NMsmtp;//valida si contiene cartera impagada el acreditado


// Extraido de la parte de IntGenCre realizado por Victor
type TGenRepOption = ( grPreview, grPrint, grDigitaliza );  


const
   CNULL = '';
             
   CVERDAD = 'V';
   CFALSO  = 'F';
   CINICIO = 'I';
   CFINAL  = 'T';

   CSIT_AC   = 'AC'; // Situación Activa
   CSIT_PA   = 'PA'; // Situación Por Activar
   CSIT_CA   = 'CA'; // Situación Cancelada
   CSIT_IM   = 'IM'; // Situación Impagada
   CSIT_LQ   = 'LQ'; // Situación Liquidada
   //RABA JUN 2015 SE AGREGA SITUACION PARA INTERES REFINANCIADO = FA
   CSIT_FA   = 'FA'; // Situación Liquidada
   CSIT_VE   = 'VE'; // Situación Vencido
   CSIT_NA   = 'NA'; // Situación No Autorizado OR No Aplica
   CSIT_AU   = 'AU'; // Situación Autorizado
   CSIT_LI   = 'LI'; // Situación Liberados
   CSIT_TO   = 'TO'; // Situación Todos
   CSIT_ER   = 'ER'; // Situación Error Archivos Nafín
   CSIT_AP   = 'AP'; // Situación Aplicado Archivos Nafín
   CSIT_ID   = 'ID'; // Situación Identificado
   CSIT_NI   = 'NI'; // Situación No Identificado
   CSIT_CI   = 'CI'; // Situación Cancelado No Identificado
   CSIT_EN   = 'EN'; // Situación de Enviado para Emails
   CSIT_RE   = 'RE'; // Situación Rechazada
   CSIT_RA   = 'RA'; // Situación Reactivadas
   CSIT_NP   = 'NP'; // Situación NO PROCESADO
   C_TCOM_DA = 'DA'; //Disponible de la Autorización

   CLIQ_LP   = 'LP'; //Liquidación en Pesos
   CLIQ_LD   = 'LD'; //Liquidación en Dólares

   CPERFIL_ADMIN  = 'AD';
   CPERFIL_ASIST  = 'AS';
   CPERFIL_CONSU  = 'CO';

   CPER_MORAL = 'PM';
   CPER_FISICA = 'PF';

   C_STRZERO = '0.00';
   CFORMAT_DINERO = '%16.2n';
   CFORMAT_TASA = '%8.4n';
   CFORMAT_FECHA  = 'dd/mm/yyyy';

   CERROR_CLAVE = 'Falta CLAVE ver con Sistemas';
   CERROR_NOEXISTEN = 'No existen datos que Mostrar...';
   CCONFIRM_ALMACENA_INS = '¿Desea almacenar los datos capturados?';
   CCONFIRM_ALMACENA_MOD = '¿Desea guardar los datos modificados?';   

   CMES = 'MES';
   CANO = 'AÑO';

   CREMANENTE = 'RE';
   CINTERES   = 'IN';
   CCOMISION  = 'CN';
   CAMBOS     = 'AM';

   CIMPAGADO   = 'IM';
   CPROGRAMADO = 'MD';
   CANTICIPADO = 'AN';

   CEXCECRE = 'EXCECRED';
   CCRIDSEG = 'CRIDSEG';
   CCRGPSEG = 'CRGPSEG';

   CMETODO1 = '1';
   CMETODO2 = '2';
   CMETODO3 = '3';
   CMETODO4 = '4';

   C_REPRESENTANTE = 'RE';
   C_TESTIGO = 'TE';
   C_CVE_NOTIFICACION_CESIONES = 'NOTCES';
   C_CVE_NOTIFICACION_FACTELEC = 'NOTCFE'; // FJR 20.07.2012 NUEVA CATEGORIA DE FORMATO
   C_CVE_NOTIFICACION_VALIDACION = 'NOTVAL';

   C_CRE = 'CRE'; //CVE PARAMETRO PARA SEGUIMIENTO DE LA COBRANZA


   //CLAVES TASAS
   C_TASA_TIIE = 'TIIE';
   C_TASA_FIJA = 'FIJA';
   C_FIJA     = 'FI';
   C_VARIABLE = 'VA';

   C_ACRED = 'AC'; // Tipo Acreditado
   C_PROVE = 'PR'; // Proveedor
   C_PROCA = 'AP'; // ACREDITADO PROCAMPO
   C_ADMIN = 'AD'; // Administrativa
   C_LIQUI = 'LQ'; // Liquidada
   C_CHQIND = 'IN'; // Chequera indistinta

   C_CARGO = 'CR'; // Chequera de Cargo
   C_ABONO = 'AB'; // Chequera de Abono
   C_AMBOS = 'AM'; // Chequera de Ambos (Cargo y Abono)

   C_NR = 'NR'; //No revolvente

   MSG_PREGUNTA_ADVERTENCIA = '¿Desea reemplazar la información existente. ? ' +
                              ' !!! LA  INFORMACIÓN ACTUAL SE PERDERÁ. ¡¡¡¡¡ ';
   MSG_PREG_CONTINUA_PROCES = ' Desea continuar con el proceso?';
   MSG_PROCESO_CARGA_OK = 'Proceso de carga concluido';
   coCRLF      = #13#10;

   //TIPOS MOVIMIENTOS
   C_SPEUA = 'SP';
   C_TEF   = 'TF';
   C_LINBAN= 'LB';
   C_CHEQ  = 'CH';
   C_TRASP = 'TP';
   C_MANUAL= 'LM';

   C_SEPARATOR_MAIL = ';';

   //CLAVES DE DIAS DE LIQUIDACIÓN
   C_FMAN = 'FMAN';

   //MONEDAS
   C_DLLS = 840;

   //
   C_GPOMOTIVO = 'ALTORD';
   C_MOTIVO = 'REDISP';

   // INICIO Nuevas constantes Agropecuario SATV4766}
   C_MENOR    = 'MN';
   C_MAYOR    = 'MY';
   C_PROMEDIO = 'PR';
   C_INICIAL  = 'IN';
   C_FINAL    = 'FN';

   C_SUMAR       = '+';
   C_RESTAR      = '-';
   C_MULTPLICAR  = '*';
   C_DIVIDIR     = '/';

   C_DIA         = 'DD';
   C_SEMANA      = 'WK';
   C_MES         = 'MM';

   C_PUBLICADAS  = 'PU';
   C_VIGENTES    = 'VI';
   C_PUBLICADAS_Y_VIGENTES = 'PV';

   CSIT_IN = 'IN';
   C_EQUIV = 'EQ';
   // FIN Nuevas constantes Agropecuario SATV4766

   {
      C_QUERY_CTAS_VEN =
            '(SELECT CP.CVE_PRODUCTO_CRE,' +
            '        CUENTA_VENCIDA_INT,' +
            '        CUENTA_VEN_KAP_EX,' +
            '        CUENTA_VEN_KAP_NO_EX' +coCRLF +
            ' FROM (SELECT * FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTSICA'')) CP,' +coCRLF +
            '      ( SELECT ''IN'' AS CVE_CONCEPTO,' +
            '        CP.CVE_PRODUCTO_CRE,' +
            '        GC.*,' +
            '        GC.CUENTA_CONTABLE,' +
            '        SUBSTR(GC.CUENTA_CONTABLE,1,4) || ''-'' ||' +
            '        SUBSTR(GC.CUENTA_CONTABLE,5,4) || ''-'' ||' +
            '        SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VENCIDA_INT' + coCRLF +
            '        FROM (SELECT * FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTSICA'')) CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC' + coCRLF + //GUIA_CONTABLE@SICA GC' + coCRLF + CAMBIO POR BAJA DE BASE SICA JFOF 08/2012
            '        WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE' +
            '        AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO' +
            '        AND GC.EMPRESA = ''BCO2''' +
            '        AND GC.CODIGO_TRANSACCION IN (304720)' +
            '        AND GC.CLAVE_MONEDA = ''PESOS''' +
            '        AND GC.CAMPO_IMPORTE = ''03''' +
            '        AND (GC.CUENTA_CONTABLE LIKE ''13%'')' +
            '        AND GC.CARGO_ABONO = ''D''' +
            '       ) CtaInt,' +coCRLF +
            '       (SELECT ''KA'' AS CVE_CONCEPTO,' +
            '        CP.CVE_PRODUCTO_CRE,' +
            '        SUBSTR(GC.CUENTA_CONTABLE,1,4) || ''-'' ||' +
            '        SUBSTR(GC.CUENTA_CONTABLE,5,4) || ''-'' ||' +
            '        SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VEN_KAP_EX' + coCRLF +
            '        FROM (SELECT * FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTSICA'')) CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC' + coCRLF + //GUIA_CONTABLE@SICA GC' + coCRLF + CAMBIO POR BAJA DE BASE SICA JFOF 08/2012
            '        WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE' +
            '        AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO' +
            '        AND GC.EMPRESA = ''BCO2''' +
            '        AND GC.CODIGO_TRANSACCION IN (304720)' +
            '        AND GC.CLAVE_MONEDA = ''PESOS''' +
            '        AND GC.CAMPO_IMPORTE = ''02''' +
            '        AND (GC.CUENTA_CONTABLE LIKE ''13%'')' +
            '        AND GC.CARGO_ABONO = ''D''' +
            '       ) CtaKapExigible,' + coCRLF +
            '       (SELECT ''KA'' AS CVE_CONCEPTO,' +
            '        CP.CVE_PRODUCTO_CRE,' +
            '        SUBSTR(GC.CUENTA_CONTABLE,1,4) || ''-'' ||' +
            '        SUBSTR(GC.CUENTA_CONTABLE,5,4) || ''-'' ||' +
            '        SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VEN_KAP_NO_EX' + coCRLF +
            '        FROM (SELECT * FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTSICA'')) CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC' + coCRLF + //GUIA_CONTABLE@SICA GC' + coCRLF + CAMBIO POR BAJA DE BASE SICA 08/2012
            '        WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE' +
            '        AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO' +
            '        AND GC.EMPRESA = ''BCO2''' +
            '        AND GC.CODIGO_TRANSACCION IN (304730)' +
            '        AND GC.CLAVE_MONEDA = ''PESOS''' +
            '        AND GC.CAMPO_IMPORTE = ''02''' +
            '        AND (GC.CUENTA_CONTABLE LIKE ''13%'')' +
            '        AND GC.CARGO_ABONO = ''D''' +
            '        ) CtaKapNoExig' + coCRLF +
            ' WHERE CtaInt.CVE_PRODUCTO_CRE (+)= CP.CVE_PRODUCTO_CRE' +
            ' AND CtaKapExigible.CVE_PRODUCTO_CRE (+)= CP.CVE_PRODUCTO_CRE' +
            ' AND CtaKapNoExig.CVE_PRODUCTO_CRE (+)= CP.CVE_PRODUCTO_CRE' +
            ' ) TABVENCTA, ' + coCRLF ;
         }
      C_QUERY_CTAS_VEN =
            '(SELECT '' '' AS CVE_PRODUCTO_CRE, '' '' AS CUENTA_VENCIDA_INT, '' '' AS CUENTA_VEN_KAP_EX, '' '' AS CUENTA_VEN_KAP_NO_EX FROM DUAL) TABVENCTA, ' + coCRLF ;

      C_QUERY_CTAS_VEN_ICRE =
            ' (SELECT PROD.ID_EMPRESA, PROD.CVE_PRODUCTO_CRE, PROD.CVE_MONEDA, SUBSTR(INVEEX.CVE_CTA_CONT,1,30) CVE_CTA_CONT_INVEEX, SUBSTR(CAVEEX.CVE_CTA_CONT,1,30) CVE_CTA_CONT_CAVEEX, SUBSTR(CAVENE.CVE_CTA_CONT,1,30) CVE_CTA_CONT_CAVENE' +
            ' FROM' +
            ' (SELECT CP.*, CRPM.CVE_MONEDA' +
            '  FROM CR_PRODUCTO CP,' +
            '      (SELECT CVE_MONEDA, CVE_PRODUCTO_CRE, COUNT(*) FROM CR_REL_PROD_MON CRPM GROUP BY CVE_MONEDA, CVE_PRODUCTO_CRE ORDER BY CVE_MONEDA, CVE_PRODUCTO_CRE) CRPM' +
            '  WHERE CP.CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTICRE'')' +
            '  AND   CRPM.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE) PROD,' +
            //vencida exigible    interés
            ' (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran' +
            '  WHERE CVE_OPER_CRED = ''INVEEX'' AND   CVE_COMISION = ''NA'' AND   CVE_CONCEPTO = ''IMPBRU'' AND   CVE_TIPO_MOVTO = ''MV'' AND   TIPO_AFECTACION = ''D'') INVEEX,' +
            //vencida exigible    capital
            ' (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran' +
            '  WHERE CVE_OPER_CRED = ''CAVEEX'' AND   CVE_COMISION = ''NA'' AND   CVE_CONCEPTO = ''IMPBRU'' AND   CVE_TIPO_MOVTO = ''MV'' AND   TIPO_AFECTACION = ''D'') CAVEEX,' +
            //vencida no exigible    capital
            ' (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran' +
            '  WHERE CVE_OPER_CRED = ''CAVENE'' AND   CVE_COMISION = ''NA'' AND   CVE_CONCEPTO = ''IMPBRU'' AND   CVE_TIPO_MOVTO = ''MV'' AND   TIPO_AFECTACION = ''D'') CAVENE' +
            ' WHERE INVEEX.ID_EMPRESA    (+)= PROD.ID_EMPRESA' +
            ' AND   INVEEX.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE' +
            ' AND   INVEEX.CVE_MONEDA    (+)= PROD.CVE_MONEDA' +
            ' AND   CAVEEX.ID_EMPRESA    (+)= PROD.ID_EMPRESA' +
            ' AND   CAVEEX.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE' +
            ' AND   CAVEEX.CVE_MONEDA    (+)= PROD.CVE_MONEDA' +
            ' AND   CAVENE.ID_EMPRESA    (+)= PROD.ID_EMPRESA' +
            ' AND   CAVENE.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE' +
            ' AND   CAVENE.CVE_MONEDA    (+)= PROD.CVE_MONEDA) TABVENCTAICRE, ';

      {
      C_QUERY_CTAS_IMP =
            ' (SELECT CP.CVE_PRODUCTO_CRE,' + coCRLF +
            '          CUENTA_IMPAGADO_INT,' + coCRLF +
            '          CUENTA_IMPAGADO_KAP' + coCRLF +
            ' FROM (SELECT * FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTSICA'')) CP,' + coCRLF +
            '      ( SELECT ''IN'' AS CVE_CONCEPTO,' + coCRLF +
            '        CP.CVE_PRODUCTO_CRE,' + coCRLF +
            '        gc.*,' + coCRLF +
            '        GC.CUENTA_CONTABLE,' + coCRLF +
            '        SUBSTR(GC.CUENTA_CONTABLE,1,4) || ''-'' ||' + coCRLF +
            '        SUBSTR(GC.CUENTA_CONTABLE,5,4) || ''-'' ||' + coCRLF +
            '        SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_IMPAGADO_INT' + coCRLF +
            '        FROM (SELECT * FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTSICA'')) CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC' + coCRLF + //GUIA_CONTABLE@SICA GC' + coCRLF + CAMBIO POR BAJA DE BASE SICA
            '        WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE' + coCRLF +
            '        AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO' + coCRLF +
            '        AND GC.EMPRESA = ''BCO2''' + coCRLF +
            '        AND GC.CODIGO_TRANSACCION IN (304710)' + coCRLF +
            '        AND GC.CLAVE_MONEDA = ''PESOS''' + coCRLF +
            '        AND GC.CAMPO_IMPORTE = ''11''' + coCRLF +
            '        AND (GC.CUENTA_CONTABLE LIKE ''13%'')' + coCRLF +
            '        AND GC.CARGO_ABONO = ''D''' + coCRLF +
            '      ) CtaInt,' + coCRLF +
            '      ( SELECT ''KA'' AS CVE_CONCEPTO,' + coCRLF +
            '        CP.CVE_PRODUCTO_CRE,' + coCRLF +
            '        SUBSTR(GC.CUENTA_CONTABLE,1,4) || ''-'' ||' + coCRLF +
            '        SUBSTR(GC.CUENTA_CONTABLE,5,4) || ''-'' ||' + coCRLF +
            '        SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_IMPAGADO_KAP' + coCRLF +
            '        FROM (SELECT * FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTSICA'')) CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC' + coCRLF + //GUIA_CONTABLE@SICA GC' + coCRLF + CAMBIO POR BAJA DE BASE SICA  JFOF 08/2012
            '        WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE' + coCRLF +
            '        AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO' + coCRLF +
            '        AND GC.EMPRESA = ''BCO2''' + coCRLF +
            '        AND GC.CODIGO_TRANSACCION IN (304710)' + coCRLF +
            '        AND GC.CLAVE_MONEDA = ''PESOS''' + coCRLF +
            '        AND GC.CAMPO_IMPORTE = ''10''' + coCRLF +
            '        AND (GC.CUENTA_CONTABLE LIKE ''13%'')' + coCRLF +
            '        AND GC.CARGO_ABONO = ''D''' + coCRLF +
            '       ) CtaKap' + coCRLF +
            ' WHERE CtaInt.CVE_PRODUCTO_CRE (+)= CP.CVE_PRODUCTO_CRE' + coCRLF +
            ' AND CtaKap.CVE_PRODUCTO_CRE (+)= CP.CVE_PRODUCTO_CRE' + coCRLF +
            ' )TABIMPCTA, ' + coCRLF ;
      }
      C_QUERY_CTAS_IMP =
            '(SELECT '' '' AS CVE_PRODUCTO_CRE, '' '' AS CUENTA_IMPAGADO_INT, '' '' AS CUENTA_IMPAGADO_KAP FROM DUAL)TABIMPCTA, ' + coCRLF ;

      C_QUERY_CTAS_IMP_ICRE =
            ' (SELECT PROD.ID_EMPRESA, PROD.CVE_PRODUCTO_CRE, PROD.CVE_MONEDA, SUBSTR(CIIMVD.CVE_CTA_CONT,1,30) CVE_CTA_CONT_CIIMVD, SUBSTR(CPIMVD.CVE_CTA_CONT,1,30) CVE_CTA_CONT_CPIMVD' +
            ' FROM' +
            ' (SELECT CP.*, CRPM.CVE_MONEDA' +
            '  FROM CR_PRODUCTO CP,' +
            '      (SELECT CVE_MONEDA, CVE_PRODUCTO_CRE, COUNT(*) FROM CR_REL_PROD_MON CRPM GROUP BY CVE_MONEDA, CVE_PRODUCTO_CRE ORDER BY CVE_MONEDA, CVE_PRODUCTO_CRE) CRPM' +
            '  WHERE CP.CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTICRE'')' +
            '  AND   CRPM.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE) PROD,' +
            //impagado    interés
            ' (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran' +
            '  WHERE CVE_OPER_CRED = ''CIIMVD'' AND   CVE_COMISION = ''NA'' AND   CVE_CONCEPTO = ''IMPBRU'' AND   CVE_TIPO_MOVTO = ''MD'' AND   TIPO_AFECTACION = ''D'') CIIMVD,' +
            //impagado    capital
            ' (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran' +
            '  WHERE CVE_OPER_CRED = ''CPIMVD'' AND   CVE_COMISION = ''NA'' AND   CVE_CONCEPTO = ''IMPBRU'' AND   CVE_TIPO_MOVTO = ''MD'' AND   TIPO_AFECTACION = ''D'') CPIMVD' +
            ' WHERE CIIMVD.ID_EMPRESA    (+)= PROD.ID_EMPRESA' +
            ' AND   CIIMVD.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE' +
            ' AND   CIIMVD.CVE_MONEDA    (+)= PROD.CVE_MONEDA' +
            ' AND   CPIMVD.ID_EMPRESA    (+)= PROD.ID_EMPRESA' +
            ' AND   CPIMVD.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE' +
            ' AND   CPIMVD.CVE_MONEDA    (+)= PROD.CVE_MONEDA  )TABIMPCTAICRE, ' + coCRLF ;



      {
      C_QUERY_CTAS =
            ' ( SELECT CP.CVE_PRODUCTO_CRE, CUENTA_VIGENTE_INT,' + coCRLF +
            '          NVL(CtaAgrK.CUENTA_VIGENTE,CtaDDK.CUENTA_VIGENTE ) CUENTA_VIGENTE_K'+coCRLF +
            '   FROM (SELECT * FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTSICA'')) CP,'+coCRLF +
            '        ( SELECT ''IN'' AS CVE_CONCEPTO,'+coCRLF +
            '          CP.CVE_PRODUCTO_CRE,'+coCRLF +
            '          SUBSTR(GC.CUENTA_CONTABLE,1,4) || ''-'' ||'+coCRLF +
            '          SUBSTR(GC.CUENTA_CONTABLE,5,4) || ''-'' ||'+coCRLF +
            '          SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE_INT'+coCRLF +
            '          FROM (SELECT * FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTSICA'')) CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC' + coCRLF + //GUIA_CONTABLE@SICA GC'+coCRLF + CAMBIO POR BAJA DE BASE SICA JFOF 08/12
            '          WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE'+coCRLF +
// ROIM 20/04/2006 SE AGREGA LA CLAVE DE PRODUCTO PARA QUE NO INCLUYA DES DOC
            '          AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%FAC'''+coCRLF +
// /ROIM
            '          AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO'+coCRLF +
            '          AND GC.EMPRESA = ''BCO2'''+coCRLF +
            '          AND GC.CODIGO_TRANSACCION IN (306000, 306710) '+coCRLF +
            '          AND GC.CAMPO_IMPORTE IN (''03'',''06'') '+coCRLF +
            '          AND GC.CLAVE_MONEDA = ''PESOS'''+coCRLF +
            '          AND (GC.CUENTA_CONTABLE LIKE ''13%'''+coCRLF +
            '          OR GC.CUENTA_CONTABLE LIKE ''26%'')) CtaInt,'+coCRLF +
            '        ( SELECT ''KA'' AS CVE_CONCEPTO,'+coCRLF +
            '          CP.CVE_PRODUCTO_CRE,'+coCRLF +
            '          SUBSTR(GC.CUENTA_CONTABLE,1,4) || ''-'' ||'+coCRLF +
            '          SUBSTR(GC.CUENTA_CONTABLE,5,4) || ''-'' ||'+coCRLF +
            '          SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE'+coCRLF +
            '          FROM (SELECT * FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTSICA'')) CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC' + coCRLF + //GUIA_CONTABLE@SICA GC'+coCRLF + JFOF 08/2012
            '          WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE'+coCRLF +
            '          AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%FAC'''+coCRLF +
            '          AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO'+coCRLF +
            '          AND GC.EMPRESA = ''BCO2'''+coCRLF +
            '          AND GC.CODIGO_TRANSACCION IN (300000) '+coCRLF +
            '          AND GC.CLAVE_MONEDA = ''PESOS'''+coCRLF +
            '          AND GC.CAMPO_IMPORTE = ''02'' '+coCRLF +
            '          AND (GC.CUENTA_CONTABLE LIKE ''13%'')) CtaAgrK,'+coCRLF +
            '        ( SELECT ''KA'' AS CVE_CONCEPTO,'+coCRLF +
            '          CCP.CVE_PRODUCTO_CR,'+coCRLF +
            '          CTA_CONTABLE || ''-'' ||'+coCRLF +
            '          SUBSTR(SUB_CTA_CONTABLE,1,4) || ''-'' ||'+coCRLF +
            '          SUBSTR(SUB_CTA_CONTABLE,5,2) AS CUENTA_VIGENTE'+coCRLF +
            '          FROM CR_CONT_PRODUCTO  CCP'+coCRLF +
// ROIM 20/04/2006 SE CAMBIA LA CLAVE DE PRODUCTO PARA QUE NO INCLUYA DES DOC
//            '          WHERE CVE_PRODUCTO_CR LIKE ''%FAC'') CtaDDK'+coCRLF +
            '          WHERE CVE_PRODUCTO_CR LIKE ''%XXX'') CtaDDK'+coCRLF +
// /ROIM
            ' WHERE CtaInt.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE'+coCRLF +
            ' AND CtaAgrK.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE'+coCRLF +
            ' AND CtaDDK.CVE_PRODUCTO_CR (+)= cp.CVE_PRODUCTO_CRE'+coCRLF +
            ' )TABCTA ' + coCRLF ;
            }
      C_QUERY_CTAS =
            '(SELECT '' '' AS CVE_PRODUCTO_CRE, '' '' AS CUENTA_VIGENTE_INT, '' '' AS CUENTA_VIGENTE_K FROM DUAL)TABCTA ' + coCRLF ;


      C_QUERY_CTAS_ICRE =
            ' (SELECT PROD.ID_EMPRESA, PROD.CVE_PRODUCTO_CRE, PROD.CVE_MONEDA, SUBSTR(INREVI.CVE_CTA_CONT,1,30) CVE_CTA_CONT_INREVI, SUBSTR(CAREVI.CVE_CTA_CONT,1,30) CVE_CTA_CONT_CAREVI' +
            ' FROM' +
            ' (SELECT CP.*, CRPM.CVE_MONEDA' +
            '  FROM CR_PRODUCTO CP,' +
            '      (SELECT CVE_MONEDA, CVE_PRODUCTO_CRE, COUNT(*) FROM CR_REL_PROD_MON CRPM GROUP BY CVE_MONEDA, CVE_PRODUCTO_CRE ORDER BY CVE_MONEDA, CVE_PRODUCTO_CRE) CRPM' +
            '  WHERE CP.CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTICRE'')' +
            '  AND   CRPM.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE) PROD,' +
            //vigente    interés
            ' (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran' +
            '  WHERE CVE_OPER_CRED = ''INREVI'' AND   CVE_COMISION = ''NA'' AND   CVE_CONCEPTO = ''IMPBRU'' AND   CVE_TIPO_MOVTO = ''MD'' AND   TIPO_AFECTACION = ''D'') INREVI,' +
            //vigente    capital
            ' (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran' +
            '  WHERE CVE_OPER_CRED = ''CAREVI'' AND   CVE_COMISION = ''NA'' AND   CVE_CONCEPTO = ''IMPBRU'' AND   CVE_TIPO_MOVTO = ''MD'' AND   TIPO_AFECTACION = ''D'') CAREVI' +
            ' WHERE INREVI.ID_EMPRESA    (+)= PROD.ID_EMPRESA' +
            ' AND   INREVI.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE' +
            ' AND   INREVI.CVE_MONEDA    (+)= PROD.CVE_MONEDA' +
            ' AND   CAREVI.ID_EMPRESA    (+)= PROD.ID_EMPRESA' +
            ' AND   CAREVI.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE' +
            ' AND   CAREVI.CVE_MONEDA    (+)= PROD.CVE_MONEDA   )TABCTAICRE, ' + coCRLF ;



   C_TCOM_ID = 'ID'; //Importe de la Disposición
   C_TCOM_SI = 'SI'; //Saldo Insoluto
   C_TCOM_PC = 'PC'; //Periodos de Capital
   C_TCOM_EV = 'EV'; //Por Evento
   C_TCOM_PE = 'PE'; //Periodicas
   C_TCOM_DL = 'DL'; //Disponible Línea
   C_TCOM_AL = 'AL'; //Autorizado Línea
   C_TCOM_NA = 'NA'; //No Aplica

   //CREDITO_EN_LINEA
   C_ACCESORIO_ACREDITADO   = 'AC'; //Accesorio Acreditado
   C_ACCESORIO_AUTORIZACION = 'LN'; //Accesorio Acreditado
   C_ACCESORIO_DISPOSICION  = 'CR'; //Accesorio Acreditado
   C_ACCESORIO_CRED_MARCO   = 'CM'; //Accesorio Acreditado

   C_TCOM_AC = 'AC'; //Autorizado Acreditado
   C_TCOM_DC = 'DC'; //Disponible Acreditado
   C_TCOM_CI = 'CI'; //Incremento Acreditado
   C_TCOM_CD = 'CD'; //Decremento Acreditado
   C_TCOM_LI = 'LI'; //Incremento Línea
   C_TCOM_LD = 'LD'; //Decremento Línea

   C_TCOM_PI = 'PI'; //Periodos de Interes
   C_TCOM_AM = 'AM'; //Per. Capital y/o Interes
   C_TCOM_IO = 'IO'; //Importe de la operación
   C_TCOM_UT = 'UT'; //Unidad de Tiempo
   C_TCOM_PP = 'PP'; //Plan de pagos
   C_TEVE_COM_CL = 'CL'; //Colocación
   C_TEVE_COM_PA = 'PA'; //Pago anticipado
   C_TEVE_COM_PM = 'PM'; //Pago programado
   C_TEVE_COM_PV = 'PV'; //Pago vencido
   C_TEVE_COM_PG = 'PG'; //Pago anticipado, programado e impagado
   C_TEVE_COM_IT = 'IT'; //Incremento de temporada
   C_TEVE_COM_DT = 'DT'; //Decremento de temporada
   C_TEVE_COM_UK = 'UK'; //Desconocido
   C_TCOB_COM_PC = 'PC'; //Porcentaje
   C_TCOB_COM_VF = 'VF'; //Valor Fijo

   C_TGENCOM_CN  = 'CN'; //Autorizado Acreditado
   //ENDS_CREDITO_EN_LINEA


   CPAGTRA  = 'PAGTRA'; // Pago  Tradicional
   CPAGNIV  = 'PAGNIV'; // Pago Nivelado


   coEP          = 'EP';
   coEE          = 'EE';
   coCveColoca   = 'CO';
   coCveReman    = 'RE';
   coCveIntXDev  = 'IN';
   coCveMoras    = 'MO';
   coREMAB       = 'REAB';
   coDEVAB       = 'DEAB';
   coMORCA       = 'MOCA';


Type TArrayString = Array of String;
     TArrayInteger = Array of Integer;

Procedure PegaInformacion(PPSAGta: TStringAlignGrid; PPTotalReg : Tlabel; PPRegistros : TProgressBar;
                          PMErrores: TMemo; pLong : Integer);
Function ValNumPositivo(var Msg : String; PNumero : integer): boolean;
Function VerificaCadena(PCadena : String): String;
Function ValidaFecha (pFecha: TDate; MiApli : TInterApli) : Integer;
Function FechaHabil(pFecha: TDate; MiApli : TInterApli) : TDate;
Function CalculaFecha(pFecha : TDate; pDias: Integer; pApli: TInterApli): TDate;
Function CalculaDias(pFechaI : TDate; pFechaF: TDate; pApli: TInterApli): Integer;

function TruncateStr(var str : String; cKey : Char) : String;
function TrimChar(str : String; strTrim : String) : String;
function TrimCharLR(str : String; strTrim : String) : String;
function IsInteger(str : String) : Boolean;
function AddCharToLeft(str : String;cAdd : Char;nLengthStr : Integer) : String;
procedure ClearGrid(StringGrid : TStringGrid; nStartRow : Integer = 1);
procedure TakeDataGridToClipBoard(StrGrd : TStringGrid; SelectedRect : TRect);
function SearchStr(substr,str : String) : Integer;
function ReplaceStr(strSource, strFind, strReplace : String) : String;
function ReplaceAllStr(strSource, strFind, strReplace : String) : String;
function ParseStr(var A : TArrayString; StrToParse : String; cSeparator : Char) : Integer;
function Obten_NombreAcreditado(nId_Credito : Integer; Apli : TInterApli) : String;
function Obten_Contrato(nId_Credito : Integer; Apli : TInterApli) : Integer;
Function ConvierteADias(pTipo : String; pNumMesAno: Integer): Integer;
Function ObtenFolio(pCveFolio : String; pMsg : String; MiApli : TInterApli): Integer;
Function CountSelec(sgcDatos : TSGCtrl; vlCol : String) : Integer;
function CurrFromFrmFloat(FrmFloat: String): Double;
function ReplaceChar(strSource : String; C : Char; strReplace : String) : String;
function ArmaMail(Apli : TInterApli; nId_Emisor : Integer;
                  strID_TIPO_EMAIL, strAtencion, strMensaje_Adicional: String;
                  var strTITULO_EMAIL, strCUERPO_EMAIL, strError : String) : Integer;
procedure AddLine(MiMemo: TMemo; peLinea: string);
procedure AddLineQr(MiMemo: TQRMemo; peLinea: string);
Procedure messageIniFinProceso(MiMemo: TMemo; pIndic : String);
function  ObtenRiesgoAcumulado(peEmisor,peProveedor : String; MiApli : TInterApli) : Double;
function  IsFloat(pValStr : String): Boolean;
//Procedure StpReactivaSegui(pTransaccion : String; pGrupo : String; pFechaCob : TdateTime; MiApli : TInterApli);
Procedure StpReactivaSegui(pTransaccion, pGrupo, pCveSegto, pTxInstr : String;
            pFechaCob : TdateTime; MiApli : TInterApli; var psTransaccion : Integer );
function  textcorre(pstring : String) : String;
function  ConverFechaAHora(pFecha : TDateTime) : integer;
function EnviaMailInternet(vlApli : TInterApli; strSubject, strEmail, strTo : String; strFileName : String = '') : Boolean;
function  ObtLiqMoneda(pMoneda : String; pApli: TInterApli): String;
function  ObtTipoCambio(pFecha: TDate; pMoneda,pDataBaseName, pSessionName : String): Double;
function  ObtFechaMesAnt( pCveDiaLiq: String; pApli: TInterApli): TDate;
Procedure GenMsg(PPMsg : String; pApli: TInterApli);
//Procedure ValidaPerfil(pApli: TInterApli; var vlBAutoriza, vlBCancela: Boolean);
function DameIniMes(pFecha : TDateTime) : TDateTime;
function DameFinMes(pFecha : TDateTime) : TDateTime;
//INICIO de Nuevas Funciones Agropecuario SATV4766
procedure CreateSTP_PRORROGA(var StoredProc : TStoredProc; pDatabaseName, pSessionName : String);
function ActivaGrupoProrroga(pID_GPO_PRGA : Integer; pDatabaseName, pSessionName : String; var pstrMensaje : String) : Boolean;
//FIN de Nuevas Funciones Agropecuario SATV4766

//VALIDACION DE USUARIO
Function    ValidaPerfilUsuario(Apli : TInterApli;
                                Var vsBImpDisp: String; vsImpMaxAut : Double ): Boolean;
function    ValCanPerfilUsu(Apli : TInterApli): Boolean;
function    ValTramites(pIdReferencia,pCveMedio : String; Apli : TInterApli; Var pMensaje : String): Boolean;

function    StpPctIVA(pIdCto, pIdCredito: Integer; pImpCred: Double; Apli : TInterApli): Double;
Function    GenComisDisp(pImporte, pPctComis : Double; pIdCto, pIdCredito : Integer; Apli : TInterApli;
                         var vlSalida : Boolean; vlMsg : String): Double;
procedure validaTasaFija(pCveTasa : String; Control : TInterEdit);
procedure ObtenChequeras(pIdCliente, pDisp: Integer; pCveEmisNafin,pCveTipoAcred,pCveTipoCheq,pMetodo : String;
                         Apli : TInterApli; var psIdBancoChqra : Integer; var psCuentaBanco : String);
procedure ClearTblReport( Apli : TInterApli; var  vlError : String );
Function StrMesEncabRep( sFecha: String): String;
// <LOLS 25 NOV 2005  SE INCORPORAN RUTINAS PARA EL PARSING DE CADENAS CONSIDERANDO EL MANEJO DEL TOKEN TEXTO>
function NumChars( Token : Char; StrSource : String ):Integer;
function ParseQuotedString(var A : TArrayString; StrToParse : String; cSeparator : Char; cTexto : Char ) : Integer;
// </LOLS>
// <EASA 07 DIC 2005  SE INCORPORA RUTIRNA PAR VERIFICAR DISP IMPAGADAS DEL ACREDITADO>
function FindDispIM(pIdAcreditado : Integer; Apli : TInterApli; var pstrMensaje : String) : Boolean;
// </EASA>

// <EASA 14 AGO 2007  SE INCORPORA RUTIRNA PAR VERIFICAR DISP IMPAGADAS POR PROVEEDOR>
function FindDispIMPProv(pIdproveedor : Integer; Apli : TInterApli; var pstrMensaje : String) : Boolean;
// </EASA>

//<LOLS 16 ENE 2005. RUTINA QUE LEE DE CR_GRUPO_CLAVE EL CAMPO VALOR CON BASE EN LA CLAVE Y EL PARAMETRO>
function StrToHex( sCadena : String ) : String;
function HexToStr( sCadena : String ) : String;
function BoolToStr( peValor : Boolean ) : String;
function StrToBool( peValor : String  ) : Boolean;
function obtValorGpoCve(sGpoCve, sParam : String; Apli : TInterApli ) : String;
function ObtSendTo( sDate : String ) : String;
//</LOLS>

// <EASA 20 MAR 2006 Rutina para obtener el tipo de cambio requerido por contabiliad
function  ObtTipCambConta(pMoneda: String; pFecha : TDateTime; MiApli : TInterApli): Double;
// <EASA> /

// <EASA 10 mayo 2006 Rutina obtiene la fecha de inicio del fin de semana
Function  ObtFIniFinSemana(pFecha : TDateTime; MiApli : TInterApli): TDateTime;
// <EASA> /

// <EASA 18 ABR 2006 Rutina que deshabilita ohabilita un checks box
Procedure EnableCheckBox(var CheckBox : TCheckBox);
// <EASA> /

//</ EASA4011 12 JUN 2006 VALIDACION RELACION CENTRO DE COSTOS - CUENTAS CONTABLES
Procedure ValidaCCCtaContable(pMoneda, pIdCCostos, pCveGpoProducto: String; MiApli : TInterApli);
// EASA4011 >/


// <LOLS 30 ENE 2007. CREDITO EN LINEA>
function valComisProg( idCredito : Integer; CveComision :  String;  Apli : TInterApli ) : Boolean;
// </LOLS>

//</ EASA4011 23.FEB.2007       Reporte limite de Financiamiento
Function  FormaQueryLimFin(sFecha : TDateTime; sEmpresa, sRegMin, sExSector:String):String;
// </EASA4011>

//</EAS4A011    22.AGO.2007     Valida Tasa del fondeo a una fecha determinada>/
Function ValidaExisTasaFnd(pIdCredito: String; pFecha: TDateTime; pApli: TInterApli): Boolean;
Function ExisteFondeo(pIdCredito: String; pApli: TInterApli; var vlMsg :string): Boolean;
Function ExisteGar(pIdCredito: String; pApli: TInterApli; var vlMsg :string): Boolean;
Function ObtQryAviso(pbCierre, pCesiones, pTipo, pCveAviso, sMail, sEmisor, sProveedor : String; PF_Inicio, PF_Fin: TDate): String;
function LimpiaTblAviso(pDatabaseName, pSessionName : String; var pstrMensaje : String): Boolean;
function AgregaAviso( peIdCesion     : Integer; peIdDocumento : String;
                      peCveTipoReman : String;
                      pDatabaseName, pSessionName : String; var pstrMensaje : String ): Boolean;
Procedure StpInsertUpdAv(pAviso, pCesion, pDocto, pbMail, pTxMail,pFhMail, pFAviso : String;
                      pNumImpresion : Integer;
                      MiApli : TInterApli; var psMsg : String );

Procedure msgBodyMail(MiMemo: TQRMemo; sGpoCve: String; Apli : TInterApli );
// </EASA4011>

function ValidaUsuario(Apli : TInterApli; PECLAVE:String): Boolean; //VALIDACION DE USUARIO JFOF 12/10/2011

Procedure HeredaValorString(Valor: String); // FJR

Function ValidaPLD(vlIdCesion : String;
                   vlImporte  : currency;
                   vlTipMovto : String;
                   pDatabaseName, pSessionName, pUsuario, pMenError : String;
                   var vlError : String) : Boolean;

var vgCadena, vgProv, vgCheq, vgCLABE: String;

implementation

{---------------------------------------------------------------------------------------------------------------------
                                                Valida PLD
----------------------------------------------------------------------------------------------------------------------}
Function ValidaPLD(vlIdCesion : String;
                   vlImporte  : currency;
                   vlTipMovto : String;
                   pDatabaseName, pSessionName, pUsuario, pMenError : String;
               var vlError : String) : Boolean;
var  STPValidaPLD  : TStoredProc;
     vlSalida      : Boolean;
Begin
     vlSalida := True;
     STPValidaPLD := TStoredProc.Create(Nil);
     try
        with STPValidaPLD do
        begin
            STPValidaPLD.DatabaseName:= pDatabaseName;
            STPValidaPLD.SessionName:= pSessionName;
            STPValidaPLD.StoredProcName:='PKGCRPLD.VALIDAPLD';

            // Se crean los parametros del StoreProcedure
            Params.Clear;
            Params.CreateParam(ftInteger, 'peIDCREDITO',ptInput);
            Params.CreateParam(ftString,  'peTipoMovto',ptInput);
            Params.CreateParam(ftFloat,   'peImporte',ptInput);
            Params.CreateParam(ftString,  'peUsuario',ptInput);
            Params.CreateParam(ftString,  'peBCommit',ptInput);
            //
            Params.CreateParam(ftString,'psBAutorizada',ptOutput);
            Params.CreateParam(ftFloat, 'psResultado',ptOutput);
            Params.CreateParam(ftString,'psTxResultado',ptOutput);
            //
            //
            ParamByName('peIDCREDITO').AsInteger := StrToInt(vlIdCesion);
            ParamByName('peTipoMovto').AsString := vlTipMovto;
            ParamByName('peImporte').AsFloat    := vlImporte;
            ParamByName('peUsuario').AsString := pUsuario;
            ParamByName('peBCommit').AsString := CVERDAD;
            ExecProc;

            if (STPValidaPLD.ParamByName('psResultado').AsInteger <>0) then
            Begin
               vlSalida:= False;
               vlError := ( STPValidaPLD.ParamByName('psTxResultado').AsString);

               if pMenError='V' then ShowMessage('PROBLEMAS CON LA VALIDACION DE PLD: ' +
               IntToStr(STPValidaPLD.ParamByName('psResultado').AsInteger));
               
               if pMenError='V' then ShowMessage(vlError);
            end;

            if (STPValidaPLD.ParamByName('psBAutorizada').AsString = 'F') then
            Begin
               vlSalida:= False;
               vlError := ( STPValidaPLD.ParamByName('psTxResultado').AsString);

               if pMenError='V' then ShowMessage(vlError);
            end;

            if (STPValidaPLD.ParamByName('psBAutorizada').AsString = 'EP') then
            Begin
               vlSalida:= False;
               vlError := ( STPValidaPLD.ParamByName('psTxResultado').AsString);

               if pMenError='V' then ShowMessage(vlError);
            end;

            if (STPValidaPLD.ParamByName('psBAutorizada').AsString = 'CA') then
            Begin
               vlSalida:= False;
               vlError := ( STPValidaPLD.ParamByName('psTxResultado').AsString);

               if pMenError='V' then ShowMessage(vlError);
            end;

            //end if;
        end;
     finally
          STPValidaPLD.Free;
     end;
     ValidaPLD := vlSalida;
End;


//INICIO de Nuevas Funciones Body Agropecuario SATV4766
procedure CreateSTP_PRORROGA(var StoredProc : TStoredProc; pDatabaseName, pSessionName : String);
begin
 StoredProc := TStoredProc.Create(Nil);
 If Assigned(StoredProc) Then
 With StoredProc Do
  Begin
    StoredProcName := 'PKGCRPRORRCM.STP_PRORROGA';
    DatabaseName := pDatabaseName;
    SessionName := pSessionName;
    Params.Clear;
    Params.CreateParam(ftFloat,'PEID_CREDITO',ptInput);
    Params.CreateParam(ftFloat,'PEID_PERIODO',ptInput);
    Params.CreateParam(ftFloat,'PEID_PERIODO_PRGA',ptInput);
    Params.CreateParam(ftString,'PECVE_PRORROGA',ptInput);
    Params.CreateParam(ftString,'PECVE_CONCEPTO',ptInput);
    Params.CreateParam(ftDateTime,'PEF_VENC_PRGA',ptInput);
    Params.CreateParam(ftFloat,'PEIMP_CAP_PRGA',ptInput);
    Params.CreateParam(ftDateTime,'PEF_ALTA',ptInput);
    Params.CreateParam(ftString,'PECVE_USU_ALTA',ptInput);
    Params.CreateParam(ftString,'PEB_COMMIT',ptInput);
    Params.CreateParam(ftInteger,'PESID_GPO_PRGA',ptInputOutput);
    Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
    Params.CreateParam(ftString,'PSTX_RESULTADO',ptOutput);
  End;
end;

function ActivaGrupoProrroga(pID_GPO_PRGA : Integer; pDatabaseName, pSessionName : String; var pstrMensaje : String) : Boolean;
var StpPrgaActivaGpo : TStoredProc;
begin
  Result := False;
  pstrMensaje := '';
  StpPrgaActivaGpo := TStoredProc.Create(Nil);
  If Assigned(StpPrgaActivaGpo) Then
  With StpPrgaActivaGpo Do
    Try
     StoredProcName := 'PKGCRPRORRCM.STP_PRGA_ACTIVA_GPO';
     DatabaseName := pDatabaseName;
     SessionName := pSessionName;
     Params.Clear;
     Params.CreateParam(ftFloat,'PEID_GPO_PRGA', ptInput);
     Params.CreateParam(ftString,'PEB_COMMIT', ptInput);
     Params.CreateParam(ftFloat,'PSRESULTADO', ptInput);
     Params.CreateParam(ftString,'PSTX_RESULTADO', ptInput);

     ParamByName('PEID_GPO_PRGA').AsFloat := pID_GPO_PRGA;
     ParamByName('PEB_COMMIT').AsString := CVERDAD;
     ExecProc;

     If (ParamByName('PSRESULTADO').AsFloat <> 0) Then
       pstrMensaje := ParamByName('PSTX_RESULTADO').AsString
     Else
       Result := True;
    Finally
     Free;
    End;
end;
//FIN de Nuevas Funciones Body Agropecuario SATV4766


(*********************COPIA DE DATOS DE EXCEL AL CATÁLOGO***********************)
Procedure PegaInformacion(PPSAGta: TStringAlignGrid; PPTotalReg : Tlabel; PPRegistros : TProgressBar;
                          PMErrores: TMemo; pLong : Integer);

var l_Tempo, l_Ciclo :Integer;
   procedure limpiaRow(pRow : Integer);
   Begin
      PMErrores.Lines.Add('Error en Cve: ' + PPSAGta.Cells[1,pRow] +
                          '       Desc.: ' + PPSAGta.Cells[2,pRow]);
      PPSAGta.RemoveRow(l_Ciclo);
   end;

Procedure DepuraLineas;
   var  l_Ciclo   : Integer;
        vlLong    : Integer;
   Begin
       l_Ciclo := 0;
       while l_Ciclo <= PPSAGta.RowCount -1 do
       begin
           vlLong := Length(PPSAGta.Cells[1,l_Ciclo]);
           //columna en blanco
           PPSAGta.Cells[0,l_Ciclo] := IntToStr(l_Ciclo + 1);

           if ((trim('>'+trim(PPSAGta.Cells[0,l_Ciclo])+'<') = trim('><'))  and
               (trim('>'+trim(PPSAGta.Cells[1,l_Ciclo])+'<') = trim('><'))  and
               (trim('>'+trim(PPSAGta.Cells[2,l_Ciclo])+'<') = trim('><'))) then
           Begin
                    limpiaRow(l_Ciclo);
                    PPSAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (PPSAGta.RowCount = 1) then  exit
           end
           else if ((trim('>'+trim(PPSAGta.Cells[0,l_Ciclo])+'<')  = trim('><'))  and
                    (trim('>'+trim(PPSAGta.Cells[1,l_Ciclo])+'<')  = trim('><'))) then
           Begin
                    limpiaRow(l_Ciclo);
                    PPSAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (PPSAGta.RowCount = 1) then  exit
           end
           else if (trim('>'+Trim(PPSAGta.Cells[1,l_Ciclo])+'<')  = trim('><')) then
           Begin
                    PPSAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (PPSAGta.RowCount = 1) then  exit
           end
           else if (trim('>'+trim(PPSAGta.Cells[0,l_Ciclo])+'<')  = trim('><')) then
           Begin
                    PPSAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (PPSAGta.RowCount = 1) then  exit
           end
           else if (( vlLong = 0 ) OR ( vlLong > pLong )) then
           Begin
                    limpiaRow(l_Ciclo);
                    PPSAGta.RemoveRow(l_Ciclo);
                    if (l_Ciclo = 0)and (PPSAGta.RowCount = 1) then  exit
           end
           else
           begin
                l_Ciclo := l_Ciclo + 1;
           end;
       end;
   end;
   //INICIO PROCEDURE PEGA INFORMACION
Begin
      PPTotalReg.Caption := '';
      PPRegistros.Max := 0;
      Try
         For l_Ciclo:= 1 to (PPSAGta.RowCount-1) do
         begin
              For l_Tempo:= 0 to (PPSAGta.ColCount-1) do
              begin
                   PPSAGta.Cells[l_Tempo,l_Ciclo] := '';
              end;
         end;
         //Pega el archivo desde la memoria
         if PPSAGta.ColCount = 3 then
            PPSAGta.RemoveCol(0);
         //end if
         PPSAGta.CopyFromClipboard;
      except
         ShowMessage('Problemas con la carga en BLOQUE!!!!');
         EXIT;
      end;
      //
       if PPSAGta.ColCount < 3 then
             PPSAGta.InsertCol(0)
       else if PPSAGta.ColCount > 3 then
            PPSAGta.ColCount := 3;
          //end if
          PPSAGta.ColWidths[0] := 18;
          PPSAGta.ColWidths[1] := 70;
          PPSAGta.ColWidths[2] := 350;
          //Pega Datos
          depuralineas;
       if (PPSAGta.Cells[0,0] <> '') and ( PPSAGta.RowCount >= 1 ) then
       Begin
            PPTotalReg.Caption := IntToStr(PPSAGta.RowCount);
            PPRegistros.Max := PPSAGta.RowCount - 1;
       end;
end;

(*********************Valida Numeros Positivos***********************)
Function ValNumPositivo(var Msg : String; PNumero : Integer): Boolean;
var VLResult : Boolean;
Begin
   VLResult := False;
   Msg := '';
   if (PNumero < 0)then
      Msg := ('No se admiten números nulos ni negativos. Introduzca un número mayor o igual a cero')
   else
      VLResult := True;
   //end if

   ValNumPositivo :=VLResult;
end;

(********************* Verifica Cadena **********************)
Function VerificaCadena(PCadena : String): String;
var     VLCadena     : String;
        VLLong,i        :Integer;
        VLSalida        : String;
Begin
     VLCadena   := PCadena;
     VLLong :=(Length(VLCadena));
     For i:=1 to VLLong do
     Begin
            If not(((inttostr(ord(VLCadena[i])) <= inttostr(ord(90))) and
                (inttostr(ord(VLCadena[i])) >= inttostr(ord(48))))
                 or
               ((inttostr(ord(VLCadena[i])) >= inttostr(ord(97))) and
                (inttostr(ord(VLCadena[i])) <= inttostr(ord(99))))
                 or
               ((inttostr(ord(VLCadena[i])) >= inttostr(ord(100))) and
                (inttostr(ord(VLCadena[i])) <= inttostr(ord(122))))
                 or
                (inttostr(ord(VLCadena[i])) = inttostr(ord(38))))
               then
                   VLCadena[i]:= ' ';
            //end if

            VLSalida := VLSalida + VLCadena[i];
     end;
     VerificaCadena := VLCadena;
end;
(******************************************************************************)
(************************* VALIDA FECHAS **************************************)
Function ValidaFecha (pFecha: TDate; MiApli : TInterApli) : Integer;
var     STPValFecha : TStoredProc;
        vlResult    : Integer;
Begin
     //0 : Fecha valida
     //1 o mayor : Fecha No valida
     STPValFecha := TStoredProc.Create(Nil);
     try
          STPValFecha.DatabaseName:= MiApli.DatabaseName;
          STPValFecha.SessionName:= MiApli.SessionName;
          STPValFecha.StoredProcName:='PKGFECHAS.SPE_FECHAMET1';
          STPValFecha.Params.CreateParam(ftInteger,'P_IdEmpresa',ptInputOutput);
          STPValFecha.Params.CreateParam(ftDate,'P_Fecha',ptInputOutput);
          STPValFecha.Params.CreateParam(ftInteger,'ps_resp',ptOutput);
          STPValFecha.Prepare;
          STPValFecha.ParamByName('P_IdEmpresa').AsInteger := MiApli.IdEmpresa;
          STPValFecha.ParamByName('P_Fecha').AsDate := pFecha;
          STPValFecha.ExecProc;

          vlResult := STPValFecha.ParamByName('ps_resp').AsInteger;
     finally
          If Assigned(STPValFecha) Then STPValFecha.Free;
     end;
     ValidaFecha := vlResult;
end;
(******************************************************************************)
(************************* FECHAS HABILES *************************************)
Function FechaHabil (pFecha: TDate; MiApli : TInterApli) : TDate;
var     STPValFecha : TStoredProc;
        VLFecha     : TDate;
Begin
     //0 : Fecha valida
     //1 o mayor : Fecha No valida
     STPValFecha := TStoredProc.Create(Nil);
     try
          STPValFecha.DatabaseName:= MiApli.DatabaseName;
          STPValFecha.SessionName:= MiApli.SessionName;
          STPValFecha.StoredProcName:='PKGFECHAS.SPE_FECHAMET6';
          STPValFecha.Params.CreateParam(ftInteger,'P_IdEmpresa',ptInput);
          STPValFecha.Params.CreateParam(ftString,'p_CveLiq',ptInput);
          STPValFecha.Params.CreateParam(ftDate,'P_Fecha',ptInputOutput);
          STPValFecha.Params.CreateParam(ftInteger,'ps_resp',ptOutput);
          STPValFecha.Prepare;
          STPValFecha.ParamByName('P_IdEmpresa').AsInteger := MiApli.IdEmpresa;
          STPValFecha.ParamByName('p_CveLiq').AsString := 'D001';
          STPValFecha.ParamByName('P_Fecha').AsDate := pFecha;
          STPValFecha.ExecProc;

       //   vlResult := STPValFecha.ParamByName('ps_resp').AsInteger;
          vlFecha  := STPValFecha.ParamByName('p_fecha').AsDate;
     finally
          If Assigned(STPValFecha) Then STPValFecha.Free;
     end;
     FechaHabil := vlFecha;
end;

(******************************************************************************)
(************************* CALCULA FECHA **************************************)
Function CalculaFecha(pFecha : TDate; pDias: Integer; pApli: TInterApli): TDate;
var     VlFecha : Tdate;
        i       : Integer;
Begin
   Vlfecha := pFecha;
   For i :=1 to pDias do
      VLFecha := FechaHabil(vlFecha,pApli) + 1;
   CalculaFecha := VLFecha;
end;

(******************************************************************************)
(************************* CALCULA DIAS ***************************************)
Function CalculaDias(pFechaI : TDate; pFechaF: TDate; pApli: TInterApli): Integer;
var     VlFechaI : Tdate;
        VLFechaF : TDate;
        VLDias : Integer;
Begin
        VlfechaI := pFechaI;
        VlfechaF := pFechaF;
        VlDias   := 0;

        If VLFechaF > VLFechaI then
        Begin
           While VLFechaI < VLFechaF do
           Begin
               VLfechaI := VLfechaI + 1;
               If ValidaFecha(VLFechaI,pApli) = 0 then
                        Vldias := VlDias + 1;
               //end if
           end;
        end;
        CalculaDias := VLDias;
end;

{ ******************************************************************************
  TRUNCATESTR

  Esta función regresa un cadena cuando encuentra el carcater especificado
  y recorta la cadena principal, muy útil para leer valores en un archivo de texto
  delimitado por tabuladores, comas, etc...

  Ejemplo...
     str := '1,2,3,4,5'
     strValor1 := TruncateStr(str,',');   // Aqui strValor1 es igual a '1' y str es igual a '2,3,4,5'
     strValor2 := TruncateStr(str,',');   // Aqui strValor2 es igual a '2' y str es igual a '3,4,5'
     strValor3 := TruncateStr(str,',');   // Aqui strValor3 es igual a '3' y str es igual a '4,5'
     strValor4 := TruncateStr(str,',');   // Aqui strValor4 es igual a '4' y str es igual a '5'

  ****************************************************************************** }
function TruncateStr(var str : String; cKey : Char) : String;
begin
 If Trim(str) <> '' Then
  Begin
   Result := Copy(str,1,Pos(cKey,str)-1);
   str := Copy(str,Pos(cKey,str)+1,Length(str));
  End
 Else
  Result := str;
end;

{ ******************************************************************************
  TRIMCHAR

  Esta función elimina todos los caracteres especificados en el parametro strTrim...
  Ejemplo...
          TrimChar('$ 1,000,000','$,');  // Regresa el valor de  '1000000'
  ****************************************************************************** }
function TrimChar(str : String; strTrim : String) : String;
var strTemp : String;
    I, nLen : Integer;
begin
  strTemp := ''; nLen := Length(str);
  If str <> '' Then
   For I := 1 To nLen Do
    If Pos(str[I],strTrim) = 0 Then strTemp := strTemp + str[I];
  Result := strTemp;
end;

function TrimCharLR(str : String; strTrim : String) : String;
var I, nLen, nPos1, nPos2 : Integer;
begin
  nLen := Length(str);
  nPos1 := 0; nPos2 := nLen;
  If str <> '' Then
   Begin
   // Barre de izquierda a derecha
   // en búsqueda del primer cáracter difernte de los que se va a eliminar
   For I := 1 To nLen Do
    If Pos(str[I],strTrim) = 0 Then
     Begin
     nPos1 := I;
     Break;
     End;
   // Barre de derecha a izquierda
   // en búsqueda del primer cáracter difernte de los que se va a eliminar
   For I := nLen DownTo 1 Do
    If Pos(str[I],strTrim) = 0 Then
     Begin
     nPos2 := I + 1;
     Break;
     End;
   End;
  Result := Copy(str, nPos1, nPos2 - nPos1);
end;

{ ******************************************************************************
  ISINTEGER

  Como su nombre lo dice verifica si una cadena contiene un valor númerico entero,
  muy útil para evitar excepciones indeseadas
  Ejemplo...
          strValue = '12345';
          If IsInteger(strValue) Then nValue := StrToInt(strValue);
  ****************************************************************************** }
function IsInteger(str : String) : Boolean;
var I : Integer;
    bOk : Boolean;
begin
 bOk := True;
 For I := 1 To Length(str) Do
  Begin
  If (Pos(str[I],'0123456789') = 0) Then
   Begin bOk := False; Break; End;
  End;
 Result := bOk And (Trim(str) <> '');
end;

function AddCharToLeft(str : String;cAdd : Char;nLengthStr : Integer) : String;
var I, nLen : Integer;
begin
  nLen := Length(str);
  If nLengthStr > nLen Then
   For I := 0 To nLengthStr - nLen - 1 Do
    str := cAdd + str;
  Result := str;
end;

{ ******************************************************************************
  CLEARGRID

  Debido a que no existe función alguna que limpie en su totalidad el Grid
  se implemento dicho procedimiento que borra todo el contenido del Grid

  ****************************************************************************** }
procedure ClearGrid(StringGrid : TStringGrid; nStartRow : Integer = 1);
var I, J : Integer;
begin
 If Assigned(StringGrid) Then
  With StringGrid Do
   For I := nStartRow To RowCount-1 Do
    Begin
    RowHeights[I] := DefaultRowHeight;
    For J := 0 To ColCount-1 Do
       Cells[J,I] := '';
    End ;
end;

{ ******************************************************************************
  TAKEDATAGRIDTOCLIPBOARD

  Copia unicamente lo seleccionado dentro del area del parametro "SelectedRect"
  hacia el Clipboard, delimitado por tabuladores, para pasarlo a Excell u otra
  aplicacion la información del Grid...

  ****************************************************************************** }
procedure TakeDataGridToClipBoard(StrGrd : TStringGrid; SelectedRect : TRect);
var I, J, nLeft, nRight, nTop, nBottom : Integer;
    str : String;
begin
 str := '';
 If Assigned(StrGrd) Then
  With StrGrd Do
   Begin
   If SelectedRect.Left   < 0         Then nLeft   := 0 Else nLeft := SelectedRect.Left;
   If SelectedRect.Right  >= ColCount Then nRight  := ColCount - 1 Else nRight := SelectedRect.Right;
   If SelectedRect.Top    < 0         Then nTop    := 0 Else nTop := SelectedRect.Top;
   If SelectedRect.Bottom >= RowCount Then nBottom := RowCount - 1 Else nBottom := SelectedRect.Bottom;

   For I := nTop To nBottom Do
    Begin
     For J := nLeft To nRight Do
     str := str + Cells[J,I] + #9;
    str := str + #13#10;
    End;
   Clipboard.SetTextBuf(PChar(str));
   End;
end;

{ ******************************************************************************
  SEARCHSTR

  Búsqueda rápida de una Palabras en un una cadena

  ****************************************************************************** }

function SearchStr(substr,str : String) : Integer;
var I, J, H, nLen, nLen1 : Integer;
begin
   Result := 0;
   nLen   := Length(str);
   nLen1  := Length(substr);

  If (nLen > 0) And (nLen1 > 0) Then
   For I := 1 To nLen Do
    Begin
     If (str[I] = substr[1]) And (str[I+nLen1-1] = substr[nLen1]) Then
      Begin
       H := I;

       For J := 1 To nLen1 Do
        Begin
         If Not (substr[J] = str[H]) Then
          Break;
         Inc(H);
        End;

       If (H - I) = nLen1 Then
        Begin
        Result := I;
        Break;
        End;

      End;
    End;
end;


{ ******************************************************************************
  ReplaceStr

  Reemplaza la primer cadena encontrada por la que se le indique dentro de otra cadena
  ejemplo

    ReplaceStr('Grupo <*> ','<*>','Interacciones') devuelve 'Grupo Interacciones'

  ****************************************************************************** }

function ReplaceStr(strSource, strFind, strReplace : String) : String;
var nPos : Integer;
begin
 nPos := SearchStr(UpperCase(strFind),UpperCase(strSource));
 If (nPos > 0) Then
  Result := Copy(strSource,1,nPos-1)+strReplace+
            Copy(strSource,nPos+Length(strFind),Length(strSource))
 Else
  Result := strSource;
end;


function ReplaceAllStr(strSource, strFind, strReplace : String) : String;
begin
  While (SearchStr(strFind, strSource) > 0) Do
   strSource := ReplaceStr(strSource, strFind, strReplace);
 Result := strSource;
end;

{ ******************************************************************************
  ParseStr

  Una cadena delimitada por tabuladores u otro caracter dado es separado y
  enviado a un arreglo para su facil manejo y regresando la longitud máxima
  del arreglo...

  Ejemplo:
  Si tenemos la cadena en un archivo *.csv de la siguiente forma 'a,b,c,d,e,f,g,h,'
  y queremos mostrar sus valores separados, podemos hacer lo siguiente

      var AValue : TArrayString;
          I, nCount : Integer;
       begin
        nCount := ParseStr(AValue,'a,b,c,d,e,f,g,h,',','); // Separamos Valores
        For I := 0 To nCount - 1 Do
         ShowMessage(AValue[I]);
       SetLength(AValue,0);  // Liberamos el Arreglo
      end;

    end;

  ****************************************************************************** }
function ParseStr(var A : TArrayString; StrToParse : String; cSeparator : Char) : Integer;
var nCount : Integer;
    str, strDblSeparator : String;
begin
 str := StrToParse;
 strDblSeparator := cSeparator + cSeparator; nCount := 0;

 While (SearchStr(strDblSeparator, StrToParse) > 0) Do
  StrToParse := ReplaceStr(StrToParse, strDblSeparator, cSeparator + #32 + cSeparator);

 While Trim(StrToParse) <> '' Do
  Begin
  SetLength(A,nCount+1);
  str := TruncateStr(StrToParse,cSeparator);
  If (str = '') And (Pos(cSeparator,StrToParse) = 0) Then Begin A[nCount] := StrToParse; StrToParse := ''; End
  Else A[nCount] := str;
  Inc(nCount);
  End;
 Result := nCount;
end;

function ReplaceChar(strSource : String; C : Char; strReplace : String) : String;
var I, nLen : Integer;
    strTemp : String;
begin
  strTemp := '';
  nLen := Length(strSource);
  For I := 1 To nLen Do
   If (strSource[I] = C) Then strTemp :=  strTemp + strReplace
   Else strTemp := strTemp + strSource[I];
  Result := strTemp;
end;

/////  FJR 25.07.2012  va a crecer, seguro que s'i...
Procedure HeredaValorString(Valor: String);
begin
   vgCadena:= Valor ; // asignacion temporal en prevision de credimiento de la funcion
   If Copy(vgCadena, 1, 1) = '/' then
      vgCheq := Copy(vgCadena, 2, length(vgCadena)-1)
   Else
     If Copy(vgCadena, 1, 1)='{' then
        vgCLABE:= Copy(vgCadena, 2, length(vgCadena)-1)
     Else
        vgProv := vgCadena ;

end ;

function ArmaMail(Apli : TInterApli; nId_Emisor : Integer;
                  strID_TIPO_EMAIL, strAtencion, strMensaje_Adicional : String;
                  var strTITULO_EMAIL, strCUERPO_EMAIL, strError : String) : Integer;

 procedure ArmaQry(var Qry : TQuery; strSQL : String);
 begin
  Qry := TQuery.Create(Nil);
  If Assigned(Qry) Then
   With Qry Do
    Begin
    SessionName := Apli.SessionName;
    DataBaseName := Apli.DataBaseName;
    SQL.Clear;
    SQL.Add(strSQL);
    Open;
    End;
 end;

 function ObtenPersonas(strID_TIPO_PERSONA : String) : String;
 var Qry : TQuery;
     str, strComa : String;
 begin
   ArmaQry(Qry,  ' SELECT'#13#10+
             // < EASA4011      14.FEB.2007     Req. 2007 - 01 / 010
//                 '      (PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO || '' '' || PF.NOMBRE_PERSONA) AS NOMBRE'#13#10+
                 '      ( PF.NOMBRE_PERSONA|| '' '' || PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO) AS NOMBRE'#13#10+
             //   EASA4011 >/
                 ' FROM CR_EMAIL_DATOS CED,'#13#10+
                 '      PERSONA_FISICA PF,'#13#10+
                 '      EMPLEADO E,'#13#10+
                 '      PUESTO P'#13#10+
                 ' WHERE CED.ID_TIPO_EMAIL = '#39+strID_TIPO_EMAIL+#39#13#10+
                 '   AND CED.ID_TIPO_PERSONA = '#39+strID_TIPO_PERSONA+#39#13#10+
                 '   AND CED.SIT_EMAIL_DATOS = '#39+CSIT_AC+#39''#13#10+
                 '   AND PF.ID_PERSONA = CED.ID_PERSONA'#13#10+
                 '   AND E.ID_PERSONA = PF.ID_PERSONA'#13#10+
                 '   AND P.CVE_PUESTO = E.CVE_PUESTO'#13#10+
                 ' ORDER BY NOMBRE'#13#10 );

  str := ''; strComa := '';
  If Assigned(Qry) Then
   With Qry Do
    Try
     While Not Eof Do

      Begin
      str := str + strComa + FieldByName('NOMBRE').AsString;
      strComa := ', ';
      Next;
      End;
    Finally
     Close; Free;
    End;
  Result := str;
 end;

var QryDatosEmisor, QryEmail : TQuery;
begin
 Result := 0; strError := '';
 // Obtiene los Datos del Mail
 ArmaQry(QryEmail,'SELECT TITULO_EMAIL, CUERPO_EMAIL FROM CR_EMAIL WHERE ID_TIPO_EMAIL = '#39+strID_TIPO_EMAIL+#39);
 If Assigned(QryEmail) Then
  With QryEmail  Do
   Try
    strTITULO_EMAIL := FieldByName('TITULO_EMAIL').AsString;
    strCUERPO_EMAIL := FieldByName('CUERPO_EMAIL').AsString;
   Finally
    Close; Free;
   End
 Else
  Begin
  Result   := 1;
  strError := 'ERROR al obtener los Datos del Email '#39+strID_TIPO_EMAIL+#39;
  Exit;
  End;

  // Obtiene los Datos del Emisor
 ArmaQry(QryDatosEmisor,
         ' SELECT'#13#10+
         // < EASA4011      14.FEB.2007     Req. 2007 - 01 / 010
//         '     (PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO || '' '' || PF.NOMBRE_PERSONA || PM.NOM_RAZON_SOCIAL) AS NOMBRE,'#13#10+
         '     (PF.NOMBRE_PERSONA || PM.NOM_RAZON_SOCIAL || '' '' || PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO ) AS NOMBRE,'#13#10+
             //   EASA4011 >/         
         '      D.CALLE_NUMERO,'#13#10+
         '      D.CODIGO_POSTAL,'#13#10+
         '      D.COLONIA,'#13#10+
         '      POB.DESC_POBLACION  -- Estado'#13#10+
         ' FROM PERSONA_FISICA PF,'#13#10+
         '      PERSONA_MORAL PM,'#13#10+
         '      PERSONA P,'#13#10+
         '      DOMICILIO D,'#13#10+
         '      POBLACION POB'#13#10+
         ' WHERE'#13#10+
         '     P.ID_PERSONA = '+IntToStr(nId_Emisor)+#13#10+
         '     AND PF.ID_PERSONA (+)= P.ID_PERSONA'#13#10+
         '     AND PM.ID_PERSONA (+)= P.ID_PERSONA'#13#10+
         '     AND D.ID_DOMICILIO = P.ID_DOMICILIO'#13#10+
         '     AND POB.CVE_POBLACION = D.CVE_ESTADO'#13#10
         );

  If Assigned(QryDatosEmisor) Then
   With QryDatosEmisor Do
    Try
     // Sustituye los Valores del cuerpo del Email por los Datos del Emisor
     strCUERPO_EMAIL := ReplaceAllStr(strCUERPO_EMAIL,'<*ATENCION*>',strAtencion);
     strCUERPO_EMAIL := ReplaceAllStr(strCUERPO_EMAIL,'<*NOMBRE*>',FieldByName('NOMBRE').AsString);
     strCUERPO_EMAIL := ReplaceAllStr(strCUERPO_EMAIL,'<*CALLE_NUMERO*>',FieldByName('CALLE_NUMERO').AsString);
     strCUERPO_EMAIL := ReplaceAllStr(strCUERPO_EMAIL,'<*CODIGO_POSTAL*>',FieldByName('CODIGO_POSTAL').AsString);
     strCUERPO_EMAIL := ReplaceAllStr(strCUERPO_EMAIL,'<*COLONIA*>',FieldByName('COLONIA').AsString);
     strCUERPO_EMAIL := ReplaceAllStr(strCUERPO_EMAIL,'<*DESC_POBLACION*>',FieldByName('DESC_POBLACION').AsString);
     strCUERPO_EMAIL := ReplaceAllStr(strCUERPO_EMAIL,'<*FECHA*>',FormatDateTime('mmmm dd, yyyy',Date));
     strCUERPO_EMAIL := ReplaceAllStr(strCUERPO_EMAIL,'<*MENSAJE_ADICIONAL*>',strMensaje_Adicional);
     strCUERPO_EMAIL := ReplaceAllStr(strCUERPO_EMAIL,'<*CHEQUERA*>',vgCheq);
     strCUERPO_EMAIL := ReplaceAllStr(strCUERPO_EMAIL,'<*PROVEEDOR*>',vgProv);
     strCUERPO_EMAIL := ReplaceAllStr(strCUERPO_EMAIL,'<*CLABE*>',vgCLABE);

     // Sustituye la etiqueta de representantes si es que tiene
     If (SearchStr('<*REPRESENTANTES*>',strCUERPO_EMAIL) > 0) Then
      strCUERPO_EMAIL := ReplaceAllStr(strCUERPO_EMAIL,'<*REPRESENTANTES*>',ObtenPersonas(C_REPRESENTANTE));

     // Sustituye la etiqueta de representantes si es que tiene
     If (SearchStr('<*TESTIGOS*>',strCUERPO_EMAIL) > 0) Then
      strCUERPO_EMAIL := ReplaceAllStr(strCUERPO_EMAIL,'<*TESTIGOS*>',ObtenPersonas(C_TESTIGO));
    Finally
     Close; Free;
    End
  Else
   Begin
   Result   := 2;
   strError := 'ERROR al obtener los Datos del Emisor = '+IntToStr(nId_Emisor);
   Exit;
   End;
end;


function Obten_NombreAcreditado(nId_Credito : Integer; Apli : TInterApli) : String;
var Qry : TQuery;
begin
 Result := '';
 If Assigned(Apli) Then
  Begin
  Qry := TQuery.Create(Nil);
  If Assigned(Qry) Then
   With Qry Do
    Try
     SessionName  := Apli.SessionName;
     DataBAseName := Apli.DataBaseName;
     SQL.Clear;
     SQL.Add(
             ' SELECT (PF.NOMBRE_PERSONA || '' '' || PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO || PM.NOM_RAZON_SOCIAL) AS NOMBRE'#13#10+
             ' FROM CR_CREDITO CC,'#13#10+
             '      CONTRATO CTO,'#13#10+
             '      PERSONA_FISICA PF,'#13#10+
             '      PERSONA_MORAL PM'#13#10+
             ' WHERE CC.ID_CREDITO = '+IntToStr(nId_Credito)+#13#10+
             '   AND CTO.ID_CONTRATO = CC.ID_CONTRATO'#13#10+
             '   AND PF.ID_PERSONA (+)= CTO.ID_TITULAR'#13#10+
             '   AND PM.ID_PERSONA (+)= CTO.ID_TITULAR'#13#10
             );
     Open;
     Result := FieldByName('NOMBRE').AsString;
    Finally
     Free;
    End;
  End;
end;

function Obten_Contrato(nId_Credito : Integer; Apli : TInterApli) : Integer;
var Qry : TQuery;
begin
 Result := 0;
 If Assigned(Apli) Then
  Begin
  Qry := TQuery.Create(Nil);
  If Assigned(Qry) Then
   With Qry Do
    Try
     SessionName  := Apli.SessionName;
     DataBAseName := Apli.DataBaseName;
     SQL.Clear;
     SQL.Add(
             ' SELECT ID_CONTRATO'#13#10+
             ' FROM CR_CREDITO'#13#10+
             ' WHERE ID_CREDITO = '+IntToStr(nId_Credito)
            );
     Open;
     Result := FieldByName('ID_CONTRATO').AsInteger;
    Finally
     Free;
    End;
  End;
end;
(******************************************************************************)

(************************* CONVERSION MESES/AÑOS A DIAS ***********************)
(*                  Funcion que convierte los años y meses a días             *)
(******************************************************************************)
Function ConvierteADias(pTipo : String; pNumMesAno: Integer): Integer;
var vlConvDias  : Integer;
    Msg         : String;
Begin
   Msg := '';
   vlConvDias := 0;
   If pTipo = CANO then
      Begin
         if ValNumPositivo(Msg,pNumMesAno) then
            vlConvDias :=  (PNumMesAno * 360)
         else ShowMessage(Msg);
      end
   else if pTipo = CMES then
      Begin
         if ValNumPositivo(Msg,pNumMesAno) then
            vlConvDias :=  (PNumMesAno * 30)
         else ShowMessage(Msg);
      end;
   ConvierteADias := vlConvDias;
end;

(************************* obtiene los folios  ***********************)
(*                  Funcion que Obtiene el folio qre mesuerido             *)
(******************************************************************************)

Function ObtenFolio(pCveFolio : String; pMsg : String; MiApli : TInterApli): Integer;
var     STPObtFolios : TStoredProc;
        vlFolio     : Integer;
Begin
     vlFolio := 0;
     STPObtFolios := TStoredProc.Create(Nil);
     try
       with STPObtFolios do
       begin
          DatabaseName:= MiApli.DatabaseName;
          SessionName:= MiApli.SessionName;
          StoredProcName:='PKGCRACTUALIZA.STPOBTENFOLIO';

          Params.Clear;
          Params.CreateParam(ftFloat,'PEIDEMPRESA',ptInput);
          Params.CreateParam(ftString,'PECVEFOLIO',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Params.CreateParam(ftFloat,'RESULT',ptResult);
          //
          ParamByName('PEIDEmpresa').AsInteger := MiApli.IdEmpresa;
          ParamByName('PECVEFolio').AsString := pCveFolio;
          ParamByName('PEBCommit').AsString := 'V';

          ExecProc;

          if (ParamByName('PSResultado').AsInteger = 0) then
          begin
               vlFolio := ParamByName('Result').AsInteger;
          end
          else
               ShowMessage('PROBLEMAS AL OBTENER EL ' + pMsg + ' : ' + ParamByName('PSTXRESULTADO').AsString +
               IntToStr(ParamByName('PSResultado').AsInteger));
          //end if;
       end;
     finally
            STPObtFolios.Free;
     end;
     ObtenFolio:= vlFolio;
end;


//cuenta el numero de registros marcados en un SgControl
Function CountSelec(sgcDatos : TSGCtrl; vlCol : String) : Integer;
var count  : Integer;
    nRow   : Integer;
Begin
   count := 0;
   For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do
      if (sgcDATOS.CellStr[vlCol,nRow] = 'SI' + #30 + '>C') then
         count := count + 1;
      //end if
   CountSelec := count;
end;

// Función que recibe una cadena y devuelve un double
function CurrFromFrmFloat(FrmFloat: String): Double;
var c : variant;
begin
  result := 0;
  try
    if FrmFloat <> '' then
    begin
      c      := FrmFloat;
      result := currency(c);
    end;//ends_if
  except
    result := 0;
  end;//ends_try..except
end;//ends_function

procedure AddLine(MiMemo: TMemo; peLinea: string);
begin
  MiMemo.Lines.Add(peLinea);
end;

procedure AddLineQr(MiMemo: TQRMemo; peLinea: string);
begin
  MiMemo.Lines.Add(peLinea);
end;

Procedure messageIniFinProceso(MiMemo: TMemo; pIndic : String);
Begin
   if pIndic = CINICIO then
   Begin
         AddLine(MiMemo,'====================================================');
         AddLine(MiMemo,'***                 INICIA PROCESO               ***');
         AddLine(MiMemo,'    Hora inicio:' + TimeToStr(Time));
   end
   else
   Begin
         AddLine(MiMemo,'    Hora Final:' + TimeToStr(Time));
         AddLine(MiMemo,'***               TERMINA PROCESO                ***');
         AddLine(MiMemo,'====================================================');
   end;
end;


function  ObtenRiesgoAcumulado(peEmisor,peProveedor : String; MiApli : TInterApli) : Double;
var vlSql         : String;
    vlRiesAcum    : String;
Begin
   vlSql := 'SELECT PKGCRPERIODO.StpObtRiesgoAcum( '+ peEmisor + ' , ' + peProveedor +') RIESGO_ACUM FROM DUAL';
   GetSqlStr(vlSqL,MiApli.DataBaseName,MiApli.SessionName,'RIESGO_ACUM',vlRiesAcum,False);
   if vlRiesAcum = '' then
      vlRiesAcum := '0';
   //end if
   ObtenRiesgoAcumulado := StrToFloat(vlRiesAcum);
end;
{
 valida que una cadena sea de tipo dinero.
}
function IsFloat(pValStr : String): Boolean;
var vlResult: Boolean;
    vlFloat   : Double;
Begin
   vlResult := True;
   Try
      vlFloat := StrToFloat(pValStr);
   except
      vlResult := False;
   end;
   IsFloat := vlResult;
end;
///EVENTOS

Procedure GenMsg(PPMsg : String; pApli: TInterApli);
var StpEventos :  TStoredProc;
    VLRes      :  Integer;
Begin
    StpEventos := TStoredProc.Create(Nil);
    try
       with StpEventos do
       begin
          StpEventos.DatabaseName:=   pApli.DatabaseName;
          StpEventos.SessionName:= pApli.SessionName;
          StpEventos.StoredProcName:='PKGSUCESOS.STPALTAEVENTOS';
          Params.Clear;
          Params.CreateParam(ftString,'PE_EOCVEEV',ptInput);
          Params.CreateParam(ftString,'PE_EOCVEUS',ptInput);
          Params.CreateParam(ftDate,'PE_EOFHEV',ptInput);
          Params.CreateParam(ftString,'PE_EOCVEUSGE',ptInput);
          Params.CreateParam(ftString,'PE_EOCVEAP',ptInput);
          Params.CreateParam(ftString,'PE_EODESEV',ptInput);
          Params.CreateParam(ftString,'PE_EOCVEFU',ptInput);
          Params.CreateParam(ftString,'PE_EUBREV',ptInput);
          Params.CreateParam(ftString,'PE_CVERELSUC',ptInput);
          Params.CreateParam(ftString,'PE_COMMROLB',ptInput);
          Params.CreateParam(ftString,'PE_BORRAMESSG',ptInput);
          Params.CreateParam(ftFloat,'PS_VLRESI',ptInputOutput);
          Prepare;
          ParamByName('PE_EOCveEv').AsString := 'ICRE01';
//          ParamByName('PE_EOCveUs').AsString := ;
          ParamByName('PE_EOFHev').AsDate := Now;
          ParamByName('PE_EOCveUsGe').AsString := 'INETUSR';
          ParamByName('PE_EOCveAp').AsString := 'ICRE01';
          ParamByName('PE_EODesEv').AsString := PPMsg;
//          ParamByName('PE_EOCveFu').AsString := ;
          ParamByName('PE_EUBRev').AsString := 'V';
          ParamByName('PE_CveRelSuc').AsString := 'EVENTO';
          ParamByName('PE_CommRolb').AsString := 'V';
          ParamByName('PE_BorraMessg').AsString := 'F';
          ExecProc;
          VLRes := ParamByName('PS_vlresi').AsInteger;
          if VLRes <> 0 then
          Begin
             ShowMessage('PROBLEMAS EN MSG: ' + IntToStr(VLRes));//ParamByName('psRESULTADO').AsString);
//             ShowMessage(ParamByName('psTxResultado').AsString);
          end;
          UnPrepare;
       end;
    finally
       StpEventos.Free;
    end;
end;

{----------------------------------------------------------------------------------------------------------------------
                                        Reactivación de Transacciones
-----------------------------------------------------------------------------------------------------------------------}
Procedure StpReactivaSegui(pTransaccion, pGrupo, pCveSegto, pTxInstr : String;
            pFechaCob : TdateTime; MiApli : TInterApli; var psTransaccion : Integer );
var StpReactivaSegui :  TStoredProc;
Begin
    StpReactivaSegui := TStoredProc.Create(Nil);
    try
       with StpReactivaSegui do
       begin
          StpReactivaSegui.DatabaseName:= MiApli.DatabaseName;
          StpReactivaSegui.SessionName:= MiApli.SessionName;
          StpReactivaSegui.StoredProcName:='PKGCRCREDITO.STPREACTIVASEGTO';

          Params.Clear;
          Params.CreateParam(ftDate,'PEFCOBRANZA',ptInput);
          Params.CreateParam(ftString,'PEIDSEGUIMIENTO',ptInput);
          Params.CreateParam(ftInteger,'PEIDGRUPOPAGO',ptInput);
          Params.CreateParam(ftInteger,'PEIDEMPRESA',ptInput);
          Params.CreateParam(ftString,'PECVEUSUARIO',ptInput);
          Params.CreateParam(ftString,'PECVESEGUIMIENTO',ptInput);
          Params.CreateParam(ftString,'PETXDESCINSTRUC',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSIDSEGUIMIENTO',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peFCobranza').AsDateTime := pFechaCob;
          ParamByName('peIdSeguimiento').AsString := pTransaccion;
          ParamByName('peIdGrupoPago').AsString := pGrupo;
          ParamByName('peIdEmpresa').AsInteger := MiApli.IdEmpresa;
          ParamByName('peCveUsuario').AsString := MiApli.Usuario;
          ParamByName('peCveSeguimiento').AsString := pCveSegto;
          ParamByName('peTxDescInstruc').AsString  := pTxInstr;
          ParamByName('peBCommit').AsString := CVERDAD;
          ExecProc;
          psTransaccion := ParamByName('PSIDSEGUIMIENTO').AsInteger;
          if ParamByName('PSResultado').AsInteger <> 0 then
          Begin
             ShowMessage('PROBLEMAS EN LA REACTIVACION: ' +
                         ParamByName('psRESULTADO').AsString);
             ShowMessage(ParamByName('psTxResultado').AsString);
          end;
          UnPrepare;
       end;
    finally
       StpReactivaSegui.Free;
    end;
end;


function textcorre(pstring: String): String;
var vlCadena: String;
    I : Integer;
begin
   vlCadena := '';
  for I := 1 to Length(pString) do
  Begin
     if (pString[I] = #$D) or (pString[I] = #$A) or (pString[I] = #13) or (pString[I] = #10) then
        vlCadena := vlCadena + coCRLF
     else
        vlCadena := vlCadena  + pString[I];
  end;
  textcorre := vlCadena;
end;
{-----------------------------------------------------------------------------------------------------------------------
   Conversión de fecha a hora
------------------------------------------------------------------------------------------------------------------------}

function ConverFechaAHora(pFecha : TDateTime) : integer;
var
  Hora, Min, Sec, MSec: Word;
  vlHora : string;
begin
  DecodeTime(pFecha, Hora, Min, Sec, MSec);
  vlHora := FormatFloat('00',Hora) + FormatFloat('00',Min) + FormatFloat('00',Sec);
  Result := StrtoInt(vlHora);
end;

function EnviaMailInternet(vlApli : TInterApli; strSubject, strEmail, strTo : String; strFileName : String = '') : Boolean;

  function ObtenDatosDeEnvio(var strCVE_CTA_MAIL_ENV, strCVE_NOM_MAIL_ENV : String) : Boolean;
  var Qry : TQuery;
  begin
   Result := False;
   Qry := TQuery.Create(Nil);
   strCVE_CTA_MAIL_ENV := '';
   strCVE_NOM_MAIL_ENV := '';

   If Assigned(Qry) Then
    With Qry Do
     Try
      DataBaseName := vlApli.DataBaseName;
      SessionName := vlApli.SessionName;
      SQL.Clear;
      //SQL.Add(' SELECT CVE_CTA_MAIL_ENV, CVE_NOM_MAIL_ENV FROM CR_PARAMETRO WHERE CVE_PARAMETRO = ''CRE''');
      //SASG4921 12/10/2015 No existe pantalla de CR_PARAMETRO para cambiar el correo de envío.
      //Se cambia por la tabla CR_GRUPO_CLAVE para un mejor control.
      SQL.Add(
      '  select '#13#10+
      '  (select VALOR from CR_GRUPO_CLAVE where CVE_GRUPO_CLAVE=''NOTIF'' and CVE_REFERENCIA=''NOMBRE'') || '' '' || '#13#10+
      '  (select VALOR from CR_GRUPO_CLAVE where CVE_GRUPO_CLAVE=''NOTIF'' and CVE_REFERENCIA=''PATERNO'') || '' '' ||  '#13#10+
      '  (select VALOR from CR_GRUPO_CLAVE where CVE_GRUPO_CLAVE=''NOTIF'' and CVE_REFERENCIA=''MATERNO'') AS CVE_NOM_MAIL_ENV, '#13#10+
      '  (select VALOR from CR_GRUPO_CLAVE where CVE_GRUPO_CLAVE=''NOTIF'' and CVE_REFERENCIA=''EMAIL'') AS CVE_CTA_MAIL_ENV '#13#10+
      '  from dual '#13#10
      );
      Open;
      strCVE_CTA_MAIL_ENV := FieldByName('CVE_CTA_MAIL_ENV').AsString;
      strCVE_NOM_MAIL_ENV := FieldByName('CVE_NOM_MAIL_ENV').AsString;
      If (Trim(strCVE_CTA_MAIL_ENV) = '') Or (Trim(strCVE_NOM_MAIL_ENV) = '') Then
       ShowMessage('Falta configurar los datos de Envio Correos en CR_PARAMETRO.'#13#10+
                   'Favor de comunicarse con SISTEMAS')
      Else
       Result := True;
     Finally
      Close;
      Free;
     End;
  end;

  function ObtenServidorEmail(var strIP : String) : Boolean;
  var strSql : String;
      bResult : Boolean;
  begin
   strSql := 'SELECT TX_QUERY_DATA FROM EMAIL_MSG WHERE CVE_MSG = ''ENV_MSG'' AND B_BLOQUEADO = ''V''';
   GetSqlStr(strSql, vlApli.DataBaseName, vlApli.SessionName, 'TX_QUERY_DATA', strIP, False);
   bResult := (Trim(strIP) <> '');
   If Not bResult Then ShowMessage('Falta configurar la IP del Correo en EMAIL_MSG'#13#10+
                                   'Favor de comunicarse con sistemas');
   Result := bResult;
  end;

var aBody, aTo : TArrayString;
    I, nCountBody, nCountTo : Integer;
    strCVE_CTA_MAIL_ENV, strCVE_NOM_MAIL_ENV, strIP : String;

    NMSMTP1 : TNMSMTP;
begin
  Result := False;
  nCountTo   := ParseStr(aTo, strTo, C_SEPARATOR_MAIL);
  nCountBody := ParseStr(aBody, strEmail, #10);
  NMSMTP1 := TNMSMTP.Create(Nil);
  If Assigned(NMSMTP1) Then
    With NMSMTP1 Do
     Try

     // Si no obtiene los datos para enviar la información NO CONTINÚA
     If Not ObtenDatosDeEnvio(strCVE_CTA_MAIL_ENV, strCVE_NOM_MAIL_ENV)
        Or Not ObtenServidorEmail(strIP) Then
      Begin
      Result := False;
      Exit; // Se sale de la función
      End
     Else
      Result := True;

     Host        :=  strIP;
     Port        :=  25;
     ReportLevel :=  0;
     EncodeType  :=  uuMime;
     ClearParams :=  True;
     SubType     :=  mtPlain;
     Charset     := 'OEM_CHARSET';
     Connect;

     PostMessage.FromAddress:= strCVE_CTA_MAIL_ENV;
     PostMessage.FromName := strCVE_NOM_MAIL_ENV;

     PostMessage.ToAddress.Clear;
     For I := 0 To nCountTo-1 Do
      PostMessage.ToAddress.Add(aTo[I]);

     PostMessage.Body.Clear;
     For I := 0 To nCountBody-1 Do
      PostMessage.Body.Add(aBody[I]);

     If (Trim(strFileName) <> '') Then
      If FileExists(strFileName) Then
        PostMessage.Attachments.Add(strFileName);

     PostMessage.Subject := strSubject;
     PostMessage.Date := FormatDateTime('dd/mm/yyyy hh:nn am/pm',Now);
     SubType := mtPlain;  // SubType:=mtHTML;
     SendMail;
     Disconnect;
     Except
      Result := False;
     End;

  If Assigned(NMSMTP1) Then NMSMTP1.Free;
end;
{-----------------------------------------------------------------------------------------------------------------------
        Obtiene la lqiuidación correspondiente a la moneda
------------------------------------------------------------------------------------------------------------------------}
function  ObtLiqMoneda(pMoneda : String; pApli: TInterApli): String;
var vlsql       : string;
    vlLiqMoneda : string;
begin
   vlsql := ' SELECT DISTINCT(CVE_LIQ_CHQRA) LIQ_MONEDA ' +
            ' FROM   CR_REL_LIQ_MON ' +
            ' WHERE CVE_MONEDA =    ' + SQLStr(pMoneda) +
            ' GROUP BY CVE_LIQ_CHQRA';
   GetSQLStr(vlsql,pApli.DataBaseName,pApli.SessionName,'LIQ_MONEDA', vlLiqMoneda, False);
   Result := vlLiqMoneda;
end;

function  ObtTipoCambio(pFecha: TDate; pMoneda,pDataBaseName, pSessionName: String): Double;
var  vlTipoCambio : string;
     vlsql        : string;
Begin
   vlsql := ' SELECT ' +
            ' NVL( PKGCORPO.OBTTIPOCAMBIO ( ' + SQLFecha( pFecha ) + ' , ' +
                                                pMoneda    + ' , ' + SQLStr( CVERDAD ) + ' ), 1 ) TIPO_CAMBIO' +
            ' FROM   DUAL ' ;

   GetSQLStr(vlsql,pDataBaseName,pSessionName,'TIPO_CAMBIO', vlTipoCambio, False);
   if vlTipoCambio = CNULL then
      vlTipoCambio := '1';
   //end if
   Result := StrToFloat(vlTipoCambio);
end;
//Obtiene la Fecha de acuerdo a un a clave de dia de liquidación
function  ObtFechaMesAnt( pCveDiaLiq: String; pApli: TInterApli): TDate;
var vlsql        : String;
    vlFechaLiq  : String;
Begin
   vlsql := 'SELECT PKGCRCOMUN.STPOBTENFECHA(2,' + SQLStr( pCveDiaLiq ) + ') FECHA_LIQ FROM DUAL ';
   GetSQLStr(vlsql,pApli.DataBaseName,pApli.SessionName,'FECHA_LIQ',vlFechaLiq,False);
   ObtFechaMesAnt := StrToDate(vlFechaLiq);
end;

{----------------------------------------------------------------------------------------------------------------------
                                        VALIDA PERFIL USUARIO A AUTORIZAR
----------------------------------------------------------------------------------------------------------------------
Procedure ValidaPerfil(pApli: TInterApli; var vlBAutoriza, vlBCancela: Boolean);
Var vlResultado     : Boolean;
    stpValidaPerfil : TStoredProc;
    begin
    vlResultado := True;
    stpValidaPerfil := TStoredProc.Create(Nil);
    try
       with stpValidaPerfil do
       begin
          stpValidaPerfil.DatabaseName:= pApli.DatabaseName;
          stpValidaPerfil.SessionName:= pApli.SessionName;
          stpValidaPerfil.StoredProcName:='PKGCRPERIODO.STPVALIDAPERFIL';

          Params.Clear;
          Params.CreateParam(ftString,'PECVEUSUAR',ptInput);
          Params.CreateParam(ftString,'PECVEAPLI',ptInput);
          Params.CreateParam(ftInteger,'PEIDEMPRESA',ptInput);
          Params.CreateParam(ftString,'PECVEINDADIC',ptInput);
          Params.CreateParam(ftString,'PSBVALIMPCES',ptOutput);
          Params.CreateParam(ftFloat,'PSIMPMAXAUTCES',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peCveUsuar').AsString := pApli.Usuario;
          ParamByName('peCveApli').AsString := pApli.Apli;
          ParamByName('peIdEmpresa').AsInteger := pApli.IdEmpresa;
          ParamByName('peCveIndAdic').AsString := pApli.Indicador;
          ExecProc;

          if ParamByName('PSResultado').AsInteger <> 0 then
          begin
             vlResultado := False;
             MessageDlg(ParamByName('psRESULTADO').AsString + ': ' + ParamByName('psTxResultado').AsString ,
                                mtInformation, [mbOK], 0  );
          end;
          vlBValImpCes := ParamByName('psBValImpCes').AsString;
          vlImpMaxAutCes := ParamByName('psImpMaxAutCes').AsFloat;
          UnPrepare;
       end;
    finally
       stpValidaPerfil.Free;
    end;
    ValidaPerfil := vlResultado;
end;}
{----------------------------------------------------------------------------------------------------------------------
                                        DAME INICIO MES
----------------------------------------------------------------------------------------------------------------------}
function DameIniMes(pFecha : TDateTime) : TDateTime;
var
  Dia, Mes, Anio : word;
begin
  DecodeDate(pFecha,Anio,Mes,Dia);
  Dia := 1;
  Result := EncodeDate(Anio,Mes,Dia);
end;
{----------------------------------------------------------------------------------------------------------------------
                                        DAME FIN MES
----------------------------------------------------------------------------------------------------------------------}
function DameFinMes(pFecha : TDateTime) : TDateTime;
var
  Dia, Mes, Anio : word;
  FechaTemp : TDateTime;
begin
  DecodeDate(pFecha,Anio,Mes,Dia);
  Dia := 1;
  Mes := Mes + 1;
  if Mes = 13 then
  begin
    Mes := 1;
    Anio := Anio + 1;
  end;
  FechaTemp := EncodeDate(Anio,Mes,Dia);
  Result := FechaTemp - 1;
end;

{----------------------------------------------------------------------------------------------------------------------
                                        VALIDA PERFIL USUARIO A AUTORIZAR
----------------------------------------------------------------------------------------------------------------------}
function ValidaPerfilUsuario(Apli : TInterApli;
                                       Var vsBImpDisp: String; vsImpMaxAut : Double ): Boolean;
Var vlResultado     : Boolean;
    stpValidaPerfil : TStoredProc;
    begin
    vlResultado := True;
    stpValidaPerfil := TStoredProc.Create(Nil);
    try
       with stpValidaPerfil do
       begin
          stpValidaPerfil.DatabaseName:= Apli.DatabaseName;
          stpValidaPerfil.SessionName:= Apli.SessionName;
          stpValidaPerfil.StoredProcName:='PKGCRPERIODO.STPVALIDAPERFIL';

          Params.Clear;
          Params.CreateParam(ftString,'PECVEUSUAR',ptInput);
          Params.CreateParam(ftString,'PECVEAPLI',ptInput);
          Params.CreateParam(ftInteger,'PEIDEMPRESA',ptInput);
          Params.CreateParam(ftString,'PECVEINDADIC',ptInput);
          Params.CreateParam(ftString,'PSBVALIMPCES',ptOutput);
          Params.CreateParam(ftFloat,'PSIMPMAXAUTCES',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peCveUsuar').AsString := Apli.Usuario;
          ParamByName('peCveApli').AsString := Apli.Apli;
          ParamByName('peIdEmpresa').AsInteger := Apli.IdEmpresa;
          ParamByName('peCveIndAdic').AsString := Apli.Indicador;
          ExecProc;

          if ParamByName('PSResultado').AsInteger <> 0 then
          begin
             vlResultado := False;
          end;
          vsBImpDisp := ParamByName('psBValImpCes').AsString;
          vsImpMaxAut := ParamByName('psImpMaxAutCes').AsFloat;
          UnPrepare;
       end;
    finally
       stpValidaPerfil.Free;
    end;
    ValidaPerfilUsuario := vlResultado;
end;
{----------------------------------------------------------------------------------------------------------------------
                                        VALIDA PERFIL USUARIO A CANCELAR
----------------------------------------------------------------------------------------------------------------------}
function ValCanPerfilUsu(Apli : TInterApli): Boolean;
Var vlResultado     : Boolean;
    stpValCanPerUsu : TStoredProc;
begin
    vlResultado := True;
    stpValCanPerUsu := TStoredProc.Create(Nil);
    try
       with stpValCanPerUsu do
       begin
          stpValCanPerUsu.DatabaseName:= Apli.DatabaseName;
          stpValCanPerUsu.SessionName:= Apli.SessionName;
          stpValCanPerUsu.StoredProcName:='PKGCRPERIODO.STPVALPERFILCANC';

          Params.Clear;
          Params.CreateParam(ftString,'PECVEUSUAR',ptInput);
          Params.CreateParam(ftString,'PECVEAPLI',ptInput);
          Params.CreateParam(ftInteger,'PEIDEMPRESA',ptInput);
          Params.CreateParam(ftString,'PECVEINDADIC',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peCveUsuar').AsString := Apli.Usuario;
          ParamByName('peCveApli').AsString := Apli.Apli;
          ParamByName('peIdEmpresa').AsInteger := Apli.IdEmpresa;
          ParamByName('peCveIndAdic').AsString := Apli.Indicador;
          ExecProc;

          if ParamByName('PSResultado').AsInteger <> 0 then
          begin
             vlResultado := False;
          end;
          UnPrepare;
       end;
    finally
       stpValCanPerUsu.Free;
    end;
    ValCanPerfilUsu := vlResultado;
end;

function ValTramites(pIdReferencia,pCveMedio : String; Apli : TInterApli; Var pMensaje : String): Boolean;
Var vlResultado     : Boolean;
    stpValtramites : TStoredProc;
begin
    vlResultado := True;
    pMensaje := '';
    stpValtramites := TStoredProc.Create(Nil);
    try
       with stpValtramites do
       begin
          stpValtramites.DatabaseName:= Apli.DatabaseName;
          stpValtramites.SessionName:= Apli.SessionName;
          stpValtramites.StoredProcName:='PKGCRPERIODO.SPTVALIDATRAMITE';

          Params.Clear;
          Params.CreateParam(ftInteger,'PEIDEMPRESA',ptInput);
          Params.CreateParam(ftString,'PEIDREFERENCIA',ptInput);
          Params.CreateParam(ftInteger,'PECVEMEDIO',ptInput);
          Params.CreateParam(ftInteger,'PSNUMTRAMNOAU',ptOutput);
          Params.CreateParam(ftString,'PSMENSAJE',ptOutput);

          Prepare;
          ParamByName('peIdEmpresa').AsInteger := Apli.IdEmpresa;
          ParamByName('peIdReferencia').AsString := pIdReferencia;
          ParamByName('peCveMedio').AsString := pCveMedio;
          ExecProc;

          if ParamByName('psNumTramNoAU').AsInteger <> 0 then
          begin
             pMensaje := ParamByName('psMensaje').AsString;
             vlResultado := False;
          end;
          UnPrepare;
       end;
    finally
       stpValtramites.Free;
    end;
    ValTramites := vlResultado;
end;
{----------------               OBTIENE PORCENTAJE DE COMISION          ------------------------}
function StpPctIVA(pIdCto, pIdCredito: Integer; pImpCred: Double; Apli : TInterApli): Double;
Var vlResultado : Double;
    tstpPctIVA  : TStoredProc;
begin
    vlResultado := 0;
    tstpPctIVA := TStoredProc.Create(Nil);
    try
       with tstpPctIVA do
       begin
          tstpPctIVA.DatabaseName:= Apli.DatabaseName;
          tstpPctIVA.SessionName:= Apli.SessionName;
          tstpPctIVA.StoredProcName:='PKGCRCOMUN.STPOBTENPCTIVA';

          Params.Clear;
          Params.CreateParam(ftFloat,'PEIDCONTRATO',ptInput);
          Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftFloat,'PEMONTO',ptInput);
          Params.CreateParam(ftFloat,'PSPCTIVA',ptOutput);
          Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          Prepare;
          ParamByName('PEIDCONTRATO').AsInteger := pIdCto;
          ParamByName('PEIDCREDITO').AsInteger := pIdCredito;
          ParamByName('PEMONTO').AsFloat := pImpCred;
          ExecProc;

          if ParamByName('PSRESULTADO').AsInteger <> 0 then
          begin
             ShowMessage(ParamByName('psMensaje').AsString);
             vlResultado := 0;
          end
          else  vlResultado := ParamByName('PSPCTIVA').AsFloat;

          UnPrepare;
       end;
    finally
       tstpPctIVA.Free;
    end;
    StpPctIVA := vlResultado;
end;
{OBTIENE COMISION MAS IVA}
Function GenComisDisp(pImporte, pPctComis : Double; pIdCto, pIdCredito : Integer; Apli : TInterApli;
                      var vlSalida : Boolean; vlMsg : String): Double;
var vlImpComision : Double;
    vlImpComisIva : Double;
    vlImpPctIVA   : Double;
begin
     vlSalida := False;
     VLImpComision := round(pImporte * pPctComis) / 100;
     vlSalida := True;
     vlImpPctIVA   := StpPctIVA(pIdCto, pIdCredito, VLImpComision, Apli);
     vlImpComisIva := vlImpComision + (vlImpComision * ( vlImpPctIVA /100));
     GenComisDisp  := vlImpComisIva;
end;

procedure validaTasaFija(pCveTasa : String; Control : TInterEdit);
Begin
      if pCveTasa <> C_TASA_FIJA then
      Begin
         Control.Enabled := False;
         Control.Color := clBtnFace;
         Control.Text := '0';
      end
      else
      Begin Control.Enabled := True;
            Control.Color := clWindow;
      end;
End;

{----------------------------------------------------------------------------------------------------------------------
                SE OBTIENEN DATOS DE LA CHEQUERA SEGUN EL CASO EMISOR O PROVEEDOR
----------------------------------------------------------------------------------------------------------------------}
procedure ObtenChequeras(pIdCliente, pDisp: Integer; pCveEmisNafin,pCveTipoAcred,pCveTipoCheq,pMetodo : String;
                         Apli : TInterApli; var psIdBancoChqra : Integer; var psCuentaBanco : String);
var ObtenChequeras :  TStoredProc;
Begin
    ObtenChequeras := TStoredProc.Create(Nil);
    try
       with ObtenChequeras do
       begin
          ObtenChequeras.DatabaseName:= Apli.DatabaseName;
          ObtenChequeras.SessionName:= Apli.SessionName;
          ObtenChequeras.StoredProcName:='PKGCRPERIODO.STPOBTENCHQCTE';

          Params.Clear;
          Params.CreateParam(ftInteger,'PEIDCLIENTE',ptInput);
          Params.CreateParam(ftString,'PECVEEMISNAFIN',ptInput);
          Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftString,'PECVETIPOACRED',ptInput);
          Params.CreateParam(ftString,'PECVETIPOCHEQ',ptInput);
          Params.CreateParam(ftString,'PEMETODO',ptInput);
          Params.CreateParam(ftInteger,'PSIDBANCOCHQRA',ptOutput);
          Params.CreateParam(ftString,'PSCUENTABANCO',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peIdCliente').AsInteger := pIdCliente;
          ParamByName('PECveEmisNafin').AsString := pCveEmisNafin;
// RABA
          if pDisp = 0 then
             ParamByName('peIdCredito').Clear
          else
             ParamByName('peIdCredito').AsInteger := pDisp;
// FIN RABA
//          ParamByName('peIdCredito').AsInteger := pDisp;
          ParamByName('peCveTipoAcred').AsString := pCveTipoAcred;
          ParamByName('peCveTipoCheq').AsString := pCveTipoCheq;
          ParamByName('peMetodo').AsString := pMetodo;
          ExecProc;

          if ParamByName('PSResultado').AsInteger = 0 then
          begin
             psIdBancoChqra := ParamByName('PSIDBANCOCHQRA').AsInteger;
             psCuentaBanco := ParamByName('PSCUENTABANCO').AsString;
          end
          else // SI NO REALIZA LA CARGA MANDA ERRORES
          Begin
             ShowMessage('PROBLEMAS AL OBTENER LA CHEQUERA DEL EMISOR: ' +  IntToStr(pIdCliente) +
                         ParamByName('psRESULTADO').AsString);
             ShowMessage(ParamByName('psTxResultado').AsString);
          end;
          UnPrepare;
       end;
    finally
       ObtenChequeras.Free;
    end;
end;

// +---------------------------------------------------------------------------+
// +           Limpia la tabla temporal del reporte de recusos recibidos       +
// +---------------------------------------------------------------------------+
procedure ClearTblReport( Apli : TInterApli; var  vlError : String );
var  STPClearTbl  : TStoredProc;
Begin
  vlError := '';
  STPClearTbl := TStoredProc.Create(Nil);
  try
    with STPClearTbl do
    begin
      DatabaseName:= Apli.DatabaseName;
      SessionName:= Apli.SessionName;
      StoredProcName:= 'PKGCRSALDOS.STPCLEARTBLCTAS';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
      Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
      Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
      Prepare;
      ParamByName('peBCommit').AsString := 'V';
      ExecProc;
      if (ParamByName('PSResultado').AsInteger <> 0) then
      begin
        vlError := 'Problemas al limpiar tabla Temporal de cuentas: '          + coCRLF +
                   'Código : ' + ParamByName('psResultado').AsString   + coCRLF +
                   'Mensaje: ' + ParamByName('psTxResultado').AsString;
      end;
    end;
  finally
    STPClearTbl.Free;
  end;
end;
// +---------------------------------------------------------------------------+
// +           Obtiene en Letra el mes requerido de la Fecha                   +
// +---------------------------------------------------------------------------+
Function StrMesEncabRep( sFecha: String): String;
var vlMes, vlsMes : String;
begin
   vlMes := Copy(sFecha,4,2);
   IF vlMes = '01' THEN
     vlsMes := 'Enero'
   ELSE IF vlMes = '02' THEN
     vlsMes := 'Febrero'
   ELSE IF vlMes = '03' THEN
     vlsMes := 'Marzo'
   ELSE IF vlMes = '04' THEN
     vlsMes := 'Abril'
   ELSE IF vlMes = '05' THEN
     vlsMes := 'Mayo'
   ELSE IF vlMes = '06' THEN
     vlsMes := 'Junio'
   ELSE IF vlMes = '07' THEN
     vlsMes := 'Julio'
   ELSE IF vlMes = '08' THEN
     vlsMes := 'Agosto'
   ELSE IF vlMes = '09' THEN
     vlsMes := 'Septiembre'
   ELSE IF vlMes = '10' THEN
     vlsMes := 'Octubre'
   ELSE IF vlMes = '11' THEN
     vlsMes := 'Noviembre'
   ELSE IF vlMes = '12' THEN
     vlsMes := 'Diciembre';

   Result := vlsMes;
End;
// <LOLS 25 NOV 2005  SE INCORPORAN RUTINAS PARA EL PARSING DE CADENAS CONSIDERANDO EL MANEJO DEL TOKEN TEXTO>
function NumChars( Token : Char; StrSource : String ):Integer;
var i : integer;
begin
  result := 0;
  for i := 1 to length( StrSource ) do
    if StrSource[i] = Token then
       inc(result);
    //
  //
end;
//
function ParseQuotedString(var A : TArrayString; StrToParse : String; cSeparator : Char; cTexto : Char ) : Integer;
var CurChar   : Char;
    nLength   : Integer;
    nPos      : Integer;
    nInStr    : Integer;
    nItem     : Integer;
    bBalanceo : Boolean;
    sInStr    : String;
begin
  nPos  := 1;        // Inicializa la variable de posicion inicial
  nItem := 0;        // Inicializa el contador de numero de elementos
  SetLength( A, 0 ); // Limpia el array
  repeat
    CurChar   := StrToParse[nPos];
    if CurChar = cTexto then
    begin
      sInStr    := '';
      nInStr    := 1;
      bBalanceo := False;
      nLength   := Length(StrToParse);
      repeat
        sInStr := sInStr + StrToParse[nInStr];
        if NumChars(cTexto, sInStr ) mod 2 = 0 then       // Una vez que este balanceado el separador
        begin                                             // de texto, el siguiente caracter tiene que ser
          if ( nInStr  = nLength ) then                   // necesariamente un separador o final de cadena.
            bBalanceo := True
          else if StrToParse[nInStr + 1 ] = cSeparator then
            bBalanceo := True;
        end;
        //
        inc(nInStr);
      until ( bBalanceo = True ) or ( nInStr > nLength );
      //
      nLength   := length(sInStr);
      if nLength < length(StrToParse) then
      begin
         Delete( StrToParse, 1, nLength );
      end else
      begin
         StrToParse := '';
      end;//ends_if_nLength_<_length(StrToParse)_then_begin
      //
      // Quita el formato de texto, interno y externo
      if ( sInStr[1] = cTexto ) and ( sInStr[length(cTexto)] = cTexto ) then
      begin
        delete(sInStr, 1,              1 ); // Quita el primer elemento
        delete(sInStr, length(sInStr), 1 ); // Quita el último elemento
        sInStr := StringReplace( sInStr, cTexto + cTexto, cTexto, [rfIgnoreCase, rfReplaceAll] );
      end;
      //
    end else
    begin
      sInStr := '';
      nInStr := Pos( cSeparator, StrToParse );
      if nInStr = 0 then
      begin
        sInStr     := StrToParse;
        StrToParse := '';
      end  else
      begin
        sInStr := copy( StrToParse, 1, nInStr - 1 );
        if sInStr <> '' then
          delete( StrToParse, 1, length(sInStr) );
        //ends_if
      end;//if_nInStr_=_0_then
    end;
    //
    // Agrega un elemento mas a la lista
    inc(nItem);                // Incrementa el numero de item
    SetLength( A, nItem );     // Limpia el array
    A[ nItem - 1 ] := sInStr;  // Agrega el elemento al array
    //
    if StrToParse = cSeparator then
    begin
      inc(nItem);                // Incrementa el numero de item
      SetLength( A, nItem );     // Limpia el array
      A[ nItem - 1 ] := '';      // Agrega el elemento al array
      //<LOLS 24 ENE 2005.EVITA UN CICLO INFINITO>
      StrToParse     := '';      // LOLS
      //</LOLS>
    end else begin
      delete(StrToParse, 1, 1 );
    end;
  until Length(StrToParse) = 0;
  //
  Result := nItem;
end;
// </LOLS>

// <EASA 07 DIC 2005  SE INCORPORA RUTIRNA PAR VERIFICAR DISP IMPAGADAS DEL ACREDITADO>
function FindDispIM(pIdAcreditado : Integer; Apli : TInterApli; var pstrMensaje : String) : Boolean;
var StpDispIM : TStoredProc;
    vlsql : String;
    vlCount: String;
begin
    Result := False;
    pstrMensaje := '';
    vlsql := ' SELECT CTO.ID_TITULAR, MAX(C.TOTAL) TOTAL '+ coCRLF +
             ' FROM CR_CREDITO CR, CR_CESION CS,'+ coCRLF+
             '     ('+ coCRLF+
             '    SELECT ID_CREDITO, COUNT(*) TOTAL FROM CR_CAPITAL'+ coCRLF+
             '    WHERE SIT_CAPITAL = ''IM'' GROUP BY ID_CREDITO'+ coCRLF+
             '   UNION'+ coCRLF+
             '    SELECT ID_CREDITO, COUNT(*) TOTAL FROM CR_FINAN_ADIC'+ coCRLF+
             '    WHERE SIT_FINAN_ADIC = ''IM'' GROUP BY ID_CREDITO'+ coCRLF+
             '   UNION'+ coCRLF+
             '    SELECT ID_CREDITO, COUNT(*) TOTAL FROM CR_INTERES'+ coCRLF+
             '    WHERE SIT_INTERES = ''IM'' GROUP BY ID_CREDITO'+ coCRLF+
             '   UNION'+ coCRLF+
             '    SELECT ID_CREDITO, COUNT(*) TOTAL FROM CR_COMISION'+ coCRLF+
             '    WHERE SIT_COMISION = ''IM'' GROUP BY ID_CREDITO'+ coCRLF+
             '   )C,'+ coCRLF+
             '   CR_CONTRATO CCTO,'+ coCRLF+
             '   CONTRATO CTO, PERSONA P'+ coCRLF+
             ' WHERE CTO.ID_TITULAR    = ' + IntToStr(pIdAcreditado) + coCRLF+
             '   AND CR.SIT_CREDITO    NOT IN( ''CA'', ''LQ'')'+ coCRLF+
             '   AND CR.ID_CREDITO     = C.ID_CREDITO'+ coCRLF+
             '   AND CTO.ID_TITULAR    = P.ID_PERSONA'+ coCRLF+
             '   AND CCTO.ID_CONTRATO  = CR.ID_CONTRATO'+ coCRLF+
             '   AND CCTO.FOL_CONTRATO = CR.FOL_CONTRATO'+ coCRLF+
             '   AND CCTO.ID_CONTRATO  = CTO.ID_CONTRATO'+ coCRLF+
             '   AND CS.ID_CESION(+)   = CR.ID_CREDITO'+ coCRLF+
             ' GROUP BY CTO.ID_TITULAR'+ coCRLF;

   GetSQLStr(vlsql,Apli.DataBaseName,Apli.SessionName,'TOTAL',vlCount,False);
   IF vlCount = '' THEN vlCount := '0';
   If (StrToInt(vlCount) <> 0) Then
       pstrMensaje := 'El acreditado Tiene Periodos Impagados'
   Else
       Result := True;
end;
// </EASA>

// <EASA 14 AGO 2007  SE INCORPORA RUTIRNA PAR VERIFICAR DISP IMPAGADAS POR PROVEEDOR>
function FindDispIMPProv(pIdproveedor : Integer; Apli : TInterApli; var pstrMensaje : String) : Boolean;
var vlsql : String;
    vlCount: String;
begin
  Result := False;
  pstrMensaje := '';
    vlsql := ' SELECT CS.ID_PROVEEDOR, MAX(C.TOTAL) TOTAL '+
             ' FROM CR_CESION CS,'+
             '     ('+
             '    SELECT ID_CREDITO, COUNT(*) TOTAL FROM CR_CAPITAL'+
             '    WHERE SIT_CAPITAL = ''IM'' GROUP BY ID_CREDITO'+
             '   UNION'+
             '    SELECT ID_CREDITO, COUNT(*) TOTAL FROM CR_FINAN_ADIC'+
             '    WHERE SIT_FINAN_ADIC = ''IM'' GROUP BY ID_CREDITO'+
             '   UNION'+
             '    SELECT ID_CREDITO, COUNT(*) TOTAL FROM CR_INTERES'+
             '    WHERE SIT_INTERES = ''IM'' GROUP BY ID_CREDITO'+
             '   UNION'+
             '    SELECT ID_CREDITO, COUNT(*) TOTAL FROM CR_COMISION'+
             '    WHERE SIT_COMISION = ''IM'' GROUP BY ID_CREDITO'+
             '   )C'+
             ' WHERE CS.ID_PROVEEDOR   = ' + IntToStr(pIdProveedor) +
             '   AND CS.ID_CESION     = C.ID_CREDITO'+
             '   AND CS.SIT_CESION    NOT IN( ''CA'', ''LQ'')'+
             ' GROUP BY CS.ID_PROVEEDOR';
   GetSQLStr(vlsql,Apli.DataBaseName,Apli.SessionName,'TOTAL',vlCount,False);
   IF vlCount = '' THEN vlCount := '0';
   If (StrToInt(vlCount) <> 0) Then
       pstrMensaje := 'El proveedor '+IntToStr(pIdProveedor) +'Tiene Periodos Impagados'
   Else
       Result := True;
end;
// </EASA>

//<LOLS 16 ENE 2005. RUTINA QUE LEE DE CR_GRUPO_CLAVE EL CAMPO VALOR CON BASE EN LA CLAVE Y EL PARAMETRO>
function StrToHex( sCadena : String ) : String;
var i : integer;
begin
  result := '';
  for i := 1 to length( sCadena ) do
    result := result + IntToHex( Ord(sCadena[i]), 2 );
  //
end;
//
function HexToStr( sCadena : String ) : String;
begin
  result := '';
  while sCadena <> '' do
  begin
    result := result + Chr( StrToInt('$' + Copy( sCadena, 1, 2 ) ) );
    delete( sCadena, 1, 2 );
  end;
end;
//
function BoolToStr( peValor : Boolean ) : String;
begin
  if peValor then result := 'V' else result := 'F';
end;
//
function StrToBool(peValor: String): Boolean;
begin
  result := ( peValor = 'V' );
end;
//
function obtValorGpoCve(sGpoCve, sParam : String; Apli : TInterApli ) : String;
var sSqlCad : String;
begin
  Result  := '';
  sSqlCad := 'SELECT VALOR FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE = ' +
             SQLStr( sGpoCve ) + ' AND CVE_REFERENCIA = ' + SQLStr( sParam );
  GetSQLStr( sSqlCad, Apli.DataBaseName, Apli.SessionName, 'VALOR', Result, False );
end;
//
function ObtSendTo( sDate : String ) : String;
var
  Year, Month, Day: Word;
begin
  DecodeDate( StrToDate( sDate ), Year, Month, Day );
  result := Format('%s%.4d%s%.2d%s', [ '/', Year, '/', Month, '/' ] );
end;
//</LOLS>

// <EASA 20 MAR 2006 Rutina para obtener el tipo de cambio requerido por contabiliad
function ObtTipCambConta(pMoneda: String; pFecha : TDateTime; MiApli : TInterApli): Double;
var vlsql, vlTipoCambio : String;
    vlFecha : TDate;
Begin
  vlTipoCambio := '1';
  IF pMoneda = IntToStr(C_DLLS) THEN
     BEGIN
       vlFecha := DameFinMes(pFecha);
       vlsql := ' SELECT ' +
                ' NVL( PKGCORPO.OBTTIPOCAMBIO ( pkgrptregcr.funobtfliq(''FMAC'',''D002'','+SQLFecha(vlFecha)+'), ' +
                                                    pMoneda    + ' , ' + SQLStr( CVERDAD ) + ' ), 1 ) TIPO_CAMBIO' +
                ' FROM   DUAL ' ;

       GetSQLStr(vlsql,MiApli.DataBaseName,MiApli.SessionName,'TIPO_CAMBIO', vlTipoCambio, False);
     END
  ELSE IF pMoneda = IntToStr(800) THEN
  BEGIN
     vlTipoCambio := FloatToStr(ObtTipoCambio( MiApli.DameFechaEmpresaDia('D000'), IntToStr ( 800 ) ,
                                                   MiApli.DataBaseName, MiApli.SessionName));
  END
  ELSE vlTipoCambio := '1';

  if vlTipoCambio = CNULL then
     vlTipoCambio := '1';
  //end if
  Result := StrToFloat(vlTipoCambio);
end;
// <EASA> /

// <EASA 10 mayo 2006 Rutina obtiene la fecha de inicio del fin de semana
Function  ObtFIniFinSemana(pFecha : TDateTime; MiApli : TInterApli): TDateTime;
Var vlhabil: Boolean;
    vlResult : TDateTime;
Begin
   vlResult := pFecha;
   vlhabil := True;
   while vlhabil do
   begin
      if ValidaFecha (vlResult - 1 , MiApli) = 1 then Begin
        vlhabil := True;
                vlResult:= vlResult - 1 ;
      end
      else vlhabil := False;
   end;
   ObtFIniFinSemana := vlResult;
End;
// <EASA> /

// <EASA 18 ABR 2006 Rutina que deshabilita ohabilita un checks box
Procedure EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;
// <EASA> /


//</ EASA4011 12 JUN 2006 VALIDACION RELACION CENTRO DE COSTOS - CUENTAS CONTABLES
Procedure ValidaCCCtaContable(pMoneda, pIdCCostos, pCveGpoProducto: String; MiApli : TInterApli);

{Var vl

 procedure ArmaQry(var Qry : TQuery; strSQL : String);
 begin
  Qry := TQuery.Create(Nil);
  If Assigned(Qry) Then
   With Qry Do
    Begin
    SessionName := Apli.SessionName;
    DataBaseName := Apli.DataBaseName;
    SQL.Clear;
    SQL.Add(strSQL);
    Open;
    End;
 end;}

Begin

//CODIGO_TRANSACCION LIKE %0	PESOS
//CODIGO_TRANSACCION LIKE %1	DOLARES

End;
// EASA4011 >/



// <LOLS 30 ENE 2007. CREDITO EN LINEA>
function valComisProg( idCredito : Integer; CveComision :  String;  Apli : TInterApli ) : Boolean;
const coSQLExiste = 'SELECT COUNT(*) VECES FROM CR_COMIS_PROG WHERE ID_CREDITO = %d AND CVE_COMISION = %s';
      coSQLActivo = 'SELECT COUNT(*) VECES FROM CR_COMIS_PROG WHERE ID_CREDITO = %d AND CVE_COMISION = %s AND SIT_COMIS_PROG = ''AC'' ';
      coSQLUpdate = 'UPDATE CR_COMIS_PROG SET SIT_COMIS_PROG = ''AC'' WHERE ID_CREDITO = %d AND CVE_COMISION = %s';
      coSQLInsert = 'INSERT INTO CR_COMIS_PROG(   ' + coCRLF +
                    '    ID_CREDITO,            CVE_COMISION,      CVE_TIPO_APLICA,      CVE_DIA_APLICA, '  + coCRLF +
                    '    SIT_COMIS_PROG,        F_ALTA,            CVE_USU_ALTA,         F_MODIFICA, '      + coCRLF +
                    '    CVE_USU_MODIFICA,      PCT_COMISION,      IMP_COMISION,         B_APLICA_MORA,'    + coCRLF +
                    '    B_GENERA_FACTURA,      CVE_IMP_CALC_COM,  B_CALC_PROMEDIO,      CVE_TIPO_COM,'     + coCRLF +
                    '    CVE_MONEDA,            B_TASA_MORA_OPE,   CVE_TASA_MORA,        OPERADOR_STASA_M,' + coCRLF +
                    '    SOBRETASA_M,           UNIDAD_TIEMPO_CO,  NUM_UNIDADES_CO,      UNIDAD_TIEMPO_GR,' + coCRLF +
                    '    NUM_UNIDADES_GR,       UNIDAD_TIEMPO_CN,  NUM_UNIDADES_CN,      DIA_PAGO_CN,'      + coCRLF +
                    '    CVE_TIPO_COBRO,        IMP_MINIMO,        IMP_MAXIMO,           CVE_EVENTO_COM,'   + coCRLF +
                    '    B_PRORRATEO'                                                                       + coCRLF +
                    ')'                                                                                     + coCRLF +
                    'SELECT'                                                                                + coCRLF +
                    '    %d ID_CREDITO,         CVE_COMISION,      CVE_TIPO_APLICA,      NULL CVE_DIA_APLICA, '      + coCRLF +
                    '    ''AC'' SIT_COMIS_PROG, %s F_ALTA,         %s CVE_USU_ALTA,      NULL F_MODIFICA, '          + coCRLF +
                    '    NULL CVE_USU_MODIFICA, 0 PCT_COMISION,    0 IMP_COMISION,       B_APLICA_MORA, '            + coCRLF +
                    '    B_GENERA_FACTURA,      CVE_IMP_CALC_COM,  B_CALC_PROMEDIO,      CVE_TIPO_COM, '             + coCRLF +
                    '    CVE_MONEDA,            B_TASA_MORA_OPE,   CVE_TASA_MORA,        OPERADOR_STASA_M, '         + coCRLF +
                    '    SOBRETASA_M,           UNIDAD_TIEMPO_CO,  NUM_UNIDADES_CO,      UNIDAD_TIEMPO_GR, '         + coCRLF +
                    '    NUM_UNIDADES_GR,       UNIDAD_TIEMPO_CN,  NUM_UNIDADES_CN,      DIA_PAGO_CN, '              + coCRLF +
                    '    CVE_TIPO_COBRO,        IMP_MINIMO,        IMP_MAXIMO,           CVE_EVENTO_COM,'            + coCRLF +
                    '    B_PRORRATEO '                                                                               + coCRLF +
                    'FROM    CR_CAT_COMISION  '                                                                      + coCRLF +
                    'WHERE   CVE_COMISION = %s';
var sSqlCad : String;
    nExiste : Integer;
begin
  Result  := False;
  try
      nExiste := 0;
      // Valida que exista la comision
      sSqlCad := Format( coSQLExiste, [idCredito, SQLStr( CveComision ) ] );
      GetSQLInt( sSqlCad, Apli.DataBaseName, Apli.SessionName, 'VECES', nExiste, False );
      //
      if nExiste <= 0 then begin
        // Inserta el periodo de comision
        sSqlCad := Format( coSQLInsert, [ idCredito, SQLFecha(Apli.DameFechaEmpresa), SQLStr( Apli.Usuario ), SQLStr( CveComision ) ] );
        RunSQL( sSqlCad, Apli.DataBaseName, Apli.SessionName, False );
      end else begin
        // Valida que este activa la comisión
        sSqlCad := Format( coSQLActivo, [idCredito, SQLStr( CveComision ) ] );
        GetSQLInt( sSqlCad, Apli.DataBaseName, Apli.SessionName, 'VECES', nExiste, False );
        if nExiste <= 0 then begin
          // Modifica el estado del periodo de comisión
          sSqlCad := Format( coSQLUpdate, [idCredito, SQLStr( CveComision ) ] );
          RunSQL( sSqlCad, Apli.DataBaseName, Apli.SessionName, False );
        end;
      end;
      //
      // Valida que exista el registro ya sea que lo haya insertado o actualizado
      sSqlCad := Format( coSQLActivo, [idCredito, SQLStr( CveComision ) ] );
      GetSQLInt( sSqlCad, Apli.DataBaseName, Apli.SessionName, 'VECES', nExiste, False );
      if nExiste >= 0 then
        Result  := True;
      //
  except
    on e : exception do
      Result  := False;
  end;
end;
// </LOLS>

//</ EASA4011 23.FEB.2007       Reporte limite de Financiamiento
Function  FormaQueryLimFin(sFecha : TDateTime; sEmpresa, sRegMin, sExSector :String):String;
Var
    sSQL :String;
Begin
   sSQL := ' SELECT ROWNUM, A.DESC_GRUPO, A.NOMBRE, A.SDO_INSOLUTO, A.CVE_TIPO_SECTOR SECTOR' + coCRLF +
           ' FROM ( SELECT C.*' + coCRLF +
           '        FROM (' + coCRLF +
           '              SELECT DATOS.DESC_GRUPO, DATOS.ID_TITULAR, DATOS.NOMBRE, DATOS.CVE_TIPO_SECTOR,' + coCRLF +
           '                     SUM( ROUND((C.IMP_CAP_VIG + C.IMP_CAP_VDO_NE + C.IMP_CAP_IMP + C.IMP_CAP_VDO_EX + IMP_INT_VIG + IMP_INT_IMP + IMP_INT_VDO_EX)* DATOS.TIPO_CAMBIO,2) ) AS SDO_INSOLUTO' + coCRLF +
           '              FROM (' + coCRLF +
           '                    SELECT CC.ID_CREDITO, P.CVE_TIPO_SECTOR,' + coCRLF +
           '                    NVL( PKGCORPO.OBTTIPOCAMBIO ( pkgrptregcr.funobtfliq(''FMAC'',''D002'', '+ SQLFecha(sFecha) + '),' + coCRLF +
           '                                                  CTO.CVE_MONEDA, ''V'' ), 1 ) TIPO_CAMBIO,' + coCRLF +
           '                           CGE.DESC_GRUPO,' + coCRLF +
           '                           CTO.ID_TITULAR, SUBSTR(PKGCRCONSOLIDADO.FUN_NOM_TIT_CRED(CTO.ID_TITULAR),1,80) NOMBRE' + coCRLF +
           '                    FROM ( SELECT * FROM CRE_CREDITO CC' + coCRLF +
           '                           WHERE CC.SIT_CREDITO NOT IN(''CA'', ''TA'')' + coCRLF +
           '                             AND CC.F_VALOR_CRED  <= ' + SQLFecha(sFecha) + coCRLF +
           '                             AND (CC.F_LIQ_BNC >= ' + SQLFecha(sFecha) + ' OR CC.F_LIQ_BNC IS NULL) ) CC,' + coCRLF +
           '                        ( SELECT * FROM CONTRATO WHERE ID_EMPRESA  = ' + sEmpresa + ' ) CTO,' + coCRLF +
           '                        ( SELECT * FROM CRE_CLIENTE WHERE 1 = 1' + coCRLF +
           '                         ) CAC,' + coCRLF +
           '                        ( SELECT * FROM CRE_GRUPO_EMPR WHERE 1 = 1' + coCRLF +
           '                         ) CGE, PERSONA P,' + coCRLF +
           '                        CRE_CONTRATO CCTO, CRE_SUB_TIP_BCO CSB' + coCRLF +
           '                   WHERE ( ( CSB.F_TRASPASO_ICRE IS NOT NULL AND CC.SIT_CREDITO NOT IN ( ''TA'' ) )' + coCRLF +
           '                          OR CSB.F_TRASPASO_ICRE IS NULL )' + coCRLF +
           '                     AND CTO.ID_EMPRESA  = ' + sEmpresa +  coCRLF+
           '                     AND CAC.CVE_GRUPO IN (''0'',''5190'')' + coCRLF;


           if sExSector = 'V' then Begin
              sSQL := sSQL +
              '                     AND P.CVE_TIPO_SECTOR NOT IN (''11'',''13'',''14'',''25'',''26'')' + coCRLF;
           end;
   sSQL := sSQL +
           '                     AND CCTO.ID_CONTRATO     = CC.ID_CONTRATO' + coCRLF +
           '                     AND CSB.CVE_SUB_TIP_BCO  = CCTO.CVE_SUB_TIP_BCO' + coCRLF +
           '                     AND CTO.ID_CONTRATO      = CCTO.ID_CONTRATO' + coCRLF +
           '                     AND CAC.ID_PERSONA       = CTO.ID_TITULAR ' + coCRLF +
           '                     AND CGE.CVE_GRUPO        = CAC.CVE_GRUPO' + coCRLF +
           '                     AND CAC.ID_PERSONA       = P.ID_PERSONA' + coCRLF +
           '              UNION ALL' + coCRLF +
           '                     SELECT /* + INICIO DATOS CUALITATIVOS*/' + coCRLF +
           '                           CC.ID_CREDITO, P.CVE_TIPO_SECTOR,' + coCRLF +
           '                    NVL( PKGCORPO.OBTTIPOCAMBIO ( pkgrptregcr.funobtfliq(''FMAC'',''D002'', '+ SQLFecha(sFecha) + '),' + coCRLF +
           '                                                  CTO.CVE_MONEDA, ''V'' ), 1 ) TIPO_CAMBIO,' + coCRLF +
           '                           CGE.DESC_GRUPO_ECO DESC_GRUPO, CTO.ID_TITULAR,' + coCRLF +
           '                           SUBSTR(PKGCRCONSOLIDADO.FUN_NOM_TIT_CRED(CTO.ID_TITULAR),1,80) NOMBRE' + coCRLF +
           '                    FROM ( SELECT /* + CHOOSE*/ * FROM CR_CREDITO' + coCRLF +
           '                           WHERE 1 = 1' + coCRLF +
           '                             AND SIT_CREDITO <> ''CA''' + coCRLF +
           '                             AND F_INICIO    <= ' + SQLFecha(sFecha) + ' AND ( F_LIQUIDACION >= ' + SQLFecha(sFecha) + ' OR F_LIQUIDACION IS NULL )' + coCRLF +
           '                         ) CC,' + coCRLF +
           '                         ( SELECT /*+ CHOOSE */ * FROM CONTRATO WHERE 1 = 1 AND ID_EMPRESA = ' +sEmpresa+ coCRLF +
           '                         )CTO,' + coCRLF +
           '                         ( SELECT /*+ CHOOSE */ * FROM CR_ACREDITADO WHERE 1 = 1' + coCRLF +
           '                         )CAC,' + coCRLF +
           '                         ( SELECT /*+ CHOOSE */ * FROM CR_GRUPO_ECO WHERE 1 = 1' + coCRLF +
           '                         )CGE, PERSONA P' + coCRLF +
           '                  WHERE 1 = 1' + coCRLF +
           '                    AND CTO.ID_EMPRESA = ' + sEmpresa + coCRLF+
           '                    AND CAC.CVE_GRUPO_ECO IN (''0'',''5190'')' + coCRLF;

           if sExSector = 'V' then Begin
              sSQL := sSQL +
              '                     AND P.CVE_TIPO_SECTOR NOT IN (''11'',''13'',''14'',''25'',''26'')' + coCRLF;
           end;
   sSQL := sSQL +
           '                    AND CTO.ID_CONTRATO         = CC.ID_CONTRATO' + coCRLF +
           '                    AND CAC.ID_ACREDITADO       = CTO.ID_TITULAR' + coCRLF +
           '                    AND CGE.CVE_GRUPO_ECO       = CAC.CVE_GRUPO_ECO' + coCRLF +
           '                    AND CAC.ID_ACREDITADO       = P.ID_PERSONA' + coCRLF +
           '              )DATOS, CR_CON_ADEUDO_SDO C' + coCRLF +
           '              WHERE C.F_CIERRE     = ' + SQLFecha(sFecha) + coCRLF +
           '              AND DATOS.ID_CREDITO = C.ID_CREDITO' + coCRLF +
           '             GROUP BY DATOS.DESC_GRUPO, DATOS.ID_TITULAR, DATOS.NOMBRE, DATOS.CVE_TIPO_SECTOR' + coCRLF +

           ' UNION' + coCRLF +

           '              SELECT DATOS.CVE_GRUPO_ECO, 0 ID_TITULAR, DATOS.DESC_GRUPO, DATOS.CVE_TIPO_SECTOR,' + coCRLF +
           '                     SUM( ROUND((C.IMP_CAP_VIG + C.IMP_CAP_VDO_NE + C.IMP_CAP_IMP + C.IMP_CAP_VDO_EX + IMP_INT_VIG + IMP_INT_IMP + IMP_INT_VDO_EX)* DATOS.TIPO_CAMBIO,2) ) AS SDO_INSOLUTO' + coCRLF +
           '              FROM (' + coCRLF +
           '                    SELECT CC.ID_CREDITO, P.CVE_TIPO_SECTOR,CAC.CVE_GRUPO CVE_GRUPO_ECO,' + coCRLF +
           '                    NVL( PKGCORPO.OBTTIPOCAMBIO ( pkgrptregcr.funobtfliq(''FMAC'',''D002'', '+ SQLFecha(sFecha) + '),' + coCRLF +
           '                                                  CTO.CVE_MONEDA, ''V'' ), 1 ) TIPO_CAMBIO,' + coCRLF +
           '                           CGE.DESC_GRUPO,' + coCRLF +
           '                           CTO.ID_TITULAR, SUBSTR(PKGCRCONSOLIDADO.FUN_NOM_TIT_CRED(CTO.ID_TITULAR),1,80) NOMBRE' + coCRLF +
           '                    FROM ( SELECT * FROM CRE_CREDITO CC' + coCRLF +
           '                           WHERE CC.SIT_CREDITO NOT IN(''CA'', ''TA'')' + coCRLF +
           '                             AND CC.F_VALOR_CRED  <= ' + SQLFecha(sFecha) + coCRLF +
           '                             AND (CC.F_LIQ_BNC >= ' + SQLFecha(sFecha) + ' OR CC.F_LIQ_BNC IS NULL) ) CC,' + coCRLF +
           '                        ( SELECT * FROM CONTRATO WHERE ID_EMPRESA  = ' + sEmpresa + ' ) CTO,' + coCRLF +
           '                        ( SELECT * FROM CRE_CLIENTE WHERE 1 = 1' + coCRLF +
           '                         ) CAC,' + coCRLF +
           '                        ( SELECT * FROM CRE_GRUPO_EMPR WHERE 1 = 1' + coCRLF +
           '                         ) CGE, PERSONA P,' + coCRLF +
           '                        CRE_CONTRATO CCTO, CRE_SUB_TIP_BCO CSB' + coCRLF +
           '                   WHERE ( ( CSB.F_TRASPASO_ICRE IS NOT NULL AND CC.SIT_CREDITO NOT IN ( ''TA'' ) )' + coCRLF +
           '                          OR CSB.F_TRASPASO_ICRE IS NULL )' + coCRLF +
           '                     AND CTO.ID_EMPRESA  = ' + sEmpresa +  coCRLF+
           '                     AND CAC.CVE_GRUPO NOT IN (''0'',''5190'')' + coCRLF;


           if sExSector = 'V' then Begin
              sSQL := sSQL +
              '                     AND P.CVE_TIPO_SECTOR NOT IN (''11'',''13'',''14'',''25'',''26'')' + coCRLF;
           end;
   sSQL := sSQL +
           '                     AND CCTO.ID_CONTRATO     = CC.ID_CONTRATO' + coCRLF +
           '                     AND CSB.CVE_SUB_TIP_BCO  = CCTO.CVE_SUB_TIP_BCO' + coCRLF +
           '                     AND CTO.ID_CONTRATO      = CCTO.ID_CONTRATO' + coCRLF +
           '                     AND CAC.ID_PERSONA       = CTO.ID_TITULAR ' + coCRLF +
           '                     AND CGE.CVE_GRUPO        = CAC.CVE_GRUPO' + coCRLF +
           '                     AND CAC.ID_PERSONA       = P.ID_PERSONA' + coCRLF +
           '              UNION ALL' + coCRLF +
           '                     SELECT /* + INICIO DATOS CUALITATIVOS*/' + coCRLF +
           '                           CC.ID_CREDITO, P.CVE_TIPO_SECTOR,CAC.CVE_GRUPO_ECO,' + coCRLF +
           '                    NVL( PKGCORPO.OBTTIPOCAMBIO ( pkgrptregcr.funobtfliq(''FMAC'',''D002'', '+ SQLFecha(sFecha) + '),' + coCRLF +
           '                                                  CTO.CVE_MONEDA, ''V'' ), 1 ) TIPO_CAMBIO,' + coCRLF +
           '                           CGE.DESC_GRUPO_ECO DESC_GRUPO, CTO.ID_TITULAR,' + coCRLF +
           '                           SUBSTR(PKGCRCONSOLIDADO.FUN_NOM_TIT_CRED(CTO.ID_TITULAR),1,80) NOMBRE' + coCRLF +
           '                    FROM ( SELECT /* + CHOOSE*/ * FROM CR_CREDITO' + coCRLF +
           '                           WHERE 1 = 1' + coCRLF +
           '                             AND SIT_CREDITO <> ''CA''' + coCRLF +
           '                             AND F_INICIO    <= ' + SQLFecha(sFecha) + ' AND ( F_LIQUIDACION >= ' + SQLFecha(sFecha) + ' OR F_LIQUIDACION IS NULL )' + coCRLF +
           '                         ) CC,' + coCRLF +
           '                         ( SELECT /*+ CHOOSE */ * FROM CONTRATO WHERE 1 = 1 AND ID_EMPRESA = ' +sEmpresa+ coCRLF +
           '                         )CTO,' + coCRLF +
           '                         ( SELECT /*+ CHOOSE */ * FROM CR_ACREDITADO WHERE 1 = 1' + coCRLF +
           '                         )CAC,' + coCRLF +
           '                         ( SELECT /*+ CHOOSE */ * FROM CR_GRUPO_ECO WHERE 1 = 1' + coCRLF +
           '                         )CGE, PERSONA P' + coCRLF +
           '                  WHERE 1 = 1' + coCRLF +
           '                    AND CTO.ID_EMPRESA = ' + sEmpresa + coCRLF+
           '                    AND CAC.CVE_GRUPO_ECO NOT IN (''0'',''5190'')' + coCRLF;

           if sExSector = 'V' then Begin
              sSQL := sSQL +
              '                     AND P.CVE_TIPO_SECTOR NOT IN (''11'',''13'',''14'',''25'',''26'')' + coCRLF;
           end;
   sSQL := sSQL +
           '                    AND CTO.ID_CONTRATO         = CC.ID_CONTRATO' + coCRLF +
           '                    AND CAC.ID_ACREDITADO       = CTO.ID_TITULAR' + coCRLF +
           '                    AND CGE.CVE_GRUPO_ECO       = CAC.CVE_GRUPO_ECO' + coCRLF +
           '                    AND CAC.ID_ACREDITADO       = P.ID_PERSONA' + coCRLF +
           '              )DATOS, CR_CON_ADEUDO_SDO C' + coCRLF +
           '              WHERE C.F_CIERRE     = ' + SQLFecha(sFecha) + coCRLF +
           '              AND DATOS.ID_CREDITO = C.ID_CREDITO' + coCRLF +
           '             GROUP BY DATOS.CVE_GRUPO_ECO, DATOS.DESC_GRUPO, DATOS.CVE_TIPO_SECTOR' + coCRLF +

           '             ) C' + coCRLF +
           '        ORDER BY C.SDO_INSOLUTO DESC' + coCRLF +
           '      )A' + coCRLF +
           ' WHERE ROWNUM <=' + sRegMin + coCRLF;
   Result:= sSQL;
End;
// </EASA4011>
//</EAS4A011    22.AGO.2007     Valida Tasa del fondeo a una fecha determinada
Function ValidaExisTasaFnd(pIdCredito: String; pFecha: TDateTime; pApli: TInterApli): Boolean;
var vlsql   : string;
    vlCveTasa, vlValor : string;
    vlResult: Boolean;
begin
   vlResult:= False;


      vlsql := ' SELECT PKGCRREDESCTO.stpObtCveTasaPlazo( 0,P.cve_tasa_refer, c.dias_plazo) CVE_TASA_REFER '+
               ' FROM   CR_PRODUCTO_FND P, CR_CONTRATO L, CR_CREDITO C, CONTRATO CTTO ' +
               ' WHERE  C.ID_CREDITO       =  ' + pIdCredito +
               '   AND  P.SIT_FND_PROD     =''AC'''+
               '   AND  L.ID_CONTRATO      = C.ID_CONTRATO'+
               '   AND  L.FOL_CONTRATO     = C.FOL_CONTRATO'+
               '   AND  CTTO.ID_CONTRATO   = C.ID_CONTRATO'+
               '   AND  P.CVE_PRODUCTO_CRE = L.CVE_PRODUCTO_CRE'+
               '   AND  P.CVE_MONEDA       = CTTO.CVE_MONEDA';
   GetSQLStr(vlsql,pApli.DataBaseName,pApli.SessionName,'CVE_TASA_REFER', vlCveTasa, False);

   if vlCveTasa  = '' then
      vlResult := False
   else BEGIN
   vlsql := ' SELECT VAL_TASA_INDIC FROM VALOR_TASA_INDIC ' +
            ' WHERE CVE_TASA_INDICAD =    ' + SQLStr(vlCveTasa) +
            '   AND F_INI_VIGENCIA =    ' + SQLFecha(pFecha);

   GetSQLStr(vlsql,pApli.DataBaseName,pApli.SessionName,'VAL_TASA_INDIC', vlValor, False);

   if vlValor = '' then
      vlResult := False
   else
      vlResult := True;
   END;

   Result := vlResult;
end;
//</EAS4A011    22.AGO.2007     Valida si existe fondeo
Function ExisteFondeo(pIdCredito: String; pApli: TInterApli; var vlMsg :string): Boolean;
var vlsql   : string;
    vlValor : string;
    vlResult: Boolean;

begin
   vlResult:= False;
   vlsql := ' SELECT CFE.DESC_ENT_DES FROM CR_FND_CREDITO CR, CR_FND_ENT_DES CFE' +
            ' WHERE CR.ID_CREDITO =    ' + pIdCredito +
            '   AND CR.PCT_REDESCONTADO > 0 ' +
            '   AND CFE.CVE_FND_ENT_DES = CR.CVE_FND_ENT_DES';

   GetSQLStr(vlsql,pApli.DataBaseName,pApli.SessionName,'DESC_ENT_DES', vlValor, False);
   vlMsg := vlValor;
   if vlValor = '' then
      vlResult := False
   else
      vlResult := True;

   Result := vlResult;
end;

//</EAS4A011    22.AGO.2007     Valida si existe fondeo
Function ExisteGar(pIdCredito: String; pApli: TInterApli; var vlMsg :string): Boolean;
var vlsql   : string;
    vlValor : string;
    vlResult: Boolean;

begin
   vlResult:= False;
   vlsql := ' SELECT CCC.DESC_COMISION FROM CR_FND_COM_PROG CFC, CR_CAT_COMISION CCC' +
            ' WHERE CFC.ID_CREDITO = ' + pIdCredito +
            '   AND CFC.SIT_COMIS_PROG = ''AC''' +
            '   AND CFC.CVE_COMISION = CCC.CVE_COMISION ';

   GetSQLStr(vlsql,pApli.DataBaseName,pApli.SessionName,'DESC_COMISION', vlValor, False);
   vlMsg := vlValor;
   if vlValor = '' then
      vlResult := False
   else
      vlResult := True;

   Result := vlResult;
end;

Function ObtQryAviso(pbCierre, pCesiones, pTipo, pCveAviso, sMail, sEmisor, sProveedor : String; PF_Inicio, PF_Fin: TDate): String;
var vlCesiones, vlsql : string;
begin
      vlsql:= '';
   if ( pTipo = coCveReman ) or ( pTipo = coCveIntXDev ) then
   Begin
      if pCesiones = '' then
      pCesiones := ' INFO.ID_CESION ';

    vlsql:= ' SELECT INFO.ID_CESION,' + coCRLF +
            '        INFO.ID_DOCUMENTO,' + coCRLF +
            '        INFO.DESC_L_PRODUCTO,' + coCRLF +
            '        INFO.IMP_DEV_REMAN,' + coCRLF +
            '        INFO.NOM_PROV,' + coCRLF +
            '        INFO.MAIL_PROV,' + coCRLF +
            '        INFO.NOM_EMI,'+ coCRLF +
            '        INFO.MAIL_EMI'+ coCRLF +
            ' FROM  (' + coCRLF +
            '         SELECT CD.ID_CESION,' + coCRLF +
            '                CD.ID_DOCUMENTO,' + coCRLF +
            '                CPR.DESC_L_PRODUCTO,' + coCRLF +
            '                NVL( CRM.IMP_DEV_REMAN, 0 ) IMP_DEV_REMAN,' + coCRLF +
            '                CRM.CVE_TIPO_REMAN,' + coCRLF +
            '                PROV.NOMBRE NOM_PROV,' + coCRLF +
            '                PROV.E_MAIL MAIL_PROV,' + coCRLF +
            '                EMI.NOMBRE NOM_EMI,'+ coCRLF +
            '                EMI.E_MAIL MAIL_EMI'+ coCRLF +
            '         FROM   CR_DOCUMENTO   CD,' + coCRLF +
            '                CR_CESION      CCE,' + coCRLF +
            '                CR_CREDITO     CC,' + coCRLF +
            '                CR_CONTRATO    CCTO,' + coCRLF +
            '                CR_PRODUCTO    CPR,' + coCRLF +
            '                CR_REMANENTE   CRM, ' + coCRLF +
            '                PERSONA        PROV,'+ coCRLF +
            '                PERSONA        EMI'+ coCRLF +
            '         WHERE CRM.CVE_TIPO_REMAN = ' + SQLStr  ( pTipo )+ coCRLF +
            '           AND CRM.F_PAGO         >= ' + SQLFecha( PF_Inicio ) + coCRLF +
            '           AND CRM.F_PAGO         <= ' + SQLFecha( PF_Fin ) + coCRLF +
            '           AND CCE.SIT_CESION     <> ''CA''' + coCRLF +
            '           AND CD.SIT_DOCUMENTO   <> ''CA''' + coCRLF +
            '           AND CCE.ID_CESION      = CD.ID_CESION' + coCRLF +
            '           AND CC.ID_CREDITO      = CCE.ID_CESION' + coCRLF +
            '           AND CRM.ID_CESION      = CD.ID_CESION' + coCRLF +
            '           AND CRM.ID_DOCUMENTO   = CD.ID_DOCUMENTO' + coCRLF +
            '           AND CCTO.ID_CONTRATO   = CC.ID_CONTRATO' + coCRLF +
            '           AND CCTO.FOL_CONTRATO  = CC.FOL_CONTRATO' + coCRLF +
            '           AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE' + coCRLF +
            '           AND PROV.ID_PERSONA    = CCE.ID_PROVEEDOR'+ coCRLF +
            '           AND EMI.ID_PERSONA     = CCE.ID_EMISOR'+ coCRLF +
            '        )INFO,' + coCRLF +
            '        CR_CTRL_AVISO CTRL' + coCRLF +
            ' WHERE  CTRL.ID_CREDITO(+) IN ('+ pCesiones +') AND INFO.IMP_DEV_REMAN > 0' + coCRLF;

   if sMail <> '' THEN
      vlsql:= vlsql + '   AND  CTRL.B_MAIL(+) = ' + SQLSTR(sMail) +coCRLF;
   //end;

   if sEmisor <> '' then
      vlsql:= vlsql + '   AND  EMI.ID_PERSONA = ' + sEmisor +coCRLF;
   //end;

   if sProveedor <> '' then
      vlsql:= vlsql + '   AND  PROV.ID_PERSONA = ' + sProveedor +coCRLF;
   //end;

      vlsql:= vlsql +
            '   AND  CTRL.ID_CREDITO   (+) = INFO.ID_CESION' + coCRLF +
            '   AND  CTRL.ID_DOCUMENTO (+) = INFO.ID_DOCUMENTO' + coCRLF +
            '   AND  CTRL.CVE_AVISO    (+) = ' + SQLStr( pCveAviso ) + coCRLF +
            ' ORDER BY INFO.ID_CESION, INFO.ID_DOCUMENTO' + coCRLF ;
   End

   Else if pTipo = coCveMoras then
   Begin
    if pCesiones = '' then
      pCesiones := ' INFO.ID_CESION ';

    vlsql:= ' SELECT INFO.ID_CESION,' + coCRLF +
            '        INFO.ID_DOCUMENTO, ' + coCRLF +
            '        INFO.DESC_L_PRODUCTO, ' + coCRLF +
            '        INFO.IMP_DEV_REMAN, ' + coCRLF +
            '        INFO.NOM_PROV,' + coCRLF +
            '        INFO.MAIL_PROV,' + coCRLF +
            '        INFO.NOM_EMI,'+ coCRLF +
            '        INFO.MAIL_EMI'+ coCRLF +
            ' FROM ( SELECT CD.ID_CESION, ' + coCRLF +
            '               CD.ID_DOCUMENTO,' + coCRLF +
            '               CPR.DESC_L_PRODUCTO,' + coCRLF +
            '               (CCA.IMP_PAGADO_MORA ) IMP_DEV_REMAN,' + coCRLF +
            '                PROV.NOMBRE NOM_PROV,' + coCRLF +
            '                PROV.E_MAIL MAIL_PROV,' + coCRLF +
            '                EMI.NOMBRE NOM_EMI,'+ coCRLF +
            '                EMI.E_MAIL MAIL_EMI'+ coCRLF +
            '        FROM   CR_DOCUMENTO   CD, ' + coCRLF +
            '               CR_CESION      CCE,' + coCRLF +
            '               CR_CREDITO     CC, ' + coCRLF +
            '               CR_CONTRATO    CCTO,' + coCRLF +
            '               CR_PRODUCTO    CPR, ' + coCRLF +
            '               CR_CAPITAL     CCA, ' + coCRLF +
            '               CR_TRANSACCION CTR,' + coCRLF +
            '               CR_REL_CON_AFEC CRCA,' + coCRLF +
            '               CR_DET_TRANSAC  CDT,' + coCRLF +
            '               PERSONA        PROV,'+ coCRLF +
            '               PERSONA        EMI,'+ coCRLF +
            '               (SELECT CVE_OPE_PAG_CP' + coCRLF +
            '                FROM   CR_PARAMETRO' + coCRLF +
            '                WHERE  CVE_PARAMETRO = ''CRE'' ' + coCRLF +
            '               )PARAM ' + coCRLF +
            '        WHERE CTR.F_OPERACION >= ' + SQLFecha( PF_inicio ) + coCRLF +
            '          AND CTR.F_OPERACION <= ' + SQLFecha( PF_Fin ) + coCRLF +
            '          AND CCE.SIT_CESION     <> ''CA''' + coCRLF +
            '          AND CD.SIT_DOCUMENTO   <> ''CA''' + coCRLF +
            '          AND CTR.SIT_TRANSACCION = ''AC''' + coCRLF +
            '          AND CTR.ID_TRANS_CANCELA IS NULL ' + coCRLF +
            '          AND CCA.SIT_CAPITAL = ''LQ'' ' + coCRLF +
            '          AND  CRCA.CVE_AFECTACION = ''CAMORP''' + coCRLF +
            '          AND  CTR.ID_TRANSACCION  = CDT.ID_TRANSACCION' + coCRLF +
            '          AND  CTR.CVE_OPERACION   = CDT.CVE_OPERACION' + coCRLF +
            '          AND  CDT.CVE_OPERACION   = CRCA.CVE_OPERACION' + coCRLF +
            '          AND  CDT.CVE_CONCEPTO    = CRCA.CVE_CONCEPTO' + coCRLF +
            '          AND  CTR.CVE_TIPO_MOVTO  = CRCA.CVE_TIPO_MOVTO' + coCRLF +
            '          AND CTR.CVE_OPERACION  =  PARAM.CVE_OPE_PAG_CP' + coCRLF +
            '          AND CD.ID_CESION       =  CTR.ID_CESION ' + coCRLF +
            '          AND CD.ID_DOCUMENTO    =  CTR.ID_DOCUMENTO ' + coCRLF +
            '          AND CCE.ID_CESION      =  CTR.ID_CESION' + coCRLF +
            '          AND CC.ID_CREDITO      =  CTR.ID_CREDITO' + coCRLF +
            '          AND CCE.ID_CESION      = CD.ID_CESION ' + coCRLF +
            '          AND CC.ID_CREDITO      = CCE.ID_CESION ' + coCRLF +
            '          AND CCA.ID_CREDITO     = CD.ID_CESION' + coCRLF +
            '          AND CCA.NUM_PERIODO    = CD.NUM_PERIODO_DOC' + coCRLF +
            '          AND CCTO.ID_CONTRATO   = CC.ID_CONTRATO' + coCRLF +
            '          AND CCTO.FOL_CONTRATO  = CC.FOL_CONTRATO ' + coCRLF +
            '          AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE ' + coCRLF +
            '          AND PROV.ID_PERSONA    = CCE.ID_PROVEEDOR'+ coCRLF +
            '          AND EMI.ID_PERSONA     = CCE.ID_EMISOR'+ coCRLF +
            '       )INFO, ' + coCRLF +
            '       CR_CTRL_AVISO CTRL ' + coCRLF +
            ' WHERE CTRL.ID_CREDITO(+) IN ('+ pCesiones +') AND INFO.IMP_DEV_REMAN > 0 ' + coCRLF;

   if sMail <> '' THEN
      vlsql:= vlsql + '   AND  CTRL.B_MAIL(+) = ' + SQLSTR(sMail) +coCRLF;
   //end;

   if sEmisor <> '' then
      vlsql:= vlsql + '   AND  EMI.ID_PERSONA = ' + sEmisor +coCRLF;
   //end;

   if sProveedor <> '' then
      vlsql:= vlsql + '   AND  PROV.ID_PERSONA = ' + sProveedor +coCRLF;
   //end;

      vlsql:= vlsql +
            '   AND CTRL.ID_CREDITO    (+) = INFO.ID_CESION ' + coCRLF +
            '   AND CTRL.ID_DOCUMENTO  (+) = INFO.ID_DOCUMENTO ' + coCRLF +
            ' ORDER BY INFO.ID_CESION, INFO.ID_DOCUMENTO' + coCRLF;
   End
   Else if pTipo = coCveColoca then
   Begin
      if pCesiones = '' then
      pCesiones := ' CS.ID_CESION ';

    vlsql:= ' SELECT CS.ID_CESION,CS.ID_PROVEEDOR, CS.ID_EMISOR, '+ coCRLF +
            '        PROV.E_MAIL AS MAIL_PROV,'+ coCRLF +
            '        EMI.E_MAIL  AS MAIL_EMI,'+ coCRLF +
            '        PROV.NOMBRE AS NOM_PROV,'+ coCRLF +
            '        EMI.NOMBRE  AS NOM_EMI'+ coCRLF +
	    ' FROM  CR_CESION CS,'+ coCRLF +
            '       PERSONA PROV,'+ coCRLF +
            '       PERSONA EMI,  '+ coCRLF +
            '       CR_CTRL_AVISO CTRL  '+ coCRLF +
            ' WHERE CTRL.ID_CREDITO(+) IN ('+ pCesiones +')' + coCRLF+
            '   AND CS.F_AUTORIZA >= '+ SQLFecha( PF_Inicio ) + coCRLF+
            '   AND CS.F_AUTORIZA <= '+ SQLFecha( PF_Fin ) + coCRLF;


   if sMail <> '' THEN
      vlsql:= vlsql + '   AND  CTRL.B_MAIL(+) = ' + SQLSTR(sMail) +coCRLF;
   //end;

   if sEmisor <> '' then
      vlsql:= vlsql + '   AND  CS.ID_EMISOR = ' + sEmisor +coCRLF;
   //end;

   if sProveedor <> '' then
      vlsql:= vlsql + '   AND  CS.ID_PROVEEDOR = ' + sProveedor +coCRLF;
   //end;


      vlsql:= vlsql +
            '   AND CTRL.ID_CREDITO    (+) = CS.ID_CESION ' + coCRLF +
	    '   AND CS.SIT_CESION   <> ''CA'''+ coCRLF +
            '   AND CTRL.ID_CREDITO    (+) = CS.ID_CESION ' + coCRLF +
	    '   AND PROV.ID_PERSONA = CS.ID_PROVEEDOR'+ coCRLF +
	    '   AND EMI.ID_PERSONA  = CS.ID_EMISOR'+ coCRLF +
	    ' GROUP BY CS.ID_CESION,CS.ID_PROVEEDOR, CS.ID_EMISOR,'+ coCRLF +
            '          PROV.E_MAIL, '+ coCRLF +
            '          EMI.E_MAIL, '+ coCRLF +
            '          PROV.NOMBRE, '+ coCRLF +
            '          EMI.NOMBRE'+ coCRLF +
	    ' ORDER BY CS.ID_CESION'+ coCRLF ;
   End;

   Result := vlsql;
end;

function LimpiaTblAviso(pDatabaseName, pSessionName : String; var pstrMensaje : String): Boolean;
var  STPLimpTblAv  : TStoredProc;
Begin
  Result := True;
  STPLimpTblAv := TStoredProc.Create(Nil);
  try
    with STPLimpTblAv do
    begin
      DatabaseName   := pDatabaseName;
      SessionName    := pSessionName;
      StoredProcName :='PKGCRAVISOS.STPLIMPIATBLAV';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam(ftFloat,  'psResultado',   ptOutput );
      Params.CreateParam(ftString, 'psTxResultado', ptOutput );
      //
      ExecProc;
      if (ParamByName('PSResultado').AsInteger <> 0) then
      begin
        ShowMessage('Problemas al limpiar tabla de avisos: '            + coCRLF +
                    'Código : ' + ParamByName('psResultado').AsString   + coCRLF +
                    'Mensaje: ' + ParamByName('psTxResultado').AsString );
        Result := False;
      end;
    end;
  finally
    STPLimpTblAv.Free;
  end;
end;

function AgregaAviso( peIdCesion     : Integer; peIdDocumento : String;
                      peCveTipoReman : String;
                      pDatabaseName, pSessionName : String; var pstrMensaje : String ): Boolean;
var  STPAddElemento : TStoredProc;
begin
  Result := True;
  STPAddElemento := TStoredProc.Create(nil);
  try
      with STPAddElemento do
      begin
        DatabaseName   := pDatabaseName;
        SessionName    := pSessionName;
        StoredProcName := 'PKGCRAVISOS.STPAGREGAAVISO';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftInteger, 'peIdCesion',      ptInput );
        Params.CreateParam(ftString,  'peIdDocumento',   ptInput );
        Params.CreateParam(ftString,  'peCveTipoReman',  ptInput );
        Params.CreateParam(ftInteger, 'psResultado',     ptInput );
        Params.CreateParam(ftString,  'psTxResultado',   ptInput );
        //
        ParamByName('peIdCesion'     ).AsInteger := peIdCesion;
        ParamByName('peIdDocumento'  ).AsString  := peIdDocumento;
        ParamByName('peCveTipoReman' ).AsString  := peCveTipoReman;
        //
        ExecProc;
        if ( ParamByName('psResultado').AsInteger <> 0 ) then
        begin
          ShowMessage('Problemas al agregar datos : '                      + coCRLF +
                      'Código : ' + ParamByName('psRESULTADO').AsString    + coCRLF +
                      'Mensaje: ' + ParamByName('psTxResultado').AsString );
          Result := False;
        end;
      end;
  finally
    STPAddElemento.Free;
  end;

End;

Procedure StpInsertUpdAv(pAviso, pCesion, pDocto, pbMail, pTxMail,pFhMail, pFAviso : String;
                      pNumImpresion : Integer;
                      MiApli : TInterApli; var psMsg : String );
var StpInsertUpdAv :  TStoredProc;
    vlMsg: String;
Begin
    StpInsertUpdAv := TStoredProc.Create(Nil);
    vlMsg := '';
    try
       with StpInsertUpdAv do
       begin
          StpInsertUpdAv.DatabaseName:= MiApli.DatabaseName;
          StpInsertUpdAv.SessionName:= MiApli.SessionName;
          StpInsertUpdAv.StoredProcName:='PKGCRPERIODO.STPACTIMPRAVISO';

          Params.Clear;
          Params.CreateParam( ftInteger,  'peID_CREDITO',    ptInput  );
          Params.CreateParam( ftString,   'peID_DOCUMENTO',  ptInput  );
          Params.CreateParam( ftString,   'peCVE_AVISO',     ptInput  );
          Params.CreateParam( ftInteger,  'peNUM_IMPRESION', ptInput  );
          Params.CreateParam( ftString,   'peB_MAIL', ptInput  );
          Params.CreateParam( ftDateTime, 'peFHMAIL', ptInput  );
          Params.CreateParam( ftString,   'peTxMAIL', ptInput  );
          Params.CreateParam( ftString,   'peUSUARIO', ptInput  );
          Params.CreateParam( ftDateTime, 'peFAVISO', ptInput  );
          Params.CreateParam( ftString,   'peBCommit',       ptInput  );
          Params.CreateParam( ftString,   'psTXResultado',   ptOutput );
          Params.CreateParam( ftInteger,  'psResultado',     ptOutput );

          ParamByName( 'peID_CREDITO'    ).AsString  := pCesion;
          ParamByName( 'peID_DOCUMENTO'  ).AsString  := pDocto;
          ParamByName( 'peCVE_AVISO'     ).AsString  := pAviso;
          ParamByName( 'peNUM_IMPRESION' ).AsInteger := pNumImpresion;
          ParamByName( 'peB_MAIL'        ).AsString  := pbMail;
          if pFhMail <> '' then
             ParamByName( 'peFHMAIL'        ).AsDateTime  := StrToDateTime(pFhMail)
          else
             ParamByName( 'peFHMAIL'        ).AsString := 'null';
          ParamByName( 'peTxMAIL'        ).AsString  := pTxMail;
          ParamByName( 'peUSUARIO'        ).AsString  := MiApli.Usuario;
          ParamByName( 'peFAVISO'        ).AsDateTime  := StrToDateTime(pFAviso);
          ParamByName( 'peBCommit'       ).AsString  := cVERDAD;
          ExecProc;
    if ParamByName( 'psResultado' ).AsInteger <> 0 then
    begin
      vlMsg:= 'Error : '+ pCesion + ' Documento ' +  pDocto + ' : ' +
                  ParamByName( 'psTXResultado' ).AsString;
      ShowMessage(vlMsg);
        end;
      end;
  finally
       StpInsertUpdAv.Free;
    end;
    psMsg:= vlMsg;
end;

Procedure msgBodyMail(MiMemo: TQRMemo; sGpoCve: String; Apli : TInterApli );
Begin

   AddLineQr(MiMemo,obtValorGpoCve( sGpoCve, 'BODY_LINE0', Apli ));
   AddLineQr(MiMemo,'');
   AddLineQr(MiMemo,obtValorGpoCve( sGpoCve, 'BODY_LINE1', Apli ));
   AddLineQr(MiMemo,obtValorGpoCve( sGpoCve, 'BODY_LINE2', Apli ));
   AddLineQr(MiMemo,'');
   AddLineQr(MiMemo,obtValorGpoCve( sGpoCve, 'BODY_LINE3', Apli ));
   AddLineQr(MiMemo,obtValorGpoCve( sGpoCve, 'BODY_LINE4', Apli ) + ' ' + obtValorGpoCve( sGpoCve, 'BODY_LINE5', Apli ));
   AddLineQr(MiMemo,'');
   AddLineQr(MiMemo,obtValorGpoCve( sGpoCve, 'BODY_LINE6', Apli ));
   AddLineQr(MiMemo,'');
   AddLineQr(MiMemo,obtValorGpoCve( sGpoCve, 'BODY_LINE7', Apli ));

End;

//VALIDACION DE USUARIO JFOF 12/10/2011 JFOF
function ValidaUsuario(Apli : TInterApli; PECLAVE:String): Boolean;
begin
      if GetSql('SELECT Cve_Oper_acc From Secu_Oper_Acc WHERE Cve_Funcion = '''+Apli.LastFuncion+'''and Cve_Usuario = '''+ Apli.Usuario+'''and Cve_Oper_Acc= '''+PECLAVE+'''',
                Apli.DataBaseName, Apli.SessionName, True)
      then ValidaUsuario := True
      else ValidaUsuario := False;
end;

end.
