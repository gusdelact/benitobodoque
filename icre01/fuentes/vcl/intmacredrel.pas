// Sistema         : Clase de CR_ACR_REL_ACRED
// Fecha de Inicio : 22/11/2004
// Función forma   : Clase de CR_ACR_REL_ACRED
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMAcredRel;

Interface

Uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, IntPers, IntCrTAcreR, IntCrGrupEco;

Type
 TMAcredRel= Class;

  TwMAcredRel=Class(TForm)
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
    Label1: TLabel;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIf: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIf: TLabel;
    edF_ALTA: TEdit;
    edF_MODIfICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIf: TEdit;
    rgSIT_ACREDITADO: TRadioGroup;
    btID_ACREDITADO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    ilID_ACREDITADO: TInterLinkit;
    Label2: TLabel;
    edGPO_ECONOMICO: TEdit;
    edDESC_GPO: TEdit;
    ilTIPO_ACRED_REL: TInterLinkit;
    memRelEmp: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    memRelGFI: TMemo;
    edNOM_TIPO_ACRED_REL: TEdit;
    btTIPO_ACRED_REL: TBitBtn;
    edTIPO_ACRED_REL: TEdit;
    Label5: TLabel;
    btGPO_ECONOMICO: TBitBtn;
    ilGPO_ECONOMICO: TInterLinkit;
    btInversion: TBitBtn;
    Procedure FormShow(SEnder : TObject);
    Procedure FormClose(SEnder : TObject; Var Action : TCloseAction);
    Procedure FormDestroy(SEnder : TObject);
    Procedure InterForma1AntesAceptar(SEnder: TObject; IsNewData: Boolean;
      Var Realizado: Boolean);
    Procedure InterForma1Buscar(SEnder: TObject);
    Procedure InterForma1DespuesNuevo(SEnder: TObject);
    Procedure rgSIT_ACREDITADOExit(SEnder: TObject);
    Procedure InterForma1DespuesModIficar(SEnder: TObject);
    Procedure edID_ACREDITADOExit(SEnder: TObject);
    Procedure InterForma1AntesEliminar(SEnder: TObject;
      Var Realizado: Boolean);
    Procedure ilID_ACREDITADOCapture(SEnder: TObject; Var Show: Boolean);
    Procedure ilTIPO_ACRED_RELCapture(SEnder: TObject; Var Show: Boolean);
    Procedure edTIPO_ACRED_RELExit(SEnder: TObject);
    Procedure btID_ACREDITADOClick(SEnder: TObject);
    Procedure ilID_ACREDITADOEjecuta(SEnder: TObject);
    Procedure btTIPO_ACRED_RELClick(SEnder: TObject);
    procedure ilTIPO_ACRED_RELEjecuta(Sender: TObject);
    procedure edGPO_ECONOMICOExit(Sender: TObject);
    procedure btGPO_ECONOMICOClick(Sender: TObject);
    procedure ilGPO_ECONOMICOCapture(Sender: TObject; var Show: Boolean);
    procedure ilGPO_ECONOMICOEjecuta(Sender: TObject);
    procedure memRelEmpExit(Sender: TObject);
    procedure memRelGFIExit(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure btInversionClick(Sender: TObject);
    procedure btInversionExit(Sender: TObject);
    procedure memRelEmpKeyPress(Sender: TObject; var Key: Char);
    procedure memRelGFIKeyPress(Sender: TObject; var Key: Char);
    procedure edNOM_ACREDITADOKeyPress(Sender: TObject; var Key: Char);

    Private
      Procedure BuscaDatos(IdAcreditado: Integer);
      Procedure HabilitaControl(sInversion: String);
    { Private declarations }
    Public
    { Public declarations }
      Objeto : TMAcredRel;
    End;

 TMAcredRel= Class(TInterFrame)
      Private
      Protected
      Public
        { Public declarations }
        ORIGEN              : TInterCampo;

        ID_ACREDITADO       : TInterCampo;
        NOMBRE_ACRED        : TInterCampo;
        CVE_GRUPO_ECO       : TInterCampo;
        TX_REL_EMPRESA      : TInterCampo;
        TX_REL_GPO_GFI      : TInterCampo;
        TIPO_ACRED_REL      : TInterCampo;
        B_APLICA_INVERS     : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        SIT_ACREDITADO      : TInterCampo;


        ParamCre            : TParamCre;
        Persona             : TPersona;
        TipoRel             : TCrTAcre;
        GpoEco              : TCrGrupEco;

        Function    InternalBusca : Boolean; override;
        Constructor Create( AOwner : TComponent ); override;
        Destructor  Destroy; override;
        Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    Reporte:Boolean; override;
      Published
      End;

Implementation
{$R *.DFM}

Constructor TMAcredRel.Create( AOwner : TComponent );
Begin Inherited;
   ORIGEN :=CreaCampo('ORIGEN',ftString,tsNinguno,tsNinguno,False);
      ORIGEN.Caption:='Origen';
      ORIGEN.NoCompare:= False;
   ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
      ID_ACREDITADO.Caption:='Acreditado';
      ID_ACREDITADO.NoCompare:= False;
   NOMBRE_ACRED:=CreaCampo('NOMBRE_ACRED',ftString,tsNinguno,tsNinguno,True);
      NOMBRE_ACRED.Caption:='Nombre Acreditado';
      NOMBRE_ACRED.NoCompare:= False;
   CVE_GRUPO_ECO :=CreaCampo('CVE_GRUPO_ECO',ftString,tsNinguno,tsNinguno,True);
      CVE_GRUPO_ECO.Caption:='Gpo Económico';
      CVE_GRUPO_ECO.NoCompare:= False;
   TX_REL_EMPRESA :=CreaCampo('TX_REL_EMPRESA',ftString,tsNinguno,tsNinguno,True);
      TX_REL_EMPRESA.Caption:='Rel Empresa';
      TX_REL_EMPRESA.NoCompare:= False;
   TX_REL_GPO_GFI :=CreaCampo('TX_REL_GPO_GFI',ftString,tsNinguno,tsNinguno,True);
      TX_REL_GPO_GFI.Caption:='Rel con GFI';
      TX_REL_GPO_GFI.NoCompare:= False;
   TIPO_ACRED_REL :=CreaCampo('TIPO_ACRED_REL',ftString,tsNinguno,tsNinguno,True);
      TIPO_ACRED_REL.Caption:='Tipo de acreditado';
      TIPO_ACRED_REL.NoCompare:= False;
   B_APLICA_INVERS :=CreaCampo('B_APLICA_INVERS',ftString,tsNinguno,tsNinguno,True);
      B_APLICA_INVERS.Caption:='Indica si aplican inversiones';
      B_APLICA_INVERS.NoCompare:= False;
   F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha de Alta';
      F_ALTA.NoCompare:= True;
   CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      CVE_USU_ALTA.NoCompare:= True;
   F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
      F_MODIFICA.Caption:='Fecha ModIfica';
      F_MODIFICA.NoCompare:= True;
   CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption:='Clave de Usu ModIfica';
      CVE_USU_MODIFICA.NoCompare:= True;
   SIT_ACREDITADO :=CreaCampo('SIT_ACREDITADO',ftString,tsNinguno,tsNinguno,True);
   With SIT_ACREDITADO do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('CA');
   End;
      SIT_ACREDITADO.Caption:='Situación de Acreditado';
      SIT_ACREDITADO.NoCompare:= True;

   FKeyFields.Add('ID_ACREDITADO');
   TableName := 'CR_ACR_REL_ACRED';
   UseQuery := True;
   HelpFile := 'IntMAcredRel.Hlp';
   ShowMenuReporte:=True;

   {$WARNINGS OFF}
   Persona := TPersona.Create(Self);
   {$WARNINGS ON}
   Persona.MasterSource:=Self;
   //Persona.FieldByName('ID_PERSONA').MasterField:='ID_ACREDITADO';
   Persona.BuscaWhereString :=  '';
   Persona.FilterString := Persona.BuscaWhereString;

   {$WARNINGS OFF}
   TipoRel := TCrTAcre.Create(Self);
   {$WARNINGS ON}
   TipoRel.MasterSource:=Self;
   TipoRel.FieldByName('TIPO_ACRED_REL').MasterField:='TIPO_ACRED_REL';

   {$WARNINGS OFF}
   GpoEco := TCrGrupEco.Create(Self);
   {$WARNINGS ON}
   GpoEco.MasterSource:=Self;
   GpoEco.FieldByName('CVE_GRUPO_ECO').MasterField:='CVE_GRUPO_ECO';
End;

Destructor TMAcredRel.Destroy;
Begin
   If Persona <> Nil Then
      Persona.Free;
   If TipoRel <> Nil Then
      TipoRel.Free;
   If GpoEco <> Nil Then
      GpoEco.Free;
   Inherited;
End;

Function TMAcredRel.ShowWindow(FormaTipo:TFormaTipo):Integer;
Var W : TWMAcredRel;
Begin
   W:=TWMAcredRel.Create(Self);
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

Function TMAcredRel.InternalBusca:Boolean;
Var T : TInterFindit;
Begin
   InternalBusca := False;
   T := CreaBuscador('ICRACR7.IT','F');
   Try
      If Active Then Begin
         T.Param(0,ID_ACREDITADO.AsString);
      End;
      If T.Execute Then
         InternalBusca := FindKey([T.DameCampo(0)]);
   Finally
      T.Free;
   End;
End;

Function TMAcredRel.Reporte:Boolean;
Begin
   Result := False;
End;


(***********************************************FORMA CR_ACR_REL_ACRED ********************)
(*                                                                              *)
(*  FORMA DE CR_ACR_REL_ACRED                                                   *)
(*                                                                              *)
(***********************************************FORMA CR_ACR_REL_ACRED ********************)

Procedure TwMAcredRel.FormShow(SEnder: TObject);
Begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_ACREDITADO.Control    := edID_ACREDITADO;
      NOMBRE_ACRED.Control     := edNOM_ACREDITADO;
      CVE_GRUPO_ECO.Control    := edGPO_ECONOMICO;
      TX_REL_EMPRESA.Control   := memRelEmp;
      TX_REL_GPO_GFI.Control   := memRelGFI;
      TIPO_ACRED_REL.Control   := edTIPO_ACRED_REL;
      F_ALTA.Control           := edF_ALTA;
      CVE_USU_ALTA.Control     := edCVE_USU_ALTA;
      F_MODIFICA.Control       := edF_MODIFICA;
      CVE_USU_MODIFICA.Control := edCVE_USU_MODIF;
      SIT_ACREDITADO.Control   := rgSIT_ACREDITADO;
      InterForma1.MsgPanel     := PnlMsg;

//      Persona.Id_Persona.Control := edID_ACREDITADO;
//      Persona.Nombre.Control     := edNOM_ACREDITADO;
//      Persona.GetParams(Objeto);

      TipoRel.TIPO_ACRED_REL.Control := edTIPO_ACRED_REL;
      TipoRel.DESC_TIPO_ACRED.Control := edNOM_TIPO_ACRED_REL;
      TipoRel.GetParams(Objeto);

      GpoEco.CVE_GRUPO_ECO.Control:= edGPO_ECONOMICO;
      GpoEco.DESC_AGRUPO_ECO.Control:= edDESC_GPO;
      GpoEco.GetParams(Objeto);
   End;
End;

Procedure TwMAcredRel.FormDestroy(SEnder: TObject);
Begin
   With Objeto Do Begin
      ID_ACREDITADO.Control    := Nil;
      NOMBRE_ACRED.Control     := Nil;      
      CVE_GRUPO_ECO.Control    := Nil;
      TX_REL_EMPRESA.Control   := Nil;
      TX_REL_GPO_GFI.Control   := Nil;
      TIPO_ACRED_REL.Control   := Nil;
      F_ALTA.Control           := Nil;
      CVE_USU_ALTA.Control     := Nil;
      F_MODIFICA.Control       := Nil;
      CVE_USU_MODIFICA.Control := Nil;
      SIT_ACREDITADO.Control   := Nil;
      InterForma1.MsgPanel     := Nil;

      //Persona.Id_Persona.Control := Nil;
      //Persona.Nombre.Control     := Nil;
      TipoRel.TIPO_ACRED_REL.Control := Nil;
      TipoRel.DESC_TIPO_ACRED.Control := Nil;
      GpoEco.CVE_GRUPO_ECO.Control:= Nil;
      GpoEco.DESC_AGRUPO_ECO.Control:= Nil;
   End;
End;

Procedure TwMAcredRel.FormClose(SEnder: TObject; Var Action: TCloseAction);
Begin Action := caFree;
End;

Procedure TwMAcredRel.InterForma1AntesAceptar(SEnder: TObject;
  IsNewData: Boolean; Var Realizado: Boolean);
Begin
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

Procedure TwMAcredRel.InterForma1Buscar(SEnder: TObject);
Begin
   Objeto.InternalBusca;
   HabilitaControl(Objeto.B_APLICA_INVERS.AsString);
   Objeto.GpoEco.FindKey([Objeto.CVE_GRUPO_ECO.AsString]);
   Objeto.TipoRel.FindKey([Objeto.TIPO_ACRED_REL.AsString]);
End;

Procedure TwMAcredRel.InterForma1DespuesNuevo(SEnder: TObject);
Begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   Objeto.B_APLICA_INVERS.AsString:='F';
   rgSIT_ACREDITADO.ItemIndex:= 0;
   edID_ACREDITADO.SetFocus;
   HabilitaControl(Objeto.B_APLICA_INVERS.AsString);
End;

Procedure TwMAcredRel.rgSIT_ACREDITADOExit(SEnder: TObject);
Begin
   InterForma1.ValidaExit(rgSIT_ACREDITADO,True,CNULL,True);
End;

Procedure TwMAcredRel.InterForma1DespuesModIficar(SEnder: TObject);
Begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   HabilitaControl(Objeto.B_APLICA_INVERS.AsString);
   If Objeto.B_APLICA_INVERS.AsString ='V' Then
      edGPO_ECONOMICO.SetFocus
   Else
      memRelEmp.SetFocus;
End;

Procedure TwMAcredRel.edID_ACREDITADOExit(SEnder: TObject);
Var  vlSalida  :  boolean;
     vlMsg, sSQL :  String;
     qyQuery: TQuery;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_ACREDITADO.GetFromControl;
      If Objeto.ID_ACREDITADO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del Acreditado';
      End Else Begin
         If InterForma1.IsNewData Then Begin
            sSQl:= 'SELECT ID_ACREDITADO FROM CR_ACR_REL_ACRED '+
                   ' WHERE ID_ACREDITADO ='+ Objeto.ID_ACREDITADO.AsString;
            qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            If qyQuery <> Nil Then Begin
               If qyQuery.FieldByName('ID_ACREDITADO').AsInteger = Objeto.ID_ACREDITADO.AsInteger Then Begin
                  vlSalida   := False;
                  vlMsg := 'El Acreditado ya existe como relacionado';
               End;
               qyQuery.Free;
            End;
         End;
      End;
      InterForma1.ValidaExit(edID_ACREDITADO,vlSalida,vlMsg,True);
   End;
End;

Procedure TwMAcredRel.InterForma1AntesEliminar(SEnder: TObject;
  Var Realizado: Boolean);
Var
   sSQL:String;
   qyQuery:TQuery;
Begin
   sSQL:=' SELECT * FROM CR_ACR_REL_CTO '+
         '  WHERE ID_ACREDITADO ='+ Objeto.ID_ACREDITADO.AsSQL;
   qyQuery:= GetSQLQuery(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
   If qyQuery <> Nil Then Begin
      ShowMessage('El acreditado '''+ Objeto.ID_ACREDITADO.AsString+
                  ''' tiene registros asociados, No puede ser eliminado');
      qyQuery.Free;
      Realizado:=False;
   End Else
      Realizado:=True;
End;
Procedure TwMAcredRel.ilID_ACREDITADOCapture(SEnder: TObject; Var Show: Boolean);
Begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
End;

Procedure TwMAcredRel.ilTIPO_ACRED_RELCapture(SEnder: TObject; Var Show: Boolean);
Begin
   Show:=(InterForma1.CanEdit) or (InterForma1.IsNewData);
End;

Procedure TwMAcredRel.edTIPO_ACRED_RELExit(SEnder: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.TIPO_ACRED_REL.GetFromControl;
      If Objeto.TIPO_ACRED_REL.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el tipo de relación';
      End;
      InterForma1.ValidaExit(edTIPO_ACRED_REL,vlSalida,vlMsg,True);
   End;
End;

Procedure TwMAcredRel.btID_ACREDITADOClick(SEnder: TObject);
Var sSQL: String;
Begin
   If Objeto.B_APLICA_INVERS.AsString ='F' Then Begin
      sSQL:= 'SELECT CA.ID_ACREDITADO '+coCRLF+
                '  FROM CR_ACREDITADO CA, CR_GRUPO_ECO CGE, CR_TIPO_ACRED TA'+coCRLF+
                ' WHERE CA.CVE_GRUPO_ECO = CGE.CVE_GRUPO_ECO'+coCRLF+
                '   AND CA.B_ACREDITADO_REL = ''V'''+coCRLF+
                '   AND CA.TIPO_ACRED_REL = TA.TIPO_ACRED_REL '+coCRLF+
                'UNION All '+coCRLF+
                'SELECT CA.ID_PERSONA AS ID_ACREDITADO '+coCRLF+
                '  FROM CRE_CLIENTE CA, CR_GRUPO_ECO CGE, CR_TIPO_ACRED TA'+coCRLF+
                ' WHERE CA.CVE_GRUPO = CGE.CVE_GRUPO_ECO'+coCRLF+
                '   AND CA.B_ART_73 = ''V'''+coCRLF+
                '   AND CA.CVE_TIPO_ACRED = TA.TIPO_ACRED_REL '+coCRLF+
                'UNION All '+coCRLF+
                'SELECT RCC.ID_PERSONA AS ID_ACREDITADO '+coCRLF+
                '  FROM RPT_CRE_CREDITO RCC,'+coCRLF+
                '       RPT_CRE_PERSONA RCP,'+coCRLF+
                '       (SELECT RCC.ID_EMPRESA, RCC.ID_CREDITO, MAX(RCC.ANO_MES_VIG) AMVC,'+coCRLF+
                '               MAX(RCP.ANO_MES_VIG) AMVP'+coCRLF+
                '          FROM RPT_CRE_CREDITO RCC,'+coCRLF+
                '               RPT_CRE_PERSONA RCP'+coCRLF+
                '         WHERE RCC.ID_EMPRESA= 2'+coCRLF+
                '           AND RCC.ANO_MES_VIG<= '+ FormatDateTime('yyyymm',Objeto.Apli.DameFechaEmpresaDia('D000'))+coCRLF+
                '           AND RCP.ID_EMPRESA=RCC.ID_EMPRESA'+coCRLF+
                '           AND RCP.ID_PERSONA=RCC.ID_PERSONA'+coCRLF+
                '           AND RCP.ANO_MES_VIG<=  '+ FormatDateTime('yyyymm',Objeto.Apli.DameFechaEmpresaDia('D000'))+coCRLF+
                '           AND ((RCC.SIT_CREDITO=''AC'') OR'+coCRLF+
                '               ((RCC.SIT_CREDITO=''LQ'') AND (RCC.ANO_MES_LIQ >= '+ FormatDateTime('yyyymm',Objeto.Apli.DameFechaEmpresaDia('D000'))+')))'+coCRLF+
                '       GROUP BY RCC.ID_EMPRESA, RCC.ID_CREDITO) VIG'+coCRLF+
                ' WHERE RCC.ID_EMPRESA  = 2'+coCRLF+
                '   AND RCC.ID_CREDITO  = VIG.ID_CREDITO'+coCRLF+
                '   AND RCC.ANO_MES_VIG = VIG.AMVC'+coCRLF+
                // < Inicia Modificación SATV4766 el 10 Ene 2006 >
                // '   AND RCC.CVE_CAT_MINIMO=''730000000000'''+
                '   AND RCC.CVE_CAT_MINIMO IN ( SELECT TO_CHAR(IGC.VALOR) AS CVE_CAT_MINIMO'+coCRLF+
                '                               FROM INF_GRUPO_CLAVE IGC,'+coCRLF+
                '                                    ( SELECT ID_GRUPO FROM INF_GRUPO'+coCRLF+
                '                                      WHERE GRUPO = ''CVE_CARTAS_CREDITO'' ) IG'+coCRLF+
                '                               WHERE IG.ID_GRUPO = IGC.ID_GRUPO'+coCRLF+
                '                                 AND IGC.CVE_CLAVE BETWEEN '+FormatDateTime('YYYY', IncMonth(Objeto.APli.DameFechaEmpresaDia('D000'), -12))+coCRLF+
                '                                                   AND '+FormatDateTime('YYYY',Objeto.APli.DameFechaEmpresaDia('D000'))+coCRLF+
                '                             )'+coCRLF+
                // < Termina Modificación SATV4766 el 10 Ene 2006 >
                '   AND RCP.ID_EMPRESA  = RCC.ID_EMPRESA'+coCRLF+
                '   AND RCP.ID_PERSONA  = RCC.ID_PERSONA'+coCRLF+
                '   AND RCP.ANO_MES_VIG = VIG.AMVP'+coCRLF+
                '   AND RCP.ACRED_REL=''SI'''+coCRLF;
      Objeto.Persona.BuscaWhereString :=  'PERSONA.ID_PERSONA IN ('+ sSQL +')';
   End Else Begin
      Objeto.Persona.BuscaWhereString :=  '';
   End;

   Objeto.Persona.FilterString := Objeto.Persona.BuscaWhereString;
   Objeto.Persona.ShowAll := True;
   If Objeto.Persona.Busca Then Begin
      Objeto.ID_ACREDITADO.AsInteger:= Objeto.Persona.Id_Persona.AsInteger;
      Objeto.NOMBRE_ACRED.AsString:= Objeto.Persona.Nombre.AsString;
      If Objeto.B_APLICA_INVERS.AsString ='F' Then
         BuscaDatos(Objeto.Persona.Id_Persona.AsInteger);
      InterForma1.NextTab(edID_ACREDITADO);
   End;
End;

Procedure TwMAcredRel.ilID_ACREDITADOEjecuta(SEnder: TObject);
Begin
   If Objeto.B_APLICA_INVERS.AsString ='F' Then Begin
      If Objeto.Persona.FindKey([ilID_ACREDITADO.Buffer]) Then Begin
         Objeto.ID_ACREDITADO.AsString:= Objeto.Persona.Id_Persona.AsString;
         Objeto.NOMBRE_ACRED.AsString:= Objeto.Persona.Nombre.AsString;
         BuscaDatos(Objeto.Persona.Id_Persona.AsInteger);
         InterForma1.NextTab(edID_ACREDITADO);
      End;
   End Else Begin
      edID_ACREDITADO.text:= ilID_ACREDITADO.ShowBuffer;
      InterForma1.NextTab(edID_ACREDITADO);
   End;
End;

Procedure TwMAcredRel.btTIPO_ACRED_RELClick(SEnder: TObject);
Begin
   Objeto.TipoRel.ShowAll := True;
   If Objeto.TipoRel.Busca Then Begin
      InterForma1.NextTab(edTIPO_ACRED_REL);
   End;
End;

procedure TwMAcredRel.ilTIPO_ACRED_RELEjecuta(Sender: TObject);
begin
   If Objeto.TipoRel.FindKey([ilTIPO_ACRED_REL.Buffer]) Then Begin
      InterForma1.NextTab(edTIPO_ACRED_REL);
   End;
end;

Procedure TwMAcredRel.BuscaDatos(IdAcreditado: Integer);
Var
   sSQL: String; iCount: Integer;
   qyQuery: TQuery;
Begin
   sSQL:= 'SELECT TABLA.* FROM( '+coCRLF+
          'SELECT ''1'' AS ORIGEN,'+coCRLF+
          '       CA.ID_ACREDITADO ,'+coCRLF+
          '       CA.CVE_GRUPO_ECO ,'+coCRLF+
          '       CGE.DESC_GRUPO_ECO ,'+coCRLF+
          '       CA.TIPO_ACRED_REL ,'+coCRLF+
          '       TA.DESC_TIPO_ACRED'+coCRLF+
          '  FROM CR_ACREDITADO CA, CR_GRUPO_ECO CGE, CR_TIPO_ACRED TA'+coCRLF+
          ' WHERE CA.CVE_GRUPO_ECO = CGE.CVE_GRUPO_ECO'+coCRLF+
          '   AND CA.B_ACREDITADO_REL = ''V'''+coCRLF+
          '   AND CA.TIPO_ACRED_REL = TA.TIPO_ACRED_REL '+coCRLF+
          'UNION All '+coCRLF+
          'SELECT ''2'' AS ORIGEN,'+coCRLF+
          '       CA.ID_PERSONA AS ID_ACREDITADO,'+coCRLF+
          '       CA.CVE_GRUPO AS CVE_GRUPO_ECO,'+coCRLF+
          '       CGE.DESC_GRUPO_ECO AS DESC_GRUPO_ECO,'+coCRLF+
          '       CA.CVE_TIPO_ACRED AS TIPO_ACRED_REL,'+coCRLF+
          '       TA.DESC_TIPO_ACRED AS DESC_TIPO_ACRED'+coCRLF+
          '  FROM CRE_CLIENTE CA, CR_GRUPO_ECO CGE, CR_TIPO_ACRED TA'+coCRLF+
          ' WHERE CA.CVE_GRUPO = CGE.CVE_GRUPO_ECO'+coCRLF+
          '   AND CA.B_ART_73 = ''V'''+coCRLF+
          '   AND CA.CVE_TIPO_ACRED = TA.TIPO_ACRED_REL '+coCRLF+
          'UNION All '+coCRLF+
          'SELECT ''3'' AS ORIGEN,'+coCRLF+
          '       RCC.ID_PERSONA AS ID_ACREDITADO,'+coCRLF+
          '       '' '' AS CVE_GRUPO_ECO,'+coCRLF+
          '       GRUPO_ECONOMICO AS DESC_GRUPO_ECO,'+coCRLF+
          '       CVE_TIPO_ACRED AS TIPO_ACRED_REL,'+coCRLF+
          '       '' '' AS DESC_TIPO_ACRED'+coCRLF+
          '  FROM RPT_CRE_CREDITO RCC,'+coCRLF+
          '       RPT_CRE_PERSONA RCP,'+coCRLF+
          '       (SELECT RCC.ID_EMPRESA, RCC.ID_CREDITO, MAX(RCC.ANO_MES_VIG) AMVC,'+coCRLF+
          '               MAX(RCP.ANO_MES_VIG) AMVP'+coCRLF+
          '          FROM RPT_CRE_CREDITO RCC,'+coCRLF+
          '               RPT_CRE_PERSONA RCP'+coCRLF+
          '         WHERE RCC.ID_EMPRESA= 2'+coCRLF+
          '           AND RCC.ANO_MES_VIG<= '+ FormatDateTime('yyyymm',Objeto.Apli.DameFechaEmpresaDia('D000'))+coCRLF+
          '           AND RCP.ID_EMPRESA=RCC.ID_EMPRESA'+coCRLF+
          '           AND RCP.ID_PERSONA=RCC.ID_PERSONA'+coCRLF+
          '           AND RCP.ANO_MES_VIG<=  '+ FormatDateTime('yyyymm',Objeto.Apli.DameFechaEmpresaDia('D000'))+coCRLF+
          '           AND ((RCC.SIT_CREDITO=''AC'') OR'+coCRLF+
          '               ((RCC.SIT_CREDITO=''LQ'') AND (RCC.ANO_MES_LIQ >= '+ FormatDateTime('yyyymm',Objeto.Apli.DameFechaEmpresaDia('D000'))+')))'+coCRLF+
          '       GROUP BY RCC.ID_EMPRESA, RCC.ID_CREDITO) VIG'+coCRLF+
          ' WHERE RCC.ID_EMPRESA  = 2'+coCRLF+
          '   AND RCC.ID_CREDITO  = VIG.ID_CREDITO'+coCRLF+
          '   AND RCC.ANO_MES_VIG = VIG.AMVC'+coCRLF+
          // < Inicia Modificación SATV4766 el 10 Ene 2006 >
          // '   AND RCC.CVE_CAT_MINIMO=''730000000000'''
          '   AND RCC.CVE_CAT_MINIMO IN ( SELECT TO_CHAR(IGC.VALOR) AS CVE_CAT_MINIMO'+coCRLF+
          '                               FROM INF_GRUPO_CLAVE IGC,'+coCRLF+
          '                                    ( SELECT ID_GRUPO FROM INF_GRUPO'+coCRLF+
          '                                      WHERE GRUPO = ''CVE_CARTAS_CREDITO'' ) IG'+coCRLF+
          '                               WHERE IG.ID_GRUPO = IGC.ID_GRUPO'+coCRLF+
          '                                 AND IGC.CVE_CLAVE BETWEEN '+FormatDateTime('YYYY', IncMonth(Objeto.APli.DameFechaEmpresaDia('D000'), -12))+coCRLF+
          '                                                   AND '+FormatDateTime('YYYY',Objeto.APli.DameFechaEmpresaDia('D000'))+coCRLF+
          '                             )'+coCRLF+
          // < Termina Modificación SATV4766 el 10 Ene 2006 >
          '   AND RCP.ID_EMPRESA  = RCC.ID_EMPRESA'+coCRLF+
          '   AND RCP.ID_PERSONA  = RCC.ID_PERSONA'+coCRLF+
          '   AND RCP.ANO_MES_VIG = VIG.AMVP'+coCRLF+
          '   AND RCP.ACRED_REL=''SI'' ) TABLA '+coCRLF+
          ' WHERE TABLA.ID_ACREDITADO = '+ IntToStr(IdAcreditado);
   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      iCount:= qyQuery.RecordCount;
      While not qyQuery.Eof Do Begin
         If Trim(qyQuery.FieldByName('CVE_GRUPO_ECO').AsString)<>'' Then
            Objeto.GpoEco.FindKey([qyQuery.FieldByName('CVE_GRUPO_ECO').AsString]);
         If Trim(qyQuery.FieldByName('TIPO_ACRED_REL').AsString)<>'' Then
            Objeto.TipoRel.FindKey([qyQuery.FieldByName('TIPO_ACRED_REL').AsString]);
         If (Trim(qyQuery.FieldByName('ORIGEN').AsString)= '3')and (iCount<=1) Then Begin
            edTIPO_ACRED_REL.Tag:= 530;
            btTIPO_ACRED_REL.Tag:= 18;
            edTIPO_ACRED_REL.TabStop:= True;
            btTIPO_ACRED_REL.TabStop:= True;
         End Else Begin
            edTIPO_ACRED_REL.Tag:= 17;
            btTIPO_ACRED_REL.Tag:= 17;
            edTIPO_ACRED_REL.TabStop:= False;
            btTIPO_ACRED_REL.TabStop:= False;
         End;
         qyQuery.Next;
      End;
      InterForma1.InitShow;
      qyQuery.Free;
   End;
End;
procedure TwMAcredRel.edGPO_ECONOMICOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_GRUPO_ECO.GetFromControl;
      If Objeto.CVE_GRUPO_ECO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del Grupo Económico';
      End;
      InterForma1.ValidaExit(edGPO_ECONOMICO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMAcredRel.btGPO_ECONOMICOClick(Sender: TObject);
begin
   Objeto.GpoEco.ShowAll := True;
   If Objeto.GpoEco.Busca Then Begin
      InterForma1.NextTab(edGPO_ECONOMICO);
   End;
end;

procedure TwMAcredRel.ilGPO_ECONOMICOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TwMAcredRel.ilGPO_ECONOMICOEjecuta(Sender: TObject);
begin
   If Objeto.GpoEco.FindKey([ilGPO_ECONOMICO.Buffer]) Then Begin
      InterForma1.NextTab(edGPO_ECONOMICO);
   End;
end;

procedure TwMAcredRel.memRelEmpExit(Sender: TObject);
begin
   InterForma1.ValidaExit(memRelEmp,True,CNULL,True);
end;

procedure TwMAcredRel.memRelGFIExit(Sender: TObject);
begin
   InterForma1.ValidaExit(memRelGFI,True,CNULL,True);
end;

procedure TwMAcredRel.InterForma1DespuesCancelar(Sender: TObject);
begin
   btID_ACREDITADO.Visible:= True;
   edID_ACREDITADO.Tag:= 562;
   edNOM_ACREDITADO.Tag:= 18;
   edGPO_ECONOMICO.Tag:= 18;
   btGPO_ECONOMICO.Tag:= 18;
   edTIPO_ACRED_REL.Tag:= 18;
   btTIPO_ACRED_REL.Tag:= 18;
   InterForma1.InitShow;
end;

Procedure TwMAcredRel.HabilitaControl(sInversion: String);
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      If (sInversion ='F') Then Begin // no es inversión
         btID_ACREDITADO.Visible:= True;
         edNOM_ACREDITADO.Tag:= 17;
         edNOM_ACREDITADO.TabStop:= False;
{         edGPO_ECONOMICO.Tag:= 17;
         edGPO_ECONOMICO.TabStop:= False;
         btGPO_ECONOMICO.Tag:= 17;
         btGPO_ECONOMICO.TabStop:= False;
         edTIPO_ACRED_REL.Tag:= 17;
         edTIPO_ACRED_REL.TabStop:= False;
         btTIPO_ACRED_REL.Tag:= 17;
         btTIPO_ACRED_REL.TabStop:= False;
}
      End Else Begin // es inversión
         btID_ACREDITADO.Visible:= False;
         edNOM_ACREDITADO.Tag:= 18;
         edNOM_ACREDITADO.TabStop:= True;
         edGPO_ECONOMICO.Tag:= 530;
         edGPO_ECONOMICO.TabStop:= True;
         btGPO_ECONOMICO.Tag:= 18;
         btGPO_ECONOMICO.TabStop:= True;
         edTIPO_ACRED_REL.Tag:= 530;
         edTIPO_ACRED_REL.TabStop:= True;
         btTIPO_ACRED_REL.Tag:= 18;
         btTIPO_ACRED_REL.TabStop:= True;
      End;
      InterForma1.InitShow;
   End;
End;
procedure TwMAcredRel.btInversionClick(Sender: TObject);
begin
   Objeto.B_APLICA_INVERS.AsString:= 'V';
   HabilitaControl(Objeto.B_APLICA_INVERS.AsString);
end;

procedure TwMAcredRel.btInversionExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btInversion,True,CNULL,True);
end;

procedure TwMAcredRel.memRelEmpKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMAcredRel.memRelGFIKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TwMAcredRel.edNOM_ACREDITADOKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

End.
