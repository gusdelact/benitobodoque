unit UnConLavDin;
//------------------------------------------------------------------------------
//* Sistema     : Sistema de Lavado de Dinero
//* Descripción : Constantes y funciones comunes en el sistema.
//* Fecha       : Junio del 2008.
//* Desarrollo  : JMT.
//------------------------------------------------------------------------------

interface

Uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterApl, UnSQL2, Printers,
  IntFrm, UnGene;

Const
    cVerdad     =         'V';        //Verdadero
    cFalso      =         'F';        //Falso
    cCveAplicacion=         'LAVDIN'; //Clave de Aplicacion de Lavado de Dinero

Const BitaSTP:TStoredProc=nil;

Var
    vInt    :integer;
    // BITACORA
    Function GrabaBitacora(eApliUsuario, Funcion, Subfuncion, Observacion, DataBaseName, SessionName:String):Boolean;
    // BITACORA

implementation


// BITACORA
//Function GrabaBitacora(eApliUsuario, Funcion, Subfuncion, Observacion:String):Boolean;
Function GrabaBitacora(eApliUsuario, Funcion, Subfuncion, Observacion, DataBaseName, SessionName: String): Boolean;
begin
  GrabaBitacora := false;
  if Trim(Funcion)='' then exit;

  if BitaSTP=nil then
  begin 
    BitaSTP:=TStoredProc.Create(nil);
    BitaSTP.StoredProcName:='PKGCORPORATIVO2.INSERTA_BITLAVDIN';
    BitaSTP.Params.CreateParam( ftString,'PCVEUSUARIO',ptinput);
    BitaSTP.Params.CreateParam( ftString,'PCVEFUNCION',ptinput);
    BitaSTP.Params.CreateParam( ftString,'PCVESUBFUNCION',ptinput);
    BitaSTP.Params.CreateParam( ftString,'POBSERVACIONES',ptinput);
  end;

  Try
    BitaSTP.DataBaseName:=DataBaseName;
    BitaSTP.SessionName:=SessionName;
    BitaSTP.ParamByName('PCVEUSUARIO').AsString:=eApliUsuario;
    BitaSTP.ParamByName('PCVEFUNCION').AsString:=Funcion;
    BitaSTP.ParamByName('PCVESUBFUNCION').AsString:=Subfuncion;
    BitaSTP.ParamByName('POBSERVACIONES').AsString:=Observacion;
    BitaSTP.ExecProc;
    GrabaBitacora := true;
  Except
    on e: Exception do
      MessageDlg('Error al registrar la bitácora de acceso del Sistema de Lavado de Dinero.' + chr(VK_RETURN) +
         e.Message, mtError, [mbOK], 0);
  end;
end;


end.
