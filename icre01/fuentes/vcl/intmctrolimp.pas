// Sistema         : Clase de TMCtrolImp
// Fecha de Inicio : 24/05/2004
// Función forma   : Clase de TMCtrolImp
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMCtrolImp;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntGenCre,
IntParamCre,
IntUsuario,
IntMTpCto,
IntMProemio
;

Type
 TMCtrolImp= class;

  TwMCtrolImp=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label7: TLabel;
    edNOM_ID_SOLICITUD: TEdit;
    btID_SOLICITUD: TBitBtn;
    iedID_SOLICITUD: TInterEdit;
    ilIDSOLICITUD: TInterLinkit;
    Label1: TLabel;
    edNUM_IMPRESION: TEdit;
    Label2: TLabel;
    edNOM_CVE_CTO_CRE: TEdit;
    btCVE_CTO_CRE: TBitBtn;
    ilCVE_CTO_CRE: TInterLinkit;
    edCVE_CTO_CRE: TEdit;
    edTX_ENCABEZADO: TMemo;
    Label3: TLabel;
    Label8: TLabel;
    edCVE_USU_IMP: TEdit;
    edNOM_CVE_USU_IMP: TEdit;
    edF_IMPRESION: TEdit;
    Label9: TLabel;
    PnlMsg: TPanel;
    edF_CONTRATO: TEdit;
    Label4: TLabel;
    stpF_EMISION: TInterDateTimePicker;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btID_SOLICITUDClick(Sender: TObject);
    procedure ilIDSOLICITUDEjecuta(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btCVE_CTO_CREClick(Sender: TObject);
    procedure edCVE_CTO_CREExit(Sender: TObject);
    procedure ilCVE_CTO_CREEjecuta(Sender: TObject);
    procedure edTX_ENCABEZADOExit(Sender: TObject);
    procedure iedID_SOLICITUDExit(Sender: TObject);
    procedure ilCVE_CTO_CRECapture(Sender: TObject; var Show: Boolean);
    procedure ilIDSOLICITUDCapture(Sender: TObject; var Show: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure edF_CONTRATOExit(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TMCtrolImp;
end;
 TMCtrolImp= class(TInterFrame)
      private
         FbPreview : Boolean;
         sDetalle: WideString;
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }

        ID_SOLICITUD         : TInterCampo;
        NUM_IMPRESION        : TInterCampo;
        CVE_CTO_CRE          : TInterCampo;
        TX_ENCABEZADO        : TInterCampo;
        CVE_USU_IMP          : TInterCampo;
        F_IMPRESION          : TInterCampo;
        F_CONTRATO           : TInterCampo;

        MProemio             : TMProemio;
        ParamCre             : TParamCre;
        Usuario              : TUsuario;
        MTpCto               : TMTpCto;
        sTipoCto : String;
        sF_Cto   : String;
        property    bPreview : Boolean read FbPreview  write FbPreview ;
        function    InternalBusca : Boolean; override;
        Function    InternalPost:Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation
Uses IntMQrCto;
{$R *.DFM}


constructor TMCtrolImp.Create( AOwner : TComponent );
begin Inherited;
   ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
      ID_SOLICITUD.Caption:='Identificador de la Solicitud';
      ID_SOLICITUD.NoCompare:=False;
   NUM_IMPRESION :=CreaCampo('NUM_IMPRESION',ftFloat,tsNinguno,tsNinguno,True);
      NUM_IMPRESION.Caption:='Número de Impresión';
      NUM_IMPRESION.NoCompare:=False;
   CVE_CTO_CRE :=CreaCampo('CVE_CTO_CRE',ftString,tsNinguno,tsNinguno,True);
      CVE_CTO_CRE.Caption:='Bloque de Firmas';
      CVE_CTO_CRE.NoCompare:= True;
   TX_ENCABEZADO :=CreaCampo('TX_ENCABEZADO',ftString,tsNinguno,tsNinguno,True);
      TX_ENCABEZADO.Caption:='Encabezado';
      TX_ENCABEZADO.IsLongData:=True;
      TX_ENCABEZADO.NoCompare:= True;
   CVE_USU_IMP :=CreaCampo('CVE_USU_IMP',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_IMP.Caption:='Usuario que Imprime';
      CVE_USU_IMP.NoCompare:= True;
   F_IMPRESION :=CreaCampo('F_IMPRESION',ftDate,tsNinguno,tsNinguno,True);
      F_IMPRESION.Caption:='Fecha de Impresión';
      F_IMPRESION.NoCompare:= True;
   F_CONTRATO :=CreaCampo('F_CONTRATO',ftDate,tsNinguno,tsNinguno,True);
      F_CONTRATO.Caption:='Fecha del Contrato';
      F_CONTRATO.NoCompare:= True;

   FKeyFields.Add('ID_SOLICITUD');
   FKeyFields.Add('NUM_IMPRESION');
   TableName := 'CR_CT_CONTROL_IM';
   UseQuery := True;
   HelpFile := 'IntMCtrolImp.Hlp';
   ShowMenuReporte:=True;

   MProemio := TMProemio.Create(Self);
   MProemio.MasterSource := Self;
   MProemio.FieldByName('ID_SOLICITUD').MasterField := 'ID_SOLICITUD';

   Usuario:= TUsuario.Create(Self);
   Usuario.MasterSource := Self;
   Usuario.FieldByName('CVE_USUARIO').MasterField := 'CVE_USU_IMP';

   MTpCto := TMTpCto.Create(Self);
   MTpCto.MasterSource := Self;
   MTpCto.FieldByName('CVE_CTO_CRE').MasterField := 'CVE_CTO_CRE';
end;

Destructor TMCtrolImp.Destroy;
begin
   If Usuario <> Nil Then
      Usuario.Free;
   If MTpCto <> Nil Then
      MTpCto.Free;
   inherited;
end;


function TMCtrolImp.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMCtrolImp;
begin
   W:=TwMCtrolImp.Create(Self);
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


Function TMCtrolImp.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMCtrolImp.it','F,F');
   Try
      if Active then begin
         T.Param(0,ID_SOLICITUD.AsString);
         T.Param(1,NUM_IMPRESION.AsString);
      end;
      if T.Execute then
         If FindKey([T.DameCampo(0),T.DameCampo(1)]) Then Begin
            InternalBusca := True;

            Usuario.FindKey([CVE_USU_IMP.AsString]);
            MProemio.FindKey([ID_SOLICITUD.AsString]);
         End;
   finally
      T.Free;
   end;
end;

function TMCtrolImp.Reporte:Boolean;
begin //Execute_Reporte();
end;

Function TMCtrolImp.InternalPost : Boolean;
Var    stpInserta : TStoredProc;
       VLSalida : Boolean;
       sNuevo : String;
Begin
   InternalPost := False;
   VLSalida := False;
   sNuevo:= 'T';
   If Modo=moEdit Then Begin
      sNuevo:= 'F';
   End;
   If Modo=moAppEnd Then Begin
      sNuevo:= 'T';
   End;
      stpInserta:=TStoredProc.Create(Nil);
      try
         Try
            stpInserta.DatabaseName:=DataBaseName;
            stpInserta.SessionName:=SessionName;
            stpInserta.Active:=False;
            stpInserta.Params.Clear;
            stpInserta.StoredProcName:='PKGCRDOCUMENTACION.STP_ALTAIMPRESION';
            stpInserta.Params.CreateParam(ftFloat,'PE_ID_SOLICITUD',ptInput);
            stpInserta.Params.CreateParam(ftFloat,'PE_NUM_IMPRESION',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_CTO_CRE',ptInput);
//            stpInserta.Params.CreateParam(ftMemo,'PE_TX_ENCABEZADO',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_USU_IMP',ptInput);
            stpInserta.Params.CreateParam(ftDateTime,'PE_F_IMPRESION',ptInput);
            stpInserta.Params.CreateParam(ftDateTime,'PE_F_CONTRATO',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_NUEVO',ptInput);
            stpInserta.Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
            stpInserta.Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

            stpInserta.ParamByName('PE_ID_SOLICITUD').AsFloat := ID_SOLICITUD.AsFloat;
            stpInserta.ParamByName('PE_NUM_IMPRESION').AsFloat := NUM_IMPRESION.AsFloat;
            stpInserta.ParamByName('PE_CVE_CTO_CRE').AsString := CVE_CTO_CRE.AsString;
//            stpInserta.ParamByName('PE_TX_ENCABEZADO').AsMemo := sDetalle;
            stpInserta.ParamByName('PE_CVE_USU_IMP').AsString := CVE_USU_IMP.AsString;

            If F_IMPRESION.AsDateTime <>0 Then
               stpInserta.ParamByName('PE_F_IMPRESION').AsDateTime := F_IMPRESION.AsDateTime
            Else
               stpInserta.ParamByName('PE_F_IMPRESION').Clear;

            If F_CONTRATO.AsDateTime <>0 Then
               stpInserta.ParamByName('PE_F_CONTRATO').AsDateTime := F_CONTRATO.AsDateTime
            Else
               stpInserta.ParamByName('PE_F_CONTRATO').Clear;

            stpInserta.ParamByName('PE_NUEVO').AsString := sNuevo;
            stpInserta.ExecProc;

            If stpInserta.ParamByName('PS_RESULTADO').AsFloat = 0 Then Begin
               VLSalida:= True;
            End Else Begin
                ShowMessage('PROBLEMAS EN ALTA: ' +  IntToStr(stpInserta.ParamByName('PS_RESULTADO').AsInteger)+
                            stpInserta.ParamByName('PS_TX_RESULTADO').AsString);
            End;
         Except
             ShowMessage('Problemas con el Alta de Control. Avise Urgentemente a Sistemas');
         End;
      Finally
          If stpInserta <> Nil Then Begin
            stpInserta.UnPrepare;
            stpInserta.Free;
          End;
      End;
      AutoRefresh := True;
      InternalPost := VLSalida
End;

(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TwMCtrolImp.FormShow(Sender: TObject);
begin
   InterForma1.BtnNuevo.Visible:=False;
   InterForma1.BtnModificar.Visible:=False;
   InterForma1.BtnEliminar.Visible:=False;

   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_SOLICITUD.Control     := iedID_SOLICITUD;
      NUM_IMPRESION.Control    := edNUM_IMPRESION;
      CVE_CTO_CRE.Control      := edCVE_CTO_CRE;
      TX_ENCABEZADO.Control    := edTX_ENCABEZADO;
      CVE_USU_IMP.Control      := edCVE_USU_IMP;
      F_IMPRESION.Control      := edF_IMPRESION;
      F_CONTRATO.Control       := edF_CONTRATO;
      InterForma1.MsgPanel     := PnlMsg;
   End;

   Objeto.MProemio.ID_SOLICITUD.Control := iedID_SOLICITUD;
   Objeto.MProemio.Persona.Nombre.Control := edNOM_ID_SOLICITUD;
   Objeto.MProemio.GetParams(Objeto);

   Objeto.Usuario.CVE_USUARIO.Control := edCVE_USU_IMP;
   Objeto.Usuario.EMPLEADO.Persona.Nombre.Control := edNOM_CVE_USU_IMP;
   Objeto.Usuario.GetParams(Objeto);

   Objeto.MTpCto.CVE_CTO_CRE.Control := edCVE_CTO_CRE;
   Objeto.MTpCto.DESC_L_CONTRATO.Control := edNOM_CVE_CTO_CRE;
   Objeto.MTpCto.GetParams(Objeto);
   Objeto.sDetalle:='';
End;

procedure TwMCtrolImp.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_SOLICITUD.Control     := Nil;
      NUM_IMPRESION.Control    := Nil;
      CVE_CTO_CRE.Control      := Nil;
      TX_ENCABEZADO.Control    := Nil;
      CVE_USU_IMP.Control      := Nil;
      F_IMPRESION.Control      := Nil;
      F_CONTRATO.Control       := Nil;      
      InterForma1.MsgPanel     := Nil;
   End;
   Objeto.MProemio.ID_SOLICITUD.Control := Nil;
   Objeto.MProemio.Persona.Nombre.Control := Nil;

   Objeto.Usuario.CVE_USUARIO.Control := Nil;
   Objeto.Usuario.EMPLEADO.Persona.Nombre.Control := Nil;

   Objeto.MTpCto.CVE_CTO_CRE.Control := Nil;
   Objeto.MTpCto.DESC_L_CONTRATO.Control := Nil;
end;

procedure TwMCtrolImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMCtrolImp.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_IMPRESION.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.F_CONTRATO.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_IMP.AsString := Objeto.Apli.Usuario;
   Objeto.Usuario.FindKey([Objeto.Apli.Usuario]);

   Objeto.F_IMPRESION.AsString:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));
   Objeto.F_CONTRATO.AsString:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));

   Objeto.ID_SOLICITUD.AsInteger:= Objeto.MProemio.ID_SOLICITUD.AsInteger;
   edCVE_CTO_CRE.SetFocus;
   If Trim(Objeto.sTipoCto)<>'' Then Begin
      Objeto.MTpCto.FindKey([Trim(Objeto.sTipoCto)]);
      edTX_ENCABEZADO.Lines.Text := Objeto.MTpCto.MCatEncab.TX_ENCABEZADO.AsString;
   End;
   If Trim(Objeto.sF_Cto)<>'' Then Begin
      edF_CONTRATO.Text:= Objeto.sF_Cto;
      edF_CONTRATO.SetFocus;
   End;
end;

procedure TwMCtrolImp.InterForma1DespuesModificar(Sender: TObject);
begin
end;

//procedure TWNinguno.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;

procedure TwMCtrolImp.btID_SOLICITUDClick(Sender: TObject);
begin
   Objeto.MProemio.ShowAll := True;
   If Objeto.MProemio.Busca Then
      InterForma1.NextTab(iedID_SOLICITUD);
end;

procedure TwMCtrolImp.ilIDSOLICITUDEjecuta(Sender: TObject);
begin
   If Objeto.MProemio.FindKey([ilIDSOLICITUD.Buffer]) Then
      InterForma1.NextTab(iedID_SOLICITUD);
end;

procedure TwMCtrolImp.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
Var
   sSQL:String;
   qyQuery:TQuery;
begin
   edCVE_CTO_CRE.Tag:= 562;
   btCVE_CTO_CRE.Tag:= 50;
   iedID_SOLICITUD.Tag:= 562;
   btID_SOLICITUD.Tag:= 50;
   edF_CONTRATO.Tag:=50;
   stpF_EMISION.Tag:=50;

   If IsNewData Then Begin
      sSQL:='SELECT (NVL(Max(NUM_IMPRESION),0)+1)NUM FROM CR_CT_CONTROL_IM ' +
            ' WHERE ID_SOLICITUD ='+ Objeto.ID_SOLICITUD.AsSQL;
      qyQuery:= GetSQLQuery(sSQL,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      If qyQuery<> Nil Then Begin
         Objeto.NUM_IMPRESION.AsString:=qyQuery.FieldByName('NUM').AsString;
         qyQuery.Free;
      End Else Begin
         Objeto.NUM_IMPRESION.AsString:='1';
      End;
   End;

   If Trim(Objeto.NUM_IMPRESION.AsString)<>'' Then
      Realizado := True
   Else
      Realizado := False;
   If Realizado Then Begin
      Objeto.sDetalle:= TrimRight(edTX_ENCABEZADO.Lines.Text);
      Objeto.sDetalle:= AdjustLineBreaks(edTX_ENCABEZADO.Lines.Text);
   End;
end;

procedure TwMCtrolImp.btCVE_CTO_CREClick(Sender: TObject);
begin
   Objeto.MTpCto.ShowAll := True;
   If Objeto.MTpCto.Busca Then Begin
      edTX_ENCABEZADO.Lines.Text := Objeto.MTpCto.MCatEncab.TX_ENCABEZADO.AsString;
      InterForma1.NextTab(edCVE_CTO_CRE);
   End;
end;

procedure TwMCtrolImp.edCVE_CTO_CREExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_CTO_CRE.GetFromControl;
      if Objeto.CVE_CTO_CRE.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique el Tipo de Contrato';
      end;
      InterForma1.ValidaExit(edCVE_CTO_CRE,vlSalida,vlMsg,True);
   end;
end;

procedure TwMCtrolImp.ilCVE_CTO_CREEjecuta(Sender: TObject);
begin
   If Objeto.MTpCto.FindKey([ilCVE_CTO_CRE.Buffer]) Then Begin
      edTX_ENCABEZADO.Lines.Text := Objeto.MTpCto.MCatEncab.TX_ENCABEZADO.AsString;   
      InterForma1.NextTab(edCVE_CTO_CRE);
   End;
end;

procedure TwMCtrolImp.edTX_ENCABEZADOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edTX_ENCABEZADO,True,CNULL,True);
end;

procedure TwMCtrolImp.iedID_SOLICITUDExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_SOLICITUD.GetFromControl;
      if Objeto.ID_SOLICITUD.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique el Número de Solicitud';
      end;
      InterForma1.ValidaExit(iedID_SOLICITUD,vlSalida,vlMsg,True);
   end;
end;

procedure TwMCtrolImp.ilCVE_CTO_CRECapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.IsNewData);
end;

procedure TwMCtrolImp.ilIDSOLICITUDCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.IsNewData);
end;

