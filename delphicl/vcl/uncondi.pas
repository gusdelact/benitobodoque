unit UnConDI;

//------------------------------------------------------------------------------
//* Sistema     : Sistema de Divisas
//* Descripción : Constantes y funciones comunes en el sistema.
//* Fecha       : Agosto de 1998.
//* Desarrollo  : Marcos Zárate Castro.
//------------------------------------------------------------------------------
//* Modificaciones:  Erika Franco 28Jun2006
//*                  Se crea nueva funcion para obtener las firmas de acuerdo con la configuracion del usuario
//*                  en Central de Cambios y no de la tabla Empleado columna ID_ENTIDAD
//*                  Erika Franco 4Jul2006
//*                  Se incluye la busqueda por usuario que captura la operacion o usuario que la autoriza
//*                  de acuerdo con el parametro IGUSRCAP

//                 : Javier Amado EIB2AARJ : 30 NOV Se modificaron los queries que recuperan los datos del sellado
//                   electronico, estos queries se pasan como parametro a los reportes de la facturas.

interface
Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterApl, UnSQL2, Printers,
  IntFrm, IntMesaBloq, UnGene, IniFiles, IntUsuario, UnQrComDiv, UnQrComDiv2,
  NMsmtp,UnFunGenCaja,IntUsuvent,IntBilletes, IntDiSelInven,
InterFun,
InterFor,
ComCtrls,
IntFind,IntLinkit,
UnQrComDiCli7, //MOAA4820 COMPROBANTE CLIENTE 7 

IntDtPk, Grids, Aligrid, IntSGCtrl, Winsock;


Type
   TTipoImpresora = (cFacturaLaser, cFacturaMatriz);

Const
    cVerdad     =         'V';      //Verdadero
    cFalso      =         'F';      //Falso
    cCompra     =         'C';      //Compra
    cVenta      =         'V';      //Venta
    cComision   =         'CO';     //Producto Comisión
    cIVA        =         'IV';     //Producto IVA
    cMonPeso    =         '484';    //Moneda de Peso Mexicano
    cMonDolar   =         '840';    //Moneda de Dolar Americano
    cMonEuro    =         '26';     //Moneda del EURO
    cActivo     =         'AC';     //Situación Activa
    cInactivo   =         'IN';     //Situación Inactiva
    cInactAut   =         'II';     //Situación Inactiva de una solicitus automática.
    cCancelado  =         'CA';     //Cancelado
    cAutorizado =         'AU';     //Autorizado
    cAutorizAut =         'AT';     //Autorización Automática de una solicitud
    cMismoDia   =         'D000';   //Día de liquidación Mismo día
    cDia24H     =         'D001';   //Día de liquidación 24 Horas
    cDia48H     =         'D002';   //Día de liquidación 48 Horas
    cPromCCDef  =         '218';    //Promotor Sugerido Central de Cambios
    cPromMTDef  =         '35376';  //Promotor Sugerido Metales
    cEmpresaCC  =         7;        //Empresa de Central de Cambios
    cEmpresaBco =         '2';      //Empresa Banco
    cIndAdicGen =         '0';      //Indicador adicional general
    cClienteCC  =         '7';      //Cliente de Central de Cambios
    cNoAplica   =         'N';      //No aplica
    cIdParaDI   =         '01';     //Id de Parámetros de Divisas
    cIncrementa =         'I';      //Incrementa
    cTerminaBien=         '00';     //Temina bien la transacción
    cSpeua       =        'SPEUA';
    cTransfer    =        'TRFER';
    cGiro        =        'GIRO';
    cChqICB      =        'CHICB';
    cChqBCO      =        'CHBCO';
    cMonterrey   =        'ESNL';
    cPuebla      =        'ESPUEB';
    cMexico      =        'ESDF';
    cUsuMty      =        'GARY354'; //Usuario de Monterrey Tesorería
    cUsuPue      =        'TOBE189'; //Usuario de Puebla Tesorería
    cProcInvTRV  =        'PRINVTRV';//Procesa Inventario de Travelers Cheques AMEXCO
    cProdEfvo    =        'EFE';     //Producto EFECTIVO
    cTellerID    =        '1000';
    cAccBalance  =        '0';
    cPayMethod   =        'C';
    cProducTRV   =        'TC';
    cProducTRVEu =        'TCEU';    //Producto Traveler Cheque EUROS
    cServSwitch  =         'O';
    cCustomType  =         'N';
    cSaleType    =         'N';
    cSaleCurrUSD =        'USD';
    cPaymCurrUSD =        'USD';
    cSaleCurrEUR =        'EUR';
    cPaymCurrEUR =        'EUR';
    cCteAreaInt  =        '32649';   //Cliente de Area Internacional
    cCheqRecNtaOf=        'DCO';     //Clave de liquidación : Cheque recibido en nuestras oficinas DCO
    cTrasLinBan  =        'RALT';    //Clave de liquidación : Traspaso por linea bancaria   RALB
    cCheqEntNtaOf=        'CHOF';    //Clave de liquidación : Cheque entregado en nuestras oficinas  CHOF
    cRetDeposCh  =        'RACT';    //Retiro para depósito en cuenta
    cNoProcesado =        'NP';      //Situación de cheque ICB : No procesado
    cEfectuado   =        'VV';      //Situación de cheque ICB : Efectuado
    cManual      =        'MN';      //Situación de cheque ICB : Manual
    cNoConsiderar=        'NL';      //Situación de cheque ICB : No Condiderar
    cPendiente   =        'PE';      //Situación de cheque ICB : Pendiente
    cCorreccion  =        'CO';      //Situación de cheque ICB : Corrección
    cNoLiquidar  =        'NO';      //Situación de cheque ICB : No Liquidar
    cManualConf  =        'MC';      //Situación de cheque ICB : Manual Confiamado
    cCtaBcoInter =        '100017508';
    cNomTitBcoInter=      'BANCO INTERACCIONES S.A.';
    cIdGpoAccSucBco=      '149';     //Id de grupo de acceso (Perfil) de sucursal Bancaria
                                     //(Operación Banco)
    cIdGpoAccCtoBco=      '115';     //Id de grupo de acceso (Perfil) de sucursal Bancaria
                                     //(Contratos Sucursal BINT)
    cImprDivisas   =      'LPT1';    //Impresora de Divisas (Directo al puerto LPT1)
    cExcCteSD =	          'CTESDO'; //DOCUEMNTOS DE TESORERIA FASE 2 DIVISAS mara feb 2005
    cTpProducto =         'CAME';   //TIPO DE PRODUCTO FASE 2 DIVISAS mara feb 2005
    cSitDoctos =	  'CO';     //LA SITUACION DE LOS DOCUMENTOS DEBE SER "COMPLETO" FASE 2 DIVISAS mara feb 2005
    cEmpresaCBI =         1;    //Empresa Casa de bolsa Interacciones fase  2 divisas mara feb 2005
    cValidaDatos =        'VALDOC'; //VALIDA DOCUMENTOS FASE 2 DIVISAS MARA FEB 2005
    cPromotAdm  =         128; //perfil del promotor que puede ver todas las operaciones en la pantalla de consulta
    cBOFA =               'BOFA'; //Clave para la captura de información adicional par aoperaciones BOFA MARA feb 2005
//    cCBWB =               'CBWB';
    cSPEI =               'SPEI'; //Clave para la captura de información adicional para operaciones SPEI MARA feb 2005
    cSPID =               'SPID'; //Clave para la captura de información adicional para operaciones SPID pacv 062016
    cCCAMB =              'CCAMB'; //Clave para la captura de información adicional para operaciones SPEI MARA feb 2005
    cEntDomC=             'CHCT'; // Cheque entregado en el domicilio del cliente MARA FASE 2 MARZO 2005
    cCveParamBloq=        'OBTCREUTER';// CLAVE DE LOS TIPOS DE CAMBIO QUE SE PUEDEN BLOQUEAR SACC03032005
    coTIEMPO =            'TIEMPO'; //clave con la que se obtiene el tiempo en milisegundos para TIpos de cambios FASE 2 MARA MARZO 2005
    coIncremento =        0.0010; //incremento para el tipo de comrpra y de venta
    coLIMITE =            'LIMCAM'; //Monto  de la operación
    coAutorizacion  =     'AU';  // Para permiso de autorización de operaciones en MESA DE CAMBIOS y MESA DE CONTROL tabla SECU_OPER_ACC
    coCancelacion   =     'CA';  // Para permiso de cancelar operaciones en MESA DE CAMBIOS y MESA DE CONTROL en tabla SECU_OPER_ACC
    cUCMC           =     'MC'; // Constante que define a Mesa de Cambios para la actualización de la bitacora de operaciones
    cUCMT           =     'MT';// Constante que define a Mesa de Control para la actualización de la bitacora de operaciones
    cDebit          =     '62908-25588'; //se usa para bofa mara 12 abr 2005
    cNomBco         =     'BANCO INTERACCIONES, S.A.'; //se usa para bofa mara 12 abr 2005
    cUCTE           =     'TE'; //UNIDAD DE CAMBIO TESORERIA
    cSIAC           =     'SIAC'; //SIAC
    cVB             =     'VB'; // VENTANILLA BANCARIA
    cPR             =     'PR'; //PROMOTORES
    cACLME          =     'ACLME';//CUANTAS ACLME  SACC
    cCLABE          =     'CLABE'; //CUENTA CLABE
    cTPPAGOSPEI     =     'PAGOSPEI'; //para buscar los tipos de pagos en TIPO_PAGO para la captura de SPEI
    cTPPAGOSPID     =     'PAGOSPID'; //para buscar los tipos de pagos en TIPO_PAGO para la captura de SPID pacv 02062016

    { Paraámetros de Configuración }
    cMESA_LIQ_72     = 'MESA_LIQ72';  //Tipos de Mesa que pueden liquidacr operaciones 72hrs.
    cPROD_LIQ_72     = 'PROD_LIQ72';  //Productos que se pueden operar con liquidación 72hrs
    cPRD_CPA_LIQ72_C = 'CP_LIQ72_C';  //Productos contravalor para compras con liquidación 72hrs
    cPRD_CPA_LIQ72_V = 'CP_LIQ72_V';  //Productos contravalor para ventas con liquidación 72hrs


    //mesa de cambios
    cPM ='PM'; cPMD='Pendiente de Autorizar';//CONTRATO PENDIENTE DE AUTORIZAR POR MESA DE CAMBIOS
    cAM ='AM'; cAMD='Autorizada';//CONTRATO AUTORIZADO POR MESA DE CAMBIOS
    cCM ='CM'; cCMD='Cancelada';//CONTRATO CANCELADO POR MESA DE CAMBIOS
    cPP ='PP'; cPPD='Pendiente de Cancelar'; //CONTRATO PENDIENTE DE CANDELAR, MARCADO POR EL PROMOTOR
    cAP ='AP'; cAPD='Pend. de Autorizar del Promotor';//PENDE DE AUTORIZAR , FUE AUTORIZADO PRO EL PROMOTOR

    //mesa de control
    cPC ='PC'; cPCD='Pendiente de Autorizar'; //CONTRATO PENDINETE DE AUTORIZAR POR MESA DE CONTROL
    cAC ='AC'; cACD='Autorizada';//CONTRATO AUTORIZADO POR MESA DE CONTROL
    cCC ='CC'; cCCD='Cancelada';//CONTRATO CANCELADO POR MESA DE CONTROL
    cPRO='PR'; // OPERACION INUSUAL PROCESADA MARCADA POR MESA DE CONTROL COMO INUSUAL

    //tesoreria
    cPT ='PT'; cPTD='Pendiente de Autorizar';//CONTRATO PENDIENTE DE AUTORIZAR POR TESORERIA
    cAT ='AT'; cATD='Autorizada';//CONTRATO AUTORIZADO POR TESORERIA
    cCT ='CT'; cCTD='Cancelada';//CONTRATO CANCELADO POR TESORERIA

    cNUMTRANMAX = 'NUMTRANMAX'; //NUMero de TRANsacciones MAXimas permitidas por deal
    cOPERACION = 'OPERACION'; //Para la validación de limites en captura de operacion.
    cCIERRE    = 'CIERRE';  //Para la validación de limites en el cierre
    cCheques    = 'CHMXD'; //  Clave de pago Cheques de Mexdólar
    cRECEPTOR   = 'RECEPTOR'; // Clave de busqueda para el grid de la pantalla de bofa
    cCLASIFICA  = 'CLASIFCA'; // Clave de busqueda para LA CLASIFICACION DE CUENTAS EN la pantalla de bofa
    cTIPOCAPT   = 'TIPOCAPT'; //CLAVE DE BUSQUEDA PARA EL TIPO DE CAPTURA BOFA QUE SE MANEJA EN CCAMB
    cLARGOBOFA  = 'LARGOBOFA'; //LONGITUD PARA LA INFORMACIÓN RECEIVER INCLUYENDO LA CLAVE
    CMONEDA     = 'MONEDA'; //Clave de busqueda para la CLave de moneda que corresponde en BOFA
    CLINMAX     = 'LINMAX'; //Clave de busqueda para el número de máximo de datos de receiver que pueden capturar
    cCHQDESTIN  = 'CHQDESTIN';//clave de parametros para los posible destinos de impresión
    cDEFCHEQDES ='DEFCHEQDES'; //clave de parametros para localizar el destino default

    cTRMEX      = 'TRMEX';  //TRANSFERENCIAS MEXDOLAR
    cTRLIN      = 'TRLIN'; //TRANSFERENCIAS LINEAS BANCARIAS
    cTRDIV      = 'TRDIV';  //TRANSFERENCIAS OTRAS DIVISAS
    cBancosMex  = 'BANCOSMEX'; //Bancos permitidos para las transferencias MEXDOLAR
    cBancosLin  = 'BANCOSLIN'; //Bancos permitidos para las transferencias LINEAS BANCARIAS
    cBancosCHQ  = 'BANCOSCHQ'; //Bancos permitidos para CHEQUES
    cTras       = 'TRASP'; //Clave de liqudiación de cuentas de traspasos
    cSPEITCTA   = 'SPEITCTA';//para buscar los tipos de CUENTA en TIPO_CUENTA para la captura de SPEI
    cSPIDTCTA   = 'SPIDTCTA';//para buscar los tipos de CUENTA en TIPO_CUENTA para la captura de SPID, Celular, Tarjeta, CLABE.
    cSPEIORD    = 'SPEIORD';//para saber si en CCAMB se puede o no campturar la cuenta del ordenante
    cSPIDORD    = 'SPIDORD';//para saber si en CCAMB se puede o no campturar la cuenta del ordenante  {pacv 062016}
    cNBCO_SIAC  = 'NBCO_SIAC'; //para saber el nombre del banco beneficiario del SIAC en compras
    cCTABEN     = 'CTABEN'; //num cuenta para COMPRAS DE SIAC
    cCTAORD     = 'CTAORD'; //NUM CUENTA DEL ORDENANTE PARA SPEI
    cDICTACLI   = 'DICTACLI'; //para generar un folio en la cuenta de clientes al tratarse de Cheques y giros
    cGDIV       = 'GIDIV'; //GIROS EN OTRAS DIVISAS
    cBCOTRDIV   = 'BCOTRDIV' ; //INTERMEDIARIOS QUE PUEDEN VER EN LAS TRANSFERENCIAS OTRAS DIVISAS
    cPRODPISO   = 'PRODPISO'; //PARA BUSCAR LOS PRODUCTOS A LOS QUE SE LES VALIDARA EL PISO
    coTIEMMONI  = 'TIEMMONI'; //tiempo para refrescar el monitor
    cMonExMon   = 'MONEXMON'; //Monedas que se excluyen en el monitor de tipos de cambio

    cLINBAN        =      'TRLIN';
    cTMEXDL        =      'TRMEX';
    cTODIVI        =      'TRDIV';
    // 8Feb2006 EFS Se adicionan constantes para los giros
    cGEOF       = 'CHOF';  //GIROS PARA ENTREGA EN NUESTRAS OFICINAS
    cGEDO       = 'CHCT';  //GIROS PARA ENTREGA EN DOMICILIO DEL CLIENTE
    cGACU       = 'RACT'; // GIROS PARA ABONO EN CUENTA
    cGIROCH     = 'GIROC';  // GIROS CON INFORMACION TIPO CHEQUE
    cGABONOCTA  = 'GABONOCTA'; //Leyendas para presentar en las instrucciones de liquidacion
    cGENTDOMIC  = 'GENTDOMIC';
    cGENTOFNAS  = 'GENTOFNAS';
    cIGUSRCAPT  = 'IGUSRCAPT'; //Imprime Giro de acuerdo con el usuario que captura
    cIGAUTUCAP  = 'IGAUTUCAP'; //Indica si la impresion automatica se determina por usuario de captura o del q imprime

    cREVCOEFLI     = 'REVCOEFLI';//mara4356 para la revision del coeficiente de liquidez
    cCOEFLIQUID    = 'COEFLIQUID';//mara4356 para obtener el monto del coeficiente de liquidez
    cFolAGRUP      = 'FAGRUPMO'; //20feb2006 EFS Folio para agrupar movtos de bofa
    cFAgrup        = 'FA';  //20FEB2006 EFS Cadena con la que se guarda la referencia de movtos agrupados
    cLONGTDEBI     = 'LONGTDEBI'; //24feb2006 EFS Longitud cuenta para tarjeta de debito
    cLONGCLABE    = 'LONGCLABE'; //24Feb2006 EFS Longitud cuenta para CLABE
    cVIGOSL       = 'VIGOSL';  //01MAR2006 EFS Vigencia de Operaciones sin Instrucciones de Liquidacion
    cLIMCANCELA   = 'LIMCANCELA';  //Jul 19, 2007 RAPA493 Limite de Dias para Cancelación de Operaciones
    cImpMaxCanc   = 'IMPMAXCAN'; //02MAR2006 EFS Importe Maximo para Cancelacion de Operaciones
    cPRNOCAN      = 'PRNOCAN'; //3MAR06 EFS PRODUCTOS Q NO SE CANCELAN AUTOMATICAMENTE
    cFINICAN      = 'FINICAN'; //3MAR06 EFS FECHA A PARTIR DE LA QUE SE EMPIEZAN A CANCELAR LAS OPNES.
    cMOTCANC      = 'MOTCANC'; //3MAR06 EFS Motivo de Cancelacion para operaciones sin instrucciones
    cCCDE         = 'Cancelada por M Control';
    cCMDE         = 'Cancelada por Mesa Cambios';
    cCTDE         = 'Cancelada por Tesoreria';
    cAYER         = 'AYER';
    cBCANOROJO    = 'BCANOROJO'; //VALIDA CANCELACIONES EN ROJO V - SI VALIDA F-NO VALIDA
    cREPOMCHQTE   = 'REPOMCHQTE';// Situaciones para el reporte de movimientos por chequera
    cREPOMCHQMC   = 'REPOMCHQMC';
    cREPOMCHQMT   = 'REPOMCHQMT';
    cSINTIPO      = 'STIPO';     //Operaciones que pertenecen a una orden global CANCELADA
    cPRNCORDEN    = 'PRNCORDEN'; //Productos que no deben presentarse en la captura de ordenes
    cMONNTCAM     = 'MONNTCAM'; //Monedas para las que no se capturan tipos de cambio
    CRBRMONEX     = 'RBRMONEX';  //Monedas que no se consideran en el reporte de Brokers
    
    cTRNS         = 'TRNS';  //Grupo de Producto-> Transferencias
    cPATHTC       = 'PATHTC';
    cNbArchivoTC  = 'NBARCHTC';
    cPATHTCREU    = 'PATHTCREUT';
    cNbArcTCREU   = 'NBARCTCREU';
    cUCNVIMPOR    = 'UCNVIMPOR';  //Unidades para las que no se valida el importe piso

    {NOTAS IMPORTANTES :
                     AL INSTALAR EL SISTEMA DE DIVISAS EN UNA MAQUINA, DEBE CREARSE
                     UN CAPTURE PARA QUE LOS CONTRATOS SE DIRECCIONEN A LA IMPRESORA
                     QUE SE LOCALIZA EN LA SUCURSAL  :

                          CAPTURE S=INTER4-GN Q=GFI_DIVISAS_EPSON L=1 NB NFF TI=5
                          DONDE L=1 LPT1

                     Y TAMBIEN UN CAPTURE PARA LA IMPRESORA QUE SE DESEE SELECCIONAR
                     PARA LAS IMPRESIONES DEL SISTEMA DE AMERICAN EXPRESS :

                          CAPTURE S=INTER4-GN Q=GFI_INFORMATICA_LJ5SI L=3 NB NFF TI=5

}

Var prn1 : TextFile;

function EsMovCajCanc(pFol_Mov_Caj:Double; pImpMovto:Double; pApli:TInterApli): Boolean;

function CancelaTodo(pObjeto:TInterFrame):Boolean;

function NoValidaMinMax(pObjeto:TInterFrame):Boolean;

function LiberaCheqICB(pObjeto:TInterFrame):Boolean;

Procedure DameLineas(Var Lista: TStringList; pString: String; pLongitud: Integer); //Regresa una lista con lineas de pLongitud de un string

procedure AvanzaLineas(pNumLineas:Integer);

Function EstImpresora(pImpresora : String): Boolean;

function RellenaEspacios(pCadena:String):String;

function LlenaEspIzq(pCadena:String;pCaracteres : Integer):String;

function LlenaEspDer(pCadena:String;pCaracteres : Integer):String;

function Espacios(pNumEspacios:Integer):String;

function BuscaPctIVA(pApli:TInterApli):Double;

Procedure FillHoja(Text : String;DespX,PosicionY:Real);

Procedure Execute_Factura(Padre:TInterFrame);

function ImprimeFactura(pContrato : TQuery; pOperacion: TQuery; pLiquidacion:TQuery):Boolean;

procedure BuscaFLiquidacion(pFOperacion      : TDateTime;
                            pCveFValor       : String;
                            Var FLiquidacion : TDateTime;
                            Var pDescProceso : String;
                            pApli            : TInterApli);

//function MesaBloqueada(pObjeto:TInterFrame;pIdMesa : String): Boolean;
//function MesaBloqueada(pObjeto:TInterFrame;pIdMesa : String; pIdRegion : String): Boolean;
function MesaBloqueada(pObjeto:TInterFrame;pIdMesa : String): Boolean;


function AjecutaExpressCh:Boolean;

function GenArchAMEXCO(pIdContrato : Double; pApli:TInterApli):Boolean;

function ProcesarTRV(pOperacion:String;pApli:TInterApli): Boolean;

procedure ObtenRutas(Var pRutDatAMexDes:String;
                     Var pRutPrgAMexDes:String;
                     Var pRutDatAMexPrd:String;
                     Var pRutPrgAMexPrd:String);

procedure ObtenRutasBOFA(Var pRutDatAMexDes:String;
                         Var pRutDatAMexPrd:String);


function GeneraArchBOFA(pFecha : TDateTime;pApli : TInterApli):Boolean;

function ObtenCuenta(pApli:TInterapli;pCveproducto:String;pCveMoneda : Double):String;

Procedure SeparaStrenDos(vlImpLetra : String; Var ImpLetra1,ImpLetra2 : String);

function UnidCambUsu(pApli:TInterApli): Integer;

function ObtenNomEmpresa(pApli:TInterApli):String;

function ObtMonedaMesa(pApli:TInterApli; pMesa : String):String;

function ObtDescMoneda(pApli:TInterApli; pMoneda : String):String;

function BuscaImpresora(pMesa : String; pApli:TInterApli): String;

Function EstableceImpresora(pImpresora : String): Integer;

procedure AsignaPromDef(pObjeto:TInterFrame;pMesaCambio:String);

//Verifica si el usuario recaptura importes
function RecapturaImp(pApli : TInterApli): Boolean;

Procedure Imprime_Factura(p_Apli:TInterApli;p_Contrato: String; p_TipoImpresora: TTipoImpresora);

function NombreMes(var pMes:Integer) : String;

//Procedure DesImporte (pImporte: Double; var pStrImp1,pStrImp2, pStrImp3: String );
Procedure DesImporte( pImporte: String; var pStrImp1 :String; var pStrImp2 : String; var pStrImp3: String );

Procedure DesReferencia( pReferencia: String; var pStrRef1 :String; var pStrRef2 : String; var pStrRef3: String );

//Function ValidaImpresion (pIdPersona: Integer; var pDatosImp: String ): Boolean;
//Function ValidaImpresion (p_Apli:TInterApli; pIdPersona: Integer; pImporte: Double; var pDatosImp: String): Boolean;
//mara4356 cambio los datos de entrada
Function ValidaImpresion (p_Apli:TInterApli; pIdPersona: Integer; pImporte: Double; pMesa: String; var pDatosImp:String): Boolean;

//Function procValCliente(p_Apli:TInterApli; pIDCLIENTE:String ): Boolean;  //MARA FASE 2 FEB 2005 2
//Function funInfCliente(p_Apli:TInterApli; vIDContrato, vEmpresa:String ): String; //mara4356 1
//funciones 1 y 2 los cambie por la siguiente función
Function procValCliente(p_Apli:TInterApli; pMesa, pIDCLIENTE :String ): Boolean;//MARA FASE 2 FEB 2005 2
procedure procEnviaCorreo(p_Apli:TInterApli; pMesa, pSubject,pBody,pTipo:String );//MARA ENERO 2009
Procedure procCorreoEfectivo(p_Apli:TInterApli; pMesa,pSolicitud,pEntidad,pTIPOUNIDAD,pSECTOR, pSubject,pBody,pTipo:String );//MARA ABRIL 2009
function BuscaCorreoProm(pApli:TInterApli):String;//MARA4356 MARZO 2009

Procedure procEnviaComprobantes(p_Apli:TInterApli;pFrom, pTo, pToC:String;pAttach:TStringList;pSubject,pBody:String );

Function ValidaCte(pApli:TInterApli; pMesa, pIDCLIENTE,pnombre, pFNac,PSolicitud, pContrato:String ): Boolean;

function ValidaTC(pIdMesa, pMoneda:Integer;pGrupoP, pGProducto,pOperacion:String; pTC:Double; Apli:TInterApli):Boolean; //MARA FASE 2 MARZO 2005

//procedure ProcBuscaTipoCambio(pApli:TInterApli; pProd, pMesa,pOperacion,pGProd: String;pCampo:TInterCampo);//MARA FASE 2 MARZO 2005
function ProcBuscaTipoCambio(pApli:TInterApli; pProd, pMesa,pOperacion,pGProd: String;pCampo:TInterCampo):Boolean;

function InsBitTransaccion(pContrato:String; pApli:TInterApli):Boolean;// MARA marzo 2005

Function ValidaClabe(apli:TInterApli; Cuenta: String) :Boolean; //sacc 31032005

function DlookUP(pDatabasename:String;pSessionName:String;pColumna:String;pTabla:String;pWhere:String):String; // MARA 04 ABRIL 2005

//function SendEmail(pApli:TInterApli;ID_CTO:STRING;pMensaje:TStringList): integer; // MARA 04 ABRIL 2005
function SendEmail(pApli:TInterApli; ID_CTO, pMensaje:String): integer; // MARA 04 ABRIL 2005

function GetAuthority(pFuncion, pUsuario, pParametro, DataBaseName, SessionName:String): Boolean;

function ObtenFechasEmpresa(pMesa, pDLiq, DataBaseName, SessionName:String): String;

function ImprimeAutomatico(pMesa:String; pUsrCap: String; pApli:TInterApli):String; //MARA 13/05/2005  PARA LA IMPRESIÓN DE GIROS Y FACTURAS AUTOMATICAMENTE.

function BuscaTipoUnidad(pMesa : String; pApli : TInterApli):String;//MARA 13/05/2005  PARA LA IMPRESIÓN DE GIROS Y FACTURAS AUTOMATICAMENTE.

function ValidaEmail(email:string):boolean;//sacc 07072005 Valida E-mail

//MARA4356 29/06/2005 PARA VALIDAR EL NUMERO MAXIMO PERMITIDO DE TRANSACCIONES POR OPERACION
function NumTransacMaxima(pMesa : String; pApli : TInterApli):String;

function Revision(pidCto,pMesaCamb,pSector,pCaptura:String; pApli:TInterApli):String;

function RevisionMesas(pContrato:String;pApli:TInterApli):String;

procedure AltaCarta(pTransaccion, pNumTrans:Integer; pOperacion:String; pApli:TInterApli);


//para envio de comprobante
function  Execute_Factura2(pApli : TInterApli; pCto:String):String;
function  ArmaArchivoHTML(pContrato : TQuery; pOperacion: TQuery; pLiquidacion:TQuery; pLeyendas:TQuery):String;
function  CadenaToHtml(PECadena: String): String;
function  CaracterToHtml(PECaracter: char): String;

function  ProcLimites(peMESA, peCONTRATO, peOPERACIONES:Integer; pApli:TInterApli):Boolean;
procedure ActualizaCarta(peID_SOLICITUD, peID_CONTRATO : Integer; peF_OPERACION : TDate; pApli:TInterApli);
Function  ObtenUsuario:String; //OBTIENE EL USUARIO DE LA RED
Function  ObtenSit(Padre: TInterFrame; pTipo:string): String;  //EFS
function  RevisaVB(pidCto,pMesaCamb:String; pApli:TInterApli):String;

function  FolioCorp(pIdEmpresa: Integer; pCveFolio: String;pApli:TInterApli): Integer;

//para obtener la segunda impresora mara4356 febrero 2006
procedure BuscaImpresora2(pMesa, pContrato: String; var  vlDestino, vlDestino2,vlDestino3,vlDestino4 : String; pApli:TInterApli);

function PuedeVerSucs(pObjeto:TInterFrame):Boolean;
function ObtMontoMaxCan(Padre: TInterFrame;peIdContrato, peIdMesa:String):Double;
function validaMonCan(Padre: TInterFrame;peIdContrato, peIdMesaCambio:String):Boolean;
function BuscaCorreo(pApli:TInterApli):String;
Function ObtFLimite(Padre: TInterFrame;peMesaCambio:String;ShowError:Boolean):String;

{ Valida la fecha límite para cancelar operaciones }
Function ValidaFechaLimiteCancela(pIdContrato, pMesaCambios: String; pObjeto: TInterFrame): Boolean;

//MARA4356 PARA ACTUALIZAR ORDEN
procedure ActualizaOrden(pMesa,pOrden,pContrato:Integer;pMotivo:String;pApli:TInterApli);
function  BuscaTiempo(pClave, pMesa:String;pApli:TInterApli):String;
function  CapturaOrden(pMesa: String; pApli:TInterApli):Boolean;
function  StatusOrden(pMesa, pOrden: String; pApli:TInterApli):Boolean;
// 28Jun06 EFS Se sustituye la funcion ValidaImpresion por ObtenFirmas, ya que la primera busca por la
//             entidad del empleado y no por la entidad que se le asignó en DI_UNIDAD_CAMBIO
Function ObtenFirmas (p_Apli:TInterApli; pImporte: Double; pMesa, pCveUsr, pCveProducto: String;
                      var pDatosImp:String): Boolean;

//MARA4356 FEB 2007 SE CREA PARA IMPRIMIR LOS COMPROBANTES DE CONTABILIDAD POR SEPARADO
Procedure Execute_FacturaContrato(pApli:TInterApli; sContratos:String);
procedure BuscaImpresoraContabilidad(pMesa: String; var  vlDestino : String; pApli:TInterApli);

//MOAA4820 DIC 2009
Procedure Execute_FacturaCliOper(Padre:TInterFrame; contrato:String);

//<MARA4356> SEP 2007 DATOS ADICIONALES PARA LA VENTANILLA
function DatosAdicionales(sContrato: String;qTransacciones:Tquery; pApli:TInterApli;
                          pImp1,pImp2,pImp5,pImp10,pImp20,pImp50,pImp100,pImpM,pResult:TInterCampo):Boolean;
function PROCDATOSCLIENTE(qTransacciones:TQuery;pApli:TInterApli;sContrato:String):String;
procedure PROCAFECTACAJA(sAfectaCaja,sCveOperacion,sMesa,sMoneda,sImporte,sContrato,bEsChqVia : String; pApli:TInterApli);
//</MARA4356> SEP 2007 DATOS ADICIONALES PARA LA VENTANILLA
function PROCVALIDAMONTOTC(sSolicitud, sProducto, sFLiquidacion, sCliente: String; sImp_PRod, sImp_MN:Real; pApli:TInterApli):Boolean;
//MOAA4820 MAIL RECORDATORIO BLOQUEO DE CHEQUE
function SendEmailBloqChq(pApli:TInterApli; numCheque, pMensaje, pCveUser:String): integer; // MARA 04 ABRIL 2005
function BuscaCorreoOper(pApli:TInterApli; pUsrOper:String):String;
function GetTokenCountMail(Cadena, Separador: String): Integer;
function GetTokenMail(Cadena, Separador: String; Token: Integer): String;
//Lamado a funcion de validador de PLD
function ValidadorPLD(pidOperacion : Integer; pidContrato : Integer; pApli : TInterApli): Integer;

Procedure GeneraMT(pidContrato : String; pApli : TInterApli);
Procedure ConstruyeMT(pCveMedio : String; pIdTransaccion :String; pidContrato : String; pApli : TInterApli);
Function  EjecutarYEsperar(sPrograma: String; Visibilidad: Integer): Integer;
Procedure ImportaMT(pApli : TInterApli);

function LocalIP: String;

implementation

Function  ObtenSit(Padre: TInterFrame; pTipo:string): String;
   var
       qWhere : TQuery; sWhere, vlMesa:String;
   begin
         vlMesa:=IntToStr(UnidCambUsu(Padre.Apli));
         qWhere := TQuery.Create(Nil);
         qWhere.DatabaseName:=Padre.DataBaseName;
         qWhere.SessionName :=Padre.SessionName;
         qWhere.sql.text:=' select DS_PARAMETRO from di_parametro_dv where ID_MESA_CAMBIO = ' +
                            vlMesa + ' and CVE_PARAMETRO = ' + Chr(39) + pTipo + Chr(39);
         qWhere.Open;
         sWhere:=qWhere.FieldByName('DS_PARAMETRO').AsString;
         qWhere.Close;
         ObtenSit := sWhere;
         qWhere.free;
end;


