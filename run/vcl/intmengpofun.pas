// Sistema         : Clase de SECU_MENU_GPO_FUN
// Fecha de Inicio : 12/08/1998
// Función forma   : Clase de SECU_MENU_GPO_FUN
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Jose Alberto Ramirez Pacheco
// Comentarios     :
Unit IntMenGpoFun;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntMenuGpo, IntSecuFunci;

Type
 TMenuGpoFu= class;

  TwMenuGpoFu=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_APLICACION : TLabel;
    edCVE_APLICACION : TEdit;
    lbCVE_MENU : TLabel;
    edCVE_MENU : TEdit;
    lbID_GPO_MENU : TLabel;
    edID_GPO_MENU : TEdit;
    lbCVE_FUNCION : TLabel;
    edCVE_FUNCION : TEdit;
    lbB_BLOQUEADO : TLabel;
    chB_BLOQUEADO : TCheckBox;
    lbNUM_POSICION : TLabel;
    edNUM_POSICION : TEdit;
    edNomMenu: TEdit;
    edTxDescGpoMenu: TEdit;
    edNomFuncion: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TMenuGpoFu;
end;
 TMenuGpoFu= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_APLICACION           : TInterCampo;
        CVE_MENU                 : TInterCampo;
        ID_GPO_MENU              : TInterCampo;
        CVE_FUNCION              : TInterCampo;
        B_BLOQUEADO              : TInterCampo;
        NUM_POSICION             : TInterCampo;

        MenuGrupo: TMenuGpo;
        Funcion:   TSecuFunci;
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


constructor TMenuGpoFu.Create( AOwner : TComponent );
begin Inherited;
      CVE_APLICACION :=CreaCampo('CVE_APLICACION',ftString,tsNinguno,tsNinguno,True);
        CVE_APLICACION .Size:=6;
                CVE_APLICACION.Caption:='Clave de Aplicacion';
      CVE_MENU :=CreaCampo('CVE_MENU',ftString,tsNinguno,tsNinguno,True);
        CVE_MENU .Size:=8;
                CVE_MENU.Caption:='Clave de Menu';
      ID_GPO_MENU :=CreaCampo('ID_GPO_MENU',ftFloat,tsNinguno,tsNinguno,True);
                ID_GPO_MENU.Caption:='Número de Grupo Menu';
      CVE_FUNCION :=CreaCampo('CVE_FUNCION',ftString,tsNinguno,tsNinguno,True);
        CVE_FUNCION .Size:=16;
                CVE_FUNCION.Caption:='Clave de Funcion';
      B_BLOQUEADO :=CreaCampo('B_BLOQUEADO',ftString,tsNinguno,tsNinguno,True);
        B_BLOQUEADO .Size:=1;
                B_BLOQUEADO.Caption:='Bloqueado';
      NUM_POSICION :=CreaCampo('NUM_POSICION',ftFloat,tsNinguno,tsNinguno,True);
                NUM_POSICION.Caption:='Número Posicion';

      MenuGrupo:= TMenuGpo.Create(self);
      MenuGrupo.MasterSource := self;
      MenuGrupo.CVE_APLICACION.MasterField := 'CVE_APLICACION';
      MenuGrupo.CVE_MENU.MasterField := 'CVE_MENU';
      MenuGrupo.ID_GPO_MENU.MasterField := 'ID_GPO_MENU';

      Funcion:= TSecuFunci.Create(self);
      Funcion.MasterSource := self;
      Funcion.CVE_FUNCION.MasterField := 'CVE_FUNCION';


      FKeyFields.Add('CVE_APLICACION');
      FKeyFields.Add('CVE_MENU');
      FKeyFields.Add('ID_GPO_MENU');
      FKeyFields.Add('CVE_FUNCION');

      TableName := 'SECU_MENU_GPO_FUN';
      UseQuery := True;
      HelpFile := 'IntMenGpoFun.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMenuGpoFu.Destroy;
begin inherited;
end;


function TMenuGpoFu.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMenuGpoFu;
begin
   W:=TwMenuGpoFu.Create(Self);
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


Function TMenuGpoFu.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ISeMeGpF.it','S,S,F,S');
      Try if Active then begin T.Param(0,CVE_APLICACION.AsString);
                               T.Param(1,CVE_MENU.AsString);
                               T.Param(2,ID_GPO_MENU.AsString);
                               T.Param(3,CVE_FUNCION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
      finally  T.Free;
      end;
end;

function TMenuGpoFu.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA SECU_MENU_GPO_FUN********************)
(*                                                                              *)
(*  FORMA DE SECU_MENU_GPO_FUN                                                            *)
(*                                                                              *)
(***********************************************FORMA SECU_MENU_GPO_FUN********************)

procedure TwMenuGpoFu.FormShow(Sender: TObject);
begin
   Objeto.CVE_APLICACION.Control:=edCVE_APLICACION;
   Objeto.CVE_MENU.Control:=edCVE_MENU;
   Objeto.ID_GPO_MENU.Control:=edID_GPO_MENU;
   Objeto.CVE_FUNCION.Control:=edCVE_FUNCION;
   Objeto.B_BLOQUEADO.Control:=chB_BLOQUEADO;
   Objeto.NUM_POSICION.Control:=edNUM_POSICION;

   Objeto.MenuGrupo.Menu.NOM_MENU.Control := edNomMenu;
   Objeto.MenuGrupo.TX_DESC_GPO_MENU.Control := edTxDescGpoMenu;
   Objeto.Funcion.CVE_FUNCION.Control := edNomFuncion;
end;

procedure TwMenuGpoFu.FormDestroy(Sender: TObject);
begin
Objeto.CVE_APLICACION.Control:= nil;
   Objeto.CVE_MENU.Control:= nil;
   Objeto.ID_GPO_MENU.Control:= nil;
   Objeto.CVE_FUNCION.Control:= nil;
   Objeto.B_BLOQUEADO.Control:= nil;
   Objeto.NUM_POSICION.Control:= nil;

   Objeto.MenuGrupo.Menu.NOM_MENU.Control :=  nil;
   Objeto.MenuGrupo.TX_DESC_GPO_MENU.Control :=  nil;
   Objeto.Funcion.CVE_FUNCION.Control :=  nil;
end;

procedure TwMenuGpoFu.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMenuGpoFu.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMenuGpoFu.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TwMenuGpoFu.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;




end.
