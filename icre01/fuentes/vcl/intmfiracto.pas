// Sistema         : Clase de CR_GA_FIRA_CTO
// Fecha de Inicio : 13/07/2004
// Función forma   : Clase de CR_GA_FIRA_CTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMFiraCto;           

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre, InterEdit, IntCrCto, IntMFiraEq, IntMFiraOpe;

Type
 TMFiraCto= class;

  TwMFiraCto=Class(TForm)
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
    Label6: TLabel;
    edID_SOLICITUD: TInterEdit;
    Label2: TLabel;
    edID_CONTRATO: TEdit;
    btID_CONTRATO: TBitBtn;
    edNOMBRE_CONTRATO: TEdit;
    ilID_CONTRATO: TInterLinkit;
    Label5: TLabel;
    btPCT_GTIA_LIQ: TBitBtn;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    rgSITUACION: TRadioGroup;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edCVE_PRODUCTO: TEdit;
    ilPCT_GTIA_LIQ: TInterLinkit;
    edPCT_GTIA_LIQ: TInterEdit;
    edPCT_GTIA_NO: TInterEdit;
    edPCT_GTIA_CF: TInterEdit;
    edPCT_GTIA_EF: TInterEdit;
    edNUM_DIAS_SOL_GLI: TInterEdit;
    Label7: TLabel;
    edNUM_DIAS_SOL_GFE: TInterEdit;
    Label8: TLabel;
    edNUM_DIAS_PRO_JUD: TInterEdit;
    Label9: TLabel;
    edPCT_GTIA_LIQ_INM: TInterEdit;
    Label10: TLabel;
    Label11: TLabel;
    edCVE_OPERATIVA: TEdit;
    btCVE_OPERATIVA: TBitBtn;
    edNOM_CVE_OPERATIVA: TEdit;
    ilCVE_OPERATIVA: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure ilID_CONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure ilPCT_GTIA_LIQCapture(Sender: TObject; var Show: Boolean);
    procedure ilPCT_GTIA_LIQEjecuta(Sender: TObject);
    procedure ilID_ASEGURADORACapture(Sender: TObject; var Show: Boolean);
    procedure btPCT_GTIA_LIQClick(Sender: TObject);
    procedure edID_CONTRATOExit(Sender: TObject);
    procedure edPCT_GTIA_LIQExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure edNUM_DIAS_SOL_GLIExit(Sender: TObject);
    procedure edNUM_DIAS_SOL_GFEExit(Sender: TObject);
    procedure edNUM_DIAS_PRO_JUDExit(Sender: TObject);
    procedure edCVE_OPERATIVAExit(Sender: TObject);
    procedure btCVE_OPERATIVAClick(Sender: TObject);
    procedure ilCVE_OPERATIVACapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_OPERATIVAEjecuta(Sender: TObject);

    private
      Function ObtFolio(pCveFolio : String; pMsg : String): Integer;
      Function ObtPorc(dPorcLiq: Double):Boolean;
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMFiraCto;
    end;

 TMFiraCto= class(TInterFrame)
      private
         iIdContrato, iFolCto : Integer;
      protected
      public
        { Public declarations }
        ID_SOLICITUD        : TInterCampo;
        ID_CONTRATO         : TInterCampo;
        CVE_OPERATIVA       : TInterCampo;
        PCT_GTIA_LIQ        : TInterCampo;
        SIT_GA_FIRA         : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;
        NUM_DIAS_SOL_GLI    : TInterCampo;
        NUM_DIAS_SOL_GFE    : TInterCampo;
        NUM_DIAS_PRO_JUD    : TInterCampo;

        PCT_GTIA_LIQ_INM    : TInterCampo;
        PCT_GTIA_FEGA_EF    : TInterCampo;
        PCT_GTIA_FEGA_NO    : TInterCampo;
        PCT_CUOTA_FEGA      : TInterCampo;
        FOL_CONTRATO        : TInterCampo;

        ParamCre            : TParamCre;
        Autorizacion        : TCrCto;
        MFiraEq             : TMFiraEq;
        MFiraOpe            : TMFiraOpe;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMFiraCto.Create( AOwner : TComponent );
