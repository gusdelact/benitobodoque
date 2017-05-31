// Sistema         : Clase de IntCrTAS
// Fecha de Inicio : 07/03/2005
// Función forma   : Clase de IntCrTAS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     : MARA4356 AGOSTO 2006 SE MODIFICA PARA EXPORTAR AUTOMÁTICAMENTE LA INFORMACION AL SIAR
Unit IntCrTAS;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre,
PosicionesSIAR_TLB, //MARA4356 AGOSTO PARA EXPORTACION AUTOMATICA AL SIAR
IntMensaje;//MARA4356 AGOSTO PARA EXPORTACION AUTOMATICA AL SIAR


Type
 TIntCrTAS= class; 

  TWIntCrTAS=Class(TForm)
    InterForma1             : TInterForma;
    Panel1: TPanel;
    sbFechaArch: TSpeedButton;
    Label1: TLabel;
    lbToTArc: TLabel;
    sbEnviaActivoSIAR: TSpeedButton;
    mTAS: TMemo;
    pbArch: TProgressBar;
    Panel2: TPanel;
    sbGeneraPas: TSpeedButton;
    Label2: TLabel;
    lbTotPas: TLabel;
    sbEnviaPasivoSIAR: TSpeedButton;
    mPas: TMemo;
    pbPasivo: TProgressBar;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    qActivo1: TQuery;
    qPasivo1: TQuery;
    rgCARGA: TRadioGroup;
    Panel4: TPanel;
    sbGenPasCorp: TSpeedButton;
    Label3: TLabel;
    lbPasCorp: TLabel;
    sbEnvPasCorp: TSpeedButton;
    mPasCorp: TMemo;
    pbPasCorp: TProgressBar;
    qPasCorp: TQuery;
    qActivo3: TQuery;
    qActivo2: TQuery;
    qPasivo3: TQuery;
    qPasivo2: TQuery;
    qFactor: TQuery;
    qFactorFACT_AMORT: TMemoField;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbFechaArchClick(Sender: TObject);
    procedure sbEnviaActivoSIARClick(Sender: TObject);
    procedure sbGeneraPasClick(Sender: TObject);
    procedure sbEnviaPasivoSIARClick(Sender: TObject);
    procedure sbGenPasCorpClick(Sender: TObject);
    procedure sbEnvPasCorpClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TIntCrTAS;
    ssPlazo, ssFactor :String;

    //Function  GeneraSQL1: String; se modifica la función para enviar un parametro. MARA4356 AGOSTO
    Function  GeneraSQL1(vStatus:String): String;
    //Function  GeneraSQL2: String; se modifica la función para enviar un parametro. MARA4356 AGOSTO
    Function  GeneraSQL2(vStatus:String): String;
    //Function  GeneraSQL3: String; se modifica la función para enviar un parametro. MARA4356 AGOSTO
    Function  GeneraSQL3(vStatus:String): String;
    Procedure GeneraArchivo;
    Procedure GrabaArchivo;
    //MARA4356 AGOSTO PARA EXPORTACION AL SIAR INICIAN CAMBIOS
    procedure GeneraArchivoPasivo;
    Procedure ProcConectaSIAR;
    Procedure ProcCierraSIAR;
    Procedure ProcLlenaCampos(qSiar:TQuery;sOpc:Integer);
    Function  ProcEnviaRegistro:Boolean;
    Procedure EnviarInformacion(qQuery:TQuery;sOpc:Integer);
    Function  GeneraPSQL1(vStatus:String): String;
    Function  GeneraPSQL2(vStatus:String): String;
    Function  GeneraPSQL3(vStatus:String): String;
    Procedure GeneraArchivoPasivoCorp;
    procedure PROC_PLAZO_CUPON(sCredito,sCampo1,sCampo2,sCampo3,sTipo:String);
    //MARA4356 AGOSTO PARA EXPORTACION AL SIAR TERMINAN CAMBIOS

end;
 TIntCrTAS= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        //Clases Adicionales
        ParamCre                 : TParamCre;
        //MARA4356 AGOSTO PARA EXPORTACION AL SIAR INICIAN CAMBIOS
        PORTAFOLIO           : WideString;
        FUENTE               : WideString;
        SIGNO                : WideString;
        ACTIVOFINANCIERO     : WideString;
        ACTIVOBASICO         : WideString;
        FPOSICION            : TDateTime;
        FECHAINICIO          : TDateTime;
        FECHAVENCIMIENTO     : TDateTime;
        IMPORTE              : Double;
        TASAFIJA1            : WideString;
        TASAFIJA2            : WideString;
        TIPOCAMBIO           : Double;
        PLAZOCUPON           : WideString;
        NUMEROCUPONES        : Smallint;
        FECHAEMISION         : TDateTime;
        FACTORCAPITALIZACION : Double;
        FACTORAMORTIZA       : WideString;
        CUPONEMPAMOR         : Smallint;
        NUMEROAMORTIZA       : Smallint;
        TIPOCREDITO          : WideString;
        PORTAFOLIOCOL        : WideString;
        VALORCOL             : Double;
        TIPOGARANTIA         : Smallint;
        OTROACC              : Double;
        DIACORTE             : Smallint;
        ESTATUSGRAL          : Smallint;
        PORCENTQUEB          : Double;
        TASACUPONAC          : Double;
        Resultado            : TInterCampo;
        Folio                : WideString;
        BorraPosicion        : Integer;

        gPosicion : TClsPosicionSIAR;
        //MARA4356 AGOSTO PARA EXPORTACION AL SIAR TERMINAN CAMBIOS
        { Public declarations }
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

const
  cAfirma='S';

implementation
Uses IntMsgError;

{$R *.DFM}


constructor TIntCrTAS.Create( AOwner : TComponent );
begin Inherited;
      Resultado :=CreaCampo('Resultado',ftString,tsNinguno,tsNinguno,False);
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrTAS.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TIntCrTAS.Destroy;
begin inherited;
end;


function TIntCrTAS.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWIntCrTAS;
begin
   W:=TWIntCrTAS.Create(Self);
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


Function TIntCrTAS.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IIntCrTA.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TIntCrTAS.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA IntCrTAS********************)
(*                                                                              *)
(*  FORMA DE IntCrTAS                                                            *)
(*                                                                              *)
(***********************************************FORMA IntCrTAS********************)

