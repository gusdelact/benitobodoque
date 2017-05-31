Unit IntPsiEvalua;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun;


Type
 TPsiEvalua= class; 

  TWPsiEvaluacion=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_EVALUACION         : TLabel;
    edID_EVALUACION         : TEdit;
    lbSIT_EVALUACION        : TLabel;
    edSIT_EVALUACION        : TEdit;
    procedure FormShow   ( Sender : TObject);
    procedure FormClose  ( Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy( Sender : TObject);  
    private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TPsiEvalua;
end; 
 TPsiEvalua= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_EVALUACION            : TInterCampo;
        SIT_EVALUACION           : TInterCampo;
        
        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published 
      end;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TPsiEvalua.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_EVALUACION     :=CreaCampo('ID_EVALUACION' , ftInteger , tsNinguno, tsNinguno, True);
      ID_EVALUACION.Size:= 10;
      SIT_EVALUACION    :=CreaCampo('SIT_EVALUACION', ftString  , tsNinguno, tsNinguno, True);

      ID_EVALUACION.Caption             :='Número de Evaluacion';
      SIT_EVALUACION.Caption            :='Situación Evaluacion';


      FKeyFields.Add('ID_EVALUACION');
      TableName       := 'PSI_EVALUACION';
      FActive         := False;
      UseQuery        := True;
      ShowMenuReporte := True;
    //IsCorp:=True;
end;

Destructor TPsiEvalua.Destroy;
begin inherited;
end;


function TPsiEvalua.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWPsiEvaluacion;
begin
   W:=TWPsiEvaluacion.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.FormaEstilo   := feAutomatico;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TPsiEvalua.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ItPsiEval.it','I,S');
      Try
        if Active then T.Param(0,ID_EVALUACION.AsString);
        if T.Execute then
          InternalBusca := FindKey([T.DameCampo(0)]);
      finally
        T.Free;
      end; 
end;


(***********************************************FORMA PSI_EVALUACION********************)
(*                                                                              *)
(*  FORMA DE PSI_EVALUACION                                                            *)
(*                                                                              *)
(***********************************************FORMA PSI_EVALUACION********************)

procedure TWPsiEvaluacion.FormShow(Sender: TObject);
begin
      Objeto.ID_EVALUACION.Control              := edID_EVALUACION;
      Objeto.SIT_EVALUACION.Control             := edSIT_EVALUACION;
end;

procedure TWPsiEvaluacion.FormDestroy(Sender: TObject);
begin
      Objeto.ID_EVALUACION.Control:=nil;
      Objeto.SIT_EVALUACION.Control:=nil;
end;

procedure TWPsiEvaluacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

end.