begin Inherited;
   ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
      ID_SOLICITUD.Caption:='Identificador único';
   ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
      ID_CONTRATO.Caption:='Identificador de Contratos';
   CVE_OPERATIVA :=CreaCampo('CVE_OPERATIVA',ftString,tsNinguno,tsNinguno,True);
      CVE_OPERATIVA.Caption:='Clave de Operativa';
   PCT_GTIA_LIQ :=CreaCampo('PCT_GTIA_LIQ',ftFloat,tsNinguno,tsNinguno,True);
      PCT_GTIA_LIQ.Caption:='Porcentaje de garantía líquida';

   SIT_GA_FIRA :=CreaCampo('SIT_GA_FIRA',ftString,tsNinguno,tsNinguno,True);
   With SIT_GA_FIRA Do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   End;
      SIT_GA_FIRA.Caption:='Situación';
      SIT_GA_FIRA.NoCompare:= True;
   F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha de alta';
      F_ALTA.NoCompare:= True;
   CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Usuario de alta';
      CVE_USU_ALTA.NoCompare:= True;
   F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
      F_MODIFICA.Caption:='Fechad e modificación';
      F_MODIFICA.NoCompare:= True;
   CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption:='Usuario de modificación';
      CVE_USU_MODIFICA.NoCompare:= True;
   NUM_DIAS_SOL_GLI :=CreaCampo('NUM_DIAS_SOL_GLI',ftFloat,tsNinguno,tsNinguno,True);
      NUM_DIAS_SOL_GLI.Caption:='Días para requerir garantía líquida';
      NUM_DIAS_SOL_GLI.NoCompare:= True;
   NUM_DIAS_SOL_GFE :=CreaCampo('NUM_DIAS_SOL_GFE',ftFloat,tsNinguno,tsNinguno,True);
      NUM_DIAS_SOL_GFE.Caption:='Días para requerir garantía FEGA';
      NUM_DIAS_SOL_GFE.NoCompare:= True;
   NUM_DIAS_PRO_JUD :=CreaCampo('NUM_DIAS_PRO_JUD',ftFloat,tsNinguno,tsNinguno,True);
      NUM_DIAS_PRO_JUD.Caption:='Días para iniciar proceso judicial';
      NUM_DIAS_PRO_JUD.NoCompare:= True;

   PCT_GTIA_LIQ_INM :=CreaCampo('PCT_GTIA_LIQ_INM',ftFloat,tsNinguno,tsNinguno,False);
      PCT_GTIA_LIQ_INM.Caption:='Porcentaje de garantía líquida';
   PCT_GTIA_FEGA_EF :=CreaCampo('PCT_GTIA_FEGA_EF',ftFloat,tsNinguno,tsNinguno,False);
      PCT_GTIA_FEGA_EF.Caption:='Porcentaje de garantía líquida';
   PCT_GTIA_FEGA_NO :=CreaCampo('PCT_GTIA_FEGA_NO',ftFloat,tsNinguno,tsNinguno,False);
      PCT_GTIA_FEGA_NO.Caption:='Porcentaje de garantía líquida';
   PCT_CUOTA_FEGA :=CreaCampo('PCT_CUOTA_FEGA',ftFloat,tsNinguno,tsNinguno,False);
      PCT_CUOTA_FEGA.Caption:='Porcentaje de garantía líquida';
   FOL_CONTRATO :=CreaCampo('FOL_CONTRATO',ftFloat,tsNinguno,tsNinguno,False);
      FOL_CONTRATO.Caption:='Folio Contrato';

   FKeyFields.Add('ID_SOLICITUD');
   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('CVE_OPERATIVA');

   TableName := 'CR_GA_FIRA_CTO';
   UseQuery := True;
   HelpFile := 'IntMFiraCto.Hlp';
   ShowMenuReporte:=True;

   Autorizacion := TCrCto.Create(Self);
   Autorizacion.MasterSource := Self;
   Autorizacion.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';

   MFiraEq := TMFiraEq.Create(Self);
   MFiraEq.MasterSource:=Self;

   MFiraOpe := TMFiraOpe.Create(Self);
   MFiraOpe.MasterSource := Self;
   MFiraOpe.FieldByName('CVE_OPERATIVA').MasterField := 'CVE_OPERATIVA';
