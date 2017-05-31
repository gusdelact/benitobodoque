// Sistema         : Clase de SECU_APLICACION
// Fecha de Inicio : 10/08/1998
// Función forma   : Clase de SECU_APLICACION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Jose Alberto Ramirez Pacheco
// Comentarios     :
Unit IntSecuAplic;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, IntMPers, IntLinkit;

Type
	TSecuAplic = class;

  TWSecuAplicacion=Class(TForm)
    InterForma1             : TInterForma;
    chB_BLOQUEADO : TCheckBox;
    lbID_PERS_RESPON : TLabel;
    edID_PERS_RESPON : TEdit;
    chB_OCULTAR : TCheckBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edFH_PRODUCCION: TEdit;
    edFH_ULT_ACCESO: TEdit;
    Label2: TLabel;
    lbCVE_APLICACION: TLabel;
    edCVE_APLICACION: TEdit;
    edNOM_APLICACION: TEdit;
    lbTX_DESC_APLI: TLabel;
    GroupBox2: TGroupBox;
    edTX_WELCOME: TMemo;
    edNombre: TEdit;
    bResponsable: TBitBtn;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    edNOM_ARCHIVO: TEdit;
    lbPATH_ARCHIVO: TLabel;
    edPATH_ARCHIVO: TEdit;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    edTX_DESC_APLI: TMemo;
    InterLinkit1: TInterLinkit;
    InterLinkit2: TInterLinkit;
    bAccesos: TButton;
    btPerfiles: TButton;
    btIndicadores: TButton;
    Button2: TButton;
    Button5: TButton;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure bResponsableClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edNOM_APLICACIONExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure InterLinkit1Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterLinkit2Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit2Ejecuta(Sender: TObject);
    procedure bAccesosClick(Sender: TObject);
    procedure btPerfilesClick(Sender: TObject);
    procedure btIndicadoresClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TSecuAplic;
end;
 TSecuAplic= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_APLICACION: TInterCampo;
        B_BLOQUEADO   : TInterCampo;
        FH_PRODUCCION : TInterCampo;
        FH_ULT_ACCESO : TInterCampo;
        ID_PERS_RESPON: TInterCampo;
        NOM_APLICACION: TInterCampo;
        NOM_ARCHIVO   : TInterCampo;
        PATH_ARCHIVO  : TInterCampo;
        TX_DESC_APLI  : TInterCampo;
        TX_WELCOME    : TInterCampo;
        B_OCULTAR     : TInterCampo;

        Responsable	 : TMPersona;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation
{$R *.DFM}

Uses IntMenuSegu, IntAccFunPerfil, IntSecGpAcc, IntSecIndAdi, IntSecuFunci,
	  IntSecuAplUsr, UnVerMenu, UnVerCodigo; //RepSecGpAcc;


constructor TSecuAplic.Create( AOwner : TComponent );
begin
	Inherited;
   CVE_APLICACION :=CreaCampo('CVE_APLICACION',ftString,tsNinguno,tsNinguno,True);
   	CVE_APLICACION .Size:=6;
      CVE_APLICACION.Caption:='Clave de Aplicacion';
   B_BLOQUEADO :=CreaCampo('B_BLOQUEADO',ftString,tsNinguno,tsNinguno,True);
   	B_BLOQUEADO .Size:=1;
      B_BLOQUEADO.Caption:='Bloqueado';
   FH_PRODUCCION :=CreaCampo('FH_PRODUCCION',ftDate,tsNinguno,tsNinguno,True);
   	FH_PRODUCCION.Caption:='Fecha y Hora Produccion';
   FH_ULT_ACCESO :=CreaCampo('FH_ULT_ACCESO',ftDate,tsNinguno,tsNinguno,True);
   	FH_ULT_ACCESO.Caption:='Fecha y Hora Última Acceso';
   ID_PERS_RESPON :=CreaCampo('ID_PERS_RESPON',ftFloat,tsNinguno,tsNinguno,True);
   	ID_PERS_RESPON.Caption:='Número de Persona Responsable';
   NOM_APLICACION :=CreaCampo('NOM_APLICACION',ftString,tsNinguno,tsNinguno,True);
   	NOM_APLICACION.Caption:='Nombre Aplicacion';
   NOM_ARCHIVO :=CreaCampo('NOM_ARCHIVO',ftString,tsNinguno,tsNinguno,True);
   	NOM_ARCHIVO.Caption:='Nombre Archivo';
   PATH_ARCHIVO :=CreaCampo('PATH_ARCHIVO',ftString,tsNinguno,tsNinguno,True);
   	PATH_ARCHIVO.Caption:='Path Archivo';
   TX_DESC_APLI :=CreaCampo('TX_DESC_APLI',ftString,tsNinguno,tsNinguno,True);
   	TX_DESC_APLI.Caption:='Descripción Apli';
   TX_WELCOME :=CreaCampo('TX_WELCOME',ftString,tsNinguno,tsNinguno,True);
   	TX_WELCOME.Caption:='Welcome';
   B_OCULTAR :=CreaCampo('B_OCULTAR',ftString,tsNinguno,tsNinguno,True);
   	B_OCULTAR .Size:=1;
      B_OCULTAR.Caption:='Ocultar';

   Responsable:= TMPersona.Create(Self);
   Responsable.FilterBy := fbTMPersonaEmpleado;
   Responsable.MasterSource := self;
   Responsable.ID_Persona.MasterField := 'ID_PERS_RESPON';

   TableName := 'SECU_APLICACION';
   FKeyFields.Add('CVE_APLICACION');
   UseQuery := True;
   HelpFile := 'IntSecuAplic.Hlp';
   ShowMenuReporte:=True;
