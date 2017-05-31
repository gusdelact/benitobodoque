// Sistema         : Clase de TIPO_GPO_CONTRAT
// Fecha de Inicio : 29/03/2001
// Función forma   : Clase de TIPO_GPO_CONTRAT
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Jose Armando Garcia Estrada
// Comentarios     :
Unit IntTGpContra;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TTGpContra= class; 

  TWTGpContrat=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_TIPO_GPO : TLabel; 
    edCVE_TIPO_GPO : TEdit;
    lbDESC_L_ID_PRIM : TLabel; 
    edDESC_L_ID_PRIM : TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TTGpContra;
end; 
 TTGpContra= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_TIPO_GPO             : TInterCampo;
        DESC_L_ID_PRIM           : TInterCampo;
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


constructor TTGpContra.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_TIPO_GPO :=CreaCampo('CVE_TIPO_GPO',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_GPO.Caption:='Clave de Tipo Grupo';
      DESC_L_ID_PRIM :=CreaCampo('DESC_L_ID_PRIM',ftString,tsNinguno,tsNinguno,True);
                DESC_L_ID_PRIM.Caption:='Descripción L Número de Prim';
      FKeyFields.Add('CVE_TIPO_GPO');

      TableName := 'TIPO_GPO_CONTRAT'; 
      UseQuery := True; 
      HelpFile := 'IntTGpContra.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TTGpContra.Destroy;
begin inherited;
end;


function TTGpContra.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWTGpContrat;
begin
   W:=TWTGpContrat.Create(Self);
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


Function TTGpContra.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ITGpCont.it','S');
      Try if Active then begin T.Param(0,CVE_TIPO_GPO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TTGpContra.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA TIPO_GPO_CONTRAT********************)
(*                                                                              *)
(*  FORMA DE TIPO_GPO_CONTRAT                                                            *)
(*                                                                              *)
(***********************************************FORMA TIPO_GPO_CONTRAT********************)

procedure TWTGpContrat.FormShow(Sender: TObject);
begin
      Objeto.CVE_TIPO_GPO.Control:=edCVE_TIPO_GPO;
      Objeto.DESC_L_ID_PRIM.Control:=edDESC_L_ID_PRIM;
end;

procedure TWTGpContrat.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_TIPO_GPO.Control:=nil;
      Objeto.DESC_L_ID_PRIM.Control:=nil;
   //Objeto
end;

procedure TWTGpContrat.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWTGpContrat.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWTGpContrat.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWTGpContrat.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


end.
