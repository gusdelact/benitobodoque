// Sistema         : Clase de CR_EMAIL_EMISOR
// Fecha de Inicio : 21/08/2003
// Función forma   : Clase de CR_EMAIL_EMISOR
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrEmaEmi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, IntGenCre,
IntCrEmisor, IntMInstDesc, IntLinkit;

Type
 TCrEmaEmi= class;

  TWCrEmailEmisor=Class(TForm)
    InterForma1             : TInterForma;
    grbxDestinatario: TGroupBox;
    lbEMAIL: TLabel;
    edEMAIL: TEdit;
    edNOMBRE: TEdit;
    lbNOMBRE: TLabel;
    pnlSituacion: TPanel;
    opSitActivo: TRadioButton;
    opSitCancelado: TRadioButton;
    lblSIT_MAIL_EMISOR: TLabel;
    grbxEmisor: TGroupBox;
    lbCVE_EMISOR_EXT: TLabel;
    edCVE_EMISOR_EXT: TEdit;
    edID_EMISOR: TEdit;
    lbID_EMISOR: TLabel;
    btnID_PERSONA: TBitBtn;
    edNom_Emisor: TEdit;
    lblFecha_Alta: TLabel;
    lblUsuario_Alta: TLabel;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    edF_ALTA: TEdit;
    edCVE_USU_ALTA: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label1: TLabel;
    edCVE_FND_ENT_DES: TEdit;
    edDESC_ENT_DES: TEdit;
    brnCVE_FND_ENT_DES: TBitBtn;
    ilCVE_FND_ENT_DES: TInterLinkit;
    MsgPanel: TPanel;
    ilEMISOR: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure opSitCanceladoClick(Sender: TObject);
    procedure btnID_PERSONAClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure brnCVE_FND_ENT_DESClick(Sender: TObject);
    procedure ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);
    procedure edID_EMISORExit(Sender: TObject);
    procedure ilEMISORCapture(Sender: TObject; var Show: Boolean);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure edNOMBREExit(Sender: TObject);
    procedure edEMAILExit(Sender: TObject);
    private
    { Private declarations }
     procedure Set_SitMAIL_EMISOR(strValue : String);
     function  Get_SitMAIL_EMISOR : String;

     procedure CheckRadioButtons(bCheck : Boolean);
     procedure MuestraDatosEmisor;
    public
    { Public declarations }
    Objeto : TCrEmaEmi;
     property  Situacion_MAIL_EMISOR : String Read Get_SitMAIL_EMISOR Write Set_SitMAIL_EMISOR;

end;
 TCrEmaEmi= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_FND_ENT_DES          : TInterCampo;
        ID_EMISOR                : TInterCampo;
        CVE_EMISOR_EXT           : TInterCampo;
        EMAIL                    : TInterCampo;
        NOMBRE                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        SIT_MAIL_EMISOR          : TInterCampo;

        ParamCre                 : TParamCre;
        Emisor                   : TCrEmisor;
        MInstDesc                : TMInstDesc;

        m_nDefaultID_EMISOR      : Integer;
        m_StrDefaultCVE_EMISOR_EXT : String;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
        m_CVE_FND_ENT_DES        : String;
{/ROIM}

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrEmaEmi.Create( AOwner : TComponent );
begin Inherited;
      m_nDefaultID_EMISOR := 0;
      m_StrDefaultCVE_EMISOR_EXT := '';
      m_CVE_FND_ENT_DES := '';

      CVE_FND_ENT_DES :=CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,True);
                CVE_FND_ENT_DES.Caption:='Clave de Fnd Ent Des';
      ID_EMISOR :=CreaCampo('ID_EMISOR',ftFloat,tsNinguno,tsNinguno,True);
                ID_EMISOR.Caption:='Número de Emisor';
      CVE_EMISOR_EXT :=CreaCampo('CVE_EMISOR_EXT',ftString,tsNinguno,tsNinguno,True);
                CVE_EMISOR_EXT.Caption:='Clave de Emisor Externo';
      EMAIL :=CreaCampo('EMAIL',ftString,tsNinguno,tsNinguno,True);
                EMAIL.Caption:='Email';
      NOMBRE :=CreaCampo('NOMBRE',ftString,tsNinguno,tsNinguno,True);
                NOMBRE.Caption:='Nombre';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      SIT_MAIL_EMISOR :=CreaCampo('SIT_MAIL_EMISOR',ftString,tsNinguno,tsNinguno,True);
                SIT_MAIL_EMISOR.Caption:='Situación Mail Emisor';

      FKeyFields.Add('CVE_FND_ENT_DES');
      FKeyFields.Add('ID_EMISOR');
      FKeyFields.Add('CVE_EMISOR_EXT');
      FKeyFields.Add('EMAIL');

      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource := Self;
      Emisor.FieldByName('CVE_FND_ENT_DES').MasterField:= 'CVE_FND_ENT_DES';
      Emisor.FieldByName('ID_ACREDITADO').MasterField := 'ID_EMISOR';

      MInstDesc := TMInstDesc.Create(Self);
      MInstDesc.MasterSource:= Self;
      MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField:= 'CVE_FND_ENT_DES';

      TableName := 'CR_EMAIL_EMISOR';
      UseQuery := True;
      HelpFile := 'IntCrEmaEmi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrEmaEmi.Destroy;
