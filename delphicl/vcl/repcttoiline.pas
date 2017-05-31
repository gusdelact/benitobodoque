unit RepCttoIline;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, IntFrm, InterApl,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, InterMemo;

type
  TReporteCttoILine = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    qContrato: TQuery;
    dsContrato: TDataSource;
    qContratante: TQuery;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    lbId_Contrato: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRShape2: TQRShape;
    edTipoFirma: TQRDBText;
    GroupHeaderBand1: TQRBand;
    QRLabel11: TQRLabel;
    PageHeaderBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel26: TQRLabel;
    QRBand1: TQRBand;
    BandLeyendaPie: TQRBand;
    ChildBand1: TQRChildBand;
    lbleyendapie: TQRLabel;
    QRLabel21: TQRLabel;
    QRS1: TQRShape;
    QRFirma1: TQRLabel;
    QContratanteBurs: TQuery;
    QContratanteBursNOMBRE: TStringField;
    QContratanteBursCVE_TIPO_FIRMA: TStringField;
    qContratanteNOMBRE: TStringField;
    qContratanteDESC_CONTRATANTE: TStringField;
    qContratanteCVE_TIPO_FIRMA: TStringField;
    qContratanteE_MAIL: TStringField;
    qContratantePAGER_PROV: TStringField;
    qContratantePAGER_PIN: TStringField;
    qContratanteDOMICILIO_CONTRATANTE: TStringField;
    qContratanteCVE_CONTRATANTE: TStringField;
    QRPagerPIN: TQRLabel;
    QRLabel22: TQRLabel;
    QRFecha: TQRLabel;
    QRInterMemo1: TQRInterMemo;
    qrmNomCliente: TQRMemo;
    qrmDomicilio: TQRMemo;
    procedure ReporteCttoInterFinBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure GroupHeaderBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
      FInterFrame: TInterFrame;
      FRequery: Boolean;
      ContratoRef : Real;
      NomAuto    : String;
      NomBcoCasa : String;
      NomRep     : String;
  protected
    Procedure SetInterFrame(Frame: TInterFrame);
    procedure SetRequery(Open: Boolean);
  public
    function DameFecha(Fecha: TDateTime): String;
    Function PreparaReporte(Padre: TInterFrame): Boolean;
  published
    Property InterFrame: TInterFrame Read FInterFrame Write SetInterFrame;
    Property Requery: Boolean Read FRequery Write SetRequery;
  end;

Procedure Execute_RepILine(Padre: TInterFrame; Contrato_Asoc: Real; Autoriza : String; vari : String; NomRepres : String; Preview: Boolean);

var
  ReporteCttoILine: TReporteCttoILine;
  NomAutoriza : String;

implementation

{$R *.DFM}

Procedure Execute_RepILine(Padre: TInterFrame; Contrato_Asoc: Real ; Autoriza : String; Vari : String; NomRepres : String; Preview: Boolean);
var
  Reporte: TReporteCttoILine;
begin
  Reporte:= TReporteCttoILine.Create(nil);
  Try
    if Reporte.PreparaReporte(Padre) then begin
       reporte.ContratoRef:= Contrato_Asoc;
       reporte.NomAuto := Autoriza;
       reporte.NomBcoCasa := Vari;
       reporte.NomRep := NomRepres;
       NomAutoriza := Autoriza;
       if(Vari = 'CIBC') or (Vari = 'CSIL') then
          reporte.QRInterMemo1.Parametro.add('INTERACCIONES CASA DE BOLSA, S.A. DE C.V. ')
       else
       if Vari = 'IFON' then
          reporte.QRInterMemo1.Parametro.add('BANCO INTERACCIONES, S.A., INSTITUCIÓN DE BANCA MÚLTIPLE ');
       reporte.QRInterMemo1.Parametro.add(NomRepres);
       if(Vari = 'CIBC') or (Vari = 'CSIL') then
          reporte.QRInterMemo1.Parametro.add('"LA CASA DE BOLSA"')
       else
       if Vari = 'IFON' then
          reporte.QRInterMemo1.Parametro.add('"EL BANCO"');
       reporte.lbId_Contrato.Caption := IntToStr(StrToInt(Copy(FloatToStr(Contrato_Asoc),3,7)));
       reporte.QRFecha.Caption:= reporte.DameFecha(Now);
       if Preview then
          Reporte.Preview
       else
          Reporte.Print;
    end;
  finally
    Reporte.Free;
  end;
end;

procedure TReporteCttoILine.SetInterFrame (Frame: TInterFrame);
begin
  FInterFrame := Frame;
  Requery := False;
  qContrato.DatabaseName 	:= Frame.DataBaseName;
  qContratante.DatabaseName	:= Frame.DataBaseName;
  qContratanteBurs.DatabaseName	:= Frame.DataBaseName;
  qContrato.SessionName 	:= Frame.SessionName;
  qContratante.SessionName	:= Frame.SessionName;
  qContratanteBurs.SessionName	:= Frame.SessionName;
end;

procedure TReporteCttoILine.SetRequery(Open: Boolean);
begin
  FRequery := Open;
  if Open then begin
     qContrato.Open;
     qContratante.Open;
  end//if
  else begin
     qContratante.Close;
     qContrato.Close;
  end//else
end;

