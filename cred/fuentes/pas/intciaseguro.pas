// Sistema         : Clase de CIA_SEGURO
// Fecha de Inicio : 11/07/2000
// Función forma   : Clase de CIA_SEGURO
// Diseñado por    : Eleuterio Arellano Saldaña
// Comentarios     :
Unit IntCiaSeguro;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCiaSeguro= class; 

  TWCiaSeguro=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_CIA_SEGURO : TLabel;
    edCVE_CIA_SEGURO : TEdit;
    lbDESC_CIA_SEGURO : TLabel;
    edDESC_CIA_SEGURO : TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCiaSeguro;
end;
 TCiaSeguro= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_CIA_SEGURO           : TInterCampo;
        DESC_CIA_SEGURO          : TInterCampo;
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


constructor TCiaSeguro.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_CIA_SEGURO :=CreaCampo('CVE_CIA_SEGURO',ftString,tsNinguno,tsNinguno,True);
                CVE_CIA_SEGURO.Caption:='Clave';
      DESC_CIA_SEGURO :=CreaCampo('DESC_CIA_SEGURO',ftString,tsNinguno,tsNinguno,True);
                DESC_CIA_SEGURO.Caption:='Nombre Compañía de Seguros';
      FKeyFields.Add('CVE_CIA_SEGURO');

      TableName := 'CIA_SEGURO';
      UseQuery := True;
      HelpFile := 'IntCiaSeguro.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCiaSeguro.Destroy;
begin inherited;
end;


function TCiaSeguro.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCiaSeguro;
begin
   W:=TWCiaSeguro.Create(Self);
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


Function TCiaSeguro.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICiaSegu.it','S');
      Try if Active then begin T.Param(0,CVE_CIA_SEGURO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TCiaSeguro.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CIA_SEGURO********************)
(*                                                                              *)
(*  FORMA DE CIA_SEGURO                                                            *)
(*                                                                              *)
(***********************************************FORMA CIA_SEGURO********************)

procedure TWCiaSeguro.FormShow(Sender: TObject);
begin
      Objeto.CVE_CIA_SEGURO.Control:=edCVE_CIA_SEGURO;
      Objeto.DESC_CIA_SEGURO.Control:=edDESC_CIA_SEGURO;
end;

procedure TWCiaSeguro.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_CIA_SEGURO.Control:=nil;
      Objeto.DESC_CIA_SEGURO.Control:=nil;
   //Objeto
end;

procedure TWCiaSeguro.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCiaSeguro.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCiaSeguro.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCiaSeguro.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


end.
