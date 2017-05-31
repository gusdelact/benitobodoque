unit IntMQrCarFinq;
// Comentarios     : Correccion al Error
interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre, UnSQL2, Dialogs, QRExport, InterMemo;
type
  TQrCarFinq = class(TQuickRep)
    qyConsulta: TQuery;
    qrDetalle: TQRBand;
    qrTitulos: TQRBand;
    QRL_Intereses: TQRLabel;
    QRDBT_NumCredito: TQRDBText;
    QRL_Saldo: TQRLabel;
    QRL_FInicio: TQRLabel;
    QRL_NumCredito: TQRLabel;
    QRDBT_FInicio: TQRDBText;
    QRL_ImpDispuesto: TQRLabel;
    QRDBT_ImpDispuesto: TQRDBText;
    QRDBT_Intereses: TQRDBText;
    qyAcreditado: TQuery;
    qyAcreditadoNOMBRE: TStringField;
    qyAcreditadoCALLENUMERO: TStringField;
    qyAcreditadoCOLONIA: TStringField;
    qyAcreditadoMUNICIPIO: TStringField;
    qyAcreditadoESTADO: TStringField;
    qyAcreditadoPAIS: TStringField;
    qyAcreditadoCODIGO_POSTAL: TStringField;
    qyAcreditadoMPIO_PAIS: TStringField;
    QRDBT_ImpAdeudo: TQRDBText;
    qyConsultaID_CREDITO: TStringField;
    qyConsultaF_INICIO: TStringField;
    qyConsultaIMP_DISPUESTO: TStringField;
    qyConsultaIMP_ADEUDO: TStringField;
    qyConsultaIMP_INTERES: TStringField;
    PageFooterBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRShape_Firma1: TQRShape;
    QRShape_Firma1_2: TQRShape;
    QRShape_Firma2: TQRShape;
    QRL_Firma2: TQRLabel;
    QRL_Puesto2: TQRLabel;
    QRL_Puesto1_2: TQRLabel;
    QRL_Firma1_2: TQRLabel;
    QRL_Firma1: TQRLabel;
    QRL_Puesto1: TQRLabel;
    QRMemo_PiePagina: TQRMemo;
    QRInterMemo_FinCarta: TQRInterMemo;
    PageHeaderBand1: TQRBand;
    QRL_FechaEmision: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabelAtencionA: TQRLabel;
    QRL_DirigidoA: TQRLabel;
    QRL_Puesto: TQRLabel;
    QRInterMemo_Encabezado: TQRInterMemo;
  private

  public
     Apli : TInterApli;
     Function GeneraSQL(ListaCreditos : TStringList) : String;
     Function GeneraSQLTitular(sTipoFormato, Id_Llave:String) : String;
     Function MesEnTexto(peNumMes:Integer):String;
     Function EncabezadoCarta(sTipoFormato,sLinea,sNombreTit,
                     sF_HastaInfo, sImpLinea, sReferencia:String; IncluirLin:Boolean;
                     nCreditos:Integer):String;
     Function FinCArta(sTipoFormato:String; nCreditos:Integer):String;
  end;
var
  QrCarFinq: TQrCarFinq;

