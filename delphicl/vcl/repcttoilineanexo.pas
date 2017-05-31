unit RepCttoILineAnexo;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, IntFrm, InterApl,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, InterMemo;

type
  TReporteCttoILineAnexo = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    qContrato: TQuery;
    dsContrato: TDataSource;
    qContratante: TQuery;
    QRLabel1: TQRLabel;
    lbId_Contrato: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    PageHeaderBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRBand1: TQRBand;
    ChildBand1: TQRChildBand;
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
    lbInstitucion: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRMacvMemo1: TQRMacvMemo;
    QRFecha: TQRLabel;
    QRMacvMemo2: TQRMacvMemo;
    QRFecha1: TQRLabel;
    QRMacvMemo3: TQRMacvMemo;
    QRFecha2: TQRLabel;
    QRMacvMemo5: TQRMacvMemo;
    QRMacvMemo6: TQRMacvMemo;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    lbServicio: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel28: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel29: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel4: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel15: TQRLabel;
    E_MAIL: TQRDBText;
    QRPagerPIN: TQRLabel;
    QRShape2: TQRShape;
    QRLabel5: TQRLabel;
    QRShape23: TQRShape;
    QRLabel23: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape26: TQRShape;
    QRLabel36: TQRLabel;
    QRShape27: TQRShape;
    QRLabel37: TQRLabel;
    QRShape28: TQRShape;
    QRLabel38: TQRLabel;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape35: TQRShape;
    QRLabel41: TQRLabel;
    QRShape36: TQRShape;
    Eti1: TQRLabel;
    Eti4: TQRLabel;
    Eti2: TQRLabel;
    Eti3: TQRLabel;
    Eti5: TQRLabel;
    Eti6: TQRLabel;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel65: TQRLabel;
    QRS1: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRMacvMemo10: TQRMacvMemo;
    QRMacvMemo4: TQRMacvMemo;
    QRMacvMemo7: TQRMacvMemo;
    QRMacvMemo8: TQRMacvMemo;
    QRMacvMemo9: TQRMacvMemo;
    QRMacvMemo11: TQRMacvMemo;
    QRLabel45: TQRLabel;
    firma1: TQRLabel;
    firma2: TQRLabel;
    firma3: TQRLabel;
    TC1: TQRLabel;
    TC2: TQRLabel;
    TC3: TQRLabel;
    TC4: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel25: TQRLabel;
    QRMacvMemo12: TQRMacvMemo;
    QRShape40: TQRShape;
    QRLabel47: TQRLabel;
    Eti7: TQRLabel;
    qrmNomCliente: TQRMemo;
    qrmDomicilio: TQRMemo;
    qrmFirma1: TQRMemo;
    qrmFirma2: TQRMemo;
    qrmFirma3: TQRMemo;
    procedure ReporteCttoInterFinBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GroupHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
      FInterFrame: TInterFrame;
      FRequery: Boolean;
      ContratoRef : Real;
      NomAuto    : String;
      NomBcoCasa : String;
      NomRep     : String;
      lAsis      : Boolean;
      lMoni      : Boolean;
      lEdos      : Boolean;
      lCmef      : Boolean;
      lCosi      : Boolean;
      lComc      : Boolean;
      lCmdr      : Boolean;
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

Procedure Execute_RepILineAnexo(Padre: TInterFrame; Contrato_Asoc: Real; Autoriza : String; vari : String; NomRepres : String; Asis : Boolean; Moni : Boolean; Edos : Boolean; Cmef : Boolean; Cosi : Boolean; Comc : Boolean; Cmdr : Boolean; xFirma1 : String; xFirma2 : String; xFirma3 : String; Preview: Boolean);

var
  ReporteCttoILineAnexo: TReporteCttoILineAnexo;
  NomAutoriza : String;
  label1 : String;
  F1  : String;
  F2  : String;
  F3  : String;

implementation

{$R *.DFM}

