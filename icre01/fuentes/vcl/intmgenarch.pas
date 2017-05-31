// Sistema         : CREDIBINTER
// Fecha de Inicio : 18/Oct/2005
// Función forma   : TMGenArch  Creación y Envio de archivos
// Desarrollo por  :
// Diseñado por    :
// Comentarios     : 26 ABR 2006. SE ACTIVA NUEVAMENTE SALIDA A EXCEL ANEXO3
//                   10 MAY 2006. ADECUACIONES ANEXO3
//                   25 MAY 2006. ADECUACIONES PREPAGOS
// 
Unit IntMGenArch;
                                                                                           
Interface

Uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, DBGrids, Psock,
NMsmtp, fileCtrl, IntGenCre, IntParamCre, IntCrCbArchi, OleServer,
Outlook8, ComObj, IntCgXLd, InterApl, IntCrCredito, IntLinkit, IntCrAcredit,
//
IntCrGruCla,
InterEdit, IntSGCtrl;

const
   coCRLF      = #13#10;
   coArroba    = #64;
   coFOLIOARCH = 'ARCHNAF';
   coBCarga    = 'SELECT DECODE( COUNT(*), 0, ''F'', ''V'' ) B_CARGA ' +
                 'FROM CR_CB_SDO_CARTRA WHERE F_CORTE = %s AND SIT_SDO_CARTRA = ''AC'' ';
   coBCrCarga  = 'SELECT DECODE( COUNT(*), 0, ''F'', ''V'' ) B_CARGA ' +
                 'FROM CR_CB_SDO_CARTRA WHERE F_CORTE = %s AND SIT_SDO_CARTRA = ''AC'' AND ID_CREDITO = %d';
   coFCalif    = 'SELECT LAST_DAY( TO_DATE( ''%s%s'', ''YYYYMM'') )F_ANIO_MES FROM DUAL';
   coANEXO1    = 'ANEXO1';
   coANEXO2    = 'ANEXO2';
   coANEXO3    = 'ANEXO3';
   coRPAGAN    = 'RPAGAN';
   coPAGANT    = 'PAGANT';


   coEMAIL     = 'EMAIL';
   coPORTAL    = 'PORTAL';

   coPARCIAL   = 'LIQPAR';
   coTOTAL     = 'LIQTOT';

   coGAFNAR    = 'GAFNAR';
   coCOPYFP    = 'COPYFP';
   coSQLVALOR  = 'SELECT VALOR FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE = %s AND CVE_REFERENCIA = %s';
   //<LOLS 25 MAY 2006. PREPAGOS>
   coSQLPagAnt = 'SELECT DECODE(FD000, F_CORTE, ''V'', '                                         + coCRLF +
                 '                     DECODE( GREATEST(FD000, F_CORTE), FD000, ''F'', ''V'' ) ' + coCRLF +
                 '             )B_FCORTE, '                                                      + coCRLF +
                 '       DECODE( F_CORTE, F_VENCIMIENTO, ''F'', '                                + coCRLF +
                 '               DECODE( GREATEST(F_CORTE, F_VENCIMIENTO), F_VENCIMIENTO, ''V'', ''F'' ) ' + coCRLF +
                 '             )B_FVENTTO '                                                      + coCRLF +
                 'FROM   ( '                                                                     + coCRLF +
                 '        SELECT %s FD000, '                                                     + coCRLF +
                 '               %s F_CORTE, '                                                   + coCRLF +
                 '               MIN(F_VENCIMIENTO) F_VENCIMIENTO '                              + coCRLF +
                 '        FROM   ( '                                                             + coCRLF +
                 '                SELECT F_VENCIMIENTO '                                         + coCRLF +
                 '                FROM   CR_FND_INTERES '                                        + coCRLF +
                 '                WHERE  ID_CREDITO   = %d '                                     + coCRLF +
                 '                  AND  F_VENCIMIENTO >= %s '                                   + coCRLF +
                 '                  AND  SIT_INTERES <> ''CA'' '                                 + coCRLF +
                 '                UNION '                                                        + coCRLF +
                 '                SELECT F_VENCIMIENTO '                                         + coCRLF +
                 '                FROM   CR_FND_CAPITAL '                                        + coCRLF +
                 '                WHERE  ID_CREDITO =  %d '                                      + coCRLF +
                 '                  AND  F_VENCIMIENTO >= %s '                                   + coCRLF +
                 '                  AND  SIT_CAPITAL <> ''CA'' '                                 + coCRLF +
                 '               ) '                                                             + coCRLF +
                 '       ) ';
   //</LOLS>                 
type
  TMGenArch  = class;

  TwMGenArch = Class(TForm)
    InterForma1             : TInterForma;
    pcPrincipal: TPageControl;
    tsArchivo: TTabSheet;
    tsCorreo: TTabSheet;
    btnSigArchivo: TButton;
    btnAntCorreo: TButton;
    Panel1: TPanel;
    Label4: TLabel;
    lbIMP_TOTAL_ARC: TLabel;
    lbNUM_REGISTRO: TLabel;
    lbF_ARCHIVO: TLabel;
    edTX_NOM_ARCHIVO: TEdit;
    edF_ARCHIVO: TEdit;
    edID_ARCHIVO: TEdit;
    GroupBox1: TGroupBox;
    BitCorreo: TBitBtn;
    BitNvoCorreo: TBitBtn;
    Label9: TLabel;
    edPara: TEdit;
    Label10: TLabel;
    edConCopia: TEdit;
    Label11: TLabel;
    edAsunto: TEdit;
    Label12: TLabel;
    mMensaje: TMemo;
    edIdCorreo: TEdit;
    NMSMTP1: TNMSMTP;
    lbStatCargaArch: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    trCrearArchivo: TTabSheet;
    rgCVE_TIPO_REPORTE: TRadioGroup;
    btnPestTresAnt: TButton;
    btnCreaArchivo: TButton;
    edIdEmpresa: TEdit;
    btnEnviar: TBitBtn;
    OutlookApplication1: TOutlookApplication;
    qyQueryPA: TQuery;
    ilID_CREDITO: TInterLinkit;
    qyQueryAnexo3: TQuery;
    ilID_ACREDITADO: TInterLinkit;
    TabSheet1: TTabSheet;
    btnPestDosSig: TButton;
    btnPestDosAnt: TButton;
    Panel2: TPanel;
    dtpF_CORTE: TInterDateTimePicker;
    edF_CORTE: TEdit;
    Label21: TLabel;
    lbID_CREDITO: TLabel;
    edID_CREDITO: TEdit;
    btID_CREDITO: TBitBtn;
    edDESC_CREDITO: TEdit;
    cbID_CREDITO: TCheckBox;
    Label3: TLabel;
    edID_ACREDITADO: TEdit;
    btnID_ACREDITADO: TBitBtn;
    edDESC_ACREDITADO: TEdit;
    cbxID_ACREDITADO: TCheckBox;
    Label1: TLabel;
    cbxAnio: TComboBox;
    Label2: TLabel;
    cbxMes: TComboBox;
    rgTipoArch: TRadioGroup;
    btnGenerar: TBitBtn;
    sdGenArch: TSaveDialog;
    rgTipoEnvio: TRadioGroup;
    Label6: TLabel;
    sbPathFileName: TSpeedButton;
    edNbrArch: TEdit;
    rbGenArch: TRadioButton;
    rbSelectArch: TRadioButton;
    edBuscaArch: TEdit;
    btnBuscaArch: TBitBtn;
    edNOMBRE_ARCHIVO: TEdit;
    lbFolioArchivo: TLabel;
    lbWarningArchivo: TLabel;
    lbIMP_TOTAL_IVA: TLabel;
    edIMP_TOTAL_ARC: TInterEdit;
    edIMP_TOTAL_IVA: TInterEdit;
    edNUM_REGISTRO: TInterEdit;
    ieIMP_PREPAGO: TInterEdit;
    lbPagoAnt: TLabel;
    cbxCVE_MOTIVO_LIQ: TCheckBox;
    edDESC_MOTIVO_LIQ: TEdit;
    btCVE_MOTIVO_LIQ: TBitBtn;
    edCVE_MOTIVO_LIQ: TEdit;
    lbMotivoLiq: TLabel;
    ikCVE_MOTIVO_LIQ: TInterLinkit;
    rgLiquidacion: TRadioGroup;
    cbComAnual: TCheckBox;
    memInfo: TMemo;
    Label5: TLabel;
    btnBitacoraAnexo2: TButton;
    tsBitacoraAnexo2: TTabSheet;
    btnPestCincoAnt: TButton;
    SGCBitacoraAnexo2: TSGCtrl;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSigArchivoClick(Sender: TObject);
    procedure btnSigCreaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAntCorreoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pcPrincipalChanging(Sender: TObject; var AllowChange: Boolean);
    procedure edID_ARCHIVOChange(Sender: TObject);
    procedure BitCorreoClick(Sender: TObject);
    procedure BitNvoCorreoClick(Sender: TObject);
    procedure btnCreaArchivoClick(Sender: TObject);
    procedure btnGenerarClick(Sender: TObject);
    procedure rgCVE_TIPO_REPORTEClick(Sender: TObject);
    procedure btnPestTresAntClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure edF_CORTEChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure cbID_CREDITOClick(Sender: TObject);
    procedure edID_CREDITOChange(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_ACREDITADOEjecuta(Sender: TObject);
    procedure btnID_ACREDITADOClick(Sender: TObject);
    procedure ilID_ACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure edID_ACREDITADOExit(Sender: TObject);
    procedure edID_ACREDITADOChange(Sender: TObject);
    procedure btnPestDosSigClick(Sender: TObject);
    procedure btnPestDosAntClick(Sender: TObject);
    procedure cbxID_ACREDITADOClick(Sender: TObject);
    procedure sbPathFileNameClick(Sender: TObject);
    procedure rgTipoEnvioClick(Sender: TObject);
    procedure radiobuttonarchivo(Sender: TObject);
    procedure btnBuscaArchClick(Sender: TObject);
    procedure tsArchivoShow(Sender: TObject);
    procedure btCVE_MOTIVO_LIQClick(Sender: TObject);
    procedure ikCVE_MOTIVO_LIQCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_MOTIVO_LIQChange(Sender: TObject);
    procedure edCVE_MOTIVO_LIQExit(Sender: TObject);
    procedure btCVE_MOTIVO_LIQExit(Sender: TObject);
    procedure ikCVE_MOTIVO_LIQEjecuta(Sender: TObject);
    procedure rgLiquidacionClick(Sender: TObject);
    procedure cbxCVE_MOTIVO_LIQClick(Sender: TObject);
    procedure cbComAnualClick(Sender: TObject);
    procedure btnPestCincoAntClick(Sender: TObject);
    procedure btnBitacoraAnexo2Click(Sender: TObject);
    
    private
      sNombreArchivo : String;
      iFolio  :Integer;
      slLista : TStringList;
      //
      Procedure LimpiaDatos;
      Procedure ObtenDatosCorreo( var sHost : String; var iPort : integer; var sFrom : String );
      Function  recArchivo(): String;
      Function  enviaCorreo(): Boolean;
      Function  SeparaDatos(sDato: String): TStringList;
      Function  FormaQuery(TipoArchivo:String):String;
      Function  PosicionClave(sDato:String; Tamanio: Integer):String;
      Function  CambiaAnx2Sit(IdMetodo  : Integer; iIdCredito  : Integer;
                              FolioCorte: Integer; ImpBruCtl   : Double;
                              ImpIVACtl : Double): Boolean;
      Function  EscribirACampo(sTableName:String; sCveKey:String; sCampoBlob:String): Boolean;
      Procedure LeerCampo(sTableName:String; sCveEnc:String; sCampoBlob:String);
      Function  ValidaDatosAnexo1: Boolean;
      Procedure GeneraAnexo1;
      Procedure GeneraAnexo2;
      Procedure GeneraAnexo2_A;
      Procedure GeneraAnexo3;
      Function  GeneraPagosAnt : boolean;
      Procedure ObtNombreArch;
      Procedure CreaArchivo;
      Function  GuardaArch:Boolean;
      Procedure EnableCheckBox(var CheckBox : TCheckBox);
      Function DameFechaAnexo2(dFecha:TDateTime): String;
      Function CopyFilePYME( Origen, Destino : String ): Boolean;
      function CompruebaDatos(iIdCredito, iIdSolicitud: Integer): Boolean;
      // <FJR 03/02/2012>
      Function CadenaRepresentante (IdCredito: integer): String ;
      Function CadenaTelefonos (IdCredito: integer): String ;
      Function CadenaEMail (IdCredito: integer) : String ;
      // <FJR 03/02/2012>
    { Private declarations }
    public
    { Public declarations }
    Objeto : TMGenArch;
end;

  TCrExcelXLSLoader = class(TCgBaseXLSLoader)
  private
  public
    vlNbrArch : String;
    vlFecha   : TDateTime;
    function  ObtenReservas(Apli :TInterApli; peID_CREDITO : Integer; var psPctCubierto, psImpCubierto : Double) : Boolean;
    procedure CargaArchPA(qD : TQuery; Apli :TInterApli);
    // <SATV4766 28Oct2008>
    function  CargaArchCalif(Memo : TMemo; qD : TQuery; Apli :TInterApli; FCalif : String;
                             var penTotalReg, penTotalRegErr : Integer ): Boolean;
    // </SATV4766 28Oct2008>
    Procedure CambiaSitXLS( iFolio :Integer; Apli :TInterApli);
    destructor Destroy; override;
  end;

 TMGenArch= class(TInterFrame)
    private
      msBufEnt : TMemoryStream;
      msBufSal : TMemoryStream;
    protected
    public
      { Public declarations }
      CVE_TIPO_REPORTE         : TInterCampo;
      NOMBRE_ARCHIVO           : TInterCampo;
      PATH_ARCHIVO             : TInterCampo;
      VALOR                    : TInterCampo;
      F_CORTE                  : TInterCampo;
      ID_CREDITO               : TInterCampo;
      DESC_CREDITO             : TInterCampo;
      ANIO                     : TInterCampo;
      MES                      : TInterCampo;
      B_PAGO_COM_ANUAL         : TInterCampo;
      ID_ACREDITADO            : TInterCampo;
      DESC_ACREDITADO          : TInterCampo;
      CVE_TIPO_ENVIO           : TInterCampo;
      IMP_TOTAL_ARC            : TInterCampo;
      IMP_TOTAL_IVA            : TInterCampo;
      NUM_REGISTRO             : TInterCampo;
      NUM_ENVIO                : TInterCampo;
      CVE_MOTIVO_LIQ           : TInterCampo;
      TIPO_LIQUIDACION         : TInterCampo;
      IMP_PREPAGO              : TInterCampo;


      CrCbArchi                : TCrCbArchi;
      CrCbFindArch             : TCrCbArchi;
      ParamCre                 : TParamCre;
      ExcelLoader              : TCrExcelXLSLoader;
      CrCredito                : TCrCredito;
      Acreditado               : TCrAcredit;

      MotivoLiq                : TCrGruCla;

      function    InternalBusca : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      function    Reporte:Boolean; override;
      function    stpCargaComPYME : Boolean;
      Function    GeneraComAnual : boolean;
      function    stpActSolGtia( IdCredito   : Integer;
                                 IdSolicitud : Integer ) : Boolean;
      function    stpValComCred(FCorte    : TDate ): Boolean;
      function    stpActComCred(IdMetodo  : Integer; IdCredito: Integer;
                                FCorte    : TDate;   FolioCorte: Integer;
                                ImpBruCtl : Double;  ImpIVACtl : Double
                               ): Boolean;
      function    stpGrabaArchivo( CveAnexo     : String;   FArchivo    : TDate;
                                   TxNomArchivo : String;   TxArcContenido : String;
                                   SitArchivo   : String;   ImpTotalArc : Double;
                                   ImpTotalIVA  : Double;   NumRegistro : Integer;
                                   NumEnvio     : Integer;  var psFolio : Integer ) : Boolean;
      function    stpActSitArchivo( Folio : Integer ) : Boolean;
      function    getValorCve( CveGpo, CveRef : String ) : String;
      Function    LlamaDetalle: Boolean;
      //< / RABA >
      // RABA SEP 2011 SE AGREGA PAQUETE PARA GENERAR LAS TRANSACCIONES DE PAGO ANTES DE GENERAR ANEXO2
      function    stpTransacPagoComPYME : Boolean;
      // RABA SEP 2011 SE AGREGA PAQUETA PARA QUE AL TERMINAR DE GENERAR EL ARCHVO SE ACTUALICE LA SITUACIÓN DE LA TABLA DE SALDOS
      function    stpAfectaSitSdo : Boolean;
      // < RABA />
    published
    end;


Var  FormaParam : TwMGenArch;
implementation
{$R *.DFM}

{CLASE TCrExcelXLSLoader}
destructor TCrExcelXLSLoader.Destroy;
begin
  inherited;
end;
//

function TCrExcelXLSLoader.ObtenReservas(Apli :TInterApli; peID_CREDITO : Integer; var psPctCubierto, psImpCubierto : Double) : Boolean;
var vlSQL : String;
    vlQry : TQuery;
    vlbEncontroRegistro : Boolean;
    vlstrID_CREDITO, vlstrF_CORTE : String;
begin
   vlstrID_CREDITO := IntToStr(peID_CREDITO);
   vlstrF_CORTE := FormatDateTime('DD/MM/YYYY', Apli.DameFechaEmpresa);

   Result := False;
   vlSQL :=
       ' SELECT CSR.ID_CREDITO,'+coCRLF+
       '        CSR.CVE_CALIF_CUB,'+coCRLF+
       '        AVG(CSR.PCT_CUBIERTO) AS AVG_PCT_CUBIERTO,'+coCRLF+
       '        SUM(CSR.IMP_RES_CUBIERTO) AS SUM_IMP_RES_CUBIERTO'+coCRLF+
       ' FROM (  -- Este query obtiene de cada crédito el mayor nivel'+coCRLF+
       '         -- de riesgo que le corresponde a la calificación asignada'+coCRLF+
       '         SELECT CSR.ID_CREDITO, MAX(NUM_NIVEL) AS MAX_NUM_NIVEL'+coCRLF+
       '         FROM ADMIPROD.CR_SICC_RESERVA CSR,'+coCRLF+
       '              ( SELECT CVE_CALIFICACION, NUM_NIVEL'+coCRLF+
       '                FROM CR_CAL_CALIFICA'+coCRLF+
       '                WHERE CVE_TIPO_RIESGO = ''SICC'''+coCRLF+
       '                  AND SIT_CAL_CALIFICA = ''AC'''+coCRLF+
       '              ) CCL'+coCRLF+
       '         WHERE CSR.ANIO_MES BETWEEN TO_NUMBER(TO_CHAR(ADD_MONTHS(TO_DATE('''+vlstrF_CORTE+''',''DD/MM/YYYY''),-2),''YYYYMM''))'+coCRLF+
       '                                AND TO_NUMBER(TO_CHAR(TO_DATE('''+vlstrF_CORTE+''',''DD/MM/YYYY''),''YYYYMM''))'+coCRLF+
       '           AND CSR.ID_CREDITO = '+vlstrID_CREDITO+coCRLF+
       '           AND CSR.SIT_SICC_RESERVA = ''AC'''+coCRLF+
       '           AND CSR.CVE_CALIF_CUB = CCL.CVE_CALIFICACION'+coCRLF+
       '         GROUP BY CSR.ID_CREDITO'+coCRLF+
       '     ) RIESGO,'+coCRLF+
       '     ('+coCRLF+
       '       -- Este query obtiene los datos de reserva junto con su nivel de reisgo'+coCRLF+
       '       SELECT CSR.ID_CREDITO,'+coCRLF+
       '              CSR.CVE_CALIF_CUB,'+coCRLF+
       '              CSR.IMP_CUBIERTO,'+coCRLF+
       '              CSR.PCT_CUBIERTO,'+coCRLF+
       '              CSR.IMP_RES_CUBIERTO,'+coCRLF+
       '              CCL.NUM_NIVEL'+coCRLF+
       '       FROM ( SELECT * FROM ADMIPROD.CR_SICC_RESERVA'+coCRLF+
       '              WHERE ANIO_MES BETWEEN TO_NUMBER(TO_CHAR(ADD_MONTHS(TO_DATE('''+vlstrF_CORTE+''',''DD/MM/YYYY''),-2),''YYYYMM''))'+coCRLF+
       '                AND TO_NUMBER(TO_CHAR(TO_DATE('''+vlstrF_CORTE+''',''DD/MM/YYYY''),''YYYYMM''))'+coCRLF+
       '                AND ID_CREDITO = '+vlstrID_CREDITO+coCRLF+
       '                AND SIT_SICC_RESERVA = ''AC'''+coCRLF+
       '            ) CSR,'+coCRLF+
       '            ( SELECT CVE_CALIFICACION, NUM_NIVEL'+coCRLF+
       '              FROM CR_CAL_CALIFICA'+coCRLF+
       '              WHERE CVE_TIPO_RIESGO = ''SICC'''+coCRLF+
       '                AND SIT_CAL_CALIFICA = ''AC'''+coCRLF+
       '              GROUP BY CVE_CALIFICACION, NUM_NIVEL'+coCRLF+
       '             ) CCL'+coCRLF+
       '       WHERE CCL.CVE_CALIFICACION (+)= CSR.CVE_CALIF_CUB'+coCRLF+
       '     ) CSR'+coCRLF+
       ' WHERE RIESGO.ID_CREDITO = CSR.ID_CREDITO'+coCRLF+
       '   AND RIESGO.MAX_NUM_NIVEL = CSR.NUM_NIVEL'+coCRLF+
       'GROUP BY CSR.ID_CREDITO, CSR.CVE_CALIF_CUB'+coCRLF+
       'ORDER BY ID_CREDITO'+coCRLF;
   vlQry := TQuery.Create(Nil);
   If Assigned(vlQry) Then
      With (vlQry) Do
         Try
           vlbEncontroRegistro := False;
           DatabaseName := Apli.DatabaseName;
           SessionName := Apli.SessionName;
           SQL.Clear;
           SQL.Add(vlSQL);
           Open;
           If (Active) Then
             While Not Eof Do
                 Begin
                 psPctCubierto := FieldByName('AVG_PCT_CUBIERTO').AsFloat;
                 psImpCubierto := FieldByName('SUM_IMP_RES_CUBIERTO').AsFloat;
                 vlbEncontroRegistro := True;
                 Next;
                 End;
           Result := vlbEncontroRegistro;       
         Finally
           Close;
           vlQry.Free;
         End;
end;

Procedure TCrExcelXLSLoader.CambiaSitXLS( iFolio :Integer; Apli :TInterApli);
var stpActPagAnt : TStoredProc;
begin
  stpActPagAnt := TStoredProc.Create(nil);
  try
    with stpActPagAnt do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:='PKGCRCREDITOO1.STPACTSITPAGOANT';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam( ftFloat,   'PEID_SOLICITUD',      ptInput   );
      Params.CreateParam( ftString,  'PEBCOMMIT',           ptInput   );
      Params.CreateParam( ftFloat,   'PSRESULTADO',         ptOutput  );
      Params.CreateParam( ftString,  'PSTXRESULTADO',       ptOutput  );
      //
      ParamByName( 'PEID_SOLICITUD' ).AsInteger := iFolio;
      ParamByName( 'PEBCOMMIT'      ).AsString  := 'V';
      //
      ExecProc;
      if ParamByName('PSRESULTADO' ).asInteger = 0 then
      Begin
        {Do nothing}  //Result  := True;
      End else begin
        ShowMessage( 'Error al actualizar la situación del pago anticipado en la Base de Datos : ' + coCRLF +
                     'Código : ' + ParamByName('PSRESULTADO').AsString    + coCRLF +
                     'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString
                   );
      end;
      //
    end;
  finally
    stpActPagAnt.Free;
  end;
End;


procedure TCrExcelXLSLoader.CargaArchPA(qD : TQuery; Apli :TInterApli);
var
   vlV, vlVValoresdeRango : variant;
   i,   iFolControl       : Integer;
   bNuevoCredito          : Boolean;
   dSaldo,    dCapital, dInteres, dComision,
   dIvaComis, dTotal,   dCapDet,  dTotDet,   dTotInt : Double;
   sMotLiq : String;
begin
   i := 16;
   iFolControl := 0;
   //
   dTotal   := 0;    dCapDet  := 0;    dTotDet  := 0;    dSaldo   := 0;
   dCapital := 0;    dInteres := 0;    dComision:= 0;    dIvaComis:= 0;
   sMotLiq  := '';
   //
   vlV := ExcelVariant;
   //vlV.Workbooks.Open(vlNbrArch);
   vlV.Sheets['Pagos Anticipados'].Select;
   vlV.Cells.Select;

   vlV.Range['B7:EZ1'].Select;
   vlVValoresdeRango := vlV.Selection.Value;
   VarArrayLock(vlVValoresdeRango);
   vlVValoresdeRango[7,16] := FormatDateTime('dd/mm/yyyy',Self.vlFecha);
   VarArrayUnlock(vlVValoresdeRango);
   vlV.Selection.Value:= vlVValoresdeRango;
   vlV.ActiveWorkbook.Save;

   dTotInt       := 0;
   bNuevoCredito := True;
   if qD.IsEmpty = False then
   begin
       qD.First;
       While not qD.EOF Do Begin
          iFolControl := qD.FieldByName('ID_SOLICITUD').AsInteger;
          If bNuevoCredito Then Begin
             bNuevoCredito := False;
             vlV.Cells[i,2]  := qD.FieldByName('CVE_BASE_OP').AsString;
             vlV.Cells[i,3]  := qD.FieldByName('CVE_SUCURSAL').AsString;
             vlV.Cells[i,4]  := qD.FieldByName('CVE_SUB_APLIC').AsString;
             vlV.Cells[i,5]  := qD.FieldByName('PRESTAMO').AsString;
             vlV.Cells[i,6]  := qD.FieldByName('ACREDITADO').AsString;
             vlV.Cells[i,7]  := qD.FieldByName('F_INICIO').AsString;
             vlV.Cells[i,8]  := qD.FieldByName('F_VENCIMIENTO').AsString;
             vlV.Cells[i,9]  := qD.FieldByName('SDO_INSOLUTO').AsString;
             dSaldo:= dSaldo + qD.FieldByName('SDO_INSOLUTO').AsFloat;

             vlV.Cells[i,10] := qD.FieldByName('F_PAGO').AsString;
             vlV.Cells[i,11] := qD.FieldByName('TASA_APLICADA').AsString;
             vlV.Cells[i,12] := qD.FieldByName('IMP_CAPITAL').AsString;   // qD.FieldByName('SDO_VIG_TOTAL').AsString;
             dCapital:= dCapital + qD.FieldByName('IMP_CAPITAL').AsFloat; // qD.FieldByName('SDO_VIG_TOTAL').AsFloat;

             vlV.Cells[i,13] := qD.FieldByName('DIAS').AsString;
             vlV.Cells[i,14] := qD.FieldByName('IMP_INTERES').AsString;
             dInteres:= dInteres + qD.FieldByName('IMP_INTERES').AsFloat;

             vlV.Cells[i,15] := qD.FieldByName('IMP_COMISION').AsString;
             dComision:= dComision + qD.FieldByName('IMP_COMISION').AsFloat;

             vlV.Cells[i,16] := qD.FieldByName('IMP_IVACOM').AsString;
             dIvaComis:= dIvaComis + qD.FieldByName('IMP_IVACOM').AsFloat;

             vlV.Cells[i,17] := qD.FieldByName('TOTAL').AsString;
             dTotal:= dTotal + qD.FieldByName('TOTAL').AsFloat;

             vlV.Cells[i,18] := qD.FieldByName('CVE_MOTIVO_LIQ').AsString;
          End;
          vlV.Cells[i,20]    := qD.FieldByName('SDO_VIG_TOTAL').AsString; // qD.FieldByName('IMP_CAPITAL').AsString;
          dCapDet:= dCapDet  +  qD.FieldByName('SDO_VIG_TOTAL').AsFloat;  // qD.FieldByName('IMP_CAPITAL').AsFloat;
          vlV.Cells[i,21]    := qD.FieldByName('TASA_APLICADA').AsString;
          if qD.FieldByName('DIAS').AsInteger > 0 then
            vlV.Cells[i,22]    := FloatToStr( qD.FieldByName('TOT_IMP_INT').AsFloat / qD.FieldByName('DIAS').AsFloat )
          else
            vlV.Cells[i,22]    := '0';
          //
          vlV.Cells[i,23]    := qD.FieldByName('DIAS').AsString;
          vlV.Cells[i,24]    := qD.FieldByName('TOT_IMP_INT').AsString;  // qD.FieldByName('TOTAL').AsString;
          dTotDet := dTotDet  + qD.FieldByName('TOTAL').AsFloat;
          dTotInt := dTotInt  + qD.FieldByName('TOT_IMP_INT').AsFloat;
          sMotLiq := qD.FieldByName('DESC_MOTIVO_LIQ').AsString;
          Inc(i);
          qD.Next;
          //
          if qD.Eof = False then
            If iFolControl <> qD.FieldByName('ID_SOLICITUD').AsInteger Then
            begin
               bNuevoCredito := True;
               Self.CambiaSitXLS(iFolControl, Apli);
            end;//Ends_if
          //Ends_if
       End;
       Self.CambiaSitXLS(iFolControl, Apli);
       //
   end;
   //
   Inc(i);
   //Pinta Totales
   If i > 0 Then Begin
      vlV.Cells[i,9] := FloatToStr(dSaldo);
      vlV.Cells[i,12] := FloatToStr(dCapital);
      vlV.Cells[i,14] := FloatToStr(dInteres);
      vlV.Cells[i,15] := FloatToStr(dComision);
      vlV.Cells[i,16] := FloatToStr(dIvaComis);
      vlV.Cells[i,17] := FloatToStr(dTotal);
      vlV.Cells[i,20] := FloatToStr(dCapDet);
      vlV.Cells[i,24] := FloatToStr(dTotInt); // FloatToStr(dTotDet);
   End;
   //<LOLS 25 MAY 2006. PREPAGOS>
   If i > 0 Then Begin
     inc(i, 2);
     vlV.Cells[i,     2 ] := 'MOTIVO DE LA LIQUIDACION :';
     vlV.Cells[i + 1, 4 ] := sMotLiq;
   End;
   //</LOLS>
   vlV.ActiveWorkbook.Save;
End;

function TCrExcelXLSLoader.CargaArchCalif(Memo : TMemo; qD : TQuery; Apli :TInterApli; FCalif : String;
                                          var penTotalReg, penTotalRegErr : Integer ): Boolean;
const xlThick = 4;  xlThin = 2;
var
   vlV, vlVValoresdeRango : variant; i: Integer;
   vlPctCubierto, vlImpCubierto : Double;
   vlstrMessage : String;
begin
   //<LOLS 26 ABR 2006.AGREGA VALIDACION>
   Result := True;
   //</LOLS>
   //
   i   := 9;
   vlV := ExcelVariant;
   //vlV.Workbooks.Open(vlNbrArch);
   vlV.Sheets['Calificación de Cartera'].Select;
   vlV.Cells.Select;
   vlV.Range['B4:EZ1'].Select;
   vlVValoresdeRango := vlV.Selection.Value;
   VarArrayLock(vlVValoresdeRango);
   vlVValoresdeRango[4,9] :=  FCalif; // FormatDateTime('dd/mm/yyyy',Self.vlFecha);
   VarArrayUnlock(vlVValoresdeRango);
   vlV.Selection.Value:= vlVValoresdeRango;
   vlV.ActiveWorkbook.Save;

   qD.Last; penTotalReg := qD.RecordCount;
   qD.First; penTotalRegErr := 0;

   While not qD.EOF Do Begin
      //<LOLS 26 ABR 2006. SE AGREGA VALIDACION>
      If qD.FieldByName('ID_CREDITO').IsNull Then
      Begin
        Result := False;
        penTotalRegErr := penTotalRegErr + 1;
        vlstrMessage := 'Error al procesar la disposición: ' + qD.FieldByName('ID_CREDITO_CTRL').AsString + coCRLF +
                        'No se encontró la información SICC de esta disposición. ' + coCRLF;
        Memo.Lines.Add(vlstrMessage);
        If ( MessageDlg(vlstrMessage + coCRLF + '¿Desea Continuar con el proceso?',
                        mtError, [mbYes, mbNo], 0 ) = mrNo ) Then
          Begin
          //<Inicio SATV 30Abr2007>
          vlstrMessage := 'Operación detenida por el usuario.';
          MessageDlg(vlstrMessage, mtWarning, [mbOK], 0);
          Memo.Lines.Add(vlstrMessage);
          Break;
          //<Fin SATV 30Abr2007>
          End;
      End; // If qD.FieldByName('ID_CREDITO').IsNull Then

      //<Inicio SATV 30Abr2007>
      If Not (ObtenReservas(Apli, qD.FieldByName('ID_CREDITO').AsInteger, vlPctCubierto, vlImpCubierto) ) Then
         Begin
         vlPctCubierto := qD.FieldByName('RES_SDO_CUB').AsFloat;
         vlImpCubierto := qD.FieldByName('IMP_RESERVA_CUB').AsFloat;
         End;
      //<Fin SATV 30Abr2007>

      //</LOLS>
      vlV.Cells[i,2] := qD.FieldByName('ID_CREDITO').AsString;
      vlV.Cells[i,3] := qD.FieldByName('RFC').AsString;
      vlV.Cells[i,4] := qD.FieldByName('NOMBRE').AsString;
      vlV.Cells[i,5] := qD.FieldByName('SDO_TRIMESTRE').AsString;
      vlV.Cells[i,6] := qD.FieldByName('PCT_GARANTIZADO').AsString;
      vlV.Cells[i,8] := qD.FieldByName('CVE_CAL_ACRED').AsString;
      vlV.Cells[i,9] := qD.FieldByName('CVE_CALIFIC_CUB').AsString;
      vlV.Cells[i,10] := qD.FieldByName('CVE_CALIFIC_EXP').AsString;
      vlV.Cells[i,11] := FloatToStr(vlPctCubierto); //<SATV 30Abr2007> qD.FieldByName('RES_SDO_CUB').AsString;
      vlV.Cells[i,12] := qD.FieldByName('RES_SDO_EXP').AsString;
      vlV.Cells[i,13] := FloatToStr(vlImpCubierto); //<SATV 30Abr2007> qD.FieldByName('IMP_RESERVA_CUB').AsString;
      vlV.Cells[i,14] := qD.FieldByName('IMP_RESERVA_EXP').AsString;
      vlV.Cells[i,16] := FloatToStr(vlImpCubierto + qD.FieldByName('IMP_RESERVA_EXP').AsFloat); //<SATV 30Abr2007>  qD.FieldByName('TOTAL').AsString;
      Inc(i);
      qD.Next;
   End;
   vlV.ActiveWorkbook.Save;
End;

{CLASE TMGenArch}
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
constructor TMGenArch.Create( AOwner : TComponent );
begin
   Inherited;
   //
   CVE_TIPO_REPORTE :=CreaCampo('CVE_TIPO_REPORTE',ftString,tsNinguno,tsNinguno,False);
   CVE_TIPO_REPORTE.Caption:='Tipo de Reporte';
   With CVE_TIPO_REPORTE Do Begin
      Size:=6;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add(coANEXO1);
      ComboLista.Add('1'); ComboDatos.Add(coANEXO2);
      ComboLista.Add('2'); ComboDatos.Add(coANEXO3);
      ComboLista.Add('3'); ComboDatos.Add(coRPAGAN);
   End;

   NOMBRE_ARCHIVO := CreaCampo( 'NOMBRE_ARCHIVO', ftString, tsNinguno, tsNinguno, False );
   NOMBRE_ARCHIVO.Caption := 'Nombre del Archivo';
   //
   VALOR :=CreaCampo('VALOR',ftString,tsNinguno,tsNinguno,False);
   VALOR.Caption:='Descripción';
   //
   F_CORTE :=CreaCampo('F_CORTE',ftString,tsNinguno,tsNinguno,False);
   F_CORTE.Caption:='Fecha de Corte';
   //
   PATH_ARCHIVO :=CreaCampo('PATH_ARCHIVO',ftString,tsNinguno,tsNinguno,False);
   PATH_ARCHIVO.Caption:='Path del Archivo';
   //
   ID_CREDITO :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
   ID_CREDITO.Caption:='Disposición';
   //
   DESC_CREDITO :=CreaCampo('DESC_CREDITO',ftString,tsNinguno,tsNinguno,False);
   DESC_CREDITO.Caption:='Descripción de Crédito';
   //
   ANIO :=CreaCampo('ANIO',ftString,tsNinguno,tsNinguno,True);
   ANIO.Size:=4;
   ANIO.UseCombo:=True;
   //
   MES :=CreaCampo('MES',ftString,tsNinguno,tsNinguno,True);
   MES.Size:=2;
   MES.UseCombo:=True;
   //
   B_PAGO_COM_ANUAL := CreaCampo( 'B_PAGO_COM_ANUAL',  ftString, tsNinguno, tsNinguno,  False );
   B_PAGO_COM_ANUAL.Caption := 'Pago de comisión x anualidad';
   //
   ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);
   ID_ACREDITADO.Caption:='Acreditado';
   //
   DESC_ACREDITADO :=CreaCampo('DESC_ACREDITADO',ftString,tsNinguno,tsNinguno,False);
   DESC_ACREDITADO.Caption:='Nombre';
   //
   CVE_TIPO_ENVIO := CreaCampo( 'CVE_TIPO_ENVIO', ftString, tsNinguno, tsNinguno, False );
   CVE_TIPO_ENVIO.Caption := 'CVE_TIPO_ENVIO';
   With CVE_TIPO_ENVIO Do Begin
      Size := 6;
      UseCombo := True;
      ComboLista.Add('0'); ComboDatos.Add( coEMAIL  );
      ComboLista.Add('1'); ComboDatos.Add( coPORTAL );
   end;
   //
   IMP_TOTAL_ARC := CreaCampo('IMP_TOTAL_ARC',  ftFloat,  tsNinguno, tsNinguno, True);
   IMP_TOTAL_IVA := CreaCampo('IMP_TOTAL_IVA',  ftFloat,  tsNinguno, tsNinguno, True);
   NUM_REGISTRO  := CreaCampo('NUM_REGISTRO',   ftFloat,  tsNinguno, tsNinguno, True);
   NUM_ENVIO     := CreaCampo('NUM_ENVIO',      ftFloat,  tsNinguno, tsNinguno, True);

   CVE_MOTIVO_LIQ   := CreaCampo('CVE_MOTIVO_LIQ',   ftString, tsNinguno, tsNinguno, True);
   TIPO_LIQUIDACION := CreaCampo('TIPO_LIQUIDACION', ftString, tsNinguno, tsNinguno, True);
   With TIPO_LIQUIDACION Do Begin
      Size     := 6;
      UseCombo := True;
      ComboLista.Add('0'); ComboDatos.Add( coPARCIAL );
      ComboLista.Add('1'); ComboDatos.Add( coTOTAL   );
   end;
   //
   IMP_PREPAGO   := CreaCampo( 'IMP_PREPAGO',   ftFloat,  tsNinguno, tsNinguno, True);
   //
   //
   UseQuery := True;
   ShowMenuReporte:=True;

   {$WARNINGS OFF}
   CrCbArchi := TCrCbArchi.Create(Self);
   {$WARNINGS ON}
   CrCbArchi.MasterSource:=Self;
   {$WARNINGS OFF}
   CrCbFindArch := TCrCbArchi.Create(Self);
   {$WARNINGS ON}
   CrCbFindArch.MasterSource := Self;
   {$WARNINGS OFF}
   ExcelLoader := TCrExcelXLSLoader.Create(Self);
   {$WARNINGS ON}

   {$WARNINGS OFF}
   CrCredito := TCrCredito.Create(Self);
   {$WARNINGS ON}
   CrCredito.MasterSource:=Self;
   CrCredito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';
   {$WARNINGS OFF}
   Acreditado := TCrAcredit.Create(Self);
   {$WARNINGS ON}   
   Acreditado.MasterSource := Self;
   Acreditado.FieldByName('ID_ACREDITADO').MasterField := 'ID_ACREDITADO';

   {$WARNINGS OFF}
   MotivoLiq  := TCrGruCla.Create(nil);
   {$WARNINGS ON}   
   MotivoLiq.MasterSource := Self;
   MotivoLiq.BuscaWhereString := ' CVE_GRUPO_CLAVE = ''CPPAML''';
