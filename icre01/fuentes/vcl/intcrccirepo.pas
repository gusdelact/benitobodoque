// Sistema         : Clase de CR_CCI_REPORTE
// Fecha de Inicio : 06/11/2009
// Función forma   : Clase de CR_CCI_REPORTE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrCciRepo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, ComObj,

Excel_TLB,
ShellApi,
IntGenCre,
IntParamCre,
IntXls
;

Const
  coCOL_MONEDA            = 'B';
  coCOL_CONSEC            = 'C';
  coCOL_CCI_NO            = 'D';
  coCOL_CLIENTE           = 'E';
  coCOL_IMP_CCI           = 'F';
  coCOL_PCT_ADIC          = 'G';
  coCOL_IMP_TOT           = 'H';
  coCOL_IMP_TOT_MN        = 'I';
  coCOL_FECHA_INI         = 'J';
  coCOL_FECHA_VTO         = 'K';
  coCOL_PLAZO             = 'L';
  coCOL_FECHA_INI_PAR     = 'M';
  coCOL_FECHA_VTO_PAR     = 'N';
  coCOL_PLAZO_PAR         = 'O';
  coCOL_DETALLE_PAR       = 'P';
  coCOL_VIGENCIA_PAR      = 'Q';
  coCOL_MES_PAR           = 'R';
  coCOL_IMP_PAGOS         = 'S';
  coCOL_SALDO_CCI         = 'T';
  coCOL_CCI               = 'U';
  coCOL_IMP_DISPONER      = 'V';
  coCOL_SALDO_DLS         = 'W';
  coCOL_IMP_GTIAS         = 'X';
  coCOL_DESC_GTIA         = 'Y';
  coCOL_BLANCO            = 'Z';
  coCOL_COM_IMP_PAG       = 'AA';
  coCOL_COM_IMP_PAG_IVA   = 'AB';
  coCOL_COM_IMP_PAG_TOT   = 'AC';


{  coCOL_IMP_COMISION      = 'W';
  coCOL_SALDO_DLS         = 'X';
  coCOL_IMP_GTIAS         = 'Y';
  coCOL_DESC_GTIA         = 'Z';
  coCOL_BLANCO            = 'AA';
  coCOL_COM_IMP_PAG       = 'AB';
  coCOL_COM_IMP_PAG_IVA   = 'AC';
  coCOL_COM_IMP_PAG_TOT   = 'AD';
}

Type
 TCrCciRepo= class;

  TWCrCciReporte=Class(TForm)
    InterForma1             : TInterForma;
    Label1: TLabel;
    dtpF_CIERRE: TDateTimePicker;
    btBusca: TButton;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    SGDatos: TSGCtrl;
    btnGenArchivoXLS: TButton;
    edFileNameExcel: TEdit;
    lbFileNameExcel: TLabel;
    SaveDialog1: TSaveDialog;
    btnFileNameXLS: TButton;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btnGenArchivoXLSClick(Sender: TObject);
    procedure btBuscaClick(Sender: TObject);
    procedure btnFileNameXLSClick(Sender: TObject);
    procedure dtpF_CIERREChange(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrCciRepo;
    vgQryCartas : TQuery;

    function  UltimoDia(peFecha : TDateTime) : TDateTime;
    function  DevuelveTotalMesAnterior : Double;
    function  DevuelveAfectacionesMes(peCVE_AFEC_SALDO : String) : Double;
    function  ArmaQuery(peF_CIERRE : TDateTime) : String;
    procedure MuestraInformacion;
    procedure ArmaArchivoExcel(peStrFileName : String);
end;
 TCrCciRepo= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation

{$R *.DFM}


constructor TCrCciRepo.Create( AOwner : TComponent );
begin Inherited;
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrCciRepo.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCciRepo.Destroy;
begin inherited;
end;


function TCrCciRepo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCciReporte;
begin
   W:=TWCrCciReporte.Create(Self);
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


Function TCrCciRepo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCcRe.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_CCI_REPORTE********************)
(*                                                                              *)
(*  FORMA DE CR_CCI_REPORTE                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CCI_REPORTE********************)

procedure TWCrCciReporte.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    dtpF_CIERRE.Date := Now;
    End;
end;

procedure TWCrCciReporte.FormDestroy(Sender: TObject);
begin
  With Objeto Do
    Begin
    End;
end;

procedure TWCrCciReporte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  vgQryCartas.Close;
  vgQryCartas.Free;
  Action := caFree;
end;

