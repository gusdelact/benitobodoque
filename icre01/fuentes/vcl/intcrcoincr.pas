// Sistema         : Clase de CR_COINCRE_CONS
// Fecha de Inicio : 21/01/2008
// Función forma   : Clase de CR_COINCRE_CONS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrCoincR;

interface
                                                                                                                     
uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntGenCre, Grids, DBGrids,

// Unidades Adicionales
IntParamCre,
ComObj,
IntXls,
IntMQrCoCo // Reporte Comporativo de Saldos COINCRE- CONTABILIDAD 
;

Type
 TCrCoincR= class;

  TWCrCoincR=Class(TForm)
    InterForma1             : TInterForma;
    QryCOINCRE: TQuery;
    dsrcCOINCRE: TDataSource;
    DBGrid1: TDBGrid;
    QryCOINCREMERC_OBJ_DET: TStringField;
    QryCOINCRECVE_CAT_MINIMO: TStringField;
    QryCOINCREDESC_CAT_MINIMO: TStringField;
    QryCOINCRECVE_MONEDA: TFloatField;
    QryCOINCRENUM_CREDITO: TFloatField;
    QryCOINCRENOMBRE: TStringField;
    QryCOINCREIMP_SDO_K_VIG: TFloatField;
    QryCOINCREIMP_SDO_K_IMP: TFloatField;
    QryCOINCREIMP_SDO_K_VEN_NE: TFloatField;
    QryCOINCREIMP_INT_CORTE: TFloatField;
    QryCOINCREIMP_SDO_IO_IMP: TFloatField;
    QryCOINCREIMP_SDO_IO_VEN: TFloatField;
    QryCOINCREIMP_ADEUDO_TOTAL: TFloatField;
    QryCOINCREIMP_IO_DEV: TFloatField;
    QryCOINCRECVE_CTA_CONTABLE: TStringField;
    QryCOINCREID_OLTP_PRODUCTO: TStringField;
    QryCOINCREPRODUCTO: TStringField;
    QryCOINCREF_INICIO: TDateTimeField;
    QryCOINCREF_VENTTO: TDateTimeField;
    QryCOINCREID_CONTRATO: TFloatField;
    QryCOINCREIMP_AUTORIZADO: TFloatField;
    QryCOINCRECVE_GRUPO_ECO: TStringField;
    QryCOINCREID_PERS_ASOCIAD: TFloatField;
    QryCOINCRENOM_PROM_ASOCIAD: TStringField;
    QryCOINCREID_PROM_ADM: TFloatField;
    QryCOINCRENOM_PROM_ADMIN: TStringField;
    QryCOINCREB_ACREDITADO_REL: TStringField;
    dtpF_CIERRE: TDateTimePicker;
    lbFechaComplementaria: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label1: TLabel;
    edFileNameXLS: TEdit;
    btnSaveFileName: TButton;
    btMuestraDatos: TBitBtn;
    btnGeneraArchivo: TButton;
    SaveDialog: TSaveDialog;
    ProgressBar: TProgressBar;
    QryCOINCREID_ACREDITADO: TFloatField;
    cbTest: TCheckBox;
    QryCOINCRECTA_K_VIG: TStringField;
    QryCOINCRECTA_K_IMP: TStringField;
    QryCOINCRECTA_K_VEN_EX: TStringField;
    QryCOINCRECTA_K_VEN_NE: TStringField;
    QryCOINCRECTA_I_VIG: TStringField;
    QryCOINCRECTA_I_IMP: TStringField;
    QryCOINCRECTA_I_VEN_EX: TStringField;
    QryCOINCRECTA_I_COB_XANT: TStringField;
    Label2: TLabel;
    lblFuenteDatos: TLabel;
    Bevel1: TBevel;
    QryCOINCRECVE_TIPO_SECTOR: TStringField;
    QryCOINCREIMP_SDO_K_VEN_EX: TFloatField;
    Label3: TLabel;
    QryCOINCRECTA_K_VIG_SAP: TStringField;
    QryCOINCRECTA_K_IMP_SAP: TStringField;
    QryCOINCRECTA_K_VEN_EX_SAP: TStringField;
    QryCOINCRECTA_K_VEN_NE_SAP: TStringField;
    QryCOINCRECTA_I_VIG_SAP: TStringField;
    QryCOINCRECTA_I_IMP_SAP: TStringField;
    QryCOINCRECTA_I_VEN_EX_SAP: TStringField;
    QryCOINCRECTA_I_COB_XANT_SAP: TStringField;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure btMuestraDatosClick(Sender: TObject);
    procedure btnSaveFileNameClick(Sender: TObject);
    procedure btnGeneraArchivoClick(Sender: TObject);
    procedure edFileNameXLSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtpF_CIERRECloseUp(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrCoincR;

    function  GeneraArchivoExcel(peFileName : String) : Boolean;
    procedure HabilitaControles(pebHabilita : Boolean);
    procedure ActualizaConsulta;
end;
 TCrCoincR= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre         : TParamCre;
        vgMonth : Word;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    ArmaQuery(peFecha : TDateTime; pebTest : Boolean) :  String;
      published
      end;

function LastDay(Date: TDateTime): TDateTime;

implementation
//Uses RepMon;

{$R *.DFM}

function LastDay(Date: TDateTime): TDateTime;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Date, Year, Month, Day);
  // (if Month < 12 then inc(Month)
  // else begin Month := 1; inc(Year) end;
  // Result := EncodeDate(Year, Month, 1) - 1;
  Result := EncodeDate(Year, Month,
            MonthDays[IsLeapYear(Year), Month]);
end;

constructor TCrCoincR.Create( AOwner : TComponent );
begin Inherited;
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'InTCrCoincR.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCoincR.Destroy;
begin inherited;
end;


function TCrCoincR.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCoincR;
begin
   W:=TWCrCoincR.Create(Self);
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

Function TCrCoincR.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCoCo.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_COINCRE_CONS********************)
(*                                                                              *)
(*  FORMA DE CR_COINCRE_CONS                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_COINCRE_CONS********************)

procedure TWCrCoincR.FormShow(Sender: TObject);

  { function DameUtltimaFechaCOINCRE : TDateTime;
  var vlFECHA : Real;
  begin
    GetSQLFloat( ' SELECT LAST_DAY(ADD_MONTHS(F_REFERENCIA,-1)) AS FECHA '+coCRLF+
                 ' FROM FECHA_EMPRESA WHERE ID_EMPRESA = 2 AND CVE_DIA_LIQUIDA = '#39'D000'#39,
                 Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'FECHA', vlFECHA, True);
    Result := TDateTime (vlFECHA);
  end;
  }

begin
  With Objeto Do
    Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    // dtpF_CIERRE.DateTime := DameUtltimaFechaCOINCRE;
    dtpF_CIERRE.DateTime := Objeto.Apli.DameFechaEmpresa - 1;
    ActualizaConsulta;
    cbTest.Visible := (Objeto.CvePerfil = 101); // Unicamente se muestra para el Perfil de Sistemas
    Objeto.vgMonth := 0;
    End;
end;

procedure TWCrCoincR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryCOINCRE.Close;
  Action := caFree;
end;

function TCrCoincR.ArmaQuery(peFecha : TDateTime; pebTest : Boolean) :  String;
var vlstrQry, vlStrTipoReporte : String;
    wAnio, wMes, wDia : Word;
begin
  DecodeDate(peFecha, wAnio, wMes, wDia);
  vlStrTipoReporte := #39'A'#39; // Consolidado Adeudos
  // Valida si es el último día del mes
