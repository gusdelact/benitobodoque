unit InterFun;
//-------------------------------------------------------------
// Sistema         :   InterFun
// Date            :   Julio de 1997
// Fecha de Inicio :   Julio de 1997
// Función forma   :   Control de Funciones
// Desarrollo por  :   Víctor Martínez Castro
// Comentarios     :   Aplicacion Seguridades Nivel 2
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Wwdbedit, Wwdbigrd, Wwdbgrid, DB, Wwdatsrc, StdCtrls,dbTables,
  Buttons, InterApl, unSQL2;


//Type
//  TOnBotonEvent = Procedure (Sender : TObject) of Object;

type
  TInterFun= class(TComponent)
  private
    { Private declarations }
    FFuncion:String;
    FApli   :TInterapli;
    FConsultar:Boolean;
    FNuevo:Boolean;
    FModificar:Boolean;
    FEliminar:Boolean;
    FCatalogo:Boolean;
    FBloqueado:Boolean;
    FHorario :Boolean;
    FWarning:Boolean;
    FMinTime:TDateTime;
    FMaxTime:TDateTime;
    FFunPadre:TInterFun;
    FSinApli:Boolean;
    FApliName:String;
    FCvePerfil:Integer;
    FDataBaseName:String;
    FSessionName:String;
    FValidaFrame:Boolean;
  protected
    { Protected declarations }
   Procedure Setfuncion(S:String);
   Procedure SetValidaFrame(B:Boolean);
   procedure Notification( AComponent : TComponent; Operation : TOperation ); override;
   //Procedure SetFApli(S:String);
  public
    { Public declarations }
    IsCheckSecu:Boolean;
    Function GetMsgError:String;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
   //Procedure FOnNuevo;
    Property MinTime:TDateTime read FMinTime Write FMinTime;
    Property MaxTime:TDateTime read FMaxTime Write FMaxTime;
    Property Consultar:Boolean Read FConsultar Write FConsultar;

    Property Nuevo:Boolean Read FNuevo Write FNuevo;
    Property Modificar:Boolean Read FModificar Write FModificar;
    Property Eliminar:Boolean Read FEliminar Write FEliminar;
    Property Warning:Boolean Read FWarning Write FWarning;
    Property Horario:Boolean Read FHorario Write FHorario;
    Property Catalogo:Boolean Read FCatalogo Write FCatalogo Default False;
    Property Bloqueado:Boolean Read FBloqueado Write FBloqueado;
    Property ValidaFrame:Boolean Read FValidaFrame Write SetValidaFrame;
    Function ValidaAccesoEsp(pApli:TInterApli; pTipoAcc:String; pMensaje:Boolean; pBitacora:Boolean): Boolean;
  published
    { Published declarations }
    Property  Funcion:String read FFuncion Write SetFuncion;
    Property  Apli:TInterApli Read FApli Write FApli;
    Function  TieneAcceso:Boolean;
    Procedure InternalConnect(ApliName:String; CvePerfil:Integer; DataBaseName:String; SessionName:String);
    Procedure InternalCheckAccess(eApliName, eCvePerfil,Funcion:String; Var FBloqueado,FConsultar,FNuevo,FModificar,FEliminar,FCatalogo:Boolean);
    Function  ChecaAcceso(Muestra:Boolean):Boolean;

  end;

procedure Register;

Const SeguSTP:TStoredProc=nil;
Const SemaforoSeguSTP:Boolean=False;
Const SeguQuery:Boolean=False;


implementation

Uses UnGene;

{$R *.DCR}



procedure Register;
begin RegisterComponents('Inter', [TInterFun]);
end;

Procedure TInterFun.InternalConnect(ApliName:String; CvePerfil:Integer; DataBaseName:String; SessionName:String);
begin FSessionName:=SessionName;
      FDataBaseName:=DataBaseName;
      FApliName:=ApliName;
      FCvePerfil:=CvePerfil;
      FSinApli:=True;
end;


function TInterFun.ValidaAccesoEsp(pApli:TInterApli; pTipoAcc:String; pMensaje:Boolean; pBitacora:Boolean): Boolean;
Var sp         : TStoredProc;
    vlCodResp  : Integer;
