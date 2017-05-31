// Sistema         : Clase de GRUPO_MOTIVO
// Fecha de Inicio : 23/04/1998
// Función forma   : Clase de GRUPO_MOTIVO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Marcos Zárate Castro
// Comentarios     :
Unit IntGrupMoti;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TGrupMoti= class;

  TWGrupoMotivo=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_GPO_MOTIVO : TLabel;
    edCVE_GPO_MOTIVO : TEdit;
    lbDESC_GPO_MOTIVO : TLabel;
    edDESC_GPO_MOTIVO : TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TGrupMoti;
end;
 TGrupMoti= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations } 
        CVE_GPO_MOTIVO           : TInterCampo;
        DESC_GPO_MOTIVO          : TInterCampo;
        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TGrupMoti.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_GPO_MOTIVO :=CreaCampo('CVE_GPO_MOTIVO',ftString,tsNinguno,tsNinguno,True);
        CVE_GPO_MOTIVO .Size:=6;
                CVE_GPO_MOTIVO.Caption:='Clave de Grupo Motivo';
      DESC_GPO_MOTIVO :=CreaCampo('DESC_GPO_MOTIVO',ftString,tsNinguno,tsNinguno,True);
                DESC_GPO_MOTIVO.Caption:='Descripción Grupo Motivo';
      FKeyFields.Add('CVE_GPO_MOTIVO');

      TableName := 'GRUPO_MOTIVO';
      UseQuery := True;
      HelpFile := 'IntGrupMoti.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TGrupMoti.Destroy;
begin inherited;
end;


function TGrupMoti.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWGrupoMotivo;
begin
   W:=TWGrupoMotivo.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow                  := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TGrupMoti.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IGruMot.it','S');
      Try if Active then begin T.Param(0,CVE_GPO_MOTIVO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA GRUPO_MOTIVO********************)
(*                                                                              *)
(*  FORMA DE GRUPO_MOTIVO                                                            *)
(*                                                                              *)
(***********************************************FORMA GRUPO_MOTIVO********************)

procedure TWGrupoMotivo.FormShow(Sender: TObject);
begin
      Objeto.CVE_GPO_MOTIVO.Control:=edCVE_GPO_MOTIVO;
      Objeto.DESC_GPO_MOTIVO.Control:=edDESC_GPO_MOTIVO;
end;

procedure TWGrupoMotivo.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_GPO_MOTIVO.Control:=nil;
      Objeto.DESC_GPO_MOTIVO.Control:=nil;
end;

procedure TWGrupoMotivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

end.

