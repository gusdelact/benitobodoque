// Sistema         : Clase de CR_ACR_REL_CTO
// Fecha de Inicio : 22/11/2004
// Función forma   : Clase de CR_ACR_REL_CTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMAutCred;

Interface

Uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, IntMAcredRel, InterEdit, IntCrCto, IntMon,
IntCtoHeader;

Type
 TMAutCred= Class;

  TwMAutCred=Class(TForm)
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
    edID_ACREDITADO: TEdit;
    lbAcreditado: TLabel;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIf: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIf: TLabel;
    edF_ALTA: TEdit;
    edF_MODIfICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIf: TEdit;
    rgSIT_AUTORIZACION: TRadioGroup;
    btID_ACREDITADO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    ilID_ACREDITADO: TInterLinkit;
    ilIDCONTRATO: TInterLinkit;
    edDESC_ID_CONTRATO: TEdit;
    btID_CONTRATO: TBitBtn;
    edID_CONTRATO: TEdit;
    lbAut: TLabel;
    edIMP_AUTORIZADO: TInterEdit;
    Label2: TLabel;
    edF_INICIO: TEdit;
    Label3: TLabel;
    edF_VENCIMIENTO: TEdit;
    Label4: TLabel;
    edMONEDA: TEdit;
    Label6: TLabel;
    edTIPO_CREDITO: TInterEdit;
    Label7: TLabel;
    Label8: TLabel;
    edSDO_INSOLUTO: TInterEdit;
    btCVE_MONEDA: TBitBtn;
    ilCVE_MONEDA: TInterLinkit;
    stpFecha: TInterDateTimePicker;
    stpFechaFin: TInterDateTimePicker;
    edFOL_CONTRATO: TEdit;
    Label1: TLabel;
    edF_PAGO: TEdit;
    stpFechaPago: TInterDateTimePicker;
    Procedure FormShow(SEnder : TObject);
    Procedure FormClose(SEnder : TObject; Var Action : TCloseAction);
    Procedure FormDestroy(SEnder : TObject);
    Procedure InterForma1AntesAceptar(SEnder: TObject; IsNewData: Boolean;
      Var Realizado: Boolean);
    Procedure InterForma1Buscar(SEnder: TObject);
    Procedure InterForma1DespuesNuevo(SEnder: TObject);
    Procedure rgSIT_AUTORIZACIONExit(SEnder: TObject);
    Procedure InterForma1DespuesModIficar(SEnder: TObject);
    Procedure edID_ACREDITADOExit(SEnder: TObject);
    Procedure ilID_ACREDITADOCapture(SEnder: TObject; Var Show: Boolean);
    Procedure ilIDCONTRATOCapture(SEnder: TObject; Var Show: Boolean);
    Procedure edID_CONTRATOExit(SEnder: TObject);
    Procedure btID_ACREDITADOClick(SEnder: TObject);
    Procedure ilID_ACREDITADOEjecuta(SEnder: TObject);
    Procedure btID_CONTRATOClick(SEnder: TObject);
    procedure ilIDCONTRATOEjecuta(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilCVE_MONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);
    procedure edMONEDAExit(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure edIMP_AUTORIZADOExit(Sender: TObject);
    procedure edF_INICIOExit(Sender: TObject);
    procedure edF_VENCIMIENTOExit(Sender: TObject);
    procedure edTIPO_CREDITOExit(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure edMONEDAKeyPress(Sender: TObject; var Key: Char);
    procedure edSDO_INSOLUTOExit(Sender: TObject);
    procedure edF_PAGOExit(Sender: TObject);

    Private
      bgInversiones: Boolean;
      bgIcre, bgCred, bgCCI: Boolean;
      Procedure CambiaControl(sInver : String);
      Procedure VerControl(sInver : String);
      Procedure AsignaContrato;
      Function AsignaFiltroCto: String;
    { Private declarations }
    Public
    { Public declarations }
      Objeto : TMAutCred;
    End;

 TMAutCred= Class(TInterFrame)
      Private
      Protected
      Public
        { Public declarations }
        ID_ACREDITADO       : TInterCampo;
        ID_CONTRATO         : TInterCampo;
        FOL_CONTRATO        : TInterCampo;
        TIPO_CREDITO        : TInterCampo;
        IMP_AUTORIZADO      : TInterCampo;
        CVE_MONEDA          : TInterCampo;
        SDO_INSOLUTO        : TInterCampo;
        F_INICIO            : TInterCampo;
        F_VENCIMIENTO       : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;
        SIT_AUTORIZACION    : TInterCampo;
        F_PAGO              : TInterCampo;

        ParamCre            : TParamCre;
        Acreditado          : TMAcredRel;
        Contrato            : TCtrlCto; //TCrCto;
        Moneda              : TMoneda;

        Function    InternalBusca : Boolean; override;
        Constructor Create( AOwner : TComponent ); override;
        Destructor  Destroy; override;
        Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    Reporte:Boolean; override;
      Published
      End;

Implementation
{$R *.DFM}

Constructor TMAutCred.Create( AOwner : TComponent );
Begin Inherited;
   ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
      ID_ACREDITADO.Caption:='Acreditado';
      ID_ACREDITADO.NoCompare:= False;
   ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
      ID_CONTRATO.Caption:='Contrato';
      ID_CONTRATO.NoCompare:= False;
   FOL_CONTRATO :=CreaCampo('FOL_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
      FOL_CONTRATO.Caption:='Folio de Contrato';
      FOL_CONTRATO.NoCompare:= False;
   TIPO_CREDITO :=CreaCampo('TIPO_CREDITO',ftString,tsNinguno,tsNinguno,True);
      TIPO_CREDITO.Caption:='Tipo de acreditado';
      TIPO_CREDITO.NoCompare:= False;
   IMP_AUTORIZADO :=CreaCampo('IMP_AUTORIZADO',ftFloat,tsNinguno,tsNinguno,True);
      IMP_AUTORIZADO.Caption:='Importe autorizado';
      IMP_AUTORIZADO.NoCompare:= False;
   SDO_INSOLUTO :=CreaCampo('SDO_INSOLUTO',ftFloat,tsNinguno,tsNinguno,True);
      SDO_INSOLUTO.Caption:='Saldo Insoluto';
      SDO_INSOLUTO.NoCompare:= False;
   CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
      CVE_MONEDA.Caption:='Moneda';
      CVE_MONEDA.NoCompare:= False;
   F_INICIO :=CreaCampo('F_INICIO',ftDate,tsNinguno,tsNinguno,True);
      F_INICIO.Caption:='Fecha de Inicio';
      F_INICIO.NoCompare:= True;
   F_VENCIMIENTO :=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,True);
      F_VENCIMIENTO.Caption:='Fecha de Vencimiento';
      F_VENCIMIENTO.NoCompare:= True;
   F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha de Alta';
      F_ALTA.NoCompare:= True;
   CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      CVE_USU_ALTA.NoCompare:= True;
   F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
      F_MODIFICA.Caption:='Fecha ModIfica';
      F_MODIFICA.NoCompare:= True;
   CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption:='Clave de Usu ModIfica';
      CVE_USU_MODIFICA.NoCompare:= True;
   SIT_AUTORIZACION :=CreaCampo('SIT_AUTORIZACION',ftString,tsNinguno,tsNinguno,True);
   With SIT_AUTORIZACION do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('CA');
   End;
      SIT_AUTORIZACION.Caption:='Situación de Autorización';
      SIT_AUTORIZACION.NoCompare:= True;
   F_PAGO :=CreaCampo('F_PAGO',ftDate,tsNinguno,tsNinguno,True);
      F_PAGO.Caption:='Fecha Pago';
      F_PAGO.NoCompare:= True;

   FKeyFields.Add('ID_ACREDITADO');
   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('FOL_CONTRATO');
   TableName := 'CR_ACR_REL_CTO';
   UseQuery := True;
   HelpFile := 'IntMAutCred.Hlp';
   ShowMenuReporte:=True;

   {$WARNINGS OFF}
   Acreditado := TMAcredRel.Create(Self);
   {$WARNINGS ON}   
   Acreditado.MasterSource:=Self;
   Acreditado.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';

   {$WARNINGS OFF}
   Contrato := TCtrlCto.Create(Self);
   {$WARNINGS ON}
   Contrato.MasterSource:=Self;
   Contrato.ContratoExiste:= True;

   {$WARNINGS OFF}
   Moneda := TMoneda.Create(Self);
   {$WARNINGS ON}   
   Moneda.MasterSource:=Self;
   Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';
End;

Destructor TMAutCred.Destroy;
Begin
   If Acreditado <> Nil Then
      Acreditado.Free;
   If Contrato <> Nil Then
      Contrato.Free;
   If Moneda <> Nil Then
      Moneda.Free;
   Inherited;
End;

Function TMAutCred.ShowWindow(FormaTipo:TFormaTipo):Integer;
Var W : TWMAutCred;
Begin
   W:=TWMAutCred.Create(Self);
   Try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   Finally
      W.Free;
   End;
End;

Function TMAutCred.InternalBusca:Boolean;
Var T : TInterFindit;
Begin
   InternalBusca := False;
   T := CreaBuscador('IcraUra.it','F,F,F');
   Try
      If Active Then Begin
         T.Param(0,ID_ACREDITADO.AsString);
         T.Param(1,ID_CONTRATO.AsString);
         T.Param(2,FOL_CONTRATO.AsString);
      End;
      If T.Execute Then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
   Finally
      T.Free;
   End;
End;

Function TMAutCred.Reporte:Boolean;
Begin
   Result := False;
End;


(***********************************************FORMA CR_ACR_REL_CTO********************)
(*                                                                              *)
(*  FORMA DE CR_ACR_REL_CTO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_ACR_REL_CTO********************)

Procedure TwMAutCred.FormShow(SEnder: TObject);
Begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_ACREDITADO.Control    := edID_ACREDITADO;
      ID_CONTRATO.Control      := edID_CONTRATO;
      FOL_CONTRATO.Control     := edFOL_CONTRATO;
      TIPO_CREDITO.Control     := edTIPO_CREDITO;
      IMP_AUTORIZADO.Control   := edIMP_AUTORIZADO;
      SDO_INSOLUTO.Control     := edSDO_INSOLUTO;
      CVE_MONEDA.Control       := edMONEDA;
      F_INICIO.Control         := edF_INICIO;
      F_VENCIMIENTO.Control    := edF_VENCIMIENTO;
      F_ALTA.Control           := edF_ALTA;
      CVE_USU_ALTA.Control     := edCVE_USU_ALTA;
      F_MODIFICA.Control       := edF_MODIFICA;
      CVE_USU_MODIFICA.Control := edCVE_USU_MODIF;
      SIT_AUTORIZACION.Control := rgSIT_AUTORIZACION;
      F_PAGO.Control           := edF_PAGO;
      InterForma1.MsgPanel     := PnlMsg;
   End;
   Objeto.Acreditado.ID_ACREDITADO.Control := edID_ACREDITADO;
   Objeto.Acreditado.NOMBRE_ACRED.Control := edNOM_ACREDITADO;
   Objeto.Acreditado.GetParams(Objeto);
   Objeto.Moneda.Cve_Moneda.Control := edMONEDA;
   Objeto.Moneda.GetParams(Objeto);
   bgInversiones:= False;
End;

Procedure TwMAutCred.FormDestroy(SEnder: TObject);
Begin
   With Objeto Do Begin
      ID_ACREDITADO.Control    := Nil;
      ID_CONTRATO.Control      := Nil;
      FOL_CONTRATO.Control     := Nil;
      TIPO_CREDITO.Control     := Nil;
      IMP_AUTORIZADO.Control   := Nil;
      SDO_INSOLUTO.Control     := Nil;
      CVE_MONEDA.Control       := Nil;
      F_INICIO.Control         := Nil;
      F_VENCIMIENTO.Control    := Nil;
      F_ALTA.Control           := Nil;
      CVE_USU_ALTA.Control     := Nil;
      F_MODIFICA.Control       := Nil;
      CVE_USU_MODIFICA.Control := Nil;
      SIT_AUTORIZACION.Control := Nil;
      F_PAGO.Control           := Nil;
      InterForma1.MsgPanel     := Nil;
   End;
   Objeto.Acreditado.ID_ACREDITADO.Control := Nil;
   Objeto.Acreditado.NOMBRE_ACRED.Control := Nil;
   Objeto.Moneda.Cve_Moneda.Control := nil;
End;

Procedure TwMAutCred.FormClose(SEnder: TObject; Var Action: TCloseAction);
Begin Action := caFree;
End;

Procedure TwMAutCred.InterForma1AntesAceptar(SEnder: TObject;
  IsNewData: Boolean; Var Realizado: Boolean);
Var
   sSQL: String;
   qyQuery: TQuery;
Begin
   Objeto.ID_ACREDITADO.GetFromControl;
   Objeto.ID_CONTRATO.GetFromControl;
   Objeto.FOL_CONTRATO.GetFromControl;
   If bgInversiones Then Begin
      If InterForma1.IsNewData Then Begin
         sSQL:= 'SELECT Max(NVL(FOL_CONTRATO,0))+1 AS FOLIO  FROM CR_ACR_REL_CTO '+
                ' WHERE ID_ACREDITADO = '+ Objeto.ID_ACREDITADO.AsString +
                '   AND ID_CONTRATO ='+ Objeto.ID_CONTRATO.AsString;
         qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
         If qyQuery <> Nil Then Begin
            If qyQuery.FieldByName('FOLIO').AsInteger >= 1 Then Begin
               Realizado:= False;
               ShowMessage('El Acreditado ya existe relacionado con la Cuenta Contable');
            End Else Begin
               Realizado:= True;
               If qyQuery.FieldByName('FOLIO').AsInteger = 0  Then
                  Objeto.FOL_CONTRATO.AsInteger:= 1
               Else
                  Objeto.FOL_CONTRATO.AsInteger:= qyQuery.FieldByName('FOLIO').AsInteger;
            End;
            qyQuery.Free;
         End Else Begin
            Realizado:= True;
            Objeto.FOL_CONTRATO.AsInteger:= 1;
         End;
      End;
   End;
   If Realizado Then Begin
      With Objeto Do Begin
         If IsNewData Then Begin
            If MessageDlg('¿Desea almacenar los datos capturados?',
                 mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
               CVE_USU_ALTA.AsString := DameUsuario;
               F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
               Realizado := True;
            End else
               Realizado := False;
         End else Begin
            If MessageDlg('¿Desea guardar los datos modIficados?',
                 mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
               CVE_USU_MODIFICA.AsString := DameUsuario;
               F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
               Realizado := True;
            End else
               Realizado := False;
         End
      End;
   End;
End;

Procedure TwMAutCred.InterForma1Buscar(SEnder: TObject);
Begin
   With Objeto Do Begin
      InternalBusca;
      VerControl(Objeto.Acreditado.B_APLICA_INVERS.AsString);
   End;
End;

Procedure TwMAutCred.InterForma1DespuesNuevo(SEnder: TObject);
Begin
   edSDO_INSOLUTO.Text:= '0.00';
   edDESC_ID_CONTRATO.Text:= '';
   CambiaControl('F');
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_AUTORIZACION.ItemIndex:= 0;
   edID_ACREDITADO.SetFocus;
End;

Procedure TwMAutCred.rgSIT_AUTORIZACIONExit(SEnder: TObject);
Begin
   InterForma1.ValidaExit(rgSIT_AUTORIZACION,True,CNULL,True);
End;

Procedure TwMAutCred.InterForma1DespuesModIficar(SEnder: TObject);
Begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   CambiaControl(Objeto.Acreditado.B_APLICA_INVERS.AsString);
   AsignaContrato;   
End;

Procedure TwMAutCred.edID_ACREDITADOExit(SEnder: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_ACREDITADO.GetFromControl;
      If Objeto.ID_ACREDITADO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del Acreditado';
      End;
      InterForma1.ValidaExit(edID_ACREDITADO,vlSalida,vlMsg,True);
   End;
End;

Procedure TwMAutCred.ilID_ACREDITADOCapture(SEnder: TObject; Var Show: Boolean);
Begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
End;

Procedure TwMAutCred.ilIDCONTRATOCapture(SEnder: TObject; Var Show: Boolean);
Begin
   Show:=(InterForma1.CanEdit) Or (InterForma1.IsNewData)
End;

Procedure TwMAutCred.edID_CONTRATOExit(SEnder: TObject);
Var  vlSalida  :  boolean;
     vlMsg, sSQL :  String;
     qyQuery: TQuery;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_CONTRATO.GetFromControl;
      If Objeto.ID_CONTRATO.AsString = CNULL Then Begin
         vlSalida   := False;
         If Objeto.Acreditado.B_APLICA_INVERS.AsString ='F' Then
            vlMsg := 'Indique el número de Autorización'
         Else
            vlMsg := 'Indique el número de Cuenta Contable';
      End Else Begin
         If InterForma1.IsNewData Then Begin
            sSQL:= 'SELECT * FROM CR_ACR_REL_CTO '+
                   ' WHERE ID_ACREDITADO ='+ Objeto.ID_ACREDITADO.AsString +
                   '   AND ID_CONTRATO ='+ Objeto.ID_CONTRATO.AsString;
            qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            If qyQuery <> Nil Then Begin
               If Objeto.ID_CONTRATO.AsInteger = qyQuery.FieldByName('ID_CONTRATO').AsInteger Then Begin
                  //If Objeto.Acreditado.B_APLICA_INVERS.AsString ='F' Then Begin
                     vlSalida   := False;
                     vlMsg := 'La relación de Acreditado con Autorizacion ya existe';
                  //End;
               End;
               qyQuery.Free;
            End;
         End;
      End;
      InterForma1.ValidaExit(edID_CONTRATO,vlSalida,vlMsg,True);
   End;
End;

Procedure TwMAutCred.btID_ACREDITADOClick(SEnder: TObject);
Begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
      If Objeto.Acreditado.B_APLICA_INVERS.AsString ='V' Then
         bgInversiones:= True
      Else
         bgInversiones:= False;
      CambiaControl(Objeto.Acreditado.B_APLICA_INVERS.AsString);
      InterForma1.NextTab(btID_ACREDITADO);
   End;

End;

Procedure TwMAutCred.ilID_ACREDITADOEjecuta(SEnder: TObject);
Begin
   If Objeto.Acreditado.FindKey([ilID_ACREDITADO.Buffer]) Then Begin
      If Objeto.Acreditado.B_APLICA_INVERS.AsString ='V' Then
         bgInversiones:= True
      Else
         bgInversiones:= False;
      CambiaControl(Objeto.Acreditado.B_APLICA_INVERS.AsString);
      InterForma1.NextTab(edID_ACREDITADO);
   End;
End;

Procedure TwMAutCred.btID_CONTRATOClick(SEnder: TObject);
Begin
   Objeto.Contrato.BuscaWhereString:= 'CONTRATO.ID_CONTRATO IN '+ AsignaFiltroCto;
   Objeto.Contrato.FilterString := Objeto.Contrato.BuscaWhereString;
   Objeto.Contrato.ShowAll := True;
   If Objeto.Contrato.Busca Then Begin
      Objeto.ID_CONTRATO.AsString:= Objeto.Contrato.ID_CONTRATO.AsString;
      edDESC_ID_CONTRATO.Text:= Objeto.Contrato.Desc_Producto.AsString;
      AsignaContrato;
      InterForma1.NextTab(edID_CONTRATO);
   End;
End;

procedure TwMAutCred.ilIDCONTRATOEjecuta(Sender: TObject);
begin
   Objeto.Contrato.BuscaWhereString:= 'CONTRATO.ID_CONTRATO IN '+ AsignaFiltroCto;
   Objeto.Contrato.FilterString := Objeto.Contrato.BuscaWhereString;              
   If Objeto.Acreditado.B_APLICA_INVERS.AsString ='F' Then Begin
      If Objeto.Contrato.FindKey([ilIDCONTRATO.Buffer]) Then Begin
         Objeto.ID_CONTRATO.AsString:= Objeto.Contrato.ID_CONTRATO.AsString;
         edDESC_ID_CONTRATO.Text:= Objeto.Contrato.Desc_Producto.AsString;
         AsignaContrato;
         InterForma1.NextTab(edID_CONTRATO);
      End;
   End Else Begin
      edID_CONTRATO.text:= ilIDCONTRATO.ShowBuffer;
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

Procedure TwMAutCred.CambiaControl(sInver : String);
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      If sInver ='V' Then Begin
         Self.Caption:= 'Catálogo de Autorización de Créditos Relacionados(inversiones)';
         lbAcreditado.Caption:= 'Cliente';
         lbAut.Caption:= 'Cta. Contable';
         edID_CONTRATO.Tag:= 0;
         btID_CONTRATO.Visible:= False;
         edDESC_ID_CONTRATO.Visible:= False;
         edIMP_AUTORIZADO.Tag:= 18;
         edIMP_AUTORIZADO.TabStop:= True;
         edF_INICIO.Tag:= 18;
         edF_INICIO.TabStop:= True;
         stpFecha.Tag:=18;
         edF_VENCIMIENTO.Tag:= 18;
         edF_VENCIMIENTO.TabStop:= True;
         stpFechaFin.Tag:=18;
         edMONEDA.Tag:= 530;
         edMONEDA.TabStop:= True;
         btCVE_MONEDA.Visible:= True;
//         edSDO_INSOLUTO.Tag:=18;
//         edSDO_INSOLUTO.TabStop:= True;
      End Else Begin
         Self.Caption:= 'Catálogo de Autorización de Créditos Relacionados';
         lbAcreditado.Caption:= 'Acreditado';
         lbAut.Caption:= 'Autorización';
         edID_CONTRATO.Tag:= 562;
         btID_CONTRATO.Visible:= True;
         edDESC_ID_CONTRATO.Visible:= True;
         edIMP_AUTORIZADO.Tag:= 0;
         edIMP_AUTORIZADO.TabStop:= False;
         edF_INICIO.Tag:= 0;
         edF_INICIO.TabStop:= False;
         stpFecha.Tag:= 17;
         edF_VENCIMIENTO.Tag:= 0;
         edF_VENCIMIENTO.TabStop:= False;
         stpFechaFin.Tag:=17;
         edMONEDA.Tag:= 0;
         edMONEDA.TabStop:= False;
         btCVE_MONEDA.Visible:= False;
//         edSDO_INSOLUTO.Tag:=0;
//         edSDO_INSOLUTO.TabStop:= False;
      End;
      InterForma1.InitShow;
   End;
End;
procedure TwMAutCred.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   If Objeto.Moneda.Busca Then Begin
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TwMAutCred.ilCVE_MONEDACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TwMAutCred.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilCVE_MONEDA.Buffer]) Then Begin
      InterForma1.NextTab(edMONEDA);
   End;
end;

procedure TwMAutCred.edMONEDAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_MONEDA.GetFromControl;
      If Objeto.CVE_MONEDA.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la moneda';
      End;
      InterForma1.ValidaExit(edMONEDA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMAutCred.InterForma1DespuesAceptar(Sender: TObject);
begin
   edID_CONTRATO.Tag:= 562;
   btID_CONTRATO.Visible:= True;
   edDESC_ID_CONTRATO.Visible:= True;
   edIMP_AUTORIZADO.Tag:= 0;
   edIMP_AUTORIZADO.TabStop:= False;
   edF_INICIO.Tag:= 0;
   edF_INICIO.TabStop:= False;
   stpFecha.Tag:= 18;
   edF_VENCIMIENTO.Tag:= 0;
   edF_VENCIMIENTO.TabStop:= False;
   stpFechaFin.Tag:=18;
   edMONEDA.Tag:= 0;
   edMONEDA.TabStop:= False;
   btCVE_MONEDA.Visible:= False;
//   edSDO_INSOLUTO.Tag:=0;
//   edSDO_INSOLUTO.TabStop:= False;

   InterForma1.InitShow;
   VerControl(Objeto.Acreditado.B_APLICA_INVERS.AsString);
end;

Procedure TwMAutCred.VerControl(sInver : String);
Var vlsFiltro: String;
Begin
   If sInver ='V' Then Begin
      lbAcreditado.Caption:= 'Cliente';
      lbAut.Caption:= 'Cta. Contable';
      btID_CONTRATO.Visible:= False;
      edDESC_ID_CONTRATO.Visible:= False;
      btCVE_MONEDA.Visible:= True;
   End Else Begin
      edSDO_INSOLUTO.Text:= '0.00';
      edDESC_ID_CONTRATO.Text:= '';
      vlsFiltro:= AsignaFiltroCto;
      Objeto.Contrato.FindKey([Objeto.ID_CONTRATO.AsString,Objeto.FOL_CONTRATO.AsString]);
      AsignaContrato;
      lbAcreditado.Caption:= 'Acreditado';
      lbAut.Caption:= 'Autorización';
      btID_CONTRATO.Visible:= True;
      edDESC_ID_CONTRATO.Visible:= True;
      btCVE_MONEDA.Visible:= False;
   End;
   InterForma1.InitShow;
End;

Procedure TwMAutCred.AsignaContrato;
Var
   sSQL: String; qyQuery: TQuery; bUnion, bContinua: Boolean;
   vgTCambioMes, vgTCambioUDIS, vgSaldo : Double;
Begin
   If Objeto.Contrato.Active Then Begin
      bUnion:= False;
      bContinua := True;
//      vlAnoMes := FormatDateTime('YYYYMM',Objeto.Apli.DameFechaEmpresa);
      vgTCambioMes := ObtTipoCambio( Objeto.Apli.DameFechaEmpresaDia('D000'),
                                     IntToStr ( C_DLLS ) ,
                                     Objeto.APli.DataBaseName, Objeto.APli.SessionName);
      vgTCambioUDIS := ObtTipoCambio( Objeto.APli.DameFechaEmpresaDia('D000'),
                                      IntToStr ( 800 ) ,
                                      Objeto.APli.DataBaseName, Objeto.APli.SessionName);
      sSQL:= 'SELECT * FROM ( ';

      IF bgCCI THEN  Begin
//         bContinua := False;
         sSQL:= sSQL +
                '   SELECT ''CCI'' ORIGEN, '+coCRLF+
                '          CCTO.ID_CONTRATO     ,       CCTO.FOL_CONTRATO       ,       CTO.ID_TITULAR,'+coCRLF+
                '          SDO.IMP_AUTORIZADO  ,        TO_DATE(SDO.F_INICIO,''YYYY/MM/DD'') F_INICIO ,'+coCRLF+
                '          TO_DATE(SDO.F_VTO,''YYYY/MM/DD'') F_VENCIMIENTO, TO_DATE(SDO.F_INICIO,''YYYY/MM/DD'') F_PAGO, '+coCRLF+
                '          CTO.CVE_MONEDA      ,       SDO.IMPORTE             ,       P.NOMBRE '+coCRLF+
                '     FROM CR_CONTRATO CCTO, CONTRATO CTO,'+coCRLF+
                '          ( SELECT C.ID_CONTRATO,       1 FOL_CONTRATO,       SUM(NVL(T.IMP_SALDO,0))IMPORTE,'+coCRLF+
                '                   MIN(C.F_VALOR_CRED) F_INICIO,     MAX(C.F_VENCIMIENTO) F_VTO,'+coCRLF+
                '                   C.IMP_CREDITO IMP_AUTORIZADO ' +coCRLF+
                '            FROM RPT_CRE_CREDITO C, ' +coCRLF+
                '          RPT_REG_TIPSCPTO R, ' +coCRLF+
                '          ( SELECT ID_EMPRESA, MIN(IMP_SALDO)IMP_SALDO,REF_EXTERNA, TIPO_SALDO ' +coCRLF+
                '            FROM RPT_REG_TRAN_EXT ' +coCRLF+
                '            WHERE CVE_CONCEPTO = ''CARTERA'' ' +coCRLF+
                '            GROUP BY ID_EMPRESA, REF_EXTERNA, TIPO_SALDO ' +coCRLF+
                '          ) T ' +coCRLF+
                // < Inicia Modificación SATV4766 el 10 Ene 2006 >
                // '            WHERE C.CVE_CAT_MINIMO = ''730000000000'' ' +
                '            WHERE C.CVE_CAT_MINIMO IN ( SELECT TO_CHAR(IGC.VALOR) AS CVE_CAT_MINIMO'+coCRLF+
                '                                        FROM INF_GRUPO_CLAVE IGC,'+coCRLF+
                '                                             ( SELECT ID_GRUPO FROM INF_GRUPO'+coCRLF+
                '                                               WHERE GRUPO = ''CVE_CARTAS_CREDITO'' ) IG'+coCRLF+
                '                                        WHERE IG.ID_GRUPO = IGC.ID_GRUPO'+coCRLF+
                '                                          AND IGC.CVE_CLAVE BETWEEN '+FormatDateTime('YYYY', IncMonth(Objeto.APli.DameFechaEmpresaDia('D000'), -12))+coCRLF+
                '                                                            AND '+FormatDateTime('YYYY',Objeto.APli.DameFechaEmpresaDia('D000'))+coCRLF+
                '                                       )'+coCRLF+
                // < Termina Modificación SATV4766 el 10 Ene 2006 >
                '              AND R.SUB_CVE_CONCEPTO = ''NOAPLICA'' ' +coCRLF+
                '              AND R.CVE_TIP_CARGA  = ''CARCRE'' ' +coCRLF+
                '              AND T.ID_EMPRESA     = C.ID_EMPRESA ' +coCRLF+
                '              AND T.REF_EXTERNA    = C.ID_CREDITO ' +coCRLF+
                '              AND R.TIPO_SALDO     = T.TIPO_SALDO ' +coCRLF+
                '              AND R.ID_EMPRESA     = T.ID_EMPRESA ' +coCRLF+
                '              AND R.CVE_CONCEPTO_GPO = C.CVE_CAT_MINIMO ' +coCRLF+
                '            GROUP BY C.ID_CONTRATO, C.IMP_CREDITO, T.ID_EMPRESA,ANO_MES_LIQ ' +coCRLF+
                '          )SDO, PERSONA P'+coCRLF+
                '    WHERE CCTO.ID_CONTRATO  = CTO.ID_CONTRATO '+coCRLF+
                '      AND CCTO.ID_CONTRATO  = SDO.ID_CONTRATO '+coCRLF+
                '      AND CCTO.FOL_CONTRATO = SDO.FOL_CONTRATO '+coCRLF+
                '      AND CTO.ID_TITULAR    = P.ID_PERSONA ';
             bUnion:= True;
      End;


//      IF  bContinua THEN BEGIN
          If bgIcre Then Begin
             If bUnion Then
                sSQL:= sSQL +' UNION All ';

             sSQL:= sSQL +
                    '   SELECT ''ICRE'' ORIGEN, '+
                    '          CCTO.ID_CONTRATO     ,  CCTO.FOL_CONTRATO       ,       CTO.ID_TITULAR,'+
                    '          CCTO.IMP_AUTORIZADO  ,  SDO.F_INICIO            ,                      '+
                    '          SDO.F_VENCIMIENTO    ,  DECODE(SDO.F_PAGO, NULL, SDO.F_INICIO, F_PAGO) F_PAGO, '+
                    '          CTO.CVE_MONEDA       ,  ( SDO.IMP_CAPITAL + SDO.IMP_INTERES ) IMPORTE , '+
                    '          P.NOMBRE      '+
                    '     FROM CR_CONTRATO CCTO, CONTRATO CTO,'+
                    '          ( SELECT CR.ID_CONTRATO,                CR.FOL_CONTRATO, '+
                    '                   SUM( CP.IMP_CAPITAL) IMP_CAPITAL, SUM(CI.IMP_INTERES) IMP_INTERES,'+
                    '                   MIN(CR.F_INICIO)F_INICIO, MAX(CR.F_VENCIMIENTO) F_VENCIMIENTO, '+
                    '                   MAX(CR.F_LIQUIDACION) F_PAGO '+
                    '            FROM CR_CREDITO CR, '+
                    '                 ( SELECT SUM(IMP_CAPITAL) IMP_CAPITAL, ID_CREDITO'+
                    '                   FROM CR_CAPITAL '+
                    '                   GROUP BY ID_CREDITO'+
                    '                 )CP,'+
                    '                 ( SELECT SUM(IMP_INTERES) IMP_INTERES, ID_CREDITO'+
                    '                   FROM CR_INTERES '+
                    '                   GROUP BY ID_CREDITO'+
                    '                   )CI'+
                    '            WHERE ID_CONTRATO ='+ Objeto.ID_CONTRATO.AsString +
                    '              AND CP.ID_CREDITO = CR.ID_CREDITO'+
                    '              AND CI.ID_CREDITO = CR.ID_CREDITO'+
                    '            GROUP BY ID_CONTRATO, FOL_CONTRATO )SDO, PERSONA P'+
                    '    WHERE CCTO.ID_CONTRATO  = CTO.ID_CONTRATO '+
                    '      AND CCTO.ID_CONTRATO  = SDO.ID_CONTRATO '+
                    '      AND CCTO.FOL_CONTRATO = SDO.FOL_CONTRATO '+
                    '      AND CTO.ID_TITULAR    = P.ID_PERSONA ';
             bUnion:= True;
          End;

          If bgCred Then Begin

             If bUnion Then
                sSQL:= sSQL +' UNION All ';

             sSQL:= sSQL +
                 ' SELECT ''CRED'' ORIGEN, '+
                 '       CCTO.ID_CONTRATO, '+
                 '       1 FOL_CONTRATO, '+
                 '       CTO.ID_TITULAR, '+
                 '       CCTO.IMP_AUTORIZADO, '+
                 '       F_INICIO, '+
                 '       F_VENCIMIENTO, DECODE(F_PAGO,NULL,F_INICIO, F_PAGO) F_PAGO, '+
                 '       CTO.CVE_MONEDA, B.IMPORTE, P.NOMBRE'+
                 '  FROM '+
                        '( '+
                        ' SELECT ID_CONTRATO, FOL_CONTRATO, SUM(NVL(IMPORTE,0))IMPORTE,'+
                        '        MAX(F_LIQ_BNC) F_PAGO, SUM(IMP_AUTORIZADO) IMP_AUTORIZADO, '+
                        '        MIN(A.F_VALOR_CRED) F_INICIO , MAX(A.F_VENCIMIENTO) F_VENCIMIENTO'+
                        '  FROM '+
                        '    ( '+
                        '    SELECT C.ID_CONTRATO, 1 FOL_CONTRATO, (CP.IMP_CAPITAL + CI.IMP_INTERES ) IMPORTE, '+
                        '           CST.F_TRASPASO_ICRE, C.SIT_CREDITO,'+
                        '           C.F_VALOR_CRED, C.DIAS_PLAZO, C.F_LIQ_BNC, C.IMP_CREDITO IMP_AUTORIZADO, '+
                        '           ( C.F_VALOR_CRED + C.DIAS_PLAZO ) F_VENCIMIENTO '+
                        '      FROM CRE_CREDITO C, CRE_CONTRATO CTO, CRE_SUB_TIP_BCO CST, '+
                        '           ( SELECT SUM(IMP_CAPITAL) IMP_CAPITAL, ID_CREDITO '+
                        '             FROM CRE_CAPITAL  '+
                        '             GROUP BY ID_CREDITO) CP, '+
                        '           ( SELECT SUM(IMP_INTERES_PER) IMP_INTERES, ID_CREDITO '+
                        '             FROM CRE_INTERES  '+
                        '             GROUP BY ID_CREDITO) CI '+
                        '     WHERE C.ID_CONTRATO = CTO.ID_CONTRATO '+
                        '       AND CST.CVE_SUB_TIP_BCO = CTO.CVE_SUB_TIP_BCO '+
                        '       AND CP.ID_CREDITO = C.ID_CREDITO '+
                        '       AND CI.ID_CREDITO = C.ID_CREDITO '+
                        '    ) A '+
                        ' WHERE (A.F_TRASPASO_ICRE IS NOT NULL '+
                        '   AND A.SIT_CREDITO NOT IN ( ''TA'' )) '+
                        '    OR A.F_TRASPASO_ICRE IS NULL '+
                        ' GROUP BY ID_CONTRATO, FOL_CONTRATO '+
                        ')B, CONTRATO CTO, CRE_CONTRATO CCTO, PERSONA P '+
                 ' WHERE B.ID_CONTRATO   = CTO.ID_CONTRATO '+
                 '  AND CTO.ID_CONTRATO = CCTO.ID_CONTRATO '+
                 '  AND CTO.ID_TITULAR  = P.ID_PERSONA '+
                 '  AND CTO.ID_CONTRATO = '+ Objeto.ID_CONTRATO.AsString ;
          End;
//      END;

      sSQL:= sSQL +
             ')TABLA WHERE TABLA.ID_CONTRATO ='+ Objeto.ID_CONTRATO.AsString;
      If Objeto.FOL_CONTRATO.AsString <> '' Then
         sSQL:= sSQL + '   AND TABLA.FOL_CONTRATO ='+ Objeto.FOL_CONTRATO.AsString
      Else
         sSQL:= sSQL + '   AND TABLA.FOL_CONTRATO = 1 ';

      qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      If qyQuery<>Nil Then Begin
         If qyQuery.FieldByName('ID_CONTRATO').AsInteger = Objeto.ID_CONTRATO.AsInteger Then Begin
            If InterForma1.IsNewData Then Begin
               edIMP_AUTORIZADO.Text:= FormatFloat('###,###,###,###,##0.00', qyQuery.FieldByName('IMP_AUTORIZADO').AsFloat);
               edF_INICIO.Text:=FormatDateTime('dd/mm/yyyy', qyQuery.FieldByName('F_INICIO').AsDateTime);
               edF_VENCIMIENTO.Text:=FormatDateTime('dd/mm/yyyy', qyQuery.FieldByName('F_VENCIMIENTO').AsDateTime);
               IF qyQuery.FieldByName('F_PAGO').AsDateTime = qyQuery.FieldByName('F_INICIO').AsDateTime THEN
                  edF_PAGO.Text:=''
               ELSE edF_PAGO.Text:=FormatDateTime('dd/mm/yyyy', qyQuery.FieldByName('F_PAGO').AsDateTime);

               Objeto.Moneda.FindKey([qyQuery.FieldByName('CVE_MONEDA').AsString]);
               edFOL_CONTRATO.Text:= qyQuery.FieldByName('FOL_CONTRATO').AsString;
            End;
            vgSaldo:= qyQuery.FieldByName('IMPORTE').AsFloat;
            IF bContinua THEN BEGIN
              If Objeto.Moneda.CVE_MONEDA.AsInteger = 840 Then
                 vgSaldo:= qyQuery.FieldByName('IMPORTE').AsFloat * vgTCambioMes
              Else If Objeto.Moneda.CVE_MONEDA.AsInteger = 800 Then
                 vgSaldo:= qyQuery.FieldByName('IMPORTE').AsFloat * vgTCambioUDIS
            END;
            edSDO_INSOLUTO.Text:= FormatFloat('###,###,###,###,##0.00', vgSaldo);
            edDESC_ID_CONTRATO.Text:= Objeto.Contrato.Desc_Producto.AsString;
         End;
         qyQuery.Free;
      End;
   End;
End;
procedure TwMAutCred.edIMP_AUTORIZADOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.IMP_AUTORIZADO.GetFromControl;
      If Objeto.Acreditado.B_APLICA_INVERS.AsString ='F' Then Begin
         If Objeto.IMP_AUTORIZADO.AsString = CNULL Then Begin
            vlSalida   := False;
            vlMsg := 'Indique el Monto Autorizado';
         End;
      End;
      InterForma1.ValidaExit(edIMP_AUTORIZADO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMAutCred.edF_INICIOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.F_INICIO.GetFromControl;
      If Objeto.F_INICIO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la Fecha de inicio del crédito';
      End;
      InterForma1.ValidaExit(edF_INICIO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMAutCred.edF_VENCIMIENTOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.F_VENCIMIENTO.GetFromControl;
      If Objeto.Acreditado.B_APLICA_INVERS.AsString ='F' Then Begin
         If Objeto.F_VENCIMIENTO.AsString = CNULL Then Begin
            vlSalida   := False;
            vlMsg := 'Indique la Fecha de vencimiento del crédito';
         End;
      End;
      InterForma1.ValidaExit(edF_VENCIMIENTO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMAutCred.edTIPO_CREDITOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.TIPO_CREDITO.GetFromControl;
      If Objeto.TIPO_CREDITO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el tipo de crédito';
      End;
      InterForma1.ValidaExit(edTIPO_CREDITO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMAutCred.InterForma1DespuesEliminar(Sender: TObject);
begin
   edDESC_ID_CONTRATO.Text:='';
   edSDO_INSOLUTO.Text:='';
end;

procedure TwMAutCred.edMONEDAKeyPress(Sender: TObject; var Key: Char);
begin
   If ((Pos(Key,'0123456789'#8)) = 0) Then Key := #0;
end;

Function TwMAutCred.AsignaFiltroCto: String;
Var
   sFiltro, sSQL: String;
   iIdAcreditado: Integer;
   bUnion : Boolean;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then
      Objeto.ID_ACREDITADO.GetFromControl;
   sFiltro:='(';
   bgIcre:= False;
   bUnion:= False;
   bgCred:= False;
   bgCCI := False;

   sSQL:= ' SELECT ID_PERSONA FROM RPT_CRE_PERSONA '+
          '   WHERE ID_PERSONA = ' + Objeto.ID_ACREDITADO.AsString +
          '     AND ID_EMPRESA = ' + IntToStr( Objeto.Apli.IdEmpresa) +
          '     AND ACRED_REL  =  ''SI'''+
          '     AND ID_PERSONA IN ( SELECT ID_PERSONA'+
          '                         FROM RPT_CRE_CREDITO'+
          // < Inicia Modificación SATV4766 el 10 Ene 2006 >
          // '                         WHERE CVE_CAT_MINIMO = ''730000000000'''+
          '                         WHERE CVE_CAT_MINIMO IN ( SELECT TO_CHAR(IGC.VALOR) AS CVE_CAT_MINIMO'+coCRLF+
          '                                                   FROM INF_GRUPO_CLAVE IGC,'+coCRLF+
          '                                                        ( SELECT ID_GRUPO FROM INF_GRUPO'+coCRLF+
          '                                                          WHERE GRUPO = ''CVE_CARTAS_CREDITO'' ) IG'+coCRLF+
          '                                                   WHERE IG.ID_GRUPO = IGC.ID_GRUPO'+coCRLF+
          '                                                     AND IGC.CVE_CLAVE BETWEEN '+FormatDateTime('YYYY', IncMonth(Objeto.APli.DameFechaEmpresaDia('D000'), -12))+coCRLF+
          '                                                                           AND '+FormatDateTime('YYYY',Objeto.APli.DameFechaEmpresaDia('D000'))+coCRLF+
          '                                                 )'+coCRLF+
          // < Termina Modificación SATV4766 el 10 Ene 2006 >
          '                           AND ID_EMPRESA     = '+ IntToStr(Objeto.Apli.IdEmpresa)+' )'+
          ' GROUP BY ID_PERSONA ' ;

   If GetSQLInt(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
                'ID_PERSONA',iIdAcreditado,False) Then Begin
      If iIdAcreditado <> 0 Then Begin
         bgCCI:= True;
         bUnion:= True;
         sFiltro:= sFiltro +
                   'SELECT CTO.ID_CONTRATO '+
                   '  FROM CR_CONTRATO CTO, CONTRATO '+
                   ' WHERE CTO.ID_CONTRATO = CONTRATO.ID_CONTRATO '+
                   '   AND CONTRATO.ID_TITULAR = '+ Objeto.ID_ACREDITADO.AsString;
      End;
   End;

     sSQL:= 'SELECT CA.ID_ACREDITADO '+
            '  FROM CR_ACREDITADO CA'+
            ' WHERE CA.B_ACREDITADO_REL = ''V'''+
            '   AND CA.ID_ACREDITADO ='+ Objeto.ID_ACREDITADO.AsString;
     If GetSQLInt(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
                  'ID_ACREDITADO',iIdAcreditado,False) Then Begin
        If iIdAcreditado <> 0 Then Begin
           bgIcre:= True;
           If bUnion Then
              sFiltro:= sFiltro + ' UNION ';

           sFiltro:= sFiltro +
                     'SELECT CTO.ID_CONTRATO '+
                     '  FROM CR_CONTRATO CTO, CONTRATO '+
                     ' WHERE CTO.ID_CONTRATO = CONTRATO.ID_CONTRATO '+
                     '   AND CONTRATO.ID_TITULAR = '+ Objeto.ID_ACREDITADO.AsString;
           bUnion:= True;
        End;
     End;

     sSQL:= 'SELECT CA.ID_PERSONA AS ID_ACREDITADO '+
            '  FROM CRE_CLIENTE CA'+
            ' WHERE CA.B_ART_73 = ''V'''+
            '   AND CA.ID_PERSONA ='+ Objeto.ID_ACREDITADO.AsString;
     If GetSQLInt(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
                  'ID_ACREDITADO',iIdAcreditado,False) Then Begin
        If iIdAcreditado <> 0 Then Begin
           bgCred:= True;
           If bUnion Then
              sFiltro:= sFiltro + ' UNION ';

           sFiltro:= sFiltro +
                     'SELECT CTO.ID_CONTRATO '+
                     '  FROM CRE_CONTRATO CTO, CONTRATO '+
                     ' WHERE CTO.ID_CONTRATO = CONTRATO.ID_CONTRATO '+
                     '   AND CONTRATO.ID_TITULAR = '+ Objeto.ID_ACREDITADO.AsString;
        End;
     End;
   sFiltro := sFiltro + ')';
   If (sFiltro = '()') Then
     sFiltro := '';
   AsignaFiltroCto:= sFiltro;
End;

procedure TwMAutCred.edSDO_INSOLUTOExit(Sender: TObject);
Var  vlSalida  :  Boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.SDO_INSOLUTO.GetFromControl;
      If Objeto.Acreditado.B_APLICA_INVERS.AsString ='F' Then Begin
         If Objeto.SDO_INSOLUTO.AsString = CNULL Then Begin
            vlSalida   := False;
            vlMsg := 'Indique el Saldo Insoluto';
         End;
      End;
      InterForma1.ValidaExit(edSDO_INSOLUTO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMAutCred.edF_PAGOExit(Sender: TObject);
Begin
   InterForma1.ValidaExit(edF_PAGO,True,'',True);
end;

End.
