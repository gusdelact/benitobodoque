// Sistema         : Clase de CRARCHSAT
// Fecha de Inicio : 09/03/2004
// Función forma   : Clase de CRARCHSAT
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa      
// Comentarios     : Adecuaciones Enero-Febrero 20190 para ejercicio 2009 Ana Lilia Escalona Sosa
Unit IntCrArchSAT;

interface                       

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid, IntLinkit,
//Unidades Adicionales
IntEmpre, IntGenCre, Tabs, DBGrids, IntParamCre,
ComObj,IntXls, InterEdit
//
,IntSatCrLay, IntDomConver, IntCrSATAdc, Menus
;

Type
 TCrarchsat= class;

  TWCrarchsat=Class(TForm)
    InterForma1             : TInterForma;
    edEJERCICIO: TEdit;
    lbLiqF_INICIO: TLabel;
    btBUSCA: TBitBtn;
    Label25: TLabel;
    edID_EMPRESA: TEdit;
    btEMPRESA: TSpeedButton;
    edNOM_EMPRESA: TEdit;
    ilEMPRESA: TInterLinkit;
    edRFC_EMPRESA: TEdit;
    lbRFC_EMPRESA: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    SpeedButton7: TSpeedButton;
    sagDATOS: TStringAlignGrid;
    btnGenArchivo: TBitBtn;
    EDRUTA: TEdit;
    MErrores: TMemo;
    OpenDialogXLS: TOpenDialog;
    TabSheet2: TTabSheet;
    QrySaldoInicial: TQuery;
    QryPeriodosInteres: TQuery;
    QueryMoratorios: TQuery;
    desarrollo: TQuery;
    QryDesglosCap: TQuery;
    QryDesgloseComision: TQuery;
    dscDataQry: TDataSource;
    DBGrid1: TDBGrid;
    TabSet1: TTabSet;
    QryPagEnero: TQuery;
    btnMuestra: TButton;
    QrySatCreLayout: TQuery;
    edDirectory: TEdit;
    lbDirectory: TLabel;
    btnGenera: TButton;
    opID_CREDITO: TRadioButton;
    opGenerarTodos: TRadioButton;
    ProgressBar1: TProgressBar;
    grbxTipoDeclaracion: TGroupBox;
    opNormal: TRadioButton;
    Label1: TLabel;
    opComplementaria: TRadioButton;
    dtpFechaComplementaria: TDateTimePicker;
    lbFechaComplementaria: TLabel;
    btnGenArchivoXLS: TButton;
    SpeedButton1: TSpeedButton;
    edFileNameExcel: TEdit;
    OpenDialog1: TOpenDialog;
    QryImpCredOtorgados: TQuery;
    edID_CREDITO: TInterEdit;
    QryInteresLiquidado: TQuery;
    Label2: TLabel;
    Button1: TButton;
    TabSheet3: TTabSheet;
    btnGenLayoutSAT: TButton;
    opID_CREDITO2: TRadioButton;
    opGenerarTodos2: TRadioButton;
    edID_CREDITO2: TInterEdit;
    btnRegenDomicilioSAT: TButton;
    PopupMenu1: TPopupMenu;
    DetalleLayout1: TMenuItem;
    DomicilioConvertidoContrato1: TMenuItem;
    DomicilioConvertidoInmueble1: TMenuItem;
    RelacionContratoDomicilios1: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btEMPRESAClick(Sender: TObject);
    procedure btBUSCAClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btnGenArchivoClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    function  ReplaceChar(Cadena, strFind, strReplace : String) : String;
    procedure TabSet1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure btnMuestraClick(Sender: TObject);
    procedure btnGeneraClick(Sender: TObject);
    procedure opNormalClick(Sender: TObject);
    procedure opComplementariaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnGenArchivoXLSClick(Sender: TObject);
    procedure btnGenLayoutSATClick(Sender: TObject);
    procedure sagDATOSSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnRegenDomicilioSATClick(Sender: TObject);
    procedure DetalleLayout1Click(Sender: TObject);
    procedure DomicilioConvertidoContrato1Click(Sender: TObject);
    procedure DomicilioConvertidoInmueble1Click(Sender: TObject);
    procedure RelacionContratoDomicilios1Click(Sender: TObject);
    private
    { Private declarations }
        VGConReg ,
        VGConArch   : Integer;
        vgNomArch   : String;
        function    CadenaSql: String;
        Procedure   MuestraDAtos(pUpdDomicilios:boolean);
        procedure   LimpiaPantalla;
        Procedure   GeneraArchivo;
        procedure   GeneraSumario(parchivo:TStringList; peNUM_EJERCICIO : Integer);
        function    ObtenEncab: string;
        procedure   ObtenNombreArchivo(pRFCInstitucion, pIdInstitucion, pAnio: string);

        procedure MuestraDatosRevision(pestrID_CREDITO : String);
        procedure HabilitaCtrlsComplement(pebHabilita : Boolean);

        procedure ArmaArchivoExcel(peStrFileName : String);

        procedure AsignaSQL_al_Query(peQry : TQuery; peSQL : String);
        procedure GeneraArchivoRevision(pestrID_CREDITO : String; peNUM_EJERCICIO : String);
        function  ObtenSQLQrySaldoInicial(pestrID_CREDITO : String) : String;     //
        function  ObtenSQLQryPeriodosInteres(pestrID_CREDITO, pestrCveOrigenCred : String) : String;  //
        function  ObtenSQLQueryMoratorios(pestrID_CREDITO : String) : String;     //
        function  ObtenSQLQryInteresLiquidado(pestrID_CREDITO : String) : String; // No se ocupa para armar el archivo de EXCEL
        function  ObtenSQLQryDesglosCap(pestrID_CREDITO : String) : String;       //
        function  ObtenSQLQryDesgloseComision(pestrID_CREDITO : String) : String; //
        function  ObtenSQLQryPagEnero(pestrID_CREDITO : String) : String;         // No se ocupa para armar el archivo de EXCEL
        function  ObtenSQLQrySatCreLayout(pestrID_CREDITO : String) : String;     //
        function  ObtenTipoCambio(peFECHA : TDateTime) : Real;                    //
        function  FunArmaLayoutSAT(peID_CREDITO, peNUM_EJERCICIO : Integer; var PPResultado: String): Boolean;

        procedure ActualizaDomConvertido(peID_CREDITO, peNUM_EJERCICIO : Integer; var PPResultado: String);
        // <SATV4766 13Ene2009>
        function  ObtenSQLQryImpCredOtorgadosAcred(peStrIdAcreditado : String) : String;
        // </EASA FEB.2010 obtiene un query generico de todos los acreditados>
        function  ObtenSQLQryImpCredOtorgados : String;
    public
    { Public declarations }
    Objeto : TCrarchsat;
end;
 TCrarchsat= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        ParamCre                 : TParamCre;

        { Public declarations }
        Empresa         : TEmpresa;
        EJERCICIO       : TIntercampo;
        RFC_EMPRESA     : TIntercampo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    ObtenRFCEmpresa : String;
      published
      end;

const
   coCRLF              = #13#10;
   C_TIPO_REG          = 0;  //Tipo de Registro
   C_CONS_REG          = 1;  //Consecutivo Registro
   C_CVE_IDEN          = 2;  //Cve Identificador
   C_RFC_CURP          = 3;  //RFC_CURP
   C_CURP              = 4;  //CURP
   C_NOMBRE_PERSONA    = 5;  //Nombre Titular
   C_APELLIDO_PATERNO  = 6;  //Apellido Paterno
   C_APELLIDO_MATERNO  = 7;  //Apellido Materno
   C_DOM_CALLE         = 8;  //Calle
   C_DOM_NUM_EXT       = 9;  //Número Exterior
   C_DOM_NUM_INT       = 10; //Número Interior
   C_DOM_COLONIA       = 11; //Colonia
   C_DOM_CODIGO_POSTAL = 12; //Codigo Postal
   C_DOM_MUNICIPIO     = 13; //Municipio
   C_DOM_ENTIDAD_FED   = 14; //Entidad Federativa
   C_NUM_CCTO          = 15; //Num Contrato
   C_NUM_FIDE          = 16; //Num Fideicomiso
   C_DEST_CRE          = 17; //Destino Credito
   C_INT_NOMD          = 18; //Intres Nominal
   C_INT_NOMP          = 19; //Interes Pagado
   C_INT_MORD          = 20; //Interes Pagado
   C_INT_MORP          = 21; //InteresMoratorios
   C_INT_REAL          = 22; //Interes Real
   C_SDO_ANT_          = 23; //Saldo ejercicio Año anterior
   C_SDO_CRED          = 24; //Saldo Credito                 COLUMNA "Y"  EXCEL
   C_F_CONTRA          = 25; //Fecha Contrato
   C_PROP_DED          = 26; //Proporción Deducible

   C_DOM_INMU_CALLE         = 27; //Calle
   C_DOM_INMU_NUM_EXT       = 28; //Número Exterior
   C_DOM_INMU_NUM_INT       = 29; //Número Interior
   C_DOM_INMU_COLONIA       = 30; //Colonia
   C_DOM_INMU_CODIGO_POSTAL = 31; //Codigo Postal
   C_DOM_INMU_MUNICIPIO     = 32; //Municipio
   C_DOM_INMU_ENTIDAD_FED   = 33; //Entidad Federativa
   C_PCT_COPR               = 34; //% Copropiedad
   C_NUM_COPR               = 35; //No. propietarios
   C_RFC_COPR               = 36; //RFC o CURP de Copropietarios
   C_NOM_COPR               = 37; //Nombre Copropietario
   C_RFC_CONY               = 38; //RFC Conyuges
   C_NOM_CONY               = 39; //Nombre Conyuges
   C_DOM_CONY               = 40; //Domicilio Conyuges

   C_NOMBRE_T               = 41; //Nombre del Titular (Sin separación)
   C_DOMICI_T               = 42; //Nombre del Domicilio (Sin separación)
   C_DOMICI_INMU            = 43; //Nombre del Domicilio del Imueble (Sin separación)

   C_CVE_SUB_TIP_BCO        = 44; // Clave Subtipo Banco
   C_DESC_SUB_TIPO          = 45; // Subtipo Banco
   C_SUM_IMP_CRED_OTORGADOS = 46; // Importe Total de las disposiciones otorgadas al acreditado en el periodo   COLUMNA "AU" EXCEL
   C_SDO_EJER_ACTUAL        = 47; // Importe del Saldo Insoluto del Ejercicio que se Reporta

   C_IDCREDITO              = 48;  // Credito
   C_IDCONTRATO             = 49;  // Contrato
   C_IDDOM                  = 50;  // ID domicilio
   C_IDDOM_INMU             = 51;  // ID domicilio Inmueble

var vlQry : TQuery;
    vlIDCREDITO_SEL, vlIDCONTRATO_SEL:string;
    vlIDDOM_SEL, vlIDDOMINMU_SEL:string;

implementation


//Uses RepMon;

{$R *.DFM}


constructor TCrarchsat.Create( AOwner : TComponent );
begin Inherited;
      EJERCICIO :=CreaCampo('EJERCICIO',ftInteger,tsNinguno,tsNinguno,False); // SATV4766
                EJERCICIO.Caption:='Ejercicio';
      RFC_EMPRESA :=CreaCampo('RFC_EMPRESA',ftInteger,tsNinguno,tsNinguno,False); // SATV4766
                RFC_EMPRESA.Caption:='RFC_EMPRESA';
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrArchSAT.Hlp';
      ShowMenuReporte:=True;

      {$WARNINGS OFF}
      Empresa := TEmpresa.Create(Self);
      {$WARNINGS ON}      
      Empresa.MasterSource:=Self;
end;

Destructor TCrarchsat.Destroy;
begin
    if Empresa <> nil then
       Empresa.Free;
    inherited;
end;


function TCrarchsat.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrarchsat;
begin
   W:=TWCrarchsat.Create(Self);
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


Function TCrarchsat.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrarchs.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

Function TCrarchsat.ObtenRFCEmpresa : String;
var vlRFC : String;
begin
 Result := '';
 If GetSQLStr('SELECT SIGLAS_RFC || F_RFC || HOMOCLAVE_RFC AS RFC FROM RFC WHERE ID_PERSONA = '+Empresa.ID_EMPRESA.AsString,
              Apli.DatabaseName, Apli.SessionName, 'RFC', vlRFC, True) Then
    Result := vlRFC;
end;

(***********************************************FORMA CRARCHSAT********************)
(*                                                                              *)
(*  FORMA DE CRARCHSAT                                                            *)
(*                                                                              *)
(***********************************************FORMA CRARCHSAT********************)

procedure TWCrarchsat.FormShow(Sender: TObject);

begin
  With Objeto Do
   Begin
   Empresa.ID_Empresa.Control          := edID_EMPRESA;
   Empresa.PersonaMoral.Nombre.Control := edNOM_EMPRESA;
   Empresa.GetParams(Objeto);

   EJERCICIO.Control := edEJERCICIO;
   RFC_EMPRESA.Control := edRFC_EMPRESA;

   dtpFechaComplementaria.Date :=  Date;   //<AACE4754>

   End;
   vlIDCREDITO_SEL:='0';
   vlIDCONTRATO_SEL:='0';
   vlIDDOM_SEL:='0';
   vlIDDOMINMU_SEL:='0';
end;

procedure TWCrarchsat.FormDestroy(Sender: TObject);
begin
  With Objeto Do
   Begin
   Empresa.ID_Empresa.Control          := Nil;
   Empresa.PersonaMoral.Nombre.Control := Nil;

   EJERCICIO.Control   := Nil;
   RFC_EMPRESA.Control := Nil;
   End;
end;

procedure TWCrarchsat.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;


