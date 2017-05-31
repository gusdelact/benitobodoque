//MIGRACION ORACLE8.
//-------------------------------------------------------------
// Sistema         :   Clase TASA  (TASA OPERATIVA, MERCADO Y TRASPASO)
// Fecha de Inicio :   ----
// Función forma   :   METODOS PARA OBTENER PARA LA TASA OPERATIVA, TASAS DE MERCADO Y HACER TRASPASOS
// Desarrollado por:   Fernando Aguilar.
// Modificado por  :   Manuel Romero Ibarra  Febrero de 1998
// Comentarios     :   NO HAY COMENTARIOS
// ------------------------------------------------------------

unit unttasa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, StdCtrls,
  unsql2,  dbtables, Math, Buttons, Printers, Interfun, InterApl, Db,
  quickrpt, IntHead, Qrctrls, UnCalFin;

type
  AMontos      = array[0..120] of Integer; //Arreglo para Montos
  APlazos      = array[0..120] of Integer; //Arreglo para Plazos

  TTasa = class(TComponent)
  private
    FApli:TInterApli;
    fCveTasaInd:      String;   //Clave de Tasa/Indicador.
    fFechaOpera:      TDateTime;//Fecha de Operacion.
    fPlazo:           Integer;  //Plazo a calcular.
    fMontoOpera:      Double;   //Monto de la Operacion.
    fMontoAsoc:       Double;   //Monto Asociado.
    fTasaMaximaOp:      Double;  //Tasa maxima calculada.
    fTasaOptimaOp:      Double;  //Tasa maxima Optima.
    fTasaMaximaAs:      Double;  //Tasa maxima calculada.
    fTasaOptimaAs:      Double;  //Tasa maxima Optima.
    VlContRecorri:   Integer;    //Cuenta cuantas veces se han recorrido las tasas
    //Variables de traspaso de indices (RIM)
    fFechaHoyTras:    TDate;   //Fecha de inicial de traspaso.
    fFecha24Hrs:      TDate;   //Fecha de 24 Hrs a traspaso.
    fTodosIndices:    Boolean; //Traspasar todos los indices o uno solo.
    fIndiceATras:     String; //Clave de Indice a traspasar.
    //Variables de la Tasa de Mercado  (RIM)
    VLFechaEvalua:    TDateTime;   //Fecha de evaluación de la Tasa de Mercado.
    VLFechaEvaluaF:   TDateTime;   //Fecha de evaluación final de la Tasa.
    VlValARec:        Integer;     //Numero de Valores a recorrer.
    VlFecPub:         TDateTime;   //Fecha de publicación.
    VLValVig:         Double;     //Valor vigente de tasa.
    VlFecIniMues:     TDateTime;   //Fecha de inicio de muestra.
    VlFecFinMues:     TDateTime;   //fecha de  fin de muestra.
    VlDireccion:      Boolean;     //Direccion True Adelante  // False Atrás
    VLNumAct:         Integer;     //Numero de actualizaciones;
    VlFuncion:        Integer;     //Numero de función a ocupar.

    //Variables del Query TASA_INDIC_FINAN
    TClave :          Tquery;
    fDescTasaIndic:   String;
    //Variables del query POSTURA_BASE
    TPostura:         Tquery;
    fFOperacion:      TDateTime;
    fHOperacion:      tDateTime;
    //Variables del query PARAM_TASA_OPER
    TParamTasa:       Tquery;
    fTipoCalcPostura: String;
    fBAgregaPostura:  String;
    fTipoCalcAgrega:  String;
    fFHUltimaPostura: TDateTime;
    fBTasaPasiva:     String;
    fCveMoneda:       String;
    fTipoTasaOp:      String;
    //Variables del query MONTO_POSTURA
    TMonto:           Tquery;
    //Variables del query PLAZO_POSTURA
    TPlazo:           Tquery;
    //Variables del query MONEDA
    TMoneda:          Tquery;
    fDescMoneda:      String;
    //Variable de validacion de seguridad
    FInterfun  : TInterfun;

    vtplazo    : Integer; //Indica el numero de columnas
    vtMonto    : Integer; //Indica el numero de renglones
    vbPlazo    : Integer; //Indica el numero de plazos base y complementarios
    vmPlazo    : Integer; //Indica el numero de plazos complementrios
    Amonto     : Integer; //Indica el monto base
    vsalta     : Integer; //contador para brincar las tasas complementarias
    renmonto   : Integer; //Indica el renglon del monto solicitado
    renplazo   : Integer; //Indica la columna del plazo solicitado
    posicion   : Integer; //Auxilia a la columna cuando es la primera o ultima
    posicmon   : Integer; //Auxilia a los renglones
    renglones  : Integer; //Indica el número de renglones a imprimir
    columnas   : Integer; //Indica el número de columnas a imprimir
    vmontotal  : Real;    //Es el monto asociado o el monto operativo
    Tasa1      : Real;    //Variables para el cálculo de tasas alambradas
    Tasa2      : Real;
    Expo1      : Real;
    Expo2      : Real;
    Tasa3      : Real;
    Tasa4      : Real;
    Tala1      : Real;
    Tala2      : Real;
    fvsNomTesor : string;
    fvNomEmpresa: string;
    VlMultMont:   Boolean;
   published
    property ClaveTasaInd: String    read fCveTasaInd  write fCveTasaInd;
    property FechaOpera:   TDateTime read fFechaOpera  write fFechaOpera;
    property Plazo:        Integer   read fPlazo       write fPlazo;
    property MontoOpera:   Double    read fMontoOpera  write fMontoOpera;
    property MontoAsoc:    Double    read fMontoAsoc   write fMontoAsoc;
    property TasaMaximaOp:   Double    read fTasaMaximaOp  write fTasaMaximaOp;
    property TasaOptimaOp:   Double    read fTasaOptimaOp  write fTasaOptimaOp;
    property TasaMaximaAs:   Double    read fTasaMaximaAs  write fTasaMaximaAs;
    property TasaOptimaAs:   Double    read fTasaOptimaAs  write fTasaOptimaAs;