end;


Destructor TMFiraCto.Destroy;
begin
   If MFiraEq <> Nil Then
      MFiraEq.Free;
   If MFiraOpe <> Nil Then
      MFiraOpe.Free;
   Inherited;
end;

function TMFiraCto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMFiraCto;
begin
   W:=TWMFiraCto.Create(Self);
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

Function TMFiraCto.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMFiraCto.it','I,I,S,F');
   Try
      If Active Then Begin
         T.Param(0,ID_SOLICITUD.AsString);
         T.Param(1,ID_CONTRATO.AsString);
         T.Param(2,CVE_OPERATIVA.AsString);
      End;
      If T.Execute Then Begin
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      End;
   finally
      T.Free;
   end;
end;

function TMFiraCto.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_GA_FIRA_CTO********************)
(*                                                                              *)
(*  FORMA DE CR_GA_FIRA_CTO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_FIRA_CTO********************)

procedure TwMFiraCto.FormShow(Sender: TObject);
begin

   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_SOLICITUD.Control     := edID_SOLICITUD;
      ID_CONTRATO.Control      := edID_CONTRATO;
      CVE_OPERATIVA.Control    := edCVE_OPERATIVA;
      PCT_GTIA_LIQ.Control     := edPCT_GTIA_LIQ;
      SIT_GA_FIRA.Control      := rgSITUACION;
      F_ALTA.Control           := edF_ALTA;
      CVE_USU_ALTA.Control     := edCVE_USU_ALTA;
      F_MODIFICA.Control       := edF_MODIFICA;
      CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;
      NUM_DIAS_SOL_GLI.Control := edNUM_DIAS_SOL_GLI;
      NUM_DIAS_SOL_GFE.Control := edNUM_DIAS_SOL_GFE;
      NUM_DIAS_PRO_JUD.Control := edNUM_DIAS_PRO_JUD;

      PCT_GTIA_LIQ_INM.Control := edPCT_GTIA_LIQ_INM;
      PCT_GTIA_FEGA_EF.Control := edPCT_GTIA_EF;
      PCT_GTIA_FEGA_NO.Control := edPCT_GTIA_NO;
      PCT_CUOTA_FEGA.Control   := edPCT_GTIA_CF;
      InterForma1.MsgPanel     := PnlMsg;

      Autorizacion.ID_CONTRATO.Control := edID_CONTRATO;
      Autorizacion.CVE_PRODUCTO_CRE.Control := edNOMBRE_CONTRATO;
      Autorizacion.Producto.DESC_C_PRODUCTO.Control:= edCVE_PRODUCTO;
      Autorizacion.GetParams(Objeto);

      MFiraEq.PCT_GTIA_LIQ.Control := edPCT_GTIA_LIQ_INM;
      MFiraEq.PCT_GTIA_FEGA_EF.Control := edPCT_GTIA_EF;
      MFiraEq.PCT_GTIA_FEGA_NO.Control := edPCT_GTIA_NO;
      MFiraEq.PCT_CUOTA_FEGA.Control := edPCT_GTIA_CF;
      MFiraEq.GetParams(Objeto);

      MFiraOpe.CVE_OPERATIVA.Control := edCVE_OPERATIVA;
      MFiraOpe.DESC_OPERATIVA.Control := edNOM_CVE_OPERATIVA;
      MFiraOpe.GetParams(Objeto);
   End;

   If Objeto.Autorizacion.FOL_CONTRATO.AsInteger <> 0 Then Begin
      Objeto.FOL_CONTRATO.AsInteger:= Objeto.Autorizacion.FOL_CONTRATO.AsInteger;
      Objeto.iFolCto:= Objeto.Autorizacion.FOL_CONTRATO.AsInteger;
   End;

   If Objeto.ID_CONTRATO.AsInteger <> 0 Then Begin
      //Objeto.Autorizacion.FindKey([Objeto.ID_CONTRATO.AsInteger, Objeto.FOL_CONTRATO.AsInteger]);
      Objeto.iIdContrato:= Objeto.ID_CONTRATO.AsInteger;
   End Else Begin
      Objeto.iIdContrato:= 0;
   End;
