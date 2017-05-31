// Sistema         : Clase de CR_GA_REGISTRO
// Fecha de Inicio : 25/06/2004
// Función forma   : Clase de CR_GA_REGISTRO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMRegistro;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre, InterEdit, IntCrRePrMn, IntMon,IntMGarantia, IntCrAcredit
, InterApl;

Type
 TMRegistro= class;

  TwMRegistro=Class(TForm)
    InterForma1             : TInterForma;
    PnlMsg: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label3: TLabel;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIF: TEdit;
    rgSITUACION: TRadioGroup;
    btCVE_MONEDA: TBitBtn;
    edNOM_MONEDA: TEdit;
    ilCVE_MONEDA: TInterLinkit;
    edCVE_MONEDA: TInterEdit;
    edID_SOLICITUD: TInterEdit;
    Label2: TLabel;
    Label4: TLabel;
    edCVE_GARANTIA: TEdit;
    btCVE_GARANTIA: TBitBtn;
    edNOM_CVE_GARANTIA: TEdit;
    ilCVE_GARANTIA: TInterLinkit;
    edTX_COMENTARIO: TMemo;
    Label5: TLabel;
    edF_REVISION_GAR: TEdit;
    dtpF_REVISION_GAR: TInterDateTimePicker;
    Label1: TLabel;
    Label7: TLabel;
    edID_SECUENCIA: TInterEdit;
    rgCVE_TIPO_SEGURO: TRadioGroup;
    edVALOR_PONDERADO: TInterEdit;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    cbxB_APLICA_GAR_FID: TCheckBox;
    Label9: TLabel;
    Label10: TLabel;
    edNOMBRE_FIDUCIARIO: TEdit;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    edINSCRIPCION_RPP: TEdit;
    Label12: TLabel;
    edFECHA_INSC_RPP: TEdit;
    idtFECHA_INSC_RPP: TInterDateTimePicker;
    rgSIT_INSC_RPP: TRadioGroup;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    edINSCRIPCION_RPC: TEdit;
    edFECHA_INSC_RPC: TEdit;
    idtFECHA_INSC_RPC: TInterDateTimePicker;
    rgSIT_INSC_RPC: TRadioGroup;
    cbxB_INTEG_MASA_GAR: TCheckBox;
    Label15: TLabel;
    edVALOR_GARANTIA: TInterEdit;
    Label16: TLabel;
    btClasifica: TBitBtn;
    btSeguro: TBitBtn;
    Label17: TLabel;
    edID_ACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    edPCT_GAR_DISP: TEdit;
    edPCT_GARANTIZADO: TInterEdit;
    Label6: TLabel;
    edPCT_GAR_DISP_2: TEdit;
    edID_FIDEICOMISO: TEdit;
    BitBtn1: TBitBtn;
    Label18: TLabel;
    edFOL_REG_GAR: TEdit;
    cbxB_Regulatorio: TCheckBox;
    qTipoGaran: TQuery;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure rgSITUACIONExit(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure ilCVE_MONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure edCVE_GARANTIAExit(Sender: TObject);
    procedure ilCVE_GARANTIACapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_GARANTIAEjecuta(Sender: TObject);
    procedure btCVE_GARANTIAClick(Sender: TObject);
    procedure edTX_COMENTARIOExit(Sender: TObject);
    procedure edF_REVISION_GARExit(Sender: TObject);
    procedure edID_SECUENCIAExit(Sender: TObject);
    procedure edVALOR_PONDERADOExit(Sender: TObject);
    procedure edPCT_GAR_DISP_2Exit(Sender: TObject);
    procedure edVALOR_GARANTIAExit(Sender: TObject);
    procedure cbxB_INTEG_MASA_GARExit(Sender: TObject);
    procedure rgCVE_TIPO_SEGUROExit(Sender: TObject);
    procedure cbxB_APLICA_GAR_FIDExit(Sender: TObject);
    procedure edID_FIDEICOMISOExit(Sender: TObject);
    procedure edNOMBRE_FIDUCIARIOExit(Sender: TObject);
    procedure edINSCRIPCION_RPPExit(Sender: TObject);
    procedure edFECHA_INSC_RPPExit(Sender: TObject);
    procedure rgSIT_INSC_RPPExit(Sender: TObject);
    procedure edINSCRIPCION_RPCExit(Sender: TObject);
    procedure edFECHA_INSC_RPCExit(Sender: TObject);
    procedure rgSIT_INSC_RPCExit(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure cbxB_APLICA_GAR_FIDClick(Sender: TObject);
    procedure btClasificaClick(Sender: TObject);
    procedure edINSCRIPCION_RPCChange(Sender: TObject);
    procedure edINSCRIPCION_RPPChange(Sender: TObject);
    procedure btSeguroClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure edID_ACREDITADOExit(Sender: TObject);
    procedure edPCT_GARANTIZADOExit(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure rgSIT_INSC_RPPClick(Sender: TObject);
    procedure rgSIT_INSC_RPCClick(Sender: TObject);
    procedure edPCT_GAR_DISP_2KeyPress(Sender: TObject; var Key: Char);
    procedure edID_FIDEICOMISOKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure cbxB_RegulatorioExit(Sender: TObject);

    private
      Function ObtFolio(pCveFolio : String; pMsg : String): Integer;
      Procedure CambiaControl;
      Procedure CambiaFormato(dValor: Double);
      Procedure Clasificacion;
      Function ExisteReg(sTabla : String; iIdSolicitud: Integer): Boolean;
      Procedure CambiaTipGar;
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMRegistro;
    end;

 TMRegistro= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_SOLICITUD        : TInterCampo;
        ID_ACREDITADO       : TInterCampo;
        CVE_GARANTIA        : TInterCampo;
        TX_COMENTARIO       : TInterCampo;
        PCT_GARANTIZADO     : TInterCampo;
        F_REVISION_GAR      : TInterCampo;
        ID_SECUENCIA        : TInterCampo;
        CVE_MONEDA          : TInterCampo;
        CVE_TIPO_SEGURO     : TInterCampo;
        VALOR_PONDERADO     : TInterCampo;
        B_APLICA_GAR_FID    : TInterCampo;
        ID_FIDEICOMISO      : TInterCampo;
        NOMBRE_FIDUCIARIO   : TInterCampo;
        INSCRIPCION_RPP     : TInterCampo;
        FECHA_INSC_RPP      : TInterCampo;
        INSCRIPCION_RPC     : TInterCampo;
        FECHA_INSC_RPC      : TInterCampo;
        SIT_INSC_RPP        : TInterCampo;
        SIT_INSC_RPC        : TInterCampo;
        B_INTEG_MASA_GAR    : TInterCampo;
        B_Regulatorio       : TInterCampo;
        PCT_GAR_DISP        : TInterCampo;
        VALOR_GARANTIA      : TInterCampo;
        SIT_REG_GARANTIA    : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;
        IdSolicitud, IdAcreditado: Integer;
        FOL_REG_GAR         : TInterCampo;
        ParamCre            : TParamCre;
        Moneda              : TMoneda;
        Garantia            : TMGarantia;
        Acreditado          : TCrAcredit;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

// RUCJ4248 :: funcion para mostrar los datos de las garantias desde la pantalla de Acreditado
procedure MuestraRegGarantias(peID_ACREDITADO : Integer; peID_SOLICITUD : Integer; ParamCre : TParamcre; peApli : TInterApli);

implementation
uses IntMClasific, IntMSeguro ,IntMBiInmueb, IntMBiMueb, IntMPrend,
IntMPersonal, IntMCesion, IntMParApor, IntMSinClas, IntMGarCto;

{$R *.DFM}


procedure MuestraRegGarantias(peID_ACREDITADO : Integer; peID_SOLICITUD : Integer; ParamCre : TParamcre; peApli : TInterApli);
var
  MRegistro : TMRegistro;
begin

  MRegistro := TMRegistro.Create(Nil);
  try
     MRegistro.Apli := peApli;
     MRegistro.ParamCre := ParamCre;
     MRegistro.ID_ACREDITADO.AsInteger := peID_ACREDITADO;
     MRegistro.ID_SOLICITUD.AsInteger := peID_SOLICITUD;
     MRegistro.FindKey([peID_SOLICITUD, peID_ACREDITADO]);
     MRegistro.Catalogo;
  finally
     MRegistro.Free;
  end;

end;


constructor TMRegistro.Create( AOwner : TComponent );
begin Inherited;

   ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
      ID_SOLICITUD.Caption:='Folio de garantía';
      ID_SOLICITUD.NoCompare:=False;
   ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
      ID_ACREDITADO.Caption:='Folio de acreditado';
      ID_ACREDITADO.NoCompare:=False;
   CVE_GARANTIA :=CreaCampo('CVE_GARANTIA',ftString,tsNinguno,tsNinguno,True);
      CVE_GARANTIA.Caption:='Clave de garantía';
      CVE_GARANTIA.NoCompare:= True;
   TX_COMENTARIO :=CreaCampo('TX_COMENTARIO',ftString,tsNinguno,tsNinguno,True);
      TX_COMENTARIO.Caption:='Comentario';
      TX_COMENTARIO.NoCompare:= True;
   PCT_GARANTIZADO :=CreaCampo('PCT_GARANTIZADO',ftFloat,tsNinguno,tsNinguno,True);
      PCT_GARANTIZADO.Caption:='Porcentaje a garantizar';
      PCT_GARANTIZADO.NoCompare:= True;
   F_REVISION_GAR :=CreaCampo('F_REVISION_GAR',ftDate,tsNinguno,tsNinguno,True);
      F_REVISION_GAR.Caption:='Porcentaje a garantizar';
      F_REVISION_GAR.NoCompare:= True;
   ID_SECUENCIA :=CreaCampo('ID_SECUENCIA',ftFloat,tsNinguno,tsNinguno,True);
      ID_SECUENCIA.Caption:='Grado de prelación de la garantía';
      ID_SECUENCIA.NoCompare:= True;
   CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
      CVE_MONEDA.Caption:='Clave de moneda';
      CVE_MONEDA.NoCompare:= True;
   CVE_TIPO_SEGURO :=CreaCampo('CVE_TIPO_SEGURO',ftString,tsNinguno,tsNinguno,True);
   With CVE_TIPO_SEGURO Do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('OB');
      ComboLista.Add('1'); ComboDatos.Add('OP');
      ComboLista.Add('2'); ComboDatos.Add('EX');
      ComboLista.Add('3'); ComboDatos.Add('NA');
   End;
      CVE_TIPO_SEGURO.Caption:='Tipo de seguro';
      CVE_TIPO_SEGURO.NoCompare:= True;
   VALOR_PONDERADO :=CreaCampo('VALOR_PONDERADO',ftFloat,tsNinguno,tsNinguno,True);
      VALOR_PONDERADO.Caption:='Parte proporcional % cobertura sobre % garantizado';
      VALOR_PONDERADO.NoCompare:= True;
   B_APLICA_GAR_FID :=CreaCampo('B_APLICA_GAR_FID',ftString,tsNinguno,tsNinguno,True);
      B_APLICA_GAR_FID.Caption:='Indica si aplica garantía fiduciaria';
      B_APLICA_GAR_FID.NoCompare:= True;
   ID_FIDEICOMISO :=CreaCampo('ID_FIDEICOMISO',ftFloat,tsNinguno,tsNinguno,True);
      ID_FIDEICOMISO.Caption:='Número de fideicomiso';
      ID_FIDEICOMISO.NoCompare:= True;
   NOMBRE_FIDUCIARIO :=CreaCampo('NOMBRE_FIDUCIARIO',ftString,tsNinguno,tsNinguno,True);
      NOMBRE_FIDUCIARIO.Caption:='Nombre del fiduciario';
      NOMBRE_FIDUCIARIO.NoCompare:= True;
   INSCRIPCION_RPP :=CreaCampo('INSCRIPCION_RPP',ftString,tsNinguno,tsNinguno,True);
      INSCRIPCION_RPP.Caption:='Inscripción al R.P.P.';
      INSCRIPCION_RPP.NoCompare:= True;
   FECHA_INSC_RPP :=CreaCampo('FECHA_INSC_RPP',ftDate,tsNinguno,tsNinguno,True);
      FECHA_INSC_RPP.Caption:='Fecha de inscripción al R.P.P.';
      FECHA_INSC_RPP.NoCompare:= True;
   INSCRIPCION_RPC :=CreaCampo('INSCRIPCION_RPC',ftString,tsNinguno,tsNinguno,True);
      INSCRIPCION_RPC.Caption:='Inscripción al R.P.C.';
      INSCRIPCION_RPC.NoCompare:= True;
   FECHA_INSC_RPC :=CreaCampo('FECHA_INSC_RPC',ftDate,tsNinguno,tsNinguno,True);
      FECHA_INSC_RPC.Caption:='Fecha de inscripción al R.P.C.';
      FECHA_INSC_RPC.NoCompare:= True;
   SIT_INSC_RPP :=CreaCampo('SIT_INSC_RPP',ftString,tsNinguno,tsNinguno,True);
   With SIT_INSC_RPP Do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('RE');
      ComboLista.Add('1'); ComboDatos.Add('PE');
      ComboLista.Add('2'); ComboDatos.Add('NA');
   End;
      SIT_INSC_RPP.Caption:='Estado de inscripción en el registro';
      SIT_INSC_RPP.NoCompare:= True;
   SIT_INSC_RPC :=CreaCampo('SIT_INSC_RPC',ftString,tsNinguno,tsNinguno,True);
   With SIT_INSC_RPC Do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('RE');
      ComboLista.Add('1'); ComboDatos.Add('PE');
      ComboLista.Add('2'); ComboDatos.Add('NA');
   End;
      SIT_INSC_RPC.Caption:='Estado de inscripción en el registro';
      SIT_INSC_RPC.NoCompare:= True;
   B_INTEG_MASA_GAR :=CreaCampo('B_INTEG_MASA_GAR',ftString,tsNinguno,tsNinguno,True);
      B_INTEG_MASA_GAR.Caption:='Integra masa de garantías';
      B_INTEG_MASA_GAR.NoCompare:= True;
   B_Regulatorio :=CreaCampo('B_Regulatorio',ftString,tsNinguno,tsNinguno,True);
     B_Regulatorio.Caption:='B_Regulatorio';
     B_Regulatorio.NoCompare:= True;
      PCT_GAR_DISP :=CreaCampo('PCT_GAR_DISP',ftFloat,tsNinguno,tsNinguno,True);
      PCT_GAR_DISP.Caption:='Porción Garantía-Disposición';
      PCT_GAR_DISP.NoCompare:= True;
   VALOR_GARANTIA :=CreaCampo('VALOR_GARANTIA',ftFloat,tsNinguno,tsNinguno,True);
      VALOR_GARANTIA.Caption:='Indica el importe de la garantía';
      VALOR_GARANTIA.NoCompare:= True;
   SIT_REG_GARANTIA :=CreaCampo('SIT_REG_GARANTIA',ftString,tsNinguno,tsNinguno,True);
   With SIT_REG_GARANTIA do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   end;
      SIT_REG_GARANTIA.Caption:='Situación';
      SIT_REG_GARANTIA.NoCompare:= True;
   F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha de Alta';
      F_ALTA.NoCompare:= True;
   CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      CVE_USU_ALTA.NoCompare:= True;
   F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
      F_MODIFICA.Caption:='Fecha Modifica';
      F_MODIFICA.NoCompare:= True;
   CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      CVE_USU_MODIFICA.NoCompare:= True;

   FOL_REG_GAR := CreaCampo('FOL_REG_GAR',ftString,tsNinguno,tsNinguno,True);
      FOL_REG_GAR.Caption := 'Registro Único de G.';
      FOL_REG_GAR.NoCompare := True;

   FKeyFields.Add('ID_SOLICITUD');
   FKeyFields.Add('ID_ACREDITADO');
   TableName := 'CR_GA_REGISTRO';
   UseQuery := True;
   HelpFile := 'IntMRegistro.Hlp';
   ShowMenuReporte:=True;

   Moneda := TMoneda.Create(Self);
   Moneda.MasterSource:=Self;
   Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

   Garantia:= TMGarantia.Create(Self);
   Garantia.MasterSource:=Self;
   Garantia.FieldByName('CVE_GARANTIA').MasterField:='CVE_GARANTIA';

   Acreditado := TCrAcredit.Create(Self);
   Acreditado.MasterSource := Self;
   Acreditado.FieldByName('ID_ACREDITADO').MasterField := 'ID_ACREDITADO';

end;


Destructor TMRegistro.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   If Garantia <> Nil Then
      Garantia.Free;
   Inherited;
end;

function TMRegistro.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMRegistro;
begin
   W:=TWMRegistro.Create(Self);
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

Function TMRegistro.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMRegistro.it','I,I');
   Try
      if Active then begin
         T.Param(0,ID_SOLICITUD.AsString);
         T.Param(1,ID_ACREDITADO.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
   finally
      T.Free;
   end;
end;

function TMRegistro.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_GA_REGISTRO********************)
(*                                                                              *)
(*  FORMA DE CR_GA_REGISTRO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_REGISTRO********************)

procedure TwMRegistro.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_SOLICITUD.Control        := edID_SOLICITUD;
      ID_ACREDITADO.Control       := edID_ACREDITADO;
      CVE_GARANTIA.Control        := edCVE_GARANTIA;
      TX_COMENTARIO.Control       := edTX_COMENTARIO;
      PCT_GARANTIZADO.Control     := edPCT_GARANTIZADO;
      F_REVISION_GAR.Control      := edF_REVISION_GAR;
      ID_SECUENCIA.Control        := edID_SECUENCIA;
      CVE_MONEDA.Control          := edCVE_MONEDA;
      CVE_TIPO_SEGURO.Control     := rgCVE_TIPO_SEGURO;
      VALOR_PONDERADO.Control     := edVALOR_PONDERADO;
      B_APLICA_GAR_FID.Control    := cbxB_APLICA_GAR_FID;
      ID_FIDEICOMISO.Control      := edID_FIDEICOMISO;
      NOMBRE_FIDUCIARIO.Control   := edNOMBRE_FIDUCIARIO;
      INSCRIPCION_RPP.Control     := edINSCRIPCION_RPP;
      FECHA_INSC_RPP.Control      := edFECHA_INSC_RPP;
      INSCRIPCION_RPC.Control     := edINSCRIPCION_RPC;
      FECHA_INSC_RPC.Control      := edFECHA_INSC_RPC;
      SIT_INSC_RPP.Control        := rgSIT_INSC_RPP;
      SIT_INSC_RPC.Control        := rgSIT_INSC_RPC;
      B_INTEG_MASA_GAR.Control    := cbxB_INTEG_MASA_GAR;
      B_Regulatorio.Control       := cbxB_Regulatorio;
      PCT_GAR_DISP.Control        := edPCT_GAR_DISP;
      VALOR_GARANTIA.Control      := edVALOR_GARANTIA;
      SIT_REG_GARANTIA.Control    := rgSITUACION;
      F_ALTA.Control              := edF_ALTA;
      CVE_USU_ALTA.Control        := edCVE_USU_ALTA;
      F_MODIFICA.Control          := edF_MODIFICA;
      CVE_USU_MODIFICA.Control    := edCVE_USU_MODIF;
      FOL_REG_GAR.Control         := edFOL_REG_GAR;
      InterForma1.MsgPanel        := PnlMsg;

      Moneda.Cve_Moneda.Control   := edCVE_MONEDA;
      Moneda.Desc_Moneda.Control  := edNOM_MONEDA;
      Moneda.GetParams(Objeto);

      Garantia.CVE_GARANTIA.Control := edCVE_GARANTIA;
      Garantia.DESC_GARANTIA.Control:= edNOM_CVE_GARANTIA;
      Garantia.GetParams(Objeto);

      Acreditado.ID_ACREDITADO.Control := edID_ACREDITADO;
      Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Acreditado.GetParams(Objeto);
   End;
end;

procedure TwMRegistro.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_SOLICITUD.Control        := Nil;
      ID_ACREDITADO.Control       := Nil;
      CVE_GARANTIA.Control        := Nil;
      TX_COMENTARIO.Control       := Nil;
      PCT_GARANTIZADO.Control     := Nil;       
      F_REVISION_GAR.Control      := Nil;
      ID_SECUENCIA.Control        := Nil;
      CVE_MONEDA.Control          := Nil;
      CVE_TIPO_SEGURO.Control     := Nil;
      VALOR_PONDERADO.Control     := Nil;
      B_APLICA_GAR_FID.Control    := Nil;
      ID_FIDEICOMISO.Control      := Nil;
      NOMBRE_FIDUCIARIO.Control   := Nil;
      INSCRIPCION_RPP.Control     := Nil;
      FECHA_INSC_RPP.Control      := Nil;
      INSCRIPCION_RPC.Control     := Nil;
      FECHA_INSC_RPC.Control      := Nil;
      SIT_INSC_RPP.Control        := Nil;
      SIT_INSC_RPC.Control        := Nil;
      B_INTEG_MASA_GAR.Control    := Nil;
      B_Regulatorio.Control       := NIl;
      PCT_GAR_DISP.Control        := Nil;
      VALOR_GARANTIA.Control      := Nil;
      SIT_REG_GARANTIA.Control    := Nil;
      F_ALTA.Control              := Nil;
      CVE_USU_ALTA.Control        := Nil;
      F_MODIFICA.Control          := Nil;
      CVE_USU_MODIFICA.Control    := Nil;
      FOL_REG_GAR.Control         := nil;
      InterForma1.MsgPanel        := Nil;

      Moneda.Cve_Moneda.Control   := Nil;
      Moneda.Desc_Moneda.Control  := Nil;
      Garantia.CVE_GARANTIA.Control := Nil;
      Garantia.DESC_GARANTIA.Control := Nil;
      Acreditado.ID_ACREDITADO.Control  := Nil;
      Acreditado.Persona.Nombre.Control := Nil;
   End;
end;

procedure TwMRegistro.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMRegistro.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
      CambiaFormato(PCT_GAR_DISP.AsFloat);
   End;
end;

procedure TwMRegistro.edCVE_MONEDAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_MONEDA.GetFromControl;
      If Objeto.CVE_MONEDA.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el tipo de moneda';
      End;
      InterForma1.ValidaExit(edCVE_MONEDA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMRegistro.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   dtpF_REVISION_GAR.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   edF_REVISION_GAR.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));

   idtFECHA_INSC_RPP.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   idtFECHA_INSC_RPC.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');

   cbxB_INTEG_MASA_GAR.Checked:= False;
   //cbxB_Regulatorio.Enabled := False;
   rgSIT_INSC_RPP.ItemIndex:= 2;
   rgSIT_INSC_RPC.ItemIndex:= 2;
   rgSITUACION.ItemIndex:= 0;
   rgCVE_TIPO_SEGURO.ItemIndex:= 0;
   CambiaControl;
   CambiaFormato(Objeto.PCT_GAR_DISP.AsFloat);
   edID_ACREDITADO.SetFocus;
   If Objeto.Acreditado.ID_ACREDITADO.AsInteger <> 0 Then Begin
      Objeto.Acreditado.FindKey([Objeto.Acreditado.ID_ACREDITADO.AsInteger]);
      edCVE_GARANTIA.SetFocus;
   End;
end;

procedure TwMRegistro.rgSITUACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSITUACION,True,CNULL,True);
end;

procedure TwMRegistro.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   CambiaControl;
   If Objeto.Garantia.B_REQ_INSCR_RPP.AsString ='F' Then Begin
      edINSCRIPCION_RPP.Tag:= 17;
      edINSCRIPCION_RPP.TabStop:= False;
      edFECHA_INSC_RPP.Tag:= 17;
      edFECHA_INSC_RPP.TabStop:= False;
      idtFECHA_INSC_RPP.Tag:= 17;
      rgSIT_INSC_RPP.Tag:= 17;
   End;
   If Objeto.Garantia.B_REQ_INSCR_RPC.AsString ='F' Then Begin
      edINSCRIPCION_RPC.Tag:= 17;
      edINSCRIPCION_RPC.TabStop:= False;
      edFECHA_INSC_RPC.Tag:= 17;
      edFECHA_INSC_RPC.TabStop:= False;
      idtFECHA_INSC_RPC.Tag:= 17;
      rgSIT_INSC_RPC.Tag:= 17;
   End;
   InterForma1.InitShow;
   edCVE_GARANTIA.SetFocus;

end;

procedure TwMRegistro.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   edID_FIDEICOMISO.Tag:= 18;
   edNOMBRE_FIDUCIARIO.Tag:= 18;
   edINSCRIPCION_RPP.Tag:= 18;
   edFECHA_INSC_RPP.Tag:= 18;
   idtFECHA_INSC_RPP.Tag:= 18;
   rgSIT_INSC_RPP.Tag:= 18;
   edINSCRIPCION_RPC.Tag:= 18;
   edFECHA_INSC_RPC.Tag:= 18;
   idtFECHA_INSC_RPC.Tag:= 18;
   rgSIT_INSC_RPC.Tag:= 18;

   With Objeto Do Begin
      if IsNewData then Begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
            mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USU_ALTA.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            ID_SOLICITUD.AsInteger:= ObtFolio('CRGAR','ID SOLICITUD: ');
            Realizado := True;
         end else
            Realizado := False;
      end else Begin
         if MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USU_MODIFICA.AsString := DameUsuario;
            F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         end else
            Realizado := False;
      end
   End;
end;

procedure TwMRegistro.ilCVE_MONEDACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)or (InterForma1.IsNewData);
end;