procedure TWCrarchsat.ActualizaDomConvertido(peID_CREDITO, peNUM_EJERCICIO : Integer; var PPResultado: String);
var  StpActualizaDomConver : TStoredProc;
Begin
   StpActualizaDomConver := TStoredProc.Create(Self);
   Try
     With StpActualizaDomConver Do
     Begin                                  
        //Inicia el SPT
        StpActualizaDomConver.DatabaseName := Objeto.Apli.DatabaseName;
        StpActualizaDomConver.SessionName  := Objeto.Apli.SessionName;
        StpActualizaDomConver.StoredProcName:= 'ADMIPROD.PKGCRSAT_HIPO.STPACUALIZA_DOMCONVERTIDO';

        Params.Clear;
        Params.CreateParam( ftInteger, 'peID_CREDITO',  ptInput);
        Params.CreateParam( ftInteger, 'peEJERCICIO',   ptInput);
        Params.CreateParam( ftString,  'peBCommit',     ptInput);
        Params.CreateParam( ftInteger, 'psResultado',   ptOutput);
        Params.CreateParam( ftString,  'psTxResultado', ptOutput);

        Prepare;
        If (peID_CREDITO <= 0) Then
          ParamByName('peID_CREDITO').Clear
        Else
          ParamByName('peID_CREDITO').AsInteger := peID_CREDITO;

        ParamByName('peEJERCICIO').AsInteger := peNUM_EJERCICIO;
        ParamByName('peBCommit').AsString    := 'V';
        ExecProc;

        If (ParamByName('psResultado').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('psTxResultado').AsString;
        End;
        //end if;
     end;
   Finally
        If Assigned(StpActualizaDomConver) Then
           StpActualizaDomConver.Free;
        //end if;
   End;
end;


function TWCrarchsat.ObtenSQLQryImpCredOtorgados : String;
var vlSQL : String;
    vlNUM_EJERCICIO  : Integer;
    vlstrNUM_EJERCICIO : String;
begin
    vlNUM_EJERCICIO     := StrToInt(edEJERCICIO.Text);
    vlstrNUM_EJERCICIO     := IntToStr(vlNUM_EJERCICIO);
    vlSQL :=
            ' SELECT CRED_SAT.*'+coCRLF+
            ' FROM (  SELECT CCAC.ID_ACREDITADO,'+coCRLF+
            '                CCAC.NOM_ACREDITADO,'+coCRLF+
//            '                CTO.CVE_MONEDA,'+coCRLF+
            '                SUM(CC.SDO_INSOLUTO) AS SUM_IMP_CRED_OTORGADOS'+coCRLF+
            '         FROM '+coCRLF+
//            '         FROM ( SELECT SCL.ID_CREDITO'+coCRLF+
//            '                FROM SAT_CRE_LAYOUT SCL'+coCRLF+
//            '                WHERE SCL.ID_EMPRESA = '+IntToStr(Objeto.Apli.IdEmpresa)+coCRLF+
//            '                  AND SCL.EJERCICIO = '+vlstrNUM_EJERCICIO+coCRLF+
//            '               ) SCL1,'+coCRLF+
            '               ('+coCRLF+
            '                 SELECT PROV.ID_CREDITO, PROV.SDO_INSOLUTO,CC.ID_CONTRATO'+coCRLF+
            '                 FROM CRE_PROV_DIARIA PROV,'+coCRLF+
            '			   CRE_CREDITO     CC, '+coCRLF+
            '                      SAT_CRE_LAYOUT SCL '+coCRLF+
            '                 WHERE PROV.ID_CREDITO  = CC.ID_CREDITO'+coCRLF+
//            '                   AND PROV.F_PROVISION = admiprod.PKGCRSAT.FNOBTFMINCIERRE(CC.ID_CREDITO,to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''),'+coCRLF+
            '                   AND PROV.F_PROVISION = admiprod.PKGCRSAT_HIPO.FNOBTFMINCIERRE(CC.ID_CREDITO,to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''),'+coCRLF+
            '                 					     			      to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''))'+coCRLF+
            '                   AND CC.SIT_CREDITO NOT IN (''CA'', ''TA'')'+coCRLF+
            '                   AND PROV.ID_CREDITO = CC.ID_CREDITO '+coCRLF+
            '		        AND SCL.ID_CREDITO = CC.ID_CREDITO '+coCRLF+
            '		        AND SCL.ID_CONTRATO = CC.ID_CONTRATO '+coCRLF+
            '                   AND SCL.ID_EMPRESA = '+IntToStr(Objeto.Apli.IdEmpresa)+coCRLF+
            '                   AND SCL.EJERCICIO = '+vlstrNUM_EJERCICIO+coCRLF+
            '              UNION'+coCRLF+
            '                 SELECT CHC.ID_CREDITO, CHC.SDO_VIG_TOTAL AS SDO_INSOLUTO,CC.ID_CONTRATO'+coCRLF+
            '                 FROM CR_HISTO_CRED CHC,'+coCRLF+
            '                      CR_CREDITO    CC, '+coCRLF+
            '                      SAT_CRE_LAYOUT SCL '+coCRLF+
            '                 WHERE CHC.ID_CREDITO = CC.ID_CREDITO '+coCRLF+
//            '			AND CHC.F_CIERRE   = admiprod.PKGCRSAT.FNOBTFMINCIERRE(CC.ID_CREDITO,to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''),'+coCRLF+
            '			AND CHC.F_CIERRE   = admiprod.PKGCRSAT_HIPO.FNOBTFMINCIERRE(CC.ID_CREDITO,to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''),'+coCRLF+
            '                 					     		            to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''))'+coCRLF+
            '                   AND CC.SIT_CREDITO <> ''CA'''+coCRLF+
            '		        AND SCL.ID_CREDITO = CC.ID_CREDITO '+coCRLF+
            '		        AND SCL.ID_CONTRATO = CC.ID_CONTRATO '+coCRLF+
            '                   AND SCL.ID_EMPRESA = '+IntToStr(Objeto.Apli.IdEmpresa)+coCRLF+
            '                   AND SCL.EJERCICIO = '+vlstrNUM_EJERCICIO+coCRLF+
            '               ) CC,'+coCRLF+
            '               CONTRATO CTO,'+coCRLF+
            '               CR_CON_ADEU_CLTV CCAC'+coCRLF+
            '         WHERE CCAC.ID_REG_VIGENTE = 1'+coCRLF+
//            '           AND CCAC.ID_CREDITO     = SCL1.ID_CREDITO'+coCRLF+
//            '           AND CC.ID_CREDITO       = SCL1.ID_CREDITO'+coCRLF+
            '           AND CTO.ID_CONTRATO     = CC.ID_CONTRATO'+coCRLF+
            '           AND CCAC.ID_CREDITO     = CC.ID_CREDITO'+coCRLF+
            '         GROUP BY CCAC.ID_ACREDITADO, CCAC.NOM_ACREDITADO'+coCRLF+
//            '         GROUP BY CCAC.ID_ACREDITADO, CTO.CVE_MONEDA, CCAC.NOM_ACREDITADO'+coCRLF+
            '      ) CRED_SAT'+coCRLF
            ;
  Result := vlSQL;
end;


function TWCrarchsat.CadenaSql: String;
var vlSQL       : String;
begin
 // Inicia Modificación del
 With Objeto Do
  Begin
  GetFromControl;
  vlSQL :=
      ' SELECT DATOS.*,'+coCRLF+
      '        -- Datos domicilio Titular'+coCRLF+
      '        DC.CALLE                     AS CALLE,'+coCRLF+
      '        SUBSTR(DC.NUM_EXTERIOR,1,12) AS NUM_EXTERIOR,'+coCRLF+
      '        SUBSTR(DC.NUM_INTERIOR,1,12) AS NUM_INTERIOR,'+coCRLF+
      '        DOM.COLONIA                  AS COLONIA,'+coCRLF+
      '        DOM.CODIGO_POSTAL            AS CODIGO_POSTAL,'+coCRLF+
      '        DOM.CVE_CIUDAD               AS CVE_CIUDAD,'+coCRLF+                                         //<AACE4754 CIUDAD Y ESTADO>
      '	       (SELECT POB.DESC_POBLACION'+coCRLF+
      '         FROM POBLACION POB'+coCRLF+
      '	        WHERE POB.CVE_POBLACION = DOM.CVE_CIUDAD'+coCRLF+
      '        )                           AS MUNICIPIO,'+coCRLF+
      '        DOM.CVE_ESTADO              AS CVE_ESTADO,'+coCRLF+
      '	       (SELECT POB.DESC_POBLACION'+coCRLF+
      '	        FROM POBLACION POB'+coCRLF+
      '	        WHERE POB.CVE_POBLACION = DOM.CVE_ESTADO'+coCRLF+
      '        )                          AS ENTIDAD_FEDERATIVA,'+coCRLF+                                //</AACE4754 CIUDAD Y ESTADO>
      '        -- Datos domicilio Inmueble'+coCRLF+
      '        DC_INMU.CALLE                       AS INMU_CALLE,'+coCRLF+
      '        SUBSTR(DC_INMU.NUM_EXTERIOR, 1, 12) AS INMU_NUM_EXTERIOR,'+coCRLF+
      '        SUBSTR(DC_INMU.NUM_INTERIOR, 1, 12) AS INMU_NUM_INTERIOR,'+coCRLF+
      '        DOM_INMU.COLONIA                    AS INMU_COLONIA,'+coCRLF+
      '        DOM_INMU.CODIGO_POSTAL              AS INMU_CODIGO_POSTAL,'+coCRLF+
      '        DOM_INMU.CVE_CIUDAD                 AS INMU_CIUDAD,'+coCRLF+                     //<AACE4754 INMU CIUDAD Y ESTADO>
      '	       (SELECT POB.DESC_POBLACION'+coCRLF+
      '	        FROM POBLACION POB'+coCRLF+
      '		WHERE POB.CVE_POBLACION = DOM_INMU.CVE_CIUDAD'+coCRLF+
      '        )                                   AS INMU_MUNICIPIO,'+coCRLF+
      '        DOM_INMU.CVE_ESTADO                 AS INMU_ESTADO,'+coCRLF+
      '        (SELECT POB.DESC_POBLACION'+coCRLF+
      '	        FROM POBLACION POB'+coCRLF+
      '	        WHERE POB.CVE_POBLACION = DOM_INMU.CVE_ESTADO'+coCRLF+
      '        )                                   AS INMU_ENTIDAD_FEDERATIVA,'+coCRLF+                           //</AACE4754 INMU CIUDAD Y ESTADO>
      '        DATOS_ADIC.SUM_IMP_CRED_OTORGADOS, '+coCRLF+ //   <SATV4766  13Ene2008>
      //HERJA FEB2012
      {
      '        Pkgcrsat_Hipo.FnObtSdoInsolutoFA(DATOS.ID_CREDITO,'+coCRLF+
      '            Pkgcrsat_Hipo.FnObtFVenFAnioDSigHabil(to_date(''31/12/'+edEJERCICIO.Text+#39+',''dd/mm/yyyy''),'+coCRLF+
      '            to_date(''31/12/'+edEJERCICIO.Text+#39+',''dd/mm/yyyy''))'+coCRLF+
      }
      '        Pkgcrsat_Hipo.FnObtSdoInsolutoFA(DATOS.ID_CREDITO, to_date(''31/12/'+edEJERCICIO.Text+#39+',''dd/mm/yyyy'') )'+coCRLF+
      //FIN HERJA FEB2012

      '         AS SALDO_INSOL_EJE_REP'+coCRLF+
//      '	       to_date(''31/12/'+edEJERCICIO.Text+#39',''dd/mm/yyyy'')) AS SALDO_INSOL_EJE_REP'+coCRLF+
//    '        (SELECT CAS.IMP_CAP_VIG'+coCRLF+                                 //<AACE4754 SALDO INSOLUTO>
//     '         FROM CR_CON_ADEUDO_SDO CAS'+coCRLF+
//     '         WHERE CAS.F_CIERRE = TO_DATE(''31/12/'+edEJERCICIO.Text+''',''DD/MM/YYYY'')'+coCRLF+
//      '	       	  AND CAS.ID_CREDITO = DATOS.ID_CREDITO'+coCRLF+
//      '        )                                   AS SALDO_INSOL_EJE_REP'+coCRLF+                                     //</AACE4754 SALDO INSOLUTO>
      ' FROM ('+coCRLF+
      '         SELECT SCL.ID_CREDITO,'+coCRLF+
      '                SCL.ID_CONTRATO,'+coCRLF+
      '                SCL.SDO_PROMEDIO,'+coCRLF+
      '                SCL.TIPO_REGISTRO,'+coCRLF;

{    If (Ejercicio.AsInteger < 2004) Then
    vlSQL := vlSQL +
        '                CVE_IDENTIFICADOR,' + coCRLF
    Else If (Ejercicio.AsInteger = 2004) Then
   05042005 ROIM Para el Ejercicio del 2004 se realizó un cambio con respecto al catálogo de Indentificador, este ahora corresponde a 2 para todos los casos
    vlSQL := vlSQL +
             #39  +  '                2' + #39 + '                AS CVE_IDENTIFICADOR,' + coCRLF
    Else If (Ejercicio.AsInteger = 2005) Then
   17012006 SATV Para el Ejercicio del 2005 se realiza un nuevo cambio sobre el catálogo de Indentificador,
                  donde solicita el SAT que se le notifique conforme al siguiente catálogo...
                 ----------------------------------------
                  Campo                             | Valor
                  ----------------------------------------
                  Nombre y Domicilio Separado       |  1
                  Nombre y Domicilio sin Separación |  2
                  ----------------------------------------
                  por lo que se tomo nuevamente el identificador que regresa el procedimiento "PkgImpInteres.STPDatosCte"
                  y se cambio el identificador "4" (NOMBRE Y DOMICILIO JUNTO) por el identifcador "2"

    vlSQL := vlSQL +
        '                DECODE(CVE_IDENTIFICADOR, 4, 2, -- NOMBRE Y DOMICILIO JUNTO' + coCRLF +
        '                                            CVE_IDENTIFICADOR) AS CVE_IDENTIFICADOR,' + coCRLF
    Else}
    If (Ejercicio.AsInteger >= 2006) Then
//   03012007 SATV Para el Ejercicio del 2006 se cambia a que se le notifique al SAT el domicilio y el nombre separado, por lo que el identifcador es "1"
    vlSQL := vlSQL +
        #39  +  '1' + #39 + ' AS CVE_IDENTIFICADOR,' + coCRLF;


    vlSQL := vlSQL +
      '                SCL.RFC_CURP,'+coCRLF+
      '                ''                  ''AS CURP,'+coCRLF+
      '                SCL.NOMBRE_TIT_ARCH,'+coCRLF+
      '                SCL.DOMICILIO,'+coCRLF+
      '                SCL.NUM_REFERENCIA,'+coCRLF+
      '                SCL.NUM_REG_FIDE,'+coCRLF+
      '                SCL.CVE_DEST_CREDITO,'+coCRLF+
      '                SCL.IMP_INT_NOM_DEV,'+coCRLF+
      '                SCL.IMP_INT_PAG_ORD,'+coCRLF+
      '                SCL.IMP_INT_MOR_DEV,'+coCRLF+
      '                SCL.IMP_INT_MOR_PAG,'+coCRLF+
      '                SCL.IMP_INT_REAL,'+coCRLF+
      '                SCL.SDO_CIE_ANIO_ANT,'+coCRLF+
      '                SCL.SDO_FEC_CONTR,'+coCRLF;

   // Si el ejercicio es Mayor al 2007, entonces....
   //If (Ejercicio.AsInteger >= 2007) Then
   //  Begin
     vlSQL := vlSQL +
//       '                TO_CHAR(CC.F_VALOR_CRED,''YYYYMMDD'') AS F_CONTRATACION,'+coCRLF;  // Modificacion para los LAYOUT mayores al 2007
      '                ('+coCRLF+
      '                 -- <INTERCREDITOS>'+coCRLF+
      '                 SELECT TO_CHAR(CC.F_VALOR_CRED,''YYYYMMDD'') '+coCRLF+
      '                 FROM CRE_CREDITO CC '+coCRLF+
      '                 WHERE CC.ID_CREDITO = SCL.ID_CREDITO '+coCRLF+
      '                  -- </INTERCREDITOS>'+coCRLF+
      '                UNION'+coCRLF+
      '                -- <ICRE01>'+coCRLF+
      '                 SELECT TO_CHAR(CC.F_INICIO,''YYYYMMDD'') '+coCRLF+
      '                 FROM  CR_CREDITO CC'+coCRLF+
      '                 WHERE CC.ID_CREDITO = SCL.ID_CREDITO '+coCRLF+
      '                -- </ICRE01>'+coCRLF+
      '               ) F_CONTRATACION, '+coCRLF;
   //  End
   //Else
   //  Begin
   //  vlSQL := vlSQL +
   //    '                NVL(SCL.F_CONTRATACION, 0) AS F_CONTRATACION,'+coCRLF;  // Antes del 2007
   //  End;

    vlSQL := vlSQL +
      '                SCL.PROP_DEDUCIBLE,'+coCRLF+
      '                SCL.PCT_COP_SOC_CONY,'+coCRLF+
      '                SCL.NUM_COPROPIET,'+coCRLF+
      '                SCL.RFC_CURP_COPRO,'+coCRLF+
      '                SCL.NOMBRE_COPRO,'+coCRLF+
      '                SCL.RFC_CURP_CONYU,'+coCRLF+
      '                SCL.NOMBRE_CONYU,'+coCRLF+
      '                P.CVE_PER_JURIDICA,'+coCRLF+
      '                PF.NOMBRE_PERSONA,'+coCRLF+
      '                PF.APELLIDO_PATERNO,'+coCRLF+
      '                PF.APELLIDO_MATERNO,'+coCRLF+
      '                PM.NOM_RAZON_SOCIAL,'+coCRLF+
      '                SCL.DOMICILIO_INMU,'+coCRLF+
      '                SCL.CONSECUTIVO,'+coCRLF+
      '                DECODE( SCIA.ID_DOM_FISCAL, NULL, CTO.ID_DOMICILIO, SCIA.ID_DOM_FISCAL ) AS ID_DOMIC,'+coCRLF+
      '                DECODE( SCIA.ID_DOM_GARANTIA, NULL, P.ID_DOMICILIO, SCIA.ID_DOM_GARANTIA ) AS ID_DOMIC_INMU,'+coCRLF+
//      '                CC.CVE_SUB_TIP_BCO,'+coCRLF+
      '                ('+coCRLF+
      '                 -- <INTERCREDITOS>'+coCRLF+
      '                 SELECT TO_CHAR(CO.CVE_SUB_TIP_BCO) AS CVE_SUB_TIP_BCO'+coCRLF+
       '                 FROM CRE_CONTRATO CO'+coCRLF+
      '                 WHERE CO.CVE_SUB_TIP_BCO IN ( 57, 61, 139, 147, 140, 59, 60 )'+coCRLF+
      '                   AND CO.ID_CONTRATO = SCL.ID_CONTRATO'+coCRLF+
      '                  -- </INTERCREDITOS>'+coCRLF+
      '                UNION'+coCRLF+
      '                -- <ICRE01>'+coCRLF+
      '                 SELECT CO.CVE_PRODUCTO_CRE AS CVE_SUB_TIP_BCO'+coCRLF+
      '                   FROM CR_CONTRATO CO'+coCRLF+
      '                 WHERE CO.ID_CONTRATO = SCL.ID_CONTRATO'+coCRLF+
      '                -- </ICRE01>'+coCRLF+
      '               ) CVE_SUB_TIP_BCO, '+coCRLF+
//--------
//      '                CC.DESC_SUB_TIPO,'+coCRLF+
      '                ('+coCRLF+
      '                 -- <INTERCREDITOS>'+coCRLF+
      '                 SELECT CSTB.DESC_SUB_TIPO'+coCRLF+
      '                 FROM CRE_CONTRATO CO,'+coCRLF+
      '                      CRE_SUB_TIP_BCO CSTB'+coCRLF+
      '                 WHERE CO.CVE_SUB_TIP_BCO IN ( 57, 61, 139, 147, 140, 59, 60 )'+coCRLF+
      '                   AND CO.ID_CONTRATO = SCL.ID_CONTRATO'+coCRLF+
      '                   AND CSTB.CVE_SUB_TIP_BCO = CO.CVE_SUB_TIP_BCO'+coCRLF+
      '                  -- </INTERCREDITOS>'+coCRLF+
      '                UNION'+coCRLF+
      '                -- <ICRE01>'+coCRLF+
      '                 SELECT CP.DESC_L_PRODUCTO DESC_SUB_TIPO'+coCRLF+
      '                 FROM CR_PRODUCTO CP,'+coCRLF+
      '                      CR_CONTRATO CO'+coCRLF+
      '                 WHERE CP.CVE_PRODUCTO_GPO = ''VVENDA'''+coCRLF+
      '                   AND CO.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE'+coCRLF+
      '                   AND CO.ID_CONTRATO = SCL.ID_CONTRATO'+coCRLF+
      '                -- </ICRE01>'+coCRLF+
      '               ) DESC_SUB_TIPO, '+coCRLF+
//------------
      '                CTO.ID_TITULAR,'+coCRLF+
      '                SCL.B_REPORTA_SAT'+coCRLF+
      '         FROM   SAT_CRE_LAYOUT   SCL,'+coCRLF+
      '                CONTRATO         CTO,'+coCRLF+
      '                SAT_CRE_INF_ADIC SCIA,'+coCRLF+
      '                PERSONA          P,'+coCRLF+
      '                PERSONA_FISICA   PF,'+coCRLF+
      '                PERSONA_MORAL    PM'+coCRLF+
      //<SATV4766  29DIC2008>
      {
      '                ('+coCRLF+
      '                 -- <INTERCREDITOS>'+coCRLF+
      '                 SELECT CC.ID_CREDITO,'+coCRLF+
      '                        CO.ID_CONTRATO,'+coCRLF+
      '                        TO_CHAR(CO.CVE_SUB_TIP_BCO) AS CVE_SUB_TIP_BCO,'+coCRLF+
      '                        CSTB.DESC_SUB_TIPO,'+coCRLF+
      '                        CC.F_LIQ_BNC,'+coCRLF+
      '                        CC.F_VALOR_CRED'+coCRLF+
      '                 FROM CRE_CONTRATO CO,'+coCRLF+
      '                      CRE_CREDITO CC,'+coCRLF+
      '                      CRE_SUB_TIP_BCO CSTB'+coCRLF+
      '                 WHERE CO.CVE_SUB_TIP_BCO IN ( 57, 61, 139, 147, 140, 59, 60 )'+coCRLF+
      '                   AND CC.SIT_CREDITO NOT IN (''TA'',''CA'')'+coCRLF+
      '                   AND CC.ID_CONTRATO = CO.ID_CONTRATO'+coCRLF+
      '                   AND CSTB.CVE_SUB_TIP_BCO = CO.CVE_SUB_TIP_BCO'+coCRLF+
      '                  -- </INTERCREDITOS>'+coCRLF+
      '                UNION'+coCRLF+
      '                -- <ICRE01>'+coCRLF+
      '                 SELECT CC.ID_CREDITO,'+coCRLF+
      '                        CO.ID_CONTRATO,'+coCRLF+
      '                        CO.CVE_PRODUCTO_CRE AS CVE_SUB_TIP_BCO,'+coCRLF+
      '                        CP.DESC_L_PRODUCTO DESC_SUB_TIPO,'+coCRLF+
      '                        CC.F_LIQUIDACION,'+coCRLF+
      '                        CC.F_INICIO'+coCRLF+
      '                 FROM CR_PRODUCTO CP,'+coCRLF+
      '                      CR_CONTRATO CO,'+coCRLF+
      '                      CR_CREDITO CC'+coCRLF+
      '                 WHERE CP.CVE_PRODUCTO_GPO = ''VVENDA'''+coCRLF+
      '                   AND CO.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE'+coCRLF+
      '                   AND CC.SIT_CREDITO <> ''CA'''+coCRLF+
      '                   AND CC.ID_CONTRATO = CO.ID_CONTRATO'+coCRLF+
      '                -- </ICRE01>'+coCRLF+
      '               ) CC '+coCRLF+
      }
      //</SATV4766>
      '         WHERE  SCL.ID_EMPRESA     = ' + edID_EMPRESA.Text + coCRLF +
      '           AND  SCL.EJERCICIO      = ' + edEJERCICIO.Text  + coCRLF +
      '           AND  SCL.B_REPORTA_SAT  = ' + SQLStr(CVERDAD)  + coCRLF +
      '           AND  CTO.ID_CONTRATO    = SCL.ID_CONTRATO'+coCRLF+
//      '           AND  CC.ID_CREDITO      = SCL.ID_CREDITO'+coCRLF+
      '           AND  SCIA.ID_CONTRATO(+)= SCL.ID_CONTRATO'+coCRLF+
      '           AND  P.ID_PERSONA       = CTO.ID_TITULAR'+coCRLF+
      '           AND  PF.ID_PERSONA   (+)= P.ID_PERSONA'+coCRLF+
      '           AND  PM.ID_PERSONA   (+)= P.ID_PERSONA'+coCRLF+
      '    ) DATOS,'+coCRLF+
      '    ('+coCRLF+
            ObtenSQLQryImpCredOtorgados + //   <easa 29.ene.2010>
      '    ) DATOS_ADIC, '+coCRLF+
      '    DOM_CONVERTIDO DC,'+coCRLF+
      '    DOMICILIO DOM,'+coCRLF+
      '    DOM_CONVERTIDO DC_INMU,'+coCRLF+
      '    DOMICILIO DOM_INMU'+coCRLF+
      ' WHERE DOM.ID_DOMICILIO      (+)= DATOS.ID_DOMIC'+coCRLF+
      '   AND DC.ID_DOMICILIO       (+)= DATOS.ID_DOMIC'+coCRLF+
      '   AND DOM_INMU.ID_DOMICILIO (+)= DATOS.ID_DOMIC_INMU'+coCRLF+
      '   AND DC_INMU.ID_DOMICILIO  (+)= DATOS.ID_DOMIC_INMU'+coCRLF+
      '   AND DATOS_ADIC.ID_ACREDITADO (+)= DATOS.ID_TITULAR'+coCRLF+ //   <SATV4766  13Ene2008>
      '   AND DATOS.B_REPORTA_SAT = ''V'''+coCRLF+ // easa 16.FEB.2010
      ' ORDER BY DATOS.CONSECUTIVO'
      ;
   CadenaSql := vlSQL;

   end;
end;

procedure TWCrarchsat.btEMPRESAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRARCHSAT_EMPRE',True,True) then
   begin
     With Objeto Do
        Begin
        Empresa.ShowAll := True;
        if Empresa.Busca then
           Begin
           RFC_EMPRESA.AsString := ObtenRFCEmpresa;
           InterForma1.NextTab(edID_EMPRESA);
           End;
       End;
   end;
end;
{-------------------------------------------------------------------------------
                EJECUTA EL QUERY Y MUESTRA LOS DATOS EN PANTALLA
-------------------------------------------------------------------------------}
procedure TWCrarchsat.MuestraDAtos(pUpdDomicilios:boolean);
var Qry         : TQuery;
    nRowCount   : Integer;
    vlConsec    : Integer;
    vlDOM_INMU  : String;
    vlB_Act_BD  : boolean;
    vlid_Credito :string;
    //
    vlnumint, vlcodpost, vlnumint_inmu, vlcodpost_inmu:string;
    vlnumext, vlnumext_inmu, vltemp:string;
begin
  LimpiaPantalla;
//  LimpiaRecord;
  nRowCount := 1;
  with Objeto do
    Qry := GetSQLQueryNoNil( CadenaSql, Apli.DataBaseName, Apli.SessionName, True );
  if Assigned(Qry) and NOT( Qry.IsEmpty ) THEN
    Qry.SQL.savetofile('C:\ArchSAT.sql');   //AACE4754
  begin
    //ENCABEZADO
    vlConsec := 1;
    with sagDATOS do
    begin
      while Not Qry.Eof Do
      begin
          //DETALLE
          vlConsec := vlConsec + 1;


          Cells[C_TIPO_REG,nRowCount] := Qry.FieldByName('TIPO_REGISTRO').AsString;
          Cells[C_CONS_REG,nRowCount] := IntToStr(vlConsec);
          Cells[C_CVE_IDEN,nRowCount] := Qry.FieldByName('CVE_IDENTIFICADOR').AsString;
          //05032005 roim VALIDACIÓN PARA ELIMINAR LOS RFC CON MENOS DE 13 CARACTERES O CON 000 AL FINAL
          if ((Length(Qry.FieldByName('RFC_CURP').AsString) < 13) or ('000' = Copy(Qry.FieldByName('RFC_CURP').AsString,10,3))) then
            Cells[C_RFC_CURP,nRowCount] := '             '
          else
            Cells[C_RFC_CURP,nRowCount] := Qry.FieldByName('RFC_CURP').AsString;
          //end if;
          Cells[C_CURP,nRowCount]     := Qry.FieldByName('CURP').AsString;
          Cells[C_NOMBRE_T,nRowCount] := Qry.FieldByName('NOMBRE_TIT_ARCH').AsString;
          //
          Cells[C_NOMBRE_PERSONA,nRowCount]    := Qry.FieldByName('NOMBRE_PERSONA').AsString;
          Cells[C_APELLIDO_PATERNO,nRowCount]  := Qry.FieldByName('APELLIDO_PATERNO').AsString;
          Cells[C_APELLIDO_MATERNO,nRowCount]  := Qry.FieldByName('APELLIDO_MATERNO').AsString;
          // Datos del domicilio del cliente
          Cells[C_DOM_CALLE,nRowCount]         := Qry.FieldByName('CALLE').AsString;

          if length(Qry.FieldByName('NUM_EXTERIOR').AsString) = 0 then                                 //<AACE4754>  VALIDACION LONGITUD NUMERO EXTERIOR
            Cells[C_DOM_NUM_EXT,nRowCount]       := '00' + Qry.FieldByName('NUM_EXTERIOR').AsString
          else
          if length(Qry.FieldByName('NUM_EXTERIOR').AsString) = 1 then
            Cells[C_DOM_NUM_EXT,nRowCount]       := '0' + Qry.FieldByName('NUM_EXTERIOR').AsString
          else
             Cells[C_DOM_NUM_EXT,nRowCount]       := Qry.FieldByName('NUM_EXTERIOR').AsString;         //</AACE4754>  VALIDACION LONGITUD NUMERO EXTERIOR

          if length(Qry.FieldByName('NUM_INTERIOR').AsString) = 0 then                                 // </AACE4754>  VALIDACION LONGITUD NUMERO INTERIOR
            Cells[C_DOM_NUM_INT,nRowCount]       := '00' + Qry.FieldByName('NUM_INTERIOR').AsString
          else
          if length(Qry.FieldByName('NUM_INTERIOR').AsString) = 1 then
            Cells[C_DOM_NUM_INT,nRowCount]       := '0' + Qry.FieldByName('NUM_INTERIOR').AsString
          else
             Cells[C_DOM_NUM_INT,nRowCount]       := Qry.FieldByName('NUM_INTERIOR').AsString;        // </AACE4754>  VALIDACION LONGITUD NUMERO INTERIOR
          Cells[C_DOM_COLONIA,nRowCount]       := Qry.FieldByName('COLONIA').AsString;
          Cells[C_DOM_CODIGO_POSTAL,nRowCount] := Qry.FieldByName('CODIGO_POSTAL').AsString;
          Cells[C_DOM_MUNICIPIO,nRowCount]     := Qry.FieldByName('MUNICIPIO').AsString;
          Cells[C_DOM_ENTIDAD_FED,nRowCount]   := Qry.FieldByName('ENTIDAD_FEDERATIVA').AsString;

          // Datos del domicilio del inmueble

          Cells[C_DOM_INMU_CALLE,nRowCount]         := Qry.FieldByName('INMU_CALLE').AsString;
          if length(Qry.FieldByName('INMU_NUM_EXTERIOR').AsString) = 0 then                                    // <AACE4754> VALIDACION LONGITUD NUMERO EXTERIOR
            Cells[C_DOM_INMU_NUM_EXT,nRowCount]       := '00' + Qry.FieldByName('INMU_NUM_EXTERIOR').AsString
          else
          if length(Qry.FieldByName('INMU_NUM_EXTERIOR').AsString) = 1 then
            Cells[C_DOM_INMU_NUM_EXT,nRowCount]       := '0' + Qry.FieldByName('INMU_NUM_EXTERIOR').AsString
          else
             Cells[C_DOM_INMU_NUM_EXT,nRowCount]       := Qry.FieldByName('INMU_NUM_EXTERIOR').AsString;       // </AACE4754> VALIDACION LONGITUD NUMERO EXTERIOR

          if length(Qry.FieldByName('INMU_NUM_INTERIOR').AsString) = 0 then                                    // <AACE4754> VALIDACION LONGITUD NUMERO INTERIOR
            Cells[C_DOM_INMU_NUM_INT,nRowCount]       := '00' + Qry.FieldByName('INMU_NUM_INTERIOR').AsString
          else
          if length(Qry.FieldByName('INMU_NUM_INTERIOR').AsString) = 1 then
            Cells[C_DOM_INMU_NUM_INT,nRowCount]       := '0' + Qry.FieldByName('INMU_NUM_INTERIOR').AsString
          else
             Cells[C_DOM_INMU_NUM_INT,nRowCount]       := Qry.FieldByName('INMU_NUM_INTERIOR').AsString;      // </AACE4754> VALIDACION LONGITUD NUMERO INTERIOR

          Cells[C_DOM_INMU_COLONIA,nRowCount]       := Qry.FieldByName('INMU_COLONIA').AsString;
          Cells[C_DOM_INMU_CODIGO_POSTAL,nRowCount] := Qry.FieldByName('INMU_CODIGO_POSTAL').AsString;
          Cells[C_DOM_INMU_MUNICIPIO,nRowCount]     := Qry.FieldByName('INMU_MUNICIPIO').AsString;
          Cells[C_DOM_INMU_ENTIDAD_FED,nRowCount]   := Qry.FieldByName('INMU_ENTIDAD_FEDERATIVA').AsString;


          if (pUpdDomicilios = False) then
             Cells[C_DOMICI_INMU,nRowCount] := ReplaceChar(Qry.FieldByName('DOMICILIO_INMU').AsString,#13,#32)
          else
          begin
          {
              vlnumint_inmu:=Cells[C_DOM_INMU_NUM_INT,nRowCount];
              vlcodpost_inmu:=Cells[C_DOM_INMU_CODIGO_POSTAL,nRowCount];

              vlnumint:=Cells[C_DOM_NUM_INT,nRowCount];
              vlcodpost:=Cells[C_DOM_CODIGO_POSTAL,nRowCount];

              if Trim(vlnumint_inmu)='0' then vlnumint_inmu:=' ';
              if Trim(vlcodpost_inmu)='0' then vlcodpost_inmu:=' ';
              if Trim(vlnumint)='0' then vlnumint:=' ';
              if Trim(vlcodpost)='0' then vlcodpost:=' ';

              vlDOM_INMU:=Cells[C_DOM_INMU_CALLE,nRowCount]+' '+Cells[C_DOM_INMU_NUM_EXT,nRowCount]+' '+vlnumint_inmu+' '+
                          Cells[C_DOM_INMU_COLONIA,nRowCount]+' '+vlcodpost_inmu+' '+
                          Cells[C_DOM_INMU_MUNICIPIO,nRowCount]+' '+Cells[C_DOM_INMU_ENTIDAD_FED,nRowCount];
              Cells[C_DOMICI_INMU,nRowCount] := ReplaceChar(vlDOM_INMU,#13,#32);

              vlB_Act_BD:=false;
              }

              //ACTUALIZACION DE DOMICILIOS 1234   
              vlnumint_inmu:=Cells[C_DOM_INMU_NUM_INT,nRowCount];
              vlcodpost_inmu:=Cells[C_DOM_INMU_CODIGO_POSTAL,nRowCount];
              vlnumext_inmu:=Cells[C_DOM_INMU_NUM_EXT,nRowCount];

              vlnumint:=Cells[C_DOM_NUM_INT,nRowCount];
              vlcodpost:=Cells[C_DOM_CODIGO_POSTAL,nRowCount];
              vlnumext:=Cells[C_DOM_NUM_EXT,nRowCount];


              if (Trim(vlnumint_inmu)='0')  or (Trim(vlnumint_inmu)='00') then vlnumint_inmu:=' ';
              if (Trim(vlcodpost_inmu)='0') or (Trim(vlcodpost_inmu)='00') then vlcodpost_inmu:=' ';
              if (Trim(vlnumext_inmu)='0')  or (Trim(vlnumext_inmu)='00') then vlnumext_inmu:=' ';

              if (Trim(vlnumint)='0')  or (Trim(vlnumint)='00') then vlnumint:=' ';
              if (Trim(vlcodpost)='0') or (Trim(vlcodpost)='00') then vlcodpost:=' ';
              if (Trim(vlnumext)='0')  or (Trim(vlnumext)='00') then vlnumext:=' ';

              try
                vlQry := TQuery.Create(Self);
                vlQry.DatabaseName  := Objeto.Apli.DataBaseName;
                vlQry.SessionName   := Objeto.Apli.SessionName;
                vlQry.close;
                vlQry.SQL.Text:= ' UPDATE SAT_CRE_LAYOUT '+coCRLF+
                                 '        SET DOMICILIO_INMU = ( SELECT '''+Cells[C_DOM_INMU_CALLE,nRowCount]+' '+vlnumext_inmu+' '+vlnumint_inmu+'''||chr(13)||chr(10)||'''+Cells[C_DOM_INMU_COLONIA,nRowCount]+'''||chr(13)||chr(10)||'''+vlcodpost_inmu+'''||chr(13)||chr(10)||'''+Cells[C_DOM_INMU_MUNICIPIO,nRowCount]+'''||chr(13)||chr(10)||'''+Cells[C_DOM_INMU_ENTIDAD_FED,nRowCount]+''' AS DIR FROM DUAL)'+coCRLF+
                                 '        ,   DOMICILIO      = ( SELECT '''+Cells[C_DOM_CALLE,nRowCount]+' '+vlnumext+' '+vlnumint+'''||chr(13)||chr(10)||'''+Cells[C_DOM_COLONIA,nRowCount]+'''||chr(13)||chr(10)||'''+vlcodpost+'''||chr(13)||chr(10)||'''+Cells[C_DOM_MUNICIPIO,nRowCount]+'''||chr(13)||chr(10)||'''+Cells[C_DOM_ENTIDAD_FED,nRowCount]+''' AS DIR FROM DUAL)'+coCRLF+
                                 ' WHERE ID_EMPRESA=2 AND EJERCICIO = ' + Trim(edEJERCICIO.Text)+coCRLF+
                                 '    AND ID_CREDITO IN ('+Qry.FieldByName('ID_CREDITO').AsString+') ';
                vlQry.ExecSQL;
              finally
                 vlQry.close;
              end;
          end;

//          vlnombre := Cells[C_NOMBRE_T,nRowCount];
//          showmessage(TruncateStr(vlnombre,#32));

          if (pUpdDomicilios = False) then
             Cells[C_DOMICI_T,nRowCount] := ReplaceChar(Qry.FieldByName('DOMICILIO').AsString,#13,#32)
          else
             Cells[C_DOMICI_T,nRowCount] := ReplaceChar(Cells[C_DOM_CALLE,nRowCount]+' '+Cells[C_DOM_NUM_EXT,nRowCount]+' '+vlnumint+' '+Cells[C_DOM_COLONIA,nRowCount]+' '+vlcodpost+' '+Cells[C_DOM_MUNICIPIO,nRowCount]+' '+Cells[C_DOM_ENTIDAD_FED,nRowCount],#13,#32);


          Cells[C_NUM_CCTO,nRowCount] := Qry.FieldByName('ID_CREDITO').AsString;
          Cells[C_NUM_FIDE,nRowCount] := Qry.FieldByName('NUM_REG_FIDE').AsString;
          Cells[C_DEST_CRE,nRowCount] := Qry.FieldByName('CVE_DEST_CREDITO').AsString;
          // Inicia modificaciones SATV4766 el 16Ene2006
          Objeto.GetFromControl;
          If (Objeto.Ejercicio.AsInteger < 2005) Then
            Begin
            // Las cantidades se deben de expresar sin punto decimal
            Cells[C_INT_NOMD,nRowCount] := FloatToStr(Qry.FieldByName('IMP_INT_NOM_DEV').AsFloat * 100);
            Cells[C_INT_NOMP,nRowCount] := FloatToStr(Qry.FieldByName('IMP_INT_PAG_ORD').AsFloat * 100);
            Cells[C_INT_MORD,nRowCount] := FloatToStr(Qry.FieldByName('IMP_INT_MOR_DEV').AsFloat * 100);
            Cells[C_INT_MORP,nRowCount] := FloatToStr(Qry.FieldByName('IMP_INT_MOR_PAG').AsFloat * 100);
            Cells[C_INT_REAL,nRowCount] := FloatToStr(Qry.FieldByName('IMP_INT_REAL').AsFloat * 100);
            Cells[C_SDO_ANT_,nRowCount] := FloatToStr(Qry.FieldByName('SDO_CIE_ANIO_ANT').AsFloat * 100);
            Cells[C_SDO_CRED,nRowCount] := FloatToStr(Qry.FieldByName('SDO_FEC_CONTR').AsFloat * 100);
            End
          Else
            Begin
            // Las cantidades se deben de expresar CON PUNTO DECIMAL
            Cells[C_INT_NOMD,nRowCount] := FloatToStr(Qry.FieldByName('IMP_INT_NOM_DEV').AsFloat);
            Cells[C_INT_NOMP,nRowCount] := FloatToStr(Qry.FieldByName('IMP_INT_PAG_ORD').AsFloat);
            Cells[C_INT_MORD,nRowCount] := FloatToStr(Qry.FieldByName('IMP_INT_MOR_DEV').AsFloat);
            Cells[C_INT_MORP,nRowCount] := FloatToStr(Qry.FieldByName('IMP_INT_MOR_PAG').AsFloat);
            Cells[C_INT_REAL,nRowCount] := FloatToStr(Qry.FieldByName('IMP_INT_REAL').AsFloat);
            Cells[C_SDO_ANT_,nRowCount] := FloatToStr(Qry.FieldByName('SDO_CIE_ANIO_ANT').AsFloat);
            Cells[C_SDO_CRED,nRowCount] := FloatToStr(Qry.FieldByName('SDO_FEC_CONTR').AsFloat);
            End;
          // Termina modificaciones
          Cells[C_F_CONTRA,nRowCount] := Qry.FieldByName('F_CONTRATACION').AsString;
          Cells[C_PROP_DED,nRowCount] := Qry.FieldByName('PROP_DEDUCIBLE').AsString;
//          Cells[C_PROP_DED,nRowCount] := Qry.FieldByName('PROP_DEDUCIBLE_1').AsString; {easa 10.FEB.2010
          Cells[C_PCT_COPR,nRowCount] := Qry.FieldByName('PCT_COP_SOC_CONY').AsString;
          Cells[C_NUM_COPR,nRowCount] := Qry.FieldByName('NUM_COPROPIET').AsString;
          Cells[C_RFC_COPR,nRowCount] := Qry.FieldByName('RFC_CURP_COPRO').AsString;
          Cells[C_NOM_COPR,nRowCount] := Qry.FieldByName('NOMBRE_COPRO').AsString;
          Cells[C_RFC_CONY,nRowCount] := Qry.FieldByName('RFC_CURP_CONYU').AsString;
          Cells[C_NOM_CONY,nRowCount] := Qry.FieldByName('NOMBRE_CONYU').AsString;
          Cells[C_DOM_CONY,nRowCount] := ' ';
//          Cells[C_DOMICI_INMU,nRowCount] := ReplaceChar(Qry.FieldByName('DOMICILIO_INMU').AsString,#13,#32);
          // SATV 31Mzo2008
          Cells[C_CVE_SUB_TIP_BCO,nRowCount] := Qry.FieldByName('CVE_SUB_TIP_BCO').AsString;;
          Cells[C_DESC_SUB_TIPO,nRowCount] := Qry.FieldByName('DESC_SUB_TIPO').AsString;;

          // <SATV 13Ene2008>
//          Cells[C_SUM_IMP_CRED_OTORGADOS,nRowCount] := FloatToStr(Qry.FieldByName('SUM_IMP_CRED_OTORGADOS').AsFloat);
          // </SATV 13Ene2008>

          // <AACE 25Sep2009>
          Cells[C_SUM_IMP_CRED_OTORGADOS,nRowCount] := FloatToStr(Qry.FieldByName('SUM_IMP_CRED_OTORGADOS').AsFloat);
          // </AACE 25Sep2009>



          // <AACE4754 25062009>
          Cells[C_SDO_EJER_ACTUAL,nRowCount] := FloatToStr(Qry.FieldByName('SALDO_INSOL_EJE_REP').AsFloat);
          // </AACE4754 25062009>


          Cells[C_IDCREDITO ,nRowCount] := FloatToStr(Qry.FieldByName('ID_CREDITO').AsFloat);
          Cells[C_IDCONTRATO,nRowCount] := FloatToStr(Qry.FieldByName('ID_CONTRATO').AsFloat);
          Cells[C_IDDOM ,nRowCount]     := FloatToStr(Qry.FieldByName('ID_DOMIC').AsFloat);
          Cells[C_IDDOM_INMU,nRowCount] := FloatToStr(Qry.FieldByName('ID_DOMIC_INMU').AsFloat);

        Qry.Next;
        RowCount := nRowCount + 1;
        nRowCount := nRowCount + 1;     //Incrementa un reglon
        Application.ProcessMessages;
      end; //end While
    end; //end with
  end;
  if Assigned(Qry) then
  begin
    Qry.Close;
    Qry.Free;
  end;
end;

procedure TWCrarchsat.btBUSCAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRARCHSAT_BUSCA',True,True) then
   begin
       vlIDCREDITO_SEL:='0';
       vlIDCONTRATO_SEL:='0';
       vlIDDOM_SEL:='0';
       vlIDDOMINMU_SEL:='0';
       MuestraDAtos(False);
   end;
end;

procedure TWCrarchsat.InterForma1DespuesShow(Sender: TObject);
begin
 // 17Ene2006 SATV4766 Inicia Modificación
 With Objeto Do
   Begin
   Empresa.FindKey([Objeto.Apli.IdEmpresa]);
   EJERCICIO.AsString := FormatDateTime('YYYY', IncMonth(Apli.DameFechaEmpresa,-12));
   RFC_EMPRESA.AsString := ObtenRFCEmpresa;
   End;
 // Termina Modificación
end;

{-------------------------------------------------------------------------------
                              LIMPIA LA PANTALLA
-------------------------------------------------------------------------------}
procedure TWCrarchsat.LimpiaPantalla;
var nRow : Integer;
begin
   with sagDATOS do
   begin
     ClearGrid(sagDATOS);
     Application.ProcessMessages;
     for nRow := 1 to RowCount-1 do
       RemoveRow(Row);
     //ends_for
     ColorRow[Row] := clWhite;
     RowFont[Row].Color := clBlack;
   end;
end;

procedure TWCrarchsat.btnGenArchivoClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRARCHSAT_GENAR',True,True) then
   begin
       VGConReg := 1;
       VGConArch:= 1;
       btBUSCAClick(Self);
       GeneraArchivo;
   end;
end;

procedure TWCrarchsat.GeneraArchivo;
var vlarchivo           : TStringList;
    vllinea,vlRutaArch  : string;
    vlRow               : integer;
begin
 vlRow := 0;
 vlarchivo:= TStringList.Create;
 vlRutaArch:= EDRUTA.Text;
 AddLine( MErrores, '====================================================');
 AddLine( MErrores, '***         INICIO GENERA ARCHIVO           ***');
 AddLine( MErrores, '    Hora Inicio: ' + TimeToStr(Time));
 Objeto.GetFromControl;
 With Objeto Do
 try
  vlLinea:=ObtenEncab;
  if vlLinea <>'' then vlarchivo.Add(vlLinea);
  for vlRow := 1 to ( sagDATOS.RowCount - 1 ) do //Procesa todos los registros
  begin
    VGConReg:=VGConReg+1;
    vlLinea:='';
    With sagDATOS Do
    BEGIN
      If (Ejercicio.AsInteger < 2005) Then
       Begin
       vlLinea:= Format( '2%s%s%-13s%-18s%-150s%-160s%-40s%-40s%s%s%s%s%s%s%s%s%s%s%-160s',
                      [ format('%.8d',[VGConReg]), //consec. reg.
                        CellS[C_CVE_IDEN,vlRow], // identificador
                        Cells[C_RFC_CURP,vlRow], // RFC_CURP
                        Cells[C_CURP,vlRow], // RFC_CURP
                        Cells[C_NOMBRE_T,vlRow], // NOMBRE_TIT
                        Cells[C_DOMICI_T,vlRow], // DOMICILIO
                        Cells[C_NUM_CCTO,vlRow], // NUM_REFERENCIA
                        Cells[C_NUM_FIDE,vlRow], // NUM_REG_FIDE
                        formatfloat('#',StrToFloat(Cells[C_DEST_CRE,vlRow])), // CVE_DEST_CREDITO
                        formatfloat('0########0',StrToFloat(Cells[C_INT_NOMD,vlRow])), // IMP_INT_NOM_DEV
                        formatfloat('0########0',StrToFloat(Cells[C_INT_NOMP,vlRow])), // IMP_INT_PAG_ORD
                        formatfloat('0########0',StrToFloat(Cells[C_INT_MORD,vlRow])), // IMP_INT_MOR_DEV
                        formatfloat('0########0',StrToFloat(Cells[C_INT_MORP,vlRow])), // IMP_INT_MOR_PAG
                        formatfloat('0########0',StrToFloat(Cells[C_INT_REAL,vlRow])), // IMP_INT_REAL
                        formatfloat('0########0;-0#######0',StrToFloat(Cells[C_SDO_ANT_,vlRow])), // SDO_CIE_ANIO_ANT
                        formatfloat('0########0;-0#######0',StrToFloat(Cells[C_SDO_CRED,vlRow])), // SDO_PROMEDIO
                        formatfloat('0######0',StrToFloat(Cells[C_F_CONTRA,vlRow])), // F_CONTRATACION
                        formatfloat('0#0',StrToFloat(Cells[C_PROP_DED,vlRow])), // PROP_DEDUCIBLE
                        Cells[C_DOMICI_INMU,vlRow] // DOMICILIO_INMU
                      ]
                    );//DETALLE
        End
       Else If (Ejercicio.AsInteger = 2005) Then
        Begin
        vlLinea:= Format( '2%s%s%-13s%-18s%-150s%-160s%-40s%-40s%s%s%s%s%s%s%s%s%s%s%-160s',
                       [ format('%.8d',[VGConReg]), //consec. reg.
                         CellS[C_CVE_IDEN,vlRow], // identificador
                         Cells[C_RFC_CURP,vlRow], // RFC_CURP
                         Cells[C_CURP,vlRow], // RFC_CURP
                         Cells[C_NOMBRE_T,vlRow], // NOMBRE_TIT
                         Cells[C_DOMICI_T,vlRow], // DOMICILIO
                         Cells[C_NUM_CCTO,vlRow], // NUM_REFERENCIA
                         Cells[C_NUM_FIDE,vlRow], // NUM_REG_FIDE
                         formatfloat('#',StrToFloat(Cells[C_DEST_CRE,vlRow])), // CVE_DEST_CREDITO
                         formatfloat('0######0.00',StrToFloat(Cells[C_INT_NOMD,vlRow])), // IMP_INT_NOM_DEV  -- cambio de 10 a 11
                         formatfloat('0######0.00',StrToFloat(Cells[C_INT_NOMP,vlRow])), // IMP_INT_PAG_ORD  -- cambio de 10 a 11
                         formatfloat('0######0.00',StrToFloat(Cells[C_INT_MORD,vlRow])), // IMP_INT_MOR_DEV  -- cambio de 10 a 11
                         formatfloat('0######0.00',StrToFloat(Cells[C_INT_MORP,vlRow])), // IMP_INT_MOR_PAG  -- cambio de 10 a 11
                         formatfloat('0######0.00',StrToFloat(Cells[C_INT_REAL,vlRow])), // IMP_INT_REAL     -- cambio de 10 a 11
                         formatfloat('0######0.00;-0#####0.00',StrToFloat(Cells[C_SDO_ANT_,vlRow])), // SDO_CIE_ANIO_ANT -- cambio de 10 a 11
                         formatfloat('0######0.00;-0#####0.00',StrToFloat(Cells[C_SDO_CRED,vlRow])), // SDO_PROMEDIO     -- cambio de 10 a 11
                         formatfloat('0######0',StrToFloat(Cells[C_F_CONTRA,vlRow])), // F_CONTRATACION
                         formatfloat('0#0',StrToFloat(Cells[C_PROP_DED,vlRow])), // PROP_DEDUCIBLE
                         Cells[C_DOMICI_INMU,vlRow] // DOMICILIO_INMU
                       ]
                     );//DETALLE
        End
       Else If ((Ejercicio.AsInteger = 2006) Or (Ejercicio.AsInteger = 2007) {Or (Ejercicio.AsInteger = 2008)}) Then
        Begin          // '2%s%s%-13s%-18s%-50s%-50s%-50s%-65s%-12s%-12s%-65s%-6s%-40s%-40s%s%s%s%s%s%s%s%s%s%s%-65s%-12s%-12s%-65s%-6s%',
        vlLinea:= Format('2%-8s%-1s%-13s%-18s%-50s%-50s%-50s%-65s%-12s%-12s%-65s%-6s%-40s%-40s%-1s%-11s%-11s%-11s%-11s%-11s%-11s%-11s%-8s%-3s%-65s%-12s%-12s%-65s%-6s',
                       [ format('%.8d',[VGConReg]), //consec. reg.
                         CellS[C_CVE_IDEN,vlRow], // identificador
                         Cells[C_RFC_CURP,vlRow], // RFC_CURP
                         Cells[C_CURP,vlRow], // RFC_CURP
                         Cells[C_NOMBRE_PERSONA   ,vlRow],
                         Cells[C_APELLIDO_PATERNO ,vlRow],
                         Cells[C_APELLIDO_MATERNO ,vlRow],
                         Cells[C_DOM_CALLE        ,vlRow],
                         Cells[C_DOM_NUM_EXT      ,vlRow],
                         Cells[C_DOM_NUM_INT      ,vlRow],
                         Cells[C_DOM_COLONIA      ,vlRow],
                         Cells[C_DOM_CODIGO_POSTAL,vlRow],
                         Cells[C_NUM_CCTO,vlRow], // NUM_REFERENCIA
                         Cells[C_NUM_FIDE,vlRow], // NUM_REG_FIDE
                         formatfloat('#',StrToFloat(Cells[C_DEST_CRE,vlRow])), // CVE_DEST_CREDITO
                         formatfloat('0######0.00',StrToFloat(Cells[C_INT_NOMD,vlRow])), // IMP_INT_NOM_DEV  -- cambio de 10 a 11
                         formatfloat('0######0.00',StrToFloat(Cells[C_INT_NOMP,vlRow])), // IMP_INT_PAG_ORD  -- cambio de 10 a 11
                         formatfloat('0######0.00',StrToFloat(Cells[C_INT_MORD,vlRow])), // IMP_INT_MOR_DEV  -- cambio de 10 a 11
                         formatfloat('0######0.00',StrToFloat(Cells[C_INT_MORP,vlRow])), // IMP_INT_MOR_PAG  -- cambio de 10 a 11
                         formatfloat('0######0.00',StrToFloat(Cells[C_INT_REAL,vlRow])), // IMP_INT_REAL     -- cambio de 10 a 11
                         formatfloat('0######0.00;-0#####0.00',StrToFloat(Cells[C_SDO_ANT_,vlRow])), // SDO_CIE_ANIO_ANT -- cambio de 10 a 11
                         formatfloat('0######0.00;-0#####0.00',StrToFloat(Cells[C_SDO_CRED,vlRow])), // SDO_PROMEDIO     -- cambio de 10 a 11
//                         formatfloat('0######0',StrToFloat(Cells[C_F_CONTRA,vlRow])), // F_CONTRATACION
                         Cells[C_F_CONTRA,vlRow],
                         formatfloat('0#0',StrToFloat(Cells[C_PROP_DED,vlRow])), // PROP_DEDUCIBLE
                         Copy(Cells[C_DOM_INMU_CALLE        ,vlRow], 1, 65), // DOMICILIO_INMU
                         Copy(Cells[C_DOM_INMU_NUM_EXT      ,vlRow], 1, 12), // NUMERO EXTERIOR
                         Copy(Cells[C_DOM_INMU_NUM_INT      ,vlRow], 1, 12), // NUMERO INTERIOR
                         Copy(Cells[C_DOM_INMU_COLONIA      ,vlRow], 1, 65), // COLONIA
                         Copy(Cells[C_DOM_INMU_CODIGO_POSTAL,vlRow], 1, 6)   // CODIGO POSTAL
                       ]
                     );//DETALLE
        End
       Else If (Ejercicio.AsInteger >= 2008) Then
//       Else If (Ejercicio.AsInteger = 2008) Then easa 09022010
        Begin
        vlLinea:= Format('2%-8s%-1s%-13s%-18s%-50s%-50s%-50s%-130s%-12s%-12s%-65s%-6s%-50s%-20s%-40s%-40s%-11s%-11s%-11s%-11s%-11s%-11s%-11s%-8s%-3s%-130s%-12s%-12s%-65s%-6s%-50s%-20s',
                       [ format('%.8d',[VGConReg]), //consec. reg.
                         CellS[C_CVE_IDEN,vlRow], // identificador
                         Cells[C_RFC_CURP,vlRow], // RFC_CURP
                         Cells[C_CURP,vlRow], // RFC_CURP
                         Cells[C_NOMBRE_PERSONA   ,vlRow],
                         Cells[C_APELLIDO_PATERNO ,vlRow],
                         Cells[C_APELLIDO_MATERNO ,vlRow],
                         Cells[C_DOM_CALLE        ,vlRow],
                         Cells[C_DOM_NUM_EXT      ,vlRow],
                         Cells[C_DOM_NUM_INT      ,vlRow],
                         Cells[C_DOM_COLONIA      ,vlRow],
                         Cells[C_DOM_CODIGO_POSTAL,vlRow],
                         Cells[C_DOM_MUNICIPIO,vlRow],
                         Cells[C_DOM_ENTIDAD_FED,vlRow],
                         Cells[C_NUM_CCTO,vlRow], // NUM_REFERENCIA
                         Cells[C_NUM_FIDE,vlRow], // NUM_REG_FIDE
//                         formatfloat('#',StrToFloat(Cells[C_DEST_CRE,vlRow])), // CVE_DEST_CREDITO
                         formatfloat('0######0.00',StrToFloat(Cells[C_INT_NOMD,vlRow])), // IMP_INT_NOM_DEV
                         formatfloat('0######0.00',StrToFloat(Cells[C_INT_NOMP,vlRow])), // IMP_INT_PAG_ORD
                         formatfloat('0######0.00',StrToFloat(Cells[C_INT_MORD,vlRow])), // IMP_INT_MOR_DEV
                         formatfloat('0######0.00',StrToFloat(Cells[C_INT_MORP,vlRow])), // IMP_INT_MOR_PAG
                         formatfloat('0######0.00',StrToFloat(Cells[C_INT_REAL,vlRow])), // IMP_INT_REAL
                         formatfloat('0######0.00;-0#####0.00',StrToFloat(Cells[C_SDO_EJER_ACTUAL,vlRow])), // SALDO_INSOLUTO_EJE_A_REPORTAR  -- cambio de 16 a 15
                         formatfloat('0######0.00;-0#####0.00',StrToFloat(Cells[C_SDO_CRED,vlRow])), // SDO_PROMEDIO  -- cambio de 17 a 16
//                         formatfloat('0######0',StrToFloat(Cells[C_F_CONTRA,vlRow])), // F_CONTRATACION  -- cambio de 18 a 17
                         Cells[C_F_CONTRA,vlRow], // F_CONTRATACION  -- cambio de 18 a 17
                         formatfloat('0#0',StrToFloat(Cells[C_PROP_DED,vlRow])), // PROP_DEDUCIBLE  -- cambio de 19 a 18
                         Copy(Cells[C_DOM_INMU_CALLE        ,vlRow], 1, 130), // DOMICILIO_INMU  -- cambio de 20 a 19
                         Copy(Cells[C_DOM_INMU_NUM_EXT      ,vlRow], 1, 12), // NUMERO EXTERIOR
                         Copy(Cells[C_DOM_INMU_NUM_INT      ,vlRow], 1, 12), // NUMERO INTERIOR
                         Copy(Cells[C_DOM_INMU_COLONIA      ,vlRow], 1, 65), // COLONIA
                         Copy(Cells[C_DOM_INMU_CODIGO_POSTAL,vlRow], 1, 6),   // CODIGO POSTAL
                         Copy(Cells[C_DOM_INMU_MUNICIPIO    ,vlRow], 1, 50),   // MUNICIPIO
                         Copy(Cells[C_DOM_INMU_ENTIDAD_FED  ,vlRow], 1, 20)   // ENTIDAD FEDERATIVA
                       ]
                     );//DETALLE
        End
//        Else If (Ejercicio.AsInteger >= 2009) Then easa 09022010
        Else If (Ejercicio.AsInteger >= 2010) Then
        Begin
        MessageDlg('Todavía no se define el LAYOUT correspondiente al '+Ejercicio.AsString,mtWarning, [mbOk], 0);
        Break;
        End;
       vlarchivo.Add(vlLinea);
       Application.ProcessMessages;
    END;//WHIT
  end; //end while
  
  if (vlarchivo.count>0) then
     GeneraSumario(vlarchivo, Ejercicio.AsInteger); // Se modifica por el cambio de modificaciónes al SUMARIO para el ejercicio 2007
     
  //END IF
  vlarchivo.Free;
 except
  on e:exception do
    Begin
    AddLine(MErrores,'Credito='+sagDATOS.CellS[C_NUM_CCTO,vlRow]);
    AddLine(MErrores,(e.message));
    End;
 end;
 AddLine ( MErrores,'Hora Fin : '     + TimeToStr(Time));
 AddLine ( MErrores,'***        ARCHIVO GENERADO           ***');
 AddLine ( MErrores,'====================================================');
end;

procedure TWCrarchsat.SpeedButton7Click(Sender: TObject);
begin
 OpenDialog1.InitialDir:=EDRUTA.Text;
 if OpenDialog1.Execute then
  EDRUTA.Text:= ExtractFilePath(OpenDialog1.FileName);
end;

procedure TWCrarchsat.GeneraSumario(parchivo:TStringList; peNUM_EJERCICIO : Integer);
var vllinea: string;
    vlTipoDeclaracion : Integer;
    vlStrFechaComplementaria : String;
begin
 // <SATV4766> Se modifica el SUMARIO debido a que en el Manual del 2007, se agregan 3 campos más, quedando
 //
 // No. Campo | Descripción                | Tipo y Longitud | Es Nuevo  |   Vació
 //           |                            |                 |           |
 //    01     |  Tipo de registro          |        9(01)    |    No     |     No
 //    02     |  Consecutivo de registro   |        9(08)    |    No     |     No
 //    03     |  Número de registros       |        9(08)    |    No     |     No
 //    04     |  Tipo de Declaración       |        9(01)    |    Si     |     No
 //    05     |  Fecha de presentación     |        9(08)    |    Si     |     No, cuando el campo 4 tiene valor 2
 //           |  de la última declaración  |                 |           |
 //    06     |  Uso futuro                |        X(577)   |    Si     |     Si
// If (peNUM_EJERCICIO >= 2007) Then easa 09022010
 If (peNUM_EJERCICIO = 2007) Then
   Begin

   If (opNormal.Checked) Then
        Begin
        vlTipoDeclaracion := 1; // 1 = Normal
        vlStrFechaComplementaria := '        ';
        End
   Else Begin
        vlTipoDeclaracion := 2; // 2 = Complementaria;
        vlStrFechaComplementaria := FormatDateTime('YYYYMMDD', dtpFechaComplementaria.Date);
        End;
   vllinea:=Format('9%.8d%.8d%1d%-9s%-577s%',[VGConReg+1,VGConReg-1,vlTipoDeclaracion,vlStrFechaComplementaria,'']);
   End
//  Else If (peNUM_EJERCICIO = 2008) Then easa 09.FEB.2010
  Else If (peNUM_EJERCICIO >= 2008) Then
  Begin
    If (opNormal.Checked) Then
    Begin
      vlTipoDeclaracion := 1; // 1 = Normal
      vlStrFechaComplementaria := '        ';
    End
    Else Begin
      vlTipoDeclaracion := 2; // 2 = Complementaria;
      vlStrFechaComplementaria := FormatDateTime('YYYYMMDD', dtpFechaComplementaria.Date);
    End;
   vllinea:=Format('9%.8d%.8d%1d%-8s%-578s%',[VGConReg+1,VGConReg-1,vlTipoDeclaracion,vlStrFechaComplementaria,'']);
  End
  Else
    vllinea:=Format('9%.8d%.8d%-577s%',[VGConReg+1,VGConReg-1]);

 parchivo.Add(vlLinea);
 VGConReg:=1;
 parchivo.SaveToFile(vgNomArch);
 VGConArch:=VGConArch+1;
end;

function TWCrarchsat.ObtenEncab: string;
var vlIdInstitucion :String;
begin
 Result:='';
 With Objeto Do
    Try
     GetFromControl;
     GetSQLStr('SELECT * FROM CTA_VIA_LIQCION WHERE ID_INTERMEDIARIO='+edID_EMPRESA.Text+
               'AND CVE_VIA_LIQCION='+#39+'SAIF'+#39,Objeto.DataBaseName,
               Objeto.SessionName,'CTA_SIST_INTERM', vlIdInstitucion,True);

     ObtenNombreArchivo(edRFC_EMPRESA.Text, vlIdInstitucion, edEJERCICIO.Text); //SATV4766 el 09Feb2006
     If (Ejercicio.AsInteger < 2005) Then
         Result:= Format(  '1%.8d%.3d%s%s%.5d',
                         [ VGConReg,//consec reg
                           VGConArch,//consec archivo
                           FormatDateTime('YYYYMMDD', StrToDateTime('12/03/2004')),//f presentacion
                           formatfloat('0##0',StrToFloat(edEJERCICIO.Text)),//ejercicio
                           strtoint(vlIdInstitucion)//identificador inst
                          ])
     // 17Ene2006 SATV
     Else If ((Ejercicio.AsInteger >= 2005) and (Ejercicio.AsInteger <= 2007)) Then
         Result:= Format(  '1%.8d%.3d%s%s%s',
                         [ VGConReg,//consec reg
                           VGConArch,//consec archivo
//                           FormatDateTime('YYYYMMDD', StrToDateTime('15/02/2006')),//f presentacion
                             FormatDateTime('YYYYMMDD', dtpFechaComplementaria.Date),  //F Presentación   <AACE4754>
                           formatfloat('0##0',StrToFloat(edEJERCICIO.Text)),//ejercicio
                           RFC_EMPRESA.AsString//identificador inst
                          ])
     //<AACEE4754>
//     Else If (Ejercicio.AsInteger = 2008) Then
     Else If (Ejercicio.AsInteger >= 2008) Then //easa 09.FEB.2010
//                Format('9%.8d%.8d%1d%-8s%-578s%',[VGConReg+1,VGConReg-1,vlTipoDeclaracion,vlStrFechaComplementaria,'']);
         Result:= Format(  '1%.8d%.3d%s%s%s%-568s%',
                         [ VGConReg,//consec reg
                           VGConArch,//consec archivo
//                           FormatDateTime('YYYYMMDD', StrToDateTime('15/02/2006')),//f presentacion
                             FormatDateTime('YYYYMMDD', dtpFechaComplementaria.Date),  //F Presentación   <AACE4754>
                           formatfloat('0##0',StrToFloat(edEJERCICIO.Text)),//ejercicio
                           RFC_EMPRESA.AsString,
                           ' ' //identificador inst
                          ])
     ;
     //End If
    Except
      on e:exception do AddLine(MErrores,(e.message));
    End;
end;

// Inicia Modificacion SATV4766 el 09Feb2006, se agrega el RFC
procedure TWCrarchsat.ObtenNombreArchivo(pRFCInstitucion, pIdInstitucion, pAnio: String);
begin
  If (StrToInt(pAnio) <= 2004) Then
   vgNomArch:=Format('%s%.5d%s%.3d',[EDRUTA.Text,strtoint(pIdInstitucion), pAnio, VGConArch])
  Else If ((StrToInt(pAnio) = 2005) Or (StrToInt(pAnio) = 2006) Or (StrToInt(pAnio) = 2007)) Then      //<AACE4754 Nombre del Archivo>
   vgNomArch:=Format('%s%s%s%.3d',[EDRUTA.Text, pRFCInstitucion, pAnio, VGConArch])
//  Else If (StrToInt(pAnio) = 2008)  Then easa 09022010
  Else If (StrToInt(pAnio) >= 2008)  Then
  begin
   vgNomArch:=Format('%s%s%s%.3d%s',[EDRUTA.Text, pRFCInstitucion, pAnio, VGConArch, 'H']);            //</AACE4754 Nombre del Archivo>
//   showmessage(vgNomArch);
  end;
end;
// Termina Modificacion SATV4766 el 09Feb2006

function TWCrarchsat.ReplaceChar(Cadena, strFind, strReplace: String): String;
var I,nLen : Integer;
    vlStr   : String;
begin
 vlStr :='';
 nLen := Length(Cadena);
 If Cadena <> '' Then
 Begin
    For I := 1 To nLen Do
    Begin
       If Cadena[I] = strFind Then
          vlStr := vlStr + strReplace
       else
          vlStr := vlStr + Cadena[I];
    end;
 end
 Else vlStr := Cadena;
 Result := vlStr;
end;

//////////////////////////////////////////////////////////////////////////

procedure TWCrarchsat.TabSet1Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  Case NewTab Of
    0 : dscDataQry.Dataset := QrySaldoInicial;
    1 : dscDataQry.Dataset := QryPeriodosInteres;
    2 : dscDataQry.Dataset := QueryMoratorios;
    3 : dscDataQry.Dataset := QryInteresLiquidado;
    4 : dscDataQry.Dataset := QryDesglosCap;
    5 : dscDataQry.Dataset := QryDesgloseComision;
    6 : dscDataQry.Dataset := QryPagEnero;
    7 : dscDataQry.Dataset := QryImpCredOtorgados;
  End;
end;

procedure TWCrarchsat.AsignaSQL_al_Query(peQry : TQuery; peSQL : String);
begin
  Try
    If peQry.Active Then peQry.Close;
    peQry.DatabaseName := Objeto.Apli.DatabaseName;
    peQry.SessionName := Objeto.Apli.SessionName;
    peQry.SQL.Clear;
    peQry.SQL.Add(peSQL);
    peQry.SQL.SaveToFile('c:\imporT.txt'); //EASA 28ENE2010
    peQry.Open;
   Except
    //ShowMessage('Error');
    ON E: EXCEPTION DO
            BEGIN
              ShowMessage(E.Message);
//              RAISE E.Create( E.Message );

    END;
    //peQry.Close;
   End;
end;

procedure TWCrarchsat.MuestraDatosRevision(pestrID_CREDITO : String);
var vlCveOrigenCred, vlIdAcreditado : string;
    vlResult : string;
begin

// EASA 03.FEB.2010
// OBTIENE EL ORIGEN DEL CREDITO
   vlCveOrigenCred:= '';
   If GetSQLStr('SELECT CVE_ORIGEN_INFO FROM CR_CON_ADEU_CLTV WHERE ID_REG_VIGENTE = 1  AND ID_CREDITO = '+pestrID_CREDITO,
              Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'CVE_ORIGEN_INFO', vlCveOrigenCred, True) Then
    vlResult := vlCveOrigenCred
   else
      showmessage('No se encuentra vigente el crédito '+pestrID_CREDITO);

// OBTIENE EL ID_ACREDITADO
   vlIdAcreditado:= '';
   If GetSQLStr('SELECT ID_ACREDITADO FROM CR_CON_ADEU_CLTV WHERE ID_REG_VIGENTE = 1  AND ID_CREDITO = '+pestrID_CREDITO,
              Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'ID_ACREDITADO', vlIdAcreditado, True) Then
    vlResult := vlIdAcreditado
   else
      showmessage('No se encuentra vigente el crédito '+pestrID_CREDITO);

  AsignaSQL_al_Query( QrySaldoInicial    , ObtenSQLQrySaldoInicial(pestrID_CREDITO));
  AsignaSQL_al_Query( QryPeriodosInteres , ObtenSQLQryPeriodosInteres(pestrID_CREDITO, vlCveOrigenCred));
  AsignaSQL_al_Query( QueryMoratorios    , ObtenSQLQueryMoratorios(pestrID_CREDITO));
  AsignaSQL_al_Query( QryInteresLiquidado, ObtenSQLQryInteresLiquidado(pestrID_CREDITO));
  AsignaSQL_al_Query( QryDesglosCap      , ObtenSQLQryDesglosCap(pestrID_CREDITO));
  AsignaSQL_al_Query( QryDesgloseComision, ObtenSQLQryDesgloseComision(pestrID_CREDITO));
  AsignaSQL_al_Query( QryPagEnero        , ObtenSQLQryPagEnero(pestrID_CREDITO));
  AsignaSQL_al_Query( QrySatCreLayout    , ObtenSQLQrySatCreLayout(pestrID_CREDITO));
  // <SATV4766 13Ene2009>
  AsignaSQL_al_Query( QryImpCredOtorgados, ObtenSQLQryImpCredOtorgadosAcred(vlIdAcreditado));
  // </SATV4766 13Ene2009>
end;

procedure TWCrarchsat.HabilitaCtrlsComplement(pebHabilita : Boolean);
begin
  If pebHabilita Then dtpFechaComplementaria.Color := clWindow
  Else dtpFechaComplementaria.Color := clBtnFace;

  dtpFechaComplementaria.Enabled := pebHabilita;
  lbFechaComplementaria.Enabled  := pebHabilita;
end;

procedure TWCrarchsat.btnMuestraClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRARCHSAT_MUEST',True,True) then
   begin
      If ( Trim(edID_CREDITO.Text) = '') Then
        Begin
        MessageDlg('Favor de Indicar el '+opID_CREDITO.Caption, mtWarning, [mbOk], 0);
        Exit;
        End;

      MuestraDatosRevision(edID_CREDITO.Text);
   end;
end;

function TWCrarchsat.ObtenSQLQryDesglosCap(pestrID_CREDITO : String) : String;
var vlSQL : String;
    vlNUM_EJERCICIO, vlNUM_EJERCICIO_ANT : Integer;
    vlstrNUM_EJERCICIO, vlstrNUM_EJERCICIO_ANT : String;
begin
    vlNUM_EJERCICIO     := StrToInt(edEJERCICIO.Text);
    vlNUM_EJERCICIO_ANT := vlNUM_EJERCICIO - 1;

    vlstrNUM_EJERCICIO     := IntToStr(vlNUM_EJERCICIO);
    vlstrNUM_EJERCICIO_ANT := IntToStr(vlNUM_EJERCICIO_ANT);

    vlSQL := ' SELECT TEMP.*'+coCRLF+
             ' FROM ('+coCRLF+
             '         SELECT NUM_PERIODO,  F_VENCIMIENTO, F_PROG_PAGO, F_PAGO, IMP_CAPITAL, IMP_PAGADO FROM CRE_CAPITAL'+coCRLF+
             '         WHERE ID_CREDITO = '+pestrID_CREDITO+coCRLF+

             //HERJA FEB2012
             {
             '           AND  ('+coCRLF+
             '                      (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
             '                        BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' + ' - 1 AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+  //<ROUY4095 07022012 INI
             '                  AND F_PAGO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+
             '                                AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
             '                  OR'+coCRLF+
             '                     (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' +')' +coCRLF+
             '                              BETWEEN TO_DATE(''01/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
             '                      AND TO_DATE(''31/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
             '                      AND ((    F_PAGO BETWEEN TO_DATE(''01/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')'+coCRLF+
             '                            AND TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')))'+coCRLF+
             '                     )'+coCRLF+
             '                 )'+coCRLF+ //->ROUY4095 07022012 FIN
             }

             '     AND ( '+coCRLF+
             '          ('+coCRLF+
//             '		  F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' + ' - 1 AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
             '		  F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
             '             AND '+coCRLF+
             '             ( '+coCRLF+
//             '              (F_PAGO BETWEEN  to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' + ' - 1  AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') )'+coCRLF+
             '              (F_PAGO BETWEEN  to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') )'+coCRLF+
             '             ) '+coCRLF+
	     '	        ) '+coCRLF+
             '          OR '+coCRLF+
             '          ( '+coCRLF+
             '            F_VENCIMIENTO BETWEEN TO_DATE(''01/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'') AND TO_DATE(''31/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'')'+coCRLF+
             '             AND  '+coCRLF+
	     '		 (  '+coCRLF+
	     '		   (F_PAGO BETWEEN TO_DATE(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND TO_DATE(''31/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''))'+coCRLF+
             '           )'+coCRLF+
             '          ) '+coCRLF+
	     '	      ) '+coCRLF+
             //FIN HERJA FEB2012

             // <SATV4766 26Dic2008>  Se adiciona la consulta a las disposiciones de ICRE01
             ' UNION '+coCRLF+
             '         SELECT NUM_PERIODO, F_VENCIMIENTO, F_PROG_PAGO, F_PAGO, IMP_CAPITAL, IMP_PAGADO'+coCRLF+
             '         FROM CR_CAPITAL'+coCRLF+
             '         WHERE ID_CREDITO = '+pestrID_CREDITO+coCRLF+

             //HERJA FEB2012
             {
             '           AND  ('+coCRLF+
             '                      (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
             '                        BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' + ' - 1 AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+  //<ROUY4095 07022012 INI
             '                  AND F_PAGO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+
             '                                AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
             '                  OR'+coCRLF+
             '                     (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' +')' +coCRLF+
             '                              BETWEEN TO_DATE(''01/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
             '                      AND TO_DATE(''31/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
             '                      AND ((    F_PAGO BETWEEN TO_DATE(''01/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')'+coCRLF+
             '                            AND TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')))'+coCRLF+
             '                     )'+coCRLF+
             '                 )'+coCRLF+ //->ROUY4095 07022012 FIN
             }

             '     AND ( '+coCRLF+
             '          ('+coCRLF+
//             '		  F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' + ' - 1 AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
             '		  F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
             '             AND '+coCRLF+
             '             ( '+coCRLF+
//             '              (F_PAGO BETWEEN  to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' + ' - 1 AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') )'+coCRLF+
             '              (F_PAGO BETWEEN  to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') )'+coCRLF+
             '             ) '+coCRLF+
	     '	        ) '+coCRLF+
             '          OR '+coCRLF+
             '          ( '+coCRLF+
             '            F_VENCIMIENTO BETWEEN TO_DATE(''01/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'') AND TO_DATE(''31/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'')'+coCRLF+
             '             AND  '+coCRLF+
	     '		 (  '+coCRLF+
	     '		   (F_PAGO BETWEEN TO_DATE(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND TO_DATE(''31/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''))'+coCRLF+
             '           )'+coCRLF+
             '          ) '+coCRLF+
	     '	      ) '+coCRLF+
             //FIN HERJA FEB2012   

             '      ) TEMP'+coCRLF+
             ' ORDER BY TEMP.NUM_PERIODO'+coCRLF;
             // </SATV4766 26Dic2008>

  Result := vlSQL;
end;


{EASA FEB 2010 ADECUACIONES PARA EL EJERCICIO 2009}
function TWCrarchsat.ObtenSQLQryPeriodosInteres(pestrID_CREDITO, pestrCveOrigenCred  : String) : String;
var vlSQL : String;
    vlNUM_EJERCICIO, vlNUM_EJERCICIO_ANT : Integer;
    vlstrNUM_EJERCICIO, vlstrNUM_EJERCICIO_ANT : String;
begin
    vlNUM_EJERCICIO     := StrToInt(edEJERCICIO.Text);
    vlNUM_EJERCICIO_ANT := vlNUM_EJERCICIO - 1;

    vlstrNUM_EJERCICIO     := IntToStr(vlNUM_EJERCICIO);
    vlstrNUM_EJERCICIO_ANT := IntToStr(vlNUM_EJERCICIO_ANT);
// easa 03.feb.2010

  if pestrCveOrigenCred = 'C' then    // query para intercreditos
   begin
    vlSQL := ' SELECT CI.ID_CREDITO,'+coCRLF+
             '        CI.NUM_PERIODO,'+coCRLF+
//             '        CI.IMP_INTERES_ORIG    IMP_INTERES_DEVEN,'+coCRLF+
	     '	      (CASE'+coCRLF+
	     '	         WHEN (PAGO.BPAGO IS NOT NULL AND PAGO.F_PAGO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND  TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'') )'+coCRLF+
	     '	    	      OR'+coCRLF+
	     '	              (PAGO.BPAGO IS NULL AND CI.F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND  TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'') AND CI.F_PAGO IS NULL)'+coCRLF+
	     '		 THEN CI.IMP_INTERES_ORIG'+coCRLF+
	     '		 ELSE'+coCRLF+
	     '		   0'+coCRLF+
	     '		END'+coCRLF+
	     '	      ) IMP_INTERES_DEVEN,'+coCRLF+
             //
             '        CI.F_VENCIMIENTO       F_VENCIMIENTO_ORIG,'+coCRLF+
             '        NVL( PAGO.BPAGO, ''F'' ) BPAGO,'+coCRLF+
//             '        NVL ( PAGO.SDO_INSOLUTO , 0) AS SDO_INSOLUTO,'+coCRLF+
//             '         DECODE( PAGO.BPAGO, ''V'', PAGO.SDO_INSOLUTO, Pkgcrsat_Hipo.FnObtSdoInsolutoFA(CI.ID_CREDITO,CI.F_VENCIMIENTO))  AS SDO_INSOLUTO,'+coCRLF+
	     '	      (CASE'+coCRLF+
	     '	         WHEN (PAGO.BPAGO IS NOT NULL AND PAGO.F_PAGO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND  TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'') )'+coCRLF+
	     '	    	      OR'+coCRLF+
	     '	              (PAGO.BPAGO IS NULL AND CI.F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND  TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'') AND CI.F_PAGO IS NULL)'+coCRLF+
	     '		 THEN Pkgcrsat_Hipo.FnObtSdoInsolutoFA(CI.ID_CREDITO,CI.F_VENCIMIENTO)'+coCRLF+
	     '		 ELSE'+coCRLF+
	     '		   0'+coCRLF+
	     '		END'+coCRLF+
	     '	      ) SDO_INSOLUTO,'+coCRLF+
             '        PAGO.F_VENCIMIENTO,'+coCRLF+
             '        NVL(PAGO.F_PAGO, CI.F_PAGO) AS F_PAGO,'+coCRLF+
             '        PAGO.F_PROCESO,'+coCRLF+
             '        NVL(PAGO.IMP_BENEF_GOB,0) AS IMP_BENEF_GOB,'+coCRLF+
             '        NVL(PAGO.IMP_PAGADO_INT,0) AS IMP_PAGADO_INT,'+coCRLF+
             '        NVL(PAGO.TASA_BENEF_GOB,0) AS TASA_BENEF_GOB,'+coCRLF+
             '        PKGCORPO.OBTTIPOCAMBIO( CI.F_VENCIMIENTO, 800, ''V'' ) UDI_F_VENTTO,'+coCRLF+
             '        PAGO.UDI_F_PAGO'+coCRLF+
             ' FROM   CRE_INTERES CI,'+coCRLF+
             '        ( SELECT ''V''  BPAGO,'+coCRLF+
             '                 A.ID_CREDITO,'+coCRLF+
             '                 A.NUM_PERIODO,'+coCRLF+
             '                 PROV.SDO_INSOLUTO,'+coCRLF+
             '                 A.F_VENCIMIENTO,'+coCRLF+
             '                 A.F_PAGO,'+coCRLF+
             '                 A.F_PROCESO,'+coCRLF+
             '                 A.IMP_BENEF_GOB,'+coCRLF+
             '                 A.IMP_PAGADO_INT,'+coCRLF+
             '                 A.TASA_BENEF_GOB,'+coCRLF+
             '                 A.TIPO_CAMBIO as UDI_F_PAGO'+coCRLF+
             '          FROM   ('+coCRLF+
             ''+coCRLF+
             '                   SELECT CI.ID_CREDITO,'+coCRLF+
             '                          CI.NUM_PERIODO,'+coCRLF+
             '                          CI.F_VENCIMIENTO,'+coCRLF+
             '                          NVL(CI.F_PAGO,CT.F_PROCESO) F_PAGO,  --ROIM NVL'+coCRLF+
             '                          CT.F_PROCESO F_PROCESO,'+coCRLF+
             '                          CI.IMP_BENEF_GOB,'+coCRLF+
//             '                          CT.IMP_PAGADO - ABS(CI.IMP_CAPITALIZA) IMP_PAGADO_INT,'+coCRLF+ //HERJA FEB2012
//HERJA MARZO2012
             '                          CI.IMP_INTERES_ORIG IMP_PAGADO_INT,'+coCRLF+
{	     '			       (CASE'+coCRLF+
	     '			          WHEN CI.F_PAGO > CI.F_PROG_PAGO THEN ABS(CI.IMP_CAPITALIZA)'+coCRLF+
	     '				  WHEN CI.F_PAGO <= CI.F_PROG_PAGO THEN CI.IMP_INTERES_ORIG'+coCRLF+
	     '				  ELSE 0'+coCRLF+
	     '				END'+coCRLF+
	     '			       ) IMP_PAGADO_INT,'+coCRLF+
             }
// FIN HERJA MARZO2012
             '                          NVL( CH.TASA_BENEF_GOB, 0 ) TASA_BENEF_GOB,'+coCRLF+
             '                          CT.TIPO_CAMBIO'+coCRLF+
             '                   FROM   CRE_INTERES CI,'+coCRLF+
             '                          CRE_HIPOTECARIO CH,'+coCRLF+
             '                         ( SELECT ID_CREDITO, NUM_PERIODO, TIPO_CAMBIO, MAX(F_PROCESO) AS F_PROCESO, sum(imp_operacion) as IMP_PAGADO '+coCRLF+
             '                           FROM CRE_TRANSACCION'+coCRLF+
//HERJA FEB2012
//'                                        WHERE Pkgcrsat_Hipo.FnObtFVenFAnioInhab(F_APLICACION, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' + ' BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+
//             '                                 AND  TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')'+coCRLF+ //<>ROUY4095 07022012

'                                        WHERE F_APLICACION BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+
//'                                        WHERE F_PROCESO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+
//             '                                 AND  TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')'+coCRLF+
             '                                 AND  TO_DATE(''31/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
// FIN HERJA FEB2012

             '                             AND CVE_OPERACION IN (''CPINTV'', ''CPINTP'',''CAMINT'') --ROIM CAMINT'+coCRLF+
             '                             AND SIT_TRANSACCION = ''AC'''+coCRLF+
             '                           GROUP BY ID_CREDITO, NUM_PERIODO, TIPO_CAMBIO'+coCRLF+   //easa 11.FEB-2010
             '                         ) CT'+coCRLF+
             '                   WHERE CI.ID_CREDITO = '+pestrID_CREDITO+coCRLF+

//HERJA FEB2012
{
             '                      AND (   (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(CI.F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' + ' BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+
             '                                   AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') '+coCRLF+
             '                               AND (   (CI.F_PAGO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+
             '                                        AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
             '                                    OR ((CI.SIT_INTERES = ''LQ'') AND CI.F_PAGO <= to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
             '                                    ) )' +coCRLF+
             '                           OR (' +coCRLF+
             '                                   Pkgcrsat_Hipo.FnObtFVenFAnioInhab(CI.F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' + 'BETWEEN TO_DATE(''01/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')' +coCRLF+
             '                               AND TO_DATE(''31/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')' +coCRLF+
             '                               AND (    (CI.F_PAGO BETWEEN TO_DATE(''01/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')' +coCRLF+
             '                                    AND  TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')'+coCRLF+
             '                                        )'+coCRLF+
             '                                    AND (CI.SIT_INTERES = ''LQ'')'+coCRLF+
             '                                   )'+coCRLF+
             '                              ) )'+coCRLF+ //>ROUY4095 07022012 FIN
}
             '                      AND ( '+coCRLF+
             '                           ('+coCRLF+
             '                 		  CI.F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
             '                              AND '+coCRLF+
             '                              ( '+coCRLF+
             '                               (CI.F_PAGO BETWEEN  to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') )'+coCRLF+
             '                               OR'+coCRLF+
             '                                ((CI.SIT_INTERES = ''LQ'') AND CI.F_PAGO <= to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')) '+coCRLF+
             '                              ) '+coCRLF+
	     '                 	        ) '+coCRLF+
             '                           OR '+coCRLF+
             '                           ( '+coCRLF+
             '                             CI.F_VENCIMIENTO BETWEEN TO_DATE(''01/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'') AND TO_DATE(''31/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'')'+coCRLF+
             '                              AND  '+coCRLF+
	     '                 		 (  '+coCRLF+
	     '                             (CI.F_PAGO BETWEEN TO_DATE(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND TO_DATE(''31/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''))'+coCRLF+
             '                               AND (CI.SIT_INTERES = ''LQ'')'+coCRLF+
             '                            )'+coCRLF+
             '                           ) '+coCRLF+
	     '                 	      ) '+coCRLF+
