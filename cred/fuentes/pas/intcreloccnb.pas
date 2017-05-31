// Sistema         : Clase de CRE_LOCAL_CNBV
// Fecha de Inicio : 09/10/2000
// Función forma   : Clase de CRE_LOCAL_CNBV
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCreLocCnb;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCrLocCNBV= class;

  TWCrLocCNBV=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_LOCAL_CNBV : TLabel;
    edCVE_LOCAL_CNBV : TEdit;
    lbDESC_LOCAL_CNBV : TLabel;
    edDESC_LOCAL_CNBV : TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrLocCNBV;
end;
 TCrLocCNBV= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_LOCAL_CNBV           : TInterCampo;
        DESC_LOCAL_CNBV          : TInterCampo;
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


constructor TCrLocCNBV.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_LOCAL_CNBV :=CreaCampo('CVE_LOCAL_CNBV',ftString,tsNinguno,tsNinguno,True);
                CVE_LOCAL_CNBV.Caption:='Clave de Localidad';
      DESC_LOCAL_CNBV :=CreaCampo('DESC_LOCAL_CNBV',ftString,tsNinguno,tsNinguno,True);
                DESC_LOCAL_CNBV.Caption:='Descripción Localidad';
      FKeyFields.Add('CVE_LOCAL_CNBV');

      TableName := 'CRE_LOCAL_CNBV'; 
      UseQuery := True; 
      HelpFile := 'IntCreLocCnb.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrLocCNBV.Destroy;
begin inherited;
end;


function TCrLocCNBV.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrLocCNBV;
begin
   W:=TWCrLocCNBV.Create(Self);
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


Function TCrLocCNBV.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrLocCNBV.it','S');
      Try if Active then begin T.Param(0,CVE_LOCAL_CNBV.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrLocCNBV.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CRE_LOCAL_CNBV********************)
(*                                                                              *)
(*  FORMA DE CRE_LOCAL_CNBV                                                            *)
(*                                                                              *)
(***********************************************FORMA CRE_LOCAL_CNBV********************)

procedure TWCrLocCNBV.FormShow(Sender: TObject);
begin
      Objeto.CVE_LOCAL_CNBV.Control:=edCVE_LOCAL_CNBV;
      Objeto.DESC_LOCAL_CNBV.Control:=edDESC_LOCAL_CNBV;
end;

procedure TWCrLocCNBV.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_LOCAL_CNBV.Control:=nil;
      Objeto.DESC_LOCAL_CNBV.Control:=nil;
   //Objeto
end;

procedure TWCrLocCNBV.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrLocCNBV.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrLocCNBV.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrLocCNBV.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte; 
//end;


end.
