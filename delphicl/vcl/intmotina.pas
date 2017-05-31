//------------------------------------------------------------------------------
// Función    : Acuse de Recibo (Cancelación de Contrato)
// Desarrollo : Juan Carlos Sanchez Reyes
// Modifico   : Cesar Zamora Ramirez
// Fecha      : 25 de Abril del 2003
//------------------------------------------------------------------------------
Unit IntMotIna;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
  TMotIna = class;

  TWMotIna = Class(TForm)
    InterForma1 : TInterForma;
    lClave: TLabel;
    eClave: TEdit;
    lDescripcion: TLabel;
    eDescripcion: TEdit;
    rgSituacion: TRadioGroup;
    rgTipo: TRadioGroup;
    lSituacion: TLabel;
    lTipo: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
      Objeto : TMotIna;
    end;

  TMotIna = class(TInterFrame)
    private
      { Private declarations }
    protected
      { Protected declarations }
    public
      { Public declarations }
      Cve_Motivo   : TInterCampo;
      Desc_Motivo  : TInterCampo;
      Sit_Motivo   : TInterCampo;
      Tipo_Proceso : TInterCampo;

      function    InternalBusca : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
      { Published declarations }
    end;      
implementation
{$R *.DFM}

constructor TMotIna.Create( AOwner : TComponent );
begin
   Inherited;

   Cve_Motivo   := CreaCampo('CVE_MOTIVO',   ftString, tsNinguno, tsNinguno, True);
   Desc_Motivo  := CreaCampo('DESC_MOTIVO',  ftString, tsNinguno, tsNinguno, True);
   Sit_Motivo   := CreaCampo('SIT_MOTIVO',   ftString, tsNinguno, tsNinguno, True);
   with Sit_Motivo do
   begin
      Size := 2;             UseCombo := True;
      ComboLista.Add('0');   ComboDatos.Add('AC');
      ComboLista.Add('1');   ComboDatos.Add('IN');
   end;
   Tipo_Proceso := CreaCampo('TIPO_PROCESO', ftString, tsNinguno, tsNinguno, True);
   with Tipo_Proceso do
   begin
      Size := 2;             UseCombo := True;
      ComboLista.Add('0');   ComboDatos.Add('AC');
      ComboLista.Add('1');   ComboDatos.Add('IN');
      ComboLista.Add('2');   ComboDatos.Add('BL');
      ComboLista.Add('3');   ComboDatos.Add('DB');
      ComboLista.Add('4');   ComboDatos.Add('BP');
      ComboLista.Add('5');   ComboDatos.Add('DP');
      ComboLista.Add('6');   ComboDatos.Add('CA');
   end;

  FKeyFields.Add('CVE_MOTIVO');
  TableName := 'MOTIVO_INACTIVA';
  UseQuery  := True;
end;

destructor TMotIna.Destroy;
begin
   inherited;
end;

function TMotIna.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWMotIna;
begin
   W := TWMotIna.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowBtnAyuda  := False;
      W.InterForma1.ShowModal;
      ShowWindow                  := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TMotIna.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMotIna', 'S');
   try
      if Active then
         T.Param(0, Cve_Motivo.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

procedure TWMotIna.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Cve_Motivo.Control   := eClave;
      Desc_Motivo.Control  := eDescripcion;
      Sit_Motivo.Control   := rgSituacion;
      Tipo_Proceso.Control := rgTipo;
   end;
end;

procedure TWMotIna.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Cve_Motivo.Control   := nil;
      Desc_Motivo.Control  := nil;
      Sit_Motivo.Control   := nil;
      Tipo_Proceso.Control := nil;
   end;
end;

procedure TWMotIna.InterForma1DespuesNuevo(Sender: TObject);
begin
   rgSituacion.ItemIndex := 0;
   rgTipo.ItemIndex      := 0;
   eClave.SetFocus;
end;

procedure TWMotIna.InterForma1DespuesModificar(Sender: TObject);
begin
   eDescripcion.SetFocus;
end;

procedure TWMotIna.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
