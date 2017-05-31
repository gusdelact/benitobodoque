// Sistema         : Clase de NINGUNO
// Fecha de Inicio : 18/02/1999
// Función forma   : Clase de NINGUNO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Marcos Zárate Castro
// Comentarios     :
Unit IntMesaBloq;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,IntFind,
UnSQL2, InterFun, ComCtrls, IntDtPk, Spin, DBCtrls,IntLinkit;

Type
  TWBloqMesa=Class(TForm)
    PanelMensaje: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    sbAceptaAdi: TBitBtn;
    Timer1: TTimer;
    ImageBloqueado: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label5: TLabel;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure sbAceptaAdiClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

procedure MuestraMesaBloq;

implementation

{$R *.DFM}

procedure MuestraMesaBloq;
var W: TWBloqMesa;
begin
   W:=TWBloqMesa.Create(Nil);
   try
      W.ShowModal;
   finally
      W.Free;
   end;
end;

procedure TWBloqMesa.FormClose(Sender: TObject; var Action: TCloseAction);
begin Timer1.Enabled:=False;
      Action := caFree;
end;

procedure TWBloqMesa.sbAceptaAdiClick(Sender: TObject);
begin Close;
end;

procedure TWBloqMesa.Timer1Timer(Sender: TObject);
begin  MessageBeep(1);
       if PanelMensaje.Color = clRed
       then PanelMensaje.Color:=clBlack
       else PanelMensaje.Color:=clRed;
end;

procedure TWBloqMesa.FormShow(Sender: TObject);
begin Timer1.Enabled:=True;
end;



end.

