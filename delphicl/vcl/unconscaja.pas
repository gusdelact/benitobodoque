//------------------------------------------------------------------------------
//* Sistema     : CAJA
//* Descripción : Constantes comunes en el sistema.
//* Fecha       : Septiembre de 1998.
//* Desarrollo  : Marco Antonio Abad O.
//------------------------------------------------------------------------------
unit unConsCaja;
interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterApl, UnSQL2, Printers,
  IntFrm, UnGene,Aligrid;


Const
    cVacio         =   '';     //Valor String vacío.
    cEsCompra      =  'C';     //Clave de operación compra.
    cEsVenta       =  'V';     //Clave de Operación Venta.
    cEsVerdad      =  'V';     //Indica que la comparación es verdadera.
    cNoEsVerdad    =  'F';     //Indica que la comparación no es verdadera.
    cGpoMotivo     = 'ALTORD'; //Grupo motivo 'ALTA DE ORDEN'
    cGpoMotBaj     = 'CANORD'; //Grupo motivo 'CANCELACION DE ORDEN'
    cGpoMotAut     = 'AUTORD'; //Grupo motivo 'AUTORIZACION DE ORDEN'
    cMotSinSdo     = 'SINSDO'; //Motivo de no autorización 'NO TIENE SALDO'
    cMotSinPos     = 'SINPOS'; //Motivo de No Autorizacoón 'NO TIENE POSICION'
    cMotEmplea     = 'EMPLEA'; //Motivo de No Autorización 'ES EMPLEADO'
    cMotOpAut      = 'OPEAUT'; //Motivo de Operación de Autoentrada.
    cErrorEmpl     = 5;        //Número de error que indica que el titular del contrato es un empleado.
    cAdministra    = 1;        //Es un administrador.
    cPromotor      = 1;        //Es un Promotor.
    cDiaAyer       = 'AYER';   //Clave de día de liquidación de AYER.
    cEsSpot        = 'D000';   //Clave de día de liquidación Spot.
    cDiaManana     = 'D001';   //Clave de día de liquidación 24 Horas.
    cDiaMaximo     = 'D999';   //Clave de día de liquidación máximo.
    cTerminaOK     = 'OK';   //Termina bien la actualización;
    cOperCompra    = 'ASC';  //Clave de Operación de Compra.(Actualizador)
    cOperVenta     = 'APC';  //Clave de Operación de Venta.(Actualizador)
    cTipoPosic     = 'POSC'; //Clave de posición para comprometer posición
    cActNormal     = 'N';    //Tipo de actualización normal.
    cActInversa    = 'I';    //Tipo de actualización inversa.
    cImpBruto      = 'IMPBRU';//Importe Bruto.
    cCreaTrans     = 'AT';   //No Crea transacción.
    cCancTrans     = 'CT';   //Cancela transacción.
    cContrBloq     = 'BLOQUE';//Excepción que indica que el contrato está bloqueado
    cNoReqMotivo   = 'NOMOAU';//No requiere motivos de autorización
    cInactivo      = 'IN';    //Contrato Inactivo
    cGpoPosic      =  1;      //Grupo de tipos de posición para validar posición del contrato
    cNomICB        = 'INTERACCIONES CASA DE BOLSA S.A. DE C.V.';  //Nombre de Casa de Bolsa de Inter
    cNomCitiBank   = 'CITIBANK';   //Nombre de CitiBank
    cCveTipIntBA   = 'BA';    //Clave de Tipo de Intermediario BANCO
    cCtoDocCom     = 'CO';    //Documentacion Completa
    cCveAplicacion = 'CAJA';   //Clave de la Aplicacion
    cTodos         = 'TD';     //Aplica para Todos
    cMedioRH       = 'RECHUM';  //Medio de Recursos Humanos

    cPropia        = 'P';     //Aplica para Propias
    cTerceros      = 'T';     //Aplica para Terceros

    cCveSegmento   = 'PR';    //Cve de Segmento PR

    cTipoFirA      = 'A';     //Tipo de Firma 'A'
    cTipoFirB      = 'B';     //Tipo de Firma 'B'

    cAfecIncre   = 'I';     //Clave de Afectación de Incrementa Saldo
    cAfecDecre   = 'D';     //Clave de Afectación de Decrementa Saldo

    cInsertando    = 'IN';     //Modo Insertando
    cCancOrden     = 'CA';     //Modo Cancelación

    cCheque        = 'CH';     //SE TRATA DE UN CHEQUE
    cCheque24      = 'C2';     //SE TRATA DE UN CHEQUE 24
    cRecibo        = 'RE';     //SE TRATA DE UN RECIBO

    cConcImpBru    = 'IMPBRU';

    //Claves de Tipo de Movimiento
    cCveEfectivo   = 'EF';   //Medio Efectivo
    cCveCheque     = 'CH';   //Medio Cheque
    cCveLinea      = 'LI';   //Medio Linea
    cNoAplica      = 'NA';   //NO aplica

    //Claves de Situacion para Movimientos
    cNoProcesado   = 'NP';          //Movimiento No procesado
    cNoAutorizado  = 'NA';          //Movimiento No Autorizado
    cNoAutorPLD    = 'PL';          //Movimiento No Autorizado por PLD   CZR 27-feb-2013
    cMotNoInsert   = 'NV';          //Movimiento con Motivo de No Insercion
    cAutorizado    = 'AU';          //Movimiento Autorizado
    cCancelado     = 'CA';          //Movimiento Cancelado
    cActivo        = 'AC';          //Situacion Activa
    cPendImpre     = 'PI';          //Pendiente de Impresion
    cReImpre       = 'RE';          //Reimpresion
    cActivar       = 'AC';          //Activar Movimiento
    CSigDia        = 'SD';          //Siguiente Dia
    CAsignada      = 'AS';          //ASIGNADA
    CNOAsignada    = 'SA';          //Sin ASIGNAR
    cAnticipado    = 'FU';          //Anticipado

    //Claves de Afectacion de Chequeras
    cAfecBanco     = 'BC';          //Afectacion Banco
    cAfecCliente   = 'CT';          //Afectación Clente
    cAfecCentCam   = 'CC';          //Afectacion a Central de Cambios
    cAfecNinguno   = 'NA';          //Afectacion No Aplica

    //Nuevas Constantes
    cAMismo        = 'C001';   // Clave para indicar que es a mismo o tilular del contrato
    cExcGpoFinan   = 'GPOFIN'; { Contrato del Grupo Financiero. }
    cExcNoValSyP   = 'NOVSYP'; { No Valida ni Saldo ni Posicion. }
    cTesore        = 'TESORE'; { Clave de Medio para Tesore}
    cTesoFu        = 'FUTURO'; //Clave de Mesio para Tesoreria a 24 Horas

    //Para checar saldo y posición
    cSuma          = 'S';         //Suma la posición o el saldo
    cResta         = 'R';         //Resta la posición o el saldo
    cIndifer       = 'N';         //Es Indistinto (No Aplica)

    //Medios de Comunicación con el Emisor de Documentos
    cMedioIP       = 'IP';        //Clave de medio IP Address
    cUsuFolios     = 'CAJFOL';    //Clave de Suceso
    cCveSuceso     = 'CAJFOL';    //Clave de Suceso

    //Claves para Titular,Cotitular Y Terceros
    cTitular       = 'C001';        //Clave de Titular
    cCotitular     = 'C003';        //Clave de Cotitular
    cOtro          =  '';           //Clave de Otro

    //Clave para tipo de Instrumento
    cInstrCHE      = 'CAPCHE';      //Captura de Cheques
    cInstrREC      = 'CAPREC';      //Captura de Recibo

    //Clave de Segmento
    cContrapartida = 'CP';          //Clave de Segmentación para Contrapartida
    cLiquidadora   = 'LQ';          //Clave de Segmentacion de Liquidadora
    cSI            = 'SI';          //Clave de Segmentacion de SI

    //Clave de Persona
    cPerMoral      = 'PM';          //Clave de Persona Moral
    cPerFisica     = 'PF';          //Clave de Persona Fisica

    //Instrumentos
    cEmisoraPF     = 'IVALOR';      //Emisora para Personas Fisicas
    cSeriePF       = 'B';           //Seire para Persona Fisicas
    CTipoValorPF   = '51';          //Tipo Valor para Personas Fisicas
    //cEmisoraPM     = 'IEMPRE';      //Emisora para Personas Morales           //CAGX4357  Abr-2012
    //cSeriePM       = 'B';           //Seire para Persona Morales              //CAGX4357  Abr-2012
    cEmisoraPM     = 'IVALOR';      //Emisora para Personas Morales             //CAGX4357  Abr-2012
    cSeriePM       = 'M';           //Seire para Persona Morales                //CAGX4357  Abr-2012
    CTipoValorPM   = '51';          //Tipo Valor para Personas Morales

    //Claves de Operacion
    CCveOperDest   = 'DEST';      //Clave de Operación  para realizar el destope
    cCveOperCHOF   = 'CHOF';      // CZR 01-mar-2013
    cCveOperDIET   = 'DIET';      // CZR 04-mar-2013

    //Claves de No Autorizacion
    cCheqNomTer    = 'CHNOTE';
    cFirmManc      = 'CTFIMA';
    cCVEONA        = 'CVEONA';
    //Idiomas
    cIdiPrim       = 'ESP';
    CIdiSecu       = 'ING';

    //Textos de Cartas
    cCarta        = 'Carta Recibida del cliente';
    cFaxAutoriza  = 'Autorizado por Admon o FAX';
    // Para la clabe en TEF
    coTef      =   'TF';
    coCLABE    = 'CLABE';
    coRTETR    = 'RTETR';
    coRTRTE    = 'RTRTE'; // CZR 27-feb-2013
    coRTRCR    = 'RTRCR';
    coRTET     = 'RTET';
    coRSPEI    = 'RSPEIT';
    coATETR    = 'ATETR';
    coATRCR    = 'ATRCR';
    cTipoAsig  = 'LINE';
    coRTCT     = 'RTCT';
    coATCT     = 'ATCT';
    coDPCCHE   = 'DPCCHE';
    coRCHED    = 'RCHED';
    coVTAMULF  = 'VTAMULF';
    coRABIT    = 'RABIT';
    coDCBIT    = 'DCBIT';
    coDTEF     = 'DTEF';     

