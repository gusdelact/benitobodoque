unit IntSPerf;
//-------------------------------------------------------------
// Sistema         :   IntSPerf
// Date            :   Julio de 1997
// Fecha de Inicio :   Julio de 1997
// Función forma   :   Forma Creada Internamente
// Desarrollo por  :   Víctor Martínez Castro
// Comentarios     :   Forma Estandar
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, DBTables, Wwquery, Wwdatsrc,
  DBGrids;

type
  TfoSPerfil = class(TForm)
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    qPerfil: TQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    qPerfilNOM_PERFIL: TStringField;
    qPerfilNOMBRE: TStringField;
    qPerfilDESC_IND_ADIC: TStringField;
    qPerfilCVE_USUARIO: TStringField;
    qPerfilID_EMPRESA: TFloatField;
    qPerfilCVE_IND_ADIC: TStringField;
    qPerfilID_GPO_ACCESO: TFloatField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//  Esto es un Error


Function ExecutefoSPerfil( edUsuario,edAplicacion:String;
                           Var Perfil,ID_Empresa:Integer;
                           Var IndicAdd,Nom_Perfil:String;
                           Var NomIndicAdd:String;
                           DataBaseName:String; SessionName:String):Boolean;

Function ExecutefoSPerfilEx( edUsuario,edAplicacion:String;
                           Var Perfil,ID_Empresa:Integer;
                           Var IndicAdd,Nom_Perfil:String;
                           Var NomIndicAdd:String;
                           DataBaseName:String; SessionName:String;
                           TextoIndicador:String;
                           TituloForma:String):Boolean;

implementation

Uses UnGene;

{$R *.DFM}

Function ExecutefoSPerfil( edUsuario,edAplicacion:String;
                           Var Perfil,ID_Empresa:Integer;
                           Var IndicAdd,Nom_Perfil:String;
                           Var NomIndicAdd:String;
                           DataBaseName:String; SessionName:String):Boolean;
begin Result:=ExecutefoSPerfilEx(edUsuario,edAplicacion,Perfil,ID_Empresa
                               ,IndicAdd,Nom_Perfil,NomIndicAdd
                               ,DataBaseName,SessionName
                               ,'Indicador'
                               ,'Seleccionar Perfil de Acceso');
end;

Function ExecutefoSPerfilEx( edUsuario,edAplicacion:String;
                           Var Perfil,ID_Empresa:Integer;
                           Var IndicAdd,Nom_Perfil:String;
                           Var NomIndicAdd:String;
                           DataBaseName:String; SessionName:String;
                           TextoIndicador:String;
                           TituloForma:String):Boolean;
var
  foSPerfil: TfoSPerfil;

begin Result:=False;
      Application.CreateForm(TfoSPerfil, foSPerfil);
      Try
      foSPerfil.Close;
      foSPerfil.qPerfil.DataBaseName:=DataBaseName;
      foSPerfil.qPerfil.ParamByName('USUARIO').AsString:=edUsuario;
      foSPerfil.qPerfil.ParamByName('APLICACION').AsString:=edAplicacion;
      foSPerfil.qPerfil.Open;
      foSPerfil.Caption:=TituloForma;
      foSPerfil.DbGrid1.Columns[2].Title.Caption:=TextoIndicador;
      if foSPerfil.qPerfil.EOF and foSPerfil.qPerfil.BOF
         then begin InterMsg(tmInformacion,'',0,'No tiene un Perfil definido para esta Aplicacion, Verifique con su Administrador.');
                    Exit;
              end;
      foSPerfil.qPerfil.Next;
      if Not foSPerfil.qPerfil.EOF then // SOLO EXISTE UN REGISTRO.
         begin foSPerfil.qPerfil.First;
               if foSPerfil.ShowModal<>mrOK then Exit;
         end
      else foSPerfil.qPerfil.First;
      Perfil:=foSPerfil.qPerfil.FieldByName('ID_GPO_ACCESO').AsInteger;
      ID_Empresa:=foSPerfil.qPerfil.FieldByName('ID_EMPRESA').AsInteger;
      IndicAdd:=foSPerfil.qPerfil.FieldByName('CVE_IND_ADIC').AsString;
      Nom_Perfil:=foSPerfil.qPerfil.FieldByName('NOM_PERFIL').AsString;
      NomIndicAdd:=foSPerfil.qPerfil.FieldByName('DESC_IND_ADIC').AsString;
      Result:=True;
      Finally foSPerfil.Free;
      end;
end;


procedure TfoSPerfil.Button1Click(Sender: TObject);
begin ModalResult:=mrOK;
end;

procedure TfoSPerfil.Button2Click(Sender: TObject);
begin ModalResult:=mrCancel;
end;

procedure TfoSPerfil.FormShow(Sender: TObject);
begin DBGrid1.SetFocus;
end;

procedure TfoSPerfil.DBGrid1DblClick(Sender: TObject);
begin ModalResult:=mrOK;
end;

end.
