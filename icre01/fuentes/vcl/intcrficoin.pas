// Sistema         : Clase de CR_FIRA_CON_INV
// Fecha de Inicio : 25/06/2004
// Función forma   : Clase de CR_FIRA_CON_INV
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrFiCoIn;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntParamCre;

Type
 TCrFiCoIn= class; 

  TWCrFiraConInv=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_CONT_INV : TLabel; 
    edCVE_CONT_INV : TEdit;
    lbDESC_CON_INV : TLabel; 
    edDESC_CON_INV : TEdit;
    MsgPanel: TPanel;
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
    procedure edCVE_CONT_INVExit(Sender: TObject);
    procedure edDESC_CON_INVExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations }
    public 
    { Public declarations } 
    Objeto : TCrFiCoIn;
end; 
 TCrFiCoIn= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_CONT_INV             : TInterCampo;
        DESC_CON_INV             : TInterCampo;
        ParamCre                 : TParamCre;
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


constructor TCrFiCoIn.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_CONT_INV :=CreaCampo('CVE_CONT_INV',ftString,tsNinguno,tsNinguno,True);
                CVE_CONT_INV.Caption:='Clave de Cont Inv';
      DESC_CON_INV :=CreaCampo('DESC_CON_INV',ftString,tsNinguno,tsNinguno,True);
                DESC_CON_INV.Caption:='Descripción Con Inv';
      FKeyFields.Add('CVE_CONT_INV');

      TableName := 'CR_FIRA_CON_INV'; 
      UseQuery := True; 
      HelpFile := 'IntCrFiCoIn.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrFiCoIn.Destroy;
begin inherited;
end;


function TCrFiCoIn.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrFiraConInv;
begin
   W:=TWCrFiraConInv.Create(Self);
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


Function TCrFiCoIn.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrFiCI.it','S');
      Try if Active then begin T.Param(0,CVE_CONT_INV.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrFiCoIn.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_FIRA_CON_INV********************)
(*                                                                              *)
(*  FORMA DE CR_FIRA_CON_INV                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FIRA_CON_INV********************)

procedure TWCrFiraConInv.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  CVE_CONT_INV.Control:=edCVE_CONT_INV;
  DESC_CON_INV.Control:=edDESC_CON_INV;

  Interforma1.MsgPanel := MsgPanel;
  End;
end;

procedure TWCrFiraConInv.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  CVE_CONT_INV.Control:=nil;
  DESC_CON_INV.Control:=nil;
  End;
end;

procedure TWCrFiraConInv.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrFiraConInv.InterForma1DespuesNuevo(Sender: TObject);
begin If edCVE_CONT_INV.CanFocus Then edCVE_CONT_INV.SetFocus;
end;

procedure TWCrFiraConInv.InterForma1DespuesModificar(Sender: TObject);
begin If edDESC_CON_INV.CanFocus Then edDESC_CON_INV.SetFocus;
end;

procedure TWCrFiraConInv.edCVE_CONT_INVExit(Sender: TObject);
var vlbCanExit : Boolean;
    vlStrMsg : String;
begin
 vlbCanExit := True;
 If (Trim(edCVE_CONT_INV.Text) = '') Then
  Begin
  vlbCanExit := False;
  vlStrMsg := 'Favor de indicar la "Clave Concepto de Inversión".' ;
  End
 Else
   InterForma1.NextTab(edCVE_CONT_INV);
 InterForma1.ValidaExit(edCVE_CONT_INV, vlbCanExit, vlStrMSg, True);
end;

procedure TWCrFiraConInv.edDESC_CON_INVExit(Sender: TObject);
var vlbCanExit : Boolean;
    vlStrMsg : String;
begin
 vlbCanExit := True;
 If (Trim(edDESC_CON_INV.Text) = '') Then
  Begin
  vlbCanExit := False;
  vlStrMsg := 'Favor de indicar la "Descripción Concepto de Inversión".' ;
  End;
 InterForma1.ValidaExit(edDESC_CON_INV, vlbCanExit, vlStrMSg, True);
end;

procedure TWCrFiraConInv.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlstrMessage : String;
begin
 If IsNewData then vlstrMessage := '¿Desea almacenar los datos capturados?'
 Else vlstrMessage := '¿Desea guardar los datos modificados?';
 Realizado := MessageDlg(vlstrMessage, mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

end.
