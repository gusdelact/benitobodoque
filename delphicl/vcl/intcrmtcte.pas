// Sistema         : Clase de TCrmTCte
// Fecha de Inicio : 16/10/2002
// Función forma   : Clase de TCrmTCte
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Juan Carlos Sanchez Reyes
// Comentarios     :
Unit IntCrmTCte;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TCrmTCte= class; 

  TWCrmTCte=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_PERSONA : TLabel; 
    edID_PERSONA : TEdit;
    lbCVE_TIPO_CLIENTE : TLabel; 
    edCVE_TIPO_CLIENTE : TEdit;
    edNbr: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Nuevo(Sender: TObject; var Realizado: Boolean);
    private
    public
    Objeto : TCrmTCte;
end;

 TCrmTCte= class(TInterFrame)
      private
      protected
      public
        ID_PERSONA               : TInterCampo;
        CVE_TIPO_CLIENTE         : TInterCampo;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation

{$R *.DFM}

constructor TCrmTCte.Create( AOwner : TComponent );
begin
  Inherited;
  ID_PERSONA :=CreaCampo('ID_PERSONA',ftFloat,tsNinguno,tsNinguno,True);
  ID_PERSONA.Caption:='Número de Persona';
  CVE_TIPO_CLIENTE :=CreaCampo('CVE_TIPO_CLIENTE',ftString,tsNinguno,tsNinguno,True);
  CVE_TIPO_CLIENTE.Caption:='Clave de Tipo Cliente';
  FKeyFields.Add('ID_PERSONA');
  TableName := 'CRM_TIPO_CLIENTE';
  UseQuery := True;
  HelpFile := 'IntCrmTCte.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrmTCte.Destroy;
begin
  inherited;
end;

function TCrmTCte.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrmTCte;
begin
   W:=TWCrmTCte.Create(Self);
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

Function TCrmTCte.InternalBusca:Boolean;
Var
  T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrmTCte.it','F');
  Try
    if Active then begin
       T.Param(0,ID_PERSONA.AsString);
    end;
    if T.Execute then
       InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;

function TCrmTCte.Reporte:Boolean;
begin
end;

(***********************************************FORMA TCrmTCte********************)
(*                                                                              *)
(*  FORMA DE TCrmTCte                                                            *)
(*                                                                              *)
(***********************************************FORMA TCrmTCte********************)

procedure TWCrmTCte.FormShow(Sender: TObject);
begin
  InterForma1.BtnBuscar.Visible := False;
  InterForma1.BtnNuevo.Visible := True;
  InterForma1.BtnAyuda.Visible := False;
  InterForma1.BtnEliminar.Visible := False;
  Objeto.ID_PERSONA.Control:=edID_PERSONA;
  Objeto.CVE_TIPO_CLIENTE.Control:=edCVE_TIPO_CLIENTE;
  if Objeto.FindKey([Objeto.FrameParam.FieldByName('ID_PERSONA').AsString]) then begin
     InterForma1.BtnNuevo.Visible := False;
     if Objeto.FrameParam.FieldByName('NOMBRE').AsString <> '' then
        edNbr.Text := Objeto.FrameParam.FieldByName('NOMBRE').AsString;
  end
  else
     edCve_tipo_cliente.Text := '';
end;

procedure TWCrmTCte.FormDestroy(Sender: TObject);
begin
  Objeto.ID_PERSONA.Control:=nil;
  Objeto.CVE_TIPO_CLIENTE.Control:=nil;
end;

procedure TWCrmTCte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrmTCte.InterForma1Nuevo(Sender: TObject; var Realizado: Boolean);
begin
  Objeto.Append;
  edNbr.Text := Objeto.FrameParam.FieldByName('NOMBRE').AsString;
  edID_PERSONA.Text := Objeto.FrameParam.FieldByName('ID_PERSONA').AsString;
end;

end.

