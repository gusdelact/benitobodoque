// Sistema         : Clase de Unidad de Negocio
// Fecha de Inicio : Diciembre de 1997
// Función forma   : Clase de Unidad de Negocio
// Desarrollo por  : Alberto Ramirez
// modificada por  : Manuel Romero Ibarra
//                   Erika Franco 21/JUNIO/2005 SE ADICIONA LA CONDICION PARA QUE SOLO SE PRESENTE EN EL BUSCADOR
//                   LOS GRUPOS DE RIESGO DEFINIDOS POR CREDITOS Y EL AREA DE RIESGOS
// Comentarios     : Se agrega campo para configuración del SPEI ROHS4279 13/septiembre/2010


unit IntInter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, Menus, RepInter, IntEmpre, IntTEnt, IntMPers,
  IntTInterm, IntLinkit, IntLimRieGru, IntLimGpRies;

Const
     fbTIntermedCasaBolsa = 1;
     fbTIntermedBanco	  = 2;
     fbTArrendadora       = 3;
     fbTAseguradora       = 4;
     fbTAutoridadFinan    = 5;
     fbTAutoridadGobi     = 6;

type
  TIntermed = Class;
  TWIntermed = class(TForm)
    InterForma1           : TInterForma;
    PopupMenu1            : TPopupMenu;
    CatalogoPersona       : TMenuItem;
    rgSitIntermed         : TRadioGroup;
    GroupBox1             : TGroupBox;
    lbColonia             : TLabel;
    edIdIntermediario     : TEdit;
    sbIdIntermediario     : TSpeedButton;
    edNombreIntermediario : TEdit;
    Label3                : TLabel;
    ETipoInterm           : TEdit;
    SBTipoInterm          : TSpeedButton;
    EDescTipoInterm       : TEdit;
    ILTInterm             : TInterLinkit;
    ILPersona             : TInterLinkit;
    GroupBox2             : TGroupBox;
    lbIdDomicilio         : TLabel;
    Label2                : TLabel;
    lbBanxico             : TLabel;
    edNomCortoInterm      : TEdit;
    edNomCortoAMB         : TEdit;
    edCveBanxico          : TEdit;
    Label4                : TLabel;
    edNOM_INET            : TEdit;
    Label5                : TLabel;
    edCVE_PIZARRA         : TEdit;
    Label6                : TLabel;
    edCVE_GPO_RIESGO      : TEdit;
    chbBColocaPapel       : TCheckBox;
    SpeedButton1          : TSpeedButton;
    edDESC_GPO_RIESGO     : TEdit;
    InterLinkit1          : TInterLinkit;
    chbBOperaSpei         : TCheckBox;    //rohs4279 13/septiembre/2010
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);

    procedure sbIdIntermediarioClick(Sender: TObject);
    procedure CatalogoPersonaClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure ILPersonaEjecuta(Sender: TObject);
    procedure ILTIntermEjecuta(Sender: TObject);
    procedure SBTipoIntermClick(Sender: TObject);
    procedure InterLinkit1Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto:  TIntermed;
  end;

  TIntermed = class(TInterFrame)
  private
  protected
//  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
   { Public declarations }
   Id_Intermediario : TInterCampo;
   Cve_Tipo_Interm  : TInterCampo;
   B_Coloca_Papel   : TInterCampo;
   Nom_Corto_Interm : TInterCampo;
   Nom_Corto_AMB    : TInterCampo;
   Sit_Intermed     : TInterCampo;
   Nom_INET         : TInterCampo;
   Cve_Pizarra      : TInterCampo;
   Cve_Banxico      : TInterCampo;
   CVE_GPO_RIESGO   : TInterCampo;
   B_Opera_Spei     : TInterCampo;   //rohs4279 13/septiembre/2010

   Persona          : TMPersona;
   TipoInter        : TTInterm;
   //GpoRiesgo : TLimRieGru;
   Lim_Gpo_Riesgo   : TLimGpRies;

    function InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    function ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function  MenuOpciones(Posicion : Integer; var Titulo : String; var Enabled,Visible : Boolean) : Boolean; override;
    procedure MenuEjecuta(Tag : Integer); override;
    Function Reporte: Boolean; Override;
//    Procedure DataBaseChange; Override;
    Procedure SetFilterBy(Filter:Integer); Override;
  published
  end;

implementation
{$R *.DFM}

