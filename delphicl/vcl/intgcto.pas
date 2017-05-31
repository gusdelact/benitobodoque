// Sistema         : Clase de Grupos de Contrato
// Fecha de Inicio : Diciembre de 1997
// Función forma   : Clase de Grupos de Contrato
// Desarrollo por  : Julio Ruiloba
// Comentarios     :

unit IntGcto;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, DBCtrls, Menus, IntMPers,
  IntTgpContra;
type
  TGpoCto = Class;
  TWGpoCto = class(TForm)
    InterForma1 : TInterForma;
    PopupAsociado : TPopupMenu;
    PopupAutorizado : TPopupMenu;
    Catlogo1 : TMenuItem;
    Catlogo2 : TMenuItem;
    lbDescGpoContrat: TLabel;
    lbIdPersPromAut: TLabel;
    Label1: TLabel;
    lbIdPersAsociad: TLabel;
    lbIdGrupo: TLabel;
    edIdGrupo: TEdit;
    edIdPersAsociad: TEdit;
    edNumPromotor: TEdit;
    edIdPersPromAut: TEdit;
	 edDescGpoContrat: TEdit;
    sbAutorizado: TSpeedButton;
	 sbAsociado: TSpeedButton;
    edNombreAsociado: TEdit;
    edNombreAutorizado: TEdit;
    BitBtn1: TBitBtn;
    rgSitGpoContrato: TRadioGroup;
    Label2: TLabel;
    bEjecCta: TSpeedButton;
    edIdEjecCta: TEdit;
    edNombreEjecCta: TEdit;
    PopupEjecutivo: TPopupMenu;
    MenuItem1: TMenuItem;
    Sinseleccionar1: TMenuItem;
    Label3: TLabel;
    cbInterpesos: TCheckBox;
    cbFinanciero: TCheckBox;
    edCveTipoGpo: TEdit;
    bTipoGpo: TSpeedButton;
    edNombreGrupo: TEdit;
    PopupTipo: TPopupMenu;
    MenuItem2: TMenuItem;
    menu3: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
	 procedure InterForma1DespuesNuevo(Sender : TObject);
    procedure InterForma1DespuesModificar(Sender : TObject);
    procedure BitBtn1Click(Sender : TObject);
    procedure Catlogo1Click(Sender : TObject);
    procedure Catlogo2Click(Sender : TObject);
    procedure sbAsociadoClick(Sender : TObject);
    procedure sbAutorizadoClick(Sender : TObject);
    procedure bEjecCtaClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure Sinseleccionar1Click(Sender: TObject);
    procedure bTipoGpoClick(Sender: TObject);
    procedure menu3Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private { Private declarations }
  public  { Public declarations }
    Objeto : TGpoCto;
  end;

  TGpoCto = class(TInterFrame)
  private
  protected
  public { Public declarations }
	 Id_Grupo         : TInterCampo;
	 Id_Pers_Asociad  : TInterCampo;
	 Id_Pers_Prom_Aut : TInterCampo;
	 Id_Ejec_Cta      : TInterCampo;
	 NUM_PROMOTOR     : TInterCampo;
	 Sit_Gpo_Contrato : TInterCampo;
	 Cve_Tipo_Gpo     : TInterCampo;
         B_AP_Presup_IP   : TInterCampo;
         B_AP_Presup_FI   : TInterCampo;

         Desc_Gpo_Contrat : TInterCampo;
         PromAsociado     : TMPersona;
	 PromAutorizado   : TMPersona;
	 Ejecutivo        : TMPersona;
         TipoGpo          : TTGpContra;

	 Function    InternalLocaliza : Boolean; override;
	 function    InternalBusca : Boolean; override;
	 constructor Create(AOwner : TComponent); override;
	 destructor  Destroy; override;
	 function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
	 function    Reporte : Boolean; override;
//    Procedure   DataBaseChange; Override;
  published
  end;

implementation

Uses RepGCto;
{$R *.DFM}

