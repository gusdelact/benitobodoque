// Sistema         : Clase de MQrCoCo
// Fecha de Inicio : 07/03/2006
// Función forma   : Clase de MQrCoCo
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// REDiseñado y mejorado por : Victor Hugo Santillán Trejo
// Comentarios     : V20130612
Unit IntMQrCoCo;
                     
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

ShellApi,
IntParamCre,
InterApl,
IntGenCre, IntSGCtrl;

Type
 TMQrCoCo= class;

  TWMqrcoco=Class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Bevel1: TBevel;
    sbtnExcel: TSpeedButton;
    rgTipoReporte: TRadioGroup;
    cbMes: TComboBox;
    cbAnio: TComboBox;
    rgTipoCar: TRadioGroup;
    cbGenArchExcel: TCheckBox;
    cbArchivoQry: TCheckBox;
    btnArchivoQry: TBitBtn;
    edArchivoQry: TEdit;
    edRuta: TEdit;
    grbxCapital: TGroupBox;
    chkbxK_VIG: TCheckBox;
    chkbxK_VEN: TCheckBox;
    chkbxK_IMP: TCheckBox;
    grbxInteres: TGroupBox;
    Label2: TLabel;
    chkbxI_VIG: TCheckBox;
    chkbxI_VEN: TCheckBox;
    chkbxI_IMP: TCheckBox;
    cbGenerarArchCont: TCheckBox;
    cbFechaEspecifica: TCheckBox;
    dtpFechaEspecifica: TDateTimePicker;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    BContaIcre2: TCheckBox;
    cbContaIcreN: TCheckBox;
    cbContaIcreNRE: TCheckBox;
    InterForma1: TInterForma;
    SaveDialog1: TSaveDialog;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    SGClBusMovNoAut: TSGCtrl;
    SGClBusMovNoAutDet: TSGCtrl;
    BitBtn1: TBitBtn;
    Query1: TQuery;
    dtpFechaConciliador: TDateTimePicker;
    Label3: TLabel;
    SGClBusMovNoAutDet2: TSGCtrl;
    RGDet2: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Imprimir(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
//    Procedure CargaCoincre;
    procedure sbtnExcelClick(Sender: TObject);
    procedure cbGenArchExcelClick(Sender: TObject);
    procedure GeneraNomArch;
    procedure btnArchivoQryClick(Sender: TObject);
    procedure cbArchivoQryClick(Sender: TObject);
    procedure rgTipoCarClick(Sender: TObject);
    procedure chkbxK_VIGClick(Sender: TObject);
    procedure cbFechaEspecificaClick(Sender: TObject);
    procedure rgTipoReporteClick(Sender: TObject);
    procedure dtpFechaEspecificaChange(Sender: TObject);
    procedure BContaIcre2Click(Sender: TObject);
    procedure cbContaIcreNClick(Sender: TObject);
    procedure cbContaIcreNREClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SGClBusMovNoAutDblClick(Sender: TObject);
    procedure SGClBusMovNoAutDetDblClick(Sender: TObject);
    procedure RGDet2Click(Sender: TObject);
    procedure dtpFechaConciliadorChange(Sender: TObject);
    procedure cbMesChange(Sender: TObject);
    procedure cbAnioChange(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TMQrCoCo;
    vgRuta : String;
    vgBAplicaChkbx : Boolean;

     procedure MuestraReporte(peBPreview : Boolean);
     procedure MuestraControlesQry;
     procedure HabilitaCtrlFecha(pebHabilita: Boolean);
     procedure HabilitaCtrlsFechaEsp(pebHabilita : Boolean);
     procedure HabilitaCtrlAnioMes(pebHabilita: Boolean);

     Procedure   ArmaCadenaSQLCuotas;
     Procedure   ReQueryCuotas;

     Procedure   ArmaCadenaSQLCuotasDet;
     Procedure   ReQueryCuotasDet;

     Procedure   ArmaCadenaSQLCuotasDet2;
     Procedure   ReQueryCuotasDet2;

     Function ObtieneFecha(pMes, pAnio : Integer) : TDateTime;
end;
 TMQrCoCo= class(TInterFrame)
      private

      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }

        ParamCre                 : TParamCre;
        CadenaSql                : String;
        CadenaSqlDet             : String;
        CadenaSqlDet2            : String;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

        Function    DameNoMes(PEMes : String) : Integer;                                               
        Function    DameMes(PENoMes : Integer) : String;
      published

      end;

function BCargaCOINCREConcluida(peApli : TInterApli; peANIO, peMES : Integer) : Boolean;

function DirRepDigitalizados(peApli : TInterApli) : String;

function ObtenIdAnioMes(peApli : TInterApli; peANIO, peMES : Integer) : Integer;

implementation

uses IntQrCoCo, IntQrCoCd, IntQrCoCS, IntQrCoCN;
{$R *.DFM}

function BCargaCOINCREConcluida(peApli : TInterApli; peANIO, peMES : Integer) : Boolean;
var vlSQL : String;
    vlnTOTAL : Integer;
begin                                                             
   Result := False;
   vlSQL := ' SELECT COUNT(*) AS TOTAL'+coCRLF+
            ' FROM RPT_REG_DET_CAT R'+coCRLF+
            ' WHERE ID_EMPRESA = 2'+coCRLF+
            '   AND ID_GRUPO IN ( SELECT R.ID_GRUPO'+coCRLF+
            '                     FROM RPT_REG_GPO_CAT R'+coCRLF+
            '                     WHERE ID_EMPRESA = 2'+coCRLF+
            '                       AND GRUPO = ''COINCRE_CARGA_FINALIZADA'')'+coCRLF+
            '   AND CVE_CLAVE = TO_CHAR(TO_DATE(''01/'+IntToStr(PEMes)+'/'+IntToStr(PEAnio)+''',''DD/MM/YYYY''),''YYYYMM'')'+coCRLF;

   If GetSQLInt(vlSQL, peApli.DatabaseName, peApli.SessionName, 'TOTAL', vlnTOTAL, True) Then
      Result := vlnTOTAL > 0; // Si encontro información de que había finalizado la carga de COINCRE, entonces...
end;

function DirRepDigitalizados(peApli : TInterApli) : String;
var vlSQL, vlDirDEFAULT, vlDIRECTORIO : String;
begin
   vlDirDEFAULT := '\\Inter25\Corp\Delphide\ICre01\FuentesCOINCRE\RepDigit\';

   vlSQL := ' SELECT DESC_CLAVE AS DIRECTORIO'+coCRLF+
            ' FROM RPT_REG_DET_CAT R'+coCRLF+
            ' WHERE ID_EMPRESA = 2'+coCRLF+
            '   AND ID_GRUPO IN ( SELECT R.ID_GRUPO FROM RPT_REG_GPO_CAT R'+coCRLF+
            '                     WHERE ID_EMPRESA = 2'+coCRLF+
            '                       AND GRUPO = ''COINCRE_PATH_DIGITALIZADOS'')'+coCRLF
            ;
   If GetSQLStr(vlSQL, peApli.DatabaseName, peApli.SessionName, 'DIRECTORIO', vlDIRECTORIO, True) Then
      Result := IncludeTrailingBackslash(vlDIRECTORIO)
   Else
      Result := IncludeTrailingBackslash(vlDirDEFAULT);
end;


function ObtenIdAnioMes(peApli : TInterApli; peANIO, peMES : Integer) : Integer;
var vlSQL : String;
    vlID_ANIO_MES : Integer;
begin
  Result := -1;
  vlSQL := ' SELECT ID_ANIO_MES'+coCRLF+
           ' FROM DM_CR_DIM_MES@DWHC'+coCRLF+
           ' WHERE NUM_MES = '+IntToStr(peMES)+coCRLF+
           '   AND ANIO = '+IntToStr(peANIO)+coCRLF;
  If GetSQLInt(vlSQL, peApli.DataBaseName, peApli.SessionName, 'ID_ANIO_MES', vlID_ANIO_MES, True) Then
     Result := vlID_ANIO_MES;
end;

constructor TMQrCoCo.Create( AOwner : TComponent );
begin Inherited;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMQrCoCo.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMQrCoCo.Destroy;
begin inherited;
end;


function TMQrCoCo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMqrcoco;
begin
   W:=TWMqrcoco.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.MuestraControlesQry;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TMQrCoCo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IMqrcoco.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

Function    TMQrCoCo.DameNoMes(PEMes : String) : Integer;
var   VLNoMes : Integer;
begin
   VLNoMes := 0;
   if PEMes = 'Enero'           then    VLNoMes := 1
   else if PEMes = 'Febrero'    then    VLNoMes := 2
   else if PEMes = 'Marzo'      then    VLNoMes := 3
   else if PEMes = 'Abril'      then    VLNoMes := 4
   else if PEMes = 'Mayo'       then    VLNoMes := 5
   else if PEMes = 'Junio'      then    VLNoMes := 6
   else if PEMes = 'Julio'      then    VLNoMes := 7
   else if PEMes = 'Agosto'     then    VLNoMes := 8
   else if PEMes = 'Septiembre' then    VLNoMes := 9
   else if PEMes = 'Octubre'    then    VLNoMes := 10
   else if PEMes = 'Noviembre'  then    VLNoMes := 11
   else if PEMes = 'Diciembre'  then    VLNoMes := 12;
   //end if;
   DameNoMes := VLNoMes;
end;

Function    TMQrCoCo.DameMes(PENoMes : Integer) : String;
var   VLMes : String;
begin
     if PENoMes =  1      then    VLMes := 'Enero'
     else if PENoMes =  2 then    VLMes := 'Febrero'
     else if PENoMes =  3 then    VLMes := 'Marzo'
     else if PENoMes =  4 then    VLMes := 'Abril'
     else if PENoMes =  5 then    VLMes := 'Mayo'
     else if PENoMes =  6 then    VLMes := 'Junio'
     else if PENoMes =  7 then    VLMes := 'Julio'
     else if PENoMes =  8 then    VLMes := 'Agosto'
     else if PENoMes =  9 then    VLMes := 'Septiembre'
     else if PENoMes =  10 then    VLMes := 'Octubre'
     else if PENoMes =  11 then    VLMes := 'Noviembre'
     else if PENoMes =  12 then    VLMes := 'Diciembre';
     //end if;

     DameMes := VLMes;
end;



(***********************************************FORMA MQrCoCo********************)
(*                                                                              *)
(*  FORMA DE MQrCoCo                                                            *)
(*                                                                              *)
(***********************************************FORMA MQrCoCo********************)

Procedure  TWMqrcoco.ArmaCadenaSQLCuotas;
begin

     Objeto.CadenaSql :=

     ' SELECT ACUCONSOL.CVE_MONEDA,ACUCONSOL.MONEDA,ACUCONSOL.ORIGEN,ACUCONSOL.TIPO_CUENTA,ACUCONSOL.SEGMENTO, '+coCRLF+
     '        ACUCONSOL.SDO_COINCRE, SDOINI.IMPORTE, ACUCONSOL.CVE_CTA_CONTABLE, '+coCRLF+
     '        ACUCONSOL.NOMBRE_PROD, ACUCONSOL.CVE_SECTOR, ACUCONSOL.DESC_SECTOR, ACUCONSOL.ID_METRICA, ACUCONSOL.CVE_TIPO_CTA,  ' + coCRLF +
     '        CASE WHEN ACUCONSOL.SEGMENTO = '+#39+ '2.1 VIGENTE ICXA'+#39+'  THEN ACUCONSOL.SDO_COINCRE + SDOINI.IMPORTE ELSE ACUCONSOL.SDO_COINCRE - SDOINI.IMPORTE END AS DIFERENCIA '+coCRLF+
     ' FROM (SELECT CONSOL.CVE_MONEDA,CONSOL.MONEDA,CONSOL.ORIGEN,CONSOL.TIPO_CUENTA,CONSOL.SEGMENTO, '+coCRLF+
     '              CONSOL.SDO_FIN_PER,SUM(CONSOL.SDO_COINCRE) AS SDO_COINCRE, CONSOL.CVE_CTA_CONTABLE, '+coCRLF+
     '              CONSOL.NOMBRE_PROD, CONSOL.CVE_SECTOR, CONSOL.DESC_SECTOR, CONSOL.ID_METRICA, CONSOL.CVE_TIPO_CTA '+coCRLF+
     '       FROM ( '+coCRLF+
     '             ------------- CAPITAL VIGENTE E IMPAGADO '+coCRLF+
     '             SELECT CONS.MONEDA AS CVE_MONEDA,CONS.CVE_MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN,'+#39+'1 CARTERA DE CREDITO'+#39+' AS TIPO_CUENTA,'+#39+'1.1 VIGENTE'+#39+' AS SEGMENTO, '+coCRLF+
     '                    0 AS SDO_FIN_PER,SUM(CONS.IMP_CAP_VIG * -1) as SDO_COINCRE,TO_CHAR(CONS.CVE_PRODUCTO_CRE) AS CVE_CTA_CONTABLE, '+coCRLF+
     '                    CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA, '+#39+'SIN RESTRICCION'+#39+' AS CVE_TIPO_CTA '+coCRLF+
     '             FROM  (SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
     '                            CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA, '+coCRLF+
     '                            NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_CAP_VIG, '+coCRLF+
     '                            NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE , '+coCRLF+
     '                            NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO, '+coCRLF+
     '                            NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE, '+coCRLF+
     '                            NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR '+coCRLF+
     '                    FROM  (SELECT ID_CREDITO, IMP_CAP_VIG + IMP_CAP_IMP AS IMP_CAP_VIG FROM CR_CON_ADEUDO_SDO WHERE F_CIERRE = LAST_DAY(ADD_MONTHS( TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+'), -1))  ) CR_SDO, '+coCRLF+
     '                           MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE, '+coCRLF+
     '                           CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2 '+coCRLF+
     '                    WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO '+coCRLF+
     '                    AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO '+coCRLF+
     '                    AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA '+coCRLF+
     '                    AND    P2.ID_PERSONA           (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR '+coCRLF+
     '                    AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA          AND    P.ID_PERSONA          (+)= C.ID_TITULAR '+coCRLF+
     '                    AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS, '+coCRLF+
     '                   (SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
     '                    FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
     '                           CR_CONT_CVES_GUIA CCCG '+coCRLF+
     '                    WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
     '                    AND    CCCG.CVE_TIPO_CTA = '+#39+'SR'+#39+' '+coCRLF+
     '                    AND    CCCG.CVE_CUENTA = '+#39+'SIPAVE'+#39+' '+coCRLF+
     '                   ) METRICA '+coCRLF+
     '             WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE '+coCRLF+
     '             AND   CONS.CVE_MONEDA    <> '+#39+'UDIS'+#39+' '+coCRLF+
     '             AND   CONS.IMP_CAP_VIG   <> 0 '+coCRLF+
     '             GROUP BY CONS.CVE_MONEDA,CONS.MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR, CONS.DESC_SECTOR, METRICA.ID_METRICA '+coCRLF+
     '             UNION ALL '+coCRLF+
     '             SELECT CONS.MONEDA AS CVE_MONEDA,CONS.CVE_MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN,'+#39+'1 CARTERA DE CREDITO'+#39+' AS TIPO_CUENTA,'+#39+'1.1 VIGENTE'+#39+' AS SEGMENTO, '+coCRLF+
     '                    0 AS SDO_FIN_PER,SUM(CONS.IMP_CAP_VIG) as SDO_COINCRE,TO_CHAR(CONS.CVE_PRODUCTO_CRE) AS CVE_CTA_CONTABLE, '+coCRLF+
     '                    CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA, '+#39+'SIN RESTRICCION'+#39+' AS CVE_TIPO_CTA '+coCRLF+
     '             FROM  (SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
     '                            CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA, '+coCRLF+
     '                            NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_CAP_VIG, '+coCRLF+
     '                            NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE , '+coCRLF+
     '                            NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO, '+coCRLF+
     '                            NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE, '+coCRLF+
     '                            NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR '+coCRLF+
     '                    FROM  (SELECT ID_CREDITO, IMP_CAP_VIG + IMP_CAP_IMP AS IMP_CAP_VIG  FROM CR_CON_ADEUDO_SDO WHERE F_CIERRE =  TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+')) CR_SDO, '+coCRLF+
     '                           MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE, '+coCRLF+
     '                           CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2 '+coCRLF+
     '                    WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO '+coCRLF+
     '                    AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO '+coCRLF+
     '                    AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA '+coCRLF+
     '                    AND    P2.ID_PERSONA           (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR '+coCRLF+
     '                    AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA          AND    P.ID_PERSONA          (+)= C.ID_TITULAR '+coCRLF+
     '                    AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS, '+coCRLF+
     '                   (SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
     '                    FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
     '                           CR_CONT_CVES_GUIA CCCG '+coCRLF+
     '                    WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
     '                    AND    CCCG.CVE_TIPO_CTA = '+#39+'SR'+#39+' '+coCRLF+
     '                    AND    CCCG.CVE_CUENTA = '+#39+'SIPAVE'+#39+' '+coCRLF+
     '                   ) METRICA '+coCRLF+
     '             WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE '+coCRLF+
     '             AND   CONS.CVE_MONEDA    <> '+#39+'UDIS'+#39+' '+coCRLF+
     '             AND   CONS.IMP_CAP_VIG   <> 0 '+coCRLF+
     '             GROUP BY CONS.CVE_MONEDA,CONS.MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR, CONS.DESC_SECTOR, METRICA.ID_METRICA '+coCRLF+
     '             UNION ALL '+coCRLF+
     '             ------------- CAPITAL VENCIDO '+coCRLF+
     '             SELECT CONS.MONEDA AS CVE_MONEDA,CONS.CVE_MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN,'+#39+'1 CARTERA DE CREDITO'+#39+' AS TIPO_CUENTA,'+#39+'1.2 VENCIDO'+#39+' AS SEGMENTO, '+coCRLF+
     '                    0 AS SDO_FIN_PER,(SUM(CONS.IMP_CAP_VDO * -1)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
     '                    CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA, '+#39+'SIN RESTRICCION'+#39+' AS CVE_TIPO_CTA '+coCRLF+
     '             FROM  (SELECT NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
     '                           CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA, '+coCRLF+
     '                           NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_CAP_VDO, '+coCRLF+
     '                           NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE , '+coCRLF+
     '                           NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO, '+coCRLF+
     '                           NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE, '+coCRLF+
     '                           NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR '+coCRLF+
     '                    FROM  (SELECT ID_CREDITO, IMP_CAP_VDO_EX + IMP_CAP_VDO_NE AS IMP_CAP_VDO FROM CR_CON_ADEUDO_SDO WHERE F_CIERRE = LAST_DAY(ADD_MONTHS(  TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+') , -1)) ) CR_SDO, '+coCRLF+
     '                           MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE, '+coCRLF+
     '                           CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2 '+coCRLF+
     '                    WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO '+coCRLF+
     '                    AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO '+coCRLF+
     '                    AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA '+coCRLF+
     '                    AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR '+coCRLF+
     '                    AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR '+coCRLF+
     '                    AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS, '+coCRLF+
     '                   (SELECT DISTINCT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
     '                    FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
     '                           CR_CONT_CVES_GUIA CCCG '+coCRLF+
     '                    WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
     ' 	               AND    CCCG.CVE_CUENTA  IN ('+#39+'CAVE'+#39+','+#39+'CAVENE'+#39+') '+coCRLF+
     '                    AND    CCCG.CVE_TIPO_CTA = '+#39+'SR'+#39+' '+coCRLF+
     '                   ) METRICA '+coCRLF+
     '             WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE '+coCRLF+
     '             AND CONS.CVE_MONEDA          <> '+#39+'UDIS'+#39+' '+coCRLF+
     '             AND CONS.IMP_CAP_VDO         <> 0 '+coCRLF+
     '             GROUP BY CONS.CVE_MONEDA,CONS.MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA '+coCRLF+
     '             UNION ALL '+coCRLF+
     '             SELECT CONS.MONEDA AS CVE_MONEDA,CONS.CVE_MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN,'+#39+'1 CARTERA DE CREDITO'+#39+' AS TIPO_CUENTA,'+#39+'1.2 VENCIDO'+#39+' AS SEGMENTO, '+coCRLF+
     '                    0 AS SDO_FIN_PER,(SUM(CONS.IMP_CAP_VDO)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
     '                    CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA, '+#39+'SIN RESTRICCION'+#39+' AS CVE_TIPO_CTA '+coCRLF+
     '             FROM  (SELECT NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
     '                           CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA, '+coCRLF+
     '                           NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_CAP_VDO, '+coCRLF+
     '                           NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE , '+coCRLF+
     '                           NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO, '+coCRLF+
     '                           NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE, '+coCRLF+
     '                           NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR '+coCRLF+
     '                    FROM  (SELECT ID_CREDITO, IMP_CAP_VDO_EX + IMP_CAP_VDO_NE AS IMP_CAP_VDO FROM CR_CON_ADEUDO_SDO WHERE F_CIERRE =  TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+')) CR_SDO, '+coCRLF+
     '                           MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE, '+coCRLF+
     '                           CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2 '+coCRLF+
     '                    WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO '+coCRLF+
     '                    AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO '+coCRLF+
     '                    AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA '+coCRLF+
     '                    AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR '+coCRLF+
     '                    AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR '+coCRLF+
     '                    AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS, '+coCRLF+
     '                   (SELECT DISTINCT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
     '                    FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
     '                           CR_CONT_CVES_GUIA CCCG '+coCRLF+
     '                    WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
     ' 	                  AND    CCCG.CVE_CUENTA  IN ('+#39+'CAVE'+#39+','+#39+'CAVENE'+#39+') '+coCRLF+
     '                    AND    CCCG.CVE_TIPO_CTA = '+#39+'SR'+#39+' '+coCRLF+
     '                   ) METRICA '+coCRLF+
     '             WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE '+coCRLF+
     '             AND CONS.CVE_MONEDA          <> '+#39+'UDIS'+#39+' '+coCRLF+
     '             AND CONS.IMP_CAP_VDO         <> 0 '+coCRLF+
     '             GROUP BY CONS.CVE_MONEDA,CONS.MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA '+coCRLF+
     '             UNION ALL '+coCRLF+
     '             ------------- INTERES COBRADOS POR ANTICIPADO '+coCRLF+
     '             SELECT CONS.MONEDA AS CVE_MONEDA,CONS.CVE_MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN,'+#39+'2 INTERES COBRADO POR ANTICIPADO'+#39+' AS TIPO_CUENTA,'+#39+'2.1 VIGENTE ICXA'+#39+' AS SEGMENTO, '+coCRLF+
     '                    0 AS SDO_FIN_PER,(SUM(CONS.IMP_PRE_DEVENGAR  * -1)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
     '                    CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA, '+#39+'SIN RESTRICCION'+#39+' AS CVE_TIPO_CTA '+coCRLF+
     '             FROM  (SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
     '                            CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA, '+coCRLF+
     '                            NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_PRE_DEVENGAR, '+coCRLF+
     '                            NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE , '+coCRLF+
     '                            NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO, '+coCRLF+
     '                            NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE, '+coCRLF+
     '                            NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR '+coCRLF+
     '                    FROM   (SELECT ID_CREDITO, IMP_PRE_DEVENGAR  FROM CRE_PROV_DIARIA WHERE   IMP_PRE_DEVENGAR > 0 '+coCRLF+
     '                            AND  F_PROVISION = LAST_DAY(ADD_MONTHS(  TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+') , -1))) CR_SDO, '+coCRLF+
     '                            MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE, '+coCRLF+
     '                            CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2 '+coCRLF+
     '                    WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO '+coCRLF+
     '                    AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO '+coCRLF+
     '                    AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA '+coCRLF+
     '                    AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR '+coCRLF+
     '                    AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR '+coCRLF+
     '                    AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS, '+coCRLF+
     '                   (SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
     '                    FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
     '                           CR_CONT_CVES_GUIA CCCG '+coCRLF+
     '                    WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
     '                    AND    CCCG.CVE_CUENTA = '+#39+'INCOAN'+#39+' '+coCRLF+
     '                    AND    CCCG.CVE_TIPO_CTA = '+#39+'SR'+#39+' '+coCRLF+
     '                   ) METRICA '+coCRLF+
     '             WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE '+coCRLF+
     '             AND CONS.CVE_MONEDA    <> '+#39+'UDIS'+#39+' '+coCRLF+
     '             AND CONS.IMP_PRE_DEVENGAR  <> 0 '+coCRLF+
     '             GROUP BY  CONS.CVE_MONEDA,CONS.MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA '+coCRLF+
     '             UNION ALL '+coCRLF+
     '             SELECT CONS.MONEDA AS CVE_MONEDA,CONS.CVE_MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN,'+#39+'2 INTERES COBRADO POR ANTICIPADO'+#39+' AS TIPO_CUENTA,'+#39+'2.1 VIGENTE ICXA'+#39+' AS SEGMENTO, '+coCRLF+
     '                    0 AS SDO_FIN_PER,(SUM(CONS.IMP_PRE_DEVENGAR)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
     '                    CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA, '+#39+'SIN RESTRICCION'+#39+' AS CVE_TIPO_CTA '+coCRLF+
     '             FROM  (SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
     '                            CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA, '+coCRLF+
     '                            NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_PRE_DEVENGAR, '+coCRLF+
     '                            NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE , '+coCRLF+
     '                            NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO, '+coCRLF+
     '                            NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE, '+coCRLF+
     '                            NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR '+coCRLF+
     '                    FROM   (SELECT ID_CREDITO, IMP_PRE_DEVENGAR  FROM CRE_PROV_DIARIA WHERE   IMP_PRE_DEVENGAR > 0 '+coCRLF+
     '                            AND  F_PROVISION =  TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+')) CR_SDO, '+coCRLF+
     '                            MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE, '+coCRLF+
     '                            CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2 '+coCRLF+
     '                    WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO '+coCRLF+
     '                    AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO '+coCRLF+
     '                    AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA '+coCRLF+
     '                    AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR '+coCRLF+
     '                    AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR '+coCRLF+
     '                    AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS, '+coCRLF+
     '                   (SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
     '                    FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
     '                           CR_CONT_CVES_GUIA CCCG '+coCRLF+
     '                    WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
     '                    AND    CCCG.CVE_CUENTA = '+#39+'INCOAN'+#39+' '+coCRLF+
     '                    AND    CCCG.CVE_TIPO_CTA = '+#39+'SR'+#39+' '+coCRLF+
     '                   ) METRICA '+coCRLF+
     '             WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE '+coCRLF+
     '             AND CONS.CVE_MONEDA    <> '+#39+'UDIS'+#39+' '+coCRLF+
     '             AND CONS.IMP_PRE_DEVENGAR  <> 0 '+coCRLF+
     '             GROUP BY  CONS.CVE_MONEDA,CONS.MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA '+coCRLF+
     '             UNION ALL '+coCRLF+
     '             ------------- INTERES VENCIDO '+coCRLF+
     '             SELECT CONS.MONEDA AS CVE_MONEDA,CONS.CVE_MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN,'+#39+'1 CARTERA DE CREDITO'+#39+' AS TIPO_CUENTA,'+#39+'1.2 VENCIDO I'+#39+' AS SEGMENTO, '+coCRLF+
     '                    0 AS SDO_FIN_PER,(SUM(CONS.IMP_INT_VDO_EX * - 1)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
     '                    CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA, '+#39+'SIN RESTRICCION'+#39+' AS CVE_TIPO_CTA '+coCRLF+
     '             FROM  (SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
     '                            CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA, '+coCRLF+
     '                            NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_INT_VDO_EX, CR_SDO.IMP_INT_VDO_NE, '+coCRLF+
     '                            NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE , '+coCRLF+
     '                            NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO, '+coCRLF+
     '                            NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE, '+coCRLF+
     '                            NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR '+coCRLF+
     '                    FROM  (SELECT ID_CREDITO,  IMP_INT_VDO_EX, IMP_INT_VDO_NE  FROM CR_CON_ADEUDO_SDO WHERE F_CIERRE = LAST_DAY(ADD_MONTHS( TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+'), -1)) ) CR_SDO, '+coCRLF+
     '                           MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE, '+coCRLF+
     '                           CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2 '+coCRLF+
     '                    WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO '+coCRLF+
     '                    AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO '+coCRLF+
     '                    AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA '+coCRLF+
     '                    AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR '+coCRLF+
     '                    AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR '+coCRLF+
     '                    AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS, '+coCRLF+
     '                   (SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
     '                    FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
     '                           CR_CONT_CVES_GUIA CCCG '+coCRLF+
     '                    WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
     '            	  AND    CCCG.CVE_CUENTA = '+#39+'INVE'+#39+' '+coCRLF+
     '                    AND    CCCG.CVE_TIPO_CTA = '+#39+'SR'+#39+' '+coCRLF+
     '                    ) METRICA '+coCRLF+
     '             WHERE   METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE '+coCRLF+
     '               AND   CONS.CVE_MONEDA 	     <> '+#39+'UDIS'+#39+' '+coCRLF+
     '               AND   CONS.IMP_INT_VDO_EX    <> 0 '+coCRLF+
     '             GROUP BY CONS.CVE_MONEDA,CONS.MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA '+coCRLF+
     '             UNION ALL '+coCRLF+
     '             SELECT CONS.MONEDA AS CVE_MONEDA,CONS.CVE_MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN,'+#39+'1 CARTERA DE CREDITO'+#39+' AS TIPO_CUENTA,'+#39+'1.2 VENCIDO I'+#39+' AS SEGMENTO, '+coCRLF+
     '                    0 AS SDO_FIN_PER,(SUM(CONS.IMP_INT_VDO_EX)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
     '                    CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA, '+#39+'SIN RESTRICCION'+#39+' AS CVE_TIPO_CTA '+coCRLF+
     '             FROM  (SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
     '                            CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA, '+coCRLF+
     '                            NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_INT_VDO_EX, CR_SDO.IMP_INT_VDO_NE, '+coCRLF+
     '                            NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE , '+coCRLF+
     '                            NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO, '+coCRLF+
     '                            NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE, '+coCRLF+
     '                            NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR '+coCRLF+
     '                    FROM  (SELECT ID_CREDITO,  IMP_INT_VDO_EX, IMP_INT_VDO_NE  FROM CR_CON_ADEUDO_SDO WHERE F_CIERRE =  TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+')) CR_SDO, '+coCRLF+
     '                           MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE, '+coCRLF+
     '                           CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2 '+coCRLF+
     '                    WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO '+coCRLF+
     '                    AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO '+coCRLF+
     '                    AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA '+coCRLF+
     '                    AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR '+coCRLF+
     '                    AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR '+coCRLF+
     '                    AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS, '+coCRLF+
     '                   (SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
     '                    FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
     '                           CR_CONT_CVES_GUIA CCCG '+coCRLF+
     '                    WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
     '            	  AND    CCCG.CVE_CUENTA = '+#39+'INVE'+#39+' '+coCRLF+
     '                    AND    CCCG.CVE_TIPO_CTA = '+#39+'SR'+#39+' '+coCRLF+
     '                    ) METRICA '+coCRLF+
     '             WHERE   METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE '+coCRLF+
     '               AND   CONS.CVE_MONEDA 	     <> '+#39+'UDIS'+#39+' '+coCRLF+
     '               AND   CONS.IMP_INT_VDO_EX    <> 0 '+coCRLF+
     '             GROUP BY CONS.CVE_MONEDA,CONS.MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA '+coCRLF+

     '             UNION ALL '+coCRLF+
     '             ------------- INTERES VIGENTE  E IMPAGADO '+coCRLF+
     '             SELECT CONS.MONEDA AS CVE_MONEDA,CONS.CVE_MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN,'+#39+'1 CARTERA DE CREDITO'+#39+' AS TIPO_CUENTA,'+#39+'1.1 VIGENTE I'+#39+' AS SEGMENTO, '+coCRLF+
     '                    0 AS SDO_FIN_PER,(SUM(CONS.IMP_INT_VIG  * -1)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
     '                    CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA, '+#39+'SIN RESTRICCION'+#39+' AS CVE_TIPO_CTA '+coCRLF+
     '             FROM  (SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
     '                            CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA, '+coCRLF+
     '                            NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_INT_VIG, '+coCRLF+
     '                            NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE , '+coCRLF+
     '                            NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO, '+coCRLF+
     '                            NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE, '+coCRLF+
     '                            NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR '+coCRLF+
     '                    FROM  (SELECT ID_CREDITO, IMP_INT_VIG + IMP_INT_IMP AS IMP_INT_VIG  FROM CR_CON_ADEUDO_SDO WHERE F_CIERRE = LAST_DAY(ADD_MONTHS( TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+'), -1)) ) CR_SDO, '+coCRLF+
     '                           MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE, '+coCRLF+
     '                           CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2 '+coCRLF+
     '                    WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO '+coCRLF+
     '                    AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO '+coCRLF+
     '                    AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA '+coCRLF+
     '                    AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR '+coCRLF+
     '                    AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR '+coCRLF+
     '                    AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS, '+coCRLF+
     '                   (SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
     '                    FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
     '                           CR_CONT_CVES_GUIA CCCG '+coCRLF+
     '                    WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
     ' 	               AND    CCCG.CVE_CUENTA IN ('+#39+'IDSPVE'+#39+') '+coCRLF+
     '                    AND    CCCG.CVE_TIPO_CTA = '+#39+'SR'+#39+' '+coCRLF+
     '                   ) METRICA '+coCRLF+
     '             WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE '+coCRLF+
     '             AND CONS.CVE_MONEDA    <> '+#39+'UDIS'+#39+' '+coCRLF+
     '             AND CONS.IMP_INT_VIG  <> 0 '+coCRLF+
     '             GROUP BY CONS.CVE_MONEDA,CONS.MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA '+coCRLF+
     '             UNION ALL '+coCRLF+
     '             SELECT CONS.MONEDA AS CVE_MONEDA,CONS.CVE_MONEDA AS MONEDA,'+#39+'COINCRE'+#39+' AS ORIGEN,'+#39+'1 CARTERA DE CREDITO'+#39+' AS TIPO_CUENTA,'+#39+'1.1 VIGENTE I'+#39+' AS SEGMENTO, '+coCRLF+
     '                    0 AS SDO_FIN_PER,(SUM(CONS.IMP_INT_VIG)) as SDO_COINCRE,CONS.CVE_PRODUCTO_CRE AS CVE_CTA_CONTABLE, '+coCRLF+
     '                    CONS.DESC_C_PRODUCTO  AS NOMBRE_PROD, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA, '+#39+'SIN RESTRICCION'+#39+' AS CVE_TIPO_CTA '+coCRLF+
     '             FROM  (SELECT  NVL(C.ID_CONTRATO,C2.ID_CONTRATO) AS ID_CONTRATO, '+coCRLF+
     '                            CR_SDO.ID_CREDITO,NVL(MO.DESC_MONEDA,MOE.DESC_MONEDA) CVE_MONEDA, '+coCRLF+
     '                            NVL(MO.CVE_MONEDA,MOE.CVE_MONEDA) MONEDA,CR_SDO.IMP_INT_VIG, '+coCRLF+
     '                            NVL(CCO.CVE_PRODUCTO_CRE, CCOE.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE , '+coCRLF+
     '                            NVL(CP.DESC_C_PRODUCTO, CSTB.DESC_SUB_TIPO) AS DESC_C_PRODUCTO, '+coCRLF+
     '                            NVL(P.ID_PERSONA,P2.ID_PERSONA) AS ID_PERSONA,NVL(P.NOMBRE,P2.NOMBRE) AS NOMBRE, '+coCRLF+
     '                            NVL(S.CVE_SECTOR,S2.CVE_SECTOR) AS CVE_SECTOR,NVL(S.DESC_SECTOR,S2.DESC_SECTOR) AS DESC_SECTOR '+coCRLF+
     '                    FROM  (SELECT ID_CREDITO, IMP_INT_VIG + IMP_INT_IMP AS IMP_INT_VIG  FROM CR_CON_ADEUDO_SDO WHERE F_CIERRE =  TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+')) CR_SDO, '+coCRLF+
     '                           MONEDA MO,MONEDA MOE, CR_CREDITO  CC,CR_CONTRATO CCO,CR_PRODUCTO CP,CRE_CREDITO  CCE, '+coCRLF+
     '                           CRE_CONTRATO CCOE, CRE_SUB_TIP_BCO CSTB,CONTRATO C,CONTRATO C2,PERSONA P, PERSONA P2,SECTOR S,SECTOR S2 '+coCRLF+
     '                    WHERE  CC.ID_CREDITO        (+)= CR_SDO.ID_CREDITO     AND    CCO.FOL_CONTRATO     (+)= CC.FOL_CONTRATO '+coCRLF+
     '                    AND    CCO.ID_CONTRATO      (+)= CC.ID_CONTRATO        AND    C2.ID_CONTRATO       (+)= CC.ID_CONTRATO '+coCRLF+
     '                    AND    CP.CVE_PRODUCTO_CRE  (+)= CCO.CVE_PRODUCTO_CRE  AND    MO.CVE_MONEDA        (+)= CCO.CVE_MONEDA '+coCRLF+
     '                    AND    P2.ID_PERSONA		   (+)= C2.ID_TITULAR         AND    S2.CVE_SECTOR        (+)=P2.CVE_TIPO_SECTOR '+coCRLF+
     '                    AND    CCE.ID_CREDITO       (+)= CR_SDO.ID_CREDITO     AND    CCOE.ID_CONTRATO     (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    CSTB.CVE_SUB_TIP_BCO (+)= CCOE.CVE_SUB_TIP_BCO  AND    C.ID_CONTRATO        (+)= CCE.ID_CONTRATO '+coCRLF+
     '                    AND    MOE.CVE_MONEDA       (+)= C.CVE_MONEDA	      AND    P.ID_PERSONA		  (+)= C.ID_TITULAR '+coCRLF+
     '                    AND    S.CVE_SECTOR         (+)=P.CVE_TIPO_SECTOR ) CONS, '+coCRLF+
     '                   (SELECT GP.CVE_PROD_PROG AS ID_OLTP_PRODUCTO, SUBSTR(CCCG.CTA_CONTABLE,1,10) AS ID_METRICA '+coCRLF+
     '                    FROM   CR_CONT_GPO_PRO GP, '+coCRLF+
     '                           CR_CONT_CVES_GUIA CCCG '+coCRLF+
     '                    WHERE  GP.CVE_GPO = CCCG.CVE_GPO '+coCRLF+
     ' 	               AND    CCCG.CVE_CUENTA IN ('+#39+'IDSPVE'+#39+') '+coCRLF+
     '                    AND    CCCG.CVE_TIPO_CTA = '+#39+'SR'+#39+' '+coCRLF+
     '                   ) METRICA '+coCRLF+
     '             WHERE METRICA.ID_OLTP_PRODUCTO (+)= CONS.CVE_PRODUCTO_CRE '+coCRLF+
     '             AND CONS.CVE_MONEDA    <> '+#39+'UDIS'+#39+' '+coCRLF+
     '             AND CONS.IMP_INT_VIG   <> 0 '+coCRLF+
     '             GROUP BY CONS.CVE_MONEDA,CONS.MONEDA, CONS.CVE_PRODUCTO_CRE, CONS.DESC_C_PRODUCTO, CONS.CVE_SECTOR,CONS.DESC_SECTOR, METRICA.ID_METRICA '+coCRLF+
     '            ) CONSOL '+coCRLF+
     '       GROUP BY CONSOL.MONEDA,CONSOL.CVE_MONEDA,CONSOL.ORIGEN,CONSOL.TIPO_CUENTA,CONSOL.SEGMENTO,CONSOL.SDO_FIN_PER, CONSOL.CVE_CTA_CONTABLE, '+coCRLF+
     '                CONSOL.NOMBRE_PROD, CONSOL.CVE_SECTOR,CONSOL.DESC_SECTOR, CONSOL.ID_METRICA, CONSOL.CVE_TIPO_CTA) ACUCONSOL, '+coCRLF+
     '      (SELECT GRUPO,CUENTA,CVE_MONEDA, SUM(IMPORTE) AS IMPORTE '+coCRLF+
     '       FROM  (SELECT DECODE(IZDP.CVE_TIP_ASIENTO,'+#39+'D'+#39+',IZDP.IMP_NETO,IZDP.IMP_NETO*-1) AS IMPORTE,IZDP.CUENTA,IZDP.CVE_MONEDA, '+coCRLF+
     '                     SUBSTR(IZP.DESC_POLIZA, '+coCRLF+
     '                     INSTR(IZP.DESC_POLIZA,'+#39+' '+#39+') + 1, '+coCRLF+
     '                     INSTR(SUBSTR(IZP.DESC_POLIZA,  INSTR(IZP.DESC_POLIZA,'+#39+' '+#39+') + 1,INSTR(IZP.DESC_POLIZA,'+#39+' '+#39+') + 7 ),'+#39+' '+#39+') - 1)  AS GRUPO '+coCRLF+
     '              FROM   IZ_POLIZA@CONT IZP, '+coCRLF+
     '                     IZ_DET_POLIZA@CONT IZDP '+coCRLF+
     '              WHERE  IZP.ID_EMPRESA=2 '+coCRLF+
     '              AND    IZP.CVE_APLICACION='+#39+'ICBIPC'+#39+' '+coCRLF+
     '              AND    IZP.F_OPERACION BETWEEN LAST_DAY(ADD_MONTHS( TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+') , -1)) + 1 AND TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+') '+coCRLF+
     '              AND    IZP.SIT_CONTABLE <> '+#39+'CA'+#39+' '+coCRLF+
     '              AND    IZDP.ID_POLIZA = IZP.ID_POLIZA '+coCRLF+
     '              AND    IZDP.ID_EMPRESA=2 '+coCRLF+
     '              AND    IZDP.CUENTA IN (SELECT DISTINCT SUBSTR(CCCG.CTA_CONTABLE,1,10) AS CVE_CUENTA '+coCRLF+
     '                                     FROM   CR_CONT_CVES_GUIA CCCG '+coCRLF+
     '                                     WHERE  CCCG.CVE_CUENTA IN ('+#39+'SIPAVE'+#39+','+#39+'CAVE'+#39+','+#39+'CAVENE'+#39+','+#39+'INCOAN'+#39+','+#39+'IDSPVE'+#39+','+#39+'INVE'+#39+') '+coCRLF+
     '                                     AND    CCCG.CVE_TIPO_CTA = '+#39+'SR'+#39+') '+coCRLF+
     '              UNION ALL '+coCRLF+
     '              SELECT DECODE(IZDP.CVE_TIP_ASIENTO,'+#39+'D'+#39+',IZDP.IMP_NETO,IZDP.IMP_NETO*-1) AS IMPORTE,IZDP.CUENTA,IZDP.CVE_MONEDA, '+coCRLF+
     '                     SUBSTR(IZP.DESC_POLIZA, '+coCRLF+
     '                     INSTR(IZP.DESC_POLIZA,'+#39+' '+#39+') + 1, '+coCRLF+
     '                     INSTR(SUBSTR(IZP.DESC_POLIZA,  INSTR(IZP.DESC_POLIZA,'+#39+' '+#39+') + 1,INSTR(IZP.DESC_POLIZA,'+#39+' '+#39+') + 7 ),'+#39+' '+#39+') - 1)  AS GRUPO '+coCRLF+
     '              FROM   IZ_POLIZA@CONT IZP, '+coCRLF+
     '                     IZ_DET_POLIZA@CONT IZDP '+coCRLF+
     '              WHERE  IZP.ID_EMPRESA=2 '+coCRLF+
     '              AND    IZP.CVE_APLICACION='+#39+'ICBIC1'+#39+' '+coCRLF+
     '              AND    IZP.F_OPERACION BETWEEN LAST_DAY(ADD_MONTHS( TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+') , -1)) + 1 AND TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+') '+coCRLF+
     '              AND    IZP.SIT_CONTABLE <> '+#39+'CA'+#39+' '+coCRLF+
     '              AND    IZDP.ID_POLIZA = IZP.ID_POLIZA '+coCRLF+
     '              AND    IZDP.ID_EMPRESA=2 '+coCRLF+
     '              AND    IZDP.CUENTA IN (SELECT DISTINCT SUBSTR(CCCG.CTA_CONTABLE,1,10) AS CVE_CUENTA '+coCRLF+
     '                                     FROM   CR_CONT_CVES_GUIA CCCG '+coCRLF+
     '                                     WHERE  CCCG.CVE_CUENTA IN ('+#39+'SIPAVE'+#39+','+#39+'CAVE'+#39+','+#39+'CAVENE'+#39+','+#39+'INCOAN'+#39+','+#39+'IDSPVE'+#39+','+#39+'INVE'+#39+') '+coCRLF+
     '                                     AND    CCCG.CVE_TIPO_CTA = '+#39+'SR'+#39+')) '+coCRLF+
     '       GROUP BY GRUPO, CUENTA,CVE_MONEDA) SDOINI '+coCRLF+
     ' WHERE NOT (ACUCONSOL.ID_METRICA LIKE ( '+#39+'%140104%'+#39+' ))  '+coCRLF+
     ' AND   NOT (ACUCONSOL.ID_METRICA LIKE ( '+#39+'%505059%'+#39+' ))  '+coCRLF+
     ' AND   SDOINI.GRUPO (+)= ACUCONSOL.CVE_CTA_CONTABLE '+coCRLF+
     ' AND   SDOINI.CUENTA (+)= ACUCONSOL.ID_METRICA '+coCRLF+
     ' AND   SDOINI.CVE_MONEDA (+)= ACUCONSOL.CVE_MONEDA '+coCRLF+
     ' ORDER BY ACUCONSOL.CVE_TIPO_CTA, ACUCONSOL.MONEDA, ACUCONSOL.TIPO_CUENTA, ACUCONSOL.SEGMENTO, '+coCRLF+
     '          ACUCONSOL.ID_METRICA, ACUCONSOL.CVE_SECTOR, ACUCONSOL.CVE_CTA_CONTABLE '

     ;


end;

Procedure  TWMqrcoco.ArmaCadenaSQLCuotasDet;
var  VLTipoSegmento : String;
begin

     if SGClBusMovNoAut.CellStr[ 'SEGMENTO', SGClBusMovNoAut.SG.Row] = '1.1 VIGENTE' then
     begin
          VLTipoSegmento := ' IMP_CAP_VIG + IMP_CAP_IMP ';
     end;

     if SGClBusMovNoAut.CellStr[ 'SEGMENTO', SGClBusMovNoAut.SG.Row] = '1.1 VIGENTE I' then
     begin
          VLTipoSegmento := ' IMP_INT_VIG + IMP_INT_IMP ';
     end;

     if SGClBusMovNoAut.CellStr[ 'SEGMENTO', SGClBusMovNoAut.SG.Row] = '1.2 VENCIDO' then
     begin
          VLTipoSegmento := ' IMP_CAP_VDO_EX + IMP_CAP_VDO_NE ';
     end;

     if SGClBusMovNoAut.CellStr[ 'SEGMENTO', SGClBusMovNoAut.SG.Row] = '1.2 VENCIDO I' then
     begin
          VLTipoSegmento := ' IMP_INT_VDO_EX ';
     end;

     if SGClBusMovNoAut.CellStr[ 'SEGMENTO', SGClBusMovNoAut.SG.Row] = '2 INTERES COBRADO POR ANTICIPADO' then
     begin
          VLTipoSegmento := ' IMP_PRE_DEVENGAR ';
     end;


     Objeto.CadenaSqlDet :=

     ' SELECT * FROM ( '+coCRLF+
     ' SELECT ID_CREDITO, SUM(IMPORTE) AS IMPORTE '+coCRLF+
     ' FROM '+coCRLF+
     ' (SELECT BASE.ID_CREDITO, (NVL(INIC.IMP_CONS,0) - NVL(FIN.IMP_CONS,0)) AS IMPORTE '+coCRLF+
     ' FROM  (SELECT ID_CREDITO, F_CIERRE, (' + VLTipoSegmento + ') AS  IMP_CONS '+coCRLF+
     '        FROM CR_CON_ADEUDO_SDO '+coCRLF+
     '        WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_CREDITO '+coCRLF+
     '                             WHERE ID_CONTRATO IN (SELECT ID_CONTRATO '+coCRLF+
     '                                                   FROM CR_CONTRATO '+coCRLF+
     '                                   WHERE CVE_PRODUCTO_CRE IN ('+#39+ SGClBusMovNoAut.CellStr[ 'CVE_CTA_CONTABLE', SGClBusMovNoAut.SG.Row]+#39+') and cve_moneda = '+SGClBusMovNoAut.CellStr[ 'CVE_MONEDA', SGClBusMovNoAut.SG.Row]+') '+coCRLF+
     '     AND ID_CONTRATO IN (SELECT ID_CONTRATO '+coCRLF+
     '                                                 FROM CONTRATO '+coCRLF+
     '                 WHERE ID_TITULAR IN (SELECT ID_PERSONA FROM PERSONA '+coCRLF+
     '              WHERE PERSONA.CVE_TIPO_SECTOR = '+#39+ SGClBusMovNoAut.CellStr[ 'CVE_SECTOR', SGClBusMovNoAut.SG.Row]+ #39 + '))) '+coCRLF+
     '     AND   F_CIERRE = LAST_DAY(ADD_MONTHS( TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+') , -1)) '+coCRLF+
     '        AND  ((' + VLTipoSegmento + ') <> 0)) INIC, '+coCRLF+
     '       (SELECT ID_CREDITO, F_CIERRE, (' + VLTipoSegmento + ') AS  IMP_CONS '+coCRLF+
     '        FROM CR_CON_ADEUDO_SDO '+coCRLF+
     '        WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_CREDITO '+coCRLF+
     '                             WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CONTRATO '+coCRLF+
     '   WHERE CVE_PRODUCTO_CRE IN ('+#39+ SGClBusMovNoAut.CellStr[ 'CVE_CTA_CONTABLE', SGClBusMovNoAut.SG.Row]+#39+') and cve_moneda = '+SGClBusMovNoAut.CellStr[ 'CVE_MONEDA', SGClBusMovNoAut.SG.Row]+') '+coCRLF+
     '     AND ID_CONTRATO IN (SELECT ID_CONTRATO   FROM CONTRATO '+coCRLF+
     '        WHERE ID_TITULAR IN (SELECT ID_PERSONA FROM PERSONA '+coCRLF+
     '                              WHERE PERSONA.CVE_TIPO_SECTOR = '+#39+SGClBusMovNoAut.CellStr[ 'CVE_SECTOR', SGClBusMovNoAut.SG.Row]+#39+'))) '+coCRLF+
     '        AND   F_CIERRE = TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+') '+coCRLF+
     '        AND  ((' + VLTipoSegmento + ') <> 0)) FIN, '+coCRLF+
     '       (SELECT DISTINCT ID_CREDITO '+coCRLF+
     '        FROM CR_CON_ADEUDO_SDO '+coCRLF+
     '        WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_CREDITO '+coCRLF+
     '                             WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CONTRATO '+coCRLF+
     '   WHERE CVE_PRODUCTO_CRE IN ('+#39+SGClBusMovNoAut.CellStr[ 'CVE_CTA_CONTABLE', SGClBusMovNoAut.SG.Row]+#39+') and cve_moneda = '+SGClBusMovNoAut.CellStr[ 'CVE_MONEDA', SGClBusMovNoAut.SG.Row]+') '+coCRLF+
     '     AND ID_CONTRATO IN (SELECT ID_CONTRATO   FROM CONTRATO '+coCRLF+
     '         WHERE ID_TITULAR IN (SELECT ID_PERSONA FROM PERSONA '+coCRLF+
     '      WHERE PERSONA.CVE_TIPO_SECTOR = '+#39+SGClBusMovNoAut.CellStr[ 'CVE_SECTOR', SGClBusMovNoAut.SG.Row]+#39+'))) '+coCRLF+
     '        AND (F_CIERRE  = LAST_DAY(ADD_MONTHS( TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+') , -1))  '+coCRLF+
     '        OR  F_CIERRE = TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+')) '+coCRLF+
     '        AND  ((' + VLTipoSegmento + ') <> 0)) BASE '+coCRLF+
     ' WHERE  INIC.ID_CREDITO (+)= BASE.ID_CREDITO '+coCRLF+
     ' AND    FIN.ID_CREDITO  (+)= BASE.ID_CREDITO '+coCRLF+
     ' UNION ALL '+coCRLF+
     ' SELECT TEMP.ID_CREDITO, SUM(DECODE(TEMP.TIPO_AFECTACION,'+#39+'D'+#39+',TEMP.IMP_CONCEPTO,TEMP.IMP_CONCEPTO*-1)) AS IMPORTE '+coCRLF+
     ' FROM CR_CONT_EVENTO_DET TEMP '+coCRLF+
     ' WHERE  F_OPERACION BETWEEN LAST_DAY(ADD_MONTHS( TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+') , -1))+ 1 AND TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+') '+coCRLF+
     ' AND    CVE_MONEDA = '+SGClBusMovNoAut.CellStr[ 'CVE_MONEDA', SGClBusMovNoAut.SG.Row]+' '+coCRLF+
     ' AND    CVE_PROD_PROG = '+#39+SGClBusMovNoAut.CellStr[ 'CVE_CTA_CONTABLE', SGClBusMovNoAut.SG.Row]+#39+' '+coCRLF+
     ' AND    CVE_TIPO_SECTOR = '+#39+SGClBusMovNoAut.CellStr[ 'CVE_SECTOR', SGClBusMovNoAut.SG.Row]+#39+coCRLF+
     ' AND    CUENTA IN ('+#39+SGClBusMovNoAut.CellStr[ 'ID_METRICA', SGClBusMovNoAut.SG.Row]+#39+') '+coCRLF+
     ' GROUP BY ID_CREDITO '+coCRLF+
     ' ) GROUP BY ID_CREDITO '+coCRLF+
     ' ) WHERE IMPORTE <> 0 ORDER BY ID_CREDITO ';

end;



Procedure  TWMqrcoco.ArmaCadenaSQLCuotasDet2;
begin
     if RGDet2.ItemIndex = 0 then
        Objeto.CadenaSqlDet2 :=
        ' SELECT CASE WHEN CO.CVE_ACCESORIO = '+#39+'IN'+#39+' AND CC.F_TRASPASO_VENC IS NOT NULL AND CC.F_TRASPASO_VENC + 5 < CT.F_PROG_PAGO THEN 1 ELSE 0 END AS CTAORD, '+coCRLF+
        '        CDT.IMP_CONCEPTO, CDT.CVE_CONCEPTO, CCTO.CVE_PRODUCTO_CRE,  PP.CVE_TIPO_SECTOR, CCR.ID_PROM_ADM,  ct.ID_TRANSACCION,ID_GRUPO_TRANSAC, '+coCRLF+
        '        ct.CVE_OPERACION,CT.ID_CONTRATO,CT.ID_CREDITO,ID_PERIODO, '+coCRLF+
        '        TO_CHAR(F_OPERACION,'+#39+'DD/MM/YYYY'+#39+') F_OPERACION,TO_CHAR(F_VALOR,'+#39+'DD/MM/YYYY'+#39+') F_VALOR,TO_CHAR(F_PROG_PAGO,'+#39+'DD/MM/YYYY'+#39+') F_PROG_PAGO,ID_COD_RESP, '+coCRLF+
        '        DECODE(CT.CVE_OPERACION,'+#39+'CASTIN'+#39+','+#39+'CASTIN'+#39+','+#39+'CASTCP'+#39+','+#39+'CASTCP'+#39+','+#39+'CASTFN'+#39+','+#39+'CASTFN'+#39+','+#39+'RCASIN'+#39+','+#39+'RCASIN'+#39+','+#39+'CASTCN'+#39+','+#39+'CASTCN'+#39+', '+coCRLF+
        '                                '+#39+'RCASCP'+#39+','+#39+'RCASCP'+#39+','+#39+'RCASFN'+#39+','+#39+'RCASFN'+#39+','+#39+'RCASCN'+#39+','+#39+'RCASCN'+#39+','+#39+'QUITIN'+#39+', '+coCRLF+
        '                                '+#39+'QUEBIN'+#39+','+#39+'QUEBIN'+#39+','+#39+'QUEBFN'+#39+','+#39+'QUEBFN'+#39+','+#39+'QUEBCP'+#39+','+#39+'QUEBCP'+#39+',TX_NOTA), '+coCRLF+
        '        TIPO_CAMBIO,CVE_APLIC_SALDO,CT.CVE_USU_ALTA,FH_ALTA,CVE_USU_CANC,FH_CANCELA,SIT_TRANSACCION, '+coCRLF+
        '        CT.FOL_CONTRATO,CVE_TIPO_REMAN,CT.B_CONTABILIZADO,ID_TRANS_CANCELA,CT.TASA_APLICADA,CT.CVE_MEDIO, CT.CVE_TIPO_MOVTO '+coCRLF+
        ' FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_OPERACION CO, CR_HISTO_CRED CC, CR_CONTRATO CCTO, CONTRATO CTO, PERSONA PP, CR_CREDITO CCR '+coCRLF+
        ' WHERE 1 = 1 '+coCRLF+
        ' AND CT.ID_CREDITO IN ('+SGClBusMovNoAutDet.CellStr[ 'ID_CREDITO', SGClBusMovNoAutDet.SG.Row]+') '+coCRLF+
        ' AND CT.CVE_OPERACION NOT IN ('+#39+'MORACP'+#39+','+#39+'PVCICN'+#39+','+#39+'FDVTCN'+#39+','+#39+'CIIMVD'+#39+','+#39+'APFNFD'+#39+','+#39+'PVCIGP'+#39+') '+coCRLF+
        ' AND  CDT.ID_TRANSACCION = CT.ID_TRANSACCION '+coCRLF+
        ' AND CDT.CVE_OPERACION = CT.CVE_OPERACION '+coCRLF+
        ' AND CDT.CVE_CONCEPTO IN ('+#39+'IMPBRU'+#39+') '+coCRLF+
        ' AND CO.CVE_OPERACION = CT.CVE_OPERACION '+coCRLF+
        ' AND CC.ID_CREDITO (+)= CT.ID_CREDITO '+coCRLF+
        ' AND CC.F_CIERRE (+)= CT.F_OPERACION -1 '+coCRLF+
        ' AND F_OPERACION >= TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+') - 60 '+coCRLF+
        ' AND CT.ID_CONTRATO = CCTO.ID_CONTRATO '+coCRLF+
        ' AND CTO.ID_CONTRATO = CCTO.ID_CONTRATO '+coCRLF+
        ' AND PP.ID_PERSONA =  CTO.ID_TITULAR '+coCRLF+
        ' AND CCR.ID_CREDITO = CT.ID_CREDITO '+coCRLF+
        ' AND SIT_TRANSACCION <> '+#39+'CA'+#39+' '+coCRLF+
        ' ORDER BY CT.ID_TRANSACCION ';
     //end if

     if RGDet2.ItemIndex = 1 then
        Objeto.CadenaSqlDet2 :=
        ' SELECT ID_EVENTO_DET, B_ENVIA_SECTOR,CUENTA,CVE_COMISION,CVE_CONCEPTO,CVE_MONEDA,CVE_MONEDA_REP,CVE_OPER_CRED, '+coCRLF+
        '        CVE_ORIGEN, CVE_PROD_PROG, CVE_TIPO_MOVTO, TO_CHAR(F_OPERACION,'+#39+'DD/MM/YYYY'+#39+') F_OPERACION, IMP_CONCEPTO, TIPO_AFECTACION, '+coCRLF+
        '        ID_CREDITO, ID_ACREDITADO,TX_REFERENCIA ,  TEMP.B_DERIVADO, TEMP.SECTOR '+coCRLF+
        ' FROM CR_CONT_EVENTO_DET TEMP '+coCRLF+
        ' WHERE  F_OPERACION >= TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+') - 31 '+coCRLF+
        ' AND    CVE_MONEDA = '+SGClBusMovNoAut.CellStr[ 'CVE_MONEDA', SGClBusMovNoAut.SG.Row]+' '+coCRLF+
        ' AND    CUENTA  IN ('+#39+SGClBusMovNoAut.CellStr[ 'ID_METRICA', SGClBusMovNoAut.SG.Row]+#39+') '+coCRLF+
        ' ORDER BY F_OPERACION DESC , ID_EVENTO_DET ';
     //end if

     if RGDet2.ItemIndex = 2 then
        Objeto.CadenaSqlDet2 :=
//     '       SELECT GRUPO,CUENTA,CVE_MONEDA, SUM(IMPORTE) AS IMPORTE '+coCRLF+
//     '       FROM  (  '+coCRLF+
     '              SELECT IZP.F_OPERACION, DECODE(IZDP.CVE_TIP_ASIENTO,'+#39+'D'+#39+',IZDP.IMP_NETO,IZDP.IMP_NETO*-1) AS IMPORTE,IZDP.CUENTA,IZDP.CVE_MONEDA, '+coCRLF+
     '                     IZP.DESC_POLIZA  AS GRUPO '+coCRLF+
     '              FROM   IZ_POLIZA@CONT IZP, '+coCRLF+
     '                     IZ_DET_POLIZA@CONT IZDP '+coCRLF+
     '              WHERE  IZP.ID_EMPRESA=2 '+coCRLF+
     '              AND    IZP.CVE_APLICACION='+#39+'ICBIPC'+#39+' '+coCRLF+
     '              AND    IZP.F_OPERACION BETWEEN LAST_DAY(ADD_MONTHS( TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+') , -1)) + 1 AND TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+') '+coCRLF+
     '              AND    IZP.SIT_CONTABLE <> '+#39+'CA'+#39+' '+coCRLF+
     '              AND    IZDP.ID_POLIZA = IZP.ID_POLIZA '+coCRLF+
     '              AND    IZDP.ID_EMPRESA = 2 '+coCRLF+
     '              AND    IZDP.CVE_MONEDA = '+SGClBusMovNoAut.CellStr[ 'CVE_MONEDA', SGClBusMovNoAut.SG.Row]+' '+coCRLF+
     '              AND    IZDP.CUENTA IN ('+#39+SGClBusMovNoAut.CellStr[ 'ID_METRICA', SGClBusMovNoAut.SG.Row]+#39+') '+coCRLF+
     '              UNION ALL '+coCRLF+
     '              SELECT IZP.F_OPERACION, DECODE(IZDP.CVE_TIP_ASIENTO,'+#39+'D'+#39+',IZDP.IMP_NETO,IZDP.IMP_NETO*-1) AS IMPORTE,IZDP.CUENTA,IZDP.CVE_MONEDA, '+coCRLF+
     '                     IZP.DESC_POLIZA  AS GRUPO '+coCRLF+
     '              FROM   IZ_POLIZA@CONT IZP, '+coCRLF+
     '                     IZ_DET_POLIZA@CONT IZDP '+coCRLF+
     '              WHERE  IZP.ID_EMPRESA = 2 '+coCRLF+
     '              AND    IZP.CVE_APLICACION='+#39+'ICBIC1'+#39+' '+coCRLF+
     '              AND    IZP.F_OPERACION BETWEEN LAST_DAY(ADD_MONTHS( TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+') , -1)) + 1 AND TO_DATE('+#39+FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime)+#39+','+#39+'DD/MM/YYYY'+#39+') '+coCRLF+
     '              AND    IZP.SIT_CONTABLE <> '+#39+'CA'+#39+' '+coCRLF+
     '              AND    IZDP.ID_POLIZA = IZP.ID_POLIZA '+coCRLF+
     '              AND    IZDP.ID_EMPRESA = 2 '+coCRLF+
     '              AND    IZDP.CVE_MONEDA = '+SGClBusMovNoAut.CellStr[ 'CVE_MONEDA', SGClBusMovNoAut.SG.Row]+' '+coCRLF+
     '              AND    IZDP.CUENTA IN ('+#39+SGClBusMovNoAut.CellStr[ 'ID_METRICA', SGClBusMovNoAut.SG.Row]+#39+')';
//     '       ) '+coCRLF+
//     '       GROUP BY GRUPO, CUENTA,CVE_MONEDA ';
     //end if



end;


Procedure  TWMqrcoco.ReQueryCuotas;
var Q : TQuery;
begin
     Q :=  GetSQLQuery(Objeto.CadenaSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     try
          if Q <> nil then
          begin

               Q.SQL.SaveToFile('c:\qryCochiliadorDet.SQL');

               Q.FieldByName('CVE_MONEDA').Visible := False;
               Q.FieldByName('ORIGEN').Visible := False;
               Q.FieldByName('TIPO_CUENTA').Visible := False;
               Q.FieldByName('NOMBRE_PROD').Visible := False;
               Q.FieldByName('DESC_SECTOR').Visible := False;

               //COLUMNAS OCULTAS
               //ASIGNACION DE ETIQUETAS
               Q.FieldByName('MONEDA').DisplayLabel := 'Cve Mon' + #30 +'>C';
               Q.FieldByName('SEGMENTO').DisplayLabel := 'Segmento' + #30 +'>C';
               Q.FieldByName('SDO_COINCRE').DisplayLabel := 'Sdo Coincre' + #30 +'>C';
               Q.FieldByName('IMPORTE').DisplayLabel := 'Sdo Contable' + #30 +'>C';
               Q.FieldByName('CVE_CTA_CONTABLE').DisplayLabel := 'Cta Contable' + #30 +'>C';
               Q.FieldByName('CVE_SECTOR').DisplayLabel := 'Sector' + #30 +'>C';
               Q.FieldByName('ID_METRICA').DisplayLabel := 'Metrica' + #30 +'>C';
               Q.FieldByName('CVE_TIPO_CTA').DisplayLabel := 'Tipo Cta' + #30 +'>C';
               Q.FieldByName('DIFERENCIA').DisplayLabel := 'Diferencia' + #30 +'>C';


               //ASIGNACION DE MASCARAS DE EDICION
//               TDateField(Q.FieldByName('F_VENCIMIENTO')).DisplayFormat := 'DD/MM/YYYY';

               TNumericField(Q.FieldByName('SDO_COINCRE')).DisplayFormat := '###,###,###,##0.00';
               TNumericField(Q.FieldByName('IMPORTE')).DisplayFormat := '###,###,###,##0.00';
               TNumericField(Q.FieldByName('DIFERENCIA')).DisplayFormat := '###,###,###,##0.00';

               //ASIGNACION DE LONGITUD DE COLUMNAS
               Q.FieldByName('MONEDA').DisplayWidth := 15;
               Q.FieldByName('SEGMENTO').DisplayWidth := 20;
               Q.FieldByName('SDO_COINCRE').DisplayWidth := 16;
               Q.FieldByName('IMPORTE').DisplayWidth := 16;
               Q.FieldByName('CVE_CTA_CONTABLE').DisplayWidth := 14;
               Q.FieldByName('CVE_SECTOR').DisplayWidth := 6;
               Q.FieldByName('ID_METRICA').DisplayWidth := 15;
               Q.FieldByName('CVE_TIPO_CTA').DisplayWidth := 16;
               Q.FieldByName('DIFERENCIA').DisplayWidth := 15;


               SGClBusMovNoAut.Titulo1 := 'Conciliador';
               SGClBusMovNoAut.Titulo2 := 'Al día:  ' + FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime) ;
               SGClBusMovNoAut.addQry(Q,True,True,-1,-1,-1,True);

          end
          else
          begin
               SGClBusMovNoAut.Clear('NO EXISTEN DATOS A LA FECHA SOLICITADA'#30'>C');
          end;
     finally
          if Q <> nil then
             Q.free;
          //end if
     end;
end;



Procedure  TWMqrcoco.ReQueryCuotasDet;
var Q : TQuery;
    VlSql : String;
begin
     Query1.SQL.Add(Objeto.CadenaSqlDet);
     Query1.SQL.SaveToFile('c:\qryCochiliadorCreDet.SQL');


     Q :=  GetSQLQuery(Objeto.CadenaSqlDet,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     try
          if Q <> nil then
          begin

               Q.SQL.SaveToFile('c:\qryCochiliadorCreDet.SQL');

               //COLUMNAS OCULTAS
               //ASIGNACION DE ETIQUETAS
               Q.FieldByName('ID_CREDITO').DisplayLabel := 'Sdo Coincre' + #30 +'>C';
               Q.FieldByName('IMPORTE').DisplayLabel := 'Importe' + #30 +'>C';

               //ASIGNACION DE MASCARAS DE EDICION
//               TDateField(Q.FieldByName('F_VENCIMIENTO')).DisplayFormat := 'DD/MM/YYYY';

               TNumericField(Q.FieldByName('IMPORTE')).DisplayFormat := '###,###,###,##0.00';

               //ASIGNACION DE LONGITUD DE COLUMNAS
               Q.FieldByName('ID_CREDITO').DisplayWidth := 20;
               Q.FieldByName('IMPORTE').DisplayWidth := 30;


               SGClBusMovNoAutDet.Titulo1 := 'Detalle Cochiliador';
               SGClBusMovNoAutDet.Titulo2 := SGClBusMovNoAut.CellStr[ 'CVE_MONEDA', SGClBusMovNoAut.SG.Row] + ' - ' +
                                          SGClBusMovNoAut.CellStr[ 'CVE_CTA_CONTABLE', SGClBusMovNoAut.SG.Row] + ' - ' +
                                          SGClBusMovNoAut.CellStr[ 'CVE_SECTOR', SGClBusMovNoAut.SG.Row] + ' - ' +
                                          SGClBusMovNoAut.CellStr[ 'ID_METRICA', SGClBusMovNoAut.SG.Row];
               SGClBusMovNoAutDet.addQry(Q,True,True,-1,-1,-1,True);

          end
          else
          begin
               SGClBusMovNoAutDet.Clear('NO EXISTEN DATOS A LA FECHA SOLICITADA : ' +
                                         SGClBusMovNoAut.CellStr[ 'CVE_MONEDA', SGClBusMovNoAut.SG.Row] + ' - ' +
                                         SGClBusMovNoAut.CellStr[ 'CVE_CTA_CONTABLE', SGClBusMovNoAut.SG.Row] + ' - ' +
                                         SGClBusMovNoAut.CellStr[ 'CVE_SECTOR', SGClBusMovNoAut.SG.Row] + ' - ' +
                                         SGClBusMovNoAut.CellStr[ 'ID_METRICA', SGClBusMovNoAut.SG.Row] + #30'>C');
          end;
     finally
          if Q <> nil then
          begin
              Q.SQL.SaveToFile('c:\qryCochiliadorCreDet.SQL');
              Q.free;
          end;
     end;
end;

Procedure  TWMqrcoco.ReQueryCuotasDet2;
var Q : TQuery;
begin
     Q :=  GetSQLQuery(Objeto.CadenaSqlDet2,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     try
          if Q <> nil then
          begin

               Q.SQL.SaveToFile('c:\qryCochiliadorDet2.SQL');


//               Q.FieldByName('CVE_MONEDA').Visible := False;


               //COLUMNAS OCULTAS
               //ASIGNACION DE ETIQUETAS
//               Q.FieldByName('MONEDA').DisplayLabel := 'Cve Mon' + #30 +'>C';



               //ASIGNACION DE MASCARAS DE EDICION
//               TDateField(Q.FieldByName('F_VENCIMIENTO')).DisplayFormat := 'DD/MM/YYYY';

//               TNumericField(Q.FieldByName('SDO_COINCRE')).DisplayFormat := '###,###,###,##0.00';


               //ASIGNACION DE LONGITUD DE COLUMNAS
//               Q.FieldByName('MONEDA').DisplayWidth := 15;


               if RGDet2.ItemIndex = 0 then
                  SGClBusMovNoAutDet2.Titulo1 := 'Transacciones';
               //end if
               if RGDet2.ItemIndex = 1 then
                  SGClBusMovNoAutDet2.Titulo1 := 'ContaIcre2';
               //end if
               if RGDet2.ItemIndex = 2 then
                  SGClBusMovNoAutDet2.Titulo1 := 'Saldos Cuenta';
               //end if

               SGClBusMovNoAutDet2.Titulo2 := 'Al día:  ' + FormatDateTime('dd/mm/yyyy',dtpFechaConciliador.DateTime) ;
               SGClBusMovNoAutDet2.addQry(Q,True,True,-1,-1,-1,True);

          end
          else
          begin
               SGClBusMovNoAutDet2.Clear('NO EXISTEN DATOS A LA FECHA SOLICITADA'#30'>C');
          end;
     finally
          if Q <> nil then
             Q.free;
          //end if
     end;
end;

procedure TWMqrcoco.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      cbAnio.Text := FormatDateTime('yyyy',Objeto.Apli.DameFechaEmpresa);
      cbMes.Text := Objeto.DameMes(StrToInt(FormatDateTime('mm',Objeto.Apli.DameFechaEmpresa)));

      dtpFechaEspecifica.Date := Objeto.Apli.DameFechaEmpresa - 1;
      dtpFechaConciliador.Date := Objeto.Apli.DameFechaEmpresa - 1;
      cbGenArchExcel.Checked:=False;
      edRuta.Enabled:=False;
      sbtnExcel.Enabled:=False;
      vgRuta  :='';



end;

procedure TWMqrcoco.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWMqrcoco.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMqrcoco.MuestraReporte(peBPreview : Boolean);
var  TipoCar :String;
     TipoRep,TipoDet :String;
     vlStrArchivoXLS , vlStrArchivoQry : String;
     vlAnio, vlMes : Integer;
     vlstrDir, vlstrAchivoPDF : String;
     vlFechaEspecifica : TDateTime;
begin
     // <SATV4766> Estos filtros se incluyen debido a que como ya no funciona lo de CONICRE VS CONTA por que entro
     // la parte de SAP desde ENERO de 2008, entonces las consultas previas a este periodo se realizarán por medio
     // de los archivos digitalizados.
     //
     vlAnio := StrToInt(cbAnio.Text);
     vlMes  := Objeto.DameNoMes(cbMes.Text);
     If (vlAnio < 2008) then
     Begin
       If (vlAnio < 2006) then
         Begin
         MessageDlg('No existen archivos digitalizados anteriores a Enero del 2006', mtWarning, [mbOk], 0);
         Exit;
         End;

       vlstrDir := DirRepDigitalizados(Objeto.Apli);
       vlstrAchivoPDF := vlstrDir + Format('%s%s',[ FormatFloat('00',vlAnio), FormatFloat('00', vlMes) ]) + '.PDF';
       If FileExists(vlstrAchivoPDF) Then
         Begin
         ShellExecute(Handle, 'open', 'AcroRd32', Pchar(vlstrAchivoPDF), Nil, SW_SHOW);
         Exit;
         End
       Else
         Begin
         MessageDlg('El archivo "'+vlstrAchivoPDF+'" no existe o no se encuentra.'+coCRLF+
                    ' Favor de comunicarse con sistemas.', mtWarning, [mbOk], 0);
         Exit;
         End;
     End;

     if rgTipoCar.ItemIndex = 0 then
        TipoCar := 'CA';
     //end if
     if rgTipoCar.ItemIndex = 1 then
        TipoCar := 'IN';
     //end if
     if rgTipoCar.ItemIndex = 2 then
        TipoCar := 'NA';
     //end if
     if rgTipoReporte.ItemIndex = 0 then
        TipoRep := 'ME';
     //end if
     if rgTipoReporte.ItemIndex = 1 then
        TipoRep := 'DI';

     // Inicia obtneción de datos
     If cbGenArchExcel.Checked Then vlStrArchivoXLS := edRuta.text
     Else vlStrArchivoXLS := '';

     If FileExists(vlStrArchivoXLS) Then
       If (MessageDlg('El archivo '+ExtractFileName(vlStrArchivoXLS)+' ya existe en la ruta indicada.'+coCRLF+
                      '¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
          DeleteFile(vlStrArchivoXLS)
       Else
          Begin
          MessageDlg('Favor de indicar otro nombre de archivo, para poder continuar.', mtWarning, [mbOk], 0);
          If (edRuta.CanFocus) Then edRuta.SetFocus;
          Exit;
          end;

     if cbContaIcreN.Checked then
       TipoDet := 'DE';
     //endif

     if cbContaIcreNRE.Checked then
       TipoDet := 'RE';
     //endif

     If cbArchivoQry.Checked Then vlStrArchivoQry := edArchivoQry.text
     Else vlStrArchivoQry := '';

     vlFechaEspecifica := 0;
     // Si se seleccion que fuera por fecha especifica, entonces...
     If (cbFechaEspecifica.Checked) Then vlFechaEspecifica := dtpFechaEspecifica.Date;

     if BContaIcre2.Checked then
             RepCompCOINCREDetalleS(Objeto.DameNoMes(cbMes.Text),
                                   StrToInt(cbAnio.Text),
                                   cbMes.Text,
                                   Objeto.Apli,
                                   peBPreview,
                                   TipoRep,
                                   vlStrArchivoXLS,
                                   vlStrArchivoQry,
                                   chkbxK_VIG.Checked,
                                   chkbxK_IMP.Checked,
                                   chkbxK_VEN.Checked,
                                   chkbxI_VIG.Checked,
                                   chkbxI_IMP.Checked,
                                   chkbxI_VEN.Checked,
                                   vlFechaEspecifica
                                   )
     else if cbContaIcreN.Checked or cbContaIcreNRE.Checked then
             RepCompCOINCREDetalleN(Objeto.DameNoMes(cbMes.Text),
                                   StrToInt(cbAnio.Text),
                                   cbMes.Text,
                                   Objeto.Apli,
                                   peBPreview,
                                   TipoRep,
                                   TipoDet,
                                   vlStrArchivoXLS,
                                   vlStrArchivoQry,
                                   chkbxK_VIG.Checked,
                                   chkbxK_IMP.Checked,
                                   chkbxK_VEN.Checked,
                                   chkbxI_VIG.Checked,
                                   chkbxI_IMP.Checked,
                                   chkbxI_VEN.Checked,
                                   vlFechaEspecifica
                                   )
     else

             RepCompCOINCREDetalle(Objeto.DameNoMes(cbMes.Text),
                                   StrToInt(cbAnio.Text),
                                   cbMes.Text,
                                   Objeto.Apli,
                                   peBPreview,
                                   TipoRep,
                                   vlStrArchivoXLS,
                                   vlStrArchivoQry,
                                   chkbxK_VIG.Checked,
                                   chkbxK_IMP.Checked,
                                   chkbxK_VEN.Checked,
                                   chkbxI_VIG.Checked,
                                   chkbxI_IMP.Checked,
                                   chkbxI_VEN.Checked,
                                   vlFechaEspecifica
                                   );
     //end if

     If cbGenArchExcel.Checked Then
        Begin
        If (MessageDlg('Se generó el archivo '+vlStrArchivoXLS+'.'+coCRLF+
                        '¿Desea abrirlo?', mtInformation, [mbYes, mbNo], 0) = mrYes) Then
           ShellExecute(Handle, 'open', 'excel', Pchar(vlStrArchivoXLS), Nil, SW_SHOW);
        End;
     //RepCompCoincre(Objeto.DameNoMes(cbMes.Text),StrToInt(cbAnio.Text),cbMes.Text,TipoCar, Objeto.Apli,peBPreview,TipoRep, vlStrArchivoXLS, vlStrArchivoQry);
end;

procedure TWMqrcoco.InterForma1Imprimir(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMQRCOCO_IMPRI',True,True) then
   begin
      MuestraReporte(False);
   end;
end;

procedure TWMqrcoco.InterForma1Preview(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMQRCOCO_PREVI',True,True) then
   begin
      MuestraReporte(True);
   end;
end;

procedure TWMqrcoco.GeneraNomArch;
var vlruta, vlNomArch: String;
begin
 If (edRuta.Text<>'')  Then
    Begin
    vlruta:=ExtractFilePath(edRuta.text);
    vlNomArch:= 'COMPARATIVO'+IntToStr(Objeto.DameNoMes(cbMes.Text))+cbAnio.Text+'.XLS';
    edRuta.Text:= vlruta+vlNomArch;
    End;
end;

procedure TWMqrcoco.sbtnExcelClick(Sender: TObject);
begin
  SaveDialog1.DefaultExt := '*.xls';
  SaveDialog1.Filter     := 'Archivo Excel (*.xls)|*.xls';
  SaveDialog1.FileName:= edRuta.Text;
  if SaveDialog1.Execute then
   edRuta.Text:=SaveDialog1.FileName;
end;

procedure TWMqrcoco.cbGenArchExcelClick(Sender: TObject);
begin
  If cbGenArchExcel.Checked Then
    Begin
      edRuta.Enabled:=True;
      sbtnExcel.Enabled:=True;
      edRuta.Color := clWindow;
      edRuta.ReadOnly := False;
      edRuta.Text:='C:\';
      GeneraNomArch;
    End
  Else
    Begin
      edRuta.Clear;
      edRuta.Enabled:=False;
      edRuta.Color := clBtnFace;
      edRuta.ReadOnly := True;
      sbtnExcel.Enabled:=False;
    End
end;


procedure TWMqrcoco.MuestraControlesQry;
var vlbVisible : Boolean;
begin
  vlbVisible := Objeto.Apli.CvePerfil = 101; // Si es de Sistemas, entonces...
  cbArchivoQry.Visible  := vlbVisible;
  edArchivoQry.Visible  := vlbVisible;
  btnArchivoQry.Visible := vlbVisible;
end;

procedure TWMqrcoco.btnArchivoQryClick(Sender: TObject);
begin
  SaveDialog1.DefaultExt := '*.txt';
  SaveDialog1.Filter     := 'Archivo de Texto (*.txt)|*.txt';
  SaveDialog1.FileName:= edArchivoQry.Text;
  if SaveDialog1.Execute then
   edArchivoQry.Text:=SaveDialog1.FileName;
end;

procedure TWMqrcoco.cbArchivoQryClick(Sender: TObject);
begin
 If cbArchivoQry.Checked Then
   Begin
   edArchivoQry.Enabled  := True;
   edArchivoQry.Color    := clWindow;
   edArchivoQry.ReadOnly := False;

   btnArchivoQry.Enabled  := True;
   End
 Else
   Begin
   edArchivoQry.Enabled  := False;
   edArchivoQry.Color    := clBtnFace;
   edArchivoQry.ReadOnly := True;

   btnArchivoQry.Enabled  := False;
   End;
end;

procedure TWMqrcoco.rgTipoCarClick(Sender: TObject);
var vlbCapital, vlbInteres : Boolean;
begin
   Case rgTipoCar.ItemIndex Of
     0 : Begin vlbCapital := True; vlbInteres := False; End;
     1 : Begin vlbCapital := False; vlbInteres := True; End;
   Else
     vlbCapital := True; vlbInteres := True;
   End;
   // Se apaga esta bandera, para evitar que se ejecute el evento de "chkbxK_VIGClick"
   vgBAplicaChkbx := False;
   chkbxK_VIG.Checked := vlbCapital;
   chkbxK_IMP.Checked := vlbCapital;
   chkbxK_VEN.Checked := vlbCapital;

   chkbxI_VIG.Checked := vlbInteres;
   chkbxI_IMP.Checked := vlbInteres;
   chkbxI_VEN.Checked := vlbInteres;
   vgBAplicaChkbx := True;
end;

procedure TWMqrcoco.chkbxK_VIGClick(Sender: TObject);
var vlContador : Integer;
begin
  If vgBAplicaChkbx Then
    Begin
    vlContador := 0;
    If Not chkbxK_VIG.Checked Then Inc(vlContador);
    If Not chkbxK_IMP.Checked Then Inc(vlContador);
    If Not chkbxK_VEN.Checked Then Inc(vlContador);
    If Not chkbxI_VIG.Checked Then Inc(vlContador);
    If Not chkbxI_IMP.Checked Then Inc(vlContador);
    If Not chkbxI_VEN.Checked Then Inc(vlContador);

    If vlContador = 6 Then
     If (Sender Is TCheckBox) Then
         (Sender As TCheckBox).Checked := True;
    End;
end;

procedure TWMqrcoco.HabilitaCtrlFecha(pebHabilita: Boolean);
begin
  dtpFechaEspecifica.Enabled := pebHabilita;
  If pebHabilita Then dtpFechaEspecifica.Color := clWindow
  Else dtpFechaEspecifica.Color := clBtnFace;
end;

procedure TWMqrcoco.HabilitaCtrlsFechaEsp(pebHabilita: Boolean);
begin
  cbFechaEspecifica.Enabled := pebHabilita;
  HabilitaCtrlFecha(cbFechaEspecifica.Checked And pebHabilita);
  HabilitaCtrlAnioMes(Not(cbFechaEspecifica.Checked And pebHabilita));
end;

procedure TWMqrcoco.HabilitaCtrlAnioMes(pebHabilita: Boolean);
begin
  cbMes.Enabled := pebHabilita;
  cbAnio.Enabled := pebHabilita;
  If pebHabilita Then
    Begin
    cbMes.Color := clWindow;
    cbAnio.Color := clWindow;
    End
  Else
    Begin
    cbMes.Color := clBtnFace;
    cbAnio.Color := clBtnFace;
    End;
end;

procedure TWMqrcoco.cbFechaEspecificaClick(Sender: TObject);
begin
  HabilitaCtrlFecha(cbFechaEspecifica.Checked);
end;

procedure TWMqrcoco.rgTipoReporteClick(Sender: TObject);
begin
  HabilitaCtrlsFechaEsp(rgTipoReporte.ItemIndex = 1);
end;

procedure TWMqrcoco.dtpFechaEspecificaChange(Sender: TObject);
var wYear, wMonth, wDay: Word;
begin
  Try
    DecodeDate(dtpFechaEspecifica.Date, wYear, wMonth, wDay);
    cbMes.Text  := Objeto.DameMes(Integer(wMonth));
    cbAnio.Text := IntToStr(Integer(wYear));
  Finally
  End;
end;

procedure TWMqrcoco.BContaIcre2Click(Sender: TObject);
begin
     if (BContaIcre2.Checked) then
     begin
          cbContaIcreN.Checked := False;
          cbContaIcreNRE.Checked := False;
     end;
end;

procedure TWMqrcoco.cbContaIcreNClick(Sender: TObject);
begin
     if (cbContaIcreN.Checked) then
     begin
          BContaIcre2.Checked := False;
          cbContaIcreNRE.Checked := False;
     end;
end;

procedure TWMqrcoco.cbContaIcreNREClick(Sender: TObject);
begin
     if (cbContaIcreNRE.Checked) then
     begin
          cbContaIcreN.Checked := False;
          BContaIcre2.Checked := False;
     end;
end;

procedure TWMqrcoco.BitBtn1Click(Sender: TObject);
begin
     ArmaCadenaSQLCuotas;
     ReQueryCuotas;
     SGClBusMovNoAutDet.Clear(' NO EXISTEN DATOS A LA FECHA SOLICITADA'#30'>C');
     SGClBusMovNoAutDet2.Clear('NO EXISTEN DATOS A LA FECHA SOLICITADA'#30'>C');
end;

procedure TWMqrcoco.SGClBusMovNoAutDblClick(Sender: TObject);
begin
     ArmaCadenaSQLCuotasDet;
     ReQueryCuotasDet;
     SGClBusMovNoAutDet2.Clear('NO EXISTEN DATOS A LA FECHA SOLICITADA'#30'>C');
end;

procedure TWMqrcoco.SGClBusMovNoAutDetDblClick(Sender: TObject);
begin
     ArmaCadenaSQLCuotasDet2;
     ReQueryCuotasDet2;
end;

procedure TWMqrcoco.RGDet2Click(Sender: TObject);
begin
     ArmaCadenaSQLCuotasDet2;
     ReQueryCuotasDet2;
end;

procedure TWMqrcoco.dtpFechaConciliadorChange(Sender: TObject);
begin
     SGClBusMovNoAut.Clear(' NO EXISTEN DATOS A LA FECHA SOLICITADA'#30'>C');
     SGClBusMovNoAutDet.Clear(' NO EXISTEN DATOS A LA FECHA SOLICITADA'#30'>C');
     SGClBusMovNoAutDet2.Clear(' NO EXISTEN DATOS A LA FECHA SOLICITADA'#30'>C');
end;

function TWMqrcoco.ObtieneFecha(pMes, pAnio: Integer): TDateTime;
var
  Q : TQuery;
  vlSqlFecha : String;

begin
  vlSqlFecha := ' SELECT LAST_DAY(TO_DATE('#39'01'#39'||TO_CHAR('+IntToStr(pMes)+
                ','+#39'00'#39')||TO_CHAR('+IntToStr(pAnio)+
                ','#39'0000'#39'),'#39'DDMMYYYY'#39')) AS F_ESPECIFICA FROM DUAL';

  Q :=  GetSQLQuery(vlSqlFecha,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);

  try
     if Q <> nil then
        ObtieneFecha := q.FieldByName('F_ESPECIFICA').AsDateTime
     else
        ObtieneFecha := Objeto.Apli.DameFechaEmpresa;
  finally
    if Q <> nil then
       Q.free;
  end;



end;

procedure TWMqrcoco.cbMesChange(Sender: TObject);
begin
  dtpFechaEspecifica.Date := ObtieneFecha(Objeto.DameNoMes(cbMes.Text), StrToInt(cbAnio.Text));
end;

procedure TWMqrcoco.cbAnioChange(Sender: TObject);
begin
  dtpFechaEspecifica.Date := ObtieneFecha(Objeto.DameNoMes(cbMes.Text), StrToInt(cbAnio.Text));
end;

end.
