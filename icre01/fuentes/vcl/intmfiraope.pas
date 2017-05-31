// Sistema         : Clase de CR_FIRA_OPERA
// Fecha de Inicio : 01/09/2004
// Función forma   : Clase de CR_FIRA_OPERA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMFiraOpe;
                                          
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre;

Type
 TMFiraOpe= class;

  TwMFiraOpe=Class(TForm)
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
    edCVE_OPERATIVA: TEdit;
    Label3: TLabel;
    edDESC_OPERATIVA: TEdit;
    Label4: TLabel;
    Button1: TButton;
    rgSIT_OPERATIVA: TRadioGroup;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edCVE_OPERATIVAExit(Sender: TObject);
    procedure edDESC_OPERATIVAExit(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure rgSIT_OPERATIVAExit(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMFiraOpe;
    end;

 TMFiraOpe= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_OPERATIVA        : TInterCampo;
        DESC_OPERATIVA       : TInterCampo;

        //HERJA
        SIT_OPERATIVA           : TInterCampo;
        //FIN HERJA

        ParamCre            : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;

        //HERJA
        procedure    STPREL_OPERATIVAS(PECVE_OPERATIVA, PENVA_SITUACION: String);
      published
      end;

implementation
{$R *.DFM}

constructor TMFiraOpe.Create( AOwner : TComponent );
begin Inherited;
   CVE_OPERATIVA :=CreaCampo('CVE_OPERATIVA',ftString,tsNinguno,tsNinguno,True);
      CVE_OPERATIVA.Caption:='Clave de Contrato';
      CVE_OPERATIVA.NoCompare:= False;
   DESC_OPERATIVA :=CreaCampo('DESC_OPERATIVA',ftString,tsNinguno,tsNinguno,True);
      DESC_OPERATIVA.Caption:='Descripción de Contrato';
      DESC_OPERATIVA.NoCompare:= True;

   //HERJA   
   SIT_OPERATIVA :=CreaCampo('SIT_OPERATIVA',ftString,tsNinguno,tsNinguno,True);
   With SIT_OPERATIVA do
   begin Size:=2;
         UseCombo:=True;
         ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
         ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
   end;
   SIT_OPERATIVA.Caption:='Situación de la Operativa';


   FKeyFields.Add('CVE_OPERATIVA');
   TableName := 'CR_FIRA_OPERA';
   UseQuery := True;
   HelpFile := 'IntMFiraOpe.Hlp';
   ShowMenuReporte:=True;
end;


Destructor TMFiraOpe.Destroy;
begin
   Inherited;
end;

function TMFiraOpe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMFiraOpe;
begin
   W:=TWMFiraOpe.Create(Self);
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

Function TMFiraOpe.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMFiraOpe.it','S');
   Try
      if Active then begin
         T.Param(0,CVE_OPERATIVA.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

function TMFiraOpe.Reporte:Boolean;
begin
   Result := False;
end;

procedure TMFiraOpe.STPREL_OPERATIVAS(PECVE_OPERATIVA, PENVA_SITUACION: String);
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


(***********************************************FORMA CR_FIRA_OPERA********************)
(*                                                                              *)
(*  FORMA DE CR_FIRA_OPERA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FIRA_OPERA********************)

procedure TwMFiraOpe.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      CVE_OPERATIVA.Control      := edCVE_OPERATIVA;
      DESC_OPERATIVA.Control     := edDESC_OPERATIVA;
      InterForma1.MsgPanel      := PnlMsg;

      //HERJA
      SIT_OPERATIVA.Control:=rgSIT_OPERATIVA;
//      InterForma1.BtnEliminar.Visible:=false;
   End;

end;

procedure TwMFiraOpe.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CVE_OPERATIVA.Control     := Nil;
      DESC_OPERATIVA.Control    := Nil;
      InterForma1.MsgPanel     := Nil;

      //HERJA
      SIT_OPERATIVA.Control:=nil;
   End;
end;

procedure TwMFiraOpe.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMFiraOpe.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
   End;
end;

procedure TwMFiraOpe.edCVE_OPERATIVAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg, vlsql, vlCveGar :  String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_OPERATIVA.GetFromControl;

      If Objeto.CVE_OPERATIVA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave de la Operativa';
      End Else Begin
         vlSql := ' SELECT * FROM CR_FIRA_OPERA ' +
                  ' WHERE CVE_OPERATIVA ='+ Objeto.CVE_OPERATIVA.AsSQL;

         If InterForma1.IsNewData Then Begin
             GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_OPERATIVA',vlCveGar,False);
             If (vlCveGar <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La clave de la Operativa ya existe';
             End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_OPERATIVA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMFiraOpe.edDESC_OPERATIVAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_OPERATIVA,True,CNULL,True);
end;

procedure TwMFiraOpe.InterForma1DespuesNuevo(Sender: TObject);
begin
   rgSIT_OPERATIVA.ItemIndex := 0;
   Objeto.SIT_OPERATIVA.AsString := 'AC';   
   edCVE_OPERATIVA.SetFocus;
end;

procedure TwMFiraOpe.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
Var
   sSQL: String;
   qyQuery: TQuery;
begin
   sSQL:='SELECT DISTINCT CVE_OPERATIVA FROM CR_FIRA_EQUIV WHERE CVE_OPERATIVA='+ Objeto.CVE_OPERATIVA.AsSQL;
   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      If qyQuery.FieldByName('CVE_OPERATIVA').AsString = Objeto.CVE_OPERATIVA.AsString Then Begin
         ShowMessage('Ésta Operativa tiene registros relacionados, no puede ser eliminada');
         Realizado:= False;
      End;
      qyQuery.Free;
   End;

   //HERJA
   sSQL:='SELECT DISTINCT CVE_OPERATIVA FROM CR_CREDITO WHERE CVE_OPERATIVA='+ Objeto.CVE_OPERATIVA.AsSQL+
         ' AND SIT_CREDITO IN (''NA'', ''AC'') ';
   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      If qyQuery.FieldByName('CVE_OPERATIVA').AsString = Objeto.CVE_OPERATIVA.AsString Then Begin
         ShowMessage('Ésta Operativa tiene Creditos Activos o No Autorizados relacionados, no puede ser eliminada');
         Realizado:= False;
      End;
      qyQuery.Free;
   End;
end;

procedure TwMFiraOpe.Button1Click(Sender: TObject);
var
   sSQL, sSQL_1, sSQL_2: String;
   qyQuery, qyQuery_1: TQuery;
begin
   sSQL:='select cve_producto_cre from CR_PRODUCTO';
   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
   If qyQuery <> Nil Then Begin
      While not qyQuery.Eof Do Begin
         sSQL_1:= 'select CVE_GARANTIA from CR_GA_GARANTIA';
         qyQuery_1:= GetSQLQuery(sSQL_1, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
         If qyQuery_1 <> Nil Then Begin
            While not qyQuery_1.Eof Do Begin
               sSQL_2:= 'INSERT INTO  CR_GA_REL_PRO_GA (CVE_PRODUCTO_CRE,SIT_REL_PRO_GAR,'+
                        '  F_ALTA, CVE_USU_ALTA, F_MODIFICA,CVE_USU_MODIFICA,CVE_GARANTIA)'+
                        ' VALUES('''+ qyQuery.FieldByName('CVE_PRODUCTO_CRE').AsString+ ''','+
                         '''AC'',SYSDATE,''GOMR173'',NULL,NULL,'''+
                         qyQuery_1.FieldByName('CVE_GARANTIA').AsString+ ''')';
               RunSQL(sSQL_2, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
               qyQuery_1.Next;
            End;
            qyQuery_1.Free;
         End;
         qyQuery.Next;
      End;
      qyQuery.Free;
   End;
end;

procedure TwMFiraOpe.rgSIT_OPERATIVAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_OPERATIVA,True,'',True);
end;

procedure TwMFiraOpe.InterForma1DespuesAceptar(Sender: TObject);
begin
   ShowMessage('Se Actualizara tambien las Equivalencias Relacionadas a la Operativa');
   Objeto.STPREL_OPERATIVAS(Objeto.CVE_OPERATIVA.AsString, Objeto.SIT_OPERATIVA.AsString);
end;

end.
