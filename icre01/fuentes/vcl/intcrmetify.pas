// Sistema         : Clase de IntCrMetify
// Fecha de Inicio : SEP 2006
// Función forma   : Clase de IntCrMetify
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Alicia Maya
Unit IntCrMetify;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, IntMensaje, ComObj,IntXls, IntCreConDri;



Type
 TCrMetify= class; 

  TWCrMetify=Class(TForm)
    InterForma1             : TInterForma;
    Panel1: TPanel;
    sbFechaArch: TSpeedButton;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    qDatos1: TQuery;
    qDatos2: TQuery;
    Label4: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    Label1: TLabel;
    EDFecha: TEdit;
    dtFecha: TInterDateTimePicker;
    edFin: TEdit;
    dtFin: TInterDateTimePicker;
    qDatos3: TQuery;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbFechaArchClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrMetify;
    vgnRowExcel : Integer;
    vgB_SALIDA_EXCEL : Boolean;
    vgExcelApp : OleVariant;
    vgFileName : String;

    procedure  GeneraVolumen(iTipo:Integer);
    function   SQLDisponer:String;
    function   SQLMonitorear:String;
    function   SQLRecuperar:String;
    function   SQLIngresos:String;
    procedure  GeneraIngresos;
    Procedure  GeneraArchivo;
    function   ObtenDriver(sIdProm:String;sTipo:Integer):String;

end;
 TCrMetify= class(TInterFrame)
      private
      protected
      public
        ParamCre  : TParamCre;
        Driver    : TCreConDri;
        { Public declarations }
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;


implementation
Uses IntMsgError;


{$R *.DFM}


constructor TCrMetify.Create( AOwner : TComponent );
begin Inherited;
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrMetify.Hlp';
      ShowMenuReporte:=True;

      Driver:=TCreConDri.Create(Self);
      Driver.MasterSource:=Self;
end;

Destructor TCrMetify.Destroy;
begin inherited;
end;


function TCrMetify.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMetify;
begin
   W:=TWCrMetify.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrMetify.InternalBusca:Boolean;
begin //
end;

function TCrMetify.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA IntCrTAS********************)
(*                                                                               *)
(*  FORMA DE IntCrMetify                                                         *)
(*                                                                               *)
(***********************************************FORMA IntCrTAS********************)

Function TWCrMetify.SQLDisponer:String;
var VLSQL  : String;
begin
//PARA DISPOSICIONES
     VLSQL := 
