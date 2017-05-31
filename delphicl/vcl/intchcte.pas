// Sistema         : Clase de Unidad de Negocio
// Fecha de Inicio : Diciembre de 1997
// Función forma   : Clase de Unidad de Negocio
// Desarrollo por  : Alberto Ramirez
// Comentarios     :                  

unit IntChCte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, Menus, RepChCte, IntEmpre, IntTEnt, IntMPers,
  IntInter, IntPzaCo, UnGene, UnSubGen, IntPzaBan, InterEdit, IntTraduce,
  IntTipCuenta, IntCtto;

const
  fbTCheqCteFisica = 1;
  fbTCheqCteMoral  = 2;

type
  TCheqCte = Class;

  TWCheqCte = class(TForm)
    InterForma1    : TInterForma;
    BitBtn1: TBitBtn;
    edIdBancoChqra: TEdit;
    edNombreIntermediario: TEdit;
    sbIdIntermediario: TSpeedButton;
    lbColonia: TLabel;
    PopupIntermediario: TPopupMenu;
    CatalogoIntermediario: TMenuItem;
    sbIdPersona: TSpeedButton;
    Label1: TLabel;
    edIdPersona: TEdit;
    edNombrePersona: TEdit;
    PopupPersona: TPopupMenu;
    CatalogoPersona: TMenuItem;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    edNomPlazaBanco: TEdit;
    Label2: TLabel;
    edAba: TEdit;
    Label3: TLabel;
    edFfc: TEdit;
    GroupBox2: TGroupBox;
    edNomSucBanco: TEdit;
    Label6: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    edNomPlazaExt: TEdit;
    Label9: TLabel;
    sbIdPlaza: TSpeedButton;
    Label10: TLabel;
    PopupPlaza: TPopupMenu;
    CatalogoPlaza: TMenuItem;
    Label11: TLabel;
    edIdPlazaBanxico: TEdit;
    sbIdPlazaBanxico: TSpeedButton;
    Label12: TLabel;
    edNombrePlazaBanxico: TEdit;
    PopupPlazaBanxico: TPopupMenu;
    CatalogoPlazaBanxico: TMenuItem;
    rgSitPlaza: TRadioGroup;
    edCveSucBanco: TInterEdit;
    edIdPlaza: TInterEdit;
    edNombrePlaza: TEdit;
    chDepurada: TCheckBox;
    spDigitoVerificador: TStoredProc;
    edCveBanxico: TEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label14: TLabel;
    edRFC_BENEFICIARIO: TEdit;
    edNOM_BENEFI: TEdit;
    Label13: TLabel;
    chbBLineaBancaria: TCheckBox;
    edModifica: TEdit;
    Label15: TLabel;
    edTipCta: TEdit;
    sbTipCta: TSpeedButton;
    edDescTipCta: TEdit;
    qDigVer: TQuery;
    edCuentaBanco: TInterEdit;
    ROpcion: TRadioGroup;
    LSitCtaMov: TLabel;
    Label16: TLabel;
    edCelular: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbIdIntermediarioClick(Sender: TObject);
    procedure CatalogoIntermediarioClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sbIdPersonaClick(Sender: TObject);
    procedure sbIdPlazaClick(Sender: TObject);
    procedure CatalogoPersonaClick(Sender: TObject);
    procedure CatalogoPlazaClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure sbIdPlazaBanxicoClick(Sender: TObject);
    procedure CatalogoPlazaBanxicoClick(Sender: TObject);
    procedure edCuenncoKeyPress(Sender: TObject; var Key: Char);
    procedure edCuenncoExit(Sender: TObject);
    procedure edCveSucBanco1Exit(Sender: TObject);
    procedure InterForma1Aceptar(Sender: TObject; var Realizado: Boolean);
    procedure edIdPlaza1Exit(Sender: TObject);
    procedure edCveSucBancoExit(Sender: TObject);
    procedure edIdPlazaExit(Sender: TObject);
    procedure edCveSucBancoKeyPress(Sender: TObject; var Key: Char);
    procedure edIdPlazaKeyPress(Sender: TObject; var Key: Char);
    procedure edCuentaBanco1Exit(Sender: TObject);
    procedure edCuentaBanco1KeyPress(Sender: TObject; var Key: Char);
    procedure rgTipoCuentaClick(Sender: TObject);
    procedure sbTipCtaClick(Sender: TObject);
    procedure InterForma1BtnBuscarClick(Sender: TObject);

    procedure MuestraObjetos;
    procedure OcultaObjetos;
    procedure LimpiaDatos;
    procedure ROpcionClick(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1BtnModificarClick(Sender: TObject);

    procedure LLenaDatosCel;
    procedure InterForma1BtnCancelar(Sender: TObject);
    procedure edCelularKeyPress(Sender: TObject; var Key: Char);
    procedure InterForma1BtnNuevoClick(Sender: TObject);
    procedure InterForma1BtnAceptar(Sender: TObject);
    procedure InterForma1BtnEliminar(Sender: TObject);
    procedure InterForma1ErrorAceptar(Sender: TObject);
    procedure edCuentaBancoKeyPress(Sender: TObject; var Key: Char);

  private
  public
    Objeto:  TCheqCte;
  end;

  TCheqCte = class(TInterFrame)
  private
    FActualizaCascada: Boolean;
  protected
  public
    vgIdPersona                :Integer;
    Id_Persona                 :TInterCampo;
    Id_Banco_Chqra             :TInterCampo;
    Cve_Suc_Banco              :TInterCampo;
    Cuenta_Banco               :TInterCampo;
    Cve_Banxico                :TInterCampo;
    ABA                        :TInterCampo;
    FFC                        :TInterCampo;
    Id_Plaza                   :TInterCampo;
    Nom_Plaza_Ext              :TInterCampo;
    Nom_Suc_Banco              :TInterCampo;
    B_Linea_Bancaria           :TInterCampo;
    Nom_Plaza_Banco            :TInterCampo;
    Id_Pza_Banxico             :TInterCampo;
    Sit_Chequera               :TInterCampo;
    B_Depurado                 :TInterCampo;
    NOM_BENEFI                 :TInterCampo;
    RFC_BENEFICIARIO           :TInterCampo;

    Id_Banco_Chqra_Nue         :TInterCampo;
    Cuenta_Banco_Nue           :TInterCampo;
    NomIntermediario_Nue       :TInterCampo;
    Tipo_Cuenta                :TInterCampo;

    CVE_OPCION                 :TInterCampo;
    ID_CONTRATO                :TInterCampo;
    NUMERO_CEL                 :TInterCampo;

    Persona			: TMPersona;
    Intermediario        	: TIntermed;
    Plaza			: TPzaComp;
    PlazaBanxico		: TPzaBanx;
    TipCta                      : TTipCuenta;

    Contrato                    : TContrato;

    function InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    function ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function  MenuOpciones(Posicion : Integer; var Titulo : String; var Enabled,Visible : Boolean) : Boolean; override;
    procedure MenuEjecuta(Tag : Integer); override;
    Function ValidaCuentaClabe(pCuenta: String): Boolean;
    Function Reporte: Boolean; Override;
  published
  end;

implementation

Uses IntModChqra;

var vlcve_opcion: byte;
    vlCount: integer;
    vllimpia :boolean;
    vlstatus, vlsql, vlSitCtaMov, vlNumeroCelAnt, vlidcuenta:string;  

{$R *.DFM}
 
constructor TCheqCte.Create( AOwner : TComponent );
begin
  inherited; //Create(AOwner);
  ID_PERSONA       :=CreaCampo('ID_PERSONA',ftInteger,tsNinguno,tsNinguno,True);
  ID_BANCO_CHQRA   :=CreaCampo('ID_BANCO_CHQRA',ftInteger,tsNinguno,tsNinguno,True);
  CVE_SUC_BANCO    :=CreaCampo('CVE_SUC_BANCO',ftString,tsNinguno,tsNinguno,True);
  CUENTA_BANCO     :=CreaCampo('CUENTA_BANCO',ftString,tsNinguno,tsNinguno,True);
  ABA              :=CreaCampo('ABA',ftString,tsNinguno,tsNinguno,True);
  FFC              :=CreaCampo('FFC',ftString,tsNinguno,tsNinguno,True);
  ID_PLAZA         :=CreaCampo('ID_PLAZA',ftString,tsNinguno,tsNinguno,True);
  NOM_PLAZA_EXT    :=CreaCampo('NOM_PLAZA_EXT',ftString,tsNinguno,tsNinguno,True);
  NOM_SUC_BANCO    :=CreaCampo('NOM_SUC_BANCO',ftString,tsNinguno,tsNinguno,True);
  NOM_PLAZA_BANCO  :=CreaCampo('NOM_PLAZA_BANCO',ftString,tsNinguno,tsNinguno,True);
  B_LINEA_BANCARIA :=CreaCampo('B_LINEA_BANCARIA',ftString,tsNinguno,tsNinguno,True);
  ID_PZA_BANXICO   :=CreaCampo('ID_PZA_BANXICO',ftInteger,tsNinguno,tsNinguno,True);
  B_DEPURADO       :=CreaCampo('B_DEPURADO',ftString,tsNinguno,tsNinguno,True);
  SIT_CHEQUERA     :=CreaCampo('SIT_CHEQUERA',ftString,tsNinguno,tsNinguno,True);
  NOM_BENEFI       :=CreaCampo('NOM_BENEFI',ftString,tsNinguno,tsNinguno,True);
  RFC_BENEFICIARIO :=CreaCampo('RFC_BENEFICIARIO',ftString,tsNinguno,tsNinguno,True);

  TIPO_CUENTA     :=CreaCampo('TIPO_CUENTA',ftString,tsNinguno,tsNinguno,True);
  With SIT_CHEQUERA do
  begin
     Size := 2;
     UseCombo := True;
     ComboLista.Add('0');		ComboDatos.Add('AC');
     ComboLista.Add('1');		ComboDatos.Add('IN');
  end;

  {
  With TIPO_CUENTA do
  begin
     Size := 6;
     UseCombo := True;
     ComboLista.Add('0');		ComboDatos.Add('CHEQ');
     ComboLista.Add('1');		ComboDatos.Add('CLABE');
  end;
 }

  Id_Banco_Chqra_nue:= CreaCampo('ID_BANCO_CHQRA_NUE',ftInteger,tsNinguno,tsNinguno,False);
  Cuenta_Banco_nue  := CreaCampo('CUENTA_BANCO_NUE',ftString,tsNinguno,tsNinguno,False);
  NomIntermediario_Nue:= CreaCampo('NOMINTERMEDIARIO_NUE',ftString,tsNinguno,tsNinguno,False);

  CVE_OPCION     :=CreaCampo('CVE_OPCION',ftString,tsNinguno,tsNinguno,False);
  With CVE_OPCION do
  begin
     Size := 2;
     UseCombo := True;
     ComboLista.Add('0');  ComboDatos.Add('ENV');
     ComboLista.Add('1');  ComboDatos.Add('REC');
  end;

  ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,False);
  NUMERO_CEL  :=CreaCampo('NUMERO_CEL',ftString,tsNinguno,tsNinguno,False);

  CUENTA_BANCO.Size:=20;
  CVE_SUC_BANCO.Size:=4;
  ID_PLAZA.Size:=3;
  B_LINEA_BANCARIA.Size:=1;

  Persona:= TMPersona.Create(Self);
  Persona.MasterSource := Self;
  Persona.ID_Persona.MasterField := 'ID_PERSONA';
  Persona.FilterBy := fbNinguno;

  Intermediario:= TIntermed.Create(Self);
  Intermediario.MasterSource := Self;
  Intermediario.Id_Intermediario.MasterField := 'ID_BANCO_CHQRA';
  Intermediario.BuscaWhereString:= 'Sit_Intermed = ''AC''';

  Plaza:= TPzaComp.Create(Self);
  Plaza.MasterSource := Self;
  Plaza.Id_Plaza.MasterField := 'ID_PLAZA';
  Plaza.BuscaWhereString:= 'Sit_Plaza = ''AC''';

  PlazaBanxico:= TPzaBanx.Create(Self);
  PlazaBanxico.MasterSource := Self;
  PlazaBanxico.Num_Plaza.MasterField := 'ID_PZA_BANXICO';
  PlazaBanxico.BuscaWhereString:= 'Sit_Plaza = ''AC''';

  TipCta := TTipCuenta.Create(Self);
  TipCta.MasterSource := Self;
  TipCta.CVE_TIP_CTA.MasterField := 'TIPO_CUENTA';
  TipCta.BuscaWhereString:= 'B_CORP= ''V''';

  Contrato:= TContrato.Create(Self);
  Contrato.MasterSource := Self;
  Contrato.ID_CONTRATO.MasterField := 'ID_CONTRATO';  

  FActualizaCascada:= False;

  UseQuery := True;
  FActive := False;
  TableName := 'CHEQUERA_CTE';
  FKeyFields.Add('ID_PERSONA');
  FKeyFields.Add('ID_BANCO_CHQRA');