procedure TWCrCciReporte.btnGenArchivoXLSClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCCIREPO_EXCEL',True,True) then
   begin
      If (Trim(ExtractFileName(edFileNameExcel.Text)) = '') Then
         Begin
         MessageDlg('Favor de indicar la ruta en donde se depositará el archivo Excel.', mtWarning, [mbOk], 0);
         If edFileNameExcel.CanFocus Then edFileNameExcel.SetFocus;
         Exit;
         End;

      If FileExists(edFileNameExcel.Text) Then
         Begin
         If (MessageDlg('El archivo indicado ya existe. ¿Desea sobreescribirlo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
            Begin
            DeleteFile(edFileNameExcel.Text);
            End
         Else
            Begin
            MessageDlg('Favor de indicar otro archivo Excel ú otra ruta.', mtWarning, [mbOk], 0);
            If edFileNameExcel.CanFocus Then edFileNameExcel.SetFocus;
            Exit;
            End;
         End;

      If (SGDatos.SG.RowCount < 2) Then
         Begin
         btBuscaClick(Self);
         End;

      If (SGDatos.SG.RowCount < 2) Then
         Begin
         MessageDlg('No existen datos para generar el archivo', mtWarning, [mbOk], 0);
         Exit;
         End;

      btnGenArchivoXLS.Enabled := False;
      btBUSCA.Enabled := False;
      SGDatos.Cursor := crHourGlass;
      ArmaArchivoExcel(edFileNameExcel.Text);
   end;
end;

procedure TWCrCciReporte.btBuscaClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCCIREPO_MUES',True,True) then
      MuestraInformacion;
end;

function  TWCrCciReporte.ArmaQuery(peF_CIERRE : TDateTime) : String;
var vlStrSQL, vlSQLFecha : String;
begin
  vlSQLFecha := SQLFecha(peF_CIERRE);
  vlStrSQL :=  ' SELECT RESULT.*, M.DESC_MONEDA'+coCRLF+
               ' FROM ('+coCRLF+
               '        SELECT CCC1.ID_CONTRATO,'+coCRLF+
               '               CTO.CVE_MONEDA,'+coCRLF+
               '               CCC1.ID_CREDITO,'+coCRLF+
               '               P.NOMBRE,'+coCRLF+
               '               CCC1.IMP_CREDITO,'+coCRLF+
               '               PCT_ADICIONAL,'+coCRLF+
               '               CCC1.IMP_CREDITO + ROUND(CCC1.IMP_CREDITO * CCC1.PCT_ADICIONAL / 100 , 2) AS IMP_TOTAL_CCI,'+coCRLF+
               '               CCC1.F_DISPOSICION,'+coCRLF+
               '               CCC1.F_VENCIMIENTO,'+coCRLF+
               '               '''' AS S1,'+coCRLF+
               '               (CCC1.F_VENCIMIENTO - CCC1.F_DISPOSICION) AS DIAS_PLAZO,'+coCRLF+
               '               '''' AS S2,'+coCRLF+
               '               '''' AS S3,'+coCRLF+
               '               '''' AS S4,'+coCRLF+
               '               '''' AS S5,'+coCRLF+
               '               '''' AS S6,'+coCRLF+
               '               NVL(CCI_TRANSAC.SUM_IMP_CONCEPTO, 0) AS IMP_DISMINUIDO,'+coCRLF+
               '               NVL(CCI_TRANSAC_MES.SUM_IMP_CONCEPTO_MES, 0) AS IMP_DISMINUIDO_MES,'+coCRLF+               
               '               CCC1.IMP_CREDITO +  ROUND(CCC1.IMP_CREDITO * CCC1.PCT_ADICIONAL / 100 , 2) +'+coCRLF+
               '               NVL(CCI_TRANSAC.SUM_IMP_CONCEPTO, 0) AS SALDO_CCI,'+coCRLF+
               '               COMIS1.SUM_IMP_COMISION,'+coCRLF+
               '               CCC1.IMP_GARANTIA,'+coCRLF+
               '               SUBSTR(CCC1.DESC_GTIA_ADIC, 1, 250) AS DESC_GTIA_ADIC,'+coCRLF+
               '               NVL(COMIS_PAG.SUM_IMP_COMIS_PAG,0) AS IMP_COMIS_PAG,'+coCRLF+
               '               NVL(COMIS_PAG.SUM_IMP_IVA_PAG,0) AS IMP_IVA_PAG,'+coCRLF+
               '               ( NVL(COMIS_PAG.SUM_IMP_COMIS_PAG,0) +'+coCRLF+
               '                 NVL(COMIS_PAG.SUM_IMP_IVA_PAG,0)) AS IMP_TOT_COM_PAG'+coCRLF+
               '        FROM ( -- Obtiene las cartas de crédito Vigentes'+coCRLF+
               '               SELECT'+coCRLF+
               '                      CCC. ID_CONTRATO,'+coCRLF+
               '                      CCC.ID_CREDITO,'+coCRLF+
               '                      CCC.IMP_CREDITO,'+coCRLF+
               '                      NVL(CCC.PCT_ADICIONAL, 0) AS PCT_ADICIONAL,'+coCRLF+
               '                      CCC.F_DISPOSICION,'+coCRLF+
               '                      CCC.F_VENCIMIENTO,'+coCRLF+
               '                      CCC.IMP_GARANTIA,'+coCRLF+
               '                      CCC.DESC_GTIA_ADIC'+coCRLF+
               '               FROM CR_CON_REG_CCI CCC'+coCRLF+
               '               WHERE  CCC.ID_REG_VIGENTE = 1'+coCRLF+
               '                 AND (   ( CCC.F_DISPOSICION <= '+vlSQLFecha+' AND CCC.SIT_CON_REG_CCI = ''AC'')'+coCRLF+
               '                      OR ( CCC.F_LIQUIDACION > '+vlSQLFecha+')'+coCRLF+
               '                      OR ( CCC.F_LIQUIDACION BETWEEN TO_DATE(''01/''||TO_CHAR('+vlSQLFecha+',''MM/YYYY''),''DD/MM/YYYY'') AND '+vlSQLFecha+')'+coCRLF+

               '                     ) '+coCRLF+
               '             ) CCC1,'+coCRLF+
               '             ( -- Obtiene todas las afectaciones de las cartas de créditos'+coCRLF+
               '               -- aplicadas al corte solicitado'+coCRLF+
               '               SELECT CCI.ID_CREDITO,'+coCRLF+
               '                      SUM(CCI.IMP_CONCEPTO * DECODE(CCCONC.CVE_AFEC_SALDO, ''I'', 1, ''D'', -1, 0)) AS SUM_IMP_CONCEPTO'+coCRLF+
               '               FROM ( SELECT CCC2.ID_CREDITO'+coCRLF+
               '                      FROM CR_CON_REG_CCI CCC2'+coCRLF+
               '                      WHERE  CCC2.ID_REG_VIGENTE = 1'+coCRLF+
               '                        AND (   ( CCC2.F_DISPOSICION <= '+vlSQLFecha+' AND CCC2.SIT_CON_REG_CCI = ''AC'')'+coCRLF+
               '                             OR ( CCC2.F_LIQUIDACION > '+vlSQLFecha+')'+coCRLF+
               '                             OR ( CCC2.F_LIQUIDACION BETWEEN TO_DATE(''01/''||TO_CHAR('+vlSQLFecha+',''MM/YYYY''),''DD/MM/YYYY'') AND '+vlSQLFecha+')'+coCRLF+
               '                            ) '+coCRLF+
               '                    ) CCC3,'+coCRLF+
               '                    CR_CCI_TRANSAC CCI,'+coCRLF+
               '                    CR_CCI_CONCEPTO CCCONC '+coCRLF+
               '               WHERE CCI.ID_CREDITO = CCC3.ID_CREDITO'+coCRLF+
               '                 AND CCI.F_OPERACION <= '+vlSQLFecha+coCRLF+
               '                 AND CCI.SIT_CCI_TRANSAC <> ''CA'''+coCRLF+
               '                 AND CCCONC.CVE_CCI_CONCEPTO = CCI.CVE_CCI_CONCEPTO'+coCRLF+
               '               GROUP BY CCI.ID_CREDITO'+coCRLF+
               '             ) CCI_TRANSAC,'+coCRLF+
               '             ( -- Obtiene todas las afectaciones de las cartas de créditos'+coCRLF+
               '               -- aplicadas en el MES solicitado'+coCRLF+
               '               SELECT CCI.ID_CREDITO,'+coCRLF+
               '                      SUM(CCI.IMP_CONCEPTO * DECODE(CCCONC.CVE_AFEC_SALDO, ''I'', 1, ''D'', -1, 0)) AS SUM_IMP_CONCEPTO_MES'+coCRLF+
               '               FROM ( SELECT CCC2.ID_CREDITO'+coCRLF+
               '                      FROM CR_CON_REG_CCI CCC2'+coCRLF+
               '                      WHERE  CCC2.ID_REG_VIGENTE = 1'+coCRLF+
               '                        AND (   ( CCC2.F_DISPOSICION <= '+vlSQLFecha+' AND CCC2.SIT_CON_REG_CCI = ''AC'')'+coCRLF+
               '                             OR ( CCC2.F_LIQUIDACION > '+vlSQLFecha+')'+coCRLF+
               '                             OR ( CCC2.F_LIQUIDACION BETWEEN TO_DATE(''01/''||TO_CHAR('+vlSQLFecha+',''MM/YYYY''),''DD/MM/YYYY'') AND '+vlSQLFecha+')'+coCRLF+
               '                            ) '+coCRLF+
               '                    ) CCC3,'+coCRLF+
               '                    CR_CCI_TRANSAC CCI,'+coCRLF+
               '                    CR_CCI_CONCEPTO CCCONC '+coCRLF+
               '               WHERE CCI.ID_CREDITO = CCC3.ID_CREDITO'+coCRLF+
               '                 AND CCI.F_OPERACION BETWEEN TO_DATE(''01/''||TO_CHAR('+vlSQLFecha+',''MM/YYYY''),''DD/MM/YYYY'') AND '+vlSQLFecha+coCRLF+
               '                 AND CCI.SIT_CCI_TRANSAC <> ''CA'''+coCRLF+
               '                 AND CCCONC.CVE_CCI_CONCEPTO = CCI.CVE_CCI_CONCEPTO'+coCRLF+
               '               GROUP BY CCI.ID_CREDITO'+coCRLF+
               '             ) CCI_TRANSAC_MES,'+coCRLF+
               '             ( -- Obtiene el importe de la comisión'+coCRLF+
               '               SELECT COMIS.ID_CREDITO,'+coCRLF+
               '                      SUM(COMIS.IMP_COMISION) AS SUM_IMP_COMISION,'+coCRLF+
               '                      SUM(COMIS.IMP_IVA) AS SUM_IMP_IVA'+coCRLF+
               '               FROM ( SELECT CCC4.ID_CREDITO'+coCRLF+
               '                      FROM CR_CON_REG_CCI CCC4'+coCRLF+
               '                      WHERE  CCC4.ID_REG_VIGENTE = 1'+coCRLF+
               '                        AND (   ( CCC4.F_DISPOSICION <= '+vlSQLFecha+' AND CCC4.SIT_CON_REG_CCI = ''AC'')'+coCRLF+
               '                             OR ( CCC4.F_LIQUIDACION > '+vlSQLFecha+')'+coCRLF+
               '                             OR ( CCC4.F_LIQUIDACION BETWEEN TO_DATE(''01/''||TO_CHAR('+vlSQLFecha+',''MM/YYYY''),''DD/MM/YYYY'') AND '+vlSQLFecha+')'+coCRLF+
               '                            ) '+coCRLF+
               '                    ) CCC5,'+coCRLF+
               '                    CR_CCI_COMIS COMIS'+coCRLF+
               '               WHERE COMIS.ID_CREDITO = CCC5.ID_CREDITO'+coCRLF+
               '                 AND COMIS.SIT_COMISION <> ''CA'''+coCRLF+
               '               GROUP BY COMIS.ID_CREDITO'+coCRLF+
               '             ) COMIS1,'+coCRLF+
               '             ( -- Obtiene las comisiones pagadas'+coCRLF+
               '               SELECT COMIS.ID_CREDITO,'+coCRLF+
               '                      SUM(COMIS.IMP_COMIS_PAG) AS SUM_IMP_COMIS_PAG,'+coCRLF+
               '                      SUM(COMIS.IMP_IVA_PAG) AS SUM_IMP_IVA_PAG'+coCRLF+
               '               FROM ( SELECT CCC6.ID_CREDITO'+coCRLF+
               '                      FROM CR_CON_REG_CCI CCC6'+coCRLF+
               '                      WHERE  CCC6.ID_REG_VIGENTE = 1'+coCRLF+
               '                        AND (    ( CCC6.F_DISPOSICION <= '+vlSQLFecha+' AND CCC6.SIT_CON_REG_CCI = ''AC'')'+coCRLF+
               '                              OR ( CCC6.F_LIQUIDACION > '+vlSQLFecha+')'+coCRLF+
               '                              OR ( CCC6.F_LIQUIDACION BETWEEN TO_DATE(''01/''||TO_CHAR('+vlSQLFecha+',''MM/YYYY''),''DD/MM/YYYY'') AND '+vlSQLFecha+')'+coCRLF+
               '                            ) '+coCRLF+
               '                    ) CCC7,'+coCRLF+
               '                    CR_CCI_COMIS COMIS'+coCRLF+
               '               WHERE COMIS.ID_CREDITO = CCC7.ID_CREDITO'+coCRLF+
               '                 AND COMIS.F_APLICACION BETWEEN TO_DATE(''01/''||TO_CHAR('+vlSQLFecha+',''MM/YYYY''),''DD/MM/YYYY'') AND '+vlSQLFecha+' '+coCRLF+
               '                 AND COMIS.SIT_COMISION <> ''CA'''+coCRLF+
               '               GROUP BY COMIS.ID_CREDITO'+coCRLF+
               '             ) COMIS_PAG,'+coCRLF+
               '             CONTRATO CTO,'+coCRLF+
               '             PERSONA P'+coCRLF+
               '        WHERE CTO.ID_CONTRATO = CCC1.ID_CONTRATO'+coCRLF+
               '          AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
               '          AND CCI_TRANSAC.ID_CREDITO (+)= CCC1.ID_CREDITO'+coCRLF+
               '          AND CCI_TRANSAC_MES.ID_CREDITO (+)= CCC1.ID_CREDITO'+coCRLF+
               '          AND COMIS1.ID_CREDITO (+)= CCC1.ID_CREDITO'+coCRLF+
               '          AND COMIS_PAG.ID_CREDITO (+)= CCC1.ID_CREDITO'+coCRLF+
               '     ) RESULT,'+coCRLF+
               '     MONEDA M'+coCRLF+
               ' WHERE M.CVE_MONEDA = RESULT.CVE_MONEDA'+coCRLF+
               ' ORDER BY RESULT.CVE_MONEDA, RESULT.NOMBRE, RESULT.ID_CREDITO'+coCRLF;
   Result := vlStrSQL;
end;

function TWCrCciReporte.UltimoDia(peFecha : TDateTime) : TDateTime;
var vlFecha : Real;
begin
  GetSQLFloat('SELECT LAST_DAY('+SQLFecha(peFecha)+') AS FECHA FROM DUAL',
              Objeto.Apli.DatabaseName, Objeto.Apli.SessionName,
              'FECHA', vlFecha, True);
  Result := Double (vlFecha);
end;

function TWCrCciReporte.DevuelveTotalMesAnterior : Double;
var vlStrSQL : String;
    vlFecha : TDateTime;
    vlwAnio, vlwMes, vlwDia : Word;
    vlSALDO_TOTAL : Real;
begin
   vlFecha := UltimoDia(IncMonth(dtpF_CIERRE.Date,-1));
   DecodeDate(vlFecha, vlwAnio, vlwMes, vlwDia);

   vlStrSQL :=  ' SELECT '+coCRLF+
                '       SUM( DECODE(R.CVE_MONEDA, 484, 1, -- SI ES PESO MEXICANO SE TOMA EL TIPO DE CAMBIO COMO 1'+coCRLF+
                '                   PKGCRCONSOLIDADO1.FNC_OBT_TIPO_CAMBIO_REGUL(R.CVE_MONEDA, ''FMAC'', '+IntToStr(vlwAnio)+','+IntToStr(vlwMes)+') -- DE LO CONTRARIO OBTIENE EL TIPO DE CAMBIO'+coCRLF+
                '                  ) * R.SALDO_CCI ) AS SALDO_TOTAL'+coCRLF+
                ' FROM ( '+coCRLF+
                ArmaQuery(vlFecha)+coCRLF+
                ' ) R'+coCRLF
                ;
   If GetSQLFloat(vlStrSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'SALDO_TOTAL', vlSALDO_TOTAL, True) Then
     Result := vlSALDO_TOTAL
   Else
     Result := 0;
end;

function TWCrCciReporte.DevuelveAfectacionesMes(peCVE_AFEC_SALDO : String) : Double;
var vlStrSQL : String;
    vlFechaIni, vlFechaFin : String;
    vlwAnio, vlwMes, vlwDia : Word;
    vlSUM_IMP_CONCEPTO : Real;
begin
   vlFechaFin := SQLFecha(dtpF_CIERRE.Date);
   DecodeDate(dtpF_CIERRE.Date, vlwAnio, vlwMes, vlwDia);
   vlFechaIni := SQLFecha(StrToDate('1/'+IntToStr(vlwMes)+'/'+IntToStr(vlwAnio)));

   vlStrSQL :=  ' SELECT'+coCRLF+
                '       SUM( DECODE(CCC3.CVE_MONEDA, 484, 1, -- SI ES PESO MEXICANO SE TOMA EL TIPO DE CAMBIO COMO 1'+coCRLF+
                '                                 PKGCRCONSOLIDADO1.FNC_OBT_TIPO_CAMBIO_REGUL(CCC3.CVE_MONEDA, ''FMAC'', '+IntToStr(vlwAnio)+', '+IntToStr(vlwMes)+')'+coCRLF+
                '                  ) *'+coCRLF+
                '            CCI.IMP_CONCEPTO * DECODE(CCCONC.CVE_AFEC_SALDO, ''I'', 1, ''D'', -1, 0)'+coCRLF+
                '          ) AS SUM_IMP_CONCEPTO'+coCRLF+
                ' FROM ( SELECT CTO.CVE_MONEDA, CCC2.ID_CREDITO'+coCRLF+
                '        FROM CR_CON_REG_CCI CCC2,'+coCRLF+
                '             CONTRATO CTO'+coCRLF+
                '        WHERE  CCC2.ID_REG_VIGENTE = 1'+coCRLF+
                '          AND (   ( CCC2.F_DISPOSICION <= '+vlFechaFin+' AND CCC2.SIT_CON_REG_CCI = ''AC'')'+coCRLF+
                '               OR ( CCC2.F_LIQUIDACION > '+vlFechaFin+')'+coCRLF+
                '               OR ( CCC2.F_LIQUIDACION BETWEEN TO_DATE(''01/''||TO_CHAR('+vlFechaFin+',''MM/YYYY''),''DD/MM/YYYY'') AND '+vlFechaFin+')'+coCRLF+
                '              )'+coCRLF+
                '          AND CTO.ID_CONTRATO = CCC2.ID_CONTRATO'+coCRLF+
                '      ) CCC3,'+coCRLF+
                '      CR_CCI_TRANSAC CCI,'+coCRLF+
                '      CR_CCI_CONCEPTO CCCONC'+coCRLF+
                ' WHERE CCI.ID_CREDITO = CCC3.ID_CREDITO'+coCRLF+
                '   AND CCI.F_OPERACION BETWEEN '+vlFechaIni+' AND '+vlFechaFin+coCRLF+
                '   AND CCI.SIT_CCI_TRANSAC <> ''CA'''+coCRLF+
                '   AND CCCONC.CVE_CCI_CONCEPTO = CCI.CVE_CCI_CONCEPTO'+coCRLF+
                '   AND CCCONC.CVE_AFEC_SALDO = '+SQLStr(peCVE_AFEC_SALDO)+coCRLF
                ;
   If GetSQLFloat(vlStrSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'SUM_IMP_CONCEPTO', vlSUM_IMP_CONCEPTO, True) Then
     Result := vlSUM_IMP_CONCEPTO
   Else
     Result := 0;
end;

procedure TWCrCciReporte.MuestraInformacion;
var vlStrSQL, vlStrFieldName : String;
    vlQryTitulos : TQuery;
begin
   vlStrSQL := ArmaQuery(dtpF_CIERRE.Date);
   If Assigned(vgQryCartas) Then
     Begin
     vgQryCartas.Close;
     vgQryCartas.Free;
     End;

   vgQryCartas  := GetSQLQueryNoNil(vlStrSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
   vlQryTitulos  := GetSQLQueryNoNil('SELECT * FROM CR_REGUL_TIT_R04 WHERE CVE_CARTERA = '+SQLStr('CARTAS'),
                   Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);

   If Assigned(vlQryTitulos) Then
     Begin
     While Not vlQryTitulos.Eof Do
        Begin
        vlStrFieldName := vlQryTitulos.FieldByName('CVE_REGUL_TIT_R04').AsString;
        If Assigned(vgQryCartas.FindField(vlStrFieldName)) Then
          Begin
          vgQryCartas.FieldByName(vlStrFieldName).DisplayLabel := vlQryTitulos.FieldByName('DESC_REGUL_TIT_R04').AsString;
          vgQryCartas.FieldByName(vlStrFieldName).DisplayWidth := vlQryTitulos.FieldByName('NUM_ANCHO').AsInteger;
          If ( Trim(vlQryTitulos.FieldByName('TXT_FORMATO').AsString) <> '' ) Then
             Begin
             TFloatField(vgQryCartas.FieldByName(vlStrFieldName)).DisplayFormat := Trim(vlQryTitulos.FieldByName('TXT_FORMATO').AsString);
             End;
          End;
        vlQryTitulos.Next;
        End; // End While

     vlQryTitulos.Close;
     vlQryTitulos.Free;
     End; // If Assigned(vlQryTitulos) Then

   SGDatos.AddQry(vgQryCartas,True,True,20,20,20,True);
end;

procedure TWCrCciReporte.ArmaArchivoExcel(peStrFileName: String);
const
    aColumnWidth : Array[1..31] of Double  = ( 2.00,  5.00,  5.00,  5.00, 44.00, 16.00, 10.43,
                                              16.00, 16.00, 16.00, 16.00, 16.00,
                                              16.00, 16.00, 16.00, 16.00, 16.00,
                                              16.00, 16.00, 16.00, 16.00, // 16.00, Comisiones
                                              16.00, 16.00, 16.00, 16.00,  1.86,
                                              16.00, 16.00, 16.00, 16.00, 16.00
                                             );
var vlExcelApp : OleVariant;

    vlColExcel, vlRowExcel, vlRowStart : Integer;
    vlColumnRange : Variant;
    vlTopicNOMBRE : String;
    vlSUM_IMP_DISMINUIDO, vlSUM_IMP_TOTAL_CCI_OLD, vlSUM_IMP_TOTAL_CCI_NEW,
    vlSUM_IMP_CCI,    vlSUM_IMP_TOT,      vlSUM_IMP_TOT_MN,      vlSUM_IMP_PAGOS,
    vlSUM_SALDO_CCI,  vlSUM_IMP_DISPONER, vlSUM_IMP_COMISION,    vlSUM_SALDO_DLS,
    vlSUM_IMP_GTIAS,  vlSUM_COM_IMP_PAG,  vlSUM_COM_IMP_PAG_IVA, vlSUM_COM_IMP_PAG_TOT,
    vlTIPO_CAMBIO_DLLS, vlTIPO_CAMBIO_UDIS, vlTIPO_CAMBIO : Real;
    vlwAnio, vlwMes, vlwDia : Word;
    vlnConsecutivo : Integer;
    vlQryMoneda : TQuery;

//     vlIMP_DISMINUIDO_MES         ,
//     vlSUM_IMP_DISMINUIDO_MES     ,
     
     vlPESOS_SUM_IMP_CCI          ,
     vlPESOS_SUM_IMP_TOT          ,
     vlPESOS_SUM_IMP_TOT_MN       ,
     vlPESOS_SUM_IMP_PAGOS        ,
     vlPESOS_SUM_SALDO_CCI        ,
     vlPESOS_SUM_IMP_DISPONER     ,
     vlPESOS_SUM_IMP_COMISION     ,
     vlPESOS_SUM_SALDO_DLS        ,
     vlPESOS_SUM_IMP_GTIAS        ,
     vlPESOS_SUM_COM_IMP_PAG      ,
     vlPESOS_SUM_COM_IMP_PAG_IVA  ,
     vlPESOS_SUM_COM_IMP_PAG_TOT  ,
     vlDOLAR_SUM_IMP_CCI          ,
     vlDOLAR_SUM_IMP_TOT          ,
     vlDOLAR_SUM_IMP_TOT_MN       ,
     vlDOLAR_SUM_IMP_PAGOS        ,
     vlDOLAR_SUM_SALDO_CCI        ,
     vlDOLAR_SUM_IMP_DISPONER     ,
     vlDOLAR_SUM_IMP_COMISION     ,
     vlDOLAR_SUM_SALDO_DLS        ,
     vlDOLAR_SUM_IMP_GTIAS        ,
     vlDOLAR_SUM_COM_IMP_PAG      ,
     vlDOLAR_SUM_COM_IMP_PAG_IVA  ,
     vlDOLAR_SUM_COM_IMP_PAG_TOT  : Real;

    procedure ColocaBordes(peWeight : Integer = xlThin);
    var vlCol1 : Integer;
    begin
      For vlCol1 := 2 To ColumnXLS(coCOL_COM_IMP_PAG_TOT) Do
        Begin
          If (vlCol1 <> ColumnXLS(coCOL_BLANCO)) Then
            vlExcelApp.Cells[vlRowExcel, vlCol1].Borders.Weight := peWeight;
        End;
    end;

    procedure ColocaCorte;
    begin
      ColocaBordes;
      vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_CCI_NO)      ].Value  := 'TOTALES POR CLIENTE';
      vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_CCI)     ].Value  := '=SUM('+coCOL_IMP_CCI+IntToStr(vlRowStart)+':'+coCOL_IMP_CCI+IntToStr(vlRowExcel-1)+')';

      vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_TOT)     ].Value  := '=SUM('+coCOL_IMP_TOT+IntToStr(vlRowStart)+':'+coCOL_IMP_TOT+IntToStr(vlRowExcel-1)+')';
      vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_TOT_MN)  ].Value  := '=SUM('+coCOL_IMP_TOT_MN+IntToStr(vlRowStart)+':'+coCOL_IMP_TOT_MN+IntToStr(vlRowExcel-1)+')';
      vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_PAGOS)   ].Value  := '=SUM('+coCOL_IMP_PAGOS+IntToStr(vlRowStart)+':'+coCOL_IMP_PAGOS+IntToStr(vlRowExcel-1)+')';
      vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_SALDO_CCI)   ].Value  := '=SUM('+coCOL_SALDO_CCI+IntToStr(vlRowStart)+':'+coCOL_SALDO_CCI+IntToStr(vlRowExcel-1)+')';
      vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_CCI)         ].Value  := '=SUM('+coCOL_CCI+IntToStr(vlRowStart)+':'+coCOL_CCI+IntToStr(vlRowExcel-1)+')';
      vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_DISPONER)].Value  := '=SUM('+coCOL_IMP_DISPONER+IntToStr(vlRowStart)+':'+coCOL_IMP_DISPONER+IntToStr(vlRowExcel-1)+')';
