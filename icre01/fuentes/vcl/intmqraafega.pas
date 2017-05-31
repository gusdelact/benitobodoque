unit IntMQrAAFega;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview;

type
  TQrAAFega = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyGarFeg: TQuery;
    QRChildBand1: TQRChildBand;
    qrDetalle: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText18: TQRDBText;
    FooAcred: TQRBand;
    QRExpr4: TQRExpr;
    QRLabel14: TQRLabel;
    QRDBText1: TQRDBText;
    qyGarFegID_CREDITO: TFloatField;
    qyGarFegID_TITULAR: TFloatField;
    qyGarFegNOMBRE: TStringField;
    qyGarFegF_INICIO: TDateTimeField;
    qyGarFegF_VENCIMIENTO: TDateTimeField;
    qyGarFegIMP_CREDITO: TFloatField;
    qyGarFegID_CRED_EXTERNO: TStringField;
    qyGarFegSIT_CREDITO: TStringField;
    qyGarFegNUM_PERIODO: TFloatField;
    qyGarFegF_PAGO: TDateTimeField;
    qyGarFegIMP_APLICADO: TFloatField;
    qyGarFegPLAZO: TFloatField;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText17: TQRDBText;
    procedure qrDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FooAcredBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);


  private
  public
    Function FormaQuery(sFInicio,sFFin,sAcreditado,
                        sDisposicion, sCodFira, sEmpresa, sSucursal :String;
                        pAPli : TInterApli ):String;
  end;
var
  QrAAFega: TQrAAFega;
  bGenArch: Boolean;
  sArchivo:String;
  F: TextFile;