constructor TGpoCto.Create(AOwner : TComponent);
begin
   Inherited;
   Id_Grupo  := CreaCampo('ID_GRUPO',ftInteger,tsNinguno,tsNinguno,True);
   Id_Pers_Asociad := CreaCampo('ID_PERS_ASOCIAD',ftInteger,tsNinguno,tsNinguno,True);
	Id_Pers_Prom_Aut := CreaCampo('ID_PERS_PROM_AUT',ftInteger,tsNinguno,tsNinguno,True);
	Id_Ejec_Cta      := CreaCampo('ID_EJEC_CTA',ftInteger,tsNinguno,tsNinguno,True);
	Desc_Gpo_Contrat := CreaCampo('DESC_GPO_CONTRAT',ftString,tsNinguno,tsNinguno,True);
	NUM_PROMOTOR     :=CreaCampo('NUM_PROMOTOR',ftInteger,tsNinguno,tsNinguno,True);
	Sit_Gpo_Contrato :=CreaCampo('SIT_GPO_CONTRATO',ftString,tsNinguno,tsNinguno,True);
	Cve_Tipo_Gpo     :=CreaCampo('CVE_TIPO_GPO',ftString,tsNinguno,tsNinguno,True);
        B_AP_Presup_IP   :=CreaCampo('B_AP_PRESUP_IP',ftString,tsNinguno,tsNinguno,True);
        B_AP_Presup_IP.Size := 1;
        B_AP_Presup_FI   :=CreaCampo('B_AP_PRESUP_FI',ftString,tsNinguno,tsNinguno,True);
        B_AP_Presup_FI.Size := 1;

	With Sit_Gpo_Contrato do
	Begin
		Size := 2;
		UseCombo := True;
		ComboDatos.Add('AC');		ComboLista.Add('0');
		ComboDatos.Add('IN');		ComboLista.Add('1');
	end;

	FActive := False;
	FKeyFields.Add('ID_PERS_ASOCIAD');
	FKeyFields.Add('ID_GRUPO');
	TableName := 'GPO_CONTRATO';
	UseQuery := True;
	HelpFile := 'IntGCto.hlp';
	ShowMenuReporte := True;

	PromAsociado := TMPersona.Create(Self);
	PromAsociado.FilterBy := fbTMPersonaEmpleado;
	PromAsociado.MasterSource := Self;
	PromAsociado.FieldByName('ID_PERSONA').MasterField := 'ID_PERS_ASOCIAD';
	PromAsociado.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

	PromAutorizado := TMPersona.Create(Self);
	PromAutorizado.FilterBy := fbTMPersonaEmpleado;
	PromAutorizado.MasterSource := Self;
	PromAutorizado.FieldByName('ID_PERSONA').MasterField := 'ID_PERS_PROM_AUT';
	PromAutorizado.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

	Ejecutivo := TMPersona.Create(Self);
	Ejecutivo.FilterBy := fbTMPersonaEmpleado;
	Ejecutivo.MasterSource := Self;
	Ejecutivo.FieldByName('ID_PERSONA').MasterField := 'ID_EJEC_CTA';
	Ejecutivo.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

	TipoGpo := TTGpContra.Create(Self);
	TipoGpo.MasterSource := Self;
	TipoGpo.FieldByName('CVE_TIPO_GPO').MasterField := 'CVE_TIPO_GPO';

	UseLink:= True;
	IsCorp:=True;
end;

destructor TGpoCto.Destroy;
begin
	if PromAsociado <> nil then PromAsociado.Free;
	if PromAutorizado <> nil then PromAutorizado.Free;
	If Ejecutivo <> nil Then Ejecutivo.Free;
	If TipoGpo <> nil Then TipoGpo.Free;        
	inherited;
end;

(*
procedure TGpoCto.DataBaseChange;
begin
	PromAsociado.GetParams(Self);
	PromAutorizado.GetParams(Self);
end;
*)

Function TGpoCto.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var W : TWGpoCto;
begin
	W := TWGpoCto.Create(Self);
	try
		W.Objeto := Self;
		W.InterForma1.InterFrame:=Self;
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

function TGpoCto.InternalLocaliza : Boolean;
begin
	FInternalDataSource.DataSet := FQuery;
end;

function TGpoCto.InternalBusca : Boolean;
Var T : TInterFindit;
begin
	InternalBusca := False;
	T := CreaBuscador('IntGCto.it','S,S,S,S');
	T.CamposResultado := '';
	try
		if T.Execute then
			begin
				InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
			end;
		{end-if}
		finally
			T.Free;
		end; {end-try}
		InternalBusca := True;
end;

function TGpoCto.Reporte : Boolean;
begin
  Execute_RepGCto(True,Self);
end;

(***********************************************FORMA DE GRUPOS DE CONTRATO******)
(*                                                                              *)
(*  FORMA DE GRUPOS DE CONTRATO                                                 *)
(*                                                                              *)
(***********************************************FORMA DE GRUPOS DE CONTRATO******)