end;

Destructor TMGenArch.Destroy;
begin
   If CrCbArchi <> Nil Then
      CrCbArchi.Free;
   If CrCbFindArch <> Nil Then
      CrCbFindArch.Free;
   If ExcelLoader <> Nil Then
      ExcelLoader.Free;
   If CrCredito <> Nil Then
      CrCredito.Free;
   If Acreditado <> Nil Then
      Acreditado.Free;
   if MotivoLiq <> nil then
      MotivoLiq.Free;
   //
   inherited;
end;


function TMGenArch.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMGenArch;
begin
   W:=TwMGenArch.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      FormaParam:= W;
      W.InterForma1.ShowModal;
      FormaParam:= nil;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;




// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
Function TMGenArch.InternalBusca:Boolean;
begin
  InternalBusca := False;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// +---------------------------------------------------------------------------+
function TMGenArch.Reporte:Boolean;
begin
  Result := False;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
function TMGenArch.stpCargaComPYME: Boolean;
var stpCargaCnCr : TStoredProc;
begin
  Result := False;
  stpCargaCnCr := TStoredProc.Create(nil);
  try
    with stpCargaCnCr do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:='PKGCRCREDITOO1.STPCARGACOMNAFIN';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam( ftDate,    'PEFCORTE',       ptInput   );
      Params.CreateParam( ftString,  'PECVEUSUARIO',   ptInput   );
      Params.CreateParam( ftString,  'PEBCOMMIT',      ptInput   );
      Params.CreateParam( ftInteger, 'PSRESULTADO',    ptOutput  );
      Params.CreateParam( ftString,  'PSTXRESULTADO',  ptOutput  );
      //
      ParamByName('PEFCORTE').AsDate       := F_CORTE.AsDateTime;
      ParamByName('PECVEUSUARIO').AsString := Apli.Usuario;
      ParamByName('PEBCOMMIT').AsString    := 'V';
      ExecProc;
      if ParamByName('PSRESULTADO' ).asInteger = 0 then
        Result := True
      else begin
        ShowMessage( 'Problemas al generar los saldos de la cartera : ' + coCRLF +
                     'Código : ' + ParamByName('PSRESULTADO').AsString + coCRLF +
                     'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString
                   );
      end;
      //
    end;
  finally
    stpCargaCnCr.Free;
  end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
function TMGenArch.GeneraComAnual: boolean;
var stpCargaCnCr : TStoredProc;
begin
  Result := False;
  stpCargaCnCr := TStoredProc.Create(nil);
  try
    with stpCargaCnCr do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:='PKGCRCREDITOO1.STPCARGACOMCRED';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam( ftInteger, 'PEID_CREDITO',    ptInput   );
      Params.CreateParam( ftDate,    'PEF_CORTE',       ptInput   );
      Params.CreateParam( ftString,  'PETIPO_COMISION', ptInput   );
      Params.CreateParam( ftDate,    'PEF_REFERENCIA',  ptInput   );
      Params.CreateParam( ftString,  'PECVE_USUARIO',   ptInput   );
      Params.CreateParam( ftString,  'PEBCOMMIT',       ptInput   );
      Params.CreateParam( ftInteger, 'PSRESULTADO',     ptOutput  );
      Params.CreateParam( ftString,  'PSTXRESULTADO',   ptOutput  );
      //
      ParamByName('PEID_CREDITO'    ).AsInteger := ID_CREDITO.AsInteger;
      ParamByName('PEF_CORTE'       ).AsDate    := Apli.DameFechaEmpresa;
      ParamByName('PETIPO_COMISION' ).AsString  := 'AN';
      ParamByName('PEF_REFERENCIA'  ).AsDate    := Apli.DameFechaEmpresa;
      ParamByName('PECVE_USUARIO'   ).AsString  := Apli.Usuario;
      ParamByName('PEBCOMMIT'       ).AsString  := 'V';
      ParamByName('PSRESULTADO'     ).AsInteger := 0;
      ParamByName('PSTXRESULTADO'   ).AsString  := '';
      //
      ExecProc;
      if ParamByName('PSRESULTADO' ).asInteger = 0 then
        Result := True
      else begin
        ShowMessage( 'Problemas al generar la comisión anual de la garantía : ' + coCRLF +
                     'Código : ' + ParamByName('PSRESULTADO').AsString + coCRLF +
                     'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString
                   );
      end;
      //
    end;
  finally
    stpCargaCnCr.Free;
  end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
function TMGenArch.stpActSolGtia(IdCredito, IdSolicitud: Integer): Boolean;
var stpActGtia : TStoredProc;
Begin
  Result      := True;
  stpActGtia  := TStoredProc.Create(Nil);
  Try
    stpActGtia.DatabaseName   := Apli.DataBaseName;
    stpActGtia.SessionName    := Apli.SessionName;
    stpActGtia.StoredProcName := 'PKGCRCREDITOO1.STPACTSOLGTIANAF';
    stpActGtia.Params.Clear;
    stpActGtia.Params.CreateParam(ftFloat,   'PEID_METODO',    ptInput  );
    stpActGtia.Params.CreateParam(ftFloat,   'PEID_CREDITO',   ptInput  );
    stpActGtia.Params.CreateParam(ftFloat,   'PEID_SOLICITUD', ptInput  );
    stpActGtia.Params.CreateParam(ftString,  'PEBCOMMIT',      ptInput  );
    stpActGtia.Params.CreateParam(ftFloat,   'PSRESULTADO',    ptOutput );
    stpActGtia.Params.CreateParam(ftString,  'PSTXRESULTADO',  ptOutput );
    //
    stpActGtia.ParamByName( 'PEID_METODO'    ).AsInteger := 1;
    stpActGtia.ParamByName( 'PEID_CREDITO'   ).AsInteger := IdCredito;
    stpActGtia.ParamByName( 'PEID_SOLICITUD' ).AsInteger := IdSolicitud;
    stpActGtia.ParamByName( 'PEBCOMMIT'      ).AsString  := 'V';
    stpActGtia.ParamByName( 'PSRESULTADO'    ).AsInteger := 0;
    stpActGtia.ParamByName( 'PSTXRESULTADO'  ).AsString  := '';
    //
    stpActGtia.ExecProc;
    if stpActGtia.ParamByName( 'PSRESULTADO' ).AsInteger <> 0 then
    begin
      Result := False;
      MessageDlg( 'Error al reactivar la solicitud' + #13#10 +
                  'Código:' + IntToStr(stpActGtia.ParamByName( 'PSRESULTADO' ).AsInteger) + #13#10 +
                  'Msg:'    + stpActGtia.ParamByName( 'PSTXRESULTADO'  ).AsString,
                  mtWarning, [mbOk], 0 );
    end;
  finally
    stpActGtia.Free;
  end;
  //
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
function TMGenArch.stpValComCred( FCorte: TDate ): Boolean;
var stpValComCred : TStoredProc;
begin
  Result := False;
  stpValComCred := TStoredProc.Create(nil);
  try
    with stpValComCred do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:='PKGCRCREDITOO1.STPVALSDOCARTRA';
     //
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam( ftDate,    'PEF_CORTE',        ptInput   );
      Params.CreateParam( ftDate,    'PEF_REFERENCIA',   ptInput   );
      Params.CreateParam( ftString,  'PEBCOMMIT',        ptInput   );
      Params.CreateParam( ftInteger, 'PSRESULTADO',      ptOutput  );
      Params.CreateParam( ftString,  'PSTXRESULTADO',    ptOutput  );
      //
      ParamByName('PEF_CORTE'      ).AsDate    := FCorte;
      ParamByName('PEF_REFERENCIA' ).AsDate    := Apli.DameFechaEmpresa;
      ParamByName('PEBCOMMIT'      ).AsString  := 'V';
      //
      ExecProc;
      if ParamByName('PSRESULTADO' ).asInteger = 0 then
        Result := True
      else begin
        ShowMessage( 'Problemas al validar los saldos de la cartera : '   + coCRLF +
                     'Código : ' + ParamByName('PSRESULTADO').AsString    + coCRLF +
                     'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString
                   );
      end;
      //
    end;
  finally
    stpValComCred.Free;
  end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
function TMGenArch.stpActComCred(IdMetodo  : Integer; IdCredito: Integer;
                                 FCorte    : TDate;   FolioCorte: Integer;
                                 ImpBruCtl : Double;  ImpIVACtl : Double
                                 ): Boolean;
var stpUpdComCred : TStoredProc;
begin
  Result := False;
  stpUpdComCred := TStoredProc.Create(nil);
  try
    with stpUpdComCred do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:='PKGCRCREDITOO1.STPACTSDOCARTRA';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam( ftInteger, 'PEID_METODO',      ptInput   );
      Params.CreateParam( ftInteger, 'PEID_CREDITO',     ptInput   );
      Params.CreateParam( ftDate,    'PEF_CORTE',        ptInput   );
      Params.CreateParam( ftInteger, 'PEFOLIO_CORTE',    ptInput   );
      Params.CreateParam( ftDate,    'PEFREFERENCIA',    ptInput   );
      Params.CreateParam( ftString,  'PECVE_USUARIO',    ptInput   );
      Params.CreateParam( ftFloat,   'PEIMPBRUCTL',      ptInput   );
      Params.CreateParam( ftFloat,   'PEIMPIVACTL',      ptInput   );
      Params.CreateParam( ftString,  'PEBCOMMIT',        ptInput   );
      Params.CreateParam( ftInteger, 'PSRESULTADO',      ptOutput  );
      Params.CreateParam( ftString,  'PSTXRESULTADO',    ptOutput  );
      //
      ParamByName('PEID_METODO'   ).AsInteger := IdMetodo;
      ParamByName('PEID_CREDITO'  ).AsInteger := IdCredito;
      ParamByName('PEF_CORTE'     ).AsDate    := FCorte;
      ParamByName('PEFOLIO_CORTE' ).AsInteger := FolioCorte;
      ParamByName('PEFREFERENCIA' ).AsDate    := Apli.DameFechaEmpresa;
      ParamByName('PECVE_USUARIO' ).AsString  := Apli.Usuario;
      ParamByName('PEIMPBRUCTL'   ).AsFloat   := ImpBruCtl;
      ParamByName('PEIMPIVACTL'   ).AsFloat   := ImpIVACtl;
      ParamByName('PEBCOMMIT'     ).AsString  := 'V';
      //
      ExecProc;
      if ParamByName('PSRESULTADO' ).asInteger = 0 then
        Result := True
      else begin
        ShowMessage( 'Problemas al actualizar la comisión de saldos de la cartera : ' + coCRLF +
                     'Código : ' + ParamByName('PSRESULTADO').AsString    + coCRLF +
                     'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString  + coCRLF +
                     'Params:  ' + Format( '[%d] [%s] [%d]', [ IdCredito, DateToStr(FCorte), FolioCorte ] )
                   );
      end;
      //
    end;
  finally
    stpUpdComCred.Free;
  end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
function TMGenArch.stpGrabaArchivo( CveAnexo     : String;   FArchivo    : TDate;
                                    TxNomArchivo : String;   TxArcContenido : String;
                                    SitArchivo   : String;   ImpTotalArc : Double;
                                    ImpTotalIVA  : Double;   NumRegistro : Integer;
                                    NumEnvio     : Integer;  var psFolio : Integer ) : Boolean;
var stpInsArchivo : TStoredProc;
begin
  Result := False;
  stpInsArchivo := TStoredProc.Create(nil);
  try
    with stpInsArchivo do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:='PKGCRCREDITOO1.STPINSERTACBARCHIVO';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam( ftString,  'PE_CVE_ANEXO',        ptInput   );
      Params.CreateParam( ftDate,    'PE_F_ARCHIVO',        ptInput   );
      Params.CreateParam( ftString,  'PE_TX_NOM_ARCHIVO',   ptInput   );
      //Params.CreateParam( ftMemo,    'PE_TX_ARC_CONTENIDO', ptInput   );
      Params.CreateParam( ftString,  'PE_SIT_ARCHIVO',      ptInput   );
      Params.CreateParam( ftFloat,   'PE_IMP_TOTAL_ARC',    ptInput   );
      Params.CreateParam( ftFloat,   'PE_IMP_TOTAL_IVA',    ptInput   );
      Params.CreateParam( ftInteger, 'PE_NUM_REGISTRO',     ptInput   );
      Params.CreateParam( ftInteger, 'PE_NUM_ENVIO',        ptInput   );
      Params.CreateParam( ftInteger, 'PE_ID_EMPRESA',       ptInput   );
      Params.CreateParam( ftString,  'PEBCOMMIT',           ptInput   );
      Params.CreateParam( ftInteger, 'PS_ID_ARCHIVO',       ptOutput  );
      Params.CreateParam( ftFloat,   'PSRESULTADO',         ptOutput  );
      Params.CreateParam( ftString,  'PSTXRESULTADO',       ptOutput  );
      //
      ParamByName( 'PE_CVE_ANEXO'        ).AsString  := CveAnexo;
      ParamByName( 'PE_F_ARCHIVO'        ).AsDate    := FArchivo;
      ParamByName( 'PE_TX_NOM_ARCHIVO'   ).AsString  := TxNomArchivo;
      //ParamByName( 'PE_TX_ARC_CONTENIDO' ).Clear;
      ParamByName( 'PE_SIT_ARCHIVO'      ).AsString  := SitArchivo;
      ParamByName( 'PE_IMP_TOTAL_ARC'    ).AsFloat   := ImpTotalArc;
      ParamByName( 'PE_IMP_TOTAL_IVA'    ).AsFloat   := ImpTotalIVA;
      ParamByName( 'PE_NUM_REGISTRO'     ).AsInteger := NumRegistro;
      ParamByName( 'PE_NUM_ENVIO'        ).AsInteger := NumEnvio;
      ParamByName( 'PE_ID_EMPRESA'       ).AsInteger := Apli.IdEmpresa;
      ParamByName( 'PEBCOMMIT'           ).AsString  := 'V';
      //
      ExecProc;
      if ParamByName('PSRESULTADO' ).asInteger = 0 then
      Begin
        Result  := True;
        psFolio := ParamByName('PS_ID_ARCHIVO').AsInteger;
      End else begin
        ShowMessage( 'Problemas al insertar el archivo a la Base de Datos : ' + coCRLF +
                     'Código : ' + ParamByName('PSRESULTADO').AsString    + coCRLF +
                     'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString
                   );
      end;
      //
    end;
  finally
    stpInsArchivo.Free;
  end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