Procedure DameLineas(Var Lista: TStringList; pString: String; pLongitud: Integer);
Var
   Indice: Integer;
   Final: Boolean;
   StrTemp, StrLinea: String;

   Procedure Agrega;
   Var PosicionEnter: Integer;
   Begin
   	StrLinea:= TrimRight(StrLinea);
      PosicionEnter:= Pos(#13,StrLinea);
      If PosicionEnter <> 0 Then StrLinea:= TrimRight(Copy(StrLinea, 1, PosicionEnter - 1));
   	If StrLinea <> '' then Lista.Add(StrLinea);
   end;

Begin
   Final:= False;
   Repeat
      StrLinea:= Copy(pString, 1, pLongitud);
      If (Length(pString) <= pLongitud) or (pString[pLongitud + 1] = ' ') Then Agrega
      else
      Begin
         Indice:= Length(StrLinea);
         While ((Indice > 0) and (StrLinea[Indice] <> ' ')) or(Indice = 0) do Dec(Indice);
         If Indice > 0 then StrLinea:= Copy(StrLinea, 1, Indice);
         Agrega;
      end;
      System.Delete(pString, 1, Length(StrLinea));
      pString:= Trim(pString);
      If Length(pString) = 0 Then Final:= True;
   Until Final;
end;

Function EstImpresora(pImpresora : String): Boolean;
Var i,j,k,posic: Integer;
    cadena2 : string;
begin
    EstImpresora:=False;
    k:=Printer.Printers.Count-1;
    j:=-1;
    for i:=0 to k do
    begin
        Cadena2:=Trim(UPPERCASE(Printer.Printers.Strings[i]));
        posic:= Pos(TRIM(UPPERCASE(pImpresora)), Cadena2);
        if posic > 0 then
          begin
             j:=i;
             break;
          end;
    end;

    if j <> -1 then
    begin
       Printer.PrinterIndex:=j;
       EstImpresora:=True;
    end;
end;

function LlenaEspDer(pCadena:String;pCaracteres : Integer):String;
Var vlCadena : String;
    i : Integer;
begin  vlCadena:=pCadena;
       if length(vlcadena) >= pCaracteres
       then begin
              LlenaEspDer:=pCadena;
            end
       else begin
              for i:=1 to pCaracteres - Length(vlCadena) do
                 vlCadena:=vlCadena + ' ';
              LlenaEspDer:=vlCadena;
            end;
end;

function LlenaEspIzq(pCadena:String;pCaracteres : Integer):String;
Var vlCadena : String;
    i : Integer;
begin  vlCadena:=pCadena;
       if length(vlcadena) >= pCaracteres
       then begin
              LlenaEspIzq:=pCadena;
            end
       else begin
              for i:=1 to pCaracteres - Length(vlCadena) do
                 vlCadena:=' ' + vlCadena;
              LlenaEspIzq:=vlCadena;
            end;
end;

function Espacios(pNumEspacios:Integer):String;
Var vlCadena: String;
    i       : Integer;
begin vlCadena:='';
      for i:=1 to pNumEspacios do
         vlCadena:=vlCadena + ' ';
      Espacios:=vlCadena;
end;

function RellenaEspacios(pCadena:String):String;
Var vlCadena   : String;
    vlContador : Integer;
begin
   vlCadena:=TRIM(pCadena);
   if Length(vlCadena) > 22 then
   begin
      vlCadena:=Copy(vlCadena,1,22);
   end
   else
   begin
     for vlContador:=length(vlCadena) + 1 to 22 do
     begin
        vlCadena:=vlCadena + ' ';
     end;
   end;
   RellenaEspacios:=vlCadena;
end;

function BuscaPctIVA(pApli:TInterApli):Double;
Var qParamCorporat : TQuery;
begin
    qParamCorporat:=getsqlquery ('SELECT * FROM PARAM_CORPORAT'+
                                 ' WHERE CVE_PARAMETRO = ''' + cIdParaDI + '''',
                                 pApli.DataBaseName,
                                 pApli.SessionName,True);
    try
       if qParamCorporat <> nil then
       begin
          BuscaPctIVA:=qParamCorporat.FieldByName('PCT_IVA').AsFloat/100;
       end
       else
       begin
          BuscaPctIVA:=0;
       end;
  finally qParamCorporat.Free;
  end;
end;

procedure BuscaFLiquidacion(pFOperacion      : TDateTime;
                            pCveFValor       : String;
                            Var FLiquidacion : TDateTime;
                            Var pDescProceso : String;
                            pApli            : TInterApli);
Var sp       : TStoredProc;
begin //Busca la fecha de liquidación para una Fecha de Valor específica
    sp:=TStoredProc.Create(Nil);
    try
       sp.DatabaseName:=pApli.DataBaseName;
       sp.SessionName :=pApli.SessionName;
       sp.StoredProcName:='PKGDIVISA.FUNOBTFECHALIQ';
       sp.Params.CreateParam(ftDateTime,'pFechaInicial',ptInput);
       sp.Params.CreateParam(ftString,  'pCve_f_Valor', ptInput);
       sp.Params.CreateParam(ftInteger,'pEmpresa',ptInput);
       sp.Params.CreateParam(ftString,  'pdesc_proceso',ptOutput);
       sp.Params.CreateParam(ftDateTime,'Result',ptResult);

       //Asigna los valores de entrada
       sp.Params.ParamByName('pFechaInicial').AsDateTime:=pFOperacion;
       sp.Params.ParamByName('pCve_f_Valor').AsString   :=pCveFValor;
       sp.Params.ParamByName('pEmpresa').AsInteger:=pApli.IdEmpresa;

       //Prepara y ejecuta el stored procedure
       sp.Prepare;
       sp.ExecProc;

       //Obtiene el resultado de la ejecución del stored procedure
       FLiquidacion:=sp.parambyname('Result').AsDateTime;
       pDescProceso:=sp.parambyname('pdesc_proceso').AsString;
    finally sp.free;
    end;
end;

Procedure FillHoja(Text : String;DespX,PosicionY:Real);
Const ResX:Real=(144/2.54); //(600/2.54); Resolución de la impresora
      ResY:Real=(72/2.54);  //(600/2.54); Resolución de la impresora
      kAltoHoja:Real=(11*2.54)/2; // Es una hoja media carta
Var OrX,OrY:Real;

Procedure PrintOut(X,Y:Real; Text, FontName:String; FontSize:Real);
begin X:=OrX+X*ResX; Y:=OrY+Y*ResY;
      if FontName<>'' then
      begin Printer.Canvas.Font.Name:=FontName;
            Printer.Canvas.Font.Height:=Round((FontSize)*ResY);
      end;
      Printer.Canvas.TextOut(Round(X),Round(Y), Text);
end;

begin //    PixelX:=Cms *  ResX         PixelY:=Cms * ResY
      OrX:=(DespX)*ResX; OrY:=(PosicionY*ResY);
      PrintOut(0,0,Text,'Courier New',0.4);
end;

Procedure Execute_Factura(Padre:TInterFrame);
// MARA4356 FEBRERO 2006 SE MODIFICA PROCEDIMIENTO PARA IMPRIMIR FACTURA EN DOS IMPRESORAS
//MARA4356 FEB 2007 SE MODIFICA PARA IMPRIMIR EL TANTO DEL CLIENTE Y OPERACION EN LA CPATURA
var qContrato,
    qOper,
    qLiquidacion : TQuery;       
    vlSQL, vlDestino, vlDestino2, vlDestino3, vlDestino4,
    vlMesa,vlCondCanc:String;
    vlImpreso:Boolean;
    vlIndex, vlIndex2, vlIndex3, vlIndex4  : Integer;
begin
      qContrato   :=tQuery.Create(Nil);
      qOper       :=tQuery.Create(Nil);
      qLiquidacion:=tQuery.Create(Nil);
      vlImpreso:=False;
      vlMesa:=IntToStr(UnidCambUsu(Padre.Apli));
      try
      qContrato.Databasename:=Padre.Databasename;
      qContrato.SessionName :=Padre.SessionName;
      //RAST
      qContrato.SQL.Text:=
       ' SELECT DI_CONTRATO.ID_CONTRATO, DI_CONTRATO.ID_CLIENTE, ' +
       ' DI_CONTRATO.NOMBRE_CLIENTE, DI_CONTRATO.CVE_MONEDA_BASE, ' +
       ' DI_CONTRATO.F_OPERACION, DI_CONTRATO.F_LIQUIDACION, ' +
       ' DI_CONTRATO.SIT_CONTRATO, DI_CONTRATO.TX_COMENTARIO, ' +
       ' PERSONA.ID_PERSONA, ' +
       ' NVL ((SELECT RTRIM (rfc.siglas_rfc)  || RTRIM (rfc.f_rfc) || RTRIM (rfc.homoclave_rfc) FROM RFC WHERE persona.ID_PERSONA = RFC.ID_PERSONA),(CLI.RFC)) AS RFCT, ' +
       ' DI_CLIENTE.B_IMPR_DOMIC, DOMICILIO.CALLE_NUMERO, ' +
       ' (DOMICILIO.COLONIA || '','' || CIUDAD.DESC_POBLACION) DOMIC1, ' +
       ' (ESTADO.DESC_POBLACION || '','' || POBLACION.DESC_POBLACION) DOMIC2, ' +
       ' DOMICILIO.CODIGO_POSTAL, ' +
       ' NVL (CLI.NOMBRE_RAZON, DI_CONTRATO.NOMBRE_CLIENTE) AS NOMBRE_RAZON, ' +
       ' CLI.FEC_NAC, CLI.RFC, CLI.NO_IFE, CLI.CALLE, CLI.COLONIA, ' +
       ' CLI.CODIGO_POSTAL AS COD_POSTAL, ' +
       ' (SELECT SERIE FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) SERIE, ' +
       ' (SELECT FOLIO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) FOLIO, ' +
       ' (SELECT FECHA_CREACION FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) FECHA_CREACION, ' +
       ' (SELECT ANO_APROBACION FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) ANO_APROBACION, ' +
       ' (SELECT NUM_APROBACION FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) NUM_APROBACION, ' +
       ' (SELECT CERTIFICADO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) CERTIFICADO, ' +
       ' (SELECT SELLO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) SELLO, ' +
       ' (SELECT CADENA FROM RFE_COMPROBANTE RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) CADENA, ' +
       ' (SELECT TIPO_CAMBIO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) TIPO_CAMBIOS, ' +
       ' (SELECT METODO_PAGO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) METODO_PAGO, ' +
       ' (SELECT CUENTA FROM RFE_COMPROBANTE  WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) CUENTA, ' +
       ' (SELECT NOM_PAIS_EX FROM RFE_EMISOR WHERE RFE_EMISOR.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) NOM_PAIS_EX, ' +
       ' (SELECT NOM_ESTADO_EX FROM RFE_EMISOR WHERE RFE_EMISOR.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) NOM_ESTADO_EX, ' +
                   ' (SELECT DESC_MONEDA FROM RFE_COMPROBANTE  WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) DESC_MONEDA, ' +
       ' (SELECT REGIMEN FROM RFE_EMISOR  WHERE RFE_EMISOR.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) REGIMEN ' +
  ' FROM DI_CONTRATO, ' +
       ' POBLACION ESTADO, ' +
       ' DOMICILIO, ' +
       ' POBLACION, ' +
       ' POBLACION CIUDAD, ' +
       ' PERSONA, ' +
       ' DI_CLIENTE, ' +
       ' DI_CLIENTE_7 CLI ' +
 ' WHERE (DI_CONTRATO.ID_CLIENTE = PERSONA.ID_PERSONA) ' +
   ' AND (DI_CONTRATO.ID_MESA_CAMBIO =  ' + VLMESA + ') AND ' +
   ' (di_cliente.id_persona = di_contrato.id_cliente) ' +
   ' AND (persona.id_domicilio = domicilio.id_domicilio) ' +
   ' AND (persona.id_domicilio = domicilio.id_domicilio(+)) ' +
   ' AND (domicilio.cve_pais = poblacion.cve_poblacion(+)) ' +
   ' AND (domicilio.cve_estado = estado.cve_poblacion(+)) ' +
   ' AND (domicilio.cve_ciudad = ciudad.cve_poblacion(+)) ' +
   'AND ( DI_CONTRATO.ID_CONTRATO   =  ' + Padre.FieldByName('ID_CONTRATO').AsString  + ')' +
   'AND cli.id_contrato_OP(+) = di_contrato.id_contrato';
     {
      'SELECT DI_CONTRATO.ID_CONTRATO,' +
                         ' DI_CONTRATO.ID_CLIENTE,' +
                         ' DI_CONTRATO.NOMBRE_CLIENTE,  ' +
                         ' DI_CONTRATO.CVE_MONEDA_BASE, ' +
                         ' DI_CONTRATO.F_OPERACION,     ' +
                         ' DI_CONTRATO.F_LIQUIDACION,   ' +
                         ' DI_CONTRATO.SIT_CONTRATO,    ' +
                         ' DI_CONTRATO.TX_COMENTARIO,   ' +
                         ' PERSONA.ID_PERSONA,          ' +
                         // EIB2AARJ : 30 NOV INICIO
                         // ' RTRIM(RFC.SIGLAS_RFC) || RTRIM(RFC.F_RFC) || RTRIM(RFC.HOMOCLAVE_RFC) AS RFCT,' +
                         '  NVL((RTRIM(RFC.SIGLAS_RFC) || RTRIM(RFC.F_RFC) || RTRIM(RFC.HOMOCLAVE_RFC)),  ( cli.RFC )  )AS RFCT, ' +
                         // EIB2AARJ : 30 NOV FIN
                         ' DI_CLIENTE.B_IMPR_DOMIC,     ' +
                         ' DOMICILIO.CALLE_NUMERO ,     ' +
                         ' ( DOMICILIO.COLONIA || '','' || CIUDAD.DESC_POBLACION ) DOMIC1, ' +
                         ' ( ESTADO.DESC_POBLACION || '','' || POBLACION.DESC_POBLACION ) DOMIC2, ' +
                         // EIB2AARJ : 18 nov 2010 Se incluyen nuevos campos para imprimir los campos de FE
                         //'   DOMICILIO.CODIGO_POSTAL ' +
                         ' DOMICILIO.CODIGO_POSTAL ,' +
                         // EIB2AARJ : 30 NOV SE AGREGAN CAMPOS NUEVOS QUE SE OBTIENEN DE CLIENTE_7
                         ' NVL(CLI.NOMBRE_RAZON, DI_CONTRATO.NOMBRE_CLIENTE) AS NOMBRE_RAZON, ' +
                         ' cli.FEC_NAC, cli.RFC,  cli.NO_IFE,  cli.CALLE,   cli.COLONIA,  ' +
                         ' cli.CODIGO_POSTAL AS COD_POSTAL,  ' +
                         // EIB2AARJ : 30 NOV FIN
                         ' RC.SERIE, RC.FOLIO, RC.FECHA_CREACION , RC.ANO_APROBACION, RC.NUM_APROBACION, RC.CERTIFICADO, RC.SELLO, RC.CADENA '+
                         'FROM DI_CONTRATO , POBLACION ESTADO, ' +
                         '     DOMICILIO , POBLACION, ' +
                         '     POBLACION CIUDAD, PERSONA, DI_CLIENTE, ' +
                         // EIB2AARJ : 18 nov 2010  se referencia a la tabla donde se generan los datos de FE RFE_COMPROBANTE
                         //'     RFC ' +
                         // EIB2AARJ : 30 NOV INICIO
                         //'     RFC , RFE_COMPROBANTE RC ' +
                         ' RFC , RFE_COMPROBANTE RC , DI_SOL_CTO SOL,  DI_CLIENTE_7 CLI ' +
                         // EIB2AARJ : 30 NOV FIN
                         'WHERE (DI_CONTRATO.ID_CLIENTE     = PERSONA.ID_PERSONA)  AND ' +
                         '      (RFC.ID_PERSONA          (+)= PERSONA.ID_PERSONA)  AND ' +
                         '      (DI_CONTRATO.ID_MESA_CAMBIO = ' + vlMesa + ') AND ' +
                         '      (DI_CLIENTE.ID_PERSONA      = DI_CONTRATO.ID_CLIENTE)     AND ' +
                         '      (PERSONA.ID_DOMICILIO       = DOMICILIO.ID_DOMICILIO)     AND ' +
                         '      ( PERSONA.ID_DOMICILIO      = DOMICILIO.ID_DOMICILIO(+))  AND ' +
                         '      ( DOMICILIO.CVE_PAIS        = POBLACION.CVE_POBLACION(+)) AND ' +
                         '      ( DOMICILIO.CVE_ESTADO      = ESTADO.CVE_POBLACION(+))    AND ' +
                         '      ( DOMICILIO.CVE_CIUDAD      = CIUDAD.CVE_POBLACION(+))    AND ' +
                         // EIB2AARJ : 18 nov 2010
                         //'      ( DI_CONTRATO.ID_CONTRATO   = ' + Padre.FieldByName('ID_CONTRATO').AsString + ')';
                         '      ( DI_CONTRATO.ID_CONTRATO   = ' + Padre.FieldByName('ID_CONTRATO').AsString + ') AND ' +
                         // EIB2AARJ : 30 NOV INICIO
                         '       DI_CONTRATO.ID_CONTRATO    = SOL.ID_CONTRATO(+)          AND  ' +
                         '       CLI.ID_SOLICITUD        (+)= SOL.ID_SOLICITUD          AND  ' +
                         // EIB2AARJ : 30 NOV FIN
                         '      ( DI_CONTRATO.ID_CONTRATO   = RC.ID_CONTRATO(+) ) ' ;

                             }
     qContrato.Open;

     if qContrato.FieldByName('SIT_CONTRATO').AsString = 'CA'
     then vlCondCanc:=' AND DI_TRANSACCION.CVE_OPERACION IN (''CC'',''CV'',''CCT'',''CVT'')'
     else vlCondCanc:='';


     qOper.Databasename:=Padre.Databasename;
     qOper.SessionName :=Padre.SessionName;
     qOper.SQL.Text:='SELECT DI_TRANSACCION.ID_CONTRATO,    ' +
                     '       DI_TRANSACCION.F_OPERACION,    ' +
                     '       DI_TRANSACCION.F_LIQUIDACION,  ' +
                     '       DI_TRANSACCION.CVE_MONEDA,     ' +
                     '       DI_TRANSACCION.CVE_OPERACION,  ' +
                     '       DI_TRANSACCION.IMP_TRANS_MN,   ' +
                     '       DI_TRANSACCION.IMP_TRANS_PROD, ' +
                     '       DI_TRANSACCION.TC_OPERACION,   ' +
                     '       DI_TRANSACCION.TX_COMENTARIO,  ' +
                     '       DI_TRANSACCION.DESC_BENEF,     ' +
                     '       DI_TRANSACCION.CTA_BENEFICIARIO, ' +
                     '       DI_TRANSACCION.NOMBRE_BCO_BENEF, ' +
                     '       DI_TRANSACCION.ABA,          ' +
                     '       DI_OPERACION.DESC_L_ID_PRIM AS DESCOPER, ' +
                     '       DI_PRODUCTO.DESC_L_ID_PRIM AS DESCPROD,  ' +
                     '       MONEDA.DESC_MONEDA,          ' +
                     '       DI_TRANSACCION.CVE_PRODUCTO  ' +
                     ' FROM DI_TRANSACCION , DI_OPERACION,' +
                     '      DI_PRODUCTO, MONEDA ' +
                     ' WHERE (DI_TRANSACCION.CVE_PRODUCTO  = DI_PRODUCTO.CVE_PRODUCTO)   AND ' +
                     '       (DI_TRANSACCION.CVE_OPERACION = DI_OPERACION.CVE_OPERACION) AND ' +
                     '       (DI_TRANSACCION.ID_MESA_CAMBIO= ' + vlMesa + ') AND ' +
                     '       (DI_PRODUCTO.ID_MESA_CAMBIO   = ' + vlMesa + ') AND ' +
                     '       (DI_TRANSACCION.CVE_MONEDA    = MONEDA.CVE_MONEDA) AND  ' +
                     '       (DI_TRANSACCION.ID_CONTRATO   = ' +  Padre.FieldByName('ID_CONTRATO').AsString   + ') AND ' +
                     '       (DI_TRANSACCION.CVE_MONEDA   <> ' +  qContrato.FieldByName('CVE_MONEDA_BASE').AsString +
                     '       )' + vlCondCanc +
                     ' ORDER BY DI_TRANSACCION.ID_TRANSACCION ';
     qOper.Open;

     qLiquidacion.Databasename:=Padre.Databasename;
     qLiquidacion.SessionName :=Padre.SessionName;
     qLiquidacion.SQL.Text:='SELECT DI_TRANSACCION.ID_CONTRATO,  ' +
                            '       DI_TRANSACCION.F_OPERACION,  ' +
                            '       DI_TRANSACCION.CVE_PRODUCTO, ' +
                            '       DI_TRANSACCION.ID_GPO_TRANS, ' +
                            '       DI_TRANSACCION.F_LIQUIDACION,' +
                            '       DI_TRANSACCION.CVE_MONEDA,   ' +
                            '       DI_TRANSACCION.CVE_OPERACION,' +
                            '       DI_TRANSACCION.IMP_TRANS_MN, ' +
                            '       DI_TRANSACCION.IMP_TRANS_PROD,' +
                            '       DI_TRANSACCION.TC_OPERACION,  ' +
                            '       DI_TRANSACCION.TX_COMENTARIO, ' +
                            '       DI_PRODUCTO.DESC_L_ID_PRIM AS DESCPROD,   ' +
                            '       DI_OPERACION.DESC_L_ID_PRIM AS DESCOPER   ' +
                            ' FROM DI_TRANSACCION , DI_OPERACION,  ' +
                            ' DI_PRODUCTO ' +
                            ' WHERE (DI_TRANSACCION.CVE_OPERACION = DI_OPERACION.CVE_OPERACION)  AND ' +
                            '       (DI_TRANSACCION.CVE_PRODUCTO  = DI_PRODUCTO.CVE_PRODUCTO)    AND  ' +
                            '       (DI_TRANSACCION.ID_MESA_CAMBIO= ' + vlMesa + ') AND ' +
                            '       (DI_PRODUCTO.ID_MESA_CAMBIO   = ' + vlMesa + ') AND ' +
                            '       (DI_TRANSACCION.ID_CONTRATO   = ' +  Padre.FieldByName('ID_CONTRATO').AsString + ') AND  ' +
                            '       (DI_TRANSACCION.CVE_MONEDA   = ' + qContrato.FieldByName('CVE_MONEDA_BASE').AsString + ')' +
                             vlCondCanc +
                            ' ORDER BY DI_TRANSACCION.ID_TRANSACCION ';

    qLiquidacion.Open;
//    vlDestino:=BuscaImpresora(vlMesa,Padre.Apli);
    BuscaImpresora2(vlMesa, Padre.FieldByName('ID_CONTRATO').AsString ,
                    vlDestino, vlDestino2, vlDestino3, vlDestino4, Padre.Apli); //mara4356 febrero 2006 //<<MARA4356 FEB 2007 SE AGREGA NOMCLASE

    if (vlDestino <> '') AND (vlDestino2 <> '')  then
    begin
       if vlDestino = cImprDivisas
       then vlImpreso:=ImprimeFactura(qContrato, qOper, qLiquidacion)
       else begin
               vlIndex:=EstableceImpresora(vlDestino);
               vlIndex2:=EstableceImpresora(vlDestino2);
               //vlIndex3:=EstableceImpresora(vlDestino3);
               //vlIndex4:=EstableceImpresora(vlDestino4);
               if (vlIndex <> -1) and (vlIndex2 <> -1)
               then vlImpreso:=Execute_ImpCompDiv(Padre.Apli,qContrato,qOper,qLiquidacion,vlIndex,vlIndex2,vlIndex3,vlIndex4) // Unidad: UnQrComDiv 1 de 4
               else MessageDlg('No se pudo asignar las impresoras : '+vlDestino+', '+vlDestino2+
                              ', '+vlDestino3+', '+vlDestino4,mtError,[mbOK],0);
            end;

       if vlImpreso
       then begin
              vlSQL:='UPDATE DI_CONTRATO SET B_IMPR_FACT = ''V'', NUM_IMPR_FACT = NUM_IMPR_FACT + 1 WHERE ID_CONTRATO=' + Padre.FieldByName('ID_CONTRATO').AsString;
              Runsql(vlSQL,Padre.databasename,Padre.sessionname,True);
              MessageBeep(0);
            end
       else MessageDlg('El contrato no pudo ser impreso. Verifique conexión con la red o llame al departamento de sistemas', mtError,[mbOK],0);

    end
    else MessageDlg('No se pudo localizar los destinos de impresión para el usuario ', mtError,[mbOK],0);

     finally
        if qContrato <> nil then qContrato.free;
        if qOper     <> nil then qOper.free;
        if qLiquidacion <> nil then qLiquidacion.free;
     end;
end;

procedure AvanzaLineas(pNumLineas:Integer);
var i : Integer;
begin for i:=1 to pNumLineas do
        writeln(prn1,' ');
end;

function ImprimeFactura(pContrato : TQuery; pOperacion: TQuery; pLiquidacion:TQuery):Boolean;
Var vlOperacion,   vlProducto,
    vlImpProducto, vlTCambio,
    vlImpPesos,    vlTotaliza,
    vlCadena,
    vlCadena2,
    vlComentario : String;
    vlTotal,
    vlPesos      : Double;
    vlContador,i,
    vlCliente    : Integer;
    vlConsulta   : TQuery;
    Lista: TStringList;
begin
      ImprimeFactura:=False;
      assignfile(prn1,'LPT1');
      // assignfile(prn1,'c:\salida.txt');

      rewrite(prn1);

      writeln(Prn1,chr(27)+chr(67)+chr(43));
      //Imprime el encabezado
      vlCliente:=pContrato.FieldByName('ID_CLIENTE').AsInteger;
      AvanzaLineas(3);
      Lista:= TStringList.Create;
      DameLineas(Lista, pContrato.FieldByName('NOMBRE_CLIENTE').AsString,48);
      for i:=0 to Lista.Count-1 do
      begin if i = 0
            then begin
                   vlCadena:=LlenaEspDer(Lista.Strings[i],52) +
                             FormatDateTime('DD',pContrato.FieldByName('F_OPERACION').AsDateTime) + Espacios(3) +
                             FormatDateTime('MMM',pContrato.FieldByName('F_OPERACION').AsDateTime)+ Espacios(2) +
                             FormatDateTime('YYYY',pContrato.FieldByName('F_OPERACION').AsDateTime);
                 end
            else begin
                   vlCadena:=LlenaEspDer(Lista.Strings[i],52);
                 end;
            writeln(Prn1,vlCadena);
      end;

      if pContrato.FieldByName('B_IMPR_DOMIC').AsString = 'V'
      then begin
             AvanzaLineas(2-Lista.Count);
             writeln(Prn1,pContrato.FieldByName('CALLE_NUMERO').AsString);
             vlCadena:=LlenaEspDer(pContrato.FieldByName('DOMIC1').AsString,52) +
                                   FormatDateTime('DD',pContrato.FieldByName('F_LIQUIDACION').AsDateTime)  + Espacios(3) +
                                   FormatDateTime('MMM',pContrato.FieldByName('F_LIQUIDACION').AsDateTime) + Espacios(2) +
                                   FormatDateTime('YYYY',pContrato.FieldByName('F_LIQUIDACION').AsDateTime);
             writeln(Prn1,vlCadena);
             writeln(Prn1,pContrato.FieldByName('DOMIC2').AsString);
//             vlCadena:=LlenaEspDer(pContrato.FieldByName('CODIGO_POSTAL').AsString,6);
             vlCadena:='C.P.:' + LlenaEspDer(pContrato.FieldByName('CODIGO_POSTAL').AsString,6) + ' RFC:' + LlenaEspDer(pContrato.FieldByName('RFCT').AsString,16);
             writeln(Prn1,vlCadena);
           end
      else begin
             AvanzaLineas(3-Lista.Count);
             vlCadena:=Espacios(52) +
                       FormatDateTime('DD',pContrato.FieldByName('F_LIQUIDACION').AsDateTime)  + Espacios(3) +
                       FormatDateTime('MMM',pContrato.FieldByName('F_LIQUIDACION').AsDateTime) + Espacios(2) +
                       FormatDateTime('YYYY',pContrato.FieldByName('F_LIQUIDACION').AsDateTime);
             writeln(Prn1,vlCadena);
             AvanzaLineas(2);
           end;
      vlCadena:=LlenaEspIzq(pContrato.FieldByName('ID_CONTRATO').AsString,60);
      writeln(Prn1,vlCadena);
      AvanzaLineas(2);

      for i:=1 to 2 do
      begin
         if i=1
         then vlConsulta:=pOperacion
         else vlConsulta:=pLiquidacion;
         vlTotal      :=0;
         vlContador   :=0;
         while not vlConsulta.EOF do
         begin
            if (i=1) then begin
                   if (COPY(vlConsulta.FieldByName('CVE_PRODUCTO').AsString,1,2) = 'CO') OR
                      (COPY(vlConsulta.FieldByName('CVE_PRODUCTO').AsString,1,2) = 'IV')
                   then vlOperacion  :=Espacios(15)
                   else vlOperacion  :=LlenaEspDer(Trim(vlConsulta.FieldByName('DESCOPER').AsString),15)
                 end
            else vlOperacion  :=Espacios(15);
            vlProducto   :=LlenaEspDer(Trim(vlConsulta.FieldByName('DESCPROD').AsString),22);
            vlImpProducto:=FormatFloat('###,###,###,##0.00',vlConsulta.FieldByName('IMP_TRANS_PROD').AsFloat);
//            vlTCambio    :=FormatFloat('##,##0.0000',vlConsulta.FieldByName('TC_OPERACION').AsFloat);
            vlTCambio     := FormatFloat('##,##0.00000000',vlConsulta.FieldByName('TC_OPERACION').AsFloat); //rohs4279 ago/2015 req. GD2015004-026
            if (vlConsulta.FieldByName('CVE_OPERACION').AsString = 'C')  or
               (vlConsulta.FieldByName('CVE_OPERACION').AsString = 'CT') or
               (vlConsulta.FieldByName('CVE_OPERACION').AsString = 'CC')
            then begin
                   vlPesos:=vlConsulta.FieldByName('IMP_TRANS_MN').AsFloat;
                   vlTotal:=vlTotal + vlConsulta.FieldByName('IMP_TRANS_MN').AsFloat
                 end
            else begin
                   vlPesos:=vlConsulta.FieldByName('IMP_TRANS_MN').AsFloat * -1;
                   vlTotal:=vlTotal - vlConsulta.FieldByName('IMP_TRANS_MN').AsFloat;
                 end;
            vlImpPesos   :=FormatFloat('###,###,###,##0.00',vlPesos);
            vlImpProducto:=LlenaEspIzq(vlImpProducto,15);
            vlTCambio    :=LlenaEspIzq(vlTCambio,14);
            vlImpPesos   :=LlenaEspIzq(vlImpPesos,18);
            vlCadena     :=vlOperacion + vlProducto + vlImpProducto + vlTCambio + '        $' +  vlImpPesos;
            writeln(prn1,vlCadena);
            inc(vlContador);
            vlConsulta.Next;
         end;
         AvanzaLineas(5-vlContador);
         vlTotaliza:=FormatFloat('###,###,###,##0.00',vlTotal);
         vlCadena:=Espacios(74)+'$'+LlenaEspIzq(vlTotaliza,18);
         writeln(prn1,vlCadena);
         AvanzaLineas(2);
      end;

      //Imprime los comentarios
      if pContrato.FieldByName('SIT_CONTRATO').AsString = 'CA'
      then vlComentario:='Este Contrato ya fue liquidado  y se esta <CANCELANDO> en este momento'
      else vlComentario:=pContrato.FieldByName('TX_COMENTARIO').AsString;

      Lista.Clear;
      DameLineas(Lista, vlComentario,70);
      for i:=0 to Lista.Count-1 do writeln(Prn1,Lista.Strings[i]);

      writeln(Prn1,chr(12));
      pOperacion.Close;
      pLiquidacion.Close;
      PContrato.Close;
      closefile (prn1);
      Lista.free;
      ImprimeFactura:=True;
end;

function NoValidaMinMax(pObjeto:TInterFrame):Boolean;
begin //Si el usuario tiene una excepción, no valida máximos ni mínimos
      if GetSql('SELECT Cve_Oper_acc From Secu_Oper_Acc ' +
                ' WHERE Cve_Funcion = ''' + pObjeto.Apli.LastFuncion + '''' +
                '   and Cve_Usuario = ''' + pObjeto.Apli.Usuario     + '''' +
                '   and Cve_Oper_Acc= ''NM''',
                pObjeto.Apli.DataBaseName, pObjeto.Apli.SessionName, False)
      then NoValidaMinMax:=True
      else NoValidaMinMax:=False;
end;

function CancelaTodo(pObjeto:TInterFrame):Boolean;
begin //Si tiene la excepción de No-Bloqueo, también tiene la opción de Cancela Todo
      CancelaTodo:=GetSql('SELECT Cve_Oper_acc From Secu_Oper_Acc ' +
                          ' WHERE Cve_Funcion = ''DIVISA_CONTRATO'' ' +
                          '   and Cve_Usuario = ''' + pObjeto.Apli.Usuario + '''' +
                          '   and Cve_Oper_Acc = ''NB''',
                          pObjeto.Apli.DataBaseName, pObjeto.Apli.SessionName, False);
end;

//function MesaBloqueada(pObjeto:TInterFrame;pIdMesa : String): Boolean;
{function MesaBloqueada(pObjeto:TInterFrame;pIdMesa : String; pIdRegion : String): Boolean;
Var qConsulta : TQuery;
    qReg : TQuery;
    qNomReg: TQuery;
    NomReg : String;
begin //Si el usuario tiene una excepción, se salta la validación
      if GetSql('SELECT Cve_Oper_acc From Secu_Oper_Acc ' +
                ' WHERE Cve_Funcion = ''' + pObjeto.Apli.LastFuncion + '''' +
                '   and Cve_Usuario = ''' + pObjeto.Apli.Usuario + '''' +
                '   and Cve_Oper_Acc = ''NB''',
                pObjeto.Apli.DataBaseName, pObjeto.Apli.SessionName, False) then
      begin
        MesaBloqueada:=False;
        Exit;
      end;

      MesaBloqueada:=False;
      qConsulta := TQuery.Create(Nil);
      try  qConsulta.Databasename:=pObjeto.databasename;
           qConsulta.SessionName :=pObjeto.SessionName;
           qConsulta.SQL.Text:='SELECT Count(*) as Cuenta FROM DI_MESA_CAMBIO WHERE ' +
                               ' ID_MESA_CAMBIO = ' + pIdMesa + ' AND SIT_MESA_CAMBIO=''BL'' ';
           qConsulta.Open;
           if qConsulta.FieldByName('CUENTA').AsInteger > 0
           then begin
                  MuestraMesaBloq;
                  MesaBloqueada:=True;
                end
           else begin
                  // MARA 31/ENE/2005 REVISION DE REGION BLOQUEADA
                  //MesaBloqueada:=False;
                  qReg:=TQuery.Create(Nil);
                  try   qReg.DataBaseName:=pObjeto.DataBaseName;
                        qReg.SessionName:=pObjeto.SessionName;
                        qReg.SQL.Text:=' SELECT Count(*) as Cuenta  FROM DI_REGION_CAMBIO '+
                                       '  WHERE ID_MESA_CAMBIO = '+ pIdMesa + ' AND ID_REGION_CAMBIO = '+ pIdRegion +
                                       '    AND SIT_REGION_CAMB = ''BL'' ';
                        qReg.Open;
                        if qReg.FieldByName('CUENTA').AsInteger > 0
                        then begin
                                //manda mensaje de region bloqueada
                                MesaBloqueada:=True;
                                qNomReg:=TQuery.Create(Nil);
                                try   qNomReg.DataBaseName:=pObjeto.DataBaseName;
                                      qNomReg.SessionName:=pObjeto.SessionName;
                                      qNomReg.SQL.Text:=' SELECT DESC_REGION_CAMB as Descr FROM DI_REGION_CAMBIO '+
                                       '  WHERE ID_MESA_CAMBIO = '+ pIdMesa + ' AND ID_REGION_CAMBIO = '+ pIdRegion +
                                       '    AND SIT_REGION_CAMB = ''BL'' ';
                                      qNomReg.Open;
                                      NomReg:=qNomReg.fieldByName('DESCR').AsString;
                                      qNomReg.Close;
                                      finally qNomReg.Free;
                                      end;
                                MessageDlg('Región bloqueada : '+ NomReg ,mtError,[mbOK],0);
                             end
                        else begin
                                MesaBloqueada:=False;
                             end;
                        finally
                           if qReg <> nil then qReg.Free;
                        end;
                end;
      finally
         if qConsulta <> nil then qConsulta.free;
      end;
end;}
function MesaBloqueada(pObjeto:TInterFrame;pIdMesa : String): Boolean;
Var spMesaBloq  : TStoredProc;   vlResultado,vlDesResp : String; vlCodResp:Integer;
Begin
    spMesaBloq:=TStoredProc.Create(Nil);
    try
       spMesaBloq.DatabaseName:=pObjeto.Apli.DataBaseName;
       spMesaBloq.SessionName :=pObjeto.Apli.SessionName;
       spMesaBloq.StoredProcName:='PKGDIVISA2.STPREVISAACCESO';
       spMesaBloq.Params.CreateParam(ftString, 'PE_CVEUSR',  ptInput);
       spMesaBloq.Params.CreateParam(ftInteger,'PE_MESA',    ptInput);
       spMesaBloq.Params.CreateParam(ftString, 'PS_RESULTA', ptOutput);
       spMesaBloq.Params.CreateParam(ftInteger,'PS_CODRESP', ptOutput);
       spMesaBloq.Params.CreateParam(ftString, 'PS_DESCRESP',ptOutput);
       spMesaBloq.Params.ParamByName('PE_CVEUSR').AsString :=pObjeto.Apli.Usuario;
       spMesaBloq.Params.ParamByName('PE_MESA').AsInteger  :=StrToInt(pIdMesa);
       spMesaBloq.Prepare;
       spMesaBloq.ExecProc;
       vlResultado:=spMesaBloq.ParamByName('PS_RESULTA').AsString;
       vlCodResp  :=spMesaBloq.ParamByName('PS_CODRESP').AsInteger;
       vlDesResp  :=spMesaBloq.ParamByName('PS_DESCRESP').AsString;
       if vlCodResp<>0 then begin
          MesaBloqueada:=True;
          MessageDlg('Se detecto problema al revisar los accesos: '+ vlDesResp ,mtError,[mbOK],0);
       end
       else begin
          if (Trim(vlResultado)='') or (Trim(vlResultado)='BL') then begin
              MesaBloqueada:=True;
              MessageDlg(vlDesResp ,mtInformation,[mbOK],0);
          end;
          if (Trim(vlResultado)='AC') then begin
              MesaBloqueada:=False;
          end;
       end;
    finally spMesaBloq.free;
    end;
end;


function ProcesarTRV(pOperacion:String;pApli:TInterApli): Boolean;
Var qConsulta : TQuery;
    vlMesa : String;
begin //Si el usuario tiene una excepción, se salta la validación
      vlMesa:=IntToStr(UnidCambUsu(pApli));
      ProcesarTRV:=GetSql('SELECT Cve_Funcion From DI_PROD_OPER ' +
                          ' WHERE Cve_Operacion = ''' + pOperacion  + '''' +
                          '   and id_mesa_cambio = ' + vlMesa +
                          '   and Cve_Producto  = ''' + cProducTRV  + '''' +
                          '   and Cve_Funcion   = ''' + cProcInvTRV +''' ',
                          pApli.DataBaseName, pApli.SessionName, False);
end;

function AjecutaExpressCh:Boolean;
Var vlRutDatAMexDes,vlRutPrgAMexDes,
    vlRutDatAMexPrd,vlRutPrgAMexPrd,
    vlComando  : String;
    vlSystDir  : String;
    vlResult,i : Integer;
begin AjecutaExpressCh:=False;
      vlSystDir:='';
      for i:=1 to 100 do vlSystDir:=vlSystDir+' ';
      GetSystemDirectory(pchar(vlSystDir),100);
      vlSystDir:=Trim(vlSystDir);
      ObtenRutas(vlRutDatAMexDes,vlRutPrgAMexDes,vlRutDatAMexPrd,vlRutPrgAMexPrd);
      if ParamStr(1) = 'P'
      then vlComando:=vlRutPrgAMexPrd
      else vlComando:=vlRutPrgAMexDes;
      vlComando:=vlSystDir + '\command.com ' + vlSystDir + ' /P /E:1024 /C ' + vlComando;
      vlResult:=ProcessExecute(vlComando,sw_show,true);
      AjecutaExpressCh:=(vlResult=0);
end;

procedure ObtenRutas(Var pRutDatAMexDes:String;
                     Var pRutPrgAMexDes:String;
                     Var pRutDatAMexPrd:String;
                     Var pRutPrgAMexPrd:String);
Var vlPathApli:String;
    ArchIni   : TIniFile;
begin vlPathApli:=ExtractFileDir(Application.ExeName);
      ArchIni   :=TIniFile.Create(vlPathApli + '\DIVISAS.INI');
      try
        pRutPrgAMexDes:=ArchIni.ReadString('RUTAS','PROGRAMA DESARROLLO','');
        pRutDatAMexDes:=ArchIni.ReadString('RUTAS','DATOS DESARROLLO','');
        pRutPrgAMexPrd:=ArchIni.ReadString('RUTAS','PROGRAMA PRODUCCION','');
        pRutDatAMexPrd:=ArchIni.ReadString('RUTAS','DATOS PRODUCCION','');
      finally
        if ArchIni <> nil then ArchIni.Free;
      end;
end;

procedure ObtenRutasBOFA(Var pRutDatAMexDes:String;
                         Var pRutDatAMexPrd:String);
Var vlPathApli:String;
    ArchIni   : TIniFile;
begin vlPathApli:=ExtractFileDir(Application.ExeName);
      ArchIni   :=TIniFile.Create(vlPathApli + '\DIVISAS.INI');
      try
        pRutDatAMexDes:=ArchIni.ReadString('RUTAS','BOFA DESARROLLO','');
        pRutDatAMexPrd:=ArchIni.ReadString('RUTAS','BOFA PRODUCCION','');
      finally
        if ArchIni <> nil then ArchIni.Free;
      end;
end;


function GenArchAMEXCO(pIdContrato : Double; pApli:TInterApli):Boolean;
Var qConsulta : TQuery;
    vlArchivo : TextFile;
    vlRutDatAMexDes,vlRutPrgAMexDes,
    vlRutDatAMexPrd,vlRutPrgAMexPrd,
    vlNomArch,      vlSQL,
    vlMesa,vlCadena   : String;
    vlNombreCte:TStringList;
begin GenArchAMEXCO:=False;
      vlMesa := IntToStr(UnidCambUsu(pApli));
      ObtenRutas(vlRutDatAMexDes,vlRutPrgAMexDes,vlRutDatAMexPrd,vlRutPrgAMexPrd);
      qConsulta := TQuery.Create(Nil);
      if ParamStr(1) = 'P'
      then vlNomArch:=vlRutDatAMexPrd + 'BANKOUT.DAT'
      else vlNomArch:=vlRutDatAMexDes + 'BANKOUT.DAT';
      AssignFile(vlArchivo,vlNomArch);
      vlNombreCte:=TStringList.Create;
      Rewrite(vlArchivo);
      try qConsulta.DatabaseName:=pApli.DataBaseName;
          qConsulta.SessionName :=pApli.SessionName;
          vlSQL:='SELECT CTO.NOMBRE_CLIENTE, CTO.ID_CONTRATO, TRA.CVE_MONEDA, SUM(TRA.IMP_TRANS_PROD) AS IMPORTE' +
                 ' FROM DI_TRANSACCION TRA, DI_CONTRATO CTO ' +
                 ' WHERE TRA.CVE_PRODUCTO  IN(''' + cProducTRV + ''',''' +  cProducTRVEu + ''') AND ' +
                 '       TRA.ID_MESA_CAMBIO = ' + vlMesa + ' AND ' +
                 '       CTO.ID_MESA_CAMBIO = ' + vlMesa + ' AND ' +
                 '       TRA.Id_Contrato   = ' + FloatToStr(pIdContrato) + ' AND '+
                 '       TRA.CVE_OPERACION = ''V'' AND ' +
                 '       TRA.ID_CONTRATO   = CTO.ID_CONTRATO ' +
                 ' GROUP BY CTO.ID_CONTRATO,CTO.NOMBRE_CLIENTE, TRA.CVE_MONEDA';
          qConsulta.SQL.Text:=vlSQL;
          qConsulta.Open;
          while not qConsulta.eof do
          begin
               //Genera archivo de interfase de Travelers Cheques
               DameLineas(vlNombreCte,qConsulta.FieldByName('NOMBRE_CLIENTE').AsString,15);
               vlCadena:=vlNombreCte.Strings[0] + ',';
               vlCadena:=vlCadena + vlNombreCte.Strings[1] + ',,,,,,';
               vlCadena:=vlCadena + cTellerID   + ',';
               vlCadena:=vlCadena + qConsulta.FieldByName('ID_CONTRATO').AsString + ',';
               vlCadena:=vlCadena + cAccBalance + ',';
               vlCadena:=vlCadena + qConsulta.FieldByName('IMPORTE').AsString + ',';
               vlCadena:=vlCadena + cPayMethod  + ',';
               vlCadena:=vlCadena + cServSwitch + ',';
               vlCadena:=vlCadena + cProducTRV  + ',';
               vlCadena:=vlCadena + cCustomType + ',';
               vlCadena:=vlCadena + cSaleType   + ',';
               if qConsulta.FieldByName('CVE_MONEDA').AsString = cMonDolar
               then begin
                      vlCadena:=vlCadena + cSaleCurrUSD + ',';
                      vlCadena:=vlCadena + cPaymCurrUSD + ',';
                    end
               else if qConsulta.FieldByName('CVE_MONEDA').AsString = cMonEuro
                    then begin
                           vlCadena:=vlCadena + cSaleCurrEUR + ',';
                           vlCadena:=vlCadena + cPaymCurrUSD + ',';
                         end
                    else begin
                           vlCadena:=vlCadena + cSaleCurrUSD + ',';
                           vlCadena:=vlCadena + cPaymCurrUSD + ',';
                         end;
               vlCadena:=vlCadena + '0';
               Writeln(vlArchivo,vlCadena);
               qConsulta.Next;
          end;
          qConsulta.Close;
          GenArchAMEXCO:=True;
      finally if qConsulta <> nil then qConsulta.free;
              CloseFile(vlArchivo);
              if vlNombreCte <> nil then vlNombreCte.free;
      end;
end;

function GeneraArchBOFA(pFecha : TDateTime;pApli : TInterApli):Boolean;
Var qConsulta : TQuery;
    vlArchivo : TextFile;
    vlRutDatAMexDes,
    vlRutDatAMexPrd,
    vlNomArch, vlSQL,
    vlCadena,
    vlSecuencia: String;
    vlNumreg,
    vlImpTotal :Double;
    vlFechaOper:TDateTime;

begin //Genera Archivo de Interfase con Bank of America
      GeneraArchBOFA:=False;
      ObtenRutasBOFA(vlRutDatAMexDes,vlRutDatAMexPrd);
      qConsulta := TQuery.Create(Nil);
      if ParamStr(1) = 'P'
      then vlNomArch:=vlRutDatAMexPrd + 'BATINTER.TXT'
      else vlNomArch:=vlRutDatAMexDes + 'BATINTER.TXT';
      AssignFile(vlArchivo,vlNomArch);
      Rewrite(vlArchivo);
      vlSecuencia:='01';  //Parametrizar en DI_PARAMETRO
      vlNumreg:=0;
      vlImpTotal:=0;
      try qConsulta.DatabaseName:=pApli.DataBaseName;
          qConsulta.SessionName :=pApli.SessionName;
          vlSQL:='SELECT TRA.*' +
                 ' FROM DI_TRANSACCION TRA' +
                 ' WHERE TRA.CVE_PRODUCTO  IN (''DA'',''D2'',''D4'',''DAL'',''DL2'',''DL4'') AND ' +
                 '       TRA.F_LIQUIDACION = TO_DATE('''   +FormatdateTime('DD/MM/YYYY',pFecha) + ''',''DD/MM/YYYY'') AND '+
                 '       TRA.CVE_OPERACION = ''V''  AND ' +
                 '       TRA.SIT_TRANSFER  = ''VV'' AND ' +
                 '       TRA.CVE_CUENTA    = ''BOF'' ';
          qConsulta.SQL.Text:=vlSQL;
          qConsulta.Open;
          while not qConsulta.eof do
          begin  //Genera archivo de interfase de
                 vlfechaOper:=qConsulta.FieldByname('F_LIQUIDACION').AsDatetime;
                 vlNumreg:=vlNumreg+1;
                 vlCadena:='BATINTER.TXT ' + FormatDateTime('',vlfechaOper) +
                           ' ' + vlSecuencia + ' ' + 'INTERFASE BOFA';   Writeln(vlArchivo,vlCadena);
                 vlCadena:='*ENDMSG*';                                   Writeln(vlArchivo,vlCadena);
                 vlCadena:='FROM:/DD-6290825588';                        Writeln(vlArchivo,vlCadena);  //PARAMETRIZAR ESTE NUMERO
                 vlCadena:='     BANCO INTERACCIONES S.A.';              Writeln(vlArchivo,vlCadena);
                 vlCadena:='     PASEO DE LA REFORMA NO. 383 PISO 14';   Writeln(vlArchivo,vlCadena);
                 vlCadena:='     COL. CUAUHTEMOC, 06500 MEXICO DF';      Writeln(vlArchivo,vlCadena);
                 vlCadena:='TO:  /NA-MTNA';                              Writeln(vlArchivo,vlCadena);
                 vlCadena:='     BANK OF AMERICA';                       Writeln(vlArchivo,vlCadena);
                 vlCadena:='     CONCORD CALIFORNIA';                    Writeln(vlArchivo,vlCadena);
                 vlCadena:='DATE:' + FormatDateTime('YYMMDD',vlFechaOper); Writeln(vlArchivo,vlCadena);
                 vlCadena:='';                                           Writeln(vlArchivo,vlCadena);
                 vlCadena:='::100 CUSTOMER TRANSFER';                    Writeln(vlArchivo,vlCadena);
                 vlCadena:='PLEASE PLAY';                                Writeln(vlArchivo,vlCadena);
                 vlCadena:='';                                           Writeln(vlArchivo,vlCadena);
                 vlCadena:=':15 TEST KEY';                               Writeln(vlArchivo,vlCadena);
                 vlCadena:='';                                           Writeln(vlArchivo,vlCadena);
                 vlCadena:=':20 SENDERS REF:TEST 1';                     Writeln(vlArchivo,vlCadena);
                 vlCadena:='';                                           Writeln(vlArchivo,vlCadena);
                 vlCadena:=':30 VALUE DATE:' + FormatDateTime('YYMMDD',vlFechaOper) +
                           ' ' + FormatDateTime('DDMMMYY',vlFechaOper);  Writeln(vlArchivo,vlCadena);
                 vlCadena:=':32 AMOUNT:';                                Writeln(vlArchivo,vlCadena);
                 vlCadena:='USD ' + FormatFloat('0.00',qConsulta.fieldByName('IMP_TRANS_PROD').AsFloat) ;
                 vlImpTotal:=vlImpTotal+qConsulta.fieldByName('IMP_TRANS_PROD').AsFloat;
                                                                         Writeln(vlArchivo,vlCadena);
                 vlCadena:='';                                           Writeln(vlArchivo,vlCadena);
                 vlCadena:=':50 ORIGINATOR:';                            Writeln(vlArchivo,vlCadena);
                 vlCadena:='BANCO INTERACCIONES, S.A.';                  Writeln(vlArchivo,vlCadena);
                 vlCadena:='PASEO DE LA REFORMA NO. 383 PISO 14';        Writeln(vlArchivo,vlCadena);
                 vlCadena:='COL. CUAUHTEMOC, 06500 MEXICO DF';           Writeln(vlArchivo,vlCadena);
                 vlCadena:=':53D REIMBURSEMENT:6290825588';              Writeln(vlArchivo,vlCadena);  //PARAMETRIZAR ESTE NUMERO
                 vlCadena:='BANCO INTERACCIONES, S.A.';                  Writeln(vlArchivo,vlCadena);
                 vlCadena:='PASEO DE LA REFORMA NO. 383 PISO 14';        Writeln(vlArchivo,vlCadena);
                 vlCadena:='COL. CUAUHTEMOC, 06500 MEXICO DF';           Writeln(vlArchivo,vlCadena);
                 vlCadena:=':57D PAY THRU:/FW-312276470';                Writeln(vlArchivo,vlCadena);  //PARAMETRIZAR ESTE NUMERO
                 vlCadena:='WHITE SANDS FEDERAL CREDIT UNION';           Writeln(vlArchivo,vlCadena); //?????
                 vlCadena:='LAS CRUCES, NEW MEXICO';                     Writeln(vlArchivo,vlCadena); //?????
                 vlCadena:=':59 BENEFICIARY:/DD-' + qConsulta.fieldByName('CTA_BENEFICIARIO').AsString;
                                                                         Writeln(vlArchivo,vlCadena);
                 vlCadena:=qConsulta.fieldByName('DESC_BENEF').AsString; Writeln(vlArchivo,vlCadena);
                 vlCadena:=':70 BENEF INFO:';                            Writeln(vlArchivo,vlCadena);
                 vlCadena:=qConsulta.fieldByName('TX_REFERENCIA').AsString;Writeln(vlArchivo,vlCadena);
                 vlCadena:='*ENDMSG*';                                     Writeln(vlArchivo,vlCadena);
                 vlSQL:='UPDATE DI_TRANSACCION SET SIT_TRANSFER = ''EV'' WHERE ID_TRANSACCION = ' + qConsulta.fieldByName('ID_TRANSACCION').AsString;
                 runsql(vlSQL,pApli.Databasename,pApli.sessionName,True);
                 qConsulta.Next;
          end;
          vlImpTotal:=vlImpTotal*100;
          vlImpTotal:=Trunc(vlImpTotal);
          vlCadena:='*ENDFILE* ' +  FormatFloat('000000',vlNumReg)
                                 +  FormatFloat('0000000000000000',vlImpTotal);  Writeln(vlArchivo,vlCadena);
          qConsulta.Close;
          GeneraArchBOFA:=True;
      finally if qConsulta <> nil then qConsulta.free;
              CloseFile(vlArchivo);
      end;
end;

function ObtenCuenta(pApli:TInterapli;pCveproducto:String;pCveMoneda : Double):String;
Var qConsulta : TQuery;
    vlSQL     : String;
    vlMesa    : String;
begin ObtenCuenta:='';
      vlMesa:=IntToStr(UnidCambUsu(pApli));
      qConsulta := TQuery.Create(Nil);
      try qConsulta.DatabaseName:=pApli.Databasename;
          qConsulta.SessionName :=pApli.SessionName;
          vlSQl:='SELECT CVE_CUENTA ' +
                 '  FROM DI_PROD_CTA_MON ' +
                 ' WHERE CVE_PRODUCTO   = ''' + pCveProducto + ''' AND ' +
                 '       CVE_MONEDA     =   ' + FloatToStr(pCveMoneda) + ' AND ' +
                 '       ID_MESA_CAMBIO = ' + vlMesa;
          qConsulta.sql.text:=vlSQl;
          qConsulta.Open;
          ObtenCuenta:=qConsulta.FieldByName('CVE_CUENTA').AsString;
          qConsulta.Close;
      finally qConsulta.free;
      end;
end;

Procedure SeparaStrenDos(vlImpLetra : String; Var ImpLetra1,ImpLetra2 : String);
Var
  vlPosMed    : integer;
  vlContinua  : Boolean;
  vlImpLetra1 : String;
  vlImpLetra2 : String;
  vlTamano    : integer;
  i           : integer;
  vlPosIni    : Integer;

begin
      // Carga la cantidad en dos lineas
      vlTamano    := length(vlImpLetra);
      if vlTamano > 100 then
      begin
        vlPosMed := 100;
        vlContinua := true;
        while vlContinua do
        begin
          if (vlImpLetra[vlPosMed] = ' ') or (vlPosMed = 1) then
            vlContinua := false
          else
            vlPosMed := vlPosMed - 1;
        end;
        vlImpLetra1 := copy(vlImpLetra,1,vlPosMed - 1);
        vlImpLetra2 := copy(vlImpLetra,(vlPosMed + 1),
                       (Length(vlImpLetra) - vlPosMed));
        ImpLetra2 := '****************************************************';
        vlPosIni  := TRUNC((102 - length(vlImpLetra2)) / 2) + 1;
        ImpLetra2 := copy((copy(ImpLetra2,1,vlPosIni - 1) + vlImpLetra2 +
                 '****************************************************'),1,102);
      end
      else
      begin
        vlImpLetra1 := vlImpLetra;
        ImpLetra2 := chr(32);
        For i := 1 to 102 do
            ImpLetra2 := ImpLetra2 + Copy(ImpLetra2,1,1);
      end;

      ImpLetra1 := '****************************************************';
      vlPosIni    := TRUNC((102 - length(vlImpLetra1)) / 2) + 1;
      ImpLetra1 := copy((copy(ImpLetra1,1,vlPosIni - 1) + vlImpLetra1 +
                 '****************************************************'),1,102);
end;

function LiberaCheqICB(pObjeto:TInterFrame):Boolean;
begin //Si el usuario tiene una excepción, libera cheques de ICB
      if GetSql('SELECT Cve_Oper_acc From Secu_Oper_Acc ' +
                ' WHERE Cve_Funcion = ''CLASE_TLIBCHEQCA'' ' +
                '   and Cve_Usuario = ''' + pObjeto.Apli.Usuario     + '''' +
                '   and Cve_Oper_Acc= ''LC''',
                pObjeto.Apli.DataBaseName, pObjeto.Apli.SessionName, False)
      then LiberaCheqICB:=True
      else LiberaCheqICB:=False;
end;

function EsMovCajCanc(pFol_Mov_Caj:Double; pImpMovto:Double; pApli:TInterApli): Boolean;
Var qConsulta : TQuery;
    vlSQL     : String;
begin //Si el usuario tiene una excepción, se salta la validación
      vlSQL:='SELECT * FROM SC_RECEP_CAJA ' +
             ' WHERE Id_Empresa     = 1 ' +
             '   and Cve_Medio      = ''CCAMB'' ' +
             '   and F_Operacion    = TO_DATE(''' + FormatDateTime('DD/MM/YYYY',pApli.DameFechaEmpresa) + ''',''DD/MM/YYYY'')' +
             '   and fol_movto_caja = ' + FloatToStr(pFol_Mov_Caj) +
             '   and Imp_Movto      = ' + FloatToStr(pImpMovto)    +
             '   and Sit_Movto_Recep= ''CA'' ';
      if GetSql(vlSQL,pApli.DataBaseName, pApli.SessionName, False)
      then EsMovCajCanc:=True
      else EsMovCajCanc:=False;
end;


function UnidCambUsu(pApli:TInterApli): Integer;
Var qConsulta : TQuery;
    vlSQL     : String;
begin //Si el usuario tiene una excepción, se salta la validación
      vlSQL:='SELECT UNI.ID_MESA_CAMBIO ' +
             '  FROM DI_UNIDAD_CAMBIO UNI, DI_MESA_CAMBIO MES ' +
             ' WHERE UNI.ID_MESA_CAMBIO = MES.ID_MESA_CAMBIO AND ' +
             '       UNI.CVE_USUARIO    = ''' +  pApli.Usuario +  ''' AND ' +
             '       MES.ID_EMPRESA     =   ' +  IntToStr(pApli.IdEmpresa);
      qConsulta := tQuery.Create(Nil);
      try qConsulta.Databasename:=pApli.DataBaseName;
          qConsulta.SessionName:=pApli.SessionName;
          qConsulta.SQL.Text:=vlSQL;
          qConsulta.Open;
          if qConsulta.IsEmpty
          then UnidCambUsu:=-1
          else UnidCambUsu:=qConsulta.FieldByName('ID_MESA_CAMBIO').AsInteger;
          qConsulta.Close;
      finally qConsulta.free;
      end;
end;

function ObtenNomEmpresa(pApli:TInterApli):String;
Var qConsulta : TQuery;
    vlSQL     : String;
begin //Si el usuario tiene una excepción, se salta la validación
      vlSQL:='SELECT NOMBRE' +
             '  FROM PERSONA ' +
             ' WHERE ID_PERSONA = ' + IntToStr(pApli.idEmpresa);
      qConsulta := tQuery.Create(Nil);
      try qConsulta.Databasename:=pApli.DataBaseName;
          qConsulta.SessionName:=pApli.SessionName;
          qConsulta.SQL.Text:=vlSQL;
          qConsulta.Open;
          if qConsulta.IsEmpty
          then ObtenNomEmpresa:='<<<<EMPRESA INEXISTENTE>>>>'
          else ObtenNomEmpresa:=qConsulta.FieldByName('NOMBRE').AsString;
          qConsulta.Close;
      finally qConsulta.free;
      end;
end;

function ObtMonedaMesa(pApli:TInterApli; pMesa : String):String;
Var qConsulta : TQuery;
    vlSQL     : String;
begin //Si el usuario tiene una excepción, se salta la validación
      vlSQL:='SELECT  CVE_MONEDA_DEF ' +
             '  FROM DI_MESA_CAMBIO ' +
             ' WHERE ID_MESA_CAMBIO = ' + pMesa;
      qConsulta := tQuery.Create(Nil);
      try qConsulta.Databasename:=pApli.DataBaseName;
          qConsulta.SessionName:=pApli.SessionName;
          qConsulta.SQL.Text:=vlSQL;
          qConsulta.Open;
          if qConsulta.IsEmpty
          then ObtMonedaMesa:=''
          else ObtMonedaMesa:=qConsulta.FieldByName('CVE_MONEDA_DEF').AsString;
          qConsulta.Close;
      finally qConsulta.free;
      end;
end;


function ObtDescMoneda(pApli:TInterApli; pMoneda : String):String;
Var qConsulta : TQuery;
    vlSQL     : String;
begin //Si el usuario tiene una excepción, se salta la validación
      vlSQL:='SELECT  DESC_MONEDA ' +
             '  FROM MONEDA ' +
             ' WHERE CVE_MONEDA = ' + pMoneda;
      qConsulta := tQuery.Create(Nil);
      try qConsulta.Databasename:=pApli.DataBaseName;
          qConsulta.SessionName:=pApli.SessionName;
          qConsulta.SQL.Text:=vlSQL;
          qConsulta.Open;
          if qConsulta.IsEmpty
          then ObtDescMoneda:=''
          else ObtDescMoneda:=qConsulta.FieldByName('DESC_MONEDA').AsString;
          qConsulta.Close;
      finally qConsulta.free;
      end;
end;

//Busca la impresora de acuerdo al usuario, la empresa y la mesa de cambio
function BuscaImpresora(pMesa : String; pApli:TInterApli): String;
Var qConsulta : TQuery;
    vlSQL     : String;
begin BuscaImpresora:='';
      //Si el usuario tiene una excepción, se salta la validación
      vlSQL:='SELECT UNI.IMPRESORA_CTO ' +
             '  FROM DI_UNIDAD_CAMBIO UNI' +
             ' WHERE UNI.ID_MESA_CAMBIO = '   +  pMesa  +  ' AND ' +
             '       UNI.CVE_USUARIO    = ''' +  pApli.Usuario +  '''';
      qConsulta := tQuery.Create(Nil);
      try qConsulta.Databasename:=pApli.DataBaseName;
          qConsulta.SessionName:=pApli.SessionName;
          qConsulta.SQL.Text:=vlSQL;
          qConsulta.Open;
          if Not qConsulta.IsEmpty
          then BuscaImpresora:=qConsulta.FieldByName('IMPRESORA_CTO').AsString;
          qConsulta.Close;
      finally qConsulta.free;
      end;
end;

//Establece la impresora del reporte de acuerdo al String recibido
Function EstableceImpresora(pImpresora : String): Integer;
Var i,j,k,posic: Integer;
    cadena2 : String;
    vlImpresora: TPrinter;
begin
    EstableceImpresora:=-1;
    vlImpresora:=Tprinter.Create;
    k:=vlImpresora.Printers.Count-1;
    j:=-1;
    for i:=0 to k do
    begin
        Cadena2:=Trim(UPPERCASE(vlImpresora.Printers.Strings[i]));
        posic:= Pos(TRIM(UPPERCASE(pImpresora)), Cadena2);
        if posic > 0 then
          begin
             j:=i;
             break;
          end;
    end;
    EstableceImpresora:=j;
    vlImpresora.free;
end;


//Busca el nombre del promotor default
procedure AsignaPromDef(pObjeto:TInterFrame;pMesaCambio:String);
Var qConsulta : TQuery;
    vlSQL     : String;
    vlPersona : String;
begin if pMesaCambio = '1'
      then vlPersona :=cPromCCDef
      else vlPersona :=cPromMTDef;

      //Si el usuario tiene una excepción, se salta la validación
      vlSQL:='SELECT NOMBRE ' +
             '  FROM PERSONA' +
             ' WHERE ID_PERSONA = ' + vlPersona;
      qConsulta := tQuery.Create(Nil);
      try qConsulta.Databasename:=pObjeto.Apli.DataBaseName;
          qConsulta.SessionName:=pObjeto.Apli.SessionName;
          qConsulta.SQL.Text:=vlSQL;
          qConsulta.Open;
          if Not qConsulta.IsEmpty
          then begin
                 pObjeto.FieldByName('NOM_PROMOTOR').AsString  :=qConsulta.FieldByName('NOMBRE').AsString;
                 pObjeto.FieldByName('ID_PROMOT_ASOC').AsString:=vlPersona;
               end;
          qConsulta.Close;
      finally qConsulta.free;
      end;
end;


//Verifica si el usuario recaptura importes
function RecapturaImp(pApli : TInterApli): Boolean;
Var qConsulta : TQuery;
    vlSQL     : String;
    vlPersona : String;
begin RecapturaImp:=True;

      //Si el usuario tiene una excepción, se salta la validación
      vlSQL:=' SELECT Cve_Oper_acc From Secu_Oper_Acc ' +
             ' WHERE Cve_Funcion = ''' + pApli.LastFuncion + '''' +
             ' and Cve_Usuario = '''+ pApli.Usuario + '''' +
             ' and Cve_Oper_Acc = ''NR''';

      qConsulta := tQuery.Create(Nil);
      try qConsulta.Databasename:=pApli.DataBaseName;
          qConsulta.SessionName :=pApli.SessionName;
          qConsulta.SQL.Text    :=vlSQL;
          qConsulta.Open;
          if qConsulta.IsEmpty
          then RecapturaImp:=True
          else RecapturaImp:=False;
          qConsulta.Close;
      finally qConsulta.free;
      end;
end;

Procedure Imprime_Factura(p_Apli:TInterApli;p_Contrato: String; p_TipoImpresora: TTipoImpresora);
// MARA4356 FEBRERO 2006 SE MODIFICA PROCEDIMIENTO PARA IMPRIMIR FACTURA EN DOS IMPRESORAS
var qContrato,
    qOper,
    qLiquidacion : TQuery;
    vlSQL, vlDestino, vlDestino2, vlDestino3, vlDestino4,
    vlMesa,vlCondCanc:String;
    vlImpreso:Boolean;
//    vlIndex, vlIndex2, vlIndex3, vlIndex4  : Integer;
    vlIndex, vlIndex2, vlIndex3, vlIndex4  : Integer;
begin qContrato   :=tQuery.Create(Nil);
      qOper       :=tQuery.Create(Nil);
      qLiquidacion:=tQuery.Create(Nil);
      vlImpreso:=False;
      vlMesa:=IntToStr(UnidCambUsu(p_Apli));
      try
      qContrato.Databasename:=p_Apli.Databasename;
      qContrato.SessionName :=p_Apli.SessionName;
      //RAST
      qContrato.SQL.Text:=
       ' SELECT DI_CONTRATO.ID_CONTRATO, ' +
       ' DI_CONTRATO.ID_CLIENTE, ' +
       ' DI_CONTRATO.NOMBRE_CLIENTE, ' +
       ' DI_CONTRATO.CVE_MONEDA_BASE, ' +
       ' DI_CONTRATO.F_OPERACION, ' +
       ' DI_CONTRATO.F_LIQUIDACION, ' +
       ' DI_CONTRATO.SIT_CONTRATO, ' +
       ' DI_CONTRATO.TX_COMENTARIO, ' +
       ' PERSONA.ID_PERSONA, ' +
       ' (SELECT RTRIM (rfc.siglas_rfc)  || RTRIM (rfc.f_rfc) || RTRIM (rfc.homoclave_rfc) FROM RFC WHERE persona.ID_PERSONA = RFC.ID_PERSONA) AS RFCT, ' +
       ' DI_CLIENTE.B_IMPR_DOMIC, ' +
       ' DOMICILIO.CALLE_NUMERO , ' +
       ' ( DOMICILIO.COLONIA || '',''|| CIUDAD.DESC_POBLACION ) DOMIC1, ' +
       ' ( ESTADO.DESC_POBLACION || '',''|| POBLACION.DESC_POBLACION ) DOMIC2, ' +
       ' DOMICILIO.CODIGO_POSTAL , ' +
       ' (SELECT SERIE FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) SERIE, ' +
       ' (SELECT FOLIO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) FOLIO, ' +
       ' (SELECT FECHA_CREACION FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) FECHA_CREACION, ' +
       ' (SELECT ANO_APROBACION FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) ANO_APROBACION, ' +
       ' (SELECT NUM_APROBACION FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) NUM_APROBACION, ' +
       ' (SELECT CERTIFICADO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) CERTIFICADO, ' +
       ' (SELECT SELLO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) SELLO, ' +
       ' (SELECT CADENA FROM RFE_COMPROBANTE RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) CADENA, ' +
       ' (SELECT TIPO_CAMBIO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) TIPO_CAMBIOS, ' +
       ' (SELECT METODO_PAGO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) METODO_PAGO, ' +
       ' (SELECT CUENTA FROM RFE_COMPROBANTE  WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) CUENTA, ' +
       ' (SELECT NOM_PAIS_EX FROM RFE_EMISOR WHERE RFE_EMISOR.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) NOM_PAIS_EX, ' +
       ' (SELECT NOM_ESTADO_EX FROM RFE_EMISOR WHERE RFE_EMISOR.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) NOM_ESTADO_EX, ' +
            ' (SELECT DESC_MONEDA FROM RFE_COMPROBANTE  WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) DESC_MONEDA, ' +
       ' (SELECT REGIMEN FROM RFE_EMISOR  WHERE RFE_EMISOR.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) REGIMEN ' +
  ' FROM DI_CONTRATO , POBLACION ESTADO, ' +
       ' DOMICILIO , POBLACION, ' +
       ' POBLACION CIUDAD, PERSONA, DI_CLIENTE ' +
  ' WHERE ' +
          ' (DI_CONTRATO.ID_CLIENTE     = PERSONA.ID_PERSONA)  AND ' +
          ' (DI_CONTRATO.ID_MESA_CAMBIO =  ' + vlMesa + ') AND ' +
          ' (DI_CLIENTE.ID_PERSONA      = DI_CONTRATO.ID_CLIENTE)     AND ' +
          ' (PERSONA.ID_DOMICILIO       = DOMICILIO.ID_DOMICILIO)     AND ' +
          ' ( PERSONA.ID_DOMICILIO      = DOMICILIO.ID_DOMICILIO(+))  AND ' +
          ' ( DOMICILIO.CVE_PAIS        = POBLACION.CVE_POBLACION(+)) AND ' +
          ' ( DOMICILIO.CVE_ESTADO      = ESTADO.CVE_POBLACION(+))    AND ' +
	  ' ( DOMICILIO.CVE_CIUDAD      = CIUDAD.CVE_POBLACION(+))    AND ' +
          ' ( DI_CONTRATO.ID_CONTRATO   =  ' + p_Contrato + ') AND ';

      {'SELECT DI_CONTRATO.ID_CONTRATO,' +
                         ' DI_CONTRATO.ID_CLIENTE,' +
                         ' DI_CONTRATO.NOMBRE_CLIENTE,  ' +
                         ' DI_CONTRATO.CVE_MONEDA_BASE, ' +
                         ' DI_CONTRATO.F_OPERACION,     ' +
                         ' DI_CONTRATO.F_LIQUIDACION,   ' +
                         ' DI_CONTRATO.SIT_CONTRATO,    ' +
                         ' DI_CONTRATO.TX_COMENTARIO,   ' +
                         ' PERSONA.ID_PERSONA,          ' +
                         ' RTRIM(RFC.SIGLAS_RFC) || RTRIM(RFC.F_RFC) || RTRIM(RFC.HOMOCLAVE_RFC) AS RFCT,' +
                         ' DI_CLIENTE.B_IMPR_DOMIC,     ' +
                         ' DOMICILIO.CALLE_NUMERO ,     ' +
                         ' ( DOMICILIO.COLONIA || '','' || CIUDAD.DESC_POBLACION ) DOMIC1, ' +
                         ' ( ESTADO.DESC_POBLACION || '','' || POBLACION.DESC_POBLACION ) DOMIC2, ' +
                         // EIB2AARJ : 18 nov 2010 Se incluyen nuevos campos para imprimir los campos de FE
                         //'   DOMICILIO.CODIGO_POSTAL ' +
                         ' DOMICILIO.CODIGO_POSTAL ,' +
                         ' RC.SERIE, RC.FOLIO, RC.FECHA_CREACION , RC.ANO_APROBACION, RC.NUM_APROBACION, RC.CERTIFICADO, RC.SELLO, RC.CADENA '+
                         'FROM DI_CONTRATO , POBLACION ESTADO, ' +
                         '     DOMICILIO , POBLACION, ' +
                         '     POBLACION CIUDAD, PERSONA, DI_CLIENTE, ' +
                         // EIB2AARJ : 18 nov 2010  se referencia a la tabla donde se generan los datos de FE RFE_COMPROBANTE
                         //'     RFC ' +
                         '     RFC , RFE_COMPROBANTE RC ' +
                         'WHERE (DI_CONTRATO.ID_CLIENTE     = PERSONA.ID_PERSONA)  AND ' +
                         '      (RFC.ID_PERSONA             (+)= PERSONA.ID_PERSONA)  AND ' +
                         '      (DI_CONTRATO.ID_MESA_CAMBIO = ' + vlMesa + ') AND ' +
                         '      (DI_CLIENTE.ID_PERSONA      = DI_CONTRATO.ID_CLIENTE)     AND ' +
                         '      (PERSONA.ID_DOMICILIO       = DOMICILIO.ID_DOMICILIO)     AND ' +
                         '      ( PERSONA.ID_DOMICILIO      = DOMICILIO.ID_DOMICILIO(+))  AND ' +
                         '      ( DOMICILIO.CVE_PAIS        = POBLACION.CVE_POBLACION(+)) AND ' +
                         '      ( DOMICILIO.CVE_ESTADO      = ESTADO.CVE_POBLACION(+))    AND ' +
                         '      ( DOMICILIO.CVE_CIUDAD      = CIUDAD.CVE_POBLACION(+))    AND ' +
                         // EIB2AARJ : 18 nov 2010
                         //'      ( DI_CONTRATO.ID_CONTRATO   = ' + p_Contrato + ')';
                         '      ( DI_CONTRATO.ID_CONTRATO   = ' + p_Contrato + ') AND ' +
                         '      ( DI_CONTRATO.ID_CONTRATO = RC.ID_CONTRATO(+) ) ' ;
                                 }
     qContrato.Open;

     if qContrato.FieldByName('SIT_CONTRATO').AsString = 'CA'
     then vlCondCanc:=' AND DI_TRANSACCION.CVE_OPERACION IN (''CC'',''CV'',''CCT'',''CVT'')'
     else vlCondCanc:='';


     qOper.Databasename:=p_Apli.Databasename;
     qOper.SessionName :=p_Apli.SessionName;
     qOper.SQL.Text:='SELECT DI_TRANSACCION.ID_CONTRATO,    ' +
                     '       DI_TRANSACCION.F_OPERACION,    ' +
                     '       DI_TRANSACCION.F_LIQUIDACION,  ' +
                     '       DI_TRANSACCION.CVE_MONEDA,     ' +
                     '       DI_TRANSACCION.CVE_OPERACION,  ' +
                     '       DI_TRANSACCION.IMP_TRANS_MN,   ' +
                     '       DI_TRANSACCION.IMP_TRANS_PROD, ' +
                     '       DI_TRANSACCION.TC_OPERACION,   ' +
                     '       DI_TRANSACCION.TX_COMENTARIO,  ' +
                     '       DI_TRANSACCION.DESC_BENEF,     ' +
                     '       DI_TRANSACCION.CTA_BENEFICIARIO, ' +
                     '       DI_TRANSACCION.NOMBRE_BCO_BENEF, ' +
                     '       DI_TRANSACCION.ABA,          ' +
                     '       DI_OPERACION.DESC_L_ID_PRIM AS DESCOPER, ' +
                     '       DI_PRODUCTO.DESC_L_ID_PRIM AS DESCPROD,  ' +
                     '       MONEDA.DESC_MONEDA,          ' +
                     '       DI_TRANSACCION.CVE_PRODUCTO  ' +
                     ' FROM DI_TRANSACCION , DI_OPERACION,' +
                     '      DI_PRODUCTO, MONEDA ' +
                     ' WHERE (DI_TRANSACCION.CVE_PRODUCTO  = DI_PRODUCTO.CVE_PRODUCTO)   AND ' +
                     '       (DI_TRANSACCION.CVE_OPERACION = DI_OPERACION.CVE_OPERACION) AND ' +
                     '       (DI_TRANSACCION.ID_MESA_CAMBIO= ' + vlMesa + ') AND ' +
                     '       (DI_PRODUCTO.ID_MESA_CAMBIO   = ' + vlMesa + ') AND ' +
                     '       (DI_TRANSACCION.CVE_MONEDA    = MONEDA.CVE_MONEDA) AND  ' +
                     '       (DI_TRANSACCION.ID_CONTRATO   = ' +  p_Contrato   + ') AND ' +
                     '       (DI_TRANSACCION.CVE_MONEDA   <> ' +  qContrato.FieldByName('CVE_MONEDA_BASE').AsString +
                     '       )' + vlCondCanc +
                     ' ORDER BY DI_TRANSACCION.ID_TRANSACCION ';
     qOper.Open;

     qLiquidacion.Databasename:=p_Apli.Databasename;
     qLiquidacion.SessionName :=p_Apli.SessionName;
     qLiquidacion.SQL.Text:='SELECT DI_TRANSACCION.ID_CONTRATO,  ' +
                            '       DI_TRANSACCION.F_OPERACION,  ' +
                            '       DI_TRANSACCION.CVE_PRODUCTO, ' +
                            '       DI_TRANSACCION.ID_GPO_TRANS, ' +
                            '       DI_TRANSACCION.F_LIQUIDACION,' +
                            '       DI_TRANSACCION.CVE_MONEDA,   ' +
                            '       DI_TRANSACCION.CVE_OPERACION,' +
                            '       DI_TRANSACCION.IMP_TRANS_MN, ' +
                            '       DI_TRANSACCION.IMP_TRANS_PROD,' +
                            '       DI_TRANSACCION.TC_OPERACION,  ' +
                            '       DI_TRANSACCION.TX_COMENTARIO, ' +
                            '       DI_PRODUCTO.DESC_L_ID_PRIM AS DESCPROD,   ' +
                            '       DI_OPERACION.DESC_L_ID_PRIM AS DESCOPER   ' +
                            ' FROM DI_TRANSACCION , DI_OPERACION,  ' +
                            ' DI_PRODUCTO ' +
                            ' WHERE (DI_TRANSACCION.CVE_OPERACION = DI_OPERACION.CVE_OPERACION)  AND ' +
                            '       (DI_TRANSACCION.CVE_PRODUCTO  = DI_PRODUCTO.CVE_PRODUCTO)    AND  ' +
                            '       (DI_TRANSACCION.ID_MESA_CAMBIO= ' + vlMesa + ') AND ' +
                            '       (DI_PRODUCTO.ID_MESA_CAMBIO   = ' + vlMesa + ') AND ' +
                            '       (DI_TRANSACCION.ID_CONTRATO   = ' +  p_Contrato + ') AND  ' +
                            '       (DI_TRANSACCION.CVE_MONEDA   = ' + qContrato.FieldByName('CVE_MONEDA_BASE').AsString + ')' +
                             vlCondCanc +
                            ' ORDER BY DI_TRANSACCION.ID_TRANSACCION ';
    qLiquidacion.Open;
//    vlDestino:=BuscaImpresora(vlMesa,p_Apli.Apli);
    BuscaImpresora2(vlMesa, p_Contrato, vlDestino, vlDestino2, vlDestino3, vlDestino4, p_Apli); //mara4356 febrero 2006
//    if vlDestino <> '' then
    if (vlDestino <> '') and (vlDestino2 <> '') then
    begin
      case p_TipoImpresora of
        cFacturaMatriz : if vlDestino = cImprDivisas then
                            vlImpreso:=ImprimeFactura(qContrato, qOper, qLiquidacion)
                         else begin
                            vlIndex:=EstableceImpresora(vlDestino);
                            vlIndex2:=EstableceImpresora(vlDestino2);
                            //vlIndex3:=EstableceImpresora(vlDestino3);
                            //vlIndex4:=EstableceImpresora(vlDestino4);
                            if (vlIndex <> -1) and (vlIndex2 <> -1) then
                               vlImpreso:=Execute_ImpCompDiv(p_Apli,qContrato,qOper,qLiquidacion,vlIndex, vlIndex2,vlIndex3,vlIndex4) // Unidad: UnQrComDiv 2 de 4
                            else
                              MessageDlg('No se pudo asignar las impresoras : '+vlDestino+', '+vlDestino2+
                                         ', '+vlDestino3+', '+vlDestino4,mtError,[mbOK],0);    //mara4356
                         end;
       cFacturaLaser : Begin
                         vlIndex:=EstableceImpresora(vlDestino);
                         vlIndex2:=EstableceImpresora(vlDestino2);
                         vlIndex3:=EstableceImpresora(vlDestino3);
                         vlIndex4:=EstableceImpresora(vlDestino4);
                         if ((vlIndex <> -1) and (vlIndex2 <> -1)) OR (vlIndex3<> -1) then
                            vlImpreso:=Execute_ImpCompDiv(p_Apli,qContrato,qOper,qLiquidacion,vlIndex,vlIndex2,vlIndex3,vlIndex4) // Unidad: UnQrComDiv 3 de 4
                         else
                              MessageDlg('No se pudo asignar las impresoras : '+vlDestino+', '+vlDestino2+
                                         ', '+vlDestino3+', '+vlDestino4,mtError,[mbOK],0);    //mara4356
                       end;
      end;

      if vlImpreso then begin
         vlSQL:='UPDATE DI_CONTRATO SET B_IMPR_FACT = ''V'', NUM_IMPR_FACT = NUM_IMPR_FACT + 1 WHERE ID_CONTRATO=' + p_Contrato;
         Runsql(vlSQL,p_Apli.databasename,p_Apli.sessionname,True);
         MessageBeep(0);
      end
      else
        MessageDlg('El contrato no pudo ser impreso. Verifique conexión con la red o llame al departamento de sistemas', mtError,[mbOK],0);
    end
//    else MessageDlg('No se pudo localizar el destino de impresión para el usuario ', mtError,[mbOK],0);
    else MessageDlg('No se pudo localizar los destinos de impresión para el usuario ', mtError,[mbOK],0);

     finally
        if qContrato <> nil then qContrato.free;
        if qOper     <> nil then qOper.free;
        if qLiquidacion <> nil then qLiquidacion.free;
     end;
end;

function NombreMes(var pMes:Integer) : String;
     var vlMes : String;
     begin
       vlMes := '** no definido **';
       case pMes of
         1 : vlMes := 'January';
         2 : vlMes := 'February';
         3 : vlMes := 'March';
         4 : vlMes := 'April';
         5 : vlMes := 'May';
         6 : vlMes := 'June';
         7 : vlMes := 'July';
         8 : vlMes := 'August';
         9 : vlMes := 'September';
        10 : vlMes := 'October';
        11 : vlMes := 'November';
        12 : vlMes := 'December';
       end;
       NombreMes := vlMes;
end;

Procedure DesImporte( pImporte: String; var pStrImp1 :String; var pStrImp2 : String; var pStrImp3: String );
var
  vlContinua : Boolean;
  vlPos  : Integer;
Begin
  pStrImp2 :='';
  pStrImp1 :=pImporte;
  if length(pImporte) > 67 then begin
    vlPos := 67;
    vlContinua := True;
    While VLcontinua do begin
      if  (pImporte[vlPos] =' ') or (vlPos = 1 )  then begin
        pStrImp1 := Copy ( pImporte, 1, vlPos );
        vlContinua:= False;
      end
      else vlPos := vlPos -1;
    end;
    pStrImp2 := Copy ( pImporte, vlPos+1, length(pImporte)-vlPos );
  end;
End;

Procedure DesReferencia( pReferencia: String; var pStrRef1 :String; var pStrRef2 : String; var pStrRef3: String );
var
  vlContinua : Boolean;
  vlPos  : Integer;
Begin
  pStrRef2 :='';
  pStrRef3 :='';
  pStrRef1 :=pReferencia;
  if length(pReferencia) > 67 then begin
    vlPos := 67;
    vlContinua := True;
    While VLcontinua do begin
      if  (pReferencia[vlPos] =' ') or (vlPos = 1 )  then begin
        pStrRef1 := Copy ( pReferencia, 1, vlPos );
        vlContinua:= False;
      end
      else vlPos := vlPos -1;
    end;
    pReferencia := Copy ( pReferencia, vlPos+1, length(pReferencia)-vlPos );
    vlPos := 67;
    vlContinua := True;
    While VLcontinua do begin
      if  (pReferencia[vlPos] =' ') or (vlPos = 1 )  then begin
        pStrRef2 := Copy ( pReferencia, 1, vlPos );
        vlContinua:= False;
      end
      else vlPos := vlPos -1;
    end;
    pStrRef3 := Copy ( pReferencia, vlPos+1, length(pReferencia)-vlPos );
  end;
End;

(*VALIDA DATOS PARA IMPRESION DE GIROS*)
Function ValidaImpresion (p_Apli:TInterApli; pIdPersona: Integer; pImporte: Double; pMesa: String; var pDatosImp:String): Boolean;
Var QryImpr : Tquery;
Begin
  Result:= False;
  pDatosImp := '';
  QryImpr:= Tquery.Create(nil);
  QryImpr.DatabaseName := p_Apli.DataBaseName;
  QryImpr.SessionName := p_Apli.SessionName;
  QryImpr.SQL.text :=' SELECT  C.*, I.* ' +
                     '    FROM EMPLEADO E, admiprod.DI_CTRL_AUTORIZA C, admiprod.DI_CONF_IMPR I ' +
                     '    WHERE E.ID_ENTIDAD = C.ID_ENTIDAD  AND ' +
                     '    C.NUM_IMPRESORA = I.NUM_IMPRESORA AND ' +
                     '    E.ID_PERSONA ='+ IntToStr(pIdPersona) +  ' AND ' +
                     '    C.ID_MESA_CAMBIO = '+ pMesa +' AND ' + //antes 1 cambio por parametro mara4356 fase2
                     '    C.CVE_MEDIO=''CCAMB'' AND ' +
                     '    C.CVE_PRODUCTO = ''GI'' AND ' +
                     '    C.CVE_OPERACION=''V'' ' ;
  QryImpr.Open;
  if Not QryImpr.IsEmpty then Begin
    Result := True;
    pDatosImp := QryImpr.FieldByName('TPO_IMPR').AsString+'|';
    pDatosImp := pDatosImp + QryImpr.FieldByName('NOMBRE_IMPR').AsString + '|';
    pDatosImp := pDatosImp + QryImpr.FieldByName('CVE_PRODUCTO').AsString+ '|';

    If QryImpr.FieldByName('B_IMPR_FIRMAS').AsString = 'V' Then Begin
      if (pImporte <=  QryImpr.FieldByName('IMP_SUP_FIRMA').AsFloat) and
         ( pImporte > QryImpr.FieldByName('IMP_INF_FIRMA').AsFloat ) then
         pDatosImp := pDatosImp +  trim (QryImpr.FieldByName('FIRMA_A').AsString) + '|'
      else
        if (pImporte <= QryImpr.FieldByName('IMP_INF_FIRMA').AsFloat  ) then begin
          pDatosImp := pDatosImp +  trim (QryImpr.FieldByName('FIRMA_A').AsString) + '|';
          pDatosImp := pDatosImp +  trim (QryImpr.FieldByName('FIRMA_B').AsString) + '|';
        end else pDatosImp := pDatosImp + '||';
    End else pDatosImp := pDatosImp + '||';
    Result:= True;
  end
  else  Begin
    Result:= False;
    ShowMessage(' *** No Cuenta con Autorizacion para Imprimir *** ');
  end;
  QryImpr.Close;
  if QryImpr <> nil then QryImpr.Free;
End;


Function EjecutaFormula (p_Apli:TInterApli;pMESA, pCMONE: Integer; pPROD, pGPROD,
                         pCOPER :string): Double;
Var spFormula  : TStoredProc;
    qryFormula : Tquery;
    vFormula   : String;
Begin
    Result:= 0.0;
    // busca  la formula
    spFormula:=TStoredProc.Create(Nil);
    try
       spFormula.DatabaseName:=p_Apli.DataBaseName;  
       spFormula.SessionName :=p_Apli.SessionName;
       spFormula.StoredProcName:='PKGDIVISA.FUNINTFORMULA';
       spFormula.Params.CreateParam(ftInteger,'pMESA', ptInput);
       spFormula.Params.CreateParam(ftString, 'pPROD', ptInput);
       spFormula.Params.CreateParam(ftString, 'pGPROD',ptInput);
       spFormula.Params.CreateParam(ftString, 'pCOPER',ptInput);
       spFormula.Params.CreateParam(ftInteger,'pCMONE',ptInput);
       spFormula.Params.CreateParam(ftString,  'sFormu',ptResult);
       spFormula.Params.ParamByName('pMESA').AsInteger :=pMESA;
       spFormula.Params.ParamByName('pPROD').AsString  :=pPROD;
       spFormula.Params.ParamByName('pGPROD').AsString :=pGPROD;
       spFormula.Params.ParamByName('pCOPER').AsString :=pCOPER;
       spFormula.Params.ParamByName('pCMONE').AsInteger:=pCMONE;
       spFormula.Prepare;
       spFormula.ExecProc;
       vFormula:=spFormula.ParamByName('sFormu').AsString;
    finally spFormula.free;
    end;
    // ejecuta la formula
    qryFormula:= Tquery.Create(nil);
    qryFormula.DatabaseName := p_Apli.DataBaseName;
    qryFormula.SessionName := p_Apli.SessionName;
    qryFormula.SQL.text :=' SELECT round(' + vFormula + ',4) as TC FROM dual' ;
    qryFormula.Open;
    if Not qryFormula.IsEmpty then
        Result:=qryFormula.FieldByName('TC').AsFloat
    else  Begin
      Result:= 0.0;
      ShowMessage('Error inesperado al generar el Tipo de cambio');
    end;
    qryFormula.Close;
    if qryFormula <> nil then qryFormula.Free;
End;


//mara fase 2 divisas febrero 2005
{Function procValCliente(p_Apli:TInterApli; pIDCLIENTE:String ): Boolean;
var qQuery : TQuery;
    vIDcont: integer;
    vResult: Boolean;
    vRes :String;
    pProce : TStoredProc;
begin
    //el cliente tenga excepcion para la validación de datos
    procValCliente:=False;
    qQuery:= Tquery.Create(nil);
    qQuery.DatabaseName := p_Apli.DataBaseName;
    qQuery.SessionName := p_Apli.SessionName;
    qQuery.SQL.text :=' SELECT * FROM DI_EXCEPCION_CTE '+
                      '  WHERE SIT_EXCEPCION =  '''+ cActivo +'''' +
                      '    AND (ID_CONTRATO = '+ pIDCLIENTE +
                      '     OR ID_CONTRATO = (SELECT ID_CONTRATO_CORP FROM DI_CLIENTE ' +
                      '                        WHERE ID_PERSONA = '+ pIDCLIENTE +  '))';
    qQuery.Open;
    if not qQuery.IsEmpty
    then begin
        procValCliente:= True;
        qQuery.close;
        if qQuery <> nil then qQuery.Free;
        exit;
    end;
    //el cliente exista en la base de datos corporativa
    qQuery.SQL.Clear;
    qQuery.SQL.text :=' SELECT * FROM CONTRATO C'  +
                      '  WHERE C.SIT_CONTRATO = ''' + cActivo + '''' +
                      '    AND C.CVE_TIP_CONTRATO = ''' + cTpProducto + '''' +
                      '    AND C.ID_TITULAR = ' + pIDCLIENTE;
    qQuery.Open;
    if qQuery.IsEmpty then
    Begin
        procValCliente:= False;
//        ShowMessage('No es cliente del corporativo');
        ShowMessage('El Cliente no tiene asociado un Contrato.' +chr(13)+
                    'Favor de revisar con Contratos.');
        qQuery.Close;
        if qQuery <> nil then qQuery.Free;
        exit;
    end;
    qQuery.Close;
    //busca contrato del cliente
    qQuery.SQL.Clear;
    qQuery.SQL.text :=' SELECT * FROM DI_CLIENTE'  +
                      '  WHERE ID_PERSONA = ''' + pIDCLIENTE+ '''' ;
    qQuery.Open;
    vIDcont:=qQuery.FieldByName('ID_CONTRATO_CORP').AsInteger;
    qQuery.Close;
    // información completa del KYC
    procValCliente:=False;
    pProce:=TStoredProc.Create(Nil);
    try
        pProce.DatabaseName:=p_Apli.DataBaseName;
        pProce.SessionName :=p_Apli.SessionName;
        pProce.StoredProcName:='PKGKYCFUNPROC.BDTSOBLIGACTE';
        pProce.Params.CreateParam(ftInteger,'pIdContrato', ptInput);
        pProce.Params.CreateParam(ftString,'Result',ptResult);
        pProce.Params.ParamByName('pIdContrato').AsInteger :=vIDCont;
        pProce.Prepare;
        pProce.ExecProc;
        vRes:=pProce.ParamByName('Result').AsString;
    finally pProce.free;
    end;
    if (vRes=cFalso) or (vRes = null) then
    begin
        procValCliente:= False;
        ShowMessage('No se permite continuar con la captura debido a que ' +chr(13)+
                    'el cliente tiene Información incompleta del KYC');
        exit;
    end;
    //INFORMACIÓN ESTA COMPLETA DELL TITULAR Y REPRESENTANTES
    vRes:=funInfCliente(p_Apli, IntToStr(vIdCont), cEmpresaBco);  //BANCO
    if vRes = cVerdad then
    begin
        procValCliente:=True;
        if qQuery <> nil then qQuery.Free;
        exit;
    end;
    vRes:=funInfCliente(p_Apli, IntToStr(vIdCont), IntToStr(cEmpresaCBI)); //CASA BOLSA
    if vRes = cVerdad then
    begin
        procValCliente:=True;
        if qQuery <> nil then qQuery.Free;
        exit;
    end;
    vRes:=funInfCliente(p_Apli, IntToStr(vIdCont), IntToStr(cEmpresaCC));  //CENTRAL DE CAMBIOS
    procValCliente:=False;
    if vRes = 'V' then
    begin
        procValCliente:=True;
        if qQuery <> nil then qQuery.Free;
        exit;
    end;
    if vRes = 'N' then
    begin
        ShowMessage('ERROR: El cliente no tiene contrato para Central de Cambios');
        if qQuery <> nil then qQuery.Free;
        exit;
    end;
    if vRes = 'F' then
    begin
        qQuery.Sql.Clear;
        qQuery.SQL.Text:=' SELECT * FROM DI_EXCEPCION_CTE '+
                         '  WHERE ID_CONTRATO= ' +IntToStr(vIDCont) +      //pIDContrato
                         '    AND CVE_TIP_EXCEP = '''+ cExcCteSD +''''+
                         '    AND F_INICIO = TO_DATE(''' + FormatDateTime('DD/MM/YYYY',p_Apli.DameFechaEmpresa) + ''',''DD/MM/YYYY'')' +
                         '    AND F_FIN= TO_DATE(''' + FormatDateTime('DD/MM/YYYY',p_Apli.DameFechaEmpresa) + ''',''DD/MM/YYYY'')' +
                         '    AND SIT_EXCEPCION = ''' + cActivo + '''';
        qQuery.open;
        if qQuery.IsEmpty then
        begin //sin excepcion
            procValCliente:= False;
            ShowMessage('ERROR: El cliente o sus representantes no tienen completa su documentación');
            qQuery.Close;
            if qQuery <> nil then qQuery.Free;
        end
        else //con excepcion
        begin
            procValCliente:= True;
            qQuery.Close;
            if qQuery <> nil then qQuery.Free;
        end;
    end;
end;

//funcion que busca los contratos del cliente y verfica que la documentación este completa
// devuelve V si la información es completa F si es incompleta N si no existe contrato alguno
Function funInfCliente(p_Apli:TInterApli; vIDContrato, vEmpresa:String ): String;
var qQuery : TQuery;
    vRes :String;
    pProce : TStoredProc;
begin
    qQuery:= Tquery.Create(nil);
    qQuery.DatabaseName := p_Apli.DataBaseName;
    qQuery.SessionName := p_Apli.SessionName;
    qQuery.SQL.text :=' SELECT ID_CONTRATO, ID_EMPRESA ' +
                      '   FROM CONTRATO C '+
                      '  WHERE C.SIT_CONTRATO = ''' + cActivo + '''' +
                      '    AND C.ID_TITULAR IN (select ID_TITULAR from CONTRATO '+
                      '                    WHERE ID_CONTRATO = '+ vIDContrato + ')'+
                      '    AND C.ID_EMPRESA = ' + vEmpresa ;
    qQuery.Open;
    if qQuery.IsEmpty then
    begin
        funInfCliente:='N';
        qQuery.Close;
        exit;
    end;
    pProce:=TStoredProc.Create(Nil);
    pProce.DatabaseName:=p_Apli.DataBaseName;
    pProce.SessionName :=p_Apli.SessionName;
    pProce.StoredProcName:='PKGCORPORATIVO.BCTOCOMPLETO';
    pProce.Params.CreateParam(ftInteger,'pIdContrato', ptInput);
    pProce.Params.CreateParam(ftString,'pBValidaBloqueo', ptInput);
    pProce.Params.CreateParam(ftString,'Result',ptResult);
    vRes:='F';
    while (not qQuery.eof) and (vRes='F') do
    begin
        pProce.Params.ParamByName('pBValidaBloqueo').AsString:=cVerdad;
        pProce.Params.ParamByName('pIdContrato').AsInteger :=qQuery.FieldByName('ID_CONTRATO').AsInteger;
        pProce.Prepare;
        pProce.ExecProc;
        vRes:=pProce.ParamByName('Result').AsString;
        qQuery.Next;
    end;
    qQuery.Close;
    if qQuery <> nil then qQuery.Free;
    pProce.Free;
    funInfCliente:=vRes;
end; }

Function procValCliente(p_Apli:TInterApli; pMesa, pIDCLIENTE :String ): Boolean;
var pProce : TStoredProc;
begin
    procValCliente:=False;
    pProce:=TStoredProc.Create(Nil);
    try
        pProce.DatabaseName:=p_Apli.DataBaseName;
        pProce.SessionName :=p_Apli.SessionName;
        pProce.StoredProcName:='PKGDIVISA.STPVALCLIENTE';
        pProce.Params.CreateParam(ftInteger,'PIDCLIENTE', ptInput);
        pProce.Params.CreateParam(ftInteger,'PMESA',      ptInput);
        pProce.Params.CreateParam(ftInteger,'PCTO',       ptOutput);
        pProce.Params.CreateParam(ftInteger,'PCOD',       ptOutput);
        pProce.Params.CreateParam(ftString, 'PRESP',      ptOutput);
        pProce.Params.ParamByName('PIDCLIENTE').AsInteger :=StrToInt(pIDCLIENTE);
        pProce.Params.ParamByName('PMESA').AsInteger :=StrToInt(pMesa);
        pProce.Prepare;
        pProce.ExecProc;
        if pProce.Params.ParamByName('PCOD').AsInteger <> 0 then
        begin procValCliente:= False;
              ShowMessage('No se permite continuar con la captura.' +chr(13)+ pProce.Params.ParamByName('PRESP').AsString);
        end
        else procValCliente:= True;
    finally pProce.free;
    end;
end;
                                       
Function ValidaCte(pApli:TInterApli; pMesa, pIDCLIENTE,pnombre,pFNac,pSolicitud, pContrato:String ): Boolean;
var vlSQL, vlRes, vlSubject, vlBody:String;
begin
   if pIDCLIENTE<>'7' THEN
   vlSQL:=' SELECT PKGDIVISA.FunPerExp('''+pNombre+''','''+pFNac+''') as FunPerExp from dual'
   ELSE
   vlSQL:=
'  SELECT Pkgdivisa.FunPerExp('''+pNOMBRE+''',FECHA) as FunPerExp '+
'  FROM( '+
'  SELECT DECODE(P.CVE_PER_JURIDICA, '+
'          ''PF'',(SELECT F_NACIMIENTO FROM PERSONA_FISICA WHERE ID_PERSONA=P.ID_PERSONA), '+
'          (SELECT F_CONSTITUCION FROM PERSONA_MORAL WHERE ID_PERSONA=P.ID_PERSONA) ) FECHA '+
'  FROM DI_CTO_NO_CTE d,PERSONA p  '+
'  WHERE d.id_contrato='+PContrato+
'  AND p.id_persona=d.id_cliente AND b_es_cliente=''V'' '+
'  UNION ALL '+
'  SELECT F_NACIMIENTO FROM DI_CTO_NO_CTE d, DI_NO_CLIENTE c '+
'  WHERE D.ID_CONTRATO='+PContrato+
'  AND c.id_no_cliente=d.id_cliente AND b_es_cliente=''F'' )    ';
   GetSQLStr(vlSQL, pApli.DataBaseName, pApli.SessionName, 'FunPerExp', vlRes, True);
   if vlRes='V' then
   begin
      vlSubject:='CCAMB. CAPTURA NO AUTORIZADA';
      vlBody:=
       'EL USUARIO REALIZO UNA CAPTURA CON PERSONA POLÍTICAMENTE EXPUESTA Y/O NO GRATA'+CHR(13)+CHR(13)+
       'ID   CLIENTE    -> '+ pIDCLIENTE +CHR(13)+
       'NOMBRE  CTE     -> '+ pnombre +CHR(13)+
       'USUARIO CAPTURA -> '+ PApli.UsuarioNombre+CHR(13)+
       'HORA DE CAPTURA -> '+ DateTimeToStr(pApli.SysDateTime)+CHR(13)+
       'NO. SOLICITUD   -> '+ PSolicitud+CHR(13)+
       'NO. OPERACION   -> '+ pContrato;
      procEnviaCorreo(papli, pMesa, vlSubject, vlBody,'EMAILAUD');
   end;
end;

function BuscaCorreoProm(pApli:TInterApli):String;
var vlCorreo:String;
begin vlCorreo:=DLookup(pApli.databasename,pApli.SessionName,
               'DS_PARAMETRO','DI_PARAMETRO_DV', 'CVE_PARAMETRO=''EMAILLAV''');
      BuscaCorreoProm:=vlCorreo;
end;

Procedure procEnviaCorreo(p_Apli:TInterApli; pMesa, pSubject,pBody,pTipo:String );//MARA ENERO 2009
var vlhost, vlEmail : String;
    NMSMTP1 : TNMSMTP;
    iCuenta1,iCuenta2, iPos:Integer;
begin
    
    try
        NMSMTP1:= TNMSMTP.Create(nil);
        vlEmail:=BuscaCorreoProm(p_Apli);//del usuario que genera el correo
        vlHost:=DLookup(p_Apli.databasename,p_Apli.SessionName,
                        'DS_PARAMETRO','DI_PARAMETRO_DV','ID_MESA_CAMBIO='+ pMesa+ ' AND CVE_PARAMETRO = ''HOSTNAME'' ' );
        NMSMTP1.Host := vlhost;
        NMSMTP1.Connect;
        Screen.Cursor := crHourGlass;
        if (NMSMTP1.Connected) and (Trim(vlEmail)<>'') then
        begin
           NMSMTP1.ClearParams := TRUE;
           NMSMTP1.SubType := mtPlain;
           NMSMTP1.PostMessage.FromAddress := vlEmail;
           iCuenta1:=StrToInt(DLookup(p_Apli.databasename,p_Apli.SessionName,'CVE_REFERENCIA','DI_PARAMETRO_DV',' CVE_PARAMETRO = '''+pTipo+''' ' ));
           iCuenta2:=0;
           vlEmail:=DLookup(p_Apli.databasename,p_Apli.SessionName,'DS_PARAMETRO','DI_PARAMETRO_DV',' CVE_PARAMETRO = '''+pTipo+''' ' );
           while iCuenta2<iCuenta1 do
           begin
              iPos:= Pos(';',vlEmail)-1;
              NMSMTP1.PostMessage.ToAddress.Add(Copy(vlEmail,1,iPos));
              vlEmail:=Copy(vlEmail,iPos+2,length(vlEmail));
              Inc(iCuenta2);
           end;
           NMSMTP1.PostMessage.Subject := pSubject;
           NMSMTP1.PostMessage.Attachments.Clear;
           NMSMTP1.PostMessage.Body.Text:=pBody;
           NMSMTP1.PostMessage.Date := DateTimeToStr(p_Apli.SysDateTime); 
           NMSMTP1.PostMessage.ReplyTo := NMSMTP1.PostMessage.FromAddress;
           NMSMTP1.SendMail;
        end;
        NMSMTP1.Disconnect;
    finally
        if nmsmtp1<>nil then nmsmtp1.free;
    end;
end;

Procedure procCorreoEfectivo(p_Apli:TInterApli; pMesa,pSolicitud,pEntidad,pTIPOUNIDAD,pSECTOR, pSubject,pBody,pTipo:String );//MARA ENERO 2009
var vlhost, vlSQL, vlEmail : String;
    NMSMTP1 : TNMSMTP;
    iCuenta1,iCuenta2, iPos:Integer;
    qCon :TQuery;
begin
  vlSQL:=
   ' SELECT D.MAIL_FUN_AUT, D.CVE_FUN_AUTO || '' Autorización '' || DECODE(D.CVE_TIP_AUT, ''OB'',''Obligatoria'',''Opcional'') as CVE_TIP_AUT '+
   ' FROM DI_SOL_CT_AUT D '+
   ' WHERE D.ID_ENTIDAD     ='+pEntidad +
   ' AND D.CVE_SECTOR_DIVS  ='''+pSECTOR + ''' '+
   ' AND D.cve_tipo_unidad  ='''+pTIPOUNIDAD + ''' '+
   ' AND '+
   '  ( SELECT  '+
   '    MAX(DECODE(t.cve_moneda,840,imp_trans_prod,imp_trans_mn/Pkgdivisa.funObtTCamb(c.id_mesa_cambio,484,t.f_operacion))) '+
   '    FROM DI_SOL_CTO C, DI_SOL_TRANS T, DI_PRODUCTO P '+
   '    WHERE C.SIT_CONTRATO IN(''IN'') '+
   '    AND C.id_solicitud  = '+pSolicitud+
   '    AND T.ID_SOLICITUD  =C.ID_SOLICITUD '+
   '    AND T.CVE_OPERACION =''C'' '+ //JUN2009
   '    AND P.cve_producto  =T.cve_producto '+
   '    AND P.B_AUT_EFE     =''V'' '+
   '  ) '+
   '  BETWEEN D.IMP_MONTO_MIN AND D.IMP_MONTO_MAX ';
  vlEmail:=BuscaCorreoProm(p_Apli);//CORREO DE PREVENCION DE LAVADO DE DINERO
  vlHost:=DLookup(p_Apli.databasename,p_Apli.SessionName,'DS_PARAMETRO','DI_PARAMETRO_DV','ID_MESA_CAMBIO='+ pMesa+ ' AND CVE_PARAMETRO = ''HOSTNAME'' ' );
  qCon := tQuery.Create(Nil);
  try 
    qCon.Databasename:=p_Apli.DataBaseName;
    qCon.SessionName:=p_Apli.SessionName;
    qCon.SQL.Text:=vlSQL;
    qCon.Open;
    if (qCon.RecordCount>-1) and (Trim(vlEmail)<>'') and (Trim(vlHost)<>'') then
    begin
     try
        NMSMTP1:= TNMSMTP.Create(nil);
        NMSMTP1.Host := vlhost;
        NMSMTP1.Connect;
        Screen.Cursor := crHourGlass;
        if (NMSMTP1.Connected) then
        begin
           NMSMTP1.ClearParams := TRUE;
           NMSMTP1.SubType := mtPlain;
           NMSMTP1.PostMessage.FromAddress := vlEmail;
           while not qCon.Eof do
           begin NMSMTP1.PostMessage.ToAddress.Add(qCon.FieldByName('MAIL_FUN_AUT').AsString);
                 qCon.Next;
           end;
           NMSMTP1.PostMessage.Subject := pSubject;
           NMSMTP1.PostMessage.Attachments.Clear;
           NMSMTP1.PostMessage.Body.Text:=pBody +chr(13)+chr(13)+'Funcionarios que deben Autorizar: ';
           qCon.First;
           while not qCon.Eof do
           begin NMSMTP1.PostMessage.Body.Text := 
                   NMSMTP1.PostMessage.Body.Text + chr(13) +
                   qCon.FieldByName('CVE_TIP_AUT').AsString;
                 qCon.Next;
           end;
           NMSMTP1.PostMessage.Date := DateTimeToStr(p_Apli.SysDateTime);  //
           NMSMTP1.PostMessage.ReplyTo := NMSMTP1.PostMessage.FromAddress;
           NMSMTP1.SendMail;
        end;
        NMSMTP1.Disconnect;
     finally if NMSMTP1<>nil then NMSMTP1.free;
     end;
    end;
  finally qCon.free;
  end;
end;

function ValidaTC(pIdMesa, pMoneda:Integer;pGrupoP, pGProducto,pOperacion:String; pTC:Double; Apli:TInterApli):Boolean;
var qQuery : TQuery;
begin
    qQuery:= Tquery.Create(nil);
    qQuery.DatabaseName:= Apli.DataBaseName;
    qQuery.SessionName := Apli.SessionName;
    qQuery.SQL.text :=' SELECT TRUNC(Tc_Compra,4) TC_COMPRA, TRUNC(Tc_Venta,4) TC_VENTA ' +
                      '   FROM Di_Tc_GProd '+
                      '  WHERE Id_Mesa_Cambio= ' + IntTOStr(pIdMesa) +
                      '    AND Cve_Grupo_Prod= ''' + pGrupoP + '''' +
                      '    AND Cve_Gpo_Producto= '''+ pGProducto + ''''+
                      '    AND Cve_Moneda = ' + IntToStr(pMoneda);
    if pOperacion ='C' then
       qQuery.SQL.text :=qQuery.SQL.text + ' AND TRUNC(Tc_Compra,4)= ' + FloatToStr(pTC);
    if pOperacion = 'V' then
       qQuery.SQL.text :=qQuery.SQL.text + ' AND TRUNC(Tc_Venta,4)= ' + FloatToStr(pTC);
    qQuery.Open;
    if qQuery.IsEmpty then
       ValidaTC:=False
    else
       ValidaTC:=True;
    qQuery.Close;
    if qQuery <> nil then qQuery.Free;
end;

function ProcBuscaTipoCambio(pApli:TInterApli; pProd, pMesa,pOperacion,pGProd: String;pCampo:TInterCampo):Boolean;
var qryCon:TQuery;
begin
  qryCon := TQuery.Create(nil);
  qryCon.DatabaseName := pApli.DataBaseName;
  qryCon.SessionName := pApli.SessionName;

  qryCon.sql.clear;

  if pOperacion = 'C' then
     qryCon.SQL.Text:=' select dtg.tc_compra TipoCambio ' +
                      '   from di_tc_gprod dtg, di_producto dp ' +
                      '  where dp.id_mesa_cambio = ' + pMesa +
                      '    and dp.cve_producto = ''' + pProd + ''' ' +
                      '    and dp.CVE_GPO_PRODUCTO = ''' + pGProd + ''' ' +
                      '    and DTG.id_mesa_cambio = dp.id_mesa_cambio ' +
                      '    AND DTG.CVE_GRUPO_PROD=dp.CVE_GRUPO_PROD ' +
                      '    and dtg.CVE_GPO_PRODUCTO=dp.CVE_GPO_PRODUCTO ' +
                      '    and dtg.id_gpo_prom = (Select id_gpo_prom from di_unidad_cambio where ID_MESA_CAMBIO =' + pMesa + ' AND cve_usuario =' + quotedStr(pApli.Usuario) + ') ' +
                      '    and dtg.cve_moneda =dp.cve_moneda_ini '
  else
     qryCon.SQL.Text:=' select dtg.tc_venta TipoCambio ' +
                      '   from di_tc_gprod dtg, di_producto dp ' +
                      '  where dp.id_mesa_cambio = ' + pMesa +
                      '    and dp.cve_producto = ''' + pProd + ''' ' +
                      '    and dp.CVE_GPO_PRODUCTO = ''' + pGProd + ''' ' +
                      '    and DTG.id_mesa_cambio = dp.id_mesa_cambio ' +
                      '    AND DTG.CVE_GRUPO_PROD=dp.CVE_GRUPO_PROD ' +
                      '    and dtg.CVE_GPO_PRODUCTO=dp.CVE_GPO_PRODUCTO ' +
                      '    and dtg.id_gpo_prom = (Select id_gpo_prom from di_unidad_cambio where ID_MESA_CAMBIO =' + pMesa + ' AND cve_usuario =' + quotedStr(pApli.Usuario) + ') ' +
                      '    and dtg.cve_moneda =dp.cve_moneda_ini ';
  qryCon:= GetSQLQuery(qryCon.sql.Text, pApli.DataBaseName,pApli.SessionName, True);
  try
    if qryCon <> nil then
      begin
        pCampo.AsString:=qryCon.FieldByName('TipoCambio').AsString;
                result:=True;
      end
    else
      begin
        pCampo.AsFloat :=1;
        ShowMessage('ERROR: Tipo de cambio no encontrado para este producto');
        Result:=False;
      end;
  finally
    if qryCon <> nil then qryCon.free;
  end;
end;

function ValidaClabe(apli:TInterApli; Cuenta: String): Boolean;   // sacc 31032005
var SPValClabe : TStoredProc;
    vgBClabe : Boolean;
begin
  vgBClabe := False;
  try
    SPValClabe := TStoredProc.Create(nil);
    SPValClabe.DataBaseName :=   apli.DataBaseName;
    SPValClabe.SessionName :=  apli.SessionName;
    with SPValClabe do Begin
      StoredProcName := 'PKGSERSPEUA.STPVALIDACLABE';
      with Params do Begin
        CreateParam( ftString, 'PE_CUENTA_CLABE', ptInput);
        CreateParam( ftString,'PE_BCTAINT',     ptInput);
        CreateParam( ftInteger,'PS_CONTRATO',     ptOutput);
        CreateParam( ftString, 'PS_PLAZA',        ptOutput);
        CreateParam( ftString, 'PS_DIGVERIF',     ptOutput);
        CreateParam( ftString, 'PS_SITCTO',       ptOutput);
        CreateParam( ftInteger,'PSRESULTADO',     ptOutput);
        CreateParam( ftString, 'PSTXRESULTADO',   ptOutput);
        Prepare;
        ParamByName('PE_CUENTA_CLABE').AsString:= Cuenta;
        ParamByName('PE_BCTAINT').AsString:= 'F';
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger <> 0 then begin
          vgBClabe := False;
          MessageDlg('Error en la cuenta CLABE :' + ParamByName('PSTXRESULTADO').AsString, mtInformation, [mbOk], 0 );
        end
        else vgBClabe := True;
      end;
    end; {with}
  finally
    if SPValClabe <> nil then SPValClabe.free;
  end; {try}
  Result  := vgBClabe;
end;

function InsBitTransaccion(pContrato:String; pApli:TInterApli):Boolean;
var vlSQL:String;
    vlQue:TQuery;
    pProce : TStoredProc;
begin Result:=False;
    vlSQL:='  SELECT DECODE( (PROD.TOTAL1 - TRANS.TOTAL2),0,''V'',''F'')  Resultado'+
           '    FROM '+
                  ' (SELECT A.total1 + B.total1 TOTAL1 '+
                  '    FROM (select count(dt.id_transaccion) as total1 '+
                            ' from   di_transaccion dt, di_producto dp '+
                            ' where  dt.id_mesa_cambio = dp.id_mesa_cambio '+
                            ' and    dt.cve_producto = dp.cve_producto '+
                            ' and    dt.id_contrato ='+ PCONTRATO +
                            ' and    dt.cve_operacion =''V'' '+
                            ' and    length(dp.cve_tip_pago)>0 ) A, '+
                           '(select count(dt.id_transaccion) as total1 '+
                            ' from   di_transaccion dt, di_producto dp '+
                            'where  dt.id_mesa_cambio = dp.id_mesa_cambio '+
                            ' and    dt.cve_producto = dp.cve_producto '+
                            ' and    dt.id_contrato = '+ PCONTRATO +
                            ' and    dt.cve_operacion =''C'' '+
                            ' and    dp.cve_tip_pago=''SIAC'' ) B) PROD, '+
                  ' (SELECT A.TOTAL2 + B.TOTAL2 TOTAL2 '+
                  '    FROM (select count(dt.id_transaccion) as total2 '+
                            ' from   di_transaccion dt, di_producto dp '+
                            ' where  dt.id_mesa_cambio = dp.id_mesa_cambio '+
                            ' and    dt.cve_producto = dp.cve_producto '+
                            ' and    dt.id_contrato ='+ PCONTRATO +
                            ' and    dt.cve_operacion =''V'' '+
                            ' and    length(dT.cve_tip_pago) >0 ) A, '+
                           '(select count(dt.id_transaccion) as total2 '+
                            ' from   di_transaccion dt, di_producto dp '+
                            'where  dt.id_mesa_cambio = dp.id_mesa_cambio '+
                            ' and    dt.cve_producto = dp.cve_producto '+
                            ' and    dt.id_contrato ='+ PCONTRATO +
                            ' and    dt.cve_operacion =''C'' '+
                            ' and    dT.cve_tip_pago = ''SIAC'' ) B) TRANS ';

    vlQue := TQuery.Create(nil);
    vlQue.DatabaseName := pApli.DataBaseName;
    vlQue.SessionName := pApli.SessionName;
    vlQue.sql.clear;
    vlQue.sql.Text:= vlSQL;
    vlQue:= GetSQLQuery(vlQue.sql.Text, pApli.DataBaseName,pApli.SessionName, True);
    try
       if (vlQue <> nil) and (vlQue.FieldByName('Resultado').AsString = 'V') then
       begin pProce:=TStoredProc.Create(Nil);
             pProce.DatabaseName:=pApli.DataBaseName;
             pProce.SessionName :=pApli.SessionName;
             pProce.StoredProcName:='PKGDIVISA.STPINSBITTRNS';
             pProce.Params.CreateParam(ftInteger,'pe_IdContrato', ptInput);
             pProce.Params.CreateParam(ftInteger,'ps_CodResp', ptOutput);
             pProce.Params.CreateParam(ftString,'ps_DescPro',ptOutput);
             pProce.Params.ParamByName('pe_IdContrato').AsInteger:=StrToInt(pContrato);
             pProce.Prepare;
             pProce.ExecProc;
             if pProce.ParamByName('ps_CodResp').AsInteger <> 0 then begin
                MessageDlg(pProce.Params.ParamByName('ps_DescPro').AsString,mtError,[mbOK],0);
             end
             else Result:=True;

             pProce.Free;
       end
       else Result:=True;
    finally
      if vlQue <> nil then vlQue.free;
    end;
end;


function DlookUP(pDatabasename:String;pSessionName:String;pColumna:String;pTabla:String;pWhere:String):String;
Var vlSQL:String;
    qConsulta:TQuery;
begin DlookUP:='Error';
      qConsulta:=TQuery.Create(Nil);
      try
        qConsulta.DatabaseName:=pDatabasename;
        qConsulta.SessionName:=pSessionName;
        vlsql:=' SELECT ' + pColumna + ' FROM ' + pTabla + ' WHERE ' + pWhere;
        qConsulta.SQL.Text:=vlsql;
        qConsulta.Open;
        if qConsulta.IsEmpty
        then DlookUP:=''
        else DlookUP:=qConsulta.FieldByName(pColumna).AsString;
        qConsulta.Close;
      finally qConsulta.free;
      end;
end;

//function SendEmail(pApli:TInterApli; ID_CTO:STRING; pMensaje:TStringList): integer; // MARA 04 ABRIL 2005
function SendEmail(pApli:TInterApli; ID_CTO, pMensaje:String): integer; // MARA 04 ABRIL 2005
Var vlQue:TQuery;
    l_SQL, vlhost, vlEmail, vlBody, vlSubject, vlDig : String;
    NMSMTP1 : TNMSMTP;
    vlMensaje :TStringList;
    //MOAA4820 DIC2009 - CORREO ELECTRONICO PARA ENVIAR COMPROBANTE
    vlCorreo : String;
    vlComprobante : TStringList;
    SearchRec: TSearchRec;
Begin SendEmail:=2; //no encontrado
      l_Sql := ' SELECT * FROM DI_CLIENTE CTE, DI_CONTRATO CTO WHERE CTE.ID_PERSONA=CTO.ID_CLIENTE '+
               ' AND CTO.ID_CONTRATO='+id_cto + '  and B_CMP_EMAIL = ''V'' ';
      vlQue := TQuery.Create(nil);
      vlQue.DatabaseName := pApli.DataBaseName;
      vlQue.SessionName := pApli.SessionName;
      vlQue.sql.clear;
      vlQue.sql.Text:= l_SQL;
      vlQue:= GetSQLQuery(vlQue.sql.Text, pApli.DataBaseName,pApli.SessionName, True);

      //CORREO ELECTRONICO POR DEFAULT
      if (vlQue <> nil)then vlCorreo := vlQue.FieldByName('E_MAIL').AsString
      else vlCorreo := BuscaCorreo(pApli);

      //MOAA4820 - ASIGNACION TEMPORAL PARA QUE OBTENGA EL MAIL POR DEFAULT
      //vlCorreo := '';

      IF (Trim(vlCorreo) = '') THEN BEGIN
          l_Sql := ' SELECT DS_PARAMETRO AS E_MAIL FROM DI_PARAMETRO_DV WHERE ID_MESA_CAMBIO = 1 AND CVE_PARAMETRO = ''EMAILDEF'' ';
          vlQue := TQuery.Create(nil);
          vlQue.DatabaseName := pApli.DataBaseName;
          vlQue.SessionName := pApli.SessionName;
          vlQue.sql.clear;
          vlQue.sql.Text:= l_SQL;
          vlQue:= GetSQLQuery(vlQue.sql.Text, pApli.DataBaseName,pApli.SessionName, True);
          if (vlQue <> nil)then vlCorreo := vlQue.FieldByName('E_MAIL').AsString
          else vlCorreo := '';
      END;

      try if (Trim(vlCorreo) <> '') then begin
             NMSMTP1:= TNMSMTP.Create(nil);
             //MOAA4820 DIC2009 - PERSONA QUE LO ENVIA ES LA MISMA QUE RECIBE
             //vlEmail:=BuscaCorreo(pApli);
             vlEmail := vlCorreo;

             //vlemail:=DLookup(pApli.databasename,pApli.SessionName,'E_MAIL','EMAIL_PERSONA','ID_PERSONA='+ IntToStr(pApli.UsuarioID));
             //17mar2006 EFS LA DIRECCION IP SE OBTIENE DE LA TABLA DE PARAMETROS
             vlHost:=DLookup(pApli.databasename,pApli.SessionName,'DS_PARAMETRO','DI_PARAMETRO_DV','ID_MESA_CAMBIO='+ IntToStr(UnidCambUsu(PApli))+
             ' AND CVE_PARAMETRO = ''HOSTNAME'' ' );
//             vlhost:= '132.1.6.62'; //DLookup(pApli.databasename,pApli.SessionName,'TX_QUERY_DATA','EMAIL_MSG','CVE_MSG=''ENV_MSG''');
             NMSMTP1.Host := vlhost;
             //NMSMTP1.UserID := 'mzarate';
             NMSMTP1.Connect;
             Screen.Cursor := crHourGlass;
             SendEmail:=3; //encontrato
             if (NMSMTP1.Connected) and (Trim(vlEmail)<>'') then
             begin
                NMSMTP1.ClearParams := TRUE;
                NMSMTP1.SubType := mtHTML; //mtPlain;
                NMSMTP1.PostMessage.FromAddress := vlEmail;

                //MOAA4820 DIC2009 - CORREO PARA ENVIAR COMPROBANTE
                //NMSMTP1.PostMessage.ToAddress.Text := vlQue.FieldByName('E_MAIL').AsString;
                NMSMTP1.PostMessage.ToAddress.Text := vlCorreo;
                vlComprobante := TStringList.Create;
                vlComprobante.Clear;

                vlDig := 'c:\~pdf\Comprobante Op. '+ID_CTO+'.pdf';

                if FindFirst(vlDig, faAnyFile, SearchRec) = 0 then
                begin
                  vlComprobante.Add(vlDig);
                  NMSMTP1.PostMessage.Attachments := vlComprobante;
                  NMSMTP1.PostMessage.Body.Text:=pmensaje; //addstrings(pMensaje);

                  //17MAR06 EFS SE MODIFICA EL SUBJECT DEL CORREO ELECTRONICO PARA INCLUIR LA FECHA Y HORA DE ENVIO
                  //NMSMTP1.PostMessage.Subject := CadenaToHtml('Comprobante de Operacion Cambiaria ' + id_cto);
                  vlSubject:= FormatDateTime('DD/MM/YYYY HH:NN:SS', pApli.SysDateTime) +
                             ' Comprobante de Operacion Cambiaria ' + id_cto;
                  NMSMTP1.PostMessage.Subject := CadenaToHtml(vlSubject);
                  NMSMTP1.PostMessage.Date := DateTimeToStr(pApli.SysDateTime); // DateTimeToStr(Now);
                  NMSMTP1.PostMessage.ReplyTo := NMSMTP1.PostMessage.FromAddress;
                  NMSMTP1.SendMail;
                  SendEmail:=4; //enviado
                  MessageDlg('Comprobante enviado a ' + vlCorreo,mtInformation,[mbOK],0);
                end
                else begin
                  SendEmail:=3; //enviado
                  MessageDlg('No se encontro: Comprobante Op. '+ID_CTO+'.pdf', mtError,[mbOK],0);
                end;
                FindClose(SearchRec);
             end;
             Screen.Cursor := crDefault;
             NMSMTP1.Disconnect;
        end
       else
          //MOAA4820 DIC2009 - MENSAJE DE ERROR - CORREO ELECTRONICO
          MessageDlg('No se pudo obtener el correo electrónico para enviar comprobante',mtInformation,[mbOK],0);
      finally
        if vlQue <> nil then vlQue.free;
        if nmsmtp1<>nil then nmsmtp1.free;
        if vlComprobante<>nil then vlComprobante.Free;
      end;
end;

function GetAuthority(pFuncion, pUsuario, pParametro, DataBaseName, SessionName:String): Boolean;
Var l_Sql: String;
Begin
  l_Sql := 'SELECT * FROM SECU_OPER_ACC '+
           ' WHERE RTRIM(CVE_FUNCION)  = RTRIM('''+ pFuncion + ''') ' +
           '   AND RTRIM(CVE_USUARIO)  = RTRIM('''+ pUsuario + ''') ' +
           '   AND RTRIM(CVE_OPER_ACC) = RTRIM('''+ pParametro+''')';
  Result := GetSQL(l_Sql,DataBaseName,SessionName,True);
end;

function ObtenFechasEmpresa(pMesa, pDLiq, DataBaseName, SessionName:String): String;
Var l_Sql, vlFecha : String;
Begin l_Sql := 'select F_REFERENCIA from fecha_empresa ' +
           ' where ID_EMPRESA= ' +   pMesa +
           '   and CVE_DIA_LIQUIDA = ''' + pDLiq + ''' ';
      GetSQLStr(l_sql,DataBaseName,SessionName, 'F_REFERENCIA',vlFecha,False);
      Result:=vlFecha;
end;



function ImprimeAutomatico(pMesa: String; pUsrCap : String;pApli : TInterApli):String;
Var l_Sql, vlResultado, vlUsr : String;
    TObjeto:TInterFrame;
begin
  TObjeto:=TInterFrame.Create(nil);
  TObjeto.Apli:=pApli;
  // SI el giro se imprime en la impresora configurada para el usuario que capturo la operacion
  // se busca por di_contrato.cve_usuario en caso contrario por el usuario que autoriza la operacion
  if (ObtenSit(TObjeto, cIGAUTUCAP) = 'V') then
     vlUsr:=pUsrCap
  else
     vlUsr:=pApli.Usuario;

  l_Sql:=' SELECT dun.B_IMPGIRO_AUTOM '+
             '   FROM di_unidad_negoc DUN, di_unidad_cambio DUC '+
             '  WHERE dun.id_mesa_cambio   = duc.id_mesa_cambio '+
             '    AND dun.id_region_cambio = duc.id_region_cambio '+
             '    AND dun.id_entidad       = duc.id_entidad ' +
             '    AND duc.id_mesa_cambio   = ' +pMesa +
             '    AND duc.cve_usuario      = '''+   vlUsr + ''''; // pApli.Usuario + ''' ' ;

      GetSQLStr(l_sql,pApli.DataBaseName,pApli.SessionName,'B_IMPGIRO_AUTOM',vlResultado,False);
      Result:=Trim(vlResultado);
  TObjeto.free;
end;


function BuscaTipoUnidad(pMesa : String; pApli : TInterApli):String;
Var l_Sql, vlResultado : String;
begin vlResultado:='';
      l_Sql:=' SELECT duc.CVE_TIPO_UNIDAD '+
             '   FROM di_unidad_negoc DUN, di_unidad_cambio DUC '+
             '  WHERE dun.id_mesa_cambio   = duc.id_mesa_cambio '+
             '    AND dun.id_region_cambio = duc.id_region_cambio '+
             '    AND dun.id_entidad       = duc.id_entidad '+
             '    AND duc.cve_usuario      = ''' + pApli.Usuario + ''' ' +
             '    AND duc.id_mesa_cambio   = ' + pMesa;
      GetSQLStr(l_sql,pApli.DataBaseName,pApli.SessionName,'CVE_TIPO_UNIDAD',vlResultado,False);
      Result:=Trim(vlResultado);
end;

function ValidaEmail(email:string):boolean;
  // Devuelve True si la dirección de email es válida
  //sacc 07072005 Valida E-mail
const
   // Caracteres válidos en un "átomo"
    atomo_chars = [#33..#255] - ['(', ')', '<', '>', '@', ',', ';', ':',
                                '\', '/', '"', '.', '[', ']', #127];
    // Caracteres válidos en una "cadena-entrecomillada"
    str_comillas = [#0..#255] - ['"', #13, '\'];
    // Caracteres válidos en un subdominio
    letras = ['A'..'Z', 'a'..'z'];
    letras_digitos = ['0'..'9', 'A'..'Z', 'a'..'z'];
    subdominio_chars = ['-', '0'..'9', 'A'..'Z', 'a'..'z'];
type
    TEstado = (EMPIEZA, ATOMO, COMILLA_TEXTO, COMILLA_CHAR,
      COMILLAS, OTRA_PALABRA, ESPERA_SUBDOMINIO,
      SUBDOMINIO, GUION);
var
    Estado:TEstado;
    i, n, subdominios: integer;
    c: char;
begin
    Estado := EMPIEZA;
    n := Length(email);
    i := 1;
    subdominios := 1;
    while (i <= n) do begin
      c := email[i];
      case Estado of
      EMPIEZA:
        if c in atomo_chars then
          Estado:= ATOMO
        else if c = '"' then
          Estado:= COMILLA_TEXTO
        else
          break;
      ATOMO:
        if c = '@' then
          Estado:= ESPERA_SUBDOMINIO
        else if c = '.' then
          Estado:= OTRA_PALABRA
        else if not (c in atomo_chars) then
          break;
      COMILLA_TEXTO:
        if c = '\' then
          Estado:= COMILLA_CHAR
        else if c = '"' then
          Estado:= COMILLAS
        else if not (c in str_comillas) then
          break;
      COMILLA_CHAR:
        Estado:= COMILLA_TEXTO;
      COMILLAS:
        if c = '@' then
          Estado:= ESPERA_SUBDOMINIO
        else if c = '.' then
          Estado:= OTRA_PALABRA
        else
          break;
      OTRA_PALABRA:
        if c in atomo_chars then
          Estado := ATOMO
        else if c = '"' then
          Estado := COMILLA_TEXTO
        else
          break;
      ESPERA_SUBDOMINIO:
        if c in letras then
          Estado :=SUBDOMINIO
        else
          break;
      SUBDOMINIO:
        if c = '.' then begin
          inc(subdominios);
          Estado := ESPERA_SUBDOMINIO
        end else if c = '-' then
          Estado := GUION
        else if not (c in letras_digitos) then
          break;
      GUION:
        if c in letras_digitos then
          Estado := SUBDOMINIO
        else if c <> '-' then
          break;
      end;
      inc(i);
    end;
    if i <= n then
      Result := False
    else
      Result := (Estado = SUBDOMINIO) and (subdominios >= 2);

    if Result=False then  ShowMessage('Capture una Dirección de Correo Electrónico Válida. Formato: usuario@dominio.subdominio[.pais]');
end;



function NumTransacMaxima(pMesa : String; pApli : TInterApli):String;
Var l_Sql : String;
    vlResultado : String;
begin vlResultado :='';
      l_Sql:=' select DS_PARAMETRO '+
             ' from   DI_PARAMETRO_DV '+
             ' where  ID_MESA_CAMBIO = ' + pMesa +
             ' and    CVE_PARAMETRO  = ''' + cNUMTRANMAX + ''' ';
      GetSQLStr(l_sql,pApli.DataBaseName,pApli.SessionName,'DS_PARAMETRO',vlResultado,False);
      Result:=vlResultado;
end;


function Revision(pidCto,pMesaCamb,pSector,pCaptura:String; pApli:TInterApli):String;
var   vlResul:Integer;    vlCaptura:String;
Begin Revision:='F'; //revisa si el contrato esta completo y si el comprobante se debe enviar en la captura
      GetSQLInt (' select count(*) Cuenta from '+
                 '  (SELECT COUNT(*)  FROM '+
                 '    (select decode(dt.CVE_TIP_PAGO,dp.CVE_TIP_PAGO,''V'',''F'') RES '+
                 '     from di_transaccion dt, di_producto dp '+
                 '     where dt.id_contrato = '+ pidCto +
                 '     and dt.cve_operacion = ''V'' '+
                 '     and dp.id_mesa_cambio = '+ pMesaCamb +
                 '     and dt.cve_producto = dp.cve_producto) VERIFICA '+
                 '   GROUP BY RES '+
                 '   HAVING RES =''F'') '
                 ,pApli.DataBaseName,pApli.SessionName,'Cuenta',vlResul,False);
      if vlResul = 0 then
      begin
        GetSQLStr(' SELECT B_MAIL_CAPTURA '+
                  ' FROM DI_SECTOR '+
                  ' WHERE CVE_SECTOR_DIVS =  ''' + pSector + ''' '
                 ,pApli.DataBaseName,pApli.SessionName,'B_MAIL_CAPTURA',vlCaptura,False);
        if (pCaptura='V') AND (vlCaptura='V') THEN
              Revision:='V';
        if (pCaptura='F') AND (vlCaptura='F') then
              Revision:='V';
      end;
end;

function RevisionMesas(pContrato:String;pApli:TInterApli):String;
var   TRevisa : Tquery;
Begin RevisionMesas:='F'; //no tiene todas las autorizaciones
      TRevisa := getsqlquery (
                        ' SELECT  ID_CONTRATO    FROM   DI_BIT_TRANSAC '+
                        '  WHERE  ID_CONTRATO = ' + pContrato +
                        '    AND  (SIT_TRN_MC IS NULL       '+
                        '     OR   TRIM(SIT_TRN_MC) ='''' ' +
                        '     OR   SIT_TRN_MC=''AM'') '+
                        '    AND   SIT_TRN_MT = ''AC'' '+
                        '    AND   SIT_TRN_TE = ''AT'' '
                        ,pApli.DataBaseName,pApli.SessionName,True);
      try   if TRevisa = nil then  RevisionMesas:='F'
            else                   RevisionMesas:='V';
      finally TRevisa.Free;
      end;
end;

procedure AltaCarta(pTransaccion, pNumTrans:Integer; pOperacion:String; pApli:TInterApli);
Var spAlta : TStoredProc;
begin //Busca la fecha de liquidación para una Fecha de Valor específica
    spAlta:=TStoredProc.Create(Nil);
    try
       spAlta.DatabaseName:=pApli.DataBaseName;
       spAlta.SessionName :=pApli.SessionName;
       spAlta.StoredProcName:='PKGDIVISA2.STPINSERTCARTA';
       spAlta.Params.CreateParam(ftInteger,'PEID_TRANSACCION', ptInput);
       spAlta.Params.CreateParam(ftInteger,'PENUM_TRANSAC', ptInput);
       spAlta.Params.CreateParam(ftString, 'PETIP_OPERACION', ptInput);
       spAlta.Params.CreateParam(ftInteger,'PCOD',       ptOutput);
       spAlta.Params.CreateParam(ftString, 'PRESP',      ptOutput);
       spAlta.Params.ParamByName('PEID_TRANSACCION').AsInteger:=pTransaccion;
       spAlta.Params.ParamByName('PENUM_TRANSAC').AsInteger   :=pNumTrans;
       spAlta.Params.ParamByName('PETIP_OPERACION').AsString  :=pOperacion;
       spAlta.Prepare;
       spAlta.ExecProc;
       if spAlta.Params.ParamByName('PCOD').AsInteger<> 0 then
          MessageDlg(spAlta.Params.ParamByName('PRESP').AsString,mtError,[mbOK],0);

    finally spAlta.free;
    end;
end;

//mara4356 fase 2 octubre 2005
function  Execute_Factura2(pApli : TInterApli; pCto:String):String;
var qContrato,
    qOper,
    qLiquidacion,
    qLeyendas : TQuery;
    vlSQL, vlDestino,
    vlMesa,vlCondCanc:String;
    vlImpreso:Boolean;
    vlIndex  : Integer;
begin Execute_Factura2:='';
      qContrato   :=tQuery.Create(Nil);
      qOper       :=tQuery.Create(Nil);
      qLiquidacion:=tQuery.Create(Nil);
      qLeyendas   :=tQuery.Create(Nil);
      vlImpreso:=False;
      vlMesa:=IntToStr(UnidCambUsu(pApli));
      try
        qContrato.Databasename:=papli.Databasename;
        qContrato.SessionName :=papli.SessionName;
        // RAST
        qContrato.SQL.Text:=   'SELECT DI_CONTRATO.ID_CONTRATO, DI_CONTRATO.ID_CLIENTE, ' +
       ' DI_CONTRATO.NOMBRE_CLIENTE, DI_CONTRATO.CVE_MONEDA_BASE, ' +
       ' DI_CONTRATO.F_OPERACION, DI_CONTRATO.F_LIQUIDACION, ' +
       ' DI_CONTRATO.SIT_CONTRATO, DI_CONTRATO.TX_COMENTARIO, ' +
       ' PERSONA.ID_PERSONA, ' +
       ' (SELECT RTRIM (rfc.siglas_rfc)  || RTRIM (rfc.f_rfc) || RTRIM (rfc.homoclave_rfc) FROM RFC WHERE persona.ID_PERSONA = RFC.ID_PERSONA) AS RFCT, ' +
       ' DI_CLIENTE.B_IMPR_DOMIC, DOMICILIO.CALLE_NUMERO, ' +
       ' (DOMICILIO.COLONIA || '','' || CIUDAD.DESC_POBLACION) DOMIC1, ' +
       ' (ESTADO.DESC_POBLACION || '','' || POBLACION.DESC_POBLACION) DOMIC2, ' +
       ' DOMICILIO.CODIGO_POSTAL, ' +
       ' (SELECT SERIE FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) SERIE, ' +
       ' (SELECT FOLIO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) FOLIO, ' +
       ' (SELECT FECHA_CREACION FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) FECHA_CREACION, ' +
       ' (SELECT ANO_APROBACION FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) ANO_APROBACION, ' +
       ' (SELECT NUM_APROBACION FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) NUM_APROBACION, ' +
       ' (SELECT CERTIFICADO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) CERTIFICADO, ' +
       ' (SELECT SELLO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) SELLO, ' +
       ' (SELECT CADENA FROM RFE_COMPROBANTE RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) CADENA, ' +
       ' (SELECT TIPO_CAMBIO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) TIPO_CAMBIOS, ' +
       ' (SELECT METODO_PAGO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) METODO_PAGO, ' +
       ' (SELECT CUENTA FROM RFE_COMPROBANTE  WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) CUENTA, ' +
       ' (SELECT NOM_PAIS_EX FROM RFE_EMISOR WHERE RFE_EMISOR.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) NOM_PAIS_EX, ' +
       ' (SELECT NOM_ESTADO_EX FROM RFE_EMISOR WHERE RFE_EMISOR.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) NOM_ESTADO_EX, ' +
                   ' (SELECT DESC_MONEDA FROM RFE_COMPROBANTE  WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) DESC_MONEDA, ' +
       ' (SELECT REGIMEN FROM RFE_EMISOR  WHERE RFE_EMISOR.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) REGIMEN ' +
  ' FROM DI_CONTRATO, ' +
       ' POBLACION ESTADO, ' +
       ' DOMICILIO, ' +
       ' POBLACION, ' +
       ' POBLACION CIUDAD, ' +
       ' PERSONA, ' +
       ' DI_CLIENTE ' +
 ' WHERE (DI_CONTRATO.ID_CLIENTE = PERSONA.ID_PERSONA) AND ' +
       ' (DI_CONTRATO.ID_MESA_CAMBIO = ' + vlMesa + ') AND ' +
       ' (DI_CLIENTE.ID_PERSONA = DI_CONTRATO.ID_CLIENTE) ' +
       ' AND (PERSONA.ID_DOMICILIO = DOMICILIO.ID_DOMICILIO) ' +
       ' AND (PERSONA.ID_DOMICILIO = DOMICILIO.ID_DOMICILIO(+)) ' +
       ' AND (DOMICILIO.CVE_PAIS = POBLACION.CVE_POBLACION(+)) ' +
       ' AND (DOMICILIO.CVE_ESTADO = ESTADO.CVE_POBLACION(+)) ' +
       ' AND (DOMICILIO.CVE_CIUDAD = CIUDAD.CVE_POBLACION(+)) ' +
       ' AND ( DI_CONTRATO.ID_CONTRATO   = ' + pCto + ')';
                         {'SELECT DI_CONTRATO.ID_CONTRATO,' +
                         ' DI_CONTRATO.ID_CLIENTE,' +
                         ' DI_CONTRATO.NOMBRE_CLIENTE,  ' +
                         ' DI_CONTRATO.CVE_MONEDA_BASE, ' +
                         ' DI_CONTRATO.F_OPERACION,     ' +
                         ' DI_CONTRATO.F_LIQUIDACION,   ' +
                         ' DI_CONTRATO.SIT_CONTRATO,    ' +
                         ' DI_CONTRATO.TX_COMENTARIO,   ' +
                         ' PERSONA.ID_PERSONA,          ' +
                         ' RTRIM(RFC.SIGLAS_RFC) || RTRIM(RFC.F_RFC) || RTRIM(RFC.HOMOCLAVE_RFC) AS RFCT,' +
                         ' DI_CLIENTE.B_IMPR_DOMIC,     ' +
                         ' DOMICILIO.CALLE_NUMERO ,     ' +
                         ' ( DOMICILIO.COLONIA || '','' || CIUDAD.DESC_POBLACION ) DOMIC1, ' +
                         ' ( ESTADO.DESC_POBLACION || '','' || POBLACION.DESC_POBLACION ) DOMIC2, ' +
                         // EIB2AARJ : 18 nov 2010 Se incluyen nuevos campos para imprimir los campos de FE
                         //'   DOMICILIO.CODIGO_POSTAL ' +
                         ' DOMICILIO.CODIGO_POSTAL ,' +
                         ' RC.SERIE, RC.FOLIO, RC.FECHA_CREACION , RC.ANO_APROBACION, RC.NUM_APROBACION, RC.CERTIFICADO, RC.SELLO, RC.CADENA '+
                         'FROM DI_CONTRATO , POBLACION ESTADO, ' +
                         '     DOMICILIO , POBLACION, ' +
                         '     POBLACION CIUDAD, PERSONA, DI_CLIENTE, ' +
                         // EIB2AARJ : 18 nov 2010  se referencia a la tabla donde se generan los datos de FE RFE_COMPROBANTE
                         //'     RFC ' +
                         '     RFC , RFE_COMPROBANTE RC ' +
                         'WHERE (DI_CONTRATO.ID_CLIENTE     = PERSONA.ID_PERSONA)  AND ' +
                         '      (RFC.ID_PERSONA             (+)= PERSONA.ID_PERSONA)  AND ' +
                         '      (DI_CONTRATO.ID_MESA_CAMBIO = ' + vlMesa + ') AND ' +
                         '      (DI_CLIENTE.ID_PERSONA      = DI_CONTRATO.ID_CLIENTE)     AND ' +
                         '      (PERSONA.ID_DOMICILIO       = DOMICILIO.ID_DOMICILIO)     AND ' +
                         '      ( PERSONA.ID_DOMICILIO      = DOMICILIO.ID_DOMICILIO(+))  AND ' +
                         '      ( DOMICILIO.CVE_PAIS        = POBLACION.CVE_POBLACION(+)) AND ' +
                         '      ( DOMICILIO.CVE_ESTADO      = ESTADO.CVE_POBLACION(+))    AND ' +
                         '      ( DOMICILIO.CVE_CIUDAD      = CIUDAD.CVE_POBLACION(+))    AND ' +
                         // EIB2AARJ :  5 nov 2010 
                         //'      ( DI_CONTRATO.ID_CONTRATO   = ' + pCto + ')';
                         '      ( DI_CONTRATO.ID_CONTRATO   = ' + pCto + ')        AND ' +
                         '      ( DI_CONTRATO.ID_CONTRATO = RC.ID_CONTRATO(+) ) ' ;    }

       qContrato.Open;

       if qContrato.FieldByName('SIT_CONTRATO').AsString = 'CA'
       then vlCondCanc:=' AND DI_TRANSACCION.CVE_OPERACION IN (''CC'',''CV'',''CCT'',''CVT'')'
       else vlCondCanc:='';


       qOper.Databasename:=pApli.Databasename;
       qOper.SessionName :=pApli.SessionName;
       qOper.SQL.Text:='SELECT DI_TRANSACCION.ID_CONTRATO,    ' +
                       '       DI_TRANSACCION.F_OPERACION,    ' +
                       '       DI_TRANSACCION.F_LIQUIDACION,  ' +
                       '       DI_TRANSACCION.CVE_MONEDA,     ' +
                       '       DI_TRANSACCION.CVE_OPERACION,  ' +
                       '       DI_TRANSACCION.IMP_TRANS_MN,   ' +
                       '       DI_TRANSACCION.IMP_TRANS_PROD, ' +
                       '       DI_TRANSACCION.TC_OPERACION,   ' +
                       '       DI_TRANSACCION.TX_COMENTARIO,  ' +
                       '       DI_TRANSACCION.DESC_BENEF,     ' +
                       '       DI_TRANSACCION.CTA_BENEFICIARIO, ' +
                       '       DI_TRANSACCION.NOMBRE_BCO_BENEF, ' +
                       '       DI_TRANSACCION.ABA,          ' +
                       '       DI_OPERACION.DESC_L_ID_PRIM AS DESCOPER, ' +
                       '       DI_PRODUCTO.DESC_L_ID_PRIM AS DESCPROD,  ' +
                       '       MONEDA.DESC_MONEDA,          ' +
                       '       DI_TRANSACCION.CVE_PRODUCTO  ' +
                       ' FROM DI_TRANSACCION , DI_OPERACION,' +
                       '      DI_PRODUCTO, MONEDA ' +
                       ' WHERE (DI_TRANSACCION.CVE_PRODUCTO  = DI_PRODUCTO.CVE_PRODUCTO)   AND ' +
                       '       (DI_TRANSACCION.CVE_OPERACION = DI_OPERACION.CVE_OPERACION) AND ' +
                       '       (DI_TRANSACCION.ID_MESA_CAMBIO= ' + vlMesa + ') AND ' +
                       '       (DI_PRODUCTO.ID_MESA_CAMBIO   = ' + vlMesa + ') AND ' +
                       '       (DI_TRANSACCION.CVE_MONEDA    = MONEDA.CVE_MONEDA) AND  ' +
                       '       (DI_TRANSACCION.ID_CONTRATO   = ' +  pCto   + ') AND ' +
                       '       (DI_TRANSACCION.CVE_MONEDA   <> ' +  qContrato.FieldByName('CVE_MONEDA_BASE').AsString +
                      '       )' + vlCondCanc +
                      ' ORDER BY DI_TRANSACCION.ID_TRANSACCION ';
       qOper.Open;

       qLiquidacion.Databasename:=pApli.Databasename;
       qLiquidacion.SessionName :=pApli.SessionName;
       qLiquidacion.SQL.Text:='SELECT DI_TRANSACCION.ID_CONTRATO,  ' +
                              '       DI_TRANSACCION.F_OPERACION,  ' +
                              '       DI_TRANSACCION.CVE_PRODUCTO, ' +
                              '       DI_TRANSACCION.ID_GPO_TRANS, ' +
                              '       DI_TRANSACCION.F_LIQUIDACION,' +
                              '       DI_TRANSACCION.CVE_MONEDA,   ' +
                              '       DI_TRANSACCION.CVE_OPERACION,' +
                              '       DI_TRANSACCION.IMP_TRANS_MN, ' +
                              '       DI_TRANSACCION.IMP_TRANS_PROD,' +
                              '       DI_TRANSACCION.TC_OPERACION,  ' +
                              '       DI_TRANSACCION.TX_COMENTARIO, ' +
                              '       DI_PRODUCTO.DESC_L_ID_PRIM AS DESCPROD,   ' +
                              '       DI_OPERACION.DESC_L_ID_PRIM AS DESCOPER   ' +
                              ' FROM DI_TRANSACCION , DI_OPERACION,  ' +
                              ' DI_PRODUCTO ' +
                              ' WHERE (DI_TRANSACCION.CVE_OPERACION = DI_OPERACION.CVE_OPERACION)  AND ' +
                              '       (DI_TRANSACCION.CVE_PRODUCTO  = DI_PRODUCTO.CVE_PRODUCTO)    AND  ' +
                              '       (DI_TRANSACCION.ID_MESA_CAMBIO= ' + vlMesa + ') AND ' +
                              '       (DI_PRODUCTO.ID_MESA_CAMBIO   = ' + vlMesa + ') AND ' +
                              '       (DI_TRANSACCION.ID_CONTRATO   = ' + pCto + ') AND  ' +
                              '       (DI_TRANSACCION.CVE_MONEDA   = ' + qContrato.FieldByName('CVE_MONEDA_BASE').AsString + ')' +
                               vlCondCanc +
                              ' ORDER BY DI_TRANSACCION.ID_TRANSACCION ';

      qLiquidacion.Open;

      qleyendas.DatabaseName:=pApli.DataBaseName;
      qleyendas.SessionName:=pApli.SessionName;
      qleyendas.Close;
      qleyendas.SQL.Text:='SELECT  SEC.CVE_SECTOR_DIVS, SEC.B_LEY_CELECT, PAR.CVE_PARAMETRO, PAR.DS_PARAMETRO '+
                          '  FROM  DI_SECTOR SEC, DI_PARAMETRO_DV PAR, DI_CONTRATO CON '+
                          ' WHERE SEC.CVE_SECTOR_DIVS=CON.CVE_SECTOR_DIVS '+
                          '   AND PAR.ID_MESA_CAMBIO=CON.ID_MESA_CAMBIO '+
                          '   AND CON.ID_CONTRATO='+pCto+
                          '   AND SEC.B_LEY_CELECT=''V'' '+
                          '   AND PAR.CVE_PARAMETRO IN ( '+
                          '       SELECT CVE_PARAMETRO FROM DI_PARAMETRO_DV '+
                          '        WHERE CVE_PARAMETRO LIKE (''%NOM_PERC%'') '+
                          '           OR CVE_PARAMETRO LIKE (''%TEL_PERC%'')) ';
      qleyendas.Open;

      Execute_Factura2:=ArmaArchivoHTML(qContrato,qOper,qLiquidacion,qLeyendas);
      finally
         if qContrato <> nil then qContrato.free;
         if qOper     <> nil then qOper.free;
         if qLiquidacion <> nil then qLiquidacion.free;
         if qLeyendas <> nil then qLeyendas.free;
      end;
end;

//para hacer el archivo en HTML OCTUBRE 2005
function ArmaArchivoHTML(pContrato : TQuery; pOperacion: TQuery; pLiquidacion:TQuery; pLeyendas:TQuery):String;
var l_Cto, l_Archivo, vlOperacion,
    vlProducto, vlImpProducto,
    vlTCambio, vlImpPesos, vlComentario,
    vlNom, vlTelefono, vlTTotal :String;
    vlContador, i: Integer;
    vlConsulta   : TQuery;
    vlTotal, vlPesos      : Double;
begin
  ArmaArchivoHTML:='';
  l_Cto:=pContrato.FieldByName('ID_CONTRATO').AsString;
  l_Archivo:='';
  l_Archivo:='<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';
  l_Archivo:=l_Archivo + #13#10 + '<html>';
  l_Archivo:=l_Archivo + #13#10 + '<head>';
  l_Archivo:=l_Archivo + #13#10 + '<title>Comprobante de Operaci&oacute;n Cambiaria '+l_Cto+'</title>';
  l_Archivo:=l_Archivo + #13#10 + '<meta http-equiv="Content-Type" content="text/html">';
  l_Archivo:=l_Archivo + #13#10 + '</head>';
  l_Archivo:=l_Archivo + #13#10 + '<body style="font-family:Arial, Helvetica, sans-serif;font-size:10px ">';
  l_Archivo:=l_Archivo + #13#10 + '<table width="100%"  border="0" cellspacing="0" cellpadding="0">';
  l_Archivo:=l_Archivo + #13#10 + '  <tr>';
  l_Archivo:=l_Archivo + #13#10 + '    <th colspan="2" bgcolor="#CCCC99" scope="col">C L I E N T E</th>';
  l_Archivo:=l_Archivo + #13#10 + '    <th width="10" scope="col">&nbsp;</th>';
  l_Archivo:=l_Archivo + #13#10 + '    <td width="150" bgcolor="#CCCC99" scope="col"><div align="center"><strong>F. CONCERTACION </strong></div></td>';
  l_Archivo:=l_Archivo + #13#10 + '    <td width="9" scope="col">&nbsp;</td>';
//  l_Archivo:=l_Archivo + #13#10 + '    <td width="258" rowspan="6" scope="col"><div align="center"><img src="http://www.gfinter.com/iline_logo2.gif" width="208" height="69"></div>      <div align="center"></div></td>';
  l_Archivo:=l_Archivo + #13#10 + '    <td width="258" rowspan="6" scope="col"><div align="center"><img src="http://www.interacciones.com/LogoBancaMuntiple.BMP" width="208" height="69"></div>      <div align="center"></div></td>';
  l_Archivo:=l_Archivo + #13#10 + '  </tr>';
  l_Archivo:=l_Archivo + #13#10 + '  <tr>';
  l_Archivo:=l_Archivo + #13#10 + '    <th colspan="2" scope="row">&nbsp;</th>';
  l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
  l_Archivo:=l_Archivo + #13#10 + '    <td><div align="center">'+pContrato.FieldByName('F_OPERACION').AsString+'</div></td>';
  l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
  l_Archivo:=l_Archivo + #13#10 + '  </tr>';
  l_Archivo:=l_Archivo + #13#10 + '  <tr>';
  l_Archivo:=l_Archivo + #13#10 + '    <td colspan="2" scope="row">'+pContrato.FieldByName('NOMBRE_CLIENTE').AsString+'</td>';
  l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
  l_Archivo:=l_Archivo + #13#10 + '    <td bgcolor="#CCCC99"><div align="center"><strong>F. LIQUIDACION</strong></div></td>';
  l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
  l_Archivo:=l_Archivo + #13#10 + '  </tr>';
  if pContrato.FieldByName('B_IMPR_DOMIC').AsString = 'V' then
  begin
    l_Archivo:=l_Archivo + #13#10 + '  <tr>';
    l_Archivo:=l_Archivo + #13#10 + '    <td colspan="2" scope="row">'+pContrato.FieldByName('CALLE_NUMERO').AsString+'</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td><div align="center">'+pContrato.FieldByName('F_LIQUIDACION').AsString+'</div></td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '  </tr>';
    l_Archivo:=l_Archivo + #13#10 + '  <tr>';
    l_Archivo:=l_Archivo + #13#10 + '    <td colspan="2" scope="row">'+pContrato.FieldByName('DOMIC1').AsString+'</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td bgcolor="#CCCC99"><div align="center"><strong>OPERACION</strong></div></td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '  </tr>';
    l_Archivo:=l_Archivo + #13#10 + '  <tr>';
    l_Archivo:=l_Archivo + #13#10 + '    <td colspan="2" scope="row">'+pContrato.FieldByName('DOMIC2').AsString+'</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td><div align="center">'+pContrato.FieldByName('ID_CONTRATO').AsString+'</div></td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '  </tr>';
    l_Archivo:=l_Archivo + #13#10 + '  <tr>';
    l_Archivo:=l_Archivo + #13#10 + '    <td width="205" scope="row">'+pContrato.FieldByName('CODIGO_POSTAL').AsString+'</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td width="182" scope="row">'+pContrato.FieldByName('RFCT').AsString+'</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td><div align="center">COMPROBANTE DE OPERACION</div></td>';
    l_Archivo:=l_Archivo + #13#10 + '  </tr>';
    l_Archivo:=l_Archivo + #13#10 + '</table>';
  end else begin
    l_Archivo:=l_Archivo + #13#10 + '  <tr>';
    l_Archivo:=l_Archivo + #13#10 + '    <td colspan="2" scope="row">&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td><div align="center">'+pContrato.FieldByName('F_LIQUIDACION').AsString+'</div></td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '  </tr>';
    l_Archivo:=l_Archivo + #13#10 + '  <tr>';
    l_Archivo:=l_Archivo + #13#10 + '    <td colspan="2" scope="row">&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td bgcolor="#CCCC99"><div align="center"><strong>OPERACION</strong></div></td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '  </tr>';
    l_Archivo:=l_Archivo + #13#10 + '  <tr>';
    l_Archivo:=l_Archivo + #13#10 + '    <td colspan="2" scope="row">&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td><div align="center">'+pContrato.FieldByName('ID_CONTRATO').AsString+'</div></td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '  </tr>';
    l_Archivo:=l_Archivo + #13#10 + '  <tr>';
    l_Archivo:=l_Archivo + #13#10 + '    <td width="205" scope="row">&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td width="182" scope="row">&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td><div align="center">COMPROBANTE DE OPERACION</div></td>';
    l_Archivo:=l_Archivo + #13#10 + '  </tr>';
    l_Archivo:=l_Archivo + #13#10 + '</table>';
  end;
  l_Archivo:=l_Archivo + #13#10 + '<BR>';
  l_Archivo:=l_Archivo + #13#10 + '<table width="100%"  border="0" cellspacing="0" cellpadding="0">';
  l_Archivo:=l_Archivo + #13#10 + '  <tr bgcolor="#CCCC99">';
  l_Archivo:=l_Archivo + #13#10 + '    <th width="12%" scope="col">TIPO OPN. </th>';
  l_Archivo:=l_Archivo + #13#10 + '    <th width="36%" scope="col">PRODUCTO</th>';
  l_Archivo:=l_Archivo + #13#10 + '    <th width="16%" scope="col">CANTIDAD</th>';
  l_Archivo:=l_Archivo + #13#10 + '    <th width="17%" scope="col">TIPO DE CAMBIO </th>';
  l_Archivo:=l_Archivo + #13#10 + '    <th width="19%" scope="col">IMPORTE MONEDA NACIONAL</th>';
  l_Archivo:=l_Archivo + #13#10 + '  </tr>';
  //seccion de operaciones y liquidaciones
  for i:=1 to 2 do
  begin
    if i=1
    then vlConsulta:=pOperacion
    else vlConsulta:=pLiquidacion;
    vlTotal      :=0;
    vlContador   :=0;
    while not vlConsulta.EOF do
    begin
      if (i=1) then begin
        if (COPY(vlConsulta.FieldByName('CVE_PRODUCTO').AsString,1,2) = 'CO') OR
           (COPY(vlConsulta.FieldByName('CVE_PRODUCTO').AsString,1,2) = 'IV')
        then vlOperacion  :=''
        else vlOperacion  :=LlenaEspDer(Trim(vlConsulta.FieldByName('DESCOPER').AsString),15)
        end
      else vlOperacion  :='';
      vlProducto    := Trim(vlConsulta.FieldByName('DESCPROD').AsString);
      vlImpProducto := FormatFloat('###,###,###,##0.00',vlConsulta.FieldByName('IMP_TRANS_PROD').AsFloat);
//      vlTCambio    :=FormatFloat('##,##0.0000',vlConsulta.FieldByName('TC_OPERACION').AsFloat);
      vlTCambio     := FormatFloat('##,##0.00000000',vlConsulta.FieldByName('TC_OPERACION').AsFloat); //rohs4279 ago/2015 req. GD2015004-026
      if (vlConsulta.FieldByName('CVE_OPERACION').AsString = 'C')  or
         (vlConsulta.FieldByName('CVE_OPERACION').AsString = 'CT') or
         (vlConsulta.FieldByName('CVE_OPERACION').AsString = 'CC')
      then begin
        vlPesos:=vlConsulta.FieldByName('IMP_TRANS_MN').AsFloat;
        vlTotal:=vlTotal + vlConsulta.FieldByName('IMP_TRANS_MN').AsFloat
      end
      else begin
        vlPesos:=vlConsulta.FieldByName('IMP_TRANS_MN').AsFloat * -1;
        vlTotal:=vlTotal - vlConsulta.FieldByName('IMP_TRANS_MN').AsFloat;
      end;
      vlImpPesos   :=FormatFloat('$###,###,###,##0.00',vlPesos);
      l_Archivo:=l_Archivo + #13#10 + '  <tr>';
      l_Archivo:=l_Archivo + #13#10 + '    <td>'+vlOperacion+'</td>';
      l_Archivo:=l_Archivo + #13#10 + '    <td>'+vlProducto+'</td>';
      l_Archivo:=l_Archivo + #13#10 + '    <td><div align="right">'+vlImpProducto+'</div></td>';
      l_Archivo:=l_Archivo + #13#10 + '    <td><div align="right">'+vlTCambio+'</div></td>';
      l_Archivo:=l_Archivo + #13#10 + '    <td><div align="right">'+vlImpPesos+'</div></td>';
      l_Archivo:=l_Archivo + #13#10 + '  </tr>';
      inc(vlContador);
      vlConsulta.Next;
    end; //while
    vlTTotal:=FormatFloat('###,###,###,##0.00',vlTotal);
    l_Archivo:=l_Archivo + #13#10 + '  <tr>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td>&nbsp;</td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td><div align="right"></div></td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td bgcolor="#FF9900"><div align="right"><strong>TOTAL</strong></div></td>';
    l_Archivo:=l_Archivo + #13#10 + '    <td bgcolor="#FF9900"><div align="right"><strong>'+(vlTTotal)+'</strong></div></td>';
    l_Archivo:=l_Archivo + #13#10 + '  </tr>';
    l_Archivo:=l_Archivo + #13#10 + '<tr><td colspan="5">&nbsp;</td></tr>';
    l_Archivo:=l_Archivo + #13#10 + '  <tr bgcolor="#CCCC99">';
    l_Archivo:=l_Archivo + #13#10 + '    <th colspan="5" scope="col">L I Q U I D A C I O N </th>';
    l_Archivo:=l_Archivo + #13#10 + '  </tr>';
  end; // for
  l_Archivo:=l_Archivo + #13#10 + '<tr><td colspan="5">&nbsp;</td></tr>';
  l_Archivo:=l_Archivo + #13#10 + '  <tr>';
  l_Archivo:=l_Archivo + #13#10 + '    <td bgcolor="#CCCC99" colspan="5"><div align="center"><strong>O B S E R V A C I O N E S </strong></div></td>';
  l_Archivo:=l_Archivo + #13#10 + '  </tr>';
  if pContrato.FieldByName('SIT_CONTRATO').AsString = 'CA'
  then vlComentario:='Este Contrato ya fue liquidado  y se esta <CANCELANDO> en este momento'
  else vlComentario:=pContrato.FieldByName('TX_COMENTARIO').AsString;

  l_Archivo:=l_Archivo + #13#10 + '  <tr>';
  l_Archivo:=l_Archivo + #13#10 + '    <td colspan="5">'+vlComentario+'</td>';
  l_Archivo:=l_Archivo + #13#10 + '  </tr>';
  // 9dic2005 EFS Por solicitud de Esteban Cortes se modifica la leyenda del comprobante.  Autorizo A Magana
  //l_Archivo:=l_Archivo + #13#10 + '<p><strong>ESTE COMPROBANTE NO TIENE VALIDEZ FISCAL</strong></p>';
  vlComentario:='ESTE DOCUMENTO ES SOLO INFORMATIVO Y NO TIENE VALIDEZ LEGAL O FISCAL, NI TIENE EL CARACTER DE RECIBO Y UNICAMENTE COMPRUEBA LA(S) CONDICION(ES) DE LA(S)';
  l_Archivo:=l_Archivo + #13#10 + '  <tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr><tr>';
  l_Archivo:=l_Archivo + #13#10 + '    <td colspan="5">'+vlComentario+'</td>';
  l_Archivo:=l_Archivo + #13#10 + '  </tr>';
  vlComentario:='OPERACION(ES) DESCRITA(S).';
  l_Archivo:=l_Archivo + #13#10 + '  <tr>';
  l_Archivo:=l_Archivo + #13#10 + '    <td colspan="5">'+vlComentario+'</td>';
  l_Archivo:=l_Archivo + #13#10 + '  </tr>';
  l_Archivo:=l_Archivo + #13#10 + '</table>';
  vlNom:='';
  vlTelefono:='';
  if not pLeyendas.IsEmpty then
  begin
    while Not pleyendas.Eof do
    begin
      if Copy(pLeyendas.FieldByName('CVE_PARAMETRO').AsString,1,8) = 'NOM_PERC' then
         if Trim(vlNom)='' then
            vlNom:=vlNom+pLeyendas.FieldByName('DS_PARAMETRO').AsString
         else
            vlNom:=vlNom+';'+pLeyendas.FieldByName('DS_PARAMETRO').AsString
      else vlTelefono:= vlTelefono+pLeyendas.FieldByName('DS_PARAMETRO').AsString;
      pLeyendas.Next;
    end;
  end;
  // 9dic2005 EFS si el cliente pertenece a un sector que requiere la leyenda de confirmacion
  //              presenta los datos configurados en DV_PARAMETRO_DV
  //if Trim(vlNom)='' then  Se elimina esta condicion ya que presentaba la leyenda sin datos
  if Trim(vlNom)<>'' then
  begin
     l_Archivo:=l_Archivo + #13#10 + '<BR>';
     l_Archivo:=l_Archivo + #13#10 + '<table width="100%"  border="0" cellspacing="0" cellpadding="0">';
     l_Archivo:=l_Archivo + #13#10 + '<p><strong>CONFIRMACIÓN   DE   OPERACIÓN </strong></p>';
     // 9DIC2005 EFS SE MODIFICAN LAS LEYENDAS. SOLICITADO POR ESTEBAN CORTES
     //l_Archivo:=l_Archivo + #13#10 + '<p><strong> En caso de no estar de acuerdo con la operación favor de comunicarse con: </strong></p>';
     vlComentario:='En caso de aclaraciones sobre el contenido del presente documento, agradeceremos se sirvan comunicarse con: ';
     l_Archivo:=l_Archivo + #13#10 + '  <tr><td>&nbsp;</td></tr><tr>';
     l_Archivo:=l_Archivo + #13#10 + '    <td colspan="5">'+vlComentario+'</td>';
     l_Archivo:=l_Archivo + #13#10 + '  </tr>';
     l_Archivo:=l_Archivo + #13#10 + '  <tr><td colspan="5">'+vlNom+'</td></tr>';
     l_Archivo:=l_Archivo + #13#10 + '  <tr><td colspan="5">al teléfono '+vlTelefono+'</td></tr>';
     // 9dic2005 EFS Se modifica la variable ya que debe presentar el telefono no el nombre
     //l_Archivo:=l_Archivo + #13#10 + '<p><strong>al teléfono '+vlNom+'</strong></p>';
     l_Archivo:=l_Archivo + #13#10 + '</table>';
  end;
  l_Archivo:=l_Archivo + #13#10 + '</body>';
  l_Archivo:=l_Archivo + #13#10 + '</html>';
  ArmaArchivoHTML:=l_Archivo;
  pOperacion.Close;
  pLiquidacion.Close;
  PContrato.Close;
  pLeyendas.Close;
end;

function CadenaToHtml(PECadena: String): String;
var
   l_cont : integer;
   l_Cadena: String;
begin
  l_Cadena:= '';
  for l_cont := 1 to Length(PECadena) do begin
      l_Cadena := l_Cadena + CaracterToHtml(PECadena[l_cont]);
  end;//for
  Result := l_Cadena;
end;//function

function CaracterToHtml(PECaracter: char): String;
begin
  if(PECaracter in ['á','é','í','ó','ú','ñ','Á','É','Í','Ó','Ú','Ñ'])then begin
     case Ord(PECaracter) of
       Ord('á') : Result := '&aacute;';
       Ord('é') : Result := '&eacute;';
       Ord('í') : Result := '&iacute;';
       Ord('ó') : Result := '&oacute;';
       Ord('ú') : Result := '&uacute;';
       Ord('ñ') : Result := '&nacute;';
       Ord('Á') : Result := '&Aacute;';
       Ord('É') : Result := '&Eacute;';
       Ord('Í') : Result := '&Iacute;';
       Ord('Ó') : Result := '&Oacute;';
       Ord('Ú') : Result := '&Uacute;';
       Ord('Ñ') : Result := '&Nacute;';
       else
          Result := PECaracter;
     end;//case
  end//if
  else
     Result := PECaracter;
end;//function

function ProcLimites(peMESA, peCONTRATO, peOPERACIONES:Integer; pApli:TInterApli):Boolean;
var spLimites : TStoredProc;
begin Result:=False;
//      if vOpnDolar = 0  then
      if peOPERACIONES = 0  then
      begin Result:=True;
            EXIT;
      end;
      spLimites:=TStoredProc.Create(Nil);
      try
        spLimites.StoredProcName:='PKGDIVISA2.STPVALIDALIMITES';
        spLimites.DatabaseName:=pApli.DataBaseName;
        spLimites.SessionName:=pApli.SessionName;
        spLimites.Params.CreateParam(ftInteger,'PCONTRATO',ptInput);
        spLimites.Params.CreateParam(ftInteger,'PMESA',    ptInput);
        spLimites.Params.CreateParam(ftString,'PTIPO_PROC',ptInput);
        spLimites.Params.CreateParam(ftInteger,'PCOD',     ptOutput);
        spLimites.Params.CreateParam(ftString, 'PRESP',    ptOutput);
        spLimites.ParamByName('PCONTRATO').AsInteger:=peCONTRATO; //Objeto.ID_CONTRATO.AsInteger;
        spLimites.ParamByName('PMESA').AsInteger    :=peMESA; //Objeto.ID_MESA_CAMBIO.AsInteger;
        spLimites.ParamByName('PTIPO_PROC').AsString:=cOPERACION;
        spLimites.ExecProc;
        if spLimites.ParamByName('pCod').AsInteger <> 0 then    //ocurrio un error
           ShowMessage (spLimites.ParamByName('pResp').AsString)
        else Result:=True;
    finally spLimites.free;
    end;
end;


procedure ActualizaCarta(peID_SOLICITUD, peID_CONTRATO : Integer; peF_OPERACION : TDate; pApli:TInterApli);
var spActCarta : TStoredProc;
begin spActCarta:=TStoredProc.Create(Nil);
      try
        spActCarta.StoredProcName:='PKGDIVISA2.STPACTUALIZACARTA';
        spActCarta.DatabaseName:=pApli.DataBaseName;
        spActCarta.SessionName:=pApli.SessionName;
        spActCarta.Params.CreateParam(ftInteger,'PEID_SOLICITUD',ptInput);
        spActCarta.Params.CreateParam(ftInteger,'PEID_CONTRATO', ptInput);
        spActCarta.Params.CreateParam(ftDate,   'PEF_OPERACION', ptInput);
        spActCarta.Params.CreateParam(ftString, 'PRESULTADO',    ptOutput);
        spActCarta.Params.CreateParam(ftString, 'PDESRESULTADO', ptOutput);
        spActCarta.ParamByName('PEID_SOLICITUD').AsInteger:=peID_SOLICITUD;
        spActCarta.ParamByName('PEID_CONTRATO').AsInteger :=peID_CONTRATO;
        spActCarta.ParamByName('PEF_OPERACION').AsDate    :=peF_OPERACION;
        spActCarta.ExecProc;
        if spActCarta.ParamByName('PRESULTADO').AsInteger <> 0 then    //ocurrio un error
           ShowMessage (spActCarta.ParamByName('PDESRESULTADO').AsString);
    finally spActCarta.free;
    end;
end;

Function ObtenUsuario:String;
Var
  lpBuffer: lpstr;
  success: Boolean;
  nSize: DWord;
Begin
  nSize := 255;
  Result := '';
  GetMem(lpBuffer, 255);
  try
    success := GetUserName(lpBuffer, nSize);
    if not success then
    MessageDlg('Ocurrio un error al obtener el USUARIO', mtInformation, [mbOK], 0);
    Result := UpperCase(StrPas(lpBuffer));
  finally
    FreeMem(lpBuffer);
  end;
End;

function RevisaVB(pidCto,pMesaCamb:String; pApli:TInterApli):String;
var strSQL : String;
    vlResul:Integer;
begin
   RevisaVB:='F';
   strSQL:=
      ' select sum(cuenta) cuenta from '+
      '   (select count(*) Cuenta from '+
      '      (SELECT COUNT(*)  FROM '+
      '         (select decode(dt.CVE_TIP_PAGO,dp.CVE_TIP_PAGO,''V'',''F'') RES '+
      '          from di_transaccion dt, di_producto dp '+
      '          where dt.id_contrato = '+ pidCto +
      '          and dt.cve_operacion = ''V'' '+
      '          and dp.id_mesa_cambio = '+ pMesaCamb +
      '          and dt.cve_producto = dp.cve_producto) VERIFICA '+
      '       GROUP BY RES '+
      '       HAVING RES =''F'')), '+
      '   (select count(*) from di_transaccion '+
      '    where id_contrato= '+ pidCto +
      '    and   (cve_operacion = ''C'' and cve_tip_pago = ''SIAC'')) ';
   GetSQLInt (strSQL,pApli.DataBaseName,pApli.SessionName,'Cuenta',vlResul,False);
   if (vlResul=0) then
      RevisaVB:='V';
end;

//20feb2006 EFS Obtiene y actualiza el folio corporativo
function  FolioCorp(pIdEmpresa: Integer; pCveFolio: String;pApli:TInterApli): Integer;
Var
  QyQuery: Tquery;
  vlSql: String;
  pNumFolio: integer;
begin
  pNumFolio:= 0;
  vlSql:= ' Select Num_Folio+1 As Num_Folio ' +
         '   From Folio_Corp ' +
         '  Where Id_Empresa = ' + IntToStr(pIdEmpresa) +
         '    And Cve_Folio = ''' + pCveFolio + ''''  ;

  qyQuery:=GetSQLQuery(vlSQL,pApli.DataBaseName, pApli.SessionName,False);
  If qyQuery<>Nil Then Begin
    pNumFolio:=  qyQuery.fieldbyName('Num_Folio').AsInteger;

    vlSql:= ' Update Folio_Corp ' +
           '    Set Num_Folio = ' + IntToStr(pNumFolio) +
           '  Where Id_Empresa = ' + IntToStr(pIdEmpresa) +
           '    And Cve_Folio = ''' + pCveFolio + ''''  ;
    RunSQL(vlSql, pApli.DataBaseName, pApli.SessionName,True);

    qyQuery.Free;
  End;
  Result := pNumFolio;
End;

//Busca la impresora de acuerdo al usuario, la empresa y la mesa de cambio
procedure BuscaImpresora2(pMesa, pContrato: String; var  vlDestino, vlDestino2,vlDestino3,vlDestino4: String; pApli:TInterApli);
Var vlOperacion, vlSQL : String; vlOpnVB:Integer;
    TRevisa : Tquery;
begin
      GetSQLInt(' SELECT COUNT(CVE_PRODUCTO) CUENTA '+
                ' FROM   DI_PROD_UNIDAD DP, DI_UNIDAD_CAMBIO DU '+
                ' WHERE  DU.ID_MESA_CAMBIO = ' +  pMesa  +
                ' AND    DU.CVE_USUARIO    = ' +
                '           (SELECT CVE_USUARIO FROM DI_CONTRATO WHERE ID_CONTRATO='+pContrato+') '+
                ' AND    DP.CVE_TIPO_UNIDAD= DU.CVE_TIPO_UNIDAD '+
                ' AND    DU.ID_MESA_CAMBIO = DP.ID_MESA_CAMBIO '+
                ' AND    DP.CVE_PRODUCTO IN '+
                '           (SELECT CVE_PRODUCTO FROM DI_TRANSACCION WHERE ID_CONTRATO='+pContrato+')',
                pApli.DataBaseName,pApli.SessionName,'CUENTA',vlOpnVB,False);

      if vlOpnVB = 0 then
         vlOperacion :='NOVENTANILLA'
      else
         vlOperacion :='VENTANILLA';

      vlSQL:=' SELECT DI.IMPRESORA_CTO, DI.DS_TIPO '+
             ' FROM   di_unidad_cambio DU, di_config_imp DC, DI_IMPRESORAS DI '+
             ' where  DU.ID_MESA_CAMBIO = '+ PMesa+
             ' AND    DU.cve_usuario    = '+ //='''+ pApli.Usuario +  '''' +
             '           (SELECT CVE_USUARIO FROM DI_CONTRATO WHERE ID_CONTRATO='+pContrato+') '+
             ' AND    DU.ID_MESA_CAMBIO=DC.ID_MESA_CAMBIO '+
             ' AND    DU.ID_REGION_CAMBIO=DC.ID_REGION_CAMBIO '+
             ' AND    DU.ID_ENTIDAD = DC.ID_ENTIDAD '+
             ' AND    DC.TIPO_OPERACION='''+vlOperacion+''' '+
             ' AND    DC.ID_CONFIGURACION = DI.ID_CONFIGURACION ';

      TRevisa := getsqlquery (vlSQL,pApli.DataBaseName,pApli.SessionName,True);

      try
        if TRevisa = nil then
          begin
            GetSQLStr('SELECT UNI.IMPRESORA_CTO ' +
                      '  FROM DI_UNIDAD_CAMBIO UNI' +
                      ' WHERE UNI.ID_MESA_CAMBIO = '   +  pMesa  +  ' AND ' +
                      '       UNI.CVE_USUARIO    = ''' +  pApli.Usuario +  '''',
                      pApli.DataBaseName,pApli.SessionName,'IMPRESORA_CTO',vlDestino,False);
            vlDestino2:=vlDestino;
            //vlDestino3:=vlDestino;
            //vlDestino4:=vlDestino;
          end
        else
          begin
            TRevisa.open;
            TRevisa.First;
            WHILE NOT (TRevisa.Eof) DO
            BEGIN
               if TRevisa.FieldByName('DS_TIPO').AsString='CLIENTE' then
                  vlDestino:=TRevisa.FieldByName('IMPRESORA_CTO').AsString
               else if TRevisa.FieldByName('DS_TIPO').AsString='OPERACION' then
                  vlDestino2:=TRevisa.FieldByName('IMPRESORA_CTO').AsString;
               {else if TRevisa.FieldByName('DS_TIPO').AsString='ARCHIVO' then
                  vlDestino3:=TRevisa.FieldByName('IMPRESORA_CTO').AsString
               else if TRevisa.FieldByName('DS_TIPO').AsString='CONTABILIDAD' then
                  vlDestino4:=TRevisa.FieldByName('IMPRESORA_CTO').AsString;}
               TRevisa.Next;
            END;
            if Trim(vlDestino2)='' then vlDestino2:=vlDestino;
            {if Trim(vlDestino3)='' then vlDestino3:=vlDestino;
            if Trim(vlDestino4)='' then vlDestino4:=vlDestino;}
          end;
      finally
        TRevisa.Free;
      end;
end;

function PuedeVerSucs(pObjeto:TInterFrame):Boolean;
begin //Si el usuario tiene una excepción, no valida máximos ni mínimos
      if GetSql('SELECT Cve_Oper_acc From Secu_Oper_Acc ' +
                ' WHERE Cve_Funcion = ''' + pObjeto.Apli.LastFuncion + '''' +
                '   and Cve_Usuario = ''' + pObjeto.Apli.Usuario     + '''' +
                '   and Cve_Oper_Acc= ''VS''',
                pObjeto.Apli.DataBaseName, pObjeto.Apli.SessionName, False)
      then PuedeVerSucs:=True
      else PuedeVerSucs:=False;