Function FunOperAutEsp( pCveOperacion,pMedio,pEmpresa: String; pImporte: Double;  pApli: TInterApli): Integer;
Function FunEsAutEsp( pCveOperacion,pEmpresa :String; pApli: TInterApli): Boolean;
Function ObtSdoTD( IdContrato :Integer; pApli: TInterApli): Double;

// CZR 31-Oct-2011
procedure ObtenSucursalUsr(Objeto : TInterFrame; pCve_Usuario : String; var pId_Sucursal : Integer; var pDesc_Sucursal : String);
function  ObtenGpoUsr(Objeto : TInterFrame; pCve_Grupo : String; pCve_Usuario : String) : String;
function  AutorizacionOperacion(Objeto: TInterFrame; pId_Empresa : Integer; pCve_Medio : String;
                                pId_Entidad : Integer; pCve_Operacion : String; pB_Val_Monto : String) : String;
function  UsuarioAutorizado(Objeto: TInterFrame; pId_Empresa : Integer; pCve_Medio : String; pId_Entidad : Integer; pCve_Operacion : String;
                            pCve_Usuario : String; pB_Administrador : String; pB_Alta : String; pB_Autoriza : String) : String;
function  MovimientoValido(Objeto: TInterFrame; pId_Empresa : Integer; pCve_Medio : String; pId_Entidad : Integer; pCve_Operacion : String;
                           pUsr_Alta : String; pUsr_Autoriza : String; var pTxtResultado : String) : String;