Function TWIntCrTAS.GeneraSQL1(vStatus:String): String;
var VLSQL  : String;
begin
     VLSQL := '';

     {MARA4356 AGOSTO PARA EXPORTACION AL SIAR SE CAMBIA LA INFORMACIÓN DEL SELECT PARA
      DARLE EL FORMATO REQUERIDO POR EL SIAR}
     VLSQL :=
     '   SELECT ''CR_''||TRIM(CC.CVE_PRESUPUESTO) AS PORTAFOLIO, '+
     '        cc.id_credito, '+
     '        ''X'' AS FUENTE, '+
     '        ''C'' AS SIGNO, '+
     '        substr(PKGCRTAS.Fun_ActFinSIAR(''CR_'',''001'',CCTO.CVE_SUB_TIP_BCO, '+
                                    ' '''','''','''',CC.CVE_TASA_REFER,CTO.CVE_MONEDA,''''),1,20) AS ACTIVOFINANCIERO, '+
     '        '' '' AS ACTIVOBASICO, '+
     '        TRUNC(SYSDATE) AS FPOSICION, '+
     '        PKGCRTAS.ObtenFIniCre(CC.ID_CREDITO,''IN'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS FECHAINICIO, '+
     '        CC.F_VALOR_CRED + CC.DIAS_PLAZO AS FECHAVENCIMIENTO, '+
     '        PKGCRTAS.ObtenImpCre(CC.ID_CREDITO,''IN'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS IMPORTE, '+
     '        ''0'' AS TASAFIJA1, '+
     '        TO_CHAR(PKGCRTAS.ObtenTasaFija2(''001'',CC.ID_CREDITO,CTO.CVE_MONEDA,CC.CVE_TASA_REFER, '+
                      ' CC.TASA_CREDITO,CC.SOBRETASA,'''+DateToStr(Objeto.Apli.DameFechaEmpresa)+''')) AS TASAFIJA2, '+
     '        1 AS TIPOCAMBIO, '+
     '        ''IN'' as campo1, CAT.TOT_PERIODOS_K as campo2, CIT.TOT_PERIODOS_I as campo3, '' ''  AS PLAZOCUPON, '+
     '        PKGCRTAS.ObtenNoInter(CC.ID_CREDITO,''IN'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS NUMEROCUPONES, '+
     '        TO_DATE(''01/01/100'') AS FECHAEMISION, '+
     '        0 AS FACTORCAPITALIZACION, '' '' AS FACTORAMORTIZA, '+
     '        PKGCRTAS.ObtenPrimerAmor(CC.ID_CREDITO,''IN'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS CUPONEMPAMOR, '+
     '        PKGCRTAS.ObtenNoAmor(CC.ID_CREDITO,''IN'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS NUMEROAMORTIZA, '+
     '        '' '' AS TIPOCREDITO, '' '' AS PORTAFOLIOCOL, '+
     '        0 AS VALORCOL, 0 AS TIPOGARANTIA, 0 AS OTROACC, 0 AS DIACORTE, '+
              vStatus +' AS ESTATUSGRAL, 0 AS PORCENTQUEB, '+
     '        NVL(CIT_VI.TASA_APLICADA,CIT_VE.TASA_APLICADA) AS TASACUPONAC '+
     ' FROM  (  SELECT * FROM CRE_CREDITO ' +
     '          WHERE SIT_CREDITO = ''AC'' ' +
     '          AND   ID_CREDITO IN (select id_credito from cre_capital where sit_capital in (''AC'',''PA'',''IM'')) ' +
     '          AND   ID_CREDITO IN (select id_credito from cre_interes where sit_interes in (''AC'',''PA'',''IM'')) ' +
     '          AND  (F_VALOR_CRED + DIAS_PLAZO) >= SYSDATE '+
     '        ) CC, ' +        
     '       (  SELECT * FROM CRE_CONTRATO ' +
     '          WHERE CVE_SUB_TIP_BCO NOT IN (118,119,120,121) ) CCTO, ' +
     '       (  SELECT * FROM CONTRATO ' +
     '          WHERE  CVE_TIP_CONTRATO = ''CRED'') CTO, ' +
     '       (  SELECT COUNT(*) AS TOT_PERIODOS_I, ID_CREDITO ' +
     '          FROM CRE_INTERES  GROUP BY ID_CREDITO) CIT, ' +
     '       (  SELECT COUNT(*) AS TOT_PERIODOS_K, ID_CREDITO ' +
     '          FROM CRE_CAPITAL GROUP BY ID_CREDITO) CAT, ' +
     '         (SELECT SUM(IMP_PAGADO) AS IMP_PAGADO_COM, ID_CREDITO  FROM CRE_DET_COMISION ' +
     '          WHERE F_PAGO <= TRUNC(SYSDATE) GROUP BY ID_CREDITO) COM, ' +
     '         (SELECT SUM(IMP_OPERACION) IMP_AMORT, ID_CREDITO FROM CRE_TRANSACCION ' +
     '          WHERE CVE_OPERACION = ''CAMCAP'' AND ID_COD_RESP = 0 AND SIT_TRANSACCION = ''AC''  ' +
     '          GROUP BY ID_CREDITO) TAM,  ' +
     '       (  SELECT CI.TASA_APLICADA, CI.ID_CREDITO FROM ' +
     '            ( SELECT MAX(NUM_PERIODO) AS NUM_PERIODO, ID_CREDITO ' +
     '              FROM CRE_INTERES ' +
     '              WHERE TRUNC(SYSDATE) BETWEEN F_VENCIMIENTO - (PLAZO - 1) AND F_VENCIMIENTO ' +
     '              AND   TASA_APLICADA IS NOT NULL ' +
     '              AND   TASA_APLICADA <> 0 ' +
    '              GROUP BY  ID_CREDITO) CIM, ' +
     '            CRE_INTERES CI ' +
     '          WHERE CI.ID_CREDITO = CIM.ID_CREDITO ' +
     '          AND   CI.NUM_PERIODO = CIM.NUM_PERIODO) CIT_VI, ' +
     '       (  SELECT CI.TASA_APLICADA, CI.ID_CREDITO FROM ' +
     '            ( SELECT MAX(NUM_PERIODO) AS NUM_PERIODO, ID_CREDITO ' +
     '              FROM CRE_INTERES GROUP BY  ID_CREDITO) CIM, ' +
     '             CRE_INTERES CI ' +
     '          WHERE CI.ID_CREDITO = CIM.ID_CREDITO ' +
     '          AND   CI.TASA_APLICADA IS NOT NULL ' +
     '          AND   CI.TASA_APLICADA <> 0' +
     '          AND   CI.NUM_PERIODO = CIM.NUM_PERIODO) CIT_VE' +
     ' WHERE  CCTO.ID_CONTRATO = CC.ID_CONTRATO' +
     ' AND    CTO.ID_CONTRATO  = CC.ID_CONTRATO' +
     ' AND    CIT.ID_CREDITO   = CC.ID_CREDITO' +
     ' AND    CAT.ID_CREDITO   = CC.ID_CREDITO' +
     ' AND    COM.ID_CREDITO (+)= CC.ID_CREDITO' +
     ' AND    TAM.ID_CREDITO (+)= CC.ID_CREDITO' +
     ' AND    CIT_VI.ID_CREDITO (+)= CC.ID_CREDITO' +
     ' AND    CIT_VE.ID_CREDITO (+)= CC.ID_CREDITO';
     GeneraSQL1 := VLSQL;
end;

Function TWIntCrTAS.GeneraSQL2(vStatus:String): String;
var VLSQL : String;
begin
     VLSQL := '';

     {MARA4356 AGOSTO PARA EXPORTACION AL SIAR SE CAMBIA LA INFORMACIÓN DEL SELECT PARA
      DARLE EL FORMATO REQUERIDO POR EL SIAR}
     VLSQL := ' SELECT ''CR_''||TRIM(CP.CVE_PRODUCTO_GPO) AS PORTAFOLIO, '+
              '        cc.id_credito, '+
              '        ''X'' AS FUENTE, '+
              '        ''C'' AS SIGNO, '+
              '        substr(PKGCRTAS.FUN_ACTFINSIAR(''CR_'',''002'','''',CP.CVE_PRODUCTO_GPO,'''','''',CC.CVE_TASA_REFER,CTO.CVE_MONEDA,''''),1,20) AS ACTIVOFINANCIERO, '+
              '        '' '' AS ACTIVOBASICO, '+
              '        TRUNC(SYSDATE) AS FPOSICION, '+
              '        PKGCRTAS.ObtenFIniCre(CC.ID_CREDITO,''IC'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS FECHAINICIO, '+
              '        CC.F_VENCIMIENTO AS FECHAVENCIMIENTO, '+
              '        PKGCRTAS.ObtenImpCre(CC.ID_CREDITO,''IC'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS IMPORTE, '+
              '        ''0'' AS TASAFIJA1, '+
              '        TO_CHAR(PKGCRTAS.ObtenTasaFija2(''002'',CC.ID_CREDITO, CTO.CVE_MONEDA, CC.CVE_TASA_REFER, '+
                               ' CC.TASA_CREDITO,CC.SOBRETASA,'''+DateToStr(Objeto.Apli.DameFechaEmpresa)+''')) AS TASAFIJA2, '+
              '        1 AS TIPOCAMBIO, '+
              '        ''IC'' as campo1, CAT.TOT_PERIODOS_K as campo2, CIT.TOT_PERIODOS_I as campo3, '' '' AS PLAZOCUPON, '+
              '        PKGCRTAS.ObtenNoInter(CC.ID_CREDITO,''IC'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS NUMEROCUPONES, '+
              '        TO_DATE(''01/01/100'') AS FECHAEMISION, '+
              '        0 AS FACTORCAPITALIZACION, '' '' AS FACTORAMORTIZA, '+
              '        PKGCRTAS.ObtenPrimerAmor(CC.ID_CREDITO,''IC'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS CUPONEMPAMOR, '+
              '        PKGCRTAS.ObtenNoAmor(CC.ID_CREDITO,''IC'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS NUMEROAMORTIZA, '+
              '        '' '' AS TIPOCREDITO, '' '' AS PORTAFOLIOCOL, '+
              '        0 AS VALORCOL, 0 AS TIPOGARANTIA, 0 AS OTROACC, 0 AS DIACORTE, '+
                       vStatus+ ' AS ESTATUSGRAL, 0 AS PORCENTQUEB, '+
              '        NVL(CIT_VI.TASA_APLICADA,CIT_VE.TASA_APLICADA) AS TASACUPONAC '+
              ' FROM  ( SELECT * FROM CR_CREDITO' +
              '         WHERE SIT_CREDITO = ''AC''' +
              '         AND   F_VENCIMIENTO >= SYSDATE) CC,' +     
              '       CR_CONTRATO CCTO,' +                         
              '       ( SELECT * FROM CONTRATO' +
              '         WHERE  CVE_TIP_CONTRATO = ''CRED'')CTO,' + 
              '       ( SELECT * FROM CR_PRODUCTO' +
              '         WHERE  CVE_PRODUCTO_GPO <> ''FACTOR'')CP,' +
              '       ( SELECT COUNT(*) AS TOT_PERIODOS_I, ID_CREDITO' +
              '         FROM CR_INTERES GROUP BY ID_CREDITO) CIT,' +    
              '       ( SELECT COUNT(*) AS TOT_PERIODOS_K, ID_CREDITO' +
              '         FROM CR_CAPITAL GROUP BY ID_CREDITO) CAT,' +   
              '       ( SELECT SUM(IMP_FINAN_ADIC) AS IMP_FINAN_ADIC, ID_CREDITO' +
              '         FROM CR_FINAN_ADIC' +
              '         GROUP BY ID_CREDITO) CFA,' +                    
              '         (SELECT SUM(IMP_PAGADO) AS IMP_PAGADO_COM, ID_CREDITO  FROM CR_COMISION '+
              '         WHERE F_PAGO <= TRUNC(SYSDATE) GROUP BY ID_CREDITO) COM, '+                           
              '         (SELECT SUM(CDT.IMP_CONCEPTO) IMP_AMORT, CT.ID_CREDITO  FROM '+
              '         (SELECT * FROM CR_DET_TRANSAC WHERE CVE_CONCEPTO = ''IMPBRU'') CDT, '+
              '         (SELECT * FROM CR_CVE_OPERACION WHERE CVE_PARAMETRO = ''PAGOCP'') CCO, '+
              '         (SELECT * FROM CR_TRANSACCION   WHERE F_VALOR < F_PROG_PAGO AND SIT_TRANSACCION = ''AC'' AND   ID_TRANS_CANCELA IS NULL) CT, '+
              '         (SELECT * FROM CR_CREDITO WHERE SIT_CREDITO = ''AC'') CC, '+              
              '         CR_CONTRATO CCT, CONTRATO CTO ' +
              '         WHERE CT.ID_CREDITO = CC.ID_CREDITO ' +
              '         AND   CDT.ID_TRANSACCION = CT.ID_TRANSACCION ' +
              '         AND   CDT.CVE_OPERACION = CT.CVE_OPERACION ' +
              '         AND   CTO.ID_CONTRATO = CT.ID_CONTRATO ' +
              '         AND   CCT.ID_CONTRATO = CT.ID_CONTRATO ' +
              '         AND   CCO.CVE_PRODUCTO = CCT.CVE_PRODUCTO_CRE ' +
              '         AND   CCO.CVE_MONEDA = CTO.CVE_MONEDA ' +
              '         AND   CCO.CVE_OPERACION = CT.CVE_OPERACION ' +
              '         GROUP BY CT.ID_CREDITO) TAM, ' +                
              '       ( SELECT CI.TASA_APLICADA, CI.ID_CREDITO FROM' +
              '          ( SELECT MAX(NUM_PERIODO) AS NUM_PERIODO, ID_CREDITO' +
              '            FROM CR_INTERES' +
              '            WHERE TRUNC(SYSDATE) BETWEEN F_VENCIMIENTO - (PLAZO - 1) AND F_VENCIMIENTO' +
              '            GROUP BY  ID_CREDITO) CIM,' +
              '           CR_INTERES CI' +
              '         WHERE CI.ID_CREDITO = CIM.ID_CREDITO' +
              '         AND   CI.NUM_PERIODO = CIM.NUM_PERIODO) CIT_VI,' +
              '       ( SELECT CI.TASA_APLICADA, CI.ID_CREDITO FROM' +
              '          ( SELECT MAX(NUM_PERIODO) AS NUM_PERIODO, ID_CREDITO' +
              '            FROM CR_INTERES' +
              '            GROUP BY  ID_CREDITO) CIM,' +
              '          CR_INTERES CI' +
              '         WHERE CI.ID_CREDITO = CIM.ID_CREDITO' +
              '         AND   CI.NUM_PERIODO = CIM.NUM_PERIODO) CIT_VE' +
              ' WHERE  CCTO.ID_CONTRATO  = CC.ID_CONTRATO' +
              ' AND    CCTO.FOL_CONTRATO = CC.FOL_CONTRATO' +
              ' AND    CTO.ID_CONTRATO   = CC.ID_CONTRATO' +
              ' AND    CP.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE' +
              ' AND    CIT.ID_CREDITO    = CC.ID_CREDITO' +
              ' AND    CAT.ID_CREDITO    = CC.ID_CREDITO' +
              ' AND    CFA.ID_CREDITO (+)= CC.ID_CREDITO' +
              ' AND    COM.ID_CREDITO (+)= CC.ID_CREDITO' +
              ' AND    TAM.ID_CREDITO (+)= CC.ID_CREDITO' +
              ' AND    CIT_VI.ID_CREDITO(+)= CC.ID_CREDITO' +
              ' AND    CIT_VE.ID_CREDITO(+)= CC.ID_CREDITO';
     GeneraSQL2 := VLSQL;
end;



Function TWIntCrTAS.GeneraSQL3(vStatus:String): String;
var VLSQL  : String;
begin
     VLSQL := '';

     {MARA4356 AGOSTO PARA EXPORTACION AL SIAR SE CAMBIA LA INFORMACIÓN DEL SELECT PARA
      DARLE EL FORMATO REQUERIDO POR EL SIAR}
     VLSQL := ' SELECT ''CR_''|| CP.CVE_PRODUCTO_GPO  AS PORTAFOLIO, '+
              '        cc.id_credito, '+
              '        ''X'' AS FUENTE, '+
              '        ''C'' AS SIGNO, '+
              '        substr(PKGCRTAS.FUN_ACTFINSIAR(''CR_'',''003'','''','''', '+
              '        CS.B_OPERADO_NAFIN,CS.CVE_TIPO_INTERES,CC.CVE_TASA_REFER,CTO.CVE_MONEDA,''''),1,20) AS ACTIVOFINANCIERO, '+
              '        '' '' AS ACTIVOBASICO, '+
              '        TRUNC(SYSDATE) AS FPOSICION, '+
              '        CC.F_INICIO AS FECHAINICIO, '+
              '        CCA.F_VENCIMIENTO AS FECHAVENCIMIENTO, '+
              '        CCA.IMP_CAPITAL AS IMPORTE, '+
              '        ''0'' AS TASAFIJA1, '+
              '        TO_CHAR(PKGCRTAS.ObtenTasaFija2(''003'',CC.ID_CREDITO, CTO.CVE_MONEDA,CC.CVE_TASA_REFER,'+
                             'CC.TASA_CREDITO,CC.SOBRETASA,'''+DateToStr(Objeto.Apli.DameFechaEmpresa)+''')) AS TASAFIJA2, '+
              '        1 AS TIPOCAMBIO, '+
              '        ''XX'' as campo1, 0 as campo2, 0 as campo3,  '+
              '        TO_CHAR(CCA.PLAZO) AS PLAZOCUPON, '+
              '        1 AS NUMEROCUPONES, '+
              '        TO_DATE(''01/01/100'') AS FECHAEMISION, '+
              '        0 AS FACTORCAPITALIZACION, '+
              '        '' '' AS FACTORAMORTIZA, '+
              '        1 AS CUPONEMPAMOR, '+
              '        1 AS NUMEROAMORTIZA, '+
              '        '' '' AS TIPOCREDITO, '' '' AS PORTAFOLIOCOL, '+
              '        0 AS VALORCOL, 0 AS TIPOGARANTIA, 0 AS OTROACC, 0 AS DIACORTE, '+
                       vStatus +' AS ESTATUSGRAL, 0 AS PORCENTQUEB, '+
              '        NVL(CIT_VI.TASA_APLICADA,0)   AS TASACUPONAC '+
              ' FROM  ( SELECT * FROM CR_CREDITO' +
              '         WHERE SIT_CREDITO    = ''AC''' +
              '         AND   F_VENCIMIENTO >= SYSDATE) CC,' +
              '       CR_CONTRATO CCTO,' +                                
              '       ( SELECT * FROM CONTRATO' +
              '         WHERE  CVE_TIP_CONTRATO = ''CRED'')CTO,' +        
              '       ( SELECT * FROM CR_PRODUCTO' +
              '         WHERE  CVE_PRODUCTO_GPO = ''FACTOR'')CP,' +       
              '       CR_CESION CS,' +
              '       ( SELECT * FROM CR_DOCUMENTO' +
              '         WHERE  SIT_DOCUMENTO = ''AC'') CD,' +
              '       CR_CAPITAL CCA,' +
              '       CR_INTERES CIT_VI,' +                                   
              '       (SELECT SUM(IMP_COMISION) AS IMP_PAGADO_COM, ID_CESION' +
              '        FROM CR_CESION_COMIS GROUP BY ID_CESION) COM,' +       
              '       (SELECT SUM(CDT.IMP_CONCEPTO) IMP_AMORT, CT.ID_CREDITO  FROM' +
              '        (SELECT * FROM CR_DET_TRANSAC WHERE CVE_CONCEPTO = ''IMPBRU'') CDT,' +
              '        (SELECT * FROM CR_CVE_OPERACION WHERE CVE_PARAMETRO = ''PAGOCP'') CCO,' +
              '        (SELECT * FROM CR_TRANSACCION   WHERE F_VALOR < F_PROG_PAGO AND SIT_TRANSACCION = ''AC'' AND   ID_TRANS_CANCELA IS NULL) CT,' +
              '        (SELECT * FROM CR_CREDITO WHERE SIT_CREDITO = ''AC'') CC,' +
              '        CR_CONTRATO CCT, CONTRATO CTO' +
              '        WHERE CT.ID_CREDITO = CC.ID_CREDITO' +
              '        AND   CDT.ID_TRANSACCION = CT.ID_TRANSACCION' +
              '        AND   CDT.CVE_OPERACION = CT.CVE_OPERACION' +
              '        AND   CTO.ID_CONTRATO = CT.ID_CONTRATO' +
              '        AND   CCT.ID_CONTRATO = CT.ID_CONTRATO' +
              '        AND   CCO.CVE_PRODUCTO = CCT.CVE_PRODUCTO_CRE' +
              '        AND   CCO.CVE_MONEDA = CTO.CVE_MONEDA' +
              '        AND   CCO.CVE_OPERACION = CT.CVE_OPERACION' +
              '        GROUP BY CT.ID_CREDITO) TAM, ' +
              '       ( SELECT COUNT(*) AS TOT_DOC, ID_CESION' +
              '         FROM CR_DOCUMENTO' +
              '         WHERE SIT_DOCUMENTO <> ''CA'' GROUP BY ID_CESION) TDD ' +
              ' WHERE  CCTO.ID_CONTRATO = CC.ID_CONTRATO' +
              ' AND    CCTO.FOL_CONTRATO = CC.FOL_CONTRATO ' +
              ' AND    CTO.ID_CONTRATO = CCTO.ID_CONTRATO' +
              ' AND    CP.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE' +
              ' AND    CS.ID_CESION = CC.ID_CREDITO' +
              ' AND    CD.ID_CESION = CS.ID_CESION' +
              ' AND    CCA.ID_CREDITO = CD.ID_CESION' +
              ' AND    CCA.NUM_PERIODO = CD.NUM_PERIODO_DOC' +
              ' AND    CIT_VI.ID_CREDITO = CD.ID_CESION' +
              ' AND    CIT_VI.NUM_PERIODO = CD.NUM_PERIODO_DOC' +
              ' AND    COM.ID_CESION (+)= CS.ID_CESION' +
              ' AND    TAM.ID_CREDITO (+)= CC.ID_CREDITO' +
              ' AND    TDD.ID_CESION (+)= CS.ID_CESION';

     GeneraSQL3 := VLSQL;
