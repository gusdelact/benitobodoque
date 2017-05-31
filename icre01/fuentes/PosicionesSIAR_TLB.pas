unit PosicionesSIAR_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.88  $
// File generated on 09/02/2012 02:35:46 PM from Type Library described below.

// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
// ************************************************************************ //
// Type Lib: O:\Delphide\LimitesCorp\out\DLLPosiciones.dll (1)
// IID\LCID: {5FB36755-ED0E-46C9-AE26-B4714E5FAA86}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\Windows\system32\STDVCL40.DLL)
// Errors:
//   Error creating palette bitmap of (TClsPosicionSIAR) : Server C:\Interacciones\Requerimientos\Riesgos - Cartera de Valores\DLLPosiciones.dll contains no icons
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  PosicionesSIARMajorVersion = 1;
  PosicionesSIARMinorVersion = 0;

  LIBID_PosicionesSIAR: TGUID = '{5FB36755-ED0E-46C9-AE26-B4714E5FAA86}';

  IID__ClsPosicionSIAR: TGUID = '{21C021C2-B8FB-4239-8207-1664D6FCAD8F}';
  CLASS_ClsPosicionSIAR: TGUID = '{4270D2EB-B81B-46DC-A11D-EEBD30170844}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _ClsPosicionSIAR = interface;
  _ClsPosicionSIARDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ClsPosicionSIAR = _ClsPosicionSIAR;


// *********************************************************************//
// Interface: _ClsPosicionSIAR
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {21C021C2-B8FB-4239-8207-1664D6FCAD8F}
// *********************************************************************//
  _ClsPosicionSIAR = interface(IDispatch)
    ['{21C021C2-B8FB-4239-8207-1664D6FCAD8F}']
    function  CargaPosiciones(var NombrePortafolio: WideString; var NombreFuente: WideString; 
                              var Signo: WideString; var NombreActivoFinanciero: WideString; 
                              var NombreActivoBasico: WideString; 
                              var FechaPosicionOperacion: TDateTime; var Folio: WideString; 
                              var FechaInicio: TDateTime; var FechaVencimiento: TDateTime; 
                              var Importe: Double; var TasaFija1: WideString; 
                              var TasaFija2: WideString; var TipoCambio: Double; 
                              var PlazodeCupon: WideString; var NoDeCupones: Smallint; 
                              var FechaDeEmision: TDateTime; var FactorCapitalizacion: Double; 
                              var FactorAmortizacion: WideString; 
                              var CuponEmpiezaAmortizar: Smallint; 
                              var NumeroAmortizaciones: Smallint; var TipoCredito: WideString; 
                              var PortafolioCol: WideString; var ValorCol: Double; 
                              var TipoGarantias: Smallint; var OtrosAccesorios: Double; 
                              var DiaCorte: Smallint; var EstatusGeneral: Smallint; 
                              var PorcentajeQuebranto: Double; var TasaCuponActual: Double): WideString; safecall;
    function  CargaZonaGeografica(var NombreZonaGeografica: WideString; var Subnivel: WideString; 
                                  var Descripcion: WideString): WideString; safecall;
    function  CargaTipoCredito(var NombreTipoCredito: WideString; var Subnivel: WideString; 
                               var TipoOperacion: Smallint; var Descripcion: WideString): WideString; safecall;
    function  CargaGiroEconomico(var NombreGiroEconomico: WideString; var Subnivel: WideString; 
                                 var Descripcion: WideString): WideString; safecall;
    function  CargaCalificacionCred(var NombreCalificacionCred: WideString; 
                                    var Subnivel: WideString; var Descripcion: WideString; 
                                    var CurvaCM: WideString): WideString; safecall;
    function  CargaContrapartes(var NombreContraparte: WideString; var ZonaGeografica: WideString; 
                                var GiroEconomico: WideString; var CalificacionCred: WideString; 
                                var Holding: WideString; var Descripcion: WideString; 
                                var LimiteExposicion: Double; var PorcentajeQuebranto: Double): WideString; safecall;
    procedure TiraSesion; safecall;
    procedure LevantaSesion; safecall;
    function  BorraPosicionesDelDia(var Fecha: TDateTime): WideString; safecall;
    function  CargaTasasDeReferencia(var Curva: WideString; var Fecha: TDateTime; 
                                     var Plazo: Smallint; var Tasa: Double): WideString; safecall;
    function  CargaTasasDeMercado(var Fuente: WideString; var Curva: WideString; 
                                  var Escenario: WideString; var Fecha: TDateTime; 
                                  var Plazo: Smallint; var Tasa: Double): WideString; safecall;
    function  CargaPreciosBasicos(var Fuente: WideString; var ActivoBasico: WideString; 
                                  var Escenario: WideString; var FechaCotizacion: OleVariant; 
                                  var Cotizacion: Double): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  _ClsPosicionSIARDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {21C021C2-B8FB-4239-8207-1664D6FCAD8F}
