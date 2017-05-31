unit unSQL2;
//-------------------------------------------------------------
// Sistema         :   UnSQL2
// Date            :   Junio de 1997
// Fecha de Inicio :   Junio de 1997
// Función forma   :   Control de Querys y SQL´s
// Desarrollo por  :   Víctor Martínez Castro
// Comentarios     :
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------
interface
Uses DBtables,SysUtils,DB, Classes;


Function GetSQL(SQL:String; DataBaseName:String; SessionName:string; ShowError:Boolean):Boolean;
//Con el SQL que envias regresa si existen o no datos.
//Abre un Query con OPEN


Function GetSQLQueryNoNil(SQL:String; DataBaseName:String; SessionName:string; ShowError:Boolean):TQuery;
//Con el SQL que envias regresa un Objeto Query con los Datos.
// ES RESPONSABILIDAD TUYA EL DESTRUIR EL OBJETO.
//Si no existen datos en el Query Se regresa NIL.


Function GetSQLQuery(SQL:String; DataBaseName:String; SessionName:string; ShowError:Boolean):TQuery;
//Con el SQL que envias regresa un Objeto Query con los Datos.
// ES RESPONSABILIDAD TUYA EL DESTRUIR EL OBJETO.
//Si no existen datos en el Query Se regresa NIL.

Function GetSQLQueryMaster(SQL:String; Master:TDataSource; DataBaseName:String; SessionName:string; ShowError:Boolean):TQuery;
//Con el SQL que envias regresa un Objeto Query con los Datos.
// ES RESPONSABILIDAD TUYA EL DESTRUIR EL OBJETO.
//Si no existen datos en el Query Se regresa NIL.


Function RunSQL(SQL:String; DataBaseName:String; SessionName:string;  ShowError:Boolean):Boolean;
//Con el SQL ejecutas el  Query de SQL
//Usa EXECSQL
Function GetSQLStr(SQL:String; DataBaseName:String; SessionName:string;  Campo:String; Var Valor:String; ShowError:Boolean):Boolean;
//Con el SQL abre un query y te regresa el valor que tiene el campo como String;
Function GetSQLInt(SQL:String; DataBaseName:String; SessionName:string; Campo:String; Var Valor:Integer; ShowError:Boolean):Boolean;
//Con el SQL abre un query y te regresa el valor que tiene el campo como Integer;
Function GetSQLFloat(SQL:String; DataBaseName:String; SessionName:string; Campo:String; Var Valor:Real; ShowError:Boolean):Boolean;
//Con el SQL abre un query y te regresa el valor que tiene el campo como Real;
Function GetSQLOraBol(SQL:String; DataBaseName:String; SessionName:string; Campo:String; Var Valor:Boolean; ShowError:Boolean):Boolean;
//Con el SQL abre un query y te regresa el valor que tiene el campo como Booleano con V o F
Function IncSQL(Tabla,Campo:String; DataBaseName:String; SessionName:string; Var Valor:LongInt; ShowError:Boolean):Boolean;
//Incrementa un parametro Entero de una tabla dada.
Procedure ADDSQL(Var SS:String; Add:String);
//suma dos sentencias SQL con un AND si este es necesario SQL (ALGO=1) AND (ALGO=2)

Function SQLFecha(Fecha:TDateTime):String;
//Lo Envia como un string que reconoce Oracle co una Fecha Correcta.
Function Nvl(Dato: String):String;
//Si el dato es vacio regresa NULL

Function SQLStr(S:String):String;


implementation

Uses IntCheckMem;




Procedure ADDSQL(Var SS:String; Add:String);
begin if SS='' then SS:=ADD else if ADD<>'' then SS:=SS+' and '+ADD;
end;

Function SQLStr(S:String):String;
begin Result:=''''+S+'''';
end;


