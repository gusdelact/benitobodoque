// Sistema         : ICRE01
// Fecha de Inicio : 20/11/2009
// Función forma   : Clase de CRCIERRE
// Desarrollo por  : Julio Cesar Ruiz Castro
// Diseñado por    : Julio Cesar Ruiz Castro
// Comentarios     : Esta unidad contienen las clases que corresponden a cada documento digitalizado durante
//                     el cierre de créditos
//    ------------------------------------------------------------------------|-----------------------
//    Documentos        						                                    | Clave
//    ------------------------------------------------------------------------|-----------------------
//    Reporte de provisión diaria					                              | PROV_AL_
//    Cobranza Pagos Binter - Activos					                           | COB_BINTER_AC_AL_
//    Cobranza Pagos Binter - Cancelados				                           | COB_BINTER_CA_AL_
//    Cobranza Pagos FIRA - Activos	  				                              | COB_FIRA_AC_AL_
//    Cobranza Pagos FIRA - Cancelados  				                           | COB_FIRA_CA_AL_
//    Vencimientos Contable por cartera impagada - cartera de crédito	      | VTO_IMP_CC_AL_
//    Vencimientos Contable por cartera vencida exigible - cartera de crédito | VTO_VDA_CC_AL_
//    Vencimientos Contable por cartera impagada - garantía de fondos	      | VTO_IMP_GF_AL_
//    Vencimientos Contable por cartera vencida exigible - garantía de fondos | VTO_VDA_GF_AL_
//    Colocacióin y/o vencimientos					                              | COLOCA_AL_
//    ------------------------------------------------------------------------|-----------------------

//   ---------------------------------------------------------|-------------
//   Descripción de la información en BD                      |  Status
//   ---------------------------------------------------------|-------------
//   Digitalización cierre del día cuando estan Correctos     |  1
//   Digitalización cierre del día cuando estan Incorrectos   |  0
//   Redigitalización de documentos -todos los correctos-     |  3


unit uRedigitalizacion;

interface

//uses Classes, Controls, InterApl, DB, DBTables, UnSQL2, SysUtils, Messages, Dialogs,
//   Grids, Aligrid;
uses Classes, Controls, InterApl, DB, DBTables, UnSQL2, SysUtils, Messages, Dialogs,
   Grids, Aligrid, DBGrids, StdCtrls, Graphics;


const
   strMensaje       =  '    Proceso "TRedigitaliza.AddDigitaliza"' + #13 + #10 + '' + #13 + #10
                     + 'Revise que no exista problemas en la conexión'
                     + #13 + #10 + 'hacia la Base de Datos "PCORP"';

   strQueryDelDia   =  '' +
                     ' SELECT CVE_REDIGITALIZA, FECHA_EJECUCION, CLAVE_DOCUMENTO, DOCUMENTO, GRUPO, APLICACION ' +
                     ' FROM Cr_redigitaliza WHERE ( fecha_ejecucion between TO_DATE('  + chr(39) + '%s' + chr(39) +
                     ',' + chr(39) + 'dd/mm/yyyy' + chr(39) + ') and TO_DATE( ' + chr(39) + '%s' + chr(39) +
                     ',' + chr(39) + 'dd/mm/yyyy' + chr(39) +  ') ) And ejecuto = 0 ';

   strQueryOtroDia  =  ' ' +
                     ' SELECT CVE_REDIGITALIZA, FECHA_EJECUCION, CLAVE_DOCUMENTO, DOCUMENTO, GRUPO, APLICACION ' +
                     ' FROM Cr_redigitaliza WHERE ( fecha_ejecucion between TO_DATE('  + chr(39) + '%s' + chr(39) +
                     ',' + chr(39) + 'dd/mm/yyyy' + chr(39) + ') and TO_DATE( ' + chr(39) + '%s' + chr(39) +
                     ',' + chr(39) + 'dd/mm/yyyy' + chr(39) +  ') ) And ejecuto = 1 ';