//   FKeyFields.Add('CVE_SUC_BANCO');
  FKeyFields.Add('CUENTA_BANCO');
  HelpFile := 'IntChCte.hlp';
  ShowMenuReporte := True;
  IsCorp:=True;
end;

destructor TCheqCte.Destroy;
begin
  if Persona <> nil then Persona.Free;
  if Intermediario <> nil then Intermediario.Free;
  if Plaza <> nil then Plaza.Free;
  if PlazaBanxico <> nil then PlazaBanxico.Free;
  if TipCta <> nil then TipCta.Free;
  inherited;
end;

function  TCheqCte.MenuOpciones(Posicion:Integer; Var Titulo:String; Var Enabled,Visible:Boolean):Boolean;
begin
//Ejemplo para Crear una Opción Adicional al Menu Pop y Ocultar Otra.
   Result := Inherited MenuOpciones(Posicion,Titulo,Enabled,Visible);
      (* Quitar estos comentarios para ver el cambio en el menu!!  abajo Tambien!!
      Case Posicion of
      6:begin Titulo:='Mi Nueva Opcion'; Result:=True; end;
      end;
      *)
end;

procedure TCheqCte.MenuEjecuta(Tag:Integer);
begin
//Ejemplo para Crear una Opción Adicional al Menu Pop y Ocultar Otra.
  Inherited;
		(*  Quitar estos comentarios para ver el cambio en el menu!!
		Case Tag of
		6: begin ShowMEssage('Mi Nueva Opcion');
			end;
		end;
		*)
end;

function TCheqCte.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCheqCte;
begin
   W:=TWCheqCte.Create(Self);
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

function TCheqCte.InternalBusca:Boolean;
var T:TInterFindit;
    s:string;
begin
   InternalBusca := False;

   Case FilterBy of
   	fbTCheqCteFisica: T:=CreaBuscador('IntCCteF.it','I,I,S,S,S');
   	fbTCheqCteMoral : T:=CreaBuscador('IntCCteM.it','I,I,S,S,S');
   	else 					T:=CreaBuscador('IntChCte.it','I,I,S,S');
   end;

   try
   	T.WhereString:=BuscaWhereString;
   	T.Param(0, Id_Persona.asString);
   	if T.Execute then
   	Begin
           Case FilterBy of
	   	fbNinguno: InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1), T.DameCampo(3)]);
	   	else InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1), T.DameCampo(4)]);
	   end;
	   InternalBusca := True;
        end;
   finally
   	T.Free;
   end;
end;


Function TCheqCte.ValidaCuentaClabe(pCuenta: String): Boolean;
Var objStp: TStoredProc;
Begin
  ValidaCuentaClabe:= False;
  objStp:= TStoredProc.Create(Nil);
  Try
    Try
      With objStp do
      Begin
        DataBaseName   := Self.DataBaseName;
        SessionName    := Self.SessionName;
        StoredProcName := 'PKGSERSPEUA.STPVALIDACLABE';

        Params.CreateParam(ftString,  'PE_CUENTA_CLABE', ptInPut);
        Params.CreateParam(ftString,  'PE_BCTAINT', ptInPut);
        Params.CreateParam(ftInteger, 'PS_CONTRATO', ptOutput);
        Params.CreateParam(ftInteger, 'PS_PLAZA', ptOutput);
        Params.CreateParam(ftString,  'PS_DIGVERIF', ptOutput);
        Params.CreateParam(ftString,  'PS_SITCTO', ptOutput);
        Params.CreateParam(ftInteger, 'PSRESULTADO', ptOutput);
        Params.CreateParam(ftString,  'PSTXRESULTADO', ptOutput);

        ParamByName('PE_CUENTA_CLABE').AsString:= pCuenta;
        ParamByName('PE_BCTAINT').AsString:= 'F';   //No es cuenta interna
        Prepare;
        ExecProc;

        If ParamByName('PSRESULTADO').AsInteger = 0 then
          ValidaCuentaClabe:= True
        else MessageDlg('Error al validar la cuenta Clabe.' + chr(VK_RETURN) +
                ParamByName('PSTXRESULTADO').AsString, mtError, [mbOK], 0);
      end;
    Finally
      objStp.Free;
    end;
  Except
    On E: Exception do
      MessageDlg('Error al validar la cuenta Clabe.' + chr(VK_RETURN) +
                E.Message, mtError, [mbOK], 0);
  end;
end;

Function TCheqCte.Reporte: Boolean;
Begin
  Execute_RepCheqCte(True,Self);
End;

(***********************************************FORMA DE INTERMEDIARIOS**********)
(*                                                                              *)
(*  FORMA DE INTERMEDIARIOS                                                     *)
(*                                                                              *)
(***********************************************FORMA DE INTERMEDIARIOS**********)

procedure TWCheqCte.LLenaDatosCel;
begin
   //CUENTA
   edRFC_BENEFICIARIO.Text := vlidcuenta;
   edIdPersona.Text        := vlidcuenta;

   //CELULAR
   edCelular.Text          := vlNumeroCelAnt;

   //SITUACION
   LSitCtaMov.Caption      := vlSitCtaMov;

   Objeto.Contrato.FindKey([StrToInt(edRFC_BENEFICIARIO.Text)]);
   edNombrePersona.Text:= Objeto.Contrato.TITNOMBRE.asString;
   edNOM_BENEFI.Text:= Objeto.Contrato.TITNOMBRE.asString;

   Objeto.TipCta.FindKey(['MOVIL']);
   edTipCta.Text:= Objeto.TipCta.CVE_TIP_CTA.AsString;

   Objeto.ID_CONTRATO.AsInteger := StrToInt(Trim(edRFC_BENEFICIARIO.Text));
   Objeto.NUMERO_CEL.AsString   := Trim(edCelular.Text);
end;

