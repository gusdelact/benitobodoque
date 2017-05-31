{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// Sistema         : Clase de CR_TRANS_BLOQ
// Fecha de Inicio : 07/11/2008
// Función forma   : Clase de CR_TRANS_BLOQ
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrTraBlo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntCtoPanel, InterEdit,
IntLinkit,

IntParamCre,
IntGenCre,
IntCtoHeader, // Contrato
IntCrBlqConc, // Catálogo Bloqueo de Concepto
IntCrBlqOper, // Catálogo Bloqueo de Operación
IntConSaldo   // Saldo del Contrato
;

Type
 TCrTraBlo= class; 

  TWCrTransBloq=Class(TForm)
    InterForma1             : TInterForma;
    lbIID_BLQ_TRANSAC: TLabel;
    edID_BLQ_TRANSAC: TEdit;
    lbTX_MOTIVO_RECHAZO: TLabel;
    edTX_MOTIVO_RECHAZO: TEdit;
    GroupBox1: TGroupBox;
    lbF_INICIO: TLabel;
    lbID_CREDITO: TLabel;
    lbNOM_ACREDITADO: TLabel;
    lblF_VENCIMIENTO: TLabel;
    lbIMP_CREDITO: TLabel;
    lbSDO_INSOLUTO: TLabel;
    Bevel1: TBevel;
    lbIMP_GARANTIZAR: TLabel;
    edID_CREDITO: TEdit;
    btID_CREDITO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    edF_INICIO: TEdit;
    dtpF_INICIO: TInterDateTimePicker;
    edF_VENCIMIENTO: TEdit;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    edIMP_CREDITO: TInterEdit;
    edSDO_INSOLUTO: TInterEdit;
    edIMP_GARANTIZAR: TInterEdit;
    GroupBox2: TGroupBox;
    lbID_CONTRATO_DV: TLabel;
    lbV_SDO_EFE_DV: TLabel;
    lbV_SDO_COMP_DV: TLabel;
    lbSDO_GTIA_CREDITO: TLabel;
    pnlID_CONTRATO_DV: TInterCtoPanel;
    btID_CONTRATO_DV: TBitBtn;
    edNOM_TITULAR_CTO_DV: TEdit;
    edV_SDO_EFE_DV: TInterEdit;
    edSDO_GTIA_CREDITO: TInterEdit;
    GroupBox3: TGroupBox;
    lbCVE_BLQ_OPERACION: TLabel;
    lbIMP_SALDO: TLabel;
    lbCVE_BLQ_CPTO: TLabel;
    edCVE_BLQ_OPERACION: TEdit;
    btCVE_BLQ_OPERACION: TBitBtn;
    edDESC_BLQ_OPERACION: TEdit;
    edCVE_BLQ_CPTO: TEdit;
    btCVE_BLQ_CPTO: TBitBtn;
    edDESC_BLQ_CPTO: TEdit;
    memTX_MOTIVO: TMemo;
    lbTX_MOTIVO: TLabel;
    lbFH_ALTA: TLabel;
    lbFH_ACTIVACION: TLabel;
    lbCVE_USU_ACTIVACION: TLabel;
    lbCVE_USU_ALTA: TLabel;
    edCVE_USU_ACTIVACION: TEdit;
    edCVE_USU_ALTA: TEdit;
    edFH_ALTA: TEdit;
    edFH_ACTIVACION: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbSIT_TRANS_BLOQ: TLabel;
    lbSituacion: TLabel;
    lbSIT_CREDITO1: TLabel;
    ilID_CREDITO: TInterLinkit;
    ilID_CONTRATO_DV: TInterLinkit;
    ilCVE_BLQ_OPERACION: TInterLinkit;
    ilCVE_BLQ_CPTO: TInterLinkit;
    edSIT_CREDITO: TEdit;
    edIMP_SALDO: TInterEdit;
    lbV_SDO_BLOQ_DV: TLabel;
    edV_SDO_BLOQ_DV: TInterEdit;
    edV_SDO_COMP_DV: TInterEdit;
    lbDESC_MONEDA: TLabel;
    edDESC_MONEDA: TEdit;
    edDESC_MONEDA_DV: TEdit;
    lbDESC_MONEDA_DV: TLabel;
    lbNOM_TITULAR_CTO_DV: TLabel;
    MsgPanel: TPanel;
    edID_CONTRATO_DV: TInterEdit;
    chkFilterAcreditado: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure btID_CONTRATO_DVClick(Sender: TObject);
    procedure ilID_CONTRATO_DVEjecuta(Sender: TObject);
    procedure btCVE_BLQ_OPERACIONClick(Sender: TObject);
    procedure btCVE_BLQ_CPTOClick(Sender: TObject);
    procedure ilCVE_BLQ_OPERACIONEjecuta(Sender: TObject);
    procedure ilCVE_BLQ_CPTOEjecuta(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure edID_CONTRATO_DVExit(Sender: TObject);
    procedure edCVE_BLQ_OPERACIONExit(Sender: TObject);
    procedure edCVE_BLQ_CPTOExit(Sender: TObject);
    procedure edIMP_SALDOExit(Sender: TObject);
    procedure memTX_MOTIVOExit(Sender: TObject);
    procedure memTX_MOTIVOKeyPress(Sender: TObject; var Key: Char);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrTraBlo;

    procedure SIT_TRANS_BLOQChange(Sender: TObject);

end;
 TCrTraBlo= class(TInterFrame)
      private

      protected

      public
        { Public declarations }
        ID_BLQ_TRANSAC           : TInterCampo;
        ID_CREDITO               : TInterCampo;
        ID_CONTRATO_DV           : TInterCampo;
        CVE_BLQ_OPERACION        : TInterCampo;
        NOM_ACREDITADO           : TInterCampo;
        CVE_BLQ_CPTO             : TInterCampo;
        IMP_SALDO                : TInterCampo;
        PCT_BLOQUEADO            : TInterCampo;
        SIT_TRANS_BLOQ           : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_ALTA                  : TInterCampo;
        CVE_USU_ACTIVACION         : TInterCampo;
        FH_ACTIVACION              : TInterCampo;
        TX_MOTIVO                : TInterCampo;
        TX_MOTIVO_RECHAZO         : TInterCampo;
        NOM_TITULAR_CTO_DV       : TInterCampo;
        V_SDO_EFE_DV             : TInterCampo;
        V_SDO_BLOQ_DV            : TInterCampo;
        V_SDO_COMP_DV            : TInterCampo;

        ID_TITULAR               : TInterCampo;
        F_INICIO                 : TInterCampo;
        F_VENCIMIENTO            : TInterCampo;
        IMP_CREDITO              : TInterCampo;
        SDO_INSOLUTO             : TInterCampo;
        IMP_GARANTIZAR           : TInterCampo;
        SIT_CREDITO              : TInterCampo;
        SDO_GTIA_CREDITO         : TInterCampo;

        DESC_MONEDA              : TInterCampo;
        DESC_MONEDA_DV           : TInterCampo;

        CVE_MONEDA               : TInterCampo;

        ParamCre                 : TParamCre;

        vgpnlID_CONTRATO_DV      : TInterCtoPanel;

        Contrato  : TCtrlCto;
        CrBlqOper : TCrBlqOper;
        CrBlqConc : TCrBlqConc;
        ConSaldo  : TConSaldo;

        function    InternalBusca : Boolean; override;
        function    InternalPost : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

        procedure GetDataFromControls;
        function InsTransBloqueo : Boolean;
        function ActivaTransBloqueo : Boolean;

       procedure ColocaDatosDiposicion(peID_CREDITO : Integer);
       procedure ColocaDatosChequera(peID_CONTRATO_DV : String);
      published
      end;


implementation
{$R *.DFM}

constructor TCrTraBlo.Create( AOwner : TComponent );
begin Inherited;
      ID_BLQ_TRANSAC :=CreaCampo('ID_BLQ_TRANSAC',ftFloat,tsNinguno,tsNinguno,True);
                ID_BLQ_TRANSAC.Caption:='Número de Trans Blq Sdo';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      ID_CONTRATO_DV :=CreaCampo('ID_CONTRATO_DV',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO_DV.Caption:='Número de Contrato Depósitos a la Vista';
      CVE_BLQ_CPTO :=CreaCampo('CVE_BLQ_CPTO',ftString,tsNinguno,tsNinguno,True);
                CVE_BLQ_CPTO.Caption:='Clave de Blq Cpto';
      CVE_BLQ_OPERACION :=CreaCampo('CVE_BLQ_OPERACION',ftString,tsNinguno,tsNinguno,True);
                CVE_BLQ_OPERACION.Caption:='Clave de Tipo Bloqueo';
      NOM_ACREDITADO :=CreaCampo('NOM_ACREDITADO',ftString,tsNinguno,tsNinguno,False);
                NOM_ACREDITADO.Caption:='Nombre del Acreditado';
      IMP_SALDO :=CreaCampo('IMP_SALDO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_SALDO.Caption:='Imp Saldo';
      PCT_BLOQUEADO :=CreaCampo('PCT_BLOQUEADO',ftFloat,tsNinguno,tsNinguno,True);
                PCT_BLOQUEADO.Caption:='Pct Bloqueado';
      SIT_TRANS_BLOQ :=CreaCampo('SIT_TRANS_BLOQ',ftString,tsNinguno,tsNinguno,True);
                SIT_TRANS_BLOQ.Caption:='Situación Trans Bloq';

      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      FH_ALTA :=CreaCampo('FH_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                FH_ALTA.Caption:='Fecha y Hora Alta';
      CVE_USU_ACTIVACION :=CreaCampo('CVE_USU_ACTIVACION',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ACTIVACION.Caption:='Clave de Usu ACTIVACION';
      FH_ACTIVACION :=CreaCampo('FH_ACTIVACION',ftDateTime,tsNinguno,tsNinguno,True);
                FH_ACTIVACION.Caption:='Fecha y Hora ACTIVACION';
      TX_MOTIVO :=CreaCampo('TX_MOTIVO',ftString,tsNinguno,tsNinguno,True);
                TX_MOTIVO.Caption:='Motivo';
      TX_MOTIVO_RECHAZO :=CreaCampo('TX_MOTIVO_RECHAZO',ftString,tsNinguno,tsNinguno,True);
                TX_MOTIVO_RECHAZO.Caption:='Motivo Rechzo';

      F_INICIO :=CreaCampo('F_INICIO',ftDate,tsNinguno,tsNinguno,False);
                F_INICIO.Caption:='Fecha de Inicio de la Disposición';
      F_VENCIMIENTO :=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,False);
                F_VENCIMIENTO.Caption:='Fecha de Inicio de la Disposición';
      IMP_CREDITO :=CreaCampo('IMP_CREDITO',ftFloat,tsNinguno,tsNinguno,False);
                IMP_CREDITO.Caption:='Importe de la Disposición';
      SDO_INSOLUTO :=CreaCampo('SDO_INSOLUTO',ftFloat,tsNinguno,tsNinguno,False);
                SDO_INSOLUTO.Caption:='Saldo Insoluto de la Disposición';
      IMP_GARANTIZAR :=CreaCampo('IMP_GARANTIZAR',ftFloat,tsNinguno,tsNinguno,False);
                IMP_GARANTIZAR.Caption:='Importe a Garantizar de la Disposición';
      SDO_GTIA_CREDITO :=CreaCampo('SDO_GTIA_CREDITO',ftFloat,tsNinguno,tsNinguno,False);
                SDO_GTIA_CREDITO.Caption:='Saldo én Garantía de la Disposición';

      SIT_CREDITO :=CreaCampo('SIT_CREDITO',ftString,tsNinguno,tsNinguno,False);
                SIT_CREDITO.Caption:='Situación de la Disposición';

      ID_TITULAR :=CreaCampo('ID_TITULAR',ftInteger,tsNinguno,tsNinguno,False);
                ID_TITULAR.Caption:='Id. Acreditado';
      NOM_TITULAR_CTO_DV :=CreaCampo('NOM_TITULAR_CTO_DV',ftString,tsNinguno,tsNinguno,False);
                NOM_TITULAR_CTO_DV.Caption:='Nombre del Titular de la Chequera';
      V_SDO_EFE_DV :=CreaCampo('V_SDO_EFE_DV',ftFloat,tsNinguno,tsNinguno,False);
                V_SDO_EFE_DV.Caption:='Importe Disponible de la Chequera';
      V_SDO_BLOQ_DV :=CreaCampo('V_SDO_BLOQ_DV',ftFloat,tsNinguno,tsNinguno,False);
                V_SDO_EFE_DV.Caption:='Importe Bloqueado de la Chequera';
      V_SDO_COMP_DV :=CreaCampo('V_SDO_COMP_DV',ftFloat,tsNinguno,tsNinguno,False);
                V_SDO_EFE_DV.Caption:='Importe Comprometido de la Chequera';

      DESC_MONEDA :=CreaCampo('DESC_MONEDA',ftString,tsNinguno,tsNinguno,False);
                DESC_MONEDA.Caption:='Moneda de la diposición';
      DESC_MONEDA_DV :=CreaCampo('DESC_MONEDA_DV',ftString,tsNinguno,tsNinguno,False);
                DESC_MONEDA_DV.Caption:='Moneda de la chequera';
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftInteger,tsNinguno,tsNinguno,False);
                      CVE_MONEDA.Caption:='Moneda de la disposición';

      FKeyFields.Add('ID_BLQ_TRANSAC');

      {$WARNINGS OFF}
      Contrato := TCtrlCto.Create(Self);
      {$WARNINGS ON}
      Contrato.MasterSource:=Self;
      Contrato.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO_DV';


      {$WARNINGS OFF}
      CrBlqOper := TCrBlqOper.Create(Self);
      {$WARNINGS ON}
      CrBlqOper.MasterSource:=Self;
      CrBlqOper.FieldByName('CVE_BLQ_OPERACION').MasterField:='CVE_BLQ_OPERACION';


      {$WARNINGS OFF}
      CrBlqConc := TCrBlqConc.Create(Self);
      {$WARNINGS ON}
      CrBlqConc.MasterSource:=Self;
      CrBlqConc.FieldByName('CVE_BLQ_CPTO').MasterField:='CVE_BLQ_CPTO';

      {$WARNINGS OFF}
      ConSaldo := TConSaldo.Create(Self);
      {$WARNINGS ON}
      ConSaldo.MasterSource:=Self;

      TableName := 'CR_BLQ_TRANSAC';
      UseQuery := True;
      HelpFile := 'IntCrTraBlo.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrTraBlo.Destroy;
begin
  Try
    If Assigned(Contrato)  Then Contrato.Free;
    If Assigned(CrBlqOper) Then CrBlqOper.Free;
    If Assigned(CrBlqConc) Then CrBlqConc.Free;
    If Assigned(ConSaldo)  Then ConSaldo.Free;
  Finally
   Inherited;
  End; 
end;

function TCrTraBlo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTransBloq;
begin
   W:=TWCrTransBloq.Create(Self);
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

Function TCrTraBlo.InternalBusca:Boolean;
Var T:TInterFindit;
    vlBResult : Boolean;
begin InternalBusca := False;
      T := CreaBuscador('ICrTrBl.it','F');
      Try if Active then begin T.Param(0,ID_BLQ_TRANSAC.AsString);
                               end;
          if T.Execute then
              Begin
              vlBResult := FindKey([T.DameCampo(0)]);
              If (vlBResult) Then
                Begin
                ColocaDatosDiposicion(ID_CREDITO.AsInteger);
                ColocaDatosChequera(ID_CONTRATO_DV.AsString);
                End;
              InternalBusca := vlBResult;
              End;

      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_TRANS_BLOQ********************)
(*                                                                              *)
(*  FORMA DE CR_TRANS_BLOQ                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_TRANS_BLOQ********************)

procedure TWCrTransBloq.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    ID_BLQ_TRANSAC.Control      := edID_BLQ_TRANSAC;
    ID_CREDITO.Control          := edID_CREDITO;
    ID_CONTRATO_DV.Control      := edID_CONTRATO_DV;
    CVE_BLQ_CPTO.Control        := edCVE_BLQ_CPTO;
    CVE_BLQ_OPERACION.Control   := edCVE_BLQ_OPERACION;
    NOM_ACREDITADO .Control     := edNOM_ACREDITADO;

    IMP_SALDO.Control           := edIMP_SALDO;
    CVE_USU_ALTA.Control        := edCVE_USU_ALTA;
    FH_ALTA.Control             := edFH_ALTA;
    CVE_USU_ACTIVACION.Control  := edCVE_USU_ACTIVACION;
    FH_ACTIVACION.Control       := edFH_ACTIVACION;
    TX_MOTIVO.Control           := memTX_MOTIVO;
    TX_MOTIVO_RECHAZO.Control   := edTX_MOTIVO_RECHAZO;

    F_INICIO.Control            := edF_INICIO;
    F_VENCIMIENTO.Control       := edF_VENCIMIENTO;
    IMP_CREDITO.Control         := edIMP_CREDITO;
    SDO_INSOLUTO.Control        := edSDO_INSOLUTO;
    IMP_GARANTIZAR.Control      := edIMP_GARANTIZAR;
    SIT_CREDITO.Control         := edSIT_CREDITO;
    SDO_GTIA_CREDITO.Control    := edSDO_GTIA_CREDITO;

    DESC_MONEDA.Control         := edDESC_MONEDA;
    DESC_MONEDA_DV.Control      := edDESC_MONEDA_DV;

    NOM_TITULAR_CTO_DV.Control  := edNOM_TITULAR_CTO_DV;
    V_SDO_EFE_DV.Control   := edV_SDO_EFE_DV;
    V_SDO_BLOQ_DV.Control  := edV_SDO_BLOQ_DV;
    V_SDO_COMP_DV.Control  := edV_SDO_COMP_DV;

    Contrato.ID_CONTRATO.Control := edID_CONTRATO_DV;
    pnlID_CONTRATO_DV.Frame := Contrato;
    pnlID_CONTRATO_DV.RefrescaInfo;
    vgpnlID_CONTRATO_DV := pnlID_CONTRATO_DV;

    CrBlqOper.CVE_BLQ_OPERACION.Control := edCVE_BLQ_OPERACION;
    CrBlqOper.DESC_BLQ_OPERACION.Control := edDESC_BLQ_OPERACION;

    CrBlqConc.CVE_BLQ_CPTO.Control := edCVE_BLQ_CPTO;
    CrBlqConc.DESC_BLQ_CPTO.Control := edDESC_BLQ_CPTO;

    SIT_TRANS_BLOQ.OnChange := SIT_TRANS_BLOQChange;
    Interforma1.MsgPanel := MsgPanel;
    End;
end;

procedure TWCrTransBloq.FormDestroy(Sender: TObject);
begin
  With Objeto Do
    Begin
    ID_BLQ_TRANSAC.Control      := Nil;
    ID_CREDITO.Control          := Nil;
    ID_CONTRATO_DV.Control      := Nil;
    CVE_BLQ_CPTO.Control        := Nil;
    CVE_BLQ_OPERACION.Control   := Nil;
    NOM_ACREDITADO.Control      := Nil;
    IMP_SALDO.Control           := Nil;
    CVE_USU_ALTA.Control        := Nil;
    FH_ALTA.Control             := Nil;
    CVE_USU_ACTIVACION.Control  := Nil;
    FH_ACTIVACION.Control       := Nil;
    TX_MOTIVO.Control           := Nil;
    TX_MOTIVO_RECHAZO.Control   := Nil;

    F_INICIO.Control            := Nil;
    F_VENCIMIENTO.Control       := Nil;
    IMP_CREDITO.Control         := Nil;
    SDO_INSOLUTO.Control        := Nil;
    IMP_GARANTIZAR.Control      := Nil;
    SIT_CREDITO.Control         := Nil;
    SDO_GTIA_CREDITO.Control    := Nil;

    NOM_TITULAR_CTO_DV.Control  := Nil;

    DESC_MONEDA.Control         := Nil;
    DESC_MONEDA_DV.Control      := Nil;

    V_SDO_EFE_DV.Control        := Nil;
    V_SDO_BLOQ_DV.Control       := Nil;
    V_SDO_COMP_DV.Control       := Nil;

    Contrato.ID_CONTRATO.Control := Nil;
    pnlID_CONTRATO_DV.Frame := Nil;
    vgpnlID_CONTRATO_DV := Nil;

    CrBlqOper.CVE_BLQ_OPERACION.Control  := Nil;
    CrBlqOper.DESC_BLQ_OPERACION.Control := Nil;

    CrBlqConc.CVE_BLQ_CPTO.Control  := Nil;
    CrBlqConc.DESC_BLQ_CPTO.Control := Nil;

    Interforma1.MsgPanel := Nil;
    End;
end;

procedure TWCrTransBloq.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrTransBloq.InterForma1DespuesNuevo(Sender: TObject);
begin
   With Objeto Do
     Begin
     If (edID_CREDITO.CanFocus) Then edID_CREDITO.SetFocus;
     SIT_TRANS_BLOQ.AsString := 'PA';
     End;
end;

procedure TCrTraBlo.GetDataFromControls;
begin
  ID_BLQ_TRANSAC.GetFromControl;
  ID_CREDITO.GetFromControl;
  ID_CONTRATO_DV.GetFromControl;
  CVE_BLQ_CPTO.GetFromControl;
  CVE_BLQ_OPERACION.GetFromControl;
  IMP_SALDO.GetFromControl;
  PCT_BLOQUEADO.GetFromControl;
  SIT_TRANS_BLOQ.GetFromControl;
  CVE_USU_ALTA.GetFromControl;
  FH_ALTA.GetFromControl;
  CVE_USU_ACTIVACION.GetFromControl;
  FH_ACTIVACION.GetFromControl;
  TX_MOTIVO.GetFromControl;
  TX_MOTIVO_RECHAZO.GetFromControl;
end;

function TCrTraBlo.InsTransBloqueo : Boolean;
var vlStp : TStoredProc;
begin
  Result := False;
  vlStp := TStoredProc.Create(Nil);
  GetDataFromControls;
  With vlStp Do
     Try
       //Inicia el SPT
       vlStp.DatabaseName := Apli.DatabaseName;
       vlStp.SessionName  := Apli.SessionName;
       StoredProcName:= 'PKGCRGTIA.STP_INS_TRANS_BLOQUEO';

       Params.Clear;
       Params.CreateParam( ftInteger ,'peID_CREDITO',        ptInput);
       Params.CreateParam( ftInteger ,'peID_CONTRATO_DV',    ptInput);
       Params.CreateParam( ftString  ,'peCVE_BLQ_CPTO',      ptInput);
       Params.CreateParam( ftString  ,'peCVE_BLQ_OPERACION', ptInput);
       Params.CreateParam( ftFloat   ,'peIMP_SALDO',         ptInput);
       Params.CreateParam( ftFloat   ,'pePCT_BLOQUEADO',     ptInput);
       Params.CreateParam( ftString  ,'peCVE_USU_ALTA',      ptInput);
       Params.CreateParam( ftString  ,'peTX_MOTIVO',         ptInput);
       Params.CreateParam( ftString  ,'peB_COMMIT',          ptInput);
       Params.CreateParam( ftInteger ,'psID_BLQ_TRANSAC',    ptOutput);
       Params.CreateParam( ftInteger ,'psRESULTADO',         ptOutput);
       Params.CreateParam( ftString  ,'psTX_RESULTADO',      ptOutput);

       // Asigna los valores
       ParamByName('peID_CREDITO').AsInteger       := ID_CREDITO.AsInteger;
       ParamByName('peID_CONTRATO_DV').AsInteger   := ID_CONTRATO_DV.AsInteger;
       ParamByName('peCVE_BLQ_CPTO').AsString      := CVE_BLQ_CPTO.AsString;
       ParamByName('peCVE_BLQ_OPERACION').AsString := CVE_BLQ_OPERACION.AsString;
       ParamByName('peIMP_SALDO').AsFloat          := IMP_SALDO.AsFloat;
       ParamByName('pePCT_BLOQUEADO').AsFloat      := PCT_BLOQUEADO.AsFloat;
       ParamByName('peCVE_USU_ALTA').AsString      := DameUsuario;
       ParamByName('peTX_MOTIVO').AsString         := TX_MOTIVO.AsString;
       ParamByName('peB_COMMIT').AsString          := 'V';

       ExecProc;
       If (ParamByName('psRESULTADO').AsInteger = 0) Then
         Begin
         ID_BLQ_TRANSAC.AsInteger := ParamByName('psID_BLQ_TRANSAC').AsInteger;
         FH_ALTA.AsDateTime := Now;
         CVE_USU_ALTA.AsString := DameUsuario;
         Result := True;
         End
       Else
         Begin
         TX_MOTIVO_RECHAZO.AsString := ParamByName('psTX_RESULTADO').AsString;
         MessageDlg(TX_MOTIVO_RECHAZO.AsString, mtError, [mbOk], 0);
         End;
         
     Finally
       Free;
     End;
end;

function TCrTraBlo.ActivaTransBloqueo : Boolean;
var vlStp : TStoredProc;
begin
  Result := False;
  vlStp := TStoredProc.Create(Nil);
  GetDataFromControls;
  With vlStp Do
     Try
       //Inicia el SPT
       vlStp.DatabaseName := Apli.DatabaseName;
       vlStp.SessionName  := Apli.SessionName;
       StoredProcName:= 'PKGCRGTIA.STP_ACTIVA_TRANS_BLOQUEO';

       Params.Clear;
       Params.CreateParam( ftInteger ,'peID_BLQ_TRANSAC',    ptInput);
       Params.CreateParam( ftString  ,'peCVE_USU_ACTIVACION',  ptInput);
       Params.CreateParam( ftString  ,'peB_COMMIT',          ptInput);
       Params.CreateParam( ftInteger ,'psRESULTADO',         ptOutput);
       Params.CreateParam( ftString  ,'psTX_RESULTADO',      ptOutput);

       // Asigna los valores
       ParamByName('peID_BLQ_TRANSAC').AsInteger   := ID_BLQ_TRANSAC.AsInteger;
       ParamByName('peCVE_USU_ACTIVACION').AsString  := DameUsuario;
       ParamByName('peB_COMMIT').AsString          := 'V';

       ExecProc;
       If (ParamByName('psRESULTADO').AsInteger = 0) Then
         Begin
         FH_ACTIVACION.AsDateTime := Now;
         CVE_USU_ACTIVACION.AsString := DameUsuario;
         SIT_TRANS_BLOQ.AsString := 'AC';
         TX_MOTIVO_RECHAZO.AsString := '';
         Result := True;
         End
       Else
         Begin
         TX_MOTIVO_RECHAZO.AsString := ParamByName('psTX_RESULTADO').AsString;
         MessageDlg(TX_MOTIVO_RECHAZO.AsString, mtError, [mbOk], 0);
         End;

     Finally
       Free;
     End;
end;

procedure TCrTraBlo.ColocaDatosDiposicion(peID_CREDITO : Integer);
var vlSQL, vlstrID_CREDITO : String;
    vlQry : TQuery;
    vlPCT_GTIA_LIQ : Real;
begin
  vlstrID_CREDITO := IntToStr(peID_CREDITO);

  vlSQL :=  ' SELECT CC.ID_CREDITO, CC.ID_CONTRATO, CTO.ID_TITULAR, CTO.CVE_MONEDA, M.DESC_MONEDA, P.NOMBRE, CC.F_INICIO, CC.IMP_CREDITO,'+coCRLF+
            '        NVL(CCAS.IMP_CAP_VIG, CC.SDO_VIG_TOTAL) AS SDO_INSOLUTO, CC.F_VENCIMIENTO, CC.SIT_CREDITO'+coCRLF+
            ' FROM (  SELECT ID_CREDITO, ID_CONTRATO, F_INICIO, F_VENCIMIENTO, IMP_CREDITO, SDO_VIG_TOTAL, SIT_CREDITO '+coCRLF+
            '         FROM CR_CREDITO'+coCRLF+
            '         WHERE SIT_CREDITO <> ''CA'''+coCRLF+
            '           AND ID_CREDITO = '+vlstrID_CREDITO+coCRLF+
            '       UNION ALL'+coCRLF+
            '         SELECT ID_CREDITO, ID_CONTRATO, F_VALOR_CRED, (F_VALOR_CRED + DIAS_PLAZO) AS F_VENCIMIENTO, IMP_CREDITO, SDO_INSOLUTO, SIT_CREDITO'+coCRLF+
            '         FROM CRE_CREDITO'+coCRLF+
            '         WHERE SIT_CREDITO NOT IN (''CA'',''TA'')'+coCRLF+
            '           AND ID_CREDITO = '+vlstrID_CREDITO+coCRLF+
            '      ) CC,'+coCRLF+
            '      ( SELECT ID_CREDITO, IMP_CAP_VIG'+coCRLF+
            '        FROM CR_CON_ADEUDO_SDO'+coCRLF+
            '        WHERE F_CIERRE = ( SELECT F_REFERENCIA FROM FECHA_EMPRESA'+coCRLF+
            '                           WHERE ID_EMPRESA = 2'+coCRLF+
            '                             AND CVE_DIA_LIQUIDA = ''AYER'''+coCRLF+
            '                         )'+coCRLF+
            '         AND ID_CREDITO = '+vlstrID_CREDITO+coCRLF+
            '      ) CCAS,'+coCRLF+
            '      CONTRATO CTO,'+coCRLF+
            '      PERSONA P,'+coCRLF+
            '      MONEDA M'+coCRLF+
            ' WHERE CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '   AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
            '   AND M.CVE_MONEDA = CTO.CVE_MONEDA'+coCRLF+
            '   AND CCAS.ID_CREDITO (+)= CC.ID_CREDITO'+coCRLF
            ;

  vlQry := GetSQLQueryNoNil(vlSQL, Apli.DataBaseName, Apli.SessionName, True);
  If Assigned(vlQry) Then
    Try
      If ((Modo = moAppend) Or (Modo = moEdit)) Then
        Begin
        ID_CREDITO.AsInteger     := peID_CREDITO;
        End;

      ID_TITULAR.AsInteger     := vlQry.FieldByName('ID_TITULAR').AsInteger;
      NOM_ACREDITADO.AsString  := vlQry.FieldByName('NOMBRE').AsString;
      F_INICIO.AsDateTime      := vlQry.FieldByName('F_INICIO').AsDateTime;
      F_VENCIMIENTO.AsDateTime := vlQry.FieldByName('F_VENCIMIENTO').AsDateTime;
      IMP_CREDITO.AsFloat      := vlQry.FieldByName('IMP_CREDITO').AsFloat;
      SDO_INSOLUTO.AsFloat     := vlQry.FieldByName('SDO_INSOLUTO').AsFloat;
      IMP_GARANTIZAR.AsFloat   := 0;
      SIT_CREDITO.AsString     := vlQry.FieldByName('SIT_CREDITO').AsString;
      DESC_MONEDA.AsString     := vlQry.FieldByName('DESC_MONEDA').AsString;
      CVE_MONEDA.AsInteger     := vlQry.FieldByName('CVE_MONEDA').AsInteger;
    Finally
      vlQry.Close;
      vlQry.Free;
    End;

    // Coloca el Porcentaje a Garantizar
    If GetSQLFloat(' SELECT R.PCT_GTIA_LIQ'+coCRLF+
                   ' FROM (    SELECT NVL(CGFC.PCT_GTIA_LIQ, 0) AS PCT_GTIA_LIQ'+coCRLF+
                   '           FROM CR_CREDITO CC,'+coCRLF+
                   '                CR_GA_FIRA_CTO CGFC'+coCRLF+
                   '           WHERE CC.ID_CREDITO = '+IntToStr(peID_CREDITO)+coCRLF+
                   '             AND CC.SIT_CREDITO <> ''CA'''+coCRLF+
                   '             AND CGFC.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                   '             AND CGFC.CVE_OPERATIVA = CC.CVE_OPERATIVA'+coCRLF+
                   '             AND CGFC.SIT_GA_FIRA = ''AC'''+coCRLF+
                   '        UNION'+coCRLF+
                   '           SELECT (NVL(FACT_PROPOR_GAR,0) * 100 ) AS FACT_PROPOR_GAR'+coCRLF+
                   '           FROM CRE_CREDITO CC'+coCRLF+
                   '           WHERE CC.ID_CREDITO = '+IntToStr(peID_CREDITO)+coCRLF+
                   '             AND CC.SIT_CREDITO NOT IN (''CA'', ''TA'')'+coCRLF+
                   '      ) R'+coCRLF+
                   ' WHERE ROWNUM = 1'+coCRLF,
                   Apli.DataBaseName,
                   Apli.SessionName,
                   'PCT_GTIA_LIQ',
                   vlPCT_GTIA_LIQ,
                   False
                   ) Then
      IMP_GARANTIZAR.AsFloat := (vlPCT_GTIA_LIQ * IMP_CREDITO.AsFloat / 100);
end;

procedure TCrTraBlo.ColocaDatosChequera(peID_CONTRATO_DV: String);
var vlSQL : String;
    vlQry : TQuery;
begin
  If Pos('-',peID_CONTRATO_DV) > 0 Then
    peID_CONTRATO_DV := StringReplace(peID_CONTRATO_DV, '-', Copy('000000000', 1, 10 - Length(peID_CONTRATO_DV)),
                                     [rfReplaceAll, rfIgnoreCase]);

  vlSQL :=  ' SELECT CTO.ID_CONTRATO, CTO.ID_TITULAR, M.DESC_MONEDA, P.NOMBRE, CBSC.SDO_GTIA_CREDITO, CTO.SIT_CONTRATO'+coCRLF+
            ' FROM DV_CONTRATO DC,'+coCRLF+
            '      CONTRATO CTO,'+coCRLF+
            '      MONEDA M,'+coCRLF+
            '      PERSONA P,'+coCRLF+
            '      ( SELECT CBSC.ID_CONTRATO_DV, SUM(CBSC.IMP_SDO_BLOQUEO) AS SDO_GTIA_CREDITO'+coCRLF+
            '        FROM CR_BLQ_SDO_CHEQ CBSC'+coCRLF+
            '        WHERE CBSC.ID_CONTRATO_DV = '+peID_CONTRATO_DV+coCRLF+
            '        GROUP BY CBSC.ID_CONTRATO_DV'+coCRLF+
            '      ) CBSC'+coCRLF+
            ' WHERE DC.ID_CONTRATO = '+peID_CONTRATO_DV+coCRLF+
            '   AND CTO.ID_CONTRATO = DC.ID_CONTRATO'+coCRLF+
            '   AND CBSC.ID_CONTRATO_DV (+)= DC.ID_CONTRATO'+coCRLF+
            '   AND M.CVE_MONEDA = CTO.CVE_MONEDA'+coCRLF+            
            '   AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
            ' ORDER BY P.NOMBRE'+coCRLF
            ;

  vlQry := GetSQLQueryNoNil(vlSQL, Apli.DataBaseName, Apli.SessionName, True);
  If Assigned(vlQry) Then
    Try
      If ((Modo = moAppend) Or (Modo = moEdit)) Then
        Begin
        ID_CONTRATO_DV.AsString := peID_CONTRATO_DV;
        End;
      NOM_TITULAR_CTO_DV.AsString   := vlQry.FieldByName('NOMBRE').AsString;
      DESC_MONEDA_DV.AsString   := vlQry.FieldByName('DESC_MONEDA').AsString;
      SDO_GTIA_CREDITO.AsFloat  := vlQry.FieldByName('SDO_GTIA_CREDITO').AsFloat;

      CONTRATO.FindKey([peID_CONTRATO_DV]);
      vgpnlID_CONTRATO_DV.RefrescaInfo;

      ConSaldo.Apli := Apli;
      ConSaldo.FindKey([ID_CONTRATO_DV.AsString,'V','V','F','F']);

      V_SDO_EFE_DV.AsFloat  := ConSaldo.Contable.AsFloat; // ConSaldo.V_SDO_EFE_DV.AsFloat;
      V_SDO_BLOQ_DV.AsFloat := ConSaldo.V_SDO_BLOQ_DV.AsFloat;
      V_SDO_COMP_DV.AsFloat := ConSaldo.V_SDO_COMP_DV.AsFloat;
    Finally
      vlQry.Close;
      vlQry.Free;
    End;
end;

procedure TWCrTransBloq.btID_CREDITOClick(Sender: TObject);
Var vlInterFindit : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRTRABLO_DISPO',True,True) then
   begin
      VlInterFindit := Objeto.CreaBuscador('CONSDISP.IT','');
      Try
        If vlInterFindit.Execute Then
          Begin
          Objeto.ID_CREDITO.AsInteger := StrToInt(vlInterFindit.DameCampo(0));
          Objeto.ColocaDatosDiposicion(Objeto.ID_CREDITO.AsInteger);
          InterForma1.NextTab(edID_CREDITO);
          End;
      Finally
          vlInterFindit.Free;
      End;
   end;
end;

procedure TWCrTransBloq.ilID_CREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show := True;
end;

procedure TWCrTransBloq.ilID_CREDITOEjecuta(Sender: TObject);
begin
  Objeto.ColocaDatosDiposicion(StrToInt(ilID_CREDITO.Buffer));
  InterForma1.NextTab(edID_CREDITO);
end;

procedure TWCrTransBloq.btID_CONTRATO_DVClick(Sender: TObject);
Var vlInterFindit : TInterFindit;
    vlStrFilterContrato : String;
begin
   if Objeto.ValidaAccesoEsp('TCRTRABLO_CHEQ',True,True) then
   begin
      VlInterFindit := Objeto.CreaBuscador('CONSCHEQ.IT','');
      Try
        vlStrFilterContrato := '';
        If (chkFilterAcreditado.Checked) Then
           Begin
           vlStrFilterContrato := ' AND CTO.ID_TITULAR = '+Objeto.ID_TITULAR.AsString;
           End;

        VlInterFindit.WhereString := ' CTO.CVE_MONEDA = '+Objeto.CVE_MONEDA.AsString + vlStrFilterContrato;
        If vlInterFindit.Execute Then
          Begin
          Objeto.ID_CONTRATO_DV.AsInteger := StrToInt(vlInterFindit.DameCampo(0));
          Objeto.ColocaDatosChequera(Objeto.ID_CONTRATO_DV.AsString);
          End;
      Finally
          vlInterFindit.Free;
      End;
   end;
end;

procedure TWCrTransBloq.ilID_CONTRATO_DVEjecuta(Sender: TObject);
begin
  Objeto.ColocaDatosChequera(ilID_CONTRATO_DV.Buffer);
  InterForma1.NextTab(edID_CONTRATO_DV);
end;

procedure TWCrTransBloq.btCVE_BLQ_OPERACIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRTRABLO_CVEMTO',True,True) then
   begin
     With Objeto Do
       Begin
       CrBlqOper.ShowAll := True;
       CrBlqOper.BuscaWhereString := ' SIT_BLQ_OPERACION = ''AC''  AND CVE_BLQ_OPER_CANC IS NOT NULL  ';
       If CrBlqOper.Busca Then
         InterForma1.NextTab(edCVE_BLQ_OPERACION);
       End;
   end;
end;

procedure TWCrTransBloq.btCVE_BLQ_CPTOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRTRABLO_CVECON',True,True) then
   begin
     With Objeto Do
       Begin
       CrBlqConc.ShowAll := True;
       CrBlqConc.BuscaWhereString := ' SIT_BLQ_CONCEPTO = ''AC''';
       If CrBlqConc.Busca Then
          Begin
          InterForma1.NextTab(edCVE_BLQ_CPTO);
          End;
       End;
   end;
end;

procedure TWCrTransBloq.ilCVE_BLQ_OPERACIONEjecuta(Sender: TObject);
begin
  Objeto.CrBlqOper.FindKey([ilCVE_BLQ_OPERACION.Buffer]);
  InterForma1.NextTab(edCVE_BLQ_OPERACION);
end;

procedure TWCrTransBloq.ilCVE_BLQ_CPTOEjecuta(Sender: TObject);
begin
  Objeto.CrBlqConc.FindKey([ilCVE_BLQ_CPTO.Buffer]);
  InterForma1.NextTab(edCVE_BLQ_CPTO);  
end;

procedure TWCrTransBloq.edID_CREDITOExit(Sender: TObject);
var vlbContinua : Boolean;
    vlStrMensaje : String;
Begin
  vlbContinua := True; vlStrMensaje := '';
  With Objeto Do
    If ((Modo = moEdit) Or (Modo = moAppend)) then
       Begin
       ID_CREDITO.GetFromControl;
       If (ID_CREDITO.AsFloat <= 0) Then
          Begin
          vlbContinua := False;
          vlStrMensaje := 'Favor de indicar el '+lbID_CREDITO.Caption;
          End;
       End;
  InterForma1.ValidaExit(edID_CREDITO, vlbContinua, vlStrMensaje, True);
end;

procedure TWCrTransBloq.edID_CONTRATO_DVExit(Sender: TObject);
var vlbContinua : Boolean;
    vlStrMensaje : String;
Begin
  vlbContinua := True; vlStrMensaje := '';
  With Objeto Do
    If ((Modo = moEdit) Or (Modo = moAppend)) then
       Begin
       ID_CONTRATO_DV.GetFromControl;
       If (ID_CONTRATO_DV.AsFloat = 0) Then
          Begin
          vlbContinua := False;
          vlStrMensaje := 'Favor de indicar el '+lbID_CONTRATO_DV.Caption;
          End;
       End;
  InterForma1.ValidaExit(edID_CONTRATO_DV, vlbContinua, vlStrMensaje, True);
end;

procedure TWCrTransBloq.edCVE_BLQ_OPERACIONExit(Sender: TObject);
var vlbContinua : Boolean;
    vlStrMensaje : String;
Begin
  vlbContinua := True; vlStrMensaje := '';
  With Objeto Do
    If ((Modo = moEdit) Or (Modo = moAppend)) then
       Begin
       CVE_BLQ_OPERACION.GetFromControl;
       If (Trim(CVE_BLQ_OPERACION.AsString) = '') Then
          Begin
          vlbContinua := False;
          vlStrMensaje := 'Favor de indicar la '+lbCVE_BLQ_OPERACION.Caption;
          End;
       End;
  InterForma1.ValidaExit(edCVE_BLQ_OPERACION, vlbContinua, vlStrMensaje, True);       
end;

procedure TWCrTransBloq.edCVE_BLQ_CPTOExit(Sender: TObject);
var vlbContinua : Boolean;
    vlStrMensaje : String;
Begin
  vlbContinua := True; vlStrMensaje := '';
  With Objeto Do
    If ((Modo = moEdit) Or (Modo = moAppend)) then
       Begin
       CVE_BLQ_CPTO.GetFromControl;
       If (Trim(CVE_BLQ_CPTO.AsString) = '') Then
          Begin
          vlbContinua := False;
          vlStrMensaje := 'Favor de indicar la '+lbCVE_BLQ_CPTO.Caption;
          End;
       End;
  InterForma1.ValidaExit(edCVE_BLQ_CPTO, vlbContinua, vlStrMensaje, True);
end;

procedure TWCrTransBloq.edIMP_SALDOExit(Sender: TObject);
var vlbContinua : Boolean;
    vlStrMensaje : String;
Begin
  vlbContinua := True; vlStrMensaje := '';
  With Objeto Do
    If ((Modo = moEdit) Or (Modo = moAppend)) then
       Begin
       IMP_SALDO.GetFromControl;
       V_SDO_EFE_DV.GetFromControl;
       If (IMP_SALDO.AsFloat = 0) Then
          Begin
          vlbContinua := False;
          vlStrMensaje := 'Favor de indicar el '+lbIMP_SALDO.Caption;
          End
       Else If ((IMP_SALDO.AsFloat > V_SDO_EFE_DV.AsFloat) And (CrBlqOper.TIPO_AFECTACION.AsString = 'I')) Then
          Begin
          vlStrMensaje := 'El '+lbIMP_SALDO.Caption+' que esta indicando es mayor que al disponible de '+lbV_SDO_EFE_DV.Caption+'.'+coCRLF;
          MessageDlg(vlStrMensaje+' Favor de revisar', mtWarning, [mbOk], 0);
          vlbContinua := False;
          End
       End;
  InterForma1.ValidaExit(edIMP_SALDO, vlbContinua, vlStrMensaje, True);
end;

procedure TWCrTransBloq.memTX_MOTIVOExit(Sender: TObject);
var vlbContinua : Boolean;
    vlStrMensaje : String;
Begin
  vlbContinua := True; vlStrMensaje := '';
  With Objeto Do
    If ((Modo = moEdit) Or (Modo = moAppend)) then
       Begin
       TX_MOTIVO.GetFromControl;
       If (Trim(TX_MOTIVO.AsString) = '') Then
          InterForma1.ValidaExit(memTX_MOTIVO, False, 'Favor de indicar la '+lbTX_MOTIVO.Caption, True);
       End;
  InterForma1.ValidaExit(memTX_MOTIVO, vlbContinua, vlStrMensaje, True);
end;

function TCrTraBlo.InternalPost: Boolean;
begin
  InternalPost := True;
  If (Modo = moAppend) Then
    Begin
    If InsTransBloqueo Then
       If ActivaTransBloqueo Then
          Begin
          AutoRefresh := True;
          InternalPost := True;
          ColocaDatosChequera(ID_CONTRATO_DV.AsString);
          End;
    End
  Else
    InternalPost := Inherited InternalPost;
end;

procedure TWCrTransBloq.memTX_MOTIVOKeyPress(Sender: TObject;
  var Key: Char);
var vlstrKey : String;
begin
  vlstrKey := UpperCase(Key+' ');
  Key := vlstrKey[1];
end;

procedure TWCrTransBloq.SIT_TRANS_BLOQChange(Sender: TObject);
begin
  With Objeto Do
    If (SIT_TRANS_BLOQ.AsString = 'PA') Then
      Begin
      lbSIT_TRANS_BLOQ.Color   := clBlue;
      lbSIT_TRANS_BLOQ.Caption := 'Por Activar';
      End
    Else If (SIT_TRANS_BLOQ.AsString = 'AC') Then
      Begin
      lbSIT_TRANS_BLOQ.Color   := clGreen;
      lbSIT_TRANS_BLOQ.Caption := 'Activada';
      End
    Else If (SIT_TRANS_BLOQ.AsString = 'CA') Then
      Begin
      lbSIT_TRANS_BLOQ.Color   := clRed;
      lbSIT_TRANS_BLOQ.Caption := 'Cancelada';
      End
    Else If (SIT_TRANS_BLOQ.AsString = 'ER') Then
      Begin
      lbSIT_TRANS_BLOQ.Color   := clBlack;
      lbSIT_TRANS_BLOQ.Caption := 'Error al Activar';
      End;
end;

end.