Function  GetSQL(SQL:String; DataBaseName:String; SessionName:string; ShowError:Boolean):Boolean;
Var TT:TQuery;
begin GetSQL:=False;
      Try
      TT:=TQuery.Create(nil);
      Try
      TT.DataBaseName:=DataBaseName;
      TT.SessionName:=SessionName;
      TT.SQL.Clear;
      TT.SQL.Add(SQL);
      TT.Open;
      if (TT.EOF) and (TT.BOF) then GetSQL:=False else GetSQL:=True;
      Finally
      TT.Free;
      end;
      Except
       if ShowError then Raise;
      end;
end;

Function  GetSQLQuery(SQL:String; DataBaseName:String; SessionName:string; ShowError:Boolean):TQuery;
Var TT:TQuery;
    OK:Boolean;
begin GetSQLQuery:=nil;
      OK:=False;
      Try
      if vgUseCheckMem
      then TT:=TCheckMemQuery.CreateMio(nil,SQL)
      else TT:=TQuery.Create(nil);

      Try
      TT.DataBaseName:=DataBaseName;
      TT.SessionName:=SessionName;
      TT.SQL.Clear;
      TT.SQL.Add(SQL);
      TT.Open;
      OK:=(Not TT.IsEmpty);
      Finally
      if OK then GetSQLQuery:=TT
            else TT.Free;
      end;
      Except
       if ShowError then Raise;
      end;
end;

Function  GetSQLQueryNoNil(SQL:String; DataBaseName:String; SessionName:string; ShowError:Boolean):TQuery;
Var TT:TQuery;
    OK:Boolean;
begin GetSQLQueryNoNil:=nil;
      OK:=False;
      Try
      if vgUseCheckMem
      then TT:=TCheckMemQuery.CreateMio(nil,SQL)
      else TT:=TQuery.Create(nil);

      Try
      TT.DataBaseName:=DataBaseName;
      TT.SessionName:=SessionName;
      TT.SQL.Clear;
      TT.SQL.Add(SQL);
      TT.Open;
      OK:=True;
      Finally
      if OK then GetSQLQueryNoNil:=TT
            else TT.Free;
      end;
      Except if ShowError then Raise;
      end;
end;


Function  GetSQLQueryMaster(SQL:String; Master:TDataSource; DataBaseName:String; SessionName:string; ShowError:Boolean):TQuery;
Var TT:TQuery;
    OK:Boolean;
begin GetSQLQueryMaster:=nil;
      OK:=False;
      Try
      if vgUseCheckMem
      then TT:=TCheckMemQuery.CreateMio(nil,SQL)
      else TT:=TQuery.Create(nil);

      Try
      TT.DataBaseName:=DataBaseName;
      TT.SessionName:=SessionName;
      TT.DataSource:=Master;
      TT.SQL.Clear;
      TT.SQL.Add(SQL);
      TT.Open;
      OK:=(Not TT.IsEmpty);
      Finally
      if OK then GetSQLQueryMaster:=TT
            else TT.Free;
      end;
      Except
       if ShowError then Raise;
      end;
end;


Function  RunSQL(SQL:String; DataBaseName:String; SessionName:string; ShowError:Boolean):Boolean;
Var TT:TQuery;
begin RunSQL:=False;
    Try
      TT:=TQuery.Create(nil);
      Try
      TT.DataBaseName:=DataBaseName;
      TT.SessionName:=SessionName;
      TT.SQL.Clear;
      TT.SQL.Add(SQL);
      TT.ExecSQL;
      RunSQL:=True;
      Finally TT.Free;
      end;
    Except
       if ShowError then Raise;
    end;
end;


Function GetSQLStr(SQL:String; DataBaseName:String; SessionName:string; Campo:String; Var Valor:String; ShowError:Boolean):Boolean;
Var TT:TQuery;
begin GetSQLStr:=False;
    Try
      TT:=TQuery.Create(Nil);
      Try
      TT.DataBaseName:=DataBaseName;
      TT.SessionName:=SessionName;
      TT.SQL.Clear;
      TT.SQL.Add(SQL);
      TT.Open;
      if (TT.EOF) and (TT.BOF)
         then begin GetSQLStr:=False; Valor:='' end
         else begin Valor:=TT.FieldByName(Campo).AsString;
                    GetSQLStr:=True;
              end;
      Finally
      TT.Free;
      end;
    Except
       if ShowError then Raise;
    end;
