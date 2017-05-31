// Sistema         : Clase de CR_CALIFICADORA
// Fecha de Inicio : 24/05/2005
// Función forma   : Clase de CR_CALIFICADORA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrCalific;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

IntParamCre,
IntGenCre,
IntSICC,
IntPers    // Persona Corporativa
;

Type
 TCrCalific= class; 

  TWCrCalificadora=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_CALIFICADORA : TLabel; 
    edID_CALIFICADORA : TEdit;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
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
    MsgPanel: TPanel;
    rgSIT_CALIFICADORA: TRadioGroup;
    edNOM_CALIFICADORA: TEdit;
    Label2: TLabel;
    edRFC: TEdit;
    rgCVE_PER_JURIDICA: TRadioGroup;
    memDOMICILIO: TMemo;
    Label3: TLabel;
    btID_CALIFICADORA: TBitBtn;
    ilID_CALIFICADORA: TInterLinkit;
    Label1: TLabel;
    lbID_SICC: TLabel;
    edID_SICC: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure edID_CALIFICADORAExit(Sender: TObject);
    procedure ilID_CALIFICADORACapture(Sender: TObject; var Show: Boolean);
    procedure btID_CALIFICADORAClick(Sender: TObject);
    procedure ilID_CALIFICADORAEjecuta(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure rgSIT_CALIFICADORAExit(Sender: TObject);
    procedure edID_SICCExit(Sender: TObject);
    private 
    { Private declarations }
     procedure MuestraDatosPersona;
    public
    { Public declarations }
    Objeto : TCrCalific;
end;
 TCrCalific= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre                 : TParamCre;
        ID_SICC                  : TInterCampo;
        ID_CALIFICADORA          : TInterCampo;
        SIT_CALIFICADORA         : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;
        DOMICILIO                : TInterCampo;
        RFC                      : TInterCampo;
        CVE_PER_JURIDICA         : TInterCampo;

        Persona  : TPersona;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrCalific.Create( AOwner : TComponent );
begin Inherited;
      ID_CALIFICADORA :=CreaCampo('ID_CALIFICADORA',ftFloat,tsNinguno,tsNinguno,True);
                ID_CALIFICADORA.Caption:='Número de Calificadora';
      SIT_CALIFICADORA :=CreaCampo('SIT_CALIFICADORA',ftString,tsNinguno,tsNinguno,True);
                SIT_CALIFICADORA.Caption:='Situación Calificadora';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      ID_SICC   := CreaCampo('ID_SICC',ftInteger,tsNinguno,tsNinguno,True);
                ID_SICC.Caption:='Clave SICC';                
      RFC               := CreaCampo('RFC',ftString,tsNinguno,tsNinguno,False);
      CVE_PER_JURIDICA  := CreaCampo('CVE_PER_JURIDICA',ftString,tsNinguno,tsNinguno,False);
      DOMICILIO         := CreaCampo('DOMICILIO',ftString,tsNinguno,tsNinguno,False);
      FKeyFields.Add('ID_CALIFICADORA');

      With SIT_CALIFICADORA do
        Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
        End;

      With CVE_PER_JURIDICA do
        Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add('PF');
        ComboLista.Add('1'); ComboDatos.Add('PM');
        End;        

      Persona := TPersona.Create(Self);
      Persona.MasterSource:=Self;
      Persona.FieldByName('ID_PERSONA').MasterField:='ID_CALIFICADORA';
      TableName := 'CR_CALIFICADORA';
      
      UseQuery := True;
      HelpFile := 'IntCrCalific.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCalific.Destroy;
begin
 If Assigned(Persona) Then Persona.Free;
 inherited;
end;


function TCrCalific.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCalificadora;
begin
   W:=TWCrCalificadora.Create(Self);
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


Function TCrCalific.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCalif.it','F');
      Try if Active then begin T.Param(0,ID_CALIFICADORA.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_CALIFICADORA********************)
(*                                                                              *)
(*  FORMA DE CR_CALIFICADORA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CALIFICADORA********************)

procedure TWCrCalificadora.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  ID_CALIFICADORA.Control  := edID_CALIFICADORA;
  SIT_CALIFICADORA.Control := rgSIT_CALIFICADORA;
  CVE_USU_ALTA.Control     := edCVE_USU_ALTA;
  F_ALTA.Control           := edF_ALTA;
  CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;
  F_MODIFICA.Control       := edF_MODIFICA;
  ID_SICC.Control          := edID_SICC;  

  RFC.Control               := edRFC;
  CVE_PER_JURIDICA.Control  := rgCVE_PER_JURIDICA;
  DOMICILIO.Control         := memDOMICILIO;

  Persona.ID_PERSONA.Control     := edID_CALIFICADORA;
  Persona.NOMBRE.Control         := edNOM_CALIFICADORA;

  Interforma1.MsgPanel := MsgPanel;
  End;
end;

procedure TWCrCalificadora.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_SICC.Control          := Nil;
  ID_CALIFICADORA.Control  := Nil;
  SIT_CALIFICADORA.Control := Nil;
  CVE_USU_ALTA.Control     := Nil;
  F_ALTA.Control           := Nil;
  CVE_USU_MODIFICA.Control := Nil;
  F_MODIFICA.Control       := Nil;

  RFC.Control              := Nil;
  CVE_PER_JURIDICA.Control := Nil;
  DOMICILIO.Control        := Nil;

  Persona.ID_PERSONA.Control     := Nil;
  Persona.NOMBRE.Control         := Nil;

  Interforma1.MsgPanel := Nil;
  End;
end;

procedure TWCrCalificadora.MuestraDatosPersona;
var vlstrSQL, vlstrRFC : String;
    vlQry : TQuery;
begin
 With Objeto Do
  Begin
  // Obtiene el RFC
  vlstrSQL := ' SELECT (SIGLAS_RFC || F_RFC || HOMOCLAVE_RFC) AS RFC '+coCRLF+
              ' FROM RFC '+coCRLF+
              ' WHERE ID_PERSONA = '+Persona.ID_PERSONA.AsString+coCRLF;
  GetSQLStr(vlstrSQL, Apli.DataBaseName, Apli.SessionName, 'RFC', vlstrRFC, False);
  RFC.AsString := vlstrRFC;
  // Obtiene el Domicilio
  vlstrSQL :=  '  SELECT  DOMF.ID_DOMICILIO,'+coCRLF+
               '          DOMF.CALLE_NUMERO,'+coCRLF+
               '          DOMF.COLONIA,'+coCRLF+
               '          DOMF.CODIGO_POSTAL,'+coCRLF+
               '          CIUDAD_FISCAL.DESC_POBLACION AS CIUDAD,'+coCRLF+
               '          EDO_FISCAL.DESC_POBLACION    AS ESTADO,'+coCRLF+
               '          PAIS_FISCAL.DESC_POBLACION   AS PAIS'+coCRLF+
               '   FROM'+coCRLF+
               '          DOMICILIO  DOMF,'+coCRLF+
               '          POBLACION  PAIS_FISCAL,'+coCRLF+
               '          POBLACION  EDO_FISCAL,'+coCRLF+
               '          POBLACION  CIUDAD_FISCAL'+coCRLF+
               '   WHERE  DOMF.ID_DOMICILIO           = '+Persona.ID_DOMICILIO.AsString+coCRLF+
               '     AND  PAIS_FISCAL.CVE_POBLACION   (+)= DOMF.CVE_PAIS'+coCRLF+
               '     AND  EDO_FISCAL.CVE_POBLACION    (+)= DOMF.CVE_ESTADO'+coCRLF+
               '     AND  CIUDAD_FISCAL.CVE_POBLACION (+)= DOMF.CVE_CIUDAD'+coCRLF
               ;
  vlQry := GetSQLQuery(vlstrSQL, Apli.DataBaseName, Apli.SessionName, False);
  If Not Assigned(vlQry) Then
   Begin
   DOMICILIO.AsString := '';
   End
  Else
   Begin
   DOMICILIO.AsString := 'Calle Número = '+vlQry.FieldByName('CALLE_NUMERO').AsString+coCRLF+
                         'Colonia = '+vlQry.FieldByName('COLONIA').AsString+coCRLF+
                         'Código Postal = '+vlQry.FieldByName('CODIGO_POSTAL').AsString+coCRLF+
                         'Ciudad = '+vlQry.FieldByName('CIUDAD').AsString+coCRLF+
                         'Estado = '+vlQry.FieldByName('ESTADO').AsString+coCRLF+
                         'País = '+vlQry.FieldByName('PAIS').AsString+coCRLF
                         ;
   End;
   // Asigna el Tipo de Persona Jurídica
   CVE_PER_JURIDICA.AsString   := Persona.CVE_PER_JURIDICA.AsString;
  End;
end;

procedure TWCrCalificadora.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCalificadora.InterForma1DespuesNuevo(Sender: TObject);
begin If edID_CALIFICADORA.CanFocus Then edID_CALIFICADORA.SetFocus;
      Objeto.SIT_CALIFICADORA.AsString  := CSIT_AC;
end;

procedure TWCrCalificadora.InterForma1DespuesModificar(Sender: TObject);
begin If edID_SICC.CanFocus Then edID_SICC.SetFocus;
end;

procedure TWCrCalificadora.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlstrMessage : String;
    mrResult : Word;
begin
 If IsNewData Then vlstrMessage := CCONFIRM_ALMACENA_INS
 Else vlstrMessage := CCONFIRM_ALMACENA_MOD;
 mrResult := MessageDlg(vlstrMessage, mtConfirmation, [mbYes, mbNo], 0);
 With Objeto Do
   If (mrResult = mrYes) Then
    Begin
      If (IsNewData) Then
       Begin
       F_ALTA.AsDateTime        := Apli.DameFechaEmpresa;
       CVE_USU_ALTA.AsString    := Apli.Usuario;
       End
      Else
       Begin
       F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresa;
       CVE_USU_MODIFICA.AsString := Apli.Usuario;
       End;
     End;
 Realizado  := mrResult = mrYes;
end;

procedure TWCrCalificadora.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
  Objeto.Active := False;
end;

procedure TWCrCalificadora.edID_CALIFICADORAExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   ID_CALIFICADORA.GetFromControl;
   If (Trim(edID_CALIFICADORA.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbID_CALIFICADORA.Caption;
   InterForma1.ValidaExit(edID_CALIFICADORA, (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrCalificadora.ilID_CALIFICADORACapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrCalificadora.btID_CALIFICADORAClick(Sender: TObject);
begin
 If Objeto.Persona.Busca Then
   MuestraDatosPersona;
end;

procedure TWCrCalificadora.ilID_CALIFICADORAEjecuta(Sender: TObject);
begin
 If Objeto.Persona.FindKey([ilID_CALIFICADORA.Buffer]) Then
  MuestraDatosPersona;
end;

procedure TWCrCalificadora.InterForma1Buscar(Sender: TObject);
begin
 If Objeto.InternalBusca Then
  MuestraDatosPersona;
end;

procedure TWCrCalificadora.rgSIT_CALIFICADORAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_CALIFICADORA, True, '',True);
end;

procedure TWCrCalificadora.edID_SICCExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   ID_SICC.GetFromControl;
   If (Trim(edID_SICC.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbID_SICC.Caption;
   InterForma1.ValidaExit(edID_SICC, (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

end.