type
   {@Classname, se utiliza para generar un conjunto de resultados dentro de la unidad intCierre,
        que corresponde a los procesos de digitalización de documentos.}
   TSeleccion = (atPROV_AL, atCOB_BINTER_AC_AL, atCOB_BINTER_CA_AL, atCOB_FIRA_AC_AL, atCOB_FIRA_CA_AL,
                 atVTO_IMP_CC_AL, atVTO_VDA_CC_AL, atVTO_IMP_GF_AL, atVTO_VDA_GF_AL, atCOLOCA_AL);
   TSeleccionaOpcion = set of TSeleccion;

   TTipoCosulta = (atDelDia, atOtroDia);

   {@Classname, se utiliza para generar la bitacore de los documentos que no pudieron ser
      cargados durante el proceso del cierre diario.
      A demás de realizar la carga de los datos pendientes por digitalizar,
      desde la pantalla de Redigitalización.}
   TRedigitaliza = class(TObject)
   private
      FFechaEjec,
      FCveDoc      : String;
      FGrupo       : String;
      FExito       : Integer;
      FNomApli     : String;
      FAPli        : TInterApli;
      FSeccion     : String;

      procedure setFechaEjec(const Value: String);
      procedure SetCveDoc(const Value: String);
      procedure SetGrupo(const Value: String);
      procedure SetExito(const Value: Integer);
      procedure SetNomApli(const Value: String);
      procedure SetSeccion(const Value: String);
   protected
      procedure AddDigitaliza;
      procedure upDigitaliza;
   public
      constructor create(aAPli : TInterApli);

      property FechaEjec   : String write SetFechaEjec;
      property CveDoc      : String write SetCveDoc;
      property Grupo       : String write SetGrupo;
      property NomApli     : String write SetNomApli;
      property Exito       : Integer  write SetExito;
      property Seccion     : String write SetSeccion;
   end;


   TRecolectaDatos = class(TObject)
      class procedure Recoleccion(aFechaEjec, aCveDoc : String;
         aGrupo, aNomApli : String; aExito : Integer; aAPli : TInterApli);
      class procedure upDigitalizacion(aFechaEjec, aCveDoc : String; aAPli : TInterApli);
      class function  BooleanToByte(ABool : Boolean): Byte;
      class function  delString(cadena: string) : string;
      class function  generaQuery(aOpcion : TTipoCosulta; aFechaIni, aFechaTer : string) : String;
   end;


implementation

{ TRedigitaliza }

constructor TRedigitaliza.create(aAPli: TInterApli);
begin
   Self.FAPli := aAPli;
end;

procedure TRedigitaliza.AddDigitaliza;
var
   spAdd  : TStoredProc;
begin
   spAdd := TStoredProc.Create(nil);
   try
      with spAdd do
      Begin
        spAdd.SessionName    := FAPli.SessionName;
        spAdd.DatabaseName   := FAPli.DataBaseName;

        spAdd.StoredProcName := 'PKGDIGITADOC.STP_REDIGITALIZAADD';
        Params.Clear;
        Params.CreateParam(ftDate,   'AFECHA_EJECUCION', ptInput);
        Params.CreateParam(ftString, 'ACLAVE_DOCUMENTO', ptInput);
        Params.CreateParam(ftString, 'AGRUPO', ptInput);
        Params.CreateParam(ftString, 'AAPLICACION', ptInput);
        Params.CreateParam(ftString, 'AEJECUTO', ptInput);
        Params.CreateParam(ftString, 'ARESULTADO', ptOutput);
        Params.CreateParam(ftString, 'ATXT_RESULTADO', ptOutput);

        ParamByName('AFECHA_EJECUCION').AsString := FFechaEjec;
        ParamByName('ACLAVE_DOCUMENTO').AsString := FCveDoc;
        ParamByName('AGRUPO').AsString := FGrupo;
        ParamByName('AAPLICACION').AsString := FNomApli;
        ParamByName('AEJECUTO').AsInteger := FExito;
        ParamByName('ARESULTADO').AsInteger := 0;
        ParamByName('ATXT_RESULTADO').AsString := '';

        try
        ExecProc;
        if ParamByName('ARESULTADO').AsInteger <> 0 then
           MessageDlg('Error : ' + ParamByName('ARESULTADO').AsString + ParamByName('ATXT_RESULTADO').AsString, mtWarning, [mbOK], 0);
        except
          on e: Exception do
          begin
            MessageDlg(strMensaje, mtError, [mbOK], 0);
          end;
        end;
      end;
   finally
      if spAdd <> nil then
         spAdd.Free;
  end
end;

procedure TRedigitaliza.SetCveDoc(const Value: String);
begin
   FCveDoc := Value;