//FIN HERJA FEB2012
             '                    AND  CH.ID_CREDITO  = CI.ID_CREDITO'+coCRLF+
             '                    AND  CT.ID_CREDITO  = CI.ID_CREDITO'+coCRLF+
             '                    AND  CT.NUM_PERIODO = CI.NUM_PERIODO'+coCRLF+
//HERJA MARZO2012
	     ' 		     ---  ' +coCRLF+
	     '	 	     UNION ALL --UNION PARA TOMAR LAS CAPITALIZACIONES EN CASO DE QUE NO HUBIERA PAGO ' +coCRLF+
             '		     --- ' +coCRLF+
             '            SELECT CI.ID_CREDITO, ' +coCRLF+
             '                   CI.NUM_PERIODO, ' +coCRLF+
             '                   CI.F_VENCIMIENTO, ' +coCRLF+
             '                   CT.F_PROCESO F_PAGO, ' +coCRLF+
             '                   CT.F_PROCESO F_PROCESO,'+coCRLF+             
             '                   CI.IMP_BENEF_GOB, ' +coCRLF+
	     '		     	 ABS(CT.IMP_PAGADO)  IMP_PAGADO_INT, ' +coCRLF+
             '                   NVL( CH.TASA_BENEF_GOB, 0 ) TASA_BENEF_GOB, ' +coCRLF+
             '                   CT.TIPO_CAMBIO ' +coCRLF+
             '            FROM   CRE_INTERES CI, ' +coCRLF+
             '                   CRE_HIPOTECARIO CH, ' +coCRLF+
             '                   ( SELECT ID_CREDITO, NUM_PERIODO, TIPO_CAMBIO, MAX(F_PROCESO) AS F_PROCESO, SUM(IMP_OPERACION) AS IMP_PAGADO ' +coCRLF+
             '                       FROM CRE_TRANSACCION ' +coCRLF+
             '                      WHERE 1=1 ' +coCRLF+
             '                        AND F_PROCESO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+ 