function  PLDOperacion(Objeto: TInterFrame; pCveMedio : String; pCveOperacion : String) : String;

function  funMontoValido (Objeto: TInterFrame;
                          pId_Empresa,    pId_Entidad : Integer;
                          pCve_Medio,     pRefExterna, pUsrAut,    pCveOperacion : sTRING; VAR pTxtResultado : String;
                          pImpMovto : Real) : String;

Procedure MensajeMT(pidContrato : String; pTipLiq : String; pApli : TInterApli);
Procedure GeneraMT (pidContrato : String; pTipLiq : String; pApli : TInterApli);
function EjecutarYEsperar( sPrograma: String; Visibilidad: Integer ): Integer;

Implementation

Function FunOperAutEsp( pCveOperacion,pMedio,pEmpresa: String; pImporte: Double;  pApli: TInterApli): Integer;
var QryNumAut: Tquery;
Begin
  Result:= 0;
  Try
    QryNumAut:= Tquery.Create(nil);
    QryNumAut.DatabaseName:= pApli.DatabaseName;
    QryNumAut.SessionName:= pApli.SessionName;
    QryNumAut.sql.Text := ' SELECT  NUM_AUTORIZA  INTO vlNumAutoriza ' +
                            ' FROM TESCO_CRIT_GRAL '+
                           ' WHERE ID_EMPRESA = ' + pEmpresa  + 'AND ' +
                                 ' CVE_OPERACION =' +  pCveOperacion + ' AND '+
                                 ' IMP_LIM_INF <= '  + FloatToStr( pImporte) + ' AND ' +
                                 ' IMP_LIM_SUP > PE_IMPMOVTO';
    QryNumAut.Open;
    if Not QryNumAut.IsEmpty then
      Result := QryNumAut.FieldByName('NUM_AUTORIZA').AsInteger;
  Finally
    If QryNumAut <> nil then QryNumAut.Free;
  End;