//  If (peFecha = LastDay(peFecha)) Then
  vlstrQry :=
             ' SELECT'+coCRLF+
             '         R.MERC_OBJ_DET,'+coCRLF+
             '         CHR(39) || R.CVE_CAT_MINIMO AS CVE_CAT_MINIMO,'+coCRLF+
             '         R.DESC_CAT_MINIMO,'+coCRLF+
             '         R.CVE_MONEDA,'+coCRLF+
             '         to_number(R.ID_CREDITO) as num_credito,'+coCRLF+
             '         R.ID_ACREDITADO,'+coCRLF+
             '         R.NOMBRE,'+coCRLF+
             '         R.IMP_SDO_K_VIG,'+coCRLF+
             '         R.IMP_SDO_K_IMP,'+coCRLF+
{ROIM}       '         R.IMP_SDO_K_VEN_EX,'+coCRLF+
{ROIM}       '         R.IMP_SDO_K_VEN_NE,'+coCRLF+
             '         R.IMP_INT_CORTE,'+coCRLF+
             '         R.IMP_SDO_IO_IMP,'+coCRLF+
             '         R.IMP_SDO_IO_VEN,'+coCRLF+
             '         R.IMP_ADEUDO_TOTAL,'+coCRLF+
             '         R.IMP_IO_DEV,'+coCRLF+
             '         CHR(39) || R.CVE_CTA_CONTABLE  AS CVE_CTA_CONTABLE,'+coCRLF+
             '         R.ID_OLTP_PRODUCTO,'+coCRLF+
             '         R.PRODUCTO,'+coCRLF+
{ROIM}       '         R.CVE_TIPO_SECTOR,'+coCRLF+
             '         R.F_INICIO,'+coCRLF+
             '         R.F_VENTTO,'+coCRLF+
             '         R.ID_CONTRATO,'+coCRLF+
             '         NVL(CO_ICRE.IMP_AUTORIZADO, CO_CRED.IMP_AUTORIZADO) AS IMP_AUTORIZADO,'+coCRLF+
             '         NVL(CA.CVE_GRUPO_ECO, CL.CVE_GRUPO) AS CVE_GRUPO_ECO,'+coCRLF+
             '         CTO.ID_PERS_ASOCIAD,'+coCRLF+
             '         PROM_ASOC.NOMBRE AS NOM_PROM_ASOCIAD,'+coCRLF+
             '         R.ID_PROM_ADM,'+coCRLF+
             '         PROM_ADM.NOMBRE AS  NOM_PROM_ADMIN,'+coCRLF+
             '         NVL(CA.B_ACREDITADO_REL, CL.B_ART_73) AS B_ACREDITADO_REL,'+coCRLF+
             '         CTAS_SAP.CTA_K_VIG,'+coCRLF+
             '         CTAS_SAP.CTA_K_IMP,'+coCRLF+
             '         CTAS_SAP.CTA_K_VEN_EX,'+coCRLF+
             '         CTAS_SAP.CTA_K_VEN_NE,'+coCRLF+
             '         CTAS_SAP.CTA_I_VIG,'+coCRLF+
             '         CTAS_SAP.CTA_I_IMP,'+coCRLF+
             '         CTAS_SAP.CTA_I_VEN_EX,'+coCRLF+
// RABA ENE 2012
//             '         CTAS_SAP.CTA_I_COB_XANT'+coCRLF+
             '         CTAS_SAP.CTA_I_COB_XANT,'+coCRLF+
             '         CTAS_SAP.CTA_K_VIG_SAP,'+coCRLF+
             '         CTAS_SAP.CTA_K_IMP_SAP,'+coCRLF+
             '         CTAS_SAP.CTA_K_VEN_EX_SAP,'+coCRLF+
             '         CTAS_SAP.CTA_K_VEN_NE_SAP,'+coCRLF+
             '         CTAS_SAP.CTA_I_VIG_SAP,'+coCRLF+
             '         CTAS_SAP.CTA_I_IMP_SAP,'+coCRLF+
             '         CTAS_SAP.CTA_I_VEN_EX_SAP,'+coCRLF+
             '         CTAS_SAP.CTA_I_COB_XANT_SAP'+coCRLF+
// FIN RABA
             ' FROM ('+coCRLF+
             '         SELECT DATOS_COINCRE.*,'+coCRLF+
             '                DECODE( NVL(CRED.ID_CREDITO, 0), 0, ICRE.F_INICIO, CRED.F_AUT_OPERACION) AS F_INICIO,'+coCRLF+
             '                DECODE( NVL(CRED.ID_CREDITO, 0), 0, ICRE.F_INICIO + ICRE.DIAS_PLAZO,'+coCRLF+
             '                                                    CRED.F_AUT_OPERACION + CRED.DIAS_PLAZO) AS F_VENTTO,'+coCRLF+
             '                DECODE( NVL(CRED.ID_CREDITO, 0), 0, ICRE.ID_CONTRATO, CRED.ID_CONTRATO) AS ID_CONTRATO,'+coCRLF+
             '                DECODE( NVL(CRED.ID_CREDITO, 0), 0, ICRE.ID_PROM_ADM, CRED.ID_PROM_ADM) AS ID_PROM_ADM,'+coCRLF+
             '                CCM.DESC_CAT_MINIMO,'+coCRLF+
             '                CCC.CVE_CTA_CONTABLE'+coCRLF+
             '         FROM'+coCRLF+
             '                 (  SELECT'+coCRLF+
             '                         COINCRE.ID_CREDITO,'+coCRLF+
             '                         COINCRE.ID_ACREDITADO,'+coCRLF+
             '                         COINCRE.CVE_MONEDA,'+coCRLF+
{ROIM}       '                         P.CVE_TIPO_SECTOR,'+coCRLF+
             '                         DECODE (P.CVE_PER_JURIDICA, ''PF'', PF.APELLIDO_PATERNO || '' '' ||'+coCRLF+
             '                                                           PF.APELLIDO_MATERNO || '' '' ||'+coCRLF+
             '                                                           PF.NOMBRE_PERSONA, P.NOMBRE) AS NOMBRE,'+coCRLF+
             '                         COINCRE.IMP_SDO_K_VIG,'+coCRLF+
             '                         COINCRE.IMP_SDO_K_IMP,'+coCRLF+
{ROIM}       '                         COINCRE.IMP_SDO_K_VEN_EX,'+coCRLF+
{ROIM}       '                         COINCRE.IMP_SDO_K_VEN_NE,'+coCRLF+
             '                         COINCRE.IMP_INT_CORTE,'+coCRLF+
             '                         COINCRE.IMP_SDO_IO_IMP,'+coCRLF+
             '                         COINCRE.IMP_SDO_IO_VEN,'+coCRLF+
             '                         COINCRE.IMP_IO_DEV,'+coCRLF+
             '                         ( COINCRE.IMP_SDO_K_VIG +'+coCRLF+
             '                           COINCRE.IMP_SDO_K_IMP +'+coCRLF+
{ROIM}       '                           COINCRE.IMP_SDO_K_VEN_EX +'+coCRLF+
{ROIM}       '                           COINCRE.IMP_SDO_K_VEN_NE +'+coCRLF+
             '                           COINCRE.IMP_INT_CORTE +'+coCRLF+
             '                           COINCRE.IMP_SDO_IO_IMP +'+coCRLF+
             '                           COINCRE.IMP_SDO_IO_VEN ) AS IMP_ADEUDO_TOTAL,'+coCRLF+
             '                         COINCRE.MERC_OBJ_DET,'+coCRLF+
             '                         COINCRE.CVE_CAT_MINIMO,'+coCRLF+
             '                         COINCRE.ID_OLTP_PRODUCTO,'+coCRLF+
             '                         COINCRE.PRODUCTO'+coCRLF+
             '                    FROM ('+coCRLF+
             '                         ------------------------------------------------------------------'+coCRLF+
             '                         -- Inicia la obtención para el reporte del CONSOLIDADO DE ADEUDOS ICRE  23May2008'+coCRLF+
             '                         SELECT'+coCRLF+
             '                              TO_CHAR(CCAS.ID_CREDITO) AS ID_CREDITO,'+coCRLF+
             '                              CTO.ID_TITULAR AS ID_ACREDITADO,'+coCRLF+
             '                              CTO.CVE_MONEDA,'+coCRLF+
             '                              CCAS.IMP_CAP_VIG AS IMP_SDO_K_VIG,'+coCRLF+
             '                              CCAS.IMP_CAP_IMP AS IMP_SDO_K_IMP,'+coCRLF+
{ROIM}//       '                              (CCAS.IMP_CAP_VDO_EX + CCAS.IMP_CAP_VDO_NE) AS IMP_SDO_K_VEN,'+coCRLF+
{ROIM}       '                              CCAS.IMP_CAP_VDO_EX AS IMP_SDO_K_VEN_EX,'+coCRLF+
{ROIM}       '                              CCAS.IMP_CAP_VDO_NE AS IMP_SDO_K_VEN_NE,'+coCRLF+
             '                              CCAS.IMP_INT_VIG AS IMP_INT_CORTE,'+coCRLF+
             '                              CCAS.IMP_INT_IMP AS IMP_SDO_IO_IMP,'+coCRLF+
             '                              (CCAS.IMP_INT_VDO_EX) AS IMP_SDO_IO_VEN, -- No se incluyen los interes vencidos no exigibles'+coCRLF+
             '                              CCAS.IMP_INTERES_DEV AS IMP_IO_DEV,'+coCRLF+
             '                              GPO.DESC_CARTERA AS MERC_OBJ_DET,'+coCRLF+
