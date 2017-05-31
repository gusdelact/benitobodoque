//--------------------------------------------
// Sistema : CORPORATIVO
// Fecha   :
// Fecha Inicio :
// Función : Calculadora Financiera
// Desarrollo por : Rocío Arriaga y Manuel Romero
// Comentarios :
//-------------------------------------------

unit UnCalFin;

interface

Uses Classes,Controls,Messages,Windows,Forms,StdCtrls,SysUtils,Dialogs,dbtables,InterApl;

Type
  TCalcFinan=class(TComponent)
Private

  // Variables para cálculo de la alambrada
   VlApli           : TInterApli; // Control del Apli
   VlPlazo_Corto    : Integer;    // Plazo límite inferior
   VlTasa_Corto     : Double;     // Tasa límite inferior
   VlPlazo_Largo    : Integer;    // Plazo límite superior
   VlTasa_Largo     : Double;     // Tasa límite superior
   VlTasa_Alambrada : Double;     // Resultado tasa alambrada
   // Variables genéricas
   VlPlazo          : Integer;    // Plazo general
   VlAviso          : Boolean;    // Bandera para indicar si se muestra un error

   // Procedimientos
   Procedure MessageError(NumErr:Integer);

Protected
   procedure Notification(AComponent : TComponent; Operation : TOperation); override;

Published
 // Propiedades para el cálculo de la tasa alambrada.
   property Plazo_Corto    : Integer  read VlPlazo_Corto    write VlPlazo_Corto;
   property Tasa_Corto     : Double   read VlTasa_Corto     write VlTasa_Corto;
   property Plazo_Largo    : Integer  read VlPlazo_Largo    write VlPlazo_Largo;
   property Tasa_Largo     : Double   read VlTasa_Largo     write VlTasa_Largo;
   property Tasa_Alambrada : Double   read VlTasa_Alambrada write VlTasa_Alambrada;

 // Propiedades de uso genérico
   property Plazo         : Integer   read VlPlazo          write VlPlazo;
   property Apli          :TInterApli read VlApli           write VlApli;
   property Aviso         : Boolean   read VlAviso          write VlAviso;

 // Procedimientos
   Function TasaAlambrada : Integer;

Public
   Constructor Create(Owner:TComponent);

end;

implementation

// C o n s t r u c t o r
{******************************************************************************}
Constructor TCalcFinan.Create(Owner:TComponent);
Begin
   inherited Create(Owner);
   VlApli := nil;
   Aviso  := True;
End;  {Constructor}

// N o t i f i c a c i ó n
{******************************************************************************}
procedure TCalcFinan.Notification(AComponent : TComponent; Operation : TOperation);
Begin
  if (Operation = opRemove) and (AComponent = VlApli) then
  begin
    VlApli := nil;
  end;
End; {Notificación}

// Mensajes de error
{******************************************************************************}
procedure TCalcFinan.MessageError(NumErr:Integer);
var VlMessage : String;
Begin
  if Aviso then
  begin
     MessageBeep(0);
     Case NumErr of
          90   : VlMessage := 'Error en Cálculo';
          91   : VlMessage := 'Error parámetros incompletos para tasa alambrada';
          else  VlMessage := 'Error no identificado';
     End;
     ShowMessage(VlMessage);
  End;
End;

// Función para el cálculo de la tasa alambrada
{******************************************************************************}
Function TCalcFinan.TasaAlambrada : Integer;
Var
  STPCalcFinan : TStoredProc;
Begin
  Try
    STPCalcFinan                := TStoredProc.Create(Self);
    STPCalcFinan.DatabaseName   := VlApli.DataBaseName;
    STPCalcFinan.SessionName    := VlApli.SessionName;
    STPCalcFinan.StoredProcName := 'STPCALCFINAN';
    STPCalcFinan.Prepare;
    STPCalcFinan.ParamByName('pMetodo').AsInteger     := 1;
    STPCalcFinan.ParamByName('pPlazoCorto').AsInteger := Plazo_Corto;
    STPCalcFinan.ParamByName('pTasaCorto').AsFloat    := Tasa_Corto;
    STPCalcFinan.ParamByName('pPlazoLargo').AsInteger := Plazo_Largo;
    STPCalcFinan.ParamByName('pTasaLargo').AsFloat    := Tasa_Largo;
    STPCalcFinan.ParamByName('pPlazoAlam').AsInteger  := Plazo;
    STPCalcFinan.ExecProc;
    if STPCalcFinan.ParamByName('pResp').AsInteger <> 0 then
    begin
      MessageError(STPCalcFinan.ParamByName('pResp').AsInteger);
    end;
    Tasa_Alambrada := STPCalcFinan.ParamByName('pTasaAlam').AsFloat;
  Finally
    STPCalcFinan.Free;
  End;
End; {Tasa Alambrada}
end.