End;


Function FunEsAutEsp( pCveOperacion,pEmpresa :String; pApli: TInterApli): Boolean;
var QryEsAut: Tquery;
Begin
  Result:= False;
  Try
    QryEsAut:= Tquery.Create(nil);
    QryEsAut.DatabaseName:= pApli.DatabaseName;
    QryEsAut.SessionName:= pApli.SessionName;
    QryEsAut.sql.Text := ' SELECT B_MULT_AUTOR FROM SC_OPERACION ' +
                            ' WHERE CVE_OPERACION= '+ #39 + pCveOperacion + #39 +
                           ' AND  ID_EMPRESA = ' + pEmpresa ;
    QryEsAut.Open;
    if Not QryEsAut.IsEmpty then
      Result := ( QryEsAut.FieldByName('B_MULT_AUTOR').AsString = cEsVerdad );
  Finally
    If QryEsAut <> nil then QryEsAut.Free;
  End;
End;


Function ObtSdoTD( IdContrato :Integer; pApli: TInterApli): Double;
var spSdoTD: TStoredProc;
Begin
  Result:= 0;
  Try
    spSdoTD:= TStoredProc.Create(nil);
    spSdoTD.DatabaseName:= pApli.DatabaseName;
    spSdoTD.SessionName:= pApli.SessionName;
    spSdoTD.StoredProcName := 'PKGSICIERRE.OBTSALDOMAESTRO';
    spSdoTD.Params.CreateParam(ftInteger, 'pIdContrato',ptInput);
    spSdoTD.Params.CreateParam(ftFloat, 'Result',ptResult);
    spSdoTD.ParamByName('pIdContrato').AsFloat :=IdContrato;
    spSdoTD.ExecProc;
    Result:= spSdoTD.ParamByName('Result').AsFloat;
  Finally
    If spSdoTD <> nil then spSdoTD.Free;
  End;
End;

procedure ObtenSucursalUsr(Objeto : TInterFrame; pCve_Usuario : String; var pId_Sucursal : Integer; var pDesc_Sucursal : String);
var
   Stp : TStoredProc;
   Qry : TQuery;