end;

{//MARA4356 AGOSTO 2006 SE CAMBIA EL PROCEDIMIENTO 
Procedure TWIntCrTAS.GeneraArchivo;
var qyQuery : TQuery;
    VlToTArc : Integer;
begin
     VlToTArc := 0;
     qyQuery:= GetSQLQuery(GeneraSQL1, Objeto.DataBaseName, Objeto.SessionName, False);
     try
        mTAS.Lines.Add('GPO'+#9+'CVE_PRESUPUESTO'+#9+'ID_TITULAR'+#9+'SIGNO'+#9+'ACT_FINANC'+#9+'CVE_TASA_REFER'+#9+
                       'CVE_MONEDA'+#9+'F_POS_OP'+#9+'ID_CREDITO'+#9+'F_VALOR_CRED'+#9+'F_VENCIMIENTO'+#9+'IMP_CREDITO'+#9+
                       'TASA_SOBRETASA'+#9+'PLAZO_I'+#9+'TOT_PERIODOS_I'+#9+'FACTOR'+#9+'PER_INI_AMOR'+#9+'TOT_PERIODOS_K'+#9+
                       'CVE_SUB_TIP_BCO'+#9+'IMP_PAGADO_COM'+#9+'TASA_CUPON_AC'+#9+'NO_CREDITO'+#9+'SDO_INSOLUTO'+#9+'IMP_AMORT');
         While ((qyQuery <> Nil) and (qyQuery.Eof = False)) do
         Begin
              VlToTArc := VlToTArc + 1;
              lbToTArc.Caption := IntToStr(VlToTArc);
              mTAS.Lines.Add( qyQuery.FieldByName('GPO').AsString+#9+
                              qyQuery.FieldByName('CVE_PRESUPUESTO').AsString+#9+
                              qyQuery.FieldByName('ID_TITULAR').AsString+#9+
                              qyQuery.FieldByName('SIGNO').AsString+#9+
                              TRIM(qyQuery.FieldByName('ACT_FINANC').AsString)+#9+
                              qyQuery.FieldByName('CVE_TASA_REFER').AsString+#9+
                              qyQuery.FieldByName('CVE_MONEDA').AsString+#9+
                              qyQuery.FieldByName('F_POS_OP').AsString+#9+
                              qyQuery.FieldByName('ID_CREDITO').AsString+#9+
                              qyQuery.FieldByName('F_VALOR_CRED').AsString+#9+
                              qyQuery.FieldByName('F_VENCIMIENTO').AsString+#9+
                              qyQuery.FieldByName('IMP_CREDITO').AsString+#9+
                              qyQuery.FieldByName('TASA_SOBRETASA').AsString+#9+
                              qyQuery.FieldByName('PLAZO_I').AsString+#9+
                              qyQuery.FieldByName('TOT_PERIODOS_I').AsString+#9+
                              qyQuery.FieldByName('FACTOR').AsString+#9+
                              qyQuery.FieldByName('PER_INI_AMOR').AsString+#9+
                              qyQuery.FieldByName('TOT_PERIODOS_K').AsString+#9+
                              qyQuery.FieldByName('CVE_SUB_TIP_BCO').AsString+#9+
                              qyQuery.FieldByName('IMP_PAGADO_COM').AsString+#9+
                              qyQuery.FieldByName('TASA_CUPON_AC').AsString+#9+
                              qyQuery.FieldByName('NO_CREDITO').AsString+#9+
                              qyQuery.FieldByName('SDO_INSOLUTO').AsString+#9+
                              qyQuery.FieldByName('IMP_AMORT').AsString);
              qyQuery.next;
         End;
     finally
         qyQuery.Free;
     end;

     pbArch.Position := 1;

     qyQuery:= GetSQLQuery(GeneraSQL2, Objeto.DataBaseName, Objeto.SessionName, False);
     try
         While ((qyQuery <> Nil) and (qyQuery.Eof = False)) do
         Begin
              VlToTArc := VlToTArc + 1;
              lbToTArc.Caption := IntToStr(VlToTArc);
              mTAS.Lines.Add( qyQuery.FieldByName('GPO').AsString+#9+
                              qyQuery.FieldByName('CVE_PRESUPUESTO').AsString+#9+
                              qyQuery.FieldByName('ID_TITULAR').AsString+#9+
                              qyQuery.FieldByName('SIGNO').AsString+#9+
                              qyQuery.FieldByName('ACT_FINANC').AsString+#9+
                              qyQuery.FieldByName('CVE_TASA_REFER').AsString+#9+
                              qyQuery.FieldByName('CVE_MONEDA').AsString+#9+
                              qyQuery.FieldByName('F_POS_OP').AsString+#9+
                              qyQuery.FieldByName('ID_CREDITO').AsString+#9+
                              qyQuery.FieldByName('F_VALOR_CRED').AsString+#9+
                              qyQuery.FieldByName('F_VENCIMIENTO').AsString+#9+
                              qyQuery.FieldByName('IMP_CREDITO').AsString+#9+
                              qyQuery.FieldByName('TASA_SOBRETASA').AsString+#9+
                              qyQuery.FieldByName('PLAZO_I').AsString+#9+
                              qyQuery.FieldByName('TOT_PERIODOS_I').AsString+#9+
                              qyQuery.FieldByName('FACTOR').AsString+#9+
                              qyQuery.FieldByName('PER_INI_AMOR').AsString+#9+
                              qyQuery.FieldByName('TOT_PERIODOS_K').AsString+#9+
                              qyQuery.FieldByName('CVE_SUB_TIP_BCO').AsString+#9+
                              qyQuery.FieldByName('IMP_PAGADO_COM').AsString+#9+
                              qyQuery.FieldByName('TASA_CUPON_AC').AsString+#9+
                              qyQuery.FieldByName('NO_CREDITO').AsString+#9+
                              qyQuery.FieldByName('SDO_INSOLUTO').AsString+#9+
                              qyQuery.FieldByName('IMP_AMORT').AsString);
              qyQuery.next;
         End;
     finally
         qyQuery.Free;
     end;

     pbArch.Position := 2;

     qyQuery:= GetSQLQuery(GeneraSQL3, Objeto.DataBaseName, Objeto.SessionName, False);
     try
         While ((qyQuery <> Nil) and (qyQuery.Eof = False)) do
         Begin
              VlToTArc := VlToTArc + 1;
              lbToTArc.Caption := IntToStr(VlToTArc);         
              mTAS.Lines.Add( qyQuery.FieldByName('GPO').AsString+#9+
                              qyQuery.FieldByName('CVE_PRESUPUESTO').AsString+#9+
                              qyQuery.FieldByName('ID_TITULAR').AsString+#9+
                              qyQuery.FieldByName('SIGNO').AsString+#9+
                              qyQuery.FieldByName('ACT_FINANC').AsString+#9+
                              qyQuery.FieldByName('CVE_TASA_REFER').AsString+#9+
                              qyQuery.FieldByName('CVE_MONEDA').AsString+#9+
                              qyQuery.FieldByName('F_POS_OP').AsString+#9+
                              qyQuery.FieldByName('ID_CREDITO').AsString+#9+
                              qyQuery.FieldByName('F_VALOR_CRED').AsString+#9+
                              qyQuery.FieldByName('F_VENCIMIENTO').AsString+#9+
                              qyQuery.FieldByName('IMP_CREDITO').AsString+#9+
                              qyQuery.FieldByName('TASA_SOBRETASA').AsString+#9+
                              qyQuery.FieldByName('PLAZO_I').AsString+#9+
                              qyQuery.FieldByName('TOT_PERIODOS_I').AsString+#9+
                              qyQuery.FieldByName('FACTOR').AsString+#9+
                              qyQuery.FieldByName('PER_INI_AMOR').AsString+#9+
                              qyQuery.FieldByName('TOT_PERIODOS_K').AsString+#9+
                              qyQuery.FieldByName('CVE_SUB_TIP_BCO').AsString+#9+
                              qyQuery.FieldByName('IMP_PAGADO_COM').AsString+#9+
                              qyQuery.FieldByName('TASA_CUPON_AC').AsString+#9+
                              qyQuery.FieldByName('NO_CREDITO').AsString+#9+
                              qyQuery.FieldByName('SDO_INSOLUTO').AsString+#9+
                              qyQuery.FieldByName('IMP_AMORT').AsString);
              qyQuery.next;
         End;
     finally
         qyQuery.Free;
     end;

     pbArch.Position := 3;
end;
}
Procedure TWIntCrTAS.GeneraArchivo;
var vlPlazo,vlNumCup,vlStatus:STRING; iFolio:Integer;
begin
  vlStatus:='0';
  if rgCARGA.ItemIndex=0 then vlStatus:='1050';
  {SSQL:=GeneraSQL1(vlStatus)+
        ' UNION ALL '+
        GeneraSQL2(vlStatus)+
        ' UNION ALL '+
        GeneraSQL3(vlStatus);}
  iFolio:=0;
  pbArch.Position := 1;
  mTAS.clear;
  qActivo1.Close;
  qActivo1.SQL.Text:=GeneraSQL1(vlStatus);
  qActivo1.Open;
  try
    mTAS.Lines.Add('PORTAFOLIO'      +#9+'CREDITO'             +#9+'FUENTE'        +#9+'SIGNO'        +#9+
                   'ACTIVOFINANCIERO'+#9+'ACTIVOBASICO'        +#9+'FPOSICION'     +#9+'FOLIO'        +#9+
                   'FECHAINICIO'     +#9+'FECHAVENCIMIENTO'    +#9+'IMPORTE'       +#9+'TASAFIJA1'    +#9+
                   'TASAFIJA2'       +#9+'TIPOCAMBIO'          +#9+'PLAZOCUPON'    +#9+'NUMEROCUPONES'+#9+
                   'FECHAEMISION'    +#9+'FACTORCAPITALIZACION'+#9+'FACTORAMORTIZA'+#9+'CUPONEMPAMOR' +#9+
                   'NUMEROAMORTIZA'  +#9+'TIPOCREDITO'         +#9+'PORTAFOLIOCOL' +#9+'VALORCOL'     +#9+
                   'TIPOGARANTIA'    +#9+'OTROACC'             +#9+'DIACORTE'      +#9+'ESTATUSGRAL'  +#9+
                   'PORCENTQUEB'     +#9+'TASACUPONAC');

    pbArch.Position := 2;
    While ((qActivo1 <> Nil) and (qActivo1.Eof = False)) do
    Begin
      iFolio:=iFolio + 1;
      vlPlazo:='';vlNumCup:='';
      PROC_PLAZO_CUPON(qActivo1.FieldByName('ID_CREDITO').AsString, qActivo1.FieldByName('campo1').AsString,
                       qActivo1.FieldByName('campo2').AsString,     qActivo1.FieldByName('campo3').AsString,'AC');
      vlPlazo:=ssPlazo;
      vlNumCup:=ssFactor; 
      //LLENA EL MEMO PRINCIPAL      
      mTAS.Lines.Add(
         qActivo1.FieldByName('PORTAFOLIO').AsString      +#9+ qActivo1.FieldByName('ID_CREDITO').AsString          +#9+
         qActivo1.FieldByName('FUENTE').AsString          +#9+ qActivo1.FieldByName('SIGNO').AsString               +#9+
         qActivo1.FieldByName('ACTIVOFINANCIERO').AsString+#9+ qActivo1.FieldByName('ACTIVOBASICO').AsString        +#9+
         qActivo1.FieldByName('FPOSICION').AsString       +#9+ IntToStr(iFolio)                                     +#9+
         qActivo1.FieldByName('FECHAINICIO').AsString     +#9+ qActivo1.FieldByName('FECHAVENCIMIENTO').AsString    +#9+
         qActivo1.FieldByName('IMPORTE').AsString         +#9+ qActivo1.FieldByName('TASAFIJA1').AsString           +#9+
         qActivo1.FieldByName('TASAFIJA2').AsString       +#9+ qActivo1.FieldByName('TIPOCAMBIO').AsString          +#9+
         vlPlazo                                          +#9+ qActivo1.FieldByName('NUMEROCUPONES').AsString       +#9+
         qActivo1.FieldByName('FECHAEMISION').AsString    +#9+ qActivo1.FieldByName('FACTORCAPITALIZACION').AsString+#9+
         vlNumCup                                         +#9+ qActivo1.FieldByName('CUPONEMPAMOR').AsString        +#9+
         qActivo1.FieldByName('NUMEROAMORTIZA').AsString  +#9+ qActivo1.FieldByName('TIPOCREDITO').AsString         +#9+
         qActivo1.FieldByName('PORTAFOLIOCOL').AsString   +#9+ qActivo1.FieldByName('VALORCOL').AsString            +#9+
         qActivo1.FieldByName('TIPOGARANTIA').AsString    +#9+ qActivo1.FieldByName('OTROACC').AsString             +#9+
         qActivo1.FieldByName('DIACORTE').AsString        +#9+ qActivo1.FieldByName('ESTATUSGRAL').AsString         +#9+
         qActivo1.FieldByName('PORCENTQUEB').AsString     +#9+ qActivo1.FieldByName('TASACUPONAC').AsString);
      qActivo1.next;
    end;
    //query 2
    qActivo2.Close;
    qActivo2.SQL.Text:=GeneraSQL2(vlStatus);
    qActivo2.Open;
    While ((qActivo2 <> Nil) and (qActivo2.Eof = False)) do
    Begin
      iFolio:=iFolio + 1;
      vlPlazo:='';vlNumCup:='';
      PROC_PLAZO_CUPON(qActivo2.FieldByName('ID_CREDITO').AsString, qActivo2.FieldByName('campo1').AsString,
                       qActivo2.FieldByName('campo2').AsString,     qActivo2.FieldByName('campo3').AsString,'AC');
      vlPlazo:=ssPlazo;
      vlNumCup:=ssFactor;
      mTAS.Lines.Add(
         qActivo2.FieldByName('PORTAFOLIO').AsString      +#9+ qActivo2.FieldByName('ID_CREDITO').AsString          +#9+
         qActivo2.FieldByName('FUENTE').AsString          +#9+ qActivo2.FieldByName('SIGNO').AsString               +#9+
         qActivo2.FieldByName('ACTIVOFINANCIERO').AsString+#9+ qActivo2.FieldByName('ACTIVOBASICO').AsString        +#9+
         qActivo2.FieldByName('FPOSICION').AsString       +#9+ IntToStr(iFolio)                                    +#9+
         qActivo2.FieldByName('FECHAINICIO').AsString     +#9+ qActivo2.FieldByName('FECHAVENCIMIENTO').AsString    +#9+
         qActivo2.FieldByName('IMPORTE').AsString         +#9+ qActivo2.FieldByName('TASAFIJA1').AsString           +#9+
         qActivo2.FieldByName('TASAFIJA2').AsString       +#9+ qActivo2.FieldByName('TIPOCAMBIO').AsString          +#9+
         vlPlazo                                          +#9+ qActivo2.FieldByName('NUMEROCUPONES').AsString       +#9+
         qActivo2.FieldByName('FECHAEMISION').AsString    +#9+ qActivo2.FieldByName('FACTORCAPITALIZACION').AsString+#9+
         vlNumCup                                         +#9+ qActivo2.FieldByName('CUPONEMPAMOR').AsString        +#9+
         qActivo2.FieldByName('NUMEROAMORTIZA').AsString  +#9+ qActivo2.FieldByName('TIPOCREDITO').AsString         +#9+
         qActivo2.FieldByName('PORTAFOLIOCOL').AsString   +#9+ qActivo2.FieldByName('VALORCOL').AsString            +#9+
         qActivo2.FieldByName('TIPOGARANTIA').AsString    +#9+ qActivo2.FieldByName('OTROACC').AsString             +#9+
         qActivo2.FieldByName('DIACORTE').AsString        +#9+ qActivo2.FieldByName('ESTATUSGRAL').AsString         +#9+
         qActivo2.FieldByName('PORCENTQUEB').AsString     +#9+ qActivo2.FieldByName('TASACUPONAC').AsString);
      qActivo2.next;
    end;
    //query 3
    qActivo3.Close;
    qActivo3.SQL.Text:=GeneraSQL3(vlStatus);
    qActivo3.Open;
    While ((qActivo3 <> Nil) and (qActivo3.Eof = False)) do
    Begin
      iFolio:=iFolio + 1;
      mTAS.Lines.Add(
         qActivo3.FieldByName('PORTAFOLIO').AsString      +#9+ qActivo3.FieldByName('ID_CREDITO').AsString          +#9+
         qActivo3.FieldByName('FUENTE').AsString          +#9+ qActivo3.FieldByName('SIGNO').AsString               +#9+
         qActivo3.FieldByName('ACTIVOFINANCIERO').AsString+#9+ qActivo3.FieldByName('ACTIVOBASICO').AsString        +#9+
         qActivo3.FieldByName('FPOSICION').AsString       +#9+ IntToStr(iFolio)                                    +#9+
         qActivo3.FieldByName('FECHAINICIO').AsString     +#9+ qActivo3.FieldByName('FECHAVENCIMIENTO').AsString    +#9+
         qActivo3.FieldByName('IMPORTE').AsString         +#9+ qActivo3.FieldByName('TASAFIJA1').AsString           +#9+
         qActivo3.FieldByName('TASAFIJA2').AsString       +#9+ qActivo3.FieldByName('TIPOCAMBIO').AsString          +#9+
         qActivo3.FieldByName('PLAZOCUPON').AsString      +#9+ qActivo3.FieldByName('NUMEROCUPONES').AsString       +#9+
         qActivo3.FieldByName('FECHAEMISION').AsString    +#9+ qActivo3.FieldByName('FACTORCAPITALIZACION').AsString+#9+
         qActivo3.FieldByName('FACTORAMORTIZA').AsString  +#9+ qActivo3.FieldByName('CUPONEMPAMOR').AsString        +#9+
         qActivo3.FieldByName('NUMEROAMORTIZA').AsString  +#9+ qActivo3.FieldByName('TIPOCREDITO').AsString         +#9+
         qActivo3.FieldByName('PORTAFOLIOCOL').AsString   +#9+ qActivo3.FieldByName('VALORCOL').AsString            +#9+
         qActivo3.FieldByName('TIPOGARANTIA').AsString    +#9+ qActivo3.FieldByName('OTROACC').AsString             +#9+
         qActivo3.FieldByName('DIACORTE').AsString        +#9+ qActivo3.FieldByName('ESTATUSGRAL').AsString         +#9+
         qActivo3.FieldByName('PORCENTQUEB').AsString     +#9+ qActivo3.FieldByName('TASACUPONAC').AsString);
      qActivo3.next;
    end;
     
    lbToTArc.Caption := IntToStr(iFolio);
  finally
  end;
  pbArch.Position := 3;
end;

      
Procedure TWIntCrTAS.GrabaArchivo;
begin
     mTAS.Lines.SaveToFile('C:\TASACTIVO'+ FormatDateTime('DDMMYYYY',Objeto.Apli.DameFechaEmpresa) +'.TXT' );
end;


procedure TWIntCrTAS.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   //sbFechaArch.Caption := 'Generar Archivo TAS al día: ' + FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
   //MARA4356 AGOSTO INICIAN CAMBIOS
   sbFechaArch.Caption := 'Generar Archivo (Activo) TAS al día: ' + FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
   sbGeneraPas.Caption := 'Generar Archivo (Pasivo) TAS al día: ' + FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
   sbGenPasCorp.Caption := 'Generar Información del Corporativo al día: ' + FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
   qActivo1.SessionName :=objeto.SessionName;
   qActivo1.DatabaseName:=objeto.DatabaseName;
   qActivo2.SessionName :=objeto.SessionName;
   qActivo2.DatabaseName:=objeto.DatabaseName;
   qActivo3.SessionName :=objeto.SessionName;
   qActivo3.DatabaseName:=objeto.DatabaseName;
   qPasivo1.SessionName :=objeto.SessionName;
   qPasivo1.DatabaseName:=objeto.DatabaseName;
   qPasivo2.SessionName :=objeto.SessionName;
   qPasivo2.DatabaseName:=objeto.DatabaseName;
   qPasivo3.SessionName :=objeto.SessionName;
   qPasivo3.DatabaseName:=objeto.DatabaseName;
   qPasCorp.SessionName :=objeto.SessionName;
   qPasCorp.DatabaseName:=objeto.DatabaseName;
   qFactor.SessionName :=objeto.SessionName;
   qFactor.DatabaseName:=objeto.DatabaseName;
   Objeto.BorraPosicion:=0;
   //MARA4356 AGOSTO TERMINAN CAMBIOS
end;

procedure TWIntCrTAS.FormDestroy(Sender: TObject);
begin
   //Objeto
   ProcCierraSIAR;
end;

procedure TWIntCrTAS.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWIntCrTAS.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWIntCrTAS.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWIntCrTAS.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWIntCrTAS.sbFechaArchClick(Sender: TObject);
begin
     GeneraArchivo;
     GrabaArchivo;
     //MARA4356 AGOSTO 2006SE CAMBIA LA SIGUIENTE LINEA POR EL EXECUTE_MUESTRAMENSAJE
     //MessageDlg('Archivo Generado: C:\TASACTIVO'+ FormatDateTime('DDMMYYYY',Objeto.Apli.DameFechaEmpresa)+'.TXT',mtInformation,[mbok],0 );
     EXECUTE_MUESTRAMENSAJE('Archivo Generado: C:\TASACTIVO'+ FormatDateTime('DDMMYYYY',Objeto.Apli.DameFechaEmpresa)+'.TXT');
end;

//MARA4356 AGOSTO 2006 INICIAN LAS FUNCIONES Y PROCEDIMIENTOS QUE SE AGREGARON PARA LA EXPORTACION AUTOMATICA AL SIAR
procedure TWIntCrTAS.sbEnviaActivoSIARClick(Sender: TObject);
begin
   if (qActivo1 <> nil) or (qActivo2 <> nil) or (qActivo3 <> nil) then
   begin
      if (qActivo1 <> nil) then EnviarInformacion(qActivo1,1);
      if (qActivo2 <> nil) then EnviarInformacion(qActivo2,1);
      if (qActivo3 <> nil) then EnviarInformacion(qActivo3,1);
      EXECUTE_MUESTRAMENSAJE('Envío concluido.');
   end
   else 
   begin
      EXECUTE_MUESTRAMENSAJE('No se ha realizado la generación del archivo. Verifique');
      pbArch.Position := 0;
   end;
end;

Procedure TWIntCrTAS.EnviarInformacion(qQuery:TQuery;sOpc:Integer);
var sError:String; dFecha:TDateTime;
begin
   case sOpc of
     1:pbArch.Position   := 1;
     2:pbPasivo.Position := 1;
     3:pbPasCorp.Position:= 1;
   end;
   ProcConectaSIAR;
   case sOpc of
     1:pbArch.Position   := 2;
     2:pbPasivo.Position := 2;
     3:pbPasCorp.Position:= 2;
   end;
   dFecha:=Objeto.Apli.DameFechaEmpresa;
   if  Objeto.BorraPosicion=0 then
   begin  sError:=Objeto.gPosicion.BorraPosicionesDelDia(dFecha);
          if (Trim(sError)<>'') and
             (MessageDlg('Error al borrar la Posición del día '+chr(13)+
             sError+chr(13)+'Desea continuar con la carga?',mtError,[mbYes,mbNo],0)=mrNo)
          then Exit;
          Objeto.BorraPosicion:=1;
   end;
   qQuery.First;
   Objeto.Folio:='0';
   While ((qQuery <> Nil) and (qQuery.Eof = False)) do
   Begin
      Objeto.Folio:=IntToStr(StrToInt(Objeto.Folio)+1);
      ProcLlenaCampos(qQuery,sOpc);
      if procEnviaRegistro 
      then qQuery.next
      else qQuery.Last; 
   End;
   case sOpc of
     1:pbArch.Position   := 3;
     2:pbPasivo.Position := 3;
     3:pbPasCorp.Position:= 3;
   end;
end;

Procedure TWIntCrTAS.ProcConectaSIAR;
begin
   Objeto.gPosicion := TClsPosicionSIAR.Create(nil);
   Objeto.gPosicion.LevantaSesion;
end;

Procedure TWIntCrTAS.ProcCierraSIAR;
begin
   Objeto.gPosicion.TiraSesion;
   Objeto.gPosicion.Free;
end;

Procedure TWIntCrTAS.ProcLlenaCampos(qSiar:TQuery;sOpc:Integer);
VAR sTipo:STRING;
begin
   Objeto.PORTAFOLIO           :=qSIAR.FieldByName('PORTAFOLIO').AsString;
   Objeto.FUENTE               :=qSIAR.FieldByName('FUENTE').AsString;
   Objeto.SIGNO                :=qSIAR.FieldByName('SIGNO').AsString;
   Objeto.ACTIVOFINANCIERO     :=qSIAR.FieldByName('ACTIVOFINANCIERO').AsString;
   Objeto.ACTIVOBASICO         :=qSIAR.FieldByName('ACTIVOBASICO').AsString;
   Objeto.FPOSICION            :=qSIAR.FieldByName('FPOSICION').AsDateTime;
   Objeto.FECHAINICIO          :=qSIAR.FieldByName('FECHAINICIO').AsDateTime;
   Objeto.FECHAVENCIMIENTO     :=qSIAR.FieldByName('FECHAVENCIMIENTO').AsDateTime;
   Objeto.IMPORTE              :=qSIAR.FieldByName('IMPORTE').AsFloat;
   Objeto.TASAFIJA1            :=qSIAR.FieldByName('TASAFIJA1').AsString;
   Objeto.TASAFIJA2            :=qSIAR.FieldByName('TASAFIJA2').AsString;
   Objeto.TIPOCAMBIO           :=qSIAR.FieldByName('TIPOCAMBIO').AsFloat;
   Objeto.NUMEROCUPONES        :=qSIAR.FieldByName('NUMEROCUPONES').AsInteger;
   Objeto.FECHAEMISION         :=qSIAR.FieldByName('FECHAEMISION').AsDateTime;
   Objeto.FACTORCAPITALIZACION :=qSIAR.FieldByName('FACTORCAPITALIZACION').AsFloat;
   Objeto.CUPONEMPAMOR         :=qSIAR.FieldByName('CUPONEMPAMOR').AsInteger;
   Objeto.NUMEROAMORTIZA       :=qSIAR.FieldByName('NUMEROAMORTIZA').AsInteger;
   Objeto.TIPOCREDITO          :=qSIAR.FieldByName('TIPOCREDITO').AsString;
   Objeto.PORTAFOLIOCOL        :=qSIAR.FieldByName('PORTAFOLIOCOL').AsString;
   Objeto.VALORCOL             :=qSIAR.FieldByName('VALORCOL').AsFloat;
   Objeto.TIPOGARANTIA         :=qSIAR.FieldByName('TIPOGARANTIA').AsInteger;
   Objeto.OTROACC              :=qSIAR.FieldByName('OTROACC').AsFloat;
   Objeto.DIACORTE             :=qSIAR.FieldByName('DIACORTE').AsInteger;
   Objeto.ESTATUSGRAL          :=qSIAR.FieldByName('ESTATUSGRAL').AsInteger;
   Objeto.PORCENTQUEB          :=qSIAR.FieldByName('PORCENTQUEB').AsFloat;
   Objeto.TASACUPONAC          :=qSIAR.FieldByName('TASACUPONAC').AsFloat;

   case sOpc of
     1,2://activo y pasivo
       begin
        //el query 1 y 2 del activo y el pasivo deben calclar el plazo y el factor
        IF qSIAR.FieldByName('campo1').AsString='XX' then 
        begin Objeto.PLAZOCUPON     :=qSIAR.FieldByName('PLAZOCUPON').AsString;
              Objeto.FACTORAMORTIZA :=qSIAR.FieldByName('FACTORAMORTIZA').AsString;
        end
        else
        begin if sOpc = 1 then sTipo:='AC' else sTipo:='PA';
              PROC_PLAZO_CUPON(qSiar.FieldByName('ID_CREDITO').AsString,
                         qSiar.FieldByName('campo1').AsString,
                         qSiar.FieldByName('campo2').AsString,
                         qSiar.FieldByName('campo3').AsString,sTipo);
              Objeto.PLAZOCUPON     :=ssPlazo;
              Objeto.FACTORAMORTIZA :=ssFactor;
        end;
       end;       
     3 : 
       begin Objeto.PLAZOCUPON     :=qSIAR.FieldByName('PLAZOCUPON').AsString;
             Objeto.FACTORAMORTIZA :=qSIAR.FieldByName('FACTORAMORTIZA').AsString;
       end; 
   end;

   Objeto.Resultado.AsString   :='';
end;

function  TWIntCrTAS.ProcEnviaRegistro:Boolean;
var bContinua: Boolean;
    sError:String;
begin
  bContinua:=False;
  ProcEnviaRegistro:=True;
  repeat
    //se envia información al SIAR
    sError:=Objeto.gPosicion.CargaPosiciones
            (Objeto.PORTAFOLIO,           Objeto.FUENTE,         Objeto.SIGNO,        Objeto.ACTIVOFINANCIERO,
             Objeto.ACTIVOBASICO,         Objeto.FPOSICION,      Objeto.Folio,        Objeto.FECHAINICIO,
             Objeto.FECHAVENCIMIENTO,     Objeto.Importe,        Objeto.TasaFija1,    Objeto.TasaFija2,
             Objeto.TipoCambio,           Objeto.PLAZOCUPON,     Objeto.NUMEROCUPONES,Objeto.FECHAEMISION,
             Objeto.FACTORCAPITALIZACION, Objeto.FACTORAMORTIZA, Objeto.CUPONEMPAMOR, Objeto.NUMEROAMORTIZA,
             Objeto.TIPOCREDITO,          Objeto.PORTAFOLIOCOL,  Objeto.VALORCOL,     Objeto.TipoGarantia,
             Objeto.OTROACC,              Objeto.DiaCorte,       Objeto.ESTATUSGRAL,  Objeto.PORCENTQUEB,
             Objeto.TASACUPONAC);
    //SI OCURRE UN ERROR SE MUESTRA LA INFORMACIÓN ENVIADA EN PANTALLA
    //Y EL USARIO DECIDE SI DESEA INTENTAR EL ENVIO NUEVAMENTE
    if Length(Trim(sError)) > 0 then
    begin Objeto.Resultado.AsString:='';
          MuestraMsgError(Objeto.FUENTE,              Objeto.PORTAFOLIO,      Objeto.SIGNO,        Objeto.ACTIVOFINANCIERO,
                          Objeto.ACTIVOBASICO,        Objeto.TasaFija1,       Objeto.TasaFija2,    Objeto.PLAZOCUPON,
                          Objeto.FACTORAMORTIZA,      Objeto.TipoCredito,     Objeto.PORTAFOLIOCOL,Objeto.FPOSICION,
                          Objeto.FECHAINICIO,         Objeto.FECHAVENCIMIENTO,Objeto.FECHAEMISION, Objeto.Importe,
                          Objeto.FactorCapitalizacion,Objeto.TipoCambio,      Objeto.PORCENTQUEB,  Objeto.ValorCol,
                          Objeto.OTROACC,             Objeto.TASACUPONAC,     Objeto.NUMEROCUPONES,Objeto.CUPONEMPAMOR,
                          Objeto.NUMEROAMORTIZA,      Objeto.TipoGarantia,    Objeto.DiaCorte,     sError,
                          Objeto.Resultado );
          if Objeto.Resultado.AsString = cAfirma
          then bContinua:=True
          else bContinua:=False;
          if Objeto.Resultado.AsString = cTermina 
          then ProcEnviaRegistro:=False
          else ProcEnviaRegistro:=True;
    end
    else bContinua:=False;
  until not bContinua;
end;


procedure TWIntCrTAS.sbGeneraPasClick(Sender: TObject);
begin
     GeneraArchivoPasivo;
     mPAS.Lines.SaveToFile('C:\TASPASIVO'+ FormatDateTime('DDMMYYYY',Objeto.Apli.DameFechaEmpresa) +'.TXT' );
     EXECUTE_MUESTRAMENSAJE('Archivo Generado: C:\TASPASIVO' +  FormatDateTime('DDMMYYYY',Objeto.Apli.DameFechaEmpresa) +'.TXT');
end;

procedure TWIntCrTAS.sbEnviaPasivoSIARClick(Sender: TObject);
begin
   if (qPasivo1 <> nil) or (qPasivo2 <> nil) or (qPasivo3 <> nil) then
   begin
      if (qPasivo1 <> nil) then EnviarInformacion(qPasivo1,2);
      if (qPasivo2 <> nil) then EnviarInformacion(qPasivo2,2);
      if (qPasivo3 <> nil) then EnviarInformacion(qPasivo3,2);
      EXECUTE_MUESTRAMENSAJE('Envío concluido.');
   end
   else
   begin
      EXECUTE_MUESTRAMENSAJE('No se ha realizado la generación del archivo. Verifique');
      pbArch.Position := 0;
   end; 
end;

procedure TWIntCrTAS.GeneraArchivoPasivo;
var vlPlazo,vlNumCup,vlStatus:String; iFolio:Integer;
begin
  vlStatus:='0';
  if rgCARGA.ItemIndex=0 then vlStatus:='1050';
  iFolio:=0;
  {SSQL:=GeneraPSQL1(vlStatus)+
        ' UNION ALL '+
        GeneraPSQL2(vlStatus)+
        ' UNION ALL '+
        GeneraPSQL3(vlStatus);}
  pbPasivo.Position := 1;
  mPas.clear;
  qPasivo1.Close;
  qPasivo1.SQL.Text:=GeneraPSQL1(vlStatus);
  qPasivo1.Open;
  try
    mPas.Lines.Add('PORTAFOLIO' +#9+      'CREDITO'+#9+             'FUENTE'+#9+        'SIGNO'+#9+        
                   'ACTIVOFINANCIERO'+#9+ 'ACTIVOBASICO'+#9+        'FPOSICION'+#9+     'FOLIO'+#9+        
                   'FECHAINICIO'+#9+      'FECHAVENCIMIENTO'+#9+    'IMPORTE'+#9+       'TASAFIJA1'+#9+    
                   'TASAFIJA2'+#9+        'TIPOCAMBIO'+#9+          'PLAZOCUPON'+#9+    'NUMEROCUPONES'+#9+
                   'FECHAEMISION'+#9+     'FACTORCAPITALIZACION'+#9+'FACTORAMORTIZA'+#9+'CUPONEMPAMOR'+#9+ 
                   'NUMEROAMORTIZA'+#9+   'TIPOCREDITO'+#9+         'PORTAFOLIOCOL'+#9+ 'VALORCOL'+#9+     
                   'TIPOGARANTIA'+#9+     'OTROACC'+#9+             'DIACORTE'+#9+      'ESTATUSGRAL'+#9+  
                   'PORCENTQUEB'+#9+      'TASACUPONAC');
    pbPasivo.Position := 2;
    While ((qPasivo1 <> Nil) and (qPasivo1.Eof = False)) do
    Begin
       iFolio := iFolio + 1;
       vlPlazo:='';vlNumCup:='';
       PROC_PLAZO_CUPON(qPasivo1.FieldByName('ID_CREDITO').AsString, qPasivo1.FieldByName('campo1').AsString,
                        qPasivo1.FieldByName('campo2').AsString,     qPasivo1.FieldByName('campo3').AsString,'PA');
      vlPlazo:=ssPlazo;
      vlNumCup:=ssFactor;
       mPas.Lines.Add(
        qPasivo1.FieldByName('PORTAFOLIO').AsString      +#9+ qPasivo1.FieldByName('ID_CREDITO').AsString          +#9+
        qPasivo1.FieldByName('FUENTE').AsString          +#9+ qPasivo1.FieldByName('SIGNO').AsString               +#9+
        qPasivo1.FieldByName('ACTIVOFINANCIERO').AsString+#9+ qPasivo1.FieldByName('ACTIVOBASICO').AsString        +#9+
        qPasivo1.FieldByName('FPOSICION').AsString       +#9+ IntToStr(iFolio)                                     +#9+
        qPasivo1.FieldByName('FECHAINICIO').AsString     +#9+ qPasivo1.FieldByName('FECHAVENCIMIENTO').AsString    +#9+
        qPasivo1.FieldByName('IMPORTE').AsString         +#9+ qPasivo1.FieldByName('TASAFIJA1').AsString           +#9+
        qPasivo1.FieldByName('TASAFIJA2').AsString       +#9+ qPasivo1.FieldByName('TIPOCAMBIO').AsString          +#9+
        vlPlazo                                          +#9+ qPasivo1.FieldByName('NUMEROCUPONES').AsString       +#9+
        qPasivo1.FieldByName('FECHAEMISION').AsString    +#9+ qPasivo1.FieldByName('FACTORCAPITALIZACION').AsString+#9+
        vlNumCup                                         +#9+ qPasivo1.FieldByName('CUPONEMPAMOR').AsString        +#9+
        qPasivo1.FieldByName('NUMEROAMORTIZA').AsString  +#9+ qPasivo1.FieldByName('TIPOCREDITO').AsString         +#9+
        qPasivo1.FieldByName('PORTAFOLIOCOL').AsString   +#9+ qPasivo1.FieldByName('VALORCOL').AsString            +#9+
        qPasivo1.FieldByName('TIPOGARANTIA').AsString    +#9+ qPasivo1.FieldByName('OTROACC').AsString             +#9+
        qPasivo1.FieldByName('DIACORTE').AsString        +#9+ qPasivo1.FieldByName('ESTATUSGRAL').AsString         +#9+
        qPasivo1.FieldByName('PORCENTQUEB').AsString     +#9+ qPasivo1.FieldByName('TASACUPONAC').AsString);
       qPasivo1.next;
    End;
    //segunda parte
    qPasivo2.Close;
    qPasivo2.SQL.Text:=GeneraPSQL2(vlStatus);
    qPasivo2.Open;
    While ((qPasivo2 <> Nil) and (qPasivo2.Eof = False)) do
    Begin
       iFolio := iFolio + 1;
       vlPlazo:='';vlNumCup:='';
       PROC_PLAZO_CUPON(qPasivo2.FieldByName('ID_CREDITO').AsString, qPasivo2.FieldByName('campo1').AsString,
                        qPasivo2.FieldByName('campo2').AsString,     qPasivo2.FieldByName('campo3').AsString,'PA');
      vlPlazo:=ssPlazo;
      vlNumCup:=ssFactor;
       mPas.Lines.Add(
        qPasivo2.FieldByName('PORTAFOLIO').AsString      +#9+ qPasivo2.FieldByName('ID_CREDITO').AsString          +#9+
        qPasivo2.FieldByName('FUENTE').AsString          +#9+ qPasivo2.FieldByName('SIGNO').AsString               +#9+
        qPasivo2.FieldByName('ACTIVOFINANCIERO').AsString+#9+ qPasivo2.FieldByName('ACTIVOBASICO').AsString        +#9+
        qPasivo2.FieldByName('FPOSICION').AsString       +#9+ IntToStr(iFolio)                                     +#9+
        qPasivo2.FieldByName('FECHAINICIO').AsString     +#9+ qPasivo2.FieldByName('FECHAVENCIMIENTO').AsString    +#9+
        qPasivo2.FieldByName('IMPORTE').AsString         +#9+ qPasivo2.FieldByName('TASAFIJA1').AsString           +#9+
        qPasivo2.FieldByName('TASAFIJA2').AsString       +#9+ qPasivo2.FieldByName('TIPOCAMBIO').AsString          +#9+
        vlPlazo                                          +#9+ qPasivo2.FieldByName('NUMEROCUPONES').AsString       +#9+
        qPasivo2.FieldByName('FECHAEMISION').AsString    +#9+ qPasivo2.FieldByName('FACTORCAPITALIZACION').AsString+#9+
        vlNumCup                                         +#9+ qPasivo2.FieldByName('CUPONEMPAMOR').AsString        +#9+
        qPasivo2.FieldByName('NUMEROAMORTIZA').AsString  +#9+ qPasivo2.FieldByName('TIPOCREDITO').AsString         +#9+
        qPasivo2.FieldByName('PORTAFOLIOCOL').AsString   +#9+ qPasivo2.FieldByName('VALORCOL').AsString            +#9+
        qPasivo2.FieldByName('TIPOGARANTIA').AsString    +#9+ qPasivo2.FieldByName('OTROACC').AsString             +#9+
        qPasivo2.FieldByName('DIACORTE').AsString        +#9+ qPasivo2.FieldByName('ESTATUSGRAL').AsString         +#9+
        qPasivo2.FieldByName('PORCENTQUEB').AsString     +#9+ qPasivo2.FieldByName('TASACUPONAC').AsString);
       qPasivo2.next;
    End;
    //tercera parte
    qPasivo3.Close;
    qPasivo3.SQL.Text:=GeneraPSQL3(vlStatus);
    qPasivo3.Open;
    While ((qPasivo3 <> Nil) and (qPasivo3.Eof = False)) do
    Begin
       iFolio := iFolio + 1;
       mPas.Lines.Add(
        qPasivo3.FieldByName('PORTAFOLIO').AsString      +#9+ qPasivo3.FieldByName('ID_CREDITO').AsString          +#9+
        qPasivo3.FieldByName('FUENTE').AsString          +#9+ qPasivo3.FieldByName('SIGNO').AsString               +#9+
        qPasivo3.FieldByName('ACTIVOFINANCIERO').AsString+#9+ qPasivo3.FieldByName('ACTIVOBASICO').AsString        +#9+
        qPasivo3.FieldByName('FPOSICION').AsString       +#9+ IntToStr(iFolio)                                     +#9+
        qPasivo3.FieldByName('FECHAINICIO').AsString     +#9+ qPasivo3.FieldByName('FECHAVENCIMIENTO').AsString    +#9+
        qPasivo3.FieldByName('IMPORTE').AsString         +#9+ qPasivo3.FieldByName('TASAFIJA1').AsString           +#9+
        qPasivo3.FieldByName('TASAFIJA2').AsString       +#9+ qPasivo3.FieldByName('TIPOCAMBIO').AsString          +#9+
        qPasivo3.FieldByName('PLAZOCUPON').AsString      +#9+ qPasivo3.FieldByName('NUMEROCUPONES').AsString       +#9+
        qPasivo3.FieldByName('FECHAEMISION').AsString    +#9+ qPasivo3.FieldByName('FACTORCAPITALIZACION').AsString+#9+
        qPasivo3.FieldByName('FACTORAMORTIZA').AsString  +#9+ qPasivo3.FieldByName('CUPONEMPAMOR').AsString        +#9+
        qPasivo3.FieldByName('NUMEROAMORTIZA').AsString  +#9+ qPasivo3.FieldByName('TIPOCREDITO').AsString         +#9+
        qPasivo3.FieldByName('PORTAFOLIOCOL').AsString   +#9+ qPasivo3.FieldByName('VALORCOL').AsString            +#9+
        qPasivo3.FieldByName('TIPOGARANTIA').AsString    +#9+ qPasivo3.FieldByName('OTROACC').AsString             +#9+
        qPasivo3.FieldByName('DIACORTE').AsString        +#9+ qPasivo3.FieldByName('ESTATUSGRAL').AsString         +#9+
        qPasivo3.FieldByName('PORCENTQUEB').AsString     +#9+ qPasivo3.FieldByName('TASACUPONAC').AsString);
       qPasivo3.next;
    End;
    lbTotPas.Caption := IntToStr(iFolio);
  finally
  end;
  pbPasivo.Position := 3;
end;

Function TWIntCrTAS.GeneraPSQL1(vStatus:String): String;
var VLSQL  : String;
begin
     VLSQL := '';
     VLSQL :=
' SELECT  ''FD_''||TRIM(CC.CVE_PRESUPUESTO) AS PORTAFOLIO, '+
'         CC.ID_CREDITO, '+
'         ''X'' AS FUENTE, '+
'         ''V'' AS SIGNO, '+
'         substr(PKGCRTAS.Fun_ActFinSIAR(''FD_'',''001'',CCTO.CVE_SUB_TIP_BCO,'''','''','''', '+
                                  ' CC.CVE_TASA_REFER,CTO.CVE_MONEDA,''''),1,20) AS ACTIVOFINANCIERO, '+
'         '' '' AS ACTIVOBASICO, '+
'         TRUNC(SYSDATE) AS FPOSICION, '+
'         PKGCRTAS.ObtenFIniCrePAS(CC.ID_CREDITO,''IN'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS FECHAINICIO, '+
'         CC.F_VALOR_CRED + CC.DIAS_PLAZO AS FECHAVENCIMIENTO, '+
'         PKGCRTAS.ObtenImpCrePAS(CC.ID_CREDITO,''IN'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS IMPORTE, '+
'         ''0'' AS TASAFIJA1, '+
'         TO_CHAR(PKGCRTAS.ObtenTasaFija2(''P01'',CC.ID_CREDITO,CTO.CVE_MONEDA,CC.CVE_TASA_REFER,'+
               'CC.TASA_CREDITO,CC.SOBRETASA,'''+DateToStr(Objeto.Apli.DameFechaEmpresa)+''')) AS TASAFIJA2, '+
'         1 AS TIPOCAMBIO, '+
'        ''IN'' as campo1, CAT.TOT_PERIODOS_K as campo2, CIT.TOT_PERIODOS_I as campo3, '' '' AS PLAZOCUPON, '+
'         PKGCRTAS.ObtenNoInterPAS(CC.ID_CREDITO,''IN'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS NUMEROCUPONES, '+
'         TO_DATE(''01/01/100'') AS FECHAEMISION, '+
'         0 AS FACTORCAPITALIZACION, '+
'         PKGCRTAS.ObtenPrimerAmorPAS(CC.ID_CREDITO,''IN'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS CUPONEMPAMOR, '+
'         PKGCRTAS.ObtenNoAmorPAS(CC.ID_CREDITO,''IN'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS NUMEROAMORTIZA, '+
'         '' '' AS TIPOCREDITO, '' '' AS PORTAFOLIOCOL, '+
'         0 AS VALORCOL, 0 AS TIPOGARANTIA, 0 AS OTROACC, 0 AS DIACORTE, '+vStatus+' AS ESTATUSGRAL, 0 AS PORCENTQUEB, '+
'         NVL(CIT_VI.TASA_APLICADA,CIT_VE.TASA_APLICADA) AS TASACUPONAC '+
'  FROM  ( SELECT * FROM CRE_CREDITO '+
'          WHERE SIT_CREDITO = ''AC'' '+
'          AND   ID_CREDITO IN (select id_credito from cre_capital where sit_capital in (''AC'',''PA'',''IM'')) ' +
'          AND   ID_CREDITO IN (select id_credito from cre_interes where sit_interes in (''AC'',''PA'',''IM'')) ' +
'          AND  (F_VALOR_CRED + DIAS_PLAZO) >= SYSDATE '+
'         ) CC, '+
'        ( SELECT * FROM CRE_CONTRATO '+
'          WHERE CVE_SUB_TIP_BCO IN (57)) CCTO, '+ // SOLO FOVI  
'        ( SELECT * FROM CONTRATO '+
'          WHERE  CVE_TIP_CONTRATO = ''CRED'') CTO, '+    
'        ( SELECT COUNT(*) AS TOT_PERIODOS_I, ID_CREDITO '+
'          FROM CRE_INTERES GROUP BY ID_CREDITO) CIT, '+ 
'       (  SELECT COUNT(*) AS TOT_PERIODOS_K, ID_CREDITO ' +
'          FROM CRE_CAPITAL GROUP BY ID_CREDITO) CAT, ' +              
'         (SELECT SUM(IMP_PAGADO) AS IMP_PAGADO_COM, ID_CREDITO  FROM CRE_DET_COMISION ' +
'          WHERE F_PAGO <= TRUNC(SYSDATE) GROUP BY ID_CREDITO) COM, ' +
'         (SELECT SUM(IMP_OPERACION) IMP_AMORT, ID_CREDITO FROM CRE_TRANSACCION ' +
'          WHERE CVE_OPERACION = ''CAMCAP'' AND ID_COD_RESP = 0 AND SIT_TRANSACCION = ''AC''  ' +
'          GROUP BY ID_CREDITO) TAM,  ' +                              
'        ( SELECT CI.TASA_APLICADA, CI.ID_CREDITO FROM '+
'           (SELECT MAX(NUM_PERIODO) AS NUM_PERIODO, ID_CREDITO '+
'            FROM CRE_INTERES '+
'            WHERE TRUNC(SYSDATE) BETWEEN F_VENCIMIENTO - (PLAZO - 1) AND F_VENCIMIENTO '+
'            AND   TASA_APLICADA IS NOT NULL '+
'            AND   TASA_APLICADA <> 0 '+
'            GROUP BY  ID_CREDITO) CIM, '+
'           CRE_INTERES CI '+
'           WHERE CI.ID_CREDITO = CIM.ID_CREDITO '+
'           AND   CI.NUM_PERIODO = CIM.NUM_PERIODO) CIT_VI, '+         
'        ( SELECT CI.TASA_APLICADA, CI.ID_CREDITO FROM '+
'           (SELECT MAX(NUM_PERIODO) AS NUM_PERIODO, ID_CREDITO '+
'            FROM CRE_INTERES '+
'            GROUP BY  ID_CREDITO) CIM, '+
'           CRE_INTERES CI '+
'          WHERE CI.ID_CREDITO = CIM.ID_CREDITO '+
'          AND   CI.TASA_APLICADA IS NOT NULL '+
'          AND   CI.TASA_APLICADA <> 0 '+
'          AND   CI.NUM_PERIODO = CIM.NUM_PERIODO) CIT_VE '+
'  WHERE  CCTO.ID_CONTRATO = CC.ID_CONTRATO '+
'  AND    CTO.ID_CONTRATO  = CC.ID_CONTRATO '+
'  AND    CIT.ID_CREDITO   = CC.ID_CREDITO '+
'  AND    CAT.ID_CREDITO   = CC.ID_CREDITO '+
'  AND    COM.ID_CREDITO (+)= CC.ID_CREDITO' +
'  AND    TAM.ID_CREDITO (+)= CC.ID_CREDITO' +
'  AND    CIT_VI.ID_CREDITO (+)= CC.ID_CREDITO '+
'  AND    CIT_VE.ID_CREDITO (+)= CC.ID_CREDITO ';
     GeneraPSQL1 := VLSQL;
end;

Function TWIntCrTAS.GeneraPSQL2(vStatus:String): String;
var VLSQL  : String;
begin
     VLSQL := '';
     VLSQL :=
' SELECT ''FD_''||TRIM(CP.CVE_PRODUCTO_GPO) AS PORTAFOLIO, '+
'        CC.ID_CREDITO, '+
'        ''X'' AS FUENTE, '+
'        ''V'' AS SIGNO, '+
'        substr(PKGCRTAS.FUN_ACTFINSIAR(''FD_'',''002'','''',CP.CVE_PRODUCTO_GPO,'''','''',CC.CVE_TASA_REFER,CTO.CVE_MONEDA,CC.CVE_FND_ENT_DES),1,20) AS ACTIVOFINANCIERO, '+
'        '' '' AS ACTIVOBASICO, '+
'        TRUNC(SYSDATE) AS FPOSICION, '+
'        PKGCRTAS.ObtenFIniCrePAS(CC.ID_CREDITO,''IC'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS FECHAINICIO, '+
'        CC.F_VENCIMIENTO AS FECHAVENCIMIENTO, '+
'        PKGCRTAS.ObtenImpCrePAS(CC.ID_CREDITO,''IC'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS IMPORTE, '+
'        ''0'' AS TASAFIJA1, '+
'        TO_CHAR(PKGCRTAS.ObtenTasaFija2(''002'',CC.ID_CREDITO,CTO.CVE_MONEDA,CC.CVE_TASA_REFER,'+
                 'CC.TASA_CREDITO,CC.SOBRETASA,'''+DateToStr(Objeto.Apli.DameFechaEmpresa)+''')) AS TASAFIJA2, '+
'        1 AS TIPOCAMBIO, '+
'        ''IC'' as campo1, CAT.TOT_PERIODOS_K as campo2, CIT.TOT_PERIODOS_I as campo3, '' '' AS PLAZOCUPON, '+
'        PKGCRTAS.ObtenNoInterPAS(CC.ID_CREDITO,''IC'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS NUMEROCUPONES, '+
'        TO_DATE(''01/01/100'') AS FECHAEMISION, '+
'        0 AS FACTORCAPITALIZACION, '+
'        PKGCRTAS.ObtenPrimerAmorPAS(CC.ID_CREDITO,''IC'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS CUPONEMPAMOR, '+
'        PKGCRTAS.ObtenNoAmorPAS(CC.ID_CREDITO,''IC'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I) AS NUMEROAMORTIZA, '+
'        '' '' AS TIPOCREDITO, '' '' AS PORTAFOLIOCOL, '+
'        0 AS VALORCOL, 0 AS TIPOGARANTIA, 0 AS OTROACC, 0 AS DIACORTE,'+vStatus+' AS ESTATUSGRAL, 0 AS PORCENTQUEB, '+
'        NVL(CIT_VI.TASA_APLICADA,CIT_VE.TASA_APLICADA) AS TASACUPONAC '+
' FROM  ( SELECT * FROM CR_FND_CREDITO '+
'         WHERE SIT_CREDITO = ''AC'' '+
'         AND   F_VENCIMIENTO >= SYSDATE ) CC, '+
'       CR_CREDITO CCC, '+                       
'       CR_CONTRATO CCTO, '+                     
'       ( SELECT * FROM CONTRATO '+
'         WHERE  CVE_TIP_CONTRATO = ''CRED'')CTO, '+
'       ( SELECT * FROM CR_PRODUCTO '+
'         WHERE  CVE_PRODUCTO_GPO <> ''FACTOR'')CP, '+                         
'       ( SELECT COUNT(*) AS TOT_PERIODOS_I, ID_CREDITO '+
'         FROM CR_FND_INTERES GROUP BY ID_CREDITO) CIT, '+
'       ( SELECT COUNT(*) AS TOT_PERIODOS_K, ID_CREDITO '+
'         FROM CR_FND_CAPITAL GROUP BY ID_CREDITO) CAT, '+      
'       ( SELECT SUM(IMP_FINAN_ADIC) AS IMP_FINAN_ADIC, ID_CREDITO '+
'         FROM CR_FND_FIN_ADIC '+
'         GROUP BY ID_CREDITO) CFA, '+                    
'         (SELECT SUM(IMP_PAGADO) AS IMP_PAGADO_COM, ID_CREDITO  FROM CR_FND_COMISION '+
'         WHERE F_PAGO <= TRUNC(SYSDATE) GROUP BY ID_CREDITO) COM, '+
'         (SELECT SUM(CDT.IMP_CONCEPTO) IMP_AMORT, CT.ID_CREDITO  FROM '+
'         (SELECT * FROM CR_DET_TRANSAC WHERE CVE_CONCEPTO = ''IMPBRU'') CDT, '+
'         (SELECT * FROM CR_CVE_OPERACION WHERE CVE_PARAMETRO = ''PAGOCP'') CCO, '+
'         (SELECT * FROM CR_TRANSACCION   WHERE F_VALOR < F_PROG_PAGO AND SIT_TRANSACCION = ''AC'' AND   ID_TRANS_CANCELA IS NULL) CT, '+
'         (SELECT * FROM CR_FND_CREDITO WHERE SIT_CREDITO = ''AC'') CC, '+
'         CR_CONTRATO CCT, CONTRATO CTO ' +
'         WHERE CT.ID_CREDITO = CC.ID_CREDITO ' +
'         AND   CDT.ID_TRANSACCION = CT.ID_TRANSACCION ' +
'         AND   CDT.CVE_OPERACION = CT.CVE_OPERACION ' +
'         AND   CTO.ID_CONTRATO = CT.ID_CONTRATO ' +
'         AND   CCT.ID_CONTRATO = CT.ID_CONTRATO ' +
'         AND   CCO.CVE_PRODUCTO = CCT.CVE_PRODUCTO_CRE ' +
'         AND   CCO.CVE_MONEDA = CTO.CVE_MONEDA ' +
'         AND   CCO.CVE_OPERACION = CT.CVE_OPERACION ' +
'         GROUP BY CT.ID_CREDITO) TAM, ' +      
'       ( SELECT CI.TASA_APLICADA, CI.ID_CREDITO FROM '+
'          (SELECT MAX(NUM_PERIODO) AS NUM_PERIODO, ID_CREDITO '+
'           FROM CR_FND_INTERES '+
'           WHERE TRUNC(SYSDATE) BETWEEN F_VENCIMIENTO - (PLAZO - 1) AND F_VENCIMIENTO '+
'           GROUP BY  ID_CREDITO) CIM, '+
'          CR_FND_INTERES CI '+
'         WHERE CI.ID_CREDITO = CIM.ID_CREDITO '+
'         AND   CI.NUM_PERIODO = CIM.NUM_PERIODO) CIT_VI, '+
'       ( SELECT CI.TASA_APLICADA, CI.ID_CREDITO FROM '+
'          (SELECT MAX(NUM_PERIODO) AS NUM_PERIODO, ID_CREDITO '+
'           FROM CR_FND_INTERES '+
'           GROUP BY  ID_CREDITO) CIM, '+
'          CR_FND_INTERES CI '+
'         WHERE CI.ID_CREDITO = CIM.ID_CREDITO '+
'         AND   CI.NUM_PERIODO = CIM.NUM_PERIODO) CIT_VE '+
' WHERE  CC.ID_CREDITO     = CCC.ID_CREDITO '+
' AND    CCTO.ID_CONTRATO  = CTO.ID_CONTRATO '+
' AND    CCTO.FOL_CONTRATO = CCC.FOL_CONTRATO '+
' AND    CCC.ID_CREDITO     = CIT.ID_CREDITO '+
' AND    CTO.ID_CONTRATO   = CCC.ID_CONTRATO  '+
' AND    CP.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE '+
' AND    CIT.ID_CREDITO    = CCC.ID_CREDITO '+
' AND    CAT.ID_CREDITO    = CCC.ID_CREDITO '+
' AND    CFA.ID_CREDITO    (+)= CCC.ID_CREDITO '+
' AND    COM.ID_CREDITO (+)= CC.ID_CREDITO' +
' AND    TAM.ID_CREDITO (+)= CC.ID_CREDITO' +
' AND    CIT_VI.ID_CREDITO (+)= CC.ID_CREDITO '+
' AND    CIT_VE.ID_CREDITO (+)= CC.ID_CREDITO ';

     GeneraPSQL2 := VLSQL;
end;


Function TWIntCrTAS.GeneraPSQL3(vStatus:String): String;
var VLSQL  : String;
begin
     VLSQL := '';
     VLSQL :=
' SELECT ''FD_''|| CP.CVE_PRODUCTO_GPO  AS PORTAFOLIO, '+
'        CC.ID_CREDITO, '+
'        ''X'' AS FUENTE, '+
'        ''V'' AS SIGNO, '+
'        substr(PKGCRTAS.FUN_ACTFINSIAR(''FD_'',''003'','''','''', '+
'        CS.B_OPERADO_NAFIN,CS.CVE_TIPO_INTERES,CC.CVE_TASA_REFER,CTO.CVE_MONEDA,CC.CVE_FND_ENT_DES),1,20) AS ACTIVOFINANCIERO, '+
'        '' '' AS ACTIVOBASICO, '+
'        TRUNC(SYSDATE) AS FPOSICION, '+
'        CC.F_INICIO AS FECHAINICIO, '+
'        CCA.F_VENCIMIENTO AS FECHAVENCIMIENTO, '+
'        CCA.IMP_CAPITAL AS IMPORTE, '+
'        ''0'' AS TASAFIJA1, '+
'        TO_CHAR(PKGCRTAS.ObtenTasaFija2(''003'',CC.ID_CREDITO,CTO.CVE_MONEDA,CC.CVE_TASA_REFER,'+
                 'CC.TASA_CREDITO,CC.SOBRETASA,'''+DateToStr(Objeto.Apli.DameFechaEmpresa)+''')) AS TASAFIJA2, '+
'        1 AS TIPOCAMBIO, '+
'        ''XX'' as campo1, '+
'        TO_CHAR(CCA.PLAZO) AS PLAZOCUPON, '+
'        1 AS NUMEROCUPONES, '+
'        TO_DATE(''01/01/100'') AS FECHAEMISION, '+
'        0 AS FACTORCAPITALIZACION, '+
'        '' '' AS FACTORAMORTIZA, '+
'        1 AS CUPONEMPAMOR, '+
'        1 AS NUMEROAMORTIZA, '+
'        '' '' AS TIPOCREDITO, '' '' AS PORTAFOLIOCOL, '+
'        0 AS VALORCOL, 0 AS TIPOGARANTIA, 0 AS OTROACC, 0 AS DIACORTE, '+vStatus+' AS ESTATUSGRAL, 0 AS PORCENTQUEB, '+
'        NVL(CIT_VI.TASA_APLICADA,0)   AS TASACUPONAC '+
' FROM  ( SELECT * FROM CR_FND_CREDITO '+
'         WHERE SIT_CREDITO = ''AC''  '+
'         AND   F_VENCIMIENTO >=SYSDATE) CC, '+
'       CR_CREDITO CCC, '+
'       CR_CONTRATO CCTO, '+
'       ( SELECT * FROM CONTRATO '+
'         WHERE  CVE_TIP_CONTRATO = ''CRED'')CTO, '+
'       ( SELECT * FROM CR_PRODUCTO '+
'         WHERE  CVE_PRODUCTO_GPO = ''FACTOR'')CP, '+
'       CR_CESION CS, '+
'       ( SELECT * FROM CR_DOCUMENTO '+
'         WHERE  SIT_DOCUMENTO = ''AC'') CD, '+
'       CR_FND_CAPITAL CCA, '+
'       CR_FND_INTERES CIT_VI, '+
'       (SELECT SUM(IMP_COMISION) AS IMP_PAGADO_COM, ID_CESION' +
'        FROM CR_CESION_COMIS GROUP BY ID_CESION) COM,' +
'       (SELECT SUM(CDT.IMP_CONCEPTO) IMP_AMORT, CT.ID_CREDITO  FROM' +
'        (SELECT * FROM CR_DET_TRANSAC WHERE CVE_CONCEPTO = ''IMPBRU'') CDT,' +
'        (SELECT * FROM CR_CVE_OPERACION WHERE CVE_PARAMETRO = ''PAGOCP'') CCO,' +
'        (SELECT * FROM CR_TRANSACCION   WHERE F_VALOR < F_PROG_PAGO AND SIT_TRANSACCION = ''AC'' AND   ID_TRANS_CANCELA IS NULL) CT,' +
'        (SELECT * FROM CR_FND_CREDITO WHERE SIT_CREDITO = ''AC'') CC,' +
'        CR_CONTRATO CCT, CONTRATO CTO' +
'        WHERE CT.ID_CREDITO = CC.ID_CREDITO' +
'        AND   CDT.ID_TRANSACCION = CT.ID_TRANSACCION' +
'        AND   CDT.CVE_OPERACION = CT.CVE_OPERACION' +
'        AND   CTO.ID_CONTRATO = CT.ID_CONTRATO' +
'        AND   CCT.ID_CONTRATO = CT.ID_CONTRATO' +
'        AND   CCO.CVE_PRODUCTO = CCT.CVE_PRODUCTO_CRE' +
'        AND   CCO.CVE_MONEDA = CTO.CVE_MONEDA' +
'        AND   CCO.CVE_OPERACION = CT.CVE_OPERACION' +
'        GROUP BY CT.ID_CREDITO) TAM, ' +
'       ( SELECT COUNT(*) AS TOT_DOC, ID_CESION '+
'         FROM CR_DOCUMENTO '+
'         WHERE SIT_DOCUMENTO <> ''CA'' GROUP BY ID_CESION) TDD '+
' WHERE  CC.ID_CREDITO      = CCC.ID_CREDITO '+
' AND    CCTO.ID_CONTRATO   = CTO.ID_CONTRATO '+
' AND    CCTO.FOL_CONTRATO  = CCC.FOL_CONTRATO '+
' AND    CTO.ID_CONTRATO    = CCC.ID_CONTRATO '+
' AND    CP.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE '+
' AND    CS.ID_CESION       = CC.ID_CREDITO '+
' AND    CD.ID_CESION       = CS.ID_CESION '+
' AND    CCA.ID_CREDITO     = CD.ID_CESION '+
' AND    CCA.NUM_PERIODO    = CD.NUM_PERIODO_DOC '+
' AND    CIT_VI.ID_CREDITO  = CD.ID_CESION '+
' AND    CIT_VI.NUM_PERIODO = CD.NUM_PERIODO_DOC '+
' AND    COM.ID_CESION (+)= CS.ID_CESION' +
' AND    TAM.ID_CREDITO (+)= CC.ID_CREDITO' +
' AND    TDD.ID_CESION   (+)= CS.ID_CESION ';

     GeneraPSQL3 := VLSQL;
end;

procedure TWIntCrTAS.sbGenPasCorpClick(Sender: TObject);
begin
     GeneraArchivoPasivoCorp;
     mPASCorp.Lines.SaveToFile('C:\TASPASIVOCORP'+ FormatDateTime('DDMMYYYY',Objeto.Apli.DameFechaEmpresa) +'.TXT' );
     EXECUTE_MUESTRAMENSAJE('Archivo Generado: C:\TASPASIVOCORP' +  FormatDateTime('DDMMYYYY',Objeto.Apli.DameFechaEmpresa));
end;

procedure TWIntCrTAS.GeneraArchivoPasivoCorp;
var sCons,sSql, vlStatus:String; iFolio:Integer;
    Anio, Mes, Dia: Word; sFecha:tDatetime;
begin
  vlStatus:='0';
  if rgCARGA.ItemIndex=0 then vlStatus:='1050';
  iFolio:=0;
  SSQL:='SELECT * FROM LIM_SIAR_CONSULT '+
        'WHERE CVE_CONSULTA=''PASCOR'' AND SIT_CONSULTA=''AC'' '+
        'ORDER BY NUM_SECUENCIA ';
  pbPasCorp.Position := 1;
  mPasCorp.clear;
  qPasCorp.Close;
  qPasCorp.SQL.Text:=sSQL;
  qPasCorp.Open;
  while not (qPasCorp.Eof) do
  begin sCons:=sCons + ' '+ qPasCorp.FieldByName('DS_CONSULTA').AsString;
        qPasCorp.Next;
  end;
  qPasCorp.Close;
  qPasCorp.SQL.Text:=sCons;
  DecodeDate(Objeto.Apli.DameFechaEmpresa, Anio, Mes, Dia);
  sFecha:=EncodeDate(Anio, Mes, 01);
  qPasCorp.ParamByName('PHOY').AsDate          :=strToDate(FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa));
  qPasCorp.ParamByName('PF_APERTURA').AsDate   :=sFecha;
  qPasCorp.ParamByName('PF_VENCIMIENTO').AsDate:=StrToDate(FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa));
  qPasCorp.ParamByName('PF_INICIO_OPER').AsDate:=StrToDate(FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa));
  qPasCorp.ParamByName('PF_VENMTO_OPER').AsDate:=sFecha;
  qPasCorp.ParamByName('PFAPERTURA').AsDate    :=StrToDate(FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa));
  qPasCorp.ParamByName('PINICIO').AsDate       :=sFecha;
  qPasCorp.ParamByName('PESTATUS').AsInteger   :=StrToInt(vlStatus);
  qPasCorp.Open;

  try
    mPasCorp.Lines.Add('PORTAFOLIO' +#9+         'FUENTE'+#9+       'SIGNO'+#9+        'ACTIVOFINANCIERO'+#9+
                       'ACTIVOBASICO'+#9+        'FPOSICION'+#9+     'FOLIO'+#9+        'FECHAINICIO'+#9+
                       'FECHAVENCIMIENTO'+#9+    'IMPORTE'+#9+       'TASAFIJA1'+#9+    'TASAFIJA2'+#9+
                       'TIPOCAMBIO'+#9+          'PLAZOCUPON'+#9+    'NUMEROCUPONES'+#9+'FECHAEMISION'+#9+
                       'FACTORCAPITALIZACION'+#9+'FACTORAMORTIZA'+#9+'CUPONEMPAMOR'+#9+ 'NUMEROAMORTIZA'+#9+
                       'TIPOCREDITO'+#9+         'PORTAFOLIOCOL'+#9+ 'VALORCOL'+#9+     'TIPOGARANTIA'+#9+
                       'OTROACC'+#9+             'DIACORTE'+#9+      'ESTATUSGRAL'+#9+  'PORCENTQUEB'+#9+'TASACUPONAC');
    pbPasCorp.Position := 2;
    While ((qPasCorp <> Nil) and (qPasCorp.Eof = False)) do
    Begin
       iFolio := iFolio + 1;
       mPasCorp.Lines.Add(
         qPasCorp.FieldByName('PORTAFOLIO').AsString      +#9+ 
         qPasCorp.FieldByName('FUENTE').AsString          +#9+ qPasCorp.FieldByName('SIGNO').AsString               +#9+
         qPasCorp.FieldByName('ACTIVOFINANCIERO').AsString+#9+ qPasCorp.FieldByName('ACTIVOBASICO').AsString        +#9+
         qPasCorp.FieldByName('FPOSICION').AsString       +#9+ IntToStr(iFolio)                                    +#9+
         qPasCorp.FieldByName('FECHAINICIO').AsString     +#9+ qPasCorp.FieldByName('FECHAVENCIMIENTO').AsString    +#9+
         qPasCorp.FieldByName('IMPORTE').AsString         +#9+ qPasCorp.FieldByName('TASAFIJA1').AsString           +#9+
         qPasCorp.FieldByName('TASAFIJA2').AsString       +#9+ qPasCorp.FieldByName('TIPOCAMBIO').AsString          +#9+
         qPasCorp.FieldByName('PLAZOCUPON').AsString      +#9+ qPasCorp.FieldByName('NUMEROCUPONES').AsString       +#9+
         qPasCorp.FieldByName('FECHAEMISION').AsString    +#9+ qPasCorp.FieldByName('FACTORCAPITALIZACION').AsString+#9+
         qPasCorp.FieldByName('FACTORAMORTIZA').AsString  +#9+ qPasCorp.FieldByName('CUPONEMPAMOR').AsString        +#9+
         qPasCorp.FieldByName('NUMEROAMORTIZA').AsString  +#9+ qPasCorp.FieldByName('TIPOCREDITO').AsString         +#9+
         qPasCorp.FieldByName('PORTAFOLIOCOL').AsString   +#9+ qPasCorp.FieldByName('VALORCOL').AsString            +#9+
         qPasCorp.FieldByName('TIPOGARANTIA').AsString    +#9+ qPasCorp.FieldByName('OTROACC').AsString             +#9+
         qPasCorp.FieldByName('DIACORTE').AsString        +#9+ qPasCorp.FieldByName('ESTATUSGRAL').AsString         +#9+
         qPasCorp.FieldByName('PORCENTQUEB').AsString     +#9+ qPasCorp.FieldByName('TASACUPONAC').AsString);
       qPasCorp.next;
    End;
    lbPasCorp.Caption := IntToStr(iFolio);
  finally
  end;
  pbPasCorp.Position := 3;
end;

procedure TWIntCrTAS.sbEnvPasCorpClick(Sender: TObject);
begin
   if not(qPasCorp <> nil) then
   begin
      EXECUTE_MUESTRAMENSAJE('No se ha realizado la generación del archivo. Verifique');
      pbPasCorp.Position := 0;
   end
   else 
   begin EnviarInformacion(qPasCorp,3);
         EXECUTE_MUESTRAMENSAJE('Envío concluido.');
   end;   
end;

procedure TWIntCrTAS.PROC_PLAZO_CUPON(sCredito,sCampo1,sCampo2,sCampo3,sTipo:String);
begin
//calcula el plazo cupon
//     '        substr(PKGCRTAS.ObtenPerCredito(CC.ID_CREDITO,''IN'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I),1,1000) AS PLAZOCUPON, '+
   qFactor.Close;
   qFactor.SQL.Clear;
   if sTipo='AC' then
      qFactor.SQL.Text:=' SELECT PKGCRTAS.ObtenPerCredito('+
                        'trim('''+sCredito+'''), trim('''+sCampo1+'''),'+
                        'trim('''+sCampo2 +'''), trim('''+sCampo3+''')) FACT_AMORT '+
                        ' FROM DUAL '
   else
      qFactor.SQL.Text:=' SELECT PKGCRTAS.ObtenPerCreditoPAS('+
                        'trim('''+sCredito+'''), trim('''+sCampo1+'''),'+
                        'trim('''+sCampo2 +'''), trim('''+sCampo3+''')) FACT_AMORT '+
                        ' FROM DUAL ';
   qFactor.Open;
   ssPlazo:='';
   if not(qFactor.IsEmpty) then 
   begin ssPlazo:=qFactorFACT_AMORT.AsVariant;
   end;

//calcula el factor de amortización
//     '        substr(PKGCRTAS.ObtenFactor(NULL,CC.ID_CREDITO,''IN'',CAT.TOT_PERIODOS_K,CIT.TOT_PERIODOS_I),1,3000) AS FACTORAMORTIZA, '+
   qFactor.Close;
   qFactor.SQL.Clear;
   if sTipo='AC' then
      qFactor.SQL.Text:=' SELECT PKGCRTAS.ObtenFactor(NULL,'+
                        'trim('''+sCredito+'''), trim('''+sCampo1+'''),'+
                        'trim('''+sCampo2 +'''), trim('''+sCampo3+''')) FACT_AMORT '+
                        ' FROM DUAL '
   else
      qFactor.SQL.Text:=' SELECT PKGCRTAS.ObtenFactorPAS(NULL,'+
                        'trim('''+sCredito+'''), trim('''+sCampo1+'''),'+
                        'trim('''+sCampo2 +'''), trim('''+sCampo3+''')) FACT_AMORT '+
                        ' FROM DUAL ';
   qFactor.Open;     
   ssFactor:='';
   if not(qFactor.IsEmpty) then 
   begin ssFactor:=qFactorFACT_AMORT.AsVariant;
   end;
   qFactor.Close;
END;


//MARA4356 AGOSTO 2006 TERMINAN CAMBIOS

end.



