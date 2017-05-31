unit IntCtrlInt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls;

type
  TWCtrlInt = class(TForm)
    Cerrar: TButton;
    qconsulta: TQuery;
    lbTX_COMENTARIO: TLabel;
    lbTX_REFERENCIA: TLabel;
    lbTX_INF_FISCAL: TLabel;
    edTX_REFERENCIA: TMemo;
    edTX_COMENTARIO: TMemo;
    edTX_INF_FISCAL: TMemo;
    procedure CerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PTRANSAC : Integer;
    pDatabaseName : String;
    pSessionName : String;

  end;

var
  WCtrlInt: TWCtrlInt;

implementation

{$R *.DFM}

procedure TWCtrlInt.CerrarClick(Sender: TObject);
begin
   close;
end;

procedure TWCtrlInt.FormShow(Sender: TObject);
begin
     qconsulta.Databasename:=pDatabaseName;
     qconsulta.SessionName:=pSessionName;
     qconsulta.ParamByName('IDTRN').AsString:=FloatToStr(PTRANSAC);
     qconsulta.Open;
     if qconsulta.IsEmpty then
     begin
       edTX_REFERENCIA.text:='NO DISPONIBLE';
       edTX_COMENTARIO.text:='NO DISPONIBLE';
       edTX_INF_FISCAL.text:='NO DISPONIBLE';
     end
     else
     begin
       edTX_REFERENCIA.text:=qconsulta.fieldbyname('TX_REFERENCIA_INT').AsString;
       edTX_COMENTARIO.text:=qconsulta.fieldbyname('TX_COMENTARIO_INT').AsString;
       edTX_INF_FISCAL.text:=qconsulta.fieldbyname('TX_INF_FISCAL_INT').AsString;
     end;
     qconsulta.close;

end;

end.
