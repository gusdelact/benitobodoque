//------------------------------------------------------------------------------
// Sistema     : MultiSistema 
// Descripción : Constantes, Funciones y Procedimientos generales (ICB)
// Fecha       : Marzo 2013
// Desarrollo  : Cesar Zamora Ramirez
//------------------------------------------------------------------------------
unit UnFunProcICB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DB,
  DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterApl, UnSQL2, Printers, IntFrm,
  UnGene, Aligrid, ComCtrls;
  
//------------------------------------------------------------------------------
// Constantes
//------------------------------------------------------------------------------
const
   // Booleanos
   cVerdadero       =  'V';
   cFalso           =  'F';
   // Claves de Liquidacion
   cLiqAyer         = 'AYER';
   cLiqHoy          = 'D000';
   cLiqManana       = 'D001';
   // Claves de Paises
   cPaisMexico      = 'PAMEXI';
   cPaisEUA         = 'PAEUA';
   // Tipos de Poblacion
   cPais            = 'PA';
   cEstado          = 'ES';
   cCiudad          = 'CD';
   cPoblacion       = 'PO';
   // Situaciones
   cActivo          = 'AC';
   cInactivo        = 'IN';
   cNoProcesado     = 'NP';
   cNoAutorizado    = 'NA';
   cAutorizado      = 'AU';
   cCancelado       = 'CA';
   cPendImprimir    = 'PI';
   cReImpresion     = 'RE';
   cSigDia          = 'SD';
   cAsignada        = 'AS';
   // Situaciones KYC
   cSinAutor        = 'SA'; // Sin Autorizacion
   cAutPromocion    = 'AP'; // Autorizado por Promocion
   cAutContratos    = 'AC'; // Autorizado por Contratos
   cRecContratos    = 'RC'; // Rechazado por Contratos
   // Jurisdiccion en Persona
   cPerMoral        = 'PM';
   cPerFisica       = 'PF';
   // Tipos Telefonos
   cTelCasa         = 'CASA';
   cTelCel          = 'CEL';
   cTelOfic         = 'OFIC';
   cTelFax          = 'FAX';
   // Afectacion en Saldo
   cIncrementaSdo   = 'I';
   cDecrementaSdo   = 'D';
   // Tipo de Firmas
   cTipoFirmaA      = 'A';
   cTipoFirmaB      = 'B';
   // Roles en Modificacion de Informacion KYC
   cRolUsrPromocion = 'R1';
   cRolUsrContratos = 'R2';
   // Operaciones
   cAlta            = 'ALTA';
   cBaja            = 'BAJA';
   cCambio          = 'CAMBIO';
   // Dato Requerido
   cClave           = 'CLAVE';
   cDescripcion     = 'DESCRIPCION';

//------------------------------------------------------------------------------
// Funciones
//------------------------------------------------------------------------------
   function getParametroICB(Objeto: TInterFrame; pIdParam : Integer; pNumParam : Integer) : String;        // Obtiene el parametro de sb_parametro_icb
   function CtoSituacionKYC(Objeto: TInterFrame; pIdContrato : Integer; pCampo : String) : String;         // Obtiene la situacion KYC de un Contrato
   function NivelRiesgoCto(Objeto: TInterFrame; pIdContrato : Integer; pCampoRequerido : String) : String; // Obtiene el Nivel de Riesgo de un Contrato
   function NivelRiesgoPer(Objeto: TInterFrame; pIdPersona : Integer; pCampoRequerido : String) : String;  // Obtiene el Nivel de Riesgo de una Persona

//------------------------------------------------------------------------------
// Procedimientos
//------------------------------------------------------------------------------
   procedure PuestoValidoCtte(Objeto: TInterFrame; pIdContrato : Integer; pIdPersona : Integer; pCveContratante : String;
                              var pCodRespuesta : Integer; var pMsjRespuesta : String);                   // [Asesores de Inversion] Determina si es valido el puesto de un Contratante.
   procedure AgregaFilaLvw(lvw : Tlistview; informacion : array of String);                               // Agrega Fila a ListView
   {procedure ModificaPerfiCliente(Objeto: TInterApli; pIdContrato : Integer; pModRubros : Integer; var pResultado : Integer);}
implementation

//------------------------------------------------------------------------------
// Funciones [Implementacion]
//------------------------------------------------------------------------------
function getParametroICB(Objeto: TInterFrame; pIdParam : Integer; pNumParam : Integer) : String;
var
   Stp : TStoredProc;
begin
   Stp := TStoredProc.Create(nil);
   try
      with Stp do
      begin
         DatabaseName   := Objeto.Apli.DataBaseName;
         SessionName    := Objeto.Apli.SessionName;
         StoredProcName := 'PKGFUNPROCICB.GETPARAMETROICB';

         Params.CreateParam(ftInteger, 'pIdParam',  ptInput);
         Params.CreateParam(ftInteger, 'pNumParam', ptInput);
         Params.CreateParam(ftString,  'Result',    ptResult);

         ParamByName('pIdParam').AsInteger  := pIdParam;
         ParamByName('pNumParam').AsInteger := pNumParam;
         ExecProc;

         result := trim(ParamByName('Result').AsString);
      end;
   finally
      if Stp <> nil then   Stp.Free;   Stp := nil;
   end;
end;

function CtoSituacionKYC(Objeto: TInterFrame; pIdContrato : Integer; pCampo : String) : String;
var
   Stp : TStoredProc;