Procedure Execute_RepILineAnexo(Padre: TInterFrame; Contrato_Asoc: Real ; Autoriza : String; Vari : String; NomRepres : String; Asis : Boolean; Moni : Boolean; Edos : Boolean; Cmef : Boolean; Cosi : Boolean; Comc : Boolean; Cmdr : Boolean; xFirma1: String; xFirma2: String;xFirma3 : String; Preview: Boolean);
var	Reporte: TReporteCttoILineAnexo;
begin
	Reporte:= TReporteCttoILineAnexo.Create(nil);
   Try
   	If Reporte.PreparaReporte(Padre) then
         begin
         reporte.ContratoRef:= Contrato_Asoc;
         reporte.NomAuto := Autoriza;
         reporte.NomBcoCasa := Vari;
         reporte.NomRep := NomRepres;
         NomAutoriza := Autoriza;
         reporte.lAsis := Asis;
         reporte.lMoni := Moni;
         reporte.lEdos := Edos;
         reporte.lCmef := Cmef;
         reporte.lCosi := Cosi;
         reporte.lComc := Comc;
         reporte.lCmdr := Cmdr;
         F1 := xFirma1;
         F2 := xFirma2;
         F3 := xFirma3;


         If reporte.lAsis = True Then
            reporte.Eti1.Caption := 'X'
         Else
            reporte.Eti1.Caption := ' ';

         If reporte.lMoni = True Then
            reporte.Eti2.Caption := 'X'
         Else
            reporte.Eti2.Caption := ' ';

         If reporte.lEdos = True Then
            reporte.Eti3.Caption := 'X'
         Else
            reporte.Eti3.Caption := ' ';

         If reporte.lCmef = True Then
            reporte.Eti4.Caption := 'X'
         Else
            reporte.Eti4.Caption := ' ';

         If reporte.lCosi = True Then
            reporte.Eti5.Caption := 'X'
         Else
            reporte.Eti5.Caption := ' ';

         If reporte.lComc = True Then
            reporte.Eti6.Caption := 'X'
         Else
            reporte.Eti6.Caption := ' ';

         If reporte.lCmdr = True Then
            reporte.Eti7.Caption := 'X'
         Else
            reporte.Eti7.Caption := ' ';

         If (Vari = 'CIBC') or (Vari = 'CSIL') Then
            begin
            reporte.lbInstitucion.Caption := 'INTERACCIONES CASA DE BOLSA, S.A. DE C.V. ';
            reporte.lbServicio.Caption := 'Intermediación Bursátil';
            reporte.Eti6.Visible := True;
            reporte.Eti7.Visible := True;            
            reporte.QRShape25.Visible := True;
            reporte.QRShape40.Visible := True;            
            reporte.QRLabel62.Visible := True;
            reporte.QRLabel61.Visible := True;
            reporte.QRMacvMemo11.Visible := True;
            reporte.QRLabel45.Caption := 'Órdenes de Mercado de Capitales';
            reporte.QRLabel47.Caption := 'Órdenes de Mercado de Dinero';
         end;
         If Vari = 'IFON' Then
            begin
            reporte.lbInstitucion.Caption := 'BANCO INTERACCIONES, S.A., INSTITUCIÓN DE BANCA MÚLTIPLE ';
            reporte.lbServicio.Caption := 'Prestación de Servicios Bancarios';
            reporte.Eti6.Caption := ' ';
            reporte.Eti7.Caption := ' ';
            reporte.Eti6.Visible := False;
            reporte.Eti7.Visible := False;
            reporte.QRLabel45.Visible := False;
            reporte.QRLabel47.Visible := False;
            reporte.QRShape25.Visible := False;
            reporte.QRShape40.Visible := False;
            reporte.QRLabel62.Visible := False;
            reporte.QRLabel61.Visible := False;
            reporte.QRMacvMemo11.Visible := False;
            reporte.QRShape25.Size.Width := 0;
            reporte.QRShape40.Size.Width := 0;
            reporte.QRLabel45.Caption := ' ';
            reporte.QRLabel47.Caption := ' ';
            reporte.QRLabel62.Caption := ' ';
            reporte.QRLabel61.Caption := ' ';
            reporte.QRMacvMemo11.Textos.Text := ' ';
         end;
         reporte.lbId_Contrato.Caption := IntToStr(StrToInt(Copy(FloatToStr(Contrato_Asoc),3,7)));
         reporte.QRFecha.Caption:= copy(DatetoStr(Date),1,2);;
         If copy(DatetoStr(Date),4,2) = '01' Then
            reporte.QRFecha1.Caption := 'Enero'
         Else
            If copy(DatetoStr(Date),4,2) = '02' Then
               reporte.QRFecha1.Caption :='Febrero'
            Else
               If copy(DatetoStr(Date),4,2) = '03' Then
                  reporte.QRFecha1.Caption :='Marzo'
               Else
                   If copy(DatetoStr(Date),4,2) = '04' Then
                     reporte.QRFecha1.Caption :='Abril'
                   Else
                      If copy(DatetoStr(Date),4,2) = '05' Then
                        reporte.QRFecha1.Caption :='Mayo'
                      Else
                         If copy(DatetoStr(Date),4,2) = '06' Then
                           reporte.QRFecha1.Caption :='Junio'
                         Else
                            If copy(DatetoStr(Date),4,2) = '07' Then
                              reporte.QRFecha1.Caption :='Julio'
                            Else
                               If copy(DatetoStr(Date),4,2) = '08' Then
                                 reporte.QRFecha1.Caption :='Agosto'
                               Else
                                  If copy(DatetoStr(Date),4,2) = '09' Then
                                    reporte.QRFecha1.Caption :='Septiembre'
                                  Else
                                  If copy(DatetoStr(Date),4,2) = '10' Then
                                    reporte.QRFecha1.Caption :='Octubre'
                                  Else
                                     If copy(DatetoStr(Date),4,2) = '11' Then
                                       reporte.QRFecha1.Caption :='Noviembre'
                                     Else
                                       reporte.QRFecha1.Caption :='Diciembre';
         reporte.QRFecha2.Caption:= copy(DatetoStr(Date),7,4);;
