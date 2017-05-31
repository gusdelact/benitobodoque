// Sistema         : Clase de Poblacion
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Poblacion
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :

unit intpobingr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, RepPob;

type

  Tpoblacioningr = Class;
  TWPoblacionIngr = class(TForm)
    InterForma1    : TInterForma;
    lbIdDomicilio: TLabel;
    EdCvePoblacion: TEdit;
    EdPoblacion: TEdit;
    lbCalleNumero: TLabel;
    lbColonia: TLabel;
    sbTipoPoblacion: TSpeedButton;
    EdTipo: TEdit;
    EdUbicacion: TEdit;
    sbUbicacion: TSpeedButton;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    edCvePzaSpeua: TEdit;
    Label3: TLabel;
    cbCveRetieneImp: TComboBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
	 procedure FormDestroy(Sender : TObject);
    procedure sbTipoPoblacionClick(Sender : TObject);
    procedure sbUbicacionClick(Sender : TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Pob : Tpoblacioningr;
  end;

  Tpoblacioningr = class(TInterFrame)
  private
  protected
//  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
	 { Public declarations }
	 Cve_Poblacion       : TInterCampo;
	 Cve_Tipo_Poblac     : TInterCampo;
	 Cve_Poblac_Ubic     : TInterCampo;
	 Desc_Poblacion      : TInterCampo;
	 Cve_Retiene_Imp		: TInterCampo;
	 Cve_Pza_Speua			: TInterCampo;
		 
	 Desc_Cve_Tipo_Poblac : TInterCampo;
	 Desc_Cve_Poblac_Ubic : TInterCampo;
		 
	 function InternalBusca : Boolean; override;
	 function InternalLocaliza:Boolean; override;
	 constructor Create( AOwner : TComponent ); override;
	 destructor Destroy; override;
	 function   ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
	 function   MenuOpciones(Posicion : Integer; var Titulo : String; var Enabled,Visible : Boolean) : Boolean; override;
	 procedure  MenuEjecuta(Tag : Integer); override;
	 Function   Reporte: Boolean; Override;
	 Procedure  SetFilterBy(Filter:Integer); override;
  published
  end;

const
     fbTPoblacionPais = 1;

implementation
{$R *.DFM}

constructor Tpoblacioningr.Create( AOwner : TComponent );
begin
   inherited;
	Cve_Poblacion := CreaCampo('CVE_POBLACION',ftString,tsNinguno,tsNinguno,True);
	Cve_Tipo_Poblac := CreaCampo('CVE_TIPO_POBLAC',ftString,tsNinguno,tsNinguno,True);
	Cve_Tipo_Poblac.Size := 2;
	Cve_Poblac_Ubic := CreaCampo('CVE_POBLAC_UBIC',ftString,tsNinguno,tsNinguno,True);
	Desc_Poblacion := CreaCampo('DESC_POBLACION',ftString,tsNinguno,tsNinguno,True);
	Cve_Retiene_Imp:= CreaCampo('CVE_RETIENE_IMP',ftString,tsNinguno,tsNinguno,True);
	With Cve_Retiene_Imp do
	Begin
		Size:= 4;
		UseCombo:= True;
		ComboLista.Add('Con Tratado');			ComboDatos.Add('CTRA');
		ComboLista.Add('Sin Tratado');			ComboDatos.Add('STRA');
		ComboLista.Add('Paraiso Fiscal');		ComboDatos.Add('PAFI');
		ComboLista.Add('Otro');						ComboDatos.Add('OTRO');
	end;

	Cve_Pza_Speua:= CreaCampo('CVE_PZA_SPEUA',ftInteger,tsNinguno,tsNinguno,True);

	Desc_Cve_Tipo_Poblac := CreaCampo('DESC_CVE_TIPO_POBLAC',ftString,tsNinguno,tsNinguno,False);
	Desc_Cve_Poblac_Ubic := CreaCampo('DESC_CVE_POBLAC_UBIC',ftString,tsNinguno,tsNinguno,False);
   FActive := False;
   FKeyFields.Add('CVE_POBLACION');
   TableName := 'POBLACION';
	UseQuery := True;
	HelpFile := 'IntPob.hlp';
	ShowMenuReporte := True;
	IsCorp:=True;
end;

destructor Tpoblacioningr.Destroy;
begin inherited;
end;

function  Tpoblacioningr.MenuOpciones(Posicion:Integer; Var Titulo:String; Var Enabled,Visible:Boolean):Boolean;
begin //Ejemplo para Crear una Opción Adicional al Menu Pop y Ocultar Otra.
      Result := Inherited MenuOpciones(Posicion,Titulo,Enabled,Visible);
      (* Quitar estos comentarios para ver el cambio en el menu!!  abajo Tambien!!
      Case Posicion of
      6:begin Titulo:='Mi Nueva Opcion'; Result:=True; end;
      end;
      *)
end;

procedure Tpoblacioningr.MenuEjecuta(Tag:Integer);
begin //Ejemplo para Crear una Opción Adicional al Menu Pop y Ocultar Otra.
		Inherited;
		(*  Quitar estos comentarios para ver el cambio en el menu!!
		Case Tag of
		6: begin ShowMEssage('Mi Nueva Opcion');
			end;
		end;
		*)
end;

function Tpoblacioningr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWpoblacioningr;
begin W:=TWpoblacioningr.Create(Self);
		try W.Pob := Self;
			 W.InterForma1.InterFrame:=Self;
			 W.InterForma1.FormaTipo := FormaTipo;
			 W.InterForma1.ShowGrid := False;
			 W.InterForma1.ShowNavigator := False;
			 W.InterForma1.Funcion := FInterFun;
			 W.InterForma1.ShowModal;
			 ShowWindow := W.InterForma1.ModalResult;
		finally W.Free;
		end;
end;


function Tpoblacioningr.InternalBusca:Boolean;
var T:TInterFindit;
	 s: string;
begin
	InternalBusca := False;
	T:=CreaBuscador('IntPob.it','S,S');
	try 
		Case FilterBy of
		fbTPoblacionPais: 
			Begin 
				S:='(POBLACION.CVE_TIPO_POBLAC = ''PA'')';
				AddSql (s,BuscaWhereString);
			End;
		else s:=BuscaWhereString;
		end;

		T.WhereString:=s;
		if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
	finally T.Free;
	end;
end;


Procedure Tpoblacioningr.SetFilterBy(Filter:Integer);
begin Inherited;
		Case Filter of
		fbTPoblacionPais:FilterString:='(CVE_TIPO_POBLAC = ''PA'')'
						else FilterString:='';
		end;
end;

Function Tpoblacioningr.InternalLocaliza:Boolean;
var T:TQuery;
	 s: String;
begin InternalLocaliza:=False;
		if CVE_TIPO_POBLAC.AsString = 'PA' then
					  T := GetSQLQuery('SELECT DESC_TIPO_POBLAC, '' '' AS DESC_POBLACION'+
					  ' FROM TIPO_POBLACION ' +
					  ' WHERE (TIPO_POBLACION.CVE_TIPO_POBLAC='+#39+CVE_TIPO_POBLAC.AsString+#39+')'
					  ,DataBaseName,SessionName,True)
			else
				T := GetSQLQuery('SELECT DESC_TIPO_POBLAC, DESC_POBLACION '+
					  ' FROM POBLACION,TIPO_POBLACION ' +
					  ' WHERE (TIPO_POBLACION.CVE_TIPO_POBLAC='+#39+CVE_TIPO_POBLAC.AsString+#39+')' +
					  ' and (CVE_POBLACION='+#39+CVE_POBLAC_UBIC.AsString+#39+')'
					  ,DataBaseName,SessionName,True);
		Try
				if T<>nil then
					begin DESC_CVE_TIPO_POBLAC.AsString:=T.FieldByName('DESC_TIPO_POBLAC').AsString;
							DESC_CVE_POBLAC_UBIC.AsString:=T.FieldByName('DESC_POBLACION').AsString;
							//Free; T:=nil;
					end
				else
					begin DESC_CVE_TIPO_POBLAC.AsString:='<Error No Encontrado>';
							DESC_CVE_POBLAC_UBIC.AsString:='<Error No Encontrado>';
					end;
		Finally if T<>nil then T.Free;
		end;
		InternalLocaliza:=True;
end;

Function Tpoblacioningr.Reporte: Boolean;
Begin Execute_RepPob(True,Self);
End;

(***********************************************FORMA DE POBLACION***************)
(*                                                                              *)
(*  FORMA DE POBLACION                                                          *)
(*                                                                              *)
(***********************************************FORMA DE POBLACION***************)

procedure TWpoblacioningr.FormShow(Sender: TObject);
begin 
	Pob.Cve_Poblacion.Control := EdCvePoblacion;
	Pob.Desc_Poblacion.Control := EdPoblacion;
	Pob.Desc_Cve_Tipo_Poblac.Control := EdTipo;
	Pob.Desc_Cve_Poblac_Ubic.Control := EdUbicacion;
	Pob.Cve_Retiene_Imp.Control:= cbCveRetieneImp;
	Pob.Cve_Pza_Speua.Control:= edCvePzaSpeua;	
end;

procedure TWPoblacionIngr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWPoblacionIngr.FormDestroy(Sender: TObject);
begin 
	Pob.Cve_Poblacion.Control:= nil;
	Pob.Desc_Poblacion.Control:= nil;
	Pob.Desc_Cve_Tipo_Poblac.Control:= nil;
	Pob.Desc_Cve_Poblac_Ubic.Control:= nil;
	Pob.Cve_Retiene_Imp.Control:= nil;
	Pob.Cve_Pza_Speua.Control:= nil;
end;

procedure TWPoblacionIngr.sbTipoPoblacionClick(Sender: TObject);
var T:TInterFindit;
begin T := Pob.CreaBuscador('IntTPob.it','S,S');
		try Case Pob.FilterBy of
			 fbTPoblacionPais: T.WhereString := '(CVE_TIPO_POBLAC = ''PA'')';
			 end;
			 if T.Execute then
				 begin Pob.Cve_Tipo_Poblac.AsString := T.DameCampo(0);
						 Pob.Desc_Cve_Tipo_Poblac.AsString := T.DameCampo(1);
						 if T.DameCampo(0) = 'PA' then
						 begin Pob.Cve_Poblac_Ubic.AsString := '';
								 Pob.Desc_Cve_Poblac_Ubic.AsString := '';
						 end; {end-if}
				 end;{end-if}
		 finally T.Free;
		 end;
end;

procedure TWPoblacionIngr.sbUbicacionClick(Sender: TObject);
var T:TInterFindit;
begin T := Pob.CreaBuscador('Ubica.it','S,S');
		try T.Param(0,Pob.Cve_Poblac_Ubic.AsString);
			 if Pob.Cve_Tipo_Poblac.AsString = '' then
				begin ShowMessage('Debe seleccionar un tipo de población');
						Exit;
				end;
				{end-if}
				if Pob.Cve_Tipo_Poblac.AsString = 'PA'
				then begin ShowMessage('Un país no requiere de ubicación');
							  Exit;
					  end;
				if Pob.Cve_Tipo_Poblac.AsString = 'CD'
					then T.WhereString := 'CVE_TIPO_POBLAC = ' + #39 + 'ES' + #39;
				if Pob.Cve_Tipo_Poblac.AsString = 'ES'
					then T.WhereString := 'CVE_TIPO_POBLAC = ' + #39 + 'PA' + #39;
				if T.Execute
				then begin Pob.Cve_Poblac_Ubic.AsString := T.DameCampo(0);
							  Pob.Desc_Cve_Poblac_Ubic.AsString := T.DameCampo(1);
					  end;
		finally T.Free;
		end;
end;

procedure TWPoblacionIngr.BitBtn1Click(Sender: TObject);
begin Pob.Reporte;
end;

procedure TWPoblacionIngr.InterForma1DespuesNuevo(Sender: TObject);
begin EdCvePoblacion.SetFocus;
end;

procedure TWPoblacionIngr.InterForma1DespuesModificar(Sender: TObject);
begin EdPoblacion.SetFocus;
end;


end.



