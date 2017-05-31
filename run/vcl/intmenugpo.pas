// Sistema         : Clase de SECU_MENU_GPO
// Fecha de Inicio : 12/08/1998
// Función forma   : Clase de SECU_MENU_GPO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Jose Alberto Ramirez Pacheco
// Comentarios     :
Unit IntMenuGpo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntMenu;

Type
 TMenuGpo= class;

  TWMenuGpo=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_APLICACION : TLabel;
    edCVE_APLICACION : TEdit;
    lbCVE_MENU : TLabel;
    edCVE_MENU : TEdit;
    lbID_GPO_MENU : TLabel;
    edID_GPO_MENU : TEdit;
    lbB_BLOQUEADO : TLabel;
    chB_BLOQUEADO : TCheckBox;
    lbNUM_POSICION : TLabel;
    edNUM_POSICION : TEdit;
    lbTX_DESC_GPO_MENU : TLabel;
    edTX_DESC_GPO_MENU : TEdit;
    edNomMenu: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TMenuGpo;
end;
 TMenuGpo= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_APLICACION           : TInterCampo;
        CVE_MENU                 : TInterCampo;
        ID_GPO_MENU              : TInterCampo;
        B_BLOQUEADO              : TInterCampo;
        NUM_POSICION             : TInterCampo;
        TX_DESC_GPO_MENU         : TInterCampo;

        Menu: TSecuMenu;
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


constructor TMenuGpo.Create( AOwner : TComponent );
begin Inherited;
      CVE_APLICACION :=CreaCampo('CVE_APLICACION',ftString,tsNinguno,tsNinguno,True);
        CVE_APLICACION .Size:=6;
                CVE_APLICACION.Caption:='Clave de Aplicacion';
      CVE_MENU :=CreaCampo('CVE_MENU',ftString,tsNinguno,tsNinguno,True);
        CVE_MENU .Size:=8;
                CVE_MENU.Caption:='Clave de Menu';
      ID_GPO_MENU :=CreaCampo('ID_GPO_MENU',ftFloat,tsNinguno,tsNinguno,True);
                ID_GPO_MENU.Caption:='Número de Grupo Menu';
      B_BLOQUEADO :=CreaCampo('B_BLOQUEADO',ftString,tsNinguno,tsNinguno,True);
        B_BLOQUEADO .Size:=1;
                B_BLOQUEADO.Caption:='Bloqueado';
      NUM_POSICION :=CreaCampo('NUM_POSICION',ftFloat,tsNinguno,tsNinguno,True);
                NUM_POSICION.Caption:='Número Posicion';
      TX_DESC_GPO_MENU :=CreaCampo('TX_DESC_GPO_MENU',ftString,tsNinguno,tsNinguno,True);
        TX_DESC_GPO_MENU .Size:=40;
                TX_DESC_GPO_MENU.Caption:='Descripción Grupo Menu';


        Menu:= TSecuMenu.Create(self);
        Menu.MasterSource := self;
        Menu.CVE_APLICACION.MasterField := 'CVE_APLICACION';
        Menu.CVE_MENU.MasterField := 'CVE_MENU';


      FKeyFields.Add('CVE_APLICACION');
      FKeyFields.Add('CVE_MENU');
      FKeyFields.Add('ID_GPO_MENU');

      TableName := 'SECU_MENU_GPO';
      UseQuery := True;
      HelpFile := 'IntMenuGpo.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMenuGpo.Destroy;
begin inherited;
end;


function TMenuGpo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMenuGpo;
begin
   W:=TWMenuGpo.Create(Self);
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


Function TMenuGpo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ISeMeGp.it','S,S,F');
      Try if Active then begin T.Param(0,CVE_APLICACION.AsString); 
                               T.Param(1,CVE_MENU.AsString); 
                               T.Param(2,ID_GPO_MENU.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end; 
end;

function TMenuGpo.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA SECU_MENU_GPO********************)
(*                                                                              *)
(*  FORMA DE SECU_MENU_GPO                                                            *)
(*                                                                              *)
(***********************************************FORMA SECU_MENU_GPO********************)

procedure TWMenuGpo.FormShow(Sender: TObject);
begin
   Objeto.CVE_APLICACION.Control:=edCVE_APLICACION;
   Objeto.CVE_MENU.Control:=edCVE_MENU;
   Objeto.ID_GPO_MENU.Control:=edID_GPO_MENU;
   Objeto.B_BLOQUEADO.Control:=chB_BLOQUEADO;
   Objeto.NUM_POSICION.Control:=edNUM_POSICION;
   Objeto.TX_DESC_GPO_MENU.Control:=edTX_DESC_GPO_MENU;

   Objeto.Menu.NOM_MENU.Control := edNomMenu;
end;

procedure TWMenuGpo.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_APLICACION.Control:=nil;
   Objeto.CVE_MENU.Control:=nil;
   Objeto.ID_GPO_MENU.Control:=nil;
   Objeto.B_BLOQUEADO.Control:=nil;
   Objeto.NUM_POSICION.Control:=nil;
   Objeto.TX_DESC_GPO_MENU.Control:=nil;

   Objeto.Menu.NOM_MENU.Control := nil;
end;

procedure TWMenuGpo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMenuGpo.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMenuGpo.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWMenuGpo.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


end.