begin
   try
      Stp                := TStoredProc.Create(nil);
      Stp.DatabaseName   := Objeto.DatabaseName;
      Stp.SessionName    := Objeto.SessionName;
      Stp.StoredProcName := 'PKGCAJASB.FUNOBTENSUCURSAL';

      Stp.Params.CreateParam(ftInteger, 'pIdEmpresa',  ptInput);
      Stp.Params.CreateParam(ftString,  'pCveUsuario', ptInput);
      Stp.Params.CreateParam(ftInteger, 'Result',      ptResult);
      Stp.ParamByName('pIdEmpresa').AsInteger := Objeto.Apli.IdEmpresa;
      Stp.ParamByName('pCveUsuario').AsString := Trim(pCve_Usuario);
      Stp.ExecProc;

      if Stp.ParamByName('Result').AsInteger = 0 then
         ShowMessage('Problemas al Obtener la Sucursal')
      else
      begin
         pId_Sucursal := Stp.ParamByName('Result').AsInteger;
         Qry := GetSqlQuery('select desc_entidad '
                          + '  from unidad_negocio '
                          + ' where id_entidad = ' + IntToStr(pId_Sucursal),
                            Objeto.DatabaseName, Objeto.SessionName, True);
         if Qry <> nil then
            pDesc_Sucursal := Qry.FieldByName('DESC_ENTIDAD').AsString;
      end;
   finally
      if Qry <> nil then   Qry.Free;
      if Stp <> nil then   Stp.Free;   Stp := nil;
   end;
end;

function ObtenGpoUsr(Objeto : TInterFrame; pCve_Grupo : String; pCve_Usuario : String) : String;
var
   Stp : TStoredProc;
begin
   Stp := TStoredProc.Create(nil);
   try
      with Stp do
      begin
         DatabaseName   := Objeto.Apli.DataBaseName;
         SessionName    := Objeto.Apli.SessionName;
         StoredProcName := 'PKGCAJASB.FUNGPOUSUARIO';

         Params.CreateParam(ftString, 'pCve_Grupo',   ptInput);
         Params.CreateParam(ftString, 'pCve_Usuario', ptInput);
         Params.CreateParam(ftString, 'Result',       ptResult);

         ParamByName('pCve_Grupo').AsString   := trim(pCve_Grupo);
         ParamByName('pCve_Usuario').AsString := trim(pCve_Usuario);

         ExecProc;
         result := trim(ParamByName('Result').AsString);
      end;
   finally
      if Stp <> nil then   Stp.Free;   Stp := nil;
   end;
end;

function  funMontoValido (Objeto: TInterFrame;
                        pId_Empresa,    pId_Entidad : Integer;
                        pCve_Medio,     pRefExterna, pUsrAut,    pCveOperacion : sTRING; VAR pTxtResultado : String;
                        pImpMovto : Real) : String;
var
   Stp : TStoredProc;
begin
   Stp := TStoredProc.Create(nil);
   try
      with Stp do
      begin
         DatabaseName   := Objeto.Apli.DataBaseName;
         SessionName    := Objeto.Apli.SessionName;
         StoredProcName := 'PKGCAJASB.FUNMONTOVALIDO';

         Params.CreateParam(ftInteger, 'pId_Empresa',     ptInput);
         Params.CreateParam(ftString,  'pCve_Medio',      ptInput);
         Params.CreateParam(ftString,  'pRef_Externa',    ptInput);
         Params.CreateParam(ftInteger, 'pId_Entidad',     ptInput);
         Params.CreateParam(ftString,  'pCve_Operacion',  ptInput);
         Params.CreateParam(ftFloat,   'pImp_Movto',      ptInput);
         Params.CreateParam(ftString,  'pUsr_Autoriza',   ptInput);
         Params.CreateParam(ftString,  'pTxtResultado',   ptOutput);

         Params.CreateParam(ftString,  'Result',          ptResult);

         ParamByName('pId_Empresa').AsInteger     := pId_Empresa;
         ParamByName('pCve_Medio').AsString       := trim(pCve_Medio);
         ParamByName('pRef_Externa').AsString     := trim(pRefExterna);
         ParamByName('pId_Entidad').AsInteger     := pId_Entidad;
         ParamByName('pCve_Operacion').AsString   := trim(pCveOperacion);
         ParamByName('pImp_Movto').AsFloat        := pImpMovto;
         ParamByName('pUsr_Autoriza').AsString    := trim(pUsrAut);

         ExecProc;

         pTxtResultado := trim(ParamByName('pTxtResultado').AsString);
         result        := trim(ParamByName('Result').AsString);
      end;
   finally
      if Stp <> nil then   Stp.Free;   Stp := nil;
   end;
