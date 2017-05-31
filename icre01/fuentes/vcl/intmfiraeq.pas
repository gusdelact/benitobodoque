// Sistema         : Clase de CR_FIRA_EQUIV
// Fecha de Inicio : 24/06/2004
// Función forma   : Clase de CR_FIRA_EQUIV
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMFiraEq;           
                                         
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre, InterEdit, IntCrRePrMn, IntMon, IntMFiraOpe;

Type
 TMFiraEq= class;

  TwMFiraEq=Class(TForm)
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
    Label1: TLabel;
    rgSITUACION: TRadioGroup;
    btCVE_MONEDA: TBitBtn;
    edNOM_MONEDA: TEdit;
    ilCVE_MONEDA: TInterLinkit;
    edPCT_GTIA_LIQ: TInterEdit;
    edPCT_GTIA_FEGA_EF: TInterEdit;
    Label2: TLabel;
    edPCT_GTIA_FEGA_NO: TInterEdit;
    Label4: TLabel;
    edPCT_CUOTA_FEGA: TInterEdit;
    Label5: TLabel;
    edCVE_MONEDA: TInterEdit;
    Label11: TLabel;
    edCVE_OPERATIVA: TEdit;
    edNOM_CVE_OPERATIVA: TEdit;
    btCVE_OPERATIVA: TBitBtn;
    ilCVE_OPERATIVA: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure edPCT_GTIA_LIQExit(Sender: TObject);
    procedure rgSITUACIONExit(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure ilCVE_MONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure edPCT_GTIA_FEGA_EFExit(Sender: TObject);
    procedure edPCT_GTIA_FEGA_NOExit(Sender: TObject);
    procedure edPCT_CUOTA_FEGAExit(Sender: TObject);
    procedure edCVE_OPERATIVAExit(Sender: TObject);
    procedure btCVE_OPERATIVAClick(Sender: TObject);
    procedure ilCVE_OPERATIVACapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_OPERATIVAEjecuta(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMFiraEq;
    end;

 TMFiraEq= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_MONEDA          : TInterCampo;
        PCT_GTIA_LIQ        : TInterCampo;
        CVE_OPERATIVA       : TInterCampo;
        PCT_GTIA_FEGA_EF    : TInterCampo;
        PCT_GTIA_FEGA_NO    : TInterCampo;
        PCT_CUOTA_FEGA      : TInterCampo;
        SIT_EQUIV_FIRA      : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;

        ParamCre            : TParamCre;
        Moneda              : TMoneda;
        MFiraOpe            : TMFiraOpe;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;

        //HERJA
        procedure    STPREL_OPERATIVAS(PECVE_OPERATIVA, PENVA_SITUACION: String);
        //FIN HERJA
      published
      end;

implementation
{$R *.DFM}

constructor TMFiraEq.Create( AOwner : TComponent );
begin Inherited;

   CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
      CVE_MONEDA.Caption:='Clave de moneda';
   PCT_GTIA_LIQ :=CreaCampo('PCT_GTIA_LIQ',ftFloat,tsNinguno,tsNinguno,True);
      PCT_GTIA_LIQ.Caption:='Porcentaje de Garantía Líquida aplicada';
   CVE_OPERATIVA :=CreaCampo('CVE_OPERATIVA',ftString,tsNinguno,tsNinguno,True);
      CVE_OPERATIVA.Caption:='Clave de Operativa';
   PCT_GTIA_FEGA_EF :=CreaCampo('PCT_GTIA_FEGA_EF',ftFloat,tsNinguno,tsNinguno,True);
      PCT_GTIA_FEGA_EF.Caption:='Porcentaje de garantía FEGA Efectiva';
      PCT_GTIA_FEGA_EF.NoCompare:= True;
   PCT_GTIA_FEGA_NO :=CreaCampo('PCT_GTIA_FEGA_NO',ftFloat,tsNinguno,tsNinguno,True);
      PCT_GTIA_FEGA_NO.Caption:='Porcentaje de garantía FEGA Nominal';
      PCT_GTIA_FEGA_NO.NoCompare:= True;
   PCT_CUOTA_FEGA :=CreaCampo('PCT_CUOTA_FEGA',ftFloat,tsNinguno,tsNinguno,True);
      PCT_CUOTA_FEGA.Caption:='Porcentaje para solicitar la Cuota FEGA';
      PCT_CUOTA_FEGA.NoCompare:= True;
   SIT_EQUIV_FIRA :=CreaCampo('SIT_EQUIV_FIRA',ftString,tsNinguno,tsNinguno,True);
   With SIT_EQUIV_FIRA do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('CA');
   end;
      SIT_EQUIV_FIRA.Caption:='Situación de relación';
      SIT_EQUIV_FIRA.NoCompare:= True;
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

   FKeyFields.Add('CVE_MONEDA');
   FKeyFields.Add('CVE_OPERATIVA');
   FKeyFields.Add('PCT_GTIA_LIQ');
      
   TableName := 'CR_FIRA_EQUIV';
   UseQuery := True;
   HelpFile := 'IntMFiraEq.Hlp';
   ShowMenuReporte:=True;

   Moneda := TMoneda.Create(Self);
   Moneda.MasterSource:=Self;
   Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

   MFiraOpe := TMFiraOpe.Create(Self);
   MFiraOpe.MasterSource:=Self;
   MFiraOpe.FieldByName('CVE_OPERATIVA').MasterField:='CVE_OPERATIVA';
end;


Destructor TMFiraEq.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   If MFiraOpe <> Nil Then
      MFiraOpe.Free;
   Inherited;
end;

function TMFiraEq.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMFiraEq;
begin
   W:=TWMFiraEq.Create(Self);
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

Function TMFiraEq.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMFiraEq.it','I,S,F');
   Try
      if Active then begin
         T.Param(0,CVE_MONEDA.AsString);
         T.Param(1,CVE_OPERATIVA.AsString);
         T.Param(2,PCT_GTIA_LIQ.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
   finally
      T.Free;
   end;
end;

function TMFiraEq.Reporte:Boolean;
begin
   Result := False;
end;

procedure TMFiraEq.STPREL_OPERATIVAS(PECVE_OPERATIVA, PENVA_SITUACION: String);
var sptRelOpe  : TStoredProc;
begin
   try
     sptRelOpe := TStoredProc.Create(Self);
     with sptRelOpe do
     begin
        sptRelOpe.DatabaseName:= Apli.DatabaseName;
        sptRelOpe.SessionName:= Apli.SessionName;
        sptRelOpe.StoredProcName:= 'PKGCRREDESCTO.STPREL_OPERATIVAS';
        Params.Clear;
        Params.CreateParam(ftString,'PECVE_OPERATIVA',ptInput);
        Params.CreateParam(ftString,'PENVA_SITUACION',ptInput);
        Params.CreateParam(ftString,'PECVE_USUARIO',ptInput);
        Params.CreateParam(ftString,'PEF_MODIFICA',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        //
        Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('PECVE_OPERATIVA').AsString := PECVE_OPERATIVA;
        ParamByName('PENVA_SITUACION').AsString := PENVA_SITUACION;
        ParamByName('PECVE_USUARIO').AsString := Apli.Usuario;
        ParamByName('PEF_MODIFICA').AsDate := Apli.DameFechaEmpresa;
        ParamByName('PEBCOMMIT').AsString := 'V';
        ExecProc;
        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           ShowMessage( IntToStr(ParamByName('PSRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('PSTXRESULTADO').AsString );
           GenMsg('No se pudo actualizar la Operativa: ' + PECVE_OPERATIVA +
                  ParamByName('PSTXRESULTADO').AsString,Apli);
        end;
     end;
   finally
     sptRelOpe.Free;
   end;
end;


(***********************************************FORMA CR_FIRA_EQUIV********************)
(*                                                                              *)
(*  FORMA DE CR_FIRA_EQUIV                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FIRA_EQUIV********************)

procedure TwMFiraEq.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      CVE_MONEDA.Control          := edCVE_MONEDA;
      PCT_GTIA_LIQ.Control        := edPCT_GTIA_LIQ;
      CVE_OPERATIVA.Control       := edCVE_OPERATIVA; 
      PCT_GTIA_FEGA_EF.Control    := edPCT_GTIA_FEGA_EF;
      PCT_GTIA_FEGA_NO.Control    := edPCT_GTIA_FEGA_NO;
      PCT_CUOTA_FEGA.Control      := edPCT_CUOTA_FEGA;
      SIT_EQUIV_FIRA.Control      := rgSITUACION;
      F_ALTA.Control              := edF_ALTA;
      CVE_USU_ALTA.Control        := edCVE_USU_ALTA;
      F_MODIFICA.Control          := edF_MODIFICA;
      CVE_USU_MODIFICA.Control    := edCVE_USU_MODIF;
      InterForma1.MsgPanel        := PnlMsg;

      Moneda.Cve_Moneda.Control   := edCVE_MONEDA;
      Moneda.Desc_Moneda.Control  := edNOM_MONEDA;
      Moneda.GetParams(Objeto);

      MFiraOpe.CVE_OPERATIVA.Control := edCVE_OPERATIVA;
      MFiraOpe.DESC_OPERATIVA.Control := edNOM_CVE_OPERATIVA;
      MFiraOpe.GetParams(Objeto);
   End;
end;

procedure TwMFiraEq.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CVE_MONEDA.Control          := Nil;
      PCT_GTIA_LIQ.Control        := Nil;
      CVE_OPERATIVA.Control       := Nil;
      PCT_GTIA_FEGA_EF.Control    := Nil;
      PCT_GTIA_FEGA_NO.Control    := Nil;
      PCT_CUOTA_FEGA.Control      := Nil;
      SIT_EQUIV_FIRA.Control      := Nil;
      F_ALTA.Control              := Nil;
      CVE_USU_ALTA.Control        := Nil;
      F_MODIFICA.Control          := Nil;
      CVE_USU_MODIFICA.Control    := Nil;
      InterForma1.MsgPanel        := Nil;

      Moneda.Cve_Moneda.Control   := Nil;
      Moneda.Desc_Moneda.Control  := Nil;
      MFiraOpe.CVE_OPERATIVA.Control := Nil;
      MFiraOpe.DESC_OPERATIVA.Control := Nil;

   End;
end;

procedure TwMFiraEq.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMFiraEq.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
   End;
end;

procedure TwMFiraEq.edCVE_MONEDAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_MONEDA.GetFromControl;
      If Objeto.CVE_MONEDA.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe seleccionar un tipo de moneda';
      End;
      InterForma1.ValidaExit(edCVE_MONEDA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMFiraEq.InterForma1DespuesNuevo(Sender: TObject);
begin

   //HERJA - FILTRADO DE OPERATIVAS ACTIVAS
   Objeto.MFiraOpe.BuscaWhereString:=' SIT_OPERATIVA=''AC''';

   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   edCVE_MONEDA.SetFocus;
   rgSITUACION.ItemIndex:= 0;
end;

procedure TwMFiraEq.edPCT_GTIA_LIQExit(Sender: TObject);
Var  vlSalida    : boolean;
     vlMsg, sSQL : String;
     qyQuery     : TQuery;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_MONEDA.GetFromControl;
      Objeto.PCT_GTIA_LIQ.GetFromControl;
      If Objeto.PCT_GTIA_LIQ.AsFloat >= 0  Then Begin
         If InterForma1.IsNewData Then Begin
            sSQL:='SELECT * FROM CR_FIRA_EQUIV '+
                  ' WHERE CVE_MONEDA ='+ Objeto.CVE_MONEDA.AsSQL +
                  '   AND CVE_OPERATIVA ='+ Objeto.CVE_OPERATIVA.AsSQL +
                  '   AND PCT_GTIA_LIQ ='+ Objeto.PCT_GTIA_LIQ.AsSQL;
            qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            If qyQuery <> Nil Then Begin
               If Trim(qyQuery.FieldByName('CVE_OPERATIVA').AsString)= Objeto.CVE_OPERATIVA.AsString Then Begin
                  vlSalida   := False;
                  vlMsg := 'La equivalencia de cobertura porcentual ya existe';
               End;
               qyQuery.Free;
            End;
         End;
         If (Pos('.', Objeto.PCT_GTIA_LIQ.AsString) > 5) Then Begin
            vlSalida   := False;
            vlMsg := 'El % debe ser menor a 10000';
         End;
      End Else Begin
         vlSalida   := False;
         vlMsg := 'El porcentaje de garantía líquida no debe ser nulo';
      End;
      InterForma1.ValidaExit(edPCT_GTIA_LIQ,vlSalida,vlMsg,True);
   End;
end;

procedure TwMFiraEq.rgSITUACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSITUACION,True,CNULL,True);
end;

procedure TwMFiraEq.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   edPCT_GTIA_FEGA_EF.SetFocus;
end;

procedure TwMFiraEq.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   With Objeto Do Begin
      if IsNewData then Begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
            mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USU_ALTA.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
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

procedure TwMFiraEq.ilCVE_MONEDACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)and (InterForma1.IsNewData);
end;

procedure TwMFiraEq.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilCVE_MONEDA.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMFiraEq.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   If Objeto.Moneda.Busca Then Begin
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMFiraEq.edPCT_GTIA_FEGA_EFExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.PCT_GTIA_FEGA_EF.GetFromControl;
      If Objeto.PCT_GTIA_FEGA_EF.AsFloat >= 0 Then Begin
         If (Pos('.', Objeto.PCT_GTIA_FEGA_EF.AsString) > 5) Then Begin
            vlSalida   := False;
            vlMsg := 'El % debe ser menor a 10000';
         End;
      End;
      InterForma1.ValidaExit(edPCT_GTIA_FEGA_EF,vlSalida,vlMsg,True);
   End;
end;

procedure TwMFiraEq.edPCT_GTIA_FEGA_NOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.PCT_GTIA_FEGA_NO.GetFromControl;
      If Objeto.PCT_GTIA_FEGA_NO.AsFloat >= 0 Then Begin
         If (Pos('.', Objeto.PCT_GTIA_FEGA_NO.AsString) > 5) Then Begin
            vlSalida   := False;
            vlMsg := 'El % debe ser menor a 10000';
         End;
      End;
      InterForma1.ValidaExit(edPCT_GTIA_FEGA_NO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMFiraEq.edPCT_CUOTA_FEGAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.PCT_CUOTA_FEGA.GetFromControl;
      If Objeto.PCT_CUOTA_FEGA.AsFloat >= 0 Then Begin
         If (Pos('.', Objeto.PCT_CUOTA_FEGA.AsString) > 5) Then Begin
            vlSalida   := False;
            vlMsg := 'El % debe ser menor a 10000';
         End;
      End;
      InterForma1.ValidaExit(edPCT_CUOTA_FEGA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMFiraEq.edCVE_OPERATIVAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     sSQL: String;
     qyQuery: TQuery;     
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_OPERATIVA.GetFromControl;
      If Objeto.CVE_OPERATIVA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe seleccionar un tipo de Operativa';
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

procedure TwMFiraEq.btCVE_OPERATIVAClick(Sender: TObject);
begin
   Objeto.MFiraOpe.ShowAll := True;
   If Objeto.MFiraOpe.Busca Then Begin
      InterForma1.NextTab(edCVE_OPERATIVA);
   End;
end;

procedure TwMFiraEq.ilCVE_OPERATIVACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)and (InterForma1.IsNewData);
end;

procedure TwMFiraEq.ilCVE_OPERATIVAEjecuta(Sender: TObject);
begin
   If Objeto.MFiraOpe.FindKey([ilCVE_OPERATIVA.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_OPERATIVA);
   End;
end;

procedure TwMFiraEq.InterForma1DespuesAceptar(Sender: TObject);
begin
   ShowMessage('Se Actualizaran tambien las Equivalencias Relacionadas a la Operativa y el Catalogo de Operativas');
   Objeto.STPREL_OPERATIVAS(Objeto.CVE_OPERATIVA.AsString, Objeto.SIT_EQUIV_FIRA.AsString);
end;

end.