//             '                                          AND  TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')'+coCRLF+
             '                                          AND  TO_DATE(''31/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
             '                        AND CVE_OPERACION IN (''CCREFI'') ' +coCRLF+
             '                        AND SIT_TRANSACCION = ''AC'' ' +coCRLF+
             '                     GROUP BY ID_CREDITO, NUM_PERIODO, TIPO_CAMBIO ' +coCRLF+
             '                   ) CT ' +coCRLF+
             '           WHERE  CI.ID_CREDITO= '+pestrID_CREDITO+coCRLF+
             '              AND CI.F_VENCIMIENTO BETWEEN TO_DATE(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND TO_DATE(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+
             '              AND CI.F_PAGO IS NULL ' +coCRLF+
	     '		    AND  CH.ID_CREDITO(+) = CI.ID_CREDITO ' +coCRLF+
             '              AND  CT.ID_CREDITO = CI.ID_CREDITO ' +coCRLF+
             '              AND  CT.NUM_PERIODO = CI.NUM_PERIODO ' +coCRLF+
//FIN HERJA MARZO2012
             '                 )A, CRE_PROV_DIARIA PROV'+coCRLF+
             '          WHERE  PROV.ID_CREDITO  (+)= A.ID_CREDITO'+coCRLF+
             '             AND PROV.F_PROVISION (+)= A.F_VENCIMIENTO'+coCRLF+
             '        )PAGO, '+coCRLF+
             '        CRE_CREDITO CC'+coCRLF+ //easa 02.feb.2010
             ' WHERE  CI.ID_CREDITO       = '+pestrID_CREDITO+coCRLF+
             '   AND  CC.SIT_CREDITO NOT IN (''CA'',''TA'')'+coCRLF+ //easa 02.feb.2010
             '   AND  CI.ID_CREDITO       = CC.ID_CREDITO'+coCRLF+ //easa 02.feb.2010