begin ValidaAccesoEsp:=False;
      
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
       sp.Params.CreateParam(ftString, 'PBGENBIT',        ptInput);
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

Procedure TInterFun.Setfuncion(S:String);
begin FFuncion:=UpperCase(S);
end;

Procedure TInterFun.SetValidaFrame(B:Boolean);
begin FValidaFrame:=B;
      if FValidaFrame then
      begin FConsultar :=True;
            FNuevo     :=True;
            FModificar :=True;
            FEliminar  :=True;
            FCatalogo  :=True;
            FBloqueado :=False;
            FHorario   :=False;
            FWarning   :=False;
      end;
end;

procedure TInterFun.Notification( AComponent : TComponent; Operation : TOperation);
begin
  inherited Notification( AComponent, Operation );
    if ( Operation = opRemove ) and ( AComponent = FApli )
       then FApli:= nil;
    if ( Operation = opRemove ) and ( AComponent = FFunPadre)
       then FFunPadre:=Nil;
  { If FDataset gets removed, clear the reference to avoid GPF! }
end;

constructor TInterFun.Create( AOwner : TComponent );
begin
  inherited Create( AOwner );
 // if Owner is TForm then begin Forma:=TForm(AOwner); end;
    IsCheckSecu:=True;
    Funcion:='';
    FApli:=Nil;
    FFunPadre:=Nil;
    FSinApli:=False;
    FApliName:='';
    FCvePerfil:=0;
    FCatalogo:=True;
    FValidaFrame:=False;
end;

destructor TInterFun.Destroy;
begin inherited Destroy;
end;

Function TInterFun.ChecaAcceso(Muestra:Boolean):Boolean;
var Hora:TDateTime;
    //Msg:string;
begin if Not IsCheckSecu
      then begin FBloqueado:=False;
                 FConsultar:=True;
                 FNuevo:=True;
                 FModificar:=True;
                 FEliminar:=True;
                 FCatalogo:=True;
                 ChecaAcceso:=True;
                 Exit;
           end;
      //ChecaAcceso:=False;
      if FSinApli
         then InternalCheckAccess(FApliName, IntToStr(FCvePerfil), Funcion, FBloqueado,FConsultar,FNuevo,FModificar,FEliminar,FCatalogo)
         else begin if Apli=Nil then begin ChecaAcceso:=True; exit; end;
                    FDataBaseName:=Apli.SeguDataBaseName;
                    FSessionName:=Apli.SeguSessionName;
                    InternalCheckAccess(Apli.Apli, IntToStr(Apli.CvePerfil),Funcion,FBloqueado,FConsultar,FNuevo,FModificar,FEliminar,FCatalogo);
                    //Apli.CheckAccess(Funcion,FBloqueado,FConsultar,FNuevo,FModificar,FEliminar,FCatalogo, FWarning,FHorario,FMinTime,FMaxTime);
              end;
if SeguQuery then
begin if (Consultar)and(Not Bloqueado)
        then begin if (Horario) or (Warning) then
                   begin Hora:=Frac(GetSysDateTime(FDataBaseName,FSessionName));
                         if Horario then
                         begin ChecaAcceso:=((Hora>=FMinTime) and (Hora<=FMaxTime));
                               InterMsg(tmInformacion,'',0,'No se encuentra en Horario para Realizar la Operación. Verifique con su Administrador');
                               Exit;
                         end;
                         //Warning
                         if Not ((Hora>=FMinTime) and (Hora<=FMaxTime))
                         then InterMsg(tmInformacion,'',0,'Advertencia. Se encuentra fuera del Horario para Realizar la Operación. Verifique con su Administrador');
                   end;
                   ChecaAcceso:=True
             end
        else begin ChecaAcceso:=False;
                   if Not Consultar then
                      begin if Muestra then InterMsg(tmInformacion,'',0,'No tiene derechos para consultar esta función. Verifique con su Administrador');
                      end
                 else begin if Muestra then InterMsg(tmInformacion,'',0,'Esta función se encuentra Bloqueada. Verifique con su Administrador o Intente mas Tarde.');
                      end;
             end;
