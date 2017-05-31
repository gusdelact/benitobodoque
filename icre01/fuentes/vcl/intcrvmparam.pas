// Sistema         : Clase de CrVMParam
// Fecha de Inicio :
// Función forma   : Clase de CrVMParam
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrVMParam;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, ShellAPI, ComObj, IntXls;

Type


 TCrVMParam= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        procedure   obtiene_fechas;
      published
      end;
// envio a excel
  function pExportaExcel( aDataSet : TQuery; aNombreReporte : String; var aProgresBar : TProgressBar; var AOwner : TComponent ) : Boolean; overload;
  function fGenExcel(aNombreReporte, aNombreArchivo: String; aDataSet: TDataSet): Boolean;
  function fBuscaInterforma( aForm : TForm ) : Boolean;
  function GetLetraRango(NumCampos: Integer): String;
  function ObtieneQueryCabecera(peExcelQuick : Boolean; peTipoReporte: Integer): String;
  function ObtieneQueryCuerpo(peTipoReporte: Integer): String;
  function ObtieneOrder(peTipoReporte: Integer): String;
  function ObtieneNombreMes(Mes: Integer): String;

var
  SaveDialogExcel: TSaveDialog;
  ProgressBar : TProgressBar;
  vFormParent : TForm;
  vB_Interforma : Boolean;
  InterFormaParent : TInterForma;

const
  vgSqlReporteQuick = 'select ID_TITULAR,  NOMBRE,     CVE_MONEDA, '+//    CVE_PRODUCTO_CRE, '+
                      //'ID_CONTRATO,
                      'ID_CREDITO, CVE_TASA_REFER,  '+
                      '0.00 AS IMP_CAP_VIG1, '+
                      '0.00 AS IMP_INTERES_DIA1, '+
                      '0.00 AS TASA_PROMEDIO1, '+
                      '(SUM(IMP_CAP_VIG2) / %0:s) AS IMP_CAP_VIG2, '+
                      'SUM(IMP_INTERES_DIA2) AS IMP_INTERES_DIA2, '+
                      '( (  (   SUM(IMP_INTERES_DIA2)  /  (    decode(SUM(IMP_CAP_VIG2)  / %0:s, 0, 1, SUM(IMP_CAP_VIG2)  / %0:s)  )   ) / %0:s  ) * 36000 ) AS TASA_PROMEDIO2, '+
                      '0.00 AS TASAVARIACION, '+
                      '0.00 AS VARIACION '+
                 'from ( ';
  vgSqlReporteExcel = 'select ID_TITULAR,  NOMBRE,     CVE_MONEDA, '+ //    CVE_PRODUCTO_CRE, '+
                      //'ID_CONTRATO,
                      'ID_CREDITO, CVE_TASA_REFER,  '+
                      'TO_CHAR(NVL (0.00, 0), ''fm999,999,999,999,999,990.00'') AS IMP_CAP_VIG1, '+
                      'TO_CHAR(NVL (0.00, 0), ''fm999,999,999,999,999,990.00'') AS IMP_INTERES_DIA1, '+
                      'TO_CHAR(NVL (0.00, 0), ''fm00.0000'') AS TASA_PROMEDIO1, '+
                      'TO_CHAR(NVL ((SUM(IMP_CAP_VIG2) / %0:s), 0), ''fm999,999,999,999,999,990.00'') AS IMP_CAP_VIG2, '+
                      'TO_CHAR(NVL (SUM(IMP_INTERES_DIA2), 0), ''fm999,999,999,999,999,990.00'') AS IMP_INTERES_DIA2, '+
                      'TO_CHAR(NVL (( (  (   SUM(IMP_INTERES_DIA2)  /  (    decode(SUM(IMP_CAP_VIG2)  / %0:s, 0, 1, SUM(IMP_CAP_VIG2)  / %0:s)  )   ) / %0:s  ) * 36000 ), 0), ''fm00.0000'') AS TASA_PROMEDIO2, '+
                      'TO_CHAR(NVL (0.00, 0), ''fm00.0000'') AS TASAVARIACION, '+
                      'TO_CHAR(NVL (0.00, 0), ''fm999,999,999,999,999,990.00'') AS VARIACION '+
                 'from ( ';
  vgSqlReporte = '%5:s '+
                  'select mesActual.ID_TITULAR,  mesActual.NOMBRE,     mesActual.CVE_MONEDA,     mesActual.CVE_PRODUCTO_CRE,  '+
                         'mesActual.ID_CONTRATO, mesActual.ID_CREDITO, mesActual.CVE_TASA_REFER,  '+
                         'mesAnterior.IMP_CAP_VIG1 AS IMP_CAP_VIG1,  '+
                         'mesAnterior.IMP_INTERES_DIA1 AS IMP_INTERES_DIA1, '+
                         'mesActual.IMP_CAP_VIG2 AS IMP_CAP_VIG2,  '+
                         'mesActual.IMP_INTERES_DIA2 AS IMP_INTERES_DIA2 '+
                    'from (   '+
                          'select ID_TITULAR, NOMBRE, CVE_MONEDA, CVE_PRODUCTO_CRE, ID_CONTRATO, ID_CREDITO, CVE_TASA_REFER,  '+
                                 '0 AS IMP_CAP_VIG1, 0 AS IMP_INTERES_DIA1,   '+
                                 'IMP_CAP_VIG2     AS IMP_CAP_VIG2,  '+
                                 'IMP_INTERES_DIA2 AS IMP_INTERES_DIA2 '+
                            'from (    '+
                                    'select CONTRATO.ID_TITULAR           AS ID_TITULAR,       PERSONA.NOMBRE          AS NOMBRE,      MONEDA.CVE_MONEDA     AS CVE_MONEDA,  '+
                                           'CR_PRODUCTO.CVE_PRODUCTO_CRE  AS CVE_PRODUCTO_CRE, CR_CONTRATO.ID_CONTRATO AS ID_CONTRATO, CR_CREDITO.ID_CREDITO AS ID_CREDITO,  '+
                                           'CR_CREDITO.CVE_TASA_REFER     AS CVE_TASA_REFER,   0 AS IMP_CAP_VIG1, 0 AS IMP_INTERES_DIA1,     '+
                                           'CR_CON_ADEUDO_SDO.IMP_CAP_VIG AS IMP_CAP_VIG2,   '+
                                           'CR_HISTO_CRED.IMP_INTERES_DIA AS IMP_INTERES_DIA2   '+
                                      'from CR_CON_ADEUDO_SDO, CR_CREDITO, CR_CONTRATO, CONTRATO,  '+
                                           'PERSONA,           MONEDA,     CR_PRODUCTO, CR_HISTO_CRED '+
                                     'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%0:s'',''dd/mm/yyyy'') '+
                                       'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%1:s'',''dd/mm/yyyy'') '+
//                                       'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG > 0 '+
                                       'and CR_CREDITO.id_credito         = CR_CON_ADEUDO_SDO.id_credito '+
                                       'and CR_CONTRATO.id_contrato       = CR_CREDITO.id_contrato '+
                                       'and CONTRATO.id_empresa           = %6:d '+
                                       'and CONTRATO.cve_moneda           = %4:s '+
                                       'and CONTRATO.id_contrato          = CR_CONTRATO.id_contrato '+
                                       'and PERSONA.id_persona            = CONTRATO.id_titular '+
                                       'and MONEDA.cve_moneda             = CONTRATO.cve_moneda '+
                                       'and CR_PRODUCTO.cve_producto_cre  = CR_CONTRATO.cve_producto_cre '+
                                       'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                       'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
                                       'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                       'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
//                                       'and CR_HISTO_CRED.IMP_INTERES_DIA > 0 '+
                                     'union all '+
                                    'select CONTRATO.ID_TITULAR             AS ID_TITULAR,       PERSONA.NOMBRE           AS NOMBRE,      MONEDA.CVE_MONEDA      AS CVE_MONEDA,  '+
                                           'to_char(CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE, CRE_CONTRATO.ID_CONTRATO AS ID_CONTRATO, CRE_CREDITO.ID_CREDITO AS ID_CREDITO,  '+
                                           'CRE_CREDITO.CVE_TASA_REFER      AS CVE_TASA_REFER,   0 AS IMP_CAP_VIG1, 0 AS IMP_INTERES_DIA1,  '+
                                           'CR_CON_ADEUDO_SDO.IMP_CAP_VIG   AS IMP_CAP_VIG2,      CRE_PROV_DIARIA.IMP_INTERES_DIA AS IMP_INTERES_DIA2   '+
                                      'from CR_CON_ADEUDO_SDO, CRE_CREDITO, CRE_CONTRATO,    CONTRATO,  '+
                                           'PERSONA,           MONEDA,      CRE_SUB_TIP_BCO, CRE_PROV_DIARIA '+
                                     'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%0:s'',''dd/mm/yyyy'') '+
                                       'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%1:s'',''dd/mm/yyyy'')  '+
//                                       'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG   > 0 '+
                                       'and CRE_CREDITO.id_credito          = CR_CON_ADEUDO_SDO.id_credito '+
                                       'and CRE_CONTRATO.id_contrato        = CRE_CREDITO.id_contrato '+
                                       'and CONTRATO.id_empresa             = %6:d '+
                                       'and CONTRATO.cve_moneda             = %4:s  '+
                                       'and CONTRATO.id_contrato            = CRE_CONTRATO.id_contrato '+
                                       'and PERSONA.id_persona              = CONTRATO.id_titular '+
                                       'and MONEDA.cve_moneda               = CONTRATO.cve_moneda '+
                                       'and CRE_SUB_TIP_BCO.cve_sub_tip_bco = CRE_CONTRATO.cve_sub_tip_bco '+
                                       'and CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO not in (57) '+
                                       'and CRE_PROV_DIARIA.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                       'and CRE_PROV_DIARIA.f_provision     =CR_CON_ADEUDO_SDO.f_cierre '+
                                       'and CRE_PROV_DIARIA.IMP_INTERES_DIA > 0 '+
                                       ') where CVE_PRODUCTO_CRE not in (select consultaProductoCre.cve_producto_cre  '+
                                                                            'from ( '+
                                                                                    'select CONTRATO.ID_TITULAR          AS ID_TITULAR,  '+
                                                                                           'CR_PRODUCTO.CVE_PRODUCTO_CRE AS CVE_PRODUCTO_CRE     '+
                                                                                      'from CR_CON_ADEUDO_SDO, CR_CREDITO, CR_CONTRATO, CONTRATO,  '+
                                                                                           'PERSONA,           MONEDA,     CR_PRODUCTO, CR_HISTO_CRED '+
                                                                                     'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%0:s'',''dd/mm/yyyy'') '+
                                                                                       'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%1:s'',''dd/mm/yyyy'') '+
                                                                                       //'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG > 0 '+
                                                                                       'and CR_CREDITO.id_credito         = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                       'and CR_CONTRATO.id_contrato       = CR_CREDITO.id_contrato '+
                                                                                       'and CONTRATO.id_empresa           = %6:d '+
                                                                                       'and CONTRATO.cve_moneda           = %4:s '+
                                                                                       'and CONTRATO.id_contrato          = CR_CONTRATO.id_contrato '+
                                                                                       'and PERSONA.id_persona            = CONTRATO.id_titular '+
                                                                                       'and MONEDA.cve_moneda             = CONTRATO.cve_moneda '+
                                                                                       'and CR_PRODUCTO.cve_producto_cre  = CR_CONTRATO.cve_producto_cre '+
                                                                                       'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                       'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
                                                                                       'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                       'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
//                                                                                       'and CR_HISTO_CRED.IMP_INTERES_DIA > 0 '+
                                                                                  ') consultaProductoCr, '+
                                                                                  '( '+
                                                                                    'select CONTRATO.ID_TITULAR                      AS ID_TITULAR,  '+
                                                                                           'to_char(CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE   '+
                                                                                      'from CR_CON_ADEUDO_SDO, CRE_CREDITO, CRE_CONTRATO,    CONTRATO,  '+
                                                                                           'PERSONA,           MONEDA,      CRE_SUB_TIP_BCO, CRE_PROV_DIARIA '+
                                                                                     'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%0:s'',''dd/mm/yyyy'') '+
                                                                                       'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%1:s'',''dd/mm/yyyy'')  '+
//                                                                                       'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG   > 0 '+
                                                                                       'and CRE_CREDITO.id_credito          = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                       'and CRE_CONTRATO.id_contrato        = CRE_CREDITO.id_contrato '+
                                                                                       'and CONTRATO.id_empresa             = %6:d '+
                                                                                       'and CONTRATO.cve_moneda             = %4:s  '+
                                                                                       'and CONTRATO.id_contrato            = CRE_CONTRATO.id_contrato '+
                                                                                       'and PERSONA.id_persona              = CONTRATO.id_titular '+
                                                                                       'and MONEDA.cve_moneda               = CONTRATO.cve_moneda '+
                                                                                       'and CRE_SUB_TIP_BCO.cve_sub_tip_bco = CRE_CONTRATO.cve_sub_tip_bco '+
                                                                                       'and CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO not in (57) '+
                                                                                       'and CRE_PROV_DIARIA.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                       'and CRE_PROV_DIARIA.f_provision     =CR_CON_ADEUDO_SDO.f_cierre '+
                                                                                       'and CRE_PROV_DIARIA.IMP_INTERES_DIA > 0 '+
                                                                                  ') consultaProductoCre '+
                                                                              'where consultaProductoCr.id_titular  = consultaProductoCre.id_titular '+
                                                                             ') '+

                                            ') mesActual, '+
                              '( '+
                              'select ID_TITULAR, NOMBRE, CVE_MONEDA, CVE_PRODUCTO_CRE, ID_CONTRATO, ID_CREDITO, CVE_TASA_REFER,  '+
                                     'IMP_CAP_VIG1 AS IMP_CAP_VIG1, IMP_INTERES_DIA1 AS IMP_INTERES_DIA1, '+
                                     '0 AS IMP_CAP_VIG2, '+
                                     '0 AS IMP_INTERES_DIA2 '+
                                'from ( '+
                                        'select CONTRATO.ID_TITULAR           AS ID_TITULAR,       PERSONA.NOMBRE          AS NOMBRE,      MONEDA.CVE_MONEDA     AS CVE_MONEDA,  '+
                                               'CR_PRODUCTO.CVE_PRODUCTO_CRE  AS CVE_PRODUCTO_CRE, CR_CONTRATO.ID_CONTRATO AS ID_CONTRATO, CR_CREDITO.ID_CREDITO AS ID_CREDITO,  '+
                                               'CR_CREDITO.CVE_TASA_REFER     AS CVE_TASA_REFER,   CR_CON_ADEUDO_SDO.IMP_CAP_VIG AS IMP_CAP_VIG1, CR_HISTO_CRED.IMP_INTERES_DIA AS IMP_INTERES_DIA1, '+
                                               '0 AS IMP_CAP_VIG2,  '+
                                               '0 AS IMP_INTERES_DIA2  '+
                                          'from CR_CON_ADEUDO_SDO, CR_CREDITO, CR_CONTRATO, CONTRATO,  '+
                                               'PERSONA,           MONEDA,     CR_PRODUCTO, CR_HISTO_CRED '+
                                         'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%2:s'',''dd/mm/yyyy'') '+
                                           'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%3:s'',''dd/mm/yyyy'') '+
//                                           'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG > 0 '+
                                           'and CR_CREDITO.id_credito         = CR_CON_ADEUDO_SDO.id_credito '+
                                           'and CR_CONTRATO.id_contrato       = CR_CREDITO.id_contrato '+
                                           'and CONTRATO.id_empresa           = %6:d '+
                                           'and CONTRATO.cve_moneda           = %4:s '+
                                           'and CONTRATO.id_contrato          = CR_CONTRATO.id_contrato '+
                                           'and PERSONA.id_persona            = CONTRATO.id_titular '+
                                           'and MONEDA.cve_moneda             = CONTRATO.cve_moneda '+
                                           'and CR_PRODUCTO.cve_producto_cre  = CR_CONTRATO.cve_producto_cre '+
                                           'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                           'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
                                           'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                           'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
//                                           'and CR_HISTO_CRED.IMP_INTERES_DIA > 0 '+
                                         'union all '+
                                        'select CONTRATO.ID_TITULAR             AS ID_TITULAR,       PERSONA.NOMBRE           AS NOMBRE,      MONEDA.CVE_MONEDA      AS CVE_MONEDA,  '+
                                               'to_char(CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE, CRE_CONTRATO.ID_CONTRATO AS ID_CONTRATO, CRE_CREDITO.ID_CREDITO AS ID_CREDITO,  '+
                                               'CRE_CREDITO.CVE_TASA_REFER      AS CVE_TASA_REFER,   CR_CON_ADEUDO_SDO.IMP_CAP_VIG AS IMP_CAP_VIG1, CRE_PROV_DIARIA.IMP_INTERES_DIA AS IMP_INTERES_DIA1,     '+
                                               '0 AS IMP_CAP_VIG2,     0 AS IMP_INTERES_DIA2   '+
                                          'from CR_CON_ADEUDO_SDO, CRE_CREDITO, CRE_CONTRATO,    CONTRATO,  '+
                                               'PERSONA,           MONEDA,      CRE_SUB_TIP_BCO, CRE_PROV_DIARIA '+
                                         'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%2:s'',''dd/mm/yyyy'') '+
                                           'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%3:s'',''dd/mm/yyyy'')  '+
//                                           'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG   > 0 '+
                                           'and CRE_CREDITO.id_credito          = CR_CON_ADEUDO_SDO.id_credito '+
                                           'and CRE_CONTRATO.id_contrato        = CRE_CREDITO.id_contrato '+
                                           'and CONTRATO.id_empresa             = %6:d '+
                                           'and CONTRATO.cve_moneda             = %4:s  '+
                                           'and CONTRATO.id_contrato            = CRE_CONTRATO.id_contrato '+
                                           'and PERSONA.id_persona              = CONTRATO.id_titular '+
                                           'and MONEDA.cve_moneda               = CONTRATO.cve_moneda '+
                                           'and CRE_SUB_TIP_BCO.cve_sub_tip_bco = CRE_CONTRATO.cve_sub_tip_bco '+
                                           'and CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO not in (57) '+
                                           'and CRE_PROV_DIARIA.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                           'and CRE_PROV_DIARIA.f_provision     =CR_CON_ADEUDO_SDO.f_cierre '+
                                           'and CRE_PROV_DIARIA.IMP_INTERES_DIA > 0 '+
                                           ') where CVE_PRODUCTO_CRE not in (select consultaProductoCre.cve_producto_cre  '+
                                                                                'from ( '+
                                                                                        'select CONTRATO.ID_TITULAR          AS ID_TITULAR,  '+
                                                                                               'CR_PRODUCTO.CVE_PRODUCTO_CRE AS CVE_PRODUCTO_CRE '+
                                                                                          'from CR_CON_ADEUDO_SDO, CR_CREDITO, CR_CONTRATO, CONTRATO, '+
                                                                                               'PERSONA,           MONEDA,     CR_PRODUCTO, CR_HISTO_CRED '+
                                                                                         'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%2:s'',''dd/mm/yyyy'') '+
                                                                                           'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%3:s'',''dd/mm/yyyy'') '+
//                                                                                           'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG > 0 '+
                                                                                           'and CR_CREDITO.id_credito         = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                           'and CR_CONTRATO.id_contrato       = CR_CREDITO.id_contrato '+
                                                                                           'and CONTRATO.id_empresa           = %6:d '+
                                                                                           'and CONTRATO.cve_moneda           = %4:s '+
                                                                                           'and CONTRATO.id_contrato          = CR_CONTRATO.id_contrato '+
                                                                                           'and PERSONA.id_persona            = CONTRATO.id_titular '+
                                                                                           'and MONEDA.cve_moneda             = CONTRATO.cve_moneda '+
                                                                                           'and CR_PRODUCTO.cve_producto_cre  = CR_CONTRATO.cve_producto_cre '+
                                                                                           'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                           'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
                                                                                           'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                           'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
//                                                                                           'and CR_HISTO_CRED.IMP_INTERES_DIA > 0 '+
                                                                                      ') consultaProductoCr, '+
                                                                                      '( '+
                                                                                        'select CONTRATO.ID_TITULAR                      AS ID_TITULAR,  '+
                                                                                               'to_char(CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE   '+
                                                                                          'from CR_CON_ADEUDO_SDO, CRE_CREDITO, CRE_CONTRATO,    CONTRATO,  '+
                                                                                               'PERSONA,           MONEDA,      CRE_SUB_TIP_BCO, CRE_PROV_DIARIA '+
                                                                                         'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%2:s'',''dd/mm/yyyy'') '+
                                                                                           'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%3:s'',''dd/mm/yyyy'')  '+
