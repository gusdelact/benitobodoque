// Sistema         : Clase de CR_ACR_REL_CP_BA
// Fecha de Inicio : 23/11/2004
// Función forma   : Clase de CR_ACR_REL_CP_BA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMCapBasic;

Interface

Uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, InterEdit;

Type
 TMCapBasic= Class;

  TwMCapBasic=Class(TForm)
    InterForma1             : TInterForma;
    stpF_TRIMESTRE: TInterDateTimePicker;
    edF_TRIMESTRE: TEdit;
    Label1: TLabel;
    edCAPITAL_BASICO: TInterEdit;
    Label2: TLabel;
    edPCT_BASICO: TInterEdit;
    Label3: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    PnlMsg: TPanel;
    Procedure FormShow(SEnder : TObject);
    Procedure FormClose(SEnder : TObject; Var Action : TCloseAction);
    Procedure FormDestroy(SEnder : TObject);
    Procedure InterForma1Buscar(SEnder: TObject);
    procedure edF_TRIMESTREExit(Sender: TObject);
    procedure edCAPITAL_BASICOExit(Sender: TObject);
    procedure edPCT_BASICOExit(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    Private
    { Private declarations }
    Public
    { Public declarations }
      Objeto : TMCapBasic;
    End;

 TMCapBasic= Class(TInterFrame)
      Private
      Protected
      Public
        { Public declarations }
        F_TRIMESTRE         : TInterCampo;
        IMP_CAP_BASICO      : TInterCampo;
        PCT_CAP_BASICO      : TInterCampo;
        ParamCre            : TParamCre;

        Function    InternalBusca : Boolean; override;
        Constructor Create( AOwner : TComponent ); override;
        Destructor  Destroy; override;
        Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    Reporte:Boolean; override;
      Published
      End;

Implementation
{$R *.DFM}

Constructor TMCapBasic.Create( AOwner : TComponent );
Begin Inherited;
   F_TRIMESTRE :=CreaCampo('F_TRIMESTRE',ftDate,tsNinguno,tsNinguno,True);
      F_TRIMESTRE.Caption:='Fecha de Trimestre';
      F_TRIMESTRE.NoCompare:= True;
   IMP_CAP_BASICO :=CreaCampo('IMP_CAP_BASICO',ftFloat,tsNinguno,tsNinguno,True);
      IMP_CAP_BASICO.Caption:='Capital Básico';
      IMP_CAP_BASICO.NoCompare:= False;
   PCT_CAP_BASICO :=CreaCampo('PCT_CAP_BASICO',ftFloat,tsNinguno,tsNinguno,True);
      PCT_CAP_BASICO.Caption:='PCT Básico';
      PCT_CAP_BASICO.NoCompare:= False;

   FKeyFields.Add('F_TRIMESTRE');
   TableName := 'CR_ACR_REL_CP_BA';
   UseQuery := True;
   HelpFile := 'IntMCapBasic.Hlp';
   ShowMenuReporte:=True;
End;

Destructor TMCapBasic.Destroy;
Begin
   Inherited;
End;

Function TMCapBasic.ShowWindow(FormaTipo:TFormaTipo):Integer;
Var W : TWMCapBasic;
Begin
   W:=TWMCapBasic.Create(Self);
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

Function TMCapBasic.InternalBusca:Boolean;
Var T : TInterFindit;
Begin
   InternalBusca := False;
   T := CreaBuscador('ICRCABA.IT','D');
   Try
      If Active Then Begin
         T.Param(0,F_TRIMESTRE.AsString);
      End;
      If T.Execute Then
         InternalBusca := FindKey([T.DameCampo(0)]);
   Finally
      T.Free;
   End;
End;

Function TMCapBasic.Reporte:Boolean;
Begin
   Result := False;
End;


(***********************************************FORMA CR_ACR_REL_CP_BA********************)
(*                                                                              *)
(*  FORMA DE CR_ACR_REL_CP_BA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_ACR_REL_CP_BA********************)

Procedure TwMCapBasic.FormShow(SEnder: TObject);
Begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      F_TRIMESTRE.Control    := edF_TRIMESTRE;
      IMP_CAP_BASICO.Control := edCAPITAL_BASICO;
      PCT_CAP_BASICO.Control     := edPCT_BASICO;
      InterForma1.MsgPanel   := PnlMsg;
   End;
   stpF_TRIMESTRE.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
End;

Procedure TwMCapBasic.FormDestroy(SEnder: TObject);
Begin
   With Objeto Do Begin
      F_TRIMESTRE.Control    := Nil;
      IMP_CAP_BASICO.Control := Nil;
      PCT_CAP_BASICO.Control     := Nil;
      InterForma1.MsgPanel   := Nil;
   End;
End;

Procedure TwMCapBasic.FormClose(SEnder: TObject; Var Action: TCloseAction);
Begin Action := caFree;
End;

Procedure TwMCapBasic.InterForma1Buscar(SEnder: TObject);
Begin
   With Objeto Do Begin
      InternalBusca;
   End;
End;

procedure TwMCapBasic.edF_TRIMESTREExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.F_TRIMESTRE.GetFromControl;
      If Objeto.F_TRIMESTRE.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la fecha de Trimestre';
      End;
      InterForma1.ValidaExit(edF_TRIMESTRE,vlSalida,vlMsg,True);
   End;
end;

procedure TwMCapBasic.edCAPITAL_BASICOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.IMP_CAP_BASICO.GetFromControl;
      If Objeto.IMP_CAP_BASICO.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el Capital Básico';
      End;
      InterForma1.ValidaExit(edCAPITAL_BASICO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMCapBasic.edPCT_BASICOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.PCT_CAP_BASICO.GetFromControl;
      If Objeto.PCT_CAP_BASICO.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el Porcentaje Básico';
      End;
      InterForma1.ValidaExit(edPCT_BASICO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMCapBasic.InterForma1DespuesNuevo(Sender: TObject);
begin
   edF_TRIMESTRE.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));
   edF_TRIMESTRE.SetFocus;   
end;

End.
