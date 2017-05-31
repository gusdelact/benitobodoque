// Sistema         : Clase de CrProCap
// Fecha de Inicio : 20/06/2006
// Función forma   : Clase de CrProCap
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntCrProCap;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCrprocap= class; 

  TWCrprocap=Class(TForm)
    InterForma1             : TInterForma;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrprocap;
end; 
 TCrprocap= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
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


constructor TCrprocap.Create( AOwner : TComponent ); 
begin Inherited; 

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrProCap.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrprocap.Destroy;
begin inherited;
end;


function TCrprocap.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrprocap;
begin
   W:=TWCrprocap.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrprocap.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrproca.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrprocap.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrProCap********************)
(*                                                                              *)
(*  FORMA DE CrProCap                                                            *)
(*                                                                              *)
(***********************************************FORMA CrProCap********************)

procedure TWCrprocap.FormShow(Sender: TObject);
begin
     //Objeto
end;

procedure TWCrprocap.FormDestroy(Sender: TObject);
begin
     //Objeto
end;

procedure TWCrprocap.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrprocap.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrprocap.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrprocap.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


end.
