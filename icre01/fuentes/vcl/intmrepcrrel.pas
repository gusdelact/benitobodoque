// Sistema         : Clase de Reporte
// Fecha de Inicio : 23/11/2004
// Función forma   : Clase de Reporte
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMRepCrRel;

Interface

Uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, InterEdit, IntMQrRepCrRel;

Type
 TMRepCrRel= Class;

  TwMRepCrRel=Class(TForm)
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
    stpF_TRIMESTRE: TInterDateTimePicker;
    edF_TRIMESTRE: TEdit;
    Label1: TLabel;
    PnlMsg: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Procedure FormShow(SEnder : TObject);
    Procedure FormClose(SEnder : TObject; Var Action : TCloseAction);
    Procedure FormDestroy(SEnder : TObject);
    Procedure InterForma1Buscar(SEnder: TObject);
    procedure edF_TRIMESTREExit(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    Private
        Procedure ImprimirReporte(bPreview:Boolean);
        Procedure ProcesoCarga;
    { Private declarations }
    Public
    { Public declarations }
      Objeto : TMRepCrRel;
    End;

 TMRepCrRel= Class(TInterFrame)
      Private
      Protected
      Public
        { Public declarations }
        F_TRIMESTRE         : TInterCampo;
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

Constructor TMRepCrRel.Create( AOwner : TComponent );
Begin Inherited;
   F_TRIMESTRE :=CreaCampo('F_TRIMESTRE',ftDate,tsNinguno,tsNinguno,True);
      F_TRIMESTRE.Caption:='Fecha de Trimestre';
      F_TRIMESTRE.NoCompare:= True;

   TableName := '';
   UseQuery := True;
   HelpFile := 'IntMRepCrRel.Hlp';
   ShowMenuReporte:=True;
End;

Destructor TMRepCrRel.Destroy;
Begin
   Inherited;
End;

Function TMRepCrRel.ShowWindow(FormaTipo:TFormaTipo):Integer;
Var W : TWMRepCrRel;
Begin
   W:=TWMRepCrRel.Create(Self);
   Try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   Finally
      W.Free;
   End;
End;

Function TMRepCrRel.InternalBusca:Boolean;
Begin
End;

Function TMRepCrRel.Reporte:Boolean;
Begin
   Result := False;
End;


(***********************************************FORMA CR_ACR_REL_CP_BA********************)
(*                                                                              *)
(*  FORMA DE CR_ACR_REL_CP_BA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_ACR_REL_CP_BA********************)

Procedure TwMRepCrRel.FormShow(SEnder: TObject);
Begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   InterForma1.BtnImprimir.Visible:= False;
   InterForma1.BtnPreview.Visible:= False;

   With Objeto Do Begin
      F_TRIMESTRE.Control    := edF_TRIMESTRE;
   End;
   stpF_TRIMESTRE.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   edF_TRIMESTRE.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));
End;

Procedure TwMRepCrRel.FormDestroy(SEnder: TObject);
Begin
   With Objeto Do Begin
      F_TRIMESTRE.Control    := Nil;
   End;
End;

Procedure TwMRepCrRel.FormClose(SEnder: TObject; Var Action: TCloseAction);
Begin Action := caFree;
End;

Procedure TwMRepCrRel.InterForma1Buscar(SEnder: TObject);
Begin
   With Objeto Do Begin
      InternalBusca;
   End;
End;

procedure TwMRepCrRel.edF_TRIMESTREExit(Sender: TObject);
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

procedure TwMRepCrRel.InterForma1DespuesNuevo(Sender: TObject);
begin
   edF_TRIMESTRE.SetFocus;
end;

procedure TwMRepCrRel.InterForma1BtnPreviewClick(Sender: TObject);
begin
   ImprimirReporte(True);
end;

procedure TwMRepCrRel.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimirReporte(False);
end;

Procedure TwMRepCrRel.ImprimirReporte(bPreview:Boolean);
Begin
   RepCrRel(edF_TRIMESTRE.Text,Objeto.Apli, bPreview);
End;

procedure TwMRepCrRel.BitBtn1Click(Sender: TObject);
begin
   ImprimirReporte(True);
end;

procedure TwMRepCrRel.BitBtn2Click(Sender: TObject);
Var
   sSQL: String;
   qyQuery: TQuery;
begin
   Objeto.F_TRIMESTRE.GetFromControl;
   sSQL:= 'SELECT F_PROCESO FROM  CR_ACR_REL_RECEP '+
          ' WHERE F_PROCESO = TO_DATE('''+
          FormatDateTime('dd/mm/yyyy',Objeto.F_TRIMESTRE.AsDateTime)+
          ''',''dd/mm/yyyy'') GROUP BY F_PROCESO';
   qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      If Objeto.F_TRIMESTRE.AsDateTime = qyQuery.FieldByName('F_PROCESO').AsDateTime Then Begin
         If Application.MessageBox('La carga ya ha sido generada, ¿Desea volver a generarla?',
           'Carga generada',1) <> MB_OK Then Begin
            ProcesoCarga;
         End;
      End Else Begin
         ProcesoCarga;
      End;
      qyQuery.Free;
   End;
end;

Procedure TwMRepCrRel.ProcesoCarga;
Var
   stp: TStoredProc;
begin
   Try
      stp:=TStoredProc.Create(Nil);
      stp.DatabaseName:=Objeto.Apli.DataBaseName;
      stp.SessionName:=Objeto.Apli.SessionName;
      stp.StoredProcName:='PKGCRCREDITO.STPGENINFCREDREL';
      stp.Params.Clear;
      stp.Params.CreateParam(ftDateTime,'PEFPROCESO',ptInput);
      stp.Params.CreateParam(ftDateTime,'PECVEUSUARIO',ptInput);
      stp.Params.CreateParam(ftDateTime,'PEBCOMMIT',ptInput);
      stp.Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
      stp.Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
      stp.Prepare;
      stp.ParamByName('peFProceso').AsDateTime := Objeto.F_TRIMESTRE.AsDateTime;
      stp.ParamByName('peCveUsuario').AsString := Objeto.Apli.Usuario;
      stp.ParamByName('peBCommit').AsString := 'V';
      stp.ExecProc;

      If stp.ParamByName('psResultado').AsInteger <> 0 Then Begin
          ShowMessage('Problemas con el proceso de carga de información: ' +
                      IntToStr(stp.ParamByName('psResultado').AsInteger)+ ':'+
                      stp.ParamByName('psTxResultado').AsString);
      End Else Begin
          ShowMessage('El Proceso se generó correctamente');
      End;
   Finally
      If stp <> Nil Then Begin
         stp.UnPrepare;
         stp.Free;
      End;
   End;
End;
End.
