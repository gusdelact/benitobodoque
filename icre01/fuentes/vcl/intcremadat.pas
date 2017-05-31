// Sistema         : Clase de CR_EMAIL_DATOS
// Fecha de Inicio : 21/08/2003
// Función forma   : Clase de CR_EMAIL_DATOS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrEmaDat;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, IntGenCre,
IntCrCto, IntEmple, IntLinkit;

const C_SEPARATOR = '-';

Type
 TCrEmaDat= class; 

  TWCrEmailDatos=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_TIPO_EMAIL : TLabel; 
    edID_TIPO_EMAIL : TEdit;
    pnlSituacion: TPanel;
    lblSIT_MAIL_EMISOR: TLabel;
    opSitActivo: TRadioButton;
    opSitCancelado: TRadioButton;
    GroupBox1: TGroupBox;
    lbID_PERSONA: TLabel;
    edID_PERSONA: TEdit;
    btnID_PERSONA: TBitBtn;
    edNOMBRE: TEdit;
    lblCargo: TLabel;
    lbID_TIPO_PERSONA: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edAplicacion: TEdit;
    edNOMBRE_PUESTO: TEdit;
    ilID_PERSONA: TInterLinkit;
    cbxID_TIPO_PERSONA: TComboBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure opSitActivoClick(Sender: TObject);
    procedure btnID_PERSONAClick(Sender: TObject);
    procedure ilID_PERSONAEjecuta(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure ilID_PERSONACapture(Sender: TObject; var Show: Boolean);
    private
    { Private declarations }
     procedure Set_SitEMAIL_DATOS(strValue : String);
     function  Get_SitEMAIL_DATOS : String;

     procedure Set_Tipo_Persona(strValue : String);
     function  Get_Tipo_Persona : String;

    public
    { Public declarations }
    Objeto : TCrEmaDat;
     property  Situacion_EMAIL_DATOS : String Read Get_SitEMAIL_DATOS Write Set_SitEMAIL_DATOS;
     property  Tipo_Persona : String Read Get_Tipo_Persona Write Set_Tipo_Persona;
end;
 TCrEmaDat= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_TIPO_EMAIL            : TInterCampo;
        ID_PERSONA               : TInterCampo;
        ID_TIPO_PERSONA          : TInterCampo;
        SIT_EMAIL_DATOS          : TInterCampo;
        ParamCre                 : TParamCre;
        Empleado                 : TEmpleado;

        m_strDefaultID_TIPO_PERSONA : String;
        m_strDefaultID_TIPO_EMAIL : String;
        m_strTituloAplicacion : String;

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


constructor TCrEmaDat.Create( AOwner : TComponent );
begin Inherited;
      m_strTituloAplicacion := '';
      m_strDefaultID_TIPO_EMAIL  := '';
      m_strDefaultID_TIPO_PERSONA := '';

      ID_TIPO_EMAIL :=CreaCampo('ID_TIPO_EMAIL',ftString,tsNinguno,tsNinguno,True);
                ID_TIPO_EMAIL.Caption:='Número de Tipo Email';
      ID_PERSONA :=CreaCampo('ID_PERSONA',ftFloat,tsNinguno,tsNinguno,True);
                ID_PERSONA.Caption:='Número de Persona';
      ID_TIPO_PERSONA :=CreaCampo('ID_TIPO_PERSONA',ftString,tsNinguno,tsNinguno,True);
                ID_TIPO_PERSONA.Caption:='Número de Tipo Persona';
      SIT_EMAIL_DATOS :=CreaCampo('SIT_EMAIL_DATOS',ftString,tsNinguno,tsNinguno,True);
                SIT_EMAIL_DATOS.Caption:='Situación Email Datos';
      FKeyFields.Add('ID_TIPO_EMAIL');
      FKeyFields.Add('ID_PERSONA');
      FKeyFields.Add('ID_TIPO_PERSONA');


      Empleado := TEmpleado.Create(Self);
      Empleado.MasterSource := Self;
      Empleado.ID_PERSONA.MasterField := 'ID_PERSONA';

      TableName := 'CR_EMAIL_DATOS';
      UseQuery := True;
      HelpFile := 'IntCrEmaDat.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrEmaDat.Destroy;
begin inherited;
end;


function TCrEmaDat.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrEmailDatos;
begin
   W:=TWCrEmailDatos.Create(Self);
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


Function TCrEmaDat.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrEmDa.it','S,F,S');
      Try if Active then begin T.Param(0,ID_TIPO_EMAIL.AsString); 
                               T.Param(1,ID_PERSONA.AsString); 
                               T.Param(2,ID_TIPO_PERSONA.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;

function TCrEmaDat.Reporte:Boolean;
begin Result := False;
end;


(***********************************************FORMA CR_EMAIL_DATOS********************)
(*                                                                              *)
(*  FORMA DE CR_EMAIL_DATOS                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_EMAIL_DATOS********************)

procedure TWCrEmailDatos.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_TIPO_EMAIL.Control   := edID_TIPO_EMAIL;
  ID_PERSONA.Control      := edID_PERSONA;

  Empleado.ID_PERSONA.Control := edID_PERSONA;
  Empleado.Persona.NOMBRE.Control := edNOMBRE;
  Empleado.Puesto.NOMBRE_PUESTO.Control := edNOMBRE_PUESTO;

  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
  End;
end;

procedure TWCrEmailDatos.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_TIPO_EMAIL.Control    := Nil;
  ID_PERSONA.Control       := Nil;

  Empleado.ID_PERSONA.Control           := Nil;
  Empleado.Persona.NOMBRE.Control       := Nil;
  Empleado.Puesto.NOMBRE_PUESTO.Control := Nil;
  End;
end;

// Implementation of Properties

function TWCrEmailDatos.Get_SitEMAIL_DATOS: String;
begin
 If opSitActivo.Checked Then Result := CSIT_AC
 Else Result := CSIT_CA;
end;

procedure TWCrEmailDatos.Set_SitEMAIL_DATOS(strValue: String);
begin
 opSitActivo.Checked := (strValue = CSIT_AC);
 opSitCancelado.Checked := Not opSitActivo.Checked;
end;

function TWCrEmailDatos.Get_Tipo_Persona: String;
var str : String;
begin
 With cbxID_TIPO_PERSONA Do
  Begin
  str := Items[ItemIndex];
  Result := Copy(str, 1 , Pos(C_SEPARATOR, str)-1);
  End;
end;

procedure TWCrEmailDatos.Set_Tipo_Persona(strValue: String);
var str, strID_TIPO_PERSONA : String;
    I : Integer;
begin
 With cbxID_TIPO_PERSONA Do
  Begin
  For I := 0 To Items.Count-1 Do
   Begin
   str := Items[I];
   strID_TIPO_PERSONA := Copy(str, 1,Pos(C_SEPARATOR, str)-1);
   If (UpperCase(strID_TIPO_PERSONA) = UpperCase(strValue)) Then
    Begin
    ItemIndex := I;
    Break;
    End;
   End;
  End; 
end;

// Implementation of Events

procedure TWCrEmailDatos.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrEmailDatos.InterForma1DespuesNuevo(Sender: TObject);
begin
 With Objeto Do
  Begin
  // Lo coloca como Default
  Tipo_Persona := C_REPRESENTANTE;
   If edID_PERSONA.CanFocus Then edID_PERSONA.SetFocus;
   If (Trim(m_strDefaultID_TIPO_PERSONA) <> '') Then
    Begin
    ID_TIPO_EMAIL.AsString :=  m_strDefaultID_TIPO_EMAIL;
    ID_TIPO_PERSONA.AsString :=  m_strDefaultID_TIPO_PERSONA;
    Tipo_Persona := ID_TIPO_PERSONA.AsString;
    edAplicacion.Text := m_strTituloAplicacion;
    End;
  Situacion_EMAIL_DATOS := CSIT_AC;
  End;
end;

procedure TWCrEmailDatos.InterForma1DespuesModificar(Sender: TObject);
begin
 If cbxID_TIPO_PERSONA.CanFocus Then cbxID_TIPO_PERSONA.SetFocus;
end;

procedure TWCrEmailDatos.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
 With Objeto Do
  Begin
   SIT_EMAIL_DATOS.AsString := Situacion_EMAIL_DATOS;
   ID_TIPO_PERSONA.AsString := Tipo_Persona;
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
  End;
end;

procedure TWCrEmailDatos.opSitActivoClick(Sender: TObject);

  procedure ChangeColorRadioButtons(Color_ : TColor);
  var I : Integer;
  begin
   With pnlSituacion Do
    For I := 0 To ControlCount - 1 Do
     If (Controls[I] Is  TRadioButton) Then
      (Controls[I] As TRadioButton).Color := Color_;
  end;

begin

  If (Sender Is TRadioButton) Then
   Begin
   ChangeColorRadioButtons(clBtnFace);
   (Sender As TRadioButton).Color := $00CCFFFF;
   End;
end;

procedure TWCrEmailDatos.btnID_PERSONAClick(Sender: TObject);
begin
 With Objeto Do
  If Empleado.Busca Then ;
end;

procedure TWCrEmailDatos.ilID_PERSONAEjecuta(Sender: TObject);
begin
 With Objeto Do
  If Empleado.FindKey([ILID_PERSONA.Buffer]) Then;
end;

procedure TWCrEmailDatos.InterForma1DespuesShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  If (Modo <> moAppend) Then
   Begin
   Situacion_EMAIL_DATOS := SIT_EMAIL_DATOS.AsString;
   Tipo_Persona := ID_TIPO_PERSONA.AsString;
   edAplicacion.Text := m_strTituloAplicacion;   
   End;
  End; 
end;

procedure TWCrEmailDatos.ilID_PERSONACapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

end.
