// *****************************************************************************
// Sistema         : Sistemas Corporativos
// Fecha de Inicio : 28/09/2012
// Función forma   : Validaciónes Generales de Seguridades Corportivas
// Diseñado por    : Marcos Zarate Castro
// Desarrollo por  : Ma. Esthela Almanza Camarillo
// Comentarios     : Ver 1.0
// *****************************************************************************

unit UnSegBtn;

interface

uses
  InterApl,
  DBTables,
  DB,
  Dialogs, UnSql2,
  Windows, Messages, SysUtils, //Variants,
  Classes, Graphics, Controls, Forms, StdCtrls, Winsock;

function ValidaAccesoEsp(pApli : TInterApli; pTipoAcc : String; pMensaje : Boolean; pBitacora : Boolean): Boolean;

function EstableceIP(pApli : TInterApli) : Boolean;

Function GetIPAddress :String;

implementation

(* *****************************************************************************
  Valida Accesos Especiales .  Mzarate.  Sep. 2012.
***************************************************************************** *)
function ValidaAccesoEsp(pApli : TInterApli; pTipoAcc : String; pMensaje : Boolean; pBitacora : Boolean): Boolean;
Var sp         : TStoredProc;   
    vlCodResp  : Integer;   
     
begin ValidaAccesoEsp:=False;
      //Arma s_procedure
      sp :=TStoredProc.Create(Nil);
      try

       sp.DatabaseName:=pApli.DataBaseName;
       sp.SessionName :=pApli.SessionName;
       // VALIDA ACCESO Y GENERA BITACORA EN TABLA BITACORA_SEGU
       sp.StoredProcName:='PKG_GENBIT.STPVALACCESOESP';
       sp.Params.CreateParam(ftString, 'PTIPACCESO',     ptInput);
       sp.Params.CreateParam(ftString, 'PCVE_APLICACION',ptInput);
       sp.Params.CreateParam(ftInteger,'PID_GPO_ACCESO', ptInput);
       sp.Params.CreateParam(ftString, 'PCVE_FUNCION',   ptInput);
       sp.Params.CreateParam(ftString, 'PBGENBIT',       ptInput);
       sp.Params.CreateParam(ftInteger,'PSCODRESP',      ptOutput);


       sp.Params.ParamByName('PTIPACCESO').AsString       :=pTipoAcc;
       sp.Params.ParamByName('PCVE_APLICACION').AsString  :=pApli.Apli;
       sp.Params.ParamByName('PID_GPO_ACCESO').AsInteger  :=pApli.CvePerfil;
       sp.Params.ParamByName('PCVE_FUNCION').AsString     :=pApli.LastFuncion;
       // Envía parámetro para saber si guarda bitácora o solo valida acceso
       if pBitacora
       then sp.Params.ParamByName('PBGENBIT').AsString         :='V'
       else sp.Params.ParamByName('PBGENBIT').AsString         :='F';

       sp.Prepare;
       sp.ExecProc;


       if  sp.ParamByName('PSCODRESP').AsInteger = 0
          then ValidaAccesoEsp:=True
          else begin
                  if pMensaje 
                  then messagedlg('Acceso no Autorizado, [' + pTipoAcc  + '] Verifique con su administrador.',mtError,[mbOK],0);                           
                  ValidaAccesoEsp:=False;
               end;

      finally sp.free;
      end;
end;

(* *****************************************************************************
  Establece IP Address en Sesion Oracle.  Mzarate.  Sep. 2012.
***************************************************************************** *)
function EstableceIP(pApli : TInterApli) : Boolean;
Var vlIP : String;
begin
   vlIP:=GetIPAddress;
   RunSQL( 'BEGIN PKGSESION.StpSetIPAddr(''' + vlIP + ''');   END;' ,pApli.SeguDataBaseName,pApli.SeguSessionName,True);
   EstableceIP:=True;
end;

(* *****************************************************************************
  Obtiene la IP Address.  Mzarate.  Sep. 2012.
***************************************************************************** *)
Function GetIPAddress :String;
type
  pu_long = ^u_long;
var
  varTWSAData : TWSAData;
  varPHostEnt : PHostEnt;
  varTInAddr : TInAddr;
  namebuf : Array[0..255] of char;
begin
  If WSAStartup($101,varTWSAData) <> 0 Then
  Result := 'No. IP Address'
  Else Begin
    gethostname(namebuf,sizeof(namebuf));
    varPHostEnt := gethostbyname(namebuf);
    varTInAddr.S_addr := u_long(pu_long(varPHostEnt^.h_addr_list^)^);
    Result := inet_ntoa(varTInAddr);
  End;
  WSACleanup;
end;





end.