end;

Destructor TSecuAplic.Destroy;
begin
	If Responsable<>nil then Responsable.Free;
	inherited;
end;


function TSecuAplic.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWSecuAplicacion;
begin
   W:=TWSecuAplicacion.Create(Self);
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


Function TSecuAplic.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ISecApl.it','S');
      Try if Active then begin T.Param(0,CVE_APLICACION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TSecuAplic.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA SECU_APLICACION********************)
(*                                                                              *)
(*  FORMA DE SECU_APLICACION                                                            *)
(*                                                                              *)
(***********************************************FORMA SECU_APLICACION********************)

procedure TWSecuAplicacion.FormShow(Sender: TObject);
begin
   Objeto.CVE_APLICACION.Control:=edCVE_APLICACION;
   Objeto.B_BLOQUEADO.Control:=chB_BLOQUEADO;
   Objeto.FH_PRODUCCION.Control:=edFH_PRODUCCION;
   Objeto.FH_ULT_ACCESO.Control:=edFH_ULT_ACCESO;
   Objeto.ID_PERS_RESPON.Control:=edID_PERS_RESPON;
   Objeto.NOM_APLICACION.Control:=edNOM_APLICACION;
   Objeto.NOM_ARCHIVO.Control:=edNOM_ARCHIVO;
   Objeto.PATH_ARCHIVO.Control:=edPATH_ARCHIVO;
   Objeto.TX_DESC_APLI.Control:=edTX_DESC_APLI;
   Objeto.TX_WELCOME.Control:=edTX_WELCOME;
   Objeto.B_OCULTAR.Control:=chB_OCULTAR;

   Objeto.Responsable.Nombre.Control := edNombre;
   Objeto.Responsable.MasterSourceEditControl := bResponsable;
end;

procedure TWSecuAplicacion.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_APLICACION.Control:=nil;
   Objeto.B_BLOQUEADO.Control:=nil;
   Objeto.FH_PRODUCCION.Control:=nil;
   Objeto.FH_ULT_ACCESO.Control:=nil;
   Objeto.ID_PERS_RESPON.Control:=nil;
   Objeto.NOM_APLICACION.Control:=nil;
   Objeto.NOM_ARCHIVO.Control:=nil;
   Objeto.PATH_ARCHIVO.Control:=nil;
   Objeto.TX_DESC_APLI.Control:=nil;
   Objeto.TX_WELCOME.Control:=nil;
   Objeto.B_OCULTAR.Control:=nil;

   Objeto.Responsable.Nombre.Control := nil;
   Objeto.Responsable.MasterSourceEditControl := nil;
end;

procedure TWSecuAplicacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWSecuAplicacion.InterForma1DespuesNuevo(Sender: TObject);
begin
   edFH_PRODUCCION.Text := FormatDateTime('dd/mm/yyyy', Now);
   edFH_ULT_ACCESO.Text := FormatDateTime('dd/mm/yyyy', Now);
end;

procedure TWSecuAplicacion.InterForma1DespuesModificar(Sender: TObject);
begin edFH_ULT_ACCESO.Text := FormatDateTime('dd/mm/yyyy', Now);
end;

procedure TWSecuAplicacion.bResponsableClick(Sender: TObject);
begin Objeto.Responsable.Busca;
end;

procedure TWSecuAplicacion.BitBtn2Click(Sender: TObject);
begin
	If (Objeto.Active) and (Not Objeto.PATH_ARCHIVO.IsNull) and (Not Objeto.NOM_ARCHIVO.IsNull) Then
   	OpenDialog1.FileName := Objeto.PATH_ARCHIVO.AsString + Objeto.NOM_ARCHIVO.AsString
   else
   Begin
   	If ParamStr(1) = 'P' Then OpenDialog1.FileName := 'O:\Delphipr\'
      else OpenDialog1.FileName := 'O:\Delphide\*.Exe';
   end;

	If OpenDialog1.Execute Then
   Begin
      edPATH_ARCHIVO.Text := ExtractFileDir(OpenDialog1.FileName) + '\';
      edNOM_ARCHIVO.Text := ExtractFileName(OpenDialog1.FileName);
   end;