end;

//02mar2006 EFS Obtiene el Monto en Dólares de la Operación
function ObtMontoMaxCan(Padre: TInterFrame;peIdContrato, peIdMesa:String):Double;
var spValida : TStoredProc;
begin
    spValida:=TStoredProc.Create(Nil);
    try
       ObtMontoMaxCan:=-0;
       spValida.DatabaseName:=Padre.DataBaseName;
       spValida.SessionName :=Padre.SessionName;
       spValida.StoredProcName:='PKGDIVISA2.STPMONTOUSADO';
       spValida.Params.CreateParam(ftFloat, 'PEIDCONTRATO',  ptInput);
       spValida.Params.CreateParam(ftFloat,'PEIDMESACAMBIO',ptInput);
       spValida.Params.CreateParam(ftFloat,  'PSMONTO',       ptOutput);
       spValida.Params.CreateParam(ftInteger,'psCODIGO',      ptOutput);
       spValida.Params.CreateParam(ftString, 'psTEXT',        ptOutput);
       spValida.Params.ParamByName('PEIDCONTRATO').AsFloat:=StrToFloat(peIdContrato);
       spValida.Params.ParamByName('PEIDMESACAMBIO').AsFloat:=StrToFloat(peIdMesa);
       spValida.Prepare;
       spValida.ExecProc;
       if (spValida.ParamByName('psCODIGO').AsInteger<>0) then
          MessageDlg('Error al obtener Monto en Dólares de la Operación ',mtError,[mbOK],0)
       else
          ObtMontoMaxCan:=spValida.ParamByName('PSMONTO').AsFloat;
    finally spValida.free;
    end;
