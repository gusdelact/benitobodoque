//------------------------------------------------------------------------------
// Función    : Catalogo de Persona Frecuencia Ingresos
// Desarrollo : Abel Alejandro Salazar Carrillo
// Fecha      : Enero del 2013
// Version    : 1.0
//------------------------------------------------------------------------------
Unit IntPerFrecue;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
 TPerFrecue= class; 

  TWPerFrecuencia=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox1: TGroupBox;
    edUsrAlta: TEdit;
    Label1: TLabel;
    edFhAlta: TEdit;
    Label2: TLabel;
    edUsrModifica: TEdit;
    edFhModifica: TEdit;
    GroupBox2: TGroupBox;
    edClave: TEdit;
    edDescripcion: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TPerFrecue;
end; 
 TPerFrecue= class(TInterFrame) 
      private 
      protected
        { Protected declarations } 
      public 
        { Public declarations }
        Clave           : TInterCampo;
        Descripcion     : TInterCampo;
        UsrAlta         : TInterCampo;
        FhAlta          : TInterCampo;
        UsrModifica     : TInterCampo;
        FhModifica      : TInterCampo;

        procedure    DataBaseChange; override;
        function     InternalBusca : Boolean; override;
        constructor  Create( AOwner : TComponent ); override;
        destructor   Destroy; override;
        function     ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
        { Published declarations}
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TPerFrecue.Create( AOwner : TComponent ); 
begin Inherited; 
      Clave       := CreaCampo('CVE_FRECUENCIA'      , ftString   , tsNinguno, tsNinguno, True);
      Descripcion := CreaCampo('DESC_FRECUENCIA'     , ftString   , tsNinguno, tsNinguno, True);
      UsrAlta     := CreaCampo('CVE_USUARIO_ALTA'    , ftString   , tsNinguno, tsNinguno, True);
      FhAlta      := CreaCampo('FH_ALTA'             , ftDateTime , tsNinguno, tsNinguno, True);
      UsrModifica := CreaCampo('CVE_USUARIO_MODIFICA', ftString   , tsNinguno, tsNinguno, True);
      FhModifica  := CreaCampo('FH_MODIFICA'         , ftDateTime , tsNinguno, tsNinguno, True);

      FKeyFields.Add('CVE_FRECUENCIA');

      TableName := 'PER_FRECUENCIA';
      UseQuery  := True;
      HelpFile  := 'IntPerFrecue.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TPerFrecue.Destroy;
begin inherited;
end;

procedure TPerFrecue.DataBaseChange;
begin
   inherited;
end;

function TPerFrecue.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWPerFrecuencia;
begin
   W:=TWPerFrecuencia.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TPerFrecue.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IPerFrec.it','S');
      Try if Active then begin T.Param(0,Clave.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;




(************************* FORMA PER_FRECUENCIA *******************************)
(*                                                                            *)
(*  FORMA DE PER_FRECUENCIA                                                   *)
(*                                                                            *)
(************************* FORMA PER_FRECUENCIA *******************************)

procedure TWPerFrecuencia.FormShow(Sender: TObject);
begin
      Objeto.Clave.Control       := edClave;
      Objeto.Descripcion.Control := edDescripcion;
      Objeto.UsrAlta.Control     := edUsrAlta;
      Objeto.FhAlta.Control      := edFhAlta;
      Objeto.UsrModifica.Control := edUsrModifica;
      Objeto.FhModifica.Control  := edFhModifica;
end;

procedure TWPerFrecuencia.FormDestroy(Sender: TObject);
begin
      Objeto.Clave.Control       := nil;
      Objeto.Descripcion.Control := nil;
      Objeto.UsrAlta.Control     := nil;
      Objeto.FhAlta.Control      := nil;
      Objeto.UsrModifica.Control := nil;
      Objeto.FhModifica.Control  := nil;
end;

procedure TWPerFrecuencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWPerFrecuencia.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  if InterForma1.IsNewData then
  begin
    Objeto.UsrAlta.SetAsString( Objeto.Apli.Usuario );
    Objeto.FhAlta.SetAsDateTime( Now );
  end
  else
  begin
    Objeto.UsrModifica.SetAsString(Objeto.Apli.Usuario);
    Objeto.FhModifica.SetAsDateTime( Now );
  end;

end;

end.
