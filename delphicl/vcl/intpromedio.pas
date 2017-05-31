unit IntPromedio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, InterFor, UnSql2, db, dbtables, UnRecaptura;

type
//	TTipoAprox = (taNinguno, taDEFECT, taRPFICV);

   TDatos = Record
   	Tabla:     String;
      Base:      String;
      Incremento:String;
      Filtro:    String;
      Dias:      Integer;
      PorMas:    Integer;
      PorMenos:  Integer;
   end;

  TPromedio = Class;

  TwPromedio = class(TForm)
    InterForma1: TInterForma;
  private
    { Private declarations }
  public
    { Public declarations }
		Objeto: TPromedio;
  end;

  TPromedio = Class(TInterFrame)
  Private
  		FTipoAprox: TTipoAprox;
  Protected
		Procedure SetTipoAprox(Tipo: TTipoAprox);
  Public
  		Id_Contrato: TInterCampo;
      Imp_Base:   TInterCampo;
      Variacion:   TInterCampo;

      Datos: TDatos;
		Constructor Create(AOwner : TComponent); override;
    	Destructor  Destroy; override;
    	Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      Function CalculaAprox: Boolean;

      Property TipoAprox: TTipoAprox Read FTipoAprox Write SetTipoAprox;
  end;

var
  wPromedio: TwPromedio;

implementation

{$R *.DFM}

{****************************************************************************}
{											CLASE													  }
{****************************************************************************}
Constructor TPromedio.Create(AOwner : TComponent);
Begin
	inherited;
   Id_Contrato:= CreaCampo('ID_CONTRATO', ftFloat, tsNinguno, tsNinguno, False);
   Imp_Base  := CreaCampo('IMP_BASE', ftFloat, tsNinguno, tsNinguno, False);
   Variacion  := CreaCampo('VARIACION', ftFloat, tsNinguno, tsNinguno, False);

	IsCheckSecu:= False;
end;

Destructor  TPromedio.Destroy;
Begin	inherited;
end;

Function TPromedio.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var W : TWPromedio;
begin
   W := TWPromedio.Create(Self);
   try
      W.Objeto := Self;
      W.InterForma1.InterFrame:=Self;
      W.InterForma1.FormaTipo := ftConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Procedure TPromedio.SetTipoAprox(Tipo: TTipoAprox);
Begin
	FTipoAprox:= Tipo;

	Case Tipo of
	taNinguno:
   	Begin
         Datos.Tabla     := '';
         Datos.Base      := '';
         Datos.Incremento:= '';
         Datos.Filtro    := '';
         Datos.Dias      := -1;
         Datos.PorMas    := -1;
         Datos.PorMenos  := -1;
      end;
   taDEFECT:
   	Begin
         Datos.Tabla     := 'DV_TRANSACCION';
         Datos.Base      := 'Avg(Imp_Trans)';
         Datos.Incremento:= 'StdDev(Imp_Trans)';
         Datos.Filtro    := 'Cve_Operacion = ''DEFECT''';
         Datos.Dias      := 90;
         Datos.PorMas    := 200;
         Datos.PorMenos  := -1;
      end;
   taRPFICV:
   	Begin
         Datos.Tabla     := 'DV_TRANSACCION';
         Datos.Base      := 'Avg(Imp_Trans)';
         Datos.Incremento:= 'StdDev(Imp_Trans)';
         Datos.Filtro    := 'Cve_Operacion = ''RPFICV''';
         Datos.Dias      := 90;
         Datos.PorMas    := 200;
         Datos.PorMenos  := 200;
      end;
   end;
end;


Function TPromedio.CalculaAprox: Boolean;
Var
	q: TQuery;
	Sql: String;

   Valor: Real;
Begin
	Result:= False;

   q:= GetSqlQuery(
         ' SELECT '+ Datos.Base + ' as BASE, '+ Datos.Incremento +' as INCREMENTO FROM '+ Datos.Tabla +
   		' WHERE Id_Contrato = '+ Id_Contrato.asString +
         '   and ' + Datos.Filtro +
         '   and F_Liquidacion Between '+ SQLFecha(Now - Datos.Dias) +' and '+ SQLFecha(Now),
         DataBaseName, SessionName, False);

   If q <> nil then
   Begin
      Try
   		Imp_Base.AsString:= FormatFloat('################.00', q.FieldByName('BASE').asFloat);
         Variacion.AsString:= FormatFloat('################.00', q.FieldByName('INCREMENTO').asFloat);
         If Imp_Base.asFloat = 0 Then Result:= False
		   else Result:= True;
      Finally
      	q.Free;
      end
   end;
end;

end.