procedure TwMRegistro.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilCVE_MONEDA.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMRegistro.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   If Objeto.Moneda.Busca Then Begin
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

Procedure TwMRegistro.edCVE_GARANTIAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_GARANTIA.GetFromControl;
      If Objeto.CVE_GARANTIA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe seleccionar un tipo de garantía';
      End;
      InterForma1.ValidaExit(edCVE_GARANTIA,vlSalida,vlMsg,True);
   End;
End;

procedure TwMRegistro.ilCVE_GARANTIACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)or (InterForma1.IsNewData);
end;

procedure TwMRegistro.ilCVE_GARANTIAEjecuta(Sender: TObject);
begin
   If Objeto.Garantia.FindKey([ilCVE_GARANTIA.Buffer]) Then Begin
      If Objeto.Garantia.SIT_GARANTIA.AsString = 'AC' Then Begin
         CambiaFormato(Objeto.Garantia.FACT_PROPOR_GAR.AsFloat);
         CambiaTipGar;
         Objeto.CVE_TIPO_SEGURO.AsString:= Objeto.Garantia.CVE_TIPO_SEGURO.AsString;
         InterForma1.NextTab(edCVE_GARANTIA);
      End;
   End;
end;

procedure TwMRegistro.btCVE_GARANTIAClick(Sender: TObject);
begin
   Objeto.Garantia.BuscaWhereString := ' CR_GA_GARANTIA.SIT_GARANTIA =''AC'' ';
   Objeto.Garantia.FilterString := Objeto.Garantia.BuscaWhereString;
   Objeto.Garantia.ShowAll := True;
   If Objeto.Garantia.Busca Then Begin
      CambiaFormato(Objeto.Garantia.FACT_PROPOR_GAR.AsFloat);
      CambiaTipGar;
      Objeto.CVE_TIPO_SEGURO.AsString:= Objeto.Garantia.CVE_TIPO_SEGURO.AsString;
      InterForma1.NextTab(edCVE_GARANTIA);
   End;


