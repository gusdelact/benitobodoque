{
 Sistema: Sistemas de Captación
 Fecha de Inicio: 18-JUL-2011
 Función forma: Validación de las fechas de consultas de DV_TRANSACCION -> HDV_TRANSACCION
 Desarrollo por: Carlos A Pinacho M
 Modifico:
 Fecha de Modificación:
 Comentarios:
 Variables globales:
}
unit UnValDvTrans;

interface


uses
  Dialogs ,Controls
  ,Sysutils
  ,InterApl
  ,UnSQL2
  ,DBTables
  ,classes;

  Type
    TFechaIF = (fIni, fFin, fUni, fMay);

const

  cdbLink_DES = '@HIST2';     // DBLINK DESARROLLO para la tabla histórica HDV_TRANSACCION
  cdbLink_PRO = '@HIST';      // DBLINK PRODUCCION para la tabla histórica HDV_TRANSACCION
  cControlDVT  = '&0';   // Marcador de tablas DV_TRANSACCION
  cControlIni = '&1';    // Marcador de fecha inicial
  cControlFin = '&2';    // Marcador de fecha final
  cControlUni = '&3';    // Marcador de fecha única
  cControlMay = '&4';    // Marcador de fecha mayor igual

// REGRESA CONSULTA CUADO FECHA -> BETWEEN
function fValidaFechasDvTransaccion( aSQLText : String; aApli : TInterApli ) : String;
// REGRESA LA TABLA DE CONSULTA [DV_TRANSACCION, HDV_TRANSACCION]
function fValTableDvTans ( aFecha : TDateTime;  aApli : TInterApli ) : String; overload;
// REGRESA LA TABLA DE CONSULTA [DV_TRANSACCION, HDV_TRANSACCION]
function fValTableDvTans ( aFecha, aFechaLim : TDateTime ) : String; overload;
function fDameFechaLimiteDvTransaccionEnLinea( aApli : TInterApli ) : TDateTime;
//procedure pValidaTransaccionDvTransaccion( var aQuery : TQuery; aApli : TInterApli );


function setSQLFechaVal( aFecha:TDateTime; aTipoFecha : TFechaIF) : String;

function fSetBetween(aFechaI, aFechaF : TDate ) : String; overload;
function fSetBetween(aFechaI, aFechaF : String ) : String; overload;
function fDameDbLink : String;

var
  dbLink : String;

implementation
{******************************************************************************************************
*******************************************************************************************************}
function fDameDbLink : String;
begin
   if ParamStr(1) = 'P' then
     Result := cdbLink_PRO
   else
     Result := cdbLink_DES;
end;

{******************************************************************************************************
*******************************************************************************************************}
function fSetBetween(aFechaI, aFechaF : String ) : String; overload;
begin
  Result :=
   ' TO_DATE('+
              QuotedStr(cControlIni+FormatDateTime('DD/MM/YYYY', StrToDate(aFechaI)))+','+
              QuotedStr('DD/MM/YYYY')+ ')' +
  ' AND '+
  'TO_DATE('+
              QuotedStr(cControlFin+FormatDateTime('DD/MM/YYYY', StrToDate(aFechaF)))+','+
              QuotedStr('DD/MM/YYYY')+ ') ';
end;
{******************************************************************************************************
*******************************************************************************************************}
  function fSetBetween(aFechaI, aFechaF : TDate ) : String;
begin
  Result :=
   ' TO_DATE('+
              QuotedStr(cControlIni+FormatDateTime('DD/MM/YYYY', aFechaI))+','+
              QuotedStr('DD/MM/YYYY')+ ')' +
  ' AND '+
  'TO_DATE('+
              QuotedStr(cControlFin+FormatDateTime('DD/MM/YYYY', aFechaF))+','+
              QuotedStr('DD/MM/YYYY')+ ') ';
end;
{******************************************************************************************************
*******************************************************************************************************}
function setSQLFechaVal( aFecha:TDateTime; aTipoFecha : TFechaIF) : String;
var // Formato de fecha para ORACLE con incrustación de caracter de control
  vControl : String;
