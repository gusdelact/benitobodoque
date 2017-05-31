unit IntMQrSegGar;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview;

type
  TQrSegGar = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyGarFeg: TQuery;
    QRChildBand1: TQRChildBand;
    qrDetalle: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    FooAcred: TQRBand;
    QRExpr4: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    QRShape8: TQRShape;
    QRLabel24: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel27: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRShape11: TQRShape;
    QRLabel2: TQRLabel;
    QRShape14: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape7: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRShape15: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText14: TQRDBText;
    QRShape16: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel12: TQRLabel;
    qyGarFegID_ACREDITADO: TFloatField;
    qyGarFegNOMBRE: TStringField;
    qyGarFegID_SOLICITUD: TFloatField;
    qyGarFegNUM_POLIZA: TStringField;
    qyGarFegID_ASEGURADORA: TFloatField;
    qyGarFegNOM_INET: TStringField;
    qyGarFegF_VENCIMIENTO: TDateTimeField;
    qyGarFegIMP_SUM_ASEG: TFloatField;
    qyGarFegTELEF_OFICINA: TStringField;
    qyGarFegTX_COMENTARIO: TStringField;
    qyGarFegCVE_FORM_PAGO: TStringField;
    qyGarFegF_ULT_PAGO: TDateTimeField;
    qyGarFegF_RENOVACION: TDateTimeField;
    qyGarFegCVE_TIPO_POL: TStringField;
    qyGarFegTX_ENDOSO_PREF: TStringField;
    qyGarFegBIEN_ASEGURADO: TStringField;
    qyGarFegF_ALTA: TDateTimeField;
    QRShape12: TQRShape;
    QRLabel7: TQRLabel;
    QRShape13: TQRShape;
    QRLabel8: TQRLabel;
    qyGarFegTX_TIPO_COBER: TMemoField;
    procedure qrDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FooAcredBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);


  private
  public
    Function FormaQuery(sFInicio,sFFin,sAcreditado,sNumPoliza, sNumGarantia :String):String;
  end;
var
  QrSegGar: TQrSegGar;
  bGenArch: Boolean;
  sArchivo:String;
  F: TextFile;

