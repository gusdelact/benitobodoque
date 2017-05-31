unit IntStart;
//-------------------------------------------------------------
// Sistema         :   IntStart
// Date            :   Julio de 1997
// Fecha de Inicio :   Julio de 1997
// Función forma   :   Forma Creada Internamente
// Desarrollo por  :   Víctor Martínez Castro
// Comentarios     :   Forma Estandar
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------

interface

uses
  Windows, Db, Forms,DBTables, ComCtrls, Controls, ExtCtrls, Classes,
  StdCtrls,SysUtils;

type
  TIntStartSistema = class(TForm)
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    Panel1: TPanel;
    Animate1: TAnimate;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Texto:String;
    T2:TDateTime;
end;

Const
  UnStartSistema:TIntStartSistema=Nil;
  UnStartShow:Boolean=True;

Procedure IniciaSistema(I:Integer; S:String);

implementation

Uses UnSubGen;


{$R *.DFM}

Procedure IniciaSistema(I:Integer; S:String);
var T1:TDateTime;
begin if UnStartSistema=nil Then
        begin UnStartSistema:=TIntStartSistema.Create(nil); UnStartSistema.T2:=Time;  end;
        T1:=Time;
        T1:=T1-UnStartSistema.T2;
        if S<>''
        then begin UnStartSistema.Texto:=S;
                   UnStartSistema.Label1.Caption:=UnStartSistema.Texto+'  '+FormatDateTime('hh:nn:ss',T1);
             end;
        if I<>-1 then UnStartSistema.ProgressBar1.Position:=I;
        if UnStartShow then UnStartSistema.Show;
        Application.ProcessMessages;
        if I>=100 then begin UnStartSistema.Hide;
                             UnStartSistema.Close;
                             UnStartSistema.Free;
                             UnStartSistema:=Nil;
                        end;
end;


procedure TIntStartSistema.Timer1Timer(Sender: TObject);
var T1:TDateTime;
begin T1:=Time; T1:=T1-T2;
      Label1.Caption:=Texto+'  '+FormatDateTime(toHora,T1);
      Application.ProcessMessages;
end;


procedure TIntStartSistema.FormCreate(Sender: TObject);
begin Texto:='Iniciando Aplicación...'
end;

procedure TIntStartSistema.FormShow(Sender: TObject);
var F:String;
begin F:='INTLOGO.AVI';
      if LocalizaArchivo(F,'BMPS\')
         then begin Animate1.FileName:=F;
                    Animate1.Active:=True;
              end
         else begin F:='O:\DELPHIDE\PUBLIC\BMPS\INTLOGO.AVI';
                    if LocalizaArchivo(F,'BMPS\')
                    then begin Animate1.FileName:=F;
                               Animate1.Active:=True;
                         end
                    else begin Animate1.CommonAvi:=aviFindComputer;
                               Animate1.Active:=True;
                         end;
           end;
end;

end.