//                                                                                           'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG   > 0 '+
                                                                                           'and CRE_CREDITO.id_credito          = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                           'and CRE_CONTRATO.id_contrato        = CRE_CREDITO.id_contrato '+
                                                                                           'and CONTRATO.id_empresa             = %6:d '+
                                                                                           'and CONTRATO.cve_moneda             = %4:s  '+
                                                                                           'and CONTRATO.id_contrato            = CRE_CONTRATO.id_contrato '+
                                                                                           'and PERSONA.id_persona              = CONTRATO.id_titular '+
                                                                                           'and MONEDA.cve_moneda               = CONTRATO.cve_moneda '+
                                                                                           'and CRE_SUB_TIP_BCO.cve_sub_tip_bco = CRE_CONTRATO.cve_sub_tip_bco '+
                                                                                           'and CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO not in (57) '+
                                                                                           'and CRE_PROV_DIARIA.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                           'and CRE_PROV_DIARIA.f_provision     =CR_CON_ADEUDO_SDO.f_cierre '+
                                                                                           'and CRE_PROV_DIARIA.IMP_INTERES_DIA > 0 '+
                                                                                      ') consultaProductoCre '+
                                                                                  'where consultaProductoCr.id_titular  = consultaProductoCre.id_titular '+
                                                                                 ') '+
                 ') mesAnterior '+
                 'where mesActual.id_titular       = mesAnterior.id_titular  (+) '+
                   'and mesActual.cve_moneda       = mesAnterior.cve_moneda  (+) '+
                   'and mesActual.id_contrato      = mesAnterior.id_contrato (+) '+
                   'and mesActual.id_credito       = mesAnterior.id_credito  (+) '+
                   'and mesAnterior.id_titular is null '+
          ') where id_titular in (select id_titular '+
                                   'from ( '+
                                  'select ID_TITULAR, '+
                                         'SUM(IMP_CAP_VIG2)     AS IMP_CAP_VIG2, '+
                                         'SUM(IMP_INTERES_DIA2) AS IMP_INTERES_DIA2 '+
                                    'from ( '+
                                          'select mesActual.ID_TITULAR AS ID_TITULAR,  mesActual.NOMBRE,     mesActual.CVE_MONEDA,     mesActual.CVE_PRODUCTO_CRE, '+
                                                 'mesActual.ID_CONTRATO, mesActual.ID_CREDITO, mesActual.CVE_TASA_REFER, '+
                                                 'mesAnterior.IMP_CAP_VIG1 AS IMP_CAP_VIG1, '+
                                                 'mesAnterior.IMP_INTERES_DIA1 AS IMP_INTERES_DIA1, '+
                                                 'mesActual.IMP_CAP_VIG2 AS IMP_CAP_VIG2, '+
                                                 'mesActual.IMP_INTERES_DIA2 AS IMP_INTERES_DIA2 '+
                                            'from ( '+
                                                  'select ID_TITULAR, NOMBRE, CVE_MONEDA, CVE_PRODUCTO_CRE, ID_CONTRATO, ID_CREDITO, CVE_TASA_REFER, '+
                                                         '0 AS IMP_CAP_VIG1, 0 AS IMP_INTERES_DIA1, '+
                                                         'IMP_CAP_VIG2     AS IMP_CAP_VIG2, '+
                                                         'IMP_INTERES_DIA2 AS IMP_INTERES_DIA2 '+
                                                    'from ( '+
                                                            'select CONTRATO.ID_TITULAR           AS ID_TITULAR,       PERSONA.NOMBRE          AS NOMBRE,      MONEDA.CVE_MONEDA     AS CVE_MONEDA, '+
                                                                   'CR_PRODUCTO.CVE_PRODUCTO_CRE  AS CVE_PRODUCTO_CRE, CR_CONTRATO.ID_CONTRATO AS ID_CONTRATO, CR_CREDITO.ID_CREDITO AS ID_CREDITO, '+
                                                                   'CR_CREDITO.CVE_TASA_REFER     AS CVE_TASA_REFER,   0 AS IMP_CAP_VIG1, 0 AS IMP_INTERES_DIA1, '+
                                                                   'CR_CON_ADEUDO_SDO.IMP_CAP_VIG AS IMP_CAP_VIG2, '+
                                                                   'CR_HISTO_CRED.IMP_INTERES_DIA AS IMP_INTERES_DIA2 '+
                                                              'from CR_CON_ADEUDO_SDO, CR_CREDITO, CR_CONTRATO, CONTRATO, '+
                                                                   'PERSONA,           MONEDA,     CR_PRODUCTO, CR_HISTO_CRED '+
                                                             'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%0:s'',''dd/mm/yyyy'') '+
                                                               'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%1:s'',''dd/mm/yyyy'') '+
//                                                               'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG > 0 '+
                                                               'and CR_CREDITO.id_credito         = CR_CON_ADEUDO_SDO.id_credito '+
                                                               'and CR_CONTRATO.id_contrato       = CR_CREDITO.id_contrato '+
                                                               'and CONTRATO.id_empresa           = %6:d '+
                                                               'and CONTRATO.cve_moneda           = %4:s '+
                                                               'and CONTRATO.id_contrato          = CR_CONTRATO.id_contrato '+
                                                               'and PERSONA.id_persona            = CONTRATO.id_titular '+
                                                               'and MONEDA.cve_moneda             = CONTRATO.cve_moneda '+
                                                               'and CR_PRODUCTO.cve_producto_cre  = CR_CONTRATO.cve_producto_cre '+
                                                               'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                               'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
                                                               'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                               'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
//                                                               'and CR_HISTO_CRED.IMP_INTERES_DIA > 0 '+
                                                             'union all '+
                                                            'select CONTRATO.ID_TITULAR             AS ID_TITULAR,       PERSONA.NOMBRE           AS NOMBRE,      MONEDA.CVE_MONEDA      AS CVE_MONEDA, '+
                                                                   'to_char(CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE, CRE_CONTRATO.ID_CONTRATO AS ID_CONTRATO, CRE_CREDITO.ID_CREDITO AS ID_CREDITO, '+
                                                                   'CRE_CREDITO.CVE_TASA_REFER      AS CVE_TASA_REFER,   0 AS IMP_CAP_VIG1, 0 AS IMP_INTERES_DIA1, '+
                                                                   'CR_CON_ADEUDO_SDO.IMP_CAP_VIG   AS IMP_CAP_VIG2,      CRE_PROV_DIARIA.IMP_INTERES_DIA AS IMP_INTERES_DIA2 '+
                                                              'from CR_CON_ADEUDO_SDO, CRE_CREDITO, CRE_CONTRATO,    CONTRATO, '+
                                                                   'PERSONA,           MONEDA,      CRE_SUB_TIP_BCO, CRE_PROV_DIARIA '+
                                                             'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%0:s'',''dd/mm/yyyy'') '+
                                                               'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%1:s'',''dd/mm/yyyy'')  '+
//                                                               'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG   > 0 '+
                                                               'and CRE_CREDITO.id_credito          = CR_CON_ADEUDO_SDO.id_credito '+
                                                               'and CRE_CONTRATO.id_contrato        = CRE_CREDITO.id_contrato '+
                                                               'and CONTRATO.id_empresa             = %6:d '+
                                                               'and CONTRATO.cve_moneda             = %4:s  '+
                                                               'and CONTRATO.id_contrato            = CRE_CONTRATO.id_contrato '+
                                                               'and PERSONA.id_persona              = CONTRATO.id_titular '+
                                                               'and MONEDA.cve_moneda               = CONTRATO.cve_moneda '+
                                                               'and CRE_SUB_TIP_BCO.cve_sub_tip_bco = CRE_CONTRATO.cve_sub_tip_bco '+
                                                               'and CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO not in (57) '+
                                                               'and CRE_PROV_DIARIA.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                               'and CRE_PROV_DIARIA.f_provision     =CR_CON_ADEUDO_SDO.f_cierre '+
                                                               'and CRE_PROV_DIARIA.IMP_INTERES_DIA > 0 '+
                                                               ') where CVE_PRODUCTO_CRE not in (select consultaProductoCre.cve_producto_cre '+
                                                                                                    'from ( '+
                                                                                                            'select CONTRATO.ID_TITULAR          AS ID_TITULAR, '+
                                                                                                                   'CR_PRODUCTO.CVE_PRODUCTO_CRE AS CVE_PRODUCTO_CRE '+
                                                                                                              'from CR_CON_ADEUDO_SDO, CR_CREDITO, CR_CONTRATO, CONTRATO, '+
                                                                                                                   'PERSONA,           MONEDA,     CR_PRODUCTO, CR_HISTO_CRED '+
                                                                                                             'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%0:s'',''dd/mm/yyyy'') '+
                                                                                                               'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%1:s'',''dd/mm/yyyy'') '+
//                                                                                                               'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG > 0 '+
                                                                                                               'and CR_CREDITO.id_credito         = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                               'and CR_CONTRATO.id_contrato       = CR_CREDITO.id_contrato '+
                                                                                                               'and CONTRATO.id_empresa           = %6:d '+
                                                                                                               'and CONTRATO.cve_moneda           = %4:s '+
                                                                                                               'and CONTRATO.id_contrato          = CR_CONTRATO.id_contrato '+
                                                                                                               'and PERSONA.id_persona            = CONTRATO.id_titular '+
                                                                                                               'and MONEDA.cve_moneda             = CONTRATO.cve_moneda '+
                                                                                                               'and CR_PRODUCTO.cve_producto_cre  = CR_CONTRATO.cve_producto_cre '+
                                                                                                               'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                               'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
                                                                                                               'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                               'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
//                                                                                                               'and CR_HISTO_CRED.IMP_INTERES_DIA > 0 '+
                                                                                                          ') consultaProductoCr, '+
                                                                                                          '( '+
                                                                                                            'select CONTRATO.ID_TITULAR                      AS ID_TITULAR, '+
                                                                                                                   'to_char(CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE '+
                                                                                                              'from CR_CON_ADEUDO_SDO, CRE_CREDITO, CRE_CONTRATO,    CONTRATO, '+
                                                                                                                   'PERSONA,           MONEDA,      CRE_SUB_TIP_BCO, CRE_PROV_DIARIA '+
                                                                                                             'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%0:s'',''dd/mm/yyyy'') '+
                                                                                                               'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%1:s'',''dd/mm/yyyy'')  '+
//                                                                                                               'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG   > 0 '+
                                                                                                               'and CRE_CREDITO.id_credito          = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                               'and CRE_CONTRATO.id_contrato        = CRE_CREDITO.id_contrato '+
                                                                                                               'and CONTRATO.id_empresa             = %6:d '+
                                                                                                               'and CONTRATO.cve_moneda             = %4:s  '+
                                                                                                               'and CONTRATO.id_contrato            = CRE_CONTRATO.id_contrato '+
                                                                                                               'and PERSONA.id_persona              = CONTRATO.id_titular '+
                                                                                                               'and MONEDA.cve_moneda               = CONTRATO.cve_moneda '+
                                                                                                               'and CRE_SUB_TIP_BCO.cve_sub_tip_bco = CRE_CONTRATO.cve_sub_tip_bco '+
                                                                                                               'and CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO not in (57) '+
                                                                                                               'and CRE_PROV_DIARIA.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                               'and CRE_PROV_DIARIA.f_provision     =CR_CON_ADEUDO_SDO.f_cierre '+
                                                                                                               'and CRE_PROV_DIARIA.IMP_INTERES_DIA > 0 '+
                                                                                                          ') consultaProductoCre '+
                                                                                                      'where consultaProductoCr.id_titular  = consultaProductoCre.id_titular '+
                                                                                                     ') '+
                                                                    ') mesActual, '+
                                                      '( '+
                                                      'select ID_TITULAR, NOMBRE, CVE_MONEDA, CVE_PRODUCTO_CRE, ID_CONTRATO, ID_CREDITO, CVE_TASA_REFER, '+
                                                             'IMP_CAP_VIG1 AS IMP_CAP_VIG1, IMP_INTERES_DIA1 AS IMP_INTERES_DIA1, '+
                                                             '0 AS IMP_CAP_VIG2, '+
                                                             '0 AS IMP_INTERES_DIA2 '+
                                                        'from ( '+
                                                                'select CONTRATO.ID_TITULAR           AS ID_TITULAR,       PERSONA.NOMBRE          AS NOMBRE,      MONEDA.CVE_MONEDA     AS CVE_MONEDA, '+
                                                                       'CR_PRODUCTO.CVE_PRODUCTO_CRE  AS CVE_PRODUCTO_CRE, CR_CONTRATO.ID_CONTRATO AS ID_CONTRATO, CR_CREDITO.ID_CREDITO AS ID_CREDITO, '+
                                                                       'CR_CREDITO.CVE_TASA_REFER     AS CVE_TASA_REFER,   CR_CON_ADEUDO_SDO.IMP_CAP_VIG AS IMP_CAP_VIG1, CR_HISTO_CRED.IMP_INTERES_DIA AS IMP_INTERES_DIA1, '+
                                                                       '0 AS IMP_CAP_VIG2, '+
                                                                       '0 AS IMP_INTERES_DIA2 '+
                                                                  'from CR_CON_ADEUDO_SDO, CR_CREDITO, CR_CONTRATO, CONTRATO, '+
                                                                       'PERSONA,           MONEDA,     CR_PRODUCTO, CR_HISTO_CRED '+
                                                                 'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%2:s'',''dd/mm/yyyy'') '+
                                                                   'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%3:s'',''dd/mm/yyyy'') '+
//                                                                   'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG > 0 '+
                                                                   'and CR_CREDITO.id_credito         = CR_CON_ADEUDO_SDO.id_credito '+
                                                                   'and CR_CONTRATO.id_contrato       = CR_CREDITO.id_contrato '+
                                                                   'and CONTRATO.id_empresa           = %6:d '+
                                                                   'and CONTRATO.cve_moneda           = %4:s '+
                                                                   'and CONTRATO.id_contrato          = CR_CONTRATO.id_contrato '+
                                                                   'and PERSONA.id_persona            = CONTRATO.id_titular '+
                                                                   'and MONEDA.cve_moneda             = CONTRATO.cve_moneda '+
                                                                   'and CR_PRODUCTO.cve_producto_cre  = CR_CONTRATO.cve_producto_cre '+
                                                                   'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                   'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
                                                                   'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                   'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
//                                                                   'and CR_HISTO_CRED.IMP_INTERES_DIA > 0 '+
                                                                 'union all '+
                                                                'select CONTRATO.ID_TITULAR             AS ID_TITULAR,       PERSONA.NOMBRE           AS NOMBRE,      MONEDA.CVE_MONEDA      AS CVE_MONEDA, '+
                                                                       'to_char(CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE, CRE_CONTRATO.ID_CONTRATO AS ID_CONTRATO, CRE_CREDITO.ID_CREDITO AS ID_CREDITO, '+
                                                                       'CRE_CREDITO.CVE_TASA_REFER      AS CVE_TASA_REFER,   CR_CON_ADEUDO_SDO.IMP_CAP_VIG AS IMP_CAP_VIG1, CRE_PROV_DIARIA.IMP_INTERES_DIA AS IMP_INTERES_DIA1, '+
                                                                       '0 AS IMP_CAP_VIG2,     0 AS IMP_INTERES_DIA2 '+
                                                                  'from CR_CON_ADEUDO_SDO, CRE_CREDITO, CRE_CONTRATO,    CONTRATO, '+
                                                                       'PERSONA,           MONEDA,      CRE_SUB_TIP_BCO, CRE_PROV_DIARIA '+
                                                                 'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%2:s'',''dd/mm/yyyy'') '+
                                                                   'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%3:s'',''dd/mm/yyyy'')  '+
//                                                                   'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG   > 0 '+
                                                                   'and CRE_CREDITO.id_credito          = CR_CON_ADEUDO_SDO.id_credito '+
                                                                   'and CRE_CONTRATO.id_contrato        = CRE_CREDITO.id_contrato '+
                                                                   'and CONTRATO.id_empresa             = %6:d '+
                                                                   'and CONTRATO.cve_moneda             = %4:s  '+
                                                                   'and CONTRATO.id_contrato            = CRE_CONTRATO.id_contrato '+
                                                                   'and PERSONA.id_persona              = CONTRATO.id_titular '+
                                                                   'and MONEDA.cve_moneda               = CONTRATO.cve_moneda '+
                                                                   'and CRE_SUB_TIP_BCO.cve_sub_tip_bco = CRE_CONTRATO.cve_sub_tip_bco '+
                                                                   'and CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO not in (57) '+
                                                                   'and CRE_PROV_DIARIA.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                   'and CRE_PROV_DIARIA.f_provision     =CR_CON_ADEUDO_SDO.f_cierre '+
                                                                   'and CRE_PROV_DIARIA.IMP_INTERES_DIA > 0 '+
                                                                   ') where CVE_PRODUCTO_CRE not in (select consultaProductoCre.cve_producto_cre '+
                                                                                                        'from ( '+
                                                                                                                'select CONTRATO.ID_TITULAR          AS ID_TITULAR, '+
                                                                                                                       'CR_PRODUCTO.CVE_PRODUCTO_CRE AS CVE_PRODUCTO_CRE '+
                                                                                                                  'from CR_CON_ADEUDO_SDO, CR_CREDITO, CR_CONTRATO, CONTRATO, '+
                                                                                                                       'PERSONA,           MONEDA,     CR_PRODUCTO, CR_HISTO_CRED '+
                                                                                                                 'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%2:s'',''dd/mm/yyyy'') '+
                                                                                                                   'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%3:s'',''dd/mm/yyyy'') '+
//                                                                                                                   'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG > 0 '+
                                                                                                                   'and CR_CREDITO.id_credito         = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                                   'and CR_CONTRATO.id_contrato       = CR_CREDITO.id_contrato '+
                                                                                                                   'and CONTRATO.id_empresa           = %6:d '+
                                                                                                                   'and CONTRATO.cve_moneda           = %4:s '+
                                                                                                                   'and CONTRATO.id_contrato          = CR_CONTRATO.id_contrato '+
                                                                                                                   'and PERSONA.id_persona            = CONTRATO.id_titular '+
                                                                                                                   'and MONEDA.cve_moneda             = CONTRATO.cve_moneda '+
                                                                                                                   'and CR_PRODUCTO.cve_producto_cre  = CR_CONTRATO.cve_producto_cre '+
                                                                                                                   'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                                   'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
                                                                                                                   'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                                   'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
//                                                                                                                   'and CR_HISTO_CRED.IMP_INTERES_DIA > 0 '+
                                                                                                              ') consultaProductoCr, '+
                                                                                                              '( '+
                                                                                                                'select CONTRATO.ID_TITULAR                      AS ID_TITULAR, '+
                                                                                                                       'to_char(CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE '+
                                                                                                                  'from CR_CON_ADEUDO_SDO, CRE_CREDITO, CRE_CONTRATO,    CONTRATO, '+
                                                                                                                       'PERSONA,           MONEDA,      CRE_SUB_TIP_BCO, CRE_PROV_DIARIA '+
                                                                                                                 'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%2:s'',''dd/mm/yyyy'') '+
                                                                                                                   'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%3:s'',''dd/mm/yyyy'')  '+
//                                                                                                                   'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG   > 0 '+
                                                                                                                   'and CRE_CREDITO.id_credito          = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                                   'and CRE_CONTRATO.id_contrato        = CRE_CREDITO.id_contrato '+
                                                                                                                   'and CONTRATO.id_empresa             = %6:d '+
                                                                                                                   'and CONTRATO.cve_moneda             = %4:s  '+
                                                                                                                   'and CONTRATO.id_contrato            = CRE_CONTRATO.id_contrato '+
                                                                                                                   'and PERSONA.id_persona              = CONTRATO.id_titular '+
                                                                                                                   'and MONEDA.cve_moneda               = CONTRATO.cve_moneda '+
                                                                                                                   'and CRE_SUB_TIP_BCO.cve_sub_tip_bco = CRE_CONTRATO.cve_sub_tip_bco '+
                                                                                                                   'and CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO not in (57) '+
                                                                                                                   'and CRE_PROV_DIARIA.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                                   'and CRE_PROV_DIARIA.f_provision     =CR_CON_ADEUDO_SDO.f_cierre '+
                                                                                                                   'and CRE_PROV_DIARIA.IMP_INTERES_DIA > 0 '+
                                                                                                              ') consultaProductoCre '+
                                                                                                          'where consultaProductoCr.id_titular  = consultaProductoCre.id_titular '+
                                                                                                         ') '+
                                         ') mesAnterior '+
                                         'where mesActual.id_titular       = mesAnterior.id_titular  (+) '+
                                           'and mesActual.cve_moneda       = mesAnterior.cve_moneda  (+) '+
                                           'and mesActual.id_contrato      = mesAnterior.id_contrato (+) '+
                                           'and mesActual.id_credito       = mesAnterior.id_credito  (+) '+
                                           'and mesAnterior.id_titular is null '+
                                  ') '+
                                   'group by ID_TITULAR '+
                                   'order by IMP_INTERES_DIA2 DESC, ID_TITULAR '+
                                  ') where rownum <= 10 ) '+
           'group by ID_TITULAR,  NOMBRE,     CVE_MONEDA,    CVE_PRODUCTO_CRE, '+
                    'ID_CONTRATO, ID_CREDITO, CVE_TASA_REFER ';

  vgSqlReporteOrder = 'order by CVE_MONEDA, ID_TITULAR ';