end;

procedure TwMFiraCto.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_SOLICITUD.Control     := Nil;
      ID_CONTRATO.Control      := Nil;
      CVE_OPERATIVA.Control    := Nil;      
      PCT_GTIA_LIQ.Control     := Nil;
      SIT_GA_FIRA.Control      := Nil;
      F_ALTA.Control           := Nil;
      CVE_USU_ALTA.Control     := Nil;
      F_MODIFICA.Control       := Nil;
      CVE_USU_MODIFICA.Control := Nil;
      NUM_DIAS_SOL_GLI.Control := Nil;
      NUM_DIAS_SOL_GFE.Control := Nil;
      NUM_DIAS_PRO_JUD.Control := Nil;
      InterForma1.MsgPanel     := Nil;

      PCT_GTIA_LIQ_INM.Control := Nil;
      PCT_GTIA_FEGA_EF.Control := Nil;
      PCT_GTIA_FEGA_NO.Control := Nil;
      PCT_CUOTA_FEGA.Control   := Nil;

      Autorizacion.ID_CONTRATO.Control  := Nil;
      Autorizacion.CVE_PRODUCTO_CRE.Control := Nil;
      Autorizacion.Producto.DESC_C_PRODUCTO.Control:= Nil;

      MFiraEq.PCT_GTIA_LIQ.Control := Nil;
      MFiraEq.PCT_GTIA_FEGA_EF.Control := Nil;
      MFiraEq.PCT_GTIA_FEGA_NO.Control := Nil;
      MFiraEq.PCT_CUOTA_FEGA.Control := Nil;

      MFiraOpe.CVE_OPERATIVA.Control := Nil;
      MFiraOpe.DESC_OPERATIVA.Control := Nil;
   End;
end;

procedure TwMFiraCto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMFiraCto.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
      ObtPorc(Objeto.PCT_GTIA_LIQ.AsFloat);
      Objeto.MFiraOpe.FindKey([Objeto.CVE_OPERATIVA.AsString]);
   End;
end;

procedure TwMFiraCto.InterForma1DespuesNuevo(Sender: TObject);
begin

   //HERJA - FILTRADO DE OPERATIVAS ACTIVAS
   Objeto.MFiraOpe.BuscaWhereString:=' SIT_OPERATIVA=''AC''';

   rgSITUACION.ItemIndex:= 0;
   If Objeto.iIdContrato <> 0 Then Begin
      Objeto.Autorizacion.FindKey([Objeto.iIdContrato, Objeto.iFolCto]);
   End Else
      Objeto.Autorizacion.FindKey([Objeto.ID_CONTRATO.AsInteger,Objeto.FOL_CONTRATO.AsInteger]);
   edCVE_OPERATIVA.SetFocus;
end;

procedure TwMFiraCto.InterForma1DespuesModificar(Sender: TObject);
begin
   edNUM_DIAS_SOL_GLI.SetFocus;
end;

procedure TwMFiraCto.btID_CONTRATOClick(Sender: TObject);
begin
   Objeto.Autorizacion.ShowAll := True;
   If Objeto.Autorizacion.Busca Then Begin
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TwMFiraCto.ilID_CONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)and (InterForma1.IsNewData);
end;