// *********************************************************************//
  _ClsPosicionSIARDisp = dispinterface
    ['{21C021C2-B8FB-4239-8207-1664D6FCAD8F}']
    function  CargaPosiciones(var NombrePortafolio: WideString; var NombreFuente: WideString; 
                              var Signo: WideString; var NombreActivoFinanciero: WideString; 
                              var NombreActivoBasico: WideString; 
                              var FechaPosicionOperacion: TDateTime; var Folio: WideString; 
                              var FechaInicio: TDateTime; var FechaVencimiento: TDateTime; 
                              var Importe: Double; var TasaFija1: WideString; 
                              var TasaFija2: WideString; var TipoCambio: Double; 
                              var PlazodeCupon: WideString; var NoDeCupones: Smallint; 
                              var FechaDeEmision: TDateTime; var FactorCapitalizacion: Double; 
                              var FactorAmortizacion: WideString; 
                              var CuponEmpiezaAmortizar: Smallint; 
                              var NumeroAmortizaciones: Smallint; var TipoCredito: WideString; 
                              var PortafolioCol: WideString; var ValorCol: Double; 
                              var TipoGarantias: Smallint; var OtrosAccesorios: Double; 
                              var DiaCorte: Smallint; var EstatusGeneral: Smallint; 
                              var PorcentajeQuebranto: Double; var TasaCuponActual: Double): WideString; dispid 1610809344;
    function  CargaZonaGeografica(var NombreZonaGeografica: WideString; var Subnivel: WideString; 
                                  var Descripcion: WideString): WideString; dispid 1610809345;
    function  CargaTipoCredito(var NombreTipoCredito: WideString; var Subnivel: WideString; 
                               var TipoOperacion: Smallint; var Descripcion: WideString): WideString; dispid 1610809346;
    function  CargaGiroEconomico(var NombreGiroEconomico: WideString; var Subnivel: WideString; 
                                 var Descripcion: WideString): WideString; dispid 1610809347;
    function  CargaCalificacionCred(var NombreCalificacionCred: WideString; 
                                    var Subnivel: WideString; var Descripcion: WideString; 
                                    var CurvaCM: WideString): WideString; dispid 1610809348;
    function  CargaContrapartes(var NombreContraparte: WideString; var ZonaGeografica: WideString; 
                                var GiroEconomico: WideString; var CalificacionCred: WideString; 
                                var Holding: WideString; var Descripcion: WideString; 
                                var LimiteExposicion: Double; var PorcentajeQuebranto: Double): WideString; dispid 1610809349;
    procedure TiraSesion; dispid 1610809350;
    procedure LevantaSesion; dispid 1610809351;
    function  BorraPosicionesDelDia(var Fecha: TDateTime): WideString; dispid 1610809352;
    function  CargaTasasDeReferencia(var Curva: WideString; var Fecha: TDateTime; 
                                     var Plazo: Smallint; var Tasa: Double): WideString; dispid 1610809353;
    function  CargaTasasDeMercado(var Fuente: WideString; var Curva: WideString; 
                                  var Escenario: WideString; var Fecha: TDateTime; 
                                  var Plazo: Smallint; var Tasa: Double): WideString; dispid 1610809354;
    function  CargaPreciosBasicos(var Fuente: WideString; var ActivoBasico: WideString; 
                                  var Escenario: WideString; var FechaCotizacion: OleVariant; 
                                  var Cotizacion: Double): WideString; dispid 1610809355;
  end;

