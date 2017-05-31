// Sistema         : Clase de CRCIERRE
// Fecha de Inicio : 09/12/2003
// Función forma   : Clase de CRCIERRE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     : 
// Modificaciones  : 27 JUN 2005. Se implementa fecha de apertura por empresa

Unit IntCrApert;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

InterProcesos,
IntParamCre,
IntGenCre,
uEnviaMsg,
IntMensaje,IntMsgConfirm
;

CONST
     NOMPAKAGE = 'PKGCREDITOCIERRE';

Type
 TCrApert = class;

  TWCrApert=Class(TForm)
    InterForma1             : TInterForma;
    InterProcesos1: TInterProcesos;
    bbApertura: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edFECHA_APERTURA: TEdit;
    Label1: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterProcesos1GeneraProceso(Sender: TObject;
      PPCveProceso: String; PPNumSecuencia: Integer; PPCveProcesoRel,
      PPCveFuncion: String; PPDigitaliza: Boolean; var PPComenta: String;
      var PPTodoOk: Boolean);
    procedure bbAperturaClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterProcesos1DespuesProceso(Sender: TObject);
    private
    { Private declarations }
        vcUltErr       : String;
        vcErrCritico   : Boolean;
        vgActiva       : Boolean;

        Function ObtenFSiguienteApert :  TDateTime;
    public
    { Public declarations }
    Objeto : TCrApert;
end;
 TCrApert= class(TInterFrame)
      private
        Function  CalcTasaLibor(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  CalcTasaTiie(pFecha : TDateTime; var PPResultado: String) : Boolean;
        //<LOLS 17 FEB 2006 CALCULO DE TASAS FARAC>
        Function  CalcTasaFarac(pFecha : TDateTime; var PPResultado: String) : Boolean;
        //</LOLS>
        //<LOLS 17 NOV 2006 CALCULO DE TASAS FARAC>
        Function  AutDispInet(pFecha : TDateTime; var PPResultado: String) : Boolean;
        //</LOLS>
        procedure EnviaError( Error : String  );
        function  ActualizaFechaApert(pFecha : TDateTime; var PPResultado: String) : Boolean;

      protected
      public
        { Public declarations }

        ParamCre        : TParamCre;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrApert.Create( AOwner : TComponent );
begin Inherited;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrApert.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrApert.Destroy;
begin inherited;
end;


function TCrApert.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrApert;
begin
   W:=TWCrApert.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

{--------------------------------------------------------------------------------------------------------------------
                        CALCULO DE TASA LIBOR1-2
--------------------------------------------------------------------------------------------------------------------}
Function TCrApert.CalcTasaLibor(pFecha : TDateTime; var PPResultado: String) : Boolean;
var  STPCalLibor  : TStoredProc;
     vlResultado  : Boolean;
Begin
     vlResultado:= True;
     STPCalLibor := TStoredProc.Create(Nil);
     try
        with STPCalLibor do
        begin
          DatabaseName:= Apli.DatabaseName;
          SessionName:= Apli.SessionName;
          StoredProcName:= NOMPAKAGE + '.STPLIBOR1_2';
          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftDate,'PEFCALCULO',ptInput);
          Params.CreateParam(ftString,'PECVEUSUARIO',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          //
          ParamByName('peFCalculo').AsDateTime := pFecha;
          ParamByName('peCveUsuario').AsString := Apli.Usuario;
          ExecProc;

          if (ParamByName('PSResultado').AsInteger <> 0) then
          Begin
             PPResultado := 'Error No ' + ParamByName('psRESULTADO').AsString + ': '
                                        + ParamByName('PSTXRESULTADO').AsString;
             vlResultado:= False;
          end;
        end;
     finally
          STPCalLibor.Free;
     end;
     CalcTasaLibor := vlResultado;
end;
{--------------------------------------------------------------------------------------------------------------------
                                     CALCULA TASA TIIEESP
--------------------------------------------------------------------------------------------------------------------}
function TCrApert.CalcTasaTiie(pFecha : TDateTime; var PPResultado: String): Boolean;
var  STPCalTiie  : TStoredProc;
     vlResultado  : Boolean;
Begin
     vlResultado:= True;
     STPCalTiie := TStoredProc.Create(Nil);
     try
        with STPCalTiie do
        begin
          DatabaseName:= Apli.DatabaseName;
          SessionName:= Apli.SessionName;
          StoredProcName:= NOMPAKAGE + '.STPTIIEESP';
          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftDate,'PEFCALCULO',ptInput);
          Params.CreateParam(ftString,'PECVEUSUARIO',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          //
          ParamByName('peFCalculo').AsDateTime := pFecha;
          ParamByName('peCveUsuario').AsString := Apli.Usuario;
          ExecProc;

          if (ParamByName('PSResultado').AsInteger <> 0) then
          Begin
             PPResultado := 'Error No ' + ParamByName('psRESULTADO').AsString + ': ' 
                                        + ParamByName('PSTXRESULTADO').AsString;
             vlResultado:= False;
          end;
        end;
     finally
          STPCalTiie.Free;
     end;
     CalcTasaTiie := vlResultado;
end;
{--------------------------------------------------------------------------------------------------------------------
                                     CALCULA TASA FARAC
--------------------------------------------------------------------------------------------------------------------}
//<LOLS 17 FEB 2006 CALCULO DE TASAS FARAC>
function TCrApert.CalcTasaFarac(pFecha: TDateTime;  var PPResultado: String): Boolean;
var  STPCalFarac  : TStoredProc;
Begin
     Result      := True;
     STPCalFarac := TStoredProc.Create(Nil);
     try
        with STPCalFarac do
        begin
          DatabaseName:= Apli.DatabaseName;
          SessionName:= Apli.SessionName;
          StoredProcName:= 'PKGCREDITOCIERRE.STPCALCULATFARAC';
          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftDate,   'PEFCALCULO',    ptInput  );
          Params.CreateParam(ftString, 'PECVEUSUARIO',  ptInput  );
          Params.CreateParam(ftString, 'PEBGRABATASA',  ptInput  );
          Params.CreateParam(ftString, 'PEBCOMMIT',     ptInput  );
          Params.CreateParam(ftFloat,  'PSVALORTASA',   ptOutput );
          Params.CreateParam(ftFloat,  'PSRESULTADO',   ptOutput );
          Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput );
          //
          ParamByName('PEFCALCULO').AsDateTime := pFecha;
          ParamByName('PECVEUSUARIO').AsString := Apli.Usuario;
          ParamByName('PEBGRABATASA').AsString := 'V';
          ParamByName('PEBCOMMIT').AsString    := 'V';
          //
          ExecProc;
          //
          if (ParamByName('PSResultado').AsInteger <> 0) then
          Begin
             PPResultado := 'Error No ' + ParamByName('PSRESULTADO').AsString + ': '
                                        + ParamByName('PSTXRESULTADO').AsString;
             Result  := False;
          end;
        end;
     finally
          STPCalFarac.Free;
     end;
