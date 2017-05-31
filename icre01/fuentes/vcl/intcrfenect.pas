// Sistema         : Clase de CR_FE_NET_CTO
// Fecha de Inicio : 07/09/2010
// Función forma   : Clase de CR_FE_NET_CTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntCrFeNeCt;
                                                         
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,
IntPers,        //PERSONA
IntCtto,        //Contrato
IntCtoPanel;

Type
 TCrFeNeCt= class; 

  TWCrFeNetCto=Class(TForm)
    InterForma1             : TInterForma;
    lbID_ACREDITADO: TLabel;
    edID_TITULAR: TEdit;
    btACREDITADO: TBitBtn;
    ilPERSONA: TInterLinkit;
    edDESC_ACREDITADO: TEdit;
    Label1: TLabel;
    edID_CONTRATO: TInterEdit;
    btCONTRATO: TBitBtn;
    edDESC_PRODUCTO: TEdit;
    ilIDCONTRATO: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCONTRATOClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilIDCONTRATOEjecuta(Sender: TObject);
    procedure ilPERSONAEjecuta(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrFeNeCt;
end; 
 TCrFeNeCt= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_CONTRATO              : TInterCampo;
        ID_TITULAR               : TInterCampo;

        Persona                  : TPersona;
        Contrato                 : TContrato;

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


constructor TCrFeNeCt.Create( AOwner : TComponent );
begin Inherited;
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Número de Contrato';
      ID_TITULAR :=CreaCampo('ID_TITULAR',ftFloat,tsNinguno,tsNinguno,True);
                ID_TITULAR.Caption:='Número de Titular';

      Persona := TPersona.Create(Self);
      Persona.MasterSource:=Self;
      Persona.FieldByName('ID_PERSONA').MasterField:='ID_TITULAR';

      Contrato := TContrato.Create(Self);
      Contrato.MasterSource:=Self;
      Contrato.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';

      FKeyFields.Add('ID_CONTRATO');
      FKeyFields.Add('ID_TITULAR');

      TableName := 'CR_FE_NET_CTO';
      UseQuery := True;
      HelpFile := 'IntCrFeNeCt.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrFeNeCt.Destroy;
begin
     if Persona <> nil then
        Persona.free;
     //end if;
     if Contrato <> nil then
        Contrato.free;
     //end if;
     inherited;
end;


function TCrFeNeCt.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrFeNetCto;
begin
   W:=TWCrFeNetCto.Create(Self);
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


Function TCrFeNeCt.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrFeNC.it','F,F');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

function TCrFeNeCt.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_FE_NET_CTO********************)
(*                                                                              *)
(*  FORMA DE CR_FE_NET_CTO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FE_NET_CTO********************)

procedure TWCrFeNetCto.FormShow(Sender: TObject);
begin
     Objeto.ID_CONTRATO.Control:=edID_CONTRATO;
     Objeto.ID_TITULAR.Control:=edID_TITULAR;

     Objeto.Persona.Nombre.Control := edDESC_ACREDITADO;
     Objeto.Persona.GetParams(Objeto);

     Objeto.Contrato.Titular.Nombre.Control :=   edDESC_PRODUCTO;
     Objeto.Contrato.GetParams(Objeto);

end;

procedure TWCrFeNetCto.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CONTRATO.Control:=nil;
      Objeto.ID_TITULAR.Control:=nil;

      Objeto.Persona.Nombre.Control := nil;

      Objeto.Contrato.Titular.Nombre.Control :=   nil;

end;

procedure TWCrFeNetCto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrFeNetCto.InterForma1DespuesNuevo(Sender: TObject);
begin
     edID_CONTRATO.SetFocus;
end;

procedure TWCrFeNetCto.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrFeNetCto.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrFeNetCto.btCONTRATOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRFENECT_CTONET',True,True) then
   begin
       //BUSCADOR DE LA CLASE CONTRATO CREDITO
       Objeto.Contrato.ShowAll := True;
       if Objeto.Contrato.Busca then
       begin
          InterForma1.NextTab(btCONTRATO);
       end;
   end;
end;

procedure TWCrFeNetCto.btACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRFENECT_EMIPRV',True,True) then
   begin
       Objeto.Persona.ShowAll := True;
       if Objeto.Persona.Busca then
       begin
            InterForma1.NextTab(edID_TITULAR);
       end;
   end;
end;

procedure TWCrFeNetCto.ilIDCONTRATOEjecuta(Sender: TObject);
begin
   if Objeto.Contrato.FindKey([ilIDCONTRATO.Buffer,'1']) then
   begin
      InterForma1.NextTab(edID_CONTRATO);
   end;

end;

procedure TWCrFeNetCto.ilPERSONAEjecuta(Sender: TObject);
begin
 With Objeto Do
   Begin
   If Persona.FindKey([ilPersona.Buffer]) Then
   Begin
        InterForma1.NextTab(edID_TITULAR);
   End;
   End;
end;

end.