end
else begin
        if (Consultar)and(Not Bloqueado)
        then begin if Warning then InterMsg(tmInformacion,'',0,GetMsgError);
                   ChecaAcceso:=True;
             end
        else begin ChecaAcceso:=False;
                   if Muestra then InterMsg(tmInformacion,'',0,GetMsgError);
             end;
     end;

end;

Function TInterFun.GetMsgError:String;
var Msg:String;
begin Msg:='';
      GetMsgError:='';
      if (Consultar)and(Not Bloqueado)
      then begin if Warning then GetMsgError:='Aviso!! Esta fuera del Horario para Realizar la Operación.';
           end
      else begin if Horario then Msg:=Msg+'Esta fuera del Horario para Realizar la Operación.'+#13+#10;
                 if Bloqueado then Msg:=Msg+'El Acceso está Bloqueado para realizar esta Operación.'+#13+#10;
                 if Not Consultar then Msg:=Msg+'Acceso Bloqueado. No tiene Derechos de Consulta.'+#13+#10;
                 Msg:=Msg+'Verifique con su Administrador o Intente más Tarde.';
                 GetMsgError:=Msg;
           end;
end;



Function TInterFun.TieneAcceso:Boolean;
begin if ValidaFrame
      then TieneAcceso:=True
      else TieneAcceso:=ChecaAcceso(True);
end;

Procedure TInterFun.InternalCheckAccess(eApliName, eCvePerfil,Funcion:String; Var FBloqueado,FConsultar,FNuevo,FModificar,FEliminar,FCatalogo:Boolean);
Var //Q2:TStoredProc;
    Q1:TQuery;
    S:String;
    //STP:TStoredProc;
begin
     FBloqueado:=True;  FConsultar:=False;
                         FNuevo:=False;
                         FModificar:=False;
                         FEliminar:=False;
                         FCatalogo:=False;
      if Trim(Funcion)='' then exit;

if Not SeguQuery then
begin if SeguSTP=nil then begin SeguSTP:=TStoredProc.Create(nil);
                                SeguSTP.StoredProcName:='STPSECUACCESO';
                                SeguSTP.Params.CreateParam( ftString,'PCVE_APLICACION',ptinput);
                                SeguSTP.Params.CreateParam( ftFloat,'PID_GPO_ACCESO',ptinput);
                                SeguSTP.Params.CreateParam( ftString,'PCVE_FUNCION',ptinput);
                                SeguSTP.Params.CreateParam( ftString,'PRESULTADO',ptOutput);
                          end;

      While SemaforoSeguSTP do
        Application.ProcessMessages;
      Try
      SemaforoSeguSTP:=True;
      SeguSTP.DataBaseName:=FDataBaseName;
      SeguSTP.SessionName:=FSessionName;
      SeguSTP.ParamByName('PCVE_APLICACION').AsString:=eApliName;
      SeguSTP.ParamByName('PCVE_FUNCION').AsString:=Funcion;
      SeguSTP.ParamByName('PID_GPO_ACCESO').AsString:=eCvePerfil;
      SeguSTP.ExecProc;
      S:=SeguSTP.ParamByName('PRESULTADO').AsString;
      Finally SemaforoSeguSTP:=False;
      end;


//    pB_ACC_MODIF  || pB_ACC_CATA  || pB_WARNING  || pB_HORARIO;

      FBloqueado:=(Copy(S,1,1)='V');
      FNuevo    :=(Copy(S,2,1)='V');
      FEliminar :=(Copy(S,3,1)='V');
      FConsultar:=(Copy(S,4,1)='V');
      FModificar:=(Copy(S,5,1)='V');
      FCatalogo :=(Copy(S,6,1)='V');
      FWarning  :=(Copy(S,7,1)='V');
      FHorario  :=(Copy(S,8,1)='V');

  end