procedure TWCheqCte.MuestraObjetos;
begin
   Label1.Caption:='Persona';

   Label16.Visible:=false;
   LSitCtaMov.Visible:=false;

   Label14.Caption:='RFC';
   Label4.Caption:='Cuenta';
   edNOM_BENEFI.Enabled:=True;
   edRFC_BENEFICIARIO.Enabled:=True;
   edNOM_BENEFI.Tag:=18;
   edRFC_BENEFICIARIO.Tag:=18;
   edNOM_BENEFI.TabStop:=True;
   edRFC_BENEFICIARIO.TabStop:=True;

   lbColonia.Visible:=true;
   edIdBancoChqra.Visible:=true;
   sbIdIntermediario.Visible:=true;
   edNombreIntermediario.Visible:=true;

   chbBLineaBancaria.Visible:=true;

   GroupBox2.Visible:=true;
   Label6.Visible:=true;
   Label8.Visible:=true;
   Label9.Visible:=true;
   Label10.Visible:=true;

   edCveSucBanco.Visible:=true;
   edNomSucBanco.Visible:=true;
   edIdPlaza.Visible:=true;
//   sbIdPlaza.Visible:=true;
   edNombrePlaza.Visible:=true;

   GroupBox1.Visible:=true;
   Label11.Visible:=true;
   Label12.Visible:=true;
   Label7.Visible:=true;

   edIdPlazaBanxico.Visible:=true;
//   sbIdPlazaBanxico.Visible:=true;
   edNombrePlazaBanxico.Visible:=true;
   edNomPlazaBanco.Visible:=true;

   chDepurada.Visible:=true;

   edNOM_BENEFI.Tag:=18;
   edRFC_BENEFICIARIO.Tag:=18;
   edCuentaBanco.Tag:=18;

   chbBLineaBancaria.Tag:=18;
   edCveSucBanco.Tag:=18;
   edNomSucBanco.Tag:=18;
   edIdPlaza.Tag:=18;
   edNombrePlaza.Tag:=18;
   rgSitPlaza.Tag:=18;
   chDepurada.Tag:=18;

   chbBLineaBancaria.TabStop:=true;
   edCveSucBanco.TabStop:=true;
   edNomSucBanco.TabStop:=true;
   edIdPlaza.TabStop:=true;
   edNombrePlaza.TabStop:=true;
   rgSitPlaza.TabStop:=true;
   chDepurada.TabStop:=true;

   edNOM_BENEFI.TabStop:=true;
   edRFC_BENEFICIARIO.TabStop:=true;
   edCuentaBanco.TabStop:=true;

   edCuentaBanco.Visible:=true;
   edCelular.Visible:=false;
end;

procedure TWCheqCte.OcultaObjetos;
begin
   Label1.Caption:='Cuenta';

   Label16.Visible:=true;
   LSitCtaMov.Visible:=true;
   LSitCtaMov.Caption:='';

   Label14.Caption:='Cuenta';
   Label4.Caption:='Celular';
   edNOM_BENEFI.Enabled:=False;
   edRFC_BENEFICIARIO.Enabled:=False;
   edNOM_BENEFI.Tag:=0;
   edRFC_BENEFICIARIO.Tag:=0;
   edNOM_BENEFI.TabStop:=False;
   edRFC_BENEFICIARIO.TabStop:=False;

   lbColonia.Visible:=false;
   edIdBancoChqra.Visible:=false;
   sbIdIntermediario.Visible:=false;
   edNombreIntermediario.Visible:=false;

   chbBLineaBancaria.Visible:=false;

   GroupBox2.Visible:=false;
   Label6.Visible:=false;
   Label8.Visible:=false;
   Label9.Visible:=false;
   Label10.Visible:=false;

   edCveSucBanco.Visible:=false;
   edNomSucBanco.Visible:=false;
   edIdPlaza.Visible:=false;
//   sbIdPlaza.Visible:=false;
   edNombrePlaza.Visible:=false;

   GroupBox1.Visible:=false;
   Label11.Visible:=false;
   Label12.Visible:=false;
   Label7.Visible:=false;

   edIdPlazaBanxico.Visible:=false;
//   sbIdPlazaBanxico.Visible:=false;
   edNombrePlazaBanxico.Visible:=false;
   edNomPlazaBanco.Visible:=false;

   chDepurada.Visible:=false;

   edNOM_BENEFI.Tag:=0;
   edRFC_BENEFICIARIO.Tag:=0;
   edCuentaBanco.Tag:=0;

   chbBLineaBancaria.Tag:=0;
   edCveSucBanco.Tag:=0;
   edNomSucBanco.Tag:=0;
   edIdPlaza.Tag:=0;
   edNombrePlaza.Tag:=0;
   rgSitPlaza.Tag:=0;
   chDepurada.Tag:=0;

   chbBLineaBancaria.TabStop:=false;
   edCveSucBanco.TabStop:=false;
   edNomSucBanco.TabStop:=false;
   edIdPlaza.TabStop:=false;
   edNombrePlaza.TabStop:=false;
   rgSitPlaza.TabStop:=false;
   chDepurada.TabStop:=false;

   edNOM_BENEFI.TabStop:=false;
   edRFC_BENEFICIARIO.TabStop:=false;
   edCuentaBanco.TabStop:=false;

   edCuentaBanco.Visible:=false;
   edCelular.Visible:=true;
end;

procedure TWCheqCte.LimpiaDatos;
begin
   edIdPersona.Text:='';
   edNombrePersona.Text:='';
   edIdBancoChqra.Text:='';
   edNombreIntermediario.Text:='';
   edTipCta.Text:='';
   edDescTipCta.Text:='';

   edNOM_BENEFI.Text:='';
   edRFC_BENEFICIARIO.Text:='';
   edCelular.Text:='';
   edCuentaBanco.Text:='';
   LSitCtaMov.Caption:='';

   edCveSucBanco.Text:='';
   edNomSucBanco.Text:='';
   edIdPlaza.Text:='';
   edNombrePlaza.Text:='';

   edIdPlazaBanxico.Text:='';
   edNombrePlazaBanxico.Text:='';
   edNomPlazaBanco.Text:='';

   chbBLineaBancaria.Checked:=false;
   chDepurada.Checked:=false;
   rgSitPlaza.ItemIndex:=-1;
end;

procedure TWCheqCte.FormShow(Sender: TObject);
begin
	Objeto.ID_PERSONA.Control       := edIdPersona;
	Objeto.ID_BANCO_CHQRA.Control   := edIdBancoChqra;
	Objeto.CVE_SUC_BANCO.Control    := edCveSucBanco;
	Objeto.CUENTA_BANCO.Control     := edCuentaBanco;
	Objeto.ABA.Control              := edAba;
	Objeto.FFC.Control              := edFfc;
	Objeto.ID_PLAZA.Control         := edIdPlaza;
	Objeto.NOM_SUC_BANCO.Control    := edNomSucBanco;
	Objeto.NOM_PLAZA_BANCO.Control  := edNombrePlaza;
	Objeto.NOM_PLAZA_EXT.Control    := edNomPlazaBanco;
	Objeto.B_LINEA_BANCARIA.Control := chbBLineaBancaria;
	Objeto.ID_PZA_BANXICO.Control   := edIdPlazaBanxico;
	Objeto.B_DEPURADO.Control       := chDepurada;
	Objeto.SIT_CHEQUERA.Control     := rgSitPlaza;
//	Objeto.TIPO_CUENTA.Control      := rgTipoCuenta;
        Objeto.NOM_BENEFI.Control       := edNOM_BENEFI;
        Objeto.RFC_BENEFICIARIO.Control := edRFC_BENEFICIARIO;
        Objeto.Tipo_Cuenta.Control      := edTipCta;
        Objeto.TipCta.DESC_TIPO_CUENTA.Control:= edDescTipCta;


	Objeto.Persona.MasterSourceEditControl        := sbIdPersona;
	Objeto.Intermediario.MasterSourceEditControl  := sbIdIntermediario;
//	Objeto.Plaza.MasterSourceEditControl 	      := sbIdPlaza;
//	Objeto.Plaza.NOM_PLAZA.Control 		      := edNombrePlaza;
	Objeto.PlazaBanxico.MasterSourceEditControl   := sbIdPlazaBanxico;
	Objeto.PlazaBanxico.NOM_PLAZA.Control         := edNombrePlazaBanxico;
	Objeto.Persona.Nombre.Control   	      := edNombrePersona;
	Objeto.Intermediario.Persona.Nombre.Control   := edNombreIntermediario;
        Objeto.Intermediario.Cve_Banxico.Control      := edCveBanxico;

        Objeto.CVE_OPCION.Control      :=  ROpcion;

        vllimpia:=true;
        ROpcion.ItemIndex:=0;
        vlcve_opcion:= ROpcion.ItemIndex;
end;

procedure TWCheqCte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TWCheqCte.FormDestroy(Sender: TObject);
begin
	Objeto.ID_PERSONA.Control       := nil;
	Objeto.ID_BANCO_CHQRA.Control   := nil;
	Objeto.CVE_SUC_BANCO.Control    := nil;
	Objeto.CUENTA_BANCO.Control     := nil;
	Objeto.ABA.Control              := nil;
	Objeto.FFC.Control              := nil;
	Objeto.ID_PLAZA.Control         := nil;
	Objeto.NOM_PLAZA_EXT.Control    := nil;
	Objeto.NOM_SUC_BANCO.Control    := nil;
	Objeto.NOM_PLAZA_BANCO.Control  := nil;
	Objeto.B_LINEA_BANCARIA.Control := nil;
	Objeto.ID_PZA_BANXICO.Control   := nil;
	Objeto.B_DEPURADO.Control       := nil;
	Objeto.SIT_CHEQUERA.Control     := nil;
//	Objeto.TIPO_CUENTA.Control      := nil;
        Objeto.NOM_BENEFI.Control       := nil;
        Objeto.RFC_BENEFICIARIO.Control := nil;


	Objeto.Persona.MasterSourceEditControl 	      := nil;
	Objeto.Intermediario.MasterSourceEditControl  := nil;