constructor TIntermed.Create( AOwner : TComponent );
begin
  inherited;
    Id_Intermediario       := CreaCampo('ID_INTERMEDIARIO', ftInteger, tsNinguno, tsNinguno, True);
    B_Coloca_Papel         := CreaCampo('B_COLOCA_PAPEL',   ftString,  tsNinguno, tsNinguno, True);
    Nom_Corto_Interm       := CreaCampo('NOM_CORTO_INTERM', ftString,  tsNinguno, tsNinguno, True);
    Nom_Corto_AMB          := CreaCampo('NOM_CORTO_AMB',    ftString,  tsNinguno, tsNinguno, True);
    B_Coloca_Papel.Size    := 1;
    Cve_Tipo_Interm        := CreaCampo('CVE_TIPO_INTERM',  ftString,  tsNinguno, tsNinguno, True);
    Cve_Tipo_Interm.Size   := 2;
    Sit_Intermed           := CreaCampo('SIT_INTERMED',     ftString,  tsNinguno, tsNinguno, True);
    Nom_INET               := CreaCampo('Nom_INET',         ftString,  tsNinguno, tsNinguno, True);
    Nom_INET.Size          := 80;
    Nom_INET.Caption       := 'Nombre INET';
    Cve_Pizarra            := CreaCampo('CVE_PIZARRA',     ftString,   tsNinguno, tsNinguno, True);
    Cve_Pizarra.Size       := 8;
    Cve_Pizarra.Caption    := 'Clave Pizarra';
    Cve_Banxico            := CreaCampo('CVE_BANXICO',     ftString,   tsNinguno, tsNinguno, True);

    CVE_GPO_RIESGO         := CreaCampo('CVE_GPO_RIESGO',  ftString,   tsNinguno, tsNinguno, True);
    CVE_GPO_RIESGO.Size    := 6;
    CVE_GPO_RIESGO.Caption := 'Clave Grupo Riesgo';

    With Sit_Intermed do begin
      Size     := 2;
      UseCombo := True;
      ComboLista.Add('0');
      ComboDatos.Add('AC');
      ComboLista.Add('1');
      ComboDatos.Add('IN');
    end;

    B_opera_spei           := CreaCampo('B_OPERA_SPEI',    ftString,   tsNinguno, tsNinguno, True);  //rohs4279 13/septimbre/2010

    UseQuery        := True;
    FActive         := False;
    TableName       := 'INTERMEDIARIO';
    FKeyFields.Add('ID_INTERMEDIARIO');
    HelpFile        := 'IntInter.hlp';
    ShowMenuReporte := True;
    IsCorp          := True;

    Persona                        := TMPersona.Create(Self);
    Persona.MasterSource           := Self;
    Persona.ID_Persona.MasterField := 'ID_INTERMEDIARIO';
    Persona.FilterBy               := fbTMPersonaMoral;

    TipoInter                             := TTInterm.Create(Self);
    TipoInter.MasterSource                := Self;
    TipoInter.CVE_TIPO_INTERM.MasterField := 'CVE_TIPO_INTERM';

    {GpoRiesgo := TLimRieGru.Create(Self);
    GpoRiesgo.MasterSource := Self;
    GpoRiesgo.CVE_GPO_RIESGO.MasterField := 'CVE_GPO_RIESGO';}
    //GpoRiesgo.CVE_GPO_RIESGO.MasterField := 'ID_EMPRESA';

    Lim_Gpo_Riesgo                            := TLimGpRies.Create(Self);
    Lim_Gpo_Riesgo.MasterSource               := Self;
    Lim_Gpo_Riesgo.CVE_GPO_RIESGO.MasterField := 'CVE_GPO_RIESGO';
end;

destructor TIntermed.Destroy;
begin
  if Persona <> nil then
    Persona.Free;
  //end if
  if TipoInter <> nil then
    TipoInter.Free;
  //end if
  inherited;
end;

(*
Procedure TIntermed.DataBaseChange;
begin
	Persona.GetParams(self);
end;
*)

