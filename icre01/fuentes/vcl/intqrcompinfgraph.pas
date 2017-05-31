unit IntQrCompInfGraph;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, Db, DBTables, InterApl,
  IntQRPreview, TeeProcs, TeEngine, Chart, DBChart, QrTee, Series;

type
  TQrCompInfGraph = class(TQuickRep)
    TitleBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    SummaryBand1: TQRBand;
    QRLeyendaMoneda: TQRLabel;
    QRDBChart1: TQRDBChart;
    QRChart1: TQRChart;
    QRDBChart2: TQRDBChart;
    QRChart2: TQRChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TLineSeries;
    Series4: TBarSeries;
    Series5: TBarSeries;
    Series6: TLineSeries;
    Series7: TBarSeries;
    Series8: TBarSeries;
    Series9: TLineSeries;
    Series10: TBarSeries;
    Series11: TBarSeries;
    Series12: TLineSeries;
  private
    List: TStringList;
    procedure QAfterScroll(DataSet: TDataSet);
  public

  end;

var
  QrCompInfGraph: TQrCompInfGraph;

procedure RepComparativoInfraGraph (peFecha: TDate; peFactor: double; peLeyenda_Entidad: string; vlQry: TQuery; Apli: TInterApli; Preview: boolean);


implementation

{$R *.DFM}

procedure RepComparativoInfraGraph (peFecha: TDate; peFactor: double; peLeyenda_Entidad: string; vlQry: TQuery; Apli: TInterApli; Preview: boolean);
var
  QrCompInfGraph: TQrCompInfGraph;
  QrPreview: TIntQRPreview;
  List: TStringList;