procedure TwMFiraCto.ilID_CONTRATOEjecuta(Sender: TObject);
begin
   If Objeto.Autorizacion.FindKey([ilID_CONTRATO.Buffer,'1']) Then Begin
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TwMFiraCto.ilPCT_GTIA_LIQCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)or (InterForma1.IsNewData);
end;

procedure TwMFiraCto.ilPCT_GTIA_LIQEjecuta(Sender: TObject);
begin
{  If Objeto.MFiraEq.FindKey([ Objeto.Autorizacion.CVE_MONEDA.AsString ,ilPCT_GTIA_LIQ.Buffer]) Then Begin
      InterForma1.NextTab(edPCT_GTIA_LIQ);
   End;}
end;

procedure TwMFiraCto.ilID_ASEGURADORACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)or (InterForma1.IsNewData);
end;

procedure TwMFiraCto.btPCT_GTIA_LIQClick(Sender: TObject);
begin
   Objeto.CVE_OPERATIVA.GetFromControl;
   If Objeto.Autorizacion.CVE_MONEDA.AsInteger <> 0 Then Begin
      If Objeto.CVE_OPERATIVA.AsString <> '' Then Begin
         Objeto.MFiraEq.BuscaWhereString:=
         ' CR_FIRA_EQUIV.CVE_MONEDA = '+ Objeto.Autorizacion.CVE_MONEDA.AsSQL +
         ' AND CR_FIRA_EQUIV.SIT_EQUIV_FIRA ='+ #39 + CSIT_AC + #39 +
         ' AND CR_FIRA_EQUIV.CVE_OPERATIVA ='+ Objeto.CVE_OPERATIVA.AsSQL;
      End Else Begin
         Objeto.MFiraEq.BuscaWhereString:=
         ' CR_FIRA_EQUIV.CVE_MONEDA = '+ Objeto.Autorizacion.CVE_MONEDA.AsSQL +
         ' AND CR_FIRA_EQUIV.SIT_EQUIV_FIRA ='+ #39 + CSIT_AC + #39;
      End;
   End Else Begin
      Objeto.MFiraEq.BuscaWhereString:= ' ';
   End;

   Objeto.MFiraEq.FilterString := Objeto.MFiraEq.BuscaWhereString;
   Objeto.MFiraEq.ShowAll := True;
   If Objeto.MFiraEq.Busca Then Begin
      edPCT_GTIA_LIQ.Text:= Objeto.MFiraEq.PCT_GTIA_LIQ.AsString;
      InterForma1.NextTab(edPCT_GTIA_LIQ);
   End;
end;