//      vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_COMISION)].Value  := '=SUM('+coCOL_IMP_COMISION+IntToStr(vlRowStart)+':'+coCOL_IMP_COMISION+IntToStr(vlRowExcel-1)+')';
      vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_SALDO_DLS)   ].Value  := '=SUM('+coCOL_SALDO_DLS+IntToStr(vlRowStart)+':'+coCOL_SALDO_DLS+IntToStr(vlRowExcel-1)+')';
      vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_GTIAS)   ].Value  := '=SUM('+coCOL_IMP_GTIAS+IntToStr(vlRowStart)+':'+coCOL_IMP_GTIAS+IntToStr(vlRowExcel-1)+')';

      vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_COM_IMP_PAG) ].Value  := '=SUM('+coCOL_COM_IMP_PAG+IntToStr(vlRowStart)+':'+coCOL_COM_IMP_PAG+IntToStr(vlRowExcel-1)+')';
      vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_COM_IMP_PAG_IVA) ].Value := '=SUM('+coCOL_COM_IMP_PAG_IVA+IntToStr(vlRowStart)+':'+coCOL_COM_IMP_PAG_IVA+IntToStr(vlRowExcel-1)+')';
      vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_COM_IMP_PAG_TOT) ].Value := '=SUM('+coCOL_COM_IMP_PAG_TOT+IntToStr(vlRowStart)+':'+coCOL_COM_IMP_PAG_TOT+IntToStr(vlRowExcel-1)+')';

      vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range[coCOL_MONEDA+IntToStr(vlRowExcel)+':'+coCOL_DESC_GTIA+IntToStr(vlRowExcel)];
      vlColumnRange.Font.Bold := True;
      vlColumnRange.Columns.Interior.ColorIndex := 15; // Gris Claro

      vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range[coCOL_COM_IMP_PAG+IntToStr(vlRowExcel)+':'+coCOL_COM_IMP_PAG_TOT+IntToStr(vlRowExcel)];
      vlColumnRange.Font.Bold := True;
      vlColumnRange.Columns.Interior.ColorIndex := 15; // Gris Claro

      vlTopicNOMBRE := vgQryCartas.FieldByName('NOMBRE').AsString;
      Inc(vlRowExcel, 2);
      vlRowStart := vlRowExcel;
    end;

