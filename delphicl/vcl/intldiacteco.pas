// Sistema         : Clase de LDIN_ACTIV_ECON
// Fecha de Inicio : 29/11/2004
// Función forma   : Clase de LDIN_ACTIV_ECON
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntLdiActEco;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, UnConLavDin;

Type
 TLdiActEco= class; 

  TWLdinActivEcon=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_ACTIV_ECON : TLabel; 
    edCVE_ACTIV_ECON : TEdit;
    lbDESC_ACTIV_ECON : TLabel; 
    edDESC_ACTIV_ECON : TEdit;
    lbCVE_GPO_ECON : TLabel; 
    edCVE_GPO_ECON : TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TLdiActEco;
end; 
 TLdiActEco= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_ACTIV_ECON           : TInterCampo;
        DESC_ACTIV_ECON          : TInterCampo;
        CVE_GPO_ECON             : TInterCampo;
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


constructor TLdiActEco.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_ACTIV_ECON :=CreaCampo('CVE_ACTIV_ECON',ftString,tsNinguno,tsNinguno,True);
                CVE_ACTIV_ECON.Caption:='Clave de Activ Econ';
      DESC_ACTIV_ECON :=CreaCampo('DESC_ACTIV_ECON',ftString,tsNinguno,tsNinguno,True);
                DESC_ACTIV_ECON.Caption:='Descripción Activ Econ';
      CVE_GPO_ECON :=CreaCampo('CVE_GPO_ECON',ftString,tsNinguno,tsNinguno,True);
                CVE_GPO_ECON.Caption:='Clave de Grupo Econ';
      FKeyFields.Add('CVE_ACTIV_ECON');

      TableName := 'LDIN_ACTIV_ECON'; 
      UseQuery := True; 
      HelpFile := 'IntLdiActEco.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TLdiActEco.Destroy;
begin inherited;
end;


function TLdiActEco.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWLdinActivEcon;
begin
   W:=TWLdinActivEcon.Create(Self);
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


Function TLdiActEco.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ILdAcEc.it','S');
      Try if Active then begin T.Param(0,CVE_ACTIV_ECON.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TLdiActEco.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA LDIN_ACTIV_ECON********************)
(*                                                                              *)
(*  FORMA DE LDIN_ACTIV_ECON                                                            *)
(*                                                                              *)
(***********************************************FORMA LDIN_ACTIV_ECON********************)

procedure TWLdinActivEcon.FormShow(Sender: TObject);
begin
      Objeto.CVE_ACTIV_ECON.Control:=edCVE_ACTIV_ECON;
      Objeto.DESC_ACTIV_ECON.Control:=edDESC_ACTIV_ECON;
      Objeto.CVE_GPO_ECON.Control:=edCVE_GPO_ECON;
end;

procedure TWLdinActivEcon.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_ACTIV_ECON.Control:=nil;
      Objeto.DESC_ACTIV_ECON.Control:=nil;
      Objeto.CVE_GPO_ECON.Control:=nil;
   //Objeto
end;

procedure TWLdinActivEcon.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWLdinActivEcon.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWLdinActivEcon.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWLdinActivEcon.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWLdinActivEcon.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
Var   Observacion: String;
begin
   Observacion := 'Clave: ' + 'CVE ACTIV ECON: ' + Objeto.CVE_ACTIV_ECON.AsString;
   if (IsNewData) then
      GrabaBitacora(Objeto.Apli.Usuario,InterForma1.Funcion.Funcion,'A',Observacion,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName)
   else
      GrabaBitacora(Objeto.Apli.Usuario,InterForma1.Funcion.Funcion,'M',Observacion,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName);
end;

procedure TWLdinActivEcon.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
Var   Observacion: String;
begin
   Observacion := 'Clave: ' + 'CVE ACTIV ECON: ' + Objeto.CVE_ACTIV_ECON.AsString;
   GrabaBitacora(Objeto.Apli.Usuario,InterForma1.Funcion.Funcion,'B',Observacion,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName);
end;

end.