end;


Function  GetSQLInt(SQL:String; DataBaseName:String; SessionName:string; Campo:String; Var Valor:Integer; ShowError:Boolean):Boolean;
Var TT:TQuery;
begin GetSQLInt:=False;
    Try
      TT:=TQuery.Create(Nil);
      Try
      TT.DataBaseName:=DataBaseName;
      TT.SessionName:=SessionName;
      TT.SQL.Clear;
      TT.SQL.Add(SQL);
      TT.Open;
      if (TT.EOF) and (TT.BOF)
         then begin GetSQLInt:=False; Valor:=-1; end
         else begin If not TT.FieldByName(Campo).isnull then
         					Valor:=TT.FieldByName(Campo).AsInteger;
                    GetSQLInt:=True;
              end;
      Finally
      TT.Free;
      end;
    Except
       if ShowError then Raise;
    end;

end;

Function  GetSQLFloat(SQL:String; DataBaseName:String; SessionName:string; Campo:String; Var Valor:Real; ShowError:Boolean):Boolean;
Var TT:TQuery;
begin GetSQLFloat:=False;
    Try
      TT:=TQuery.Create(Nil);
      Try
      TT.DataBaseName:=DataBaseName;
      TT.SessionName:=SessionName;
      TT.SQL.Clear;
      TT.SQL.Add(SQL);
      TT.Open;
      if (TT.EOF) and (TT.BOF)
         then begin GetSQLFloat:=False; Valor:=-1; end
         else begin Valor:=TT.FieldByName(Campo).AsFloat;
                    GetSQLFloat:=True;
              end;
      Finally
      TT.Free;
      end;
    Except
       if ShowError then Raise;
    end;

end;

Function  GetSQLOraBol(SQL:String; DataBaseName:String; SessionName:string; Campo:String; Var Valor:Boolean; ShowError:Boolean):Boolean;
Var TT:TQuery;
begin GetSQLOraBol:=False;
    Try
      TT:=TQuery.Create(Nil);
      Try
      TT.DataBaseName:=DataBaseName;
      TT.SessionName:=SessionName;
      TT.SQL.Clear;
      TT.SQL.Add(SQL);
      TT.Open;
      if (TT.EOF) and (TT.BOF)
         then begin GetSQLOraBol:=False; Valor:=False; end
         else begin Valor:=(Trim(TT.FieldByName(Campo).AsString)='V');
                    GetSQLOraBol:=True;
              end;
      Finally
      TT.Free;
      end;
    Except
       if ShowError then Raise;
    end;

end;

Function  IncSQL(Tabla,Campo:String; DataBaseName:String; SessionName:string; Var Valor:LongInt; ShowError:Boolean):Boolean;
begin Result:=False;
      Valor:=-1;
      if (GetSQLInt('SELECT NVL(MAX('+Campo+')+1,1) AS '+CAMPO+' FROM '+Tabla,DataBaseName,SessionName,Campo,Valor,ShowError))
       and(RunSQL('UPDATE '+Tabla+' SET '+Campo+'='+IntToStr(Valor),DataBaseName,SessionName,ShowError))
       then Result:=True;
end;


Function SQLFecha(Fecha:TDateTime):String;
begin SQLFecha:='TO_DATE('+#39+FormatDateTime('DD/MM/YYYY',Fecha)+#39+','+#39+'DD/MM/YYYY'+#39+')';
end;

Function Nvl(Dato: String):String;
begin
	If Dato = '' Then Result := 'NULL'
   else Result := Dato;
end;

end.