begin
   Stp := TStoredProc.Create(nil);
   try
      with Stp do
      begin
         DatabaseName   := Objeto.Apli.DataBaseName;
         SessionName    := Objeto.Apli.SessionName;
         StoredProcName := 'PKGKYCFUNPROC.CTOSITUACIONKYC';

         Params.CreateParam(ftInteger, 'pIdContrato', ptInput);
         Params.CreateParam(ftString,  'pCampo',      ptInput);
         Params.CreateParam(ftString,  'Result',      ptResult);

         ParamByName('pIdContrato').AsInteger := pIdContrato;
         ParamByName('pCampo').AsString       := trim(pCampo);
         ExecProc;

         result := trim(ParamByName('Result').AsString);
      end;
   finally
      if Stp <> nil then   Stp.Free;   Stp := nil;
   end;
end;

function NivelRiesgoCto(Objeto: TInterFrame; pIdContrato : Integer; pCampoRequerido : String) : String;
var
   Stp : TStoredProc;
begin
   Stp := TStoredProc.Create(nil);
   try
      with Stp do
      begin
         DatabaseName   := Objeto.Apli.DataBaseName;
         SessionName    := Objeto.Apli.SessionName;
         StoredProcName := 'PKGCORPORATIVO.NIVELRIESGOCTO';

         Params.CreateParam(ftInteger, 'pIdContrato',     ptInput);
         Params.CreateParam(ftString,  'pCampoRequerido', ptInput);
         Params.CreateParam(ftString,  'Result',          ptResult);

         ParamByName('pIdContrato').AsInteger    := pIdContrato;
         ParamByName('pCampoRequerido').AsString := trim(pCampoRequerido);
         ExecProc;

         result := trim(ParamByName('Result').AsString);
      end;
   finally
      if Stp <> nil then   Stp.Free;   Stp := nil;
   end;
end;

function NivelRiesgoPer(Objeto: TInterFrame; pIdPersona : Integer; pCampoRequerido : String) : String;
var
   Stp : TStoredProc;
   dbS : String;
begin
   Stp := TStoredProc.Create(nil);
   try
      with Stp do
      begin
         DatabaseName   := Objeto.Apli.DataBaseName;
         SessionName    := Objeto.Apli.SessionName;
         StoredProcName := 'PKGCORPORATIVO.NIVELRIESGOPER';

         Params.CreateParam(ftInteger, 'pIdPersona',      ptInput);
         Params.CreateParam(ftString,  'pCampoRequerido', ptInput);
         Params.CreateParam(ftString,  'Result',          ptResult);

         ParamByName('pIdPersona').AsInteger     := pIdPersona;
         ParamByName('pCampoRequerido').AsString := trim(pCampoRequerido);
         ExecProc;

         result := trim(ParamByName('Result').AsString);
      end;
   finally
      if Stp <> nil then   Stp.Free;   Stp := nil;
   end;
end;

//------------------------------------------------------------------------------
// Procedimientos [Implementacion]
//------------------------------------------------------------------------------
{procedure ModificaPerfiCliente(Objeto: TInterApli; pIdContrato : Integer; pModRubros : Integer; var pResultado : Integer);
var
   Stp : TStoredProc;
begin
   Stp := TStoredProc.Create(nil);
   try
      with Stp do
      begin
         DatabaseName   := Objeto.DataBaseName;
         SessionName    := Objeto.SessionName;
         StoredProcName := 'PKGCORPORATIVO.MODIFICAPERFILCLIENTE';

         Params.CreateParam(ftInteger, 'peIdContrato',  ptInput);
         Params.CreateParam(ftInteger, 'peModRubros' ,  ptInput );
         Params.CreateParam(ftInteger, 'peResultado' ,  ptOutput);

         ParamByName('peIdContrato').AsInteger  := pIdContrato;
         ParamByName('peModRubros').AsInteger   := pModRubros;
         ExecProc;

         pResultado := ParamByName('peResultado').AsInteger;
      end;
   finally
      if Stp <> nil then   Stp.Free;   Stp := nil;
   end;
end;  }

procedure PuestoValidoCtte(Objeto: TInterFrame; pIdContrato : Integer; pIdPersona : Integer; pCveContratante : String;
                           var pCodRespuesta : Integer; var pMsjRespuesta : String);
var
   Stp : TStoredProc;
begin
   Stp := TStoredProc.Create(nil);
   try
      with Stp do
      begin
         DatabaseName   := Objeto.Apli.DataBaseName;
         SessionName    := Objeto.Apli.SessionName;
         StoredProcName := 'PKGFUNPROCICB.PUESTOVALIDOCTTE';

         Params.CreateParam(ftInteger, 'pIdContrato',     ptInput);
         Params.CreateParam(ftInteger, 'pIdPersona',      ptInput);
         Params.CreateParam(ftString,  'pCveContratante', ptInput);
         Params.CreateParam(ftInteger, 'pCodRespuesta',   ptOutput);
         Params.CreateParam(ftString,  'pMsjRespuesta',   ptOutput);

         ParamByName('pIdContrato').AsInteger    := pIdContrato;
         ParamByName('pIdPersona').AsInteger     := pIdPersona;
         ParamByName('pCveContratante').AsString := pCveContratante;
         ExecProc;

         pCodRespuesta := ParamByName('pCodRespuesta').AsInteger;
         pMsjRespuesta := trim(ParamByName('pMsjRespuesta').AsString);
      end;
   finally
      if Stp <> nil then   Stp.Free;   Stp := nil;
   end;
end;

procedure AgregaFilaLvw(lvw : Tlistview; informacion : array of String);
var
   fila : Tlistitem;
   n    : Integer;
begin
   for n := low(informacion) to high(informacion) do
   begin
      with lvw do
         if n = 0 then
         begin
            fila         := Items.Add;
            fila.Caption := informacion[n]
         end
         else
            fila.SubItems.Add(informacion[n]);
   end;
end;
end.