//HERJA FEB2012
{             ' AND  Pkgcrsat_Hipo.FnObtFVenFAnioInhab(CI.F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +  ' BETWEEN TO_DATE(''01/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'-1),''dd/mm/yyyy'')' +coCRLF+
             '       AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+ //<>ROUY4095 07022012
 }
             ' AND  CI.F_VENCIMIENTO BETWEEN TO_DATE(''01/12/''||TO_CHAR('+vlstrNUM_EJERCICIO_ANT+'),''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
 //            ' AND  CI.F_PAGO BETWEEN TO_DATE(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND TO_DATE(''31/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
	     ' AND  (CI.F_VENCIMIENTO - CI.PLAZO) < (SELECT NVL(F_LIQ_BNC, (F_VALOR_CRED+DIAS_PLAZO)) FROM CRE_CREDITO WHERE ID_CREDITO = '+pestrID_CREDITO+' ) '+coCRLF+
             ' AND  CI.SIT_INTERES NOT IN (''CA'',''PA'') '+coCRLF+
 //FIN HERJA FEB2012

             '   AND  PAGO.ID_CREDITO  (+)= CI.ID_CREDITO'+coCRLF+
             '   AND  PAGO.NUM_PERIODO (+)= CI.NUM_PERIODO'+coCRLF+
             ' ORDER BY CI.NUM_PERIODO';
    END// END INTERCREDITOS

   else if pestrCveOrigenCred = 'I' then    // query para icre01
   begin
    vlSQL :=

             // <SATV4766 29Dic2008>  Se adiciona la consulta a las disposiciones de ICRE01
             //' UNION'+coCRLF+
             '  SELECT CI.ID_CREDITO,'+coCRLF+
             '         CI.NUM_PERIODO,'+coCRLF+
//             '         CI.IMP_INTERES AS IMP_INTERES_DEVEN,'+coCRLF+
	     '	      (CASE'+coCRLF+
	     '	         WHEN (PAGO.BPAGO IS NOT NULL AND PAGO.F_PAGO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND  TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'') )'+coCRLF+
	     '	    	      OR'+coCRLF+
	     '	              (PAGO.BPAGO IS NULL AND CI.F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND  TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'') AND CI.F_PAGO IS NULL)'+coCRLF+
	     '		 THEN CI.IMP_INTERES'+coCRLF+
	     '		 ELSE'+coCRLF+
	     '		   0'+coCRLF+
	     '		END'+coCRLF+
	     '	      ) IMP_INTERES_DEVEN,'+coCRLF+
             //
             '         CI.F_VENCIMIENTO  AS F_VENCIMIENTO_ORIG,'+coCRLF+
             '         NVL(PAGO.BPAGO, ''F'' ) AS BPAGO,'+coCRLF+
//             '         DECODE( PAGO.BPAGO, ''V'', PAGO.SDO_VIG_TOTAL, 0)  AS SDO_INSOLUTO,'+coCRLF+ // EASA 02-FEB-2010
//             '         DECODE( PAGO.BPAGO, ''V'', PAGO.SDO_INSOLUTO, Pkgcrsat_Hipo.FnObtSdoInsolutoFA(CI.ID_CREDITO,CI.F_VENCIMIENTO))  AS SDO_INSOLUTO,'+coCRLF+
	     '	      (CASE '+coCRLF+
	     '	         WHEN (PAGO.BPAGO IS NOT NULL AND PAGO.F_PAGO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND  TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'') )'+coCRLF+
	     '	    	      OR'+coCRLF+
	     '	              (PAGO.BPAGO IS NULL AND CI.F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND  TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'') AND CI.F_PAGO IS NULL)'+coCRLF+
	     '		 THEN Pkgcrsat_Hipo.FnObtSdoInsolutoFA(CI.ID_CREDITO,CI.F_VENCIMIENTO)'+coCRLF+
	     '		 ELSE'+coCRLF+
	     '		   0'+coCRLF+
	     '		END'+coCRLF+
	     '	      ) SDO_INSOLUTO,'+coCRLF+
             '         PAGO.F_VENCIMIENTO,'+coCRLF+
             '         NVL(PAGO.F_PAGO, CI.F_PAGO) AS F_PAGO,'+coCRLF+ // EASA 02-FEB-2010
             '         PAGO.F_PAGO AS F_PROCESO,'+coCRLF+
             '         NVL(PAGO.IMP_BENEF_GOB,0) AS IMP_BENEF_GOB,'+coCRLF+
             '         NVL(PAGO.IMP_PAGADO_INT,0) AS IMP_PAGADO_INT,'+coCRLF+
             '         0 AS TASA_BENEF_GOB,'+coCRLF+
             '         PKGCORPO.OBTTIPOCAMBIO( CI.F_VENCIMIENTO, 800, ''V'' ) AS UDI_F_VENTTO,'+coCRLF+
             '         PAGO.UDI_F_PAGO'+coCRLF+
             '  FROM  CR_INTERES CI,'+coCRLF+ // easa 02.feb.2009
// easa 02.feb.2009
             '       ( -- Obtiene todos los pagos efectuados al interés '+coCRLF+
             '         SELECT ''V'' AS BPAGO,'+coCRLF+
             '                A.ID_CREDITO, '+coCRLF+
             '                A.NUM_PERIODO,'+coCRLF+
             '                CHC.SDO_VIG_TOTAL AS SDO_INSOLUTO,'+coCRLF+
             '                A.F_VENCIMIENTO,'+coCRLF+
             '                A.F_PAGO,'+coCRLF+
             '                A.IMP_BENEF_GOB,'+coCRLF+
             '                A.IMP_PAGADO_INT,'+coCRLF+
             '                A.TIPO_CAMBIO AS UDI_F_PAGO '+coCRLF+
             '         FROM   ( SELECT '+coCRLF+//''V'' AS BPAGO,'+coCRLF+
             '                          CI.ID_CREDITO,'+coCRLF+
             '                          CI.NUM_PERIODO,'+coCRLF+
             '                          CI.F_VENCIMIENTO,'+coCRLF+
             '                          NVL(CT.F_OPERACION, CI.F_PAGO) AS F_PAGO,'+coCRLF+
             '                          CI.IMP_BENEF_GOB,'+coCRLF+
             '                          CI.IMP_PAGADO  AS IMP_PAGADO_INT,'+coCRLF+ //SUM(CDT.IMP_CONCEPTO) AS IMP_PAGADO_INT'+coCRLF+
             '                          CT.TIPO_CAMBIO'+coCRLF+
             '                  FROM ( SELECT CI.ID_CREDITO,'+coCRLF+
             '                                CI.NUM_PERIODO,'+coCRLF+
             '                                CI.F_VENCIMIENTO,'+coCRLF+
             '                                CI.F_PAGO,'+coCRLF+
             '                                CI.IMP_BENEF_GOB,'+coCRLF+
             '                                CI.IMP_PAGADO'+coCRLF+
             '                         FROM CR_INTERES CI,'+coCRLF+
             '                              CR_CREDITO CC'+coCRLF+ //easa 02.feb.2010
             '                         WHERE CI.ID_CREDITO = '+pestrID_CREDITO+coCRLF+
             '                           AND CC.ID_CREDITO = CI.ID_CREDITO  '+coCRLF+  //easa 02.feb.2010
             '                           AND CC.SIT_CREDITO <> ''CA'''+coCRLF+ //easa 02.feb.2010

             //HERJA FEB2012
             {
             '                      AND (   (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(CI.F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' + ' BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+
             '                                   AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') '+coCRLF+
             '                               AND (   (CI.F_PAGO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+
             '                                        AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
             '                                    OR ((CI.SIT_INTERES = ''LQ'') AND CI.F_PAGO <= to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
             '                                    ) )' +coCRLF+
             '                           OR (' +coCRLF+
             '                                   Pkgcrsat_Hipo.FnObtFVenFAnioInhab(CI.F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' + 'BETWEEN TO_DATE(''01/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')' +coCRLF+
             '                               AND TO_DATE(''31/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')' +coCRLF+
             '                               AND (    (CI.F_PAGO BETWEEN TO_DATE(''01/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')' +coCRLF+
             '                                    AND  TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')'+coCRLF+
             '                                        )'+coCRLF+
             '                                    AND (CI.SIT_INTERES = ''LQ'')'+coCRLF+
             '                                   )'+coCRLF+
             '                              ) )'+coCRLF+ //>ROUY4095 07022012 FIN
             }

             '                      AND ( '+coCRLF+
             '                           ('+coCRLF+
             '                 		  CI.F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
             '                              AND '+coCRLF+
             '                              ( '+coCRLF+
             '                               (CI.F_PAGO BETWEEN  to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') )'+coCRLF+
             '                               OR'+coCRLF+
             '                                ((CI.SIT_INTERES = ''LQ'') AND CI.F_PAGO <= to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')) '+coCRLF+
             '                              ) '+coCRLF+
	     '                 	        ) '+coCRLF+
             '                           OR '+coCRLF+
             '                           ( '+coCRLF+
             '                             CI.F_VENCIMIENTO BETWEEN TO_DATE(''01/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'') AND TO_DATE(''31/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'')'+coCRLF+
             '                              AND  '+coCRLF+
	     '                 		 (  '+coCRLF+
	     '                             (CI.F_PAGO BETWEEN TO_DATE(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND TO_DATE(''31/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''))'+coCRLF+
             '                               AND (CI.SIT_INTERES = ''LQ'')'+coCRLF+
             '                            )'+coCRLF+
             '                           ) '+coCRLF+
	     '                 	      ) '+coCRLF+
//FIN HERJA FEB2012

             '                       ) CI,'+coCRLF+
             '                       ( -- Obtiene los periodos en los que se han efectuado pagos de interés,'+coCRLF+
             '                         -- recuperando el Tipo de Cambio Aplicado en el periodo '+coCRLF+
//ROUY4095             '                        SELECT CT.ID_CREDITO, CT.ID_PERIODO, CT.TIPO_CAMBIO, max(CT.F_OPERACION ) as F_OPERACION'+coCRLF+ //easa  11.feb.2010 funcion max
             '                        SELECT CT.ID_CREDITO, CT.ID_PERIODO, CT.TIPO_CAMBIO, MAX(CT.F_OPERACION) as F_OPERACION'+coCRLF+ //easa  11.feb.2010 funcion max
             '                        FROM CR_TRANSACCION CT,'+coCRLF+
             '                             CR_DET_TRANSAC CDT,  '+coCRLF+
             '                            ( SELECT CVE_OPERACION FROM CR_OPERACION'+coCRLF+
             '                              WHERE ( CVE_OPERACION LIKE ''PAGO%'''+coCRLF+
             '                                AND CVE_ACCESORIO = ''IN'') '+coCRLF+
             '                                 OR CVE_OPERACION LIKE ''PAINFA'''+coCRLF+
             '                            ) CO'+coCRLF+
//ROUY4095   '                        WHERE CT.F_OPERACION     >= to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') '+coCRLF+
//ROUY4095   '                          AND CT.F_OPERACION     <= to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') '+coCRLF+
             '                          WHERE CT.ID_CREDITO       = '+pestrID_CREDITO + coCRLF+
             '                          AND CT.CVE_OPERACION    = CO.CVE_OPERACION '+coCRLF+
             '                          AND CT.SIT_TRANSACCION  = ''AC'' '+coCRLF+
             '                          AND CT.ID_TRANS_CANCELA IS NULL '+coCRLF+
             '                          AND CDT.ID_TRANSACCION  = CT.ID_TRANSACCION'+coCRLF+
             '                          AND CDT.CVE_OPERACION   = CT.CVE_OPERACION'+coCRLF+
             '                          GROUP BY CT.ID_CREDITO, CT.ID_PERIODO, CT.TIPO_CAMBIO'+coCRLF+
             '                        ) CT '+coCRLF+
             '                  WHERE CI.ID_CREDITO  = CT.ID_CREDITO'+coCRLF+
             '                    AND CI.NUM_PERIODO = CT.ID_PERIODO'+coCRLF+
             '                )A, CR_HISTO_CRED CHC '+coCRLF+
             '         WHERE  CHC.ID_CREDITO (+)= A.ID_CREDITO '+coCRLF+
             '           AND CHC.F_CIERRE    (+)= A.F_VENCIMIENTO'+coCRLF+
             '       ) PAGO'+coCRLF+

//HERJA FEB2012
{
             '  WHERE  CI.ID_CREDITO     = '+pestrID_CREDITO+coCRLF+
             '    AND  Pkgcrsat_Hipo.FnObtFVenFAnioInhab(CI.F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +  ' BETWEEN TO_DATE(''01/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'-1),''dd/mm/yyyy'')' +coCRLF+
             '          AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+ //<>ROUY4095 07022012
}
             '      ,CR_CREDITO CC '+coCRLF+
             '  WHERE CC.ID_CREDITO = '+pestrID_CREDITO+coCRLF+
             '   AND  CI.ID_CREDITO = CC.ID_CREDITO '+coCRLF+
             '   AND  CI.F_VENCIMIENTO BETWEEN TO_DATE(''01/12/''||TO_CHAR('+vlstrNUM_EJERCICIO_ANT+'),''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
             '   AND  (CI.F_VENCIMIENTO - CI.PLAZO) < (SELECT NVL(F_LIQUIDACION,F_VENCIMIENTO) FROM CR_CREDITO WHERE ID_CREDITO = '+pestrID_CREDITO+' ) '+coCRLF+
 //            ' AND  CI.F_PAGO BETWEEN TO_DATE(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND TO_DATE(''31/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
             ' AND  CI.SIT_INTERES NOT IN (''CA'',''PA'') '+coCRLF+
//FIN HERJA FEB2012

             '    AND  PAGO.ID_CREDITO (+)= CI.ID_CREDITO '+coCRLF+
             '    AND  PAGO.NUM_PERIODO(+)= CI.NUM_PERIODO  '+coCRLF+
             '  -- </ICRE01> '+coCRLF+
             ' ORDER BY CI.NUM_PERIODO';
       END;
    Result := vlSQL;
end;

function TWCrarchsat.ObtenSQLQryDesgloseComision(pestrID_CREDITO : String) : String;
var vlSQL : String;
    vlNUM_EJERCICIO, vlNUM_EJERCICIO_ANT : Integer;
    vlstrNUM_EJERCICIO, vlstrNUM_EJERCICIO_ANT : String;
begin
    vlNUM_EJERCICIO     := StrToInt(edEJERCICIO.Text);
    vlNUM_EJERCICIO_ANT := vlNUM_EJERCICIO - 1;

    vlstrNUM_EJERCICIO     := IntToStr(vlNUM_EJERCICIO);
    vlstrNUM_EJERCICIO_ANT := IntToStr(vlNUM_EJERCICIO_ANT);

   { // Query Original....
    vlSQL :=
             ' SELECT NUM_PERIODO,  F_VENCIMIENTO, F_PROG_PAGO, F_PAGO, IMP_COMISION, IMP_PAGADO FROM CRE_DET_COMISION'+coCRLF+
             ' WHERE ID_CREDITO = '+pestrID_CREDITO+coCRLF+
             ' AND   F_VENCIMIENTO >= TO_DATE(''01/12/'+vlstrNUM_EJERCICIO_ANT+#39',''DD/MM/YYYY'')'+coCRLF+
             ' AND   F_VENCIMIENTO <= TO_DATE(''01/12/'+vlstrNUM_EJERCICIO+#39',''DD/MM/YYYY'')'+coCRLF+
             ' ORDER BY  NUM_PERIODO'+coCRLF;
   }
    // <SATV4766 26Dic2008>  Se adiciona la consulta a las disposiciones de ICRE01
    vlSQL := ' SELECT TEMP.*'+coCRLF+
             ' FROM ('+coCRLF+
             '         SELECT NUM_PERIODO,  F_VENCIMIENTO, F_PROG_PAGO, F_PAGO, IMP_COMISION, IMP_PAGADO'+coCRLF+
             '         FROM CRE_DET_COMISION'+coCRLF+
             '         WHERE ID_CREDITO = '+pestrID_CREDITO+coCRLF+

//HERJA FEB2012
{
             '           AND  ('+coCRLF+
             '                      (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
             '                        BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' + ' AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+  //<ROUY4095 07022012 INI
             '                  AND F_PAGO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+
             '                                AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
             '                  OR'+coCRLF+
             '                     (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' +')' +coCRLF+
             '                              BETWEEN TO_DATE(''01/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
             '                      AND TO_DATE(''31/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
             '                      AND ((    F_PAGO BETWEEN TO_DATE(''01/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')'+coCRLF+
             '                            AND TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')))'+coCRLF+
             '                     )'+coCRLF+
             '                 )'+coCRLF+ //->ROUY4095 07022012 FIN
}
             '     AND ( '+coCRLF+
             '          ('+coCRLF+
             '		  F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
             '             AND '+coCRLF+
             '             ( '+coCRLF+
             '              (F_PAGO BETWEEN  to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') )'+coCRLF+
             '             ) '+coCRLF+
	     '	        ) '+coCRLF+
             '          OR '+coCRLF+
             '          ( '+coCRLF+
             '            F_VENCIMIENTO BETWEEN TO_DATE(''01/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'') AND TO_DATE(''31/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'')'+coCRLF+
             '             AND  '+coCRLF+
	     '		 (  '+coCRLF+
	     '		   (F_PAGO BETWEEN TO_DATE(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND TO_DATE(''31/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''))'+coCRLF+
             '           )'+coCRLF+
             '          ) '+coCRLF+
	     '	      ) '+coCRLF+
             //FIN HERJA FEB2012

             '       UNION '+coCRLF+
             '         SELECT NUM_PERIODO,  F_VENCIMIENTO, F_PROG_PAGO, F_PAGO, IMP_COMISION, IMP_PAGADO'+coCRLF+
             '         FROM CR_COMISION'+coCRLF+
             '         WHERE ID_CREDITO = '+pestrID_CREDITO+coCRLF+

//HERJA REB2012
{
             '           AND  ('+coCRLF+
             '                      (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
             '                        BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' + ' AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+  //<ROUY4095 07022012 INI
             '                  AND F_PAGO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+
             '                                AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
             '                  OR'+coCRLF+
             '                     (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' +')' +coCRLF+
             '                              BETWEEN TO_DATE(''01/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
             '                      AND TO_DATE(''31/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
             '                      AND ((    F_PAGO BETWEEN TO_DATE(''01/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')'+coCRLF+
             '                            AND TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')))'+coCRLF+
             '                     )'+coCRLF+
             '                 )'+coCRLF+ //->ROUY4095 07022012 FIN
}
             '     AND ( '+coCRLF+
             '          ('+coCRLF+
             '		  F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
             '             AND '+coCRLF+
             '             ( '+coCRLF+
             '              (F_PAGO BETWEEN  to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') )'+coCRLF+
             '             ) '+coCRLF+
	     '	        ) '+coCRLF+
             '          OR '+coCRLF+
             '          ( '+coCRLF+
             '            F_VENCIMIENTO BETWEEN TO_DATE(''01/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'') AND TO_DATE(''31/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'')'+coCRLF+
             '             AND  '+coCRLF+
	     '		 (  '+coCRLF+
	     '		   (F_PAGO BETWEEN TO_DATE(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND TO_DATE(''31/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''))'+coCRLF+
             '           )'+coCRLF+
             '          ) '+coCRLF+
	     '	      ) '+coCRLF+
             //FIN HERJA FEB2012

             '       ) TEMP'+coCRLF+
             ' ORDER BY TEMP.NUM_PERIODO'+coCRLF;
    // </SATV4766 26Dic2008>

    Result := vlSQL;
end;

function TWCrarchsat.ObtenSQLQryInteresLiquidado(pestrID_CREDITO : String) : String;
var vlSQL : String;
    vlNUM_EJERCICIO, vlNUM_EJERCICIO_ANT : Integer;
    vlstrNUM_EJERCICIO, vlstrNUM_EJERCICIO_ANT : String;
begin
    vlNUM_EJERCICIO     := StrToInt(edEJERCICIO.Text);
    vlNUM_EJERCICIO_ANT := vlNUM_EJERCICIO - 1;

    vlstrNUM_EJERCICIO     := IntToStr(vlNUM_EJERCICIO);
    vlstrNUM_EJERCICIO_ANT := IntToStr(vlNUM_EJERCICIO_ANT);

    vlSQL :=
             '         SELECT ID_CREDITO, NUM_PERIODO, B_COB_AUT, F_PAGO, F_PROG_PAGO, F_VENCIMIENTO,'+coCRLF+
             '                IMP_BENEF_BCO,  IMP_BENEF_GOB,  IMP_INTERES_DIA,  IMP_INTERES_PER as imp_interes,'+coCRLF+
             '                IMP_INTERES_PROY,  IMP_IVA,  IMP_IVA_PAGADO,  IMP_PAGADO ,   PLAZO,  SIT_INTERES,  TASA_APLICADA '+coCRLF+
             '         FROM CRE_INTERES'+coCRLF+
             '         WHERE ID_CREDITO = ' + pestrID_CREDITO +coCRLF+
//HERJA FEB2012
{
             '           AND  ('+coCRLF+
             '                      (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
             '                        BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' + ' AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+  //<ROUY4095 07022012 INI
             '                  AND F_PAGO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+
             '                                AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
             '                  OR'+coCRLF+
             '                     (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' +')' +coCRLF+
             '                              BETWEEN TO_DATE(''01/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
             '                      AND TO_DATE(''31/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
             '                      AND ((    F_PAGO BETWEEN TO_DATE(''01/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')'+coCRLF+
             '                            AND TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')))'+coCRLF+
             '                     )'+coCRLF+
             '                 )'+coCRLF+ //->ROUY4095 07022012 FIN
}
             '     AND ( '+coCRLF+
             '          ('+coCRLF+
             '		  F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
             '             AND '+coCRLF+
             '             ( '+coCRLF+
             '              (F_PAGO BETWEEN  to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') )'+coCRLF+
             '             ) '+coCRLF+
	     '	        ) '+coCRLF+
             '          OR '+coCRLF+
             '          ( '+coCRLF+
             '            F_VENCIMIENTO BETWEEN TO_DATE(''01/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'') AND TO_DATE(''31/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'')'+coCRLF+
             '             AND  '+coCRLF+
	     '		 (  '+coCRLF+
	     '		   (F_PAGO BETWEEN TO_DATE(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND TO_DATE(''31/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''))'+coCRLF+
             '           )'+coCRLF+
             '          ) '+coCRLF+
	     '	      ) '+coCRLF+
             //FIN HERJA FEB2012

             '              AND   SIT_INTERES = ''LQ'''+coCRLF+
             '              AND  ( F_PAGO IS NULL OR nvl(IMP_PAGADO,0) = 0)'+coCRLF+
             'union '+coCRLF+
             '         SELECT ID_CREDITO, NUM_PERIODO, B_COB_AUT, F_PAGO, F_PROG_PAGO, F_VENCIMIENTO,'+coCRLF+
             '                IMP_BENEF_BCO,  IMP_BENEF_GOB,  IMP_INTERES_DIA,  IMP_INTERES,'+coCRLF+
             '                IMP_INTERES_PROY,  IMP_IVA,  IMP_IVA_PAGADO,  IMP_PAGADO ,  PLAZO,  SIT_INTERES,  TASA_APLICADA '+coCRLF+
             '         FROM CR_INTERES'+coCRLF+
             '         WHERE ID_CREDITO = ' + pestrID_CREDITO +coCRLF+
