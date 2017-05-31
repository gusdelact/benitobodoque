// Sistema         : Clase de CREMAVEN
// Fecha de Inicio : 24/01/2013
// Función forma   : Clase de CREMAVEN
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Juan Francisco Ortega Flores
// Comentarios     :
Unit IntCremaven;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre,
IntMInstDesc,
IntCrEmisor, IntLinkit
;

const
   CVERDAD = 'V';
   CFALSO  = 'F';

Type
 TCremaven= class; 

  TWCremaven=Class(TForm)
    InterForma1             : TInterForma;
    grbxEmisor: TGroupBox;
    lbID_EMISOR: TLabel;
    Label1: TLabel;
    edID_EMISOR: TEdit;
    btnID_PERSONA: TBitBtn;
    edNom_Emisor: TEdit;
    edCVE_FND_ENT_DES: TEdit;
    edDESC_ENT_DES: TEdit;
    brnCVE_FND_ENT_DES: TBitBtn;
    grbxDestinatario: TGroupBox;
    lbEMAIL: TLabel;
    edEMAIL: TEdit;
    BitBtn1: TBitBtn;
    edNom_Persona: TEdit;
    Label2: TLabel;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lblUsuario_Alta: TLabel;
    edCVE_USU_ALTA: TEdit;
    lblFecha_Alta: TLabel;
    edF_ALTA: TEdit;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    ilCVE_FND_ENT_DES: TInterLinkit;
    ilEMISOR: TInterLinkit;
    edID_PERSONA: TEdit;
    rgSIT_MAIL: TRadioGroup;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure brnCVE_FND_ENT_DESClick(Sender: TObject);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure btnID_PERSONAClick(Sender: TObject);
    procedure ilEMISOR1Ejecuta(Sender: TObject);
    procedure ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure ilEMISOR1Capture(Sender: TObject; var Show: Boolean);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edEMAILKeyPress(Sender: TObject; var Key: Char);
    procedure edEMAILKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edEMAILExit(Sender: TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure ilEMISORCapture(Sender: TObject; var Show: Boolean);
    private
    procedure MuestraDatosEmisor;
    procedure CheckRadioButtons(bCheck : Boolean);
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCremaven;
//    property  Situacion_MAIL_EMISOR : String Read Get_SitMAIL_EMISOR Write Set_SitMAIL_EMISOR;
    
end; 
 TCremaven= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        CVE_FND_ENT_DES : TInterCampo;
        ID_EMISOR       : TInterCampo;
        ID_PERSONA      : TInterCampo;
        EMAIL           : TInterCampo;
        NOMBRE          : TInterCampo;
        CVE_USU_ALTA    : TInterCampo;
        F_ALTA          : TInterCampo;
        SIT_MAIL_PER    : TInterCampo;

        m_nDefaultID_EMISOR  : Integer;
        m_CVE_FND_ENT_DES    : String;

        ParamCre        : TParamCre;
        MInstDesc       : TMInstDesc;
        Emisor          : TCrEmisor;

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


constructor TCremaven.Create( AOwner : TComponent );
begin Inherited;

      m_nDefaultID_EMISOR := 0;
      m_CVE_FND_ENT_DES := '';

      CVE_FND_ENT_DES :=CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,True);
                CVE_FND_ENT_DES.Caption:='Clave de Fnd Ent Des';
      ID_EMISOR :=CreaCampo('ID_EMISOR',ftFloat,tsNinguno,tsNinguno,True);
                ID_EMISOR.Caption:='Número de Emisor';
      ID_PERSONA :=CreaCampo('ID_PERSONA',ftFloat,tsNinguno,tsNinguno,True);
                ID_PERSONA.Caption:='Persona';
      EMAIL :=CreaCampo('EMAIL',ftString,tsNinguno,tsNinguno,True);
                EMAIL.Caption:='Email';
      NOMBRE :=CreaCampo('NOMBRE',ftString,tsNinguno,tsNinguno,True);
                NOMBRE.Caption:='Nombre';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      SIT_MAIL_PER :=CreaCampo('SIT_MAIL_PER',ftString,tsNinguno,tsNinguno,True);

      With SIT_MAIL_PER do
         begin Size:=2;
                 UseCombo:=True;
                 ComboLista.Add('0');           ComboDatos.Add('AC');
                 ComboLista.Add('1');           ComboDatos.Add('IN');
          end;
                SIT_MAIL_PER.Caption:='Situación';

      FKeyFields.Add('CVE_FND_ENT_DES');
      FKeyFields.Add('ID_EMISOR');
      FKeyFields.Add('ID_PERSONA');
      FKeyFields.Add('EMAIL');

      MInstDesc := TMInstDesc.Create(Self);
      MInstDesc.MasterSource:= Self;
      MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField:= 'CVE_FND_ENT_DES';

      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource := Self;
      Emisor.FieldByName('CVE_FND_ENT_DES').MasterField:= 'CVE_FND_ENT_DES';
      Emisor.FieldByName('ID_ACREDITADO').MasterField := 'ID_EMISOR';


      TableName := 'CR_EMAIL_VENC';
      UseQuery := True;
      HelpFile := 'IntCremaven.Hlp';
      ShowMenuReporte:=True;