end;

procedure TWSecuAplicacion.edNOM_APLICACIONExit(Sender: TObject);
begin
	if (Trim(edNOM_APLICACION.Text) <> '') and (Trim(edTX_DESC_APLI.Text) = '')Then
   	edTX_DESC_APLI.Text := edNOM_APLICACION.Text;
end;

procedure TWSecuAplicacion.Button1Click(Sender: TObject);
Var Menu: TMenuSegu;
begin
	If Objeto.Active Then
   Begin
      Menu:= TMenuSegu.Create(self);
      Try
         Menu.apli := Objeto.Apli;
         Menu.Aplicacion := Objeto;
         Menu.Catalogo;
      Finally
         If Menu <> nil then Menu.Free;
      end;
   end
   else Raise EInterFrame.Create('No existe un Registro para realizar la operación.');
end;

procedure TWSecuAplicacion.InterLinkit1Capture(Sender: TObject;
  var Show: Boolean);
begin Show := Not InterForma1.CanEdit;
end;

procedure TWSecuAplicacion.InterLinkit1Ejecuta(Sender: TObject);
begin Objeto.FindKey([InterLinkit1.Buffer]);
end;

procedure TWSecuAplicacion.InterForma1DespuesShow(Sender: TObject);
begin If InterForma1.FormaTipo = ftGrid Then edCVE_APLICACION.SetFocus;
end;

procedure TWSecuAplicacion.InterLinkit2Capture(Sender: TObject;
  var Show: Boolean);
begin Show := InterForma1.CanEdit;
end;

procedure TWSecuAplicacion.InterLinkit2Ejecuta(Sender: TObject);
begin Objeto.Responsable.FindKey([InterLinkit2.Buffer]);
end;


procedure TWSecuAplicacion.bAccesosClick(Sender: TObject);
Var Acceso: TAccFunPer;
begin
   If Objeto.Active Then
   Begin
      Acceso:= TAccFunPer.Create(self);
      Try
         Acceso.apli := Objeto.Apli;
         Acceso.Aplicacion := Objeto;
         Acceso.Catalogo;
      Finally
         If Acceso <> nil then Acceso.Free;
      end;
   end
   else Raise EInterFrame.Create('No existe un Registro para realizar la operación.');
end;


procedure TWSecuAplicacion.btPerfilesClick(Sender: TObject);
var Perfil:TSecGpAcc;
begin if Objeto.Active then
      begin Perfil:=TsecGpAcc.Create(Self);
            Try Perfil.Apli:= Objeto.Apli;    //Asignamos Propiedad Apli
                //Enviamos Aplicación Activa;
                Perfil.SecuApli:=Objeto;
                Perfil.Catalogo;
            Finally Perfil.Free;
            end;
       end
       else Raise EInterFrame.Create('No existe un Registro para realizar la operación.');
end;


procedure TWSecuAplicacion.btIndicadoresClick(Sender: TObject);
var Indicador:TSecIndAdi;
begin if objeto.Active then
      begin Indicador:=TSecIndAdi.Create(Self);
            Try Indicador.Apli:=Objeto.Apli;
                Indicador.SecuAplic:=Objeto;
                Indicador.Catalogo;
            Finally Indicador.Free;
            end;
      end
      else Raise EInterFrame.Create('No existe un Registro para realizar la operación.');
end;


procedure TWSecuAplicacion.Button2Click(Sender: TObject);
var Func: TSecuFunci;
begin
	if objeto.Active then
   Begin
   	Func:= TSecuFunci.Create(self);
      Try
      	Func.Apli := Objeto.Apli;
      	//Func.Aplicacion := Objeto;
      	Func.Catalogo;
      Finally
      	If Func <> nil then Func.Free;
      end;
   end
   else Raise EInterFrame.Create('No existe un Registro para realizar la operación.');
end;



procedure TWSecuAplicacion.Button5Click(Sender: TObject);
var Usuario: TSecAplUsr;
begin
	if objeto.Active then
   Begin
   	Usuario:= TSecAplUsr.Create(self);
      Try
      	Usuario.Apli := Objeto.Apli;
      	Usuario.Aplicacion := Objeto;
      	Usuario.Catalogo;
      Finally
      	If Usuario <> nil then Usuario.Free;
      end;
   end
   else Raise EInterFrame.Create('No existe un Registro para realizar la operación.');
end;


procedure TWSecuAplicacion.Button3Click(Sender: TObject);
begin
	If Objeto.Active Then Executa_VerCodigo(Objeto.CVE_APLICACION.AsString)
   else Raise EInterFrame.Create('No existe un Registro para realizar la operación.');
end;

procedure TWSecuAplicacion.Button4Click(Sender: TObject);
begin
	If Objeto.Active Then Executa_VerMenu(Objeto.CVE_APLICACION.AsString)
   else Raise EInterFrame.Create('No existe un Registro para realizar la operación.');
end;

end.