//    property vsNomTesor:   String    read fvsNomTesor  write fvsNomTesor;
//    property vNomEmpresa:  String    read fvNomEmpresa write fvNomEmpresa;

    //propiedades de traspaso de indices

    property FechaHoyTras: TDate     read fFechaHoyTras write fFechaHoyTras;
    property Fecha24Hrs:   TDate     read fFecha24Hrs write fFecha24Hrs;
    property TodosIndices: Boolean   read fTodosIndices write fTodosIndices;
    property IndiceATras:  String    read fIndiceATras write fIndiceATras;

    //propiedades de tasa de mercado
    Property FechaEvaluacion: TDateTime read VlFechaEvalua write VlFechaEvalua;
    Property FechaEvaluacionFinal: TDateTime read VlFechaEvaluaF write VlFechaEvaluaF;
    Property ValoresARecorrer: Integer read VlValARec write VlValARec;
    Property FechaPublicacion: TDateTime read VlFecPub write VlFecPub; //F_INI_VIGENCIA
    Property ValorVigente: Double read VlValVig write VlValVig;
    Property FInicioMuestra: TDateTime read VlFecIniMues write VlFecIniMues;
    Property FFinMuestra: TDateTime read VlFecFinMues write VlFecFinMues;
    Property Direccion: Boolean read VlDireccion write VlDireccion;
    Property NumeroActuali: Integer read VlNumAct write VlNumAct;
    Property Funcion: Integer read VlFuncion write VlFuncion;
    Property Apli:TInterApli read FApli write FApli;

  public
    Constructor Create(Owner: TComponent); //Override;
    destructor Destroy; override;
    //procedimientos de tasa operativa
    Function GenMat: Integer;
    Function NewGenMat: Integer;
    procedure GeneraMatriz;
    Function TraspasoPostura24: Integer;
    Function CalcTasasOpe: Integer;
    //procedimientos de tasa de mercado
    Function UltimoValorAct: Integer;
    Function ValorActNFechas: Integer;
    Function NumeroActualiza: Integer;
  end;

  TfoMatriz = class(TForm)
    Panel2: TPanel;
    sgMatriz: TStringGrid;
    QRTASAS: TQuickRep;
    QRBand1: TQRBand;
    QRIE: TQRInterEncabezado;
    TActivaTasa: TTable;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRETP: TQRExpr;
    QREM: TQRExpr;
    QREFV: TQRExpr;
    QRETO: TQRExpr;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PreparaQR;
  private
    { Private declarations }
    PLineaPag    : Integer;
    PSpaciolin   : Integer;
    veces        : Integer;
    lineas       : Integer;
    PAnchoPag    : Integer;
    PSpacioCol   : Integer;
    x            : Integer;
    y            : Integer;
    Rect         : TRect;
    Expressions  : TQRExpr;
    Shapes       : TQRShape;
    VLNumPlazos  : Integer;                  //VARIABLES DE NUEVO ESQUEMA
    VLNumMontos  : Integer;                  //VARIABLES DE NUEVO ESQUEMA
    VAPlazos     : APlazos;                  //VARIABLES DE NUEVO ESQUEMA
    VAMontos     : AMontos;                  //VARIABLES DE NUEVO ESQUEMA
    public
    { Public declarations }
    cTasa      : Ttasa;
    procedure MuestraForma;
  end;

var
  foMatriz: TfoMatriz;
  VlError    : Integer;

implementation

{$R *.DFM}