procedure TwMFiraCto.edID_CONTRATOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg:  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_CONTRATO.GetFromControl;
      If Objeto.ID_CONTRATO.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe seleccionar una Autorización';
      End;
      InterForma1.ValidaExit(edID_CONTRATO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMFiraCto.edPCT_GTIA_LIQExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg, sSQL,vlClave :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.PCT_GTIA_LIQ.GetFromControl;
      If Objeto.PCT_GTIA_LIQ.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe seleccionar un porcentaje de garantía líquida';
      End Else Begin
         If InterForma1.IsNewData Then Begin
             sSQL:='SELECT ID_SOLICITUD, ID_ACREDITADO FROM CR_GA_FIRA_CTO '+
                   ' WHERE ID_SOLICITUD ='+ Objeto.ID_SOLICITUD.AsSQL +
                   '   AND ID_CONTRATO ='+  Objeto.ID_CONTRATO.AsSQL +
                   '   AND CVE_OPERATIVA ='+ Objeto.CVE_OPERATIVA.AsSQL;
             GetSQLStr(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'ID_SOLICITUD',vlClave,False);
             If (vlClave <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La relación entre Autorización, Operativa y Porcentaje ya existe';
             End;
         End;
         If not ObtPorc(Objeto.PCT_GTIA_LIQ.AsFloat) Then Begin
            vlSalida   := False;
            vlMsg := 'Problemas al obtener los porcentajes para el tipo de Operativa';
         End;
      End;
      InterForma1.ValidaExit(edPCT_GTIA_LIQ,vlSalida,vlMsg,True);
   End;
end;

procedure TwMFiraCto.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   With Objeto Do Begin
      if IsNewData then Begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
            mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USU_ALTA.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            ID_SOLICITUD.AsInteger := ObtFolio('CRFIRA','ID SOLICITUD: ');
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

Function TwMFiraCto.ObtFolio(pCveFolio : String; pMsg : String): Integer;
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

procedure TwMFiraCto.InterForma1DespuesShow(Sender: TObject);
begin
   If (Objeto.Autorizacion.CVE_MONEDA.AsInteger <> 0)and
      (Objeto.CVE_OPERATIVA.AsString <> '' )Then Begin
      ObtPorc(Objeto.PCT_GTIA_LIQ.AsFloat);
      //Objeto.MFiraOpe.FindKey([Objeto.CVE_OPERATIVA.AsString]);
   End;
end;

procedure TwMFiraCto.InterForma1DespuesCancelar(Sender: TObject);
begin
   If Objeto.Autorizacion.CVE_MONEDA.AsInteger <> 0 Then Begin
      {Objeto.MFiraEq.FindKey([Objeto.Autorizacion.CVE_MONEDA.AsString,
                              Objeto.CVE_OPERATIVA.AsString,
                              Objeto.PCT_GTIA_LIQ.AsString]);}
      ObtPorc(Objeto.PCT_GTIA_LIQ.AsFloat);
   End Else Begin
      edCVE_PRODUCTO.Text:='';
      edNOMBRE_CONTRATO.Text:='';
   End;
end;

procedure TwMFiraCto.InterForma1DespuesEliminar(Sender: TObject);
begin
   edCVE_PRODUCTO.Text:='';
   edNOMBRE_CONTRATO.Text:='';
end;

procedure TwMFiraCto.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado := True;
end;

procedure TwMFiraCto.edNUM_DIAS_SOL_GLIExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.NUM_DIAS_SOL_GLI.GetFromControl;
      If Objeto.NUM_DIAS_SOL_GLI.AsInteger < 0  Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el número de días para requerir la garantía líquida';
      End;
      InterForma1.ValidaExit(edNUM_DIAS_SOL_GLI,vlSalida,vlMsg,True);
   End;
end;

procedure TwMFiraCto.edNUM_DIAS_SOL_GFEExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.NUM_DIAS_SOL_GFE.GetFromControl;
      If Objeto.NUM_DIAS_SOL_GFE.AsInteger <0  Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el número de días para requerir la garantía FEGA';
      End;
      InterForma1.ValidaExit(edNUM_DIAS_SOL_GFE,vlSalida,vlMsg,True);
   End;
end;

procedure TwMFiraCto.edNUM_DIAS_PRO_JUDExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.NUM_DIAS_PRO_JUD.GetFromControl;
      If Objeto.NUM_DIAS_PRO_JUD.AsInteger <0  Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el número de días para iniciar proceso judicial';
      End;
      InterForma1.ValidaExit(edNUM_DIAS_PRO_JUD,vlSalida,vlMsg,True);
   End;
end;

Function TwMFiraCto.ObtPorc(dPorcLiq: Double):Boolean;
Var
   STP : TStoredProc;
   bSalir : Boolean;
Begin
   bSalir:= False;
   STP := TStoredProc.Create(Nil);
   Try
      With STP Do Begin
         DatabaseName:= Objeto.Apli.DatabaseName;
         SessionName:= Objeto.Apli.SessionName;
         StoredProcName:='PKGCRDOCUMENTACION.STPOBTEQUIVALENCIA';
         Params.Clear;
         Params.CreateParam(ftFloat,'PECVE_MONEDA',ptInput);
         Params.CreateParam(ftFloat,'PEPCT_GTIA_LIQ',ptInput);
         Params.CreateParam(ftString,'PECVE_OPERATIVA',ptInput);
         Params.CreateParam(ftFloat,'PSPCT_GTIA_LIQ_INM',ptOutput);
         Params.CreateParam(ftFloat,'PSPCT_GTIA_FEGA_EF',ptOutput);
         Params.CreateParam(ftFloat,'PSPCT_GTIA_FEGA_NO',ptOutput);
         Params.CreateParam(ftFloat,'PSPCT_CUOTA_FEGA',ptOutput);
         Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTX_RESULTADO',ptOutput);

         ParamByName('PECVE_MONEDA').AsFloat := Objeto.Autorizacion.CVE_MONEDA.AsFloat;
         ParamByName('PEPCT_GTIA_LIQ').AsFloat := Objeto.PCT_GTIA_LIQ.AsFloat;
         ParamByName('PECVE_OPERATIVA').AsString := Objeto.CVE_OPERATIVA.AsString;
         ExecProc;

         If (ParamByName('PSRESULTADO').AsInteger = 0) Then Begin
            Objeto.PCT_GTIA_LIQ_INM.AsFloat := ParamByName('PSPCT_GTIA_LIQ_INM').AsFloat;
            Objeto.PCT_GTIA_FEGA_EF.AsFloat := ParamByName('PSPCT_GTIA_FEGA_EF').AsFloat;
            Objeto.PCT_GTIA_FEGA_NO.AsFloat := ParamByName('PSPCT_GTIA_FEGA_NO').AsFloat;
            Objeto.PCT_CUOTA_FEGA.AsFloat   := ParamByName('PSPCT_CUOTA_FEGA').AsFloat;
            bSalir:=True;
         End Else Begin
            {howMessage('PROBLEMAS AL OBTENER LOS PORCENTAJES ' +
            IntToStr(ParamByName('PSRESULTADO').AsInteger)+': '+
            ParamByName('PSTX_RESULTADO').AsString);}
            bSalir:= False;
         End;
      End;
   Finally
      STP.Free;
   End;
   ObtPorc:= bSalir;
End;
procedure TwMFiraCto.edCVE_OPERATIVAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg :  String;
     sSQL: String;
     qyQuery: TQuery;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_OPERATIVA.GetFromControl;
      If Objeto.CVE_OPERATIVA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe seleccionar una Operativa';
      End;

      //HERJA VALIDA OPERATIVAS ACTIVAS
      sSQL:=' SELECT SIT_OPERATIVA FROM CR_FIRA_OPERA ' +
            ' WHERE CVE_OPERATIVA = '''+edCVE_OPERATIVA.Text+'''';

      qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
       If qyQuery <> Nil Then
         Begin
            if qyQuery.FieldByName('SIT_OPERATIVA').AsString<>'AC' then
            begin
              VLMsg := 'La Operativa no se encuentra Activa';
              VlSalida   := False;
              edCVE_OPERATIVA.Text:='';
              edNOM_CVE_OPERATIVA.Text:='';
            end;
         End
         else
         begin
            VLMsg := 'No se encontro la Operativa en el Catálogo';
            VlSalida   := False;
            edCVE_OPERATIVA.Text:='';
            edNOM_CVE_OPERATIVA.Text:='';
         end;
      //FIN HERJA
      InterForma1.ValidaExit(edCVE_OPERATIVA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMFiraCto.btCVE_OPERATIVAClick(Sender: TObject);
begin
   Objeto.MFiraOpe.ShowAll := True;
   If Objeto.MFiraOpe.Busca Then Begin
      InterForma1.NextTab(edCVE_OPERATIVA);
   End;
end;

procedure TwMFiraCto.ilCVE_OPERATIVACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)and (InterForma1.IsNewData);
end;

procedure TwMFiraCto.ilCVE_OPERATIVAEjecuta(Sender: TObject);
begin
   If Objeto.MFiraOpe.FindKey([ilCVE_OPERATIVA.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_OPERATIVA);
   End;
end;

end.
