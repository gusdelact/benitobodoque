// Sistema         : Clase de DO_MEDIO
// Fecha de Inicio : 10/08/2004
// Función forma   : Clase de DO_MEDIO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMDoMedio;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, InterEdit;

Type
 TMDoMedio= class;

  TwMDoMedio=Class(TForm)
    InterForma1             : TInterForma;
    lbDESC_EXCEPCION : TLabel;
    edDESC_MEDIO: TEdit;
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
    edCVE_MEDIO: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edNIVEL_MEDIO: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edCVE_MEDIOExit(Sender: TObject);
    procedure edDESC_MEDIOExit(Sender: TObject);
    procedure edNIVEL_MEDIOExit(Sender: TObject);
    procedure edNIVEL_MEDIOKeyPress(Sender: TObject; var Key: Char);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMDoMedio;
    end;

 TMDoMedio= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_MEDIO                : TInterCampo;
        DESC_MEDIO               : TInterCampo;
        NIVEL_MEDIO              : TInterCampo;

        ParamCre                 : TParamCre;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMDoMedio.Create( AOwner : TComponent );
begin Inherited;
   CVE_MEDIO :=CreaCampo('CVE_MEDIO',ftString,tsNinguno,tsNinguno,True);
      CVE_MEDIO.Caption:='Identificador de Medio';
      CVE_MEDIO.NoCompare:= False;
   DESC_MEDIO :=CreaCampo('DESC_MEDIO',ftString,tsNinguno,tsNinguno,True);
      DESC_MEDIO.Caption:='Descripción de Medio';
      DESC_MEDIO.NoCompare:= True;
   NIVEL_MEDIO :=CreaCampo('NIVEL_MEDIO',ftFloat,tsNinguno,tsNinguno,True);
      NIVEL_MEDIO.Caption:='Nivel de Medio';
      NIVEL_MEDIO.NoCompare:= True;

   FKeyFields.Add('CVE_MEDIO');
   TableName := 'DO_MEDIO';
   UseQuery := True;
   HelpFile := 'IntMDoMedio.Hlp';
   ShowMenuReporte:=True;

end;


Destructor TMDoMedio.Destroy;
begin
   Inherited;
end;

function TMDoMedio.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMDoMedio;
begin
   W:=TWMDoMedio.Create(Self);
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

Function TMDoMedio.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMDoMedio.it','S');
   Try
      if Active then begin
         T.Param(0,CVE_MEDIO.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

function TMDoMedio.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA DO_MEDIO********************)
(*                                                                              *)
(*  FORMA DE DO_MEDIO                                                            *)
(*                                                                              *)
(***********************************************FORMA DO_MEDIO********************)

procedure TwMDoMedio.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      CVE_MEDIO.Control    := edCVE_MEDIO;
      DESC_MEDIO.Control   := edDESC_MEDIO;
      NIVEL_MEDIO.Control  := edNIVEL_MEDIO;
      InterForma1.MsgPanel := PnlMsg;
   End;
end;

procedure TwMDoMedio.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CVE_MEDIO.Control        := Nil;
      DESC_MEDIO.Control       := Nil;
      NIVEL_MEDIO.Control      := Nil;
      InterForma1.MsgPanel     := Nil;
   End;
end;

procedure TwMDoMedio.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMDoMedio.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
   End;
end;

procedure TwMDoMedio.edCVE_MEDIOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg, vlsql, vlCveMedio :  String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_MEDIO.GetFromControl;

      If Objeto.CVE_MEDIO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del Medio';
      End Else Begin
         vlSql := ' SELECT CVE_MEDIO FROM DO_MEDIO ' +
                  ' WHERE CVE_MEDIO ='+ Objeto.CVE_MEDIO.AsSQL;

         If InterForma1.IsNewData Then Begin
             GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_MEDIO',vlCveMedio,False);
             If (vlCveMedio <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La clave del Medio ya Existe';
             End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_MEDIO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMDoMedio.edDESC_MEDIOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.DESC_MEDIO.GetFromControl;
      if Objeto.DESC_MEDIO.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la descripción del Medio';
      end;
      InterForma1.ValidaExit(edDESC_MEDIO,vlSalida,vlMsg,True);
   end;
end;

procedure TwMDoMedio.edNIVEL_MEDIOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.NIVEL_MEDIO.GetFromControl;
      If Objeto.NIVEL_MEDIO.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la prelación entre medios';
      End;
      InterForma1.ValidaExit(edNIVEL_MEDIO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMDoMedio.edNIVEL_MEDIOKeyPress(Sender: TObject;
  var Key: Char);
begin
   If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
end;

procedure TwMDoMedio.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
Var
   sSQL:String;
   qyQuery:TQuery;
begin
   sSQL:=' SELECT DISTINCT CVE_MEDIO FROM DO_RECEP_TRAM '+
         '  WHERE CVE_MEDIO = '+ Objeto.CVE_MEDIO.AsSQL;
   qyQuery:= GetSQLQuery(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
   If qyQuery <> Nil Then Begin
      While not qyQuery.Eof Do Begin
         If qyQuery.FieldByName('CVE_MEDIO').AsString = Objeto.CVE_MEDIO.AsString Then Begin
            ShowMessage('El Medio '''+ Objeto.CVE_MEDIO.AsString +
                        ''' está asociado a un trámite, No puede ser eliminado');
            Realizado:=False;
            Exit;
         End;
         qyQuery.Next;
      End;
      qyQuery.Free;
   End Else
      Realizado:=True;
end;

procedure TwMDoMedio.InterForma1DespuesNuevo(Sender: TObject);
begin
   edCVE_MEDIO.SetFocus;
end;

procedure TwMDoMedio.InterForma1DespuesModificar(Sender: TObject);
begin
   edDESC_MEDIO.SetFocus;
end;

end.