//Declaracion de procedimientos de tasa de mercado
{******************************************************************************}
Function TTasa.UltimoValorAct: Integer;
var SPTMercado: TStoredProc;
begin
     UltimoValorAct:=99;
     try
        SPTMercado:=TStoredProc.Create(Nil);
        SPTMercado.DatabaseName:=FApli.DataBaseName;
        SPTMercado.SessionName:=FApli.SessionName;
        SPTMercado.StoredProcName:='STPTASVALACT';

        //MIGRACION ORACLE 8
        SPTMercado.Params.Clear;
        SPTMercado.Params.CreateParam( ftFloat,    'PE_FUNCION',   ptInput );
        SPTMercado.Params.CreateParam( ftString,   'PE_TASAINDIC', ptInput );
        SPTMercado.Params.CreateParam( ftDateTime, 'PE_FECEVAL',   ptInput );
        SPTMercado.Params.CreateParam( ftDateTime, 'PE_FECEVALF',  ptInput );
        SPTMercado.Params.CreateParam( ftFloat,    'PE_VALAREC',   ptInput );
        SPTMercado.Params.CreateParam( ftFloat,    'PE_DIRECCION', ptInput );
        SPTMercado.Params.CreateParam( ftDateTime, 'PS_FECPUBLIC', ptOutput);
        SPTMercado.Params.CreateParam( ftDateTime, 'PS_FECINIMUESTRA', ptOutput);
        SPTMercado.Params.CreateParam( ftDateTime, 'PS_FECFINMUESTRA', ptOutput);
        SPTMercado.Params.CreateParam( ftFloat,    'PS_VALVIGENTE',    ptOutput);
        SPTMercado.Params.CreateParam( ftFloat,    'PS_NACTUALI',      ptOutput);
        SPTMercado.Params.CreateParam( ftFloat,    'PS_RESULT',        ptOutput);
        //SPTMercado.Prepare;

        
        SPTMercado.ParamByName('PE_Funcion').AsInteger:=Funcion;
        SPTmercado.ParamByName('PE_TasaIndic').AsString:=ClaveTasaInd;
        SPTMercado.ExecProc;
        if SPTMercado.ParamByName('PS_RESULT').AsInteger=0 then
        begin
           FechaPublicacion:=SPTMercado.ParamByName('Ps_FecPublic').AsDateTime;
           FInicioMuestra:=SPTMercado.ParamByName('Ps_FecIniMuestra').AsDateTime;
           FFinMuestra:=SPTMercado.ParamByName('Ps_FecFinMuestra').AsDateTime;
           ValorVigente:=SPTMercado.ParamByName('Ps_ValVigente').AsFloat;
           UltimoValorAct:=0;
        end
        else
            begin
//           ShowMessage('ERROR: ' + IntToStr(SPTMercado.ParamByName('vlresi').AsInteger));
            end;
           UltimoValorAct:=SPTMercado.ParamByName('PS_RESULT').AsInteger;
      //endif
     finally
        SPTMercado.Free;
     end;
end;

{******************************************************************************}
Function TTasa.ValorActNFechas: Integer;
var SPTMercado: TStoredProc;
begin
     ValorActNFechas:=99;
     try
        SPTMercado:=TStoredProc.Create(Nil);
        SPTMercado.DatabaseName:=FApli.DataBaseName;
        SPTMercado.SessionName:=FApli.SessionName;
        SPTMercado.StoredProcName:='STPTASVALACT';

        //MIGRACION ORACLE 8
        SPTMercado.Params.Clear;
        SPTMercado.Params.CreateParam( ftFloat,    'PE_FUNCION',   ptInput );
        SPTMercado.Params.CreateParam( ftString,   'PE_TASAINDIC', ptInput );
        SPTMercado.Params.CreateParam( ftDateTime, 'PE_FECEVAL',   ptInput );
        SPTMercado.Params.CreateParam( ftDateTime, 'PE_FECEVALF',  ptInput );
        SPTMercado.Params.CreateParam( ftFloat,    'PE_VALAREC',   ptInput );
        SPTMercado.Params.CreateParam( ftFloat,    'PE_DIRECCION', ptInput );
        SPTMercado.Params.CreateParam( ftDateTime, 'PS_FECPUBLIC', ptOutput);
        SPTMercado.Params.CreateParam( ftDateTime, 'PS_FECINIMUESTRA', ptOutput);
        SPTMercado.Params.CreateParam( ftDateTime, 'PS_FECFINMUESTRA', ptOutput);
        SPTMercado.Params.CreateParam( ftFloat,    'PS_VALVIGENTE',    ptOutput);
        SPTMercado.Params.CreateParam( ftFloat,    'PS_NACTUALI',      ptOutput);
        SPTMercado.Params.CreateParam( ftFloat,    'PS_RESULT',        ptOutput);
        //SPTMercado.Prepare;

        SPTMercado.ParamByName('PE_Funcion').AsInteger:=Funcion;
        SPTmercado.ParamByName('PE_TasaIndic').AsString:=ClaveTasaInd;
        SPTmercado.ParamByName('PE_FecEval').AsDate:=FechaEvaluacion;
        SPTmercado.ParamByName('PE_ValARec').AsInteger:=ValoresARecorrer;
        if Direccion then
           SPTmercado.ParamByName('PE_Direccion').AsInteger:=1
        else
           SPTmercado.ParamByName('PE_Direccion').AsInteger:=2;
        SPTMercado.ExecProc;
        if SPTMercado.ParamByName('PS_RESULT').AsInteger=0 then
        begin
           FechaPublicacion:=SPTMercado.ParamByName('Ps_FecPublic').AsDateTime;
           FInicioMuestra:=SPTMercado.ParamByName('Ps_FecIniMuestra').AsDateTime;
           FFinMuestra:=SPTMercado.ParamByName('Ps_FecFinMuestra').AsDateTime;
           ValorVigente:=SPTMercado.ParamByName('Ps_ValVigente').AsFloat;
           ValorActNFechas:=0;
        end
        else
            begin
               //ShowMessage('ERROR: ' + IntToStr(SPTMercado.ParamByName('vlresi').AsInteger));
            end;
           ValorActNFechas:=SPTMercado.ParamByName('PS_RESULT').AsInteger;
      //endif
     finally
        SPTMercado.Free;
     end;
