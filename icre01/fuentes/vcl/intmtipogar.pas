// Sistema         : Clase de CR_GA_TIPO_GAR
// Fecha de Inicio : 23/06/2004
// Función forma   : Clase de CR_GA_TIPO_GAR
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMTipoGar;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre;

Type
 TMTipoGar= class;

  TwMTipoGar=Class(TForm)
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
    edCVE_TIPO_GAR: TEdit;
    Label3: TLabel;
    edDESC_TIPO_GAR: TEdit;
    Label4: TLabel;
    Button1: TButton;
    Label1: TLabel;
    edID_TIPO_GAR: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edCVE_TIPO_GARExit(Sender: TObject);
    procedure edDESC_TIPO_GARExit(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure Button1Click(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMTipoGar;
    end;

 TMTipoGar= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        //Se agrega este Campo, para el Consecutivo CNBV:
        ID_TIPO_GAR         : TInterCampo;
        CVE_TIPO_GAR        : TInterCampo;
        DESC_TIPO_GAR       : TInterCampo;

        ParamCre            : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMTipoGar.Create( AOwner : TComponent );
begin Inherited;
      //Se agrega este Campo, para el Consecutivo CNBV:
      ID_TIPO_GAR   :=CreaCampo('ID_TIPO_GAR',ftInteger,tsNinguno,tsNinguno,True);
      ID_TIPO_GAR.Caption:='Cve. CNBV';
      ID_TIPO_GAR.NoCompare:= False;

      CVE_TIPO_GAR :=CreaCampo('CVE_TIPO_GAR',ftString,tsNinguno,tsNinguno,True);
      CVE_TIPO_GAR.Caption:='Clave de Contrato';
      CVE_TIPO_GAR.NoCompare:= False;
      DESC_TIPO_GAR :=CreaCampo('DESC_TIPO_GAR',ftString,tsNinguno,tsNinguno,True);
      DESC_TIPO_GAR.Caption:='Descripción de Contrato';
      DESC_TIPO_GAR.NoCompare:= True;

   FKeyFields.Add('CVE_TIPO_GAR');
   TableName := 'CR_GA_TIPO_GAR';
   UseQuery := True;
   HelpFile := 'IntMTipoGar.Hlp';
   ShowMenuReporte:=True;
end;


Destructor TMTipoGar.Destroy;
begin
   Inherited;
end;

function TMTipoGar.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMTipoGar;
begin
   W:=TWMTipoGar.Create(Self);
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

Function TMTipoGar.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMTipoGar.it','S');
   Try
      if Active then begin
         T.Param(0,CVE_TIPO_GAR.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

function TMTipoGar.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_GA_TIPO_GAR********************)
(*                                                                              *)
(*  FORMA DE CR_GA_TIPO_GAR                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_TIPO_GAR********************)

procedure TwMTipoGar.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      //Se agrega este Campo, Identificador CNBV:
      ID_TIPO_GAR.Control       := edID_TIPO_GAR;
      CVE_TIPO_GAR.Control      := edCVE_TIPO_GAR;
      DESC_TIPO_GAR.Control     := edDESC_TIPO_GAR;
      InterForma1.MsgPanel      := PnlMsg;
   End;
end;

procedure TwMTipoGar.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_TIPO_GAR.Control      := Nil;
      CVE_TIPO_GAR.Control     := Nil;
      DESC_TIPO_GAR.Control    := Nil;
      InterForma1.MsgPanel     := Nil;
   End;
end;

procedure TwMTipoGar.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMTipoGar.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
   End;
end;

procedure TwMTipoGar.edCVE_TIPO_GARExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     vlsql     : String;
     vlCveGar  : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_TIPO_GAR.GetFromControl;

      If Objeto.CVE_TIPO_GAR.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave de la garantía';
      End Else Begin
         vlSql := ' SELECT * FROM CR_GA_TIPO_GAR ' +
                  ' WHERE CVE_TIPO_GAR ='+ Objeto.CVE_TIPO_GAR.AsSQL;

         If InterForma1.IsNewData Then Begin
             GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_TIPO_GAR',vlCveGar,False);
             If (vlCveGar <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La clave de la garantía ya existe';
             End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_TIPO_GAR,vlSalida,vlMsg,True);
   End;
end;

procedure TwMTipoGar.edDESC_TIPO_GARExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_TIPO_GAR,True,CNULL,True);
end;

procedure TwMTipoGar.InterForma1DespuesNuevo(Sender: TObject);
begin
   edCVE_TIPO_GAR.SetFocus;
end;

procedure TwMTipoGar.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
Var
   sSQL: String;
   qyQuery: TQuery;
begin
   sSQL:='SELECT DISTINCT CVE_TIPO_GAR FROM CR_GA_GARANTIA WHERE CVE_TIPO_GAR='+ Objeto.CVE_TIPO_GAR.AsSQL;
   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      If qyQuery.FieldByName('CVE_TIPO_GAR').AsString = Objeto.CVE_TIPO_GAR.AsString Then Begin
         ShowMessage('Ésta clasificación tiene registros relacionados, no puede ser eliminada');
         Realizado:= False;
      End;
      qyQuery.Free;
   End;
end;

procedure TwMTipoGar.Button1Click(Sender: TObject);
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

end.
