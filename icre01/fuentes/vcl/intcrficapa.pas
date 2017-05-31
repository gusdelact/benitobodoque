// Sistema         : Clase de CR_FIRA_CAUS_PAG
// Fecha de Inicio : 25/06/2004
// Función forma   : Clase de CR_FIRA_CAUS_PAG
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrFiCaPa;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntParamCre;

Type
 TCrFiCaPa= class; 

  TWCrFiraCausPag=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_CAUS_PAG : TLabel; 
    edCVE_CAUS_PAG : TEdit;
    lbDESC_CAUS_PAG : TLabel; 
    edDESC_CAUS_PAG : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    MsgPanel: TPanel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_CAUS_PAGExit(Sender: TObject);
    procedure edDESC_CAUS_PAGExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrFiCaPa;
end; 
 TCrFiCaPa= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre      : TParamCre;

        CVE_CAUS_PAG             : TInterCampo;
        DESC_CAUS_PAG            : TInterCampo;
        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrFiCaPa.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_CAUS_PAG :=CreaCampo('CVE_CAUS_PAG',ftString,tsNinguno,tsNinguno,True);
                CVE_CAUS_PAG.Caption:='Clave de Caus Pag';
      DESC_CAUS_PAG :=CreaCampo('DESC_CAUS_PAG',ftString,tsNinguno,tsNinguno,True);
                DESC_CAUS_PAG.Caption:='Descripción Caus Pag';
      FKeyFields.Add('CVE_CAUS_PAG');

      TableName := 'CR_FIRA_CAUS_PAG'; 
      UseQuery := True; 
      HelpFile := 'IntCrFiCaPa.Hlp';
end;

Destructor TCrFiCaPa.Destroy;
begin inherited;
end;


function TCrFiCaPa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrFiraCausPag;
begin
   W:=TWCrFiraCausPag.Create(Self);
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


Function TCrFiCaPa.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrFiCP.it','S');
      Try if Active then begin T.Param(0,CVE_CAUS_PAG.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_FIRA_CAUS_PAG********************)
(*                                                                              *)
(*  FORMA DE CR_FIRA_CAUS_PAG                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FIRA_CAUS_PAG********************)

procedure TWCrFiraCausPag.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  CVE_CAUS_PAG.Control := edCVE_CAUS_PAG;
  DESC_CAUS_PAG.Control := edDESC_CAUS_PAG;

  Interforma1.MsgPanel := MsgPanel;
  End;
end;

procedure TWCrFiraCausPag.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  CVE_CAUS_PAG.Control:=nil;
  DESC_CAUS_PAG.Control:=nil;
  End;
end;

procedure TWCrFiraCausPag.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrFiraCausPag.InterForma1DespuesNuevo(Sender: TObject);
begin If edCVE_CAUS_PAG.CanFocus Then edCVE_CAUS_PAG.SetFocus;
end;

procedure TWCrFiraCausPag.InterForma1DespuesModificar(Sender: TObject);
begin If edDESC_CAUS_PAG.CanFocus Then edDESC_CAUS_PAG.SetFocus;
end;

procedure TWCrFiraCausPag.edCVE_CAUS_PAGExit(Sender: TObject);
var vlbCanExit : Boolean;
    vlStrMsg : String;
begin
 vlbCanExit := True;
 If (Trim(edCVE_CAUS_PAG.Text) = '') Then
  Begin
  vlbCanExit := False;
  vlStrMsg := 'Favor de indicar la "Clave Causa de Pago".' ;
  End
 Else
   InterForma1.NextTab(edCVE_CAUS_PAG);
 InterForma1.ValidaExit(edCVE_CAUS_PAG, vlbCanExit, vlStrMSg, True);
end;

procedure TWCrFiraCausPag.edDESC_CAUS_PAGExit(Sender: TObject);
var vlbCanExit : Boolean;
    vlStrMsg : String;
begin
 vlbCanExit := True;
 If (Trim(edDESC_CAUS_PAG.Text) = '') Then
  Begin
  vlbCanExit := False;
  vlStrMsg := 'Favor de indicar la "Descripción Causa de Pago".' ;
  End;
 InterForma1.ValidaExit(edDESC_CAUS_PAG, vlbCanExit, vlStrMSg, True);
end;

procedure TWCrFiraCausPag.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
 var vlstrMessage : String;  
begin
 If IsNewData then vlstrMessage := '¿Desea almacenar los datos capturados?'
 Else vlstrMessage := '¿Desea guardar los datos modificados?';
 Realizado := MessageDlg(vlstrMessage, mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

end.
