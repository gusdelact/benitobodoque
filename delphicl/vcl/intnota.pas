// Sistema         : Clase de Notario
// Fecha de Inicio : Diciembre de 1997
// Función forma   : Clase de Notario
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :
unit IntNota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, IntPers, Menus, IntMPers;

type

  TNotario = Class;
  TWNotario = class(TForm)
    InterForma1 : TInterForma;
    Panel1 : TPanel;
    lbNotario: TLabel;
    edNombre: TEdit;
    BitBtn1: TBitBtn;
    sbBuscaPersona: TSpeedButton;
    PopupPFisica: TPopupMenu;
    Catlogo1: TMenuItem;
    edIdPersNotario: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sbBuscaPersonaClick(Sender: TObject);
    procedure Catalogo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Notario : TNotario;
  end;

  TNotario = class(TInterFrame)
  private
  protected
//  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    { Public declarations }
    Id_Pers_Notario : TInterCampo;
    Nombre          : TInterCampo;

	 PersonaFisica   : TMPersona;
    function    InternalLocaliza:Boolean; override;
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
//    Procedure DataBaseChange; override;
  published
  end;

implementation

Uses RepNota;
{$R *.DFM}

constructor TNotario.Create( AOwner : TComponent );
begin
   Inherited;
   Id_Pers_Notario := CreaCampo('ID_PERS_NOTARIO',ftInteger,tsNinguno,tsNinguno,True);
   Nombre := CreaCampo('NOMBRE',ftString,tsNinguno,tsNinguno,False);
   FActive := False;
   FKeyFields.Add('ID_PERS_NOTARIO');
   TableName := 'NOTARIO';
   UseQuery := True;
   HelpFile := 'IntNota.hlp';
   ShowMenuReporte:=True;

   PersonaFisica := TMPersona.Create(self);
   PersonaFisica.MasterSource := Self;
   PersonaFisica.ID_Persona.MasterField := 'ID_PERS_NOTARIO';
   PersonaFisica.Nombre.MasterField := 'NOMBRE';
   PersonaFisica.FilterBy := fbTMPersonaFisica;
   IsCorp:=True;
end;

destructor TNotario.Destroy;
begin
	if PersonaFisica <> nil then PersonaFisica.free;
	inherited;
end;

(*
Procedure TNotario.DataBaseChange;
begin PersonaFisica.GetParams(self);
end;
*)

Function TNotario.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWNotario;
begin
   W := TWNotario.Create(Self);
   try
      W.Notario := Self;
      W.InterForma1.InterFrame:=Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid  := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion   := FInterFun;
      W.InterForma1.ShowBtnModificar:=False; // ESTA ES UNA OPCION ESPECIAL SOLO PARA DESACTIVAR LA OPCION
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TNotario.InternalLocaliza:Boolean;
var Str1:String;
begin
   InternalLocaliza := False;
   GetSQLStr('SELECT NOMBRE FROM PERSONA WHERE (ID_PERSONA='+Id_Pers_Notario.AsString+')',
             DataBaseName,SessionName,'NOMBRE',Str1,False);
   Nombre.AsString:=Str1;
   InternalLocaliza := True;
end;

Function TNotario.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntNota.it','I,S,S,S');
   try
      if Active then T.Param(0,Id_Pers_Notario.AsString);
      if T.Execute then
      begin
         InternalBusca := FindKey([T.DameCampo(0)]);
         Nombre.AsString := T.DameCampo(1) + ' ' +
                            T.DameCampo(2) + ' ' +
                            T.DameCampo(3);
      end;
   finally T.Free;
   end;
end;


function TNotario.Reporte:Boolean;
begin Execute_RepNota(True,Self);
end;

(***********************************************FORMA DE NOTARIO*****************)
(*                                                                              *)
(*  FORMA DE NOTARIO                                                            *)
(*                                                                              *)
(***********************************************FORMA DE NOTARIO*****************)

procedure TWNotario.FormShow(Sender: TObject);
begin
   Notario.Id_Pers_Notario.Control := edIdPersNotario;
   Notario.Nombre.Control := edNombre;
end;

procedure TWNotario.FormDestroy(Sender: TObject);
begin
   Notario.Id_Pers_Notario.Control := nil;
   Notario.Nombre.Control := nil;
end;

procedure TWNotario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWNotario.InterForma1DespuesNuevo(Sender: TObject);
begin
   edIdPersNotario.SetFocus;
end;

procedure TWNotario.InterForma1DespuesModificar(Sender: TObject);
begin
   edIdPersNotario.SetFocus;
end;

procedure TWNotario.BitBtn1Click(Sender: TObject);
begin
   Notario.Reporte;
end;

procedure TWNotario.sbBuscaPersonaClick(Sender: TObject);
//var FindIt : TInterFindit;
begin
	Notario.PersonaFisica.Busca;
{   FindIt := Notario.CreaBuscador('IntPFis.it','I,S,S,S');
   try
   if Trim(edIdPersNotario.Text)<>'' then
      FindIt.Param(0,edIdPersNotario.Text);
   if FindIt.Execute then
      begin
         edIdPersNotario.Text := FindIt.DameCampo(0);
         edNombre.Text := FindIt.DameCampo(1) + ' ' + FindIt.DameCampo(2)
                          + ' ' + FindIt.DameCampo(3);
      end;
   {end-if}
{   finally
      FindIt.Free;
   end;}
end;

procedure TWNotario.Catalogo1Click(Sender: TObject);
{Var PFisica : TPersona;
    Campo   : String;}
begin
	Notario.PersonaFisica.Catalogo;
{   PFisica := TPersona.Create(Notario);
   PFisica.GetParams(Notario);
   PFisica.FilterBy := 1;       // Mostrar solo personas fisicas
   try
      if edIdPersNotario.Text<>'' then
         PFisica.FindKey([edIdPersNotario.Text]);
      PFisica.Catalogo;
      if InterForma1.CanEdit then
         begin
            if PFisica.Active then
               begin
                  edIdPersNotario.Text := IntToStr(PFisica.Id_Persona.AsInteger);
               end;
        end;
   finally
      PFisica.Free;
   end;}
end;

end.



