//------------------------------------------------------------------------------
// Sistema     : CAJA
// Descripción : Muestra mensaje de operación rechazada
// Fecha       : Octubre 2001
// Desarrollo  : Marcos Zárate Castro
// Modifico    : Cesar Zamora Ramirez   04-mar-2013
//------------------------------------------------------------------------------
unit IntMensRe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, unConsCaja;

type
  TWMensRe = class(TForm)
    bbAutorizar: TBitBtn;
    pnMensaje: TPanel;
    Timer1: TTimer;
    procedure bbAutorizarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WMensRe : TWMensRe;
  vgOpPLD : String;

procedure EXECUTE_MENSAJE(pMensaje : String);

implementation
   {$R *.DFM}

procedure EXECUTE_MENSAJE(pMensaje : String);
var
   WMensRe : TWMensRe;
begin
   WMensRe:= TWMensRe.Create(Nil);
   with WMensRe do
      try
         if trim(pMensaje) <> '' then
            pnMensaje.Caption := pMensaje;
         if trim(vgOpPLD) = cEsVerdad then
         begin
            Color                := $001C9BF0;
            pnMensaje.Color      := $001C9BF0;
            pnMensaje.Font.Color := clBlack;
            pnMensaje.Font.Name  := 'Arial';
         end
         else
         begin
            Color                := clRed;
            pnMensaje.Color      := clRed;
            pnMensaje.Font.Color := clWhite;
            pnMensaje.Font.Name  := 'Comic Sans MS';
         end;
         bbAutorizar.Left := Integer(Trunc((Width/2) - (bbAutorizar.Width/2)));
         ShowModal;
      finally
         if WMensRe <> nil then
            Free;
      end;
end;

procedure TWMensRe.bbAutorizarClick(Sender: TObject);
begin
   close;
end;

procedure TWMensRe.Timer1Timer(Sender: TObject);
begin
   if pnMensaje.Font.Color = clRed then   pnMensaje.Font.Color := clWhite
   else                                   pnMensaje.Font.Color := clRed;
end;

procedure TWMensRe.FormHide(Sender: TObject);
begin
   Timer1.Enabled := False;
end;

procedure TWMensRe.FormShow(Sender: TObject);
begin
   if trim(vgOpPLD) = cEsVerdad then   Timer1.Enabled := False
   else                                Timer1.Enabled := True;
end;
end.
