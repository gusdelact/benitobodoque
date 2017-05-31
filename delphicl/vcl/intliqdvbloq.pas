// Sistema         : DEPOSITOS A LA VISTA
// Fecha de Inicio : 25 DE NOV DE 1999
// Diseñado por    : Marcos Zárate Castro
// Comentarios     :
Unit intLiqDVBloq;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,IntFind,
UnSQL2, InterFun, ComCtrls, IntDtPk, Spin, DBCtrls,IntLinkit;
                                        
Type
  TWLiqDVBloq=Class(TForm)
    PanelMensaje: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    sbAceptaAdi: TBitBtn;
    Timer1: TTimer;
    ImageBloqueado: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label5: TLabel;
    Label4: TLabel;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure sbAceptaAdiClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

procedure MuestraLiqDVBloq;

implementation

{$R *.DFM}

procedure MuestraLiqDVBloq;
var W: TWLiqDVBloq;
begin
   W:=TWLiqDVBloq.Create(Nil);
   try
      W.ShowModal;
   finally
      W.Free;
   end;
end;

procedure TWLiqDVBloq.FormClose(Sender: TObject; var Action: TCloseAction);
begin Timer1.Enabled:=False;
      Action := caFree;
end;

procedure TWLiqDVBloq.sbAceptaAdiClick(Sender: TObject);
begin Close;
end;

procedure TWLiqDVBloq.Timer1Timer(Sender: TObject);
begin  MessageBeep(0);
       if PanelMensaje.Color = clRed
       then PanelMensaje.Color:=clBlack
       else PanelMensaje.Color:=clRed;
end;

procedure TWLiqDVBloq.FormShow(Sender: TObject);
begin Timer1.Enabled:=True;
end;


end.