{  vgSqlReport3Quick = 'select ID_TITULAR,  NOMBRE,     CVE_MONEDA,     CVE_PRODUCTO_CRE, '+
                      'ID_CONTRATO, ID_CREDITO, CVE_TASA_REFER,  '+
                      '(SUM(IMP_CAP_VIG1) / %1:s) AS IMP_CAP_VIG1, '+
                      '(SUM(IMP_INTERES_DIA1)) AS IMP_INTERES_DIA1, '+
                      '( (  (   SUM(IMP_INTERES_DIA1)  /  (    decode(SUM(IMP_CAP_VIG1)  / %1:s, 0, 1, SUM(IMP_CAP_VIG1)  / %1:s)    )   ) / %1:s  ) * 36000 ) AS TASA_PROMEDIO1, '+
                      '(SUM(IMP_CAP_VIG2) / %0:s) AS IMP_CAP_VIG2, '+
                      '(SUM(IMP_INTERES_DIA2)) AS IMP_INTERES_DIA2, '+
                      '( (  (   SUM(IMP_INTERES_DIA2)  /  (    decode(SUM(IMP_CAP_VIG2)  / %0:s, 0, 1, SUM(IMP_CAP_VIG2)  / %0:s)    )   ) / %0:s  ) * 36000 ) AS TASA_PROMEDIO2, '+
                      '( (  (   SUM(IMP_INTERES_DIA1)  /  (    decode(SUM(IMP_CAP_VIG1)  / %1:s, 0, 1, SUM(IMP_CAP_VIG1)  / %1:s)    )   ) / %1:s  ) * 36000 ) - '+
                      '( (  (   SUM(IMP_INTERES_DIA2)  /  (    decode(SUM(IMP_CAP_VIG2)  / %0:s, 0, 1, SUM(IMP_CAP_VIG2)  / %0:s)    )   ) / %0:s  ) * 36000 ) AS TASAVARIACION, '+
                      'SUM(IMP_INTERES_DIA1 - IMP_INTERES_DIA2) AS VARIACION '+
                 'from ( ';
}
  vgSqlReport3Quick = 'select id_titular, nombre, cve_moneda, cve_tasa_refer, id_credito, '+
                             'nvl (sum(nvl(imp_cap_vig1,0) / %1:s), 0) as imp_cap_vig1, '+
                             'nvl (sum(nvl(imp_interes_dia1,0) ), 0) as imp_interes_dia1, '+
                             'nvl (( (  (   sum(imp_interes_dia1)  /  (    decode(sum(imp_cap_vig1)  / %1:s, 0, 1, sum(imp_cap_vig1)  / %1:s)    )   ) / %1:s  ) * 36000 ), 0) as tasa_promedio1, '+
                             'nvl (sum(nvl(imp_cap_vig2,0) / %0:s), 0) as imp_cap_vig2, '+
                             'nvl (sum(nvl(imp_interes_dia2,0) ), 0) as imp_interes_dia2, '+
                             'nvl (( (  (   sum(imp_interes_dia2)  /  (    decode(sum(imp_cap_vig2)  / %0:s, 0, 1, sum(imp_cap_vig2)  / %0:s)    )   ) / %0:s  ) * 36000 ), 0) as tasa_promedio2, '+
                             'nvl (nvl(( (  (   sum(imp_interes_dia2)  /  (    decode(sum(imp_cap_vig2)  / %0:s, 0, 1, sum(imp_cap_vig2)  / %0:s)    )   ) / %0:s  ) * 36000 ),0) - '+
                                  'nvl(( (  (   sum(imp_interes_dia1)  /  (    decode(sum(imp_cap_vig1)  / %1:s, 0, 1, sum(imp_cap_vig1)  / %1:s)    )   ) / %1:s  ) * 36000 ),0), 0) as tasavariacion, '+
                             'nvl (sum(nvl(imp_interes_dia2,0) - nvl(imp_interes_dia1,0)), 0) as variacion '+
                        'from ( ';