end;
//</LOLS>

//<LOLS 17 NOV 2006 CALCULO DE TASAS FARAC>
function TCrApert.AutDispInet(pFecha: TDateTime; var PPResultado: String): Boolean;
var  STPDispMdInet  : TStoredProc;
Begin
     Result      := True;
     STPDispMdInet := TStoredProc.Create(Nil);
     try
        with STPDispMdInet do
        begin
          DatabaseName:= Apli.DatabaseName;
          SessionName:= Apli.SessionName;
          StoredProcName:= 'PKGCRCIERRE.STPAUTDISPMDINET';
          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftFloat,  'peIdEmpresa',    ptInput  );
          Params.CreateParam(ftDate,   'peFApertura',    ptInput  );
          Params.CreateParam(ftFloat,  'peIdCredito',    ptInput  );
          Params.CreateParam(ftString, 'peCveUsuAut',    ptInput  );
          Params.CreateParam(ftString, 'peBCommit',      ptInput  );
          Params.CreateParam(ftFloat,  'psResultado',    ptOutput );
          Params.CreateParam(ftString, 'psTxResultado',  ptOutput );


          ParamByName('peIdEmpresa').AsInteger := Apli.IdEmpresa;
          ParamByName('peFApertura').AsDate    := pFecha;
          ParamByName('peIdCredito').Clear;
          ParamByName('peCveUsuAut').AsString  := Apli.Usuario;
          ParamByName('peBCommit').AsString    := 'V'; 
          ParamByName('psResultado').Clear;
          ParamByName('psTxResultado').Clear;
          //
          ExecProc;
          //
          if (ParamByName('psResultado').AsInteger <> 0) then
          Begin
             PPResultado := 'Error No ' + ParamByName('psResultado').AsString + ': '
                                        + ParamByName('psTxResultado').AsString;
             Result  := False;
          end;
        end;
     finally
          STPDispMdInet.Free;
     end;