end;

{******************************************************************************}
Function TTasa.NumeroActualiza: Integer;
var SPTMercado: TStoredProc;
begin
     NumeroActualiza:=99;
     try
        SPTMercado:=TStoredProc.Create(Nil);
        SPTMercado.DatabaseName:=FApli.DataBaseName;
        SPTMercado.SessionName:=FApli.SessionName;
        SPTMercado.StoredProcName:='STPTASVALACT';

        //MIGRACION ORACLE 8
        SPTMercado.Params.Clear;
        SPTMercado.Params.CreateParam( ftFloat,    'PE_FUNCION',   ptInput );
        SPTMercado.Params.CreateParam( ftString,   'PE_TASAINDIC', ptInput );
        SPTMercado.Params.CreateParam( ftDateTime, 'PE_FECEVAL',   ptInput );
        SPTMercado.Params.CreateParam( ftDateTime, 'PE_FECEVALF',  ptInput );
        SPTMercado.Params.CreateParam( ftFloat,    'PE_VALAREC',   ptInput );
        SPTMercado.Params.CreateParam( ftFloat,    'PE_DIRECCION', ptInput );
        SPTMercado.Params.CreateParam( ftDateTime, 'PS_FECPUBLIC', ptOutput);
        SPTMercado.Params.CreateParam( ftDateTime, 'PS_FECINIMUESTRA', ptOutput);
        SPTMercado.Params.CreateParam( ftDateTime, 'PS_FECFINMUESTRA', ptOutput);
        SPTMercado.Params.CreateParam( ftFloat,    'PS_VALVIGENTE',    ptOutput);
        SPTMercado.Params.CreateParam( ftFloat,    'PS_NACTUALI',      ptOutput);
        SPTMercado.Params.CreateParam( ftFloat,    'PS_RESULT',        ptOutput);
        //SPTMercado.Prepare;
        

        SPTMercado.ParamByName('PE_Funcion').AsInteger:=Funcion;
        SPTmercado.ParamByName('PE_TasaIndic').AsString:=ClaveTasaInd;
        SPTmercado.ParamByName('PE_FecEval').AsDate:=FechaEvaluacion;
        SPTmercado.ParamByName('PE_FecEvalF').AsDate:=FechaEvaluacionFinal;
        SPTMercado.ExecProc;
        if SPTMercado.ParamByName('PS_RESULT').AsInteger=0 then
        begin
           NumeroActuali:=SPTMercado.ParamByName('Ps_NActuali').AsInteger;
           NumeroActualiza:=0;
        end
        else
            begin
              //ShowMessage('ERROR: ' + IntToStr(SPTMercado.ParamByName('vlresi').AsInteger));
            end;
           NumeroActualiza:=SPTMercado.ParamByName('PS_RESULT').AsInteger;
      //endif
     finally
        SPTMercado.Free;
     end;
end;

//Declaración de procedimientos de tasa operativas
{******************************************************************************}
Function TTasa.TraspasoPostura24: Integer;
var  SPTraspost                   : TStoredProc;
     VariabledSalida              : Double;
 begin
     try
        SPTraspost:=TStoredProc.Create(Nil);
        SPTraspost.DatabaseName:=FApli.DataBaseName;
        SPTraspost.SessionName:=FApli.SessionName;
        SPTraspost.StoredProcName:='STPTRASPOST';
        SPTraspost.Params.CreateParam(ftDatetime,'PEFechaHoy',ptinput);
        SPTraspost.Params.CreateParam(ftDatetime,'PEFecha24',ptinput);
        SPTraspost.Params.CreateParam(ftfloat,'PEMetodo',ptinput);
        SPTraspost.Params.CreateParam(ftString,'PECVEIndicador',ptinput);
        SPTraspost.Params.CreateParam(ftfloat,'PSRespuesta',ptOutput);
        SPTraspost.Prepare;
        SPTraspost.ParamByName('PEFechaHoy').AsDate:=FechaHoyTras;
        SPTraspost.ParamByName('PEFecha24').AsDate:=Fecha24Hrs;
        if Not(TodosIndices) then
        begin
             SPTraspost.ParamByName('PEMetodo').AsFloat:=2;
             SPTraspost.ParamByName('PECVEIndicador').AsString:=IndiceATras;
        end
        else
        begin
             SPTraspost.ParamByName('PEMetodo').AsFloat:=1;
        end;
        SPTraspost.ExecProc;
        //      Codigo de prueba para salida de stored procedure
         VariabledSalida:= SPTraspost.ParamByName('PSRespuesta').AsFloat;
         if SPTraspost.ParamByName('PSRespuesta').AsFloat<>0 then
        begin