function TMGenArch.stpActSitArchivo(Folio: Integer): Boolean;
var stpActArchivo : TStoredProc;
begin
  Result := False;
  stpActArchivo := TStoredProc.Create(nil);
  try
    with stpActArchivo do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:='PKGCRCREDITOO1.STPACTSITARCNAF';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam( ftFloat,   'PEID_ARCHIVO',        ptInput   );
      Params.CreateParam( ftString,  'PEBCOMMIT',           ptInput   );
      Params.CreateParam( ftFloat,   'PSRESULTADO',         ptOutput  );
      Params.CreateParam( ftString,  'PSTXRESULTADO',       ptOutput  );
      //
      ParamByName( 'PEID_ARCHIVO' ).AsInteger := Folio;
      ParamByName( 'PEBCOMMIT'    ).AsString  := 'V';
      //
      ExecProc;
      if ParamByName('PSRESULTADO' ).asInteger = 0 then
      Begin
        Result  := True;
      End else begin
        ShowMessage( 'Error al actualizar la situación del archivo en la Base de Datos : ' + coCRLF +
                     'Código : ' + ParamByName('PSRESULTADO').AsString    + coCRLF +
                     'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString
                   );
      end;
      //
    end;
  finally
    stpActArchivo.Free;
  end;
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
function TMGenArch.getValorCve( CveGpo, CveRef : String ) : String;
begin
  Result := '';
  GetSQLStr( Format(coSQLVALOR, [ SQLStr(CveGpo), SQLStr( CveRef ) ] ),
                   Apli.DataBaseName, Apli.SessionName, 'VALOR',
                   Result, True );
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
Function TMGenArch.LlamaDetalle: Boolean;
Var stpInserta : TStoredProc;
Begin
   Result := False;
   If ID_CREDITO.AsInteger > 0 Then Begin
      stpInserta:=TStoredProc.Create(Nil);
      Try
         stpInserta.DatabaseName := Apli.DataBaseName;
         stpInserta.SessionName  := Apli.SessionName;
         stpInserta.Active       := False;
         stpInserta.Params.Clear;
         stpInserta.StoredProcName:='PKGCRREDESCTO.STPDETPAGOSANT';

         stpInserta.Params.CreateParam(ftInteger, 'PEIDSOLICITUD',  ptInput);
         stpInserta.Params.CreateParam(ftString,  'PECVETIPOSOL',   ptInput);
         stpInserta.Params.CreateParam(ftInteger, 'PEIDCREDITO',    ptInput);
         stpInserta.Params.CreateParam(ftInteger, 'PEIDACREDITADO', ptInput);
         stpInserta.Params.CreateParam(ftDate,    'PEFCORTE',       ptInput);
         stpInserta.Params.CreateParam(ftInteger, 'PEIDEMPRESA',    ptInput);
         stpInserta.Params.CreateParam(ftString,  'PEMOTIVOLIQ',    ptInput);
         stpInserta.Params.CreateParam(ftString,  'PETXMOTIVOLIQ',  ptInput);
         stpInserta.Params.CreateParam(ftString,  'PETIPOLIQ',      ptInput);
         stpInserta.Params.CreateParam(ftFloat,   'PEIMPPAGOCAP',   ptInput);
         stpInserta.Params.CreateParam(ftString,  'PECVEUSUALTA',   ptInput);
         stpInserta.Params.CreateParam(ftString,  'PEBCOMMIT',      ptInput);
         stpInserta.Params.CreateParam(ftInteger, 'PSIDSOLICITUD',  ptOutput);
         stpInserta.Params.CreateParam(ftInteger, 'PSRESULTADO',    ptOutput);
         stpInserta.Params.CreateParam(ftString,  'PSTXRESULTADO',  ptOutput);

         stpInserta.ParamByName('PEIDSOLICITUD').Clear;
         stpInserta.ParamByName('PECVETIPOSOL').AsString    := coPAGANT;
         stpInserta.ParamByName('PEIDCREDITO').AsInteger    := ID_CREDITO.AsInteger;
         stpInserta.ParamByName('PEIDACREDITADO').AsInteger := ID_ACREDITADO.AsInteger;
         stpInserta.ParamByName('PEFCORTE').AsDateTime      := F_CORTE.AsDateTime;
         stpInserta.ParamByName('PEIDEMPRESA').AsInteger    := Apli.IdEmpresa;
         stpInserta.ParamByName('PEMOTIVOLIQ'   ).AsString  := CVE_MOTIVO_LIQ.asstring;
         stpInserta.ParamByName('PETXMOTIVOLIQ' ).AsString  := MotivoLiq.VALOR.AsString;
         stpInserta.ParamByName('PETIPOLIQ'     ).AsString  := TIPO_LIQUIDACION.asstring;
         stpInserta.ParamByName('PEIMPPAGOCAP'  ).asfloat   := IMP_PREPAGO.asfloat;
         stpInserta.ParamByName('PECVEUSUALTA'  ).AsString  := apli.usuario;
         stpInserta.ParamByName('PEBCOMMIT'     ).AsString  := 'V';
         stpInserta.ExecProc;
         If stpInserta.ParamByName('PSRESULTADO').AsInteger = 0 Then Begin
            Result := True;
         End Else Begin
            Result := False;
            ShowMessage( 'Error: ' + stpInserta.ParamByName('PSTXRESULTADO').AsString );
         End;
      Finally
         If stpInserta <> Nil Then Begin
            stpInserta.UnPrepare;
            stpInserta.Free;
         End;
      End;
   End;
End;


(***********************************************FORMA TMGenArch********************)
(*                                                                              *)
(*  FORMA DE TMGenArch                                                            *)
(*                                                                              *)
(***********************************************FORMA TMGenArch********************)
//
procedure TwMGenArch.LimpiaDatos;
begin
  if Objeto.CrCbArchi.Active then
     Objeto.CrCbArchi.Active := False;
  //
  if Objeto.CrCbFindArch.Active then
     Objeto.CrCbFindArch.Active := False;
  //
  if Objeto.CrCredito.Active then
     Objeto.CrCredito.Active := False;
  //

  lbWarningArchivo.Visible := False;
  //
  btnSigArchivo.Enabled := False;
  pcPrincipal.ActivePageIndex := 0;
  //
  rbGenArch.Checked := True;
  //
  edIdCorreo.Text   := '';
  edIdEmpresa.Text  := '';
  edPara.Text       := '';
  edConCopia.Text   := '';
  edAsunto.Text     := '';
  mMensaje.Lines.Clear;

  If ( sNombreArchivo <> '' ) And ( FileExists( sNombreArchivo ) ) then DeleteFile(sNombreArchivo);
  sNombreArchivo  := '';
  edNbrArch.Text  := '';
end;
{
+ -----------------------------------------------------------------------------+
|                              CambiaSit                                       |
+ -----------------------------------------------------------------------------+
}
Function TwMGenArch.CambiaAnx2Sit(IdMetodo  : Integer; iIdCredito  : Integer;
                                  FolioCorte: Integer; ImpBruCtl   : Double;
                                  ImpIVACtl : Double): Boolean;
Begin
  Objeto.F_CORTE.GetFromControl;
  Result :=  Objeto.stpActComCred(IdMetodo,   iIdCredito, Objeto.F_CORTE.AsDateTime,
                                  FolioCorte, ImpBruCtl,  ImpIVACtl  );
End;
{
+ -----------------------------------------------------------------------------+
|                           PosicionClave                                      |
+ -----------------------------------------------------------------------------+
}
Function TwMGenArch.PosicionClave(sDato:String; Tamanio: Integer):String;
Var sResultado: String;
Begin
   If Length(sDato)< Tamanio Then Begin
      While Length(sDato)< Tamanio Do Begin
         sDato:= #32 + sDato;
      End;
   End;
   sResultado    := sDato;
   PosicionClave := sResultado;
End;
{
+ -----------------------------------------------------------------------------+
|                           ObtNombreArch                                      |
+ -----------------------------------------------------------------------------+
}
Procedure TwMGenArch.ObtNombreArch;
var
   sMensaje: String;
   r : Longint;
   c : Array[0..500] of Char;
Begin
   r:= GetTempPathA(500, c);
   If r = 0 Then
   Begin
      sMensaje:=  'Error al obtener directorio temporal: ';
      Application.MessageBox(pchar(sMensaje),   'Recuperación de Archivo', 0);
      Exit;
   End;
   Objeto.PATH_ARCHIVO.AsString   := c;
   Objeto.NOMBRE_ARCHIVO.AsString := Objeto.CVE_TIPO_REPORTE.AsString +'_' +
                                     FormatDateTime( 'ddmmyyyy', Objeto.Apli.DameFechaEmpresa );
   //
   If (Objeto.CVE_TIPO_REPORTE.AsString = coRPAGAN)Or(Objeto.CVE_TIPO_REPORTE.AsString = coANEXO3 ) Then Begin
      If (Objeto.CVE_TIPO_REPORTE.AsString = coANEXO3 )And(rgTipoArch.ItemIndex=1)Then Begin
         Objeto.NOMBRE_ARCHIVO.AsString:= Objeto.NOMBRE_ARCHIVO.AsString + '.txt';
      End Else Begin
         Objeto.NOMBRE_ARCHIVO.AsString:= Objeto.NOMBRE_ARCHIVO.AsString + '.xls';
         Objeto.ExcelLoader.vlNbrArch:= Objeto.PATH_ARCHIVO.AsString + Objeto.NOMBRE_ARCHIVO.AsString;
      End;
   End Else Begin
      Objeto.NOMBRE_ARCHIVO.AsString:= Objeto.NOMBRE_ARCHIVO.AsString + '.txt';
   End;
End;
{
+ -----------------------------------------------------------------------------+
|                           LeerCampo                                          |
+ -----------------------------------------------------------------------------+
}
Procedure TwMGenArch.LeerCampo(sTableName:String; sCveEnc:String; sCampoBlob:String);
Var tDetalleCam: TTable;
Begin
   tDetalleCam := TTable.Create(Nil);
   Try
      tDetalleCam.DatabaseName := Objeto.Apli.DataBaseName;
      tDetalleCam.TableName := sTableName;
      tDetalleCam.Active := True;
      If tDetalleCam.FindKey([sCveEnc]) Then Begin
         tDetalleCam.Edit;
         Objeto.msBufSal.Clear;
         TMemoField(tDetalleCam.FindField(sCampoBlob)).SaveToStream(Objeto.msBufSal);
         Objeto.msBufSal.Position:=0;
         Objeto.NOMBRE_ARCHIVO.AsString := Objeto.CrCbArchi.TX_NOM_ARCHIVO.AsString;
         sNombreArchivo := Objeto.PATH_ARCHIVO.AsString + Objeto.NOMBRE_ARCHIVO.AsString;
         Objeto.msBufSal.SaveToFile(sNombreArchivo);
         tDetalleCam.Post;
      End;
   Finally
      tDetalleCam.Close;
      tDetalleCam.Free;
   End;
End;
{
+ -----------------------------------------------------------------------------+
|                           DameFechaAnexo2                                    |
+ -----------------------------------------------------------------------------+
}
Function TwMGenArch.DameFechaAnexo2(dFecha:TDateTime): String;
var sSQL, sDia : String;
Begin
   sSQL:= 'SELECT PKGCRCREDITOO1.FUNOBTFECHAANX2(' + SQLFecha( Objeto.Apli.DameFechaEmpresa ) + ') FECHA FROM DUAL';
   GetSQLStr( sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'FECHA', sDia, False );
   Result := sDia;
End;
{
+ -----------------------------------------------------------------------------+
|                           GuardaArch                                         |
+ -----------------------------------------------------------------------------+
}
Function  TwMGenArch.EscribirACampo(sTableName:String; sCveKey:String; sCampoBlob:String): Boolean;
Var tDetalle:   TTable;
Begin
  Result := True;
  try
     tDetalle := TTable.Create(Nil);
     Try
        tDetalle.DatabaseName := Objeto.Apli.DataBaseName;
        tDetalle.TableName := sTableName;
        tDetalle.Active := True;
        If tDetalle.FindKey([sCveKey]) Then Begin
           tDetalle.Edit;
           Objeto.msBufEnt.Position:=0;
           TMemoField(tDetalle.FindField(sCampoBlob)).LoadFromStream(Objeto.msBufEnt);
           tDetalle.Post;
        End;
     Finally
        tDetalle.Close;
        tDetalle.Free;
     End;
  Except
    on e : Exception do
    Begin
      Result := False;
      MessageDlg( e.Message, mtError, [mbOk], 0 );
    End;
  End;
End;
{
+ -----------------------------------------------------------------------------+
|                           GuardaArch                                         |
+ -----------------------------------------------------------------------------+
}
Function TwMGenArch.GuardaArch : Boolean;
begin
   Objeto.GetFromControl;
   Result := False;
   If FileExists(Objeto.PATH_ARCHIVO.AsString + Objeto.NOMBRE_ARCHIVO.AsString) Then Begin
      Objeto.msBufEnt.Clear;
      Objeto.msBufEnt.Position:=0;
      Objeto.msBufEnt.LoadFromFile(Objeto.PATH_ARCHIVO.AsString + Objeto.NOMBRE_ARCHIVO.AsString);
      //
      iFolio := 0;
      Result := Objeto.stpGrabaArchivo( Objeto.CVE_TIPO_REPORTE.AsString, Objeto.Apli.DameFechaEmpresa,
                              Objeto.NOMBRE_ARCHIVO.AsString,   '', 'AC', Objeto.IMP_TOTAL_ARC.AsFloat,
                              Objeto.IMP_TOTAL_IVA.AsFloat,     Objeto.NUM_REGISTRO.AsInteger,
                              Objeto.NUM_ENVIO.AsInteger,       iFolio );
      If Result Then
         Result := EscribirACampo('CR_CB_ARCHIVO', IntToStr(iFolio), 'TX_ARC_CONTENIDO');
   End;