//RABA JUL 2015 B-6 HISTORICOS
             '                              CP.CVE_CLAS_CONTAB_OLD AS CVE_CAT_MINIMO,    --RABA JUL 2015 B-6 HISTORICOS'+coCRLF+
             '                              CO.CVE_PRODUCTO_OLD AS ID_OLTP_PRODUCTO,     --RABA JUL 2015 B-6 HISTORICOS'+coCRLF+
             '                              CP.DESC_C_PRODUCTO AS PRODUCTO'+coCRLF+
             '                         FROM CR_CON_ADEUDO_SDO CCAS,'+coCRLF+
             '                              CR_CREDITO CC,'+coCRLF+
             '                              CONTRATO CTO,'+coCRLF+
             '                              --CR_CONTRATO CO,  --RABA JUL 2015 B-6 HISTORICOS'+coCRLF+
             '                              --CR_PRODUCTO CP,  --RABA JUL 2015 B-6 HISTORICOS'+coCRLF+
             '                              (SELECT CAST(CASE  WHEN AU.CVE_PRODUCTO_CRE IS NOT NULL THEN AU.CVE_PRODUCTO_CRE ELSE RAIZ.CVE_PRODUCTO_CRE END AS VARCHAR2(10)) CVE_PRODUCTO_OLD, '+coCRLF+
             '                                      RAIZ.* '+coCRLF+
             '                               FROM CR_CONTRATO RAIZ '+coCRLF+
             '                                           LEFT JOIN '+coCRLF+
             '                                                 (SELECT DENSE_RANK () OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY FH_REGISTRO DESC) R, '+coCRLF+
             '                                                         CASE WHEN LAG (FH_REGISTRO) OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY ID_AUDIT) IS NULL '+coCRLF+
             '                                                                   THEN TO_DATE (1, ''J'') '+coCRLF+
             '                                                              ELSE CAST (LAG (FH_REGISTRO) OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY ID_AUDIT) AS DATE) '+coCRLF+
             '                                                         END F_INI, '+coCRLF+
             '                                                         CASE WHEN LEAD (FH_REGISTRO) OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY ID_AUDIT) IS NULL '+coCRLF+
             '                                                                   THEN TO_DATE (''31/12/9999'', ''DD/MM/YYYY'') '+coCRLF+
             '                                                              ELSE CAST (FH_REGISTRO AS DATE) '+coCRLF+
             '                                                         END F_FIN, '+coCRLF+
             '                                                         ID_CONTRATO, '+coCRLF+
             '                                                         CVE_PRODUCTO_CRE '+coCRLF+
             '                                                  FROM   (SELECT * '+coCRLF+
             '                                                          FROM   (SELECT CASE WHEN LAG (B_AD) OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY ID_AUDIT) IS NULL '+coCRLF+
             '                                                                               AND   TO_NUMBER (ID_CONTRATO) = LEAD (TO_NUMBER (ID_CONTRATO) ) OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY ID_AUDIT) '+coCRLF+
             '                                                                               THEN 1 '+coCRLF+
             '                                                                         ELSE 0 '+coCRLF+
             '                                                                         END L, '+coCRLF+
             '                                                                         HIS.* '+coCRLF+
             '                                                                  FROM   (SELECT H.B_AD, H.FH_REGISTRO, DET.ID_AUDIT, DET.CAMPO, DET.VALOR '+coCRLF+
             '                                                                          FROM   CORP_AUDIT_CAMBIO H, CORP_AUDIT_CAMBIO_DET DET '+coCRLF+
             '                                                                          WHERE  H.ORIGEN_DATOS = ''CR_CONTRATO'' '+coCRLF+
             '                                                                            AND    H.ID_AUDIT = DET.ID_AUDIT) '+coCRLF+
             '                                                                  PIVOT(MAX(VALOR) FOR CAMPO IN(''ID_CONTRATO'' AS ID_CONTRATO,''FOL_CONTRATO'' AS FOL_CONTRATO, ''CVE_PRODUCTO_CRE'' AS CVE_PRODUCTO_CRE)) HIS '+coCRLF+
             '                                                                  ) '+coCRLF+
             '                                                          WHERE  1 = 1 '+coCRLF+
             '                                                            AND    (   B_AD = ''D'' OR L = 1) ) REGS) AU '+coCRLF+
             '                                           ON  TO_NUMBER (AU.ID_CONTRATO) = RAIZ.ID_CONTRATO '+coCRLF+
             '                                           AND TO_DATE (TO_CHAR ('+SQLFecha(peFecha)+', ''DD/MM/YYYY'') || ''23:59:59'', ''DD/MM/YYYY HH24:MI:SS'') BETWEEN AU.F_INI AND AU.F_FIN '+coCRLF+
             '                              )  CO, '+coCRLF+
             '                              (SELECT CAST(CASE WHEN AU.CVE_CLAS_CONTAB IS NOT NULL THEN AU.CVE_CLAS_CONTAB ELSE RAIZ.CVE_CLAS_CONTAB END AS VARCHAR2(20)) CVE_CLAS_CONTAB_OLD, '+coCRLF+
             '                                      RAIZ.* '+coCRLF+
             '                               FROM   CR_PRODUCTO RAIZ '+coCRLF+
             '                                           LEFT JOIN '+coCRLF+
             '                                                 (SELECT DENSE_RANK () OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY FH_REGISTRO DESC) R, '+coCRLF+
             '                                                                CASE '+coCRLF+
             '                                                                    WHEN LAG (FH_REGISTRO) OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY ID_AUDIT) IS NULL '+coCRLF+
             '                                                                        THEN TO_DATE (1, ''J'') '+coCRLF+
             '                                                                    ELSE CAST (LAG (FH_REGISTRO) OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY ID_AUDIT) AS DATE) '+coCRLF+
             '                                                                END F_INI, '+coCRLF+
             '                                                                CASE '+coCRLF+
             '                                                                    WHEN LEAD (FH_REGISTRO) OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY ID_AUDIT) IS NULL '+coCRLF+
             '                                                                        THEN TO_DATE (''31/12/9999'', ''DD/MM/YYYY'') '+coCRLF+
             '                                                                    ELSE CAST (FH_REGISTRO AS DATE) '+coCRLF+
             '                                                                END F_FIN, '+coCRLF+
             '                                                                CVE_PRODUCTO_CRE, '+coCRLF+
             '                                                                CVE_CLAS_CONTAB '+coCRLF+
             '                                                  FROM   (SELECT * '+coCRLF+
             '                                                          FROM   (SELECT CASE '+coCRLF+
             '                                                                             WHEN LAG (B_AD) OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY ID_AUDIT) IS NULL '+coCRLF+
             '                                                                                  AND   CVE_PRODUCTO_CRE = LEAD (CVE_PRODUCTO_CRE) OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY ID_AUDIT) '+coCRLF+
             '                                                                                  THEN 1 '+coCRLF+
             '                                                                             ELSE 0 '+coCRLF+
             '                                                                         END L, '+coCRLF+
             '                                                                         HIS.* '+coCRLF+
             '                                                                  FROM   (SELECT H.B_AD, H.FH_REGISTRO, DET.ID_AUDIT, DET.CAMPO, DET.VALOR '+coCRLF+
             '                                                                          FROM   CORP_AUDIT_CAMBIO H, CORP_AUDIT_CAMBIO_DET DET '+coCRLF+
             '                                                                          WHERE  H.ORIGEN_DATOS = ''CR_PRODUCTO'' '+coCRLF+
             '                                                                          AND    H.ID_AUDIT = DET.ID_AUDIT) '+coCRLF+
             '                                                                          PIVOT(MAX(VALOR) FOR CAMPO IN(''CVE_PRODUCTO_CRE'' AS CVE_PRODUCTO_CRE, ''CVE_CLAS_CONTAB'' AS CVE_CLAS_CONTAB)) HIS  '+coCRLF+
             '                                                                  ) '+coCRLF+
             '                                                          WHERE  1 = 1 '+coCRLF+
             '                                                          AND    (   B_AD = ''D'' '+coCRLF+
             '                                                                     OR L = 1) ) REGS) AU '+coCRLF+
             '                                                 ON  AU.CVE_PRODUCTO_CRE = RAIZ.CVE_PRODUCTO_CRE '+coCRLF+
             '                                                 AND TO_DATE (TO_CHAR ('+SQLFecha(peFecha)+', ''DD/MM/YYYY'') || ''23:59:59'', ''DD/MM/YYYY HH24:MI:SS'') BETWEEN AU.F_INI AND AU.F_FIN '+coCRLF+
             '                              ) CP, '+coCRLF+