begin
    // Obtiene el Tipo de Cambio
    DecodeDate(dtpF_CIERRE.Date, vlwAnio, vlwMes, vlwDia);

    GetSQLFloat('SELECT PKGCRCONSOLIDADO1.FNC_OBT_TIPO_CAMBIO_REGUL(840, ''FMAC'', '+IntToStr(vlwAnio)+', '+IntToStr(vlwMes)+') AS TIPO_CAMBIO FROM DUAL',
                 Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'TIPO_CAMBIO', vlTIPO_CAMBIO_DLLS, False);

    GetSQLFloat('SELECT PKGCRCONSOLIDADO1.FNC_OBT_TIPO_CAMBIO_REGUL(800, ''FMAC'', '+IntToStr(vlwAnio)+', '+IntToStr(vlwMes)+') AS TIPO_CAMBIO FROM DUAL',
                 Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'TIPO_CAMBIO', vlTIPO_CAMBIO_UDIS, False);

    vlExcelApp := CreateOleObject('Excel.Application');
    vlExcelApp.Workbooks.Add;
    vLExcelApp.Workbooks[1].WorkSheets[1].Name := 'Cartas';
    vLExcelApp.ActiveWindow.DisplayGridlines := False;

    //----------------------------------------------------
    // Coloca el tipo de fuente a 8 de Todas las Columnas
    vlColumnRange := vLExcelApp.Workbooks[1].WorkSheets[1].Columns;

    For vlColExcel := 1 To 31 Do
      Begin
        vlColumnRange.Columns[vlColExcel].Font.Size := 9;
        vlColumnRange.Columns[vlColExcel].ColumnWidth := aColumnWidth[vlColExcel];

        If (  (vlColExcel = ColumnXlS(coCOL_IMP_CCI)) Or
              (vlColExcel = ColumnXlS(coCOL_IMP_TOT)) Or
              (vlColExcel = ColumnXlS(coCOL_IMP_TOT_MN)) Or
              (vlColExcel = ColumnXlS(coCOL_IMP_PAGOS)) Or
              (vlColExcel = ColumnXlS(coCOL_SALDO_CCI)) Or
              (vlColExcel = ColumnXlS(coCOL_IMP_DISPONER)) Or
//              (vlColExcel = ColumnXlS(coCOL_IMP_COMISION)) Or
              (vlColExcel = ColumnXlS(coCOL_SALDO_DLS)) Or
              (vlColExcel = ColumnXlS(coCOL_IMP_GTIAS)) Or
              (vlColExcel = ColumnXlS(coCOL_COM_IMP_PAG)) Or
              (vlColExcel = ColumnXlS(coCOL_COM_IMP_PAG_IVA)) Or
              (vlColExcel = ColumnXlS(coCOL_COM_IMP_PAG_TOT))
           ) Then
          vlColumnRange.Columns[vlColExcel].NumberFormat := '#,##0.00'

        Else If (vlColExcel = ColumnXlS(coCOL_PCT_ADIC)) Then
          vlColumnRange.Columns[vlColExcel].NumberFormat := '#,##0.0000'

      End;

    vlExcelApp.Cells[10, ColumnXlS(coCOL_FECHA_INI_PAR)].Borders.Weight := xlThick;
    vlExcelApp.Cells[10, ColumnXlS(coCOL_FECHA_VTO_PAR)].Borders.Weight := xlThick;
    vlExcelApp.Cells[10, ColumnXlS(coCOL_PLAZO_PAR    )].Borders.Weight := xlThick;

    vlExcelApp.Cells[10, ColumnXlS(coCOL_COM_IMP_PAG)].Borders.Weight := xlThick;
    vlExcelApp.Cells[10, ColumnXlS(coCOL_COM_IMP_PAG_IVA)].Borders.Weight := xlThick;
    vlExcelApp.Cells[10, ColumnXlS(coCOL_COM_IMP_PAG_TOT)].Borders.Weight := xlThick;

    vlRowExcel := 11;
    ColocaBordes(xlThick);

    vlExcelApp.Workbooks[1].WorkSheets[1].Range[coCOL_CCI_NO+'1:'+coCOL_COM_IMP_PAG_TOT+'10'].Font.Bold := True;

    vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range[coCOL_FECHA_INI_PAR+'10:'+coCOL_PLAZO_PAR+'10'];
    vlColumnRange.Columns.Interior.ColorIndex := 16; // Gris Oscuro

    vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range[coCOL_MONEDA+'11:'+coCOL_DESC_GTIA+'11'];
    vlColumnRange.Columns.Interior.ColorIndex := 15; // Gris Claro

    vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range[coCOL_COM_IMP_PAG+'11:'+coCOL_COM_IMP_PAG_TOT+'11'];
    vlColumnRange.Columns.Interior.ColorIndex := 15; // Gris Claro

    vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range[coCOL_COM_IMP_PAG+'10:'+coCOL_COM_IMP_PAG_TOT+'10'];
    vlColumnRange.Columns.Interior.ColorIndex := 16; // Gris Oscuro

    vlExcelApp.Range[coCOL_MONEDA+'11:'+coCOL_COM_IMP_PAG_TOT+'11'].WrapText := True;
    vlExcelApp.Range[coCOL_MONEDA+'11:'+coCOL_COM_IMP_PAG_TOT+'11'].HorizontalAlignment := xlHAlignCenter;
    vlExcelApp.Range[coCOL_MONEDA+'11:'+coCOL_COM_IMP_PAG_TOT+'11'].VerticalAlignment := xlTop;

    // oResizeRange.Borders.Item[xlEdgeBottom].LineStyle := xlDouble;

    //----------------------------------------------------
    // Coloca los títulos 1 PARA EL TIPO DE CAMBIO
    vlExcelApp.Cells[ 1 , ColumnXlS(coCOL_IMP_PAGOS) ].Value := 'FECHA INFORMACIÓN:';
    vlExcelApp.Cells[ 1 , ColumnXlS(coCOL_CCI) ].Value := FormatDateTime('dd"-"mmm"-"yyyy',dtpF_CIERRE.Date)+'.';
    vlExcelApp.Cells[ 2 , ColumnXlS(coCOL_IMP_PAGOS) ].Value := 'T.C CIERRE  :';
    vlExcelApp.Cells[ 1 , ColumnXlS(coCOL_SALDO_CCI) ].Value := FormatDateTime('dd"-"mmm"-"yyyy',dtpF_CIERRE.Date)+'.';
    vlExcelApp.Cells[ 2 , ColumnXlS(coCOL_CCI) ].Value := vlTIPO_CAMBIO_DLLS;

    //----------------------------------------------------
    // Coloca los títulos 2
    vlExcelApp.Cells[ 5 , ColumnXlS(coCOL_CCI_NO) ].Value := 'PARA:';
    vlExcelApp.Cells[ 5 , ColumnXlS(coCOL_CLIENTE) ].Value := 'ADMINISTRACIÓN DE CARTERA';
    vlExcelApp.Cells[ 6 , ColumnXlS(coCOL_CCI_NO) ].Value := 'DE:';
    vlExcelApp.Cells[ 6 , ColumnXlS(coCOL_CLIENTE) ].Value := 'MESA DE CONTROL';
    vlExcelApp.Cells[ 8 , ColumnXlS(coCOL_CLIENTE) ].Value := 'POSICIÓN DE CRÉDITOS COMERCIALES IRREVOCABLES EN MONEDA NACIONAL, CARTAS DE CRÉDITO DOMÉSTICAS VIGENTES AL '
                                                     +FormatDateTime('dd " de " mmmm  " de " yyyy',dtpF_CIERRE.Date)+'.';

    vlExcelApp.Cells[10 , ColumnXlS(coCOL_FECHA_INI_PAR) ].Value := '  DISPOSICIONES PARCIALES Y/O TOTALES';

    vlExcelApp.Cells[11 , ColumnXlS(coCOL_MONEDA)         ].Value := 'MONEDA';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_CONSEC)         ].Value := '#';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_CCI_NO)         ].Value := 'CCI No ';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_CLIENTE)        ].Value := 'CLIENTE';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_IMP_CCI)        ].Value := 'IMPORTE DE LA CCI';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_PCT_ADIC)       ].Value := '% ADICIONAL';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_IMP_TOT)        ].Value := 'IMPORTE TOTAL DE LA  CCI';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_IMP_TOT_MN)     ].Value := 'EQUIVALENTE EN M.N.';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_FECHA_INI)      ].Value := 'FECHA DE INICIO';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_FECHA_VTO)      ].Value := 'FECHA DE VENCIMIENTO';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_PLAZO)          ].Value := 'VIGENCIA EN DIAS';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_FECHA_INI_PAR)  ].Value := 'FECHA DE INICIO';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_FECHA_VTO_PAR)  ].Value := 'FECHA DE VENCIMIENTO';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_PLAZO_PAR )     ].Value := 'PLAZO EN DIAS';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_DETALLE_PAR)    ].Value := 'DETALLE DE TOTALES Y/O PARCIALES';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_VIGENCIA_PAR)   ].Value := 'VIGENCIA C.C.I.';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_MES_PAR)        ].Value := 'DEL MES';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_IMP_PAGOS)      ].Value := 'PAGOS EN EL MES';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_SALDO_CCI)      ].Value := 'SALDO ACTUAL DE LA CCI M.N.';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_CCI)            ].Value := 'C.C.I.';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_IMP_DISPONER)   ].Value := 'IMPORTE POR DISPONER';
