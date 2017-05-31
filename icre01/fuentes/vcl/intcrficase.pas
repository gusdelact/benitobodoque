// Sistema         : Clase de CR_FIRA_CAUS_SEG
// Fecha de Inicio : 25/06/2004
// Función forma   : Clase de CR_FIRA_CAUS_SEG
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrFiCaSe;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntParamCre;

Type
 TCrFiCaSe= class; 

  TWCrFiraCausSeg=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_SEGURO : TLabel;
    edCVE_SEGURO : TEdit;
    lbDESC_SEGURO : TLabel;
    edDESC_SEGURO : TEdit;
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
    procedure edCVE_SEGUROExit(Sender: TObject);
    procedure edDESC_SEGUROExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrFiCaSe;
end; 
 TCrFiCaSe= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        CVE_SEGURO               : TInterCampo;
        DESC_SEGURO              : TInterCampo;
        ParamCre                 : TParamCre;
        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrFiCaSe.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_SEGURO :=CreaCampo('CVE_SEGURO',ftString,tsNinguno,tsNinguno,True);
                CVE_SEGURO.Caption:='Clave de Seguro';
      DESC_SEGURO :=CreaCampo('DESC_SEGURO',ftString,tsNinguno,tsNinguno,True);
                DESC_SEGURO.Caption:='Descripción Seguro';
      FKeyFields.Add('CVE_SEGURO');

      TableName := 'CR_FIRA_CAUS_SEG'; 
      UseQuery := True; 
      HelpFile := 'IntCrFiCaSe.Hlp';
end;

Destructor TCrFiCaSe.Destroy;
begin inherited;
end;


function TCrFiCaSe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrFiraCausSeg;
begin
   W:=TWCrFiraCausSeg.Create(Self);
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


Function TCrFiCaSe.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrFiCS.it','S');
      Try if Active then begin T.Param(0,CVE_SEGURO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_FIRA_CAUS_SEG********************)
(*                                                                              *)
(*  FORMA DE CR_FIRA_CAUS_SEG                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FIRA_CAUS_SEG********************)

procedure TWCrFiraCausSeg.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  CVE_SEGURO.Control:=edCVE_SEGURO;
  DESC_SEGURO.Control:=edDESC_SEGURO;

  Interforma1.MsgPanel := MsgPanel;
  End;
end;

procedure TWCrFiraCausSeg.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_SEGURO.Control:=nil;
      Objeto.DESC_SEGURO.Control:=nil;
   //Objeto
end;

procedure TWCrFiraCausSeg.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrFiraCausSeg.InterForma1DespuesNuevo(Sender: TObject);
begin If edCVE_SEGURO.CanFocus Then edCVE_SEGURO.SetFocus;
end;

procedure TWCrFiraCausSeg.InterForma1DespuesModificar(Sender: TObject);
begin If edDESC_SEGURO.CanFocus Then edDESC_SEGURO.SetFocus;
end;

procedure TWCrFiraCausSeg.edCVE_SEGUROExit(Sender: TObject);
var vlbCanExit : Boolean;
    vlStrMsg : String;
begin
 vlbCanExit := True;
 If (Trim(edCVE_SEGURO.Text) = '') Then
  Begin
  vlbCanExit := False;
  vlStrMsg := 'Favor de indicar la "Clave de Seguro".' ;
  End
 Else
   InterForma1.NextTab(edCVE_SEGURO);
 InterForma1.ValidaExit(edCVE_SEGURO, vlbCanExit, vlStrMSg, True);
end;

procedure TWCrFiraCausSeg.edDESC_SEGUROExit(Sender: TObject);
var vlbCanExit : Boolean;
    vlStrMsg : String;
begin
 vlbCanExit := True;
 If (Trim(edDESC_SEGURO.Text) = '') Then
  Begin
  vlbCanExit := False;
  vlStrMsg := 'Favor de indicar la "Descripción de Seguro".' ;
  End;
 InterForma1.ValidaExit(edDESC_SEGURO, vlbCanExit, vlStrMSg, True);
end;

procedure TWCrFiraCausSeg.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlstrMessage : String;
begin
 If IsNewData then vlstrMessage := '¿Desea almacenar los datos capturados?'
 Else vlstrMessage := '¿Desea guardar los datos modificados?';
 Realizado := MessageDlg(vlstrMessage, mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

end.
