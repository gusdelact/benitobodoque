// Sistema         : Clase de TCrMLi
// Fecha de Inicio : 25/04/2000
// Función forma   : Clase de TCrMLi
// Diseñado por    : Juan Carlos Sanchez Reyes
// Comentarios     :
Unit IntCrMLi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCrMLi= class; 

  TWCrMLi=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_LIBERACION : TLabel; 
    edCVE_LIBERACION : TEdit;
    lbDESC_LIBERACION : TLabel; 
    edDESC_LIBERACION : TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrMLi;
end; 
 TCrMLi= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_LIBERACION           : TInterCampo;
        DESC_LIBERACION          : TInterCampo;
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


constructor TCrMLi.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_LIBERACION :=CreaCampo('CVE_LIBERACION',ftString,tsNinguno,tsNinguno,True);
                CVE_LIBERACION.Caption:='Clave de Liberacion';
      DESC_LIBERACION :=CreaCampo('DESC_LIBERACION',ftString,tsNinguno,tsNinguno,True);
                DESC_LIBERACION.Caption:='Descripción Liberacion';
      FKeyFields.Add('CVE_LIBERACION');

      TableName := 'CRE_MOTIVO_LIBER'; 
      UseQuery := True; 
      HelpFile := 'IntCrMLi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrMLi.Destroy;
begin inherited;
end;


function TCrMLi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMLi;
begin
   W:=TWCrMLi.Create(Self);
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


Function TCrMLi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrMLi.it','S');
      Try if Active then begin T.Param(0,CVE_LIBERACION.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrMLi.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA TCrMLi********************)
(*                                                                              *)
(*  FORMA DE TCrMLi                                                            *)
(*                                                                              *)
(***********************************************FORMA TCrMLi********************)

procedure TWCrMLi.FormShow(Sender: TObject);
begin
      Objeto.CVE_LIBERACION.Control:=edCVE_LIBERACION;
      Objeto.DESC_LIBERACION.Control:=edDESC_LIBERACION;
end;

procedure TWCrMLi.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_LIBERACION.Control:=nil;
      Objeto.DESC_LIBERACION.Control:=nil;
   //Objeto
end;

procedure TWCrMLi.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMLi.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrMLi.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrMLi.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


end.
