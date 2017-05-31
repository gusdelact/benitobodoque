unit IntCrMsg;

interface

uses
  Windows, Db, Forms,DBTables, ComCtrls, Controls, ExtCtrls, Classes,
  StdCtrls,SysUtils, Buttons;

type
  TIntCrMsg = class(TForm)
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    bbCancela: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure bbCancelaClick(Sender: TObject);
  private
    { Private declarations }
    FCancelado : boolean;
  public
    { Public declarations }
    Texto:String;
    T2:TDateTime;
    Porcentaje : integer;
    Leyenda    : string;
    property Cancelado : boolean read FCancelado write FCancelado;
end;

Const
  cProceso:TIntCrMsg=Nil;
  UnStartShow:Boolean=True;

Procedure ProcesoCredito(I:Integer; S:String);

implementation

Uses UnSubGen;


{$R *.DFM}

procedure ProcesoCredito(I:Integer; S:String);
var
  T1:TDateTime;
begin
  if CProceso=nil then
  begin
    CProceso:=TIntCrMsg.Create(nil);
    CProceso.T2:=Time;
  end;
  cProceso.Porcentaje := I;
  cProceso.Leyenda    := S;
  T1:=Time;
  T1:=T1-CProceso.T2;
  if cProceso.Leyenda <> '' then
    begin
      CProceso.Caption:='Procesando';
      CProceso.Texto:=S;
      CProceso.Label1.Caption := CProceso.Texto+'  '+FormatDateTime('hh:nn:ss',T1);
      Application.ProcessMessages;
    end;
  if cProceso.Porcentaje <> -1 then CProceso.ProgressBar1.Position:=I;
  if UnStartShow then
    CProceso.Show;
  Application.ProcessMessages;
  if cProceso.Porcentaje >= 100 then
  begin
    CProceso.Hide;
    CProceso.Close;
    CProceso.Free;
    CProceso:=Nil;
  end;
end;


procedure TIntCrMsg.Timer1Timer(Sender: TObject);
var T1:TDateTime;
begin T1:=Time; T1:=T1-T2;
      Label1.Caption:=Texto+'  '+FormatDateTime(toHora,T1);
      Application.ProcessMessages;
end;


procedure TIntCrMsg.bbCancelaClick(Sender: TObject);
begin
  bbCancela.Enabled := False;
  Cancelado := True;
end;

end.