//FIN RABA JUL 2015 B-6 HISTORICOS
             '                              CRE_PRESUPUESTO PRES,'+coCRLF+
             '                              ( SELECT CVE_GPO_INGRESO, UPPER(TRIM(DESC_CARTERA)) AS DESC_CARTERA'+coCRLF+
             '                                FROM CRE_GPO_INGRESO'+coCRLF+
             '                              ) GPO'+coCRLF+
             '                         WHERE ''A'' = '+vlStrTipoReporte+' -- Si es el reporte del CONSOLIDADO DE ADEUDOS, entonces...'+coCRLF+
             '                           AND CCAS.F_CIERRE = '+SQLFecha(peFecha)+coCRLF+
             '                           AND CC.ID_CREDITO = CCAS.ID_CREDITO'+coCRLF+
             '                           AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '                           AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '                           AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_OLD   --RABA JUL 2015 B-6 HISTORICOS'+coCRLF+
             '                           AND PRES.CVE_PRESUPUESTO = CP.CVE_PRESUPUESTO'+coCRLF+
             '                           AND GPO.CVE_GPO_INGRESO (+) = PRES.CVE_GPO_INGRESO'+coCRLF+
             ''+coCRLF+
             '                      UNION ALL'+coCRLF+
             '                         ------------------------------------------------------------------'+coCRLF+
             '                         -- Inicia la obtención para el reporte del CONSOLIDADO DE ADEUDOS para INTERCREDITOS 23May2008'+coCRLF+
             ''+coCRLF+
             '                         SELECT'+coCRLF+
             '                              TO_CHAR(CCAS.ID_CREDITO) AS ID_CREDITO,'+coCRLF+
             '                              CTO.ID_TITULAR AS ID_ACREDITADO,'+coCRLF+
             '                              CTO.CVE_MONEDA,'+coCRLF+
             '                              CCAS.IMP_CAP_VIG AS IMP_SDO_K_VIG,'+coCRLF+
             '                              CCAS.IMP_CAP_IMP AS IMP_SDO_K_IMP,'+coCRLF+
{ROIM}       '                              CCAS.IMP_CAP_VDO_EX AS IMP_SDO_K_VEN_EX,'+coCRLF+
{ROIM}       '                              CCAS.IMP_CAP_VDO_NE AS IMP_SDO_K_VEN_NE,'+coCRLF+
             '                              CCAS.IMP_INT_VIG AS IMP_INT_CORTE,'+coCRLF+
             '                              CCAS.IMP_INT_IMP AS IMP_SDO_IO_IMP,'+coCRLF+
             '                              (CCAS.IMP_INT_VDO_EX) AS IMP_SDO_IO_VEN, -- No se incluyen los interes vencidos no exigibles'+coCRLF+
             '                              CCAS.IMP_INTERES_DEV AS IMP_IO_DEV,'+coCRLF+
             '                              PRES.DESC_PRESUPUESTO AS MERC_OBJ_DET,'+coCRLF+
             '                              CO.CVE_CAT_MIN_OLD AS CVE_CAT_MINIMO,                         --RABA JUL 2015 B-6 HISTORICOS'+coCRLF+
             '                              TO_CHAR(CO.CVE_SUB_TIP_BCO_OLD) AS ID_OLTP_PRODUCTO,          --RABA JUL 2015 B-6 HISTORICOS'+coCRLF+
             '                              CSTB.DESC_SUB_TIPO AS PRODUCTO'+coCRLF+
             '                         FROM CR_CON_ADEUDO_SDO CCAS,'+coCRLF+
             '                              CRE_CREDITO CC,'+coCRLF+
             '                              CONTRATO CTO,'+coCRLF+
             '                              --CRE_CONTRATO CO,      --RABA JUL 2015 B-6 HISTORICOS '+coCRLF+
//RABA JUL 2015 B-6 HISTORICOS
             '                              (SELECT CAST(CASE WHEN AU.CVE_SUB_TIP_BCO IS NOT NULL THEN TO_NUMBER(AU.CVE_SUB_TIP_BCO) ELSE RAIZ.CVE_SUB_TIP_BCO END AS VARCHAR2(10)) CVE_SUB_TIP_BCO_OLD, '+coCRLF+
             '                                      CAST(CASE WHEN AU.CVE_CAT_MIN     IS NOT NULL THEN AU.CVE_CAT_MIN ELSE RAIZ.CVE_CAT_MIN END AS VARCHAR2(20)) CVE_CAT_MIN_OLD, '+coCRLF+
             '                                      RAIZ.* '+coCRLF+
             '                               FROM   CRE_CONTRATO RAIZ '+coCRLF+
             '                                              LEFT JOIN (SELECT DENSE_RANK () OVER (PARTITION BY TO_NUMBER(ID_CONTRATO) ORDER BY FH_REGISTRO DESC) R, '+coCRLF+
             '                                                                CASE WHEN LAG (FH_REGISTRO) OVER (PARTITION BY TO_NUMBER(ID_CONTRATO) ORDER BY ID_AUDIT) IS NULL THEN TO_DATE (1, ''J'') '+coCRLF+
             '                                                                     ELSE CAST (LAG (FH_REGISTRO) OVER (PARTITION BY TO_NUMBER(ID_CONTRATO) ORDER BY ID_AUDIT) AS DATE) '+coCRLF+
             '                                                                END F_INI, '+coCRLF+
             '                                                                CASE WHEN LEAD (FH_REGISTRO) OVER (PARTITION BY TO_NUMBER(ID_CONTRATO) ORDER BY ID_AUDIT) IS NULL THEN TO_DATE (''31/12/9999'', ''DD/MM/YYYY'') '+coCRLF+
             '                                                                     ELSE CAST (FH_REGISTRO AS DATE) '+coCRLF+
             '                                                                END F_FIN, '+coCRLF+
             '                                                                ID_CONTRATO, '+coCRLF+
             '                                                                CVE_SUB_TIP_BCO, '+coCRLF+
             '                                                                CVE_CAT_MIN '+coCRLF+
             '                                                         FROM (SELECT * '+coCRLF+
             '                                                               FROM   (SELECT CASE WHEN LAG (B_AD) OVER (PARTITION BY TO_NUMBER(ID_CONTRATO) ORDER BY ID_AUDIT) IS NULL '+coCRLF+
             '                                                                                    AND TO_NUMBER(ID_CONTRATO) = LEAD (TO_NUMBER(ID_CONTRATO)) OVER (PARTITION BY TO_NUMBER(ID_CONTRATO) ORDER BY ID_AUDIT) '+coCRLF+
             '                                                                                    THEN 1 '+coCRLF+
             '                                                                                    ELSE 0 '+coCRLF+
             '                                                                              END L, '+coCRLF+
             '                                                                              HIS.* '+coCRLF+
             '                                                                       FROM   (SELECT H.B_AD, H.FH_REGISTRO, DET.ID_AUDIT, DET.CAMPO, DET.VALOR '+coCRLF+
             '                                                                               FROM   CORP_AUDIT_CAMBIO H, CORP_AUDIT_CAMBIO_DET DET '+coCRLF+
             '                                                                               WHERE  H.ORIGEN_DATOS = ''CRE_CONTRATO'' '+coCRLF+
             '                                                                               AND    H.ID_AUDIT = DET.ID_AUDIT) '+coCRLF+
             '                                                                               PIVOT(MAX(VALOR) FOR CAMPO IN(''ID_CONTRATO'' AS ID_CONTRATO, ''CVE_SUB_TIP_BCO'' AS CVE_SUB_TIP_BCO, ''CVE_CAT_MIN'' AS CVE_CAT_MIN)) HIS '+coCRLF+
             '                                                                       ) '+coCRLF+
             '                                                               WHERE  1 = 1 '+coCRLF+
             '                                                                 AND  (   B_AD = ''D'' OR L = 1) ) REGS ) AU '+coCRLF+
             '                                              ON TO_NUMBER(AU.ID_CONTRATO) = RAIZ.ID_CONTRATO '+coCRLF+
             '                                              AND TO_DATE (TO_CHAR ('+SQLFecha(peFecha)+', ''DD/MM/YYYY'') || ''23:59:59'', ''DD/MM/YYYY HH24:MI:SS'') BETWEEN AU.F_INI AND AU.F_FIN '+coCRLF+
             '                               ) CO, '+coCRLF+