end;

procedure TwMRegistro.edTX_COMENTARIOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edTX_COMENTARIO,True,CNULL,True);
end;

procedure TwMRegistro.edF_REVISION_GARExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     Year, Month, Day: Word;
     dFecha    : TDateTime;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.F_REVISION_GAR.GetFromControl;
      If Objeto.F_REVISION_GAR.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe seleccionar la fecha de última revisión de la garantía';
      End Else Begin
         DecodeDate(Objeto.Apli.DameFechaEmpresaDia('D000'),Year, Month, Day);
         Year:= Year - 1;
         dFecha:= EncodeDate(Year, Month, Day);
         If Objeto.F_REVISION_GAR.AsDateTime < dFecha Then Begin
            vlSalida   := False;
            vlMsg := 'La fecha de última revisión debe ser mayor';
         End;
      End;
      InterForma1.ValidaExit(edF_REVISION_GAR,vlSalida,vlMsg,True);
   End;
end;

procedure TwMRegistro.edID_SECUENCIAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_SECUENCIA.GetFromControl;
      If Objeto.ID_SECUENCIA.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el grado de prelación de la garantía';
      End;
      InterForma1.ValidaExit(edID_SECUENCIA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMRegistro.edVALOR_PONDERADOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.VALOR_PONDERADO.GetFromControl;
      If Objeto.VALOR_PONDERADO.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el valor ponderado de la garantía';
      End Else Begin
         Objeto.VALOR_GARANTIA.AsFloat:=Objeto.VALOR_PONDERADO.AsFloat * Objeto.PCT_GAR_DISP.AsFloat;
      End;
      InterForma1.ValidaExit(edVALOR_PONDERADO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMRegistro.edPCT_GAR_DISP_2Exit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg, sNumero   :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      If Pos(':1', edPCT_GAR_DISP_2.Text) > 0 Then
         sNumero:= Copy(edPCT_GAR_DISP_2.Text,0, Length(edPCT_GAR_DISP_2.Text)-Pos(':1', edPCT_GAR_DISP_2.Text))
      Else
         sNumero:= Trim(edPCT_GAR_DISP_2.Text);

      If StrToFloat(sNumero) = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el grado de prelación de la garantía';
         Objeto.VALOR_PONDERADO.AsFloat:= 0;
         InterForma1.ValidaExit(edPCT_GAR_DISP_2,vlSalida,vlMsg,True);
      End Else Begin
         CambiaFormato(StrToFloat(sNumero));
         Objeto.VALOR_PONDERADO.AsFloat:= Objeto.VALOR_GARANTIA.AsFloat / StrToFloat(sNumero);
         InterForma1.ValidaExit(edPCT_GAR_DISP_2,True,CNULL,True);
      End;
   End;
end;

procedure TwMRegistro.edVALOR_GARANTIAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.VALOR_GARANTIA.GetFromControl;
      If Objeto.VALOR_GARANTIA.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el valor de la garantía';
         Objeto.VALOR_PONDERADO.AsFloat:= 0;
         InterForma1.ValidaExit(edVALOR_GARANTIA,vlSalida,vlMsg,True);
      End Else Begin
         If Objeto.PCT_GAR_DISP.AsFloat > 0 Then Begin
            Objeto.VALOR_PONDERADO.AsFloat:=  Objeto.VALOR_GARANTIA.AsFloat / Objeto.PCT_GAR_DISP.AsFloat;
         End Else Begin
            Objeto.VALOR_PONDERADO.AsFloat:= 0;
         End;
      End;
      InterForma1.ValidaExit(edVALOR_GARANTIA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMRegistro.cbxB_INTEG_MASA_GARExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbxB_INTEG_MASA_GAR,True,CNULL,True);
end;

procedure TwMRegistro.rgCVE_TIPO_SEGUROExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_TIPO_SEGURO,True,CNULL,True);
end;

procedure TwMRegistro.cbxB_APLICA_GAR_FIDExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbxB_APLICA_GAR_FID,True,CNULL,True);
end;