end;

function AutorizacionOperacion(Objeto: TInterFrame; pId_Empresa : Integer; pCve_Medio : String;
                               pId_Entidad : Integer; pCve_Operacion : String; pB_Val_Monto : String) : String;
var
   Stp : TStoredProc;
begin
   Stp := TStoredProc.Create(nil);
   try
      with Stp do
      begin
         DatabaseName   := Objeto.Apli.DataBaseName;
         SessionName    := Objeto.Apli.SessionName;
         StoredProcName := 'PKGCAJASB.FUNAUTOPERACION';

         Params.CreateParam(ftInteger, 'pId_Empresa',    ptInput);
         Params.CreateParam(ftString,  'pCve_Medio',     ptInput);
         Params.CreateParam(ftInteger, 'pId_Entidad',    ptInput);
         Params.CreateParam(ftString,  'pCve_Operacion', ptInput);
         Params.CreateParam(ftString,  'pB_Val_Monto',   ptInput);
         Params.CreateParam(ftString,  'Result',         ptResult);

         ParamByName('pId_Empresa').AsInteger   := pId_Empresa;
         ParamByName('pCve_Medio').AsString     := trim(pCve_Medio);
         ParamByName('pId_Entidad').AsInteger   := pId_Entidad;
         ParamByName('pCve_Operacion').AsString := trim(pCve_Operacion);
         ParamByName('pB_Val_Monto').AsString   := trim(pB_Val_Monto);

         ExecProc;
         result := trim(ParamByName('Result').AsString);
      end;
   finally
      if Stp <> nil then   Stp.Free;   Stp := nil;
   end;
end;

function UsuarioAutorizado(Objeto: TInterFrame; pId_Empresa : Integer; pCve_Medio : String; pId_Entidad : Integer; pCve_Operacion : String;
                           pCve_Usuario : String; pB_Administrador : String; pB_Alta : String; pB_Autoriza : String) : String;
var
   Stp : TStoredProc;
begin
   Stp := TStoredProc.Create(nil);
   try
      with Stp do
      begin
         DatabaseName   := Objeto.Apli.DataBaseName;
         SessionName    := Objeto.Apli.SessionName;
         StoredProcName := 'PKGCAJASB.FUNUSRAUTORIZADO';

         Params.CreateParam(ftInteger, 'pId_Empresa',      ptInput);
         Params.CreateParam(ftString,  'pCve_Medio',       ptInput);
         Params.CreateParam(ftInteger, 'pId_Entidad',      ptInput);
         Params.CreateParam(ftString,  'pCve_Operacion',   ptInput);
         Params.CreateParam(ftString,  'pCve_Usuario',     ptInput);
         Params.CreateParam(ftString,  'pB_Administrador', ptInput);
         Params.CreateParam(ftString,  'pB_Alta',          ptInput);
         Params.CreateParam(ftString,  'pB_Autoriza',      ptInput);
         Params.CreateParam(ftString,  'Result',           ptResult);

         ParamByName('pId_Empresa').AsInteger     := pId_Empresa;
         ParamByName('pCve_Medio').AsString       := trim(pCve_Medio);
         ParamByName('pId_Entidad').AsInteger     := pId_Entidad;
         ParamByName('pCve_Operacion').AsString   := trim(pCve_Operacion);
         ParamByName('pCve_Usuario').AsString     := trim(pCve_Usuario);
         ParamByName('pB_Administrador').AsString := trim(pB_Administrador);
         ParamByName('pB_Alta').AsString          := trim(pB_Alta);
         ParamByName('pB_Autoriza').AsString      := trim(pB_Autoriza);
         ExecProc;

         result := trim(ParamByName('Result').AsString);
      end;
   finally
      if Stp <> nil then   Stp.Free;   Stp := nil;
   end;
end;

function MovimientoValido(Objeto: TInterFrame; pId_Empresa : Integer; pCve_Medio : String; pId_Entidad : Integer; pCve_Operacion : String;
                          pUsr_Alta : String; pUsr_Autoriza : String; var pTxtResultado : String) : String;
