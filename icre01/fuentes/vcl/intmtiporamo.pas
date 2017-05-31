// Sistema         : Clase de CR_GA_TIPO_RAMO
// Fecha de Inicio : 08/07/2004
// Función forma   : Clase de CR_GA_TIPO_RAMO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMTipoRamo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre;

Type
 TMTipoRamo= class;

  TwMTipoRamo=Class(TForm)
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
    edCVE_TIPO_RAMO: TEdit;
    Label3: TLabel;
    edDESC_TIPO_RAMO: TEdit;
    Label4: TLabel;
    rgSITUACION: TRadioGroup;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIF: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edCVE_TIPO_RAMOExit(Sender: TObject);
    procedure edDESC_TIPO_RAMOExit(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure rgSITUACIONExit(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMTipoRamo;
    end;

 TMTipoRamo= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_TIPO_RAMO        : TInterCampo;
        DESC_TIPO_RAMO       : TInterCampo;

        SIT_TIPO_RAMO        : TInterCampo;
        F_ALTA               : TInterCampo;
        CVE_USU_ALTA         : TInterCampo;
        F_MODIFICA           : TInterCampo;
        CVE_USU_MODIFICA     : TInterCampo;

        ParamCre             : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMTipoRamo.Create( AOwner : TComponent );
begin Inherited;
   CVE_TIPO_RAMO :=CreaCampo('CVE_TIPO_RAMO',ftString,tsNinguno,tsNinguno,True);
      CVE_TIPO_RAMO.Caption:='Clave de Tipo de Ramo';
   DESC_TIPO_RAMO :=CreaCampo('DESC_TIPO_RAMO',ftString,tsNinguno,tsNinguno,True);
      DESC_TIPO_RAMO.Caption:='Descripción de Tipo de Ramo';
      DESC_TIPO_RAMO.NoCompare:= True;
   SIT_TIPO_RAMO :=CreaCampo('SIT_TIPO_RAMO',ftString,tsNinguno,tsNinguno,True);
   With SIT_TIPO_RAMO Do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   End;
      SIT_TIPO_RAMO.Caption:='Situación';
      SIT_TIPO_RAMO.NoCompare:= True;
   F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha de alta';
      F_ALTA.NoCompare:= True;
   CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Usuario de Alta';
      CVE_USU_ALTA.NoCompare:= True;
   F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
      F_MODIFICA.Caption:='Fecha de modificación';
      F_MODIFICA.NoCompare:= True;
   CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption:='Usuario de Modificación';
      CVE_USU_MODIFICA.NoCompare:= True;

   FKeyFields.Add('CVE_TIPO_RAMO');
   TableName := 'CR_GA_TIPO_RAMO';
   UseQuery := True;
   HelpFile := 'IntMTipoRamo.Hlp';
   ShowMenuReporte:=True;
end;


Destructor TMTipoRamo.Destroy;
begin
   Inherited;
end;

function TMTipoRamo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMTipoRamo;
begin
   W:=TWMTipoRamo.Create(Self);
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

Function TMTipoRamo.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMTipoRamo.it','S');
   Try
      if Active then begin
         T.Param(0,CVE_TIPO_RAMO.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

function TMTipoRamo.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_GA_TIPO_RAMO********************)
(*                                                                              *)
(*  FORMA DE CR_GA_TIPO_RAMO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_TIPO_RAMO********************)

procedure TwMTipoRamo.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      CVE_TIPO_RAMO.Control      := edCVE_TIPO_RAMO;
      DESC_TIPO_RAMO.Control     := edDESC_TIPO_RAMO;
      SIT_TIPO_RAMO.Control      := rgSITUACION;
      F_ALTA.Control             := edF_ALTA;
      CVE_USU_ALTA.Control       := edCVE_USU_ALTA;
      F_MODIFICA.Control         := edF_MODIFICA;
      CVE_USU_MODIFICA.Control   := edCVE_USU_MODIF;
      InterForma1.MsgPanel       := PnlMsg;
   End;
end;

procedure TwMTipoRamo.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CVE_TIPO_RAMO.Control     := Nil;
      DESC_TIPO_RAMO.Control    := Nil;
      SIT_TIPO_RAMO.Control     := Nil;
      F_ALTA.Control            := Nil;
      CVE_USU_ALTA.Control      := Nil;
      F_MODIFICA.Control        := Nil;
      CVE_USU_MODIFICA.Control  := Nil;
      InterForma1.MsgPanel      := Nil;
   End;
end;

procedure TwMTipoRamo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMTipoRamo.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
   End;
end;

procedure TwMTipoRamo.edCVE_TIPO_RAMOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     vlsql     : String;
     vlCveGar  : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_TIPO_RAMO.GetFromControl;

      If Objeto.CVE_TIPO_RAMO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del tipo de ramo';
      End Else Begin
         vlSql := ' SELECT * FROM CR_GA_TIPO_RAMO ' +
                  ' WHERE CVE_TIPO_RAMO ='+ Objeto.CVE_TIPO_RAMO.AsSQL;

         If InterForma1.IsNewData Then Begin
             GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_TIPO_RAMO',vlCveGar,False);
             If (vlCveGar <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La clave del tipo de ramo ya existe';
             End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_TIPO_RAMO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMTipoRamo.edDESC_TIPO_RAMOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_TIPO_RAMO,True,CNULL,True);
end;

procedure TwMTipoRamo.InterForma1DespuesNuevo(Sender: TObject);
begin
   edCVE_TIPO_RAMO.SetFocus;
end;

procedure TwMTipoRamo.InterForma1DespuesModificar(Sender: TObject);
begin
   edDESC_TIPO_RAMO.SetFocus;
end;

procedure TwMTipoRamo.InterForma1AntesAceptar(Sender: TObject;
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

procedure TwMTipoRamo.rgSITUACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSITUACION,True,CNULL,True);
end;

procedure TwMTipoRamo.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
Var
   sSQL: String;
   qyQuery: TQuery;
begin
   sSQL:='SELECT DISTINCT CVE_TIPO_RAMO FROM CR_GA_PAR_APOR WHERE CVE_TIPO_RAMO='+ Objeto.CVE_TIPO_RAMO.AsSQL;
   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      If qyQuery.FieldByName('CVE_TIPO_RAMO').AsString = Objeto.CVE_TIPO_RAMO.AsString Then Begin
         ShowMessage('El tipo de ramo tiene registros relacionados, no puede eliminarse');
         Realizado:= False;
      End;
      qyQuery.Free;
   End;
end;

end.