//FIN RABA JUL 2015 B-6 HISTORICOS
             '                              CRE_SUB_TIP_BCO CSTB,'+coCRLF+
             '                              CRE_PRESUPUESTO PRES,'+coCRLF+
             '                              ( SELECT CVE_GPO_INGRESO, UPPER(TRIM(DESC_CARTERA)) AS DESC_CARTERA'+coCRLF+
             '                                FROM CRE_GPO_INGRESO'+coCRLF+
             '                              ) GPO'+coCRLF+
             '                         WHERE ''A'' = '+vlStrTipoReporte+' -- Si es el reporte del CONSOLIDADO DE ADEUDOS, entonces...'+coCRLF+
             '                           AND CCAS.F_CIERRE = '+SQLFecha(peFecha)+coCRLF+
             '                           AND CC.ID_CREDITO = CCAS.ID_CREDITO'+coCRLF+
{ROIM}       '                           AND CC.SIT_CREDITO NOT IN (''CA'',''TA'',''TL'')'+coCRLF+
             '                           AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '                           AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '                           AND CSTB.CVE_SUB_TIP_BCO = CO.CVE_SUB_TIP_BCO_OLD          --RABA JUL 2015 B-6 HISTORICOS'+coCRLF+
             '                           AND PRES.CVE_PRESUPUESTO = CC.CVE_PRESUPUESTO'+coCRLF+
             '                           AND GPO.CVE_GPO_INGRESO (+) = PRES.CVE_GPO_INGRESO'+coCRLF+
             '                         ) COINCRE,'+coCRLF+
             '                         PERSONA P,'+coCRLF+
             '                         PERSONA_FISICA PF'+coCRLF+
             '                    WHERE P.ID_PERSONA = COINCRE.ID_ACREDITADO'+coCRLF+
             '                      AND PF.ID_PERSONA (+)= P.ID_PERSONA'+coCRLF+
             '                ) DATOS_COINCRE,'+coCRLF+
             '                CR_CREDITO ICRE,'+coCRLF+
             '                ( SELECT ID_CREDITO, ID_CONTRATO, F_AUT_OPERACION, DIAS_PLAZO, ID_PROM_ADM'+coCRLF+
             '                  FROM CRE_CREDITO CRED'+coCRLF+
             '                  WHERE SIT_CREDITO NOT IN (''CA'',''TA'',''TL'')'+coCRLF+
             '                ) CRED,'+coCRLF+
             '                CR_CAT_MINIMO CCM,'+coCRLF+
             '                ( SELECT ID_OLTP_PRODUCTO,'+coCRLF+
             '                         MIN(CVE_CTA_CONTABLE) AS CVE_CTA_CONTABLE'+coCRLF+
             '                  FROM CR_COINCRE_CONC'+coCRLF+
             '                  WHERE ID_REPORTE IN (1, 4) -- Se toman las cuentas de Capital Vigente'+coCRLF+
             '                  GROUP BY ID_OLTP_PRODUCTO'+coCRLF+
             '                ) CCC'+coCRLF+
             '         WHERE ICRE.ID_CREDITO (+)= DATOS_COINCRE.ID_CREDITO'+coCRLF+
             '           AND CRED.ID_CREDITO (+)= DATOS_COINCRE.ID_CREDITO'+coCRLF+
             '           AND CCM.CVE_CAT_MINIMO (+)= DATOS_COINCRE.CVE_CAT_MINIMO'+coCRLF+
             '           AND CCC.ID_OLTP_PRODUCTO (+)= DATOS_COINCRE.ID_OLTP_PRODUCTO'+coCRLF+
             '     ) R,'+coCRLF+
             '     -- Inicia obtención de cuentas SAP para los productos de ICRE e INTERCREDITOS'+coCRLF+
             '     ('+coCRLF+
             '        SELECT'+coCRLF+
             '           CP.CVE_PRODUCTO_GPO,'+coCRLF+
             '           CP.CVE_PRODUCTO_CRE,'+coCRLF+
             '           CP.DESC_L_PRODUCTO,'+coCRLF+
{ROIM}       '           TEMP.CVE_SECTOR_SAP,'+coCRLF+
             '           TEMP.CTA_K_VIG,'+coCRLF+
             '           TEMP.CTA_K_IMP,'+coCRLF+
             '           TEMP.CTA_K_VEN_EX,'+coCRLF+
             '           TEMP.CTA_K_VEN_NE,'+coCRLF+
             '           TEMP.CTA_I_VIG,'+coCRLF+
             '           TEMP.CTA_I_IMP,'+coCRLF+
             '           TEMP.CTA_I_VEN_EX,'+coCRLF+
// RABA ENE 2012
//             '           TEMP.CTA_I_COB_XANT'+coCRLF+
             '           TEMP.CTA_I_COB_XANT,'+coCRLF+
             '           CAST(PKGCRCREDITO.FUN_CR_CTASCONTNEW(2, TEMP.CTA_K_VIG, TEMP.CVE_SECTOR_SAP, '' '') AS VARCHAR2(30)) AS CTA_K_VIG_SAP,'+coCRLF+
             '           CAST(PKGCRCREDITO.FUN_CR_CTASCONTNEW(2, TEMP.CTA_K_IMP, TEMP.CVE_SECTOR_SAP, '' '') AS VARCHAR2(30)) AS CTA_K_IMP_SAP,'+coCRLF+
             '           CAST(PKGCRCREDITO.FUN_CR_CTASCONTNEW(2, TEMP.CTA_K_VEN_EX, TEMP.CVE_SECTOR_SAP, '' '') AS VARCHAR2(30)) AS CTA_K_VEN_EX_SAP,'+coCRLF+
             '           CAST(PKGCRCREDITO.FUN_CR_CTASCONTNEW(2, TEMP.CTA_K_VEN_NE, TEMP.CVE_SECTOR_SAP, '' '') AS VARCHAR2(30)) AS CTA_K_VEN_NE_SAP,'+coCRLF+
             '           CAST(PKGCRCREDITO.FUN_CR_CTASCONTNEW(2, TEMP.CTA_I_VIG, TEMP.CVE_SECTOR_SAP, '' '') AS VARCHAR2(30)) AS CTA_I_VIG_SAP,'+coCRLF+
             '           CAST(PKGCRCREDITO.FUN_CR_CTASCONTNEW(2, TEMP.CTA_I_IMP, TEMP.CVE_SECTOR_SAP, '' '') AS VARCHAR2(30)) AS CTA_I_IMP_SAP,'+coCRLF+
             '           CAST(PKGCRCREDITO.FUN_CR_CTASCONTNEW(2, TEMP.CTA_I_VEN_EX, TEMP.CVE_SECTOR_SAP, '' '') AS VARCHAR2(30)) AS CTA_I_VEN_EX_SAP,'+coCRLF+
             '           CAST(PKGCRCREDITO.FUN_CR_CTASCONTNEW(2, TEMP.CTA_I_COB_XANT, TEMP.CVE_SECTOR_SAP, '' '') AS VARCHAR2(30)) AS CTA_I_COB_XANT_SAP'+coCRLF+
// FIN RABA
             '         FROM'+coCRLF+
             '           ( SELECT CCS1.ID_OLTP_PRODUCTO,'+coCRLF+
{ROIM}       '                    CCS1.CVE_SECTOR_SAP,'+coCRLF+
             '                    MAX(CCS1.CTA_K_VIG)      AS CTA_K_VIG,'+coCRLF+
             '                    MAX(CCS1.CTA_K_IMP)      AS CTA_K_IMP,'+coCRLF+
             '                    MAX(CCS1.CTA_K_VEN_EX)   AS CTA_K_VEN_EX,'+coCRLF+
             '                    MAX(CCS1.CTA_K_VEN_NE)   AS CTA_K_VEN_NE,'+coCRLF+
             '                    MAX(CCS1.CTA_I_VIG)      AS CTA_I_VIG,'+coCRLF+
             '                    MAX(CCS1.CTA_I_IMP)      AS CTA_I_IMP,'+coCRLF+
             '                    MAX(CCS1.CTA_I_VEN_EX)   AS CTA_I_VEN_EX,'+coCRLF+
             '                    MAX(CCS1.CTA_I_COB_XANT) AS CTA_I_COB_XANT'+coCRLF+
             '             FROM ( SELECT'+coCRLF+
             '                         CCS.ID_OLTP_PRODUCTO,'+coCRLF+
             '                         DECODE(CCS.ID_REPORTE, 4, CCS.CVE_CUENTA, 0) AS CTA_K_VIG,'+coCRLF+
             '                         DECODE(CCS.ID_REPORTE, 16, CCS.CVE_CUENTA, 0) AS CTA_K_IMP,'+coCRLF+
             '                         DECODE(CCS.ID_REPORTE, 20,'+coCRLF+
             '                                DECODE(SUBSTR(CCS.CVE_CUENTA, 1, 4), ''1314'', CCS.CVE_CUENTA,'+coCRLF+
             '                                       0'+coCRLF+
             '                                      ) , 0'+coCRLF+
             '                               ) AS CTA_K_VEN_EX,'+coCRLF+
             '                         DECODE(CCS.ID_REPORTE, 20,'+coCRLF+
             '                                DECODE(SUBSTR(CCS.CVE_CUENTA, 1, 4), ''1315'', CCS.CVE_CUENTA,'+coCRLF+
             '                                       0'+coCRLF+
             '                                      ) , 0'+coCRLF+
             '                               ) AS CTA_K_VEN_NE,'+coCRLF+
             '                         DECODE(CCS.ID_REPORTE, 30, CCS.CVE_CUENTA, 0) AS CTA_I_VIG,'+coCRLF+
             '                         DECODE(CCS.ID_REPORTE, 9, CCS.CVE_CUENTA, 0) AS CTA_I_IMP,'+coCRLF+
             '                         DECODE(CCS.ID_REPORTE, 31, CCS.CVE_CUENTA, 0) AS CTA_I_VEN_EX,'+coCRLF+
             '                         DECODE(CCS.ID_REPORTE, 32, CCS.CVE_CUENTA, 0) AS CTA_I_COB_XANT,'+coCRLF+
{ROIM}       '                         CCS.CVE_SECTOR_SAP'+coCRLF+
             '                    FROM CR_COINCRE_SAP CCS'+coCRLF+
             '                    WHERE ((CCS.CVE_CUENTA LIKE ''1%'' OR CCS.CVE_CUENTA LIKE ''2%'')'+coCRLF+
             '                            AND CVE_MONEDA IN (484))'+coCRLF+
             '                      OR  ((CCS.CVE_CUENTA LIKE ''6%'')'+coCRLF+
             '                            AND CVE_MONEDA IN (800))'+coCRLF+
             '                 ) CCS1'+coCRLF+
             '              GROUP BY CCS1.ID_OLTP_PRODUCTO, CCS1.CVE_SECTOR_SAP'+coCRLF+
             '            ) TEMP,'+coCRLF+
             '            CR_PRODUCTO CP'+coCRLF+
             '         WHERE CP.CVE_PRODUCTO_CRE = TEMP.ID_OLTP_PRODUCTO'+coCRLF+
             ''+coCRLF+
             '       UNION ALL'+coCRLF+
             ''+coCRLF+
             '         SELECT'+coCRLF+
             '           ''CRED'' AS CVE_PRODUCTO_GPO,'+coCRLF+
             '           TO_CHAR(CSTB.CVE_SUB_TIP_BCO) AS CVE_SUB_TIP_BCO,'+coCRLF+
             '           CSTB.DESC_SUB_TIPO,'+coCRLF+
{ROIM}       '           TEMP.CVE_SECTOR_SAP,'+coCRLF+
             '           TEMP.CTA_K_VIG,'+coCRLF+
             '           TEMP.CTA_K_IMP,'+coCRLF+
             '           TEMP.CTA_K_VEN_EX,'+coCRLF+
             '           TEMP.CTA_K_VEN_NE,'+coCRLF+
             '           TEMP.CTA_I_VIG,'+coCRLF+
             '           TEMP.CTA_I_IMP,'+coCRLF+
             '           TEMP.CTA_I_VEN_EX,'+coCRLF+