Procedure TIntermed.SetFilterBy(Filter:Integer);
//PROCEDIMIENTO GENERADO POR ALBERTO RAMIREZ
begin
  Inherited;
    Active:=False;

    With Cve_Tipo_Interm do begin
      Case Filter of
        fbTIntermedCasaBolsa : buscaWhereString := 'Cve_Tipo_Interm = ''CB''';
        fbTIntermedBanco     : BuscaWhereString := 'Cve_Tipo_Interm = ''BA''';
        fbTArrendadora       : BuscaWhereString := 'Cve_Tipo_Interm = ''AR''';
        fbTAseguradora       : BuscaWhereString := 'Cve_Tipo_Interm = ''AS''';
        fbTAutoridadFinan    : BuscaWhereString := 'Cve_Tipo_Interm = ''AF''';
        fbTAutoridadGobi     : BuscaWhereString := 'Cve_Tipo_Interm = ''AG''';
        else
          BuscaWhereString := '';
      end;
    end;
end;

function  TIntermed.MenuOpciones(Posicion:Integer; Var Titulo:String; Var Enabled,Visible:Boolean):Boolean;
begin
  //Ejemplo para Crear una Opción Adicional al Menu Pop y Ocultar Otra.
  Result := Inherited MenuOpciones(Posicion,Titulo,Enabled,Visible);
  (* Quitar estos comentarios para ver el cambio en el menu!!  abajo Tambien!!
  Case Posicion of
  6:begin Titulo:='Mi Nueva Opcion'; Result:=True; end;
  end;
  *)
end;

procedure TIntermed.MenuEjecuta(Tag:Integer);
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

function TIntermed.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWIntermed;
begin
  W := TWIntermed.Create(Self);
  try
    W.Objeto                    := Self;
    W.InterForma1.InterFrame    := Self;
    W.InterForma1.FormaTipo     := FormaTipo;
    W.InterForma1.ShowGrid      := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion       := FInterFun;
    Case FilterBy of
      fbTIntermedCasaBolsa : w.Caption := 'Intermediarios Casa de Bolsa';
      fbTIntermedBanco     : W.Caption := 'Intermediarios Banco';
    else
      W.Caption := 'Intermediarios';
    end;
      W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
  W.Free;
  end;
end;

function TIntermed.InternalBusca:Boolean;
var T:TInterFindit;
    s: string;

begin
  InternalBusca := False;
  T             := CreaBuscador('IntInter.it','I,S');
  try
    T.WhereString := BuscaWhereString;
    T.Param(0, Id_Intermediario.asString);
    if T.Execute then Begin
      InternalBusca := FindKey([T.DameCampo(0)]);
  //         InternalBusca := True;
    end;
  finally
    T.Free;
  end;
end;

Function TIntermed.Reporte: Boolean;
Begin
  Execute_RepInterm(True,Self);
End;

(***********************************************FORMA DE INTERMEDIARIOS**********)
(*                                                                              *)
(*  FORMA DE INTERMEDIARIOS                                                     *)
(*                                                                              *)
(***********************************************FORMA DE INTERMEDIARIOS**********)
procedure TWIntermed.FormShow(Sender: TObject);
begin
  Objeto.Id_Intermediario.Control               := edIdIntermediario;
  Objeto.B_Coloca_Papel.Control                 := chbBColocaPapel;
  Objeto.Nom_Corto_Interm.Control               := edNomCortoInterm;
  Objeto.Nom_Corto_AMB.Control                  := edNomCortoAMB;
  Objeto.Sit_Intermed.Control                   := rgSitIntermed;
  Objeto.Persona.Nombre.Control                 := edNombreIntermediario;
  Objeto.Cve_Tipo_Interm.Control                := ETipoInterm;
  Objeto.Cve_Banxico.Control                    := edCveBanxico;
  Objeto.Cve_Pizarra.Control                    := edCVE_PIZARRA;
  Objeto.Nom_INET.Control                       := edNOM_INET;
  Objeto.CVE_GPO_RIESGO.Control                 := edCVE_GPO_RIESGO;
  Objeto.TipoInter.DESC_TIPO_INTERM.Control     := EDescTipoInterm;
{  Objeto.GpoRiesgo.CVE_GPO_RIESGO.Control   := edCVE_GPO_RIESGO;
  Objeto.GpoRiesgo.DESC_GPO_RIESGO.Control  := edDESC_GPO_RIESGO;}

  Objeto.Lim_Gpo_Riesgo.CVE_GPO_RIESGO.Control  := edCVE_GPO_RIESGO;
  Objeto.Lim_Gpo_Riesgo.DESC_GPO_RIESGO.Control := edDESC_GPO_RIESGO;
  Objeto.B_Opera_Spei.Control                   := chbBOperaSpei;     //rohs4279 13/septiembre/2010
