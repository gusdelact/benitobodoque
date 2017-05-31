{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// Sistema         : Clase de CRBLOQAUT
// Fecha de Inicio : 29/05/2006
// Función forma   : Clase de CRBLOQAUT
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrbloqaut;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntCtoPanel, InterEdit,
IntLinkit, InterApl,

IntSICC,
IntParamCre,
IntCrAcredit,   // Acreditado
IntGenCre,
IntCrCto,
Menus        // Alta de Autorización
;

Type
 TCrbloqaut= class; 

  TWCrbloqaut=Class(TForm)
    InterForma1             : TInterForma;
    edCVE_SECTOR: TEdit;
    lbID_ACREDITADO: TLabel;
    edID_ACREDITADO: TEdit;
    btID_ACREDITADO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    cbB_USA_CONTRATO: TCheckBox;
    edCVE_PRODUCTO_CRE: TEdit;
    lbID_CONTRATO: TLabel;
    edID_CONTRATO: TEdit;
    btID_CONTRATO: TBitBtn;
    edDESC_C_PRODUCTO: TEdit;
    icpCONTRATO: TInterCtoPanel;
    Label2: TLabel;
    edID_TRN_BLQ_RECEP: TEdit;
    rgCVE_TIPO_MOVTO: TRadioGroup;
    lbTX_NOTA: TLabel;
    gbSaldos: TGroupBox;
    Label6: TLabel;
    edIMP_AUTORIZADO: TInterEdit;
    edIMP_DISPUESTO: TInterEdit;
    Dispuesto: TLabel;
    edIMP_BLOQUEADO: TInterEdit;
    Label8: TLabel;
    edIMP_DISPONIBLE: TInterEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    gbDatosCtrl: TGroupBox;
    lbCVE_USUARIO_CANC: TLabel;
    lbF_CANCELA: TLabel;
    lbF_ALTA: TLabel;
    lbCVE_USU_ALTA: TLabel;
    edF_ALTA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USUARIO_CANC: TEdit;
    edF_CANCELA: TEdit;
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
    rgSIT_BLQ_RECEP: TRadioGroup;
    memTX_NOTA: TMemo;
    ilID_ACREDITADO: TInterLinkit;
    ilID_CONTRATO: TInterLinkit;
    rgCVE_PCT_IMP: TPanel;
    opPCT_MOVIMIENTO: TRadioButton;
    opIMP_MOVIMIENTO: TRadioButton;
    edIMP_MOVIMIENTO: TInterEdit;
    edPCT_MOVIMIENTO: TInterEdit;
    Label1: TLabel;
    PopupMenuAcreditado: TPopupMenu;
    PopupMenuAutorizacion: TPopupMenu;
    Acreditado1: TMenuItem;
    Autorizacin1: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilID_CONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_ACREDITADOEjecuta(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure btID_ACREDITADOClick(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure cbB_USA_CONTRATOClick(Sender: TObject);
    procedure edID_ACREDITADOExit(Sender: TObject);
    procedure rgCVE_TIPO_MOVTOExit(Sender: TObject);
    procedure edPCT_MOVIMIENTOExit(Sender: TObject);
    procedure edIMP_MOVIMIENTOExit(Sender: TObject);
    procedure memTX_NOTAExit(Sender: TObject);
    procedure opPCT_MOVIMIENTOExit(Sender: TObject);
    procedure opIMP_MOVIMIENTOExit(Sender: TObject);
    procedure opPCT_MOVIMIENTOClick(Sender: TObject);
    procedure edID_CONTRATOExit(Sender: TObject);
    procedure memTX_NOTAKeyPress(Sender: TObject; var Key: Char);
    procedure Acreditado1Click(Sender: TObject);
    procedure Autorizacin1Click(Sender: TObject);
    procedure rgCVE_TIPO_MOVTOClick(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrbloqaut;
     function EsValidoImploquear(var psMensaje : String) : Boolean;
     function stpObtDispuestoAut(peApli : TInterApli;
                                 peID_CONTRATO   : Integer;
                                 peFOL_CONTRATO  : Integer
                                 ) : Double;
     function stpObtDispuestoAcred(peApli : TInterApli;
                                   peID_ACREDITADO   : Integer
                                  ) : Double;
     procedure ColocaSaldos;
     procedure SetContrato;
     procedure HabilitaControles;
     procedure HabilitaCtrlsContrato(peB_HABILITA : Boolean);
end;
 TCrbloqaut= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre                 : TParamCre;

        Acreditado               : TCrAcredit;
        Autorizacion             : TCrCto;

        ID_TRN_BLQ_RECEP         : TInterCampo;
        ID_ACREDITADO            : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        FOL_CONTRATO             : TInterCampo;
        CVE_TIPO_MOVTO           : TInterCampo;
        PCT_MOVIMIENTO           : TInterCampo;
        IMP_MOVIMIENTO           : TInterCampo;
        TX_NOTA                  : TInterCampo;
        F_OPERACION              : TInterCampo;
        B_AUTOMATICO             : TInterCampo;
        SIT_BLQ_RECEP            : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USUARIO_CANC         : TInterCampo;
        F_CANCELA                : TInterCampo;
        IMP_AUTORIZADO           : TInterCampo;
        IMP_DISPUESTO            : TInterCampo;
        IMP_BLOQUEADO            : TInterCampo;
        IMP_DISPONIBLE           : TInterCampo;

        B_USA_CONTRATO           : TInterCampo;

        function    InternalBusca : Boolean; override;
        function    InternalPost : Boolean; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

        function    StpObtAdeudo: Double;
        function    StpInsertaRegBloqueo(var psIMP_TOT_BLOQ     : Double;
                                         var psID_TRN_BLQ_RECEP : Integer;
                                         var psID_GRUPO_TRANSAC : Integer;
                                         var psRESULTADO       : Integer;
                                         var psTX_RESULTADO    : String
                                         ) : Boolean;
      published
      end;

const      
  coBloqueo       = 'BL';
  coDesbloqueo    = 'DB';
  coSQLDisponible = 'SELECT PKGCRSALDOS.STPOBTDISPONIBLEAUT( %d, %d ) DISPONIBLE_AUT FROM DUAL';


implementation
{$R *.DFM}


constructor TCrbloqaut.Create( AOwner : TComponent );
begin Inherited;
      ID_TRN_BLQ_RECEP := CreaCampo('ID_TRN_BLQ_RECEP',ftInteger,tsNinguno,tsNinguno,True);
       ID_TRN_BLQ_RECEP.Caption:='No. Operación';
      ID_ACREDITADO := CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,True);
       ID_ACREDITADO.Caption:='Acreditado';
      ID_CONTRATO := CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,True);
       ID_CONTRATO.Caption:='Autorización';
      FOL_CONTRATO := CreaCampo('FOL_CONTRATO',ftInteger,tsNinguno,tsNinguno,True);
       FOL_CONTRATO.Caption:='Folio';
      CVE_TIPO_MOVTO := CreaCampo('CVE_TIPO_MOVTO',ftString,tsNinguno,tsNinguno,True);
       CVE_TIPO_MOVTO.Caption:='Tipo de Movimiento';
      PCT_MOVIMIENTO := CreaCampo('PCT_MOVIMIENTO',ftFloat,tsNinguno,tsNinguno,True);
       PCT_MOVIMIENTO.Caption:='% a Aplicar';
      IMP_MOVIMIENTO := CreaCampo('IMP_MOVIMIENTO',ftFloat,tsNinguno,tsNinguno,True);
       IMP_MOVIMIENTO.Caption:='Monto a Aplicar';
      B_AUTOMATICO := CreaCampo('B_AUTOMATICO',ftFloat,tsNinguno,tsNinguno,True);
       B_AUTOMATICO.Caption:='Transacción automática';
      TX_NOTA := CreaCampo('TX_NOTA',ftString,tsNinguno,tsNinguno,True);
       TX_NOTA.Caption:='Comentarios';
      CVE_USU_ALTA := CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
       CVE_USU_ALTA.Caption:='Usuario Alta';
      F_ALTA := CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
       F_ALTA.Caption:='Fecha de Alta';
      CVE_USUARIO_CANC := CreaCampo('CVE_USUARIO_CANC',ftString,tsNinguno,tsNinguno,True);
       CVE_USUARIO_CANC.Caption:='Usuario Cancela';
      F_CANCELA := CreaCampo('F_CANCELA',ftDateTime,tsNinguno,tsNinguno,True);
       F_CANCELA.Caption:='Fecha Cancelación';
      IMP_AUTORIZADO := CreaCampo('IMP_AUTORIZADO',ftFloat,tsNinguno,tsNinguno,False);
      IMP_DISPUESTO  := CreaCampo('IMP_DISPUESTO',ftFloat,tsNinguno,tsNinguno,False);
      IMP_BLOQUEADO  := CreaCampo('IMP_BLOQUEADO',ftFloat,tsNinguno,tsNinguno,False);
      IMP_DISPONIBLE := CreaCampo('IMP_DISPONIBLE',ftFloat,tsNinguno,tsNinguno,False);
      B_USA_CONTRATO := CreaCampo('B_USA_CONTRATO',ftString,tsNinguno,tsNinguno,False);
      //
      F_OPERACION   := CreaCampo('F_OPERACION',   ftDate,   tsNinguno,  tsNinguno, True);
      SIT_BLQ_RECEP := CreaCampo('SIT_BLQ_RECEP', ftString, tsNinguno,  tsNinguno, False);
      //      
      with CVE_TIPO_MOVTO do
      begin
        Size := 2;                UseCombo:=True;
        ComboLista.Add('0');      ComboDatos.Add(coBloqueo);
        ComboLista.Add('1');      ComboDatos.Add(coDesbloqueo);
      end;
      with SIT_BLQ_RECEP do
      begin
        Size := 2;                UseCombo := True;
        ComboLista.Add('0');      ComboDatos.Add(CSIT_NA);
        ComboLista.Add('1');      ComboDatos.Add(CSIT_AC);
        //ComboLista.Add('2');      ComboDatos.Add(CSIT_LQ);
        //ComboLista.Add('3');      ComboDatos.Add(CSIT_CA);
      end;
      {$WARNINGS OFF}
      Acreditado := TCrAcredit.Create(Self);
      {$WARNINGS ON}
      Acreditado.MasterSource := Self;
      Acreditado.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';

      {$WARNINGS OFF}
      Autorizacion := TCrCto.Create(Self);
      {$WARNINGS ON}
      Autorizacion.MasterSource:=Self;
      Autorizacion.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';
      Autorizacion.FieldByName('FOL_CONTRATO').MasterField:='FOL_CONTRATO';

      FKeyFields.Add('ID_TRN_BLQ_RECEP');
      TableName := 'CR_CL_BLQ_RECEP';
      UseQuery := True;
      HelpFile := 'IntCrbloqaut.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrbloqaut.Destroy;
begin
  If Assigned(Acreditado) Then Acreditado.Free;
  If Assigned(Autorizacion) Then Autorizacion.Free;
  inherited;
end;

function TCrbloqaut.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrbloqaut; 
begin
   W:=TWCrbloqaut.Create(Self);
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

Function TCrbloqaut.InternalBusca:Boolean;
var T :TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrClBR.it','F');
  Try
    if Active then
    begin
      T.Param(0,ID_TRN_BLQ_RECEP.AsString);
    end;
    //
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;


function TCrbloqaut.StpObtAdeudo: Double;
var sSql : String;
    sRes : String;
begin
  ID_ACREDITADO.GetFromControl;
  ID_CONTRATO.GetFromControl;
  FOL_CONTRATO.GetFromControl;
  B_USA_CONTRATO.GetFromControl;
  //
  sRes   := '';
  Result := 0;
  if ID_ACREDITADO.AsInteger = 0  then Result := 1;
  if (B_USA_CONTRATO.AsString = 'V' ) and (ID_CONTRATO.AsInteger = 0 ) then Result := 1;
  // Valida si hay un error en los datos
  if Result > 0 then exit;
  // Obtiene el importe de la base de datos
  sSql := 'SELECT PKGCRSALDOS.STPOBTSDOVDOAUT(' + ID_ACREDITADO.AsString + ',' +
          ID_CONTRATO.AsString + ',' + FOL_CONTRATO.AsString + ') SDO_VENCIDO FROM DUAL';
  GetSQLStr( sSql, Apli.DataBaseName, Apli.SessionName, 'SDO_VENCIDO', sRes, False );
  if sRes = '' then Result := 1
  else Result := StrToFloat(sRes);
end;


function TCrbloqaut.StpInsertaRegBloqueo(var psIMP_TOT_BLOQ     : Double;
                                         var psID_TRN_BLQ_RECEP : Integer;
                                         var psID_GRUPO_TRANSAC : Integer;
                                         var psRESULTADO        : Integer;
                                         var psTX_RESULTADO     : String
                                         ) : Boolean;
var Stp    : TStoredProc;
    vlFhoy : TDate;
begin
  Result := True;
  psIMP_TOT_BLOQ     := -1;
  psID_TRN_BLQ_RECEP := -1;
  psID_GRUPO_TRANSAC := -1;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       vlFhoy := Apli.DameFechaEmpresa;
       DataBaseName   := Apli.DataBaseName;
       SessionName    := Apli.SessionName;
       //StoredProcName := 'PKGCRSALDOS.STPALTASOLBLQAUT';
       StoredProcName := 'PKGCRSALDOS.STPINSERTAREGBLOQUEOACRED';
       Params.Clear;
       Params.CreateParam(ftFloat   , 'peIdAcreditado',   ptInput);
       Params.CreateParam(ftFloat   , 'peIdContrato',     ptInput);
       Params.CreateParam(ftFloat   , 'peFolContrato',    ptInput);
       Params.CreateParam(ftString  , 'peCveTipoMovto',   ptInput);
       Params.CreateParam(ftFloat   , 'pePctMovimiento',  ptInput);
       Params.CreateParam(ftFloat   , 'peImpMovimiento',  ptInput);
       Params.CreateParam(ftString  , 'peTxNota',         ptInput);
       Params.CreateParam(ftDateTime, 'peFOperacion',     ptInput);
       Params.CreateParam(ftString  , 'peBAutomatico',    ptInput);
       Params.CreateParam(ftString  , 'peSitBlqRecep',    ptInput);
       Params.CreateParam(ftString  , 'peCveUsuAlta',     ptInput);
       Params.CreateParam(ftDateTime, 'peFAlta',          ptInput);
       Params.CreateParam(ftString  , 'peCveUsuCanc',     ptInput);
       Params.CreateParam(ftDateTime, 'peFCancela',       ptInput);
       Params.CreateParam(ftString  , 'peBCommit',        ptInput);
       Params.CreateParam(ftFloat   , 'psIdTrnBlqRecep',  ptOutput);
       Params.CreateParam(ftFloat   , 'psResultado',      ptOutput);
       Params.CreateParam(ftString  , 'psTxResultado',    ptOutput);
       //
       GetFromControl;
       ParamByName('peIdAcreditado').AsInteger := ID_ACREDITADO.AsInteger;
       ParamByName('peIdContrato').AsInteger   := ID_CONTRATO.AsInteger;
       ParamByName('peFolContrato').AsInteger  := FOL_CONTRATO.AsInteger;
       ParamByName('peCveTipoMovto').AsString  := CVE_TIPO_MOVTO.AsString;
       ParamByName('pePctMovimiento').AsFloat  := PCT_MOVIMIENTO.AsFloat;
       ParamByName('peImpMovimiento').AsFloat  := IMP_MOVIMIENTO.AsFloat;
       ParamByName('peTxNota').AsString        := TX_NOTA.AsString;
       ParamByName('peFOperacion').AsDate      := vlFhoy;
       ParamByName('peBAutomatico').AsString   := 'F';
       ParamByName('peSitBlqRecep').AsString   := SIT_BLQ_RECEP.AsString;
       ParamByName('peCveUsuAlta').AsString    := Apli.Usuario;
       ParamByName('peFAlta').AsDate           := vlFhoy;
       ParamByName('peBCommit').AsString       := 'V';
       ParamByName('peCveUsuCanc').Clear;
       ParamByName('peFCancela').Clear;
       ParamByName('psIdTrnBlqRecep').Clear;
       ParamByName('psResultado').Clear;
       ParamByName('psTxResultado').Clear;
       //
       ExecProc;
       Result := (ParamByName('psResultado').AsInteger = 0);
       If Not Result Then
         MessageDlg(ParamByName('psTxResultado').AsString, mtError, [mbOk], 0)
       Else
         psID_TRN_BLQ_RECEP := ParamByName('psIdTrnBlqRecep').AsInteger;
       //
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
End;

function TCrbloqaut.InternalPost : Boolean;
var vlIMP_TOT_BLOQ     : Double;
    vlID_TRN_BLQ_RECEP : Integer;
    vlID_GRUPO_TRANSAC : Integer;
    vlRESULTADO        : Integer;
    vlTX_RESULTADO     : String;
    vlbResult  : Boolean;
begin
  If (Modo = moAppend) Then
  Begin
    vlbResult := True;
    CVE_TIPO_MOVTO.GetFromControl;
    if CVE_TIPO_MOVTO.AsString = coDesbloqueo then
    begin
      if StpObtAdeudo > 0 then
      begin
{ROIM 03/04/2007 Cambio para no permitir un desbloqueo cuando se tienen saldos vencidos no liquidados}
//        vlTx_Resultado := 'Tiene saldos vencidos no liquidados, ¿Desea continuar?';
//        vlbResult := ( MessageDlg(vlTx_Resultado, mtConfirmation, mbYesNoCancel, 0 ) = mrYes );
//        if not vlbResult then
          Raise Exception.Create('Tiene saldos vencidos no liquidados');
{/ROIM}
      end;
    end;
    //
    vlbResult := StpInsertaRegBloqueo(vlIMP_TOT_BLOQ, vlID_TRN_BLQ_RECEP,
                  vlID_GRUPO_TRANSAC, vlRESULTADO,    vlTX_RESULTADO);
    //
    If (vlbResult) Then
    Begin
      ID_TRN_BLQ_RECEP.AsInteger := vlID_TRN_BLQ_RECEP;
    End;
    Result := vlbResult;
  End Else
    Result := Inherited InternalPost;
end;

(***********************************************FORMA CRBLOQAUT********************)
(*                                                                              *)
(*  FORMA DE CRBLOQAUT                                                            *)
(*                                                                              *)
(***********************************************FORMA CRBLOQAUT********************)

procedure TWCrbloqaut.ColocaSaldos;

    function ObtenImpAutorizado : Double;
    begin
      With Objeto Do
       If (Autorizacion.ID_CONTRATO.AsInteger > 0) Then
         Result := Autorizacion.IMP_AUTORIZADO.AsFloat
       Else
         Result := Acreditado.IMP_MAX_AUTOR.AsFloat;
    end;

    function ObtenImpDisponible : Double;
    var vlIMP_DISPONIBLE : Double;
        vlRESULTADO      : Integer;
        vlTX_RESULTADO   : String;
        vlStrDisponible  : String;
    begin
      Result := -1;
      With Objeto Do
      Begin
        // LOLS 15 NOV 2006. Para obtener el saldo disponible de la linea se hace
        // con la función PKGCRSALDOS.STPOBTDISPONIBLEAUT ya que si se usa
        // PKGCRSALDOS.STPIMPACREDTOTDISP invariablemente trae el disponible del
        // acreditado
        If (Autorizacion.ID_CONTRATO.AsInteger > 0) Then
        begin
          //
          GetSQLStr( Format(coSQLDisponible,[Autorizacion.ID_CONTRATO.AsInteger,
            Autorizacion.FOL_CONTRATO.AsInteger ]), Apli.DataBaseName,
            Apli.SessionName,'DISPONIBLE_AUT', vlStrDisponible, False);
          if vlStrDisponible <> '' then Result := StrToFloat( vlStrDisponible );
          //
        end else
        begin
        // ENDS_LOLS_15_NOV_2006
          If Acreditado.StpImpAcredTotDisp(1, // peNUM_METODO
                                           Acreditado.ID_ACREDITADO.AsInteger,
                                           Autorizacion.ID_CONTRATO.AsInteger,
                                           '', // "peCVE_TIP_DISPOS"      Se indica vacio para que lo tome directamente del Acreditado
                                           -1, // "peIMP_MAX_AUTOR"       Se indica -1 para que lo tome directamente del Acreditado
                                           -1, // "peIMP_EXCESO_EVE"      Se indica -1 para que lo tome directamente del Acreditado
                                           '', // "peCVE_AFEC_INC_DEC"    Se indica vacio para que lo tome directamente del Acreditado
                                           CVERDAD, // "peB_TIPO_CAMBIO"  Siempre Verdadero
                                           vlIMP_DISPONIBLE,
                                           vlRESULTADO,
                                           vlTX_RESULTADO
                                           ) Then
           Result := vlIMP_DISPONIBLE;
        // LOLS 15 NOV 2006. Para obtener el saldo disponible ...
        end;//Ends_If_then_else_(Autorizacion.ID_CONTRATO.AsInteger > 0)_Then
        // ENDS_LOLS_15_NOV_2006
      End;// ends_With_Objeto_Do
    end;

    function ObtenImpDispuesto : Real;
    var vlIMP_DISPUESTO : Real;
        vlSQL : String;
    begin
      Result := -1;
      With Objeto Do
        Begin
          If (Autorizacion.ID_CONTRATO.AsInteger > 0) Then
            vlSQL := 'SELECT PKGCRSALDOS.STPOBTDISPUESTOAUT('+Autorizacion.ID_CONTRATO.AsString+', '+
                     Autorizacion.FOL_CONTRATO.AsString+') AS IMP_DISPUESTO FROM DUAL'
          Else
            vlSQL := 'SELECT PKGCRSALDOS.STPOBTDISPUESTOACRED('+Acreditado.ID_ACREDITADO.AsString+
                     ') AS IMP_DISPUESTO FROM DUAL';
          If GetSQLFloat(vlSQL, Apli.DatabaseName, Apli.SessionName, 'IMP_DISPUESTO', vlIMP_DISPUESTO, True) Then
            Result := vlIMP_DISPUESTO;
        End;
    end;

    function ObtenImpBloqueado : Double;
    var vlIMP_BLOQUEADO  : Double;
        vlRESULTADO      : Integer;
        vlTX_RESULTADO   : String;
    begin
      With Objeto Do
       If (Autorizacion.ID_CONTRATO.AsInteger > 0) Then
         Result := Autorizacion.IMP_BLOQUEADO.AsFloat
       Else
         Begin
           If Not Acreditado.StpImpAcredTotBloq(vlIMP_BLOQUEADO, vlRESULTADO, vlTX_RESULTADO) Then
             Begin
             Result := 0;
             MessageDlg(vlTX_RESULTADO, mtError, [mbOk], 0);
             End
           Else
            Result := vlIMP_BLOQUEADO;
         End;
    end;

begin
  With Objeto Do
    Begin
    IMP_AUTORIZADO.AsFloat  := ObtenImpAutorizado;
    IMP_DISPUESTO.AsFloat   := ObtenImpDispuesto;
    IMP_BLOQUEADO.AsFloat   := ObtenImpBloqueado;
    IMP_DISPONIBLE.AsFloat  := ObtenImpDisponible;
    End;
end;

procedure TWCrbloqaut.FormShow(Sender: TObject);
begin
   With Objeto Do
    Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    ID_TRN_BLQ_RECEP.Control     := edID_TRN_BLQ_RECEP;
    ID_ACREDITADO.Control        := edID_ACREDITADO;
    ID_CONTRATO.Control          := edID_CONTRATO;
    CVE_TIPO_MOVTO.Control       := rgCVE_TIPO_MOVTO;
    PCT_MOVIMIENTO.Control       := edPCT_MOVIMIENTO;
    IMP_MOVIMIENTO.Control       := edIMP_MOVIMIENTO;
    TX_NOTA.Control              := memTX_NOTA;
    CVE_USU_ALTA.Control         := edCVE_USU_ALTA;
    F_ALTA.Control               := edF_ALTA;
    CVE_USUARIO_CANC.Control     := edCVE_USUARIO_CANC;
    F_CANCELA.Control            := edF_CANCELA;
    IMP_AUTORIZADO.Control       := edIMP_AUTORIZADO;
    IMP_DISPUESTO.Control        := edIMP_DISPUESTO;
    IMP_BLOQUEADO.Control        := edIMP_BLOQUEADO;
    IMP_DISPONIBLE.Control       := edIMP_DISPONIBLE;
    B_USA_CONTRATO.Control       := cbB_USA_CONTRATO;
    SIT_BLQ_RECEP.Control        := rgSIT_BLQ_RECEP;

    Acreditado.ID_ACREDITADO.Control  := edID_ACREDITADO;
    Acreditado.Persona.Cve_Tipo_Sector.Control := edCVE_SECTOR;
    Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;
    Acreditado.GetParams(Objeto);    

    Autorizacion.ID_CONTRATO.Control := edID_CONTRATO;
    Autorizacion.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
    Autorizacion.Producto.DESC_C_PRODUCTO.Control := edDESC_C_PRODUCTO;
    Autorizacion.GetParams(Objeto);
    
    Interforma1.MsgPanel := MsgPanel;
    icpCONTRATO.Frame := Autorizacion.Contrato;
    End;
end;

procedure TWCrbloqaut.FormDestroy(Sender: TObject);
begin
   With Objeto Do
    Begin
    ID_TRN_BLQ_RECEP.Control     := Nil;
    ID_ACREDITADO.Control        := Nil;
    ID_CONTRATO.Control          := Nil;
    CVE_TIPO_MOVTO.Control       := Nil;
    PCT_MOVIMIENTO.Control       := Nil;
    IMP_MOVIMIENTO.Control       := Nil;
    TX_NOTA.Control              := Nil;
    CVE_USU_ALTA.Control         := Nil;
    F_ALTA.Control               := Nil;
    CVE_USUARIO_CANC.Control     := Nil;
    F_CANCELA.Control            := Nil;
    IMP_AUTORIZADO.Control       := Nil;
    IMP_DISPUESTO.Control        := Nil;
    IMP_BLOQUEADO.Control        := Nil;
    IMP_DISPONIBLE.Control       := Nil;
    B_USA_CONTRATO.Control       := Nil;
    SIT_BLQ_RECEP.Control        := Nil;

    Acreditado.ID_ACREDITADO.Control  := Nil;
    Acreditado.Persona.Cve_Tipo_Sector.Control := Nil;
    Acreditado.Persona.Nombre.Control := Nil;

    Autorizacion.ID_CONTRATO.Control := Nil;
    Autorizacion.CVE_PRODUCTO_CRE.Control := Nil;
    Autorizacion.Producto.DESC_C_PRODUCTO.Control := Nil;

    Interforma1.MsgPanel := Nil;
    icpCONTRATO.Frame := Nil;    
    End;
end;

procedure TWCrbloqaut.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrbloqaut.InterForma1DespuesNuevo(Sender: TObject);
begin
  If edID_ACREDITADO.CanFocus Then edID_ACREDITADO.SetFocus;
  HabilitaControles;
  HabilitaCtrlsContrato(False);
  Objeto.CVE_TIPO_MOVTO.AsString := coBloqueo;
  Objeto.SIT_BLQ_RECEP.AsString  := CSIT_NA;
end;

procedure TWCrbloqaut.InterForma1DespuesModificar(Sender: TObject);
begin
  If edID_ACREDITADO.CanFocus Then edID_ACREDITADO.SetFocus;
  HabilitaControles;
  HabilitaCtrlsContrato(False);
end;


procedure TWCrbloqaut.InterForma1Buscar(Sender: TObject);
begin
  if Objeto.Busca then
  Begin
    opPCT_MOVIMIENTO.Checked := Objeto.PCT_MOVIMIENTO.AsFloat > 0;
    opIMP_MOVIMIENTO.Checked := Objeto.IMP_MOVIMIENTO.AsFloat > 0;
    cbB_USA_CONTRATO.Checked := Objeto.ID_CONTRATO.AsFloat > 0;
    if cbB_USA_CONTRATO.Checked then SetContrato;
    ColocaSaldos;
  End;
end;

procedure TWCrbloqaut.InterForma1DespuesAceptar(Sender: TObject);
begin
  {
  opPCT_MOVIMIENTO.Checked := Objeto.PCT_MOVIMIENTO.AsFloat > 0;
  opIMP_MOVIMIENTO.Checked := Objeto.IMP_MOVIMIENTO.AsFloat > 0;
  cbB_USA_CONTRATO.Checked := Objeto.ID_CONTRATO.AsFloat > 0;
  if cbB_USA_CONTRATO.Checked then SetContrato;
  }
  ColocaSaldos;
end;

procedure TWCrbloqaut.ilID_CONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrbloqaut.ilID_ACREDITADOEjecuta(Sender: TObject);
begin
  If Objeto.Acreditado.FindKey([ilID_ACREDITADO.Buffer]) Then
  Begin
    ColocaSaldos;
    InterForma1.NextTab(edID_ACREDITADO);
  End;
end;

procedure TWCrbloqaut.SetContrato;
begin
 With Objeto Do
  Begin
  cbB_USA_CONTRATO.Checked := True;  
  ID_CONTRATO.AsInteger := Autorizacion.ID_CONTRATO.AsInteger;
  FOL_CONTRATO.AsInteger := Autorizacion.FOL_CONTRATO.AsInteger;
  icpCONTRATO.RefrescaInfo;  
  End;
end;

procedure TWCrbloqaut.ilID_CONTRATOEjecuta(Sender: TObject);
begin
 With Objeto Do
  Begin
  Autorizacion.BuscaWhereString := ' CONTRATO.ID_TITULAR = '+Acreditado.ID_ACREDITADO.AsString;
  If Autorizacion.FindKey([ilID_CONTRATO.Buffer, '1']) Then
    Begin
    SetContrato;
    ColocaSaldos;
    End;
  End;
end;

procedure TWCrbloqaut.btID_ACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRBLOQAUT_ACRED',True,True) then
   begin
      //EASA4011
      {
      If Objeto.Busca Then
      Begin
        ColocaSaldos;
        InterForma1.NextTab( edID_ACREDITADO );
      End;
      }

      If Objeto.Acreditado.Busca Then
      Begin
        ColocaSaldos;
        InterForma1.NextTab(edID_ACREDITADO);
      End;
   end;
end;

procedure TWCrbloqaut.btID_CONTRATOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRBLOQAUT_AUTOR',True,True) then
   begin
      With Objeto Do
      Begin
        Autorizacion.ShowAll := True;
        Autorizacion.BuscaWhereString := ' CONTRATO.ID_TITULAR = '+Acreditado.ID_ACREDITADO.AsString;
        If Autorizacion.Busca Then
        Begin
          SetContrato;
          ColocaSaldos;
          InterForma1.NextTab(edID_CONTRATO);
        End;
      End;
   end;
End;

procedure TWCrbloqaut.cbB_USA_CONTRATOClick(Sender: TObject);
begin
  HabilitaCtrlsContrato(cbB_USA_CONTRATO.Checked);
  If Not cbB_USA_CONTRATO.Checked Then
    Objeto.Autorizacion.Active := False;
  //
  // InterForma1.NextTab(cbB_USA_CONTRATO);
end;

procedure TWCrbloqaut.edID_ACREDITADOExit(Sender: TObject);
var vlMsg : String;
begin
  vlMsg := '';
  With Objeto Do
    If ((Modo = moAppend) Or (Modo = moEdit)) Then
    Begin
      ID_ACREDITADO.GetFromControl;
      If (ID_ACREDITADO.AsInteger <= 0) Then
        vlMsg := ' Favor de indicar el acreditado.';
    End;
   InterForma1.ValidaExit(edID_ACREDITADO, vlMsg = '', vlMsg, True);
end;

procedure TWCrbloqaut.edID_CONTRATOExit(Sender: TObject);
var vlMsg : String;
begin
  vlMsg := '';
  With Objeto Do
    If ((Modo = moAppend) Or (Modo = moEdit)) Then
    Begin
      If (cbB_USA_CONTRATO.Checked) And (ID_CONTRATO.AsInteger <= 0) Then
        vlMsg := 'Favor de indicar el No. de Autorización';
      //
    End;
   InterForma1.ValidaExit(edID_CONTRATO, vlMsg = '', vlMsg, True);
end;

procedure TWCrbloqaut.HabilitaCtrlsContrato(peB_HABILITA : Boolean);
begin
  edID_CONTRATO.Enabled  := peB_HABILITA;
  edID_CONTRATO.TabStop := peB_HABILITA;
  edID_CONTRATO.ReadOnly := Not peB_HABILITA;
    
  btID_CONTRATO.Enabled := peB_HABILITA;
  btID_CONTRATO.TabStop := peB_HABILITA;
  If (peB_HABILITA) Then
     Begin
     edID_CONTRATO.Color := clWindow;
     End
  Else
     Begin
     edID_CONTRATO.Color := clBtnFace;
     End;
end;

function TWCrbloqaut.stpObtDispuestoAut(peApli : TInterApli;
                                        peID_CONTRATO   : Integer;
                                        peFOL_CONTRATO  : Integer
                                        ) : Double;
var Stp : TStoredProc;
begin
  Result := -1;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRSALDOS.STPOBTDISPUESTOAUT';
       DataBaseName   := peApli.DataBaseName;
       SessionName    := peApli.SessionName;
       Params.CreateParam(ftInteger ,'PEIDCONTRATO'  , ptInput );
       Params.CreateParam(ftInteger ,'PEFOLCONTRATO' , ptInput );
       Params.CreateParam(ftFloat   ,'RESULT'        , ptResult );
       // Asigna Valores
       ParamByName('PEIDCONTRATO').AsInteger  := peID_CONTRATO;
       ParamByName('PEFOLCONTRATO').AsInteger := peFOL_CONTRATO;
       ExecProc;

       Result := ParamByName('RESULT').AsFloat;
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
End;

function TWCrbloqaut.stpObtDispuestoAcred(peApli : TInterApli;
                                          peID_ACREDITADO   : Integer
                                         ) : Double;
var Stp : TStoredProc;
begin
  Result := -1;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRSALDOS.STPOBTDISPUESTOACRED';
       DataBaseName   := peApli.DataBaseName;
       SessionName    := peApli.SessionName;
       Params.CreateParam(ftInteger ,'PEIDACREDITADO', ptInput );
       Params.CreateParam(ftFloat   ,'RESULT'        , ptResult );
       // Asigna Valores
       ParamByName('PEIDACREDITADO').AsInteger  := peID_ACREDITADO;
       ExecProc;

       Result := ParamByName('RESULT').AsFloat;
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
end;


procedure TWCrbloqaut.rgCVE_TIPO_MOVTOClick(Sender: TObject);
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
    InterForma1.NextTab( rgCVE_TIPO_MOVTO );
end;

procedure TWCrbloqaut.rgCVE_TIPO_MOVTOExit(Sender: TObject);
var vlMsg : String;
begin
  vlMsg := '';
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  begin
    Objeto.CVE_TIPO_MOVTO.GetFromControl;
    if Objeto.CVE_TIPO_MOVTO.AsString = '' then
      vlMsg := ' Favor de indicar el tipo de movimiento bloqueo ó desbloqueo'
  end;
  InterForma1.ValidaExit(rgCVE_TIPO_MOVTO, vlMsg = '', vlMsg, True);
end;

procedure TWCrbloqaut.opPCT_MOVIMIENTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(opPCT_MOVIMIENTO, True, '', True);
end;

procedure TWCrbloqaut.opIMP_MOVIMIENTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(opIMP_MOVIMIENTO, True, '', True);
end;

function TWCrbloqaut.EsValidoImploquear(var psMensaje : String) : Boolean;
var vlMsg : String;
begin
   vlMsg := '';
   With Objeto Do
    If ((Modo = moAppend) Or (Modo = moEdit)) Then
     Begin
     IMP_MOVIMIENTO.GetFromControl;
     PCT_MOVIMIENTO.GetFromControl;
     If (PCT_MOVIMIENTO.AsFloat <= 0) And (opPCT_MOVIMIENTO.Checked) Then
       vlMsg := ' Favor de indicar el Porcentaje de Movimiento.'
     Else If (IMP_MOVIMIENTO.AsFloat <= 0) And (opIMP_MOVIMIENTO.Checked) Then
       vlMsg := ' Favor de indicar el Importe de Movimiento.';
     End;
   psMensaje := vlMsg;
   Result := vlMsg = '';
end;

procedure TWCrbloqaut.edPCT_MOVIMIENTOExit(Sender: TObject);
var vlMsg : String;
begin
   EsValidoImploquear(vlMsg);
   InterForma1.ValidaExit(edPCT_MOVIMIENTO, vlMsg = '', vlMsg, True);
end;

procedure TWCrbloqaut.edIMP_MOVIMIENTOExit(Sender: TObject);
var vlMsg : String;
begin
   EsValidoImploquear(vlMsg);
   InterForma1.ValidaExit(edIMP_MOVIMIENTO, vlMsg = '', vlMsg, True);
end;

procedure TWCrbloqaut.memTX_NOTAExit(Sender: TObject);
var vlMsg : String;
begin
  vlMsg := '';
  If ((Objeto.Modo = moAppend) Or (Objeto.Modo = moEdit)) Then
  Begin
    Objeto.TX_NOTA.GetFromControl;
    If (Trim(Objeto.TX_NOTA.AsString) = '') Then
      vlMsg := 'Favor de indicar el Motivo de Bloqueo/Desbloqueo';
  End;
  InterForma1.ValidaExit(memTX_NOTA, vlMsg = '', vlMsg, True);
end;

procedure TWCrbloqaut.HabilitaControles;
begin
  With Objeto Do
    If ((Modo = moAppend) Or (Modo = moEdit)) Then
     Begin
     If opPCT_MOVIMIENTO.Checked Then
       Begin
       IMP_MOVIMIENTO.AsFloat := 0;
       edIMP_MOVIMIENTO.Color := clBtnFace;
       edPCT_MOVIMIENTO.Color := clWindow;
       End
     Else
       Begin
       PCT_MOVIMIENTO.AsFloat := 0;
       edIMP_MOVIMIENTO.Color := clWindow;
       edPCT_MOVIMIENTO.Color := clBtnFace;
       End;
     edIMP_MOVIMIENTO.ReadOnly := opPCT_MOVIMIENTO.Checked;
     edPCT_MOVIMIENTO.ReadOnly := Not opPCT_MOVIMIENTO.Checked;

     edIMP_MOVIMIENTO.TabStop  := Not opPCT_MOVIMIENTO.Checked;
     edPCT_MOVIMIENTO.TabStop  := opPCT_MOVIMIENTO.Checked;
     End;
end;

procedure TWCrbloqaut.opPCT_MOVIMIENTOClick(Sender: TObject);
begin
  HabilitaControles;
end;

procedure TWCrbloqaut.memTX_NOTAKeyPress(Sender: TObject; var Key: Char);
var str : String;
begin
  str := Key;
  str := UpperCaseAcentos(str);
  Key := str[1];
end;

procedure TWCrbloqaut.Acreditado1Click(Sender: TObject);
var DatosAcreditado : TCrAcredit;
begin
  With Objeto Do
    If (Acreditado.ID_ACREDITADO.AsInteger > 0) Then
       Begin
       {$WARNINGS OFF}
       DatosAcreditado := TCrAcredit.Create(self);
       {$WARNINGS ON}       
       If Assigned(DatosAcreditado) Then
          Try
            DatosAcreditado.GetParams(Objeto);
            DatosAcreditado.ParamCre := ParamCre;
            DatosAcreditado.FindKey([Acreditado.ID_ACREDITADO.AsInteger]);
            DatosAcreditado.Catalogo;
          Finally
            DatosAcreditado.Free;
          End;
       End;
end;

procedure TWCrbloqaut.Autorizacin1Click(Sender: TObject);
var DatosAutorizacion : TCrCto;
begin
  With Objeto Do
    If (Autorizacion.ID_CONTRATO.AsInteger > 0) Then
       Begin
       {$WARNINGS OFF}
       DatosAutorizacion := TCrCto.Create(self);
       {$WARNINGS ON}       
       If Assigned(DatosAutorizacion) Then
          Try
            DatosAutorizacion.GetParams(Objeto);
            DatosAutorizacion.ParamCre := ParamCre;
            DatosAutorizacion.FindKey([Autorizacion.ID_CONTRATO.AsInteger, Autorizacion.FOL_CONTRATO.AsInteger]);
            DatosAutorizacion.Catalogo;
          Finally
            DatosAutorizacion.Free;
          End;
       End;
end;





end.