procedure TwMRegistro.edID_FIDEICOMISOExit(Sender: TObject);
//Var  vlSalida  :  boolean;
//     vlMsg     :  String;
Begin
//   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
//      vlMsg    := CNULL;
//      vlSalida := True;
//      Objeto.ID_FIDEICOMISO.GetFromControl;
//      If cbxB_APLICA_GAR_FID.Checked Then Begin
//         If Objeto.ID_FIDEICOMISO.AsFloat = 0 Then Begin
//            vlSalida   := False;
//            vlMsg := 'Indique el número de fideicomiso';
//         End;
//      End;
//      InterForma1.ValidaExit(edID_FIDEICOMISO,vlSalida,vlMsg,True);
//   End;
end;

procedure TwMRegistro.edNOMBRE_FIDUCIARIOExit(Sender: TObject);
//Var  vlSalida  :  boolean;
//     vlMsg     :  String;
Begin
//   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
//      vlMsg    := CNULL;
//      vlSalida := True;
//      Objeto.NOMBRE_FIDUCIARIO.GetFromControl;
//      If cbxB_APLICA_GAR_FID.Checked Then Begin
//         If Objeto.NOMBRE_FIDUCIARIO.AsString = CNULL Then Begin
//            vlSalida   := False;
//            vlMsg := 'Indique el nombre de fiduciario';
//         End;
//      End;
//      InterForma1.ValidaExit(edNOMBRE_FIDUCIARIO,vlSalida,vlMsg,True);
//   End;
end;

