// Sistema         : Clase de Unidad de Negocio
// Fecha de Inicio : Diciembre de 1997
// Función forma   : Clase de Unidad de Negocio
// Desarrollo por  : Alberto Ramirez
// Comentarios     : MARA4356 SEP 2008 SE AGREGA LA ENTIDAD PARA EL IPAB  ID_ENT_IPAB

unit intunneg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, Menus, RepUnNeg, IntEmpre, IntTEnt, InterEdit,
  IntPob, IntDireccion, IntDom;

type
    TUnNegocio = Class;
    TWUnNegocio = class(TForm)
    InterForma1    : TInterForma;
    BitBtn1: TBitBtn;
    EdDescEntidad: TEdit;
    EdIdEntUbica: TEdit;
    EdIdEmpresa: TEdit;
    EdCveTipoEntidad: TEdit;
    EdDescTipoEntid: TEdit;
    EdNomRazonSocial: TEdit;
    EdDescEntidadUb: TEdit;
    SpeedButton1: TSpeedButton;
    sbEmpresa: TSpeedButton;
    sbTipoEntidad: TSpeedButton;
    EdIdEntidad: TEdit;
    Label2: TLabel;
    lbCalleNumero: TLabel;
    lbIdDomicilio: TLabel;
    lbColonia: TLabel;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    Catalogo1: TMenuItem;
    Catalogo2: TMenuItem;
    GroupBox1: TGroupBox;
    ChbBCentCosto: TCheckBox;
    ChbBAbreCtos: TCheckBox;
    Bevel1: TBevel;
    Label3: TLabel;
    edIdCentCosto: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edCve_Poblacion: TEdit;
    bPoblacion: TSpeedButton;
    edCve_Direccion: TEdit;
    bDireccion: TSpeedButton;
    edNombrePoblacion: TEdit;
    edNombreDireccion: TEdit;
    PopupPoblacion: TPopupMenu;
    MenuItem2: TMenuItem;
    menu3: TMenuItem;
    PopupDireccion: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    edGeneracion: TInterEdit;
    Label7: TLabel;
    edID_ENT_IPAB: TInterEdit;
    edId_Domicilio: TEdit;
    Label8: TLabel;
    SpeedButton2: TSpeedButton;
    edCalleNumero: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure sbTipoEntidadClick(Sender : TObject);
    procedure sbEmpresaClick(Sender : TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure Catalogo1Click(Sender: TObject);
    procedure Catalogo2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure bPoblacionClick(Sender: TObject);
    procedure bDireccionClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure menu3Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    UnNeg:  TUnNegocio;
  end;

  TUnNegocio = class(TInterFrame)
  private
  protected
  public
    { Public declarations }            
    Id_Entidad		:TInterCampo;
    Id_Empresa		:TInterCampo;
    Id_ent_Ubica	:TInterCampo;
    Cve_Tipo_Entidad    :TInterCampo;
    B_Abre_Ctos		:TInterCampo;
    B_Cent_Costo	:TInterCampo;
    Desc_Entidad	:TInterCampo;
    Nom_Razon_Social	:TInterCampo;
    Desc_Entidad_Ub	:TInterCampo;
    Desc_Tipo_Entid	:TInterCampo;
    Id_Cent_Costo       :TInterCampo;
    Cve_Poblacion       :TInterCampo;
    Cve_Direccion       :TInterCampo;
    Generacion          :TInterCampo;
    ID_ENT_IPAB         :TInterCampo;
    ID_DOMICILIO        :TInterCampo;
    Empresa             :TEmpresa;
    TipoEntidad         :TTipoEnt;
    Poblacion           :TPoblacion;
    Direccion           :TDireccion;
    Domicilio	        :TDomicilio;

    function InternalBusca : Boolean; override;
    function InternalLocaliza:Boolean; override;
    function Modifica : Boolean;  override;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    function ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function  MenuOpciones(Posicion : Integer; var Titulo : String; var Enabled,Visible : Boolean) : Boolean; override;
    procedure MenuEjecuta(Tag : Integer); override;
    Function Reporte: Boolean; Override;
    Procedure DataBaseChange; Override;
  published
  end;

implementation
{$R *.DFM}

constructor TUnNegocio.Create( AOwner : TComponent );
begin
   inherited;
   Id_Entidad := CreaCampo('ID_ENTIDAD',ftInteger,tsNinguno,tsNinguno,True);
   Id_Empresa := CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,True);
   Id_ent_Ubica := CreaCampo('ID_ENT_UBICA',ftInteger,tsNinguno,tsNinguno,True);
   Cve_Tipo_Entidad := CreaCampo('CVE_TIPO_ENTIDAD',ftString,tsNinguno,tsNinguno,True);
   B_Abre_Ctos := CreaCampo('B_ABRE_CTOS',ftString,tsNinguno,tsNinguno,True);
   B_Cent_Costo := CreaCampo('B_CENT_COSTO',ftString,tsNinguno,tsNinguno,True);
   Desc_Entidad := CreaCampo('DESC_ENTIDAD',ftString,tsNinguno,tsNinguno,True);
   Nom_Razon_Social := CreaCampo('NOM_RAZON_SOCIAL',ftString,tsNinguno,tsNinguno,False);
   Desc_Entidad_Ub := CreaCampo('DESC_ENTIDAD_UB',ftString,tsNinguno,tsNinguno,False);
   Desc_Tipo_Entid := CreaCampo('DESC_TIPO_ENTID',ftString,tsNinguno,tsNinguno,False);
   Id_Cent_Costo := CreaCampo('ID_CENT_COSTO',ftInteger,tsNinguno,tsNinguno,False);
   B_Cent_Costo.Size := 1;
   Cve_Poblacion := CreaCampo('CVE_POBLACION',ftString,tsNinguno,tsNinguno,True);
   Cve_Poblacion.Size := 6;
   Cve_Direccion := CreaCampo('CVE_DIRECCION',ftString,tsNinguno,tsNinguno,True);
   Cve_Direccion.Size := 6;
   Generacion := CreaCampo('GENERACION',ftInteger,tsNinguno,tsNinguno,True);
   Generacion.Size := 2;
   ID_ENT_IPAB := CreaCampo('ID_ENT_IPAB',ftInteger,tsNinguno,tsNinguno,True);
   ID_ENT_IPAB.Size := 4; 
   ID_DOMICILIO := CreaCampo('ID_DOMICILIO',ftInteger,tsNinguno,tsNinguno,True);
   ID_DOMICILIO.Size := 6;                  
   UseQuery := True;
   FActive := False;
   TableName := 'UNIDAD_NEGOCIO';
   FKeyFields.Add('ID_ENTIDAD');
   HelpFile := 'IntUnNeg.hlp';
   ShowMenuReporte := True;
   IsCorp := True;

   Empresa := TEmpresa.Create(Self);
   Empresa.MasterSource:=Self;

   TipoEntidad := TTipoEnt.Create(Self);
   TipoEntidad.MasterSource:=Self;

   Poblacion := TPoblacion.Create(Self);
   Poblacion.MasterSource := Self;
   Poblacion.FieldByName('CVE_POBLACION').MasterField := 'CVE_POBLACION';

   Direccion := TDireccion.Create(Self);
   Direccion.MasterSource := Self;
   Direccion.FieldByName('CVE_DIRECCION').MasterField := 'CVE_DIRECCION';

   Domicilio:= TDomicilio.Create(self);
   Domicilio.MasterSource := Self;
   Domicilio.FieldByName('ID_DOMICILIO').MasterField := 'ID_DOMICILIO';