end;

Destructor TCremaven.Destroy;
begin
   If Emisor <> nil Then
      Emisor.Free;
   if MInstDesc <> nil then
      MInstDesc.Free;
inherited;
end;


function TCremaven.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCremaven;
begin
   W:=TWCremaven.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCremaven.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICremave.it','');
      Try 
      if Active then begin
         end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
      finally  T.Free;
      end;
end;

function TCremaven.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CREMAVEN********************)
(*                                                                              *)
(*  FORMA DE CREMAVEN                                                            *)
(*                                                                              *)
(***********************************************FORMA CREMAVEN********************)

procedure TWCremaven.FormShow(Sender: TObject);
begin
     Objeto.CVE_FND_ENT_DES.Control    := edCVE_FND_ENT_DES;
     Objeto.ID_EMISOR.Control          := edID_EMISOR;
     Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOM_EMISOR;
     Objeto.ID_PERSONA.Control         := edID_PERSONA;
     Objeto.EMAIL.Control              := edEMAIL;
     Objeto.NOMBRE.Control             := edNom_Persona;
     Objeto.SIT_MAIL_PER.Control       := rgSIT_MAIL;
     Objeto.CVE_USU_ALTA.Control       := edCVE_USU_ALTA;
     Objeto.F_ALTA.Control             := edF_ALTA;

     Objeto.MInstDesc.CVE_FND_ENT_DES.Control:=edCVE_FND_ENT_DES;
     Objeto.MInstDesc.DESC_ENT_DES.Control:=edDESC_ENT_DES;
     Objeto.MInstDesc.GetParams(Objeto);

     Interforma1.MsgPanel := MsgPanel;

end;

procedure TWCremaven.FormDestroy(Sender: TObject);
begin
     Objeto.CVE_FND_ENT_DES.Control := nil;
     Objeto.ID_EMISOR.Control       := nil;
     Objeto.ID_PERSONA.Control      := nil;
     Objeto.EMAIL.Control           := nil;
     Objeto.NOMBRE.Control          := nil;
     Objeto.SIT_MAIL_PER.Control    := nil;
     Objeto.CVE_USU_ALTA.Control    := nil;
     Objeto.F_ALTA.Control          := nil;

     Objeto.MInstDesc.CVE_FND_ENT_DES.Control :=nil;
     Objeto.MInstDesc.DESC_ENT_DES.Control :=nil;
end;

procedure TWCremaven.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCremaven.InterForma1DespuesNuevo(Sender: TObject);
begin
     rgSIT_MAIL.ItemIndex := 0;
     With Objeto Do Begin
        If (m_nDefaultID_EMISOR <> 0)  Then Begin
           ID_EMISOR.AsInteger := m_nDefaultID_EMISOR;
           Objeto.MInstDesc.FindKey([m_CVE_FND_ENT_DES]);
           MuestraDatosEmisor;
        End;
     End;
     If edCVE_FND_ENT_DES.CanFocus Then
        edCVE_FND_ENT_DES.SetFocus;
end;