begin                 
  case aTipoFecha of
   fIni : vControl := cControlIni;
   fFin : vControl := cControlFin;
   fUni : vControl := cControlUni;
   fMay : vControl := cControlMay;
  end;
  Result := ' TO_DATE('+
  QuotedStr(
  vControl+
  FormatDateTime('DD/MM/YYYY', aFecha))+
  ','+
  QuotedStr('DD/MM/YYYY')+') ';
end;
{******************************************************************************************************
******************************************************************************************************}
function fValTableDvTans ( aFecha : TDateTime;  aApli : TInterApli ) : String;
begin // REGRESA LA TABLA (DV_TRANSACCION ó HDV_TRANSACCION) según fecha

    if aFecha < fDameFechaLimiteDvTransaccionEnLinea(aApli) then
      Result := ' HDV_TRANSACCION' + fDameDbLink + ' '
    else
      Result := ' DV_TRANSACCION ';
end;
{******************************************************************************************************
*******************************************************************************************************}
function fValTableDvTans ( aFecha, aFechaLim : TDateTime ) : String;
begin // REGRESA LA TABLA (DV_TRANSACCION ó HDV_TRANSACCION) según fechas

    if aFecha < aFechaLim then
      Result := 'HDV_TRANSACCION ' + fDameDbLink  +' '
    else
      Result := ' DV_TRANSACCION ';
end;
{******************************************************************************************************
*******************************************************************************************************}
function fDameFechaLimiteDvTransaccionEnLinea( aApli : TInterApli ) : TDateTime;
var
  FechaValStr: String;
begin
    // Obtiene la fecha minima limite de DV_TRANSACCION
    GetSQLStr('SELECT TRUNC((TRUNC(SYSDATE, ''YEAR'')-1),''YEAR'') AS FECHA FROM DUAL',
              aApli.DatabaseName, aApli.SessionName, 'FECHA', FechaValStr, False );
    Result := StrToDate(FechaValStr);
    //--------------------------------------------------
end;

{******************************************************************************************************
*******************************************************************************************************}
function fValidaFechasDvTransaccion( aSQLText : String; aApli : TInterApli ) : String;
var
  vFechaIni, vFechaFin, vFechaUni, vFechaMay, vFechaAux, FechaCorteDvT : TDate;
  vPos1, vPos2 : Integer;
  //FechaValStr: String;
  vSqlText, vSqlTextUNION, vStrTemp : String;
  vResult, vOrderBy, vUNION : String;
  vB_CtrlUni : Boolean;
  vConsultaFile : TStringList;
