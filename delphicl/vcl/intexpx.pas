// Sistema         : Clase de Catálogo de Excepciones
// Fecha de Inicio : 19 de Enero del 2000
// Desarrollo por  : Rocío Berenice Muñoz Ríos

unit IntExpX;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntMPers, IntCtto;

type

  TExpX = Class;
  TWExpX = class(TForm)
    InterForma1: TInterForma;
    Label4: TLabel;
    ed_Excepcion: TEdit;
    ed_Clave: TEdit;
    InterForma2: TInterForma;
    dtFReporte1: TDateTimePicker;
    Panel1: TPanel;
    Label1: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TExpX;
  end;

  TExpX = class(TInterFrame)
  private
  protected
  public
        CVE_TIP_EXCEP            : TInterCampo;
        DESC_EXCEPCION           : TInterCampo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;

implementation

{$R *.DFM}

constructor TExpX.Create( AOwner : TComponent );
begin
   Inherited;
      CVE_TIP_EXCEP  :=CreaCampo('CVE_TIP_EXCEP',ftString,tsNinguno,tsNinguno,True);
                      CVE_TIP_EXCEP.Caption:='Clave de Excepción';
      DESC_EXCEPCION :=CreaCampo('DESC_EXCEPCION',ftString,tsNinguno,tsNinguno,True);
                      DESC_EXCEPCION.Caption:='Descripción';

      FKeyFields.Add('CVE_TIP_EXCEP');

      TableName := 'EXCEPCION';
      UseQuery := True;
      HelpFile := 'InTExpX.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TExpX.Destroy;
begin
  inherited;
end;

function TExpX.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWExpX;
begin
   W := TWExpX.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowBtnBuscar:=True; // Mostrar Boton de Buscar. Siempre Despues de FormaTipo
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TExpX.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICoExc.it','S,S');
      Try if Active then begin T.Param(0,CVE_TIP_EXCEP.AsString);
                               T.Param(1,DESC_EXCEPCION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

procedure TWExpX.FormShow(Sender: TObject);
begin
      Objeto.CVE_TIP_EXCEP.Control    := ed_Clave;
      Objeto.DESC_EXCEPCION.Control   := ed_Excepcion;

      InterForma1.ShowBtnAyuda := False;
      InterForma1.ShowBtnBuscar := True;
      InterForma1.ShowBtnNuevo := False;
      InterForma1.ShowBtnEliminar := False;
      InterForma1.ShowBtnCancelar := False;
      InterForma1.ShowBtnModificar := False;
      InterForma1.ShowBtnAceptar := False;
end;

procedure TWExpX.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_TIP_EXCEP.Control   := nil;
      Objeto.DESC_EXCEPCION.Control  := nil;
end;

procedure TWExpX.FormClose(Sender: TObject; var Action: TCloseAction);
begin   Action := caFree;
end;

end.