procedure TwMRegistro.edINSCRIPCION_RPPExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.INSCRIPCION_RPP.GetFromControl;
      If Objeto.Garantia.B_REQ_INSCR_RPP.AsString = 'V' Then Begin
         If Objeto.INSCRIPCION_RPP.AsString = CNULL Then
            rgSIT_INSC_RPP.ItemIndex:=1
         Else
            rgSIT_INSC_RPP.ItemIndex:=0;
      End;
      InterForma1.ValidaExit(edINSCRIPCION_RPP,vlSalida,vlMsg,True);
   End;
end;

procedure TwMRegistro.edFECHA_INSC_RPPExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.FECHA_INSC_RPP.GetFromControl;
      Objeto.INSCRIPCION_RPP.GetFromControl;
      If Objeto.Garantia.B_REQ_INSCR_RPP.AsString = 'V' Then Begin
         If (Objeto.INSCRIPCION_RPP.AsString <> CNULL)Then Begin
            If (Objeto.FECHA_INSC_RPP.AsString = CNULL)Then Begin
               vlSalida   := False;
               vlMsg := 'Indique la fecha de inscripción en el Registro Público de la Propiedad';
            End;
         End;
      End;
      InterForma1.ValidaExit(edFECHA_INSC_RPP,vlSalida,vlMsg,True);
   End;
end;

procedure TwMRegistro.rgSIT_INSC_RPPExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_INSC_RPP,True,CNULL,True);
end;