//             Showmessage('ERROR  NO:'+FloatToStr( SPTraspost.ParamByName('PS_sp_resp').AsFloat));
//             Showmessage('LA FECHA DE HOY ES'+ SPTraspost.ParamByName('ps_fechahoy').AsString);
           if trunc(VariabledSalida)= 97 then
              showmessage('ERROR EN POSTURAS')
           else if trunc(VariabledSalida)= 95 then
              showmessage('ERROR EN INDICADOR')
           else if trunc(VariabledSalida)= 94 then
              showmessage('ERROR EN METODO')
           else if trunc(VariabledSalida)= 93 then
              showmessage('ERROR EN FECHAS')
           else if trunc(VariabledSalida)= 92 then
              showmessage('FECHA HOY CON VALOR NULO')
           else if trunc(VariabledSalida)= 91 then
              showmessage('FECHA 24 HRS CON VALOR NULO')
           else
           begin
                showmessage('ERROR NO DESCRITO'+IntToStr(Trunc(VariabledSalida)));
           end;
        end;
        TraspasoPostura24:= TRUNC(VariabledSalida);
     finally
        SPTraspost.unprepare;
        SPTraspost.Close;
        SPTraspost.Free;
     end;
end;

{******************************************************************************}
Function TTasa.CalcTasasOpe: Integer;
var  SPCalcTasas                  : TStoredProc;
     VariabledSalida              : Double;
 begin
     try
        SPCalcTasas:=TStoredProc.Create(Nil);
        SPCalcTasas.DatabaseName:=FApli.DataBaseName;
        SPCalcTasas.SessionName:=FApli.SessionName;
        SPCalcTasas.StoredProcName:='STPCALCTASAS';
        SPCalcTasas.Params.CreateParam(ftString,'PE_CVE_TASA_INDIC',ptinput);
        SPCalcTasas.Params.CreateParam(ftDatetime,'PE_FECHA_OPERACION',ptinput);
        SPCalcTasas.Params.CreateParam(ftfloat,'PE_PLAZO',ptinput);
        SPCalcTasas.Params.CreateParam(ftfloat,'PE_MTO_OPERACION',ptinput);
        SPCalcTasas.Params.CreateParam(ftfloat,'PS_TASA_MAX_OPE',ptOutput);
        SPCalcTasas.Params.CreateParam(ftfloat,'PS_TASA_OPT_OPE',ptOutput);
        SPCalcTasas.Params.CreateParam(ftfloat,'PS_RESULTADO',ptOutput);
        SPCalcTasas.Prepare;
        SPCalcTasas.ParamByName('PE_CVE_TASA_INDIC').AsString:=ClaveTasaInd;
        SPCalcTasas.ParamByName('PE_FECHA_OPERACION').AsDateTime:=FechaOpera;
        SPCalcTasas.ParamByName('PE_PLAZO').AsFloat:=Plazo;
        SPCalcTasas.ParamByName('PE_MTO_OPERACION').AsFloat:=MontoOpera;
        SPCalcTasas.ExecProc;
        //      Codigo de prueba para salida de stored procedure
        VariabledSalida:= SPCalcTasas.ParamByName('PS_RESULTADO').AsFloat;
        if SPCalcTasas.ParamByName('PS_RESULTADO').AsFloat<>0 then
        begin
           if trunc(VariabledSalida)= 99 then
              showmessage('ERROR, NO SE CUENTA CON CLAVE DE TASA INDICADORA')
           else if trunc(VariabledSalida)= 98 then
              showmessage('ERROR, NO SE CUENTA CON FECHA DE OPERACION')
           else if trunc(VariabledSalida)= 97 then
              showmessage('ERROR, NO SE CUENTA CON PLAZO DE OPERACION')
           else if trunc(VariabledSalida)= 96 then
              showmessage('ERROR, NO SE CUENTA CON LOS MONTOS DE OPERACION Y ASOCIADO')
           else if trunc(VariabledSalida)= 95 then
              showmessage('ERROR, NO SE ENCUENTRA LA POSTURA EN LA TABLA POSTURA BASE')
           else if trunc(VariabledSalida)= 94 then
              showmessage('ERROR, NO SE ENCUENTRA LA POSTURA EN LA TABLA PARAM TASA OPER')
           else if trunc(VariabledSalida)= 93 then
              showmessage('NO SE ADMITEN POSTURAS AGREGADAS')
           else showmessage('ERROR NO DESCRITO')
        end
        else
        begin
             TasaMaximaOp:=SPCalcTasas.ParamByName('PS_TASA_MAX_OPE').AsFloat;
             TasaOptimaOP:=SPCalcTasas.ParamByName('PS_TASA_OPT_OPE').AsFloat;
        end;
        CalcTasasOpe:= TRUNC(VariabledSalida);
     finally
        SPCalcTasas.unprepare;
        SPCalcTasas.Close;
        SPCalcTasas.Free;
     end;
end;

{******************************************************************************}
constructor TTasa.Create(Owner: TComponent);
begin
   inherited Create(Owner);
   ShortdateFormat := 'd/mm/yyyy';
   finterfun:=Tinterfun.create(nil);
   ValoresARecorrer:=0;
   Direccion:=True;
   FApli:=nil;
end;

{******************************************************************************}
destructor TTasa.Destroy;
begin
     inherited;
end;

{******************************************************************************}
Function TTasa.GenMat: Integer;
begin
     GeneraMatriz;
     GenMat := 0;
end;

{******************************************************************************}

function TTasa.NewGenMat:Integer;
begin
     GeneraMatriz;
     NewGenMat := 0;
end;

