unit IntCrQrCompSeP;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead,
  InterApl, IntQRPreview, IntGenCre,UnSQL2, QRExport, Db, DBTables,
  TeeProcs, TeEngine, Chart, DBChart, QRTee, Series;

type
  TQrCrCompSeP = class(TQuickRep)
    TitleBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRGroup1: TQRGroup;
    QR4TYAnt: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QR1TYAct: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QR4TYAct: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel131: TQRLabel;
    QRFecha: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    DetailBand1: TQRBand;
    qrTxtTitulos: TQRDBText;
    QRImp_T4YAnt: TQRDBText;
    QRPct_T4YAnt: TQRDBText;
    QRImp_T1YAct: TQRDBText;
    QRPct_T1YAct: TQRDBText;
    QRImp_Saldo_al: TQRDBText;
    QRImp_T1_Diferencia: TQRDBText;
    QRImp_T4YAct: TQRDBText;
    QRPct_T4YAct: TQRDBText;
    QRImp_T4_Diferencia: TQRDBText;
    QRPct_T4_Diferencia: TQRDBText;
    QRBand2: TQRBand;
    QRLeyendaMoneda: TQRLabel;
    QDatos: TQuery;
    QDatosTitulos: TStringField;
    QDatosImp_T4YAnt: TFloatField;
    QDatosPct_T4YAnt: TFloatField;
    QDatosImp_T1YAct: TFloatField;
    QDatosPct_T1YAct: TFloatField;
    QDatosImp_Saldo_al: TFloatField;
    QDatosPct_Saldo_al: TFloatField;
    QDatosImp_T1_Diferencia: TFloatField;
    QDatosPct_T1_Diferencia: TFloatField;
    QDatosImp_T4Yact: TFloatField;
    QDatosPct_T4YAct: TFloatField;
    QDatosImp_T4_Diferencia: TFloatField;
    QDatosPct_T4_Diferencia: TFloatField;
    QLeyendaEntidades: TQuery;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRPct_Saldo_al: TQRDBText;
    QRPct_T1_Diferencia: TQRDBText;
    QRChildBand1: TQRChildBand;
    QRChart2: TQRChart;
    QRDBChart2: TQRDBChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    LineSeries1: TLineSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    LineSeries2: TLineSeries;
    QDatosB_Registro: TFloatField;
    QRChart1: TQRChart;
    QRDBChart1: TQRDBChart;
    Series5: TBarSeries;
    Series6: TBarSeries;
    LineSeries3: TLineSeries;
    Series7: TBarSeries;
    Series8: TBarSeries;
    LineSeries4: TLineSeries;
    QDatosOrden_Estructura: TFloatField;
    QRChart3: TQRChart;
    QRDBChart3: TQRDBChart;
    Series9: TBarSeries;
    Series10: TBarSeries;
    LineSeries5: TLineSeries;
    Series11: TBarSeries;
    Series12: TBarSeries;
    LineSeries6: TLineSeries;
    QRChart4: TQRChart;
    QRDBChart4: TQRDBChart;
    Series13: TBarSeries;
    Series14: TBarSeries;
    LineSeries7: TLineSeries;
    Series15: TBarSeries;
    Series16: TBarSeries;
    LineSeries8: TLineSeries;
    QRLCarta: TQRLabel;
    QRLIntereses: TQRLabel;
    procedure QDatosAfterScroll(DataSet: TDataSet);
  private

  public

  end;

var
  QrCrCompSeP: TQrCrCompSeP;
  procedure RepComparativoSecPub (peFecha: TDateTime; peTipo_Entidad: string; peCartasCredito, peInteresesAnt: boolean; vlQry : TQuery; peFactor: double; Apli: TInterApli; Preview: boolean);

implementation

procedure RepComparativoSecPub (peFecha: TDateTime; peTipo_Entidad: string; peCartasCredito, peInteresesAnt: boolean; vlQry : TQuery; peFactor: double; Apli: TInterApli; Preview: boolean);
var
  QRCrCompSeP: TQrCrCompSeP;
  QrPreview: TIntQRPreview;
