// Sistema         : Clase de CR_EMAIL
// Fecha de Inicio : 21/08/2003
// Función forma   : Clase de CR_EMAIL
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrEmail;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre;

Type
 TCrEmail= class; 

  TWCrEmail=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_TIPO_EMAIL : TLabel; 
    edID_TIPO_EMAIL : TEdit;
    lbTITULO_EMAIL : TLabel; 
    edTITULO_EMAIL : TEdit;
    lbDESC_EMAIL : TLabel;
    lbCUERPO_EMAIL : TLabel;
    memCUERPO_EMAIL: TMemo;
    memDESC_EMAIL: TMemo;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label1: TLabel;
    Memo1: TMemo;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrEmail;
end;
 TCrEmail= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre : TParamCre;

        ID_TIPO_EMAIL            : TInterCampo;
        TITULO_EMAIL             : TInterCampo;
        DESC_EMAIL               : TInterCampo;
        CUERPO_EMAIL             : TInterCampo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation

{$R *.DFM}
constructor TCrEmail.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_TIPO_EMAIL :=CreaCampo('ID_TIPO_EMAIL',ftString,tsNinguno,tsNinguno,True);
                ID_TIPO_EMAIL.Caption:='Número de Tipo Email';
      TITULO_EMAIL :=CreaCampo('TITULO_EMAIL',ftString,tsNinguno,tsNinguno,True);
                TITULO_EMAIL.Caption:='Titulo Email';
      DESC_EMAIL :=CreaCampo('DESC_EMAIL',ftString,tsNinguno,tsNinguno,True);
                DESC_EMAIL.Caption:='Descripción Email';
      CUERPO_EMAIL :=CreaCampo('CUERPO_EMAIL',ftString,tsNinguno,tsNinguno,True);
                CUERPO_EMAIL.Caption:='Cuerpo Email';
      FKeyFields.Add('ID_TIPO_EMAIL');
      FKeyFields.Add('TITULO_EMAIL');

      TableName := 'CR_EMAIL';
      UseQuery := True; 
      HelpFile := 'IntCrEmail.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrEmail.Destroy;
begin inherited;
end;


function TCrEmail.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrEmail;
begin
   W:=TWCrEmail.Create(Self);
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


Function TCrEmail.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrEmail.it','S,S');
      Try if Active then begin T.Param(0,ID_TIPO_EMAIL.AsString);
                               T.Param(1,TITULO_EMAIL.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;


(***********************************************FORMA CR_EMAIL********************)
(*                                                                              *)
(*  FORMA DE CR_EMAIL                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_EMAIL********************)

procedure TWCrEmail.FormShow(Sender: TObject);
begin
     With Objeto Do
      Begin
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      ID_TIPO_EMAIL.Control  := edID_TIPO_EMAIL;
      TITULO_EMAIL.Control   := edTITULO_EMAIL;
      DESC_EMAIL.Control     := memDESC_EMAIL;
      CUERPO_EMAIL.Control   := memCUERPO_EMAIL;
      End;
end;

procedure TWCrEmail.FormDestroy(Sender: TObject);
begin
     With Objeto Do
      Begin
      ID_TIPO_EMAIL.Control  := Nil;
      TITULO_EMAIL.Control   := Nil;
      DESC_EMAIL.Control     := Nil;
      CUERPO_EMAIL.Control   := Nil;
      End;   //Objeto
end;

procedure TWCrEmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrEmail.InterForma1DespuesNuevo(Sender: TObject);
begin If edID_TIPO_EMAIL.CanFocus Then edID_TIPO_EMAIL.SetFocus;
end;

procedure TWCrEmail.InterForma1DespuesModificar(Sender: TObject);
begin If edTITULO_EMAIL.CanFocus Then edTITULO_EMAIL.SetFocus;
end;

end.