// *********************************************************************//
// The Class CoClsPosicionSIAR provides a Create and CreateRemote method to          
// create instances of the default interface _ClsPosicionSIAR exposed by              
// the CoClass ClsPosicionSIAR. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoClsPosicionSIAR = class
    class function Create: _ClsPosicionSIAR;
    class function CreateRemote(const MachineName: string): _ClsPosicionSIAR;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TClsPosicionSIAR
// Help String      : 
// Default Interface: _ClsPosicionSIAR
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TClsPosicionSIARProperties= class;
{$ENDIF}
  TClsPosicionSIAR = class(TOleServer)
  private
    FIntf:        _ClsPosicionSIAR;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TClsPosicionSIARProperties;
    function      GetServerProperties: TClsPosicionSIARProperties;
{$ENDIF}
    function      GetDefaultInterface: _ClsPosicionSIAR;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _ClsPosicionSIAR);
    procedure Disconnect; override;
    function  CargaPosiciones(var NombrePortafolio: WideString; var NombreFuente: WideString; 
                              var Signo: WideString; var NombreActivoFinanciero: WideString; 
                              var NombreActivoBasico: WideString; 
                              var FechaPosicionOperacion: TDateTime; var Folio: WideString; 
                              var FechaInicio: TDateTime; var FechaVencimiento: TDateTime; 
                              var Importe: Double; var TasaFija1: WideString; 
                              var TasaFija2: WideString; var TipoCambio: Double; 
                              var PlazodeCupon: WideString; var NoDeCupones: Smallint; 
                              var FechaDeEmision: TDateTime; var FactorCapitalizacion: Double; 
                              var FactorAmortizacion: WideString; 
                              var CuponEmpiezaAmortizar: Smallint; 
                              var NumeroAmortizaciones: Smallint; var TipoCredito: WideString; 
                              var PortafolioCol: WideString; var ValorCol: Double; 
                              var TipoGarantias: Smallint; var OtrosAccesorios: Double; 
                              var DiaCorte: Smallint; var EstatusGeneral: Smallint; 
                              var PorcentajeQuebranto: Double; var TasaCuponActual: Double): WideString;
    function  CargaZonaGeografica(var NombreZonaGeografica: WideString; var Subnivel: WideString; 
                                  var Descripcion: WideString): WideString;
    function  CargaTipoCredito(var NombreTipoCredito: WideString; var Subnivel: WideString; 
                               var TipoOperacion: Smallint; var Descripcion: WideString): WideString;
    function  CargaGiroEconomico(var NombreGiroEconomico: WideString; var Subnivel: WideString; 
                                 var Descripcion: WideString): WideString;
    function  CargaCalificacionCred(var NombreCalificacionCred: WideString; 
                                    var Subnivel: WideString; var Descripcion: WideString; 
                                    var CurvaCM: WideString): WideString;
    function  CargaContrapartes(var NombreContraparte: WideString; var ZonaGeografica: WideString; 
                                var GiroEconomico: WideString; var CalificacionCred: WideString; 
                                var Holding: WideString; var Descripcion: WideString; 
                                var LimiteExposicion: Double; var PorcentajeQuebranto: Double): WideString;
    procedure TiraSesion;
    procedure LevantaSesion;
    function  BorraPosicionesDelDia(var Fecha: TDateTime): WideString;
    function  CargaTasasDeReferencia(var Curva: WideString; var Fecha: TDateTime; 
                                     var Plazo: Smallint; var Tasa: Double): WideString;
    function  CargaTasasDeMercado(var Fuente: WideString; var Curva: WideString; 
                                  var Escenario: WideString; var Fecha: TDateTime; 
                                  var Plazo: Smallint; var Tasa: Double): WideString;
    function  CargaPreciosBasicos(var Fuente: WideString; var ActivoBasico: WideString; 
                                  var Escenario: WideString; var FechaCotizacion: OleVariant; 
                                  var Cotizacion: Double): WideString;
    property  DefaultInterface: _ClsPosicionSIAR read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TClsPosicionSIARProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TClsPosicionSIAR
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TClsPosicionSIARProperties = class(TPersistent)
  private
    FServer:    TClsPosicionSIAR;
    function    GetDefaultInterface: _ClsPosicionSIAR;
    constructor Create(AServer: TClsPosicionSIAR);
  protected
  public
    property DefaultInterface: _ClsPosicionSIAR read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoClsPosicionSIAR.Create: _ClsPosicionSIAR;
