unit UnVerCodigo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ClipBrd, StdCtrls, Db, DBTables, InterFor;

type
  TFoVerCodigo = class(TForm)
    Memo1: TMemo;
    Button2: TButton;
    Query1: TQuery;
    Query1CVE_APLICACION: TStringField;
    Query1CVE_FUNCION: TStringField;
    Query1B_BLOQUEADO: TStringField;
    InterForma1: TInterForma;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FoVerCodigo: TFoVerCodigo;

Procedure Executa_VerCodigo(Aplicacion: String);

implementation


{$R *.DFM}

Procedure Executa_VerCodigo(Aplicacion: String);
begin
	Application.CreateForm(TfoVerCodigo,foVerCodigo);
   foVerCodigo.Query1.Close;
   foVerCodigo.Query1.ParamByName('CVE_APLICACION').AsString:= Aplicacion;
   foVerCodigo.Query1.Open;
   foVerCodigo.InterForma1.ShowModal;
   foVerCodigo.Free;
end;

procedure TFoVerCodigo.Button1Click(Sender: TObject);
begin Close;
end;

procedure TFoVerCodigo.Button2Click(Sender: TObject);
begin Memo1.SelectAll;
      Memo1.CopyToClipboard;
end;

procedure TFoVerCodigo.FormShow(Sender: TObject);
var s:String;
//    Primera:Boolean;
begin
      Memo1.Lines.Clear;
      Memo1.Lines.Add('Procedure <Forma>.InterApli1MenuClick(Sender: TObject; var NomFuncion: String);');
      Memo1.Lines.Add('begin');
  //    Primera:=True;
      Query1.First;
      While Not Query1.EOF do
      begin  S:=Query1CVE_FUNCION.AsString;
             if Not Query1.BOF then Memo1.Lines.Add('     else');
//             Primera:=False;
             if Pos('CLASE_',Query1CVE_FUNCION.AsString)=1 then
             begin S:=Copy(Query1CVE_FUNCION.AsString,7,100);
                   S:='    if NomFuncion='''+S+''' then ShowCat('+s+'.Create(Self),Apli)';
                   Query1.Next;
                   if Query1.EOF
                   then Memo1.Lines.Add(S+';')
                   else Memo1.Lines.Add(S);
             end
             else
             begin Memo1.Lines.Add('          if NomFuncion='''+S+''' then ');
                   Memo1.Lines.Add('             begin  Executa_'+S+';');
                   Query1.Next;
                   if Query1.EOF
                   then Memo1.Lines.Add('             end;')
                   else Memo1.Lines.Add('             end');
             end;
      end;
      Memo1.Lines.Add('end;');
end;

end.