end;
//</LOLS>
{--------------------------------------------------------------------------------------------------------------------
Actualiza Fecha de Apertura en CR_PARAMETRO, este update se tuvo que hacer en elphi y no en PL, por el desarrollo del
prodcuto de agronegocios, pero al termino de este se pasará a PL.
--------------------------------------------------------------------------------------------------------------------}
function TCrApert.ActualizaFechaApert(pFecha: TDateTime;
  var PPResultado: String): Boolean;
var vlResultado : Boolean;
    vlSql       : String;
    vlFechaAct  : String;
begin
   vlResultado := False;
   vlSql       := ' UPDATE CR_PARAM_EMPRESA ' + #13#10 +
                  ' SET    F_APERTURA = '  + SQLFecha(pFecha) + #13#10 +
                  ' WHERE  ID_EMPRESA = '  + IntToStr(Apli.IdEmpresa);
   RunSQL(vlSql,Apli.DataBaseName,Apli.SessionName,False);
   vlSql       := ' SELECT F_APERTURA FROM CR_PARAM_EMPRESA ' + #13#10 +
                  ' WHERE  ID_EMPRESA = '  + IntToStr(Apli.IdEmpresa);
   GetSQLStr( vlSql, Apli.DataBaseName, Apli.SessionName, 'F_APERTURA',
              vlFechaAct, False );

   if pFecha <> StrToDateTime(vlFechaAct) then
   Begin
             PPResultado := 'Error, no se actualizó la fecha de apertura';
             vlResultado:= False;
   end
   else  vlResultado:= True;
   ActualizaFechaApert := vlResultado;
end;

procedure TCrApert.EnviaError(Error: String);
begin
   ProcesaEnvio( Self, 'APERCR', Now, Error, 'V', 'EVENTO', 'V', 'F' );
end;
(***********************************************FORMA CRCIERRE********************)
(*                                                                              *)
(*  FORMA DE CRCIERRE                                                            *)
(*                                                                              *)
(***********************************************FORMA CRCIERRE********************)

procedure TWCrApert.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;


   InterProcesos1.Apli := Objeto.Apli;
   InterProcesos1.Proceso := 'CR_NAPERTURA';
   InterProcesos1.FOpera := ObtenFSiguienteApert;
   if InterProcesos1.FOpera > Objeto.Apli.DameFechaEmpresa then
      InterProcesos1.FOpera := Objeto.Apli.DameFechaEmpresa;

   InterProcesos1.ArmaTree;
   bbApertura.SetFocus;
end;

procedure TWCrApert.FormDestroy(Sender: TObject);
begin
//
end;

procedure TWCrApert.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrApert.InterProcesos1GeneraProceso(Sender: TObject;
  PPCveProceso: String; PPNumSecuencia: Integer; PPCveProcesoRel,
  PPCveFuncion: String; PPDigitaliza: Boolean; var PPComenta: String;
  var PPTodoOk: Boolean);
var TxResultado : String;
    vlFApertura : TDateTime;
    vlMsgErr    : String;

    procedure  MsgError(vlError : String);
    Begin
         PPComenta := vlError;
         vcUltErr := vlError;
         EXECUTE_MUESTRAMENSAJE(vlError);
    end;

