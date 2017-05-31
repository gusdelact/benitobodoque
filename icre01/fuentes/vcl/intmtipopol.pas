// Sistema         : Clase de CR_GA_TIPO_POL
// Fecha de Inicio : 08/07/2004
// Función forma   : Clase de CR_GA_TIPO_POL
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMTipoPol;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre;

Type
 TMTipoPol= class;

  TwMTipoPol=Class(TForm)
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
    edCVE_TIPO_POL: TEdit;
    Label3: TLabel;
    edDESC_TIPO_POL: TEdit;
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
    procedure edCVE_TIPO_POLExit(Sender: TObject);
    procedure edDESC_TIPO_POLExit(Sender: TObject);
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
      Objeto : TMTipoPol;
    end;

 TMTipoPol= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_TIPO_POL        : TInterCampo;
        DESC_TIPO_POL       : TInterCampo;
        SIT_TIPO_POL        : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;

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

constructor TMTipoPol.Create( AOwner : TComponent );
begin Inherited;
   CVE_TIPO_POL :=CreaCampo('CVE_TIPO_POL',ftString,tsNinguno,tsNinguno,True);
      CVE_TIPO_POL.Caption:='Clave de Contrato';
   DESC_TIPO_POL :=CreaCampo('DESC_TIPO_POL',ftString,tsNinguno,tsNinguno,True);
      DESC_TIPO_POL.Caption:='Descripción de tipo de póliza';
      DESC_TIPO_POL.NoCompare:= True;
   SIT_TIPO_POL :=CreaCampo('SIT_TIPO_POL',ftString,tsNinguno,tsNinguno,True);
   With SIT_TIPO_POL Do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   End;
      SIT_TIPO_POL.Caption:='Situación';
      SIT_TIPO_POL.NoCompare:= True;
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

   FKeyFields.Add('CVE_TIPO_POL');
   TableName := 'CR_GA_TIPO_POL';
   UseQuery := True;
   HelpFile := 'IntMTipoPol.Hlp';
   ShowMenuReporte:=True;
end;


Destructor TMTipoPol.Destroy;
begin
   Inherited;
end;

function TMTipoPol.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMTipoPol;
begin
   W:=TWMTipoPol.Create(Self);
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

Function TMTipoPol.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMTipoPol.it','S');
   Try
      if Active then begin
         T.Param(0,CVE_TIPO_POL.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

function TMTipoPol.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_GA_TIPO_POL********************)
(*                                                                              *)
(*  FORMA DE CR_GA_TIPO_POL                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_TIPO_POL********************)

procedure TwMTipoPol.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      CVE_TIPO_POL.Control      := edCVE_TIPO_POL;
      DESC_TIPO_POL.Control     := edDESC_TIPO_POL;
      SIT_TIPO_POL.Control      := rgSITUACION;
      F_ALTA.Control            := edF_ALTA;
      CVE_USU_ALTA.Control      := edCVE_USU_ALTA;
      F_MODIFICA.Control        := edF_MODIFICA;
      CVE_USU_MODIFICA.Control  := edCVE_USU_MODIF;
      InterForma1.MsgPanel      := PnlMsg;
   End;
end;

procedure TwMTipoPol.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CVE_TIPO_POL.Control     := Nil;
      DESC_TIPO_POL.Control    := Nil;
      SIT_TIPO_POL.Control     := Nil;
      F_ALTA.Control           := Nil;
      CVE_USU_ALTA.Control     := Nil;
      F_MODIFICA.Control       := Nil;
      CVE_USU_MODIFICA.Control := Nil;
      InterForma1.MsgPanel     := Nil;
   End;
end;

procedure TwMTipoPol.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMTipoPol.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
   End;
end;

procedure TwMTipoPol.edCVE_TIPO_POLExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     vlsql     : String;
     vlCveGar  : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_TIPO_POL.GetFromControl;

      If Objeto.CVE_TIPO_POL.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del tipo de póliza';
      End Else Begin
         vlSql := ' SELECT * FROM CR_GA_TIPO_POL ' +
                  ' WHERE CVE_TIPO_POL ='+ Objeto.CVE_TIPO_POL.AsSQL;

         If InterForma1.IsNewData Then Begin
             GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_TIPO_POL',vlCveGar,False);
             If (vlCveGar <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La clave del tipo de póliza ya existe';
             End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_TIPO_POL,vlSalida,vlMsg,True);
   End;
end;

procedure TwMTipoPol.edDESC_TIPO_POLExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_TIPO_POL,True,CNULL,True);
end;

procedure TwMTipoPol.InterForma1DespuesNuevo(Sender: TObject);
begin
   edCVE_TIPO_POL.SetFocus;
end;

procedure TwMTipoPol.InterForma1DespuesModificar(Sender: TObject);
begin
   edDESC_TIPO_POL.SetFocus;
end;

procedure TwMTipoPol.InterForma1AntesAceptar(Sender: TObject;
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

procedure TwMTipoPol.rgSITUACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSITUACION,True,CNULL,True);
end;

procedure TwMTipoPol.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
Var
   sSQL: String;
   qyQuery: TQuery;
begin
   sSQL:='SELECT DISTINCT CVE_TIPO_POL FROM CR_GA_SEGURO WHERE CVE_TIPO_POL='+ Objeto.CVE_TIPO_POL.AsSQL;
   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      If qyQuery.FieldByName('CVE_TIPO_POL').AsString = Objeto.CVE_TIPO_POL.AsString Then Begin
         ShowMessage('El tipo de póliza tiene registros relacionados, no puede eliminarse');
         Realizado:= False;
      End;
      qyQuery.Free;
   End;
end;

end.
