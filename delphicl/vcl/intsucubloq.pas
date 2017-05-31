// Sistema         : INVERSIONES A PLAZO
// Fecha de Inicio : 22 DE NOV DE 1999
// Diseñado por    : Marcos Zárate Castro
// Comentarios     :
Unit IntSucuBloq;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,IntFind,
UnSQL2, InterFun, ComCtrls, IntDtPk, Spin, DBCtrls,IntLinkit;

Type
  TWSucuBloq=Class(TForm)
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
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure sbAceptaAdiClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

procedure MuestraSucuBloq;

implementation

{$R *.DFM}

procedure MuestraSucuBloq;
var W: TWSucuBloq;
begin
   W:=TWSucuBloq.Create(Nil);
   try
      W.ShowModal;
   finally
      W.Free;
   end;
end;

procedure TWSucuBloq.FormClose(Sender: TObject; var Action: TCloseAction);
begin Timer1.Enabled:=False;
      Action := caFree;
end;

procedure TWSucuBloq.sbAceptaAdiClick(Sender: TObject);
begin Close;
end;

procedure TWSucuBloq.Timer1Timer(Sender: TObject);
begin  MessageBeep(0);
       if PanelMensaje.Color = clRed
       then PanelMensaje.Color:=clBlack
       else PanelMensaje.Color:=clRed;
end;

procedure TWSucuBloq.FormShow(Sender: TObject);
begin Timer1.Enabled:=True;
end;


end.
