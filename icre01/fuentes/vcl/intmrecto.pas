// Sistema         : Clase de TMReCto
// Fecha de Inicio : 24/05/2004
// Función forma   : Clase de TMReCto
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMReCto;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,
IntParamCre, IntSGCtrl, Menus, IntMProemio;

Type
 TMReCto= class;

  TwMReCto=Class(TForm)
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
    ilID_SOLICITUD: TInterLinkit;
    shp4: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Shape6: TShape;
    Label9: TLabel;
    sgcDATA: TSGCtrl;
    pmDoctos: TPopupMenu;
    edNUM_IMPRESION: TEdit;
    Label2: TLabel;
    edID_SOLICITUD: TInterEdit;
    Imprimir1: TMenuItem;
    edTX_ENCABEZADO: TMemo;
    BitBtn2: TBitBtn;
    VistaPreliminar1: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure btID_SOLICITUDClick(Sender: TObject);
    procedure ilID_SOLICITUDEjecuta(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure sgcDATADblClick(Sender: TObject);
    procedure ilID_SOLICITUDCapture(Sender: TObject; var Show: Boolean);
    procedure Imprimir1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure VistaPreliminar1Click(Sender: TObject);
    private
    { Private declarations }
        Procedure ImprimeReporte(bPreview:Boolean);
        Function  CadenaSql : String;
        Procedure MuestraDatos;
        Procedure MuestraCatalogo;
        Procedure Imprime(bPreview:Boolean);
    public
    { Public declarations }
    Objeto : TMReCto;
end;
 TMReCto= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_SOLICITUD              :TInterCampo;
        NUM_IMPRESION            :TInterCampo;
        Proemio                  : TMProemio;
        ParamCre                 : TParamCre;
        sTipoCto : String;
        bImprimir : Boolean;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation
Uses IntMCtrolImp,
     IntMQrCto;

{$R *.DFM}


constructor TMReCto.Create( AOwner : TComponent );
begin Inherited;

   ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,False);
      ID_SOLICITUD.Caption:='Identificador de la solicitud';
   NUM_IMPRESION :=CreaCampo('NUM_IMPRESION',ftFloat,tsNinguno,tsNinguno,False);
      NUM_IMPRESION.Caption:='Número de Impresión';

   Proemio := TMProemio.Create(Self);
   Proemio.MasterSource := Self;

   TableName := '';
   UseQuery := True;
   HelpFile := 'IntMReCto.Hlp';
   ShowMenuReporte:=True;
   bImprimir:= True;
end;

Destructor TMReCto.Destroy;
begin
   If Proemio <> Nil Then
      Proemio.Free;
   inherited;
end;


function TMReCto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMReCto;
begin
   W:=TwMReCto.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TMReCto.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TMReCto.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)


Function TwMReCto.CadenaSql : String;
Var
   vlsql : String;
Begin
   vlSql:='';
   Objeto.ID_SOLICITUD.GetFromControl;
   If Objeto.ID_SOLICITUD.AsInteger <> 0 Then Begin
      vlsql := ' SELECT NVL(CTRL.ID_SOLICITUD,0)ID_SOLICITUD, NVL(CTRL.NUM_IMPRESION,0)NUM_IMPRESION, '+
               '        CTRL.CVE_CTO_CRE, CTO.DESC_L_CONTRATO, '+
               '        CTRL.TX_ENCABEZADO, CTRL.CVE_USU_IMP, '+
               '        P.NOMBRE, CTRL.F_IMPRESION, '+
               '        (SELECT NVL(Count(*),0) FROM CR_CT_CONTROL_IM WHERE ID_SOLICITUD ='+Objeto.ID_SOLICITUD.AsString +
                        ') TOTAL '+
               '   FROM CR_CT_CONTROL_IM CTRL, CR_CT_CONTRATO_C CTO, USUARIO USU, PERSONA P'+
               '  WHERE CTRL.ID_SOLICITUD ='+ Objeto.ID_SOLICITUD.AsString +
               '    AND CTRL.CVE_CTO_CRE = CTO.CVE_CTO_CRE '+
               '    AND CTRL.CVE_USU_IMP = USU.CVE_USUARIO '+
               '    AND USU.ID_PERSONA   = P.ID_PERSONA '+
               ' ORDER BY CTRL.ID_SOLICITUD, CTRL.NUM_IMPRESION';

   End;
   CadenaSql := vlSql;
End;

Procedure TwMReCto.MuestraDatos;
Var
   vlQry : TQuery;
   sSQL :String;
