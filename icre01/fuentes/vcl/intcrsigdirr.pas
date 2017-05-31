// Sistema         : Clase de CR_SIG_DIRREPASIS
// Fecha de Inicio : 20/09/2011
// Función forma   : Clase de CR_SIG_DIRREPASIS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrSigDirr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCrSigDirr= class; 

  TWCrSigDirrepasis=Class(TForm)
    InterForma1             : TInterForma; 
    lbCLAVE : TLabel; 
    edCLAVE : TEdit;
    lbDIRECCION : TLabel; 
    edDIRECCION : TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrSigDirr;
end; 
 TCrSigDirr= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CLAVE                    : TInterCampo;
        DIRECCION                : TInterCampo;
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


constructor TCrSigDirr.Create( AOwner : TComponent ); 
begin Inherited; 
      CLAVE :=CreaCampo('CLAVE',ftString,tsNinguno,tsNinguno,True);
                CLAVE.Caption:='Clave';
      DIRECCION :=CreaCampo('DIRECCION',ftString,tsNinguno,tsNinguno,True);
                DIRECCION.Caption:='Direccion';
      FKeyFields.Add('CLAVE');

      TableName := 'CR_SIG_DIRREPASIS'; 
      UseQuery := True; 
      HelpFile := 'IntCrSigDirr.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrSigDirr.Destroy;
begin inherited;
end;


function TCrSigDirr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrSigDirrepasis;
begin
   W:=TWCrSigDirrepasis.Create(Self);
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


Function TCrSigDirr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrSiDi.it','S');
      Try if Active then begin T.Param(0,CLAVE.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrSigDirr.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_SIG_DIRREPASIS********************)
(*                                                                              *)
(*  FORMA DE CR_SIG_DIRREPASIS                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_SIG_DIRREPASIS********************)

procedure TWCrSigDirrepasis.FormShow(Sender: TObject);
begin
      Objeto.CLAVE.Control:=edCLAVE;
      Objeto.DIRECCION.Control:=edDIRECCION;
end;

procedure TWCrSigDirrepasis.FormDestroy(Sender: TObject);
begin
      Objeto.CLAVE.Control:=nil;
      Objeto.DIRECCION.Control:=nil;
   //Objeto
end;

procedure TWCrSigDirrepasis.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrSigDirrepasis.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrSigDirrepasis.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrSigDirrepasis.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


end.