//HERJA FEB2012
{
             '           AND  ('+coCRLF+
             '                      (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
             '                        BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' + ' AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+  //<ROUY4095 07022012 INI
             '                  AND F_PAGO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+
             '                                AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
             '                  OR'+coCRLF+
             '                     (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' +')' +coCRLF+
             '                              BETWEEN TO_DATE(''01/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
             '                      AND TO_DATE(''31/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
             '                      AND ((    F_PAGO BETWEEN TO_DATE(''01/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')'+coCRLF+
             '                            AND TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')))'+coCRLF+
             '                     )'+coCRLF+
             '                 )'+coCRLF+ //->ROUY4095 07022012 FIN
}
             '     AND ( '+coCRLF+
             '          ('+coCRLF+
             '		  F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
             '             AND '+coCRLF+
             '             ( '+coCRLF+
             '              (F_PAGO BETWEEN  to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') )'+coCRLF+
             '             ) '+coCRLF+
	     '	        ) '+coCRLF+
             '          OR '+coCRLF+
             '          ( '+coCRLF+
             '            F_VENCIMIENTO BETWEEN TO_DATE(''01/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'') AND TO_DATE(''31/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'')'+coCRLF+
             '             AND  '+coCRLF+
	     '		 (  '+coCRLF+
	     '		   (F_PAGO BETWEEN TO_DATE(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND TO_DATE(''31/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''))'+coCRLF+
             '           )'+coCRLF+
             '          ) '+coCRLF+
	     '	      ) '+coCRLF+
             //FIN HERJA FEB2012
                          
             '         AND   SIT_INTERES = ''LQ'''+coCRLF+
             '         AND  ( F_PAGO IS NULL OR nvl(IMP_PAGADO,0) = 0)'+coCRLF
             ;

    Result := vlSQL;
end;

function TWCrarchsat.ObtenSQLQryPagEnero(pestrID_CREDITO : String) : String;
var vlSQL : String;
    vlNUM_EJERCICIO, vlNUM_EJERCICIO_ANT : Integer;
    vlstrNUM_EJERCICIO, vlstrNUM_EJERCICIO_ANT : String;
begin
    vlNUM_EJERCICIO     := StrToInt(edEJERCICIO.Text);
    vlNUM_EJERCICIO_ANT := vlNUM_EJERCICIO - 1;

    vlstrNUM_EJERCICIO     := IntToStr(vlNUM_EJERCICIO);
    vlstrNUM_EJERCICIO_ANT := IntToStr(vlNUM_EJERCICIO_ANT);

    vlSQL :=
             '  SELECT CI.* FROM'+coCRLF+
             '  ( SELECT DISTINCT ID_CREDITO, NUM_PERIODO'+coCRLF+
             '    FROM CRE_TRANSACCION'+coCRLF+
//HERJA FEB2012
{
             '    WHERE Pkgcrsat_Hipo.FnObtFVenFAnioInhab(F_APLICACION, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' + ' BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+
             '                 AND TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')'+coCRLF+ //<>ROUY4095 07022012
}
             '    WHERE F_APLICACION BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')'+coCRLF+
//             '    WHERE F_PROCESO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND TO_DATE(''31/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
//FIN HERJA FEB2012

             '    AND  CVE_OPERACION IN (''CPINTV'', ''CPINTP'',''CAMINT'') --ROIM CAMINT'+coCRLF+
             '    AND SIT_TRANSACCION = ''AC'''+coCRLF+
             '  ) CT,'+coCRLF+
             '  CRE_INTERES CI'+coCRLF+
             '  WHERE CI.ID_CREDITO IN'+coCRLF+
             '  (     SELECT CC.ID_CREDITO'+coCRLF+
             '        FROM   CRE_CREDITO  CC,   CONTRATO     CONT,  PERSONA      P,         DOMICILIO    D,'+coCRLF+
             '               DOMICILIO    DPER, RFC          RFC,   CRE_CONTRATO CCONT,     PERSONA_FISICA PF'+coCRLF+
             '        WHERE ID_CREDITO  = '+pestrID_CREDITO+coCRLF+
             '          AND CCONT.CVE_SUB_TIP_BCO IN ( 57,  61, 139, 147, 140, 59, 60 )'+coCRLF+
             '          AND  ( CC.SIT_CREDITO = ''AC'' OR CC.F_LIQ_BNC >= to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''DD/MM/YYYY'') )'+coCRLF+
             '          AND  CONT.ID_CONTRATO   = CC.ID_CONTRATO        AND  P.ID_PERSONA       = CONT.ID_TITULAR'+coCRLF+
             '          AND  D.ID_DOMICILIO     = CONT.ID_DOMICILIO     AND  DPER.ID_DOMICILIO  = P.ID_DOMICILIO'+coCRLF+
             '          AND  RFC.ID_PERSONA(+)  = CONT.ID_TITULAR       AND  CCONT.ID_CONTRATO  = CC.ID_CONTRATO'+coCRLF+
             '          AND  PF.ID_PERSONA(+)   = P.ID_PERSONA)'+coCRLF+

//HERJA FEB2012
{
             '          AND'+coCRLF+
             '             (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' +')' +coCRLF+
             '                      BETWEEN TO_DATE(''01/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
             '              AND TO_DATE(''31/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
             '              AND ((    F_PAGO BETWEEN TO_DATE(''01/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')'+coCRLF+
             '                    AND TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')))'+coCRLF+
             '             )'+coCRLF+
}
             '     AND ( '+coCRLF+
             '          ( '+coCRLF+
             '            F_VENCIMIENTO BETWEEN TO_DATE(''01/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'') AND TO_DATE(''31/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'')'+coCRLF+
             '             AND  '+coCRLF+
	     '		 (  '+coCRLF+
	     '		   (F_PAGO BETWEEN TO_DATE(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND TO_DATE(''31/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''))'+coCRLF+
             '           )'+coCRLF+
             '          ) '+coCRLF+
	     '	       ) '+coCRLF+
             //FIN HERJA FEB2012

             '  AND   CI.SIT_INTERES = ''LQ'''+coCRLF+
             '  AND   CI.ID_CREDITO = CT.ID_CREDITO'+coCRLF+
             '  AND   CI.NUM_PERIODO = CT.NUM_PERIODO'+coCRLF
             ;

  Result := vlSQL;

end;


{EASA FEB.2010 SE OPTIMIZO QUERY, SE ADICIONO FUNCION FECHA MINIMA FNOBTFMINCIERRE, Y SE IGUALO AL QUERY DEL PL}

function TWCrarchsat.ObtenSQLQrySaldoInicial(pestrID_CREDITO : String) : String;
var vlSQL : String;
    vlNUM_EJERCICIO, vlNUM_EJERCICIO_ANT : Integer;
    vlstrNUM_EJERCICIO, vlstrNUM_EJERCICIO_ANT : String;
begin
    vlNUM_EJERCICIO     := StrToInt(edEJERCICIO.Text);
    vlNUM_EJERCICIO_ANT := vlNUM_EJERCICIO - 1;

    vlstrNUM_EJERCICIO     := IntToStr(vlNUM_EJERCICIO);
    vlstrNUM_EJERCICIO_ANT := IntToStr(vlNUM_EJERCICIO_ANT);
    vlSQL :=
             ' SELECT PROV.ID_CREDITO, PROV.F_PROVISION, PROV.SDO_INSOLUTO, CC.F_VALOR_CRED AS F_INICIO'+coCRLF+
             ' FROM  CRE_PROV_DIARIA PROV, CRE_CREDITO CC'+coCRLF+
             ' WHERE  PROV.ID_CREDITO = '+pestrID_CREDITO+coCRLF+
//             '   AND  PROV.F_PROVISION = admiprod.PKGCRSAT.FNOBTFMINCIERRE( CC.ID_CREDITO,to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''),'+coCRLF+
             '   AND  PROV.F_PROVISION = admiprod.PKGCRSAT_HIPO.FNOBTFMINCIERRE( CC.ID_CREDITO,to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''),'+coCRLF+
             '                                                     to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') )'+coCRLF+
             '   AND PROV.ID_CREDITO  = CC.ID_CREDITO'+coCRLF+
             '   AND CC.SIT_CREDITO NOT IN (''TA'',''CA'')'+coCRLF+
             // <SATV4766 26Dic2008>  Se adiciona la consulta a las disposiciones de ICRE01
             ' UNION'+coCRLF+
             '  SELECT CHC.ID_CREDITO, CHC.F_CIERRE AS F_PROVISION, CHC.SDO_VIG_TOTAL AS SDO_INSOLUTO, CC.F_INICIO'+coCRLF+
             '  FROM CR_HISTO_CRED CHC, CR_CREDITO CC'+coCRLF+
             '  WHERE CHC.ID_CREDITO = '+pestrID_CREDITO+coCRLF+
//             '    AND CHC.F_CIERRE   = admiprod.PKGCRSAT.FNOBTFMINCIERRE( CC.ID_CREDITO,to_date(''01/01/'+ vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''),'+coCRLF+
             '    AND CHC.F_CIERRE   = admiprod.PKGCRSAT_HIPO.FNOBTFMINCIERRE( CC.ID_CREDITO,to_date(''01/01/'+ vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''),'+coCRLF+
             '                                                   to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') )'+coCRLF+
             '    AND CHC.ID_CREDITO = CC.ID_CREDITO'+coCRLF+
             '    AND CC.SIT_CREDITO <> ''CA'''+coCRLF;
             // </SATV4766 26Dic2008>

  Result := vlSQL;
end;

function TWCrarchsat.ObtenSQLQueryMoratorios(pestrID_CREDITO : String) : String;
var vlSQL : String;
    vlNUM_EJERCICIO, vlNUM_EJERCICIO_ANT : Integer;
    vlstrNUM_EJERCICIO, vlstrNUM_EJERCICIO_ANT : String;
begin
    vlNUM_EJERCICIO     := StrToInt(edEJERCICIO.Text);
    vlNUM_EJERCICIO_ANT := vlNUM_EJERCICIO - 1;

    vlstrNUM_EJERCICIO     := IntToStr(vlNUM_EJERCICIO);
    vlstrNUM_EJERCICIO_ANT := IntToStr(vlNUM_EJERCICIO_ANT);

    vlSQL :=
            '  SELECT CT.ID_CREDITO,'+coCRLF+
            '         CT.NUM_PERIODO,'+coCRLF+
            '         CT.IMP_OPERACION,'+coCRLF+
            '         CT.F_PROCESO,'+coCRLF+
            '         CA.F_PAGO,'+coCRLF+
            '         PKGCORPO.OBTTIPOCAMBIO( CT.F_PROCESO, 800, ''V'' ) UDI_F_PAGO'+coCRLF+
            '  FROM   ( SELECT CA.ID_CREDITO,  CA.NUM_PERIODO, CA.F_PAGO'+coCRLF+
            '           FROM CRE_CAPITAL CA,'+coCRLF+
            '           CRE_CREDITO CC'+coCRLF+
            '           WHERE CA.ID_CREDITO = '+pestrID_CREDITO+coCRLF+
            '       AND  CC.SIT_CREDITO NOT IN (''CA'', ''TA'')'+coCRLF+
            '       AND  CA.ID_CREDITO = CC.ID_CREDITO'+coCRLF+
//HERJA FEB2012
{
            '      AND  ('+coCRLF+
            '                 (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(CA.F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
            '                   BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' + ' - 1 AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+  //<ROUY4095 07022012 INI
            '             AND CA.F_PAGO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+
            '                           AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
            '             OR'+coCRLF+
            '                (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(CA.F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' +')' +coCRLF+
            '                         BETWEEN TO_DATE(''01/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
            '                 AND TO_DATE(''31/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
            '                 AND ((    CA.F_PAGO BETWEEN TO_DATE(''01/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')'+coCRLF+
            '                       AND TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')))'+coCRLF+
            '                )'+coCRLF+
            '            )'+coCRLF+ //->ROUY4095 07022012 FIN
}

             '     AND ( '+coCRLF+
             '          ('+coCRLF+
//             '		  CA.F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' + ' - 1 AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
             '		  CA.F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
             '             AND '+coCRLF+
             '             ( '+coCRLF+
             '              (CA.F_PAGO BETWEEN  to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') )'+coCRLF+
             '             ) '+coCRLF+
	     '	        ) '+coCRLF+
             '          OR '+coCRLF+
             '          ( '+coCRLF+
             '            CA.F_VENCIMIENTO BETWEEN TO_DATE(''01/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'') AND TO_DATE(''31/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'')'+coCRLF+
             '             AND  '+coCRLF+
	     '		 (  '+coCRLF+
	     '		   (CA.F_PAGO BETWEEN TO_DATE(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND TO_DATE(''31/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''))'+coCRLF+
             '           )'+coCRLF+
             '          ) '+coCRLF+
	     '	      ) '+coCRLF+
             //FIN HERJA FEB2012

            '             AND CA.F_PAGO > CA.F_PROG_PAGO'+coCRLF+
            '         )CA,  '+coCRLF+
            '         CRE_TRANSACCION CT'+coCRLF+
            '                 WHERE  CT.ID_CREDITO      = '+pestrID_CREDITO+coCRLF+
            '                   AND  CT.CVE_OPERACION   = ''CMORAC'''+coCRLF+
            '                   AND  CT.SIT_TRANSACCION = ''AC'''+coCRLF+
            '                   AND  CT.ID_CREDITO      = CA.ID_CREDITO'+coCRLF+
            '                   AND  CT.NUM_PERIODO     = CA.NUM_PERIODO'+coCRLF+
            ' UNION'+coCRLF+
            '   SELECT CA.ID_CREDITO,'+coCRLF+
            '          CA.NUM_PERIODO,'+coCRLF+
            '          TRANS.IMP_CONCEPTO AS IMP_OPERACION,'+coCRLF+
            '          TRANS.F_OPERACION  AS F_PROCESO,'+coCRLF+
            '          CA.F_PAGO,'+coCRLF+
            '          PKGCORPO.OBTTIPOCAMBIO(  TRANS.F_OPERACION, 800, ''V'' ) UDI_F_PAGO'+coCRLF+
            '   FROM ( SELECT CA.ID_CREDITO,  CA.NUM_PERIODO, CA.F_PAGO'+coCRLF+
            '          FROM   CR_CAPITAL CA,'+coCRLF+
            '                 CR_CREDITO CC'+coCRLF+
            '          WHERE  CA.ID_CREDITO = '+pestrID_CREDITO+coCRLF+
            '            AND  CC.SIT_CREDITO <> ''CA'''+coCRLF+
            '            AND  CA.ID_CREDITO = CC.ID_CREDITO'+coCRLF+
//HERJA FEB2012
{
            '            AND  ('+coCRLF+
            '                       (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(CA.F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
            '                         BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' + ' - 1 AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+  //<ROUY4095 07022012 INI
            '                   AND CA.F_PAGO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' +coCRLF+
            '                                 AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' + ')' +coCRLF+
            '                   OR'+coCRLF+
            '                      (    Pkgcrsat_Hipo.FnObtFVenFAnioInhab(CA.F_VENCIMIENTO, to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')' +')' +coCRLF+
            '                               BETWEEN TO_DATE(''01/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
            '                       AND TO_DATE(''31/12/''||TO_CHAR('+vlstrNUM_EJERCICIO+'),''dd/mm/yyyy'')'+coCRLF+
            '                       AND ((    CA.F_PAGO BETWEEN TO_DATE(''01/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')'+coCRLF+
            '                             AND TO_DATE(''31/01/''||TO_CHAR('+vlstrNUM_EJERCICIO+'+1),''dd/mm/yyyy'')))'+coCRLF+
            '                      )'+coCRLF+
            '                  )'+coCRLF+ //->ROUY4095 07022012 FIN
}
             '     AND ( '+coCRLF+
             '          ('+coCRLF+
//             '		  CA.F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') ' + ' - 1 AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
             '		  CA.F_VENCIMIENTO BETWEEN to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'')'+coCRLF+
             '             AND '+coCRLF+
             '             ( '+coCRLF+
             '              (CA.F_PAGO BETWEEN  to_date(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND to_date(''31/12/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') )'+coCRLF+
             '             ) '+coCRLF+
	     '	        ) '+coCRLF+
             '          OR '+coCRLF+
             '          ( '+coCRLF+
             '            CA.F_VENCIMIENTO BETWEEN TO_DATE(''01/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'') AND TO_DATE(''31/12/'+vlstrNUM_EJERCICIO_ANT+#39',''dd/mm/yyyy'')'+coCRLF+
             '             AND  '+coCRLF+
	     '		 (  '+coCRLF+
	     '		   (CA.F_PAGO BETWEEN TO_DATE(''01/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy'') AND TO_DATE(''31/01/'+vlstrNUM_EJERCICIO+#39',''dd/mm/yyyy''))'+coCRLF+
             '           )'+coCRLF+
             '          ) '+coCRLF+
	     '	      ) '+coCRLF+
             //FIN HERJA FEB2012

            '            AND CA.F_PAGO > CA.F_PROG_PAGO'+coCRLF+
            '        ) CA,'+coCRLF+
            '        ( -- OJO, También toma los moratorios de comisiones en caso de proceder'+coCRLF+
            '         SELECT CT.ID_CREDITO,'+coCRLF+
            '                CT.ID_PERIODO,'+coCRLF+
            '                CT.F_OPERACION,'+coCRLF+
            '                CDT.CVE_OPERACION,'+coCRLF+
            '                CDT.CVE_CONCEPTO,'+coCRLF+
            '                CDT.IMP_CONCEPTO'+coCRLF+
            '         FROM CR_TRANSACCION CT,'+coCRLF+
            '              CR_DET_TRANSAC CDT'+coCRLF+
            '         WHERE CT.ID_CREDITO = '+pestrID_CREDITO+coCRLF+
            '           AND CT.CVE_OPERACION LIKE ''PAGO%'''+coCRLF+ // Busca todos los pagos de la disposición
            '           AND CT.SIT_TRANSACCION = ''AC'''+coCRLF+ //Que estén vigentes
            '           AND CT.ID_TRANS_CANCELA IS NULL'+coCRLF+
            '           AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION'+coCRLF+
            '           AND CDT.CVE_OPERACION = CT.CVE_OPERACION'+coCRLF+
            '           AND CDT.CVE_CONCEPTO = ''IMPMOR'''+coCRLF+ //Importe Moratorio
            '       ) TRANS'+coCRLF+
            '       WHERE TRANS.ID_CREDITO = CA.ID_CREDITO'+coCRLF+
            '         AND TRANS.ID_PERIODO = CA.NUM_PERIODO'+coCRLF;
            // </SATV4766 26Dic2008>
  Result := vlSQL;
end;


function TWCrarchsat.ObtenSQLQrySatCreLayout(pestrID_CREDITO : String) : String;
var vlSQL : String;
    vlNUM_EJERCICIO  : Integer;
    vlstrNUM_EJERCICIO : String;
begin
    vlNUM_EJERCICIO     := StrToInt(edEJERCICIO.Text);
    vlstrNUM_EJERCICIO     := IntToStr(vlNUM_EJERCICIO);

    vlSQL :=
             ' SELECT SCL.SDO_PROMEDIO,'+coCRLF+
             '        SCL.ID_CREDITO,'+coCRLF+
             '        SCL.IMP_INT_NOM_DEV,'+coCRLF+
             '        SCL.IMP_INT_PAG_ORD,'+coCRLF+
             '        SCL.IMP_INT_MOR_DEV,'+coCRLF+
             '        SCL.IMP_INT_PAG_ORD + SCL.IMP_INT_MOR_PAG AS INT_PAGADOS,'+coCRLF+
             '        SCL.IMP_INT_REAL,'+coCRLF+
             '        SCL.F_TIPO_UDI_INI,'+coCRLF+
             '        SCL.F_TIPO_UDI_FIN,'+coCRLF+
             '        SCL.NOMBRE_TIT,'+coCRLF+
             '        CTO.CVE_MONEDA,'+coCRLF+
             '        CSTB.DESC_SUB_TIPO'+coCRLF+
             ' FROM SAT_CRE_LAYOUT SCL,'+coCRLF+
             '      CRE_CREDITO CC,'+coCRLF+
             '      CRE_CONTRATO CO,'+coCRLF+
             '      CONTRATO CTO,'+coCRLF+
             '      CRE_SUB_TIP_BCO CSTB'+coCRLF+
             ' WHERE SCL.ID_EMPRESA = '+IntToStr(Objeto.Apli.IdEmpresa)+coCRLF+
             '   AND SCL.EJERCICIO = '+vlstrNUM_EJERCICIO+coCRLF+
             '   AND SCL.ID_CREDITO = '+pestrID_CREDITO+coCRLF+
             '   AND CC.ID_CREDITO = SCL.ID_CREDITO'+coCRLF+
             '   AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '   AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '   AND CSTB.CVE_SUB_TIP_BCO = CO.CVE_SUB_TIP_BCO'+coCRLF+
             // <SATV4766 29Dic2008>  Se adiciona la consulta a las disposiciones de ICRE01
             '   AND CC.SIT_CREDITO NOT IN (''CA'',''TA'') '+coCRLF+
             'UNION'+coCRLF+
             ' SELECT SCL.SDO_PROMEDIO,'+coCRLF+
             '        SCL.ID_CREDITO,'+coCRLF+             
             '        SCL.IMP_INT_NOM_DEV,'+coCRLF+
             '        SCL.IMP_INT_PAG_ORD,'+coCRLF+
             '        SCL.IMP_INT_MOR_DEV,'+coCRLF+
             '        SCL.IMP_INT_PAG_ORD + SCL.IMP_INT_MOR_PAG AS INT_PAGADOS,'+coCRLF+
             '        SCL.IMP_INT_REAL,'+coCRLF+
             '        SCL.F_TIPO_UDI_INI,'+coCRLF+
             '        SCL.F_TIPO_UDI_FIN,'+coCRLF+
             '        SCL.NOMBRE_TIT,'+coCRLF+             
             '        CTO.CVE_MONEDA,'+coCRLF+
             '        CP.DESC_L_PRODUCTO'+coCRLF+
             ' FROM SAT_CRE_LAYOUT SCL,'+coCRLF+
             '      CR_CREDITO CC,'+coCRLF+
             '      CR_CONTRATO CO,'+coCRLF+
             '      CONTRATO CTO,'+coCRLF+
             '      CR_PRODUCTO CP'+coCRLF+
             ' WHERE SCL.ID_EMPRESA = '+IntToStr(Objeto.Apli.IdEmpresa)+coCRLF+
             '   AND SCL.EJERCICIO = '+vlstrNUM_EJERCICIO+coCRLF+
             '   AND SCL.ID_CREDITO = '+pestrID_CREDITO+coCRLF+
             '   AND CC.ID_CREDITO = SCL.ID_CREDITO'+coCRLF+
             '   AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '   AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '   AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE'+coCRLF+
             '   AND CC.SIT_CREDITO <> ''CA'' '+coCRLF             
             // </SATV4766 29Dic2008>
             ;
  Result := vlSQL;
end;


function TWCrarchsat.ObtenSQLQryImpCredOtorgadosAcred(peStrIdAcreditado : String) : String;
var vlSQL : String;
    vlNUM_EJERCICIO  : Integer;
    vlstrNUM_EJERCICIO : String;
begin
    vlNUM_EJERCICIO     := StrToInt(edEJERCICIO.Text);
    vlstrNUM_EJERCICIO     := IntToStr(vlNUM_EJERCICIO);
    vlSQL := ObtenSQLQryImpCredOtorgados +
            '      WHERE CRED_SAT.ID_ACREDITADO = '+ peStrIdAcreditado + coCRLF
            ;
  Result := vlSQL;
end;

function TWCrarchsat.ObtenTipoCambio(peFECHA : TDateTime) : Real;
var vlTIPO_CAMBIO : Real;
begin
  Result := -1;
  If ( GetSQLFloat('SELECT PKGCORPO.OBTTIPOCAMBIO('+SQLFecha(peFECHA)+', 800, ''V'' ) AS TIPO_CAMBIO FROM DUAL',
                   Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'TIPO_CAMBIO', vlTIPO_CAMBIO, True) ) Then
     Result := vlTIPO_CAMBIO;
end;



procedure TWCrarchsat.btnGeneraClick(Sender: TObject);
var vlnRowCount : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRARCHSAT_GENER',True,True) then
   begin
      If ( (Trim(edID_EMPRESA.Text) <> '') And (Trim(edEJERCICIO.Text) < '') )Then
        Begin
        MessageDlg('Debe de indicar primero el ejercicio y la empresa, para mostrar los datos a procesar.',
                    mtInformation, [mbOk], 0);
        Exit;
        End;

      If opID_CREDITO.Checked Then
         GeneraArchivoRevision(edID_CREDITO.Text, Trim(edEJERCICIO.Text))
      Else
         Begin
           If ( (Trim(edID_EMPRESA.Text) <> '') And (Trim(edEJERCICIO.Text) < '') )Then
              Begin
              MessageDlg('Debe de indicar primero el ejercicio y la empresa, para mostrar los datos a procesar.',
                          mtInformation, [mbOk], 0);
              Exit;
              End;

           If (sagDATOS.RowCount <= 2) Then
              Begin
              MessageDlg('No existen datos que procesar...', mtInformation, [mbOk], 0);
              Exit;
              End;

           // Empieza a procesar cada uno de los créditos
           ProgressBar1.Min := 0;
           ProgressBar1.Max := sagDATOS.RowCount - 1;
    //       For vlnRowCount := 2 To sagDATOS.RowCount - 1 Do easa 04022010
           For vlnRowCount := 1 To sagDATOS.RowCount - 1 Do
             Begin
             GeneraArchivoRevision( sagDATOS.Cells[C_NUM_CCTO, vlnRowCount], Trim(edEJERCICIO.Text));
             ProgressBar1.Position := vlnRowCount;
             Application.ProcessMessages;
             End;
        End;
      MessageDlg('Archivo(s) generado(s)', mtInformation, [mbOk], 0);
   end;
