unit IntCrDesMot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;
  //Unidades adiconales

type
  TCrDesMot = class(TForm)
    btAceptar: TBitBtn;
    btCancelar: TBitBtn;
    meTX_MOTIVO: TMemo;
    lbDescMotivo: TLabel;
    procedure btCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CrDesMot: TCrDesMot;

implementation

{$R *.DFM}

procedure TCrDesMot.btCancelarClick(Sender: TObject);
begin
   meTX_MOTIVO.Text := '';
   Exit;
end;

procedure TCrDesMot.FormShow(Sender: TObject);
begin
  meTX_MOTIVO.SetFocus;
end;

end.
