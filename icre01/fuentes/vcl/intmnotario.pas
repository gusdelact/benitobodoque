// Sistema         : Clase de CR_GA_NOTARIO
// Fecha de Inicio : 18/08/2004
// Función forma   : Clase de CR_GA_NOTARIO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMNotario;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre, IntMPers, Intdom;

Type
 TMNotario= class;

  TwMNotario=Class(TForm)
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
    Label5: TLabel;
    edID_PERSONA: TEdit;
    btID_PERSONA: TBitBtn;
    edNOM_ID_PERSONA: TEdit;
    ilID_PERSONA: TInterLinkit;
    Label6: TLabel;
    edID_DOMICILIO: TEdit;
    btID_DOMICILIO: TBitBtn;
    edNOM_ID_DOMICILIO: TEdit;
    ilID_DOMICILIO: TInterLinkit;
    cbxB_NOTARIO: TCheckBox;
    edNUM_REGISTRO: TEdit;
    Label3: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure rgSITUACIONExit(Sender: TObject);
    procedure btID_PERSONAClick(Sender: TObject);
    procedure ilID_PERSONACapture(Sender: TObject; var Show: Boolean);
    procedure ilID_PERSONAEjecuta(Sender: TObject);
    procedure btID_DOMICILIOClick(Sender: TObject);
    procedure ilID_DOMICILIOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_DOMICILIOEjecuta(Sender: TObject);
    procedure edID_PERSONAExit(Sender: TObject);
    procedure edID_DOMICILIOExit(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure cbxB_NOTARIOExit(Sender: TObject);
    procedure edNUM_REGISTROExit(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMNotario;
    end;

 TMNotario= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_NOTARIO          : TInterCampo;
        NUM_REGISTRO        : TInterCampo;
        B_NOTARIO           : TInterCampo;
        ID_DOMICILIO        : TInterCampo;
        SIT_NOTARIO         : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;

        ParamCre            : TParamCre;
        Persona             : TMPersona;
        Domicilio           : TDomicilio;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMNotario.Create( AOwner : TComponent );
begin Inherited;

   ID_NOTARIO :=CreaCampo('ID_NOTARIO',ftFloat,tsNinguno,tsNinguno,True);
      ID_NOTARIO.Caption:='Identificador de notario';
   NUM_REGISTRO :=CreaCampo('NUM_REGISTRO',ftString,tsNinguno,tsNinguno,True);
      NUM_REGISTRO.Caption:='Número de registro';
      NUM_REGISTRO.NoCompare:= True;
   B_NOTARIO :=CreaCampo('B_NOTARIO',ftString,tsNinguno,tsNinguno,True);
      B_NOTARIO.Caption:='Número de registro';
      B_NOTARIO.NoCompare:= True;
   ID_DOMICILIO :=CreaCampo('ID_DOMICILIO',ftFloat,tsNinguno,tsNinguno,True);
      ID_DOMICILIO.Caption:='Identificador de Domicilio';
      ID_DOMICILIO.NoCompare:= True;
   SIT_NOTARIO :=CreaCampo('SIT_NOTARIO',ftString,tsNinguno,tsNinguno,True);
   With SIT_NOTARIO Do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   End;
      SIT_NOTARIO.Caption:='Situación';
      SIT_NOTARIO.NoCompare:= True;

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

   FKeyFields.Add('ID_NOTARIO');
   TableName := 'CR_GA_NOTARIO';
   UseQuery := True;
   HelpFile := 'IntMNotario.Hlp';
   ShowMenuReporte:=True;

   Persona := TMPersona.Create(Self);
   Persona.FilterBy := fbTMPersonaFisica;
   Persona.MasterSource := Self;
   Persona.FieldByName('ID_PERSONA').MasterField := 'ID_NOTARIO';

   Domicilio := TDomicilio.Create(Self);
   Domicilio.MasterSource:=Self;
   Domicilio.FieldByName('ID_DOMICILIO').MasterField:='ID_DOMICILIO';

end;


Destructor TMNotario.Destroy;
begin
   If Persona <> Nil Then
      Persona.Free;
   If Domicilio <> Nil Then
      Domicilio.Free;
   Inherited;
end;

function TMNotario.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMNotario;
begin
   W:=TWMNotario.Create(Self);
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

Function TMNotario.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMNotario.it','F');
   Try
      if Active then begin
         T.Param(0,ID_NOTARIO.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

function TMNotario.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_GA_NOTARIO********************)
(*                                                                              *)
(*  FORMA DE CR_GA_NOTARIO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_NOTARIO********************)

procedure TwMNotario.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_NOTARIO.Control        := edID_PERSONA;
      NUM_REGISTRO.Control      := edNUM_REGISTRO;
      B_NOTARIO.Control         := cbxB_NOTARIO;
      ID_DOMICILIO.Control      := edID_DOMICILIO;
      SIT_NOTARIO.Control       := rgSITUACION;
      F_ALTA.Control            := edF_ALTA;
      CVE_USU_ALTA.Control      := edCVE_USU_ALTA;
      F_MODIFICA.Control        := edF_MODIFICA;
      CVE_USU_MODIFICA.Control  := edCVE_USU_MODIF;
      InterForma1.MsgPanel      := PnlMsg;
   End;

   Objeto.Persona.ID_Persona.Control :=edID_PERSONA;
   Objeto.Persona.Nombre.Control :=edNOM_ID_PERSONA;
   Objeto.Persona.GetParams(Objeto);
   edNOM_ID_PERSONA.Hint := Objeto.Persona.Nombre.AsString;
   edNOM_ID_PERSONA.ShowHint := True;

   Objeto.Domicilio.IdDomicilio.Control := edID_DOMICILIO;
   Objeto.Domicilio.CalleNumero.Control := edNOM_ID_DOMICILIO;
   Objeto.Domicilio.GetParams(Objeto);
end;

procedure TwMNotario.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_NOTARIO.Control        := Nil;
      NUM_REGISTRO.Control     := Nil;
      B_NOTARIO.Control         := Nil;
      ID_DOMICILIO.Control      := Nil;
      SIT_NOTARIO.Control       := Nil;
      F_ALTA.Control            := Nil;
      CVE_USU_ALTA.Control      := Nil;
      F_MODIFICA.Control        := Nil;
      CVE_USU_MODIFICA.Control  := Nil;
      InterForma1.MsgPanel      := Nil;
   End;
   Objeto.Persona.ID_Persona.Control := Nil;
   Objeto.Persona.Nombre.Control := Nil;
   Objeto.Domicilio.IdDomicilio.Control := Nil;
   Objeto.Domicilio.CalleNumero.Control := Nil;
end;

procedure TwMNotario.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMNotario.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
   End;
end;

procedure TwMNotario.InterForma1AntesAceptar(Sender: TObject;
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

procedure TwMNotario.rgSITUACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSITUACION,True,CNULL,True);
end;

procedure TwMNotario.btID_PERSONAClick(Sender: TObject);
begin
   Objeto.Persona.ShowAll := True;
   If Objeto.Persona.Busca Then Begin
      InterForma1.NextTab(edID_PERSONA);
   End;
end;

procedure TwMNotario.ilID_PERSONACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show :=(InterForma1.IsNewData);
end;

procedure TwMNotario.ilID_PERSONAEjecuta(Sender: TObject);
begin
   If Objeto.Persona.FindKey([ilID_PERSONA.Buffer]) Then Begin
      InterForma1.NextTab(edID_PERSONA);
   End;
end;

procedure TwMNotario.btID_DOMICILIOClick(Sender: TObject);
begin
   Objeto.Domicilio.ShowAll := True;
   If Objeto.Domicilio.Busca Then Begin
      InterForma1.NextTab(edID_DOMICILIO);
   End;
end;

procedure TwMNotario.ilID_DOMICILIOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := (InterForma1.CanEdit)or(InterForma1.IsNewData);
end;

procedure TwMNotario.ilID_DOMICILIOEjecuta(Sender: TObject);
begin
   If Objeto.Domicilio.FindKey([ilID_DOMICILIO.Buffer]) Then
      InterForma1.NextTab(edID_DOMICILIO);
end;

procedure TwMNotario.edID_PERSONAExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg, sSQL :  String;
     qyQuery: TQuery;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_NOTARIO.GetFromControl;
      If Objeto.ID_NOTARIO.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el Identificador del Notario';
      End Else Begin
         If InterForma1.IsNewData Then Begin
            sSQL:= 'SELECT ID_NOTARIO FROM CR_GA_NOTARIO WHERE ID_NOTARIO ='+ Objeto.ID_NOTARIO.AsSQL;
            qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            If qyQuery <> Nil Then Begin
               If qyQuery.FieldByName('ID_NOTARIO').AsInteger = Objeto.ID_NOTARIO.AsInteger Then Begin
                  vlSalida   := False;
                  vlMsg := 'Ésta persona ya existe como Notario o Corredor';
               End;
               qyQuery.Free;
            End;
         End;
      End;
      InterForma1.ValidaExit(edID_PERSONA,vlSalida,vlMsg,True);
   end;
end;

procedure TwMNotario.edID_DOMICILIOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_DOMICILIO.GetFromControl;
      if Objeto.ID_DOMICILIO.AsFloat = 0 then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique el Identificador del Domicilio';
      end;
      InterForma1.ValidaExit(edID_DOMICILIO,vlSalida,vlMsg,True);
   end;
end;

procedure TwMNotario.InterForma1DespuesNuevo(Sender: TObject);
begin
   cbxB_NOTARIO.Checked:= True;
   rgSITUACION.ItemIndex:= 0;
   edID_PERSONA.SetFocus;
end;

procedure TwMNotario.InterForma1DespuesModificar(Sender: TObject);
begin
   cbxB_NOTARIO.SetFocus;
end;

procedure TwMNotario.cbxB_NOTARIOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbxB_NOTARIO,True,CNULL,True);
end;

procedure TwMNotario.edNUM_REGISTROExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.NUM_REGISTRO.GetFromControl;
      If Objeto.NUM_REGISTRO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el número de registro';
      End;
      InterForma1.ValidaExit(edNUM_REGISTRO,vlSalida,vlMsg,True);
   End;
end;

end.
