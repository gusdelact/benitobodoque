// Sistema         : Clase de MEDIO
// Fecha de Inicio : 8/10/1998
// Función forma   : Clase de MEDIO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Marcos Zarate Castro
// Comentarios     :
Unit IntMedio;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TMedio= class; 

  TWMedio=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_MEDIO : TLabel; 
    edCVE_MEDIO : TEdit;
    lbDESC_MEDIO : TLabel; 
    edDESC_MEDIO : TEdit;
    cbB_APLIC_EMAIL: TCheckBox;
    cbB_MEDIO_PAGO: TCheckBox;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TMedio;
end; 
 TMedio= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public 
        { Public declarations } 
        CVE_MEDIO                : TInterCampo;
        DESC_MEDIO               : TInterCampo;
        B_APLIC_EMAIL            : TInterCampo;
        B_MEDIO_PAGO             : TInterCampo; //EASA4011 15 NOV 2006
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


constructor TMedio.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_MEDIO :=CreaCampo('CVE_MEDIO',ftString,tsNinguno,tsNinguno,True);
                CVE_MEDIO.Caption:='Clave de Medio';
      DESC_MEDIO :=CreaCampo('DESC_MEDIO',ftString,tsNinguno,tsNinguno,True);
                DESC_MEDIO.Caption:='Descripción Medio';
      B_APLIC_EMAIL :=CreaCampo('B_APLIC_EMAIL',ftString,tsNinguno,tsNinguno,True);
        B_APLIC_EMAIL.Size:=1;
                B_APLIC_EMAIL.Caption:='B_APLIC_EMAIL';
      //EASA4011 15 NOV 2006
      B_MEDIO_PAGO :=CreaCampo('B_MEDIO_PAGO',ftString,tsNinguno,tsNinguno,True);
        B_MEDIO_PAGO.Size:=1;
                B_MEDIO_PAGO.Caption:='B_MEDIO_PAGO';
                
      FKeyFields.Add('CVE_MEDIO');
      TableName := 'MEDIO';
      UseQuery := True;
      HelpFile := 'IntMedio.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMedio.Destroy;
begin inherited;
end;


function TMedio.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMedio;
begin
   W:=TWMedio.Create(Self);
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


Function TMedio.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IMedio.it','S');
      Try if Active then begin T.Param(0,CVE_MEDIO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TMedio.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA MEDIO********************)
(*                                                                              *)
(*  FORMA DE MEDIO                                                            *)
(*                                                                              *)
(***********************************************FORMA MEDIO********************)

procedure TWMedio.FormShow(Sender: TObject);
begin
      Objeto.CVE_MEDIO.Control:=edCVE_MEDIO;
      Objeto.DESC_MEDIO.Control:=edDESC_MEDIO;
      Objeto.B_APLIC_EMAIL.Control:=cbB_APLIC_EMAIL;
      Objeto.B_MEDIO_PAGO.Control:=cbB_MEDIO_PAGO;  //EASA4011 15 NOV 2006
end;

procedure TWMedio.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_MEDIO.Control:=nil;
      Objeto.DESC_MEDIO.Control:=nil;
      Objeto.B_APLIC_EMAIL.Control:=nil;
      Objeto.B_MEDIO_PAGO.Control:=nil; //EASA4011 15 NOV 2006
   //Objeto
end;

procedure TWMedio.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMedio.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMedio.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWMedio.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


end.
