unit RepCttoInterFin2;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, InterApl, UnSql2,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, InterMemo, IntFrm;

type
  TReporteInterFin2 = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    Query1: TQuery;
    qRepresentante: TQuery;
    dsQuery1: TDataSource;
    Query1ID_CONTRATO: TFloatField;
    Query1NOMBRE: TStringField;
    Query1F_ALTA: TDateTimeField;
    Query1CVE_PER_JUR_PROD: TStringField;
    qRepresentanteID_PERSONA: TFloatField;
    qRepresentanteNOMBRE: TStringField;
    qRepresentanteCVE_PER_JURIDICA: TStringField;
    qRepresentanteCVE_TIPO_FIRMA: TStringField;
    lbInterfinancial: TQRLabel;
    QRMacvMemo1: TQRMacvMemo;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape4: TQRShape;
    QRMacvMemo2: TQRMacvMemo;
    QRMacvMemo6: TQRMacvMemo;
    QRMacvMemo7: TQRMacvMemo;
    QRMacvMemo8: TQRMacvMemo;
    QRMacvMemo3: TQRMacvMemo;
    QRMacvMemo4: TQRMacvMemo;
    QRMacvMemo5: TQRMacvMemo;
    QRMacvMemo9: TQRMacvMemo;
    QRMacvMemo10: TQRMacvMemo;
    QRMacvMemo11: TQRMacvMemo;
    QRMacvMemo12: TQRMacvMemo;
    QRMacvMemo13: TQRMacvMemo;
    QRMacvMemo14: TQRMacvMemo;
    QRMacvMemo15: TQRMacvMemo;
    QRMacvMemo16: TQRMacvMemo;
    QRMacvMemo17: TQRMacvMemo;
    QRMacvMemo18: TQRMacvMemo;
    lbDias: TQRLabel;
    QRMacvMemo20: TQRMacvMemo;
    lbMes: TQRLabel;
    QRMacvMemo21: TQRMacvMemo;
    QRMacvMemo19: TQRMacvMemo;
    lbAnio: TQRLabel;
    qrmNomRepresenta: TQRMemo;
    procedure ReporteInterFin2BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
  		FInterFrame: TInterFrame;
      FRequery: Boolean;
  protected
      procedure SetInterFrame (Frame: TInterFrame);
      procedure SetRequery(Open: Boolean);
  public
		function DameFecha(Fecha: TDateTime): String;
		Function PreparaReporte(Padre: TInterFrame): Boolean;
      Property InterFrame: TInterFrame Read FInterFrame Write SetInterFrame;
      property Requery: Boolean Read FRequery Write SetRequery;
  end;


Procedure Execute_RepIntFin2(Padre: TInterFrame; Preview: Boolean);

var
  ReporteInterFin2: TReporteInterFin2;

implementation

{$R *.DFM}


Procedure Execute_RepIntFin2(Padre: TInterFrame; Preview: Boolean);
Var
	Reporte: TReporteInterFin2;
begin
	Reporte:= TReporteInterFin2.Create(nil);
   try
   	If Reporte.PreparaReporte(Padre) then
         if Preview then
            Reporte.Preview
         else
            Reporte.Print;

   finally
   	Reporte.Free;
   end;

end;

procedure TReporteInterFin2.SetInterFrame (Frame: TInterFrame);
begin
	FInterFrame := Frame;

   Requery := False;

   Query1.DatabaseName := Frame.DataBaseName;
   qRepresentante.DatabaseName := Frame.DataBaseName;
   Query1.SessionName := Frame.SessionName;
   qRepresentante.SessionName := Frame.SessionName;
end;


procedure TReporteInterFin2.SetRequery(Open: Boolean);
begin
	FRequery := Open;

	If Open then
   begin
		Query1.Open;
      qRepresentante.Open;
   end
   else
   begin
		Query1.Close;
      qRepresentante.Close;
   end
end;