end;

procedure TWCrarchsat.GeneraArchivoRevision(pestrID_CREDITO : String; peNUM_EJERCICIO : String);
var
    vlRange : Variant;
    vlCol, vlRow : integer;
    vgExcelApp : OleVariant;
    vlColumnRange : Variant;
    vlstrRow : String;
    vlF_PAGO, vlF_VENCIMIENTO_INI : TDateTime;
    vlNUM_PERIODO_INI, vlRowAverageIni, vlRowAverageFin : Integer;
    vlRowNumPerIntDev : Integer; //EASA 11.FEB.2010
    vlSDO_INICIAL : Double;
begin
 // Obtiene los datos de la disposición especificada, si no se ha indicado...
 If QrySaldoInicial.Active Then
    Begin
     If (QrySaldoInicial.FieldByName('ID_CREDITO').AsString <> Trim(pestrID_CREDITO)) Then
        MuestraDatosRevision(pestrID_CREDITO)
    End
 Else
   MuestraDatosRevision(pestrID_CREDITO);
 //
 vlNUM_PERIODO_INI := 0;
 vlRowNumPerIntDev := 0;   //EASA 11.FEB.2010
 vgExcelApp := CreateOleObject('Excel.Application');
 vgExcelApp.Workbooks.Add;

 Try
   //-----------------------------------------------
   //         INICIA EL ARMADO DE TITULOS
   //-----------------------------------------------
   //
   vgExcelApp.Cells[ 1 , ColumnXlS('A') ].Value := QrySatCreLayout.FieldByName('DESC_SUB_TIPO').AsString;
   vgExcelApp.Cells[ 1 , ColumnXlS('B') ].Value := 'LIMITE MAXIMO UDIS';
   If (QrySatCreLayout.FieldByName('CVE_MONEDA').AsInteger = 484) Then
      vgExcelApp.Cells[ 2 , ColumnXlS('A') ].Value := 'PESOS'
   Else
      vgExcelApp.Cells[ 2 , ColumnXlS('A') ].Value := 'UDIS';

   vgExcelApp.Cells[ 2 , ColumnXlS('B') ].Value := 'VALOR DE UDI AL ';
   If (QrySatCreLayout.FieldByName('CVE_MONEDA').AsInteger = 484) Then
      vgExcelApp.Cells[ 3 , ColumnXlS('B') ].Value := 'VALOR DE UDI AL ';
   vgExcelApp.Cells[ 4 , ColumnXlS('B') ].Value := 'LIMITE MAXIMO PESOS';
   vgExcelApp.Cells[ 5 , ColumnXlS('B') ].Value := 'AJUSTE DE INFLACION';
   vgExcelApp.Cells[ 6 , ColumnXlS('B') ].Value := 'SALDO INICIAL';

   // <SATV4766 13Ene2009>
   vgExcelApp.Cells[ 5 , ColumnXlS('J') ].Value := 'IMPORTE DE TODAS LAS DISPOSICIONES OTORGADAS';
   vgExcelApp.Cells[ 6 , ColumnXlS('J') ].Value := 'EN EL EJERCICIO AL ACREDITADO DEL MISMO INMUEBLE';   //HERJA MARZO2012 SE AGREGA "DEL MISMO INMUEBLE"
   vgExcelApp.Cells[ 6 , ColumnXlS('M') ].Value := QryImpCredOtorgados.FieldByName('SUM_IMP_CRED_OTORGADOS').AsFloat;
   vgExcelApp.Cells[ 6 , ColumnXlS('M') ].NumberFormat := '#,##0.00';
   // </SATV4766 13Ene2009>

   vgExcelApp.Cells[ 8 , ColumnXlS('B') ].Value := 'INTERES';

   vgExcelApp.Cells[ 9 , ColumnXlS('A') ].Value := 'Credito';
   vgExcelApp.Cells[ 9 , ColumnXlS('B') ].Value := 'Periodo';
   vgExcelApp.Cells[ 9 , ColumnXlS('C') ].Value := 'Int Dev';
   vgExcelApp.Cells[ 9 , ColumnXlS('D') ].Value := 'F Venc';
   vgExcelApp.Cells[ 9 , ColumnXlS('E') ].Value := 'Pago';
   vgExcelApp.Cells[ 9 , ColumnXlS('F') ].Value := 'Sdo Insoluto';
   vgExcelApp.Cells[ 9 , ColumnXlS('G') ].Value := 'F. Venc';
   vgExcelApp.Cells[ 9 , ColumnXlS('H') ].Value := 'F. Pago';
   vgExcelApp.Cells[ 9 , ColumnXlS('I') ].Value := 'F. Val Pago';
   vgExcelApp.Cells[ 9 , ColumnXlS('J') ].Value := 'Beneficios';
   vgExcelApp.Cells[ 9 , ColumnXlS('K') ].Value := 'Pago Int';
   vgExcelApp.Cells[ 9 , ColumnXlS('L') ].Value := 'Tasa Benef.';
   vgExcelApp.Cells[ 9 , ColumnXlS('M') ].Value := 'UDI F. Venc.';
   vgExcelApp.Cells[ 9 , ColumnXlS('N') ].Value := 'UDI';
   vgExcelApp.Cells[ 9 , ColumnXlS('O') ].Value := 'Sdo. Ins. Ben';
   vgExcelApp.Cells[ 9 , ColumnXlS('P') ].Value := 'Int. Dev. Ben';
   vgExcelApp.Cells[ 9 , ColumnXlS('Q') ].Value := 'Pago. Int. Ben';
   vgExcelApp.Cells[ 9 , ColumnXlS('R') ].Value := 'Moras';
   vgExcelApp.Cells[ 9 , ColumnXlS('S') ].Value := 'Moras Ben.';

//EASA 04.FEB.201
 {
   vgExcelApp.Cells[ 24 , ColumnXlS('H') ].Value := 'Calculado';
   vgExcelApp.Cells[ 24 , ColumnXlS('I') ].Value := 'Archivo';
   vgExcelApp.Cells[ 24 , ColumnXlS('J') ].Value := 'Dif.';
 }
   vgExcelApp.Cells[ 40 , ColumnXlS('H') ].Value := 'Calculado';
   vgExcelApp.Cells[ 40 , ColumnXlS('I') ].Value := 'Archivo';
   vgExcelApp.Cells[ 40 , ColumnXlS('J') ].Value := 'Dif.';
   {
   vgExcelApp.Cells[ 25 , ColumnXlS('B') ].Value := 'PORCION DEDUCIBLE';
   vgExcelApp.Cells[ 26 , ColumnXlS('B') ].Value := 'SALDO PROMEDIO';
   vgExcelApp.Cells[ 27 , ColumnXlS('B') ].Value := 'INT. NOM. DEVENGADOS';
   vgExcelApp.Cells[ 28 , ColumnXlS('B') ].Value := 'INT. PAG. ORDINARIOS';
   vgExcelApp.Cells[ 29 , ColumnXlS('B') ].Value := 'INT. MORATORIOS';
   vgExcelApp.Cells[ 30 , ColumnXlS('B') ].Value := 'INT. PAG. DEVENGADOS';
   vgExcelApp.Cells[ 31 , ColumnXlS('B') ].Value := 'FACTOR DE AJUSTE';
   vgExcelApp.Cells[ 32 , ColumnXlS('B') ].Value := 'AJUSTE X INFLACION';
   vgExcelApp.Cells[ 34 , ColumnXlS('B') ].Value := 'INT. REALES';
 }
   vgExcelApp.Cells[ 41 , ColumnXlS('B') ].Value := 'PORCION DEDUCIBLE';
   vgExcelApp.Cells[ 42 , ColumnXlS('B') ].Value := 'SALDO PROMEDIO';
   vgExcelApp.Cells[ 43 , ColumnXlS('B') ].Value := 'INT. NOM. DEVENGADOS';
   vgExcelApp.Cells[ 44 , ColumnXlS('B') ].Value := 'INT. PAG. ORDINARIOS';
   vgExcelApp.Cells[ 45 , ColumnXlS('B') ].Value := 'INT. MORATORIOS';
   vgExcelApp.Cells[ 46 , ColumnXlS('B') ].Value := 'INT. PAG. DEVENGADOS';
   vgExcelApp.Cells[ 47 , ColumnXlS('B') ].Value := 'FACTOR DE AJUSTE';
   vgExcelApp.Cells[ 48 , ColumnXlS('B') ].Value := 'AJUSTE X INFLACION';
   vgExcelApp.Cells[ 50 , ColumnXlS('B') ].Value := 'INT. REALES';

   // Se incluye caso especial de recepción de Pago
   vgExcelApp.Cells[ 1 , ColumnXlS('J') ].Value  := 'Fecha recepción de pago';
   vgExcelApp.Cells[ 2 , ColumnXlS('J') ].Value  := 'Fecha fin de año anterior';
   vgExcelApp.Cells[ 1 , ColumnXlS('L') ].Value  := EncodeDate(StrToInt(edEjercicio.Text),1,31);
   vgExcelApp.Cells[ 2 , ColumnXlS('L') ].Value  := EncodeDate(StrToInt(edEjercicio.Text)-1,12,31);

   vgExcelApp.Cells[ 8 , ColumnXlS('F') ].Value  := ' Acreditado '+QrySatCreLayout.FieldByName('NOMBRE_TIT').AsString;

   //-----------------------------------------------
   //         INICIA EL ARMADO DE FORMÚLAS
   //-----------------------------------------------
   //
   If (QrySatCreLayout.FieldByName('CVE_MONEDA').AsInteger = 484) Then
     Begin
       // Inicia el armado de Formúlas de "Sdo Ins Ben"
       vlCol := 15;
//       For vlRow := 10 To 22 Do
       For vlRow := 10 To 39 Do //EASA 04.FEB.2010
         Begin
         vlstrRow := IntToStr(vlRow);
         vgExcelApp.Cells[vlRow, vlCol].Value := '=IF(J'+vlstrRow+'>0,ROUND(F'+vlstrRow+'*(100-L'+vlstrRow+')/100,2),F'+vlstrRow+')*N'+vlstrRow;
         End;
       // Inicia el armado de Formúlas de "Int Dev Ben"
       vlCol := 16;
       // Se incluye pago especial de pagos antes del 31 de Enero
      // vgExcelApp.Cells[10, vlCol].Value :=  '=(IF(J10>0,ROUND(C10*(100-L10)/100,2),C10)*N10)*(IF(OR(AND(G10=L2,H10<L1),AND(G10>L2,H10>L1)),1,0))';
       vgExcelApp.Cells[10, vlCol].Value :=  '=(IF(J10>0,ROUND(C10*(100-L10)/100,2),C10)*N10)*(IF(OR(AND(G10=L2,H10<=L1),AND(G10>L2,H10>=L1)),1,0))';
//       For vlRow := 11 To 22 Do
       For vlRow := 11 To 39 Do //EASA 04.FEB.2010
         Begin
         vlstrRow := IntToStr(vlRow);
         vgExcelApp.Cells[vlRow, vlCol].Value := '=IF(J'+vlstrRow+'>0,ROUND(C'+vlstrRow+'*(100-L'+vlstrRow+')/100,2),C'+vlstrRow+')*N'+vlstrRow;
         End;
       // Inicia el armado de Formúlas de "Pago Int Ben"
       vlCol := 17;
//       For vlRow := 10 To 22 Do
       For vlRow := 10 To 39 Do //EASA 04.FEB.2010
         Begin
         vlstrRow := IntToStr(vlRow);
         vgExcelApp.Cells[vlRow, vlCol].Value := '=IF(J'+vlstrRow+'>0,ROUND(K'+vlstrRow+'*(100-L'+vlstrRow+')/100,2),K'+vlstrRow+')*N'+vlstrRow;
         End;
       // Inicia el armado de Formúlas de "Moras Ben"
       vlCol := 19;
//       For vlRow := 10 To 22 Do
       For vlRow := 10 To 39 Do //EASA 04.FEB.2010
         Begin
         vlstrRow := IntToStr(vlRow);
         vgExcelApp.Cells[vlRow, vlCol].Value := '=IF(J'+vlstrRow+'>0,ROUND(R'+vlstrRow+'*(100-L'+vlstrRow+')/100,2),R'+vlstrRow+')*N'+vlstrRow;
         End;
     End
   Else
     Begin
       // Inicia el armado de Formúlas de "Sdo Ins Ben"
       vlCol := 15;
//       For vlRow := 10 To 22 Do
       For vlRow := 10 To 39 Do //EASA 04.FEB.2010
         Begin
         vlstrRow := IntToStr(vlRow);
         vgExcelApp.Cells[vlRow, vlCol].Value := '=IF(J'+vlstrRow+'>0,redondeaer(F'+vlstrRow+'*(100-L'+vlstrRow+')/100,2),F'+vlstrRow+')*M'+vlstrRow;
         End;
       // Inicia el armado de Formúlas de "Int Dev Ben"
       vlCol := 16;
//       For vlRow := 10 To 22 Do
       For vlRow := 10 To 39 Do //EASA 04.FEB.2010
         Begin
         vlstrRow := IntToStr(vlRow);
         vgExcelApp.Cells[vlRow, vlCol].Value :=        '=IF(J'+vlstrRow+'>0,ROUND(C'+vlstrRow+'*(100-L'+vlstrRow+')/100,2),C'+vlstrRow+')*IF(H'+vlstrRow+'<G'+vlstrRow+',N'+vlstrRow+',M'+vlstrRow+')';
         End;
       // Inicia el armado de Formúlas de "Pago Int Ben"
       vlCol := 17;
//       For vlRow := 10 To 22 Do
       For vlRow := 10 To 39 Do //EASA 04.FEB.2010
         Begin
         vlstrRow := IntToStr(vlRow);
         vgExcelApp.Cells[vlRow, vlCol].Value := '=IF(J'+vlstrRow+'>0,ROUND(K'+vlstrRow+'*(100-L'+vlstrRow+')/100,2),K'+vlstrRow+')*N'+vlstrRow;
         End;
       // Inicia el armado de Formúlas de "Moras Ben"
       vlCol := 19;
//       For vlRow := 10 To 22 Do
       For vlRow := 10 To 39 Do //EASA 04.FEB.2010
         Begin
         vlstrRow := IntToStr(vlRow);
         vgExcelApp.Cells[vlRow, vlCol].Value := '=IF(J'+vlstrRow+'>0,ROUND(R'+vlstrRow+'*(100-L'+vlstrRow+')/100,2),R'+vlstrRow+')*N'+vlstrRow;
         End;
     End;
   // Formúlas para cálculo de Intereses...

   // <SATV4766 13Ene2009> Se incluye en el cálculo el IMPORTE DE TODAS LAS DISPOSICIONES OTORGADAS EN EL EJERCICIO AL ACREDITADO
   // vgExcelApp.Cells[ 25 , ColumnXlS('H') ].Value := '=IF(H$4>=H6,100,ROUND(H$4*100/H6,2))'; // Original
//   vgExcelApp.Cells[ 25 , ColumnXlS('H') ].Value := '=IF($A$2="UDIS",IF(H$1>=M6,100,ROUND(H$1*100/M6,2)),IF(H$4>=M6,100,ROUND(H$4*100/M6,2)))';
   vgExcelApp.Cells[ 41 , ColumnXlS('H') ].Value := '=IF($A$2="UDIS",IF(H$1>=M6,100,ROUND(H$1*100/M6,2)),IF(H$4>=M6,100,ROUND(H$4*100/M6,2)))'; //EASA 04.FEB.2010

   //HERJA MARZO2012- FORMULA PARA PCT.DEDUCIBLE
   IF (QrySatCreLayout.FieldByName('ID_CREDITO').AsString = '332412') OR
      (QrySatCreLayout.FieldByName('ID_CREDITO').AsString = '326145') OR
      (QrySatCreLayout.FieldByName('ID_CREDITO').AsString = '324155') OR
      (QrySatCreLayout.FieldByName('ID_CREDITO').AsString = '330352') OR
      (QrySatCreLayout.FieldByName('ID_CREDITO').AsString = '329725') OR
      (QrySatCreLayout.FieldByName('ID_CREDITO').AsString = '328161') THEN

//      vgExcelApp.Cells[ 41 , ColumnXlS('H') ].Value :='87.69';
      vgExcelApp.Cells[ 41 , ColumnXlS('H') ].Value :='88';

   // <SATV4766 13Ene2009>

   {
   // FOMRULAS ORIGINALES
   vgExcelApp.Cells[ 27 , ColumnXlS('H') ].Value := '=ROUND(SUM(P10:P22)*(H25/100),2)';
   vgExcelApp.Cells[ 28 , ColumnXlS('H') ].Value := '=ROUND(SUM(Q10:Q22)*(H25/100),2)';
   vgExcelApp.Cells[ 29 , ColumnXlS('H') ].Value := '=ROUND(SUM(S10:S22)*(H25/100),2)';
   vgExcelApp.Cells[ 30 , ColumnXlS('H') ].Value := '=H28+H29';
   vgExcelApp.Cells[ 31 , ColumnXlS('H') ].Value := '=H5';
   vgExcelApp.Cells[ 32 , ColumnXlS('H') ].Value := '=ROUND(H26*H31,2)';
   vgExcelApp.Cells[ 34 , ColumnXlS('H') ].Value := '=H30-H32';
   }

//EASA 04.FEB.2010
   {
   vgExcelApp.Cells[ 27 , ColumnXlS('H') ].Value := '=ROUND(SUM(P10:P22),2)';
   vgExcelApp.Cells[ 28 , ColumnXlS('H') ].Value := '=ROUND(SUM(Q10:Q22),2)';
   vgExcelApp.Cells[ 29 , ColumnXlS('H') ].Value := '=ROUND(SUM(S10:S22),2)';
   vgExcelApp.Cells[ 30 , ColumnXlS('H') ].Value := '=H28+H29';
   vgExcelApp.Cells[ 31 , ColumnXlS('H') ].Value := '=H5';
   vgExcelApp.Cells[ 32 , ColumnXlS('H') ].Value := '=ROUND(H26*H31,2)';
   vgExcelApp.Cells[ 34 , ColumnXlS('H') ].Value := '=IF(ROUND((H30-H32)*(H25/100),2)<0,0,ROUND((H30-H32)*(H25/100),2))';
    }
//   vgExcelApp.Cells[ 33 , ColumnXlS('H') ].Value := '=ROUND(SUM(P10:P29),2)';
//   vgExcelApp.Cells[ 34 , ColumnXlS('H') ].Value := '=ROUND(SUM(Q10:Q29),2)';
//   vgExcelApp.Cells[ 35 , ColumnXlS('H') ].Value := '=ROUND(SUM(S10:S29),2)';
   vgExcelApp.Cells[ 46 , ColumnXlS('H') ].Value := '=H44+H45';
   vgExcelApp.Cells[ 47 , ColumnXlS('H') ].Value := '=H5';
   vgExcelApp.Cells[ 48 , ColumnXlS('H') ].Value := '=ROUND(H42*H47,2)';
   vgExcelApp.Cells[ 50 , ColumnXlS('H') ].Value := '=IF(ROUND((H46-H48)*(H41/100),2)<0,0,ROUND((H46-H48)*(H41/100),2))';
   // Formúlas para obtención de diferencia
//   For vlRow := 26 To 30 Do
   For vlRow := 42 To 46 Do //EASA 04.FEB.2010
     Begin
     vlstrRow := IntToStr(vlRow);
     vgExcelApp.Cells[vlRow, 10].Value := '=ROUND(H'+vlstrRow+'-I'+vlstrRow+',2)';
     End;
//   vgExcelApp.Cells[ 34 , ColumnXlS('J') ].Value := '=ROUND(H34-I34,2)';
   vgExcelApp.Cells[ 50 , ColumnXlS('J') ].Value := '=ROUND(H50-I50,2)'; //EASA 04.FEB.2010

   //-----------------------------------------------
   //         INICIA OBTENCION DE SALDOS
   //-----------------------------------------------
   //
   // Obtención de Pagos
   vlRow := 10; vlF_VENCIMIENTO_INI := 0;  vlSDO_INICIAL := 0;
   vlSDO_INICIAL := QrySaldoInicial.FieldByName('SDO_INSOLUTO').AsFloat;//EASA 28ENE2010

   vlRowAverageIni := 0; vlRowAverageFin := 0; vlF_PAGO := 0;
   QryPeriodosInteres.First; // vlEjericioAnt := StrToInt(edEjercicio.Text)-1;
   With QryPeriodosInteres Do
     While Not Eof Do
       Begin
       // Obtiene la Fecha de Vencimiento Inicial
       If (vlF_VENCIMIENTO_INI = 0) Then
         Begin
         vlF_VENCIMIENTO_INI := FieldByName('F_VENCIMIENTO').AsDateTime;
//         vlSDO_INICIAL := FieldByName('SDO_INSOLUTO').AsFloat;  //EASA 28ENE2010

         vlNUM_PERIODO_INI := FieldByName('NUM_PERIODO').AsInteger;
         End;

       // Marca el Calculo Inicial del Saldo Promedio
//       If ((FieldByName('BPAGO').AsString = 'V') And (vlRowAverageIni = 0)) Then
       If (vlRowAverageIni = 0) Then  //HERJA MARZO2012 SE COMENTA PARA QUE TOME EL PRIMER PERIODO SIN RESTRICCION
          vlRowAverageIni := vlRow;

       // Debe de tomar la última referencia de pago
       //If (FieldByName('BPAGO').AsString = 'V') Then  //HERJA MARZO2012 SE COMENTA PARA QUE TOME TODOS LOS PERIODOS SIN RESTRICCION
         vlRowAverageFin := vlRow;

       // Marca el Calculo Inicial del Saldo Promedio
       If (FieldByName('F_PAGO').AsDateTime >= vlF_PAGO) Then
         Begin
         vlF_PAGO := FieldByName('F_PAGO').AsDateTime;
         End;
         
       //easa 11.FEB.2010
       //If ( FieldByName('SDO_INSOLUTO').AsInteger > 0 ) OR (FieldByName('F_VENCIMIENTO_ORIG').AsDateTime >= StrToDateTime('01/01/'+peNUM_EJERCICIO)) //and (FieldByName('BPAGO').AsString = 'V')) Then
       If (FieldByName('BPAGO').AsString = 'V') or
          (
           (FieldByName('F_VENCIMIENTO_ORIG').AsDateTime >= StrToDateTime('01/01/'+peNUM_EJERCICIO))
           and
           (
 //            (FieldByName('F_PAGO').AsDateTime = '') or (FieldByName('F_PAGO').AsDateTime >= StrToDateTime('01/01/'+peNUM_EJERCICIO) AND FieldByName('F_PAGO').AsDateTime <= StrToDateTime('31/12/'+peNUM_EJERCICIO) )
             (FieldByName('F_PAGO').AsDateTime <= StrToDateTime('31/12/'+peNUM_EJERCICIO) {OR (FieldByName('F_PAGO').AsDateTime ='')} )
           )
          )
        Then
         vlRowNumPerIntDev := vlRowNumPerIntDev + 1;

       vgExcelApp.Cells[ vlRow , ColumnXlS('A') ].Value := QryPeriodosInteres.FieldByName('ID_CREDITO').AsFloat;
       vgExcelApp.Cells[ vlRow , ColumnXlS('B') ].Value := FieldByName('NUM_PERIODO').AsFloat;
       vgExcelApp.Cells[ vlRow , ColumnXlS('C') ].Value := FieldByName('IMP_INTERES_DEVEN').AsFloat;
       vgExcelApp.Cells[ vlRow , ColumnXlS('D') ].Value := FieldByName('F_VENCIMIENTO_ORIG').AsDateTime;
       vgExcelApp.Cells[ vlRow , ColumnXlS('E') ].Value := FieldByName('BPAGO').AsString;
       //easa 12.feb.2010
       vgExcelApp.Cells[ vlRow , ColumnXlS('F') ].Value := FieldByName('SDO_INSOLUTO').AsFloat;

       If (Not FieldByName('F_VENCIMIENTO').IsNull) Then
         vgExcelApp.Cells[ vlRow , ColumnXlS('G') ].Value := FieldByName('F_VENCIMIENTO').AsDateTime;

       If (Not FieldByName('F_PAGO').IsNull) THEN// And  (FieldByName('F_PAGO').AsDateTime < EncodeDate(StrToInt(edEjercicio.Text)+1,1,1)) Then EASA 12.FEB.2010
         vgExcelApp.Cells[ vlRow , ColumnXlS('H') ].Value := FieldByName('F_PAGO').AsDateTime;

       If (Not FieldByName('F_PROCESO').IsNull) Then
         vgExcelApp.Cells[ vlRow , ColumnXlS('I') ].Value := FieldByName('F_PROCESO').AsDateTime;

       vgExcelApp.Cells[ vlRow , ColumnXlS('J') ].Value := FieldByName('IMP_BENEF_GOB').AsFloat;
       vgExcelApp.Cells[ vlRow , ColumnXlS('K') ].Value := FieldByName('IMP_PAGADO_INT').AsFloat;
       vgExcelApp.Cells[ vlRow , ColumnXlS('L') ].Value := FieldByName('TASA_BENEF_GOB').AsFloat;
       vgExcelApp.Cells[ vlRow , ColumnXlS('M') ].Value := FieldByName('UDI_F_VENTTO').AsFloat;

       If ((FieldByName('UDI_F_PAGO').AsFloat = 0) And (FieldByName('IMP_INTERES_DEVEN').AsFloat > 0)) Then
          vgExcelApp.Cells[ vlRow , ColumnXlS('N') ].Value := 1
       Else
          vgExcelApp.Cells[ vlRow , ColumnXlS('N') ].Value := FieldByName('UDI_F_PAGO').AsFloat;

       Inc(vlRow);
       Next;
       End;

   If (vlRowAverageIni = 0) Then vlRowAverageIni := 10;
   If (vlRowAverageFin = 0) Then vlRowAverageFin := 10;
   //Coloca Promedio

   {
   // FOMRULAS ORIGINALES
   vgExcelApp.Cells[ 26 , ColumnXlS('H') ].Value := '=ROUND(AVERAGE(O'+IntToStr(vlRowAverageIni)+':O'+IntToStr(vlRowAverageFin)+')*(H25/100),2)';
   }