//	Objeto.Plaza.MasterSourceEditControl 	      := nil;
//	Objeto.Plaza.NOM_PLAZA.Control 		      := nil;
	Objeto.PlazaBanxico.MasterSourceEditControl   := nil;
	Objeto.PlazaBanxico.NOM_PLAZA.Control         := nil;
	Objeto.Persona.Nombre.Control   	      := nil;
	Objeto.Intermediario.Persona.Nombre.Control   := nil;
        Objeto.Intermediario.Cve_Banxico.Control      := nil;
        Objeto.Tipo_Cuenta.Control      := nil;
        Objeto.TipCta.DESC_TIPO_CUENTA.Control:= nil;

        Objeto.CVE_OPCION.Control      := nil;
end;

procedure TWCheqCte.sbIdIntermediarioClick(Sender: TObject);
var
  Q          : Tquery;
  SQL        : string;
  vRes       : string;
begin

   Objeto.Intermediario.Busca;

   sbTipCta.Enabled := True;
   // Interacciones
   If Objeto.ID_BANCO_CHQRA.AsString = '2' then
   begin
     sbTipCta.Enabled := False;
     Objeto.TipCta.FindKey(['CHEQ']);
     chDepurada.Checked := True;
     chDepurada.Enabled := False;
   end;

   edCuentaBanco.Text := '';
   edCuentaBanco.MaxLength := 20;

//   ObjetorgTipoCuenta.ItemIndex = 0 Then
   If edTipCta.Text = 'CHEQ' then
   begin
// BANCOMER
        If Objeto.ID_BANCO_CHQRA.AsString = '6078' Then
           begin
              edCuentaBanco.MaxLength := 8;
              chbBLineaBancaria.Checked := True;
              chbBLineaBancaria.Enabled := False;
        end;
// BANAMEX
        If Objeto.ID_BANCO_CHQRA.AsString = '1715' Then
           begin
              edCuentaBanco.MaxLength := 7;
              chbBLineaBancaria.Checked := True;
              chbBLineaBancaria.Enabled := False;
        end;
// BITAL
        If Objeto.ID_BANCO_CHQRA.AsString = '1718' Then
           begin
              edCuentaBanco.MaxLength := 11;
              chbBLineaBancaria.Checked := True;
              chbBLineaBancaria.Enabled := False;
              chDepurada.Checked := True;
              chDepurada.Enabled := False;
        end;
// BBV
        If Objeto.ID_BANCO_CHQRA.AsString = '21877' Then
           begin
              edCuentaBanco.MaxLength := 11;
              chbBLineaBancaria.Checked := True;
              chbBLineaBancaria.Enabled := False;
              chDepurada.Checked := True;
              chDepurada.Enabled := False;
        end;
// BANORTE
        If Objeto.ID_BANCO_CHQRA.AsString = '1716' Then
           begin
              edCuentaBanco.MaxLength := 11;
              chDepurada.Checked := True;
              chDepurada.Enabled := False;
        end;
// INVERLAT
        If Objeto.ID_BANCO_CHQRA.AsString = '20057' Then
           begin
              edCuentaBanco.MaxLength := 8;
              chDepurada.Checked := True;
              chDepurada.Enabled := False;
        end;
// SERFIN
        If Objeto.ID_BANCO_CHQRA.AsString = '1705' Then
           begin
              edCuentaBanco.MaxLength := 8;
              chbBLineaBancaria.Checked := True;
              chbBLineaBancaria.Enabled := False;
              chDepurada.Checked := True;
              chDepurada.Enabled := False;
        end;
// CITIBANK
        If (Objeto.ID_BANCO_CHQRA.AsString = '1727') or (Objeto.ID_BANCO_CHQRA.AsString = '1728') Then
           begin
              edCuentaBanco.MaxLength := 11;
              chbBLineaBancaria.Checked := True;
              chbBLineaBancaria.Enabled := False;
              chDepurada.Checked := True;
              chDepurada.Enabled := False;
        end;
// BANCRECER
        If Objeto.ID_BANCO_CHQRA.AsString = '6393' Then
           begin
              edCuentaBanco.MaxLength := 11;
              chDepurada.Checked := True;
              chDepurada.Enabled := False;
        end;
// SANTANDER
        If (Objeto.ID_BANCO_CHQRA.AsString = '4834') or (Objeto.ID_BANCO_CHQRA.AsString = '1719') Then
           begin
              edCuentaBanco.MaxLength := 11;
              chDepurada.Checked := True;
              chDepurada.Enabled := False;
        end;
   end;

{   else
   begin
// CLABE
      edCuentaBanco.MaxLength := 18;
      chDepurada.Checked := True;
      chDepurada.Enabled := False;
   end;
}
    SQL:=' SELECT CVE_RESIDENCIA '
        +' FROM PERSONA '
        +' WHERE '
        +'     ID_PERSONA   = ' + Objeto.ID_BANCO_CHQRA.AsString;
    Q := GetSqlQuery(SQL,Objeto.DataBaseName,Objeto.SessionName,True);
    if Q<>nil then
       begin
        try
          vRes := Q.FieldByName('CVE_RESIDENCIA').AsString;
          If vRes <> 'PAMEXI' Then
             begin
               sbIdPlazaBanxico.Visible := False;
               edNomPlazaBanco.Color := clWindow;
               edNomPlazaBanco.ReadOnly := False;
               edNomPlazaBanco.Enabled := True;
               edIdPlazaBanxico.Text := '0';
               edNombrePlazaBanxico.Text := '';
          end;

          If vRes = 'PAMEXI' Then
             begin
               sbIdPlazaBanxico.Visible := True;
               edNomPlazaBanco.Color := clBtnFace;
               edNomPlazaBanco.ReadOnly := True;
               edNomPlazaBanco.Enabled := False;
               edNomPlazaBanco.Text := '';
          end;
        Finally
          Q.Free;
        end;
    end;
    if Q=nil then
       Q.Free;
end;

procedure TWCheqCte.sbIdPersonaClick(Sender: TObject);
begin
   if (ROpcion.ItemIndex = 0) then
   begin
      Objeto.Persona.Busca;
      if Trim(edNombrePersona.Text)<>'' then
         edNOM_BENEFI.Text:= edNombrePersona.Text;
   end
   else
   begin
      if Objeto.Contrato.Busca then
      begin
         edIdPersona.Text:= Objeto.Contrato.ID_Contrato.asString;
         edNombrePersona.Text:= Objeto.Contrato.TITNOMBRE.asString;

         edNOM_BENEFI.Text:= Objeto.Contrato.TITNOMBRE.asString;
         edRFC_BENEFICIARIO .Text:= Objeto.Contrato.ID_Contrato.asString;
      end;
   end;
end;

procedure TWCheqCte.sbIdPlazaClick(Sender: TObject);
var
  Cadena1   : String[3];
begin
  Objeto.Plaza.Busca;
// para Bancomer
        If Objeto.ID_BANCO_CHQRA.AsString = '6078' Then
           begin
              cadena1 := fillrightcero(Trim(edIdPlaza.Text),3);
              edIdPlaza.Text := cadena1;
     	      Objeto.ID_PLAZA.AsString      := edIdPlaza.Text;
        end;
// para INVERLAT
        If Objeto.ID_BANCO_CHQRA.AsString = '20057' Then
           begin
              cadena1 := fillrightcero(Trim(edIdPlaza.Text),3);
              edIdPlaza.Text := cadena1;
     	      Objeto.ID_PLAZA.AsString      := edIdPlaza.Text;
        end;
// para SERFIN
        If Objeto.ID_BANCO_CHQRA.AsString = '1705' Then
           begin
              cadena1 := fillrightcero(Trim(edIdPlaza.Text),3);
              edIdPlaza.Text := cadena1;
     	      Objeto.ID_PLAZA.AsString      := edIdPlaza.Text;
        end;
end;

procedure TWCheqCte.BitBtn1Click(Sender: TObject);
begin
  Objeto.Reporte;
end;

procedure TWCheqCte.InterForma1DespuesNuevo(Sender: TObject);
begin
  ROpcion.ItemIndex := vlcve_opcion;
  ROpcion.Enabled:=false;

  if (Ropcion.ItemIndex=0) then
  begin
     Objeto.Id_Persona.AsInteger := Objeto.vgIdPersona;
     Objeto.Persona.FindKey([Objeto.vgIdPersona]);
     chbBLineaBancaria.Checked := False;
     chDepurada.Checked := False;
     rgSitPlaza.ItemIndex := 0;
     edModifica.Text := 'F';
  end;   
end;

procedure TWCheqCte.InterForma1DespuesModificar(Sender: TObject);
var
  Q   : Tquery;
  SQL : string;
  vRes: string;
begin	//edAba.SetFocus;

   vllimpia:=false;
   ROpcion.ItemIndex := vlcve_opcion;
   ROpcion.Enabled:=false;
   vllimpia:=true;
   
   if (ROpcion.ItemIndex=0) then
   begin
        edModifica.Text := 'V';
// BANCOMER
        If Objeto.ID_BANCO_CHQRA.AsString = '6078' Then
           begin
              chbBLineaBancaria.Checked := True;
              chbBLineaBancaria.Enabled := False;
        end;
// BANAMEX
        If Objeto.ID_BANCO_CHQRA.AsString = '1715' Then
           begin
              chbBLineaBancaria.Checked := True;
              chbBLineaBancaria.Enabled := False;
        end;
// BITAL
        If Objeto.ID_BANCO_CHQRA.AsString = '1718' Then
           begin
              chbBLineaBancaria.Checked := True;
              chbBLineaBancaria.Enabled := False;
              chDepurada.Checked := True;
              chDepurada.Enabled := False;
        end;