// RABA ENE 2012
//             '           TEMP.CTA_I_COB_XANT'+coCRLF+
             '           TEMP.CTA_I_COB_XANT,'+coCRLF+
             '           CAST(PKGCRCREDITO.FUN_CR_CTASCONTNEW(2, TEMP.CTA_K_VIG, TEMP.CVE_SECTOR_SAP, '' '') AS VARCHAR2(30)) AS CTA_K_VIG_SAP,'+coCRLF+
             '           CAST(PKGCRCREDITO.FUN_CR_CTASCONTNEW(2, TEMP.CTA_K_IMP, TEMP.CVE_SECTOR_SAP, '' '') AS VARCHAR2(30)) AS CTA_K_IMP_SAP,'+coCRLF+
             '           CAST(PKGCRCREDITO.FUN_CR_CTASCONTNEW(2, TEMP.CTA_K_VEN_EX, TEMP.CVE_SECTOR_SAP, '' '') AS VARCHAR2(30)) AS CTA_K_VEN_EX_SAP,'+coCRLF+
             '           CAST(PKGCRCREDITO.FUN_CR_CTASCONTNEW(2, TEMP.CTA_K_VEN_NE, TEMP.CVE_SECTOR_SAP, '' '') AS VARCHAR2(30)) AS CTA_K_VEN_NE_SAP,'+coCRLF+
             '           CAST(PKGCRCREDITO.FUN_CR_CTASCONTNEW(2, TEMP.CTA_I_VIG, TEMP.CVE_SECTOR_SAP, '' '') AS VARCHAR2(30)) AS CTA_I_VIG_SAP,'+coCRLF+
             '           CAST(PKGCRCREDITO.FUN_CR_CTASCONTNEW(2, TEMP.CTA_I_IMP, TEMP.CVE_SECTOR_SAP, '' '') AS VARCHAR2(30)) AS CTA_I_IMP_SAP,'+coCRLF+
             '           CAST(PKGCRCREDITO.FUN_CR_CTASCONTNEW(2, TEMP.CTA_I_VEN_EX, TEMP.CVE_SECTOR_SAP, '' '') AS VARCHAR2(30)) AS CTA_I_VEN_EX_SAP,'+coCRLF+
             '           CAST(PKGCRCREDITO.FUN_CR_CTASCONTNEW(2, TEMP.CTA_I_COB_XANT, TEMP.CVE_SECTOR_SAP, '' '') AS VARCHAR2(30)) AS CTA_I_COB_XANT_SAP'+coCRLF+
// FIN RABA
             '         FROM'+coCRLF+
             '           ( SELECT CCS1.ID_OLTP_PRODUCTO,'+coCRLF+
{ROIM}       '                    CCS1.CVE_SECTOR_SAP,'+coCRLF+
             '                    MAX(CCS1.CTA_K_VIG)      AS CTA_K_VIG,'+coCRLF+
             '                    MAX(CCS1.CTA_K_IMP)      AS CTA_K_IMP,'+coCRLF+
             '                    MAX(CCS1.CTA_K_VEN_EX)   AS CTA_K_VEN_EX,'+coCRLF+
             '                    MAX(CCS1.CTA_K_VEN_NE)   AS CTA_K_VEN_NE,'+coCRLF+
             '                    MAX(CCS1.CTA_I_VIG)      AS CTA_I_VIG,'+coCRLF+
             '                    MAX(CCS1.CTA_I_IMP)      AS CTA_I_IMP,'+coCRLF+
             '                    MAX(CCS1.CTA_I_VEN_EX)   AS CTA_I_VEN_EX,'+coCRLF+
             '                    MAX(CCS1.CTA_I_COB_XANT) AS CTA_I_COB_XANT'+coCRLF+
             '             FROM ( SELECT'+coCRLF+
             '                         CCS.ID_OLTP_PRODUCTO,'+coCRLF+
             '                         DECODE(CCS.ID_REPORTE, 4, CCS.CVE_CUENTA, 0) AS CTA_K_VIG,'+coCRLF+
             '                         DECODE(CCS.ID_REPORTE, 16, CCS.CVE_CUENTA, 0) AS CTA_K_IMP,'+coCRLF+
             '                         DECODE(CCS.ID_REPORTE, 20,'+coCRLF+
             '                                DECODE(SUBSTR(CCS.CVE_CUENTA, 1, 4), ''1314'', CCS.CVE_CUENTA,'+coCRLF+
             '                                       0'+coCRLF+
             '                                      ) , 0'+coCRLF+
             '                               ) AS CTA_K_VEN_EX,'+coCRLF+
             '                         DECODE(CCS.ID_REPORTE, 20,'+coCRLF+
             '                                DECODE(SUBSTR(CCS.CVE_CUENTA, 1, 4), ''1315'', CCS.CVE_CUENTA,'+coCRLF+
             '                                       0'+coCRLF+
             '                                      ) , 0'+coCRLF+
             '                               ) AS CTA_K_VEN_NE,'+coCRLF+
             '                         DECODE(CCS.ID_REPORTE, 30, CCS.CVE_CUENTA, 0) AS CTA_I_VIG,'+coCRLF+
             '                         DECODE(CCS.ID_REPORTE, 9, CCS.CVE_CUENTA, 0) AS CTA_I_IMP,'+coCRLF+
             '                         DECODE(CCS.ID_REPORTE, 31, CCS.CVE_CUENTA, 0) AS CTA_I_VEN_EX,'+coCRLF+
             '                         DECODE(CCS.ID_REPORTE, 32, CCS.CVE_CUENTA, 0) AS CTA_I_COB_XANT,'+coCRLF+
             '                         CCS.CVE_SECTOR_SAP'+coCRLF+
             '                    FROM CR_COINCRE_SAP CCS'+coCRLF+
             '                    WHERE ((CCS.CVE_CUENTA LIKE ''1%'' OR CCS.CVE_CUENTA LIKE ''2%'')'+coCRLF+
             '                            AND CCS.ID_OLTP_PRODUCTO NOT IN ( SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO )'+coCRLF+
             '                            AND CVE_MONEDA = 484)'+coCRLF+
             '                    OR    ((CCS.CVE_CUENTA LIKE ''6%'')'+coCRLF+
             '                            AND CCS.ID_OLTP_PRODUCTO NOT IN ( SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO )'+coCRLF+
             '                            AND CVE_MONEDA = 800)'+coCRLF+
             '                 ) CCS1'+coCRLF+
             '              GROUP BY CCS1.ID_OLTP_PRODUCTO, CCS1.CVE_SECTOR_SAP'+coCRLF+
             '            ) TEMP,'+coCRLF+
             '            CRE_SUB_TIP_BCO CSTB'+coCRLF+
//             '         WHERE CSTB.CVE_SUB_TIP_BCO = TEMP.ID_OLTP_PRODUCTO'+coCRLF+
             '         WHERE TO_CHAR(cstb.cve_sub_tip_bco) = TO_CHAR(temp.id_oltp_producto) '+coCRLF+   //RUCJ4248
             '     ) CTAS_SAP,'+coCRLF+
             '     CONTRATO CTO,'+coCRLF+
             '     CR_CONTRATO CO_ICRE,'+coCRLF+
             '     CRE_CONTRATO CO_CRED,'+coCRLF+
             '     CR_ACREDITADO CA,'+coCRLF+
             '     CRE_CLIENTE CL,'+coCRLF+
             '     PERSONA PROM_ASOC,'+coCRLF+
             '     PERSONA PROM_ADM'+coCRLF+
             ' WHERE CTO.ID_CONTRATO = R.ID_CONTRATO'+coCRLF+
             '   AND CO_ICRE.ID_CONTRATO  (+)= R.ID_CONTRATO'+coCRLF+
             '   AND CO_CRED.ID_CONTRATO  (+)= R.ID_CONTRATO'+coCRLF+
             '   AND CA.ID_ACREDITADO     (+)= CTO.ID_TITULAR'+coCRLF+
             '   AND CL.ID_PERSONA        (+)= CTO.ID_TITULAR'+coCRLF+
             '   AND PROM_ASOC.ID_PERSONA (+)= CTO.ID_PERS_ASOCIAD'+coCRLF+
             '   AND PROM_ADM.ID_PERSONA (+)= R.ID_PROM_ADM'+coCRLF+
             '   AND CTAS_SAP.CVE_PRODUCTO_CRE (+)= R.ID_OLTP_PRODUCTO '+coCRLF+ // 23May2008
{ROIM}       '   AND CTAS_SAP.CVE_SECTOR_SAP (+)= R.CVE_TIPO_SECTOR ' +coCRLF
             ;

            If pebTest Then
              Begin
              vlstrQry :=  vlstrQry + '   AND ROWNUM = 1'+coCRLF;
              End;

            vlstrQry :=  vlstrQry + ' ORDER BY R.CVE_CAT_MINIMO, R.NOMBRE, R.ID_CREDITO'+coCRLF;
  Result := vlstrQry;
