//------------------------------------------------------------------------------
// Función    : Catálogo de Concepto Contratante
// Desarrollo : Jose Alberto Ramirez Pacheco
// Modifico   : Cesar Zamora Ramirez
// Fecha      : 13 de Abril de 1998
//------------------------------------------------------------------------------
Unit IntConceCtte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
  TConcCtte = Class;
  TWConceptoCtte = Class(TForm)
    InterForma1 : TInterForma;
    lbCVE_CTTE: TLabel;
    cbCVE_CTTE: TComboBox;
    cB_GIIN: TCheckBox;
    cB_CONDUSEF: TCheckBox;
    lbCVE_CONCEP_CTTE: TLabel;
    edCVE_CONCEP_CTTE: TEdit;
    lbDESC_CONCEPTO: TLabel;
    edDESC_CONCEPTO: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    private 
      { Private declarations }
    public 
      { Public declarations }
      Objeto : TConcCtte;
    end;
  TConcCtte= class(TInterFrame)
    private
      { Private declarations }
    protected
      { Protected declarations }
    public
      { Public declarations }
      CVE_CONCEP_CTTE : TInterCampo;
      DESC_CONCEPTO   : TInterCampo;
      CVE_CTTE        : TInterCampo;
      B_GIIN          : TInterCampo;
      B_CONDUSEF      : TInterCampo;
      function    InternalBusca : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
      { Published declarations }
    end;
implementation
{$R *.DFM}

constructor TConcCtte.Create( AOwner : TComponent );
begin
   Inherited;

   CVE_CONCEP_CTTE := CreaCampo('CVE_CONCEP_CTTE', ftString, tsNinguno, tsNinguno, True);
   DESC_CONCEPTO   := CreaCampo('DESC_CONCEPTO',   ftString, tsNinguno, tsNinguno, True);
   CVE_CTTE        := CreaCampo('CVE_CTTE',        ftString, tsNinguno, tsNinguno, True);
   B_GIIN          := CreaCampo('B_GIIN',          ftString, tsNinguno, tsNinguno, True);
   B_CONDUSEF      := CreaCampo('B_CONDUSEF',      ftString, tsNinguno, tsNinguno, True);
   with CVE_CTTE do
   begin
      size := 2;
      CVE_CTTE.UseCombo := True;
      CVE_CTTE.ComboDatos.add('TI');     CVE_CTTE.ComboLista.Add('TITULAR');
      CVE_CTTE.ComboDatos.add('CO');     CVE_CTTE.ComboLista.Add('COTITULAR');
   end;
   with B_GIIN do
   begin
      size := 1;
      B_GIIN.UseCombo := True;
      B_GIIN.ComboDatos.add('F');        B_GIIN.ComboLista.Add('0');
      B_GIIN.ComboDatos.add('V');        B_GIIN.ComboLista.Add('1');
   end;
   with B_CONDUSEF do
   begin
      size := 1;
      B_CONDUSEF.UseCombo := True;
      B_CONDUSEF.ComboDatos.add('F');    B_CONDUSEF.ComboLista.Add('0');
      B_CONDUSEF.ComboDatos.add('V');    B_CONDUSEF.ComboLista.Add('1');
   end;

   FKeyFields.Add('CVE_CONCEP_CTTE');
   TableName := 'CONCEPTO_CTTE';
   UseQuery  := True;
end;

destructor TConcCtte.Destroy;
begin
   inherited;
end;

function TConcCtte.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWConceptoCtte;
begin
   W := TWConceptoCtte.Create(Self);
   try
      W.Objeto                    := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowBtnAyuda  := False;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TConcCtte.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntCoCte.it', 'S,S');
   try
      if Active    then   T.Param(0, CVE_CONCEP_CTTE.AsString);
      if T.Execute then   InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

procedure TWConceptoCtte.FormShow(Sender: TObject);
begin
   Objeto.CVE_CONCEP_CTTE.Control := edCVE_CONCEP_CTTE;
   Objeto.DESC_CONCEPTO.Control   := edDESC_CONCEPTO;
   Objeto.CVE_CTTE.Control        := cbCVE_CTTE;
   Objeto.B_GIIN.Control          := cB_GIIN;
   Objeto.B_CONDUSEF.Control      := cB_CONDUSEF;
end;

procedure TWConceptoCtte.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_CONCEP_CTTE.Control := nil;
   Objeto.DESC_CONCEPTO.Control   := nil;
   Objeto.CVE_CTTE.Control        := nil;
   Objeto.B_GIIN.Control          := nil;
   Objeto.B_CONDUSEF.Control      := nil;
end;

procedure TWConceptoCtte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