var
   Stp : TStoredProc;
begin
   Stp := TStoredProc.Create(nil);
   try
      with Stp do
      begin
         DatabaseName   := Objeto.Apli.DataBaseName;
         SessionName    := Objeto.Apli.SessionName;
         StoredProcName := 'PKGCAJASB.FUNMOVTOVALIDO';

         Params.CreateParam(ftInteger, 'pId_Empresa',    ptInput);
         Params.CreateParam(ftString,  'pCve_Medio',     ptInput);
         Params.CreateParam(ftInteger, 'pId_Entidad',    ptInput);
         Params.CreateParam(ftString,  'pCve_Operacion', ptInput);
         Params.CreateParam(ftString,  'pUsr_Alta',      ptInput);
         Params.CreateParam(ftString,  'pUsr_Autoriza',  ptInput);
         Params.CreateParam(ftString,  'pTxtResultado',  ptOutput);
         Params.CreateParam(ftString,  'Result',         ptResult);

         ParamByName('pId_Empresa').AsInteger   := pId_Empresa;
         ParamByName('pCve_Medio').AsString     := trim(pCve_Medio);
         ParamByName('pId_Entidad').AsInteger   := pId_Entidad;
         ParamByName('pCve_Operacion').AsString := trim(pCve_Operacion);
         ParamByName('pUsr_Alta').AsString      := trim(pUsr_Alta);
         ParamByName('pUsr_Autoriza').AsString  := trim(pUsr_Autoriza);
         ExecProc;

         pTxtResultado := trim(ParamByName('pTxtResultado').AsString);
         result        := trim(ParamByName('Result').AsString);
      end;
   finally
      if Stp <> nil then   Stp.Free;   Stp := nil;
   end;
end;

function PLDOperacion(Objeto: TInterFrame; pCveMedio : String; pCveOperacion : String) : String;
var
   Stp : TStoredProc;
begin
   Stp := TStoredProc.Create(nil);
   try
      with Stp do
      begin
         DatabaseName   := Objeto.Apli.DataBaseName;
         SessionName    := Objeto.Apli.SessionName;
         StoredProcName := 'PKGCAJASB.FUNPLDOPERACION';

         Params.CreateParam(ftString, 'pCveMedio',      ptInput);
         Params.CreateParam(ftString, 'pCve_Operacion', ptInput);
         Params.CreateParam(ftString, 'Result',         ptResult);

         ParamByName('pCveMedio').AsString     := trim(pCveMedio);
         ParamByName('pCveOperacion').AsString := trim(pCveOperacion);
         ExecProc;

         result := trim(ParamByName('Result').AsString);
      end;
   finally
      if Stp <> nil then   Stp.Free;   Stp := nil;
   end;
end;

Procedure MensajeMT(pidContrato : String;
                    pTipLiq     : String;
                    pApli       : TInterApli);
Var
    vlidCto       : String;
    spMT          : TStoredProc;
Begin
    If pTipLiq <> 'TRLIN' Then Begin
      spMT     := TStoredProc.Create(nil);
      Try
        vlidCto := pidContrato;
        spMT.DatabaseName   := pApli.DataBaseName;
        spMT.SessionName    := pApli.SeguSessionName;
        spMT.StoredProcName := 'PKGSWIFT.PROCESA_MT';
        spMT.Params.CreateParam(ftString, 'pCveMedio',      ptInput);
        spMT.Params.CreateParam(ftInteger,'pIdTransaccion', ptInput);
        spMT.Params.CreateParam(ftString, 'pIdReferencia',  ptInput);
        spMT.Params.CreateParam(ftInteger,'pCodRet',        ptOutput);
        spMT.Params.CreateParam(ftString, 'pMsgRet',        ptOutput);

        spMT.ParamByName('pCveMedio').AsString       := 'TESORE';
        spMT.ParamByName('pIdTransaccion').AsInteger := StrtoInt(pidContrato);
        spMT.ParamByName('pIdReferencia').AsString   := pidContrato;

        spMT.ExecProc;
      Finally
        spMT.Free;
      End;
    End
    Else Begin
      spMT     := TStoredProc.Create(nil);
      Try
        vlidCto := pidContrato;
        spMT.DatabaseName   := pApli.DataBaseName;
        spMT.SessionName    := pApli.SeguSessionName;
        spMT.StoredProcName := 'PKGSWIFT.PROCESA_LB';
        spMT.Params.CreateParam(ftString, 'pCveMedio',      ptInput);
        spMT.Params.CreateParam(ftInteger,'pIdTransaccion', ptInput);
        spMT.Params.CreateParam(ftString, 'pIdReferencia',  ptInput);
        spMT.Params.CreateParam(ftInteger,'pCodRet',        ptOutput);
        spMT.Params.CreateParam(ftString, 'pMsgRet',        ptOutput);

        spMT.ParamByName('pCveMedio').AsString       := 'TESORE';
        spMT.ParamByName('pIdTransaccion').AsInteger := StrtoInt(pidContrato);
        spMT.ParamByName('pIdReferencia').AsString   := pidContrato;

        spMT.ExecProc;
      Finally
        spMT.Free;
      End
    End;
