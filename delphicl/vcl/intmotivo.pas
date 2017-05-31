// Sistema         : Clase de MOTIVO
// Fecha de Inicio : 23/04/1998
// Función forma   : Clase de MOTIVO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Marcos Zárate Castro
// Comentarios     :
Unit IntMotivo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntGrupMoti  {Grupo Motivo},
IntSecuAplic {secu aplicacion};

Type
 TMotivo= class;

  TWMotivo=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_APLICACION : TLabel;
    edCVE_APLICACION : TEdit;
    lbCVE_GPO_MOTIVO : TLabel;
    lbCVE_MOTIVO : TLabel; 
    edCVE_MOTIVO : TEdit;
    lbDESC_MOTIVO : TLabel; 
    edDESC_MOTIVO : TEdit;
    edCve_Gpo_Motivo: TEdit;
    SpeedButton1: TSpeedButton;
    edDescGpoMotivo: TEdit;
    edNomAplicacion: TEdit;
    SpeedButton2: TSpeedButton;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    private
    { Private declarations } 
    public 
    { Public declarations }
    Objeto : TMotivo;
end;
 TMotivo= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_APLICACION           : TInterCampo;
        CVE_GPO_MOTIVO           : TInterCampo;
        CVE_MOTIVO               : TInterCampo;
        DESC_MOTIVO              : TInterCampo;
        GrupoMotivo              : TGrupMoti;
        Aplicacion               : TSecuAplic;
        
        function    InternalBusca : Boolean; override;
        procedure   DatabaseChange;override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation

{$R *.DFM}

constructor TMotivo.Create( AOwner : TComponent );
begin Inherited;

      CVE_APLICACION         := CreaCampo('CVE_APLICACION',ftString,tsNinguno,tsNinguno,True);
      CVE_APLICACION.Caption := 'Clave de Aplicación';
      CVE_APLICACION.SIZE    := 6;

      CVE_GPO_MOTIVO         := CreaCampo('CVE_GPO_MOTIVO',ftString,tsNinguno,tsNinguno,True);
      CVE_GPO_MOTIVO.Caption := 'Clave de Grupo Motivo';
      CVE_GPO_MOTIVO.Size    := 6;

      CVE_MOTIVO             := CreaCampo('CVE_MOTIVO',ftString,tsNinguno,tsNinguno,True);
      CVE_MOTIVO.Caption     := 'Clave de Motivo';
      CVE_MOTIVO .SIZE       := 6;

      DESC_MOTIVO            := CreaCampo('DESC_MOTIVO',ftString,tsNinguno,tsNinguno,True);
      DESC_MOTIVO.Caption    := 'Descripción Motivo';

      Aplicacion                             := TSecuAplic.Create(Self);
      Aplicacion.MasterSource                := Self;
      Aplicacion.CVE_APLICACION.MasterField  := 'CVE_APLICACION';

      GrupoMotivo                            := TGrupMoti.Create(Self);
      GrupoMotivo.MasterSource               := Self;
      GrupoMotivo.CVE_GPO_MOTIVO.MasterField := 'CVE_GPO_MOTIVO';  

      FKeyFields.Add('CVE_APLICACION');
      FKeyFields.Add('CVE_GPO_MOTIVO');
      FKeyFields.Add('CVE_MOTIVO');
                                
      TableName := 'MOTIVO';
      UseQuery := True;
      HelpFile := 'IntMotivo.Hlp';
      ShowMenuReporte:=True;
end;

procedure TMotivo.DatabaseChange;
begin
    GrupoMotivo.GetParams(Self);
    Aplicacion.GetParams (Self);
end;

Destructor TMotivo.Destroy;
begin
      if Aplicacion  <> Nil then Aplicacion.Free;
      if GrupoMotivo <> Nil then GrupoMotivo.Free;
      inherited;
end;

function TMotivo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMotivo;
begin
   W:=TWMotivo.Create(Self);
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


Function TMotivo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IMotivo.it','S,S,S');
      Try if Active then begin T.Param(0,CVE_APLICACION.AsString);
                               T.Param(1,CVE_GPO_MOTIVO.AsString);
                               T.Param(2,CVE_MOTIVO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA MOTIVO********************)
(*                                                                              *)
(*  FORMA DE MOTIVO                                                            *)
(*                                                                              *)
(***********************************************FORMA MOTIVO********************)

procedure TWMotivo.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Aplicacion.CVE_APLICACION.Control   := edCVE_APLICACION;
      Aplicacion.NOM_APLICACION.Control   := edNomAplicacion;
      CVE_APLICACION.Control              := edCVE_APLICACION;
      CVE_GPO_MOTIVO.Control              := edCVE_GPO_MOTIVO;
      CVE_MOTIVO.Control                  := edCVE_MOTIVO;
      DESC_MOTIVO.Control                 := edDESC_MOTIVO;

      GrupoMotivo.Cve_GPO_MOTIVO.Control  := edCVE_GPO_MOTIVO;
      GrupoMotivo.DESC_GPO_MOTIVO.Control := edDescGpoMotivo;

      edCve_Gpo_Motivo.PopupMenu          := GrupoMotivo.PopMenu;
      edDescGpoMotivo.PopupMenu           := GrupoMotivo.PopMenu;
   end;
end;

procedure TWMotivo.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Aplicacion.CVE_APLICACION.Control   := nil;
      Aplicacion.NOM_APLICACION.Control   := nil;
      CVE_APLICACION.Control              := nil;
      CVE_GPO_MOTIVO.Control              := nil;
      CVE_MOTIVO.Control                  := nil;
      DESC_MOTIVO.Control                 := nil;
      GrupoMotivo.Cve_GPO_MOTIVO.Control  := nil;
      GrupoMotivo.DESC_GPO_MOTIVO.Control := nil;
   end;
end;

procedure TWMotivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;


procedure TWMotivo.SpeedButton1Click(Sender: TObject);
begin
    Objeto.GrupoMotivo.Busca;
end;

procedure TWMotivo.SpeedButton2Click(Sender: TObject);
begin
  Objeto.Aplicacion.Busca;
end;

end.

