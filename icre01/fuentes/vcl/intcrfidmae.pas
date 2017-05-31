// Sistema         : Clase de CR_FIDEICOMISO_MAESTRO
// Fecha de Inicio : 19/07/2005
// Función forma   : Clase de CR_FIDEICOMISO_MAESTRO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrFidMae;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, Grids, Aligrid,
IntLinkit,

IntParamCre,
IntGenCre,
IntSICC,
IntInter,     // Intermediarios
IntCrFidReg,  // Reglas para Emisión Solicitudes Fideicomisos
IntCrFidDele, // Catálogo Delegado Fiduciario
IntCrFidFide  // Alta de Fideicomisario
;

const
  // Mensajes
  CO_MSG_SELECCIONAR = 'Debe de seleccionar primero un Fideicomiso Maestro para poder continuar...';

  // Columnas de Fideicomisarios  
  CO_COL_ID_FID_FIDECOM   = 0;
  CO_COL_TX_NUM_LUGAR     = 1;
  CO_COL_NOM_FIDEICOMISAR = 2;

  // Columnas de Delegados Fiduciarios
  CO_COL_ID_FID_REL_DEL   = 0;
  CO_COL_ID_PERSONA       = 1;
  CO_COL_NOM_DELEGADO_FID = 2;

  // Columnas de Reglas
  CO_COL_ID_FID_REL_REG   = 0;
  CO_COL_CVE_FID_REGLA    = 1;
  CO_COL_DESC_FID_REGLA   = 2;
  CO_COL_DIA_VENC_INI     = 3;
  CO_COL_DIA_VENC_FIN     = 4;
  CO_COL_DIA_SOL_INI      = 5;
  CO_COL_DIA_SOL_FIN      = 6;
  CO_COL_DIA_SOL_ANTIC    = 7;

