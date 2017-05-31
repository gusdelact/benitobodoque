// Sistema         : Clase de LIM_GPO_RIESGO
// Fecha de Inicio : 25/10/2004
// Función forma   : Clase de LIM_GPO_RIESGO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Erika Susana Franco Salas
// Comentarios     :
Unit IntLimGpRies;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TLimGpRies= class; 

  TWLimGpRiesgo=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_GPO_RIESGO : TLabel; 
    edCVE_GPO_RIESGO : TEdit;
    lbDESC_GPO_RIESGO : TLabel; 
    edDESC_GPO_RIESGO : TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TLimGpRies;
end; 
 TLimGpRies= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_GPO_RIESGO           : TInterCampo;
        DESC_GPO_RIESGO          : TInterCampo;
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


constructor TLimGpRies.Create( AOwner : TComponent );
begin Inherited;
      CVE_GPO_RIESGO :=CreaCampo('CVE_GPO_RIESGO',ftString,tsNinguno,tsNinguno,True);
                CVE_GPO_RIESGO.Caption:='Clave de Grupo Riesgo';
      DESC_GPO_RIESGO :=CreaCampo('DESC_GPO_RIESGO',ftString,tsNinguno,tsNinguno,True);
                DESC_GPO_RIESGO.Caption:='Descripción Grupo Riesgo';

      FKeyFields.Add('CVE_GPO_RIESGO');


      TableName := 'LIM_GPO_RIESGO';
      UseQuery := True;
      HelpFile := 'IntLimGpRies.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TLimGpRies.Destroy;
begin inherited;
end;


function TLimGpRies.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWLimGpRiesgo;
begin
   W:=TWLimGpRiesgo.Create(Self);
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


Function TLimGpRies.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ILiGpRi.it','S');
      Try if Active then begin T.Param(0,CVE_GPO_RIESGO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TLimGpRies.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA LIM_GPO_RIESGO********************)
(*                                                                              *)
(*  FORMA DE LIM_GPO_RIESGO                                                            *)
(*                                                                              *)
(***********************************************FORMA LIM_GPO_RIESGO********************)

procedure TWLimGpRiesgo.FormShow(Sender: TObject);
begin
      Objeto.CVE_GPO_RIESGO.Control:=edCVE_GPO_RIESGO;
      Objeto.DESC_GPO_RIESGO.Control:=edDESC_GPO_RIESGO;
end;

procedure TWLimGpRiesgo.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_GPO_RIESGO.Control:=nil;
      Objeto.DESC_GPO_RIESGO.Control:=nil;
   //Objeto
end;

procedure TWLimGpRiesgo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWLimGpRiesgo.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWLimGpRiesgo.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWLimGpRiesgo.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


end.
