// Sistema         : Clase de TCrPCa
// Fecha de Inicio : 31/05/2000
// Función forma   : Clase de TCrPCa
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Juan Carlos Sanchez Reyes
// Comentarios     :
Unit IntCrPCa;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCrPCa= class;

  TWCrPCa=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_CALIF : TLabel; 
    edCVE_CALIF : TEdit;
    lbNUM_MENS_VEN : TLabel; 
    edNUM_MENS_VEN : TEdit;
    lbPCT_PROV_CALIF : TLabel; 
    edPCT_PROV_CALIF : TEdit;
    lbPCT_EXP_RIESGO : TLabel; 
    edPCT_EXP_RIESGO : TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrPCa;
end;
 TCrPCa= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_CALIF                : TInterCampo;
        NUM_MENS_VEN             : TInterCampo;
        PCT_PROV_CALIF           : TInterCampo;
        PCT_EXP_RIESGO           : TInterCampo;
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


constructor TCrPCa.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_CALIF :=CreaCampo('CVE_CALIF',ftString,tsNinguno,tsNinguno,True);
        CVE_CALIF.Size:=4;
        CVE_CALIF.Caption:='Clave de Calif';
      NUM_MENS_VEN :=CreaCampo('NUM_MENS_VEN',ftFloat,tsNinguno,tsNinguno,True);
                NUM_MENS_VEN.Caption:='Número Mens Ven';
      PCT_PROV_CALIF :=CreaCampo('PCT_PROV_CALIF',ftFloat,tsNinguno,tsNinguno,True);
                PCT_PROV_CALIF.Caption:='Pct Prov Calif';
      PCT_EXP_RIESGO :=CreaCampo('PCT_EXP_RIESGO',ftFloat,tsNinguno,tsNinguno,True);
                PCT_EXP_RIESGO.Caption:='Pct Exp Riesgo';
      FKeyFields.Add('CVE_CALIF');
      FKeyFields.Add('NUM_MENS_VEN');

      TableName := 'CRE_PORC_CALIF';
      UseQuery := True;
      HelpFile := 'IntCrPCa.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrPCa.Destroy;
begin inherited;
end;


function TCrPCa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrPCa;
begin
   W:=TWCrPCa.Create(Self);
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


Function TCrPCa.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrPCa.it','S,F');
      Try if Active then begin T.Param(0,CVE_CALIF.AsString);
                               T.Param(1,NUM_MENS_VEN.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

function TCrPCa.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA TCrPCa********************)
(*                                                                              *)
(*  FORMA DE TCrPCa                                                            *)
(*                                                                              *)
(***********************************************FORMA TCrPCa********************)

procedure TWCrPCa.FormShow(Sender: TObject);
begin
      Objeto.CVE_CALIF.Control:=edCVE_CALIF;
      Objeto.NUM_MENS_VEN.Control:=edNUM_MENS_VEN;
      Objeto.PCT_PROV_CALIF.Control:=edPCT_PROV_CALIF;
      Objeto.PCT_EXP_RIESGO.Control:=edPCT_EXP_RIESGO;
end;

procedure TWCrPCa.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_CALIF.Control:=nil;
      Objeto.NUM_MENS_VEN.Control:=nil;
      Objeto.PCT_PROV_CALIF.Control:=nil;
      Objeto.PCT_EXP_RIESGO.Control:=nil;
   //Objeto
end;

procedure TWCrPCa.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrPCa.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrPCa.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrPCa.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


end.