// BBV
        If Objeto.ID_BANCO_CHQRA.AsString = '21877' Then
           begin
              chbBLineaBancaria.Checked := True;
              chbBLineaBancaria.Enabled := False;
              chDepurada.Checked := True;
              chDepurada.Enabled := False;
        end;
// BANORTE
        If Objeto.ID_BANCO_CHQRA.AsString = '1716' Then
           begin
              chDepurada.Checked := True;
              chDepurada.Enabled := False;
        end;
// INVERLAT
        If Objeto.ID_BANCO_CHQRA.AsString = '20057' Then
           begin
              chDepurada.Checked := True;
              chDepurada.Enabled := False;
        end;
// SERFIN
        If Objeto.ID_BANCO_CHQRA.AsString = '1705' Then
           begin
              chbBLineaBancaria.Checked := True;
              chbBLineaBancaria.Enabled := False;
              chDepurada.Checked := True;
              chDepurada.Enabled := False;
        end;
// CITIBANK
        If (Objeto.ID_BANCO_CHQRA.AsString = '1727') or (Objeto.ID_BANCO_CHQRA.AsString = '1728') Then
           begin
              chbBLineaBancaria.Checked := True;
              chbBLineaBancaria.Enabled := False;
              chDepurada.Checked := True;
              chDepurada.Enabled := False;
        end;
// BANCRECER
        If Objeto.ID_BANCO_CHQRA.AsString = '6393' Then
           begin
              chDepurada.Checked := True;
              chDepurada.Enabled := False;
        end;
// SANTANDER
        If (Objeto.ID_BANCO_CHQRA.AsString = '4834') or (Objeto.ID_BANCO_CHQRA.AsString = '1719') Then
           begin
              chDepurada.Checked := True;
              chDepurada.Enabled := False;
        end;

              SQL:=' SELECT CVE_RESIDENCIA '
                  +' FROM PERSONA '
                  +' WHERE '
                  +'     ID_PERSONA   = ' + Objeto.ID_BANCO_CHQRA.AsString;
              Q := GetSqlQuery(SQL,Objeto.DataBaseName,Objeto.SessionName,True);
              if Q<>nil then
                 begin
                  try
                    vRes := Q.FieldByName('CVE_RESIDENCIA').AsString;
                    If vRes <> 'PAMEXI' Then
                       begin
                         sbIdPlazaBanxico.Visible := False;
                         edNomPlazaBanco.Color := clWindow;
                         edNomPlazaBanco.ReadOnly := False;
                         edNomPlazaBanco.Enabled := True;
                         edIdPlazaBanxico.Text := '0';
                         edNombrePlazaBanxico.Text := '';
                    end;

                    If vRes = 'PAMEXI' Then
                       begin
                         edNomPlazaBanco.Color := clBtnFace;
                         edNomPlazaBanco.ReadOnly := True;
                         edNomPlazaBanco.Enabled := False;
                         sbIdPlazaBanxico.Visible := True;
                         edNomPlazaBanco.Text := '';
                    end;
                  Finally
                    Q.Free;
                  end;
              end;
              if Q=nil then
                 Q.Free;
   end;
end;

procedure TWCheqCte.CatalogoIntermediarioClick(Sender: TObject);
begin	Objeto.Intermediario.Catalogo;
end;


procedure TWCheqCte.CatalogoPersonaClick(Sender: TObject);
begin	Objeto.Persona.Catalogo;
end;

procedure TWCheqCte.CatalogoPlazaClick(Sender: TObject);
begin	Objeto.Plaza.Catalogo;
end;

procedure TWCheqCte.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
Var
	Banco: Integer;
	Cuenta: String;
	BancoOld: Integer;
	CuentaOld: String;
  Q          : Tquery;
  SQL        : string;
  vRes       : string;
begin
   if (ROpcion.ItemIndex=0) then
   begin
      {***** RAPA (4Mar2004).- Validación de la cuenta CLABE *****}
      //  If rgTipoCuenta.ItemIndex = 1 Then
      if edTipCta.Text = 'CLABE' then
      Begin
         If Not Objeto.ValidaCuentaClabe(edCuentaBanco.Text) Then
         Begin
            Realizado:= False;
            Exit;
         end;

         //Valida que el banco de la cuenta clabe coincida con la clave banxico del intermediario seleccionado
         If Objeto.Intermediario.Active Then
         Begin
            If Objeto.Intermediario.Cve_Banxico.AsString <> Copy(edCuentaBanco.Text, 1, 3) Then
            Begin
               MessageDlg('La cuenta CLABE que usted proporcionó, no coincide con el intermediario seleccionado.', mtWarning, [mbOK], 0);
               Realizado:= False;
               Exit;
            end;
         end;
      end;
      {***** RAPA.- 4Mar2004 *****}

      Objeto.Nom_Plaza_Ext.AsString := edNomPlazaBanco.Text;
      If Objeto.Id_Plaza.AsString = '' Then
         Objeto.Id_Plaza.AsString := '000';

      SQL:=' SELECT CVE_RESIDENCIA '
           +' FROM PERSONA '
           +' WHERE '
           +'     ID_PERSONA   = ' + edIdBancoChqra.Text;
      Q := GetSqlQuery(SQL,Objeto.DataBaseName,Objeto.SessionName,True);
      if Q<>nil then
      begin
         try
            vRes := Q.FieldByName('CVE_RESIDENCIA').AsString;
            If (vRes = 'PAMEXI') and (Objeto.Id_Pza_Banxico.AsString = '') Then
            begin
               ShowMessage('No ha seleccionado la Plaza Banxico, por favor verifique...');
               Realizado := False;
               exit;
            end;
            If (vRes <> 'PAMEXI') and (Objeto.Nom_Plaza_Ext.AsString = '') Then
            begin
               ShowMessage('No ha seleccionado el nombre del Banco en Plaza Liquidación, verifique...');
               Realizado := False;
               exit;
            end;
         Finally
            Q.Free;
         end;
      end;
      if Q=nil then Q.Free;

      If Objeto.Id_Pza_Banxico.AsString = '' Then
         Objeto.Id_Pza_Banxico.AsInteger := 0;
      Objeto.Nom_Plaza_Banco.GetFromControl;
      Objeto.Cve_Suc_Banco.GetFromControl;

      if Objeto.Nom_Plaza_Banco.AsString = '' Then Objeto.Nom_Plaza_Banco.AsString:= ' ';
      Objeto.Cve_Suc_Banco.AsString := fillrightcero(Trim(Objeto.Cve_Suc_Banco.AsString),4);

      Objeto.FActualizaCascada:= False;
      If Not IsNewData Then
      Begin
         Objeto.State:= 0;
	 BancoOld:= Objeto.Id_Banco_Chqra.AsInteger;
	 CuentaOld:= Objeto.Cuenta_Banco.AsString;
	 Objeto.State:= 1;
	 Objeto.Id_Banco_Chqra.GetFromControl;
	 Objeto.Cuenta_Banco.GetFromControl;

	 If (BancoOld  <> Objeto.Id_Banco_Chqra.AsInteger) or
    	    (CuentaOld <> Objeto.Cuenta_Banco.asString) Then
	 Begin
	    Objeto.FActualizaCascada:= True;
	    Objeto.Id_Banco_Chqra_nue.AsInteger:= Objeto.Id_Banco_Chqra.AsInteger;
	    Objeto.Cuenta_Banco_nue.asString:= Objeto.Cuenta_Banco.asString;
	    Objeto.NomIntermediario_Nue.AsString:= Objeto.Intermediario.Persona.Nombre.AsString;
	    Objeto.Intermediario.FindKey([IntToStr(BancoOld)]);
	    //Objeto.Id_Banco_Chqra.AsInteger:= BancoOld;
	    Objeto.Cuenta_Banco.asString:= CuentaOld;
         end;
      end;
   end;
   Realizado := True;
end;

procedure TWCheqCte.InterForma1DespuesAceptar(Sender: TObject);
var
  Qry    : Tquery;
  vCtv   : Integer;
  vLinBan: String;
begin
   vllimpia:=false;
   ROpcion.ItemIndex := vlcve_opcion;
   ROpcion.Enabled:=true;
   vllimpia:=true;
   if (ROpcion.ItemIndex = 0) then
   begin

      // --> CZR 19-MAR-09     Guardar Bitacora al dar de Alta o Modificar una Chequera de Cliente
      if (Objeto.FActualizaCascada) and (Objeto.Active) then
      begin
         if Execute_ModChqra(Objeto) then
            Objeto.FindKey([Objeto.Id_Persona.AsString, Objeto.Id_Banco_Chqra_Nue.asString, Objeto.Cuenta_Banco_Nue.AsString]);
      end;
   {
     try
          Qry := GetSqlQuery('SELECT (NUM_FOLIO+1) AS CONSECUTIVO FROM FOLIO_CORP WHERE ID_EMPRESA = 2 AND CVE_FOLIO = ''BITCHQ''',
                            Objeto.DataBaseName,Objeto.SessionName,True);
        if Qry <> nil then
             vCtv := Qry.FieldByName('CONSECUTIVO').AsInteger;
      finally
         Qry.Free;
      end;

      if chbBLineaBancaria.Checked then
         vLinBan := 'SI'
      else
         vLinBan := 'NO';

      RunSQL(' INSERT INTO CHEQUERA_BIT (' +
             ' ID_PERSONA, ID_BANCO_CHQRA, CUENTA_BANCO, CONSECUTIVO, CVE_USUARIO, FH_REGISTRO, DESC_MODIF, ID_CONTRATO)' +
             ' VALUES (' + trim(edIdPersona.text) + ', '
                         + trim(edIdBancoChqra.Text) + ', '
                         + chr(39) + trim(edCuentaBanco.Text) + chr(39) + ', '
                         + InttoStr(vCtv) + ', '
                         + chr(39) + trim(Objeto.Apli.Usuario) + chr(39) + ', '
                        + 'to_date(to_char(sysdate,''dd/mm/yyyy hh:mi:ss AM''),''dd/mm/yyyy hh:mi:ss AM'')' + ', '
                         + 'substr(' + chr(39) + ' LinBancaria[' + trim(vLinBan) + ']'
                                               + ' ClaSucursal[' + trim(edCveSucBanco.Text) + ']'
                                               + ' NomSucursal[' + trim(edNomSucBanco.Text) + ']'
                                               + ' PlaBanco[' + trim(edIdPlaza.Text) + ']'
                                               + ' PlaBanxico[' + trim(edIdPlazaBanxico.Text) + ']'
                                               + ' Situacion[' + rgSitPlaza.Items[rgSitPlaza.ItemIndex] + ']'
                                     + chr(39) + ', 0, 2000)' + ', '
                         + '0)', Objeto.DataBaseName, Objeto.SessionName, True);
      RunSQL('UPDATE FOLIO_CORP SET NUM_FOLIO = '+ InttoStr(vCtv) + ' WHERE ID_EMPRESA = 2 AND CVE_FOLIO = ''BITCHQ''',
             Objeto.DataBaseName, Objeto.SessionName, True);
   }
      // <-- CZR 19-MAR-09
   end;   