end;

procedure TWCrCoincR.btMuestraDatosClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOINCR_MUESTR',True,True) then
   begin
      If QryCOINCRE.Active Then QryCOINCRE.Close;
      With QryCOINCRE Do
        Try
          SQL.Clear;
          SQL.Add(Objeto.ArmaQuery(dtpF_CIERRE.DateTime, cbTest.Checked));

          SQL.SaveToFile('c:\ConsRapida.txt');

          DatabaseName := Objeto.Apli.DatabaseName;
          SessionName  := Objeto.Apli.SessionName;
          Open;
        Finally
        End;
   end;
end;

procedure TWCrCoincR.btnSaveFileNameClick(Sender: TObject);
begin
  If SaveDialog.Execute Then
    edFileNameXLS.Text := SaveDialog.FileName;
end;

procedure TWCrCoincR.btnGeneraArchivoClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOINCR_GENERA',True,True) then
   begin
      If Not QryCOINCRE.Active Then
        Begin
        MessageDlg('No hay información COINCRE para guardar del Año Mes '+ FormatDateTime('YYYYMM',dtpF_CIERRE.DateTime),
                    mtWarning, [mbOk], 0 );
        Exit;
        End
      Else If (Trim(ExtractFileName(edFileNameXLS.Text)) = '') Then
        Begin
        MessageDlg('Debe de indicar primero el nombre del archivo en donde desea guardar la información.',
                    mtWarning, [mbOk], 0 );
        Exit;
        End
      Else If (LowerCase(Trim(ExtractFileExt(edFileNameXLS.Text))) <> '.xls') Then
        Begin
        edFileNameXLS.Text := edFileNameXLS.Text + '.xls';
        End;

      HabilitaControles(False);
      If GeneraArchivoExcel(edFileNameXLS.Text) Then
        Begin
        MessageDlg('Archivo generado.', mtInformation, [mbOk], 0 );
        End;
      HabilitaControles(True);
   end;
end;

function TWCrCoincR.GeneraArchivoExcel(peFileName: String): Boolean;
var
    vlRange : Variant;
    vlCol, vlRow : Integer;
    vgExcelApp : OleVariant;
    vlColumnRange : Variant;
begin
    Result := False;
    ProgressBar.Min := 0;
    ProgressBar.Position := 0;

    If Not QryCOINCRE.Active Then
      Exit;

    vgExcelApp := CreateOleObject('Excel.Application');
    vgExcelApp.Workbooks.Add;
    Try
      //----------------------------------
      // INICIA COLOCACIÓN DE ENCABEZADOS
      vlRow := 1;
      vgExcelApp.Cells[ vlRow , ColumnXlS('A') ].Value  := QryCOINCRECVE_MONEDA.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('B') ].Value  := QryCOINCRECVE_GRUPO_ECO.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('C') ].Value  := QryCOINCREID_PERS_ASOCIAD.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('D') ].Value  := QryCOINCRENOM_PROM_ASOCIAD.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('E') ].Value  := QryCOINCREID_PROM_ADM.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('F') ].Value  := QryCOINCRENOM_PROM_ADMIN.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('G') ].Value  := QryCOINCREID_ACREDITADO.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('H') ].Value  := QryCOINCRENOMBRE.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('I') ].Value  := QryCOINCREID_CONTRATO.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('J') ].Value  := QryCOINCREIMP_AUTORIZADO.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('K') ].Value  := QryCOINCRENUM_CREDITO.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('L') ].Value  := QryCOINCREIMP_SDO_K_VIG.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('M') ].Value  := QryCOINCREIMP_SDO_K_IMP.DisplayLabel;
{ROIM}vgExcelApp.Cells[ vlRow , ColumnXlS('N') ].Value  := QryCOINCREIMP_SDO_K_VEN_EX.DisplayLabel;
{ROIM}vgExcelApp.Cells[ vlRow , ColumnXlS('O') ].Value  := QryCOINCREIMP_SDO_K_VEN_NE.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('P') ].Value  := QryCOINCREIMP_INT_CORTE.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('Q') ].Value  := QryCOINCREIMP_SDO_IO_IMP.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('R') ].Value  := QryCOINCREIMP_SDO_IO_VEN.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('S') ].Value  := QryCOINCREIMP_ADEUDO_TOTAL.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('T') ].Value  := QryCOINCREIMP_IO_DEV.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('U') ].Value  := QryCOINCREID_OLTP_PRODUCTO.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('V') ].Value  := QryCOINCREPRODUCTO.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('W') ].Value  := QryCOINCRECVE_CTA_CONTABLE.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('X') ].Value  := QryCOINCREF_INICIO.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('Y') ].Value  := QryCOINCREF_VENTTO.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('Z') ].Value  := QryCOINCREDESC_CAT_MINIMO.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AA') ].Value  := QryCOINCRECVE_CAT_MINIMO.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AB') ].Value := QryCOINCREMERC_OBJ_DET.DisplayLabel;
{ROIM}vgExcelApp.Cells[ vlRow , ColumnXlS('AC') ].Value  := QryCOINCRECVE_TIPO_SECTOR.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AD') ].Value := QryCOINCRECTA_K_VIG.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AE') ].Value := QryCOINCRECTA_K_IMP.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AF') ].Value := QryCOINCRECTA_K_VEN_EX.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AG') ].Value := QryCOINCRECTA_K_VEN_NE.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AH') ].Value := QryCOINCRECTA_I_VIG.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AI') ].Value := QryCOINCRECTA_I_IMP.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AJ') ].Value := QryCOINCRECTA_I_VEN_EX.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AK') ].Value := QryCOINCRECTA_I_COB_XANT.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AL') ].Value := QryCOINCREB_ACREDITADO_REL.DisplayLabel;
// RABA ENE 2012
      vgExcelApp.Cells[ vlRow , ColumnXlS('AM') ].Value := QryCOINCRECTA_K_VIG_SAP.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AN') ].Value := QryCOINCRECTA_K_IMP_SAP.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AO') ].Value := QryCOINCRECTA_K_VEN_EX_SAP.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AP') ].Value := QryCOINCRECTA_K_VEN_NE_SAP.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AQ') ].Value := QryCOINCRECTA_I_VIG_SAP.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AR') ].Value := QryCOINCRECTA_I_IMP_SAP.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AS') ].Value := QryCOINCRECTA_I_VEN_EX_SAP.DisplayLabel;
      vgExcelApp.Cells[ vlRow , ColumnXlS('AT') ].Value := QryCOINCRECTA_I_COB_XANT_SAP.DisplayLabel;