{  vgSqlReport3Excel = 'select ID_TITULAR,  NOMBRE,     CVE_MONEDA,     CVE_PRODUCTO_CRE, '+
                      'ID_CONTRATO, ID_CREDITO, CVE_TASA_REFER,  '+
                      'TO_CHAR(NVL ((SUM(IMP_CAP_VIG1) / %1:s), 0), ''fm999,999,999,999,999,990.00'') AS IMP_CAP_VIG1, '+
                      'TO_CHAR(NVL ((SUM(IMP_INTERES_DIA1)), 0), ''fm999,999,999,999,999,990.00'') AS IMP_INTERES_DIA1, '+
                      'TO_CHAR(NVL (( (  (   SUM(IMP_INTERES_DIA1)  /  (    decode(SUM(IMP_CAP_VIG1)  / %1:s, 0, 1, SUM(IMP_CAP_VIG1)  / %1:s)    )   ) / %1:s  ) * 36000 ), 0), ''fm00.0000'') AS TASA_PROMEDIO1, '+
                      'TO_CHAR(NVL ((SUM(IMP_CAP_VIG2) / %0:s), 0), ''fm999,999,999,999,999,990.00'') AS IMP_CAP_VIG2, '+
                      'TO_CHAR(NVL ((SUM(IMP_INTERES_DIA2)), 0), ''fm999,999,999,999,999,990.00'') AS IMP_INTERES_DIA2, '+
                      'TO_CHAR(NVL (( (  (   SUM(IMP_INTERES_DIA2)  /  (    decode(SUM(IMP_CAP_VIG2)  / %0:s, 0, 1, SUM(IMP_CAP_VIG2)  / %0:s)    )   ) / %0:s  ) * 36000 ), 0), ''fm00.0000'') AS TASA_PROMEDIO2, '+
                      'TO_CHAR(NVL (( (  (   SUM(IMP_INTERES_DIA1)  /  (    decode(SUM(IMP_CAP_VIG1)  / %1:s, 0, 1, SUM(IMP_CAP_VIG1)  / %1:s)    )   ) / %1:s  ) * 36000 ) - '+
                      '             ( (  (   SUM(IMP_INTERES_DIA2)  /  (    decode(SUM(IMP_CAP_VIG2)  / %0:s, 0, 1, SUM(IMP_CAP_VIG2)  / %0:s)    )   ) / %0:s  ) * 36000 ), 0), ''fm00.0000'') AS TASAVARIACION, '+
                      'TO_CHAR(NVL (SUM(IMP_INTERES_DIA1 - IMP_INTERES_DIA2), 0), ''fm999,999,999,999,999,990.00'') AS VARIACION '+
                 'from ( ';
}
  vgSqlReport3Excel = 'select id_titular, nombre, cve_moneda, cve_tasa_refer, id_credito, '+
                             'to_char(nvl (sum(nvl(imp_cap_vig1,0) / %1:s), 0), ''fm999,999,999,999,999,990.00'') as imp_cap_vig1, '+
                             'to_char(nvl (sum(nvl(imp_interes_dia1,0) ), 0), ''fm999,999,999,999,999,990.00'') as imp_interes_dia1, '+
                             'to_char(nvl (( (  (   sum(imp_interes_dia1)  /  (    decode(sum(imp_cap_vig1)  / %1:s, 0, 1, sum(imp_cap_vig1)  / %1:s)    )   ) / %1:s  ) * 36000 ), 0), ''fm00.0000'') as tasa_promedio1, '+
                             'to_char(nvl (sum(nvl(imp_cap_vig2,0) / %0:s), 0), ''fm999,999,999,999,999,990.00'') as imp_cap_vig2, '+
                             'to_char(nvl (sum(nvl(imp_interes_dia2,0) ), 0), ''fm999,999,999,999,999,990.00'') as imp_interes_dia2, '+
                             'to_char(nvl (( (  (   sum(imp_interes_dia2)  /  (    decode(sum(imp_cap_vig2)  / %0:s, 0, 1, sum(imp_cap_vig2)  / %0:s)    )   ) / %0:s  ) * 36000 ), 0), ''fm00.0000'') as tasa_promedio2, '+
                             'to_char(nvl (nvl(( (  (   sum(imp_interes_dia2)  /  (    decode(sum(imp_cap_vig2)  / %0:s, 0, 1, sum(imp_cap_vig2)  / %0:s)    )   ) / %0:s  ) * 36000 ),0) - '+
                                          'nvl(( (  (   sum(imp_interes_dia1)  /  (    decode(sum(imp_cap_vig1)  / %1:s, 0, 1, sum(imp_cap_vig1)  / %1:s)    )   ) / %1:s  ) * 36000 ),0), 0), ''fm00.0000'') as tasavariacion, '+
                             'to_char(nvl (sum(nvl(imp_interes_dia2,0) - nvl(imp_interes_dia1,0)), 0), ''fm999,999,999,999,999,990.00'') as variacion '+
                        'from ( ';


  vgSqlReport3 = '%5:s '+
            'SELECT id_titular, '+
                   'decode(nombre2,'''',nombre1,nombre2) as nombre, '+
                   'decode(cve_moneda2, '''',cve_moneda1,cve_moneda2) as cve_moneda, '+
                   'decode(id_credito2,'''',id_credito1, id_credito2) as id_credito, '+
                   'decode(cve_tasa_refer2,'''',cve_tasa_refer1, cve_tasa_refer2) as cve_tasa_refer, '+
                   'imp_cap_vig2, '+
                   'imp_interes_dia2, '+
                   'imp_cap_vig1, '+
                   'imp_interes_dia1 '+
              'FROM ( '+
                                      'SELECT decode(mesactual.id_titular, '''', mesanterior.id_titular, mesactual.id_titular) as id_titular, '+
                                             'mesactual.id_titular         as id_titular2, '+
                                             'mesactual.nombre             as nombre2, '+ 
                                             'mesactual.cve_moneda         as cve_moneda2, '+
                                             'mesactual.cve_producto_cre   as cve_producto_cre2, '+
                                             'mesactual.id_contrato        as id_contrato2, '+
                                             'mesactual.id_credito         as id_credito2, '+
                                             'mesactual.cve_tasa_refer     as cve_tasa_refer2, '+
                                             'mesactual.imp_cap_vig2       as imp_cap_vig2, '+
                                             'mesactual.imp_interes_dia2   as imp_interes_dia2, '+
                                             'mesanterior.id_titular       as id_titular1, '+
                                             'mesanterior.nombre           as nombre1, '+ 
                                             'mesanterior.cve_moneda       as cve_moneda1, '+
                                             'mesanterior.cve_producto_cre as cve_producto_cre1, '+
                                             'mesanterior.id_contrato      as id_contrato1, '+
                                             'mesanterior.id_credito       as id_credito1, '+
                                             'mesanterior.cve_tasa_refer   as cve_tasa_refer1, '+
                                             'mesanterior.imp_cap_vig1     as imp_cap_vig1, '+
                                             'mesanterior.imp_interes_dia1 as imp_interes_dia1 '+
                                        'FROM (SELECT id_titular, nombre, cve_moneda, '+
                                                     'cve_producto_cre, id_contrato, '+
                                                     'id_credito, cve_tasa_refer, '+
                                                     '0 AS imp_cap_vig1, '+
                                                     '0 AS imp_interes_dia1, '+
                                                     'imp_cap_vig2 AS imp_cap_vig2, '+
                                                     'imp_interes_dia2 AS imp_interes_dia2 '+
                                                'FROM (SELECT contrato.id_titular AS id_titular, '+
                                                             'persona.nombre AS nombre, '+
                                                             'moneda.cve_moneda AS cve_moneda, '+
                                                             'cr_producto.cve_producto_cre AS cve_producto_cre, '+
                                                             'cr_contrato.id_contrato AS id_contrato, '+
                                                             'cr_credito.id_credito   AS id_credito, '+
                                                             'cr_credito.cve_tasa_refer AS cve_tasa_refer, '+
                                                             '0 AS imp_cap_vig1, '+
                                                             '0 AS imp_interes_dia1, '+
                                                             'cr_con_adeudo_sdo.imp_cap_vig AS imp_cap_vig2, '+
                                                             'cr_histo_cred.imp_interes_dia AS imp_interes_dia2 '+
                                                        'FROM cr_con_adeudo_sdo, '+
                                                             'cr_credito, '+
                                                             'cr_contrato, '+
                                                             'contrato, '+
                                                             'persona, '+
                                                             'moneda, '+
                                                             'cr_producto, '+
                                                             'cr_histo_cred '+
                                                       'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE (''%0:s'',''dd/mm/yyyy'') '+
                                                         'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE (''%1:s'',''dd/mm/yyyy'') '+
                                                         'AND cr_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cr_contrato.id_contrato =cr_credito.id_contrato '+
                                                         'AND contrato.id_empresa = %6:d '+
                                                         'AND contrato.cve_moneda = %4:s '+
                                                         'AND contrato.id_contrato =cr_contrato.id_contrato '+
                                                         'AND persona.id_persona =contrato.id_titular '+
                                                         'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                         'AND cr_producto.cve_producto_cre =cr_contrato.cve_producto_cre '+
                                                         'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                         'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                      'UNION ALL '+
                                                      'SELECT contrato.id_titular AS id_titular, '+
                                                             'persona.nombre AS nombre, '+
                                                             'moneda.cve_moneda AS cve_moneda, '+
                                                             'TO_CHAR(cre_sub_tip_bco.cve_sub_tip_bco) AS cve_producto_cre, '+
                                                             'cre_contrato.id_contrato AS id_contrato, '+
                                                             'cre_credito.id_credito AS id_credito, '+
                                                             'cre_credito.cve_tasa_refer AS cve_tasa_refer, '+
                                                             '0 AS imp_cap_vig1, '+
                                                             '0 AS imp_interes_dia1, '+
                                                             'cr_con_adeudo_sdo.imp_cap_vig AS imp_cap_vig2, '+
                                                             'cre_prov_diaria.imp_interes_dia AS imp_interes_dia2 '+
                                                        'FROM cr_con_adeudo_sdo, '+
                                                             'cre_credito, '+
                                                             'cre_contrato, '+
                                                             'contrato, '+
                                                             'persona, '+
                                                             'moneda, '+
                                                             'cre_sub_tip_bco, '+
                                                             'cre_prov_diaria '+
                                                       'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE (''%0:s'',''dd/mm/yyyy'') '+
                                                         'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE (''%1:s'',''dd/mm/yyyy'') '+
                                                         'AND cre_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cre_contrato.id_contrato =cre_credito.id_contrato '+
                                                         'AND contrato.id_empresa = %6:d '+
                                                         'AND contrato.cve_moneda = %4:s '+
                                                         'AND contrato.id_contrato =cre_contrato.id_contrato '+
                                                         'AND persona.id_persona = contrato.id_titular '+
                                                         'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                         'AND cre_sub_tip_bco.cve_sub_tip_bco =cre_contrato.cve_sub_tip_bco '+
                                                         'AND cre_sub_tip_bco.cve_sub_tip_bco NOT IN(57) '+
                                                         'AND cre_prov_diaria.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cre_prov_diaria.f_provision =cr_con_adeudo_sdo.f_cierre '+
                                                         ') '+
                                               'WHERE cve_producto_cre NOT IN ( '+
                                                        'SELECT consultaproductocre.cve_producto_cre '+
                                                          'FROM (SELECT contrato.id_titular AS id_titular, '+
                                                                       'cr_producto.cve_producto_cre AS cve_producto_cre '+
                                                                  'FROM cr_con_adeudo_sdo, '+
                                                                       'cr_credito, '+
                                                                       'cr_contrato, '+
                                                                       'contrato, '+
                                                                       'persona, '+
                                                                       'moneda, '+
                                                                       'cr_producto, '+
                                                                       'cr_histo_cred '+
                                                                 'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE(''%0:s'',''dd/mm/yyyy'') '+
                                                                   'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE(''%1:s'',''dd/mm/yyyy'') '+
                                                                   'AND cr_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cr_contrato.id_contrato =cr_credito.id_contrato '+
                                                                   'AND contrato.id_empresa          =%6:d '+
                                                                   'AND contrato.cve_moneda          =%4:s '+
                                                                   'AND contrato.id_contrato         =cr_contrato.id_contrato '+
                                                                   'AND persona.id_persona           =contrato.id_titular '+
                                                                   'AND moneda.cve_moneda            =contrato.cve_moneda '+
                                                                   'AND cr_producto.cve_producto_cre =cr_contrato.cve_producto_cre '+
                                                                   'AND cr_histo_cred.id_credito     =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cr_histo_cred.f_cierre       =cr_con_adeudo_sdo.f_cierre '+
                                                                   'AND cr_histo_cred.id_credito     =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cr_histo_cred.f_cierre       =cr_con_adeudo_sdo.f_cierre '+
                                                                   ') consultaproductocr, '+
                                                               '(SELECT contrato.id_titular AS id_titular, '+
                                                                       'TO_CHAR(cre_sub_tip_bco.cve_sub_tip_bco) AS cve_producto_cre '+
                                                                  'FROM cr_con_adeudo_sdo, '+
                                                                       'cre_credito, '+
                                                                       'cre_contrato, '+
                                                                       'contrato, '+
                                                                       'persona, '+
                                                                       'moneda, '+
                                                                       'cre_sub_tip_bco, '+
                                                                       'cre_prov_diaria '+
                                                                 'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE(''%0:s'',''dd/mm/yyyy'') '+
                                                                   'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE(''%1:s'',''dd/mm/yyyy'') '+
                                                                   'AND cre_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cre_contrato.id_contrato =cre_credito.id_contrato '+
                                                                   'AND contrato.id_empresa =%6:d '+
                                                                   'AND contrato.cve_moneda =%4:s '+
                                                                   'AND contrato.id_contrato =cre_contrato.id_contrato '+
                                                                   'AND persona.id_persona =contrato.id_titular '+
                                                                   'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                   'AND cre_sub_tip_bco.cve_sub_tip_bco =cre_contrato.cve_sub_tip_bco '+
                                                                   'AND cre_sub_tip_bco.cve_sub_tip_bco NOT IN (57) '+
                                                                   'AND cre_prov_diaria.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cre_prov_diaria.f_provision =cr_con_adeudo_sdo.f_cierre '+
                                                                   ') consultaproductocre '+
                                                         'WHERE consultaproductocr.id_titular =consultaproductocre.id_titular) '+
                                                     ') mesactual, '+
                                             '(SELECT id_titular, nombre, cve_moneda, '+
                                                     'cve_producto_cre, id_contrato, '+
                                                     'id_credito, cve_tasa_refer, '+
                                                     'imp_cap_vig1 AS imp_cap_vig1, '+
                                                     'imp_interes_dia1 AS imp_interes_dia1, '+
                                                     '0 AS imp_cap_vig2, '+
                                                     '0 AS imp_interes_dia2 '+
                                                'FROM (SELECT contrato.id_titular AS id_titular, '+
                                                             'persona.nombre AS nombre, '+
                                                             'moneda.cve_moneda AS cve_moneda, '+
                                                             'cr_producto.cve_producto_cre AS cve_producto_cre, '+
                                                             'cr_contrato.id_contrato AS id_contrato, '+
                                                             'cr_credito.id_credito AS id_credito, '+
                                                             'cr_credito.cve_tasa_refer AS cve_tasa_refer, '+
                                                             'cr_con_adeudo_sdo.imp_cap_vig AS imp_cap_vig1, '+
                                                             'cr_histo_cred.imp_interes_dia AS imp_interes_dia1, '+
                                                             '0 AS imp_cap_vig2, '+
                                                             '0 AS imp_interes_dia2 '+
                                                        'FROM cr_con_adeudo_sdo, '+
                                                             'cr_credito, '+
                                                             'cr_contrato, '+
                                                             'contrato, '+
                                                             'persona, '+
                                                             'moneda, '+
                                                             'cr_producto, '+
                                                             'cr_histo_cred '+
                                                       'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE (''%2:s'',''dd/mm/yyyy'') '+
                                                         'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE (''%3:s'',''dd/mm/yyyy'') '+
                                                         'AND cr_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cr_contrato.id_contrato =cr_credito.id_contrato '+
                                                         'AND contrato.id_empresa = %6:d '+
                                                         'AND contrato.cve_moneda = %4:s '+
                                                         'AND contrato.id_contrato =cr_contrato.id_contrato '+
                                                         'AND persona.id_persona =contrato.id_titular '+
                                                         'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                         'AND cr_producto.cve_producto_cre =cr_contrato.cve_producto_cre '+
                                                         'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                         'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                      'UNION ALL '+
                                                      'SELECT contrato.id_titular AS id_titular, '+
                                                             'persona.nombre AS nombre, '+
                                                             'moneda.cve_moneda AS cve_moneda, '+
                                                             'TO_CHAR(cre_sub_tip_bco.cve_sub_tip_bco) AS cve_producto_cre, '+
                                                             'cre_contrato.id_contrato AS id_contrato, '+
                                                             'cre_credito.id_credito AS id_credito, '+
                                                             'cre_credito.cve_tasa_refer AS cve_tasa_refer, '+
                                                             'cr_con_adeudo_sdo.imp_cap_vig AS imp_cap_vig1, '+
                                                             'cre_prov_diaria.imp_interes_dia AS imp_interes_dia1, '+
                                                             '0 AS imp_cap_vig2, '+
                                                             '0 AS imp_interes_dia2 '+
                                                        'FROM cr_con_adeudo_sdo, '+
                                                             'cre_credito, '+
                                                             'cre_contrato, '+
                                                             'contrato, '+
                                                             'persona, '+
                                                             'moneda, '+
                                                             'cre_sub_tip_bco, '+
                                                             'cre_prov_diaria '+
                                                       'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE (''%2:s'',''dd/mm/yyyy'') '+
                                                         'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE (''%3:s'',''dd/mm/yyyy'') '+
                                                         'AND cre_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cre_contrato.id_contrato =cre_credito.id_contrato '+
                                                         'AND contrato.id_empresa = %6:d '+
                                                         'AND contrato.cve_moneda = %4:s '+
                                                         'AND contrato.id_contrato =cre_contrato.id_contrato '+
                                                         'AND persona.id_persona =contrato.id_titular '+
                                                         'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                         'AND cre_sub_tip_bco.cve_sub_tip_bco =cre_contrato.cve_sub_tip_bco '+
                                                         'AND cre_sub_tip_bco.cve_sub_tip_bco NOT IN (57) '+
                                                         'AND cre_prov_diaria.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cre_prov_diaria.f_provision =cr_con_adeudo_sdo.f_cierre '+
                                                         ') '+
                                               'WHERE cve_producto_cre NOT IN ( '+
                                                        'SELECT consultaproductocre.cve_producto_cre '+
                                                          'FROM (SELECT contrato.id_titular AS id_titular, '+
                                                                       'cr_producto.cve_producto_cre AS cve_producto_cre '+
                                                                  'FROM cr_con_adeudo_sdo, '+
                                                                       'cr_credito, '+
                                                                       'cr_contrato, '+
                                                                       'contrato, '+
                                                                       'persona, '+
                                                                       'moneda, '+
                                                                       'cr_producto, '+
                                                                       'cr_histo_cred '+
                                                                 'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE(''%2:s'',''dd/mm/yyyy'') '+
                                                                   'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE(''%3:s'',''dd/mm/yyyy'') '+
                                                                   'AND cr_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cr_contrato.id_contrato =cr_credito.id_contrato '+
                                                                   'AND contrato.id_empresa =%6:d '+
                                                                   'AND contrato.cve_moneda =%4:s '+
                                                                   'AND contrato.id_contrato =cr_contrato.id_contrato '+
                                                                   'AND persona.id_persona =contrato.id_titular '+
                                                                   'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                   'AND cr_producto.cve_producto_cre =cr_contrato.cve_producto_cre '+
                                                                   'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                   'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                   ') consultaproductocr, '+
                                                               '(SELECT contrato.id_titular AS id_titular, '+
                                                                       'TO_CHAR(cre_sub_tip_bco.cve_sub_tip_bco) AS cve_producto_cre '+
                                                                  'FROM cr_con_adeudo_sdo, '+
                                                                       'cre_credito, '+
                                                                       'cre_contrato, '+
                                                                       'contrato, '+
                                                                       'persona, '+
                                                                       'moneda, '+
                                                                       'cre_sub_tip_bco, '+
                                                                       'cre_prov_diaria '+
                                                                 'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE(''%2:s'',''dd/mm/yyyy'') '+
                                                                   'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE(''%3:s'',''dd/mm/yyyy'') '+
                                                                   'AND cre_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cre_contrato.id_contrato =cre_credito.id_contrato '+
                                                                   'AND contrato.id_empresa =%6:d '+
                                                                   'AND contrato.cve_moneda =%4:s '+
                                                                   'AND contrato.id_contrato =cre_contrato.id_contrato '+
                                                                   'AND persona.id_persona =contrato.id_titular '+
                                                                   'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                   'AND cre_sub_tip_bco.cve_sub_tip_bco =cre_contrato.cve_sub_tip_bco '+
                                                                   'AND cre_sub_tip_bco.cve_sub_tip_bco NOT IN (57) '+
                                                                   'AND cre_prov_diaria.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cre_prov_diaria.f_provision =cr_con_adeudo_sdo.f_cierre '+
                                                                   ') consultaproductocre '+
                                                         'WHERE consultaproductocr.id_titular = consultaproductocre.id_titular) '+
                                             ') mesAnterior '+
                                        'where mesActual.id_titular       (+) = mesAnterior.id_titular '+
                                          'AND mesActual.cve_moneda       (+) = mesAnterior.cve_moneda '+
                                          'AND mesActual.id_contrato      (+) = mesAnterior.id_contrato '+
                                          'AND mesActual.id_credito       (+) = mesAnterior.id_credito '+
                                      'union all '+
                                      'SELECT decode(mesactual.id_titular, '''', mesanterior.id_titular, mesactual.id_titular) as id_titular, '+
                                             'mesactual.id_titular         as id_titular2, '+
                                             'mesactual.nombre             as nombre2, '+ 
                                             'mesactual.cve_moneda         as cve_moneda2, '+
                                             'mesactual.cve_producto_cre   as cve_producto_cre2, '+
                                             'mesactual.id_contrato        as id_contrato2, '+
                                             'mesactual.id_credito         as id_credito2, '+
                                             'mesactual.cve_tasa_refer     as cve_tasa_refer2, '+
                                             'mesactual.imp_cap_vig2       as imp_cap_vig2, '+
                                             'mesactual.imp_interes_dia2   as imp_interes_dia2, '+
                                             'mesanterior.id_titular       as id_titular1, '+
                                             'mesanterior.nombre           as nombre1, '+ 
                                             'mesanterior.cve_moneda       as cve_moneda1, '+
                                             'mesanterior.cve_producto_cre as cve_producto_cre1, '+
                                             'mesanterior.id_contrato      as id_contrato1, '+
                                             'mesanterior.id_credito       as id_credito1, '+
                                             'mesanterior.cve_tasa_refer   as cve_tasa_refer1, '+
                                             'mesanterior.imp_cap_vig1     as imp_cap_vig1, '+
                                             'mesanterior.imp_interes_dia1 as imp_interes_dia1 '+
                                        'FROM (SELECT id_titular, nombre, cve_moneda, '+
                                                     'cve_producto_cre, id_contrato, '+
                                                     'id_credito, cve_tasa_refer, '+
                                                     '0 AS imp_cap_vig1, '+
                                                     '0 AS imp_interes_dia1, '+
                                                     'imp_cap_vig2 AS imp_cap_vig2, '+
                                                     'imp_interes_dia2 AS imp_interes_dia2 '+
                                                'FROM (SELECT contrato.id_titular AS id_titular, '+
                                                             'persona.nombre AS nombre, '+
                                                             'moneda.cve_moneda AS cve_moneda, '+
                                                             'cr_producto.cve_producto_cre AS cve_producto_cre, '+
                                                             'cr_contrato.id_contrato AS id_contrato, '+
                                                             'cr_credito.id_credito   AS id_credito, '+
                                                             'cr_credito.cve_tasa_refer AS cve_tasa_refer, '+
                                                             '0 AS imp_cap_vig1, '+
                                                             '0 AS imp_interes_dia1, '+
                                                             'cr_con_adeudo_sdo.imp_cap_vig AS imp_cap_vig2, '+
                                                             'cr_histo_cred.imp_interes_dia AS imp_interes_dia2 '+
                                                        'FROM cr_con_adeudo_sdo, '+
                                                             'cr_credito, '+
                                                             'cr_contrato, '+
                                                             'contrato, '+
                                                             'persona, '+
                                                             'moneda, '+
                                                             'cr_producto, '+
                                                             'cr_histo_cred '+
                                                       'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE (''%0:s'',''dd/mm/yyyy'') '+
                                                         'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE (''%1:s'',''dd/mm/yyyy'') '+
                                                         'AND cr_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cr_contrato.id_contrato =cr_credito.id_contrato '+
                                                         'AND contrato.id_empresa = %6:d '+
                                                         'AND contrato.cve_moneda = %4:s '+
                                                         'AND contrato.id_contrato =cr_contrato.id_contrato '+
                                                         'AND persona.id_persona =contrato.id_titular '+
                                                         'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                         'AND cr_producto.cve_producto_cre =cr_contrato.cve_producto_cre '+
                                                         'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                         'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                      'UNION ALL '+
                                                      'SELECT contrato.id_titular AS id_titular, '+
                                                             'persona.nombre AS nombre, '+
                                                             'moneda.cve_moneda AS cve_moneda, '+
                                                             'TO_CHAR(cre_sub_tip_bco.cve_sub_tip_bco) AS cve_producto_cre, '+
                                                             'cre_contrato.id_contrato AS id_contrato, '+
                                                             'cre_credito.id_credito AS id_credito, '+
                                                             'cre_credito.cve_tasa_refer AS cve_tasa_refer, '+
                                                             '0 AS imp_cap_vig1, '+
                                                             '0 AS imp_interes_dia1, '+
                                                             'cr_con_adeudo_sdo.imp_cap_vig AS imp_cap_vig2, '+
                                                             'cre_prov_diaria.imp_interes_dia AS imp_interes_dia2 '+
                                                        'FROM cr_con_adeudo_sdo, '+
                                                             'cre_credito, '+
                                                             'cre_contrato, '+
                                                             'contrato, '+
                                                             'persona, '+
                                                             'moneda, '+
                                                             'cre_sub_tip_bco, '+
                                                             'cre_prov_diaria '+
                                                       'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE (''%0:s'',''dd/mm/yyyy'') '+
                                                         'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE (''%1:s'',''dd/mm/yyyy'') '+
                                                         'AND cre_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cre_contrato.id_contrato =cre_credito.id_contrato '+
                                                         'AND contrato.id_empresa = %6:d '+
                                                         'AND contrato.cve_moneda = %4:s '+
                                                         'AND contrato.id_contrato =cre_contrato.id_contrato '+
                                                         'AND persona.id_persona =contrato.id_titular '+
                                                         'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                         'AND cre_sub_tip_bco.cve_sub_tip_bco =cre_contrato.cve_sub_tip_bco '+
                                                         'AND cre_sub_tip_bco.cve_sub_tip_bco NOT IN(57) '+
                                                         'AND cre_prov_diaria.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cre_prov_diaria.f_provision =cr_con_adeudo_sdo.f_cierre '+
                                                         ') '+
                                               'WHERE cve_producto_cre NOT IN ( '+
                                                        'SELECT consultaproductocre.cve_producto_cre '+
                                                          'FROM (SELECT contrato.id_titular AS id_titular, '+
                                                                       'cr_producto.cve_producto_cre AS cve_producto_cre '+
                                                                  'FROM cr_con_adeudo_sdo, '+
                                                                       'cr_credito, '+
                                                                       'cr_contrato, '+
                                                                       'contrato, '+
                                                                       'persona, '+
                                                                       'moneda, '+
                                                                       'cr_producto, '+
                                                                       'cr_histo_cred '+
                                                                 'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE(''%0:s'',''dd/mm/yyyy'') '+
                                                                   'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE(''%1:s'',''dd/mm/yyyy'') '+
                                                                   'AND cr_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cr_contrato.id_contrato =cr_credito.id_contrato '+
                                                                   'AND contrato.id_empresa =%6:d '+
                                                                   'AND contrato.cve_moneda =%4:s '+
                                                                   'AND contrato.id_contrato =cr_contrato.id_contrato '+
                                                                   'AND persona.id_persona =contrato.id_titular '+
                                                                   'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                   'AND cr_producto.cve_producto_cre =cr_contrato.cve_producto_cre '+
                                                                   'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                   'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                   ') consultaproductocr, '+
                                                               '(SELECT contrato.id_titular AS id_titular, '+
                                                                       'TO_CHAR(cre_sub_tip_bco.cve_sub_tip_bco) AS cve_producto_cre '+
                                                                  'FROM cr_con_adeudo_sdo, '+
                                                                       'cre_credito, '+
                                                                       'cre_contrato, '+
                                                                       'contrato, '+
                                                                       'persona, '+
                                                                       'moneda, '+
                                                                       'cre_sub_tip_bco, '+
                                                                       'cre_prov_diaria '+
                                                                 'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE(''%0:s'',''dd/mm/yyyy'') '+
                                                                   'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE(''%1:s'',''dd/mm/yyyy'') '+
                                                                   'AND cre_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cre_contrato.id_contrato =cre_credito.id_contrato '+
                                                                   'AND contrato.id_empresa =%6:d '+
                                                                   'AND contrato.cve_moneda =%4:s '+
                                                                   'AND contrato.id_contrato =cre_contrato.id_contrato '+
                                                                   'AND persona.id_persona =contrato.id_titular '+
                                                                   'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                   'AND cre_sub_tip_bco.cve_sub_tip_bco =cre_contrato.cve_sub_tip_bco '+
                                                                   'AND cre_sub_tip_bco.cve_sub_tip_bco NOT IN (57) '+
                                                                   'AND cre_prov_diaria.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cre_prov_diaria.f_provision =cr_con_adeudo_sdo.f_cierre '+
                                                                   ') consultaproductocre '+
                                                         'WHERE consultaproductocr.id_titular =consultaproductocre.id_titular) '+
                                                     ') mesactual, '+
                                             '(SELECT id_titular, nombre, cve_moneda, '+
                                                     'cve_producto_cre, id_contrato, '+
                                                     'id_credito, cve_tasa_refer, '+
                                                     'imp_cap_vig1 AS imp_cap_vig1, '+
                                                     'imp_interes_dia1 AS imp_interes_dia1, '+
                                                     '0 AS imp_cap_vig2, '+
                                                     '0 AS imp_interes_dia2 '+
                                                'FROM (SELECT contrato.id_titular AS id_titular, '+
                                                             'persona.nombre AS nombre, '+
                                                             'moneda.cve_moneda AS cve_moneda, '+
                                                             'cr_producto.cve_producto_cre AS cve_producto_cre, '+
                                                             'cr_contrato.id_contrato AS id_contrato, '+
                                                             'cr_credito.id_credito AS id_credito, '+
                                                             'cr_credito.cve_tasa_refer AS cve_tasa_refer, '+
                                                             'cr_con_adeudo_sdo.imp_cap_vig AS imp_cap_vig1, '+
                                                             'cr_histo_cred.imp_interes_dia AS imp_interes_dia1, '+
                                                             '0 AS imp_cap_vig2, '+
                                                             '0 AS imp_interes_dia2 '+
                                                        'FROM cr_con_adeudo_sdo, '+
                                                             'cr_credito, '+
                                                             'cr_contrato, '+
                                                             'contrato, '+
                                                             'persona, '+
                                                             'moneda, '+
                                                             'cr_producto, '+
                                                             'cr_histo_cred '+
                                                       'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE (''%2:s'',''dd/mm/yyyy'') '+
                                                         'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE (''%3:s'',''dd/mm/yyyy'') '+
                                                         'AND cr_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cr_contrato.id_contrato =cr_credito.id_contrato '+
                                                         'AND contrato.id_empresa = %6:d '+
                                                         'AND contrato.cve_moneda = %4:s '+
                                                         'AND contrato.id_contrato =cr_contrato.id_contrato '+
                                                         'AND persona.id_persona =contrato.id_titular '+
                                                         'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                         'AND cr_producto.cve_producto_cre =cr_contrato.cve_producto_cre '+
                                                         'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                         'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                      'UNION ALL '+
                                                      'SELECT contrato.id_titular AS id_titular, '+
                                                             'persona.nombre AS nombre, '+
                                                             'moneda.cve_moneda AS cve_moneda, '+
                                                             'TO_CHAR(cre_sub_tip_bco.cve_sub_tip_bco) AS cve_producto_cre, '+
                                                             'cre_contrato.id_contrato AS id_contrato, '+
                                                             'cre_credito.id_credito AS id_credito, '+
                                                             'cre_credito.cve_tasa_refer AS cve_tasa_refer, '+
                                                             'cr_con_adeudo_sdo.imp_cap_vig AS imp_cap_vig1, '+
                                                             'cre_prov_diaria.imp_interes_dia AS imp_interes_dia1, '+
                                                             '0 AS imp_cap_vig2, '+
                                                             '0 AS imp_interes_dia2 '+
                                                        'FROM cr_con_adeudo_sdo, '+
                                                             'cre_credito, '+
                                                             'cre_contrato, '+
                                                             'contrato, '+
                                                             'persona, '+
                                                             'moneda, '+
                                                             'cre_sub_tip_bco, '+
                                                             'cre_prov_diaria '+
                                                       'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE (''%2:s'',''dd/mm/yyyy'') '+
                                                         'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE (''%3:s'',''dd/mm/yyyy'') '+
                                                         'AND cre_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cre_contrato.id_contrato =cre_credito.id_contrato '+
                                                         'AND contrato.id_empresa = %6:d '+
                                                         'AND contrato.cve_moneda = %4:s '+
                                                         'AND contrato.id_contrato =cre_contrato.id_contrato '+
                                                         'AND persona.id_persona =contrato.id_titular '+
                                                         'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                         'AND cre_sub_tip_bco.cve_sub_tip_bco =cre_contrato.cve_sub_tip_bco '+
                                                         'AND cre_sub_tip_bco.cve_sub_tip_bco NOT IN (57) '+
                                                         'AND cre_prov_diaria.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                         'AND cre_prov_diaria.f_provision =cr_con_adeudo_sdo.f_cierre '+
                                                         ') '+
                                               'WHERE cve_producto_cre NOT IN ( '+
                                                        'SELECT consultaproductocre.cve_producto_cre '+
                                                          'FROM (SELECT contrato.id_titular AS id_titular, '+
                                                                       'cr_producto.cve_producto_cre AS cve_producto_cre '+
                                                                  'FROM cr_con_adeudo_sdo, '+
                                                                       'cr_credito, '+
                                                                       'cr_contrato, '+
                                                                       'contrato, '+
                                                                       'persona, '+
                                                                       'moneda, '+
                                                                       'cr_producto, '+
                                                                       'cr_histo_cred '+
                                                                 'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE(''%2:s'',''dd/mm/yyyy'') '+
                                                                   'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE(''%3:s'',''dd/mm/yyyy'') '+
                                                                   'AND cr_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cr_contrato.id_contrato =cr_credito.id_contrato '+
                                                                   'AND contrato.id_empresa =%6:d '+
                                                                   'AND contrato.cve_moneda =%4:s '+
                                                                   'AND contrato.id_contrato =cr_contrato.id_contrato '+
                                                                   'AND persona.id_persona =contrato.id_titular '+
                                                                   'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                   'AND cr_producto.cve_producto_cre =cr_contrato.cve_producto_cre '+
                                                                   'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                   'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                   ') consultaproductocr, '+
                                                               '(SELECT contrato.id_titular AS id_titular, '+
                                                                       'TO_CHAR(cre_sub_tip_bco.cve_sub_tip_bco) AS cve_producto_cre '+
                                                                  'FROM cr_con_adeudo_sdo, '+
                                                                       'cre_credito, '+
                                                                       'cre_contrato, '+
                                                                       'contrato, '+
                                                                       'persona, '+
                                                                       'moneda, '+
                                                                       'cre_sub_tip_bco, '+
                                                                       'cre_prov_diaria '+
                                                                 'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE(''%2:s'',''dd/mm/yyyy'') '+
                                                                   'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE(''%3:s'',''dd/mm/yyyy'') '+
                                                                   'AND cre_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cre_contrato.id_contrato =cre_credito.id_contrato '+
                                                                   'AND contrato.id_empresa =%6:d '+
                                                                   'AND contrato.cve_moneda =%4:s '+
                                                                   'AND contrato.id_contrato =cre_contrato.id_contrato '+
                                                                   'AND persona.id_persona =contrato.id_titular '+
                                                                   'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                   'AND cre_sub_tip_bco.cve_sub_tip_bco =cre_contrato.cve_sub_tip_bco '+
                                                                   'AND cre_sub_tip_bco.cve_sub_tip_bco NOT IN (57) '+
                                                                   'AND cre_prov_diaria.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                   'AND cre_prov_diaria.f_provision =cr_con_adeudo_sdo.f_cierre '+
                                                                   ') consultaproductocre '+
                                                         'WHERE consultaproductocr.id_titular = consultaproductocre.id_titular) '+
                                             ') mesAnterior '+
                                        'where mesActual.id_titular       = mesAnterior.id_titular       (+) '+
                                          'AND mesActual.cve_moneda       = mesAnterior.cve_moneda       (+) '+
                                          'AND mesActual.id_contrato      = mesAnterior.id_contrato      (+) '+
                                          'AND mesActual.id_credito       = mesAnterior.id_credito       (+) '+
                                          'and mesAnterior.id_titular is null '+
          ') '+
    'where id_titular in (select id_titular2 '+ 
                           'from ( '+
                                'select id_titular2, '+
                                       'sum(imp_cap_vig1)        as imp_cap_vig1, '+
                                       'sum(imp_interes_dia1)    as imp_interes_dia1, '+  
                                       'sum(imp_cap_vig2)        as imp_cap_vig2, '+ 
                                       'sum(imp_interes_dia2)    as imp_interes_dia2, '+
                                       'sum(abs(imp_interes_dia2 - imp_interes_dia1)) as variacion '+
                                'from ( '+
                                      'select decode(id_titular2, '''', id_titular1, id_titular2) as id_titular2, '+
                                             'decode(id_titular2, '''', id_titular1, id_titular2) as id_titular1, '+ 
                                             'nvl(imp_cap_vig1,0)        as imp_cap_vig1, '+ 
                                             'nvl(imp_interes_dia1,0)    as imp_interes_dia1, '+  
                                             'nvl(imp_cap_vig2,0)        as imp_cap_vig2, '+ 
                                             'nvl(imp_interes_dia2,0)    as imp_interes_dia2 '+
                                       'from ( '+     
                                                              'SELECT mesactual.id_titular         as id_titular2, '+
                                                                     'mesactual.nombre             as nombre, '+ 
                                                                     'mesactual.cve_moneda         as cve_moneda2, '+
                                                                     'mesactual.cve_producto_cre   as cve_producto_cre2, '+
                                                                     'mesactual.id_contrato        as id_contrato2, '+
                                                                     'mesactual.id_credito         as id_credito2, '+
                                                                     'mesactual.cve_tasa_refer     as cve_tasa_refer2, '+
                                                                     'mesactual.imp_cap_vig2       as imp_cap_vig2, '+
                                                                     'mesactual.imp_interes_dia2   as imp_interes_dia2, '+
                                                                     'mesanterior.id_titular       as id_titular1, '+
                                                                     'mesanterior.nombre           as nombre1, '+ 
                                                                     'mesactual.cve_moneda         as cve_moneda1, '+
                                                                     'mesanterior.cve_producto_cre as cve_producto_cre1, '+
                                                                     'mesanterior.id_contrato      as id_contrato1, '+
                                                                     'mesanterior.id_credito       as id_credito1, '+
                                                                     'mesanterior.cve_tasa_refer   as cve_tasa_refer1, '+
                                                                     'mesanterior.imp_cap_vig1     as imp_cap_vig1, '+
                                                                     'mesanterior.imp_interes_dia1 as imp_interes_dia1 '+
                                                                'FROM (SELECT id_titular, nombre, cve_moneda, '+
                                                                             'cve_producto_cre, id_contrato, '+
                                                                             'id_credito, cve_tasa_refer, '+
                                                                             '0 AS imp_cap_vig1, '+
                                                                             '0 AS imp_interes_dia1, '+
                                                                             'imp_cap_vig2 AS imp_cap_vig2, '+
                                                                             'imp_interes_dia2 AS imp_interes_dia2 '+
                                                                        'FROM (SELECT contrato.id_titular AS id_titular, '+
                                                                                     'persona.nombre AS nombre, '+
                                                                                     'moneda.cve_moneda AS cve_moneda, '+
                                                                                     'cr_producto.cve_producto_cre AS cve_producto_cre, '+
                                                                                     'cr_contrato.id_contrato AS id_contrato, '+
                                                                                     'cr_credito.id_credito   AS id_credito, '+
                                                                                     'cr_credito.cve_tasa_refer AS cve_tasa_refer, '+
                                                                                     '0 AS imp_cap_vig1, '+
                                                                                     '0 AS imp_interes_dia1, '+
                                                                                     'cr_con_adeudo_sdo.imp_cap_vig AS imp_cap_vig2, '+
                                                                                     'cr_histo_cred.imp_interes_dia AS imp_interes_dia2 '+
                                                                                'FROM cr_con_adeudo_sdo, '+
                                                                                     'cr_credito, '+
                                                                                     'cr_contrato, '+
                                                                                     'contrato, '+
                                                                                     'persona, '+
                                                                                     'moneda, '+
                                                                                     'cr_producto, '+
                                                                                     'cr_histo_cred '+
                                                                               'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE (''%0:s'',''dd/mm/yyyy'') '+
                                                                                 'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE (''%1:s'',''dd/mm/yyyy'') '+
                                                                                 'AND cr_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cr_contrato.id_contrato =cr_credito.id_contrato '+
                                                                                 'AND contrato.id_empresa = %6:d '+
                                                                                 'AND contrato.cve_moneda = %4:s '+
                                                                                 'AND contrato.id_contrato =cr_contrato.id_contrato '+
                                                                                 'AND persona.id_persona =contrato.id_titular '+
                                                                                 'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                                 'AND cr_producto.cve_producto_cre =cr_contrato.cve_producto_cre '+
                                                                                 'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                                 'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                              'UNION ALL '+
                                                                              'SELECT contrato.id_titular AS id_titular, '+
                                                                                     'persona.nombre AS nombre, '+
                                                                                     'moneda.cve_moneda AS cve_moneda, '+
                                                                                     'TO_CHAR(cre_sub_tip_bco.cve_sub_tip_bco) AS cve_producto_cre, '+
                                                                                     'cre_contrato.id_contrato AS id_contrato, '+
                                                                                     'cre_credito.id_credito AS id_credito, '+
                                                                                     'cre_credito.cve_tasa_refer AS cve_tasa_refer, '+
                                                                                     '0 AS imp_cap_vig1, '+
                                                                                     '0 AS imp_interes_dia1, '+
                                                                                     'cr_con_adeudo_sdo.imp_cap_vig AS imp_cap_vig2, '+
                                                                                     'cre_prov_diaria.imp_interes_dia AS imp_interes_dia2 '+
                                                                                'FROM cr_con_adeudo_sdo, '+
                                                                                     'cre_credito, '+
                                                                                     'cre_contrato, '+
                                                                                     'contrato, '+
                                                                                     'persona, '+
                                                                                     'moneda, '+
                                                                                     'cre_sub_tip_bco, '+
                                                                                     'cre_prov_diaria '+
                                                                               'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE (''%0:s'',''dd/mm/yyyy'') '+
                                                                                 'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE (''%1:s'',''dd/mm/yyyy'') '+
                                                                                 'AND cre_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cre_contrato.id_contrato =cre_credito.id_contrato '+
                                                                                 'AND contrato.id_empresa = %6:d '+
                                                                                 'AND contrato.cve_moneda = %4:s '+
                                                                                 'AND contrato.id_contrato =cre_contrato.id_contrato '+
                                                                                 'AND persona.id_persona =contrato.id_titular '+
                                                                                 'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                                 'AND cre_sub_tip_bco.cve_sub_tip_bco =cre_contrato.cve_sub_tip_bco '+
                                                                                 'AND cre_sub_tip_bco.cve_sub_tip_bco NOT IN(57) '+
                                                                                 'AND cre_prov_diaria.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cre_prov_diaria.f_provision =cr_con_adeudo_sdo.f_cierre '+
                                                                                 ') '+
                                                                       'WHERE cve_producto_cre NOT IN ( '+
                                                                                'SELECT consultaproductocre.cve_producto_cre '+
                                                                                  'FROM (SELECT contrato.id_titular AS id_titular, '+
                                                                                               'cr_producto.cve_producto_cre AS cve_producto_cre '+
                                                                                          'FROM cr_con_adeudo_sdo, '+
                                                                                               'cr_credito, '+
                                                                                               'cr_contrato, '+
                                                                                               'contrato, '+
                                                                                               'persona, '+
                                                                                               'moneda, '+
                                                                                               'cr_producto, '+
                                                                                               'cr_histo_cred '+
                                                                                         'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE(''%0:s'',''dd/mm/yyyy'') '+
                                                                                           'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE(''%1:s'',''dd/mm/yyyy'') '+
                                                                                           'AND cr_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cr_contrato.id_contrato =cr_credito.id_contrato '+
                                                                                           'AND contrato.id_empresa =%6:d '+
                                                                                           'AND contrato.cve_moneda =%4:s '+
                                                                                           'AND contrato.id_contrato =cr_contrato.id_contrato '+
                                                                                           'AND persona.id_persona =contrato.id_titular '+
                                                                                           'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                                           'AND cr_producto.cve_producto_cre =cr_contrato.cve_producto_cre '+
                                                                                           'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                                           'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                                           ') consultaproductocr, '+
                                                                                       '(SELECT contrato.id_titular AS id_titular, '+
                                                                                               'TO_CHAR(cre_sub_tip_bco.cve_sub_tip_bco) AS cve_producto_cre '+
                                                                                          'FROM cr_con_adeudo_sdo, '+
                                                                                               'cre_credito, '+
                                                                                               'cre_contrato, '+
                                                                                               'contrato, '+
                                                                                               'persona, '+
                                                                                               'moneda, '+
                                                                                               'cre_sub_tip_bco, '+
                                                                                               'cre_prov_diaria '+
                                                                                         'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE(''%0:s'',''dd/mm/yyyy'') '+
                                                                                           'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE(''%1:s'',''dd/mm/yyyy'') '+
                                                                                           'AND cre_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cre_contrato.id_contrato =cre_credito.id_contrato '+
                                                                                           'AND contrato.id_empresa =%6:d '+
                                                                                           'AND contrato.cve_moneda =%4:s '+
                                                                                           'AND contrato.id_contrato =cre_contrato.id_contrato '+
                                                                                           'AND persona.id_persona =contrato.id_titular '+
                                                                                           'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                                           'AND cre_sub_tip_bco.cve_sub_tip_bco =cre_contrato.cve_sub_tip_bco '+
                                                                                           'AND cre_sub_tip_bco.cve_sub_tip_bco NOT IN (57) '+
                                                                                           'AND cre_prov_diaria.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cre_prov_diaria.f_provision =cr_con_adeudo_sdo.f_cierre '+
                                                                                           ') consultaproductocre '+
                                                                                 'WHERE consultaproductocr.id_titular =consultaproductocre.id_titular) '+
                                                                             ') mesactual, '+
                                                                     '(SELECT id_titular, nombre, cve_moneda, '+
                                                                             'cve_producto_cre, id_contrato, '+
                                                                             'id_credito, cve_tasa_refer, '+
                                                                             'imp_cap_vig1 AS imp_cap_vig1, '+
                                                                             'imp_interes_dia1 AS imp_interes_dia1, '+
                                                                             '0 AS imp_cap_vig2, '+
                                                                             '0 AS imp_interes_dia2 '+
                                                                        'FROM (SELECT contrato.id_titular AS id_titular, '+
                                                                                     'persona.nombre AS nombre, '+
                                                                                     'moneda.cve_moneda AS cve_moneda, '+
                                                                                     'cr_producto.cve_producto_cre AS cve_producto_cre, '+
                                                                                     'cr_contrato.id_contrato AS id_contrato, '+
                                                                                     'cr_credito.id_credito AS id_credito, '+
                                                                                     'cr_credito.cve_tasa_refer AS cve_tasa_refer, '+
                                                                                     'cr_con_adeudo_sdo.imp_cap_vig AS imp_cap_vig1, '+
                                                                                     'cr_histo_cred.imp_interes_dia AS imp_interes_dia1, '+
                                                                                     '0 AS imp_cap_vig2, '+
                                                                                     '0 AS imp_interes_dia2 '+
                                                                                'FROM cr_con_adeudo_sdo, '+
                                                                                     'cr_credito, '+
                                                                                     'cr_contrato, '+
                                                                                     'contrato, '+
                                                                                     'persona, '+
                                                                                     'moneda, '+
                                                                                     'cr_producto, '+
                                                                                     'cr_histo_cred '+
                                                                               'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE (''%2:s'',''dd/mm/yyyy'') '+
                                                                                 'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE (''%3:s'',''dd/mm/yyyy'') '+
                                                                                 'AND cr_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cr_contrato.id_contrato =cr_credito.id_contrato '+
                                                                                 'AND contrato.id_empresa = %6:d '+
                                                                                 'AND contrato.cve_moneda = %4:s '+
                                                                                 'AND contrato.id_contrato =cr_contrato.id_contrato '+
                                                                                 'AND persona.id_persona =contrato.id_titular '+
                                                                                 'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                                 'AND cr_producto.cve_producto_cre =cr_contrato.cve_producto_cre '+
                                                                                 'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                                 'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                              'UNION ALL '+
                                                                              'SELECT contrato.id_titular AS id_titular, '+
                                                                                     'persona.nombre AS nombre, '+
                                                                                     'moneda.cve_moneda AS cve_moneda, '+
                                                                                     'TO_CHAR(cre_sub_tip_bco.cve_sub_tip_bco) AS cve_producto_cre, '+
                                                                                     'cre_contrato.id_contrato AS id_contrato, '+
                                                                                     'cre_credito.id_credito AS id_credito, '+
                                                                                     'cre_credito.cve_tasa_refer AS cve_tasa_refer, '+
                                                                                     'cr_con_adeudo_sdo.imp_cap_vig AS imp_cap_vig1, '+
                                                                                     'cre_prov_diaria.imp_interes_dia AS imp_interes_dia1, '+
                                                                                     '0 AS imp_cap_vig2, '+
                                                                                     '0 AS imp_interes_dia2 '+
                                                                                'FROM cr_con_adeudo_sdo, '+
                                                                                     'cre_credito, '+
                                                                                     'cre_contrato, '+
                                                                                     'contrato, '+
                                                                                     'persona, '+
                                                                                     'moneda, '+
                                                                                     'cre_sub_tip_bco, '+
                                                                                     'cre_prov_diaria '+
                                                                               'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE (''%2:s'',''dd/mm/yyyy'') '+
                                                                                 'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE (''%3:s'',''dd/mm/yyyy'') '+
                                                                                 'AND cre_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cre_contrato.id_contrato =cre_credito.id_contrato '+
                                                                                 'AND contrato.id_empresa = %6:d '+
                                                                                 'AND contrato.cve_moneda = %4:s '+
                                                                                 'AND contrato.id_contrato =cre_contrato.id_contrato '+
                                                                                 'AND persona.id_persona =contrato.id_titular '+
                                                                                 'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                                 'AND cre_sub_tip_bco.cve_sub_tip_bco =cre_contrato.cve_sub_tip_bco '+
                                                                                 'AND cre_sub_tip_bco.cve_sub_tip_bco NOT IN (57) '+
                                                                                 'AND cre_prov_diaria.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cre_prov_diaria.f_provision =cr_con_adeudo_sdo.f_cierre '+
                                                                                 ') '+
                                                                       'WHERE cve_producto_cre NOT IN ( '+
                                                                                'SELECT consultaproductocre.cve_producto_cre '+
                                                                                  'FROM (SELECT contrato.id_titular AS id_titular, '+
                                                                                               'cr_producto.cve_producto_cre AS cve_producto_cre '+
                                                                                          'FROM cr_con_adeudo_sdo, '+
                                                                                               'cr_credito, '+
                                                                                               'cr_contrato, '+
                                                                                               'contrato, '+
                                                                                               'persona, '+
                                                                                               'moneda, '+
                                                                                               'cr_producto, '+
                                                                                               'cr_histo_cred '+
                                                                                         'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE(''%2:s'',''dd/mm/yyyy'') '+
                                                                                           'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE(''%3:s'',''dd/mm/yyyy'') '+
                                                                                           'AND cr_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cr_contrato.id_contrato =cr_credito.id_contrato '+
                                                                                           'AND contrato.id_empresa =%6:d '+
                                                                                           'AND contrato.cve_moneda =%4:s '+
                                                                                           'AND contrato.id_contrato =cr_contrato.id_contrato '+
                                                                                           'AND persona.id_persona =contrato.id_titular '+
                                                                                           'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                                           'AND cr_producto.cve_producto_cre =cr_contrato.cve_producto_cre '+
                                                                                           'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                                           'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                                           ') consultaproductocr, '+
                                                                                       '(SELECT contrato.id_titular AS id_titular, '+
                                                                                               'TO_CHAR(cre_sub_tip_bco.cve_sub_tip_bco) AS cve_producto_cre '+
                                                                                          'FROM cr_con_adeudo_sdo, '+
                                                                                               'cre_credito, '+
                                                                                               'cre_contrato, '+
                                                                                               'contrato, '+
                                                                                               'persona, '+
                                                                                               'moneda, '+
                                                                                               'cre_sub_tip_bco, '+
                                                                                               'cre_prov_diaria '+
                                                                                         'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE(''%2:s'',''dd/mm/yyyy'') '+
                                                                                           'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE(''%3:s'',''dd/mm/yyyy'') '+
                                                                                           'AND cre_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cre_contrato.id_contrato =cre_credito.id_contrato '+
                                                                                           'AND contrato.id_empresa =%6:d '+
                                                                                           'AND contrato.cve_moneda =%4:s '+
                                                                                           'AND contrato.id_contrato =cre_contrato.id_contrato '+
                                                                                           'AND persona.id_persona =contrato.id_titular '+
                                                                                           'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                                           'AND cre_sub_tip_bco.cve_sub_tip_bco =cre_contrato.cve_sub_tip_bco '+
                                                                                           'AND cre_sub_tip_bco.cve_sub_tip_bco NOT IN (57) '+
                                                                                           'AND cre_prov_diaria.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cre_prov_diaria.f_provision =cr_con_adeudo_sdo.f_cierre '+
                                                                                           ') consultaproductocre '+
                                                                                 'WHERE consultaproductocr.id_titular = consultaproductocre.id_titular) '+
                                                                      ') mesAnterior '+
                                                                'where mesActual.id_titular       (+) = mesAnterior.id_titular '+
                                                                  'AND mesActual.cve_moneda       (+) = mesAnterior.cve_moneda '+
                                                                  'AND mesActual.id_contrato      (+) = mesAnterior.id_contrato '+
                                                                  'AND mesActual.id_credito       (+) = mesAnterior.id_credito '+
                                            ') '+
                                      'union all '+
                                      'select decode(id_titular2, '''', id_titular1, id_titular2) as id_titular, '+
                                             'decode(id_titular2, '''', id_titular1, id_titular2) as id_titular, '+
                                             'nvl(imp_cap_vig1,0)        as imp_cap_vig1, '+
                                             'nvl(imp_interes_dia1,0)    as imp_interes_dia1, '+
                                             'nvl(imp_cap_vig2,0)        as imp_cap_vig2, '+ 
                                             'nvl(imp_interes_dia2,0)    as imp_interes_dia2 '+
                                       'from ( '+ 
                                                              'SELECT mesactual.id_titular         as id_titular2, '+
                                                                     'mesactual.nombre             as nombre, '+ 
                                                                     'mesactual.cve_moneda         as cve_moneda2, '+
                                                                     'mesactual.cve_producto_cre   as cve_producto_cre2, '+
                                                                     'mesactual.id_contrato        as id_contrato2, '+
                                                                     'mesactual.id_credito         as id_credito2, '+
                                                                     'mesactual.cve_tasa_refer     as cve_tasa_refer2, '+
                                                                     'mesactual.imp_cap_vig2       as imp_cap_vig2, '+
                                                                     'mesactual.imp_interes_dia2   as imp_interes_dia2, '+
                                                                     'mesanterior.id_titular       as id_titular1, '+
                                                                     'mesanterior.nombre           as nombre1, '+ 
                                                                     'mesactual.cve_moneda         as cve_moneda1, '+
                                                                     'mesanterior.cve_producto_cre as cve_producto_cre1, '+
                                                                     'mesanterior.id_contrato      as id_contrato1, '+
                                                                     'mesanterior.id_credito       as id_credito1, '+
                                                                     'mesanterior.cve_tasa_refer   as cve_tasa_refer1, '+
                                                                     'mesanterior.imp_cap_vig1     as imp_cap_vig1, '+
                                                                     'mesanterior.imp_interes_dia1 as imp_interes_dia1 '+
                                                                'FROM (SELECT id_titular, nombre, cve_moneda, '+
                                                                             'cve_producto_cre, id_contrato, '+
                                                                             'id_credito, cve_tasa_refer, '+
                                                                             '0 AS imp_cap_vig1, '+
                                                                             '0 AS imp_interes_dia1, '+
                                                                             'imp_cap_vig2 AS imp_cap_vig2, '+
                                                                             'imp_interes_dia2 AS imp_interes_dia2 '+
                                                                        'FROM (SELECT contrato.id_titular AS id_titular, '+
                                                                                     'persona.nombre AS nombre, '+
                                                                                     'moneda.cve_moneda AS cve_moneda, '+
                                                                                     'cr_producto.cve_producto_cre AS cve_producto_cre, '+
                                                                                     'cr_contrato.id_contrato AS id_contrato, '+
                                                                                     'cr_credito.id_credito   AS id_credito, '+
                                                                                     'cr_credito.cve_tasa_refer AS cve_tasa_refer, '+
                                                                                     '0 AS imp_cap_vig1, '+
                                                                                     '0 AS imp_interes_dia1, '+
                                                                                     'cr_con_adeudo_sdo.imp_cap_vig AS imp_cap_vig2, '+
                                                                                     'cr_histo_cred.imp_interes_dia AS imp_interes_dia2 '+
                                                                                'FROM cr_con_adeudo_sdo, '+
                                                                                     'cr_credito, '+
                                                                                     'cr_contrato, '+
                                                                                     'contrato, '+
                                                                                     'persona, '+
                                                                                     'moneda, '+
                                                                                     'cr_producto, '+
                                                                                     'cr_histo_cred '+
                                                                               'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE (''%0:s'',''dd/mm/yyyy'') '+
                                                                                 'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE (''%1:s'',''dd/mm/yyyy'') '+
                                                                                 'AND cr_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cr_contrato.id_contrato =cr_credito.id_contrato '+
                                                                                 'AND contrato.id_empresa = %6:d '+
                                                                                 'AND contrato.cve_moneda = %4:s '+
                                                                                 'AND contrato.id_contrato =cr_contrato.id_contrato '+
                                                                                 'AND persona.id_persona =contrato.id_titular '+
                                                                                 'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                                 'AND cr_producto.cve_producto_cre =cr_contrato.cve_producto_cre '+
                                                                                 'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                                 'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                              'UNION ALL '+
                                                                              'SELECT contrato.id_titular AS id_titular, '+
                                                                                     'persona.nombre AS nombre, '+
                                                                                     'moneda.cve_moneda AS cve_moneda, '+
                                                                                     'TO_CHAR(cre_sub_tip_bco.cve_sub_tip_bco) AS cve_producto_cre, '+
                                                                                     'cre_contrato.id_contrato AS id_contrato, '+
                                                                                     'cre_credito.id_credito AS id_credito, '+
                                                                                     'cre_credito.cve_tasa_refer AS cve_tasa_refer, '+
                                                                                     '0 AS imp_cap_vig1, '+
                                                                                     '0 AS imp_interes_dia1, '+
                                                                                     'cr_con_adeudo_sdo.imp_cap_vig AS imp_cap_vig2, '+
                                                                                     'cre_prov_diaria.imp_interes_dia AS imp_interes_dia2 '+
                                                                                'FROM cr_con_adeudo_sdo, '+
                                                                                     'cre_credito, '+
                                                                                     'cre_contrato, '+
                                                                                     'contrato, '+
                                                                                     'persona, '+
                                                                                     'moneda, '+
                                                                                     'cre_sub_tip_bco, '+
                                                                                     'cre_prov_diaria '+
                                                                               'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE (''%0:s'',''dd/mm/yyyy'') '+
                                                                                 'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE (''%1:s'',''dd/mm/yyyy'') '+
                                                                                 'AND cre_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cre_contrato.id_contrato =cre_credito.id_contrato '+
                                                                                 'AND contrato.id_empresa = %6:d '+
                                                                                 'AND contrato.cve_moneda = %4:s '+
                                                                                 'AND contrato.id_contrato =cre_contrato.id_contrato '+
                                                                                 'AND persona.id_persona =contrato.id_titular '+
                                                                                 'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                                 'AND cre_sub_tip_bco.cve_sub_tip_bco =cre_contrato.cve_sub_tip_bco '+
                                                                                 'AND cre_sub_tip_bco.cve_sub_tip_bco NOT IN(57) '+
                                                                                 'AND cre_prov_diaria.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cre_prov_diaria.f_provision =cr_con_adeudo_sdo.f_cierre '+
                                                                                 ') '+
                                                                       'WHERE cve_producto_cre NOT IN ( '+
                                                                                'SELECT consultaproductocre.cve_producto_cre '+
                                                                                  'FROM (SELECT contrato.id_titular AS id_titular, '+
                                                                                               'cr_producto.cve_producto_cre AS cve_producto_cre '+
                                                                                          'FROM cr_con_adeudo_sdo, '+
                                                                                               'cr_credito, '+
                                                                                               'cr_contrato, '+
                                                                                               'contrato, '+
                                                                                               'persona, '+
                                                                                               'moneda, '+
                                                                                               'cr_producto, '+
                                                                                               'cr_histo_cred '+
                                                                                         'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE(''%0:s'',''dd/mm/yyyy'') '+
                                                                                           'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE(''%1:s'',''dd/mm/yyyy'') '+
                                                                                           'AND cr_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cr_contrato.id_contrato =cr_credito.id_contrato '+
                                                                                           'AND contrato.id_empresa =%6:d '+
                                                                                           'AND contrato.cve_moneda =%4:s '+
                                                                                           'AND contrato.id_contrato =cr_contrato.id_contrato '+
                                                                                           'AND persona.id_persona =contrato.id_titular '+
                                                                                           'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                                           'AND cr_producto.cve_producto_cre =cr_contrato.cve_producto_cre '+
                                                                                           'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                                           'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                                           ') consultaproductocr, '+
                                                                                       '(SELECT contrato.id_titular AS id_titular, '+
                                                                                               'TO_CHAR(cre_sub_tip_bco.cve_sub_tip_bco) AS cve_producto_cre '+
                                                                                          'FROM cr_con_adeudo_sdo, '+
                                                                                               'cre_credito, '+
                                                                                               'cre_contrato, '+
                                                                                               'contrato, '+
                                                                                               'persona, '+
                                                                                               'moneda, '+
                                                                                               'cre_sub_tip_bco, '+
                                                                                               'cre_prov_diaria '+
                                                                                         'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE(''%0:s'',''dd/mm/yyyy'') '+
                                                                                           'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE(''%1:s'',''dd/mm/yyyy'') '+
                                                                                           'AND cre_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cre_contrato.id_contrato =cre_credito.id_contrato '+
                                                                                           'AND contrato.id_empresa =%6:d '+
                                                                                           'AND contrato.cve_moneda =%4:s '+
                                                                                           'AND contrato.id_contrato =cre_contrato.id_contrato '+
                                                                                           'AND persona.id_persona =contrato.id_titular '+
                                                                                           'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                                           'AND cre_sub_tip_bco.cve_sub_tip_bco =cre_contrato.cve_sub_tip_bco '+
                                                                                           'AND cre_sub_tip_bco.cve_sub_tip_bco NOT IN (57) '+
                                                                                           'AND cre_prov_diaria.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cre_prov_diaria.f_provision =cr_con_adeudo_sdo.f_cierre '+
                                                                                           ') consultaproductocre '+
                                                                                 'WHERE consultaproductocr.id_titular =consultaproductocre.id_titular) '+
                                                                              ') mesactual, '+
                                                                     '(SELECT id_titular, nombre, cve_moneda, '+
                                                                             'cve_producto_cre, id_contrato, '+
                                                                             'id_credito, cve_tasa_refer, '+
                                                                             'imp_cap_vig1 AS imp_cap_vig1, '+
                                                                             'imp_interes_dia1 AS imp_interes_dia1, '+
                                                                             '0 AS imp_cap_vig2, '+
                                                                             '0 AS imp_interes_dia2 '+
                                                                        'FROM (SELECT contrato.id_titular AS id_titular, '+
                                                                                     'persona.nombre AS nombre, '+
                                                                                     'moneda.cve_moneda AS cve_moneda, '+
                                                                                     'cr_producto.cve_producto_cre AS cve_producto_cre, '+
                                                                                     'cr_contrato.id_contrato AS id_contrato, '+
                                                                                     'cr_credito.id_credito AS id_credito, '+
                                                                                     'cr_credito.cve_tasa_refer AS cve_tasa_refer, '+
                                                                                     'cr_con_adeudo_sdo.imp_cap_vig AS imp_cap_vig1, '+
                                                                                     'cr_histo_cred.imp_interes_dia AS imp_interes_dia1, '+
                                                                                     '0 AS imp_cap_vig2, '+
                                                                                     '0 AS imp_interes_dia2 '+
                                                                                'FROM cr_con_adeudo_sdo, '+
                                                                                     'cr_credito, '+
                                                                                     'cr_contrato, '+
                                                                                     'contrato, '+
                                                                                     'persona, '+
                                                                                     'moneda, '+
                                                                                     'cr_producto, '+
                                                                                     'cr_histo_cred '+
                                                                               'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE (''%2:s'',''dd/mm/yyyy'') '+
                                                                                 'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE (''%3:s'',''dd/mm/yyyy'') '+
                                                                                 'AND cr_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cr_contrato.id_contrato =cr_credito.id_contrato '+
                                                                                 'AND contrato.id_empresa = %6:d '+
                                                                                 'AND contrato.cve_moneda = %4:s '+
                                                                                 'AND contrato.id_contrato =cr_contrato.id_contrato '+
                                                                                 'AND persona.id_persona =contrato.id_titular '+
                                                                                 'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                                 'AND cr_producto.cve_producto_cre =cr_contrato.cve_producto_cre '+
                                                                                 'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                                 'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                              'UNION ALL '+
                                                                              'SELECT contrato.id_titular AS id_titular, '+
                                                                                     'persona.nombre AS nombre, '+
                                                                                     'moneda.cve_moneda AS cve_moneda, '+
                                                                                     'TO_CHAR(cre_sub_tip_bco.cve_sub_tip_bco) AS cve_producto_cre, '+
                                                                                     'cre_contrato.id_contrato AS id_contrato, '+
                                                                                     'cre_credito.id_credito AS id_credito, '+
                                                                                     'cre_credito.cve_tasa_refer AS cve_tasa_refer, '+
                                                                                     'cr_con_adeudo_sdo.imp_cap_vig AS imp_cap_vig1, '+
                                                                                     'cre_prov_diaria.imp_interes_dia AS imp_interes_dia1, '+
                                                                                     '0 AS imp_cap_vig2, '+
                                                                                     '0 AS imp_interes_dia2 '+
                                                                                'FROM cr_con_adeudo_sdo, '+
                                                                                     'cre_credito, '+
                                                                                     'cre_contrato, '+
                                                                                     'contrato, '+
                                                                                     'persona, '+
                                                                                     'moneda, '+
                                                                                     'cre_sub_tip_bco, '+
                                                                                     'cre_prov_diaria '+
                                                                               'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE (''%2:s'',''dd/mm/yyyy'') '+
                                                                                 'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE (''%3:s'',''dd/mm/yyyy'') '+
                                                                                 'AND cre_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cre_contrato.id_contrato =cre_credito.id_contrato '+
                                                                                 'AND contrato.id_empresa = %6:d '+
                                                                                 'AND contrato.cve_moneda = %4:s '+
                                                                                 'AND contrato.id_contrato =cre_contrato.id_contrato '+
                                                                                 'AND persona.id_persona =contrato.id_titular '+
                                                                                 'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                                 'AND cre_sub_tip_bco.cve_sub_tip_bco =cre_contrato.cve_sub_tip_bco '+
                                                                                 'AND cre_sub_tip_bco.cve_sub_tip_bco NOT IN (57) '+
                                                                                 'AND cre_prov_diaria.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                 'AND cre_prov_diaria.f_provision =cr_con_adeudo_sdo.f_cierre '+
                                                                                 ') '+
                                                                       'WHERE cve_producto_cre NOT IN ( '+
                                                                                'SELECT consultaproductocre.cve_producto_cre '+
                                                                                  'FROM (SELECT contrato.id_titular AS id_titular, '+
                                                                                               'cr_producto.cve_producto_cre AS cve_producto_cre '+
                                                                                          'FROM cr_con_adeudo_sdo, '+
                                                                                               'cr_credito, '+
                                                                                               'cr_contrato, '+
                                                                                               'contrato, '+
                                                                                               'persona, '+
                                                                                               'moneda, '+
                                                                                               'cr_producto, '+
                                                                                               'cr_histo_cred '+
                                                                                         'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE(''%2:s'',''dd/mm/yyyy'') '+
                                                                                           'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE(''%3:s'',''dd/mm/yyyy'') '+
                                                                                           'AND cr_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cr_contrato.id_contrato =cr_credito.id_contrato '+
                                                                                           'AND contrato.id_empresa =%6:d '+
                                                                                           'AND contrato.cve_moneda =%4:s '+
                                                                                           'AND contrato.id_contrato =cr_contrato.id_contrato '+
                                                                                           'AND persona.id_persona =contrato.id_titular '+
                                                                                           'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                                           'AND cr_producto.cve_producto_cre =cr_contrato.cve_producto_cre '+
                                                                                           'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                                           'AND cr_histo_cred.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cr_histo_cred.f_cierre =cr_con_adeudo_sdo.f_cierre '+
                                                                                           ') consultaproductocr, '+
                                                                                       '(SELECT contrato.id_titular AS id_titular, '+
                                                                                               'TO_CHAR(cre_sub_tip_bco.cve_sub_tip_bco) AS cve_producto_cre '+
                                                                                          'FROM cr_con_adeudo_sdo, '+
                                                                                               'cre_credito, '+
                                                                                               'cre_contrato, '+
                                                                                               'contrato, '+
                                                                                               'persona, '+
                                                                                               'moneda, '+
                                                                                               'cre_sub_tip_bco, '+
                                                                                               'cre_prov_diaria '+
                                                                                         'WHERE cr_con_adeudo_sdo.f_cierre >=TO_DATE(''%2:s'',''dd/mm/yyyy'') '+
                                                                                           'AND cr_con_adeudo_sdo.f_cierre <=TO_DATE(''%3:s'',''dd/mm/yyyy'') '+
                                                                                           'AND cre_credito.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cre_contrato.id_contrato =cre_credito.id_contrato '+
                                                                                           'AND contrato.id_empresa =%6:d '+
                                                                                           'AND contrato.cve_moneda =%4:s '+
                                                                                           'AND contrato.id_contrato =cre_contrato.id_contrato '+
                                                                                           'AND persona.id_persona =contrato.id_titular '+
                                                                                           'AND moneda.cve_moneda =contrato.cve_moneda '+
                                                                                           'AND cre_sub_tip_bco.cve_sub_tip_bco =cre_contrato.cve_sub_tip_bco '+
                                                                                           'AND cre_sub_tip_bco.cve_sub_tip_bco NOT IN (57) '+
                                                                                           'AND cre_prov_diaria.id_credito =cr_con_adeudo_sdo.id_credito '+
                                                                                           'AND cre_prov_diaria.f_provision =cr_con_adeudo_sdo.f_cierre '+
                                                                                           ') consultaproductocre '+
                                                                                 'WHERE consultaproductocr.id_titular = consultaproductocre.id_titular) '+
                                                                      ') mesAnterior '+
                                                                'where mesActual.id_titular       = mesAnterior.id_titular       (+) '+
                                                                  'AND mesActual.cve_moneda       = mesAnterior.cve_moneda       (+) '+
                                                                  'AND mesActual.id_contrato      = mesAnterior.id_contrato      (+) '+
                                                                  'AND mesActual.id_credito       = mesAnterior.id_credito       (+) '+
                                                                  'and mesAnterior.id_titular is null '+
                                           ') '+
                                       ') '+
                                        'group by id_titular2 '+
                                        'order by variacion desc, id_titular2 '+
                             ') where rownum <= 10) '+
    ') '+
    'group by id_titular, nombre, cve_moneda, cve_tasa_refer, id_credito ';