end;

procedure TWIntermed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWIntermed.FormDestroy(Sender: TObject);
begin
  Objeto.Id_Intermediario.Control           := Nil;
  Objeto.B_Coloca_Papel.Control             := Nil;
  Objeto.Nom_Corto_Interm.Control           := Nil;
  Objeto.Nom_Corto_AMB.Control              := Nil;
  Objeto.Sit_Intermed.Control               := Nil;
  Objeto.Persona.Nombre.Control             := Nil;
  Objeto.Cve_Tipo_Interm.Control            := Nil;
  Objeto.TipoInter.DESC_TIPO_INTERM.Control := Nil;
  Objeto.Cve_Banxico.Control                := Nil;
  Objeto.Cve_Pizarra.Control                := Nil;
  Objeto.Nom_INET.Control                   := Nil;
  Objeto.CVE_GPO_RIESGO.Control             := NIL;
  {Objeto.GpoRiesgo.CVE_GPO_RIESGO.Control:= Nil;
  Objeto.GpoRiesgo.DESC_GPO_RIESGO.Control:= Nil;}
  Objeto.B_Opera_spei.Control               := Nil;   //rohs4279 13/septiembre/2010
end;


procedure TWIntermed.sbIdIntermediarioClick(Sender: TObject);
begin
  Objeto.Persona.Busca;
end;

procedure TWIntermed.InterForma1DespuesNuevo(Sender: TObject);
begin
  chbBColocaPapel.Checked := False;
  rgSitIntermed.ItemIndex := 0;
  chbBOperaSpei.Checked   := False;   //rohs4279 13/septiembre/2010
  edNomCortoInterm.SetFocus;
end;

procedure TWIntermed.CatalogoPersonaClick(Sender: TObject);
begin
  objeto.Persona.Catalogo;
end;

procedure TWIntermed.InterForma1DespuesModificar(Sender: TObject);
begin
  edNomCortoInterm.SetFocus;
end;

procedure TWIntermed.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  if ((Objeto.Cve_Tipo_Interm.AsString <> 'BA') and (Objeto.B_Coloca_Papel.AsString = 'V')) then begin
    Showmessage('El Intermediario no corresponde a un Banco por lo que no "EMITE" papel, verifique sus datos. Gracias!');
    Realizado := False;
    exit;
  end;
  if (Objeto.CVE_GPO_RIESGO.IsNull) then begin
    Showmessage('Debe seleccionar un grupo de riesgo');
    Realizado := False;
    exit;
  end;
end;

procedure TWIntermed.ILPersonaEjecuta(Sender: TObject);
begin
  if Objeto.Persona.FindKey([ILPersona.Buffer]) then
    ETipoInterm.SetFocus;
end;

procedure TWIntermed.ILTIntermEjecuta(Sender: TObject);
begin
  if Objeto.TipoInter.FindKey([ILTInterm.Buffer]) then
    edNomCortoInterm.SetFocus;
end;

procedure TWIntermed.SBTipoIntermClick(Sender: TObject);
begin
  Objeto.TipoInter.Busca;
end;

procedure TWIntermed.InterLinkit1Capture(Sender: TObject;
  var Show: Boolean);
begin
  Show:=true;
end;

procedure TWIntermed.InterLinkit1Ejecuta(Sender: TObject);
begin //Objeto.GpoRiesgo.FindKey([InterLinkit1.buffer]);
end;

procedure TWIntermed.SpeedButton1Click(Sender: TObject);
begin
// Objeto.GpoRiesgo.Busca;
// 21/jUNIO/2005 EFS. SE ADICIONA LA CONDICION PARA QUE SOLO SE PRESENTE EN EL BUSCADOR
//                    LOS GRUPOS DE RIESGO DEFINIDOS POR CREDITOS Y EL AREA DE RIESGOS
  Objeto.Lim_Gpo_Riesgo.BuscaWhereString:= 'LIM_GPO_RIESGO.B_PERMITE_SELEC = ''V'' ' ;
  Objeto.Lim_Gpo_Riesgo.FilterString:=Objeto.Lim_Gpo_Riesgo.BuscaWhereString;
  Objeto.Lim_Gpo_Riesgo.Busca;
end;

end.



