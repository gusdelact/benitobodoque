// Sistema         : Clase de PC_TIPO_PERFIL
// Fecha de Inicio : 24/06/2014
// Función forma   : Clase de PC_TIPO_PERFIL
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Zyvozovqzmwilhzozazixziirool
// Comentarios     :
Unit IntPcTPerfil;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TPcTPerfil= class; 

  TWPcTPerfil=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_TIPO_PERFIL : TLabel; 
    edID_TIPO_PERFIL : TEdit;
    lbDESC_TIPO_PERFIL : TLabel; 
    edDESC_TIPO_PERFIL : TEdit;
    lbOBJETIVO_TIPO_PERFIL : TLabel; 
    edOBJETIVO_TIPO_PERFIL : TEdit;
    lbNIVEL_PERFIL : TLabel; 
    edNIVEL_PERFIL : TEdit;
    lbB_PERCLI_REAL : TLabel; 
    chB_PERCLI_REAL : TCheckBox;
    lbDESCR_CORTA : TLabel; 
    edDESCR_CORTA : TEdit;
    lbCOMENTARIOS : TLabel; 
    edCOMENTARIOS : TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TPcTPerfil;
end; 
 TPcTPerfil= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_TIPO_PERFIL           : TInterCampo;
        DESC_TIPO_PERFIL         : TInterCampo;
        OBJETIVO_TIPO_PERFIL     : TInterCampo;
        NIVEL_PERFIL             : TInterCampo;
        B_PERCLI_REAL            : TInterCampo;
        DESCR_CORTA              : TInterCampo;
        COMENTARIOS              : TInterCampo;
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


constructor TPcTPerfil.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_TIPO_PERFIL :=CreaCampo('ID_TIPO_PERFIL',ftFloat,tsNinguno,tsNinguno,True);
                ID_TIPO_PERFIL.Caption:='Número de Tipo Perfil';
      DESC_TIPO_PERFIL :=CreaCampo('DESC_TIPO_PERFIL',ftString,tsNinguno,tsNinguno,True);
                DESC_TIPO_PERFIL.Caption:='Descripción Tipo Perfil';
      OBJETIVO_TIPO_PERFIL :=CreaCampo('OBJETIVO_TIPO_PERFIL',ftString,tsNinguno,tsNinguno,True);
                OBJETIVO_TIPO_PERFIL.Caption:='Objetivo Tipo Perfil';
      NIVEL_PERFIL :=CreaCampo('NIVEL_PERFIL',ftFloat,tsNinguno,tsNinguno,True);
                NIVEL_PERFIL.Caption:='Nivel Perfil';
      B_PERCLI_REAL :=CreaCampo('B_PERCLI_REAL',ftString,tsNinguno,tsNinguno,True);
                B_PERCLI_REAL.Caption:='Percli Real';
      DESCR_CORTA :=CreaCampo('DESCR_CORTA',ftString,tsNinguno,tsNinguno,True);
                DESCR_CORTA.Caption:='Descr Corta';
      COMENTARIOS :=CreaCampo('COMENTARIOS',ftString,tsNinguno,tsNinguno,True);
                COMENTARIOS.Caption:='Comentarios';
      FKeyFields.Add('ID_TIPO_PERFIL');

      TableName := 'PC_TIPO_PERFIL'; 
      UseQuery := True; 
      HelpFile := 'IntPcTPerfil.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TPcTPerfil.Destroy;
begin inherited;
end;


function TPcTPerfil.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWPcTPerfil;
begin
   W:=TWPcTPerfil.Create(Self);
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


Function TPcTPerfil.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ItMaxPerfil.it','I,S');
      Try if Active then begin T.Param(0,ID_TIPO_PERFIL.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TPcTPerfil.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA PC_TIPO_PERFIL********************)
(*                                                                              *)
(*  FORMA DE PC_TIPO_PERFIL                                                            *)
(*                                                                              *)
(***********************************************FORMA PC_TIPO_PERFIL********************)

procedure TWPcTPerfil.FormShow(Sender: TObject);
begin
      Objeto.ID_TIPO_PERFIL.Control:=edID_TIPO_PERFIL;
      Objeto.DESC_TIPO_PERFIL.Control:=edDESC_TIPO_PERFIL;
      Objeto.OBJETIVO_TIPO_PERFIL.Control:=edOBJETIVO_TIPO_PERFIL;
      Objeto.NIVEL_PERFIL.Control:=edNIVEL_PERFIL;
      Objeto.B_PERCLI_REAL.Control:=chB_PERCLI_REAL;
      Objeto.DESCR_CORTA.Control:=edDESCR_CORTA;
      Objeto.COMENTARIOS.Control:=edCOMENTARIOS;
end;

procedure TWPcTPerfil.FormDestroy(Sender: TObject);
begin
      Objeto.ID_TIPO_PERFIL.Control:=nil;
      Objeto.DESC_TIPO_PERFIL.Control:=nil;
      Objeto.OBJETIVO_TIPO_PERFIL.Control:=nil;
      Objeto.NIVEL_PERFIL.Control:=nil;
      Objeto.B_PERCLI_REAL.Control:=nil;
      Objeto.DESCR_CORTA.Control:=nil;
      Objeto.COMENTARIOS.Control:=nil;
   //Objeto
end;

procedure TWPcTPerfil.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWPcTPerfil.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWPcTPerfil.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWPcTPerfil.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


end.
