unit IntMQrGarAcred;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview;

type
  TQrGarAcred = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    QRShape7: TQRShape;
    QRLabel22: TQRLabel;
    QRShape8: TQRShape;
    QRLabel24: TQRLabel;
    QRShape9: TQRShape;
    QRLabel25: TQRLabel;
    QRShape10: TQRShape;
    QRLabel27: TQRLabel;
    QRShape13: TQRShape;
    QRLabel30: TQRLabel;
    qyGarAcred: TQuery;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRChildBand1: TQRChildBand;
    qrGpoMoneda: TQRGroup;
    qrDetalle: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText6: TQRDBText;
    qyGarAcredCVE_MONEDA: TFloatField;
    qyGarAcredDESC_MONEDA: TStringField;
    qyGarAcredCVE_GARANTIA: TStringField;
    qyGarAcredDESC_GARANTIA: TStringField;
    qyGarAcredID_ACREDITADO: TFloatField;
    qyGarAcredNOMBRE: TStringField;
    qyGarAcredSIT_GARANTIA: TStringField;
    qyGarAcredID_SOLICITUD: TFloatField;
    qyGarAcredTX_COMENTARIO: TStringField;
    qyGarAcredF_REVISION_GAR: TDateTimeField;
    qyGarAcredVALOR_GARANTIA: TFloatField;
    qyGarAcredDISPUESTO: TFloatField;
    qyGarAcredDISPONIBLE: TFloatField;
    qyGarAcredIMP_GARANTIA: TFloatField;
    qyGarAcredID_DISPOSICION: TFloatField;
    qyGarAcredID_CONTRATO: TFloatField;
    qyGarAcredID_CRED_EXTERNO: TStringField;
    qyGarAcredIMP_CREDITO: TFloatField;
    qyGarAcredGARANTIZADO: TFloatField;
    qyGarAcredSIT_CREDITO: TStringField;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRShape11: TQRShape;
    QRLabel2: TQRLabel;
    QRShape12: TQRShape;
    QRLabel3: TQRLabel;
    QRShape14: TQRShape;
    QRLabel4: TQRLabel;
    QRShape15: TQRShape;
    QRLabel5: TQRLabel;
    GpoGarantia: TQRGroup;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    GpoAcred: TQRGroup;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    FooAcred: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    FooGarantia: TQRBand;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    FooMoneda: TQRBand;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    qyGarAcredVALOR_PONDERADO: TFloatField;
    SummaryBand1: TQRBand;
    procedure qyGarAcredCalcFields(DataSet: TDataSet);
    procedure qrDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FooAcredBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FooGarantiaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FooMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);


  private
  public
    Function FormaQuery(sMoneda, sCveGar, sDisposicion, sNumFira,
                        sGarantia, sSituacion,sEmpresa, sSucursal:String):String;
  end;

var
  QrGarAcred: TQrGarAcred;
  bGenArch: Boolean;
  sArchivo:String;
  F: TextFile;