end;

destructor TUnNegocio.Destroy;
begin if  Empresa<>nil then Empresa.Free;
      if TipoEntidad<>nil then TipoEntidad.Free;
      if Direccion<>nil then Direccion.Free;
      if Poblacion<>nil then Poblacion.Free;
      if Domicilio<>nil then domicilio.free;
   inherited;
end;

Procedure TUnNegocio.DataBaseChange;
begin inherited;
      Domicilio.GetParams(self);
end;

function  TUnNegocio.MenuOpciones(Posicion:Integer; Var Titulo:String; Var Enabled,Visible:Boolean):Boolean;
begin
   Result := Inherited MenuOpciones(Posicion,Titulo,Enabled,Visible);
end;

procedure TUnNegocio.MenuEjecuta(Tag:Integer);
begin
   Inherited;
end;

function TUnNegocio.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWUnNegocio;
begin
   W:=TWUnNegocio.Create(Self);
   try
      W.UnNeg := Self;
      W.InterForma1.InterFrame:=self;
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

function TUnNegocio.InternalBusca : Boolean;
var T : TInterFindit;
    s : string;
begin
   InternalBusca := False;
   T := CreaBuscador('IntUnNeg.it','I,S');
   try
      T.WhereString := BuscaWhereString;
      if Active then T.Param(0,ID_Entidad.AsString);
      if T.Execute then
         begin
            InternalBusca := FindKey([T.DameCampo(0)]);
         end;
      finally
         T.Free;
      end;
