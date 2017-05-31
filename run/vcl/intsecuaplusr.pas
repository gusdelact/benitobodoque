// Sistema         : Clase de SECU_USR_APL_GPO
// Fecha de Inicio : 4/09/1998
// Función forma   : Clase de SECU_USR_APL_GPO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Jose Alberto Ramirez Pacheco
// Comentarios     :
Unit IntSecuAplUsr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntSecuAplic, IntMPers, IntUsuario, IntSecIndAdi, IntSecGpAcc, IntLinkit;

Type
 TSecAplUsr= class;

  TwSecAplUsr=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_USUARIO : TLabel;
    edCVE_USUARIO : TEdit;
    lbCVE_APLICACION : TLabel; 
    edCVE_APLICACION : TEdit;
    lbID_EMPRESA : TLabel;
    edID_EMPRESA : TEdit;
    lbCVE_IND_ADIC : TLabel;
    edCVE_IND_ADIC : TEdit;
    lbID_GPO_ACCESO : TLabel;
    edID_GPO_ACCESO : TEdit;
    bUsuario: TSpeedButton;
    edNomPersona: TEdit;
    bAplicacion: TSpeedButton;
    edNomAplicacion: TEdit;
    bEmpresa: TSpeedButton;
    edNomEmpresa: TEdit;
    bPerfil: TSpeedButton;
    edDescPerfil: TEdit;
    bIndicador: TSpeedButton;
    edDescIndicador: TEdit;
    InterLinkit1: TInterLinkit;
    InterLinkit2: TInterLinkit;
    InterLinkit3: TInterLinkit;
    InterLinkit4: TInterLinkit;
    InterLinkit5: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure bUsuarioClick(Sender: TObject);
    procedure bAplicacionClick(Sender: TObject);
    procedure bEmpresaClick(Sender: TObject);
    procedure bPerfilClick(Sender: TObject);
    procedure bIndicadorClick(Sender: TObject);
    procedure InterLinkit1Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    procedure InterLinkit2Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit2Ejecuta(Sender: TObject);
    procedure InterLinkit3Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit3Ejecuta(Sender: TObject);
    procedure InterLinkit4Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit4Ejecuta(Sender: TObject);
    procedure InterLinkit5Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit5Ejecuta(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TSecAplUsr;
end;
 TSecAplUsr= class(TInterFrame)
      private
      	FAplicacion: TInterFrame;
      protected
      	Procedure SetAplicacion(Frame: TInterFrame);
      public
        { Public declarations }
        CVE_USUARIO              : TInterCampo;
        CVE_APLICACION           : TInterCampo;
        ID_EMPRESA               : TInterCampo;
        CVE_IND_ADIC             : TInterCampo;
        ID_GPO_ACCESO            : TInterCampo;

        Usuario   : TUsuario;
        SecuAplicacion: TSecuAplic;
        Empresa	: TMPersona;
        Indicador	: TSecIndAdi;
        Perfil		: TSecGpAcc;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        Property    Aplicacion: TInterFrame Read FAplicacion Write SetAplicacion;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TSecAplUsr.Create( AOwner : TComponent );
begin
	Inherited;
   CVE_USUARIO :=CreaCampo('CVE_USUARIO',ftString,tsNinguno,tsNinguno,True);
		CVE_USUARIO .Size:=8;
      CVE_USUARIO.Caption:='Clave';
   CVE_APLICACION :=CreaCampo('CVE_APLICACION',ftString,tsNinguno,tsNinguno,True);
   	CVE_APLICACION .Size:=6;
      CVE_APLICACION.Caption:='Aplicacion';
   ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
   	ID_EMPRESA.Caption:='Empresa';
   CVE_IND_ADIC :=CreaCampo('CVE_IND_ADIC',ftString,tsNinguno,tsNinguno,True);
   	CVE_IND_ADIC .Size:=2;
      CVE_IND_ADIC.Caption:='Indicador Adicional';
   ID_GPO_ACCESO :=CreaCampo('ID_GPO_ACCESO',ftFloat,tsNinguno,tsNinguno,True);
   	ID_GPO_ACCESO.Caption:='Perfil';

   Usuario   := TUsuario.Create(self);
   Usuario.MasterSource:= Self;
   Usuario.CVE_USUARIO.MasterField := 'CVE_USUARIO';

   SecuAplicacion:= TSecuAplic.Create(self);
   SecuAplicacion.MasterSource:= self;
   SecuAplicacion.CVE_APLICACION.MasterField := 'CVE_APLICACION';

   Empresa	 := TMPersona.Create(self);
   Empresa.MasterSource := self;
   Empresa.ID_Persona.MasterField := 'ID_EMPRESA';
   Empresa.FilterBy := fbTMPersonaEmpresa;

   Indicador := TSecIndAdi.Create(self);
   Indicador.MasterSource := self;
   Indicador.CVE_APLICACION.MasterField := 'CVE_APLICACION';
   Indicador.CVE_IND_ADIC.MasterField := 'CVE_IND_ADIC';

   Perfil	 := TSecGpAcc.Create(self);
   Perfil.MasterSource := self;
   Perfil.CVE_APLICACION.MasterField := 'CVE_APLICACION';
   Perfil.ID_GPO_ACCESO.MasterField := 'ID_GPO_ACCESO';

   FKeyFields.Add('CVE_USUARIO');
   FKeyFields.Add('CVE_APLICACION');
   FKeyFields.Add('ID_EMPRESA');
   FKeyFields.Add('CVE_IND_ADIC');

   TableName := 'SECU_USR_APL_GPO';
   UseQuery := True;
   HelpFile := 'IntSecuAplUsr.Hlp';
   ShowMenuReporte:=True;
end;

Destructor TSecAplUsr.Destroy;
begin
   If Usuario <> nil then Usuario.Free;
   If SecuAplicacion <> nil then SecuAplicacion.Free;
   If Empresa <> nil then Empresa.Free;
   If Indicador <> nil then indicador.Free;
   If Perfil <> nil then Perfil.Free;
	inherited;
end;


function TSecAplUsr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwSecAplUsr;
begin
   W:=TwSecAplUsr.Create(Self);
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


Function TSecAplUsr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ISeUAGp.it','S,S,F,S');
      Try if Active then begin T.Param(0,CVE_USUARIO.AsString);
                               T.Param(1,CVE_APLICACION.AsString);
                               T.Param(2,ID_EMPRESA.AsString);
                               T.Param(3,CVE_IND_ADIC.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
      finally  T.Free;
      end;
end;

Procedure TSecAplUsr.SetAplicacion(Frame: TInterFrame);
Begin
	FAplicacion := Frame;
   Indicador.SecuAplic := Frame;
   Perfil.SecuApli:= Frame;

   If Frame = nil then BuscaWhereString := ''
   else BuscaWhereString := 'SECU_USR_APL_GPO.CVE_APLICACION = '''+  Frame.FieldByName('CVE_APLICACION').asString + '''';
end;

function TSecAplUsr.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA SECU_USR_APL_GPO********************)
(*                                                                              *)
(*  FORMA DE SECU_USR_APL_GPO                                                            *)
(*                                                                              *)
(***********************************************FORMA SECU_USR_APL_GPO********************)

procedure TwSecAplUsr.FormShow(Sender: TObject);
begin
   Objeto.CVE_USUARIO.Control:=edCVE_USUARIO;
   Objeto.ID_EMPRESA.Control:=edID_EMPRESA;
   Objeto.CVE_IND_ADIC.Control:=edCVE_IND_ADIC;
   Objeto.ID_GPO_ACCESO.Control:=edID_GPO_ACCESO;

   Objeto.SecuAplicacion.CVE_APLICACION.Control := edCVE_APLICACION;
   Objeto.Usuario.eMPLEADO.PERSONA.Nombre.Control := edNomPersona;
   Objeto.SecuAplicacion.NOM_APLICACION.Control := edNomAplicacion;
   Objeto.Empresa.Nombre.Control := edNomEmpresa;
   Objeto.Indicador.Indicador.DESC_IND_ADIC.Control:= edDescIndicador;
   Objeto.Perfil.NOM_GPO_ACCESO.Control := edDescPerfil;

   If Objeto.Aplicacion <> nil then
		Objeto.SecuAplicacion.FindKey([Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString]);
end;

procedure TwSecAplUsr.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_USUARIO.Control:= nil;
   Objeto.ID_EMPRESA.Control:= nil;
   Objeto.CVE_IND_ADIC.Control:= nil;
   Objeto.ID_GPO_ACCESO.Control:= nil;

   Objeto.SecuAplicacion.CVE_APLICACION.Control := nil;
   Objeto.Usuario.eMPLEADO.PERSONA.Nombre.Control:= nil;
   Objeto.SecuAplicacion.NOM_APLICACION.Control:= nil;
   Objeto.Empresa.Nombre.Control:= nil;
   Objeto.Indicador.Indicador.DESC_IND_ADIC.Control:= nil;
   Objeto.Perfil.NOM_GPO_ACCESO.Control:= nil;
end;

procedure TwSecAplUsr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwSecAplUsr.InterForma1DespuesNuevo(Sender: TObject);
begin
	edCVE_USUARIO.SetFocus;
   If Objeto.Aplicacion <> nil then
   Begin
   	bAplicacion.Enabled := False;
      Objeto.Perfil.CVE_APLICACION.asString := Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString;
      Objeto.SecuAplicacion.FindKey([Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString]);
   end;
end;

procedure TwSecAplUsr.bUsuarioClick(Sender: TObject);
begin	Objeto.Usuario.Busca;
end;

procedure TwSecAplUsr.bAplicacionClick(Sender: TObject);
begin	Objeto.SecuAplicacion.Busca;
end;

procedure TwSecAplUsr.bEmpresaClick(Sender: TObject);
begin	Objeto.Empresa.Busca;
end;

procedure TwSecAplUsr.bPerfilClick(Sender: TObject);
begin	Objeto.Perfil.Busca;
end;

procedure TwSecAplUsr.bIndicadorClick(Sender: TObject);
begin	Objeto.Indicador.Busca;
end;

procedure TwSecAplUsr.InterLinkit1Capture(Sender: TObject;
  var Show: Boolean);
begin Show:= Interforma1.CanEdit;
end;

procedure TwSecAplUsr.InterLinkit1Ejecuta(Sender: TObject);
begin	Objeto.Usuario.FindKey([InterLinkit1.Buffer]);
end;

procedure TwSecAplUsr.InterLinkit2Capture(Sender: TObject;
  var Show: Boolean);
begin Show:= Interforma1.CanEdit;
end;

procedure TwSecAplUsr.InterLinkit2Ejecuta(Sender: TObject);
begin	Objeto.SecuAplicacion.FindKey([InterLinkit2.Buffer]);
end;

procedure TwSecAplUsr.InterLinkit3Capture(Sender: TObject;
  var Show: Boolean);
begin Show:= Interforma1.CanEdit;
end;

procedure TwSecAplUsr.InterLinkit3Ejecuta(Sender: TObject);
begin	Objeto.Empresa.FindKey([InterLinkit3.Buffer]);
end;

procedure TwSecAplUsr.InterLinkit4Capture(Sender: TObject;
  var Show: Boolean);
begin Show:= Interforma1.CanEdit;
end;

procedure TwSecAplUsr.InterLinkit4Ejecuta(Sender: TObject);
begin	Objeto.Perfil.FindKey([InterLinkit4.Buffer]);
end;

procedure TwSecAplUsr.InterLinkit5Capture(Sender: TObject;
  var Show: Boolean);
begin Show:= Interforma1.CanEdit;
end;

procedure TwSecAplUsr.InterLinkit5Ejecuta(Sender: TObject);
begin	Objeto.Indicador.FindKey([InterLinkit5.Buffer]);
end;

procedure TwSecAplUsr.InterForma1DespuesCancelar(Sender: TObject);
begin
   If Objeto.Aplicacion <> nil then
		Objeto.SecuAplicacion.FindKey([Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString]);
end;

procedure TwSecAplUsr.InterForma1DespuesEliminar(Sender: TObject);
begin
   If Objeto.Aplicacion <> nil then
		Objeto.SecuAplicacion.FindKey([Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString]);
end;

end.
