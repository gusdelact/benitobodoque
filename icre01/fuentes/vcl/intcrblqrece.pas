// Sistema         : Clase de CR_BLQ_RECEP
// Fecha de Inicio : 26/05/2005
// Función forma   : Clase de CR_BLQ_RECEP
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrBlqRece;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit,
  //Unidades Adicionales
  IntParamCre,
  IntCrCredito,
  IntGenCre,
  IntCrCreChe;


Type
 TCrBlqRece= class; 

  TWCrBlqRecep=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_TRN_BLOQUEO : TLabel; 
    edID_TRN_BLOQUEO : TEdit;
    lbID_CREDITO : TLabel; 
    edID_CREDITO : TEdit;
    lbF_OPERACION : TLabel; 
    dtpF_OPERACION : TInterDateTimePicker; 
    edF_OPERACION : TEdit;
    lbIMP_A_BLOQUEAR : TLabel;
    lbF_PROG_DESBLQ : TLabel; 
    dtpF_PROG_DESBLQ : TInterDateTimePicker; 
    edF_PROG_DESBLQ : TEdit;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbSITUACION: TLabel;
    lbSIT_BLQ_RECEP: TLabel;
    btCREDITO: TBitBtn;
    edDESC_CREDITO: TEdit;
    lbCUENTA_BANCO: TLabel;
    edCUENTA_BANCO: TEdit;
    btCtaBanco: TBitBtn;
    edBANCO: TEdit;
    Label3: TLabel;
    edNOMBRE_TITULAR: TEdit;
    GroupBox1: TGroupBox;
    lbIMP_MIN_DEPOSITO: TLabel;
    edSDO_DISPONIBLE: TInterEdit;
    edSDO_COMPROMETIDO: TInterEdit;
    Label1: TLabel;
    edSDO_TOTAL: TInterEdit;
    Label2: TLabel;
    Bevel1: TBevel;
    GroupBox2: TGroupBox;
    lbCVE_USU_ALTA: TLabel;
    edCVE_USU_ALTA: TEdit;
    lbFH_CAPTURA: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    lbH_MODIFICA: TLabel;
    edCVE_USUARIO_MOD: TEdit;
    lbCVE_USUARIO_MOD: TLabel;
    lbCVE_USU_AUTORIZA: TLabel;
    edCVE_USU_AUTORIZA: TEdit;
    lbH_AUTORIZACION: TLabel;
    edF_AUTORIZACION: TEdit;
    lbH_CANCELA: TLabel;
    edF_CANCELA: TEdit;
    lbCVE_USUARIO_CANC: TLabel;
    edCVE_USUARIO_CANC: TEdit;
    ilCREDITO: TInterLinkit;
    edIMP_A_BLOQUEAR: TInterEdit;
    mTX_NOTA: TMemo;
    Label4: TLabel;
    edNUM_PERIODO: TInterEdit;
    Label5: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure btCtaBancoClick(Sender: TObject);
    procedure btCtaBancoExit(Sender: TObject);
    procedure edIMP_A_BLOQUEARExit(Sender: TObject);
    procedure edF_OPERACIONExit(Sender: TObject);
    procedure edF_PROG_DESBLQExit(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edNUM_PERIODOExit(Sender: TObject);
    procedure mTX_NOTAExit(Sender: TObject);
    private 
    { Private declarations }
       Procedure ObtInfCtaBco;
       Function  ImpAblqMax: Double;
    public
    { Public declarations } 
    Objeto : TCrBlqRece;
end; 
 TCrBlqRece= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_TRN_BLOQUEO           : TInterCampo;
        ID_CREDITO               : TInterCampo;
        F_OPERACION              : TInterCampo;
        CUENTA_BANCO             : TInterCampo;
        CVE_TIP_OPERACION        : TInterCampo;
        IMP_A_BLOQUEAR           : TInterCampo;
        F_PROG_DESBLQ            : TInterCampo;
        FOL_BLOQUEO              : TInterCampo;
        ID_TRN_DESLBLQ           : TInterCampo;
        CVE_USU_AUTORIZA         : TInterCampo;
        F_AUTORIZACION           : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USUARIO_CANC         : TInterCampo;
        F_CANCELA                : TInterCampo;
        CVE_USUARIO_MOD          : TInterCampo;
        F_MODIFICA               : TInterCampo;
        SIT_BLQ_RECEP            : TInterCampo;
        SDO_DISPONIBLE           : TInterCampo;
        SDO_COMPROMETIDO         : TInterCampo;
        SDO_TOTAL                : TInterCampo;
        NUM_PERIODO              : TInterCampo;
        TX_NOTA                  : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Disposicion              : TcrCredito;
        Chequera                 : TCrCreChe;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        procedure   CambioSituacion(Sender: TObject);
        Function    InternalPost: Boolean; override;
        Procedure   ObtSaldosChqra(pCuentaBanco: Integer);
        function    AltaOperacion(pIdCredito, pImpABloquear, pNumPeriodo: Double;
                                  pCuentaBanco,pCveTipoOperac,pCveUsuAlta,pTxNota : String;
                                  pFOperacion,pFProgDesblq: TDateTime;
                                  Var pMensaje : String; var pIdTransac : Integer): Boolean; //easa40111 gym07062005
        Procedure   ObtPeriodo(pIdCredito: Integer);

      published
      end;

implementation

{$R *.DFM}


constructor TCrBlqRece.Create( AOwner : TComponent );
begin Inherited;
      ID_TRN_BLOQUEO :=CreaCampo('ID_TRN_BLOQUEO',ftFloat,tsNinguno,tsNinguno,True);
                ID_TRN_BLOQUEO.Caption:='Número de Trn Bloqueo';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      F_OPERACION :=CreaCampo('F_OPERACION',ftDate,tsNinguno,tsNinguno,True);
                F_OPERACION.Caption:='Fecha Operacion';
      CUENTA_BANCO :=CreaCampo('CUENTA_BANCO',ftString,tsNinguno,tsNinguno,True);
                CUENTA_BANCO.Caption:='Cuenta Banco';
      CVE_TIP_OPERACION :=CreaCampo('CVE_TIP_OPERACION',ftString,tsNinguno,tsNinguno,True);
      with CVE_TIP_OPERACION do
      Begin  Size := 2;
             UseCombo := True;
             ComboLista.Add('0');       ComboDatos.Add('BL');
             ComboLista.Add('1');       ComboDatos.Add('DB');
      end;
                CVE_TIP_OPERACION.Caption:='Clave de Tip Operacion';
      IMP_A_BLOQUEAR :=CreaCampo('IMP_A_BLOQUEAR',ftFloat,tsNinguno,tsNinguno,True);
                IMP_A_BLOQUEAR.Caption:='Imp A Bloquear';
      F_PROG_DESBLQ :=CreaCampo('F_PROG_DESBLQ',ftDate,tsNinguno,tsNinguno,True);
                F_PROG_DESBLQ.Caption:='Fecha Prog Desblq';
      FOL_BLOQUEO :=CreaCampo('FOL_BLOQUEO',ftFloat,tsNinguno,tsNinguno,True);
                FOL_BLOQUEO.Caption:='Fol Bloqueo';
      ID_TRN_DESLBLQ :=CreaCampo('ID_TRN_DESLBLQ',ftFloat,tsNinguno,tsNinguno,True);
                ID_TRN_DESLBLQ.Caption:='Número de Trn Deslblq';
      CVE_USU_AUTORIZA :=CreaCampo('CVE_USU_AUTORIZA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_AUTORIZA.Caption:='Clave de Usu Autoriza';
      F_AUTORIZACION :=CreaCampo('F_AUTORIZACION',ftFloat,tsNinguno,tsNinguno,True);
                F_AUTORIZACION.Caption:='F Autorizacion';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USUARIO_CANC :=CreaCampo('CVE_USUARIO_CANC',ftString,tsNinguno,tsNinguno,True);
                CVE_USUARIO_CANC.Caption:='Clave de Usuario Canc';
      F_CANCELA :=CreaCampo('F_CANCELA',ftDate,tsNinguno,tsNinguno,True);
                F_CANCELA.Caption:='F Cancela';
      CVE_USUARIO_MOD :=CreaCampo('CVE_USUARIO_MOD',ftString,tsNinguno,tsNinguno,True);
                CVE_USUARIO_MOD.Caption:='Clave de Usuario Mod';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='F Modifica';
      SIT_BLQ_RECEP :=CreaCampo('SIT_BLQ_RECEP',ftString,tsNinguno,tsNinguno,True);
      With SIT_BLQ_RECEP do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('NO AUTORIZADA');      ComboDatos.Add(CSIT_NA);
            ComboLista.Add('CANCELADA');          ComboDatos.Add(CSIT_CA);
            ComboLista.Add('RECHAZADA');          ComboDatos.Add(CSIT_RE);
            ComboLista.Add('AUTORIZADA');         ComboDatos.Add(CSIT_AU);
      end;
                SIT_BLQ_RECEP.Caption:='Situación Blq Recep';
      SDO_DISPONIBLE :=CreaCampo('SDO_DISPONIBLE',ftFloat,tsNinguno,tsNinguno,False);
      SDO_COMPROMETIDO :=CreaCampo('SDO_COMPROMETIDO',ftFloat,tsNinguno,tsNinguno,False);
      SDO_TOTAL :=CreaCampo('SDO_TOTAL',ftFloat,tsNinguno,tsNinguno,False);
      NUM_PERIODO :=CreaCampo('NUM_PERIODO',ftFloat,tsNinguno,tsNinguno,True);
                NUM_PERIODO.Caption:='Num. Periodo';
      TX_NOTA :=CreaCampo('TX_NOTA',ftString,tsNinguno,tsNinguno,True);
                TX_NOTA.Caption:='Tx. Nota';

      FKeyFields.Add('ID_TRN_BLOQUEO');

      TableName := 'CR_BLQ_RECEP';
      UseQuery := True;
      HelpFile := 'IntCrBlqRece.Hlp';
      ShowMenuReporte:=True;

      Disposicion := TcrCredito.Create(Self);
      Disposicion.MasterSource:=Self;
      Disposicion.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Chequera := TCrCreChe.Create(Self);
      Chequera.MasterSource:=Self;

      SIT_BLQ_RECEP.OnChange := CambioSituacion;

end;

Destructor TCrBlqRece.Destroy;
begin
   if Disposicion  <> nil then
      Disposicion.Free;
   //end if
   if Chequera   <> nil then
      Chequera.Free;
   //end if

   inherited;
end;


function TCrBlqRece.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrBlqRecep;
begin
   W:=TWCrBlqRecep.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrBlqRece.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrBlRe.it','F');
      Try if Active then begin T.Param(0,ID_TRN_BLOQUEO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

procedure TCrBlqRece.CambioSituacion(Sender: TObject);
begin
   //CAMBIA LA SITUACION DEL CREDITO
   If (SIT_BLQ_RECEP.Control<>nil) and (SIT_BLQ_RECEP.Control is TLabel) then
      TLabel(SIT_BLQ_RECEP.Control).Caption:=SIT_BLQ_RECEP.AsCombo;
   //end if
end;
{---------------------------------------------------------------------------------------
                        Alta Orden de Bloqueo
----------------------------------------------------------------------------------------}
function TCrBlqRece.AltaOperacion(pIdCredito, pImpABloquear, pNumPeriodo: Double;
                                  pCuentaBanco,pCveTipoOperac,pCveUsuAlta,pTxNota : String;
                                  pFOperacion,pFProgDesblq: TDateTime;
                                  Var pMensaje : String; var pIdTransac : Integer): Boolean; //easa40111 gym07062005
var     vlResult      : Boolean;
        StpObtOperac  : TStoredProc;
Begin
    vlResult := False;
    StpObtOperac := TStoredProc.Create(Nil);
    try
       with StpObtOperac do
       begin
          StpObtOperac.DatabaseName:= Apli.DatabaseName;
          StpObtOperac.SessionName:= Apli.SessionName;
          StpObtOperac.StoredProcName:='PKGCRSALDOS.STPINSERTOPERBLQ';

          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftDate,'PEFOPERACION',ptInput);
          Params.CreateParam(ftString,'PECUENTABANCO',ptInput);
          Params.CreateParam(ftString,'PECVETIPOOPERAC',ptInput);
          Params.CreateParam(ftString,'PEIMPABLOQUEAR',ptInput);
          Params.CreateParam(ftDate,'PEFPROGDESBLQ',ptInput);
          Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
          Params.CreateParam(ftString,'PETXNOTA',ptInput);
          Params.CreateParam(ftFloat,'PEIDTRNDESBLQ',ptInput);
          Params.CreateParam(ftString,'PECVEUSUALTA',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSIDTRNBLOQUEO',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          ParamByName('peIdCredito').AsFloat := pIdCredito;
          ParamByName('peFOperacion').AsDateTime := pFOperacion;
          ParamByName('peCuentaBanco').AsString := pCuentaBanco;
          ParamByName('peCveTipoOperac').AsString := pCveTipoOperac;
          ParamByName('peImpABloquear').AsFloat := pImpABloquear;
          ParamByName('peFProgDesblq').AsDateTime := pFProgDesblq;
          ParamByName('peNumPeriodo').AsFloat := pNumPeriodo;
          ParamByName('peTxNota').AsString := pTxNota;
          ParamByName('peIdTrnDesblq').AsFloat := 0;
          ParamByName('peCveUsuAlta').AsString := pCveUsuAlta;
          ParamByName('peBCommit').AsString := 'V';
          ExecProc;

          //SI CARGA MANDA EL CREDITO Y Y LA SITUACION DEL MISMO
          if ParamByName('psResultado').AsInteger = 0 then
          begin
             pIdTransac := StpObtOperac.ParamByName('psIdTrnBloqueo').AsInteger;
             vlResult := True;
          end
          else // SI NO REALIZA LA CARGA MANDA ERRORES
          Begin
             pMensaje := 'Error [ ' + ParamByName('psRESULTADO').AsString + '] ' +
                         ParamByName('psTxResultado').AsString;
             GenMsg('Error [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                    ParamByName('psTxResultado').AsString,Apli);
             vlResult := False;
          end;
          UnPrepare;
       end;
    finally
       StpObtOperac.Free;
    end;
    AltaOperacion := vlResult;
end;
//Sobreescribiendo el Internal Post
function TCrBlqRece.InternalPost: Boolean;
Var  vlSalida     : Boolean;
     vlMsg        : String;
     vlIdTranBlq  : Integer;
begin
     InternalPost := False;
     vlSalida := False;
     if Modo=moEdit then
     begin
          Result:=Inherited InternalPost;
          vlSalida := True;
     end;
     if Modo=moAppend then
     begin
        try
           if AltaOperacion(ID_CREDITO.AsFloat, IMP_A_BLOQUEAR.AsFloat,NUM_PERIODO.AsFloat,
                            CUENTA_BANCO.AsString,CVE_TIP_OPERACION.AsString,CVE_USU_ALTA.AsString,TX_NOTA.AsString,
                            F_OPERACION.AsDateTime,F_PROG_DESBLQ.AsDateTime, vlMsg, vlIdTranBlq) then
           Begin
              ID_TRN_BLOQUEO.AsInteger := vlIdTranBlq;
              vlSalida := True;
              ShowMessage('Terminó el Alta de la Operación : ' + ID_TRN_BLOQUEO.AsString);
           end;
        Except
          on e: exception do
          bEGIN
           Beep;Beep;Beep;Beep;
           ShowMessage(' Problemas con el Alta de la Operación: ' + vlMsg
                        + ' . Avise Urgentemente a Sistemas');
           ShowMessage(e.Message);
          end;
         end;
     end;
     InternalPost := VLSalida;
end;
{---------------------------------------------------------------------------------------
                        Obtiene Saldos Chequera
----------------------------------------------------------------------------------------}
procedure TCrBlqRece.ObtSaldosChqra(pCuentaBanco: Integer);
var     StpObtSdoChqra  : TStoredProc;
Begin
    StpObtSdoChqra := TStoredProc.Create(Self);
    try
       with StpObtSdoChqra do
       begin
          StpObtSdoChqra.DatabaseName:= Apli.DatabaseName;
          StpObtSdoChqra.SessionName:= Apli.SessionName;
          StpObtSdoChqra.StoredProcName:='PKGCRSALDOS.STPOBTENSDOSCHQRA';

          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftString,'PEIDCTOLIQ',ptInput);
          Params.CreateParam(ftFloat,'PSSDODISP',ptOutput);
          Params.CreateParam(ftFloat,'PSSDOCOMP',ptOutput);
          Params.CreateParam(ftFloat,'PSSDOTOTAL',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          ParamByName('peIdCtoLiq').AsString := CUENTA_BANCO.AsString;
          ExecProc;

          if ParamByName('psResultado').AsInteger = 0 then
          begin
             //<LOLS 15 MAR 2006.SE OBTIENE EL TIPO DE DATO COMO FLOTANTE>
             SDO_DISPONIBLE.AsFloat := ParamByName('psSdoDisp').AsFloat;
             SDO_COMPROMETIDO.AsFloat := ParamByName('psSdoComp').AsFloat;
             SDO_TOTAL.AsFloat := ParamByName('psSdoTotal').AsFloat;
             //
             //SDO_DISPONIBLE.AsInteger := ParamByName('psSdoDisp').AsInteger;
             //SDO_COMPROMETIDO.AsInteger := ParamByName('psSdoComp').AsInteger;
             //SDO_TOTAL.AsInteger := ParamByName('psSdoTotal').AsInteger;
             //</LOLS>
          end
          else
          Begin
             ShowMessage('Error [ ' + ParamByName('psRESULTADO').AsString + '] ' +
                         ParamByName('psTxResultado').AsString);
             GenMsg('Error [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                    ParamByName('psTxResultado').AsString,Apli);
          end;
          UnPrepare;
       end;
    finally
       StpObtSdoChqra.Free;
    end;
end;

{---------------------------------------------------------------------------------------
                        Obtiene Saldos Chequera
----------------------------------------------------------------------------------------}
procedure TCrBlqRece.ObtPeriodo(pIdCredito: Integer);
var StpObtPeriodo : TStoredProc;
Begin
    StpObtPeriodo := TStoredProc.Create(Self);
    try
       with StpObtPeriodo do
       begin
          StpObtPeriodo.DatabaseName:= Apli.DatabaseName;
          StpObtPeriodo.SessionName:= Apli.SessionName;
          StpObtPeriodo.StoredProcName:='PKGCRSALDOS.OBTFPROXVTO';

          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftString,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftDateTime,'PSFPROXVTO',ptOutput);
          Params.CreateParam(ftFloat,'PSNUMPERIODO',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          ParamByName('peIdCredito').AsInteger := pIdCredito;
          ExecProc;

          if ParamByName('psResultado').AsInteger = 0 then
             NUM_PERIODO.AsInteger := ParamByName('psNumPeriodo').AsInteger
          else
          Begin
             ShowMessage('Error [ ' + ParamByName('psRESULTADO').AsString + '] ' +
                         ParamByName('psTxResultado').AsString);
             GenMsg('Error [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                    ParamByName('psTxResultado').AsString,Apli);
          end;
          UnPrepare;
       end;
    finally
       StpObtPeriodo.Free;
    end;
end;

(***********************************************FORMA CR_BLQ_RECEP********************)
(*                                                                              *)
(*  FORMA DE CR_BLQ_RECEP                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_BLQ_RECEP********************)
function TWCrBlqRecep.ImpAblqMax: Double;
Var vlSql     : String;
    vlImpABlq : String;
begin
   vlSql:= 'SELECT PKGCRSALDOS.StpImpaBlq( ' + Objeto.ID_CREDITO.AsString + ') IMP_A_BLQ FROM DUAL';
   GetSQLStr(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'IMP_A_BLQ',vlImpABlq,False);
   Result:=  StrToFloat(vlImpABlq);
end;

procedure TWCrBlqRecep.FormShow(Sender: TObject);
begin
      //Pinta los datos del panel inferior
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_TRN_BLOQUEO.Control:=edID_TRN_BLOQUEO;
      Objeto.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.F_OPERACION.Control:=edF_OPERACION;
      Objeto.CUENTA_BANCO.Control:=edCUENTA_BANCO;
//      Objeto.CVE_TIP_OPERACION.Control:=rgCVE_TIP_OPERACION;
      Objeto.IMP_A_BLOQUEAR.Control:=edIMP_A_BLOQUEAR;
      Objeto.F_PROG_DESBLQ.Control:=edF_PROG_DESBLQ;
      Objeto.CVE_USU_AUTORIZA.Control:=edCVE_USU_AUTORIZA;
      Objeto.F_AUTORIZACION.Control:=edF_AUTORIZACION;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.F_ALTA.Control:=edF_Alta;
      Objeto.CVE_USUARIO_CANC.Control:=edCVE_USUARIO_CANC;
      Objeto.F_CANCELA.Control:=edF_CANCELA;
      Objeto.CVE_USUARIO_MOD.Control:=edCVE_USUARIO_MOD;
      Objeto.F_MODIFICA.Control:=edF_MODIFICA;
      Objeto.SIT_BLQ_RECEP.Control:= lbSIT_BLQ_RECEP;
      Objeto.SDO_DISPONIBLE.Control := edSDO_DISPONIBLE;
      Objeto.SDO_COMPROMETIDO.Control := edSDO_COMPROMETIDO;
      Objeto.SDO_TOTAL.Control := edSDO_TOTAL;
      Objeto.NUM_PERIODO.Control := edNUM_PERIODO;
      Objeto.TX_NOTA.Control := mTX_NOTA;

      Objeto.Disposicion.ContratoCre.Contrato.TITNombre.Control := edDESC_CREDITO;
      Objeto.Disposicion.GetParams(Objeto);

      Objeto.Chequera.CUENTA_BANCO.Control := edCUENTA_BANCO;
      Objeto.Chequera.Intermediario.Nom_Corto_Interm.Control := edBANCO;
      Objeto.Chequera.GetParams(Objeto);

      InterForma1.MsgPanel := MsgPanel;
end;

procedure TWCrBlqRecep.FormDestroy(Sender: TObject);
begin
      Objeto.ID_TRN_BLOQUEO.Control:=nil;
      Objeto.ID_CREDITO.Control:=nil;
      Objeto.F_OPERACION.Control:=nil;
      Objeto.CUENTA_BANCO.Control:=nil;
//      Objeto.CVE_TIP_OPERACION.Control:=nil;
      Objeto.IMP_A_BLOQUEAR.Control:=nil;
      Objeto.F_PROG_DESBLQ.Control:=nil;
      Objeto.CVE_USU_AUTORIZA.Control:=nil;
      Objeto.F_AUTORIZACION.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USUARIO_CANC.Control:=nil;
      Objeto.F_CANCELA.Control:=nil;
      Objeto.CVE_USUARIO_MOD.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.SIT_BLQ_RECEP.Control:= nil;
      Objeto.SDO_DISPONIBLE.Control := nil;
      Objeto.SDO_COMPROMETIDO.Control := nil;
      Objeto.SDO_TOTAL.Control := nil;
      Objeto.NUM_PERIODO.Control := nil;
      Objeto.TX_NOTA.Control := nil;

      Objeto.Disposicion.ContratoCre.Contrato.TITNombre.Control := nil;
      Objeto.Chequera.CUENTA_BANCO.Control := nil;
      Objeto.Chequera.Intermediario.Nom_Corto_Interm.Control := nil;

      ObtInfCtaBco;
end;

procedure TWCrBlqRecep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrBlqRecep.InterForma1DespuesNuevo(Sender: TObject);
begin
     Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
     Objeto.F_OPERACION.AsDateTime := objeto.Apli.DameFechaEmpresa;
     Objeto.F_PROG_DESBLQ.AsDateTime := objeto.Apli.DameFechaEmpresa;
//     rgCVE_TIP_OPERACION.ItemIndex := 0;
     Objeto.CVE_TIP_OPERACION.AsString := 'BL';
     edID_CREDITO.SetFocus;
end;

procedure TWCrBlqRecep.InterForma1DespuesModificar(Sender: TObject);
begin
      Objeto.CVE_USUARIO_MOD.AsString := Objeto.Apli.Usuario;
      Objeto.F_MODIFICA.AsDateTime    := Objeto.Apli.DameFechaEmpresa;
      edID_CREDITO.SetFocus;
end;

procedure TWCrBlqRecep.btCREDITOClick(Sender: TObject);
begin
   Objeto.Disposicion.ShowAll := True;
   if Objeto.Disposicion.Busca then
       InterForma1.NextTab(edID_CREDITO);
   //end if;
end;

procedure TWCrBlqRecep.ilCREDITOEjecuta(Sender: TObject);
begin
   if Objeto.Disposicion.FindKey([ilCREDITO.Buffer]) then
       InterForma1.NextTab(edID_CREDITO);
   //end if;
end;

procedure TWCrBlqRecep.edID_CREDITOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
     vlSql     : String;
     vlImpABlq : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg   := CNULL;
      vlSalida := True;
      Objeto.ID_CREDITO.GetFromControl;
      if Objeto.ID_CREDITO.AsString = CNULL then
      Begin
         vlSalida  := False;
         vlMsg    := 'Favor de Indicar el número de Disposición';
      end;
      Objeto.Chequera.BuscaWhereString := '     CR_CRED_CHEQ.SIT_CHEQUERA  = ''AC''' +
                                          ' AND CR_CRED_CHEQ.CVE_TIPO_CHEQ = ''AD''' +
                                          ' AND CR_CRED_CHEQ.ID_CREDITO    = ' + Objeto.ID_CREDITO.AsString+
                                          ' AND CR_CRED_CHEQ.CUENTA_BANCO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE SIT_CONTRATO =''AC'' )';
      Objeto.Chequera.FilterString := Objeto.Chequera.BuscaWhereString;
      vlSql:= 'SELECT NVL(PKGCRSALDOS.ObtImporteVto(' + Objeto.ID_CREDITO.AsString + ',1 ),0) IMPORTE FROM DUAL';
      GetSQLStr(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'IMPORTxE',vlImpABlq,False);
      edIMP_A_BLOQUEAR.Text := vlImpABlq;
      Objeto.ObtPeriodo(objeto.ID_CREDITO.AsInteger);
      InterForma1.ValidaExit(edID_CREDITO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrBlqRecep.btCtaBancoClick(Sender: TObject);
begin
   Objeto.Chequera.ShowAll := True;
   if Objeto.Chequera.Busca then
       InterForma1.NextTab(btCtaBanco);
   //end if;
end;

procedure TWCrBlqRecep.btCtaBancoExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg    :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CUENTA_BANCO.GetFromControl;
      if Objeto.CUENTA_BANCO.AsString = CNULL then
      Begin
         vlSalida := False;
         vlMsg    := 'Favor de Indicar el número de cuenta';
      end;
      Objeto.ObtSaldosChqra(Objeto.CUENTA_BANCO.AsInteger);
      InterForma1.ValidaExit(btCtaBanco,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrBlqRecep.edIMP_A_BLOQUEARExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg    :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg   := CNULL;
      vlSalida := True;
      Objeto.IMP_A_BLOQUEAR.GetFromControl;
      Objeto.SDO_TOTAL.GetFromControl;
      Objeto.SDO_COMPROMETIDO.GetFromControl;

      if Objeto.IMP_A_BLOQUEAR.AsFloat < 0 then
      Begin
         vlSalida  := False;
         vlMsg    := 'El importe a Bloquear debe de ser mayor a cero';
      end;
      InterForma1.ValidaExit(edIMP_A_BLOQUEAR,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrBlqRecep.edF_OPERACIONExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg    :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg   := CNULL;
      vlSalida := True;
      Objeto.F_OPERACION.GetFromControl;
      if Objeto.F_OPERACION.AsString = '' then
      Begin
         vlSalida  := False;
         vlMsg    := 'Favor de indicar la fecha de la operación';
      end
      //La fecha de operación no podrá ser menor a la fecha de apertura de la disposición,
      ELSE if Objeto.F_OPERACION.AsDateTime < Objeto.Disposicion.F_INICIO.AsDateTime then
      Begin
         vlSalida  := False;
         vlMsg    := 'La fecha de operación no puede ser menor a la fecha de apertura de la disposición';
      end
      ELSE if Objeto.F_OPERACION.AsDateTime < Objeto.Apli.DameFechaEmpresa then
      Begin
         vlSalida  := False;
         vlMsg    := 'La fecha de operación no puede ser menor a la fecha de hoy';
      end;
      InterForma1.ValidaExit(edF_OPERACION,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrBlqRecep.edF_PROG_DESBLQExit(Sender: TObject);
Var vlsql     : String;
    vlFDesBlq : String;
    vlSalida  :  boolean;
    vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg   := CNULL;
      vlSalida := True;
      Objeto.F_OPERACION.GetFromControl;
      vlsql:= ' SELECT MIN(F_VENCIMIENTO) F_PROG_DESBLQ' +
              ' FROM ( SELECT F_VENCIMIENTO FROM CR_CAPITAL ' +
              '        WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsString +' AND SIT_CAPITAL = ''AC''' +
              '      UNION' +
              '        SELECT F_VENCIMIENTO FROM CR_INTERES' +
              '        WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsString +' AND SIT_INTERES = ''AC'')';
      GetSQLStr(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'F_PROG_DESBLQ',vlFDesBlq,False);
      edF_PROG_DESBLQ.Text:= vlFDesBlq;
      if Objeto.F_PROG_DESBLQ.AsDateTime < Objeto.Apli.DameFechaEmpresa then
         Begin
            vlSalida  := False;
            vlMsg    := 'La fecha programada de bloqueo no puede ser menor a la fecha de hoy';
         end
      else if Objeto.F_PROG_DESBLQ.AsDateTime < Objeto.F_OPERACION.AsDateTime then
         Begin
            vlSalida  := False;
            vlMsg    := 'La fecha programada de bloqueo no puede ser menor a la fecha de operación';
         end;;
      InterForma1.ValidaExit(edF_PROG_DESBLQ,True,'',True);
   end;
end;

procedure TWCrBlqRecep.InterForma1Buscar(Sender: TObject);
begin
   IF Objeto.Busca THEN
   Begin
      ObtInfCtaBco;
      Objeto.ObtSaldosChqra(Objeto.CUENTA_BANCO.AsInteger);
      if Objeto.SIT_BLQ_RECEP.AsString = 'AU' then
         InterForma1.ShowBtnModificar := False
      else InterForma1.ShowBtnModificar := True;
   end;
end;

procedure TWCrBlqRecep.ObtInfCtaBco;
var vlsql: String;
    vlTitular: String;
begin
   vlsql:= 'SELECT P.NOMBRE FROM CONTRATO C, PERSONA P WHERE C.ID_TITULAR = P.ID_PERSONA ' +
                      ' AND C.ID_CONTRATO = ' + Objeto.CUENTA_BANCO.AsString +
                      ' AND C.CVE_MONEDA = '+ Objeto.Chequera.CVE_MONEDA.AsString +
                      ' AND C.ID_TITULAR = '+ Objeto.Chequera.ID_TITULAR.AsString;
   GetSQLStr(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'NOMBRE',vlTitular,False);
   edNOMBRE_TITULAR.Text:= vlTitular;
end;

procedure TWCrBlqRecep.InterForma1DespuesCancelar(Sender: TObject);
begin
      ObtInfCtaBco;
end;



procedure TWCrBlqRecep.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   if IsNewData then    //nuevo
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guradar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
         if Objeto.SIT_BLQ_RECEP.AsString <> 'AU' then
            Realizado := True
         else Begin
            ShowMessage('No es posible guardar los cambios, la operación ha sido autorizada');
            Realizado := False;
         end;
      end
      else Realizado := False;
   end
end;

procedure TWCrBlqRecep.edNUM_PERIODOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edNUM_PERIODO,True,'',True);
end;

procedure TWCrBlqRecep.mTX_NOTAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(mTX_NOTA,True,'',True);
end;

end.
