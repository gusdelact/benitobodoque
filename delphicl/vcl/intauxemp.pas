unit IntAuxEmp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Db, DBTables, InterFor, IntFrm;

type
  TWAuxEmpre = class(TForm)
    GroupBox1: TGroupBox;
    Logotipo: TDBImage;
    InterForma1: TInterForma;
    Table1: TTable;
    DataSource1: TDataSource;
    Table1ID_EMPRESA: TFloatField;
    Table1IM_LOGO_EMPRESA: TBlobField;
    procedure InterForma1Modificar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1Aceptar(Sender: TObject; var Realizado: Boolean);
    procedure InterForma1Cancelar(Sender: TObject; var Realizado: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



Procedure ModificaLogoEmpresa(Objeto:TInterFrame);


implementation

{$R *.DFM}

Procedure ModificaLogoEmpresa(Objeto:TInterFrame);
var
  WAuxEmpre: TWAuxEmpre;

begin if Objeto.Active=False then Raise EInterFrame.Create('No Existe una Empresa Activa para Modificar Logotipo');
      Application.CreateForm(TWAuxEmpre,WAuxEmpre);
      Try
         WAuxEmpre.Table1.DataBaseName:=Objeto.DataBaseName;
         WAuxEmpre.Table1.SessionName:=Objeto.SessionName;
         WAuxEmpre.Table1.Filtered:=True;
         WAuxEmpre.Table1.Filter:='ID_EMPRESA='+Objeto.FieldByName('ID_EMPRESA').AsSQL;
         WAuxEmpre.Table1.Active:=True;
         WAuxEmpre.InterForma1.ShowModal;
         WAuxEmpre.Table1.Active:=False;
      Finally WAuxEmpre.Free;
      end;
end;


procedure TWAuxEmpre.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin Realizado:=False;
      Table1.Edit;
      Realizado:=True;
end;

procedure TWAuxEmpre.InterForma1Aceptar(Sender: TObject;
  var Realizado: Boolean);
begin Realizado:=False;
      Table1.Post;
      Realizado:=True;
end;

procedure TWAuxEmpre.InterForma1Cancelar(Sender: TObject;
  var Realizado: Boolean);
begin Realizado:=False;
      Table1.Cancel;
      Realizado:=True;

end;

end.
