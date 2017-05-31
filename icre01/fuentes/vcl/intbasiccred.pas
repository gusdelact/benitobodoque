// Sistema         : Clase de PARAMCRE
// Fecha de Inicio : 13/12/2004
// Función forma   : Clase de PARAMCRE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa / Manuel Romero Ibarra
// Comentarios     : Llama parámetros del Usuario
Unit IntBasicCred;
interface

uses

Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterApl,

IntGenCre; // Unidad Generica

Type

 TBasicCred = class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }

        ID_CREDITO          : TInterCampo; //Identificador de Crédito
        ID_CONTRATO         : TInterCampo; //Identificador de Contrato
        FOL_CONTRATO        : TInterCampo; //Folio de Contrato
        CVE_PRODUCTO        : TInterCampo; //Clave de Producto
        DESC_L_PRODUCTO     : TInterCampo; //Descripción de Producto
        B_COB_AUT           : TInterCampo;
        B_APLICA_COM        : TInterCampo;
        B_APLICA_IVA        : TInterCampo;
        B_GENERA_EDOCTA     : TInterCampo;
        B_REFERENCIADO      : TInterCampo;
        CVE_CALCULO         : TInterCampo; //Clave del Cálculo de Intereses
        DESC_CALC_INT       : TInterCampo; //Descripción de Cálculo de Intereses
        CVE_AMORTIZACION    : TInterCampo; //Tipo de Amortización
        DESC_TIPO_AMORT     : TInterCampo; //Descripción del Tipo de Amortización
        CVE_PAG_INTERES     : TInterCampo; //Pago de Intereses
        DESC_PAGO_INT       : TInterCampo; //Descripción de Pago de Intereses
        CVE_LIQUIDACION     : TInterCampo; //Tipo Liquidación
        DESC_TIPO_LIQ       : TInterCampo; //Descipción de Liquidación
        CVE_TASA_REFER      : TInterCampo; //Tasa de Referencia
        DESC_TASA_REFER     : TInterCampo; //Descripción de Tasa de Referencia
        OPERADOR_STASA      : TInterCampo;
        SOBRETASA           : TInterCampo;
        TASA_CREDITO        : TInterCampo;
        CICLO_REVISION      : TInterCampo;
        DIAS_PLAZO          : TInterCampo;
        F_LIQUIDACION       : TInterCampo;
        FACT_MORAS          : TInterCampo;
        FACT_PROPOR_GAR     : TInterCampo;
        F_TRASPASO_VENC     : TInterCampo;
        ID_CRE_RENOVADO     : TInterCampo;
        ID_CRE_RENUEVA      : TInterCampo;
        TIPO_DISPOSICION    : TInterCampo;
        B_ENVIA_BNC         : TInterCampo;
        ID_PROM_ADM         : TInterCampo; //Promotor Admon.
        NOMBRE_PROM_ADM     : TInterCampo; //Nombre de Promotor Admon.
        IMP_CREDITO         : TInterCampo;
        IMP_DISPUESTO       : TInterCampo;
        SDO_INSOLUTO        : TInterCampo;
        IMP_CAPITAL_PAG     : TInterCampo;
        IMP_CAPITAL_VDO     : TInterCampo;
        IMP_COMISION_PAG    : TInterCampo;
        IMP_COMISION_VDO    : TInterCampo;
        IMP_INTERES_PAG     : TInterCampo;
        IMP_INTERES_VDO     : TInterCampo;
        IMP_IVA_COM_PAG     : TInterCampo;
        IMP_IVA_COM_VDO     : TInterCampo;
        IMP_IVA_INT_PAG     : TInterCampo;
        IMP_IVA_INT_VDO     : TInterCampo;
        CVE_CALIF_CRE       : TInterCampo;
        SIT_CREDITO         : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_AUTORIZA          : TInterCampo;
        CVE_USU_AUTORIZA    : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;
        ID_TRANSAC_DISP     : TInterCampo;
        REF_EXTERNA_LIQ     : TInterCampo;
        B_FINANC_ADIC       : TInterCampo;
        CVE_OPERATIVA       : TInterCampo; //Clave de Operativa
        NOM_CVE_OPERATIVA   : TInterCampo; //Descipción de Operativa
        DIA_PAGO_CAP        : TInterCampo;
        DIA_PAGO_INT        : TInterCampo;
        DIA_REVISION        : TInterCampo;
        F_INICIO            : TInterCampo;
        F_INI_PAG_CAP       : TInterCampo;
        F_INI_PAG_INT       : TInterCampo;
        F_PROX_REVISION     : TInterCampo;
        F_VENCIMIENTO       : TInterCampo;
        ID_CONTROL_EXT      : TInterCampo;
        ID_CRED_EXTERNO     : TInterCampo;
        IMP_IVA_MOR_CAP     : TInterCampo;
        IMP_IVA_MOR_COM     : TInterCampo;
        IMP_IVA_MOR_FIN     : TInterCampo;
        IMP_MINISTRADO      : TInterCampo;
        IMP_MOR_CAPITAL     : TInterCampo;
        IMP_MOR_COMISION    : TInterCampo;
        IMP_MOR_FINAN_A     : TInterCampo;
        IMP_VDO_FINAN_A     : TInterCampo;
        NUM_UNIDADES_CP     : TInterCampo;
        NUM_UNIDADES_IN     : TInterCampo;
        NUM_UNIDADES_RE     : TInterCampo;
        PCT_COMISION        : TInterCampo;
        SDO_FINAN_ADIC      : TInterCampo;
        SDO_VIG_TOTAL       : TInterCampo;
        TASA_BASE           : TInterCampo;
        TX_COMENTARIOS      : TInterCampo;
        UNIDAD_TIEMPO_CP    : TInterCampo; //U. Tiempo Amortiza.
        DESC_UNI_TIEMPO_CP  : TInterCampo; //Descripción de U. Tiempo Amortiza.
        UNIDAD_TIEMPO_IN    : TInterCampo; //U. Tiempo Interés
        DESC_UNI_TIEMPO_IN  : TInterCampo; //Descripción de U. Tiempo Interés
        UNIDAD_TIEMPO_RE    : TInterCampo; //U. Tiempo Rev. Tasa
        DESC_UNI_TIEMPO_RE  : TInterCampo; //Descripción de U. Tiempo Rev. Tasa
        CVE_TIPO_TASA       : TInterCampo;
        CVE_CALCULO_M       : TInterCampo;
        CVE_TASA_REFER_M    : TInterCampo;
        OPERADOR_STASA_M    : TInterCampo;
        SOBRETASA_M         : TInterCampo;
        UNIDAD_TIEMPO_M     : TInterCampo;
        NUM_UNIDAD_RE_M     : TInterCampo;
        DIA_REVISION_M      : TInterCampo;
        ID_ACREDITADO       : TInterCampo;
        NOM_ACREDITADO      : TInterCampo;
        NOMB_CONTRATO       : TInterCampo;
        CVE_PER_JURIDICA    : TInterCampo;
        CVE_MONEDA          : TInterCampo;

        // <SATV4766 05/12/2008>
        CVE_ORIGEN          : TInterCampo;
        DESC_ORIGEN         : TInterCampo;
        CVE_PRESUPUESTO     : TInterCampo;
        DESC_PRESUPUESTO    : TInterCampo;
        // </SATV4766 05/12/2008>        

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        procedure   LlenaDatos(PPIdCredito : Integer);
      published
      end;
      Function  CreaTBCredito(PPIdCredito : Integer; Apli: TInterApli) : TBasicCred;
