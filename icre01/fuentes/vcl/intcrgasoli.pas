// Sistema         : Clase de CR_GA_SOL_LIQ
// Fecha de Inicio : 07/07/2004
// Función forma   : Clase de CR_GA_SOL_LIQ
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrGaSoLi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, InterApl,
Grids, Aligrid,

IntGenCre,
IntParamCre,  // Parámetros de Crédito
IntCrCredito; // Alta de solicitudes de Disposición / DISPOSICION

const
 CO_INCUMPLIMIENTO_PERIODO = 'IP';
 CO_CHEQUERA = 'Chequera';
 CO_SOLLIQ = 'Sol. Liq.';

 CO_COL_TITULO              = 0;
 CO_COL_CTO_DEPOSITO        = 1;
 CO_COL_NOM_TIT_DEPOSITO    = 2;
 CO_COL_IMP_VALUACION       = 3;

 CO_FORMAT_DINERO_GRID = '###,###,###,###,###,###,##0.00';

Type
 TCrGaSoLi= class;

  TWCrGaSolLiq=Class(TForm)
    lbID_SOLICITUD : TLabel;
    edID_SOLICITUD : TEdit;
    lbID_CREDITO : TLabel;
    edID_CREDITO : TEdit;
    lbNUM_PERIODO : TLabel;
    edNUM_PERIODO : TEdit;
    rgCVE_TIPO_LIQ: TRadioGroup;
    edNOM_ACREDITADO: TEdit;
    Label1: TLabel;
    grbxImportes: TGroupBox;
    btnBusca: TBitBtn;
    edIMP_ADEUDO_CAP: TInterEdit;
    lblIMP_SOLICITAR: TLabel;
    lbledIMP_ADEUDO_CAP: TLabel;
    Label9: TLabel;
    lblF_APLICACION: TLabel;
    lblIMP_APLICADO: TLabel;
    edIMP_SOLICITAR: TInterEdit;
    edIMP_APLICADO: TInterEdit;
    rgSIT_GAR_SOL_LIQ: TRadioGroup;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    btnCancela: TBitBtn;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
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
    edF_APLICACION: TEdit;
    InterDateTimePicker2: TInterDateTimePicker;
    Label8: TLabel;
    edID_CONTROL_EXT: TEdit;
    edID_CRED_EXTERNO: TEdit;
    Label10: TLabel;
    memTX_COMENTARIO: TMemo;
    lblComentarios: TLabel;
    btnImprimir: TBitBtn;
    gbxOperativa: TGroupBox;
    lblPCT_APLICADO: TLabel;
    edPCT_APLICADO: TInterEdit;
    lblCVE_OPERATIVA: TLabel;
    lblPCT_GTIA_FEGA_NO: TLabel;
    lblPCT_GTIA_FEGA_EF: TLabel;
    edPCT_GTIA_FEGA_NO: TInterEdit;
    edCVE_OPERATIVA: TEdit;
    edPCT_GTIA_FEGA_EF: TInterEdit;
    InterForma1: TInterForma;
    lblNOM_TITULAR: TLabel;
    Label14: TLabel;
    edIMP_GTIA_DISPON: TInterEdit;
    lblIMP_GTIA_DISPON: TLabel;
    strAlgnGrdCto: TStringAlignGrid;
    Label3: TLabel;
    lblF_SOLICITUD: TLabel;
    edF_SOLICITUD: TEdit;
    InterDateTimePicker1: TInterDateTimePicker;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure rgCVE_TIPO_LIQExit(Sender: TObject);
    procedure edIMP_SOLICITARExit(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure memTX_COMENTARIOExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure btnBuscaExit(Sender: TObject);
    procedure rgCVE_TIPO_LIQClick(Sender: TObject);
    procedure edF_SOLICITUDExit(Sender: TObject);
    private
    { Private declarations }
     procedure MuestraDatos;
     procedure ClearAlignGrid(StringAlignGrid : TStringAlignGrid; nStartRow : Integer = 1);
     function Obten_y_MuestraOperativa(peID_CREDITO : Integer) : Boolean;
     function Obten_y_MuestraContratos(peID_CREDITO : Integer) : Boolean;
     procedure CalcImportesSolicitud(peID_CREDITO, peNUM_PERIODO : Integer; peCVE_TIPO_LIQ : String);
     procedure ActualizaImportes;
    public
    { Public declarations }
    Objeto : TCrGaSoLi;
end;
 TCrGaSoLi= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_SOLICITUD             : TInterCampo;
        ID_CREDITO               : TInterCampo;
        NUM_PERIODO              : TInterCampo;
        CVE_TIPO_LIQ             : TInterCampo;
        IMP_SOLICITAR_OR         : TInterCampo;
        IMP_SOLICITAR            : TInterCampo;
        IMP_APLICADO             : TInterCampo;
        IMP_ADEUDO_CAP           : TInterCampo;
        IMP_ADEUDO_INT           : TInterCampo;
        IMP_ADEUDO_COM           : TInterCampo;
        IMP_ADEUDO_FIN           : TInterCampo;
        IMP_ADEUDO_MOR           : TInterCampo;
        PCT_APLICADO             : TInterCampo;
        F_APLICACION             : TInterCampo;
        SIT_GAR_SOL_LIQ          : TInterCampo;
        TX_COMENTARIO            : TInterCampo;
        F_SOLICITUD              : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        IMP_GTIA_DISPON          : TInterCampo;

        ID_CONTROL_EXT           : TInterCampo;
        NOM_ACREDITADO           : TInterCampo;
        CVE_OPERATIVA            : TInterCampo;
        PCT_GTIA_LIQ             : TInterCampo;
        PCT_GTIA_LIQ_IN          : TInterCampo;
        PCT_GTIA_FEGA_EF         : TInterCampo;
        PCT_GTIA_FEGA_NO         : TInterCampo;

        ParamCre                 : TParamCre;

        Credito        : TCrCredito;

        m_nID_CREDITO  : Integer;
        m_nNUM_PERIODO : Integer;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    InternalPost : Boolean; override;

        function InsertaSolicitud : Boolean;
        function CancelaSolicitud : Boolean;
        procedure LeeInterCampos;
      published
      end;

function ObtenSdoDisponible(peID_CTIO_LIQ  : Integer;
                            var psSDO_DISP : Real;
                            peApli : TInterApli) : Boolean;

implementation

{$R *.DFM}

function ObtenSdoDisponible(peID_CTIO_LIQ  : Integer;
                            var psSDO_DISP : Real;
                            peApli : TInterApli) : Boolean;
begin
 // Obtiene el saldo disponible del contrato de liquidación
 psSDO_DISP := 0;
 Result := GetSQLFloat(' SELECT (NVL(SDO_EFE_VIRT,0) - NVL(SDO_BLOQ_VIRT,0) - NVL(SDO_COMP_VIRT,0)) AS SDO_DISP'+coCRLF+
                       ' FROM DV_CONTRATO'+coCRLF+
                       ' WHERE ID_CONTRATO = '+IntToStr(peID_CTIO_LIQ),
                       peApli.DataBaseName, peApli.SessionName, 'SDO_DISP', psSDO_DISP, False );
end;

constructor TCrGaSoLi.Create( AOwner : TComponent );
begin Inherited;
      ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
                ID_SOLICITUD.Caption:='Número de Solicitud';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      NUM_PERIODO :=CreaCampo('NUM_PERIODO',ftFloat,tsNinguno,tsNinguno,True);
                NUM_PERIODO.Caption:='Número Periodo';
      CVE_TIPO_LIQ :=CreaCampo('CVE_TIPO_LIQ',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_LIQ.Caption:='Clave de Tipo Liq';
      IMP_SOLICITAR_OR :=CreaCampo('IMP_SOLICITAR_OR',ftFloat,tsNinguno,tsNinguno,True);
                IMP_SOLICITAR_OR.Caption:='Imp Solicitar Or';
      IMP_SOLICITAR :=CreaCampo('IMP_SOLICITAR',ftFloat,tsNinguno,tsNinguno,True);
                IMP_SOLICITAR.Caption:='Imp Solicitar';
      IMP_APLICADO :=CreaCampo('IMP_APLICADO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_APLICADO.Caption:='Imp Aplicado';
      CVE_OPERATIVA :=CreaCampo('CVE_OPERATIVA',ftString,tsNinguno,tsNinguno,True);
                CVE_OPERATIVA.Caption:='Clave de Operativa';
      IMP_ADEUDO_CAP := CreaCampo('IMP_ADEUDO_CAP',ftFloat,tsNinguno,tsNinguno,True);
                IMP_ADEUDO_CAP.Caption:='Imp Adeudo_cap';
      IMP_ADEUDO_INT := CreaCampo('IMP_ADEUDO_INT',ftFloat,tsNinguno,tsNinguno,True);
                IMP_ADEUDO_INT.Caption:='Imp Adeudo_int';
      IMP_ADEUDO_COM := CreaCampo('IMP_ADEUDO_COM',ftFloat,tsNinguno,tsNinguno,True);
                IMP_ADEUDO_COM.Caption:='Imp Adeudo_com';
      IMP_ADEUDO_FIN := CreaCampo('IMP_ADEUDO_FIN',ftFloat,tsNinguno,tsNinguno,True);
                IMP_ADEUDO_FIN.Caption:='Imp Adeudo_fin';
      IMP_ADEUDO_MOR := CreaCampo('IMP_ADEUDO_MOR',ftFloat,tsNinguno,tsNinguno,True);
                IMP_ADEUDO_MOR.Caption:='Imp Mora_cap';
      PCT_APLICADO :=CreaCampo('PCT_APLICADO',ftFloat,tsNinguno,tsNinguno,True);
                PCT_APLICADO.Caption:='Pct Aplicado';
      F_APLICACION :=CreaCampo('F_APLICACION',ftDate,tsNinguno,tsNinguno,True);
                F_APLICACION.Caption:='Fecha Aplicacion';
      SIT_GAR_SOL_LIQ :=CreaCampo('SIT_GAR_SOL_LIQ',ftString,tsNinguno,tsNinguno,True);
                SIT_GAR_SOL_LIQ.Caption:='Situación Gar Sol Liq';
      TX_COMENTARIO :=CreaCampo('TX_COMENTARIO',ftString,tsNinguno,tsNinguno,True);
                TX_COMENTARIO.Caption:='Comentario';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      F_SOLICITUD :=CreaCampo('F_SOLICITUD',ftString,tsNinguno,tsNinguno,False); // Debe ser True
                F_SOLICITUD.Caption:='Fecha de Solicitud';

      FKeyFields.Add('ID_SOLICITUD');
      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('NUM_PERIODO');

      With CVE_TIPO_LIQ do
      begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add('IP');
        ComboLista.Add('1'); ComboDatos.Add('LD');
      end;

      With SIT_GAR_SOL_LIQ do
      begin
        Size:=3;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_LQ);
        ComboLista.Add('2'); ComboDatos.Add(CSIT_CA);
      end;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.Active := True;
      Credito.FieldByName('ID_CREDITO').MasterField := 'ID_CREDITO';
      Credito.ShowAll := True;

      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);

      IMP_GTIA_DISPON :=CreaCampo('IMP_GTIA_DISPON',ftFloat,tsNinguno,tsNinguno,False);       
      ID_CONTROL_EXT   := CreaCampo('ID_CONTROL_EXT',ftString,tsNinguno,tsNinguno,False);
      NOM_ACREDITADO   := CreaCampo('NOM_ACREDITADO',ftString,tsNinguno,tsNinguno,False);
      CVE_OPERATIVA    := CreaCampo('CVE_OPERATIVA',ftString,tsNinguno,tsNinguno,False);
      PCT_GTIA_LIQ     := CreaCampo('PCT_GTIA_LIQ',ftFloat,tsNinguno,tsNinguno,False);
      PCT_GTIA_LIQ_IN  := CreaCampo('PCT_GTIA_LIQ_IN',ftFloat,tsNinguno,tsNinguno,False);
      PCT_GTIA_FEGA_EF := CreaCampo('PCT_GTIA_FEGA_EF',ftFloat,tsNinguno,tsNinguno,False);
      PCT_GTIA_FEGA_NO := CreaCampo('PCT_GTIA_FEGA_NO',ftFloat,tsNinguno,tsNinguno,False);

      TableName := 'CR_GA_SOL_LIQ';
      UseQuery := True;
      HelpFile := 'IntCrGaSoLi.Hlp';

      m_nID_CREDITO  := 0;
      m_nNUM_PERIODO := 0;
end;

Destructor TCrGaSoLi.Destroy;
begin
   If Assigned(Credito) Then Credito.Free;
  inherited;
end;

function TCrGaSoLi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGaSolLiq;
begin
   W:=TWCrGaSolLiq.Create(Self);
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


Function TCrGaSoLi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrGaSL.it','F,F,F');
      Try if Active then begin T.Param(0,ID_SOLICITUD.AsString);
                               T.Param(1,ID_CREDITO.AsString);
                               T.Param(2,NUM_PERIODO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;

procedure TCrGaSoLi.LeeInterCampos;
begin
 If (Modo = moAppend) Then
  Begin
  ID_CREDITO.GetFromControl;
  NUM_PERIODO.GetFromControl;
  CVE_TIPO_LIQ.GetFromControl;
  IMP_ADEUDO_CAP.GetFromControl;
  PCT_APLICADO.GetFromControl;
  IMP_SOLICITAR_OR.GetFromControl;
  IMP_SOLICITAR.GetFromControl;
  IMP_GTIA_DISPON.GetFromControl;
  IMP_APLICADO.GetFromControl;
  F_APLICACION.GetFromControl;
  TX_COMENTARIO.GetFromControl;
  End;
end;

function TCrGaSoLi.InternalPost : Boolean;
begin
 Result := True; // Si Hubo Error
 If (Modo = moAppend) Then
    Try
     Result := InsertaSolicitud; // No Hubo Error
    Except
      On e: exception do
      Begin
       Beep;Beep;Beep;Beep;
       ShowMessage('Problemas con el Alta de la Solicitud. Avise a Sistemas');
       ShowMessage(e.Message);
      End;
     End
  Else
   Result := Inherited InternalPost;     
End;

function TCrGaSoLi.InsertaSolicitud : Boolean;
var stpSolicitud : TStoredProc;
begin
   Result := True;
   stpSolicitud := TStoredProc.Create(Nil);
   With stpSolicitud Do
    Try
        DatabaseName := Apli.DataBaseName;
        SessionName := Apli.SessionName;
        StoredProcName := 'PKGCRCREDITOO1.STP_ALTA_SOL_LIQ';

        Params.Clear;
        Params.CreateParam(ftInteger,'PEID_CREDITO',ptInput);
        Params.CreateParam(ftInteger,'PENUM_PERIODO',ptInput);
        Params.CreateParam(ftString,'PECVE_TIPO_LIQ',ptInput);
        Params.CreateParam(ftFloat,'PEIMP_ADEUDO_CAP',ptInput);
        Params.CreateParam(ftFloat,'PEIMP_SOLICITAR',ptInput);
        Params.CreateParam(ftFloat,'peIMP_ADEUDO_FIN',ptInput);
        Params.CreateParam(ftFloat,'peIMP_ADEUDO_INT',ptInput);
        Params.CreateParam(ftFloat,'peIMP_ADEUDO_COM',ptInput);
        Params.CreateParam(ftFloat,'PEIMP_SOLICITAR_OR',ptInput);
        Params.CreateParam(ftFloat,'PEPCT_APLICADO',ptInput);
        Params.CreateParam(ftInteger,'PESID_SOLICITUD',ptInputOutput);
        Params.CreateParam(ftString,'PETX_COMENTARIO',ptInputOutput);
        Params.CreateParam(ftDate,'PEF_ALTA',ptInput);
        Params.CreateParam(ftString,'PECVE_USU_ALTA',ptInput);
        Params.CreateParam(ftString,'PEB_COMMIT',ptInput);
        Params.CreateParam(ftString,'psSIT_GAR_SOL_LIQ',ptOutput);
        Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTX_RESULTADO',ptOutput);

        LeeInterCampos;
        ParamByName('PEID_CREDITO').AsInteger     := ID_CREDITO.AsInteger;
        ParamByName('PENUM_PERIODO').AsInteger    := NUM_PERIODO.AsInteger;
        ParamByName('PECVE_TIPO_LIQ').AsString    := CVE_TIPO_LIQ.AsString;
        ParamByName('PEIMP_ADEUDO_CAP').AsFloat   := IMP_ADEUDO_CAP.AsFloat;
        ParamByName('peIMP_ADEUDO_FIN').AsFloat   := IMP_ADEUDO_FIN.AsFloat;
        ParamByName('peIMP_ADEUDO_INT').AsFloat   := IMP_ADEUDO_INT.AsFloat;
        ParamByName('peIMP_ADEUDO_COM').AsFloat   := IMP_ADEUDO_COM.AsFloat;
        ParamByName('PEIMP_SOLICITAR').AsFloat    := IMP_SOLICITAR.AsFloat;
        ParamByName('PEIMP_SOLICITAR_OR').AsFloat := IMP_SOLICITAR_OR.AsFloat;
        ParamByName('PEPCT_APLICADO').AsFloat     := PCT_APLICADO.AsFloat;
        ParamByName('PEF_ALTA').AsDate            := Apli.DameFechaEmpresa;
        ParamByName('PECVE_USU_ALTA').AsString    := Apli.Usuario;
        ParamByName('PETX_COMENTARIO').AsString   := TX_COMENTARIO.AsString;
        ParamByName('PEB_COMMIT').AsString        := CVERDAD;
        ExecProc;

        If (ParamByName('PSRESULTADO').AsInteger = 0) Then
         Begin
         ID_SOLICITUD.AsInteger := ParamByName('PESID_SOLICITUD').AsInteger;
         SIT_GAR_SOL_LIQ.AsString := ParamByName('PSSIT_GAR_SOL_LIQ').AsString;
         Result := False;
         End
        Else
         Begin
         ShowMessage(ParamByName('PSTX_RESULTADO').AsString);
         Active := False;
         End;
    Finally
     stpSolicitud.Free;
   End;
end;

function TCrGaSoLi.CancelaSolicitud : Boolean;
var stpCancelaSolicitud : TStoredProc;
begin
   Result := False;
   If Active Then
     Begin
       stpCancelaSolicitud := TStoredProc.Create(Nil);
       With stpCancelaSolicitud Do
        Try
          DatabaseName := Apli.DataBaseName;
          SessionName := Apli.SessionName;
          StoredProcName := 'PKGCRCREDITOO1.STP_CANC_SOL_LIQ';

          Params.Clear;
          Params.CreateParam(ftInteger,'PEID_SOLICITUD',ptInput);
          Params.CreateParam(ftString,'peCVE_USU_MODIFICA',ptInput);
          Params.CreateParam(ftDate,'peF_MODIFICA',ptInput);
          Params.CreateParam(ftString,'PEB_COMMIT',ptInput);
          Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTX_RESULTADO',ptOutput);

          ParamByName('PEID_SOLICITUD').AsInteger := ID_SOLICITUD.AsInteger;
          ParamByName('peCVE_USU_MODIFICA').AsString := Apli.Usuario;
          ParamByName('peF_MODIFICA').AsDate := Apli.DameFechaEmpresa;
          ParamByName('PEB_COMMIT').AsString := CVERDAD;
          ExecProc;

          If (ParamByName('PSRESULTADO').AsInteger <> 0) Then
           Begin
           ShowMessage(ParamByName('PSTX_RESULTADO').AsString);
           Result := True;
           End;

        Finally
          stpCancelaSolicitud.Free;
        End;
     End;
end;

(***********************************************FORMA CR_GA_SOL_LIQ********************)
(*                                                                              *)
(*  FORMA DE CR_GA_SOL_LIQ                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_SOL_LIQ********************)

procedure TWCrGaSolLiq.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_SOLICITUD.Control     := edID_SOLICITUD;
  ID_CREDITO.Control       := edID_CREDITO;
  NUM_PERIODO.Control      := edNUM_PERIODO;
  IMP_SOLICITAR.Control    := edIMP_SOLICITAR;
  IMP_APLICADO.Control     := edIMP_APLICADO;
  IMP_ADEUDO_CAP.Control   := edIMP_ADEUDO_CAP;
  PCT_APLICADO.Control     := edPCT_APLICADO;
  F_APLICACION.Control     := edF_APLICACION;
  F_ALTA.Control           := edF_ALTA;
  CVE_USU_ALTA.Control     := edCVE_USU_ALTA;
  F_MODIFICA.Control       := edF_MODIFICA;
  CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;
  IMP_GTIA_DISPON.Control  := edIMP_GTIA_DISPON;
  CVE_TIPO_LIQ.Control     := rgCVE_TIPO_LIQ;
  SIT_GAR_SOL_LIQ.Control  := rgSIT_GAR_SOL_LIQ;
  TX_COMENTARIO.Control    := memTX_COMENTARIO;
  F_SOLICITUD.Control      := edF_SOLICITUD;

  // Variables que no Forma parte de la tabla principal
  ID_CONTROL_EXT.Control     := edID_CONTROL_EXT;
  NOM_ACREDITADO.Control     := edNOM_ACREDITADO;
  CVE_OPERATIVA.Control      := edCVE_OPERATIVA;
  PCT_GTIA_FEGA_EF.Control   := edPCT_GTIA_FEGA_EF;
  PCT_GTIA_FEGA_NO.Control   := edPCT_GTIA_FEGA_NO;

  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  Interforma1.MsgPanel := MsgPanel;
  Credito.ID_CONTROL_EXT.Control := edID_CONTROL_EXT;
  Credito.ID_CRED_EXTERNO.Control := edID_CRED_EXTERNO;

  MuestraDatos;
  End;
end;

procedure TWCrGaSolLiq.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_SOLICITUD.Control     := Nil;
  ID_CREDITO.Control       := Nil;
  NUM_PERIODO.Control      := Nil;
  IMP_SOLICITAR.Control    := Nil;
  IMP_APLICADO.Control     := Nil;
  IMP_ADEUDO_CAP.Control   := Nil;
  PCT_APLICADO.Control     := Nil;
  F_APLICACION.Control     := Nil;
  F_ALTA.Control           := Nil;
  CVE_USU_ALTA.Control     := Nil;
  F_MODIFICA.Control       := Nil;
  CVE_USU_MODIFICA.Control := Nil;
  IMP_GTIA_DISPON.Control  := Nil;
  CVE_TIPO_LIQ.Control     := Nil;
  SIT_GAR_SOL_LIQ.Control  := Nil;
  TX_COMENTARIO.Control    := Nil;
  F_SOLICITUD.Control      := Nil;

  ID_CONTROL_EXT.Control     := Nil;
  NOM_ACREDITADO.Control     := Nil;
  CVE_OPERATIVA.Control      := Nil;
  PCT_GTIA_FEGA_EF.Control   := Nil;
  PCT_GTIA_FEGA_NO.Control   := Nil;

  Credito.ID_CONTROL_EXT.Control := Nil;
  Credito.ID_CRED_EXTERNO.Control := Nil;
  Interforma1.MsgPanel := Nil;
  End;
end;

procedure TWCrGaSolLiq.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrGaSolLiq.ClearAlignGrid(StringAlignGrid : TStringAlignGrid; nStartRow : Integer = 1);
var I, J : Integer;
begin
 If Assigned(StringAlignGrid) Then
  With StringAlignGrid Do
   For I := nStartRow To RowCount-1 Do
    Begin
    RowHeights[I] := DefaultRowHeight;
    For J := 0 To ColCount-1 Do
       Cells[J,I] := '';
    End ;
end;

function TWCrGaSolLiq.Obten_y_MuestraOperativa(peID_CREDITO : Integer) : Boolean;
var vlQry : TQuery;
    vlID_CONTRATO : Integer;
    vlstrSQL, vlCVE_OPERATIVA : String;
begin
  // Inicia Variables
  Result := False; vlCVE_OPERATIVA := ''; 
  Objeto.CVE_OPERATIVA.AsString    := '';
  Objeto.PCT_GTIA_LIQ.AsFloat      := 0;
  Objeto.PCT_GTIA_LIQ_IN.AsFloat   := 0;
  Objeto.PCT_GTIA_FEGA_EF.AsFloat  := 0;
  Objeto.PCT_GTIA_FEGA_NO.AsFloat  := 0;

  vlstrSQL := 'SELECT ID_CONTRATO, CVE_OPERATIVA FROM CR_CREDITO WHERE ID_CREDITO = '+IntToStr(peID_CREDITO);

  // Valida si la disposición tiene Clave de Operativa
  vlQry := GetSqlQuery(vlstrSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, False);
  If Assigned(vlQry) Then
   Begin
     With vlQry Do
      Try
       vlID_CONTRATO   := FieldByName('ID_CONTRATO').AsInteger;
       vlCVE_OPERATIVA := FieldByName('CVE_OPERATIVA').AsString;
       If (Trim(vlCVE_OPERATIVA) = '') Then
         Begin
         MessageDlg(' La disposición '+IntToStr(peID_CREDITO)+' no tiene clave de Operativa. Favor de Verificar con Operación.',
                    mtError, [mbOk], 0);
         Exit;
         End;
      Finally
       vlQry.SQL.Clear;
       vlQry.Free;
      End; // End Try
   End // End If Assigned(vlQry) Then
  Else
   Begin
   MessageDlg(' Problemas al obtener la clave de Operativa. Favor de avisar a Sistemas.', mtError, [mbOk], 0);
   Exit;
   End;

  // Obtiene los porcentajes de la Operativa
  vlstrSQL :=  ' SELECT CTO.ID_CONTRATO,'+coCRLF+
               '        CC.ID_CREDITO,'+coCRLF+
               '        CC.SIT_CREDITO,'+coCRLF+
               '        CC.CVE_OPERATIVA,'+coCRLF+
               '        CGFC.PCT_GTIA_LIQ,'+coCRLF+
               '        NVL(PKGCRCREDITOO1.OBTEQUIVALENCIA( 1,'+coCRLF+
               '                                           CTO.CVE_MONEDA,'+coCRLF+
               '                                           CC.CVE_OPERATIVA,'+coCRLF+
               '                                           CGFC.PCT_GTIA_LIQ'+coCRLF+
               '                                           ),0) AS PCT_GTIA_LIQ_IN,'+coCRLF+
               '        NVL(PKGCRCREDITOO1.OBTEQUIVALENCIA( 2,'+coCRLF+
               '                                           CTO.CVE_MONEDA,'+coCRLF+
               '                                           CC.CVE_OPERATIVA,'+coCRLF+
               '                                           CGFC.PCT_GTIA_LIQ'+coCRLF+
               '                                           ),0) AS PCT_GTIA_FEGA_EF,'+coCRLF+
               '        NVL(PKGCRCREDITOO1.OBTEQUIVALENCIA( 3,'+coCRLF+
               '                                           CTO.CVE_MONEDA,'+coCRLF+
               '                                           CC.CVE_OPERATIVA,'+coCRLF+
               '                                           CGFC.PCT_GTIA_LIQ'+coCRLF+
               '                                           ),0) AS PCT_GTIA_FEGA_NO'+coCRLF+
               ' FROM CR_CREDITO CC,'+coCRLF+
               '      CONTRATO CTO,'+coCRLF+
               '      ( SELECT ID_CONTRATO, CVE_OPERATIVA, PCT_GTIA_LIQ'+coCRLF+
               '        FROM CR_GA_FIRA_CTO WHERE SIT_GA_FIRA = ''AC'''+coCRLF+
               '      ) CGFC'+coCRLF+
               ' WHERE CC.ID_CREDITO = '+IntToStr(peID_CREDITO)+coCRLF+
               '   AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
               '   AND CGFC.ID_CONTRATO (+)= CC.ID_CONTRATO'+coCRLF+
               '   AND CGFC.CVE_OPERATIVA (+)= CC.CVE_OPERATIVA'+coCRLF;

  vlQry := GetSqlQuery(vlstrSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, False);
  If Assigned(vlQry) Then
   With vlQry Do
    Try
     Objeto.CVE_OPERATIVA.AsString   := FieldByName('CVE_OPERATIVA').AsString;
     Objeto.PCT_GTIA_LIQ.AsFloat     := FieldByName('PCT_GTIA_LIQ').AsFloat;
     Objeto.PCT_GTIA_LIQ_IN.AsFloat  := FieldByName('PCT_GTIA_LIQ_IN').AsFloat;
     Objeto.PCT_GTIA_FEGA_EF.AsFloat := FieldByName('PCT_GTIA_FEGA_EF').AsFloat;
     Objeto.PCT_GTIA_FEGA_NO.AsFloat := FieldByName('PCT_GTIA_FEGA_NO').AsFloat;

     // Asigna el Porcentaje a Aplicar de Gtía. Líquida
     If (Objeto.Modo = moAppend) Then
      Objeto.PCT_APLICADO.AsFloat := Objeto.PCT_GTIA_LIQ.AsFloat;

    Result := True;  
    Finally
     vlQry.SQL.Clear;
     vlQry.Free;
    End // End Try
   // End With
  Else
   Begin
    MessageDlg('Problemas al Obtener los porcentajes de la Operativa '+vlCVE_OPERATIVA+' de la línea '+IntToStr(vlID_CONTRATO)+
               ' con Disposición '+IntToStr(peID_CREDITO), mtError, [mbOk], 0
               );
   End;
end;

function TWCrGaSolLiq.Obten_y_MuestraContratos(peID_CREDITO : Integer) : Boolean;
var vlstrSQL : String;
    vlQry : TQuery;
    vlnRow : Integer;
    vlIMP_GTIA_DISPON : Real;
begin
 With Objeto Do
   Begin
    // Inicializa Variables
    vlnRow := 0; vlIMP_GTIA_DISPON := 0;
    ClearAlignGrid(strAlgnGrdCto,0);
    strAlgnGrdCto.RowCount := 0;

   // Si el Porcentaje de Garantía Liquida a usar, es menor o igual a 0, no trae los saldos
   If (PCT_GTIA_LIQ.AsFloat <= 0 ) Then
    Exit;

   vlstrSQL :=

              '    SELECT ''PRLV (Efec.)'' AS TITULO,'+coCRLF+
              '           CTOLIQ.ID_CONTRATO AS CTO_DEPOSITO,'+coCRLF+
              '           SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITULAR(NULL,NULL,CTOLIQ.ID_TITULAR),1,255) AS NOM_TIT_DEPOSITO,'+coCRLF+
              '           DVC.SDO_DISP AS IMP_VALUACION'+coCRLF+
              '    FROM CONTRATO CTO,'+coCRLF+
              '         CONTRATO CTOLIQ,'+coCRLF+
              '         ( SELECT ID_CREDITO, ID_CONTRATO, ID_PAGARE FROM CR_REL_PAG_DISP'+coCRLF+
              '           WHERE ID_CREDITO = '+IntToStr(peID_CREDITO)+coCRLF+
              '             AND SIT_REL_PAG_DISP = ''AC'' '+coCRLF+
              '         ) CRPD,'+coCRLF+
              '         ('+coCRLF+
              '          SELECT ID_CONTRATO, (NVL(SDO_EFE_VIRT,0) - NVL(SDO_BLOQ_VIRT,0) - NVL(SDO_COMP_VIRT,0)) AS SDO_DISP'+coCRLF+
              '          FROM DV_CONTRATO'+coCRLF+
              '         ) DVC'+coCRLF+
              '    WHERE CTO.ID_CONTRATO = CRPD.ID_CONTRATO -- Contrato otorgante PRLV'+coCRLF+
              '      AND CTOLIQ.ID_CONTRATO = CTO.ID_CTO_LIQ -- Contrato de depósito'+coCRLF+
              '      AND DVC.ID_CONTRATO = CTO.ID_CTO_LIQ'+coCRLF+
              ' UNION ALL'+coCRLF+
              '    -- Obtiene lo que se encuentra en Caución Bursátil'+coCRLF+
              '    SELECT ''CAUCIÓN'' AS TITULO,'+coCRLF+
              '           SDCR.ID_CONTRATO,'+coCRLF+
              '           SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITULAR(NULL,SDCR.ID_CONTRATO,NULL),1,255) AS NOM_TIT_OTORGANTE,'+coCRLF+
              '           ROUND( NVL(PKGFUNPROCCORP.PRECIOMERCADO(PKGCRACTUALIZA.STPD000,'+coCRLF+
              '                      SDCR.EMISORA, SDCR.SERIE, SDCR.TIPO_VALOR),0) * SDCR.NUM_TITULOS_VIRT, 2) AS IMP_VALUACION'+coCRLF+
              '    FROM  ( SELECT ID_CONTRATO, ID_REFERENCIA, NUM_TITULOS_VIRT,'+coCRLF+
              '                    EMISORA, SERIE, TIPO_VALOR'+coCRLF+
              '             FROM SB_DET_CART_REF'+coCRLF+
              '             WHERE CVE_DIA_LIQUIDA = ''D000'''+coCRLF+
              '               AND CVE_TIP_POSIC = ''GTCR'''+coCRLF+
              '               AND NUM_TITULOS_VIRT > 0'+coCRLF+
              '               AND ID_REFERENCIA = '+IntToStr(peID_CREDITO)+coCRLF+
              '          ) SDCR,'+coCRLF+
              '          ( SELECT GPE.ID_CONTRATO, GPE.ID_CTO_EXTERNO, GPE.EMISORA,'+coCRLF+
              '                   GPE.SERIE, GPE.TIPO_VALOR'+coCRLF+
              '            FROM GAR_PROP_EMIS GPE,'+coCRLF+
              '                 CR_CREDITO CC'+coCRLF+
              '            WHERE CC.ID_CREDITO = '+IntToStr(peID_CREDITO)+coCRLF+
              '              AND GPE.ID_CTO_EXTERNO = CC.ID_CREDITO'+coCRLF+
              '          ) GPE'+coCRLF+
              '    WHERE SDCR.ID_CONTRATO = GPE.ID_CONTRATO'+coCRLF+
              '      AND SDCR.ID_REFERENCIA = GPE.ID_CTO_EXTERNO'+coCRLF+
              '      AND SDCR.EMISORA = GPE.EMISORA'+coCRLF+
              '      AND SDCR.SERIE = GPE.SERIE'+coCRLF+
              '      AND SDCR.TIPO_VALOR = GPE.TIPO_VALOR'+coCRLF+
              '  UNION ALL'+coCRLF+
              '    -- Obtiene lo que se encuentra en Inversión de Pagarés'+coCRLF+
              '    SELECT ''PRLV'' AS TITULO,'+coCRLF+
              '           CRPD.ID_CONTRATO AS ID_CONTRATO,'+coCRLF+
              '           SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITULAR(NULL,NULL,CTO.ID_TITULAR),1,255) AS NOM_TIT_OTORGANTE,'+coCRLF+
              '           IP.IMP_NETO_VTO AS IMP_VALUACION'+coCRLF+
              '    FROM ( SELECT ID_CREDITO, ID_CONTRATO, ID_PAGARE FROM CR_REL_PAG_DISP'+coCRLF+
              '           WHERE ID_CREDITO = '+IntToStr(peID_CREDITO)+coCRLF+
              '             AND SIT_REL_PAG_DISP = ''AC'''+coCRLF+
              '         ) CRPD, -- Vínculos Activos de Pagaré-Disposición'+coCRLF+
              '         ( SELECT IP.ID_CONTRATO, IP.ID_PAGARE, IP.IMP_NETO_VTO'+coCRLF+
              '           FROM INV_PAGARE IP,'+coCRLF+
              '             ( SELECT ID_EMPRESA_PRLV, ID_SUCURSAL_PRLV FROM CR_PARAMETRO'+coCRLF+
              '               WHERE CVE_PARAMETRO = ''CRE'''+coCRLF+
              '             ) CP -- Parametros de PRLV'+coCRLF+
              '            WHERE IP.ID_EMPRESA = CP.ID_EMPRESA_PRLV'+coCRLF+
              '              AND IP.ID_SUCURSAL = CP.ID_SUCURSAL_PRLV'+coCRLF+
              '              AND IP.CVE_SIT_PAGARE = ''AC'''+coCRLF+
              '         ) IP,'+coCRLF+
              '         CONTRATO CTO'+coCRLF+
              '    WHERE IP.ID_CONTRATO = CRPD.ID_CONTRATO'+coCRLF+
              '      AND IP.ID_PAGARE = CRPD.ID_PAGARE'+coCRLF+
              '      AND CTO.ID_CONTRATO = CRPD.ID_CONTRATO'+coCRLF+


   '  UNION ALL'+coCRLF+
   '  SELECT ''CHQRA.'' AS TITULO,'+coCRLF+
   '         TO_NUMBER(CCC.CUENTA_BANCO) AS CTO_DEPOSITO,'+coCRLF+
   '         SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITULAR(NULL,NULL,CCC.ID_ACREDITADO),1,255) AS NOM_TIT_DEPOSITO,'+coCRLF+
   '         PKGCRCOMUN.STPOBTENSDOCHQRA(TO_NUMBER(CCC.CUENTA_BANCO)) AS IMP_VALUACION'+coCRLF+
   '  FROM CR_CRED_CHEQ CCC,'+coCRLF+
   '       ( SELECT CTO.ID_TITULAR'+coCRLF+
   '         FROM CR_CREDITO CC, CONTRATO CTO'+coCRLF+
   '         WHERE CC.ID_CREDITO = '+IntToStr(peID_CREDITO)+coCRLF+
   '           AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
   '       ) ACREDITADO'+coCRLF+
   '  WHERE CCC.ID_ACREDITADO = ACREDITADO.ID_TITULAR'+coCRLF+
   '    AND CCC.CVE_TIPO_CHEQ = ''AD'''+coCRLF+
   '    AND CCC.SIT_CHEQUERA = ''AC'''+coCRLF+
   '    AND CCC.ID_BANCO_CHQRA = 2'+coCRLF+
   ' '+coCRLF+
   '  UNION ALL'+coCRLF+

   ' SELECT NULL AS TITULO,'+coCRLF+
   '        0 AS CTO_DEPOSITO,'+coCRLF+
   '        ''SOLICITUD LIQUIDA '' || CGSL.ID_SOLICITUD AS NOM_TIT_DEPOSITO,'+coCRLF+
   '        (CGSL.IMP_SOLICITAR * -1) AS IMP_VALUACION'+coCRLF+
   ' FROM CR_GA_SOL_LIQ CGSL,'+coCRLF+
   '       (   SELECT CC.*'+coCRLF+
   '           FROM CR_CREDITO CC,'+coCRLF+
   '                ( -- Obtiene las Autorizaciones del Acreditado'+coCRLF+
   '                  SELECT CTO.ID_CONTRATO'+coCRLF+
   '                  FROM CONTRATO CTO,'+coCRLF+
   '                      (  -- Obtiene el Acreditadp'+coCRLF+
   '                         SELECT CTO.ID_TITULAR'+coCRLF+
   '                         FROM CONTRATO CTO,'+coCRLF+
   '                              ( SELECT ID_CONTRATO FROM CR_CREDITO'+coCRLF+
   '                                WHERE ID_CREDITO = '+IntToStr(peID_CREDITO)+coCRLF+
   '                                   AND SIT_CREDITO <> ''CA'''+coCRLF+
   '                              ) CC'+coCRLF+
   '                         WHERE CC.ID_CONTRATO = CTO.ID_CONTRATO'+coCRLF+
   '                      ) ACREDITADO'+coCRLF+
   '                 WHERE CTO.ID_TITULAR = ACREDITADO.ID_TITULAR'+coCRLF+
   '                ) AUTORIZACIONES'+coCRLF+
   '           WHERE CC.ID_CONTRATO = AUTORIZACIONES.ID_CONTRATO'+coCRLF+
   '             AND CC.SIT_CREDITO = ''AC'''+coCRLF+
   '       ) CREDITOS_DEL_ACRED'+coCRLF+
   '  WHERE CGSL.ID_CREDITO = CREDITOS_DEL_ACRED.ID_CREDITO'+coCRLF+
   '    AND CGSL.SIT_GAR_SOL_LIQ = ''AC'''+coCRLF+
   '    AND CGSL.IMP_SOLICITAR > 0'+coCRLF+
   '    AND CGSL.ID_CREDITO NOT IN ('+IntToStr(peID_CREDITO)+')'+coCRLF+
   ' '+coCRLF
   ;
              {
              '  UNION ALL'+coCRLF+
              '    SELECT'+coCRLF+
              '     '+SqlStr(CO_CHEQUERA)+' AS TITULO,'+coCRLF+
              '     TEMP.CHEQUERA AS CTO_DEPOSITO,'+coCRLF+
              '     SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITULAR(NULL,TEMP.CHEQUERA,NULL),1,255) AS NOM_TIT_DEPOSITO,'+coCRLF+
              '     PKGCRCOMUN.STPOBTENSDOCHQRA(TEMP.CHEQUERA) AS IMP_VALUACION'+coCRLF+
              '     FROM ('+coCRLF+
              '       SELECT PKGCRCOMUN.CTABCO_TO_CHQRA('+coCRLF+
              '                       PKGCRPERIODO.STPObtChqCte('+coCRLF+
              '                        CTO.ID_TITULAR,'+coCRLF+
              '                        NVL( CE.CVE_EMISOR_NAFIN,'+coCRLF+
              '                               NVL( PROCAM.CVE_SUB_DIVISION, ''0''  ) ), CC.ID_CREDITO,'+coCRLF+
              '                               DECODE( NVL( PROCAM.CVE_SUB_DIVISION, ''NULL'' ), ''NULL'', ''AC'', ''AP'' ),'+coCRLF+
              '                           ''AD'', ''CR'' ) ) AS CHEQUERA'+coCRLF+
              '         FROM CR_CREDITO CC,'+coCRLF+
              '              CR_CESION CE,'+coCRLF+
              '              CR_PROCAMPO PROCAM,'+coCRLF+
              '              CONTRATO CTO'+coCRLF+
              '         WHERE CC.ID_CREDITO = '+IntToStr(peID_CREDITO)+coCRLF+
              '           AND CE.ID_CESION (+)= CC.ID_CREDITO'+coCRLF+
              '           AND PROCAM.ID_CREDITO(+) = CC.ID_CREDITO'+coCRLF+
              '           AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
              ' UNION ALL'+coCRLF+
              '         SELECT '+SQLStr(CO_SOLLIQ)+' AS TITULO,'+coCRLF+
              '                NULL AS CTO_DEPOSITO,'+coCRLF+
              '                ''SOLICITUD GTIA LIQ ''||CGSL.ID_SOLICITUD AS NOM_TIT_DEPOSITO,'+coCRLF+
              '                CGSL.IMP_SOLICITAR * -1 AS IMP_VALUACION'+coCRLF+
              '         FROM CR_GA_SOL_LIQ CGSL'+coCRLF+
              '         WHERE CGSL.ID_CREDITO = 40300'+coCRLF+
              '           AND CGSL.SIT_GAR_SOL_LIQ = ''AC'''+coCRLF+
              '    )  TEMP  '+coCRLF
              }
    vlQry := GetSqlQuery(vlstrSQL, Apli.DatabaseName, Apli.SessionName, False);

    If Assigned(vlQry) Then
     With vlQry Do
      Try
       Last;
       strAlgnGrdCto.RowCount := vlQry.RecordCount;
       TNumericField(FieldByName('IMP_VALUACION')).DisplayFormat  := CO_FORMAT_DINERO_GRID;

       First;
       While Not Eof Do
        Begin
        If ((FieldByName('TITULO').DisplayText = CO_CHEQUERA) Or
             (FieldByName('TITULO').DisplayText =  CO_SOLLIQ)) Then
         Begin
         strAlgnGrdCto.RowHeights[vlnRow] := 2;
         strAlgnGrdCto.RowCount := strAlgnGrdCto.RowCount + 1;
         Inc(vlnRow);
         End;
        strAlgnGrdCto.Cells[CO_COL_TITULO,vlnRow]           := FieldByName('TITULO').DisplayText;
        If (FieldByName('CTO_DEPOSITO').AsFloat > 0) Then
         strAlgnGrdCto.Cells[CO_COL_CTO_DEPOSITO,vlnRow]     := FieldByName('CTO_DEPOSITO').DisplayText;
        strAlgnGrdCto.Cells[CO_COL_NOM_TIT_DEPOSITO,vlnRow] := FieldByName('NOM_TIT_DEPOSITO').DisplayText;
        strAlgnGrdCto.Cells[CO_COL_IMP_VALUACION,vlnRow]    := FieldByName('IMP_VALUACION').DisplayText;
        vlIMP_GTIA_DISPON := vlIMP_GTIA_DISPON + FieldByName('IMP_VALUACION').AsFloat;
        Next; Inc(vlnRow);
        End;

       Result := True;
      Finally
       vlQry.SQL.Clear;
       vlQry.Free;
      End;

   IMP_GTIA_DISPON.AsFloat := vlIMP_GTIA_DISPON;
  End; // With Objeto Do
end;

procedure TWCrGaSolLiq.CalcImportesSolicitud(peID_CREDITO, peNUM_PERIODO : Integer; peCVE_TIPO_LIQ : String);
var StpObtOblOrigPago : TStoredProc;
begin
   // Inicializa Variables
   Objeto.IMP_ADEUDO_CAP.AsFloat := 0;
   Objeto.IMP_ADEUDO_FIN.AsFloat := 0;
   Objeto.IMP_ADEUDO_INT.AsFloat := 0;
   Objeto.IMP_ADEUDO_COM.AsFloat := 0;

   StpObtOblOrigPago := TStoredProc.Create(Nil);
   With StpObtOblOrigPago Do
    Try
      DatabaseName := Objeto.Apli.DataBaseName;
      SessionName := Objeto.Apli.SessionName;
      StoredProcName := 'PKGCRCREDITOO1.STP_OBT_OBL_ORIG_PAGO';
      Params.Clear;

      Params.CreateParam(ftInteger,'peTIPO_METODO',ptInput);
      Params.CreateParam(ftInteger,'peID_CREDITO',ptInput);
      Params.CreateParam(ftInteger,'peCAP_NUM_PERIODO',ptInput);          
      Params.CreateParam(ftString ,'peB_INCLUYE_IVA',ptInput);
      Params.CreateParam(ftFloat,'psIMP_OBL_CAPITAL',ptOutput);
      Params.CreateParam(ftFloat,'psIMP_OBL_FIN_ADIC',ptOutput);
      Params.CreateParam(ftFloat,'psIMP_OBL_INTERES',ptOutput);
      Params.CreateParam(ftFloat,'psIMP_OBL_COMISION',ptOutput);
      Params.CreateParam(ftFloat,'psRESULTADO',ptOutput);
      Params.CreateParam(ftString,'psTX_RESULTADO',ptOutput);

      // Si es por Incumplimiento de Periodo, entonces...
      If (peCVE_TIPO_LIQ = CO_INCUMPLIMIENTO_PERIODO) Then
       ParamByName('peTIPO_METODO').AsInteger := 1
      Else
       ParamByName('peTIPO_METODO').AsInteger := 2;

      // Asigna Valores 
      ParamByName('peID_CREDITO').AsInteger      := peID_CREDITO;
      ParamByName('peCAP_NUM_PERIODO').AsInteger := peNUM_PERIODO;
      ParamByName('peB_INCLUYE_IVA').AsString    := CVERDAD;
      ExecProc;

      If (ParamByName('PSRESULTADO').AsInteger <> 0) Then
       Begin
       ShowMessage(ParamByName('PSTX_RESULTADO').AsString);
       End
      Else
       Begin
       // Asigna los valores obtenidos a los Intercampos
       Objeto.IMP_ADEUDO_CAP.AsFloat := ParamByName('psIMP_OBL_CAPITAL').AsFloat;
       Objeto.IMP_ADEUDO_FIN.AsFloat := ParamByName('psIMP_OBL_FIN_ADIC').AsFloat;
       Objeto.IMP_ADEUDO_INT.AsFloat := ParamByName('psIMP_OBL_INTERES').AsFloat;
       Objeto.IMP_ADEUDO_COM.AsFloat := ParamByName('psIMP_OBL_COMISION').AsFloat;
       Objeto.IMP_SOLICITAR_OR.AsFloat := (Objeto.IMP_ADEUDO_CAP.AsFloat * Objeto.PCT_APLICADO.AsFloat / 100);
       Objeto.IMP_SOLICITAR.AsFloat := Objeto.IMP_SOLICITAR_OR.AsFloat;
       End;

    Finally
      StpObtOblOrigPago.Free;
    End;
end;

procedure TWCrGaSolLiq.InterForma1DespuesNuevo(Sender: TObject);
begin
  If edID_CREDITO.CanFocus Then edID_CREDITO.SetFocus;
  If (Objeto.m_nID_CREDITO > 0) And (Objeto.m_nNUM_PERIODO > 0) Then
    Begin
    Objeto.ID_CREDITO.AsInteger    := Objeto.m_nID_CREDITO;
    Objeto.NUM_PERIODO.AsInteger   := Objeto.m_nNUM_PERIODO;
    Objeto.NOM_ACREDITADO.AsString := Obten_NombreAcreditado(Objeto.m_nID_CREDITO, Objeto.Apli);
    Objeto.Credito.FindKey([Objeto.m_nID_CREDITO]);
    End;
end;

procedure TWCrGaSolLiq.btnBuscaClick(Sender: TObject);
Var T:TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRGASOLI_DISPO',True,True) then
   begin
      T := Objeto.CreaBuscador('ICrGaSL1.it','F,F,F');
      Try
          If T.Execute then
            Begin
            Objeto.ID_CREDITO.AsInteger    := StrToInt(T.DameCampo(0));
            Objeto.NUM_PERIODO.AsInteger   := StrToInt(T.DameCampo(1));
            Objeto.ID_CONTROL_EXT.AsString := T.DameCampo(2);
            Objeto.NOM_ACREDITADO.AsString := T.DameCampo(4);

            If Obten_y_MuestraOperativa(Objeto.ID_CREDITO.AsInteger) Then
             Obten_y_MuestraContratos(Objeto.ID_CREDITO.AsInteger);
            End;
      Finally
       T.Free;
      End;
   end;
end;

procedure TWCrGaSolLiq.rgCVE_TIPO_LIQExit(Sender: TObject);
begin
 InterForma1.ValidaExit(rgCVE_TIPO_LIQ, (rgCVE_TIPO_LIQ.ItemIndex > -1) ,
                        'Favor de Indicar el Tipo de Liquidación a Solicitar.',True);
end;

procedure TWCrGaSolLiq.edIMP_SOLICITARExit(Sender: TObject);
var vlbValido : Boolean;
    vlstrMessage : String;
begin
 vlbValido := True;
 With Objeto Do
  Begin
  LeeInterCampos;

  If (IMP_SOLICITAR.AsFloat < 0) Then
   Begin
   vlbValido := False;
   vlstrMessage := 'El "Importe a Solicitar" no puede ser menor a 0. Verifique.';
   End
  Else If (IMP_SOLICITAR.AsFloat > IMP_GTIA_DISPON.AsFloat) Then
   Begin
   vlbValido := False;
   vlstrMessage := 'El "Importe a Solicitar" no puede ser mayor que el "Total Disponible". Verifique.';
   End;

   // Válida que el importe a solicitar, cubra con el porcentaje de garantía líquida requeirido
   If (IMP_SOLICITAR.AsFloat < IMP_SOLICITAR_OR.AsFloat) Then
    MessageDlg('El importe especificado a solicitar, no cubre el '+Trim(Format(CFORMAT_TASA,[PCT_APLICADO.AsFloat]))+'% de garantía líquida requerido '+
               ' siendo el equivalente a '+Trim(Format(CFORMAT_DINERO,[IMP_SOLICITAR_OR.AsFloat]))+'.'+coCRLF+
               'Favor de verificar antes de continuar.', mtWarning, [mbOk], 0 );

   InterForma1.ValidaExit(edIMP_SOLICITAR, vlbValido, vlstrMessage , True);
  End;
end;

procedure TWCrGaSolLiq.ActualizaImportes;
begin
 With Objeto Do
 If (Modo = moAppend) Then
  Begin
  LeeInterCampos;
  // Obtiene el "Importes de Adeudo (Capital)", el "% Garantía Líquida a usar" y el "Importe a Solicitar"
  CalcImportesSolicitud(ID_CREDITO.AsInteger, NUM_PERIODO.AsInteger, CVE_TIPO_LIQ.AsString);
  End;
end;

procedure TWCrGaSolLiq.btnCancelaClick(Sender: TObject);
var vlID_SOLICITUD, vlID_CREDITO, vlNUM_PERIODO : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRGASOLI_CANC',True,True) then
   begin
      vlID_SOLICITUD := Objeto.ID_SOLICITUD.AsInteger;
      vlID_CREDITO   := Objeto.ID_CREDITO.AsInteger;
      vlNUM_PERIODO  := Objeto.NUM_PERIODO.AsInteger;
      If (MessageDlg('¿Desea Cancelar la Solicitud?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
      If Not Objeto.CancelaSolicitud Then
        ShowMessage('Problemas al Cancelar la Solicitud.')
      Else
        Begin
        Objeto.Active := False;
        Objeto.FindKey([vlID_SOLICITUD, vlID_CREDITO, vlNUM_PERIODO]);
        MessageDlg('Solicitud Cancelada', mtInformation, [mbOk], 0);
        End;
   end;
end;

procedure TWCrGaSolLiq.MuestraDatos;
begin
 With Objeto Do
  Begin
  // Inicializa Valores
  NOM_ACREDITADO.AsString :=  '';
  LeeInterCampos;
  If (ID_CREDITO.AsInteger > 0) Then
   Begin
   NOM_ACREDITADO.AsString := Obten_NombreAcreditado(ID_CREDITO.AsInteger, Apli);
   End;
  // Habilita el botón de Cancela, únicamente cuando se encuentre ("AC" Activa) la solicitud
  btnCancela.Enabled := (SIT_GAR_SOL_LIQ.AsString = CSIT_AC);
  End;
end;

procedure TWCrGaSolLiq.InterForma1Buscar(Sender: TObject);
begin
 With Objeto Do
  Begin
  If InternalBusca Then
   Begin
   MuestraDatos;
   Obten_y_MuestraOperativa(ID_CREDITO.AsInteger);
   Obten_y_MuestraContratos(ID_CREDITO.AsInteger);
   End;
  End;
end;

procedure TWCrGaSolLiq.InterForma1DespuesCancelar(Sender: TObject);
begin
 MuestraDatos;
 Obten_y_MuestraContratos(Objeto.ID_CREDITO.AsInteger);
end;

procedure TWCrGaSolLiq.memTX_COMENTARIOExit(Sender: TObject);
begin
 memTX_COMENTARIO.Text := UpperCase(memTX_COMENTARIO.Text);
 InterForma1.ValidaExit(memTX_COMENTARIO, True, ' ' , True);
end;

procedure TWCrGaSolLiq.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlstrMessage : String;
    mrResult : Word;
begin
 If IsNewData then vlstrMessage := '¿Desea almacenar los datos capturados?'
 Else vlstrMessage := '¿Desea guardar los datos modificados?';
 mrResult := MessageDlg(vlstrMessage, mtConfirmation, [mbYes, mbNo], 0);
 Realizado := mrResult = mrYes;
 With Objeto Do
   If (mrResult = mrYes) Then
    If (IsNewData) Then
     Begin
     F_ALTA.AsDateTime     := Apli.DameFechaEmpresa;
     CVE_USU_ALTA.AsString := Apli.Usuario;
     End
    Else
     Begin
     F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresa;
     CVE_USU_MODIFICA.AsString := Apli.Usuario;
     End;
end;

procedure TWCrGaSolLiq.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
 Objeto.Active := False;
 ClearAlignGrid(strAlgnGrdCto,0);
end;

procedure TWCrGaSolLiq.btnBuscaExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edID_CREDITO, (Trim(edID_CREDITO.Text) <> '') And (Trim(edNUM_PERIODO.Text) <> '') ,
                        'Favor de indicar el "Crédito" y el "Periodo".',True);
end;

procedure TWCrGaSolLiq.edF_SOLICITUDExit(Sender: TObject);
begin
{ InterForma1.ValidaExit(edF_SOLICITUD, (Trim(edF_SOLICITUD.Text) <> ''),
                        'Favor de indicar la Fecha de Solicitud.',True); }
end;

procedure TWCrGaSolLiq.rgCVE_TIPO_LIQClick(Sender: TObject);
begin
 ActualizaImportes;
end;

end.