Procedure ReporteCartaFiniquito(sTipoFormato, sF_Elaboracion,
                                sF_Fin_Info, sAtencion,
                                sNomAtencion, sPuestoAtencion,
                                sPersona1Firma, sPersona2Firma,
                                sPuesto1Firma, sPuesto2Firma,
                                sContrato, sImpAutoLinea :String;
                                sQryDatos :String;
                                sReferencia:String;
                                PiePagina : TStrings;
                                IncluirLin, IncluirInt : Boolean;
                                nCopias   :Integer;
                                pAPli     : TInterApli;
                                pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure ReporteCartaFiniquito(  sTipoFormato, sF_Elaboracion,
                                  sF_Fin_Info, sAtencion,
                                  sNomAtencion, sPuestoAtencion,
                                  sPersona1Firma, sPersona2Firma,
                                  sPuesto1Firma, sPuesto2Firma,
                                  sContrato, sImpAutoLinea :String;
                                  sQryDatos :String;
                                  sReferencia:String;
                                  PiePagina : TStrings;
                                  IncluirLin, IncluirInt : Boolean;
                                  nCopias   :Integer;
                                  pAPli     : TInterApli;
                                  pPreview  : Boolean);
Var
   QrCarFinq   : TQrCarFinq;
   Preview     : TIntQRPreview;
   vlYear, vlMonth, vlDay: Word;
   nCreditos   : Integer;
   nRow        : Integer;
Begin
   QrCarFinq   := TQrCarFinq.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrCarFinq);
   QrCarFinq.Apli := pAPli;
   QrCarFinq.PrintIfEmpty := True;
   Try
      // Dirigido A
      QrCarFinq.qyAcreditado.DatabaseName := pApli.DataBaseName;
      QrCarFinq.qyAcreditado.SessionName := pApli.SessionName;

      QrCarFinq.qyAcreditado.Active:=False;
      QrCarFinq.qyAcreditado.SQL.Clear;

      QrCarFinq.qyAcreditado.SQL.Add(QrCarFinq.GeneraSQLTitular(sTipoFormato,sContrato));
      QrCarFinq.qyAcreditado.Active:=True;

      // Fecha de Carta
      DecodeDate(StrToDate(sF_Elaboracion), vlYear, vlMonth, vlDay);
      QrCarFinq.QRL_FechaEmision.Caption := 'México D.F. a ' + IntToStr(vlDay) + ' de ' + QrCarFinq.MesEnTexto(vlMonth) + ' de ' + IntToStr(vlYear) + '.';

      //Visualiza campos detalle
      case StrToInt(sTipoFormato) of
      1: begin
           QrCarFinq.QRL_Saldo.Enabled := False;
           QrCarFinq.QRDBT_ImpAdeudo.Enabled := False;
           QrCarFinq.QRL_Intereses.Enabled := False;
           QrCarFinq.QRDBT_Intereses.Enabled := False;

           QrCarFinq.qrl_NumCredito.Left := 137;
           QrCarFinq.QRDBT_NumCredito.Left := 134;
           QrCarFinq.QRL_FInicio.Left := 248;
           QrCarFinq.QRDBT_FInicio.Left := 257;
           QrCarFinq.QRL_ImpDispuesto.Left := 410;
           QrCarFinq.QRDBT_ImpDispuesto.Left := 358;
         end;
      2: begin
           QrCarFinq.QRL_Saldo.Enabled := False;
           QrCarFinq.QRDBT_ImpAdeudo.Enabled := False;
           QrCarFinq.QRL_Intereses.Enabled := False;
           QrCarFinq.QRDBT_Intereses.Enabled := False;

           QrCarFinq.qrl_NumCredito.Left := 137;
           QrCarFinq.QRDBT_NumCredito.Left := 134;
           QrCarFinq.QRL_FInicio.Left := 248;
           QrCarFinq.QRDBT_FInicio.Left := 257;
           QrCarFinq.QRL_ImpDispuesto.Left := 410;
           QrCarFinq.QRDBT_ImpDispuesto.Left := 358;
         end;
      3: Begin
           QrCarFinq.QRL_Saldo.Enabled := True;
           QrCarFinq.QRDBT_ImpAdeudo.Enabled := True;
           If IncluirInt then
           begin
             QrCarFinq.QRL_Intereses.Enabled := True;
             QrCarFinq.QRDBT_Intereses.Enabled := True;

             QrCarFinq.qrl_NumCredito.Left := 1;
             QrCarFinq.QRDBT_NumCredito.Left := 0;
             QrCarFinq.QRL_FInicio.Left := 104;
             QrCarFinq.QRDBT_FInicio.Left := 115;
             QrCarFinq.QRL_ImpDispuesto.Left := 266;
             QrCarFinq.QRDBT_ImpDispuesto.Left := 216;
             QrCarFinq.QRL_Saldo.Left := 395;
             QrCarFinq.QRDBT_ImpAdeudo.Left := 360;
             QrCarFinq.QRL_Intereses.Left := 562;
             QrCarFinq.QRDBT_Intereses.Left := 492;
           end
           else
           begin
             QrCarFinq.QRL_Intereses.Enabled := False;
             QrCarFinq.QRDBT_Intereses.Enabled := False;

             QrCarFinq.qrl_NumCredito.Left := 57;
             QrCarFinq.QRDBT_NumCredito.Left := 54;
             QrCarFinq.QRL_FInicio.Left := 160;
             QrCarFinq.QRDBT_FInicio.Left := 169;
             QrCarFinq.QRL_ImpDispuesto.Left := 322;
             QrCarFinq.QRDBT_ImpDispuesto.Left := 270;
             QrCarFinq.QRL_Saldo.Left := 451;
             QrCarFinq.QRDBT_ImpAdeudo.Left := 414;
           end;
         end;
      4: Begin
           QrCarFinq.qrTitulos.Enabled := False;
           QrCarFinq.QRLabelAtencionA.Top := 185;
           QrCarFinq.QRL_DirigidoA.Top := 185;
           QrCarFinq.qrl_puesto.Top := 205;
           QrCarFinq.PageHeaderBand1.Height := 380;
           QrCarFinq.QRInterMemo_Encabezado.Height := 240;
           QrCarFinq.QRInterMemo_Encabezado.Top := 270;
           QrCarFinq.PageFooterBand1.Height := 480;
           QrCarFinq.QRMemo_PiePagina.Top := 420;
         end;
      end;
      // Abre Query para detalle de créditos
      QrCarFinq.qyConsulta.DatabaseName := pApli.DataBaseName;
      QrCarFinq.qyConsulta.SessionName := pApli.SessionName;

      QrCarFinq.qyConsulta.Active:=False;
      QrCarFinq.qyConsulta.SQL.Clear;

      If StrToInt(sTipoFormato) <> 4 then
        QrCarFinq.qyConsulta.SQL.Add(sQryDatos)
      Else
        QrCarFinq.qyConsulta.SQL.Add('SELECT '' '' AS ID_CREDITO, '' '' AS F_INICIO, '' '' AS IMP_DISPUESTO, '' '' AS IMP_ADEUDO, '' '' AS IMP_INTERES FROM DUAL');

      QrCarFinq.qyConsulta.Active:=True;
      nCreditos := QrCarFinq.qyConsulta.RecordCount;


      // En atención A:
      If sAtencion = 'P' then
      begin
         QrCarFinq.QRL_Puesto.Enabled := True;
         QrCarFinq.QRL_DirigidoA.Caption :=  sNomAtencion;
         QrCarFinq.QRL_Puesto.Caption := sPuestoAtencion;
      end
      else
      begin
         QrCarFinq.QRL_Puesto.Enabled := False;
         QrCarFinq.QRL_DirigidoA.Caption :=  'A QUIEN CORRESPONDA';
         QrCarFinq.QRL_Puesto.Caption := '';
         QrCarFinq.QRLabelAtencionA.Top := 166;
         QrCarFinq.QRL_DirigidoA.Top := 166;
         QrCarFinq.QRLabelAtencionA.Left := 335;
         QrCarFinq.QRL_DirigidoA.Left := 400;
      end;

      // Inicio de carta
      QrCarFinq.QRInterMemo_Encabezado.Textos.Clear;
      QrCarFinq.QRInterMemo_Encabezado.Textos.Add(
                QrCarFinq.EncabezadoCarta(sTipoFormato, trim(sContrato),
                                          QrCarFinq.qyAcreditado.FieldByName('NOMBRE').AsString,
                                          sF_Fin_Info, trim(sImpAutoLinea), sReferencia, IncluirLin, nCreditos) );
      // Fin de Carta
      QrCarFinq.QRInterMemo_FinCarta.Textos.Clear;
      If (StrToInt(sTipoFormato) < 3) then
      begin
        QrCarFinq.QRInterMemo_FinCarta.Textos.Add(QrCarFinq.FinCArta(sTipoFormato,nCreditos));
        QrCarFinq.QRInterMemo_FinCarta.Textos.Add('');
        QrCarFinq.QRInterMemo_FinCarta.Textos.Add('');
      end;
      QrCarFinq.QRInterMemo_FinCarta.Textos.Add('Se extiende la presente a petición del interesado para los fines que tenga a bien ordenar.');

      // Firmas
      If (sPersona1Firma<>'') and (sPersona2Firma<>'') then
      begin
         QrCarFinq.QRShape_Firma1.Enabled := True;
         QrCarFinq.QRShape_Firma2.Enabled := True;
         QrCarFinq.QRShape_Firma1_2.Enabled := False;
         QrCarFinq.QRL_Firma1.Enabled := True;
         QrCarFinq.QRL_Firma2.Enabled := True;
         QrCarFinq.QRL_Firma1_2.Enabled := False;
         QrCarFinq.QRL_Puesto1.Enabled := True;
         QrCarFinq.QRL_Puesto2.Enabled := True;
         QrCarFinq.QRL_Puesto1_2.Enabled := False;

         QrCarFinq.QRL_Firma1.Caption := sPersona1Firma;
         QrCarFinq.QRL_Puesto1.Caption := sPuesto1Firma;
         QrCarFinq.QRL_Firma2.Caption := sPersona2Firma;
         QrCarFinq.QRL_Puesto2.Caption := sPuesto2Firma;
      end
      else
      begin
        QrCarFinq.QRShape_Firma1.Enabled := False;
        QrCarFinq.QRShape_Firma2.Enabled := False;
        QrCarFinq.QRShape_Firma1_2.Enabled := True;
        QrCarFinq.QRL_Firma1.Enabled := False;
        QrCarFinq.QRL_Firma2.Enabled := False;
        QrCarFinq.QRL_Firma1_2.Enabled := True;
        QrCarFinq.QRL_Puesto1.Enabled := False;
        QrCarFinq.QRL_Puesto2.Enabled := False;
        QrCarFinq.QRL_Puesto1_2.Enabled := True;

        If (sPersona1Firma<>'') then
        begin
          QrCarFinq.QRL_Firma1_2.Caption := sPersona1Firma;
          QrCarFinq.QRL_Puesto1_2.Caption := sPuesto1Firma;
        end;
        If (sPersona2Firma<>'') then
        begin
          QrCarFinq.QRL_Firma1_2.Caption := sPersona2Firma;
          QrCarFinq.QRL_Puesto1_2.Caption := sPuesto2Firma;
        end;
      end;

      For nRow := 0 to PiePagina.Count -1 do
      begin
        QrCarFinq.QRMemo_PiePagina.Lines.Add(PiePagina[nRow]);
      end;
      // se asigna el número de copias
      QrCarFinq.PrinterSettings.Copies := nCopias;
      
      If pPreview Then
         QrCarFinq.Preview
      Else
         QrCarFinq.Print;
   Finally
      QrCarFinq.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

