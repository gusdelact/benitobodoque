// Sistema         : Clase de SECU_MENU
// Fecha de Inicio : 12/08/1998
// Función forma   : Clase de SECU_MENU
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Jose Alberto Ramirez Pacheco
// Comentarios     :
Unit IntMenu;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TSecuMenu= class;

  TWSecuMenu=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_APLICACION : TLabel;
    edCVE_APLICACION : TEdit;
    edCVE_MENU : TEdit;
    chB_BLOQUEADO : TCheckBox;
    lbNOM_MENU : TLabel;
    edNOM_MENU : TEdit;
    lbNUM_POSICION : TLabel;
    edNUM_POSICION : TEdit;
    lbTX_DESC_MENU : TLabel;
    edTX_DESC_MENU : TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TSecuMenu;
end;
 TSecuMenu= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations } 
        CVE_APLICACION           : TInterCampo;
        CVE_MENU                 : TInterCampo;
        B_BLOQUEADO              : TInterCampo;
        NOM_MENU                 : TInterCampo;
        NUM_POSICION             : TInterCampo;
        TX_DESC_MENU             : TInterCampo;



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


constructor TSecuMenu.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_APLICACION :=CreaCampo('CVE_APLICACION',ftString,tsNinguno,tsNinguno,True);
        CVE_APLICACION .Size:=6;
                CVE_APLICACION.Caption:='Clave de Aplicacion';
      CVE_MENU :=CreaCampo('CVE_MENU',ftString,tsNinguno,tsNinguno,True);
        CVE_MENU .Size:=8;
                CVE_MENU.Caption:='Clave de Menu';
      B_BLOQUEADO :=CreaCampo('B_BLOQUEADO',ftString,tsNinguno,tsNinguno,True);
        B_BLOQUEADO .Size:=1;
                B_BLOQUEADO.Caption:='Bloqueado';
      NOM_MENU :=CreaCampo('NOM_MENU',ftString,tsNinguno,tsNinguno,True);
        NOM_MENU .Size:=30;
                NOM_MENU.Caption:='Nombre Menu';
      NUM_POSICION :=CreaCampo('NUM_POSICION',ftFloat,tsNinguno,tsNinguno,True);
                NUM_POSICION.Caption:='Número Posicion';
      TX_DESC_MENU :=CreaCampo('TX_DESC_MENU',ftString,tsNinguno,tsNinguno,True);
                TX_DESC_MENU.Caption:='Descripción Menu';
      FKeyFields.Add('CVE_APLICACION');
      FKeyFields.Add('CVE_MENU');

      TableName := 'SECU_MENU'; 
      UseQuery := True; 
      HelpFile := 'IntSecuMenu.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TSecuMenu.Destroy;
begin inherited;
end;


function TSecuMenu.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWSecuMenu;
begin
   W:=TWSecuMenu.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.CentrarForma := True;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TSecuMenu.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ISecMen.it','S,S');
      Try if Active then begin T.Param(0,CVE_APLICACION.AsString); 
                               T.Param(1,CVE_MENU.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

function TSecuMenu.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA SECU_MENU********************)
(*                                                                              *)
(*  FORMA DE SECU_MENU                                                            *)
(*                                                                              *)
(***********************************************FORMA SECU_MENU********************)

procedure TWSecuMenu.FormShow(Sender: TObject);
begin
      Objeto.CVE_APLICACION.Control:=edCVE_APLICACION;
      Objeto.CVE_MENU.Control:=edCVE_MENU;
      Objeto.B_BLOQUEADO.Control:=chB_BLOQUEADO;
      Objeto.NOM_MENU.Control:=edNOM_MENU;
      Objeto.NUM_POSICION.Control:=edNUM_POSICION;
      Objeto.TX_DESC_MENU.Control:=edTX_DESC_MENU;
end;

procedure TWSecuMenu.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_APLICACION.Control:=nil;
      Objeto.CVE_MENU.Control:=nil;
      Objeto.B_BLOQUEADO.Control:=nil;
      Objeto.NOM_MENU.Control:=nil;
      Objeto.NUM_POSICION.Control:=nil;
      Objeto.TX_DESC_MENU.Control:=nil;
   //Objeto
end;

procedure TWSecuMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWSecuMenu.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWSecuMenu.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWSecuMenu.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;



end.
