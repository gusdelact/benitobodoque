unit IntSeguMotivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun;

type
  TSegMotivo = class;

  TwSegMotivo = class(TForm)
    LbCveMotivo: TLabel;
    EdCveMotivo: TEdit;
    LbDescMotivo: TLabel;
    EdDescMotivo: TEdit;
    InterForma1: TInterForma;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
    Objeto: TSegMotivo;
  end;

  TSegMotivo = class(TInterFrame)
    private
    protected
    public
      CVE_MOTIVO  : TInterCampo;
      DESC_MOTIVO : TInterCampo;
      function    InternalBusca : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
  end;

var
  wSegMotivo: TwSegMotivo;

implementation

{$R *.DFM}

constructor TSegMotivo.Create( AOwner : TComponent );
begin
  Inherited;
  CVE_MOTIVO := CreaCampo('CVE_MOTIVO',ftString,tsNinguno,tsNinguno,True);
  CVE_MOTIVO.Size := 6;
  CVE_MOTIVO.Caption:='Clave de Usuario';

  DESC_MOTIVO :=CreaCampo('DESC_MOTIVO',ftString,tsNinguno,tsNinguno,True);
  DESC_MOTIVO.Size := 40;
  DESC_MOTIVO.Caption:='DESC_MOTIVO';

  TableName := 'SECU_CAT_MOTIVO';
  FKeyFields.Add('CVE_MOTIVO');
  UseQuery := True;
  HelpFile := 'InTSegMotivo.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TSegMotivo.Destroy;
begin
  inherited;
end;

function TSegMotivo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TwSegMotivo;
begin
  W := TwSegMotivo.Create(Self);
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

Function TSegMotivo.InternalBusca:Boolean;
Var
  T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IntSegMotivo.it','S');
  Try
    if Active then begin
       T.Param(0,CVE_MOTIVO.AsString);
    end;
    if T.Execute then
       InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;

procedure TwSegMotivo.FormShow(Sender: TObject);
begin
  Objeto.CVE_MOTIVO.Control := EdCveMotivo;
  Objeto.DESC_MOTIVO.Control := EdDescMotivo;
end;//procedure

procedure TwSegMotivo.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_MOTIVO.Control:=nil;
  Objeto.DESC_MOTIVO.Control:=nil;
end;//procedure

procedure TwSegMotivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;//procdure

end.