{ TQrCarFinq }

Function TQrCarFinq.EncabezadoCarta(sTipoFormato, sLinea, sNombreTit,
                  sF_HastaInfo, sImpLinea, sReferencia: String; IncluirLin:Boolean;
                  nCreditos:Integer):String;
var
  vAux : String;
  vlYear, vlMonth, vlDay: Word;
begin
  case StrToInt(sTipoFormato) of
    1: Begin
         if nCreditos > 1 then
            vAux := 'Hacemos referencia a los financiamientos otorgados a ' + sNombreTit
         else
            vAux := 'Hacemos referencia al financiamiento otorgado a ' + sNombreTit;
         if IncluirLin then
            vAux := vAux + ' (Línea de Crédito ' + sLinea + ' por $' + sImpLinea + ')';
         vAux := vAux + ', por Banco Interacciones, S.A. ' +
                 'Institución de Banca Múltiple, Grupo Financiero Interacciones, que a continuación se detallan:';
       end;

    2: Begin
         if nCreditos > 1 then
            vAux := 'Hacemos referencia a los financiamientos otorgados a ' + sNombreTit
         else
            vAux := 'Hacemos referencia al financiamiento otorgado a ' + sNombreTit;
         if IncluirLin then
            vAux := vAux + ' (Línea de Crédito ' + sLinea + ' por $' + sImpLinea + ')';
         vAux := vAux + ' por Banco Interacciones, S.A. Institución de Banca ' +
                 'Múltiple, Grupo Financiero Interacciones, que a continuación se detallan:';
       end;

    3: Begin
         DecodeDate(StrToDate(sF_HastaInfo), vlYear, vlMonth, vlDay);
         if nCreditos > 1 then
            vAux := 'Hacemos referencia a los financiamientos otorgados a ' + sNombreTit
         else
            vAux := 'Hacemos referencia al financiamiento otorgado a ' + sNombreTit;
         if IncluirLin then
            vAux := vAux + ' (Línea de Crédito ' + sLinea + ' por $' + sImpLinea + ')';
         vAux := vAux + ', por Banco Interacciones, S.A. ' +
                 'Institución de Banca Múltiple, Grupo Financiero Interacciones, ' +
                 'que al ' + IntToStr(vlDay) + ' de ' +  QrCarFinq.MesEnTexto(vlMonth) + ' de ' + IntToStr(vlYear) +
                 ', reporta un adeudo que a continuación se detalla:';
       end;
    4: Begin
         vAux := sReferencia + ', nos permitimos informarle que ' +
                 sNombreTit + ', a la fecha carece de obligaciones crediticias contraídas con ' +
                 'Banco Interacciones, S. A., Institución de Banca Múltiple, Grupo Financiero Interacciones.';
       end;
  end;

  Result := vAux;