{                 'select mesActual.ID_TITULAR,  mesActual.NOMBRE,     mesActual.CVE_MONEDA,     mesActual.CVE_PRODUCTO_CRE,  '+
                         'mesActual.ID_CONTRATO, mesActual.ID_CREDITO, mesActual.CVE_TASA_REFER,  '+
                         'mesAnterior.IMP_CAP_VIG1 AS IMP_CAP_VIG1,  '+
                         'mesAnterior.IMP_INTERES_DIA1 AS IMP_INTERES_DIA1, '+
                         'mesActual.IMP_CAP_VIG2 AS IMP_CAP_VIG2,  '+
                         'mesActual.IMP_INTERES_DIA2 AS IMP_INTERES_DIA2 '+
                    'from (   '+
                          'select ID_TITULAR, NOMBRE, CVE_MONEDA, CVE_PRODUCTO_CRE, ID_CONTRATO, ID_CREDITO, CVE_TASA_REFER,  '+
                                 '0 AS IMP_CAP_VIG1, 0 AS IMP_INTERES_DIA1,   '+
                                 'IMP_CAP_VIG2     AS IMP_CAP_VIG2,  '+
                                 'IMP_INTERES_DIA2 AS IMP_INTERES_DIA2 '+
                            'from (    '+
                                    'select CONTRATO.ID_TITULAR           AS ID_TITULAR,       PERSONA.NOMBRE          AS NOMBRE,      MONEDA.CVE_MONEDA     AS CVE_MONEDA,  '+
                                           'CR_PRODUCTO.CVE_PRODUCTO_CRE  AS CVE_PRODUCTO_CRE, CR_CONTRATO.ID_CONTRATO AS ID_CONTRATO, CR_CREDITO.ID_CREDITO AS ID_CREDITO,  '+
                                           'CR_CREDITO.CVE_TASA_REFER     AS CVE_TASA_REFER,   0 AS IMP_CAP_VIG1, 0 AS IMP_INTERES_DIA1,     '+
                                           'CR_CON_ADEUDO_SDO.IMP_CAP_VIG AS IMP_CAP_VIG2,   '+
                                           'CR_HISTO_CRED.IMP_INTERES_DIA AS IMP_INTERES_DIA2   '+
                                      'from CR_CON_ADEUDO_SDO, CR_CREDITO, CR_CONTRATO, CONTRATO,  '+
                                           'PERSONA,           MONEDA,     CR_PRODUCTO, CR_HISTO_CRED '+
                                     'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%0:s'',''dd/mm/yyyy'') '+
                                       'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%1:s'',''dd/mm/yyyy'') '+
//                                       'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG > 0 '+
                                       'and CR_CREDITO.id_credito         = CR_CON_ADEUDO_SDO.id_credito '+
                                       'and CR_CONTRATO.id_contrato       = CR_CREDITO.id_contrato '+
                                       'and CONTRATO.id_empresa           = 2 '+
                                       'and CONTRATO.cve_moneda           = %4:s '+
                                       'and CONTRATO.id_contrato          = CR_CONTRATO.id_contrato '+
                                       'and PERSONA.id_persona            = CONTRATO.id_titular '+
                                       'and MONEDA.cve_moneda             = CONTRATO.cve_moneda '+
                                       'and CR_PRODUCTO.cve_producto_cre  = CR_CONTRATO.cve_producto_cre '+
                                       'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                       'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
                                       'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                       'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
//                                       'and CR_HISTO_CRED.IMP_INTERES_DIA > 0 '+
                                     'union all '+
                                    'select CONTRATO.ID_TITULAR             AS ID_TITULAR,       PERSONA.NOMBRE           AS NOMBRE,      MONEDA.CVE_MONEDA      AS CVE_MONEDA,  '+
                                           'to_char(CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE, CRE_CONTRATO.ID_CONTRATO AS ID_CONTRATO, CRE_CREDITO.ID_CREDITO AS ID_CREDITO,  '+
                                           'CRE_CREDITO.CVE_TASA_REFER      AS CVE_TASA_REFER,   0 AS IMP_CAP_VIG1, 0 AS IMP_INTERES_DIA1,  '+
                                           'CR_CON_ADEUDO_SDO.IMP_CAP_VIG   AS IMP_CAP_VIG2,      CRE_PROV_DIARIA.IMP_INTERES_DIA AS IMP_INTERES_DIA2   '+
                                      'from CR_CON_ADEUDO_SDO, CRE_CREDITO, CRE_CONTRATO,    CONTRATO,  '+
                                           'PERSONA,           MONEDA,      CRE_SUB_TIP_BCO, CRE_PROV_DIARIA '+
                                     'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%0:s'',''dd/mm/yyyy'') '+
                                       'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%1:s'',''dd/mm/yyyy'')  '+
//                                       'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG   > 0 '+
                                       'and CRE_CREDITO.id_credito          = CR_CON_ADEUDO_SDO.id_credito '+
                                       'and CRE_CONTRATO.id_contrato        = CRE_CREDITO.id_contrato '+
                                       'and CONTRATO.id_empresa             = 2 '+
                                       'and CONTRATO.cve_moneda           = %4:s  '+
                                       'and CONTRATO.id_contrato            = CRE_CONTRATO.id_contrato '+
                                       'and PERSONA.id_persona              = CONTRATO.id_titular '+
                                       'and MONEDA.cve_moneda               = CONTRATO.cve_moneda '+
                                       'and CRE_SUB_TIP_BCO.cve_sub_tip_bco = CRE_CONTRATO.cve_sub_tip_bco '+
                                       'and CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO not in (57) '+
                                       'and CRE_PROV_DIARIA.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                       'and CRE_PROV_DIARIA.f_provision     =CR_CON_ADEUDO_SDO.f_cierre '+
                                       'and CRE_PROV_DIARIA.IMP_INTERES_DIA > 0 '+
                                       ') where CVE_PRODUCTO_CRE not in (select consultaProductoCre.cve_producto_cre  '+
                                                                            'from ( '+
                                                                                    'select CONTRATO.ID_TITULAR          AS ID_TITULAR,  '+
                                                                                           'CR_PRODUCTO.CVE_PRODUCTO_CRE AS CVE_PRODUCTO_CRE     '+
                                                                                      'from CR_CON_ADEUDO_SDO, CR_CREDITO, CR_CONTRATO, CONTRATO,  '+
                                                                                           'PERSONA,           MONEDA,     CR_PRODUCTO, CR_HISTO_CRED '+
                                                                                     'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%0:s'',''dd/mm/yyyy'') '+
                                                                                       'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%1:s'',''dd/mm/yyyy'') '+
//                                                                                       'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG > 0 '+
                                                                                       'and CR_CREDITO.id_credito         = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                       'and CR_CONTRATO.id_contrato       = CR_CREDITO.id_contrato '+
                                                                                       'and CONTRATO.id_empresa           = 2 '+
                                                                                       'and CONTRATO.cve_moneda           = %4:s '+
                                                                                       'and CONTRATO.id_contrato          = CR_CONTRATO.id_contrato '+
                                                                                       'and PERSONA.id_persona            = CONTRATO.id_titular '+
                                                                                       'and MONEDA.cve_moneda             = CONTRATO.cve_moneda '+
                                                                                       'and CR_PRODUCTO.cve_producto_cre  = CR_CONTRATO.cve_producto_cre '+
                                                                                       'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                       'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
                                                                                       'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                       'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
//                                                                                       'and CR_HISTO_CRED.IMP_INTERES_DIA > 0 '+
                                                                                  ') consultaProductoCr, '+
                                                                                  '( '+
                                                                                    'select CONTRATO.ID_TITULAR                      AS ID_TITULAR,  '+
                                                                                           'to_char(CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE   '+
                                                                                      'from CR_CON_ADEUDO_SDO, CRE_CREDITO, CRE_CONTRATO,    CONTRATO,  '+
                                                                                           'PERSONA,           MONEDA,      CRE_SUB_TIP_BCO, CRE_PROV_DIARIA '+
                                                                                     'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%0:s'',''dd/mm/yyyy'') '+
                                                                                       'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%1:s'',''dd/mm/yyyy'')  '+
//                                                                                       'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG   > 0 '+
                                                                                       'and CRE_CREDITO.id_credito          = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                       'and CRE_CONTRATO.id_contrato        = CRE_CREDITO.id_contrato '+
                                                                                       'and CONTRATO.id_empresa             = 2 '+
                                                                                       'and CONTRATO.cve_moneda           = %4:s  '+
                                                                                       'and CONTRATO.id_contrato            = CRE_CONTRATO.id_contrato '+
                                                                                       'and PERSONA.id_persona              = CONTRATO.id_titular '+
                                                                                       'and MONEDA.cve_moneda               = CONTRATO.cve_moneda '+
                                                                                       'and CRE_SUB_TIP_BCO.cve_sub_tip_bco = CRE_CONTRATO.cve_sub_tip_bco '+
                                                                                       'and CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO not in (57) '+
                                                                                       'and CRE_PROV_DIARIA.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                       'and CRE_PROV_DIARIA.f_provision     =CR_CON_ADEUDO_SDO.f_cierre '+
                                                                                       'and CRE_PROV_DIARIA.IMP_INTERES_DIA > 0 '+
                                                                                  ') consultaProductoCre '+
                                                                              'where consultaProductoCr.id_titular  = consultaProductoCre.id_titular '+
                                                                             ') '+
                                            ') mesActual, '+
                              '( '+
                              'select ID_TITULAR, NOMBRE, CVE_MONEDA, CVE_PRODUCTO_CRE, ID_CONTRATO, ID_CREDITO, CVE_TASA_REFER,  '+
                                     'IMP_CAP_VIG1 AS IMP_CAP_VIG1, IMP_INTERES_DIA1 AS IMP_INTERES_DIA1, '+
                                     '0 AS IMP_CAP_VIG2, '+
                                     '0 AS IMP_INTERES_DIA2 '+
                                'from ( '+
                                        'select CONTRATO.ID_TITULAR           AS ID_TITULAR,       PERSONA.NOMBRE          AS NOMBRE,      MONEDA.CVE_MONEDA     AS CVE_MONEDA,  '+
                                               'CR_PRODUCTO.CVE_PRODUCTO_CRE  AS CVE_PRODUCTO_CRE, CR_CONTRATO.ID_CONTRATO AS ID_CONTRATO, CR_CREDITO.ID_CREDITO AS ID_CREDITO,  '+
                                               'CR_CREDITO.CVE_TASA_REFER     AS CVE_TASA_REFER,   CR_CON_ADEUDO_SDO.IMP_CAP_VIG AS IMP_CAP_VIG1, CR_HISTO_CRED.IMP_INTERES_DIA AS IMP_INTERES_DIA1, '+
                                               '0 AS IMP_CAP_VIG2,  '+
                                               '0 AS IMP_INTERES_DIA2  '+
                                          'from CR_CON_ADEUDO_SDO, CR_CREDITO, CR_CONTRATO, CONTRATO,  '+
                                               'PERSONA,           MONEDA,     CR_PRODUCTO, CR_HISTO_CRED '+
                                         'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%2:s'',''dd/mm/yyyy'') '+
                                           'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%3:s'',''dd/mm/yyyy'') '+
//                                           'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG > 0 '+
                                           'and CR_CREDITO.id_credito         = CR_CON_ADEUDO_SDO.id_credito '+
                                           'and CR_CONTRATO.id_contrato       = CR_CREDITO.id_contrato '+
                                           'and CONTRATO.id_empresa           = 2 '+
                                           'and CONTRATO.cve_moneda           = %4:s '+
                                           'and CONTRATO.id_contrato          = CR_CONTRATO.id_contrato '+
                                           'and PERSONA.id_persona            = CONTRATO.id_titular '+
                                           'and MONEDA.cve_moneda             = CONTRATO.cve_moneda '+
                                           'and CR_PRODUCTO.cve_producto_cre  = CR_CONTRATO.cve_producto_cre '+
                                           'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                           'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
                                           'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                           'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
//                                           'and CR_HISTO_CRED.IMP_INTERES_DIA > 0 '+
                                         'union all '+
                                        'select CONTRATO.ID_TITULAR             AS ID_TITULAR,       PERSONA.NOMBRE           AS NOMBRE,      MONEDA.CVE_MONEDA      AS CVE_MONEDA,  '+
                                               'to_char(CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE, CRE_CONTRATO.ID_CONTRATO AS ID_CONTRATO, CRE_CREDITO.ID_CREDITO AS ID_CREDITO,  '+
                                               'CRE_CREDITO.CVE_TASA_REFER      AS CVE_TASA_REFER,   CR_CON_ADEUDO_SDO.IMP_CAP_VIG AS IMP_CAP_VIG1, CRE_PROV_DIARIA.IMP_INTERES_DIA AS IMP_INTERES_DIA1,     '+
                                               '0 AS IMP_CAP_VIG2,     0 AS IMP_INTERES_DIA2   '+
                                          'from CR_CON_ADEUDO_SDO, CRE_CREDITO, CRE_CONTRATO,    CONTRATO,  '+
                                               'PERSONA,           MONEDA,      CRE_SUB_TIP_BCO, CRE_PROV_DIARIA '+
                                         'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%2:s'',''dd/mm/yyyy'') '+
                                           'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%3:s'',''dd/mm/yyyy'')  '+
//                                           'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG   > 0 '+
                                           'and CRE_CREDITO.id_credito          = CR_CON_ADEUDO_SDO.id_credito '+
                                           'and CRE_CONTRATO.id_contrato        = CRE_CREDITO.id_contrato '+
                                           'and CONTRATO.id_empresa             = 2 '+
                                           'and CONTRATO.cve_moneda           = %4:s  '+
                                           'and CONTRATO.id_contrato            = CRE_CONTRATO.id_contrato '+
                                           'and PERSONA.id_persona              = CONTRATO.id_titular '+
                                           'and MONEDA.cve_moneda               = CONTRATO.cve_moneda '+
                                           'and CRE_SUB_TIP_BCO.cve_sub_tip_bco = CRE_CONTRATO.cve_sub_tip_bco '+
                                           'and CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO ' +
                                           'not in (57) '+
                                           'and CRE_PROV_DIARIA.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                           'and CRE_PROV_DIARIA.f_provision     =CR_CON_ADEUDO_SDO.f_cierre '+
                                           'and CRE_PROV_DIARIA.IMP_INTERES_DIA > 0 '+
                                           ') where CVE_PRODUCTO_CRE not in (select consultaProductoCre.cve_producto_cre  '+
                                                                                'from ( '+
                                                                                        'select CONTRATO.ID_TITULAR          AS ID_TITULAR,  '+
                                                                                               'CR_PRODUCTO.CVE_PRODUCTO_CRE AS CVE_PRODUCTO_CRE '+
                                                                                          'from CR_CON_ADEUDO_SDO, CR_CREDITO, CR_CONTRATO, CONTRATO, '+
                                                                                               'PERSONA,           MONEDA,     CR_PRODUCTO, CR_HISTO_CRED '+
                                                                                         'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%2:s'',''dd/mm/yyyy'') '+
                                                                                           'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%3:s'',''dd/mm/yyyy'') '+
//                                                                                           'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG > 0 '+
                                                                                           'and CR_CREDITO.id_credito         = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                           'and CR_CONTRATO.id_contrato       = CR_CREDITO.id_contrato '+
                                                                                           'and CONTRATO.id_empresa           = 2 '+
                                                                                           'and CONTRATO.cve_moneda           = %4:s '+
                                                                                           'and CONTRATO.id_contrato          = CR_CONTRATO.id_contrato '+
                                                                                           'and PERSONA.id_persona            = CONTRATO.id_titular '+
                                                                                           'and MONEDA.cve_moneda             = CONTRATO.cve_moneda '+
                                                                                           'and CR_PRODUCTO.cve_producto_cre  = CR_CONTRATO.cve_producto_cre '+
                                                                                           'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                           'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
                                                                                           'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                           'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
//                                                                                           'and CR_HISTO_CRED.IMP_INTERES_DIA > 0 '+
                                                                                      ') consultaProductoCr, '+
                                                                                      '( '+
                                                                                        'select CONTRATO.ID_TITULAR                      AS ID_TITULAR,  '+
                                                                                               'to_char(CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE   '+
                                                                                          'from CR_CON_ADEUDO_SDO, CRE_CREDITO, CRE_CONTRATO,    CONTRATO,  '+
                                                                                               'PERSONA,           MONEDA,      CRE_SUB_TIP_BCO, CRE_PROV_DIARIA '+
                                                                                         'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%2:s'',''dd/mm/yyyy'') '+
                                                                                           'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%3:s'',''dd/mm/yyyy'')  '+
//                                                                                           'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG   > 0 '+
                                                                                           'and CRE_CREDITO.id_credito          = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                           'and CRE_CONTRATO.id_contrato        = CRE_CREDITO.id_contrato '+
                                                                                           'and CONTRATO.id_empresa             = 2 '+
                                                                                           'and CONTRATO.cve_moneda           = %4:s  '+
                                                                                           'and CONTRATO.id_contrato            = CRE_CONTRATO.id_contrato '+
                                                                                           'and PERSONA.id_persona              = CONTRATO.id_titular '+
                                                                                           'and MONEDA.cve_moneda               = CONTRATO.cve_moneda '+
                                                                                           'and CRE_SUB_TIP_BCO.cve_sub_tip_bco = CRE_CONTRATO.cve_sub_tip_bco '+
                                                                                           'and CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO not in (57) '+
                                                                                           'and CRE_PROV_DIARIA.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                           'and CRE_PROV_DIARIA.f_provision     =CR_CON_ADEUDO_SDO.f_cierre '+
                                                                                           'and CRE_PROV_DIARIA.IMP_INTERES_DIA > 0 '+
                                                                                      ') consultaProductoCre '+
                                                                                  'where consultaProductoCr.id_titular  = consultaProductoCre.id_titular '+
                                                                                 ') '+
                 ') mesAnterior '+
                 'where mesActual.id_titular    (+)   = mesAnterior.id_titular  '+
                   'and mesActual.cve_moneda    (+)   = mesAnterior.cve_moneda  '+
                   'and mesActual.id_contrato   (+)   = mesAnterior.id_contrato '+
                   'and mesActual.id_credito    (+)   = mesAnterior.id_credito  '+
          ') where id_titular in (select id_titular '+
                                   'from ( '+
                                  'select ID_TITULAR, '+
                                         'SUM(IMP_CAP_VIG1)     AS IMP_CAP_VIG1, '+
                                         'SUM(IMP_INTERES_DIA1) AS IMP_INTERES_DIA1, '+
                                         'SUM(IMP_CAP_VIG2)     AS IMP_CAP_VIG2, '+
                                         'SUM(IMP_INTERES_DIA2) AS IMP_INTERES_DIA2, '+
                                         'SUM(ABS(IMP_INTERES_DIA1 - IMP_INTERES_DIA2)) AS VARIACION '+
                                    'from ( '+
                                          'select mesActual.ID_TITULAR AS ID_TITULAR,  mesActual.NOMBRE,     mesActual.CVE_MONEDA,     mesActual.CVE_PRODUCTO_CRE, '+
                                                 'mesActual.ID_CONTRATO, mesActual.ID_CREDITO, mesActual.CVE_TASA_REFER, '+
                                                 'mesAnterior.IMP_CAP_VIG1 AS IMP_CAP_VIG1, '+
                                                 'mesAnterior.IMP_INTERES_DIA1 AS IMP_INTERES_DIA1, '+
                                                 'mesActual.IMP_CAP_VIG2 AS IMP_CAP_VIG2, '+
                                                 'mesActual.IMP_INTERES_DIA2 AS IMP_INTERES_DIA2 '+
                                            'from ( '+
                                                  'select ID_TITULAR, NOMBRE, CVE_MONEDA, CVE_PRODUCTO_CRE, ID_CONTRATO, ID_CREDITO, CVE_TASA_REFER, '+
                                                         '0 AS IMP_CAP_VIG1, 0 AS IMP_INTERES_DIA1, '+
                                                         'IMP_CAP_VIG2     AS IMP_CAP_VIG2, '+
                                                         'IMP_INTERES_DIA2 AS IMP_INTERES_DIA2 '+
                                                    'from ( '+
                                                            'select CONTRATO.ID_TITULAR           AS ID_TITULAR,       PERSONA.NOMBRE          AS NOMBRE,      MONEDA.CVE_MONEDA     AS CVE_MONEDA, '+
                                                                   'CR_PRODUCTO.CVE_PRODUCTO_CRE  AS CVE_PRODUCTO_CRE, CR_CONTRATO.ID_CONTRATO AS ID_CONTRATO, CR_CREDITO.ID_CREDITO AS ID_CREDITO, '+
                                                                   'CR_CREDITO.CVE_TASA_REFER     AS CVE_TASA_REFER,   0 AS IMP_CAP_VIG1, 0 AS IMP_INTERES_DIA1, '+
                                                                   'CR_CON_ADEUDO_SDO.IMP_CAP_VIG AS IMP_CAP_VIG2, '+
                                                                   'CR_HISTO_CRED.IMP_INTERES_DIA AS IMP_INTERES_DIA2 '+
                                                              'from CR_CON_ADEUDO_SDO, CR_CREDITO, CR_CONTRATO, CONTRATO, '+
                                                                   'PERSONA,           MONEDA,     CR_PRODUCTO, CR_HISTO_CRED '+
                                                             'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%0:s'',''dd/mm/yyyy'') '+
                                                               'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%1:s'',''dd/mm/yyyy'') '+
//                                                               'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG > 0 '+
                                                               'and CR_CREDITO.id_credito         = CR_CON_ADEUDO_SDO.id_credito '+
                                                               'and CR_CONTRATO.id_contrato       = CR_CREDITO.id_contrato '+
                                                               'and CONTRATO.id_empresa           = 2 '+
                                                               'and CONTRATO.cve_moneda           = %4:s '+
                                                               'and CONTRATO.id_contrato          = CR_CONTRATO.id_contrato '+
                                                               'and PERSONA.id_persona            = CONTRATO.id_titular '+
                                                               'and MONEDA.cve_moneda             = CONTRATO.cve_moneda '+
                                                               'and CR_PRODUCTO.cve_producto_cre  = CR_CONTRATO.cve_producto_cre '+
                                                               'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                               'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
                                                               'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                               'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
//                                                               'and CR_HISTO_CRED.IMP_INTERES_DIA > 0 '+
                                                             'union all '+
                                                            'select CONTRATO.ID_TITULAR             AS ID_TITULAR,       PERSONA.NOMBRE           AS NOMBRE,      MONEDA.CVE_MONEDA      AS CVE_MONEDA, '+
                                                                   'to_char(CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE, CRE_CONTRATO.ID_CONTRATO AS ID_CONTRATO, CRE_CREDITO.ID_CREDITO AS ID_CREDITO, '+
                                                                   'CRE_CREDITO.CVE_TASA_REFER      AS CVE_TASA_REFER,   0 AS IMP_CAP_VIG1, 0 AS IMP_INTERES_DIA1, '+
                                                                   'CR_CON_ADEUDO_SDO.IMP_CAP_VIG   AS IMP_CAP_VIG2,      CRE_PROV_DIARIA.IMP_INTERES_DIA AS IMP_INTERES_DIA2 '+
                                                              'from CR_CON_ADEUDO_SDO, CRE_CREDITO, CRE_CONTRATO,    CONTRATO, '+
                                                                   'PERSONA,           MONEDA,      CRE_SUB_TIP_BCO, CRE_PROV_DIARIA '+
                                                             'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%0:s'',''dd/mm/yyyy'') '+
                                                               'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%1:s'',''dd/mm/yyyy'')  '+
//                                                               'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG   > 0 '+
                                                               'and CRE_CREDITO.id_credito          = CR_CON_ADEUDO_SDO.id_credito '+
                                                               'and CRE_CONTRATO.id_contrato        = CRE_CREDITO.id_contrato '+
                                                               'and CONTRATO.id_empresa             = 2 '+
                                                               'and CONTRATO.cve_moneda           = %4:s  '+
                                                               'and CONTRATO.id_contrato            = CRE_CONTRATO.id_contrato '+
                                                               'and PERSONA.id_persona              = CONTRATO.id_titular '+
                                                               'and MONEDA.cve_moneda               = CONTRATO.cve_moneda '+
                                                               'and CRE_SUB_TIP_BCO.cve_sub_tip_bco = CRE_CONTRATO.cve_sub_tip_bco '+
                                                               'and CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO not in (57) '+
                                                               'and CRE_PROV_DIARIA.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                               'and CRE_PROV_DIARIA.f_provision     =CR_CON_ADEUDO_SDO.f_cierre '+
                                                               'and CRE_PROV_DIARIA.IMP_INTERES_DIA > 0 '+
                                                               ') where CVE_PRODUCTO_CRE not in (select consultaProductoCre.cve_producto_cre '+
                                                                                                    'from ( '+
                                                                                                            'select CONTRATO.ID_TITULAR          AS ID_TITULAR, '+
                                                                                                                   'CR_PRODUCTO.CVE_PRODUCTO_CRE AS CVE_PRODUCTO_CRE '+
                                                                                                              'from CR_CON_ADEUDO_SDO, CR_CREDITO, CR_CONTRATO, CONTRATO, '+
                                                                                                                   'PERSONA,           MONEDA,     CR_PRODUCTO, CR_HISTO_CRED '+
                                                                                                             'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%0:s'',''dd/mm/yyyy'') '+
                                                                                                               'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%1:s'',''dd/mm/yyyy'') '+
//                                                                                                               'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG > 0 '+
                                                                                                               'and CR_CREDITO.id_credito         = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                               'and CR_CONTRATO.id_contrato       = CR_CREDITO.id_contrato '+
                                                                                                               'and CONTRATO.id_empresa           = 2 '+
                                                                                                               'and CONTRATO.cve_moneda           = %4:s '+
                                                                                                               'and CONTRATO.id_contrato          = CR_CONTRATO.id_contrato '+
                                                                                                               'and PERSONA.id_persona            = CONTRATO.id_titular '+
                                                                                                               'and MONEDA.cve_moneda             = CONTRATO.cve_moneda '+
                                                                                                               'and CR_PRODUCTO.cve_producto_cre  = CR_CONTRATO.cve_producto_cre '+
                                                                                                               'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                               'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
                                                                                                               'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                               'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
//                                                                                                               'and CR_HISTO_CRED.IMP_INTERES_DIA > 0 '+
                                                                                                          ') consultaProductoCr, '+
                                                                                                          '( '+
                                                                                                            'select CONTRATO.ID_TITULAR                      AS ID_TITULAR, '+
                                                                                                                   'to_char(CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE '+
                                                                                                              'from CR_CON_ADEUDO_SDO, CRE_CREDITO, CRE_CONTRATO,    CONTRATO, '+
                                                                                                                   'PERSONA,           MONEDA,      CRE_SUB_TIP_BCO, CRE_PROV_DIARIA '+
                                                                                                             'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%0:s'',''dd/mm/yyyy'') '+
                                                                                                               'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%1:s'',''dd/mm/yyyy'')  '+
//                                                                                                               'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG   > 0 '+
                                                                                                               'and CRE_CREDITO.id_credito          = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                               'and CRE_CONTRATO.id_contrato        = CRE_CREDITO.id_contrato '+
                                                                                                               'and CONTRATO.id_empresa             = 2 '+
                                                                                                               'and CONTRATO.cve_moneda           = %4:s  '+
                                                                                                               'and CONTRATO.id_contrato            = CRE_CONTRATO.id_contrato '+
                                                                                                               'and PERSONA.id_persona              = CONTRATO.id_titular '+
                                                                                                               'and MONEDA.cve_moneda               = CONTRATO.cve_moneda '+
                                                                                                               'and CRE_SUB_TIP_BCO.cve_sub_tip_bco = CRE_CONTRATO.cve_sub_tip_bco '+
                                                                                                               'and CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO not in (57) '+
                                                                                                               'and CRE_PROV_DIARIA.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                               'and CRE_PROV_DIARIA.f_provision     =CR_CON_ADEUDO_SDO.f_cierre '+
                                                                                                               'and CRE_PROV_DIARIA.IMP_INTERES_DIA > 0 '+
                                                                                                          ') consultaProductoCre '+
                                                                                                      'where consultaProductoCr.id_titular  = consultaProductoCre.id_titular '+
                                                                                                     ') '+
                                                                    ') mesActual, '+
                                                      '( '+
                                                      'select ID_TITULAR, NOMBRE, CVE_MONEDA, CVE_PRODUCTO_CRE, ID_CONTRATO, ID_CREDITO, CVE_TASA_REFER, '+
                                                             'IMP_CAP_VIG1 AS IMP_CAP_VIG1, IMP_INTERES_DIA1 AS IMP_INTERES_DIA1, '+
                                                             '0 AS IMP_CAP_VIG2, '+
                                                             '0 AS IMP_INTERES_DIA2 '+
                                                        'from ( '+
                                                                'select CONTRATO.ID_TITULAR           AS ID_TITULAR,       PERSONA.NOMBRE          AS NOMBRE,      MONEDA.CVE_MONEDA     AS CVE_MONEDA, '+
                                                                       'CR_PRODUCTO.CVE_PRODUCTO_CRE  AS CVE_PRODUCTO_CRE, CR_CONTRATO.ID_CONTRATO AS ID_CONTRATO, CR_CREDITO.ID_CREDITO AS ID_CREDITO, '+
                                                                       'CR_CREDITO.CVE_TASA_REFER     AS CVE_TASA_REFER,   CR_CON_ADEUDO_SDO.IMP_CAP_VIG AS IMP_CAP_VIG1, CR_HISTO_CRED.IMP_INTERES_DIA AS IMP_INTERES_DIA1, '+
                                                                       '0 AS IMP_CAP_VIG2, '+
                                                                       '0 AS IMP_INTERES_DIA2 '+
                                                                  'from CR_CON_ADEUDO_SDO, CR_CREDITO, CR_CONTRATO, CONTRATO, '+
                                                                       'PERSONA,           MONEDA,     CR_PRODUCTO, CR_HISTO_CRED '+
                                                                 'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%2:s'',''dd/mm/yyyy'') '+
                                                                   'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%3:s'',''dd/mm/yyyy'') '+
//                                                                   'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG > 0 '+
                                                                   'and CR_CREDITO.id_credito         = CR_CON_ADEUDO_SDO.id_credito '+
                                                                   'and CR_CONTRATO.id_contrato       = CR_CREDITO.id_contrato '+
                                                                   'and CONTRATO.id_empresa           = 2 '+
                                                                   'and CONTRATO.cve_moneda           = %4:s '+
                                                                   'and CONTRATO.id_contrato          = CR_CONTRATO.id_contrato '+
                                                                   'and PERSONA.id_persona            = CONTRATO.id_titular '+
                                                                   'and MONEDA.cve_moneda             = CONTRATO.cve_moneda '+
                                                                   'and CR_PRODUCTO.cve_producto_cre  = CR_CONTRATO.cve_producto_cre '+
                                                                   'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                   'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
                                                                   'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                   'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
//                                                                   'and CR_HISTO_CRED.IMP_INTERES_DIA > 0 '+
                                                                 'union all '+
                                                                'select CONTRATO.ID_TITULAR             AS ID_TITULAR,       PERSONA.NOMBRE           AS NOMBRE,      MONEDA.CVE_MONEDA      AS CVE_MONEDA, '+
                                                                       'to_char(CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE, CRE_CONTRATO.ID_CONTRATO AS ID_CONTRATO, CRE_CREDITO.ID_CREDITO AS ID_CREDITO, '+
                                                                       'CRE_CREDITO.CVE_TASA_REFER      AS CVE_TASA_REFER,   CR_CON_ADEUDO_SDO.IMP_CAP_VIG AS IMP_CAP_VIG1, CRE_PROV_DIARIA.IMP_INTERES_DIA AS IMP_INTERES_DIA1, '+
                                                                       '0 AS IMP_CAP_VIG2,     0 AS IMP_INTERES_DIA2 '+
                                                                  'from CR_CON_ADEUDO_SDO, CRE_CREDITO, CRE_CONTRATO,    CONTRATO, '+
                                                                       'PERSONA,           MONEDA,      CRE_SUB_TIP_BCO, CRE_PROV_DIARIA '+
                                                                 'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%2:s'',''dd/mm/yyyy'') '+
                                                                   'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%3:s'',''dd/mm/yyyy'')  '+
//                                                                   'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG   > 0 '+
                                                                   'and CRE_CREDITO.id_credito          = CR_CON_ADEUDO_SDO.id_credito '+
                                                                   'and CRE_CONTRATO.id_contrato        = CRE_CREDITO.id_contrato '+
                                                                   'and CONTRATO.id_empresa             = 2 '+
                                                                   'and CONTRATO.cve_moneda           = %4:s  '+
                                                                   'and CONTRATO.id_contrato            = CRE_CONTRATO.id_contrato '+
                                                                   'and PERSONA.id_persona              = CONTRATO.id_titular '+
                                                                   'and MONEDA.cve_moneda               = CONTRATO.cve_moneda '+
                                                                   'and CRE_SUB_TIP_BCO.cve_sub_tip_bco = CRE_CONTRATO.cve_sub_tip_bco '+
                                                                   'and CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO not in (57) '+
                                                                   'and CRE_PROV_DIARIA.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                   'and CRE_PROV_DIARIA.f_provision     =CR_CON_ADEUDO_SDO.f_cierre '+
                                                                   'and CRE_PROV_DIARIA.IMP_INTERES_DIA > 0 '+
                                                                   ') where CVE_PRODUCTO_CRE not in (select consultaProductoCre.cve_producto_cre '+
                                                                                                        'from ( '+
                                                                                                                'select CONTRATO.ID_TITULAR          AS ID_TITULAR, '+
                                                                                                                       'CR_PRODUCTO.CVE_PRODUCTO_CRE AS CVE_PRODUCTO_CRE '+
                                                                                                                  'from CR_CON_ADEUDO_SDO, CR_CREDITO, CR_CONTRATO, CONTRATO, '+
                                                                                                                       'PERSONA,           MONEDA,     CR_PRODUCTO, CR_HISTO_CRED '+
                                                                                                                 'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%2:s'',''dd/mm/yyyy'') '+
                                                                                                                   'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%3:s'',''dd/mm/yyyy'') '+
//                                                                                                                   'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG > 0 '+
                                                                                                                   'and CR_CREDITO.id_credito         = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                                   'and CR_CONTRATO.id_contrato       = CR_CREDITO.id_contrato '+
                                                                                                                   'and CONTRATO.id_empresa           = 2 '+
                                                                                                                   'and CONTRATO.cve_moneda           = %4:s '+
                                                                                                                   'and CONTRATO.id_contrato          = CR_CONTRATO.id_contrato '+
                                                                                                                   'and PERSONA.id_persona            = CONTRATO.id_titular '+
                                                                                                                   'and MONEDA.cve_moneda             = CONTRATO.cve_moneda '+
                                                                                                                   'and CR_PRODUCTO.cve_producto_cre  = CR_CONTRATO.cve_producto_cre '+
                                                                                                                   'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                                   'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
                                                                                                                   'and CR_HISTO_CRED.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                                   'and CR_HISTO_CRED.f_cierre        = CR_CON_ADEUDO_SDO.f_cierre '+
//                                                                                                                   'and CR_HISTO_CRED.IMP_INTERES_DIA > 0 '+
                                                                                                              ') consultaProductoCr, '+
                                                                                                              '( '+
                                                                                                                'select CONTRATO.ID_TITULAR                      AS ID_TITULAR, '+
                                                                                                                       'to_char(CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE '+
                                                                                                                  'from CR_CON_ADEUDO_SDO, CRE_CREDITO, CRE_CONTRATO,    CONTRATO, '+
                                                                                                                       'PERSONA,           MONEDA,      CRE_SUB_TIP_BCO, CRE_PROV_DIARIA '+
                                                                                                                 'where CR_CON_ADEUDO_SDO.f_cierre  >= to_date(''%2:s'',''dd/mm/yyyy'') '+
                                                                                                                   'and CR_CON_ADEUDO_SDO.f_cierre  <= to_date(''%3:s'',''dd/mm/yyyy'')  '+
//                                                                                                                   'and CR_CON_ADEUDO_SDO.IMP_CAP_VIG   > 0 '+
                                                                                                                   'and CRE_CREDITO.id_credito          = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                                   'and CRE_CONTRATO.id_contrato        = CRE_CREDITO.id_contrato '+
                                                                                                                   'and CONTRATO.id_empresa             = 2 '+
                                                                                                                   'and CONTRATO.cve_moneda           = %4:s  '+
                                                                                                                   'and CONTRATO.id_contrato            = CRE_CONTRATO.id_contrato '+
                                                                                                                   'and PERSONA.id_persona              = CONTRATO.id_titular '+
                                                                                                                   'and MONEDA.cve_moneda               = CONTRATO.cve_moneda '+
                                                                                                                   'and CRE_SUB_TIP_BCO.cve_sub_tip_bco = CRE_CONTRATO.cve_sub_tip_bco '+
                                                                                                                   'and CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO not in (57) '+
                                                                                                                   'and CRE_PROV_DIARIA.id_credito      = CR_CON_ADEUDO_SDO.id_credito '+
                                                                                                                   'and CRE_PROV_DIARIA.f_provision     =CR_CON_ADEUDO_SDO.f_cierre '+
                                                                                                                   'and CRE_PROV_DIARIA.IMP_INTERES_DIA > 0 '+
                                                                                                              ') consultaProductoCre '+
                                                                                                          'where consultaProductoCr.id_titular  = consultaProductoCre.id_titular '+
                                                                                                         ') '+
                                         ') mesAnterior '+
                                         'where mesActual.id_titular  (+) = mesAnterior.id_titular  '+
                                           'and mesActual.cve_moneda  (+) = mesAnterior.cve_moneda  '+
                                           'and mesActual.id_contrato (+) = mesAnterior.id_contrato '+
                                           'and mesActual.id_credito  (+) = mesAnterior.id_credito  '+
                                        ') '+
//                                        'having ( SUM(IMP_CAP_VIG2) )     > 0 '+
//                                           'and ( SUM(IMP_INTERES_DIA2) ) > 0 '+
//                                           'and ( SUM(IMP_CAP_VIG1) )     > 0 '+
//                                           'and ( SUM(IMP_INTERES_DIA1) ) > 0 '+
//                                           'and ( SUM(ABS(IMP_INTERES_DIA1 - IMP_INTERES_DIA2))) > 0 '+
                                         'group by ID_TITULAR '+
                                         'order by VARIACION DESC, ID_TITULAR '+
                                        ') where rownum <= 10 ) '+
//                'having ( SUM(IMP_CAP_VIG2) )     > 0 '+
//                   'and ( SUM(IMP_INTERES_DIA2) ) > 0 '+
//                   'and ( SUM(IMP_CAP_VIG1) )     > 0 '+
//                   'and ( SUM(IMP_INTERES_DIA1) ) > 0 '+
//                   'and ( SUM(ABS(IMP_INTERES_DIA1 - IMP_INTERES_DIA2))) > 0 '+
                //'having ( SUM(ABS(IMP_INTERES_DIA1 - IMP_INTERES_DIA2))) > 0 '+
                 'group by ID_TITULAR,  NOMBRE,     CVE_MONEDA,    CVE_PRODUCTO_CRE, '+
                          'ID_CONTRATO, ID_CREDITO, CVE_TASA_REFER ';
}

  vgSqlReport3Order = 'order by cve_moneda, id_titular, variacion desc ';


