unit IntAbout;
//-------------------------------------------------------------
// Sistema         :   Acerca de...
// Date            :   Noviembre de 1997
// Fecha de Inicio :   Noviembre de 1997
// Función forma   :   Acerca de ...
// Desarrollo por  :   Víctor Martínez Castro MACV.
// Comentarios     :
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  TfoAbout = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    PanelTodo: TPanel;
    Panel1: TPanel;
    Image2: TImage;
    Panel2: TPanel;
    Label4: TLabel;
    Panel3: TPanel;
    Label5: TLabel;
    Image1: TImage;
    Panel4: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


Procedure ShowAbout(FechaVersion,Version,Sistema,Info,Imagen,Logo:String);

implementation
Uses UnSubGen;

{$R *.DFM}

Procedure ShowAbout(FechaVersion,Version,Sistema,Info,Imagen,Logo:String);
var
  foAbout: TfoAbout;

begin Application.CreateForm(tfoAbout,foAbout);
      Try
      foAbout.Label6.Caption:=FechaVersion;
      foAbout.Label7.Caption:=Version;
      foAbout.Label4.Caption:=Info;
      foAbout.Label5.Caption:=Sistema;
      CargaImg(foAbout.Image2,Imagen);
      CargaImg(foAbout.Image1,Logo);
      foAbout.ShowModal;
      Finally
        foAbout.Free;
      end;
end;


procedure TfoAbout.BitBtn1Click(Sender: TObject);
begin Close;
      ModalResult:=mrOK;
end;




end.