end;
// EFS Valida que el monto de la operación no exceda el monto máximo permitido
function validaMonCan(Padre: TInterFrame;peIdContrato, peIdMesaCambio:String):Boolean;
var vlImpMaxCanc:  String;
    vlMontoDls:Double;
begin
    validaMonCan:=False;
    vlImpMaxCanc:= ObtenSit(Padre, cImpMaxCanc); //Obtiene Imp Max Cancelacion
    vlMontoDls:=ObtMontoMaxCan(Padre,peIdContrato, peIdMesaCambio);
    if (vlMontoDls > StrToFloat(vlImpMaxCanc)) then begin // Compara Monto en Dls Operacion con Imp Max Canc
        MessageDlg('La Operación excede el Monto Máximo para Cancelación ('+
                    vlImpMaxCanc + ') '+ chr(13)+'Favor de Solicitar a Mesa de Cambios que Cancele la Operación.'
                   ,mtError,[mbOK],0);
        validaMonCan:=True;
    end;
end;


{ Valida la fecha límite para cancelar operaciones }
Function ValidaFechaLimiteCancela(pIdContrato, pMesaCambios: String; pObjeto: TInterFrame): Boolean;
Var
  qOperacion: TQuery;
  Resultado: Boolean;
Begin
  Resultado:= False;
  qOperacion:=
    GetSQLQuery(
      ' Select ' +
      '   Id_Contrato, ' +
      '   F_Operacion, ' +
      '   F_Hoy, ' +
      '   Num_Dias_Cancela, ' +
      '   PkgFunProcCorp.FhabilProxima (''PAMEXI'', F_Hoy, Num_Dias_Cancela * -1) F_Max_Cancela ' +
      ' From ( ' +
      '     Select ' +
      '       Id_Contrato, ' +
      '       F_Operacion, ' +
      '       (Select PkgFunProcCorp.FReferencia(''' + cMismoDia + ''', ' + IntToStr(cEmpresaCC) + ') From Dual) F_Hoy, ' +
      '       Nvl((Select DS_Parametro From DI_Parametro_DV Where Id_Mesa_Cambio = ' + pMesaCambios + ' and Cve_Parametro = ''' + cLIMCANCELA + '''), 0) Num_Dias_Cancela ' +
      '     From Di_Contrato ' +
      '     Where Id_Contrato = ' + pIdContrato + ' ) ',
      pObjeto.DataBaseName,
      pObjeto.SessionName,
      False);
  Try
    Try
      If qOperacion = nil Then
        Raise EInterFrame.Create('No existe la operación ' + pIdContrato);

      If qOperacion.FieldByName('Num_Dias_Cancela').AsInteger = 0 Then
        Raise EInterFrame.Create('No se ha configurado el parámetro LIMCANCELA para la mesa de cambios ' + pMesaCambios);

      If qOperacion.FieldByName('F_Operacion').AsDateTime < qOperacion.FieldByName('F_Max_Cancela').AsDateTime Then
        Raise EInterFrame.Create('La operación se realizó el ' + qOperacion.FieldByName('F_Operacion').AsString + ' y la fecha maxima para cancelar operaciones es el ' + qOperacion.FieldByName('F_Max_Cancela').asString)
      else
        Resultado:= True;

    Except
      On e: Exception do MessageDlg('No se puede cancelar la Operación. ' + chr(VK_RETURN) + e.Message, mtWarning, [mbOK], 0);
    end;
  Finally
    Result:= Resultado;
    qOperacion.Free; qOperacion:= nil;
  end;
end;



function BuscaCorreo(pApli:TInterApli):String;
var vlCorreo:String;
begin vlCorreo:=DLookup(pApli.databasename,pApli.SessionName,
                'E_MAIL_OFIC','DIREC_EMPLEADO',
                'ID_EMPLEADO=(select id_persona from usuario where cve_usuario ='''+pApli.Usuario+''')');
      IF Trim(vlCorreo) = '' THEN
      begin
         vlCorreo:=DLookup(pApli.databasename,pApli.SessionName,
                   'E_MAIL','PERSONA',
                  'ID_PERSONA=(select id_persona from usuario where cve_usuario ='''+pApli.Usuario +''')');
         IF Trim(vlCorreo) = '' THEN
         begin
            vlCorreo:=DLookup(pApli.databasename,pApli.SessionName,
                      'E_MAIL','EMAIL_PERSONA',
                      'ID_PERSONA=(select id_persona from usuario where cve_usuario ='''+pApli.Usuario +''')');
            IF (Trim(vlCorreo) = '') THEN
                MessageDlg('No se pudo obtener el correo electrónico del promotor.'+chr(13)+
                           'Favor de ponerse en contacto con el departamento '+ CHR(13)+
                           'de Recursos Humanos para actualizar sus datos.'+ CHR(13)+
                           'El comprobante se mandará al correo DEFAULT.'
                ,mtError,[mbOK],0);
         end;
      end;
      BuscaCorreo:=vlCorreo;
end;

//EFS Obtiene la Fecha Límite para captura de instrucciones de liquidacion
Function ObtFLimite(Padre: TInterFrame;peMesaCambio:String;ShowError:Boolean):String;
Var Qry:TQuery;
begin ObtFLimite:='';
    Try
      Qry:=TQuery.Create(Nil);
      Try
        Qry.DataBaseName:=Padre.DataBaseName;
        Qry.SessionName:=Padre.Apli.SessionName;
        Qry.sql.Clear;
        Qry.SQL.Append(' select ' +
                       ' PKGDIVISA2.FunObtFecha(FE.F_REFERENCIA ,DV.DS_PARAMETRO,' +
                       ' ''' + cAYER + ''',' + ' DC.ID_EMPRESA ) F_LIMITE' +
                       ' from  DI_PARAMETRO_DV DV, DI_MESA_CAMBIO DC, FECHA_EMPRESA FE ' +
                       ' WHERE DC.ID_MESA_CAMBIO  =  ' + peMesaCambio +
                       ' AND   DC.ID_MESA_CAMBIO  = DV.ID_MESA_CAMBIO ' +
                       ' AND   DV.CVE_PARAMETRO   = ''' + cVIGOSL + '''' +
                       ' AND   DC.ID_EMPRESA      = FE.ID_EMPRESA ' +
                       ' AND   FE.CVE_DIA_LIQUIDA = ''' + cMismoDia + '''');
        Qry.Open;
        if Qry.IsEmpty then
          begin Messagedlg('Error al obtener la fecha limite para captura de instrucciones',
                            mtInformation,[mbOk],0);
          end
        else
          ObtFLimite:=Qry.FieldByName('F_LIMITE').AsString;
      Finally
      Qry.Free;
      end;
    Except
       if ShowError then Raise;
    end;
end;

//MARA4356 PARA ACTUALIZAR ORDEN
procedure ActualizaOrden(pMesa,pOrden,pContrato:Integer;pMotivo:String;pApli:TInterApli);
var spCancOrd : TStoredProc;
begin spCancOrd:=TStoredProc.Create(Nil);
      try
        spCancOrd.StoredProcName:='PKGDIVISA2.STPACTUORDEN';
        spCancOrd.DatabaseName:=pApli.DataBaseName;
        spCancOrd.SessionName:=pApli.SessionName;
        spCancOrd.Params.CreateParam(ftInteger,'PEMESA',    ptInput);
        spCancOrd.Params.CreateParam(ftInteger,'PEORDEN',   ptInput);
        spCancOrd.Params.CreateParam(ftInteger,'PECONTRATO',ptInput);
        spCancOrd.Params.CreateParam(ftString, 'PETEXTO',   ptInput);
        spCancOrd.Params.CreateParam(ftString, 'PEUSUARIO', ptInput);
        spCancOrd.Params.CreateParam(ftInteger,'PSCODRESP', ptOutput);
        spCancOrd.Params.CreateParam(ftString, 'PSDESCRESP',ptOutput);
        spCancOrd.ParamByName('PEMESA').AsInteger    :=pMesa;
        spCancOrd.ParamByName('PEORDEN').AsInteger   :=pOrden;
        spCancOrd.ParamByName('PECONTRATO').AsInteger:=pContrato;
        spCancOrd.ParamByName('PETEXTO').AsString    :=pMotivo;
        spCancOrd.ParamByName('PEUSUARIO').AsString  :=pApli.Usuario;
        spCancOrd.ExecProc;
        if spCancOrd.ParamByName('PSCODRESP').AsInteger <> 0
        then MessageDlg('Error al actualizar el monto de la Orden Global' + CHR(13) +
                        spCancOrd.ParamByName('PSCODRESP').AsString + ' ' +
                        spCancOrd.ParamByName('PSDESCRESP').AsString,mtError,[mbOK],0)
        else MessageDlg('Cancelación terminada',mtInformation,[mbOK],0);
      finally spCancOrd.free;
      end;
end;

function  BuscaTiempo(pClave, pMesa:String;pApli:TInterApli):String;
var vParam:String;
begin GetSQLStr(' select ds_parametro '+
                ' from   di_parametro_dv '+
                ' where  id_mesa_cambio = '+pMesa+
                ' and    CVE_PARAMETRO  = '''+pClave+''' ',
                pApli.DataBaseName,pApli.SessionName,'ds_parametro',vParam,False);
      vParam:=FloatToStr(StrToFloat(vParam)/60000);
      BuscaTiempo:=vParam;
end;

function  CapturaOrden(pMesa: String; pApli:TInterApli):Boolean;
var vParam:String;
begin GetSQLStr(' select ds_parametro '+
                ' from   di_parametro_dv '+
                ' where  id_mesa_cambio = '+pMesa+
                ' and    CVE_PARAMETRO  = ''BCAPTUORDE'' ',
                pApli.DataBaseName,pApli.SessionName,'ds_parametro',vParam,False);
      if Trim(vParam)='V'
      then CapturaOrden:=True
      else CapturaOrden:=False;
end;

function  StatusOrden(pMesa, pOrden: String; pApli:TInterApli):Boolean;
var vSit:String;
begin GetSQLStr(' select sit_orden '+
                ' from   di_orden_global '+
                ' where  id_mesa_cambio = '+pMesa+
                ' and    id_orden  = '+pOrden+'',
                pApli.DataBaseName,pApli.SessionName,'sit_orden',vSit,False);
      if Trim(vSit)='PE'
      then StatusOrden:=True
      else StatusOrden:=False;
end;

// 28JUN06 EFS Funcion para obtener las firmas que se imprimiran en los giros
Function ObtenFirmas (p_Apli:TInterApli; pImporte: Double; pMesa, pCveUsr, pCveProducto: String;
                      var pDatosImp:String): Boolean;
Var QryImpr : Tquery;
Begin
  Result:= False;
  pDatosImp := '';
  QryImpr:= Tquery.Create(nil);
  QryImpr.DatabaseName := p_Apli.DataBaseName;
  QryImpr.SessionName := p_Apli.SessionName;

  {
  QryImpr.SQL.text :=' SELECT  DCA.*, DCI.* ' +
                     ' FROM    DI_UNIDAD_CAMBIO DUC, DI_CTRL_AUTORIZA DCA, DI_CONF_IMPR DCI ' +
                     ' WHERE   DUC.ID_MESA_CAMBIO = DCA.ID_MESA_CAMBIO ' +
                     ' AND     DUC.ID_ENTIDAD     = DCA.ID_ENTIDAD ' +
                     ' AND     DUC.ID_MESA_CAMBIO = ' + pMesa +
                     ' AND     DUC.CVE_USUARIO    = ''' + pCveUsr + '''' +
                     ' AND     DCA.NUM_IMPRESORA  = DCI.NUM_IMPRESORA ' +
                     ' AND     DCA.CVE_MEDIO      =''' + cCCAMB + '''' +
                     ' AND     DCA.CVE_PRODUCTO   =''' + pCveProducto + '''' +
                     ' AND     DCA.CVE_OPERACION=''V''';
  }

  QryImpr.SQL.text :=' SELECT DCI.* ' +
                     '   FROM DI_UNIDAD_CAMBIO DUC, DI_ENTIDAD DEN, DI_CONF_IMPR DCI ' +
                     '  WHERE DUC.ID_ENTIDAD    = DEN.ID_ENTIDAD' +
                     '    AND DEN.NUM_IMPRESORA = DCI.NUM_IMPRESORA ' +
                     '    AND DUC.CVE_USUARIO   =  ''' + pCveUsr + '''';

  QryImpr.Open;
  if Not QryImpr.IsEmpty then Begin
    Result := True;
    pDatosImp := QryImpr.FieldByName('TPO_IMPR').AsString+'|';
    pDatosImp := pDatosImp + QryImpr.FieldByName('NOMBRE_IMPR').AsString + '|';
    //pDatosImp := pDatosImp + QryImpr.FieldByName('CVE_PRODUCTO').AsString + '|';
    pDatosImp := pDatosImp + pCveProducto + '|';

    If QryImpr.FieldByName('B_IMPR_FIRMAS').AsString = 'V' Then Begin
      if (pImporte <=  QryImpr.FieldByName('IMP_SUP_FIRMA').AsFloat) and
         ( pImporte > QryImpr.FieldByName('IMP_INF_FIRMA').AsFloat ) then
         pDatosImp := pDatosImp +  trim (QryImpr.FieldByName('FIRMA_A').AsString) + '|'
      else
        if (pImporte <= QryImpr.FieldByName('IMP_INF_FIRMA').AsFloat  ) then begin
          pDatosImp := pDatosImp +  trim (QryImpr.FieldByName('FIRMA_A').AsString) + '|';
          pDatosImp := pDatosImp +  trim (QryImpr.FieldByName('FIRMA_B').AsString) + '|';
        end else pDatosImp := pDatosImp + '||';
    End else pDatosImp := pDatosImp + '||';
    Result:= True;
  end
  else  Begin
    Result:= False;
    ShowMessage('Usr: ' + pCveUsr + ' No tiene autorizacion para Imprimir ' + pCveProducto + ' (DI_CONF_IMPR)');
  end;
  QryImpr.Close;
  if QryImpr <> nil then QryImpr.Free;
End;


Procedure Execute_FacturaContrato(pApli:TInterApli; sContratos:String);
//MARA4356 FEB 2007 SE CREA PARA IMPRIMIR LOS COMPROBANTES DE CONTABILIDAD POR SEPARADO
var vlDestino, vlMesa, vlCondCanc, vlSQL:String;
    vlImpreso:Boolean;
    vlIndex1 : Integer;
begin vlImpreso:=False;
      vlMesa:=IntToStr(UnidCambUsu(pApli));
      vlDestino:='';
      BuscaImpresoraContabilidad(vlMesa, vlDestino, pApli);

      if (vlDestino <> '') then
      begin
         vlIndex1:=EstableceImpresora(vlDestino);
         if (vlIndex1 <> -1) 
         then vlImpreso:=Execute_ImpCompCon(pApli, vlMesa, sContratos, vlIndex1) // unidad: UnQrComDiv2 1 de 1
         else MessageDlg('No se pudo asignar la impresora : '+vlDestino, mtError, [mbOK], 0);
         if vlImpreso then
         begin
            vlSQL:='UPDATE DI_CONTRATO SET B_IMPR_FACT = ''V'', NUM_IMPR_FACT = NUM_IMPR_FACT + 1 WHERE ID_CONTRATO IN('+sContratos +')';
            Runsql(vlSQL,pApli.DataBaseName,pApli.SessionName,True);
         end
         else MessageDlg('El contrato no pudo ser impreso. Verifique conexión con la red o llame al departamento de Sistemas', mtError,[mbOK],0);
      end
      else MessageDlg('No se pudo localizar los destinos de impresión para el usuario ', mtError,[mbOK],0);

end;

procedure BuscaImpresoraContabilidad(pMesa:String; var  vlDestino : String; pApli:TInterApli);
begin GetSQLStr('SELECT UNI.IMPRESORA_CTO ' +
                '  FROM DI_UNIDAD_CAMBIO UNI' +
                ' WHERE UNI.ID_MESA_CAMBIO = '   +  pMesa  +  ' AND ' +
                '       UNI.CVE_USUARIO    = ''' +  pApli.Usuario +  '''',
                pApli.DataBaseName,pApli.SessionName,'IMPRESORA_CTO',vlDestino,False);
end;


//<MARA4356> SEP 2007 DATOS ADICIONALES PARA LA VENTANILLA
//function DatosAdicionales(sAfectaCaja,sCveOperacion,sMesa,sMoneda,sImporte,sContrato,sBillete,sProducto, sCveCuenta : String; pApli:TInterApli):Boolean;
function DatosAdicionales(sContrato: String;qTransacciones:Tquery; pApli:TInterApli;
                          pImp1,pImp2,pImp5,pImp10,pImp20,pImp50,pImp100,pImpM,pResult:TInterCampo):Boolean;
VAR SStr, SDesUsuario, sCliente, STransac: String;
    iCBillImp,iCBillImpCap,iCliente,iPos:Integer;
    Bandera:Boolean; 
    Sell:TDiSelInve; qDatos:TQuery;
begin 
   iCBillImp:=0; 
   iCBillImpCap:=0;
   Bandera:=False;
   qTransacciones.First;
   while not qTransacciones.Eof do
   begin
     if qTransacciones.FieldByName('b_bill_imp').AsString ='V' then
     begin
        inc(iCBillImp);
        CapturaBillete(qTransacciones.FieldByName('imp_trans_prod').AsFloat, pImp1, pImp2, pImp5, pImp10,pImp20, pImp50, pImp100, pImpM, pResult);
        if pResult.AsString='V' then        
        begin
         Inc(iCBillImpCap);
         GetSQLStr(' select id_transaccion from di_transaccion '+
                   ' where id_mesa_cambio='+qTransacciones.FieldByName('ID_MESA_CAMBIO').AsString +
                   ' and id_contrato = '+sContrato +
                   ' and cve_cuenta='''+qTransacciones.FieldByName('CVE_CUENTA').AsString +''' '+
                   ' and cve_moneda='+qTransacciones.FieldByName('CVE_MONEDA').AsString+
                   ' and cve_operacion='''+qTransacciones.FieldByName('CVE_OPERACION').AsString +''' '+
                   ' and cve_producto='''+qTransacciones.FieldByName('CVE_PRODUCTO').AsString +''' '+
                   ' and imp_trans_prod='+qTransacciones.FieldByName('IMP_TRANS_PROD').AsString +
                   ' and id_transaccion not in (select id_transaccion from di_cto_billete '+
                                              ' where id_mesa_cambio = '+qTransacciones.FieldByName('ID_MESA_CAMBIO').AsString +
                                              ' and id_contrato ='+sContrato + ')'+
                   ' and rownum=1',                   
                   pApli.DataBaseName, pApli.SessionName, 'ID_TRANSACCION', STransac, True);
         SStr:='INSERT INTO DI_CTO_BILLETE VALUES('+qTransacciones.FieldByName('ID_MESA_CAMBIO').AsString+','+sContrato+','+STransac+',';
         if pImp1.AsFloat  <>0 then RunSQL(sStr+'1,'  +pImp1.AsString  +')', pApli.DatabaseName,pApli.SessionName,True);
         if pImp2.AsFloat  <>0 then RunSQL(sStr+'2,'  +pImp2.AsString  +')', pApli.DatabaseName,pApli.SessionName,True);
         if pImp5.AsFloat  <>0 then RunSQL(sStr+'5,'  +pImp5.AsString  +')', pApli.DatabaseName,pApli.SessionName,True);
         if pImp10.AsFloat <>0 then RunSQL(sStr+'10,' +pImp10.AsString +')', pApli.DatabaseName,pApli.SessionName,True);
         if pImp20.AsFloat <>0 then RunSQL(sStr+'20,' +pImp20.AsString +')', pApli.DatabaseName,pApli.SessionName,True);
         if pImp50.AsFloat <>0 then RunSQL(sStr+'50,' +pImp50.AsString +')', pApli.DatabaseName,pApli.SessionName,True);
         if pImp100.AsFloat<>0 then RunSQL(sStr+'100,'+pImp100.AsString+')', pApli.DatabaseName,pApli.SessionName,True);
         if pImpM.AsFloat  <>0 then RunSQL(sStr+'149,'+pImpM.AsString  +')', pApli.DatabaseName,pApli.SessionName,True);
        end;
     end;
     //BUSCA DATOS DEL CLIENTE
     if (qTransacciones.FieldByName('ID_CLIENTE').AsInteger = 7 ) and (Bandera=False) and
        ((qTransacciones.FieldByName('b_datos_od').AsString  ='V') OR
         (qTransacciones.FieldByName('b_datos_lavdin').AsString='V')) then
     begin
       //MOAA4820 FEB2010 SE ELIMINA REGISTROS DE CLIENTE 7
       {
       if PROCDATOSCLIENTE(qTransacciones,pApli,sContrato) <> ''
       then Bandera:=True;
       }
       Bandera:=True;
     end;

     //afecta doctacion cajero
     PROCAFECTACAJA(qTransacciones.FieldByName('b_afecta_Caja').AsString,
                    qTransacciones.FieldByName('Cve_Operacion').AsString,
                    qTransacciones.FieldByName('id_mesa_cambio').AsString,
                    qTransacciones.FieldByName('Cve_moneda').AsString,
                    qTransacciones.FieldByName('imp_trans_prod').AsString,sContrato,
                    qTransacciones.FieldByName('b_chq_viajero').AsString,pApli);
     
     qTransacciones.Next;
     
   end;
     
   //MARA4356 MARZO 2008 PARA CHEQUES DE VIAJERO       
   qDatos:=getsqlquery (' SELECT D.*, P.B_CHQ_VIAJERO from DI_TRANSACCION d, di_producto p '+
                        ' WHERE ID_CONTRATO =  '+sContrato+
                        ' AND P.ID_MESA_CAMBIO = D.ID_MESA_CAMBIO '+
                        ' AND P.CVE_PRODUCTO = D.CVE_PRODUCTO ',
                       pApli.DataBaseName, pApli.SessionName,True);
   qDatos.First;
   while not qDatos.Eof do
   begin
     if (qDatos.FieldByName('B_CHQ_VIAJERO').AsString ='V') AND
        (qDatos.FieldByName('CVE_OPERACION').AsString ='V') then
     begin
       Sell:=TDiSelInve.Create(nil);
       try Sell.Apli:=pApli;
           Sell.ID_MESA_CAMBIO.AsInteger:=qDatos.FieldByName('ID_MESA_CAMBIO').AsInteger;
           Sell.ID_CONTRATO.AsSTring    :=sContrato;//qTransacciones.FieldByName('ID_CONTRATO').AsInteger;
           Sell.ID_TRANSACCION.AsInteger:=qDatos.FieldByName('ID_TRANSACCION').AsInteger;
           Sell.CVE_PRODUCTO.AsSTring   :=qDatos.FieldByName('CVE_PRODUCTO').AsString;
           Sell.IMP_TRANS_PROD.AsFloat  :=qDatos.FieldByName('IMP_TRANS_PROD').AsFloat;
           Sell.CVE_MONEDA.AsString     :=qDatos.FieldByName('CVE_MONEDA').AsString;
           Sell.Catalogo;
       finally if Sell <> nil then Sell.Free;
       end;        
     END;
     qDatos.Next;
   end;

   if iCBillImp=iCBillImpCap 
   then DatosAdicionales:=True
   else DatosAdicionales:=False;
end;

//<MARA4356> SEP 2007 DATOS ADICIONALES PARA LA VENTANILLA
function PROCDATOSCLIENTE(qTransacciones:TQuery;pApli:TInterApli;sContrato:String):String;
VAR SStr, SDesUsuario, sCliente : String;
    iCliente,iPos:Integer;
    Bandera:Boolean;
    Usuvent         : TUsuvent;
begin

    IF MessageDlg('¿Es Cliente del Grupo?',mtConfirmation,[mbYes,mbNo],0)=mryes
    then iCliente:=0   // 0 cliente inter
    else iCliente:=1;  // 1 usuario

    if  (qTransacciones.FieldByName('B_DATOS_LAVDIN').AsString  ='V') then
    begin
          Usuvent           := TUsuvent.Create(nil);
          Usuvent.Apli      := pApli;
          Usuvent.rgUsuario := iCliente;
          if (qTransacciones.FieldByName('ID_CLIENTE').AsInteger = 7 )
          then Usuvent.IdTitular := 0
          else Usuvent.IdTitular := qTransacciones.FieldByName('ID_CLIENTE').AsInteger;
          if ( Usuvent.ShowUsuEvent(SDesUsuario) = 0 ) then
            showMessage('Recuerde que es obligatorio proporcionar la información adicional del Usuario en Ventanilla para guardar la Operación.');
          Usuvent.Destroy;
    end
    else if qTransacciones.FieldByName('B_DATOS_OD').AsString='V' then
            SDesUsuario := ValidaUsuVentanilla(QTransacciones.FieldByName('ID_CONTRATO_CORP').AsInteger,
                                               QTransacciones.FieldByName('IMP_TRANS_PROD').AsFloat,
                                               QTransacciones.FieldByName('DESC_MONEDA').AsString,
                                               QTransacciones.FieldByName('F_OPERACION').AsDateTime,
                                               iCLIENTE, pApli);

    if Length(sDesUsuario)> 8 then
    begin  iPos:=LastDelimiter(#9,sDesUsuario);
           sCliente:=Copy(sDesUsuario,iPos,length(sDesUsuario));
           SStr:='INSERT INTO DI_CTO_NO_CTE '+
                 ' VALUES('+qTransacciones.FieldByName('ID_MESA_CAMBIO').AsString+','+
                            sContrato+','+ sCliente+',''F'')';
    end
    else
    begin  sCliente:=sDesUsuario;
           SStr:='INSERT INTO DI_CTO_NO_CTE '+
                 ' VALUES('+qTransacciones.FieldByName('ID_MESA_CAMBIO').AsString+','+
                            sContrato+','+ sCliente+',''V'')';
    end;
    RunSQL(sStr,pApli.DatabaseName,pApli.SessionName,True);
    PROCDATOSCLIENTE:=sDesUsuario;
end;

//<MARA4356> SEP 2007 DATOS ADICIONALES PARA LA VENTANILLA
procedure PROCAFECTACAJA(sAfectaCaja,sCveOperacion,sMesa,sMoneda,sImporte,sContrato,bEsChqVia : String; pApli:TInterApli);
var sOpn, sSTR, sUsuario : String;
    sCUENTA : Integer;
    spCorpo : TStoredProc;
begin
    if (sAfectaCaja='V') and ((sCveOperacion='C') or (sCveOperacion='V')) then
    begin
      //busca al usuario
      if bEsChqVia ='V'
      then begin
           if sCveOperacion='C'  then sOpn:='ENTTRA' else sOpn:='RETTRA';
      end
      else begin
           if sCveOperacion='C'  then sOpn:='DEPOSI' else sOpn:='RETIRO';
      end;
      sSTR:=' SELECT COUNT(*) AS CUENTA FROM '+
                  ' ( SELECT C.Cve_Usuario FROM CJ_CAJA C, CJ_OPERACION O, CJ_SUCURSAL S '+
                  '    WHERE C.CVE_TIPO_CAJA=O.CVE_TIPO_CAJA '+
                  '      AND C.ID_SUCURSAL= S.ID_SUCURSAL '+
                  '      AND C.Cve_Usuario ='''+pApli.Usuario+''' '+
                  '      AND O.CVE_OPER_CAJA='''+sOpn +''' '+
                  '      AND C.CVE_TIPO_CAJA=''BV'' '+
                  '   UNION ALL '+
                  '   SELECT cve_usuario FROM CJ_CAJA '+
                  '   WHERE Cve_Usuario = '''+pApli.Usuario+''' '+
                  '   AND Cve_tipo_Caja IN (''NO'',''AD'',''BO'',''AU'') AND SIT_CAJA=''AC'' ) ';
      GetSQLInt(sSTR,pApli.DataBaseName, pApli.SessionName, 'CUENTA', SCUENTA, True);
      if SCUENTA = 0 then
         GetSQLStr(' SELECT DS_PARAMETRO FROM DI_PARAMETRO_DV '+
                   ' WHERE ID_MESA_CAMBIO = '+sMesa+' AND CVE_PARAMETRO = ''CAJERO'' ',
                   pApli.DataBaseName, pApli.SessionName, 'DS_PARAMETRO', sUsuario, True)
      else sUsuario:=pApli.Usuario;

      spCorpo:=TStoredProc.Create(Nil);
      try
        spCorpo.DatabaseName:=pApli.DataBaseName;
        spCorpo.SessionName:=pApli.SessionName;
        spCorpo.Params.Clear;
        spCorpo.StoredProcName:='PKGCAJA.STPINSTRNCJ';
        spCorpo.Params.CreateParam(ftstring, 'PTipoOper',    ptInput);
        spCorpo.Params.CreateParam(ftstring, 'PUsuario',     ptInput);
        spCorpo.Params.CreateParam(ftFloat,  'PIdTrn',       ptInputOutput);
        spCorpo.Params.CreateParam(ftstring, 'PIdContrato',  ptInput);
        spCorpo.Params.CreateParam(ftFloat , 'PImpMovto',    ptInput);
        spCorpo.Params.CreateParam(ftstring, 'PReferencia',  ptInput);
        spCorpo.Params.CreateParam(ftstring, 'PCveTipDecl',  ptInput);
        spCorpo.Params.CreateParam(ftstring, 'PPeriodoDecl', ptInput);
        spCorpo.Params.CreateParam(ftstring, 'PArchivo',     ptInput);
        spCorpo.Params.CreateParam(ftInteger,'pMoneda',      ptInput);
        spCorpo.Params.CreateParam(ftstring, 'pCodResp',     ptOutput);
        spCorpo.Params.CreateParam(ftstring, 'Pdesc_proceso',ptOutput);
        spCorpo.UnPrepare;
        spCorpo.ParamByName('PTipoOper').AsString  :=sOpn;
        spCorpo.ParamByName('PUsuario').AsString   :=sUsuario;
        spCorpo.ParamByName('PImpMovto').AsFloat   :=StrToFloat(sImporte);
        spCorpo.ParamByName('PReferencia').AsString:='OPN CAMBIOS '+sContrato;
        spCorpo.ParamByName('pMoneda').AsInteger   :=StrToInt(sMoneda);
        spCorpo.Prepare;
        spCorpo.ExecProc;
        if spCorpo.ParamByName('pCodResp').AsInteger <> 0
        then ShowMessage('La afectación no se pudo realizar'+chr(13)+
                         'Moneda    '+ sMoneda+chr(13)+
                         'Operacion '+ spCorpo.ParamByName('PTipoOper').AsString+chr(13)+
                         'Importe   '+ sImporte+chr(13)+chr(13)+
                         'Resultado '+ spCorpo.ParamByName('pCodResp').AsString+
                                       spCorpo.ParamByName('PDESC_PROCESO').AsString);
      finally spCorpo.free;
      end;
    end;
end;


function PROCVALIDAMONTOTC(sSolicitud, sProducto, sFLiquidacion, sCliente: String; sImp_PRod, sImp_MN:Real; pApli:TInterApli):Boolean;
var vlValida, vBandera:String;
begin
   if sProducto<>'' then
   begin
      GetSQLStr(' SELECT b_chq_viajero from di_producto where id_mesa_cambio=1 and cve_producto='''+sProducto+''' ',
             pApli.DataBaseName, pApli.SessionName, 'b_chq_viajero', vBandera, True);
   end;
   if (sProducto='') or (vBandera='V') then
   begin
     GetSQLStr(' SELECT pkgDivisa2.FUNMONTOMAXTC('''+sFLiquidacion+''','+sSolicitud+','+scliente+','''+
               sProducto+''','+FloatTostr(sImp_Prod)+','+FloatTostr(sImp_mN)+') as resultado from dual ',
               pApli.DataBaseName, pApli.SessionName, 'resultado', vlValida, True);
     if vlValida='V'  //el monto operado rebasa el monto maximo por dia y por cliente
     then PROCVALIDAMONTOTC:=True //termina la operacion
     else PROCVALIDAMONTOTC:=False; //continua 
   end
   else PROCVALIDAMONTOTC:=False; //continua 
end;

Procedure Execute_FacturaCliOper(Padre:TInterFrame; contrato:String);
//MOAA4820 DIC2009
// MARA4356 FEBRERO 2006 SE MODIFICA PROCEDIMIENTO PARA IMPRIMIR FACTURA EN DOS IMPRESORAS
//MARA4356 FEB 2007 SE MODIFICA PARA IMPRIMIR EL TANTO DEL CLIENTE Y OPERACION EN LA CPATURA
var qContrato,
    qOper,
    qLiquidacion : TQuery;
    vlSQL, vlDestino, vlDestino2, vlDestino3, vlDestino4,
    vlMesa,vlCondCanc:String;
    vlImpreso:Boolean;
    vlIndex, vlIndex2, vlIndex3, vlIndex4  : Integer;
begin qContrato   :=tQuery.Create(Nil);
      qOper       :=tQuery.Create(Nil);
      qLiquidacion:=tQuery.Create(Nil);
      vlImpreso:=False;
      vlMesa:=IntToStr(UnidCambUsu(Padre.Apli));
      try
      qContrato.Databasename:=Padre.Databasename;
      qContrato.SessionName :=Padre.SessionName;
      //MOAA4820 SE AGREGA DATOS DE CLIENTE 7
      //RAST
      qContrato.SQL.Text:= 'SELECT DI_CONTRATO.ID_CONTRATO, DI_CONTRATO.ID_CLIENTE, ' +
      ' DI_CONTRATO.NOMBRE_CLIENTE, DI_CONTRATO.CVE_MONEDA_BASE, ' +
      ' DI_CONTRATO.F_OPERACION, DI_CONTRATO.F_LIQUIDACION, ' +
      ' DI_CONTRATO.SIT_CONTRATO, DI_CONTRATO.TX_COMENTARIO, ' +
      ' PERSONA.ID_PERSONA, ' +
      ' (SELECT RTRIM (rfc.siglas_rfc)  || RTRIM (rfc.f_rfc) || RTRIM (rfc.homoclave_rfc) FROM RFC WHERE persona.ID_PERSONA = RFC.ID_PERSONA)AS RFCT, ' +
      ' DI_CLIENTE.B_IMPR_DOMIC, DOMICILIO.CALLE_NUMERO, ' +
      ' (DOMICILIO.COLONIA || '','' || CIUDAD.DESC_POBLACION) DOMIC1, ' +
      ' (ESTADO.DESC_POBLACION || '','' || POBLACION.DESC_POBLACION) DOMIC2, ' +
      ' DOMICILIO.CODIGO_POSTAL, ' +
      ' NVL (CLI.NOMBRE_RAZON, DI_CONTRATO.NOMBRE_CLIENTE) AS NOMBRE_RAZON, ' +
      ' CLI.FEC_NAC, CLI.RFC, CLI.NO_IFE, CLI.CALLE, CLI.COLONIA, ' +
      ' CLI.CODIGO_POSTAL AS COD_POSTAL, ' +
      ' (SELECT SERIE FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) SERIE, ' +
      ' (SELECT FOLIO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) FOLIO, ' +
      ' (SELECT FECHA_CREACION FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) FECHA_CREACION, ' +
      ' (SELECT ANO_APROBACION FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) ANO_APROBACION, ' +
      ' (SELECT NUM_APROBACION FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) NUM_APROBACION, ' +
      ' (SELECT CERTIFICADO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) CERTIFICADO, ' +
      ' (SELECT SELLO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) SELLO, ' +
      ' (SELECT CADENA FROM RFE_COMPROBANTE RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) CADENA, ' +
       ' (SELECT TIPO_CAMBIO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) TIPO_CAMBIOS, ' +
       ' (SELECT METODO_PAGO FROM RFE_COMPROBANTE WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) METODO_PAGO, ' +
       ' (SELECT CUENTA FROM RFE_COMPROBANTE  WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) CUENTA, ' +
       ' (SELECT NOM_PAIS_EX FROM RFE_EMISOR WHERE RFE_EMISOR.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) NOM_PAIS_EX, ' +
       ' (SELECT NOM_ESTADO_EX FROM RFE_EMISOR WHERE RFE_EMISOR.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) NOM_ESTADO_EX, ' +
                   ' (SELECT DESC_MONEDA FROM RFE_COMPROBANTE  WHERE RFE_COMPROBANTE.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) DESC_MONEDA, ' +
       ' (SELECT REGIMEN FROM RFE_EMISOR  WHERE RFE_EMISOR.ID_CONTRATO = DI_CONTRATO.ID_CONTRATO) REGIMEN ' +
 ' FROM DI_CONTRATO, ' +
      ' POBLACION ESTADO, ' +
      ' DOMICILIO, ' +
      ' POBLACION, ' +
      ' POBLACION CIUDAD, ' +
      ' PERSONA, ' +
      ' DI_CLIENTE, ' +
      ' DI_CLIENTE_7 CLI ' +
' WHERE (DI_CONTRATO.ID_CLIENTE = PERSONA.ID_PERSONA) ' +
  ' AND (DI_CONTRATO.ID_MESA_CAMBIO = ' + vlMesa + ') ' +
  ' AND (di_cliente.id_persona = di_contrato.id_cliente) ' +
  ' AND (persona.id_domicilio = domicilio.id_domicilio) ' +
  ' AND (persona.id_domicilio = domicilio.id_domicilio(+)) ' +
  ' AND (domicilio.cve_pais = poblacion.cve_poblacion(+)) ' +
  ' AND (domicilio.cve_estado = estado.cve_poblacion(+)) ' +
  ' AND (domicilio.cve_ciudad = ciudad.cve_poblacion(+)) ' +
  ' AND ( DI_CONTRATO.ID_CONTRATO   = ' + CONTRATO + ')' +
  ' AND cli.id_contrato_OP(+) = di_contrato.id_contrato ';

      {'SELECT DI_CONTRATO.ID_CONTRATO,' +
                         ' DI_CONTRATO.ID_CLIENTE,' +
                         ' DI_CONTRATO.NOMBRE_CLIENTE,  ' +
                         ' DI_CONTRATO.CVE_MONEDA_BASE, ' +
                         ' DI_CONTRATO.F_OPERACION,     ' +
                         ' DI_CONTRATO.F_LIQUIDACION,   ' +
                         ' DI_CONTRATO.SIT_CONTRATO,    ' +
                         ' DI_CONTRATO.TX_COMENTARIO,   ' +
                         ' PERSONA.ID_PERSONA,          ' +
                         ' RTRIM(RFC.SIGLAS_RFC) || RTRIM(RFC.F_RFC) || RTRIM(RFC.HOMOCLAVE_RFC) AS RFCT,' +
                         ' DI_CLIENTE.B_IMPR_DOMIC,     ' +
                         ' DOMICILIO.CALLE_NUMERO ,     ' +
                         ' ( DOMICILIO.COLONIA || '','' || CIUDAD.DESC_POBLACION ) DOMIC1, ' +
                         ' ( ESTADO.DESC_POBLACION || '','' || POBLACION.DESC_POBLACION ) DOMIC2, ' +
                         '   DOMICILIO.CODIGO_POSTAL, ' +
                         ' NVL(CLI.NOMBRE_RAZON, DI_CONTRATO.NOMBRE_CLIENTE) AS NOMBRE_RAZON, ' +
                         ' cli.FEC_NAC, '+
                         ' cli.RFC, '    +
                         //' cli.CURP, '   +
                         ' cli.NO_IFE, ' +
                         ' cli.CALLE,  ' +
                         ' cli.COLONIA, '+
                         //EIB2AARJ 17NOV2010  ' cli.CODIGO_POSTAL AS COD_POSTAL ' +
                         ' cli.CODIGO_POSTAL AS COD_POSTAL, ' +
                         //EIB2AARJ 17NOV2010  : Se agregan los siguientes campos para pasarlos en el query.
                         ' RC.SERIE, RC.FOLIO, RC.FECHA_CREACION , RC.ANO_APROBACION, RC.NUM_APROBACION, RC.CERTIFICADO, RC.SELLO, RC.CADENA '+
                         'FROM DI_CONTRATO , POBLACION ESTADO, ' +
                         '     DOMICILIO , POBLACION, ' +
                         '     POBLACION CIUDAD, PERSONA, DI_CLIENTE, ' +
                         //EIB2AARJ 17NOV2010  '     RFC, DI_SOL_CTO SOL,  DI_CLIENTE_7 CLI ' +
                         '     RFC, DI_SOL_CTO SOL,  DI_CLIENTE_7 CLI , RFE_COMPROBANTE RC ' +
                         'WHERE (DI_CONTRATO.ID_CLIENTE     = PERSONA.ID_PERSONA)  AND ' +
                         '      (RFC.ID_PERSONA             (+)= PERSONA.ID_PERSONA)  AND ' +
                         '      (DI_CONTRATO.ID_MESA_CAMBIO = ' + vlMesa + ') AND ' +
                         '      (DI_CLIENTE.ID_PERSONA      = DI_CONTRATO.ID_CLIENTE)     AND ' +
                         '      (PERSONA.ID_DOMICILIO       = DOMICILIO.ID_DOMICILIO)     AND ' +
                         '      ( PERSONA.ID_DOMICILIO      = DOMICILIO.ID_DOMICILIO(+))  AND ' +
                         '      ( DOMICILIO.CVE_PAIS        = POBLACION.CVE_POBLACION(+)) AND ' +
                         '      ( DOMICILIO.CVE_ESTADO      = ESTADO.CVE_POBLACION(+))    AND ' +
                         '      ( DOMICILIO.CVE_CIUDAD      = CIUDAD.CVE_POBLACION(+))    AND ' +
                         '      ( DI_CONTRATO.ID_CONTRATO   = ' + contrato + ')           AND ' +
                         '        DI_CONTRATO.ID_CONTRATO   = SOL.ID_CONTRATO             AND ' +
                         //EIB2AARJ 17NOV2010  : '        CLI.ID_SOLICITUD         (+)= SOL.ID_SOLICITUD ';
                         '        CLI.ID_SOLICITUD         (+)= SOL.ID_SOLICITUD          AND ' +
                         //EIB2AARJ 17NOV2010  : Se agregan los siguientes campos para pasarlos en el query.
                         '      ( DI_CONTRATO.ID_CONTRATO   = RC.ID_CONTRATO(+) ) ' ;
                                              }
     qContrato.Open;

     if qContrato.FieldByName('SIT_CONTRATO').AsString = 'CA'
     then vlCondCanc:=' AND DI_TRANSACCION.CVE_OPERACION IN (''CC'',''CV'',''CCT'',''CVT'')'
     else vlCondCanc:='';


     qOper.Databasename:=Padre.Databasename;
     qOper.SessionName :=Padre.SessionName;
     qOper.SQL.Text:='SELECT DI_TRANSACCION.ID_CONTRATO,    ' +
                     '       DI_TRANSACCION.F_OPERACION,    ' +
                     '       DI_TRANSACCION.F_LIQUIDACION,  ' +
                     '       DI_TRANSACCION.CVE_MONEDA,     ' +
                     '       DI_TRANSACCION.CVE_OPERACION,  ' +
                     '       DI_TRANSACCION.IMP_TRANS_MN,   ' +
                     '       DI_TRANSACCION.IMP_TRANS_PROD, ' +
                     '       DI_TRANSACCION.TC_OPERACION,   ' +
                     '       DI_TRANSACCION.TX_COMENTARIO,  ' +
                     '       DI_TRANSACCION.DESC_BENEF,     ' +
                     '       DI_TRANSACCION.CTA_BENEFICIARIO, ' +
                     '       DI_TRANSACCION.NOMBRE_BCO_BENEF, ' +
                     '       DI_TRANSACCION.ABA,          ' +
                     '       DI_OPERACION.DESC_L_ID_PRIM AS DESCOPER, ' +
                     '       DI_PRODUCTO.DESC_L_ID_PRIM AS DESCPROD,  ' +
                     '       MONEDA.DESC_MONEDA,          ' +
                     '       DI_TRANSACCION.CVE_PRODUCTO  ' +
                     ' FROM DI_TRANSACCION , DI_OPERACION,' +
                     '      DI_PRODUCTO, MONEDA ' +
                     ' WHERE (DI_TRANSACCION.CVE_PRODUCTO  = DI_PRODUCTO.CVE_PRODUCTO)   AND ' +
                     '       (DI_TRANSACCION.CVE_OPERACION = DI_OPERACION.CVE_OPERACION) AND ' +
                     '       (DI_TRANSACCION.ID_MESA_CAMBIO= ' + vlMesa + ') AND ' +
                     '       (DI_PRODUCTO.ID_MESA_CAMBIO   = ' + vlMesa + ') AND ' +
                     '       (DI_TRANSACCION.CVE_MONEDA    = MONEDA.CVE_MONEDA) AND  ' +
                     '       (DI_TRANSACCION.ID_CONTRATO   = ' + contrato   + ') AND ' +
                     '       (DI_TRANSACCION.CVE_MONEDA   <> ' +  qContrato.FieldByName('CVE_MONEDA_BASE').AsString +
                     '       )' + vlCondCanc +
                     ' ORDER BY DI_TRANSACCION.ID_TRANSACCION ';
     qOper.Open;

     qLiquidacion.Databasename:=Padre.Databasename;
     qLiquidacion.SessionName :=Padre.SessionName;
     qLiquidacion.SQL.Text:='SELECT DI_TRANSACCION.ID_CONTRATO,  ' +
                            '       DI_TRANSACCION.F_OPERACION,  ' +
                            '       DI_TRANSACCION.CVE_PRODUCTO, ' +
                            '       DI_TRANSACCION.ID_GPO_TRANS, ' +
                            '       DI_TRANSACCION.F_LIQUIDACION,' +
                            '       DI_TRANSACCION.CVE_MONEDA,   ' +
                            '       DI_TRANSACCION.CVE_OPERACION,' +
                            '       DI_TRANSACCION.IMP_TRANS_MN, ' +
                            '       DI_TRANSACCION.IMP_TRANS_PROD,' +
                            '       DI_TRANSACCION.TC_OPERACION,  ' +
                            '       DI_TRANSACCION.TX_COMENTARIO, ' +
                            '       DI_PRODUCTO.DESC_L_ID_PRIM AS DESCPROD,   ' +
                            '       DI_OPERACION.DESC_L_ID_PRIM AS DESCOPER   ' +
                            ' FROM DI_TRANSACCION , DI_OPERACION,  ' +
                            ' DI_PRODUCTO ' +
                            ' WHERE (DI_TRANSACCION.CVE_OPERACION = DI_OPERACION.CVE_OPERACION)  AND ' +
                            '       (DI_TRANSACCION.CVE_PRODUCTO  = DI_PRODUCTO.CVE_PRODUCTO)    AND  ' +
                            '       (DI_TRANSACCION.ID_MESA_CAMBIO= ' + vlMesa + ') AND ' +
                            '       (DI_PRODUCTO.ID_MESA_CAMBIO   = ' + vlMesa + ') AND ' +
                            '       (DI_TRANSACCION.ID_CONTRATO   = ' +  contrato + ') AND  ' +
                            '       (DI_TRANSACCION.CVE_MONEDA   = ' + qContrato.FieldByName('CVE_MONEDA_BASE').AsString + ')' +
                             vlCondCanc +
                            ' ORDER BY DI_TRANSACCION.ID_TRANSACCION ';

    qLiquidacion.Open;
//    vlDestino:=BuscaImpresora(vlMesa,Padre.Apli);
    BuscaImpresora2(vlMesa, contrato,
                    vlDestino, vlDestino2, vlDestino3, vlDestino4, Padre.Apli); //mara4356 febrero 2006 //<<MARA4356 FEB 2007 SE AGREGA NOMCLASE

    if (vlDestino <> '') AND (vlDestino2 <> '')  then
    begin
       if vlDestino = cImprDivisas
       then vlImpreso:=ImprimeFactura(qContrato, qOper, qLiquidacion)
       else begin
               vlIndex:=EstableceImpresora(vlDestino);
               vlIndex2:=EstableceImpresora(vlDestino2);
               //vlIndex3:=EstableceImpresora(vlDestino3);
               //vlIndex4:=EstableceImpresora(vlDestino4);
               //MOAA SE AGREGA COMPROBANTE IMPRESO PARA CLIENTE 7
               if (vlIndex <> -1) and (vlIndex2 <> -1) then
               begin
                   if qContrato.FieldByName('ID_CLIENTE').AsString = '7' then   // unidad : UnQrComDiCli7 1 de 1
                      vlImpreso:=Execute_ImpCompDivCli7(Padre.Apli,qContrato,qOper,qLiquidacion,vlIndex,vlIndex2,vlIndex3,vlIndex4)
                   else // Unidad: UnQrComDiv 4 de 4
                      vlImpreso:=Execute_ImpCompDiv(Padre.Apli,qContrato,qOper,qLiquidacion,vlIndex,vlIndex2,vlIndex3,vlIndex4);
               end
               else
               begin
                  MessageDlg('No se pudo asignar las impresoras : '+vlDestino+', '+vlDestino2+
                              ', '+vlDestino3+', '+vlDestino4,mtError,[mbOK],0);
               end;
            end;

       if vlImpreso
       then begin
              vlSQL:='UPDATE DI_CONTRATO SET B_IMPR_FACT = ''V'', NUM_IMPR_FACT = NUM_IMPR_FACT + 1 WHERE ID_CONTRATO=' + contrato;
              Runsql(vlSQL,Padre.databasename,Padre.sessionname,True);
              MessageBeep(0);
            end
       else MessageDlg('El contrato no pudo ser impreso. Verifique conexión con la red o llame al departamento de sistemas', mtError,[mbOK],0);

    end
    else MessageDlg('No se pudo localizar los destinos de impresión para el usuario ', mtError,[mbOK],0);

     finally
        if qContrato <> nil then qContrato.free;
        if qOper     <> nil then qOper.free;
        if qLiquidacion <> nil then qLiquidacion.free;
     end;
end;


//MOAA4820 ENVIA CORREO DE BLOQUEO DE CHEQUE
function SendEmailBloqChq(pApli:TInterApli; numCheque, pMensaje, pCveUser:String): integer;
Var vlQue:TQuery;
    l_SQL, vlhost, vlEmail, vlBody, vlSubject : String;
    NMSMTP1 : TNMSMTP;
    vlMensaje :TStringList;
    //MOAA4820 DIC2009 - CORREO ELECTRONICO PARA ENVIAR COMPROBANTE
    vlCorreo : String;
    SearchRec: TSearchRec;
    n:integer;
Begin SendEmailBloqChq:=2; //no encontrado
      l_Sql := ' SELECT * FROM DI_PARAMETRO_DV '+
               '  WHERE CVE_PARAMETRO = ''MAILBLOCHQ'' ';
      vlQue := TQuery.Create(nil);
      vlQue.DatabaseName := pApli.DataBaseName;
      vlQue.SessionName := pApli.SessionName;
      vlQue.sql.clear;
      vlQue.sql.Text:= l_SQL;
      vlQue:= GetSQLQuery(vlQue.sql.Text, pApli.DataBaseName,pApli.SessionName, True);

      //CORREO ELECTRONICO POR DEFAULT
      vlCorreo := vlQue.FieldByName('DS_PARAMETRO').AsString;
      vlCorreo := vlCorreo + ';' +BuscaCorreoOper(pApli, pCveUser);

      try if (Trim(vlCorreo) <> '') then begin
             NMSMTP1:= TNMSMTP.Create(nil);
             //MOAA4820 DIC2009 - PERSONA QUE LO ENVIA ES LA MISMA QUE RECIBE
             vlEmail := vlCorreo;

             //17mar2006 EFS LA DIRECCION IP SE OBTIENE DE LA TABLA DE PARAMETROS
             vlHost:=DLookup(pApli.databasename,pApli.SessionName,'DS_PARAMETRO','DI_PARAMETRO_DV','ID_MESA_CAMBIO='+ IntToStr(UnidCambUsu(PApli))+
             ' AND CVE_PARAMETRO = ''HOSTNAME'' ' );
             NMSMTP1.Host := vlhost;
             NMSMTP1.Connect;
             Screen.Cursor := crHourGlass;
             SendEmailBloqChq:=3; //encontrato
             if (NMSMTP1.Connected) and (Trim(vlEmail)<>'') then
             begin

                NMSMTP1.ClearParams := TRUE;
                NMSMTP1.SubType := mtHTML; //mtPlain;
                NMSMTP1.PostMessage.FromAddress := 'proteccion@interacciones.com';//vlEmail;

                //NMSMTP1.PostMessage.ToAddress.Text := vlCorreo;
                for n:=1 to GetTokenCountMail(vlCorreo,';') do
                begin
                   NMSMTP1.PostMessage.ToAddress.Add(GetTokenMail(vlCorreo,';',n));;
                end;

                pmensaje := 'Hablar a Tesorería para protección de Cheque ' + numCheque;
                NMSMTP1.PostMessage.Body.Text := pmensaje;
                vlSubject:= FormatDateTime('DD/MM/YYYY HH:NN:SS', pApli.SysDateTime) +
                            ' Proteccion de Cheque ' + numCheque;
                NMSMTP1.PostMessage.Subject := CadenaToHtml(vlSubject);
                NMSMTP1.PostMessage.Date := DateTimeToStr(pApli.SysDateTime); // DateTimeToStr(Now);
                NMSMTP1.PostMessage.ReplyTo := NMSMTP1.PostMessage.FromAddress;
                NMSMTP1.SendMail;
                SendEmailBloqChq:=4; //enviado
                //MessageDlg('Recordatorio Bloqueo Cheque enviado a ' + vlCorreo,mtInformation,[mbOK],0);
                MessageDlg('Recordatorio de Protección de Cheque enviado',mtInformation,[mbOK],0);
                
             end;
             Screen.Cursor := crDefault;
             NMSMTP1.Disconnect;
        end
       else
          //MOAA4820 DIC2009 - MENSAJE DE ERROR - CORREO ELECTRONICO
          MessageDlg('No se pudo obtener el correo electrónico para enviar notificación de bloqueo de cheque',mtInformation,[mbOK],0);
      finally
        if vlQue <> nil then vlQue.free;
        if nmsmtp1<>nil then nmsmtp1.free;
      end;
end;

function BuscaCorreoOper(pApli:TInterApli; pUsrOper:String):String;
var vlCorreo:String;
begin vlCorreo:=DLookup(pApli.databasename,pApli.SessionName,
                'E_MAIL_OFIC','DIREC_EMPLEADO',
                'ID_EMPLEADO=(select id_persona from usuario where cve_usuario =''' + pUsrOper + ''')');
      IF Trim(vlCorreo) = '' THEN
      begin
         vlCorreo:=DLookup(pApli.databasename,pApli.SessionName,
                   'E_MAIL','PERSONA',
                  'ID_PERSONA=(select id_persona from usuario where cve_usuario =''' + pUsrOper + ''')');
         IF Trim(vlCorreo) = '' THEN
         begin
            vlCorreo:=DLookup(pApli.databasename,pApli.SessionName,
                      'E_MAIL','EMAIL_PERSONA',
                      'ID_PERSONA=(select id_persona from usuario where cve_usuario =''' + pUsrOper + ''')');
            IF (Trim(vlCorreo) = '') THEN
                MessageDlg('No se pudo obtener el correo electrónico de ' + pUsrOper,mtError,[mbOK],0);
         end;
      end;
      BuscaCorreoOper:=vlCorreo;
end;

function GetTokenMail(Cadena, Separador: String; Token: Integer): String;
  var
    Posicion: Integer;
  begin
     while Token > 1 do begin
       Delete(Cadena, 1, Pos(Separador,Cadena)+Length(Separador)-1);
       Dec(Token);
     end;
     Posicion:= Pos(Separador, Cadena);
     if Posicion = 0
     then  Result:= Cadena
     else  Result:= Copy(Cadena, 1, Posicion-1);
end;

function GetTokenCountMail(Cadena, Separador: String): Integer;
  var 
     Posicion: Integer;
  begin 
    if Cadena <> '' then begin 
      Posicion:= Pos(Separador, Cadena); 
      Result:= 1; 
      while Posicion <> 0 do begin
        Inc(Result);
        Delete(Cadena, 1, Posicion+Length(Separador)-1);
        Posicion:= Pos(Separador, Cadena);
      end;
    end else
      Result:=0;
 end;

//NUEVA FUNCION DE VALIDACIÓN PLD PARA TRANSACCIONES DE DIVISAS  VIRC4839 17/10/2012
function ValidadorPLD(pidOperacion : Integer;
                      pidContrato  : Integer;
                      pApli        : TInterApli): Integer;
Var
  sp       : TStoredProc;
begin
    //Busca la fecha de liquidación para una Fecha de Valor específica
    //pApli.IdEmpresa
    sp:=TStoredProc.Create(Nil);
    Try
       sp.DatabaseName:=pApli.DataBaseName;
       sp.SessionName :=pApli.SessionName;
       sp.StoredProcName:='PKGDIVISA2.VALIDAOPERPLD';
       sp.Params.CreateParam(ftInteger, 'pIdSolicitud', ptInput);
       sp.Params.CreateParam(ftInteger, 'pIdContrato',  ptInput);
       sp.Params.CreateParam(ftInteger, 'pIdEmpresa',   ptInput);
       sp.Params.CreateParam(ftInteger, 'pCodResp',     ptOutput);
       sp.Params.CreateParam(ftString,  'pDescResp',    ptOutput);

       //Asigna los valores de entrada
       sp.Params.ParamByName('pIdSolicitud').AsInteger := pidOperacion;
       sp.Params.ParamByName('pIdContrato').AsInteger  := pidContrato;
       sp.Params.ParamByName('pIdEmpresa').AsInteger   := pApli.IdEmpresa;

       //Prepara y ejecuta el stored procedure
       sp.Prepare;
       sp.ExecProc;

       sp.ParamByName('PCODRESP').AsInteger;
       sp.ParamByName('PDESCRESP').AsString;

       Result:=sp.ParamByName('PCODRESP').asInteger;
     {if sp.ParamByName('PCODRESP').asInteger <> 0 then
     begin
       Result := False;
       ShowMessage(sp.ParamByName('PDESCRESP').AsString);
     end;}

    Finally
      sp.free;
    End;
end;

Procedure procEnviaComprobantes(p_Apli:TInterApli;
                                pFrom, pTo, pToC:String;
                                pAttach:TStringList;
                                pSubject,pBody:String );//MARA ENERO 2009
var vlhost, vlEmail, vlDig : String;
    NMSMTP1 : TNMSMTP;
    iCuenta1,iCuenta2, iPos:Integer;
    vlComprobante : TStringList;
begin

    try
        NMSMTP1:= TNMSMTP.Create(nil);
        vlHost:=DLookup(p_Apli.databasename,p_Apli.SessionName,
                        'DS_PARAMETRO','DI_PARAMETRO_DV','ID_MESA_CAMBIO=1'+ ' AND CVE_PARAMETRO = ''HOSTNAME'' ' );
        NMSMTP1.Host := vlhost;
        NMSMTP1.Connect;
        Screen.Cursor := crHourGlass;
        if (NMSMTP1.Connected) and (Trim(pFrom)<>'') then
        begin
           NMSMTP1.ClearParams             := TRUE;
           NMSMTP1.SubType                 := mtPlain;
           NMSMTP1.PostMessage.FromAddress := pFrom;
           NMSMTP1.PostMessage.ToAddress.Add(pTo);
           NMSMTP1.PostMessage.Subject     := pSubject;
           NMSMTP1.PostMessage.Attachments := pAttach;
           NMSMTP1.PostMessage.Body.Text   := pBody;
           NMSMTP1.PostMessage.Date        := DateTimeToStr(p_Apli.SysDateTime);
           NMSMTP1.SendMail;
        end;
        NMSMTP1.Disconnect;
    finally
        if nmsmtp1<>nil then nmsmtp1.free;
    end;
end;

Procedure GeneraMT(pidContrato : String;
                   pApli       : TInterApli);
Var
    QMTSwift      : TQuery;
    vlTpMT        : String;
    vlidCto       : String;
    vllstMT       : TStringList;
    vlQuery       : String;
    vlNomArch     : String;
    vQparam       : TQuery;
    vsalida       : String;
    vparam1       : String;
    vparam2       : String;
    vparam3       : String;
    vparam4       : String;
    vparam5       : String;
    vparam6       : String;
    vlEjecuta     : String;
Begin
    QMTSwift := TQuery.Create(nil);
    vllstMT  := TStringList.Create;
    Try
      vlidCto := pidContrato;
      QMTSwift.DatabaseName   := pApli.DataBaseName;
      QMTSwift.SessionName    := pApli.SeguSessionName;
      vlQuery := 'SELECT TIPO_MT, MENSAJE_SWIFT, CVE_TIPO_PAGO, ID_BCO_BENEF ' +
                 '  FROM SC_INSTRUC_PAGO ' +
                 ' WHERE CVE_MEDIO = ''CCAMB''' +
                 '   AND TIPO_MT IS NOT NULL ' +
                 '   AND REFERENCIA = '''+vlidCto+'''';
      QMTSwift.SQL.Add(vlQuery);
      QMTSwift.Open;
      QMTSwift.First;
      While Not QMTSwift.Eof Do
      Begin
        vlTpMT := QMTSwift.fieldbyName('TIPO_MT').AsString;
        vllstMT.Add(QMTSwift.fieldbyName('MENSAJE_SWIFT').AsString);
        QMTSwift.Next;
      End;
      If vllstMT.Count > 0 Then Begin
        If QMTSwift.fieldbyName('CVE_TIPO_PAGO').AsString = 'TRLIN' Then
          vlNomArch := QMTSwift.fieldbyName('ID_BCO_BENEF').AsString
        Else
          vlNomArch := vlTpMT;

        vllstMT.SaveToFile('C:\TEMP\MT'+vlNomArch+'-'+vlidCto+'.in');
      End;
    Finally
      QMTSwift.Free;
      vllstMT.Free;
    End;

    vSalida := 'MT'+vlNomArch+'-'+vlidCto;
    vQparam := TQuery.Create(nil);
    Try
      vQparam.DatabaseName := pApli.DataBaseName;
      vQparam.SessionName  := pApli.SessionName;
      vQparam.SQL.Add('SELECT ID, DESCRIPCION FROM PLD_CATALOGOS WHERE CATALOGO = ''SWIFT''');
      vQparam.Open;
      While Not vQparam.Eof Do Begin
        If vQparam.FieldByName('ID').AsInteger = 1 Then
          vparam1 := vQparam.FieldByName('DESCRIPCION').AsString
        Else If vQparam.FieldByName('ID').AsInteger = 2 Then
          vparam2 := vQparam.FieldByName('DESCRIPCION').AsString
        Else If vQparam.FieldByName('ID').AsInteger = 3 Then
          vparam3 := vQparam.FieldByName('DESCRIPCION').AsString
        Else If vQparam.FieldByName('ID').AsInteger = 4 Then
          vparam4 := vQparam.FieldByName('DESCRIPCION').AsString
        Else If vQparam.FieldByName('ID').AsInteger = 5 Then
          vparam5 := vQparam.FieldByName('DESCRIPCION').AsString
        Else If vQparam.FieldByName('ID').AsInteger = 6 Then
          vparam6 := vQparam.FieldByName('DESCRIPCION').AsString;
        vQparam.Next;
      End;
    Finally
      vQparam.Free;
    End;

    vlEjecuta := '';
    vlEjecuta := 'java -jar ' + vparam1 + ' up '
                              + vparam2 + ' '
                              + vparam3 + ' '
                              + vparam4 + ' '
                              + vparam5 + ' '
                              + 'C:\Temp\' + vSalida + '.in '
                              + vparam6;
    EjecutarYEsperar(vlEjecuta, SW_HIDE );