end;

procedure TRedigitaliza.SetExito(const Value: Integer);
begin
   FExito := Value;
end;

procedure TRedigitaliza.setFechaEjec(const Value: String);
begin
   FFechaEjec := Value;
end;

procedure TRedigitaliza.SetGrupo(const Value: String);
begin
   FGrupo := Value;
end;

procedure TRedigitaliza.SetNomApli(const Value: String);
begin
   FNomApli := Value;
end;

procedure TRedigitaliza.SetSeccion(const Value: String);
begin
  FSeccion := Value;
end;

procedure TRedigitaliza.upDigitaliza;
var
   spUp  : TStoredProc;
begin
   spUp := TStoredProc.Create(nil);
   try
      with spUp do
      Begin
        spUp.SessionName    := FAPli.SessionName;
        spUp.DatabaseName   := FAPli.DataBaseName;

        spUp.StoredProcName := 'PKGDIGITADOC.STP_REDIGITALIZAUPD';
        Params.Clear;
        Params.CreateParam(ftDate,   'AF_EJECUCION', ptInput);
        Params.CreateParam(ftString, 'ASECCION', ptInput);
        Params.CreateParam(ftString, 'ARESULTADO', ptOutput);
        Params.CreateParam(ftString, 'ATXT_RESULTADO', ptOutput);

        ParamByName('AF_EJECUCION').AsString := FFechaEjec;
        ParamByName('ASECCION').AsString := FSeccion;
        ParamByName('ARESULTADO').AsInteger := 0;
        ParamByName('ATXT_RESULTADO').AsString := '';

        try
        ExecProc;
        if ParamByName('ARESULTADO').AsInteger <> 0 then
           MessageDlg('Error : ' + ParamByName('ARESULTADO').AsString + ParamByName('ATXT_RESULTADO').AsString, mtWarning, [mbOK], 0);
        except
          on e: Exception do
          begin
            MessageDlg(strMensaje, mtError, [mbOK], 0);
          end;
        end;
      end;
   finally
      if spUp <> nil then
         spUp.Free;
  end
end;

{ TRecolectaDatos }

class function TRecolectaDatos.BooleanToByte(ABool: Boolean): Byte;
var
   resultado : byte;
begin
   if ABool then
      resultado := 1
   else
      resultado := 0;

   Result := resultado;
end;



class function TRecolectaDatos.delString(cadena: string): string;
var
   resultado   : string;
   ini, ter    : integer;
begin
   if cadena <> '' then
   begin
   resultado := cadena;

   ini := Length(resultado) - Length(FormatDateTime( 'DD_MM_YYYY', Now));
   ter := Length(resultado);
   Delete(resultado,ini,ter);

   end
   else resultado := 'XXXXX';

   Result := resultado;
end;

class function TRecolectaDatos.generaQuery(aOpcion : TTipoCosulta; aFechaIni, aFechaTer : string): String;
var
   resultado : string;
   qryOpcion : string;
begin
   if aOpcion = atDelDia then
      qryOpcion := strQueryDelDia
   else if aOpcion = atOtroDia then
      qryOpcion := strQueryOtroDia;

   resultado := Format(qryOpcion, [aFechaIni, aFechaTer]);

   Result := resultado;
end;

class procedure TRecolectaDatos.Recoleccion(aFechaEjec, aCveDoc : String;
  aGrupo, aNomApli : String; aExito: Integer; aAPli: TInterApli);
var
   cssRedigitaliza : TRedigitaliza;
begin
   cssRedigitaliza := TRedigitaliza.create(aAPli);
   with cssRedigitaliza do
   begin
      FechaEjec   := aFechaEjec;
      CveDoc      := aCveDoc;
      Grupo       := aGrupo;
      NomApli     := aNomApli;
      Exito       := aExito;
      AddDigitaliza;
   end;
end;


class procedure TRecolectaDatos.upDigitalizacion(aFechaEjec,
  aCveDoc: String; aAPli: TInterApli);
var
   cssRedigitaliza : TRedigitaliza;
begin
   cssRedigitaliza := TRedigitaliza.create(aAPli);
   with cssRedigitaliza do
   begin
      FechaEjec   := aFechaEjec;
      Seccion      := aCveDoc;
      upDigitaliza;
   end;
end;

end.
