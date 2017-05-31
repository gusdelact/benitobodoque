// Sistema         : Clase de Poblacion
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Poblacion
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :

unit IntPob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, RepPob, InterEdit;

type

  TPoblacion = Class;
  TWPoblacion = class(TForm)
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
    Label4: TLabel;
    edCVE_LOC_SITI: TEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    iedPtosRiesgoZG: TInterEdit;
    Label6: TLabel;
    iedPtosRiesgoNac: TInterEdit;
    Label7: TLabel;
    iedPctIva: TEdit;
    Label8: TLabel;
    edCvePoblacionCorpo: TEdit;
    chkParaisoFiscal: TCheckBox;
    chkPaisTratado: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
	 procedure FormDestroy(Sender : TObject);
    procedure sbTipoPoblacionClick(Sender : TObject);
    procedure sbUbicacionClick(Sender : TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Pob : TPoblacion;
  end;

  TPoblacion = class(TInterFrame)
  private
  protected
//  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
	 { Public declarations }
	 Cve_Poblacion        : TInterCampo;
	 Cve_Tipo_Poblac      : TInterCampo;
	 Cve_Poblac_Ubic      : TInterCampo;
	 Desc_Poblacion       : TInterCampo;
	 Cve_Retiene_Imp		  : TInterCampo;
	 Cve_Pza_Speua			  : TInterCampo;
   CVE_LOC_SITI         : TInterCampo;
   Ptos_Riesgo_ZG       : TInterCampo;
   Ptos_Riesgo_Nac      : TInterCampo;

	 Desc_Cve_Tipo_Poblac : TInterCampo;
	 Desc_Cve_Poblac_Ubic : TInterCampo;
         PCT_IVA : TInterCampo;

   {RAPA4293 10Mar2014 CvePoblacionCorpo en los nuevos sistemas PCORPO.Poblacion.Cve_Poblacion_Corpo}
   cvePoblacionCorpo: TInterCampo;

   //Luis Hernandez
   B_Paraiso_Fiscal     : TInterCampo;
   B_Pais_Tributacion   : TInterCampo;


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

constructor TPoblacion.Create( AOwner : TComponent );
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
		ComboLista.Add('Con Tratado');		ComboDatos.Add('CTRA');
		ComboLista.Add('Sin Tratado');		ComboDatos.Add('STRA');
		ComboLista.Add('Paraiso Fiscal');	ComboDatos.Add('PAFI');
    ComboLista.Add('Nacional');				ComboDatos.Add('NAC');
    ComboLista.Add('Extranjero');			ComboDatos.Add('EXT');
		ComboLista.Add('Otro');						ComboDatos.Add('OTRO');
	end;

	Cve_Pza_Speua:= CreaCampo('CVE_PZA_SPEUA',ftInteger,tsNinguno,tsNinguno,True);
  CVE_LOC_SITI := CreaCampo('CVE_LOC_SITI',ftString,tsNinguno,tsNinguno,True);
    CVE_LOC_SITI.Size := 8;
  Ptos_Riesgo_ZG:= CreaCampo('PTOS_RIESGO_ZG', ftFloat, tsNinguno, tsNinguno, True);
  Ptos_Riesgo_NAC:= CreaCampo('PTOS_RIESGO_NAC', ftFloat, tsNinguno, tsNinguno, True);


	Desc_Cve_Tipo_Poblac := CreaCampo('DESC_CVE_TIPO_POBLAC',ftString,tsNinguno,tsNinguno,False);
	Desc_Cve_Poblac_Ubic := CreaCampo('DESC_CVE_POBLAC_UBIC',ftString,tsNinguno,tsNinguno,False);
        PCT_IVA := CreaCampo('PCT_IVA', ftFloat, tsNinguno, tsNinguno, True);

  {RAPA4293 10Mar2014 CvePoblacionCorpo en los nuevos sistemas PCORPO.Poblacion.Cve_Poblacion_Corpo}
  cvePoblacionCorpo:= CreaCampo('CVE_POBLACION_CORPO', ftString, tsNinguno, tsNinguno, True);
  cvePoblacionCorpo.IsRequiered:= true;
  // Luis Hernandez Noviembre 2014 Requerimietos Fiscales
  B_Paraiso_Fiscal  := CreaCampo('B_PARAISO_FISCAL', ftString, tsNinguno, tsNinguno, True);
  B_Pais_Tributacion:= CreaCampo('B_PAIS_TRIBUTACION', ftString, tsNinguno, tsNinguno, True);


  FActive := False;
  FKeyFields.Add('CVE_POBLACION');
  TableName := 'POBLACION';
	UseQuery := True;
	HelpFile := 'IntPob.hlp';
	ShowMenuReporte := True;
	IsCorp:=True;
//  Debug:= True;
end;

destructor TPoblacion.Destroy;
begin inherited;
end;

function  TPoblacion.MenuOpciones(Posicion:Integer; Var Titulo:String; Var Enabled,Visible:Boolean):Boolean;
begin //Ejemplo para Crear una Opción Adicional al Menu Pop y Ocultar Otra.
      Result := Inherited MenuOpciones(Posicion,Titulo,Enabled,Visible);
      (* Quitar estos comentarios para ver el cambio en el menu!!  abajo Tambien!!
      Case Posicion of
      6:begin Titulo:='Mi Nueva Opcion'; Result:=True; end;
      end;
      *)
end;

procedure TPoblacion.MenuEjecuta(Tag:Integer);
begin //Ejemplo para Crear una Opción Adicional al Menu Pop y Ocultar Otra.
		Inherited;
		(*  Quitar estos comentarios para ver el cambio en el menu!!
		Case Tag of
		6: begin ShowMEssage('Mi Nueva Opcion');
			end;
		end;
		*)
end;

function TPoblacion.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWPoblacion;
begin W:=TWPoblacion.Create(Self);
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


function TPoblacion.InternalBusca:Boolean;
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


Procedure TPoblacion.SetFilterBy(Filter:Integer);
begin Inherited;
		Case Filter of
		fbTPoblacionPais:FilterString:='(CVE_TIPO_POBLAC = ''PA'')'
						else FilterString:='';
		end;
end;

Function TPoblacion.InternalLocaliza:Boolean;
var T:TQuery;
	 s: String;
begin InternalLocaliza:=False;

  if Ptos_Riesgo_ZG.Control <> nil Then
  Begin
    If (Cve_Tipo_Poblac.AsString = 'PA') or (Cve_Tipo_Poblac.AsString = 'ES') Then
      Ptos_Riesgo_ZG.Control.Tag:= 18
    else Ptos_Riesgo_ZG.Control.Tag:= -1;
  end;

  if Ptos_Riesgo_Nac.Control <> nil Then
  Begin
    If (Cve_Tipo_Poblac.AsString = 'PA') Then
      Ptos_Riesgo_Nac.Control.Tag:= 18
    else Ptos_Riesgo_Nac.Control.Tag:= -1;
  end;

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

Function TPoblacion.Reporte: Boolean;
Begin Execute_RepPob(True,Self);
End;

(***********************************************FORMA DE POBLACION***************)
(*                                                                              *)
(*  FORMA DE POBLACION                                                          *)
(*                                                                              *)
(***********************************************FORMA DE POBLACION***************)

procedure TWPoblacion.FormShow(Sender: TObject);
begin
	Pob.Cve_Poblacion.Control := EdCvePoblacion;
	Pob.Desc_Poblacion.Control := EdPoblacion;
	Pob.Desc_Cve_Tipo_Poblac.Control := EdTipo;
	Pob.Desc_Cve_Poblac_Ubic.Control := EdUbicacion;
	Pob.Cve_Retiene_Imp.Control:= cbCveRetieneImp;
	Pob.Cve_Pza_Speua.Control:= edCvePzaSpeua;
        Pob.CVE_LOC_SITI.Control := EDCVE_LOC_SITI;
        Pob.Ptos_Riesgo_ZG.Control:= iedPtosRiesgoZG;
        Pob.Ptos_Riesgo_Nac.Control:= iedPtosRiesgoNac;
        Pob.PCT_IVA.Control := iedPctIva;

  {RAPA4293 10Mar2014 CvePoblacionCorpo en los nuevos sistemas PCORPO.Poblacion.Cve_Poblacion_Corpo}
  pob.cvePoblacionCorpo.Control:= edCvePoblacionCorpo;

  //Luis Hernandez
  Pob.B_Paraiso_Fiscal.Control    := chkParaisoFiscal;
  Pob.B_Pais_Tributacion.Control  := chkPaisTratado;
end;

procedure TWPoblacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWPoblacion.FormDestroy(Sender: TObject);
begin
	Pob.Cve_Poblacion.Control:= nil;
	Pob.Desc_Poblacion.Control:= nil;
	Pob.Desc_Cve_Tipo_Poblac.Control:= nil;
	Pob.Desc_Cve_Poblac_Ubic.Control:= nil;
	Pob.Cve_Retiene_Imp.Control:= nil;
	Pob.Cve_Pza_Speua.Control:= nil;
  Pob.CVE_LOC_SITI.Control := nil;
  Pob.Ptos_Riesgo_ZG.Control:= nil;
  Pob.Ptos_Riesgo_Nac.Control:= nil;
  Pob.PCT_IVA.Control:=nil;

  {RAPA4293 10Mar2014 CvePoblacionCorpo en los nuevos sistemas PCORPO.Poblacion.Cve_Poblacion_Corpo}
  pob.cvePoblacionCorpo.Control:= nil;

  //Luis Hernandez
  Pob.B_Paraiso_Fiscal.Control    := nil;
  Pob.B_Pais_Tributacion.Control  := nil;

end;

procedure TWPoblacion.sbTipoPoblacionClick(Sender: TObject);
var T:TInterFindit;
begin
   If Pob.ValidaAccesoEsp('POB_TPOB',True,True) Then
   Begin
      T := Pob.CreaBuscador('IntTPob.it','S,S');
		try Case Pob.FilterBy of
			 fbTPoblacionPais: T.WhereString := '(CVE_TIPO_POBLAC = ''PA'')';
			 end;
			 if T.Execute then
				 begin Pob.Cve_Tipo_Poblac.AsString := T.DameCampo(0);
						 Pob.Desc_Cve_Tipo_Poblac.AsString := T.DameCampo(1);

						 if T.DameCampo(0) = 'PA' then
						 begin
                 Pob.Cve_Poblac_Ubic.AsString := '';
								 Pob.Desc_Cve_Poblac_Ubic.AsString := '';

                iedPtosRiesgoNac.Color:= clWindow;
                iedPtosRiesgoNac.ReadOnly:= False;
                chkPaisTratado.Enabled := True;
                chkParaisoFiscal.Enabled := True;
             end
             else
             Begin
                iedPtosRiesgoNac.Color:= clBtnFace;
                iedPtosRiesgoNac.ReadOnly:= True;
                iedPtosRiesgoNac.Text:= '';
                chkPaisTratado.Enabled := False;
                chkParaisoFiscal.Enabled := False;
						 end; {end-if}


						 if (T.DameCampo(0) = 'PA') or (T.DameCampo(0) = 'ES') then
						 begin
                iedPtosRiesgoZG.Color:= clWindow;
                iedPtosRiesgoZG.ReadOnly:= False;
             end
             else
             Begin
                iedPtosRiesgoZG.Color:= clBtnFace;
                iedPtosRiesgoZG.ReadOnly:= True;
                iedPtosRiesgoZG.Text:= '';
						 end; {end-if}
				 end;{end-if}
		 finally T.Free;
		 end;
   End;
end;

procedure TWPoblacion.sbUbicacionClick(Sender: TObject);
var T:TInterFindit;
begin
   If Pob.ValidaAccesoEsp('POB_UBICA',True,True) Then
   Begin
      T := Pob.CreaBuscador('Ubica.it','S,S');
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
   End;
end;

procedure TWPoblacion.BitBtn1Click(Sender: TObject);
begin
  If Pob.ValidaAccesoEsp('POB_REPORTE',True,True) Then
  Begin
    Pob.Reporte;
  End;
end;

procedure TWPoblacion.InterForma1DespuesNuevo(Sender: TObject);
begin EdCvePoblacion.SetFocus;
end;

procedure TWPoblacion.InterForma1DespuesModificar(Sender: TObject);
begin EdPoblacion.SetFocus;
  If Pob.Cve_Tipo_Poblac.AsString = 'PA' Then Begin
    chkPaisTratado.Enabled    := True;
    chkParaisoFiscal.Enabled  := True;
  end
  else Begin
    chkPaisTratado.Enabled    := False;
    chkParaisoFiscal.Enabled  := False;
  end;
end;


procedure TWPoblacion.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
  iedPtosRiesgoZG.Tag:= 18;
  iedPtosRiesgoNac.Tag:= 18;
  Realizado:= True;
end;



end.