End; //GeneraMT

Procedure ConstruyeMT(pCveMedio : String;
                      pIdTransaccion :String;
                      pidContrato : String;
                      pApli       : TInterApli);
Var
  vCodResp   : String;
  vMensajeMT : String;
  spMt       : TStoredProc;
Begin
  spMt := TStoredProc.Create(nil);
  spMt.DatabaseName:=pApli.DataBaseName;
  spMt.SessionName :=pApli.SessionName;
  spMt.StoredProcName:='PKGSWIFT.PROCESA_MT';
  spMt.Params.CreateParam(ftString,  'pCveMedio',      ptInput);
  spMt.Params.CreateParam(ftInteger, 'pIdTransaccion', ptInput);
  spMt.Params.CreateParam(ftString,  'pIdReferencia',  ptInput);
  spMt.Params.CreateParam(ftInteger, 'pCodRet',        ptOutput);
  spMt.Params.CreateParam(ftString,  'pMsgRet',        ptOutput);

  //Asigna los valores de entrada
  spMt.Params.ParamByName('pCveMedio').AsString       := pCveMedio;
  spMt.Params.ParamByName('pIdTransaccion').AsInteger := StrtoInt(pIdTransaccion);
  spMt.Params.ParamByName('pIdReferencia').AsString   := pidContrato;

  //Prepara y ejecuta el stored procedure
  spMt.Prepare;
  spMt.ExecProc;

  //spMt.ParamByName('PCODRESP').AsInteger;
  //spMt.ParamByName('PDESCRESP').AsString;
  //Result:=spMt.ParamByName('PCODRESP').asInteger;