procedure TWGpoCto.FormShow(Sender : TObject);
begin
	Objeto.Id_Grupo.Control                       := edIdGrupo;
	Objeto.Id_Pers_Asociad.Control                := edIdPersAsociad;
	Objeto.Id_Pers_Prom_Aut.Control               := edIdPersPromAut;
	Objeto.Id_Ejec_Cta.Control		      := edIdEjecCta;
	Objeto.Desc_Gpo_Contrat.Control               := edDescGpoContrat;
	Objeto.Num_Promotor.Control                   := edNumPromotor;
	Objeto.Sit_Gpo_Contrato.Control		      := rgSitGpoContrato;
	Objeto.Cve_Tipo_Gpo.Control                   := edCveTipoGpo;
        Objeto.B_AP_Presup_IP.Control                 := cbInterpesos;
        Objeto.B_AP_Presup_FI.Control                 := cbFinanciero;
	Objeto.PromAsociado.Nombre.Control            := edNombreAsociado;
	Objeto.PromAsociado.MasterSourceEditControl   := sbAsociado;
	Objeto.PromAutorizado.Nombre.Control          := edNombreAutorizado;
	Objeto.PromAutorizado.MasterSourceEditControl := sbAutorizado;
	Objeto.Ejecutivo.Nombre.Control		      := edNombreEjecCta;
	Objeto.TipoGpo.DESC_L_ID_PRIM.Control         := edNombreGrupo;
end;

procedure TWGpoCto.FormDestroy(Sender : TObject);
begin
	Objeto.Id_Grupo.Control                       := nil;
	Objeto.Id_Pers_Asociad.Control                := nil;
	Objeto.Id_Pers_Prom_Aut.Control               := nil;
	Objeto.Id_Ejec_Cta.Control		      := nil;
	Objeto.Desc_Gpo_Contrat.Control               := nil;
	Objeto.Num_Promotor.Control                   := nil;
	Objeto.Sit_Gpo_Contrato.Control		      := nil;
	Objeto.Cve_Tipo_Gpo.Control                   := nil;
        Objeto.B_AP_Presup_IP.Control                 := nil;
        Objeto.B_AP_Presup_FI.Control                 := nil;
	Objeto.PromAsociado.Nombre.Control            := nil;
	Objeto.PromAsociado.MasterSourceEditControl   := nil;
	Objeto.PromAutorizado.Nombre.Control          := nil;
	Objeto.PromAutorizado.MasterSourceEditControl := nil;
	Objeto.Ejecutivo.Nombre.Control		      := nil;
	Objeto.TipoGpo.DESC_L_ID_PRIM.Control         := nil;        
end;

procedure TWGpoCto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWGpoCto.InterForma1DespuesNuevo(Sender : TObject);
begin
	edIdGrupo.SetFocus;
	rgSitGpoContrato.ItemIndex := 0;
	cbFinanciero.Checked := True;
end;

procedure TWGpoCto.InterForma1DespuesModificar(Sender : TObject);
begin edDescGpoContrat.SetFocus;
end;

procedure TWGpoCto.BitBtn1Click(Sender : TObject);
begin 
  If Objeto.ValidaAccesoEsp('GCTO_REPORTE',True,True) Then
  Begin
    Objeto.Reporte;
  End;
end;

procedure TWGpoCto.Catlogo1Click(Sender : TObject);
begin Objeto.PromAsociado.Catalogo;
end;

procedure TWGpoCto.Catlogo2Click(Sender : TObject);
begin Objeto.PromAutorizado.Catalogo;
end;

procedure TWGpoCto.sbAsociadoClick(Sender : TObject);
begin
  If Objeto.ValidaAccesoEsp('GCTO_PROMASOC',True,True) Then
  Begin
    Objeto.PromAsociado.Busca;
  End;
end;

procedure TWGpoCto.sbAutorizadoClick(Sender : TObject);
begin
  If Objeto.ValidaAccesoEsp('GCTO_PROMAUT',True,True) Then
  Begin
    Objeto.PromAutorizado.Busca;
  End;
end;

procedure TWGpoCto.bEjecCtaClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('GCTO_EJECTA',True,True) Then
  Begin
    Objeto.Ejecutivo.Busca;
  End;
end;


procedure TWGpoCto.MenuItem1Click(Sender: TObject);
begin	Objeto.Ejecutivo.Catalogo;
end;

procedure TWGpoCto.Sinseleccionar1Click(Sender: TObject);
begin
	If InterForma1.CanEdit Then
	Begin
		Objeto.Ejecutivo.Active:= False;
		edIdEjecCta.Text:= '';
		edNombreEjecCta.Text:= '';
	end;
end;

procedure TWGpoCto.bTipoGpoClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('GCTO_TGPO',True,True) Then
  Begin
    Objeto.TipoGpo.Busca;
  End;
end;

procedure TWGpoCto.menu3Click(Sender: TObject);
begin
	If InterForma1.CanEdit Then
	Begin
		Objeto.TipoGpo.Active:= False;
		edCveTipoGpo.Text:= '';
		edNombreGrupo.Text:= '';
	end;
end;

procedure TWGpoCto.MenuItem2Click(Sender: TObject);
begin
   Objeto.TipoGpo.Catalogo;
end;

end.
