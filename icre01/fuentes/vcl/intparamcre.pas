// Sistema         : Clase de PARAMCRE
// Fecha de Inicio : 13/05/2003
// Función forma   : Clase de PARAMCRE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa / Manuel Romero Ibarra
// Comentarios     : Llama parámetros del Usuario
Unit IntParamCre;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type


 TParamCre= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        FECHA                   : TInterCampo;
        EMPRESA                 : TInterCampo;
        USUARIO                 : TInterCampo;
        PERFIL                  : TInterCampo;
        IDENTIDAD               : TInterCampo;
        B_MULTIEMPRESA          : TInterCampo;
        B_MULTISUCURSAL         : TInterCampo;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        procedure   LlenaFecha;
        procedure   LlenaEmpresa(PPIDEmpresa : Integer);
        procedure   LlenaUsuario;
        procedure   LlenaPerfil;
        Procedure   ObtenEntidad;
      published
      end;


implementation

constructor TParamCre.Create( AOwner : TComponent );
begin Inherited;
      EMPRESA :=CreaCampo('EMPRESA',ftString,tsNinguno,tsNinguno,False);
      FECHA   :=CreaCampo('FECHA',ftString,tsNinguno,tsNinguno,False);
      USUARIO :=CreaCampo('USUARIO',ftString,tsNinguno,tsNinguno,False);
      PERFIL  :=CreaCampo('PERFIL',ftString,tsNinguno,tsNinguno,False);
      IDENTIDAD :=CreaCampo('IDENTIDAD',ftString,tsNinguno,tsNinguno,False);
      B_MULTIEMPRESA  :=CreaCampo('B_MULTIEMPRESA',ftString,tsNinguno,tsNinguno,False);
      B_MULTISUCURSAL  :=CreaCampo('B_MULTISUCURSAL',ftString,tsNinguno,tsNinguno,False);

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntParamCre.Hlp';
      ShowMenuReporte:=True;
      IsCheckSecu:=False; // No Requiere Seguridades.
end;

Destructor TParamCre.Destroy;
begin inherited;
end;

procedure   TParamCre.LlenaFecha;
begin
    FECHA.AsString := FormatDateTime('DD/MM/YYYY',Apli.DameFechaEmpresa);

end;

procedure   TParamCre.LlenaEmpresa(PPIDEmpresa : Integer);
var
   QNomEmpresa : TQuery;
begin
     QNomEmpresa := GetSqlQuery('SELECT NOMBRE FROM PERSONA WHERE   '+
                         ' (ID_PERSONA = ' + IntToStr(PPIDEmpresa)  + ' )'
                         ,Apli.DatabaseName,Apli.SessionName,True);
     Try
          if QNomEmpresa <> nil then
             EMPRESA.AsString :=  QNomEmpresa.FieldByName('NOMBRE').AsString;
          //end if
     finally
            QNomEmpresa.Free;
     end;
end;

procedure   TParamCre.LlenaUsuario;
begin
   USUARIO.AsString := '('+ IntToStr(Apli.UsuarioID)+ ') '+Apli.UsuarioNombre;
end;

procedure   TParamCre.LlenaPerfil;
begin
   PERFIL.AsString := '(' + IntToStr(Apli.CvePerfil) + ') ' + Apli.NomPerfil;

   //Código para buscar el tipo de Usuario
   B_MULTIEMPRESA.AsString  := 'F';
   B_MULTISUCURSAL.AsString  := 'F';

end;

//*****************************************************************************

Procedure TParamCre.ObtenEntidad;
var
   QEmpleado      : TQuery;
begin
     //ENTIDAD USU ALTA
     QEmpleado := GetSqlQuery('SELECT EMPLEADO.ID_ENTIDAD FROM EMPLEADO,USUARIO ' +
                    ' WHERE (USUARIO.CVE_USUARIO = '+ #39 + Apli.Usuario + #39 + ')' +
                    ' AND  (EMPLEADO.ID_PERSONA = USUARIO.ID_PERSONA )',
                    Apli.DatabaseName,Apli.SessionName,True);
     Try
         if QEmpleado <> nil then
              IDENTIDAD.AsInteger := QEmpleado.FieldByName('ID_ENTIDAD').AsInteger
         else
               ShowMessage('PROBLEMAS AL OBTENER ENTIDAD. AVISE A SISTEMAS ');
         //end if
     finally
            QEmpleado.Free;
     end;
end;

end.