End; //ConstruyeMT

Procedure ImportaMT(pApli : TInterApli);
Var
  vQparam       : TQuery;
  vparam1       : String;
  vparam2       : String;
  vparam3       : String;
  vparam4       : String;
  vparam5       : String;
  vparam6       : String;
  vparam7       : String;
  vlEjecuta     : String;
Begin
    vQparam := TQuery.Create(nil);
    Try
      vQparam.DatabaseName := pApli.DataBaseName;
      vQparam.SessionName  := pApli.SessionName;
      vQparam.SQL.Add('SELECT ID, DESCRIPCION FROM PLD_CATALOGOS WHERE CATALOGO = ''SWIFT''');
      vQparam.Open;
      While Not vQparam.Eof Do Begin
        If vQparam.FieldByName('ID').AsInteger = 1 Then
          vparam1 := vQparam.FieldByName('DESCRIPCION').AsString
        Else If vQparam.FieldByName('ID').AsInteger = 2 Then
          vparam2 := vQparam.FieldByName('DESCRIPCION').AsString
        Else If vQparam.FieldByName('ID').AsInteger = 3 Then
          vparam3 := vQparam.FieldByName('DESCRIPCION').AsString
        Else If vQparam.FieldByName('ID').AsInteger = 4 Then
          vparam4 := vQparam.FieldByName('DESCRIPCION').AsString
        Else If vQparam.FieldByName('ID').AsInteger = 5 Then
          vparam5 := vQparam.FieldByName('DESCRIPCION').AsString
        Else If vQparam.FieldByName('ID').AsInteger = 6 Then
          vparam6 := '/Recibidos/*.out';
        vparam7 := 'C:\~SWIFT';
        vQparam.Next;
      End;
    Finally
      vQparam.Free;
    End;
    vlEjecuta := '';
    vlEjecuta := 'java -jar ' + vparam1 + ' down '
                              + vparam2 + ' '
                              + vparam3 + ' '
                              + vparam4 + ' '
                              + vparam5 + ' '
                              + vparam7 + ' '
                              + vparam6;
    EjecutarYEsperar(vlEjecuta, SW_HIDE);
    vlEjecuta := '';
    vlEjecuta := 'java -jar ' + vparam1 + ' up '
                              + vparam2 + ' '
                              + vparam3 + ' '
                              + vparam4 + ' '
                              + vparam5 + ' '
                              + vparam7 + '\*.out '
                              + '/Recibidos/Respaldo';
    //EjecutarYEsperar(vlEjecuta, SW_HIDE);
    vlEjecuta := '';