Function TReporteCttoILine.PreparaReporte(Padre: TInterFrame): Boolean;
begin
  PreparaReporte:= True;
  InterFrame:= Padre;
  Try
    Requery := False;
    qContrato.ParamByName('Id_contrato').asInteger := Padre.fieldByName('ID_CONTRATO').AsInteger;
    Requery := True;
  Except
    PreparaReporte := False;
  end;
end;

function TReporteCttoILine.DameFecha(Fecha: TDateTime): String;
var
  Year, Month, Day: Word;
  FechaStr: String;
begin
  DecodeDate(Fecha, Year, Month, Day);
  FechaStr := IntToStr(Day) + ' - ';
  Case Month of
     1: FechaStr := FechaStr + 'ENERO';
     2: FechaStr := FechaStr + 'FEBRERO';
     3: FechaStr := FechaStr + 'MARZO';
     4: FechaStr := FechaStr + 'ABRIL';
     5: FechaStr := FechaStr + 'MAYO';
     6: FechaStr := FechaStr + 'JUNIO';
     7: FechaStr := FechaStr + 'JULIO';
     8: FechaStr := FechaStr + 'AGOSTO';
     9: FechaStr := FechaStr + 'SEPTIEMBRE';
     10:FechaStr := FechaStr + 'OCTUBRE';
     11:FechaStr := FechaStr + 'NOVIEMBRE';
     12:FechaStr := FechaStr + 'DICIEMBRE';
  end;
  FechaStr := FechaStr + ' - ' + IntToStr(Year);
  DameFecha := FechaStr;
end;

procedure TReporteCttoILine.ReporteCttoInterFinBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  lbLeyendaPie.Caption := '';
  lbLeyendaPie.Lines.Text := InterFrame.FieldByName('LEYENDA_PIE').asString;
  if Trim(lbLeyendaPie.Lines.Text) = '' then
     bandLeyendaPie.Enabled:= False
  else
     bandLeyendaPie.Enabled:= True;
end;

procedure TReporteCttoILine.ChildBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  vlPosicion:  Integer;
  vlFirmasB:   Integer;
  vlbfirmasB:  Boolean;
begin
  vlbfirmasB:= False;
  QContratanteBurs.ParamByName('Id_Contrato').asfloat:= ContratoRef;
  QContratanteBurs.Open;
 {Valida la existencia de firmas tipo B}
  QContratanteBurs.First;
  vlFirmasB := 0;
  While(Not(QContratanteBurs.Eof))do begin
     if QContratanteBurs.FieldByName('CVE_TIPO_FIRMA').AsString = 'B' then
        vlFirmasB := vlFirmasB +1;
     QContratanteBurs.Next;
     end;
  if vlFirmasB >= 2 then
     vlbfirmasB:= True;
  QContratanteBurs.First;
  vlPosicion := 0;
  While(Not(QContratanteBurs.Eof))and(vlPosicion <= 4)do begin
     if(QContratanteBurs.FieldByName('CVE_TIPO_FIRMA').AsString = 'A')or
       ((QContratanteBurs.FieldByName('CVE_TIPO_FIRMA').AsString = 'B')and(vlbfirmasB)) then begin
        vlPosicion:= vlPosicion + 1;
        QRS1.Enabled:= TRUE;
        QRFirma1.Caption:= NomAutoriza;
        QRFirma1.Enabled:= TRUE;
     end;
     QContratanteBurs.Next;
  end;
  QContratanteBurs.Close;
end;

procedure TReporteCttoILine.GroupHeaderBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qContratante.FieldByName('Cve_Contratante').AsString= 'C051' then
     ChildBand1.Enabled:= True;
end;

procedure TReporteCttoILine.QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
Var
  Valor: Integer;
begin
  qrmNomCliente.Lines.Clear;
  qrmNomCliente.Lines.Add(qContratante.FieldByName('NOMBRE').AsString);
  qrmDomicilio.Lines.Clear;
  qrmDomicilio.Lines.Add(qContratante.FieldByName('DOMICILIO_CONTRATANTE').AsString);
  Valor:= 0;
  if QContratante.FieldByName('Pager_Prov').AsString <> 'Ninguno' then begin
     if length(QContratante.FieldByName('Pager_Prov').AsString) > 0 then
        Valor:= QContratante.FieldByName('Pager_Prov').Asinteger;
     Case Valor of
       1 : QRPagerPin.Caption:= 'DIGITEL Pin: ' + QContratante.FieldByName('Pager_Pin').AsString;
       2 : QRPagerPin.Caption:= 'SKY-TEL Pin: ' + QContratante.FieldByName('Pager_Pin').AsString;
       3 : QRPagerPin.Caption:= 'IUSABEEP Pin: ' + QContratante.FieldByName('Pager_Pin').AsString;
       4 : QRPagerPin.Caption:= 'TEL-BEEP Pin: ' + QContratante.FieldByName('Pager_Pin').AsString;
       5 : QRPagerPin.Caption:= 'TECH-TEL Pin: ' + QContratante.FieldByName('Pager_Pin').AsString;
       else
         QRPagerPin.Caption:= '';
     end;
   end;
  if QContratante.FieldByName('Pager_Prov').AsString = 'Ninguno' then
     QRPagerPin.Caption:= '';
end;

end.
