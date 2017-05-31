{*******************************************************************************
 * Sistema         : Clase de PER_PARENTESCO
 * Fecha de Inicio : 06/02/2013
 * Función forma   : Catalogo de Parentesco
 * Desarrollo por  : Abel Alejandro Salazar Carrillo
 * Comentarios     : Version 1.0
 ******************************************************************************}
Unit IntPerParent;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TPerParent= class; 

  TWPerParentesco=Class(TForm)
    InterForma1             : TInterForma;
     
    lbCVE_PARENTESCO  : TLabel;
    edCVE_PARENTESCO  : TEdit;
    lbDESC_PARENTESCO : TLabel;
    edDESC_PARENTESCO : TEdit;
    chbUnico: TCheckBox;

    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TPerParent;
end; 
 TPerParent= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_PARENTESCO           : TInterCampo;
        DESC_PARENTESCO          : TInterCampo;
        B_UNICO                  : TInterCampo;

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


constructor TPerParent.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_PARENTESCO            := CreaCampo('CVE_PARENTESCO',ftString,tsNinguno,tsNinguno,True);
      DESC_PARENTESCO           := CreaCampo('DESC_PARENTESCO',ftString,tsNinguno,tsNinguno,True);
      B_UNICO                   := CreaCampo('B_UNICO', ftString, tsModifica+tsNuevo, tsConsulta,True);

      FKeyFields.Add('CVE_PARENTESCO');

      TableName := 'PER_PARENTESCO'; 
      UseQuery := True; 
      HelpFile := 'IntPerParent.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TPerParent.Destroy;
begin inherited;
end;


function TPerParent.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWPerParentesco;
begin
   W:=TWPerParentesco.Create(Self);
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
 //chbUnico
end;


Function TPerParent.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IPerPare.it','S');
      Try if Active then begin T.Param(0,CVE_PARENTESCO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end; 
end;

function TPerParent.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA PER_PARENTESCO********************)
(*                                                                              *)
(*  FORMA DE PER_PARENTESCO                                                            *)
(*                                                                              *)
(***********************************************FORMA PER_PARENTESCO********************)

procedure TWPerParentesco.FormShow(Sender: TObject);
begin
      Objeto.CVE_PARENTESCO.Control  := edCVE_PARENTESCO;
      Objeto.DESC_PARENTESCO.Control := edDESC_PARENTESCO;
      Objeto.B_UNICO.Control         := chbUnico;
end;

procedure TWPerParentesco.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_PARENTESCO.Control  := nil;
      Objeto.DESC_PARENTESCO.Control := nil;
      Objeto.B_UNICO.Control         := nil;
   //Objeto
end;

procedure TWPerParentesco.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWPerParentesco.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWPerParentesco.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWPerParentesco.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  if IsNewData then
  begin
        if trim(edCVE_PARENTESCO.Text) = '' then
        Begin
           edCVE_PARENTESCO.SetFocus;
           Raise EInterFrame.Create('Revise que la Clave del Parentesco hayan sido capturada.');
        end;
        if trim(edDESC_PARENTESCO.Text) = '' then
        Begin
           edDESC_PARENTESCO.SetFocus;
           Raise EInterFrame.Create('Revise que la Descripcion del Parentesco hayan sido capturada.');
        end;
  end;
end;

end.