end;

function TQrCarFinq.FinCArta(sTipoFormato: String; nCreditos:Integer): String;
var
  vAux : String;
begin

  case StrToInt(sTipoFormato) of
    1: if nCreditos = 1 then
          vAux := 'Sobre el particular, nos permitimos informarle que dicho crédito a la fecha, ' +
                  'ha sido liquidado en su totalidad, por lo que no se adeuda a esta Institución ' +
                  'de Crédito, cantidad alguna derivada del mismo.'
       else
          vAux := 'Sobre el particular, nos permitimos informarle que dichos créditos a la fecha, ' +
                  'han sido liquidados en su totalidad, por lo que no se adeuda a esta Institución ' +
                  'de Crédito, cantidad alguna derivada de los mismos.';

    2: if nCreditos = 1 then
          vAux := 'Sobre el particular, nos permitimos informarle que dicho crédito a la fecha, ' +
                  'se encuentra al corriente en sus pagos de las obligaciones contraídas con el banco.'
       else
          vAux := 'Sobre el particular, nos permitimos informarle que dichos créditos a la fecha, ' +
                  'se encuentran al corriente en sus pagos de las obligaciones contraídas con el banco.';

    3: vAux := '';
    4: vAux := '';
  end;

  Result := vAux;
end;

function TQrCarFinq.GeneraSQL(ListaCreditos : TStringList): String;
Var
   sSQL : String;
   vlListaCreditos :String;
   nRow : Integer;