begin
     vlFApertura := InterProcesos1.FOpera;
     vcUltErr := '';
     if PPCveFuncion = 'CALTALI' then
     Begin
        PPTodoOk := Objeto.CalcTasaLibor(vlFApertura,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en el cálculo de Tasa LIBOR1-2. '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
     else    if PPCveFuncion = 'CALTATI' then
     Begin
        PPTodoOk := Objeto.CalcTasaTiie(vlFApertura,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en el cálculo de Tasa TIIEESP'+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
     //<LOLS 17 FEB 2006 CALCULO DE TASAS FARAC>
     else if PPCveFuncion = 'CRTASAFARAC' then
     Begin
        PPTodoOk := Objeto.CalcTasaFarac(vlFApertura,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en el cálculo de Tasa FARAC: '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
     //</LOLS>
     //<LOLS 17 NOV 2006 CALCULO DE TASAS FARAC>
     else if PPCveFuncion = 'CRAUTDISPINET' then
     Begin
        PPTodoOk := Objeto.AutDispInet(vlFApertura,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en la autorización de disposiciones INET: '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
     //</LOLS>
     //
     else    if PPCveFuncion = 'ACTFAPERT' then
     Begin
        PPTodoOk := Objeto.ActualizaFechaApert(vlFApertura + 1 ,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas al actualizar la fecha de apertura'+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end;
     InterProcesos1.MuestraConf := False;
end;

procedure TWCrApert.bbAperturaClick(Sender: TObject);
var vlOK          : Boolean;
    vlTxResultado : String;
    nejecuta, i   : Integer;
    vlUltApert    : TDateTime;
    vlMsg         : String;
    vlContinua    : Boolean;
begin
   if Objeto.ValidaAccesoEsp('TCRAPERT_INI',True,True) then
   begin
     nEjecuta := 1;
     vlMsg := '';
     if vgActiva then
     Begin
       if MessageDlg('¿ Desea realizar la A P E R T U R A   D E   C R E D I T O S  ?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       begin
          vlMsg := 'SE REALIZARÁ EL PROCESO DEL DIA ';
          showMessage(vlMsg + DateToStr(InterProcesos1.FOpera));
          InterProcesos1.Interm.Lines.Add(vlMsg + DateToStr(InterProcesos1.FOpera));
          while nEjecuta > 0 do
          Begin
            vcErrCritico     := False;                    { Limpia la bandera de error critico }
            if InterProcesos1.ActivaProcesos then
            Begin
               vlContinua := not vcErrCritico;            {Puede continuar con el proceso      }
               if not vlContinua then                     { Si ocurrio un error en el cierre entonces ... }
               begin
                  Break;                                  { Rompe el ciclo para corregir errores }
               end;//ends_if
               vlUltApert := ObtenFSiguienteApert;
               if validaFecha(vlUltApert, Objeto.Apli) <> 0 then
               Begin
                  nEjecuta:= 1;
                  InterProcesos1.FOpera := vlUltApert;
                  SHOW_MENSAJE(vlMsg + DateToStr(InterProcesos1.FOpera)); {!!!! no quitar¡¡¡¡}
                  InterProcesos1.Interm.Lines.Add(vlMsg + DateToStr(InterProcesos1.FOpera));
                  edFECHA_APERTURA.Text := DateTimeToStr(InterProcesos1.FOpera);
               end
               else
               Begin
                  nEjecuta:= 0;
               end;
            end;
          end;//END while
       end;
     end;
     if not vcErrCritico then
        vgActiva := False;
   end;     
end;


function TWCrApert.ObtenFSiguienteApert: TDateTime;
var vlSql       : String;
    vlResult    : String;
begin
   vlSql := ' SELECT F_APERTURA FROM CR_PARAM_EMPRESA' +
            ' WHERE  ID_EMPRESA = '  + IntToStr(Objeto.Apli.IdEmpresa);
   GetSQLStr(vlSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,'F_APERTURA',vlResult,False);
   ObtenFSiguienteApert := StrToDateTime(vlResult);
end;

procedure TWCrApert.InterForma1DespuesShow(Sender: TObject);
begin
   edFECHA_APERTURA.Text := DateTimeToStr(InterProcesos1.FOpera);
   vgActiva := True;
end;

procedure TWCrApert.InterProcesos1DespuesProceso(Sender: TObject);
begin
  if InterProcesos1.TipoError =  teNoCritico then
     Objeto.EnviaError( 'Continua: '  + vcUltErr );
  //ends_if

  if InterProcesos1.TipoError =  teCritico then
  begin
    Objeto.EnviaError( 'Critico: ' + vcUltErr );
    vcErrCritico := ( InterProcesos1.TipoError = teCritico );
  end;//ends_if
end;





end.