implementation

constructor TCrVMParam.Create( AOwner : TComponent );
begin Inherited;
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrVMParam.Hlp';
      ShowMenuReporte:=True;
      IsCheckSecu:=False; // No Requiere Seguridades.
end;

Destructor TCrVMParam.Destroy;
begin inherited;
end;

procedure TCrVMParam.obtiene_fechas;
begin
// procedimiento para devolver la fecha del mes actual y anterior
end;

function ObtieneQueryCabecera(peExcelQuick : Boolean; peTipoReporte: Integer): String;
var
   vlSqlCabecera : String;
begin
// funcion que obtiene la cabecera del reporte a consultar en pantalla o excel
  Case peTipoReporte of
   0,1: begin
          if peExcelQuick then
             vlSqlCabecera := vgSqlReporteExcel
          else
             vlSqlCabecera := vgSqlReporteQuick;
        end;
   2  : begin
          if peExcelQuick then
             vlSqlCabecera := vgSqlReport3Excel
          else
             vlSqlCabecera := vgSqlReport3Quick;
        end;
  end;
  Result := vlSqlCabecera;
end;

function ObtieneQueryCuerpo(peTipoReporte: Integer): String;
var
   vlSqlCuerpo : String;
begin
// funcion que obtiene el cuerpo del reporte a consultar en pantalla o excel
  Case peTipoReporte of
   0,1: vlSqlCuerpo := vgSqlReporte;
   2  : vlSqlCuerpo := vgSqlReport3;
  end;
  Result := vlSqlCuerpo;