end;

procedure TWCheqCte.sbIdPlazaBanxicoClick(Sender: TObject);
begin
   Objeto.PlazaBanxico.Busca;
end;

procedure TWCheqCte.CatalogoPlazaBanxicoClick(Sender: TObject);
begin
   Objeto.PlazaBanxico.Catalogo;
end;

procedure TWCheqCte.edCuenncoKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = '-' Then
     begin
        ShowMessage('Imposible capturar guiones en el número de cuenta');
        Key := '0';
        exit;
  end;
  If not((Key = '0') or (Key = '1') or (Key = '2') or (Key = '3') or
         (Key = '4') or (Key = '5') or (Key = '6') or (Key = '7') or
         (Key = '8') or (Key = '9')) Then
     begin
        ShowMessage('Sólo es posible capturar números...Rectifique');
        Key := '0';
        exit;
  end;
end;

procedure TWCheqCte.edCuenncoExit(Sender: TObject);
var
  Cadena1      : String[8];
  Cadena2      : String[7];
  Cadena3      : String[11];
  DVClabe      : String;
  CveBanxico   : String;
begin

  If (Objeto.Modo = moEdit) or (Objeto.Modo = moAppend) Then
  Begin

//        If rgTipoCuenta.ItemIndex = 0 then
        if edTipCta.Text = 'CHEQ' then
        begin
  // para Bancomer
          If Objeto.ID_BANCO_CHQRA.AsString = '6078' Then
             begin
                cadena1 := fillrightcero(Trim(edCuentaBanco.Text),8);
                edCuentaBanco.Text := cadena1;
          end;

  // para Banamex
          If Objeto.ID_BANCO_CHQRA.AsString = '1715' Then
             begin
                cadena2 := fillrightcero(Trim(edCuentaBanco.Text),7);
                edCuentaBanco.Text := cadena2;
          end;
  // para Bital
          If Objeto.ID_BANCO_CHQRA.AsString = '1718' Then
             begin
                cadena3 := fillrightcero(Trim(edCuentaBanco.Text),11);
                edCuentaBanco.Text := cadena3;
          end;
  // para BBV
          If Objeto.ID_BANCO_CHQRA.AsString = '21877' Then
             begin
                cadena3 := fillrightcero(Trim(edCuentaBanco.Text),11);
                edCuentaBanco.Text := cadena3;
          end;
  // para BANORTE
          If Objeto.ID_BANCO_CHQRA.AsString = '1716' Then
             begin
                cadena3 := fillrightcero(Trim(edCuentaBanco.Text),11);
                edCuentaBanco.Text := cadena3;
          end;
  // para INVERLAT
          If Objeto.ID_BANCO_CHQRA.AsString = '20057' Then
             begin
                cadena1 := fillrightcero(Trim(edCuentaBanco.Text),8);
                edCuentaBanco.Text := cadena1;
          end;
  // para SERFIN
          If Objeto.ID_BANCO_CHQRA.AsString = '1705' Then
             begin
                cadena1 := fillrightcero(Trim(edCuentaBanco.Text),8);
                edCuentaBanco.Text := cadena1;
          end;
  // para CITIBANK
          If (Objeto.ID_BANCO_CHQRA.AsString = '1727') or (Objeto.ID_BANCO_CHQRA.AsString = '1728') Then
             begin
                cadena3 := fillrightcero(Trim(edCuentaBanco.Text),11);
                edCuentaBanco.Text := cadena3;
          end;
  // para BANCRECER
          If Objeto.ID_BANCO_CHQRA.AsString = '6393' Then
             begin
                cadena3 := fillrightcero(Trim(edCuentaBanco.Text),11);
                edCuentaBanco.Text := cadena3;
          end;
  // para SANTANDER
          If (Objeto.ID_BANCO_CHQRA.AsString = '4834') or (Objeto.ID_BANCO_CHQRA.AsString = '1719') Then
             begin
                cadena3 := fillrightcero(Trim(edCuentaBanco.Text),11);
                edCuentaBanco.Text := cadena3;
          end;
          Objeto.CUENTA_BANCO.AsString  := edCuentaBanco.Text;
        end;

        if edTipCta.Text = 'CLABE' then
        begin
          CveBanxico := copy(edCuentaBanco.Text, 1, 3);

          if CveBanxico <> edCveBanxico.Text then
          begin
                ShowMessage('La CLABE que usted proporcionó, no coincide con el intermediario seleccionado.');
                exit;
          end;

          DVClabe := copy(edCuentaBanco.Text, 1, 17);

          with spDigitoVerificador do begin
            DatabaseName := Objeto.Apli.DataBaseName;
            SessionName  := Objeto.Apli.SessionName;
            ParamByName('PERefAlfNumerica').Value  := DVClabe;
            ExecProc;
            if ParamByName('PSDigVerificadorV').Value <> copy(edCuentaBanco.Text, 18, 1) then
            begin
                ShowMessage('El digito verificador en la CLABE no coincide, verifique por favor');
            end;
          end;
        end;

        if edTipCta.Text = 'TDD' then
        begin
          qDigVer.Active := False;
          qDigVer.DatabaseName := Objeto.Apli.DataBaseName;
          qDigVer.SessionName := Objeto.Apli.SessionName;
          qDigVer.SQL.Clear;
          qDigVer.SQL.Add('SELECT DECODE(SUBSTR(' +
                           edCuentaBanco.Text + ',16,1), PKGCAJA.FUNVALIDADIGTC(' +
                           edCuentaBanco.Text + '),0,1) RESULTADO FROM DUAL');
          qDigVer.Active := True;
          if not qDigVer.Eof then
          begin
            if qDigVer.FieldByName('RESULTADO').AsInteger <> 0 then
            begin
              ShowMessage('El dígito verificador en la TDD no coincide, verifique por favor');
              Exit;
            end;
          end;
        end;

        if edTipCta.Text = 'MOVIL' then
        begin
           if Length(Trim(edCuentaBanco.Text)) <> 10 then
           begin
             ShowMessage('El número celular debe de ser de 10 dígitos');
             exit;
           end;
        end;
  end;
end;

procedure TWCheqCte.edCveSucBanco1Exit(Sender: TObject);
var
  Cadena1   : String[4];
begin
// para Banamex
        If Objeto.ID_BANCO_CHQRA.AsString = '1715' Then
           begin
              cadena1 := fillrightcero(Trim(edCveSucBanco.Text),4);
              edCveSucBanco.Text := cadena1;
     	      Objeto.CVE_SUC_BANCO.AsString      := edCveSucBanco.Text;
        end;
end;

procedure TWCheqCte.InterForma1Aceptar(Sender: TObject;
  var Realizado: Boolean);
var
  Q          : Tquery;
  SQL        : string;
  vRes       : string;
begin
              SQL:=' SELECT CVE_RESIDENCIA '
                  +' FROM PERSONA '
                  +' WHERE '
                  +'     ID_PERSONA   = ' + edIdBancoChqra.Text;
              Q := GetSqlQuery(SQL,Objeto.DataBaseName,Objeto.SessionName,True);
              if Q<>nil then
                 begin
                  try
                    vRes := Q.FieldByName('CVE_RESIDENCIA').AsString;
                    If (vRes = 'PAMEXI') and (Objeto.Id_Pza_Banxico.AsString = '') Then
                       begin
                         ShowMessage('No ha seleccionado la Plaza Banxico, por favor verifique...');
                         exit;
                    end;
                    If (vRes <> 'PAMEXI') and (Objeto.Nom_Plaza_Ext.AsString = '') Then
                       begin
                         ShowMessage('No ha seleccionado el nombre del Banco en Plaza Liquidación, verifique...');
                         exit;                                              
                    end;
                  Finally
                    Q.Free;
                  end;
              end;
              if Q=nil then
                 Q.Free;
end;

procedure TWCheqCte.edIdPlaza1Exit(Sender: TObject);
var
  Cadena1   : String[3];
begin
// para Bancomer
        If Objeto.ID_BANCO_CHQRA.AsString = '6078' Then
           begin
              cadena1 := fillrightcero(Trim(edIdPlaza.Text),3);
              edIdPlaza.Text := cadena1;
     	      Objeto.ID_PLAZA.AsString      := edIdPlaza.Text;
        end;
