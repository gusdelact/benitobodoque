unit IntEncry;
//-------------------------------------------------------------
// Sistema         :   InterEncripta
// Date            :   Julio de 1997
// Fecha de Inicio :   Julio de 1997
// Función forma   :   Control de Interforma
// Desarrollo por  :   Víctor Martínez Castro
// Comentarios     :   Forma Estandar
// Modificacion    :   15 Julio 1997. 1:05 pm inicio
//                     Ampliar Capacidades de Interforma.
//                     Mostrar Algunos Controles.
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls;

Type

TFieldGetTextEvent = procedure(Sender: TField; var Text: string; DisplayText: Boolean) of object;
TFieldSetTextEvent = procedure(Sender: TField; const Text: string) of object;

type
  TInterEncryp = class(TComponent)
  private
    { Private declarations }
  protected
    { Protected declarations }
    FField:TField;
    procedure Notification( AComponent : TComponent; Operation : TOperation ); override;
    Procedure SetField(F:TField);
  public
    { Public declarations }
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    procedure OnEncrypGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure OnEncrypSetText(Sender: TField; const Text: string);
    Function Encripta(S:String):String;
    Function DesEncripta(S:String):String;
  published
    { Published declarations }
    Property EncryptedField:TField read FField Write SetField Default Nil;
  end;

procedure Register;

implementation

{$R *.DCR}

procedure Register;
begin
  RegisterComponents('Inter', [TInterEncryp]);
end;

Function TInterEncryp.Encripta(S:String):String;
Const KDat=31;
var s2:string;
    i:Integer;
begin S2:=S;
      for i:=1 to Length(S) do
      begin S2[i]:=Char(Byte(S[I]) Xor KDAT);
      end;
      Encripta:=S2;
end;

Function TInterEncryp.DesEncripta(S:String):String;
Const KDat=31;
var s2:string;
    i:Integer;
begin S2:=S;
      for i:=1 to Length(S) do
      begin S2[i]:=Char(Byte(S[I]) Xor KDAT);
      end;
      DesEncripta:=S2;
end;



procedure TInterEncryp.OnEncrypGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin if Sender.IsNull
         then Text:=DesEncripta('')
         else Text:=DesEncripta(Sender.Value);
end;

procedure TInterEncryp.OnEncrypSetText(Sender: TField; const Text: string);
begin Sender.Value:=Encripta(Text);
end;


Procedure TInterEncryp.SetField(F:TField);
begin if F=Nil then
         begin FField:=Nil; Exit;
         end
      else
         begin FField:=F;
               FField.OnGetText:=OnEncrypGetText;
               FField.OnSetText:=OnEncrypSetText;
         end;
end;

procedure TInterEncryp.Notification( AComponent : TComponent; Operation : TOperation);
begin
  inherited Notification( AComponent, Operation );
  if ( Operation = opRemove ) and ( AComponent = FField) then FField:= nil;
end;

constructor TInterEncryp.Create( AOwner : TComponent );
begin
  inherited Create( AOwner );
  FField:=Nil;
end;


Destructor TInterEncryp.Destroy;
begin inherited Destroy;
end;



end.