else begin
      Q1:=TQuery.Create(nil);
      Q1.DataBaseName:=FDataBaseName;
      Q1.SessionName:=FSessionName;
      Try
      Q1.SQL.Clear;
      Q1.SQL.ADD(' SELECT SECU_FUN_AUT_GPO.B_BLOQUEADO, ');
      Q1.SQL.ADD('        SECU_FUNCION.CVE_FUNCION, ');
      Q1.SQL.ADD('        SECU_FUNCION.B_BLOQUEADO AS B_FUN, ');
      Q1.SQL.ADD('        SECU_APLICACION.B_BLOQUEADO AS B_APLI, ');
      Q1.SQL.ADD('        SECU_FUN_AUT_GPO.B_ACC_ALTA, ');
      Q1.SQL.ADD('        SECU_FUN_AUT_GPO.B_ACC_BAJA, ');
      Q1.SQL.ADD('        SECU_FUN_AUT_GPO.B_ACC_MODIF, ');
      Q1.SQL.ADD('        SECU_FUN_AUT_GPO.B_ACC_CONS, ');
      Q1.SQL.ADD('        SECU_FUN_AUT_GPO.B_ACC_CATA, ');
      Q1.SQL.ADD('        SECU_FUN_AUT_GPO.B_HORARIO, ');
      Q1.SQL.ADD('        SECU_FUN_AUT_GPO.B_WARNING, ');
      Q1.SQL.ADD('        SECU_FUN_AUT_GPO.H_MAXIMA_EJEC, ');
      Q1.SQL.ADD('        SECU_FUN_AUT_GPO.H_MINIMA_EJEC ');
      Q1.SQL.ADD(' FROM SECU_FUN_AUT_GPO, ');
      Q1.SQL.ADD('     SECU_FUNCION,');
      Q1.SQL.ADD('     SECU_APLICACION ');
      Q1.SQL.ADD(' WHERE (SECU_FUN_AUT_GPO.CVE_APLICACION='+#39+eApliName+#39+') AND ');
      Q1.SQL.ADD(' (SECU_FUN_AUT_GPO.CVE_FUNCION='+#39+Funcion+#39+') AND ');
      Q1.SQL.ADD(' (SECU_FUN_AUT_GPO.ID_GPO_ACCESO='+eCvePerfil+') AND ');
      Q1.SQL.ADD(' (SECU_APLICACION.CVE_APLICACION=SECU_FUN_AUT_GPO.CVE_APLICACION) AND ');
      Q1.SQL.ADD(' (SECU_FUNCION.CVE_FUNCION=SECU_FUN_AUT_GPO.CVE_FUNCION)');
      Q1.Open;
      if Not ((Q1.BOF) and (Q1.EOF)) then
      begin FBloqueado:=(Trim(Q1.FieldByName('B_BLOQUEADO').AsString)='V')
                                  or  (Trim(Q1.FieldByName('B_FUN').AsString)='V')
                                  or  (Trim(Q1.FieldByName('B_APLI').AsString)='V');
            FConsultar:=(Trim(Q1.FieldByName('B_ACC_CONS').AsString)='V');
            FNuevo:=(Trim(Q1.FieldByName('B_ACC_ALTA').AsString)='V');
            FModificar:=(Trim(Q1.FieldByName('B_ACC_MODIF').AsString)='V');
            FEliminar:=(Trim(Q1.FieldByName('B_ACC_BAJA').AsString)='V');
            FHorario:=(Trim(Q1.FieldByName('B_HORARIO').AsString)='V');
            FCatalogo:=(Trim(Q1.FieldByName('B_ACC_CATA').AsString)='V');
            FWarning:=(Trim(Q1.FieldByName('B_WARNING').AsString)='V');
            FMinTime:=DameHorario(Trim(Q1.FieldByName('H_MINIMA_EJEC').AsString));
            FMaxTime:=DameHorario(Trim(Q1.FieldByName('H_MAXIMA_EJEC').AsString));
      end;
      Finally Q1.Free;
      end;

end;

end;


end.
*
Procedure TInterFun.InternalCheckAccess(eApliName, eCvePerfil,Funcion:String; Var FBloqueado,FConsultar,FNuevo,FModificar,FEliminar,FCatalogo:Boolean);
Var Q2:TStoredProc;
    //STP:TStoredProc;
begin FBloqueado:=True;    FConsultar:=False;   FNuevo:=False;
      FModificar:=False;   FEliminar:=False;
      FCatalogo:=True;
      if Trim(Funcion)='' then exit;
      STP:=TStoredProc.Create(nil);
      //Q2:=TQuery.Create(Nil);
      Try
      Q2.DataBaseName:=FDataBaseName;
      Q2.SessionName:=FSessionName;
      Q2.SQL.Clear;
      Q2.SQL.ADD(' SELECT SECU_FUN_AUT_GPO.B_BLOQUEADO, ');
      Q2.SQL.ADD('        SECU_FUNCION.CVE_FUNCION, ');
      Q2.SQL.ADD('        SECU_FUNCION.B_BLOQUEADO AS B_FUN, ');
      Q2.SQL.ADD('        SECU_APLICACION.B_BLOQUEADO AS B_APLI, ');
      Q2.SQL.ADD('        SECU_FUN_AUT_GPO.B_ACC_ALTA, ');
      Q2.SQL.ADD('        SECU_FUN_AUT_GPO.B_ACC_BAJA, ');
      Q2.SQL.ADD('        SECU_FUN_AUT_GPO.B_ACC_MODIF, ');
      Q2.SQL.ADD('        SECU_FUN_AUT_GPO.B_ACC_CONS, ');
      Q2.SQL.ADD('        SECU_FUN_AUT_GPO.B_ACC_CATA, ');
      Q2.SQL.ADD('        SECU_FUN_AUT_GPO.B_HORARIO, ');
      Q2.SQL.ADD('        SECU_FUN_AUT_GPO.B_WARNING, ');
      Q2.SQL.ADD('        SECU_FUN_AUT_GPO.H_MAXIMA_EJEC, ');
      Q2.SQL.ADD('        SECU_FUN_AUT_GPO.H_MINIMA_EJEC ');
      Q2.SQL.ADD(' FROM SECU_FUN_AUT_GPO, ');
      Q2.SQL.ADD('     SECU_FUNCION,');
      Q2.SQL.ADD('     SECU_APLICACION,');
      Q2.SQL.ADD('     SECU_APL_FUN');
      Q2.SQL.ADD(' WHERE (SECU_FUN_AUT_GPO.CVE_APLICACION='+#39+eApliName+#39+') AND ');
      Q2.SQL.ADD(' (SECU_FUN_AUT_GPO.CVE_FUNCION='+#39+Funcion+#39+') AND ');
      Q2.SQL.ADD(' (SECU_FUN_AUT_GPO.ID_GPO_ACCESO='+eCvePerfil+') AND ');
      Q2.SQL.ADD(' (SECU_APL_FUN.CVE_APLICACION=SECU_FUN_AUT_GPO.CVE_APLICACION) AND ');
      Q2.SQL.ADD(' (SECU_APL_FUN.CVE_FUNCION=SECU_FUN_AUT_GPO.CVE_FUNCION) AND ');
      Q2.SQL.ADD(' (SECU_APLICACION.CVE_APLICACION=SECU_FUN_AUT_GPO.CVE_APLICACION) AND ');
      Q2.SQL.ADD(' (SECU_FUNCION.CVE_FUNCION=SECU_FUN_AUT_GPO.CVE_FUNCION)');
      Q2.Open;
      if Not ((Q2.BOF) and (Q2.EOF)) then
      begin FBloqueado:=(Trim(Q2.FieldByName('B_BLOQUEADO').AsString)='V')
                                  or  (Trim(Q2.FieldByName('B_FUN').AsString)='V')
                                  or  (Trim(Q2.FieldByName('B_APLI').AsString)='V');
            FConsultar:=(Trim(Q2.FieldByName('B_ACC_CONS').AsString)='V');
            FNuevo:=(Trim(Q2.FieldByName('B_ACC_ALTA').AsString)='V');
            FModificar:=(Trim(Q2.FieldByName('B_ACC_MODIF').AsString)='V');
            FEliminar:=(Trim(Q2.FieldByName('B_ACC_BAJA').AsString)='V');
            FHorario:=(Trim(Q2.FieldByName('B_HORARIO').AsString)='V');
            FCatalogo:=(Trim(Q2.FieldByName('B_ACC_CATA').AsString)='V');
            FWarning:=(Trim(Q2.FieldByName('B_WARNING').AsString)='V');
            FMinTime:=DameHorario(Trim(Q2.FieldByName('H_MINIMA_EJEC').AsString));
            FMaxTime:=DameHorario(Trim(Q2.FieldByName('H_MAXIMA_EJEC').AsString));
      end;
      Finally Q2.Free;
      end;
end;

end.