// para INVERLAT
        If Objeto.ID_BANCO_CHQRA.AsString = '20057' Then
           begin
              cadena1 := fillrightcero(Trim(edIdPlaza.Text),3);
              edIdPlaza.Text := cadena1;
     	      Objeto.ID_PLAZA.AsString      := edIdPlaza.Text;
        end;
// para SERFIN
        If Objeto.ID_BANCO_CHQRA.AsString = '1705' Then
           begin
              cadena1 := fillrightcero(Trim(edIdPlaza.Text),3);
              edIdPlaza.Text := cadena1;
     	      Objeto.ID_PLAZA.AsString      := edIdPlaza.Text;
        end;
end;

procedure TWCheqCte.edCveSucBancoExit(Sender: TObject);
var
  Cadena1   : String[4];
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  Begin

// para Banamex
        If Objeto.ID_BANCO_CHQRA.AsString = '1715' Then
           begin
              cadena1 := fillrightcero(Trim(edCveSucBanco.Text),4);
              edCveSucBanco.Text := cadena1;
     	      Objeto.CVE_SUC_BANCO.AsString      := edCveSucBanco.Text;
        end;
  end;
end;

procedure TWCheqCte.edIdPlazaExit(Sender: TObject);
var
  Cadena1   : String[3];
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin

// para Bancomer
        If Objeto.ID_BANCO_CHQRA.AsString = '6078' Then
           begin
              cadena1 := fillrightcero(Trim(edIdPlaza.Text),3);
              edIdPlaza.Text := cadena1;
     	      Objeto.ID_PLAZA.AsString      := edIdPlaza.Text;
        end;
// para INVERLAT
        If Objeto.ID_BANCO_CHQRA.AsString = '20057' Then
           begin
              cadena1 := fillrightcero(Trim(edIdPlaza.Text),3);
              edIdPlaza.Text := cadena1;
     	      Objeto.ID_PLAZA.AsString      := edIdPlaza.Text;
        end;
// para SERFIN
        If Objeto.ID_BANCO_CHQRA.AsString = '1705' Then
           begin
              cadena1 := fillrightcero(Trim(edIdPlaza.Text),3);
              edIdPlaza.Text := cadena1;
     	      Objeto.ID_PLAZA.AsString      := edIdPlaza.Text;
        end;
  end;
end;

procedure TWCheqCte.edCveSucBancoKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = '-' Then
     begin
        ShowMessage('Imposible capturar guiones en la Clave de Sucursal');
        Key := ' ';
        exit;
  end;
end;

procedure TWCheqCte.edIdPlazaKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = '-' Then
     begin
        ShowMessage('Imposible capturar guiones en la Clave de la Plaza');
        Key := ' ';
        exit;
  end;
end;

procedure TWCheqCte.edCuentaBanco1Exit(Sender: TObject);
var
  Cadena1   : String[8];
  Cadena2   : String[7];
  Cadena3   : String[11];
begin
// para Bancomer
        If Objeto.ID_BANCO_CHQRA.AsString = '6078' Then
           begin
              cadena1 := fillrightcero(Trim(edCuentaBanco.Text),8);
              edCuentaBanco.Text := cadena1;
        end;

// para Banamex
        If Objeto.ID_BANCO_CHQRA.AsString = '1715' Then
           begin
              cadena2 := fillrightcero(Trim(edCuentaBanco.Text),7);
              edCuentaBanco.Text := cadena2;
        end;

// para Bital
        If Objeto.ID_BANCO_CHQRA.AsString = '1718' Then
           begin
              cadena3 := fillrightcero(Trim(edCuentaBanco.Text),11);
              edCuentaBanco.Text := cadena3;
        end;
// para BBV
        If Objeto.ID_BANCO_CHQRA.AsString = '21877' Then
           begin
              cadena3 := fillrightcero(Trim(edCuentaBanco.Text),11);
              edCuentaBanco.Text := cadena3;
        end;
// para BANORTE
        If Objeto.ID_BANCO_CHQRA.AsString = '1716' Then
           begin
              cadena3 := fillrightcero(Trim(edCuentaBanco.Text),11);
              edCuentaBanco.Text := cadena3;
        end;
// para INVERLAT
        If Objeto.ID_BANCO_CHQRA.AsString = '20057' Then
           begin
              cadena1 := fillrightcero(Trim(edCuentaBanco.Text),8);
              edCuentaBanco.Text := cadena1;
        end;
// para SERFIN
        If Objeto.ID_BANCO_CHQRA.AsString = '1705' Then
           begin
              cadena1 := fillrightcero(Trim(edCuentaBanco.Text),8);
              edCuentaBanco.Text := cadena1;
        end;
// para CITIBANK
        If (Objeto.ID_BANCO_CHQRA.AsString = '1727') or (Objeto.ID_BANCO_CHQRA.AsString = '1728') Then
           begin
              cadena3 := fillrightcero(Trim(edCuentaBanco.Text),11);
              edCuentaBanco.Text := cadena3;
        end;
// para BANCRECER
        If Objeto.ID_BANCO_CHQRA.AsString = '6393' Then
           begin
              cadena3 := fillrightcero(Trim(edCuentaBanco.Text),11);
              edCuentaBanco.Text := cadena3;
        end;
// para SANTANDER
        If (Objeto.ID_BANCO_CHQRA.AsString = '4834') or (Objeto.ID_BANCO_CHQRA.AsString = '1719') Then
           begin
              cadena3 := fillrightcero(Trim(edCuentaBanco.Text),11);
              edCuentaBanco.Text := cadena3;
        end;
        Objeto.CUENTA_BANCO.AsString  := edCuentaBanco.Text;
end;

procedure TWCheqCte.edCuentaBanco1KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = '-' Then
     begin
        ShowMessage('Imposible capturar guiones en el número de cuenta');
        Key := ' ';
        exit;
  end;
end;