begin
  QRCrCompSeP :=  TQRCrCompSeP.Create(Nil);
  QrPreview   := TIntQRPreview.CreatePreview(Application, QRCrCompSeP);

       if  peFactor = 1000000 then QrCrCompSeP.QRLeyendaMoneda.Caption := 'Información expresada en millones de pesos'
  else if peFactor = 1000     then QrCrCompSeP.QRLeyendaMoneda.Caption := 'Información expresada en miles de pesos'
  else if peFactor = 1        then QrCrCompSeP.QRLeyendaMoneda.Caption := 'Información expresada en pesos';

  if peCartasCredito then
        QRCrCompSeP.QRLCarta.Caption := 'Incluye Cartas de Crédito'
      else
        QRCrCompSeP.QRLCarta.Caption := 'No incluye Cartas de Crédito';

      if peInteresesAnt then
        QRCrCompSeP.QRLIntereses.Caption := 'Incluye intereses cobrados por anticipado'
      else
        QRCrCompSeP.QRLIntereses.Caption := 'No incluye intereses cobrados por anticipado';

  try

    QRCrCompSeP.DataSet                     := vlQry;
    QRCrCompSeP.qrTxtTitulos.DataSet        := vlQry;
    QRCrCompSeP.QRImp_T4YAnt.DataSet        := vlQry;
    QRCrCompSeP.QRPct_T4YAnt.DataSet        := vlQry;
    QRCrCompSeP.QRImp_T1YAct.DataSet        := vlQry;
    QRCrCompSeP.QRPct_T1YAct.DataSet        := vlQry;
    QRCrCompSeP.QRImp_Saldo_Al.DataSet      := vlQry;
    QRCrCompSeP.QRPct_Saldo_Al.DataSet      := vlQry;
    QRCrCompSeP.QRImp_T1_Diferencia.DataSet := vlQry;
    QRCrCompSeP.QRPct_T1_Diferencia.DataSet := vlQry;
    QRCrCompSeP.QRImp_T4YAct.DataSet        := vlQry;
    QRCrCompSeP.QRPct_T4YAct.DataSet        := vlQry;
    QRCrCompSeP.QRImp_T4_Diferencia.DataSet := vlQry;
    QRCrCompSeP.QRPct_T4_Diferencia.DataSet := vlQry;


    vlQry.AfterScroll := QRCrCompSeP.QDatosAfterScroll;

    QrCrCompSeP.QR4TYAnt.Caption := Format ('(1) 4T%d', [StrToInt (FormatDateTime ('yyyy', peFecha)) - 1]);
    QrCrCompSeP.QR1TYAct.Caption := Format ('(2) 1T%d', [StrToInt (FormatDateTime ('yyyy', peFecha))]);
    QrCrCompSeP.QRFecha.Caption  := Format ('%s $', [FormatDateTime ('dd/mm/yyyy', peFecha)]);
    QrCrCompSeP.QR4TYAct.Caption := Format ('(4) 4T%d', [StrToInt (FormatDateTime ('yyyy', peFecha))]);


    QrCrCompSeP.Series1.Title  := Format ('(2) 1T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha))]);
    QrCrCompSeP.Series2.Title  := Format ('(3) Saldo al %s', [(FormatDateTime ('dd/mm/yyyy', peFecha))]);
    QrCrCompSeP.Series3.Title  := Format ('(4) 4T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha))]);
    QrCrCompSeP.Series4.Title  := Format ('(1) 4T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha)) - 1]);
    QrCrCompSeP.Series5.Title  := Format ('(2) 1T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha))]);
    QrCrCompSeP.Series6.Title  := Format ('(3) Saldo al %s', [(FormatDateTime ('dd/mm/yyyy', peFecha))]);
    QrCrCompSeP.Series7.Title  := Format ('(4) 4T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha))]);
    QrCrCompSeP.Series8.Title  := Format ('(1) 4T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha)) - 1]);
    QrCrCompSeP.Series9.Title  := Format ('(2) 1T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha))]);
    QrCrCompSeP.Series10.Title := Format ('(3) Saldo al %s', [(FormatDateTime ('dd/mm/yyyy', peFecha))]);
    QrCrCompSeP.Series11.Title := Format ('(4) 4T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha))]);
    QrCrCompSeP.Series12.Title := Format ('(1) 4T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha)) - 1]);
    QrCrCompSeP.Series13.Title := Format ('(2) 1T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha))]);
    QrCrCompSeP.Series14.Title := Format ('(3) Saldo al %s', [(FormatDateTime ('dd/mm/yyyy', peFecha))]);
    QrCrCompSeP.Series15.Title := Format ('(4) 4T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha))]);
    QrCrCompSeP.Series16.Title := Format ('(1) 4T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha)) - 1]);

    QRCrCompSeP.QRInterEncabezado1.Apli       := Apli;
    QRCrCompSeP.QRInterEncabezado1.IdEmpresa  := APli.IdEmpresa;
    QRCrCompSeP.QRInterEncabezado1.NomReporte :='IntQrSecPubl';
    QRCrCompSeP.QRInterEncabezado1.Titulo1    := 'Comparativo Sector Público' + '  al ' + DateToStr(peFecha);
    QRCrCompSeP.QLeyendaEntidades.Close;
    QRCrCompSeP.QLeyendaEntidades.DatabaseName                            := Apli.DataBaseName;
    QRCrCompSeP.QLeyendaEntidades.SessionName                             := Apli.SessionName;
    QRCrCompSeP.QLeyendaEntidades.ParamByName ('peTipo_Entidad').AsString := peTipo_Entidad;
    QRCrCompSeP.QLeyendaEntidades.Open;
    QRCrCompSeP.QRInterEncabezado1.Titulo2    := 'Incluye información: Federal, Estatal, Municipal, Órganos Descentralizados';

    if Preview then
      QRCrCompSeP.Preview
    else
      QRCrCompSeP.Print;

  finally
     vlQry.AfterScroll := Nil;
    QRCrCompSeP.Free;


    if Assigned (QrPreview) then
      QrPreview.Free;
  end;
end;


{$R *.DFM}

procedure TQrCrCompSeP.QDatosAfterScroll(DataSet: TDataSet);
begin
  if not DataSet.Active then Exit;

  {Si es un total, pinta la línea de arriba}
  QRImp_T4YAnt.Frame.DrawTop          := (DataSet.FieldByName ('Titulos').AsString = 'Total') Or (DataSet.FieldByName ('Titulos').AsString = 'Gran Total');
  QRPct_T4YAnt.Frame.DrawTop          := (DataSet.FieldByName ('Titulos').AsString = 'Total') Or (DataSet.FieldByName ('Titulos').AsString = 'Gran Total');
  QRImp_T1YAct.Frame.DrawTop          := (DataSet.FieldByName ('Titulos').AsString = 'Total') Or (DataSet.FieldByName ('Titulos').AsString = 'Gran Total');
  QRPct_T1YAct.Frame.DrawTop          := (DataSet.FieldByName ('Titulos').AsString = 'Total') Or (DataSet.FieldByName ('Titulos').AsString = 'Gran Total');
  QRImp_Saldo_al.Frame.DrawTop        := (DataSet.FieldByName ('Titulos').AsString = 'Total') Or (DataSet.FieldByName ('Titulos').AsString = 'Gran Total');
  QRPct_Saldo_al.Frame.DrawTop        := (DataSet.FieldByName ('Titulos').AsString = 'Total') Or (DataSet.FieldByName ('Titulos').AsString = 'Gran Total');
  QRImp_T1_Diferencia.Frame.DrawTop   := (DataSet.FieldByName ('Titulos').AsString = 'Total') Or (DataSet.FieldByName ('Titulos').AsString = 'Gran Total');
  QRPct_T1_Diferencia.Frame.DrawTop   := (DataSet.FieldByName ('Titulos').AsString = 'Total') Or (DataSet.FieldByName ('Titulos').AsString = 'Gran Total');
  QRImp_T4YAct.Frame.DrawTop          := (DataSet.FieldByName ('Titulos').AsString = 'Total') Or (DataSet.FieldByName ('Titulos').AsString = 'Gran Total');
  QRPct_T4YAct.Frame.DrawTop          := (DataSet.FieldByName ('Titulos').AsString = 'Total') Or (DataSet.FieldByName ('Titulos').AsString = 'Gran Total');
  QRImp_T4_Diferencia.Frame.DrawTop   := (DataSet.FieldByName ('Titulos').AsString = 'Total') Or (DataSet.FieldByName ('Titulos').AsString = 'Gran Total');
  QRPct_T4_Diferencia.Frame.DrawTop   := (DataSet.FieldByName ('Titulos').AsString = 'Total') Or (DataSet.FieldByName ('Titulos').AsString = 'Gran Total');

  if DataSet.FieldByName ('Orden_Estructura').AsInteger  In [4,15,26,30,31] then
  begin
    QRTxtTitulos.Font.Style          := QRTxtTitulos.Font.Style         + [fsBold];
    QRImp_T4YAnt.Font.Style          := QRImp_T4YAnt.Font.Style         + [fsBold];
    QRPct_T4YAnt.Font.Style          := QRPct_T4YAnt.Font.Style         + [fsBold];
    QRImp_T1YAct.Font.Style          := QRImp_T1YAct.Font.Style         + [fsBold];
    QRPct_T1YAct.Font.Style          := QRPct_T1YAct.Font.Style         + [fsBold];
    QRImp_Saldo_Al.Font.Style        := QRImp_Saldo_Al.Font.Style       + [fsBold];
    QRPct_Saldo_Al.Font.Style        := QRImp_Saldo_Al.Font.Style       + [fsBold];
    QRImp_T1_Diferencia.Font.Style   := QRImp_T1_Diferencia.Font.Style  + [fsBold];
    QRPct_T1_Diferencia.Font.Style   := QRPct_T1_Diferencia.Font.Style  + [fsBold];
    QRImp_T4YAct.Font.Style          := QRImp_T4YAct.Font.Style         + [fsBold];
    QRPct_T4YAct.Font.Style          := QRPct_T4YAct.Font.Style         + [fsBold];
    QRImp_T4_Diferencia.Font.Style   := QRImp_T4_Diferencia.Font.Style  + [fsBold];
    QRPct_T4_Diferencia.Font.Style   := QRPct_T4_Diferencia.Font.Style  + [fsBold];
  end
  else
  begin
    QRTxtTitulos.Font.Style          := QRTxtTitulos.Font.Style         - [fsBold];
    QRImp_T4YAnt.Font.Style          := QRImp_T4YAnt.Font.Style         - [fsBold];
    QRPct_T4YAnt.Font.Style          := QRPct_T4YAnt.Font.Style         - [fsBold];
    QRImp_T1YAct.Font.Style          := QRImp_T1YAct.Font.Style         - [fsBold];
    QRPct_T1YAct.Font.Style          := QRPct_T1YAct.Font.Style         - [fsBold];
    QRImp_Saldo_Al.Font.Style        := QRImp_Saldo_Al.Font.Style       - [fsBold];
    QRPct_Saldo_Al.Font.Style        := QRImp_Saldo_Al.Font.Style       - [fsBold];
    QRImp_T1_Diferencia.Font.Style   := QRImp_T1_Diferencia.Font.Style  - [fsBold];
    QRPct_T1_Diferencia.Font.Style   := QRPct_T1_Diferencia.Font.Style  - [fsBold];
    QRImp_T4YAct.Font.Style          := QRImp_T4YAct.Font.Style         - [fsBold];
    QRPct_T4YAct.Font.Style          := QRPct_T4YAct.Font.Style         - [fsBold];
    QRImp_T4_Diferencia.Font.Style   := QRImp_T4_Diferencia.Font.Style  - [fsBold];
    QRPct_T4_Diferencia.Font.Style   := QRPct_T4_Diferencia.Font.Style  - [fsBold];
  end;

  if    (DataSet.FieldByName('Titulos').AsString = 'Gobierno Federal')
    or  (DataSet.FieldByName('Titulos').AsString = 'Gobiernos Estatales')
    or  (DataSet.FieldByName('Titulos').AsString = 'Gobiernos Municipales')
    or  (DataSet.FieldByName('Titulos').AsString = 'Organismos Descentralizados')
  then
    begin
      qrTxtTitulos.Color           := clBlack;
      qrTxtTitulos.Font.Color      := clWhite;
    end else
    begin
      qrTxtTitulos.Color           := clWhite;
      qrTxtTitulos.Font.Color      := clBlack;
   end;

  if (DataSet.FieldByName ('Orden_Estructura').AsInteger  In  [2..3])  then
  begin
    Series1    .Add (DataSet.FieldByName ('Imp_T1YAct')        .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    Series2    .Add (DataSet.FieldByName ('Imp_Saldo_Al')      .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    LineSeries1.Add (DataSet.FieldByName ('Imp_T1_Diferencia') .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    Series3    .Add (DataSet.FieldByName ('Imp_T4YAct')        .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    Series4    .Add (DataSet.FieldByName ('Imp_T4YAnt')        .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    LineSeries2.Add (DataSet.FieldByName ('Imp_T4_Diferencia') .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
  end
  else if (DataSet.FieldByName ('Orden_Estructura').AsInteger  In [6..14])  then
  begin
    Series5    .Add (DataSet.FieldByName ('Imp_T1YAct')        .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    Series6    .Add (DataSet.FieldByName ('Imp_Saldo_Al')      .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    LineSeries3.Add (DataSet.FieldByName ('Imp_T1_Diferencia') .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    Series7    .Add (DataSet.FieldByName ('Imp_T4YAct')        .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    Series8    .Add (DataSet.FieldByName ('Imp_T4YAnt')        .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    LineSeries4.Add (DataSet.FieldByName ('Imp_T4_Diferencia') .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
  end
  else if (DataSet.FieldByName ('Orden_Estructura').AsInteger  In [17..25])  then
  begin
    Series9    .Add (DataSet.FieldByName ('Imp_T1YAct')        .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    Series10   .Add (DataSet.FieldByName ('Imp_Saldo_Al')      .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    LineSeries5.Add (DataSet.FieldByName ('Imp_T1_Diferencia') .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    Series11   .Add (DataSet.FieldByName ('Imp_T4YAct')        .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    Series12   .Add (DataSet.FieldByName ('Imp_T4YAnt')        .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    LineSeries6.Add (DataSet.FieldByName ('Imp_T4_Diferencia') .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
  end
    else if (DataSet.FieldByName ('Orden_Estructura').AsInteger  In [28..29])  then
  begin
    Series13   .Add (DataSet.FieldByName ('Imp_T1YAct')        .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    Series14   .Add (DataSet.FieldByName ('Imp_Saldo_Al')      .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    LineSeries7.Add (DataSet.FieldByName ('Imp_T1_Diferencia') .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    Series15   .Add (DataSet.FieldByName ('Imp_T4YAct')        .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    Series16   .Add (DataSet.FieldByName ('Imp_T4YAnt')        .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
    LineSeries8.Add (DataSet.FieldByName ('Imp_T4_Diferencia') .AsFloat,  DataSet.FieldByName ('Titulos').AsString);
  end;
end;


end.