End;
{
+ -----------------------------------------------------------------------------+
|                           CopyFilePYME                                       |
+ -----------------------------------------------------------------------------+
}
function TwMGenArch.CopyFilePYME(Origen, Destino: String): Boolean;
var P1, P2 : array[0..255] of Char;
begin
  fillchar( P1, sizeof(P1), #0 );
  fillchar( P2, sizeof(P2), #0 );
  //
  StrPCopy( P1, Origen );
  StrPCopy( P2, Destino );
  try
    Result := CopyFile( @P1, @P2, False );
  except
    on e : exception do
    begin
      MessageDlg( e.Message, mtError, [mbOk], 0 );
      Result := False;
    end;
  end;
end;
//
{
function TwMGenArch.CopyFilePYME(Origen, Destino: String): Boolean;
var F1, F2: TextFile;
    Ch: Char;
begin
  Result := False;
  try
    AssignFile(F1, Origen );
    Reset(F1);
    //
    AssignFile(F2, Destino);
    Rewrite(F2);
    //
    while not Eof(F1) do
    begin
      Read (F1, Ch);
      Write(F2, Ch);
    end;
    CloseFile(F2);
    CloseFile(F1);
    Result := True;
  except
    on e : exception do
      MessageDlg( e.Message, mtError, [mbOk], 0 );
  end;
end;
}
//
{
+ -----------------------------------------------------------------------------+
|                           CreaArchivo                                        |
+ -----------------------------------------------------------------------------+
}
Procedure TwMGenArch.CreaArchivo;
Var
   P1, P2 : array[0..255] of Char;
   StrFOrigen : string;
Begin
  If Objeto.NOMBRE_ARCHIVO.AsString <> '' Then
  begin
      If Objeto.CVE_TIPO_REPORTE.AsString = coANEXO3 Then
      Begin
         StrFOrigen := Objeto.getValorCve( coGAFNAR, Objeto.CVE_TIPO_REPORTE.AsString );
         if StrFOrigen = '' then
           ShowMessage( Objeto.CVE_TIPO_REPORTE.AsString + '>Error al obtener la plantilla.');
      End Else If (Objeto.CVE_TIPO_REPORTE.AsString = coRPAGAN ) Then
      Begin
         StrFOrigen := Objeto.getValorCve( coGAFNAR, Objeto.CVE_TIPO_REPORTE.AsString );
         if StrFOrigen = '' then
           ShowMessage( Objeto.CVE_TIPO_REPORTE.AsString + '>Error al obtener la plantilla.');
      End; 
      //
      StrPCopy(P1,StrFOrigen);
      StrPCopy(P2,Objeto.PATH_ARCHIVO.AsString + Objeto.NOMBRE_ARCHIVO.AsString);
      If FileExists(Objeto.PATH_ARCHIVO.AsString + Objeto.NOMBRE_ARCHIVO.AsString) Then
      begin
         If MessageDlg('El archivo ''' + Objeto.PATH_ARCHIVO.AsString + Objeto.NOMBRE_ARCHIVO.AsString +
                       ''' ya existe. ¿Desea reemplazar el archivo existente?',
            mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         Begin
            Exit;
         End;
      End;
      //
      Try
         If not CopyFile(@P1,@P2,False) Then
            raise Exception.Create('Error al crear archivo, archivo no creado');
      Except
         On E : Exception Do Begin
            ShowMessage(E.Message);
            Exit;
         End;
      End;
  End;
End;
{
+ -----------------------------------------------------------------------------+
|               Obtiene los datos para el envío del correo electrónico         |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.ObtenDatosCorreo(var sHost: String; var iPort: integer; var sFrom: String);
begin
  sHost := Objeto.getValorCve( 'MAILSE', 'MPARAM' );
  iPort := StrToIntDef( Objeto.getValorCve( 'MAILPT', 'MPARAM' ), 0 );
  sFrom := Objeto.getValorCve( Objeto.CVE_TIPO_REPORTE.AsString, 'EMAILFROM' );
end;
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
function  TwMGenArch.recArchivo(): String;
Var
   sRes, sMensaje: String;
   r: Longint;   c: Array[0..500] of Char;
Begin
   r:= GetTempPathA(500, c);
   If r=0 Then Begin
      sMensaje:=  'Error al obtener directorio temporal: ';
      Application.MessageBox(pchar(sMensaje),   'Recuperación de Archivo', 0);
      Exit;
   End;
   Objeto.PATH_ARCHIVO.AsString := c;
   LeerCampo('CR_CB_ARCHIVO', Objeto.CrCbArchi.ID_ARCHIVO.AsString, 'TX_ARC_CONTENIDO');
   sRes:= sNombreArchivo;
   Result:=  sRes;
End;
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
function TwMGenArch.SeparaDatos(sDato: String): TStringList;
Var
  sCadena: String;
  slRes: TStringList;
Begin
  sCadena := Trim(sDato);
  slRes:= TStringList.Create();
  If sDato<>'' Then Begin
    sCadena := Trim(sDato);
    While (Length(sCadena)>0) Do Begin
      If (POS(',', sCadena)=0) Then Begin
        slRes.Add(Trim(sCadena));
        sCadena:= '';
      End
      Else Begin
        slRes.Add(Copy(sCadena, 1, POS(',', sCadena)-1));
        sCadena:= Copy(sCadena, POS(',', sCadena)+1, Length(sCadena));
      End;
    End;
  End;

  Result:= slRes;
End;
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
function  TwMGenArch.enviaCorreo(): Boolean;
Var
  sMensaje: String;
  sHost   : String;
  iPort   : integer;
  sFrom   : String;
begin
  Result:= False;
  //
  ObtenDatosCorreo(sHost, iPort, sFrom );
  If ( sHost = '' ) Or ( iPort = 0 ) Then Begin
    Application.MessageBox('No existen los parámetros de configuración del correo electrónico',
                           'Enviando notificación', 0);
    Exit;
  End;
  //
  If ( sFrom = '' ) Then Begin
    Application.MessageBox('No existen configuración del correo origen del usuario',
                           'Enviando notificación', 0);
    Exit;
  End;
  //
  NMSMTP1.Host := sHost;
  NMSMTP1.Port := iPort;
  Try
    NMSMTP1.Connect;
  except
    on E: Exception do
    Begin
      sMensaje:= 'Error al conectarse al servidor de correo:' +  CHR(13) + E.Message;
      Application.MessageBox(pchar(sMensaje), 'Enviando notificación', 0);
    End;
  End;

  Try
    NMSMTP1.PostMessage.FromAddress  := sFrom;
    NMSMTP1.PostMessage.ToAddress    := SeparaDatos(edPara.Text);
    NMSMTP1.PostMessage.ToCarbonCopy := SeparaDatos(edConCopia.Text);
    NMSMTP1.PostMessage.Subject      := edAsunto.Text;
    NMSMTP1.PostMessage.Body.Clear;
    NMSMTP1.PostMessage.Body.AddStrings(mMensaje.Lines);
    NMSMTP1.PostMessage.Attachments.Clear;
    NMSMTP1.PostMessage.Attachments.Add(sNombreArchivo);
    NMSMTP1.SendMail;
  except
    on E: Exception do Begin
      sMensaje:= 'Error al enviar notificación por correo:' +  CHR(13) + E.Message;
      Application.MessageBox(pchar(sMensaje), 'Enviando notificación', 0);
      End;
  End;
  NMSMTP1.Disconnect;
  Result:= True;
End;
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
Function TwMGenArch.FormaQuery(TipoArchivo:String):String;
Var   sSQL: String;
      sSQLCred : String;
      sAnioMes : String;
Begin
   If TipoArchivo = coANEXO1 Then Begin
      sSQL:=
            'SELECT * FROM '+ coCRLF +
            '('+ coCRLF +
            'SELECT 0 AS GRUPO, NVL(CRSOL.ID_CREDITO,0) AS ID_CREDITO, CRSOL.ID_SOLICITUD, DATOS.NOMBRE, DATOS.RFC, DATOS.CALLE_NUMERO,'+ coCRLF +
            '       DATOS.COLONIA, DATOS.CODIGO_POSTAL, DATOS.CIUDAD, DATOS.MUNICIPIO,'+ coCRLF +
// </ RABA >  AGOSTO 2011 SE AGREGA EL MAIL
//            '       DATOS.ESTADO, DATOS.E_MAIL, DATOS.DESC_SECTOR_ECO AS GIRO, CC.ID_CREDITO AS CVE_FINAN,'+ coCRLF +
// < RABA />
            '       DATOS.ESTADO, DATOS.E_MAIL, DATOS.DESC_SECTOR_ECO AS GIRO, CC.ID_CREDITO AS CVE_FINAN,'+ coCRLF +
            '       DATOS.TIPSEC, DECODE(NVL(CFC.ID_CREDITO,0),0,''N'',''S'')AS FONDEO_NAFIN,'+ coCRLF +
            '       ''S'' AS RIESGO_NAFIN, CRSOL.PCT_PART_RIESGO,'+ coCRLF +
            '	   NVL(CRSOL.NUM_PERSONAL,0) AS NUM_PERSONAL, CRSOL.IMP_PROM_VENTAS,'+ coCRLF +
            '       CRSOL.PCT_PROD_MER_INT, CRSOL.PCT_PROD_MER_EXT,'+ coCRLF +
            '       CRSOL.CVE_TIP_AMORTIZA, CRSOL.IMP_FINANCIAMTO,'+ coCRLF +
            '       TRIM(TO_CHAR(CRSOL.F_PARTICIPACION,''YYYYMMDD'')) AS F_DISPOSICION,'+ coCRLF +
            '       CC.IMP_CREDITO, MONEDA.CVE_CLAVE AS MONEDA,'+ coCRLF +
            '       CRSOL.NUM_MES_PLAZO, CRSOL.NUM_MES_GRACIA,'+ coCRLF +
            '       CC.SOBRETASA, CRSOL.CVE_FUNC_INTER, CRSOL.CVE_INTER_FINAN,'+ coCRLF +
            '       CRSOL.CVE_TIP_AUTORIZA, CRSOL.CVE_PROGRAMA, CRSOL.CVE_TIP_TASA,'+ coCRLF +
            '       (CC.F_VENCIMIENTO - ADD_MONTHS( CC.F_INICIO, CRSOL.NUM_MES_PLAZO ) )DIAS_PLAZO,'+ coCRLF +
            '       CRSOL.CVE_CALIF_CRE, CRSOL.MES_ANTIGUEDAD,'+ coCRLF +
            //'	   --Propósitos'+ coCRLF +
            '       '' '' AS CVE_PROPOSITO, CRSOL.CVE_TIP_CRED,'+ coCRLF +
            //'       --Garantías'+ coCRLF +
            '       GARANT.CVE_CLAVE AS CVE_GARANTIA, NVL(GARANT.IMP_GARANTIA,0) AS IMP_GARANTIA,'+ coCRLF +
            //'	   --Destino'+ coCRLF +
            '	   '' '' AS CVE_DESTINO, TRIM(TO_CHAR(0,''000'')) AS PCT_PARCIAL,'+ coCRLF +
            '       TRIM(TO_CHAR(0,''000'')) AS PCT_ORIGEN_NAL,'+ coCRLF +
            '       TRIM(TO_CHAR(0,''000'')) AS PCT_IMPORTACION'+ coCRLF +
            '  FROM CR_CREDITO CC,'+ coCRLF +
            '       (SELECT CCTO.ID_CONTRATO, CTO.ID_TITULAR, TIT.NOMBRE,'+ coCRLF +
            '               RFC.SIGLAS_RFC||RFC.F_RFC||RFC.HOMOCLAVE_RFC AS RFC,'+ coCRLF +
            '               DOM.CALLE_NUMERO, DOM.COLONIA, DOM.CODIGO_POSTAL,'+ coCRLF +
            '               DOM.CVE_CIUDAD, CDAD.DESC_POBLACION AS CIUDAD,'+ coCRLF +
            '               DOM.CVE_CIUDAD AS CVE_MUNICIPIO,'+ coCRLF +
            '	           (SELECT CVE_MPIO_CLAVE FROM CR_MAP_MUNICIPIO'+ coCRLF +
            '                 WHERE CVE_ESTADO = DOM.CVE_ESTADO'+ coCRLF +
            '                   AND CVE_MPIO_CORP = DOM.CVE_CIUDAD)AS MUNICIPIO,'+ coCRLF +
            '               DOM.CVE_ESTADO, ESTADO.CVE_CLAVE AS ESTADO, ACR.CVE_SECTOR_ECO,'+ coCRLF +
            '               SE.DESC_SECTOR_ECO, SE.CVE_TIPO_SECTOR, SECTOR.CVE_CLAVE AS TIPSEC,'+ coCRLF +
// </ RABA >  AGOSTO 2011 SE AGREGA EL MAIL
            '               TIT.E_MAIL '+ coCRLF + 
// < RABA />
            '          FROM CR_CONTRATO CCTO, CONTRATO CTO, PERSONA TIT, RFC, DOMICILIO DOM,'+ coCRLF +
            //'               CR_ACREDITADO ACR, CR_SECTOR_ECO SE, /*CRE_SENICREB CSE,*/POBLACION CDAD,'+ coCRLF +
            '               CR_ACREDITADO ACR, CR_SECTOR_ECO SE, POBLACION CDAD,'+ coCRLF +
            '               (SELECT * FROM CR_MAPEO_CLAVE WHERE CVE_GRUPO_CLAVE=''CVEEDO'')ESTADO,'+ coCRLF +
            '               (SELECT * FROM CR_MAPEO_CLAVE WHERE CVE_GRUPO_CLAVE=''CVESEC'')SECTOR'+ coCRLF +
            '         WHERE CTO.ID_CONTRATO = CCTO.ID_CONTRATO'+ coCRLF +
            '           AND TIT.ID_PERSONA = CTO.ID_TITULAR'+ coCRLF +
            '           AND CTO.ID_TITULAR = RFC.ID_PERSONA'+ coCRLF +
            '           AND DOM.ID_DOMICILIO = TIT.ID_DOMICILIO'+ coCRLF +
            '           AND ACR.ID_ACREDITADO = CTO.ID_TITULAR'+ coCRLF +
            '           AND SE.CVE_SECTOR_ECO (+)= ACR.CVE_SECTOR_ECO'+ coCRLF +
            //'           AND CSE.CVE_SENICREB = ACR.CVE_SENICREB'+ coCRLF +
            '           AND ESTADO.CVE_CORP (+)= DOM.CVE_ESTADO'+ coCRLF +
            '           AND CDAD.CVE_POBLACION = DOM.CVE_CIUDAD'+ coCRLF +
            '           AND SECTOR.CVE_CORP (+)= SE.CVE_TIPO_SECTOR'+ coCRLF +
            '       )DATOS,'+ coCRLF +
            '       CR_FND_CREDITO CFC, CR_CONTRATO CCTO, CR_CB_SOL_GTIA CRSOL,'+ coCRLF +
            '       (SELECT * FROM CR_MAPEO_CLAVE WHERE CVE_GRUPO_CLAVE=''CVEMON'')MONEDA,'+ coCRLF +
            '       --GARANTÍAS'+ coCRLF +
            '       (SELECT CR_GA_DIS_GAR.ID_DISPOSICION, CR_GA_REGISTRO.ID_ACREDITADO,'+ coCRLF +
            '               CR_GA_REGISTRO.ID_SOLICITUD, CR_GA_GARANTIA.DESC_GARANTIA,'+ coCRLF +
            '               DECODE(NVL(CR_GA_NAVE_IND.ID_SOLICITUD,0),0,'+ coCRLF +
            '               DECODE(NVL(CR_GA_BI_MUEB.ID_SOLICITUD,0),0,'+ coCRLF +
            '               DECODE(NVL(CR_GA_PRENDARIAS.ID_SOLICITUD,0),0,'+ coCRLF +
            '               DECODE(NVL(CR_GA_PERSONALES.ID_SOLICITUD,0),0,'+ coCRLF +
            '               DECODE(NVL(CR_GA_CESION.ID_SOLICITUD,0),0,'+ coCRLF +
            '               DECODE(NVL(CR_GA_PAR_APOR.ID_SOLICITUD,0),0,'+ coCRLF +
            '               DECODE(NVL(CR_GA_SIN_CLAS.ID_SOLICITUD,0),0,'+ coCRLF +
            '               DECODE(NVL(CR_GA_BI_INMUEB.ID_SOLICITUD,0),0,'+ coCRLF +
            '               DECODE(NVL(CR_GA_DOC_COB.ID_SOLICITUD,0),0,'' '','+ coCRLF +
            '               ''DOCUMENTOS POR COBRAR''),''BIEN INMUEBLE''),'+ coCRLF +
            '               ''SIN CLASIFICACION''),''PARTICIPACIONES/APORTACIONES FEDERALES''),'+ coCRLF +
            '               ''CESION''),''PERSONALES''),''PENDARIAS''),'+ coCRLF +
            '               ''BIEN MUEBLE''),''NAVE/UNIDAD INDUSTRIAL'')CLASIFICACION,'+ coCRLF +
            '               NVL(CR_GA_DIS_GAR.IMP_GARANTIA,0)IMP_GARANTIA,'+ coCRLF +
            '               CR_GA_DIS_GAR.ID_REL_DIS_GAR, GAR.CVE_CLAVE, GPO.VALOR'+ coCRLF +
            '          FROM CR_GA_REGISTRO, CR_GA_BI_INMUEB, CR_GA_BI_MUEB,'+ coCRLF +
            '               CR_GA_PRENDARIAS, CR_GA_PERSONALES, CR_GA_CESION,'+ coCRLF +
            '               CR_GA_PAR_APOR, CR_GA_SIN_CLAS, CR_GA_GARANTIA,'+ coCRLF +
            '               CR_GA_DIS_GAR, CR_GA_DOC_COB, CR_GA_NAVE_IND,'+ coCRLF +
            '               (SELECT * FROM CR_MAPEO_CLAVE WHERE CVE_GRUPO_CLAVE=''CVGTIA'')GAR,'+ coCRLF +
            '               CR_GRUPO_CLAVE GPO'+ coCRLF +
            '         WHERE CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_BI_INMUEB.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_BI_MUEB.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PRENDARIAS.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PERSONALES.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_CESION.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PAR_APOR.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_SIN_CLAS.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_DOC_COB.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_NAVE_IND.ID_SOLICITUD(+)'+ coCRLF +
            '           AND CR_GA_REGISTRO.CVE_GARANTIA = CR_GA_GARANTIA.CVE_GARANTIA'+ coCRLF +
            '           AND CR_GA_REGISTRO.SIT_REG_GARANTIA=''AC'''+ coCRLF +
            '           AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_DIS_GAR.ID_REG_SOL_GAR'+ coCRLF +
            '           AND GAR.CVE_CORP (+)= CR_GA_REGISTRO.CVE_GARANTIA'+ coCRLF +
            '           AND GPO.CVE_REFERENCIA (+)= GAR.CVE_CLAVE'+ coCRLF +
            '           AND GPO.CVE_GRUPO_CLAVE (+)= GAR.CVE_GRUPO_CLAVE'+ coCRLF +
            '         ORDER BY CR_GA_DIS_GAR.ID_REL_DIS_GAR, CR_GA_DIS_GAR.ID_DISPOSICION'+ coCRLF +
            '       )GARANT'+ coCRLF +
            ' WHERE DATOS.ID_CONTRATO = CC.ID_CONTRATO'  + coCRLF +
            '   AND CFC.ID_CREDITO (+)= CC.ID_CREDITO'   + coCRLF +
            '   AND CFC.PCT_REDESCONTADO (+) > 0'        + coCRLF +  // LOLS 03 MAR 2006 // CORRECCION SOLICITA FONDEO
            '   AND CCTO.ID_CONTRATO = CC.ID_CONTRATO'   + coCRLF +
            '   AND CCTO.FOL_CONTRATO = CC.FOL_CONTRATO' + coCRLF +
            '   AND CRSOL.ID_CREDITO = CC.ID_CREDITO'    + coCRLF +
            // SOLO REGISTROS ACTIVOS
            '   AND CRSOL.SIT_SOL_GTIA = ''AC'' '+ coCRLF +
            '   AND MONEDA.CVE_CORP= CCTO.CVE_MONEDA'+ coCRLF +
            '   AND GARANT.ID_DISPOSICION (+)= CRSOL.ID_CREDITO'+ coCRLF +
            //'   AND GARANT.ID_ACREDITADO = DATOS.ID_TITULAR'+ coCRLF +
            //<LOLS 20 ABR 2006>
            '   AND CC.F_INICIO <= ' + SQLFecha( Objeto.F_CORTE.AsDateTime ) + coCRLF +
            //</LOLS>
            //
            'UNION ALL'+ coCRLF +
            'SELECT 1 AS GRUPO,PP.ID_CREDITO,PP.ID_SOLICITUD, '' '', '' '', '' '', '' '', '' '', '' '', '' '','+ coCRLF +
            '       '' '', '' '', '' '', PP.ID_CREDITO, '' '', ''S'', ''S'' , 0,'+ coCRLF +
            '	     0, 0, 0, 0, '' '', 0, TRIM(TO_CHAR(SYSDATE,''YYYYMMDD'')) ,'+ coCRLF +
            '       0,  '' '', 0, 0 , 0,  '' '',  '' '', '' '', '' '', '' '','+ coCRLF +
            '       0, '' '', 0, PP.CVE_PROPOSITO, '' '', '' '', 0,'+ coCRLF +
            '	   '' '', TRIM(TO_CHAR(0,''000'')),TRIM(TO_CHAR(0,''000'')),TRIM(TO_CHAR(0,''000''))'+ coCRLF +
            '  FROM CR_CB_PRO_PROY PP, CR_CB_SOL_GTIA CRSOL'+ coCRLF +
            // <LOLS 20 ABR 2006>
            '       , CR_CREDITO CC ' + coCRLF +
            // </LOLS>
            ' WHERE CRSOL.ID_CREDITO = PP.ID_CREDITO'+ coCRLF +
            '   AND CRSOL.ID_SOLICITUD = PP.ID_SOLICITUD'+ coCRLF +
            '   AND CRSOL.SIT_SOL_GTIA = ''AC'''+ coCRLF +
            //<LOLS 20 ABR 2006>
            '   AND CC.F_INICIO <= ' + SQLFecha( Objeto.F_CORTE.AsDateTime ) + coCRLF +
            '   AND CRSOL.ID_CREDITO = CC.ID_CREDITO ' + coCRLF +
            //</LOLS>
            'UNION ALL'+ coCRLF +
            'SELECT 2 AS GRUPO, DES.ID_CREDITO, DES.ID_SOLICITUD, '' '', '' '', '' '', '' '', '' '', '' '', '' '','+ coCRLF +
            '       '' '', '' '', '' '', DES.ID_CREDITO, '' '', ''S'', ''S'' , 0,'+ coCRLF +
            '	     0, 0, 0, 0, '' '', 0, TRIM(TO_CHAR(SYSDATE,''YYYYMMDD'')) ,'+ coCRLF +
            '       0,  '' '', 0, 0 , 0,  '' '',  '' '', '' '', '' '', '' '','+ coCRLF +
            '       0, '' '', 0, '' '', '' '', '' '', 0,'+ coCRLF +
            '	     DES.CVE_DESTINO, TRIM(TO_CHAR(DES.PCT_PARCIAL,''000'')) AS PCT_PARCIAL,'+ coCRLF +
            '       TRIM(TO_CHAR(DES.PCT_ORIGEN_NAL,''000'')) AS PCT_ORIGEN_NAL,'+ coCRLF +
            '       TRIM(TO_CHAR(DES.PCT_IMPORTACION,''000'')) AS PCT_IMPORTACION'+ coCRLF +
            '  FROM CR_CB_DESTINO DES, CR_CB_SOL_GTIA CRSOL'+ coCRLF +
            // <LOLS 20 ABR 2006>
            '       , CR_CREDITO CC ' + coCRLF +
            // </LOLS>
            ' WHERE CRSOL.ID_CREDITO = DES.ID_CREDITO'+ coCRLF +
            '   AND CRSOL.ID_SOLICITUD = DES.ID_SOLICITUD'+ coCRLF +
            '   AND CRSOL.SIT_SOL_GTIA = ''AC'''+ coCRLF +
            //<LOLS 20 ABR 2006>
            '   AND CC.F_INICIO <= ' + SQLFecha( Objeto.F_CORTE.AsDateTime ) + coCRLF +
            '   AND CRSOL.ID_CREDITO = CC.ID_CREDITO ' + coCRLF +
            //</LOLS>
            ')'+ coCRLF +
            'ORDER BY CVE_FINAN, ID_SOLICITUD, GRUPO, CVE_PROPOSITO, CVE_DESTINO';

   End Else If TipoArchivo = coANEXO2 Then Begin
       sSQLCred := '';
       IF Objeto.B_PAGO_COM_ANUAL.AsString = 'V' then
         sSQLCred := ' AND CAR.ID_CREDITO = ' + Objeto.ID_CREDITO.AsString;
       //
      sSQL:=' SELECT CAR.F_CORTE, CAR.FOLIO_CORTE, NAF.CVE_INTER_FINAN, ' + coCRLF +
            '        CAR.ID_CREDITO, ' + coCRLF +
            '        TRIM(TO_CHAR(CAR.F_INICIO,''YYYYMMDD'')) || ' + coCRLF +
//NOVIEMBRE  2010   DESARROLLO -  SE CAMBIA LA FUENTE DEL DATO, DE FECHA VENCIMIENTO A FECHA LIQUIDACIÓN
//            '        TRIM(TO_CHAR(CAR.F_VENCIMIENTO,''YYYYMMDD'')) || ' + coCRLF +
//            '        TRIM(TO_CHAR(F_LIQUIDACION,''YYYYMMDD'')) || ' + coCRLF +
// </ RABA > AGOSTO 2011
//   se elimina esta línea de codigo ya que se debe consideran la fecha de liquidación menor al corte de lo contrario no debe tomar la fecha de liquidación
//            '        decode(CRE.SIT_CREDITO, ''LQ'',TRIM(TO_CHAR(F_LIQUIDACION,''YYYYMMDD'')),TRIM(TO_CHAR(CAR.F_VENCIMIENTO,''YYYYMMDD''))) || ' + coCRLF
// < RABA />
//FIN NOV 2010
// </ RABA > AGOSTO 2011
	    '	(case when (CRE.SIT_CREDITO=''LQ'' and CAR.F_VAL_LIQUIDA is not null) THEN TRIM(TO_CHAR(CAR.F_VAL_LIQUIDA,''YYYYMMDD'')) ' +  coCRLF +
	    '	      else TRIM(TO_CHAR(CAR.F_VENCIMIENTO,''YYYYMMDD'')) end) || ' + coCRLF +
// < RABA />
            '        TRIM(TO_CHAR(CAR.SDO_INSOLUTO,''00000000000000.00'')) AS MOVIMIENTOS, ' + coCRLF +
            '        A.IMP_COMISION, A.IMP_IVA_COMISION, ' + coCRLF +
            '        (A.IMP_COMISION+ A.IMP_IVA_COMISION) AS TOTAL, ' + coCRLF +
            '        NVL( PKGCRCREDITOO1.FUNOBTSDOCORTEANX2( CAR.F_CORTE, CAR.ID_CREDITO ), 0 ) AS SDO_ACRED, ' + coCRLF +
            //'        NVL( ( SELECT SDO_VIG_TOTAL + IMP_CAPITAL_VDO + IMP_VDO_FINAN_A ' + coCRLF +
            //'               FROM CR_HISTO_CRED WHERE ID_CREDITO = CAR.ID_CREDITO AND F_CIERRE = CAR.F_CORTE ), 0 ) AS SDO_ACRED, ' + coCRLF +
            '        0 AS MORA, ' + coCRLF +
// </ RABA > AGOSTO 2011
//            '        decode(CRE.SIT_CREDITO, ''LQ'', ''1'', ''CA'', ''2'','''') as STAGAR, ' + coCRLF +
            '   (case when CRE.SIT_CREDITO=''LQ'' and CAR.F_VAL_LIQUIDA is not null and CAR.F_VAL_LIQUIDA<='+ SQLFecha( Objeto.F_CORTE.AsDateTime ) + ' and CRE.ID_CRE_RENUEVA IS NULL then ''1'' ' + coCRLF +
            '         when CRE.SIT_CREDITO=''LQ'' and CAR.F_VAL_LIQUIDA is not null and CAR.F_VAL_LIQUIDA<='+ SQLFecha( Objeto.F_CORTE.AsDateTime ) + ' and CRE.ID_CRE_RENUEVA IS NOT NULL then ''2'' ' + coCRLF +
            '             else '''' end) as STAGAR, ' + coCRLF +
// < RABA />
//NOVIEMBRE  2010   DESARROLLO -  SE CAMBIA EL FORMATO A AAAAMMDD
//            '        nvl(to_char(f_liquidacion,''dd/mm/yyyy''),'''') as F_LIQUIDACION ' + coCRLF +
// </ RABA > AGOSTO 2011
//            '        nvl(to_char(f_liquidacion,''YYYYMMDD''),'''') as F_LIQUIDACION ' + coCRLF +
	    '	(case when CRE.SIT_CREDITO=''LQ'' and CAR.F_VAL_LIQUIDA is not null and CAR.F_VAL_LIQUIDA<='+ SQLFecha( Objeto.F_CORTE.AsDateTime ) + ' then to_char(CAR.F_VAL_LIQUIDA,''YYYYMMDD'') ' + coCRLF +
	    '	 else '''' end) as F_LIQUIDACION ' + coCRLF +
// < RABA />
//FIN NOV 2010
            ' FROM CR_CB_SDO_CARTRA CAR, CR_CB_SOL_GTIA NAF, ' + coCRLF +
            ' (SELECT ID_CREDITO, '                            + coCRLF +
            '         SUM(IMP_COMISION) IMP_COMISION, '        + coCRLF +
            '         SUM(IMP_IVA_COMISION) IMP_IVA_COMISION ' + coCRLF +
            '  FROM   CR_CB_SDO_CARTRA ' + coCRLF +
            '  WHERE  F_CORTE = ' + SQLFecha( Objeto.F_CORTE.AsDateTime ) + coCRLF +
//            '    AND SIT_SDO_CARTRA= ''AC'' ' + coCRLF +
            '  GROUP BY ID_CREDITO ' + coCRLF +
            ' )A, ' + coCRLF +
            ' CR_CREDITO CRE ' + coCRLF +
            ' WHERE CAR.F_CORTE        = ' + SQLFecha( Objeto.F_CORTE.AsDateTime ) + coCRLF +
                 sSQLCred                                      + coCRLF +
            '   AND NAF.SIT_SOL_GTIA   = ''EN'' '              + coCRLF +
            '   AND CAR.SIT_SDO_CARTRA = ''EP'' '              + coCRLF +
            '   AND NAF.ID_CREDITO     = CAR.ID_CREDITO '      + coCRLF +
            '   AND A.ID_CREDITO       = CAR.ID_CREDITO '      + coCRLF +
            '   and	CAR.ID_CREDITO     = CRE.ID_CREDITO '      + coCRLF +
            ' ORDER BY CAR.ID_CREDITO, CAR.F_VENCIMIENTO ';
            //
   End Else If TipoArchivo = coRPAGAN Then Begin
   sSQL:= ' SELECT PAG.ID_SOLICITUD, ' + SQLFecha( Objeto.Apli.DameFechaEmpresa ) + ' AS F_HOY,'+ coCRLF +
          '        ' + SQLFecha(Objeto.F_CORTE.AsDateTime) + ' AS F_REPORTE,'+ coCRLF +
          '        (SELECT NOMBRE FROM PERSONA WHERE ID_PERSONA ='+ IntToStr(Objeto.Apli.IdEmpresa)+' ) AS BANCO,'+ coCRLF +
          '        PAG.CVE_BASE_OP, PAG.CVE_SUCURSAL, PAG.CVE_SUB_APLIC,'+ coCRLF +
          '        CC.ID_CRED_EXTERNO AS PRESTAMO,'+ coCRLF +
          '        TIT.NOMBRE AS ACREDITADO,'+ coCRLF +
          '        (CC.F_VENCIMIENTO - CC.DIAS_PLAZO) AS F_INICIO,'+ coCRLF +
          '        CC.F_VENCIMIENTO, NVL(CC.SDO_INSOLUTO,0)AS SDO_INSOLUTO, '+ coCRLF +
          '        INTER.F_PAGO,'+ coCRLF +
          '        NVL(INTER.TASA_APLICADA,0)AS TASA_APLICADA, '+ coCRLF +
          '        NVL(CC.SDO_VIG_TOTAL,0)AS SDO_VIG_TOTAL, '+ coCRLF +
          '        NVL(CAPITAL.IMP_CAPITAL,0)AS IMP_CAPITAL, '+ coCRLF +
          '        INTER.PLAZO AS DIAS, '+ coCRLF +
          '        NVL(INTER.IMP_INTERES,0)AS IMP_INTERES, NVL(INTER.IMP_INTERES,0)AS TOT_IMP_INT,'+ coCRLF +
          '        NVL(COMIS.IMP_COMISION,0)AS IMP_COMISION, NVL(COMIS.IMP_IVACOM,0)AS IMP_IVACOM, '+ coCRLF +
          {
          '        (NVL(CC.SDO_VIG_TOTAL,0) + NVL(INTER.IMP_INTERES,0) + '          + coCRLF +
          '        NVL(COMIS.IMP_COMISION,0) + NVL(COMIS.IMP_IVACOM,0)) AS TOTAL, ' + coCRLF +
          }
          '        (NVL(CAPITAL.IMP_CAPITAL,0) + NVL(INTER.IMP_INTERES,0) + '          + coCRLF +
          '        NVL(COMIS.IMP_COMISION,0) + NVL(COMIS.IMP_IVACOM,0)) AS TOTAL, ' + coCRLF +
          '        PAG.CVE_MOTIVO_LIQ '+ coCRLF+
          //<LOLS 25 MAY 2006. PREPAGOS>
          '        , ( SELECT VALOR '          + coCRLF +
          '            FROM   CR_GRUPO_CLAVE ' + coCRLF +
          '            WHERE  CVE_GRUPO_CLAVE = ''CPPAML''  '        + coCRLF +
          '              AND  CVE_REFERENCIA  = PAG.CVE_MOTIVO_LIQ ' + coCRLF +
          '          )DESC_MOTIVO_LIQ '        + coCRLF +
          //</LOLS>
          '   FROM CR_CB_PAGO_ANT PAG, CR_CREDITO CC, CONTRATO CTO, PERSONA TIT,'+ coCRLF +
          '        (SELECT ID_SOLICITUD, ID_CREDITO, SUM(IMP_ADEUDO) AS IMP_CAPITAL'+ coCRLF +
          '           FROM CR_CB_DET_ADEUDO '+ coCRLF +
          '          WHERE CVE_TIPO_SOL = ''PAGANT'''+ coCRLF +
          '            AND CVE_ACCESORIO =''CP'''+ coCRLF +
          '          GROUP BY ID_SOLICITUD, ID_CREDITO) CAPITAL,'+ coCRLF +
          '        (SELECT ID_SOLICITUD, ID_CREDITO, F_PROG_PAGO AS F_PAGO,'+ coCRLF +
          '                TASA_APLICADA, PLAZO, '+ coCRLF +
          '                SUM(IMP_ADEUDO)AS IMP_INTERES '+ coCRLF +
          '           FROM CR_CB_DET_ADEUDO '+ coCRLF +
          '          WHERE CVE_TIPO_SOL = ''PAGANT'''+ coCRLF +
          '            AND CVE_ACCESORIO =''IN'''+ coCRLF +
          '          GROUP BY ID_SOLICITUD, ID_CREDITO, F_PROG_PAGO,TASA_APLICADA, PLAZO )INTER,'+ coCRLF +
          '        (SELECT ID_CREDITO, SUM(IMP_COMISION) AS IMP_COMISION,'+ coCRLF +
          '                SUM(IMP_IVA) AS IMP_IVACOM '+ coCRLF +
          '           FROM CR_FND_COMISION'+ coCRLF +
          '          WHERE ' + SQLFecha(Objeto.F_CORTE.AsDateTime) + ' BETWEEN F_ALTA AND F_VENCIMIENTO'+ coCRLF +
          '            AND ' + SQLFecha(Objeto.F_CORTE.AsDateTime) + ' BETWEEN F_ALTA AND F_PROG_PAGO'  + coCRLF +
          '            AND SIT_COMISION NOT IN (''LQ'',''CA'')'+ coCRLF +
          '          GROUP BY ID_CREDITO) COMIS'+ coCRLF +
          '  WHERE PAG.ID_CREDITO = CC.ID_CREDITO '+ coCRLF +
          '    AND PAG.SIT_PAGO_ANT=''AC'''+ coCRLF;
      If Objeto.ID_CREDITO.AsInteger > 0 Then
         sSQL:= sSQL + '    AND PAG.ID_CREDITO ='+ Objeto.ID_CREDITO.AsString + coCRLF;

      sSQL:= sSQL +
          '    AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+ coCRLF +
          '    AND TIT.ID_PERSONA = CTO.ID_TITULAR'+ coCRLF;

      If Objeto.ID_ACREDITADO.AsInteger > 0 Then
         sSQL:= sSQL +
            '	 AND CTO.ID_TITULAR ='+  Objeto.ID_ACREDITADO.AsString + coCRLF;

      sSQL:= sSQL +
          '    AND CAPITAL.ID_CREDITO (+)= PAG.ID_CREDITO'+ coCRLF +
          '    AND CAPITAL.ID_SOLICITUD (+)= PAG.ID_SOLICITUD'+ coCRLF +
          '    AND INTER.ID_CREDITO (+)= PAG.ID_CREDITO'+ coCRLF +
          '    AND INTER.ID_SOLICITUD (+)= PAG.ID_SOLICITUD'+ coCRLF +
          ' 	AND COMIS.ID_CREDITO (+)= CC.ID_CREDITO'+ coCRLF +
          ' 	AND CTO.ID_EMPRESA = '+ IntToStr(Objeto.Apli.IdEmpresa) + coCRLF;

   End Else If TipoArchivo = coANEXO3 Then Begin
      sSQL:='SELECT CACR.ID_ACREDITADO, SCR.ID_CREDITO, SCR.ANIO_MES,'+ coCRLF +
            //<LOLS 27FEB2006  CALIFICACION DE LA CARTERA>
            '       IFIN.ID_INTERMEDIARIO,'                             + coCRLF +
            FormatFloat('0000', Objeto.ANIO.AsInteger) + ' ANIO_CALIF,' + coCRLF +
            FormatFloat('00',   Objeto.MES.AsInteger ) + ' MES_CALIF,'  + coCRLF +
            //</LOLS 27FEB2006>
            '       RFC.SIGLAS_RFC||RFC.F_RFC||RFC.HOMOCLAVE_RFC AS RFC,'+ coCRLF +
            '       TIT.NOMBRE, (SCR.IMP_EXPUESTO + SCR.IMP_CUBIERTO) AS SDO_TRIMESTRE,'+ coCRLF +
            '       NVL(PKGCRDOCUMENTACION.OBTEQUIVOPERATIVA( SCR.ID_CREDITO,3 ),0)  AS PCT_GARANTIZADO,'+ coCRLF +
            //<LOLS 27FEB2006  CALIFICACION DE LA CARTERA>
            {
            '       DECODE( NVL(CACR.CVE_CAL_ACRED,''PM''), ''NA'', ''PM'', NVL(CACR.CVE_CAL_ACRED,''PM'') ) AS CVE_CAL_ACRED, ' + coCRLF +
            '       DECODE( SCR.CVE_CALIFIC_CUB, ''NA'', ''PM'', SCR.CVE_CALIFIC_CUB ) CVE_CALIFIC_CUB, ' + coCRLF +
            '       DECODE( SCR.CVE_CALIFIC_EXP, ''NA'', ''PM'', SCR.CVE_CALIFIC_EXP ) CVE_CALIFIC_EXP, '  + coCRLF +
            }
            '       CALCRED.CVE_REFERENCIA AS CVE_CAL_ACRED, '    + coCRLF +
            '       CALCUB.CVE_REFERENCIA  AS CVE_CALIFIC_CUB, '  + coCRLF +
            //'       CALEXP.CVE_REFERENCIA  AS CVE_CALIFIC_EXP, '  + coCRLF + //<LOLS 10 MAR 2006. MODIFICACION DE ACUERDO A OBSERVACIONES DE CRISTINA DIAZ>
            '       DECODE( SCR.IMP_RESERVA_EXP, 0, ''SC'', CALEXP.CVE_REFERENCIA ) AS CVE_CALIFIC_EXP, '  + coCRLF + //<LOLS 10 MAR 2006. MODIFICACION DE ACUERDO A OBSERVACIONES DE CRISTINA DIAZ>
            //</LOLS>
            '       ROUND( ((SCR.IMP_RESERVA_CUB/TO_NUMBER(DECODE(SCR.IMP_CUBIERTO,0,1,SCR.IMP_CUBIERTO)) )*100), 2 ) AS RES_SDO_CUB,'+ coCRLF +
            '       ROUND( ((SCR.IMP_RESERVA_EXP/TO_NUMBER(DECODE(SCR.IMP_EXPUESTO,0,1,SCR.IMP_EXPUESTO)) )*100), 2 ) AS RES_SDO_EXP,'+ coCRLF +
            '       SCR.IMP_RESERVA_CUB, SCR.IMP_RESERVA_EXP, (SCR.IMP_RESERVA_CUB + SCR.IMP_RESERVA_EXP)AS TOTAL'+ coCRLF +
            '  FROM CR_CREDITO CR, CR_CB_SOL_GTIA CGTIA, CONTRATO CTO, '            + coCRLF +
            '       PERSONA TIT, RFC, ' + coCRLF +
            //<LOLS 27FEB2006  CALIFICACION DE LA CARTERA>
            '       (SELECT VALOR ID_INTERMEDIARIO '             + coCRLF +
            '        FROM CR_GRUPO_CLAVE '                       + coCRLF +
            '        WHERE CVE_GRUPO_CLAVE = ''SOGTNF'' '        + coCRLF +
            '          AND CVE_REFERENCIA = ''SGCVIN'') IFIN,'   + coCRLF +
            '       (SELECT MC.CVE_CORP, GC.CVE_REFERENCIA '     + coCRLF +
            '        FROM   CR_GRUPO_CLAVE GC, CR_MAPEO_CLAVE MC '     + coCRLF +
            '        WHERE  GC.CVE_GRUPO_CLAVE  = ''CCACRE'' '         + coCRLF +
            '          AND  MC.CVE_GRUPO_CLAVE  = GC.CVE_GRUPO_CLAVE ' + coCRLF +
            '          AND  MC.CVE_CLAVE        = GC.CVE_REFERENCIA '  + coCRLF +
            '       )CALCRED, '                                        + coCRLF +
            '       (SELECT MC.CVE_CORP, GC.CVE_REFERENCIA '           + coCRLF +
            '        FROM   CR_GRUPO_CLAVE GC, CR_MAPEO_CLAVE MC '     + coCRLF +
            '        WHERE  GC.CVE_GRUPO_CLAVE  = ''CCCUBI'' '         + coCRLF +
            '          AND  MC.CVE_GRUPO_CLAVE  = GC.CVE_GRUPO_CLAVE ' + coCRLF +
            '          AND  MC.CVE_CLAVE        = GC.CVE_REFERENCIA '  + coCRLF +
            '       )CALCUB, '                                         + coCRLF +
            '       (SELECT MC.CVE_CORP, GC.CVE_REFERENCIA '           + coCRLF +
            '        FROM   CR_GRUPO_CLAVE GC, CR_MAPEO_CLAVE MC '     + coCRLF +
            '        WHERE  GC.CVE_GRUPO_CLAVE  = ''CCEXPU'' '         + coCRLF +
            '          AND  MC.CVE_GRUPO_CLAVE  = GC.CVE_GRUPO_CLAVE ' + coCRLF +
            '          AND  MC.CVE_CLAVE        = GC.CVE_REFERENCIA '  + coCRLF +
            '       )CALEXP, '                                         + coCRLF +
            //</LOLS 27FEB2006>
            '       CR_SICC_CAL_ACRE CACR, CR_SICC_CAL_CRED SCR' + coCRLF +

            ' WHERE CGTIA.SIT_SOL_GTIA = ''EN'' '        + coCRLF +
            '   AND CGTIA.ID_CREDITO   = CR.ID_CREDITO ' + coCRLF +
            '   AND CR.ID_CONTRATO = CTO.ID_CONTRATO'    + coCRLF +
            '   AND CTO.ID_TITULAR = TIT.ID_PERSONA'     + coCRLF +
            '   AND TIT.ID_PERSONA = RFC.ID_PERSONA'     + coCRLF +
            '   AND SCR.ANIO_MES = '''+ FormatFloat('0000',Objeto.ANIO.AsInteger) +
                                        FormatFloat('00',Objeto.MES.AsInteger)    + '''' + coCRLF +
            '   AND SCR.ANIO_MES       = CACR.ANIO_MES'       + coCRLF +
            '   AND SCR.F_MIGRACION    = CACR.F_MIGRACION'    + coCRLF +
            '   AND CACR.ID_ACREDITADO = CTO.ID_TITULAR'      + coCRLF +
            '   AND CACR.SIT_SICC_CAL_ACR = ''AC'' '          + coCRLF +
            '   AND SCR.SIT_SICC_CAL_CRE  = ''AC'' '          + coCRLF +
            '   AND SCR.ID_CREDITO = CR.ID_CREDITO '          + coCRLF +
            '   AND CALCRED.CVE_CORP(+) = NVL( CACR.CVE_CAL_ACRED,  ''NULL'') ' + coCRLF +
            '   AND CALCUB.CVE_CORP (+) = NVL( SCR.CVE_CALIFIC_CUB, ''NULL'') ' + coCRLF +
            '   AND CALEXP.CVE_CORP (+) = NVL( SCR.CVE_CALIFIC_EXP, ''NULL'') '
            ;
      //
      If Objeto.ID_CREDITO.AsInteger > 0 Then
         sSQL:= sSQL +
            '	 AND SCR.ID_CREDITO ='+  Objeto.ID_CREDITO.AsString + coCRLF;
      //
      If Objeto.ID_ACREDITADO.AsInteger > 0 Then
         sSQL:= sSQL +
            '	 AND CTO.ID_TITULAR ='+  Objeto.ID_ACREDITADO.AsString + coCRLF;
      //

      //<LOLS 26 ABR 2006. QUERY DE VALIDACION>
      //sSQL:= sSQL + ' ORDER BY SCR.ID_CREDITO, CACR.ID_ACREDITADO'+ coCRLF;

      sAnioMes := SQLStr( FormatFloat('00',   Objeto.MES.AsInteger  )  + '/' +
                          FormatFloat('0000', Objeto.ANIO.AsInteger ) );

{     // <SATV4766 28Oct2008 comenta este query,  siendo este el original creado por LOLS
      sSQL:= 'SELECT B.ID_CREDITO_CTRL, A.* FROM ( ' +  coCRLF + sSQL + ' )A,' + coCRLF +
             '       ('                                                        + coCRLF +
             '        SELECT C.ID_CREDITO ID_CREDITO_CTRL,'                    + coCRLF +
             '               C.F_INICIO,'                                      + coCRLF +
             '               C.F_VENCIMIENTO,'                                 + coCRLF +
             '               C.F_LIQUIDACION,'                                 + coCRLF +
             '               C.SIT_CREDITO'                                    + coCRLF +
             '        FROM   CR_CREDITO C, CR_CB_SOL_GTIA SG'                  + coCRLF +
             '        WHERE  C.ID_CREDITO = SG.ID_CREDITO'                     + coCRLF +
             '          AND  SG.SIT_SOL_GTIA = ''EN'' '                        + coCRLF +
             '          AND  C.F_INICIO <= LAST_DAY( TO_DATE( ' + sAnioMes + ', ''MM/YYYY'' ) )'           + coCRLF +
             '          AND  ( ( C.SIT_CREDITO  = ''AC'' ) OR'                 + coCRLF +
             '                 (  C.SIT_CREDITO = ''LQ'' AND '                 + coCRLF +
             '                    C.F_LIQUIDACION > LAST_DAY( TO_DATE( ' + sAnioMes +', ''MM/YYYY'' ) ) )' + coCRLF +
             '               )'                                                + coCRLF +
             '       )B'                                                       + coCRLF +
             'WHERE B.ID_CREDITO_CTRL = A.ID_CREDITO(+)'                       + coCRLF +
             'ORDER BY A.ID_CREDITO, A.ID_ACREDITADO ';
}
      //<LOLS>

      // <SATV4766 28Oct2008>
      // Se cambia el query con la finalidad de que obtenga únicamente las disposiciones que tengan Responsabilidad
      // a la fecha de corte solicitada
      sSQL:= 'SELECT B.ID_CREDITO_CTRL, A.* FROM ( ' +  coCRLF + sSQL + ' )A,' + coCRLF +
             '       ('                                                        + coCRLF +
             '         SELECT C.ID_CREDITO ID_CREDITO_CTRL,'+coCRLF+
             '                C.F_INICIO,'+coCRLF+
             '                C.F_VENCIMIENTO,'+coCRLF+
             '                C.F_LIQUIDACION,'+coCRLF+
             '                C.SIT_CREDITO'+coCRLF+
             '         FROM   CR_CREDITO C,'+coCRLF+
             '                CR_CB_SOL_GTIA SG,'+coCRLF+
             '                ( -- 28Oct2008 Se buscan únicamente aquellas disposiciones que tengan Responsabilidad'+coCRLF+
             '                  SELECT CCAS.ID_CREDITO'+coCRLF+
             '                  FROM CR_CON_ADEUDO_SDO CCAS'+coCRLF+
             '                  WHERE CCAS.F_CIERRE = LAST_DAY(TO_DATE( ' + sAnioMes + ', ''MM/YYYY'' ))'+ coCRLF +
             '                    AND ( ( CCAS.IMP_CAP_VIG + CCAS.IMP_CAP_IMP + CCAS.IMP_CAP_VDO_EX + CCAS.IMP_CAP_VDO_NE +'+coCRLF+
             '                            CCAS.IMP_INT_VIG + CCAS.IMP_INT_IMP + CCAS.IMP_INT_VDO_EX + CCAS.IMP_INT_VDO_NE ) <> 0 )'+coCRLF+
             '                ) CCAS'+coCRLF+
             '         WHERE  C.ID_CREDITO = CCAS.ID_CREDITO'+coCRLF+
             '           AND  C.ID_CREDITO = SG.ID_CREDITO'+coCRLF+
             '           AND  SG.SIT_SOL_GTIA = ''EN'''+coCRLF+
             '       )B'                                                       + coCRLF +
             'WHERE B.ID_CREDITO_CTRL = A.ID_CREDITO(+)'                       + coCRLF +
             'ORDER BY A.ID_CREDITO, A.ID_ACREDITADO ';
      // </SATV4766 28Oct2008>

   End;
   Result:= sSQL;
End;
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
Function TwMGenArch.CompruebaDatos(iIdCredito, iIdSolicitud: Integer): Boolean;
Var sSQL     : String;
    qyQuery  : TQuery;
Begin
  Result := True;
  sSQL   := 'SELECT CR_GA_DIS_GAR.ID_DISPOSICION, CR_GA_REGISTRO.ID_ACREDITADO,'+ coCRLF +
            '       CR_GA_REGISTRO.ID_SOLICITUD, CR_GA_GARANTIA.DESC_GARANTIA,'+ coCRLF +
            '       DECODE(NVL(CR_GA_NAVE_IND.ID_SOLICITUD,0),0,'+ coCRLF +
            '       DECODE(NVL(CR_GA_BI_MUEB.ID_SOLICITUD,0),0,'+ coCRLF +
            '       DECODE(NVL(CR_GA_PRENDARIAS.ID_SOLICITUD,0),0,'+ coCRLF +
            '       DECODE(NVL(CR_GA_PERSONALES.ID_SOLICITUD,0),0,'+ coCRLF +
            '       DECODE(NVL(CR_GA_CESION.ID_SOLICITUD,0),0,'+ coCRLF +
            '       DECODE(NVL(CR_GA_PAR_APOR.ID_SOLICITUD,0),0,'+ coCRLF +
            '       DECODE(NVL(CR_GA_SIN_CLAS.ID_SOLICITUD,0),0,'+ coCRLF +
            '       DECODE(NVL(CR_GA_BI_INMUEB.ID_SOLICITUD,0),0,'+ coCRLF +
            '       DECODE(NVL(CR_GA_DOC_COB.ID_SOLICITUD,0),0,'' '','+ coCRLF +
            '       ''DOCUMENTOS POR COBRAR''),''BIEN INMUEBLE''),'+ coCRLF +
            '       ''SIN CLASIFICACION''),''PARTICIPACIONES/APORTACIONES FEDERALES''),'+ coCRLF +
            '       ''CESION''),''PERSONALES''),''PENDARIAS''),'+ coCRLF +
            '       ''BIEN MUEBLE''),''NAVE/UNIDAD INDUSTRIAL'')CLASIFICACION,'+ coCRLF +
            '       NVL(CR_GA_DIS_GAR.IMP_GARANTIA,0)IMP_GARANTIA,'+ coCRLF +
            '       CR_GA_DIS_GAR.ID_REL_DIS_GAR, GAR.CVE_CLAVE, GPO.VALOR,'+ coCRLF +
            '       CR_GA_GARANTIA.CVE_GARANTIA '+ coCRLF +
            'FROM   CR_GA_REGISTRO, CR_GA_BI_INMUEB, CR_GA_BI_MUEB,'+ coCRLF +
            '       CR_GA_PRENDARIAS, CR_GA_PERSONALES, CR_GA_CESION,'+ coCRLF +
            '       CR_GA_PAR_APOR, CR_GA_SIN_CLAS, CR_GA_GARANTIA,'+ coCRLF +
            '       CR_GA_DIS_GAR, CR_GA_DOC_COB, CR_GA_NAVE_IND,'+ coCRLF +
            '       (SELECT * FROM CR_MAPEO_CLAVE WHERE CVE_GRUPO_CLAVE=''CVGTIA'')GAR,'+ coCRLF +
            '       CR_GRUPO_CLAVE GPO'+ coCRLF +
            'WHERE  CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_BI_INMUEB.ID_SOLICITUD(+)'+ coCRLF +
            '  AND  CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_BI_MUEB.ID_SOLICITUD(+)'+ coCRLF +
            '  AND  CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PRENDARIAS.ID_SOLICITUD(+)'+ coCRLF +
            '  AND  CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PERSONALES.ID_SOLICITUD(+)'+ coCRLF +
            '  AND  CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_CESION.ID_SOLICITUD(+)'+ coCRLF +
            '  AND  CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PAR_APOR.ID_SOLICITUD(+)'+ coCRLF +
            '  AND  CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_SIN_CLAS.ID_SOLICITUD(+)'+ coCRLF +
            '  AND  CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_DOC_COB.ID_SOLICITUD(+)'+ coCRLF +
            '  AND  CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_NAVE_IND.ID_SOLICITUD(+)'+ coCRLF +
            '  AND  CR_GA_REGISTRO.CVE_GARANTIA = CR_GA_GARANTIA.CVE_GARANTIA'+ coCRLF +
            '  AND  CR_GA_REGISTRO.SIT_REG_GARANTIA=''AC'''+ coCRLF +
            '  AND  CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_DIS_GAR.ID_REG_SOL_GAR'+ coCRLF +
            '  AND  GAR.CVE_CORP (+)= CR_GA_REGISTRO.CVE_GARANTIA'+ coCRLF +
            '  AND  GPO.CVE_REFERENCIA (+)= GAR.CVE_CLAVE'+ coCRLF +
            '  AND  GPO.CVE_GRUPO_CLAVE (+)= GAR.CVE_GRUPO_CLAVE'+ coCRLF +
            '  AND  CR_GA_DIS_GAR.ID_DISPOSICION = '+ IntToStr(iIdCredito)+ coCRLF +
            'ORDER BY CR_GA_DIS_GAR.ID_REL_DIS_GAR, CR_GA_DIS_GAR.ID_DISPOSICION'+ coCRLF ;
  qyQuery := GetSQLQueryNoNil( sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
  If qyQuery <> Nil Then
  Begin
    While not qyQuery.Eof Do Begin
      If (qyQuery.FieldByName('CVE_GARANTIA').AsString = '')Then Begin
        ShowMessage('No existe una Garantía');
        Result := False;
        Exit;
      End;
      If (qyQuery.FieldByName('CVE_CLAVE').AsString = '')Then Begin
        ShowMessage('No existe una clave de relación de la garantía BINTER con Nafin.' + coCRLF +
                    'Favor de relacionar las garantías para poder continuar.'          + coCRLF +
                    'Disposición: ' + qyQuery.FieldByName('ID_DISPOSICION').AsString );
        Result := False;
        Exit;
      End;
      qyQuery.Next;
    End;
    qyQuery.Free;
  End;
  //
  If Result Then Begin
    sSQL:= 'SELECT CVE_PROPOSITO FROM CR_CB_PRO_PROY WHERE ID_CREDITO = '+ IntToStr(iIdCredito)+
           '   AND ID_SOLICITUD ='+ IntToStr(iIdSolicitud);
    qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
    If qyQuery <> Nil Then Begin
       While not qyQuery.Eof Do
       Begin
            If (qyQuery.FieldByName('CVE_PROPOSITO').AsString = '')Then
            Begin
               ShowMessage('No existe un Propósito del proyecto,'+ coCRLF +
                           'por lo tanto no se asegura la integridad de los datos');
               Result := False;
               Exit;
            End;
            qyQuery.Next;
       End;
       qyQuery.Free;
    End Else Begin
        ShowMessage('No existen propósitos en la solicitud de participación en el riesgo' + coCRLF +
                    'Disposición: ' + IntToStr(iIdCredito) );
        Result := False;
        Exit;
    End;
  End;
  //
  If Result Then Begin
      sSQL:= 'SELECT CVE_DESTINO FROM CR_CB_DESTINO WHERE ID_CREDITO = '+ IntToStr(iIdCredito)+
             '   AND ID_SOLICITUD ='+ IntToStr(iIdSolicitud);
      qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      If qyQuery <> Nil Then
      Begin
         While not qyQuery.Eof Do
         Begin
            If (qyQuery.FieldByName('CVE_DESTINO').AsString = '')Then
            Begin
               ShowMessage('No existe un Destino de los recursos del proyecto,'+ coCRLF +
                           'por lo tanto no se asegura la integridad de los datos');
               Result := False;
               Exit;
            End;
            qyQuery.Next;
         End;
         qyQuery.Free;
      End;
  End Else Begin
        ShowMessage('No existen destinos en la solicitud de participación en el riesgo' + coCRLF +
                    'Disposición: ' + IntToStr(iIdCredito) );
        Result := False;
        Exit;
  End;
  //
End;
// +---------------------------------------------------------------------------+
// |                                                                           |
// |                                                                           |
// +---------------------------------------------------------------------------+
function TwMGenArch.ValidaDatosAnexo1: Boolean;
var QryAnx1 : TQuery;
    sSql    : String;
begin
  Result  := True;
  sSql := 'SELECT SG.ID_CREDITO, SG.ID_SOLICITUD, SG.CVE_CALIF_CRE ' +
          'FROM   CR_CB_SOL_GTIA SG, CR_CREDITO CR ' +
          'WHERE  SG.SIT_SOL_GTIA = ' + SQLStr('AC') +
          '  AND  CR.SIT_CREDITO IN ( ' + SQLStr('AC') + ',' + SQLStr('LQ') + ')' +
          //<LOLS 20 ABR 2006>
          '   AND CR.F_INICIO <= ' + SQLFecha( Objeto.F_CORTE.AsDateTime ) + coCRLF +
          //</LOLS>
          '  AND  SG.ID_CREDITO   = CR.ID_CREDITO';
  //
  QryAnx1 := GetSQLQuery(sSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
  If QryAnx1 <> nil then
  Begin
    QryAnx1.First;
    while not QryAnx1.Eof do
    Begin
      Result := CompruebaDatos( QryAnx1.FieldByName( 'ID_CREDITO' ).AsInteger,
                                QryAnx1.FieldByName( 'ID_SOLICITUD' ).AsInteger );
      if not Result then
        Break;
      //
      if QryAnx1.FieldByName( 'CVE_CALIF_CRE' ).AsString = '' then
      Begin
        If MessageDlg('La disposición ' + QryAnx1.FieldByName( 'ID_CREDITO' ).AsString +
                      ' no tiene asignada una calificación inicial' + #13#10 +
                      '¿Desea Continuar?', mtInformation,
                      [mbOk, mbCancel ], 0 ) = mrCancel then
        Begin
          Result := False;
          Break;
        End;
      End;
      QryAnx1.Next;
    End;
  End;
End;


{
+------------------------------------------------------------------------------+
|                                                                              |
|                                                                              |
|                  E V E N T O S   D E   L A   F O R M A                       |
|                                                                              |
|                                                                              |
+------------------------------------------------------------------------------+

}

{
+ -----------------------------------------------------------------------------+
|     <FJR> 03.02.2012      CadenaRepresentante                                |
+ -----------------------------------------------------------------------------+
}
Function TwMGenArch.CadenaRepresentante (IdCredito: Integer):String ;
Var Q: TQuery ;
    SQL, sResultado: String; //[80];
    i, l: Integer ;
Begin
{   For i:= 0 to 79 do begin
   sResultado[i] := ''
   end ; }

   sResultado:= '';
   SQL:= 'SELECT NOMBRE_REPRESENTANTE FROM CR_REPRESENTANTE '+
         'WHERE ID_REPRESENTANTE = '+
         ' (SELECT ID_REPRESENTANTE '+
         '   FROM CR_CB_SOL_GTIA '+
         '   WHERE ID_CREDITO = '+IntToStr(IdCredito)+' )' ;
   Q:= GetSQLQueryNoNil(SQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If Q <> nil Then
      Begin
      If Trim(Q.FieldByName('NOMBRE_REPRESENTANTE').AsString)<>'' Then
         Begin
           //l:= length(Trim(Q.FieldByName('NOMBRE_REPRESENTANTE').AsString))
           sResultado:= {sResultado +} Trim(Q.FieldByName('NOMBRE_REPRESENTANTE').AsString);
         End;
      Q.Free;
      End;
   sResultado    := Copy(sResultado, l, 80);
   CadenaRepresentante := sResultado;
End;
{
+ -----------------------------------------------------------------------------+
|        <FJR> 03.02.2012  CadenaTelefonos                                     |
+ -----------------------------------------------------------------------------+
}
Function TwMGenArch.CadenaTelefonos(IdCredito: Integer):String;
Var Q: TQuery ;
    SQL, sCve, sNum, sExt, sResultado: String ;
    i, l: Integer ;
Begin
   sResultado:= '';
   SQL:= 'SELECT  '+
         '       CAST(CVE_NAFIN_TIPO_TELEFONO AS VARCHAR2(2)) AS CVE_NAFIN_TIPO_TELEFONO , '+
         '       CAST(NUM_TELEFONO AS VARCHAR2(10)) AS NUM_TELEFONO , '+
         '       CAST(EXTENSION AS VARCHAR2(6)) AS EXTENSION '+
         'FROM CR_REPR_TEL A, CR_TIPO_TELEFONO B  '+
         'WHERE A.ID_TIPO_TELEFONO = B.ID_TIPO_TELEFONO '+
         'AND ID_REPRESENTANTE = (SELECT ID_REPRESENTANTE '+
         '                         FROM CR_CB_SOL_GTIA  '+
         '                         WHERE ID_CREDITO = '+IntToStr(IdCredito)+' ) '+
         'ORDER BY CVE_NAFIN_TIPO_TELEFONO ' ;
   Q:= GetSQLQueryNoNil(SQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If Q <> nil Then
      Begin
         While not Q.Eof do begin
            sCve:= '  '; //2 espacios
            sNum:= '          '; //10 espacios
            sExt:= '      '; //6 espacios
            If Trim(Q.FieldByName('CVE_NAFIN_TIPO_TELEFONO').AsString) <> '' then
               sCve:= sCve+ Q.FieldByName('CVE_NAFIN_TIPO_TELEFONO').AsString ;
            If Trim(Q.FieldByName('NUM_TELEFONO').AsString) <> '' then
               sNum:= Q.FieldByName('NUM_TELEFONO').AsString ;
            If Trim(Q.FieldByName('EXTENSION').AsString) <> '' then
               sExt:= sExt+ Q.FieldByName('EXTENSION').AsString ;
            sResultado    := sResultado + Copy(sCve, Length(sCve)-1, 2)+sNum+Copy(sExt, Length(sExt)-5, 6);
//            SHOWMESSAGE('1234567890123456'+#13+sResultado) ;
            Q.Next
         end ;
         Q.Free;
      End;
   CadenaTelefonos := sResultado;
End;
{
+ -----------------------------------------------------------------------------+
|    <FJR> 03.02.2012               CadenaEMail                                |
+ -----------------------------------------------------------------------------+
}
Function TwMGenArch.CadenaEMail(IdCredito: Integer):String;
Var Q: TQuery ;
    SQL, sResultado: String;
Begin

   sResultado:= '';
   SQL:= 'SELECT EMAIL FROM CR_REPRESENTANTE '+
         'WHERE ID_REPRESENTANTE = '+
         ' (SELECT ID_REPRESENTANTE '+
         '   FROM CR_CB_SOL_GTIA '+
         '   WHERE ID_CREDITO = '+IntToStr(IdCredito)+' )' ;
   Q:= GetSQLQueryNoNil(SQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If Q <> nil Then
      Begin
      If Trim(Q.FieldByName('EMAIL').AsString)<>'' Then
         Begin
           sResultado:= Trim(Q.FieldByName('EMAIL').AsString);
         End;
      Q.Free;
      End;
   sResultado    := Copy(sResultado, 1, 40);
   CadenaEMail := sResultado;
End;

procedure TwMGenArch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TwMGenArch.FormShow(Sender: TObject);
Var  QyQuery: Tquery;  sSql: String;
begin
   lbDEmpresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDFecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   InterForma1.ShowBtnPreview:= False;
   InterForma1.ShowBtnImprimir:= False;
   InterForma1.ShowBtnAyuda:= False;
   InterForma1.ShowBtnBuscar:= False;
   InterForma1.ShowBtnEliminar:= False;
   InterForma1.ShowBtnModificar:= False;
   InterForma1.ShowBtnNuevo:= False;
   InterForma1.ShowBtnAceptar:= False;
   InterForma1.ShowBtnCancelar:= False;

   Objeto.CVE_TIPO_REPORTE.Control  := rgCVE_TIPO_REPORTE;
   Objeto.F_CORTE.Control           := edF_CORTE;
   Objeto.ID_CREDITO.Control        := edID_CREDITO;
   Objeto.DESC_CREDITO.Control      := edDESC_CREDITO;
   Objeto.ID_ACREDITADO.Control     := edID_ACREDITADO;
   Objeto.DESC_ACREDITADO.Control   := edDESC_ACREDITADO;
   Objeto.CVE_TIPO_ENVIO.Control    := rgTipoEnvio;
   Objeto.NOMBRE_ARCHIVO.Control    := edNOMBRE_ARCHIVO;
   Objeto.CVE_MOTIVO_LIQ.Control    := edCVE_MOTIVO_LIQ;
   Objeto.MotivoLiq.CVE_REFERENCIA.Control  := edCVE_MOTIVO_LIQ;
   Objeto.MotivoLiq.VALOR.Control   := edDESC_MOTIVO_LIQ;
   Objeto.B_PAGO_COM_ANUAL.Control  := cbComAnual;
   //
   Objeto.CrCredito.ID_CREDITO.Control  := edID_CREDITO;
   Objeto.CrCredito.ContratoCre.Producto.DESC_L_PRODUCTO.Control := edDESC_CREDITO;
   Objeto.Acreditado.ID_ACREDITADO.Control := edID_ACREDITADO;
   Objeto.Acreditado.Persona.Nombre.Control := edDESC_ACREDITADO;
   Objeto.Acreditado.GetParams(Objeto);
   //
   Objeto.CrCbFindArch.TX_NOM_ARCHIVO.Control := edBuscaArch;
   //
   Objeto.CrCbArchi.TX_NOM_ARCHIVO.Control    := edTX_NOM_ARCHIVO;
   Objeto.CrCbArchi.ID_ARCHIVO.Control        := edID_ARCHIVO;
   Objeto.CrCbArchi.IMP_TOTAL_ARC.Control     := edIMP_TOTAL_ARC;
   Objeto.CrCbArchi.IMP_TOTAL_IVA.Control     := edIMP_TOTAL_IVA;
   Objeto.CrCbArchi.NUM_REGISTRO.Control      := edNUM_REGISTRO;
   Objeto.CrCbArchi.F_ARCHIVO.Control         := edF_ARCHIVO;
   //
   Objeto.TIPO_LIQUIDACION.Control            := rgLiquidacion;
   Objeto.IMP_PREPAGO.Control                 := ieIMP_PREPAGO;
   //
   sSql:=' Select TO_CHAR(sysdate,''YYYY'') As Cve_Clave, '                +
         '	      TO_CHAR(sysdate,''YYYY'') As Desc_Clave FROM DUAL  '     +
         '	UNION SELECT TO_CHAR(ADD_MONTHS(sysdate, -12*1),''YYYY''), '   +
         '       TO_CHAR(ADD_MONTHS(sysdate, -12*1),''YYYY'') FROM DUAL '  +
         ' UNION SELECT TO_CHAR(ADD_MONTHS(sysdate, -12*2),''YYYY''), '    +
         '       TO_CHAR(ADD_MONTHS(sysdate, -12*2),''YYYY'') FROM DUAL '  +
         ' UNION SELECT TO_CHAR(ADD_MONTHS(sysdate, -12*3),''YYYY''), '    +
         '       TO_CHAR(ADD_MONTHS(sysdate, -12*3),''YYYY'') FROM DUAL  ' +
         ' UNION SELECT TO_CHAR(ADD_MONTHS(sysdate, -12*4),''YYYY''), '    +
         '       TO_CHAR(ADD_MONTHS(sysdate, -12*4),''YYYY'') FROM DUAL '  +
         '	UNION SELECT TO_CHAR(ADD_MONTHS(sysdate, -12*5),''YYYY''), '   +
         '       TO_CHAR(ADD_MONTHS(sysdate, -12*5),''YYYY'') FROM DUAL';

   qyQuery := GetSQLQuery(sSQL,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,False);
   If qyQuery <> Nil Then Begin
     While Not QyQuery.Eof Do Begin
         Objeto.ANIO.ComboLista.Add(qyQuery.fieldbyName('Desc_Clave').asString);
         Objeto.ANIO.ComboDatos.Add(qyQuery.fieldbyName('Cve_Clave').asString);
         QyQuery.Next;
     End;
     qyQuery.Free;
   End;

   sSql:=' Select GC.Cve_Clave, GC.Desc_Clave '+
         '   From Bc_Gpo_Catalogo GPO, Bc_Det_Catalogo GC '+
         '  Where GPO.Id_Grupo = GC.Id_Grupo And GPO.GRUPO = ''MES'' ';

   qyQuery := GetSQLQuery(sSQL,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,False);
   If qyQuery <> Nil Then Begin
      While Not QyQuery.Eof Do Begin
         Objeto.MES.ComboLista.Add(qyQuery.fieldbyName('Desc_Clave').asString);
         Objeto.MES.ComboDatos.Add(qyQuery.fieldbyName('Cve_Clave').asString);
         QyQuery.Next;
      End;
      qyQuery.Free;
   End;

   Objeto.ANIO.AsString := FormatDateTime('yyyy', Objeto.Apli.DameFechaEmpresa);
   Objeto.MES.AsString  := FormatDateTime('mm', Objeto.Apli.DameFechaEmpresa);
   Objeto.ANIO.Control  := cbxAnio;
   Objeto.MES.Control   := cbxMes;


   Objeto.msBufEnt := TMemoryStream.Create;
   Objeto.msBufSal := TMemoryStream.Create;
   //
   {
   rgCVE_TIPO_REPORTE.ItemIndex  := 0;
   rgCVE_TIPO_REPORTEClick(nil);
   }
   //
   Objeto.F_CORTE.AsString := FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
   dtpF_CORTE.DateTime     := Objeto.F_CORTE.AsDateTime;
   //
   LimpiaDatos;
   sNombreArchivo:= '';
end;


procedure TwMGenArch.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_TIPO_REPORTE.Control:=nil;
   Objeto.F_CORTE.Control:= nil;
   Objeto.ID_CREDITO.Control:=nil;
   Objeto.DESC_CREDITO.Control:=nil;
   Objeto.ANIO.Control  := nil;
   Objeto.MES.Control  := nil;
   Objeto.ID_ACREDITADO.Control:= nil;
   Objeto.DESC_ACREDITADO.Control:= nil;
   Objeto.CVE_TIPO_ENVIO.Control   := nil;
   Objeto.NOMBRE_ARCHIVO.Control   := nil;
   Objeto.CVE_MOTIVO_LIQ.Control   := nil;
   Objeto.MotivoLiq.CVE_REFERENCIA.Control  := nil;
   Objeto.MotivoLiq.VALOR.Control  := nil;
   Objeto.B_PAGO_COM_ANUAL.Control := nil;
   //
   Objeto.CrCredito.ID_CREDITO.Control  := nil;
   Objeto.CrCredito.ContratoCre.Producto.DESC_L_PRODUCTO.Control := nil;
   Objeto.Acreditado.ID_ACREDITADO.Control := nil;
   Objeto.Acreditado.Persona.Nombre.Control := nil;
   //
   Objeto.CrCbFindArch.TX_NOM_ARCHIVO.Control := nil;
   //
   Objeto.TIPO_LIQUIDACION.Control            := nil;
   Objeto.IMP_PREPAGO.Control                 := nil;
   //
   Objeto.CrCbArchi.TX_NOM_ARCHIVO.Control  := nil;
   Objeto.CrCbArchi.ID_ARCHIVO.Control      := nil;
   Objeto.CrCbArchi.IMP_TOTAL_ARC.Control   := nil;
   Objeto.CrCbArchi.IMP_TOTAL_IVA.Control   := nil;
   Objeto.CrCbArchi.NUM_REGISTRO.Control    := nil;
   Objeto.CrCbArchi.F_ARCHIVO.Control       := nil;
   //
   Objeto.msBufEnt.Free;
   Objeto.msBufSal.Free;
   slLista.Free;
   If (sNombreArchivo<>'') And (FileExists(sNombreArchivo)) then DeleteFile(sNombreArchivo);
end;
{
+------------------------------------------------------------------------------+
|                                                                              |
|                    E V E N T O S   D E L   U S U A R I O                     |
|                                                                              |
+------------------------------------------------------------------------------+
}
procedure TwMGenArch.pcPrincipalChanging(Sender: TObject;  var AllowChange: Boolean);
begin
  AllowChange:= False;
end;
//
procedure TwMGenArch.btnSigCreaClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 1;
end;
//
procedure TwMGenArch.btnAntCorreoClick(Sender: TObject);
begin
  pcPrincipal.ActivePageIndex := 2;
end;


Procedure TwMGenArch.GeneraAnexo1;
Var
   sSQL, sCadena, sPrimeraParte, sSegundaParte, sTerceraParte, sCuartaParte,
   sPropositos, sGarantia, sRecursos, sParteProp, sParteGar, sParteRec, sParteRepr, sParteTels, sParteReprMail:String;
   qyQuery: TQuery; iIdCredito, iIdSolicitud:Integer; bContCred, bContinua:Boolean;
   F: TextFile;
   vlImpOperac : Currency;
   vlstrMessage : String;
Begin
  iIdCredito   := 0;
  iIdSolicitud := 0;
  sPropositos  := '';
  sGarantia    := '';
  sRecursos    := '';
  sParteProp   := '';
  sParteGar    := '';
  sParteRec    := '';
  sParteRepr   := '' ;
  sParteTels   := '' ;
  sParteReprMail:= '' ;
  bContCred    := False;
  bContinua    := False;
  //
  slLista.Clear;
  Objeto.GetFromControl;
  //
  vlImpOperac  := 0;
  Objeto.IMP_TOTAL_ARC.AsFloat  := 0;
  Objeto.IMP_TOTAL_IVA.AsFloat  := 0;
  Objeto.NUM_REGISTRO.AsInteger := 0;
  Objeto.NUM_ENVIO.AsInteger    := 0;
  //
  if not ValidaDatosAnexo1 then
     Exit;
  //
  //
  AssignFile(F, Objeto.PATH_ARCHIVO.AsString + Objeto.NOMBRE_ARCHIVO.AsString);
  Rewrite(F);
  //
  sSQL    := FormaQuery(Objeto.CVE_TIPO_REPORTE.AsString);
  qyQuery := GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
  qyQuery.SQL.SaveToFile('c:\queryAnexo1.txt');   // RABA 18/08/2011  QUITAR
  If qyQuery <> Nil Then
  begin
     while not qyQuery.Eof do
     begin
       If qyQuery.FieldByName('ID_CREDITO').AsInteger > 0 Then
          begin
             // <FJR> 03/02/2012 REPRESENTANTE, TELEFONOS Y CORREO ELECTRONICO DEL REPRESENTANTE
             sParteRepr:= CadenaRepresentante(qyQuery.FieldByName('ID_CREDITO').AsInteger);
             sParteTels:= CadenaTelefonos(qyQuery.FieldByName('ID_CREDITO').AsInteger) ;
             sParteReprMail:= CadenaEMail(qyQuery.FieldByName('ID_CREDITO').AsInteger) ;
             If ( iIdCredito   = qyQuery.FieldByName('ID_CREDITO').AsInteger   ) And
                ( iIdSolicitud = qyQuery.FieldByName('ID_SOLICITUD').AsInteger ) Then
             begin
                if bContCred then
                   begin
                   // Garantias
                     If qyQuery.FieldByName('GRUPO').AsInteger = 0 Then
                        begin
                          If qyQuery.FieldByName('CVE_GARANTIA').AsString <>'' Then
                             begin
                               sParteGar:= sParteGar + PosicionClave(qyQuery.FieldByName('CVE_GARANTIA').AsString,2) +
                               FormatFloat('000000000.00',qyQuery.FieldByName('IMP_GARANTIA').AsFloat)
                             end
                          else
                             begin
                                If qyQuery.FieldByName('IMP_GARANTIA').AsFloat > 0 Then
                                   ShowMessage('No existe una clave de relación de la garantía con Nafin,'+
                                               'por lo cual no se asegura la integridad de los datos'     + coCRLF +
                                               'Disposición: ' + qyQuery.FieldByName('ID_CREDITO').AsString )
                                Else
                                   sParteGar := sParteGar + PosicionClave('5',2) +
                                                FormatFloat('000000000.00',qyQuery.FieldByName('IMP_GARANTIA').AsFloat);
                             end;
                        // Propósitos
                        end
                     else
                        if qyQuery.FieldByName('GRUPO').AsInteger = 1 Then
                           begin
                              sParteProp:= sParteProp + PosicionClave(qyQuery.FieldByName('CVE_PROPOSITO').AsString,2);
                              // Destinos
                           end
                           else
                           if qyQuery.FieldByName('GRUPO').AsInteger = 2 then
                              begin
                              sParteRec:= sParteRec + PosicionClave(qyQuery.FieldByName('CVE_DESTINO').AsString,2) +
                              qyQuery.FieldByName('PCT_PARCIAL').AsString +
                              qyQuery.FieldByName('PCT_ORIGEN_NAL').AsString +
                              qyQuery.FieldByName('PCT_IMPORTACION').AsString;
                              end;//ends_if_qyQuery.FieldByName('GRUPO').AsInteger_=_0_Then
                //
                end;//ends_if_bContCred_then
             end
             else
                begin
                   vlImpOperac   := qyQuery.FieldByName('IMP_FINANCIAMTO').AsFloat;

                   sPrimeraParte :=
                                   qyQuery.FieldByName('NOMBRE').AsString + #64 +
                                   qyQuery.FieldByName('RFC').AsString + #64 +
                                   qyQuery.FieldByName('CALLE_NUMERO').AsString + #64 +
                                   qyQuery.FieldByName('COLONIA').AsString + #64 +
                                   qyQuery.FieldByName('CODIGO_POSTAL').AsString + #64 +
                                   qyQuery.FieldByName('CIUDAD').AsString + #64 +
                                   qyQuery.FieldByName('MUNICIPIO').AsString + #64 +
                                   qyQuery.FieldByName('ESTADO').AsString + #64 +
                                   qyQuery.FieldByName('GIRO').AsString + #64 +
                                   qyQuery.FieldByName('CVE_FINAN').AsString + #64 +
                                   qyQuery.FieldByName('TIPSEC').AsString + #64 +
                                   qyQuery.FieldByName('FONDEO_NAFIN').AsString + #64 +
                                   qyQuery.FieldByName('RIESGO_NAFIN').AsString + #64 +
                                   qyQuery.FieldByName('PCT_PART_RIESGO').AsString + #64 +
                                   qyQuery.FieldByName('NUM_PERSONAL').AsString + #64 +
                                   qyQuery.FieldByName('IMP_PROM_VENTAS').AsString + #64;
                   sSegundaParte := qyQuery.FieldByName('CVE_TIP_CRED').AsString + #64;
                   sTerceraParte :=
                                   qyQuery.FieldByName('PCT_PROD_MER_INT').AsString + #64 +
                                   qyQuery.FieldByName('PCT_PROD_MER_EXT').AsString + #64 +
                                   qyQuery.FieldByName('CVE_TIP_AMORTIZA').AsString + #64 +
                                   //<LOLS 10FEB2006  SE CAMBIA EL ORDEN DE LAS COLUMNAS IMPORTE DE FINANCIAMIENTO E IMPORTE DE CREDITO>
                                   qyQuery.FieldByName('IMP_CREDITO').AsString + #64 +
                                   qyQuery.FieldByName('F_DISPOSICION').AsString + #64 +
                                   qyQuery.FieldByName('IMP_FINANCIAMTO').AsString + #64 +
                                   //
                                   //qyQuery.FieldByName('IMP_FINANCIAMTO').AsString + #64 +
                                   //qyQuery.FieldByName('F_DISPOSICION').AsString + #64 +
                                   //qyQuery.FieldByName('IMP_CREDITO').AsString + #64 +
                                   //</LOLS>
                                   qyQuery.FieldByName('MONEDA').AsString + #64 +
                                   qyQuery.FieldByName('NUM_MES_PLAZO').AsString + #64 +
                                   qyQuery.FieldByName('NUM_MES_GRACIA').AsString + #64 +
                                   qyQuery.FieldByName('SOBRETASA').AsString + #64 +
                                   qyQuery.FieldByName('CVE_FUNC_INTER').AsString + #64 +
                                   qyQuery.FieldByName('CVE_INTER_FINAN').AsString + #64 +
                                   qyQuery.FieldByName('CVE_TIP_AUTORIZA').AsString + #64 +
                                   qyQuery.FieldByName('CVE_PROGRAMA').AsString + #64 +
                                   qyQuery.FieldByName('CVE_TIP_TASA').AsString + #64 +
                                   qyQuery.FieldByName('DIAS_PLAZO').AsString + #64 +
                                   qyQuery.FieldByName('CVE_CALIF_CRE').AsString + #64 +
                                  // PosicionClave(qyQuery.FieldByName('MES_ANTIGUEDAD').AsString,5)+#64;   // RABA AGOSTO 2011
                                  // </ RABA > AGOSTO 2011 SE AGREGAN 4 CAMPOS MAS SEGUN EL LAYOUT DE NAFIN
                                   qyQuery.FieldByName('MES_ANTIGUEDAD').AsString + #64;
                  //<FJR> 03/02/2012 REPRESENTANTE, TELEFONOS Y CORREO ELECTRONICO DE REPRESENTANTE
                   sCuartaParte := sParteRepr + #64 + sParteTels + #64 +  sParteReprMail + #64 ;

                  //sCuartaParte := {REPRESENTANTE} #64 + {TELEFONOS} #64 +
                 //                qyQuery.FieldByName('E_MAIL').AsString + #64 {DEPENDENCIA A LA QUE VENDE};
// < RABA />
            //
            if qyQuery.FieldByName('GRUPO').AsInteger = 0 Then
               begin
                 if qyQuery.FieldByName('CVE_GARANTIA').AsString <> '' then
                    begin
                       sParteGar := PosicionClave(qyQuery.FieldByName('CVE_GARANTIA').AsString,2) +
                                    FormatFloat('000000000.00',qyQuery.FieldByName('IMP_GARANTIA').AsFloat);
                       bContCred := True;
                    end
                 else
                    begin
                      If qyQuery.FieldByName('IMP_GARANTIA').AsFloat > 0 Then
                         begin
                            ShowMessage('No existe una clave de relación de la garantía con Nafin,'+
                                        'por lo cual no se asegura la integridad de los datos' + coCRLF +
                                        'Disposición: ' + qyQuery.FieldByName('ID_CREDITO').AsString );
                            bContCred:= False;
                         end
                      else
                         begin
                            sParteGar:= PosicionClave( '5', 2 ) +
                                     FormatFloat('000000000.00',qyQuery.FieldByName('IMP_GARANTIA').AsFloat);
                            bContCred:= True;
                         End;
                         //ends_If_qyQuery.FieldByName('IMP_GARANTIA').AsFloat_>_0_Then
                 End;//ends_if_qyQuery.FieldByName('CVE_GARANTIA').AsString_<>_''_then
               //
               end
            else
               begin
                  ShowMessage( 'El crédito '+ qyQuery.FieldByName('CVE_FINAN').AsString +
                               ' no tiene Garantías relacionadas');
                  bContCred := False;
               end;//ends_if_qyQuery.FieldByName('GRUPO').AsInteger_=_0_Then
            //
             end;//ends_If_(_iIdCredito_=_qyQuery.FieldByName('ID_CREDITO').AsInteger_)_And ...
         //
         iIdCredito   := qyQuery.FieldByName('ID_CREDITO').AsInteger;
         iIdSolicitud := qyQuery.FieldByName('ID_SOLICITUD').AsInteger;
         sPropositos  := qyQuery.FieldByName('CVE_PROPOSITO').AsString;
         sGarantia    := qyQuery.FieldByName('CVE_GARANTIA').AsString;
         sRecursos    := qyQuery.FieldByName('CVE_DESTINO').AsString;
         //
       End;//ends_If_qyQuery.FieldByName('ID_CREDITO').AsInteger_>_0_then
      //
      qyQuery.Next;
      //
      if qyQuery.FieldByName('ID_CREDITO').AsInteger > 0 then
      begin
        If ( (iIdCredito <> qyQuery.FieldByName('ID_CREDITO').AsInteger ) OR
             (iIdSolicitud <> qyQuery.FieldByName('ID_SOLICITUD').AsInteger)
           )Or qyQuery.Eof Then
        begin
          if bContCred then
          begin
            sCadena:= sPrimeraParte + sParteProp + #64 +
                      sSegundaParte + sParteGar  + #64 +
//                      sParteRec + #64 + sTerceraParte; // RABA AGOSTO 2011 SE AGREGA LA CUARTA PARTE
                      sParteRec + #64 + sTerceraParte + sCuartaParte;
            slLista.Add(sCadena);
            Writeln(F, sCadena);
            //
            Objeto.IMP_TOTAL_ARC.AsFloat  := Objeto.IMP_TOTAL_ARC.AsFloat  + vlImpOperac;
            Objeto.NUM_REGISTRO.AsInteger := Objeto.NUM_REGISTRO.AsInteger + 1;
            //
            bContinua  := Objeto.stpActSolGtia(iIdCredito, iIdSolicitud); // CambiaSit(iIdCredito, iIdSolicitud, Objeto.CVE_TIPO_REPORTE.AsString)
            sParteProp := '';
            sParteGar  := '';
            sParteRec  := '';
          End;//ends_if_bContCred_then
          //
        End;//ends_If ( (iIdCredito <> qyQuery.FieldByName('ID_CREDITO').AsInteger ) OR
        //
      End;//ends_if_qyQuery.FieldByName('ID_CREDITO').AsInteger > 0 then
      //
    End;//ends_while_not_qyQuery.Eof_do
    //
    qyQuery.Free;
  End;//ends_If_qyQuery_<>_Nil_Then
  //
  CloseFile(F);
  //

  if bContinua then
     bContinua := GuardaArch;

  // <SATV4766 28Oct2008>
  If not bContinua Then
     Begin
     vlstrMessage := 'El Archivo no se insertó en la base de datos.'  + coCRLF +
                     'Probablemente no existe información a generar.' + coCRLF +
                     'Avise a sistemas';
     MessageDlg(vlstrMessage, mtError, [mbOK], 0 );
     End
  Else
     Begin
     vlstrMessage := 'Proceso Terminado' + ': el archivo se guardó con el Folio No. '+ IntToStr(iFolio);
     MessageDlg(vlstrMessage, mtInformation, [mbOK], 0 );
     End;
  // </SATV4766 28Oct2008>
  memInfo.Lines.Add('Archivo Guardado');
end;

Procedure TwMGenArch.GeneraAnexo2;
Var
   F  : TextFile;
   qyQuery      : TQuery;
   bContinua    : Boolean;
   sBExiste     : String;
   sSqlExiste   : String;
   vlImpCtlBru  : Currency;
   vlImpCtlIVA  : Currency;
   iIdCredito, iIdSolicitud : Integer;
   sSQL, sCadena, sMontos, sPrimeraParte, sSegundaParte : String;

begin
   slLista.Clear;
   Objeto.GetFromControl;
   //
   bContinua   := False;
   Objeto.IMP_TOTAL_ARC.AsFloat  := 0;
   Objeto.IMP_TOTAL_IVA.AsFloat  := 0;
   Objeto.NUM_REGISTRO.AsInteger := 0;
   Objeto.NUM_ENVIO.AsInteger    := 0;
   //
   Objeto.F_CORTE.GetFromControl;
   Objeto.B_PAGO_COM_ANUAL.GetFromControl;
   //

   if not Objeto.stpValComCred( Objeto.F_CORTE.AsDateTime ) then
     Exit;
   //
   AssignFile(F, Objeto.PATH_ARCHIVO.AsString + Objeto.NOMBRE_ARCHIVO.AsString);
   Rewrite(F);
   //
   If Objeto.F_CORTE.AsDateTime > 0 Then Begin
      sBExiste := 'F';
      if Objeto.B_PAGO_COM_ANUAL.AsString = 'V' then
        sSqlExiste := Format(coBCrCarga, [ SQLFecha( Objeto.F_CORTE.AsDateTime ), Objeto.ID_CREDITO.AsInteger ] )
      else
        sSqlExiste := Format(coBCarga, [ SQLFecha( Objeto.F_CORTE.AsDateTime ) ] );
      //
      GetSQLStr( sSqlExiste, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'B_CARGA',
                 sBExiste,   False );
      If sBExiste <> 'V' Then Begin
        MessageDlg( 'Se van a generar los saldos de la cartera garantizada', mtInformation, [ mbOk ], 0 );
        if Objeto.B_PAGO_COM_ANUAL.AsString = 'V' then
        Begin
          If Not Objeto.GeneraComAnual then
            exit;
          //
        End Else Begin
          If Not Objeto.stpCargaComPYME Then
            exit;
          //
        End;
        //
      End;
      //
      sMontos :=  '';
      sSQL    := FormaQuery(Objeto.CVE_TIPO_REPORTE.AsString);
      qyQuery := GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      qyQuery.SQL.SaveToFile('c:\queryAnexo2.txt');   // RABA 18/08/2011   QUITAR
      If qyQuery <> Nil Then
      Begin
         qyQuery.First;
         While not qyQuery.Eof Do
         Begin
            sPrimeraParte:= qyQuery.FieldByName('CVE_INTER_FINAN').AsString  + '@' +
                            qyQuery.FieldByName('ID_CREDITO').AsString       + '@';
            //
            sSegundaParte:= qyQuery.FieldByName('IMP_COMISION').AsString     + '@' +
                            qyQuery.FieldByName('IMP_IVA_COMISION').AsString + '@' +
                            qyQuery.FieldByName('TOTAL').AsString            + '@' +
                            qyQuery.FieldByName('SDO_ACRED').AsString        + '@' +
                            qyQuery.FieldByName('MORA').AsString + '@' +
                            //Nuevos requerimientos MAGV 20101001
                            '0.00@' + //Saldos al corte
                            '0.00@' + //Suma Disposiciones
                            '@' + //Fecha de Otorgamiento
//NOVIEMBRE  2010   DESARROLLO -  CAMBIO EN EL MANEJO DE FECHAS DE LIQUIDACIÓN POR TIPO DE CRÉDITO
//                            '@' + //Calificación Variable
                            '@'; //Calificación Variable

            if qyQuery.FieldByName('STAGAR').AsString = '1' then
            begin
                 if  StrToInt(copy(qyQuery.FieldByName('F_LIQUIDACION').AsString,0,6))  <=  StrToInt(FormatDateTime('YYYYMM',Objeto.F_CORTE.AsDateTime)) then
                    sSegundaParte:= sSegundaParte +
                                    qyQuery.FieldByName('STAGAR').AsString + '@' + //Status de garantías
                                    qyQuery.FieldByName('F_LIQUIDACION').AsString + '@' //Fecha de liquidación
                 else
                    sSegundaParte:= sSegundaParte + '@' + '@'; //Fecha de liquidación
            end
            else
               sSegundaParte:= sSegundaParte +
                               qyQuery.FieldByName('STAGAR').AsString + '@' + //Status de garantías
                               qyQuery.FieldByName('F_LIQUIDACION').AsString + '@'; //Fecha de liquidación
            //end if

//FIN NOV 2010


            //
            sMontos      := sMontos  + qyQuery.FieldByName('MOVIMIENTOS').AsString;
            //
            vlImpCtlBru  := qyQuery.FieldByName('IMP_COMISION').AsFloat;
            vlImpCtlIVA  := qyQuery.FieldByName('IMP_IVA_COMISION').AsFloat;
            //
            iIdCredito   := qyQuery.FieldByName('ID_CREDITO').AsInteger;
            iIdSolicitud := qyQuery.FieldByName('FOLIO_CORTE').AsInteger;
            //
            bContinua := True;
//****************************** OJO *****************************************//
//  RABA AGOSTO 2011
//            bContinua := CambiaAnx2Sit(1, iIdCredito, iIdSolicitud, 0, 0 );
//****************************************************************************//
            if not bContinua then
              Break;
            //
            qyQuery.Next;
            //
            If ( iIdCredito <> qyQuery.FieldByName('ID_CREDITO').AsInteger ) Or qyQuery.Eof Then
            Begin
               sCadena := sPrimeraParte + sMontos + #64 + sSegundaParte;
               slLista.Add(sCadena);
               Writeln(F, sCadena);
               Objeto.IMP_TOTAL_ARC.AsFloat  := Objeto.IMP_TOTAL_ARC.AsFloat  + vlImpCtlBru;
               Objeto.IMP_TOTAL_IVA.AsFloat  := Objeto.IMP_TOTAL_IVA.AsFloat  + vlImpCtlIVA;
               Objeto.NUM_REGISTRO.AsInteger := Objeto.NUM_REGISTRO.AsInteger + 1;
               bContinua := True;
//****************************** OJO *****************************************//
//  RABA AGOSTO 2011
//               bContinua := CambiaAnx2Sit(2, iIdCredito,  0, vlImpCtlBru,  vlImpCtlIVA );
//****************************************************************************//
               if not bContinua then
                 Break;
               //
               sMontos     := '';
            End;
         End;//Ends_While_not_qyQuery.Eof_Do
         qyQuery.Free;
      End;//Ends_If_qyQuery_<>_Nil_Then
   End Else Begin
      ShowMessage('Debe seleccionar una Fecha de Corte');
      bContinua:= False;
   End;
   CloseFile(F);

   If bContinua Then bContinua:= GuardaArch;
   If not bContinua Then
     MessageDlg( 'El Archivo no se insertó en la base de datos.' + coCRLF +
                 'Probablemente no existe información a generar.' + coCRLF +
                 'Avise a sistemas', mtError, [mbOK], 0 )
   Else
     ShowMessage('Proceso Terminado'+': el archivo se guardó con el Folio No. '+ IntToStr(iFolio));
End;

Function  TwMGenArch.GeneraPagosAnt : boolean;
Begin
   Result := False;
   qyQueryPA.Active := False;
   qyQueryPA.DatabaseName:= Objeto.Apli.DataBaseName;
   qyQueryPA.SessionName:= Objeto.Apli.SessionName;
   qyQueryPA.SQL.Text := FormaQuery(Objeto.CVE_TIPO_REPORTE.AsString);
   qyQueryPA.Active := True;
   If qyQueryPA <> Nil Then Begin
      CreaArchivo;
      Try
         Objeto.ExcelLoader.OpenWorkBook(Objeto.PATH_ARCHIVO.AsString + Objeto.NOMBRE_ARCHIVO.AsString, False);
         Objeto.ExcelLoader.vlFecha := Objeto.F_CORTE.AsDateTime;
         Objeto.ExcelLoader.CargaArchPA(qyQueryPA, Objeto.Apli);
      Finally
         Objeto.ExcelLoader.DescargaArchivo;
         Result := GuardaArch;
      End;
   End;
   If not Result Then
     MessageDlg( 'El Archivo no se insertó en la base de datos.' + coCRLF +
                 'Probablemente no existe información a generar.' + coCRLF +
                 'Avise a sistemas', mtError, [mbOK], 0 )
   Else
     ShowMessage('Proceso Terminado'+': el archivo se guardó con el Folio No. '+ IntToStr(iFolio));
End;
//
procedure TwMGenArch.FormCreate(Sender: TObject);
begin
   slLista := TStringList.Create;
   slLista.Clear;
end;


procedure TwMGenArch.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

function TCalif( pMes : Integer ):Integer;
begin
  Result := 0;
  if ( pMes  >= 1 ) and ( pMes <= 3 )then
    Result := 1
  else if ( pMes >= 4 )  and ( pMes <= 6  ) then
    Result := 2
  else if ( pMes >= 7 )  and ( pMes <= 9  ) then
    Result := 3
  else if ( pMes >= 10 ) and ( pMes <= 12 ) then
    Result := 4
  ;
end;

Procedure TwMGenArch.GeneraAnexo3;
const xlThick = 4;  xlThin = 2;
Var
   sSQL, sCadena: String;qyQuery: TQuery; bContinua:Boolean; F: TextFile;
   vlnTotalReg, vlnTotalRegErr : Integer;
   vlFecha : String;
   vlstrMessage : String;
begin
   Objeto.GetFromControl;
   bContinua:= False;
   vlFecha := '';
   GetSQLStr( Format( coFCalif,  [FormatFloat('0000', Objeto.ANIO.AsInteger),
                                  FormatFloat('00',   Objeto.MES.AsInteger )
                                  ] ), Objeto.Apli.DataBaseName,
              Objeto.Apli.SessionName, 'F_ANIO_MES', vlFecha, True );
   If rgTipoArch.ItemIndex = 0 Then Begin
      qyQueryAnexo3.Active := False;
      qyQueryAnexo3.DatabaseName:= Objeto.Apli.DataBaseName;
      qyQueryAnexo3.SessionName:= Objeto.Apli.SessionName;
      qyQueryAnexo3.SQL.Text := FormaQuery(Objeto.CVE_TIPO_REPORTE.AsString);
      qyQueryAnexo3.Active := True;
      If qyQueryAnexo3 <> Nil Then Begin
         CreaArchivo;
         Try
            Objeto.ExcelLoader.OpenWorkBook(Objeto.PATH_ARCHIVO.AsString + Objeto.NOMBRE_ARCHIVO.AsString, False);
            bContinua := Objeto.ExcelLoader.CargaArchCalif(memInfo, qyQueryAnexo3, Objeto.Apli, vlFecha, vlnTotalReg, vlnTotalRegErr);
         Finally
            //<SATV 28OCT2008>
            If Not (bContinua) Then
               Begin
               vlstrMessage := ' El proceso tuvo '+IntToStr(vlnTotalRegErr)+' errores de '+IntToStr(vlnTotalReg)+
                               ' registros al generar el archivo.'+coCRLF;
               memInfo.Lines.Add(vlstrMessage);
               bContinua := MessageDlg( vlstrMessage + ' ¿Desear continuar con el envío del archivo?',
                                        mtConfirmation, [mbYes, mbNo], 0) = mrYes;
               End;
            //</SATV 28OCT2008>

            //<LOLS 26 ABR 2006.AGREGA VALIDACION>
            if bContinua then
            Begin
            //</LOLS>
            //
              Objeto.ExcelLoader.DescargaArchivo;
              bContinua:= GuardaArch;
            //
            //<LOLS 26 ABR 2006.AGREGA VALIDACION>
            End;
            //</LOLS>
         End;
      End;
   End Else If rgTipoArch.ItemIndex = 1 Then Begin
      slLista.Clear;
      AssignFile(F, Objeto.PATH_ARCHIVO.AsString + Objeto.NOMBRE_ARCHIVO.AsString);
      Rewrite(F);

      Objeto.GetFromControl;
      If (Objeto.ANIO.AsInteger > 0)and(Objeto.MES.AsInteger > 0) Then Begin
         sSQL:= FormaQuery(Objeto.CVE_TIPO_REPORTE.AsString);
         qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
         If qyQuery <> Nil Then Begin
            While not qyQuery.Eof Do Begin
               bContinua := True;

               //<LOLS 10 MAY 2006. SE AGREGA VALIDACION>
               if qyQuery.FieldByName('ID_CREDITO').IsNull then
               begin
                 bContinua := False;
                 MessageDlg( 'Error al procesar la disposición: ' + qyQuery.FieldByName('ID_CREDITO_CTRL').AsString +
                             coCRLF+ 'No se encontró la información.', mtWarning, [mbOk, mbCancel], 0 );
                 Break;
               end;
               //</LOLS>
               //
               //<LOLS 27FEB2006 REQ. DEL ANEXO DE CALIFICACION>
               {
               sCadena := qyQuery.FieldByName('ID_CREDITO').AsString + #64 +
                          qyQuery.FieldByName('RFC').AsString + #64 +
                          qyQuery.FieldByName('NOMBRE').AsString + #64 +
                          qyQuery.FieldByName('SDO_TRIMESTRE').AsString + #64 +
                          qyQuery.FieldByName('PCT_GARANTIZADO').AsString + #64 +
                          qyQuery.FieldByName('CVE_CAL_ACRED').AsString + #64 +
                          qyQuery.FieldByName('CVE_CALIFIC_CUB').AsString + #64 +
                          qyQuery.FieldByName('CVE_CALIFIC_EXP').AsString + #64 +
                          qyQuery.FieldByName('RES_SDO_CUB').AsString + #64 +
                          qyQuery.FieldByName('RES_SDO_EXP').AsString + #64 +
                          qyQuery.FieldByName('IMP_RESERVA_CUB').AsString + #64 +
                          qyQuery.FieldByName('IMP_RESERVA_EXP').AsString + #64 +
                          qyQuery.FieldByName('TOTAL').AsString + #64;
                          }
               sCadena := qyQuery.FieldByName('ID_INTERMEDIARIO').AsString      + coArroba +
                          qyQuery.FieldByName('ANIO_CALIF').AsString            + coArroba +
                          IntToStr(TCalif(qyQuery.FieldByName('MES_CALIF').AsInteger)) + coArroba +
                          qyQuery.FieldByName('ID_CREDITO').AsString            + coArroba +
                          qyQuery.FieldByName('RFC').AsString                   + coArroba +
                          qyQuery.FieldByName('CVE_CAL_ACRED').AsString         + coArroba +
                          qyQuery.FieldByName('CVE_CALIFIC_CUB').AsString       + coArroba +
                          qyQuery.FieldByName('CVE_CALIFIC_EXP').AsString       + coArroba +
                          qyQuery.FieldByName('RES_SDO_CUB').AsString           + coArroba +
                          qyQuery.FieldByName('RES_SDO_EXP').AsString           + coArroba +
                          qyQuery.FieldByName('IMP_RESERVA_CUB').AsString       + coArroba +
                          qyQuery.FieldByName('IMP_RESERVA_EXP').AsString       + coArroba ;
               //</LOLS>
               Writeln(F, sCadena);
               qyQuery.Next;
            End;
            qyQuery.Free;
         End;
      End Else Begin
         ShowMessage('Debe seleccionar un Año y Mes');
         bContinua:= False;
      End;
      CloseFile(F);
      If bContinua Then bContinua := GuardaArch;
   End;

   If not bContinua Then
     MessageDlg( 'El Archivo no se insertó en la base de datos.' + coCRLF +
                 'Probablemente no existe información a generar.' + coCRLF +
                 'Avise a sistemas', mtError, [mbOK], 0 )
   Else
     ShowMessage('Proceso Terminado' + ': el archivo se guardó con el Folio No. ' + IntToStr(iFolio));
End;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 1    Tipo de reporte                           |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.rgCVE_TIPO_REPORTEClick(Sender: TObject);
begin
   iFolio := 0;
   LimpiaDatos;
   Objeto.CVE_TIPO_REPORTE.GetFromControl;
   Objeto.F_CORTE.AsString := DateToStr( Objeto.Apli.DameFechaEmpresa );
   // Deshabilita Fecha de Corte y comision anual
   dtpF_CORTE.Enabled := False;
   edF_CORTE.Color    := clBtnFace;
   edF_CORTE.ReadOnly := True;
   cbComAnual.Enabled := False;
   // Deshabilita Número de disposicion
   edID_CREDITO.ReadOnly := True;
   edID_CREDITO.Color    := clBtnFace;
   btID_CREDITO.Enabled  := False;
   cbID_CREDITO.Enabled  := False;
   // Deshabilita Número de acreditado
   edID_ACREDITADO.ReadOnly := True;
   edID_ACREDITADO.Color    := clBtnFace;
   btnID_ACREDITADO.Enabled := False;
   cbxID_ACREDITADO.Enabled := False;
   // Año mes y tipo de archivo
   cbxAnio.Enabled := False;
   cbxAnio.Color   := clBtnFace;
   cbxMes.Enabled  := False;
   cbxMes.Color    := clBtnFace;
   rgTipoArch.Enabled := False;
   // Deshabilita Tipo de Liquidacion
   edCVE_MOTIVO_LIQ.ReadOnly := True;
   edCVE_MOTIVO_LIQ.Color    := clBtnFace;
   btCVE_MOTIVO_LIQ.Enabled  := False;
   cbxCVE_MOTIVO_LIQ.Enabled := False;
   rgLiquidacion.Enabled   := False;
   ieIMP_PREPAGO.Enabled   := False;
   ieIMP_PREPAGO.Color     := clBtnFace;
   //
   //<LOLS 20 ABR 2006>
   If (Objeto.CVE_TIPO_REPORTE.AsString = coANEXO1 ) Then
   Begin
      dtpF_CORTE.Enabled := True;
      edF_CORTE.Color    := clWindow;
      edF_CORTE.ReadOnly := False;
      Objeto.F_CORTE.AsString := DameFechaAnexo2(Objeto.Apli.DameFechaEmpresa);
// < / RABA > SEP 2011
      btnBitacoraAnexo2.Visible := False;
// < RABA />
   End;
   //</LOLS>
   //
   If (Objeto.CVE_TIPO_REPORTE.AsString = coANEXO2 ) Then
   Begin
      dtpF_CORTE.Enabled := True;
      edF_CORTE.Color    := clWindow;
      edF_CORTE.ReadOnly := False;
      cbComAnual.Enabled := True;
      Objeto.F_CORTE.AsString := DameFechaAnexo2(Objeto.Apli.DameFechaEmpresa);
// < / RABA > SEP 2011
      btnBitacoraAnexo2.Visible := True;
// < RABA />
   End;
   //
   If ( Objeto.CVE_TIPO_REPORTE.AsString = coRPAGAN  ) Then
   Begin
      edID_CREDITO.ReadOnly:= False;
      edID_CREDITO.Color:= clWindow;
      btID_CREDITO.Enabled:= True;
      cbID_CREDITO.Enabled:= True;
      //<LOLS 25 MAY 2006>
      dtpF_CORTE.Enabled := True;
      edF_CORTE.Color    := clWindow;
      edF_CORTE.ReadOnly := False;
      //</LOLS>
      edCVE_MOTIVO_LIQ.ReadOnly := False;
      edCVE_MOTIVO_LIQ.Color    := clWindow;
      btCVE_MOTIVO_LIQ.Enabled  := True;
      cbxCVE_MOTIVO_LIQ.Enabled := True;
      rgLiquidacion.Enabled     := True;
      ieIMP_PREPAGO.Enabled     := False;
      ieIMP_PREPAGO.Color       := clWindow;
      //
      Objeto.F_CORTE.AsString := DateToStr(Objeto.Apli.DameFechaEmpresa);
// < / RABA > SEP 2011
      btnBitacoraAnexo2.Visible := False;
// < RABA />
   End;
   //
   If (Objeto.CVE_TIPO_REPORTE.AsString = coANEXO3 ) Then Begin
      cbxAnio.Enabled := True;
      cbxAnio.Color   := clWindow;
      cbxMes.Enabled  := True;
      cbxMes.Color    := clWindow;
      //<LOLS 26 ABR 2006. SE HABILITA NUEVAMENTE LA SALIDA A EXCEL>
       //<LOLS 02 MAR 2006. SE QUITA LA OPCION TIPO DE ARCHIVO SOLO SE GENERA TXT>
      rgTipoArch.Enabled   := True;
      rgTipoArch.ItemIndex := 0;
       //rgTipoArch.ItemIndex := 1;
       //</LOLS>
      //</LOLS>
// < / RABA > SEP 2011
      btnBitacoraAnexo2.Visible := False;
// < RABA />
   End;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 1    Siguiente ...                             |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.btnCreaArchivoClick(Sender: TObject);
begin
  Objeto.GetFromControl;
  //<LOLS 20 ABR 2006>
  if Objeto.CVE_TIPO_REPORTE.AsString = '' then
    ShowMessage('Favor de seleccionar una opción')
  else
    pcPrincipal.ActivePageIndex := 1;
  //
  {
  If Objeto.CVE_TIPO_REPORTE.AsString = coANEXO1 Then
    pcPrincipal.ActivePageIndex := 2
  Else
    pcPrincipal.ActivePageIndex := 1;
  }
  //</LOLS>
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 2    Fecha de Corte                            |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.edF_CORTEChange(Sender: TObject);
begin
   Objeto.ExcelLoader.vlFecha:= Objeto.F_CORTE.AsDateTime;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 2    Edit Disposición                          |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.cbComAnualClick(Sender: TObject);
begin
  if cbComAnual.Checked then
  begin
      edID_CREDITO.ReadOnly:= False;
      edID_CREDITO.Color:= clWindow;
      btID_CREDITO.Enabled:= True;
      cbID_CREDITO.Enabled:= True;
      Objeto.F_CORTE.AsString := DateToStr(Objeto.Apli.DameFechaEmpresa);
  end else begin
      edID_CREDITO.ReadOnly:= True;
      edID_CREDITO.Color:= clBtnFace;
      btID_CREDITO.Enabled:= False;
      cbID_CREDITO.Enabled:= False;
      Objeto.F_CORTE.AsString := DameFechaAnexo2(Objeto.Apli.DameFechaEmpresa);
  end;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 2    Edit Disposición                          |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.edID_CREDITOChange(Sender: TObject);
begin
   If Trim(edID_CREDITO.Text)<>'' Then Begin
      cbID_CREDITO.Checked:=True;
      cbID_CREDITO.Enabled:=True;
   End Else Begin
      cbID_CREDITO.Checked:=False;
      cbID_CREDITO.Enabled:=False;
   End;
end;
//
procedure TwMGenArch.edID_CREDITOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CREDITO,True,'',True);
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 2   Boton Disposición                          |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.btID_CREDITOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMGENARCH_DISP',True,True) then
   begin
     Objeto.CrCredito.ShowAll := True;
     If Objeto.CrCredito.Busca Then Begin
        cbID_CREDITO.Checked:=True;
        cbID_CREDITO.Enabled:=True;
        InterForma1.NextTab(edID_CREDITO);
     End;
   end;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 2   InterLinkIt Disposición                    |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
begin
   If (Objeto.CVE_TIPO_REPORTE.AsString  = coANEXO3 )Or
      (Objeto.CVE_TIPO_REPORTE.AsString  = coRPAGAN )Or
      ((Objeto.CVE_TIPO_REPORTE.AsString = coANEXO2 )and(cbComAnual.Checked))Then
      Show:= True
   Else Show:= False;
end;
//
procedure TwMGenArch.ilID_CREDITOEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ilID_CREDITO.Buffer]) Then Begin
      cbID_CREDITO.Checked:=True;
      cbID_CREDITO.Enabled:=True;
      InterForma1.NextTab(edID_CREDITO);
   End;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 2   CheckBox Disposición                       |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.cbID_CREDITOClick(Sender: TObject);
begin
   EnableCheckBox(cbID_CREDITO);
   If not cbID_CREDITO.Checked Then Begin
      Objeto.CrCredito.Active:=False;
      edDESC_CREDITO.Text:='';
   End;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 2    Edit Acreditado                           |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.edID_ACREDITADOChange(Sender: TObject);
begin
   If Trim(edID_ACREDITADO.Text)<>'' Then Begin
      cbxID_ACREDITADO.Checked:=True;
      cbxID_ACREDITADO.Enabled:=True;
   End Else Begin
      cbxID_ACREDITADO.Checked:=False;
      cbxID_ACREDITADO.Enabled:=False;
   End;
end;
//
procedure TwMGenArch.edID_ACREDITADOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_ACREDITADO,True,'',True);
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 2    Boton Acreditado                          |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.btnID_ACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMGENARCH_ACRED',True,True) then
   begin
     Objeto.Acreditado.ShowAll := True;
     If Objeto.Acreditado.Busca Then Begin
        cbxID_ACREDITADO.Checked:=True;
        cbxID_ACREDITADO.Enabled:=True;
        InterForma1.NextTab(edID_ACREDITADO);
     End;
   end;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 2    InterLinkIt Acreditado                    |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.ilID_ACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   If Objeto.CVE_TIPO_REPORTE.AsString = coANEXO3 Then
      Show:= True
   Else Show:= False;
end;
//
procedure TwMGenArch.ilID_ACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Acreditado.FindKey([ilID_ACREDITADO.Buffer]) Then Begin
      cbxID_ACREDITADO.Checked:=True;
      cbxID_ACREDITADO.Enabled:=True;
      InterForma1.NextTab(edID_ACREDITADO);
   End;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 2    Check Box Acreditado                      |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.cbxID_ACREDITADOClick(Sender: TObject);
begin
   EnableCheckBox(cbxID_ACREDITADO);
   If not cbxID_ACREDITADO.Checked Then Begin
      Objeto.Acreditado.Active:=False;
      edDESC_ACREDITADO.Text:='';
   End;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 2    Edit Motivo Liquidacion                   |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.edCVE_MOTIVO_LIQChange(Sender: TObject);
begin
   If Trim(edID_ACREDITADO.Text)<>'' Then Begin
      cbxCVE_MOTIVO_LIQ.Checked:=True;
      cbxCVE_MOTIVO_LIQ.Enabled:=True;
   End Else Begin
      cbxCVE_MOTIVO_LIQ.Checked:=False;
      cbxCVE_MOTIVO_LIQ.Enabled:=False;
   End;
end;
//
procedure TwMGenArch.edCVE_MOTIVO_LIQExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_MOTIVO_LIQ,  True,  '',  True );
end;

{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 2    Boton Motivo Liquidacion                  |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.btCVE_MOTIVO_LIQClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMGENARCH_MTLIQ',True,True) then
   begin
     Objeto.MotivoLiq.ShowAll := True;
     If Objeto.MotivoLiq.Busca then begin
        cbxCVE_MOTIVO_LIQ.Checked := True;
        cbxCVE_MOTIVO_LIQ.Enabled := True;
        InterForma1.NextTab(edCVE_MOTIVO_LIQ);
     end;
   end;
end;
//
procedure TwMGenArch.btCVE_MOTIVO_LIQExit(Sender: TObject);
begin
    InterForma1.ValidaExit( edCVE_MOTIVO_LIQ, True, '', True );
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 2    Boton Liquidacion                         |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.cbxCVE_MOTIVO_LIQClick(Sender: TObject);
begin
   EnableCheckBox(cbxCVE_MOTIVO_LIQ);
   If not cbxCVE_MOTIVO_LIQ.Checked Then Begin
      Objeto.MotivoLiq.Active := False;
      edDESC_MOTIVO_LIQ.Text  := '';
   End;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 2    Boton Liquidacion                         |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.ikCVE_MOTIVO_LIQCapture(Sender: TObject; var Show: Boolean);
begin
   If Objeto.CVE_TIPO_REPORTE.AsString = coRPAGAN Then
      Show:= True
   Else
      Show:= False;
end;
//
procedure TwMGenArch.ikCVE_MOTIVO_LIQEjecuta(Sender: TObject);
begin
   If Objeto.MotivoLiq.FindKey(['CPPAML', ikCVE_MOTIVO_LIQ.Buffer]) Then Begin
      cbxCVE_MOTIVO_LIQ.Checked := True;
      cbxCVE_MOTIVO_LIQ.Enabled := True;
      InterForma1.NextTab(edCVE_MOTIVO_LIQ);
   End;
end;
{}
procedure TwMGenArch.rgLiquidacionClick(Sender: TObject);
begin
  Objeto.TIPO_LIQUIDACION.GetFromControl;
  ieIMP_PREPAGO.Enabled := ( Objeto.TIPO_LIQUIDACION.AsString = coPARCIAL );
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 2    Boton Siguiente                           |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.btnPestDosSigClick(Sender: TObject);
var sLastDay   : String;
    FCorte     : TDate;
    vlNextPage : Boolean;
    sSQLString : String;
    sSQLFD000  : String;
    qSQLPagan  : TQuery;
begin
   Objeto.GetFromControl;
   //
   vlNextPage := True;
   //<LOLS 20 ABR 2006>
   If (Objeto.CVE_TIPO_REPORTE.AsString = coANEXO1 ) Then
   Begin
      If Objeto.F_CORTE.AsString = '' Then
      Begin
         ShowMessage('Debe seleccionar una fecha de corte');
         vlNextPage := False;
      End;
   End;
   //</LOLS>
   //
   If ( Objeto.CVE_TIPO_REPORTE.AsString = coANEXO2 ) Then
   Begin
      If Objeto.F_CORTE.AsString = '' Then
      Begin
         ShowMessage('Debe seleccionar una fecha de corte');
         vlNextPage := False;
      End;
      //
      GetSQLStr('SELECT LAST_DAY(' + SQLFecha( Objeto.F_CORTE.AsDateTime) + ' ) F_CORTE FROM DUAL',
                Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'F_CORTE', sLastDay, True );
      FCorte := StrToDate( sLastDay );
      if Objeto.F_CORTE.AsDateTime <> FCorte then
      begin
        if cbComAnual.Checked = False then
        begin
            ShowMessage('La fecha de corte debe ser fin de mes o en caso contrario debe ' + coCRLF +
                        'seleccionar la opción "Pago de comisión x solicitud de garantía".'   );
            vlNextPage := False;
        end else begin
            If Objeto.ID_CREDITO.AsInteger <= 0 then
            begin
              ShowMessage('Debe seleccionar una disposición');
              vlNextPage := False;
            end;//ends_if
        end;//ends_if
      end;//ends_if
      //
   End;
   //
   //
   If ( Objeto.CVE_TIPO_REPORTE.AsString = coRPAGAN ) Then
   Begin
      If Objeto.F_CORTE.AsString = '' Then
      Begin
         ShowMessage('Debe seleccionar una fecha de corte');
         vlNextPage := False;
      End;
      //
      If Objeto.ID_CREDITO.AsInteger <= 0 then
      begin
        ShowMessage('Debe seleccionar una disposición');
        vlNextPage := False;
      end;
      //
      //<LOLS 25 MAY 2006 VALIDACION FECHA DE CORTE>
      if vlNextPage then
      Begin
          sSQLFD000  := SQLFecha( Objeto.Apli.DameFechaEmpresa );
          sSQLString := Format( coSQLPagAnt, [ sSQLFD000,
                                               SQLFecha( Objeto.F_CORTE.AsDateTime ),
                                               Objeto.ID_CREDITO.AsInteger,
                                               sSQLFD000,
                                               Objeto.ID_CREDITO.AsInteger,
                                               sSQLFD000 ] );
          qSQLPagan := GetSQLQuery( sSQLString, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
          If qSQLPagan <> nil then
          Begin
            qSQLPagan.First;
            if ( qSQLPagan.FieldByName('B_FCORTE').AsString <> 'V' ) then
            Begin
              ShowMessage('La fecha de corte no puede ser menor a hoy');
              vlNextPage := False;
            End;
            //
            if ( qSQLPagan.FieldByName('B_FVENTTO').AsString <> 'V' ) then
            Begin
              ShowMessage('La fecha de corte no puede ser mayor o igual a la fecha de vencimiento del período actual');
              vlNextPage := False;
            End;
          End Else
          Begin
            ShowMessage('Error al obtener los datos de validación para pago anticipado');
            vlNextPage := False;
          End;
      End;
      //</LOLS>
      //
      If Objeto.CVE_MOTIVO_LIQ.AsString = '' then
      begin
        ShowMessage('Debe especificar el motivo de la liquidación');
        vlNextPage := False;
      end;
      //
      If Objeto.TIPO_LIQUIDACION.AsString = '' then
      Begin
        ShowMessage('Debe especificar el tipo de liquidación');
        vlNextPage := False;
      end;
      //
      Objeto.IMP_PREPAGO.GetFromControl;
      If ( Objeto.TIPO_LIQUIDACION.AsString = coPARCIAL ) AND
         ( Objeto.IMP_PREPAGO.AsFloat <= 0 ) then
      begin
        ShowMessage('Debe especificar el monto de pago a capital');
        vlNextPage := False;
      end;
   End;
   //
   If ( Objeto.CVE_TIPO_REPORTE.AsString = coANEXO3 ) Then
   Begin
      If (Objeto.ANIO.AsString = '')Or(Objeto.MES.AsString = '') Then
      Begin
         ShowMessage('Debe seleccionar un año y mes');
         vlNextPage := False;
      End;
   End;
   //
   If vlNextPage then
      pcPrincipal.ActivePageIndex := 2
   Else
      pcPrincipal.ActivePageIndex := 1;
   //ends_if
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 2    Boton Anterior                            |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.btnPestDosAntClick(Sender: TObject);
begin
   pcPrincipal.ActivePageIndex := 0;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 3    On Show del Tab Sheet Archivo             |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.tsArchivoShow(Sender: TObject);
begin
  ObtNombreArch;
  radiobuttonarchivo(Sender);
  Objeto.CVE_TIPO_ENVIO.AsString := coEMail;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 3    Radio Butto Archivo                       |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.radiobuttonarchivo(Sender: TObject);
begin
  btnGenerar.Enabled       := rbGenArch.Checked;
  edNOMBRE_ARCHIVO.Enabled := rbGenArch.Checked;
  //
  edBuscaArch.Enabled      := rbSelectArch.Checked;
  btnBuscaArch.Enabled     := rbSelectArch.Checked;
  //
  if ( rbSelectArch.Checked = false ) and ( Objeto.CrCbFindArch.Active ) then
    Objeto.CrCbFindArch.Active := False;
  //
  if Objeto.CrCbArchi.Active then
    Objeto.CrCbArchi.Active := False;
  //
  lbWarningArchivo.Visible := False;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 3    Botón Genera Archivo                      |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.btnGenerarClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMGENARCH_GENAR',True,True) then
   begin
      Objeto.GetFromControl;
      Objeto.NOMBRE_ARCHIVO.GetFromControl;
      Objeto.CVE_TIPO_REPORTE.GetFromControl;
      //
      Objeto.IMP_TOTAL_ARC.AsFloat  := 0;
      Objeto.IMP_TOTAL_IVA.AsFloat  := 0;
      Objeto.NUM_REGISTRO.AsInteger := 0;
      Objeto.NUM_ENVIO.AsInteger    := 0;
      //
      memInfo.Lines.Add('***************************************************');

      if Objeto.CrCbArchi.Active then
         Objeto.CrCbArchi.Active := False;
      //
      If Objeto.CVE_TIPO_REPORTE.AsString = coANEXO1 Then
          GeneraAnexo1
      Else If Objeto.CVE_TIPO_REPORTE.AsString  = coANEXO2 Then
    // < / RABA > SEP 2011
    // SE CAMBIA LA GENERACION DEL ANEXO 2
      //      GeneraAnexo2
          GeneraAnexo2_A
    // < RABA />
      Else If Objeto.CVE_TIPO_REPORTE.AsString  = coANEXO3 Then
          GeneraAnexo3
      Else If (Objeto.CVE_TIPO_REPORTE.AsString = coRPAGAN ) Then Begin
          if Objeto.LlamaDetalle then
             GeneraPagosAnt;
      End;

      If iFolio <> 0 Then Begin
         Objeto.CrCbArchi.FindKey( [ Self.iFolio ] );
      End;
   end;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 3    Radio Butto Archivo                       |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.btnBuscaArchClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMGENARCH_SELAR',True,True) then
   begin
      Objeto.CVE_TIPO_REPORTE.GetFromControl;
      Objeto.CrCbFindArch.BuscaWhereString  :=
                        ' CR_CB_ARCHIVO.CVE_ANEXO = ''' + Objeto.CVE_TIPO_REPORTE.AsString + '''' ;
      If Objeto.CrCbFindArch.Busca Then
      begin
        Objeto.CrCbArchi.FindKey([ Objeto.CrCbFindArch.ID_ARCHIVO.AsString ]);
        lbWarningArchivo.Visible := ( Objeto.CrCbFindArch.SIT_ARCHIVO.AsString = 'EN' );
      end;//Ends_if
   end;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 3    Edit Id Archivo                           |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.edID_ARCHIVOChange(Sender: TObject);
begin
  btnSigArchivo.Enabled := ( trim( edID_ARCHIVO.Text ) <> '' ) and
                           ( ( Objeto.CVE_TIPO_ENVIO.AsString = coEMAIL ) or
                             ( ( Objeto.CVE_TIPO_ENVIO.AsString = coPORTAL ) and
                               ( trim( edNbrArch.Text ) <> '' )
                             )
                            );
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 3    Tipo de Envío                             |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.rgTipoEnvioClick(Sender: TObject);
begin
  Objeto.CVE_TIPO_ENVIO.GetFromControl;
  sbPathFileName.Enabled := ( Objeto.CVE_TIPO_ENVIO.AsString = coPORTAL );
  btnSigArchivo.Enabled := ( trim( edID_ARCHIVO.Text ) <> '' ) and
                           ( ( Objeto.CVE_TIPO_ENVIO.AsString = coEMAIL ) or
                             ( ( Objeto.CVE_TIPO_ENVIO.AsString = coPORTAL ) and
                               ( trim( edNbrArch.Text ) <> '' )
                             )
                            );
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 3    Nombre de archivo a generar               |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.sbPathFileNameClick(Sender: TObject);
begin
  if sdGenArch.FileName = '' then
     sdGenArch.FileName := sdGenArch.InitialDir + Objeto.CrCbArchi.TX_NOM_ARCHIVO.AsString;
  //

  if sdGenArch.Execute then
  begin
    edNbrArch.Text := sdGenArch.FileName;
    btnSigArchivo.Enabled := ( trim( edID_ARCHIVO.Text ) <> '' ) and
                               ( ( Objeto.CVE_TIPO_ENVIO.AsString = coEMAIL ) or
                               ( ( Objeto.CVE_TIPO_ENVIO.AsString = coPORTAL ) and
                                 ( trim( edNbrArch.Text ) <> '' )
                               )
                             );
  end;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 3    Botón Siguiente                           |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.btnSigArchivoClick(Sender: TObject);
var bContinua: Boolean;
begin
   lbStatCargaArch.Caption:= 'Leyendo Archivo...';
   Application.ProcessMessages;
   If Objeto.CrCbArchi.ID_ARCHIVO.AsInteger > 0 Then Begin
      bContinua:= True;
      If (Objeto.CrCbArchi.SIT_ARCHIVO.AsString = 'EN')Then Begin
         bContinua:= False;
         If MessageDlg('El Archivo ya ha sido enviado, desea enviarlo de nuevo',
                   mtInformation, [mbCancel, mbOK], 0) = mrOK Then
            bContinua:= True;
      End;
      If bContinua Then Begin
         sNombreArchivo := Trim(recArchivo());
         iFolio:= Objeto.CrCbArchi.ID_ARCHIVO.AsInteger;
         If sNombreArchivo<>'' Then
         begin
           if Objeto.CVE_TIPO_ENVIO.AsString = coEMAIL then
             pcPrincipal.ActivePageIndex := 3
           else if Objeto.CVE_TIPO_ENVIO.AsString = coPORTAL then
           begin
             //
             if CopyFilePYME( sNombreArchivo, edNbrArch.Text ) then
             begin
               Objeto.stpActSitArchivo(Self.iFolio);
               Self.iFolio:= 0;
               MessageDlg('Archivo generado exitosamente' + coCRLF +
                          edNbrArch.Text, mtInformation,  [mbOk], 0);
               If FileExists(sNombreArchivo) then Begin
                  DeleteFile(sNombreArchivo)
               End;
               LimpiaDatos;
               pcPrincipal.ActivePageIndex:=0;
             end else
               MessageDlg('Ocurrió un error al generar el archivo. Avise a sistemas.', mtError, [mbOk], 0);
             //
           end;
           //
         end;
      End;
   End Else Begin
      ShowMessage('Debe seleccionar un Archivo para enviar');
   End;
   lbStatCargaArch.Caption:= ' ';
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 3    Botón Anterior                            |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.btnPestTresAntClick(Sender: TObject);
begin
   Objeto.CVE_TIPO_REPORTE.GetFromControl;
   If Objeto.CVE_TIPO_REPORTE.AsString = coANEXO1 Then
      pcPrincipal.ActivePageIndex:=0
   Else
      pcPrincipal.ActivePageIndex:=1;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 4    Botón Correo                              |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.BitCorreoClick(Sender: TObject);
Var
  T:TInterFindit;
begin
  T := Objeto.CreaBuscador('ICORARCH.IT','F,S');
  Try
    T.WhereString:= ' ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa) +
                    ' AND CVE_CORREO_FMT = '''+ Objeto.CVE_TIPO_REPORTE.AsString+''''+
                    ' AND SIT_CORREO = ''AC''';

    If T.Execute then Begin
      edIdEmpresa.Text:= T.DameCampo(0);
      edIdCorreo.Text:= T.DameCampo(1);
      edPara.Text:= T.DameCampo(2);
      edConCopia.Text:= T.DameCampo(3);
      edAsunto.Text:=T.DameCampo(4);
      mMensaje.Lines.Text:=T.DameCampo(5);
    End;
  finally
    T.Free;
  end;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 4    Botón Correo Nuevo                        |
+ -----------------------------------------------------------------------------+
}
procedure TwMGenArch.BitNvoCorreoClick(Sender: TObject);
begin
  edIdCorreo.Text:='';
  edIdEmpresa.Text:='';
  edPara.Text:='';
  edConCopia.Text:='';
  edAsunto.Text:='';
  mMensaje.Lines.Clear;
end;


procedure TwMGenArch.btnEnviarClick(Sender: TObject);
Var sMensaje:String;
begin
   if Objeto.ValidaAccesoEsp('TMGENARCH_ENVIA',True,True) then
   begin
       If enviaCorreo Then Begin
          Objeto.stpActSitArchivo(Self.iFolio);
          Self.iFolio:= 0;
          sMensaje:= 'Archivo enviado exitosamente';
          Application.MessageBox( PCHAR(sMensaje),  'Envío de Archivo', 0);
          If FileExists(sNombreArchivo) then Begin
             DeleteFile(sNombreArchivo)
          End;
          LimpiaDatos;
          pcPrincipal.ActivePageIndex:=0;
       End;
   end;
end;

procedure TwMGenArch.GeneraAnexo2_A;
Var
   F  : TextFile;
   qyQuery      : TQuery;
   bContinua    : Boolean;
   sBExiste     : String;
   sSqlExiste   : String;
   vlImpCtlBru  : Currency;
   vlImpCtlIVA  : Currency;
   iIdCredito, iIdSolicitud : Integer;
   sSQL, sCadena, sMontos, sPrimeraParte, sSegundaParte : String;
begin
   slLista.Clear;
   Objeto.GetFromControl;
   //
   bContinua   := True;
   Objeto.IMP_TOTAL_ARC.AsFloat  := 0;
   Objeto.IMP_TOTAL_IVA.AsFloat  := 0;
   Objeto.NUM_REGISTRO.AsInteger := 0;
   Objeto.NUM_ENVIO.AsInteger    := 0;
   //
   Objeto.F_CORTE.GetFromControl;
   Objeto.B_PAGO_COM_ANUAL.GetFromControl;

   AssignFile(F, Objeto.PATH_ARCHIVO.AsString + Objeto.NOMBRE_ARCHIVO.AsString);
   Rewrite(F);

   If Objeto.F_CORTE.AsDateTime > 0 Then Begin
      sBExiste := 'F';
///// PASO 1
      // SI ES EL CALCULO DE LA COMISIÓN ANUAL DE UN CREDITO SE VALIDA QUE YA EXISTA LA INFORMACIÓN
      // SI NO EXISTE SE CARGA
      if Objeto.B_PAGO_COM_ANUAL.AsString = 'V' then
      begin
         sSqlExiste := 'SELECT (CASE WHEN COUNT(*) = 0 THEN ''F'' ELSE ''V'' END) B_CARGA ' + coCRLF +
                       ' FROM CR_CB_SDO_CARTRA WHERE F_CORTE = ' + coCRLF +
                       SQLFecha(Objeto.F_CORTE.AsDateTime) + coCRLF +
                       ' AND ID_CREDITO = ' + Objeto.ID_CREDITO.AsString;
         GetSQLStr( sSqlExiste, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'B_CARGA',
                    sBExiste,   False );
         If sBExiste = 'F' Then  // NO EXISTE INFORMACIÓN POR LO CUAL SE DEBE GENERAR
            If Not Objeto.GeneraComAnual then
               exit;
      end
      else
      // EN CASO DE CALCULO DE COMISIÓN MENSUAL SE EJECUTA LA RECARGA ANTES DE GENERAR ALGUN ARCHIVO
        If Not Objeto.stpCargaComPYME Then
           exit;
///// PASO 2
      // LA INFORMACIÓN EXISTE
      // SE EJECUTA LA CARGA DE PAGOS DE COMISION (TRANSACCIONES DE PAGO)
      // SOLO PARA LOS REGISTROS DE CR_CB_SDO_CARTRA CON SITUACCION "AC"
      // EJECUCION DE PAQUETE
      If Not Objeto.stpTransacPagoComPYME then
         exit;
///// PASO 3
      // SE GENERA EL ANEXO 2
      // CON REGISTROS DE CR_CB_SDO_CARTRA CON SITUACION "EP" (EN PROCESO)
      //
      sMontos :=  '';
      sSQL    := FormaQuery(Objeto.CVE_TIPO_REPORTE.AsString);
      qyQuery := GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      qyQuery.SQL.SaveToFile('c:\queryAnexo2.txt');   // RABA 18/08/2011   QUITAR
      If qyQuery <> Nil Then
      Begin
         qyQuery.First;
         While not qyQuery.Eof Do
         Begin
            sPrimeraParte:= qyQuery.FieldByName('CVE_INTER_FINAN').AsString  + '@' +
                            qyQuery.FieldByName('ID_CREDITO').AsString       + '@';
            //
            sSegundaParte:= qyQuery.FieldByName('IMP_COMISION').AsString     + '@' +
                            qyQuery.FieldByName('IMP_IVA_COMISION').AsString + '@' +
                            qyQuery.FieldByName('TOTAL').AsString            + '@' +
                            qyQuery.FieldByName('SDO_ACRED').AsString        + '@' +
                            qyQuery.FieldByName('MORA').AsString + '@' +
                            //Nuevos requerimientos MAGV 20101001
                            '0.00@' + //Saldos al corte
                            '0.00@' + //Suma Disposiciones
                            '@' + //Fecha de Otorgamiento
                            '@'; //Calificación Variable

            if qyQuery.FieldByName('STAGAR').AsString = '1' then
            begin
                 if  StrToInt(copy(qyQuery.FieldByName('F_LIQUIDACION').AsString,0,6))  <=  StrToInt(FormatDateTime('YYYYMM',Objeto.F_CORTE.AsDateTime)) then
                    sSegundaParte:= sSegundaParte +
                                    qyQuery.FieldByName('STAGAR').AsString + '@' + //Status de garantías
                                    qyQuery.FieldByName('F_LIQUIDACION').AsString + '@' //Fecha de liquidación
                 else
                    sSegundaParte:= sSegundaParte + '@' + '@'; //Fecha de liquidación
            end
            else
               sSegundaParte:= sSegundaParte +
                               qyQuery.FieldByName('STAGAR').AsString + '@' + //Status de garantías
                               qyQuery.FieldByName('F_LIQUIDACION').AsString + '@'; //Fecha de liquidación

            //
            sMontos      := sMontos  + qyQuery.FieldByName('MOVIMIENTOS').AsString;
            //
            vlImpCtlBru  := qyQuery.FieldByName('IMP_COMISION').AsFloat;
            vlImpCtlIVA  := qyQuery.FieldByName('IMP_IVA_COMISION').AsFloat;
            //
            iIdCredito   := qyQuery.FieldByName('ID_CREDITO').AsInteger;
            iIdSolicitud := qyQuery.FieldByName('FOLIO_CORTE').AsInteger;
            //
            qyQuery.Next;
            //
            If ( iIdCredito <> qyQuery.FieldByName('ID_CREDITO').AsInteger ) Or qyQuery.Eof Then
            Begin
               sCadena := sPrimeraParte + sMontos + #64 + sSegundaParte;
               slLista.Add(sCadena);
               Writeln(F, sCadena);
               Objeto.IMP_TOTAL_ARC.AsFloat  := Objeto.IMP_TOTAL_ARC.AsFloat  + vlImpCtlBru;
               Objeto.IMP_TOTAL_IVA.AsFloat  := Objeto.IMP_TOTAL_IVA.AsFloat  + vlImpCtlIVA;
               Objeto.NUM_REGISTRO.AsInteger := Objeto.NUM_REGISTRO.AsInteger + 1;
               //
               sMontos     := '';
            End;
         End;//Ends_While_not_qyQuery.Eof_Do
         qyQuery.Free;
         bContinua := True;
      End;//Ends_If_qyQuery_<>_Nil_Then

//////-------------------------------------////////////////////////////////////
   End Else Begin
      ShowMessage('Debe seleccionar una Fecha de Corte');
      bContinua:= False;
   End;
   CloseFile(F);
   //
   If bContinua Then
      bContinua := GuardaArch;
   //
   If not bContinua Then
     MessageDlg( 'El Archivo no se insertó en la base de datos.' + coCRLF +
                 'Probablemente no existe información a generar.' + coCRLF +
                 'Avise a sistemas', mtError, [mbOK], 0 )
   Else
   begin
     // se cambia el estatus de CR_CB_SDO_CARTRA = 'EN'
     If Not Objeto.stpAfectaSitSdo then
        ShowMessage('Proceso Incompleto (No se actualizaron Situaciones="EN")!!!! '+': el archivo se guardó con el Folio No. '+ IntToStr(iFolio))
     else
        ShowMessage('Proceso Terminado'+': el archivo se guardó con el Folio No. '+ IntToStr(iFolio));
   end;
end;

function TMGenArch.stpTransacPagoComPYME: Boolean;
var stpAfectaSdoCartra : TStoredProc;
Begin
  Result := True;
  stpAfectaSdoCartra  := TStoredProc.Create(Nil);
  Try
    stpAfectaSdoCartra.DatabaseName   := Apli.DataBaseName;
    stpAfectaSdoCartra.SessionName    := Apli.SessionName;
    stpAfectaSdoCartra.StoredProcName := 'PKGCRCREDITOO1.STPAFECTASDOCARTRA';
    stpAfectaSdoCartra.Params.Clear;
    stpAfectaSdoCartra.Params.CreateParam(ftDate,    'PEF_CORTE',      ptInput  );
    stpAfectaSdoCartra.Params.CreateParam(ftFloat,   'PEID_CREDITO',   ptInput  );
    stpAfectaSdoCartra.Params.CreateParam(ftDate,    'PEFREFERENCIA',  ptInput  );
    stpAfectaSdoCartra.Params.CreateParam(ftString,  'PECVE_USUARIO',  ptInput  );
    stpAfectaSdoCartra.Params.CreateParam(ftString,  'PEBCOMMIT',      ptInput  );
    stpAfectaSdoCartra.Params.CreateParam(ftFloat,   'PSRESULTADO',    ptOutput );
    stpAfectaSdoCartra.Params.CreateParam(ftString,  'PSTXRESULTADO',  ptOutput );
    //
    stpAfectaSdoCartra.ParamByName( 'PEF_CORTE'      ).AsDate    := F_CORTE.AsDateTime;
    if B_PAGO_COM_ANUAL.AsString = 'V' then
       stpAfectaSdoCartra.ParamByName( 'PEID_CREDITO'   ).AsInteger := ID_CREDITO.AsInteger
    else
       stpAfectaSdoCartra.ParamByName( 'PEID_CREDITO'   ).Clear;
    stpAfectaSdoCartra.ParamByName( 'PEFREFERENCIA'  ).AsDate    := Apli.DameFechaEmpresa;
    stpAfectaSdoCartra.ParamByName( 'PECVE_USUARIO'  ).AsString  := Apli.Usuario;
    stpAfectaSdoCartra.ParamByName( 'PEBCOMMIT'      ).AsString  := 'V';
    stpAfectaSdoCartra.ParamByName( 'PSRESULTADO'    ).AsInteger := 0;
    stpAfectaSdoCartra.ParamByName( 'PSTXRESULTADO'  ).AsString  := '';
    //
    stpAfectaSdoCartra.ExecProc;
    if stpAfectaSdoCartra.ParamByName( 'PSRESULTADO' ).AsInteger <> 0 then
    begin
      Result := False;
      MessageDlg( 'Error al generar transacciones de pago ' + #13#10 +
                  'Código:' + IntToStr(stpAfectaSdoCartra.ParamByName( 'PSRESULTADO' ).AsInteger) + #13#10 +
                  'Msg:'    + stpAfectaSdoCartra.ParamByName( 'PSTXRESULTADO'  ).AsString,
                  mtWarning, [mbOk], 0 );
    end;
  finally
    stpAfectaSdoCartra.Free;
  end;
  //
end;

function TMGenArch.stpAfectaSitSdo: Boolean;
var stpAfectaSituacion : TStoredProc;
Begin
  Result := True;
  stpAfectaSituacion  := TStoredProc.Create(Nil);
  Try
    stpAfectaSituacion.DatabaseName   := Apli.DataBaseName;
    stpAfectaSituacion.SessionName    := Apli.SessionName;
    stpAfectaSituacion.StoredProcName := 'PKGCRCREDITOO1.STPACTSITCARTRA';
    stpAfectaSituacion.Params.Clear;
    stpAfectaSituacion.Params.CreateParam(ftDate,    'PEF_CORTE',      ptInput  );
    stpAfectaSituacion.Params.CreateParam(ftFloat,   'PEID_CREDITO',   ptInput  );
    stpAfectaSituacion.Params.CreateParam(ftString,  'PECVE_USUARIO',  ptInput  );
    stpAfectaSituacion.Params.CreateParam(ftString,  'PEBCOMMIT',      ptInput  );
    stpAfectaSituacion.Params.CreateParam(ftFloat,   'PSRESULTADO',    ptOutput );
    stpAfectaSituacion.Params.CreateParam(ftString,  'PSTXRESULTADO',  ptOutput );
    //
    stpAfectaSituacion.ParamByName( 'PEF_CORTE'      ).AsDate    := F_CORTE.AsDateTime;
    if B_PAGO_COM_ANUAL.AsString = 'V' then
       stpAfectaSituacion.ParamByName( 'PEID_CREDITO'   ).AsInteger := ID_CREDITO.AsInteger
    else
       stpAfectaSituacion.ParamByName( 'PEID_CREDITO'   ).Clear;
    stpAfectaSituacion.ParamByName( 'PECVE_USUARIO'  ).AsString  := Apli.Usuario;
    stpAfectaSituacion.ParamByName( 'PEBCOMMIT'      ).AsString  := 'V';
    stpAfectaSituacion.ParamByName( 'PSRESULTADO'    ).AsInteger := 0;
    stpAfectaSituacion.ParamByName( 'PSTXRESULTADO'  ).AsString  := '';
    //
    stpAfectaSituacion.ExecProc;
    if stpAfectaSituacion.ParamByName( 'PSRESULTADO' ).AsInteger <> 0 then
    begin
      Result := False;
      MessageDlg( 'Error al generar transacciones de pago ' + #13#10 +
                  'Código:' + IntToStr(stpAfectaSituacion.ParamByName( 'PSRESULTADO' ).AsInteger) + #13#10 +
                  'Msg:'    + stpAfectaSituacion.ParamByName( 'PSTXRESULTADO'  ).AsString,
                  mtWarning, [mbOk], 0 );
    end;
  finally
    stpAfectaSituacion.Free;
  end;
  //
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 5    Boton Anterior                            |
+ -----------------------------------------------------------------------------+
RABA SEP 2011
}
procedure TwMGenArch.btnPestCincoAntClick(Sender: TObject);
begin
   pcPrincipal.ActivePageIndex := 1;
end;
{
+ -----------------------------------------------------------------------------+
|                   Pestaña No. 1    Boton Bitácora Anexo 2                    |
+ -----------------------------------------------------------------------------+
RABA SEP 2011
}
procedure TwMGenArch.btnBitacoraAnexo2Click(Sender: TObject);
var
  sqlText : String;
  Q : TQuery;
begin
   if Objeto.ValidaAccesoEsp('TMGENARCH_BITAV',True,True) then
   begin
      Objeto.F_CORTE.GetFromControl;
      SGCBitacoraAnexo2.Clear('');
      sqlText := 'SELECT F_CORTE,         ' + coCRLF +
                 '       ID_CREDITO,      ' + coCRLF +
                 '       FOLIO_BIT,       ' + coCRLF +
                 '       TX_OBSERVACION,  ' + coCRLF +
                 '       B_PROCESADO,     ' + coCRLF +
                 '       CVE_USU_ALTA,    ' + coCRLF +
                 '       FH_ALTA          ' + coCRLF +
                 '  FROM CR_CB_BIT_CARTRA ' + coCRLF +
                 ' WHERE F_CORTE = ' +  SQLFecha( Objeto.F_CORTE.AsDateTime ) + coCRLF +
                 ' ORDER BY ID_CREDITO, FOLIO_BIT ' + coCRLF;
      Q :=  GetSQLQuery(sqlText,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
      try
           if Q <> nil then
           begin
               //COLUMNAS OCULTAS

               //ASIGNACION DE ETIQUETAS
               Q.FieldByName('F_CORTE').DisplayLabel := 'Fecha Corte' + #30 +'>C';
               Q.FieldByName('ID_CREDITO').DisplayLabel := 'Crédito' + #30 +'>C';
               Q.FieldByName('FOLIO_BIT').DisplayLabel := 'Folio Bit' + #30 +'>C';
               Q.FieldByName('TX_OBSERVACION').DisplayLabel := 'Observación' + #30 +'>C';
               Q.FieldByName('B_PROCESADO').DisplayLabel := 'Procesado' + #30 +'>C';
               Q.FieldByName('CVE_USU_ALTA').DisplayLabel := 'Usuario Alta' + #30 +'>C';
               Q.FieldByName('FH_ALTA').DisplayLabel := 'Fecha Hora Ejecución' + #30 +'>C';

               //ASIGNACION DE MASCARAS DE EDICION
               TDateField(Q.FieldByName('F_CORTE')).DisplayFormat := 'DD/MM/YYYY';
               TDateField(Q.FieldByName('FH_ALTA')).DisplayFormat := 'DD/MM/YYYY HH:MM:SS';

               //ASIGNACION DE LONGITUD DE COLUMNAS
               Q.FieldByName('F_CORTE').DisplayWidth := 11;
               Q.FieldByName('ID_CREDITO').DisplayWidth := 8;
               Q.FieldByName('FOLIO_BIT').DisplayWidth := 8;
               Q.FieldByName('TX_OBSERVACION').DisplayWidth := 30;
               Q.FieldByName('B_PROCESADO').DisplayWidth := 8;
               Q.FieldByName('CVE_USU_ALTA').DisplayWidth := 11;
               Q.FieldByName('FH_ALTA').DisplayWidth := 16;
               SGCBitacoraAnexo2.Titulo1 := 'Bitácora de Proceso para Anexo2 NAFIN';
               SGCBitacoraAnexo2.addQry(Q,True,True,-1,-1,-1,True);
           end
           else
               SGCBitacoraAnexo2.Clear('No hay información disponible');
          //end if
      finally
         if Q<>nil then Q.free;
      end;
      // se activa la página
      pcPrincipal.ActivePageIndex := 4;
   end;
end;

end.