end;

function ObtieneOrder(peTipoReporte: Integer): String;
var
   vlSqlOrder : String;
begin
// funcion que obtiene el cuerpo del reporte a consultar en pantalla o excel
  Case peTipoReporte of
   0,1: vlSqlOrder := vgSqlReporteOrder;
   2  : vlSqlOrder := vgSqlReport3Order;
  end;
  Result := vlSqlOrder;
end;

function ObtieneNombreMes(Mes: Integer): String;
var
   vlMes : String;
begin
// función que convirte los meses enteros en string
   Case Mes of
     1:  vlMes:= 'ENERO';
     2:  vlMes:= 'FEBRERO';
     3:  vlMes:= 'MARZO';
     4:  vlMes:= 'ABRIL';
     5:  vlMes:= 'MAYO';
     6:  vlMes:= 'JUNIO';
     7:  vlMes:= 'JULIO';
     8:  vlMes:= 'AGOSTO';
     9:  vlMes:= 'SEPTIEMBRE';
     10: vlMes:= 'OCTUBRE';
     11: vlMes:= 'NOVIEMBRE';
     12: vlMes:= 'DICIEMBRE';
   end;
   Result := vlMes;
end;


function pExportaExcel( aDataSet : TQuery; aNombreReporte : String; var aProgresBar : TProgressBar; var AOwner : TComponent ) : Boolean;
begin
  try
    SaveDialogExcel := TSaveDialog.Create(nil);
    SaveDialogExcel.Filter := 'Libro de Microsoft Excel (*.xls)|*.xls';
    SaveDialogExcel.DefaultExt := 'xls';
    SaveDialogExcel.FileName := Trim(aNombreReporte)+'.xls';
    if SaveDialogExcel.Execute then
    begin
      if aProgresBar <> nil then
        ProgressBar := aProgresBar
      else
        ProgressBar := TProgressBar.Create(nil);

        vB_Interforma :=  fBuscaInterforma(TForm(AOwner));

       if fGenExcel(aNombreReporte, SaveDialogExcel.FileName,  TDataSet(aDataSet)) then
            ShellExecute(TForm(AOwner).Handle,nil,Pchar(SaveDialogExcel.FileName),'','',SW_Shownormal);
    end;
  finally
    SaveDialogExcel.Free;
    if aProgresBar = nil then
      ProgressBar.Free;
  end;