' SELECT COUNT(*) AS VOLUMEN, '+
'        MERC_OBJ_DET, '+
'        DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'         APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) AS CLIENTE, '+
'        PROMOTOR_ADMIN,ID_OLTP_PROM_ADMIN '+
' FROM CR_CREDITO cr, CONTRATO c, PERSONA p, PERSONA_FISICA PF, PERSONA_MORAL PM, '+
'      (select BB.CREDITO, MERC_OBJ_DET, PROMOTOR_ADMIN, ID_OLTP_PROM_ADMIN '+
'       from (SELECT * FROM DM_CR_FAC_Credito@DWHC  '+
'             WHERE ID_ANIO_MES = (SELECT ID_ANIO_MES  FROM   DM_CR_DIM_Mes@dwhc  '+
'                                  WHERE  ANIO  = TO_CHAR(TO_DATE('''+edFin.Text+'''),''YYYY'') '+
'                                  AND    NUM_MES  = TO_CHAR(TO_DATE('''+edFin.Text+'''),''MM'') )) aa, '+ 
'            (SELECT * FROM DM_CR_DIM_Credito@DWHC) bb  '+
'        where aa.ID_CREDITO = bb.ID_CREDITO  '+
'        AND   ORIGEN_INFO=''ICRE'') ab '+
' WHERE cr.ID_CREDITO = ab.credito '+
' AND cr.F_INICIO BETWEEN '''+EDFecha.Text+'''AND '''+edFin.Text+''' '+
' AND c.ID_CONTRATO = cr.ID_CONTRATO '+
' AND c.ID_TITULAR = p.ID_PERSONA  '+
' AND (PF.ID_PERSONA (+)= P.ID_PERSONA AND PM.ID_PERSONA (+)= P.ID_PERSONA) '+
' GROUP BY MERC_OBJ_DET, '+
'          DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'           APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) , '+
'          PROMOTOR_ADMIN, '+
'          ID_OLTP_PROM_ADMIN '+
' UNION ALL '+
' SELECT COUNT(*) AS VOLUMEN,  '+
'        MERC_OBJ_DET, '+
'        DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'         APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) AS CLIENTE, '+
'        PROMOTOR_ADMIN,ID_OLTP_PROM_ADMIN '+
' FROM CRE_CREDITO cr, CONTRATO c, PERSONA p, PERSONA_FISICA PF, PERSONA_MORAL PM, '+
'      (select BB.CREDITO, MERC_OBJ_DET, PROMOTOR_ADMIN, ID_OLTP_PROM_ADMIN '+
'       from (SELECT * FROM DM_CR_FAC_Credito@DWHC  '+ 
'             WHERE ID_ANIO_MES = (SELECT ID_ANIO_MES  FROM   DM_CR_DIM_Mes@dwhc  '+
'                                  WHERE  ANIO  = TO_CHAR(TO_DATE('''+edFin.Text+'''),''YYYY'') '+
'                                  AND    NUM_MES  = TO_CHAR(TO_DATE('''+edFin.Text+'''),''MM'') )) aa, '+ 
'            (SELECT * FROM DM_CR_DIM_Credito@DWHC) bb  '+
'        where aa.ID_CREDITO = bb.ID_CREDITO  '+
'        AND   ORIGEN_INFO=''INTERCREDITOS'') AB '+
' WHERE CR.ID_CREDITO = AB.CREDITO '+
' AND F_VALOR_CRED BETWEEN '''+EDFecha.Text+'''AND '''+edFin.Text+''' '+
' AND C.ID_CONTRATO = CR.ID_CONTRATO '+
' AND C.ID_TITULAR = P.ID_PERSONA  '+
' AND (PF.ID_PERSONA (+)= P.ID_PERSONA AND PM.ID_PERSONA (+)= P.ID_PERSONA) '+
' GROUP BY MERC_OBJ_DET, '+
'          DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'           APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) , '+
'          PROMOTOR_ADMIN, '+
'          ID_OLTP_PROM_ADMIN ';
     SQLDisponer:=VLSQL;
end;


procedure  TWCrMetify.GeneraVolumen(iTipo:Integer);
begin
   qDatos1.Close; 
   case iTipo of
     1: qDatos1.SQL.Text:=SQLDisponer;        
     2: qDatos1.SQL.Text:=SQLMonitorear;
     3: qDatos1.SQL.Text:=SQLRecuperar;
   end;
   qDatos1.Open;
   if qDatos1<> nil then
   begin
      qDatos1.First;
      while not qDatos1.Eof do
      begin
        Inc(vgnRowExcel);
        vgExcelApp.Workbooks[1].WorkSheets[1].Cells[vgnRowExcel,ColumnXlS('A')].Value:=ObtenDriver(qDatos1.FieldByName('ID_OLTP_PROM_ADMIN').AsString,iTipo);
        vgExcelApp.Workbooks[1].WorkSheets[1].Cells[vgnRowExcel,ColumnXlS('B')].Value:=qDatos1.FieldByName('MERC_OBJ_DET').AsString;
        vgExcelApp.Workbooks[1].WorkSheets[1].Cells[vgnRowExcel,ColumnXlS('C')].Value:=qDatos1.FieldByName('CLIENTE').AsString;
        vgExcelApp.Workbooks[1].WorkSheets[1].Cells[vgnRowExcel,ColumnXlS('D')].Value:=qDatos1.FieldByName('PROMOTOR_ADMIN').AsString;
        vgExcelApp.Workbooks[1].WorkSheets[1].Cells[vgnRowExcel,ColumnXlS('E')].Value:=qDatos1.FieldByName('VOLUMEN').AsString;
        qDatos1.Next;
      end;
   end;
   qDatos1.Close;
end;

Function  TWCrMetify.SQLMonitorear:String;
var VLSQL : String;
begin
     VLSQL := 
' SELECT sum(Volumen) AS VOLUMEN, '+
'        MERC_OBJ_DET, '+
'        DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'         APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) AS CLIENTE, '+
'        PROMOTOR_ADMIN,ID_OLTP_PROM_ADMIN '+
' FROM CR_CREDITO cr, CONTRATO c, PERSONA p, PERSONA_FISICA PF, PERSONA_MORAL PM, '+
'      (select BB.CREDITO, MERC_OBJ_DET, PROMOTOR_ADMIN, ID_OLTP_PROM_ADMIN, '+
'              NVL((select 1 from dual where (Imp_Sdo_K_Vig_VP + Imp_Int_Corte_VP) > 0),0) + '+
'              NVL((select 1 from dual where (Imp_Sdo_K_Imp_VP + Imp_Sdo_IO_Imp_VP)> 0),0) + '+
'              NVL((select 1 from dual where (Imp_Sdo_K_Ven_VP + Imp_Sdo_IO_Ven_VP)> 0),0) as Volumen '+
'       from  DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '+
'       WHERE aa.ID_ANIO_MES =(SELECT ID_ANIO_MES '+
'                              FROM   DM_CR_DIM_Mes@dwhc '+
'                              WHERE  ANIO   = TO_CHAR(TO_DATE('''+edFin.Text+'''),''YYYY'') '+
'                              AND    NUM_MES= TO_CHAR(TO_DATE('''+edFin.Text+'''),''MM'')) '+
'        AND  aa.ID_CREDITO = bb.ID_CREDITO '+
'        AND  ORIGEN_INFO=''ICRE'') ab '+
' WHERE cr.ID_CREDITO = ab.credito '+
' AND cr.F_INICIO BETWEEN '''+EDFecha.Text+'''AND '''+edFin.Text+''' '+
' AND c.ID_CONTRATO = cr.ID_CONTRATO '+
' AND c.ID_TITULAR = p.ID_PERSONA  '+
' AND (PF.ID_PERSONA (+)= P.ID_PERSONA AND PM.ID_PERSONA (+)= P.ID_PERSONA) '+
' GROUP BY MERC_OBJ_DET, '+
'          DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'           APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) , '+
'          PROMOTOR_ADMIN, '+
'          ID_OLTP_PROM_ADMIN '+
' UNION ALL '+
' SELECT sum(Volumen) AS VOLUMEN, '+
'        MERC_OBJ_DET, '+
'        DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'         APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) AS CLIENTE, '+
'        PROMOTOR_ADMIN,ID_OLTP_PROM_ADMIN '+
' FROM CRE_CREDITO cr, CONTRATO c, PERSONA p, PERSONA_FISICA PF, PERSONA_MORAL PM, '+
'      (select BB.CREDITO, MERC_OBJ_DET, PROMOTOR_ADMIN, ID_OLTP_PROM_ADMIN, '+
'              NVL((select 1 from dual where (Imp_Sdo_K_Vig_VP + Imp_Int_Corte_VP) > 0),0) + '+
'              NVL((select 1 from dual where (Imp_Sdo_K_Imp_VP + Imp_Sdo_IO_Imp_VP)> 0),0) + '+
'              NVL((select 1 from dual where (Imp_Sdo_K_Ven_VP + Imp_Sdo_IO_Ven_VP)> 0),0) as Volumen '+
'       from  DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '+
'       WHERE aa.ID_ANIO_MES =(SELECT ID_ANIO_MES '+
'                              FROM   DM_CR_DIM_Mes@dwhc '+
'                              WHERE  ANIO   = TO_CHAR(TO_DATE('''+edFin.Text+'''),''YYYY'') '+
'                              AND    NUM_MES= TO_CHAR(TO_DATE('''+edFin.Text+'''),''MM'')) '+
'        AND  aa.ID_CREDITO = bb.ID_CREDITO '+
'        AND  ORIGEN_INFO=''INTERCREDITOS'') AB '+
' WHERE CR.ID_CREDITO = AB.CREDITO '+
' AND F_VALOR_CRED BETWEEN '''+EDFecha.Text+'''AND '''+edFin.Text+''' '+ 
' AND C.ID_CONTRATO = CR.ID_CONTRATO '+
' AND C.ID_TITULAR = P.ID_PERSONA  '+
' AND (PF.ID_PERSONA (+)= P.ID_PERSONA AND PM.ID_PERSONA (+)= P.ID_PERSONA) '+
' GROUP BY MERC_OBJ_DET, '+
'          DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'           APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA), '+
'          PROMOTOR_ADMIN, '+
'          ID_OLTP_PROM_ADMIN ';
     SQLMonitorear:=VLSQL;
end;


function  TWCrMetify.SQLRecuperar;
var VLSQL : String;
begin
     VLSQL := 
' SELECT COUNT(*) AS VOLUMEN, '+
'        MERC_OBJ_DET, '+
'        DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'         APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) AS CLIENTE, '+
'        PROMOTOR_ADMIN,ID_OLTP_PROM_ADMIN '+
' FROM CR_TRANSACCION cr, CONTRATO c, PERSONA p, PERSONA_FISICA PF, PERSONA_MORAL PM, '+
'     (select BB.CREDITO, MERC_OBJ_DET, PROMOTOR_ADMIN, ID_OLTP_PROM_ADMIN '+
'       from  DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '+
'       WHERE aa.ID_ANIO_MES =(SELECT ID_ANIO_MES '+
'                              FROM   DM_CR_DIM_Mes@dwhc '+
'                              WHERE  ANIO  = TO_CHAR(TO_DATE('''+edFin.Text+'''),''YYYY'') '+
'                              AND    NUM_MES  = TO_CHAR(TO_DATE('''+edFin.Text+'''),''MM'') ) '+
'        AND  bb.ID_CREDITO = aa.ID_CREDITO '+
'        AND  ORIGEN_INFO=''ICRE'') ab '+
' WHERE cr.ID_CREDITO = ab.credito '+
' AND cr.F_OPERACION BETWEEN '''+EDFecha.Text+'''AND '''+edFin.Text+''' '+ 
' AND c.ID_CONTRATO = cr.ID_CONTRATO '+
' AND c.ID_TITULAR = p.ID_PERSONA  '+
' AND (PF.ID_PERSONA (+)= P.ID_PERSONA AND PM.ID_PERSONA (+)= P.ID_PERSONA) '+
' GROUP BY MERC_OBJ_DET, '+
'          DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'           APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) , '+
'          PROMOTOR_ADMIN, '+
'          ID_OLTP_PROM_ADMIN '+
' UNION ALL '+
' SELECT COUNT(*) AS VOLUMEN, '+
'        MERC_OBJ_DET, '+
'        DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'         APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) AS CLIENTE, '+
'        PROMOTOR_ADMIN,ID_OLTP_PROM_ADMIN '+
' FROM CRE_TRANSACCION cr, CONTRATO c, PERSONA p, PERSONA_FISICA PF, PERSONA_MORAL PM, '+
'      (select BB.CREDITO, MERC_OBJ_DET, PROMOTOR_ADMIN, ID_OLTP_PROM_ADMIN '+
'       from  DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '+
'       WHERE aa.ID_ANIO_MES =(SELECT ID_ANIO_MES '+
'                              FROM   DM_CR_DIM_Mes@dwhc '+
'                              WHERE  ANIO  = TO_CHAR(TO_DATE('''+edFin.Text+'''),''YYYY'') '+
'                              AND    NUM_MES  = TO_CHAR(TO_DATE('''+edFin.Text+'''),''MM'') ) '+
'        AND  aa.ID_CREDITO = bb.ID_CREDITO '+
'        AND  ORIGEN_INFO=''INTERCREDITOS'') AB '+
' WHERE CR.ID_CREDITO = AB.CREDITO '+
' AND CR.F_APLICACION BETWEEN '''+EDFecha.Text+'''AND '''+edFin.Text+''' '+ 
' AND C.ID_CONTRATO = CR.ID_CONTRATO '+
' AND C.ID_TITULAR = P.ID_PERSONA  '+
' AND (PF.ID_PERSONA (+)= P.ID_PERSONA AND PM.ID_PERSONA (+)= P.ID_PERSONA) '+
' GROUP BY MERC_OBJ_DET, '+
'          DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'           APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) , '+
'          PROMOTOR_ADMIN, '+
'          ID_OLTP_PROM_ADMIN ';
     SQLRecuperar:=VLSQL;
end;

function  TWCrMetify.SQLIngresos:String;
var VLSQL:String;
begin
     VLSQL := 
//MARGEN ICRE
' SELECT COUNT(*) AS VOLUMEN, SUM(IMP_MARGEN_VP) AS IMPORTE, MERC_OBJ_DET, PROMOTOR_ADMIN, '+
'        DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'         APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) AS CLIENTE '+
' FROM CR_CREDITO cr, CONTRATO c, PERSONA p, PERSONA_FISICA PF, PERSONA_MORAL PM, '+
'      (select BB.CREDITO, MERC_OBJ_DET||''__MARGEN'' AS MERC_OBJ_DET, PROMOTOR_ADMIN, ID_OLTP_PROM_ADMIN, aa.IMP_MARGEN_VP '+
'       from DM_CR_FAC_Credito@DWHC  aa,  DM_CR_DIM_Credito@DWHC bb '+
'       WHERE aa.ID_ANIO_MES = (SELECT ID_ANIO_MES  FROM   DM_CR_DIM_Mes@dwhc  '+
'                               WHERE  ANIO  = TO_CHAR(TO_DATE('''+edFin.Text+'''),''YYYY'') '+
'                               AND    NUM_MES  = TO_CHAR(TO_DATE('''+edFin.Text+'''),''MM'')    ) '+
'       AND aa.ID_CREDITO = bb.ID_CREDITO      AND bb.ORIGEN_INFO=''ICRE''  AND    IMP_MARGEN_VP <> 0 ) ab '+
' WHERE cr.ID_CREDITO = ab.credito '+
//' AND cr.F_INICIO BETWEEN '''+EDFecha.Text+'''AND '''+edFin.Text+''' '+ 
//' AND cr.F_INICIO <= TO_DATE('''+EDFecha.Text+''') '+
//' AND (F_VENCIMIENTO IS NULL OR F_VENCIMIENTO >= TO_DATE('''+edFin.Text+''') ) '+
' AND CR.SIT_CREDITO <> ''CA'' '+
' AND c.ID_CONTRATO = cr.ID_CONTRATO '+
' AND c.ID_TITULAR = p.ID_PERSONA  '+
' AND (PF.ID_PERSONA (+)= P.ID_PERSONA AND PM.ID_PERSONA (+)= P.ID_PERSONA) '+
' GROUP BY MERC_OBJ_DET,PROMOTOR_ADMIN, '+
'          DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'           APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) '+
//margen INTERCREDITOS
' UNION ALL '+
' SELECT COUNT(*) AS VOLUMEN,  SUM(IMP_MARGEN_VP) AS IMPORTE,  MERC_OBJ_DET, PROMOTOR_ADMIN, '+
'        DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'         APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) AS CLIENTE '+
' FROM CRE_CREDITO cr, CONTRATO c, PERSONA p, PERSONA_FISICA PF, PERSONA_MORAL PM, '+
'      (select BB.CREDITO, MERC_OBJ_DET||''__MARGEN'' AS MERC_OBJ_DET, PROMOTOR_ADMIN, ID_OLTP_PROM_ADMIN, aa.IMP_MARGEN_VP '+
'       from DM_CR_FAC_Credito@DWHC  aa,  DM_CR_DIM_Credito@DWHC bb '+
'       WHERE aa.ID_ANIO_MES = (SELECT ID_ANIO_MES  FROM   DM_CR_DIM_Mes@dwhc  '+
'                               WHERE  ANIO  = TO_CHAR(TO_DATE('''+edFin.Text+'''),''YYYY'') '+
'                               AND    NUM_MES  = TO_CHAR(TO_DATE('''+edFin.Text+'''),''MM'') ) '+           
'       AND aa.ID_CREDITO = bb.ID_CREDITO      AND bb.ORIGEN_INFO=''INTERCREDITOS'' AND    IMP_MARGEN_VP <> 0 ) ab '+
' WHERE cr.ID_CREDITO = ab.credito '+
//' AND cr.F_VALOR_CRED BETWEEN '''+EDFecha.Text+'''AND '''+edFin.Text+''' '+ 
//' AND cr.F_VALOR_CRED <=TO_DATE('''+EDFecha.Text+''') '+
//' AND (F_VALOR_CRED + DIAS_PLAZO)  >= TO_DATE('''+edFin.Text+''') '+
' AND CR.SIT_CREDITO <> ''CA'' '+
' AND c.ID_CONTRATO = cr.ID_CONTRATO '+
' AND c.ID_TITULAR = p.ID_PERSONA  '+
' AND (PF.ID_PERSONA (+)= P.ID_PERSONA AND PM.ID_PERSONA (+)= P.ID_PERSONA) '+
' GROUP BY MERC_OBJ_DET,PROMOTOR_ADMIN, '+
'          DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'           APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) '+
//COMISION ICRE
' UNION ALL '+
' SELECT 1 AS VOLUMEN,  SUM(IMP_COMISION_VP) AS IMPORTE,  MERC_OBJ_DET, PROMOTOR_ADMIN, '+
'        DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'         APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) AS CLIENTE '+
' FROM CR_CREDITO cr, CONTRATO c, PERSONA p, PERSONA_FISICA PF, PERSONA_MORAL PM, '+
'      (select BB.CREDITO, MERC_OBJ_DET||''__COMISION'' AS MERC_OBJ_DET, PROMOTOR_ADMIN, ID_OLTP_PROM_ADMIN, AA.IMP_COMISION_VP '+
'       from  DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '+
'       WHERE aa.ID_ANIO_MES =(SELECT ID_ANIO_MES  FROM   DM_CR_DIM_Mes@dwhc  '+
'                              WHERE  ANIO  = TO_CHAR(TO_DATE('''+edFin.Text+'''),''YYYY'') '+
'                              AND    NUM_MES  = TO_CHAR(TO_DATE('''+edFin.Text+'''),''MM'') ) '+
'        AND  aa.ID_CREDITO = bb.ID_CREDITO '+
'        AND  ORIGEN_INFO=''ICRE'' AND    IMP_COMISION_VP <> 0 ) AB '+
' WHERE cr.ID_CREDITO = ab.credito '+
//' AND cr.F_INICIO BETWEEN '''+EDFecha.Text+'''AND '''+edFin.Text+''' '+ 
//' AND cr.F_INICIO <= TO_DATE('''+EDFecha.Text+''') '+
//' AND (F_VENCIMIENTO IS NULL OR F_VENCIMIENTO >= TO_DATE('''+edFin.Text+''') ) '+
' AND CR.SIT_CREDITO <> ''CA'' '+
' AND C.ID_CONTRATO = CR.ID_CONTRATO '+
' AND C.ID_TITULAR = P.ID_PERSONA  '+
' AND (PF.ID_PERSONA (+)= P.ID_PERSONA AND PM.ID_PERSONA (+)= P.ID_PERSONA) '+
' GROUP BY MERC_OBJ_DET,PROMOTOR_ADMIN, '+
'          DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'           APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) '+
//COMISION INTERCREDITOS
' UNION ALL '+
' SELECT 1 AS VOLUMEN,  SUM(IMP_COMISION_VP) AS IMPORTE,  MERC_OBJ_DET, PROMOTOR_ADMIN, '+
'        DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'         APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) AS CLIENTE '+
' FROM CRE_CREDITO cr, CONTRATO c, PERSONA p, PERSONA_FISICA PF, PERSONA_MORAL PM, '+
'      (select BB.CREDITO, MERC_OBJ_DET||''__COMISION'' AS MERC_OBJ_DET, PROMOTOR_ADMIN, ID_OLTP_PROM_ADMIN, AA.IMP_COMISION_VP '+
'       from  DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '+
'       WHERE aa.ID_ANIO_MES =(SELECT ID_ANIO_MES  FROM   DM_CR_DIM_Mes@dwhc  '+ 
'                              WHERE  ANIO  = TO_CHAR(TO_DATE('''+edFin.Text+'''),''YYYY'') '+
'                              AND    NUM_MES  = TO_CHAR(TO_DATE('''+edFin.Text+'''),''MM'') ) '+
'        AND  aa.ID_CREDITO = bb.ID_CREDITO '+
'        AND  ORIGEN_INFO=''INTERCREDITOS'' AND    IMP_COMISION_VP <> 0 ) AB '+
' WHERE cr.ID_CREDITO = ab.credito '+
//' AND cr.F_VALOR_CRED BETWEEN '''+EDFecha.Text+'''AND '''+edFin.Text+''' '+ 
//' AND cr.F_VALOR_CRED <=TO_DATE('''+EDFecha.Text+''') '+
//' AND (F_VALOR_CRED + DIAS_PLAZO)  >= TO_DATE('''+edFin.Text+''') '+
' AND CR.SIT_CREDITO <> ''CA'' '+
' AND C.ID_CONTRATO = CR.ID_CONTRATO '+
' AND C.ID_TITULAR = P.ID_PERSONA  '+
' AND (PF.ID_PERSONA (+)= P.ID_PERSONA AND PM.ID_PERSONA (+)= P.ID_PERSONA) '+
' GROUP BY MERC_OBJ_DET,PROMOTOR_ADMIN, '+
'          DECODE(P.CVE_PER_JURIDICA,''PM'',NOM_RAZON_SOCIAL, '+
'           APELLIDO_PATERNO||DECODE(''<<''||TRIM(APELLIDO_MATERNO),''<<'','' '','' ''||TRIM(APELLIDO_MATERNO)||'' '')||NOMBRE_PERSONA) ';
     SQLIngresos:=VLSQL;
end;

Procedure TWCrMetify.GeneraIngresos;
var VLSQL : String;
begin
   qDatos1.Close; 
   qDatos1.SQL.Text:=SQLIngresos;

   qDatos1.Open;
   if qDatos1<> nil then
   begin
      qDatos1.First;
      while not qDatos1.Eof do
      begin
        Inc(vgnRowExcel);
        vgExcelApp.Workbooks[1].WorkSheets[2].Cells[vgnRowExcel,ColumnXlS('A')].Value:=qDatos1.FieldByName('MERC_OBJ_DET').AsString;
        vgExcelApp.Workbooks[1].WorkSheets[2].Cells[vgnRowExcel,ColumnXlS('B')].Value:=qDatos1.FieldByName('CLIENTE').AsString;
        vgExcelApp.Workbooks[1].WorkSheets[2].Cells[vgnRowExcel,ColumnXlS('C')].Value:=qDatos1.FieldByName('PROMOTOR_ADMIN').AsString;
        vgExcelApp.Workbooks[1].WorkSheets[2].Cells[vgnRowExcel,ColumnXlS('D')].Value:=qDatos1.FieldByName('IMPORTE').AsString;
        vgExcelApp.Workbooks[1].WorkSheets[2].Cells[vgnRowExcel,ColumnXlS('E')].Value:=qDatos1.FieldByName('VOLUMEN').AsString;
        qDatos1.Next;
      end;
   end;
   qDatos1.Close;
end;


Procedure TWCrMetify.GeneraArchivo;
begin
//asigna valores iniciales
   vgFileName := edNbrArch.Text;
   vgExcelApp := CreateOleObject('Excel.Application');
   vgExcelApp.Workbooks.Add;

//HOJA 1
   vgnRowExcel := 1;
   vgExcelApp.Workbooks[1].WorkSheets[1].Name := 'V6_COSTD_VOL';
   vgExcelApp.Workbooks[1].WorkSheets[1].Cells[vgnRowExcel,ColumnXlS('A' )].Value := ':V6-COSTD_VOL:';
   vgExcelApp.Workbooks[1].WorkSheets[1].Cells[vgnRowExcel,ColumnXlS('B' )].Value := FormatDateTime('yyyy.mm',StrToDateTime(edFin.Text));
   GeneraVolumen(1); //Disponer
   GeneraVolumen(2); //Monitorear
   GeneraVolumen(3); //Recuperar

//HOJA 2
   vgnRowExcel := 1;
   vgExcelApp.Workbooks[1].WorkSheets[2].Name := 'REVENUE';
   vgExcelApp.Workbooks[1].WorkSheets[2].Cells[vgnRowExcel,ColumnXlS('A' )].Value := ':V6-REVENUE:';
   vgExcelApp.Workbooks[1].WorkSheets[2].Cells[vgnRowExcel,ColumnXlS('B' )].Value := FormatDateTime('yyyy.mm',StrToDateTime(edFin.Text));
   GeneraIngresos;
   
//cierra archivo excel
   vgExcelApp.ActiveWorkBook.SaveAs(edNbrArch.Text);
   CloseExcelFile(vgExcelApp);
end;

      
procedure TWCrMetify.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   qDatos1.SessionName :=objeto.SessionName;
   qDatos1.DatabaseName:=objeto.DatabaseName;
   qDatos2.SessionName :=objeto.SessionName;
   qDatos2.DatabaseName:=objeto.DatabaseName;
   qDatos3.SessionName :=objeto.SessionName;
   qDatos3.DatabaseName:=objeto.DatabaseName;
end;

procedure TWCrMetify.FormDestroy(Sender: TObject);
begin   //Objeto
end;

procedure TWCrMetify.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMetify.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrMetify.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWIntCrTAS.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrMetify.sbFechaArchClick(Sender: TObject);
begin 
  if (Trim(edNbrArch.Text) = '') or (Trim(EDFecha.Text) = '') or(Trim(edFin.Text) = '') then
     EXECUTE_MUESTRAMENSAJE('Debe proporcionar el nombre del archivo y el periodo a generar. Verifique los datos.')
  else
  begin
     GeneraArchivo;
     EXECUTE_MUESTRAMENSAJE('Archivo Generado: '+edNbrArch.Text);
  end;
end;

procedure TWCrMetify.sbExcelClick(Sender: TObject);
var sExt:String;
begin
  If SaveDialog1.Execute Then Begin
      sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
      If  UpperCase(sExt)= '.XLS' Then
         edNbrArch.Text := SaveDialog1.FileName
      Else
         edNbrArch.Text := SaveDialog1.FileName + '.XLS';
  End Else
    edNbrArch.Text := '';
end;

function TWCrMetify.ObtenDriver(sIdProm:String;sTipo:Integer):String;
var sDriver, sCentro:STring; bBandera:Boolean;
begin//
   sDriver:='';
   bBandera:=False;
   qDatos2.Close;
   qDatos2.SQL.Text:=
     ' select 1 AS GRUPO, ID_CENT_COSTO_A from centro_costo '+
     ' where  ID_CENT_COSTO='+sIdProm +
     ' UNION ALL '+
     ' SELECT 2 AS GRUPO, ID_CENT_COSTO_A FROM centro_costo '+
     ' where  ID_CENT_COSTO=(select ID_CENT_COSTO_A from centro_costo where  ID_CENT_COSTO='+sIdProm+') '+
     ' UNION ALL '+
     ' SELECT 3 AS GRUPO, ID_CENT_COSTO_A FROM centro_costo '+
     ' where  ID_CENT_COSTO=(select ID_CENT_COSTO_A from centro_costo where  ID_CENT_COSTO=(select ID_CENT_COSTO_A from centro_costo where  ID_CENT_COSTO='+sIdProm+')) '+
     ' ORDER BY GRUPO ';
   qDatos2.Open;
   if qDatos2.RecordCount>0 then
   begin
     qDatos2.First;
     while (not qDatos2.EoF) and (not(bBandera)) do
     begin
       sCentro:=qDatos2.FieldByName('ID_CENT_COSTO_A').AsString;
       if qDatos2.FieldByName('GRUPO').AsInteger=1 THEN  sDriver:='Centro de Costos No Configurado ['+sCentro+']';
       if Objeto.Driver.Findkey([sCentro]) then
       begin
          case sTipo of
            1:sDriver:=Objeto.Driver.TX_DISPONER.AsString;
            2:sDriver:=Objeto.Driver.TX_MONITOREAR.AsString;
            3:sDriver:=Objeto.Driver.TX_RECUPERAR.AsString;
          end;
          bBandera:=True;
       end
       else
         qDatos2.Next;
     end;
   end
   else
     sDriver:='El promotor no tiene Centro de Costos '+sIdProm;
   ObtenDriver:=sDriver;
end;

end.