End; //MensajeMT

Procedure GeneraMT(pidContrato : String;
                   pTipLiq     : String;
                   pApli       : TInterApli);
Var
    QMTSwift      : TQuery;
    vlTpMT        : String;
    vlidCto       : String;
    vllstMT       : TStringList;
    vlQuery       : String;
    vQparam       : TQuery;
    vsalida       : String;
    vparam1       : String;
    vparam2       : String;
    vparam3       : String;
    vparam4       : String;
    vparam5       : String;
    vparam6       : String;
    vlEjecuta     : String;
    vlRutaLB      : String;
Begin
    QMTSwift := TQuery.Create(nil);
    vllstMT  := TStringList.Create;
    Try
      vlidCto := pidContrato;
      QMTSwift.DatabaseName   := pApli.DataBaseName;
      QMTSwift.SessionName    := pApli.SeguSessionName;
      vlQuery := 'SELECT TIPO_MT, MENSAJE_SWIFT ' +
                 '  FROM SC_INSTRUC_PAGO ' +
                 ' WHERE CVE_MEDIO = ''TESORE''' +
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
      If vllstMT.Count > 0 Then
        If pTipLiq <> 'TRLIN' Then Begin
           vSalida  := 'C:\TEMP\MT' + vlTpMT + '-' + vlidCto + '.in';
           vllstMT.SaveToFile(vSalida);
           vlRutaLB := '';
        End
        Else Begin
           If      vlTpMT = '1719'  Then Begin
             vlTpMT   := 'STD';
             vlRutaLB := 'Santander/';
           End
           Else If vlTpMT = '1716'  Then Begin
             vlTpMT   := 'BTE';
             vlRutaLB := 'Banorte/';
           End
           Else If vlTpMT = '6078'  Then Begin
             vlTpMT   := 'BMR';
             vlRutaLB := 'Bancomer/';
           End
           Else If vlTpMT = '27170' Then Begin
             vlTpMT   := 'HSB';
             vlRutaLB := 'HSBC/';
           End;
           vSalida := 'C:\TEMP\LB-' + vlTpMT + '-' + vlidCto + '.txt';
           vllstMT.SaveToFile(vSalida);
        End;

    Finally
      QMTSwift.Free;
      vllstMT.Free;
    End;

    vQparam := TQuery.Create(nil);
    Try
      vQparam.DatabaseName := pApli.DataBaseName;
      vQparam.SessionName  := pApli.SessionName;
      If pTipLiq <> 'TRLIN' Then
        vQparam.SQL.Add('SELECT ID, DESCRIPCION FROM PLD_CATALOGOS WHERE CATALOGO = ''SWIFT''')
      Else
        vQparam.SQL.Add('SELECT ID, DESCRIPCION FROM PLD_CATALOGOS WHERE CATALOGO = ''LINBAN''');

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
                              + vSalida + ' '
                              + vparam6 + vlRutaLB;
    EjecutarYEsperar(vlEjecuta, SW_HIDE );

End; //GeneraMT

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

end.