Function TReporteInterFin2.PreparaReporte(Padre: TInterFrame): Boolean;
begin
	PreparaReporte := True;
   InterFrame := Padre;
   Try
   	Requery := False;
      Query1.ParamByName('Id_Contrato').asInteger := Padre.FieldByName('ID_CONTRATO').asInteger;
      Requery := True;
   Except
   	PreparaReporte := False;
   end;
end;


function TReporteInterFin2.DameFecha(Fecha: TDateTime): String;
var
	Year, Month, Day: Word;
   FechaStr: String;
begin
   DecodeDate(Fecha, Year, Month, Day);
   FechaStr := IntToStr(Day) + ' días del mes de ';

   Case Month of
      1: FechaStr := FechaStr + 'Enero';
      2: FechaStr := FechaStr + 'Febrero';
      3: FechaStr := FechaStr + 'Marzo';
      4: FechaStr := FechaStr + 'Abril';
      5: FechaStr := FechaStr + 'Mayo';
      6: FechaStr := FechaStr + 'Junio';
      7: FechaStr := FechaStr + 'Julio';
      8: FechaStr := FechaStr + 'Agosto';
      9: FechaStr := FechaStr + 'Septiembre';
      10:FechaStr := FechaStr + 'Octubre';
      11:FechaStr := FechaStr + 'Noviembre';
      12:FechaStr := FechaStr + 'Diciembre';
   end;

   FechaStr := FechaStr + ' de ' + IntToStr(Year);
   DameFecha := FechaStr;
end;


procedure TReporteInterFin2.ReporteInterFin2BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var Mes : String;
begin
	QRMacvMemo5.Parametro.Clear;
	QRMacvMemo5.Parametro.Add(DameFecha(Query1.fieldByName('F_Alta').asDateTime));

	lbInterfinancial.Caption := InterFrame.FieldByName('NOM_REPRESENTANTE').asString;
        qrmNomRepresenta.Lines.Clear;
        qrmNomRepresenta.Lines.Add(InterFrame.FieldByName('NOM_CLIENTE').asString);
        lbDias.Caption := copy(DatetoStr(Query1.FieldByName('F_Alta').asDateTime),1,2);
        If copy(Query1.FieldByName('F_Alta').asString,4,2) = '01' Then
           Mes := 'Enero'
        Else
           If copy(Query1.FieldByName('F_Alta').asString,4,2) = '02' Then
              Mes :='Febrero'
           Else
              If copy(Query1.FieldByName('F_Alta').asString,4,2) = '03' Then
                 Mes :='Marzo'
              Else
                  If copy(Query1.FieldByName('F_Alta').asString,4,2) = '04' Then
                    Mes :='Abril'
                  Else
                     If copy(Query1.FieldByName('F_Alta').asString,4,2) = '05' Then
                       Mes :='Mayo'
                     Else
                        If copy(Query1.FieldByName('F_Alta').asString,4,2) = '06' Then
                          Mes :='Junio'
                        Else
                           If copy(Query1.FieldByName('F_Alta').asString,4,2) = '07' Then
                             Mes :='Julio'
                           Else
                              If copy(Query1.FieldByName('F_Alta').asString,4,2) = '08' Then
                                Mes :='Agosto'
                              Else
                                 If copy(Query1.FieldByName('F_Alta').asString,4,2) = '09' Then
                                   Mes :='Septiembre'
                                 Else
                                 If copy(Query1.FieldByName('F_Alta').asString,4,2) = '10' Then
                                   Mes :='Octubre'
                                 Else
                                    If copy(Query1.FieldByName('F_Alta').asString,4,2) = '11' Then
                                      Mes :='Noviembre'
                                    Else
                                      Mes :='Diciembre';
        lbMes.Caption := Mes;
        lbAnio.Caption := copy(Query1.FieldByName('F_Alta').asString,7,4);
        If Query1.FieldByName('Cve_per_jur_prod').asString = 'PM' Then
           QRLabel2.Caption := 'El Cliente Representado por'
        Else
           QRLabel2.Caption := 'El Cliente';
end;

end.