//      vgExcelApp.Cells[ 26 , ColumnXlS('H') ].Value := '=ROUND(AVERAGE(O'+IntToStr(vlRowAverageIni)+':O'+IntToStr(vlRowAverageFin)+'),2)';

//HERJA MARZO2012 //SE CAMBIA LA COLUMNA DE CALCULO DE SALDO PROMEDIO DE LA COLUMNA "O" A LA COLUMNA "F"
//                YA QUE EN CASO DE DEVENGADO EN CERO LA UDI SE CALCULA EN CERO Y PROVOCA SALDOS EN CERO


If (QrySatCreLayout.FieldByName('CVE_MONEDA').AsInteger <> 484) Then
begin

   if vlRowNumPerIntDev <=0 then
      vgExcelApp.Cells[ 42 , ColumnXlS('H') ].Value := '=ROUND(AVERAGE(O'+IntToStr(vlRowAverageIni)+':O'+IntToStr(vlRowAverageFin)+'),2)'
   else
      vgExcelApp.Cells[ 42 , ColumnXlS('H') ].Value := '=ROUND((SUM(O'+IntToStr(vlRowAverageIni)+':O'+IntToStr(vlRowAverageFin)+')'+' /'+IntToStr(vlRowNumPerIntDev)+'),2)';//EASA 04.FEB.2010
end
else
begin
   if vlRowNumPerIntDev <=0 then
      vgExcelApp.Cells[ 42 , ColumnXlS('H') ].Value := '=ROUND(AVERAGE(F'+IntToStr(vlRowAverageIni)+':F'+IntToStr(vlRowAverageFin)+'),2)'
   else
      vgExcelApp.Cells[ 42 , ColumnXlS('H') ].Value := '=ROUND((SUM(F'+IntToStr(vlRowAverageIni)+':F'+IntToStr(vlRowAverageFin)+')'+' /'+IntToStr(vlRowNumPerIntDev)+'),2)';
end;
//FIN HERJA MARZO2012


   vgExcelApp.Cells[ 43 , ColumnXlS('H') ].Value := '=ROUND(SUM(P'+IntToStr(vlRowAverageIni)+':P39),2)';//EASA 04.FEB.2010
   vgExcelApp.Cells[ 44 , ColumnXlS('H') ].Value := '=ROUND(SUM(Q'+IntToStr(vlRowAverageIni)+':Q'+IntToStr(vlRowAverageFin)+'),2)';//EASA 04.FEB.2010
   vgExcelApp.Cells[ 45 , ColumnXlS('H') ].Value := '=ROUND(SUM(S'+IntToStr(vlRowAverageIni)+':S39),2)';//EASA 04.FEB.2010

   // Coloca Fechas Inicial y Final
   vgExcelApp.Cells[ 2 , ColumnXlS('D') ].Value := Chr(39)+DateToStr(QrySatCreLayout.FieldByName('F_TIPO_UDI_INI').AsDateTime);

   If (QrySatCreLayout.FieldByName('CVE_MONEDA').AsInteger = 484) Then
        vgExcelApp.Cells[ 3 , ColumnXlS('D') ].Value := Chr(39)+DateToStr(QrySatCreLayout.FieldByName('F_TIPO_UDI_FIN').AsDateTime);

   // Coloca Valor de UDI de la Fecha Inicial y Final
   vgExcelApp.Cells[ 1 , ColumnXlS('H') ].Value := 1500000;
   vgExcelApp.Cells[ 1 , ColumnXlS('H') ].NumberFormat := '#,##0.00';

   vgExcelApp.Cells[ 2 , ColumnXlS('H') ].Value := ObtenTipoCambio(QrySatCreLayout.FieldByName('F_TIPO_UDI_INI').AsDateTime);
   If (QrySatCreLayout.FieldByName('CVE_MONEDA').AsInteger = 484) Then
      vgExcelApp.Cells[ 3 , ColumnXlS('H') ].Value := ObtenTipoCambio(QrySatCreLayout.FieldByName('F_TIPO_UDI_FIN').AsDateTime);

   vgExcelApp.Cells[ 4 , ColumnXlS('H') ].Value := '=H1*H2';
   vgExcelApp.Cells[ 4 , ColumnXlS('H') ].NumberFormat := '#,##0.00';

   If (QrySatCreLayout.FieldByName('CVE_MONEDA').AsInteger = 484) Then
      vgExcelApp.Cells[ 5 , ColumnXlS('H') ].Value := '=TRUNC((H3/H2)-1,4)';
   vgExcelApp.Cells[ 5 , ColumnXlS('H') ].NumberFormat := '#,##0.00';

   vgExcelApp.Cells[ 6 , ColumnXlS('H') ].Value := vlSDO_INICIAL;
   vgExcelApp.Cells[ 6 , ColumnXlS('H') ].NumberFormat := '#,##0.00';
   // Obtención de Interéses a Reportar
   QrySatCreLayout.First;

//EASA 04.FEB.2010
{
   vgExcelApp.Cells[ 26 , ColumnXlS('I') ].Value := QrySatCreLayout.FieldByName('SDO_PROMEDIO').AsFloat;
   vgExcelApp.Cells[ 27 , ColumnXlS('I') ].Value := QrySatCreLayout.FieldByName('IMP_INT_NOM_DEV').AsFloat;
   vgExcelApp.Cells[ 28 , ColumnXlS('I') ].Value := QrySatCreLayout.FieldByName('IMP_INT_PAG_ORD').AsFloat;
   vgExcelApp.Cells[ 29 , ColumnXlS('I') ].Value := QrySatCreLayout.FieldByName('IMP_INT_MOR_DEV').AsFloat;
   vgExcelApp.Cells[ 30 , ColumnXlS('I') ].Value := QrySatCreLayout.FieldByName('INT_PAGADOS').AsFloat;
   vgExcelApp.Cells[ 34 , ColumnXlS('I') ].Value := QrySatCreLayout.FieldByName('IMP_INT_REAL').AsFloat;

   // Se colocan los formatos
   vgExcelApp.Cells[ 26 , ColumnXlS('H') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 27 , ColumnXlS('H') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 28 , ColumnXlS('H') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 29 , ColumnXlS('H') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 30 , ColumnXlS('H') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 32 , ColumnXlS('H') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 34 , ColumnXlS('H') ].NumberFormat := '#,##0.00';

   vgExcelApp.Cells[ 26 , ColumnXlS('I') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 27 , ColumnXlS('I') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 28 , ColumnXlS('I') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 29 , ColumnXlS('I') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 30 , ColumnXlS('I') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 32 , ColumnXlS('I') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 34 , ColumnXlS('I') ].NumberFormat := '#,##0.00';

   vgExcelApp.Cells[ 26 , ColumnXlS('J') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 27 , ColumnXlS('J') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 28 , ColumnXlS('J') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 29 , ColumnXlS('J') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 30 , ColumnXlS('J') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 32 , ColumnXlS('J') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 34 , ColumnXlS('J') ].NumberFormat := '#,##0.00';
 }

   vgExcelApp.Cells[ 42 , ColumnXlS('I') ].Value := QrySatCreLayout.FieldByName('SDO_PROMEDIO').AsFloat;
   vgExcelApp.Cells[ 43 , ColumnXlS('I') ].Value := QrySatCreLayout.FieldByName('IMP_INT_NOM_DEV').AsFloat;
   vgExcelApp.Cells[ 44 , ColumnXlS('I') ].Value := QrySatCreLayout.FieldByName('IMP_INT_PAG_ORD').AsFloat;
   vgExcelApp.Cells[ 45 , ColumnXlS('I') ].Value := QrySatCreLayout.FieldByName('IMP_INT_MOR_DEV').AsFloat;
   vgExcelApp.Cells[ 46 , ColumnXlS('I') ].Value := QrySatCreLayout.FieldByName('INT_PAGADOS').AsFloat;
   vgExcelApp.Cells[ 50 , ColumnXlS('I') ].Value := QrySatCreLayout.FieldByName('IMP_INT_REAL').AsFloat;

   // Se colocan los formatos
   vgExcelApp.Cells[ 42 , ColumnXlS('H') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 43 , ColumnXlS('H') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 44 , ColumnXlS('H') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 45 , ColumnXlS('H') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 46 , ColumnXlS('H') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 48 , ColumnXlS('H') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 50 , ColumnXlS('H') ].NumberFormat := '#,##0.00';

   vgExcelApp.Cells[ 42 , ColumnXlS('I') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 43 , ColumnXlS('I') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 44 , ColumnXlS('I') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 45 , ColumnXlS('I') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 46 , ColumnXlS('I') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 48 , ColumnXlS('I') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 50 , ColumnXlS('I') ].NumberFormat := '#,##0.00';

   vgExcelApp.Cells[ 42 , ColumnXlS('J') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 43 , ColumnXlS('J') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 44 , ColumnXlS('J') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 45 , ColumnXlS('J') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 46 , ColumnXlS('J') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 48 , ColumnXlS('J') ].NumberFormat := '#,##0.00';
   vgExcelApp.Cells[ 50 , ColumnXlS('J') ].NumberFormat := '#,##0.00';

//   For vlRow := 10 To 22 Do
   For vlRow := 10 To 39 Do //EASA 04.FEB.2010
    vgExcelApp.Cells[ vlRow , ColumnXlS('R') ].Value := 0;

   vlRow := 10;  // 10;  easa 29.ene.2010
   QueryMoratorios.First;
   With QueryMoratorios Do
     While Not Eof Do
        Begin
        vlRow := vlRow + 1;  // 10;  easa 29.ene.2010
        vgExcelApp.Cells[ vlRow , ColumnXlS('R') ].Value := QueryMoratorios.FieldByName('IMP_OPERACION').AsFloat;
        Next;
        End;
    {
   QueryMoratorios.First;
   With QueryMoratorios Do
     While Not Eof Do
        Begin
            vlRow := (FieldByName('NUM_PERIODO').AsInteger) - vlNUM_PERIODO_INI + 10;
            vgExcelApp.Cells[ vlRow , ColumnXlS('R') ].Value := QueryMoratorios.FieldByName('IMP_OPERACION').AsFloat;
        Next;
        End;
    }
   //-----------------------------------------------
   //         INICIA FORMATOS DE CELDAS
   //-----------------------------------------------
   //
   // Modifica el tamaño de la fuente
   vlColumnRange := vgExcelApp.Workbooks[1].WorkSheets[1].Columns;
   For vlCol := 1 To 19 Do
     vlColumnRange.Columns[vlCol].Font.Size := 8;
   // Coloca Colores
   vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['A9:S9']; vlRange.Columns.Interior.ColorIndex := 15;

//EASA 04.FEB.2010
   {
   vlRange := vgExcelApp.Workbooks[1].WorkSheets['Sheet1'].Range['H26:J26']; vlRange.Columns.Interior.ColorIndex := 41;
   vlRange := vgExcelApp.Workbooks[1].WorkSheets['Sheet1'].Range['H27:J27']; vlRange.Columns.Interior.ColorIndex := 37;
   vlRange := vgExcelApp.Workbooks[1].WorkSheets['Sheet1'].Range['H28:J28']; vlRange.Columns.Interior.ColorIndex := 24;
   vlRange := vgExcelApp.Workbooks[1].WorkSheets['Sheet1'].Range['H29:J29']; vlRange.Columns.Interior.ColorIndex := 34;
   vlRange := vgExcelApp.Workbooks[1].WorkSheets['Sheet1'].Range['H30:J30']; vlRange.Columns.Interior.ColorIndex := 35;
   }
   vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['H42:J42']; vlRange.Columns.Interior.ColorIndex := 41;
   vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['H43:J43']; vlRange.Columns.Interior.ColorIndex := 37;
   vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['H44:J44']; vlRange.Columns.Interior.ColorIndex := 24;
   vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['H45:J45']; vlRange.Columns.Interior.ColorIndex := 34;
   vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['H46:J46']; vlRange.Columns.Interior.ColorIndex := 35;

   {
   For vlRow := 25 To 200 Do
     Begin
     vlstrRow := IntToStr(vlRow - 24);
     vlRange := vgExcelApp.Workbooks[1].WorkSheets['Sheet1'].Range['H'+vlstrRow+':J'+vlstrRow];
     vlRange.Columns.Interior.ColorIndex := vlRow - 24;
     End;
   vlRange.WrapText := True;
   }
 Finally
    vgExcelApp.ActiveWorkBook.SaveAs(edDirectory.Text+'\Revision'+edEjercicio.Text+'_'+pestrID_CREDITO+'.XLS');
    CloseExcelFile(vgExcelApp);
 End;
end;

procedure TWCrarchsat.opNormalClick(Sender: TObject);
begin
  //HabilitaCtrlsComplement(False);
  HabilitaCtrlsComplement(True);
end;

procedure TWCrarchsat.opComplementariaClick(Sender: TObject);
begin
  HabilitaCtrlsComplement(True);
end;

procedure TWCrarchsat.SpeedButton1Click(Sender: TObject);
begin
 OpenDialogXLS.InitialDir := ExtractFilePath(edFileNameExcel.Text);
 if OpenDialogXLS.Execute then
  edFileNameExcel.Text := OpenDialogXLS.FileName;
end;

procedure TWCrarchsat.btnGenArchivoXLSClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRARCHSAT_GENEX',True,True) then
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

      btnGenArchivoXLS.Enabled := False;
      btnGenArchivo.Enabled := False;
      btBUSCA.Enabled := False;
      sagDATOS.Cursor := crHourGlass;
      btBUSCAClick(Self);
      ArmaArchivoExcel(edFileNameExcel.Text);
   end;
end;

procedure TWCrarchsat.ArmaArchivoExcel(peStrFileName: String);
var vlExcelApp : OleVariant;
    vlCol, vlRow : Integer;
    vlColumnRange : Variant;
begin
  Try
    vlExcelApp := CreateOleObject('Excel.Application');
    vlExcelApp.Workbooks.Add;
    vlColumnRange := vLExcelApp.Workbooks[1].WorkSheets[1].Columns;

    // Coloca el tipo de fuente a 8
    For vlCol := 1 To sagDATOS.ColCount Do
      Begin
      vlColumnRange.Columns[vlCol].Font.Size := 8;
      // vlColumnRange.Columns[vlCol].ColumnWidth := ;
      End;

    // Copia la informacion al nuevo libro de Excel
    For vlRow := 0 To sagDATOS.RowCount - 1 Do
      For vlCol := 0 To sagDATOS.ColCount - 1 Do
        Begin
        vlExcelApp.Cells[vlRow + 1, vlCol + 1].Value := sagDATOS.Cells[vlCol, vlRow];
        Application.ProcessMessages;
        End;

  Finally
    sagDATOS.Cursor := crDefault;
    btnGenArchivoXLS.Enabled := True;
    btnGenArchivo.Enabled := True;
    btBUSCA.Enabled := True;
    vlExcelApp.ActiveWorkBook.SaveAs(peStrFileName);
    CloseExcelFile(vlExcelApp);
    Application.ProcessMessages;
    MessageDlg('Archivo Excel Generado',mtInformation,[mbOk],0);
  End;
end;

function TWCrarchsat.FunArmaLayoutSAT(peID_CREDITO, peNUM_EJERCICIO : Integer; var PPResultado: String): Boolean;
var  StpArmaLayoutSAT : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   StpArmaLayoutSAT := TStoredProc.Create(Self);
   Try
     With StpArmaLayoutSAT Do
     Begin
        //Inicia el SPT
        StpArmaLayoutSAT.DatabaseName := Objeto.Apli.DatabaseName;
        StpArmaLayoutSAT.SessionName  := Objeto.Apli.SessionName;
//        StpArmaLayoutSAT.StoredProcName:= 'ADMIPROD.PKGCRSAT.STP_ARMA_LAYOUT_SAT';
        StpArmaLayoutSAT.StoredProcName:= 'ADMIPROD.PKGCRSAT_HIPO.STP_ARMA_LAYOUT_SAT';

        Params.Clear;
        Params.CreateParam( ftInteger, 'peID_CREDITO',  ptInput);
        Params.CreateParam( ftInteger, 'peEJERCICIO',   ptInput);
        Params.CreateParam( ftString,  'peBCommit',     ptInput);
        Params.CreateParam( ftInteger, 'psResultado',   ptOutput);
        Params.CreateParam( ftString,  'psTxResultado', ptOutput);

        Prepare;
        If (peID_CREDITO <= 0) Then
          ParamByName('peID_CREDITO').Clear
        Else
          ParamByName('peID_CREDITO').AsInteger := peID_CREDITO;

        ParamByName('peEJERCICIO').AsInteger := peNUM_EJERCICIO;
        ParamByName('peBCommit').AsString    := 'V';
        ExecProc;

        If (ParamByName('psResultado').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('psTxResultado').AsString;
           vlResult := False;
        End;
        //end if;
     end;
   Finally
        If Assigned(StpArmaLayoutSAT) Then
           StpArmaLayoutSAT.Free;
        //end if;
   End;
   Result := vlResult;
end;

procedure TWCrarchsat.btnGenLayoutSATClick(Sender: TObject);
var vlID_CREDITO, vlNUM_EJERCICIO : Integer;
    vlStrResultado : String;
    vlQry : TQuery;
    vlfiltrocred : string;
begin
   if Objeto.ValidaAccesoEsp('TCRARCHSAT_LAYOU',True,True) then
   begin
      vlID_CREDITO := 0;
      vlNUM_EJERCICIO := StrToInt(edEJERCICIO.Text);

      If MessageDlg('Se procederá generar el LAYOUT del SAT para el ejercicio'+edEJERCICIO.Text+
                    ' por lo que se borranán los registros cargados anteriormente en caso de existir.'+coCRLF+coCRLF+
                    '¿Desea continuar?', mtWarning, [mbYes, mbNo], 0) = mrNo Then
      Begin
         MessageDlg('Proceso Cancelado por el usuario', mtInformation, [mbOk], 0);
      End
      Else
      Begin
         vlfiltrocred:='';
         If (opID_CREDITO2.Checked) Then
         Begin
            If ( Trim(edID_CREDITO2.Text) = '') Then
            Begin
                MessageDlg('Favor de Indicar el '+opID_CREDITO2.Caption, mtWarning, [mbOk], 0);
                Exit;
             End
             Else
             Begin
                vlID_CREDITO := StrToInt(edID_CREDITO2.Text);
                vlfiltrocred:=' AND ID_CREDITO = '+edID_CREDITO2.Text;
             End;
         End;

       try
         vlQry := TQuery.Create(Self);
         vlQry.DatabaseName  := Objeto.Apli.DataBaseName;
         vlQry.SessionName   := Objeto.Apli.SessionName;
         vlQry.close;
         vlQry.SQL.Text:= ' DELETE FROM SAT_CRE_LAYOUT ' +coCRLF+
                          ' WHERE ID_EMPRESA=2 AND EJERCICIO = ' +Trim(edEJERCICIO.Text) +
                          vlfiltrocred ;
         vlQry.ExecSQL;
       finally
           vlQry.close;
       end;

       FunArmaLayoutSAT(vlID_CREDITO, vlNUM_EJERCICIO, vlStrResultado);
       If (Trim(vlStrResultado) <> '') Then
       Begin
          MessageDlg(vlStrResultado, mtError, [mbOk], 0);
       End
       Else
       Begin
          MessageDlg('Proceso concluído', mtInformation, [mbOk], 0);

          If ( Trim(edID_CREDITO.Text) = '') Then
          begin
              //btBUSCAClick(Self)
              vlIDCREDITO_SEL:='0';
              vlIDCONTRATO_SEL:='0';
              vlIDDOM_SEL:='0';
              vlIDDOMINMU_SEL:='0';
              MuestraDAtos(True);
          end
          Else
              btnMuestraClick(Self);
          End;
       End;
   end;
end;


procedure TWCrarchsat.sagDATOSSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
   if sagDATOS.RowCount > 2 then
   begin
      if (Trim(sagDATOS.Cells[C_IDCREDITO  ,ARow])<>'') then
      begin
         vlIDCREDITO_SEL :=sagDATOS.Cells[C_IDCREDITO  ,ARow];
         vlIDCONTRATO_SEL:=sagDATOS.Cells[C_IDCONTRATO ,ARow];

         vlIDDOM_SEL     :=sagDATOS.Cells[C_IDDOM  ,ARow];
         vlIDDOMINMU_SEL :=sagDATOS.Cells[C_IDDOM_INMU  ,ARow];
      end;
   end;
end;

procedure TWCrarchsat.btnRegenDomicilioSATClick(Sender: TObject);
var vlID_CREDITO, vlNUM_EJERCICIO : Integer;
    vlStrResultado : String;
begin
      vlID_CREDITO := 0;
      vlNUM_EJERCICIO := StrToInt(edEJERCICIO.Text);

//   if Objeto.ValidaAccesoEsp('TCRARCHSAT_REGDOM',True,True) then
//   begin
      If MessageDlg('Se procederá a Regenerar TODOS los Domicilios para el ejercicio'+edEJERCICIO.Text+
                    ' por lo que se actualizaran los domicilios cargados anteriormente.'+coCRLF+coCRLF+
                    '¿Desea continuar?', mtWarning, [mbYes, mbNo], 0) = mrNo Then
      Begin
         MessageDlg('Proceso Cancelado por el usuario', mtInformation, [mbOk], 0);
      End
      Else
      Begin

         If (opID_CREDITO2.Checked) Then
         Begin
            If ( Trim(edID_CREDITO2.Text) = '') Then
            Begin
                MessageDlg('Favor de Indicar el '+opID_CREDITO2.Caption, mtWarning, [mbOk], 0);
                Exit;
             End
             Else
             Begin
                vlID_CREDITO := StrToInt(edID_CREDITO2.Text);
             End;
         End;

         ActualizaDomConvertido(vlID_CREDITO, vlNUM_EJERCICIO, vlStrResultado);
         If (Trim(vlStrResultado) <> '') Then
         Begin
            MessageDlg(vlStrResultado, mtError, [mbOk], 0);
         End
         Else
         Begin
            MessageDlg('Proceso concluído', mtInformation, [mbOk], 0);

            vlIDCREDITO_SEL:='0';
            vlIDCONTRATO_SEL:='0';
            vlIDDOM_SEL:='0';
  	    vlIDDOMINMU_SEL:='0';
            MuestraDAtos(True);
         end
      end;
end;

procedure TWCrarchsat.DetalleLayout1Click(Sender: TObject);
var
    SatCrLay  : TSatCrLay;
begin
   if (Trim(vlIDCREDITO_SEL)<>'') and (vlIDCREDITO_SEL<>'0') then
   begin
      SatCrLay := TSatCrLay.Create(self);
      try
         SatCrLay.Apli := objeto.Apli;
         SatCrLay.ParamCre := Objeto.ParamCre;
         SatCrLay.GetParams(Objeto);
         SatCrLay.FindKey([IntToStr(Objeto.Apli.IdEmpresa),
                           edEJERCICIO.Text,
                           vlIDCONTRATO_SEL,
                           vlIDCREDITO_SEL]);
         SatCrLay.Catalogo;
      finally
         SatCrLay.Free;

         vlIDCREDITO_SEL:='0';
         vlIDCONTRATO_SEL:='0';
         vlIDDOM_SEL:='0';
	 vlIDDOMINMU_SEL:='0';
         MuestraDAtos(False);
      end;
   end;
end;

procedure TWCrarchsat.DomicilioConvertidoContrato1Click(Sender: TObject);
var
    DomConver  : TDomConver;
begin
   //if Objeto.ValidaAccesoEsp('TCRARCHSAT_DOMC',True,True) then
   if (Trim(vlIDDOM_SEL)<>'') and (vlIDDOM_SEL<>'0') then
   begin
      DomConver := TDomConver.Create(self);
      try
         DomConver.Apli := objeto.Apli;
         DomConver.ParamCre := Objeto.ParamCre;
         DomConver.GetParams(Objeto);
         DomConver.FindKey([vlIDDOM_SEL]);
         DomConver.vEjercicio:=edEJERCICIO.Text;
         DomConver.Catalogo;
      finally
         DomConver.Free;

         vlIDDOM_SEL:='0';
         vlIDDOMINMU_SEL:='0';
         MuestraDAtos(False);
      end;
   end;
end;


procedure TWCrarchsat.DomicilioConvertidoInmueble1Click(Sender: TObject);
var
    DomConver  : TDomConver;
begin
   //if Objeto.ValidaAccesoEsp('TCRARCHSAT_DOMC',True,True) then
   if (Trim(vlIDDOMINMU_SEL)<>'') and (vlIDDOMINMU_SEL<>'0') then
   begin
      DomConver := TDomConver.Create(self);
      try
         DomConver.Apli := objeto.Apli;
         DomConver.ParamCre := Objeto.ParamCre;
         DomConver.GetParams(Objeto);
         DomConver.FindKey([vlIDDOMINMU_SEL]);
         DomConver.vEjercicio:=edEJERCICIO.Text;
         DomConver.Catalogo;
      finally
         DomConver.Free;

         vlIDDOM_SEL:='0';
         vlIDDOMINMU_SEL:='0';
         MuestraDAtos(False);
      end;
   end;
end;

procedure TWCrarchsat.RelacionContratoDomicilios1Click(Sender: TObject);
var
    CrSATAdc  : TCrSATAdc;
begin
   if (Trim(vlIDCREDITO_SEL)<>'') and (vlIDCREDITO_SEL<>'0') then
   begin
      CrSATAdc := TCrSATAdc.Create(self);
      try
         CrSATAdc.Apli := objeto.Apli;
         CrSATAdc.ParamCre := Objeto.ParamCre;
         CrSATAdc.GetParams(Objeto);
         CrSATAdc.FindKey([vlIDCONTRATO_SEL]);
         CrSATAdc.Catalogo;
      finally
         CrSATAdc.Free;

         vlIDCREDITO_SEL:='0';
         vlIDCONTRATO_SEL:='0';
         vlIDDOM_SEL:='0';
	 vlIDDOMINMU_SEL:='0';
         MuestraDAtos(False);
      end;
   end;
end;

end.