Begin
   vlListaCreditos := '';
   for nRow := 0 to ListaCreditos.Count -1 do
   begin
     If nRow = 0 then
        vlListaCreditos := ListaCreditos.Strings[nRow]
     else
        vlListaCreditos := vlListaCreditos + ', ' + ListaCreditos.Strings[nRow];
   end;

   sSQL:=
         'SELECT CRE.ID_CONTRATO, CON.IMP_AUTORIZADO, CRE.ID_CREDITO, CRE.F_INICIO, ' +
                 'CRE.IMP_DISPUESTO, CRE.SDO_INSOLUTO, CRE.SIT_CREDITO ' +
         'FROM CR_CREDITO CRE, CR_CONTRATO CON ' +
         'WHERE CRE.ID_CONTRATO = CON.ID_CONTRATO ' +
           'AND CRE.ID_CREDITO IN ( ' + vlListaCreditos + ') ';
   Result:= sSQL;
end;

function TQrCarFinq.GeneraSQLTitular(sTipoFormato, Id_Llave: String): String;
Var
   sSQL:String;
begin
   sSQL :=
           ' SELECT PR.NOMBRE, ' +
//           ' D.CALLE_NUMERO || '' '' || D.NUM_EXTERIOR || '' '' || D.NUM_INTERIOR AS CALLENUMERO, ' +
           ' D.CALLE_NUMERO AS CALLENUMERO, ' +
           ' D.COLONIA AS COLONIA, ' +
	   ' (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION=D.CVE_CIUDAD) AS MUNICIPIO, ' +
           ' (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION=D.CVE_ESTADO) AS ESTADO, ' +
           ' (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION=D.CVE_PAIS) AS PAIS, ' +
	   '(SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION=D.CVE_ESTADO) || '', '' || ' +
	   '   (SELECT DESC_POBLACION FROM POBLACION WHERE CVE_POBLACION=D.CVE_PAIS) AS MPIO_PAIS, ' +
           ' D.CODIGO_POSTAL ' +
           ' FROM PERSONA PR, DOMICILIO D ' +
           ' WHERE PR.ID_DOMICILIO = D.ID_DOMICILIO ';

   if StrToInt(sTipoFormato) <> 4 then
      sSQL := sSQL + ' AND PR.ID_PERSONA = (SELECT ID_TITULAR FROM CONTRATO WHERE ID_CONTRATO = ' + Id_Llave + ') '
   else
      sSQL := sSQL + ' AND PR.ID_PERSONA = ' + Id_Llave;

   Result := sSQL;
end;

function TQrCarFinq.MesEnTexto(peNumMes: Integer): String;
var
  MesTexto: array[1..12] of string;
begin
  MesTexto[1]  := 'Enero';
  MesTexto[2]  := 'Febrero';
  MesTexto[3]  := 'Marzo';
  MesTexto[4]  := 'Abril';
  MesTexto[5]  := 'Mayo';
  MesTexto[6]  := 'Junio';
  MesTexto[7]  := 'Julio';
  MesTexto[8]  := 'Agosto';
  MesTexto[9]  := 'Septiembre';
  MesTexto[10] := 'Octubre';
  MesTexto[11] := 'Noviembre';
  MesTexto[12] := 'Diciembre';

  Result := MesTexto[peNumMes];
end;



End.

