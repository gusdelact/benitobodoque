// Sistema         : Clase de Segmentos
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Segmento
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :
unit IntSegm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun;

type

  TSegmento= Class;
  TWSegmento= class(TForm)
    InterForma1    : TInterForma;
    lbICveSemento: TLabel;
    EdCveSegmento: TEdit;
    lbDescSegmento: TLabel;
    EdSegmento: TEdit;
    rgSituacion: TRadioGroup;
    btReporte: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btReporteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Segm : TSegmento;
  end;

  TSegmento  = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
    Cve_Segmento  : TInterCampo;
    Desc_Segmento : TInterCampo;
    Sit_Segmento : TInterCampo;
    Function InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    Function ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function  Reporte:Boolean; override;
  published
  end;

implementation

Uses RepSegm;
{$R *.DFM}

constructor TSegmento.Create( AOwner : TComponent );
begin Inherited;
    Cve_Segmento:= CreaCampo('CVE_SEGMENTO',ftString,tsNinguno,tsNinguno,True);
    Cve_Segmento.Size := 4;
    Desc_Segmento:= CreaCampo('DESC_SEGMENTO',ftString,tsNinguno,tsNinguno,True);

    Sit_Segmento:= CreaCampo('SIT_SEGMENTO',ftString,tsNinguno,tsNinguno,True);
    With Sit_Segmento do
    Begin
    	Size := 2;
      UseCombo := True;
      ComboDatos.Add('AC');			ComboLista.Add('0');
      ComboDatos.Add('CA');			ComboLista.Add('1');
    end;

    FActive := False;
    FKeyFields.Add('CVE_SEGMENTO');
    TableName := 'SEGMENTO';
    UseQuery := True;
    HelpFile := 'IntSegm.hlp';
    ShowMenuReporte:=True;
    IsCorp:=True;
end;

destructor TSegmento.Destroy;
begin inherited;
end;

Function TSegmento.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWSegmento;
begin
   W:=TWSegmento.Create(Self);
   try
      W.Segm:= Self;
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


Function TSegmento.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T:=CreaBuscador('IntSegm.it','S,S,S');

   try
      if Active then T.Param(0,Cve_Segmento.AsString);
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TSegmento.Reporte:Boolean;
begin Execute_RepSegm(True,Self);
end;


(***********************************************FORMA DE Requisito***************)
(*                                                                              *)
(*  FORMA DE Requisito                                                          *)
(*                                                                              *)
(***********************************************FORMA DE Requisito***************)

procedure TWSegmento.FormShow(Sender: TObject);
begin Segm.Cve_Segmento.Control := EdCveSegmento;
      Segm.Desc_Segmento.Control:= EdSegmento;
      Segm.Sit_Segmento.Control := rgSituacion;
end;

procedure TWSegmento.FormDestroy(Sender: TObject);
begin Segm.Cve_Segmento.Control := nil;
      Segm.Desc_Segmento.Control := nil;
      Segm.Sit_Segmento.Control := nil;
end;


procedure TWSegmento.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;


procedure TWSegmento.InterForma1DespuesNuevo(Sender: TObject);
begin
	edCveSegmento.SetFocus;
   rgSituacion.ItemIndex := 0;
end;

procedure TWSegmento.InterForma1DespuesModificar(Sender: TObject);
begin edSegmento.SetFocus;
end;

procedure TWSegmento.btReporteClick(Sender: TObject);
begin
  If Segm.ValidaAccesoEsp('SEGM_REPORTE',True,True) Then
  Begin
    Segm.Reporte;
  End;
end;

end.