Procedure RepSeguroGar(  sF_Inicio,sF_Fin,
                            sAcreditado,sNumPoliza, sNumGarantia, sNbrArch:String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepSeguroGar(  sF_Inicio,sF_Fin,
                            sAcreditado,sNumPoliza, sNumGarantia, sNbrArch:String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
    QrSegGar: TQrSegGar;
    VLTitulo : String;
    Preview     : TIntQRPreview;
Begin
    VLTitulo := '';
    QrSegGar:=TQrSegGar.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrSegGar);
    Try
      bGenArch:= False;
      sArchivo:= sNbrArch;
      QrSegGar.QRInterEncabezado1.Apli:=pAPli;
      QrSegGar.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrSegGar.QRInterEncabezado1.NomReporte:='IntMQrSegGar';
      QrSegGar.QRInterEncabezado1.Titulo1:='Reporte de Situación de Pólizas de Seguro por Garantía';
      QrSegGar.QRInterEncabezado1.Titulo2:='Periodo del '+  sF_Inicio + ' al ' + sF_Fin;

      QrSegGar.qyGarFeg.Active:=False;
      QrSegGar.qyGarFeg.DatabaseName := pApli.DataBaseName;
      QrSegGar.qyGarFeg.SessionName := pApli.SessionName;
      QrSegGar.qyGarFeg.SQL.Text:= QrSegGar.FormaQuery(sF_Inicio,sF_Fin,sAcreditado,sNumPoliza, sNumGarantia);
      QrSegGar.qyGarFeg.Active:=True;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrSegGar.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F, QrSegGar.QRInterEncabezado1.Titulo2 + #09 );
         Writeln(F,  #09 );
         Writeln(F,'Id.Acreditado'+ #09 +
                   'Acreditado' + #09+
                   'No.  Póliza' + #09 +
                   'Aseguradora' + #09 +
                   'Fecha Inicio'+ #09 +
                   'Fecha Vencimiento' + #09 +
                   'Importe Asegurado' + #09 +
                   'Tipo de Cobertura' + #09 +
                   'Teléfono Acreditado'+ #09+
                   'No. Garantía'+ #09 +
                   'Observaciones'+ #09 +
                   'Forma de Pago'+ #09 +
                   'Fecha Ult. Pago'+ #09 +
                   'Fecha Sig. Pago'+ #09 +
                   'Tipo Póliza'+ #09 +
                   'Endoso Preferente'+ #09 +
                   'Bien asegurado');
         Writeln(F, '');
      End;
      If pPreview Then
         QrSegGar.Preview
      Else
         QrSegGar.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrSegGar.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrSegGar.FormaQuery(sFInicio,sFFin,sAcreditado,sNumPoliza, sNumGarantia :String):String;
Var
    sSQL:String;
Begin
    sSQL:= ' SELECT GAREG.ID_ACREDITADO, PER.NOMBRE, GAREG.ID_SOLICITUD, ' +
           '        GASEG.NUM_POLIZA, GASEG.ID_ASEGURADORA, INTER.NOM_INET, ' +
           '        GASEG.F_VENCIMIENTO, GASEG.IMP_SUM_ASEG, GASEG.TX_TIPO_COBER, ' +
           '        PER.TELEF_OFICINA, GASEG.TX_COMENTARIO, GASEG.CVE_FORM_PAGO, ' +
           '        GASEG.F_ULT_PAGO, GASEG.F_RENOVACION, GASEG.CVE_TIPO_POL, ' +
           '        GASEG.TX_ENDOSO_PREF,GASEG.BIEN_ASEGURADO,GASEG.F_ALTA ' +
           ' FROM CR_GA_REGISTRO GAREG, CR_GA_SEGURO GASEG, PERSONA PER, INTERMEDIARIO INTER ' +
           ' WHERE GAREG.ID_ACREDITADO = PER.ID_PERSONA ' +
           ' AND GASEG.CVE_TIPO_SEG_ORIG = ''GA'' ' +
           ' AND GAREG.ID_SOLICITUD = GASEG.ID_REFERENCIA '+
           ' AND GASEG.ID_ASEGURADORA = INTER.ID_INTERMEDIARIO ';

    If (Trim(sFInicio)<>'') Then Begin
        sSQL:= sSQL + ' AND GASEG.F_ALTA >= TO_DATE('''+
               FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')';
    End;
    If (Trim(sFFin)<>'') Then Begin
        sSQL:= sSQL + ' AND GASEG.F_ALTA <= TO_DATE('''+
               FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'')';
    End;
    If (Trim(sAcreditado)<>'') Then
        sSQL:= sSQL + ' AND  GAREG.ID_ACREDITADO ='+ sAcreditado;
    If (Trim(sNumPoliza)<>'') Then
        sSQL:= sSQL + ' AND GASEG.NUM_POLIZA ='+ sNumPoliza;
    If (Trim(sNumGarantia)<>'') Then
        sSQL:= sSQL + ' AND GAREG.ID_SOLICITUD ='+ sNumGarantia;

    sSQL:= sSQL + ' ORDER BY PER.NOMBRE,GASEG.NUM_POLIZA ' ;
    Result:= sSQL;
End;

procedure TQrSegGar.qrDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   sCober, sComent, sEndoso, sFAlta, sFVenc, sFPago, sFRenov: String;
   options       : TReplaceFlags;
begin
   If sArchivo <>'' Then Begin
      options := [rfReplaceAll];
      sCober:= StringReplace(qyGarFeg.FieldByName('TX_TIPO_COBER').AsString, #13, #32, options);
      sComent:= StringReplace(qyGarFeg.FieldByName('TX_COMENTARIO').AsString, #13, #32, options);
      sEndoso:= StringReplace(qyGarFeg.FieldByName('TX_ENDOSO_PREF').AsString, #13, #32, options);

      If qyGarFeg.FieldByName('F_VENCIMIENTO').AsDateTime > 0 Then
         sFVenc:= FormatDateTime('dd/mm/yyyy',qyGarFeg.FieldByName('F_VENCIMIENTO').AsDateTime);
      If qyGarFeg.FieldByName('F_ALTA').AsDateTime > 0 Then
         sFAlta:= FormatDateTime('dd/mm/yyyy',qyGarFeg.FieldByName('F_ALTA').AsDateTime);
      If qyGarFeg.FieldByName('F_ULT_PAGO').AsDateTime > 0 Then
         sFPago:= FormatDateTime('dd/mm/yyyy',qyGarFeg.FieldByName('F_ULT_PAGO').AsDateTime);
      If qyGarFeg.FieldByName('F_RENOVACION').AsDateTime > 0 Then
         sFRenov:= FormatDateTime('dd/mm/yyyy',qyGarFeg.FieldByName('F_RENOVACION').AsDateTime);

      Writeln(F, qyGarFeg.FieldByName('ID_ACREDITADO').AsString + #09 +
                 qyGarFeg.FieldByName('NOMBRE').AsString + #09 +
                 qyGarFeg.FieldByName('NUM_POLIZA').AsString + #09 +
                 qyGarFeg.FieldByName('NOM_INET').AsString + #09 +
                 sFAlta + #09 +
                 sFVenc + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyGarFeg.FieldByName('IMP_SUM_ASEG').AsFloat) + #09 +
                 sCober + #09 +
                 qyGarFeg.FieldByName('TELEF_OFICINA').AsString + #09 +
                 qyGarFeg.FieldByName('ID_SOLICITUD').AsString + #09 +
                 sComent + #09 +
                 qyGarFeg.FieldByName('CVE_FORM_PAGO').AsString + #09 +
                 sFPago + #09 +
                 sFRenov + #09 +
                 qyGarFeg.FieldByName('CVE_TIPO_POL').AsString + #09 +
                 sEndoso + #09 +
                 qyGarFeg.FieldByName('BIEN_ASEGURADO').AsString );
   End;
end;

procedure TQrSegGar.FooAcredBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, 'Total Asegurado'+ #09#09#09#09#09#09 +
      FormatFloat('###,###,###,###,###,##0.00',QRExpr4.Value.dblResult));
   End;
   If qyGarFeg.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

End.