//    vlExcelApp.Cells[11 , ColumnXlS(coCOL_IMP_COMISION)   ].Value := 'COMISIONES';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_SALDO_DLS)      ].Value := 'SALDO DLS';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_IMP_GTIAS)      ].Value := 'GARANTÍAS';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_DESC_GTIA)      ].Value := 'COMENTARIOS';

    vlExcelApp.Cells[11 , ColumnXlS(coCOL_COM_IMP_PAG) ].Value := 'IMPORTE';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_COM_IMP_PAG_IVA) ].Value := 'IVA';
    vlExcelApp.Cells[11 , ColumnXlS(coCOL_COM_IMP_PAG_TOT) ].Value := 'TOTAL';

    vlExcelApp.Cells[10 , ColumnXlS(coCOL_COM_IMP_PAG) ].Value := 'COMISIONES  EN M.N. COBRADAS EN EL MES';

    // Coloca Formatos de los Titulos
    ColocaBordes;

    // Copia la informacion al nuevo libro de Excel
    vgQryCartas.First;
    vlTopicNOMBRE := '';
    vlRowStart := 12;
    vlRowExcel := vlRowStart;
    vlSUM_IMP_DISMINUIDO := 0;       vlSUM_IMP_TOTAL_CCI_OLD := 0;    vlSUM_IMP_TOTAL_CCI_NEW := 0;