begin
   If Emisor <> nil Then
      Emisor.Free;
   if MInstDesc <> nil then
      MInstDesc.Free;
   inherited;
end;


function TCrEmaEmi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrEmailEmisor;
begin
   W:=TWCrEmailEmisor.Create(Self);
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


Function TCrEmaEmi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrEmEn.it','S,F,S,S');
      Try
         if Active then begin
            T.Param(0,CVE_FND_ENT_DES.AsString);
            T.Param(1,ID_EMISOR.AsString);
            T.Param(2,CVE_EMISOR_EXT.AsString);
            T.Param(3,EMAIL.AsString);
         end;
         if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
      finally  T.Free;
      end;
end;

function TCrEmaEmi.Reporte:Boolean;
begin Result := False;
end;


(***********************************************FORMA CR_EMAIL_EMISOR********************)
(*                                                                              *)
(*  FORMA DE CR_EMAIL_EMISOR                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_EMAIL_EMISOR********************)

procedure TWCrEmailEmisor.FormShow(Sender: TObject);
begin
   With Objeto Do Begin
      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

      CVE_FND_ENT_DES.Control    := edCVE_FND_ENT_DES;
      ID_EMISOR.Control          := edID_EMISOR;
      CVE_EMISOR_EXT.Control     := edCVE_EMISOR_EXT;
      EMAIL.Control              := edEMAIL;
      NOMBRE.Control             := edNOMBRE;
      CVE_USU_ALTA.Control       := edCVE_USU_ALTA;
      F_ALTA.Control             := edF_ALTA;
   End;

   Objeto.MInstDesc.CVE_FND_ENT_DES.Control:=edCVE_FND_ENT_DES;
   Objeto.MInstDesc.DESC_ENT_DES.Control:=edDESC_ENT_DES;
   Objeto.MInstDesc.GetParams(Objeto);
   Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrEmailEmisor.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CVE_FND_ENT_DES.Control    := NIL;
      ID_EMISOR.Control          := NIL;
      CVE_EMISOR_EXT.Control     := NIL;
      EMAIL.Control              := NIL;
      NOMBRE.Control             := NIL;
      CVE_USU_ALTA.Control       := NIL;
      F_ALTA.Control             := NIL;
   End;

   Objeto.MInstDesc.CVE_FND_ENT_DES.Control:=nil;
   Objeto.MInstDesc.DESC_ENT_DES.Control:=nil;
end;

procedure TWCrEmailEmisor.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrEmailEmisor.InterForma1DespuesNuevo(Sender: TObject);
begin
   edNom_Emisor.Text := '';
   With Objeto Do Begin
      If (m_nDefaultID_EMISOR <> 0)  Then Begin
         ID_EMISOR.AsInteger := m_nDefaultID_EMISOR;
         CVE_EMISOR_EXT.AsString := m_StrDefaultCVE_EMISOR_EXT;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
         Objeto.MInstDesc.FindKey([m_CVE_FND_ENT_DES]);
{/ROIM}
         MuestraDatosEmisor;
      End;
   End;
   Situacion_MAIL_EMISOR := CSIT_AC;
   If edCVE_FND_ENT_DES.CanFocus Then
      edCVE_FND_ENT_DES.SetFocus;
end;

procedure TWCrEmailEmisor.InterForma1DespuesModificar(Sender: TObject);
begin
   If edID_EMISOR.CanFocus Then edID_EMISOR.SetFocus;
end;

//procedure TWCrEmailEmisor.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;

// ******* Implementation of Properties *******

function TWCrEmailEmisor.Get_SitMAIL_EMISOR: String;
begin
   If opSitActivo.Checked Then
      Result := CSIT_AC
   Else Result := CSIT_CA;
end;

procedure TWCrEmailEmisor.Set_SitMAIL_EMISOR(strValue : String);
begin
   opSitActivo.Checked := (strValue = CSIT_AC);
   opSitCancelado.Checked := Not opSitActivo.Checked;
end;

// ******* Implementation of Procedures *******

procedure TWCrEmailEmisor.CheckRadioButtons(bCheck: Boolean);
var I : Integer;
begin
   With pnlSituacion Do
      For I := 0 To ControlCount - 1 Do
         If (Controls[I] Is  TRadioButton) Then
            (Controls[I] As TRadioButton).Checked := bCheck;
end;

procedure TWCrEmailEmisor.MuestraDatosEmisor;
begin
   With Objeto Do Begin
      If Emisor.FindKey([CVE_FND_ENT_DES.AsString, ID_EMISOR.AsInteger, CVE_EMISOR_EXT.AsString]) Then
         edNom_Emisor.Text := Emisor.Acreditado.Persona.Nombre.AsString;
      End;
end;

// ******* Implementation of Events *******