Procedure RepRelGarAcred(  sMoneda, sCveGar, sDisposicion, sNumFira,
                           sGarantia, sSituacion, sNbrArch,
                           sEmpresa, sSucursal :String;
                           pAPli     : TInterApli;
                           pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepRelGarAcred(  sMoneda, sCveGar, sDisposicion, sNumFira,
                           sGarantia, sSituacion, sNbrArch,
                           sEmpresa, sSucursal :String;
                           pAPli     : TInterApli;
                           pPreview  : Boolean);
Var
   QrGarAcred: TQrGarAcred;
   VLTitulo : String;
   Preview     : TIntQRPreview;
Begin
   VLTitulo := '';
   QrGarAcred:=TQrGarAcred.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrGarAcred);
   Try
      bGenArch:= False;
      sArchivo:= sNbrArch;
      QrGarAcred.QRInterEncabezado1.Apli:=pAPli;
      QrGarAcred.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrGarAcred.QRInterEncabezado1.NomReporte:='IntMQrGarAcred';
      QrGarAcred.QRInterEncabezado1.Titulo1:='Estado de las Garantías y Disposiciones';

      QrGarAcred.qyGarAcred.DatabaseName := pApli.DataBaseName;
      QrGarAcred.qyGarAcred.SessionName := pApli.SessionName;
      QrGarAcred.qyGarAcred.Active:=False;
      QrGarAcred.qyGarAcred.SQL.Text:= QrGarAcred.FormaQuery(
           sMoneda, sCveGar, sDisposicion, sNumFira,sGarantia, sSituacion,
           sEmpresa, sSucursal);

      If (Trim(sMoneda)<>'') Then
          VLTitulo := VLTitulo + ' Por Moneda';
      If (Trim(sCveGar)<>'') Then
          VLTitulo := VLTitulo + ' Por Cve.de Garantía';
      If (Trim(sDisposicion)<>'') Then
          VLTitulo := VLTitulo + ' Por Disposición';
      If (Trim(sNumFira)<>'') Then
          VLTitulo := VLTitulo + ' Por No.FIRA';
      If (Trim(sGarantia)<>'') Then
          VLTitulo := VLTitulo + ' Por No.Garantía';
      If (Trim(sSituacion)<>'') Then
          VLTitulo := VLTitulo + ' Por Situación';

      QrGarAcred.QRInterEncabezado1.Titulo2 := VLTitulo;
      QrGarAcred.qyGarAcred.Active:=False;
      QrGarAcred.qyGarAcred.Active:=True;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrGarAcred.QRInterEncabezado1.Titulo1);
         Writeln(F, QrGarAcred.QRInterEncabezado1.Titulo2);
         Writeln(F,  #09 );
         Writeln(F,
             'Moneda' + #09#09 +
             'Tipo de Garantía' + #09#09 +
             'ID BINTER' + #09 +
             'Acreditado' + #09 +
             'Sit. Garantía' +  #09+
             'Número de Garantía' +  #09 +
             'Descripción de la Garantía'+  #09 +
             'Fecha Vto/ última revisión' +  #09 +
             'Valor' +  #09 +
             'Valor Utilizado' +#09 +
             'Valor Disponible'+ #09+
             'Valor Asignado Disposición'+ #09 +
             'Número de Autorización'+#09 +
             'Número de Disposición'+ #09 +
             'Número de Control FIRA'+ #09 +
             'Importe de la Disposición'+ #09 +
             '% Garantizado'+ #09 +
             'Sit.Disp.');
         Writeln(F, '');
      End;
      If pPreview Then
         QrGarAcred.Preview
      Else
         QrGarAcred.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrGarAcred.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrGarAcred.FormaQuery( sMoneda, sCveGar, sDisposicion, sNumFira,
                                 sGarantia, sSituacion,sEmpresa, sSucursal:String):String;
Var
    sSQL:String;
Begin
    sSQL:=
            'SELECT CR_GA_REGISTRO.CVE_MONEDA, '+
            '       MONEDA.DESC_MONEDA, '+
            '       CR_GA_GARANTIA.CVE_GARANTIA, '+
            '       CR_GA_GARANTIA.DESC_GARANTIA, '+
            '       CR_GA_REGISTRO.ID_ACREDITADO, '+
            '       PERSONA.NOMBRE, '+
            '       DECODE(CR_GA_GARANTIA.SIT_GARANTIA,''AC'',''Activa'',''IN'',''Inactiva'','''')SIT_GARANTIA, '+
            '       CR_GA_REGISTRO.ID_SOLICITUD, '+
            '       CR_GA_REGISTRO.TX_COMENTARIO, '+
            '       CR_GA_REGISTRO.F_REVISION_GAR, '+
            '       NVL(CR_GA_REGISTRO.VALOR_GARANTIA,0)VALOR_GARANTIA, '+
            '       NVL(IMPORTES.SUMA,0) DISPUESTO, '+
            '       NVL((CR_GA_REGISTRO.VALOR_PONDERADO - IMPORTES.SUMA),0) DISPONIBLE, '+
            '       CR_GA_DIS_GAR.IMP_GARANTIA, '+
            '       CR_GA_DIS_GAR.ID_DISPOSICION, '+
            '       CR_CREDITO.ID_CONTRATO, '+
            '       CR_CREDITO.ID_CRED_EXTERNO, '+
            '       CR_CREDITO.IMP_CREDITO, '+
            '       0 GARANTIZADO, '+
            '		  DECODE(CR_CREDITO.SIT_CREDITO,''NA'',''No Autorizado'',''AC'',''Activo'', '+
            '             ''CA'',''Cancelado'',''LQ'',''Liquidado'','''')SIT_CREDITO, '+
            '       NVL(CR_GA_REGISTRO.VALOR_PONDERADO,0)VALOR_PONDERADO, '+
            '      CR_PRODUCTO.ID_EMPRESA '+
            '  FROM CR_GA_REGISTRO, MONEDA, CR_GA_GARANTIA, '+
            '       (SELECT ID_REG_SOL_GAR, SUM(IMP_GARANTIA) SUMA '+
            '          FROM CR_GA_DIS_GAR '+
            '         WHERE SIT_REL_DIS_GAR =''AC'' '+
            '         GROUP BY ID_REG_SOL_GAR) IMPORTES, PERSONA, '+
            '       CR_GA_DIS_GAR,  CR_CREDITO, CR_CONTRATO, CR_PRODUCTO '+
            ' WHERE CR_GA_REGISTRO.CVE_GARANTIA = CR_GA_GARANTIA.CVE_GARANTIA '+
            '   AND CR_GA_REGISTRO.CVE_MONEDA = MONEDA.CVE_MONEDA '+
            '   AND CR_GA_REGISTRO.ID_SOLICITUD = IMPORTES.ID_REG_SOL_GAR(+) '+
            '   AND CR_GA_REGISTRO.ID_ACREDITADO = PERSONA.ID_PERSONA '+
            '   AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_DIS_GAR.ID_REG_SOL_GAR'+
            '   AND CR_GA_DIS_GAR.ID_DISPOSICION = CR_CREDITO.ID_CREDITO (+) '+
            '   AND CR_CREDITO.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO (+)'+
            '   AND CR_CREDITO.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO (+)'+
            '   AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE(+)'+
            '   AND CR_GA_REGISTRO.SIT_REG_GARANTIA=''AC'' '+
            '   AND CR_GA_DIS_GAR.SIT_REL_DIS_GAR =''AC''';


    If (Trim(sMoneda)<>'') Then
        sSQL:= sSQL + ' AND CR_GA_REGISTRO.CVE_MONEDA ='+ sMoneda;
    If (Trim(sCveGar)<>'') Then
        sSQL:= sSQL + ' AND  CR_GA_GARANTIA.CVE_GARANTIA ='''+ sCveGar +'''';
    If (Trim(sDisposicion)<>'') Then
        sSQL:= sSQL + ' AND CR_GA_DIS_GAR.ID_DISPOSICION ='+ sDisposicion;
    If (Trim(sNumFira)<>'') Then
        sSQL:= sSQL + ' AND CR_CREDITO.ID_CRED_EXTERNO ='''+ sNumFira + '''';
    If (Trim(sGarantia)<>'') Then
        sSQL:= sSQL + ' AND CR_GA_REGISTRO.ID_SOLICITUD ='+ sGarantia ;
    If (Trim(sSituacion)<>'') Then
        sSQL:= sSQL + ' AND CR_GA_GARANTIA.SIT_GARANTIA ='''+ sSituacion + '''';
    If (Trim(sEmpresa)<>'') Then
        sSQL:= sSQL + ' AND CR_PRODUCTO.ID_EMPRESA='+ Trim(sEmpresa);

    sSQL:= sSQL + ' ORDER BY MONEDA.DESC_MONEDA, CR_GA_GARANTIA.DESC_GARANTIA,'+
                  '       PERSONA.NOMBRE, CR_GA_REGISTRO.ID_SOLICITUD ';
    Result:= sSQL;
End;

procedure TQrGarAcred.qyGarAcredCalcFields(DataSet: TDataSet);
begin
   If qyGarAcredVALOR_GARANTIA.AsFloat <> 0 Then
      qyGarAcredGARANTIZADO.AsFloat:= (qyGarAcredVALOR_PONDERADO.asFloat / qyGarAcredVALOR_GARANTIA.AsFloat)*100
   Else
      qyGarAcredGARANTIZADO.AsFloat:= 0;
end;

procedure TQrGarAcred.qrDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
   sFRevGar : String;
begin

   If sArchivo <>'' Then Begin
      If qyGarAcred.FieldByName('F_REVISION_GAR').AsDateTime > 0 Then
         sFRevGar:= FormatDateTime('dd/mm/yyyy',qyGarAcred.FieldByName('F_REVISION_GAR').AsDateTime);

      Writeln(F,
                 qyGarAcred.FieldByName('CVE_MONEDA').AsString + #09 +
                 qyGarAcred.FieldByName('DESC_MONEDA').AsString + #09 +
                 qyGarAcred.FieldByName('CVE_GARANTIA').AsString + #09 +
                 qyGarAcred.FieldByName('DESC_GARANTIA').AsString + #09 +
                 qyGarAcred.FieldByName('ID_ACREDITADO').AsString + #09 +
                 qyGarAcred.FieldByName('NOMBRE').AsString + #09 +
                 qyGarAcred.FieldByName('SIT_GARANTIA').AsString + #09 +
                 qyGarAcred.FieldByName('ID_SOLICITUD').AsString + #09 +
                 qyGarAcred.FieldByName('DESC_GARANTIA').AsString + #09 +
                 sFRevGar + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyGarAcred.FieldByName('VALOR_GARANTIA').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyGarAcred.FieldByName('DISPUESTO').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyGarAcred.FieldByName('DISPONIBLE').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyGarAcred.FieldByName('IMP_GARANTIA').AsFloat) + #09 +
                 qyGarAcred.FieldByName('ID_CONTRATO').AsString + #09 +
                 qyGarAcred.FieldByName('ID_DISPOSICION').AsString + #09 +
                 qyGarAcred.FieldByName('ID_CRED_EXTERNO').AsString + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyGarAcred.FieldByName('IMP_CREDITO').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.0000',qyGarAcred.FieldByName('GARANTIZADO').AsFloat) + #09 +
                 qyGarAcred.FieldByName('SIT_CREDITO').AsString);
   End;
end;

procedure TQrGarAcred.FooAcredBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09 + 'Total Acreditado' + #09#09#09#09#09#09#09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr1.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr2.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr3.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr4.Value.dblResult)+#09+#09+#09+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr5.Value.dblResult));
   End;
end;

procedure TQrGarAcred.FooGarantiaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F,  #09#09 + 'Total Tipo de Garantía' + #09#09#09#09#09#09#09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr6.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr7.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr8.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr9.Value.dblResult)+#09+#09+#09+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr10.Value.dblResult));
   End;
end;

procedure TQrGarAcred.FooMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F,  #09#09 +'Total Moneda' + #09#09#09#09#09#09#09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr11.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr12.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr13.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr14.Value.dblResult)+#09+#09+#09+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr15.Value.dblResult));
   End;
end;

procedure TQrGarAcred.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If qyGarAcred.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

End.