end;

function TUnNegocio.InternalLocaliza:Boolean;
var Q,T : TQuery;
    Str1 : string;
begin
   if Active then
      begin
         Str1 := '';
         if Id_Empresa.AsString<>'' then
         begin GetSQLStr('select NOM_RAZON_SOCIAL from PERSONA_MORAL Where (ID_PERSONA='+Id_Empresa.AsString+')',
               DataBaseName,SessionName,'NOM_RAZON_SOCIAL',Str1,False);
               Nom_Razon_Social.AsString := Str1;
         end;
         Str1 := '';
         if Id_Ent_Ubica.AsString<>'' then
            begin
               GetSQLStr('SELECT DESC_ENTIDAD FROM UNIDAD_NEGOCIO WHERE (ID_ENTIDAD='+Id_Ent_Ubica.AsString+')',
                  DataBaseName,SessionName,'DESC_ENTIDAD',Str1,False);
            end;
         Desc_Entidad_Ub.AsString := Str1;
         Str1 := '';
         GetSQLStr('SELECT DESC_TIPO_ENTID FROM TIPO_ENTIDAD WHERE (CVE_TIPO_ENTIDAD='''+Cve_Tipo_Entidad.AsString+''')',
            DataBaseName,SessionName,'DESC_TIPO_ENTID',Str1,False);
         Desc_Tipo_Entid.AsString:=Str1;
      end;
end;

function TUnNegocio.Modifica : Boolean;
begin
   Modifica := False;
   Modifica := (ShowWindow(ftModifica)=mrOK);
end;

Function TUnNegocio.Reporte : Boolean;
begin
   Execute_RepUnNeg(True,Self);
end;

(***********************************************FORMA DE POBLACION***************)
(*                                                                              *)
(*  FORMA DE POBLACION                                                          *)
(*                                                                              *)
(***********************************************FORMA DE POBLACION***************)

procedure TWUnNegocio.FormShow(Sender: TObject);
begin
   UnNeg.Id_Entidad.Control := EdIdEntidad;
   UnNeg.Id_Empresa.Control := EdIdEmpresa;
   UnNeg.Id_ent_Ubica.Control := EdIdEntUbica;
   UnNeg.Cve_Tipo_Entidad.Control := EdCveTipoEntidad;
   UnNeg.B_Abre_Ctos.Control := ChbBAbreCtos;
   UnNeg.B_Cent_Costo.Control := ChbBCentCosto;
   UnNeg.Desc_Entidad.Control := EdDescEntidad;
   UnNeg.Nom_Razon_Social.Control := EdNomRazonSocial;
   UnNeg.Desc_Entidad_Ub.Control := EdDescEntidadUb;
   UnNeg.Desc_Tipo_Entid.Control := EdDescTipoEntid;
   UnNeg.Id_Cent_Costo.Control := EdIdCentCosto;
   UnNeg.Cve_Poblacion.Control := EdCve_Poblacion;
   UnNeg.Cve_Direccion.Control := EdCve_Direccion;
   UnNeg.Generacion.Control := EdGeneracion;
   UnNeg.Poblacion.Desc_Poblacion.Control := edNombrePoblacion;
   UnNeg.Direccion.DESC_L_ID_PRIM.Control := edNombreDireccion;
   UnNeg.ID_ENT_IPAB.Control := edID_ENT_IPAB;
   UnNeg.Id_Domicilio.Control   := edId_Domicilio;
   UnNeg.Domicilio.IdDomicilio.Control   := edId_Domicilio;
   UnNeg.Domicilio.CalleNumero.Control   := edCalleNumero;
end;

procedure TWUnNegocio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWUnNegocio.FormDestroy(Sender: TObject);
begin
   UnNeg.Id_Entidad.Control := nil;
   UnNeg.Id_Empresa.Control := nil;
   UnNeg.Id_ent_Ubica.Control := nil;
   UnNeg.Cve_Tipo_Entidad.Control := nil;
   UnNeg.B_Abre_Ctos.Control := nil;
   UnNeg.B_Cent_Costo.Control := nil;
   UnNeg.Desc_Entidad.Control := nil;
   UnNeg.Nom_Razon_Social.Control := nil;
   UnNeg.Desc_Entidad_Ub.Control := nil;
   UnNeg.Desc_Tipo_Entid.Control := nil;
   UnNeg.Id_Cent_Costo.Control := nil;
   UnNeg.Cve_Poblacion.Control := nil;
   UnNeg.Cve_Direccion.Control := nil;
   UnNeg.Generacion.Control := nil;
   UnNeg.Poblacion.Desc_Poblacion.Control := nil;
   UnNeg.Direccion.DESC_L_ID_PRIM.Control := nil;
   UnNeg.ID_ENT_IPAB.Control := nil;
   UnNeg.Id_Domicilio.Control   := nil;
   UnNeg.Domicilio.IdDomicilio.Control   := nil;
   UnNeg.Domicilio.CalleNumero.Control   := nil;
end;

procedure TWUnNegocio.sbTipoEntidadClick(Sender: TObject);
var FindIt : TInterFindit;
begin
  If UnNeg.ValidaAccesoEsp('UNEG_TENTID',True,True) Then
  Begin
     FindIt:=UnNeg.CreaBuscador('IntTEnt.it','S,S');
     if Trim(edCveTipoEntidad.Text)<>'' then
        FindIt.Param(0,edCveTipoEntidad.Text);
     Try
     if FindIt.Execute then
        begin
           edCveTipoEntidad.Text := FindIt.DameCampo(0);
           edDescTipoEntid.Text := FindIt.DameCampo(1);
        end;
     finally
        FindIt.Free;
     end;
  End;
end;

procedure TWUnNegocio.sbEmpresaClick(Sender: TObject);
var FindIt : TInterFindIt;
begin
  If UnNeg.ValidaAccesoEsp('UNEG_EMPRESA',True,True) Then
  Begin
    FindIt := UnNeg.CreaBuscador('IntEmpre.it','I,S');
    if Trim(edIdEmpresa.Text)<>'' then FindIt.Param(0,edIdEmpresa.Text);
      Try
      if FindIt.Execute then
         begin
            edIdEmpresa.Text := FindIt.DameCampo(0);
            edNomRazonSocial.Text := FindIt.DameCampo(1);
         end;
      Finally
         FindIt.Free;
      end;
  End;
end;

procedure TWUnNegocio.BitBtn1Click(Sender: TObject);
begin
  If UnNeg.ValidaAccesoEsp('UNEG_REPORTE',True,True) Then
  Begin
    UnNeg.Reporte;
  End;
end;


procedure TWUnNegocio.InterForma1DespuesNuevo(Sender: TObject);
begin
   edIdEntidad.SetFocus;
   UnNeg.B_Abre_Ctos.AsString := 'F';
   UnNeg.B_Cent_Costo.AsString := 'F';
end;

procedure TWUnNegocio.Catalogo1Click(Sender: TObject);
begin
   if Trim(edIdEmpresa.Text)<>'' then
      UnNeg.Empresa.FindKey([edIdEmpresa.Text]);
      UnNeg.Empresa.Catalogo;
   if (InterForma1.CanEdit)and(UnNeg.Empresa.Active) then
      begin
         edIdEmpresa.Text := UnNeg.Empresa.Id_Empresa.AsString;
      end;
end;

procedure TWUnNegocio.Catalogo2Click(Sender: TObject);
begin
   if Trim(EdCveTipoEntidad.Text)<>'' then
      UnNeg.TipoEntidad.FindKey([EdCveTipoEntidad.Text]);
      UnNeg.TipoEntidad.Catalogo;
      if (InterForma1.CanEdit)and(UnNeg.TipoEntidad.Active) then
         begin
            edCveTipoEntidad.Text := UnNeg.TipoEntidad.Cve_Tipo_Entidad.AsString;
       	    edDescTipoEntid.Text := UnNeg.TipoEntidad.Desc_Tipo_Entid.AsString;
         end;
end;

procedure TWUnNegocio.SpeedButton1Click(Sender: TObject);
var FindIt : TInterFindit;
begin
  If UnNeg.ValidaAccesoEsp('UNEG_DEPEND',True,True) Then
  Begin
     FindIt := UnNeg.CreaBuscador('IntUnNeg.it','I,S');
     if Trim(edIdEntUbica.Text)<>'' then
        FindIt.Param(0,edIdEntUbica.Text);
        Try
        if FindIt.Execute then
           begin
              edIdEntUbica.Text := FindIt.DameCampo(0);
              edDescEntidadUb.Text := FindIt.DameCampo(1);
           end;
        Finally
           FindIt.Free;
        end;
  End;
end;

procedure TWUnNegocio.InterForma1DespuesModificar(Sender: TObject);
begin
   edDescEntidad.SetFocus;
end;

procedure TWUnNegocio.bPoblacionClick(Sender: TObject);
begin
  If UnNeg.ValidaAccesoEsp('UNEG_POB',True,True) Then
  Begin
     UnNeg.Poblacion.Busca;
  End;
end;

procedure TWUnNegocio.bDireccionClick(Sender: TObject);
begin
  If UnNeg.ValidaAccesoEsp('UNEG_DIR1',True,True) Then
  Begin
     UnNeg.Direccion.Busca;
  End;
end;

procedure TWUnNegocio.MenuItem2Click(Sender: TObject);
begin
   UnNeg.Poblacion.Catalogo;
end;

procedure TWUnNegocio.MenuItem1Click(Sender: TObject);
begin
   UnNeg.Direccion.Catalogo;
end;

procedure TWUnNegocio.menu3Click(Sender: TObject);
begin
	If InterForma1.CanEdit Then
	Begin
		UnNeg.Poblacion.Active:= False;
		edCve_Poblacion.Text:= '';
		edNombrePoblacion.Text:= '';
	end;
end;

procedure TWUnNegocio.MenuItem3Click(Sender: TObject);
begin
	If InterForma1.CanEdit Then
	Begin
		UnNeg.Direccion.Active:= False;
		edCve_Direccion.Text:= '';
		edNombreDireccion.Text:= '';
	end;
end;

procedure TWUnNegocio.SpeedButton2Click(Sender: TObject);
begin
  If UnNeg.ValidaAccesoEsp('UNEG_DIR2',True,True) Then
  Begin
    UnNeg.Domicilio.Busca;
  End;
end;

end.