{******************************************************************************}
procedure TTasa.GeneraMatriz;
begin
     foMatriz := TfoMatriz.Create(nil);
     foMatriz.TActivaTasa.DatabaseName:=FApli.DataBaseName;   //parámetros de qreport
     foMatriz.TActivaTasa.SessionName:=FApli.SessionName;     //parámetros de qreport
     foMatriz.QRIE.Apli:=FApli;                               //parámetros de qreport
     foMatriz.cTasa:=self;
     foMatriz.MuestraForma;
     foMatriz.free;
end;

{******************************************************************************}
procedure TfoMatriz.MuestraForma;
var
     QDatTasas    : TQuery;
     QPlazos      : TQuery;
     QMontos      : TQuery;
     VLFOperacion : TDate;
     VLHOperacion : Integer;
     VLPlazoAnt   : Integer;
     VLMontoAnt   : Integer;
begin
     QDatTasas := GetSqlQuery('SELECT F_OPERACION,H_OPERACION,DESC_TASA_INDIC,TIPO_TASA_OP'  +
                         ' FROM POSTURA_BASE,TASA_INDIC_FINAN,PARAM_TASA_OPER'   +
                         ' WHERE (SIT_POSTURA_BASE = ' + #39 + 'AC' + #39 + ' AND' +
                         ' POSTURA_BASE.CVE_TASA_INDICAD = ' + #39 + cTasa.ClaveTasaInd + #39 + ' AND'+
                         ' TASA_INDIC_FINAN.CVE_TASA_INDICAD = POSTURA_BASE.CVE_TASA_INDICAD AND '+
                         ' PARAM_TASA_OPER.CVE_TASA_INDICAD = POSTURA_BASE.CVE_TASA_INDICAD )',
                         cTasa.Apli.DataBaseName,cTasa.Apli.SessionName,True);
     Try
          if QDatTasas <> nil then
          begin
               QDatTasas.First;
               VLFOperacion := QDatTasas.FieldByname('F_OPERACION').AsDateTime;
               cTasa.fFHUltimaPostura := QDatTasas.FieldByname('F_OPERACION').AsDateTime;
               VLHOperacion := QDatTasas.FieldByname('H_OPERACION').AsInteger;
               cTasa.fDescTasaIndic := QDatTasas.FieldByName('DESC_TASA_INDIC').AsString;
               cTasa.fTipoTasaOp := QDatTasas.FieldByName('TIPO_TASA_OP').AsString;
          end
          else
              ShowMessage('Error al generar la Matriz');
          //end if
     Finally
          QDatTasas.Free;
     end;
     QMontos := GetSqlQuery('SELECT IMP_OPERACION'  +
                         ' FROM MONTO_POSTURA'   +
                         ' WHERE (CVE_TASA_INDICAD = ' + #39 + cTasa.ClaveTasaInd + #39 + ') AND' +
                         ' (F_OPERACION = TO_DATE(' + #39 +  DateToStr(VLFOperacion) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')) AND' +
                         ' (H_OPERACION = ' + #39 + IntToStr(VLHOperacion) + #39 + ') ORDER BY IMP_OPERACION',
                         cTasa.Apli.DataBaseName,cTasa.Apli.SessionName,True);
     Try
          if QMontos <> nil then
          begin
               QMontos.First;
               VLNumMontos := 1;
               VLMontoAnt := 0;
               //MIENTRAS NO SEA FIN DE ARCHIVO O SALIR
               while Not(QMontos.EOF) do
               begin
                    if  VLMontoAnt <> QMontos.FieldByname('IMP_OPERACION').AsInteger then
                    begin
                         VAMontos[VLNumMontos] := QMontos.FieldByname('IMP_OPERACION').AsInteger;
                         VLMontoAnt := QMontos.FieldByname('IMP_OPERACION').AsInteger;
                         VLNumMontos := VLNumMontos + 1;
                    end;
                    QMontos.Next;
               end;
          end
          else
              ShowMessage('Error al generar la Matriz');
          //end if
     Finally
          QMontos.Free;
     end;
     QPLazos := GetSqlQuery('SELECT PLAZO'  +
                         ' FROM PLAZO_POSTURA'   +
                         ' WHERE (CVE_TASA_INDICAD = ' + #39 + cTasa.ClaveTasaInd + #39 + ') AND' +
                         ' (F_OPERACION = TO_DATE(' + #39 +  DateToStr(VLFOperacion) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')) AND' +
                         ' (H_OPERACION = ' + #39 + IntToStr(VLHOperacion) + #39 + ') ORDER BY PLAZO',
                         cTasa.Apli.DataBaseName,cTasa.Apli.SessionName,True);
     Try
          if QPLazos <> nil then
          begin
               QPLazos.First;
               VLNumPlazos := 1;
               VLPlazoAnt := 0;
               //MIENTRAS NO SEA FIN DE ARCHIVO O SALIR
               while Not(QPLazos.EOF) do
               begin
                    if VLPlazoAnt <> QPLazos.FieldByname('PLAZO').AsInteger then
                    begin
                         VAPlazos[VLNumPlazos] := QPLazos.FieldByname('PLAZO').AsInteger;
                         VLPlazoAnt := QPLazos.FieldByname('PLAZO').AsInteger;
                         VLNumPlazos := VLNumPlazos + 1;
                    end;
                    QPLazos.Next;
               end;
          end
          else
              ShowMessage('Error al generar la Matriz');
          //end if
     Finally
          QPLazos.Free;
     end;

     foMatriz.PreparaQR