implementation

constructor TBasicCred.Create( AOwner : TComponent );
begin Inherited;
   ID_CREDITO := CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
   ID_CONTRATO := CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,False);
   FOL_CONTRATO := CreaCampo('FOL_CONTRATO',ftInteger,tsNinguno,tsNinguno,False);
   CVE_PRODUCTO  :=CreaCampo('CVE_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
   DESC_L_PRODUCTO :=CreaCampo('DESC_L_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
   B_COB_AUT := CreaCampo('B_COB_AUT',ftString,tsNinguno,tsNinguno,False);
   B_APLICA_COM := CreaCampo('B_APLICA_COM',ftString,tsNinguno,tsNinguno,False);
   B_APLICA_IVA := CreaCampo('B_APLICA_IVA',ftString,tsNinguno,tsNinguno,False);
   B_GENERA_EDOCTA := CreaCampo('B_GENERA_EDOCTA',ftString,tsNinguno,tsNinguno,False);
   B_REFERENCIADO := CreaCampo('B_REFERENCIADO',ftString,tsNinguno,tsNinguno,False);
   CVE_CALCULO := CreaCampo('CVE_CALCULO',ftString,tsNinguno,tsNinguno,False);
   CVE_AMORTIZACION := CreaCampo('CVE_AMORTIZACION',ftString,tsNinguno,tsNinguno,False);
   CVE_PAG_INTERES := CreaCampo('CVE_PAG_INTERES',ftString,tsNinguno,tsNinguno,False);
   CVE_LIQUIDACION := CreaCampo('CVE_LIQUIDACION',ftString,tsNinguno,tsNinguno,False);
   CVE_TASA_REFER := CreaCampo('CVE_TASA_REFER',ftString,tsNinguno,tsNinguno,False);
   OPERADOR_STASA := CreaCampo('OPERADOR_STASA',ftString,tsNinguno,tsNinguno,False);
   SOBRETASA := CreaCampo('SOBRETASA',ftFloat,tsNinguno,tsNinguno,False);
   TASA_CREDITO := CreaCampo('TASA_CREDITO',ftFloat,tsNinguno,tsNinguno,False);
   CICLO_REVISION := CreaCampo('CICLO_REVISION',ftInteger,tsNinguno,tsNinguno,False);
   DIAS_PLAZO := CreaCampo('DIAS_PLAZO',ftInteger,tsNinguno,tsNinguno,False);
   F_LIQUIDACION := CreaCampo('F_LIQUIDACION',ftDate,tsNinguno,tsNinguno,False);
   FACT_MORAS := CreaCampo('FACT_MORAS',ftFloat,tsNinguno,tsNinguno,False);
   FACT_PROPOR_GAR := CreaCampo('FACT_PROPOR_GAR',ftFloat,tsNinguno,tsNinguno,False);
   F_TRASPASO_VENC := CreaCampo('F_TRASPASO_VENC',ftDate,tsNinguno,tsNinguno,False);
   ID_CRE_RENOVADO := CreaCampo('ID_CRE_RENOVADO',ftInteger,tsNinguno,tsNinguno,False);
   ID_CRE_RENUEVA := CreaCampo('ID_CRE_RENUEVA',ftInteger,tsNinguno,tsNinguno,False);
   TIPO_DISPOSICION := CreaCampo('TIPO_DISPOSICION',ftString,tsNinguno,tsNinguno,False);
   B_ENVIA_BNC := CreaCampo('B_ENVIA_BNC',ftString,tsNinguno,tsNinguno,False);
   ID_PROM_ADM := CreaCampo('ID_PROM_ADM',ftInteger,tsNinguno,tsNinguno,False);
   IMP_CREDITO := CreaCampo('IMP_CREDITO',ftFloat,tsNinguno,tsNinguno,False);
   IMP_DISPUESTO := CreaCampo('IMP_DISPUESTO',ftFloat,tsNinguno,tsNinguno,False);
   SDO_INSOLUTO := CreaCampo('SDO_INSOLUTO',ftFloat,tsNinguno,tsNinguno,False);
   IMP_CAPITAL_PAG := CreaCampo('IMP_CAPITAL_PAG',ftFloat,tsNinguno,tsNinguno,False);
   IMP_CAPITAL_VDO := CreaCampo('IMP_CAPITAL_VDO',ftFloat,tsNinguno,tsNinguno,False);
   IMP_COMISION_PAG := CreaCampo('IMP_COMISION_PAG',ftFloat,tsNinguno,tsNinguno,False);
   IMP_COMISION_VDO := CreaCampo('IMP_COMISION_VDO',ftFloat,tsNinguno,tsNinguno,False);
   IMP_INTERES_PAG := CreaCampo('IMP_INTERES_PAG',ftFloat,tsNinguno,tsNinguno,False);
   IMP_INTERES_VDO := CreaCampo('IMP_INTERES_VDO',ftFloat,tsNinguno,tsNinguno,False);
   IMP_IVA_COM_PAG := CreaCampo('IMP_IVA_COM_PAG',ftFloat,tsNinguno,tsNinguno,False);
   IMP_IVA_COM_VDO := CreaCampo('IMP_IVA_COM_VDO',ftFloat,tsNinguno,tsNinguno,False);
   IMP_IVA_INT_PAG := CreaCampo('IMP_IVA_INT_PAG',ftFloat,tsNinguno,tsNinguno,False);
   IMP_IVA_INT_VDO := CreaCampo('IMP_IVA_INT_VDO',ftFloat,tsNinguno,tsNinguno,False);
   CVE_CALIF_CRE := CreaCampo('CVE_CALIF_CRE',ftString,tsNinguno,tsNinguno,False);
   SIT_CREDITO := CreaCampo('SIT_CREDITO',ftString,tsNinguno,tsNinguno,False);
   F_ALTA := CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,False);
   CVE_USU_ALTA := CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,False);
   F_AUTORIZA := CreaCampo('F_AUTORIZA',ftDate,tsNinguno,tsNinguno,False);
   CVE_USU_AUTORIZA := CreaCampo('CVE_USU_AUTORIZA',ftString,tsNinguno,tsNinguno,False);
   F_MODIFICA := CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,False);
   CVE_USU_MODIFICA := CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,False);
   ID_TRANSAC_DISP := CreaCampo('ID_TRANSAC_DISP',ftInteger,tsNinguno,tsNinguno,False);
   REF_EXTERNA_LIQ := CreaCampo('REF_EXTERNA_LIQ',ftString,tsNinguno,tsNinguno,False);
   B_FINANC_ADIC := CreaCampo('B_FINANC_ADIC',ftString,tsNinguno,tsNinguno,False);
   CVE_OPERATIVA := CreaCampo('CVE_OPERATIVA',ftString,tsNinguno,tsNinguno,False);
   DIA_PAGO_CAP := CreaCampo('DIA_PAGO_CAP',ftInteger,tsNinguno,tsNinguno,False);
   DIA_PAGO_INT := CreaCampo('DIA_PAGO_INT',ftInteger,tsNinguno,tsNinguno,False);
   DIA_REVISION := CreaCampo('DIA_REVISION',ftInteger,tsNinguno,tsNinguno,False);
   F_INICIO := CreaCampo('F_INICIO',ftDate,tsNinguno,tsNinguno,False);
   F_INI_PAG_CAP := CreaCampo('F_INI_PAG_CAP',ftDate,tsNinguno,tsNinguno,False);
   F_INI_PAG_INT := CreaCampo('F_INI_PAG_INT',ftDate,tsNinguno,tsNinguno,False);
   F_PROX_REVISION := CreaCampo('F_PROX_REVISION',ftDate,tsNinguno,tsNinguno,False);
   F_VENCIMIENTO := CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,False);
   ID_CONTROL_EXT := CreaCampo('ID_CONTROL_EXT',ftString,tsNinguno,tsNinguno,False);
   ID_CRED_EXTERNO := CreaCampo('ID_CRED_EXTERNO',ftString,tsNinguno,tsNinguno,False);
   IMP_IVA_MOR_CAP := CreaCampo('IMP_IVA_MOR_CAP',ftFloat,tsNinguno,tsNinguno,False);
   IMP_IVA_MOR_COM := CreaCampo('IMP_IVA_MOR_COM',ftFloat,tsNinguno,tsNinguno,False);
   IMP_IVA_MOR_FIN := CreaCampo('IMP_IVA_MOR_FIN',ftFloat,tsNinguno,tsNinguno,False);
   IMP_MINISTRADO := CreaCampo('IMP_MINISTRADO',ftFloat,tsNinguno,tsNinguno,False);
   IMP_MOR_CAPITAL := CreaCampo('IMP_MOR_CAPITAL',ftFloat,tsNinguno,tsNinguno,False);
   IMP_MOR_COMISION := CreaCampo('IMP_MOR_COMISION',ftFloat,tsNinguno,tsNinguno,False);
   IMP_MOR_FINAN_A := CreaCampo('IMP_MOR_FINAN_A',ftFloat,tsNinguno,tsNinguno,False);
   IMP_VDO_FINAN_A := CreaCampo('IMP_VDO_FINAN_A',ftFloat,tsNinguno,tsNinguno,False);
   NUM_UNIDADES_CP := CreaCampo('NUM_UNIDADES_CP',ftInteger,tsNinguno,tsNinguno,False);
   NUM_UNIDADES_IN := CreaCampo('NUM_UNIDADES_IN',ftInteger,tsNinguno,tsNinguno,False);
   NUM_UNIDADES_RE := CreaCampo('NUM_UNIDADES_RE',ftInteger,tsNinguno,tsNinguno,False);
   PCT_COMISION := CreaCampo('PCT_COMISION',ftFloat,tsNinguno,tsNinguno,False);
   SDO_FINAN_ADIC := CreaCampo('SDO_FINAN_ADIC',ftFloat,tsNinguno,tsNinguno,False);
   SDO_VIG_TOTAL := CreaCampo('SDO_VIG_TOTAL',ftFloat,tsNinguno,tsNinguno,False);
   TASA_BASE := CreaCampo('TASA_BASE',ftFloat,tsNinguno,tsNinguno,False);
   TX_COMENTARIOS := CreaCampo('TX_COMENTARIOS',ftString,tsNinguno,tsNinguno,False);
   UNIDAD_TIEMPO_CP := CreaCampo('UNIDAD_TIEMPO_CP',ftString,tsNinguno,tsNinguno,False);
   UNIDAD_TIEMPO_IN := CreaCampo('UNIDAD_TIEMPO_IN',ftString,tsNinguno,tsNinguno,False);
   UNIDAD_TIEMPO_RE := CreaCampo('UNIDAD_TIEMPO_RE',ftString,tsNinguno,tsNinguno,False);
   CVE_TIPO_TASA := CreaCampo('CVE_TIPO_TASA',ftString,tsNinguno,tsNinguno,False);
   CVE_CALCULO_M := CreaCampo('CVE_CALCULO_M',ftString,tsNinguno,tsNinguno,False);
   CVE_TASA_REFER_M := CreaCampo('CVE_TASA_REFER_M',ftString,tsNinguno,tsNinguno,False);
   OPERADOR_STASA_M := CreaCampo('OPERADOR_STASA_M',ftString,tsNinguno,tsNinguno,False);
   SOBRETASA_M := CreaCampo('SOBRETASA_M',ftFloat,tsNinguno,tsNinguno,False);
   UNIDAD_TIEMPO_M := CreaCampo('UNIDAD_TIEMPO_M',ftString,tsNinguno,tsNinguno,False);
   NUM_UNIDAD_RE_M := CreaCampo('NUM_UNIDAD_RE_M',ftInteger,tsNinguno,tsNinguno,False);
   DIA_REVISION_M := CreaCampo('DIA_REVISION_M',ftInteger,tsNinguno,tsNinguno,False);
   // INICIO de Código Agregado por SATV4766 el 17/12/2004
   ID_ACREDITADO := CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);
   NOM_ACREDITADO := CreaCampo('NOM_ACREDITADO',ftString,tsNinguno,tsNinguno,False);
   NOMB_CONTRATO := CreaCampo('NOMB_CONTRATO',ftString,tsNinguno,tsNinguno,False);
   CVE_PER_JURIDICA := CreaCampo('CVE_PER_JURIDICA',ftString,tsNinguno,tsNinguno,False);
   CVE_MONEDA := CreaCampo('CVE_MONEDA',ftInteger,tsNinguno,tsNinguno,False);
   // FIN de Código Agregado por SATV4766 el 17/12/2004
   //
   // <SATV4766 05/12/2008>
   CVE_ORIGEN := CreaCampo('CVE_ORIGEN',ftString,tsNinguno,tsNinguno,False);
   DESC_ORIGEN := CreaCampo('DESC_ORIGEN',ftString,tsNinguno,tsNinguno,False);
   CVE_PRESUPUESTO := CreaCampo('CVE_PRESUPUESTO',ftString,tsNinguno,tsNinguno,False);
   DESC_PRESUPUESTO := CreaCampo('DESC_PRESUPUESTO',ftString,tsNinguno,tsNinguno,False);
   // </SATV4766 05/12/2008>
   // <RABA OCT 2013> PROYECTO CAMBIO TASA
   DESC_TASA_REFER := CreaCampo('DESC_TASA_REFER',ftString,tsNinguno,tsNinguno,False);
   DESC_CALC_INT   := CreaCampo('DESC_CALC_INT',ftString,tsNinguno,tsNinguno,False);
   // </FIN RABA>

   StpName  := ' ';
   UseQuery := False;
   HelpFile := 'IntParamCre.Hlp';
   ShowMenuReporte:=True;
   IsCheckSecu:=False; // No Requiere Seguridades.