begin
  Result := CreateComObject(CLASS_ClsPosicionSIAR) as _ClsPosicionSIAR;
end;

class function CoClsPosicionSIAR.CreateRemote(const MachineName: string): _ClsPosicionSIAR;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ClsPosicionSIAR) as _ClsPosicionSIAR;
end;

procedure TClsPosicionSIAR.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{4270D2EB-B81B-46DC-A11D-EEBD30170844}';
    IntfIID:   '{21C021C2-B8FB-4239-8207-1664D6FCAD8F}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TClsPosicionSIAR.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _ClsPosicionSIAR;
  end;
end;

procedure TClsPosicionSIAR.ConnectTo(svrIntf: _ClsPosicionSIAR);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TClsPosicionSIAR.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TClsPosicionSIAR.GetDefaultInterface: _ClsPosicionSIAR;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TClsPosicionSIAR.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TClsPosicionSIARProperties.Create(Self);
{$ENDIF}
end;

destructor TClsPosicionSIAR.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TClsPosicionSIAR.GetServerProperties: TClsPosicionSIARProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TClsPosicionSIAR.CargaPosiciones(var NombrePortafolio: WideString; 
                                           var NombreFuente: WideString; var Signo: WideString; 
                                           var NombreActivoFinanciero: WideString; 
                                           var NombreActivoBasico: WideString; 
                                           var FechaPosicionOperacion: TDateTime; 
                                           var Folio: WideString; var FechaInicio: TDateTime; 
                                           var FechaVencimiento: TDateTime; var Importe: Double; 
                                           var TasaFija1: WideString; var TasaFija2: WideString; 
                                           var TipoCambio: Double; var PlazodeCupon: WideString; 
                                           var NoDeCupones: Smallint; 
                                           var FechaDeEmision: TDateTime; 
                                           var FactorCapitalizacion: Double; 
                                           var FactorAmortizacion: WideString; 
                                           var CuponEmpiezaAmortizar: Smallint; 
                                           var NumeroAmortizaciones: Smallint; 
                                           var TipoCredito: WideString; 
                                           var PortafolioCol: WideString; var ValorCol: Double; 
                                           var TipoGarantias: Smallint; 
                                           var OtrosAccesorios: Double; var DiaCorte: Smallint; 
                                           var EstatusGeneral: Smallint; 
                                           var PorcentajeQuebranto: Double; 
                                           var TasaCuponActual: Double): WideString;
begin
  Result := DefaultInterface.CargaPosiciones(NombrePortafolio, NombreFuente, Signo, 
                                             NombreActivoFinanciero, NombreActivoBasico, 
                                             FechaPosicionOperacion, Folio, FechaInicio, 
                                             FechaVencimiento, Importe, TasaFija1, TasaFija2, 
                                             TipoCambio, PlazodeCupon, NoDeCupones, FechaDeEmision, 
                                             FactorCapitalizacion, FactorAmortizacion, 
                                             CuponEmpiezaAmortizar, NumeroAmortizaciones, 
                                             TipoCredito, PortafolioCol, ValorCol, TipoGarantias, 
                                             OtrosAccesorios, DiaCorte, EstatusGeneral, 
                                             PorcentajeQuebranto, TasaCuponActual);
end;

