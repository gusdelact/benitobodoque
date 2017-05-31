// Sistema         : Clase de CRE_SUB_CARTERA
// Fecha de Inicio : 25/05/1998
// Función forma   : Clase de CRE_SUB_CARTERA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Benjamin Hernandez Delsordo
// Comentarios     :

Unit IntCrCar;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCrCar= class;

  TWCreCar=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_SUB_CARTERA : TLabel;
    edCVE_SUB_CARTERA : TEdit;
    lbDESC_LARGA : TLabel;
    edDESC_LARGA : TEdit;
    lbCVE_ORIG_CARTERA : TLabel;
    edCVE_ORIG_CARTERA : TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrCar;
end;
 TCrCar= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_SUB_CARTERA          : TInterCampo;
        DESC_LARGA               : TInterCampo;
        CVE_ORIG_CARTERA         : TInterCampo;
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


constructor TCrCar.Create( AOwner : TComponent );
begin Inherited;
      CVE_SUB_CARTERA :=CreaCampo('CVE_SUB_CARTERA',ftString,tsNinguno,tsNinguno,True);
        CVE_SUB_CARTERA .Size:=6;
                CVE_SUB_CARTERA.Caption:='Clave de Sub Cartera';
      DESC_LARGA :=CreaCampo('DESC_LARGA',ftString,tsNinguno,tsNinguno,True);
                DESC_LARGA.Caption:='Descripción Larga';
      CVE_ORIG_CARTERA :=CreaCampo('CVE_ORIG_CARTERA',ftString,tsNinguno,tsNinguno,True);
        CVE_ORIG_CARTERA .Size:=6;
                CVE_ORIG_CARTERA.Caption:='Clave de Orig Cartera';
      FKeyFields.Add('CVE_SUB_CARTERA');

      TableName := 'CRE_SUB_CARTERA';
      UseQuery := True;
      HelpFile := 'IntCrCar.Hlp';
      ShowMenuReporte:=True;
      IsCheckSecu := False;
end;

Destructor TCrCar.Destroy;
begin
  inherited;
end;


function TCrCar.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCreCar;
begin
   W:=TWCreCar.Create(Self);
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


Function TCrCar.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IntCrCar.it','S');
      Try if Active then begin T.Param(0,CVE_SUB_CARTERA.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrCar.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CRE_SUB_CARTERA********************)
(*                                                                              *)
(*  FORMA DE CRE_SUB_CARTERA                                                            *)
(*                                                                              *)
(***********************************************FORMA CRE_SUB_CARTERA********************)

procedure TWCreCar.FormShow(Sender: TObject);
begin
      Objeto.CVE_SUB_CARTERA.Control:=edCVE_SUB_CARTERA;
      Objeto.DESC_LARGA.Control:=edDESC_LARGA;
      Objeto.CVE_ORIG_CARTERA.Control:=edCVE_ORIG_CARTERA;
end;

procedure TWCreCar.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_SUB_CARTERA.Control:=nil;
      Objeto.DESC_LARGA.Control:=nil;
      Objeto.CVE_ORIG_CARTERA.Control:=nil;
   //Objeto
end;

procedure TWCreCar.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCreCar.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCreCar.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCreCar.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


end.
