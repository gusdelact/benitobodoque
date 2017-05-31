// Sistema         : Clase de CR_INF_ADIC_TASA
// Fecha de Inicio : 24/11/2004
// Función forma   : Clase de CR_INF_ADIC_TASA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrTxComen;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,
//UNIDADES ADICONALES
IntBasicCred, IntLinkit;

Type
 TCrTxComen = class;

  TWCrTxComen=Class(TForm)
    InterForma1             : TInterForma;
    mTX_COMENTARIOS: TMemo;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrTxComen;

end;
 TCrTxComen= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        //CLASES ADICIONALES
        BasicCred                : TBasicCred;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}


constructor TCrTxComen.Create( AOwner : TComponent );
begin Inherited;


      TableName := '';
      UseQuery := True;
      HelpFile := 'IntCrTxComen.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrTxComen.Destroy;
begin inherited;
end;


function TCrTxComen.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTxComen;
begin
   W:= TWCrTxComen.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

(*********************************************** FORMA CR_INF_ADIC_TASA********************)
(*                                                                              *)
(*  FORMA DE CR_INF_ADIC_TASA                                                            *)
(*                                                                              *)
(*********************************************** FORMA CR_INF_ADIC_TASA********************)

procedure TWCrTxComen.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      mTX_COMENTARIOS.Text := Objeto.BasicCred.TX_COMENTARIOS.AsString;
end;

procedure TWCrTxComen.FormDestroy(Sender: TObject);
begin
//
end;

procedure TWCrTxComen.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

end.