procedure TWCremaven.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCremaven.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCremaven.brnCVE_FND_ENT_DESClick(Sender: TObject);
begin
      Objeto.MInstDesc.ShowAll := True;
   If Objeto.MInstDesc.Busca Then Begin
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TWCremaven.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   If Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TWCremaven.btnID_PERSONAClick(Sender: TObject);
begin
      Objeto.Emisor.ShowAll := True;
      Objeto.CVE_FND_ENT_DES.GetFromControl;
   If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
      Objeto.Emisor.BuscaWhereString := ' CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
      Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;
   End;

   With Objeto Do Begin
      If Emisor.Busca Then Begin
         edNom_Emisor.Text := Emisor.Acreditado.Persona.Nombre.AsString;
      End Else Begin
         edNom_Emisor.Text := '';
      End;
   End;
end;

procedure TWCremaven.ilEMISOR1Ejecuta(Sender: TObject);
begin
      Objeto.CVE_FND_ENT_DES.GetFromControl;
   If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
      Objeto.Emisor.BuscaWhereString := ' CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
      Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;
      Objeto.Emisor.FindKeyNear([ilEMISOR.Buffer],['ID_ACREDITADO']);
      InterForma1.NextTab(edID_EMISOR);
   End;
end;

procedure TWCremaven.ilCVE_FND_ENT_DESCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCremaven.ilEMISOR1Capture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCremaven.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin

if (edEMAIL.Text <> '') and (edCVE_FND_ENT_DES.Text <> '') and (edID_EMISOR.text <> '') and (edID_PERSONA.text <> '')then
  begin
   With Objeto Do Begin
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
  end
  else
  Showmessage('   Error: Existen Campos Nulos');
end;

procedure TWCremaven.MuestraDatosEmisor;
begin
   With Objeto Do Begin
      If Emisor.FindKey([CVE_FND_ENT_DES.AsString, ID_EMISOR.AsInteger]) Then
         edNom_Emisor.Text := Emisor.Acreditado.Persona.Nombre.AsString;
      End;
end;

procedure TWCremaven.CheckRadioButtons(bCheck: Boolean);
var I : Integer;
begin
//   With pnlSituacion Do
//      For I := 0 To ControlCount - 1 Do
//         If (Controls[I] Is  TRadioButton) Then
//            (Controls[I] As TRadioButton).Checked := bCheck;
end;

procedure TWCremaven.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
      CheckRadioButtons(False);
//      Situacion_MAIL_EMISOR := SIT_MAIL_EMISOR.AsString;
      MuestraDatosEmisor;
   End;
end;

procedure TWCremaven.BitBtn1Click(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('ICRPERSML.IT','S,F,S,S');
      Try
        If T.Execute Then
           Begin
             edID_PERSONA.Text := T.DameCampo(0);
             edNom_Persona.Text := T.DameCampo(2);
             edEMAIL.Text := T.DameCampo(3);
           End;
      Finally
        T.Free;
        edEMAIL.SetFocus;
      End;
    End;
end;

procedure TWCremaven.edEMAILKeyPress(Sender: TObject; var Key: Char);
var dest : String;
begin
if key = chr(64) then
   edEMAIL.Text :=  edEMAIL.Text+'@interacciones.com';
end;


procedure TWCremaven.edEMAILKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
 var text: String;
begin
  text:= Trim(edEMAIL.Text);
  if pos('@', text) = 1 then
     delete(text, 1, 1);
  edEMAIL.Text:= text;
end;

procedure TWCremaven.edEMAILExit(Sender: TObject);
begin
if edEMAIL.Text <> '' then
  begin
    if StrScan(pchar(edEMAIL.Text), CHAR('@')) <> '@interacciones.com' then 
     begin
     showmessage('   ATENCION: El correo no corresponde al dominio de GFI');
     edEMAIL.Text := '';
     end;
  end;
end;

procedure TWCremaven.btEMISORClick(Sender: TObject);
var i: integer ;
begin
    Objeto.Emisor.ShowAll := True;
    if Objeto.Emisor.Busca then Begin
        InterForma1.NextTab(edID_EMISOR);
    end;
end;

procedure TWCremaven.ilEMISOREjecuta(Sender: TObject);
begin
    if Objeto.Emisor.FindKeyNear([ilEMISOR.Buffer],['ID_ACREDITADO']) then Begin
        InterForma1.NextTab(edID_EMISOR);
    End;
end;

procedure TWCremaven.ilEMISORCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

end.