//         reporte.qContrato.SQL.SaveToFile('c:\debug.txt');
         if Preview then
            Reporte.Preview
         else
            Reporte.Print;
         end;
   finally
   	Reporte.Free;
   end;
end;

procedure TReporteCttoILineAnexo.SetInterFrame (Frame: TInterFrame);
begin
	FInterFrame := Frame;

   Requery := False;

   qContrato.DatabaseName 		:= Frame.DataBaseName;
   qContratante.DatabaseName	        := Frame.DataBaseName;
   qContratanteBurs.DatabaseName	:= Frame.DataBaseName;

   qContrato.SessionName 		:= Frame.SessionName;
   qContratante.SessionName	        := Frame.SessionName;

   qContratanteBurs.SessionName	        := Frame.SessionName;

end;

procedure TReporteCttoILineAnexo.SetRequery(Open: Boolean);
begin
	FRequery := Open;

	If Open then
   begin
      qContrato.Open;
      qContratante.Open;
   end
   else
   begin
      qContratante.Close;
      qContrato.Close;
   end
end;
 
Function TReporteCttoILineAnexo.PreparaReporte(Padre: TInterFrame): Boolean;
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


function TReporteCttoILineAnexo.DameFecha(Fecha: TDateTime): String;
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

procedure TReporteCttoILineAnexo.ReporteCttoInterFinBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
//   lbLeyendaPie.Caption := '';
//   lbLeyendaPie.Lines.Text := InterFrame.FieldByName('LEYENDA_PIE').asString;

//   If Trim(lbLeyendaPie.Lines.Text) = '' Then bandLeyendaPie.Enabled:= False
//   else bandLeyendaPie.Enabled:= True;
end;