end;

Destructor TBasicCred.Destroy;
begin inherited;
end;

Function  CreaTBCredito(PPIdCredito : Integer; Apli: TInterApli) : TBasicCred;
var
   BasicCred: TBasicCred;
begin
   BasicCred:= TBasicCred.Create(BasicCred);
   BasicCred.Apli:= Apli;
   BasicCred.LlenaDatos(PPIdCredito);
   CreaTBCredito:= BasicCred;
end;

procedure TBasicCred.LlenaDatos(PPIdCredito : Integer);
var
   vlSql  : String;
   QDatos : TQuery;
begin
   // Se inicia
   vlSql := '       SELECT'+coCRLF+
            '            -- INICIO de Código Agregado por SATV4766 el 17/12/2004'+coCRLF+
            '             CA.ID_ACREDITADO,'+coCRLF+
            '             DECODE(P.CVE_PER_JURIDICA,''PF'', PF.NOMBRE_PERSONA || '' '' || PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO,'+coCRLF+
            '                    PM.NOM_RAZON_SOCIAL) AS NOM_ACREDITADO,'+coCRLF+
            '             AUT.NOMB_CONTRATO,'+coCRLF+
            '             P.CVE_PER_JURIDICA,'+coCRLF+
            '             AUT.CVE_MONEDA,'+coCRLF+
            '            -- FIN de Código Agregado por SATV4766 el 17/12/2004'+coCRLF+
            '             CTO.CVE_PRODUCTO_CRE, CP.DESC_L_PRODUCTO,'+coCRLF+
            '             DESC_CALCULO AS DESC_CALC_INT,'+coCRLF+
            '             DESC_AMORTIZA AS DESC_TIPO_AMORT,'+coCRLF+
            '             DESC_PAG_INTERES AS DESC_PAGO_INT,'+coCRLF+
            '             DESC_LIQUIDACION AS DESC_TIPO_LIQ,'+coCRLF+
            '             DESC_TASA_INDIC AS DESC_TASA_REFER,'+coCRLF+
            '             PROM.NOMBRE AS NOMBRE_PROM_ADM,'+coCRLF+
            '             DESC_OPERATIVA AS NOM_CVE_OPERATIVA,'+coCRLF+
            '             UT1.DESCRIPCION AS DESC_UNI_TIEMPO_CP,'+coCRLF+
            '             UT2.DESCRIPCION AS DESC_UNI_TIEMPO_IN,'+coCRLF+
            '             UT3.DESCRIPCION AS DESC_UNI_TIEMPO_RE,'+coCRLF+
            '             -- INICIO de Código Agregado por SATV4766 el 05/12/2008'+coCRLF+
            '             CR.ID_CREDITO,'+coCRLF+
            '             CR.ID_CONTRATO,'+coCRLF+
            '             CR.B_COB_AUT,'+coCRLF+
            '             CR.B_APLICA_COM,'+coCRLF+
            '             CR.B_APLICA_IVA,'+coCRLF+
            '             CR.B_GENERA_EDOCTA,'+coCRLF+
            '             CR.B_REFERENCIADO,'+coCRLF+
            '             CR.CVE_CALCULO,'+coCRLF+
            '             CR.CVE_AMORTIZACION,'+coCRLF+
            '             CR.CVE_PAG_INTERES,'+coCRLF+
            '             CR.CVE_LIQUIDACION,'+coCRLF+
            '             CR.CVE_TASA_REFER,'+coCRLF+
            '             CR.OPERADOR_STASA,'+coCRLF+
            '             CR.SOBRETASA,'+coCRLF+
            '             CR.TASA_CREDITO,'+coCRLF+
            '             CR.CICLO_REVISION,'+coCRLF+
            '             CR.DIAS_PLAZO,'+coCRLF+
            '             CR.F_LIQUIDACION,'+coCRLF+
            '             CR.FACT_MORAS,'+coCRLF+
            '             CR.FACT_PROPOR_GAR,'+coCRLF+
            '             CR.F_TRASPASO_VENC,'+coCRLF+
            '             CR.ID_CRE_RENOVADO,'+coCRLF+
            '             CR.ID_CRE_RENUEVA,'+coCRLF+
            '             CR.TIPO_DISPOSICION,'+coCRLF+
            '             CR.B_ENVIA_BNC,'+coCRLF+
            '             CR.ID_PROM_ADM,'+coCRLF+
            '             CR.IMP_CREDITO,'+coCRLF+
            '             CR.IMP_DISPUESTO,'+coCRLF+
            '             CR.SDO_INSOLUTO,'+coCRLF+
            '             CR.IMP_CAPITAL_PAG,'+coCRLF+
            '             CR.IMP_CAPITAL_VDO,'+coCRLF+
            '             CR.IMP_COMISION_PAG,'+coCRLF+
            '             CR.IMP_COMISION_VDO,'+coCRLF+
            '             CR.IMP_INTERES_PAG,'+coCRLF+
            '             CR.IMP_INTERES_VDO,'+coCRLF+
            '             CR.IMP_IVA_COM_PAG,'+coCRLF+
            '             CR.IMP_IVA_COM_VDO,'+coCRLF+
            '             CR.IMP_IVA_INT_PAG,'+coCRLF+
            '             CR.IMP_IVA_INT_VDO,'+coCRLF+
            '             CR.CVE_CALIF_CRE,'+coCRLF+
            '             CR.SIT_CREDITO,'+coCRLF+
            '             CR.F_ALTA,'+coCRLF+
            '             CR.CVE_USU_ALTA,'+coCRLF+
            '             CR.F_AUTORIZA,'+coCRLF+
            '             CR.CVE_USU_AUTORIZA,'+coCRLF+
            '             CR.F_MODIFICA,'+coCRLF+
            '             CR.CVE_USU_MODIFICA,'+coCRLF+
            '             CR.ID_TRANSAC_DISP,'+coCRLF+
            '             CR.FOL_CONTRATO,'+coCRLF+
            '             CR.REF_EXTERNA_LIQ,'+coCRLF+
            '             CR.B_FINANC_ADIC,'+coCRLF+
            '             CR.CVE_OPERATIVA,'+coCRLF+
            '             CR.DIA_PAGO_CAP,'+coCRLF+
            '             CR.DIA_PAGO_INT,'+coCRLF+
            '             CR.DIA_REVISION,'+coCRLF+
            '             CR.F_INICIO,'+coCRLF+
            '             CR.F_INI_PAG_CAP,'+coCRLF+
            '             CR.F_INI_PAG_INT,'+coCRLF+
            '             CR.F_PROX_REVISION,'+coCRLF+
            '             CR.F_VENCIMIENTO,'+coCRLF+
            '             CR.ID_CONTROL_EXT,'+coCRLF+
            '             CR.ID_CRED_EXTERNO,'+coCRLF+
            '             CR.IMP_IVA_MOR_CAP,'+coCRLF+
            '             CR.IMP_IVA_MOR_COM,'+coCRLF+
            '             CR.IMP_IVA_MOR_FIN,'+coCRLF+
            '             CR.IMP_MINISTRADO,'+coCRLF+
            '             CR.IMP_MOR_CAPITAL,'+coCRLF+
            '             CR.IMP_MOR_COMISION,'+coCRLF+
            '             CR.IMP_MOR_FINAN_A,'+coCRLF+
            '             CR.IMP_VDO_FINAN_A,'+coCRLF+
            '             CR.NUM_UNIDADES_CP,'+coCRLF+
            '             CR.NUM_UNIDADES_IN,'+coCRLF+
            '             CR.NUM_UNIDADES_RE,'+coCRLF+
            '             CR.PCT_COMISION,'+coCRLF+
            '             CR.SDO_FINAN_ADIC,'+coCRLF+
            '             CR.SDO_VIG_TOTAL,'+coCRLF+
            '             CR.TASA_BASE,'+coCRLF+
            '             CR.TX_COMENTARIOS,'+coCRLF+
            '             CR.UNIDAD_TIEMPO_CP,'+coCRLF+
            '             CR.UNIDAD_TIEMPO_IN,'+coCRLF+
            '             CR.UNIDAD_TIEMPO_RE,'+coCRLF+
            '             CR.CVE_TIPO_TASA,'+coCRLF+
            '             CR.CVE_CALCULO_M,'+coCRLF+
            '             CR.CVE_TASA_REFER_M,'+coCRLF+
            '             CR.DIA_REVISION_M,'+coCRLF+
            '             CR.NUM_UNIDAD_RE_M,'+coCRLF+
            '             CR.OPERADOR_STASA_M,'+coCRLF+
            '             CR.SOBRETASA_M,'+coCRLF+
            '             CR.UNIDAD_TIEMPO_M,'+coCRLF+
            '             ''I'' AS CVE_ORIGEN,'+coCRLF+
            '             ''ICRE'' AS DESC_ORIGEN,'+coCRLF+
            '             CP.CVE_PRESUPUESTO,'+coCRLF+
            '             CPRE.DESC_PRESUPUESTO'+coCRLF+
            '             -- Termina Código Agregado por SATV4766 el 05/12/2008'+coCRLF+
            '        FROM (SELECT * FROM CR_CREDITO'+coCRLF+
            '               WHERE ID_CREDITO ='+ IntToStr(PPIdCredito)+' )  CR,'+
            '             CR_CONTRATO CTO, CR_PRODUCTO CP, CR_CALCULO_INT CALC,'+coCRLF+
            '             CR_AMORTIZACION AMORT, CR_PAGO_INTERES PINT,'+coCRLF+
            '             CR_LIQUIDA_DISP LIQ, TASA_INDIC_FINAN TFINAN, PERSONA PROM,'+coCRLF+
            '             CR_FIRA_OPERA FOPE, CR_UNIDAD_TIEMPO UT1, CR_UNIDAD_TIEMPO UT2,'+coCRLF+
            '             CR_UNIDAD_TIEMPO UT3,'+coCRLF+
            '             CONTRATO AUT, CR_ACREDITADO CA, PERSONA P, PERSONA_FISICA PF, PERSONA_MORAL PM, --'+coCRLF+
            '             -- INICIO de Código Agregado por SATV4766 el 05/12/2008'+coCRLF+
            '             CRE_PRESUPUESTO CPRE'+coCRLF+
            '             -- Termina Código Agregado por SATV4766 el 05/12/2008'+coCRLF+
            '       WHERE CTO.ID_CONTRATO = CR.ID_CONTRATO'+coCRLF+
            '         AND CTO.FOL_CONTRATO = CR.FOL_CONTRATO'+coCRLF+
            '         AND CP.CVE_PRODUCTO_CRE = CTO.CVE_PRODUCTO_CRE'+coCRLF+
            '         AND CALC.CVE_CALCULO_INT = CR.CVE_CALCULO'+coCRLF+
            '         AND AMORT.CVE_AMORTIZACION = CR.CVE_AMORTIZACION'+coCRLF+
            '         AND PINT.CVE_PAG_INTERES = CR.CVE_PAG_INTERES'+coCRLF+
            '         AND LIQ.CVE_LIQUIDACION = CR.CVE_LIQUIDACION'+coCRLF+
            '         AND TFINAN.CVE_TASA_INDICAD = CR.CVE_TASA_REFER'+coCRLF+
            '         AND PROM.ID_PERSONA = CR.ID_PROM_ADM'+coCRLF+
            '         AND FOPE.CVE_OPERATIVA (+)= CR.CVE_OPERATIVA'+coCRLF+
            '         AND UT1.CVE_UNIDAD_TIEMP (+)= CR.UNIDAD_TIEMPO_CP'+coCRLF+
            '         AND UT2.CVE_UNIDAD_TIEMP (+)= CR.UNIDAD_TIEMPO_IN'+coCRLF+
            '         AND UT3.CVE_UNIDAD_TIEMP (+)= CR.UNIDAD_TIEMPO_RE'+coCRLF+
            '         -- INICIO de Código Agregado por SATV4766 el 17/12/2004'+coCRLF+
            '         AND AUT.ID_CONTRATO = CTO.ID_CONTRATO'+coCRLF+
            '         AND CA.ID_ACREDITADO = AUT.ID_TITULAR'+coCRLF+
            '         AND P.ID_PERSONA = CA.ID_ACREDITADO'+coCRLF+
            '         AND PF.ID_PERSONA (+)= P.ID_PERSONA'+coCRLF+
            '         AND PM.ID_PERSONA (+)= P.ID_PERSONA'+coCRLF+
            '         -- FIN de Código Agregado por SATV4766 el 17/12/2004'+coCRLF+
            '         --'+coCRLF+
            '         -- INICIO de Código Agregado por SATV4766 el 05/12/2008'+coCRLF+
            '         AND CPRE.CVE_PRESUPUESTO (+)= CP.CVE_PRESUPUESTO'+coCRLF+
            '  UNION ALL'+coCRLF+
            '         SELECT'+coCRLF+
            '             CTO.ID_TITULAR AS ID_ACREDITADO,'+coCRLF+
            '             DECODE(P.CVE_PER_JURIDICA,''PF'', PF.NOMBRE_PERSONA || '' '' || PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO,'+coCRLF+
            '                    PM.NOM_RAZON_SOCIAL) AS NOM_ACREDITADO,'+coCRLF+
            '             CTO.NOMB_CONTRATO,'+coCRLF+
            '             P.CVE_PER_JURIDICA,'+coCRLF+
            '             CTO.CVE_MONEDA,'+coCRLF+
            '             TO_CHAR(CO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE,'+coCRLF+
            '             CSTB.DESC_SUB_TIPO AS DESC_L_PRODUCTO,'+coCRLF+
            '             '' '' AS DESC_CALC_INT,'+coCRLF+
            '             '' '' AS DESC_TIPO_AMORT,'+coCRLF+
            '             '' '' AS DESC_PAGO_INT,'+coCRLF+
            '             '' '' AS DESC_TIPO_LIQ,'+coCRLF+
            '             '' '' AS DESC_TASA_REFER,'+coCRLF+
            '             PROMADM.NOMBRE AS NOMBRE_PROM_ADM,'+coCRLF+
            '             '' '' AS NOM_CVE_OPERATIVA, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             '' '' AS DESC_UNI_TIEMPO_CP,'+coCRLF+
            '             '' '' AS DESC_UNI_TIEMPO_IN,'+coCRLF+
            '             '' '' AS DESC_UNI_TIEMPO_RE,'+coCRLF+
            '             CC.ID_CREDITO,'+coCRLF+
            '             CTO.ID_CONTRATO,'+coCRLF+
            '             CC.B_COBRANZA AS B_COB_AUT,'+coCRLF+
            '             CC.B_APLICA_COM,'+coCRLF+
            '             CC.B_APLICA_IVA,'+coCRLF+
            '             CC.B_GENERA_EDOCTA,'+coCRLF+
            '             CC.B_REFERENCIADO,'+coCRLF+
            '             CC.CVE_CALCULO,'+coCRLF+
            '             '' '' AS CVE_AMORTIZACION,'+coCRLF+
            '             '' '' AS CVE_PAG_INTERES,'+coCRLF+
            '             '' '' AS CVE_LIQUIDACION,'+coCRLF+
            '             CC.CVE_TASA_REFER,'+coCRLF+
            '             CC.OPERADOR_STASA,'+coCRLF+
            '             CC.SOBRETASA,'+coCRLF+
            '             CC.TASA_CREDITO,'+coCRLF+
            '             CC.CICLO_REVISION,'+coCRLF+
            '             CC.DIAS_PLAZO,'+coCRLF+
            '             CC.F_LIQ_BNC AS F_LIQUIDACION,'+coCRLF+
            '             CC.FACT_MORAS,'+coCRLF+
            '             CC.FACT_PROPOR_GAR,'+coCRLF+
            '             CC.F_TRASPASO_VENC,'+coCRLF+
            '             CC.ID_CRE_RENOVADO,'+coCRLF+
            '             CC.ID_CRE_RENUEVA,'+coCRLF+
            '             CC.TIPO_DISPOSICION,'+coCRLF+
            '             CC.B_ENVIA_BNC,'+coCRLF+
            '             CC.ID_PROM_ADM,'+coCRLF+
            '             CC.IMP_CREDITO,'+coCRLF+
            '             CC.IMP_DISPUESTO,'+coCRLF+
            '             CC.SDO_INSOLUTO,'+coCRLF+
            '             CC.IMP_CAPITAL_PAG,'+coCRLF+
            '             CC.IMP_CAPITAL_VDO,'+coCRLF+
            '             CC.IMP_COMISION_PAG,'+coCRLF+
            '             CC.IMP_COMISION_VDO,'+coCRLF+
            '             CC.IMP_INTERES_PAG,'+coCRLF+
            '             CC.IMP_INTERES_VDO,'+coCRLF+
            '             CC.IMP_IVA_COM_PAG,'+coCRLF+
            '             CC.IMP_IVA_COM_VDO,'+coCRLF+
            '             CC.IMP_IVA_INT_PAG,'+coCRLF+
            '             CC.IMP_IVA_INT_VDO,'+coCRLF+
            '             CC.CVE_CALIF AS CVE_CALIF_CRE,'+coCRLF+
            '             CC.SIT_CREDITO,'+coCRLF+
            '             CC.F_CAPTURA_CRED AS F_ALTA,'+coCRLF+
            '             CC.CVE_USUAR_ALTA AS CVE_USU_ALTA,'+coCRLF+
            '             CC.F_AUT_OPERACION AS F_AUTORIZA,'+coCRLF+
            '             CC.CVE_USU_AUT AS CVE_USU_AUTORIZA,'+coCRLF+
            '             TO_DATE(''01/12/1899'',''DD/MM/YYYY'') AS F_MODIFICA, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             '' '' AS CVE_USU_MODIFICA,'+coCRLF+
            '             0 AS ID_TRANSAC_DISP, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             0 AS FOL_CONTRATO, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             '' '' AS REF_EXTERNA_LIQ, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             '' '' AS B_FINANC_ADIC, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             '' '' AS CVE_OPERATIVA, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             0 AS DIA_PAGO_CAP, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             0 AS DIA_PAGO_INT, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             0 AS DIA_REVISION, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             CC.F_VALOR_CRED AS F_INICIO,'+coCRLF+
            '             TO_DATE(''01/12/1899'',''DD/MM/YYYY'') AS F_INI_PAG_CAP,'+coCRLF+
            '             TO_DATE(''01/12/1899'',''DD/MM/YYYY'') AS F_INI_PAG_INT,'+coCRLF+
            '             TO_DATE(''01/12/1899'',''DD/MM/YYYY'') AS F_PROX_REVISION,'+coCRLF+
            '             (CC.F_VALOR_CRED + CC.DIAS_PLAZO) AS F_VENCIMIENTO,'+coCRLF+
            '             '' '' AS ID_CONTROL_EXT, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             '' '' AS ID_CRED_EXTERNO, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             0 AS IMP_IVA_MOR_CAP, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             0 AS IMP_IVA_MOR_COM, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             0 AS IMP_IVA_MOR_FIN, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             0 AS IMP_MINISTRADO, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             0 AS IMP_MOR_CAPITAL,  -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             0 AS IMP_MOR_COMISION, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             0 AS IMP_MOR_FINAN_A, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             0 AS IMP_VDO_FINAN_A, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             CC.NUM_PER_ACT_CAP AS NUM_UNIDADES_CP,'+coCRLF+
            '             CC.NUM_PER_ACT_INT AS NUM_UNIDADES_IN,'+coCRLF+
            '             0 AS NUM_UNIDADES_RE,  -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             0 AS PCT_COMISION, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             0 AS SDO_FINAN_ADIC, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             CC.SDO_INSOLUTO AS  SDO_VIG_TOTAL,'+coCRLF+
            '             0 AS TASA_BASE, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             '' '' AS TX_COMENTARIOS, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             '' '' AS UNIDAD_TIEMPO_CP, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             '' '' AS UNIDAD_TIEMPO_IN, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             '' '' AS UNIDAD_TIEMPO_RE, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             '' '' AS CVE_TIPO_TASA, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             '' '' AS CVE_CALCULO_M, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             '' '' AS CVE_TASA_REFER_M, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             0 AS DIA_REVISION_M, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             0 AS NUM_UNIDAD_RE_M, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             '' '' AS  OPERADOR_STASA_M, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             0 AS SOBRETASA_M, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             '' '' AS UNIDAD_TIEMPO_M, -- No se cuenta con este dato en Intercreditos'+coCRLF+
            '             ''C'' AS CVE_ORIGEN,'+coCRLF+
            '             ''INTER'' AS DESC_ORIGEN,'+coCRLF+
            '             CC.CVE_PRESUPUESTO,'+coCRLF+
            '             CPRE.DESC_PRESUPUESTO'+coCRLF+
            '          FROM'+coCRLF+
            '            ( SELECT CC.*'+coCRLF+
            '              FROM CRE_CREDITO CC'+coCRLF+
            '              WHERE CC.ID_CREDITO = '+IntToStr(PPIdCredito)+coCRLF+
            '                AND CC.SIT_CREDITO NOT IN (''CA'',''TA'')'+coCRLF+
            '            ) CC,'+coCRLF+
            '            CONTRATO CTO,'+coCRLF+
            '            CRE_CONTRATO CO,'+coCRLF+
            '            CRE_SUB_TIP_BCO CSTB,'+coCRLF+
            '            PERSONA P,'+coCRLF+
            '            PERSONA_FISICA PF,'+coCRLF+
            '            PERSONA_MORAL PM,'+coCRLF+
            '            CRE_PRESUPUESTO CPRE,'+coCRLF+
            '            PERSONA PROMADM'+coCRLF+
            '          WHERE CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '            AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '            AND CSTB.CVE_SUB_TIP_BCO = CO.CVE_SUB_TIP_BCO'+coCRLF+
            '            AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
            '            AND PROMADM.ID_PERSONA = CC.ID_PROM_ADM'+coCRLF+
            '            AND PF.ID_PERSONA (+)= CTO.ID_TITULAR'+coCRLF+
            '            AND PM.ID_PERSONA (+)= CTO.ID_TITULAR'+coCRLF+
            '            AND CPRE.CVE_PRESUPUESTO (+)= CC.CVE_PRESUPUESTO'+coCRLF+
            '         -- Termina Código Agregado por SATV4766 el 05/12/2008'+coCRLF
            ;

   QDatos := GetSqlQuery(vlSql, Apli.DataBaseName, Apli.SessionName, False);
   Try
      If QDatos <> Nil Then Begin
         ID_CREDITO.AsInteger  := QDatos.FieldByName('ID_CREDITO').AsInteger;
         ID_CONTRATO.AsInteger  := QDatos.FieldByName('ID_CONTRATO').AsInteger;
         FOL_CONTRATO.AsInteger  := QDatos.FieldByName('FOL_CONTRATO').AsInteger;
         CVE_PRODUCTO.AsString   := QDatos.FieldByName('CVE_PRODUCTO_CRE').AsString;
         DESC_L_PRODUCTO.AsString := QDatos.FieldByName('DESC_L_PRODUCTO').AsString;
         B_COB_AUT.AsString := QDatos.FieldByName('B_COB_AUT').AsString;
         B_APLICA_COM.AsString := QDatos.FieldByName('B_APLICA_COM').AsString;
         B_APLICA_IVA.AsString := QDatos.FieldByName('B_APLICA_IVA').AsString;
         B_GENERA_EDOCTA.AsString := QDatos.FieldByName('B_GENERA_EDOCTA').AsString;
         B_REFERENCIADO.AsString := QDatos.FieldByName('B_REFERENCIADO').AsString;
         CVE_CALCULO.AsString := QDatos.FieldByName('CVE_CALCULO').AsString;
         CVE_AMORTIZACION.AsString := QDatos.FieldByName('CVE_AMORTIZACION').AsString;
         CVE_PAG_INTERES.AsString := QDatos.FieldByName('CVE_PAG_INTERES').AsString;
         CVE_LIQUIDACION.AsString := QDatos.FieldByName('CVE_LIQUIDACION').AsString;
         CVE_TASA_REFER.AsString := QDatos.FieldByName('CVE_TASA_REFER').AsString;
         OPERADOR_STASA.AsString := QDatos.FieldByName('OPERADOR_STASA').AsString;
         SOBRETASA.AsFloat := QDatos.FieldByName('SOBRETASA').AsFloat;
         TASA_CREDITO.AsFloat := QDatos.FieldByName('TASA_CREDITO').AsFloat;
         CICLO_REVISION.AsInteger := QDatos.FieldByName('CICLO_REVISION').AsInteger;
         DIAS_PLAZO.AsInteger := QDatos.FieldByName('DIAS_PLAZO').AsInteger;
         F_LIQUIDACION.AsDateTime := QDatos.FieldByName('F_LIQUIDACION').AsDateTime;
         FACT_MORAS.AsFloat := QDatos.FieldByName('FACT_MORAS').AsFloat;
         FACT_PROPOR_GAR.AsFloat := QDatos.FieldByName('FACT_PROPOR_GAR').AsFloat;
         F_TRASPASO_VENC.AsDateTime := QDatos.FieldByName('F_TRASPASO_VENC').AsDateTime;
         ID_CRE_RENOVADO.AsInteger := QDatos.FieldByName('ID_CRE_RENOVADO').AsInteger;
         ID_CRE_RENUEVA.AsInteger := QDatos.FieldByName('ID_CRE_RENUEVA').AsInteger;
         TIPO_DISPOSICION.AsString := QDatos.FieldByName('TIPO_DISPOSICION').AsString;
         B_ENVIA_BNC.AsString := QDatos.FieldByName('B_ENVIA_BNC').AsString;
         ID_PROM_ADM.AsInteger := QDatos.FieldByName('ID_PROM_ADM').AsInteger;
         IMP_CREDITO.AsFloat := QDatos.FieldByName('IMP_CREDITO').AsFloat;
         IMP_DISPUESTO.AsFloat := QDatos.FieldByName('IMP_DISPUESTO').AsFloat;
         SDO_INSOLUTO.AsFloat := QDatos.FieldByName('SDO_INSOLUTO').AsFloat;
         IMP_CAPITAL_PAG.AsFloat := QDatos.FieldByName('IMP_CAPITAL_PAG').AsFloat;
         IMP_CAPITAL_VDO.AsFloat := QDatos.FieldByName('IMP_CAPITAL_VDO').AsFloat;
         IMP_COMISION_PAG.AsFloat := QDatos.FieldByName('IMP_COMISION_PAG').AsFloat;
         IMP_COMISION_VDO.AsFloat := QDatos.FieldByName('IMP_COMISION_VDO').AsFloat;
         IMP_INTERES_PAG.AsFloat := QDatos.FieldByName('IMP_INTERES_PAG').AsFloat;
         IMP_INTERES_VDO.AsFloat := QDatos.FieldByName('IMP_INTERES_VDO').AsFloat;
         IMP_IVA_COM_PAG.AsFloat := QDatos.FieldByName('IMP_IVA_COM_PAG').AsFloat;
         IMP_IVA_COM_VDO.AsFloat := QDatos.FieldByName('IMP_IVA_COM_VDO').AsFloat;
         IMP_IVA_INT_PAG.AsFloat := QDatos.FieldByName('IMP_IVA_INT_PAG').AsFloat;
         IMP_IVA_INT_VDO.AsFloat := QDatos.FieldByName('IMP_IVA_INT_VDO').AsFloat;
         CVE_CALIF_CRE.AsString := QDatos.FieldByName('CVE_CALIF_CRE').AsString;
         SIT_CREDITO.AsString := QDatos.FieldByName('SIT_CREDITO').AsString;
         F_ALTA.AsDateTime := QDatos.FieldByName('F_ALTA').AsDateTime;
         CVE_USU_ALTA.AsString := QDatos.FieldByName('CVE_USU_ALTA').AsString;
         F_AUTORIZA.AsDateTime := QDatos.FieldByName('F_AUTORIZA').AsDateTime;
         CVE_USU_AUTORIZA.AsString := QDatos.FieldByName('CVE_USU_AUTORIZA').AsString;
         F_MODIFICA.AsDateTime := QDatos.FieldByName('F_MODIFICA').AsDateTime;
         CVE_USU_MODIFICA.AsString := QDatos.FieldByName('CVE_USU_MODIFICA').AsString;
         ID_TRANSAC_DISP.AsInteger := QDatos.FieldByName('ID_TRANSAC_DISP').AsInteger;
         REF_EXTERNA_LIQ.AsString := QDatos.FieldByName('REF_EXTERNA_LIQ').AsString;
         B_FINANC_ADIC.AsString := QDatos.FieldByName('B_FINANC_ADIC').AsString;
         CVE_OPERATIVA.AsString := QDatos.FieldByName('CVE_OPERATIVA').AsString;
         DIA_PAGO_CAP.AsInteger := QDatos.FieldByName('DIA_PAGO_CAP').AsInteger;
         DIA_PAGO_INT.AsInteger := QDatos.FieldByName('DIA_PAGO_INT').AsInteger;
         DIA_REVISION.AsInteger := QDatos.FieldByName('DIA_REVISION').AsInteger;
         F_INICIO.AsDateTime := QDatos.FieldByName('F_INICIO').AsDateTime;
         F_INI_PAG_CAP.AsDateTime := QDatos.FieldByName('F_INI_PAG_CAP').AsDateTime;
         F_INI_PAG_INT.AsDateTime := QDatos.FieldByName('F_INI_PAG_INT').AsDateTime;
         F_PROX_REVISION.AsDateTime := QDatos.FieldByName('F_PROX_REVISION').AsDateTime;
         F_VENCIMIENTO.AsDateTime := QDatos.FieldByName('F_VENCIMIENTO').AsDateTime;
         ID_CONTROL_EXT.AsString := QDatos.FieldByName('ID_CONTROL_EXT').AsString;
         ID_CRED_EXTERNO.AsString := QDatos.FieldByName('ID_CRED_EXTERNO').AsString;
         IMP_IVA_MOR_CAP.AsFloat := QDatos.FieldByName('IMP_IVA_MOR_CAP').AsFloat;
         IMP_IVA_MOR_COM.AsFloat := QDatos.FieldByName('IMP_IVA_MOR_COM').AsFloat;
         IMP_IVA_MOR_FIN.AsFloat := QDatos.FieldByName('IMP_IVA_MOR_FIN').AsFloat;
         IMP_MINISTRADO.AsFloat := QDatos.FieldByName('IMP_MINISTRADO').AsFloat;
         IMP_MOR_CAPITAL.AsFloat := QDatos.FieldByName('IMP_MOR_CAPITAL').AsFloat;
         IMP_MOR_COMISION.AsFloat := QDatos.FieldByName('IMP_MOR_COMISION').AsFloat;
         IMP_MOR_FINAN_A.AsFloat := QDatos.FieldByName('IMP_MOR_FINAN_A').AsFloat;
         IMP_VDO_FINAN_A.AsFloat := QDatos.FieldByName('IMP_VDO_FINAN_A').AsFloat;
         NUM_UNIDADES_CP.AsInteger := QDatos.FieldByName('NUM_UNIDADES_CP').AsInteger;
         NUM_UNIDADES_IN.AsInteger := QDatos.FieldByName('NUM_UNIDADES_IN').AsInteger;
         NUM_UNIDADES_RE.AsInteger := QDatos.FieldByName('NUM_UNIDADES_RE').AsInteger;
         PCT_COMISION.AsFloat := QDatos.FieldByName('PCT_COMISION').AsFloat;
         SDO_FINAN_ADIC.AsFloat := QDatos.FieldByName('SDO_FINAN_ADIC').AsFloat;
         SDO_VIG_TOTAL.AsFloat := QDatos.FieldByName('SDO_VIG_TOTAL').AsFloat;
         TASA_BASE.AsFloat := QDatos.FieldByName('TASA_BASE').AsFloat;
         TX_COMENTARIOS.AsString := QDatos.FieldByName('TX_COMENTARIOS').AsString;
         UNIDAD_TIEMPO_CP.AsString := QDatos.FieldByName('UNIDAD_TIEMPO_CP').AsString;
         UNIDAD_TIEMPO_IN.AsString := QDatos.FieldByName('UNIDAD_TIEMPO_IN').AsString;
         UNIDAD_TIEMPO_RE.AsString := QDatos.FieldByName('UNIDAD_TIEMPO_RE').AsString;
         CVE_TIPO_TASA.AsString := QDatos.FieldByName('CVE_TIPO_TASA').AsString;