end;
{******************************************************************************}
Procedure TfoMatriz.PreparaQR;
var  SPCalcTasas                  : TStoredProc;
type
  ArrayShapes=array[0..120] of TQRShape;
  ArrayExpres=array[0..120] of TQRLabel;
var
  VlRenY, VlColX            :Integer;    //Posicion  de los componentes en "x" y "y".
  VlConShapes               :Integer;    //Contador de Shapes para crearlos en forma dinámica
  VlConExpres               :Integer;    //Contador de Expres para crearlos en forma dinámica
  AExpres                   :ArrayExpres;//arreglo de Expres
  AShapes                   :ArrayShapes;//Arreglo de shapes
  LandOrient                :Boolean;    //Orientacion de la hoja
  VlTamayoRen               :Integer;    //Tamaño de la matriz con todas sus columnas. Para sumar en caso de nuevo renglon
  VlTamayoCol               :Integer;    //Tamaño de la matriz con todos sus renglones. Para sumar en caso de nuevo renglon
  VlNumBloq                 :Integer;    //Almacena el numero de bloques  que son generados en una hoja

  begin
     //Inicia variables
     VlConShapes:=1;
     VlConExpres:=1;
     VlTamayoRen:=0;
     VlTamayoCol:=0;
     VlNumBloq:=1;

     //Asigna titulos a algunos Expressions
     QRETP.Expression:='Tipo de Postura : '+cTasa.fDescTasaIndic;
     QREM.Expression:='F. Vigencia : '+formatdatetime('DD/MM/YYYY',cTasa.fFHUltimaPostura);
     QREFV.Expression:='';//'Moneda : '+cTasa.fDescMoneda;
     if  cTasa.fTipoTasaOp='BRTA' then
         QRETO.Expression:='Tipo de Tasa : Tasa Bruta'
     else if cTasa.fTipoTasaOp='NETA' then
         QRETO.Expression:='Tipo de Tasa : Tasa Neta'
     else if cTasa.fTipoTasaOp='REAL' then
         QRETO.Expression:='Tipo de Tasa : Tasa Bruta';
     //end if

     //Da el formato de la hoja en base a la cantidad de columnas que exista en la matriz
     if sgMatriz.ColCount>6 then
     begin
        QRTASAS.Page.Orientation:=poLandscape;
        LandOrient:=True;
     end
     else
     begin
        QRTASAS.Page.Orientation:=poPortrait;
        LandOrient:=False;
     end;

     //Dibuja la matriz con las tasas correspondientes
     for VlrenY:=1 to VLNumMontos do              //el cinco es separado
     begin
          for VlColX:=2 to VLNumPlazos do      //el cinco es separado
          begin
               //Genera  en forma dinámica los componentes TQShape y TQRLabel en el array correspondiente
               AShapes[VlConShapes]:=TQRShape.Create(SELF);
               AShapes[VlConShapes].Parent:=QRETP.Parent;
               AExpres[VlConExpres]:=TQRLabel.Create(SELF);
               AExpres[VlConExpres].Parent:=QRETP.Parent;

               //En base a el numero de renglone define la cantidad a sumar a un nuevo bloque
               case VlColX of
                   2 : begin
                               VlTamayoRen:=0;
                               VlTamayoCol:=0;
                       end;
                  10 : begin
                               VlTamayoRen:=648;
                               VlTamayoCol:=(sgMatriz.RowCount*25)+25;
                               VlNumBloq:=2;
                       end;
                  18 : begin
                               VlTamayoRen:=VlTamayoRen*2;
                               VlTamayoCol:=VlTamayoCol*2;
                               VlNumBloq:=3;
                       end;
                  27 : begin
                               VlTamayoRen:=VlTamayoRen+VlTamayoRen;
                               VlTamayoCol:=VlTamayoCol+VlTamayoCol;
                               VlNumBloq:=4;
                       end;
               end;  //case

               //Asignan propiedades a los componentes Shapes y Expressions
               AShapes[VlConShapes].Height:=25;          //ancho
               AShapes[VlConShapes].Width:=81;           //largo
               AShapes[VlConShapes].Left:=88+(VlColX*81)-VlTamayoRen;    //derecha
               AShapes[VlConShapes].Top:=221+(VlRenY*25)+VlTamayoCol;    //alto

               AExpres[VlConExpres].Height:=17;          //ancho
               AExpres[VlConExpres].Width:=47;           //largo
               AExpres[VlConExpres].Left:=104+(VlColX*81)-VlTamayoRen;    //derecha
               AExpres[VlConExpres].Top:=227+(VlRenY*25)+VlTamayoCol;    //alto

               AExpres[VlConExpres].Alignment:=taCenter;
               AExpres[VlConExpres].Font.Charset:=ANSI_CHARSET;
               AExpres[VlConExpres].Font.Height:=-11;
               AExpres[VlConExpres].Font.name:='Times new Roman';
               try
                    SPCalcTasas:=TStoredProc.Create(Nil);
                    SPCalcTasas.DatabaseName:=cTasa.apli.DataBaseName;
                    SPCalcTasas.SessionName:=cTasa.Apli.SessionName;
                    SPCalcTasas.StoredProcName:='STPCALCTASAS';
                    SPCalcTasas.Params.CreateParam(ftString,'PE_CVE_TASA_INDIC',ptinput);
                    SPCalcTasas.Params.CreateParam(ftDatetime,'PE_FECHA_OPERACION',ptinput);
                    SPCalcTasas.Params.CreateParam(ftfloat,'PE_PLAZO',ptinput);
                    SPCalcTasas.Params.CreateParam(ftfloat,'PE_MTO_OPERACION',ptinput);
                    SPCalcTasas.Params.CreateParam(ftfloat,'PS_TASA_MAX_OPE',ptOutput);
                    SPCalcTasas.Params.CreateParam(ftfloat,'PS_TASA_OPT_OPE',ptOutput);
                    SPCalcTasas.Params.CreateParam(ftfloat,'PS_RESULTADO',ptOutput);
                    SPCalcTasas.Prepare;
                    SPCalcTasas.ParamByName('PE_CVE_TASA_INDIC').AsString:=cTasa.ClaveTasaInd;
                    SPCalcTasas.ParamByName('PE_FECHA_OPERACION').AsDateTime:=cTasa.FechaOpera;
                    SPCalcTasas.ParamByName('PE_PLAZO').AsFloat:=(VAPlazos[VlColX-1]);
                    SPCalcTasas.ParamByName('PE_MTO_OPERACION').AsFloat:=(VAMontos[VlrenY-1]);
                    SPCalcTasas.ExecProc;
                    //      Codigo de prueba para salida de stored procedure
                    if SPCalcTasas.ParamByName('PS_RESULTADO').AsFloat<>0 then
                    begin
                         AExpres[VlConExpres].caption:='0';
                    end
                    else
                    begin
                         AExpres[VlConExpres].caption:=SPCalcTasas.ParamByName('PS_TASA_MAX_OPE').AsString;
                    end;
               finally
                      SPCalcTasas.unprepare;
                      SPCalcTasas.Close;
                      SPCalcTasas.Free;
               end;
               if (VlRenY=1) then
               begin
                    AShapes[VlConShapes].Brush.color:=clYellow;
                    AExpres[VlConExpres].Color:=clYellow;
                    AExpres[VlConExpres].Font.name:='Arial';
                    AExpres[VlConExpres].Font.Height:=-12;
                    AExpres[VlConExpres].caption:=IntToStr(VAPlazos[VlColX-1]);
               end;
               VlConShapes:=VlConShapes+1;
               VlConExpres:=VlConExpres+1;
          end;
     end;

     //Pinta los montos a la derecha del grid
     for VlColX:=1 to VlNumBloq do
     begin
           //En base a el numero de renglone define la cantidad a sumar a un nuevo bloque
          case VlColX of
               1 : VlTamayoCol:=0;
               2 : VlTamayoCol:=((VLNumPlazos)*25)+25;     //el cinco es separado
               3 : VlTamayoCol:=VlTamayoCol*2;
               4 : VlTamayoCol:=VlTamayoCol+VlTamayoCol;
          end;  //case
          for VlrenY:=1 to VLNumMontos do   //el cinco es separado
          begin
               //Genera  en forma dinámica los componentes TQShape y TQRLabel en el array correspondiente
               AShapes[VlConShapes]:=TQRShape.Create(SELF);
               AShapes[VlConShapes].Parent:=QRETP.Parent;
               AExpres[VlConExpres]:=TQRLabel.Create(SELF);
               AExpres[VlConExpres].Parent:=QRETP.Parent;

               //Asignan propiedades a los componentes Shapes y Expressions
               AShapes[VlConShapes].Height:=25;          //ancho
               AShapes[VlConShapes].Width:=81;           //largo
               AShapes[VlConShapes].Left:=169;           //derecha
               AShapes[VlConShapes].Top:=221+(VlRenY*25)+VlTamayoCol;    //alto

               AExpres[VlConExpres].Height:=17;          //ancho
               AExpres[VlConExpres].Width:=47;           //largo
               AExpres[VlConExpres].Left:=210;           //derecha
               AExpres[VlConExpres].Top:=227+(VlRenY*25)+VlTamayoCol;    //alto

               AShapes[VlConShapes].Brush.color:=clYellow;
               AExpres[VlConExpres].Color:=clYellow;
               AExpres[VlConExpres].Font.name:='Arial';
               AExpres[VlConExpres].Font.Height:=-12;
               AExpres[VlConExpres].Alignment:=taCenter;
               AExpres[VlConExpres].Font.Charset:=ANSI_CHARSET;
               AExpres[VlConExpres].Font.name:='Times new Roman';
               if ((VlrenY = 1) and (VlcolX = 1)) then
                   AExpres[VlConExpres].caption:=''
               else
                  AExpres[VlConExpres].caption:='$'+IntToStr(VAMontos[VlrenY-1]);
               //end if
               VlConShapes:=VlConShapes+1;
               VlConExpres:=VlConExpres+1;
          end;
     end;

     //Preiew del QReport
     QRTASAS.Preview;

     //libero los de memoria los componentes creados
     for VlColX:=1 to VlConExpres-1 do
     begin
          AShapes[VlColX].Free;
          AExpres[VlColX].Free;
     end;
end;
{******************************************************************************}
procedure TfoMatriz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

end.