begin
  List           := TStringList.Create;
  QrCompInfGraph := TQrCompInfGraph.Create (nil);
  QrPreview      := TIntQRPreview.CreatePreview(Application, QrCompInfGraph);

  try
    QrCompInfGraph.QRInterEncabezado1.Apli       := Apli;
    QrCompInfGraph.QRInterEncabezado1.IdEmpresa  := APli.IdEmpresa;
    QrCompInfGraph.QRInterEncabezado1.NomReporte := 'IntQrCompInfGraph';
    QrCompInfGraph.QRInterEncabezado1.Titulo1    := 'Comparativo por Banca (Infraestructura y Construcción) Al ' + DateToStr(peFecha);
    QrCompInfGraph.QRInterEncabezado1.Titulo2    := peLeyenda_Entidad;

    if      peFactor = 1000000 then QrCompInfGraph.QRLeyendaMoneda.Caption := 'Información expresada en millones de pesos'
    else if peFactor = 1000    then QrCompInfGraph.QRLeyendaMoneda.Caption := 'Información expresada en miles de pesos'
    else if peFactor = 1       then QrCompInfGraph.QRLeyendaMoneda.Caption := 'Información expresada en pesos';

    QrCompInfGraph.DataSet := vlQry;
    QrCompInfGraph.List    := List;
    vlQry.AfterScroll      := QrCompInfGraph.QAfterScroll;

    QrCompInfGraph.Series1.Clear;
    QrCompInfGraph.Series2.Clear;
    QrCompInfGraph.Series3.Clear;
    QrCompInfGraph.Series4.Clear;
    QrCompInfGraph.Series5.Clear;
    QrCompInfGraph.Series6.Clear;
    QrCompInfGraph.Series7.Clear;
    QrCompInfGraph.Series8.Clear;
    QrCompInfGraph.Series9.Clear;
    QrCompInfGraph.Series10.Clear;
    QrCompInfGraph.Series11.Clear;
    QrCompInfGraph.Series12.Clear;


    QrCompInfGraph.Series1.Title  := Format ('(2) 1T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha))]);
    QrCompInfGraph.Series2.Title  := Format ('(3) Saldo al %s', [(FormatDateTime ('dd/mm/yyyy', peFecha))]);
    QrCompInfGraph.Series4.Title  := Format ('(4) 4T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha))]);
    QrCompInfGraph.Series5.Title  := Format ('(1) 4T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha)) - 1]);
    QrCompInfGraph.Series7.Title  := Format ('(2) 1T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha))]);
    QrCompInfGraph.Series8.Title  := Format ('(3) Saldo al %s', [(FormatDateTime ('dd/mm/yyyy', peFecha))]);
    QrCompInfGraph.Series10.Title := Format ('(4) 4T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha))]);
    QrCompInfGraph.Series11.Title := Format ('(1) 4T%d',        [StrToInt (FormatDateTime ('yyyy', peFecha)) - 1]);

    QrCompInfGraph.QRDBChart1.BottomAxis.LabelStyle       := talText;
    QrCompInfGraph.QRDBChart1.BottomAxis.LabelsAngle      := 315;
    QrCompInfGraph.QRDBChart1.BottomAxis.LabelsSeparation := 0;
    QrCompInfGraph.QRDBChart2.BottomAxis.LabelStyle       := talText;
    QrCompInfGraph.QRDBChart2.BottomAxis.LabelsAngle      := 315;
    QrCompInfGraph.QRDBChart2.BottomAxis.LabelsSeparation := 0;

    if Preview then
      QrCompInfGraph.Preview
    else
      QrCompInfGraph.Print;

  finally
    vlQry.AfterScroll := nil;
    QrCompInfGraph.Free;
    List.Free;

    if Assigned (QrPreview) then
      QrPreview.Free;
  end;
end;

procedure TQrCompInfGraph.QAfterScroll(DataSet: TDataSet);
var
  s: string;
begin
  if not DataSet.Active or (DataSet.FieldByName ('G1').AsFloat = 1) then exit;

  s := UpperCase (DataSet.FieldByName ('Grupo').AsString + '|' + DataSet.FieldByName ('Descripcion').AsString);
  if List.IndexOf (s) <> -1 then exit;

  if DataSet.FieldByName ('Grupo').AsFloat = 1 then
  begin
    Series1.Add (DataSet.FieldByName ('Imp_1TYAct').AsFloat, DataSet.FieldByName ('Descripcion').AsString);
    Series2.Add (DataSet.FieldByName ('Imp_Fecha').AsFloat,  DataSet.FieldByName ('Descripcion').AsString);
    Series3.Add (DataSet.FieldByName ('Imp_Dif1').AsFloat,   DataSet.FieldByName ('Descripcion').AsString);
    Series4.Add (DataSet.FieldByName ('Imp_4TYAct').AsFloat, DataSet.FieldByName ('Descripcion').AsString);
    Series5.Add (DataSet.FieldByName ('Imp_4TYAnt').AsFloat, DataSet.FieldByName ('Descripcion').AsString);
    Series6.Add (DataSet.FieldByName ('Imp_Dif2').AsFloat,   DataSet.FieldByName ('Descripcion').AsString);
  end
  else
  begin
    Series7.Add  (DataSet.FieldByName ('Imp_1TYAct').AsFloat, DataSet.FieldByName ('Descripcion').AsString);
    Series8.Add  (DataSet.FieldByName ('Imp_Fecha').AsFloat,  DataSet.FieldByName ('Descripcion').AsString);
    Series9.Add  (DataSet.FieldByName ('Imp_Dif1').AsFloat,   DataSet.FieldByName ('Descripcion').AsString);
    Series10.Add (DataSet.FieldByName ('Imp_4TYAct').AsFloat, DataSet.FieldByName ('Descripcion').AsString);
    Series11.Add (DataSet.FieldByName ('Imp_4TYAnt').AsFloat, DataSet.FieldByName ('Descripcion').AsString);
    Series12.Add (DataSet.FieldByName ('Imp_Dif2').AsFloat,   DataSet.FieldByName ('Descripcion').AsString);
  end;
  List.Add (s);
end;

end.
