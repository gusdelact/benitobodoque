unit IntMsgConfirm;
//Muestra un mensaje de operación rechazada
//Marcos Zárate Castro
//Sistema Corporativo
//Octubre del 2001

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TWMsgConfirm = class(TForm)
    pnMensaje: TPanel;
    bbAutorizar: TBitBtn;
    procedure bbAutorizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WMsgConfirm: TWMsgConfirm;

procedure SHOW_MENSAJE(pMensaje:String);


implementation

{$R *.DFM}

procedure SHOW_MENSAJE(pMensaje:String);
var
  WMsgConfirm: TWMsgConfirm;
begin
     WMsgConfirm:= TWMsgConfirm.Create(Nil);
     try
        if pMensaje <> '' then
           WMsgConfirm.pnMensaje.Caption:=pMensaje;
        WMsgConfirm.ShowModal;
     finally
        if WMsgConfirm <> nil then
           WMsgConfirm.free;
     end;
end;

procedure TWMsgConfirm.bbAutorizarClick(Sender: TObject);
begin
    close;
end;

procedure TWMsgConfirm.FormShow(Sender: TObject);
begin
   BringToFront;
end;

end.