begin
  try
    vConsultaFile := TStringList.Create;

    vUNION := '';
    vSqlTextUNION := '';
    vSqlText := aSQLText;

    // Obtiene la fecha minima limite de DV_TRANSACCION
    FechaCorteDvT := fDameFechaLimiteDvTransaccionEnLinea(aApli);
    //--------------------------------------------------


    vPos1 := Pos(cControlUni, vSqlText); // Busca el caracter de control de fecha única -> Ej. F_LIQUIDACION = '01/01/2011'
    if vPos1 > 0 then
    begin
      vStrTemp :=  Copy( vSqlText,  (vPos1 + 2),  10);
      vFechaUni :=  StrToDate(vStrTemp);
      vSqlText :=  StringReplace(vSqlText,  cControlUni, '', [rfReplaceAll]);  // Quita caracter de contro fecha unica
      if (vFechaUni >= FechaCorteDvT) then
      begin // Si la fecha de consulta es mayor a la fecha minima de DV_TRANSACCION:
        vSqlText :=  StringReplace(vSqlText,  cControlDVT, '', [rfReplaceAll]); // Quita caracter de control de la tabla DV_TRANSACCION
      end
      else
      begin // La fecha de consulta es para la tabla histórica
        vSqlText := StringReplace(UpperCase(vSqlText), // Resplaza DV_TRANSACCION -> HDV_TRANSACCION
                      cControlDVT +'DV_TRANSACCION',
                      'HDV_TRANSACCION'+fDameDbLink, [rfReplaceAll]);
      end;
    end
    else
    begin
      vPos1 := Pos(cControlMay, vSqlText); // Busca el caracter de control de fecha mayor ó mayor igual -> Ej. F_LIQUIDACION >= '01/01/2011'
      if  vPos1 > 0  then
      begin

        vStrTemp :=  Copy( vSqlText,  (vPos1 + 2),  10);
        vFechaMay :=  StrToDate(vStrTemp);

        if (vFechaMay >= FechaCorteDvT) then
        begin // Si la fecha de consulta es mayor a la fecha minima de DV_TRANSACCION:
          vSqlText :=  StringReplace(vSqlText,  cControlDVT, '', [rfReplaceAll]); // Quita caracter de control de la tabla DV_TRANSACCION
          vSqlText :=  StringReplace(vSqlText,  cControlMay, '', [rfReplaceAll]);  // Quita caracter de contro fecha unica
        end
        else
        begin // La fecha de consulta es para la tabla histórica
          {---------- Quita y Guarda ORDER BY [...] para 'UNION' ----------}
          {----------------------------------------------------------------}

          vPos1 := Pos('ORDER BY', UpperCase( vSqlText ));
          if vPos1 <> 0 then
          begin
            vOrderBy := Copy( vSqlText, vPos1-1, Length( vSqlText ) - vPos1+5);
            vSqlText := Copy( vSqlText, 1 , vPos1-1);
          end;
          {----------------------------------------------------------------}
          {----------------------------------------------------------------}

          // replica Query y Remplaza DV_TRANSACCION --> HDV_TRANSACCION +dbLink, ajusta fechas de consultas.

          vSqlTextUNION :=  StringReplace(UpperCase(vSqlText), cControlDVT+'DV_TRANSACCION', 'HDV_TRANSACCION'+fDameDbLink, [rfReplaceAll]);
          vSqlTextUNION :=  StringReplace(UpperCase(vSqlTextUNION), cControlMay+FormatDateTime('DD/MM/YYYY', vFechaMay)+''','+QuotedStr('DD/MM/YYYY')+')',
                                         FormatDateTime('DD/MM/YYYY', vFechaMay) +''','+QuotedStr('DD/MM/YYYY')+')'+ ' AND F_LIQUIDACION < TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY', FechaCorteDvT))+
                                                                                                      ','+QuotedStr('DD/MM/YYYY')+')', [rfReplaceAll]);

          vSqlText :=  StringReplace(vSqlText,  cControlMay, '', [rfReplaceAll]);  // Quita caracter de contro fecha mayor
          vSqlText :=  StringReplace(vSqlText,  cControlDVT, '', [rfReplaceAll]);  // Quita marca DV_TANSACCION
          vSqlText :=  StringReplace(vSqlText,  cControlMay+FormatDateTime('DD/MM/YYYY', vFechaMay),  // Set fecha limite
                                                            FormatDateTime('DD/MM/YYYY', FechaCorteDvT), [rfReplaceAll]);

          vUNION :=  #10+#13+' UNION '+#10+#13 ;

        end;

      end
      else
      begin
          {------------------------ BETWEEN -------------------------------------}
          {----------------------------------------------------------------------}
          vPos1 := Pos(cControlIni, vSqlText);
          if vPos1 = 0 then
          begin
            raise EVariantError.CreateFmt(
            'No se encontró carácter de control %s',
            [cControlIni]);
          end;
          {-----------------------------------------------------------------------}
          vStrTemp :=  Copy( vSqlText,  (vPos1 + 2),  10);
          vFechaIni :=  StrToDate(vStrTemp);
          vPos1 := Pos(cControlFin, vSqlText);

          if vPos1 = 0 then
          begin
            raise EVariantError.CreateFmt(
            'No se encontró carácter de control %s',
            [cControlFin]);
          end;

          {---------- Quita y Guarda ORDER BY [...] para 'UNION' ----------}
          {----------------------------------------------------------------}
          vStrTemp :=  Copy( vSqlText,  (vPos1 + 2),  10);
          vFechaFin :=  StrToDate(vStrTemp);
          vPos1 := Pos('ORDER BY', UpperCase( vSqlText ));

          if vPos1 <> 0 then
          begin
            vOrderBy := Copy( vSqlText, vPos1-1, Length( vSqlText ) - vPos1+5);
            vSqlText := Copy( vSqlText, 1 , vPos1-1);
          end;
          {----------------------------------------------------------------}
          {----------------------------------------------------------------}

          if vFechaIni > vFechaFin then  // Valida Fecha_Inicial Vs. Fecha_Final
          begin
            MessageDlg('La fecha de inicio es mayor a la fecha final.'+#13+#10+'Verifique la consulta.', mtWarning, [mbOK], 0);
            vFechaAux := vFechaIni;
            raise EVariantError.CreateFmt(
            'La fecha de inicio en mayor a la fecha final.'+#13+#10+'Verifique la consulta.',
            ['']);
          end;

          if ((vFechaIni >= FechaCorteDvT) and (vFechaFin >= FechaCorteDvT)) then // Si las dos fechas son mayores a la fecha de vlidación:
          begin //Quita todos los caracteres de control y regresa la misma consulta
            vSqlText :=  StringReplace(vSqlText,  cControlDVT, '', [rfReplaceAll]);
            vSqlText :=  StringReplace(vSqlText,  cControlIni, '', [rfReplaceAll]);
            vSqlText :=  StringReplace(vSqlText,  cControlFin, '', [rfReplaceAll]);
          end
          else
          begin
            if ((vFechaIni < FechaCorteDvT) and (vFechaFin < FechaCorteDvT)) then  // Si las dos fecha son menores a la fecha de validación:
            begin // Remplaza DV_TRANSACCION --> HDV_TRANSACCION +dbLink
              vSqlText := StringReplace(UpperCase(vSqlText),  cControlDVT +'DV_TRANSACCION', 'HDV_TRANSACCION'+fDameDbLink, [rfReplaceAll]);
              vSqlText :=  StringReplace(vSqlText, cControlIni, '', [rfReplaceAll]);  // Quita marca
              vSqlText :=  StringReplace(vSqlText, cControlFin, '', [rfReplaceAll]);  // Quita marca
            end
            else
            begin
              // replica Query y Remplaza DV_TRANSACCION --> HDV_TRANSACCION +dbLink, ajusta fechas de consultas.
              vSqlTextUNION :=  StringReplace(UpperCase(vSqlText), cControlDVT+'DV_TRANSACCION', 'HDV_TRANSACCION'+fDameDbLink, [rfReplaceAll]);
              vSqlTextUNION :=  StringReplace(vSqlTextUNION, cControlIni, '', [rfReplaceAll]); // Quita marca
              vSqlTextUNION :=  StringReplace(vSqlTextUNION, cControlFin+FormatDateTime('DD/MM/YYYY', vFechaFin),   // Set fecha limite
                                                                         FormatDateTime('DD/MM/YYYY', FechaCorteDvT-1), [rfReplaceAll]);

              vSqlText :=  StringReplace(vSqlText,  cControlDVT, '', [rfReplaceAll]);  // Quita marca
              vSqlText :=  StringReplace(vSqlText,  cControlIni+FormatDateTime('DD/MM/YYYY', vFechaIni),  // Set fecha limite
                                                                FormatDateTime('DD/MM/YYYY', FechaCorteDvT), [rfReplaceAll]);
              vSqlText :=  StringReplace(vSqlText,  cControlFin, '', [rfReplaceAll]); // Quita marca

              vUNION := #10+#13+' UNION ALL '+#10+#13;

            end;
          end;
          {----------------------------------------------------------------------}
          {----------------------------------------------------------------------}
      end;
    end;
      vResult :=  vSqlText + vUNION + vSqlTextUNION + vOrderBy;  // Arma query
//      ShowMessage(vResult);
      vConsultaFile.Text := vResult;
      vConsultaFile.SaveToFile('C:\aConsultaValida1.sql');
      Result := vResult;
      vConsultaFile.Free;
  except
    on E: Exception do
      MessageDlg(E.Message, mtWarning, [mbOK], 0);
  end;

end;

end.