procedure TwMRegistro.edINSCRIPCION_RPCExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.INSCRIPCION_RPC.GetFromControl;
      If Objeto.Garantia.B_REQ_INSCR_RPC.AsString = 'V' Then Begin
         If Objeto.INSCRIPCION_RPC.AsString = CNULL Then
            rgSIT_INSC_RPC.ItemIndex:=1
         Else
            rgSIT_INSC_RPC.ItemIndex:=0;
      End;
      InterForma1.ValidaExit(edINSCRIPCION_RPC,vlSalida,vlMsg,True);
   End;
end;

procedure TwMRegistro.edFECHA_INSC_RPCExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.FECHA_INSC_RPC.GetFromControl;
      Objeto.INSCRIPCION_RPC.GetFromControl;
      If Objeto.Garantia.B_REQ_INSCR_RPC.AsString = 'V' Then Begin
         If (Objeto.INSCRIPCION_RPC.AsString <> CNULL)Then Begin
            If (Objeto.FECHA_INSC_RPC.AsString = CNULL)Then Begin
               vlSalida   := False;
               vlMsg := 'Indique la fecha de inscripción en el Registro Público de Comercio';
            End;
         End;
      End;
      InterForma1.ValidaExit(edFECHA_INSC_RPC,vlSalida,vlMsg,True);
   End;
end;

procedure TwMRegistro.rgSIT_INSC_RPCExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_INSC_RPC,True,CNULL,True);
end;
Function TwMRegistro.ObtFolio(pCveFolio : String; pMsg : String): Integer;
Var
   STPObtFolios : TStoredProc;
   vlFolio     : Integer;
Begin
   vlFolio := 0;
   STPObtFolios := TStoredProc.Create(Nil);
   Try
      With STPObtFolios Do Begin
         DatabaseName:= Objeto.Apli.DatabaseName;
         SessionName:= Objeto.Apli.SessionName;
         StoredProcName:='PKGCRDOCUMENTACION.STPOBTENFOLIO';

         Params.Clear;
         Params.CreateParam(ftFloat,'PEIDEMPRESA',ptInput);
         Params.CreateParam(ftString,'PECVEFOLIO',ptInput);
         Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
         Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
         Params.CreateParam(ftFloat,'RESULT',ptResult);
         ParamByName('PEIDEmpresa').AsInteger := Objeto.Apli.IdEmpresa;
         ParamByName('PECVEFolio').AsString := pCveFolio;
         ParamByName('PEBCommit').AsString := 'V';

         ExecProc;

         If (ParamByName('PSResultado').AsInteger = 0) Then Begin
            vlFolio := ParamByName('Result').AsInteger;
         End Else
            ShowMessage('PROBLEMAS AL OBTENER EL ' + pMsg +
            IntToStr(ParamByName('PSResultado').AsInteger));
      End;
   Finally
      STPObtFolios.Free;
   End;
   ObtFolio:= vlFolio;
End;

Procedure TwMRegistro.CambiaControl;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      If cbxB_APLICA_GAR_FID.Checked Then Begin
         edID_FIDEICOMISO.Tag:= 18;
         edID_FIDEICOMISO.TabStop:= True;
         edNOMBRE_FIDUCIARIO.Tag:= 18;
         edNOMBRE_FIDUCIARIO.TabStop:= True;
         edID_FIDEICOMISO.SetFocus;
      End Else Begin
         edID_FIDEICOMISO.Text:= '';
         edID_FIDEICOMISO.TabStop:= False;
         edNOMBRE_FIDUCIARIO.Text:= '';
         edNOMBRE_FIDUCIARIO.TabStop:= False;
         edID_FIDEICOMISO.Tag:= 17;
         edNOMBRE_FIDUCIARIO.Tag:= 17;
         edID_FIDEICOMISO.SetFocus;
         InterForma1.ValidaExit(edNOMBRE_FIDUCIARIO,True,CNULL,True);
      End;
      InterForma1.InitShow;
   End;
End;
procedure TwMRegistro.InterForma1DespuesShow(Sender: TObject);
begin
   CambiaControl;
   CambiaFormato(Objeto.PCT_GAR_DISP.AsFloat);
end;

procedure TwMRegistro.cbxB_APLICA_GAR_FIDClick(Sender: TObject);
begin
   CambiaControl;
end;

procedure TwMRegistro.btClasificaClick(Sender: TObject);
begin
   If Objeto.Active Then Begin
      Clasificacion;
   End Else Begin
      ShowMessage('Debe seleccionar un registro de garantía');
   End;
end;