Procedure RepAplicacionGarFEGA(  sF_Inicio,sF_Fin,
                            sAcreditado,sDisposicion, sCodFira, sNbrArch,
                            sEmpresa, sSucursal :String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepAplicacionGarFEGA(    sF_Inicio,sF_Fin,
                            sAcreditado,sDisposicion, sCodFira, sNbrArch,
                            sEmpresa, sSucursal :String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
   QrAAFega: TQrAAFega;
   VLTitulo : String;
   Preview     : TIntQRPreview;
Begin
   VLTitulo := '';
   QrAAFega:=TQrAAFega.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrAAFega);
   Try
      bGenArch:= False;
      sArchivo:= sNbrArch;
      QrAAFega.QRInterEncabezado1.Apli:=pAPli;
      QrAAFega.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrAAFega.QRInterEncabezado1.NomReporte:='IntMQrAAFega';
      QrAAFega.QRInterEncabezado1.Titulo1:='Reporte de Antigüedad de Aplicación de Garantía FEGA';
      QrAAFega.QRInterEncabezado1.Titulo2:='Periodo del '+  sF_Inicio + ' al ' + sF_Fin;

      QrAAFega.qyGarFeg.Active:=False;
      QrAAFega.qyGarFeg.DatabaseName := pApli.DataBaseName;
      QrAAFega.qyGarFeg.SessionName := pApli.SessionName;
      QrAAFega.qyGarFeg.SQL.Text:= QrAAFega.FormaQuery(sF_Inicio,sF_Fin,sAcreditado,
                                                         sDisposicion, sCodFira,
                                                         sEmpresa, sSucursal, pAPli);
      QrAAFega.qyGarFeg.Active:=True;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrAAFega.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F, QrAAFega.QRInterEncabezado1.Titulo2 + #09 );
         Writeln(F,  #09 );
         Writeln(F,'Crédito' +  #09+
                   'Cliente' +  #09 +
                   'Nombre de Cliente' +  #09 +
                   'Número FIRA'+  #09 +
                   'Situación Crédito' +  #09 +
                   'Periodo' +  #09 +
                   'Fecha Vto' +#09 +
                   'Fecha Aplicación FEGA'+ #09+
                   'Importe Aplicado'+ #09 +
                   'Plazo');
         Writeln(F, '');
      End;
      If pPreview Then
          QrAAFega.Preview
      Else
          QrAAFega.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrAAFega.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrAAFega.FormaQuery(sFInicio,sFFin,
                            sAcreditado,sDisposicion, sCodFira,
                            sEmpresa, sSucursal :String;
                            pAPli     : TInterApli):String;
Var
    sSQL:String;
Begin
    sSQL:= ' SELECT CRD.ID_CREDITO,CONT.ID_TITULAR, PER.NOMBRE, CRD.F_INICIO, CRD.F_VENCIMIENTO, CRD.IMP_CREDITO, ' +
           '        CRD.ID_CRED_EXTERNO, DECODE(CRD.SIT_CREDITO,''NA'',''NO AUTORIZADA'', '+
           '                              ''AC'',''ACTIVO'', '+
           '                              ''CA'',''CANCELADA'', '+
           '                              ''LQ'',''LIQUIDADA'', '+
           '                              ''RE'',''RECHAZADA'', '+
           '                              ''AU'',''AUTORIZADA'', '+
           '                              ''NP'',''NO PROCESADO'','' '')SIT_CREDITO, ' +
           '        SOLFEG.NUM_PERIODO, SOLFEG.F_PAGO, SOLFEG.IMP_APLICADO, ' +
           '        (TO_DATE('''+DateToStr(pAPli.DameFechaEmpresaDia('D000'))+''',''DD/MM/YYYY'') - SOLFEG.F_PAGO ) AS PLAZO, ' +
           '        CR_PRODUCTO.ID_EMPRESA '+
           ' FROM CR_CREDITO CRD, CONTRATO CONT, PERSONA PER, CR_GA_SOL_FEGA SOLFEG, '+
           '      CR_CONTRATO, CR_PRODUCTO '+
           ' WHERE CRD.ID_CONTRATO = CONT.ID_CONTRATO '+
           ' AND CONT.ID_TITULAR = PER.ID_PERSONA '+
           ' AND CRD.ID_CREDITO = SOLFEG.ID_CREDITO '+
           ' AND SOLFEG.SIT_GAR_SOL_FEG = ''LQ'' '+
           ' AND CRD.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
           ' AND CRD.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
           ' AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE ';


    If (Trim(sFInicio)<>'') Then Begin
        sSQL:= sSQL + ' AND CRD.F_INICIO >= TO_DATE('''+
               FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')';

    End;
    If (Trim(sFFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CRD.F_INICIO <= TO_DATE('''+
               FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'')';

    End;
    If (Trim(sAcreditado)<>'') Then
        sSQL:= sSQL + ' AND  CONT.ID_TITULAR ='+ sAcreditado;
    If (Trim(sDisposicion)<>'') Then
        sSQL:= sSQL + ' AND SOLFEG.ID_CREDITO ='+ sDisposicion;
    If (Trim(sCodFira)<>'') Then
        sSQL:= sSQL + ' AND CRD.ID_CRED_EXTERNO ='''+sCodFira+'''';
    If (Trim(sEmpresa)<>'') Then
        sSQL:= sSQL + ' AND CR_PRODUCTO.ID_EMPRESA ='+ Trim(sEmpresa);

    sSQL:= sSQL + ' ORDER BY PER.NOMBRE, CRD.ID_CREDITO ';
    Result:= sSQL;
End;

procedure TQrAAFega.qrDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
   sFVenc, sFPago: String;
begin

   If sArchivo <>'' Then Begin
      If qyGarFeg.FieldByName('F_VENCIMIENTO').AsDateTime > 0 Then
         sFVenc:= FormatDateTime('dd/mm/yyyy',qyGarFeg.FieldByName('F_VENCIMIENTO').AsDateTime);
      If qyGarFeg.FieldByName('F_PAGO').AsDateTime > 0 Then
         sFPago:= FormatDateTime('dd/mm/yyyy',qyGarFeg.FieldByName('F_PAGO').AsDateTime);

      Writeln(F, qyGarFeg.FieldByName('ID_CREDITO').AsString + #09 +
                 qyGarFeg.FieldByName('ID_TITULAR').AsString + #09 +
                 qyGarFeg.FieldByName('NOMBRE').AsString + #09 +
                 qyGarFeg.FieldByName('ID_CRED_EXTERNO').AsString + #09 +
                 qyGarFeg.FieldByName('SIT_CREDITO').AsString + #09 +
                 qyGarFeg.FieldByName('NUM_PERIODO').AsString + #09 +
                 sFVenc + #09 +
                 sFPago + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyGarFeg.FieldByName('IMP_APLICADO').AsFloat) + #09 +
                 qyGarFeg.FieldByName('PLAZO').AsString );
   End;
end;

procedure TQrAAFega.FooAcredBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, 'Total Aplicado'+#09#09#09#09#09#09#09#09 +
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
