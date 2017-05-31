// Sistema         : Clase de Cliente de Credito
// Fecha de Inicio : 23 de Marzo de 1998
// Función forma   : Clase de Cliente de Credito
// Desarrollo por  : Benjamin Hernandez Delsordo
// Comentarios     :
unit IntCrCli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, IntPers, IntCrGrp, Menus, InterEdit,
  IntMPers;

type

  TCrCli = Class;
  TWCrCli = class(TForm)
    InterForma1: TInterForma;
    GroupBox1: TGroupBox;
    edNombre: TEdit;
    edCveGrupo: TEdit;
    lbTasaVencida: TLabel;
    lbfactmoras: TLabel;
    lbGrupo: TLabel;
    sbCveGrupo: TSpeedButton;
    sbIdPersona: TSpeedButton;
    lbIdPersona: TLabel;
    GroupBox2: TGroupBox;
    lbTasaComision: TLabel;
    lbDiasPago: TLabel;
    lbDiasAdicionales: TLabel;
    lbSitEmisor: TLabel;
    lbPlazoMinimo: TLabel;
    lbPlazoMaximo: TLabel;
    lbImpminimo: TLabel;
    lbImpMaximo: TLabel;
    cbDiasPago: TComboBox;
    cbSitEmisor: TComboBox;
    cbArt73: TCheckBox;
    pumCliente: TPopupMenu;
    pumGrupo: TPopupMenu;
    Catlogo1: TMenuItem;
    Catlogo2: TMenuItem;
    Borrar1: TMenuItem;
    edNombrePromotor: TEdit;
    sbNombrePromotor: TSpeedButton;
    lbIdPromAdm: TLabel;
    edTasaVencida: TInterEdit;
    edFactmoras: TInterEdit;
    edTasaComision: TInterEdit;
    edImpMinimo: TInterEdit;
    edImpMaximo: TInterEdit;
    edDiasAdicionales: TInterEdit;
    edPlazoMaximo: TInterEdit;
    edPlazoMinimo: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Nuevo(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Aceptar(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Cancelar(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Eliminar(Sender : TObject; var Realizado : Boolean);
    procedure InterForma1Buscar(Sender : TObject);
    procedure InterForma1Modificar(Sender : TObject;
      var Realizado : Boolean);
    procedure InterForma1Ayuda(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sbIdPersonaClick(Sender: TObject);
    procedure sbCveGrupoClick(Sender: TObject);
    procedure Catlogo1Click(Sender: TObject);
    procedure Catlogo2Click(Sender: TObject);
    procedure Borrar1Click(Sender: TObject);
    procedure sbNombrePromotorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TCrCli;
  end;

  TCrCli = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
   ID_PERSONA                 :TInterCampo;
   B_ART_73                   :TInterCampo;
   DIAS_ADICIONALES           :TInterCampo;
   DIAS_PAGO                  :TInterCampo;
   FACT_MORAS                 :TInterCampo;
   IMP_MAXIMO                 :TInterCampo;
   IMP_MINIMO                 :TInterCampo;
   PLAZO_MAXIMO               :TInterCampo;
   PLAZO_MINIMO               :TInterCampo;
   SIT_EMISOR                 :TInterCampo;
   TASA_COMISION              :TInterCampo;
   TASA_VENCIDA               :TInterCampo;
   CVE_GRUPO                  :TInterCampo;
   ID_PROM_ADM                :TInterCampo;
   ID_DEPOSITARIO             :TInterCampo;

   Persona                    :TMPersona;
   Grupo                      :TCrGrp;
   Promotor                   :TMPersona;

    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    procedure   DataBaseChange; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

implementation

{$R *.DFM}

constructor TCrCli.Create( AOwner : TComponent );
begin
   Inherited Create(AOwner);
   ID_PERSONA                 :=CreaCampo('ID_PERSONA',ftInteger,tsNinguno,tsNinguno,True);
   B_ART_73                   :=CreaCampo('B_ART_73',ftString,tsNinguno,tsNinguno,True);
     B_ART_73.Size:=1;
   DIAS_ADICIONALES           :=CreaCampo('DIAS_ADICIONALES',ftInteger,tsNinguno,tsNinguno,True);
   DIAS_PAGO                  :=CreaCampo('DIAS_PAGO',ftInteger,tsNinguno,tsNinguno,True);
   with DIAS_PAGO do
     begin
       UseCombo:=True;
       ComboLista.Add('Lunes');  ComboDatos.Add('2');
       ComboLista.Add('Martes');  ComboDatos.Add('3');
       ComboLista.Add('Miércoles');  ComboDatos.Add('4');
       ComboLista.Add('Jueves');  ComboDatos.Add('5');
       ComboLista.Add('Viernes');  ComboDatos.Add('6');
       ComboLista.Add('Sábado');  ComboDatos.Add('7');
       ComboLista.Add('Domingo');  ComboDatos.Add('1');
       ComboLista.Add('No Aplica'); ComboDatos.Add('0');
     end;
   FACT_MORAS                 :=CreaCampo('FACT_MORAS',ftFloat,tsNinguno,tsNinguno,True);
   IMP_MAXIMO                 :=CreaCampo('IMP_MAXIMO',ftFloat,tsNinguno,tsNinguno,True);
   IMP_MINIMO                 :=CreaCampo('IMP_MINIMO',ftFloat,tsNinguno,tsNinguno,True);
   PLAZO_MAXIMO               :=CreaCampo('PLAZO_MAXIMO',ftInteger,tsNinguno,tsNinguno,True);
   PLAZO_MINIMO               :=CreaCampo('PLAZO_MINIMO',ftInteger,tsNinguno,tsNinguno,True);
   SIT_EMISOR                 :=CreaCampo('SIT_EMISOR',ftString,tsNinguno,tsNinguno,True);
   with SIT_EMISOR do
     begin
       Size:=2;
       UseCombo:=True;
       ComboLista.Add('Activo');  ComboDatos.Add('AC');
       ComboLista.Add('Por Activar');  ComboDatos.Add('PA');
       ComboLista.Add('Inactivo');  ComboDatos.Add('IN');
     end;
   TASA_COMISION              :=CreaCampo('TASA_COMISION',ftFloat,tsNinguno,tsNinguno,True);
   TASA_VENCIDA               :=CreaCampo('TASA_VENCIDA',ftFloat,tsNinguno,tsNinguno,True);
   CVE_GRUPO                  :=CreaCampo('CVE_GRUPO',ftString,tsNinguno,tsNinguno,True);
      CVE_GRUPO.Size:=6;
   ID_PROM_ADM                :=CreaCampo('ID_PROM_ADM',ftInteger,tsNinguno,tsNinguno,True);
   ID_DEPOSITARIO             :=CreaCampo('ID_DEPOSITARIO',ftInteger,tsNinguno,tsNinguno,True);


   FKeyFields.Add('ID_PERSONA');
   TableName := 'CRE_CLIENTE';
   UseQuery := True;
   HelpFile := 'InTCrCli.hlp';
   ShowMenuReporte := True;

   Persona:=TMPersona.Create(Self);
   Persona.FilterBy := fbNinguno;
   Persona.MasterSource:=Self;
   Persona.FieldByName('ID_PERSONA').MasterField:='ID_PERSONA';
   Persona.BuscaWhereString := 'PERSONA.SIT_PERSONA = ''AC''';

   Grupo:=TCrGrp.Create(Self);
   Grupo.MasterSource:=Self;
   Grupo.FieldByName('CVE_GRUPO').MasterField:='CVE_GRUPO';

   Promotor := TMPersona.Create(Self);
   Promotor.MasterSource:=Self;
   Promotor.FieldByName('ID_PERSONA').MasterField:='ID_PROM_ADM';
   Promotor.FilterBy:=fbTMPersonaFisica;
   Promotor.BuscaWhereString := 'PERSONA.ID_PERSONA IN (select p.id_persona from promotor@sica p)'
end;

destructor TCrCli.Destroy;
begin
   if Persona <> nil then Persona.Free;
   if Grupo <> nil then Grupo.Free;
   if Promotor <> nil then Promotor.Free;
   inherited;
end;

procedure TCrCli.DataBaseChange;
begin
  Persona.GetParams(Self);
  Grupo.GetParams(Self);
  Promotor.GetParams(Self);
end;

function TCrCli.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCli;
begin
   W:=TWCrCli.Create(Self);
   try
      W.Objeto:= Self;
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

Function TCrCli.InternalBusca:Boolean;
//Var T:TInterFindit;
var
  found : boolean;
  temp : string;
begin
  Result := False;

  temp := Persona.BuscaWhereString;
  Persona.BuscaWhereString := Persona.BuscaWhereString + ' AND PERSONA.ID_PERSONA IN (SELECT ID_PERSONA FROM CRE_CLIENTE)';
  found := Persona.Busca;
  Persona.BuscaWhereString := temp;
  if found then
  begin
    Result := FindKey([Persona.ID_Persona.AsInteger])
  end;
//   T := CreaBuscador('InTCrCli.it','I,S,S');
//   try
//      if Active then T.Param(0,id_persona.AsString);
//      if T.Execute then
//         InternalBusca := FindKey([T.DameCampo(0)]);
//      {end-if}
//      finally
//         T.Free;
//      end;
//   InternalBusca := False;
//   T := CreaBuscador('InTCrCli.it','I,S,S');
//   try
//      if Active then T.Param(0,id_persona.AsString);
//      if T.Execute then
//         InternalBusca := FindKey([T.DameCampo(0)]);
//      {end-if}
//      finally
//         T.Free;
//      end;
end;

function TCrCli.Reporte:Boolean;
begin
end;

(***********************************************FORMA TEMPLATE*******************)
(*                                                                              *)
(*  FORMA TEMPLATE                                                              *)
(*                                                                              *)
(***********************************************FORMA TEMPLATE*******************)

procedure TWCrCli.FormShow(Sender: TObject);
begin
   Objeto.TASA_VENCIDA.Control := edTasaVencida;
   Objeto.B_ART_73.Control := cbArt73;
   Objeto.DIAS_ADICIONALES.Control := edDiasAdicionales;
   objeto.DIAS_PAGO.Control := cbDiasPago;
   Objeto.FACT_MORAS.Control := edFactMoras;
   Objeto.IMP_MAXIMO.Control := edImpMaximo;
   objeto.IMP_MINIMO.Control := edImpMinimo;
   Objeto.PLAZO_MAXIMO.Control := edPlazoMaximo;
   Objeto.PLAZO_MINIMO.Control := edPlazoMinimo;
   Objeto.SIT_EMISOR.Control := cbSitEmisor;
   objeto.TASA_COMISION.Control := edTasaComision;

   Objeto.Persona.Nombre.Control := edNombre;
   Objeto.Persona.MasterSourceEditControl := sbIdPersona;

   Objeto.Grupo.DESC_GRUPO.Control := edCveGrupo;
   Objeto.Grupo.MasterSourceEditControl := sbCveGrupo;

   Objeto.Promotor.Nombre.Control := edNombrePromotor;
   Objeto.Promotor.MasterSourceEditControl := sbNombrePromotor;
end;

procedure TWCrCli.FormDestroy(Sender: TObject);
begin
   Objeto.TASA_VENCIDA.Control := nil;
   Objeto.B_ART_73.Control := nil;
   Objeto.DIAS_ADICIONALES.Control := nil;
   objeto.DIAS_PAGO.Control := nil;
   Objeto.FACT_MORAS.Control := nil;
   Objeto.IMP_MAXIMO.Control := nil;
   objeto.IMP_MINIMO.Control := nil;
   Objeto.PLAZO_MAXIMO.Control := nil;
   Objeto.PLAZO_MINIMO.Control := nil;
   Objeto.SIT_EMISOR.Control := nil;
   objeto.TASA_COMISION.Control := nil;

   Objeto.Persona.Nombre.Control := nil;
   Objeto.Persona.MasterSourceEditControl := nil;

   Objeto.Grupo.DESC_GRUPO.Control := nil;
   Objeto.Grupo.MasterSourceEditControl := nil;

   Objeto.Promotor.Nombre.Control := nil;
   Objeto.Promotor.MasterSourceEditControl := nil;
end;

procedure TWCrCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrCli.InterForma1Nuevo(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Append;
   Realizado := True;
end;

procedure TWCrCli.InterForma1Aceptar(Sender: TObject;  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Post;
   Realizado := True;
end;

procedure TWCrCli.InterForma1Cancelar(Sender: TObject; var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Cancel;
   Realizado := True;
end;

procedure TWCrCli.InterForma1Eliminar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado:=False;
   Objeto.Delete;
   Realizado:=True;
end;

procedure TWCrCli.InterForma1Buscar(Sender: TObject);
begin
   Objeto.Busca;
end;

procedure TWCrCli.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin
   Realizado := False;
   Objeto.Edit;
   Realizado := True;
end;

procedure TWCrCli.InterForma1Ayuda(Sender: TObject);
begin
   Objeto.Help;
end;

procedure TWCrCli.InterForma1DespuesNuevo(Sender: TObject);
begin
  edNombre.SetFocus;
  Objeto.DIAS_ADICIONALES.AsFloat := 0;
  Objeto.DIAS_PAGO.AsFloat := 0;
  Objeto.FACT_MORAS.AsFloat := 0;
  Objeto.IMP_MAXIMO.AsFloat := 0;
  Objeto.IMP_MINIMO.AsFloat := 0;
  Objeto.PLAZO_MAXIMO.AsFloat := 0;
  Objeto.PLAZO_MINIMO.AsFloat := 0;
  Objeto.SIT_EMISOR.AsString := 'IN';
  Objeto.TASA_COMISION.AsFloat := 0;
  Objeto.TASA_VENCIDA.AsFloat := 0;
  Objeto.Grupo.FindKey([0]);
end;

procedure TWCrCli.InterForma1DespuesModificar(Sender: TObject);
begin
   edCveGrupo.SetFocus;
end;

procedure TWCrCli.BitBtn1Click(Sender: TObject);
begin
   Objeto.Reporte;
end;

procedure TWCrCli.sbIdPersonaClick(Sender: TObject);
begin
  Objeto.Persona.Busca;
end;

procedure TWCrCli.sbCveGrupoClick(Sender: TObject);
begin
  Objeto.Grupo.Busca;
end;

procedure TWCrCli.Catlogo1Click(Sender: TObject);
var
  vSit : string;
  vIdPersona : integer;
begin
  if Objeto.Modo = moAppend then
    begin Objeto.Persona.FilterBy := fbNinguno;
    end
  else
    begin
      GetSqlStr('SELECT'+
                '   CVE_PER_JURIDICA'+
                ' FROM'+
                '  PERSONA'+
                ' WHERE'+
                '  ID_PERSONA = ' + Objeto.Persona.ID_Persona.AsString,
                Objeto.DataBaseName,Objeto.SessionName,'CVE_PER_JURIDICA',vSit, False);
      if (vSit = 'PM') then Objeto.Persona.FilterBy := fbTMPersonaMoral
      else Objeto.Persona.FilterBy := fbTMPersonaFisica;
    end;

  if Objeto.Persona.Catalogo then
    begin
      vIdPersona := Objeto.Persona.id_persona.AsInteger;
      if (GetSqlStr('SELECT         '+
                    '   SIT_PERSONA '+
                    ' FROM          '+
                    '   PERSONA     '+
                    ' WHERE         '+
                    '   ID_PERSONA =' + Objeto.Persona.ID_Persona.AsString,
      		     Objeto.DataBaseName,Objeto.SessionName,'SIT_PERSONA',vSit, False))
          and (vSit <> 'AC') then Messagedlg('La persona seleccionada no esta activa',mtInformation,[mbOK],0);
    end
   else
     vIdPersona := Objeto.id_persona.AsInteger;

   Objeto.Persona.FilterBy := fbNinguno;
   Objeto.Persona.Findkey([vIdPersona]);
end;

procedure TWCrCli.Catlogo2Click(Sender: TObject);
begin
  Objeto.Grupo.Catalogo;
end;

procedure TWCrCli.Borrar1Click(Sender: TObject);
begin
  edCveGrupo.Text := '';
end;


procedure TWCrCli.sbNombrePromotorClick(Sender: TObject);
begin
  Objeto.Promotor.Busca;
end;

end.