function  TClsPosicionSIAR.CargaZonaGeografica(var NombreZonaGeografica: WideString; 
                                               var Subnivel: WideString; var Descripcion: WideString): WideString;
begin
  Result := DefaultInterface.CargaZonaGeografica(NombreZonaGeografica, Subnivel, Descripcion);
end;

function  TClsPosicionSIAR.CargaTipoCredito(var NombreTipoCredito: WideString; 
                                            var Subnivel: WideString; var TipoOperacion: Smallint; 
                                            var Descripcion: WideString): WideString;
begin
  Result := DefaultInterface.CargaTipoCredito(NombreTipoCredito, Subnivel, TipoOperacion, 
                                              Descripcion);
end;

function  TClsPosicionSIAR.CargaGiroEconomico(var NombreGiroEconomico: WideString; 
                                              var Subnivel: WideString; var Descripcion: WideString): WideString;
begin
  Result := DefaultInterface.CargaGiroEconomico(NombreGiroEconomico, Subnivel, Descripcion);
end;

function  TClsPosicionSIAR.CargaCalificacionCred(var NombreCalificacionCred: WideString; 
                                                 var Subnivel: WideString; 
                                                 var Descripcion: WideString; 
                                                 var CurvaCM: WideString): WideString;
begin
  Result := DefaultInterface.CargaCalificacionCred(NombreCalificacionCred, Subnivel, Descripcion, 
                                                   CurvaCM);
end;

function  TClsPosicionSIAR.CargaContrapartes(var NombreContraparte: WideString; 
                                             var ZonaGeografica: WideString; 
                                             var GiroEconomico: WideString; 
                                             var CalificacionCred: WideString; 
                                             var Holding: WideString; var Descripcion: WideString; 
                                             var LimiteExposicion: Double; 
                                             var PorcentajeQuebranto: Double): WideString;
begin
  Result := DefaultInterface.CargaContrapartes(NombreContraparte, ZonaGeografica, GiroEconomico, 
                                               CalificacionCred, Holding, Descripcion, 
                                               LimiteExposicion, PorcentajeQuebranto);
end;

procedure TClsPosicionSIAR.TiraSesion;
begin
  DefaultInterface.TiraSesion;
end;

procedure TClsPosicionSIAR.LevantaSesion;
begin
  DefaultInterface.LevantaSesion;
end;

function  TClsPosicionSIAR.BorraPosicionesDelDia(var Fecha: TDateTime): WideString;
begin
  Result := DefaultInterface.BorraPosicionesDelDia(Fecha);
end;

function  TClsPosicionSIAR.CargaTasasDeReferencia(var Curva: WideString; var Fecha: TDateTime; 
                                                  var Plazo: Smallint; var Tasa: Double): WideString;
begin
  Result := DefaultInterface.CargaTasasDeReferencia(Curva, Fecha, Plazo, Tasa);
end;

function  TClsPosicionSIAR.CargaTasasDeMercado(var Fuente: WideString; var Curva: WideString; 
                                               var Escenario: WideString; var Fecha: TDateTime; 
                                               var Plazo: Smallint; var Tasa: Double): WideString;
begin
  Result := DefaultInterface.CargaTasasDeMercado(Fuente, Curva, Escenario, Fecha, Plazo, Tasa);
end;

function  TClsPosicionSIAR.CargaPreciosBasicos(var Fuente: WideString; 
                                               var ActivoBasico: WideString; 
                                               var Escenario: WideString; 
                                               var FechaCotizacion: OleVariant; 
                                               var Cotizacion: Double): WideString;
begin
  Result := DefaultInterface.CargaPreciosBasicos(Fuente, ActivoBasico, Escenario, FechaCotizacion, 
                                                 Cotizacion);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TClsPosicionSIARProperties.Create(AServer: TClsPosicionSIAR);
begin
  inherited Create;
  FServer := AServer;
end;

function TClsPosicionSIARProperties.GetDefaultInterface: _ClsPosicionSIAR;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('ActiveX',[TClsPosicionSIAR]);
end;

end.
