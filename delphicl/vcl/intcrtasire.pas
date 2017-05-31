// Sistema         : Clase de CR_TASA_SITI_REF
// Fecha de Inicio : 06/06/2006
// Función forma   : Clase de CR_TASA_SITI_REF
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Laura Gabriela Quevedo Torres
// Comentarios     :
Unit IntCrTaSiRe;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCrTaSiRe= class; 

  TWCrTasaSitiRef=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_TASA_SITI : TLabel; 
    edCVE_TASA_SITI : TEdit;
    lbDESC_TASA_SITI : TLabel; 
    edDESC_TASA_SITI : TEdit;
    lbID_TASA_REF_SITI: TLabel;
    edID_TASA_REF_SITI: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);  
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrTaSiRe;
end; 
 TCrTaSiRe= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_TASA_SITI            : TInterCampo;
        ID_TASA_REF_SITI         : TInterCampo;        
        DESC_TASA_SITI           : TInterCampo;
        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrTaSiRe.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_TASA_SITI :=CreaCampo('CVE_TASA_SITI',ftString,tsNinguno,tsNinguno,True);
                CVE_TASA_SITI.Caption:='Clave de Tasa Siti';
      DESC_TASA_SITI :=CreaCampo('DESC_TASA_SITI',ftString,tsNinguno,tsNinguno,True);
                DESC_TASA_SITI.Caption:='Descripción Tasa Siti';

      // Inicia modificaciones SATV4766 07Mzo2007
      ID_TASA_REF_SITI := CreaCampo('ID_TASA_REF_SITI',ftFloat,tsNinguno,tsNinguno,True);
                ID_TASA_REF_SITI.Caption:='Id Tasa Siti';
      // Termina modificaciones SATV4766

      FKeyFields.Add('CVE_TASA_SITI');

      TableName := 'CR_TASA_SITI_REF'; 
      UseQuery := True; 
      HelpFile := 'IntCrTaSiRe.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrTaSiRe.Destroy;
begin inherited;
end;

function TCrTaSiRe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTasaSitiRef;
begin
   W:=TWCrTasaSitiRef.Create(Self);
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


Function TCrTaSiRe.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrTaSR.it','S');
      Try if Active then begin T.Param(0,CVE_TASA_SITI.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_TASA_SITI_REF********************)
(*                                                                              *)
(*  FORMA DE CR_TASA_SITI_REF                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_TASA_SITI_REF********************)

procedure TWCrTasaSitiRef.FormShow(Sender: TObject);
begin
      Objeto.CVE_TASA_SITI.Control:=edCVE_TASA_SITI;
      Objeto.DESC_TASA_SITI.Control:=edDESC_TASA_SITI;
      Objeto.ID_TASA_REF_SITI.Control:=edID_TASA_REF_SITI;  // SATV4766 07Mzo2007
end;

procedure TWCrTasaSitiRef.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_TASA_SITI.Control:=nil;
      Objeto.DESC_TASA_SITI.Control:=nil;
      Objeto.ID_TASA_REF_SITI.Control:=nil;  // SATV4766 07Mzo2007
end;

procedure TWCrTasaSitiRef.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrTasaSitiRef.InterForma1DespuesNuevo(Sender: TObject);
begin If (edCVE_TASA_SITI.CanFocus) Then edCVE_TASA_SITI.SetFocus;
end;

procedure TWCrTasaSitiRef.InterForma1DespuesModificar(Sender: TObject);
begin If (edID_TASA_REF_SITI.CanFocus) Then edID_TASA_REF_SITI.SetFocus;
end;

end.