Begin
   sSQL:= CadenaSql;
   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Try
         if vlQry <> nil Then Begin

            vlQry.FieldByName('CVE_CTO_CRE').Visible  := False;
            vlQry.FieldByName('CVE_USU_IMP').Visible  := False;
            vlQry.FieldByName('ID_SOLICITUD').DisplayLabel  := 'ID_SOLICITUD' + #30 +'>C';
            vlQry.FieldByName('NUM_IMPRESION').DisplayLabel := 'NUM_IMPRESION' + #30 +'>C';
            vlQry.FieldByName('DESC_L_CONTRATO').DisplayLabel  := 'DESC_L_CONTRATO' + #30 +'>C';
            vlQry.FieldByName('TX_ENCABEZADO').Visible  := False;
            vlQry.FieldByName('NOMBRE').DisplayLabel:= 'NOMBRE' + #30 +'>C';
            vlQry.FieldByName('F_IMPRESION').DisplayLabel  := 'F_IMPRESION' + #30 +'>C';
            vlQry.FieldByName('TOTAL').Visible  := False;

            vlQry.FieldByName('ID_SOLICITUD').DisplayWidth  := 11;
            vlQry.FieldByName('NUM_IMPRESION').DisplayWidth := 9;
            vlQry.FieldByName('DESC_L_CONTRATO').DisplayWidth  := 21;
            vlQry.FieldByName('NOMBRE').DisplayWidth:= 25;
            vlQry.FieldByName('F_IMPRESION').DisplayWidth  := 22;

            sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,False);
            Objeto.NUM_IMPRESION.AsString:=sgcDATA.CellStr['TOTAL',sgcDATA.SG.Row];
            Objeto.sTipoCto :=sgcDATA.CellStr['CVE_CTO_CRE',sgcDATA.SG.Row];
         End Else Begin
           sgcDATA.Clear('NO SE ENCONTRARON DATOS'#30'>C');
           Objeto.NUM_IMPRESION.AsInteger:= 0;
           Objeto.sTipoCto :='';
         End;
      finally
         if vlQry <> nil Then
            vlQry.free;
      End;
   End;
End;

procedure TwMReCto.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_SOLICITUD.Control   := edID_SOLICITUD;
      NUM_IMPRESION.Control  := edNUM_IMPRESION;
   End;

   Objeto.Proemio.ID_SOLICITUD.Control := edID_SOLICITUD;
   Objeto.Proemio.Persona.Nombre.Control := edNOM_ID_SOLICITUD;
   Objeto.Proemio.GetParams(Objeto);
End;

procedure TwMReCto.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_SOLICITUD.Control    := Nil;
      NUM_IMPRESION.Control  := Nil;
   End;

   Objeto.Proemio.ID_SOLICITUD.Control := NIL;
   Objeto.Proemio.Persona.Nombre.Control := NIL;
end;

procedure TwMReCto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMReCto.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMReCto.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWNinguno.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TwMReCto.InterForma1BtnPreviewClick(Sender: TObject);
begin
   MuestraCatalogo;
   MuestraDatos;
end;

procedure TwMReCto.InterForma1BtnImprimirClick(Sender: TObject);
begin
   ImprimeReporte(True);
   MuestraDatos;
end;
Procedure TwMReCto.ImprimeReporte(bPreview:Boolean);    //
Var
   MCtrolImp : TMCtrolImp;
begin
   If Objeto.ID_SOLICITUD.AsInteger <> 0 Then Begin
         MCtrolImp:= TMCtrolImp.Create(Nil);
      Try
         MCtrolImp.Apli:= Objeto.Apli;
         MCtrolImp.ParamCre:= Objeto.ParamCre;
         MCtrolImp.MProemio:= Objeto.Proemio;
         MCtrolImp.sTipoCto:= Objeto.sTipoCto;
         MCtrolImp.bPreview := bPreview;
         MCtrolImp.Nuevo;
      Finally
         MCtrolImp.Free;
      End;
      MuestraDatos;
   End Else Begin
      ShowMessage('Debe seleccionar un número de solicitud');
   End;
End;

procedure TwMReCto.btID_SOLICITUDClick(Sender: TObject);
begin
   Objeto.Proemio.BuscaWhereString := ' CR_CT_PROEMIO_PM.SIT_SOLICITUD =''AC'' ';
   Objeto.Proemio.FilterString := Objeto.Proemio.BuscaWhereString;
   Objeto.Proemio.ShowAll := True;
   if Objeto.Proemio.Busca then begin
      MuestraDatos;
      InterForma1.NextTab(btID_SOLICITUD);
   end;
end;

procedure TwMReCto.ilID_SOLICITUDEjecuta(Sender: TObject);
begin
   if Objeto.Proemio.FindKey([ilID_SOLICITUD.Buffer]) then begin
      MuestraDatos;
      InterForma1.NextTab(edID_SOLICITUD);
   end;
end;

procedure TwMReCto.InterForma1DespuesShow(Sender: TObject);
begin
   edID_SOLICITUD.SetFocus;
end;

Procedure TwMReCto.MuestraCatalogo;
Var
   MCtrolImp : TMCtrolImp;
Begin
   edID_SOLICITUD.SetFocus;
   If Objeto.ID_SOLICITUD.AsInteger <> 0 Then Begin
      If Objeto.NUM_IMPRESION.AsInteger <> 0 Then Begin
         MCtrolImp:= TMCtrolImp.Create(Nil);
         Try
            MCtrolImp.Apli:= Objeto.Apli;
            MCtrolImp.ParamCre:= Objeto.ParamCre;
            MCtrolImp.MProemio:= Objeto.Proemio;
            MCtrolImp.sTipoCto:= Objeto.sTipoCto;
            MCtrolImp.FindKey([sgcDATA.CellStr['ID_SOLICITUD',sgcDATA.SG.Row],
                               sgcDATA.CellStr['NUM_IMPRESION',sgcDATA.SG.Row]]);
            MCtrolImp.Catalogo;
         Finally
            MCtrolImp.Free;
         End;
         MuestraDatos;
      End;
   End Else Begin
      ShowMessage('Debe seleccionar una solicitud');
   End;
End;
procedure TwMReCto.sgcDATADblClick(Sender: TObject);
begin
   MuestraCatalogo;
   MuestraDatos;
end;

procedure TwMReCto.ilID_SOLICITUDCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

Procedure TwMReCto.Imprime(bPreview:Boolean);
Var
   sSQL:String;
   qyQuery:TQuery;
   stpInserta : TStoredProc;
   sDetalle: WideString;
begin
   If Objeto.ID_SOLICITUD.AsInteger <> 0 Then Begin
      sDetalle:= TrimRight(edTX_ENCABEZADO.Lines.Text);
      sDetalle:= AdjustLineBreaks(edTX_ENCABEZADO.Lines.Text);
      sSQL:='SELECT (NVL(Max(NUM_IMPRESION),0)+1)NUM FROM CR_CT_CONTROL_IM ' +
            ' WHERE ID_SOLICITUD ='+ Objeto.ID_SOLICITUD.AsSQL;
      qyQuery:= GetSQLQuery(sSQL,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      If qyQuery<> Nil Then
      Begin
         Objeto.NUM_IMPRESION.AsString:=qyQuery.FieldByName('NUM').AsString;
         qyQuery.Free;
      End
      Else
      Begin
           Objeto.NUM_IMPRESION.AsString:='1';
      End;
      Try
            stpInserta:=TStoredProc.Create(Nil);
            stpInserta.DatabaseName:=Objeto.Apli.DataBaseName;
            stpInserta.SessionName:=Objeto.Apli.SessionName;
            stpInserta.StoredProcName:='PKGCRDOCUMENTACION.STP_ALTAIMPRESION';
            stpInserta.Params.Clear;
            stpInserta.Params.CreateParam(ftFloat,'PE_ID_SOLICITUD',ptInput);
            stpInserta.Params.CreateParam(ftFloat,'PE_NUM_IMPRESION',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_CTO_CRE',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_USU_IMP',ptInput);
            stpInserta.Params.CreateParam(ftDateTime,'PE_F_IMPRESION',ptInput);
            stpInserta.Params.CreateParam(ftDateTime,'PE_F_CONTRATO',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_NUEVO',ptInput);
            stpInserta.Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
            stpInserta.Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);
            stpInserta.Prepare;
            stpInserta.ParamByName('PE_ID_SOLICITUD').AsFloat := Objeto.ID_SOLICITUD.AsFloat;
            stpInserta.ParamByName('PE_NUM_IMPRESION').AsFloat := Objeto.NUM_IMPRESION.AsFloat;
            stpInserta.ParamByName('PE_CVE_CTO_CRE').AsString := Objeto.Proemio.CVE_CTO_CRE.AsString;
            stpInserta.ParamByName('PE_CVE_USU_IMP').AsString := Objeto.Apli.Usuario;
            stpInserta.ParamByName('PE_F_IMPRESION').AsDateTime := Objeto.Apli.Fecha.GetSysDate;
            stpInserta.ParamByName('PE_F_CONTRATO').AsDateTime := Objeto.Proemio.F_SOLICITUD.AsDateTime;
            stpInserta.ParamByName('PE_NUEVO').AsString := 'T';
            stpInserta.ExecProc;

            If stpInserta.ParamByName('PS_RESULTADO').AsInteger <> 0 Then Begin
                ShowMessage('PROBLEMAS EN ALTA: ' +  IntToStr(stpInserta.ParamByName('PS_RESULTADO').AsInteger)+
                            stpInserta.ParamByName('PS_TX_RESULTADO').AsString);
            End;

      Finally
          If stpInserta <> Nil Then Begin
            stpInserta.UnPrepare;
            stpInserta.Free;
          End;
      End;
      RepCto(Objeto.ID_SOLICITUD.AsInteger,Objeto.NUM_IMPRESION.AsInteger,Objeto.Apli,bPreview, Objeto.bImprimir);
      MuestraDatos;
   End;
end;

procedure TwMReCto.VistaPreliminar1Click(Sender: TObject);
begin
     Imprime(True);
end;

procedure TwMReCto.Imprimir1Click(Sender: TObject);
begin
     Imprime(False);
end;

procedure TwMReCto.BitBtn2Click(Sender: TObject);
begin
     Imprime(False);
end;

end.