End; //ImoprtaMT

function EjecutarYEsperar( sPrograma: String; Visibilidad: Integer ): Integer;
var
  sAplicacion        : array[0..512] of char;
  DirectorioActual   : array[0..255] of char;
  DirectorioTrabajo  : String;
  InformacionInicial : TStartupInfo;
  InformacionProceso : TProcessInformation;
  iResultado, iCodigoSalida: DWord;
begin
  StrPCopy( sAplicacion, sPrograma );
  GetDir( 0, DirectorioTrabajo );
  StrPCopy( DirectorioActual, DirectorioTrabajo );
  FillChar( InformacionInicial, Sizeof( InformacionInicial ), #0 );
  InformacionInicial.cb := Sizeof( InformacionInicial );
  InformacionInicial.dwFlags := STARTF_USESHOWWINDOW;
  InformacionInicial.wShowWindow := Visibilidad;
  CreateProcess( nil, sAplicacion, nil, nil, False,CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS,                 nil, nil, InformacionInicial, InformacionProceso );
  repeat
    iCodigoSalida := WaitForSingleObject( InformacionProceso.hProcess, 1000 );
    Application.ProcessMessages;
  until ( iCodigoSalida <> WAIT_TIMEOUT );

  GetExitCodeProcess( InformacionProceso.hProcess, iResultado );
  MessageBeep( 0 );
  CloseHandle( InformacionProceso.hProcess );
  Result := iResultado;
end;

function LocalIP: String;
type
   TaPInAddr = Array[0..10] of PInAddr;
   PaPInAddr = ^TaPInAddr;
var
   phe: PHostEnt;
   pptr: PaPInAddr;
   Buffer: Array[0..63] of Char;
   I: Integer;
   GInitData: TWSAData;
begin
   WSAStartup($101, GInitData);
   Result := '';
   GetHostName(Buffer, SizeOf(Buffer));
   phe := GetHostByName(buffer);
   if phe = nil then Exit;
   pPtr := PaPInAddr(phe^.h_addr_list);
   I := 0;
   while pPtr^[I] <> nil do
   begin
      Result := inet_ntoa(pptr^[I]^);
      Inc(I);
   end;
   WSACleanup;
end;

end.