procedure TWCrEmailEmisor.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
      CheckRadioButtons(False);
      Situacion_MAIL_EMISOR := SIT_MAIL_EMISOR.AsString;
      MuestraDatosEmisor;
   End;
end;

procedure TWCrEmailEmisor.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   With Objeto Do Begin
      SIT_MAIL_EMISOR.AsString := Situacion_MAIL_EMISOR;
      //nuevo
      If IsNewData Then Begin
         If MessageDlg('¿Desea almacenar los datos capturados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
            CVE_USU_ALTA.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         End else
            Realizado := False;
      End Else Begin
         If MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
            Realizado := True;
         End Else
            Realizado := False;
      End
   End;
end;

procedure TWCrEmailEmisor.opSitCanceladoClick(Sender: TObject);

  procedure ChangColorRadioButtons(Color_ : TColor);
  var I : Integer;
  begin
   With pnlSituacion Do
    For I := 0 To ControlCount - 1 Do
     If (Controls[I] Is  TRadioButton) Then
      (Controls[I] As TRadioButton).Color := Color_;
  end;
begin
   If (Sender Is TRadioButton) Then Begin
      ChangColorRadioButtons(clBtnFace);
      (Sender As TRadioButton).Color := $00CCFFFF;
   End;
end;

procedure TWCrEmailEmisor.btnID_PERSONAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCREMAEMI_EMICVE',True,True) then
   begin
       Objeto.CVE_FND_ENT_DES.GetFromControl;
       If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
          Objeto.Emisor.BuscaWhereString := ' CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
          Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;
       End;

       With Objeto Do Begin
          If Emisor.Busca Then Begin
             edNom_Emisor.Text := Emisor.Acreditado.Persona.Nombre.AsString;
             CVE_EMISOR_EXT.AsString := Emisor.CVE_EMISOR_EXT.AsString;
          End Else Begin
             edNom_Emisor.Text := '';
             CVE_EMISOR_EXT.AsString := '';
          End;
       End;
   end;
end;

procedure TWCrEmailEmisor.InterForma1DespuesShow(Sender: TObject);
begin
   With Objeto Do Begin
      CheckRadioButtons(False);
      MuestraDatosEmisor;
      If (Modo <> moAppend) Then
         Situacion_MAIL_EMISOR := CSIT_AC;
   End;
end;

procedure TWCrEmailEmisor.brnCVE_FND_ENT_DESClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCREMAEMI_ENTDES',True,True) then
   begin
     Objeto.MInstDesc.ShowAll := True;
     If Objeto.MInstDesc.Busca Then Begin
        InterForma1.NextTab(edCVE_FND_ENT_DES);
     End;
   end;
end;

procedure TWCrEmailEmisor.ilCVE_FND_ENT_DESCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrEmailEmisor.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   If Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TWCrEmailEmisor.edCVE_FND_ENT_DESExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg     := '';
      vlSalida := True;
      Objeto.CVE_FND_ENT_DES.GetFromControl;
      If Objeto.CVE_FND_ENT_DES.AsString = '' Then Begin
         vlSalida  := False;
         vlMsg    := 'Favor de Indicar la Entidad Descontadora';
      End;
      InterForma1.ValidaExit(edCVE_FND_ENT_DES,vlSalida,vlMsg,True);
   End;
end;

procedure TWCrEmailEmisor.edID_EMISORExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg     := '';
      vlSalida := True;
      Objeto.ID_EMISOR.GetFromControl;
      If Objeto.ID_EMISOR.AsString = '' Then Begin
         vlSalida  := False;
         vlMsg    := 'Favor de Indicar al Emisor';
      End Else If Objeto.Emisor.SIT_EMISOR.AsString <> 'AC' Then Begin
         vlSalida  := False;
         vlMsg     := 'Emisor no Activo';
      End;
      InterForma1.ValidaExit(edID_EMISOR,vlSalida,vlMsg,True);
   End;
end;

procedure TWCrEmailEmisor.ilEMISORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrEmailEmisor.ilEMISOREjecuta(Sender: TObject);
begin
   Objeto.CVE_FND_ENT_DES.GetFromControl;
   If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
      Objeto.Emisor.BuscaWhereString := ' CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
      Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;
   End;
   If Objeto.Emisor.FindKeyNear([Objeto.CVE_FND_ENT_DES.AsString,ilEMISOR.Buffer],['CVE_FND_ENT_DES','ID_ACREDITADO']) Then Begin
      InterForma1.NextTab(edID_EMISOR);
   End;
end;

procedure TWCrEmailEmisor.edNOMBREExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edNOMBRE,True,'',True);
end;

procedure TWCrEmailEmisor.edEMAILExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg     := '';
      vlSalida := True;
      Objeto.EMAIL.GetFromControl;
      If Objeto.EMAIL.AsString = '' Then Begin
         vlSalida  := False;
         vlMsg    := 'Favor de Indicar el Email';
      End;
      InterForma1.ValidaExit(edEMAIL,vlSalida,vlMsg,True);
   End;
end;

end.