procedure TReporteCttoILineAnexo.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

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
  While (Not(QContratanteBurs.Eof)) do
     begin
     if QContratanteBurs.FieldByName('CVE_TIPO_FIRMA').AsString = 'B' then
        vlFirmasB := vlFirmasB +1;
     QContratanteBurs.Next;
     end;
  If vlFirmasB >= 2 then
     vlbfirmasB:= True;
  QContratanteBurs.First;
  vlPosicion := 0;
  While (Not(QContratanteBurs.Eof))  and (vlPosicion <= 4)do
     begin
     If (QContratanteBurs.FieldByName('CVE_TIPO_FIRMA').AsString = 'A') or
        ((QContratanteBurs.FieldByName('CVE_TIPO_FIRMA').AsString = 'B') and
         (vlbfirmasB)) then
        begin
        vlPosicion:= vlPosicion + 1;
              QRS1.Enabled:= TRUE;
//              QRFirma1.Caption:= NomAutoriza;
//              QRFirma1.Enabled:= TRUE;
        end;


     QContratanteBurs.Next;
     end;
  QContratanteBurs.Close;
end;

procedure TReporteCttoILineAnexo.GroupHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  If qContratante.FieldByName('Cve_Contratante').AsString= 'C051' then
     ChildBand1.Enabled:= True;
end;

procedure TReporteCttoILineAnexo.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  Var
   Valor: Integer;
begin
{   Valor:= 0;
   If length(QContratante.FieldByName('Pager_Prov').AsString) > 0 then
      Valor:= QContratante.FieldByName('Pager_Prov').Asinteger;
   Case Valor of
       1:QRPagerPin.Caption:= 'DIGITEL Pin: ' + QContratante.FieldByName('Pager_Pin').AsString;
       2:QRPagerPin.Caption:= 'SKY-TEL Pin: ' + QContratante.FieldByName('Pager_Pin').AsString;
       3:QRPagerPin.Caption:= 'IUSABEEP Pin: ' + QContratante.FieldByName('Pager_Pin').AsString;
       4:QRPagerPin.Caption:= 'TEL-BEEP Pin: ' + QContratante.FieldByName('Pager_Pin').AsString;
       5:QRPagerPin.Caption:= 'TECH-TEL Pin: ' + QContratante.FieldByName('Pager_Pin').AsString;
       else
         QRPagerPin.Caption:= '';
    End; }
end;

procedure TReporteCttoILineAnexo.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{  If qContratante.FieldByName('Cve_Contratante').AsString= 'C051' then
     ChildBand1.Enabled:= True; }
end;

procedure TReporteCttoILineAnexo.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  Var
   Valor: Integer;
   vlPosicion:  Integer;
   vlFirmasB:   Integer;
   vlbfirmasB:  Boolean;