//    vlSUM_IMP_DISMINUIDO_MES := 0;  vlSUM_IMP_DISMINUIDO_MES := 0;
    vlDOLAR_SUM_SALDO_CCI   := 0;
    vlSUM_IMP_CCI           := 0;    vlSUM_IMP_TOT           := 0;    vlSUM_IMP_TOT_MN        := 0;
    vlSUM_IMP_PAGOS         := 0;    vlSUM_SALDO_CCI         := 0;    vlSUM_IMP_DISPONER      := 0;
    vlSUM_IMP_COMISION      := 0;    vlSUM_SALDO_DLS         := 0;    vlSUM_IMP_GTIAS         := 0;
    vlSUM_COM_IMP_PAG       := 0;    vlSUM_COM_IMP_PAG_IVA   := 0;    vlSUM_COM_IMP_PAG_TOT   := 0;

    vlPESOS_SUM_IMP_COMISION := 0;
    vlDOLAR_SUM_IMP_COMISION := 0;

    vlnConsecutivo := 0;

    While Not vgQryCartas.Eof Do
      Begin

       If (vlTopicNOMBRE = '') Then
         Begin
         vlTopicNOMBRE := vgQryCartas.FieldByName('NOMBRE').AsString;
         End
       Else If (vlTopicNOMBRE <> vgQryCartas.FieldByName('NOMBRE').AsString) Then
         Begin
         ColocaCorte;
         vlnConsecutivo := 0;
         End; // If (vlTopicNOMBRE <> vgQryCartas.FieldByName('NOMBRE').AsString) Then

       Inc(vlnConsecutivo);  
       ColocaBordes;

       // Obtiene el Tipo de Cambio
       Case vgQryCartas.FieldByName('CVE_MONEDA').AsInteger Of
         840 : vlTIPO_CAMBIO := vlTIPO_CAMBIO_DLLS;
         800 : vlTIPO_CAMBIO := vlTIPO_CAMBIO_UDIS;
         484 : vlTIPO_CAMBIO := 1;
       Else
         Begin
         GetSQLFloat('SELECT PKGCRCONSOLIDADO1.FNC_OBT_TIPO_CAMBIO_REGUL('+vgQryCartas.FieldByName('CVE_MONEDA').AsString+', ''FMAC'', '+
                     IntToStr(vlwAnio)+', '+IntToStr(vlwMes)+') AS TIPO_CAMBIO FROM DUAL',
                     Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'TIPO_CAMBIO', vlTIPO_CAMBIO, False);
         End;
       End;

       vlExcelApp.Rows[vlRowExcel].RowHeight := 42.00;
       vlExcelApp.Range[coCOL_CCI_NO+IntToStr(vlRowExcel)+':'+coCOL_COM_IMP_PAG_TOT+IntToStr(vlRowExcel)].VerticalAlignment := xlHAlignCenter;

       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_MONEDA)       ].Value := vgQryCartas.FieldByName('DESC_MONEDA').AsString;
       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_CONSEC)       ].Value := vlnConsecutivo;
       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_CCI_NO)       ].Value := vgQryCartas.FieldByName('ID_CREDITO').AsString;
       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_CLIENTE)      ].Value := vgQryCartas.FieldByName('NOMBRE').AsString;
       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_CCI)      ].Value := vgQryCartas.FieldByName('IMP_CREDITO').AsString;
       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_PCT_ADIC)     ].Value := vgQryCartas.FieldByName('PCT_ADICIONAL').AsString;
       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_TOT)      ].Value := vgQryCartas.FieldByName('IMP_TOTAL_CCI').AsString;
       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_FECHA_INI)    ].Value := Chr(39) + vgQryCartas.FieldByName('F_DISPOSICION').AsString;
       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_FECHA_VTO)    ].Value := Chr(39) + vgQryCartas.FieldByName('F_VENCIMIENTO').AsString;
       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_PLAZO)        ].Value := vgQryCartas.FieldByName('DIAS_PLAZO').AsString;
//       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_PAGOS)    ].Value := vgQryCartas.FieldByName('IMP_DISMINUIDO').AsString;
       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_PAGOS)    ].Value := vgQryCartas.FieldByName('IMP_DISMINUIDO_MES').AsString;
       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_SALDO_CCI)    ].Value := vgQryCartas.FieldByName('SALDO_CCI').AsFloat * vlTIPO_CAMBIO;
//       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_COMISION) ].Value := vgQryCartas.FieldByName('SUM_IMP_COMISION').AsString;
       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_GTIAS)    ].Value := vgQryCartas.FieldByName('IMP_GARANTIA').AsString;
       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_DESC_GTIA)    ].Value := vgQryCartas.FieldByName('DESC_GTIA_ADIC').AsString;

       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_COM_IMP_PAG)     ].Value := vgQryCartas.FieldByName('IMP_COMIS_PAG').AsString;
       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_COM_IMP_PAG_IVA) ].Value := vgQryCartas.FieldByName('IMP_IVA_PAG').AsString;
       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_COM_IMP_PAG_TOT) ].Value := vgQryCartas.FieldByName('IMP_TOT_COM_PAG').AsString;

       vlSUM_IMP_DISMINUIDO    := vlSUM_IMP_DISMINUIDO + vgQryCartas.FieldByName('IMP_DISMINUIDO').AsFloat   * vlTIPO_CAMBIO;
//       vlSUM_IMP_DISMINUIDO_MES:= vlIMP_DISMINUIDO_MES + vgQryCartas.FieldByName('IMP_DISMINUIDO_MES').AsFloat   * vlTIPO_CAMBIO;

       If (vgQryCartas.FieldByName('F_DISPOSICION').AsDateTime <= StrToDate('01/'+FormatDateTime('MM/YYYY',dtpF_CIERRE.Date))) Then
         vlSUM_IMP_TOTAL_CCI_OLD := vlSUM_IMP_TOTAL_CCI_OLD + vgQryCartas.FieldByName('IMP_TOTAL_CCI').AsFloat * vlTIPO_CAMBIO
       Else
         vlSUM_IMP_TOTAL_CCI_NEW := vlSUM_IMP_TOTAL_CCI_NEW + vgQryCartas.FieldByName('IMP_TOTAL_CCI').AsFloat * vlTIPO_CAMBIO;

       // Sumatoria para Gran Total
       vlSUM_IMP_CCI          :=  vlSUM_IMP_CCI      + (vgQryCartas.FieldByName('IMP_CREDITO').AsFloat * vlTIPO_CAMBIO);
       vlSUM_IMP_TOT          :=  vlSUM_IMP_TOT      + (vgQryCartas.FieldByName('IMP_TOTAL_CCI').AsFloat * vlTIPO_CAMBIO);
       vlSUM_IMP_TOT_MN       :=  vlSUM_IMP_TOT_MN   + (vgQryCartas.FieldByName('IMP_TOTAL_CCI').AsFloat * vlTIPO_CAMBIO);
