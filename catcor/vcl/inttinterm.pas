// Sistema         : Clase de TIPO_INTERM
// Fecha de Inicio : 12/02/1999
// Función forma   : Clase de TIPO_INTERM
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Roberto Hugo Gochicoa Melendez
// Comentarios     :
Unit IntTInterm;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TTInterm= class; 

  TWTInterm=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox1: TGroupBox;
    lbDESC_TIPO_INTERM: TLabel;
    edDESC_TIPO_INTERM: TEdit;
    lbCVE_TIPO_INTERM: TLabel;
    edCVE_TIPO_INTERM: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TTInterm;
end; 
 TTInterm= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_TIPO_INTERM          : TInterCampo;
        DESC_TIPO_INTERM         : TInterCampo;
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


constructor TTInterm.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_TIPO_INTERM :=CreaCampo('CVE_TIPO_INTERM',ftString,tsNinguno,tsNinguno,True);
        CVE_TIPO_INTERM .Size:=2;
                CVE_TIPO_INTERM.Caption:='Clave de Tipo Interm';
      DESC_TIPO_INTERM :=CreaCampo('DESC_TIPO_INTERM',ftString,tsNinguno,tsNinguno,True);
                DESC_TIPO_INTERM.Caption:='Descripción Tipo Interm';
      FKeyFields.Add('CVE_TIPO_INTERM');

      TableName := 'TIPO_INTERM'; 
      UseQuery := True; 
      HelpFile := 'IntTInterm.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TTInterm.Destroy;
begin inherited;
end;


function TTInterm.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWTInterm;
begin
   W:=TWTInterm.Create(Self);
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


Function TTInterm.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ITInterm.it','S');
      Try if Active then begin T.Param(0,CVE_TIPO_INTERM.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TTInterm.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA TIPO_INTERM********************)
(*                                                                              *)
(*  FORMA DE TIPO_INTERM                                                            *)
(*                                                                              *)
(***********************************************FORMA TIPO_INTERM********************)

procedure TWTInterm.FormShow(Sender: TObject);
begin
      Objeto.CVE_TIPO_INTERM.Control:=edCVE_TIPO_INTERM;
      Objeto.DESC_TIPO_INTERM.Control:=edDESC_TIPO_INTERM;
end;

procedure TWTInterm.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_TIPO_INTERM.Control:=nil;
      Objeto.DESC_TIPO_INTERM.Control:=nil;
   //Objeto
end;

procedure TWTInterm.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWTInterm.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWTInterm.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWTInterm.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;



end.
