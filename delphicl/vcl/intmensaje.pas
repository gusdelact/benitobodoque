unit IntMensaje;
//Muestra un mensaje
//Marcos Zárate Castro
//Sistema de Mercado de Dinero
// Octubre del 2000

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TWMensaje = class(TForm)
    bbAutorizar: TBitBtn;
    pnMensaje: TPanel;
    Animate1: TAnimate;
    MEMO1: TMemo;
    bbDetalles: TBitBtn;
    procedure bbAutorizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbDetallesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WMensaje: TWMensaje;

procedure EXECUTE_MUESTRAMENSAJE(pMensaje:String);


implementation

{$R *.DFM}

procedure EXECUTE_MUESTRAMENSAJE(pMensaje:String);
var
  WMensaje: TWMensaje;
begin WMensaje:= TWMensaje.Create(Nil);
     try //WMensaje.pnMensaje.Caption:=pMensaje;
         WMensaje.MEMO1.Lines.Clear;
         WMensaje.MEMO1.Lines.ADD(pMensaje);
         WMensaje.ShowModal;
     finally if WMensaje <> nil then WMensaje.free;
     end;
end;

procedure TWMensaje.bbAutorizarClick(Sender: TObject);
begin Animate1.Active:=False;
      close;
end;

procedure TWMensaje.FormShow(Sender: TObject);
begin Animate1.Active:=True;
      bbAutorizar.SetFocus;
end;

procedure TWMensaje.bbDetallesClick(Sender: TObject);
begin if self.Height = 235
      then self.Height:=136
      else self.Height:=235;
end;

end.


