// Sistema         : Clase de CRE_GAR_CNBV
// Fecha de Inicio : 09/10/2000
// Función forma   : Clase de CRE_GAR_CNBV
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCreGarCnb;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCGarCNBV= class; 

  TWCGarCNBV=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_GAR_CNBV : TLabel; 
    edCVE_GAR_CNBV : TEdit;
    lbDESC_GAR_CNBV : TLabel; 
    edDESC_GAR_CNBV : TEdit;
    Label1: TLabel;
    edPctAsignar: TEdit;
    cbCarga: TCheckBox;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCGarCNBV;
end; 
 TCGarCNBV= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        CVE_GAR_CNBV             : TInterCampo;
        DESC_GAR_CNBV            : TInterCampo;
        PCT_ASIGNAR              :TInterCampo;
        B_CARGA_QUAL             :TInterCampo;
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


constructor TCGarCNBV.Create( AOwner : TComponent ); 
begin Inherited;
      CVE_GAR_CNBV :=CreaCampo('CVE_GAR_CNBV',ftFloat,tsNinguno,tsNinguno,True);
                CVE_GAR_CNBV.Caption:='Clave de Gar Cnbv';
      DESC_GAR_CNBV :=CreaCampo('DESC_GAR_CNBV',ftString,tsNinguno,tsNinguno,True);
                DESC_GAR_CNBV.Caption:='Descripción ';
      PCT_ASIGNAR  :=CreaCampo('PCT_ASIGNAR',ftFloat,tsNinguno,tsNinguno,True);
      B_CARGA_QUAL :=CreaCampo('B_CARGA_QUAL',ftString,tsNinguno,tsNinguno,True);
      B_CARGA_QUAL.Size:=1;
      FKeyFields.Add('CVE_GAR_CNBV');

      TableName := 'CRE_GAR_CNBV'; 
      UseQuery := True; 
      HelpFile := 'IntCreGarCnb.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCGarCNBV.Destroy;
begin inherited;
end;


function TCGarCNBV.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCGarCNBV;
begin
   W:=TWCGarCNBV.Create(Self);
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


Function TCGarCNBV.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrGarCNBV.it','F');
      Try if Active then begin T.Param(0,CVE_GAR_CNBV.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCGarCNBV.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CRE_GAR_CNBV********************)
(*                                                                              *)
(*  FORMA DE CRE_GAR_CNBV                                                            *)
(*                                                                              *)
(***********************************************FORMA CRE_GAR_CNBV********************)

procedure TWCGarCNBV.FormShow(Sender: TObject);
begin
      Objeto.CVE_GAR_CNBV.Control:=edCVE_GAR_CNBV;
      Objeto.DESC_GAR_CNBV.Control:=edDESC_GAR_CNBV;
      Objeto.PCT_ASIGNAR.Control := edPctAsignar;
      Objeto.B_CARGA_QUAL.Control := cbCarga;
end;

procedure TWCGarCNBV.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_GAR_CNBV.Control:=nil;
      Objeto.DESC_GAR_CNBV.Control:=nil;
      Objeto.PCT_ASIGNAR.Control := nil;
      Objeto.B_CARGA_QUAL.Control := nil;
end;

procedure TWCGarCNBV.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCGarCNBV.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCGarCNBV.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCGarCNBV.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


end.