Type
 TCrFidMae = class; 

  TWCrFideicMaestr=Class(TForm)
    InterForma1             : TInterForma;
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
    btID_INTERMEDIARIO: TBitBtn;
    edID_INTERMEDIARIO: TEdit;
    edNOM_INET: TEdit;
    lbID_FID_MAESTRO: TLabel;
    edID_FID_MAESTRO: TEdit;
    lbNUM_FOL_ADHESION: TLabel;
    edNUM_FOL_ADHESION: TEdit;
    rgSIT_FID_MAESTRO: TRadioGroup;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    grbxReglas: TGroupBox;
    btnAgregarRegla: TBitBtn;
    btnEliminarRegla: TBitBtn;
    StrGrdReglas: TStringGrid;
    lbID_INTERMEDIARIO: TLabel;
    lbIMP_FND_RESERVA: TLabel;
    edIMP_FND_RESERVA: TInterEdit;
    lbIMP_DIF_EXTEMP: TLabel;
    edIMP_DIF_EXTEMP: TInterEdit;
    btnCancela: TBitBtn;
    ilID_INTERMEDIARIO: TInterLinkit;
    edIMP_HONORARIOS: TInterEdit;
    lbIMP_HONORARIOS: TLabel;
    lbNOM_FIDEICOMITEN: TLabel;
    edNOM_FIDEICOMITEN: TEdit;
    grbxDelegados: TGroupBox;
    btnAgregarDelegado: TBitBtn;
    btEliminarDelegado: TBitBtn;
    StrGrdDelegados: TStringGrid;
    grbxFideicomisarios: TGroupBox;
    btnAgregarFideicomisario: TBitBtn;
    btnEliminarFideicomisario: TBitBtn;
    StrGrdFideicomisarios: TStringGrid;
    lbNUM_LUGAR: TLabel;
    edNUM_LUGAR: TInterEdit;
    lbCUENTA_BANCO: TLabel;
    edCUENTA_BANCO: TEdit;
    lbReglas: TLabel;
    lbDelegados: TLabel;
    lbFideicomisarios: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btID_INTERMEDIARIOClick(Sender: TObject);
    procedure ilID_INTERMEDIARIOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_INTERMEDIARIOEjecuta(Sender: TObject);
    procedure btnAgregarReglaClick(Sender: TObject);
    procedure btnEliminarReglaClick(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure btnCancelaClick(Sender: TObject);
    procedure btnAgregarDelegadoClick(Sender: TObject);
    procedure btEliminarDelegadoClick(Sender: TObject);
    procedure btnAgregarFideicomisarioClick(Sender: TObject);
    procedure btnEliminarFideicomisarioClick(Sender: TObject);
    procedure StrGrdFideicomisariosDblClick(Sender: TObject);
    procedure StrGrdDelegadosDblClick(Sender: TObject);
    procedure StrGrdReglasDblClick(Sender: TObject);
    procedure edNUM_FOL_ADHESIONExit(Sender: TObject);
    procedure edNOM_FIDEICOMITENExit(Sender: TObject);
    procedure edNUM_LUGARExit(Sender: TObject);
    procedure edIMP_HONORARIOSExit(Sender: TObject);
    procedure edIMP_FND_RESERVAExit(Sender: TObject);
    procedure edIMP_DIF_EXTEMPExit(Sender: TObject);
    procedure edID_INTERMEDIARIOExit(Sender: TObject);
    procedure edCUENTA_BANCOExit(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    private
    { Private declarations }
     procedure MuestraDatos;
     procedure MuestraFideicomisarios;
     procedure MuestraRepresentantes;
     procedure MuestraReglas;
     function PasaValidacion1 : Boolean;
     function NoDataStrGrd(peStrGrd : TStringGrid) : Boolean; 
    public
    { Public declarations }
     Objeto : TCrFidMae;

      function StpCancRelFidFideicomisario(  peID_FID_FIDECOM     : Integer;
                                             peB_COMMIT           : String;
                                             var psRESULTADO      : Integer;
                                             var psTX_RESULTADO   : String;
                                             pebMuestraError      : Boolean
                                          ) : Boolean;

      function StpAltaRelFidDelegado(  peID_FID_MAESTRO,
                                       peID_PERSONA         : Integer;
                                       peB_COMMIT           : String;
                                       var psID_FID_REL_DEL : Integer;
                                       var psRESULTADO      : Integer;
                                       var psTX_RESULTADO   : String;
                                       pebMuestraError      : Boolean
                                    ) : Boolean;

      function StpCancRelFidDelegado(  peID_FID_REL_DEL     : Integer;
                                       peB_COMMIT           : String;
                                       var psRESULTADO      : Integer;
                                       var psTX_RESULTADO   : String;
                                       pebMuestraError      : Boolean
                                    ) : Boolean;

      function StpAltaRelFidRegla( peID_FID_MAESTRO     : Integer;
                                   peCVE_FID_REGLA,
                                   peB_COMMIT           : String;
                                   var psID_FID_REL_REG : Integer;
                                   var psRESULTADO      : Integer;
                                   var psTX_RESULTADO   : String;
                                   pebMuestraError      : Boolean
                                ) : Boolean;

      function StpCancRelFidRegla( peID_FID_REL_REG     : Integer;
                                   peB_COMMIT           : String;
                                   var psRESULTADO      : Integer;
                                   var psTX_RESULTADO   : String;
                                   pebMuestraError      : Boolean
                                ) : Boolean;

      function StpCancFidMaestro(  peID_FID_MAESTRO     : Integer;
                                   peB_COMMIT           : String;
                                   var psRESULTADO      : Integer;
                                   var psTX_RESULTADO   : String;
                                   pebMuestraError      : Boolean
                                ) : Boolean;

      function GetDiasDescubiertos(peID_FID_MAESTRO     : Integer
                                ) : String;

      procedure ValidaDatosFideicomisoMaestro;
      procedure ValidaDatosFideicomisoMaestro1;
     end;

 TCrFidMae= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre : TParamCre;
        Intermediario : TIntermed;
        ReglaFideicomisos : TCrFidReg;
        DelegadoFiduciario : TCrFidDele;
        Fideicomisario : TCrFidFide;

        ID_FID_MAESTRO           : TInterCampo;
        NUM_FOL_ADHESION         : TInterCampo;
        NOM_FIDEICOMITEN         : TInterCampo;
        NUM_LUGAR                : TInterCampo;
        IMP_HONORARIOS           : TInterCampo;
        IMP_FND_RESERVA          : TInterCampo;
        IMP_DIF_EXTEMP           : TInterCampo;
        ID_INTERMEDIARIO         : TInterCampo;
        CUENTA_BANCO             : TInterCampo;
        SIT_FID_MAESTRO          : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;

        function    InternalBusca : Boolean; override;
        function    InternalPost : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation

{$R *.DFM}

constructor TCrFidMae.Create( AOwner : TComponent );
begin Inherited;
      ID_FID_MAESTRO    := CreaCampo('ID_FID_MAESTRO',ftInteger,tsNinguno,tsNinguno,True);
      NUM_FOL_ADHESION  := CreaCampo('NUM_FOL_ADHESION',ftString,tsNinguno,tsNinguno,True);
      NOM_FIDEICOMITEN  := CreaCampo('NOM_FIDEICOMITEN',ftString,tsNinguno,tsNinguno,True);
      NUM_LUGAR         := CreaCampo('NUM_LUGAR',ftInteger,tsNinguno,tsNinguno,True);
      IMP_HONORARIOS    := CreaCampo('IMP_HONORARIOS',ftFloat,tsNinguno,tsNinguno,True);
      IMP_FND_RESERVA   := CreaCampo('IMP_FND_RESERVA',ftFloat,tsNinguno,tsNinguno,True);
      IMP_DIF_EXTEMP    := CreaCampo('IMP_DIF_EXTEMP',ftFloat,tsNinguno,tsNinguno,True);
      ID_INTERMEDIARIO  := CreaCampo('ID_INTERMEDIARIO',ftInteger,tsNinguno,tsNinguno,True);
      CUENTA_BANCO      := CreaCampo('CUENTA_BANCO',ftString,tsNinguno,tsNinguno,True);
      SIT_FID_MAESTRO   := CreaCampo('SIT_FID_MAESTRO',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA      := CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      F_ALTA            := CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA  := CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      F_MODIFICA        := CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
      FKeyFields.Add('ID_FID_MAESTRO');

      With SIT_FID_MAESTRO do
        Begin
        Size:=3;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
        End;

      Intermediario := TIntermed.Create(Self);
      Intermediario.MasterSource:=Self;
      Intermediario.FieldByName('ID_INTERMEDIARIO').MasterField := 'ID_INTERMEDIARIO';
      InterMediario.BuscaWhereString := ' CVE_TIPO_INTERM = ' + SQLStr('BA');
      InterMediario.FilterString := InterMediario.BuscaWhereString;

      Fideicomisario := TCrFidFide.Create(Self);
      Fideicomisario.MasterSource:=Self;

      DelegadoFiduciario := TCrFidDele.Create(Self);
      DelegadoFiduciario.MasterSource:=Self;
      DelegadoFiduciario.BuscaWhereString := ' SIT_FID_DELEGADO <> ' + SQLStr(CSIT_CA);
      DelegadoFiduciario.FilterString := DelegadoFiduciario.BuscaWhereString;

      ReglaFideicomisos := TCrFidReg.Create(Self);
      ReglaFideicomisos.MasterSource:=Self;
      ReglaFideicomisos.BuscaWhereString := ' SIT_FID_REGLA <> ' + SQLStr(CSIT_CA);
      ReglaFideicomisos.FilterString := ReglaFideicomisos.BuscaWhereString;

      TableName  := 'CR_FID_MAESTRO';
      UseQuery := True;
      HelpFile := 'IntCrFidMae.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrFidMae.Destroy;
begin
 If Assigned(Intermediario) Then Intermediario.Free;
 If Assigned(Fideicomisario) Then Fideicomisario.Free;
 If Assigned(ReglaFideicomisos) Then ReglaFideicomisos.Free;
 If Assigned(DelegadoFiduciario) Then DelegadoFiduciario.Free;
 inherited;
end;

function TCrFidMae.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrFideicMaestr;
begin
   W:=TWCrFideicMaestr.Create(Self);
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

Function TCrFidMae.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrFiMa.it','I');
      Try if Active then begin T.Param(0,ID_FID_MAESTRO.AsString); end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TCrFidMae.InternalPost : Boolean;
var  StpAltaFidMaestro : TStoredProc;
     vlCVE_USU_ALTA : String;
     vlF_ALTA : TDateTime;
     VLSalida  : Boolean;
begin
     VLSalida := False;
     If Modo = moEdit Then
       Begin
       VLSalida := True;
       Result := Inherited InternalPost;
       End;
     If Modo = moAppend Then
        Begin
          StpAltaFidMaestro := TStoredProc.Create(Nil);
          try
            If Assigned(StpAltaFidMaestro) Then
            With StpAltaFidMaestro Do
               Begin
               DatabaseName := Apli.DatabaseName;
               SessionName  := Apli.SessionName;
               StoredProcName := 'PKGCRGYM.STP_ALTA_FID_MAESTRO';
               // Crea variables
               Params.CreateParam(ftString ,'peNUM_FOL_ADHESION', ptInput);
               Params.CreateParam(ftString ,'peNOM_FIDEICOMITEN', ptInput);
               Params.CreateParam(ftFloat ,'peNUM_LUGAR', ptInput);
               Params.CreateParam(ftFloat ,'peIMP_HONORARIOS', ptInput);
               Params.CreateParam(ftFloat ,'peIMP_FND_RESERVA', ptInput);
               Params.CreateParam(ftFloat ,'peIMP_DIF_EXTEMP', ptInput);
               Params.CreateParam(ftFloat ,'peID_INTERMEDIARIO', ptInput);
               Params.CreateParam(ftString,'peCUENTA_BANCO',ptInput);
               Params.CreateParam(ftString,'peCVE_USU_ALTA',ptInput);
               Params.CreateParam(ftDateTime,'peF_ALTA',ptInput);
               Params.CreateParam(ftString,'peB_COMMIT',ptInput);
               Params.CreateParam(ftFloat ,'psID_FID_MAESTRO',ptOutput);
               Params.CreateParam(ftFloat ,'psRESULTADO',ptOutput);
               Params.CreateParam(ftString,'psTX_RESULTADO',ptOutput);
               // Asigna Valores
               vlCVE_USU_ALTA := DameUsuario;
               vlF_ALTA := Apli.DameFechaEmpresa;
               ParamByName('peNUM_FOL_ADHESION').AsString := NUM_FOL_ADHESION.AsString;
               ParamByName('peNOM_FIDEICOMITEN').AsString := NOM_FIDEICOMITEN.AsString;
               ParamByName('peNUM_LUGAR').AsFloat         := NUM_LUGAR.AsFloat;
               ParamByName('peIMP_HONORARIOS').AsFloat    := IMP_HONORARIOS.AsFloat;
               ParamByName('peIMP_FND_RESERVA').AsFloat   := IMP_FND_RESERVA.AsFloat;
               ParamByName('peIMP_DIF_EXTEMP').AsFloat    := IMP_DIF_EXTEMP.AsFloat;
               ParamByName('peID_INTERMEDIARIO').AsFloat  := ID_INTERMEDIARIO.AsFloat;
               ParamByName('peCUENTA_BANCO').AsString := CUENTA_BANCO.AsString;
               ParamByName('peCVE_USU_ALTA').AsString := vlCVE_USU_ALTA;
               ParamByName('peF_ALTA').AsDateTime := vlF_ALTA;
               ParamByName('peB_COMMIT').AsString := cVERDAD;
               ExecProc;
               // Valida el Resultado
               If (ParamByName('psRESULTADO').AsFloat <> 0) Then
                Begin
                // Muestra el Mensaje de Error
                MessageDlg(ParamByName('psTX_RESULTADO').AsString, mtError, [mbOk], 0);
                End
               Else
                Begin
                // Asignación de valores
                ID_FID_MAESTRO.AsFloat := ParamByName('psID_FID_MAESTRO').AsFloat;
                SIT_FID_MAESTRO.AsString := CSIT_AC;
                CVE_USU_ALTA.AsString := vlCVE_USU_ALTA;
                F_ALTA.AsDateTime := vlF_ALTA;
                vlSalida := True;
                End;
            End;
          finally
              StpAltaFidMaestro.Params.Clear;
              StpAltaFidMaestro.Free;
          end;
          AutoRefresh := False;          
        End; // If Modo = moAppend Then
        InternalPost := vlSalida;
end;

(***********************************************FORMA CR_FIDEICOMISO_MAESTRO********************)
(*                                                                              *)
(*  FORMA DE CR_FIDEICOMISO_MAESTRO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FIDEICOMISO_MAESTRO********************)

procedure TWCrFideicMaestr.FormShow(Sender: TObject);
begin
  With Objeto Do
   Begin
   lbDempresa.Caption := ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := ParamCre.FECHA.AsString;
   lbDUsuario.Caption := ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

   ID_FID_MAESTRO.Control     := edID_FID_MAESTRO;
   NUM_FOL_ADHESION.Control   := edNUM_FOL_ADHESION;
   NOM_FIDEICOMITEN.Control   := edNOM_FIDEICOMITEN;
   NUM_LUGAR.Control          := edNUM_LUGAR;
   IMP_HONORARIOS.Control     := edIMP_HONORARIOS;
   IMP_FND_RESERVA.Control    := edIMP_FND_RESERVA;
   IMP_DIF_EXTEMP.Control     := edIMP_DIF_EXTEMP;
   ID_INTERMEDIARIO.Control   := edID_INTERMEDIARIO;
   CUENTA_BANCO.Control       := edCUENTA_BANCO;
   SIT_FID_MAESTRO.Control    := rgSIT_FID_MAESTRO;
   CVE_USU_ALTA.Control       := edCVE_USU_ALTA;
   F_ALTA.Control             := edF_ALTA;
   CVE_USU_MODIFICA.Control   := edCVE_USU_MODIFICA;
   F_MODIFICA.Control         := edF_MODIFICA;

   Intermediario.ID_INTERMEDIARIO.Control := edID_INTERMEDIARIO;
   Intermediario.NOM_INET.Control := edNOM_INET;

   Interforma1.MsgPanel := MsgPanel;
   MuestraDatos;
   End;
end;

procedure TWCrFideicMaestr.FormDestroy(Sender: TObject);
begin
  With Objeto Do
   Begin
   ID_FID_MAESTRO.Control     := Nil;
   NUM_FOL_ADHESION.Control   := Nil;
   NOM_FIDEICOMITEN.Control   := Nil;
   NUM_LUGAR.Control          := Nil;
   IMP_HONORARIOS.Control     := Nil;
   IMP_FND_RESERVA.Control    := Nil;
   IMP_DIF_EXTEMP.Control     := Nil;
   ID_INTERMEDIARIO.Control   := Nil;
   CUENTA_BANCO.Control       := Nil;
   SIT_FID_MAESTRO.Control    := Nil;
   CVE_USU_ALTA.Control       := Nil;
   F_ALTA.Control             := Nil;
   CVE_USU_MODIFICA.Control   := Nil;
   F_MODIFICA.Control         := Nil;

   Intermediario.ID_INTERMEDIARIO.Control := Nil;
   Intermediario.NOM_INET.Control := Nil;

   Interforma1.MsgPanel := Nil;
   End;
end;

procedure TWCrFideicMaestr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrFideicMaestr.InterForma1DespuesNuevo(Sender: TObject);
begin If edNUM_FOL_ADHESION.CanFocus Then edNUM_FOL_ADHESION.SetFocus;
      Objeto.SIT_FID_MAESTRO.AsString := CSIT_AC;
end;

procedure TWCrFideicMaestr.InterForma1DespuesModificar(Sender: TObject);
var vlbEnabled : Boolean;
begin
  If edNOM_FIDEICOMITEN.CanFocus Then edNOM_FIDEICOMITEN.SetFocus;
  With Objeto Do
   Begin
   vlbEnabled := SIT_FID_MAESTRO.AsString <> CSIT_CA;
   btID_INTERMEDIARIO.Enabled := vlbEnabled;
   edNOM_FIDEICOMITEN.Enabled := vlbEnabled;
   edIMP_HONORARIOS.Enabled := vlbEnabled;
   edID_INTERMEDIARIO.Enabled := vlbEnabled;
   edCUENTA_BANCO.Enabled := vlbEnabled;
   edIMP_FND_RESERVA.Enabled := vlbEnabled;
   edIMP_DIF_EXTEMP.Enabled := vlbEnabled;
   edNUM_LUGAR.Enabled := vlbEnabled;
   btnAgregarFideicomisario.Enabled := vlbEnabled;
   btnEliminarFideicomisario.Enabled := vlbEnabled;
   btnAgregarDelegado.Enabled := vlbEnabled;
   btEliminarDelegado.Enabled := vlbEnabled;
   btnAgregarRegla.Enabled := vlbEnabled;
   btnEliminarRegla.Enabled := vlbEnabled;
   End;
end;

procedure TWCrFideicMaestr.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlstrMessage : String;
    mrResult : Word;
begin
 If IsNewData Then vlstrMessage := CCONFIRM_ALMACENA_INS
 Else vlstrMessage := CCONFIRM_ALMACENA_MOD;
 mrResult := MessageDlg(vlstrMessage, mtConfirmation, [mbYes, mbNo], 0);
 With Objeto Do
   If (mrResult = mrYes) Then
    Begin
      If (IsNewData) Then
       Begin
       F_ALTA.AsDateTime        := Apli.DameFechaEmpresa;
       CVE_USU_ALTA.AsString    := Apli.Usuario;
       End
      Else
       Begin
       F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresa;
       CVE_USU_MODIFICA.AsString := Apli.Usuario;
       End;
     End;
 Realizado := mrResult = mrYes;
end;

function TWCrFideicMaestr.NoDataStrGrd(peStrGrd : TStringGrid) : Boolean;
begin
 Result := Trim(peStrGrd.Cells[0,1]) = '';
end;

procedure TWCrFideicMaestr.btID_INTERMEDIARIOClick(Sender: TObject);
begin
 With Objeto Do
   Begin
   If InterMediario.Busca Then
    If edCUENTA_BANCO.CanFocus Then edCUENTA_BANCO.SetFocus;
   End;
end;

procedure TWCrFideicMaestr.ilID_INTERMEDIARIOCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrFideicMaestr.ilID_INTERMEDIARIOEjecuta(Sender: TObject);
begin
 With Objeto Do
  If InterMediario.FindKey([ilID_INTERMEDIARIO.Buffer]) Then;
   If edCUENTA_BANCO.CanFocus Then edCUENTA_BANCO.SetFocus;
end;

procedure TWCrFideicMaestr.MuestraDatos;
begin
 MuestraFideicomisarios;
 MuestraRepresentantes;
 MuestraReglas;
 ValidaDatosFideicomisoMaestro;
end;

procedure TWCrFideicMaestr.MuestraFideicomisarios;
var vlstrSQL : String;
    vlQry : TQuery;
    vlnRow : Integer;
begin
 With StrGrdFideicomisarios Do
  Begin
  ColWidths[0] := 0;
  Cells[CO_COL_TX_NUM_LUGAR     , 0] := 'Lugar';
  Cells[CO_COL_NOM_FIDEICOMISAR , 0] := 'Fideicomisario';
  ClearGrid(StrGrdFideicomisarios);
  RowCount := 2;
  End;
 // Válida que se hayan seleccionado un FIDEICOMISO Maestro  
 If Objeto.ID_FID_MAESTRO.AsInteger = 0 Then
  Exit;
 // Inicia Muestra de Fideicomisarios del FIDEICOMISO Maestro
  vlstrSQL := ' SELECT ID_FID_FIDECOM,'+coCRLF+
              '        TO_CHAR(NUM_LUGAR)||''°'' AS TX_NUM_LUGAR,'+coCRLF+
              '        NOM_FIDEICOMISAR,'+coCRLF+
              '        NUM_LUGAR'+coCRLF+
              ' FROM CR_FID_FIDECOM'+coCRLF+
              ' WHERE SIT_FID_FIDECOM <> '+SQLStr(CSIT_CA)+coCRLF+
              '   AND ID_FID_MAESTRO = '+Objeto.ID_FID_MAESTRO.AsString+coCRLF+
              ' ORDER BY NUM_LUGAR'+coCRLF
              ;
  vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
  vlnRow := 1;
  If Assigned(vlQry) Then
   With vlQry Do
     Try
       Last; First; 
       While Not Eof Do
        Begin
        StrGrdFideicomisarios.Cells[CO_COL_ID_FID_FIDECOM, vlnRow]   := FieldByName('ID_FID_FIDECOM').DisplayText;
        StrGrdFideicomisarios.Cells[CO_COL_TX_NUM_LUGAR, vlnRow]     := FieldByName('TX_NUM_LUGAR').DisplayText;
        StrGrdFideicomisarios.Cells[CO_COL_NOM_FIDEICOMISAR, vlnRow] := FieldByName('NOM_FIDEICOMISAR').DisplayText;
        Next; Inc(vlnRow);
        End;
     Finally
       vlQry.Close;
       vlQry.Free;
     End;
  If vlnRow > 2 Then StrGrdFideicomisarios.RowCount := vlnRow
  Else StrGrdFideicomisarios.RowCount := 2;
end;

procedure TWCrFideicMaestr.MuestraRepresentantes;
var vlstrSQL : String;
    vlQry : TQuery;
    vlnRow : Integer;
begin
 With StrGrdDelegados Do
  Begin
  ColWidths[0] := 0;
  Cells[CO_COL_ID_PERSONA      , 0] := 'Id. Persona';
  Cells[CO_COL_NOM_DELEGADO_FID, 0] := 'Nombre Representante';
  ClearGrid(StrGrdDelegados);
  RowCount := 2;                                  
  End;
 // Válida que se hayan seleccionado un FIDEICOMISO Maestro  
 If Objeto.ID_FID_MAESTRO.AsInteger = 0 Then
  Exit;
 // Inicia Muestra de Delegados Fiduciarios del FIDEICOMISO Maestro 
  vlstrSQL := ' SELECT CRFD.ID_FID_REL_DEL,'+coCRLF+
              '        CFD.ID_PERSONA,'+coCRLF+
              '        SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, CFD.ID_PERSONA),1,255) AS NOM_DELEGADO_FID'+coCRLF+
              ' FROM CR_FID_REL_DEL CRFD,'+coCRLF+
              '      CR_FID_DELEGADO CFD'+coCRLF+
              ' WHERE CRFD.ID_FID_MAESTRO = '+Objeto.ID_FID_MAESTRO.AsString+coCRLF+
              '   AND CRFD.SIT_FID_REL_DEL <> '+SQLStr(CSIT_CA)+coCRLF+
              '   AND CRFD.ID_PERSONA = CFD.ID_PERSONA'+coCRLF+
              '   AND CFD.SIT_FID_DELEGADO <> '+SQLStr(CSIT_CA)+coCRLF
              ;
  vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
  vlnRow := 1;
  If Assigned(vlQry) Then
   With vlQry Do
     Try
       Last; First; 
       While Not Eof Do
        Begin
        StrGrdDelegados.Cells[CO_COL_ID_FID_REL_DEL, vlnRow]   := FieldByName('ID_FID_REL_DEL').DisplayText;
        StrGrdDelegados.Cells[CO_COL_ID_PERSONA, vlnRow]       := FieldByName('ID_PERSONA').DisplayText;
        StrGrdDelegados.Cells[CO_COL_NOM_DELEGADO_FID, vlnRow] := FieldByName('NOM_DELEGADO_FID').DisplayText;
        Next; Inc(vlnRow);
        End;
     Finally
       vlQry.Close;
       vlQry.Free;
     End;
  If vlnRow > 2 Then StrGrdDelegados.RowCount := vlnRow
  Else StrGrdDelegados.RowCount := 2;
end;

procedure TWCrFideicMaestr.MuestraReglas;
var vlstrSQL : String;
    vlQry : TQuery;
    vlnRow : Integer;
begin
 With StrGrdReglas Do
  Begin
  ColWidths[0] := 0;
  Cells[CO_COL_CVE_FID_REGLA   , 0] := 'Regla';
  Cells[CO_COL_DESC_FID_REGLA  , 0] := 'Desc. Regla';
  Cells[CO_COL_DIA_VENC_INI    , 0] := 'Venc. Ini';
  Cells[CO_COL_DIA_VENC_FIN    , 0] := 'Venc. Fin';
  Cells[CO_COL_DIA_SOL_INI     , 0] := 'Sol. Ini';
  Cells[CO_COL_DIA_SOL_FIN     , 0] := 'Sol. Fin';
  Cells[CO_COL_DIA_SOL_ANTIC   , 0] := 'Sol. Anticip.';
  ClearGrid(StrGrdReglas);
  RowCount := 2;
  End;
 // Válida que se hayan seleccionado un FIDEICOMISO Maestro
 If Objeto.ID_FID_MAESTRO.AsInteger = 0 Then
  Exit;
 // Inicia Muestra de Reglas del FIDEICOMISO Maestro
  vlstrSQL := '  SELECT CRFR.ID_FID_REL_REG  ,'+coCRLF+
              '         CFR.CVE_FID_REGLA    ,'+coCRLF+
              '         CFR.DESC_FID_REGLA   ,'+coCRLF+
              '         CFR.DIA_VENC_INI     ,'+coCRLF+
              '         CFR.DIA_VENC_FIN     ,'+coCRLF+
              '         CFR.DIA_SOL_INI      ,'+coCRLF+
              '         CFR.DIA_SOL_FIN      ,'+coCRLF+
              '         CFR.DIA_SOL_ANTIC'+coCRLF+
              '  FROM  ( SELECT * FROM CR_FID_REL_REG'+coCRLF+
              '          WHERE ID_FID_MAESTRO = '+Objeto.ID_FID_MAESTRO.AsString+coCRLF+
              '            AND SIT_FID_REL_REG <> '+SQLStr(CSIT_CA)+coCRLF+
              '        ) CRFR,'+coCRLF+
              '        ( SELECT * FROM CR_FID_REGLA'+coCRLF+
              '          WHERE SIT_FID_REGLA <> '+SQLStr(CSIT_CA)+coCRLF+
              '        ) CFR'+coCRLF+
              '  WHERE CFR.CVE_FID_REGLA = CRFR.CVE_FID_REGLA'+coCRLF+
              '  ORDER BY DIA_VENC_INI'+coCRLF
              ;
  vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
  vlnRow := 1;
  If Assigned(vlQry) Then
   With vlQry Do
     Try
       Last; First;
       While Not Eof Do
        Begin
        StrGrdReglas.Cells[CO_COL_ID_FID_REL_REG, vlnRow] := FieldByName('ID_FID_REL_REG').DisplayText;
        StrGrdReglas.Cells[CO_COL_CVE_FID_REGLA,  vlnRow] := FieldByName('CVE_FID_REGLA').DisplayText;
        StrGrdReglas.Cells[CO_COL_DESC_FID_REGLA, vlnRow] := FieldByName('DESC_FID_REGLA').DisplayText;
        StrGrdReglas.Cells[CO_COL_DIA_VENC_INI,   vlnRow] := FieldByName('DIA_VENC_INI').DisplayText;
        StrGrdReglas.Cells[CO_COL_DIA_VENC_FIN,   vlnRow] := FieldByName('DIA_VENC_FIN').DisplayText;
        StrGrdReglas.Cells[CO_COL_DIA_SOL_INI,    vlnRow] := FieldByName('DIA_SOL_INI').DisplayText;
        StrGrdReglas.Cells[CO_COL_DIA_SOL_FIN,    vlnRow] := FieldByName('DIA_SOL_FIN').DisplayText;
        StrGrdReglas.Cells[CO_COL_DIA_SOL_ANTIC,  vlnRow] := FieldByName('DIA_SOL_ANTIC').DisplayText;
        Next; Inc(vlnRow);
        End;
     Finally
       vlQry.Close;
       vlQry.Free;
     End;
  If vlnRow > 2 Then StrGrdReglas.RowCount := vlnRow
  Else StrGrdReglas.RowCount := 2;
end;

function TWCrFideicMaestr.PasaValidacion1 : Boolean;
var vlbResult : Boolean;
begin
 vlbResult := (Objeto.ID_FID_MAESTRO.AsInteger = 0);
 If vlbResult Then
  MessageDlg(CO_MSG_SELECCIONAR, mtWarning, [mbOk], 0);
 Result := Not vlbResult;
end;

function TWCrFideicMaestr.StpCancRelFidFideicomisario(  peID_FID_FIDECOM     : Integer;
                                                        peB_COMMIT           : String;
                                                        var psRESULTADO      : Integer;
                                                        var psTX_RESULTADO   : String;
                                                        pebMuestraError      : Boolean
                                                     ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRGYM.STP_CANC_FID_REL_FIDEICOMISAR';
       DataBaseName   := Objeto.Apli.DataBaseName;
       SessionName    := Objeto.Apli.SessionName;
       Params.CreateParam(ftInteger ,'peID_FID_FIDECOM'  ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_USU_MODIFICA',ptInput);
       Params.CreateParam(ftDateTime,'peF_MODIFICA'      ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'        ,ptInput);
       Params.CreateParam(ftInteger ,'psRESULTADO'       ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'    ,ptOutput);

       ParamByName('peID_FID_FIDECOM').AsInteger := peID_FID_FIDECOM;
       ParamByName('peCVE_USU_MODIFICA').AsString := Objeto.Apli.Usuario;
       ParamByName('peF_MODIFICA').AsDateTime := Objeto.Apli.DameFechaEmpresa;
       ParamByName('peB_COMMIT').AsString := peB_COMMIT;
       ExecProc;

       psRESULTADO      := ParamByName('psRESULTADO').AsInteger     ;
       psTX_RESULTADO   := ParamByName('psTX_RESULTADO').AsString   ;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

function TWCrFideicMaestr.StpAltaRelFidDelegado(  peID_FID_MAESTRO,
                                                  peID_PERSONA         : Integer;
                                                  peB_COMMIT           : String;
                                                  var psID_FID_REL_DEL : Integer;
                                                  var psRESULTADO      : Integer;
                                                  var psTX_RESULTADO   : String;
                                                  pebMuestraError      : Boolean
                                               ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRGYM.STP_ALTA_FID_REL_DELEGADO';
       DataBaseName   := Objeto.Apli.DataBaseName;
       SessionName    := Objeto.Apli.SessionName;
       Params.CreateParam(ftInteger ,'peID_FID_MAESTRO'  ,ptInput);
       Params.CreateParam(ftInteger ,'peID_PERSONA'      ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_USU_ALTA'    ,ptInput);
       Params.CreateParam(ftDateTime,'peF_ALTA'          ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'        ,ptInput);
       Params.CreateParam(ftInteger ,'psID_FID_REL_DEL'  ,ptOutput);       
       Params.CreateParam(ftInteger ,'psRESULTADO'       ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'    ,ptOutput);

       ParamByName('peID_FID_MAESTRO').AsInteger := peID_FID_MAESTRO;
       ParamByName('peID_PERSONA').AsInteger     := peID_PERSONA;
       ParamByName('peCVE_USU_ALTA').AsString := Objeto.Apli.Usuario;
       ParamByName('peF_ALTA').AsDateTime := Objeto.Apli.DameFechaEmpresa;
       ParamByName('peB_COMMIT').AsString := peB_COMMIT;
       ExecProc;

       psRESULTADO      := ParamByName('psRESULTADO').AsInteger     ;
       psTX_RESULTADO   := ParamByName('psTX_RESULTADO').AsString   ;
       psID_FID_REL_DEL := ParamByName('psID_FID_REL_DEL').AsInteger;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

function TWCrFideicMaestr.StpCancRelFidDelegado(  peID_FID_REL_DEL     : Integer;
                                                  peB_COMMIT           : String;
                                                  var psRESULTADO      : Integer;
                                                  var psTX_RESULTADO   : String;
                                                  pebMuestraError      : Boolean
                                               ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRGYM.STP_CANC_FID_REL_DELEGADO';
       DataBaseName   := Objeto.Apli.DataBaseName;
       SessionName    := Objeto.Apli.SessionName;
       Params.CreateParam(ftInteger ,'peID_FID_REL_DEL'  ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_USU_MODIFICA',ptInput);
       Params.CreateParam(ftDateTime,'peF_MODIFICA'      ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'        ,ptInput);
       Params.CreateParam(ftInteger ,'psRESULTADO'       ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'    ,ptOutput);

       ParamByName('peID_FID_REL_DEL').AsInteger := peID_FID_REL_DEL;
       ParamByName('peCVE_USU_MODIFICA').AsString := Objeto.Apli.Usuario;
       ParamByName('peF_MODIFICA').AsDateTime := Objeto.Apli.DameFechaEmpresa;
       ParamByName('peB_COMMIT').AsString := peB_COMMIT;
       ExecProc;

       psRESULTADO      := ParamByName('psRESULTADO').AsInteger     ;
       psTX_RESULTADO   := ParamByName('psTX_RESULTADO').AsString   ;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

function TWCrFideicMaestr.StpAltaRelFidRegla(  peID_FID_MAESTRO     : Integer;
                                               peCVE_FID_REGLA,
                                               peB_COMMIT           : String;
                                               var psID_FID_REL_REG : Integer;
                                               var psRESULTADO      : Integer;
                                               var psTX_RESULTADO   : String;
                                               pebMuestraError      : Boolean
                                            ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRGYM.STP_ALTA_FID_REL_REGLA';
       DataBaseName   := Objeto.Apli.DataBaseName;
       SessionName    := Objeto.Apli.SessionName;
       Params.CreateParam(ftInteger ,'peID_FID_MAESTRO'  ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_FID_REGLA'   ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_USU_ALTA'    ,ptInput);
       Params.CreateParam(ftDateTime,'peF_ALTA'          ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'        ,ptInput);
       Params.CreateParam(ftInteger ,'psID_FID_REL_REG'  ,ptOutput);
       Params.CreateParam(ftInteger ,'psRESULTADO'       ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'    ,ptOutput);

       ParamByName('peID_FID_MAESTRO').AsInteger := peID_FID_MAESTRO;
       ParamByName('peCVE_FID_REGLA').AsString := peCVE_FID_REGLA;
       ParamByName('peCVE_USU_ALTA').AsString := Objeto.Apli.Usuario;
       ParamByName('peF_ALTA').AsDateTime := Objeto.Apli.DameFechaEmpresa;
       ParamByName('peB_COMMIT').AsString := peB_COMMIT;
       ExecProc;

       psRESULTADO      := ParamByName('psRESULTADO').AsInteger     ;
       psTX_RESULTADO   := ParamByName('psTX_RESULTADO').AsString   ;
       psID_FID_REL_REG := ParamByName('psID_FID_REL_REG').AsInteger;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

function TWCrFideicMaestr.StpCancRelFidRegla(  peID_FID_REL_REG     : Integer;
                                               peB_COMMIT           : String;
                                               var psRESULTADO      : Integer;
                                               var psTX_RESULTADO   : String;
                                               pebMuestraError      : Boolean
                                            ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRGYM.STP_CANC_FID_REL_REGLA';
       DataBaseName   := Objeto.Apli.DataBaseName;
       SessionName    := Objeto.Apli.SessionName;
       Params.CreateParam(ftInteger ,'peID_FID_REL_REG'  ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_USU_MODIFICA',ptInput);
       Params.CreateParam(ftDateTime,'peF_MODIFICA'      ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'        ,ptInput);
       Params.CreateParam(ftInteger ,'psRESULTADO'       ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'    ,ptOutput);

       ParamByName('peID_FID_REL_REG').AsInteger := peID_FID_REL_REG;
       ParamByName('peCVE_USU_MODIFICA').AsString := Objeto.Apli.Usuario;
       ParamByName('peF_MODIFICA').AsDateTime := Objeto.Apli.DameFechaEmpresa;
       ParamByName('peB_COMMIT').AsString := peB_COMMIT;
       ExecProc;

       psRESULTADO      := ParamByName('psRESULTADO').AsInteger     ;
       psTX_RESULTADO   := ParamByName('psTX_RESULTADO').AsString   ;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;


function TWCrFideicMaestr.StpCancFidMaestro(   peID_FID_MAESTRO     : Integer;
                                               peB_COMMIT           : String;
                                               var psRESULTADO      : Integer;
                                               var psTX_RESULTADO   : String;
                                               pebMuestraError      : Boolean
                                            ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRGYM.STP_CANC_FID_MAESTRO';
       DataBaseName   := Objeto.Apli.DataBaseName;
       SessionName    := Objeto.Apli.SessionName;
       Params.CreateParam(ftInteger ,'peID_FID_MAESTRO'  ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_USU_MODIFICA',ptInput);
       Params.CreateParam(ftDateTime,'peF_MODIFICA'      ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'        ,ptInput);
       Params.CreateParam(ftInteger ,'psRESULTADO'       ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'    ,ptOutput);

       ParamByName('peID_FID_MAESTRO').AsInteger := peID_FID_MAESTRO;
       ParamByName('peCVE_USU_MODIFICA').AsString := Objeto.Apli.Usuario;
       ParamByName('peF_MODIFICA').AsDateTime := Objeto.Apli.DameFechaEmpresa;
       ParamByName('peB_COMMIT').AsString := peB_COMMIT;
       ExecProc;

       psRESULTADO      := ParamByName('psRESULTADO').AsInteger     ;
       psTX_RESULTADO   := ParamByName('psTX_RESULTADO').AsString   ;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

function TWCrFideicMaestr.GetDiasDescubiertos(peID_FID_MAESTRO     : Integer
                                           ) : String;
var Stp : TStoredProc;
begin
  Stp :=  TStoredProc.Create(Nil);
  Result := '';
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRGYM.GET_DIAS_DESCUBIERTOS';
       DataBaseName   := Objeto.Apli.DataBaseName;
       SessionName    := Objeto.Apli.SessionName;
       Params.CreateParam(ftInteger ,'peID_FID_MAESTRO'  ,ptInput);
       Params.CreateParam(ftString  ,'RESULT'            ,ptResult);

       ParamByName('peID_FID_MAESTRO').AsInteger := peID_FID_MAESTRO;
       ExecProc;

       Result := (ParamByName('RESULT').AsString);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
end;

procedure TWCrFideicMaestr.ValidaDatosFideicomisoMaestro;

   function NoData(peStrGrd : TStringGrid; peLabel : TLabel; GroupBox : TGroupBox) : Boolean;
   var vlbNoData : Boolean;
   begin
     vlbNoData := Trim(peStrGrd.Cells[0,1]) = '';
     If vlbNoData Then
       Begin
       peLabel.caption := ' No se han indicado "'+GroupBox.Caption+'". Favor de Agregarlos.';
       peLabel.Visible := True;
       End
     Else
       Begin
       peLabel.Caption := '';
       peLabel.Visible := False;
       End;
     Result := vlbNoData;
   end;

var  vlstrDiasDescubiertos : String;
begin
  With Objeto Do
   If (ID_FID_MAESTRO.AsInteger > 0) Then
    Begin
    lbFideicomisarios.Visible := False;
    lbDelegados.Visible := False;
    lbReglas.Visible := False;

    NoData(StrGrdFideicomisarios, lbFideicomisarios, grbxFideicomisarios);
    NoData(StrGrdDelegados, lbDelegados, grbxDelegados);
    If Not NoData(StrGrdReglas, lbReglas, grbxReglas) Then
      Begin
      vlstrDiasDescubiertos := GetDiasDescubiertos(ID_FID_MAESTRO.AsInteger);
      If (vlstrDiasDescubiertos <> '') Then
        Begin
        lbReglas.Caption := 'Se encuentran descubiertos los días: '+vlstrDiasDescubiertos+' por las reglas. Verifique.';
        lbReglas.Visible := True;
        End;
      End;
    End;
end;

procedure TWCrFideicMaestr.InterForma1Buscar(Sender: TObject);
begin
 With Objeto Do
  If InternalBusca Then
    Begin
    InterMediario.FindKey([ID_INTERMEDIARIO.AsInteger]);    
    MuestraDatos;
    ValidaDatosFideicomisoMaestro1;
    End;
end;

procedure TWCrFideicMaestr.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
  Objeto.Active := False;
  MuestraDatos;
end;

procedure TWCrFideicMaestr.btnCancelaClick(Sender: TObject);

   function PasaValidacion2 : Boolean;
   var vlnTotal : Integer;
   begin
    Result := True;
    GetSQLInt('  SELECT COUNT(*) AS TOTAL'+coCRLF+
              '  FROM CR_FID_SOL_PAGO'+coCRLF+
              '  WHERE ID_CREDITO IN ( SELECT ID_CREDITO FROM CR_FID_REL_DISP'+coCRLF+
              '                        WHERE ID_FID_MAESTRO = '+Objeto.ID_FID_MAESTRO.AsString+coCRLF+
              '                         AND SIT_FID_REL_DISP <> '+SQLStr(CSIT_CA)+coCRLF+
              '                      )'+coCRLF+
              '    AND SIT_FID_SOL_PAGO <> '+SQLStr(CSIT_CA)+coCRLF+
              '    AND B_IMPRESO <> '+SQLStr(CVERDAD)+coCRLF,
              Objeto.Apli.DatabaseName, Objeto.Apli.SessionName,
              'TOTAL', vlnTotal, False
             );
    If (vlnTotal > 0) Then
     If (MessageDlg('Se encontraron '+IntToStr(vlnTotal)+' solicitud(es) pendient(es) de imprimr.'+coCRLF+
                    '¿Desea continuar con la cancelación?',
                    mtInformation, [mbOk], 0) = mrNo) Then
        Result := False;
   end;

var vlRESULTADO      : Integer;
    vlTX_RESULTADO   : String;
begin
 With Objeto Do
   Begin
    If Not PasaValidacion1 Then
      Exit;
    //
    If (MessageDlg('¿Desea cancelar el Fideicomiso Maestro '+ID_FID_MAESTRO.AsString+'?',
                   mtConfirmation, [mbYes, mbNo], 0 ) = mrYes) Then
      If PasaValidacion2 Then
        If StpCancFidMaestro(ID_FID_MAESTRO.AsInteger,
                             CVERDAD,
                             vlRESULTADO,
                             vlTX_RESULTADO,
                             True
                             ) Then
          Begin
          MessageDlg('Se ha cancelado el Fideicomiso Maestro así como sus datos relacionados.', mtInformation, [mbOk], 0);
          Refresh;
          End
        Else
          MessageDlg('Problemas al cancelar el Fideicomiso Maestro. Intente nuevamente o avise a sistemas.',
                     mtError, [mbOk], 0);
   End;
end;

procedure TWCrFideicMaestr.btnAgregarFideicomisarioClick(Sender: TObject);
begin
 With Objeto Do
   Begin
     If Not PasaValidacion1 Then
      Exit;
     //
     Fideicomisario.vgID_FID_MAESTRO := ID_FID_MAESTRO.AsInteger;
     Fideicomisario.Nuevo;
     MuestraDatos;
   End;
end;

procedure TWCrFideicMaestr.btnEliminarFideicomisarioClick(Sender: TObject);
var vlRESULTADO      : Integer;
    vlstrID_FID_FIDECOM, vlstrNOM_FIDEICOMISAR, vlTX_RESULTADO   : String;
begin
 With Objeto Do
   Begin
    If Not PasaValidacion1 Then
      Exit;
    // Obtiene el ID_FID_FIDECOM seleccionado
    vlstrID_FID_FIDECOM   := StrGrdFideicomisarios.Cells[CO_COL_ID_FID_FIDECOM, StrGrdFideicomisarios.Row];
    vlstrNOM_FIDEICOMISAR := StrGrdFideicomisarios.Cells[CO_COL_NOM_FIDEICOMISAR, StrGrdFideicomisarios.Row];
    // Verifica que seá valida la selección
    If IsInteger(vlstrID_FID_FIDECOM) Then
      Begin
        If StpCancRelFidFideicomisario( StrToInt(vlstrID_FID_FIDECOM),
                                        CVERDAD,
                                        vlRESULTADO      ,
                                        vlTX_RESULTADO   ,
                                        True
                                      ) Then
          Begin
          MessageDlg('Se eliminó el fideicomisario '+vlstrNOM_FIDEICOMISAR+' relacionado con el Fideicomiso.', mtInformation, [mbOk], 0);
          MuestraDatos;
          End;
      End;
    End;
end;

procedure TWCrFideicMaestr.btnAgregarDelegadoClick(Sender: TObject);
var vlID_FID_REL_DEL : Integer;
    vlRESULTADO      : Integer;
    vlTX_RESULTADO   : String;
begin
 With Objeto Do
   Begin
    If Not PasaValidacion1 Then
      Exit;
   //
   DelegadoFiduciario.ShowAll := True;
   If DelegadoFiduciario.Busca Then
     Begin
     If StpAltaRelFidDelegado( ID_FID_MAESTRO.AsInteger,
                               DelegadoFiduciario.ID_PERSONA.AsInteger,
                               CVERDAD,
                               vlID_FID_REL_DEL,
                               vlRESULTADO,
                               vlTX_RESULTADO,
                               True
                             ) Then
       MuestraDatos;
     End;
   End;
end;

procedure TWCrFideicMaestr.btEliminarDelegadoClick(Sender: TObject);
var vlRESULTADO      : Integer;
    vlstrID_FID_REL_DEL, vlstrNOM_DELEGADO_FID, vlTX_RESULTADO   : String;
begin
 With Objeto Do
   Begin
    If Not PasaValidacion1 Then
      Exit;
    // Obtiene el ID_FID_REL_DEL seleccionado
    vlstrID_FID_REL_DEL   := StrGrdDelegados.Cells[CO_COL_ID_FID_REL_DEL, StrGrdDelegados.Row];
    vlstrNOM_DELEGADO_FID := StrGrdDelegados.Cells[CO_COL_NOM_DELEGADO_FID, StrGrdDelegados.Row];
    // Verifica que seá valida la selección
    If IsInteger(vlstrID_FID_REL_DEL) Then
      Begin
        If StpCancRelFidDelegado( StrToInt(vlstrID_FID_REL_DEL),
                                  CVERDAD,
                                  vlRESULTADO      ,
                                  vlTX_RESULTADO   ,
                                  True
                                ) Then
          Begin
          MessageDlg('Se eliminó el representante '+vlstrNOM_DELEGADO_FID+' relacionado con el Fideicomiso.', mtInformation, [mbOk], 0);
          MuestraDatos;
          End;
      End;
    End;
end;

procedure TWCrFideicMaestr.btnAgregarReglaClick(Sender: TObject);
var vlID_FID_REL_REG , vlRESULTADO : Integer;
    vlTX_RESULTADO   : String;
begin
 With Objeto Do
   Begin
     If Not PasaValidacion1 Then
       Exit;
     //
     ReglaFideicomisos.ShowAll := True;
     If ReglaFideicomisos.Busca Then
      Begin
      If StpAltaRelFidRegla(  ID_FID_MAESTRO.AsInteger,
                              ReglaFideicomisos.CVE_FID_REGLA.AsString,
                              CVERDAD,
                              vlID_FID_REL_REG ,
                              vlRESULTADO      ,
                              vlTX_RESULTADO   ,
                              True
                           ) Then
        MuestraDatos;
      End;
   End;
end;

procedure TWCrFideicMaestr.btnEliminarReglaClick(Sender: TObject);
var vlRESULTADO      : Integer;
    vlstrID_FID_REL_REG, vlstrDESC_FID_REGLA, vlTX_RESULTADO  : String;
begin
 With Objeto Do
   Begin
     If Not PasaValidacion1 Then
       Exit;
     // Obtiene el ID_FID_REL_REG seleccionado
     vlstrID_FID_REL_REG := StrGrdReglas.Cells[CO_COL_ID_FID_REL_REG, StrGrdReglas.Row];
     vlstrDESC_FID_REGLA := StrGrdReglas.Cells[CO_COL_DESC_FID_REGLA, StrGrdReglas.Row];
     // Verifica que seá valida la selección
     If IsInteger(vlstrID_FID_REL_REG) Then
       Begin
         If StpCancRelFidRegla( StrToInt(vlstrID_FID_REL_REG),
                                CVERDAD,
                                vlRESULTADO      ,
                                vlTX_RESULTADO   ,
                                True
                              ) Then
           Begin
           MessageDlg('Se eliminó la regla '+vlstrDESC_FID_REGLA+' relacionado con el Fideicomiso', mtInformation, [mbOk], 0);
           MuestraDatos;
           End;
       End;
   End;
end;

procedure TWCrFideicMaestr.StrGrdFideicomisariosDblClick(Sender: TObject);
var  vlstrID_FID_FIDECOM  : String;
begin
 With Objeto Do
   Begin
     // Obtiene el ID_FID_FIDECOM seleccionado
     vlstrID_FID_FIDECOM  := StrGrdFideicomisarios.Cells[CO_COL_ID_FID_FIDECOM, StrGrdFideicomisarios.Row];
     // Verifica que seá valida la selección
     If IsInteger(vlstrID_FID_FIDECOM) Then
       Begin
       Fideicomisario.FindKey([StrToInt(vlstrID_FID_FIDECOM)]);
       Fideicomisario.Modifica;
       MuestraDatos;
       End;
   End;
end;

procedure TWCrFideicMaestr.StrGrdDelegadosDblClick(Sender: TObject);
var vlstrID_PERSONA : String;
begin
 With Objeto Do
   Begin
    // Obtiene el ID_FID_REL_DEL seleccionado
    vlstrID_PERSONA   := StrGrdDelegados.Cells[CO_COL_ID_PERSONA, StrGrdDelegados.Row];
    // Verifica que seá valida la selección
    If IsInteger(vlstrID_PERSONA) Then
      Begin
      If DelegadoFiduciario.FindKey([StrToInt(vlstrID_PERSONA)]) Then
       Begin
       DelegadoFiduciario.ParamCre := Paramcre;
       DelegadoFiduciario.Consulta;
       MuestraDatos;
       End;
      End;
    End;
end;

procedure TWCrFideicMaestr.StrGrdReglasDblClick(Sender: TObject);
var vlstrCVE_FID_REGLA : String;
begin
 With Objeto Do
   Begin
     // Obtiene el ID_FID_REL_REG seleccionado
     vlstrCVE_FID_REGLA := StrGrdReglas.Cells[CO_COL_CVE_FID_REGLA, StrGrdReglas.Row];
     // Verifica que seá valida la selección
     If (Trim(vlstrCVE_FID_REGLA) <> '') Then
       Begin
       If ReglaFideicomisos.FindKey([vlstrCVE_FID_REGLA]) Then
        Begin
        ReglaFideicomisos.ParamCre := Paramcre;
        ReglaFideicomisos.Consulta;
        MuestraDatos;
        End;
       End;
   End;
end;

procedure TWCrFideicMaestr.edNUM_FOL_ADHESIONExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edNUM_FOL_ADHESION.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbNUM_FOL_ADHESION.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrFideicMaestr.edNOM_FIDEICOMITENExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edNOM_FIDEICOMITEN.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbNOM_FIDEICOMITEN.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrFideicMaestr.edNUM_LUGARExit(Sender: TObject);
var vlstrMsg : String;
begin
   InterForma1.ValidaExit(edNUM_LUGAR, True, '',True);
end;

procedure TWCrFideicMaestr.edIMP_HONORARIOSExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edIMP_HONORARIOS, True, '',True);
end;

procedure TWCrFideicMaestr.edIMP_FND_RESERVAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edIMP_FND_RESERVA, True, '',True);
end;

procedure TWCrFideicMaestr.edIMP_DIF_EXTEMPExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edIMP_DIF_EXTEMP, True, '',True);
end;

procedure TWCrFideicMaestr.edID_INTERMEDIARIOExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edID_INTERMEDIARIO.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbID_INTERMEDIARIO.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrFideicMaestr.edCUENTA_BANCOExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edCUENTA_BANCO.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbCUENTA_BANCO.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrFideicMaestr.InterForma1DespuesAceptar(Sender: TObject);
var vlstrMsg : String;
begin
  vlstrMsg := 'Favor de agregar ';
  If NoDataStrGrd(StrGrdFideicomisarios) Then
    Begin
    MessageDlg(vlstrMsg+' los '+grbxFideicomisarios.Caption+'.', mtInformation, [mbOk], 0);
    btnAgregarFideicomisarioClick(Self);
    End;

  If NoDataStrGrd(StrGrdDelegados) Then
    Begin
    MessageDlg(vlstrMsg+' los '+grbxDelegados.Caption+'.', mtInformation, [mbOk], 0);
    btnAgregarDelegadoClick(Self);
    End;

  If NoDataStrGrd(StrGrdReglas) Then
    Begin
    MessageDlg(vlstrMsg+' las '+grbxReglas.Caption+'.', mtInformation, [mbOk], 0);
    btnAgregarReglaClick(Self);
    End;

  ValidaDatosFideicomisoMaestro;
  ValidaDatosFideicomisoMaestro1;
end;

procedure TWCrFideicMaestr.ValidaDatosFideicomisoMaestro1;
begin
 With Objeto Do
  If (lbFideicomisarios.Visible Or lbDelegados.Visible Or lbReglas.Visible) Then
    MessageDlg('IMPORTANTE: Los datos del Fideicomiso "'+NUM_FOL_ADHESION.AsString+'" deben de estar'+coCRLF+
               'completamente configurados para poder operar con él.'+coCRLF+
               coCRLF+
               'Por favor revise los mensajes que se presentan en Pantalla.', mtWarning, [mbOk], 0);
end;               

end.