begin
   Valor:= 0;
   qrmNomCliente.Lines.Clear;
   qrmNomCliente.Lines.Add(qContratante.FieldByName('NOMBRE').AsString);
   qrmDomicilio.Lines.Clear;
   qrmDomicilio.Lines.Add(qContratante.FieldByName('DOMICILIO_CONTRATANTE').AsString);
   //If length(QContratante.FieldByName('Pager_Prov').AsString) > 0 then
   If (Trim(QContratante.FieldByName('Pager_Prov').AsString) <> 'Ninguno')
   and (Trim(QContratante.FieldByName('Pager_Prov').AsString) <> '' ) then
      Valor:= QContratante.FieldByName('Pager_Prov').Asinteger;
   Case Valor of
       1:QRPagerPin.Caption:= 'DIGITEL Pin: ' + QContratante.FieldByName('Pager_Pin').AsString;
       2:QRPagerPin.Caption:= 'SKY-TEL Pin: ' + QContratante.FieldByName('Pager_Pin').AsString;
       3:QRPagerPin.Caption:= 'IUSABEEP Pin: ' + QContratante.FieldByName('Pager_Pin').AsString;
       4:QRPagerPin.Caption:= 'TEL-BEEP Pin: ' + QContratante.FieldByName('Pager_Pin').AsString;
       5:QRPagerPin.Caption:= 'TECH-TEL Pin: ' + QContratante.FieldByName('Pager_Pin').AsString;
       else
         QRPagerPin.Caption:= '';
    End;
    If qContratante.FieldByName('Cve_Contratante').AsString= 'C051' then
       ChildBand1.Enabled:= True;

    qrmFirma1.Lines.Clear;
    qrmFirma1.Lines.Add(F1);
    qrmFirma2.Lines.Clear;
    qrmFirma2.Lines.Add(F2);
    qrmFirma3.Lines.Clear;
    qrmFirma3.Lines.Add(F3);

    Tc1.Caption := ' ';
    Tc2.Caption := ' ';
    Tc3.Caption := ' ';
    Tc4.Caption := ' ';

  If QContratante.FieldByName('Cve_Contratante').AsString = 'C001' then
     begin
     firma1.Caption := 'X';
     if QContratante.FieldByName('CVE_TIPO_FIRMA').AsString = 'A' then
        begin
        Tc1.Caption := 'X';
        Tc2.Caption := ' ';
     end;
     if QContratante.FieldByName('CVE_TIPO_FIRMA').AsString = 'B' then
        begin
        Tc1.Caption := ' ';
        Tc2.Caption := 'X';
     end;
  end;
  If QContratante.FieldByName('Cve_Contratante').AsString <> 'C001' then
     firma1.Caption := ' ';

  If QContratante.FieldByName('Cve_Contratante').AsString = 'C002' then
     begin
     firma2.Caption := 'X';
     if QContratante.FieldByName('CVE_TIPO_FIRMA').AsString = 'A' then
        begin
        Tc3.Caption := 'X';
        Tc4.Caption := ' ';
     end;
     if QContratante.FieldByName('CVE_TIPO_FIRMA').AsString = 'B' then
        begin
        Tc3.Caption := ' ';
        Tc4.Caption := 'X';
     end;
  end;
  If QContratante.FieldByName('Cve_Contratante').AsString <> 'C002' then
     firma2.Caption := ' ';

  If (QContratante.FieldByName('Cve_Contratante').AsString <> 'C001') and (QContratante.FieldByName('Cve_Contratante').AsString <> 'C002') then
     firma3.Caption := 'X'
  Else
     firma3.Caption := ' ';

  vlbfirmasB:= False;
  QContratanteBurs.ParamByName('Id_Contrato').asfloat:= ContratoRef;
  QContratanteBurs.Open;

 {Valida la existencia de firmas tipo B}
  QContratanteBurs.First;
  vlFirmasB := 0;
  While (Not(QContratanteBurs.Eof)) do
     begin
     if QContratanteBurs.FieldByName('CVE_TIPO_FIRMA').AsString = 'B' then
        vlFirmasB := vlFirmasB +1;
     QContratanteBurs.Next;
     end;
  If vlFirmasB >= 2 then
     vlbfirmasB:= True;
  QContratanteBurs.First;
  vlPosicion := 0;
  While (Not(QContratanteBurs.Eof))  and (vlPosicion <= 4)do
     begin
     If (QContratanteBurs.FieldByName('CVE_TIPO_FIRMA').AsString = 'A') or
        ((QContratanteBurs.FieldByName('CVE_TIPO_FIRMA').AsString = 'B') and
         (vlbfirmasB)) then
        begin
        vlPosicion:= vlPosicion + 1;
              QRS1.Enabled:= TRUE;
//              QRFirma1.Caption:= NomAutoriza;
//              QRFirma1.Enabled:= TRUE;
        end;


     QContratanteBurs.Next;
     end;
  QContratanteBurs.Close;
end;

end.