procedure TwMRegistro.edINSCRIPCION_RPCChange(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      If Objeto.Garantia.B_REQ_INSCR_RPC.AsString = 'V' Then Begin
         If Trim(edINSCRIPCION_RPC.Text)<>'' Then Begin
            rgSIT_INSC_RPC.ItemIndex:=0;
         End Else Begin
            rgSIT_INSC_RPC.ItemIndex:= 2;
         End;
      End;
   End;
end;

procedure TwMRegistro.edINSCRIPCION_RPPChange(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      If Objeto.Garantia.B_REQ_INSCR_RPP.AsString = 'V' Then Begin
         If Trim(edINSCRIPCION_RPP.Text)<>'' Then Begin
            rgSIT_INSC_RPP.ItemIndex:=0;
         End Else Begin
            rgSIT_INSC_RPP.ItemIndex:= 2;
         End;
      End;
   End;
end;


procedure TwMRegistro.btSeguroClick(Sender: TObject);
Var
   MSeguro : TMSeguro;
begin
   If Objeto.Active Then begin
      If (Objeto.CVE_TIPO_SEGURO.AsString ='OB') Or (Objeto.CVE_TIPO_SEGURO.AsString ='OP') Then Begin
         MSeguro := TMSeguro.Create(self);
         Try
            MSeguro.Apli := Objeto.Apli;
            MSeguro.ParamCre:= Objeto.ParamCre;
            MSeguro.sCveTipoSeg := 'GA';
            MSeguro.iIdReferencia := Objeto.ID_SOLICITUD.AsInteger;
            MSeguro.Catalogo;
         Finally
            MSeguro.Free;
         End;
      End Else Begin
         ShowMessage('El tipo de seguro debe ser Obligatorio u Opcional para mostrar');
      End;
   End Else Begin
      ShowMessage('Debe seleccionar un registro de garantía');
   End;
end;

procedure TwMRegistro.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
      InterForma1.NextTab(edID_ACREDITADO);
   End;
end;

procedure TwMRegistro.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)and(InterForma1.IsNewData);
end;

procedure TwMRegistro.ilACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
      InterForma1.NextTab(edID_ACREDITADO);
   End;
end;

procedure TwMRegistro.edID_ACREDITADOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg, sSQL :  String;
     vlCveGar  : String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_ACREDITADO.GetFromControl;
      If Objeto.ID_ACREDITADO.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe seleccionar un acreditado';
      End Else Begin
         sSQL:='SELECT ID_SOLICITUD, ID_ACREDITADO FROM CR_GA_REGISTRO '+
               ' WHERE ID_SOLICITUD='+ Objeto.ID_SOLICITUD.AsSQL +
               '   AND ID_ACREDITADO='+  Objeto.ID_ACREDITADO.AsSQL;

         If InterForma1.IsNewData Then Begin
             GetSQLStr(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'ID_ACREDITADO',vlCveGar,False);
             If (vlCveGar <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La relación de la garantía con el acreditado ya existe';
             End;
         End;
      End;
      InterForma1.ValidaExit(edID_ACREDITADO,vlSalida,vlMsg,True);
   End;
end;

Procedure TwMRegistro.CambiaFormato(dValor: Double);
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then
      Objeto.PCT_GAR_DISP.AsString:= FormatFloat('###,###,###,##0',dValor);
   edPCT_GAR_DISP_2.Text:= FormatFloat('###,###,###,##0',dValor)+ ':1';
End;

procedure TwMRegistro.edPCT_GARANTIZADOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.PCT_GARANTIZADO.GetFromControl;
      If (Objeto.PCT_GARANTIZADO.AsFloat <= 0)and
         (Objeto.PCT_GARANTIZADO.AsFloat > 100) Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el valor del porcentaje garantizado debe ser > 0 y < 100';
      End;
      InterForma1.ValidaExit(edPCT_GARANTIZADO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMRegistro.InterForma1DespuesAceptar(Sender: TObject);
Var
   MSeguro : TMSeguro;
   sAccion : String;
   MGarCto : TMGarCto;
begin
   If Objeto.Active Then begin
      If InterForma1.IsNewData Then
         sAccion:= 'guardar'
      Else
         sAccion:= 'modificar';

      //CLASIFICACIÓN
      Clasificacion;
      //SEGURO
      If (Objeto.CVE_TIPO_SEGURO.AsString ='OB') Or
         (Objeto.CVE_TIPO_SEGURO.AsString ='OP') Then Begin
         If MessageDlg('¿Desea '+ sAccion +' los datos del seguro?',
            mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
            MSeguro := TMSeguro.Create(self);
            Try
               MSeguro.Apli := Objeto.Apli;
               MSeguro.ParamCre:= Objeto.ParamCre;
               MSeguro.sCveTipoSeg:= 'AC';
               MSeguro.iIdReferencia:= Objeto.ID_SOLICITUD.AsInteger;
               MSeguro.Nuevo;
            Finally
               MSeguro.Free;
            End;
         End;
      End;
      //Liga garantía con contrato
      If MessageDlg('¿Desea ligar la garantía con un contrato en específico?',
         mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
         MGarCto := TMGarCto.Create(self);
         Try
            MGarCto.IsCheckSecu:= False;
            MGarCto.Apli :=Objeto.Apli;
            MGarCto.ParamCre:=Objeto.ParamCre;
            MGarCto.MRegistro:=Objeto;
            MGarCto.Catalogo;
         Finally
            MGarCto.Free;
         End;
      End;
   End;
   cbxB_Regulatorio.Enabled := False;
end;

Procedure TwMRegistro.Clasificacion;
Var
   MClasific : TMClasific;
   MBiInmueb : TMBiInmueb;
   MBiMueb   : TMBiMueb;
   MPrend    : TMPrend;
   MPersonal : TMPersonal;
   MSinClas  : TMSinClas;
Begin
   If Objeto.Garantia.CVE_TIPO_GAR.AsString ='INM' Then Begin
      MBiInmueb := TMBiInmueb.Create(self);
      Try
         MBiInmueb.Apli :=Objeto.Apli;
         MBiInmueb.ParamCre:=Objeto.ParamCre;
         MBiInmueb.MRegistro:=Objeto;
         If Not ExisteReg('CR_GA_BI_INMUEB', Objeto.ID_SOLICITUD.AsInteger) Then Begin
            MBiInmueb.FindKey([Objeto.ID_SOLICITUD.AsInteger]);
            MBiInmueb.Catalogo;
         End Else
            MBiInmueb.Nuevo;
      Finally
         MBiInmueb.Free;
      End;
   End Else If Objeto.Garantia.CVE_TIPO_GAR.AsString ='MUE' Then Begin
      MBiMueb := TMBiMueb.Create(self);
      Try
         MBiMueb.Apli :=Objeto.Apli;
         MBiMueb.ParamCre:=Objeto.ParamCre;
         MBiMueb.MRegistro:=Objeto;
         If Not ExisteReg('CR_GA_BI_MUEB', Objeto.ID_SOLICITUD.AsInteger) Then Begin
            MBiMueb.FindKey([Objeto.ID_SOLICITUD.AsInteger]);
            MBiMueb.Catalogo;
         End Else
            MBiMueb.Nuevo;
      Finally
         MBiMueb.Free;
      End;
   End Else If Objeto.Garantia.CVE_TIPO_GAR.AsString ='PRE' Then Begin
      MPrend := TMPrend.Create(self);
      Try
         MPrend.Apli :=Objeto.Apli;
         MPrend.ParamCre:=Objeto.ParamCre;
         MPrend.MRegistro:=Objeto;
         If Not ExisteReg('CR_GA_PRENDARIAS', Objeto.ID_SOLICITUD.AsInteger) Then Begin
            MPrend.FindKey([Objeto.ID_SOLICITUD.AsInteger]);
            MPrend.Catalogo;
         End Else
            MPrend.Nuevo;
      Finally
         MPrend.Free;
      End;
   End Else If Objeto.Garantia.CVE_TIPO_GAR.AsString ='PER' Then Begin
      MPersonal := TMPersonal.Create(self);
      Try
         MPersonal.Apli :=Objeto.Apli;
         MPersonal.ParamCre:=Objeto.ParamCre;
         MPersonal.MRegistro:=Objeto;
         If Not ExisteReg('CR_GA_PERSONALES', Objeto.ID_SOLICITUD.AsInteger) Then Begin
            MPersonal.FindKey([Objeto.ID_SOLICITUD.AsInteger]);
            MPersonal.Catalogo;
         End Else
            MPersonal.Nuevo;
      Finally
         MPersonal.Free;
      End;
   End Else If Objeto.Garantia.CVE_TIPO_GAR.AsString ='SCL' Then Begin
      MSinClas:= TMSinClas.Create(self);
      Try
         MSinClas.Apli :=Objeto.Apli;
         MSinClas.ParamCre:=Objeto.ParamCre;
         MSinClas.MRegistro:=Objeto;
         If Not ExisteReg('CR_GA_SIN_CLAS', Objeto.ID_SOLICITUD.AsInteger) Then Begin
            MSinClas.FindKey([Objeto.ID_SOLICITUD.AsInteger]);
            MSinClas.Catalogo;
         End Else
            MSinClas.Nuevo;
      Finally
         MSinClas.Free;
      End;
   End Else Begin
      MClasific := TMClasific.Create(self);
       Try
          MClasific.IsCheckSecu:= False;
          MClasific.Apli :=Objeto.Apli;
          MClasific.ParamCre:=Objeto.ParamCre;
          MClasific.Registro:=Objeto;
          MClasific.Catalogo;
       Finally
          MClasific.Free;
       End;
   End;
End;

Function TwMRegistro.ExisteReg(sTabla : String; iIdSolicitud: Integer): Boolean;
Var
   sSQL: String;
   qyQuery: TQuery;
Begin
   sSQL:='SELECT * FROM '+ sTabla + ' WHERE ID_SOLICITUD = '+ IntToStr(iIdSolicitud);
   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      If qyQuery.FieldByName('ID_SOLICITUD').AsInteger = iIdSolicitud Then Begin
         ExisteReg:= False;
      End Else Begin
         ExisteReg:= True;
      End;
      qyQuery.Free;
   End Else Begin
      ExisteReg:= True;
   End;
End;

procedure TwMRegistro.rgSIT_INSC_RPPClick(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then
      If rgSIT_INSC_RPP.ItemIndex = 2 Then Begin
         Objeto.INSCRIPCION_RPP.AsString:='';
         Objeto.FECHA_INSC_RPP.AsString:='';
      End;
end;

procedure TwMRegistro.rgSIT_INSC_RPCClick(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then
      If rgSIT_INSC_RPC.ItemIndex = 2 Then Begin
         Objeto.INSCRIPCION_RPC.AsString:='';
         Objeto.FECHA_INSC_RPC.AsString:='';
      End;
end;

procedure TwMRegistro.edPCT_GAR_DISP_2KeyPress(Sender: TObject;
  var Key: Char);
begin
 If ((Key = ':') And (Pos(Key,(Sender As TInterEdit).Text) > 0))
    Or ((Pos(Key,'0123456789.:'#8)) = 0) Then Key := #0;
end;

procedure TwMRegistro.edID_FIDEICOMISOKeyPress(Sender: TObject;
  var Key: Char);
begin
 If ((Pos(Key,'0123456789'#8)) = 0) Then Key := #0;
end;

procedure TwMRegistro.BitBtn1Click(Sender: TObject);
Var
   MGarCto : TMGarCto;
begin
   If Objeto.Active Then Begin
      If Objeto.ID_SOLICITUD.AsInteger <> 0 Then Begin
         MGarCto := TMGarCto.Create(self);
         Try
            MGarCto.IsCheckSecu:= False;
            MGarCto.Apli :=Objeto.Apli;
            MGarCto.ParamCre:=Objeto.ParamCre;
            MGarCto.MRegistro:=Objeto;
            MGarCto.Catalogo;
         Finally
            MGarCto.Free;
         End;
      End;
   End Else Begin
      ShowMessage('Debe seleccionar un registro de garantía');
   End;
end;

procedure TwMRegistro.InterForma1DespuesCancelar(Sender: TObject);
begin
   edID_FIDEICOMISO.Tag:= 18;
   edNOMBRE_FIDUCIARIO.Tag:= 18;
   edINSCRIPCION_RPP.Tag:= 18;
   edFECHA_INSC_RPP.Tag:= 18;
   idtFECHA_INSC_RPP.Tag:= 18;
   rgSIT_INSC_RPP.Tag:= 18;
   edINSCRIPCION_RPC.Tag:= 18;
   edFECHA_INSC_RPC.Tag:= 18;
   idtFECHA_INSC_RPC.Tag:= 18;
   rgSIT_INSC_RPC.Tag:= 18;
   cbxB_Regulatorio.Enabled := False;
   InterForma1.InitShow;
end;

Procedure TwMRegistro.CambiaTipGar;
Begin
   If Objeto.Garantia.B_REQ_INSCR_RPP.AsString ='F' Then Begin
      edINSCRIPCION_RPP.Tag:= 17;
      edINSCRIPCION_RPP.TabStop:= False;
      edFECHA_INSC_RPP.Tag:= 17;
      edFECHA_INSC_RPP.TabStop:= False;
      idtFECHA_INSC_RPP.Tag:= 17;
      rgSIT_INSC_RPP.Tag:= 17;
      rgSIT_INSC_RPP.ItemIndex:=2;
   End Else Begin
      edINSCRIPCION_RPP.Tag:= 18;
      edINSCRIPCION_RPP.TabStop:= True;
      edFECHA_INSC_RPP.Tag:= 18;
      edFECHA_INSC_RPP.TabStop:= True;
      idtFECHA_INSC_RPP.Tag:= 18;
      rgSIT_INSC_RPP.Tag:= 18;
      rgSIT_INSC_RPP.ItemIndex:=1;
   End;
   If Objeto.Garantia.B_REQ_INSCR_RPC.AsString ='F' Then Begin
      edINSCRIPCION_RPC.Tag:= 17;
      edINSCRIPCION_RPC.TabStop:= False;
      edFECHA_INSC_RPC.Tag:= 17;
      edFECHA_INSC_RPC.TabStop:= False;
      idtFECHA_INSC_RPC.Tag:= 17;
      rgSIT_INSC_RPC.Tag:= 17;
      rgSIT_INSC_RPC.ItemIndex:=2;
   End Else Begin
      edINSCRIPCION_RPC.Tag:= 18;
      edINSCRIPCION_RPC.TabStop:= True;
      edFECHA_INSC_RPC.Tag:= 18;
      edFECHA_INSC_RPC.TabStop:= True;
      idtFECHA_INSC_RPC.Tag:= 18;
      rgSIT_INSC_RPC.Tag:= 18;
      rgSIT_INSC_RPC.ItemIndex:=1;
   End;
   InterForma1.InitShow;
End;

procedure TwMRegistro.InterForma1DespuesEliminar(Sender: TObject);
Var
   STPElimina   : TStoredProc;
Begin
   STPElimina := TStoredProc.Create(Self);
   Try
      With STPElimina Do Begin
         DatabaseName:= Objeto.Apli.DatabaseName;
         SessionName:= Objeto.Apli.SessionName;
         StoredProcName:='PKGCRDOCUMENTACION.STP_ELIMINA_REG';
         Params.Clear;
         Params.CreateParam(ftFloat,'PE_ID_SOLICITUD',ptInput);
         Params.CreateParam(ftFloat,'PE_ID_ACREDITADO',ptInput);
         Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
         Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

         ParamByName('PE_ID_SOLICITUD').AsFloat := Objeto.IdSolicitud;
         ParamByName('PE_ID_ACREDITADO').AsFloat := Objeto.IdAcreditado;
         ExecProc;

         If (ParamByName('PS_RESULTADO').AsInteger <>0) Then Begin
            ShowMessage( 'PROBLEMAS AL ELIMINAR EL REGISTRO: '+ ParamByName('PS_RESULTADO').AsString +
                       ' : '+  ParamByName('PS_TX_RESULTADO').AsString);
         End;
      End;
   Finally
      STPElimina.Free;
   End;
   CambiaFormato(Objeto.PCT_GAR_DISP.AsFloat);   
end;

procedure TwMRegistro.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
begin
   Objeto.IdSolicitud:= Objeto.ID_SOLICITUD.AsInteger;
   Objeto.IdAcreditado:= Objeto.ID_ACREDITADO.AsInteger;
   Realizado:= True; 
end;

procedure TwMRegistro.cbxB_RegulatorioExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbxB_Regulatorio,True,CNULL,True);
end;

end.
