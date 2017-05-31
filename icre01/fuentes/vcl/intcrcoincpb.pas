// Sistema         : Clase de CR_COINC_PB
// Fecha de Inicio : 27/06/2006
// Función forma   : Clase de CR_COINC_PB
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Arturo Salcedo Caballero
// Comentarios     :
Unit IntCrCoincPb;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntMPers,IntGcto,
IntParamCre;


Type
 TCrCoincPb= class;

  TWCrCoincPb=Class(TForm)
    InterForma1             : TInterForma;
    lbID_PROMOTOR_ASOC : TLabel; 
    edID_PROMOTOR_ASOC : TEdit;
    lbID_PROMOTOR_ADMIN : TLabel; 
    edID_PROMOTOR_ADMIN : TEdit;
    lbID_PROMOTOR_BONO : TLabel; 
    edID_PROMOTOR_BONO : TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    edNomPromAsoc: TEdit;
    edNomPomAdmin: TEdit;
    edNomPromBono: TEdit;
    InterLinkit1: TInterLinkit;
    InterLinkit2: TInterLinkit;
    InterLinkit3: TInterLinkit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure InterLinkit1Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit2Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit3Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    procedure InterLinkit2Ejecuta(Sender: TObject);
    procedure InterLinkit3Ejecuta(Sender: TObject);
    procedure edID_PROMOTOR_BONOChange(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrCoincPb;
end;
 TCrCoincPb= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre                 : TParamCre;

        ID_PROMOTOR_ASOC         : TInterCampo;
        ID_PROMOTOR_ADMIN        : TInterCampo;
        ID_PROMOTOR_BONO         : TInterCampo;
        PromAsoc                 : TGpoCto;
        PromAdmin                : TMPersona;
        PromBono                 : TGpoCto;
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


constructor TCrCoincPb.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_PROMOTOR_ASOC :=CreaCampo('ID_PROMOTOR_ASOC',ftFloat,tsNinguno,tsNinguno,True);
                ID_PROMOTOR_ASOC.Caption:='Número de Promotor Asoc';
      ID_PROMOTOR_ADMIN :=CreaCampo('ID_PROMOTOR_ADMIN',ftFloat,tsNinguno,tsNinguno,True);
                ID_PROMOTOR_ADMIN.Caption:='Número de Promotor Admin';
      ID_PROMOTOR_BONO :=CreaCampo('ID_PROMOTOR_BONO',ftFloat,tsNinguno,tsNinguno,True);
                ID_PROMOTOR_BONO.Caption:='Número de Promotor Bono';
      FKeyFields.Add('ID_PROMOTOR_ASOC');
      FKeyFields.Add('ID_PROMOTOR_ADMIN');

      TableName := 'CR_COINCRE_PRO_BONO';
      UseQuery := True;
      HelpFile := 'IntCrCoincPb.Hlp';
      ShowMenuReporte:=True;

      PromAsoc := TGpoCto.Create(Self);
      PromAsoc.MasterSource:=Self;
      PromAsoc.FieldByName('ID_PERS_ASOCIAD').MasterField:= 'ID_PROMOTOR_ASOC';

      PromAdmin:=TMPersona.Create(SELF);
      PromAdmin.MasterSource:=Self;
      PromAdmin.ID_Persona.MasterField:='ID_PROMOTOR_ADMIN';
      PromAdmin.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      PromBono := TGpoCto.Create(Self);
      PromBono.MasterSource:=Self;
      PromBono.FieldByName('ID_PERS_ASOCIAD').MasterField:= 'ID_PROMOTOR_BONO';

end;

Destructor TCrCoincPb.Destroy;
begin inherited;
end;


function TCrCoincPb.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCoincPb;
begin
   W:=TWCrCoincPb.Create(Self);
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


Function TCrCoincPb.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCoiPb.it','F,F');
      Try if Active then begin T.Param(0,ID_PROMOTOR_ASOC.AsString); 
                               T.Param(1,ID_PROMOTOR_ADMIN.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

function TCrCoincPb.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_COINC_PB********************)
(*                                                                              *)
(*  FORMA DE CR_COINC_PB                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_COINC_PB********************)

procedure TWCrCoincPb.FormShow(Sender: TObject);
begin

      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
      
      Objeto.ID_PROMOTOR_ASOC.Control                 := edID_PROMOTOR_ASOC;
      Objeto.ID_PROMOTOR_ADMIN.Control                := edID_PROMOTOR_ADMIN;
      Objeto.ID_PROMOTOR_BONO.Control                 := edID_PROMOTOR_BONO;
      Objeto.PromAsoc.PromAsociado.ID_Persona.Control := edID_PROMOTOR_ASOC;
      Objeto.PromAsoc.PromAsociado.Nombre.Control     := edNomPromAsoc;
      Objeto.PromAdmin.ID_Persona.Control             := edID_PROMOTOR_ADMIN;
      Objeto.PromAdmin.Nombre.Control                 := edNomPomAdmin;
      Objeto.PromBono.PromAsociado.ID_Persona.Control := edID_PROMOTOR_BONO;
      Objeto.PromBono.PromAsociado.Nombre.Control     := edNomPromBono;
end;

procedure TWCrCoincPb.FormDestroy(Sender: TObject);
begin
      Objeto.ID_PROMOTOR_ASOC.Control                  := nil;
      Objeto.ID_PROMOTOR_ADMIN.Control                 := nil;
      Objeto.ID_PROMOTOR_BONO.Control                  := nil;
      Objeto.PromAsoc.PromAsociado.ID_Persona.Control  := nil;
      Objeto.PromAsoc.PromAsociado.Nombre.Control      := nil;
      Objeto.PromAdmin.ID_Persona.Control              := nil;
      Objeto.PromAdmin.Nombre.Control                  := nil;
      Objeto.PromBono.PromAsociado.ID_Persona.Control  := nil;
      Objeto.PromBono.PromAsociado.Nombre.Control      := nil;
   //Objeto
end;

procedure TWCrCoincPb.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCoincPb.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCoincPb.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCoincPb.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrCoincPb.SpeedButton1Click(Sender: TObject);
begin
 if  Objeto.PromAsoc.Busca then
  edID_PROMOTOR_BONO.Text:=Objeto.PromAsoc.PromAsociado.ID_Persona.AsString
 else
  edID_PROMOTOR_BONO.Clear;
end;

procedure TWCrCoincPb.SpeedButton2Click(Sender: TObject);
begin
  Objeto.PromAdmin.FilterBy:=4;
  Objeto.PromAdmin.Busca;
end;

procedure TWCrCoincPb.SpeedButton3Click(Sender: TObject);
begin
  Objeto.PromBono.Busca;
end;

procedure TWCrCoincPb.InterLinkit1Capture(Sender: TObject;
  var Show: Boolean);
begin
  Show:=True;
end;

procedure TWCrCoincPb.InterLinkit2Capture(Sender: TObject;
  var Show: Boolean);
begin
  Show:=True;
end;

procedure TWCrCoincPb.InterLinkit3Capture(Sender: TObject;
  var Show: Boolean);
begin
  Show:=True;
end;

procedure TWCrCoincPb.InterLinkit1Ejecuta(Sender: TObject);
begin
 if Objeto.PromAsoc.FindKeyNear([InterLinkit1.Buffer],['ID_PERS_ASOCIAD']) then
  edID_PROMOTOR_BONO.Text:=Objeto.PromAsoc.PromAsociado.ID_Persona.AsString
 else
  edID_PROMOTOR_BONO.Clear;
end;

procedure TWCrCoincPb.InterLinkit2Ejecuta(Sender: TObject);
begin
  Objeto.PromAdmin.FindKey([InterLinkit2.Buffer]);
end;

procedure TWCrCoincPb.InterLinkit3Ejecuta(Sender: TObject);
begin
  Objeto.PromBono.FindKeyNear([InterLinkit3.Buffer],['ID_PERS_ASOCIAD']);
end;

procedure TWCrCoincPb.edID_PROMOTOR_BONOChange(Sender: TObject);
begin
  Objeto.PromBono.FindKeyNear([edID_PROMOTOR_BONO.text],['ID_PERS_ASOCIAD']);
end;

end.