procedure TwMCtrolImp.InterForma1DespuesAceptar(Sender: TObject);
begin
{   RepCto(  Objeto.ID_SOLICITUD.AsInteger,
            Objeto.NUM_IMPRESION.AsInteger,
            Objeto.Apli , Objeto.FbPreview, True);}

end;

procedure TwMCtrolImp.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
   If Objeto.MProemio.ID_SOLICITUD.AsInteger <> 0 Then Begin
      btID_SOLICITUD.Tag:= 17;
      iedID_SOLICITUD.Tag:= 0;
   End Else Begin
      btID_SOLICITUD.Tag:= 50;
      iedID_SOLICITUD.Tag:= 562;
   End;
   If Trim(Objeto.sTipoCto)<>'' Then Begin
      edCVE_CTO_CRE.Tag:= 0;
      btCVE_CTO_CRE.Tag:= 17;
   End Else Begin
      edCVE_CTO_CRE.Tag:= 562;
      btCVE_CTO_CRE.Tag:= 50;
   End;
   If Trim(Objeto.sF_Cto)<>'' Then Begin
      edF_CONTRATO.Tag:= 17;
      stpF_EMISION.Tag:= 17;
   End Else Begin
      edF_CONTRATO.Tag:= 50;
      stpF_EMISION.Tag:= 50;
   End;
   InterForma1.InitShow;
end;
procedure TwMCtrolImp.edF_CONTRATOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.F_CONTRATO.GetFromControl;
      if Objeto.F_CONTRATO.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la fecha del contrato ';
      end;
      InterForma1.ValidaExit(edF_CONTRATO,vlSalida,vlMsg,True);
   end;
end;

end.