// Comentado por SATV4766 el 10 de Ene 2005
{
         CVE_CALCULO_M.AsString := QDatos.FieldByName('CVE_CALCULO_M').AsString;
         CVE_TASA_REFER_M.AsString := QDatos.FieldByName('CVE_TASA_REFER_M').AsString;
         OPERADOR_STASA_M.AsString := QDatos.FieldByName('OPERADOR_STASA_M').AsString;
         SOBRETASA_M.AsFloat := QDatos.FieldByName('SOBRETASA_M').AsFloat;
         UNIDAD_TIEMPO_M.AsString := QDatos.FieldByName('UNIDAD_TIEMPO_M').AsString;
         NUM_UNIDAD_RE_M.AsInteger := QDatos.FieldByName('NUM_UNIDAD_RE_M').AsInteger;
         DIA_REVISION_M.AsInteger := QDatos.FieldByName('DIA_REVISION_M').AsInteger;
}         
         // INICIO de Código Agregado por SATV4766 el 17/12/2004
         ID_ACREDITADO.AsInteger := QDatos.FieldByName('ID_ACREDITADO').AsInteger;
         NOM_ACREDITADO.AsString := QDatos.FieldByName('NOM_ACREDITADO').AsString;
         NOMB_CONTRATO.AsString := QDatos.FieldByName('NOMB_CONTRATO').AsString;
         CVE_PER_JURIDICA.AsString := QDatos.FieldByName('CVE_PER_JURIDICA').AsString;
         CVE_MONEDA.AsInteger := QDatos.FieldByName('CVE_MONEDA').AsInteger;
         // FIN de Código Agregado por SATV4766 el 17/12/2004


         // <SATV4766 05/12/2008>
         CVE_ORIGEN.AsString := QDatos.FieldByName('CVE_ORIGEN').AsString;
         DESC_ORIGEN.AsString := QDatos.FieldByName('DESC_ORIGEN').AsString;
         CVE_PRESUPUESTO.AsString := QDatos.FieldByName('CVE_PRESUPUESTO').AsString;
         DESC_PRESUPUESTO.AsString := QDatos.FieldByName('DESC_PRESUPUESTO').AsString;
         // </SATV4766 05/12/2008>
         // <RABA OCT 2013> PROYECTO CAMBIO TASA
         DESC_TASA_REFER.AsString := QDatos.FieldByName('DESC_TASA_REFER').AsString;
         DESC_CALC_INT.AsString := QDatos.FieldByName('DESC_CALC_INT').AsString;
         // FIN RABA
      End;
   Finally
      QDatos.Free;
   End;
end;

End.