//       vlSUM_IMP_PAGOS        :=  vlSUM_IMP_PAGOS    + (vgQryCartas.FieldByName('IMP_DISMINUIDO').AsFloat * vlTIPO_CAMBIO);
       vlSUM_IMP_PAGOS        :=  vlSUM_IMP_PAGOS    + (vgQryCartas.FieldByName('IMP_DISMINUIDO_MES').AsFloat * vlTIPO_CAMBIO);

       vlSUM_SALDO_CCI        :=  vlSUM_SALDO_CCI    + (vgQryCartas.FieldByName('SALDO_CCI').AsFloat * vlTIPO_CAMBIO);
       vlSUM_IMP_DISPONER     :=  vlSUM_IMP_DISPONER + 0;
       vlSUM_IMP_COMISION     :=  vlSUM_IMP_COMISION + (vgQryCartas.FieldByName('SUM_IMP_COMISION').AsFloat * vlTIPO_CAMBIO);
       vlSUM_SALDO_DLS        :=  vlSUM_SALDO_DLS + 0;
       vlSUM_IMP_GTIAS        :=  vlSUM_IMP_GTIAS    + (vgQryCartas.FieldByName('IMP_GARANTIA').AsFloat * vlTIPO_CAMBIO);
       vlSUM_COM_IMP_PAG      :=  vlSUM_COM_IMP_PAG  + (vgQryCartas.FieldByName('IMP_COMIS_PAG').AsFloat * vlTIPO_CAMBIO);
       vlSUM_COM_IMP_PAG_IVA  :=  vlSUM_COM_IMP_PAG_IVA + (vgQryCartas.FieldByName('IMP_IVA_PAG').AsFloat * vlTIPO_CAMBIO);
       vlSUM_COM_IMP_PAG_TOT  :=  vlSUM_COM_IMP_PAG_TOT + (vgQryCartas.FieldByName('IMP_TOT_COM_PAG').AsFloat * vlTIPO_CAMBIO);

       vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_TOT_MN) ].Value := (vgQryCartas.FieldByName('IMP_TOTAL_CCI').AsFloat * vlTIPO_CAMBIO);

       If (vgQryCartas.FieldByName('CVE_MONEDA').AsInteger = 484) Then
           Begin
           vlPESOS_SUM_IMP_CCI          :=  vlPESOS_SUM_IMP_CCI      + vgQryCartas.FieldByName('IMP_CREDITO').AsFloat ;
           vlPESOS_SUM_IMP_TOT          :=  vlPESOS_SUM_IMP_TOT      + vgQryCartas.FieldByName('IMP_TOTAL_CCI').AsFloat ;
           vlPESOS_SUM_IMP_TOT_MN       :=  vlPESOS_SUM_IMP_TOT_MN   + vgQryCartas.FieldByName('IMP_TOTAL_CCI').AsFloat ;
           // vlPESOS_SUM_IMP_PAGOS        :=  vlPESOS_SUM_IMP_PAGOS    + vgQryCartas.FieldByName('IMP_DISMINUIDO').AsFloat ;
           vlPESOS_SUM_IMP_PAGOS        :=  vlPESOS_SUM_IMP_PAGOS    + vgQryCartas.FieldByName('IMP_DISMINUIDO_MES').AsFloat ;
           vlPESOS_SUM_SALDO_CCI        :=  vlPESOS_SUM_SALDO_CCI    + vgQryCartas.FieldByName('SALDO_CCI').AsFloat ;
           vlPESOS_SUM_IMP_DISPONER     :=  vlPESOS_SUM_IMP_DISPONER +  0;
           vlPESOS_SUM_IMP_COMISION     :=  vlPESOS_SUM_IMP_COMISION + vgQryCartas.FieldByName('SUM_IMP_COMISION').AsFloat ;
           vlPESOS_SUM_SALDO_DLS        :=  vlPESOS_SUM_SALDO_DLS    +  0;
           vlPESOS_SUM_IMP_GTIAS        :=  vlPESOS_SUM_IMP_GTIAS    + vgQryCartas.FieldByName('IMP_GARANTIA').AsFloat ;
           vlPESOS_SUM_COM_IMP_PAG      :=  vlPESOS_SUM_COM_IMP_PAG  + vgQryCartas.FieldByName('IMP_COMIS_PAG').AsFloat ;
           vlPESOS_SUM_COM_IMP_PAG_IVA  :=  vlPESOS_SUM_COM_IMP_PAG_IVA + vgQryCartas.FieldByName('IMP_IVA_PAG').AsFloat ;
           vlPESOS_SUM_COM_IMP_PAG_TOT  :=  vlPESOS_SUM_COM_IMP_PAG_TOT + vgQryCartas.FieldByName('IMP_TOT_COM_PAG').AsFloat ;
           End
        Else If (vgQryCartas.FieldByName('CVE_MONEDA').AsInteger = 840) Then
           Begin
           vlDOLAR_SUM_IMP_CCI          :=  vlDOLAR_SUM_IMP_CCI      + (vgQryCartas.FieldByName('IMP_CREDITO').AsFloat);
           vlDOLAR_SUM_IMP_TOT          :=  vlDOLAR_SUM_IMP_TOT      + (vgQryCartas.FieldByName('IMP_TOTAL_CCI').AsFloat);
           vlDOLAR_SUM_IMP_TOT_MN       :=  vlDOLAR_SUM_IMP_TOT_MN   + (vgQryCartas.FieldByName('IMP_TOTAL_CCI').AsFloat) * vlTIPO_CAMBIO;