// FIN RABA

      //----------------------------------
      // INICIA EL LLENADO DE DATOS HACIA
      // EL ARCHIVO DE EXCEL
      vlRow := 2;
      QryCOINCRE.Last; ProgressBar.Max := QryCOINCRE.RecordCount; QryCOINCRE.First;

      While Not QryCOINCRE.Eof Do
        Begin
        vgExcelApp.Cells[ vlRow , ColumnXlS('A') ].Value  := QryCOINCRE.FieldByName('CVE_MONEDA').AsInteger;
        vgExcelApp.Cells[ vlRow , ColumnXlS('B') ].Value  := QryCOINCRE.FieldByName('CVE_GRUPO_ECO').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('C') ].Value  := QryCOINCRE.FieldByName('ID_PERS_ASOCIAD').AsInteger;
        vgExcelApp.Cells[ vlRow , ColumnXlS('D') ].Value  := QryCOINCRE.FieldByName('NOM_PROM_ASOCIAD').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('E') ].Value  := QryCOINCRE.FieldByName('ID_PROM_ADM').AsInteger;
        vgExcelApp.Cells[ vlRow , ColumnXlS('F') ].Value  := QryCOINCRE.FieldByName('NOM_PROM_ADMIN').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('G') ].Value  := QryCOINCRE.FieldByName('ID_ACREDITADO').AsInteger;
        vgExcelApp.Cells[ vlRow , ColumnXlS('H') ].Value  := QryCOINCRE.FieldByName('NOMBRE').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('I') ].Value  := QryCOINCRE.FieldByName('ID_CONTRATO').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('J') ].Value  := QryCOINCRE.FieldByName('IMP_AUTORIZADO').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('K') ].Value  := QryCOINCRE.FieldByName('NUM_CREDITO').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('L') ].Value  := QryCOINCRE.FieldByName('IMP_SDO_K_VIG').AsFloat;
        vgExcelApp.Cells[ vlRow , ColumnXlS('M') ].Value  := QryCOINCRE.FieldByName('IMP_SDO_K_IMP').AsFloat;
{ROIM}  vgExcelApp.Cells[ vlRow , ColumnXlS('N') ].Value  := QryCOINCRE.FieldByName('IMP_SDO_K_VEN_EX').AsFloat;
{ROIM}  vgExcelApp.Cells[ vlRow , ColumnXlS('O') ].Value  := QryCOINCRE.FieldByName('IMP_SDO_K_VEN_NE').AsFloat;
        vgExcelApp.Cells[ vlRow , ColumnXlS('P') ].Value  := QryCOINCRE.FieldByName('IMP_INT_CORTE').AsFloat;
        vgExcelApp.Cells[ vlRow , ColumnXlS('Q') ].Value  := QryCOINCRE.FieldByName('IMP_SDO_IO_IMP').AsFloat;
        vgExcelApp.Cells[ vlRow , ColumnXlS('R') ].Value  := QryCOINCRE.FieldByName('IMP_SDO_IO_VEN').AsFloat;
        vgExcelApp.Cells[ vlRow , ColumnXlS('S') ].Value  := QryCOINCRE.FieldByName('IMP_ADEUDO_TOTAL').AsFloat;
        vgExcelApp.Cells[ vlRow , ColumnXlS('T') ].Value  := QryCOINCRE.FieldByName('IMP_IO_DEV').AsFloat;
        vgExcelApp.Cells[ vlRow , ColumnXlS('U') ].Value  := QryCOINCRE.FieldByName('ID_OLTP_PRODUCTO').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('V') ].Value  := QryCOINCRE.FieldByName('PRODUCTO').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('W') ].Value  := QryCOINCRE.FieldByName('CVE_CTA_CONTABLE').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('X') ].Value  := QryCOINCRE.FieldByName('F_INICIO').AsDateTime;
        vgExcelApp.Cells[ vlRow , ColumnXlS('Y') ].Value  := QryCOINCRE.FieldByName('F_VENTTO').AsDateTime;
        vgExcelApp.Cells[ vlRow , ColumnXlS('Z') ].Value  := QryCOINCRE.FieldByName('DESC_CAT_MINIMO').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AA') ].Value  := QryCOINCRE.FieldByName('CVE_CAT_MINIMO').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AB') ].Value := QryCOINCRE.FieldByName('MERC_OBJ_DET').AsString;
{ROIM}  vgExcelApp.Cells[ vlRow , ColumnXlS('AC') ].Value  := QryCOINCRE.FieldByName('CVE_TIPO_SECTOR').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AD') ].Value := QryCOINCRE.FieldByName('CTA_K_VIG').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AE') ].Value := QryCOINCRE.FieldByName('CTA_K_IMP').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AF') ].Value := QryCOINCRE.FieldByName('CTA_K_VEN_EX').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AG') ].Value := QryCOINCRE.FieldByName('CTA_K_VEN_NE').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AH') ].Value := QryCOINCRE.FieldByName('CTA_I_VIG').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AI') ].Value := QryCOINCRE.FieldByName('CTA_I_IMP').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AJ') ].Value := QryCOINCRE.FieldByName('CTA_I_VEN_EX').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AK') ].Value := QryCOINCRE.FieldByName('CTA_I_COB_XANT').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AL') ].Value := QryCOINCRE.FieldByName('B_ACREDITADO_REL').AsString;
/// RABA ENE 2012
        vgExcelApp.Cells[ vlRow , ColumnXlS('AM') ].Value := QryCOINCRE.FieldByName('CTA_K_VIG_SAP').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AN') ].Value := QryCOINCRE.FieldByName('CTA_K_IMP_SAP').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AO') ].Value := QryCOINCRE.FieldByName('CTA_K_VEN_EX_SAP').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AP') ].Value := QryCOINCRE.FieldByName('CTA_K_VEN_NE_SAP').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AQ') ].Value := QryCOINCRE.FieldByName('CTA_I_VIG_SAP').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AR') ].Value := QryCOINCRE.FieldByName('CTA_I_IMP_SAP').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AS') ].Value := QryCOINCRE.FieldByName('CTA_I_VEN_EX_SAP').AsString;
        vgExcelApp.Cells[ vlRow , ColumnXlS('AT') ].Value := QryCOINCRE.FieldByName('CTA_I_COB_XANT_SAP').AsString;
// FIN RABA

        Application.ProcessMessages;
        ProgressBar.Position := vlRow;
        Inc(vlRow);
        QryCOINCRE.Next;
        End;

       //-----------------------------------------------
       //         INICIA FORMATOS DE CELDAS
       //-----------------------------------------------
       //

       // ShowMessage(Format('Excel Version %s: ', [vgExcelApp.Version]));

       // Modifica el tamaño de la fuente
       vlColumnRange := vgExcelApp.Workbooks[1].WorkSheets[1].Columns;
       For vlCol := 1 To 50 Do
         Begin
         vlColumnRange.Columns[vlCol].Font.Size := 8;
         End;

       // Colocación de colores de banda de titulos
// RABA ENE 2012       
//       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['A1:AA1'];
       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['A1:AT1'];
       vlRange.Font.FontStyle := 'Bold';
       vlRange.Font.Color := clWhite;
       vlRange.Columns.Interior.ColorIndex := 1; // Negro

       // Colocación de colores de columnas

       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['J1:J'+IntToStr(vlRow-1)];
       vlRange.NumberFormat := '#,##0.00';

       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['L1:O'+IntToStr(vlRow-1)];
       vlRange.Columns.Interior.ColorIndex := 37; // Azul Tenue
       vlRange.NumberFormat := '#,##0.00';
       vlRange.Font.Color := clBlack;

       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['P1:R'+IntToStr(vlRow-1)];
       vlRange.Columns.Interior.ColorIndex := 34; // Azul Cielo
       vlRange.NumberFormat := '#,##0.00';
       vlRange.Font.Color := clBlack;

       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['S1:S'+IntToStr(vlRow-1)];
       vlRange.NumberFormat := '#,##0.00';

       vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['T1:T'+IntToStr(vlRow-1)];
       vlRange.Columns.Interior.ColorIndex := 16; // Gris Oscuro
       vlRange.NumberFormat := '#,##0.00';
       vlRange.Font.Color := clBlack;

       For vlCol := 1 To 50 Do
         Begin
         vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range[IntToColumnXlS(vlCol)+'1:'+IntToColumnXlS(vlCol)+'1'];
         vlRange.WrapText := True;
         End;

      { For vlRow := 25 To 200 Do
         Begin
         vlstrRow := IntToStr(vlRow - 24);
         vlRange := vgExcelApp.Workbooks[1].WorkSheets[vlStrHoja].Range['AE'+vlstrRow+':AF'+vlstrRow];
         vlRange.Columns.Interior.ColorIndex := vlRow - 24;
         End; }
       //vlRange.WrapText := True;

    Finally
     HabilitaControles(True);
     vgExcelApp.ActiveWorkBook.SaveAs(peFileName);
     CloseExcelFile(vgExcelApp);
     Result := True;
    End;
end;

procedure TWCrCoincR.HabilitaControles(pebHabilita: Boolean);
begin
  dtpF_CIERRE.Enabled := pebHabilita;
  btMuestraDatos.Enabled := pebHabilita;
  dsrcCOINCRE.Enabled := pebHabilita;
  edFileNameXLS.Enabled := pebHabilita;
  btnSaveFileName.Enabled := pebHabilita;
  btnGeneraArchivo.Enabled := pebHabilita;
end;

procedure TWCrCoincR.edFileNameXLSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 Then btnGeneraArchivoClick(Self);
end;

procedure TWCrCoincR.ActualizaConsulta;
var wYear, wMonth, wDay : Word;
begin
  DecodeDate(dtpF_CIERRE.Date, wYear, wMonth, wDay);

  If (Objeto.vgMonth = 0) Then
    Objeto.vgMonth := wMonth;

  If (Objeto.vgMonth <> wMonth) Then
    Begin
    If QryCOINCRE.Active Then QryCOINCRE.Close;
    Objeto.vgMonth := wMonth;
    End;

  lblFuenteDatos.Caption := 'Consolidado de Adeudos';
  If (dtpF_CIERRE.Date = LastDay(dtpF_CIERRE.Date)) Then
    // Válida si la carga de COINCRE ya concluyo
    If (BCargaCOINCREConcluida(Objeto.Apli, wYear, wMonth)) Then
      lblFuenteDatos.Caption := 'COINCRE';
end;

procedure TWCrCoincR.dtpF_CIERRECloseUp(Sender: TObject);
begin
 ActualizaConsulta; 
end;

end.