procedure TWCheqCte.rgTipoCuentaClick(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
        edCuentaBanco.Text := '';

//       if rgTipoCuenta.ItemIndex = 1 Then
        if edTipCta.Text = 'CLABE' then
        begin
                edCveSucBanco.Text := ' ';
                edNomSucBanco.Text := ' ';
                edIdPlaza.Text     := ' ';
                edNombrePlaza.Text := ' ';
        end;
   end;
end;

procedure TWCheqCte.sbTipCtaClick(Sender: TObject);
begin
  if (ROpcion.ItemIndex = 0) then Objeto.TipCta.BuscaWhereString:=''
  else Objeto.TipCta.BuscaWhereString:=' CVE_TIP_CTA=''MOVIL'' ';

  Objeto.TipCta.Busca;

  //SE BUSCA LA CVE DE LA CUENTA EN CADENA
 //edTipCta.Text:=Objeto.TipCta.CVE_TIPO_CUENTA.AsString;
  edTipCta.Text:=Objeto.TipCta.CVE_TIP_CTA.AsString;

  edCuentaBanco.MaxLength := 20;
  if Objeto.TipCta.CVE_TIP_CTA.AsString = 'CLABE' then
  begin
    edCuentaBanco.MaxLength := 17;
    chDepurada.Checked := True;
    chDepurada.Enabled := False;
  end;
  if Objeto.TipCta.CVE_TIP_CTA.AsString = 'TDD' then
  begin
    edCuentaBanco.MaxLength := 15;
  end;
  if Objeto.TipCta.CVE_TIP_CTA.AsString = 'MOVIL' then
  begin
    edCuentaBanco.MaxLength := 9;
  end;
  edCuentaBanco.Text:='';
end;

procedure TWCheqCte.InterForma1BtnBuscarClick(Sender: TObject);
var    T : TInterFindit;
begin
   vllimpia:=false;
   ROpcion.ItemIndex:=vlcve_opcion;
   vllimpia:=true;
   
   IF (Ropcion.ItemIndex = 0) then
   begin
       oBJETO.Busca;
       vllimpia:=false;
       ROpcion.ItemIndex:=vlcve_opcion;
       vllimpia:=true;
   end
   else
   begin
      Try
         T := Objeto.CreaBuscador('ICtaMovil.it','S');
         //T.wherestring := '';
         If T.Execute Then
         Begin
            vlidcuenta              := T.DameCampo(0);
            vlNumeroCelAnt          := T.DameCampo(1);
            vlSitCtaMov             := T.DameCampo(2);
            LLenaDatosCel;
         End;
      Finally
         T.Free;
      End;
   end;
end;

procedure TWCheqCte.ROpcionClick(Sender: TObject);
begin
   if Ropcion.ItemIndex = 0 then MuestraObjetos
   else OcultaObjetos;
   vlcve_opcion:= ROpcion.ItemIndex;
   if vllimpia then LimpiaDatos;
end;

procedure TWCheqCte.InterForma1DespuesCancelar(Sender: TObject);
begin
   vllimpia:=false;
   ROpcion.ItemIndex := vlcve_opcion;
   vllimpia:=true;
   ROpcion.Enabled:=true;

   if (Ropcion.ItemIndex = 1) then LLenaDatosCel;
end;

procedure TWCheqCte.InterForma1BtnModificarClick(Sender: TObject);
Var       VLSalida     : Boolean;
begin
    VLSalida := False;

    if (vlcve_opcion = 0) then //ENV
    begin
       VLSalida:=InterForma1.Modificar;
    end;

    if (vlcve_opcion = 1) then //REC
    begin
       if (vlSitCtaMov = 'AU') OR (vlSitCtaMov = 'AC') OR (vlSitCtaMov = '') then
       Begin
          MessageDlg('No se ha seleccionado solicitud o ya se encuentra Autorizada o Activada, no es posible Modificar la información',mtConfirmation,[mbOk], 0);
       end
       else
       begin
          ROpcion.Enabled:=false;
          vlNumeroCelAnt:=edCelular.Text;
          vlstatus:='MODIFICAR';
          InterForma1.BtnModificar.Enabled:=false;
          InterForma1.BtnNuevo.Enabled:=false;
          InterForma1.BtnEliminar.Enabled:=false;
          //
          InterForma1.BtnAceptar.Enabled:=true;
          InterForma1.BtnCancelar.Enabled:=true;

          edCelular.Enabled:=true;
          edCelular.ReadOnly:=false;
          edCelular.Color:= clWindow;
          edCelular.SetFocus;
       end;
    end;
end;

procedure TWCheqCte.InterForma1BtnCancelar(Sender: TObject);
begin
    if (vlcve_opcion = 0) then //ENV
    begin
       InterForma1.Cancelar;
    end;

    if (vlcve_opcion = 1) then //REC
    begin
       ROpcion.Enabled:=true;
       sbIdPersona.Enabled:=false;
       sbTipCta.Enabled:=false;

       InterForma1.BtnModificar.Enabled:=true;
       InterForma1.BtnNuevo.Enabled:=true;
       InterForma1.BtnEliminar.Enabled:=true;
       //
       InterForma1.BtnAceptar.Enabled:=false;
       InterForma1.BtnCancelar.Enabled:=false;

       if (vlNumeroCelAnt<>'') and (vlstatus='MODIFICAR') then
       begin
         edCelular.Text  := vlNumeroCelAnt;
       end
       else
       begin
          if vllimpia then LimpiaDatos;
       end;
       vlstatus:='CANCELAR';
       edCelular.Enabled:=false;
       edCelular.ReadOnly:=true;
       edCelular.Color:= clBtnFace;
    end;
end;

procedure TWCheqCte.edCelularKeyPress(Sender: TObject; var Key: Char);
begin
   if NOT (key IN ['0'..'9', #13, #8]) then
   begin
      key := #0;
      exit;
   end;
end;

procedure TWCheqCte.InterForma1BtnNuevoClick(Sender: TObject);
var Realizado: Boolean;
begin
    if (vlcve_opcion = 0) then //ENV
    begin
       Realizado:=InterForma1.Nuevo;
    end;

    if (vlcve_opcion = 1) then //REC
    begin
       ROpcion.Enabled:=false;
       vlstatus:='NUEVO';
       InterForma1.BtnModificar.Enabled:=false;
       InterForma1.BtnNuevo.Enabled:=false;
       InterForma1.BtnEliminar.Enabled:=false;
       //
       InterForma1.BtnAceptar.Enabled:=true;
       InterForma1.BtnCancelar.Enabled:=true;

       sbIdPersona.Enabled:=true;
       sbTipCta.Enabled:=true;

       edIdPersona.Text:='';
       edNombrePersona.Text:= '';
       edNOM_BENEFI.Text:= '';
       edRFC_BENEFICIARIO.Text:= '';
       edTipCta.Text:= '';
       edDescTipCta.Text:= '';
       LSitCtaMov.Caption:='IN';

       edCelular.Text   := '';
       edCelular.Enabled:=true;
       edCelular.ReadOnly:=false;
       edCelular.Color:= clWindow;

       edCelular.MaxLength := 10;
    end;
end;

procedure TWCheqCte.InterForma1BtnAceptar(Sender: TObject);
var vlctoreg:string;
begin
    if (vlcve_opcion = 0) then //ENV
    begin
       InterForma1.Aceptar;
    end;

    if (vlcve_opcion = 1) then //REC
    begin
       try
          if Length(Trim(edCelular.Text)) <> 10 then
          begin
             MessageDlg('El número celular debe de ser de 10 dígitos', mtError, [mbOK], 0);
             exit;
          end;

          if Length(Trim(edRFC_BENEFICIARIO.Text)) = 0 then
          begin
             MessageDlg('No se ha seleccionado una cuenta', mtError, [mbOK], 0);
             exit;
          end;

          if Length(Trim(edTipCta.Text)) = 0 then
          begin
             MessageDlg('No se ha seleccionado un tipo de cuenta', mtError, [mbOK], 0);
             exit;
          end;

          if (Trim(edCelular.Text)<>vlNumeroCelAnt) then
          begin
             GetSQLInt('SELECT COUNT(*) COUNT FROM CUENTA_MOVIL WHERE NUMERO_CEL='''+Trim(edCelular.Text)+'''' ,
                       Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,
                       'COUNT',vlCount,True);
             if vlCount <> 0 then
             begin
                GetSQLStr('SELECT ID_CONTRATO FROM CUENTA_MOVIL WHERE NUMERO_CEL='''+Trim(edCelular.Text)+'''' ,
                       Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,
                       'ID_CONTRATO',vlctoreg,True);

                MessageDlg('El número celular ya se encuentra registrado al Contrato: '+vlctoreg, mtError, [mbOK], 0);
                exit;
             end;
          end;

          Objeto.ID_CONTRATO.AsInteger := StrToInt(Trim(edRFC_BENEFICIARIO.Text));
          Objeto.NUMERO_CEL.AsString   := Trim(edCelular.Text);
         // if (Objeto.Modi_SolCheqCteCto_Recep (Objeto.ID_CONTRATO.asInteger, Objeto.NUMERO_CEL.asString, vlNumeroCelAnt, 'IN' )) = 0 then

         if (vlstatus='NUEVO') then
             vlsql:='INSERT INTO CUENTA_MOVIL '+
                    '   (ID_CONTRATO, NUMERO_CEL, TIPO_CUENTA, SITUACION, CVE_USUARIO_REG, FH_REGISTRO) '+
                    ' VALUES '+
                    '('+IntToStr(Objeto.ID_CONTRATO.asInteger)+' , '''+Objeto.NUMERO_CEL.AsString+''' ,  10 , ''IN'' , '''+Objeto.Apli.Usuario+''' , SYSDATE )';

         if (vlstatus='MODIFICAR') then
             vlsql:='UPDATE CUENTA_MOVIL '+
                    '   SET SITUACION        = ''IN'' '+
                    '       ,NUMERO_CEL      = '''+Objeto.NUMERO_CEL.asString+''''+
                    '       ,CVE_USUARIO_MOD = '''+Objeto.Apli.Usuario+''''+
                    '       ,FH_MODIFIACION = SYSDATE '+
                    ' WHERE ID_CONTRATO  = '+IntToStr(Objeto.ID_CONTRATO.asInteger)+
                    '   AND NUMERO_CEL   = '''+vlNumeroCelAnt+'''';

          RunSQL(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
          RunSQL('COMMIT',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);

          sbIdPersona.Enabled:=false;
          sbTipCta.Enabled:=false;

          InterForma1.BtnModificar.Enabled:=true;
          InterForma1.BtnNuevo.Enabled:=true;
          InterForma1.BtnEliminar.Enabled:=true;
          //
          InterForma1.BtnAceptar.Enabled:=false;
          InterForma1.BtnCancelar.Enabled:=false;

          edCelular.Enabled:=false;
          edCelular.ReadOnly:=true;
          edCelular.Color:= clBtnFace;

          ROpcion.Enabled:=true;
          vlSitCtaMov:=LSitCtaMov.Caption;
       Except
          on e: exception do
          begin
             Beep;Beep;
             ShowMessage('Problemas con la Relación Contrato-Celular');
             ShowMessage(e.Message);
          end;
       end;
    end;
end;

procedure TWCheqCte.InterForma1BtnEliminar(Sender: TObject);
begin
    if (vlcve_opcion = 0) then //ENV
    begin
       InterForma1.Eliminar;
    end;

    if (vlcve_opcion = 1) then //REC
    begin
       if (vlSitCtaMov = 'AU') OR (vlSitCtaMov = 'AC') then
       Begin
          MessageDlg('La solicitud ya se encuentra Autorizada o Activada, no es posible Eliminar la información',mtConfirmation,[mbOk], 0);
          exit;
       end;

       try
          if MessageDlg('¿ Esta seguro de Eliminar la relacion de Chequera - Cuenta Movil ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
             Objeto.ID_CONTRATO.AsInteger := StrToInt(Trim(edRFC_BENEFICIARIO.Text));
             Objeto.NUMERO_CEL.AsString   := Trim(edCelular.Text);

             vlsql:='DELETE FROM CUENTA_MOVIL '+
                    ' WHERE ID_CONTRATO = '+IntToStr(Objeto.ID_CONTRATO.asInteger)+
                    '   AND NUMERO_CEL  = '''+Objeto.NUMERO_CEL.AsString+''''+
                    '   AND TIPO_CUENTA =  10 '+
                    '   AND SITUACION = ''IN''';

             RunSQL(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
             RunSQL('COMMIT',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);

             LimpiaDatos;
          end;
       Except
          on e: exception do
          begin
             Beep;Beep;
             ShowMessage('Problemas al Eliminar la Relación Contrato-Celular');
             ShowMessage(e.Message);
          end;
       end;
    end;
end;

procedure TWCheqCte.InterForma1ErrorAceptar(Sender: TObject);
begin
   if (ROpcion.ItemIndex = -1) then
   begin
      vllimpia:=false;
      ROpcion.ItemIndex:=vlcve_opcion;
      vllimpia:=true;
   end;
end;

procedure TWCheqCte.edCuentaBancoKeyPress(Sender: TObject; var Key: Char);
begin
   if NOT (key IN ['0'..'9', #13, #8]) then
   begin
      key := #0;
      exit;
   end;
end;

end.