//           vlDOLAR_SUM_IMP_PAGOS        :=  vlDOLAR_SUM_IMP_PAGOS    + (vgQryCartas.FieldByName('IMP_DISMINUIDO').AsFloat);
           vlDOLAR_SUM_IMP_PAGOS        :=  vlDOLAR_SUM_IMP_PAGOS    + (vgQryCartas.FieldByName('IMP_DISMINUIDO_MES').AsFloat);
           vlDOLAR_SUM_SALDO_CCI        :=  vlDOLAR_SUM_SALDO_CCI    + (vgQryCartas.FieldByName('SALDO_CCI').AsFloat);
           vlDOLAR_SUM_IMP_DISPONER     :=  vlDOLAR_SUM_IMP_DISPONER + 0;
           vlDOLAR_SUM_IMP_COMISION     :=  vlDOLAR_SUM_IMP_COMISION + (vgQryCartas.FieldByName('SUM_IMP_COMISION').AsFloat);
           vlDOLAR_SUM_IMP_GTIAS        :=  vlDOLAR_SUM_IMP_GTIAS    + (vgQryCartas.FieldByName('IMP_GARANTIA').AsFloat);
           vlDOLAR_SUM_COM_IMP_PAG      :=  vlDOLAR_SUM_COM_IMP_PAG  + (vgQryCartas.FieldByName('IMP_COMIS_PAG').AsFloat);
           vlDOLAR_SUM_COM_IMP_PAG_IVA  :=  vlDOLAR_SUM_COM_IMP_PAG_IVA + (vgQryCartas.FieldByName('IMP_IVA_PAG').AsFloat);
           vlDOLAR_SUM_COM_IMP_PAG_TOT  :=  vlDOLAR_SUM_COM_IMP_PAG_TOT + (vgQryCartas.FieldByName('IMP_TOT_COM_PAG').AsFloat);
           End;

      vgQryCartas.Next;
      Inc(vlRowExcel);
      End;

    ColocaCorte;

    //------------------------
    // Coloca Totales
    //------------------------
    vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_CCI_NO) ].Value := 'Totales';
    vlQryMoneda := GetSQLQuery('   SELECT M.CVE_MONEDA, M.DESC_MONEDA'+coCRLF+
                               '   FROM  ('+coCRLF+
                               '          SELECT CCC.ID_CONTRATO'+coCRLF+
                               '          FROM CR_CON_REG_CCI CCC'+coCRLF+
                               '          WHERE  CCC.ID_REG_VIGENTE = 1'+coCRLF+
                               '            AND (   ( CCC.F_DISPOSICION <= '+SQLFecha(dtpF_CIERRE.Date)+' AND CCC.SIT_CON_REG_CCI = ''AC'')'+coCRLF+
                               '                 OR ( CCC.F_LIQUIDACION > '+SQLFecha(dtpF_CIERRE.Date)+')'+coCRLF+
                               '                 OR ( CCC.F_LIQUIDACION BETWEEN TO_DATE(''01/''||TO_CHAR('+SQLFecha(dtpF_CIERRE.Date)+',''MM/YYYY''),''DD/MM/YYYY'') AND '+SQLFecha(dtpF_CIERRE.Date)+')'+coCRLF+
                               '                ) '+coCRLF+
                               '          ) CCC,'+coCRLF+
                               '          CONTRATO CTO,'+coCRLF+
                               '          MONEDA M'+coCRLF+
                               '    WHERE CTO.ID_CONTRATO = CCC.ID_CONTRATO'+coCRLF+
                               '      AND M.CVE_MONEDA = CTO.CVE_MONEDA'+coCRLF+
                               '    GROUP BY M.CVE_MONEDA, M.DESC_MONEDA'+coCRLF+
                               '    ORDER BY M.CVE_MONEDA, M.DESC_MONEDA DESC'+coCRLF,
                               Objeto.Apli.DataBaseName,
                               Objeto.Apli.SessionName,
                               True
                               );

    Inc(vlRowExcel, 2);
    If Assigned(vlQryMoneda) Then
       Begin
       vlQryMoneda.First;
       While Not vlQryMoneda.Eof Do
         Begin
         vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_CLIENTE)          ].Value := vlQryMoneda.FieldByName('DESC_MONEDA').AsString;
         If (vlQryMoneda.FieldByName('CVE_MONEDA').AsInteger = 484) Then
             Begin
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_CCI)          ].Value := vlPESOS_SUM_IMP_CCI;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_TOT)          ].Value := vlPESOS_SUM_IMP_TOT;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_TOT_MN)       ].Value := vlPESOS_SUM_IMP_TOT_MN;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_PAGOS)        ].Value := vlPESOS_SUM_IMP_PAGOS;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_SALDO_CCI)        ].Value := vlPESOS_SUM_SALDO_CCI;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_DISPONER)     ].Value := vlPESOS_SUM_IMP_DISPONER;
//             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_COMISION)     ].Value := vlPESOS_SUM_IMP_COMISION;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_SALDO_DLS)        ].Value := vlPESOS_SUM_SALDO_DLS;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_GTIAS)        ].Value := vlPESOS_SUM_IMP_GTIAS;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_COM_IMP_PAG)      ].Value := vlPESOS_SUM_COM_IMP_PAG;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_COM_IMP_PAG_IVA)  ].Value := vlPESOS_SUM_COM_IMP_PAG_IVA;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_COM_IMP_PAG_TOT)  ].Value := vlPESOS_SUM_COM_IMP_PAG_TOT;
             End
         Else If (vlQryMoneda.FieldByName('CVE_MONEDA').AsInteger = 840) Then
            Begin
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_CCI)          ].Value := vlDOLAR_SUM_IMP_CCI;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_TOT)          ].Value := vlDOLAR_SUM_IMP_TOT;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_TOT_MN)       ].Value := vlDOLAR_SUM_IMP_TOT_MN;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_PAGOS)        ].Value := vlDOLAR_SUM_IMP_PAGOS;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_SALDO_CCI)        ].Value := vlDOLAR_SUM_SALDO_CCI * vlTIPO_CAMBIO_DLLS;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_DISPONER)     ].Value := vlDOLAR_SUM_IMP_DISPONER;
//             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_COMISION)     ].Value := vlDOLAR_SUM_IMP_COMISION;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_SALDO_DLS)        ].Value := vlDOLAR_SUM_SALDO_DLS;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_IMP_GTIAS)        ].Value := vlDOLAR_SUM_IMP_GTIAS;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_COM_IMP_PAG)      ].Value := vlDOLAR_SUM_COM_IMP_PAG;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_COM_IMP_PAG_IVA)  ].Value := vlDOLAR_SUM_COM_IMP_PAG_IVA;
             vlExcelApp.Cells[vlRowExcel , ColumnXlS(coCOL_COM_IMP_PAG_TOT)  ].Value := vlDOLAR_SUM_COM_IMP_PAG_TOT;
            End;
         Inc(vlRowExcel);
         vlQryMoneda.Next;
         End;
       End;
                                                                    
    vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range[coCOL_CCI_NO+IntToStr(vlRowExcel-2)+':'+coCOL_COM_IMP_PAG_TOT+IntToStr(vlRowExcel)];
    vlColumnRange.Font.Bold := True;

    Inc(vlRowExcel,2);
    vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range[coCOL_CCI_NO+IntToStr(vlRowExcel)+':'+coCOL_COM_IMP_PAG_TOT+IntToStr(vlRowExcel)];
    vlColumnRange.Columns.Interior.ColorIndex := 1; // Negro

    Inc(vlRowExcel);
    vlExcelApp.Cells[vlRowExcel + 1,  ColumnXlS(coCOL_CLIENTE) ].Value := 'POSICION DE C.C.I. EN M.N.';

    vlExcelApp.Cells[vlRowExcel + 3,  ColumnXlS(coCOL_CLIENTE) ].Value := 'POSICIÓN REAL AL '+FormatDateTime('dd " de " mmmm  " de " yyyy',UltimoDia(IncMonth(dtpF_CIERRE.Date,-1)))+'.';
    vlExcelApp.Cells[vlRowExcel + 4,  ColumnXlS(coCOL_CLIENTE) ].Value := 'MÁS EXCESOS:';
    vlExcelApp.Cells[vlRowExcel + 5,  ColumnXlS(coCOL_CLIENTE) ].Value := 'MÁS NUEVAS C.C.I.';
    vlExcelApp.Cells[vlRowExcel + 6,  ColumnXlS(coCOL_CLIENTE) ].Value := 'MENOS PAGOS O VENCIMIENTOS:';
    vlExcelApp.Cells[vlRowExcel + 7,  ColumnXlS(coCOL_CLIENTE) ].Value  := 'POSICIÓN REAL AL '+FormatDateTime('dd " de " mmmm  " de " yyyy',dtpF_CIERRE.Date)+'.';

    vlExcelApp.Cells[vlRowExcel + 3,  ColumnXlS(coCOL_IMP_TOT_MN) ].Value := DevuelveTotalMesAnterior;
    vlExcelApp.Cells[vlRowExcel + 4,  ColumnXlS(coCOL_IMP_TOT_MN) ].Value := DevuelveAfectacionesMes('I'); // Incrementos
    vlExcelApp.Cells[vlRowExcel + 5,  ColumnXlS(coCOL_IMP_TOT_MN) ].Value := vlSUM_IMP_TOTAL_CCI_NEW;
    vlExcelApp.Cells[vlRowExcel + 6,  ColumnXlS(coCOL_IMP_TOT_MN) ].Value := DevuelveAfectacionesMes('D'); // Decrementos en el mes
    vlExcelApp.Cells[vlRowExcel + 7, ColumnXlS(coCOL_IMP_TOT_MN) ].Value  := vlSUM_SALDO_CCI;

    vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range[coCOL_CLIENTE+IntToStr(vlRowExcel + 1)+':G'+IntToStr(vlRowExcel + 1)];
    vlColumnRange.Columns.Interior.ColorIndex := 1; // Negro
    vlColumnRange.Font.Bold := True;
    vlColumnRange.Font.Color := clWhite; // Blanco

    SGDatos.Cursor := crDefault;
    btnGenArchivoXLS.Enabled := True;
    btnGenArchivoXLS.Enabled := True;
    btBUSCA.Enabled := True;
    vlExcelApp.ActiveWorkBook.SaveAs(peStrFileName);
    CloseExcelFile(vlExcelApp);
    Application.ProcessMessages;

    If (MessageDlg('Se generó el archivo '+peStrFileName+'.'+coCRLF+
                    '¿Desea abrirlo?', mtInformation, [mbYes, mbNo], 0) = mrYes) Then
       ShellExecute(Handle, 'open', 'excel', Pchar('"'+peStrFileName+'"'), Nil, SW_SHOW);
end;

procedure TWCrCciReporte.btnFileNameXLSClick(Sender: TObject);
begin
  SaveDialog1.DefaultExt := '';
  SaveDialog1.Filter     := 'Archivo Excel (*.xls)|*.xls';
  SaveDialog1.FileName:= edFileNameExcel.Text;
  If SaveDialog1.Execute Then
   edFileNameExcel.Text:=SaveDialog1.FileName;
end;

procedure TWCrCciReporte.dtpF_CIERREChange(Sender: TObject);
begin
  If (SGDatos.SG.RowCount > 0) Then
    Begin
    ClearGrid(SGDatos.SG, 0);
    SGDatos.SG.RowCount := 0;
    End;
end;

end.

