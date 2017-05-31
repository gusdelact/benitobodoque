// Sistema         : Clase de Requisito
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Requisito
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :
unit IntReq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun;

type

  TRequisito = Class;
  TWRequisito = class(TForm)
    InterForma1    : TInterForma;
    Panel1         : TPanel;
    lbICveRequisito: TLabel;
    lbDescRequisito: TLabel;
    EdCveRequisito : TEdit;
    EdRequisito    : TEdit;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Req : TRequisito;
  end;

  TRequisito = class(TInterFrame)
  private
  protected
//  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    { Public declarations }
    Cve_Requisito        : TInterCampo;
    Desc_Requisito       : TInterCampo;
    function InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

implementation

Uses RepReq;
{$R *.DFM}

constructor TRequisito.Create( AOwner : TComponent );
begin
   Inherited;
   Cve_Requisito := CreaCampo('CVE_REQUISITO',ftString,tsNinguno,tsNinguno,True);
   Cve_Requisito.Size := 4;
   Desc_Requisito := CreaCampo('DESC_REQUISITO',ftString,tsNinguno,tsNinguno,True);
   FActive := False;
   FKeyFields.Add('CVE_REQUISITO');
   TableName := 'REQUISITO';
   UseQuery := True;
   HelpFile := 'IntReq.hlp';
   ShowMenuReporte:=True;
   IsCorp:=True;
end;

destructor TRequisito.Destroy;
begin inherited;
end;



Function TRequisito.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWRequisito;
begin
   W:=TWRequisito.Create(Self);
   try
      W.Req:= Self;
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


Function TRequisito.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T:=CreaBuscador('IntReq.it','S,S');
      try if Active then T.Param(0,Cve_Requisito.AsString);
          if T.Execute then
          InternalBusca := FindKey([T.DameCampo(0)]);
          {end-if}
      finally T.Free;
      end;
      {end-try}
end;


function TRequisito.Reporte:Boolean;
begin Execute_RepReq(True,Self);
end;

(***********************************************FORMA DE Requisito***************)
(*                                                                              *)
(*  FORMA DE Requisito                                                          *)
(*                                                                              *)
(***********************************************FORMA DE Requisito***************)

procedure TWRequisito.FormShow(Sender: TObject);
begin Req.Cve_Requisito.Control := EdCveRequisito;
      Req.Desc_Requisito.Control := EdRequisito;
end;

procedure TWRequisito.FormDestroy(Sender: TObject);
begin Req.Cve_Requisito.Control := nil;
      Req.Desc_Requisito.Control := nil;
end;

procedure TWRequisito.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWRequisito.InterForma1DespuesNuevo(Sender: TObject);
begin edCveRequisito.SetFocus;
end;

procedure TWRequisito.InterForma1DespuesModificar(Sender: TObject);
begin edRequisito.SetFocus;
end;

procedure TWRequisito.BitBtn1Click(Sender: TObject);
begin Req.Reporte;
end;

end.



