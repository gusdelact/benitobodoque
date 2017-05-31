// Sistema         : Clase de TCrSGa
// Fecha de Inicio : 25/04/2000
// Función forma   : Clase de TCrSGa
// Diseñado por    : Juan Carlos Sanchez Reyes
// Comentarios     :
Unit IntCrSGa;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, IntCrGar;

Type
 TCrSGa= class; 

  TWCrSGa=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_SUB_TIP_GAR : TLabel; 
    edCVE_SUB_TIP_GAR : TEdit;
    lbDESC_SUB_TIP_GAR : TLabel; 
    edDESC_SUB_TIP_GAR : TEdit;
    lbCVE_GARANTIA : TLabel; 
    edCVE_GARANTIA : TEdit;
    sbTipGar: TSpeedButton;
    edNbrGarantia: TEdit;
    InterLinkit1: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbTipGarClick(Sender: TObject);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrSGa;
end; 
 TCrSGa= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public 
        { Public declarations } 
        CVE_SUB_TIP_GAR          : TInterCampo;
        DESC_SUB_TIP_GAR         : TInterCampo;
        CVE_GARANTIA             : TInterCampo;
        B_SEGURO                 : TInterCampo;
        TipGar                   : TCrGar;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrSGa.Create( AOwner : TComponent );
begin Inherited;
  CVE_SUB_TIP_GAR :=CreaCampo('CVE_SUB_TIP_GAR',ftString,tsNinguno,tsNinguno,True);
       CVE_SUB_TIP_GAR.Caption:='Clave de Sub Tip Gar';
  DESC_SUB_TIP_GAR :=CreaCampo('DESC_SUB_TIP_GAR',ftString,tsNinguno,tsNinguno,True);
       DESC_SUB_TIP_GAR.Caption:='Descripción Sub Tip Gar';
  CVE_GARANTIA :=CreaCampo('CVE_GARANTIA',ftString,tsNinguno,tsNinguno,True);
  B_SEGURO :=CreaCampo('B_SEGURO',ftString,tsNinguno,tsNinguno,True);
       CVE_GARANTIA.Size:=8;
       CVE_GARANTIA.Caption:='Clave de Garantia';
  FKeyFields.Add('CVE_SUB_TIP_GAR');

  TableName := 'CRE_SUB_TIP_GAR';
  UseQuery := True;
  HelpFile := 'IntCrSGa.Hlp';
  ShowMenuReporte:=True;

  TipGar:= TCrGar.Create(Self);
  TipGar.MasterSource := Self;
  TipGar.FieldByName('CVE_GARANTIA').MasterField := 'CVE_GARANTIA';
end;

Destructor TCrSGa.Destroy;
begin
  if TipGar <> nil then TipGar.Free;
  inherited;
end;

function TCrSGa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrSGa;
begin
   W:=TWCrSGa.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
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


Function TCrSGa.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrSGa.it','S');
      Try if Active then begin T.Param(0,CVE_SUB_TIP_GAR.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TCrSGa.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA TCrSGa********************)
(*                                                                              *)
(*  FORMA DE TCrSGa                                                            *)
(*                                                                              *)
(***********************************************FORMA TCrSGa********************)

procedure TWCrSGa.FormShow(Sender: TObject);
begin
  Objeto.CVE_SUB_TIP_GAR.Control:=edCVE_SUB_TIP_GAR;
  Objeto.DESC_SUB_TIP_GAR.Control:=edDESC_SUB_TIP_GAR;

  Objeto.TipGar.CVE_GARANTIA.Control    := edCVE_GARANTIA;
  Objeto.TipGar.MasterSourceEditControl := sbTipGar;
  Objeto.TipGar.DESC_GARANTIA.Control   := edNbrGarantia;
end;

procedure TWCrSGa.FormDestroy(Sender: TObject);
begin
  Objeto.TipGar.CVE_GARANTIA.Control    := nil;
  Objeto.TipGar.MasterSourceEditControl := nil;
  Objeto.TipGar.DESC_GARANTIA.Control   := nil;
  Objeto.CVE_SUB_TIP_GAR.Control        := nil;
  Objeto.DESC_SUB_TIP_GAR.Control       := nil;
end;

procedure TWCrSGa.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrSGa.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrSGa.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrSGa.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrSGa.sbTipGarClick(Sender: TObject);
begin
  Objeto.TipGar.Busca;
end;

procedure TWCrSGa.InterLinkit1Ejecuta(Sender: TObject);
begin
  Objeto.TipGar.FindKey([edCVE_GARANTIA.Text]);
end;

end.