end;

function fGenExcel(aNombreReporte, aNombreArchivo: String; aDataSet: TDataSet): Boolean;
var
  vlExcelApp : OleVariant;
  vlCol, vlRow : Integer;
  vLetrRango : String;
  vTotalRow : String;
  vgMensage : String;
  vNumColumnas : Integer;
  vBPVisible : Boolean;
begin
  try
    try
      vBPVisible := ProgressBar.Visible;
      ProgressBar.Visible := True;
      Result := True;
      aDataSet.Last;
      aDataSet.First;
      vNumColumnas := aDataSet.FieldCount;
      Application.HandleMessage;
      vlExcelApp := CreateOleObject('Excel.Application');
      vlExcelApp.Workbooks.Add;
      vLExcelApp.Workbooks[1].WorkSheets[1].name:= Copy(aNombreReporte,1,30);

      // Coloca formato a los titulos de las columnas
      vLetrRango := GetLetraRango(vNumColumnas);
      vlExcelApp.Range['A1',vLetrRango+'1'].Font.FontStyle := 'Bold';
      vlExcelApp.Range['A1',vLetrRango+'1'].Font.Color := clWhite;
      vlExcelApp.Range['A1',vLetrRango+'1'].Borders[xlBottom].Weight := 2;
      vlExcelApp.Range['A1',vLetrRango+'1'].Borders[xlTop].Weight := 2;
      vlExcelApp.Range['A1',vLetrRango+'1'].Borders[xlLeft].Weight := 2;
      vlExcelApp.Range['A1',vLetrRango+'1'].Borders[xlRight].Weight := 2;
      vlExcelApp.Range['A1',vLetrRango+'1'].Interior.Color := clNavy;
      vlExcelApp.Range['A1',vLetrRango+'1'].Font.Size := 9;

      // coloca encabezados.
      for vlCol := 0 To (vNumColumnas-1) Do         //tmp
      begin

          vlExcelApp.Cells[1, vlCol+1 ].Value:= aDataSet.Fields[vlCol].DisplayLabel;

      end;
      ProgressBar.Position := 0;
      aDataSet.DisableControls;
      ProgressBar.Max := aDataSet.RecordCount;
      ProgressBar.Visible := True;
      if vB_Interforma then
        InterFormaParent.CanCloseForm := False;

      vlRow := 1;
      // Coloca formato Datos ------------------------------
      vTotalRow := IntToStr(aDataSet.RecordCount+1);
      vLetrRango := GetLetraRango(vNumColumnas);
      vlExcelApp.Range['A1',vLetrRango+vTotalRow].Borders[xlBottom].Weight := 1;
      vlExcelApp.Range['A1',vLetrRango+vTotalRow].Borders[xlTop].Weight := 1;
      vlExcelApp.Range['A1',vLetrRango+vTotalRow].Borders[xlLeft].Weight := 1;
      vlExcelApp.Range['A1',vLetrRango+vTotalRow].Borders[xlRight].Weight := 1;
      vlExcelApp.Range['A1',vLetrRango+vTotalRow].Font.Size := 8;
      {------------------------------------------------------}
       // Copia la informacion al nuevo libro de Excel
      aDataSet.First;
      While not  aDataSet.eof do
      begin
        for vlCol := 0 To (vNumColumnas - 1) Do
        begin
          if (adataset.FieldDefs.Items[vlCol].DataType = ftDateTime) then
              vlExcelApp.Cells[vlRow + 1, vlCol + 1].Value := ''''+aDataSet.Fields.Fields[vlCol].AsString
          else vlExcelApp.Cells[vlRow + 1, vlCol + 1].Value := ''''+aDataSet.Fields.Fields[vlCol].AsString;

          Application.ProcessMessages;
        End;
          ProgressBar.Position := ProgressBar.Position + 1 ;
          aDataSet.Next;
          vlRow:= vlRow + 1;
      end;

    except
      on E: Exception do
      begin
        MessageDlg(E.Message, mtWarning, [mbOK], 0);
        Result := False;
        if vB_Interforma then
          InterFormaParent.CanCloseForm := True;
      end;
    end;
  finally
    try
      try
        vlExcelApp.DisplayAlerts := False;
        vlExcelApp.ActiveWorkBook.SaveAs(aNombreArchivo);
        vlExcelApp.DisplayAlerts := True;
      except
        on E: Exception do
        begin
          vgMensage := 'Error al guardar el archivo: ['+E.Message+']';
          ShowMessage(vgMensage);
          Result := False;
          if vB_Interforma then
            InterFormaParent.CanCloseForm := True;
        end;
      end;
    finally
        CloseExcelFile(vlExcelApp);
        Application.ProcessMessages;
        ProgressBar.Position := 0;
        if not vBPVisible then
          ProgressBar.Visible := False;
        aDataSet.EnableControls;
        if Result then
        begin
          vgMensage := 'Archivo generado';
          MessageDlg(vgMensage,mtInformation,[mbOk],0);

        end;

        ProgressBar.Visible := False;
        if vB_Interforma then
          InterFormaParent.CanCloseForm := True;

    end;
  end;

end;

function fBuscaInterforma( aForm : TForm ) : Boolean;
var
  i : Integer;
begin
  Result := False;
  for i := 0 to aForm.ComponentCount do
    if (aForm.Components[i] is TInterForma) then
    begin
      InterFormaParent := TInterForma(aForm.Components[i]);
      Result := True;
      Exit;
    end;


end;

function GetLetraRango(NumCampos: Integer): String;
const
  elementos = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
begin
  if NumCampos < 27 then
    Result:= elementos[NumCampos]
  else
  begin
    Result:=elementos[(NumCampos - 1) div 26];
    Result:=Result + elementos[((NumCampos - 1) mod 26)+1];
  end;
end;

end.
